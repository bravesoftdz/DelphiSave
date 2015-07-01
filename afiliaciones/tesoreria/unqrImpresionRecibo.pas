unit unqrImpresionRecibo;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               NELSON WILLY KUSTER
 FECHA DE CREACION:   ?
 ULTIMA MODIFICACION: 06-10-03
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx;

type
  TSeccionesReporte = (srTitulo, srHeader, srDetail, srFooter, srSummary, srNone);  // secciones del reporte
  TTipoRecibo = (trNone, trComun, trPlanPago, trReemplazo, trPlanPagoRecup);

  TfrmValImpresionRecibo = class(TForm)
    sdqValoresYPeriodos: TSDQuery;
    qrpRecibo: TQuickRep;
    qrbDetailValoresYPeriodos: TQRBand;
    qrsVert2Periodos: TQRShape;
    qrbTituloPeriodos: TQRBand;
    qrlDescripcionPeriodos: TQRLabel;
    qrbHeader: TQRBand;
    qrlDireccionART: TQRLabel;
    qrlTelefonoART: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlLugar: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    qrlDia: TQRLabel;
    qrlMes: TQRLabel;
    qrlAnio: TQRLabel;
    qrlNumero: TQRLabel;
    qrsRectValores: TQRShape;
    qrsVert1Periodos: TQRShape;
    qrsVert1Valores: TQRShape;
    qrsVert3Valores: TQRShape;
    qrgValores: TQRGroup;
    qcbValoresYPeriodos: TQRChildBand;
    qrsRectHeaderPeriodos: TQRShape;
    qrlHeaderImportePeriodo: TQRLabel;
    qrlHeaderConcepto: TQRLabel;
    qrsVert1HeaderValores: TQRShape;
    qrsVert3HeaderValores: TQRShape;
    qrlPagina: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    qrsVert4HeaderValores: TQRShape;
    qrsVert2Valores: TQRShape;
    qrlHeaderTipo: TQRLabel;
    qrlHeaderNro: TQRLabel;
    qrlHeaderBanco: TQRLabel;
    qrlHeaderImporteValor: TQRLabel;
    qrlHeaderFecha: TQRLabel;
    qrdbImportePeriodo: TQRDBText;
    qrdbConcepto: TQRDBText;
    qrdbTipo: TQRDBText;
    qrdbNroCheque: TQRDBText;
    qrdbBanco: TQRDBText;
    qrdbImporte: TQRDBText;
    qrdbFechaCheque: TQRDBText;
    qrlDescripcionValores: TQRLabel;
    qrbGroupFooterPeriodos: TQRBand;
    qrsRectTotalValores: TQRShape;
    qrlTotalValores: TQRLabel;
    qreSumaImporteValores: TQRExpr;
    qrlAdicional: TQRLabel;
    qreSumaImportePeriodos: TQRExpr;
    SummaryBand1: TQRBand;
    qrlFirmante: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    qrlCuit: TQRLabel;
    qrlIngresosBrutos: TQRLabel;
    qrlIVA: TQRLabel;
    qrlInicioActividades: TQRLabel;
    QRLabel1: TQRLabel;
    qrLeyenda: TQRLabel;
    qrReemp10: TQRLabelEx;
    qrReemp11: TQRLabelEx;
    qrReemp20: TQRLabelEx;
    qrReemp21: TQRLabelEx;
    qrReemp30: TQRLabelEx;
    qrReemp31: TQRLabelEx;
    qrReemp51: TQRLabelEx;
    qrReemp50: TQRLabel;
    qrReemp40: TQRLabelEx;
    qrReemp41: TQRLabelEx;
    qrReemp44: TQRLabelEx;
    qrReemp45: TQRLabelEx;
    qriLogo: TQRImage;
    qrlNombreFirmante: TQRLabel;
    procedure sdqValoresYPeriodosAfterOpen(DataSet: TDataSet);
    procedure qrbDetailValoresYPeriodosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrgValoresBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qcbValoresYPeriodosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbGroupFooterPeriodosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrdbTipoPrint(sender: TObject; var Value: String);
  private
    fTipoRecibo: TTipoRecibo;
    fIdRecibo: TTableId;
    pbMostrarDescripcionValor: Boolean;
    piCantidadPaginas: Integer;
    fIDPlanPagoRecup, fIDPlanPago: string;
    function GetDescripcionRecibo(AIdRecibo: TTableID ): String;
    procedure DoIncrementarPagina(bMantenerSeccionJunta: Boolean; iCantRenglonesReporte, iCantRenglonesSeccion: Integer; var iCantPaginas, iRenglonesUsados: Integer);
    procedure DoCalcularPaginas(srSeccionReporte: TSeccionesReporte; iCantRenglonesReporte, iCantRenglonesTitulo, iCantRenglonesHeader, iCantRenglonesDetail, iCantRenglonesFooter, iCantRenglonesSummary: Integer; var iCantPaginas, iRenglonesUsados, iCantidadRegistros: Integer);
    function GetCantidadPaginas(sSqlPeriodosYValores: String): Integer;
    function IsValor: Boolean;
    procedure MostrarDetail;
    procedure MostrarChildHeader;
    procedure MostrarSummary;
    function GetTipoRecibo(AIdRecibo: TTableID): TTipoRecibo;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirRecibo(AIdRecibo: TTableID; CantCopias: Integer = 3; Preview: Boolean = False);
  end;

  procedure ReImprimirRecibo(AIdRecibo: TTableID; CantCopias: Integer = 3; Preview: Boolean = False);
  procedure DoReImprimirRecibosPlan(AIdPlanPago: TTableId; CantCopias: Integer = 3; Preview: Boolean = False; TipoRecibo: TTipoRecibo = trPlanPago);

implementation

Uses AnsiSql, unDmPrincipal, unCustomDataModule, CustomDlgs, Cuit, General,
     Numeros, strFuncs, unPrincipal, ArtFuncs, unTesoreria, unVisualizador;
{$R *.DFM}

Const
  cCantRenglonesReporte          : Integer = 42; // cantidad de renglones en donde imprimir el título de los periodos,
                                                 // los períodos (con su encabezado), su total, el título de los valores,
                                                 // los valores (con su encabezado), y su total

  cCantRenglonesTitlePeriodos    : Integer = 3;  // cantidad de renglones que ocupa la descripción (título) de los períodos
  cCantRenglonesTitleValores     : Integer = 3;  // cantidad de renglones que ocupa la descripción (título) de los valores

  cCantRenglonesHeaderPeriodos   : Integer = 1;  // cantidad de renglones que ocupa el encabezado de los períodos
  cCantRenglonesHeaderValores    : Integer = 1;  // cantidad de renglones que ocupa el encabezado de los valores

  cCantRenglonesDetailPeriodos   : Integer = 1;  // cantidad de renglones que ocupa el detail de los períodos
  cCantRenglonesDetailValores    : Integer = 1;  // cantidad de renglones que ocupa el detail de los valores

  cCantRenglonesFooterPeriodos   : Integer = 1;  // cantidad de renglones que ocupa el footer de los períodos
  cCantRenglonesFooterValores    : Integer = 1;  // cantidad de renglones que ocupa el footer de los valores

  cCantRenglonesSummaryPeriodos  : Integer = 0;  // cantidad de renglones que ocupa el summary de los períodos
  cCantRenglonesSummaryValores   : Integer = 7;  // cantidad de renglones que ocupa el summary de los valores

{----------------------------------------------------------------------------------------------------------------------}
constructor TfrmValImpresionRecibo.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Impresión del recibo }
procedure TfrmValImpresionRecibo.ImprimirRecibo(AIdRecibo: TTableID; CantCopias: Integer = 3; Preview: Boolean = False);
var
  dFechaAltaRecibo, dFechaRecibo: TDateTime;
  sDescripcionRecibo, sSql, sSql2: String;
  SqlResults: TStringList;
  IdReemplazo: string;
  Redondeo, PendienteEntrega, TotalConceptos, InteresFinanc: Currency;
begin
  fIdRecibo   := AIdRecibo;
  fIDPlanPago := ValorSql( 'SELECT PC_IDPLANPAGO ' +
                             'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA ' +
                            'WHERE PV_IDPLANCUOTA=PC_ID ' +
                              'AND PV_IDRECIBO = ' + IntToStr(AIdRecibo), '0' );

  fIDPlanPagoRecup := ValorSql( 'SELECT XC_IDPLANPAGO ' +
                                'FROM LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA ' +
                               'WHERE XV_IDCUOTA=XC_ID ' +
                                 'AND XV_IDRECIBO = ' + IntToStr(AIdRecibo), '0' );

  sSql := 'SELECT COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRORECIBO, RV_FECHA, RV_FECHAALTA, ' +
                 'SE_NOMBRE ' +
            'FROM USE_USUARIOS, RRV_RECIBOVALOR ' +
           'WHERE RV_ID=' + SqlInt( AIdRecibo ) + ' ' +
             'AND RV_USUALTA=SE_USUARIO(+)';

  with GetQuery( sSql ) do
    begin
      try
        if IsEmpty then
          begin
            MsgBox( 'No se han encontrado los datos de uno de los recibos', MB_OK + MB_ICONEXCLAMATION );
            Exit;
          end
        else
          begin
            dFechaAltaRecibo          := FieldByName( 'RV_FECHAALTA' ).AsDateTime;
            dFechaRecibo              := FieldByName( 'RV_FECHA' ).AsDateTime;
            qrlNombreFirmante.Caption := FieldByName( 'SE_NOMBRE' ).AsString;

            // fecha del recibo
            qrlDia.Caption  := FormatDateTime( 'dd', dFechaRecibo );
            qrlMes.Caption  := FormatDateTime( 'mm', dFechaRecibo );
            qrlAnio.Caption := FormatDateTime( 'yyyy', dFechaRecibo );

            qrlNumero.Caption := 'RECIBO OFICIAL Nº ' + FieldByName( 'NRORECIBO' ).AsString;
          end;
      finally
        Free;
      end;
    end;

  fTipoRecibo := GetTipoRecibo( AIdRecibo );
  sDescripcionRecibo := GetDescripcionRecibo( AIdRecibo );

  if sDescripcionRecibo = '' then
    MsgBox( 'No se han encontrado los datos de la empresa de uno de los recibos', MB_OK + MB_ICONEXCLAMATION )
  else
  begin
    if fTipoRecibo = trReemplazo then
    begin
      qrlDescripcionValores.Caption :='reemplazado con los siguientes valores:';
      qrReemp20.Caption := '  Gastos Bancarios';
    end else
    begin
      qrlDescripcionValores.Caption :='con los siguientes valores:';
      qrReemp20.Caption := '  Gastos Administrativos';
    end;

    qrlDescripcionPeriodos.Caption := sDescripcionRecibo;

    qrlLugar.Caption := 'BUENOS AIRES';

    qrlDireccionART.Caption := 'Carlos Pellegrini 91 - 4º piso - Ciudad Autónoma de BsAs ( C1009ABA )';
    qrlTelefonoART.Caption := 'Tel./Fax: 4819-2800 / 4338-4700';

    qrlCuit.Caption := 'CUIT: ' + PonerGuiones( cNroCuitART );
    qrlIngresosBrutos.Caption := 'Ing. Brutos C.M.: ' + cNroIngresosBrutosART;
    qrlIVA.Caption := 'IVA: Responsable Inscripto';
    qrlInicioActividades.Caption := 'Inicio de Actividad: 01/07/1996';


    sSql := 'SELECT TIPO, TIPOVALOR, NROCHEQUEVALOR, BANCOVALOR, IMPORTEVALOR, CONCEPTOPERIODO, IMPORTEPERIODO, FECHACHEQUE, FECHARECHAZO ' +
            '  FROM (';

    qrbGroupFooterPeriodos.Height := 60;
    if fIDPlanPago <> '0' then
    begin
      sSql := sSql +
            // períodos
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Cuota'' CONCEPTOPERIODO, SUM(PD_DEUDANOMINAL-(PD_FONDODEVENGADO-PD_FONDOPAGO)) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            '   FROM ZPD_PLANDEUDA' +
            '  WHERE PD_IDPLANPAGO =' + fIDPlanPago +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Fondo'' CONCEPTOPERIODO, SUM(PD_FONDODEVENGADO-PD_FONDOPAGO) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            '   FROM ZPD_PLANDEUDA' +
            '  WHERE PD_IDPLANPAGO =' + fIDPlanPago  +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Interés por Mora'' CONCEPTO, SUM(PD_INTERESMORA) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            '  FROM ZPD_PLANDEUDA' +
            ' WHERE PD_IDPLANPAGO = ' + fIDPlanPago +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Descuento Interés por Mora'' CONCEPTO, ' +
            '        ROUND(SUM(PP_PORCDESCINTERES*PD_INTERESMORA/100*(-1)),2)-MAX(PP_MONTODESCINTERES) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            '  FROM ZPP_PLANPAGO, ZPD_PLANDEUDA' +
            ' WHERE PD_IDPLANPAGO = PP_ID' +
            '   AND PP_ID = ' + fIDPlanPago +
            ' HAVING ROUND(SUM(PP_PORCDESCINTERES*PD_INTERESMORA*(-1)/100), 2)-MAX(PP_MONTODESCINTERES) <> 0' +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR,' +
            '        ''Gastos Administrativos'' CONCEPTOPERIODO, PP_GASTOADMINISTRATIVO IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            '   FROM ZPP_PLANPAGO' +
            '  WHERE PP_ID =' + fIDPlanPago +
            '    AND PP_GASTOADMINISTRATIVO <> 0' +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Interés por Financiación'' CONCEPTOPERIODO, NVL(SUM(PC_INTERESFINANC), 0) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            '   FROM ZPC_PLANCUOTA' +
            '  WHERE PC_IDPLANPAGO =' + fIDPlanPago +
            '    AND PC_INTERESFINANC <> 0' +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Redondeo'' CONCEPTOPERIODO, NVL(-SUM(PV_IMPORTE), 0) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            ' FROM OTV_TIPOVALOR, ZVA_VALOR, ZPV_PLANVALOR, ZPC_PLANCUOTA' +
            ' WHERE PV_IDPLANCUOTA = PC_ID' +
            '   AND VA_ID = PV_IDVALOR' +
            '   AND VA_IDTIPOVALOR = TV_ID' +
            '   AND TV_CODIGO = ''RED''' +
            '   AND PV_FECHABAJA IS NULL' +
            '   AND PC_IDPLANPAGO =' + fIDPlanPago;
    end
    else if fIDPlanPagoRecup <> '0' then
    begin
      sSql := sSql +
            // períodos
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '         ''Recupero Siniestro '' || UTILES.ARMAR_SINIESTRO(RS_SINIESTRO, RS_ORDEN, 0) || '' - '' || CONC.TB_DESCRIPCION CONCEPTOPERIODO, XP_IMPORTE IMPORTEPERIODO, ' +
            '         TO_DATE(NULL) FECHACHEQUE, TO_DATE(NULL) FECHARECHAZO ' +
            '    FROM CTB_TABLAS CONC, LRS_RECUPEROSINIESTROS, LXP_RECUPEROPLAN ' +
            '   WHERE RS_ID = XP_IDRECUPEROSINIESTRO ' +
            '     AND CONC.TB_CODIGO = XP_CONCEPTO ' +
            '     AND CONC.TB_CLAVE = ''LCPRS'' ' +
            '     AND XP_ID =' + fIDPlanPagoRecup +
            ' UNION ALL' +
            ' SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
            '        ''Redondeo'' CONCEPTOPERIODO, NVL(-SUM(XV_IMPORTE), 0) IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
            '        TO_DATE(NULL) FECHARECHAZO' +
            ' FROM OTV_TIPOVALOR, ZVA_VALOR, LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA' +
            ' WHERE XV_IDCUOTA = XC_ID' +
            '   AND VA_ID = XV_IDVALOR' +
            '   AND VA_IDTIPOVALOR = TV_ID' +
            '   AND TV_CODIGO = ''RED''' +
            '   AND XV_FECHABAJA IS NULL' +
            '   AND XC_IDPLANPAGO =' + fIDPlanPagoRecup;
    end
    else
    begin
      case fTipoRecibo of
        trReemplazo:
        begin
          qrbGroupFooterPeriodos.Height := 164;
          SqlResults := ValoresColSql( 'SELECT RD_IDREEMPLAZOVALOR, SUM(RD_IMPORTEINTERES) ' +
                                       '  FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR' +
                                       ' WHERE VA_ID = RD_IDVALOR' +
                                       '   AND RD_TIPO = ''E''' +
                                       '   AND VA_IDRECIBO=' + SqlInt( AIdRecibo ) +
                                       ' GROUP BY RD_IDREEMPLAZOVALOR');
          try
            IdReemplazo := SqlResults[0];
            InteresFinanc := StrToCurr(SqlResults[1]);
            qrReemp41.Caption := '$ ' + CurrToStrF( InteresFinanc, ffNumber, 2 );
          finally
            SqlResults.Free;
          end;

          SqlResults := ValoresColSql( 'SELECT RV_GASTOADMINISTRATIVO, RV_INTERESMORA*(1-RV_PORCDESCINTERES/100)-RV_MONTODESCINTERES, RV_MONTOTOTAL' +
                                       '  FROM ZRV_REEMPLAZOVALOR' +
                                       ' WHERE RV_ID = ' + IdReemplazo);
          try
            Redondeo := ValorSqlExtended('SELECT NVL(-SUM(VA_IMPORTE), 0) ' +
                                           'FROM OTV_TIPOVALOR, ZVA_VALOR, ZRD_REEMPLAZODETALLE ' +
                                           'WHERE VA_ID = RD_IDVALOR ' +
                                             'AND VA_IDTIPOVALOR = TV_ID ' +
                                             'AND TV_CODIGO = ''RED'' ' +
                                             'AND RD_TIPO = ''E'' ' +
                                             'AND RD_IDREEMPLAZOVALOR = ' + SqlValue(IdReemplazo));

            TotalConceptos := StrToCurr(SqlResults[2]) + InteresFinanc + Redondeo;

            qrReemp21.Caption := '$ ' + CurrToStrF( StrToCurr(SqlResults[0]), ffNumber, 2 );
            qrReemp31.Caption := '$ ' + CurrToStrF( StrToCurr(SqlResults[1]), ffNumber, 2 );
            qrReemp51.Caption := '$ ' + CurrToStrF( TotalConceptos, ffNumber, 2 );
            qrReemp45.Caption := '$ ' + CurrToStrF( Redondeo, ffNumber, 2 );
          finally
            SqlResults.Free;
          end;

          sSql2 := 'SELECT NVL(SUM(VA_IMPORTE), 0) ' +
                     'FROM ZVA_VALOR, ZRD_REEMPLAZODETALLE ' +
                    'WHERE RD_IDREEMPLAZOVALOR = (SELECT MAX(RD_IDREEMPLAZOVALOR) ' +
                                                   'FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR ' +
                                                  'WHERE RD_TIPO = ''E'' ' +
                                                    'AND VA_ID = RD_IDVALOR ' +
                                                    'AND VA_IDRECIBO=' + SqlInt( AIdRecibo ) + ') ' +
                      'AND RD_IDVALOR = VA_ID ' +
                      'AND RD_TIPO = ''E'' ' +
                      'AND RD_FECHAALTA<=' + SqlDate(dFechaAltaRecibo);

          PendienteEntrega := TotalConceptos - ValorSqlExtended(sSql2);

          if CompareFloat2(PendienteEntrega, 0) = 1 then   // PendienteEntrega > 0
            qrlAdicional.Caption := 'Queda pendiente de entrega valores por ' + CurrToStrF(PendienteEntrega, ffCurrency, 2) + '.';

          sSql := sSql +
            'SELECT 0 TIPO, TV_DESCRIPCION TIPOVALOR, TO_CHAR(VA_NROCHEQUE) NROCHEQUEVALOR, BA_NOMBRE BANCOVALOR,' +
            '       VA_IMPORTE IMPORTEVALOR, NULL CONCEPTOPERIODO, 0 IMPORTEPERIODO, VA_VENCIMIENTO FECHACHEQUE,' +
            '       VA_FECHARECHAZO FECHARECHAZO' +
            '  FROM ZVA_VALOR, OTV_TIPOVALOR, ZBA_BANCO, ZRD_REEMPLAZODETALLE' +
            ' WHERE VA_IDTIPOVALOR=TV_ID(+)' +
            '   AND VA_IDBANCO=BA_ID(+)' +
            '   AND VA_ID = RD_IDVALOR' +
            '   AND RD_TIPO = ''R''' +
            '   AND RD_IDREEMPLAZOVALOR = ' + IdReemplazo;
        end;
      else
        begin
          sSql := sSql +
                'SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
                '       DECODE(VA_CONCEPTOOBS, '''',CV_DESCRIPCION, CV_DESCRIPCION || ''('' || VA_CONCEPTOOBS || '')'') CONCEPTOPERIODO, VA_IMPORTE IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
                '       VA_FECHARECHAZO FECHARECHAZO' +
                '  FROM OCV_CONCEPTOVALOR, ZVA_VALOR' +
                ' WHERE VA_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
                '   AND VA_IDCONCEPTOVALOR=CV_ID ' +
                '   AND CV_IVA <> ''S''' +
                ' UNION ALL ' +
                'SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
                '       DECODE(VA_CONCEPTOOBS, '''',CV_DESCRIPCION, CV_DESCRIPCION || ''('' || VA_CONCEPTOOBS || '')'') CONCEPTOPERIODO, VA_IMPORTE/1.21 IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
                '       VA_FECHARECHAZO FECHARECHAZO' +
                '  FROM OCV_CONCEPTOVALOR, ZVA_VALOR' +
                ' WHERE VA_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
                '   AND VA_IDCONCEPTOVALOR=CV_ID ' +
                '   AND CV_IVA = ''S''' +
                ' UNION ALL ' +
                'SELECT 1 TIPO, NULL TIPOVALOR, NULL NROCHEQUEVALOR, NULL BANCOVALOR, 0 IMPORTEVALOR, ' +
                '       ''IVA 21% S/'' || CV_DESCRIPCION CONCEPTOPERIODO, SUM(VA_IMPORTE)*0.21/1.21 IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
                '       VA_FECHARECHAZO FECHARECHAZO' +
                '  FROM OCV_CONCEPTOVALOR, ZVA_VALOR' +
                ' WHERE VA_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
                '   AND VA_IDCONCEPTOVALOR=CV_ID ' +
                '   AND CV_IVA = ''S''' +
                ' GROUP BY CV_DESCRIPCION, VA_FECHARECHAZO ';
        end;
      end;
    end;
    sSql := sSql +
    ') UNION ALL ';

    // valores elegidos
    case fTipoRecibo of
      trComun, trReemplazo:
        sSql := sSql +
        '(SELECT 2 TIPO, TV_DESCRIPCION TIPOVALOR, TO_CHAR(VA_NROCHEQUE) NROCHEQUEVALOR, ' +
                'BA_NOMBRE BANCOVALOR, VA_IMPORTE IMPORTEVALOR, NULL CONCEPTOPERIODO, 0 IMPORTEPERIODO, VA_VENCIMIENTO FECHACHEQUE, ' +
                'VA_FECHARECHAZO FECHARECHAZO ' +
           'FROM ZVA_VALOR, OTV_TIPOVALOR, ZBA_BANCO ' +
          'WHERE VA_IDTIPOVALOR=TV_ID(+) ' +
            'AND VA_IDBANCO=BA_ID(+) ' +
            'AND VA_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
          ' ) ';

      trPlanPago:
       sSql := sSql +
        '(SELECT 2 TIPO, TV_DESCRIPCION TIPOVALOR, TO_CHAR(VA_NROCHEQUE) NROCHEQUEVALOR, ' +
                'BA_NOMBRE BANCOVALOR, PV_IMPORTE IMPORTEVALOR, NULL CONCEPTOPERIODO, 0 IMPORTEPERIODO, VA_VENCIMIENTO FECHACHEQUE, ' +
                'VA_FECHARECHAZO FECHARECHAZO ' +
           'FROM ZVA_VALOR, ZPV_PLANVALOR, OTV_TIPOVALOR, ZBA_BANCO ' +
          'WHERE VA_IDTIPOVALOR=TV_ID(+) ' +
            'AND VA_IDBANCO=BA_ID(+) ' +
            'AND PV_IDVALOR=VA_ID ' +
            'AND PV_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
          'UNION ALL ' +
         'SELECT 2 TIPO, ''Bol. Depos.'' TIPOVALOR, DM_NRODEPOSITO NROCHEQUEVALOR, ' +
                'BA_NOMBRE BANCOVALOR, PV_IMPORTE IMPORTEVALOR, NULL CONCEPTOPERIODO, 0 IMPORTEPERIODO, DM_FECHADEPOSITO FECHACHEQUE, ' +
                'TO_DATE(NULL) FECHARECHAZO ' +
          'FROM ZDM_DEPOSITOMANUAL, ZPV_PLANVALOR, RRM_REMESA, ZCB_CUENTABANCARIA, ZBA_BANCO ' +
         'WHERE DM_IDPLANVALOR=PV_ID ' +
           'AND DM_IDREMESA=RM_ID ' +
           'AND RM_IDCUENTABANCARIA=CB_ID ' +
           'AND CB_IDBANCO=BA_ID ' +
           'AND PV_IDRECIBO=' + SqlInt( AIdRecibo ) +
          'UNION ALL ' +
         'SELECT 2 TIPO, ''Cert. Retención'' TIPOVALOR, CT_NUMERO NROCHEQUEVALOR, ' +
                'NULL BANCOVALOR, CT_IMPORTE IMPORTEVALOR, NULL CONCEPTOPERIODO, 0 IMPORTEPERIODO, TO_DATE(NULL) FECHACHEQUE, ' +
                'TO_DATE(NULL) FECHARECHAZO ' +
          'FROM ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR ' +
         'WHERE CT_IDPLANVALOR=PV_ID ' +
           'AND CT_IDRECIBO=' + SqlInt( AIdRecibo ) +
        ') ';

      trPlanPagoRecup:
       sSql := sSql +
        '(SELECT 2 TIPO, TV_DESCRIPCION TIPOVALOR, TO_CHAR(VA_NROCHEQUE) NROCHEQUEVALOR, ' +
                'BA_NOMBRE BANCOVALOR, XV_IMPORTE IMPORTEVALOR, NULL CONCEPTOPERIODO, 0 IMPORTEPERIODO, VA_VENCIMIENTO FECHACHEQUE, ' +
                'VA_FECHARECHAZO FECHARECHAZO ' +
           'FROM ZVA_VALOR, LXV_RECUPEROVALOR, OTV_TIPOVALOR, ZBA_BANCO ' +
          'WHERE VA_IDTIPOVALOR=TV_ID(+) ' +
            'AND VA_IDBANCO=BA_ID(+) ' +
            'AND XV_IDVALOR=VA_ID ' +
            'AND XV_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
        ') ';
    end;

    sSql := sSql + 'ORDER BY TIPO, TIPOVALOR';

    OpenQuery( sdqValoresYPeriodos, sSql );
    piCantidadPaginas := GetCantidadPaginas( sdqValoresYPeriodos.SQL.Text );

    qrLeyenda.Caption := 'ORIGINAL PARA EL CLIENTE';
    if Preview then
      Visualizar(qrpRecibo, GetValores('-' + qrLeyenda.Caption), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal])
    else
      qrpRecibo.Print;
    // Cambiado xque no aparecen leyendas de duplicado y triplicado qrpRecibo.Preview;

    if not Preview then
      begin
        if CantCopias >= 2 then
          begin
            qrLeyenda.Caption := 'DUPLICADO';
            qrpRecibo.Print;
          end;

        if CantCopias >= 3 then
          begin
            qrLeyenda.Caption := 'TRIPLICADO';
            qrpRecibo.Print;
          end;

        MessageDlg('La operación se ha completado', mtInformation, [mbOK], 0);
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Devuelve la descripción con la razón social, cuit, importe, etc, del recibo}
function TfrmValImpresionRecibo.GetDescripcionRecibo( AIdRecibo: TTableID ): String;
var
  sSql, sCuit, sRazonSocial, sContrato, DescripcionRecibo, sSqlImpTotal, sPlan: String;
  sNomEstudio, sCuitEstudio, sImporte: String;
  rImporteTotal: Currency;
begin
  case fTipoRecibo of
    trReemplazo:
      begin
        sSql := 'SELECT EM_CUIT, EM_NOMBRE, CO_CONTRATO ' +
                  'FROM ZVA_VALOR, ACO_CONTRATO, AEM_EMPRESA ' +
                 'WHERE VA_IDCONTRATO=CO_CONTRATO ' +
                   'AND CO_IDEMPRESA=EM_ID ' +
                   'AND VA_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
                 'UNION ' +
                'SELECT ED_CUIT, ED_NOMBRE, NULL ' +
                  'FROM ZVA_VALOR, RED_EMPDEUDORA ' +
                 'WHERE VA_IDEMPDEUDORA=ED_ID ' +
                   'AND VA_IDRECIBO=' + SqlInt( AIdRecibo );

        sSqlImpTotal := 'SELECT SUM(VA_IMPORTE) ' +
                          'FROM ZVA_VALOR ' +
                         'WHERE VA_IDRECIBO=' + SqlInt( AIdRecibo );
      end;

    trComun:
      begin
        sSql := 'SELECT DISTINCT ED_NOMBRE, ED_CUIT ' +
                  'FROM ZVA_VALOR, RED_EMPDEUDORA ' +
                 'WHERE VA_IDEMPDEUDORA=ED_ID ' +
                   'AND VA_IDRECIBO=' + SqlInt( AIdRecibo );

        sSqlImpTotal := 'SELECT SUM(VA_IMPORTE) ' +
                          'FROM ZVA_VALOR ' +
                         'WHERE VA_IDRECIBO=' + SqlInt( AIdRecibo );
      end;

    trPlanPago:
      begin
        sSql := 'SELECT DISTINCT 1 TIPO, NULL NOM_ESTUDIO, NULL CUIT_ESTUDIO, CO_CONTRATO, ' +
                       'EM_CUIT, EM_NOMBRE, PP_ID ' +
                  'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO, ZVA_VALOR, ACO_CONTRATO, ' +
                       'AEM_EMPRESA ' +
                 'WHERE PV_IDVALOR=VA_ID ' +
                   'AND PV_IDPLANCUOTA=PC_ID ' +
                   'AND PC_IDPLANPAGO=PP_ID ' +
                   'AND VA_IDCONTRATO=CO_CONTRATO ' +
                   'AND CO_IDEMPRESA=EM_ID ' +
                   'AND PV_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
                 'UNION ALL ' +
                'SELECT DISTINCT 2 TIPO, GC_NOMBRE NOM_ESTUDIO, GC_CUIT CUIT_ESTUDIO, CO_CONTRATO, ' +
                        'EM_CUIT, EM_NOMBRE, PP_ID ' +
                  'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO, ZVA_VALOR, ACO_CONTRATO, ' +
                       'AEM_EMPRESA, AGC_GESTORCUENTA ' +
                 'WHERE PV_IDVALOR=VA_ID ' +
                   'AND PV_IDPLANCUOTA=PC_ID ' +
                   'AND PC_IDPLANPAGO=PP_ID ' +
                   'AND PP_CONTRATO=CO_CONTRATO ' +
                   'AND CO_IDEMPRESA=EM_ID ' +
                   'AND VA_IDGESTORCUENTA=GC_ID ' +
                   'AND PV_IDRECIBO=' + SqlInt( AIdRecibo ) + ' ' +
                 'UNION ALL ' +
                'SELECT DISTINCT 2 TIPO, GC_NOMBRE NOM_ESTUDIO, GC_CUIT CUIT_ESTUDIO, CO_CONTRATO, ' +
                        'EM_CUIT, EM_NOMBRE, PP_ID ' +
                  'FROM ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO, ZDM_DEPOSITOMANUAL, ACO_CONTRATO, ' +
                       'AEM_EMPRESA, AGC_GESTORCUENTA ' +
                 'WHERE PV_ID=DM_IDPLANVALOR ' +
                   'AND PV_IDPLANCUOTA=PC_ID ' +
                   'AND PC_IDPLANPAGO=PP_ID ' +
                   'AND PP_CONTRATO=CO_CONTRATO ' +
                   'AND CO_IDEMPRESA=EM_ID ' +
                   'AND DM_IDGESTORCUENTA=GC_ID ' +
                   'AND PV_IDRECIBO=' + SqlInt( AIdRecibo );

        sSqlImpTotal := 'SELECT SUM(PV_IMPORTE) ' +
                          'FROM ZPV_PLANVALOR ' +
                         'WHERE PV_IDRECIBO=' + SqlInt( AIdRecibo );
      end;

    trPlanPagoRecup:
      begin
        sSql := 'SELECT DISTINCT ED_NOMBRE, ED_CUIT ' +
                  'FROM LXV_RECUPEROVALOR, ZVA_VALOR, RED_EMPDEUDORA ' +
                 'WHERE VA_IDEMPDEUDORA=ED_ID ' +
                   'AND VA_ID=XV_IDVALOR ' +
                   'AND XV_IDRECIBO=' + SqlInt( AIdRecibo );

        sSqlImpTotal := 'SELECT SUM(XV_IMPORTE) ' +
                          'FROM LXV_RECUPEROVALOR ' +
                         'WHERE XV_IDRECIBO=' + SqlInt( AIdRecibo );
      end;
  else
    exit;
  end;

  rImporteTotal := ValorSqlExtended( sSqlImpTotal );

  sImporte := LowerCase(NumLetras(rImporteTotal, 2));
  if InStr(sImporte, ' con ') <> 0 then
    sImporte := sImporte + '/100';

  with GetQuery( sSql ) do
    begin
      try
        if IsEmpty then
          DescripcionRecibo := ''
        else
          begin
            case fTipoRecibo of
              trReemplazo:
                begin
                    sCuit        := FieldByName( 'EM_CUIT' ).AsString;
                    sRazonSocial := FieldByName( 'EM_NOMBRE' ).AsString;
                    sCuit        := PonerGuiones(sCuit);

                    DescripcionRecibo := 'Recibimos de ' + sRazonSocial + ', CUIT Nº ' + sCuit +
                                         ' la suma de pesos ' + sImporte +
                                         ' por los siguientes conceptos:';
                end;

              trComun, trPlanPagoRecup:
                begin
                  sCuit        := FieldByName( 'ED_CUIT' ).AsString;
                  sRazonSocial := FieldByName( 'ED_NOMBRE' ).AsString;
                  sCuit        := PonerGuiones(sCuit);

                  DescripcionRecibo := 'Recibimos de ' + sRazonSocial + ', CUIT Nº ' + sCuit +
                                       ' la suma de pesos ' + sImporte +
                                       ' en pago de los siguientes conceptos:';
                end;

              trPlanPago:
                begin
                  sCuit        := FieldByName( 'EM_CUIT' ).AsString;
                  sRazonSocial := FieldByName( 'EM_NOMBRE' ).AsString;
                  sContrato    := FieldByName( 'CO_CONTRATO' ).AsString;
                  sCuit        := PonerGuiones(sCuit);
                  sPlan        := FieldByName( 'PP_ID' ).AsString;

                  DescripcionRecibo := 'Recibimos de ';

                  if FieldByName( 'TIPO' ).AsInteger = 2 then
                    begin
                      sNomEstudio  := FieldByName( 'NOM_ESTUDIO' ).AsString;
                      sCuitEstudio := FieldByName( 'CUIT_ESTUDIO' ).AsString;

                      DescripcionRecibo := DescripcionRecibo +
                                           sNomEstudio + ', CUIT Nº ' + sCuitEstudio +
                                           ', por cuenta y orden de ';
                    end;

                  DescripcionRecibo := DescripcionRecibo +
                                       sRazonSocial + ', CUIT Nº ' + sCuit +
                                       ', Contrato Nº ' + sContrato +
                                       ' la suma de pesos ' + sImporte +
                                       ' en pago de los siguientes conceptos indicados en plan/convenio Nº ' + sPlan + ':';
                end;
            end;
          end;
      finally
        Free;
      end;
    end;

  Result := DescripcionRecibo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.sdqValoresYPeriodosAfterOpen(DataSet: TDataSet);
begin
  if sdqValoresYPeriodos.FieldByName( 'IMPORTEVALOR' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqValoresYPeriodos.FieldByName( 'IMPORTEVALOR' ) ).Currency := True;

  if sdqValoresYPeriodos.FieldByName( 'IMPORTEPERIODO' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqValoresYPeriodos.FieldByName( 'IMPORTEPERIODO' ) ).Currency := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmValImpresionRecibo.IsValor: Boolean;
begin
  Result := (sdqValoresYPeriodos.FieldByName( 'TIPO' ).AsInteger = 2) or (sdqValoresYPeriodos.FieldByName( 'TIPO' ).AsInteger = 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.MostrarDetail();
var
  bEsValor: Boolean;
begin
  bEsValor := IsValor();

  qrdbConcepto.Enabled         := not bEsValor;
  qrdbImportePeriodo.Enabled   := not bEsValor;
  qrsVert2Periodos.Enabled     := not bEsValor;

  qrdbTipo.Enabled             := bEsValor;
  qrdbNroCheque.Enabled        := bEsValor;
  qrdbFechaCheque.Enabled      := bEsValor;
  qrdbBanco.Enabled            := bEsValor;
  qrdbImporte.Enabled          := bEsValor;
  qrsVert1Periodos.Enabled     := bEsValor;
  qrsVert1Valores.Enabled      := bEsValor;
  qrsVert2Valores.Enabled      := bEsValor;
  qrsVert3Valores.Enabled      := bEsValor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.MostrarChildHeader();
var
  bEsValor: Boolean;
begin
  bEsValor := IsValor();

  qrsVert1HeaderValores.Enabled   := bEsValor;
  qrsVert2HeaderValores.Enabled   := bEsValor;
  qrsVert4HeaderValores.Enabled   := bEsValor;
  qrlHeaderTipo.Enabled           := bEsValor;
  qrlHeaderFecha.Enabled          := bEsValor;
  qrlHeaderNro.Enabled            := bEsValor;
  qrlHeaderBanco.Enabled          := bEsValor;
  qrlHeaderImporteValor.Enabled   := bEsValor;

  qrlHeaderConcepto.Enabled       := not bEsValor;
  qrlHeaderImportePeriodo.Enabled := not bEsValor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.MostrarSummary;
var
  MostrarReemplazos, bEsValor: Boolean;
  SaldoPendiente: extended;
  sSql: String;
begin
  bEsValor := IsValor();
  qreSumaImporteValores.Enabled   := IsValor ;
  qreSumaImportePeriodos.Enabled  := not IsValor ;

  MostrarReemplazos     := (fTipoRecibo = trReemplazo) and pbMostrarDescripcionValor;
  qrReemp10.Enabled     := MostrarReemplazos;
  qrReemp20.Enabled     := MostrarReemplazos;
  qrReemp30.Enabled     := MostrarReemplazos;
  qrReemp40.Enabled     := MostrarReemplazos;
  qrReemp44.Enabled     := MostrarReemplazos;
  qrReemp50.Enabled     := MostrarReemplazos;
  qrReemp11.Enabled     := MostrarReemplazos;
  qrReemp21.Enabled     := MostrarReemplazos;
  qrReemp31.Enabled     := MostrarReemplazos;
  qrReemp41.Enabled     := MostrarReemplazos;
  qrReemp45.Enabled     := MostrarReemplazos;
  qrReemp51.Enabled     := MostrarReemplazos;
  qrlAdicional.Enabled  := not MostrarReemplazos;

  if MostrarReemplazos then
    qrlTotalValores.Caption := 'SUBTOTAL'
  else
    qrlTotalValores.Caption := 'TOTAL';

  if bEsValor then
  begin
    if fTipoRecibo =  trPlanPagoRecup then
      sSql := 'SELECT LEGALES.GETTOTIMPORTESANTRECIBOPLANREC(:IdRecibo) ' +
                'FROM DUAL'
    else
      sSql := 'SELECT COBRANZA.GETTOTALIMPORTESANTRECIBOPLAN(:IdRecibo) ' +
                'FROM DUAL';

    SaldoPendiente := qreSumaImportePeriodos.Value.dblResult - qreSumaImporteValores.Value.dblResult - ValorSqlExtendedEx( sSql, [fIdRecibo] );

    if (fIDPlanPago <> '0') and (CurrToStrF(SaldoPendiente,ffCurrency, 2) > '$ 0,00') then
      qrlAdicional.Caption := 'Queda pendiente de entrega valores por ' + CurrToStrF(SaldoPendiente, ffCurrency, 2) + ' del plan mencionado.'
    else
      qrlAdicional.Caption := '';
  end
  else
    qrlAdicional.Caption := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.qrbDetailValoresYPeriodosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  MostrarDetail;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.qcbValoresYPeriodosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  MostrarChildHeader;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.qrbGroupFooterPeriodosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  MostrarSummary;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.qrgValoresBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if IsValor and pbMostrarDescripcionValor then
    begin
      pbMostrarDescripcionValor := False;
      PrintBand := True;
    end
  else
  begin
    pbMostrarDescripcionValor := True;
    PrintBand := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.DoIncrementarPagina(bMantenerSeccionJunta: Boolean; iCantRenglonesReporte, iCantRenglonesSeccion: Integer; var iCantPaginas, iRenglonesUsados: Integer);
begin
  iCantPaginas := iCantPaginas + 1;

  if bMantenerSeccionJunta then
    iRenglonesUsados := iCantRenglonesSeccion
  else
    iRenglonesUsados := iRenglonesUsados - iCantRenglonesReporte;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.DoCalcularPaginas(srSeccionReporte: TSeccionesReporte; iCantRenglonesReporte, iCantRenglonesTitulo, iCantRenglonesHeader, iCantRenglonesDetail, iCantRenglonesFooter, iCantRenglonesSummary: Integer; var iCantPaginas, iRenglonesUsados, iCantidadRegistros: Integer);
var
  iRenglonesUsadosAnt, iCantRenglones: Integer;
  srProxSeccion: TSeccionesReporte;
begin
  case srSeccionReporte of
    srTitulo:
      begin
        iCantRenglones := iCantRenglonesTitulo;
        srProxSeccion  := srHeader;
      end;

    srHeader:
      begin
        iCantRenglones := iCantRenglonesHeader;
        srProxSeccion  := srDetail;
      end;

    srDetail:
      begin
        iCantRenglones := iCantRenglonesDetail;
        srProxSeccion  := srNone;
      end;

    srFooter:
      begin
        iCantRenglones := iCantRenglonesFooter;
        srProxSeccion  := srSummary;
      end;

    srSummary:
      begin
        iCantRenglones := iCantRenglonesSummary;
        srProxSeccion  := srNone;
      end;
  else
    iCantRenglones := 0;
    srProxSeccion  := srNone;
  end;


  case srSeccionReporte of
    srTitulo, srHeader, srFooter, srSummary:
      begin
        iRenglonesUsados := iRenglonesUsados + iCantRenglones;

        if iRenglonesUsados > iCantRenglonesReporte then
          DoIncrementarPagina( True, iCantRenglonesReporte, iCantRenglones, iCantPaginas, iRenglonesUsados );

        DoCalcularPaginas( srProxSeccion, iCantRenglonesReporte, iCantRenglonesTitulo, iCantRenglonesHeader, iCantRenglonesDetail, iCantRenglonesFooter, iCantRenglonesSummary, iCantPaginas, iRenglonesUsados, iCantidadRegistros );
      end;

    srDetail:
      begin
        iRenglonesUsadosAnt := iRenglonesUsados;
        iRenglonesUsados    := iRenglonesUsados + (iCantidadRegistros * iCantRenglones);

        if iRenglonesUsados > iCantRenglonesReporte then
          begin
            iRenglonesUsados := iCantRenglonesReporte + 1;
            DoIncrementarPagina( False, iCantRenglonesReporte, iCantRenglones, iCantPaginas, iRenglonesUsados );

            iCantidadRegistros := iCantidadRegistros - (iCantRenglonesReporte - iRenglonesUsadosAnt + 1);

            srProxSeccion := srDetail;
          end
        else
          srProxSeccion := srFooter;

        DoCalcularPaginas( srProxSeccion, iCantRenglonesReporte, iCantRenglonesTitulo, iCantRenglonesHeader, iCantRenglonesDetail, iCantRenglonesFooter, iCantRenglonesSummary, iCantPaginas, iRenglonesUsados, iCantidadRegistros );
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Devuelve la cantidad total de páginas que va a ocupar el reporte }
function TfrmValImpresionRecibo.GetCantidadPaginas(sSqlPeriodosYValores: String): Integer;
var
  iCantPaginas, iRenglonesUsados, iCantRenglonesTitle, iCantRenglonesHeader: Integer;
  iCantRenglonesDetail, iCantRenglonesFooter, iCantidadRegistros, iCantRenglonesSummary: Integer;
  sSql: String;
begin
  iCantPaginas     := 0;
  iRenglonesUsados := 0;

  sSql := 'SELECT TIPO, COUNT(*) CANTIDAD ' +
           ' FROM (' + sSqlPeriodosYValores + ') ' +
        'GROUP BY TIPO';

  with GetQuery( sSql ) do
    try
      if not IsEmpty then
        begin
          while not eof do
            begin
              case FieldByName( 'TIPO' ).AsInteger of
                1: begin  // períodos
                     iCantRenglonesTitle    := cCantRenglonesTitlePeriodos;
                     iCantRenglonesHeader   := cCantRenglonesHeaderPeriodos;
                     iCantRenglonesDetail   := cCantRenglonesDetailPeriodos;
                     iCantRenglonesFooter   := cCantRenglonesFooterPeriodos;
                     iCantRenglonesSummary  := cCantRenglonesSummaryPeriodos;
                   end;

                2: begin  // valores
                     iCantRenglonesTitle    := cCantRenglonesTitleValores;
                     iCantRenglonesHeader   := cCantRenglonesHeaderValores;
                     iCantRenglonesDetail   := cCantRenglonesDetailValores;
                     iCantRenglonesFooter   := cCantRenglonesFooterValores;
                     iCantRenglonesSummary  := cCantRenglonesSummaryValores;
                   end;
              else
                iCantRenglonesTitle    := 0;
                iCantRenglonesHeader   := 0;
                iCantRenglonesDetail   := 0;
                iCantRenglonesFooter   := 0;
                iCantRenglonesSummary  := 0;
              end;

              iCantidadRegistros := FieldByName( 'CANTIDAD' ).AsInteger;

              DoCalcularPaginas( srTitulo, cCantRenglonesReporte, iCantRenglonesTitle, iCantRenglonesHeader, iCantRenglonesDetail, iCantRenglonesFooter, iCantRenglonesSummary, iCantPaginas, iRenglonesUsados, iCantidadRegistros );

              Next;
            end;
        end;
    finally
      Free;
    end;

  if iRenglonesUsados <> 0 then 
    iCantPaginas := iCantPaginas + 1;

  Result := iCantPaginas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr( qrpRecibo.PageNumber ) + '/' + IntToStr( piCantidadPaginas );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmValImpresionRecibo.GetTipoRecibo(AIdRecibo: TTableID): TTipoRecibo;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZVA_VALOR ' +
           'WHERE VA_IDRECIBO=' + SqlValue( AIdRecibo );

  if ExisteSql( sSql ) then
    begin
      //Podría tratarse de un recibo comun o de uno de reemplazo
      sSql := 'SELECT 1' +
              '  FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR' +
              ' WHERE VA_ID = RD_IDVALOR ' +
              '   AND RD_TIPO = ''E''' +
              '   AND VA_IDRECIBO=' + SqlValue( AIdRecibo );

      if ExisteSql( sSql ) then
        Result := trReemplazo
      else
        Result := trComun;
    end
  else
    begin
      sSql := 'SELECT 1 ' +
                'FROM ZPV_PLANVALOR ' +
               'WHERE PV_IDRECIBO=' + SqlValue( AIdRecibo );

      if ExisteSql( sSql ) then
        Result := trPlanPago
      else
        begin
          sSql := 'SELECT 1 ' +
                    'FROM LXV_RECUPEROVALOR ' +
                   'WHERE XV_IDRECIBO=' + SqlValue( AIdRecibo );

          if ExisteSql( sSql ) then
            Result := trPlanPagoRecup
          else
            Result := trNone;
        end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure ReImprimirRecibo(AIdRecibo: TTableID; CantCopias: Integer = 3; Preview: Boolean = False);
var
  sSql: String;
begin
  sSql := 'UPDATE RRV_RECIBOVALOR ' +
             'SET RV_FECHAREIMP=' + SqlValue( DBDateTime ) + ', ' +
                 'RV_CANTREIMP=RV_CANTREIMP + 1 ' +
           'WHERE RV_ID=' + SqlValue( AIdRecibo );

  EjecutarSql( sSql );

  with TfrmValImpresionRecibo.Create( nil ) do
    try
      ImprimirRecibo( AIdRecibo, CantCopias, Preview );
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure DoReImprimirRecibosPlan(AIdPlanPago: TTableId; CantCopias: Integer = 3; Preview: Boolean = False; TipoRecibo: TTipoRecibo = trPlanPago);
var
  sListaValores, sSql: String;
  IdRecibo: TTableId;
begin
  case TipoRecibo of
    trPlanPago:
      begin
        sListaValores := ObtenerValorEx( 'COBRANZA.GET_LISTAVALORESREEMPLAZPLAN(:PlanPago)', [AIdPlanPago] );

        sSql := 'SELECT DISTINCT RV_ID IDRECIBO ' +
                  'FROM RRV_RECIBOVALOR, ZPV_PLANVALOR, ZPC_PLANCUOTA ' +
                 'WHERE PV_IDPLANCUOTA = PC_ID ' +
                   'AND RV_FECHAIMPRESION IS NOT NULL ' +
                   'AND PV_IDRECIBO = RV_ID ' +
                   'AND RV_FECHABAJA IS NULL ' +
                   'AND PC_IDPLANPAGO = :PlanPago ' +
                 'UNION ' +
                'SELECT DISTINCT RV_ID IDRECIBO ' +
                  'FROM RRV_RECIBOVALOR, ZVA_VALOR ' +
                 'WHERE RV_FECHAIMPRESION IS NOT NULL ' +
                   'AND VA_IDRECIBO = RV_ID ' +
                   'AND RV_FECHABAJA IS NULL ' +
                   'AND VA_ID IN ' + sListaValores;
      end;

    trPlanPagoRecup:
      begin
        sListaValores := ObtenerValorEx( 'LEGALES.GET_LISTAVALORESREEMPLPLANREC(:PlanPago)', [AIdPlanPago] );

        sSql := 'SELECT DISTINCT RV_ID IDRECIBO ' +
                  'FROM RRV_RECIBOVALOR, LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA ' +
                 'WHERE XV_IDCUOTA = XC_ID ' +
                   'AND RV_FECHAIMPRESION IS NOT NULL ' +
                   'AND XV_IDRECIBO = RV_ID ' +
                   'AND XV_FECHABAJA IS NULL ' +
                   'AND XC_IDPLANPAGO = :PlanPago ' +
                 'UNION ' +
                'SELECT DISTINCT RV_ID IDRECIBO ' +
                  'FROM RRV_RECIBOVALOR, ZVA_VALOR ' +
                 'WHERE RV_FECHAIMPRESION IS NOT NULL ' +
                   'AND VA_IDRECIBO = RV_ID ' +
                   'AND RV_FECHABAJA IS NULL ' +
                   'AND VA_ID IN ' + sListaValores;
      end;
  end;

  with GetQueryEx( sSql, [AIdPlanPago] ) do
    try
      if EOF then
        InvalidMsg ( nil, 'No se han encontrado recibos impresos' )
      else
        while not EOF do
          begin
            IdRecibo := FieldByName( 'IDRECIBO' ).AsInteger;
            ReImprimirRecibo( IdRecibo, CantCopias, Preview );

            Next;
          end;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmValImpresionRecibo.qrdbTipoPrint(sender: TObject; var Value: String);
begin
  if (fTipoRecibo = trReemplazo) and (sdqValoresYPeriodos.FieldByName( 'TIPO' ).AsInteger = 0) and (Value = 'Cheque') then
    begin
      if sdqValoresYPeriodos.FieldByName( 'FECHARECHAZO' ).IsNull then
        Value := 'Ch. Pend. Dep.'
      else
        Value := 'Cheque Rech.';
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

