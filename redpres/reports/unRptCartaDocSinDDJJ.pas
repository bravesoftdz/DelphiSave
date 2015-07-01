unit unRptCartaDocSinDDJJ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, QuickRpt, RxGIF,
  QRCtrls, QrAngLbl, ArtQReports, ExtCtrls, Db, SDEngine, unArt, unComunes, unCustomDataModule;

type
  TrptCartaDocSinDDJJ = class(TrptCartaDocHeader)
    QRBand1: TQRBand;
    sdqSiniestros: TSDQuery;
    dsSiniestros: TDataSource;
    qrmTexto: TQRMemo;
    sdqSiniestrosSINIESTRO: TStringField;
    sdqSiniestrosEX_FECHAACCIDENTE: TDateTimeField;
    sdqSiniestrosSC_RECIBODESDE: TStringField;
    sdqSiniestrosSC_RECIBOHASTA: TStringField;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape2: TQRShape;
    QRMemo1: TQRMemo;
    sdqSiniestrosTRABAJADOR: TStringField;
    qrlSiniestros: TQRLabel;
  private
  public
  end;

var
  rptCartaDocSinDDJJ: TrptCartaDocSinDDJJ;

procedure DoImprimirCartaSinDDJJ(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                 aTransactionMode: TTransactionMode = tmNone; CantidadCopias: Integer = -1;
                                 Imprimir_Firma: Boolean = True; aEsDomicilioPostal: Boolean = False;
                                 bEsSinGobernacion: Boolean = False);

implementation

uses
  unDmPrincipal, StrFuncs, Printers, AnsiSql;

{$R *.DFM}


procedure DoImprimirCartaSinDDJJ(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                 aTransactionMode: TTransactionMode = tmNone; CantidadCopias: Integer = -1;
                                 Imprimir_Firma: Boolean = True; aEsDomicilioPostal: Boolean = False;
                                 bEsSinGobernacion: Boolean = False);
var
  EsCartaDocumento: Boolean;
  NroImpresora: Integer;
  sSiniestros: String;
begin
  NroImpresora := Printer.PrinterIndex;

  with TrptCartaDocSinDDJJ.Create(nil) do
  try
    Modulo            := taDinerarias;
    TransactionMode   := aTransactionMode;
    EsCartaDocumento  := (ValorSql('SELECT ca_tiposalida ' +
                                    ' FROM cca_carta ' +
                                   ' WHERE ca_id = ' + IntToStr(AIdCarta))=SALIDA_CARTADOCUMENTO);

    if not EsCartaDocumento then   // carta comercial
    begin
      MostrarLogo       := True;
      ForzarFirmantePie := True;
    end;

    with sdqSiniestros do
    begin
      Close;
      ParamByName('pIdCarta').AsInteger := AIdCarta;
      Open;
      while not Eof do
      begin
        sSiniestros := sSiniestros + '-' + sdqSiniestrosSINIESTRO.AsString;
        Next;
      end;
    end;

    CodigoRemitente := ValorSql( ' SELECT at_codigoremitente ' +        // Lu 12/05/11 (arreglo de EGuerrero) no salia el codigoremitente
                                   ' FROM comunes.cht_historicotextocarta, cca_carta, cat_areatexto ' +
                                  ' WHERE ca_idhistoricotextocarta = ht_id ' +
                                    ' AND ca_idareatexto = at_id ' +
                                    ' AND ca_id = ' + SqlValue(AIdCarta));
    RemitenteCorreo := (CodigoRemitente <>'');

    // Lu 20/08
    EsSinGobernacion      := bEsSinGobernacion;
    EsDomicilioPostal     := aEsDomicilioPostal;
    ImprimirFirma         := Imprimir_Firma;
    IdCarta               := AIdCarta;
    qrbPageFooter.Height  := 50;
    qrlSiniestros.Caption := Copy(sSiniestros, 2, Length(sSiniestros));

    //Muestro la carta documento
    PrinterSettings.PrinterIndex := NroImpresora;
    if CantidadCopias <> -1 then
      PrinterSettings.Copies := CantidadCopias
    else if EsCartaDocumento then
      PrinterSettings.Copies := 3;

    if AAction = srPrint then
      Print
    else
      PreviewModal;
  finally
    Printers.Printer.Copies := 1;
    Free;
  end;
end;

end.
