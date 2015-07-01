unit unQrPlanFinanciamiento;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   10-09-2003
 ULTIMA MODIFICACION: 13-11-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unQRLabelEx;

type
  TfrmQrPlanFinanciamiento = class(TForm)
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
    QRLabel1: TQRLabel;
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
    qrCuotaAmort: TQRDBText;
    qrCuotaInteres: TQRDBText;
    qrSaldo: TQRDBText;
    QRDBText1: TQRDBText;
    qrTotalMensual: TQRLabel;
    qrTotalTotalMensual: TQRLabel;
    QRShape9: TQRShape;
    qrSaldoTotal: TQRLabel;
    qrDetalle6: TQRDBText;
    qrTotalCuotaInteres: TQRLabel;
    qrTotalCuotaAmort: TQRLabel;
    TitleBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlCantCuotas: TQRLabel;
    qrlImporteCuota: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape6: TQRShape;
    qrCuadro1: TQRLabel;
    qrCuadro2: TQRLabel;
    qrCuadro3: TQRLabel;
    qrCuadro4: TQRLabel;
    qrCuadro5: TQRLabel;
    qrCuadro6: TQRLabel;
    qrCuadro7: TQRLabel;
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
    QRLabelEx4: TQRLabelEx;
    QRLabelEx5: TQRLabelEx;
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
    ImporteCuotaMensual, Anticipo, DeudaTotal: extended;
    procedure AjustaDecimales(var Value: String);
    procedure SaveToFile( NombreArchivo: string );
  public
    procedure Preparar( IDPlanPago: string; NombreArchivo: string = '' );
  end;

var
  frmQrPlanFinanciamiento: TfrmQrPlanFinanciamiento;

implementation
Uses
  undmPrincipal, unPrincipal, unArt, unExportPDF, unComunes, StrFuncs, Numeros,
  unVisualizador;
{$R *.DFM}

procedure TfrmQrPlanFinanciamiento.AjustaDecimales(var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TfrmQrPlanFinanciamiento.Preparar( IDPlanPago: string; NombreArchivo: string = '' );
var
  sSql: string;
begin
  sSql := 'SELECT EM_NOMBRE, EM_CUIT, CO_CONTRATO, PC_NROCUOTA, DECODE(PC_NROCUOTA, 0, AMEBPBA.CALCDIASHABILES(PP_FECHA, 3), PC_VENCIMIENTO) VENCIMIENTO, PC_AMORTIZACION, PC_INTERESFINANC,PC_IDPLANPAGO,' +
          '       PC_SALDO, PP_ID, PP_FECHA, PP_GASTOADMINISTRATIVO, PP_DEUDATOTAL, PP_PORCDESCINTERES, BA_NOMBRE, ESTADO,' +
          '       PP_MONTODESCINTERES, PP_TASAINTERESMENSUAL, PV_IMPORTE, VA_VENCIMIENTO, VA_NROCHEQUE, TIPO, VA_IMPORTE,' +
          '       DESCR_TIPOCUOTA' +
          '  FROM (SELECT EM_NOMBRE, EM_CUIT, CO_CONTRATO, PC_NROCUOTA, PC_VENCIMIENTO, PC_AMORTIZACION, PC_INTERESFINANC,PC_IDPLANPAGO,' +
          '               PC_SALDO, PP_ID, PP_FECHA, PP_GASTOADMINISTRATIVO, PP_DEUDATOTAL, PP_PORCDESCINTERES, BA_NOMBRE,' +
          '               ESPLA.TB_DESCRIPCION ESTADO, PP_MONTODESCINTERES, PP_TASAINTERESMENSUAL, PV_IMPORTE, VA_VENCIMIENTO,' +
          '               VA_NROCHEQUE, TVAL.TV_DESCRIPCION TIPO, VA_IMPORTE, TCUOTA.TB_DESCRIPCION DESCR_TIPOCUOTA' +
          '          FROM ZPV_PLANVALOR, ZVA_VALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO, ACO_CONTRATO, AEM_EMPRESA, ZBA_BANCO, CTB_TABLAS ESPLA,' +
          '               CTB_TABLAS TCUOTA, OTV_TIPOVALOR TVAL' +
          '         WHERE PP_CONTRATO = CO_CONTRATO' +
          '           AND CO_IDEMPRESA = EM_ID' +
          '           AND BA_ID (+)= VA_IDBANCO' +
          '           AND VA_IDTIPOVALOR=TVAL.TV_ID(+)' +
          '           AND ESPLA.TB_CLAVE (+)= ''ESPLA''' +
          '           AND ESPLA.TB_CODIGO (+)= PP_ESTADO' +
          '           AND TCUOTA.TB_CLAVE (+)= ''TCUOT''' +
          '           AND TCUOTA.TB_CODIGO (+)= PP_TIPOCUOTA' +
          '           AND PV_IDVALOR = VA_ID(+)' +
          '           AND PV_IDPLANCUOTA(+) = PC_ID' +
          '           AND PC_IDPLANPAGO = PP_ID' +
          '           AND PV_FECHABAJA IS NULL' +
          '           AND PP_ID = ' + IDPlanPago + '' +
          '        UNION ALL' +
          '        SELECT EM_NOMBRE, EM_CUIT, CO_CONTRATO, PC_NROCUOTA, PC_VENCIMIENTO, PC_AMORTIZACION, PC_INTERESFINANC,PC_IDPLANPAGO,' +
          '               PC_SALDO, PP_ID, PP_FECHA, PP_GASTOADMINISTRATIVO, PP_DEUDATOTAL, PP_PORCDESCINTERES,' +
          '               NULL BA_NOMBRE, ESPLA.TB_DESCRIPCION ESTADO, PP_MONTODESCINTERES, PP_TASAINTERESMENSUAL, ' +
          '               PV_IMPORTE, TO_DATE(NULL) VA_VENCIMIENTO, NULL VA_NROCHEQUE, ''REMESA'' TIPO, PV_IMPORTE VA_IMPORTE,' +
          '               TCUOTA.TB_DESCRIPCION DESCR_TIPOCUOTA' +
          '          FROM ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO, ACO_CONTRATO, AEM_EMPRESA, CTB_TABLAS ESPLA, CTB_TABLAS TCUOTA' +
          '         WHERE PP_CONTRATO = CO_CONTRATO' +
          '           AND CO_IDEMPRESA = EM_ID' +
          '           AND PC_IDPLANPAGO = PP_ID' +
          '           AND ESPLA.TB_CLAVE (+)= ''ESPLA''' +
          '           AND ESPLA.TB_CODIGO (+)= PP_ESTADO' +
          '           AND TCUOTA.TB_CLAVE (+)= ''TCUOT''' +
          '           AND TCUOTA.TB_CODIGO (+)= PP_TIPOCUOTA' +
          '           AND PV_IDREMESA IS NOT NULL' +
          '           AND PV_IDPLANCUOTA = PC_ID' +
          '           AND PV_FECHABAJA IS NULL' +
          '           AND PP_ID = ' + IDPlanPago + ' )' +
          ' ORDER BY PC_NROCUOTA';
  OpenQuery( sdqDatos, sSql );

  qrFechaPlan.Caption := sdqDatos.FieldByName('PP_FECHA').AsString;

  qrCuadro1.Caption := sdqDatos.FieldByName('PP_FECHA').AsString;
  DeudaTotal := sdqDatos.FieldByName('PP_DEUDATOTAL').AsFloat;
  Anticipo   := sdqDatos.FieldByName('PC_AMORTIZACION').AsFloat+sdqDatos.FieldByName('PC_INTERESFINANC').AsFloat;
  qrCuadro2.Caption := ToStr(DeudaTotal);
  qrCuadro3.Caption := ToStr(Anticipo);
  qrCuadro4.Caption := ToStr(DeudaTotal - Anticipo);
  qrCuadro5.Caption := ValorSql( 'SELECT (COUNT(*)-1) FROM ZPC_PLANCUOTA WHERE PC_IDPLANPAGO = ' + IDPlanPago, '0');
  //qrCuadro6.Caption  SE LLENA MÁS ABAJO
  qrCuadro7.Caption   := sdqDatos.FieldByName('PP_TASAINTERESMENSUAL').AsString;

  qrlCantCuotas.Caption   := 'Cuotas ' + sdqDatos.FieldByName('DESCR_TIPOCUOTA').AsString + 'es de Amortización:';
  qrlImporteCuota.Caption := 'Importe Cuota ' + sdqDatos.FieldByName('DESCR_TIPOCUOTA').AsString + ':';

  qrCuadroB1.Caption := qrCuadro3.Caption;
  qrCuadroB2.Caption := ToStr(ValorSqlExtended( 'SELECT SUM(PC_AMORTIZACION+PC_INTERESFINANC) FROM ZPC_PLANCUOTA WHERE PC_NROCUOTA <> 0 AND PC_IDPLANPAGO = ' + IDPlanPago));
  qrCuadroB3.Caption := ToStr( ToFloat(qrCuadroB1.Caption) + ToFloat(qrCuadroB2.Caption));

  qrPlan.Caption := sdqDatos.FieldByName('ESTADO').AsString + ' Nº ' + sdqDatos.FieldByName('PP_ID').AsString;
  qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );

  //Reseteo los contadores
  TotalMensual := 0;
  CuotaInteres := 0;
  CuotaAmortizada := 0;
  Saldo := 0;
  Importe := 0;
  //Busca el monto correspondiente al importe de cada cuota
  if sdqDatos.RecordCount > 1 then
    sdqDatos.Next
  else
    Raise Exception.Create( 'No se registran cuotas ingresadas para poder imprimir el plan de financiamiento.' );

  ImporteCuotaMensual := ValorSqlExtended( 'SELECT PC_AMORTIZACION+PC_INTERESFINANC FROM ZPC_PLANCUOTA WHERE PC_NROCUOTA = 1 AND PC_IDPLANPAGO = ' + IDPlanPago );
  qrCuadro6.Caption   := ToStr(ImporteCuotaMensual);

  sdqDatos.First;
  //Muestro el form
  if NombreArchivo = '' then
    // qrPlanFinanciamiento.PreviewModal
    Visualizar(qrPlanFinanciamiento, GetValores('Plan de Financiamiento'), [oForceShowModal])
  else
    SaveToFile( NombreArchivo );
end;

procedure TfrmQrPlanFinanciamiento.qrCuotaAmortPrint(sender: TObject; var Value: String);
begin
  CuotaAmortizada := CuotaAmortizada + ToFloat( Value );
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamiento.qrCuotaInteresPrint(sender: TObject; var Value: String);
begin
  CuotaInteres := CuotaInteres + ToFloat( Value );
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamiento.qrTotalMensualPrint(sender: TObject; var Value: String);
var
  Valor: extended;
begin
  Valor := sdqDatos.FieldByName('PC_AMORTIZACION').AsFloat + sdqDatos.FieldByName('PC_INTERESFINANC').AsFloat;
  TotalMensual := TotalMensual + Valor;
  Value := ToStr ( Valor );
end;

procedure TfrmQrPlanFinanciamiento.qrSaldoPrint(sender: TObject; var Value: String);
begin
  Saldo := Saldo + ToFloat( Value );
  AjustaDecimales ( Value );
  qrSaldoTotal.Caption := Value;
end;

procedure TfrmQrPlanFinanciamiento.qrImportePrint(sender: TObject; var Value: String);
begin
  Importe := Importe + ToFloat( Value );
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamiento.qrImporteTotalPrint(sender: TObject; var Value: String);
begin
  AjustaDecimales ( Value );
end;

procedure TfrmQrPlanFinanciamiento.qrTotalTotalMensualPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( TotalMensual );
end;

procedure TfrmQrPlanFinanciamiento.qrTotalCuotaInteresPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( CuotaInteres );
end;

procedure TfrmQrPlanFinanciamiento.qrTotalCuotaAmortPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( CuotaAmortizada - Anticipo);
end;

procedure TfrmQrPlanFinanciamiento.qrDetalle1Print(sender: TObject; var Value: String);
begin
  if Value = '0' then
    Value := 'Anticipo';
end;

procedure TfrmQrPlanFinanciamiento.qrPlanFinanciamientoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  //Reseteo los contadores
  TotalMensual := 0;
  CuotaInteres := 0;
  CuotaAmortizada := 0;
  Saldo := 0;
  Importe := 0;
end;

procedure TfrmQrPlanFinanciamiento.qrNroPaginaPrint(sender: TObject; var Value: String);
begin
  Value := 'Pág.: ' + Value;
end;

procedure TfrmQrPlanFinanciamiento.qrEmpresa2Print(sender: TObject; var Value: String);
begin
  Value := Copy(Value, 1, 2) + '-' + Copy( Value, 3,8 ) + '-' + Copy(Value, 11,1);
end;

procedure TfrmQrPlanFinanciamiento.qrCuadro7Print(sender: TObject; var Value: String);
begin
  Value := Value + ' %';
end;

procedure TfrmQrPlanFinanciamiento.SaveToFile(NombreArchivo: string);
begin
  ExportarPDF( qrPlanFinanciamiento, NombreArchivo);
//  FileToPDFSvr(qrPlanFinanciamiento, ExtractFileDir(NombreArchivo), NombreArchivo)
end;

end.

