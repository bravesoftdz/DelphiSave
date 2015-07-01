unit unRptCartaDocumento;

interface

{$DEFINE SHEINO}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, QuickRpt, Qrctrls,
  ExtCtrls, unArt, Db, SDEngine, ArtQReports, unCustomDataModule, unComunes, RxGIF, QrAngLbl,
  unCargaDocumentosDigitaliz, unConstantArchivo, QRPrntr, Vcl.Imaging.GIFImg;

type
  TrptCartaDocumento = class(TrptCartaDocHeader)
    qrbDetail: TQRBand;
    qrrTexto: TQRRichText;
    sdqCampos: TSDQuery;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    FAlMenosUnRegistroOk: Boolean;
    FConsultaParaParsearConMasDeUnRegistro: Boolean;
    FSinDatosParaParsear: Boolean;
                                 
    procedure AjustarInfoPie;
    procedure ParseAcuse;
    procedure DoDigitalizarCarta(aPdfFileName: String; aIdCarta: Integer);
  {$IFDEF EMISION}
  procedure ReplaceParamLote;
  {$ENDIF}
  protected
    procedure ArrangeControls_Andreani; override;
    procedure ArrangeControls_Argentino; override;
    procedure ArrangeControls_Bonaerense; override;
    procedure ArrangeControls_FullExpress; override;
    procedure ArrangeControls_Oca; override;
    procedure ArrangeControls_Rowing; override;
  public
    constructor Create(AOwner: TComponent); override;

    function AutoParse: Boolean; virtual;

    procedure Clear; override;
    procedure LoadValues; override;
    procedure ParseText;
  published
  end;

function DoImprimirCarta(const aIdCarta: TTableId; const aActualizarDatos: TTipoModulo;
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
                         const aImprimirFirmanteOrig: Boolean = False; const aVentanilla: Boolean = False;
                         const aDigitalizarCarta: Boolean = True; aPdfMostrarMensError: Boolean = True;
                         const aTipoComunicacionVentElectr: TTableId = ART_EMPTY_ID; const aComunicacionVentElectr: String = '';
                         const aBorrarArchivoPdf: Boolean = False; const aMostrarEspera: Boolean = True): Boolean;

implementation

uses
  unDmPrincipal, AnsiSql, CustomClasses, StrFuncs, Printers, ComCtrls, unVisualizador,
  unSesion, unExportPDF, General, unImportCryptoSrt;

const
  PARAM_ID = 'idCarta';
  PARAM_USER = 'idUsuario';

{$R *.DFM}

function DoImprimirCarta(const aIdCarta: TTableId; const aActualizarDatos: TTipoModulo;
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
                         const aImprimirFirmanteOrig: Boolean = False; const aVentanilla: Boolean = False;
                         const aDigitalizarCarta: Boolean = True; aPdfMostrarMensError: Boolean = True;
                         const aTipoComunicacionVentElectr: TTableId = ART_EMPTY_ID; const aComunicacionVentElectr: String = '';
                         const aBorrarArchivoPdf: Boolean = False; const aMostrarEspera: Boolean = True): Boolean;
var
  bActDatosImpresion, EsCartaDocumento: Boolean;
  NroImpresora: Integer;
  rptCartaDocumento: TrptCartaDocumento;
  sSql, sTipoSalida, sErrorServidor: String;
  vResultados: TResultados;
  {$IFDEF AFILIACIONES}bUsaVisualizador: Boolean;{$ENDIF}
begin
  Result := False;

  {$IFDEF AFILIACIONES}bUsaVisualizador := False;{$ENDIF}
  if (aActualizarEndosoReimpresion) and ((AAction = srPreview) or ((AAction = srPrint) and (not aSoloVisualizar) and
     (not aDeshabilitarImpresion))) then
    DoActualizarEndosoReimpresion(AIdCarta, aTransactionMode);

  // Este llamado tiene que estar afuera del with para que la referencia se haga a la unidad Printers
  NroImpresora      := Printer.PrinterIndex;

  Application.CreateForm(TrptCartaDocumento, rptCartaDocumento);

  with rptCartaDocumento do
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
    Ventanilla               := aVentanilla;

    if aMostrarInfoPie then
      SetInfoPie(aCodTextoCartaInfoPie);

    Modulo := AActualizarDatos;

    sSql              := 'SELECT ca_tiposalida ' +
                          ' FROM cca_carta' +
                         ' WHERE ca_id = :idcarta ';
    sTipoSalida       := ValorSqlEx(sSql, [aIdCarta]);
    EsCartaDocumento  := (sTipoSalida = SALIDA_CARTADOCUMENTO);

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
    ParseAcuse;

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

    {$IFDEF AFILIACIONES}
    //Carta de Bienvenida > seleccionar bandeja al imprimir carta de bienvenida.
    sSql              := 'SELECT ca_idtextocarta ' +
                          ' FROM cca_carta' +
                         ' WHERE ca_id = :idcarta ';

    if (ValorSqlEx(sSql, [aIdCarta]) = '783') and (aAction = srPrint) then
    begin
      PrinterSettings.UseCustomBinCode := False;
      PrinterSettings.OutputBin := LexmarkAfiliacionesBin1;
      PrinterSettings.PaperSize := Letter;
    end;
    {$ENDIF}

    if aAction = srPdf then
    begin
      if IsConversionLocal(teReporte, PDF_EXTENSION) then
        sErrorServidor := ''
      else
        Get_ServidorActivo(GetSecNextVal('SEQ_CCO_ID'), sErrorServidor);

      if sErrorServidor <> '' then
        raise Exception.Create(sErrorServidor)
      else if ForceDirectories(ExtractFileDir(aPdfFileName)) and
        FileToPDFSvr(rptCartaDocumento, ExtractFileDir(aPdfFileName), aPdfFileName, aMostrarEspera, tdDefault, aPdfMostrarMensError) then
      begin
        if not (aTransactionMode in [tmBegin, tmBeginEnd]) then
          BeginTrans(True);

        if aVentanilla then  // Se envia la carta a Ventanilla SRT
          bActDatosImpresion := IsEnviarCartaSrt(aIdCarta, aPdfFileName, aBorrarArchivoPdf, TransactionMode, False, aTipoComunicacionVentElectr, aComunicacionVentElectr)
        else
          bActDatosImpresion := True;

        if bActDatosImpresion then
          begin
            DoActualizarDatosImpresionCartaDocumento(IdCarta);
            Result := True;
          end;

        if aDigitalizarCarta then
          begin
            Sleep(3000);
            DoDigitalizarCarta(aPdfFileName, aIdCarta);
          end;
      end;

      if aVentanilla then  // borro el qrp que genera el servicio ya que no me interesa..
        DeleteFile(Copy(aPdfFileName, 0, Length(aPdfFileName) - 3) + 'qrp');
    end
    else if aAction = srPrint then
      begin
        Print;
        Result := True;
      end
    else
    begin
      {$IFDEF AFILIACIONES}bUsaVisualizador := True;{$ENDIF}

      if IsEmptyString(rptCartaDocumento.ReportTitle) then   // WF 7946
      begin
        if EsCartaDocumento then
          rptCartaDocumento.ReportTitle := 'Carta documento'
        else
          rptCartaDocumento.ReportTitle := 'Carta comercial';
      end;

      if EsCartaDocumento then
      begin
        if aDeshabilitarImpresion then
          Visualizar(rptCartaDocumento, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma,{$IFNDEF AFILIACIONES} oMailNotAllowed, {$ENDIF}
                                                       oExportPDFNotAllowed, oExportDOCNotAllowed, oExportXLSNotAllowed,
                                                       oFaxNotAllowed, oPrintNotAllowed])
        else
          Visualizar(rptCartaDocumento, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma,
                                                       {$IFNDEF AFILIACIONES}oMailNotAllowed,{$ENDIF} oExportPDFNotAllowed, oFaxNotAllowed,
                                                       oExportDOCNotAllowed, oExportXLSNotAllowed])
      end
      else
      begin
        if aDeshabilitarImpresion then
          vResultados := Visualizar(rptCartaDocumento, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma,
                                                                      oMailNotAllowed, oExportPDFNotAllowed,
                                                                      oExportDOCNotAllowed, oExportXLSNotAllowed,
                                                                      oFaxNotAllowed, oPrintNotAllowed])
        else
          vResultados := Visualizar(rptCartaDocumento, GetValores(), [oForceDB, oAlwaysShowDialog, oAutoFirma], True, '', '', True);


        if rMail in vResultados then  // si se envio el mail, se guardan los datos de auditoria en la cca_carta. WF 7946
        begin
          sSql := 'UPDATE cca_carta ' +
                    ' SET ca_fechamail = art.actualdate, ' +
                        ' ca_usumail = ' + SqlValue(Sesion.UserID) +
                  ' WHERE ca_id = ' + SqlInt(AIdCarta);
          EjecutarSqlST(sSql);
        end;
      end;

      Result := True;
    end;
  finally
    Printers.Printer.Copies := 1;
    {$IFDEF AFILIACIONES}
    if not (bUsaVisualizador) or (Screen.ActiveForm.FormStyle = fsNormal) then
      FreeAndNil(rptCartaDocumento);
    {$ELSE}
     //En Afiliaciones al menos, esta instruccion se hace mientras esta abierto el visualizador, dando exceptions.
     //Ademas creo que el visualizador lo libera en el OnClose.
    FreeAndNil(rptCartaDocumento);
    {$ENDIF}
  end;
end;

procedure TrptCartaDocumento.Clear;
begin
  inherited; { Borra los Headers }
end;

constructor TrptCartaDocumento.Create(AOwner: TComponent);
begin
  inherited;

  FAlMenosUnRegistroOk := False;
  FConsultaParaParsearConMasDeUnRegistro := True;
  FIdCarta := ART_EMPTY_ID;
  FSinDatosParaParsear := True;

  Clear;
end;

procedure TrptCartaDocumento.LoadValues;
var
  iIdTextoCarta: Integer;
  sdqDatos: TSDQuery;
  sSql: String;
begin
  //inherited { LO SOBREESCRIBE }
  {$IFDEF SHEINO}
  sSql := 'SELECT ca_nrocartadoc, ' +
                ' nvl(ca_idendosoreimpresion, ca_idendoso) idendoso, ca_idformulario, ca_idempdeudora,' +
                ' ca_idtextocarta, ca_textofinal, ht_destinatario tc_destinatario, ca_idtrabajador, ca_idart,' +
                ' nvl(ca_correoreimpresion, ca_correo) correo, ca_tiposalida,' +
                ' ca_idfirmareimpresion, ca_idfirma, ca_iddelegacion, ca_idareatexto,' +
                ' ht_textodestinatario tc_textodestinatario, ca_iddestinatariocarta, ca_idcomisionmedica,' +
                ' at_codigoremitente, ca_idhistoricotextocarta, ht_idtextocarta' +
           ' FROM cat_areatexto, comunes.cht_historicotextocarta, cca_carta' +
          ' WHERE ca_idhistoricotextocarta = ht_id' +
            ' AND ca_idareatexto = at_id' +
            ' AND ca_id = ' + SqlInt(FIdCarta) +
       ' ORDER BY at_codigoremitente';
  {$ELSE}
  sSql := 'SELECT ca_nrocartadoc, ' +
                ' nvl(ca_idendosoreimpresion, ca_idendoso) idendoso, ca_idformulario, ca_idempdeudora,' +
                ' ca_idtextocarta, ca_textofinal, ht_texto tc_texto, ht_destinatario tc_destinatario, ca_idtrabajador,' +
                ' ca_idart, nvl(ca_correoreimpresion, ca_correo) correo, ca_tiposalida, at_sql,' +
                ' ca_idfirmareimpresion, ca_idfirma, ca_iddelegacion,' +
                ' ht_textodestinatario tc_textodestinatario, ca_iddestinatariocarta, ca_idcomisionmedica,' +
                ' at_codigoremitente, ca_idhistoricotextocarta, ht_idtextocarta' +
           ' FROM comunes.cht_historicotextocarta, cca_carta, cat_areatexto' +
          ' WHERE ca_idhistoricotextocarta = ht_id' +
            ' AND ca_idareatexto = at_id' +
            ' AND ca_id = ' + SqlInt(FIdCarta);
  {$ENDIF}

  sdqDatos := GetQuery(sSql);
  try
    iIdTextoCarta := sdqDatos.FieldByName('ht_idtextocarta').AsInteger;

    { Define el tipo de Salida, esto debe suceder antes que se setee el tipo de Correo }
    TipoSalida := StrToTipoSalida(sdqDatos.FieldByName('CA_TIPOSALIDA').AsString);

    { Los datos del Formato de la Carta }
    Correo := StrToCorreo(sdqDatos.FieldByName('CORREO').AsString);

    { Los datos del Header }
    qrlNumero.Caption := sdqDatos.FieldByName('CA_NROCARTADOC').AsString;
    if not(sdqDatos.FieldByName('CA_IDDESTINATARIOCARTA').IsNull) then            //si este campo tiene valor significa que
      DestinatarioTipo := StrToTipoDestinatario(DESTI_OTROS)                      //le pusieron un domicilio alternativo..
    else if (sdqDatos.FieldByName('TC_DESTINATARIO').AsString = DESTI_AMBOS) and //si el destinatario es "ambos" y
       (sdqDatos.FieldByName('CA_IDTRABAJADOR').IsNull) then                     // el idtrabajador es nulo, es carta a empresa
      DestinatarioTipo := StrToTipoDestinatario(DESTI_EMPRESA)
    else if (sdqDatos.FieldByName('TC_DESTINATARIO').AsString = DESTI_AMBOS) and //si el destinatario es "ambos" y
             not(sdqDatos.FieldByName('CA_IDTRABAJADOR').IsNull) then           // el idtrabajador NO es nulo, es carta al trabajador
      DestinatarioTipo := StrToTipoDestinatario(DESTI_TRABAJADOR)
    else
      DestinatarioTipo  := StrToTipoDestinatario(sdqDatos.FieldByName('TC_DESTINATARIO').AsString);

    RemitenteCorreo := not sdqDatos.FieldByName('AT_CODIGOREMITENTE').IsNull;
    CodigoRemitente := sdqDatos.FieldByName('AT_CODIGOREMITENTE').AsString;

    SetDestinatario(sdqDatos.FieldByName('IDENDOSO').AsInteger,
                    sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger,
                    sdqDatos.FieldByName('CA_IDEMPDEUDORA').AsInteger,
                    sdqDatos.FieldByName('CA_IDTRABAJADOR').AsInteger,
                    sdqDatos.FieldByName('CA_IDART').AsInteger,
                    sdqDatos.FieldByName('CA_IDDESTINATARIOCARTA').AsInteger,
                    sdqDatos.FieldByName('CA_IDCOMISIONMEDICA').AsInteger,
                    sdqDatos.FieldByName('TC_TEXTODESTINATARIO').AsString);

    SetRemitenteActual;

    ReplicarTodo;

    { Datos del Firmante }
    if ImprimirFirmanteOrig or (sdqDatos.FieldByName('ca_idfirmareimpresion').IsNull) then    // TK 22196 lo modifico a ver si se arregla el tema de impresion de cartas documento.
      IdFirma := sdqDatos.FieldByName('ca_idfirma').AsInteger
    else if not sdqDatos.FieldByName('ca_idfirmareimpresion').IsNull then
      IdFirma := sdqDatos.FieldByName('ca_idfirmareimpresion').AsInteger;

   { IdFirma := IIF(ImprimirFirmanteOrig, sdqDatos.FieldByName('ca_idfirma').AsInteger,
                                         IIF(sdqDatos.FieldByName('ca_idfirmareimpresion').IsNull,
                                             sdqDatos.FieldByName('ca_idfirma').AsInteger,
                                             sdqDatos.FieldByName('ca_idfirmareimpresion').AsInteger));    }

    { Asigna el Texto de la Carta }
    if sdqDatos.FieldByName('CA_TEXTOFINAL').IsNull then
      {$IFDEF SHEINO}
      BlobSql('SELECT ht_texto' +
               ' FROM comunes.cht_historicotextocarta' +
              ' WHERE ht_id = ' + SqlValue(sdqDatos.FieldByName('CA_IDHISTORICOTEXTOCARTA').AsInteger), qrrTexto.Lines)
      {$ELSE}
       qrrTexto.Lines.Assign(sdqDatos.FieldByName('TC_TEXTO'))
      {$ENDIF}
    else
       qrrTexto.Lines.Assign(sdqDatos.FieldByName('CA_TEXTOFINAL'));
  finally
    sdqDatos.Free;
  end;

  {ASIGNACION DEL TEXTO}


  sSql :=
    'SELECT at_sql, ta_idareatexto' +
     ' FROM cta_textoarea, cat_areatexto' +
    ' WHERE at_id = ta_idareatexto AND ta_idtextocarta = :idtextocarta' +
      ' AND ta_fechabaja IS NULL';
  sdqDatos := GetQueryEx(sSql, [iIdTextoCarta]);
  try
    while not sdqDatos.Eof do
    begin
      {$IFDEF SHEINO}
      BlobSql('SELECT at_sql' +
               ' FROM cat_areatexto' +
              ' WHERE at_id = ' + SqlValue(sdqDatos.FieldByName('ta_idareatexto').AsInteger), sdqCampos.Sql);
      {$ELSE}
      sdqCampos.Sql.Assign(sdqDatos.FieldByName('AT_SQL'));
      {$ENDIF}

      if (Trim(sdqCampos.Sql.Text) <> '') and AutoParse then
        ParseText;

      sdqDatos.Next;
    end;

    try
      if not FAlMenosUnRegistroOk then
      begin
        if FSinDatosParaParsear then
          raise Exception.Create('No se encontraron datos.')
        else if FConsultaParaParsearConMasDeUnRegistro then
          raise Exception.Create('La consulta devolvió más de un registro.')
      end;
    except
      on E: Exception do
        raise Exception.Create('Error al cargar los campos de la carta documento:' + CRLF + E.Message + CRLF + CRLF +
                               'Verifique el SQL cargado en "Mantenimiento de Areas"');
    end;
  finally
    sdqDatos.Free;
  end;
  {$IFDEF EMISION}
  ReplaceParamLote;
  {$ENDIF}
end;

procedure TrptCartaDocumento.ArrangeControls_Bonaerense;
begin
  inherited;

  qrbDetail.Height  := 626;
  Page.BottomMargin := 67;

  with qrrTexto do
  begin
    Left   := 44;
    Top    := 18;
    Width  := 687;
    Height := 595;
  end;

  AjustarInfoPie;
end;

procedure TrptCartaDocumento.ArrangeControls_Andreani;
begin
  inherited;

  qrbDetail.Height  := 646;
  Page.BottomMargin := 49;

  with qrrTexto do
  begin
    Left   := 28;
    Top    := 7;
    Width  := 703;
    Height := 631;
  end;

  AjustarInfoPie;
end;

procedure TrptCartaDocumento.ArrangeControls_Argentino;
begin
  inherited;
  
  qrbDetail.Height := 530;

  with qrrTexto do
  begin
    Left   := 0;
    Top    := 3;
    Width  := 695;
    Height := 510;
  end;

  AjustarInfoPie;
end;

procedure TrptCartaDocumento.ArrangeControls_Oca;
begin
  inherited;
  raise Exception.Create('El formato del Correo OCA no se encuentra implementado');
end;

procedure TrptCartaDocumento.ArrangeControls_FullExpress;
begin
  inherited;
  qrbDetail.Height     := 700;
  Page.BottomMargin    := 49;
  qrrTexto.Visible     := False;
  qrlFirmante.Visible  := False;
  qrlDocumento.Visible := False;
  qrlCaracter.Visible  := False;
end;

procedure TrptCartaDocumento.ArrangeControls_Rowing;
begin
  inherited;

  qrbDetail.Height := 350;

  with qrrTexto do
  begin
    Left   := 44;
    Top    := 6;
    Width  := 687;
    Height := 340;
  end;

  AjustarInfoPie;
end;

function TrptCartaDocumento.AutoParse: Boolean;
var
  iParam: Integer;
begin
  Result := True;
  if not ((sdqCampos.ParamCount = 0) or ((sdqCampos.ParamCount = 1) and (sdqCampos.Params[0].Name = PARAM_ID))) then
    for iParam := 0 to sdqCampos.ParamCount -1 do
      if (CompareText(sdqCampos.Params[iParam].Name, PARAM_ID) <> 0) and
         (CompareText(sdqCampos.Params[iParam].Name, PARAM_USER) <> 0) then
      begin
        Result := False;
        Break;
      end;
end;

procedure TrptCartaDocumento.ParseText;
var
  i    : Integer;
  RStrm: TReplaceStream;
begin
  { TODO -oFFirenze -cMejora : Esto hay que mejorarlo, pero por ahora así va a funcionar... }
  try
    if not sdqCampos.Active then
    begin
      if Assigned(sdqCampos.Params.FindParam(PARAM_ID)) then
        sdqCampos.ParamByName(PARAM_ID).AsInteger := FIdCarta;
      if Assigned(sdqCampos.Params.FindParam(PARAM_USER)) then
        sdqCampos.ParamByName(PARAM_USER).AsString := Sesion.UserID;

      OpenQuery(sdqCampos);
    end;

    if not sdqCampos.IsEmpty then
      FSinDatosParaParsear := False
    else if sdqCampos.RecordCount = 1 then
      FConsultaParaParsearConMasDeUnRegistro := False;

    if sdqCampos.RecordCount = 1 then
    begin
      FAlMenosUnRegistroOk := True;
      RStrm := TReplaceStream.Create;
      try
        { Carga los TStrings con los valores de los campos }
        for i := 0 to sdqCampos.Fields.Count - 1 do
        begin
          RStrm.Find.Add('<<' + sdqCampos.Fields[i].FieldName + '>>');
          RStrm.Replace.Add(sdqCampos.Fields[i].AsString);
        end;

        qrrTexto.Lines.SaveToStream(RStrm);
        RStrm.Seek(0, soFromBeginning);
        qrrTexto.Lines.LoadFromStream(RStrm);
      finally
        RStrm.Free;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error al cargar los campos de la carta documento:' + CRLF + E.Message + CRLF + CRLF +
                             'Verifique el SQL cargado en "Mantenimiento de Areas"');
  end;
end;

procedure TrptCartaDocumento.AjustarInfoPie;
var
  iAltoPie: Integer;
begin
  with qrmInfoPie do
  begin
    Left   := qrrTexto.Left;
    Top    := qrlDocumento.Top + qrlDocumento.Height + 10;
    Width  := qrrTexto.Width;
    Height := 70;
  end;

  if qrmInfoPie.Enabled then
    begin
      iAltoPie             := qrmInfoPie.Height + 15;
      qrbPageFooter.Height := qrbPageFooter.Height + iAltoPie;
      qrbDetail.Height     := qrbDetail.Height - iAltoPie;
    end;
end;

{$IFDEF EMISION}
procedure TrptCartaDocumento.ReplaceParamLote;
var
  RStrm: TReplaceStream;
begin
  //Reemplazo los parametros manuales
  RStrm := TReplaceStream.Create;
  with GetQueryEx(' SELECT pg_parametro, pg_valor ' +
                  '  FROM emi.ipg_parametrogestion ' +
                  ' WHERE pg_numerogestion IN(SELECT dg_numerogestion ' +
                  '                           FROM emi.isl_sublote, emi.ids_detallesublote, emi.idg_detallesubloteengestion ' +
                  '                           WHERE ds_id = dg_iddetallesublote ' +
                  '                           AND ds_idsublote = sl_id ' +
                  '                           AND dg_idcarta = :idcarta) ', [IdCarta]) do
  try
    while not Eof do
    begin
      RStrm.Find.Add('<<' + FieldByName('pg_parametro').AsString + '>>');
      RStrm.Replace.Add(FieldByName('pg_valor').AsString);
      Next;
    end;

    qrrTexto.Lines.SaveToStream(RStrm);
    RStrm.Seek(0, soFromBeginning);
    qrrTexto.Lines.LoadFromStream(RStrm);
  finally
    RStrm.free;
    free;
  end;

end;
{$ENDIF}


procedure TrptCartaDocumento.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if IsEmptyString(ReportTitle) then
  begin
    if (TipoSalida = tsCartaDocumento) then
      ReportTitle := 'Carta documento número ' + qrlNumero.Caption
    else
      ReportTitle := 'Carta comercial';
  end;
end;

procedure TrptCartaDocumento.ParseAcuse;
var
  i    : Integer;
begin
  try
    if not sdqCampos.Active then
    begin
      if Assigned(sdqCampos.Params.FindParam(PARAM_ID)) then
        sdqCampos.ParamByName(PARAM_ID).AsInteger := FIdCarta;
      if Assigned(sdqCampos.Params.FindParam(PARAM_USER)) then
        sdqCampos.ParamByName(PARAM_USER).AsString := Sesion.UserID;

      OpenQuery(sdqCampos);
    end;

    if sdqCampos.RecordCount = 1 then
    begin
      for i := 0 to sdqCampos.Fields.Count - 1 do
      begin
        qrlLeyendaAcuse.Caption := StringReplace(qrlLeyendaAcuse.Caption,
                                                 '<<' + sdqCampos.Fields[i].FieldName + '>>',
                                                 sdqCampos.Fields[i].AsString,
                                                 [rfReplaceAll,rfIgnoreCase]);
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error al parsear acuse de recibo' + CRLF + E.Message + CRLF + CRLF +
                             'Verifique el texto cargado en el "Acuse de Recibo"');
  end;
end;

procedure TrptCartaDocumento.DoDigitalizarCarta(aPdfFileName: String; aIdCarta: Integer);
var
  sSql: string;
begin
  sSql := 'SELECT at_idtipoarchivo, ex_siniestro, ex_orden, ca_nrocartadoc ' +
           ' FROM sex_expedientes, cca_carta, cat_areatexto ' +
          ' WHERE ex_id = ca_idexpediente ' +
            ' AND ca_idareatexto = at_id ' +
            ' AND at_idtipoarchivo IS NOT NULL ' +
            ' AND ca_id = :id ';
  with GetQueryEx(sSql, [aIdCarta]) do
  try
    try
      if not IsEmpty then
        TfrmCargaDocumentosDigitaliz.DoCargarDocumentosDigitalizados(FieldByName('at_idtipoarchivo').AsInteger,
                                                                   FieldByName('ex_siniestro').AsString,
                                                                   FieldByName('ex_orden').AsString, '', '',
                                                                   CODDOC_CARTADOC, aPdfFileName,
                                                                   FieldByName('ca_nrocartadoc').AsString,
                                                                   False);
    except //no quiero que me joda cualquier error de digitalizacion...
    end;
  finally
    Free;
  end;
end;

end.
