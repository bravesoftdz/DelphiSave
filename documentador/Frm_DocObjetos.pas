unit Frm_DocObjetos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Db, SDEngine, Placemnt;

type
  TFrm_DocObjects = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Cmd_Salir: TButton;
    Cmd_Guardar: TButton;
    Dbc_Owner: TDBLookupComboBox;
    Dbc_Tabla: TDBLookupComboBox;
    Sdq_Owner: TSDQuery;
    Ds_Owner: TDataSource;
    Sdq_Tabla: TSDQuery;
    Ds_Tabla: TDataSource;
    Dbc_Tipo: TDBLookupComboBox;
    Sdq_Tipo: TSDQuery;
    Ds_Tipo: TDataSource;
    Label4: TLabel;
    Sdq_TipoOBJECT_TYPE: TStringField;
    Sdq_OwnerUSERNAME: TStringField;
    Sdq_TablaOBJECT_NAME: TStringField;
    FormPlacement: TFormPlacement;
    Te_Comentarios: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Dbc_TipoCloseUp(Sender: TObject);
    procedure Cmd_GuardarClick(Sender: TObject);
    procedure Dbc_TablaClick(Sender: TObject);
    procedure Cmd_SalirClick(Sender: TObject);
    procedure EditarObjeto(sTipo, sOwner, sObjeto: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmDocObjects: TFrm_DocObjects;

implementation

uses BaseDeDatos, unPrincipal;

{$R *.DFM}

procedure TFrm_DocObjects.FormShow(Sender: TObject);
begin
  Sdq_Tipo.Open;
  Sdq_Owner.Open;
    // Sdq_Tabla.Open ;
end;

procedure TFrm_DocObjects.Dbc_TipoCloseUp(Sender: TObject);
begin
  Sdq_Tabla.SQL.Clear;
  Sdq_Tabla.SQL.Add(' SELECT OBJECT_NAME ' +
    ' FROM SYS.ALL_OBJECTS ' +
    ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
    ' AND OBJECT_TYPE = ''' + Dbc_Tipo.Text + ''' ' +
    ' ORDER BY OBJECT_NAME ');
  Sdq_Tabla.Open;
end;

procedure TFrm_DocObjects.Cmd_GuardarClick(Sender: TObject);
begin
  if (Dbc_Tipo.Text = 'VIEW') or (Dbc_Tipo.Text = 'TABLE') then
    BaseDeDatos.EjecutarSql('COMMENT ON TABLE ' + Dbc_Owner.Text +
      '.' + Dbc_Tabla.Text + ' IS ''' + Te_Comentarios.Text + ''' ', true)
  else if ValorSql('SELECT 1 FROM ' + Dm_BaseDeDatos.TablaComentarios +
    ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
    ' AND OBJECT_TYPE = ''' + Dbc_Tipo.Text + ''' ' +
    ' AND OBJECT = ''' + Dbc_Tabla.Text + ''' ') = '1' then
  begin
    BaseDeDatos.EjecutarSql(' UPDATE ' + Dm_BaseDeDatos.TablaComentarios +
      ' SET COMMENTS = ''' + Te_Comentarios.Text + ''' ' +
      ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
      ' AND OBJECT = ''' + Dbc_Tabla.Text + ''' ' +
      ' AND OBJECT_TYPE = ''' + Dbc_Tipo.Text + ''' ');
  end
  else
  begin
    BaseDeDatos.EjecutarSql(' INSERT INTO ' + Dm_BaseDeDatos.TablaComentarios +
      ' (OWNER, OBJECT, OBJECT_TYPE, COMMENTS) ' +
      ' VALUES (''' + Dbc_Owner.Text + ''',  ' +
      '''' + Dbc_Tabla.Text + ''', ' +
      '''' + Dbc_Tipo.Text + ''', ' +
      '''' + Te_Comentarios.Text + ''') ');
  end;

end;

procedure TFrm_DocObjects.Dbc_TablaClick(Sender: TObject);
begin
  if (Dbc_Tipo.Text = 'VIEW') or (Dbc_Tipo.Text = 'TABLE') then
    Te_Comentarios.Text := ValorSql(' SELECT COMMENTS FROM SYS.ALL_TAB_COMMENTS ' +
      ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
      ' AND TABLE_TYPE = ''' + Dbc_Tipo.Text + ''' ' +
      ' AND TABLE_NAME = ''' +
      Dbc_Tabla.Text + ''' ')
  else
    Te_Comentarios.Text :=
      ValorSql(' SELECT COMMENTS FROM ' + Dm_BaseDeDatos.TablaComentarios +
      ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
      ' AND OBJECT_TYPE = ''' +
      Dbc_Tipo.Text + ''' ' +
      ' AND OBJECT = ''' + Dbc_Tabla.Text + ''' ')
end;

procedure TFrm_DocObjects.Cmd_SalirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_DocObjects.EditarObjeto(sTipo, sOwner, sObjeto: string);
begin
  Dbc_Tipo.KeyValue := sTipo;
  Dbc_Owner.KeyValue := sOwner;
  Dbc_TipoCloseUp(Self);

  Dbc_Tabla.KeyValue := sObjeto;
  Dbc_TablaClick(Self);

  Self.Visible := true;
end;

procedure TFrm_DocObjects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(frmPrincipal.mnuDocObjetos) then
    frmPrincipal.mnuDocObjetos.Enabled := True;
end;

end.
