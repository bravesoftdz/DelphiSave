unit unQrEstadoCuentaPlan;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   14-08-03
 ULTIMA MODIFICACION: 11-11-03
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Qrctrls, unQRLabelEx, Db,
  SDEngine, Printers;

type
  TfrmQrEstadoCuenta = class(TForm)
    qrEstadoCuenta: TQuickRep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabelEx1: TQRLabelEx;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    qrEmpresa1: TQRDBText;
    qrEmpresa2: TQRDBText;
    QRLabel1: TQRLabel;                                               
    qrNroPagina: TQRExpr;
    qrPlan: TQRLabel;
    sdqDatos: TSDQuery;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel: TQRDBText;
    QRLabelEx3: TQRLabelEx;
    QRLabelEx4: TQRLabelEx;
    QRLabelEx5: TQRLabelEx;
    QRLabelEx6: TQRLabelEx;
    QRLabelEx7: TQRLabelEx;
    QRLabelEx8: TQRLabelEx;
    QRLabelEx9: TQRLabelEx;
    QRLabelEx10: TQRLabelEx;
    QRLabelEx11: TQRLabelEx;
    QRLabelEx12: TQRLabelEx;
    QRLabelEx13: TQRLabelEx;
    QRLabelEx14: TQRLabelEx;
    QRLabelEx15: TQRShape;
    QRLabelEx16: TQRShape;
    QRLabelEx17: TQRShape;
    QRLabelEx18: TQRShape;
    QRLabelEx19: TQRShape;
    QRLabelEx20: TQRShape;
    QRLabelEx22: TQRShape;
    QRLabelEx23: TQRShape;
    QRLabelEx24: TQRShape;
    QRLabelEx25: TQRShape;
    QRLabelEx26: TQRShape;
    qrDetalle1: TQRDBText;
    qrDetalle2: TQRDBText;
    qrDetalle3: TQRDBText;
    qrDetalle4: TQRDBText;
    qrDetalle5: TQRDBText;
    qrDetalle6: TQRDBText;
    qrDetalle7: TQRDBText;
    qrDetalle8: TQRDBText;
    qrDetalle9: TQRDBText;
    qrDetalle10: TQRDBText;
    qrDetalle11: TQRDBText;
    qrDetalle12: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRExpr;
    QRDBText4: TQRExpr;
    QRDBText5: TQRExpr;
    qrInteres: TQRExpr;
    qrDeuda: TQRExpr;
    qrTotal1: TQRLabel;
    qrTotal2: TQRLabel;
    qrDesc1: TQRLabel;
    qrDesc2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrSummary1: TQRLabel;
    qrSummary2: TQRLabel;
    qrSummary3: TQRLabel;
    qrSummary4: TQRLabel;
    qrSummary5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    qrEmpresa3: TQRDBText;
    QRLabel14: TQRLabel;
    qrSummary6: TQRLabel;
    QRLabelEx2: TQRLabelEx;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRDBText1: TQRDBText;
    QRShape15: TQRShape;
    QRExpr2: TQRExpr;
    qrFechaPlan: TQRLabel;
    QRShape16: TQRShape;
    QRLabelEx21: TQRLabelEx;
    QRShape20: TQRShape;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    qriLogo: TQRImage;
    QRLabel15: TQRLabel;
    QRLabelEx27: TQRLabelEx;
    QRDBText6: TQRDBText;
    QRShape17: TQRShape;
    procedure qrNroPaginaPrint(sender: TObject; var Value: String);
    procedure qrTotal1Print(sender: TObject; var Value: String);
    procedure qrTotal2Print(sender: TObject; var Value: String);
    procedure qrDetalle10Print(sender: TObject; var Value: String);
    procedure FormatCuit(sender: TObject; var Value: String);
    procedure AjustaDecimales(sender: TObject; var Value: String);
    procedure qrDetalle1Print(sender: TObject; var Value: String);
    procedure qrEstadoCuentaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    Deuda, Intereses, DescIntereses: extended;
  public
    procedure Preparar(IDPlanPago: String; NombreArchivo: String = '');
  end;

var
  frmQrEstadoCuenta: TfrmQrEstadoCuenta;

implementation

{$R *.DFM}

uses
  undmPrincipal, unPrincipal, unArt, unComunes, unExportPDF, StrFuncs, General, Cuit, unVisualizador, unSesion, unEnvioMail;

procedure TfrmQrEstadoCuenta.FormatCuit(sender: TObject; var Value: String);
begin
  Value := PonerGuiones( Value );
end;

procedure TfrmQrEstadoCuenta.Preparar( IDPlanPago: string; NombreArchivo: string = '' );
var
  sSql: string;
begin
  sSql := 'SELECT EM_NOMBRE, EM_CUIT, CO_CONTRATO, ART.AFILIACION.GET_TARIFAVIGENTETEXTO(PD_CONTRATO_EXT, PD_PERIODO) TARIFA, ' +
          '       PP_ID, PP_FECHAMORA, PP_GASTOADMINISTRATIVO, PP_DEUDATOTAL, PP_PORCDESCINTERES, NVL(PP_FECHAAPROBADO, PP_FECHA) FECHAPLAN, ' +
          '       PP_MONTODESCINTERES, PD_PERIODO, TB_DESCRIPCION ESTADO, PD_EMPLEADOS, PD_MASASALARIAL, ' +
          '       PD_CUOTADEVENGADO, PD_FONDODEVENGADO, PD_OTROSDEVENGADO, PD_CUOTAPAGO+PD_FONDOPAGO+PD_OTROSPAGO CANCELACION, PD_DEUDAINICIAL, ' +
          '       PD_DEUDANOMINAL, PD_VENCIMIENTO, PD_TASAACUMULADA, PD_INTERESMORA, PD_DEUDATOTAL, PP_COMISIONGESTOR, ' +
          '       PD_CODTIPOREGIMEN CODREG ' +
          '  FROM ZPD_PLANDEUDA, ZPP_PLANPAGO, ACO_CONTRATO, AEM_EMPRESA, CTB_TABLAS ' +
          ' WHERE PD_IDPLANPAGO = PP_ID ' +
          '   AND PP_CONTRATO = CO_CONTRATO ' +
          '   AND CO_IDEMPRESA = EM_ID ' +
          '   AND TB_CLAVE (+)= ''ESPLA'' ' +
          '   AND TB_CODIGO (+)= PP_ESTADO ' +
          '   AND PP_ID = ' + IDPlanPago + ' ' +
          ' ORDER BY PD_PERIODO, CODREG DESC';
  OpenQuery( sdqDatos, sSql );

  //Le doy el valor a cada label
  qrPlan.Caption      := sdqDatos.FieldByName('ESTADO').AsString + ' Nº ' + sdqDatos.FieldByName('PP_ID').AsString;
  qrFechaPlan.Caption := sdqDatos.FieldByName('FECHAPLAN').AsString;

  Deuda := ValorSql('SELECT SUM(PD_DEUDANOMINAL) FROM ZPD_PLANDEUDA WHERE PD_IDPLANPAGO = ' + IDPlanPago,'0');

  Intereses := ValorSql('SELECT SUM(PD_INTERESMORA) FROM ZPD_PLANDEUDA WHERE PD_IDPLANPAGO = ' + IDPlanPago,'0');
  if (sdqDatos.FieldByName('PP_PORCDESCINTERES').AsFloat <> 0) then
    DescIntereses := Intereses * sdqDatos.FieldByName('PP_PORCDESCINTERES').AsFloat/100
  else
    DescIntereses :=  sdqDatos.FieldByName('PP_MONTODESCINTERES').AsFloat;
  Intereses := Intereses - DescIntereses;

  qrDesc1.Caption    := ToStr(-DescIntereses, 2, False, True);
  qrDesc2.Caption    := ToStr(-DescIntereses, 2, False, True);
  qrSummary1.Caption := ToStr(Deuda);
  qrSummary2.Caption := ToStr(Intereses, 2, False, True);
  qrSummary3.Caption := ToStr(Deuda + Intereses);
  qrSummary4.Caption := ToStr(sdqDatos.FieldByName('PP_GASTOADMINISTRATIVO').AsFloat);
  qrSummary5.Caption := ToStr(Deuda + Intereses + sdqDatos.FieldByName('PP_GASTOADMINISTRATIVO').AsFloat);
  qrSummary6.Caption := ToStr(sdqDatos.FieldByName('PP_COMISIONGESTOR').AsFloat);

  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  if NombreArchivo > '' then
    FileToPDFSvr(QrEstadoCuenta, ExtractFileDir(NombreArchivo), NombreArchivo)
  else
  begin
    Visualizar(QrEstadoCuenta, GetValores('Estado de Cuenta'), [oForceShowModal]);
  end;
end;

procedure TfrmQrEstadoCuenta.qrNroPaginaPrint(sender: TObject; var Value: String);
begin
  Value := 'Pág.: ' + Value;
end;

procedure TfrmQrEstadoCuenta.qrTotal1Print(sender: TObject; var Value: String);
begin
  Value := ToStr(qrInteres.Value.dblResult-DescIntereses, 2, False, False, '');
end;

procedure TfrmQrEstadoCuenta.qrTotal2Print(sender: TObject; var Value: String);
begin
  Value := ToStr(qrDeuda.Value.dblResult-DescIntereses, 2, False, False, '');
end;

procedure TfrmQrEstadoCuenta.qrDetalle10Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%');
end;

procedure TfrmQrEstadoCuenta.AjustaDecimales(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '', 2, False, True);
end;

procedure TfrmQrEstadoCuenta.qrDetalle1Print(sender: TObject;
  var Value: String);
begin
  Value := Copy(Value, 5, 2) + '/' + Copy(Value, 1,4);
end;

procedure TfrmQrEstadoCuenta.qrEstadoCuentaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
{var
  iLoop: Integer;
  iOldIndex: Integer;
  sBody: String;}
begin
{  // Si es Marcela me manda un mail asi sigo el problema..
  if (Sesion.LoginName = 'MREPETTO') then
  begin
    iOldIndex := QrEstadoCuenta.PrinterSettings.PrinterIndex;

    // Ella tiene solo 2 impresoras, como impresora 0 la HP4050 y como impresora 1 la HP8150..
    // Si el printerindex del reporte está en mas de 1 la seteo en 1..
    if (QrEstadoCuenta.PrinterSettings.PrinterIndex > 1) then
      QrEstadoCuenta.PrinterSettings.PrinterIndex := 1;

    sBody :=
      'Se cambió el índice de la impresora de ' + Sesion.LoginName + CRLF +
      'Índice anterior: ' + IntToStr(iOldIndex) + CRLF +
      'Cantidad de impresoras: ' + IntToStr(Printer.Printers.Count) + CRLF + CRLF;

    for iLoop := 0 to Printer.Printers.Count - 1 do
      sBody := sBody + 'Impresora ' + IntToStr(iLoop + 1) + ': ' + Printer.Printers[iLoop] + CRLF;

    sBody := sBody + CRLF + 'Índice actual: ' + IntToStr(QrEstadoCuenta.PrinterSettings.PrinterIndex);

    EnviarMailBD('alapaco', 'PrinterIndex', [], [], sBody);
  end;}
end;

end.
