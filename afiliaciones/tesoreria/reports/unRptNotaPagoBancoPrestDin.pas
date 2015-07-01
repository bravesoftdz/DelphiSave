unit unRptNotaPagoBancoPrestDin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt;
               
type
  TqrNotaPagoBancoPrestDin = class(TqrMoldeCarta)
    ChildBand1: TQRChildBand;
    qrTexto: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
  private
  public
  end;

  procedure DoImprimirNotaBancoPrestDin(IdCheque: TTableId);

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, Cuit, General, unTesoreria;

{$R *.dfm}

procedure DoImprimirNotaBancoPrestDin(IdCheque: TTableId);
var
  rpt: TqrNotaPagoBancoPrestDin;
  sTexto, sSql: String;
  bEmpresa: Boolean;
begin
  rpt := TqrNotaPagoBancoPrestDin.Create(nil);

  with rpt do
    try
      sSql := 'SELECT * ' +
                'FROM (SELECT TRIM(MAX(NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_NOMBRE))) NOMTRAB, ' +
                             'MAX(NVL(ART.LIQ.GETNRODOCBENEFICIARIOLIQUIDAC(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_DOCUMENTO)) DOCTRAB, ' +
                             'MAX(CE_NUMERO) NROCHEQUE, MAX(CE_MONTO) IMPORTE, TRIM(MAX(BA_NOMBRE)) BANCO, MAX(LE_CONPAGO) CONPAGO, ' +
                             'TRIM(MAX(CP_DESCRIPCION)) DESCRCONPAGO, MAX(EM_CUIT) CUITEMPR, 1 ORDEN, ' +
                             'TRIM(MAX(EM_NOMBRE)) NOMEMPR, TRIM(MAX(CE_METODOPAGO)) METODOPAGO, ''prestación dineraria'' TIPO ' +
                        'FROM AEM_EMPRESA, ART.SCP_CONPAGO, ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ' +
                             'RCE_CHEQUEEMITIDO, ART.SLE_LIQUIEMPSIN ' +
                       'WHERE CE_ID = :IdCheque ' +
                         'AND LE_IDCHEQUEEMITIDO = CE_ID ' +
                         'AND LE_SINIESTRO = EX_SINIESTRO ' +
                         'AND LE_ORDEN = EX_ORDEN ' +
                         'AND LE_RECAIDA = EX_RECAIDA ' +
                         'AND EX_CUIL = TJ_CUIL ' +
                         'AND CE_IDCUENTABANCARIA = CB_ID ' +
                         'AND CB_IDBANCO = BA_ID ' +
                         'AND LE_CONPAGO = CP_CONPAGO ' +
                         'AND EX_CUIT = EM_CUIT ' +
                       'UNION ' +
                      'SELECT TRIM(MAX(TJ_NOMBRE)) NOMTRAB, ' +
                             'MAX(TJ_DOCUMENTO) DOCTRAB, ' +
                             'MAX(CE_NUMERO) NROCHEQUE, MAX(CE_MONTO) IMPORTE, TRIM(MAX(BA_NOMBRE)) BANCO, MAX(PM_CONPAGO) CONPAGO, ' +
                             'TRIM(MAX(NVL(CP_DESCRIPCION, CP_DENPAGO))) DESCRCONPAGO, MAX(EM_CUIT) CUITEMPR, 2 ORDEN, ' +
                             'TRIM(MAX(EM_NOMBRE)) NOMEMPR, TRIM(MAX(CE_METODOPAGO)) METODOPAGO, ''mediación'' TIPO ' +
                        'FROM AEM_EMPRESA, ART.SCP_CONPAGO, ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ' +
                             'RCE_CHEQUEEMITIDO, LEGALES.LPM_PAGOMEDIACION, LEGALES.LME_MEDIACION ' +
                       'WHERE CE_ID = :IdCheque ' +
                         'AND PM_IDCHEQUEEMITIDO = CE_ID ' +
                         'AND EX_CUIL = TJ_CUIL ' +
                         'AND CE_IDCUENTABANCARIA = CB_ID ' +
                         'AND CB_IDBANCO = BA_ID ' +
                         'AND PM_CONPAGO = CP_CONPAGO ' +
                         'AND EX_CUIT = EM_CUIT ' +
                         'AND PM_IDMEDIACION = ME_ID ' +
                          'AND ME_IDEXPEDIENTE = EX_ID ' +
                       'UNION ' +
                      'SELECT TRIM(MAX(PR_CHEQUENOMBRE)) NOMTRAB, ' +
                             'MAX(DECODE(PR_ACREEDOR, ''TA'', TJ_DOCUMENTO, PR_CUITCUIL)) DOCTRAB, ' +
                             'MAX(CE_NUMERO) NROCHEQUE, MAX(CE_MONTO) IMPORTE, TRIM(MAX(BA_NOMBRE)) BANCO, MAX(PR_CONPAGO) CONPAGO, ' +
                             'TRIM(MAX(CP_DENPAGO)) DESCRCONPAGO, MAX(EM_CUIT) CUITEMPR, 3 ORDEN, ' +
                             'TRIM(MAX(EM_NOMBRE)) NOMEMPR, TRIM(MAX(CE_METODOPAGO)) METODOPAGO, ''prestación dineraria'' TIPO ' +
                        'FROM AEM_EMPRESA, ART.SCP_CONPAGO, ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SEX_EXPEDIENTES, ' +
                             'RCE_CHEQUEEMITIDO, ART.SPR_PAGOEXPESIN ' +
                       'WHERE CE_ID = :IdCheque ' +
                         'AND PR_IDCHEQUEEMITIDO = CE_ID ' +
                         'AND PR_SINIESTRO = EX_SINIESTRO ' +
                         'AND PR_ORDEN = EX_ORDEN ' +
                         'AND PR_RECAIDA = EX_RECAIDA ' +
                         'AND EX_CUIL = TJ_CUIL ' +
                         'AND CE_IDCUENTABANCARIA = CB_ID ' +
                         'AND CB_IDBANCO = BA_ID ' +
                         'AND PR_CONPAGO = CP_CONPAGO ' +
                         'AND EX_CUIT = EM_CUIT ' +
                         'AND PR_CONPAGO = 239) ' +  // COMPENSACION POR DAÑOS
               'WHERE NOMTRAB IS NOT NULL ' +
               'ORDER BY ORDEN';

      with GetQueryEx(sSql, [IdCheque]) do
        try
          if FieldByName('NROCHEQUE').IsNull then
            MsgBox('No se ha encontrado la liquidación para el cheque Nro. ' + IntToStr(IdCheque), MB_ICONERROR)
          else
            begin
              Fecha          := DBDate();
              ShowReferencia := False;
              ShowLogoGBP    := False;

              Destinatario := 'Señores ' + Get_NombreBancoCompleto(FieldByName('BANCO').AsString);
              bEmpresa     := (FieldByName('CONPAGO').AsString = CONCEPTO_ILT_REINTEGRO);

              sTexto := sTexto + 'Por la presente certificamos que el pago a percibir por ';
              if bEmpresa then
                sTexto := sTexto + FieldByName('NOMEMPR').AsString + ', CUIT ' + PonerGuiones(FieldByName('CUITEMPR').AsString)
              else
                sTexto := sTexto + 'el Sr/a ' + FieldByName('NOMTRAB').AsString + ', DNI ' + FieldByName('DOCTRAB').AsString;

              sTexto := sTexto + ', librado con ' + FieldByName('METODOPAGO').AsString + ' N° ' + FieldByName('NROCHEQUE').AsString +
                                 ' por la suma de ' + Get_AjusteDecimales(FieldByName('IMPORTE').AsString, '$', 2) +
                                 ' corresponde a una ' + FieldByName('TIPO').AsString + ' en concepto de ' +
                                 FieldByName('DESCRCONPAGO').AsString + ' regulada por la ley 24.557.' + CRLF + CRLF;

              sTexto := sTexto + 'Asimismo, y atento a la comunicación del BCRA A N° 5218 Art. 2.2.4, ' +
                                  'se le solicita abonar al beneficiario el total de los fondos ' +
                                  'puestos a disposición por esta ART.' + CRLF + CRLF;

              sTexto := sTexto + 'Se deja constancia que el presente pago está excluido ' +
                                 'del impuesto sobre los Créditos y Débitos en Cuentas Bancarias, ' +
                                 'según lo normado en el art. 8 del Decreto 1694/2009.';

              qrTexto.Lines.Text := sTexto;

              rpt.Print;
            end;
        finally
          Free;
        end;
    finally
      Free;
    end;
end;

end.

