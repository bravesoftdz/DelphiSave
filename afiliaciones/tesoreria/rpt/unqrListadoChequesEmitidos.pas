unit unqrListadoChequesEmitidos;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, DateTimeFuncs, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,
  unQRLabelEx, Db, SDEngine, ArtQReports;

type
  TqrListadoChequesEmitidos = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    sdqDatos: TSDQuery;
    sdqMetodosPago: TSDQuery;
    bDetalle: TQRSubDetail;
    bDetalleFooter: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    bMetodosPago: TQRSubDetail;
    QRLabel14: TQRLabel;
    lbMetodoPago: TQRLabel;
    QRBand2: TQRBand;
    QRLabel13: TQRLabel;
    lbCantidadFinal: TQRLabel;
    QRLabel16: TQRLabel;
    lbMontoFinal: TQRLabel;
    QRLabelEx27: TQRLabelEx;
    QRLabelEx30: TQRLabelEx;
    QRLabelEx29: TQRLabelEx;
    QRLabelEx28: TQRLabelEx;
    QRLabelEx31: TQRLabelEx;
    QRLabelEx32: TQRLabelEx;
    QRLabelEx33: TQRLabelEx;
    QRLabelEx34: TQRLabelEx;
    QRLabelEx35: TQRLabelEx;
    QRLabelEx36: TQRLabelEx;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlTitulo: TQRSysData;
    QRLabel15: TQRLabel;
    lbMetodoPagoFijo: TQRLabel;
    QRShape2: TQRShape;
    qriLogo: TQRImage;
    procedure FormateoMoneda(sender: TObject; var Value: String);
    procedure bMetodosPagoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sdqMetodosPagoAfterScroll(DataSet: TDataSet);
    procedure bDetalleFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bDetalleAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure bDetalleFooterAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    FCountDetallesPorPagina: Integer;
    FTotalCantidad: Integer;
    FTotalMonto: Real;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Imprimir(ADate: TDateTime);
  end;

implementation

uses
  unVisualizador, unDmPrincipal, unART, unEspera, StrFuncs, Numeros;

{$R *.DFM}

{ TqrDetalleIngresosDepositos }
{------------------------------------------------------------------------------}
constructor TqrListadoChequesEmitidos.Create(AOwner: TComponent);
begin
  inherited;

  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;
{------------------------------------------------------------------------------}
procedure TqrListadoChequesEmitidos.Imprimir(ADate: TDateTime);
begin
  ReportTitle := Format(ReportTitle, [FormatDateTime('dd/mm/yyyy', ADate)]);

  sdqDatos.ParamByName('FechaCheque').AsDateTime := ADate;
  sdqMetodosPago.ParamByName('FechaCheque').AsDateTime := ADate;
  OpenQuery(sdqMetodosPago);

  Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB]);
end;
{------------------------------------------------------------------------------}
procedure TqrListadoChequesEmitidos.FormateoMoneda(Sender: TObject; var Value: String);
begin
  Value := '$' + ToStr(ToFloat(Value));
end;
{------------------------------------------------------------------------------}
procedure TqrListadoChequesEmitidos.bMetodosPagoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (FCountDetallesPorPagina > 0);
  lbMetodoPago.Caption := sdqMetodosPago.FieldByName('CE_METODOPAGO').AsString;
end;

procedure TqrListadoChequesEmitidos.sdqMetodosPagoAfterScroll(DataSet: TDataSet);
begin
  with sdqDatos do
  begin
    if Active then
      Close;
    ParamByName('MetodoPago').AsString := DataSet.FieldByName('CE_METODOPAGO').AsString;
    Open;
  end;
end;

procedure TqrListadoChequesEmitidos.bDetalleFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FTotalCantidad := FTotalCantidad + sdqMetodosPago.FieldByName('TOTAL').AsInteger;
  FTotalMonto := FTotalMonto + sdqMetodosPago.FieldByName('SUMA').AsFloat;
end;

procedure TqrListadoChequesEmitidos.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbCantidadFinal.Caption := IntToStr(FTotalCantidad);
  lbMontoFinal.Caption := '$' + ToStr(FTotalMonto);
end;

procedure TqrListadoChequesEmitidos.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FCountDetallesPorPagina := 0;
  FTotalCantidad := 0;
  FTotalMonto := 0;
end;

procedure TqrListadoChequesEmitidos.PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FCountDetallesPorPagina := 0;
  lbMetodoPagoFijo.Caption := lbMetodoPago.Caption;
end;

procedure TqrListadoChequesEmitidos.bDetalleAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Inc(FCountDetallesPorPagina);
end;

procedure TqrListadoChequesEmitidos.bDetalleFooterAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Inc(FCountDetallesPorPagina);
end;

end.
