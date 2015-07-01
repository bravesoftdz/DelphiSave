unit unRptTransferenciasBAPROPagoElectr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt, ArtQReports;

type
  TfrmRptTransferenciasBAPROPagoElectr = class(TForm)
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
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlOP: TQRLabel;
    QRLabel16: TQRLabel;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    qrlCUITART: TQRLabel;
    qrlDireccionART: TQRLabel;
    qrlTelefonoART: TQRLabel;
    QRLabel5: TQRLabel;
    qrlPciaART: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    qrlSubTitu: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrNroTransferencia: TQRLabel;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
    class function DoImprimir(IdTransf: TTableId): Boolean;
    class procedure DoImprimirBAPROPagoElectronico(IdTransf: TTableId);
  end;

var
  frmRptTransferenciasBAPROPagoElectr: TfrmRptTransferenciasBAPROPagoElectr;

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs, General, unComunes, CustomDlgs,
  DateTimeFuncs, unTesoreria, AnsiSql, unDmFinancials, Cuit;

{$R *.dfm}

{------------------------------------------------------------------------------}
class function TfrmRptTransferenciasBAPROPagoElectr.DoImprimir(IdTransf: TTableId): Boolean;
var
  sCodBarras, sGrupoPago, sCuenta, sSolicitud, sSql: String;
  Resultados: TResultados;
begin
  with TfrmRptTransferenciasBAPROPagoElectr.Create(nil) do
    try
      sSql := 'SELECT ORDENPAGO, MIN(SINIESTRO) SINIESTRO, MIN(CONCEPTO) CONCEPTO, MIN(BENEFICIARIO) BENEFICIARIO, MIN(IMPORTE) IMPORTE, ' +
                     'MIN(CBU) CBU ' +
                'FROM (' +
                 'SELECT CE_ORDENPAGO ORDENPAGO, ' +
                        'ART.UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, ''/'') SINIESTRO, ' +
                        'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(LE_SINIESTRO, LE_ORDEN, LE_RECAIDA, LE_NUMLIQUI), TJ_NOMBRE) BENEFICIARIO, ' +
                        'CE_MONTO IMPORTE, CP_DENPAGO CONCEPTO, ATTRIBUTE4 || ''-'' || ATTRIBUTE5 CBU ' +
                   'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SLE_LIQUIEMPSIN, RCE_CHEQUEEMITIDO, ' +
                        'PO_VENDORS@REALFCL ' +
                  'WHERE CE_ID = LE_IDCHEQUEEMITIDO ' +
                    'AND EX_SINIESTRO = LE_SINIESTRO ' +
                    'AND EX_ORDEN = LE_ORDEN ' +
                    'AND EX_RECAIDA = LE_RECAIDA ' +
                    'AND TJ_ID = EX_IDTRABAJADOR ' +
                    'AND CB_ID = CE_IDCUENTABANCARIA ' +
                    'AND BA_ID = CB_IDBANCO ' +
                    'AND LE_CONPAGO = CP_CONPAGO ' +
                    'AND VENDOR_ID = CE_IDPROVEEDOR ' +
                    'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                  'UNION ' +
                 'SELECT CE_ORDENPAGO ORDENPAGO, ' +
                        'ART.UTILES.ARMAR_SINIESTRO(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, ''/'') SINIESTRO, ' +
                        'NVL(ART.LIQ.GET_NOMBREBENEFICIARIOLIQ(PR_SINIESTRO, PR_ORDEN, PR_RECAIDA, PR_NUMPAGO, ''SPR''), TJ_NOMBRE) BENEFICIARIO, ' +
                        'CE_MONTO IMPORTE, CP_DENPAGO CONCEPTO, ATTRIBUTE4 || ''-'' || ATTRIBUTE5 CBU  ' +
                   'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, CTJ_TRABAJADOR, ART.SCP_CONPAGO, ART.SEX_EXPEDIENTES, ART.SPR_PAGOEXPESIN, RCE_CHEQUEEMITIDO, ' +
                        'PO_VENDORS@REALFCL ' +
                  'WHERE CE_ID = PR_IDCHEQUEEMITIDO ' +
                    'AND EX_SINIESTRO = PR_SINIESTRO ' +
                    'AND EX_ORDEN = PR_ORDEN ' +
                    'AND EX_RECAIDA = PR_RECAIDA ' +
                    'AND TJ_ID = EX_IDTRABAJADOR ' +
                    'AND CB_ID = CE_IDCUENTABANCARIA ' +
                    'AND BA_ID = CB_IDBANCO ' +
                    'AND PR_CONPAGO = CP_CONPAGO ' +
                    'AND VENDOR_ID = CE_IDPROVEEDOR ' +
                    'AND CE_IDTRANSFERENCIA = :IdTransferencia) ' +
            'GROUP BY ORDENPAGO ' +
            'ORDER BY ORDENPAGO';
      OpenQueryEx(sdqDatos, [IdTransf], sSql);

      Verificar(sdqDatos.Eof, nil, 'No se han encontrado datos.');

      sSql := 'SELECT DISTINCT CB_NUMERO CUENTA ' +
                'FROM ZCB_CUENTABANCARIA, RCE_CHEQUEEMITIDO ' +
               'WHERE CE_IDCUENTABANCARIA = CB_ID ' +
                 'AND CE_IDTRANSFERENCIA = :IdTransferencia';
      with GetQueryEx(sSql, [IdTransf]) do
        try
          Verificar(Eof, nil, 'No se han encontrado datos de la cuenta.');
          Verificar(RecordCount > 1, nil, 'Se ha encontrado más de una cuenta.');

          sCuenta    := FieldByName('CUENTA').AsString;
          // sGrupoPago := FieldByName('GRUPO_PAGO').AsString;
          sGrupoPago := 'SINIESTROS';   // por tk 57486
        finally
          Free;
        end;

      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrNroTransferencia.Caption := 'Nro. Transferencia: ' + IntToStr(IdTransf);
      qrlBanco.Caption           := 'Banco de la Provincia de Buenos Aires';
      qrlSubTitu.Caption         := 'At. Al Cliente';
      qrlAsunto.Caption          := 'Asunto: Transferencias';

      sSolicitud := 'Por la presente autorizamos a debitar, de nuestra cuenta corriente Nº ' + sCuenta + ', ' +
                    'en concepto de ' + sGrupoPago + ', las transferencias que se datallan a continuación.';

      qrmSolicitud.Lines.Text := sSolicitud;
      qrlCantCheques.Caption  := IntToStr(sdqDatos.RecordCount) + ' Pago/s';

      qrlCUITART.Caption      := 'CUIT: ' + PonerGuiones(ART_CUIT);
      qrlDireccionART.Caption := ART_DOMICILIO2 + ' (' + ART_CPOSTALA + ')';
      qrlPciaART.Caption      := ART_LOCALIDAD2;
      qrlTelefonoART.Caption  := TXT_EMP_TEL;

      sCodBarras        := Get_CodBarrasCarpetaTransferenciaBancaria(CodBanco_PciaBsAs, IdTransf);
      qrlNumero.Caption := sCodBarras;
      qrlBarras.Caption := '*' + qrlNumero.Caption + '*';

      Resultados := Visualizar(qrBancosPagoElectronico, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

      Result := (rImpresora in Resultados);
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
class procedure TfrmRptTransferenciasBAPROPagoElectr.DoImprimirBAPROPagoElectronico(IdTransf: TTableId);
begin
  if DoImprimir(IdTransf) then
    DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco_PciaBsAs, IdTransf, 'D');
end;
{------------------------------------------------------------------------------}
procedure TfrmRptTransferenciasBAPROPagoElectr.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{------------------------------------------------------------------------------}
end.

