unit unMonitorAlertas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls;

type
  TfrmMonitorAlertas = class(TfrmCustomConsulta)
    sdqConsultaAL_CODIGO: TStringField;
    sdqConsultaAL_DESCRIPCION: TStringField;
    sdqConsultaAL_ACTIVO: TStringField;
    sdqConsultaAL_PROGRAMACIONALTERADA: TStringField;
    sdqConsultaAL_PROXIMAEJECUCION: TDateTimeField;
    sdqConsultaAL_EJECUTARDEINMEDIATO: TStringField;
    sdqConsultaPG_IDALERTA: TFloatField;
    sdqConsultaPG_ORDEN: TFloatField;
    sdqConsultaPG_TIPOPROGRAMACION: TStringField;
    sdqConsultaPG_VALOR: TFloatField;
    sdqConsultaPG_TIPOFRECUENCIA: TStringField;
    sdqConsultaPG_FRECUENCIA: TFloatField;
    sdqConsultaPG_FRECUENCIADESDE: TFloatField;
    sdqConsultaPG_FRECUENCIAHASTA: TFloatField;
    sdqConsultaPG_PROXIMAEJECUCION: TDateTimeField;
    sdqConsultaPG_FECHAALTA: TDateTimeField;
    sdqConsultaPG_USUALTA: TStringField;
    sdqConsultaPG_FECHAMODIF: TDateTimeField;
    sdqConsultaPG_USUMODIF: TStringField;
    sdqConsultaPG_FECHABAJA: TDateTimeField;
    sdqConsultaPG_USUBAJA: TStringField;
    sdqConsultaPG_UNIDADFRECUENCIA: TStringField;
    Timer: TTimer;
    sdqConsultaAL_ID: TFloatField;
    ShortCutControlHijo: TShortCutControl;
    lblAlerta: TLabel;
    edDESCRIPCION_LIKE: TEdit;
    sdqConsultaDESCRIPCION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure RefreshData; override;
  end;

var
  frmMonitorAlertas: TfrmMonitorAlertas;

implementation

uses
  unGrids, unART, VCLExtra, UnAlertas, unFiltros;

{$R *.dfm}

procedure TfrmMonitorAlertas.FormCreate(Sender: TObject);
begin
  FSQL := sdqConsulta.SQL.Text;
  inherited;
  RefreshData;
end;

procedure TfrmMonitorAlertas.RefreshData;
var
  Id: Integer;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    Id := sdqConsulta.FieldByName('AL_ID').AsInteger
  else
    Id := -1;
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;  
  inherited RefreshData;

  if Id > -1 then
    sdqConsulta.Locate('AL_ID', Id, [])
  else
    sdqConsulta.First;
end;

procedure TfrmMonitorAlertas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
  if WindowState <> wsMaximized then
    Self.Width := GetColumnWidths(Grid, True) + 10;
end;

procedure TfrmMonitorAlertas.tbNuevoClick(Sender: TObject);
begin
  EjecutarInmediatamente(sdqConsulta.FieldByName('AL_ID').AsInteger);
end;

procedure TfrmMonitorAlertas.TimerTimer(Sender: TObject);
begin
  RefreshData;
end;

end.
