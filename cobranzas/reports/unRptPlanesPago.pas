unit unRptPlanesPago;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrPlanesPago = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qriLogo: TQRImage;
    sdqDatos: TSDQuery;
    qrlTitulo: TQRLabel;
    qrlDocumento: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrdbContr: TQRDBText;
    qrdbCuit: TQRDBText;
    qrdbDen: TQRDBText;
    qrdbFecha: TQRDBText;
    qrdbCuotaNominal: TQRDBText;
    qrdbIntFinanc: TQRDBText;
    qrdbDescIntMora: TQRDBText;
    qrdbDescIntFinanc: TQRDBText;
    qrdbAutoriza: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    SummaryBand1: TQRBand;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel9: TQRLabel;
    qrdbIntMora: TQRDBText;
    qreCuotaNominal: TQRExpr;
    qreIntMora: TQRExpr;
    QRShape20: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel10: TQRLabel;
    qrdbEst: TQRDBText;
    qreIntFinanc: TQRExpr;
    qreDescIntMora: TQRExpr;
    QRShape21: TQRShape;
    QRLabel11: TQRLabel;
    QRShape22: TQRShape;
    qrdbCuotas: TQRDBText;
    PageFooterBand1: TQRBand;
    qrNroPagina: TQRExpr;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel12: TQRLabel;
    qrdbObs: TQRDBText;
    QRShape25: TQRShape;
    QRLabel13: TQRLabel;
    QRShape26: TQRShape;
    QRDBText1: TQRDBText;
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure FormatMontoPorc(Sender: TObject; var Value: String);
    procedure qrNroPaginaPrint(sender: TObject; var Value: String);
  private
  public
  end;

  procedure Do_ImprimirPlanesPago(FechaDesde, FechaHasta: TDateTime; Sql: String);

var
  qrPlanesPago: TqrPlanesPago;

implementation

uses
  unDmPrincipal, unVisualizador, StrFuncs;

{$R *.DFM}

procedure Do_ImprimirPlanesPago(FechaDesde, FechaHasta: TDateTime; Sql: String);
var
  rpt: TqrPlanesPago;
begin
  rpt := TqrPlanesPago.Create(nil);
  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
      qrlTitulo.Caption := 'Planes de Pago - ' + DateToStr(FechaDesde) + ' al ' + DateToStr(FechaHasta);

      OpenQuery(sdqDatos, Sql);

      Visualizar(rpt, GetValores(), [oForceShowModal]);
    finally
      Free;
    end;
end;

procedure TqrPlanesPago.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TqrPlanesPago.FormatMontoPorc(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 0);
end;

procedure TqrPlanesPago.qrNroPaginaPrint(sender: TObject; var Value: String);
begin
  Value := 'Pág.: ' + Value;
end;

end.

