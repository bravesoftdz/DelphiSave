unit Frm_DocumTabla;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, Placemnt, SQLOracle;

type
  TFrm_DocTabla = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Sdq_Owner: TSDQuery;
    Ds_Owner: TDataSource;
    Sdq_Tabla: TSDQuery;
    Ds_Tabla: TDataSource;
    Panel2: TPanel;
    Label3: TLabel;
    Te_DescripcionTabla: TEdit;
    Panel3: TPanel;
    Sdq_Campos: TSDQuery;
    Ds_Campos: TDataSource;
    Dbc_Owner: TDBLookupComboBox;
    Dbc_Tabla: TDBLookupComboBox;
    SG_Campos: TStringGrid;
    Panel4: TPanel;
    pnlBotonera: TPanel;
    Cmd_Salir: TButton;
    Cmd_Guardar: TButton;
    FormPlacement1: TFormPlacement;
    Sdq_OwnerUSERNAME: TStringField;
    Sdq_TablaTABLE_NAME: TStringField;
    Sdq_CamposCOLUMN_NAME: TStringField;
    Sdq_CamposCOMMENTS: TStringField;
    procedure Cmd_SalirClick(Sender: TObject);
    procedure Dbc_OwnerCloseUp(Sender: TObject);
    procedure Dbc_TablaCloseUp(Sender: TObject);
    procedure Sdq_CamposAfterOpen(DataSet: TDataSet);
    procedure Cmd_GuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    procedure Documentar(Tabla: string; Owner: string = '');
  end;

var
  frmDocTabla: TFrm_DocTabla;

implementation

uses BaseDeDatos, unPrincipal;

{$R *.DFM}

procedure TFrm_DocTabla.Cmd_SalirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_DocTabla.Dbc_OwnerCloseUp(Sender: TObject);
begin
  Sdq_Tabla.Close;
  Sdq_Tabla.ParamByName('OWNER').Value := Dbc_Owner.Text;
  Sdq_Tabla.Open

//     Self.Sdq_Campos.ParamByName('Owner').Value := Dbc_Owner.Text;
//     Self.Sdq_Campos.ParamByName('Tabla').Value := Dbc_Tabla.Text ;
end;

procedure TFrm_DocTabla.Dbc_TablaCloseUp(Sender: TObject);
begin
  Sdq_Campos.Close;
  Sdq_Campos.ParamByName('OWNER').Value := Dbc_Owner.Text;
  Sdq_Campos.ParamByName('Tabla').Value := Dbc_Tabla.Text;
  Sdq_Campos.Open;

  Te_DescripcionTabla.Text := ValorSql('SELECT COMMENTS FROM SYS.ALL_TAB_COMMENTS ' +
    'WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
    'AND TABLE_NAME = ''' +
    Dbc_Tabla.Text + '''');

end;

procedure TFrm_DocTabla.Documentar(Tabla: string; Owner: string = '');
begin
  if not (Owner = '') then
    Dbc_owner.KeyValue := Owner;
  Dbc_OwnerCloseUp(Self);

  Dbc_Tabla.KeyValue := Tabla;
  Dbc_TablaCloseUp(Self);
  self.Visible := true;

end;

procedure TFrm_DocTabla.Sdq_CamposAfterOpen(DataSet: TDataSet);
begin
  LockWindowUpdate(Self.Handle);
  Sg_Campos.RowCount := 0;
  Sg_Campos.Cells[0, 0] := 'Campo';
  Sg_Campos.Cells[1, 0] := 'Descripción / Comentario';
  while not Sdq_Campos.EOF do
  begin
    Sg_Campos.RowCount := Sg_Campos.RowCount + 1;
    Sg_Campos.Row := Sg_Campos.Row + 1;
    Sg_Campos.Cells[0, Sg_Campos.Row] := self.Sdq_CamposCOLUMN_NAME.AsString;
    Sg_Campos.Cells[1, Sg_Campos.Row] := self.Sdq_CamposCOMMENTS.AsString;
    Sdq_Campos.Next;
  end;
  Sg_Campos.FixedRows := 1;
  Sg_Campos.Row := 1;
  LockWindowUpdate(0);
//     Sg_Campos. .Cols[0].ReadOnly := False;

end;

procedure TFrm_DocTabla.Cmd_GuardarClick(Sender: TObject);
var
  i: integer;
begin
  LockWindowUpdate(Self.Handle);
  try
    EjecutarSqlST('COMMENT ON TABLE ' + Dbc_Owner.Text + '.' +
      Dbc_Tabla.Text + ' IS ''' + SqlString(Te_DescripcionTabla.Text) + '''', tmBegin);
    for i := 1 to SG_Campos.RowCount - 1 do
      EjecutarSqlST('COMMENT ON COLUMN  ' + Dbc_Owner.Text +
        '.' + Dbc_Tabla.Text + '.' + SG_Campos.Cells[0, i] + ' IS ''' +
        SqlString(SG_Campos.Cells[1, i]) + '''');

    EjecutarSqlST('', tmEnd);
  except
    on E: Exception do
    begin
      EjecutarSqlST('', tmRollBack);
      ShowMessage(E.Message);
    end;
  end;
  LockWindowUpdate(0);
end;

procedure TFrm_DocTabla.FormShow(Sender: TObject);
begin
  Sdq_Owner.Open;
  Sdq_Tabla.Open;
end;

procedure TFrm_DocTabla.FormResize(Sender: TObject);
begin
  SG_Campos.ColWidths[1] := Width - (SG_Campos.ColWidths[0] + 4);
end;

procedure TFrm_DocTabla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(frmPrincipal.mnuDocTablas) then
    frmPrincipal.mnuDocTablas.Enabled := True;
end;

end.
