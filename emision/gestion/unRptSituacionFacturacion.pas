unit unRptSituacionFacturacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRptCartaDocumento, DB, SDEngine, QuickRpt, QRCtrls, RxGIF,
  QrAngLbl, ArtQReports, ExtCtrls, unArt, unComunes, unRptCartaDocHeader,
  unCustomDataModule, unComunesGestion, unVisualizador, Printers,
  AnsiSql, unDmPrincipal, unExportPDF, Strfuncs, unSesion, CustomClasses,
  qrcb_run;

type
  TrptCartaSituacionFacturacion = class(TrptCartaDocumento)
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRCheckBox1: TQRCheckBox;
    QRCheckBox2: TQRCheckBox;
    QRCheckBox3: TQRCheckBox;
    QRCheckBox4: TQRCheckBox;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRCheckBox5: TQRCheckBox;
    QRCheckBox6: TQRCheckBox;
    QRCheckBox7: TQRCheckBox;
    QRLabel19: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRContratoCuitBarCode: TArtQRLabel;
    QRContratoCuit: TArtQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    procedure QRContratoCuitBarCodePrint(sender: TObject; var Value: String);
  private
    procedure ReplaceParam(aParam: String; aValor: String);
  public
    procedure LoadValues; override;
  end;

var
 DocAPresentar: TStringList;
 DocEntregada: String;

procedure DoImprimirCartaSitFacturacion(const aIdCarta: TTableId; aDocAPresentar: TStringList;
                                        const aDocEntregada: String; const aActualizarDatos: TTipoModulo;
                                        const aAction: TSalidaReport = srPrint; const aTransactionMode: TTransactionMode = tmNone;
                                        const aCantidadCopias: Integer = -1; const aActualizarEndosoReimpresion: Boolean = False;
                                        const aImprimir_Firma: Boolean = True; const aEstadoCuentaCartaComercial: Boolean = False;
                                        const aImprimirFirmaSoloAlFinal: Boolean = False; const aImprimirDNI: Boolean = True;
                                        const aMostrarLogo: Boolean = False; const aForzarFirmantePie: Boolean = False;
                                        const aImprimirDelegacion: Boolean = False; const aEsSinGobernacion: Boolean = False;
                                        const aEsDomicilioPostal: Boolean = False; const aImprimirCodFirma: Boolean = False;
                                        const aImprimirSoloOrden: Boolean = False; const aMostrarInfoPie: Boolean = False;
                                        const aCodTextoCartaInfoPie: String = ''; const aSoloVisualizar: Boolean = False;
                                        const aDeshabilitarImpresion: Boolean = False; const aPdfFileName: String = '';
                                        const aImprimirFirmanteOrig: Boolean = False);

implementation

{$R *.dfm}

{ TrptCartaSituacionFacturacion }

procedure TrptCartaSituacionFacturacion.LoadValues;
begin
  inherited;
  if Assigned(DocAPresentar) then
    ReplaceParam('DOCUMENTACION_A_PRESENTAR', DocAPresentar.Text);
  ReplaceParam('DOCUMENTACION_ENTREGADA', DocEntregada);
  //Sale sin firma
  ClearFirma;
  qrbPageFooter.Height :=  qrbPageFooter.Height + 50;
  qrbPageFooter.Enabled := true;
end;


procedure DoImprimirCartaSitFacturacion(const aIdCarta: TTableId; aDocAPresentar: TStringList;
                                        const aDocEntregada: String; const aActualizarDatos: TTipoModulo;
                                        const aAction: TSalidaReport = srPrint; const aTransactionMode: TTransactionMode = tmNone;
                                        const aCantidadCopias: Integer = -1; const aActualizarEndosoReimpresion: Boolean = False;
                                        const aImprimir_Firma: Boolean = True; const aEstadoCuentaCartaComercial: Boolean = False;
                                        const aImprimirFirmaSoloAlFinal: Boolean = False; const aImprimirDNI: Boolean = True;
                                        const aMostrarLogo: Boolean = False; const aForzarFirmantePie: Boolean = False;
                                        const aImprimirDelegacion: Boolean = False; const aEsSinGobernacion: Boolean = False;
                                        const aEsDomicilioPostal: Boolean = False; const aImprimirCodFirma: Boolean = False;
                                        const aImprimirSoloOrden: Boolean = False; const aMostrarInfoPie: Boolean = False;
                                        const aCodTextoCartaInfoPie: String = ''; const aSoloVisualizar: Boolean = False;
                                        const aDeshabilitarImpresion: Boolean = False; const aPdfFileName: String = '';
                                        const aImprimirFirmanteOrig: Boolean = False);
 var
  EsCartaDocumento: Boolean;
  NroImpresora: Integer;
  rptCartaSituacionFacturacion: TrptCartaSituacionFacturacion;
  sSql: String;
  sTipoSalida: String;
  vResultados: TResultados;
begin
  DocAPresentar := aDocAPresentar;
  if (aDocEntregada = '') then
    DocEntregada := '-'
  else
    DocEntregada := aDocEntregada;
  if (aActualizarEndosoReimpresion) and ((AAction = srPreview) or ((AAction = srPrint) and (not aSoloVisualizar) and
     (not aDeshabilitarImpresion))) then
    DoActualizarEndosoReimpresion(AIdCarta, aTransactionMode);

  // Este llamado tiene que estar afuera del with para que la referencia se haga a la unidad Printers
  NroImpresora      := Printer.PrinterIndex;

  rptCartaSituacionFacturacion := TrptCartaSituacionFacturacion.Create(nil);

  with rptCartaSituacionFacturacion do
  try
    ImprimirFirmanteOrig     := aImprimirFirmanteOrig;
    EsSinGobernacion         := aEsSinGobernacion;
    ImprimirDNI              := aImprimirDNI;
    ImprimirFirmaSoloAlFinal := aImprimirFirmaSoloAlFinal;
    EsDomicilioPostal        := aEsDomicilioPostal;
    ImprimirCodFirma         := aImprimirCodFirma;
    ImprimirSoloOrden        := aImprimirSoloOrden;
    PuedeImprimir            := not aSoloVisualizar;
    TransactionMode          := aTransactionMode;

    if aMostrarInfoPie then
      SetInfoPie(aCodTextoCartaInfoPie);

    Modulo := AActualizarDatos;

    sSql := 'SELECT ca_tiposalida' +
             ' FROM cca_carta' +
            ' WHERE ca_id = ' + SqlValue(AIdCarta);
    sTipoSalida      := ValorSql(sSql);
    EsCartaDocumento := (sTipoSalida = SALIDA_CARTADOCUMENTO);

    ForzarFirmantePie := aForzarFirmantePie;
    MostrarLogo       := aMostrarLogo;

    if aEstadoCuentaCartaComercial then     // area cobranzas, carta comercial del estado de cuenta
    begin
      ForzarFirmantePie := True;  // fuerza que salgan los datos del firmante
      MostrarLogo       := True;  // muestra el logo
    end;

    //Muestro la carta documento
    ImprimirFirma         := aImprimir_Firma;
    IdCarta               := AIdCarta;
    ImprimirDelegOrden    := EsCartaDocumento and aImprimirDelegacion;
    ImprimirLeyendaAcuse  := True;   // por ahora, se imprime siempre que esté cargado el campo

    // Calculo el tamaño del detalle si es una carta donde se muestra la firma solo al final..
    if ImprimirFirmaSoloAlFinal then
    begin
      // El RightMargin lo seteo aca porque al momento de hacer esto la única carta que entra por aca es la de Bienvenida,
      // el resto de las cartas se puede desajustar si se setea el RightMargin en forma genérica..
      Page.RightMargin := 15;
      Page.TopMargin := 5;
      qrbDetail.Height := 600;
      with qrrTexto do
      begin
        Left   := 0;
        Top    := 3;
        Width  := 695;
        Height := 590;
      end;
    end;

    PrinterSettings.PrinterIndex := NroImpresora;
    if aCantidadCopias <> -1 then
      PrinterSettings.Copies := aCantidadCopias
    else if EsCartaDocumento then
      PrinterSettings.Copies := 3;

    if aAction = srPdf then
    begin
      FileToPDFSvr(rptCartaSituacionFacturacion, ExtractFileDir(aPdfFileName), aPdfFileName, True);
      DoActualizarDatosImpresionCartaDocumento(IdCarta);
    end
    else if aAction = srPrint then
      Print
    else
    begin
      if IsEmptyString(rptCartaSituacionFacturacion.ReportTitle) then   // WF 7946
      begin
        if EsCartaDocumento then
          rptCartaSituacionFacturacion.ReportTitle := 'Carta documento'
        else
          rptCartaSituacionFacturacion.ReportTitle := 'Carta comercial';
      end;

      if EsCartaDocumento then
      begin
        if aDeshabilitarImpresion then
          Visualizar(rptCartaSituacionFacturacion, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma, oMailNotAllowed,
                                                       oExportPDFNotAllowed, oExportDOCNotAllowed, oExportXLSNotAllowed,
                                                       oFaxNotAllowed, oPrintNotAllowed])
        else
          Visualizar(rptCartaSituacionFacturacion, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma,
                                                       oMailNotAllowed, oExportPDFNotAllowed, oFaxNotAllowed,
                                                       oExportDOCNotAllowed, oExportXLSNotAllowed])
      end
      else
      begin
        if aDeshabilitarImpresion then
          vResultados := Visualizar(rptCartaSituacionFacturacion, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma,
                                                                      oMailNotAllowed, oExportPDFNotAllowed,
                                                                      oExportDOCNotAllowed, oExportXLSNotAllowed,
                                                                      oFaxNotAllowed, oPrintNotAllowed])
        else
          vResultados := Visualizar(rptCartaSituacionFacturacion, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma, oForceShowModal]);


        if rMail in vResultados then  // si se envio el mail, se guardan los datos de auditoria en la cca_carta. WF 7946
        begin
          sSql := 'UPDATE cca_carta ' +
                    ' SET ca_fechamail = art.actualdate, ' +
                        ' ca_usumail = ' + SqlValue(Sesion.UserID) +
                  ' WHERE ca_id = ' + SqlInt(AIdCarta);
          EjecutarSqlST(sSql);
        end;

      end;
    end;
    SaveBlob('SELECT ca_textofinal FROM cca_carta WHERE ca_id = ' + SqlInt(AIdCarta),
             'UPDATE cca_carta SET ca_textofinal  = :CA_TEXTOFINAL WHERE ca_id = ' + SqlInt(AIdCarta),
             'CA_TEXTOFINAL', qrrTexto.Lines);
  finally
    Printers.Printer.Copies := 1;
//    Free;
  end;
end;

procedure TrptCartaSituacionFacturacion.ReplaceParam(aParam: String; aValor: String);
var
  RStrm: TReplaceStream;
begin
  //Reemplazo los parametros manuales
  RStrm := TReplaceStream.Create;
  try
    RStrm.Find.Add('<<' + aParam + '>>');
    RStrm.Replace.Add(aValor);
    qrrTexto.Lines.SaveToStream(RStrm);
    RStrm.Seek(0, soFromBeginning);
    qrrTexto.Lines.LoadFromStream(RStrm);
  finally
    RStrm.free;
  end;
end;

procedure TrptCartaSituacionFacturacion.QRContratoCuitBarCodePrint(
  sender: TObject; var Value: String);
var
  NroContrato: String;
  Cuit: String;
  sSql: String;
begin
  // el nro. de contrato solo sale en las cartas doc. de afiliaciones y de cobranzas y de Emision
  sSql := 'SELECT EN_CONTRATO, EM_CUIT ' +
            'FROM AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, AEN_ENDOSO, CAT_AREATEXTO, CCA_CARTA ' +
           'WHERE CA_IDAREATEXTO=AT_ID ' +
             'AND NVL(CA_IDENDOSOREIMPRESION, CA_IDENDOSO) = EN_ID ' +
             'AND EN_CONTRATO = CO_CONTRATO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_COB) + ', ' + SqlValue(AREA_EMI) + ') ' +
             'AND CA_ID=' + SqlValue(IdCarta);

  with ValoresColSQL(sSql) do
  try
    NroContrato := Strings[0];
    Cuit := Strings[1];
  finally
    free;
  end;

  if NroContrato <> '' then
  begin
    Value := '*' + NroContrato + ' ' +  Cuit + '*';
    QRContratoCuit.Caption := NroContrato + ' ' +  Cuit;
  end
  else begin
    Value := '';
    QRContratoCuit.Caption := '';
  end;
end;

end.
