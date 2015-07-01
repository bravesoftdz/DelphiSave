{-----------------------------------------------------------------------------
-----------------------------------------------------------------------------}
unit UnLiqBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta,
  StdCtrls, SinEdit, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, ImgList, unFraEmpresa, Mask, Buttons, FormPanel, ToolEdit,
  DateComboBox, unFraCtbTablas, unArtFrame, unFraCodigoDescripcion, Menus, RxMemDS, Numeros,
  RxRichEd, CurrEdit,ClipBrd, unArtDbFrame, PatternEdit, DateTimeEditors, unArtDBAwareFrame,
  unFraTrabajadorSiniestro, unFraTrabajador, unfraDelegacion, unClassLiquidacion,
  unFraDomicilio, RxCurrEdit, RxToolEdit, RxPlacemnt, uncomunes;

type
  TfrmLiqBeneficiarios = class(TfrmCustomConsulta)
    sdqBusqueda: TSDQuery;
    sdqBusquedaEX_SINIESTRO: TFloatField;
    sdqBusquedaEX_ORDEN: TFloatField;
    sdqBusquedaEX_RECAIDA: TFloatField;
    sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField;
    sdqBusquedaEX_DIAGNOSTICO: TStringField;
    sdqBusquedaEX_CUIT: TStringField;
    sdqBusquedaEX_CUIL: TStringField;
    sdqBusquedaEX_CAUSAFIN: TStringField;
    sdqBusquedaEX_GTRABAJO: TStringField;
    sdqBusquedaGP_NOMBRE: TStringField;
    sdqBusquedaLG_NOMBRE: TStringField;
    sdqBusquedaEX_PRESTADOR: TFloatField;
    dsBusqueda: TDataSource;
    sdqBusquedaEX_GRAVEDAD: TStringField;
    GridParent: TArtDBGrid;
    sdqConsultaParent: TSDQuery;
    dsConsultaGral: TDataSource;
    SDQGrupoFam: TSDQuery;
    MenuSeleccion: TPopupMenu;
    SeleccionarTodos1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    memDatos: TRxMemoryData;
    sdqFinancials: TSDQuery;
    mnuPrint: TPopupMenu;
    mnuImprimirGrilla: TMenuItem;
    mnuReimprimirLiquidacion: TMenuItem;
    mnuModifImporte: TPopupMenu;
    EditarImporte1: TMenuItem;
    tbBeneficiarios: TToolButton;
    tbSalir2: TToolButton;
    tbCargarSeguroRetiro: TToolButton;
    mnuSolicituddeCotizacion: TMenuItem;
    Panel1: TPanel;
    lbDesde: TLabel;
    lbHasta: TLabel;
    Label1: TLabel;
    lbImporte: TLabel;
    Label2: TLabel;
    lbOBSERVACION: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edDESDE: TEdit;
    edHASTA: TEdit;
    edDIAS: TEdit;
    edIMPORTE_BASE: TEdit;
    edIMPORTE: TEdit;
    edOBSERVACIONES: TEdit;
    edCHEQUE_A_NOMBRE: TEdit;
    EdTipo: TEdit;
    EdCalculo: TEdit;
    Splitter1: TSplitter;
    ToolButton1: TToolButton;
    sdqBusquedaEM_ID: TFloatField;
    sdqBusquedaEX_IDTRABAJADOR: TFloatField;
    tbDatosPago: TToolButton;
    sduConsulta: TSDUpdateSQL;
    fraEmpresa: TfraEmpresa;
    Label11: TLabel;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    sbtnBuscar: TSpeedButton;
    Label18: TLabel;
    blSinFecha: TLabel;
    edSinFecha: TDateEdit;
    edSinDiagnostico: TEdit;
    Label19: TLabel;
    edJuicio: TEdit;
    Label35: TLabel;
    edEstadoSin: TEdit;
    Label20: TLabel;
    sdqBusquedaJUICIO: TStringField;
    sdqBusquedaESTADO: TStringField;
    sdqBusquedaCAUSAFIN: TStringField;
    edCausaFin: TEdit;
    Label21: TLabel;
    mnuImprimirCaratula: TMenuItem;
    tbObservaciones: TToolButton;
    sdqBusquedaEX_OBSERVMORTALES: TStringField;
    gbEventos: TGroupBox;
    rbEstadoTodos: TRadioButton;
    rbEstadoActivos: TRadioButton;
    GroupBox8: TGroupBox;
    rbAntigTodos: TRadioButton;
    rbAntigUltimo: TRadioButton;
    mnuViajar: TPopupMenu;
    mnuBeneficiarios: TMenuItem;
    mnuDatosEconomicos: TMenuItem;
    sdqBusquedaEX_ID: TFloatField;
    edFormaPago: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    edEnvioFondos: TEdit;
    Label25: TLabel;
    edRecibosa: TEdit;
    mnGenIntILPILT: TMenuItem;
    ScrollBox1: TScrollBox;
    fpObservaciones: TFormPanel;
    GroupBox2: TGroupBox;
    edObserv: TMemo;
    btnCancelarObs: TBitBtn;
    btnAceptarObs: TBitBtn;
    fpEnvioFondos: TFormPanel;
    gbEnvioFondos: TGroupBox;
    Label83: TLabel;
    rbBancoFondos: TRadioButton;
    rbDelegacionFondos: TRadioButton;
    rbCentralFondos: TRadioButton;
    fraDelegacionFondos: TfraDelegacion;
    fraBancoFondos: TfraCodigoDescripcion;
    fraSucursalFondos: TfraCodigoDescripcion;
    rbNingunoFondos: TRadioButton;
    btnCancelarFondos: TBitBtn;
    btnAceptarFondos: TBitBtn;
    FPModifImporte: TFormPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Bevel2: TBevel;
    EdMotCancel: TMemo;
    EdNewImporte: TCurrencyEdit;
    btnCancelarMod: TBitBtn;
    btnAceptarMod: TBitBtn;
    FPnConfirmaResult: TFormPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    Label84: TLabel;
    Label85: TLabel;
    Label92: TLabel;
    Label22: TLabel;
    LstLiquidaciones: TListView;
    EdDesCheq: TEdit;
    EdObs: TMemo;
    fraMetodoPago: TfraCtbTablas;
    edEnvio: TEdit;
    btnEnvio: TBitBtn;
    edRecibos: TMemo;
    btnAceptarConf: TBitBtn;
    fraDelegacionLiq: TfraDelegacion;
    btnCuentas: TBitBtn;
    edBeneficiario: TEdit;
    FPnLiquidac: TFormPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CmbFDesde: TDateComboBox;
    CmbFHasta: TDateComboBox;
    TxtDias: TEdit;
    TxtMontoLiq: TEdit;
    TxtMontoPendiente: TEdit;
    GroupBox1: TGroupBox;
    OptIndemnizacion: TRadioButton;
    OptAnticipo: TRadioButton;
    OptPagoUnico: TRadioButton;
    Tabs: TTabControl;
    LstGrupoFam: TListView;
    btnAceptarLiq: TBitBtn;
    btnCancelarLiq: TBitBtn;
    fraBanco: TfraCodigoDescripcion;
    Label77: TLabel;
    mnGenCompDanios: TMenuItem;
    MenuDatosEconomicos: TPopupMenu;
    mnuMostrarReserva: TMenuItem;
    mnuDatosPago: TMenuItem;
    Label26: TLabel;
    EdNewPA: TCurrencyEdit;
    Label27: TLabel;
    EdNewCD: TCurrencyEdit;
    Label28: TLabel;
    edNewTotal: TCurrencyEdit;
    tbGuardarReliq: TBitBtn;
    lModifNoAutorizada: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure FSFormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure OptPagoUnicoClick(Sender: TObject);
    procedure OptAnticipoClick(Sender: TObject);
    procedure OptIndemnizacionClick(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure TabsChange(Sender: TObject);
    procedure btnAceptarLiqClick(Sender: TObject);
    function GetDireccionCD: integer;
    procedure FPnLiquidacShow(Sender: TObject);
    procedure EdDesCheqChange(Sender: TObject);
    procedure EdObsChange(Sender: TObject);
    procedure LstLiquidacionesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure btnAceptarConfClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure CmbFDesdeExit(Sender: TObject);
    procedure CmbFHastaExit(Sender: TObject);
    procedure FPnConfirmaResultShow(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure memDatosAfterScroll(DataSet: TDataSet);
    procedure fraDelegacionLiqExit(Sender: TObject);
    procedure mnuImprimirGrillaClick(Sender: TObject);
    procedure mnuReimprimirLiquidacionClick(Sender: TObject);
    procedure EditarImporte1Click(Sender: TObject);
    procedure btnAceptarModClick(Sender: TObject);
    procedure tbBeneficiariosClick(Sender: TObject);
    procedure GridColEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbCargarSeguroRetiroClick(Sender: TObject);
    procedure memDatosAfterOpen(DataSet: TDataSet);
    procedure mnuSolicituddeCotizacionClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure fraTrabajadorSINedSiniestroSelect(Sender: TObject);
//    procedure tbDatosPagoClick(Sender: TObject);
    procedure OnMetodoPagoChange(Sender: TObject);
    procedure rbNacionClick(Sender: TObject);
    procedure rbProvClick(Sender: TObject);
    procedure btnEnvioClick(Sender: TObject);
    procedure fraBancoFondosOnChange(Sender: TObject);
    procedure rbNingunoFondosClick(Sender: TObject);
    procedure rbBancoFondosClick(Sender: TObject);
    procedure rbDelegacionFondosClick(Sender: TObject);
    procedure rbCentralFondosClick(Sender: TObject);
    procedure btnAceptarFondosClick(Sender: TObject);
    procedure mnuImprimirCaratulaClick(Sender: TObject);
    procedure btnCuentasClick(Sender: TObject);
    procedure tbObservacionesClick(Sender: TObject);
    procedure fpObservacionesBeforeShow(Sender: TObject);
    procedure mnuDatosEconomicosClick(Sender: TObject);
    procedure mnuBeneficiariosClick(Sender: TObject);
    procedure mnGenIntILPILTClick(Sender: TObject);
    procedure fraBancoOnChange(Sender: TObject);
    procedure mnGenCompDaniosClick(Sender: TObject);
    procedure mnuMostrarReservaClick(Sender: TObject);
    procedure mnuDatosPagoClick(Sender: TObject);
    procedure tbDatosPagoClick(Sender: TObject);
    procedure mnuViajarPopup(Sender: TObject);
    procedure GenerarLiqManual(Concepto: string; var iNumLiq: integer; cMonto: currency = 0; dDesde: TDateTime = 0; dHasta: TDateTime = 0;
                               rTasaOriginal: real = 0; rTasaFinal: real = 0; sTipoInt: String = ''; sTipoTasaJus: String = '';
                               bConTrans: boolean = true);
    function getMontoCompensacionDanos(sCodBenef, sGrupoFliar: String; eImporteLiq: Extended = 0; eMontoPagoAdic: Extended = 0; bAutomatica: boolean = false; ePorc: Extended = 0): Extended;
    function DoValidarGeneraCompDanos(sAutomatica: string): boolean;
    function DoValidarGeneraPagoUnico(sCodBenef, sGrupoFliar: String): boolean;
    function getMontoPagoAdicional(bAutomatica: boolean = false; iItem: integer = 0): Extended;
    function ValidarModifValores: boolean;
    procedure CalcTotalEditarImporte;
    procedure EdNewImporteExit(Sender: TObject);
    procedure EdNewPAExit(Sender: TObject);
    procedure EdNewCDExit(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbGuardarReliqClick(Sender: TObject);
  private
    Siniestro, Orden, Recaida, IdExpediente, iNLiq: Integer;
    Accion :TAccionLiq;
    function CargarPartes: Boolean;
    function GetNombreCiaSeguroRetiro(iSiniestro, iOrden: Integer): String;
    function GetConcepto(Tipo: String): String;
    function GetFormula(Tipo: String): String;
    function ValidarDatos: Boolean;
    function GetTipoFondos: String;
    function GetCodigoFondos: Integer;

    procedure GetRepLegal(iSiniestro, iOrden, iRecaida, iGrupoFam: Integer;
                          var sRepLegal, sBenef: String; var iCodigo: Integer);
    procedure SetMontoLiqidado;
    procedure LLenarGrupoFamiliar (Liquidados:Boolean; FDesde, FHasta: TDateTime);
    procedure ImprimirSolicitudCotizacionRentaVit(iSiniestro, iOrden, iRecaida, iNLiq: Integer);
    procedure DoLimpiarAbajo;
    procedure DoCargarFinancials;
    procedure SetEnvioFondos;
    procedure SetChequeANombre;
    procedure DoHabilitarFondos;
    procedure GenerarLiquidacion_CompPorDaniosMortal;                  // por plan Compensacion por danios
    function GetSumaLiqAnt(sCodGrupoFliar, sCodBenef: string; sFechaDesde: string = ''; sFechaHasta: string = ''): Currency;      // TK 50082
    function Es_PagoJudicial: boolean;      // Por Plan de Pagos Judiciales
    function Get_DecisionLegales: string;   // Por Plan de Pagos Judiciales
    procedure Do_CargarCamposDeLegales;     // Por Plan de Pagos Judiciales
    procedure DoCargarCampos_Legales(sdqQuery: TSDQuery);    // Por Plan de Pagos Judiciales
    procedure DoDeshabilitarCampos_Legales;                  // Por Plan de Pagos Judiciales
    procedure DoHabilitarMostrarReserva(bHabilitar: Boolean);   // TK 53237
    function HayRegistroActivo :Boolean;
    procedure DoModifLiqMortales;                      // Plan Reliquidaciones Automáticas
    function LiqPoseeChequeGenerado_Mortales: Boolean;
    function LiqExisteEnCircuitoOP_Mortales: Boolean;
    procedure Do_CompletarCamposReliquidacion;
    function IsModifNoAutorizada: boolean;
  public
  end;


const
  cSqlWhereBenef = ' WHERE a.le_siniestro = :sini ' +
                     ' AND a.le_orden = :orden ' +
                     ' AND a.le_recaida = :reca ' +
                     ' AND a.le_tipoliqui = ''I'' ' +  // ILP
                     ' AND NVL(a.le_estado,'' '') NOT IN (''A'',''X'') ' +
                     ' AND eb_siniestro = bl_siniestro ' +
                     ' AND eb_orden = bl_orden ' +
                     ' AND eb_recaida = bl_recaida ' +
                     ' and le_conpago = cp_conpago ' +
                     ' AND bl_beneficiario = eb_codigo ' +
                     ' AND bl_numliq = a.le_numliqui ' +
                     ' AND eb_siniestro = a.le_siniestro ' +
                     ' AND eb_orden = a.le_orden ' +
                     ' AND eb_recaida = a.le_recaida ' +
                     ' AND eb_codigo = :codBenef ' +
                     ' AND eb_grupofamiliar = :nroGrupoFliar ' +
                     ' AND cp_permite_compdanios_mortal = ''S'' ' +
                     ' AND EXISTS ( SELECT 1 ' +
                                    ' FROM art.sle_liquiempsin b, art.scp_conpago c ' +
                                   ' WHERE b.le_siniestro = a.le_siniestro ' +
                                     ' AND b.le_orden = a.le_orden ' +
                                     ' AND b.le_recaida = a.le_recaida ' +
                                     ' AND b.le_conpago = c.cp_conpago ' +
                                     ' AND c.cp_permite_compdanios_mortal = ''S'' ' +
                                     ' AND NVL(b.le_estado, '' '') NOT IN(''A'', ''X'') ' +
                                     ' AND EXISTS ( SELECT 1 ' +
                                                    ' FROM art.sle_liquiempsin d, art.scp_conpago e ' +
                                                   ' WHERE d.le_siniestro = a.le_siniestro ' +
                                                     ' AND d.le_orden = a.le_orden ' +
                                                     ' AND d.le_recaida = a.le_recaida ' +
                                                     ' AND d.le_conpago = e.cp_conpago ' +
                                                     ' AND e.cp_permite_compdanios_mortal = ''S'' ' +
                                                     ' AND NVL(d.le_estado, '' '') NOT IN(''A'', ''X'') ' +
                                                     ' AND e.cp_conpago <> c.cp_conpago)) ';

var
  frmLiqBeneficiarios: TfrmLiqBeneficiarios;
  STipo, sReplegal: String;
  bCanContinue: Boolean; NroLiquidacion: Integer;

implementation

uses
  AnsiSql, unfraPrestador, unDmPrincipal, General, CustomDlgs, unRPTPagoAdic,
  UnBeneficiarios, unDmFinancials, unrptliq53, unrptliq53b, unrptliq8, unrptliq8b,
  unrptliq8Rep, unrptliq8repb, sqlFuncs, unArt, unrptSolicitudCotizacionRentaVit,
  unRptLiqReciboPagoUnico, unRptAnticipoRentaVit, unCompaniaSeguroRetiro,
  unCancelarLiquidacion, unDlgBusSiniestro, unSesion, unPrincipal, VCLExtra,
  unRptCaratulaMortales, unManCCP_CUENTAPAGO, DateTimeFuncs, unDinerarias,
  unLiqIncapacidades, unGeneracionIntereses, unDireccionCDO, unTercerizadoras,
  unCustomPrincipal;

{$R *.DFM}

procedure TfrmLiqBeneficiarios.FSFormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  fraTrabajadorSIN.MostrarRelaLaboral := True;
  fraTrabajadorSIN.SinEstablecimiento := True;
  fraTrabajadorSIN.SoloSiniestrados   := True;
  fraEmpresa.ShowBajas                := True;
  fraMetodoPago.Clave                 := 'COBRO';
  fraMetodoPago.ShowBajas             := False;
  fraMetodoPago.OnChange              := OnMetodoPagoChange;
  Optpagounico.Checked                := False;
  OptAnticipo.checked                 := False;
  OptIndemnizacion.checked            := False;
  fraDelegacionLiq.OnLine             := False;
  fraDelegacionFondos.OnLine          := False;
  lModifNoAutorizada.Visible          := False;

  TxtDias.Clear;

  with fraBancoFondos do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraFields    := ', BA_TIENESUCURSALES ';
    if not(Seguridad.Claves.IsActive('VerTodosBancos')) then
      ExtraCondition := 'AND BA_DATANET IN (''S'', ''s'')';
    OnChange       := fraBancoFondosOnChange;
  end;

  with fraSucursalFondos do
  begin
    TableName      := 'ZSB_SUCURSALBANCO';
    FieldID        := 'SB_ID';
    FieldCodigo    := 'SB_CODIGO';
    FieldDesc      := 'SB_NOMBRE';
    FieldBaja      := 'SB_FECHABAJA';
    ExtraCondition := ' AND 1 = 2 ';
  end;

  with fraBanco do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'') OR (ba_pagoelectronico = ''S'')) ';
    OnChange       := fraBancoOnChange;
  end;

end;

procedure TfrmLiqBeneficiarios.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT ex_cuit, ex_cuil, le_siniestro, le_orden, le_recaida, le_numliqui nro, ' +
                ' art.liq.get_estadoliquidacionilp(le_tipoliqui, le_estado) estado, ' +
                ' le_conpago, a.cp_denpago concepto, le_fechades desde, le_fechahas hasta, ' +
                ' le_diasaplica dias, le_imporperi importe, le_fproceso f_proc, le_usualta u_proc, ' +
                ' le_femision f_impre, le_faprobado f_aprob, le_aprobado u_aprob, ' +
                ' motivo.tb_descripcion motivo, le_ibasediaria importe_base, ' +
                ' ''NAC.: '' || tj_fnacimiento || ''  AFJP: '' || cb_afjp tipo, ' +
                ' le_formula calculo, le_comentario observaciones, le_chequenombre cheque_a_nombre, ' +
                ' le_estado, le_espagounico unico, TO_NUMBER(NULL) ordennro, TO_DATE(NULL) ordenfecha, ' +
                ' TO_NUMBER(NULL) chequenro, TO_DATE(NULL) chequefecha, el_nombre AS le_delegacion, ' +
                ' le_delegacion c_deleg, le_tipoliqui, le_tipobeneficiario, le_motmodi_importe, ' +
                ' pago.tb_descripcion formapago, ba_nombrecorto banco, ' +
                ' le_enviofondos, le_recibos, ex_id, le_numintereses, LE_NUMLIQUI_COMPDANIOS, ' +

                ' LTRIM(TO_CHAR(((SELECT NVL(SUM(rm_res_art), 0) ' +
                                  ' FROM actuarial.urm_reservamortal ' +
                                 ' WHERE rm_siniestro = ex_siniestro ' +
                                   ' AND rm_orden = ex_orden ' +
                                   ' AND rm_periodo = (SELECT MAX(b.rm_periodo) ' +
                                                       ' FROM actuarial.urm_reservamortal b))), ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''''')) RESERVAMORTAL, ' +  // TK 53237
                ' le_subtotal, le_montocompdanios, le_montopagoadic, le_montootrospagos, b.cp_denpago conceptootrospagos, le_id, le_idchequeemitido idchequeemitido, ' +
                ' le_idexpediente ' +

           ' FROM art.ctb_tablas motivo, art.sex_expedientes, ctj_trabajador, ' +
                ' art.secb_cbaseexpsin, art.sle_liquiempsin, art.del_delegacion, ' +
                ' art.scp_conpago a, art.ctb_tablas pago, zba_banco, scp_conpago b ' +
          ' WHERE le_siniestro = :nSINIESTRO ' +
            ' AND le_orden =  :nORDEN ' +
            ' AND le_recaida = :nRECAIDA ' +
            ' AND le_conpago = a.cp_conpago ' +
            ' AND le_siniestro = ex_siniestro ' +
            ' AND le_delegacion = el_id ' +
            ' AND le_orden = ex_orden ' +
            ' AND le_recaida = ex_recaida ' +
            ' AND motivo.tb_clave(+) = ''MCANC'' ' +
            ' AND motivo.tb_codigo(+) = le_mcancelacion ' +
            ' AND pago.tb_clave(+) = ''COBRO'' ' +
            ' AND pago.tb_codigo(+) = le_metodopago ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND le_siniestro = cb_siniestro(+) ' +
            ' AND le_orden = cb_orden(+) ' +
            ' AND le_idbanco = ba_id(+) ' +
            ' AND (tj_id = '''' OR '''' IS NULL) ' +
            ' AND (ex_cuit = '''' OR '''' IS NULL) ' +
            ' AND le_conceptootrospagos = b.cp_conpago(+) ';

  if rbEstadoActivos.Checked then
    sSql := sSql + ' AND NVL(le_estado, '' '') <> ''A'' ';
  if rbAntigUltimo.Checked then
    sSql := sSql + ' AND le_fproceso > art.actualdate - 365 ';

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  with sdqConsulta do
  try
    Close;
    SQL.Text                            := sSql;
    ParamByName('nsiniestro').AsInteger := Siniestro;
    ParamByName('norden').AsInteger     := Orden;
    ParamByName('nrecaida').AsInteger   := Recaida;
    Open;
    memDatos.Close;
    memDatos.Open;
    First;
    memDatos.LoadFromDataSet(sdqConsulta, 0, lmAppend);
    if not IsEmpty then
    begin
      tbeliminar.Enabled := Seguridad.Activar(tbEliminar);
      tbImprimir.Enabled := Seguridad.Activar(tbImprimir);
      tbExportar.Enabled := Seguridad.Activar(tbExportar);
    end;
  finally
    Close;
  end
end;

procedure TfrmLiqBeneficiarios.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                 var Background: TColor; Highlight: Boolean);
begin
  if (memDatos.Active and not memDatos.IsEmpty) and not Highlight then
  begin
    if memDatos.FieldByName('LE_TIPOLIQUI').asString = 'W' then
      AFont.Color := clGreen
    else begin
      if memDatos.FieldByName('LE_ESTADO').asString = 'A' then
        AFont.Color := clRed
      else if memDatos.FieldByName('LE_ESTADO').asString = 'X' then
        AFont.Color := clSilver
      else if memDatos.FieldByName('LE_ESTADO').asString = 'E' then
        AFont.Color := clBlue
    end;

  end;
end;


procedure TfrmLiqBeneficiarios.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmLiqBeneficiarios.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
  var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if (memdatos.FieldByName('ESTADO').AsString = 'X') or
     (memdatos.FieldByName('ESTADO').AsString = 'A') then
    AFont.Color := ClSilver
  else
    AFont.Color := ClBlack;
end;

procedure TfrmLiqBeneficiarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  fraTrabajadorSIN.Clear;
  edSinFecha.Clear;
  edJuicio.Clear;
  edJuicio.Hint := '';
  edEstadoSin.Clear;
  edCausaFin.Clear;
  edSinDiagnostico.Clear;
  rbAntigUltimo.Checked   := True;
  rbEstadoActivos.Checked := True;
  LockControls([fraEmpresa, fraTrabajadorSIN], False);
  DoLimpiarAbajo;
  if fraTrabajadorSIN.edSiniestro.CanFocus then
    fraTrabajadorSIN.edSiniestro.SetFocus;
  DoHabilitarMostrarReserva(False);  // TK 53237
end;

procedure TfrmLiqBeneficiarios.sbtnBuscarClick(Sender: TObject);
var
  iOldIdSiniestro, iNewIdSiniestro: integer;
begin
  ShortCutControl.Enabled := False;
  try
    iOldIdSiniestro := fraTrabajadorSIN.IdSiniestro;
    iNewIdSiniestro := GetIdSiniestro(fraEmpresa.Value, fraTrabajadorSIN.Value,
                                      fraTrabajadorSIN.IdSiniestro, edSinFecha.Date, True);
    fraTrabajadorSIN.IdSiniestro := iNewIdSiniestro;
    if (fraTrabajadorSIN.IdSiniestro <> ART_EMPTY_ID) and
       (iOldIdSiniestro <> fraTrabajadorSIN.IdSiniestro) then
      CargarPartes;
  finally
    ShortCutControl.Enabled := True;
  end;
end;

function TfrmLiqBeneficiarios.CargarPartes: Boolean;
var
  sMensaje :String;
begin
   sMensaje          := '';
   Result            := True;
   DoLimpiarAbajo;

   //---------------------------------------------------------------------------//
   with sdqBusqueda do
   begin
     Close;
     ParamByName('pSiniestro').AsInteger := fraTrabajadorSIN.edSiniestro.Siniestro;
     ParamByName('pOrden').AsInteger     := fraTrabajadorSIN.edSiniestro.Orden;
     ParamByName('pRecaida').AsInteger   := fraTrabajadorSIN.edSiniestro.Recaida;
     Open;
   end;
   //---------------------------------------------------------------------------//
   if sdqBusqueda.IsEmpty then
   begin
     tbLimpiarClick(Nil);
     Verificar(True, fraTrabajadorSIN.edSiniestro, 'No existe el siniestro buscado. Verifique los datos ingresados.');
   end
   else if (sdqBusquedaEX_CAUSAFIN.AsString  = '99') or (sdqBusquedaEX_CAUSAFIN.AsString  = '95') then
   begin
     tbLimpiarClick(Nil);
     Verificar(True, fraTrabajadorSIN.edSiniestro, 'El siniestro seleccionado ha sido cerrado por error de carga');
   end
   else if sdqBusqueda.FieldByName('ex_gravedad').AsString <> '5' then
   begin
     tbLimpiarClick(Nil);
     Verificar(True, fraTrabajadorSIN.edSiniestro, 'El siniestro seleccionado no es mortal');
   end
   else if Seguridad.Claves.IsActive('VerSoloJuicios') and
           not(SiniTieneJuicios(fraTrabajadorSIN.edSiniestro.Siniestro,
                                fraTrabajadorSIN.edSiniestro.Orden,
                                fraTrabajadorSIN.edSiniestro.Recaida)) then
   begin
     tbLimpiarClick(Nil);
     Verificar(True, fraTrabajadorSIN.edSiniestro, 'El siniestro seleccionado no posee juicios');
   end;

   Siniestro            := fraTrabajadorSIN.edSiniestro.Siniestro;
   Orden                := fraTrabajadorSIN.edSiniestro.Orden;
   Recaida              := fraTrabajadorSIN.edSiniestro.Recaida;
   IdExpediente         := Get_IdExpediente(Siniestro, Orden, Recaida);

   tbNuevo.Enabled      := Seguridad.Activar(tbNuevo);
   tbModificar.Enabled  := Seguridad.Activar(tbModificar);
   tbEliminar.Enabled   := Seguridad.Activar(tbEliminar);
   tbImprimir.Enabled   := Seguridad.Activar(tbImprimir);
   tbExportar.Enabled   := Seguridad.Activar(tbExportar);

   //------------------------------------------------------------------------//
  if fraEmpresa.Value <> sdqBusquedaEM_ID.AsInteger then
    fraEmpresa.Value := sdqBusquedaEM_ID.AsInteger;
   //------------------------------------------------------------------------//
  if fraTrabajadorSIN.IdTrabajador <> sdqBusquedaEX_IDTRABAJADOR.AsInteger then
    fraTrabajadorSIN.Value := sdqBusquedaEX_IDTRABAJADOR.AsInteger;
   //------------------------------------------------------------------------//
   edSinFecha.Date        := sdqBusquedaEX_FECHAACCIDENTE.AsDateTime;
   edEstadoSin.Text       := sdqBusquedaESTADO.AsString;
   edCausaFin.Text        := sdqBusquedaCAUSAFIN.AsString;
   edSinDiagnostico.Text  := sdqBusquedaEX_DIAGNOSTICO.AsString;
   edJUICIO.Text          := sdqBusquedaJUICIO.AsString;
   edJUICIO.Hint          := sdqBusquedaJUICIO.AsString;

   //------------------------------------------------------------------------//
   LockControls([fraEmpresa, fraTrabajadorSIN], not sdqConsulta.IsEmpty);
   if not sdqConsulta.IsEmpty then
   begin
     sdqConsultaParent.Close;
     sdqConsultaParent.ParamByName('nSINIESTRO').AsInteger := Siniestro;
     sdqConsultaParent.ParamByName('nORDEN').AsInteger     := Orden;
     sdqConsultaParent.ParamByName('nRECAIDA').AsInteger   := Recaida;
     sdqConsultaParent.ParamByName('nNROLIQ').AsInteger    := sdqConsulta.FieldByName('NRO').AsInteger;
     sdqConsultaParent.Open;
   end;
   tbRefrescarClick(Nil);
end;

procedure TfrmLiqBeneficiarios.tbNuevoClick(Sender: TObject);
var
  sErr, sDecisionLegales: String;
  iCnt:Integer;
  bEsSuperUsuario, bValida: Boolean;
begin
   Accion := l_Alta;

   if Es_PagoJudicial then     // Por Plan de Pagos Judiciales
   begin
     sDecisionLegales := Get_DecisionLegales;
     Verificar((sDecisionLegales = ''), nil, 'No se puede liquidar ya que corresponde a un Pago Judicial y falta la decisión de Legales.');
   end;

   sErr := ValorSqlEx('SELECT art.liq.get_errorvalidacioninicial(:Sin, :Ord, :Reca) ' +
                       ' FROM dual', [Siniestro, Orden, Recaida]);
   if sErr = '' then
     bValida := True
   else begin
     bEsSuperUsuario := Seguridad.Claves.IsActive('SUPER-USUARIO');

     if bEsSuperUsuario then
       bValida := (Msgbox(sErr + CRLF + '¿Continúa de todos modos?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2,'Error!') = ID_YES)
     else begin
       Msgbox(sErr, 0, 'Error!');
       bValida := False;
     end;
   end;

   if bValida then
   begin
     if ValorSqlIntegerEx('SELECT art.liq.is_trabajadordeclarado(:Sin, :Ord, :Reca) ' +
                           ' FROM dual', [Siniestro, Orden, Recaida]) = 0 then
        Msgbox('Trabajador no declarado - Pagos a recuperar del empleador',0,'Aviso');
     if ValorSqlIntegerEx('SELECT art.liq.is_afjpreparto(:Sin, :Ord) ' +
                                     ' FROM DUAL', [Siniestro, Orden]) <> 1 then
       OptAnticipo.Enabled := False
     else
       OptAnticipo.Enabled := True;

     optpagounico.Checked     := False;
     optAnticipo.Checked      := False;
     optIndemnizacion.Checked := False;
     Tabs.TabIndex := 0;
     cmbfdesde.Clear;
     cmbfhasta.Clear;
     TxtDias.Clear;
     TxtmontoLiq.Clear;
     TxtMontoPendiente.Clear;
     sdqBusqueda.Close;
     LstGrupoFam.Items.Add; //Si no hago el add el count da cero :-) ???
     LstGrupoFam.Items.Clear;
     for iCnt := 0 to LstGrupoFam.Items.Count - 1 do
       LstGrupoFam.Items.Item [iCnt].Delete;
     FPnLiquidac.Showmodal;
   end;
end;

procedure TfrmLiqBeneficiarios.SetMontoLiqidado;
var
  sSql: String;
  dLiquidado, dPendiente: Double;
begin
  sSql        := 'SELECT art.liq.get_montoliqmortal(:Sin, :Ord, :Reca, :Tipo, :Desde, :Hasta)' +
                  ' FROM dual';
  dLiquidado  := ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, STipo,
                                           TDateTimeEx.Create(CmbFDesde.Date),
                                           TDateTimeEx.Create(CmbFHasta.Date)]);
  sSql        := 'SELECT art.liq.get_montomortalpagado(:Sin, :Ord, :Reca, :Tipo, :Desde, :Hasta)' +
                  ' FROM dual';
  dPendiente  := dLiquidado - ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, STipo,
                                                 TDateTimeEx.Create(CmbFDesde.Date),
                                                 TDateTimeEx.Create(CmbFHasta.Date)]);

  TxtMontoLiq.Text       := FloatToStr(dLiquidado);
  TxtMontoPendiente.Text := FloatToStr(dPendiente);
end;

procedure TfrmLiqBeneficiarios.LLenarGrupoFamiliar (Liquidados:Boolean; FDesde, FHasta: TDateTime);
var
  sSql: String;
  NewItem:TListitem;
begin
  if (optanticipo.Checked) and ((FDesde=0) or (FHasta=0)) then
    LstGrupoFam.Items.Clear
  else begin
    sSql := 'SELECT eb_codigo,eb_replegal,eb_grupofamiliar grupo, tb_descripcion parentezco, ' +
                  ' eb_replegal rl, eb_nombre nombre, eb_porcentaje porc, ' +
                  ' art.liq.get_liquianterior(eb_siniestro, eb_orden, eb_recaida, ' +
                                              sTipo + ', eb_codigo, ' + SqlValue(FDesde) + ',' + SqlValue(FHasta) + ') liq, ' +
                  ' FLOOR((actualdate - eb_fechanacimiento)/365) Edad, ' +
                  ' art.liq.get_dninombrebeneficiario(eb_siniestro, eb_orden, eb_recaida, eb_codigo) bene, ' +
                  ' eb_fechanacimiento ' +
             ' FROM seb_beneficiarios, ctb_tablas ' +
            ' WHERE eb_siniestro= ' + SqlInt(Siniestro) +
              ' AND eb_orden = ' + SqlInt(Orden) +
              ' AND eb_recaida = ' + SqlInt(Recaida) +
              ' AND eb_caracter = tb_codigo(+)' +
              ' AND tb_clave = ''PAREN''' +
              ' AND eb_porcentaje > 0 ' +
              ' AND eb_fechabaja IS NULL ' +
              ' AND NVL(eb_controversia, ''N'') = ''N'' ';

    sSql := sSql + ' AND ' + IIF(Liquidados, 'NOT', '') +
                        ' art.liq.get_liquianterior(eb_siniestro, eb_orden, eb_recaida, ' +
                                                    sTipo + ', eb_codigo, ' + SqlValue(FDesde) + ', ' + SqlValue(FHasta) + ') IS NULL ' +
                   ' ORDER BY eb_grupofamiliar, eb_codigo ';

    SDQGrupoFam.SQL.Text := SSql;
    SDQGrupoFam.Open;
    LstGrupoFam.Items.Clear;
    if not SDQGrupoFam.Eof then
    begin
      while not SDQGrupoFam.Eof do
      begin
         NewItem := LstGrupoFam.Items.Add;
         NewItem.Caption := SDQGrupoFam.fieldbyname('grupo').AsString;
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('parentezco').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('rl').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('nombre').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('porc').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('liq').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('edad').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('eb_codigo').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('bene').AsString);
         NewItem.SubItems.Add(SDQGrupoFam.fieldbyname('eb_fechanacimiento').AsString);
         if (SDQGrupoFam.fieldbyname('Liq').IsNull) or (SDQGrupoFam.fieldbyname('Porc').AsFloat <= 0) then
           NewItem.MakeVisible(True);
         if SDQGrupoFam.fieldbyname('eb_replegal').asstring = 'S' then
           sReplegal := SDQGrupoFam.fieldbyname('nombre').asstring;
         SDQGrupoFam.Next;
      end;
    end;
  end;
end;

procedure TfrmLiqBeneficiarios.OptPagoUnicoClick(Sender: TObject);
begin
   STipo := '1';
   cmbfdesde.Clear;
   cmbfhasta.Clear;
   cmbfdesde.Enabled := False;
   cmbfhasta.Enabled := False;
   txtdias.text      := '0';
   SetMontoLiqidado;
   LLenarGrupoFamiliar (Tabs.TabIndex = 1, CmbFDesde.Date, CmbFHasta.Date);
   if txtmontoliq.text='0' then
   begin
     MsgBox('Dada la fecha del siniestro, no corresponde pago único',0,'');
     bCanContinue         := False;
     lstgrupofam.Enabled  := False;
   end
   else begin
     if TxtMontoPendiente.text <= '0' then
     begin
       MsgBox('El concepto de pago se liquido en su totalidad',0,'Imposible continuar');
       bCanContinue        := False;
       lstgrupofam.Enabled := False;
     end
     else begin
       bCanContinue        := True;
       lstgrupofam.Enabled := True;
     end;
   end;
end;

procedure TfrmLiqBeneficiarios.OptAnticipoClick(Sender: TObject);
begin
  STipo := '2';
  LstGrupoFam.Items.Clear;
  cmbfdesde.Clear;
  cmbfhasta.Clear;
  cmbfdesde.Enabled := True;
  cmbfhasta.Enabled := True;
end;

procedure TfrmLiqBeneficiarios.OptIndemnizacionClick(Sender: TObject);
var
  sMensaje, sSql: String;
  bAntiPagado, bEspecial: Boolean;
begin
  STipo       := '3';
  sSql        := 'SELECT liq.is_seguroretiro(:sin, :ord) ' +
                  ' FROM dual';
  bEspecial   := Seguridad.Claves.IsActive('IndemnizacionSinAnticipo');

  if ValorSqlEx(sSql, [memDatos.FieldByName('le_siniestro').AsInteger,
                       memDatos.FieldByName('le_orden').AsInteger]) <> '1' then
    sMensaje := 'No tiene seleccionada la compañía de seguro de retiro'
  else begin
    sSql        := 'SELECT art.dinerarias.is_conceptomensualpagado(:sin, :ord, :reca, 53) ' +
                    ' FROM dual';
    bAntiPagado := (ValorSqlEx(sSql, [memDatos.FieldByName('le_siniestro').AsInteger,
                                      memDatos.FieldByName('le_orden').AsInteger,
                                      memDatos.FieldByName('le_recaida').AsInteger]) = 'S');

    if not(bAntiPagado) and (not(bEspecial) or
      (bEspecial and not(MsgAsk('Atención: aún no se ha liquidado el anticipo del periodo actual, ¿Desea continuar?')))) then
      sMensaje := 'No se puede generar la indemnización ya que todavía no se liquidó el anticipo del periodo actual';
  end;

  if (sMensaje <> '') then
  begin
    if not bEspecial then
      MsgBox(sMensaje, MB_ICONEXCLAMATION);
    bCanContinue        := False;
    LstGrupoFam.Enabled := False;
  end
  else begin
    cmbfdesde.Clear;
    cmbfhasta.Clear;
    bCanContinue        := True;
    cmbfdesde.Enabled   := False;
    cmbfhasta.Enabled   := False;
    TxtDias.Text        := '0';
    SetMontoLiqidado;
    LLenarGrupoFamiliar (Tabs.TabIndex = 1, CmbFDesde.Date, CmbFHasta.Date);
    LstGrupoFam.Enabled := True;
  end;
end;

procedure TfrmLiqBeneficiarios.SeleccionarTodos1Click(Sender: TObject);
var
  iCnt :Integer;
begin
  inherited;
  for iCnt := 0 to Lstgrupofam.Items.Count -1 do
    Lstgrupofam.Items.Item[iCnt].Checked := True;
end;

procedure TfrmLiqBeneficiarios.DeseleccionarTodos1Click(Sender: TObject);
var
  iCnt :Integer;
begin
  inherited;
  for iCnt := 0 to Lstgrupofam.Items.Count -1 do
    Lstgrupofam.Items.Item[iCnt].Checked := False;
end;

procedure TfrmLiqBeneficiarios.TabsChange(Sender: TObject);
begin
  if (not optpagounico.Checked) and (not OptIndemnizacion.Checked) and (not OptAnticipo.Checked) then
     MsgBox('Debe seleccionar una de las opciones de liquidación')
  else begin
    if Tabs.TabIndex = 1 then
      LLenarGrupoFamiliar (True, CmbFDesde.Date, CmbFHasta.Date)
    else
      LLenarGrupoFamiliar (False, CmbFDesde.Date, CmbFHasta.Date);
  end;
end;

procedure TfrmLiqBeneficiarios.btnAceptarLiqClick(Sender: TObject);
var
   iGFamiliar, iCnt, iCodigo :Integer;
   NewItem :TListitem;
   fAcumMonto,fAcumPorc,fPorc,fMonto :double;
   sConcepto, sFormula, sAcumBenef, sSql, sBeneficiario :String;
   bHayChecked, bIsReparto :Boolean;
begin
  sReplegal   := '*';
  bHayChecked := False;
  for iCnt := 0 to LstGrupoFam.Items.Count - 1 do
    if LstGrupoFam.Items[iCnt].Checked then
      bHayChecked := True;

  sConcepto := GetConcepto(STipo);
  sFormula  := GetFormula(STipo);

  if Is_BloqueoPagoSiniestro(Siniestro, Orden, Recaida, sConcepto) then
  begin
    MsgBox('La liquidación no se puede generar por sentencia judicial');
    bCanContinue := False;
  end;

  if (optanticipo.Checked and ((cmbfdesde.IsEmpty) or (cmbfhasta.IsEmpty))) and bCanContinue then
  begin
    MsgBox('Debe completar la fecha desde y la fecha hasta');
    bCanContinue := False;
  end;

  if bCanContinue and bHayChecked then
  begin
    if RoundNumber(StrToCurr(TxtMontoPendiente.Text), 0) > 0 then { by NWK, 12/03/03}
    begin
     bIsReparto := (ValorSqlIntegerEx('SELECT art.liq.is_afjpreparto(:Sin, :Ord) ' +
                                        'FROM dual', [Siniestro, Orden]) = 1);
     LstLiquidaciones.Refresh;
     {$IFDEF BYFEDE}NewItem:={$ENDIF}LstLiquidaciones.Items.Add; //Si no hago el add el count da cero :-) ???
     LstLiquidaciones.Items.Clear;
     fAcumPorc  := 0;
     fAcumMonto := 0;
     sAcumBenef := '';
     iGFamiliar := 0;
     for iCnt := 0 to LstGrupoFam.Items.Count - 1  do
     begin
       if LstGrupoFam.Items.Item [iCnt].Checked then
       begin
          if iGFamiliar = 0 then
            iGFamiliar := StrToInt(LstGrupoFam.Items.Item[iCnt].Caption)
          else begin
            if iGFamiliar <> StrToInt(LstGrupoFam.Items.Item[iCnt].Caption) then
            begin
              MsgBox('Ha seleccionado beneficiarios de distinto grupo familiar, por favor, realice una liquidacion para cada grupo',0,'Distintos Grupos');
              exit;
            end;
          end;

          sSql := 'SELECT art.liq.get_validadocumortales(:Sin, :Ord, :Reca, :Bene) ' +
                   ' FROM dual ';
          if (ValorSqlEx(sSql, [Siniestro, Orden, Recaida,
                                 StrToInt(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6])]) <> 'S') then
          begin
            MsgBox('Alguno de los beneficiarios seleccionados no ha presentado la documentación necesaria para la liquidación.',0,'Documentación');
            Exit;
          end;

          ssql := ' SELECT 1 FROM din.dcl_casosparaliquidar ' +
                  '  WHERE cl_idexpediente = :idexp AND cl_fechabaja IS NULL AND cl_docpendiente = ''S'' ' +
                  '    AND art.liq.get_validadocumortales(:Sin, :Ord, :Reca, :Bene, ''S'') = ''N'' ';
                 { '    AND cl_idestado = el_id ' +
                  '    AND ((el_pendienteliq = ''S'') OR ((el_codigo = ''LI'') AND (art.dinerarias.get_porcentajeliqmortal(cl_idexpediente) < 100))';}
          if ExisteSqlEx(sSql, [IdExpediente, Siniestro, Orden, Recaida,
                              StrToInt(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6])]) then
          begin
            MsgBox('Alguno de los beneficiarios seleccionados no ha presentado la documentación necesaria para la liquidación.',0,'Documentación');
            Exit;
          end;

          sSql := 'SELECT art.liq.get_validadirmortales(:Sin, :Ord, :Reca, :Bene) ' +
                   ' FROM dual ';
          if (ValorSqlEx(sSql, [Siniestro, Orden, Recaida,
                                 StrToInt(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6])]) <> 'S') then
          begin
            MsgBox('Alguno de los beneficiarios seleccionados no posee la dirección cargada.',0,'Dirección');
            Exit;
          end;

          fPorc := StrToFloat(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[3]);
       //   if Tabs.TabIndex = 1 then //Ya tiene liquidaciones anteriores    // comentado por TK 50082
       //      fMonto := StrToFloat(TxtMontoPendiente.Text)
       //   else //No tiene liquidaciones anteriores
             fMonto := StrToFloat(TxtMontoLiq.Text);
          if LstGrupoFam.Items.Item [iCnt].SubItems.Strings[5] <> '' then
          begin
            if StrToInt(LstGrupoFam.Items.Item [iCnt].SubItems.Strings[5]) >= 18 then
            begin
              NewItem := LstLiquidaciones.Items.Add;

              if (STipo = '3') and bIsReparto then
                NewItem.Caption := GetNombreCiaSeguroRetiro(Siniestro, Orden)
              else
                NewItem.Caption := LstGrupoFam.Items.Item[iCnt].SubItems.Strings[2];

              NewItem.SubItems.Add(FloatToStr( RoundNumber(fMonto * fPorc,2) - GetSumaLiqAnt(LstGrupoFam.Items.Item[iCnt].Caption, LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6], CmbFDesde.SqlText, CmbFHasta.SqlText) ));  // la resta es por el TK 50082
              NewItem.SubItems.Add(FloatToStr(fPorc));
              NewItem.SubItems.Add('');
              NewItem.SubItems.Add(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6]);
              NewItem.SubItems.Add('');
              NewItem.SubItems.Add('');
              NewItem.SubItems.Add('');
              NewItem.SubItems.Add(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[7]);
              NewItem.SubItems.Add(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6]);
              NewItem.SubItems.Add(LstGrupoFam.Items.Item[iCnt].Caption);
            end
            else begin
              if (sReplegal = '*') then
                GetRepLegal(Siniestro, Orden, Recaida, StrtoInt(LstGrupoFam.Items.Item[iCnt].Caption),
                            sRepLegal, sBeneficiario, iCodigo);
              if (sReplegal = '') then
              begin
                 MsgBox('Hay menores de edad en la selección pero, no existe un representante legal definido',0,'Imposible Liquidar');
                 Exit;
              end
              else begin
               //  fAcumMonto := fAcumMonto + RoundNumber(fMonto * fPorc,2);                      // Cod. Grupo fam.                             // Cod Benef.
                 fAcumMonto := fAcumMonto + RoundNumber(fMonto * fPorc,2) - GetSumaLiqAnt(LstGrupoFam.Items.Item[iCnt].Caption, LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6], CmbFDesde.SqlText, CmbFHasta.SqlText);   // la resta es por el TK 50082
                 fAcumPorc  := fAcumPorc + fPorc;
                 sAcumBenef := sAcumBenef + LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6] + '#'  + floattostr(fPorc) + '@';
              end;
            end;
          end
          else begin
            MsgBox('Es imposible determinar la edad de alguno de los miembros del grupo familiar, por favor revise los datos',0,'Imposible Liquidar');
            Exit;
          end;
       end;
     end;//Fin del FOR

     if (sReplegal <> '') and (sReplegal <> '*') then
     begin
       NewItem := LstLiquidaciones.Items.Add;

       if (STipo = '3') and bIsReparto then
         NewItem.Caption := GetNombreCiaSeguroRetiro(Siniestro, Orden)
       else
         NewItem.Caption := sReplegal;

       NewItem.SubItems.Add(FloatToStr(fAcumMonto));
       NewItem.SubItems.Add(FloatToStr(fAcumPorc));
       NewItem.SubItems.Add('');
       NewItem.SubItems.Add(sAcumBenef);
       NewItem.SubItems.Add('');
       NewItem.SubItems.Add('');
       NewItem.SubItems.Add('');
       NewItem.SubItems.Add(sBeneficiario);
       NewItem.SubItems.Add(IntToStr(iCodigo));
       NewItem.SubItems.Add(LstGrupoFam.Items.Item[0].Caption);
     end;

     iNLiq := ValorSqlEx('SELECT NVL(MAX(le_numliqui),0) + 1 ' +
                          ' FROM sle_liquiempsin ' +
                          'WHERE le_siniestro = :Sin' +
                           ' AND le_orden = :Ord ' +
                           ' AND le_recaida = :Reca', [Siniestro, Orden, Recaida]);

     with TfrmDireccionCDO.Create(nil) do
     try
       try
         BeginTrans;
         if (Mostrar(IdExpediente, iNLiq, 'M', oOtros, 0, GetDireccionCD) and (FPnConfirmaResult.ShowModal = mrOk)) then
         begin
           FPnLiquidac.ModalResult := MrOK;
           CommitTrans;
         end
         else
           Rollback;
       except
         on e: exception do
         begin
           ErrorMsg(E, 'Error al intentar dar de alta la liquidación.');
           Rollback;
         end;
       end;
     finally
       Free;
     end;

    end
    else
      MsgBox('El monto pendiente de pago es menor o igual a 0',0,'Imposible Liquidar');
  end
  else
    MsgBox('Hay datos inválidos que no permiten continuar con el proceso de liquidación, revíselos y reintente.',0,'Imposible Liquidar');
end;

function TfrmLiqBeneficiarios.GetDireccionCD: integer;
var iBenef, iCnt: integer;
begin
  iBenef := -1;
  for iCnt := 0 to LstGrupoFam.Items.Count - 1 do
  begin
    if LstGrupoFam.Items.Item [iCnt].Checked then
      if LstGrupoFam.Items.Item[iCnt].SubItems.Strings[1] = 'S' then  // rep. legal
        iBenef := iCnt
  end;

  if iBenef = -1 then
    for iCnt := 0 to LstGrupoFam.Items.Count - 1 do
    begin
      if LstGrupoFam.Items.Item [iCnt].Checked then
      begin
        if iBenef = -1 then
          iBenef := iCnt;
        if strtodate(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[8]) < strtodate(LstGrupoFam.Items.Item[iBenef].SubItems.Strings[8]) then
          ibenef := iCnt;
      end;
    end;

  GetDireccionCD := StrToInt(LstGrupoFam.Items.Item[iBenef].SubItems.Strings[6]);

end;

procedure TfrmLiqBeneficiarios.FPnLiquidacShow(Sender: TObject);
begin
  inherited;
  cmbfdesde.Clear;
  cmbfhasta.Clear;
  TxtDias.Clear;
  TxtMontoLiq.Clear;
  TxtMontoPendiente.clear;
end;

procedure TfrmLiqBeneficiarios.EdDesCheqChange(Sender: TObject);
begin
  if LstLiquidaciones.SelCount > 0 then
    LstLiquidaciones.Selected.Caption := EdDesCheq.Text;
end;

procedure TfrmLiqBeneficiarios.EdObsChange(Sender: TObject);
begin
  if LstLiquidaciones.SelCount > 0 then
    LstLiquidaciones.Selected.SubItems.Strings[2] := EdObs.Text;
end;

procedure TfrmLiqBeneficiarios.LstLiquidacionesSelectItem(Sender: TObject;
                                                          Item: TListItem; Selected: Boolean);
begin

   if (EdDesCheq.Text = '') then         // Por plan de pagos judiciales (los dos edits se blanquean en el OnShow, a no ser que se completen los campos de legales, entonces éste es el unico caso en que no sean nulos)
     EdDesCheq.Text := Item.Caption;
   if (EdObs.Text = '') then
     EdObs.Text     := Item.SubItems[2];

   fraDelegacionLiq.Codigo  := Item.SubItems[4];
   edBeneficiario.Text      := Item.SubItems[7];
   EdDesCheq.Enabled        := True;
   EdObs.Enabled            := True;
end;

procedure TfrmLiqBeneficiarios.btnAceptarConfClick(Sender: TObject);
var
  iCnt, iTipoImpresion, iGrupoFamiliar :Integer;
  sPorc, sNro, sGFam, sFormula, sFHasta, sFDesde, sUnico, sSQLI,
  sConcepto, sBase: String;
  Sql :TSql;
  bImprimeAhora, bRepLegal :Boolean;
  iMontoPagoAdic, iMontoCompDanos, sImporte: Extended;
begin

  iNLiq := ValorSqlEx('SELECT NVL(MAX(le_numliqui),0) ' +
                       ' FROM sle_liquiempsin ' +
                       'WHERE le_siniestro = :Sin' +
                        ' AND le_orden = :Ord ' +
                        ' AND le_recaida = :Reca', [Siniestro, Orden, Recaida]);

  sBase := ValorSqlEx('SELECT cb_ibasediaria ' +
                       ' FROM secb_cbaseexpsin ' +
                       'WHERE cb_siniestro = :Sin ' +
                        ' AND cb_orden = :Ord', [Siniestro, Orden]);

  sConcepto := GetConcepto(STipo);
  sFormula  := GetFormula(STipo);
  sUnico    := IIF(optPagoUnico.Checked, '1', '0');

  if sTipo = '2' then
  begin
    sFDesde := cmbFDesde.SqlText;
    sFHasta := cmbFHasta.SqlText;
  end
  else begin
    sFHasta := 'NULL';
    sFDesde := 'NULL';
  end;

  if ValidarDatos then
  begin
    iGrupoFamiliar := 0;
    for iCnt := 0 to LstGrupoFam.Items.Count - 1 do    { by NWK, 25/04/03. determino el grupo familiar seleccionado (es exactamente solo uno) }
    begin
      if LstGrupoFam.Items[iCnt].Checked then
      begin
        iGrupoFamiliar := StrToInt(LstGrupoFam.Items.Item[iCnt].Caption);
        Break;
      end;
    end;

    iTipoImpresion := SelectDlg('Seleccione los formularios a imprimir',
                                ['Solo Liquidación', 'Solo Recibo', 'Ambos'], 1);
    bImprimeAhora  := (iTipoImpresion <> -1);

    //for iCnt := 0 to LstLiquidaciones.Items.Count - 1 do
      //sImporte := sImporte + StrToFloat(LstLiquidaciones.Items.Item[iCnt].SubItems.Strings[0]);

    for iCnt := 0 to LstLiquidaciones.Items.Count - 1 do
    begin
      iMontoPagoAdic := 0;
      iMontoCompDanos := 0;
      sImporte := StrToFloat(LstLiquidaciones.Items.Item[iCnt].SubItems.Strings[0]);

      if (sImporte > 0) then            // TK 50082 equivale a "sImporte > 0"
      begin

        iNLiq    := iNLiq + 1;

        Sql := TSql.Create;
        Sql.TableName := 'SLE_LIQUIEMPSIN';
        Sql.Fields.Add('LE_SINIESTRO'   , Siniestro                 );
        Sql.Fields.Add('LE_ORDEN'       , Orden                     );
        Sql.Fields.Add('LE_RECAIDA'     , Recaida                   );
        Sql.Fields.Add('LE_NUMLIQUI'    , iNLiq                     );         // TK 35319
        Sql.Fields.Add('LE_FPROCESO'    , 'actualdate',false        );
        Sql.Fields.Add('LE_FSOLICITA'   , 'actualdate',false        );
        Sql.Fields.Add('LE_TIPOLIQUI'   , 'I'                       );
        Sql.Fields.Add('LE_ESTADO'      , 'C'                       );
        Sql.Fields.Add('LE_FECHADES'    , sFDesde,False             );
        Sql.Fields.Add('LE_FECHAHAS'    , sFHasta,False             );
        if bImprimeAhora then
          Sql.Fields.Add('LE_FEMISION'  , 'actualdate',false        );
        Sql.Fields.Add('LE_DIASAPLICA'  , sqlnumber(txtdias.Text)   );
        Sql.Fields.Add('LE_IBASEDIARIA' , sqlnumber('0' + sBase)    );
        Sql.Fields.Add('LE_DECLARAEMP'  , '0'                       );
        Sql.Fields.Add('LE_DIFERENCIA'  , '0'                       );
        Sql.Fields.Add('LE_SUBTOTAL'    , sqlnumber(sImporte)       );
        Sql.Fields.Add('LE_PAPOREMP'    , '0'                       );
        Sql.Fields.Add('LE_ICONEMP'     , '0'                       );
        Sql.Fields.Add('LE_PAPORTRA'    , '0'                       );
        Sql.Fields.Add('LE_ICONTRA'     , '0'                       );
        Sql.Fields.Add('LE_ASIGFAMILIAR', '0'                       );
        Sql.Fields.Add('LE_COMENTARIO'  , LstLiquidaciones.Items.Item[iCnt].SubItems.Strings[2]);
        Sql.Fields.Add('LE_CHEQUENOMBRE', LstLiquidaciones.Items.Item[iCnt].Caption);
        Sql.Fields.Add('LE_USUALTA'     , Sesion.UserID             );
        Sql.Fields.Add('LE_PLUSAMPO'    , '0'                       );
        Sql.Fields.Add('LE_CANTIDADAMPO', '0'                       );
        Sql.Fields.Add('LE_CONPAGO'     , sConcepto                 );
        Sql.Fields.Add('LE_FORMULA'     , sformula                  );
        Sql.Fields.Add('LE_PORCINCAPACIDAD', '0'                    );
        Sql.Fields.Add('LE_FVENCIMI'    , 'NULL',False              );
        Sql.Fields.Add('LE_ESPAGOUNICO' , sUnico                    );
        Sql.Fields.Add('LE_ESANTICIPOMOPRES', 'N'                   );
        Sql.Fields.Add('LE_PEJUBILA'    , '0'                       );
        Sql.Fields.Add('LE_PEINSSJP'    , '0'                       );
        Sql.Fields.Add('LE_PEFNEMPLEO'  , '0'                       );
        Sql.Fields.Add('LE_PESFAMILIAR' , '0'                       );
        Sql.Fields.Add('LE_PEANSSAL'    , '0'                       );
        Sql.Fields.Add('LE_PEOSOCIAL'   , '0'                       );
        Sql.Fields.Add('LE_PTJUBILA'    , '0'                       );
        Sql.Fields.Add('LE_PTINSSJP'    , '0'                       );
        Sql.Fields.Add('LE_PTANSSAL'    , '0'                       );
        Sql.Fields.Add('LE_PTOSOCIAL'   , '0'                       );
        Sql.Fields.Add('LE_DELEGACION'  , SqlNumber(LstLiquidaciones.Items.Item[iCnt].SubItems.Strings[4]));
        Sql.Fields.Add('LE_METODOPAGO'  , fraMetodoPago.Codigo      );
        Sql.Fields.Add('LE_ENVIOFONDOS' , edEnvio.Text              );
        Sql.Fields.Add('LE_IDBANCO'     , fraBanco.Value, True      );
        Sql.Fields.Add('LE_TIPOENVIOFONDOS', GetTipoFondos          );
        Sql.Fields.Add('LE_IDENVIOFONDOS', GetCodigoFondos          );
        Sql.Fields.Add('LE_RECIBOS'      , edRecibos.Text           );

        sGFam := LstLiquidaciones.Items.Item[iCnt].SubItems.Strings[3];
        Sql.Fields.Add('LE_TIPOBENEFICIARIO', String(IIF(pos('#',sGFam) = 0, 'B', 'R'))           );

        if DoValidarGeneraPagoUnico(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6], LstGrupoFam.Items.Item[iCnt].Caption) then
        begin
          if sUnico = '1' then               //Si es un pago único generado manualmente en forma individual
            sImporte := 0;

          iMontoPagoAdic := getMontoPagoAdicional(True, iCnt);
          Sql.Fields.Add('LE_MONTOPAGOADIC', iMontoPagoAdic, 2, True);
        end;

        if DoValidarGeneraCompDanos('S') then
        begin
          iMontoCompDanos := getMontoCompensacionDanos(LstGrupoFam.Items.Item[iCnt].SubItems.Strings[6], LstGrupoFam.Items.Item[iCnt].Caption, sImporte, iMontoPagoAdic, true,
                                                         StrToFloat(LstLiquidaciones.Items.Item[iCnt].SubItems.Strings[1]));
          Sql.Fields.Add('LE_MONTOCOMPDANIOS', iMontoCompDanos, 2, True);
          Sql.Fields.Add('le_numliqui_compdanios' , iNLiq);
        end;

        Sql.Fields.Add('LE_IMPILTP'     , sqlnumber(sImporte)       );
        Sql.Fields.Add('LE_IMPORPERI'   , sqlnumber(sImporte + iMontoPagoAdic + iMontoCompDanos));

        EjecutarSqlST(Sql.InsertSql);
        Sql.Free;


        if pos('#',sGFam) = 0 then
        begin
          bRepLegal := False;
          sSQLI     := 'INSERT INTO sbl_beneficiarioliquidacion ' +
                       '(bl_siniestro, bl_orden, bl_recaida, bl_numliq, bl_beneficiario, bl_porcentaje) VALUES (' +
                        SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
                        SqlInt(iNLiq) + ',' + SqlInt(LstLiquidaciones.Items.Item [iCnt].SubItems.Strings[3]) + ',' +
                        SqlNumber(LstLiquidaciones.Items.Item [iCnt].SubItems.Strings[1]) + ')';
          EjecutarSqlST(sSQLI);
        end
        else begin
          bRepLegal  := True;
          sGFam      := Copy(sGFam,0,length(sGFam)-1);
          while pos('@',sGFam) > 0 do
          begin
            sNro  := Copy(sGFam, 0,                pos('@',sGFam)-1);
            sGFam := Copy(sGFam, pos('@',sGFam)+1, length(sGFam)-length(sNro)+1);
            sPorc := Copy(sNro,  pos('#',sNro)+1,  length(sGFam)-pos('#',sNro));
            sNro  := Copy(sNro,  0,                pos('#',sNro)-1);
            sSQLI := 'INSERT INTO sbl_beneficiarioliquidacion ' +
                    '(bl_siniestro, bl_orden, bl_recaida, bl_numliq, bl_beneficiario, bl_porcentaje) VALUES (' +
                     SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
                     SqlInt(iNLiq) + ',' + SqlInt(sNro) + ',' + sqlNumber(sPorc) + ')';         // TK 35319 puse el SqlInt a sNro
            EjecutarSqlST(sSQLI);
          end;
          sPorc := Copy(sGFam,pos('#',sGFam)+1,length(sGFam)-pos('#',sGFam));
          sNro  := Copy(sGFam,0,pos('#',sGFam)-1);
          sSQLI := 'INSERT INTO sbl_beneficiarioliquidacion ' +
                   '(bl_siniestro, bl_orden, bl_recaida, bl_numliq, bl_beneficiario, bl_porcentaje) VALUES (' +
                    SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
                    SqlInt(iNLiq) + ',' + SqlInt(sNro)  + ',' + sqlNumber(sPorc) + ')';        // TK 35319 puse el SqlInt a sNro
          EjecutarSqlST(sSQLI);
        end;

        if bImprimeAhora then
          DoImprimirMortal(Siniestro, Orden, Recaida, iNLiq, StrToInt(sConcepto),
                           iTipoImpresion, iGrupoFamiliar, bRepLegal);
      end
      else     // TK 50082
        MsgBox('Este Item no se pudo liquidar debido a que su importe es menor o igual a 0 (' + FloatToStr(sImporte) + ')');

    end;

    EjecutarStoreSTEx('art.dinerarias.do_analizarestadomortal(:idexp, ''L'', :usu, art.dinerarias.get_porcentajeliqmortal(:idexp));',
                    [IdExpediente, Sesion.UserID, IdExpediente]);
    tbRefrescarClick(nil);
    FpnConfirmaResult.ModalResult := MrOK;

  end;
end;

procedure TfrmLiqBeneficiarios.tbEliminarClick(Sender: TObject);
begin
  Accion := l_None;
  if not(AreIn(memdatos.FieldByName('LE_ESTADO').AsString, ['A', 'X', 'Z'])) and  // anulada, cancelada
     not(AreIn(memDatos.FieldByName('LE_TIPOLIQUI').AsString, ['W', 'X', 'Y', 'Z'])) then // cancelación
  begin
    with TfrmCancelarLiquidacion.Create(Self) do
    try
      Siniestro      := Self.Siniestro;
      Orden          := Self.Orden;
      Recaida        := Self.Recaida;
      NroLiquidacion := memDatos.FieldByName('NRO').AsInteger;
      EsMortal       := True;
      if ShowModal = mrOk then
      begin
        EjecutarStoreEx('art.dinerarias.do_analizarestadomortal(:idexp, ''B'', :usu, art.dinerarias.get_porcentajeliqmortal(:idexp));',
                        [IdExpediente, Sesion.UserID, IdExpediente]);
        tbRefrescarClick(nil);
      end;
    finally
      Free;
    end;
  end else
    msgbox ('La liquidación ya se encuentra anulada/cancelada',0,'Imposible Cancelar');
end;

procedure TfrmLiqBeneficiarios.GetRepLegal(iSiniestro, iOrden, iRecaida, iGrupoFam: Integer;
                                           var sRepLegal, sBenef: String; var iCodigo: Integer);
var
  sSql: String;
begin
  sSql := 'SELECT eb_nombre, eb_codigo, ' +
                ' art.liq.get_dninombrebeneficiario(eb_siniestro, eb_orden, eb_recaida, eb_codigo) dni ' +
           ' FROM seb_beneficiarios ' +
          ' WHERE eb_siniestro = :Sin ' +
            ' AND eb_orden = :Ord ' +
            ' AND eb_recaida = :Reca ' +
            ' AND eb_grupofamiliar = :Grupo ' +
            ' AND eb_replegal= ''S'' ';

  with GetQueryEx(SSql, [iSiniestro, iOrden, iRecaida, iGrupoFam]) do
  try
    sRepLegal := FieldByName('eb_nombre').AsString;
    sBenef    := FieldByName('dni').AsString;
    iCodigo   := FieldByName('eb_codigo').AsInteger;
  finally
    Free;
  end;
end;

procedure TfrmLiqBeneficiarios.CmbFDesdeExit(Sender: TObject);
var
   SSQL, SErr :String;
begin
  inherited;
  SErr := ValorSqlEx('SELECT art.liq.get_errorperiodo(:Sin, :Ord, :Reca, :Desde) ' +
                      ' FROM dual', [Siniestro, Orden, Recaida, TDateTimeEx.Create(CmbFDesde.Date)]);
  if SErr <> '' then
  begin
     MsgBox(SErr, 0, 'Fecha Desde Inválida');
     bCanContinue := False;
  end else
  begin
     SSQL := ValorSqlEx('SELECT distinct(le_fechahas) ' +
                         ' FROM sle_liquiempsin ' +
                        ' WHERE le_siniestro = :Sin ' +
                          ' AND le_orden = :Ord ' +
                          ' AND le_recaida = :Reca ' +
                          ' AND le_fechades = :Desde ' +
                          ' AND NVL(le_estado,'' '') NOT IN (''A'',''X'') ' +
                          ' AND le_tipoliqui NOT IN (''W'',''X'',''Y'',''Z'')',
                          [Siniestro, Orden, Recaida, TDateTimeEx.Create(CmbFDesde.Date)]);
     bCanContinue := True;
     if SSQL <> '' then
     begin
       cmbfhasta.Text := SSQL;
       txtdias.Text   := ValorSqlEx('SELECT art.liq.get_dias(:Desde, :Hasta) ' +
                                     ' FROM dual', [TDateTimeEx.Create(CmbFDesde.Date),
                                                    TDateTimeEx.Create(CmbFHasta.Date)]);
     end
     else begin
       if cmbfhasta.Text <> '' then
       txtdias.Text := ValorSqlEx('SELECT art.liq.get_dias(:Desde, :Hasta) ' +
                                   ' FROM dual', [TDateTimeEx.Create(CmbFDesde.Date),
                                                  TDateTimeEx.Create(CmbFHasta.Date)]);
     end;
     SetMontoLiqidado;
  end;
end;

procedure TfrmLiqBeneficiarios.CmbFHastaExit(Sender: TObject);
var
   SErr :String;
   bIndemPagada, bAntConInd: Boolean;
begin
  inherited;

  SErr := ValorSqlEx('SELECT art.liq.get_errorperiodo(:Sin, :Ord, :Reca, :Desde) ' +
                      ' FROM dual', [Siniestro, Orden, Recaida, TDateTimeEx.Create(CmbFDesde.Date)]);
  if SErr <> '' then
  begin
    MsgBox(SErr,0,'Fecha Hasta Inválida');
    bCanContinue        := False;
    lstgrupofam.Enabled := False;
    Exit;
  end
  else begin
    if OptAnticipo.Checked then
    begin
      if CmbFDesde.IsEmpty or CmbFHasta.IsEmpty then
      begin
        MsgBox('Debe completar la fecha desde y la fecha hasta');
        bCanContinue        := False;
        lstgrupofam.Enabled := False;
        Exit;
      end
      else begin
        SetMontoLiqidado;
        LLenarGrupoFamiliar(False, CmbFDesde.Date, CmbFHasta.Date);
        if (TxtDias.text <> '') and (TxtDias.text <> '0') then
        begin
           SetMontoLiqidado;
           LLenarGrupoFamiliar (Tabs.TabIndex = 1, CmbFDesde.Date, CmbFHasta.Date);
        end;

        bIndemPagada := ValorSqlExtendedEx('SELECT art.liq.get_porcentajepagadomortal(:sin, :ord, :reca, 8) ' +
                                            ' FROM dual', [Siniestro, Orden, Recaida]) >= 1;
        bAntConInd   := Seguridad.Claves.IsActive('AnticipoConIndemnizacion');

        if (bIndemPagada and not(bAntConInd)) or
           (bIndemPagada and bAntConInd and not(MsgAsk('Atención: ya se ha liquidado la indemnización, ' + #13 +
                                                       '¿Confirma generar el anticipo de todas formas?'))) then
        begin
          if not(bAntConInd) then
            MsgBox('No se puede generar el anticipo ya que se liquidó la indemnización',0,'');
          bCanContinue        := False;
          lstgrupofam.Enabled := False;
          exit;
        end else
          lstgrupofam.Enabled := True;
      end;
    end;
  end;
  txtdias.Text := ValorSqlEx('SELECT art.liq.get_dias(:Desde, :Hasta) ' +
                              ' FROM dual', [TDateTimeEx.Create(CmbFDesde.Date),
                                             TDateTimeEx.Create(CmbFHasta.Date)]);
  bCanContinue := True;
  SetMontoLiqidado;
end;

procedure TfrmLiqBeneficiarios.FPnConfirmaResultShow(Sender: TObject);
var sDecisionLegales: string;
begin
  inherited;

  EdDesCheq.Enabled           := False;
  EdObs.Enabled               := False;
  rbNingunoFondos.Checked     := False;
  rbBancoFondos.Checked       := False;
  rbDelegacionFondos.Checked  := False;
  rbCentralFondos.Checked     := False;
  OnMetodoPagoChange(Nil);


  fraDelegacionLiq.Clear;
  fraMetodoPago.Clear;
  fraBanco.Clear;
  edEnvio.Clear;
  edRecibos.Clear;
  EdDesCheq.Clear;
  EdObs.Clear;

  sDecisionLegales := Get_DecisionLegales;    // Por Plan de Pagos Judiciales
  if (sDecisionLegales = 'S') then
    Do_CargarCamposDeLegales;

  if Accion = l_Reliquidacion then      // Plan Reliquidaciones automaticas
  begin
    Do_CompletarCamposReliquidacion;

    btnAceptarConf.Visible := False;
    tbGuardarReliq.Visible := True;
    LstLiquidaciones.Color := clBtnFace;
    LstLiquidaciones.Enabled := False;
    FPnConfirmaResult.Caption := 'Modificar Liquidación';
    EdDesCheq.Enabled       := True;
  end
  else begin
    btnAceptarConf.Visible := True;
    tbGuardarReliq.Visible := False;
    LstLiquidaciones.Color := clWindow;
    LstLiquidaciones.Enabled := True;
    FPnConfirmaResult.Caption := 'Confirmar Liquidación';
  end;;

end;

procedure TfrmLiqBeneficiarios.tbOrdenarClick(Sender: TObject);
begin
  if SortDialog.Execute then
    tbRefrescarClick(nil);
end;

procedure TfrmLiqBeneficiarios.memDatosAfterScroll(DataSet: TDataSet);
begin
  edDESDE.Text            := memDatos.FieldByName('DESDE').asString;
  edHASTA.Text            := memDatos.FieldByName('HASTA').asString;
  edIMPORTE_BASE.Text     := memDatos.FieldByName('IMPORTE_BASE').asString;
  edIMPORTE.Text          := memDatos.FieldByName('IMPORTE').asString;
  edOBSERVACIONES.Text    := memDatos.FieldByName('OBSERVACIONES').asString;
  edCHEQUE_A_NOMBRE.Text  := memDatos.FieldByName('CHEQUE_A_NOMBRE').asString;
  edFormaPago.Text        := memDatos.FieldByName('FORMAPAGO').AsString + ' - ' +
                             memDatos.FieldByName('BANCO').AsString;
  edEnvioFondos.Text      := memDatos.FieldByName('LE_ENVIOFONDOS').AsString;
  edRecibosa.Text         := memDatos.FieldByName('LE_RECIBOS').AsString;

  edTipo.Text             := memDatos.FieldByName('Tipo').asString;
  edCalculo.Text          := memDatos.FieldByName('Calculo').asString;
  edDias.Text             := memDatos.FieldByName('DIAS').asString;
  sdqConsultaParent.ParamByName('nSINIESTRO').AsInteger := Siniestro;
  sdqConsultaParent.ParamByName('nORDEN').AsInteger     := Orden;
  sdqConsultaParent.ParamByName('nRECAIDA').AsInteger   := Recaida;
  sdqConsultaParent.ParamByName('nNROLIQ').AsInteger    := memDatos.fieldbyname('NRO').AsInteger;
  if sdqConsultaParent.Active then
    sdqConsultaParent.Refresh
  else
    sdqConsultaParent.Open;
  edImporte_Base.text:=memDatos.fieldbyname('IMPORTE_BASE').AsString;

  lModifNoAutorizada.Visible := IsModifNoAutorizada;  // Plan Reliquidaciones Automaticas. pone la leyenda en rojo si es que la liquidacion se encuentra pendiente de autorizar la modificacion
end;

procedure TfrmLiqBeneficiarios.fraDelegacionLiqExit(Sender: TObject);
var iCnt : integer;
begin
  if (Accion <> l_Reliquidacion) then
    for iCnt := 0 to LstLiquidaciones.Items.Count - 1 do
    begin
      LstLiquidaciones.Items.Item [iCnt].SubItems.Strings[4] := fraDelegacionLiq.edCodigo.text;
      LstLiquidaciones.Items.Item [iCnt].SubItems.Strings[5] := fraDelegacionLiq.cmbDescripcion.Text;
    end;
end;

procedure TfrmLiqBeneficiarios.mnuImprimirGrillaClick(Sender: TObject);
begin
  Queryprint.SubTitle.Text := 'Siniestro:' + IntToStr(Siniestro) + ' - Orden:' + IntToStr(Orden) +
                              ' - Recaida:' + IntToStr(Recaida) + ' - ' + fraTrabajadorSIN.Nombre +
                              '(' + fraTrabajadorSIN.CUIL + ')';
  if PrintDialog.Execute then Queryprint.Print;
end;

procedure TfrmLiqBeneficiarios.mnuReimprimirLiquidacionClick(Sender: TObject);
var
  iTipoImpresion: Integer;
begin
  iTipoImpresion := SelectDlg('Seleccione los formularios a imprimir',
                              ['Solo Liquidación', 'Solo Recibo', 'Ambos'], 1);

  if iTipoImpresion <> -1 then  // Cancelar
    DoImprimirMortal(memdatos.FieldByName('le_siniestro').AsInteger,
                     memdatos.FieldByName('le_orden').AsInteger,
                     memdatos.FieldByName('le_recaida').AsInteger,
                     memdatos.FieldByName('nro').AsInteger,
                     memdatos.FieldByName('le_conpago').AsInteger,
                     iTipoImpresion, sdqConsultaParent.FieldByName('grupo_fam').AsInteger,
                     IIF(memdatos.FieldByName('le_tipobeneficiario').AsString = 'R', True, False));
end;

procedure TfrmLiqBeneficiarios.EditarImporte1Click(Sender: TObject);
begin
   EdNewImporte.Value := memdatos.fieldbyname('le_subtotal').AsCurrency;
   EdNewPA.Value := memdatos.fieldbyname('le_montopagoadic').AsCurrency;
   EdNewCD.Value := memdatos.fieldbyname('le_montocompdanios').AsCurrency;
   edNewTotal.Value := memdatos.FieldByName('importe').AsCurrency;
   EdMotCancel.Clear;

   FPModifImporte.showmodal;
end;

procedure TfrmLiqBeneficiarios.EdNewCDExit(Sender: TObject);
begin
  CalcTotalEditarImporte;
end;

procedure TfrmLiqBeneficiarios.EdNewImporteExit(Sender: TObject);
begin
  CalcTotalEditarImporte;
end;

procedure TfrmLiqBeneficiarios.EdNewPAExit(Sender: TObject);
begin
  CalcTotalEditarImporte;
end;

procedure TfrmLiqBeneficiarios.btnAceptarModClick(Sender: TObject);
var
   SSQL:String;
begin
  if ValidarModifValores then
  begin
   SSQL:='UPDATE sle_liquiempsin ' +
           ' SET le_subtotal = :subt, ' +
           '     le_impiltp = DECODE(NVL(le_impiltp, 0), 0, 0, :impiltp), ' +
           '     le_montopagoadic = :pa, ' +
           '     le_montocompdanios = :cd, ' +
           '     le_imporperi = :total, ' +
           '     le_motmodi_importe = :mot, ' +
           '     le_usumodif = :usumodif, ' +
           '     le_fmodif = art.actualdate ' +
         ' WHERE le_id = :idliq ';
   try
     EjecutarSqlEx(SSQL, [EdNewImporte.Value, EdNewImporte.Value, EdNewPA.Value, EdNewCD.Value,
                   EdNewImporte.Value + EdNewPA.Value + EdNewCD.Value,
                   EdMotCancel.Text, Sesion.UserID, memdatos.fieldbyname('le_id').AsInteger]);

     MsgBox('Se ha modificado el importe correctamente.');
   except
     on e: exception do
     MsgBox('Ocurrio un error al modificar el importe. ' + e.Message);
   end;
   //Grid.Refresh;
   tbRefrescarClick(nil);
   fpModifimporte.ModalResult := mrOK;
  end;

end;

procedure TfrmLiqBeneficiarios.tbBeneficiariosClick(Sender: TObject);
begin
  tbBeneficiarios.CheckMenuDropdown;
end;

procedure TfrmLiqBeneficiarios.GridColEnter(Sender: TObject);
begin
  if (memDatos.Active and not memDatos.IsEmpty) then
  begin
    NroLiquidacion := memDatos.FieldByName('nro').AsInteger;
    mnuReimprimirLiquidacion.Enabled := True;
    EditarImporte1.enabled           := False;
    if AreIn(memDatos.FieldByName('LE_ESTADO').asString, ['A','X']) then
      mnuReimprimirLiquidacion.Enabled := False
    else if memDatos.FieldByName('LE_ESTADO').asString = 'E'  then
      mnuReimprimirLiquidacion.Enabled := Seguridad.Activar(mnuReimprimirLiquidacion)
    else if (memDatos.FieldByName('LE_ESTADO').asString = 'C') and
            (memDatos.FieldByName('LE_TIPOLIQUI').asString <> 'W') then
      EditarImporte1.enabled:=Seguridad.Activar(EditarImporte1);
  end;
end;

procedure TfrmLiqBeneficiarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmFinancials.Desconectar;
end;

procedure TfrmLiqBeneficiarios.tbCargarSeguroRetiroClick(Sender: TObject);
begin
  inherited;
  if PuedeCargarCompaniaSeguroReturo(Siniestro, Orden) then
    with TfrmCompaniaSeguroRetiro.Create(Self) do
    try
      Siniestro    := Self.Siniestro;
      Orden        := Self.Orden;
      Recaida      := Self.Recaida;
      ConceptoPago := 8;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmLiqBeneficiarios.memDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if memDatos.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(memDatos.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmLiqBeneficiarios.mnuSolicituddeCotizacionClick(Sender: TObject);
var
  sSql: String;
  iSiniestro, iOrden, iRecaida, iNroLiq: Integer;
begin
  iSiniestro := memDatos.FieldByName('LE_SINIESTRO').AsInteger;
  iOrden     := memDatos.FieldByName('LE_ORDEN').AsInteger;
  iRecaida   := memDatos.FieldByName('LE_RECAIDA').AsInteger;
  iNroLiq    := memDatos.FieldByName('NRO').AsInteger;

  sSql := 'SELECT liq.is_liqcotizacion(:Sin, :Ord, :Reca, :Nro)' +
           ' FROM DUAL';

  if ValorSqlEx(sSql, [iSiniestro, iOrden, iRecaida, iNroLiq]) = '1' then
    ImprimirSolicitudCotizacionRentaVit(iSiniestro, iOrden, iRecaida, iNroLiq)
  else
    MsgBox('El trabajador no pertenece al régimen de reparto', MB_ICONEXCLAMATION);
end;

procedure TfrmLiqBeneficiarios.ImprimirSolicitudCotizacionRentaVit(iSiniestro, iOrden, iRecaida, iNLiq: Integer);
begin
  with TrptSolicitudCotizacionRentaVit.Create(nil) do
  try
    sdqHeader.ParamByName('pSiniestro').Value := iSiniestro;
    sdqHeader.ParamByName('pOrden').Value     := iOrden;
    sdqHeader.ParamByName('pRecaida').Value   := iRecaida;
    sdqHeader.ParamByName('pNLiq').Value      := iNLiq;
    sdqHeader.Open;

    sdqDetail.ParamByName('pSiniestro').Value := iSiniestro;
    sdqDetail.ParamByName('pOrden').Value     := iOrden;
    sdqDetail.ParamByName('pRecaida').Value   := iRecaida;
    sdqDetail.Open;

    if PrintDialog.Execute then Print;
  finally
    Free;
  end;
end;

function TfrmLiqBeneficiarios.GetNombreCiaSeguroRetiro(iSiniestro, iOrden: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT ur_nombre ' +
           ' FROM secb_cbaseexpsin, sur_seguroretiro ' +
          ' WHERE cb_siniestro = :Sin ' +
            ' AND cb_orden = :Ord ' +
            ' AND cb_seguroretiro = ur_codigo';
  Result := ValorSqlEx(sSql, [Siniestro, Orden]);
end;

procedure TfrmLiqBeneficiarios.tbExportarClick(Sender: TObject);
begin
  ExportDialog.DataSet := DBGrid.DataSource.DataSet;
  inherited;
end;

procedure TfrmLiqBeneficiarios.fraTrabajadorSINedSiniestroSelect(Sender: TObject);
begin
  inherited;
  fraTrabajadorSIN.edSiniestroSelect(Sender);
  CargarPartes;
  DoEvaluarCartelSiniestroConAnioILT(Siniestro, Orden, Recaida);  // TK 46933
end;

procedure TfrmLiqBeneficiarios.DoLimpiarAbajo;
begin
  EnableButtons(False);
  edDESDE.Clear;
  edHASTA.Clear;
  edDIAS.Clear;
  edIMPORTE_BASE.Clear;
  edIMPORTE.Clear;
  edOBSERVACIONES.Clear;
  edCHEQUE_A_NOMBRE.Clear;
  EdTipo.Clear;
  EdCalculo.Clear;
  MemDatos.Close;
  sdqConsulta.Close;
  sdqConsultaParent.Close;
  tbNuevo.Enabled     := False;
  tbModificar.Enabled := False;
  tbEliminar.Enabled  := False;
  tbImprimir.Enabled  := False;
  tbExportar.Enabled  := False;
  Siniestro           := 0;
  Orden               := 0;
  Recaida             := 0;
end;

procedure TfrmLiqBeneficiarios.DoCargarFinancials;
var
  sdqFnclDatos: TSDQuery;
  Bookmark: {$IFDEF VER150}TBookmarkStr{$ELSE}TBookmark{$ENDIF};
  sSql: String;
begin
  if not(memDatos.Active) or memDatos.IsEmpty then Exit;

  dmFinancials.Conectar;
  try
    memDatos.DisableControls;
    try
      Bookmark := memDatos.Bookmark;
      try
        sdqFnclDatos := TSDQuery.Create(Self);
        try
          sSql := 'SELECT jl.jl_ar_b_payment_orders_all.payment_order_id ordennro, ' +
                        ' trunc(jl.jl_ar_b_payment_orders_all.payment_date) ordenfecha, ' +
                        ' jl.jl_ar_b_checks_all.check_number chequenro, ' +
                        ' trunc(nvl(jl.jl_ar_b_checks_all.date_issued, jl.jl_ar_b_payment_methods_all.cashflow_date-2)) chequefecha ' +
                   ' FROM ap.ap_invoices_all, ap.ap_invoice_payments_all, jl.jl_ar_b_payment_orders_all, ' +
                        ' jl.jl_ar_b_checks_all, jl.jl_ar_b_payment_methods_all ' +
                  ' WHERE ap.ap_invoices_all.invoice_id = ap.ap_invoice_payments_all.invoice_id ' +
                    ' AND ap.ap_invoice_payments_all.jlar_payment_order_id = jl.jl_ar_b_payment_orders_all.payment_order_id ' +
                    ' AND jl.jl_ar_b_payment_orders_all.payment_order_id = jl.jl_ar_b_checks_all.payment_order_id ' +
                    ' AND jl.jl_ar_b_payment_orders_all.payment_number = jl.jl_ar_b_payment_methods_all.payment_order_id ' +
                    ' AND ap.ap_invoices_all.pay_group_lookup_code = ''Siniestros'' ' +
                    ' AND jl.jl_ar_b_checks_all.status <> ''VOID'' ' +
                    ' AND ap.ap_invoices_all.attribute6 = :pSiniestro ' +
                    ' AND ap.ap_invoices_all.attribute7 = :pOrden ' +
                    ' AND ap.ap_invoices_all.attribute8 = :pRecaida ' +
                    ' AND ap.ap_invoices_all.attribute9 = :pNumLiqui ' +
                    ' AND ap.ap_invoices_all.attribute11 = ''SLE'' ' + //ojo aca si se incorpora la SPR

                ' UNION ALL ' +

                 ' SELECT ch.check_id ordennro, ch.check_date ordenfecha, ' +
                         'ch.check_number chequenro, ch.check_date chequefecha' +
                   ' FROM ap_checks_all ch, ap_invoice_payments_all aip, ap_invoices_all ai ' +
                  ' WHERE ai.invoice_id=aip.invoice_id ' +
                    ' AND aip.check_id=ch.check_id ' +
                    ' AND ch.status_lookup_code=''NEGOTIABLE'' ' +
                    ' AND ai.attribute6 = :pSiniestro ' +
                    ' AND ai.attribute7 = :pOrden ' +
                    ' AND ai.attribute8 = :pRecaida ' +
                    ' AND ai.attribute9 = :pNumLiqui ' +
                    ' AND ai.attribute11 = ''SLE'' '; //ojo aca si se incorpora la SPR

          dmFinancials.SetDatabaseToQuery(sdqFnclDatos);
          sdqFnclDatos.SQL.Text := sSql;

          memDatos.First;
          while not memDatos.EOF do
          begin
            sdqFnclDatos.ParamByName('pSiniestro').AsString := memDatos.FieldByName('LE_SINIESTRO').AsString;
            sdqFnclDatos.ParamByName('pOrden').AsString     := memDatos.FieldByName('LE_ORDEN').AsString;
            sdqFnclDatos.ParamByName('pRecaida').AsString   := memDatos.FieldByName('LE_RECAIDA').AsString;
            sdqFnclDatos.ParamByName('pNumLiqui').AsString  := memDatos.FieldByName('NRO').AsString;

            dmFinancials.OpenQuery(sdqFnclDatos);
            {------------------------------------}
            memDatos.Edit;
            memDatos.FieldByName('OrdenNro').Value    :=  sdqFnclDatos.FieldByName('OrdenNro').Value;
            memDatos.FieldByName('OrdenFecha').Value  :=  sdqFnclDatos.FieldByName('OrdenFecha').Value;
            memDatos.FieldByName('ChequeNro').Value   :=  sdqFnclDatos.FieldByName('ChequeNro').Value;
            memDatos.FieldByName('ChequeFecha').Value :=  sdqFnclDatos.FieldByName('ChequeFecha').Value;
            memDatos.Post;
            {------------------------------------}
            sdqFnclDatos.Close;
            memDatos.Next;
          end;
        finally
          sdqFnclDatos.Free;
        end;
      finally
        memDatos.Bookmark := Bookmark;
      end;
    finally
      memDatos.EnableControls;
    end;
  finally
    dmFinancials.Desconectar;
  end;
end;

{procedure TfrmLiqBeneficiarios.tbDatosPagoClick(Sender: TObject);         // lo modifique por ticket 53237 (boton dropdown)
begin
  if tbDatosPago.Down then DoCargarFinancials;

  Grid.ColumnByField['ORDENNRO'].Visible    := tbDatosPago.Down;
  Grid.ColumnByField['ORDENFECHA'].Visible  := tbDatosPago.Down;
  Grid.ColumnByField['CHEQUENRO'].Visible   := tbDatosPago.Down;
  Grid.ColumnByField['CHEQUEFECHA'].Visible := tbDatosPago.Down;
end;     }

procedure TfrmLiqBeneficiarios.OnMetodoPagoChange(Sender: TObject);
var
  bHabil :Boolean;
begin
  bHabil := AreIn(fraMetodoPago.Codigo, ['GI', 'TR', 'DC', 'CH']);
  LockControl(fraBanco, not bHabil);
  fraBanco.Clear;
  SetEnvioFondos;
  SetChequeANombre;
end;

procedure TfrmLiqBeneficiarios.SetEnvioFondos;
var
  sEnvio, sRecibo :String;
begin
    btnEnvio.Enabled := AreIn(fraMetodoPago.Codigo, ['TR', 'EF', 'CH']);
    edEnvio.Text     := IIF((fraMetodoPago.Codigo = 'DC'),
                            GetCuenta('TA', fraTrabajadorSIN.Value, 0, '', StrToInt(GetConcepto(STipo))), '');
    edEnvio.Text     := sEnvio;
    if (LstLiquidaciones.SelCount > 0) and
       AreIn(fraMetodoPago.Codigo, ['TR', 'DC', 'GI', 'PE']) then
      sRecibo := ValorSqlEx('SELECT art.liq.get_domiciliobeneficiario(:Sin, :Ord, :Reca, :Cod) ' +
                             ' FROM dual', [Siniestro, Orden, Recaida,
                                            StrToInt(LstLiquidaciones.Selected.SubItems.Strings[8])])
    else
      sRecibo := '';

    edRecibos.Text := sRecibo;
end;

function TfrmLiqBeneficiarios.GetConcepto(Tipo: String) :String;
begin
  if Tipo = '1' then
    Result := '55'
  else if Tipo = '2' then
    Result := '53'
  else
    Result := '8';
end;

function TfrmLiqBeneficiarios.GetFormula(Tipo: String) :String;
begin
  Result := ValorSqlEx('SELECT art.liq.get_formulaliqmortal(:Sin, :Ord, :Reca, :Tipo, NULL, NULL) ' +
                        ' FROM dual', [Siniestro, Orden, Recaida, STipo]);
end;

procedure TfrmLiqBeneficiarios.SetChequeANombre;
var
  sNombre: String;
begin
  if AreIn(fraMetodoPago.Codigo, ['DC', 'TR']) then
    sNombre := IIF(fraBanco.IsSelected, fraBanco.Descripcion, '')
  else if (fraMetodoPago.Codigo = 'DA') then
    sNombre := GetNombreBanco(BANCO_PROVINCIA)
  else if (LstLiquidaciones.SelCount > 0) then
    sNombre := LstLiquidaciones.Selected.Caption;

  if (sNombre <> '') then
    EdDesCheq.Text := sNombre;
end;

procedure TfrmLiqBeneficiarios.rbNacionClick(Sender: TObject);
begin
  SetChequeANombre;
end;

procedure TfrmLiqBeneficiarios.rbProvClick(Sender: TObject);
begin
  SetChequeANombre;
end;

procedure TfrmLiqBeneficiarios.btnEnvioClick(Sender: TObject);
begin
  Verificar(fraMetodoPago.IsEmpty, fraMetodoPago, 'Primero debe seleccionar la forma de pago.');
  if (fpEnvioFondos.ShowModal = mrOk) then
  begin
    if rbBancoFondos.Checked then
      edEnvio.Text  := fraBancoFondos.Descripcion +
                        IIF(not(fraSucursalFondos.IsEmpty), ' - SUCURSAL ' +
                        fraSucursalFondos.Descripcion + ' (' + fraSucursalFondos.Codigo + ')', '')
    else if rbDelegacionFondos.Checked then
    begin
      edEnvio.Text    := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
      edRecibos.Text  := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
    end
    else if rbCentralFondos.Checked then
    begin
      edEnvio.Text    := 'CASA CENTRAL';
      edRecibos.Text  := 'CASA CENTRAL';
    end
    else begin
      edEnvio.Text    := '';
      edRecibos.Text  := '';
    end;
  end;
end;

procedure TfrmLiqBeneficiarios.fraBancoFondosOnChange(Sender: TObject);
begin
  fraSucursalFondos.Clear;
  LockControl(fraSucursalFondos, fraBancoFondos.IsEmpty or
                                (fraBancoFondos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'N'));
  if fraBancoFondos.IsSelected then
    fraSucursalFondos.ExtraCondition := ' AND sb_idbanco = ' + SqlInt(fraBancoFondos.Value)
  else
    fraSucursalFondos.ExtraCondition := ' AND 1 = 2 ';
end;

procedure TfrmLiqBeneficiarios.DoHabilitarFondos;
begin
  LockControl(fraBancoFondos, rbDelegacionFondos.Checked or rbCentralFondos.Checked or rbNingunoFondos.Checked);
  LockControl(fraSucursalFondos, True);
  LockControl(fraDelegacionFondos, rbBancoFondos.Checked or rbCentralFondos.Checked or rbNingunoFondos.Checked);
  fraBancoFondos.Clear;
  fraSucursalFondos.Clear;
  fraDelegacionFondos.Clear;
end;

procedure TfrmLiqBeneficiarios.rbNingunoFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmLiqBeneficiarios.rbBancoFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmLiqBeneficiarios.rbDelegacionFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmLiqBeneficiarios.rbCentralFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmLiqBeneficiarios.btnAceptarFondosClick(Sender: TObject);
begin
  Verificar((AreIn(fraMetodoPago.Codigo, ['EF', 'CH']) and rbBancoFondos.Checked) or
              ((fraMetodoPago.Codigo = 'TR') and not(rbBancoFondos.Checked or rbNingunoFondos.Checked)),
              gbEnvioFondos, 'La forma de pago seleccionada (' + fraMetodoPago.Codigo + ') no corresponde con ésta opción.');
  Verificar(not(fraBancoFondos.IsEmpty) and not(fraBanco.IsEmpty) and
            (fraBancoFondos.Value <> fraBanco.Value), fraBancoFondos,
            'El banco no corresponde con el seleccionado anteriormente.');
  Verificar(rbBancoFondos.Checked and fraBancoFondos.IsEmpty, fraBancoFondos,
            'Debe seleccionar el banco.');
  Verificar(rbBancoFondos.Checked and fraSucursalFondos.IsEmpty and not(fraSucursalFondos.Locked),
            fraSucursalFondos, 'Debe seleccionar la sucursal.');
  Verificar(rbDelegacionFondos.Checked and fraDelegacionFondos.IsEmpty, fraDelegacionFondos,
            'Debe seleccionar la delegación.');
  fpEnvioFondos.ModalResult := mrOk;
end;

procedure TfrmLiqBeneficiarios.mnuImprimirCaratulaClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM seb_beneficiarios ' +
          ' WHERE eb_siniestro = :sin ' +
            ' AND eb_orden = :ord ' +
            ' AND eb_recaida = :reca ' +
            ' AND eb_fechabaja IS NULL';
  Verificar(not(ExisteSqlEx(sSql, [Siniestro, Orden, Recaida])), nil,
            'No se ha cargado ningun beneficiario para el siniestro.');

  with TqrCaratulaMortales.Create(Self) do
  try
    Preparar(Siniestro, Orden, Recaida);
  finally
    free;
  end;
end;

function TfrmLiqBeneficiarios.ValidarDatos: Boolean;
begin
  Verificar(fraDelegacionLiq.IsEmpty, fraDelegacionLiq, 'Debe seleccionar la delegación.');
  Verificar(fraMetodoPago.IsEmpty, fraMetodoPago, 'Debe seleccionar la forma de pago.');
  Verificar(AreIn(fraMetodoPago.Codigo, ['GI', 'TR', 'DC', 'CH']) and fraBanco.IsEmpty,
            fraBanco, 'Para esta forma de pago, debe seleccionar el banco.');
  Verificar(AreIn(fraMetodoPago.Codigo, ['GI', 'TR', 'DC', 'CH']) and
            not(Is_MetodoPagoDelBanco(fraMetodoPago.Codigo, fraBanco.Value)),
            fraMetodoPago, 'El banco seleccionado no acepta esta forma de pago.');
  Verificar((fraMetodoPago.Codigo = 'DC') and not(Is_CuentaValidaConcepto(fraTrabajadorSIN.IdTrabajador, GetConcepto(STipo))),
            Nil, 'El acreedor no posee una cuenta cargada y validada ó la cuenta no está relacionada con el concepto de pago.');
  Result := True;
end;

function TfrmLiqBeneficiarios.GetTipoFondos: String;
var
  sTipo: String;
begin
  if rbBancoFondos.Checked then
    sTipo := fraBancoFondos.Codigo
  else if rbDelegacionFondos.Checked then
    sTipo := 'D'
  else if rbCentralFondos.Checked then
    sTipo := 'C'
  else
    sTipo := '';

  Result := sTipo;
end;

function TfrmLiqBeneficiarios.GetCodigoFondos: Integer;
var
  iCodigo: Integer;
begin
  if rbBancoFondos.Checked then
    iCodigo := fraSucursalFondos.Value
  else if rbDelegacionFondos.Checked then
    iCodigo := fraDelegacionFondos.Value
  else
    iCodigo := 0;

  Result := iCodigo;
end;

procedure TfrmLiqBeneficiarios.btnCuentasClick(Sender: TObject);
begin
//  with TfrmManCCP_CUENTAPAGO.Create(Self) do
//  try
//  {aca tengo dudas....no creo que sea al trabajador...}
////    Execute('TA', fraTrabajadorSIN.Value, '');
//  finally
//    Free;
//  end;
end;

procedure TfrmLiqBeneficiarios.tbObservacionesClick(Sender: TObject);
var
  sSql: String;
begin
  if not fraTrabajadorSIN.IsEmpty and
    (fpObservaciones.ShowModal = mrOk) then
  begin
    sSql := 'UPDATE sex_expedientes ' +
              ' SET ex_observmortales = ' + SqlValue(edObserv.Lines.Text) +
            ' WHERE ex_siniestro =  ' + SqlInt(Siniestro) +
              ' AND ex_orden = ' + SqlInt(Orden) +
              ' AND ex_recaida = ' + SqlInt(Recaida);
    EjecutarSql(sSql);
  end;
end;

procedure TfrmLiqBeneficiarios.fpObservacionesBeforeShow(Sender: TObject);
begin
  edObserv.Lines.Text := ValorSqlEx('SELECT ex_observmortales ' +
                                     ' FROM sex_expedientes ' +
                                    ' WHERE ex_siniestro =  :Sin ' +
                                      ' AND ex_orden = :Ord ' +
                                      ' AND ex_recaida = :Reca ', [Siniestro, Orden, Recaida]);
end;

procedure TfrmLiqBeneficiarios.mnuDatosEconomicosClick(Sender: TObject);
var
  frmLiqIncapacidades: TfrmLiqIncapacidades;
begin
  if not fraTrabajadorSIN.IsEmpty then
    with frmLiqIncapacidades do
    begin
      frmLiqIncapacidades           := TfrmLiqIncapacidades.Create(frmPrincipal);
      MenuItem                      := frmPrincipal.mnuLiqIncapacidades;
      fraEmpresa.Value              := Self.fraEmpresa.Value;
      fraTrabajadorSIN.IdSiniestro  := Self.sdqBusquedaEX_ID.AsInteger;
      PageControl.ActivePageIndex   := ctsDatosEcon;
      DoCargarLiquidaciones(True);
      Show;
      Self.Close;
    end;
end;

procedure TfrmLiqBeneficiarios.mnuBeneficiariosClick(Sender: TObject);
var
  frmBeneficiarios: TfrmBeneficiarios;
begin
  if not fraTrabajadorSIN.IsEmpty then
    with frmBeneficiarios  do
    begin
      frmBeneficiarios      := TfrmBeneficiarios.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuLiqMortBeneficiarios;
      fraTrabajadorSIN.edSiniestro.SetValues(Self.Siniestro, Self.Orden, Self.Recaida);
      fraTrabajadorSINedSiniestroSelect(Nil);
      Show;
      Self.Close;
    end;
end;

procedure TfrmLiqBeneficiarios.mnGenIntILPILTClick(Sender: TObject);
var iNroLiquidacion: integer;
begin
  if memDatos.Active and not(memDatos.IsEmpty) and
    (memDatos.FieldByName('le_numintereses').AsInteger = 0) and not(AreIn(memDatos.FieldByName('le_estado').AsString, ['A', 'X'])) and
     not(AreIn(memDatos.FieldByName('le_tipoliqui').AsString, ['W', 'X'])) then
  begin

    with TfrmGeneracionIntereses.Create(Nil) do
    try
      ConPago   := memDatos.FieldByName('le_conpago').AsInteger;
      FechaSin  := edSinFecha.Date;
      Capital   := memDatos.FieldByName('importe').AsFloat;
      Siniestro := Self.Siniestro;
      Orden     := Self.Orden;
      Recaida   := Self.Recaida;
      EsMortal  := True;
      if (ShowModal = mrOk) then

        GenerarLiqManual(CONCEPTO_INTERESES_DIN, iNroLiquidacion, edInteresesInt.Value, edDesdeInt.Date, edHastaInt.Date,
                         edTasaOrigInt.Value, edTasaFinInt.Value, IIF(rbRecapitInt.Checked, 'R', IIF(rbActivaInt.Checked, 'A', 'P')));

    finally
      Free;
    end;
  end;
end;

procedure TfrmLiqBeneficiarios.fraBancoOnChange(Sender: TObject);
begin
  SetChequeANombre;
end;

procedure TfrmLiqBeneficiarios.mnGenCompDaniosClick(Sender: TObject);
begin
  if memDatos.Active and not(memDatos.IsEmpty) and DoValidarGeneraCompDanos('N') and
     MsgAsk('¿Esta seguro que desea generar la Compensación por Daños de la Liquidación N°' + memDatos.FieldByName('NRO').AsString + '?') then
    GenerarLiquidacion_CompPorDaniosMortal;

end;


procedure TfrmLiqBeneficiarios.GenerarLiquidacion_CompPorDaniosMortal;
var sSql, sSqlRecorreBenef: string;
    iNroLiquidacion: integer;
    bRes: boolean;
begin
  iNroLiquidacion := 0;
  bRes := False;

  BeginTrans;
  Try

    GenerarLiqManual(CONCEPTO_COMPENSACIONDANIOS, iNroLiquidacion,
                     getMontoCompensacionDanos(sdqConsultaParent.FieldByName('codBenef').AsString, sdqConsultaParent.FieldByName('grupo_fam').AsString),
                     0, 0, 0, 0, '', '', False);

    if iNroLiquidacion <> 0 then
    begin
      // Luego debo recorrer a los Beneficiarios y sus porcentajes, para Generar las liquidaciones de compensacion por daños
      // Los porcentajes: para obtener el total de cada liquidacion correspondiente a cada beneficiario
      sSqlRecorreBenef := ' SELECT bl_beneficiario, bl_porcentaje, le_chequenombre, liq.getnrodocbeneficiarioliquidac(bl_siniestro, bl_orden, bl_recaida, bl_numliq, ''SLE'') documento ' +
                            ' FROM art.sbl_beneficiarioliquidacion, art.sle_liquiempsin ' +
                           ' WHERE bl_siniestro = :sin ' +
                             ' AND bl_orden = :orden ' +
                             ' AND bl_recaida = :reca ' +
                             ' AND bl_numliq = :liq ' +
                             ' AND bl_siniestro = le_siniestro ' +
                             ' AND bl_orden = le_orden ' +
                             ' AND bl_recaida = le_recaida ' +
                             ' AND bl_numliq = le_numliqui ';


      with GetQueryEx(sSqlRecorreBenef, [Siniestro, Orden, Recaida, NroLiquidacion]) do
      try
        while not Eof do
        begin

          sSql := ' insert into art.sbl_beneficiarioliquidacion ' +
                  '      values (:sin, :ord, :rec, :nliq, :benef, :porc) ';

          EjecutarSqlSTEx(sSql, [Siniestro, Orden, Recaida, iNroLiquidacion, FieldByName('bl_beneficiario').AsInteger, FieldByName('bl_porcentaje').AsFloat]);

          Next;
        end;
      finally
        free;
      end;

      with TfrmDireccionCDO.Create(nil) do
      try
        bRes := Mostrar(IdExpediente, iNroLiquidacion, 'M');
      finally
        Free;
      end;
    end;

    if bRes = true then
    begin
      CommitTrans;
      if (MsgBox('Alta efectuada correctamente' + #13 +'¿Quiere imprimir la liquidación ahora?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
      begin
        ssql := 'SELECT distinct eb_grupofamiliar' +
                '  FROM ART.SLE_LIQUIEMPSIN, ART.SBL_BENEFICIARIOLIQUIDACION, ART.SEB_BENEFICIARIOS' +
                ' WHERE LE_SINIESTRO = :IDLIQ' +
                '   AND LE_ORDEN = :ORD ' +
                '   AND LE_RECAIDA = :REC ' +
                '   AND LE_NUMLIQUI = :NLIQ ' +
                '   AND BL_SINIESTRO = LE_SINIESTRO' +
                '   AND BL_ORDEN = LE_ORDEN' +
                '   AND BL_RECAIDA = LE_RECAIDA' +
                '   AND BL_NUMLIQ = LE_NUMLIQUI' +
                '   AND EB_SINIESTRO = BL_SINIESTRO' +
                '   AND EB_ORDEN = BL_ORDEN' +
                '   AND EB_RECAIDA = BL_RECAIDA' +
                '   AND EB_CODIGO = BL_BENEFICIARIO';

        DoImprimirMortal(Siniestro, Orden, Recaida, iNroLiquidacion, 8, 2,
                         ValorSqlEx(sSql, [Siniestro, Orden, Recaida, iNroLiquidacion]),
                         IIF(ValorSqlEx('select LE_TIPOBENEFICIARIO from sle_liquiempsin where le_siniestro = :idliq ' +
                                                ' and le_orden = :ord and le_recaida = :rec and le_numliqui = :nliq',
                         [Siniestro, Orden, Recaida, iNroLiquidacion]) = 'R', true, false));
      end;
    end
    else
      Rollback;

    tbRefrescarClick(Nil);

  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Ha surgido un error al insertar la liquidación de Compensación por daños');
    end;
  end;
end;


function TfrmLiqBeneficiarios.GetSumaLiqAnt(sCodGrupoFliar, sCodBenef: string; sFechaDesde: string = ''; sFechaHasta: string = ''): Currency;     // TK 50082
var sSql: string;
begin
  sSql := 'SELECT SUM( decode(le_montopagoadic, null, le_imporperi, le_subtotal) / (SELECT count(*) CantBenefxLiq ' +
                                                                                    ' FROM sbl_beneficiarioliquidacion ' +
                                                                                   ' WHERE bl_siniestro = ' + SqlInt(Siniestro) +
                                                                                     ' AND bl_orden = ' + SqlInt(Orden) +
                                                                                     ' AND bl_recaida = ' + SqlInt(Recaida) +
                                                                                     ' AND bl_numliq = le_numliqui))   SUMAPAGADO ' +
           ' FROM art.sle_liquiempsin, sbl_beneficiarioliquidacion, seb_beneficiarios ' +
          ' WHERE le_siniestro = ' + SqlInt(Siniestro) +
            ' AND le_orden = ' + SqlInt(Orden) +
            ' AND le_recaida =  ' + SqlInt(Recaida) +
            ' AND le_tipoliqui = ''I'' ' +   // ILP
            ' AND NVL(le_estado,'' '') NOT IN (''A'',''X'') ' +
            ' AND le_conpago = :conPago ' +
            ' AND bl_siniestro = le_siniestro ' +
            ' AND bl_orden = le_orden ' +
            ' AND bl_recaida = le_recaida ' +
            ' AND bl_numliq = le_numliqui ' +
            ' AND bl_beneficiario = eb_codigo ' +
            ' AND eb_siniestro = bl_siniestro ' +
            ' AND eb_orden = bl_orden ' +
            ' AND eb_recaida = bl_recaida ' +
            ' AND eb_grupofamiliar = :codGrFliar ' +
            ' AND eb_codigo = :codBenef ';

  if sFechaDesde <> 'NULL' then
    sSql := sSql + ' AND le_fechades >= ' + sFechaDesde;
  if sFechaHasta <> 'NULL' then
    sSql := sSql + ' AND le_fechahas <= ' + sFechaHasta;

  with GetQueryEx(SSql, [GetConcepto(STipo), sCodGrupoFliar, sCodBenef]) do
  try

    Result := FieldByName('SUMAPAGADO').AsCurrency;

  finally
    Free;
  end;

end;

function TfrmLiqBeneficiarios.Es_PagoJudicial: boolean;   // Por Plan de Pagos Judiciales
begin
  Result := (ValorSqlEx('SELECT art.dinerarias.is_pagojudicial(:pidexped) FROM dual', [IdExpediente]) = 'S');
end;

procedure TfrmLiqBeneficiarios.Do_CargarCamposDeLegales;    // Por Plan de Pagos Judiciales
var sSql: string;
    sdqQuery: TSDQuery;
begin
  sSql := 'SELECT pj_metodopago, pj_idbanco, pj_enviofondos, pj_tipoenviofondos, pj_idenviofondos, ' +
                ' pj_chequenombre, pj_recibos, pj_observaciones, ' +
                ' pj_tiporecibos, pj_rotro, pj_rcpostal, pj_rcalle, pj_rlocalidad, pj_rprovincia, pj_rnumero, pj_rpiso, pj_rdepartamento ' +
           ' FROM SIN.spj_pagosjudiciales ' +
          ' WHERE pj_idexpediente = :idexped ' +
            ' AND pj_fechabaja IS NULL ';

  sdqQuery := GetQueryEx(sSql, [IdExpediente]);
  with sdqQuery do
  try
  //  DoCargarPropertys_LegalesILP(sdqQuery);
    DoCargarCampos_Legales(sdqQuery);
    DoDeshabilitarCampos_Legales;
  finally
    Free;
  end;
end;

function TfrmLiqBeneficiarios.Get_DecisionLegales: string;   // Por Plan de Pagos Judiciales
begin
  Result := ValorSqlEx('SELECT art.dinerarias.get_decisionlegales(:pidexped) FROM dual', [IdExpediente]);
end;

procedure TfrmLiqBeneficiarios.DoCargarCampos_Legales(sdqQuery: TSDQuery);   // Por Plan de Pagos Judiciales
begin
  with sdqQuery do
  begin
    fraMetodoPago.Codigo := FieldByName('pj_metodopago').AsString;
    fraBanco.Value       := FieldByName('pj_idbanco').AsInteger;
    edEnvio.Text         := FieldByName('pj_enviofondos').AsString;

    if (not FieldByName('pj_tipoenviofondos').IsNull) then
    begin
      if (FieldByName('pj_tipoenviofondos').AsString = 'C') then
        rbCentralFondos.Checked := True
      else if (FieldByName('pj_tipoenviofondos').AsString = 'D') then
        rbDelegacionFondos.Checked := True
      else begin
        rbBancoFondos.Checked   := True;
      end;
    end;

    fraSucursalFondos.Value := FieldByName('pj_idenviofondos').AsInteger;

    EdDesCheq.Text  := FieldByName('pj_chequenombre').AsString;
    edRecibos.Text       := FieldByName('pj_recibos').AsString;
    EdObs.Text        := FieldByName('pj_observaciones').AsString;

   { if (not FieldByName('pj_tiporecibos').IsNull) then
    begin
      if (FieldByName('pj_tiporecibos').AsString = 'D') then
      begin
        rbDomicilio_Recibos.Checked      := true;
        fraDomicilioRecibos.Calle        := FieldByName('pj_rcalle').AsString;
        fraDomicilioRecibos.Numero       := FieldByName('pj_rnumero').AsString;
        fraDomicilioRecibos.Piso         := FieldByName('pj_rpiso').AsString;
        fraDomicilioRecibos.Departamento := FieldByName('pj_rdepartamento').AsString;
        fraDomicilioRecibos.CodigoPostal := FieldByName('pj_rcpostal').AsString;
        fraDomicilioRecibos.Localidad    := FieldByName('pj_rlocalidad').AsString;
        fraDomicilioRecibos.Prov         := StrToInt(FieldByName('pj_rprovincia').AsString);
      end
      else if (FieldByName('pj_tiporecibos').AsString = 'O') then
      begin
        rbOtro_Recibos.Checked     := True;
        MemoOtroRecibos.Lines.Text := FieldByName('pj_rotro').AsString;
      end;
    end;        }

  end;
end;

procedure TfrmLiqBeneficiarios.DoDeshabilitarCampos_Legales;        // Por Plan de Pagos Judiciales
begin
  LockControls([fraMetodoPago, fraBanco, btnEnvio, EdDesCheq, EdObs, edRecibos], True);
end;

procedure TfrmLiqBeneficiarios.DoHabilitarMostrarReserva(bHabilitar: Boolean);   // TK 53237
begin
  mnuMostrarReserva.Enabled := bHabilitar and Seguridad.Activar(mnuMostrarReserva);
end;

procedure TfrmLiqBeneficiarios.mnuMostrarReservaClick(Sender: TObject);   // TK 53237
begin
  mnuMostrarReserva.Checked := not mnuMostrarReserva.Checked;
  Grid.ColumnByField['RESERVAMORTAL'].Visible := mnuMostrarReserva.Checked;
end;

procedure TfrmLiqBeneficiarios.mnuDatosPagoClick(Sender: TObject);       // lo modifico por ticket 53237
begin
  mnuDatosPago.Checked := not mnuDatosPago.Checked;
  DoCargarFinancials;
  Grid.ColumnByField['ORDENNRO'].Visible    := mnuDatosPago.Checked;
  Grid.ColumnByField['ORDENFECHA'].Visible  := mnuDatosPago.Checked;
  Grid.ColumnByField['CHEQUENRO'].Visible   := mnuDatosPago.Checked;
  Grid.ColumnByField['CHEQUEFECHA'].Visible := mnuDatosPago.Checked;
end;

procedure TfrmLiqBeneficiarios.tbDatosPagoClick(Sender: TObject);
begin
  tbDatosPago.CheckMenuDropdown;
end;

{procedure TfrmLiqBeneficiarios.btnCancelarClick(Sender: TObject);
begin
  if msgbox('Desea descartar los cambios?', MB_YESNO + MB_ICONQUESTION) = id_yes then
    fpCartaDocumento2.ModalResult := mrCancel;

end; }

procedure TfrmLiqBeneficiarios.mnuViajarPopup(Sender: TObject);   // habilitación menúes btn Viajar
begin
  mnuBeneficiarios.Enabled   := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuLiqMortBeneficiarios);
  mnuDatosEconomicos.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuLiqIncapacidades);
end;


procedure TfrmLiqBeneficiarios.GenerarLiqManual(Concepto: string; var iNumLiq: integer; cMonto: currency = 0; dDesde: TDateTime = 0; dHasta: TDateTime = 0;
                                                rTasaOriginal: real = 0; rTasaFinal: real = 0; sTipoInt: String = ''; sTipoTasaJus: String = '';
                                                bConTrans: boolean = true);
var sSql, sCampo: string; oILPLiqManual: TILP;
begin

  if Concepto = CONCEPTO_INTERESES_DIN then
    sCampo := 'le_numintereses'
  else
    if Concepto = CONCEPTO_TASA_JUSTICIA_CAMFED then
      sCampo := 'le_numtasajusticia'
    else
      if Concepto = CONCEPTO_COMPENSACIONDANIOS then
        sCampo := 'le_numliqui_compdanios';


  oILPLiqManual := TILP.Create(memDatos.FieldByName('le_siniestro').AsInteger, memDatos.FieldByName('le_orden').AsInteger,
                               memDatos.FieldByName('le_recaida').AsInteger, memDatos.FieldByName('NRO').AsInteger, False, False);

  oILPLiqManual.LiqManual := True;
  oILPLiqManual.ImporteLiquidado := 0;
  oILPLiqManual.LiqCalculada := 0;
  oILPLiqManual.TotalAPagar := 0;
  if Concepto = CONCEPTO_COMPENSACIONDANIOS then
  begin
    oILPLiqManual.MontoCompDanos := cMonto;
    oILPLiqManual.TotalAPagar := cMonto;
    //oILPLiqManual.Concepto := memDatos.FieldByName('le_conpago').AsString;
    //oILPLiqManual.Grado := 'M';
    //oILPLiqManual.Caracter := ' ';
  end
  else
  begin
    oILPLiqManual.ConceptoOtrosPagos := Concepto;
    oILPLiqManual.MontoOtrosPagos := cMonto;
    oILPLiqManual.PeriodoTipo := ptPeriodo_Nuevo;
    oILPLiqManual.Desde := dDesde;
    oILPLiqManual.Hasta := dHasta;
    oILPLiqManual.TasaOriginal := rTasaOriginal;
    oILPLiqManual.TasaFinal := rTasaFinal;
    oILPLiqManual.TipoInteres := sTipoInt;
    oILPLiqManual.TotalAPagar := cMonto;
    oILPLiqManual.MontoCompDanos := 0;
    oILPLiqManual.MontoPagoAdic := 0;
  end;

  if bConTrans then BeginTrans;
  Try

    if oILPLiqManual.Grabar(l_alta, false, tTipoCheck) then
    begin
      iNumLiq := oILPLiqManual.NroLiquidacion;
      sSql   := 'UPDATE sle_liquiempsin ' +
                  ' SET ' + sCampo + ' = :Num ' +
                ' WHERE le_id = :idliq ';

      EjecutarSqlSTEx(sSql, [oILPLiqManual.NroLiquidacion, memDatos.FieldByName('le_id').AsInteger]);

      if bConTrans then
        CommitTrans;

      {if (MsgBox('Alta efectuada correctamente' + #13 +'¿Quiere imprimir la liquidación ahora?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
      begin
        ssql := 'SELECT distinct eb_grupofamiliar' +
                '  FROM ART.SLE_LIQUIEMPSIN, ART.SBL_BENEFICIARIOLIQUIDACION, ART.SEB_BENEFICIARIOS' +
                ' WHERE LE_ID = :IDLIQ' +
                '   AND BL_SINIESTRO = LE_SINIESTRO' +
                '   AND BL_ORDEN = LE_ORDEN' +
                '   AND BL_RECAIDA = LE_RECAIDA' +
                '   AND BL_NUMLIQ = LE_NUMLIQUI' +
                '   AND EB_SINIESTRO = BL_SINIESTRO' +
                '   AND EB_ORDEN = BL_ORDEN' +
                '   AND EB_RECAIDA = BL_RECAIDA' +
                '   AND EB_CODIGO = BL_BENEFICIARIO';

        DoImprimirMortal(Siniestro, Orden, Recaida, iNumLiq, StrToInt(oILPLiqManual.Concepto), 2,
                         ValorSqlEx(sSql, [oILPLiqManual.IdLiquidacion]),
                         IIF(ValorSqlEx('select LE_TIPOBENEFICIARIO from sle_liquiempsin where le_id = :idliq', [oILPLiqManual.IdLiquidacion]) = 'R', true, false));
      end;}

    end;

    memDatos.Refresh;
    tbRefrescarClick(nil);

  except
    on E: Exception do
    begin
      if bConTrans then
      begin
        RollBack;
        ErrorMsg(E, 'Ha surgido un error al insertar la liquidación');
      end;
    end;
  end;
  oILPLiqManual.Free;

end;

function TfrmLiqBeneficiarios.getMontoCompensacionDanos(sCodBenef, sGrupoFliar: String; eImporteLiq: Extended = 0; eMontoPagoAdic: Extended = 0; bAutomatica: boolean = false; ePorc: Extended = 0): Extended;
var cuSuma, cuMontoMinimo, cuImporteAPagar, cuPorcentBenef: Extended;    // TK 51653: cambie el tipo de dato de Currency a Extended porque cuando calculaba el porcentaje desde la consulta Sql, daba una cifra menos.
    sSql: String;
begin
  //cuPorcentSumaBenef := 0;
    // Esta es la suma de las liquidaciones Capital + Adicional de los beneficiarios del mismo grupo.
  {sSql     := ' SELECT sum(Importe) ' +
                ' FROM ( SELECT a.le_imporperi Importe ' +
                         ' FROM art.sle_liquiempsin a, art.sbl_beneficiarioliquidacion, art.seb_beneficiarios, art.scp_conpago ' +
                         cSqlWhereBenef +
                        ' GROUP BY bl_numliq, a.le_conpago, a.le_imporperi ) ';
  cuSuma := ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, sCodBenef, sGrupoFliar]);

  if not bAutomatica then
  begin
  // llevo esa suma al 100 %
  // Debo primero saber qué porcentaje suman el/los beneficiario/s:
  sSql := 'SELECT SUM(bl_porcentaje) ' +
           ' FROM art.sbl_beneficiarioliquidacion ' +
          ' WHERE bl_siniestro = :sin ' +
            ' AND bl_orden = :orden ' +
            ' AND bl_recaida = :reca ' +
            ' AND bl_numliq = :liq ';
  cuPorcentSumaBenef := ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, memDatos.FieldByName('nro').AsInteger]);
  end
  else
    for i := 0 to LstLiquidaciones.Items.Count - 1 do
      cuPorcentSumaBenef := cuPorcentSumaBenef + StrToFloat(LstLiquidaciones.Items.Item[i].SubItems.Strings[1]);

  cuPorcentSumaBenef := cuPorcentSumaBenef * 100;   // Porcentaje de las liq. de los beneficiarios

  cuImporte100Porc   := RoundNumber((cuSuma * 100 / cuPorcentSumaBenef), 2); // Llevo el total de Adicional + Capital, al 100 % y le agrego el Pago Adicional si es que corresponde

  cuImporteAPagar    := RoundNumber(((cuImporte100Porc + eMontoPagoAdic) * 0.2), 2); }  // A eso le saco el 20 % que sería el importe a pagar total (que se reparte entre todos los beneficiarios)

  {sSql := 'SELECT NVL(SUM(le_imporperi), 0)' +
          '  FROM art.sle_liquiempsin, art.scp_conpago, art.sbl_beneficiarioliquidacion, art.seb_beneficiarios' +
          ' WHERE le_conpago = cp_conpago' +
          '   AND le_idexpediente = :idexp' +
          '   AND le_tipoliqui = ''I''' +
          '   AND NVL(le_estado, '' '') NOT IN(''A'', ''X'')' +
          '   AND cp_permite_compdanios_mortal = ''S''' +
          '   AND le_numliqui_compdanios IS NULL' +
          '   AND le_imporperi > 0' +
          '   AND bl_siniestro = le_siniestro' +
          '   AND bl_orden = le_orden' +
          '   AND bl_recaida = le_recaida' +
          '   AND bl_numliq = le_numliqui' +
          '   AND eb_siniestro = bl_siniestro' +
          '   AND eb_orden = bl_orden' +
          '   AND eb_recaida = bl_recaida' +
          '   AND eb_codigo = bl_beneficiario ';
          '   AND eb_codigo = :codbenef' +
          '   AND eb_grupofamiliar = :gfam';

  cuSuma := ValorSqlExtendedEx(sSql, [IdExpediente, sCodBenef, sGrupoFliar]); }

  {sSql := 'SELECT NVL(SUM(le_imporperi - NVL(le_montocompdanios, 0)), 0)' +
          '  FROM art.sle_liquiempsin, art.scp_conpago' +
          ' WHERE le_conpago = cp_conpago' +
          '   AND le_idexpediente = :idexp ' +
          '   AND le_tipoliqui = ''I''' +
          '   AND NVL(le_estado, '' '') NOT IN (''A'', ''X'')' +
          '   AND cp_permite_compdanios_mortal = ''S''' +
          '   AND le_imporperi > 0 ';

  cuSuma := ValorSqlExtendedEx(sSql, [IdExpediente]);}

  sSql        := 'SELECT art.liq.get_montoliqmortal(:Sin, :Ord, :Reca, :Tipo)' +
                  ' FROM dual';
  cuSuma  := ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, 1]) +
             ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, 3]);

  cuImporteAPagar    := RoundNumber(((cuSuma{ + eImporteLiq + eMontoPagoAdic}) * 0.2), 2);
  //Luego me fijo si ese 20% es menor a 70000 (importe Monto Minimo), si es menor, entonces se lleva al importe minimo a pagar.
  //Obtengo el Monto Minimo para luego compararlo:

  sSql := 'SELECT art.dinerarias.get_montocompensacion(''M'' , to_date(''' + sdqBusquedaEX_FECHAACCIDENTE.AsString + ''', ''dd/mm/yyyy'')) FROM dual';

 { sSql := ' SELECT lo_montomin ' +
            ' FROM art.slo_liqcompdanios ' +
           ' WHERE ((lo_vigenciahasta IS NULL) OR (lo_vigenciahasta > art.actualdate)) ' +
             ' AND lo_vigenciadesde < art.actualdate ';      }
  cuMontoMinimo := ValorSqlExtended(sSql);

  if (cuImporteAPagar < cuMontoMinimo) then     // si el 20% no llega al monto minimo a pagar, entonces se paga el monto minimo a pagar (los 70000 en un ppio.)
    cuImporteAPagar := cuMontoMinimo;

  cuPorcentBenef := ePorc;
  if cuPorcentBenef = 0 then           //es manual
  begin
    sSql := 'SELECT sum(bl_porcentaje) ' +
             ' FROM art.sbl_beneficiarioliquidacion ' +
            ' WHERE bl_siniestro = :sin ' +
              ' AND bl_orden = :orden ' +
              ' AND bl_recaida = :reca ' +
              ' AND bl_numliq = :liq ';

    cuPorcentBenef := ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, NroLiquidacion]);
  end;

  //cuImporteLiqPorBenef := RoundNumber((cuImporteAPagar * cuPorcentSumaBenef / 100), 2);  // Importe total que va a tener la liquidación para los beneficiarios que estén incluidos en la misma

  getMontoCompensacionDanos := cuImporteAPagar * cuPorcentBenef;

end;


function TfrmLiqBeneficiarios.DoValidarGeneraCompDanos(sAutomatica: string): boolean;
var sError: String;
begin

  sError := ValorSqlEx('select ART.DINERARIAS.get_generacompdanios(:idexp, :conpago, :tipoinca, :autom, :benef, :grfam) from dual',
                [IdExpediente, GetConcepto(STipo), 'M', sAutomatica, sdqConsultaParent.FieldByName('codBenef').AsString,
                 sdqConsultaParent.FieldByName('grupo_fam').AsString]);

  if sAutomatica = 'N' then
  begin
    if memDatos.FieldByName('le_conpago').AsInteger <> 8 then
      sError := 'La compensación por daños se debe generar sobre la indemnización'
    else if memDatos.FieldByName('le_numliqui_compdanios').AsString <> '' then
      sError := 'La compensación ya ha sido generada'
    else if memDatos.FieldByName('le_subtotal').AsCurrency <= 0 then
      sError := 'El monto debe ser mayor a 0'
    else if (memDatos.FieldByName('le_estado').AsString = 'A') or
       (memDatos.FieldByName('le_estado').AsString = 'X') then
      sError := 'La liquidación no debe estar Anulada ni Aprobada(Cancelada)';
  end;

  Result := sError = '';

  if (sAutomatica = 'N') and (sError <> '') then
    MsgBox(sError);

end;


function TfrmLiqBeneficiarios.DoValidarGeneraPagoUnico(sCodBenef, sGrupoFliar: String): boolean;
begin
  Result := (ValorSqlEx('select ART.DINERARIAS.GET_CONCEPTORELACIONADO(:CONPAGO) from dual', [GetConcepto(STipo)]) <> '') and
             (not ExisteSqlEx('SELECT 1' +
                            '  FROM art.sle_liquiempsin, art.scp_conpago, art.sbl_beneficiarioliquidacion, art.seb_beneficiarios' +
                            ' WHERE le_conpago = cp_conpago' +
                            '   AND le_idexpediente = :idexp' +
                            '   AND le_tipoliqui = ''I''' +
                            '   AND NVL(le_estado, '' '') NOT IN(''A'', ''X'')' +
                            '   AND cp_permite_compdanios_mortal = ''S''' +
                            '   AND le_numliqui_compdanios IS NULL' +
                            '   AND le_imporperi > 0' +
                            '   AND bl_siniestro = le_siniestro' +
                            '   AND bl_orden = le_orden' +
                            '   AND bl_recaida = le_recaida' +
                            '   AND bl_numliq = le_numliqui ' +
                            '   AND eb_siniestro = bl_siniestro' +
                            '   AND eb_orden = bl_orden' +
                            '   AND eb_recaida = bl_recaida' +
                            '   AND eb_codigo = bl_beneficiario ' +
                            '   AND eb_codigo = :codbenef' +
                            '   AND eb_grupofamiliar = :gfam' +
                            '   AND ((le_conpago = ''55'') OR ' +
                            '       (NVL(le_montopagoadic, 0) > 0)) ', [IdExpediente, sCodBenef, sGrupoFliar]));

end;


function TfrmLiqBeneficiarios.getMontoPagoAdicional(bAutomatica: boolean = false; iItem: integer = 0): Extended;
var cuPorcentSumaBenef: Extended;
    sSql: String;
begin
  if not bAutomatica then
  begin
    // llevo esa suma al 100 %
    // Debo primero saber qué porcentaje suman el/los beneficiario/s de esa liquidación:
    sSql := 'SELECT SUM(bl_porcentaje) ' +
             ' FROM art.sbl_beneficiarioliquidacion ' +
            ' WHERE bl_siniestro = :sin ' +
              ' AND bl_orden = :orden ' +
              ' AND bl_recaida = :reca ' +
              ' AND bl_numliq = :liq ';
    cuPorcentSumaBenef := ValorSqlExtendedEx(sSql, [Siniestro, Orden, Recaida, memDatos.FieldByName('nro').AsInteger]);
  end
  else
    cuPorcentSumaBenef := StrToFloat(LstLiquidaciones.Items.Item[iItem].SubItems.Strings[1]);

  getMontoPagoAdicional := ValorSqlEx('select liq.get_montoliqmortal(:sin, :ord, :rec, 1) from dual',
                                      [Siniestro, Orden, Recaida]) * cuPorcentSumaBenef;
end;

function TfrmLiqBeneficiarios.ValidarModifValores: Boolean;
begin
  Verificar(EdNewImporte.Value > memDatos.FieldByName('le_subtotal').AsCurrency, EdNewImporte, 'El monto no puede ser mayor al anterior');
  Verificar(EdNewPA.Value > memDatos.FieldByName('le_montopagoadic').AsCurrency, EdNewPA, 'El monto no puede ser mayor al anterior');
  Verificar(EdNewCD.Value > memDatos.FieldByName('le_montocompdanios').AsCurrency, EdNewCD, 'El monto no puede ser mayor al anterior');
  Verificar(Trim(EdMotCancel.Text) = '', EdMotCancel, 'Debe ingresar un motivo para el cambio del importe de la liquidación');
  ValidarModifValores := True;

end;

procedure TfrmLiqBeneficiarios.CalcTotalEditarImporte;
begin
  edNewTotal.Value := EdNewImporte.Value + EdNewPA.Value + EdNewCD.Value;
end;

procedure TfrmLiqBeneficiarios.tbModificarClick(Sender: TObject);
begin
  Accion := l_Reliquidacion;
  if HayRegistroActivo then
    DoModifLiqMortales; // Plan Reliquidaciones Automáticas
end;

function TfrmLiqBeneficiarios.HayRegistroActivo: Boolean;
begin
  Result := memDatos.Active and not(memDatos.IsEmpty);
end;

procedure TfrmLiqBeneficiarios.DoModifLiqMortales;
const sLeyendaValid = 'No se puede realizar la modificación: ' + #13#10;
begin
  if (memDatos.FieldByName('LE_ESTADO').asString = 'E') and
     not AreIn(memDatos.FieldByName('LE_TIPOLIQUI').AsString, ['W', 'X', 'Y', 'Z']) and
     (Seguridad.Claves.IsActive('Modificar_LiquidacionesAprobadas')) then
  begin
     if not LiqPoseeChequeGenerado_Mortales then
       Msgbox(sLeyendaValid + 'La liquidación no posee un cheque generado.')
     else if LiqExisteEnCircuitoOP_Mortales then
       Msgbox(sLeyendaValid + 'La liquidación ya se encuentra incluida en el proceso de cambio de Orden de Pago.')
     else begin
       FPnConfirmaResult.ShowModal;
     end;
  end
  else
    MsgBox('Esta liquidación no es apta para ser modificada ó Ud. no posee permisos para realizarla.');
end;

function TfrmLiqBeneficiarios.LiqExisteEnCircuitoOP_Mortales: Boolean;
var sSql: string;
begin
  sSql := 'SELECT 1 ' +
            ' FROM din.dml_modifliquidacion ' +
           ' WHERE ml_fechabaja is null ' +
             ' AND ml_idexpediente = :idexp ' +
             ' AND ml_numliqui = :numliq ' +
             ' AND ml_tablaliqui = ''SLE'' ';
  Result := ExisteSqlEx(sSql, [memDatos.FieldByName('LE_IDEXPEDIENTE').AsInteger, memDatos.FieldByName('NRO').AsInteger]);
end;

function TfrmLiqBeneficiarios.LiqPoseeChequeGenerado_Mortales: Boolean;
begin
  Result := not memDatos.FieldByName('IDCHEQUEEMITIDO').IsNull;
end;

procedure TfrmLiqBeneficiarios.Do_CompletarCamposReliquidacion;   // Completa los campos con los valores que posee en la liquidacion. (Plan Reliquidaciones automaticas)
var sSql:string;
begin
  // Completo los beneficiarios
  LstLiquidaciones.Items.Clear;
  sSql := ' SELECT eb_nombre beneficiario ' +
            ' FROM sbl_beneficiarioliquidacion, ART.SEB_BENEFICIARIOS ' +
           ' WHERE bl_siniestro = eb_siniestro ' +
             ' AND bl_orden = eb_orden ' +
             ' AND bl_recaida = eb_recaida ' +
             ' AND bl_beneficiario = eb_codigo ' +
             ' AND bl_siniestro = :sini ' +
             ' AND bl_orden = :orden ' +
             ' AND bl_recaida = :reca ' +
             ' AND bl_numliq = :liqui ';
  with GetQueryEx(SSql, [Siniestro, Orden, Recaida, memDatos.FieldByName('NRO').AsInteger]) do
  try
    while not Eof do
    begin
      LstLiquidaciones.AddItem(FieldByName('BENEFICIARIO').AsString, self);
      next;
    end;
  finally
    Free;
  end;

  sSql := ' SELECT LE_CHEQUENOMBRE, LE_DELEGACION, LE_METODOPAGO, LE_ENVIOFONDOS, LE_IDBANCO, LE_TIPOENVIOFONDOS,' +
                 ' LE_IDENVIOFONDOS, LE_RECIBOS ' +
            ' FROM ART.SLE_LIQUIEMPSIN ' +
           ' WHERE LE_SINIESTRO = :sini ' +
             ' AND LE_ORDEN = :orden ' +
             ' AND LE_RECAIDA = :recaida ' +
             ' AND LE_NUMLIQUI = :liqui ';
   with GetQueryEx(sSql, [Siniestro, Orden, Recaida, memDatos.FieldByName('NRO').AsInteger]) do
   try
     EdDesCheq.Text          := FieldByName('LE_CHEQUENOMBRE').AsString;
     fraDelegacionLiq.Codigo := FieldByName('LE_DELEGACION').AsString;
     fraMetodoPago.Codigo    := FieldByName('LE_METODOPAGO').AsString;
     edEnvio.Text            := FieldByName('LE_ENVIOFONDOS').AsString;
     fraBanco.Value          := FieldByName('LE_IDBANCO').AsInteger;
     edRecibos.Text          := FieldByName('LE_RECIBOS').AsString;

     rbDelegacionFondos.Checked := False;
     rbCentralFondos.Checked    := False;
     rbBancoFondos.Checked      := False;

   {  if FieldByName('LE_TIPOENVIOFONDOS').AsString = 'D' then
       rbDelegacionFondos.Checked := True
     else if FieldByName('LE_TIPOENVIOFONDOS').AsString = 'C' then
       rbCentralFondos.Checked := True
     else if not FieldByName('LE_TIPOENVIOFONDOS').IsNull then
       rbBancoFondos.Checked := True;  }

   finally
     Free;
   end;

end;

procedure TfrmLiqBeneficiarios.tbGuardarReliqClick(Sender: TObject);
var sSql:string;
begin
  if ValidarDatos then
  begin
    Try
      BeginTrans;

      sSql := ' INSERT into din.dml_modifliquidacion ' +
                ' (ml_idexpediente, ml_numliqui, ml_tablaliqui, ml_metodopago, ml_idbanco, ' +
                 ' ml_enviofondos, ml_tipoenviofondos, ml_idenviofondos, ml_chequenombre, ' +
                 ' ml_recibos, ml_idchequeoriginal, ml_delegacion, ml_tipoliqui, ' +
                 ' ml_usualta, ml_fechaalta) ' +
              ' VALUES ' +
              '(' + SqlInt(memDatos.FieldByName('LE_IDEXPEDIENTE').AsInteger) + ',' + SqlInt(memDatos.FieldByName('NRO').AsInteger) +
              ', ''SLE'', ' + SqlValue(fraMetodoPago.Codigo) + ',' + SqlInt(fraBanco.Value) + ',' +
              SqlValue(edEnvio.Text) + ',' + SqlValue(GetTipoFondos) + ',' + SqlInt(GetCodigoFondos) + ',' +
              SqlValue(EdDesCheq.Text) + ',' +        // ACA hay un tema...
              SqlValue(edRecibos.Text) + ',' + SqlInt(memDatos.FieldByName('idchequeemitido').AsInteger) + ',' +
              SqlValue(fraDelegacionLiq.Codigo) + ',' +     // ACA esta el mismo tema ...
              SqlValue(memDatos.FieldByName('LE_TIPOLIQUI').AsString) + ',' +
              SqlValue(Sesion.UserID) + ', art.actualdate) ';

      EjecutarSqlST(sSql);
      CommitTrans;
      Msgbox('Modificación efectuada correctamente. El caso pasará a ser parte del circuito de cambio de Orden de Pago, para que sea autorizado.');
      FPnConfirmaResult.ModalResult := mrOk;
    Except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;
end;

function TfrmLiqBeneficiarios.IsModifNoAutorizada: boolean;
var sSql:string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM din.dml_modifliquidacion ' +
          ' WHERE ml_idexpediente = :idexp ' +
            ' AND ml_numliqui = :liqui ' +
            ' AND ml_fechaaprob is null ' +
            ' AND ml_tablaliqui = ''SLE'' ' +
            ' AND ml_fechabaja is null ';
  Result := ExisteSqlEx(sSql, [memDatos.FieldByName('LE_IDEXPEDIENTE').AsInteger, memDatos.FieldByName('NRO').AsInteger]);
end;


end.
