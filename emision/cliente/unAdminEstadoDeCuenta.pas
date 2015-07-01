{-----------------------------------------------------------------------------
 Unidad:    unAdminEstadoDeCuenta
 Autor:     CChiappero
 Fecha:     26-Ene-2006
 Prósito:
 Historia:
-----------------------------------------------------------------------------}
unit unAdminEstadoDeCuenta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomPanelABM, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl,
  StdCtrls, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDbFrame,
  unFraEmpresa, unFraStaticCTB_TABLAS, unFraStaticCodigoDescripcion,
  unfraStaticActividad, Mask, ToolEdit, DateComboBox, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, PeriodoPicker, QueryPrint,
  SortDlg, Menus, unArtDBAwareFrame, unfraInfoEmpresa, JvgGroupBox,
  CurrEdit, PatternEdit, IntEdit, Math, JvExComCtrls, JvHeaderControl,
  QueryToFile, ExportDialog, DBCtrls, unUtils, ShellAPI, Buttons,
  FieldHider;

type
  TfrmAdminEstadoDeCuenta = class(TfrmCustomPanelABM)
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ColorDialog: TColorDialog;
    SortDialog: TSortDialog;
    tbOrdenar: TToolButton;
    tbPeriodoAnterior: TToolButton;
    tbPeriodoProximo: TToolButton;
    ToolButton1: TToolButton;
    tbTipoDeListado: TToolButton;
    gbEmpresa: TJvgGroupBox;
    Edit1: TEdit;
    gbRazonSocial: TGroupBox;
    lblMotivoBaja: TLabel;
    lblCUIT: TLabel;
    lblDomicilio: TLabel;
    lblTelefono: TLabel;
    lblCIIU: TLabel;
    lblEstado: TLabel;
    lblFechaBaja: TLabel;
    edMOTIVO_BAJA: TEdit;
    fraAC_CODIGO: TfraStaticActividad;
    edDC_TELEFONOS: TEdit;
    edDC_DOMICILIO: TEdit;
    cmbCO_FECHABAJA: TDateComboBox;
    fraCO_CONTRATO: TfraEmpresa;
    edESTADO: TEdit;
    gbVigencia: TGroupBox;
    lblFechaHasta: TLabel;
    lblFechaDesde: TLabel;
    cmbCO_VIGENCIAHASTA: TDateComboBox;
    cmbCO_VIGENCIADESDE: TDateComboBox;
    gbFechaContable: TGroupBox;
    cmbFECHACONTABLE_AL: TDateComboBox;
    gbFiltrosExtras: TGroupBox;
    chkIncluir: TCheckBox;
    chkSaldoAcreedor: TCheckBox;
    chkSaldoDeudor: TCheckBox;
    gbFechaInteres: TGroupBox;
    chkInteresPerConcQuiebra: TCheckBox;
    cmbINTERES_AL: TDateComboBox;
    chkInteresesSaldoAcreedor: TCheckBox;
    gbDatosAdicionales: TGroupBox;
    chkTodosContratos: TCheckBox;
    fpDetalleDevengado: TFormPanel;
    gbProcesos: TJvgGroupBox;
    lblVariablre: TLabel;
    lblCantidadTrabajadores: TLabel;
    lblMasaTrabajadores: TLabel;
    lblCuota: TLabel;
    edtMasaSalarial: TCurrencyEdit;
    edtSumaFija: TCurrencyEdit;
    edtSumaVariable: TCurrencyEdit;
    edtCuotaCalculada: TCurrencyEdit;
    edtCantidadTrabajadores: TIntEdit;
    lblFechaVigenciaEndoso: TLabel;
    edtFechaEndoso: TEdit;
    lblFijo: TLabel;
    bvSeparador1: TBevel;
    edtFechaDevengado: TEdit;
    edtUsuarioDevengado: TEdit;
    edtDevengadoCuota: TCurrencyEdit;
    edtDevengadoFondo: TCurrencyEdit;
    edtDevengadoInteres: TCurrencyEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    edtDevengadoOtros: TCurrencyEdit;
    lblFechaDevengado: TLabel;
    lblDevengadoCuota: TLabel;
    lblUsuarioDevengado: TLabel;
    lblDevenedoFondo: TLabel;
    lblDevengadoInteres: TLabel;
    tbBotonesEventos: TToolBar;
    Label2: TLabel;
    edtPeriodoNomina: TEdit;
    Label3: TLabel;
    edtFechaRecepcion: TEdit;
    Label4: TLabel;
    edtEstadoActual: TEdit;
    Label5: TLabel;
    edtSecuencia: TEdit;
    Bevel2: TBevel;
    Label6: TLabel;
    edtTipoDevengado: TEdit;
    Label7: TLabel;
    edtComentarioDevengado: TEdit;
    Bevel3: TBevel;
    btnSalirDetalleDevengado: TButton;
    sdqDevengados: TSDQuery;
    lblMotivoDevengado: TLabel;
    edtMotivoDevengado: TEdit;
    tbSumatoria: TToolButton;
    tbSeparador2: TToolButton;
    chkTodosLosCampos: TCheckBox;
    tbResumenDeDetalle: TToolButton;
    tbExportar: TToolButton;
    Grid: TArtDBGrid;
    tbRefrescar: TToolButton;
    edtPeriodo: TPeriodoPicker;
    pmOpciones: TPopupMenu;
    CalcularTotalSeleccion1: TMenuItem;
    gbReclAFIPConcQuiebra: TGroupBox;
    pnlColor0: TPanel;
    pnlColor1: TPanel;
    chkNoMostrarReclamoAFIP: TCheckBox;
    chkNoMostrarConcQuiebra: TCheckBox;
    pnlColor2: TPanel;
    chkNoMostrarChequesRech: TCheckBox;
    pnlColor3: TPanel;
    fraInfoEmpresa: TfraInfoEmpresa;
    ExportDialog: TExportDialog;
    Panel2: TPanel;
    tbMostrarOcultarColumnas: TToolButton;
    FieldHider: TFieldHider;
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure chkSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure pnlColor(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbPeriodoAnteriorClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbTipoDeListadoClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbResumenDeDetalleClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure CalcularTotalSeleccion1Click(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure MostrarTodos(Atodos : Boolean);
    procedure MostrarUsuarios(AUsuarios: boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure edtPeriodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FTipoListado: string;
    FPeriodo: string;
    FColorAnterior : Integer;
    FIdDevengadoAnterior : String;
    TotalResumen, TotalDetalle : array of extended;
    FCollapsed: boolean;
    procedure DoCargar( Contrato: Integer; Cuit, TipoListado: string );
    procedure ImprimeConsulta( Grilla: TArtDBGrid );
    procedure FormatCampos( IsResumen: boolean );
    procedure CalcTotales;
    procedure EnableButtons(AEnabled: Boolean);
    function Get_SqlDetalle(Contrato: Integer; Cuit, CompSaldo: String): String;
    function Get_CompSaldo: String;
    function Get_PeriodoBusqueda(Contrato: Integer; Cuit, Periodo, TipoBusqueda: String): String;
    function DoValidar(TipoListado: String): Boolean;
    procedure CargarDetalleDevengado(IdMovimiento: Integer);
    procedure CargarDetalle;
    procedure CargarResumen;
    procedure SetearMoneda(Campo: TField; const Monedas: array of string);
    procedure VerDetalleBloqueMovimientos;
    procedure SumSelectedFields(FieldNames: array of String; var Results: array of Extended);
    procedure CalcularTotalSeleccion;
  public
    property Collapsed : boolean read FCollapsed write FCollapsed;
    procedure CargarCabecera( Contrato: string; Periodo : string = '');
  end;

var
  frmAdminEstadoDeCuenta: TfrmAdminEstadoDeCuenta;

implementation
{$R *.DFM}

Uses
  unPrincipal, unDmPrincipal, VCLExtra, AnsiSql, dbFuncs, CustomDlgs, General, unCobranzas,
  unComunes, StrFuncs, Numeros, unArt, unDmEmision, unEstadoCuenta,
  unFuncionesEmision, unConstEmision;

Const
  MAXCOLS_RESUMEN = 6;
  MAXCOLS_DETALLE = 7;

  MAXCOLS_ESTADO_RESUMEN = 14;
  MAXCOLS_ESTADO_DETALLE = 17;

  CAMPOS_RESUMEN : array [0..MAXCOLS_RESUMEN] of string = ('DEVENGADOS', 'PAGOS', 'DEUDA_TOTAL', 'MONTOREFINANCIADO', 'INTERES' , 'DEUDA_CONSOLIDADA', 'IMPORTERECLAMOAFIP');
  CAMPOS_DETALLE : array [0..MAXCOLS_DETALLE] of string = ('DEVCUOTA', 'DEVFONDO', 'DEVINT', 'DEVOTROS', 'PAGCUOTA', 'PAGFONDO', 'PAGINT', 'PAGOTROS');

  CAMPOS_ESTADO_RESUMEN : array [0..MAXCOLS_ESTADO_RESUMEN] of string =
        ('Contrato', 'Período', '$ Fija / % Var.', 'DDJJ', 'Empl.', 'M. Salarial',
         'Devengados', 'Pagos', 'Amortización', 'Saldo Nominal', 'Interés', 'Monto Refin.',
         'Sdo. Consol.', 'DDJJ', 'Reclamo AFIP');

  ANCHOS_ESTADO_RESUMEN : array [0..MAXCOLS_ESTADO_RESUMEN] of integer =
        (70, 70, 74, -1, 40, 90, 80, 80, -1, -1, -1, -1, -1, 30, -1);

  MONEDAS_ESTADO_RESUMEN : array [0..8] of string = (
          'INTERES', 'MASA', 'DEVENGADOS', 'PAGOS', 'EXTRAJUDICIAL', 'DEUDA_TOTAL',
          'MONTOREFINANCIADO', 'DEUDA_CONSOLIDADA', 'IMPORTERECLAMOAFIP');

  CAMPOS_ESTADO_DETALLE : array [0..MAXCOLS_ESTADO_DETALLE] of string =
        ('Operación', 'Contrato', 'Período', 'Código', 'Concepto',
         'Dev. Cuota', 'Dev. Fondo', 'Dev. Interés', 'Dev. Otros',
         'Pagado Cuota', 'Pagado Fondo', 'Pagado Interés', 'Pagado Otros',
         'F. Contable', 'Usuario de Alta', 'F. de Alta',
         'Comentario Mov', 'Cód. Mov.');

  ANCHOS_ESTADO_DETALLE : array [0..MAXCOLS_ESTADO_DETALLE] of integer =
       (100, 50, 40, 37, 130,
        80, 80, 80, 80,
        80, 80, 80, 80,
        63, 100, 61,
        -1, -1);

  MONEDAS_ESTADO_DETALLE : array [0..7] of string = ('DEVCUOTA', 'DEVFONDO', 'DEVINT', 'DEVOTROS', 'PAGCUOTA', 'PAGFONDO', 'PAGINT', 'PAGOTROS');

{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CargarCabecera( Contrato: string; Periodo : string = '');
var
  sSql: string;
  Query: TSDquery;
begin
  sSql := 'SELECT CO_CONTRATO, DC_TELEFONOS || DC_FAX DC_TELEFONOS, AC_CODIGO, ' +
          '       AFEST.TB_DESCRIPCION AS ESTADO, CO_IDACTIVIDAD, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
          '       CO_FECHABAJA, '' ('' || BAJ.TB_CODIGO || '')  '' || BAJ.TB_DESCRIPCION AS MOTIVO_BAJA, ' +
          '       NVL(DC_DOMICILIO, ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL) ' +
          '       ||ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA)) AS DOM_POSTAL' +
          '  FROM ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD, CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
          ' WHERE CO_CONTRATO     = DC_CONTRATO' +
          '   AND CO_IDACTIVIDAD  = AC_ID' +
          '   AND BAJ.TB_CLAVE(+) = ''MOTIB''' +
          '   AND CO_MOTIVOBAJA   = BAJ.TB_CODIGO(+)' +
          '   AND AFEST.TB_CLAVE  = ''AFEST''' +
          '   AND AFEST.TB_CODIGO = CO_ESTADO' +
          '   AND CO_CONTRATO     = ' + Contrato;
  Query := GetQuery( sSql );

  try
    if not Query.Eof then
    begin
      With Query do
      begin
        fraCO_CONTRATO.Contrato  := FieldByName('CO_CONTRATO').AsInteger;
        edDC_DOMICILIO.Text      := FieldByName('DOM_POSTAL').AsString;
        edDC_TELEFONOS.Text      := FieldByName('DC_TELEFONOS').AsString;
        cmbCO_VIGENCIADESDE.Date := FieldByName('CO_VIGENCIADESDE').AsDateTime;
        cmbCO_VIGENCIAHASTA.Date := FieldByName('CO_VIGENCIAHASTA').AsDateTime;
        cmbCO_FECHABAJA.Date     := FieldByName('CO_FECHABAJA').AsDateTime;
        edMOTIVO_BAJA.Text       := FieldByName('MOTIVO_BAJA').AsString;
        fraAC_CODIGO.Value       := FieldByName('CO_IDACTIVIDAD').AsInteger;
        edESTADO.Text            := FieldByName('ESTADO').AsString;
        fraInfoEmpresa.CargarContrato(fraCO_CONTRATO.Contrato, fraCO_CONTRATO.mskCuit.Text);

        gbEmpresa.Collapsed := Collapsed;

        if Periodo <> '' then
        begin
          tbTipoDeListado.down := true;
          tbResumenDeDetalle.Visible := true;
          FPeriodo := Periodo;
          edtPeriodo.Periodo.Valor := Periodo;
        end
        else begin
          tbTipoDeListado.down := false;
          tbResumenDeDetalle.Visible := false;          
          FPeriodo := '';
          edtPeriodo.Periodo.Valor := '';
        end;

        //Actualiza la grilla
        tbRefrescarClick ( nil );
      end;
    end
    else
    MessageDlg('Los datos son incorrectos', mtWarning, [mbOK], 0);
  finally
    Query.Free;
  end;
end;
{--------------------------------------------------------------------------------------------}
function TfrmAdminEstadoDeCuenta.Get_PeriodoBusqueda(Contrato: Integer; Cuit, Periodo, TipoBusqueda: String): String;
var
  sCompSaldo, sSql, sFuncion, sOperador: string;
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
           'FROM ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA, ZCM_CODIGOMOVIMIENTO ' +
          'WHERE MO_IDCODIGOMOVIMIENTO = CM_ID ' +
            'AND MO_CONTRATO = RC_CONTRATO ' +
            'AND RC_PERIODO =  MO_PERIODO ' +
            'AND RC_PERIODO ' + sOperador + ' ' + SqlValue(Periodo) + ' ';
            
  sSql := sSql + Get_SqlDetalle(Contrato, Cuit, sCompSaldo);

  Result := ValorSql( sSql );
end;
{--------------------------------------------------------------------------------------------}
function TfrmAdminEstadoDeCuenta.Get_SqlDetalle(Contrato: Integer; Cuit, CompSaldo: String): String;
var
  sReclamoAFIP, sSql: string;
begin
  sSql := '';

  if chkTodosContratos.Checked then
    sSql := sSql + ' AND RC_CONTRATO IN ( SELECT CO_CONTRATO ' +
                                         '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                         ' WHERE CO_IDEMPRESA = EM_ID ' +
                                         '   AND EM_CUIT = ' + SqlValue(Cuit) + ')'
  else
    sSql := sSql + ' AND RC_CONTRATO = ' + SqlValue(Contrato);

  if chkIncluir.Checked then
    sSql := sSql + ' AND CM_OPERACION IN (''A'', ''C'', ''R'', ''E'') '
  else
    sSql := sSql + ' AND CM_OPERACION IN (''C'', ''R'', ''E'') ';

  if CompSaldo <> '' then
    begin
      sReclamoAFIP := iif(chkNoMostrarReclamoAFIP.checked, 'S', 'N');

      if chkIncluir.Checked  then
        sSql := sSql + ' AND ( COBRANZA.Get_SaldoPeriodo( RC_CONTRATO, ZMO.MO_PERIODO, ''N'', ' + Iif(not cmbFECHACONTABLE_AL.IsEmpty, SqlValue(cmbFECHACONTABLE_AL.Date), 'NULL') + ', ' + SqlValue(sReclamoAFIP) + ') ' + CompSaldo + ' 0 )'
      else
        sSql := sSql + ' AND ( COBRANZA.Get_SaldoPeriodo( RC_CONTRATO, ZMO.MO_PERIODO, NULL, ' + Iif(not cmbFECHACONTABLE_AL.IsEmpty, SqlValue(cmbFECHACONTABLE_AL.Date), 'NULL') + ', ' + SqlValue(sReclamoAFIP) + ') ' + CompSaldo + ' 0 )';
    end;

  if not cmbFECHACONTABLE_AL.IsEmpty then
    sSql := sSql + ' AND MO_FECHADIST <= ' + SqlValue( cmbFECHACONTABLE_AL.Date );

  Result := sSql;
end;
{--------------------------------------------------------------------------------------------}
function TfrmAdminEstadoDeCuenta.Get_CompSaldo: String;
var
  sCompSaldo: string;
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
{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.DoCargar (Contrato: Integer; Cuit, TipoListado: String);
var
  sCompSaldo, sSql, SqlTasaInteresFinal, sPrimerPeriodoDeuda: String;
  sSqlInteresPositivo, SqlVencimientoCuota: String;
  fFechaQuiebra: TDateTime;
  b : TBookMark;
begin
  sdqConsulta.DisableControls;

  if sdqConsulta.Active then
    b := sdqConsulta.GetBookmark
  else
   b := nil;

  fTipoListado  := TipoListado;
  sCompSaldo    := Get_CompSaldo;
  fFechaQuiebra := Get_MaxFechaConcQuiebra(Cuit);
  FPeriodo      := edtPeriodo.Periodo.Valor;

  if TipoListado = 'resumen' then
  begin
    EnableButtons( False );

    sPrimerPeriodoDeuda := Get_PrimerPeriodoConsidDeuda(Contrato, 'N', not chkNoMostrarConcQuiebra.Checked);

    Generar_SQLIntereses(Cuit, Contrato, cmbINTERES_AL.Date, chkInteresPerConcQuiebra.Checked, SqlTasaInteresFinal, sSqlInteresPositivo, SqlVencimientoCuota);

    sSql := 'SELECT CONTRATO, PERIODO, FIJA_VARIABLE, DDJJ, EMPLEADOS, MASA, ' +
            '       DEVENGADOS, PAGOS, EXTRAJUDICIAL, DEVENGADOS-PAGOS DEUDA_TOTAL, ' +
            '       MONTOREFINANCIADO, DECODE(PERIODO, DDJJ, ''SI'', ''NO'') DDJJCalculada, /* tener en cuenta el orden de los campos */ ' +
            '       IMPORTERECLAMOAFIP, ' +
                    Get_SqlInteresDeuda(chkInteresesSaldoAcreedor.Checked, sSqlInteresPositivo, 'DEUDA') + ' INTERES, '  +

            '       ROUND(TO_NUMBER(UTILES.IIF_COMPARA(''<'', PERIODO, ' + SqlValue( sPrimerPeriodoDeuda ) +
            '       , 0, DEUDA+' + Get_SqlInteresDeuda(chkInteresesSaldoAcreedor.Checked, sSqlInteresPositivo, 'DEUDA') + ')), 2) DEUDA_CONSOLIDADA, ' +

            '       ESCONCURSOQUIEBRA, DEUDA.IS_CHEQUERECHAZADO(CONTRATO, PERIODO) TIENE_CHEQUE_RECHAZADO_MIGR, ' +
            '       COBRANZA.IS_PERIODOCHEQUESRECHAZADOS(CONTRATO, PERIODO) TIENE_CHEQUE_RECHAZADO ' +
            '  FROM (' +
            'SELECT RC_PERIODO PERIODO, RC_CONTRATO CONTRATO, AFILIACION.GET_TARIFAVIGENTETEXTO( RC_CONTRATO, RC_PERIODO) AS FIJA_VARIABLE,' +
            '       RC_PERIODONOMINA AS DDJJ, RC_EMPLEADOS EMPLEADOS, RC_MASASALARIAL MASA, RC_IMPORTERECLAMADO IMPORTERECLAMOAFIP, ' +
            '       RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS DEVENGADOS, ' +
            '       RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES PAGOS, ' +
            '       (RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS)-(RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES)-RC_IMPORTERECLAMADO-RC_MONTOREFINANCIADO DEUDA, ' +
            '       RC_MONTOREFINANCIADO MONTOREFINANCIADO, ' + SqlTasaInteresFinal;

    sSql := sSql + ' DECODE(' + SqlValue(fFechaQuiebra) + ', NULL, ''N'', UTILES.IIF_COMPARA(''<'', RC_PERIODO, TO_CHAR(' + SqlValue( fFechaQuiebra ) + ',''YYYYMM''),''S'',''N'')) ESCONCURSOQUIEBRA ';

    if chkIncluir.Checked then
      sSql := sSql + ', RC_AMORTIZACUOTA + RC_AMORTIZAFONDO + RC_AMORTIZAINTERES EXTRAJUDICIAL'
    else
      sSql := sSql + ', 0 EXTRAJUDICIAL';

    sSql := sSql + '  FROM ZRC_RESUMENCOBRANZA ';
    if chkTodosContratos.Checked then
      sSql := sSql + ' WHERE RC_CONTRATO IN ( SELECT CO_CONTRATO ' +
                                             '  FROM ACO_CONTRATO, AEM_EMPRESA ' +
                                             ' WHERE CO_IDEMPRESA = EM_ID ' +
                                             '   AND EM_CUIT = ' + SqlValue(Cuit) + ')'
    else
      sSql := sSql + ' WHERE RC_CONTRATO = ' + SqlValue(Contrato);

//    if not edRC_PERIODODesde.Periodo.IsNull then
//      sSql := sSql + ' AND RC_PERIODO >= ' + SqlValue(edRC_PERIODODesde.Periodo.Valor);
//    if not edRC_PERIODOHasta.Periodo.IsNull then
//      sSql := sSql + ' AND RC_PERIODO <= ' + SqlValue(edRC_PERIODOHasta.Periodo.Valor);

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

//    if chkNoMostrarChequesRech.Checked then
//      sSql := sSql + ' AND DEUDA.IS_CHEQUERECHAZADO(CONTRATO, PERIODO) = ''N''';

    sSql := sSql + ' ORDER BY 1';

    sdqConsulta.SQL.Text := sSql;
    OpenQuery( sdqConsulta );

    //Guardo los datos para tenerlos en cuenta en el boton volver
//    fPeriodoDesdeAnterior := edRC_PERIODODesde.Periodo.Valor;
//    fPeriodoHastaAnterior := edRC_PERIODOHasta.Periodo.Valor;

    if Assigned(b) then
    begin
      try
        sdqConsulta.GotoBookmark(b);
      except
      end;
      sdqConsulta.FreeBookmark(b);
    end;
    sdqConsulta.EnableControls;

    //LE DOY FORMATO A LOS CAMPOS
    FormatCampos(True);
  end
  else if TipoListado = 'detalle' then
  begin
    EnableButtons( True );

    //Genero el Sql
    sSql := 'SELECT TRIM(EMI.UTILES.GET_DESCRIPCIONMOVIMIENTO(MO_ID)) DESCRIPCIONMOVIMIENTO,' +
            '       ZMO.MO_CONTRATO CONTRATO, ZMO.MO_PERIODO PERIODO, CM_CODIGO, CM_DESCRIPCION, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''EC'', MO_IMPORTE, 0) DEVCUOTA, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''EF'', MO_IMPORTE, 0) DEVFONDO, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''EI'', MO_IMPORTE, 0) DEVINT, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''EO'', MO_IMPORTE, 0) DEVOTROS, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''CC'', MO_IMPORTE, ''RC'', MO_IMPORTE ' + Iif(chkIncluir.Checked, ', ''AC'', MO_IMPORTE ', '') + ', 0) PAGCUOTA, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''CF'', MO_IMPORTE, ''RF'', MO_IMPORTE ' + Iif(chkIncluir.Checked, ', ''AF'', MO_IMPORTE ', '') + ', 0) PAGFONDO, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''CI'', MO_IMPORTE, ''RI'', MO_IMPORTE ' + Iif(chkIncluir.Checked, ', ''AI'', MO_IMPORTE ', '') + ', 0) PAGINT, ' +
            '       DECODE(CM_OPERACION || CM_CONCEPTO, ''CO'', MO_IMPORTE, 0) PAGOTROS, ' +
            '       TRUNC(MO_FECHADIST) FECHADIST, ZMO.MO_USUALTA, TRUNC(ZMO.MO_FECHAALTA) FECHAALTA, ' +
            '       TRIM(EMI.UTILES.GET_COMENTARIOMOVIMIENTO(MO_ID)) COMENTARIOMOVIMIENTO, MO_ID "Cód.Movimiento", ' +
            '       DECODE(CM_TIPOGENERACION, ''M'', ''Manual'', ''A'', ''Automático'', ''S'', ''Semiautomático'', '''') CM_TIPOGENERACION' + 
            '  FROM ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA, ZCM_CODIGOMOVIMIENTO ' +
            ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID ' +
            '   AND MO_CONTRATO = RC_CONTRATO ' +
            '   AND MO_PERIODO = RC_PERIODO  ';

    sSql := sSql + Get_SqlDetalle(Contrato, Cuit, sCompSaldo);

//    if not edRC_PERIODODesde.Periodo.IsNull then
//      sSql := sSql + ' AND MO_PERIODO >= ' + SqlValue(edRC_PERIODODesde.Periodo.Valor);
//    if not edRC_PERIODOHasta.Periodo.IsNull then
//      sSql := sSql + ' AND MO_PERIODO <= ' + SqlValue(edRC_PERIODOHasta.Periodo.Valor);

    if not edtPeriodo.Periodo.IsNull then
      sSql := sSql + ' AND MO_PERIODO = ' + SqlValue(edtPeriodo.Periodo.Valor);

    if chkNoMostrarReclamoAFIP.Checked then
      sSql := sSql + ' AND COBRANZA.IS_NOMOSTRARRECLAMOAFIP(RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS, ' +
                                                           'RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES, ' +
                                                           'RC_IMPORTERECLAMADO, RC_PERIODO)=''S''';

    if chkNoMostrarConcQuiebra.Checked then
      sSql := sSql + ' AND DECODE(' + SqlValue(fFechaQuiebra) + ', NULL, ''N'', UTILES.IIF_COMPARA(''<'', RC_PERIODO, TO_CHAR(' + SqlValue( fFechaQuiebra ) + ',''YYYYMM''),''S'',''N'')) <> ''S''';

//    if chkNoMostrarChequesRech.Checked then
//      sSql := sSql + ' AND DEUDA.IS_CHEQUERECHAZADO(RC_CONTRATO, RC_PERIODO) = ''N''';

    sSql := sSql + ' ORDER BY MO_ID';

    sdqConsulta.SQL.Text := sSql;
    OpenQuery( sdqConsulta );

    if Assigned(b) then
    begin
      try
        sdqConsulta.GotoBookmark(b);
      except
      end;
      sdqConsulta.FreeBookmark(b);
    end;

    sdqConsulta.EnableControls;

    //LE DOY FORMATO A LOS CAMPOS
    //// FormatCampos(False);
  end;

  CalcTotales;

  if sdqConsulta.IsEmpty then
    MessageDlg('No existen datos para esta consulta', mtWarning, [mbOK], 0);
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmAdminEstadoDeCuenta := nil;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.FSFormCreate(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls( gbRazonSocial, True );
  fraCO_CONTRATO.ShowBajas := True;
  cmbINTERES_AL.Date := Date();

  ToolButton11.Left       := 0;

  tbExportar.Left         := 0;
  tbImprimir.Left         := 0;

//  tbSeparador.Left        := 0;

//  tbPeriodoAnterior.Left  := 0;
  tbSeparador2.Left       := 0;
//  edtPeriodo.Left         := 0;
//  tbPeriodoProximo.Left   := 0;

  tbResumenDeDetalle.Left := 0;
  tbTipoDeListado.Left    := 0;

  tbSumatoria.Left        := 0;
  tbOrdenar.Left          := 0;

  ToolButton6.Left        := 0;

  tbLimpiar.Left          := 0;
  tbRefrescar.Left        := 0;

  ToolButton11.Left       := tbPeriodoProximo.Left + tbPeriodoProximo.Width + 1;
  tbSalir.Left            := tbPeriodoProximo.Left + tbPeriodoProximo.Width + 1;

  SetLength( TotalResumen,  MAXCOLS_RESUMEN  + 1);
  SetLength( TotalDetalle,  MAXCOLS_DETALLE  + 1);

  // por ahora, quedan deshabilitados, porque tarda demasiado
  with fraInfoEmpresa do
    begin
      VerSinCompensados := False;
      VerCartasImpresas := False;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.ImprimeConsulta( Grilla: TArtDBGrid );
var
  AutoCols : Boolean;
begin
  if Grilla.DataSource.DataSet.Active and (not Grilla.DataSource.DataSet.IsEmpty) and PrintDialog.Execute Then begin
    AutoCols := QueryPrint.Fields.Count = 0;
    try
      if AutoCols Then
         QueryPrint.SetGridColumns( Grilla, True, [baDetail, baHeader, baTotal, baSubTotal] );

      if QueryPrint.Title.Text = '' Then
         QueryPrint.Title.Text := fraCO_CONTRATO.mskCUIT.Text + ' - ' + fraCO_CONTRATO.cmbRSocial.Text + ' - ' + Caption;

      QueryPrint.Print ;
    finally
      if AutoCols Then
         QueryPrint.Fields.Clear ;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbResumenDeDetalleClick(Sender: TObject);
begin
  VerDetalleBloqueMovimientos;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.MostrarTodos(Atodos : Boolean);
const
  OCULTABLES : array [0..5] of integer = (11,12,13,15,20,21);
var
 i : integer;
begin
  for i := 0 to high(OCULTABLES) do
    Grid.Columns.Items[OCULTABLES[i]].Visible := ATodos;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.MostrarUsuarios(AUsuarios : boolean);
const
  OCULTABLES : array [0..3] of integer = (16, 17, 18, 19);
var
 i : integer;
begin
  for i := 0 to high(OCULTABLES) do
    Grid.Columns.Items[OCULTABLES[i]].Visible := AUsuarios;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.SetearMoneda(Campo : TField; const Monedas : array of string);
var
 i : integer;
begin
  for i := 0 to high(Monedas) do
   if Monedas[i] = Campo.FieldName then
     TFloatField(Campo).Currency := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CargarDetalle;
var
 i : integer;
begin
    //MostrarTodos(chkTodosLosCampos.Checked);
    //MostrarUsuarios(tbUsuario.Down);

    for i := 0 to High( CAMPOS_ESTADO_DETALLE ) do
    begin
      if ANCHOS_ESTADO_DETALLE[i] > -1 then
        begin
          Grid.Columns.Items[i].Title.Caption := CAMPOS_ESTADO_DETALLE[i];
          sdqConsulta.Fields[i].DisplayLabel  := CAMPOS_ESTADO_DETALLE[i];
          SetearMoneda(sdqConsulta.Fields[i], MONEDAS_ESTADO_DETALLE);

          Grid.Columns.Items[i].Width   := ANCHOS_ESTADO_DETALLE[i];
          Grid.Columns.Items[i].Visible := True;
        end
      else
        Grid.Columns.Items[i].Visible := False;
    end;

    SortDialog.SortFields.Clear;
    LoadDynamicSortFields( SortDialog.SortFields, Grid.Columns );
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CargarResumen;
var
 i : integer;
begin
    for i := 0 to High( CAMPOS_ESTADO_RESUMEN ) do
    begin
      Grid.Columns.Items[i].Title.Caption := CAMPOS_ESTADO_RESUMEN[i];
      sdqConsulta.Fields[i].DisplayLabel  := CAMPOS_ESTADO_RESUMEN[i];

      if ANCHOS_ESTADO_RESUMEN[i] > -1 then
        Grid.Columns.Items[i].Width := ANCHOS_ESTADO_RESUMEN[i];

      SetearMoneda(sdqConsulta.Fields[i], MONEDAS_ESTADO_RESUMEN);        
    end;

    for i := (High(CAMPOS_ESTADO_RESUMEN) + 1) to (Grid.Columns.Count - 1) do
       Grid.Columns.Items[i].Visible := False;

    //Setea para mostrar o no el campo
    //Grid.Columns.Items[8].Visible := chkIncluir.Checked;

    //Setea el componente para que puedan ordenar las columnas de la consulta
    SortDialog.SortFields.Clear;
    LoadDynamicSortFields( SortDialog.SortFields, Grid.Columns );

    Grid.Columns.Items[13].Alignment := taCenter;
end;

procedure TfrmAdminEstadoDeCuenta.FormatCampos( IsResumen: boolean );
begin
  if IsResumen then
    CargarResumen
  else
    CargarDetalle;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CargarDetalleDevengado(IdMovimiento : Integer);
begin
  if sdqDevengados.Active then sdqDevengados.Close;
  sdqDevengados.ParamByName('idmovimiento').AsInteger := IdMovimiento;
  sdqDevengados.Open;

  if sdqDevengados.Recordcount > 0 then
  begin
    edtFechaDevengado.Text :=  sdqDevengados.FieldByName('de_fechacalculo').AsString;
    edtUsuarioDevengado.Text := sdqDevengados.FieldByName('de_usuariocalculo').AsString;
    edtTipoDevengado.Text := sdqDevengados.FieldByName('tipo').AsString;
    edtComentarioDevengado.Text := sdqDevengados.FieldByName('de_comentariodevengado').AsString;
    edtMotivoDevengado.Text := sdqDevengados.FieldByName('motivo').Text;
    edtDevengadoCuota.Value := sdqDevengados.FieldByName('de_devengadocuota').AsCurrency;
    edtDevengadoFondo.Value := sdqDevengados.FieldByName('de_devengadofondo').AsCurrency;
    edtDevengadoInteres.Value := sdqDevengados.FieldByName('de_devengadointeres').AsCurrency;
    edtDevengadoOtros.Value := sdqDevengados.FieldByName('de_devengadootros').AsCurrency;

    if sdqDevengados.FieldByName('dj_id').asstring <> '' then
    begin
      edtPeriodoNomina.Text := sdqDevengados.FieldByName('dj_periodo').AsString;
      edtSecuencia.Text := sdqDevengados.FieldByName('rectificativa').AsString;
      edtCantidadTrabajadores.Value := sdqDevengados.FieldByName('dj_empleados').AsInteger;
      edtMasaSalarial.Value := sdqDevengados.FieldByName('dj_masasalarial').AsCurrency;
      edtFechaRecepcion.Text := sdqDevengados.FieldByName('fecha_presentacion').AsString;
      edtEstadoActual.Text := sdqDevengados.FieldByName('activa').AsString;
    end;

    edtFechaEndoso.Text := sdqDevengados.FieldByName('ht_vigenciatarifa').AsString;
    edtSumaFija.Value := sdqDevengados.FieldByName('ht_sumafija').AsCurrency;
    edtSumaVariable.Value := sdqDevengados.FieldByName('ht_porcmasa').AsCurrency;
    edtCuotaCalculada.Value := RoundTo((sdqDevengados.FieldByName('dj_masasalarial').AsCurrency *
                                   sdqDevengados.FieldByName('ht_porcmasa').AsFloat / 100) +
                                   (sdqDevengados.FieldByName('dj_empleados').AsInteger  * sdqDevengados.FieldByName('ht_sumafija').AsFloat), -2);

    fpDetalleDevengado.ShowModal;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.VerDetalleBloqueMovimientos;
var
  sPeriodo: string;
begin
  if sdqConsulta.Active and not sdqConsulta.Eof then
  begin
    if (FTipoListado = 'resumen') then
    begin
      tbTipoDeListado.down := True;
      tbResumenDeDetalle.Visible := true;
      sPeriodo := sdqConsulta.FieldByName('PERIODO').AsString;
      FPeriodo := sPeriodo;
      tbRefrescarClick ( nil );
    end else
    begin
      if sdqConsulta.Fields[0].AsString <> '' then
        CargarDetalleDevengado(sdqConsulta.FieldByName('Cód.Movimiento').AsInteger)
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.GridDblClick(Sender: TObject);
begin
  VerDetalleBloqueMovimientos;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.chkSumatoriaClick(Sender: TObject);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CalcTotales;
Var PrevCursor : TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      if fTipoListado = 'resumen' then
      begin
        Grid.FooterBand := tbSumatoria.Down;
        if tbSumatoria.Down and sdqConsulta.Active Then
        begin
          SumFields( sdqConsulta, CAMPOS_RESUMEN, TotalResumen );
        end;
      end
      else
      begin
        Grid.FooterBand := tbSumatoria.Down;
        if tbSumatoria.Down and sdqConsulta.Active Then
        begin
          if Grid.SelectedRows.Count > 0 then
            SumSelectedFields( CAMPOS_DETALLE, TotalDetalle )
          else
            SumFields( sdqConsulta, CAMPOS_DETALLE, TotalDetalle );
        end;
      end
    Except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.GridPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var iPos : integer;
begin

  AlignFooter := afRight;
  if fTipoListado = 'resumen' then
  begin
    iPos := ArrayPos( Column, CAMPOS_RESUMEN);
    if (iPos > -1) and (iPos <= MAXCOLS_RESUMEN) Then
      Value := '$ ' + ToStr(TotalResumen[iPos]);
  end
  else
  begin
    iPos := ArrayPos( Column, CAMPOS_DETALLE);
    if (iPos > -1) and (iPos <= MAXCOLS_DETALLE) Then
    begin
      Value := '$ ' + ToStr(TotalDetalle[iPos]);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName( 'DEVCUOTA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DEVCUOTA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'DEVFONDO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DEVFONDO' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'DEVINT' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DEVINT' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'DEVOTROS' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'DEVOTROS' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PAGCUOTA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PAGCUOTA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PAGFONDO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PAGFONDO' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PAGINT' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PAGINT' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PAGOTROS' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PAGOTROS' ) ).Currency := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.pnlColor(Sender: TObject);
begin
  ColorDialog.Color := TPanel(Sender).Color;
  if ColorDialog.Execute Then
    TPanel(Sender).Color := ColorDialog.Color;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  SortDialog.Execute;

  (*////if fTipoListado = 'resumen' then
    FormatCampos(True)
  else
    FormatCampos(False);*)
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.EnableButtons(AEnabled: Boolean);
begin
  tbPeriodoProximo.Enabled  := AEnabled;
  tbPeriodoAnterior.Enabled := AEnabled;
  edtPeriodo.Enabled        := AEnabled;
  VCLExtra.LockControl( cmbFECHACONTABLE_AL, not AEnabled);
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbPeriodoAnteriorClick(Sender: TObject);
var
  sPeriodo, sPeriodoActual, sTipoBusqueda: String;
begin
  if ((Sender = tbPeriodoAnterior) and (FPeriodo <> '')) or
     ((Sender = tbPeriodoProximo) and (FPeriodo <> '')) then
  begin
    if Sender = tbPeriodoAnterior then
      begin
        sPeriodoActual := FPeriodo;
        sTipoBusqueda  := 'A';
      end
    else
      begin
        sPeriodoActual := FPeriodo;
        sTipoBusqueda  := 'S';
      end;

    sPeriodo := Get_PeriodoBusqueda( fraCO_CONTRATO.edContrato.Value, fraCO_CONTRATO.mskCUIT.Text, sPeriodoActual, sTipoBusqueda );
    if sPeriodo <> '' then
    begin
      FPeriodo := sPeriodo;
      edtPeriodo.Periodo.Valor := sPeriodo;
      tbRefrescarClick ( nil );
    end;
  end;
end;
{--------------------------------------------------------------------------------------------}
function TfrmAdminEstadoDeCuenta.DoValidar(TipoListado: String): Boolean;
begin
  if TipoListado = 'resumen' then
    begin
      Verificar( chkInteresPerConcQuiebra.Checked and (cmbINTERES_AL.Date = 0), cmbINTERES_AL, 'Para calcular los intereses de los periodos en conc./quiebra, debe ingresar la fecha de interés.' );
      Verificar(chkInteresesSaldoAcreedor.Checked and (cmbINTERES_AL.Date = 0), cmbINTERES_AL, 'Para calcular los intereses de los periodos con saldo acreedor, debe ingresar la fecha de interés.');
      Verificar( chkInteresPerConcQuiebra.Checked and chkNoMostrarConcQuiebra.Checked, chkNoMostrarConcQuiebra, 'Para calcular los intereses de los periodos en conc./quiebra, debe seleccionar que se muestren dichos periodos.' );
    end;

  Result := True;
end;
{--------------------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbRefrescarClick(Sender: TObject);
var
  Listado: string;
begin
  if tbTipoDeListado.Down then
    Listado := 'detalle'
  else
    Listado := 'resumen';

  if DoValidar( Listado ) then
    DoCargar( fraCO_CONTRATO.edContrato.Value, fraCO_CONTRATO.mskCUIT.Text, Listado );
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbTipoDeListadoClick(Sender: TObject);
begin
  tbRefrescarClick ( nil );

  tbResumenDeDetalle.Visible := tbTipoDeListado.Visible;
  tbResumenDeDetalle.Down := false;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  edtPeriodo.Periodo.Valor := sdqConsulta.FieldByName('periodo').AsString;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Highlight then Background := clTeal;

  if fTipoListado = 'resumen' then
  begin
      if (Field.FullName = 'IMPORTERECLAMOAFIP') and (Field.AsFloat <> 0) then
        Background := pnlColor0.Color;

      if sdqConsulta.FieldByName('ESCONCURSOQUIEBRA').AsString = 'S' then
      begin
          if (Field.FullName <> 'IMPORTERECLAMOAFIP') or (Field.AsFloat = 0) then
            Background := pnlColor1.Color;
      end;

      if sdqConsulta.FieldByName('TIENE_CHEQUE_RECHAZADO_MIGR').AsString = 'S' then
        Background := pnlColor2.Color;

      if sdqConsulta.FieldByName('TIENE_CHEQUE_RECHAZADO').AsString = 'S' then
        Background := pnlColor3.Color;
  end
  else
  begin
    if (Field.FieldName = 'DESCRIPCIONMOVIMIENTO') and
       (sdqConsulta.FieldByName('COMENTARIOMOVIMIENTO').asstring <> '') then
    begin
      if (FIdDevengadoAnterior = sdqConsulta.FieldByName('COMENTARIOMOVIMIENTO').asstring)  then
        AFont.Color := FColorAnterior
      else
      begin
        AFont.Color := clWindowText;
        FIdDevengadoAnterior := sdqConsulta.FieldByName('COMENTARIOMOVIMIENTO').asstring;

        if FColorAnterior = COLOR_DEVENGADO1 then
          FColorAnterior := COLOR_DEVENGADO2
        else
          FColorAnterior := COLOR_DEVENGADO1;
      end;
    end;

    if (sdqConsulta.FieldByName('COMENTARIOMOVIMIENTO').asstring <> '') then
    begin
       if Highlight then
         Background := COLOR_DEVENGADO3
       else
         Background := FColorAnterior;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.SumSelectedFields(FieldNames: array of String; var Results: array of Extended);
var
 i, j  : integer;
 Dataset : TDataset;
 Field    : TField;
 b : TBookmark;
begin
  DataSet := grid.DataSource.DataSet;

  for j := Low(Results) to High(Results) do  Results[j] := 0;

  Dataset.DisableControls;
  b := Dataset.GetBookmark;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
       Dataset.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
       for j := Low(Results) to High(Results) do
       begin
         Field := DataSet.FindField(FieldNames[j]);
         if Assigned(Field) Then
           Results[j] := Results[j] + Field.AsFloat ;
       end;
    end;
  finally
    Dataset.GotoBookmark(b);
    Dataset.FreeBookmark(b);
    DataSet.EnableControls;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CalcularTotalSeleccion;
Begin
  if (Grid.SelectedRows.Count > 0) and tbSumatoria.Down then
  begin
    CalcTotales;
    Grid.Refresh;
  end;
End;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.FSFormShow(Sender: TObject);
begin
  inherited;
  FColorAnterior := COLOR_DEVENGADO1;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.CalcularTotalSeleccion1Click(
  Sender: TObject);
begin
  inherited;
  CalcularTotalSeleccion;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbExportarClick(Sender: TObject);
begin
  if (dsConsulta.DataSet.Active) and (not dsConsulta.DataSet.IsEmpty) then
    with ExportDialog do
    begin
      Fields.Clear;
      Fields.Assign(Grid.Columns);
      Execute;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.Enabled := False;
  Try
    ImprimeConsulta( Grid );
  finally
     tbImprimir.Enabled := True;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  FieldHider.Execute;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdminEstadoDeCuenta.edtPeriodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13	 then
    tbRefrescarClick(nil);
end;
{------------------------------------------------------------------------------}
end.

