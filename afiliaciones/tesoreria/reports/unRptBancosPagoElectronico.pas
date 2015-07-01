unit unRptBancosPagoElectronico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt;

type
  TfrmRptBancosPagoElectronico = class(TForm)
    qrBancosPagoElectronico: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    qrlBanco: TQRLabel;
    qrlAsunto: TQRLabel;
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
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
    class procedure DoImprimirBancosPagoElectronico(Fecha: TDateTime; IdBanco: TTableId; NroChequeDesde, NroChequeHasta: Cardinal);
  end;

var
  frmRptBancosPagoElectronico: TfrmRptBancosPagoElectronico;

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs, General, unComunes, CustomDlgs, Cuit,
  DateTimeFuncs, unTesoreria, AnsiSql;

{$R *.dfm}

{------------------------------------------------------------------------------}
class procedure TfrmRptBancosPagoElectronico.DoImprimirBancosPagoElectronico(Fecha: TDateTime; IdBanco: TTableId; NroChequeDesde, NroChequeHasta: Cardinal);
var
  sSolicitud, sSql: String;
begin
  with TfrmRptBancosPagoElectronico.Create(nil) do
    try
      sSql := 'SELECT CHEQUE, ORDENPAGO, MIN(SINIESTRO) SINIESTRO, MIN(CONCEPTO) CONCEPTO, MIN(BENEFICIARIO) BENEFICIARIO, ' +
                     'MIN(JUICIO) JUICIO, MIN(IMPORTE) IMPORTE, MIN(BANCO) BANCO ' +
                'FROM (SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, ' +
                             'ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') SINIESTRO, CP_DENPAGO CONCEPTO, ' +
                             'CE_BENEFICIARIO BENEFICIARIO, NULL JUICIO, CE_MONTO IMPORTE, BA_NOMBRE BANCO ' +
                        'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, ART.SCP_CONPAGO, ART.SLE_LIQUIEMPSIN, RCE_CHEQUEEMITIDO ' +
                       'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                         'AND CB_ID = CE_IDCUENTABANCARIA ' +
                         'AND BA_ID = CB_IDBANCO ' +
                         'AND LE_CONPAGO = CP_CONPAGO ' +
                         'AND CE_METODOPAGO = ' + SqlValue(MP_PAGOELECTRONICO) + ' ' +
                         'AND BA_ID = :Banco ' +
                         'AND CE_FECHACHEQUE = :Fecha ' +
                         'AND CE_NUMERO BETWEEN :ChDesde AND :ChHasta ' +
                       'UNION ALL ' +
                      'SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, ' +
                             'ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') SINIESTRO, CP_DENPAGO CONCEPTO, ' +
                             'CE_BENEFICIARIO BENEFICIARIO, NULL JUICIO, CE_MONTO IMPORTE, BA_NOMBRE BANCO ' +
                        'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, ART.SCP_CONPAGO, ART.SPR_PAGOEXPESIN, RCE_CHEQUEEMITIDO ' +
                       'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                         'AND CB_ID = CE_IDCUENTABANCARIA ' +
                         'AND BA_ID = CB_IDBANCO ' +
                         'AND PR_CONPAGO = CP_CONPAGO ' +
                         'AND CE_METODOPAGO = ' + SqlValue(MP_PAGOELECTRONICO) + ' ' +
                         'AND BA_ID = :Banco ' +
                         'AND CE_FECHACHEQUE = :Fecha ' +
                         'AND CE_NUMERO BETWEEN :ChDesde AND :ChHasta ' +
                       'UNION ALL ' +
                      'SELECT CE_NUMERO CHEQUE, CE_ORDENPAGO ORDENPAGO, NULL SINIESTRO, CP_DENPAGO CONCEPTO, CE_BENEFICIARIO BENEFICIARIO, ' +
                             'JT_NUMEROCARPETA JUICIO, CE_MONTO IMPORTE, BA_NOMBRE BANCO ' +
                        'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, ART.SCP_CONPAGO, LEGALES.LJT_JUICIOENTRAMITE, LEGALES.LPL_PAGOLEGAL, ' +
                             'RCE_CHEQUEEMITIDO ' +
                       'WHERE CE_ID = PL_IDCHEQUEEMITIDO ' +
                         'AND CB_ID = CE_IDCUENTABANCARIA ' +
                         'AND BA_ID = CB_IDBANCO ' +
                         'AND PL_CONPAGO = CP_CONPAGO ' +
                         'AND JT_ID = PL_IDJUICIOENTRAMITE ' +
                         'AND CE_METODOPAGO = ' + SqlValue(MP_PAGOELECTRONICO) + ' ' +
                         'AND BA_ID = :Banco ' +
                         'AND CE_FECHACHEQUE = :Fecha ' +
                         'AND CE_NUMERO BETWEEN :ChDesde AND :ChHasta) ' +
            'GROUP BY CHEQUE, ORDENPAGO';
      OpenQueryEx(sdqDatos, [IdBanco, TDateTimeEx.Create(Fecha), NroChequeDesde, NroChequeHasta], sSql);

      Verificar(sdqDatos.Eof, nil, 'No se han encontrado datos.');

      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrlBanco.Caption  := UpperCase(Get_NombreBancoCompleto(sdqDatos.FieldByName('BANCO').AsString));
      qrlAsunto.Caption := 'Asunto: Transferencias CBU';

      sSolicitud := 'Por la presente autorizamos a debitar, de nuestra cuenta corriente N° 45337/2, los fondos por el ' +
                    'total de las transferencias que se detallan a continuación.';

      qrmSolicitud.Lines.Text := sSolicitud;
      qrlCantCheques.Caption  := IntToStr(sdqDatos.RecordCount) + ' Pago/s';

      qrlCUITART.Caption      := 'CUIT: ' + PonerGuiones(ART_CUIT);
      qrlDireccionART.Caption := ART_DOMICILIO2 + ' (' + ART_CPOSTALA + ')';
      qrlPciaART.Caption      := ART_LOCALIDAD2;
      qrlTelefonoART.Caption  := TXT_EMP_TEL;

      Visualizar(qrBancosPagoElectronico, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmRptBancosPagoElectronico.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{------------------------------------------------------------------------------}
end.

