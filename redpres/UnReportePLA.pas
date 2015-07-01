unit UnReportePLA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, RxCurrEdit,
  Vcl.StdCtrls, Vcl.Mask, RxToolEdit, DateComboBox, Vcl.Menus;

type
  TfrmReportePLA = class(TfrmCustomConsulta)
    sdqConsultaCUIT: TStringField;
    sdqConsultaDESCRIPCION: TStringField;
    sdqConsultaMONTO: TFloatField;
    gbFecha: TGroupBox;
    Label1: TLabel;
    dcFecDesde: TDateComboBox;
    dcFecHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    ceMonto: TCurrencyEdit;
    ShortCutControl1: TShortCutControl;
    pmImprimir: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuImprimirReporte: TMenuItem;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure mnuImprimirReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportePLA: TfrmReportePLA;

implementation

{$R *.dfm}

uses unRptInfoPLA, CustomDlgs;

procedure TfrmReportePLA.mnuImprimirGrillaClick(Sender: TObject);
begin
  QueryPrint.Title.Text := 'Reporte PLA ' + dcFecDesde.Text + ' - ' + dcFecHasta.Text;
  tbImprimirClick(nil);

end;

procedure TfrmReportePLA.mnuImprimirReporteClick(Sender: TObject);
begin
  with TfrmRptInfoPLA.Create(nil) do
    Imprimir(dcFecDesde.Date, dcFecHasta.Date, ceMonto.Value);

end;

procedure TfrmReportePLA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;

end;

procedure TfrmReportePLA.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  dcFecDesde.Clear;
  dcFecHasta.Clear;
  ceMonto.Value := 50000;

end;

procedure TfrmReportePLA.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin

  Verificar((dcFecDesde.IsEmpty) or (dcFecHasta.IsEmpty), gbFecha, 'Debe especificar un rango de fechas');

  ssql := 'SELECT ca_clave cuit, ca_descripcion descripcion, SUM(art.amebpba.get_montopagado(vo_volante)) monto' +
          '  FROM art.svo_volantes, art.cpr_prestador' +
          ' WHERE ca_identificador = vo_prestador';

  if not dcFecDesde.IsEmpty then
    ssql := ssql + ' AND vo_fechapago >= ' + dcFecDesde.SqlText;

  if not dcFecHasta.IsEmpty then
    ssql := ssql + ' AND vo_fechapago <= ' + dcFecHasta.SqlText;

  ssql := ssql + ' GROUP BY ca_clave, ca_descripcion ' +
                   ' HAVING SUM(art.amebpba.get_montopagado(vo_volante)) >= ' + CurrToStr(ceMonto.Value) +
                 ' ORDER BY SUM(art.amebpba.get_montopagado(vo_volante)) DESC';

  sdqConsulta.SQL.Text := ssql;
  inherited;

end;

end.
