unit unQrEstadoCuentaResumen;

interface               

uses
    SysUtils, Classes, Controls, Forms, Qrctrls, QuickRpt, ExtCtrls,
    Db, SDEngine, Graphics, unArt, Cuit;

type
  TfrmEstadoCuentaResumen = class(TForm)
    qrEstadoCuentaResumen: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qAux: TSDQuery;
    qrTipoReporte: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    qrlEntidades: TQRLabel;
    qrlVendedores: TQRLabel;
    QRShape12: TQRShape;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRLabel19: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    QRShape18: TQRShape;
    qrMotivoBaja: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape20: TQRShape;
    QRBand5: TQRBand;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
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
    qrTotRefinanc: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape17: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel21: TQRLabel;
    qrlRenglon1: TQRLabel;
    qrlGestorNombre: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape31: TQRShape;
    QRShape30: TQRShape;
    QRShape34: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape15: TQRShape;
    QRShape1: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape2: TQRShape;
    QRShape35: TQRShape;
    QRLabel38: TQRLabel;
    qrTitReg: TQRLabel;
    qrdbReg: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    qrlEjecutivoNombre: TQRLabel;
    qrlEstudioNombre: TQRLabel;
    qrTelefono: TQRLabel;
    QRShape14: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel41: TQRLabel;
    QRShape37: TQRShape;
    QRLabel43: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel44: TQRLabel;
    QRShape38: TQRShape;
    QRLabel42: TQRLabel;
    qrlLeyendas: TQRLabel;
    QRLabel45: TQRLabel;
    qrlAtencionComercial: TQRLabel;
    qriLogo: TQRImage;
    QRLabel46: TQRLabel;
    QRShape8: TQRShape;
    QRLabel47: TQRLabel;
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure CUITPrint(sender: TObject; var Value: String);
    procedure FormatMonto(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure QRLabel34Print(sender: TObject; var Value: String);
    procedure QRLabel36Print(sender: TObject; var Value: String);
    procedure qrEstadoCuentaResumenBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qPeriodoPrint(sender: TObject; var Value: String);
    procedure qrdbDeudaPrint(sender: TObject; var Value: String);
    procedure qrdbInteresPrint(sender: TObject; var Value: String);
    procedure qrdbDeudaConsolidadaPrint(sender: TObject; var Value: String);
    procedure qrTotRefinancPrint(sender: TObject; var Value: String);
    procedure qrMontoRefinancPrint(sender: TObject; var Value: String);
    procedure qrlClasDevengadoPrint(sender: TObject; var Value: String);
    procedure qrdbDevengadoPrint(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QRLabel28Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure qrTotReclamoAFIPPrint(sender: TObject; var Value: String);
    procedure qrImporteReclamoAFIPPrint(sender: TObject; var Value: String);
    procedure QRLabel44Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure qrlLeyendasPrint(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
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
    fbIntereses: Boolean;
    FNoIncluirChequesRech: Boolean;
    FNoIncluirPerPrescripto: Boolean;
    FFechaContable: TDateTime;
    FCodTipoRegimen: String;
    procedure CargarEncabezado;
    procedure CargarGestorEjecutivoEstudio;
    procedure CargarAtencionComercial;
  public
    lClasific : boolean;
    sCuit : string;
    DeudaNominal    : Double;
    Mora            : Double;
    TotNominal      : Double;
    TotMora         : Double;
    TotDeuda        : Double;
    TotReFinanc     : Double;
    TotReclamoAFIP  : Double;
    TotPagos        : Double;
    TotCuota        : Double;
    TotFondo        : Double;
    TotInteres_Otros: Double;
    TotAmortizacion : Double;

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
    property FechaContable         : TDateTime       read FFechaContable                write FFechaContable;
    property CodTipoRegimen        : String          read FCodTipoRegimen               write FCodTipoRegimen;
  end;

var
  frmEstadoCuentaResumen: TfrmEstadoCuentaResumen;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unSesion, strFuncs, Numeros, AnsiSql, Consts, unComunes,
  unEstadoCuenta, Periodo, General, unExportPDF;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.CUITPrint(sender: TObject; var Value: String);
begin
  Value := PonerGuiones( Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrlPeriodoPrint(sender: TObject; var Value: String);
begin
  if fbIntereses then
    Value := 'Vto: ' +  DateToStr( FVencimiento )
  else
    Value := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel34Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotNominal));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel36Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotDeuda));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrEstadoCuentaResumenBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotNominal      := 0;
  TotMora         := 0;
  TotDeuda        := 0;
  TotReFinanc     := 0;
  TotReclamoAFIP  := 0;
  TotPagos        := 0;
  TotCuota        := 0;
  TotFondo        := 0;
  TotInteres_Otros:= 0;
  TotAmortizacion := 0;
  
  PrintReport := True;

  CargarGestorEjecutivoEstudio;
  CargarAtencionComercial;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfrmEstadoCuentaResumen.Create(AOwner: TComponent);
begin
  inherited;
  FVencimiento          := 0;
  FFechaContable        := 0;
  lClasific             := True;
  FDeudaExtraJudicial   := False;
  NoIncluirConcQuiebra  := True;
  NoIncluirReclamoAFIP  := True;
  NoIncluirPerPrescripto:= True;
  InteresPerConcQuiebra := False;
  InteresSaldoAcreedor  := False;
  FCodTipoRegimen       := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstadoCuentaResumen.Execute : boolean; { Tomado de EmisionCta }
var
  sCompSaldo, sPrimerPeriodoDeuda, SqlTasaInteresFinal, sSqlInteresPositivo: string;
  sFiltrosAdic, sSqlInicial, sPerConcQuiebra, SqlVencimientoCuota, sSql: string;
begin
  sSql         := '';
  sFiltrosAdic := '';

  fbIntereses := (FVencimiento > 0);

  if FTipoResumen = 'nosaldado' then
    sCompSaldo := '<>'
  else if FTipoResumen = 'saldodeudor' then
    sCompSaldo := '>'
  else if FTipoResumen = 'saldoacreedor' then
    sCompSaldo := '<'
  else if FTipoResumen = 'total' then
    sCompSaldo := '';

  CargarEncabezado;

  sPerConcQuiebra     := Get_MaxPeriodoConcQuiebra(FCuit);
  sPrimerPeriodoDeuda := Get_PrimerPeriodoConsidDeuda(StrToInt(Contrato), 'N', not NoIncluirConcQuiebra);

  Generar_SQLIntereses(FCuit, StrToInt(Contrato), FVencimiento, FInteresPerConcQuiebra, SqlTasaInteresFinal, sSqlInteresPositivo, SqlVencimientoCuota);

  sSqlInicial := 'SELECT VENCIMIENTO, PERIODO, FIJA_VARIABLE, DDJJ, EMPLEADOS, MASA, EXTRAJUDICIAL, ' +
                        'DEVENGADOS, FONDO, CUOTA, INTERES_OTROS, PAGOS, DEVENGADOS-PAGOS-SALDOINTERESES DEUDA_TOTAL, ' +
                                Get_SqlInteresDeuda(InteresSaldoAcreedor, sSqlInteresPositivo, 'DEUDA') + '+SALDOINTERESES INTERES, '  +
                        'MONTOREFINANCIADO, ' +

                        'ROUND(TO_NUMBER(UTILES.IIF_COMPARA(''<'', PERIODO, ' + SqlValue( sPrimerPeriodoDeuda ) +
                        ', 0, DEUDA+' + Get_SqlInteresDeuda(InteresSaldoAcreedor, sSqlInteresPositivo, 'DEUDA') + ')), 2)+SALDOINTERESES DEUDA_CONSOLIDADA, ' +

                        'IMPORTERECLAMOAFIP, ESCONCURSOQUIEBRA, CONTRATO, PRESCRIPTO, ' +
                        'DECODE(ESCONCURSOQUIEBRA,''S'',''Q'')||DECODE(MONTOREFINANCIADO,0,'''',''R'')||DECODE(IMPORTERECLAMOAFIP,0,'''',''A'')||DECODE(PER_CHEQUESRECHAZADOS,''S'',''Z'')||TOPEOEMISION REF, ' +
                        'RC_CONTRATO, CODREG ' +
                   'FROM (';

  if sPerConcQuiebra = '' then
    sFiltrosAdic := sFiltrosAdic + ' ''N'' ESCONCURSOQUIEBRA '
  else
    sFiltrosAdic := sFiltrosAdic + ' UTILES.IIF_COMPARA(''<='', RC_PERIODO, ' + SqlValue( sPerConcQuiebra ) + ',''S'',''N'') ESCONCURSOQUIEBRA ';

  if FDeudaExtraJudicial then
    sFiltrosAdic := sFiltrosAdic + ', RC_AMORTIZACUOTA + RC_AMORTIZAFONDO + RC_AMORTIZAINTERES EXTRAJUDICIAL '
  else
    sFiltrosAdic := sFiltrosAdic + ', 0 EXTRAJUDICIAL ';

  if FFechaContable = 0 then
    begin
      sSql :=  sSqlInicial +
                 'SELECT ' + SqlVencimientoCuota + ' VENCIMIENTO, RC_PERIODO PERIODO, RC_CONTRATOPRINCIPAL CONTRATO, RC_CODTIPOREGIMEN CODREG, ' +
                        'AFILIACION.GET_TARIFAVIGENTETEXTO(RC_CONTRATO, RC_PERIODO) FIJA_VARIABLE, RC_PRESCRIPTO PRESCRIPTO, ' +
                        'DECODE(RC_GESTIONABLE,''N'',''SI'',''NO'') DDJJ, RC_EMPLEADOS EMPLEADOS, RC_MASASALARIAL MASA, RC_IMPORTERECLAMADO IMPORTERECLAMOAFIP, ' +
                        'RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS DEVENGADOS, ' +
                        'RC_DEVENGADOCUOTA CUOTA, RC_DEVENGADOINTERES+RC_DEVENGADOOTROS INTERES_OTROS, RC_DEVENGADOFONDO FONDO, ' +
                        'RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES PAGOS, ' +
                        '(RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS)-(RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES)-' +
                        'RC_IMPORTERECLAMADO-RC_MONTOREFINANCIADO-COBRANZA.GETSALDOINTERESES(RC_CONTRATO, RC_PERIODO) DEUDA, ' +
                        'RC_MONTOREFINANCIADO MONTOREFINANCIADO, COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(RC_CONTRATO, RC_PERIODO) PER_CHEQUESRECHAZADOS, ' +
                        'COBRANZA.GETSALDOINTERESES(RC_CONTRATO, RC_PERIODO) SALDOINTERESES, DECODE(EMI.UTILES.GET_TOPEAPLICADO(RC_CONTRATO, RC_PERIODO), 1, ''N'', 2, ''X'', 3, ''T'', NULL) TOPEOEMISION, ' +
                        'RC_CONTRATO, ' +
                        SqlTasaInteresFinal + sFiltrosAdic;

      sSql := sSql + '  FROM ZRC_RESUMENCOBRANZA_EXT ' +
                     ' WHERE 1 = 1';
    end
  else
    begin
      sSql :=  sSqlInicial +
                 'SELECT ' + SqlVencimientoCuota + ' VENCIMIENTO, RC_PERIODO PERIODO, RC_CONTRATOPRINCIPAL CONTRATO, RC_CODTIPOREGIMEN CODREG, ' +
                        '''$'' || ART.AFILIACION.GET_SUMA_FIJA(RC_CONTRATO, RC_PERIODO, ' + SqlValue(FFechaContable) + ') || '' / %'' || ART.AFILIACION.GET_PORCMASA(RC_CONTRATO, RC_PERIODO, ' + SqlValue(FFechaContable) + ') FIJA_VARIABLE, ''N'' PRESCRIPTO, ' +
                        'DECODE(RC_GESTIONABLE,''N'',''SI'',''NO'') DDJJ, SC_EMPLEADOS EMPLEADOS, SC_MASASALARIAL MASA, 0 IMPORTERECLAMOAFIP, ' +
                        'RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS DEVENGADOS, ' +
                        'RC_DEVENGADOCUOTA CUOTA, RC_DEVENGADOINTERES+RC_DEVENGADOOTROS INTERES_OTROS, RC_DEVENGADOFONDO FONDO, ' +
                        'RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES PAGOS, ' +
                        '(RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS)-(RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES) DEUDA, ' +
                        '0 MONTOREFINANCIADO, art.COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(RC_CONTRATO, RC_PERIODO) PER_CHEQUESRECHAZADOS, ' +
                        '0 SALDOINTERESES, DECODE(EMI.UTILES.GET_TOPEAPLICADO(RC_CONTRATO, RC_PERIODO), 1, ''N'', 2, ''X'', 3, ''T'', NULL) TOPEOEMISION, ' +
                        'RC_CONTRATO, ' +
                        SqlTasaInteresFinal + sFiltrosAdic;

      sSql := sSql + 'FROM (SELECT MO_CONTRATO RC_CONTRATO, MO_PERIODO RC_PERIODO, NULL RC_GESTIONABLE, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''CC'' THEN  MO_IMPORTE ELSE 0 END) RC_PAGOCUOTA, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''CF'' THEN  MO_IMPORTE ELSE 0 END) RC_PAGOFONDO, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''CI'' THEN  MO_IMPORTE ELSE 0 END) RC_PAGOINTERES, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''CO'' THEN  MO_IMPORTE ELSE 0 END) RC_PAGOOTROS, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''EC'' THEN  MO_IMPORTE ELSE 0 END) RC_DEVENGADOCUOTA, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''EF'' THEN  MO_IMPORTE ELSE 0 END) RC_DEVENGADOFONDO, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''EI'' THEN  MO_IMPORTE ELSE 0 END) RC_DEVENGADOINTERES, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''EO'' THEN  MO_IMPORTE ELSE 0 END) RC_DEVENGADOOTROS, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''RC'' THEN  MO_IMPORTE ELSE 0 END) RC_RECUPEROCUOTA, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''RF'' THEN  MO_IMPORTE ELSE 0 END) RC_RECUPEROFONDO, ' +
                                  'SUM(CASE CM_OPERACION||CM_CONCEPTO WHEN ''RI'' THEN  MO_IMPORTE ELSE 0 END) RC_RECUPEROINTERES, ' +
                                  '0 RC_AMORTIZACUOTA, ' +
                                  '0 RC_AMORTIZAFONDO, ' +
                                  '0 RC_AMORTIZAINTERES, ' +
                                  'MO_CONTRATOPRINCIPAL RC_CONTRATOPRINCIPAL, MO_CODTIPOREGIMEN RC_CODTIPOREGIMEN ' +
                             'FROM ZMO_MOVIMIENTO, ZCM_CODIGOMOVIMIENTO, ZRC_RESUMENCOBRANZA_EXT ' +
                            'WHERE CM_ID  = MO_IDCODIGOMOVIMIENTO ' +
                              'AND RC_CONTRATO = MO_CONTRATO ' +
                              'AND RC_PERIODO = MO_PERIODO ' +
                              'AND MO_FECHADIST <= ' + SqlValue(FFechaContable) + ' ' +
                            'GROUP BY MO_CONTRATOPRINCIPAL, MO_CONTRATO, MO_CODTIPOREGIMEN, MO_PERIODO), ' +
                            '(SELECT SC_CONTRATO, SC_PERIODO, SC_EMPLEADOS, SC_MASASALARIAL ' +
                               'FROM OSC_SALDOCONTABLE O1 ' +
                              'WHERE SC_PERIODODIST = (SELECT MAX(O2.SC_PERIODODIST) ' +
                                                        'FROM OSC_SALDOCONTABLE O2 ' +
                                                       'WHERE O2.SC_CONTRATO = O1.SC_CONTRATO ' +
                                                         'AND O2.SC_PERIODO = O1.SC_PERIODO ' +
                                                         'AND O2.SC_PERIODODIST <= TO_CHAR(' + SqlValue(FFechaContable) + ',''YYYYMM''))) ' +
                    'WHERE RC_CONTRATO = SC_CONTRATO ' +
                      'AND RC_PERIODO = SC_PERIODO';
    end;

  if fImprPorCuit then
    sSql := sSql + ' AND RC_CONTRATOPRINCIPAL IN ( SELECT CO_CONTRATO ' +
                                                  '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                                  ' WHERE CO_IDEMPRESA = EM_ID ' +
                                                  '   AND EM_CUIT = ' + SqlValue(FCuit) + ')'
  else
    sSql := sSql + ' AND RC_CONTRATOPRINCIPAL = ' + FContrato;

  if FPeriodoDesde <> '' then
    sSql := sSql + ' AND RC_PERIODO >= ' + SqlValue(FPeriodoDesde);
  if FPeriodoHasta <> '' then
    sSql := sSql + ' AND RC_PERIODO <= ' + SqlValue(FPeriodoHasta);

  if sCompSaldo <> '' then
    begin
      if NoIncluirReclamoAFIP then
        sSql := sSql + ' ) WHERE DEVENGADOS-PAGOS-IMPORTERECLAMOAFIP ' + sCompSaldo + ' 0'
      else
        sSql := sSql + ' ) WHERE DEVENGADOS-PAGOS ' + sCompSaldo + ' 0';
    end
  else
    sSql := sSql + ' ) WHERE 1 = 1';

  if NoIncluirReclamoAFIP then
    sSql := sSql + ' AND COBRANZA.IS_NOMOSTRARRECLAMOAFIP(DEVENGADOS, PAGOS, IMPORTERECLAMOAFIP, PERIODO)=''S''' ;

  if NoIncluirConcQuiebra then
    sSql := sSql + ' AND ESCONCURSOQUIEBRA <> ''S''';

  if NoIncluirPerPrescripto then
    sSql := sSql + ' AND PRESCRIPTO <> ''S''';

  if CodTipoRegimen <> '' then
    sSql := sSql + ' AND CODREG = ' + SqlValue(CodTipoRegimen);

  sSql := sSql + ' ORDER BY PERIODO, CODREG DESC';

  OpenQuery( qAux, sSql );

  qrlRenglon1.Caption := Get_JuicioParteActoraDescr(StrToInt(FContrato));

  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstadoCuentaResumen.Print : boolean;
begin
  QrEstadoCuentaResumen.Print;
  Result := not QrEstadoCuentaResumen.Cancelled;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmEstadoCuentaResumen.PrinterSetup: boolean;
begin
  QrEstadoCuentaResumen.Tag := 0;
  QrEstadoCuentaResumen.PrinterSetup;
  Result := QrEstadoCuentaResumen.Tag = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.CargarEncabezado;
var
  Query: TSDQuery;
  sNomEntidad, sNomVendedor, sSql, PeriodoActual: string;
begin
  PeriodoActual := DateToStr( Date );
  PeriodoActual := Copy(PeriodoActual, 7,4) + Copy(PeriodoActual, 4,2);

  sSql := 'SELECT EM_NOMBRE, CO_CONTRATO, EM_CUIT, ' +
                 'AFEST.TB_CODIGO || ''  '' || AFEST.TB_DESCRIPCION ESTADO, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
                 'CO_FECHABAJA || ''  '' || BAJ.TB_DESCRIPCION MOTIVO_BAJA, ' +
                 'AC_CODIGO || ''  '' || AC_DESCRIPCION ACTIVIDAD, ' +
                 'LEGALES.GET_FECHACONCURSO( EM_CUIT ) CONCURSO, UTILES.PERIODO_PONERBARRA(LEGALES.GET_PERIODOCONCURSO( EM_CUIT )) PERCONCURSO, ' +
                 'LEGALES.GET_FECHAQUIEBRA( EM_CUIT ) QUIEBRA, UTILES.PERIODO_PONERBARRA(LEGALES.GET_PERIODOQUIEBRA( EM_CUIT )) PERQUIEBRA, ' +
                 'ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL) ' +
                 '|| '' '' || ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA) DOM_POSTAL, ' +
                 'LTRIM(DC_CODAREATELEFONOS || '' '' || DC_TELEFONOS) TELEFONOS_POSTAL, ' +
                 'AFILIACION.GET_TARIFAVIGENTETEXTO( CO_CONTRATO, ''' + PeriodoActual + ''') FIJA_VARIABLE ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD, ' +
                 'CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
           'WHERE EM_ID = CO_IDEMPRESA ' +
             'AND CO_CONTRATO = DC_CONTRATO ' +
             'AND DC_TIPO = ''L'' ' +
             'AND CO_IDACTIVIDAD = AC_ID ' +
             'AND BAJ.TB_CLAVE(+) = ''MOTIB'' ' +
             'AND CO_MOTIVOBAJA = BAJ.TB_CODIGO(+) ' +
             'AND AFEST.TB_CLAVE = ''AFEST'' ' +
             'AND AFEST.TB_CODIGO = CO_ESTADO ' +
             'AND CO_CONTRATO = ' + FContrato;
  Query := GetQuery( sSql );
  try
    if not Query.Eof then
    begin
      qrNombre.Caption        := Query.FieldByName('EM_NOMBRE').AsString;
      qrDomicilio.Caption     := Query.FieldByName('DOM_POSTAL').AsString;
      qrTelefono.Caption      := 'Tel.: ' + Query.FieldByName('TELEFONOS_POSTAL').AsString;
      qrContrato.Caption      := FContrato;
      FCuit                   := Query.FieldByName('EM_CUIT').AsString;
      qrCuit.Caption          := FCuit;
      qrActividad.Caption     := Query.FieldByName('ACTIVIDAD').AsString;
      qrEstado.Caption        := Query.FieldByName('ESTADO').AsString;
      qrVigenciaDesde.Caption := Query.FieldByName('CO_VIGENCIADESDE').AsString;
      qrVigenciaHasta.Caption := Query.FieldByName('CO_VIGENCIAHASTA').AsString;

      qrConcurso.Caption      := Query.FieldByName('CONCURSO').AsString;
      if Query.FieldByName('PERCONCURSO').AsString <> '' then
        qrConcurso.Caption    := qrConcurso.Caption + ' (' + Query.FieldByName('PERCONCURSO').AsString + ')';

      qrQuiebra.Caption       := Query.FieldByName('QUIEBRA').AsString;
      if Query.FieldByName('PERQUIEBRA').AsString <> '' then
        qrQuiebra.Caption     := qrQuiebra.Caption + ' (' + Query.FieldByName('PERQUIEBRA').AsString + ')';

      qrSumaFija.Caption      := Query.FieldByName('FIJA_VARIABLE').AsString;
      qrMotivoBaja.Caption    := Query.FieldByName('MOTIVO_BAJA').AsString;
    end
    else
      raise Exception.Create( 'No se encontró el contrato indicado.');
  finally
    Query.Free;
  end;

  //Carga la entidad y el vendedor
  Get_NombreEntidadVendedor(StrToInt(FContrato), sNomEntidad, sNomVendedor);
  qrlEntidades.Caption  := sNomEntidad;
  qrlVendedores.Caption := sNomVendedor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qPeriodoPrint(sender: TObject; var Value: String);
begin
  Value := FormatPeriodo(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrdbDeudaPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotNominal := TotNominal + DeudaNominal;
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrdbInteresPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotMora := TotMora + DeudaNominal;
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrdbDeudaConsolidadaPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotDeuda := TotDeuda + DeudaNominal;
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrTotRefinancPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotReFinanc));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrMontoRefinancPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotReFinanc := TotReFinanc + DeudaNominal;
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrlClasDevengadoPrint(sender: TObject; var Value: String);
begin
  if not lClasific then
    Value := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrdbDevengadoPrint(sender: TObject; var Value: String);
begin
  TotCuota := TotCuota + ToFloat(Value);
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel15Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotPagos));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRDBText17Print(sender: TObject; var Value: String);
begin
  TotFondo := TotFondo + ToFloat(Value);
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel17Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotCuota));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel5Print(sender: TObject; var Value: String);
begin
  Value := '';
  if fbIntereses then
  begin
    Value := 'Al ' + DateToStr( FVencimiento )
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel21Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotMora));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.CargarGestorEjecutivoEstudio;
var
  sSql: String;
begin
  sSql := 'SELECT GESTOR.GC_NOMBRE GESTORNOMBRE, EC_NOMBRE EJECUTIVONOMBRE, ESTUDIO.GC_NOMBRE ESTUDIONOMBRE ' +
            'FROM AEC_EJECUTIVOCUENTA, AGC_GESTORCUENTA GESTOR, AGC_GESTORCUENTA ESTUDIO, ACO_CONTRATO ' +
           'WHERE CO_IDGESTOR = GESTOR.GC_ID(+) ' +
             'AND CO_IDEJECUTIVO = EC_ID(+) ' +
             'AND CO_IDESTUDIO = ESTUDIO.GC_ID(+) ' +
             'AND CO_CONTRATO = ' + SqlValue(StrToInt(FContrato));

  with GetQuery( sSql ) do
  try
    if IsEmpty then
      begin
        qrlGestorNombre.Caption    := '';
        qrlEjecutivoNombre.Caption := '';
        qrlEstudioNombre.Caption   := '';
      end
    else
      begin
        qrlGestorNombre.Caption    := FieldByName('GESTORNOMBRE').AsString;
        qrlEjecutivoNombre.Caption := FieldByName('EJECUTIVONOMBRE').AsString;
        qrlEstudioNombre.Caption   := FieldByName('ESTUDIONOMBRE').AsString;
      end;
  finally
    free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel28Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotFondo));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRDBText2Print(sender: TObject; var Value: String);
begin
  TotCuota := TotCuota + ToFloat(Value);
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRDBText16Print(sender: TObject; var Value: String);
begin
  TotPagos := TotPagos + ToFloat(Value);
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.FormCreate(Sender: TObject);
begin
  TotNominal      := 0;
  TotMora         := 0;
  TotDeuda        := 0;
  TotReFinanc     := 0;
  TotReclamoAFIP  := 0;
  TotPagos        := 0;
  TotCuota        := 0;
  TotFondo        := 0;
  TotInteres_Otros:= 0;
  TotAmortizacion := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrTotReclamoAFIPPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotReclamoAfip));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrImporteReclamoAFIPPrint(sender: TObject; var Value: String);
begin
  DeudaNominal := ToFloat(Value);
  TotReclamoAFIP := TotReclamoAFIP + DeudaNominal;
  FormatMonto( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRLabel44Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(TotInteres_Otros));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.QRDBText7Print(sender: TObject; var Value: String);
begin
  TotInteres_Otros := TotInteres_Otros + ToFloat(Value);
  FormatMonto ( Sender, Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmEstadoCuentaResumen.qrlLeyendasPrint(sender: TObject; var Value: String);
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
procedure TfrmEstadoCuentaResumen.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
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
procedure TfrmEstadoCuentaResumen.CargarAtencionComercial;
begin
  qrlAtencionComercial.Caption := Get_NombreEntidadComercial(StrToInt(FContrato));
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

