unit unAdministracionArchivosRecepcion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit;

type
  TfrmAdministracionArchivosRecepcion = class(TfrmCustomGridABM)
    edArchivo: TFilenameEdit;
    Label1: TLabel;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    FIdSolicitudAfiliacion: Integer;
    FSoloConsulta: Boolean;

    function SaveFile(const aId: Integer; const aFileName: String): Boolean;

    procedure ShowFile(const aIdArchivo: Integer; const aFileName: String);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    procedure Mostrar(const aIdSolicitudAfiliacion: Integer; const SoloConsulta: Boolean = False);
  end;

var
  frmAdministracionArchivosRecepcion: TfrmAdministracionArchivosRecepcion;

implementation

uses
  unDmPrincipal, AnsiSQL, unSesion, SqlFuncs, General, ShellAPI, CustomDlgs;

{$R *.dfm}

const
  RUTA_ARCHIVOS = '\\ntintraweb\Storage_Data\Afiliaciones\ArchivosRecepcion\';

{ TfrmAdministracionArchivosRecepcion }

function TfrmAdministracionArchivosRecepcion.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aar_archivosrecepcion';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ar_id',    sdqConsulta.FieldByName('ar_id').AsInteger, False);
    Sql.Fields.Add('ar_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ar_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('ar_id',                  -1, False);
      Sql.Fields.Add('ar_fechaalta',               SQL_DATETIME, False);
      Sql.Fields.Add('ar_idsolicitudafiliacion',   FIdSolicitudAfiliacion);
      Sql.Fields.Add('ar_nombrearchivo',           ExtractFileName(edArchivo.FileName));
      Sql.Fields.Add('ar_usualta',                 Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('ar_id',                  sdqConsulta.FieldByName('ar_id').AsInteger, False);
      Sql.Fields.Add('ar_fechamodif',              SQL_DATETIME, False);
      Sql.Fields.Add('ar_usumodif',                Sesion.UserID);
      Sql.Fields.Add('ar_nombrearchivo',           ExtractFileName(edArchivo.FileName));
    end;
  end;

  Result := inherited DoABM;

  if ModoABM = maAlta then
  begin
    sSql := 'SELECT MAX(ar_id) FROM afi.aar_archivosrecepcion';
    Result := SaveFile(ValorSqlInteger(sSql), edArchivo.FileName);
  end;

  if ModoABM = maModificacion then
    Result := SaveFile(sdqConsulta.FieldByName('ar_id').AsInteger, edArchivo.FileName);
end;

procedure TfrmAdministracionArchivosRecepcion.LoadControls;
begin
  with sdqConsulta do
  begin
    edArchivo.Text := FieldByName('ar_nombrearchivo').AsString;

    LockControl(edArchivo, False);
  end;
end;

procedure TfrmAdministracionArchivosRecepcion.Mostrar(const aIdSolicitudAfiliacion: Integer; const SoloConsulta: Boolean = False);
var
  sSql: String;
begin
  FIdSolicitudAfiliacion := aIdSolicitudAfiliacion;

  sSql :=
    'SELECT sa_nombre' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  Caption := Caption +' '+ ValorSqlEx(sSql, [aIdSolicitudAfiliacion]);

  FSoloConsulta := SoloConsulta;

  ShowModal;
end;

procedure TfrmAdministracionArchivosRecepcion.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM afi.aar_archivosrecepcion' +
    ' WHERE ar_fechabaja IS NULL' +
      ' AND ar_nombrearchivo IS NOT NULL' +
      ' AND ar_idsolicitudafiliacion = ' + SqlValue(FIdSolicitudAfiliacion);

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;

  sdqConsulta.Next;
  sdqConsulta.Prior;
end;

function TfrmAdministracionArchivosRecepcion.SaveFile(const aId: Integer; const aFileName: String): Boolean;
var
  sAmbiente: String;
  sTmp: String;
begin
  if Is_ConectadoProduccion then
    sAmbiente := 'Produccion'
  else
    sAmbiente := 'Desarrollo';

  // Crea el directorio con el id de la revisión de precio..
  sTmp := Format('%s%s\%d', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudAfiliacion]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  // Crea el directorio con el id del archivo..
  sTmp := Format('%s%s\%d\%d', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudAfiliacion, aId]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  CopyFile(PChar(aFileName), PChar(Format('%s%s\%d\%d\%s', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudAfiliacion, aId, ExtractFileName(edArchivo.FileName)])), False);
  Result := True;
end;

procedure TfrmAdministracionArchivosRecepcion.ShowFile(const aIdArchivo: Integer; const aFileName: String);
var
  sAmbiente: String;
  sTmpFileName: String;
begin
  if Is_ConectadoProduccion then
    sAmbiente := 'Produccion'
  else
    sAmbiente := 'Desarrollo';

  sTmpFileName := PChar(Format('%s%s\%d\%d\%s', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudAfiliacion, aIdArchivo, aFileName]));

  ShellExecute(Handle, 'open', PChar(sTmpFileName), nil, nil, SW_SHOWNORMAL);
end;

function TfrmAdministracionArchivosRecepcion.Validar: Boolean;
begin
  if ModoABM = maAlta then
  begin
    Verificar((edArchivo.Text = ''), edArchivo, 'Debe seleccionar un archivo.');
    Verificar(not FileExists(edArchivo.FileName), edArchivo, 'No se encuentra el archivo.');
  end;
  Result := True;
end;

procedure TfrmAdministracionArchivosRecepcion.tbPropiedadesClick(Sender: TObject);
begin
  ShowFile(sdqConsulta.FieldByName('ar_id').AsInteger, sdqConsulta.FieldByName('ar_nombrearchivo').AsString);
end;

procedure TfrmAdministracionArchivosRecepcion.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
 { with sdqConsulta do
  begin
    tbModificar.Enabled   := FieldByName('ar_fechabaja').IsNull;
    tbNuevo.Enabled       := True;
    tbPropiedades.Enabled := FieldByName('ar_fechabaja').IsNull;
  end; }

  with sdqConsulta do
  begin
    tbEliminar.Enabled    := not FSoloConsulta;
    tbModificar.Enabled   := (not FSoloConsulta) and (FieldByName('ar_fechabaja').IsNull);
    tbNuevo.Enabled       := not FSoloConsulta;
    tbPropiedades.Enabled := FieldByName('ar_fechabaja').IsNull;
  end;
end;

procedure TfrmAdministracionArchivosRecepcion.ClearControls;
begin
  inherited;
  edArchivo.Clear;
end;

procedure TfrmAdministracionArchivosRecepcion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ar_fechabaja';
end;

procedure TfrmAdministracionArchivosRecepcion.GridDblClick(Sender: TObject);
begin
  tbPropiedadesClick(nil);
end;

procedure TfrmAdministracionArchivosRecepcion.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('ar_razonadjunto').AsString = 'Cambio Estado', tbEliminar, 'No se puede dar de baja este registro');
  inherited;
end;

end.
