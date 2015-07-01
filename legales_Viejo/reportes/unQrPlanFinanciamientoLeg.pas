unit unQrPlanFinanciamientoLeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unQRLabelEx;

type
  TfrmQrPlanFinanciamientoLeg = class(TForm)
    qrPlanFinanciamiento: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabelEx1: TQRLabelEx;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrEmpresa1: TQRDBText;
    qrEmpresa2: TQRDBText;
    qrPlan: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    qrEmpresa3: TQRDBText;
    sdqDatos: TSDQuery;
    PageFooterBand1: TQRBand;
    qrNroPagina: TQRExpr;
    SummaryBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    qrImporteTotal: TQRExpr;
    DetailBand1: TQRBand;
    qrImporte: TQRDBText;
    qrDetalle8: TQRDBText;
    qrDetalle9: TQRDBText;
    qrDetalle1: TQRDBText;
    qrSaldo: TQRDBText;
    QRDBText1: TQRDBText;
    qrTotalMensual: TQRLabel;
    qrTotalTotalMensual: TQRLabel;
    QRShape9: TQRShape;
    qrDetalle6: TQRDBText;
    TitleBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlCantCuotas: TQRLabel;
    QRShape6: TQRShape;
    qrCuadro1: TQRLabel;
    qrCuadro2: TQRLabel;
    qrCuadro3: TQRLabel;
    qrCuadro4: TQRLabel;
    qrCuadro5: TQRLabel;
    QRLabelEx12: TQRLabelEx;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrCuadroB3: TQRLabel;
    qrCuadroB2: TQRLabel;
    qrCuadroB1: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRLabelEx3: TQRLabelEx;
    QRLabelEx6: TQRLabelEx;
    QRLabelEx7: TQRLabelEx;
    QRLabelEx8: TQRLabelEx;
    QRLabelEx9: TQRLabelEx;
    QRLabelEx2: TQRLabelEx;
    QRLabelEx10: TQRLabelEx;
    QRLabelEx11: TQRLabelEx;
    qrFechaPlan: TQRLabel;
    QRLabelEx13: TQRLabelEx;
    QRDBText2: TQRDBText;
    qriLogo: TQRImage;
    qrSaldoTotal: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure qrCuotaAmortPrint(sender: TObject; var Value: String);
    procedure qrCuotaInteresPrint(sender: TObject; var Value: String);
    procedure qrTotalMensualPrint(sender: TObject; var Value: String);
    procedure qrSaldoPrint(sender: TObject; var Value: String);
    procedure qrImportePrint(sender: TObject; var Value: String);
    procedure qrImporteTotalPrint(sender: TObject; var Value: String);
    procedure qrTotalTotalMensualPrint(sender: TObject; var Value: String);
    procedure qrTotalCuotaInteresPrint(sender: TObject; var Value: String);
    procedure qrTotalCuotaAmortPrint(sender: TObject; var Value: String);
    procedure qrDetalle1Print(sender: TObject; var Value: String);
    procedure qrPlanFinanciamientoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrNroPaginaPrint(sender: TObject; var Value: String);
    procedure qrEmpresa2Print(sender: TObject; var Value: String);
    procedure qrCuadro7Print(sender: TObject; var Value: String);
  private
    TotalMensual, CuotaInteres, CuotaAmortizada, Saldo, Importe: extended;
    Anticipo, DeudaTotal: extended;
    procedure AjustaDecimales(var Value: String);
    procedure SaveToFile(NombreArchivo: string);
  public
    procedure Preparar(IDPlanPago: string; NombreArchivo: string = '');
  end;

var
  frmQrPlanFinanciamientoLeg: TfrmQrPlanFinanciamientoLeg;

implementation

uses
  undmPrincipal, unPrincipal, unArt, unExportPDF, unComunes, StrFuncs, Numeros,
  unVisualizador;

{$R *.DFM}

procedure TfrmQrPlanFinanciamientoLeg.AjustaDecimales(var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TfrmQrPlanFinanciamientoLeg.Preparar(IDPlanPago: string; NombreArchivo: string = '');
var
  sSql: string;
begin
  sSql := 'SELECT EM_NOMBRE, EM_CUIT, CO_CONTRATO, XC_NROCUOTA, DECODE(XC_NROCUOTA, 0, NULL, XC_VENCIMIENTO) VENCIMIENTO, ' +
                 'XC_IMPORTE, XC_IDPLANPAGO, XC_SALDO, XP_ID, XP_FECHA, XP_IMPORTE, BA_NOMBRE, ' +
                 'ESPLA.TB_DESCRIPCION ESTADO, XV_IMPORTE, VA_VENCIMIENTO, ' +
                 'VA_NROCHEQUE, TVAL.TV_DESCRIPCION TIPO, VA_IMPORTE, ' +
                 'ED_NOMBRE DEUDOR, UTILES.ARMAR_SINIESTRO(RS_SINIESTRO, RS_ORDEN, 0) SINIESTRO, ' +
                 'TJ_NOMBRE TRABAJADOR ' +
            'FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES, LRS_RECUPEROSINIESTROS, RED_EMPDEUDORA, LXV_RECUPEROVALOR, ' +
                 'ZVA_VALOR, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN, ACO_CONTRATO, AEM_EMPRESA, ZBA_BANCO, ' +
                 'CTB_TABLAS ESPLA, OTV_TIPOVALOR TVAL ' +
           'WHERE CO_IDEMPRESA = EM_ID ' +
             'AND BA_ID(+) = VA_IDBANCO ' +
             'AND VA_IDTIPOVALOR = TVAL.TV_ID(+) ' +
             'AND ESPLA.TB_CLAVE(+) = ''ESPLR'' ' +
             'AND ESPLA.TB_CODIGO(+) = XP_ESTADO ' +
             'AND XV_IDVALOR = VA_ID(+) ' +
             'AND XV_IDCUOTA(+) = XC_ID ' +
             'AND XC_IDPLANPAGO = XP_ID ' +
             'AND XV_FECHABAJA IS NULL ' +
             'AND RS_ID = XP_IDRECUPEROSINIESTRO ' +
             'AND TJ_ID = EX_IDTRABAJADOR ' +
             'AND CO_CONTRATO = EX_CONTRATO ' +
             'AND EX_SINIESTRO = RS_SINIESTRO ' +
             'AND EX_ORDEN = RS_ORDEN ' +
             'AND EX_RECAIDA = 0 ' +
             'AND XP_IDEMPDEUDORA = ED_ID ' +
             'AND XP_ID = ' + IDPlanPago + ' ' +
           'ORDER BY XC_NROCUOTA';
  OpenQuery( sdqDatos, sSql );

  qrFechaPlan.Caption := sdqDatos.FieldByName('XP_FECHA').AsString;

  qrCuadro1.Caption := sdqDatos.FieldByName('XP_FECHA').AsString;
  DeudaTotal := sdqDatos.FieldByName('XP_IMPORTE').AsFloat;
  Anticipo   := sdqDatos.FieldByName('XC_IMPORTE').AsFloat;
  qrCuadro2.Caption := ToStr(DeudaTotal);
  qrCuadro3.Caption := ToStr(Anticipo);
  qrCuadro4.Caption := ToStr(DeudaTotal - Anticipo);
  qrCuadro5.Caption := ValorSql( 'SELECT (COUNT(*)-1) FROM LXC_RECUPEROCUOTA WHERE XC_IDPLANPAGO = ' + IDPlanPago, '0');

  qrCuadroB1.Caption := qrCuadro3.Caption;
  qrCuadroB2.Caption := ToStr(ValorSqlExtended( 'SELECT SUM(XC_IMPORTE) FROM LXC_RECUPEROCUOTA WHERE XC_NROCUOTA <> 0 AND XC_IDPLANPAGO = ' + IDPlanPago));
  qrCuadroB3.Caption := ToStr( ToFloat(qrCuadroB1.Caption) + ToFloat(qrCuadroB2.Caption));

  qrPlan.Caption := sdqDatos.FieldByName('ESTADO').AsString + ' Nº ' + sdqDatos.FieldByName('XP_ID').AsString;
  qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );

  //Reseteo los contadores
  TotalMensual := 0;
  CuotaInteres := 0;
  CuotaAmortizada := 0;
  Saldo := 0;
  Importe := 0;

  sdqDatos.First;

  if NombreArchivo = '' then
    Visualizar(qrPlanFinanciamiento, GetValores('Plan de Financiamiento'), [oForceShowModal])
  else
    SaveToFile( NombreArchivo );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrCuotaAmortPrint(sender: TObject; var Value: String);
begin
  CuotaAmortizada := CuotaAmortizada + ToFloat( Value );
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrCuotaInteresPrint(sender: TObject; var Value: String);
begin
  CuotaInteres := CuotaInteres + ToFloat( Value );
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrTotalMensualPrint(sender: TObject; var Value: String);
var
  Valor: extended;
begin
  Valor := sdqDatos.FieldByName('XC_IMPORTE').AsFloat;
  TotalMensual := TotalMensual + Valor;
  Value := ToStr ( Valor );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrSaldoPrint(sender: TObject; var Value: String);
begin
  Saldo := Saldo + ToFloat( Value );
  AjustaDecimales ( Value );
  qrSaldoTotal.Caption := Value;
end;

procedure TfrmQrPlanFinanciamientoLeg.qrImportePrint(sender: TObject; var Value: String);
begin
  Importe := Importe + ToFloat( Value );
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrImporteTotalPrint(sender: TObject; var Value: String);
begin
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrTotalTotalMensualPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( TotalMensual );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrTotalCuotaInteresPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( CuotaInteres );
end;

procedure TfrmQrPlanFinanciamientoLeg.qrTotalCuotaAmortPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( CuotaAmortizada - Anticipo);
end;

procedure TfrmQrPlanFinanciamientoLeg.qrDetalle1Print(sender: TObject; var Value: String);
begin
  if Value = '0' then
    Value := 'Anticipo';
end;

procedure TfrmQrPlanFinanciamientoLeg.qrPlanFinanciamientoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  //Reseteo los contadores
  TotalMensual := 0;
  CuotaInteres := 0;
  CuotaAmortizada := 0;
  Saldo := 0;
  Importe := 0;
end;

procedure TfrmQrPlanFinanciamientoLeg.qrNroPaginaPrint(sender: TObject; var Value: String);
begin
  Value := 'Pág.: ' + Value;
end;

procedure TfrmQrPlanFinanciamientoLeg.qrEmpresa2Print(sender: TObject; var Value: String);
begin
  Value := Copy(Value, 1, 2) + '-' + Copy( Value, 3,8 ) + '-' + Copy(Value, 11,1);
end;

procedure TfrmQrPlanFinanciamientoLeg.qrCuadro7Print(sender: TObject; var Value: String);
begin
  Value := Value + ' %';
end;

procedure TfrmQrPlanFinanciamientoLeg.SaveToFile(NombreArchivo: string);
begin
  ExportarPDF(qrPlanFinanciamiento, NombreArchivo);
end;

end.

