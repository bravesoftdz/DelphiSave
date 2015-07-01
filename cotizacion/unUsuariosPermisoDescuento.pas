unit unUsuariosPermisoDescuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unFraCodDesc;

type
  TfrmUsuariosPermisoDescuento = class(TfrmCustomGridABM)
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
  frmUsuariosPermisoDescuento: TfrmUsuariosPermisoDescuento;

implementation

uses
  unfraUsuarios, AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, unPropiedadesFrame, VCLExtra, General;

{$R *.dfm}

function TfrmUsuariosPermisoDescuento.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'art.aud_usuariodescuento';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ud_id',    sdqConsulta.FieldByName('ud_id').AsInteger, False);
    Sql.Fields.Add('ud_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ud_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('ud_id',    -1, False);
      Sql.Fields.Add('ud_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('ud_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('ud_id',     sdqConsulta.FieldByName('ud_id').AsInteger, False);
      Sql.Fields.Add('ud_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('ud_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('ud_fechabaja',    exNull);
    Sql.Fields.Add('ud_idusuario',    fraUsuarioArt.Value, True);
    Sql.Fields.Add('ud_idusuarioweb', fraUsuarioWeb.Value, True);
    Sql.Fields.Add('ud_usuario',      String(IIF(rbArt.Checked, fraUsuarioArt.Codigo, 'W_' + fraUsuarioWeb.Codigo)), True);
    Sql.Fields.Add('ud_usubaja',      exNull);
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosPermisoDescuento.Validar: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM art.aud_usuariodescuento' +
    ' WHERE 1 = 1';

  if ModoABM = maModificacion then
    sSql := sSql + ' AND ud_id <> ' + SqlValue(sdqConsulta.FieldByName('ud_id').AsInteger);

  if rbArt.Checked then
    sSql := sSql + ' AND ud_usuario = ' + SqlValue(fraUsuarioArt.Codigo);

  if rbWeb.Checked then
    sSql := sSql + ' AND ud_usuario = ' + SqlValue('W_' + fraUsuarioWeb.Codigo);

  Verificar((not rbArt.Checked) and (not rbWeb.Checked), nil, 'Debe indicar el origen.');
  Verificar((rbArt.Checked) and (fraUsuarioArt.IsEmpty), fraUsuarioArt.edCodigo, 'Debe seleccionar el usuario de la ART.');
  Verificar((rbWeb.Checked) and (fraUsuarioWeb.IsEmpty), fraUsuarioWeb.edCodigo, 'Debe seleccionar el usuario de la WEB.');
  Verificar(ExisteSql(sSql), nil, 'El usuario ya existe.');

  Result := True;
end;


procedure TfrmUsuariosPermisoDescuento.ClearControls;
begin
  rbArt.Checked := True;
  fraUsuarioArt.Show;
  fraUsuarioWeb.Hide;

  fraUsuarioArt.Clear;
  fraUsuarioWeb.Clear;
end;

procedure TfrmUsuariosPermisoDescuento.LoadControls;
begin
  with sdqConsulta do
  begin
    rbArt.Checked := not FieldByName('ud_idusuario').IsNull;
    rbWeb.Checked := not FieldByName('ud_idusuarioweb').IsNull;

    if rbArt.Checked then
      fraUsuarioArt.Value := FieldByName('ud_idusuario').AsInteger
    else
      fraUsuarioWeb.Value := FieldByName('ud_idusuarioweb').AsInteger;
  end;
end;

procedure TfrmUsuariosPermisoDescuento.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT aud.*, DECODE(ud_idusuarioweb, NULL, ''ART'', ''WEB'') origen' +
     ' FROM art.aud_usuariodescuento aud' +
    ' WHERE 1 = 1';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmUsuariosPermisoDescuento.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ud_fechabaja';
end;

procedure TfrmUsuariosPermisoDescuento.rbArtClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmUsuariosPermisoDescuento.rbWebClick(Sender: TObject);
begin
  fraUsuarioArt.Clear;
  fraUsuarioWeb.Clear;

  fraUsuarioArt.Hide;
  fraUsuarioWeb.Show;
end;

end.
