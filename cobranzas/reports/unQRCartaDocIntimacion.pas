unit unQRCartaDocIntimacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, QRCtrls, QuickRpt,
  ArtQReports, ExtCtrls, unArt, unComunes, Db, SDEngine, unCustomDataModule, RxGIF, QrAngLbl;

type         
  TQRCartaDocIntimacion = class(TrptCartaDocHeader)
    QRBandReferencia: TQRBand;
    QRLabel1: TQRLabel;
    sdqReferencia: TSDQuery;
    qrdbLugarFecha: TQRDBText;
    qrlGestor: TQRLabel;
    qrlNroContrato: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCodFormatoTexto: TQRLabel;
    qrdbGestor: TQRDBText;
    qrdbNroContrato: TQRDBText;
    qrdbCUIT: TQRDBText;
    qrdbEmpresa: TQRDBText;
    sdqTexto: TSDQuery;
    QRMemo1: TQRMemo;
    sdqPeriodos: TSDQuery;
    qrmTextoSup: TQRMemo;
    QRBandPeriodos: TQRBand;
    qrdbPeriodo: TQRDBText;
    qrdbVencimiento: TQRDBText;
    qrdbDevengado: TQRDBText;
    qrdbHipoacusia: TQRDBText;
    qrdbPagado: TQRDBText;
    qrdbSubtotal: TQRDBText;
    qrdbIntereses: TQRDBText;
    qrdbGastos: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbHayNomina: TQRDBText;
    qrdbTarifa: TQRDBText;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    qreTotCuota: TQRExpr;
    qreTotHipoacusia: TQRExpr;
    qreTotPagado: TQRExpr;
    qreTotSubtotal: TQRExpr;
    qreTotIntereses: TQRExpr;
    qreTotGastos: TQRExpr;
    qreTotTotal: TQRExpr;
    QRMemo2: TQRMemo;
    qrmTextoInf: TQRMemo;
    QRBandPie: TQRBand;
    QRSysData1: TQRSysData;
    qrlHoja: TQRLabel;
    QRBandTitPeriodos: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlPaginas: TQRLabel;
    procedure qrdbHipoacusiaPrint(sender: TObject; var Value: String);
    procedure qrdbPagadoPrint(sender: TObject; var Value: String);
    procedure qrdbSubtotalPrint(sender: TObject; var Value: String);
    procedure qrdbInteresesPrint(sender: TObject; var Value: String);
    procedure qrdbGastosPrint(sender: TObject; var Value: String);
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
    procedure qrdbDevengadoPrint(sender: TObject; var Value: String);
    procedure qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qreTotCuotaPrint(sender: TObject; var Value: String);
    procedure qreTotHipoacusiaPrint(sender: TObject; var Value: String);
    procedure qreTotPagadoPrint(sender: TObject; var Value: String);
    procedure qreTotSubtotalPrint(sender: TObject; var Value: String);
    procedure qreTotInteresesPrint(sender: TObject; var Value: String);
    procedure qreTotGastosPrint(sender: TObject; var Value: String);
    procedure qreTotTotalPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    piPages: Integer;
  protected
    //procedure ArrangeControls_Argentino; override;
    procedure ArrangeControls_Andreani; override;
    //procedure ArrangeControls_Oca; override;
    //procedure ArrangeControls_Bonaerense; override;
    procedure ArrangeControls_FullExpress; override;
    procedure ArrangeControls_Rowing; override;
  public
    procedure LoadValues; override;
  end;

procedure Do_ImprimirCartaDocIntimacion(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                        aTransactionMode: TTransactionMode = tmNone; CantidadCopias: Integer = -1;
                                        ActualizarEndosoReimpresion: Boolean = False; ImprimirF817: Boolean = False;
                                        ImprimirCartaDoc: Boolean = True; Imprimir_Firma: Boolean = True);

implementation

uses
  AnsiSql, unDmPrincipal, comctrls, DBFuncs, StrFuncs, Printers, unQRF817;

{$R *.DFM}

procedure Do_ImprimirCartaDocIntimacion(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                        aTransactionMode: TTransactionMode = tmNone; CantidadCopias: Integer = -1;
                                        ActualizarEndosoReimpresion: Boolean = False; ImprimirF817: Boolean = False;
                                        ImprimirCartaDoc: Boolean = True; Imprimir_Firma: Boolean = True);
var
  NroImpresora: Integer;
begin
  //Este llamado tiene que estar afuera del with para que la referencia se haga a la unidad Printers
  NroImpresora := Printer.PrinterIndex;

  if ImprimirF817 then
    Do_ImprimirF817(AIdCarta, 0, AAction, 1);

  if ImprimirCartaDoc then
  begin
    if ActualizarEndosoReimpresion then
      DoActualizarEndosoReimpresion(AIdCarta, aTransactionMode);

    with TQRCartaDocIntimacion.Create(Application) do
    try
      ImprimirFirma   := Imprimir_Firma;
      IdCarta         := AIdCarta;
      Modulo          := taCobranzas;
      TransactionMode := aTransactionMode;

      PrinterSettings.PrinterIndex := NroImpresora;

      if CantidadCopias <> -1 then
        PrinterSettings.Copies := CantidadCopias;

      qrbPageHeader.Height := qrbPageHeader.Height + 18;    // tk 42583-en cobranzas no imprimen desde la misma impresora que tenemos en sistemas, sino de otra, donde sale el cuerpo de la carta impreso más arriba, por eso esto...

      Prepare;
      try
        piPages := QRPrinter.PageCount; // Guardo el total de páginas en una variable pública

        case AAction of
          srPrint:   Print;
          srPreview: Preview;
        end;
      finally
        QRPrinter.Free;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TQRCartaDocIntimacion.LoadValues;
var
  REdit: TRichEdit;
  sCodCTCTextoInf: String;
  sCodCTCTextoSup: String;
  sCodTexto: String;
  sSql: String;
begin
  inherited; { Carga el formato, domicilio... }

  // cargo datos referencia
  sdqReferencia.Params[0].Value := IdCarta;
  OpenQuery(sdqReferencia);

  // busco formato de texto sup. e inf.
  sSql := 'SELECT TC_CODIGO ' +
            'FROM CTC_TEXTOCARTA, CCA_CARTA ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND CA_ID=' + SqlValue(IdCarta);
  sCodTexto := ValorSql(sSql);

  if sCodTexto = 'I02' then
  begin
    sCodCTCTextoSup := 'IN01';
    sCodCTCTextoInf := 'IN02';
  end
  else if sCodTexto = 'I03' then
  begin
    sCodCTCTextoSup := 'IN01';
    sCodCTCTextoInf := 'IN03';
  end
  else if sCodTexto = 'I12' then
  begin
    sCodCTCTextoSup := 'IN11';
    sCodCTCTextoInf := 'IN12';
  end
  else if sCodTexto = 'I14' then
  begin
    sCodCTCTextoSup := 'IN01';
    sCodCTCTextoInf := 'IN14';
  end
  else if sCodTexto = 'I19' then
  begin
    sCodCTCTextoSup := 'IN18';
    sCodCTCTextoInf := 'IN19';
  end
  else if sCodTexto = 'I22' then
  begin
    sCodCTCTextoSup := 'IN21';
    sCodCTCTextoInf := 'IN22';
  end
  else
  begin
    sCodCTCTextoSup := 'IN18';
    sCodCTCTextoInf := 'IN19';
  end;

  qrlCodFormatoTexto.Caption := sCodCTCTextoSup + '/' + sCodCTCTextoInf;

  // Estoy mostrando el texto de la carta en un TQRMeno, con lo que se pierden los formatos
  // de texto enriquecido. Hago esto porque con un TQRRichText me estaba cortando la última
  // linea del texto
  REdit := TRichEdit.Create(Self);
  try
    REdit.Parent := Self;

    // cargo texto sup.
    sdqTexto.Params[0].Value := sCodCTCTextoSup;
    OpenQuery(sdqTexto);
    REdit.Lines.Assign(sdqTexto.FieldByName('TC_TEXTO'));
    qrmTextoSup.Lines.Text := REdit.Text;

    // cargo texto inf.
    sdqTexto.Params[0].Value := sCodCTCTextoInf;
    OpenQuery(sdqTexto);
    REdit.Lines.Assign(sdqTexto.FieldByName('TC_TEXTO'));
    qrmTextoInf.Lines.Text := REdit.Text;
  finally
    REdit.Free;
  end;


  sSql := 'SELECT UTILES.PERIODO_PONERBARRA(IN_PERIODO) PERIODO, IN_VENCIMIENTO VENCIMIENTO, ' +
                 'IN_DEVENGADO DEVENGADO, IN_HIPOACUSIA HIPOACUSIA, IN_PAGADO PAGADO, ' +
                 'IN_DEVENGADO+IN_HIPOACUSIA-IN_PAGADO SUBTOTAL, IN_INTERESES INTERESES, ' +
                 'IN_GASTOS GASTOS, IN_TOTAL TOTAL, ' +
                 'UTILES.IIF_CHAR(IN_HAYNOMINA, ''S'', '''', ''(*)'') HAYNOMINA, IN_TARIFA TARIFA ' +
          'FROM ZIN_INTIMACIONPLAN, ZSC_SELECCIONCONTRACCIONPLAN, ZCS_CONTRATOSELECCIONADOPLAN ' +
          'WHERE IN_IDSELCONTRACCIONPLAN=SC_ID ' +
            'AND CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
            'AND CS_CONTRATO=SC_CONTRATO ' +
            'AND CS_IDCARTAINTIMACION=:CA_IDCARTA';

  // cargo periodos
  sdqPeriodos.SQL.Text := sSql;
  sdqPeriodos.Params[0].Value := IdCarta;
  OpenQuery(sdqPeriodos);

  if sdqPeriodos.Eof then  // si no encuentro periodos intento buscarlos en las tablas viejas (hay cuit que no se migraron porque no estaban en la tabla ART.ZCS_CUITSELEC)
  begin
    sSql := 'SELECT ART.UTILES.PERIODO_PONERBARRA(IN_PERIODO) PERIODO, IN_VENCIMIENTO VENCIMIENTO, ' +
                   'IN_DEVENGADO DEVENGADO, IN_HIPOACUSIA HIPOACUSIA, IN_PAGADO PAGADO, ' +
                   'IN_DEVENGADO+IN_HIPOACUSIA-IN_PAGADO SUBTOTAL, IN_INTERESES INTERESES, ' +
                   'IN_GASTOS GASTOS, IN_TOTAL TOTAL, ' +
                   'ART.UTILES.IIF_CHAR(IN_HAYNOMINA, ''S'', '''', ''(*)'') HAYNOMINA, IN_TARIFA TARIFA ' +
            'FROM ART.ZIN_INTIMACIONES, CCA_CARTA ' +
            'WHERE IN_NROCARTA=CA_NROCARTADOC ' +
              'AND CA_ID=:CA_IDCARTA';

    sdqPeriodos.SQL.Text := sSql;
    sdqPeriodos.Params[0].Value := IdCarta;
    OpenQuery(sdqPeriodos);
  end;
end;

procedure TQRCartaDocIntimacion.ArrangeControls_Andreani;
begin
  inherited;
  Page.BottomMargin    := 49;
end;

procedure TQRCartaDocIntimacion.ArrangeControls_FullExpress;
begin
  inherited;
  Page.BottomMargin    := 49;
end;

procedure TQRCartaDocIntimacion.ArrangeControls_Rowing;
begin
  inherited;
  Page.BottomMargin    := 49;
end;

procedure TQRCartaDocIntimacion.qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  PrintBand := True;  // porque estoy usando el summary
end;

procedure TQRCartaDocIntimacion.qrdbHipoacusiaPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qrdbPagadoPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qrdbSubtotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qrdbInteresesPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qrdbGastosPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qrdbTotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qrdbDevengadoPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotCuotaPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotHipoacusiaPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotPagadoPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotSubtotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotInteresesPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotGastosPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.qreTotTotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacion.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qrlPaginas.Caption := '/ ' + IntToStr(piPages);  // Pongo el número de páginas en una etiqueta que estará al lado de la página actual
end;

end.
