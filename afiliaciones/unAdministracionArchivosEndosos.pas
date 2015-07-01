unit unAdministracionArchivosEndosos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit,
  RxToolEdit, RxPlacemnt;

type
  TfrmAdministracionArchivosEndosos = class(TfrmCustomGridABM)
    edArchivo: TFilenameEdit;
    Label1: TLabel;
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    FIdEndosoTarifario: Integer;
    FSoloConsulta: Boolean;

    procedure ShowFile(const aFileName: String);
    function GetRutaArchivo: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    function SaveFile(const aFileName: String; const aFileDest : String): Boolean;

    procedure Mostrar(const aIdEndoso: Integer);

    property RutaArchivo : String read GetRutaArchivo;
  end;

var
  frmAdministracionArchivosEndosos: TfrmAdministracionArchivosEndosos;

implementation

uses
  unDmPrincipal, AnsiSQL, unSesion, SqlFuncs, General, ShellAPI, CustomDlgs;

{$R *.dfm}

{ TfrmAdministracionArchivosRecepcion }

function TfrmAdministracionArchivosEndosos.DoABM: Boolean;
var
  sSql: String;
  Dia, Mes, Anio : Word;
  aArchivoDest, sAmbiente : String;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aae_archivosendoso';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ae_id',    sdqConsulta.FieldByName('ae_id').AsInteger, False);
    Sql.Fields.Add('ae_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ae_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      sSql := 'SELECT NVL(MAX(ae_id) + 1, 0) FROM afi.aae_archivosendoso';
      Sql.PrimaryKey.Add('ae_id',                  ValorSqlInteger(sSql));
      if Is_ConectadoProduccion then
        sAmbiente := 'Produccion'
      else
        sAmbiente := 'Desarrollo';

      DecodeDate(Now, Anio, Mes, Dia);
      aArchivoDest := Format('%s%s\%s-%s-%s_%s',
                         [frmAdministracionArchivosEndosos.RutaArchivo, sAmbiente, IntToStr(Anio), IntToStr(Mes), IntToStr(Dia), ExtractFileName(edArchivo.FileName)]);

      Sql.Fields.Add('ae_fechaalta',               SQL_DATETIME, False);
      Sql.Fields.Add('ae_idendosotarifario',       FIdEndosoTarifario);
      Sql.Fields.Add('ae_nombrearchivo',           aArchivoDest);
      Sql.Fields.Add('ae_usualta',                 Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('ae_id',                  sdqConsulta.FieldByName('ae_id').AsInteger, False);
      Sql.Fields.Add('ae_fechamodif',              SQL_DATETIME, False);
      Sql.Fields.Add('ae_usumodif',                Sesion.UserID);
      Sql.Fields.Add('ae_nombrearchivo',           ExtractFileName(edArchivo.FileName));
    end;
  end;

  Result := inherited DoABM;

  if ModoABM = maAlta then
    Result := SaveFile(edArchivo.Text, aArchivoDest);

end;

procedure TfrmAdministracionArchivosEndosos.LoadControls;
begin
  with sdqConsulta do
  begin
    edArchivo.Text := FieldByName('ae_nombrearchivo').AsString;

    LockControl(edArchivo, False);
  end;
end;

procedure TfrmAdministracionArchivosEndosos.Mostrar(const aIdEndoso: Integer);
begin
  FIdEndosoTarifario := aIdEndoso;

 // FSoloConsulta := SoloConsulta;

  ShowModal;
end;

procedure TfrmAdministracionArchivosEndosos.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM afi.aae_archivosendoso' +
    ' WHERE ae_fechabaja IS NULL' +
      ' AND ae_nombrearchivo IS NOT NULL' +
      ' AND ae_idendosotarifario = ' + SqlValue(FIdEndosoTarifario);

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;

  sdqConsulta.Next;
  sdqConsulta.Prior;
end;

function TfrmAdministracionArchivosEndosos.SaveFile(const aFileName: String; const aFileDest : String): Boolean;
var
  sAmbiente: String;
  sTmp: String;
begin
  if Is_ConectadoProduccion then
    sAmbiente := 'Produccion'
  else
    sAmbiente := 'Desarrollo';

  // Crea el directorio con el id de la revisión de precio..
  sTmp := Format('%s%s', [RutaArchivo, sAmbiente]);
  if not DirectoryExists(sTmp) then
    CreateDir(sTmp);

  CopyFile(PChar(aFileName), PChar(aFileDest), False);
  Result := True;
end;

procedure TfrmAdministracionArchivosEndosos.ShowFile(const aFileName: String);
begin
  ShellExecute(Handle, 'open', PChar(aFileName), nil, nil, SW_SHOWNORMAL);
end;

function TfrmAdministracionArchivosEndosos.Validar: Boolean;
begin
  if ModoABM = maAlta then
  begin
    Verificar((edArchivo.Text = ''), edArchivo, 'Debe seleccionar un archivo.');
    Verificar(not FileExists(edArchivo.FileName), edArchivo, 'No se encuentra el archivo.');
  end;
  Result := True;
end;

procedure TfrmAdministracionArchivosEndosos.sdqConsultaAfterScroll(DataSet: TDataSet);
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
    tbModificar.Enabled   := (not FSoloConsulta) and (FieldByName('ae_fechabaja').IsNull);
    tbNuevo.Enabled       := not FSoloConsulta;
    tbPropiedades.Enabled := FieldByName('ae_fechabaja').IsNull;
  end;
end;

procedure TfrmAdministracionArchivosEndosos.ClearControls;
begin
  inherited;
  edArchivo.Clear;
end;

procedure TfrmAdministracionArchivosEndosos.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ae_fechabaja';
end;

function TfrmAdministracionArchivosEndosos.GetRutaArchivo: String;
begin
  Result := '\\ntintraweb\Storage_Data\Afiliaciones\ArchivosEndosos\';
end;

procedure TfrmAdministracionArchivosEndosos.tbPropiedadesClick(Sender: TObject);
begin
  ShowFile(sdqConsulta.FieldByName('ae_nombrearchivo').AsString);
end;

end.
