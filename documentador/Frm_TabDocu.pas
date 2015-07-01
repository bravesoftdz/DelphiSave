unit Frm_TabDocu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Db, SDEngine;

type
  TFrm_TablaDocEspecial = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Cmd_Crear: TButton;
    Ds_Owner: TDataSource;
    Sdq_Owner: TSDQuery;
    Dbc_Owner: TDBLookupComboBox;
    Label4: TLabel;
    Cmd_Aceptar: TButton;
    Cmd_Cancelar: TButton;
    Image1: TImage;
    Te_Nombre: TEdit;
    Sdq_OwnerUSERNAME: TStringField;
    procedure Cmd_CrearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cmd_AceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_TablaDocEspecial: TFrm_TablaDocEspecial;

implementation

uses BaseDeDatos, Registros;

{$R *.DFM}

procedure TFrm_TablaDocEspecial.Cmd_CrearClick(Sender: TObject);
var
  CrearTabla: boolean;
begin
  CrearTabla := true;
  if (Te_Nombre.Text = '') or (Dbc_Owner.Text = '') then
  begin
    MessageBox(Self.Handle, pchar(
      'Debe especificar el nombre de la tabla y el Dueño'), pchar('Faltan Valores'),
      MB_ICONEXCLAMATION);
    CrearTabla := false;
  end
  else if ValorSql(' SELECT 1 ' +
    ' FROM SYS.ALL_TABLES ' +
    ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
    ' AND TABLE_NAME = ''' + Te_Nombre.Text + ''' ') = '1' then
    if MessageBox(
      Self.Handle, pchar('La Tabla Seleccionada existe en la Base de Datos. Si la sobreescribe perderá todos los datos cargados anteriormente.' + Chr(13) + ' ¿Desea Sobreescribirla?'),
      pchar('Crear Tabla'),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idNo then
      CrearTabla := false
    else
    begin
      EjecutarSql(' DROP TABLE ' + Dbc_Owner.Text +
        '.' + Te_Nombre.Text, true);
      CrearTabla := true;
    end;

  if CrearTabla then
  begin
    EjecutarSql('CREATE TABLE ' + Dbc_Owner.Text + '.' + Te_Nombre.Text + ' ' +
      '(OWNER       VARCHAR2(30) NOT NULL, ' +
      ' OBJECT      VARCHAR2(30) NOT NULL, ' +
      ' OBJECT_TYPE VARCHAR2(12) NOT NULL, ' +
      ' COMMENTS    VARCHAR2(2000), ' +
      ' CONSTRAINT PK_' + Te_Nombre.Text +
      ' PRIMARY KEY (OWNER, OBJECT, OBJECT_TYPE) )', true);

    EjecutarSql('COMMENT ON TABLE ' + Dbc_Owner.Text + '.' +
      Te_Nombre.Text + ' IS ''Comments on Objects''', true);
    EjecutarSql('COMMENT ON COLUMN ' + Dbc_Owner.Text + '.' +
      Te_Nombre.Text + '.OBJECT IS ''Name of the object''', true);
    EjecutarSql('COMMENT ON COLUMN ' + Dbc_Owner.Text + '.' +
      Te_Nombre.Text + '.OBJECT_TYPE IS ''Type of the object''', true);
    EjecutarSql('COMMENT ON COLUMN ' + Dbc_Owner.Text + '.' +
      Te_Nombre.Text + '.OWNER IS ''Owner of the object''', true);
    EjecutarSql('COMMENT ON COLUMN ' + Dbc_Owner.Text + '.' +
      Te_Nombre.Text + '.COMMENTS IS ''Comment on the object''', true);
  end;
end;

procedure TFrm_TablaDocEspecial.FormCreate(Sender: TObject);
begin
  Sdq_Owner.Open;
end;

procedure TFrm_TablaDocEspecial.Cmd_AceptarClick(Sender: TObject);
begin
  if Te_Nombre.Text = '' then
    MessageBox(Self.Handle, pchar('Debe especificar el nombre de la tabla'),
      pchar('Faltan Valores'), MB_ICONEXCLAMATION)
  else if Te_Nombre.Text = ValorSql(' SELECT TABLE_NAME ' +
    ' FROM SYS.ALL_TABLES ' +
    ' WHERE OWNER = ''' + Dbc_Owner.Text + ''' ' +
    ' AND TABLE_NAME = ''' + Te_Nombre.Text + ''' ') then
  begin
    GuardarRegistro(HKEY_CURRENT_USER,
      'SOFTWARE\FireSoft\Aplicaciones\Documentador\' +
      Dm_BaseDeDatos.Usuario, 'Tabla de Descripciones de Objetos',
      Dbc_Owner.Text + '.' + Te_Nombre.Text);
    Self.ModalResult := mrOk;
  end
  else
    MessageBox(Self.Handle, pchar(
      'Debe Crear la Tabla para Guardar los Valores de la Configuración'),
      pchar('Tabla Inexistente'), MB_ICONEXCLAMATION);
end;

procedure TFrm_TablaDocEspecial.FormShow(Sender: TObject);
begin
  Dbc_Owner.KeyValue := DM_BaseDeDatos.Usuario;
end;

end.
