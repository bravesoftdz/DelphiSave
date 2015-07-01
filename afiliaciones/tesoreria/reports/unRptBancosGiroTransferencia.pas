unit unRptBancosGiroTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt, ArtQReports;

type
  TTipoOperacion = (toTransferencia, toDeposito);

  TfrmRptBancosGiroTransferencia = class(TForm)
    sdqDatos: TSDQuery;
    qrBancosGiroTransferencia: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    qrlGirosTransf: TQRLabel;
    QRLabel4: TQRLabel;
    qrmSolicitud: TQRMemo;
    qriLogo: TQRImage;
    qrNroTransferencia: TQRLabel;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTextoInf: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    qrlCUITART: TQRLabel;
    qrlDireccionART: TQRLabel;
    qrlTelefonoART: TQRLabel;
    qrlPciaART: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlTitSucCuenta: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape22: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
    procedure DoActualizarFechasImpresion(IdTransf: TTableId);
  public
    class procedure DoImprimirBancosGiroTransferencia(IdTransf: TTableId);
    class function DoImprimir(IdTransf: TTableId; Tipo: TTipoOperacion): Boolean;
  end;

var
  frmRptBancosGiroTransferencia: TfrmRptBancosGiroTransferencia;

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs, General, unComunes, Cuit, unSesion,
  unTesoreria, Numeros, AnsiSql;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmRptBancosGiroTransferencia.DoActualizarFechasImpresion(IdTransf: TTableId);
var
  sSql: String;
begin
  sSql := 'UPDATE TESO.RTR_TRANSFERENCIA ' +
             'SET TR_FECHAIMPRESION = SYSDATE, ' +
                 'TR_USUIMPRESION = :User ' +
           'WHERE TR_ID = :IdTransf';
  EjecutarSqlEx(sSql, [Sesion.UserId, IdTransf]);
end;
{------------------------------------------------------------------------------}
class function TfrmRptBancosGiroTransferencia.DoImprimir(IdTransf: TTableId; Tipo: TTipoOperacion): Boolean;
var
  sCantPagos, sCodBarras, sTitSucCuenta, sSql: String;
  sImporteLetras, sFechaPagoDesde, sFechaPagoHasta: String;
  Resultados: TResultados;
  SqlResults: TStringList;
  dImporte: Currency;
begin
  Result := False;

  with TfrmRptBancosGiroTransferencia.Create(nil) do
    try
      case Tipo of
        toTransferencia:  // TRANSFERENCIAS
          sSql := 'SELECT ORDENPAGO, MIN(SUCURSAL) SUCURSAL, MIN(BENEFICIARIO) BENEFICIARIO, MIN(DOCUMENTO) DOCUMENTO, MIN(IMPORTE) IMPORTE, MIN(SINIESTRO) SINIESTRO ' +
                    'FROM (' +
                     'SELECT ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') SINIESTRO, ' +
                            'REPLACE(LE_ENVIOFONDOS, ''BANCO DE LA NACION ARGENTINA - SUCURSAL '') SUCURSAL, ' +
                            'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_NOMBRE) BENEFICIARIO, ' +
                            'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_DOCUMENTO) DOCUMENTO, ' +
                            'CE_MONTO IMPORTE, CE_ORDENPAGO ORDENPAGO ' +
                       'FROM CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN, RCE_CHEQUEEMITIDO ' +
                      'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                        'AND EX_SINIESTRO = LE_SINIESTRO ' +
                        'AND EX_ORDEN = LE_ORDEN ' +
                        'AND EX_RECAIDA = LE_RECAIDA ' +
                        'AND TJ_ID = EX_IDTRABAJADOR ' +
                        'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                        'AND LE_METODOPAGO = ''TR'' ' +
                        'AND TESORERIA.IS_BANCONACION(LE_IDBANCO) = ''S'' ' +
                     'UNION ' +
                     'SELECT ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') SINIESTRO, ' +
                            'REPLACE(PR_ENVIOFONDOS, ''BANCO DE LA NACION ARGENTINA - SUCURSAL '') SUCURSAL, ' +
                            'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_NOMBRE) BENEFICIARIO, ' +
                            'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_DOCUMENTO) DOCUMENTO, ' +
                            'CE_MONTO IMPORTE, CE_ORDENPAGO ORDENPAGO ' +
                       'FROM CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN, RCE_CHEQUEEMITIDO ' +
                      'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                        'AND EX_SINIESTRO = PR_SINIESTRO ' +
                        'AND EX_ORDEN = PR_ORDEN ' +
                        'AND EX_RECAIDA = PR_RECAIDA ' +
                        'AND TJ_ID = EX_IDTRABAJADOR ' +
                        'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                        'AND PR_METODOPAGO = ''TR'' ' +
                        'AND TESORERIA.IS_BANCONACION(PR_IDBANCO) = ''S'') ' +
                   'GROUP BY ORDENPAGO ' +
                   'ORDER BY ORDENPAGO';

        toDeposito:       // DEPOSITO EN CUENTA
          sSql := 'SELECT ORDENPAGO, MIN(SUCURSAL) SUCURSAL, MIN(BENEFICIARIO) BENEFICIARIO, MIN(DOCUMENTO) DOCUMENTO, MIN(IMPORTE) IMPORTE, MIN(SINIESTRO) SINIESTRO ' +
                    'FROM (' +
                     'SELECT ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') SINIESTRO, ' +
                            'REPLACE(REPLACE(LE_ENVIOFONDOS, ''BANCO DE LA NACION ARGENTINA - SUCURSAL ''), ''Nro. de cuenta: '') SUCURSAL, ' +
                            'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_NOMBRE) BENEFICIARIO, ' +
                            'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_DOCUMENTO) DOCUMENTO, ' +
                            'CE_MONTO IMPORTE, CE_ORDENPAGO ORDENPAGO ' +
                       'FROM CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN, RCE_CHEQUEEMITIDO ' +
                      'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                        'AND EX_SINIESTRO = LE_SINIESTRO ' +
                        'AND EX_ORDEN = LE_ORDEN ' +
                        'AND EX_RECAIDA = LE_RECAIDA ' +
                        'AND TJ_ID = EX_IDTRABAJADOR ' +
                        'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                        'AND LE_METODOPAGO = ''DC'' ' +
                        'AND TESORERIA.IS_BANCONACION(LE_IDBANCO) = ''S'' ' +
                      'UNION ' +
                     'SELECT ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') SINIESTRO, ' +
                            'REPLACE(REPLACE(PR_ENVIOFONDOS, ''BANCO DE LA NACION ARGENTINA - SUCURSAL ''), ''Nro. de cuenta: '') SUCURSAL, ' +
                            'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_NOMBRE) BENEFICIARIO, ' +
                            'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_DOCUMENTO) DOCUMENTO, ' +
                            'CE_MONTO IMPORTE, CE_ORDENPAGO ORDENPAGO ' +
                       'FROM CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN, RCE_CHEQUEEMITIDO ' +
                      'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                        'AND EX_SINIESTRO = PR_SINIESTRO ' +
                        'AND EX_ORDEN = PR_ORDEN ' +
                        'AND EX_RECAIDA = PR_RECAIDA ' +
                        'AND TJ_ID = EX_IDTRABAJADOR ' +
                        'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                        'AND PR_METODOPAGO = ''DC'' ' +
                        'AND TESORERIA.IS_BANCONACION(PR_IDBANCO) = ''S'') ' +
                   'GROUP BY ORDENPAGO ' +
                   'ORDER BY ORDENPAGO';
      end;

      OpenQueryEx(sdqDatos, [IdTransf], sSql);

      if not sdqDatos.Eof then
        begin
          qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

          case Tipo of
            toTransferencia:
              begin
                qrBancosGiroTransferencia.ReportTitle := 'Transferencias';
                sTitSucCuenta  := 'SUCURSAL';
              end;
            toDeposito:
              begin
                qrBancosGiroTransferencia.ReportTitle := 'Depósitos en Cuenta';
                sTitSucCuenta  := 'NRO. CUENTA - SUCURSAL';
              end;
          end;

          qrNroTransferencia.Caption := 'Nro. Transferencia: ' + IntToStr(IdTransf);
          qrlTitSucCuenta.Caption    := sTitSucCuenta;

          sSql := 'SELECT COUNT(*) CANTIDAD, SUM(CE_MONTO) MONTO, ' +
                         'TO_CHAR(TRUNC(ART.AMEBPBA.CALCDIASHABILES(TR_FECHAALTA, 2)), ''DD/MM/YYYY'') DESDE, ' +
                         'TO_CHAR(TRUNC(ART.AMEBPBA.CALCDIASHABILES(LAST_DAY(ART.AMEBPBA.CALCDIASHABILES(TR_FECHAALTA, 2) + 30), -1)), ''DD/MM/YYYY'') HASTA ' +
                    'FROM RCE_CHEQUEEMITIDO, TESO.RTR_TRANSFERENCIA ' +
                   'WHERE TR_ID = CE_IDTRANSFERENCIA ' +
                     'AND CE_ESTADO = ''01'' ' +
                     'AND TR_ID = ' + SqlValue(IdTransf) + ' ' +
                   'GROUP BY TR_FECHAALTA';
          SqlResults := ValoresColSql(sSql);
          try
            sCantPagos      := SqlResults[0];
            dImporte        := StrToCurr(SqlResults[1]);
            sImporteLetras  := NumLetras(dImporte, 2, True);
            sFechaPagoDesde := SqlResults[2];
            sFechaPagoHasta := SqlResults[3];
          finally
            SqlResults.Free;
          end;

          qrmSolicitud.Lines.Text :=
            'De nuestra consideración:' + CRLF + CRLF +
            '      Por la presente, nos dirigimos a Uds. con relación al tema de referencia en el marco del Convenio Nro. 0037 con el fin de ' +
            'hacer efectivo el pago, por distintos conceptos, a los siguientes SINIESTROS que detallamos a continuación:' + CRLF + CRLF +
            'Cantidad de pagos: ' + sCantPagos + '.' + CRLF + CRLF +
            'Total general a acreditar en pesos: ' + CurrToStrF(dImporte, ffNumber, 2) + ' (' + sImporteLetras + ')' + '.' + CRLF + CRLF +
            'Periodo de pago: ' + sFechaPagoDesde + ' al ' + sFechaPagoHasta + '.' + CRLF + CRLF +
            '      Asimismo, autorizamos al banco a debitar el día de la fecha de nuestra cuenta corriente radicada en vuestra sucursal Nro. ' +
            '46559/25, los fondos necesarios para atender los gastos administrativos convenidos y la comisión del servicio.';

          qrlCUITART.Caption      := 'CUIT: ' + PonerGuiones(ART_CUIT);
          qrlDireccionART.Caption := ART_DOMICILIO2 + ' (' + ART_CPOSTALA + ')';
          qrlPciaART.Caption      := ART_LOCALIDAD2;
          qrlTelefonoART.Caption  := TXT_EMP_TEL;

          sCodBarras        := Get_CodBarrasCarpetaTransferenciaBancaria(CodBanco_NacionArg, IdTransf);
          qrlNumero.Caption := sCodBarras;
          qrlBarras.Caption := '*' + qrlNumero.Caption + '*';

          Resultados := Visualizar(qrBancosGiroTransferencia, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

          if (rImpresora in Resultados) or (rMail in Resultados) then
            DoActualizarFechasImpresion(IdTransf);

          Result := (rImpresora in Resultados);
        end;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
class procedure TfrmRptBancosGiroTransferencia.DoImprimirBancosGiroTransferencia(IdTransf: TTableId);
begin
  if DoImprimir(IdTransf, toTransferencia) then
    DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco_NacionArg, IdTransf, 'T');

  if DoImprimir(IdTransf, toDeposito) then
    DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco_NacionArg, IdTransf, 'D');
end;
{------------------------------------------------------------------------------}
procedure TfrmRptBancosGiroTransferencia.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{------------------------------------------------------------------------------}
end.

