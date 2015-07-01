unit unRptBancosGiroTransferenciaFormato2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt, ArtQReports;

type
  TTipoOperacion = (toTransferencia);

  TfrmRptBancosGiroTransferenciaFormato2 = class(TForm)
    qrBancosGiroTransferencia: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    qrlBanco: TQRLabel;
    qrlDirigidoA: TQRLabel;
    qrmSolicitud: TQRMemo;
    qriLogo: TQRImage;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    qrlTextoInf: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    qrlCantCheques: TQRLabel;
    sdqDatos: TSDQuery;
    ColumnHeaderBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlOP: TQRLabel;
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
    qrlCUITART: TQRLabel;
    qrlDireccionART: TQRLabel;
    qrlTelefonoART: TQRLabel;
    QRLabel5: TQRLabel;
    qrlPciaART: TQRLabel;
    qrNroTransferencia: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
    procedure DoActualizarFechasImpresion(IdTransf: TTableId);
  public
    class procedure DoImprimirBancosGiroTransferenciaFormato2(IdTransf: TTableId; CodBanco: String);
    class function DoImprimir(IdTransf: TTableId; Tipo: TTipoOperacion; CodBanco: String): Boolean;
  end;

var
  frmRptBancosGiroTransferenciaFormato2: TfrmRptBancosGiroTransferenciaFormato2;

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs, General, unComunes, Cuit, unSesion,
  unTesoreria;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmRptBancosGiroTransferenciaFormato2.DoActualizarFechasImpresion(IdTransf: TTableId);
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
class function TfrmRptBancosGiroTransferenciaFormato2.DoImprimir(IdTransf: TTableId; Tipo: TTipoOperacion; CodBanco: String): Boolean;
var
  sCodBarras, sSolicitud, sSql: String;
  Resultados: TResultados;
begin
  Result := False;

  with TfrmRptBancosGiroTransferenciaFormato2.Create(nil) do
    try
      case Tipo of
        toTransferencia:  // TRANSFERENCIAS
          begin
            if CodBanco = CodBanco_Patagonia then
              sSql := 'SELECT CHEQUE, ORDENPAGO, MIN(SINIESTRO) SINIESTRO, MIN(CONCEPTO) CONCEPTO, MIN(SUCURSAL) SUCURSAL, MIN(BENEFICIARIO) BENEFICIARIO, MIN(DOCUMENTO) DOCUMENTO, MIN(IMPORTE) IMPORTE ' +
                        'FROM (' +
                         'SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, ' +
                                'ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') SINIESTRO, ' +
                                'CP_DENPAGO CONCEPTO, REPLACE(LE_ENVIOFONDOS, BA_NOMBRE || '' - SUCURSAL '') SUCURSAL, ' +
                                'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_NOMBRE) BENEFICIARIO, ' +
                                'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_DOCUMENTO) DOCUMENTO, ' +
                                'CE_MONTO IMPORTE ' +
                           'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN, RCE_CHEQUEEMITIDO ' +
                          'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                            'AND EX_SINIESTRO = LE_SINIESTRO ' +
                            'AND EX_ORDEN = LE_ORDEN ' +
                            'AND EX_RECAIDA = LE_RECAIDA ' +
                            'AND TJ_ID = EX_IDTRABAJADOR ' +
                            'AND CB_ID = CE_IDCUENTABANCARIA ' +
                            'AND BA_ID = CB_IDBANCO ' +
                            'AND LE_CONPAGO = CP_CONPAGO ' +
                            'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                            'AND LE_METODOPAGO = ''TR'' ' +
                          'UNION ' +
                         'SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, ' +
                                'ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') SINIESTRO, ' +
                                'CP_DENPAGO CONCEPTO, REPLACE(PR_ENVIOFONDOS, BA_NOMBRE || '' - SUCURSAL '') SUCURSAL, ' +
                                'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_NOMBRE) BENEFICIARIO, ' +
                                'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_DOCUMENTO) DOCUMENTO, ' +
                                'CE_MONTO IMPORTE ' +
                           'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN, RCE_CHEQUEEMITIDO ' +
                          'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                            'AND EX_SINIESTRO = PR_SINIESTRO ' +
                            'AND EX_ORDEN = PR_ORDEN ' +
                            'AND EX_RECAIDA = PR_RECAIDA ' +
                            'AND TJ_ID = EX_IDTRABAJADOR ' +
                            'AND CB_ID = CE_IDCUENTABANCARIA ' +
                            'AND BA_ID = CB_IDBANCO ' +
                            'AND PR_CONPAGO = CP_CONPAGO ' +
                            'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                            'AND PR_METODOPAGO = ''TR'') ' +
                    'GROUP BY CHEQUE, ORDENPAGO ' +
                    'ORDER BY ORDENPAGO, CHEQUE'

            else if CodBanco = CodBanco_PciaBsAs then     // es banco Provincia Bs. As.
              sSql := 'SELECT CHEQUE, ORDENPAGO, MIN(SINIESTRO) SINIESTRO, MIN(CONCEPTO) CONCEPTO, MIN(SUCURSAL) SUCURSAL, MIN(BENEFICIARIO) BENEFICIARIO, MIN(DOCUMENTO) DOCUMENTO, MIN(IMPORTE) IMPORTE ' +
                        'FROM (' +
                         'SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, ' +
                                'ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') SINIESTRO, ' +
                                'CP_DENPAGO CONCEPTO, REPLACE(LE_ENVIOFONDOS, BA_NOMBRE || '' - SUCURSAL '') SUCURSAL, ' +
                                'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_NOMBRE) BENEFICIARIO, ' +
                                'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_DOCUMENTO) DOCUMENTO, ' +
                                'CE_MONTO IMPORTE ' +
                           'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN, RCE_CHEQUEEMITIDO ' +
                          'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                            'AND EX_SINIESTRO = LE_SINIESTRO ' +
                            'AND EX_ORDEN = LE_ORDEN ' +
                            'AND EX_RECAIDA = LE_RECAIDA ' +
                            'AND TJ_ID = EX_IDTRABAJADOR ' +
                            'AND CB_ID = CE_IDCUENTABANCARIA ' +
                            'AND BA_ID = CB_IDBANCO ' +
                            'AND LE_CONPAGO = CP_CONPAGO ' +
                            'AND CE_IDARCHIVOBAPRO = :IdTransferencia ' +
                            'AND LE_METODOPAGO = ''TR'' ' +
                          'UNION ' +
                         'SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, ' +
                                'ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') SINIESTRO, ' +
                                'CP_DENPAGO CONCEPTO, REPLACE(PR_ENVIOFONDOS, BA_NOMBRE || '' - SUCURSAL '') SUCURSAL, ' +
                                'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_NOMBRE) BENEFICIARIO, ' +
                                'NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_DOCUMENTO) DOCUMENTO, ' +
                                'CE_MONTO IMPORTE ' +
                           'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN, RCE_CHEQUEEMITIDO ' +
                          'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                            'AND EX_SINIESTRO = PR_SINIESTRO ' +
                            'AND EX_ORDEN = PR_ORDEN ' +
                            'AND EX_RECAIDA = PR_RECAIDA ' +
                            'AND TJ_ID = EX_IDTRABAJADOR ' +
                            'AND CB_ID = CE_IDCUENTABANCARIA ' +
                            'AND BA_ID = CB_IDBANCO ' +
                            'AND PR_CONPAGO = CP_CONPAGO ' +
                            'AND CE_IDARCHIVOBAPRO = :IdTransferencia ' +
                            'AND PR_METODOPAGO = ''TR'') ' +
                    'GROUP BY CHEQUE, ORDENPAGO ' +
                    'ORDER BY ORDENPAGO, CHEQUE'
          end;
      end;

      OpenQueryEx(sdqDatos, [IdTransf], sSql);

      if not sdqDatos.Eof then
        begin
          qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

          case Tipo of
            toTransferencia:
              qrBancosGiroTransferencia.ReportTitle := 'Transferencias';
          end;

          if CodBanco = CodBanco_Patagonia then
            begin
              qrlBanco.Caption     := 'BANCO PATAGONIA S.A.';
              qrlDirigidoA.Caption := 'AT. CASHMANAGEMENT';

              sSolicitud := 'Autorizamos a debitar en el día de la fecha el importe total de pagos, que se datallan a ' +
                            'continuación, de nuestra cuenta N° 1010058701100 radicada en v/ entidad.';
            end
          else if CodBanco = CodBanco_PciaBsAs then
            begin
              qrlBanco.Caption     := 'BANCO DE LA PROVINCIA DE BUENOS AIRES';
              qrlDirigidoA.Caption := '';

              sSolicitud := 'Notificamos que los pagos que se detallan a continuación se procesan bajo el método de ' +
                            'transferencia por ticketera, regularizado por convenio firmado con v/ entidad bancaria e '+
                            'instrumentado bajo la circular Nº 25487 del 16 de marzo de 2009. Todo gasto generado por este ' +
                            'servicio deberá debitarse de la cuenta corriente Nº 45337/2.';
            end;

          qrNroTransferencia.Caption := 'Nro. Transferencia: ' + IntToStr(IdTransf);
          qrmSolicitud.Lines.Text    := sSolicitud;
          qrlCantCheques.Caption     := IntToStr(sdqDatos.RecordCount) + ' Pago/s';

          qrlCUITART.Caption      := 'CUIT: ' + PonerGuiones(ART_CUIT);
          qrlDireccionART.Caption := ART_DOMICILIO2 + ' (' + ART_CPOSTALA + ')';
          qrlPciaART.Caption      := ART_LOCALIDAD2;
          qrlTelefonoART.Caption  := TXT_EMP_TEL;

          sCodBarras        := Get_CodBarrasCarpetaTransferenciaBancaria(CodBanco, IdTransf);
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
class procedure TfrmRptBancosGiroTransferenciaFormato2.DoImprimirBancosGiroTransferenciaFormato2(IdTransf: TTableId; CodBanco: String);
begin
  if DoImprimir(IdTransf, toTransferencia, CodBanco) then
    DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco, IdTransf, 'T');
end;
{------------------------------------------------------------------------------}
procedure TfrmRptBancosGiroTransferenciaFormato2.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{------------------------------------------------------------------------------}
end.
