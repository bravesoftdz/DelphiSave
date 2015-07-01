unit unAdministracionArchivosRevisionPrecio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit;

type
  TfrmAdministracionArchivosRevisionPrecio = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label3: TLabel;
    edArchivo: TFilenameEdit;
    rgVisibilidad: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    FIdSolicitudRevision: Integer;
    FSector: String;
    FSoloConsulta: Boolean;

    function SaveFile(const aId: Integer; const aFileName: String): Boolean;

    procedure ShowFile(const aIdRevision: Integer; const aFileName: String);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    procedure Mostrar(const aIdSolicitudRevision: Integer; const aSector: String);
  end;

const
  RUTA_ARCHIVOS = '\\ntintraweb\Storage_Data\Suscripciones\Revision_Precio\';

var
  frmAdministracionArchivosRevisionPrecio: TfrmAdministracionArchivosRevisionPrecio;

implementation

uses
  AnsiSql, unDmPrincipal, unSesion, SqlFuncs, General, CustomDlgs, ArchFuncs, ShellAPI, unCotizacion;

{$R *.dfm}

function TfrmAdministracionArchivosRevisionPrecio.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aah_archivosreafiliacion';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ah_id',    sdqConsulta.FieldByName('ah_id').AsInteger, False);
    Sql.Fields.Add('ah_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ah_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('ah_id',                  -1, False);
      Sql.Fields.Add('ah_fechaalta',               SQL_DATETIME, False);
      Sql.Fields.Add('ah_idsolicitudreafiliacion', FIdSolicitudRevision);
      Sql.Fields.Add('ah_nombre',                  ExtractFileName(edArchivo.FileName));
      Sql.Fields.Add('ah_sector',                  FSector);
      Sql.Fields.Add('ah_usualta',                 Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('ah_id',     sdqConsulta.FieldByName('ah_id').AsInteger, False);
      Sql.Fields.Add('ah_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('ah_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('ah_visibilidad', String(IIF((rgVisibilidad.ItemIndex = 0), 'U', 'R')));
  end;

  Result := inherited DoABM;

  if ModoABM = maAlta then
  begin
    sSql := 'SELECT MAX(ah_id) FROM afi.aah_archivosreafiliacion';
    Result := SaveFile(ValorSqlInteger(sSql), edArchivo.FileName);
  end;
end;

function TfrmAdministracionArchivosRevisionPrecio.SaveFile(const aId: Integer; const aFileName: String): Boolean;
var
  sAmbiente: String;
  sTmp: String;
begin
  if Is_ConectadoProduccion then
    sAmbiente := 'Produccion'
  else
    sAmbiente := 'Desarrollo';

  // Crea el directorio con el id de la revisión de precio..
  sTmp := Format('%s%s\%d', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudRevision]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  // Crea el directorio con el id del archivo..
  sTmp := Format('%s%s\%d\%d', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudRevision, aId]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  CopyFile(PChar(aFileName), PChar(Format('%s%s\%d\%d\%s', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudRevision, aId, ExtractFileName(edArchivo.FileName)])), False);
  Result := True;
end;

function TfrmAdministracionArchivosRevisionPrecio.Validar: Boolean;
begin
  if ModoABM = maAlta then
  begin
    Verificar((edArchivo.Text = ''), edArchivo, 'Debe seleccionar un archivo.');
    Verificar(not FileExists(edArchivo.FileName), edArchivo, 'No se encuentra el archivo.');
  end;

  Result := True;
end;


procedure TfrmAdministracionArchivosRevisionPrecio.ClearControls;
begin
  edArchivo.Clear;
  rgVisibilidad.ItemIndex := 0;

  LockControl(edArchivo, False);
end;

procedure TfrmAdministracionArchivosRevisionPrecio.LoadControls;
begin
  with sdqConsulta do
  begin
    edArchivo.Text := FieldByName('ah_nombre').AsString;
    rgVisibilidad.ItemIndex := IIF((FieldByName('ah_visibilidad').AsString = 'R'), 1, 0);

    LockControl(edArchivo, True);
  end;
end;

procedure TfrmAdministracionArchivosRevisionPrecio.Mostrar(const aIdSolicitudRevision: Integer; const aSector: String);
var
  sSql: String;
begin
  FIdSolicitudRevision := aIdSolicitudRevision;
  FSector := aSector;

  sSql :=
    'SELECT sr_nrosolicitud' +
     ' FROM asr_solicitudreafiliacion' +
    ' WHERE sr_id = :id';
  Caption := Caption + ValorSqlEx(sSql, [aIdSolicitudRevision]);

  sSql :=
    'SELECT sr_estadosolicitud' +
     ' FROM asr_solicitudreafiliacion' +
    ' WHERE sr_id = :id';
  FSoloConsulta := (ValorSqlEx(sSql, [aIdSolicitudRevision]) = EC_NOTIF_COMERCIAL);

  ShowModal;
end;

procedure TfrmAdministracionArchivosRevisionPrecio.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT afi.aah_archivosreafiliacion.*, DECODE(ah_sector, ''C'', ''Comercial'', ''Técnica'') sector, DECODE(ah_visibilidad, ''R'', ''Privada'', ''Pública'') visibilidad' +
     ' FROM afi.aah_archivosreafiliacion' +
    ' WHERE ah_idsolicitudreafiliacion = ' + SqlValue(FIdSolicitudRevision);

  if FSector = 'C' then
    sSql := sSql +
        ' AND (   (ah_sector = ''C'')' +
             ' OR (    ah_sector = ''T''' +
                 ' AND ah_visibilidad = ''U''))';

  if FSector = 'T' then
    sSql := sSql +
        ' AND (   (ah_sector = ''T'')' +
             ' OR (    ah_sector = ''C''' +
                 ' AND ah_visibilidad = ''U''))';


  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;

  sdqConsulta.Next;
  sdqConsulta.Prior;
end;

procedure TfrmAdministracionArchivosRevisionPrecio.ShowFile(const aIdRevision: Integer; const aFileName: String);
var
  sAmbiente: String;
  sTmpFileName: String;
begin
  if Is_ConectadoProduccion then
    sAmbiente := 'Produccion'
  else
    sAmbiente := 'Desarrollo';

  sTmpFileName := PChar(Format('%s%s\%d\%d\%s', [RUTA_ARCHIVOS, sAmbiente, FIdSolicitudRevision, aIdRevision, aFileName]));

  ShellExecute(Handle, 'open', PChar(sTmpFileName), nil, nil, SW_SHOWNORMAL);
end;


procedure TfrmAdministracionArchivosRevisionPrecio.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ah_fechabaja';
end;

procedure TfrmAdministracionArchivosRevisionPrecio.tbPropiedadesClick(Sender: TObject);
begin
  ShowFile(sdqConsulta.FieldByName('ah_id').AsInteger, sdqConsulta.FieldByName('ah_nombre').AsString);
end;

procedure TfrmAdministracionArchivosRevisionPrecio.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  with sdqConsulta do
  begin
    tbEliminar.Enabled    := (not FSoloConsulta) and (((FSector = 'C') and (FieldByName('ah_sector').AsString = 'C')) or
                             ((FSector = 'T') and (FieldByName('ah_sector').AsString = 'T')));
    tbModificar.Enabled   := (not FSoloConsulta) and (FieldByName('ah_fechabaja').IsNull);
    tbNuevo.Enabled       := not FSoloConsulta;
    tbPropiedades.Enabled := FieldByName('ah_fechabaja').IsNull;
  end;
end;

end.
