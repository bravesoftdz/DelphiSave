unit unManRetencionIngrBrutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, CurrEdit;

type
  TfrmManRetencionIngrBrutos = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    frafpProvincia: TfraCodigoDescripcion;
    Label1: TLabel;
    edfpIB_PORCCONVENIO: TCurrencyEdit;
    Label2: TLabel;
    edfpIB_RETENCION: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    edfpIB_EXENTO: TCurrencyEdit;
    Label5: TLabel;
    edfpIB_TASA: TCurrencyEdit;
    Label6: TLabel;
    edfpIB_INSCRIPCION: TEdit;
    Label7: TLabel;
    edfpIB_OBSERVACIONES: TMemo;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  public
  end;

var
  frmManRetencionIngrBrutos: TfrmManRetencionIngrBrutos;

implementation

uses
  VCLExtra, unSesion, SqlFuncs, CustomDlgs;

{$R *.dfm}

procedure TfrmManRetencionIngrBrutos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('PRORRATEO_CM') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PRORRATEO_CM')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('RET_FIJA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RET_FIJA')).Currency := True;

  if sdqConsulta.FieldByName('EXENTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('EXENTO')).Currency := True;

  if sdqConsulta.FieldByName('ALICUOTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ALICUOTA')).DisplayFormat := '% 0.00;-% 0.00';
end;

procedure TfrmManRetencionIngrBrutos.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'OIB_INGRESOSBRUTOS';

  with frafpProvincia do
    begin
      TableName   := 'CPV_PROVINCIAS';
      FieldCodigo := 'PV_CODIGO';
      FieldID     := 'PV_CODIGO';
      FieldDesc   := 'PV_DESCRIPCION';
      ShowBajas   := True;
    end;

  VCLExtra.LockControl(frafpProvincia);
end;

procedure TfrmManRetencionIngrBrutos.ClearControls;
begin
  inherited;
end;

function TfrmManRetencionIngrBrutos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.PrimaryKey.Add('IB_ID',          sdqConsulta.FieldByName('OIBID').AsInteger);
  Sql.Fields.Add('IB_PORCCONVENIO',    edfpIB_PORCCONVENIO.Value);
  Sql.Fields.Add('IB_RETENCION',       edfpIB_RETENCION.Value);
  Sql.Fields.Add('IB_EXENTO',          edfpIB_EXENTO.Value);
  Sql.Fields.Add('IB_TASA',            edfpIB_TASA.Value);
  Sql.Fields.Add('IB_INSCRIPCION',     edfpIB_INSCRIPCION.Text);
  Sql.Fields.Add('IB_OBSERVACIONES',   edfpIB_OBSERVACIONES.Lines.Text);
  Sql.Fields.Add('IB_FECHAMODIF',      exDateTime);
  Sql.Fields.Add('IB_USUMODIF',        Sesion.UserID);

  Sql.SqlType := stUpdate;

  Result := inherited DoABM;
end;

procedure TfrmManRetencionIngrBrutos.LoadControls;
begin
  inherited;

  with sdqConsulta do
    begin
      frafpProvincia.Codigo           := FieldByName('CODPROVINCIA').AsString;
      edfpIB_PORCCONVENIO.Value       := FieldByName('PRORRATEO_CM').AsFloat;
      edfpIB_RETENCION.Value          := FieldByName('RET_FIJA').AsFloat;
      edfpIB_EXENTO.Value             := FieldByName('EXENTO').AsFloat;
      edfpIB_TASA.Value               := FieldByName('ALICUOTA').AsFloat;
      edfpIB_INSCRIPCION.Text         := FieldByName('INSCRIPCION').AsString;
      edfpIB_OBSERVACIONES.Lines.Text := FieldByName('OBSERVACIONES').AsString;
    end;
end;

function TfrmManRetencionIngrBrutos.Validar: Boolean;
begin
  Verificar((edfpIB_PORCCONVENIO.Value < 0) or (edfpIB_PORCCONVENIO.Value > 100), edfpIB_PORCCONVENIO, 'El porcentaje debe estar entre 0 y 100');
  Verificar((edfpIB_TASA.Value < 0) or (edfpIB_TASA.Value > 100), edfpIB_TASA, 'El porcentaje debe estar entre 0 y 100');

  Result := True;
end;

end.

