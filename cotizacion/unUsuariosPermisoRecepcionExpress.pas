unit unUsuariosPermisoRecepcionExpress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario;

type
  TfrmUsuariosPermisoRecepcionExpress = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraUsuario: TfraUsuarios;
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fpAbmShow(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmUsuariosPermisoRecepcionExpress: TfrmUsuariosPermisoRecepcionExpress;

implementation

uses
  SqlFuncs, AnsiSql, unSesion, General, CustomDlgs, unDmPrincipal;

{$R *.dfm}

function TfrmUsuariosPermisoRecepcionExpress.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'afi.apv_permisorevisionexpress';

  if ModoABM = maAlta then
  begin
    iId := -1;
    Sql.SqlType := stInsert;
    Sql.Fields.Add('pv_fechaalta', SQL_DATETIME, False);
    Sql.Fields.Add('pv_usualta',   Sesion.UserID);
  end
  else
  begin
    iId := sdqConsulta.FieldByName('pv_id').AsInteger;
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('pv_fechamodif', SQL_DATETIME, False);
    Sql.Fields.Add('pv_usumodif',   Sesion.UserID);
  end;

  Sql.PrimaryKey.Add('pv_id',  iId);
  Sql.Fields.Add('pv_fechabaja', exNull);
  Sql.Fields.Add('pv_usuario',   fraUsuario.Codigo);
  Sql.Fields.Add('pv_usubaja',   exNull);

  Result := inherited DoABM;
end;

function TfrmUsuariosPermisoRecepcionExpress.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'El campo Usuario es obligatorio.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.apv_permisorevisionexpress' +
    ' WHERE pv_usuario = :usuario';
  if ModoABM = maModificacion then
    sSql := sSql + ' AND pv_id <> ' + SqlValue(sdqConsulta.FieldByName('pv_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [fraUsuario.Codigo]), fraUsuario.edCodigo, 'Ya existen datos para ese usuario.');

  Result := True;
end;


procedure TfrmUsuariosPermisoRecepcionExpress.ClearControls;
begin
  fraUsuario.Clear;
end;

procedure TfrmUsuariosPermisoRecepcionExpress.LoadControls;
begin
  fraUsuario.Value := sdqConsulta.FieldByName('se_usuario').AsString;
end;

procedure TfrmUsuariosPermisoRecepcionExpress.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT apv.*, se_nombre, se_usuario' +
     ' FROM afi.apv_permisorevisionexpress apv, use_usuarios' +
    ' WHERE pv_usuario = se_usuario';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;

procedure TfrmUsuariosPermisoRecepcionExpress.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'pv_usubaja';
  ShowActived := True;
end;

procedure TfrmUsuariosPermisoRecepcionExpress.tbEliminarClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    ModoABM := maModificacion;
    Sql.Clear;
    Sql.TableName := 'afi.apv_permisorevisionexpress';

    Sql.PrimaryKey.Add('pv_id',    sdqConsulta.FieldByName('pv_id').AsInteger, False);
    Sql.Fields.Add('pv_usubaja',   Sesion.UserID);
    Sql.Fields.Add('pv_fechabaja', SQL_DATETIME, False);

    EjecutarSql(Sql.Sql);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmUsuariosPermisoRecepcionExpress.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  tbEliminar.Enabled := not IsBaja;
end;

procedure TfrmUsuariosPermisoRecepcionExpress.fpAbmShow(Sender: TObject);
begin
  LockControl(fraUsuario, (ModoABM <> maAlta));

  if ModoABM = maAlta then
    fraUsuario.edCodigo.SetFocus;
end;

end.
