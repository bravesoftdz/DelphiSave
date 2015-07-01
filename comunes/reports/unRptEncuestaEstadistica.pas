unit unRptEncuestaEstadistica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnRptMoldeCarta, Data.DB, SDEngine, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TqrEncuestaEstadistica = class(TqrMoldeCarta)
    dbDetalle: TQRBand;
    qrdbRespuesta: TQRDBText;
    QRGroup1: TQRGroup;
    qrdbPregunta: TQRDBText;
    qrdbCantidad: TQRDBText;
    qrdbTotal: TQRDBText;
    qrlEmpresa: TQRLabel;
    qrlEncuesta: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlDesde: TQRLabel;
    QRLabel3: TQRLabel;
    qrlHasta: TQRLabel;
    qrlCasos: TQRLabel;
    qrlPorcentaje: TQRLabel;
    qrdbOrden: TQRDBText;
    QRLabel5: TQRLabel;
    qrePagina: TQRExpr;
    QRLabel4: TQRLabel;
    qrlCeroEncuestas: TQRLabel;
    procedure dbDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure VisualizarEstadistica(AIdEncuesta: Integer; ADesde, AHasta: TDateTime; ANombreEncuesta: String);
  end;

var
  qrEncuestaEstadistica: TqrEncuestaEstadistica;

implementation

{$R *.dfm}

uses unDmPrincipal, unVisualizador, DateTimeFuncs, General;

{ TqrEncuestaEstadistica }

procedure TqrEncuestaEstadistica.dbDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPorcentaje.Caption :=  FormatFloat('#,##0.00', sdqDatos.FieldByName('PORCENTAJE').AsFloat) + '%';
  qrlCasos.Caption := iif(sdqDatos.FieldByName('CANTIDAD').AsInteger = 1, 'caso', 'casos');
end;

procedure TqrEncuestaEstadistica.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  qrbSummary.Enabled := sdqDatos.RecordCount = 0;
  dbDetalle.Enabled := sdqDatos.RecordCount > 0;
  qrlCeroEncuestas.Enabled := qrbSummary.Enabled;
end;

procedure TqrEncuestaEstadistica.VisualizarEstadistica(AIdEncuesta: Integer; ADesde, AHasta: TDateTime; ANombreEncuesta: String);
begin
  OpenQueryEx(sdqDatos, [AIdEncuesta, TDateTimeEx.Create(ADesde), TDateTimeEx.Create(AHasta)]);
  qrlEncuesta.Caption := ANombreEncuesta;
  qrlDesde.Caption := DateToStr(ADesde);
  qrlhasta.Caption := DateToStr(AHasta);
  Visualizar(qrEncuestaEstadistica, GetValores(ANombreEncuesta + ' ' + qrlDesde.Caption + '-' + qrlhasta.Caption), [oForceDB, oAlwaysShowDialog, oForceShowModal, oAutoFirma, oSinTransaccion]);
end;

end.
