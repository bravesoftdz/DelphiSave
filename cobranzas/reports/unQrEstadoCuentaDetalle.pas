unit unQrEstadoCuentaDetalle;

interface       

uses
    SysUtils, Classes, Controls, Forms, Qrctrls, QuickRpt, ExtCtrls,
    Db, SDEngine, Graphics, unArt, Cuit;

type
  TfrmEstadoCuentaDetalle = class(TForm)
    qAux: TSDQuery;
    qrEstadoCuentaDetalle: TQuickRep;
    QRGroup1: TQRGroup;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape2: TQRShape;
    qPeriodo: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    qrlClasDevengado: TQRDBText;
    QRDBText6: TQRDBText;
    qrdbContrato: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    qrlReclamoAFIP: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    cDebe: TQRDBText;
    cHaber: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    qrdbInteres: TQRExpr;
    qrMontoRefinanc: TQRExpr;
    qrdbDeudaConsolidada: TQRExpr;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRShape14: TQRShape;
    QRShape36: TQRShape;
    QRShape31: TQRShape;
    QRShape18: TQRShape;
    qrMotivoBaja: TQRLabel;
    QRShape28: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel12: TQRLabel;
    QRShape29: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel26: TQRLabel;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    qrTipoReporte: TQRLabel;
    QRShape11: TQRShape;
    qrlEntidades: TQRLabel;
    qrlVendedores: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    qrlRenglon1: TQRLabel;
    qrlRenglon2: TQRLabel;
    QRLabel29: TQRLabel;
    qrNombre: TQRLabel;
    qrDomicilio: TQRLabel;
    qrContrato: TQRLabel;
    qrCuit: TQRLabel;
    qrActividad: TQRLabel;
    qrEstado: TQRLabel;
    qrVigenciaDesde: TQRLabel;
    qrVigenciaHasta: TQRLabel;
    qrConcurso: TQRLabel;
    qrQuiebra: TQRLabel;
    qrSumaFija: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape30: TQRShape;
    qrlGestorNombre: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRLabel19: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand5: TQRBand;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    qrTotRefinanc: TQRLabel;
    QRShape35: TQRShape;
    qrlLeyendas: TQRLabel;
    qrlAtencionComercial: TQRLabel;
    QRLabel45: TQRLabel;
    qriLogo: TQRImage;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure CUITPrint(sender: TObject; var Value: String);
    procedure FormatMonto(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure QRLabel34Print(sender: TObject; var Value: String);
    procedure QRLabel35Print(sender: TObject; var Value: String);
    procedure QRLabel36Print(sender: TObject; var Value: String);
    procedure qrEstadoCuentaDetalleBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qPeriodoPrint(sender: TObject; var Value: String);
    procedure qrTotRefinancPrint(sender: TObject; var Value: String);
    procedure qrlClasDevengadoPrint(sender: TObject; var Value: String);
    procedure qrlGestorNombrePrint(sender: TObject; var Value: String);
    procedure qrdbDeudaConsolidadaPrint(sender: TObject; var Value: String);
    procedure qrMontoRefinancPrint(sender: TObject; var Value: String);
    procedure qrdbInteresPrint(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure qrdbContratoPrint(sender: TObject; var Value: String);
    procedure qrlLeyendasPrint(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlAtencionComercialPrint(sender: TObject; var Value: String);
  private
    FTipoResumen: string;
    FPeriodoHasta: String;
    FPeriodoDesde: String;
    FVencimiento: TDateTime;
    FContrato: string;
    FCuit: string;
    FDeudaExtraJudicial: Boolean;
    FNoIncluirConcQuiebra: Boolean;
    FNoIncluirReclamoAFIP: Boolean;
    FInteresPerConcQuiebra: Boolean;
    FInteresSaldoAcreedor: Boolean;
    fImprPorCuit: Boolean;
    FAgrupaPorCodigo: Boolean;
    FFechaContable: TDateTime;
    fbIntereses: Boolean;
    FNoIncluirChequesRech: Boolean;
    FNoIncluirPerPrescripto: Boolean;
    FCodTipoRegimen: String;
    procedure CargarEncabezado;
  public
    lClasific : boolean;
    sCuit : string;
    IsResumen : boolean;
    DeudaNominal : Double;
    Mora         : Double;
    TotNominal   : Double;
    TotMora      : Double;
    TotDeuda     : Double;
    TotReFinanc  : Double;

    constructor Create(AOwner: TComponent); override;

    function Execute : boolean;
    function Print : boolean;
    function PrinterSetup : boolean;

    property Contrato              : string          read FContrato                     write FContrato;
    property ImprimePorCuit        : boolean         read fImprPorCuit                  write fImprPorCuit;
    property TipoResumen           : string          read FTipoResumen                  write FTipoResumen;
    property PeriodoDesde          : String          read FPeriodoDesde                 write FPeriodoDesde;
    property PeriodoHasta          : String          read FPeriodoHasta                 write FPeriodoHasta;
    property Vencimiento           : TDateTime       read FVencimiento                  write FVencimiento;
    property ClasficaDevengado     : Boolean         read lClasific                     write lClasific;
    property DeudaExtraJudicial    : Boolean         read FDeudaExtraJudicial           write FDeudaExtraJudicial;
    property NoIncluirConcQuiebra  : Boolean         read FNoIncluirConcQuiebra         write FNoIncluirConcQuiebra;
    property NoIncluirReclamoAFIP  : Boolean         read FNoIncluirReclamoAFIP         write FNoIncluirReclamoAFIP;
    property NoIncluirPerPrescripto: Boolean         read FNoIncluirPerPrescripto       write FNoIncluirPerPrescripto;
    property NoIncluirChequesRech  : Boolean         read FNoIncluirChequesRech         write FNoIncluirChequesRech;
    property InteresPerConcQuiebra : Boolean         read FInteresPerConcQuiebra        write FInteresPerConcQuiebra;
    property InteresSaldoAcreedor  : Boolean         read FInteresSaldoAcreedor         write FInteresSaldoAcreedor;
    property AgrupaPorCodigo       : Boolean         read FAgrupaPorCodigo              write FAgrupaPorCodigo;
    property FechaContable         : TDateTime       read FFechaContable                write FFechaContable;
    property CodTipoRegimen        : String          read FCodTipoRegimen               write FCodTipoRegimen;
  end;

var
  frmEstadoCuentaDetalle: TfrmEstadoCuentaDetalle;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unSesion, strFuncs, Numeros, AnsiSql, Consts, unComunes,
  unEstadoCuenta, General, unExportPDF;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value,'$');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.CUITPrint(sender: TObject; var Value: String);
begin
  Value := Copy( Value, 1, 2 ) + '-' + Copy( Value, 3, 8 ) + '-' + Copy( Value, 11, 1 );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrlPeriodoPrint(sender: TObject; var Value: String);
begin
  if fbIntereses then
    Value := 'Vto: ' +  DateToStr( FVencimiento )
  else
    Value := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRLabel34Print(sender: TObject; var Value: String);
begin
  Value := ToStr( TotNominal );
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRLabel35Print(sender: TObject; var Value: String);
begin
  Value := ToStr( TotMora );
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRLabel36Print(sender: TObject; var Value: String);
begin
  Value := ToStr( TotDeuda );
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrEstadoCuentaDetalleBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotNominal  := 0;
  TotMora     := 0;
  TotDeuda    := 0;
  TotReFinanc := 0;
  PrintReport := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfrmEstadoCuentaDetalle.Create(AOwner: TComponent);
begin
  inherited;
  FVencimiento          := 0;
  lClasific             := True;
  FDeudaExtraJudicial   := False;
  NoIncluirConcQuiebra  := True;
  NoIncluirReclamoAFIP  := True;
  NoIncluirPerPrescripto:= True;
  NoIncluirChequesRech  := True;
  InteresPerConcQuiebra := False;
  InteresSaldoAcreedor  := False;
  FFechaContable        := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstadoCuentaDetalle.Execute : boolean; { Tomado de EmisionCta }
var
  sSqlAdic, sSqlAdicTOT, sCompSaldo, sSql, sDescr500, SqlVencimientoCuota : string;
  sReclamoAFIP, sPrimerPeriodoDeuda, SqlTasaInteresFinal, sSqlInteresPositivo: string;
  sPerConcQuiebra: String;
  sId500: TTableId;
begin
  fbIntereses := False;
  sId500 := ART_EMPTY_ID;

  if AgrupaPorCodigo then
    begin
      sSql := 'SELECT CM_ID, CM_DESCRIPCION ' +
                'FROM ZCM_CODIGOMOVIMIENTO ' +
               'WHERE CM_CODIGO=''500''';

      with GetQuery( sSql ) do
          try
            if not IsEmpty then
              begin
                sId500    := FieldByName('CM_ID').AsInteger;
                sDescr500 := FieldByName('CM_DESCRIPCION').AsString;
              end;
          finally
            free;
          end;
    end;

  sSql := '';

  if FTipoResumen = 'nosaldado' then
    sCompSaldo := '<>'
  else if FTipoResumen = 'saldodeudor' then
    sCompSaldo := '>'
  else if FTipoResumen = 'saldoacreedor' then
    sCompSaldo := '<'
  else if FTipoResumen = 'total' then
    sCompSaldo := '';

  //Encabezado
  CargarEncabezado;

  //Cuerpo
  if FDeudaExtraJudicial then
  begin
    sSqlAdic := ', ''A'', MO_IMPORTE';
    sSqlAdicTOT := ' + RC_AMORTIZACUOTA + RC_AMORTIZAFONDO + RC_AMORTIZAINTERES';
  end
  else
  begin
    sSqlAdic    := '';
    sSqlAdicTOT := '';
  end;

  //Genero el Sql
  sPerConcQuiebra     := Get_MaxPeriodoConcQuiebra(FCuit);
  sPrimerPeriodoDeuda := Get_PrimerPeriodoConsidDeuda(StrToInt(Contrato), 'N', not NoIncluirConcQuiebra);

  Generar_SQLIntereses(FCuit, StrToInt(Contrato), FVencimiento, FInteresPerConcQuiebra, SqlTasaInteresFinal, sSqlInteresPositivo, SqlVencimientoCuota);

  sSql := '';
  if AgrupaPorCodigo then
    sSql := sSql +
          'SELECT CONTRATO, PERIODO, CODREG, PERCODREG, DECODE(CM_CODIGO, ''501'', ''500'', CM_CODIGO) CM_CODIGO, DECODE(CM_CODIGO, ''501'', ' + SqlValue(sDescr500) + ', CM_DESCRIPCION) CM_DESCRIPCION, FIJA_VARIABLE, EMPLEADOS, MASA, ' +
          '       SUM(DEVENGADOS) DEVENGADOS, SUM(PAGOS) PAGOS, SALDO_NOMINAL, INTERES, ' +
          '       COBRANZA.GET_FECHAMOVIMIENTO(CONTRATOEXT, PERIODO, DECODE(CM_CODIGO, ''501'', ' + SqlValue(sId500) + ', MO_IDCODIGOMOVIMIENTO)) MO_FECHADIST, ' +
          '       MONTOREFINANCIADO, SALDO_CONSOLIDADO, IMPORTERECLAMOAFIP, REF, ESCONCURSOQUIEBRA, DDJJ, PRESCRIPTO ' +
          '  FROM (';

  sSql := sSql +
          'SELECT CONTRATO, CODREG, PERIODO, PERIODO || '' '' || CODREG PERCODREG, CM_CODIGO, CM_DESCRIPCION, FIJA_VARIABLE, EMPLEADOS, MASA, ' +
                  Iif(not AgrupaPorCodigo, 'COBRANZA.GET_FECHAMOVIMIENTODETART(CONTRATOEXT, PERIODO, MO_IDCODIGOMOVIMIENTO, FECHARECA, FECHAALTA) MO_FECHADIST, ', '') +
          '       MO_IDCODIGOMOVIMIENTO, DEVENGADOS, PAGOS, DEVENGADOSTOT-PAGOSTOT-SALDOINTERESES SALDO_NOMINAL, ' +
                  Get_SqlInteresDeuda(InteresSaldoAcreedor, sSqlInteresPositivo, '(DEVENGADOSTOT - PAGOSTOT - IMPORTERECLAMOAFIP - MONTOREFINANCIADO - SALDOINTERESES)') + '+SALDOINTERESES INTERES, '  +
          '       MONTOREFINANCIADO, ' +

          '       ROUND(TO_NUMBER(UTILES.IIF_COMPARA(''<'', PERIODO, ' + SqlValue( sPrimerPeriodoDeuda ) +
          '       , 0, (DEVENGADOSTOT - PAGOSTOT - IMPORTERECLAMOAFIP - MONTOREFINANCIADO - SALDOINTERESES)+' + Get_SqlInteresDeuda(InteresSaldoAcreedor, sSqlInteresPositivo, '(DEVENGADOSTOT - PAGOSTOT - IMPORTERECLAMOAFIP - MONTOREFINANCIADO - SALDOINTERESES)') + ')), 2)+SALDOINTERESES SALDO_CONSOLIDADO, ' +

          '       IMPORTERECLAMOAFIP, ' +
          '       DECODE(ESCONCURSOQUIEBRA,''S'',''Q'')||DECODE(MONTOREFINANCIADO,0,'''',''R'')||DECODE(IMPORTERECLAMOAFIP,0,'''',''A'')||DECODE(COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(CONTRATO, PERIODO),''S'',''Z'')||TOPEOEMISION REF, ' +
          '       ESCONCURSOQUIEBRA, DDJJ, PRESCRIPTO, CONTRATOEXT ' +
          '  FROM (' +
          'SELECT ZMO.MO_CONTRATOPRINCIPAL CONTRATO, ZMO.MO_CODTIPOREGIMEN CODREG, ZMO.MO_PERIODO PERIODO, CM_CODIGO, CM_DESCRIPCION, MO_IDCODIGOMOVIMIENTO, ' +
          '       DECODE (CM_OPERACION, ''E'',MO_IMPORTE) DEVENGADOS, ' +
          '       DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE' + sSqlAdic + ') PAGOS,' +
          '       ZMO.MO_FECHAALTA, AFILIACION.GET_TARIFAVIGENTETEXTO(RC_CONTRATO, RC_PERIODO) FIJA_VARIABLE, RC_EMPLEADOS EMPLEADOS, ' +
          '       DECODE(RC_GESTIONABLE,''N'',''SI'',''NO'') DDJJ, ZMO.MO_FECHARECA FECHARECA, ZMO.MO_FECHAALTA FECHAALTA, ' +
          '       RC_MASASALARIAL MASA, TB_DESCRIPCION CLASIFICACION, ZMO.MO_CONTRATO CONTRATOEXT, ' + SqlTasaInteresFinal +
          '       (SELECT NVL (SUM (DECODE (ZCM_INNER.CM_OPERACION, ''E'', ZMO_INNER.MO_IMPORTE)), 0) ' +
                    'FROM ZMO_MOVIMIENTO ZMO_INNER, ZCM_CODIGOMOVIMIENTO ZCM_INNER ' +
                   'WHERE ZMO.MO_CONTRATO = ZMO_INNER.MO_CONTRATO ' +
                     'AND ZMO.MO_PERIODO = ZMO_INNER.MO_PERIODO ' +
                     'AND ZCM_INNER.CM_ID = ZMO_INNER.MO_IDCODIGOMOVIMIENTO ' +
                     iif(FFechaContable > 0, ' AND ZMO_INNER.MO_FECHADIST <= ' + SqlValue(FFechaContable), '') + ') DEVENGADOSTOT, ' +
          '       (SELECT NVL (SUM (DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE' + sSqlAdic + ')), 0) ' +
                    'FROM ZMO_MOVIMIENTO ZMO_INNER, ZCM_CODIGOMOVIMIENTO ZCM_INNER ' +
                   'WHERE ZMO.MO_CONTRATO = ZMO_INNER.MO_CONTRATO ' +
                     'AND ZMO.MO_PERIODO = ZMO_INNER.MO_PERIODO ' +
                     'AND ZCM_INNER.CM_ID = ZMO_INNER.MO_IDCODIGOMOVIMIENTO ' +
                     iif(FFechaContable > 0, ' AND ZMO_INNER.MO_FECHADIST <= ' + SqlValue(FFechaContable), '') + ') PAGOSTOT, ' +
          '       RC_MONTOREFINANCIADO MONTOREFINANCIADO, RC_IMPORTERECLAMADO IMPORTERECLAMOAFIP, RC_PRESCRIPTO PRESCRIPTO, COBRANZA.GETSALDOINTERESES(RC_CONTRATO, RC_PERIODO) SALDOINTERESES, ' +
          '       DECODE(EMI.UTILES.GET_TOPEAPLICADO(RC_CONTRATO, RC_PERIODO), 1, ''N'', 2, ''X'', 3, ''T'', NULL) TOPEOEMISION, ';

  if sPerConcQuiebra = '' then
    sSql := sSql + ' ''N'' ESCONCURSOQUIEBRA '
  else
    sSql := sSql + ' UTILES.IIF_COMPARA(''<='', RC_PERIODO, ' + SqlValue( sPerConcQuiebra ) + ',''S'',''N'') ESCONCURSOQUIEBRA ';

  sSql := sSql +
          '  FROM ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA_EXT, ZCM_CODIGOMOVIMIENTO, CTB_TABLAS' +
          ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID' +
          '   AND MO_CONTRATO = RC_CONTRATO' +
          '   AND RC_PERIODO = ZMO.MO_PERIODO' +
          '   AND RC_CLASE = TB_CODIGO(+)' +
          '   AND TB_CLAVE (+)= ''CODEV''';

  if fImprPorCuit then
    sSql := sSql + ' AND RC_CONTRATOPRINCIPAL IN ( SELECT CO_CONTRATO ' +
                                                  '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                                  ' WHERE CO_IDEMPRESA = EM_ID ' +
                                                  '   AND EM_CUIT = ' + SqlValue(FCuit) + ')'
  else
    sSql := sSql + ' AND RC_CONTRATOPRINCIPAL = ' + FContrato;

  if FDeudaExtraJudicial then
    sSql := sSql + ' AND CM_OPERACION IN(''A'', ''C'', ''R'', ''E'') '
  else
    sSql := sSql + ' AND CM_OPERACION IN(''C'', ''R'', ''E'') ';

  if FPeriodoDesde <> '' then
    sSql := sSql + ' AND MO_PERIODO >= ' + SqlValue(FPeriodoDesde);
  if FPeriodoHasta <> '' then
    sSql := sSql + ' AND MO_PERIODO <= ' + SqlValue(FPeriodoHasta);

  if FFechaContable > 0 then
    sSql := sSql + ' AND MO_FECHADIST <= ' + SqlValue( FFechaContable );

  if sCompSaldo <> '' then
    begin
      sReclamoAFIP := iif(NoIncluirReclamoAFIP, 'S', 'N');

      if FDeudaExtraJudicial then
        sSql := sSql + ' AND ( COBRANZA.GET_SALDOPERIODO( RC_CONTRATO, ZMO.MO_PERIODO, ''N'', ' + Iif(FFechaContable>0, SqlValue(FFechaContable), 'NULL') + ', ' + SqlValue(sReclamoAFIP) + ') ' + sCompSaldo + ' 0 )'
      else
        sSql := sSql + ' AND ( COBRANZA.GET_SALDOPERIODO( RC_CONTRATO, ZMO.MO_PERIODO, NULL, ' + Iif(FFechaContable>0, SqlValue(FFechaContable), 'NULL') + ', ' + SqlValue(sReclamoAFIP) + ') ' + sCompSaldo + ' 0 )';
    end;

  sSql := sSql + ') WHERE 1=1';

  if NoIncluirReclamoAFIP then
    sSql := sSql + ' AND COBRANZA.IS_NOMOSTRARRECLAMOAFIP(DEVENGADOSTOT, PAGOSTOT, IMPORTERECLAMOAFIP, PERIODO)=''S''' ;

  if NoIncluirConcQuiebra then
    sSql := sSql + ' AND ESCONCURSOQUIEBRA <> ''S''';

  if NoIncluirPerPrescripto then
    sSql := sSql + ' AND PRESCRIPTO <> ''S''';

  if CodTipoRegimen <> '' then
    sSql := sSql + ' AND CODREG = ' + SqlValue(CodTipoRegimen);

  if AgrupaPorCodigo then
    sSql := sSql + ') GROUP BY CONTRATO, PERIODO, CODREG, PERCODREG, DECODE(CM_CODIGO, ''501'', ''500'', CM_CODIGO), DECODE(CM_CODIGO, ''501'', ' + SqlValue(sDescr500) + ', CM_DESCRIPCION), FIJA_VARIABLE, EMPLEADOS, MASA, ' +
                             ' MONTOREFINANCIADO, IMPORTERECLAMOAFIP, REF, DECODE(CM_CODIGO, ''501'', ' + SqlValue(sId500) + ', MO_IDCODIGOMOVIMIENTO), SALDO_NOMINAL, ' +
                             ' INTERES, SALDO_CONSOLIDADO, ESCONCURSOQUIEBRA, DDJJ, PRESCRIPTO, CONTRATOEXT';

  sSql := sSql + ' ORDER BY CONTRATO, PERIODO, CODREG DESC, PERCODREG, UTILES.IIF_COMPARA(''>='', CM_CODIGO, ''500'', ''0'', ''1''), MO_FECHADIST';

  OpenQuery( qAux, sSql );

  with GetQuery( 'SELECT VARIOS.GET_MSGCARTADOCUMENTO ('''+ sCuit + ''' , ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_INTIMACION) + '), ' +
                        'VARIOS.GET_MSGCARTADOCUMENTO ('''+ sCuit + ''' , ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_RESCISION) + ') FROM DUAL' ) do
    try
      qrlRenglon1.Caption := Fields[0].AsString;
      qrlRenglon2.Caption := Fields[1].AsString;
    finally
      Free;
    end;
  qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstadoCuentaDetalle.Print : boolean;
begin
  qrEstadoCuentaDetalle.Print;
  Result := not qrEstadoCuentaDetalle.Cancelled;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstadoCuentaDetalle.PrinterSetup: boolean;
begin
  qrEstadoCuentaDetalle.Tag := 0;
  qrEstadoCuentaDetalle.PrinterSetup;
  Result := qrEstadoCuentaDetalle.Tag = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.CargarEncabezado;
var
  Query: TSDQuery;
  sNomEntidad, sNomVendedor, sSql, PeriodoActual: string;
begin
  PeriodoActual := DateToStr( Date );
  PeriodoActual := Copy(PeriodoActual, 7,4) + Copy(PeriodoActual, 4,2);
  
  sSql := 'SELECT EM_NOMBRE, CO_CONTRATO, EM_CUIT, ' +
        '       AFEST.TB_CODIGO || ''  '' || AFEST.TB_DESCRIPCION ESTADO, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
        '       CO_FECHABAJA || ''  '' || BAJ.TB_DESCRIPCION MOTIVO_BAJA, ' +
        '       AC_CODIGO || ''  '' || AC_DESCRIPCION ACTIVIDAD, ' +
        '       NVL(TO_CHAR(LEGALES.GET_FECHACONCURSO( EM_CUIT )),''-'') CONCURSO, ' +
        '       NVL(TO_CHAR(LEGALES.GET_FECHAQUIEBRA( EM_CUIT )),''-'') QUIEBRA, ' +
        '       ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL) ' +
        '       || '' '' || ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA) DOM_POSTAL, ' +
        '       AFILIACION.GET_TARIFAVIGENTETEXTO( CO_CONTRATO, ''' + PeriodoActual + ''') FIJA_VARIABLE ' +
        '  FROM AEM_EMPRESA, ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD,' +
        '       CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
        ' WHERE EM_ID	        = CO_IDEMPRESA' +
        '   AND CO_CONTRATO     = DC_CONTRATO' +
        '   AND DC_TIPO 	= ''L''' +
        '   AND CO_IDACTIVIDAD  = AC_ID' +
        '   AND BAJ.TB_CLAVE(+) = ''MOTIB''' +
        '   AND CO_MOTIVOBAJA   = BAJ.TB_CODIGO(+)' +
        '   AND AFEST.TB_CLAVE  = ''AFEST''' +
        '   AND AFEST.TB_CODIGO = CO_ESTADO' +
        '   AND CO_CONTRATO     = ' + FContrato;
  Query := GetQuery( sSql );
  try
    if not Query.Eof then
    begin
      qrNombre.Caption        := Query.FieldByName('EM_NOMBRE').AsString;
      qrDomicilio.Caption     := Query.FieldByName('DOM_POSTAL').AsString;
      qrContrato.Caption      := FContrato;
      FCuit                   := Query.FieldByName('EM_CUIT').AsString;
      qrCuit.Caption          := FCuit;
      qrActividad.Caption     := Query.FieldByName('ACTIVIDAD').AsString;
      qrEstado.Caption        := Query.FieldByName('ESTADO').AsString;
      qrVigenciaDesde.Caption := Query.FieldByName('CO_VIGENCIADESDE').AsString;
      qrVigenciaHasta.Caption := Query.FieldByName('CO_VIGENCIAHASTA').AsString;
      qrConcurso.Caption      := Query.FieldByName('CONCURSO').AsString;
      qrQuiebra.Caption       := Query.FieldByName('QUIEBRA').AsString;
      qrSumaFija.Caption      := Query.FieldByName('FIJA_VARIABLE').AsString;
      qrMotivoBaja.Caption    := Query.FieldByName('MOTIVO_BAJA').AsString;
    end
    else
      raise Exception.Create( 'No se encontró el contrato indicado');
  finally
    Query.Free;
  end;

  //Carga la entidad y el vendedor
  Get_NombreEntidadVendedor(StrToInt(FContrato), sNomEntidad, sNomVendedor);
  qrlEntidades.Caption  := sNomEntidad;
  qrlVendedores.Caption := sNomVendedor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qPeriodoPrint(sender: TObject; var Value: String);
begin
  Value := Copy(Value, 5,2) + '/' + Copy(Value, 1,4)
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrTotRefinancPrint(sender: TObject; var Value: String);
begin
  Value := ToStr( TotReFinanc );
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrlClasDevengadoPrint(sender: TObject; var Value: String);
begin
  if not lClasific then
    Value := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrlGestorNombrePrint(sender: TObject; var Value: String);
var
  sSql: String;
begin
  sSql := 'SELECT GC_NOMBRE ' +
          '  FROM ACO_CONTRATO, AGC_GESTORCUENTA ' +
          ' WHERE CO_IDGESTOR = GC_ID ' +
          '   AND CO_CONTRATO = ' + FContrato;
  Value := ValorSql( sSql );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrdbDeudaConsolidadaPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotDeuda     := TotDeuda + DeudaNominal;
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrMontoRefinancPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotReFinanc  := TotReFinanc + DeudaNominal;
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrdbInteresPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotMora      := TotMora + DeudaNominal;
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRExpr3Print(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotNominal   := TotNominal + DeudaNominal;
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRDBText6Print(sender: TObject; var Value: String);
begin
  if (Value <> '') and (Value <> '0') then
  begin
    FormatMonto ( Sender, Value );
    qrlReclamoAFIP.Enabled := True;
  end
  else
  begin
    qrlReclamoAFIP.Enabled := False;
    Value := '';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrdbContratoPrint(sender: TObject; var Value: String);
begin
  Value := 'Contrato: ' + Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrlLeyendasPrint(sender: TObject; var Value: String);
var
  t1, t2: String;
begin
  Value := Get_PendienteAcreditarDescr( StrToInt(FContrato) );

  if Value <> '' then
    Value := Value + CRLF;

  t1 := Get_ValoresRechazadosDescr( StrToInt(FContrato) );

  if t1 <> '' then
    Value := Value + t1 + CRLF;

  t2 := Get_ValoresPendienteEntregaDescr( StrToInt(FContrato) );
  Value := Value + t2;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if IsExportingPDF then
    begin
      qriLogo.Autosize := True;
      qriLogo.Stretch  := False;
    end
  else
    begin
      qriLogo.Autosize := False;
      qriLogo.Stretch  := True;
    end
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaDetalle.qrlAtencionComercialPrint(sender: TObject; var Value: String);
begin
  Value := Get_NombreEntidadComercial(StrToInt(FContrato));
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
