unit unAdminEstadoDeCuenta;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   15-09-2003
}
        
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDbFrame, unFraEmpresa,
  unFraStaticCTB_TABLAS, unFraStaticCodigoDescripcion, unfraStaticActividad, Mask, ToolEdit, DateComboBox, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, PeriodoPicker, QueryPrint, SortDlg, Menus, unArtDBAwareFrame,
  unfraInfoEmpresa, Buttons, QueryToFile, ExportDialog, DBCtrls, RxToolEdit,
  RxPlacemnt, unFraCodigoDescripcion, unFraTipoRegimen;

type
  TfrmAdminEstadoDeCuenta = class(TfrmCustomPanelABM)
    Grid: TArtDBGrid;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ColorDialog: TColorDialog;
    tbSeparador: TToolButton;
    tbUsuario: TToolButton;
    SortDialog: TSortDialog;
    tbOrdenar: TToolButton;
    tbPeriodoAnterior: TToolButton;
    tbPeriodoProximo: TToolButton;
    ToolButton1: TToolButton;
    tbIrPlanPago: TToolButton;
    tbNomina: TToolButton;
    btnCalcular: TButton;
    btnVolver: TButton;
    btnContactos: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbRazonSocial: TGroupBox;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    edMOTIVO_BAJA: TEdit;
    fraAC_CODIGO: TfraStaticActividad;
    edDC_TELEFONOS: TEdit;
    edDC_DOMICILIO: TEdit;
    cmbCO_FECHABAJA: TDateComboBox;
    fraCO_CONTRATO: TfraEmpresa;
    edESTADO: TEdit;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label14: TLabel;
    cmbCO_VIGENCIAHASTA: TDateComboBox;
    cmbCO_VIGENCIADESDE: TDateComboBox;
    GroupBox2: TGroupBox;
    gbFechaContable: TGroupBox;
    cmbFECHACONTABLE_AL: TDateComboBox;
    Panel4: TPanel;
    gbTipoListado: TGroupBox;
    rbResumen: TRadioButton;
    rbDetalle: TRadioButton;
    gbPeriodos: TGroupBox;
    Label19: TLabel;
    Label18: TLabel;
    edRC_PERIODODesde: TPeriodoPicker;
    edRC_PERIODOHasta: TPeriodoPicker;
    GroupBox4: TGroupBox;
    chkIncluir: TCheckBox;
    chkSumatoria: TCheckBox;
    chkSaldoAcreedor: TCheckBox;
    chkSaldoDeudor: TCheckBox;
    GroupBox3: TGroupBox;
    chkInteresPerConcQuiebra: TCheckBox;
    cmbINTERES_AL: TDateComboBox;
    gbReclAFIPConcQuiebra: TGroupBox;
    pnlColor0: TPanel;
    pnlColor1: TPanel;
    chkNoMostrarReclamoAFIP: TCheckBox;
    chkNoMostrarConcQuiebra: TCheckBox;
    pnlColor2: TPanel;
    chkNoMostrarChequesRech: TCheckBox;
    chkInteresesSaldoAcreedor: TCheckBox;
    pmnuImprimir: TPopupMenu;
    mnuImprEstadoCuenta: TMenuItem;
    mnuImprF817: TMenuItem;
    mnuImprF801C: TMenuItem;
    ExportDialog: TExportDialog;
    tbExportarGrilla: TToolButton;
    pnlColor3: TPanel;
    chkTodosContratos: TCheckBox;
    Label6: TStaticText;
    Label7: TStaticText;
    tb441Web: TToolButton;
    fpPeriodosDisponibles: TFormPanel;
    Label9: TLabel;
    dblcbPeriodo: TDBLookupComboBox;
    btnGenerar: TButton;
    sdqPeriodo: TSDQuery;
    dsPeriodo: TDataSource;
    fraInfoEmpresa: TfraInfoEmpresa;
    pnlBaja: TPanel;
    lblBaja: TLabel;
    pnlColor4: TPanel;
    chkNoMostrarPrescripto: TCheckBox;
    mnuImprF801CTotal: TMenuItem;
    mnuImprF801CPorPeriodo: TMenuItem;
    tbAprobarEmisionCertificado: TToolButton;
    fpAprobarEmisionCertificado: TFormPanel;
    Bevel1: TBevel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btnAceptar2: TButton;
    Button2: TButton;
    edFechaCertificadoCobertura: TDateComboBox;
    rgPermite: TRadioGroup;
    memoObservaciones: TMemo;
    sdspGetDeudaCertificado: TSDStoredProc;
    tbSeparador2: TToolButton;
    pnMensaje: TPanel;
    lbMensaje: TLabel;
    mnuImprLibreDeuda: TMenuItem;
    tbLimpiarReclamoAFIP: TToolButton;
    Label13: TLabel;
    edBaseAmplDesde: TPeriodoPicker;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    fraTipoReg: TfraTipoRegimen;
    Label17: TLabel;
    edTipoRegimen: TEdit;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btnVolverClick(Sender: TObject);
    procedure chkSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure pnlColor(Sender: TObject);
    procedure tbUsuarioClick(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure rbResumenClick(Sender: TObject);
    procedure rbDetalleClick(Sender: TObject);
    procedure tbPeriodoAnteriorClick(Sender: TObject);
    procedure tbIrPlanPagoClick(Sender: TObject);
    procedure tbNominaClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure btnContactosClick(Sender: TObject);
    procedure mnuImprEstadoCuentaClick(Sender: TObject);
    procedure mnuImprF817Click(Sender: TObject);
    procedure mnuImprF801CClick(Sender: TObject);
    procedure tbExportarGrillaClick(Sender: TObject);
    procedure tb441WebClick(Sender: TObject);
    procedure fpPeriodosDisponiblesKeyPress(Sender: TObject; var Key: Char);
    procedure btnGenerarClick(Sender: TObject);
    procedure tbAprobarEmisionCertificadoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fpAprobarEmisionCertificadoBeforeShow(Sender: TObject);
    procedure mnuImprLibreDeudaClick(Sender: TObject);
    procedure tbLimpiarReclamoAFIPClick(Sender: TObject);
  private
    fTipoListado: String;
    fSqlAnterior: String;
    fPeriodoDesdeAnterior: String;
    fPeriodoHastaAnterior: String;
    fIncluirGestion: Boolean;
    fSaldoAcreedor: Boolean;
    fSaldoDeudor: Boolean;
    NombreCampos: Array of String;
    TotalResumen, TotalDetalle: Array of Extended;

    function DoValidar(TipoListado: String): Boolean;
    function Get_CompSaldo: String;
    function Get_PeriodoBusqueda(Contrato: Integer; Cuit, Periodo, TipoBusqueda: String): String;
    function Get_SqlDetalle(Contrato: Integer; Cuit, CompSaldo: String): String;
    function GetDeuda(const aContrato: Integer; const aFecha: TDateTime): Extended;

    procedure DoCargar(Contrato: Integer; Cuit, TipoListado: String);
    procedure ImprimeConsulta(Grilla: TArtDBGrid);
    procedure FormatCampos(IsResumen: Boolean);
    procedure CalcTotales;
    procedure ImprimirReporte;
    procedure EnableButtons(AEnabled: Boolean);
  public
    procedure CargarCabecera(Contrato: String);
  end;

var
  frmAdminEstadoDeCuenta: TfrmAdminEstadoDeCuenta;

implementation
{$R *.DFM}

uses
  unPrincipal, unImpresionEstadoDeCuenta, unDmPrincipal, VCLExtra, AnsiSql, dbFuncs, CustomDlgs, General, unCobranzas,
  unEjecutivoCuenta, unGestorCuenta, unComunes, StrFuncs, Numeros, unArt, unCargaPreAcuerdos, unNominaPeriodos,
  DateTimeFuncs, unEstadoCuenta, unContratoContacto, unQRF817, unQRF801C, unConsultaEstadoDeCuenta, ShellAPI, unSesion;

const
  MAXCOLS_RESUMEN = 6;
  MAXCOLS_DETALLE = 1;

  CAMPOS_RESUMEN : array [0..MAXCOLS_RESUMEN] of string = ('DEVENGADOS', 'PAGOS', 'DEUDA_TOTAL', 'MONTOREFINANCIADO', 'INTERES' , 'DEUDA_CONSOLIDADA', 'IMPORTERECLAMOAFIP');
  CAMPOS_DETALLE : array [0..MAXCOLS_DETALLE] of string = ('DEVENGADOS','PAGOS');


procedure TfrmAdminEstadoDeCuenta.CargarCabecera(Contrato: String);
var
  sMens, sSql: String;
  Query: TSDquery;
begin
  sSql := 'SELECT CO_CONTRATO, ART.AFI.GET_TELEFONOS(''ATO_TELEFONOCONTRATO'', CO_CONTRATO, ''L'') TELEFONOS, AC_CODIGO, ' +
          '       AFEST.TB_DESCRIPCION ESTADO, CO_IDACTIVIDAD, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
          '       CO_FECHABAJA, '' ('' || BAJ.TB_CODIGO || '')  '' || BAJ.TB_DESCRIPCION MOTIVO_BAJA, ' +
          '       ART.UTILES.ARMAR_DOMICILIO(DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, NULL) ' +
          '       || ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA) DOM_POSTAL, ' +
          '       ART.COBRANZA.GET_BASEAMPLIADADESDE(CO_CONTRATO) BASEAMPLDESDE, ' +
          '       ART.AFILIACION.GET_DESCRREGIMENCONTRATOAFI(CO_CONTRATO) DESCRREGIMEN ' +
          '  FROM ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD, CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
          ' WHERE CO_CONTRATO      = DC_CONTRATO' +
          '   AND DC_TIPO          = ''L'' ' +
          '   AND CO_IDACTIVIDAD   = AC_ID' +
          '   AND BAJ.TB_CLAVE(+)  = ''MOTIB''' +
          '   AND CO_MOTIVOBAJA    = BAJ.TB_CODIGO(+)' +
          '   AND AFEST.TB_CLAVE   = ''AFEST''' +
          '   AND AFEST.TB_CODIGO  = CO_ESTADO' +
          '   AND CO_CONTRATO      = ' + Contrato;
  Query := GetQuery( sSql );

  try
    if not Query.Eof then
    begin
      With Query do
      begin
        fraCO_CONTRATO.Contrato       := FieldByName('CO_CONTRATO').AsInteger;
        edDC_DOMICILIO.Text           := FieldByName('DOM_POSTAL').AsString;
        edDC_TELEFONOS.Text           := FieldByName('TELEFONOS').AsString;
        cmbCO_VIGENCIADESDE.Date      := FieldByName('CO_VIGENCIADESDE').AsDateTime;
        cmbCO_VIGENCIAHASTA.Date      := FieldByName('CO_VIGENCIAHASTA').AsDateTime;
        cmbCO_FECHABAJA.Date          := FieldByName('CO_FECHABAJA').AsDateTime;
        edMOTIVO_BAJA.Text            := FieldByName('MOTIVO_BAJA').AsString;
        fraAC_CODIGO.Value            := FieldByName('CO_IDACTIVIDAD').AsInteger;
        edESTADO.Text                 := FieldByName('ESTADO').AsString;
        edBaseAmplDesde.Periodo.Valor := FieldByName('BASEAMPLDESDE').AsString;
        edTipoRegimen.Text            := FieldByName('DESCRREGIMEN').AsString;

        fraInfoEmpresa.CargarContrato(fraCO_CONTRATO.Contrato, fraCO_CONTRATO.mskCuit.Text);

        rbResumenClick( nil );
        //Actualiza la grilla
        btnCalcularClick ( nil );
      end;
    end
    else
      MessageDlg('Los datos son incorrectos', mtWarning, [mbOK], 0);
  finally
    Query.Free;
  end;

  sSql := 'SELECT 1 ' +
            'FROM ZRM_REGISTROMOROSO ' +
           'WHERE RM_CONTRATO = :Contrato ' +
             'AND RM_FECHACANCELADO IS NOT NULL';
  lblBaja.Visible := ExisteSqlEx(sSql, [StrToInt(Contrato)]);


  if ValorSqlEx('SELECT AFILIACION.Is_TarifaPendiente(:Contrato) FROM DUAL', [StrToInt(Contrato)]) = 'S' then
    MessageDlg('Este contrato tiene tarifa pendiente de aplicación', mtInformation, [mbOK], 0);

  sMens := Get_JuicioParteActoraDescr(StrToInt(Contrato));
  if not IsEmptyString(sMens) then
    begin
      sMens := sMens + '.' + CRLF + 'Si desea más información sobre el juicio debe contactarse con el área de legales, a los internos 5126 o 5127.';
      MsgBox(sMens, MB_ICONINFORMATION);
    end;
end;

function TfrmAdminEstadoDeCuenta.Get_PeriodoBusqueda(Contrato: Integer; Cuit, Periodo, TipoBusqueda: String): String;
var
  sCompSaldo, sSql, sFuncion, sOperador: String;
begin
  sCompSaldo := Get_CompSaldo;

  if TipoBusqueda = 'A' then
  begin
    sFuncion  := 'MAX';
    sOperador := '<';
  end
  else
  begin
    sFuncion  := 'MIN';
    sOperador := '>';
  end;

  sSql := 'SELECT  ' + sFuncion + '(RC_PERIODO) ' +
           'FROM ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA_EXT, ZCM_CODIGOMOVIMIENTO ' +
          'WHERE MO_IDCODIGOMOVIMIENTO = CM_ID ' +
            'AND MO_CONTRATO = RC_CONTRATO ' +
            'AND RC_PERIODO =  MO_PERIODO ' +
            'AND RC_PERIODO ' + sOperador + ' ' + SqlValue(Periodo) + ' ';

  sSql := sSql + Get_SqlDetalle(Contrato, Cuit, sCompSaldo);

  Result := ValorSql(sSql);
end;

function TfrmAdminEstadoDeCuenta.Get_SqlDetalle(Contrato: Integer; Cuit, CompSaldo: String): String;
var
  sReclamoAFIP, sSql: String;
begin
  sSql := '';

  if chkTodosContratos.Checked then
    sSql := sSql + ' AND RC_CONTRATOPRINCIPAL IN ( SELECT CO_CONTRATO ' +
                                                  '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                                  ' WHERE CO_IDEMPRESA = EM_ID ' +
                                                  '   AND EM_CUIT = ' + SqlValue(Cuit) + ')'
  else
    sSql := sSql + ' AND RC_CONTRATOPRINCIPAL = ' + SqlValue(Contrato);

  if chkIncluir.Checked then
    sSql := sSql + ' AND CM_OPERACION IN (''A'', ''C'', ''R'', ''E'') '
  else
    sSql := sSql + ' AND CM_OPERACION IN (''C'', ''R'', ''E'') ';

  if CompSaldo <> '' then
  begin
    sReclamoAFIP := iif(chkNoMostrarReclamoAFIP.checked, 'S', 'N');

    if chkIncluir.Checked  then
      sSql := sSql + ' AND ( COBRANZA.GET_SALDOPERIODO( RC_CONTRATO, ZMO.MO_PERIODO, ''N'', ' + Iif(not cmbFECHACONTABLE_AL.IsEmpty, SqlValue(cmbFECHACONTABLE_AL.Date), 'NULL') + ', ' + SqlValue(sReclamoAFIP) + ') ' + CompSaldo + ' 0 )'
    else
      sSql := sSql + ' AND ( COBRANZA.GET_SALDOPERIODO( RC_CONTRATO, ZMO.MO_PERIODO, NULL, ' + Iif(not cmbFECHACONTABLE_AL.IsEmpty, SqlValue(cmbFECHACONTABLE_AL.Date), 'NULL') + ', ' + SqlValue(sReclamoAFIP) + ') ' + CompSaldo + ' 0 )';
  end;

  if not cmbFECHACONTABLE_AL.IsEmpty then
    sSql := sSql + ' AND MO_FECHADIST <= ' + SqlValue( cmbFECHACONTABLE_AL.Date );

  Result := sSql;
end;

function TfrmAdminEstadoDeCuenta.Get_CompSaldo: String;
var
  sCompSaldo: String;
begin
  if chkSaldoAcreedor.Checked and chkSaldoDeudor.Checked then
    sCompSaldo := '<>'
  else if chkSaldoDeudor.Checked then
    sCompSaldo := '>'
  else if chkSaldoAcreedor.Checked then
    sCompSaldo := '<'
  else
    sCompSaldo := '';

  Result := sCompSaldo;
end;

procedure TfrmAdminEstadoDeCuenta.DoCargar (Contrato: Integer; Cuit, TipoListado: String);
var
  sCompSaldo, sSql, sSqlAdic, SqlTasaInteresFinal, sPrimerPeriodoDeuda: String;
  sPerConcQuiebra, sSqlInteresPositivo, SqlVencimientoCuota: String;
begin
  fTipoListado    := TipoListado;
  sCompSaldo      := Get_CompSaldo;
  sPerConcQuiebra := Get_MaxPeriodoConcQuiebra(Cuit);

  if TipoListado = 'resumen' then
  begin
    sPrimerPeriodoDeuda := Get_PrimerPeriodoConsidDeuda(Contrato, 'N', not chkNoMostrarConcQuiebra.Checked);

    Generar_SQLIntereses(Cuit, Contrato, cmbINTERES_AL.Date, chkInteresPerConcQuiebra.Checked, SqlTasaInteresFinal, sSqlInteresPositivo, SqlVencimientoCuota);

    sSql := 'SELECT CONTRATO, PERIODO, CODREG, FIJA_VARIABLE, DECODE(RC_GESTIONABLE,''N'',''SI'',''NO'') DDJJCalculada, EMPLEADOS, MASA, ' +
            '       DEVENGADOS, PAGOS, EXTRAJUDICIAL, DEVENGADOS-PAGOS-SALDOINTERESES DEUDA_TOTAL, ' +
            '       MONTOREFINANCIADO, DDJJ, /* tener en cuenta el orden de los campos */ ' +
            '       IMPORTERECLAMOAFIP, ' +
                    Get_SqlInteresDeuda(chkInteresesSaldoAcreedor.Checked, sSqlInteresPositivo, 'DEUDA') + '+SALDOINTERESES INTERES, '  +

            '       ROUND(TO_NUMBER(UTILES.IIF_COMPARA(''<'', PERIODO, ' + SqlValue( sPrimerPeriodoDeuda ) +
            '       , 0, DEUDA+' + Get_SqlInteresDeuda(chkInteresesSaldoAcreedor.Checked, sSqlInteresPositivo, 'DEUDA') + ')), 2)+SALDOINTERESES DEUDA_CONSOLIDADA, ' +

            '       ESCONCURSOQUIEBRA, DEUDA.IS_CHEQUERECHAZADO(CONTRATO, PERIODO) TIENE_CHEQUE_RECHAZADO_MIGR, ' +
            '       COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(CONTRATO, PERIODO) TIENE_CHEQUE_RECHAZADO, PRESCRIPTO, RC_CONTRATO, RC_CONTRATO CONTRATOEXT ' +
            '  FROM (' +
            'SELECT RC_CONTRATO, RC_PERIODO PERIODO, RC_CONTRATOPRINCIPAL CONTRATO, AFILIACION.GET_TARIFAVIGENTETEXTO(RC_CONTRATO, RC_PERIODO) FIJA_VARIABLE,' +
            '       RC_PERIODONOMINA DDJJ, RC_EMPLEADOS EMPLEADOS, RC_MASASALARIAL MASA, RC_IMPORTERECLAMADO IMPORTERECLAMOAFIP, ' +
            '       RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS DEVENGADOS, ' +
            '       RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES PAGOS, ' +
            '       (RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS)-(RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES)-' +
            '       RC_IMPORTERECLAMADO-RC_MONTOREFINANCIADO-COBRANZA.GETSALDOINTERESES(RC_CONTRATO, RC_PERIODO) DEUDA, ' +
            '       RC_MONTOREFINANCIADO MONTOREFINANCIADO, RC_GESTIONABLE, COBRANZA.GETSALDOINTERESES(RC_CONTRATO, RC_PERIODO) SALDOINTERESES, ' + SqlTasaInteresFinal;

    sSql := sSql + ' DECODE(' + SqlValue(sPerConcQuiebra) + ', NULL, ''N'', UTILES.IIF_COMPARA(''<='', RC_PERIODO, ' + SqlValue( sPerConcQuiebra ) + ',''S'',''N'')) ESCONCURSOQUIEBRA ';

    if chkIncluir.Checked then
      sSql := sSql + ', RC_AMORTIZACUOTA + RC_AMORTIZAFONDO + RC_AMORTIZAINTERES EXTRAJUDICIAL'
    else
      sSql := sSql + ', 0 EXTRAJUDICIAL';

    sSql := sSql + ', RC_PRESCRIPTO PRESCRIPTO, RC_CODTIPOREGIMEN CODREG ' +
             ' FROM ZRC_RESUMENCOBRANZA_EXT ';

    if chkTodosContratos.Checked then
      sSql := sSql + ' WHERE RC_CONTRATOPRINCIPAL IN ( SELECT CO_CONTRATO ' +
                                                      '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                                      ' WHERE CO_IDEMPRESA = EM_ID ' +
                                                      '   AND EM_CUIT = ' + SqlValue(Cuit) + ')'
    else
      sSql := sSql + ' WHERE RC_CONTRATOPRINCIPAL = ' + SqlValue(Contrato);

    if not edRC_PERIODODesde.Periodo.IsNull then
      sSql := sSql + ' AND RC_PERIODO >= ' + SqlValue(edRC_PERIODODesde.Periodo.Valor);
    if not edRC_PERIODOHasta.Periodo.IsNull then
      sSql := sSql + ' AND RC_PERIODO <= ' + SqlValue(edRC_PERIODOHasta.Periodo.Valor);

    if sCompSaldo = '' then
      sSql := sSql + ' ) WHERE 1=1'
    else
      begin
        if chkNoMostrarReclamoAFIP.Checked then
          sSql := sSql + ' ) WHERE DEVENGADOS-PAGOS-IMPORTERECLAMOAFIP ' + sCompSaldo + ' 0'
        else
          sSql := sSql + ' ) WHERE DEVENGADOS-PAGOS ' + sCompSaldo + ' 0';
      end;

    if chkNoMostrarReclamoAFIP.Checked then
      sSql := sSql + ' AND COBRANZA.IS_NOMOSTRARRECLAMOAFIP(DEVENGADOS, PAGOS, IMPORTERECLAMOAFIP, PERIODO)=''S''';

    if chkNoMostrarConcQuiebra.Checked then
      sSql := sSql + ' AND ESCONCURSOQUIEBRA <> ''S''';

    if chkNoMostrarPrescripto.Checked then
      sSql := sSql + ' AND PRESCRIPTO <> ''S''';

    if fraTipoReg.IsSelected then
      sSql := sSql + ' AND CODREG = ' + SqlValue(fraTipoReg.Codigo);

    sSql := sSql + ' ORDER BY PERIODO DESC, CODREG DESC';

    sdqConsulta.SQL.Text := sSql;
    OpenQuery( sdqConsulta );

    //Guardo los datos para tenerlos en cuenta en el boton volver
    fSqlAnterior    := sdqConsulta.Sql.Text;
    fIncluirGestion := chkIncluir.Checked;
    fSaldoAcreedor  := chkSaldoAcreedor.Checked;
    fSaldoDeudor    := chkSaldoDeudor.Checked;
    fPeriodoDesdeAnterior := edRC_PERIODODesde.Periodo.Valor;
    fPeriodoHastaAnterior := edRC_PERIODOHasta.Periodo.Valor;

    //LE DOY FORMATO A LOS CAMPOS
    FormatCampos(True);
  end
  else if TipoListado = 'detalle' then
  begin
    if chkIncluir.Checked then
      sSqlAdic := ', ''A'', MO_IMPORTE'
    else
      sSqlAdic := '';

    //Genero el Sql
    sSql := 'SELECT ZMO.MO_CONTRATOPRINCIPAL CONTRATO, ZMO.MO_PERIODO PERIODO, MO_CODTIPOREGIMEN CODREG, CM_CODIGO, CM_DESCRIPCION, ' +
            '       DECODE (CM_OPERACION, ''E'',MO_IMPORTE, 0) DEVENGADOS, ' +
            '       DECODE (CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE' + sSqlAdic + ', 0) PAGOS,' +
            '       MO_FECHARECA, MO_FECHARECEPCION, MO_FECHADIST, ' +
            '       DECODE(MO_CODIGORECEPCION, ''1'', ''DGI'', ''2'', ''MANUAL'', ''4'', ''AUTOMÁTICO'', ''5'', ''AUTOMÁTICO'') TIPO_RECEP, ' +
            '       NVL(ZBA1.BA_NOMBRE, ZBA2.BA_NOMBRE) BANCO, NVL(ZCBREMESA.CB_NUMERO, ZCBCHEQUE.CB_NUMERO) CUENTA, DECODE(TV_CODIGO, ''EFE'', TV_DESCRIPCION, VA_NROCHEQUE) VALOR, ' +
            '       TB_DESCRIPCION ESTADO_VALOR, COBRANZA.GET_PLANPAGO(ZMO.MO_IDVALOR, ZMO.MO_CONTRATO, ZMO.MO_IDPLANVALOR) PLANPAGO, ' +
            '       ZMO.MO_USUALTA, TRUNC(ZMO.MO_FECHAALTA) FECHAALTA, CP_FECHACIERRE, MO_FECHAAPROBADO, MO_USUAPROBADO, MO_NUMEROBOLETA, ' +
            '       DECODE(RC_GESTIONABLE, ''N'', ''SI'', ''NO'') DDJJ, MO_CONTRATO CONTRATOEXT ' +
            '  FROM OTV_TIPOVALOR, RBD_BOLETADEPOSITO, ZCB_CUENTABANCARIA ZCBCHEQUE, XCP_CIERREPAGO, ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA_EXT, ZCM_CODIGOMOVIMIENTO, CTB_TABLAS, ' +
            '       ZBA_BANCO ZBA1, ZBA_BANCO ZBA2, ZCB_CUENTABANCARIA ZCBREMESA, RRM_REMESA, ZVA_VALOR ' +
            ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID' +
            '   AND MO_CONTRATO = RC_CONTRATO ' +
            '   AND RC_PERIODO =  MO_PERIODO' +
            '   AND VA_ESTADO = TB_CODIGO(+)' +
            '   AND TB_CLAVE (+)= ''ESVAL''' +
            '   AND MO_IDVALOR = VA_ID (+)' +
            '   AND VA_IDBANCO = ZBA2.BA_ID (+)' +
            '   AND MO_IDREMESA = RM_ID (+)' +
            '   AND RM_IDCUENTABANCARIA = ZCBREMESA.CB_ID (+)' +
            '   AND ZCBREMESA.CB_IDBANCO = ZBA1.BA_ID (+)' +
            '   AND MO_IDCIERREPAGO = CP_ID(+)' +
            '   AND VA_IDBOLETADEP = BD_ID(+)' +
            '   AND BD_IDCUENTABANCARIA = ZCBCHEQUE.CB_ID(+)' +
            '   AND VA_IDTIPOVALOR = TV_ID(+) ';

    sSql := sSql + Get_SqlDetalle(Contrato, Cuit, sCompSaldo);

    if not edRC_PERIODODesde.Periodo.IsNull then
      sSql := sSql + ' AND MO_PERIODO >= ' + SqlValue(edRC_PERIODODesde.Periodo.Valor);
    if not edRC_PERIODOHasta.Periodo.IsNull then
      sSql := sSql + ' AND MO_PERIODO <= ' + SqlValue(edRC_PERIODOHasta.Periodo.Valor);

    if chkNoMostrarReclamoAFIP.Checked then
      sSql := sSql + ' AND COBRANZA.IS_NOMOSTRARRECLAMOAFIP(RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS, ' +
                                                           'RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES, ' +
                                                           'RC_IMPORTERECLAMADO, RC_PERIODO)=''S''';

    if chkNoMostrarConcQuiebra.Checked then
      sSql := sSql + ' AND DECODE(' + SqlValue(sPerConcQuiebra) + ', NULL, ''N'', UTILES.IIF_COMPARA(''<='', RC_PERIODO, ' + SqlValue( sPerConcQuiebra ) + ',''S'',''N'')) <> ''S''';

    if chkNoMostrarPrescripto.Checked then
      sSql := sSql + ' AND RC_PRESCRIPTO <> ''S''';

    if fraTipoReg.IsSelected then
      sSql := sSql + ' AND MO_CODTIPOREGIMEN = ' + SqlValue(fraTipoReg.Codigo);

    sSql := sSql + ' ORDER BY PERIODO DESC, CODREG DESC';
    sdqConsulta.SQL.Text := sSql;
    OpenQuery( sdqConsulta );

    //LE DOY FORMATO A LOS CAMPOS
    FormatCampos(False);
  end;

  if sdqConsulta.IsEmpty then
    MessageDlg('No existen datos para esta consulta', mtWarning, [mbOK], 0);
end;

procedure TfrmAdminEstadoDeCuenta.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmAdminEstadoDeCuenta := nil;
end;

procedure TfrmAdminEstadoDeCuenta.FSFormCreate(Sender: TObject);
begin
  inherited;

  chkTodosContratos.Enabled := True;

  VCLExtra.LockControls(gbRazonSocial, True);
  fraCO_CONTRATO.ShowBajas := True;

  cmbINTERES_AL.Date := DBDate;
  btnVolver.Enabled  := False;

  tbLimpiarReclamoAFIP.Left        := 0;
  tbAprobarEmisionCertificado.Left := 0;
  tb441Web.Left                    := 0;
  tbSeparador2.Left                := 0;
  tbPeriodoProximo.Left            := 0;
  tbPeriodoAnterior.Left           := 0;
  tbSeparador.Left                 := 0;
  tbOrdenar.Left                   := 0;
  ToolButton11.Left                := 0;
  tbExportarGrilla.Left            := 0;
  tbImprimir.Left                  := 0;
  ToolButton6.Left                 := 0;
  tbIrPlanPago.Left                := 0;
  tbNomina.Left                    := 0;
  tbUsuario.Left                   := 0;

  SetLength(TotalResumen, MAXCOLS_RESUMEN + 1);
  SetLength(TotalDetalle, MAXCOLS_DETALLE + 1);

  fraInfoEmpresa.VerSinCompensados := False;
  fraTipoReg.Clear;
end;

procedure TfrmAdminEstadoDeCuenta.btnCalcularClick(Sender: TObject);
var
  Listado: String;
begin
  if rbResumen.Checked then
    Listado := 'resumen'
  else
    Listado := 'detalle';

  if DoValidar(Listado) then
    DoCargar(fraCO_CONTRATO.edContrato.Value, fraCO_CONTRATO.mskCUIT.Text, Listado);
end;

procedure TfrmAdminEstadoDeCuenta.ImprimeConsulta(Grilla: TArtDBGrid);
var
  AutoCols: Boolean;
begin
  if (Grilla.DataSource.DataSet.Active) and (not Grilla.DataSource.DataSet.IsEmpty) and (PrintDialog.Execute) then
  begin
    AutoCols := QueryPrint.Fields.Count = 0;
    try
      if AutoCols then
        QueryPrint.SetGridColumns(Grilla, True, [baDetail, baHeader, baTotal, baSubTotal]);

      if QueryPrint.Title.Text = '' then
        QueryPrint.Title.Text := fraCO_CONTRATO.mskCUIT.Text + ' - ' + fraCO_CONTRATO.cmbRSocial.Text + ' - ' + Caption;

      QueryPrint.Print;
    finally
      if AutoCols then
         QueryPrint.Fields.Clear;
    end;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmAdminEstadoDeCuenta.FormatCampos(IsResumen: Boolean);
var
  iloop: Integer;
begin
  if IsResumen then
  begin
    //CARGO LAS COLUMNAS DE LA GRILLA PARA EL RESUMEN
    SetLength(NombreCampos, 0);
    SetLength(NombreCampos, 16);

    NombreCampos[0]  := 'Contrato';
    NombreCampos[1]  := 'Período';
    NombreCampos[2]  := 'Rég.';
    NombreCampos[3]  := '$ Fija / % Var.';
    NombreCampos[4]  := 'DDJJ';
    NombreCampos[5]  := 'Empl.';
    NombreCampos[6]  := 'M. Salarial';
    NombreCampos[7]  := 'Devengados';
    NombreCampos[8]  := 'Pagos';
    NombreCampos[9]  := 'Amortización';
    NombreCampos[10] := 'Saldo Nominal';
    NombreCampos[11] := 'Monto Refin.';
    NombreCampos[12] := 'Período DDJJ';
    NombreCampos[13] := 'Reclamo AFIP';
    NombreCampos[14] := 'Interés';
    NombreCampos[15] := 'Sdo. Consol.';

    //Setea el nombre de los campos y oculta los que no estan en el vector de nombres
    for iloop := 0 to High(NombreCampos) do
    begin
      Grid.Columns.Items[iloop].Title.Caption := NombreCampos[iloop];
      sdqConsulta.Fields[iloop].DisplayLabel  := NombreCampos[iloop];
    end;

    for iloop := (High(NombreCampos ) + 1) to (Grid.Columns.Count - 1) do
      Grid.Columns.Items[iloop].Visible := False;

    //Setea para mostrar o no el campo
    Grid.Columns.Items[9].Visible := chkIncluir.Checked;

    //Formatea los campos
    TFloatField( sdqConsulta.FieldByName('INTERES') ).Currency            := True;
    TFloatField( sdqConsulta.FieldByName('MASA') ).Currency               := True;
    TFloatField( sdqConsulta.FieldByName('DEVENGADOS') ).Currency         := True;
    TFloatField( sdqConsulta.FieldByName('PAGOS') ).Currency              := True;
    TFloatField( sdqConsulta.FieldByName('EXTRAJUDICIAL') ).Currency      := True;
    TFloatField( sdqConsulta.FieldByName('DEUDA_TOTAL') ).Currency        := True;
    TFloatField( sdqConsulta.FieldByName('MONTOREFINANCIADO') ).Currency  := True;
    TFloatField( sdqConsulta.FieldByName('DEUDA_CONSOLIDADA') ).Currency  := True;
    TFloatField( sdqConsulta.FieldByName('IMPORTERECLAMOAFIP') ).Currency := True;

    //Agrego esto porque el ancho del campo esta mal y molesta cambiarlo a cada vez...
    Grid.Columns.Items[0].Width  := 45;
    Grid.Columns.Items[2].Width  := 30;
    Grid.Columns.Items[3].Width  := 74;
    Grid.Columns.Items[5].Width  := 50;
    Grid.Columns.Items[6].Width  := 110;
    Grid.Columns.Items[7].Width  := 100;
    Grid.Columns.Items[8].Width  := 100;
    Grid.Columns.Items[10].Width := 100;
    Grid.Columns.Items[12].Width := 70;
    Grid.Columns.Items[14].Width := 95;
    Grid.Columns.Items[15].Width := 95;

    Grid.Columns.Items[12].Alignment := taCenter;
  end
  else
  begin
    //CARGO LAS COLUMNAS DE LA GRILLA PARA EL DETALLE
    SetLength(NombreCampos, 0);
    SetLength(NombreCampos, 22);

    NombreCampos[0]  := 'Contrato';
    NombreCampos[1]  := 'Período';
    NombreCampos[2]  := 'Rég.';
    NombreCampos[3]  := 'Código';
    NombreCampos[4]  := 'Concepto';
    NombreCampos[5]  := 'Devengados';
    NombreCampos[6]  := 'Pagos';
    NombreCampos[7]  := 'F. Recaudac.';
    NombreCampos[8]  := 'F. Recepción';
    NombreCampos[9]  := 'F. Contable';
    NombreCampos[10] := 'Tipo Recepción';
    NombreCampos[11] := 'Banco';
    NombreCampos[12] := 'Cuenta Nro.';
    NombreCampos[13] := 'Nro. Cheque';
    NombreCampos[14] := 'Estado Valor';
    NombreCampos[15] := 'Nro. Plan Pago';
    NombreCampos[16] := 'Usuario de Alta';
    NombreCampos[17] := 'F. de Alta';
    NombreCampos[18] := 'F. de Comisión';
    NombreCampos[19] := 'F. de Aprobación';
    NombreCampos[20] := 'Usuario de Aprobación';
    NombreCampos[21] := 'Boleta de Depósito';

    for iloop := 0 to High(NombreCampos) do
    begin
      Grid.Columns.Items[iloop].Title.Caption := NombreCampos[iloop];
      sdqConsulta.Fields[iloop].DisplayLabel  := NombreCampos[iloop];
    end;

    for iloop := (High(NombreCampos ) + 1) + 1 to (Grid.Columns.Count - 1)  do    // el segundo + 1 es para mostrar col. DDJJ y no ocultarla...
      Grid.Columns.Items[iloop].Visible := False;

    Grid.Columns.Items[16].Visible := tbUsuario.Down;
    Grid.Columns.Items[17].Visible := tbUsuario.Down;
    Grid.Columns.Items[19].Visible := tbUsuario.Down;
    Grid.Columns.Items[20].Visible := tbUsuario.Down;

    Grid.Columns.Items[0].Width  := 45;
    Grid.Columns.Items[2].Width  := 30;
    Grid.Columns.Items[4].Width  := 130;
    Grid.Columns.Items[5].Width  := 90;
    Grid.Columns.Items[6].Width  := 90;
    Grid.Columns.Items[7].Width  := 72;
    Grid.Columns.Items[8].Width  := 73;
    Grid.Columns.Items[9].Width  := 72;
    Grid.Columns.Items[14].Width := 120;
    Grid.Columns.Items[17].Width := 64;
    Grid.Columns.Items[18].Width := 74;

    TFloatField( sdqConsulta.FieldByName('DEVENGADOS') ).Currency := True;
    TFloatField( sdqConsulta.FieldByName('PAGOS') ).Currency      := True;
  end;

  //Setea el componente para que puedan ordenar las columnas de la consulta
  SortDialog.SortFields.Clear;
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
end;

procedure TfrmAdminEstadoDeCuenta.GridDblClick(Sender: TObject);
var
  sPeriodo: String;
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and (fTipoListado = 'resumen') then
  begin
    rbDetalle.Checked := True;
    sPeriodo := sdqConsulta.FieldByName('PERIODO').AsString;
    edRC_PERIODODesde.Periodo.Valor := sPeriodo;
    edRC_PERIODOHasta.Periodo.Valor := sPeriodo;
    btnCalcularClick(nil);
  end;
end;

procedure TfrmAdminEstadoDeCuenta.btnVolverClick(Sender: TObject);
var
  sPeriodoActual: String;
begin
  //Pongo los controles como estaban
  sPeriodoActual    := edRC_PERIODODesde.Periodo.Valor;
  rbResumen.Checked := True;
  edRC_PERIODODesde.Periodo.Valor := fPeriodoDesdeAnterior;
  edRC_PERIODOHasta.Periodo.Valor := fPeriodoHastaAnterior;
  chkIncluir.Checked              := fIncluirGestion;
  chkSaldoAcreedor.Checked        := fSaldoAcreedor;
  chkSaldoDeudor.Checked          := fSaldoDeudor;
  btnCalcularClick(nil);
  if fTipoListado = 'resumen' then
  begin
    if Grid.CanFocus then
      Grid.SetFocus;
    sdqConsulta.Locate('PERIODO', sPeriodoActual, []);
  end;
end;

procedure TfrmAdminEstadoDeCuenta.chkSumatoriaClick(Sender: TObject);
begin
  inherited;
  CalcTotales;
end;

procedure TfrmAdminEstadoDeCuenta.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      if fTipoListado = 'resumen' then
      begin
        Grid.FooterBand := chkSumatoria.Checked;
        if chkSumatoria.Checked and sdqConsulta.Active then
          SumFields(sdqConsulta, CAMPOS_RESUMEN, TotalResumen);
      end
      else
      begin
        Grid.FooterBand := chkSumatoria.Checked;
        if chkSumatoria.Checked and sdqConsulta.Active then
          SumFields(sdqConsulta, CAMPOS_DETALLE, TotalDetalle);
      end
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
  FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  if fTipoListado = 'resumen' then
  begin
    iPos := ArrayPos( Column, CAMPOS_RESUMEN);
    if (iPos > -1) and (iPos <= MAXCOLS_RESUMEN) then
      Value := '$ ' + ToStr(TotalResumen[iPos]);
  end
  else
  begin
    iPos := ArrayPos( Column, CAMPOS_DETALLE);
    if (iPos > -1) and (iPos <= MAXCOLS_DETALLE) then
      Value := '$ ' + ToStr(TotalDetalle[iPos]);
  end;
end;

procedure TfrmAdminEstadoDeCuenta.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcTotales;
end;

procedure TfrmAdminEstadoDeCuenta.ImprimirReporte;
begin
  inherited;

  with TfrmImpresionEstadodeCuenta.Create(Self) do
  begin
    Contratos.Add (fraCO_CONTRATO.edContrato.Text);

    if not IsPerfilConsulta then
    begin
      chkTodosContratos.Checked          := Self.chkTodosContratos.Checked;
      cbJudicial.Checked                 := chkIncluir.Checked;
      chkNoMostrarConcQuiebra.Checked    := Self.chkNoMostrarConcQuiebra.Checked;
      chkNoMostrarReclamoAFIP.Checked    := Self.chkNoMostrarReclamoAFIP.Checked;
      chkNoMostrarPrescripto.Checked     := Self.chkNoMostrarPrescripto.Checked;
      chkInteresPerConcQuiebra.Checked   := Self.chkInteresPerConcQuiebra.Checked;
      chkInteresesSaldoAcreedor.Checked  := Self.chkInteresesSaldoAcreedor.Checked;
      cbIntereses.Checked                := (cmbINTERES_AL.Date <> 0);
      edVencimiento.Date                 := cmbINTERES_AL.Date;
      edFechaContable.Date               := cmbFECHACONTABLE_AL.Date;
      cbRangoPeriodos.Checked            := ((edRC_PERIODODesde.Periodo.Valor <> '') or (edRC_PERIODOHasta.Periodo.Valor <> ''));
      ppDesde.Periodo.Valor              := edRC_PERIODODesde.Periodo.Valor;
      ppHasta.Periodo.Valor              := edRC_PERIODOHasta.Periodo.Valor;
      rbPerNoSaldados.Checked            := (Self.chkSaldoDeudor.Checked or Self.chkSaldoAcreedor.Checked);
      chkSaldoDeudor.Checked             := Self.chkSaldoDeudor.Checked;
      chkSaldoAcreedor.Checked           := Self.chkSaldoAcreedor.Checked;
      rbDetalleART.Checked               := rbDetalle.Checked;
      fraTipoRegimen.Value               := fraTipoReg.Value;
    end;

    ShowModal;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.mnuImprimirGrillaClick(Sender: TObject);
begin
  // NWK, la saqué porque no andaba, por pedido de SGabrielli
  tbImprimir.Enabled := False;
  try
    ImprimeConsulta(Grid);
  finally
     tbImprimir.Enabled := True;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.pnlColor(Sender: TObject);
begin
  ColorDialog.Color := TPanel(Sender).Color;
  if ColorDialog.Execute then
    TPanel(Sender).Color := ColorDialog.Color;
end;

procedure TfrmAdminEstadoDeCuenta.tbUsuarioClick(Sender: TObject);
begin
  btnCalcularClick(Sender);
end;

procedure TfrmAdminEstadoDeCuenta.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;

  if fTipoListado = 'resumen' then
    FormatCampos(True)
  else
    FormatCampos(False);
end;

procedure TfrmAdminEstadoDeCuenta.rbResumenClick(Sender: TObject);
begin
  EnableButtons(False);
end;

procedure TfrmAdminEstadoDeCuenta.rbDetalleClick(Sender: TObject);
begin
  EnableButtons(True);
end;

procedure TfrmAdminEstadoDeCuenta.EnableButtons(AEnabled: Boolean);
begin
  tbPeriodoProximo.Enabled     := AEnabled;
  tbPeriodoAnterior.Enabled    := AEnabled;
  tbIrPlanPago.Enabled         := AEnabled;
  btnVolver.Enabled            := AEnabled;
  tbLimpiarReclamoAFIP.Enabled := not AEnabled;

  VCLExtra.LockControl(cmbFECHACONTABLE_AL, not AEnabled);
end;

procedure TfrmAdminEstadoDeCuenta.tbPeriodoAnteriorClick(Sender: TObject);
var
  sPeriodo, sPeriodoActual, sTipoBusqueda: String;
begin
  if ((Sender = tbPeriodoAnterior) and (edRC_PERIODODesde.Periodo.Valor <> '')) or
     ((Sender = tbPeriodoProximo) and (edRC_PERIODOHasta.Periodo.Valor <> '')) then
    begin
      if Sender = tbPeriodoAnterior then
      begin
        sPeriodoActual := edRC_PERIODODesde.Periodo.Valor;
        sTipoBusqueda  := 'A';
      end
      else
      begin
        sPeriodoActual := edRC_PERIODOHasta.Periodo.Valor;
        sTipoBusqueda  := 'S';
      end;

      sPeriodo := Get_PeriodoBusqueda( fraCO_CONTRATO.edContrato.Value, fraCO_CONTRATO.mskCUIT.Text, sPeriodoActual, sTipoBusqueda );

      if sPeriodo <> '' then
      begin
        edRC_PERIODODesde.Periodo.Valor := sPeriodo;
        edRC_PERIODOHasta.Periodo.Valor := sPeriodo;
        btnCalcularClick(nil);
      end;
    end;
end;

procedure TfrmAdminEstadoDeCuenta.tbIrPlanPagoClick(Sender: TObject);
var
  NroPlanPago: TTableId;
begin
  NroPlanPago := sdqConsulta.FieldByName('PLANPAGO').AsInteger;

  if NroPlanPago <> ART_EMPTY_ID then
  begin
    frmCargaPreAcuerdos.Free;
    frmCargaPreAcuerdos := TfrmCargaPreAcuerdos.Create(Self);
    frmCargaPreAcuerdos.ModoABM := unCustomPanelABM.maModificacion;
    frmCargaPreAcuerdos.DoCargar(IntToStr(NroPlanPago));
  end;
end;

procedure TfrmAdminEstadoDeCuenta.tbNominaClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('DDJJ').IsNull, nil, 'El período seleccionado no contiene fecha de declaración jurada.');

  with TfrmNominaPeriodos.Create(Self) do
  begin
    CUIT    := fraCO_CONTRATO.mskCUIT.Text;
    Periodo := Self.sdqConsulta.FieldByName('DDJJ').AsString;
    ShowModal;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  if fTipoListado = 'resumen' then
  begin
    if sdqConsulta.FieldByName('PRESCRIPTO').AsString = 'S' then
      Background := pnlColor4.Color;

    if (Field.FullName = 'IMPORTERECLAMOAFIP') and (Field.AsFloat <> 0) then
      Background := pnlColor0.Color;

    if sdqConsulta.FieldByName('ESCONCURSOQUIEBRA').AsString = 'S' then
    begin
      if (Field.FullName <> 'IMPORTERECLAMOAFIP') or (Field.AsFloat = 0) then
        Background := pnlColor1.Color;
    end;

    if sdqConsulta.FieldByName('TIENE_CHEQUE_RECHAZADO').AsString = 'S' then
      Background := pnlColor3.Color;
  end;
end;

function TfrmAdminEstadoDeCuenta.DoValidar(TipoListado: String): Boolean;
begin
  if TipoListado = 'resumen' then
  begin
    Verificar(chkInteresPerConcQuiebra.Checked and (cmbINTERES_AL.Date = 0), cmbINTERES_AL, 'Para calcular los intereses de los periodos en conc./quiebra, debe ingresar la fecha de interés.');
    Verificar(chkInteresesSaldoAcreedor.Checked and (cmbINTERES_AL.Date = 0), cmbINTERES_AL, 'Para calcular los intereses de los periodos con saldo acreedor, debe ingresar la fecha de interés.');
    Verificar(chkInteresPerConcQuiebra.Checked and chkNoMostrarConcQuiebra.Checked, chkNoMostrarConcQuiebra, 'Para calcular los intereses de los periodos en conc./quiebra, debe seleccionar que se muestren dichos periodos.');
  end;

  Result := True;
end;

procedure TfrmAdminEstadoDeCuenta.btnContactosClick(Sender: TObject);
begin
  with TfrmContratoContacto.Create(Self) do
  begin
    DoCargarDatos(fraCO_CONTRATO.Contrato, fraCO_CONTRATO.Value);
    Show;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.mnuImprEstadoCuentaClick(Sender: TObject);
begin
  ImprimirReporte;
end;

procedure TfrmAdminEstadoDeCuenta.mnuImprF817Click(Sender: TObject);
begin
  DoMostrarMensajeFormulariosAFIP(fraCO_CONTRATO.edContrato.Value);

  if not Do_ImprimirF817(ART_EMPTY_ID, fraCO_CONTRATO.edContrato.Value, srPreview, 1) then
    InfoHint(nil, 'No se han encontrado periodos con deuda');
end;

procedure TfrmAdminEstadoDeCuenta.mnuImprF801CClick(Sender: TObject);
begin
  Verificar(cmbINTERES_AL.Date = 0, cmbINTERES_AL, 'Debe indicar la fecha hasta la que se calculan los intereses.');
  DoMostrarMensajeFormulariosAFIP(fraCO_CONTRATO.edContrato.Value);

  if not Do_ImprimirF801C( fraCO_CONTRATO.edContrato.Value, cmbINTERES_AL.Date, (Sender = mnuImprF801CTotal) ) then
    InfoHint(nil, 'No se han encontrado periodos con intereses');
end;

procedure TfrmAdminEstadoDeCuenta.tbExportarGrillaClick(Sender: TObject);
begin
  if (dsConsulta.DataSet.Active) and (not dsConsulta.DataSet.IsEmpty) then
    with ExportDialog do
    begin
      Fields.Clear;
      Fields.Assign(Grid.Columns);
      Execute;
    end;
end;

procedure TfrmAdminEstadoDeCuenta.tb441WebClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or (sdqConsulta.IsEmpty) then
    raise Exception.Create('Debe elegir un registro.');

  with sdqPeriodo do
  try
    SQL.Text :=
      'BEGIN ' +
      '  ART.WEB.GET_PERIODOCTACTE(:Contrato, :Periodo); ' +
      'END;';

    Params[0].DataType := ftInteger;
    Params[0].Name := 'Contrato';
    Params[0].ParamType := ptInput;

    Params[1].DataType := ftCursor;
    Params[1].Name := 'Periodo';
    Params[1].ParamType := ptOutput;

    ParamByName('Contrato').AsInteger := sdqConsulta.FieldByName('CONTRATO').AsInteger;
    Open;

    fpPeriodosDisponibles.ShowModal;
  finally
    Close;
    SQL.Clear;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.fpPeriodosDisponiblesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpPeriodosDisponibles.Close;
end;

procedure TfrmAdminEstadoDeCuenta.btnGenerarClick(Sender: TObject);
var
  sUrl: String;
begin
  Verificar((dblcbPeriodo.Text = ''), dblcbPeriodo, 'Por favor, elija un período.');
  
  sUrl := Format('http://www.provinciart.com.ar/EstadoSituacion.aspx?con=%d&cod=%s&per=%s', [
    sdqConsulta.FieldByName('CONTRATO').AsInteger,
    frmConsultaEstadoDeCuenta.EncodeContrato(sdqConsulta.FieldByName('CONTRATO').AsInteger),
    sdqPeriodo.FieldByName('Periodo').AsString
  ]);

  ShellExecute(Application.Handle, 'open', PChar(sUrl), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAdminEstadoDeCuenta.tbAprobarEmisionCertificadoClick(Sender: TObject);
var
  sSql: String;
begin
  if (not sdqConsulta.Active) or (sdqConsulta.IsEmpty) then
    raise Exception.Create('Debe elegir un registro.');

  if fpAprobarEmisionCertificado.ShowModal = mrOk then
  begin
    sSql :=
      'INSERT INTO art.aad_autorizacertificadodeuda' +
                ' (ad_contrato, ad_fechasolicitud, ad_usuariosolicitud, ad_fechaautorizacion, ad_autorizado,' +
                 ' ad_deudafinal, ad_usuarioautorizo, ad_observacioncobranza, ad_fechavigencia)' +
         ' VALUES (:contrato, SYSDATE, :ususolicitud, SYSDATE, :autorizado, :deudafinal, :usuautorizo, :observaciones,' +
                 ' :fechavigencia)';
    EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('CONTRATO').AsInteger, Sesion.UserID,
                         String(IIF((rgPermite.ItemIndex = 0), 'S', 'N')),
                         GetDeuda(sdqConsulta.FieldByName('CONTRATO').AsInteger, DBDate), Sesion.UserID,
                         memoObservaciones.Lines.Text, TDateTimeEx.Create(edFechaCertificadoCobertura.Date)]);

    sSql :=
      'UPDATE aad_autorizacertificadodeuda' +
        ' SET ad_fechavigencia = :fechavigencia' +
      ' WHERE ad_contrato = :contrato' +
        ' AND ad_fechavigencia IS NULL';
    EjecutarSqlEx(sSql, [TDateTimeEx.Create(edFechaCertificadoCobertura.Date), sdqConsulta.FieldByName('CONTRATO').AsInteger]);

    MsgBox('Los datos se guardaron correctamente.');
  end;
end;

function TfrmAdminEstadoDeCuenta.GetDeuda(const aContrato: Integer; const aFecha: TDateTime): Extended;
begin
  with sdspGetDeudaCertificado do
  begin
    ParamByName('dtFECHA').AsDateTime :=  aFecha;
    ParamByName('nContrato').AsInteger := aContrato;

    ExecProc;

    Result := ParamByName('nDeudaTotal').AsFloat;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.btnAceptarClick(Sender: TObject);
begin
  Verificar(rgPermite.ItemIndex = -1, rgPermite, 'Debe elegir si permite o no.');
  Verificar(Trim(memoObservaciones.Lines.Text) = '', memoObservaciones, 'Debe ingresar las observaciones.');

  fpAprobarEmisionCertificado.ModalResult := mrOk;
end;

procedure TfrmAdminEstadoDeCuenta.btnCancelarClick(Sender: TObject);
begin
  fpAprobarEmisionCertificado.ModalResult := mrCancel;
end;

procedure TfrmAdminEstadoDeCuenta.fpAprobarEmisionCertificadoBeforeShow(Sender: TObject);
var
  sSql: String;
begin
  edFechaCertificadoCobertura.Date := DBDate + 15;
  pnMensaje.Hide;
  rgPermite.ItemIndex := -1;
  memoObservaciones.Clear;

  sSql :=
    'SELECT to_char(ad_fechavigencia, ''dd/mm/yyyy'') fechavigencia, ad_usuarioautorizo' +
     ' FROM aad_autorizacertificadodeuda' +
    ' WHERE ad_contrato = :contrato' +
      ' AND ad_autorizado = ''S''' +
 ' ORDER BY ad_id DESC';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('CONTRATO').AsInteger]) do
  try
    if not IsEmpty then
    begin
      lbMensaje.Caption := Format('Este contrato fue autorizado hasta el %s por %s.', [FieldByName('fechavigencia').AsString, FieldByName('ad_usuarioautorizo').AsString]);
      pnMensaje.Show;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdminEstadoDeCuenta.mnuImprLibreDeudaClick(Sender: TObject);
begin
  DoImprimirLibreDeuda(sdqConsulta.FieldByName('CONTRATO').AsInteger);
end;

procedure TfrmAdminEstadoDeCuenta.tbLimpiarReclamoAFIPClick(Sender: TObject);
var
  iContrato: Integer;
  sPeriodo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'Debe elegir un registro.');
  Verificar(sdqConsulta.FieldByName('IMPORTERECLAMOAFIP').AsFloat = 0, Grid, 'El reclamo AFIP debe ser distinto a 0.');

  if MsgBox('¿Confirma limpiar el reclamo AFIP seleccionado?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
    begin
      iContrato := sdqConsulta.FieldByName('CONTRATOEXT').AsInteger;
      sPeriodo  := sdqConsulta.FieldByName('PERIODO').AsString;

      Do_LimpiarImporteReclamado(iContrato, sPeriodo);
      Do_RedevengarConciliar(iContrato, sPeriodo, Sesion.UserID, True, False, True);

      MsgBox('Los datos se modificaron correctamente.');
      btnCalcularClick(nil);
    end;  
end;

end.
