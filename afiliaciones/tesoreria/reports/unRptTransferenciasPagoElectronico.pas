unit unRptTransferenciasPagoElectronico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt, ArtQReports;

type
  TfrmRptTransferenciasPagoElectronico = class(TForm)
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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlOP: TQRLabel;
    QRLabel16: TQRLabel;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
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
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrNroTransferencia: TQRLabel;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    qrlSubTituDir: TQRLabel;
    qrlProducto: TQRLabel;
    qrlTitBanco1: TQRLabel;
    qrlImpBanco1: TQRLabel;
    qrlTitBanco2: TQRLabel;
    qrlImpBanco2: TQRLabel;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
    class function DoImprimir(IdTransf: TTableId): Boolean;
    class procedure DoImprimirTransferenciaPagoElectronico(IdTransf: TTableId);
  end;

var
  frmRptTransferenciasPagoElectronico: TfrmRptTransferenciasPagoElectronico;

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs, General, unComunes, CustomDlgs,
  DateTimeFuncs, unTesoreria, AnsiSql, unDmFinancials, Cuit;

{$R *.dfm}

{------------------------------------------------------------------------------}
class function TfrmRptTransferenciasPagoElectronico.DoImprimir(IdTransf: TTableId): Boolean;
var
  sCodBarras, sCuenta, sSolicitud, sSql: String;
  Resultados: TResultados;
  dImporte: Currency;
begin
  with TfrmRptTransferenciasPagoElectronico.Create(nil) do
    try
      sSql := 'SELECT CE_ORDENPAGO ORDENPAGO, CE_BENEFICIARIO BENEFICIARIO, VAT_REGISTRATION_NUM CUIT, ' +
                     'ATTRIBUTE4 || ''-'' || ATTRIBUTE5 CBU, CE_MONTO IMPORTE ' +
                'FROM RCE_CHEQUEEMITIDO, PO_VENDORS@REALFCL ' +
               'WHERE VENDOR_ID = CE_IDPROVEEDOR ' +
                 'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
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

          sCuenta := FieldByName('CUENTA').AsString;
        finally
          Free;
        end;

      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrNroTransferencia.Caption := 'Nro. Transferencia: ' + IntToStr(IdTransf);
      qrlBanco.Caption           := 'Banco Santander Río S.A.';
      qrlSubTitu.Caption         := 'Casa Central (00)';
      qrlSubTituDir.Caption      := 'Bmé. Mitre 480, CABA';
      qrlProducto.Caption        := 'Producto: ' + Iif(sCuenta = '310514', 'Pago Personalizado', 'Pago Proveedores');
      qrlAsunto.Caption          := 'Asunto: Transferencias Electrónicas';

      sSolicitud := 'Por la presente autorizamos a debitar de nuestra cuenta corriente Nº ' + sCuenta + ', ' +
                    'en el día de la fecha, el importe total de Pagos Electrónicos que se detallan a continuación, ' +
                    'para ser acreditados en las correspondientes cuentas bancarias.';

      qrmSolicitud.Lines.Text := sSolicitud;
      qrlCantCheques.Caption  := IntToStr(sdqDatos.RecordCount) + ' Pago/s';

      sSql := 'SELECT NVL(SUM(CE_MONTO), 0) ' +
                'FROM RCE_CHEQUEEMITIDO, PO_VENDORS@REALFCL PV ' +
               'WHERE VENDOR_ID = CE_IDPROVEEDOR ' +
                 'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                 'AND SUBSTR(PV.ATTRIBUTE4, 1, 3) = :CodBanco';
      dImporte := ValorSqlExtendedEx(sSql, [IdTransf, CodBanco_SantanderRio]);

      qrlTitBanco1.Caption := 'Banco Río - Pagos por:';
      qrlImpBanco1.Caption := Get_AjusteDecimales(FloatToStr(dImporte), '$');

      sSql := 'SELECT NVL(SUM(CE_MONTO), 0) ' +
                'FROM RCE_CHEQUEEMITIDO, PO_VENDORS@REALFCL PV ' +
               'WHERE VENDOR_ID = CE_IDPROVEEDOR ' +
                 'AND CE_IDTRANSFERENCIA = :IdTransferencia ' +
                 'AND SUBSTR(PV.ATTRIBUTE4, 1, 3) <> :CodBanco';
      dImporte := ValorSqlExtendedEx(sSql, [IdTransf, CodBanco_SantanderRio]);

      qrlTitBanco2.Caption := 'Otros Bancos - Pagos por:';
      qrlImpBanco2.Caption := Get_AjusteDecimales(FloatToStr(dImporte), '$');

      qrlCUITART.Caption      := 'CUIT: ' + PonerGuiones(ART_CUIT);
      qrlDireccionART.Caption := ART_DOMICILIO2 + ' (' + ART_CPOSTALA + ')';
      qrlPciaART.Caption      := ART_LOCALIDAD2;
      qrlTelefonoART.Caption  := TXT_EMP_TEL;

      sCodBarras        := Get_CodBarrasCarpetaTransferenciaBancaria(CodBanco_SantanderRio, IdTransf);
      qrlNumero.Caption := sCodBarras;
      qrlBarras.Caption := '*' + qrlNumero.Caption + '*';

      Resultados := Visualizar(qrBancosPagoElectronico, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

      Result := (rImpresora in Resultados);
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
class procedure TfrmRptTransferenciasPagoElectronico.DoImprimirTransferenciaPagoElectronico(IdTransf: TTableId);
begin
  if DoImprimir(IdTransf) then
    DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco_SantanderRio, IdTransf, 'T');
end;
{------------------------------------------------------------------------------}
procedure TfrmRptTransferenciasPagoElectronico.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{------------------------------------------------------------------------------}
end.

