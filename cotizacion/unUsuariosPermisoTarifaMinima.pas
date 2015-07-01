unit unUsuariosPermisoTarifaMinima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unFraCodDesc;

type
  TfrmUsuariosPermisoTarifaMinima = class(TfrmCustomGridABM)
    sdqConsultaCampos: TSDQuery;
    dsConsultaCampos: TDataSource;
    Label9: TLabel;
    fraUsuario: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure rbArtClick(Sender: TObject);
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
  frmUsuariosPermisoTarifaMinima: TfrmUsuariosPermisoTarifaMinima;

implementation

uses
  unfraUsuarios, AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, unPropiedadesFrame, VCLExtra, General;

{$R *.dfm}

function TfrmUsuariosPermisoTarifaMinima.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'art.aum_usuariotarifaminima';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('um_id',    sdqConsulta.FieldByName('um_id').AsInteger, False);
    Sql.Fields.Add('um_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('um_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('um_id',    -1, False);
      Sql.Fields.Add('um_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('um_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('um_id',     sdqConsulta.FieldByName('um_id').AsInteger, False);
      Sql.Fields.Add('um_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('um_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('um_fechabaja', exNull);
    Sql.Fields.Add('um_usuario',   fraUsuario.Codigo);
    Sql.Fields.Add('um_usubaja',   exNull);
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosPermisoTarifaMinima.Validar: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM art.aum_usuariotarifaminima' +
    ' WHERE 1 = 1' +
      ' AND um_fechabaja IS NULL' +
      ' AND um_usuario = ' + SqlValue(fraUsuario.Codigo);

  if ModoABM = maModificacion then
    sSql := sSql + ' AND um_id <> ' + SqlValue(sdqConsulta.FieldByName('um_id').AsInteger);

  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Debe seleccionar el usuario de la ART.');
  Verificar(ExisteSql(sSql), nil, 'El usuario ya existe.');

  Result := True;
end;


procedure TfrmUsuariosPermisoTarifaMinima.ClearControls;
begin
  fraUsuario.Clear;
end;

procedure TfrmUsuariosPermisoTarifaMinima.LoadControls;
begin
  fraUsuario.Codigo := sdqConsulta.FieldByName('um_usuario').AsString;
end;

procedure TfrmUsuariosPermisoTarifaMinima.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM art.aum_usuariotarifaminima' +
    ' WHERE 1 = 1';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmUsuariosPermisoTarifaMinima.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'um_fechabaja';
end;

procedure TfrmUsuariosPermisoTarifaMinima.rbArtClick(Sender: TObject);
begin
  ClearControls;
end;

end.
