unit unRptCartaDocCompensacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, QRCtrls, QuickRpt,
  ArtQReports, ExtCtrls, Db, SDEngine, unArt, unComunes, unCustomDataModule, RxGIF, QrAngLbl;

type
  TrptCartaDocCompensacion = class(TrptCartaDocHeader)
    sdqEmpresa: TSDQuery;
    sdqSiniestros: TSDQuery;
    sdqDeudas: TSDQuery;
    GroupFooter_EstadoDeDeuda: TQRBand;
    qrlTotDeuda: TQRLabel;
    QRLabel16: TQRLabel;
    SubDetail_EstadoDeCuenta: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBT_Deuda: TQRDBText;
    GroupHead_EstadoDeDeuda: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRMemo2: TQRMemo;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    qrbFirma: TQRChildBand;
    qrmMemoFinal: TQRMemo;
    GroupFooter_EstSinLiq: TQRBand;
    qrlTotSiniestros: TQRLabel;
    QRLabel17: TQRLabel;
    qrlSaldo: TQRLabel;
    qrlReferencia: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    GroupHead_EstSinLiq: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure QRDBT_DeudaPrint(Sender: TObject; var Value: String);
    procedure QRDBText13Print(Sender: TObject; var Value: String);
    procedure qrlSaldoPrint(Sender: TObject; var Value: String);
    procedure qrlTotDeudaPrint(Sender: TObject; var Value: String);
    procedure qrlTotSiniestrosPrint(Sender: TObject; var Value: String);
    procedure QRLabel19Print(Sender: TObject; var Value: String);
    procedure FormatearImportes(Sender: TObject; var Value: String);
  private
    cTotDeuda: Currency;
    cTotSiniestros: Currency;
    FDatosActuales: Boolean;

    function GetModulo: String;
    procedure SetDatosActuales(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    procedure LoadValues; override;
    property DatosActuales: Boolean read FDatosActuales write SetDatosActuales;
  end;

procedure ImprimirProcesoCompensacion(IdCompensacion: TTableId; Imprimir_Firma: Boolean; aTransactionMode: TTransactionMode = tmBeginEnd);

procedure Do_ImprimirCartaCompensacion(var CantidadCopias: Integer; AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                       aTransactionMode: TTransactionMode = tmNone;
                                       ActualizarEndosoReimpresion: Boolean = False; Imprimir_Firma: Boolean = True;
                                       MostrarPrinterSetUp: Boolean = False);

implementation

uses
  unDmPrincipal, General, DateTimeFuncs, StrFuncs, Printers, AnsiSql;

{$R *.DFM}


procedure ImprimirProcesoCompensacion(IdCompensacion: TTableId; Imprimir_Firma: Boolean; aTransactionMode: TTransactionMode = tmBeginEnd);
var
  iCantCopias: Integer;
begin
  iCantCopias := 1;
  with GetQueryEx('SELECT CC_IDCARTA FROM ZCC_COMPENSACIONCONTRATO WHERE CC_IDCOMPENSACION = :P1 AND CC_IDCARTA IS NOT NULL', [IdCompensacion]) do
    try
      while not Eof do
        begin
          Do_ImprimirCartaCompensacion(iCantCopias, Fields[0].AsInteger, srPrint, aTransactionMode, False, Imprimir_Firma, True);

          Next;
        end;
    finally
      Free;
    end;
end;

procedure Do_ImprimirCartaCompensacion(var CantidadCopias: Integer; AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                       aTransactionMode: TTransactionMode = tmNone;
                                       ActualizarEndosoReimpresion: Boolean = False; Imprimir_Firma: Boolean = True;
                                       MostrarPrinterSetUp: Boolean = False);
var
  EsCartaDocumento: Boolean;
  NroImpresora: Integer;
  rep: TrptCartaDocCompensacion;
begin
  if ActualizarEndosoReimpresion then
    DoActualizarEndosoReimpresion(AIdCarta, aTransactionMode);

  //Este llamado tiene que estar afuera del with para que la referencia se haga a la unidad Printers
  NroImpresora := Printer.PrinterIndex;

  rep := TrptCartaDocCompensacion.Create(nil);
  with rep do
  try
    IdCarta := aIdCarta;
    Modulo := taCobranzas;
    TransactionMode := aTransactionMode;
    DatosActuales := ActualizarEndosoReimpresion;

    //Muestro la carta documento
    EsCartaDocumento := (ValorSql('SELECT CA_TIPOSALIDA FROM CCA_CARTA WHERE CA_ID = ' + IntToStr(AIdCarta)) = SALIDA_CARTADOCUMENTO);

    if not EsCartaDocumento then   // carta comercial
      begin
        MostrarLogo       := True;
        ForzarFirmantePie := True;
      end;

    ImprimirFirma := Imprimir_Firma;
    IdCarta       := AIdCarta;

    if MostrarPrinterSetUp then
      begin
        Prepare;

        if CantidadCopias > 0 then
          PrinterSettings.Copies := CantidadCopias;

        QRPrinter.PrintSetup;
        if Tag = 0 then
          CantidadCopias := PrinterSettings.Copies;
      end;

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

{ TrptCartaDocCompensacion }
procedure TrptCartaDocCompensacion.LoadValues;
begin
  inherited; { Carga el formato, domicilio... }

  sdqEmpresa.Params[0].Value := IdCarta;
  OpenQuery(sdqEmpresa);

  sdqDeudas.Params[0].Value := IdCarta;
  OpenQuery(sdqDeudas);

  sdqSiniestros.Params[0].Value := IdCarta;
  OpenQuery(sdqSiniestros);
end;

procedure TrptCartaDocCompensacion.QRDBT_DeudaPrint(Sender: TObject; var Value: String);
begin
  cTotDeuda := cTotDeuda + sdqDeudas.FieldByName('DEUDA').AsCurrency;
  FormatearImportes(Sender, Value);
end;

procedure TrptCartaDocCompensacion.QRDBText13Print(Sender: TObject; var Value: String);
begin
  cTotSiniestros := cTotSiniestros + sdqSiniestros.FieldByName('LE_IMPORPERI').AsCurrency;
  FormatearImportes(Sender, Value);
end;

procedure TrptCartaDocCompensacion.qrlSaldoPrint(Sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00', Abs(cTotDeuda - cTotSiniestros));

  If cTotDeuda > cTotSiniestros then
    qrlReferencia.Caption := 'A Favor de Provincia ART'
  else
    qrlReferencia.Caption := 'A Vuestro Favor';

  qrmMemoFinal.Lines.Clear;

  if GetModulo = MODULO_COMPENSACIONDEUDA then
  begin
    if cTotDeuda > cTotSiniestros then
    begin
      qrlReferencia.Caption := 'A Favor de Provincia ART';
      qrmMemoFinal.Lines.Add('Intimamos formalmente el pago de la deuda determinada dentro ' +
                             'del plazo de 15 (quince) días corridos a partir de la recepción ' +
                             'de la presente. Adicione los intereses resarcitorios desde la fecha de vencimiento ' +
                             'de cada cuota, los mismos son del 3% hasta el 30/11/1996, del 2% desde el 1/12/1996 y del ' +
                             '3% desde el 1/10/1998. Bajo apercibimiento de hacer efectivo ' +
                             'lo dispuesto en el Artículo 18 Decreto Nº 334/96, reglamentario del Artículo Nº 28, apartado ' +
                             '4 de la Ley de Riesgos del Trabajo Nº 24.557.' );
      qrmMemoFinal.Lines.Add('Por tal motivo, sirva la presente como Carta de Pago o Extinción de Deuda por el importe de $ ' + FormatFloat('#,##0.00', cTotSiniestros ) + '.');
    end
    else
    begin
      qrlReferencia.Caption := 'A Vuestro Favor';
      qrmMemoFinal.Lines.Add('Queda a vuestro favor, encontrándose el importe mencionado a Vtra. disposición.');
      qrmMemoFinal.Lines.Add('Por tal motivo, sirva la presente como Carta de Pago o Extinción de Deuda por el importe de $ '+FormatFloat('#,##0.00', cTotDeuda ) + '.');
    end;
    qrmMemoFinal.Lines.Add('Quedamos a Vtra. disposición, y a los efectos de cualquier consulta sobre el particular, ' +
                           'comunicarse al teléfono 4819-2800 y hacer mención de la referencia CS/' + FloatToStr(sdqEmpresa.FieldByName('CC_IDCOMPENSACION').AsCurrency) + '.');
  end
  else
  begin
    qrmMemoFinal.Lines.Add('Sirva la presente como carta de pago o extinción de deuda por el importe de $' + IIF(cTotDeuda > cTotSiniestros, FormatFloat('#,##0.00', cTotSiniestros), FormatFloat('#,##0.00', cTotDeuda)) + '.');
    qrmMemoFinal.Lines.Add('Atentamente');
  end;

  cTotDeuda := 0;
  cTotSiniestros := 0;
end;

procedure TrptCartaDocCompensacion.qrlTotDeudaPrint(Sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00', cTotDeuda);
end;

procedure TrptCartaDocCompensacion.qrlTotSiniestrosPrint(Sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00', cTotSiniestros);
end;

constructor TrptCartaDocCompensacion.Create(AOwner: TComponent);
begin
  inherited;
  Modulo              := taCobranzas;
  cTotDeuda           := 0;
  cTotSiniestros      := 0;
end;

function TrptCartaDocCompensacion.GetModulo: String;
begin
  Result := ValorSqlEx('SELECT AT_MODULO' +
                        ' FROM CCA_CARTA, CAT_AREATEXTO' +
                       ' WHERE CA_IDAREATEXTO = AT_ID' +
                         ' AND CA_ID = :CA_ID', [IdCarta]);
end;

procedure TrptCartaDocCompensacion.QRLabel19Print(Sender: TObject; var Value: String);
begin
  if DatosActuales then
    Value := Value + Get_FechaFormatoLargo()
  else
    Value := Value + Get_FechaFormatoLargo(sdqEmpresa.FieldByName('FECHA').AsDateTime);
end;

procedure TrptCartaDocCompensacion.FormatearImportes(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TrptCartaDocCompensacion.SetDatosActuales(const Value: Boolean);
begin
  FDatosActuales := Value;
end;

end.

