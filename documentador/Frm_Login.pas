unit Frm_Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db;

type
  TLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Te_Usuario: TEdit;
    Label2: TLabel;
    Te_Clave: TEdit;
    Chk_RecordarClave: TCheckBox;
    Cmd_Cancelar: TButton;
    Cmd_Conectar: TButton;
    Label3: TLabel;
    Te_CadConexion: TEdit;
    procedure Cmd_ConectarClick(Sender: TObject);
    procedure Cmd_CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    function VerificarTablasDelSistema: boolean;
  private
  public
  end;

  function DoLogin: Boolean;

var
  Login: TLogin;

implementation

uses BaseDeDatos, Registros, Encriptacion, Frm_TabDocu;

{$R *.DFM}

procedure TLogin.Cmd_ConectarClick(Sender: TObject);
var
  Falla: boolean;
begin
  Falla := false;
  BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.Close;
  BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.Params.Clear;
  BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.Params.Add(
    'USER NAME=' + Te_Usuario.Text);
  BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.Params.Add(
    'PASSWORD=' + SELF.Te_Clave.Text);
  BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.RemoteDatabase := Te_CadConexion.Text;

  BaseDeDatos.DM_BaseDeDatos.Usuario := Te_Usuario.Text;
  try
    BaseDeDatos.DM_BaseDeDatos.BaseDeDatos.Open;
  except
    on E: EDatabaseError do
    begin
      ShowMessage('No se pudo Establecer la Conexión a Causa del Siguiente error:'
        + CHR(13) + e.Message);
      Falla := true;
    end;
  end;

  if not Falla then
  begin
    GuardarRegistro(HKEY_CURRENT_USER,
      'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Conexion', Te_CadConexion.Text);
    GuardarRegistro(HKEY_CURRENT_USER,
      'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Usuario', Te_Usuario.Text);
    if Chk_RecordarClave.Checked then
      GuardarRegistro(HKEY_CURRENT_USER,
        'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Contraseña', Encriptar(Te_Clave.Text))
    else
      GuardarRegistro(HKEY_CURRENT_USER,
        'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Contraseña', '');

    if VerificarTablasDelSistema then
      Login.ModalResult := mrOk
    else
      Login.ModalResult := mrCancel;
  end;
end;

procedure TLogin.Cmd_CancelarClick(Sender: TObject);
begin
  Login.ModalResult := mrCancel;
end;

procedure TLogin.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl as tWinControl, true, true);
    Key := #0;
  end;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  Te_Usuario.Text := ValorRegistro(HKEY_CURRENT_USER,
    'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Usuario', '');
  Te_Clave.Text := DesEncriptar(
    ValorRegistro(HKEY_CURRENT_USER, 'SOFTWARE\FireSoft\Aplicaciones\Documentador',
    'Contraseña', ''));
  Te_CadConexion.Text := ValorRegistro(HKEY_CURRENT_USER,
    'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Conexion', '');
  Chk_RecordarClave.Checked := not (Te_Clave.Text = '');

  if not (Te_CadConexion.Text = '') then
    Cmd_Conectar.SetFocus
  else if not (Te_Clave.Text = '') then
    Te_CadConexion.SetFocus
  else if not (Te_Usuario.Text = '') then
    Te_Clave.SetFocus
end;

function TLogin.VerificarTablasDelSistema: boolean;
var
  Frm_TablaDocEspecial: TFrm_TablaDocEspecial;
  TablaSistema: string;
begin
  if not (ValorRegistro(HKEY_CURRENT_USER,
    'SOFTWARE\FireSoft\Aplicaciones\Documentador\' +
    Dm_BaseDeDatos.Usuario, 'Sin Tabla de Descripciones de Objetos', 'FALSE') = 'TRUE') then
  begin
    TablaSistema := ValorRegistro(HKEY_CURRENT_USER,
      'SOFTWARE\FireSoft\Aplicaciones\Documentador\' +
      Te_Usuario.Text, 'Tabla de Descripciones de Objetos', '');
    if TablaSistema = '' then
      TablaSistema := ValorRegistro(HKEY_CURRENT_USER,
        'SOFTWARE\FireSoft\Aplicaciones\Documentador', 'Tabla de Descripciones de Objetos', '');

    if TablaSistema = '' then
    begin
      Frm_TablaDocEspecial := TFrm_TablaDocEspecial.Create(Self.Parent);
      Result := true;
      if (Frm_TablaDocEspecial.ShowModal = mrCancel) then
        if MessageBox(Self.Handle,
          pchar('¿Desea obviar esta pregunata para la proxima ves que ingrese al sistema?'),
          pchar('Tabla de Documentación del Sistema'), MB_YESNO + MB_DEFBUTTON2 +
          MB_ICONQUESTION) = idYes then
          GuardarRegistro(HKEY_CURRENT_USER,
            'SOFTWARE\FireSoft\Aplicaciones\Documentador\' +
            Dm_BaseDeDatos.Usuario, 'Sin Tabla de Descripciones de Objetos', 'TRUE')
        else
          GuardarRegistro(HKEY_CURRENT_USER,
            'SOFTWARE\FireSoft\Aplicaciones\Documentador\' +
            Dm_BaseDeDatos.Usuario, 'Sin Tabla de Descripciones de Objetos', 'FALSE');

    end
    else if ValorSql(' SELECT TABLE_NAME ' +
      ' FROM SYS.ALL_TABLES ' +
      ' WHERE OWNER = ''' + Copy(TablaSistema, 1,
      Pos('.', TablaSistema) - 1) + ''' ' +
      ' AND TABLE_NAME = ''' + Copy(TablaSistema,
      Pos('.', TablaSistema) + 1, Length(TablaSistema) - Pos('.', TablaSistema)) +
      '''') = '' then
    begin
      Frm_TablaDocEspecial := TFrm_TablaDocEspecial.Create(Self.Parent);
      Result := (Frm_TablaDocEspecial.ShowModal = mrOk);
    end
    else
      Result := true;

    Dm_BaseDeDatos.TablaComentarios :=
      ValorRegistro(HKEY_CURRENT_USER, 'SOFTWARE\FireSoft\Aplicaciones\Documentador\' +
      Te_Usuario.Text, 'Tabla de Descripciones de Objetos',
      ValorRegistro(
      HKEY_CURRENT_USER, 'SOFTWARE\FireSoft\Aplicaciones\Documentador',
      'Tabla de Descripciones de Objetos', ''));
  end
  else
    Result := true;
end;

function DoLogin: Boolean;
begin
  Login := TLogin.Create(Application);
  with Login do
    try
      ShowModal;
      Result := (ModalResult = mrOk);
    finally
      Free;
    end;
end;

end.
