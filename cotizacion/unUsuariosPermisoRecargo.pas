unit unUsuariosPermisoRecargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unFraCodDesc;

type
  TfrmUsuariosPermisoRecargo = class(TfrmCustomGridABM)
    sdqConsultaCampos: TSDQuery;
    dsConsultaCampos: TDataSource;
    Label9: TLabel;
    Label1: TLabel;
    rbArt: TRadioButton;
    rbWeb: TRadioButton;
    fraUsuarioWeb: TfraCodDesc;
    fraUsuarioArt: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure rbArtClick(Sender: TObject);
    procedure rbWebClick(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmUsuariosPermisoRecargo: TfrmUsuariosPermisoRecargo;

implementation

uses
  unfraUsuarios, AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, unPropiedadesFrame, VCLExtra, General;

{$R *.dfm}

function TfrmUsuariosPermisoRecargo.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'art.aua_usuarioaumento';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ua_id',    sdqConsulta.FieldByName('ua_id').AsInteger, False);
    Sql.Fields.Add('ua_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ua_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('ua_id',    -1, False);
      Sql.Fields.Add('ua_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('ua_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('ua_id',     sdqConsulta.FieldByName('ua_id').AsInteger, False);
      Sql.Fields.Add('ua_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('ua_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('ua_fechabaja',    exNull);
    Sql.Fields.Add('ua_idusuario',    fraUsuarioArt.Value, True);
    Sql.Fields.Add('ua_idusuarioweb', fraUsuarioWeb.Value, True);
    Sql.Fields.Add('ua_usuario',      String(IIF(rbArt.Checked, fraUsuarioArt.Codigo, 'W_' + fraUsuarioWeb.Codigo)), True);
    Sql.Fields.Add('ua_usubaja',      exNull);
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosPermisoRecargo.Validar: Boolean;
var
  sSql: String;
begin
  Verificar((not rbArt.Checked) and (not rbWeb.Checked), nil, 'Debe indicar el origen.');
  Verificar((rbArt.Checked) and (fraUsuarioArt.IsEmpty), fraUsuarioArt.edCodigo, 'Debe seleccionar el usuario de la ART.');
  Verificar((rbWeb.Checked) and (fraUsuarioWeb.IsEmpty), fraUsuarioWeb.edCodigo, 'Debe seleccionar el usuario de la WEB.');

  sSql :=
    'SELECT 1' +
     ' FROM art.aua_usuarioaumento' +
    ' WHERE';

  if ModoABM = maModificacion then
    sSql := sSql + ' ua_id <>  ' + sdqConsulta.FieldByName('ua_id').AsString + ' AND ';

  if rbArt.Checked then
    sSql := sSql + ' ua_usuario = ''' + fraUsuarioArt.Codigo + '''';// +'''AND NOT(UA_IDUSUARIO IS NULL)';

  if rbWeb.Checked then
    sSql := sSql + ' ua_usuario = ''W_' + fraUsuarioWeb.Codigo + '''';// +'''AND NOT(UA_IDUSUARIOWEB IS NULL)';

  Verificar(ExisteSql(sSql), nil, 'El usuario ya existe.');

  Result := True;
end;

procedure TfrmUsuariosPermisoRecargo.ClearControls;
begin
  rbArt.Checked := True;
  fraUsuarioArt.Show;
  fraUsuarioWeb.Hide;

  fraUsuarioArt.Clear;
  fraUsuarioWeb.Clear;
end;

procedure TfrmUsuariosPermisoRecargo.LoadControls;
begin
  with sdqConsulta do
  begin
    rbArt.Checked := not FieldByName('ua_idusuario').IsNull;
    rbWeb.Checked := not FieldByName('ua_idusuarioweb').IsNull;

    if rbArt.Checked then
      fraUsuarioArt.Value := FieldByName('ua_idusuario').AsInteger
    else
      fraUsuarioWeb.Value := FieldByName('ua_idusuarioweb').AsInteger;
  end;
end;

procedure TfrmUsuariosPermisoRecargo.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT aua.*, DECODE(ua_idusuarioweb, NULL, ''ART'', ''WEB'') origen' +
     ' FROM art.aua_usuarioAumento aua' +
    ' WHERE 1 = 1';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmUsuariosPermisoRecargo.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ua_fechabaja';
end;

procedure TfrmUsuariosPermisoRecargo.rbArtClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmUsuariosPermisoRecargo.rbWebClick(Sender: TObject);
begin
  fraUsuarioArt.Clear;
  fraUsuarioWeb.Clear;

  fraUsuarioArt.Hide;
  fraUsuarioWeb.Show;
end;

end.
