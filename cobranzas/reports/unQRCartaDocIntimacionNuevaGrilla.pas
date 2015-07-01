unit unQRCartaDocIntimacionNuevaGrilla;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, QRCtrls, QuickRpt,
  ArtQReports, ExtCtrls, unArt, unComunes, Db, SDEngine, unCustomDataModule, RxGIF, QrAngLbl,
  ImagingComponents, qrpctrls;

type
  TQRCartaDocIntimacionNuevaGrilla = class(TrptCartaDocHeader)
    QRBandReferencia: TQRBand;
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
    QRLabel13: TQRLabel;
    qrdbOtros: TQRDBText;
    qreTotOtros: TQRExpr;
    qrlTitNroComunicacion: TQRLabel;
    qrlNroComunicacion: TArtQRLabel;
    procedure qrdbHipoacusiaPrint(Sender: TObject; var Value: String);
    procedure qrdbPagadoPrint(Sender: TObject; var Value: String);
    procedure qrdbSubtotalPrint(Sender: TObject; var Value: String);
    procedure qrdbInteresesPrint(Sender: TObject; var Value: String);
    procedure qrdbGastosPrint(Sender: TObject; var Value: String);
    procedure qrdbTotalPrint(Sender: TObject; var Value: String);
    procedure qrdbDevengadoPrint(Sender: TObject; var Value: String);
    procedure qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qreTotCuotaPrint(Sender: TObject; var Value: String);
    procedure qreTotHipoacusiaPrint(Sender: TObject; var Value: String);
    procedure qreTotPagadoPrint(Sender: TObject; var Value: String);
    procedure qreTotSubtotalPrint(Sender: TObject; var Value: String);
    procedure qreTotInteresesPrint(Sender: TObject; var Value: String);
    procedure qreTotGastosPrint(Sender: TObject; var Value: String);
    procedure qreTotTotalPrint(Sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrdbOtrosPrint(Sender: TObject; var Value: String);
    procedure qreTotOtrosPrint(Sender: TObject; var Value: String);
  private
    piPages: Integer;
  protected
    procedure ArrangeControls_Andreani; override;
    procedure ArrangeControls_Argentino; override;
    procedure ArrangeControls_FullExpress; override;
    procedure ArrangeControls_Rowing; override;
  public
    procedure LoadValues; override;
  end;

function Do_ImprimirCartaDocIntimacionNuevaGrilla(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                                  aTransactionMode: TTransactionMode = tmNone;
                                                  CantidadCopias: Integer = -1;
                                                  ActualizarEndosoReimpresion: Boolean = False;
                                                  ImprimirF817: Boolean = False; ImprimirCartaDoc: Boolean = True;
                                                  Imprimir_Firma: Boolean = True; PdfFileName: String = '';
                                                  TipoComunicacionVentElectr: TTableId = ART_EMPTY_ID;
                                                  ComunicacionVentElectr: String = ''; Mostrar_Logo: Boolean = False): Boolean;

implementation

uses
  AnsiSql, unDmPrincipal, comctrls, DBFuncs, StrFuncs, Printers, unQRF817, ArchFuncs,
  unExportPDF, unImportCryptoSrt, unVisualizador;

{$R *.DFM}

function Do_ImprimirCartaDocIntimacionNuevaGrilla(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                                  aTransactionMode: TTransactionMode = tmNone;
                                                  CantidadCopias: Integer = -1;
                                                  ActualizarEndosoReimpresion: Boolean = False;
                                                  ImprimirF817: Boolean = False; ImprimirCartaDoc: Boolean = True;
                                                  Imprimir_Firma: Boolean = True; PdfFileName: String = '';
                                                  TipoComunicacionVentElectr: TTableId = ART_EMPTY_ID;
                                                  ComunicacionVentElectr: String = ''; Mostrar_Logo: Boolean = False): Boolean;
var
  NroImpresora: Integer;
  rpt: TQRCartaDocIntimacionNuevaGrilla;
  bEsCartaDocumento: Boolean;
begin
  Result := False;
  //Este llamado tiene que estar afuera del with para que la referencia se haga a la unidad Printers
  NroImpresora := Printer.PrinterIndex;

  if ImprimirF817 then
    Do_ImprimirF817(AIdCarta, 0, AAction, 1);

  if ImprimirCartaDoc then
  begin
    if ActualizarEndosoReimpresion then
      DoActualizarEndosoReimpresion(AIdCarta, aTransactionMode);

    rpt := TQRCartaDocIntimacionNuevaGrilla.Create(Application);
    with rpt do
    try
      ImprimirFirma    := Imprimir_Firma;
      IdCarta          := AIdCarta;
      Modulo           := taCobranzas;
      TransactionMode  := aTransactionMode;
      MostrarLogo      := Mostrar_Logo;

      bEsCartaDocumento := (ValorSqlEx('SELECT CA_TIPOSALIDA FROM CCA_CARTA WHERE CA_ID = :Id',  [AIdCarta]) = SALIDA_CARTADOCUMENTO);

      qrlTitNroComunicacion.Enabled := not bEsCartaDocumento;
      qrlNroComunicacion.Enabled    := not bEsCartaDocumento;

      if bEsCartaDocumento then
        ReportTitle := 'Carta documento número ' + qrlNumero.Caption
      else
        begin
          qrlNroComunicacion.Caption := qrlNumero.Caption;

          ReportTitle := 'Carta comercial';
        end;

      PrinterSettings.PrinterIndex := NroImpresora;

      if CantidadCopias <> -1 then
        PrinterSettings.Copies := CantidadCopias;

      qrbPageHeader.Height := qrbPageHeader.Height + 18;    // tk 42583-en cobranzas no imprimen desde la misma impresora que tenemos en sistemas, sino de otra, donde sale el cuerpo de la carta impreso más arriba, por eso esto...

      Prepare;
      try
        piPages := QRPrinter.PageCount; // Guardo el total de páginas en una variable pública

        case AAction of
          srPrint:
            begin
              Print;
              Result := True;
            end;
          srPreview:
            begin
              Visualizar(rpt, GetValores(), [oForceShowModal]);
              Result := True;
            end;
          srPdf:   // por ahora, asumo que al enviar a pdf lo que quiere es también enviar por ventanilla electrónica
            begin
              if FileToPDFSvr(rpt, ExtractFileDir(PdfFileName), PdfFileName, False, tdDefault, False) then
                if IsEnviarCartaSrt(AIdCarta, PdfFileName, False, TransactionMode, False, TipoComunicacionVentElectr, ComunicacionVentElectr) then
                  begin
                    DoActualizarDatosImpresionCartaDocumento(AIdCarta);
                    Result := True;
                  end;
            end;
        end;

      finally
        {$IFDEF VER150}
        QRPrinter.Free;
        {$ENDIF}
      end;
    finally
      Free;
    end;
  end;
end;

procedure TQRCartaDocIntimacionNuevaGrilla.LoadValues;
var
  REdit: TRichEdit;
  sCodCTCTextoInf: String;
  sCodCTCTextoSup: String;
  sCodTexto: String;    
  sSql: String;
begin
  inherited; { Carga el formato, domicilio... }

  // cargo datos referencia
  OpenQueryEx(sdqReferencia, [IdCarta]);

  // busco formato de texto sup. e inf.
  sSql := 'SELECT TC_CODIGO ' +
            'FROM CTC_TEXTOCARTA, CCA_CARTA ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND CA_ID=' + SqlValue(IdCarta);
  sCodTexto := ValorSql(sSql);

  if sCodTexto = 'I25' then
  begin
    sCodCTCTextoSup := 'IN21';
    sCodCTCTextoInf := 'IN22';
  end  
  else
  begin
    sCodCTCTextoSup := 'IN23';
    sCodCTCTextoInf := 'IN24';
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
                 'IN_DEVENGADO+IN_HIPOACUSIA-IN_PAGADO-IN_OTROS SUBTOTAL, IN_INTERESES INTERESES, ' +
                 'IN_GASTOS GASTOS, IN_TOTAL TOTAL, IN_OTROS OTROS, ' +
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
end;

procedure TQRCartaDocIntimacionNuevaGrilla.ArrangeControls_Andreani;
begin
  inherited;
  Page.BottomMargin    := 49;
end;

procedure TQRCartaDocIntimacionNuevaGrilla.ArrangeControls_FullExpress;
begin
  inherited;
  Page.BottomMargin    := 49;
end;

procedure TQRCartaDocIntimacionNuevaGrilla.ArrangeControls_Rowing;
begin
  inherited;
  Page.BottomMargin    := 49;
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  PrintBand := True;  // porque estoy usando el summary
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbHipoacusiaPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbPagadoPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbSubtotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbInteresesPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbGastosPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbTotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbDevengadoPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotCuotaPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotHipoacusiaPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotPagadoPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotSubtotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotInteresesPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotGastosPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotTotalPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qrlPaginas.Caption := '/ ' + IntToStr(piPages);  // Pongo el número de páginas en una etiqueta que estará al lado de la página actual
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qrdbOtrosPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.qreTotOtrosPrint(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TQRCartaDocIntimacionNuevaGrilla.ArrangeControls_Argentino;
begin
  inherited;
  Page.BottomMargin    := 28;
  qrbPageFooter.Height := 77;
end;

end.
