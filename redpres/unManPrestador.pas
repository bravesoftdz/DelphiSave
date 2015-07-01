unit unManPrestador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, unfraPrestador, StdCtrls,
  ExtCtrls, Mask, ToolEdit, ArtComboBox, IntEdit, Buttons, Placemnt, artSeguridad, Db, SDEngine, General, CUIT, AnsiSql,
  StrFuncs, Printers, QueryPrint, CurrEdit, RxLookup, Menus, ShortCutControl, Grids, DBGrids, RXDBCtrl, ABMDialog,
  FormPanel, QueryToFile, ExportDialog, SortDlg, PatternEdit, DateUtil, unfraNomenclador, DateComboBox, unfraDireccion,
  unArtFrame, unFraCodigoDescripcion, unFraEmpresa, unArt, unArtDbFrame, unArtDBAwareFrame, ArtDBGrid, ActnList,
  unFraStaticCTB_TABLAS, unFraStaticCodigoDescripcion, unfraCtbTablas, RxMemDS, CheckLst, ARTCheckListBox, unComunes,
  JvExDBGrids, JvDBGrid, SinEdit, Variants, JvExControls, JvComponent, JvDBLookup, unfraEstablecimiento, DBCtrls,
  ValFuncs, JvExExtCtrls, JvNetscapeSplitter, unFraDomicilio, unFraDomicilioGIS, unFraEstudio, JvExStdCtrls, JvCheckBox,
  unRedPres, unFraNavegadorWEB, unfraDelegacion, DBClient, RxPlacemnt,
  RxCurrEdit, RxToolEdit, unfraZonasPrestador;

type
   TAccion = (None, Alta , Edicion, Baja);
   TfrmManPrestador = class(TForm)
    actAgregarConv: TAction;
    actEliminarConv: TAction;
    actExportarConv: TAction;
    actImprimirConv: TAction;
    ActionListAMP: TActionList;
    actOrdenarConv: TAction;
    Bevel1: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Bevel2: TBevel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    BevelAbm: TBevel;
    btnAceptarContrato: TButton;
    btnAceptarDatosPrestaciones: TButton;
    btnAceptarEmpresaPreocup: TButton;
    btnAceptarEmpresas: TButton;
    btnAceptarEstudio: TButton;
    btnAceptarPreocup: TButton;
    btnAceptarPresup: TButton;
    btnAceptarRel: TBitBtn;
    btnAceptarVigencia: TButton;
    btnAgregarEmpresa: TButton;
    btnAgregarPreocup: TBitBtn;
    btnAgregarRegion: TBitBtn;
    btnAsignarCP: TButton;
    btnCancelar: TBitBtn;
    btnCancelarAsigCP: TButton;
    btnCancelarContrato: TButton;
    btnCancelarCP: TButton;
    btnCancelarDatosPrestaciones: TButton;
    btnCancelarEmpresaPreocup: TButton;
    btnCancelarEmpresas: TButton;
    btnCancelarEstudio: TButton;
    btnCancelarPreocup: TButton;
    btnCerrarPresup: TButton;
    btnCerrarRegion: TBitBtn;
    btnEspCancelar: TBitBtn;
    btnEspGuardar: TBitBtn;
    btnFiltrar: TButton;
    btnGuardar: TBitBtn;
    btnNomAceptar: TButton;
    btnNomCancelar: TButton;
    btnPracticas: TBitBtn;
    btnQuitarPreocup: TBitBtn;
    btnQuitarRegion: TBitBtn;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    bvNomBottom: TBevel;
    bvNomMid: TBevel;
    bvNomTop: TBevel;
    cBarValNomenclador: TCoolBar;
    chkActaAutoridadesABM: TJvCheckBox;
    chkAmbulancia: TCheckBox;
    chkAnestesia: TCheckBox;
    chkAuditable: TCheckBox;
    chkCargaValores: TCheckBox;
    chkContratoART: TCheckBox;
    chkContratoMutualVig: TCheckBox;
    chkContratoSocialABM: TCheckBox;
    chkCronicos: TCheckBox;
    chkDocumento: TCheckBox;
    chkDocumentoABM: TCheckBox;
    chkElectromiograma: TCheckBox;
    chkFactura: TCheckBox;
    chkFKT: TCheckBox;
    chkGuardiaAct: TCheckBox;
    chkGuardiaActEsp: TCheckBox;
    chkGuardiaPas: TCheckBox;
    chkGuardiaPasEsp: TCheckBox;
    chkHIV: TCheckBox;
    chkIngBrutos: TCheckBox;
    chkIVADiscr: TCheckBox;
    chkMedExtraABM: TCheckBox;
    chkMedicacionExtra: TCheckBox;
    chkNuevoAMP: TCheckBox;
    chkPresupuestoAMP: TCheckBox;
    chkRenovAutomABM: TCheckBox;
    chkRenovAutomatica: TCheckBox;
    chkResonancia: TCheckBox;
    chkRetCajaMedico: TCheckBox;
    chkRX: TCheckBox;
    chkSoloGBA: TCheckBox;
    chkSumaModulos: TCheckBox;
    chkSumaModulosABM: TCheckBox;
    chkTAC: TCheckBox;
    chkTransfAut: TCheckBox;
    chkVisible: TCheckBox;
    chkVP_ABONA_RETORNO: TCheckBox;
    chkVP_DEFAULT: TCheckBox;
    clbLocalidadesAsignadas: TARTCheckListBox;
    clbLocalidadesSinAsignar: TARTCheckListBox;
    cmbCaracter: TArtComboBox;
    cmbEspecialidad: TArtComboBox;
    cmbIngBrutConcepto: TArtComboBox;
    cmbIVA: TArtComboBox;
    cmbPresupuesto: TJvDBLookupCombo;
    cmbRetDeGanacias: TArtComboBox;
    cmbTipoComprobante: TArtComboBox;
    cmbTipoPrestador: TArtComboBox;
    CmdAceptarVUM: TButton;
    CoolBar: TCoolBar;
    CoolBar1: TCoolBar;
    CoolBar2: TCoolBar;
    CoolBar3: TCoolBar;
    CoolBar4: TCoolBar;
    CoolBar5: TCoolBar;
    CoolBarEsp: TCoolBar;
    dbgContratos: TRxDBGrid;
    dbgEmpresas: TRxDBGrid;
    dbgGrillaEsp: TRxDBGrid;
    dbgValNomenclador: TArtDBGrid;
    dbgValoresConvenio: TRxDBGrid;
    dBGVUM: TRxDBGrid;
    dcDesdePresup: TDateComboBox;
    dcFechaRevision: TDateComboBox;
    dcHastaPresup: TDateComboBox;
    dcVigDesdePreocup: TDateComboBox;
    dcVigHastaPreocup: TDateComboBox;
    dcVtoGanancias: TDateComboBox;
    dcVtoIngBrutos: TDateComboBox;
    edFechaViaticoEstadia: TDateComboBox;
    edFechaViaticoKM: TDateComboBox;
    dedVigenciaHasta: TDateComboBox;
    dgExamenes: TRxDBGrid;
    dgExamenesDetalle: TRxDBGrid;
    dgRegiones: TRxDBGrid;
    dgValoresExamenes: TJvDBGrid;
    dsCaracter: TDataSource;
    dsContratos: TDataSource;
    dsDescEspecialidad: TDataSource;
    dsDetalleExamen: TDataSource;
    dsEmpresas: TDataSource;
    dsEmpresasPresupuestoAMP: TDataSource;
    dsEspecialidades: TDataSource;
    dsExamenes: TDataSource;
    dsIngBrutConceptos: TDataSource;
    dsIVA: TDataSource;
    dsPrestCP: TDataSource;
    dsPresupuestosAMP: TDataSource;
    dsRegiones: TDataSource;
    dsRetDeGanacias: TDataSource;
    dsSolicitudPresupuesto: TDataSource;
    dsTipoComprobante: TDataSource;
    dsTipoPrestador: TDataSource;
    dsValNomenclador: TDataSource;
    dsValoresExamen: TDataSource;
    dsValoresPrestaciones: TDataSource;
    dsValoresPrestador: TDataSource;
    DSVUMed: TDataSource;
    edAislamTI: TIntEdit;
    edAsistencial: TIntEdit;
    edBonificacion: TCurrencyEdit;
    edCantExa: TIntEdit;
    edCantidadPresup: TIntEdit;
    edCA_ACTIVIDAD: TIntEdit;
    edConsExt: TIntEdit;
    edCPFiltro: TEdit;
    edDescPreocup: TEdit;
    edDesdeAct: TMaskEdit;
    edDesdeActEsp: TMaskEdit;
    edDesdePas: TMaskEdit;
    edDesdePasEsp: TMaskEdit;
    edDiasVenci: TIntEdit;
    edDomicilio: TEdit;
    edEMail: TEdit;
    edExamenSel: TEdit;
    edFactDesdeABM: TIntEdit;
    edFactHastaABM: TIntEdit;
    edFacturaDesde: TIntEdit;
    edFacturaHasta: TIntEdit;
    edFax: TEdit;
    edFImprFormInscripc: TDateComboBox;
    edGuardia: TIntEdit;
    edHastaAct: TMaskEdit;
    edHastaActEsp: TMaskEdit;
    edHastaPas: TMaskEdit;
    edHastaPasEsp: TMaskEdit;
    edIdentif: TIntEdit;
    edlgContratos: TExportDialog;
    edlgEmpresas: TExportDialog;
    edlgExamenes: TExportDialog;
    edlgPrestCP: TExportDialog;
    edlgValMomenclador: TExportDialog;
    edlgValMomencladorAMP: TExportDialog;
    edlgValUnMedicas: TExportDialog;
    edLimite: TIntEdit;
    EdMatProfesional: TEdit;
    edMatricula: TEdit;
    edMultiplicadorGs: TCurrencyEdit;
    edNFantasia: TEdit;
    edNomGastos: TCurrencyEdit;
    edNomHonorarios: TCurrencyEdit;
    edNomMultiplicador: TCurrencyEdit;
    edNomValor: TCurrencyEdit;
    edNomValorVUM: TCurrencyEdit;
    edObservABM: TMemo;
    edObservaciones: TMemo;
    edObservacionesContrato: TMemo;
    edObservacionesEmp: TMemo;
    edPiso: TIntEdit;
    edPlazoDebitos: TIntEdit;
    edPLazoRefacABM: TIntEdit;
    edPlazoRefacturacion: TIntEdit;
    edPP_DESCRIPCION: TEdit;
    edPP_VIGENCIADESDE: TDateComboBox;
    edPP_VIGENCIAHASTA: TDateComboBox;
    edPrestMutual: TIntEdit;
    edQSesiones: TIntEdit;
    edQuirofano: TIntEdit;
    edRanking: TEdit;
    EdRegionSanitaria: TEdit;
    edResponsable: TEdit;
    edRSocial: TEdit;
    edSecuencia: TIntEdit;
    edSRayos: TIntEdit;
    edCelular: TEdit;
    edTI: TIntEdit;
    edTIUnidCor: TIntEdit;
    edTrabajadorPresup: TEdit;
    edValNomVigDesde: TDateComboBox;
    edValNomVigHasta: TDateComboBox;
    edValorEstadia_Presupuesto: TRxCalcEdit;
    edValorExamen: TCurrencyEdit;
    edValorKM_Presupuesto: TRxCalcEdit;
    edValorPres: TRxCalcEdit;
    edValorPresup: TCurrencyEdit;
    edViaticoEstadia: TRxCalcEdit;
    edViaticoKM: TRxCalcEdit;
    edVigDesdeABM: TDateComboBox;
    edVigencia: TDateComboBox;
    edVigenciaDesdeCont: TDateComboBox;
    edVigenciaDesdeEmp: TDateComboBox;
    edVigenciaHastaCont: TDateComboBox;
    edVigenciaHastaEmp: TDateComboBox;
    edVigHastaABM: TDateComboBox;
    edVP_MONTO_MINIMO: TCurrencyEdit;
    edVP_SUMA_FIJA: TCurrencyEdit;
    ExportDialogEsp: TExportDialog;
    FormPlacement: TFormPlacement;
    fpABMContratos: TFormPanel;
    fpABMNomenclador: TFormPanel;
    fpABMPresupuesto: TFormPanel;
    fpABMVUMed: TFormPanel;
    fpAgregarEstudio: TFormPanel;
    fpAltaEmpresaPreocup: TFormPanel;
    fpAsignacionLocalidades: TFormPanel;
    fpBaja: TFormPanel;
    fpDialogEmpresas: TFormPanel;
    fpEspecialidades: TFormPanel;
    fpExamenPreocup: TFormPanel;
    fpRegiones: TFormPanel;
    fpValoresPrestaciones: TFormPanel;
    fpVigenciaHasta: TFormPanel;
    fraCartillaWeb: TfraCtbTablas;
    fraDireccionPrest: TfraDomicilioGIS;
    fraEmpresaEmp: TfraEmpresa;
    fraEmpresaExamen: TfraEmpresa;
    fraEmpresaPresupuestoAMP: TfraEmpresa;
    fraEstabExamen: TfraEstablecimiento;
    fraEstudioPreocup: TfraEstudio;
    fraLocalidades: TfraCodigoDescripcion;
    fraNomencladorABM: TfraNomenclador;
    fraNomencladorPresup: TfraNomenclador;
    fraPP_IDESTABLECIMIENTO: TfraEstablecimiento;
    fraPrestadorRel: TfraPrestador;
    fraPrestadorSel: TfraPrestador;
    fraProvinciasCP: TfraCodigoDescripcion;
    fraRegiones: TfraCtbTablas;
    fraTipoContratoABM: TfraCtbTablas;
    fraUnidad: TfraCodigoDescripcion;
    gbCamas: TGroupBox;
    gbDatosContables: TGroupBox;
    gbDatosPresupuesto: TGroupBox;
    gbPresRel: TGroupBox;
    gbPrestador: TGroupBox;
    gbViaticos: TGroupBox;
    grdAMP: TRxDBGrid;
    grdCPostales: TRxDBGrid;
    GridEmpresas: TRxDBGrid;
    GridPresupuestosDetalle: TRxDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label76: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAuislamientoTerInt: TLabel;
    lbBonificacion: TLabel;
    lbCaracter: TLabel;
    lbCodAsistencial: TLabel;
    lbCodMutual: TLabel;
    lbConcepto: TLabel;
    lbConsExt: TLabel;
    lbCUIT: TLabel;
    lbDatosUtiles: TLabel;
    lbDesde: TLabel;
    lbDiasVenc: TLabel;
    lbDomicilio: TLabel;
    lbEMail: TLabel;
    lbEspCodigo: TLabel;
    lbEspObservaciones: TLabel;
    lbFImpresionFormInscripcion: TLabel;
    lbGanancias: TLabel;
    lbGuardia: TLabel;
    lbHasta: TLabel;
    lbIdentificar: TLabel;
    lbIngresosBrutos: TLabel;
    lbIVA: TLabel;
    lblCantidadEstudios: TLabel;
    lbLimite: TLabel;
    lblMatricula: TLabel;
    lblNroEstudio: TLabel;
    LblQSesiones: TLabel;
    lbNomFantasia: TLabel;
    lbNomPrestacion: TLabel;
    lbNomVigDesde: TLabel;
    lbNomVigHasta: TLabel;
    lbNroPresupuesto: TLabel;
    lbObservaciones: TLabel;
    lbObservacionesEmp: TLabel;
    lbPiso: TLabel;
    lbPlazoDebito: TLabel;
    lbQuirofanos: TLabel;
    lbRanking: TLabel;
    lbResponsable: TLabel;
    lbRSocial: TLabel;
    lbSalaDeRayos: TLabel;
    lbSecuencia: TLabel;
    lbTelefono: TLabel;
    lbTerapiaIntensiva: TLabel;
    lbTerIntUnidadCoronaria: TLabel;
    lbTipoComprobante: TLabel;
    lbTipoPrestador: TLabel;
    lbVigenciaDesdeEmp: TLabel;
    lbVigenciaHastaEmp: TLabel;
    lupSolicitudPresupuesto: TJvDBLookupCombo;
    mnuAgregar: TMenuItem;
    mnuCUIT: TMenuItem;
    mnuEliminar: TMenuItem;
    mnuExportar: TMenuItem;
    mnuImprimir: TMenuItem;
    mnuNroIngBrutos: TMenuItem;
    mnuOrdenar: TMenuItem;
    mnuTodosExamenes: TMenuItem;
    mnuVigentesExamenes: TMenuItem;
    mnuVisualizarSoloVigentes_Nomenclador: TMenuItem;
    mnuVisualizarTodos_Nomenclador: TMenuItem;
    mObsContables: TMemo;
    mObservaciones: TMemo;
    mskCUIT: TMaskEdit;
    mskIngBrutosNro: TMaskEdit;
    N1: TMenuItem;
    N2: TMenuItem;
    Noseleccionarninguno1: TMenuItem;
    Panel4: TPanel;
    pcDatos: TPageControl;
    pmnuIngBrutos: TPopupMenu;
    pmnuValoresConvenio: TPopupMenu;
    pmuExamenes: TPopupMenu;
    pmuValoresAMP: TPopupMenu;
    pmuVigenciaValoresAMP: TPopupMenu;
    pmuVigenciaValoresNomenclador: TPopupMenu;
    pmuVisualizarSloVigentes: TMenuItem;
    pmuVisualizartodoslosvalores: TMenuItem;
    pnlAccion: TPanel;
    pnlArriba: TPanel;
    pnlDatosAMP: TPanel;
    pnlDetalleEmpresas: TPanel;
    pnlLabelPresupuesto: TPanel;
    pnlPie: TPanel;
    pnlTopAMP: TPanel;
    PrintDialog: TPrintDialog;
    qpContratos: TQueryPrint;
    qpEmpresas: TQueryPrint;
    qpExamenes: TQueryPrint;
    qpPrestCP: TQueryPrint;
    qpValNomenclador: TQueryPrint;
    qpValNomencladorAMP: TQueryPrint;
    QPVUMed: TQueryPrint;
    QueryPrintEsp: TQueryPrint;
    rbMatNacional: TRadioButton;
    rbMatProvincial: TRadioButton;
    rbNomMultiplicador: TRadioButton;
    rbNomOtros: TRadioButton;
    rbNomValor: TRadioButton;
    rxmValoresPrestaciones: TRxMemoryData;
    rxmValoresPrestacioneses_codigo: TStringField;
    rxmValoresPrestacioneses_descripcion: TStringField;
    rxmValoresPrestacioneses_fechabaja: TDateTimeField;
    rxmValoresPrestacionespd_valor: TFloatField;
    rxmValoresPrestacionespd_vigenciadesde: TDateTimeField;
    sccNomenclador: TShortCutControl;
    sdContratos: TSortDialog;
    sdEmpresas: TSortDialog;
    sdExamenes: TSortDialog;
    sdPrestCP: TSortDialog;
    sdqCaracter: TSDQuery;
    sdqContratos: TSDQuery;
    sdqDatos: TSDQuery;
    sdqDatosCA_ACTIVIDAD: TFloatField;
    sdqDatosCA_AMBULANCIA: TStringField;
    sdqDatosCA_ASISTENCIAL: TFloatField;
    sdqDatosCA_AUDITABLE: TStringField;
    sdqDatosCA_AUTI: TFloatField;
    sdqDatosCA_BANCO: TStringField;
    sdqDatosCA_BONIFICACION: TFloatField;
    sdqDatosCA_CALLE: TStringField;
    sdqDatosCA_CALLELEGAL: TStringField;
    sdqDatosCA_CARGAVALORES: TStringField;
    sdqDatosCA_CARTILLAWEB: TStringField;
    sdqDatosCA_CLAVE: TStringField;
    sdqDatosCA_CODPOSTAL: TStringField;
    sdqDatosCA_CODPOSTALA: TStringField;
    sdqDatosCA_CODPOSTALLEGAL: TStringField;
    sdqDatosCA_CONCERTADO: TStringField;
    sdqDatosCA_CONEX: TFloatField;
    sdqDatosCA_CONTRATO: TStringField;
    sdqDatosCA_CONTRATOMUTUAL: TStringField;
    sdqDatosCA_CRONICO: TStringField;
    sdqDatosCA_CTI: TFloatField;
    sdqDatosCA_CUENTA: TStringField;
    sdqDatosCA_DEPARTAMENTO: TStringField;
    sdqDatosCA_DEPARTAMENTOLEGAL: TStringField;
    sdqDatosCA_DESCRIPCION: TStringField;
    sdqDatosCA_DESDEGUARDIAACT: TStringField;
    sdqDatosCA_DESDEGUARDIAPAS: TStringField;
    sdqDatosCA_DIASVENCI: TFloatField;
    sdqDatosCA_DIRELECTRONICA: TStringField;
    sdqDatosCA_DOMICILIO: TStringField;
    sdqDatosCA_EMG: TStringField;
    sdqDatosCA_ESPECIALIDAD: TStringField;
    sdqDatosCA_FAX: TStringField;
    sdqDatosCA_FECHABAJA: TDateTimeField;
    sdqDatosCA_FECHAIMPRESIONFORMINSCR: TDateTimeField;
    sdqDatosCA_FECHAREVISION: TDateTimeField;
    sdqDatosCA_FKT: TStringField;
    sdqDatosCA_GUARDIAACT: TStringField;
    sdqDatosCA_GUARDIAPAS: TStringField;
    sdqDatosCA_GUARDIAS: TFloatField;
    sdqDatosCA_HABILITACIONES: TStringField;
    sdqDatosCA_HABILITADO: TStringField;
    sdqDatosCA_HASTAGUARDIAACT: TStringField;
    sdqDatosCA_HASTAGUARDIAPAS: TStringField;
    sdqDatosCA_IDENTIFICADOR: TFloatField;
    sdqDatosCA_INCLUYENOMENCLADOR: TStringField;
    sdqDatosCA_INGRESOSBRUTOS: TFloatField;
    sdqDatosCA_IVA: TStringField;
    sdqDatosCA_IVADISCRIMINADO: TStringField;
    sdqDatosCA_LAT: TFloatField;
    sdqDatosCA_LIMITE: TFloatField;
    sdqDatosCA_LNG: TFloatField;
    sdqDatosCA_LOCALIDAD: TStringField;
    sdqDatosCA_LOCALIDADLEGAL: TStringField;
    sdqDatosCA_MATPROFESIONAL: TStringField;
    sdqDatosCA_MATRICULA: TStringField;
    sdqDatosCA_NOMBREFANTA: TStringField;
    sdqDatosCA_NUMERO: TStringField;
    sdqDatosCA_NUMEROLEGAL: TStringField;
    sdqDatosCA_OBSERVACIONES: TStringField;
    sdqDatosCA_OBSERVACIONESIMP: TStringField;
    sdqDatosCA_PISO: TFloatField;
    sdqDatosCA_PISOCALLE: TStringField;
    sdqDatosCA_PISOLEGAL: TStringField;
    sdqDatosCA_PRESTADORMUTUAL: TStringField;
    sdqDatosCA_PROVINCIA: TStringField;
    sdqDatosCA_PROVINCIALEGAL: TStringField;
    sdqDatosCA_QUIROFANOS: TFloatField;
    sdqDatosCA_RANKING: TStringField;
    sdqDatosCA_RAYOS: TFloatField;
    sdqDatosCA_RECLADEBITOS: TFloatField;
    sdqDatosCA_RESPONSABLE: TStringField;
    sdqDatosCA_RETENCAJAMED: TStringField;
    sdqDatosCA_RETGANANCIAS: TStringField;
    sdqDatosCA_RETIENEINGBRUTOS: TStringField;
    sdqDatosCA_RETINGRESOSBRUTOS: TStringField;
    sdqDatosCA_RMN: TStringField;
    sdqDatosCA_RX: TStringField;
    sdqDatosCA_SECUENCIA: TFloatField;
    sdqDatosCA_TAC: TStringField;
    sdqDatosCA_TELEFONO: TStringField;
    sdqDatosCA_TIPO: TStringField;
    sdqDatosCA_TIPOCOMPROBANTE: TStringField;
    sdqDatosCA_TIPOCUENTA: TStringField;
    sdqDatosCA_TIPOMATPROFESIONAL: TStringField;
    sdqDatosCA_UCO: TFloatField;
    sdqDatosCA_VISIBLE: TStringField;
    sdqDatosCA_VTOEXCGANANCIAS: TDateTimeField;
    sdqDatosCA_VTOEXCINGBRUTOS: TDateTimeField;
    sdqDatosPROVLEGAL: TStringField;
    sdqDatosPROVPREST: TStringField;
    sdqDescEspecialidad: TSDQuery;
    sdqDetalleExamen: TSDQuery;
    sdqEmpresas: TSDQuery;
    sdqEmpresasPresupuestoAMP: TSDQuery;
    sdqEspecialidades: TSDQuery;
    sdqExamenes: TSDQuery;
    sdqIngBrutConceptos: TSDQuery;
    sdqIVA: TSDQuery;
    sdqPrestCP: TSDQuery;
    sdqPresupuestosAMP: TSDQuery;
    sdqRegiones: TSDQuery;
    sdqRetDeGanacias: TSDQuery;
    sdqRetDeGanaciasTB_CODIGO: TStringField;
    sdqRetDeGanaciasTB_DESCRIPCION: TStringField;
    sdqSolicitudPresupuesto: TSDQuery;
    sdqTipoComprobante: TSDQuery;
    sdqTipoPrestador: TSDQuery;
    sdqValNomenclador: TSDQuery;
    sdqValNomencladorCANTIDAD: TFloatField;
    sdqValNomencladorON_DESCRIPCION: TStringField;
    sdqValNomencladorON_ID: TFloatField;
    sdqValNomencladorSINIESTRO: TStringField;
    sdqValNomencladorVIGENCIAHASTA: TDateTimeField;
    sdqValNomencladorVP_ABONA_RETORNO: TStringField;
    sdqValNomencladorVP_ANESTESIA: TStringField;
    sdqValNomencladorVP_ANTITETANICA: TStringField;
    sdqValNomencladorVP_CAPITULO: TStringField;
    sdqValNomencladorVP_CODIGO: TStringField;
    sdqValNomencladorVP_DEFAULT: TStringField;
    sdqValNomencladorVP_HIV: TStringField;
    sdqValNomencladorVP_MONTO_MINIMO: TFloatField;
    sdqValNomencladorVP_MULTIGASTOS: TFloatField;
    sdqValNomencladorVP_MULTIPLICADOR: TFloatField;
    sdqValNomencladorVP_NOMENCLADOR: TStringField;
    sdqValNomencladorVP_ORDEN: TFloatField;
    sdqValNomencladorVP_PRESTADOR: TFloatField;
    sdqValNomencladorVP_RECAIDA: TFloatField;
    sdqValNomencladorVP_SESIONES: TFloatField;
    sdqValNomencladorVP_SINIESTRO: TFloatField;
    sdqValNomencladorVP_SUMA_FIJA: TFloatField;
    sdqValNomencladorVP_VALOR: TFloatField;
    sdqValNomencladorVP_VALORGASTOS: TFloatField;
    sdqValNomencladorVP_VALORHONORARIOS: TFloatField;
    sdqValNomencladorVP_VIGENCIADESDE: TDateTimeField;
    sdqValoresExamen: TSDQuery;
    sdqValoresPrestaciones: TSDQuery;
    sdqValoresPrestador: TSDQuery;
    SDQVUMed: TSDQuery;
    SDQVUMedUM_DESCRIPCION: TStringField;
    SDQVUMedUP_FECHAALTA: TDateTimeField;
    SDQVUMedUP_FECHAMODIF: TDateTimeField;
    SDQVUMedUP_UNIDAD: TStringField;
    SDQVUMedUP_USUALTA: TStringField;
    SDQVUMedUP_USUMODIF: TStringField;
    SDQVUMedUP_VALOR: TFloatField;
    SDQVUMedUP_VIGENCIADESDE: TDateTimeField;
    SDQVUMedUP_VIGENCIAHASTA: TDateTimeField;
    sdValNomenclador: TSortDialog;
    sdValNomencladorAMP: TSortDialog;
    SDVUMed: TSortDialog;
    Seguridad: TSeguridad;
    Seleccionartodos1: TMenuItem;
    SEP1: TToolButton;
    SEP2: TToolButton;
    SEP3: TToolButton;
    SEP4: TToolButton;
    SeparadorPresupuestos: TJvNetscapeSplitter;
    SEP_NOM1: TToolButton;
    SEP_NOM2: TToolButton;
    ShortCutControl: TShortCutControl;
    SortDialogEsp: TSortDialog;
    spbAsignar: TSpeedButton;
    spbAsignarDatos: TSpeedButton;
    spbDesasignar: TSpeedButton;
    spbSelTodos: TSpeedButton;
    spbSelTodos2: TSpeedButton;
    spbUnSelTodos: TSpeedButton;
    spbUnSelTodos2: TSpeedButton;
    tbAgregar: TToolButton;
    tbAgregarContrato: TToolButton;
    tbAgregarEmpresa: TToolButton;
    tbAgregarEsp: TToolButton;
    tbAgregarNom: TToolButton;
    tbAgregarPreocup: TToolButton;
    tbAgregarPresup: TToolButton;
    tbAgregarPresupuestoAMP: TToolButton;
    tbAgregarUMed: TToolButton;
    tbAltaEmpresaPreocup: TToolButton;
    tbarEspecialidades: TToolBar;
    tbarNomenclador: TToolBar;
    tbAuditable: TToolButton;
    tbAutorizarPreocup: TToolButton;
    tbBajaEmpresaPreocup: TToolButton;
    tbBajaPreocup: TToolButton;
    tbBajaPresupuesto: TToolButton;
    tbCuentasBancarias: TToolButton;
    tbEliminar: TToolButton;
    tbEliminarContrato: TToolButton;
    tbEliminarConv: TToolButton;
    tbEliminarCP: TToolButton;
    tbEliminarEmpresa: TToolButton;
    tbEliminarEsp: TToolButton;
    tbEliminarNom: TToolButton;
    tbEliminarUMed: TToolButton;
    tbExportarContrato: TToolButton;
    tbExportarConv: TToolButton;
    tbExportarCP: TToolButton;
    tbExportarEmpresa: TToolButton;
    tbExportarEsp: TToolButton;
    tbExportarNom: TToolButton;
    tbExportarPreocup: TToolButton;
    tbExportarUMed: TToolButton;
    tbFiltrarConv: TToolButton;
    tbImportar: TToolButton;
    tbImprimir: TToolButton;
    tbImprimirContrato: TToolButton;
    tbImprimirConv: TToolButton;
    tbImprimirCP: TToolButton;
    tbImprimirEmpresa: TToolButton;
    tbImprimirEsp: TToolButton;
    tbImprimirNom: TToolButton;
    tbImprimirPreocup: TToolButton;
    tbImprimirUMed: TToolButton;
    tbIncluirNomenc: TToolButton;
    tbIngresoBrutos: TToolButton;
    tbLimpiar: TToolButton;
    tbMediosTransporte: TToolButton;
    tbModificar: TToolButton;
    tbModificarContrato: TToolButton;
    tbModificarCP: TToolButton;
    tbModificarEmpresa: TToolButton;
    tbModificarEsp: TToolButton;
    tbModificarPreocup: TToolButton;
    tbModificarPresupuestoAMP: TToolButton;
    tbModificarValoresAMP: TToolButton;
    tbNoAuditable: TToolButton;
    tbOrdenarContrato: TToolButton;
    tbOrdenarConv: TToolButton;
    tbOrdenarCP: TToolButton;
    tbOrdenarEmpresa: TToolButton;
    tbOrdenarEsp: TToolButton;
    tbOrdenarNom: TToolButton;
    tbOrdenarPreocup: TToolButton;
    tbOrdenarUMed: TToolButton;
    tbPoliza: TToolButton;
    tbPracticasPrestador: TToolButton;
    tbRegiones: TToolButton;
    tbReplicarNom: TToolButton;
    tbReplicarUMed: TToolButton;
    tbConsultorio: TToolButton;
    tbSolicitudPresupuestos: TToolButton;
    tbVigenciaPreoc: TToolButton;
    ToolBar: TToolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar4: TToolBar;
    ToolBar5: TToolBar;
    ToolBar6: TToolBar;
    ToolBar7: TToolBar;
    ToolBarIngresosBrutos: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton2: TToolButton;
    ToolButton20: TToolButton;
    ToolButton25: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    tsContratos: TTabSheet;
    tsCPActividad: TTabSheet;
    tsDatosEcon: TTabSheet;
    tsDatosGrales: TTabSheet;
    tsDatosMed: TTabSheet;
    tsEmpresas: TTabSheet;
    tsNomenclador: TTabSheet;
    tsPreocupacionales: TTabSheet;
    tsValoresAMP: TTabSheet;
    tsValoresUnidadesMedicas: TTabSheet;
    VigDdeVUM: TDateComboBox;
    VigHtaVUM: TDateComboBox;
    chkContratoSocial: TCheckBox;
    chkActaAutoridades: TJvCheckBox;
    sdqDatosCA_FECHAVTOHABILITACION: TDateTimeField;
    sdqDatosCA_RESPCIVIL: TStringField;
    sdqDatosCA_FECHARESPCIVIL: TDateTimeField;
    tsSiniestros: TTabSheet;
    CoolBar6: TCoolBar;
    ToolBar8: TToolBar;
    tbAgregarSiniestro: TToolButton;
    tbModificarSiniestro: TToolButton;
    tbEliminarSiniestro: TToolButton;
    ToolButton24: TToolButton;
    tbOrdenarSiniestro: TToolButton;
    ToolButton27: TToolButton;
    tbExportarSiniestro: TToolButton;
    tbImprimirSiniestro: TToolButton;
    dbgSiniestros: TRxDBGrid;
    fpDialogSiniestros: TFormPanel;
    Bevel22: TBevel;
    Label70: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    btnAceptarSiniestros: TButton;
    btnCancelarSiniestros: TButton;
    edVigenciaDesdeSin: TDateComboBox;
    edVigenciaHastaSin: TDateComboBox;
    sdqSiniestros: TSDQuery;
    dsSiniestros: TDataSource;
    edObservacionesSin: TMemo;
    pnlSiniestro: TPanel;
    sbtnBuscar: TSpeedButton;
    SinEdit: TSinEdit;
    Label75: TLabel;
    sdSiniestros: TSortDialog;
    edlgSiniestros: TExportDialog;
    qpSiniestros: TQueryPrint;
    chkCVABM: TCheckBox;
    chkTituloABM: TCheckBox;
    chkMatriculaABM: TCheckBox;
    chkCV: TCheckBox;
    chkTitulo: TCheckBox;
    chkMatricula: TCheckBox;
    btnPersonasLote: TBitBtn;
    fpPersonasLote: TFormPanel;
    Bevel23: TBevel;
    Label77: TLabel;
    Label79: TLabel;
    btnCerrarPerLote: TButton;
    dgPersonasLote: TJvDBGrid;
    edNombrePersona: TEdit;
    btnAgregarPerLote: TBitBtn;
    btnQuitarPerLote: TBitBtn;
    edDNIPersona: TEdit;
    dsPersonasLote: TDataSource;
    sdqPersonasLote: TSDQuery;
    tbPersonasLote: TToolButton;
    chkFactAnestesia: TCheckBox;
    sdqDatosCA_FACTURACONANESTESIA: TStringField;
    tbVerHistoricoBajas: TToolButton;
    ToolButton22: TToolButton;
    fpVerHistoricoBajas: TFormPanel;
    btnHistBajaCerrar: TButton;
    lPrestador: TLabel;
    dbgHistBajas: TArtDBGrid;
    dsHistBajas: TDataSource;
    sdqHistBajas: TSDQuery;
    edFechaViaticoGastoEnvio: TDateComboBox;
    Label78: TLabel;
    edViaticoGastoEnvio: TRxCalcEdit;
    Label80: TLabel;
    tbAprobarPresupuesto: TToolButton;
    chkEcografia: TCheckBox;
    sdqDatosCA_ECOGRAFIA: TStringField;
    fraUsuariosContrata: TfraCodigoDescripcion;
    lblUsuarioContrata: TLabel;
    sdqDatosca_gestor: TStringField;
    tbFiltrarValoresUnidMed: TToolButton;
    pmuVigenciaValoresUnidMed: TPopupMenu;
    pmuVisualizarSloVigentesUM: TMenuItem;
    pmuVisualizartodoslosvaloresUM: TMenuItem;
    tbObservLiquidaciones: TToolButton;
    ToolButton23: TToolButton;
    fpObservLiquidaciones: TFormPanel;
    lTituloObserv: TLabel;
    MemoObservLiquidaciones: TMemo;
    btnGuardarObservLiquid: TBitBtn;
    btnCerrarObservLiquid: TBitBtn;
    chkValorDeAMP: TCheckBox;
    Bevel24: TBevel;
    sdqValNomencladorVP_VALORDEAMP: TStringField;
    chkReferente: TCheckBox;
    sdqDatosca_referente: TStringField;
    sdqValNomencladorON_CABECERA: TStringField;
    edMailDebitos: TEdit;
    Label81: TLabel;
    sdqDatosca_maildebitos: TStringField;
    fpBajaVigencia: TFormPanel;
    Bevel26: TBevel;
    Button2: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Label82: TLabel;
    sdqBajaVigencia: TSDQuery;
    dsBajaVigencia: TDataSource;
    chkAntitetanica: TCheckBox;
    chkUnicaLiquidacion: TCheckBox;
    sdqValNomencladorVP_UNICALIQUIDACION: TStringField;
    lblCel: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    edTelNumero: TEdit;
    sdqDatosCA_CELULAR: TStringField;
    sdqDatosCA_CODAREA: TStringField;
    edTelCaract: TEdit;
    sdqDatosCA_CEM: TStringField;
    fraMotivoBaja: TfraCodigoDescripcion;
    Label85: TLabel;
    sdqDatosCA_IDMOTIVOBAJA: TFloatField;
    fpMotivosBaja: TFormPanel;
    Bevel25: TBevel;
    btnAceptarMotBaja: TButton;
    btnCancelarMotBaja: TButton;
    Label86: TLabel;
    fraMotivoBajaFP: TfraCodigoDescripcion;
    gbPrestRS: TGroupBox;
    fraPrestadorRS: TfraPrestador;
    chkTransferir: TCheckBox;
    Label87: TLabel;
    dcFechaBaja: TDateComboBox;
    GroupBox4: TGroupBox;
    fraDireccionCom: TfraDireccion;
    GroupBox5: TGroupBox;
    fraDireccionLegal: TfraDireccion;
    sdqDatosCA_CODPOSTALCOMERCIAL: TStringField;
    sdqDatosCA_LOCALIDADCOMERCIAL: TStringField;
    sdqDatosCA_CALLECOMERCIAL: TStringField;
    sdqDatosCA_NUMEROCOMERCIAL: TStringField;
    sdqDatosCA_PISOCOMERCIAL: TStringField;
    sdqDatosCA_DEPARTAMENTOCOMERCIAL: TStringField;
    sdqDatosCA_PROVINCIACOMERCIAL: TStringField;
    rgEstadoPrest: TRadioGroup;
    sdqEstudiosPorEmpresa: TSDQuery;
    dsEstudiosPorEmpresa: TDataSource;
    grdEstudios: TArtDBGrid;
    sdqPresupDetalle: TSDQuery;
    dsPresupDetalle: TDataSource;
    edIBDescripcion: TEdit;
    lblIBDescripcion: TLabel;
    edIBObservaciones: TEdit;
    lblIBObservaciones: TLabel;
    Bevel27: TBevel;
    fpReplicar: TFormPanel;
    GridReplicar: TArtDBGrid;
    Bevel28: TBevel;
    Button6: TButton;
    Button7: TButton;
    sdqReplicar: TSDQuery;
    dsReplicar: TDataSource;
    sdqReplicarVP_NOMENCLADOR: TStringField;
    sdqReplicarVP_CAPITULO: TStringField;
    sdqReplicarVP_CODIGO: TStringField;
    sdqReplicarVP_VIGENCIADESDE: TDateTimeField;
    sdqReplicarVP_MULTIPLICADOR: TFloatField;
    sdqReplicarVP_HONINTERNADOS: TFloatField;
    sdqReplicarVP_HONAMBULATORIOS: TFloatField;
    sdqReplicarVP_GASTOINTERNADOS: TFloatField;
    sdqReplicarVP_GASTOAMBULATORIOS: TFloatField;
    sdqReplicarVP_VALOR: TFloatField;
    sdqReplicarVP_MULTIGASTOS: TFloatField;
    sdqReplicarVP_SESIONES: TFloatField;
    sdqReplicarVP_ANTITETANICA: TStringField;
    sdqReplicarVP_HIV: TStringField;
    sdqReplicarVP_ANESTESIA: TStringField;
    sdqReplicarVP_PSICOLOGICA: TStringField;
    sdqReplicarCA_IDENTIFICADOR: TFloatField;
    sdqReplicarVP_IDNOMENCLADOR: TFloatField;
    sdqReplicarVP_VALORHONORARIOS: TFloatField;
    sdqReplicarVP_VALORGASTOS: TFloatField;
    sdqReplicarVP_DEFAULT: TStringField;
    sdqReplicarVP_ABONA_RETORNO: TStringField;
    sdqReplicarVP_SUMA_FIJA: TFloatField;
    sdqReplicarVP_MONTO_MINIMO: TFloatField;
    sdqReplicarvp_id: TFloatField;
    sdqReplicaron_descripcion: TStringField;
    chkViatico: TCheckBox;
    tbSIC: TToolButton;
    tbEliminarVig: TToolButton;
    sdqValNomencladorVP_FECHAALTA: TDateTimeField;
    sdqValNomencladorVP_USUALTA: TStringField;
    dcContSoc: TDateComboBox;
    dcActaDesig: TDateComboBox;
    dcContSoc1: TDateComboBox;
    dcActaDesig1: TDateComboBox;
    tsRemis: TTabSheet;
    CoolBarRemis: TCoolBar;
    ToolBarRemis: TToolBar;
    tbAgregarBaseRemis: TToolButton;
    tbEliminarBaseRemis: TToolButton;
    ToolButton29: TToolButton;
    tbOrdenarBaseRemis: TToolButton;
    ToolButton31: TToolButton;
    tbExportarBaseRemis: TToolButton;
    tbImprimirBaseRemis: TToolButton;
    dbgRemis: TRxDBGrid;
    fpBaseRemis: TFormPanel;
    Bevel29: TBevel;
    btnAceptarRemis: TButton;
    btnCancelarRemis: TButton;
    fraDomicilioGISRemis: TfraDomicilioGIS;
    sdqBaseRemis: TSDQuery;
    dsBaseRemis: TDataSource;
    sdBaseRemis: TSortDialog;
    edlgBaseRemis: TExportDialog;
    qpBaseRemis: TQueryPrint;
    sdqBaseRemisBR_ID: TFloatField;
    sdqBaseRemisBR_IDPRESTADOR: TFloatField;
    sdqBaseRemisBR_CALLE: TStringField;
    sdqBaseRemisBR_NUMERO: TStringField;
    sdqBaseRemisBR_PISO: TStringField;
    sdqBaseRemisBR_DEPARTAMENTO: TStringField;
    sdqBaseRemisBR_CPOSTAL: TStringField;
    sdqBaseRemisBR_CPOSTALA: TStringField;
    sdqBaseRemisBR_LOCALIDAD: TStringField;
    sdqBaseRemisBR_PROVINCIA: TStringField;
    sdqBaseRemisBR_LAT: TFloatField;
    sdqBaseRemisBR_LNG: TFloatField;
    sdqBaseRemisBR_USUALTA: TStringField;
    sdqBaseRemisBR_FECHAALTA: TDateTimeField;
    sdqBaseRemisBR_USUMODIF: TStringField;
    sdqBaseRemisBR_FECHAMODIF: TDateTimeField;
    sdqBaseRemisBR_USUBAJA: TStringField;
    sdqBaseRemisBR_FECHABAJA: TDateTimeField;
    sdqBaseRemisPV_DESCRIPCION: TStringField;
    edMailAdmin: TEdit;
    Label1: TLabel;
    sdqDatosca_mailadministracion: TStringField;
    tbNotifPresAprob: TToolButton;
    pnlVigFiltroVUM: TPanel;
    VigDdeFiltroVUM: TDateComboBox;
    VigHtaFiltroVUM: TDateComboBox;
    Label88: TLabel;
    pnlVigFiltroVM: TPanel;
    Label89: TLabel;
    VigDdeFiltroVM: TDateComboBox;
    VigHtaFiltroVM: TDateComboBox;
    fpConsultorio: TFormPanel;
    btnGuardarConsultorio: TBitBtn;
    btnCerrarConsultorio: TBitBtn;
    Bevel31: TBevel;
    fraDelegacion: TfraDelegacion;
    Label90: TLabel;
    chkConsultorio: TCheckBox;
    tbSalir2: TToolButton;
    ToolButton26: TToolButton;
    sdqDatosCA_CONSULTORIO: TStringField;
    sdqDatosCA_DELEGACION: TStringField;
    pmuFiltrarDatosMed: TPopupMenu;
    mnuVisualizarValoresAlta_DatosMed: TMenuItem;
    mnuVisualizarTodosValores_DatosMed: TMenuItem;
    tbFiltrarDatosMed: TToolButton;
    ToolButton21: TToolButton;
    edHabilitaciones: TMemo;
    pmReplicarVM: TPopupMenu;
    mnuRepVMSelecTodo: TMenuItem;
    fpReplicarUM: TFormPanel;
    Bevel30: TBevel;
    GridReplicarUM: TArtDBGrid;
    btnAceptarRepUM: TButton;
    Button9: TButton;
    sdqReplicarUM: TSDQuery;
    dsReplicarUM: TDataSource;
    sdqReplicarUMum_descripcion: TStringField;
    sdqReplicarUMup_vigenciadesde: TDateTimeField;
    sdqReplicarUMup_vigenciahasta: TDateTimeField;
    sdqReplicarUMup_valor: TFloatField;
    pmReplicarUM: TPopupMenu;
    mnuRepUMSelecTodo: TMenuItem;
    sdqReplicarUMup_unidad: TStringField;
    sdqReplicarUMup_id: TFloatField;
    edPuesto: TEdit;
    edMailPersLote: TEdit;
    Label91: TLabel;
    Label92: TLabel;
    chkVisadoDocum: TCheckBox;
    sdqDatosCA_VISADODOCUM: TStringField;
    chkCEM: TCheckBox;
    tsSucursales: TTabSheet;
    CoolBar7: TCoolBar;
    ToolBar9: TToolBar;
    tbAgregarSuc: TToolButton;
    tbModificarSuc: TToolButton;
    tbEliminarSuc: TToolButton;
    ToolButton33: TToolButton;
    tbOrdenarSuc: TToolButton;
    ToolButton35: TToolButton;
    tbExportarSuc: TToolButton;
    tbImprimirSuc: TToolButton;
    dgSucursales: TRxDBGrid;
    sdqSucursales: TSDQuery;
    dsSucursales: TDataSource;
    fpSucursales: TFormPanel;
    GroupBox3: TGroupBox;
    fraDireccionSuc: TfraDireccion;
    edNombreSuc: TEdit;
    Label93: TLabel;
    edTelSuc: TEdit;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    edMailSuc: TEdit;
    edContactoSuc: TEdit;
    Bevel32: TBevel;
    btnAcepratSuc: TButton;
    btnCancelarSuc: TButton;
    edSucursales: TExportDialog;
    qpSucursales: TQueryPrint;
    sdSucursales: TSortDialog;
    gbSiniestro: TGroupBox;
    edSiniestroPresup: TSinEdit;
    rgUltSin: TRadioGroup;
    fpFiltroEmpresaAMP: TFormPanel;
    Bevel33: TBevel;
    btnAceptarFiltroEmpAMP: TButton;
    btnCancelarFiltroEmpAMP: TButton;
    gbFiltroEmpresaAMP: TGroupBox;
    Label41: TLabel;
    fraEmpresaFiltroAMP: TfraEmpresa;
    RxCalcEdit1: TRxCalcEdit;
    fraEstablecimientoFiltroAMP: TfraEstablecimiento;
    tbFiltroEmpresaAMP: TToolButton;
    tbLimpiarPresupuestoAMP: TToolButton;
    Label97: TLabel;
    edVP_KM_INCLUIDOS: TCurrencyEdit;
    sdqValNomencladorVP_KM_INCLUIDOS: TFloatField;
    sdqValNomencladorVP_USUMODIF: TStringField;
    sdqValNomencladorVP_FECHAMODIF: TDateTimeField;
    tbEliminarVigUM: TToolButton;
    SDQVUMedup_prestador: TFloatField;
    tbFiltrarContratos: TToolButton;
    pmuFiltrarContratos: TPopupMenu;
    mnuRenAuto: TMenuItem;
    mnuTodosContratos: TMenuItem;
    chkHabilitado: TCheckBox;
    chkRespCivil: TCheckBox;
    chkComplejidad: TCheckBox;
    chkCartaCompromiso: TCheckBox;
    chkhabilitadoABM: TCheckBox;
    chkRespCivilABM: TCheckBox;
    chkComplejidadABM: TCheckBox;
    chkCartaCompromisoABM: TCheckBox;
    cmbFechaVtoHabilitacion: TDateComboBox;
    cmbFechaRespCivil: TDateComboBox;
    cmbFechaVtoHabilitacionABM: TDateComboBox;
    cmbFechaRespCivilABM: TDateComboBox;
    sdqContratosPC_IDCONTRATO: TFloatField;
    sdqContratosPC_VIGENCIADESDE: TDateTimeField;
    sdqContratosPC_VIGENCIAHASTA: TDateTimeField;
    sdqContratosPC_TIPOCONTRATO: TStringField;
    sdqContratosPC_SUMATORIAMODULOS: TStringField;
    sdqContratosPC_FACTURACIONDESDE: TFloatField;
    sdqContratosPC_FACTURACIONHASTA: TFloatField;
    sdqContratosPC_PLAZOREFACTURACION: TFloatField;
    sdqContratosPC_MEDICACIONEXTRA: TStringField;
    sdqContratosPC_GENERALIDADES: TStringField;
    sdqContratosDESCCONTRATO: TStringField;
    sdqContratosPC_RENOVAUTOMATICA: TStringField;
    sdqContratosPC_HABILITACION: TStringField;
    sdqContratosPC_DOCUMENTO: TStringField;
    sdqContratosPC_CONTRATOSOCIAL: TStringField;
    sdqContratosPC_ACTAAUTORIDADES: TStringField;
    sdqContratosPC_CV: TStringField;
    sdqContratosPC_TITULO: TStringField;
    sdqContratosPC_MATRICULA: TStringField;
    sdqContratosPC_FECHACONTSOCIAL: TDateTimeField;
    sdqContratosPC_FECHAACTAAUTO: TDateTimeField;
    sdqContratosPC_COMPLEJIDAD: TStringField;
    sdqContratosPC_CARTACOMP: TStringField;
    sdqContratosPC_RESPCIVIL: TStringField;
    sdqContratosPC_FECHAVTOHABILITACION: TDateTimeField;
    sdqContratosPC_FECHARESPCIVIL: TDateTimeField;
    cdsValoresPrestaciones: TClientDataSet;
    cdsValoresPrestacioneses_codigo: TStringField;
    cdsValoresPrestacioneses_descripcion: TStringField;
    cdsValoresPrestacionespd_valor: TFloatField;
    cdsValoresPrestacionespd_vigenciadesde: TDateField;
    cdsValoresPrestacioneses_fechabaja: TDateTimeField;
    tsZonas: TTabSheet;
    fraZonasPrestador: TfraZonasPrestador;
    chkFdoTierradelFuego: TCheckBox;
    sdqDatosCA_FDOTIERRADELFUEGO: TStringField;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    edVP_VIAJE_EXCLUSIVO: TCurrencyEdit;
    edVP_VIAJE_NOCTURNO: TCurrencyEdit;
    edVP_VIAJE_FINDESEMANA: TCurrencyEdit;
    sdqValNomencladorVP_VIAJE_EXCLUSIVO: TFloatField;
    sdqValNomencladorVP_VIAJE_NOCTURNO: TFloatField;
    sdqValNomencladorVP_VIAJE_FINDESEMANA: TFloatField;
    sdqReplicarVP_VIAJE_EXCLUSIVO: TFloatField;
    sdqReplicarVP_VIAJE_NOCTURNO: TFloatField;
    sdqReplicarVP_VIAJE_FINDESEMANA: TFloatField;
    tbEliminarVigAMP: TToolButton;
    sdqDatosGP_CODIGO: TStringField;
    tbUsuariosPorGrupo: TToolButton;
    procedure btnAceptarContratoClick(Sender: TObject);
    procedure btnAceptarDatosPrestacionesClick(Sender: TObject);
    procedure btnAceptarEmpresaPreocupClick(Sender: TObject);
    procedure btnAceptarEmpresasClick(Sender: TObject);
    procedure btnAceptarEstudioClick(Sender: TObject);
    procedure btnAceptarPreocupClick(Sender: TObject);
    procedure btnAceptarPresupClick(Sender: TObject);
    procedure btnAceptarVigenciaClick(Sender: TObject);
    procedure btnAgregarEmpresaClick(Sender: TObject);
    procedure btnAgregarPreocupClick(Sender: TObject);
    procedure btnAgregarRegionClick(Sender: TObject);
    procedure btnAsignarCPClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarCPClick(Sender: TObject);
    procedure btnCancelarPreocupClick(Sender: TObject);
    procedure btnEspCancelarClick(Sender: TObject);
    procedure btnEspGuardarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnNomAceptarClick(Sender: TObject);
    function VerificarVigencia(): boolean;
    procedure btnPracticasClick(Sender: TObject);
    procedure btnQuitarPreocupClick(Sender: TObject);
    procedure btnQuitarRegionClick(Sender: TObject);
    procedure chkCargaValoresClick(Sender: TObject);
    procedure chkGuardiaActClick(Sender: TObject);
    procedure chkGuardiaActEspClick(Sender: TObject);
    procedure chkGuardiaPasClick(Sender: TObject);
    procedure chkGuardiaPasEspClick(Sender: TObject);
    procedure chkIngBrutosClick(Sender: TObject);
    procedure chkPresupuestoAMPClick(Sender: TObject);
    procedure chkRetCajaMedicoClick(Sender: TObject);
    procedure clbLocalidadesAsignadasDblClick(Sender: TObject);
    procedure clbLocalidadesSinAsignarDblClick(Sender: TObject);
    procedure cmbPresupuestoChange(Sender: TObject);
    procedure cmbRetDeGanaciasExit(Sender: TObject);
    procedure cmbTipoPrestadorCloseUp(Sender: TObject);
    procedure cmbTipoPrestadorGetCellParams(Sender: TObject; Field: TField;AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CmdAceptarVUMClick(Sender: TObject);
    procedure dbgContratosCellClick(Column: TColumn);
    procedure dbgContratosDblClick(Sender: TObject);
    procedure dbgEmpresasDblClick(Sender: TObject);
    procedure dbgEmpresasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgGrillaEspDblClick(Sender: TObject);
    procedure dbgGrillaEspGetCellParams(Sender: TObject; Field: TField;AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgValNomencladorGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dBGVUMGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dgExamenesDblClick(Sender: TObject);
    procedure dgExamenesDetalleDblClick(Sender: TObject);
    procedure dgExamenesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edNomMultiplicadorExit(Sender: TObject);
    procedure edPrestMutualExit(Sender: TObject);
    procedure edRankingExit(Sender: TObject);
    procedure edRSocialExit(Sender: TObject);
    procedure edSiniestroPresupSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fpAgregarEstudioBeforeShow(Sender: TObject);
    procedure fpAltaEmpresaPreocupBeforeShow(Sender: TObject);
    procedure fpAsignacionLocalidadesClose(Sender: TObject; var Action: TCloseAction);
    procedure fpValoresPrestacionesClose(Sender: TObject; var Action: TCloseAction);
    procedure fpValoresPrestacionesShow(Sender: TObject);
    procedure fraDireccionLegaledProvinciaChange(Sender: TObject);
    procedure fraDireccionPrestcmbLocalidadCloseUp(Sender: TObject);
    procedure fraNomencladorABMExit(Sender: TObject);
    procedure grdAMPGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure grdEstudiosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure grdEstudiosKeyPress(Sender: TObject; var Key: Char);
    procedure grdEstudiosTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure mnuIngBrutosClick(Sender: TObject);
    procedure mnuVigentesExamenesClick(Sender: TObject);
    procedure mnuVisualizarSoloVigentes_NomencladorClick(Sender: TObject);
    procedure mnuVisualizarTodos_NomencladorClick(Sender: TObject);
    procedure Noseleccionarninguno1Click(Sender: TObject);
    procedure OptMultHonVUMClick(Sender: TObject);
    procedure pcDatosChange(Sender: TObject);
    procedure pmuVisualizarSloVigentesClick(Sender: TObject);
    procedure pmuVisualizartodoslosvaloresClick(Sender: TObject);
    procedure qpEmpresasGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure qpValNomencladorGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure rbNomOpcionClick(Sender: TObject);
    procedure rxmValoresPrestacionesAfterScroll(DataSet: TDataSet);
    procedure sdqContratosAfterScroll(DataSet: TDataSet);
    procedure sdqEmpresasPresupuestoAMPAfterOpen(DataSet: TDataSet);
    procedure sdqEmpresasPresupuestoAMPAfterScroll(DataSet: TDataSet);
    procedure sdqExamenesAfterScroll(DataSet: TDataSet);
    procedure sdqValoresPrestadorAfterOpen(DataSet: TDataSet);
    procedure Seleccionartodos1Click(Sender: TObject);
    procedure spbAsignarClick(Sender: TObject);
    procedure spbAsignarDatosClick(Sender: TObject);
    procedure spbDesasignarClick(Sender: TObject);
    procedure spbSelTodos2Click(Sender: TObject);
    procedure spbSelTodosClick(Sender: TObject);
    procedure tbAgregarClick(Sender: TObject);
    procedure tbAgregarContratoClick(Sender: TObject);
    procedure tbAgregarConvClick(Sender: TObject);
    procedure tbAgregarCPClick(Sender: TObject);
    procedure tbAgregarEmpresaClick(Sender: TObject);
    procedure tbAgregarEspClick(Sender: TObject);
    procedure tbAgregarNomClick(Sender: TObject);
    procedure tbAgregarPreocupClick(Sender: TObject);
    procedure tbAgregarPresupClick(Sender: TObject);
    procedure tbAgregarUMedClick(Sender: TObject);
    procedure tbAltaEmpresaPreocupClick(Sender: TObject);
    procedure tbAuditableClick(Sender: TObject);
    procedure tbAutorizarPreocupClick(Sender: TObject);
    procedure tbBajaEmpresaPreocupClick(Sender: TObject);
    procedure tbBajaPreocupClick(Sender: TObject);
    procedure tbBajaPresupuestoClick(Sender: TObject);
    procedure tbCuentasBancariasClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbEliminarContratoClick(Sender: TObject);
    procedure tbEliminarConvClick(Sender: TObject);
    procedure tbEliminarCPClick(Sender: TObject);
    procedure tbEliminarEmpresaClick(Sender: TObject);
    procedure tbEliminarEspClick(Sender: TObject);
    procedure tbEliminarNomClick(Sender: TObject);
    procedure tbEliminarUMedClick(Sender: TObject);
    procedure tbExportarContratoClick(Sender: TObject);
    procedure tbExportarConvClick(Sender: TObject);
    procedure tbExportarCPClick(Sender: TObject);
    procedure tbExportarEmpresaClick(Sender: TObject);
    procedure tbExportarEspClick(Sender: TObject);
    procedure tbExportarNomClick(Sender: TObject);
    procedure tbExportarPreocupClick(Sender: TObject);
    procedure tbExportarUMedClick(Sender: TObject);
    procedure tbImportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbImprimirContratoClick(Sender: TObject);
    procedure tbImprimirConvClick(Sender: TObject);
    procedure tbImprimirCPClick(Sender: TObject);
    procedure tbImprimirEmpresaClick(Sender: TObject);
    procedure tbImprimirEspClick(Sender: TObject);
    procedure tbImprimirNomClick(Sender: TObject);
    procedure tbImprimirPreocupClick(Sender: TObject);
    procedure tbImprimirUMedClick(Sender: TObject);
    procedure tbIngresoBrutosClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbMediosTransporteClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbModificarContratoClick(Sender: TObject);
    procedure tbModificarCPClick(Sender: TObject);
    procedure tbModificarEmpresaClick(Sender: TObject);
    procedure tbModificarEspClick(Sender: TObject);
    procedure tbModificarPreocupClick(Sender: TObject);
    procedure tbNoAuditableClick(Sender: TObject);
    procedure tbOrdenarContratoClick(Sender: TObject);
    procedure tbOrdenarConvClick(Sender: TObject);
    procedure tbOrdenarCPClick(Sender: TObject);
    procedure tbOrdenarEmpresaClick(Sender: TObject);
    procedure tbOrdenarEspClick(Sender: TObject);
    procedure tbOrdenarNomClick(Sender: TObject);
    procedure tbOrdenarPreocupClick(Sender: TObject);
    procedure tbOrdenarUMedClick(Sender: TObject);
    procedure tbPolizaClick(Sender: TObject);
    procedure tbPracticasPrestadorClick(Sender: TObject);
    procedure tbPresupuestoAMPClick(Sender: TObject);
    procedure tbRegionesClick(Sender: TObject);
    procedure tbReplicarNomClick(Sender: TObject);
    procedure tbReplicarUMedClick(Sender: TObject);
    procedure tbConsultorioClick(Sender: TObject);
    procedure tbSolicitudPresupuestosClick(Sender: TObject);
    procedure dbgSiniestrosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAgregarSiniestroClick(Sender: TObject);
    procedure btnAceptarSiniestrosClick(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure tbModificarSiniestroClick(Sender: TObject);
    procedure tbEliminarSiniestroClick(Sender: TObject);
    procedure tbOrdenarS(Sender: TObject);
    procedure tbExportarSiniestroClick(Sender: TObject);
    procedure tbImprimirSiniestroClick(Sender: TObject);
    procedure btnPersonasLoteClick(Sender: TObject);
    procedure btnAgregarPerLoteClick(Sender: TObject);
    procedure fpPersonasLoteBeforeShow(Sender: TObject);
    procedure btnQuitarPerLoteClick(Sender: TObject);
    procedure tbPersonasLoteClick(Sender: TObject);
    procedure tbVerHistoricoBajasClick(Sender: TObject);
    procedure btnHistBajaCerrarClick(Sender: TObject);
    procedure fpVerHistoricoBajasBeforeShow(Sender: TObject);
    procedure tbAprobarPresupuestoClick(Sender: TObject);
    procedure pmuVisualizarSloVigentesUMClick(Sender: TObject);
    procedure pmuVisualizartodoslosvaloresUMClick(Sender: TObject);
    function EliminarEspacios(cadena: string): String;
    function ValidarVariosMails(mails: string): Boolean;
    function ValidarPiso: boolean;
//    function ValidarDepto: boolean;
    function EsNumero(cadena: string): boolean;
    function EliminarSeparadoresDuplicados(cadena: string): String;
    function FormatearCadena(cadena: string): String;
    procedure tbObservLiquidacionesClick(Sender: TObject);
    procedure btnCerrarObservLiquidClick(Sender: TObject);
    procedure btnGuardarObservLiquidClick(Sender: TObject);
    procedure edEMailExit(Sender: TObject);
    procedure edMailDebitosExit(Sender: TObject);
    procedure fpMotivosBajaShow(Sender: TObject);
    procedure btnAceptarMotBajaClick(Sender: TObject);
    procedure fraMotivoBajaFPChange(Sender: TObject);
    procedure fraDireccionLegalExit(Sender: TObject);
    procedure rgEstadoPrestClick(Sender: TObject);
    procedure GridEmpresasCellClick(Column: TColumn);
    procedure GridPresupuestosDetalleCellClick(Column: TColumn);
    procedure sdqPresupDetalleAfterOpen(DataSet: TDataSet);
    procedure cmbIngBrutConceptoChange(Sender: TObject);
    procedure GridReplicarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GridReplicarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridReplicarCellClick(Column: TColumn);
    function HayRegistroActivo :Boolean;
    procedure GridReplicarUMGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure LimpiarViaticos;
    procedure chkViaticoClick(Sender: TObject);
    procedure tbSICClick(Sender: TObject);
    function ValidarViaticosyEstudios: boolean;
    procedure tbEliminarVigClick(Sender: TObject);
    procedure chkContratoSocialABMClick(Sender: TObject);
    procedure chkActaAutoridadesABMClick(Sender: TObject);
    procedure tbAgregarBaseRemisClick(Sender: TObject);
    procedure tbOrdenarBaseRemisClick(Sender: TObject);
    procedure tbExportarBaseRemisClick(Sender: TObject);
    procedure tbImprimirBaseRemisClick(Sender: TObject);
    procedure tbEliminarBaseRemisClick(Sender: TObject);
    procedure sdqBaseRemisAfterOpen(DataSet: TDataSet);
    procedure btnAceptarRemisClick(Sender: TObject);
    procedure dbgRemisGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edMailAdminExit(Sender: TObject);
    procedure cmbEspecialidadDropDown(Sender: TObject);
    procedure tbNotifPresAprobClick(Sender: TObject);
    procedure btnConsultorioClick(Sender: TObject);
    procedure btnCerrarConsultorioClick(Sender: TObject);
    procedure btnGuardarConsultorioClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure fpConsultorioBeforeShow(Sender: TObject);
    procedure chkConsultorioClick(Sender: TObject);
    procedure mnuVisualizarValoresAlta_DatosMedClick(Sender: TObject);
    procedure mnuVisualizarTodosValores_DatosMedClick(Sender: TObject);
    procedure mnuRepVMSelecTodoClick(Sender: TObject);
    procedure GridReplicarUMDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GridReplicarUMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridReplicarUMCellClick(Column: TColumn);
    function HayRegistroActivoRepUM :Boolean;
    procedure mnuRepUMSelecTodoClick(Sender: TObject);
    procedure btnAceptarRepUMClick(Sender: TObject);
    procedure btnAcepratSucClick(Sender: TObject);
    procedure tbAgregarSucClick(Sender: TObject);
    procedure fpSucursalesShow(Sender: TObject);
    procedure tbEliminarSucClick(Sender: TObject);
    procedure tbModificarSucClick(Sender: TObject);
    procedure tbOrdenarSucClick(Sender: TObject);
    procedure tbExportarSucClick(Sender: TObject);
    procedure tbImprimirSucClick(Sender: TObject);
    procedure tbFiltroEmpresaAMPClick(Sender: TObject);
    procedure OnEmpresaFiltroAMPChange(sender: tobject);
    procedure btnAceptarFiltroEmpAMPClick(Sender: TObject);
    procedure tbLimpiarPresupuestoAMPClick(Sender: TObject);
    procedure tbEliminarVigUMClick(Sender: TObject);
    procedure mnuRenAutoClick(Sender: TObject);
    procedure mnuTodosContratosClick(Sender: TObject);
    procedure chkRespCivilABMClick(Sender: TObject);
    procedure chkhabilitadoABMClick(Sender: TObject);
    procedure cdsValoresPrestacionesAfterScroll(DataSet: TDataSet);
    procedure ImpresionGrilla(QueryPrint: TQueryPrint);
    procedure mnuTodosExamenesClick(Sender: TObject);
    procedure tbEliminarVigAMPClick(Sender: TObject);
    procedure tbUsuariosPorGrupoClick(Sender: TObject);
  private
    Accion, AccionEsp, AccionExa, AccionValMod: TAccion;
    modoABMVUMed: string;
    bEsAltaNomenclador: Boolean;
    dHoy: TDateTime;
    FOrdDesc: Boolean;
    FSQLValoresExamenes: String;
    FSQLValoresNomenclador: String;
    FSQLValoresPrestaciones: String;
    FSQLValoresPrestador: String;
    FSQLValoresUnidMed: String;
    FSQLContratos: String;
    ModoForm: TFuncionShowForm;
    nNroPresupuesto: integer;
    RegSelecReplicar: TStringList;
    RegSelecReplicarUM: TStringList;
    procedure AbrirPracticas(iValorPrestador, iIdNomenclador: Integer; bEsAlta: Boolean);
    procedure ActualizarCargaValores(sCuit: String; iSecuencia: Integer);
    procedure CargarContratos;
    procedure MarcarRequerimientosLegajo;
    procedure do_CargarEstadoLegajo;
    procedure CargarDatosEsp;
    procedure CargarValores(APresupuesto: Boolean = False; ACerrarEmpresas: Boolean = True; AScroll: Boolean = False);
    procedure CheckBaja;
    procedure CheckDatosMedicos;
    procedure CheckValoresAMP;
    procedure CheckVisible;
    procedure ClearDatosFormPanelEmpresa;
    procedure ClearDatosFormPanelSiniestro;  // TK 8638
    procedure DisableButtons;
    procedure DoCargarExamen(bEsNuevo :Boolean);
    procedure DoLimpiarPresup;
    function Do_SetearAuditable(EsAuditable: Boolean; Identificador: TTableId): Boolean;
    procedure EnableButtons;
    function ExisteCuitSecuenciaActivo: Boolean;
    function GetTextoLote: String;
    function GetValorPrestador(iPrestador, iNomenclador: Integer; dVigencia: TDateTime): Integer;
    function HabilitarVisible(Especialidad: String): Boolean;
    function IsDatosValidosEmpresa(ModoFormEmp: TFuncionShowForm): Boolean;
    function IsDatosValidosSiniestro(ModoFormSin: TFuncionShowForm): Boolean;  // TK 8638
    function IsRegistroSeleccionadoEmpresaValido: Boolean;
    function IsRegistroSeleccionadoSiniestroValido: Boolean;         // TK 8638
    procedure Limpiar_fpABMVUMed;
    procedure LoadDatosFormPanelEmpresa;
    procedure LoadDatosFormPanelSiniestro;    // TK 8638
    procedure LockControls(Valor, PK: Boolean);
    procedure LockPresupControls(Valor: Boolean);
    procedure LockValContControls(Valor: Boolean);
    procedure LockValNomControls(Valor: Boolean);
    procedure LockVUMControls(Valor: Boolean);
    procedure OnEmpresaExamenChange(Sender: TObject);
    procedure OnDomicilioGISRemisChange(Sender: TObject);
    procedure OnEmpresaPresupuestoAMPChange(Sender: TObject);
    procedure OnEstablecimientoAMPChange(Sender: TObject);
    procedure OnNomencladorChange(Sender: TObject);
    procedure OnPrestadorChange(Sender: TObject);
    procedure OnProvinciasCPChange(Sender: TObject);
    procedure Do_Guardar_PrestadorHistBajas_Reactiv; // TK 15642
    function ArmarCuerpoMail(titulo: string): string;
    function ReactivarAlta: Boolean;
    procedure SetProvincia(AProvincia: Integer);
    procedure SetRegionSanitariaDom;
    procedure SetTipoIngBrutos(IsIngBrutos: Boolean);
    function TieneLoteAutorizado: Boolean;
    function Validar: Boolean;
    function ValidarContrato: Boolean;
    function ValidarCantPersonas(bSoloMenor: Boolean) :Boolean;
    function Get_TextoMailAprobarPresup(sNomPrestador, sCuitPrestador:string):string;
    function ExistenPersonasEnLote(iIdLote, iCantidadPers:integer) :Boolean;   // TK 25139
    procedure Do_GuardarObservLiquid(iIdPrest:integer; sObserv: string);       // TK 29415
    procedure Do_MostrarObservLiquidaciones(iIdPrest:integer);                 // TK 29415
    function Es_UnidadBioquimica(sNomenclador, sCapitulo, sCodigo:string):boolean; // TK 33995
    procedure Do_GuardarConsultorioDelegacion(iIdPrest:integer; bConsultorioChequeado: boolean; sCodDelegacion: string);   // TK 48426
  end;

const
  cSQL_Especialidad = 'SELECT pe_especialidad, es_descripcion, pe_observaciones, pe_fechabaja, pe_guardiaact, pe_desdeguardiaact,' +
                            ' pe_hastaguardiaact, pe_guardiapas, pe_desdeguardiapas, pe_hastaguardiapas' +
                       ' FROM cpe_prestaespeci, mes_especialidades' +
                      ' WHERE pe_especialidad = es_codigo' +
                        ' AND es_fechabaja IS NULL ';

  cSqlBasePresupuesto = ' SELECT MIN(pp_id) pp_id, to_char(pp_nropresupuesto) || '' - '' || pp_descripcion || decode(pp_fechabaja, null, '''', '' (Dado de baja)'') as pp_descripcion, ' +
                               ' pp_fechabaja, pp_nropresupuesto ' +
                          ' FROM comunes.cpp_presupuestoprestador, afi.aes_establecimiento, afi.aem_empresa, afi.aco_contrato ' +
                         ' WHERE pp_idprestador = :pprestador ' +
                           ' AND pp_idestablecimiento = es_id ' +
                           ' AND es_contrato = co_contrato ' +
                           ' AND co_idempresa = em_id ' +
                      ' GROUP BY pp_descripcion, pp_fechabaja, pp_nropresupuesto ' +
                      ' ORDER BY 2 DESC ';
  cPROV_TIERRADELFUEGO = 22;

var
  frmManPrestador: TfrmManPrestador; tieneValores: boolean;

implementation

uses
  unPrincipal, unDmPrincipal, Internet, UnRepManPrestador, CustomDlgs, unManCCP_CUENTAPAGO, VCLExtra, sqlFuncs,
  unManPoliza, unImpoExpoWizard, unImportarPrestadores, unSesion, unPracticasPrestador, DateTimeFuncs,
  unSolicitarPresupuesto, unManSDT_DETALLETRANSPORTE, unMoldeEnvioMail, unBusqSini, unCustomDataModule,
  StrUtils, unAgendaVistaPrestador, unGruposPrestador;

{$R *.DFM}

procedure TfrmManPrestador.btnAceptarContratoClick(Sender: TObject);
var
  sSql: String;
begin
  if ValidarContrato then
  begin
    if (fpABMContratos.Tag = 0) then // ALTA
    begin
        if ReactivarAlta then // Alta Reactivada: Se reactiva un alta cuando se encontraba dada de baja
        begin
          sSql := 'UPDATE cpc_prestadorcontrato ' +
                  ' SET pc_vigenciahasta = ' + edVigHastaABM.SqlText + ',' +
                      ' pc_tipocontrato = ' + fraTipoContratoABM.Codigo + ',' +
                      ' pc_sumatoriamodulos = ' + SqlBoolean(chkSumaModulosABM.Checked,True,'S','N') + ',' +
                      ' pc_contratosocial = ' + SqlBoolean(chkContratoSocialABM.Checked,True,'S','N') + ',' +
                      ' pc_fechacontsocial = ' + SqlBoolean(chkContratoSocialABM.Checked, false, dcContSoc.SqlText, quotedstr('')) + ',' +
                      ' pc_cv = ' + SqlBoolean(chkCVABM.Checked,True,'S','N') + ',' +
                      ' pc_titulo = ' + SqlBoolean(chkTituloABM.Checked,True,'S','N') + ',' +
                      ' pc_matricula = ' + SqlBoolean(chkMatriculaABM.Checked,True,'S','N') + ',' +
                      ' pc_respcivil = ' + SqlBoolean(chkRespCivilABM.Checked,True,'S','N') + ',' +
                      ' pc_fecharespcivil = ' + SqlBoolean(chkRespCivilABM.Checked, false, cmbFechaRespCivilABM.SqlText, quotedstr('')) + ',' +
                      ' pc_complejidad = ' + SqlBoolean(chkComplejidadABM.Checked,True,'S','N') + ',' +
                      ' pc_cartacomp = ' + SqlBoolean(chkCartaCompromisoABM.Checked,True,'S','N') + ',' +
                      ' pc_habilitacion = ' + SqlBoolean(chkhabilitadoABM.Checked,True,'S','N') + ',' +
                      ' pc_fechavtohabilitacion = ' + SqlBoolean(chkhabilitadoABM.Checked, false, cmbFechaVtoHabilitacionABM.SqlText, quotedstr('')) + ',' +
                      ' pc_actaautoridades = ' + SqlBoolean(chkActaAutoridadesABM.Checked,True,'S','N') + ',' +
                      ' pc_fechaactaauto = ' +  SqlBoolean(chkActaAutoridadesABM.Checked, false, dcActaDesig.SqlText, quotedstr('')) + ',' +
                      ' pc_facturaciondesde = ' + SqlNumber(edFactDesdeABM.Value, True) + ',' +
                      ' pc_facturacionhasta = ' + SqlNumber(edFactHastaABM.Value, True) + ',' +
                      ' pc_plazorefacturacion = ' + SqlNumber(edPLazoRefacABM.Value, True) + ',' +
                      ' pc_medicacionextra = ' + SqlBoolean(chkMedExtraABM.Checked,True,'S','N') + ',' +
                      ' pc_renovautomatica = ' + SqlBoolean(chkRenovAutomABM.Checked,True,'S','N') + ',' +
                      ' pc_generalidades = ' + SqlString(edObservABM.Text,True) + ',' +
                      ' pc_documento = ' + SqlBoolean(chkDocumentoABM.Checked) + ',' +
                      ' pc_usualta = ' + SqlValue(Sesion.UserID) + ',' +
                      ' pc_fechaalta = ActualDate, ' +
                      ' pc_usumodif = '''', ' +
                      ' pc_fechamodif = null, ' +
                      ' pc_usubaja = '''', ' +
                      ' pc_fechabaja = null ' +
                  ' WHERE pc_idprestador = ' +  SqlValue(fraPrestadorSel.IDPrestador) +
                    ' AND pc_vigenciadesde = ' + edVigDesdeABM.SqlText;
        end
        else begin  // Alta Comun
          sSql := 'INSERT INTO cpc_prestadorcontrato (' +
                  ' pc_idprestador, pc_vigenciadesde, pc_vigenciahasta, pc_tipocontrato,' +
                  ' pc_sumatoriamodulos, pc_facturaciondesde, pc_facturacionhasta,' +
                  ' pc_contratosocial, pc_actaautoridades, ' +
                  ' pc_cv, pc_titulo, pc_matricula, ' +
                  ' pc_plazorefacturacion, pc_medicacionextra, pc_renovautomatica, ' +
                  ' pc_generalidades, pc_documento, pc_usualta, pc_fechaalta, pc_fechacontsocial, pc_fechaactaauto, ' +
                  ' pc_complejidad, pc_cartacomp, pc_habilitacion, pc_respcivil, pc_fecharespcivil, pc_fechavtohabilitacion) VALUES ( ' +
                  SqlValue(fraPrestadorSel.IDPrestador) + ',' + edVigDesdeABM.SqlText + ',' +
                  edVigHastaABM.SqlText + ',' + fraTipoContratoABM.Codigo + ',' +
                  SqlBoolean(chkSumaModulosABM.Checked,True, 'S', 'N') + ',' +
                  SqlNumber(edFactDesdeABM.Value, True) + ',' + SqlNumber(edFactHastaABM.Value, True) + ',' +
                  SqlBoolean(chkContratoSocialABM.Checked,True, 'S', 'N') + ',' +
                  SqlBoolean(chkActaAutoridadesABM.Checked,True, 'S', 'N') + ',' +
                  SqlBoolean(chkCVABM.Checked,True, 'S', 'N') + ',' +
                  SqlBoolean(chkTituloABM.Checked,True, 'S', 'N') + ',' +
                  SqlBoolean(chkMatriculaABM.Checked,True, 'S', 'N') + ',' +
                  SqlNumber(edPLazoRefacABM.Value, True) + ',' + SqlBoolean(chkMedExtraABM.Checked, True, 'S', 'N') + ',' +
                  SqlBoolean(chkRenovAutomABM.Checked, True, 'S', 'N') + ',' +
                  SqlString(edObservABM.Text, True) + ',' + SqlBoolean(chkDocumentoABM.Checked) + ',' +
                  SqlValue(Sesion.UserID) + ', actualdate,' + SqlBoolean(chkContratoSocialABM.Checked, false, dcContSoc.SqlText, QuotedStr('')) + ', ' +
                  SqlBoolean(chkActaAutoridadesABM.Checked, false, dcActaDesig.SqlText, QuotedStr('')) + ',' +
                  SqlBoolean(chkComplejidadABM.Checked,True, 'S', 'N') + ',' + SqlBoolean(chkCartaCompromisoABM.Checked,True, 'S', 'N') + ',' +
                  SqlBoolean(chkhabilitadoABM.Checked,True,'S','N') + ',' + SqlBoolean(chkRespCivilABM.Checked,True,'S','N') + ',' +
                  SqlBoolean(chkRespCivilABM.Checked, false, cmbFechaRespCivilABM.SqlText, quotedstr('')) + ',' +
                  SqlBoolean(chkhabilitadoABM.Checked, false, cmbFechaVtoHabilitacionABM.SqlText, quotedstr('')) + ' )';
        end;
    end
    else begin  // MODIFICACION
      sSql := 'UPDATE cpc_prestadorcontrato' +
                ' SET pc_vigenciadesde = ' + edVigDesdeABM.SqlText + ',' +
                    ' pc_vigenciahasta = ' + edVigHastaABM.SqlText + ',' +
                    ' pc_tipocontrato = ' + fraTipoContratoABM.Codigo + ',' +
                    ' pc_sumatoriamodulos = ' + SqlBoolean(chkSumaModulosABM.Checked,True,'S','N') + ',' +
                    ' pc_contratosocial = ' + SqlBoolean(chkContratoSocialABM.Checked,True,'S','N') + ',' +
                    ' pc_fechacontsocial = ' + SqlBoolean(chkContratoSocialABM.Checked, false, dcContSoc.SqlText, quotedstr('')) + ',' +
                    ' pc_cv = ' + SqlBoolean(chkCVABM.Checked,True,'S','N') + ',' +
                    ' pc_titulo = ' + SqlBoolean(chkTituloABM.Checked,True,'S','N') + ',' +
                    ' pc_matricula = ' + SqlBoolean(chkMatriculaABM.Checked,True,'S','N') + ',' +
                    ' pc_respcivil = ' + SqlBoolean(chkRespCivilABM.Checked,True,'S','N') + ',' +
                    ' pc_fecharespcivil = ' + SqlBoolean(chkRespCivilABM.Checked, false, cmbFechaRespCivilABM.SqlText, quotedstr('')) + ',' +
                    ' pc_habilitacion = ' + SqlBoolean(chkhabilitadoABM.Checked,True,'S','N') + ',' +
                    ' pc_fechavtohabilitacion = ' + SqlBoolean(chkhabilitadoABM.Checked, false, cmbFechaVtoHabilitacionABM.SqlText, quotedstr('')) + ',' +
                    ' pc_complejidad = ' + SqlBoolean(chkComplejidadABM.Checked,True,'S','N') + ',' +
                    ' pc_cartacomp = ' + SqlBoolean(chkCartaCompromisoABM.Checked,True,'S','N') + ',' +
                    ' pc_actaautoridades = ' + SqlBoolean(chkActaAutoridadesABM.Checked,True,'S','N') + ',' +
                    ' pc_fechaactaauto = ' +  SqlBoolean(chkActaAutoridadesABM.Checked, false, dcActaDesig.SqlText, quotedstr('')) + ',' +
                    ' pc_facturaciondesde = ' + SqlNumber(edFactDesdeABM.Value, True) + ',' +
                    ' pc_facturacionhasta = ' + SqlNumber(edFactHastaABM.Value, True) + ',' +
                    ' pc_plazorefacturacion = ' + SqlNumber(edPLazoRefacABM.Value, True) + ',' +
                    ' pc_medicacionextra = ' + SqlBoolean(chkMedExtraABM.Checked,True,'S','N') + ',' +
                    ' pc_renovautomatica = ' + SqlBoolean(chkRenovAutomABM.Checked,True,'S','N') + ',' +
                    ' pc_generalidades = ' + SqlString(edObservABM.Text,True) + ',' +
                    ' pc_documento = ' + SqlBoolean(chkDocumentoABM.Checked) + ',' +
                    ' pc_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' pc_fechamodif = ActualDate ' +
              ' WHERE pc_idcontrato = ' + SqlInt(sdqContratosPC_IDCONTRATO.AsInteger);
    end;

    try
      EjecutarSql(sSql);
      sdqContratos.Refresh;
      CargarContratos;
      fpABMContratos.ModalResult := mrOk;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al intentar guardar los datos.');
    end;
  end;
  sdqContratosAfterScroll(nil);
  do_CargarEstadoLegajo;
end;

{-----------------------------------------------------------------------------
  Procedure:   btnAceptarDatosPrestacionesClick
  Author:      racastro
  Date:        02-Ene-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Registra los datos de las prestaciones en la BD
-----------------------------------------------------------------------------}

procedure TfrmManPrestador.btnAceptarDatosPrestacionesClick(Sender: TObject);
  procedure InternalSaveViaticos(ASQLSelectDetalleEstudios, APresupuesto, ASQLInsertaValor: String; AValor: Double; AFecha: TDateTime; AIDPresupuesto, AIdTipo: Integer);
  begin
    if (AValor > 0) and
       (ExisteSQLEx (ASQLSelectDetalleEstudios, [fraPrestadorSel.IDPrestador, AIdTipo, '', AValor, TDateTimeEx.Create(AFecha)]) or
        (not ExisteSQLEx ('SELECT 1' +
                           ' FROM comunes.cpd_prestadorestudio' +
                          ' WHERE pd_idprestador = :prestador' +
                            ' AND pd_idtipovalor = :tipo ' + APresupuesto +
                            ' AND pd_vigenciahasta IS NULL' +
                            ' AND pd_fechabaja IS NULL ', [fraPrestadorSel.IDPrestador, AIdTipo]))) then
    begin
      // Doy de baja al actual
      EjecutarSqlSTEx('UPDATE comunes.cpd_prestadorestudio' +
                        ' SET pd_vigenciahasta = :fecha - 1,' +
                            ' pd_fechamodif = SYSDATE,' +
                            ' pd_usumodif = :usuario' +
                      ' WHERE pd_idprestador = :prestador' +
                        ' AND pd_idtipovalor = :tipo ' + APresupuesto +
                        ' AND pd_vigenciahasta IS NULL ' +
                        ' AND pd_fechabaja IS NULL ', [TDateTimeEx.Create(AFecha), Sesion.UserID,
                                                           fraPrestadorSel.IDPrestador, AIdTipo]);

      // Inserto el nuevo valor
      EjecutarSqlSTEx(ASQLInsertaValor, [fraPrestadorSel.IDPrestador, '', AIdTipo, AValor,
                                         TDateTimeEx.Create(AFecha), Sesion.UserID, AIDPresupuesto]);
    end;
  end;
var
  IDPresupuesto: Integer;
  sPresupuesto: String;
  sSQLInsertaPresupuesto: String;
  sSQLInsertaValor: String;
  sSQLSelectDetalleEstudios: String;
begin
  if chkNuevoAMP.Checked then
    IDPresupuesto := ValorSQLInteger('SELECT MAX(PP_ID) FROM COMUNES.CPP_PRESUPUESTOPRESTADOR') + 1
  else
  begin
    if not VarIsNull(cmbPresupuesto.KeyValue) then
      IDPresupuesto := sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger
    else
      IDPresupuesto := 0;
  end;

  {if chkNuevoAMP.Checked then
  begin
    IDPresupuesto := ValorSQLInteger('SELECT MAX(PP_ID) FROM COMUNES.CPP_PRESUPUESTOPRESTADOR') + 1;
    if btnAgregarEmpresa.Enabled then
      nNroPresupuesto := ValorSQLInteger('SELECT MAX(PP_NROPRESUPUESTO) FROM COMUNES.CPP_PRESUPUESTOPRESTADOR') + 1
    else
      nNroPresupuesto := sdqPresupuestosAMP.FieldByName('PP_NROPRESUPUESTO').AsInteger;
  end
  else begin
    nNroPresupuesto := 0;
    if not VarIsNull(cmbPresupuesto.KeyValue) then
      IDPresupuesto := sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger
    else
      IDPresupuesto := 0;
  end;}

  sPresupuesto := iif(chkPresupuestoAMP.Checked, ' AND pd_idpresupuesto = ' + SQLValue(IDPresupuesto), ' AND pd_idpresupuesto IS NULL ');

  sSQLInsertaValor :=
    'INSERT INTO comunes.cpd_prestadorestudio(pd_id, pd_idprestador, pd_idestudio, pd_idtipovalor, pd_valor,' +
                                            ' pd_vigenciadesde, pd_vigenciahasta, pd_fechaalta, pd_usualta,' +
                                            ' pd_idpresupuesto)' +
                                    ' VALUES (comunes.seq_cpd_id.NEXTVAL, :prestador, :estudio, :tipo, :valor, :fecha,' +
                                            ' NULL, SYSDATE, :usuario,' +
                                            ' decode(:pd_idpresupuesto, 0, NULL, :pd_idpresupuesto))';

  sSQLInsertaPresupuesto :=
    'INSERT INTO comunes.cpp_presupuestoprestador(pp_id, pp_idprestador, pp_idestablecimiento, pp_vigenciadesde,' +
                                                ' pp_vigenciahasta, pp_usualta, pp_fechaalta, pp_descripcion,' +
                                                ' pp_nropresupuesto, pp_idsolicitud, pp_viaticosbonif)' +
                                        ' VALUES (:pp_id, :pp_idprestador, :pp_idestablecimiento, :pp_vigenciadesde,' +
                                                ' :pp_vigenciahasta, :pp_usualta, SYSDATE, :pp_descripcion,' +
                                                ' :pp_nropresupuesto, :pp_idsolicitud, :pp_viaticosbonif)';

  sSQLSelectDetalleEstudios :=
    'SELECT 1' +
     ' FROM comunes.cpd_prestadorestudio' +
    ' WHERE pd_idprestador = :prestador' +
      ' AND pd_idtipovalor = :tipo' +
      ' AND pd_idestudio = :estudio' +
      ' AND pd_vigenciahasta IS NULL' +
      ' AND pd_fechabaja IS NULL ' +
      ' AND ((pd_valor <> :valor)' +
       ' OR (pd_vigenciadesde <> :fecha))' +
            sPresupuesto;

  spbAsignarDatosClick(Sender);
  Verificar(not ValidarViaticosyEstudios, gbViaticos, 'Debe especificar algún valor para viáticos o seleccionar algún estudio de la grilla');

  BeginTrans(True);
  if (IDPresupuesto > 0) and chkNuevoAMP.Checked then
    EjecutarSQLSTEx(sSQLInsertaPresupuesto, [IDPresupuesto, fraPrestadorSel.IDPrestador, fraPP_IDESTABLECIMIENTO.ID,
                                             TDateTimeEx.Create(edPP_VIGENCIADESDE.Date),
                                             TDateTimeEx.Create(edPP_VIGENCIAHASTA.Date), Sesion.UserID,
                                             edPP_DESCRIPCION.Text, nNroPresupuesto, lupSolicitudPresupuesto.Value, iif(chkViatico.Checked, 'S', 'N')]);

  try
    // Viáticos por KM
    InternalSaveViaticos(sSQLSelectDetalleEstudios, sPresupuesto, sSQLInsertaValor, edViaticoKM.Value, edFechaViaticoKM.Date, IDPresupuesto, 2);
    // Viáticos de estadía
    InternalSaveViaticos(sSQLSelectDetalleEstudios, sPresupuesto, sSQLInsertaValor, edViaticoEstadia.Value, edFechaViaticoEstadia.Date, IDPresupuesto, 3);
    // Viáticos por Gastos de Envío
    InternalSaveViaticos(sSQLSelectDetalleEstudios, sPresupuesto, sSQLInsertaValor, edViaticoGastoEnvio.Value, edFechaViaticoGastoEnvio.Date, IDPresupuesto, 4);

    // Valores de estudios

    with cdsValoresPrestaciones do
    begin
      First;

      while not EoF do
      begin
        if (FieldByName('pd_valor').AsFloat >= 0) and (FieldByName('pd_vigenciadesde').AsDateTime > 0) and (not FieldByName('pd_vigenciadesde').IsNull) and
           (ExisteSQLEx(sSQLSelectDetalleEstudios, [fraPrestadorSel.IDPrestador, 1, FieldByName('es_codigo').AsString,
                                                    FieldByName('pd_valor').AsFloat,
                                                    TDateTimeEx.Create(FieldByName('pd_vigenciadesde').AsDateTime)]) or
            (not ExisteSQLEx('SELECT 1' +
                              ' FROM comunes.cpd_prestadorestudio' +
                             ' WHERE pd_idprestador = :prestador' +
                               ' AND pd_idtipovalor = :tipo' +
                               ' AND pd_idestudio = :estudio ' + sPresupuesto +
                               ' AND pd_vigenciahasta IS NULL ' +
                               ' AND pd_fechabaja IS NULL ', [fraPrestadorSel.IDPrestador, 1, FieldByName('es_codigo').AsString]))) then
        begin
          // Doy de baja al actual
          EjecutarSqlSTEx('UPDATE comunes.cpd_prestadorestudio' +
                            ' SET pd_vigenciahasta =  :fecha - 1,' +
                                ' pd_fechamodif = SYSDATE,' +
                                ' pd_usumodif = :usuario' +
                          ' WHERE pd_idprestador = :prestador' +
                            ' AND pd_idtipovalor = :tipo' +
                            ' AND pd_idestudio = :estudio ' + sPresupuesto +
                            ' AND pd_vigenciahasta IS NULL ' +
                            ' AND pd_fechabaja IS NULL ', [TDateTimeEx.Create(FieldByName('pd_vigenciadesde').AsDateTime),
                                                               Sesion.UserID, fraPrestadorSel.IDPrestador, 1, FieldByName('es_codigo').AsString]);

          // Inserto el nuevo valor
          EjecutarSqlSTEx(sSQLInsertaValor, [fraPrestadorSel.IDPrestador, FieldByName('es_codigo').AsString, 1, FieldByName('pd_valor').AsFloat,
                                             TDateTimeEx.Create(FieldByName('pd_vigenciadesde').AsDateTime), Sesion.UserID, IDPresupuesto]);
        end;

        Next;
      end
    end;

    EjecutarSqlSTEx('UPDATE art.cpr_prestador' +
                      ' SET ca_amp = art.amp.get_amp_prestador (ca_identificador)' +
                    ' WHERE ca_identificador = :idprestador ',
                    [fraPrestadorSel.IDPrestador]);

    CommitTrans;
    if Sender <> nil then           //para que no cierre el fp cuando se hace clic en AgregarEmpresa
      fpValoresPrestaciones.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar datos del convenio/contrato.');
    end;
  end;

  sdqPresupuestosAMP.Close;
  OpenQueryEx(sdqPresupuestosAMP, [fraPrestadorSel.IDPrestador]);
  cmbPresupuestoChange(nil);
  OpenQueryEx(sdqEmpresasPresupuestoAMP, [sdqPresupuestosAMP.FieldByName('PP_NROPRESUPUESTO').AsInteger]);

  if chkNuevoAMP.Checked then
  try
    cmbPresupuesto.KeyValue := IDPresupuesto;//nNroPresupuesto;
    sdqEmpresasPresupuestoAMP.Open;
    sdqEmpresasPresupuestoAMP.Locate('PP_ID', IDPresupuesto, []);
    sdqEmpresasPresupuestoAMP.Close;
  except
    on E: Exception do
  end;
  tieneValores := false;
  cmbPresupuestoChange(nil);
  //VCLExtra.LockControls(btnAgregarEmpresa, False);
end;

procedure TfrmManPrestador.btnAceptarEmpresaPreocupClick(Sender: TObject);
begin
  Verificar(edCantExa.Value = 0, edCantExa, 'Debe ingresar la cantidad de personas.');
  Verificar(fraEmpresaExamen.IsEmpty, fraEmpresaExamen, 'Debe seleccionar la empresa.');
  Verificar(fraEstabExamen.IsEmpty, fraEstabExamen, 'Debe seleccionar el establecimiento.');
  if ValidarCantPersonas(True) then
    fpAltaEmpresaPreocup.ModalResult := mrOk;
end;

procedure TfrmManPrestador.btnAceptarEmpresasClick(Sender: TObject);
var
  IdEmpresa: TTableId;
  sSql: String;
begin
  if IsDatosValidosEmpresa(ModoForm) then
  begin
    BeginTrans;
    try
      // actualizo los datos de la empresa
      with TSql.Create('MPE_PRESTADOREMPRESA') do
      try
        IdEmpresa := ART_EMPTY_ID;

        Fields.Add('PE_OBSERVACIONES', edObservacionesEmp.Text);

        case ModoForm of
          fsAgregar:
          begin
            sSql := 'UPDATE mpe_prestadorempresa' +
                      ' SET pe_vigenciahasta = ' + SqlDate(edVigenciaDesdeEmp.Date) + '-1,' +
                          ' pe_fechabaja=ACTUALDATE,' +
                          ' pe_usubaja = ' + SqlValue(Sesion.UserId) +
                    ' WHERE pe_prestador = ' + SqlValue(edIdentif.Value) +
                      ' AND pe_cuit = ' + SqlValue(fraEmpresaEmp.mskCUIT.Text) +
                      ' AND pe_vigenciahasta IS NULL';
            EjecutarSqlST(sSql);

            IdEmpresa := GetSecNextVal('SEQ_MPE_ID');

            Fields.Add('PE_PRESTADOR',     edIdentif.Value);
            Fields.Add('PE_CUIT',          fraEmpresaEmp.CUIT);
            Fields.Add('PE_VIGENCIADESDE', edVigenciaDesdeEmp.Date);
            Fields.Add('PE_FECHAALTA',     exDate);
            Fields.Add('PE_USUALTA',       Sesion.UserId);
            SqlType := stInsert;
          end;

          fsModificar:
          begin
            IdEmpresa := sdqEmpresas.FieldByName('PE_ID').AsInteger;
            Fields.Add('PE_FECHAMODIF', exDate);
            Fields.Add('PE_USUMODIF',   Sesion.UserId);
            SqlType := stUpdate;
          end;

          fsEliminar:
          begin
            IdEmpresa := sdqEmpresas.FieldByName('PE_ID').AsInteger;
            Fields.Add('PE_VIGENCIAHASTA', edVigenciaHastaEmp.Date);
            Fields.Add('PE_FECHABAJA',     exDate);
            Fields.Add('PE_USUBAJA',       Sesion.UserId);
            SqlType := stUpdate;
          end;
        end;

        PrimaryKey.Add('PE_ID', IdEmpresa);

        EjecutarSqlST(Sql);
      finally
        Free;
      end;

      CommitTrans;

      MsgBox('Los datos de la empresa se grabaron correctamente.' , MB_OK + MB_ICONINFORMATION);
      fpDialogEmpresas.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        Rollback;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar los datos de la empresa.');
      end;
    end;
  end;
end;

procedure TfrmManPrestador.btnAceptarEstudioClick(Sender: TObject);
var
  IdExa :Integer;
  sSql :String;
begin
  Verificar(fraEstudioPreocup.IsEmpty, fraEstudioPreocup, 'Debe seleccionar el estudio.');
  IdExa := IIF(AccionExa = Alta, GetSecNextVal('comunes.seq_cep_id'),
                                 sdqExamenes.FieldByName('ep_id').AsInteger);
  sSql := 'SELECT 1 ' +
           ' FROM comunes.cei_estudiosincluidos ' +
          ' WHERE ei_idexamen = :IdEx ' +
            ' AND ei_idestudio = :IdEst ' +
            ' AND ei_fechabaja IS NULL ';
  Verificar(ExisteSqlEx(sSql, [IdExa, fraEstudioPreocup.ID]), fraEstudioPreocup,
            'El estudio ya se encuentra incluido en el examen.');

  if (AccionExa = Alta) then
  begin
    sSql  := 'INSERT INTO comunes.cep_examenespreocupacionales ' +
             '(ep_id, ep_descripcion, ep_idprestador, ep_vigenciadesde, ep_vigenciahasta, ' +
             ' ep_valor, ep_fechaalta, ep_usualta) VALUES ( ' +
             SqlInt(IdExa) + ',' + SqlValue(edDescPreocup.Text) + ',' + SqlInt(fraPrestadorSel.IDPrestador) + ',' +
             SqlDate(dcVigDesdePreocup.Date) + ',' + SqlDate(dcVigHastaPreocup.Date) + ',' +
             SqlNumber(edValorExamen.Value) + ', Actualdate, ' + SqlValue(Sesion.UserID) + ')';
    EjecutarSqlST(sSql);
    RefreshAndLocate(sdqExamenes, ['ep_id'], [IdExa]);
    sdqValoresExamen.ParamByName('idexamen').AsInteger := IdExa;
    sdqValoresExamen.Open;
    AccionExa := Edicion;
  end;

  sSql  := 'INSERT INTO comunes.cei_estudiosincluidos ' +
           '(ei_idexamen, ei_idestudio, ei_fechaalta, ei_usualta) VALUES ( ' +
           SqlInt(IdExa) + ',' + SqlInt(fraEstudioPreocup.ID) + ',' +
           ' Actualdate, ' + SqlValue(Sesion.UserID) + ')';
  EjecutarSqlST(sSql);

  fpAgregarEstudio.ModalResult := mrOk;
end;

procedure TfrmManPrestador.btnAceptarPreocupClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(Trim(edDescPreocup.Text) = '', edDescPreocup, 'Debe ingresar la descripción.');
  Verificar(dcVigDesdePreocup.IsEmpty, dcVigDesdePreocup, 'Debe ingresar la vigencia desde.');
  Verificar(edValorExamen.Value = 0, edValorExamen, 'El valor del examen debe ser mayor que 0.');
  Verificar(not(sdqValoresExamen.Active) or sdqValoresExamen.IsEmpty, dgValoresExamenes,
            'Debe agregar al menos un estudio.');
  sSql := 'UPDATE comunes.cep_examenespreocupacionales ' +
            ' SET ep_descripcion = ' + SqlValue(edDescPreocup.Text) + ',' +
                ' ep_valor = ' + SqlNumber(edValorExamen.Value) + ',' +
                ' ep_vigenciadesde = ' + SqlDate(dcVigDesdePreocup.Date) + ',' +
                ' ep_vigenciahasta = ' + SqlDate(dcVigHastaPreocup.Date) +
          ' WHERE ep_id = ' + SqlInt(sdqExamenes.FieldByName('ep_id').AsInteger);
  try
    EjecutarSqlST(sSql);
    CommitTrans(True);
  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar guardar los datos, consulte con Sistemas.');
      Rollback(True);
    end;
  end;
  fpExamenPreocup.ModalResult := mrOk;
end;

{CAMARILLO - 11/05/2007 - carga de presupuestos, funciona similar al de carga de valores (si hay una vigencia
                          posterior a la que estoy cargando, no se inserta. En cambio, si ésta es anterior, se cierra
                          la vigencia y se inserta la nueva }
procedure TfrmManPrestador.btnAceptarPresupClick(Sender: TObject);
var
  IdExped: Integer;
  sSql, sWhere: String;
begin
  Verificar(fraNomencladorPresup.IdNomenclador = 0, fraNomencladorPresup, 'Debe seleccionar un presupuesto.');
  Verificar(dcDesdePresup.IsEmpty, dcDesdePresup, 'Debe seleccionar la vigencia desde.');
  Verificar(dcHastaPresup.IsEmpty, dcHastaPresup, 'Debe seleccionar la vigencia hasta.');
  Verificar(not(dcHastaPresup.IsEmpty) and (dcDesdePresup.Date > dcHastaPresup.Date), dcHastaPresup,
            'La fecha hasta debe ser mayor que la fecha desde.');
  Verificar(edValorPresup.Value = 0, edValorPresup, 'Debe ingresar algún valor.');
  Verificar(edSiniestroPresup.IsEmpty, edSiniestroPresup, 'Debe ingresar el siniestro relacionado.');

  IdExped := Get_IdExpediente(edSiniestroPresup.Siniestro, edSiniestroPresup.Orden, edSiniestroPresup.Recaida);
  sWhere  := ' WHERE pp_prestador = ' + SqlInt(edIdentif.Value) +
               ' AND pp_idnomenclador = ' + SqlInt(fraNomencladorPresup.IdNomenclador) +
               ' AND pp_idexpediente = ' + SqlInt(IdExped) +
               ' AND pp_fechabaja IS NULL';

  if dcDesdePresup.Enabled then //si es un alta
  begin
    sSql    := 'SELECT 1' +
                ' FROM spp_prestador_presupuesto ' + sWhere +
                 ' AND pp_vigenciadesde >= ' + SqlDate(dcDesdePresup.Date);
    Verificar(ExisteSql(sSql), fraNomencladorPresup,
              'Ya existe el valor para el mismo siniestro/prestador con fecha de vigencia igual o posterior.');
    sSql := 'SELECT 1' +
             ' FROM spp_prestador_presupuesto ' + sWhere +
              ' AND ' + SqlDate(dcDesdePresup.Date) + ' BETWEEN pp_vigenciadesde AND pp_vigenciahasta';
    Verificar(ExisteSql(sSql), fraNomencladorPresup,
              'El valor ingresado en la fecha desde se solapa con un periodo existente.');
    try
      BeginTrans;
      //doy de baja una vigencia anterior si es que existe
      sSql := 'UPDATE spp_prestador_presupuesto' +
                ' SET pp_vigenciahasta = ' + SqlDate(dcDesdePresup.Date - 1) + ',' +
                    ' pp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' pp_fechamodif = actualdate ' + sWhere +
                ' AND pp_vigenciadesde < ' + SqlDate(dcDesdePresup.Date) +
                ' AND ((pp_vigenciahasta is null) or (pp_vigenciahasta > ' + SqlDate(dcDesdePresup.Date - 1) + ')  )';  // TK 13013

      EjecutarSqlST(sSql);
      //hago el insert correspondiente
      sSql := 'INSERT INTO spp_prestador_presupuesto (' +
             ' pp_prestador, pp_idnomenclador, pp_idexpediente, pp_vigenciadesde,' +
             ' pp_vigenciahasta, pp_valor, pp_cantidad, pp_usualta, pp_fechaalta) VALUES (' +
             SqlInt(edIdentif.Value) + ',' + SqlInt(fraNomencladorPresup.IdNomenclador) + ',' +
             SqlInt(IdExped) + ',' + SqlDate(dcDesdePresup.Date) + ',' +
             SqlDate(dcHastaPresup.Date) + ',' + SqlNumber(edValorPresup.Value, True) + ',' +
             SqlInt(edCantidadPresup.Value) + ',' + SqlValue(Sesion.UserID) + ', actualdate)';
      EjecutarSqlST(sSql);
      CommitTrans;
      sdqValNomenclador.Refresh;
      MsgBox('Presupuesto cargado correctamente.', MB_ICONINFORMATION);
      DoLimpiarPresup;
      fraNomencladorPresup.SetFocus;
    except
      on E:Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E);
      end;
    end;
  end
  else begin //si es una baja
    sSql := 'UPDATE spp_prestador_presupuesto' +
              ' SET pp_vigenciahasta = ' + SqlDate(dcDesdePresup.Date) + ',' +
                  ' pp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pp_fechamodif = actualdate ' + sWhere;;
    EjecutarSql(sSql);
    sdqValNomenclador.Refresh;
    MsgBox('Presupuesto dado de baja correctamente.', MB_ICONINFORMATION);
    fpABMPresupuesto.ModalResult := mrOk;
  end;
end;

{procedure TfrmManPrestador.btnAceptarRelClick(Sender: TObject);
begin
  Verificar(fraPrestadorRel.IsEmpty, fraPrestadorRel, 'Seleccione el prestador relacionado.');
  Verificar(fraPrestadorRel.IDPrestador = fraPrestadorSel.IDPrestador, fraPrestadorRel,
            'El prestador relacionado debe ser diferente del actual.');
  fpBaja.ModalResult := mrOk;
end; }

procedure TfrmManPrestador.btnAceptarVigenciaClick(Sender: TObject);
begin
  VerificarMultiple (['Registro de fin de vigencia',
                      dedVigenciaHasta,
                      (not dedVigenciaHasta.IsEmpty) and dedVigenciaHasta.IsValid,
                      'Debe indicar una fecha válida',

                      dedVigenciaHasta,
                      dedVigenciaHasta.Date >= sdqValoresPrestador.FieldByName('pd_vigenciadesde').AsDateTime,
                      'La fecha de fin de vigencia debe ser posterior o igual a la fecha de inicio de vigencia'
                     ]);

  fpVigenciaHasta.ModalResult := mrOk
end;

procedure TfrmManPrestador.btnAgregarEmpresaClick(Sender: TObject);
begin
  if (not fraEmpresaPresupuestoAMP.IsEmpty) and (fraEmpresaPresupuestoAMP.ReadOnly = false) then
  begin
    if MsgAsk('¿Desea guardar los cambios realizados hasta ahora?' + CRLF + '(Caso contrario no podrá continuar)') then
    begin
      btnAceptarDatosPrestacionesClick(nil);
      tbPresupuestoAMPClick(nil); //ver aca....
    end;
  end
  else
  begin
    btnAceptarDatosPrestacionesClick(nil);
    tbPresupuestoAMPClick(nil); //ver aca....
  end;
end;

procedure TfrmManPrestador.btnAgregarPreocupClick(Sender: TObject);
begin
  Verificar(Trim(edDescPreocup.Text) = '', edDescPreocup, 'Debe ingresar la descripción.');
  Verificar(dcVigDesdePreocup.IsEmpty, dcVigDesdePreocup, 'Debe ingresar la vigencia desde.');
  if (((AccionExa = Edicion) and not(TieneLoteAutorizado)) or (AccionExa = Alta)) and
     (fpAgregarEstudio.ShowModal = mrOk) then
    sdqValoresExamen.Refresh;
end;

procedure TfrmManPrestador.btnAgregarRegionClick(Sender: TObject);
var
  sSql: String;
begin
  if fraRegiones.IsEmpty then
    Exit;

  sSql := 'SELECT rp_fechabaja' +
           ' FROM crp_regionesprestador' +
          ' WHERE rp_prestador = :prestador' +
            ' AND rp_region = :region';

  if ExisteSqlEx(sSql, [edIdentif.Value, fraRegiones.Codigo]) and (ValorSqlEx(sSql, [edIdentif.Value, fraRegiones.Codigo]) <> Null) then
    sSql := 'UPDATE crp_regionesprestador' +
              ' SET rp_fechabaja = NULL,' +
                  ' rp_usubaja = NULL,' +
                  ' rp_fechaalta = ACTUALDATE,' +
                  ' rp_usualta = :usuario' +
            ' WHERE rp_prestador = :prestador' +
              ' AND rp_region = :region'
  else if not(ExisteSql(sSql)) then
    sSql :=
      'INSERT INTO crp_regionesprestador (rp_usualta, rp_prestador, rp_region, rp_domicilio, rp_fechaalta)' +
                                ' VALUES (:usuario, :prestador, :region , ''N'', ART.ACTUALDATE)';

  EjecutarSqlEx(sSql, [Sesion.UserID, edIdentif.Value, fraRegiones.Codigo]);
  sdqRegiones.Refresh;
end;

procedure TfrmManPrestador.btnAsignarCPClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  BeginTrans;
  try
    for i := 0 to clbLocalidadesSinAsignar.Items.Count - 1 do
    begin
      sSql :=
        'SELECT 1' +
         ' FROM art.apc_prestadorcpostal' +
        ' WHERE pc_fechabaja IS NULL' +
          ' AND pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
          ' AND pc_idcpostal = ' + SqlValue(clbLocalidadesSinAsignar.Values[i]);

      if ExisteSQL (sSql) then
      begin
        sSql :=
          'UPDATE art.apc_prestadorcpostal' +
            ' SET pc_fechabaja = SYSDATE,' +
                ' pc_usubaja = ' + SqlValue(Sesion.UserID) +
          ' WHERE pc_fechabaja IS NULL' +
            ' AND pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
            ' AND pc_idcpostal = ' + SqlValue(clbLocalidadesSinAsignar.Values[i]);

        EjecutarSqlST (sSql);
      end
    end;

    for i := 0 to clbLocalidadesAsignadas.Items.Count - 1 do
    begin
      sSql :=
        'SELECT 1' +
         ' FROM art.apc_prestadorcpostal' +
        ' WHERE pc_fechabaja IS NULL' +
          ' AND pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
          ' AND pc_idcpostal = ' + SqlValue(clbLocalidadesAsignadas.Values[i]);

      if not ExisteSQL(sSql) then
      begin
        sSql :=
          'INSERT INTO art.apc_prestadorcpostal VALUES (art.seq_prestcp_id.NEXTVAL, ' +
                                                        SqlValue(fraPrestadorSel.IDPrestador) + ', ' +
                                                        SqlValue(clbLocalidadesAsignadas.Values[i]) + ', SYSDATE, ' +
                                                        SqlValue(Sesion.UserID) + ', NULL, NULL)';
        EjecutarSqlST(sSql);
      end
    end;

    CommitTrans;
    MessageDlg('Asignaciones registradas.', mtInformation, [mbOk], 0);
    btnAsignarCP.Enabled := false;
  except
    on E: Exception do
    begin
      Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar las asignaciones de CP.');
    end;
  end
end;

procedure TfrmManPrestador.btnCancelarClick(Sender: TObject);
begin
  if (Accion = Edicion) then
  begin
    Accion := None;
    OnPrestadorChange(nil);  // Recarga los controles por si hubo cambios
    if fraPrestadorSel.Baja then
      fraPrestadorSel.SetColors(clRed);
  end
  else
    tbLimpiarClick(Sender); // Limpia TODO

  LockControls(True, True);
  EnableButtons;
end;

procedure TfrmManPrestador.btnCancelarCPClick(Sender: TObject);
begin
  clbLocalidadesAsignadas.ClearChecks;
  clbLocalidadesSinAsignar.ClearChecks;
end;

procedure TfrmManPrestador.btnCancelarPreocupClick(Sender: TObject);
begin
  if MsgAsk('¿Confirma cancelar los cambios realizados?') then
  begin
    Rollback(True);
    fpExamenPreocup.ModalResult := mrCancel;
  end;
end;

procedure TfrmManPrestador.btnEspCancelarClick(Sender: TObject);
begin
  fpEspecialidades.ModalResult := mrCancel;
end;

procedure TfrmManPrestador.btnEspGuardarClick(Sender: TObject);
begin
  Verificar((AccionEsp = Alta) and (cmbEspecialidad.FieldValue = ''), cmbEspecialidad,
            'Debe completar la Especialidad.');
  Verificar((AccionEsp <> Baja) and chkGuardiaActEsp.Checked and
            ((Trim(edDesdeActEsp.Text) = ':') or (Trim(edHastaActEsp.Text) = ':')),
            chkGuardiaActEsp, 'Si selecciona Guardia Activa, debe completar el horario de guardia.');
  Verificar((AccionEsp <> Baja) and chkGuardiaActEsp.Checked and
            (not(IsTime(edDesdeActEsp.Text)) or not(IsTime(edHastaActEsp.Text))),
            edDesdeActEsp, 'Hora incorrecta.');
  Verificar((AccionEsp <> Baja) and chkGuardiaPasEsp.Checked and
            ((Trim(edDesdePasEsp.Text) = ':') or (Trim(edHastaPasEsp.Text) = ':')),
            chkGuardiaPasEsp, 'Si selecciona Guardia Pasiva, debe completar el horario de guardia.');
  Verificar((AccionEsp <> Baja) and chkGuardiaPasEsp.Checked and
            (not(IsTime(edDesdePasEsp.Text)) or not(IsTime(edHastaPasEsp.Text))),
            edDesdePasEsp, 'Hora incorrecta.');

  fpEspecialidades.ModalResult := mrOk;
end;

procedure TfrmManPrestador.btnFiltrarClick(Sender: TObject);
var
  sdqConsulta: TSDQuery;
begin
  if btnAsignarCP.Enabled and (MessageDlg('Hay asignaciones pendientes. ¿ Desea registrarlas antes de cambiar de provincia ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btnAsignarCPClick(Sender);

  if (not fraProvinciasCP.IsSelected) and (Trim (edCPFiltro.Text) = '') and (not fraLocalidades.IsSelected) then
    Exit;

  clbLocalidadesSinAsignar.Clear;
  clbLocalidadesAsignadas.Clear;

  sdqConsulta := GetQuery('SELECT cp_id, cp_codigo || ''  '' || cp_localidad localidad' +
                           ' FROM art.ccp_codigopostal' +
                          ' WHERE 1 = 1' +
                          IIF(fraProvinciasCP.IsSelected, ' AND cp_provincia = ' + SqlValue (fraProvinciasCP.Codigo), '') +
                          IIF(edCPFiltro.Text = '', '',   ' AND cp_codigo = ' + SqlValue (edCPFiltro.Text)) +
                          IIF(fraLocalidades.IsSelected,  ' AND cp_localidad = ' + SqlValue (fraLocalidades.Descripcion), '') +
                          IIF(chkSoloGBA.Visible and
                              chkSoloGBA.Checked,         ' AND cp_gba = ' + SqlValue('S'), '') +
                            ' AND NOT EXISTS(SELECT 1' +
                                             ' FROM art.apc_prestadorcpostal' +
                                            ' WHERE pc_idprestador =  ' + SqlValue(fraPrestadorSel.IDPrestador) +
                                              ' AND cp_id = pc_idcpostal' +
                                              ' AND pc_fechabaja IS NULL)' +
                                         ' ORDER BY cp_codigo, cp_localidad');
  try
    with SdqConsulta do
      while not Eof do
      begin
        clbLocalidadesSinAsignar.Add(FieldByName('localidad').AsString, FieldByName('cp_id').AsString);
        Next;
      end;
  finally
    SdqConsulta.free;
  end;

  sdqConsulta := GetQuery('SELECT cp_id, cp_codigo || ''  '' || cp_localidad localidad' +
                           ' FROM art.apc_prestadorcpostal, art.ccp_codigopostal' +
                          ' WHERE cp_id = pc_idcpostal' +
                            ' AND pc_fechabaja IS NULL' +
                            ' AND pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
                            ' AND cp_provincia = ' + SqlValue (fraProvinciasCP.Codigo) +
                       ' ORDER BY cp_codigo, cp_localidad');
  try
    with SdqConsulta do
      while not Eof do
      begin
        clbLocalidadesAsignadas.Add(FieldByName('localidad').AsString, FieldByName('cp_id').AsString);
        Next;
      end;
  finally
    SdqConsulta.free;
  end;
end;

procedure TfrmManPrestador.btnGuardarClick(Sender: TObject);
var
  Sql, avisoAlta: String;
begin
  if Validar then
  begin
    if Accion = Alta then
    begin

      if msgbox('Desea enviar el aviso automático notificando el alta?', MB_YESNO + MB_ICONQUESTION) = mrYes then
        avisoAlta := 'S'
      else
        avisoAlta := 'N';

      edIdentif.Text := ValorSql('SELECT seq_presta.NextVal FROM DUAL'); // Lo Guarda para Cargarlo despues en el Frame

      // Remplaza la ' por la ´ para compatibilizarse con INDRA
      Sql := 'INSERT INTO cpr_prestador (ca_clave, ca_secuencia, ca_identificador, ca_descripcion, ' +
             ' ca_localidad, ca_codpostal, ca_provincia, ca_calle, ca_numero, ca_pisocalle, ca_departamento, ' +
             ' ca_codpostala, ca_lat, ca_lng, ' +
             ' ca_domicilio, ca_codarea, ca_telefono, ca_celular, ca_prestadormutual, ca_bonificacion, ca_asistencial, ca_retencajamed, ' +
             ' ca_retieneingbrutos, ca_retingresosbrutos, ca_ingresosbrutos, ca_actividad, ca_tipo, ca_concertado, ca_direlectronica, ' +
             ' ca_fechalta, ca_usualta, ca_retganancias, ca_iva, ca_tipocomprobante, ca_diasvenci, ' +
             ' ca_nombrefanta, ca_fax, ca_responsable, ca_especialidad, ca_observaciones, ca_habilitaciones, ' +
             ' ca_cronico, ca_rmn, ca_tac, ca_emg, ca_ambulancia, ca_piso, ca_cti, ca_uco, ca_auti, ca_quirofanos, ' +
             ' ca_guardias, ca_rayos, ca_conex, ca_recladebitos, ca_limite, ca_contrato, ' +
             ' ca_callelegal, ca_numerolegal, ca_pisolegal, ca_departamentolegal, ' +
             ' ca_localidadlegal, ca_provincialegal, ca_codpostallegal, ' +
             ' ca_callecomercial, ca_numerocomercial, ca_pisocomercial, ca_departamentocomercial, ' +
             ' ca_localidadcomercial, ca_provinciacomercial, ca_codpostalcomercial, ' +
             ' ca_contratomutual, ca_visible, ca_fechaimpresionforminscr, ca_cartillaweb, ca_ranking, ' +
             ' ca_matprofesional, ca_tipomatprofesional, ca_cargavalores, ca_fecharevision, ' +
             ' ca_vtoexcganancias, ca_vtoexcingbrutos, ca_observacionesimp, ca_incluyenomenclador, ' +
             ' ca_rx, ca_fkt, ca_ecografia, ca_facturaconanestesia, ca_guardiaact, ca_desdeguardiaact, ca_hastaguardiaact, ' +
             ' ca_guardiapas, ca_desdeguardiapas, ca_hastaguardiapas, ca_ivadiscriminado, ' +
             {' ca_habilitacion, ca_fechavtohabilitacion, ca_respcivil, ca_fecharespcivil, ' +}
             ' ca_idgrupousuario, ca_esreferente, CA_MAILDEBITOS, ca_cem, ' +
             ' ca_avisoalta, ca_mailadministracion, ca_visadodocum, ca_fdoTierraDelFuego) VALUES ( ' +
              SqlString(mskCUIT.Text, True) + ', ' + edSecuencia.TextSql +
              ',' + edIdentif.TextSql  + ' , ' + SqlString(strReplace(edRSocial.Text, '''','´'), True) + ', ' +
              SqlString(fraDireccionPrest.Localidad, True) + ', ' + SqlString(fraDireccionPrest.CodigoPostal, True) + ', ' +
              SqlInt(fraDireccionPrest.Prov) + ', ' + SqlString(fraDireccionPrest.Calle,True) + ', ' + SqlString(fraDireccionPrest.Numero,True) + ', ' +
              SqlString(fraDireccionPrest.Piso,True) + ', ' + SqlString(fraDireccionPrest.Departamento,True) + ', ' +
              SqlString(fraDireccionPrest.CPA, True) + ',' + SqlNumber(fraDireccionPrest.Coordenadas.Latitude,True) + ', ' + SqlNumber(fraDireccionPrest.Coordenadas.Longitude,True) + ', ' +
              SqlString(fraDireccionPrest.Calle + ' ' + fraDireccionPrest.Numero + ' ' +     // <-Es el campo CA_DOMICILIO
                         iif(fraDireccionPrest.Piso <> '', 'Piso ' + fraDireccionPrest.Piso, '')  + ' ' + iif(fraDireccionPrest.Departamento <> '', 'Dpto. ' + fraDireccionPrest.Departamento, ''), true) + ', ' +
              SqlString(edTelCaract.Text, true) + ', ' + SqlString(edTelNumero.Text, True) + ', ' + SqlString(edCelular.Text, True) + ', ' + edPrestMutual.TextSql + ', ' + SqlNumber(edBonificacion.Value) + ', ' +
              IntToStr(edAsistencial.Value) + ', ' + SqlString(IIF(chkRetCajaMedico.Checked, 'S', 'N'), True) + ', ' +
              SqlString(IIF(chkIngBrutos.Checked, 'S', 'N'), True) + ', ' + SqlString(IIF(tbIngresoBrutos.Tag = 0, mskIngBrutosNro.Text, 'CUIT'), True) +
              ', ' + SqlString(cmbIngBrutConcepto.FieldValue, True) + ', ' + SqlInt(edCA_ACTIVIDAD.Value, True) + ', ' +
              SqlString(cmbCaracter.FieldValue, True) + ', ' + SqlString(IIF(chkFactura.Checked, 'S', 'N'), True) + ', ' + SqlString(edEMail.Text, True) + ', ' +
               'SYSDATE, ' + SqlString(Sesion.UserID, True) + ', ' + SqlString(cmbRetDeGanacias.FieldValue, True) + ', ' +
              SqlString(cmbIVA.FieldValue, True) + ', ''' + cmbTipoComprobante.FieldValue + ''', ' + edDiasVenci.TextSql + ', ' +
              SqlString(strReplace(edNFantasia.Text, '''','´'), True) + ', ' + SqlString(edFax.Text, True) + ', ' +
              SqlString(strReplace(edResponsable.Text, '''','´'), True) + ', ' + SqlString(cmbTipoPrestador.FieldValue, True) + ', ' +
              SqlString(strReplace(edObservaciones.Text, '''','´'),True) + ', ' + SqlString(strReplace(edHabilitaciones.Text, '''','´'),True) +  ', ' +
              SqlString(IIF(chkCronicos.Checked, 'S', 'N'), True) + ', ' + SqlString(IIF(chkResonancia.Checked, 'S', 'N'), True) + ', ' +
              SqlString(IIF(chkTAC.Checked, 'S', 'N'), True) + ', ' + SqlString(IIF(chkElectromiograma.Checked, 'S', 'N'), True) + ', ' + SqlString(IIF(chkAmbulancia.Checked, 'S', 'N'), True) + ', ' +
              SqlNumber(edPiso.Text) + ', ' + SqlNumber(edTI.Text) + ', ' + SqlNumber(edTIUnidCor.Text) + ', ' +
              SqlNumber(edAislamTI.Text) + ', ' + SqlNumber(edQuirofano.Text) + ', ' + SqlNumber(edGuardia.Text) + ', ' +
              SqlNumber(edSRayos.Text) + ', ' +  SqlNumber(edConsExt.Text) +  ', ' +
              SqlNumber(edPlazoDebitos.Text) + ', ' + SqlNumber(edLimite.Text, True) + ', ''' + IIF(chkContratoART.Checked, 'S', 'N') + ''', ' +
              SqlString(fraDireccionLegal.cmbCalle.Text,True) + ', ' +  SqlString(fraDireccionLegal.edNumero.Text,True) + ', ' +
              SqlString(fraDireccionLegal.edPiso.Text,True) + ', ' + SqlString(fraDireccionLegal.edDto.Text,True) + ', ' +
              SqlString(fraDireccionLegal.cmbLocalidad.Text, True) + ', ' + SqlInt(fraDireccionLegal.Provincia) + ', ' +
              SqlString(fraDireccionLegal.edCPostal.Text, True) + ', ' +
              SqlString(fraDireccionCom.cmbCalle.Text,True) + ', ' +  SqlString(fraDireccionCom.edNumero.Text,True) + ', ' +
              SqlString(fraDireccionCom.edPiso.Text,True) + ', ' + SqlString(fraDireccionCom.edDto.Text,True) + ', ' +
              SqlString(fraDireccionCom.cmbLocalidad.Text, True) + ', ' + SqlInt(fraDireccionCom.Provincia) + ', ' +
              SqlString(fraDireccionCom.edCPostal.Text, True) + ', ' +
              SqlString(IIF(chkContratoMutualVig.Checked, 'S', 'N'), True) + ', ' +
              SqlString(IIF(chkVisible.Checked, 'S', 'N'), True) + ', ' + SqlDate(edFImprFormInscripc.Date) + ', ' +
              SqlValue(fraCartillaWeb.Codigo) + ', ' + SqlString(edRanking.Text, True) + ', ' +
              SqlString(EdMatProfesional.Text, True) + ', ' + SqlString(IIF(rbMatNacional.Checked, 'N', 'P'), True) + ', ' +
              SqlString(IIF(chkCargaValores.Checked, 'S', 'N'), True) + ',' + SqlDate(dcFechaRevision.Date) + ',' +
              SqlDate(dcVtoGanancias.Date) + ',' + SqlDate(dcVtoIngBrutos.Date) + ',' +
              SqlString(mObsContables.Lines.Text, True) + ', ' + SqlString(IIF(tbIncluirNomenc.Down, 'S', 'N'), True) + ', ' +
              SqlString(IIF(chkRX.Checked, 'S', 'N'), True) + ',' + SqlString(IIF(chkFKT.Checked, 'S', 'N'), True) + ', ' +
              SqlString(IIF(chkEcografia.Checked, 'S', 'N'), True) + ',' +

              SqlString(IIF(chkFactAnestesia.Checked, 'S', 'N'), True) + ',' + SqlString(IIF(chkGuardiaAct.Checked, 'S', 'N'), True) + ',' +
              SqlString(HoraSinMascara(edDesdeAct.Text), True, True) + ',' + SqlString(HoraSinMascara(edHastaAct.Text), True, True) + ',' +
              SqlString(IIF(chkGuardiaPas.Checked, 'S', 'N'), True) + ',' + SqlString(HoraSinMascara(edDesdePas.Text), True, True) + ',' +
              SqlString(HoraSinMascara(edHastaPas.Text), True, True) + ',' + SqlString(IIF(chkIVADiscr.Checked, 'S', 'N'), True) +  ',' +
              {SqlString(IIF(chkHabilitado.Checked, 'S', 'N'), True) + ',' + SqlDate(cmbFechaVtoHabilitacion.Date) + ',' +
              SqlString(IIF(chkRespCivil.Checked, 'S', 'N'), True) + ', ' + SqlDate(cmbFechaRespCivil.Date) + ', ' + }
              sqlvalue(fraUsuariosContrata.ID) + ', ' + sqlstring(iif(chkReferente.Checked, 'S', ''), true) + ', ' + sqlvalue(edMailDebitos.Text) + ',' +
              sqlstring(iif(chkCEM.Checked, 'S', 'N'), true) + ',' + QuotedStr(avisoAlta) + ', ' + SqlValue(edMailAdmin.Text) + ', ' +
              sqlstring(iif(chkVisadoDocum.Checked, 'S', ''), true) + ', ' + SqlString(IIF(chkFdoTierradelFuego.Checked, 'S', 'N'), True) + ')';

    end
    else begin
      if (Accion = Edicion) then
        if (ValorSqlEx('SELECT ca_fechabaja FROM art.cpr_prestador ' +
                          ' WHERE ca_identificador = :Idprest ', [fraPrestadorSel.IDPrestador]) <> '')  then
          // si pasa esto es porque se trata de una Reactivacion del prestador.  TK 15642
        begin
          Do_Guardar_PrestadorHistBajas_Reactiv;

          if msgbox('Desea enviar el aviso automático notificando la reincorporación?', MB_YESNO + MB_ICONQUESTION) = mrYes then
            avisoAlta := 'S'
          else
            avisoAlta := 'N';
        end;

      Sql :=
        'UPDATE cpr_prestador ' +
          ' SET ca_clave = ''' + mskCUIT.Text + ''', ' +
              ' ca_secuencia = ' + edSecuencia.TextSql + ', ' +
              ' ca_descripcion = ' + SqlString(strReplace(edRSocial.Text, '''','´'), True) + ', ' +
              ' ca_prestadormutual = ' + edPrestMutual.TextSql + ', ' +
              ' ca_asistencial = ' + edAsistencial.TextSql + ', ' +
              ' ca_retencajamed = ''' + IIF(chkRetCajaMedico.Checked, 'S', 'N') + ''', ' +
              ' ca_localidad = ' + SqlString(fraDireccionPrest.Localidad, True) + ', ' +
              ' ca_codpostal = ' + SqlString(fraDireccionPrest.CodigoPostal, True) + ', ' +
              ' ca_codpostala = ' + SqlString(fraDireccionPrest.CPA, True) + ', ' +
              ' ca_lat = ' + SqlNumber(fraDireccionPrest.Coordenadas.Latitude, True) + ', ' +
              ' ca_lng = ' + SqlNumber(fraDireccionPrest.Coordenadas.Longitude, True) + ', ' +
              ' ca_provincia = ' + SqlInt(fraDireccionPrest.Prov) + ', ' +
              ' ca_calle = ' + SqlString(fraDireccionPrest.Calle,True) + ', ' +
              ' ca_numero = ' + SqlString(fraDireccionPrest.Numero,True) + ', ' +
              ' ca_pisocalle = ' + SqlString(fraDireccionPrest.Piso,True) + ', ' +
              ' ca_departamento = ' + SqlString(fraDireccionPrest.Departamento,True) + ', ' +
              ' ca_domicilio = ' + SqlString(fraDireccionPrest.Calle + ' ' + fraDireccionPrest.Numero + ' ' +
                                             iif(fraDireccionPrest.Piso <> '', 'Piso ' + fraDireccionPrest.Piso, '')  + ' ' + iif(fraDireccionPrest.Departamento <> '', 'Dpto. ' + fraDireccionPrest.Departamento, ''), True ) + ', ' +
              ' ca_codarea = ' + Sqlstring(edTelCaract.Text, true)      + ', ' +
              ' ca_telefono = ' + SqlString(edTelNumero.Text, True)      + ', ' +
              ' ca_celular = ' + SqlString(edCelular.Text, True)      + ', ' +
              ' ca_bonificacion  = ' + SqlNumber(edBonificacion.Value) + ', ' +
              ' ca_retganancias = ''' + cmbRetDeGanacias.FieldValue + ''', ' +
              ' ca_tipocomprobante = ''' + cmbTipoComprobante.FieldValue + ''', ' +
              ' ca_retieneingbrutos = ''' + IIF(chkIngBrutos.Checked, 'S', 'N') + ''', ' +
              ' ca_retingresosbrutos = ' + SqlString(IIF(tbIngresoBrutos.Tag = 0, mskIngBrutosNro.Text, 'CUIT'), True) + ', ' +
              ' ca_ingresosbrutos = ''' + SqlString(cmbIngBrutConcepto.FieldValue) + ''', ' +
              ' ca_actividad = ' + SqlInt(edCA_ACTIVIDAD.Value, True) + ', ' +
              ' ca_iva = ''' + cmbIVA.FieldValue + ''', ' +
              ' ca_tipo = ' + SqlString(cmbCaracter.FieldValue, True) + ', ' +
              ' ca_concertado = ''' + IIF(chkFactura.Checked, 'S', 'N') + ''', ' +
              ' ca_direlectronica = ' +  SqlString(edEMail.Text, True) + ', ' +
              ' CA_MAILDEBITOS = ' + sqlvalue(edMailDebitos.Text) + ', ' +
              ' ca_mailadministracion = ' + SqlValue(edMailAdmin.Text) + ', ' +
              ' ca_diasvenci = ' +  edDiasVenci.TextSql + ', ' +
              ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
              ' ca_fechamodif = ACTUALDATE, ' +
              ' ca_fechabaja = NULL, ' +
              ' ca_usubaja = NULL, ' +
              ' ca_nombrefanta = ' + SqlString(strReplace(edNFantasia.Text, '''','´'), True) + ', ' +
              ' ca_fax = ' + SqlString(edFax.Text, True) + ', ' +
              ' ca_responsable = ' + SqlString(strReplace(edResponsable.Text, '''','´'), True) + ', ' +
              ' ca_especialidad = ' + SqlString(cmbTipoPrestador.FieldValue, True) + ', ' +
              ' ca_observaciones = ' + SqlString(edObservaciones.Text, True) + ', ' +
              ' ca_habilitaciones = ' + SqlString(edHabilitaciones.Text, True) + ', ' +
              ' ca_cronico = ''' + IIF(chkCronicos.Checked, 'S', 'N') + ''', ' +
              ' ca_rmn = ''' + IIF(chkResonancia.Checked, 'S', 'N') + ''', ' +
              ' ca_tac = ''' + IIF(chkTAC.Checked, 'S', 'N') + ''', ' +
              ' ca_emg = ''' + IIF(chkElectromiograma.Checked, 'S', 'N') + ''', ' +
              ' ca_ambulancia = ''' + IIF(chkAmbulancia.Checked, 'S', 'N') + ''', ' +
              ' ca_piso = ' + edPiso.TextSql + ', ' +
              ' ca_cti = ' + edTI.TextSql + ', ' +
              ' ca_uco = ' + edTIUnidCor.TextSql + ', ' +
              ' ca_auti = ' +  edAislamTI.TextSql + ', ' +
              ' ca_quirofanos = ' + edQuirofano.TextSql + ', ' +
              ' ca_guardias = ' + edGuardia.TextSql + ', ' +
              ' ca_rayos = ' + edSRayos.TextSql + ', ' +
              ' ca_conex = ' + edConsExt.TextSql + ', ' +
              ' ca_recladebitos = ' + edPlazoDebitos.TextSql + ', ' +
              ' ca_limite = ' + edLimite.TextSql + ', ' +
              ' ca_contrato = ''' + IIF(chkContratoART.Checked, 'S', 'N') + ''', ' +
              ' ca_matricula = ' + SqlString(edMatricula.Text,True) + ', ' +
              ' ca_callelegal = ' + SqlString(fraDireccionLegal.cmbCalle.Text,True) + ', ' +
              ' ca_numerolegal = ' + SqlString(fraDireccionLegal.edNumero.Text,True) + ', ' +
              ' ca_pisolegal = ' + SqlString(fraDireccionLegal.edPiso.Text,True) + ', ' +
              ' ca_departamentolegal = ' + SqlString(fraDireccionLegal.edDto.Text,True) + ', ' +
              ' ca_localidadlegal = ' + SqlString(fraDireccionLegal.cmbLocalidad.Text, True) + ', ' +
              ' ca_provincialegal = ' + SqlInt(fraDireccionLegal.Provincia) + ', ' +
              ' ca_codpostallegal = ' + SqlString(fraDireccionLegal.edCPostal.Text, True) + ', ' +
              ' ca_callecomercial = ' + SqlString(fraDireccionCom.cmbCalle.Text,True) + ', ' +
              ' ca_numerocomercial = ' + SqlString(fraDireccionCOm.edNumero.Text,True) + ', ' +
              ' ca_pisocomercial = ' + SqlString(fraDireccionCom.edPiso.Text,True) + ', ' +
              ' ca_departamentocomercial = ' + SqlString(fraDireccionCom.edDto.Text,True) + ', ' +
              ' ca_localidadcomercial = ' + SqlString(fraDireccionCom.cmbLocalidad.Text, True) + ', ' +
              ' ca_provinciacomercial = ' + SqlInt(fraDireccionCom.Provincia) + ', ' +
              ' ca_codpostalcomercial = ' + SqlString(fraDireccionCom.edCPostal.Text, True) + ', ' +
              ' ca_contratomutual = ' + SqlString(IIF(chkContratoMutualVig.Checked, 'S', 'N'), True) + ', ' +
              ' ca_visible = ' + SqlString(IIF(chkVisible.Checked, 'S', 'N'), True) + ', ' +
              ' ca_fechaimpresionforminscr = ' + SqlDate(edFImprFormInscripc.Date) + ', ' +
              ' ca_ranking = ' + SqlString(edRanking.Text, True) + ', ' +
              ' ca_matprofesional = ' + SqlString(EdMatProfesional.Text, True) + ', ' +
              ' ca_tipomatprofesional = ' + SqlString(IIF(rbMatNacional.Checked, 'N', 'P'), True) + ', ' +
              ' ca_cartillaweb = ' + SqlValue(fraCartillaWeb.Codigo) + ', ' +
              ' ca_cargavalores = ' + SqlString(IIF(chkCargaValores.Checked, 'S', 'N'), True) + ', ' +
              //' ca_habilitado = ' + SqlString(IIF(chkHabilitado.Checked, 'S', 'N'), True) + ', ' +
              ' ca_fecharevision = ' + SqlDate(dcFechaRevision.Date) + ',' +
              ' ca_vtoexcganancias = ' + SqlDate(dcVtoGanancias.Date) + ',' +
              ' ca_vtoexcingbrutos = ' + SqlDate(dcVtoIngBrutos.Date) + ',' +
              ' ca_observacionesimp = ' + SqlString(mObsContables.Lines.Text, True) + ',' +
              ' ca_incluyenomenclador = ' + SqlString(IIF(tbIncluirNomenc.Down, 'S', 'N'), True) + ',' +
              ' ca_rx = ' + SqlString(IIF(chkRX.Checked, 'S', 'N'), True) + ',' +
              ' ca_fkt = ' + SqlString(IIF(chkFKT.Checked, 'S', 'N'), True) + ',' +
              ' ca_facturaconanestesia = ' + SqlString(IIF(chkFactAnestesia.Checked, 'S', 'N'), True) + ',' +
              ' ca_ecografia = ' + SqlString(IIF(chkEcografia.Checked, 'S', 'N'), True) + ',' +

              ' ca_guardiaact = ' + SqlString(IIF(chkGuardiaAct.Checked, 'S', 'N'), True) + ',' +
              ' ca_desdeguardiaact = ' + SqlString(HoraSinMascara(edDesdeAct.Text), True, True) + ',' +
              ' ca_hastaguardiaact = ' + SqlString(HoraSinMascara(edHastaAct.Text), True, True) + ',' +
              ' ca_guardiapas = ' + SqlString(IIF(chkGuardiaPas.Checked, 'S', 'N'), True) + ',' +
              ' ca_desdeguardiapas = ' + SqlString(HoraSinMascara(edDesdePas.Text), True, True) + ',' +
              ' ca_hastaguardiapas = ' + SqlString(HoraSinMascara(edHastaPas.Text), True, True) +',' +
              ' ca_ivadiscriminado = ''' + IIF(chkIVADiscr.Checked, 'S', 'N') + ''' ' + ', ' +
              //' ca_fechavtohabilitacion = ' + SqlDate(cmbFechaVtoHabilitacion.Date) + ',' +
              //' ca_respcivil = ' + SqlString(IIF(chkRespCivil.Checked, 'S', 'N'), True) + ', ' +
              //' ca_fecharespcivil = ' + SqlDate(cmbFechaRespCivil.Date) + ', ' +
              ' ca_idgrupousuario = ' + sqlvalue(fraUsuariosContrata.ID) + ', ' +
              ' ca_esreferente = ' + sqlstring(iif(chkReferente.Checked, 'S', ''), true) + ', ' +
              ' ca_cem = ' + sqlstring(iif(chkCEM.Checked, 'S', 'N'), true) + ', ' +
              ' ca_avisoalta = ' + QuotedStr(avisoAlta) + ', ' +
              ' ca_visadodocum = ' + sqlstring(iif(chkVisadoDocum.Checked, 'S', ''), true) + ', ' +
              ' ca_idmotivobaja = null, ' +
              ' ca_fdotierradelfuego = ''' + IIF(chkFdoTierradelFuego.Checked, 'S', 'N') + ''' ' +
        ' WHERE ca_identificador = ' + edIdentif.TextSql;
    end;

    try

      EjecutarSql(Sql);
      if (Accion = Alta) then
        SetRegionSanitariaDom;

      Accion := None;
      if chkCargaValores.Checked then
        ActualizarCargaValores(mskCUIT.Text, edSecuencia.Value);

      LockControls(True, True);
      EnableButtons;
      fraPrestadorSel.Cargar(edIdentif.Value);
      OnPrestadorChange(nil);     // by NWK, 26/06/2003, lo puse para que abra todos los query's asociados, sinó, da error si voy directamente a dar de alta por ej una empresa al realizar el sdqEmpresas.refresh, cuando vuelve del FormPanel
    except
      on E: Exception do
        ErrorMsg(E, 'Error Al Guardar los Datos.');
    end;
  end;
end;

procedure TfrmManPrestador.btnNomAceptarClick(Sender: TObject);    {TODO 2 -oPtavasci: validar chkVP_DEFAULT !!!!!!!! (solo 1 puede estar activo)}
var
  IdValorPrestador, s: Integer;
  sSql, sWhere, vSql: String;
  seguir: boolean;
  bEsUnidadBioquimica: boolean;
begin
  Verificar(not fraNomencladorABM.IsSelected, fraNomencladorABM, 'Debe cargar un nomenclador.');
  Verificar(fraNomencladorABM.Capitulo = 'PP', fraNomencladorABM, 'No se pueden cargar presupuestos desde aquí.');
  Verificar(edValNomVigDesde.Date = 0, edValNomVigDesde, 'Debe cargar la fecha de vigencia desde.');

  Verificar(rbNomMultiplicador.Enabled and rbNomMultiplicador.Checked and (edNomMultiplicador.Value = 0) and (edMultiplicadorGs.Value = 0),
            rbNomMultiplicador, 'Debe cargar valor para algún Multiplicador');

  Verificar((AccionValMod = Alta) and rbNomValor.Checked and (edNomValor.Value = 0) and (edVP_SUMA_FIJA.Value = 0) and  // TK 32845 agregue el (edVP_SUMA_FIJA.Value = 0) para validar
            (not EsCapituloNomencladorNacional(fraNomencladorABM.Capitulo)),
             edNomValor, 'Debe cargar algún valor en el Nomenclador');

  Verificar((AccionValMod = Alta) and rbNomOtros.Checked and
            (edNomGastos.Value = 0) and (edNomHonorarios.Value = 0) and (edVP_SUMA_FIJA.Value = 0),
            rbNomOtros, 'Debe cargar algún valor en el nomenclador.');

  bEsUnidadBioquimica := Es_UnidadBioquimica(fraNomencladorABM.Nomenclador, fraNomencladorABM.Capitulo, fraNomencladorABM.Codigo);   // TK 33995

  Verificar(bEsUnidadBioquimica and (edNomVAlor.Value = 0),
            edNomValor, 'Debe completar el Valor para la prestación de Unidades Bioquímicas.');

  Verificar(bEsUnidadBioquimica and
            ((edNomMultiplicador.Value > 0) or (edMultiplicadorGs.Value > 0) or (edNomGastos.Value > 0) or (edNomHonorarios.Value > 0)),
            edNomValor, 'Sólo se debe completar el valor para la prestación de Unidades Bioquímicas.' );

  if fraNomencladorABM.Capitulo = 'MT' then // Es un traslado...
    Verificar((edVP_MONTO_MINIMO.Value > 0) and (edVP_SUMA_FIJA.Value > 0) and
              (edVP_SUMA_FIJA.Value > edVP_MONTO_MINIMO.Value), edVP_SUMA_FIJA,
              'Si especifica un monto mínimo, éste no puede ser inferior a la suma fija (bajada de bandera para los taxis).');

  try
    sWhere := ' AND vp_prestador = ' + SqlInt(edIdentif.Value) +
              ' AND vp_idnomenclador = ' + SqlInt(fraNomencladorABM.IdNomenclador);
    BeginTrans;
    if edValNomVigDesde.Enabled then    // ES UN ALTA-------------------------------------------------------------
    begin
      if ValorSql('SELECT count(*)' +
                   ' FROM svp_valorprestador' +
                  ' WHERE vp_fechabaja IS NULL AND vp_vigenciahasta = ' + SqlDate(edValNomVigDesde.Date) + sWhere) > 0 then
        MsgBox('El valor ingresado en la fecha desde coincide con una fecha de cierre, por favor, modifíquelo en al menos un día y reintente.')
      else
      begin
        if ValorSql('SELECT count(*)' +
                     ' FROM svp_valorprestador' +
                    ' WHERE vp_fechabaja IS NULL AND ' + edValNomVigDesde.SqlText + ' BETWEEN vp_vigenciadesde AND vp_vigenciahasta ' +
                    sWhere) > 0 then
          MsgBox ('El valor ingresado en la fecha desde se solapa con un periodo existente.')
        else
        begin
          vSql := 'UPDATE svp_valorprestador' +
                    ' SET vp_vigenciahasta = ' + SqlDate(edValNomVigDesde.Date - 1) + ',' +
                        ' vp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                        ' vp_fechamodif = ActualDate ' +
                  ' WHERE vp_vigenciahasta IS NULL ' +
                    ' AND vp_fechabaja IS NULL ' +
                    ' AND vp_vigenciadesde < ' + SqlDate(edValNomVigDesde.Date) + sWhere;
          EjecutarSqlST(vSql);

          edValNomVigHasta.Date := ValorSqlDateTime('SELECT MIN(vp_vigenciadesde) - 1' +
                                                     ' FROM svp_valorprestador ' +
                                                    ' WHERE vp_fechabaja IS NULL ' +
                                                      ' AND vp_vigenciadesde > ' + SqlDate(edValNomVigDesde.Date) + sWhere);

          vSql := 'INSERT INTO svp_valorprestador (' +
                  ' vp_prestador, vp_nomenclador, vp_capitulo, vp_codigo, vp_vigenciadesde,' +
                  ' vp_vigenciahasta, vp_multiplicador, vp_multigastos, vp_anestesia, vp_hiv,' +
                  ' vp_antitetanica, vp_sesiones, vp_valor, vp_valorgastos,' +
                  ' vp_valorhonorarios, vp_usualta, vp_fechaalta, ' +
                  ' vp_monto_minimo, vp_suma_fija, vp_km_incluidos, vp_abona_retorno, vp_default, vp_valordeAMP, ' +
                  ' vp_unicaliquidacion, vp_viaje_exclusivo, vp_viaje_nocturno, vp_viaje_findesemana ) ' +        // TK 32945
                  'VALUES (:prestador, :nom, :cap, :cod, TRUNC(:vig_desde), TRUNC(:vig_hasta), ' +
                         // 'DECODE(:v7, 0, NULL, :v7), ' +      // Multiplicadores: antes ponia nulo si era cero
                         // 'DECODE(:v8, 0, NULL, :v8), ' +
                          ':multiplicador, :multiplicador_gastos, ' + // Multiplicadores: ahora debe poner el 0 si lo es.
                          ':anestesia, :hiv, ' +
                          ':antitetanica, :sesiones, DECODE(:cap, ''MT'', :valor, DECODE(:valor, 0, NULL, :valor)), ' +
                          'DECODE(:gastos, 0, NULL, :gastos), ' +
                          'DECODE(:honorarios, 0, NULL, :honorarios), :usuario, ART.ACTUALDATE, ' +
                          'DECODE(:minimo, 0, NULL, :minimo), DECODE(:sumafija, 0, NULL, :sumafija), ' +
                          'DECODE(:km_incluidos, 0, NULL, :km_incluidos), :retorno, :default, :amp, ' +
                          ':unica, DECODE(:viaje_exclusivo, 0, NULL, :viaje_exclusivo), DECODE(:viaje_nocturno, 0, NULL, :viaje_nocturno), DECODE(:viaje_findesemana, 0, NULL, :viaje_findesemana))';
          EjecutarSqlSTEx(vSql, [edIdentif.Value,
                                 fraNomencladorABM.Nomenclador,
                                 fraNomencladorABM.Capitulo,
                                 fraNomencladorABM.Codigo,
                                 TDateTimeEx.Create(edValNomVigDesde.Date),
                                 TDateTimeEx.Create(edValNomVigHasta.Date),
                                 edNomMultiplicador.Value, //edNomMultiplicador.Value, //Va doble por el DECODE
                                 edMultiplicadorGs.Value, //edMultiplicadorGs.Value, //Va doble por el DECODE
                                 SqlBoolean(chkAnestesia.Checked, False, 'S', 'N'),
                                 SqlBoolean(chkHIV.Checked, False, 'S', 'N'),
                                 SqlBoolean(chkAntitetanica.Checked, False, 'S', 'N'),
                                 edQSesiones.Text,
                                 fraNomencladorABM.Capitulo, edNomValor.Value, edNomValor.Value, edNomValor.Value, //Ver el DECODE
                                 edNomGastos.Value, edNomGastos.Value, //Va doble por el DECODE
                                 edNomHonorarios.Value, edNomHonorarios.Value, //Va doble por el DECODE
                                 Sesion.UserID,
                                 edVP_MONTO_MINIMO.Value, edVP_MONTO_MINIMO.Value, //Va doble por el DECODE
                                 edVP_SUMA_FIJA.Value, edVP_SUMA_FIJA.Value, //Va doble por el DECODE
                                 edVP_KM_INCLUIDOS.Value, edVP_KM_INCLUIDOS.Value, //Va doble por el DECODE
                                 SqlBoolean(chkVP_ABONA_RETORNO.Checked, False, 'S', 'N'),
                                 SqlBoolean(chkVP_DEFAULT.Checked, False, 'S', 'N'),
                                 SqlBoolean(chkValorDeAMP.Checked, False, 'S', 'N'),
                                 SqlBoolean(chkUnicaLiquidacion.Checked, False, 'S', 'N'),
                                 edVP_VIAJE_EXCLUSIVO.Value, edVP_VIAJE_EXCLUSIVO.Value, //Va doble por el DECODE
                                 edVP_VIAJE_NOCTURNO.Value, edVP_VIAJE_NOCTURNO.Value, //Va doble por el DECODE
                                 edVP_VIAJE_FINDESEMANA.Value, edVP_VIAJE_FINDESEMANA.Value  //Va doble por el DECODE
                                 ]);

          sSql := 'SELECT vp_id' +
                   ' FROM svp_valorprestador' +
                  ' WHERE vp_fechabaja IS NULL AND vp_vigenciadesde = ' + SqlDate(edValNomVigDesde.Date) + sWhere;
          IdValorPrestador := ValorSqlInteger(sSql);

          if bEsAltaNomenclador then
            sSql := 'INSERT INTO cpp_prestadorpractica ' +
                    '(pp_idprestador, pp_idvalorprestador, pp_idpractica, ' +
                    ' pp_espractica, pp_fechaalta, pp_usualta)' +
                    ' SELECT ' + SqlInt(fraPrestadorSel.IDPrestador) + ',' +
                                 SqlInt(IdValorPrestador) + ', im_idpracticamodulo, im_espractica, ' +
                                ' actualdate, ' + SqlValue(Sesion.UserId) +
                      ' FROM amed.mim_incluyemodulo' +
                     ' WHERE im_idnomenclador = ' + SqlInt(fraNomencladorABM.IdNomenclador) +
                       ' AND im_fechabaja IS NULL'
          else
            sSql := 'UPDATE cpp_prestadorpractica' +
                      ' SET pp_idvalorprestador = ' + SqlInt(IdValorPrestador) +
                    ' WHERE pp_idprestador = ' + SqlInt(fraPrestadorSel.IDPrestador) +
                      ' AND pp_fechabaja IS NULL' +
                      ' AND pp_idvalorprestador = 0' +
                      ' AND pp_usualta = ' + SqlValue(Sesion.UserID) +
                      ' AND pp_fechaalta = actualdate';
          EjecutarSqlST(sSql);
        end; //else

        CommitTrans;
        fraNomencladorABM.Limpiar;
        edValNomVigHasta.ClearDate;
        edNomMultiplicador.Clear;
        edNomValor.Clear;
        edNomGastos.Clear;
        edNomHonorarios.Clear;
        chkanestesia.Checked    := False;
        chkHIV.Checked          := False;
        chkantitetanica.Checked := False;
        bEsAltaNomenclador      := True;
        fraNomencladorABM.SetFocus;
      end;
    end
    else
    begin // ES UNA BAJA------------------------------------------------------------------------------

      seguir := VerificarVigencia;    //DFG - 21/10/2011

      if seguir = true then
      begin
        // WF 6813
        if dbgValNomenclador.SelectedRows.Count = 0 then
        begin
          vSql := 'UPDATE svp_valorprestador' +
                    ' SET vp_vigenciahasta = ' + SqlDate(edValNomVigHasta.Date) + ',' +
                        ' vp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                        ' vp_fechamodif = actualdate' +
                  ' WHERE vp_vigenciahasta IS NULL AND vp_fechabaja IS NULL ' + sWhere;
          EjecutarSqlST(vSql)
        end
        else
          for s := 0 to dbgValNomenclador.SelectedRows.Count - 1 do
          begin
            dbgValNomenclador.GotoSelection(s);
            vSql := 'UPDATE svp_valorprestador ' +
                      ' SET vp_vigenciahasta = ' + SqlDate(edValNomVigHasta.Date) + ',' +
                          ' vp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                          ' vp_fechamodif = actualdate' +
                    ' WHERE vp_vigenciahasta IS NULL' +
                      ' AND vp_fechabaja IS NULL ' +
                      ' AND vp_prestador = ' + SqlInt(edIdentif.Value) +
                      ' AND vp_idnomenclador = ' + SqlInt(sdqValNomencladorON_ID.AsInteger);
            EjecutarSqlST(vSql)
          end;

       // CommitTrans;
        fpABMNomenclador.ModalResult := mrOk;
      end  //seguir = true
      else
        fpABMNomenclador.ModalResult := mrCancel;
      CommitTrans;
    end;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E);
    end;
  end;
  sdqValNomenclador.Refresh;
end;


//Verifica si hay autorizaciones dentro de la vigencia que se da de baja
//En ese caso, envía mails de aviso a los supervisores  -  DFG 21/10/2011
function TfrmManPrestador.VerificarVigencia(): boolean;
var ssql, cuerpo, direccion: string;
begin
  VerificarVigencia := true;
  if edValNomVigHasta.Date < dbdate then
  begin
    ssql := ' SELECT   au_siniestro, au_orden, au_recaida, au_numauto, ' +
                     ' art.utiles.armar_siniestro (au_siniestro, au_orden, au_recaida) || ' +
                     ' '' Aut.'' || au_numauto siniestro, se_mail ' +
                     ' FROM art.sau_autorizaciones, ' +
                     ' art.sex_expedientes, ' +
                     ' art.mug_usuariogrupotrabajo, ' +
                     ' art.use_usuarios ' +
               ' WHERE au_pres_nomenclador = :nomen ' +
                 ' AND au_pres_capitulo = :cap ' +
                 ' AND au_pres_codigo = :cod ' +
                 ' AND nvl(au_identifapro, au_identifprestador) = :prest ' +
                 ' AND au_estado IN (''A'', ''C'', ''E'') ' +
                 ' AND au_fechasoli > TO_DATE (:fhasta) ' +
                 ' AND au_idexpediente = ex_id ' +
                 ' AND ex_gtrabajo = ug_grupo(+) ' +
                 ' AND ug_tipousuario(+) = ''02'' ' +
                 ' AND ug_fechabaja(+) IS NULL ' +
                 ' AND DECODE (ex_delegacion, ''840'', ug_usuario, ''JBRUNO'') IS NOT NULL ' +
                 ' AND DECODE (ex_delegacion, ''840'', ug_usuario, ''JBRUNO'') = se_usuario ' +
            ' ORDER BY se_mail ';

    if ExisteSqlEx(ssql, [fraNomencladorABM.Nomenclador, fraNomencladorABM.Capitulo, fraNomencladorABM.Codigo, fraPrestadorSel.IDPrestador, datetostr(edValNomVigHasta.Date)]) then
    begin
      sdqBajaVigencia.SQL.Text := ssql;
      sdqBajaVigencia.ParamByName('nomen').AsString := fraNomencladorABM.Nomenclador;
      sdqBajaVigencia.ParamByName('cap').AsString := fraNomencladorABM.capitulo;
      sdqBajaVigencia.ParamByName('cod').AsString := fraNomencladorABM.codigo;
      sdqBajaVigencia.ParamByName('prest').AsInteger := fraPrestadorSel.IDPrestador;
      sdqBajaVigencia.ParamByName('fhasta').AsString := DateToStr(edValNomVigHasta.Date);
      sdqBajaVigencia.Active := true;
      if fpBajaVigencia.ShowModal = mrOK then
      begin
        cuerpo := ' Valor Modulado: ' + fraNomencladorABM.Nomenclador + ' ' + fraNomencladorABM.Capitulo + ' ' + fraNomencladorABM.Codigo + chr(13) +
                  ' Listado de siniestros: ' + chr(13) + chr(13);
        with GetQueryEx(ssql, [fraNomencladorABM.Nomenclador, fraNomencladorABM.Capitulo, fraNomencladorABM.Codigo, fraPrestadorSel.IDPrestador, datetostr(edValNomVigHasta.Date)]) do
        begin
          while not Eof do
          begin
            direccion := fieldbyname('se_mail').AsString;
            while (direccion = fieldbyname('se_mail').AsString) and (not eof) do
            begin
              cuerpo := cuerpo + fieldbyname('siniestro').AsString + chr(13);
              Next;
            end;
            EnviarMailBD(direccion, 'Aviso Automático: Baja de Valor Modulado presente en autorizaciones', [], cuerpo, nil, 0, tcDefault, false, false, 0);
          end;
        end;
      end
      else
        VerificarVigencia := false;
    end;
  end;

end;


procedure TfrmManPrestador.btnPracticasClick(Sender: TObject);
begin
  if (fraNomencladorABM.IdNomenclador > 0) then
    AbrirPracticas(GetValorPrestador(fraPrestadorSel.IDPrestador, fraNomencladorABM.IdNomenclador,
                                     edValNomVigDesde.Date),
                   fraNomencladorABM.IdNomenclador, bEsAltaNomenclador);
end;

procedure TfrmManPrestador.btnQuitarPreocupClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqValoresExamen.Active) or sdqValoresExamen.IsEmpty, dgValoresExamenes,
            'No hay ningún estudio seleccionado.');
  if (((AccionExa = Edicion) and not(TieneLoteAutorizado)) or (AccionExa = Alta)) and
     MsgAsk('¿Confirma dar de baja el estudio seleccionado?') then
  begin
    sSql := 'UPDATE comunes.cei_estudiosincluidos ' +
              ' SET ei_fechabaja = actualdate, ' +
                  ' ei_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE ei_id = ' + SqlInt(sdqValoresExamen.FieldByName('ei_id').AsInteger);
    EjecutarSqlST(sSql);
    sdqValoresExamen.Refresh;
  end;
end;

procedure TfrmManPrestador.btnQuitarRegionClick(Sender: TObject);
var
  sSql: String;
begin
  if (sdqRegiones.FieldByName('RP_DOMICILIO').AsString = 'S') then
    MessageDlg('La región no se puede eliminar ya que es la que pertenece al domicilio del prestador.', mtWarning, [mbOK], 0)
  else if (MessageDlg('¿ Confirma la eliminación de la región seleccionada ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    sSql := 'UPDATE crp_regionesprestador' +
              ' SET rp_fechabaja = ACTUALDATE,' +
                  ' rp_usubaja = :usuario' +
            ' WHERE rp_prestador = :prestador' +
              ' AND rp_region = :region';
    EjecutarSqlEx(sSql, [Sesion.UserID, fraPrestadorSel.IDPrestador, sdqRegiones.FieldByName('RP_REGION').AsString]);
    sdqRegiones.Refresh;
  end;
end;

procedure TfrmManPrestador.chkCargaValoresClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM cpr_prestador' +
          ' WHERE ca_clave = ' + SqlString(sdqDatosCA_CLAVE.AsString) +
            ' AND ca_identificador <> ' + SqlInt(sdqDatosCA_IDENTIFICADOR.AsInteger) +
            ' AND ca_cargavalores = ''S''';
  if (Accion <> Alta) and chkCargaValores.Checked and ExisteSql(sSql) then
  begin
    chkCargaValores.Checked := False;
    InvalidMsg(chkCargaValores, 'Existen otras secuencias del CUIT que ya poseen esta marca.');
  end;
end;

procedure TfrmManPrestador.chkGuardiaActClick(Sender: TObject);
begin
  VclExtra.LockControls([edDesdeAct, edHastaAct], not (chkGuardiaAct.Checked) or (Accion = None));
  if chkGuardiaAct.Checked then
  begin
    if edDesdeAct.CanFocus then
      edDesdeAct.SetFocus;
  end
  else begin
    edDesdeAct.Clear;
    edHastaAct.Clear;
  end;
end;

procedure TfrmManPrestador.chkGuardiaActEspClick(Sender: TObject);
begin
  VclExtra.LockControls([edDesdeActEsp, edHastaActEsp], not (chkGuardiaActEsp.Checked) or (AccionEsp = Baja));
  if chkGuardiaActEsp.Checked then
  begin
    if edDesdeActEsp.CanFocus then
      edDesdeActEsp.SetFocus;
  end
  else begin
    edDesdeActEsp.Clear;
    edHastaActEsp.Clear;
  end;
end;

procedure TfrmManPrestador.chkGuardiaPasClick(Sender: TObject);
begin
  VclExtra.LockControls([edDesdePas, edHastaPas], not (chkGuardiaPas.Checked) or (Accion = None));
  if chkGuardiaPas.Checked then
  begin
    if edDesdePas.CanFocus then
      edDesdePas.SetFocus;
  end
  else begin
    edDesdePas.Clear;
    edHastaPas.Clear;
  end;
end;

procedure TfrmManPrestador.chkGuardiaPasEspClick(Sender: TObject);
begin
  VclExtra.LockControls([edDesdePasEsp, edHastaPasEsp], not (chkGuardiaPasEsp.Checked) or (AccionEsp = Baja));
  if chkGuardiaPasEsp.Checked then
  begin
    if edDesdePasEsp.CanFocus then
      edDesdePasEsp.SetFocus;
  end
  else begin
    edDesdePasEsp.Clear;
    edHastaPasEsp.Clear;
  end;
end;

procedure TfrmManPrestador.chkIngBrutosClick(Sender: TObject);
begin
  if (not sdqIngBrutConceptos.Active) or sdqIngBrutConceptos.IsEmpty then
  begin
    chkIngBrutos.Checked := False;
    chkIngBrutos.Enabled := False;
  end;

  if chkIngBrutos.Checked then
  begin
    cmbIngBrutConcepto.Enabled    := True;
    edCA_ACTIVIDAD.Enabled        := True;
    mskIngBrutosNro.Enabled       := True;
    ToolBarIngresosBrutos.Enabled := True;
  end
  else
  begin
    cmbIngBrutConcepto.Enabled    := False;
    edCA_ACTIVIDAD.Enabled        := False;
    mskIngBrutosNro.Enabled       := False;
    ToolBarIngresosBrutos.Enabled := False;
    cmbIngBrutConcepto.FieldValue := '';
    mskIngBrutosNro.Text          := '';
  end;
end;

procedure TfrmManPrestador.chkPresupuestoAMPClick(Sender: TObject);
begin
  VCLExtra.LockControls(gbDatosPresupuesto, not (chkNuevoAMP.Checked and chkPresupuestoAMP.Checked));
  lupSolicitudPresupuesto.Enabled :=  (chkNuevoAMP.Checked and chkPresupuestoAMP.Checked);
  VCLExtra.LockControls(btnAgregarEmpresa, False);
end;

procedure TfrmManPrestador.chkRetCajaMedicoClick(Sender: TObject);
begin
  lblMatricula.Enabled := not lblMatricula.Enabled;
  edMatricula.Enabled  := not edMatricula.Enabled;
  if edMatricula.Enabled then
    edMatricula.SetFocus
  else
    edMatricula.Text := '';
end;

procedure TfrmManPrestador.clbLocalidadesAsignadasDblClick(Sender: TObject);
var
  Check: Boolean;
  i: Integer;  
begin
  Check := clbLocalidadesAsignadas.CheckCount = 0;

  for i := 0 to clbLocalidadesAsignadas.Items.Count - 1 do
    clbLocalidadesAsignadas.Checked[i] := Check
end;

procedure TfrmManPrestador.clbLocalidadesSinAsignarDblClick(Sender: TObject);
var
  Check: Boolean;
  i: Integer;
begin
  Check := clbLocalidadesSinAsignar.CheckCount = 0;

  for i := 0 to clbLocalidadesSinAsignar.Items.Count - 1 do
    clbLocalidadesSinAsignar.Checked[i] := Check
end;

procedure TfrmManPrestador.cmbPresupuestoChange(Sender: TObject);
var
  sSQL: String;
begin
  grdAMP.DataSource := dsValoresPrestador;
  sSQL := FSQLValoresPrestador;
  sdqValoresPrestador.Close;

  AddCondition_UNION(sSQL, ' pd_vigenciahasta IS NULL ');      // TK 24056
  if not VarIsNull(cmbPresupuesto.KeyValue) then
  begin
    OpenQueryEx(sdqEmpresasPresupuestoAMP, [sdqPresupuestosAMP.FieldByName('PP_NROPRESUPUESTO').AsInteger]);
    AddCondition_UNION(sSQL, ' pp_id = :Prestador ');
    OpenQueryEx(sdqValoresPrestador, [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador,
                                      sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador],  sSQL);
  end
  else
  begin
    AddCondition_UNION(sSQL, ' pp_id IS NULL ');
    OpenQueryEx(sdqValoresPrestador, [fraPrestadorSel.IDPrestador, fraPrestadorSel.IDPrestador],  sSQL);
    sdqEmpresasPresupuestoAMP.Close;
  end;

  GridPresupuestosDetalle.Visible := not VarIsNull(cmbPresupuesto.KeyValue);
  SeparadorPresupuestos.Visible := not VarIsNull(cmbPresupuesto.KeyValue);
  pnlDetalleEmpresas.Visible := not VarIsNull(cmbPresupuesto.KeyValue);

  tbModificarPresupuestoAMP.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarPresupuestoAMP) and not VarIsNull(cmbPresupuesto.KeyValue);
  tbModificarValoresAMP.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarValoresAMP) and VarIsNull(cmbPresupuesto.KeyValue);
  tbBajaPresupuesto.Enabled := (Accion = Edicion) and Seguridad.Activar(tbBajaPresupuesto) and not VarIsNull(cmbPresupuesto.KeyValue);

  if sdqPresupuestosAMP.Active and not sdqPresupuestosAMP.IsEmpty then
  begin
    if VarIsNull(cmbPresupuesto.KeyValue) or sdqPresupuestosAMP.FieldByName('PP_FECHABAJA').IsNull then
      pnlLabelPresupuesto.Font.Color := clBlack
    else
      pnlLabelPresupuesto.Font.Color := clRed;
  end;
  //if not VarIsNull(cmbPresupuesto.KeyValue) then   //PROBANDO
    //GridPresupuestosDetalleCellClick(nil);         //PROBANDO     
end;

procedure TfrmManPrestador.cmbRetDeGanaciasExit(Sender: TObject);
begin
  if (cmbRetDeGanacias.FieldValue <> '99') and (cmbIVA.FieldValue = '4')  then
  begin
    cmbRetDeGanacias.FieldValue := '99';
    MsgBox('Cuando el IVA es "' + cmbIVA.Text + '" las ganancias deben ser "' + cmbRetDeGanacias.Text + '".', MB_ICONINFORMATION);
  end;
end;

procedure TfrmManPrestador.cmbTipoPrestadorCloseUp(Sender: TObject);
begin
  CheckBaja;
  CheckDatosMedicos;
  CheckVisible;
end;

procedure TfrmManPrestador.cmbTipoPrestadorGetCellParams(Sender: TObject;Field: TField; AFont: TFont;
                                                         var Background: TColor; Highlight: Boolean);
begin
  if not sdqTipoPrestador.FieldByName('TP_FBAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManPrestador.CmdAceptarVUMClick(Sender: TObject);
var
  sSql: String;
  i: integer;
begin
  Verificar(not fraUnidad.IsSelected, fraUnidad.edCodigo, 'Debe cargar una Unidad.');
  Verificar(VigDdeVUM.Date = 0, VigDdeVUM, 'Debe cargar la fecha de Vigencia Desde.');
 // Verificar(edNomValorVUM.Value = 0, Nil, 'Debe cargar algún valor en la unidad.');    // por TK 30732
  if modoABMVUMed <> 'Baja' then
  begin
    Verificar(((fraUnidad.edCodigo.Text = '11') or (fraUnidad.edCodigo.Text = '12')) and
              (edNomValorVUM.Value <> 0), edNomValorVUM,
              'Para las unidades "Sin Gastos" o "Sin Honorarios" el valor debe ser Cero.');  // por TK 30732: se velidara solo esto, conversado hoy 01/09/11 con Soledad Coman.
    Verificar(ValorSqlDateTimeEx(' SELECT MAX (up_vigenciahasta) ' +
                                  '  FROM sup_unidadprestador ' +
                                  ' WHERE up_prestador = :prest ' +
                                  '   AND up_unidad = :unid ' +
                                  '   AND up_fechabaja IS NULL ', [fraPrestadorSel.IDPrestador, fraUnidad.Codigo]) >= VigDdeVUM.Date,
                                                                   VigDdeVUM, 'La vigencia se solapa con una existente previamente');

  end;

  try
    BeginTrans;
    if VigDdeVUM.Enabled then   // ES UN ALTA-----------------------------------
    begin
      sSql := 'UPDATE sup_unidadprestador' +
                ' SET up_vigenciahasta = ' + SqlDate(VigDdeVUM.Date - 1) +
              ' WHERE up_prestador = ' + SqlInt(edIdentif.Value) +
                ' AND up_unidad = ' + SqlValue(fraUnidad.Codigo) +
                ' AND up_vigenciahasta IS NULL' +
                ' AND up_fechabaja IS NULL ';
      EjecutarSqlST(sSql);
      sSql := 'INSERT INTO sup_unidadprestador ' +
              '(up_prestador, up_unidad, up_vigenciadesde, up_valor) VALUES (' +
              SqlInt(edIdentif.Value) + ',' + SqlValue(fraUnidad.Codigo) + ',' +
              VigDdeVUM.SqlText + ',' + SqlNumber(edNomValorVUM.Value, False) + ')';   // TK 30732 cambio el True por el False
      EjecutarSqlST(sSql);
      fraUnidad.Clear;
      edNomValorVUM.Clear;
      //VigHtaVUM.ClearDate;
      fraunidad.edCodigo.SetFocus;
    end
    else begin   // ES UNA BAJA-------------------------------------------------
      // Lu WF 7247
      if dBGVUM.SelectedRows.Count = 0 then
      begin
        sSql := 'UPDATE sup_unidadprestador' +
                  ' SET up_vigenciahasta = ' + VigHtaVUM.SqlText +
                 ' WHERE up_prestador = ' + SqlInt(edIdentif.Value) +
                   ' AND up_unidad = ' + SqlValue(sdqVUMedUP_UNIDAD.AsString) +
                   ' AND up_vigenciadesde = ' + sqlDate(sdqVUMedUP_VIGENCIADESDE.AsDateTime) +
                   ' AND up_vigenciahasta IS NULL';
        EjecutarSqlST(sSql);
      end
      else
        for i := 0 to dBGVUM.SelectedRows.Count - 1 do
        begin
          dBGVUM.GotoSelection(i);
          sSql := 'UPDATE sup_unidadprestador' +
                    ' SET up_vigenciahasta = ' + VigHtaVUM.SqlText +
                  ' WHERE up_prestador = ' + SqlInt(edIdentif.Value) +
                    ' AND up_unidad = ' + SqlValue(sdqVUMedUP_UNIDAD.AsString) +
                    ' AND up_vigenciadesde = ' + sqlDate(sdqVUMedUP_VIGENCIADESDE.AsDateTime) +
                    ' AND up_vigenciahasta IS NULL';
          EjecutarSqlST(sSql)
        end;
    end;
    CommitTrans;
    //fpABMVUMed.ModalResult := mrOk;
    fraUnidad.Clear;
    edNomValor.Clear;
    LockVUMControls (True);
  except
    on E: Exception do
    begin
      if InTransaction then Rollback;
      ErrorMsg(E);
    end;
  end;
  sdqVUMED.Refresh;
end;

procedure TfrmManPrestador.dbgContratosCellClick(Column: TColumn);
begin
  CargarContratos;
end;

procedure TfrmManPrestador.dbgContratosDblClick(Sender: TObject);
begin
  if tbModificarContrato.Enabled then tbModificarContratoClick(nil);
end;

procedure TfrmManPrestador.dbgEmpresasDblClick(Sender: TObject);
begin
  if tbModificarEmpresa.Enabled then
    tbModificarEmpresaClick(Sender);
end;

procedure TfrmManPrestador.dbgEmpresasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                    Highlight: Boolean);
begin
  if not sdqEmpresas.FieldByName('FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManPrestador.dbgGrillaEspDblClick(Sender: TObject);
begin
  if tbModificarEsp.Enabled then tbModificarEspClick(nil);
end;

procedure TfrmManPrestador.dbgGrillaEspGetCellParams(Sender: TObject;Field: TField; AFont: TFont; var Background: TColor;
                                                     Highlight: Boolean);
begin
  if not sdqEspecialidades.FieldByName('PE_FECHABAJA').IsNull then
  begin
    if Highlight then
    begin
      Background := clMaroon;
      AFont.Color := clWhite;
    end
    else
      AFont.Color := clRed;
  end;
end;

procedure TfrmManPrestador.dbgValNomencladorGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
const
  clDeshabilitado = $00DADADA;
var
   bChange: Boolean;
begin
  bChange := False;
  if not sdqValNomencladorVIGENCIAHASTA.IsNull then
    AFont.Color := clRed;

  if AreIn(Field.FieldName, ['VP_MULTIPLICADOR', 'VP_VALOR', 'VP_VALORGASTOS', 'VP_VALORHONORARIOS']) then
    bChange := Field.IsNull
  else if AreIn(Field.FieldName, ['VP_HONINTERNADOS', 'VP_HONAMBULATORIOS', 'VP_GASTOINTERNADOS', 'VP_GASTOAMBULATORIOS']) then
    bChange := True;

  if bChange and (not Highlight) then
    Background := clDeshabilitado;
end;

procedure TfrmManPrestador.dBGVUMGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                               Highlight: Boolean);
const
  clDeshabilitado = $00DADADA;
var
  bChange: Boolean;
begin
  if not SDQVUMedUP_VIGENCIAHASTA.IsNull then
    AFont.Color := clRed;

  bChange := False;
  if AreIn(Field.FieldName,['VP_MULTIPLICADOR', 'VP_VALOR']) then
    bChange := Field.IsNull
  else if AreIn(Field.FieldName, ['VP_HONINTERNADOS', 'VP_HONAMBULATORIOS', 'VP_GASTOINTERNADOS', 'VP_GASTOAMBULATORIOS']) then
    bChange := True;

  if bChange and (not Highlight) then
    Background := clDeshabilitado;
end;

procedure TfrmManPrestador.dgExamenesDblClick(Sender: TObject);
begin
  if sdqExamenes.Active and not(sdqExamenes.IsEmpty) and tbModificarPreocup.Enabled then
    tbModificarPreocupClick(Nil);
end;

procedure TfrmManPrestador.dgExamenesDetalleDblClick(Sender: TObject);
var
  sSql :String;
begin
  if sdqDetalleExamen.Active and not(sdqDetalleExamen.IsEmpty) and tbModificarPreocup.Enabled then
  begin
    Verificar(not(sdqDetalleExamen.FieldByName('le_fechaaut').IsNull),
              dgExamenesDetalle, 'El lote seleccionado ya ha sido autorizado.');
    edCantExa.Value         := sdqDetalleExamen.FieldByName('le_cantidad').AsInteger;
    fraEmpresaExamen.ID     := sdqDetalleExamen.FieldByName('le_idempresa').AsInteger;
    fraEstabExamen.ID       := sdqDetalleExamen.FieldByName('le_establecimiento').AsInteger;
    btnPersonasLote.Enabled := True;
    if fpAltaEmpresaPreocup.ShowModal = mrOk then
    begin
      sSql := 'UPDATE comunes.cle_lotesexamenes ' +
                ' SET le_cantidad = ' + SqlInt(edCantExa.Value) + ',' +
                    ' le_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' le_fechamodif = ActualDate ' +
              ' WHERE le_id = ' + SqlInt(sdqDetalleExamen.FieldByName('le_id').AsInteger);
      EjecutarSql(sSql);
      sdqDetalleExamen.Refresh;
    end;
  end;
end;

procedure TfrmManPrestador.dgExamenesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqExamenes.FieldByName('ep_vigenciahasta').IsNull and
     (sdqExamenes.FieldByName('ep_vigenciahasta').AsDateTime <= dHoy) then
      AFont.Color := clPurple;
end;

procedure TfrmManPrestador.edNomMultiplicadorExit(Sender: TObject);
begin
//  edmultiplicadorgs.Text := edNommultiplicador.Text;     se saca por el momento segun lo conversado con Soledad Coman.
end;

procedure TfrmManPrestador.edPrestMutualExit(Sender: TObject);
begin
  if (edPrestMutual.Value = 0) and (not edPrestMutual.ReadOnly) then
    edPrestMutual.Text := '1';
end;

procedure TfrmManPrestador.edRankingExit(Sender: TObject);
begin
  if ((Trim(edRanking.Text) = '') and (not edRanking.ReadOnly)) or
     (not(AreIn(Trim(edRanking.Text), ['A', 'B', 'C', 'D']))) then
    edRanking.Text := 'C';
end;

procedure TfrmManPrestador.edRSocialExit(Sender: TObject);
begin
  if (Trim(edNFantasia.Text) = '') then
    edNFantasia.Text := edRSocial.Text;
end;

procedure TfrmManPrestador.edSiniestroPresupSelect(Sender: TObject);
begin
  inherited;
  
  if ExisteSqlEx('SELECT 1 ' +
                  ' FROM sex_expedientes' +
                 ' WHERE ex_siniestro = :SIN' +
                   ' AND ex_orden = :ORD' +
                   ' AND ex_recaida = :REC' +
                   ' AND NVL(ex_causafin, :V1) NOT IN (:V2, :V3)', [edSiniestroPresup.Siniestro,
                                                                    edSiniestroPresup.Orden,
                                                                    edSiniestroPresup.Recaida,
                                                                    '0', '99', '95']) then
  begin
    {
    edTrabajadorPresup.Text := ValorSqlEx('SELECT tj_nombre' +
                                           ' FROM sex_expedientes, ctj_trabajadores' +
                                          ' WHERE ex_cuil = tj_cuil' +
                                            ' AND ex_siniestro = :SIN' +
                                            ' AND ex_orden = :ORD' +
                                            ' AND ex_recaida = :REC', [edSiniestroPresup.Siniestro,
                                                                       edSiniestroPresup.Orden,
                                                                       edSiniestroPresup.Recaida]);   }
    with GetQueryEx('SELECT tj_nombre, tj_cuil' +
                     ' FROM sex_expedientes, ctj_trabajadores' +
                    ' WHERE ex_cuil = tj_cuil' +
                      ' AND ex_siniestro = :SIN' +
                      ' AND ex_orden = :ORD' +
                      ' AND ex_recaida = :REC', [edSiniestroPresup.Siniestro,
                                                 edSiniestroPresup.Orden,
                                                 edSiniestroPresup.Recaida]) do
    begin
      edTrabajadorPresup.Text := fieldbyname('tj_nombre').AsString;
      if rgUltSin.ItemIndex = 0 then
        with GetQueryEx(' SELECT * ' +
                          ' FROM (SELECT   ex_siniestro, ex_orden, ex_recaida ' +
                                  ' FROM art.sex_expedientes ' +
                                 ' WHERE ex_cuil = :cuil ' +
                              ' ORDER BY ex_siniestro DESC, ex_recaida DESC) ' +
                         ' WHERE ROWNUM = 1 ', [fieldbyname('tj_cuil').AsString]) do

          edSiniestroPresup.SetValues(fieldbyname('ex_siniestro').AsInteger, fieldbyname('ex_orden').AsInteger,
                                      fieldbyname('ex_recaida').AsInteger);

    end;
  end
  else
  begin
    MsgBox('El Siniestro seleccionado no existe, por favor ingrese uno válido', MB_ICONINFORMATION);
    edSiniestroPresup.Clear;
    edSiniestroPresup.SetFocus;
  end;
end;

procedure TfrmManPrestador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuMantPrestadores.Enabled := True;
  Action := caFree;
end;

procedure TfrmManPrestador.FormCreate(Sender: TObject);
begin
  tsRemis.TabVisible := False;
  tsZonas.TabVisible := False;
  dHoy := DBDate;
  FSQLValoresPrestador    := sdqValoresPrestador.SQL.Text;
  FSQLValoresNomenclador  := sdqValNomenclador.SQL.Text;
  FSQLValoresPrestaciones := sdqValoresPrestaciones.SQL.Text;
  FSQLValoresExamenes     := sdqExamenes.SQL.Text;
  FSQLValoresUnidMed      := SDQVUMed.SQL.Text;
  FSQLContratos           := sdqContratos.SQL.Text;
  clbLocalidadesSinAsignar.AutoAjustarColumnas := False;
  clbLocalidadesAsignadas.AutoAjustarColumnas  := False;
  lblCantidadEstudios.Caption := '';
  lblNroEstudio.Caption       := '';
  with fraCartillaWeb do
  begin
    Clave     := 'CAWEB';
    ShowBajas := False;
  end;

  with fraTipoContratoABM do
  begin
    Clave := 'TICON';
    ShowBajas := False;
  end;

  with fraRegiones do
  begin
    Clave := 'REGSA';
    ShowBajas := False;
  end;

  with fraProvinciasCP do
  begin
    TableName   := 'cpv_provincias';
    FieldID     := 'pv_codigo';
    FieldCodigo := 'pv_codigo';
    FieldDesc   := 'pv_descripcion';
  end;

  with fraLocalidades do
  begin
    TableName   := 'ccp_codigopostal';
    FieldID     := 'cp_codigo';
    FieldCodigo := 'cp_codigo';
    FieldDesc   := 'cp_localidad';
  end;

  with fraUnidad do
  begin
    TableName   := 'SUM_UNIDADESMEDICAS';
    FieldID     := 'UM_CODIGO';
    FieldCodigo := 'UM_CODIGO';
    FieldDesc   := 'UM_DESCRIPCION';
    FieldBaja   := 'UM_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraUsuariosContrata do
  begin
    TableName   := 'SIN.sgp_gruposprestador';
    FieldID     := 'gp_id';
    FieldCodigo := 'gp_codigo';
    FieldDesc   := 'gp_descripcion';
    FieldBaja   := 'gp_fechabaja';
    ShowBajas   := True;
  end;

  with fraMotivoBaja do
  begin
    TableName   := 'SIN.smp_motivobajaprestador';
    FieldID     := 'MP_ID';
    FieldCodigo := 'MP_CODIGO';
    FieldDesc   := 'MP_DESCRIPCION';
    FieldBaja   := 'MP_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraMotivoBajaFP do
  begin
    TableName   := 'SIN.smp_motivobajaprestador';
    FieldID     := 'MP_ID';
    FieldCodigo := 'MP_CODIGO';
    FieldDesc   := 'MP_DESCRIPCION';
    FieldBaja   := 'MP_FECHABAJA';
    ShowBajas   := false;
    OnChange    := fraMotivoBajaFPChange;
  end;

  try
    sdqTipoComprobante.Open;
    sdqIVA.Open;
    sdqRetDeGanacias.Open;
    sdqCaracter.Open;
    sdqTipoPrestador.Open;
    fraPrestadorSel.OnChange          := OnPrestadorChange;
    fraPrestadorSel.ShowBajas         := True;
    fraPrestadorSel.ShowNombreFanta   := True;
    fraProvinciasCP.OnChange          := OnProvinciasCPChange;
    fraNomencladorABM.OnChange        := OnNomencladorChange;
    fraPP_IDESTABLECIMIENTO.OnChange  := OnEstablecimientoAMPChange;
    fraEmpresaPresupuestoAMP.OnChange := OnEmpresaPresupuestoAMPChange;
    fraEmpresaExamen.OnChange         := OnEmpresaExamenChange;
    fraDomicilioGISRemis.OnChange     := OnDomicilioGISRemisChange;
    fraEmpresaFiltroAMP.OnChange      := OnEmpresaFiltroAMPChange;
    LockControls(True, True); // Desactiva todos los Controles
    pcDatos.ActivePageIndex := 0;
    //fraEmpresaEmp.ShowBajas := False;
    fraEmpresaEmp.ExtraCondition := ' AND ((co_fechabaja IS NULL) OR (co_estado = 13)) ';

    fraNomencladorPresup.SoloPresup   := True;
    fraNomencladorABM.ShowCabecera    := True;

    fraPrestadorSel.ExtraCondition := ' AND ca_fechabaja is null ';

    RegSelecReplicar := TStringList.Create;
    RegSelecReplicarUM := TStringList.Create;
    vclextra.LockControls([dcActaDesig, dcContSoc, dcActaDesig1, dcContSoc1]);
    VclExtra.LockControls([fraDelegacion], not chkConsultorio.Checked);   // TK 48426

    mnuVigentesExamenes.Checked := False;
    mnuTodosExamenes.Checked    := True;

  except
    MsgBox('Error al abrir el Formulario' + #13 + 'Informe de este error a Sistemas.');
    Close;
  end;
end;

procedure TfrmManPrestador.fpAgregarEstudioBeforeShow(Sender: TObject);
begin
  fraEstudioPreocup.Clear;
end;

procedure TfrmManPrestador.fpAltaEmpresaPreocupBeforeShow(Sender: TObject);
begin
  edExamenSel.Text := sdqExamenes.FieldByName('ep_descripcion').AsString;
  VclExtra.LockControls([fraEmpresaExamen, fraEstabExamen], fraEmpresaExamen.IsSelected);
end;

procedure TfrmManPrestador.fpAsignacionLocalidadesClose(Sender: TObject; var Action: TCloseAction);
begin
  if btnAsignarCP.Enabled and (MessageDlg('Hay asignaciones pendientes. ¿ Desea registrarlas antes de salir ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btnAsignarCPClick(Sender);
end;

{procedure TfrmManPrestador.fpBajaBeforeShow(Sender: TObject);
begin
  fraPrestadorRel.Clear;
  chkTransfAut.Checked := False;
end;}

procedure TfrmManPrestador.fpValoresPrestacionesClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsValoresPrestaciones.EmptyDataSet;
  cdsValoresPrestaciones.Close;
end;

//DFG 10/04/12
procedure TfrmManPrestador.fpValoresPrestacionesShow(Sender: TObject);
begin
  FOrdDesc := False;

  if chkNuevoAMP.Checked then      //nuevo presupuesto
  begin
    nNroPresupuesto := ValorSQLInteger('SELECT MAX(PP_NROPRESUPUESTO) FROM COMUNES.CPP_PRESUPUESTOPRESTADOR') + 1;
    tieneValores := false;
    chkViatico.Checked := false;
  end
  else                            //modifocación de presupuesto existente
    nNroPresupuesto := sdqPresupuestosAMP.FieldByName('PP_NROPRESUPUESTO').AsInteger;

end;

procedure TfrmManPrestador.fraDireccionLegaledProvinciaChange(Sender: TObject);
begin
  if fraDireccionLegal.Provincia <> -1 then
  begin
     sdqIngBrutConceptos.Close;
     sdqIngBrutConceptos.ParamByName('pProvincia').AsInteger := fraDireccionLegal.Provincia;
     sdqIngBrutConceptos.Open;
     if sdqIngBrutConceptos.IsEmpty then
     begin
       chkIngBrutos.Checked := False;
       chkIngBrutos.Enabled := False;
     end
     else
       chkIngBrutos.Enabled := True;
  end
  else
  begin
    sdqIngBrutConceptos.Close;
    chkIngBrutos.Enabled := False;
    chkIngBrutos.Checked := False;
  end;
end;

procedure TfrmManPrestador.fraDireccionPrestcmbLocalidadCloseUp(Sender: TObject);
begin
  fraDireccionPrest.cmbLocalidadCloseUp(Sender);
  SetRegionSanitariaDom;
end;

procedure TfrmManPrestador.fraNomencladorABMExit(Sender: TObject);
var
  sSql :String;
begin
  OnNomencladorChange(nil);
  fraNomencladorABM.FrameExit(Sender);
  sSql:= 'SELECT nvl(max(vp_vigenciahasta), to_date(''01/01/1900'', ''dd/mm/yyyy''))' +
          ' FROM svp_valorprestador' +
         ' WHERE vp_prestador = :IdPres ' +
           ' AND vp_idnomenclador = :IdNome ' +
           ' AND vp_vigenciahasta IS NULL ' +
           ' AND vp_fechabaja IS NULL ';
  edValNomVigdesde.MinDate := ValorSqlDateTimeEx(sSql, [edIdentif.Value, fraNomencladorABM.IdNomenclador]);

  sSql:= 'SELECT tb_especial1 ' +
          ' FROM ctb_tablas ' +
         ' WHERE tb_clave = ''TNOME'' ' +
           ' AND tb_codigo = :Cap ';

 // if ValorSqlEx(sSql, [fraNomencladorABM.Capitulo]) = 'N' then
  if LeftStr(ValorSqlEx(sSql, [fraNomencladorABM.Capitulo]), 1) = 'N' then  // DGastal 14/06/2011
  begin
    rbNomMultiplicador.Enabled := False;
    rbNomValor.Checked := True;
  end
  else
    rbNomMultiplicador.Enabled := True;

  if edNomValor.CanFocus then
    try
      edNomValor.SetFocus;
    except
    end;
end;

procedure TfrmManPrestador.grdAMPGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqValoresPrestador.FieldByName('es_fechabaja').IsNull)
    or (not sdqValoresPrestador.FieldByName('VigHastaEstudio').IsNull) then  // TK 24056
    AFont.Color := clRed
  else
    if not sdqValoresPrestador.FieldByName('pd_vigenciahasta').IsNull then
      if not ((sdqValoresPrestador.FieldByName('pd_vigenciahasta').AsDateTime >= dHoy) and
              (dHoy <= sdqValoresPrestador.FieldByName('pd_vigenciahasta').AsDateTime)) then
      AFont.Color := clPurple;
end;

procedure TfrmManPrestador.grdEstudiosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                    Highlight: Boolean);
begin
  if not cdsValoresPrestaciones.FieldByName('es_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManPrestador.grdEstudiosKeyPress(Sender: TObject; var Key: Char);
begin
//  if ActiveControl = grdEstudios then
  begin
    if Key = '.' then
      Key := ','
    else
      if Key = #13 then
      begin
        Key := #0;
        grdEstudios.DataSource.DataSet.Next
      end
  end;
end;

procedure TfrmManPrestador.grdEstudiosTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin

  cdsValoresPrestaciones.IndexFieldNames := Field.FieldName;
  {if FOrdDesc then
    grdEstudios.SortMarker := smDown
  else
    grdEstudios.SortMarker := smUp; }
end;

procedure TfrmManPrestador.mnuIngBrutosClick(Sender: TObject);
begin
  if Sender = mnuNroIngBrutos then
    SetTipoIngBrutos(True)
  else
    SetTipoIngBrutos(False);
end;

procedure TfrmManPrestador.mnuVigentesExamenesClick(Sender: TObject);
var
  sSql: String;
begin
  mnuVigentesExamenes.Checked := True;
  mnuTodosExamenes.Checked    := False;

  sSql := FSQLValoresExamenes;
  AddCondition(sSql, ' ep_vigenciahasta IS NULL ');
  OpenQueryEx(sdqExamenes, [fraPrestadorSel.IDPrestador], sSql);
end;


procedure TfrmManPrestador.mnuTodosExamenesClick(Sender: TObject);
var
  sSql: String;
begin
  mnuVigentesExamenes.Checked := False;
  mnuTodosExamenes.Checked    := True;

  sSql := FSQLValoresExamenes;
  OpenQueryEx(sdqExamenes, [fraPrestadorSel.IDPrestador], sSql);
end;

procedure TfrmManPrestador.mnuVisualizarSoloVigentes_NomencladorClick(Sender: TObject);
var
  sSQL: String;
begin
  mnuVisualizarSoloVigentes_Nomenclador.Checked := true;
  mnuVisualizarTodos_Nomenclador.Checked := false;
  VigHtaFiltroVM.Clear;
  vclextra.LockControl(VigHtaFiltroVM);
  sSQL := FSQLValoresNomenclador;
  AddCondition(sSQL, ' vigenciahasta IS NULL ');
  if not VigDdeFiltroVM.IsEmpty then
    sSQL := sSQL + ' AND vp_vigenciadesde >= ' + VigDdeFiltroVM.SqlText;
  if not VigHtaFiltroVM.IsEmpty then
    sSQL := sSQL + ' AND vigenciahasta <= ' + VigHtaFiltroVM.SqlText;

  OpenQueryEx(sdqValNomenclador, [fraPrestadorSel.IDPrestador, fraPrestadorSel.IDPrestador],  sSQL);
end;

procedure TfrmManPrestador.mnuVisualizarTodos_NomencladorClick(Sender: TObject);
var
  sSQL: String;
begin
  mnuVisualizarTodos_Nomenclador.Checked := true;
  mnuVisualizarSoloVigentes_Nomenclador.Checked := false;
  sSQL := FSQLValoresNomenclador;
  vclextra.LockControl(VigHtaFiltroVM, false);
  if not VigDdeFiltroVM.IsEmpty then
    sSQL := sSQL + ' AND vp_vigenciadesde >= ' + VigDdeFiltroVM.SqlText;
  if not VigHtaFiltroVM.IsEmpty then
    sSQL := sSQL + ' AND vigenciahasta <= ' + VigHtaFiltroVM.SqlText;
  OpenQueryEx(sdqValNomenclador, [fraPrestadorSel.IDPrestador, fraPrestadorSel.IDPrestador],  sSQL);
end;

procedure TfrmManPrestador.Noseleccionarninguno1Click(Sender: TObject);
begin
  grdEstudios.UnselectAll;
end;

procedure TfrmManPrestador.OptMultHonVUMClick(Sender: TObject);
  procedure SetEnabled(AEdit: TCurrencyEdit; AEnabled: Boolean);
  begin
    AEdit.Enabled := AEnabled;
    if not AEnabled then
      AEdit.Value := 0;
  end;
begin
  //---[ Setea el Foco ]------------
  if Sender is TWinControl then
    fpABMNomenclador.SelectNext(TWinControl(Sender), True, True);
end;

procedure TfrmManPrestador.pcDatosChange(Sender: TObject);
begin
  if pcDatos.ActivePageIndex = 2 then
  begin
    if (edPiso.Color = clWindow) and (cmbTipoPrestador.FieldValue = '') then
    begin
     // (Fede: no puedo poner "pnlAccion = inactivo" porque cuando le das Cancelar, no lo cambia de estado => pongo "edPiso.Color=clWindow")
      MsgBox('Debe Ingresar un Tipo de Prestador', MB_ICONEXCLAMATION, 'Datos Médicos');
      tsDatosMed.Enabled      := False;
      pcDatos.ActivePageIndex := 0;
      cmbTipoPrestador.SetFocus; // By Fede
    end;
  end;

  if pcDatos.ActivePageIndex = tsCPActividad.PageIndex then
    OpenQueryEx(sdqPrestCP, [fraPrestadorSel.IDPrestador]);

  if pcDatos.ActivePageIndex = tsRemis.PageIndex then
    OpenQueryEx(sdqBaseRemis, [fraPrestadorSel.IDPrestador]);

  if pcDatos.ActivePageIndex = tsSucursales.PageIndex then
    OpenQueryEx(sdqSucursales, [fraPrestadorSel.IDPrestador]);

  if pcDatos.ActivePageIndex = tsZonas.PageIndex then
    fraZonasPrestador.IdPrestador := fraPrestadorSel.IDPrestador;

  sccNomenclador.Enabled := (pcDatos.ActivePageIndex = 3);
end;

procedure TfrmManPrestador.pmuVisualizarSloVigentesClick(Sender: TObject);
var
  sSQL: String;
begin
  pmuVisualizarSloVigentes.Checked := true;
  pmuVisualizartodoslosvalores.Checked := false;
  sSQL := FSQLValoresPrestador;
  AddCondition_UNION(sSQL, ' pd_vigenciahasta IS NULL ');

  if not VarIsNull(cmbPresupuesto.KeyValue) then
  begin
    AddCondition_UNION(sSQL, ' pp_id = :Prestador ');
    OpenQueryEx(sdqValoresPrestador, [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador,
                                      sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador],  sSQL);
  end else
  begin
    AddCondition_UNION(sSQL, ' pp_id IS NULL ');
    OpenQueryEx(sdqValoresPrestador, [fraPrestadorSel.IDPrestador, fraPrestadorSel.IDPrestador],  sSQL);
  end;
end;

procedure TfrmManPrestador.pmuVisualizartodoslosvaloresClick(Sender: TObject);
var
  sSQL: String;
begin
  pmuVisualizartodoslosvalores.Checked := true;
  pmuVisualizarSloVigentes.Checked := false;
  sSQL := FSQLValoresPrestador;

  if not VarIsNull(cmbPresupuesto.KeyValue) then
  begin
    AddCondition_UNION(sSQL, ' pp_id = :Prestador ');
    OpenQueryEx(sdqValoresPrestador, [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador,
                                      sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador],  sSQL);
  end else
  begin
    AddCondition_UNION(sSQL, ' pp_id IS NULL ');
    OpenQueryEx(sdqValoresPrestador, [fraPrestadorSel.IDPrestador, fraPrestadorSel.IDPrestador],  sSQL);
  end;
end;

procedure TfrmManPrestador.qpEmpresasGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
                                                   var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqEmpresas.FieldByName('FECHABAJA').IsNull then
    AFont.Style := [fsStrikeOut];
end;

procedure TfrmManPrestador.qpValNomencladorGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
                                                         var AFont: TFont;  var ABackground: TColor;
                                                         var AAlignment: TAlignment);
var
  bChange: Boolean;
begin
  bChange := False;
  if not sdqValNomencladorVIGENCIAHASTA.IsNull then
    AFont.Color := clRed;

  if AreIn(Field.DataField, ['VP_MULTIPLICADOR', 'VP_VALOR']) and (AText = '') then
    bChange := True
  else if AreIn(Field.DataField, ['VP_HONINTERNADOS', 'VP_HONAMBULATORIOS', 'VP_GASTOINTERNADOS', 'VP_GASTOAMBULATORIOS']) then
    bChange := True;

  if AreIn(Field.DataField, ['VP_MULTIPLICADOR', 'VP_HONINTERNADOS', 'VP_HONAMBULATORIOS', 'VP_GASTOINTERNADOS', 'VP_GASTOAMBULATORIOS', 'VP_VALOR']) then
  begin
    if bChange then
      ABackground := ABackground - 50
    else
      AText := FormatFloat('#,##0.00', sdqValNomenclador.FieldByName(Field.DataField).AsCurrency);
  end;
end;

procedure TfrmManPrestador.rbNomOpcionClick(Sender: TObject);
  procedure SetEnabled(AEdit: TCurrencyEdit; AEnabled: Boolean);
  begin
    AEdit.Enabled := AEnabled;
    if not AEnabled then
      AEdit.Value := 0;
  end;
begin
  SetEnabled(edNomMultiplicador, rbNomMultiplicador.Checked);
  SetEnabled(edMultiplicadorGs, rbNomMultiplicador.Checked);
  SetEnabled(edNomValor, rbNomValor.Checked);
  SetEnabled(edNomGastos, rbNomOtros.Checked);
  SetEnabled(edNomHonorarios, rbNomOtros.Checked);

  //---[ Setea el Foco ]------------
  if Sender is TWinControl then
    fpABMNomenclador.SelectNext(TWinControl(Sender), True, True);
end;

procedure TfrmManPrestador.rxmValoresPrestacionesAfterScroll(DataSet: TDataSet);
begin
  //lblNroEstudio.Caption := 'Estudio ' + IntToStr(DataSet.RecNo {$IFDEF VER150}+ 1{$ENDIF}) + '/' + IntToStr(DataSet.RecordCount);
end;

procedure TfrmManPrestador.cdsValoresPrestacionesAfterScroll(
  DataSet: TDataSet);
begin
  lblNroEstudio.Caption := 'Estudio ' + IntToStr(DataSet.RecNo) + '/' + IntToStr(DataSet.RecordCount);
end;

procedure TfrmManPrestador.sdqContratosAfterScroll(DataSet: TDataSet);
begin
  CargarContratos;
end;

procedure TfrmManPrestador.sdqEmpresasPresupuestoAMPAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(GridPresupuestosDetalle);
  DynColWidthsByData(GridEmpresas);
end;

procedure TfrmManPrestador.sdqEmpresasPresupuestoAMPAfterScroll(DataSet: TDataSet);
var
  sSQL: String;
begin
  if fpValoresPrestaciones.Visible then
  begin
    if fraEmpresaPresupuestoAMP.IsEmpty then
      chkNuevoAMP.Checked := False;

    CargarValores(True, False, True)
  end else
  begin
    sdqValoresPrestador.Close;
    sSQL := FSQLValoresPrestador;
    AddCondition_UNION(sSQL, ' pp_id = :Prestador ');
    OpenQueryEx(sdqValoresPrestador, [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador,
                                      sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger, fraPrestadorSel.IDPrestador],  sSQL);
  end;
end;

procedure TfrmManPrestador.sdqExamenesAfterScroll(DataSet: TDataSet);
begin
  sdqDetalleExamen.Close;
  sdqDetalleExamen.ParamByName('idexamen').AsInteger := sdqExamenes.FieldByName('ep_id').AsInteger;
  sdqDetalleExamen.Open;
end;

procedure TfrmManPrestador.sdqValoresPrestadorAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(grdAMP, 150);
end;

procedure TfrmManPrestador.Seleccionartodos1Click(Sender: TObject);
begin
  grdEstudios.SelectAll;
end;

procedure TfrmManPrestador.spbAsignarClick(Sender: TObject);
var
  i: Integer;
begin
  if clbLocalidadesSinAsignar.CheckCount = 0 then
    Exit;

  i := 0;
  while i <= clbLocalidadesSinAsignar.items.Count - 1 do
    if clbLocalidadesSinAsignar.Checked[i] then
    begin
      clbLocalidadesAsignadas.Add(clbLocalidadesSinAsignar.Items[i], clbLocalidadesSinAsignar.Values[i]);
      clbLocalidadesSinAsignar.Items.Delete(i);
      clbLocalidadesSinAsignar.Values.Delete(i);
    end
    else Inc(i);

  btnAsignarCP.Enabled := clbLocalidadesAsignadas.Items.Count > 0;
end;

{-----------------------------------------------------------------------------
  Procedure:   spbAsignarDatosClick
  Author:      racastro
  Date:        02-Ene-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Asigna datos a registros seleccionados de la grilla
-----------------------------------------------------------------------------}
procedure TfrmManPrestador.spbAsignarDatosClick(Sender: TObject);
var
  HayError: Boolean;
  IDPresupuesto: Integer;
  s: Integer;
  sPresupuesto: String;
  sSQL: String;  
begin
  if not chkNuevoAMP.Checked and not VarIsNull(cmbPresupuesto.KeyValue) then
    IDPresupuesto := sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger
  else
    IDPresupuesto := 0;

  sPresupuesto := IIF(chkPresupuestoAMP.Checked and not chkNuevoAMP.Checked, ' AND pd_idpresupuesto = ' + SQLValue(IDPresupuesto), ' AND pd_idpresupuesto IS NULL ');

  Verificar(chkPresupuestoAMP.Checked and chkNuevoAMP.Checked and fraEmpresaPresupuestoAMP.IsEmpty, fraEmpresaPresupuestoAMP.edContrato,
            'Debe indicar la empresa a la cual pertenecerá este presupuesto.');

  Verificar(chkPresupuestoAMP.Checked and chkNuevoAMP.Checked and fraPP_IDESTABLECIMIENTO.IsEmpty, fraPP_IDESTABLECIMIENTO.edCodigo,
            'Debe indicar el establecimiento a la cual pertenecerá este presupuesto.');

  Verificar(chkPresupuestoAMP.Checked and chkNuevoAMP.Checked and edPP_VIGENCIADESDE.IsEmpty, edPP_VIGENCIADESDE,
            'Debe indicar la fecha de inicio de la vigencia para este presupuesto.');

  Verificar(chkPresupuestoAMP.Checked and chkNuevoAMP.Checked and edPP_VIGENCIAHASTA.IsEmpty, edPP_VIGENCIAHASTA,
            'Debe indicar la fecha de fin de la vigencia para este presupuesto.');

  Verificar(chkPresupuestoAMP.Checked and chkNuevoAMP.Checked and (Trim(edPP_DESCRIPCION.Text) = ''), edPP_DESCRIPCION,
            'Debe indicar una descripción válida para este presupuesto.');

  Verificar((not sdqSolicitudPresupuesto.IsEmpty) and
            (lupSolicitudPresupuesto.Value = '') and
            (MsgBox('Existen solicitudes de presupuesto que pueden ser asociadas al presente.' + #13 +
                    '¿Desea asociar una de ellas?', + MB_ICONQUESTION + MB_YESNO) = IDYES),
            lupSolicitudPresupuesto,
            'Debe indicar la solicitud origen del presente presupuesto.');

  Verificar((not sdqSolicitudPresupuesto.IsEmpty) and
            (lupSolicitudPresupuesto.Value = '') and (chkNuevoAMP.Checked),
            lupSolicitudPresupuesto,
            'La solicitud del presupuesto es obligatoria');

  verificar((chkNuevoAMP.Checked) and (ExisteSqlEx('SELECT 1' +
                        '  FROM COMUNES.CPP_PRESUPUESTOPRESTADOR' +
                        ' WHERE PP_IDPRESTADOR = :IDPREST ' +
                        '   AND PP_IDESTABLECIMIENTO = :IDESTAB ' +
                        '   AND PP_IDSOLICITUD = :IDSOLIC ' +
                        '   AND PP_FECHABAJA IS NULL ', [fraPrestadorSel.IDPrestador, fraPP_IDESTABLECIMIENTO.ID, lupSolicitudPresupuesto.Value])),
            lupSolicitudPresupuesto, 'La solicitud está relacionada a un presupuesto ya cargado');

  Verificar(((edViaticoKM.Value = 0) and not edFechaViaticoKM.IsEmpty) or
            ((edViaticoKM.Value > 0) and edFechaViaticoKM.IsEmpty), edViaticoKM,
            'Debe indicar el importe y la fecha de vigencia para el viático por kilómetro.');

  Verificar(((edViaticoEstadia.Value = 0) and not edFechaViaticoEstadia.IsEmpty) or
            ((edViaticoEstadia.Value > 0) and edFechaViaticoEstadia.IsEmpty), edViaticoEstadia,
            'Debe indicar el importe y la fecha de vigencia para el viático por día de estadía.');

  Verificar(((edViaticoGastoEnvio.Value = 0) and not edFechaViaticoGastoEnvio.IsEmpty) or
            ((edViaticoGastoEnvio.Value > 0) and edFechaViaticoGastoEnvio.IsEmpty), edViaticoGastoEnvio,
            'Debe indicar el importe y la fecha de vigencia para el viático por gastos de envío.');

  Verificar(not edFechaViaticoKM.IsEmpty and not edFechaViaticoKM.IsValid, edFechaViaticoKM,
            'Debe indicar una fecha válida para el viático por kilómetro.');

  Verificar(not edFechaViaticoEstadia.IsEmpty and not edFechaViaticoEstadia.IsValid, edFechaViaticoEstadia,
            'Debe indicar una fecha válida para el viático por día de estadía.');

  Verificar(chkPresupuestoAMP.Checked and (edFechaViaticoKM.Date > 0) and (edFechaViaticoKM.Date <> edPP_VIGENCIADESDE.Date),
            edFechaViaticoKM, Format('La fecha de vigencia debe coincidir con el inicio de la vigencia del presupuesto (%s).', [DateToStr(edPP_VIGENCIADESDE.Date)]));

  Verificar(chkPresupuestoAMP.Checked and (edFechaViaticoEstadia.Date > 0) and (edFechaViaticoEstadia.Date <> edPP_VIGENCIADESDE.Date),
            edFechaViaticoEstadia, Format('La fecha de vigencia debe coincidir con el inicio de la vigencia del presupuesto (%s).', [DateToStr(edPP_VIGENCIADESDE.Date)]));

  Verificar(chkPresupuestoAMP.Checked and (edVigencia.Date > 0) and (edVigencia.Date <> edPP_VIGENCIADESDE.Date),
            edVigencia, Format('La fecha de vigencia debe coincidir con el inicio de la vigencia del presupuesto (%s).', [DateToStr(edPP_VIGENCIADESDE.Date)]));

  sSQL :=
    'SELECT 1' +
     ' FROM comunes.cpd_prestadorestudio' +
    ' WHERE pd_vigenciahasta = :fecha' +
      ' AND pd_idprestador = :prestador' +
      ' AND pd_fechabaja IS NULL ' +
      ' AND pd_idtipovalor = :tipo ' + sPresupuesto;

  Verificar(ExisteSqlEx(sSQL, [TDateTimeEx.Create(edFechaViaticoKM.Date), fraPrestadorSel.IDPrestador, 2]), edFechaViaticoKM,
            'El valor ingresado en la vigencia para el víatico por KM coincide con una fecha de cierre, por favor, modifíquelo en al menos un día y reintente.');

  Verificar(ExisteSqlEx(sSQL, [TDateTimeEx.Create(edFechaViaticoEstadia.Date), fraPrestadorSel.IDPrestador, 3]), edFechaViaticoEstadia,
            'El valor ingresado en la vigencia para el víatico de estadía coincide con una fecha de cierre, por favor, modifíquelo en al menos un día y reintente.');

  sSQL :=
    'SELECT 1' +
     ' FROM comunes.cpd_prestadorestudio' +
    ' WHERE :fecha BETWEEN pd_vigenciadesde AND pd_vigenciahasta' +
      ' AND pd_idprestador = :prestador' +
      ' AND pd_fechabaja IS NULL ' +
      ' AND pd_idtipovalor = :tipo' + sPresupuesto;

  Verificar(ExisteSqlEx(sSQL, [TDateTimeEx.Create(edFechaViaticoKM.Date), fraPrestadorSel.IDPrestador, 2]), edFechaViaticoKM,
            'El valor ingresado en la vigencia para el víatico por kilómetro se solapa con un período existente.');

  Verificar(ExisteSqlEx(sSQL, [TDateTimeEx.Create(edFechaViaticoEstadia.Date), fraPrestadorSel.IDPrestador, 3]), edFechaViaticoEstadia,
            'El valor ingresado en la vigencia para el víatico de estadía se solapa con un período existente.');

  HayError := false;
  for s := 0 to grdEstudios.SelectedRows.Count - 1 do
  begin
    grdEstudios.GotoSelection(s);

    cdsValoresPrestaciones.Edit;

    if not chkNuevoAMP.Checked and (not edVigencia.IsEmpty) and edVigencia.IsValid then
    begin
      HayError := HayError or
                  (cdsValoresPrestaciones.FieldByName('pd_vigenciadesde').AsDateTime > edVigencia.Date) or
                  ExisteSqlEx('SELECT 1' +
                               ' FROM comunes.cpd_prestadorestudio' +
                              ' WHERE pd_vigenciadesde >= :Fecha' +
                                ' AND pd_fechabaja IS NULL ' +
                                ' AND pd_idprestador = :prestador' +
                                ' AND pd_idestudio = :estudio ' + sPresupuesto +
                                ' AND pd_idtipovalor = :tipo', [TDateTimeEx.Create(edVigencia.Date),
                                                                fraPrestadorSel.IDPrestador,
                                                                cdsValoresPrestaciones.FieldByName('es_codigo').AsString,
                                                                1]) or
                  ExisteSqlEx('SELECT 1' +
                               ' FROM comunes.cpd_prestadorestudio' +
                              ' WHERE pd_vigenciahasta = :fecha' +
                                ' AND pd_fechabaja IS NULL ' +
                                ' AND pd_idprestador = :prestador' +
                                ' AND pd_idestudio = :estudio ' + sPresupuesto +
                                ' AND pd_idtipovalor = :tipo', [TDateTimeEx.Create(edVigencia.Date),
                                                                fraPrestadorSel.IDPrestador,
                                                                cdsValoresPrestaciones.FieldByName('es_codigo').AsString,
                                                                1]) or
                  ExisteSqlEx('SELECT 1' +
                               ' FROM comunes.cpd_prestadorestudio' +
                              ' WHERE :fecha BETWEEN pd_vigenciadesde AND pd_vigenciahasta' +
                                ' AND pd_fechabaja IS NULL ' +
                                ' AND pd_idprestador = :prestador' +
                                ' AND pd_idestudio = :estudio ' + sPresupuesto +
                                ' AND pd_idtipovalor = :tipo', [TDateTimeEx.Create(edVigencia.Date),
                                                                fraPrestadorSel.IDPrestador,
                                                                cdsValoresPrestaciones.FieldByName('es_codigo').AsString,
                                                                1]);

      if not HayError then
        cdsValoresPrestaciones.FieldByName('pd_vigenciadesde').AsDateTime := edVigencia.Date;

    end;

    if chkNuevoAMP.Checked then
      cdsValoresPrestaciones.FieldByName('pd_vigenciadesde').AsDateTime := edVigencia.Date;

    if edValorPres.Value > 0 then
    begin
      cdsValoresPrestaciones.FieldByName('pd_valor').AsFloat := edValorPres.Value;
      tieneValores := true;
    end;

    cdsValoresPrestaciones.Post;
  end;

  if HayError then
    MessageDlg('Para algunas prestaciones, la nueva fecha de vigencia: ' + #13 +
               '  * es anterior a la fecha inicial de vigencia actual ó ' + #13 +
               '  * es anterior a una fecha inicial de vigencia existente ó ' + #13 +
               '  * coincide con una fecha de cierre ó  ' + #13 +
               '  * se solapa con un período existente ' + #13 +
               'Sus fechas de vigencia no han sido cambiadas.',
               mtWarning, [mbOK], 0);

  grdEstudios.UnselectAll;
end;

procedure TfrmManPrestador.spbDesasignarClick(Sender: TObject);
var
  i: Integer;
begin
  if clbLocalidadesAsignadas.CheckCount = 0 then
    Exit;

  i := 0;
  while i <= clbLocalidadesAsignadas.Items.Count - 1 do
    if clbLocalidadesAsignadas.Checked[i] then
    begin
      clbLocalidadesSinAsignar.Add(clbLocalidadesAsignadas.Items[i], clbLocalidadesAsignadas.Values[i]);
      clbLocalidadesAsignadas.Items.Delete(i);
      clbLocalidadesAsignadas.Values.Delete(i);
    end
    else Inc (i);

  btnAsignarCP.Enabled := clbLocalidadesAsignadas.Items.Count > 0;
end;

procedure TfrmManPrestador.spbSelTodos2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to clbLocalidadesAsignadas.Items.Count - 1 do
    clbLocalidadesAsignadas.Checked[i] := IIF(Sender = spbSelTodos2, True, False)
end;

procedure TfrmManPrestador.spbSelTodosClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to clbLocalidadesSinAsignar.Items.Count - 1 do
    clbLocalidadesSinAsignar.Checked[i] := IIF(Sender = spbSelTodos, True, False)
end;

procedure TfrmManPrestador.tbAgregarClick(Sender: TObject);
begin
  pcDatos.ActivePageIndex := 0;
  DisableButtons;
  Accion := Alta;
  pnlAccion.Caption := 'Alta';
  tbLimpiarClick(nil);
  LockControls(False, False);
  edIdentif.Text     := ValorSql('SELECT MAX(ca_identificador) + 1 FROM cpr_prestador');
  edPrestMutual.Text := '1';
  edRanking.Text     := 'C';
  if edSecuencia.Text = '' then
  begin
    edSecuencia.Text := '1';
    //chkCargaValores.Checked := True;   Ticket  39579
  end;

  // Si Se cargo un prestador Carga la PK para el Nuevo
  if (fraPrestadorSel.Cuit <> '') then
  begin
    mskCUIT.Text := fraPrestadorSel.Cuit;
    edSecuencia.Text := ValorSql('SELECT MAX(ca_secuencia) + 1' +
                                  ' FROM cpr_prestador' +
                                 ' WHERE ca_clave = ''' + fraPrestadorSel.Cuit + '''');
    edPrestMutual.SetFocus;
  end
  else
    mskCUIT.SetFocus;
end;

procedure TfrmManPrestador.tbAgregarContratoClick(Sender: TObject);
begin
  fraTipoContratoABM.Limpiar;
  edVigDesdeABM.Clear;
  edVigHastaABM.Clear;
  chkMedExtraABM.Checked        := False;
  chkSumaModulosABM.Checked     := False;
  chkContratoSocialABM.Checked  := False;
  chkCVABM.Checked              := False;
  chkTituloABM.Checked          := False;
  chkMatriculaABM.Checked       := False;
  chkRespCivilABM.Checked       := False;
  chkhabilitadoABM.Checked      := False;
  chkComplejidadABM.Checked     := False;
  chkCartaCompromisoABM.Checked := False;
  chkActaAutoridadesABM.Checked := False;
  chkRenovAutomABM.Checked      := False;
  chkDocumentoABM.Checked       := False;
  edFactDesdeABM.Clear;
  edFactHastaABM.Clear;
  edPLazoRefacABM.Clear;
  edObservABM.Clear;
  LockValContControls(True);
  fpABMContratos.Caption := 'Agregar Contrato';
  fpABMContratos.Tag := 0; //alta
  fpABMContratos.ShowModal;
end;

procedure TfrmManPrestador.tbAgregarConvClick(Sender: TObject);
begin
  Verificar(not Is_EspecialidadPrestadorAMP(fraPrestadorSel.Value), fraPrestadorSel, 'El prestador no tiene especialidad AMP.');
  chkNuevoAMP.Checked := False;

  CargarValores(False);
  if fpValoresPrestaciones.Showmodal = mrOk then
    sdqValoresPrestador.Refresh
end;

//----------------------------------------------------------------------------
// ABM CP de actividad del Prestador
//----------------------------------------------------------------------------
procedure TfrmManPrestador.tbAgregarCPClick(Sender: TObject);
begin
//
end;

procedure TfrmManPrestador.tbAgregarEmpresaClick(Sender: TObject);
begin
  ModoForm := fsAgregar;
  ClearDatosFormPanelEmpresa;

  VCLExtra.LockControls([edVigenciaHastaEmp], True);
  VCLExtra.LockControls([fraEmpresaEmp, edVigenciaDesdeEmp, edObservacionesEmp], False);

  fpDialogEmpresas.Caption := 'Agregar Empresa';
  if fpDialogEmpresas.ShowModal = mrOk then sdqEmpresas.Refresh;
end;

// Alta de Especialidades en el prestador
procedure TfrmManPrestador.tbAgregarEspClick(Sender: TObject);
var
  Sql: String;
begin
  fpEspecialidades.Caption   := 'Alta de Especialidades';
  AccionEsp                  := Alta;
  cmbEspecialidad.ReadOnly   := False;
  mObservaciones.ReadOnly    := False;
  cmbEspecialidad.Font.Color := clWindowText;
  mObservaciones.Font.Color  := clWindowText;
  cmbEspecialidad.Text       := '';
  mObservaciones.Text        := '';
  chkGuardiaActEsp.Checked   := False;
  chkGuardiaPasEsp.Checked   := False;
  chkGuardiaActEspClick(nil);
  chkGuardiaPasEspClick(nil);
  VclExtra.LockControls([chkGuardiaActEsp, chkGuardiaPasEsp], False);

  try
    sdqDescEspecialidad.Open;
    if fpEspecialidades.ShowModal = mrOk then
    begin
      Sql :=
        'INSERT INTO cpe_prestaespeci(pe_prestador, pe_especialidad, pe_observaciones, pe_fechalta, pe_usualta,' +
                                    ' pe_guardiaact, pe_desdeguardiaact, pe_hastaguardiaact, pe_guardiapas,' +
                                    ' pe_desdeguardiapas, pe_hastaguardiapas)' +
                            ' VALUES ( ' +
                                      SqlValue(fraPrestadorSel.IDPrestador) + ',' +
                                      SqlString(cmbEspecialidad.FieldValue,True) + ',' +
                                      SqlString(mObservaciones.Text,True) + ',' +
                                     'Actualdate, ' + SqlString(Sesion.UserID,True) + ',' +
                                      '''' + IIF(chkGuardiaActEsp.Checked, 'S', 'N') + ''',' +
                                      SqlString(HoraSinMascara(edDesdeActEsp.Text), True, True) + ',' +
                                      SqlString(HoraSinMascara(edHastaActEsp.Text), True, True) + ',' +
                                      '''' + IIF(chkGuardiaPasEsp.Checked, 'S', 'N') + ''',' +
                                      SqlString(HoraSinMascara(edDesdePasEsp.Text), True, True) + ',' +
                                      SqlString(HoraSinMascara(edHastaPasEsp.Text), True, True) + ')';
      EjecutarSql(Sql);
      RefreshAndRelocate(sdqEspecialidades, ['PE_ESPECIALIDAD']);
    end;
    sdqDescEspecialidad.Close;
  except
    on E:Exception do
      MsgBox('No se ha podido agregar la Especialidad debido al siguiente error:' + #13 + E.Message, MB_ICONEXCLAMATION);
  end;
end;

procedure TfrmManPrestador.tbAgregarNomClick(Sender: TObject);
begin
  btnNomAceptar.Caption := 'Agregar';
  AccionValMod          := Alta;
  fraNomencladorABM.Limpiar;
  edValNomVigDesde.ClearRange;
  edValNomVigDesde.Date := FirstLastDayOfMonth(DBDate);
  edValNomVigHasta.ClearDate;
  edNomMultiplicador.Text     := '';
  edNomValor.Text             := '';
  edNomGastos.Text            := '';
  edNomHonorarios.Text        := '';

  LockValNomControls(True);
  rbNomOpcionClick(nil);
  fpABMNomenclador.ActiveControl := fraNomencladorABM;
  fpABMNomenclador.Caption       := 'Agregar Valor';
  if ValorSQL('SELECT count(*)' +
               ' FROM sup_unidadprestador' +
              ' WHERE up_vigenciahasta IS NULL' +
                ' AND up_fechabaja IS NULL ' +
                ' AND up_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador)) > 0 then
  begin
    rbnomvalor.Checked         := True;
    rbNomMultiplicador.Enabled := False;
  end
  else
    rbNomMultiplicador.Enabled := True;

  bEsAltaNomenclador := True;
  fpABMNomenclador.ShowModal;
end;

procedure TfrmManPrestador.tbAgregarPreocupClick(Sender: TObject);
begin
  DoCargarExamen(True);
  fpExamenPreocup.Showmodal;
  sdqExamenes.Refresh;
end;

procedure TfrmManPrestador.tbAgregarPresupClick(Sender: TObject);
begin
  LockPresupControls(True);
  DoLimpiarPresup;
  fraNomencladorPresup.Prestador := edIdentif.Value;
  fpABMPresupuesto.ShowModal;
end;

procedure TfrmManPrestador.tbAgregarUMedClick(Sender: TObject);
begin
  modoABMVUMed := 'Alta';
  fpABMVUMed.Caption := 'Agregar Valor U. Médica';
  Limpiar_fpABMVUMed;
  fpABMVUMed.ShowModal;
end;

procedure TfrmManPrestador.tbAltaEmpresaPreocupClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqExamenes.Active) or sdqExamenes.IsEmpty, dgExamenes,
            'No hay ningun examen seleccionado.');
  Verificar(not(sdqExamenes.FieldByName('ep_vigenciahasta').IsNull) and
            (sdqExamenes.FieldByName('ep_vigenciahasta').AsDateTime < DBDateTime),
            dgExamenes, 'El examen seleccionado tiene vigencia anterior a la fecha actual.');
  edCantExa.Clear;
  fraEmpresaExamen.Clear;
  fraEstabExamen.Clear;
  btnPersonasLote.Enabled := False;
  if fpAltaEmpresaPreocup.ShowModal = mrOk then
  begin
    sSql := 'INSERT INTO comunes.cle_lotesexamenes ' +
            '(le_idexamen, le_idempresa, le_establecimiento, le_cantidad, le_usualta, ' +
            ' le_fechaalta) VALUES ( ' +
            SqlInt(sdqExamenes.FieldByName('ep_id').AsInteger) + ',' +
            SqlInt(fraEmpresaExamen.Value) + ',' + SqlInt(fraEstabExamen.ID) + ',' +
            SqlInt(edCantExa.Value) +  ',' + SqlValue(Sesion.UserID) + ', ActualDate) ';
    EjecutarSql(sSql);
    sdqDetalleExamen.Refresh;
  end;
end;

procedure TfrmManPrestador.tbAuditableClick(Sender: TObject);
begin
  if Do_SetearAuditable(True, edIdentif.Value) then
    MsgBox('La operación se realizó con éxito.', MB_ICONINFORMATION);
end;

{procedure TfrmManPrestador.tbAutorizarPreocupClick(Sender: TObject);
var
  sSql :String;
  ResultadoEnvio: TResultadoEnvio;
begin
  if sdqDetalleExamen.Active and not(sdqDetalleExamen.IsEmpty) then
  begin
    Verificar(not(sdqDetalleExamen.FieldByName('le_fechaaut').IsNull),
              dgExamenesDetalle, 'El lote seleccionado ya ha sido autorizado.');
    Verificar(not ExistenPersonasEnLote(sdqDetalleExamen.FieldByName('le_id').AsInteger,              // TK 25139
                                        sdqDetalleExamen.FieldByName('le_cantidad').AsInteger),
              dgExamenesDetalle, 'No se han cargado o faltan cargar personas pertenecientes a dicho Lote');

    if MsgAsk('¿Confirma autorizar el lote seleccionado y enviar el mail al prestador?') then
    begin
      Verificar(sdqDatosCA_DIRELECTRONICA.IsNull, Nil, 'El prestador no posee dirección de mail cargada.');
      ResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(sdqDatosCA_DIRELECTRONICA.AsString,
                                                                 'Autorización de examen preocupacional.',
                                                                [oAlwaysShowDialog, oAutoFirma], GetTextoLote + CRLF);
      if ResultadoEnvio.EnvioOk then
      begin
        sSql := 'UPDATE comunes.cle_lotesexamenes ' +
                  ' SET le_autorizado = ''S'', ' +
                      ' le_usuaut = ' + SqlValue(Sesion.UserID) + ',' +
                      ' le_fechaaut = ActualDate ' +
                ' WHERE le_id = ' + SqlInt(sdqDetalleExamen.FieldByName('le_id').AsInteger);
        EjecutarSql(sSql);
        sdqDetalleExamen.Refresh;
      end;
    end;
  end;
end;}

procedure TfrmManPrestador.tbAutorizarPreocupClick(Sender: TObject);
var
  sSql, sMails :String;
  ResultadoEnvio: TResultadoEnvio;
begin
  if sdqDetalleExamen.Active and not(sdqDetalleExamen.IsEmpty) then
  begin
    Verificar(not(sdqDetalleExamen.FieldByName('le_fechaaut').IsNull),
              dgExamenesDetalle, 'El lote seleccionado ya ha sido autorizado.');
    Verificar(not ExistenPersonasEnLote(sdqDetalleExamen.FieldByName('le_id').AsInteger,              // TK 25139
                                        sdqDetalleExamen.FieldByName('le_cantidad').AsInteger),
              dgExamenesDetalle, 'No se han cargado o faltan cargar personas pertenecientes a dicho Lote');

    if MsgAsk('¿Confirma autorizar el lote seleccionado y enviar el mail al prestador?') then
    begin
      Verificar(sdqDatosCA_DIRELECTRONICA.IsNull, Nil, 'El prestador no posee dirección de mail cargada.');
      sMails := ';' + Get_DireccionesEnvioMail('EXAMED');     // TK 36192 y 36232
      ResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(sdqDatosCA_DIRELECTRONICA.AsString + sMails,              // TK 36192 y 36232
                                                                 'Autorización de examen preocupacional.',
                                                                [oAlwaysShowDialog, oAutoFirma], GetTextoLote + CRLF);
      if ResultadoEnvio.EnvioOk then
      begin
        sSql := 'UPDATE comunes.cle_lotesexamenes ' +
                  ' SET le_autorizado = ''S'', ' +
                      ' le_usuaut = ' + SqlValue(Sesion.UserID) + ',' +
                      ' le_fechaaut = ActualDate ' +
                ' WHERE le_id = ' + SqlInt(sdqDetalleExamen.FieldByName('le_id').AsInteger);
        EjecutarSql(sSql);
        sdqDetalleExamen.Refresh;
      end;
    end;
  end;
end;


procedure TfrmManPrestador.tbBajaEmpresaPreocupClick(Sender: TObject);
var
  sSql :String;
begin
  if sdqDetalleExamen.Active and not(sdqDetalleExamen.IsEmpty) then
  begin
    Verificar(not(sdqDetalleExamen.FieldByName('le_fechaaut').IsNull),
              dgExamenesDetalle, 'El lote seleccionado ya ha sido autorizado.');
    if MsgAsk('¿Confirma quitar el lote seleccionado?') then
    begin
      sSql := 'UPDATE comunes.cle_lotesexamenes ' +
                ' SET le_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                    ' le_fechabaja = ActualDate ' +
              ' WHERE le_id = ' + SqlInt(sdqDetalleExamen.FieldByName('le_id').AsInteger);
      EjecutarSql(sSql);
      sdqDetalleExamen.Refresh;
    end;
  end;
end;

procedure TfrmManPrestador.tbBajaPreocupClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqExamenes.Active) or sdqExamenes.IsEmpty, dgExamenesDetalle,
            'No hay ningun examen seleccionado.');
  if not(TieneLoteAutorizado) and MsgAsk('¿Confirma eliminar el examen seleccionado?') then
  begin
    sSql := 'UPDATE comunes.cep_examenespreocupacionales ' +
              ' SET ep_fechabaja = ActualDate, ' +
                  ' ep_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE ep_id = ' + SqlInt(sdqExamenes.FieldByName('ep_id').AsInteger);
    EjecutarSql(sSql);
    sdqExamenes.Refresh;
  end;
end;

procedure TfrmManPrestador.tbBajaPresupuestoClick(Sender: TObject);
var
  sSQL: String;
begin
  Verificar(VarIsNull(cmbPresupuesto.KeyValue), nil, 'Debe seleccionar un presupuesto para darlo de baja.');
  Verificar(not sdqPresupuestosAMP.FieldByName('PP_FECHABAJA').IsNull, nil, 'El presupuesto seleccionado ya ha sido dado de baja.');

  sSQL := 'UPDATE comunes.cpp_presupuestoprestador ' +
            ' SET pp_fechabaja = sysdate,' +
                ' pp_usubaja = :usuario' +
          ' WHERE pp_nropresupuesto = :idpresupuesto';

  if MsgAsk(Format('¿Confirma que desea dar de baja el presupuesto seleccionado (%s)?', [cmbPresupuesto.Text])) then
  begin
    EjecutarSQLEx(sSQL, [Sesion.UserID, sdqPresupuestosAMP.FieldByName('PP_NROPRESUPUESTO').AsInteger]);
    sdqValoresPrestador.Refresh;
    sdqPresupuestosAMP.Close;
    OpenQueryEx(sdqPresupuestosAMP, [fraPrestadorSel.IDPrestador]);
  end;
end;

procedure TfrmManPrestador.tbCuentasBancariasClick(Sender: TObject);
begin
  if not sdqDatos.Eof and (edIdentif.Text <> '') then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    begin
      FormStyle := fsNormal;
      Execute('CA', edIdentif.Value, '')
    end
  else
    MsgBox('No ha seleccionado ningún prestador.');
end;

procedure TfrmManPrestador.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  cuerpo, avisoBaja: String;
begin
  pnlAccion.Caption := 'Eliminación';

  if fpMotivosBaja.ShowModal = mrOK then
  begin
    if msgbox('Desea enviar el aviso automático notificando la baja?', MB_YESNO + MB_ICONQUESTION) = mrYes then
      avisoBaja := 'S'
    else
      avisoBaja := 'N';

    if dcFechaBaja.Date = DBDate then  //baja instantánea  DFG
    begin
      sSql := 'art.prestadores.do_bajaprestador(:motivo, :ident, :idrel, :trans, :usubaja, :avisobaja);';
      EjecutarStoreSTEx(sSql, [fraMotivoBajaFP.ID, fraPrestadorSel.IDPrestador, fraPrestadorRS.IDPrestador,
                        IIF(chkTransferir.Checked, 'S', 'N'), Sesion.UserID, avisoBaja]);
    end
    else begin   //dcFechaBaja.Date > DBDate: baja diferida  DFG
      sSql := ' UPDATE art.cpr_prestador ' +
                 ' SET ca_bajaefectiva = :fbaja, ' +
                     ' ca_usubaja = :usu, ' +
                     ' ca_idmotivobaja = :mot, ' +
                     iif(fraPrestadorRS.IsEmpty, '', ' ca_idrelacionado = ' + IntToStr(fraPrestadorRS.IDPrestador) + ', ') +
                     ' ca_transfiereaut = :traut ' +
               ' WHERE ca_identificador = :idprest ';
      EjecutarSqlEx(ssql, [datetostr(dcFechaBaja.Date), Sesion.UserID, fraMotivoBajaFP.ID,
                           IIF(chkTransferir.Checked, 'S', 'N'), fraPrestadorSel.IDPrestador]);

      if avisoBaja = 'S' then
      begin
        cuerpo := ArmarCuerpoMail('El siguiente prestador será dado de baja el día ' + datetostr(dcFechaBaja.Date));
        EnviarMailBD(Get_DireccionesEnvioMail('BAJAPRES2'), 'Baja diferida de prestador', [], cuerpo, nil, 0, tcDefault, true);
      end;
      
    end;
    OnPrestadorChange(nil);
  end;
end;

procedure TfrmManPrestador.tbEliminarContratoClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqContratos.Active and not(sdqContratos.Eof) and
     MsgAsk('¿Confirma eliminar el contrato seleccionado?') then
  begin
    Verificar(sdqContratosPC_VIGENCIAHASTA.IsNull, edVigenciaHastaCont,'No se puede eliminar el contrato activo.');
    try
      sSql := 'UPDATE cpc_prestadorcontrato' +
                ' SET pc_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                    ' pc_fechabaja = actualdate' +
              ' WHERE pc_idcontrato = ' + SqlInt(sdqContratosPC_IDCONTRATO.AsInteger);
      EjecutarSql(sSql);
      sdqContratos.Refresh;
      CargarContratos;
    except
      on E:Exception do
        ErrorMsg(E, 'Error al eliminar el registro.');
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure:   tbEliminarConvClick
  Author:      racastro
  Date:        03-Ene-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Elimina un valor del convenio, asignándoles fecha de finalización
-----------------------------------------------------------------------------}
procedure TfrmManPrestador.tbEliminarConvClick(Sender: TObject);
begin
  if sdqValoresPrestador.Active and (not sdqValoresPrestador.IsEmpty) then
  begin
    if sdqValoresPrestador.FieldByName('pd_vigenciahasta').IsNull then
    begin
      if (fpVigenciaHasta.ShowModal = mrOk) and
         (MessageDlg('¿Confirma la eliminación del valor seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        BeginTrans;
        try
          EjecutarSqlST('UPDATE comunes.cpd_prestadorestudio' +
                          ' SET pd_vigenciahasta =  ' + SqlDate (dedVigenciaHasta.Date) + ',' +
                              ' pd_fechamodif = SYSDATE,' +
                              ' pd_usumodif = ' + SqlValue (Sesion.UserID) +
                        ' WHERE pd_id =  ' + SqlValue (sdqValoresPrestador.FieldByName('pd_id').AsInteger));
          CommitTrans;
          sdqValoresPrestador.Refresh
        except
          on E: Exception do
          begin
            RollBack;
            raise Exception.Create(E.Message + CRLF + 'Error al eliminar el valor indicado.');
          end;
        end
      end
    end
    else
      MsgBox('La prestación ya se encuentra fuera de vigencia.', MB_ICONEXCLAMATION);
  end
  else
    MsgBox('No hay datos en la grilla de Valores del Convenio.', MB_ICONEXCLAMATION);
end;

procedure TfrmManPrestador.tbEliminarCPClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqPrestCP.Active and (not sdqPrestCP.IsEmpty) and (MsgBox('¿ Confirma eliminar el dato seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  try
    sSql := 'UPDATE art.apc_prestadorcpostal' +
              ' SET pc_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pc_fechabaja = actualdate' +
            ' WHERE pc_id = ' + SqlValue (sdqPrestCP.FieldByName('pc_id').AsInteger);
    EjecutarSql(sSql);

    sdqPrestCP.Refresh;
  except
    on E: Exception do
      ErrorMsg(E, 'Error al eliminar el registro.');
  end;
end;

procedure TfrmManPrestador.tbEliminarEmpresaClick(Sender: TObject);
begin
  if IsRegistroSeleccionadoEmpresaValido() then
  begin
    ModoForm := fsEliminar;
    LoadDatosFormPanelEmpresa;
    VCLExtra.LockControls([fraEmpresaEmp, edVigenciaDesdeEmp], True);
    VCLExtra.LockControls([edVigenciaHastaEmp, edObservacionesEmp], False);
    fpDialogEmpresas.Caption := 'Baja de Empresa';
    if fpDialogEmpresas.ShowModal = mrOk then sdqEmpresas.Refresh;
  end;
end;

// Baja de Especialidades en el prestador
procedure TfrmManPrestador.tbEliminarEspClick(Sender: TObject);
var
  Sql: String;
begin
  Sql := '';
  fpEspecialidades.Caption := 'Baja de Especialidades';
  AccionEsp                := Baja;
  CargarDatosEsp;
  if sdqEspecialidades.FieldByName('PE_FECHABAJA').IsNull then
  begin
    cmbEspecialidad.ReadOnly   := True;
    mObservaciones.ReadOnly    := True;
    cmbEspecialidad.Font.Color := clGray;
    mObservaciones.Font.Color  := clGray;
    chkGuardiaActEspClick(nil);
    chkGuardiaPasEspClick(nil);
    VclExtra.LockControls([chkGuardiaActEsp, chkGuardiaPasEsp], True);

    if fpEspecialidades.ShowModal = mrOk then
    begin
       Sql :=
        'UPDATE cpe_prestaespeci' +
          ' SET pe_fechabaja = Actualdate' +
        ' WHERE pe_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
          ' AND pe_especialidad = ' + SqlString(sdqEspecialidades.FieldByName('PE_ESPECIALIDAD').AsString, True);
       EjecutarSql(Sql);
       RefreshAndRelocate(sdqEspecialidades, ['PE_ESPECIALIDAD']);
    end;
  end
  else
    MsgBox('La Especialidad seleccionada ya está dada de baja.', MB_ICONEXCLAMATION);
end;

procedure TfrmManPrestador.tbEliminarNomClick(Sender: TObject);
begin
  Verificar(not sdqValNomencladorVIGENCIAHASTA.IsNull, Nil, 'El valor ya se encuentra dado de baja.');

  chkValorDeAMP.Checked := IIF(sdqValNomencladorVP_VALORDEAMP.AsString = 'S', true, false);

  if (sdqValNomencladorVP_CAPITULO.AsString = 'PP') then
  begin
    fraNomencladorPresup.Cargar(sdqValNomencladorON_ID.AsInteger);
    dcDesdePresup.Date    := sdqValNomencladorVP_VIGENCIADESDE.AsDateTime;
    dcHastaPresup.ClearDate(sdqValNomencladorVP_VIGENCIADESDE.AsDateTime <= Now);
    edSiniestroPresup.SetValues(sdqValNomencladorVP_SINIESTRO.AsInteger,
                                sdqValNomencladorVP_ORDEN.AsInteger,
                                sdqValNomencladorVP_RECAIDA.AsInteger);
    edSiniestroPresup.OnSelect(Nil);
    edCantidadPresup.Value  := sdqValNomencladorCANTIDAD.AsInteger;
    edValorPresup.Value     := sdqValNomencladorVP_VALOR.AsCurrency;
    LockPresupControls(False);
    fpABMPresupuesto.ShowModal;
  end else
  begin
    fraNomencladorABM.Cargar(sdqValNomencladorON_ID.AsInteger);
    edValNomVigDesde.Date        := sdqValNomencladorVP_VIGENCIADESDE.AsDateTime;
    edValNomVigHasta.ClearDate(sdqValNomencladorVP_VIGENCIADESDE.AsDateTime <= Now);
    edNomMultiplicador.Value     := sdqValNomencladorVP_MULTIPLICADOR.AsCurrency;
    edNomValor.Value             := sdqValNomencladorVP_VALOR.AsCurrency;
    edNomGastos.Value            := sdqValNomencladorVP_VALORGASTOS.AsCurrency;
    edNomHonorarios.Value        := sdqValNomencladorVP_VALORHONORARIOS.AsCurrency;
    edVP_MONTO_MINIMO.Value      := sdqValNomencladorVP_MONTO_MINIMO.AsCurrency;
    edVP_SUMA_FIJA.Value         := sdqValNomencladorVP_SUMA_FIJA.AsCurrency;
    edVP_KM_INCLUIDOS.Value      := sdqValNomencladorVP_KM_INCLUIDOS.AsCurrency;
    edVP_VIAJE_EXCLUSIVO.Value   := sdqValNomencladorVP_VIAJE_EXCLUSIVO.AsCurrency;
    edVP_VIAJE_NOCTURNO.Value    := sdqValNomencladorVP_VIAJE_NOCTURNO.AsCurrency;
    edVP_VIAJE_FINDESEMANA.Value := sdqValNomencladorVP_VIAJE_FINDESEMANA.AsCurrency;

    chkVP_ABONA_RETORNO.Checked := sdqValNomencladorVP_ABONA_RETORNO.AsString = 'S';
    chkVP_DEFAULT.Checked       := sdqValNomencladorVP_DEFAULT.AsString = 'S';

    LockValNomControls(False);
    fpABMNomenclador.ActiveControl := edValNomVigHasta;
    fpABMNomenclador.Caption       := 'Quitar Valor';
    btnNomAceptar.Caption          := 'Quitar';
    AccionValMod                   := Baja;
    fpABMNomenclador.ShowModal;
  end;
end;

procedure TfrmManPrestador.tbEliminarUMedClick(Sender: TObject);
begin
  modoABMVUMed := 'Baja';
  if sdqVUMED.FieldByName('UP_VIGENCIAHASTA').IsNull then
  begin
    fraUnidad.Value     := sdqVUMED.fieldbyname('UP_UNIDAD').AsString;
    vigddeVUM.Date      := sdqVUMED.fieldbyname('UP_VIGENCIADESDE').AsDateTime;
    VigHtaVUM.ClearDate(sdqVUMED.FieldByName('UP_VIGENCIADESDE').AsDateTime <= Now);
    edNomValorVUM.Text  := sdqVUMED.fieldbyname('UP_VALOR').AsString;
    LockVUMControls(False);
    fpABMVUMed.Caption  := 'Quitar Valor';
    fpABMVUMed.ShowModal;
  end;
end;

procedure TfrmManPrestador.tbExportarContratoClick(Sender: TObject);
begin
  edlgContratos.Execute;
end;

procedure TfrmManPrestador.tbExportarConvClick(Sender: TObject);
begin
  edlgValMomencladorAMP.Execute;
end;

procedure TfrmManPrestador.tbExportarCPClick(Sender: TObject);
begin
  edlgPrestCP.Execute;
end;

procedure TfrmManPrestador.tbExportarEmpresaClick(Sender: TObject);
begin
  edlgEmpresas.Execute;
end;

procedure TfrmManPrestador.tbExportarEspClick(Sender: TObject);
begin
  ExportDialogEsp.Execute;
end;

procedure TfrmManPrestador.tbExportarNomClick(Sender: TObject);
begin
  edlgValMomenclador.Execute;
end;

procedure TfrmManPrestador.tbExportarPreocupClick(Sender: TObject);
begin
  edlgExamenes.Execute;
end;

procedure TfrmManPrestador.tbExportarUMedClick(Sender: TObject);
begin
  edlgValUnMedicas.Execute;
end;

procedure TfrmManPrestador.tbImportarClick(Sender: TObject);
begin
  if IsEmptyString(mskCUIT.Text) then Exit;

  with TfrmImportarPrestadores.Create (Self) do
    Execute(edRSocial.Text, mskCUIT.Text, cmbCaracter.FieldValue, cmbTipoPrestador.FieldValue)
end;

procedure TfrmManPrestador.tbImprimirClick(Sender: TObject);
var
  rptManPrestador: TrptManPrestador;
begin
  rptManPrestador := TrptManPrestador.Create(Self);
  try
    rptManPrestador.ShowPreview(fraPrestadorSel.IDPrestador, cmbTipoPrestador.FieldValue, cmbCaracter.Text,
                                cmbTipoPrestador.Text, cmbTipoComprobante.Text, cmbIngBrutConcepto.Text,
                                cmbRetDeGanacias.Text, cmbIVA.Text);
  finally
    rptManPrestador.Free;
  end;
end;

procedure TfrmManPrestador.tbImprimirContratoClick(Sender: TObject);
begin
  ImpresionGrilla(qpContratos);
end;

procedure TfrmManPrestador.tbImprimirConvClick(Sender: TObject);
begin
  ImpresionGrilla(qpValNomencladorAMP);
end;

procedure TfrmManPrestador.tbImprimirCPClick(Sender: TObject);
begin
  ImpresionGrilla(qpPrestCP);
end;

procedure TfrmManPrestador.tbImprimirEmpresaClick(Sender: TObject);
begin
  ImpresionGrilla(qpEmpresas);
end;

procedure TfrmManPrestador.tbImprimirEspClick(Sender: TObject);
begin
  ImpresionGrilla(QueryPrintEsp);
end;

procedure TfrmManPrestador.tbImprimirNomClick(Sender: TObject);
begin
  ImpresionGrilla(qpValNomenclador);
end;

procedure TfrmManPrestador.tbImprimirPreocupClick(Sender: TObject);
begin
  ImpresionGrilla(qpExamenes);
end;

procedure TfrmManPrestador.tbImprimirUMedClick(Sender: TObject);
begin
  ImpresionGrilla(QPVUMed);
end;

procedure TfrmManPrestador.tbIngresoBrutosClick(Sender: TObject);
begin
  SetTipoIngBrutos(tbIngresoBrutos.Tag <> 0);
end;

procedure TfrmManPrestador.tbLimpiarClick(Sender: TObject);
begin
  pnlPie.Caption     := '';
  pnlAccion.Caption  := 'Inactivo';
  mskCUIT.Text       := '';
  edSecuencia.Text   := '';
  edIdentif.Text     := '';
  edPrestMutual.Text := '';
  edRanking.Text     := '';
  edRSocial.Text     := '';
  edNFantasia.Text   := '';
  edDomicilio.Text   := '';
  fraCartillaWeb.Limpiar;
  fraDireccionPrest.Clear;
  
  fraDireccionLegal.edCPostal.Text    := '';
  fraDireccionLegal.cmbLocalidad.Text := '';
  fraDireccionLegal.cmbCalle.Text     := '';
  fraDireccionLegal.edNumero.Text     := '';
  fraDireccionLegal.edPiso.Text       := '';
  fraDireccionLegal.edDto.Text        := '';
  fraDireccionCom.edCPostal.Text      := '';
  fraDireccionCom.cmbLocalidad.Text   := '';
  fraDireccionCom.cmbCalle.Text       := '';
  fraDireccionCom.edNumero.Text       := '';
  fraDireccionCom.edPiso.Text         := '';
  fraDireccionCom.edDto.Text          := '';
  fraDireccionCom.Provincia           := -1;
  fraMotivoBaja.Clear;

  SetProvincia(-1);

  edTelCaract.clear;
  edTelNumero.Text     := '';

  edCelular.Text       := '';
  edFax.Text           := '';
  edBonificacion.Value := 0;

  chkCargaValores.Checked       := False;
  chkHabilitado.Checked         := False;  // Lu TK 1028
  chkReferente.Checked          := false;
  chkVisadoDocum.Checked        := false;
  chkCEM.Checked                := false;
  chkRespCivil.Checked          := False;
  cmbFechaRespCivil.Date        := 0;
  cmbFechaVtoHabilitacion.Date  := 0; 
  chkIngBrutos.Checked          := False;
  cmbIngBrutConcepto.FieldValue := '';
  edCA_ACTIVIDAD.Clear;
  mskIngBrutosNro.Text          := '';
  SetTipoIngBrutos(True);
  edMatricula.Text              := '';
  dcFechaRevision.Clear;
  dcVtoGanancias.Clear;
  dcVtoIngBrutos.Clear;
  mObsContables.Clear;
  edDiasVenci.Clear;

  edAsistencial.Text            := '';
  chkRetCajaMedico.Checked      := False;
  chkIVADiscr.Checked           := False;
  chkFdoTierradelFuego.Checked  := False;  // TK 62879
  cmbRetDeGanacias.FieldValue   := '';
  edIBDescripcion.Clear;
  edIBObservaciones.Clear;
  cmbTipoComprobante.FieldValue := '';
  cmbIVA.FieldValue             := '';
  cmbCaracter.FieldValue        := '';
  cmbTipoPrestador.FieldValue   := '';
  chkFactura.Checked            := False;
  edEMail.Text                  := '';
  edMailDebitos.Text            := '';
  edMailAdmin.Text              := '';
  edResponsable.Text            := '';
  edObservaciones.Text          := '';
  edHabilitaciones.Text         := '';
  edFImprFormInscripc.Text      := '';
  fraUsuariosContrata.Clear;
  EdRegionSanitaria.Clear;

  chkCronicos.Checked           := False;
  chkResonancia.Checked         := False;
  chkAmbulancia.Checked         := False;
  chkTAC.Checked                := False;
  chkElectromiograma.Checked    := False;
  chkRX.Checked                 := False;
  chkFKT.Checked                := False;
  chkFactAnestesia.Checked      := False;
  chkEcografia.Checked          := False;

  chkGuardiaAct.Checked         := False;
  chkGuardiaPas.Checked         := False;
  edPiso.Text                   := '0';
  edTI.Text                     := '0';
  edTIUnidCor.Text              := '0';
  edAislamTI.Text               := '0';
  edQuirofano.Text              := '0';
  edGuardia.Text                := '0';
  edSRayos.Text                 := '0';
  edConsExt.Text                := '0';
  EdMatProfesional.Text         := '0';
  edPlazoDebitos.Text           := '0';
  edLimite.Text                 := '';
  chkContratoART.Checked        := False;
  chkContratoMutualVig.Checked  := False;
  chkVisible.Checked            := False;
  chkAuditable.Checked          := False;
  rbMatProvincial.Checked       := False;

  edVigenciaDesdeCont.Date      := 0;
  edVigenciaHastaCont.Date      := 0;
  edFacturaDesde.Value          := 0;
  edFacturaHasta.Value          := 0;
  edPlazoRefacturacion.Value    := 0;
  edObservacionesContrato.Text  := '';
  chkMedicacionExtra.Checked    := False;
  chkSumaModulos.Checked        := False;
  chkContratoSocial.Checked     := False;
  chkCV.Checked                 := False;
  chkTitulo.Checked             := False;
  chkMatricula.Checked          := False;
  chkRespCivil.Checked          := False;
  chkHabilitado.Checked         := False;
  chkComplejidad.Checked        := False;
  chkCartaCompromiso.Checked    := False;
  chkActaAutoridades.Checked    := False;
  chkRenovAutomatica.Checked    := False;
  chkDocumento.Checked          := False;
  tbIncluirNomenc.Down          := False;

  rgEstadoPrest.ItemIndex := 0; //Activo

  sdqEspecialidades.Close; // limpieza de grilla Especialidades (LU)
  sdqValNomenclador.Close;
  sdqEmpresas.Close;
  sdqSiniestros.Close;  // TK 8638
  sdqContratos.Close;
  sdqExamenes.Close;
  RegSelecReplicar.Clear;
  RegSelecReplicarUM.Clear;
  VigDdeFiltroVUM.Clear;
  VigHtaFiltroVUM.Clear;
  VigDdeFiltroVM.Clear;
  VigHtaFiltroVM.Clear;

  tbLimpiarPresupuestoAMPClick(nil);

  if Assigned(Sender) then    // Si Sender = Nil Solo Limpia los Datos (Para el Alta)
  begin
    Accion                     := None;
    tbModificar.Enabled        := False;
    tbEliminar.Enabled         := False;
    tbImprimir.Enabled         := False;
    tbCuentasBancarias.Enabled := False;
    tbAuditable.Enabled        := False;
    tbNoAuditable.Enabled      := False;
    tbRegiones.Enabled         := False;
    tbMediosTransporte.Enabled := False;
    tbObservLiquidaciones.Enabled := False;   // TK 29415
    tbConsultorio.Enabled      := False;
    fraPrestadorSel.Limpiar;
    LockControls(True, True);
    fraPrestadorSel.IDPrestadorFocus;
  end;
end;

procedure TfrmManPrestador.tbMediosTransporteClick(Sender: TObject);
begin
  with TfrmManSDT_DETALLETRANSPORTE.Create(Self) do
  try
    Prestador := fraPrestadorSel.IDPrestador;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmManPrestador.tbModificarClick(Sender: TObject);
begin
  pcDatos.ActivePageIndex := 0;

  if fraPrestadorSel.Baja then
    if MsgBox('El prestador seleccionado está dado de baja' + #13 +
              'Para poder modificarlo deberá reincorporarlo.' + #13 +
              '¿Desea reincorporarlo ahora?', + MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit
    else if ExisteCuitSecuenciaActivo then
      Exit
  else
    fraPrestadorSel.SetColors(clWindowText);

  DisableButtons;
  Accion := Edicion;
  pnlAccion.Caption := 'Modificación';
  LockControls(False, True);
  edPrestMutual.SetFocus;
end;

procedure TfrmManPrestador.tbModificarContratoClick(Sender: TObject);
begin
  if sdqContratos.Active and not (sdqContratos.Eof) then
  begin
    fraTipoContratoABM.Codigo     := sdqContratosPC_TIPOCONTRATO.Value;
    edVigDesdeABM.Date            := sdqContratosPC_VIGENCIADESDE.AsDateTime;
    edVigHastaABM.Date            := sdqContratosPC_VIGENCIAHASTA.AsDateTime;
    edFactDesdeABM.Text           := sdqContratosPC_FACTURACIONDESDE.AsString;
    edFactHastaABM.Text           := sdqContratosPC_FACTURACIONHASTA.AsString;
    edPLazoRefacABM.Text          := sdqContratosPC_PLAZOREFACTURACION.AsString;
    chkMedExtraABM.Checked        := (sdqContratosPC_MEDICACIONEXTRA.AsString = 'S');
    chkSumaModulosABM.Checked     := (sdqContratosPC_SUMATORIAMODULOS.AsString = 'S');
    chkContratoSocialABM.Checked  := (sdqContratosPC_CONTRATOSOCIAL.AsString = 'S');
    dcContSoc.Date                := sdqContratos.fieldbyname('pc_fechacontsocial').AsDateTime;
    chkCVABM.Checked              := (sdqContratosPC_CV.AsString = 'S');
    chkTituloABM.Checked          := (sdqContratosPC_TITULO.AsString = 'S');
    chkMatriculaABM.Checked       := (sdqContratosPC_MATRICULA.AsString = 'S');
    chkRespCivilABM.Checked       := (sdqContratosPC_RESPCIVIL.AsString = 'S');
    cmbFechaRespCivilABM.Date     := sdqContratosPC_FECHARESPCIVIL.AsDateTime;
    chkhabilitadoABM.Checked      := (sdqContratosPC_HABILITACION.AsString = 'S');
    cmbFechaVtoHabilitacionABM.Date := sdqContratosPC_FECHAVTOHABILITACION.AsDateTime;
    chkComplejidadABM.Checked     := (sdqContratosPC_COMPLEJIDAD.AsString = 'S');
    chkCartaCompromisoABM.Checked := (sdqContratosPC_CARTACOMP.AsString = 'S');
    chkActaAutoridadesABM.Checked := (sdqContratosPC_ACTAAUTORIDADES.AsString = 'S');
    dcActaDesig.Date              := sdqContratos.fieldbyname('pc_fechaactaauto').AsDateTime;  
    chkRenovAutomABM.Checked      := (sdqContratosPC_RENOVAUTOMATICA.AsString = 'S');
    chkDocumentoABM.Checked       := (sdqContratosPC_DOCUMENTO.AsString = 'S');
    edObservABM.Lines.Text        := sdqContratosPC_GENERALIDADES.AsString;

    LockValContControls(True);
    fpABMContratos.Caption := 'Modificar Contrato';
    fpABMContratos.Tag := 1; //modificacion
    fpABMContratos.ShowModal;
  end;
end;

procedure TfrmManPrestador.tbModificarCPClick(Sender: TObject);
begin
  btnAsignarCP.Enabled := False;
  fraProvinciasCP.Clear;
  fraLocalidades.Clear;
  clbLocalidadesSinAsignar.Clear;
  clbLocalidadesAsignadas.Clear;
  edCPFiltro.Clear;
  fpAsignacionLocalidades.ShowModal;
  sdqPrestCP.Refresh
end;

procedure TfrmManPrestador.tbModificarEmpresaClick(Sender: TObject);
begin
  if IsRegistroSeleccionadoEmpresaValido() then
  begin
    ModoForm := fsModificar;
    LoadDatosFormPanelEmpresa;

    VCLExtra.LockControls([fraEmpresaEmp, edVigenciaDesdeEmp, edVigenciaHastaEmp], True);
    VCLExtra.LockControls([edObservacionesEmp], False);

    fpDialogEmpresas.Caption := 'Modificar Empresa';
    if fpDialogEmpresas.ShowModal = mrOk then
      sdqEmpresas.Refresh;
  end;
end;

procedure TfrmManPrestador.tbModificarEspClick(Sender: TObject);
var
  Sql: String;
begin
  fpEspecialidades.Caption   := 'Modificación de Especialidades';
  AccionEsp                  := Edicion;
  cmbEspecialidad.ReadOnly   := True;
  cmbEspecialidad.Font.Color := clGray;
  CargarDatosEsp;
  if not sdqEspecialidades.FieldByName('PE_FECHABAJA').IsNull then    // si esta dada de baja, le da de alta.
  begin
    mObservaciones.Font.Color := clGray;
    mObservaciones.ReadOnly   := True;
    VclExtra.LockControls([chkGuardiaActEsp, chkGuardiaPasEsp], True);
  end
  else
  begin
    mObservaciones.Font.Color := clWindowText;
    mObservaciones.ReadOnly   := False;
    VclExtra.LockControls([chkGuardiaActEsp, chkGuardiaPasEsp], False);
  end;
  chkGuardiaActEspClick(nil);
  chkGuardiaPasEspClick(nil);

  if fpEspecialidades.ShowModal = mrOk then
  begin
    Sql := 'UPDATE cpe_prestaespeci ';

    if not sdqEspecialidades.FieldByName('PE_FECHABAJA').IsNull then   // si esta dada de baja, le da de alta.
      Sql := Sql + ' SET pe_fechabaja = NULL '
    else  // sino modifica las Observaciones y lo demas.
      Sql := Sql + ' SET pe_observaciones = ' + SqlString(mObservaciones.Text,True) + ',' +
                       ' pe_guardiaact = ' + SqlString(IIF(chkGuardiaActEsp.Checked, 'S', 'N'), True) + ',' +
                       ' pe_desdeguardiaact = ' + SqlString(HoraSinMascara(edDesdeActEsp.Text), True, True) + ',' +
                       ' pe_hastaguardiaact = ' + SqlString(HoraSinMascara(edHastaActEsp.Text), True, True) + ',' +
                       ' pe_guardiapas = ' + SqlString(IIF(chkGuardiaPasEsp.Checked, 'S', 'N'), True) + ',' +
                       ' pe_desdeguardiapas = ' + SqlString(HoraSinMascara(edDesdePasEsp.Text), True, True) + ',' +
                       ' pe_hastaguardiapas = ' + SqlString(HoraSinMascara(edHastaPasEsp.Text), True, True) ;

    Sql := Sql + ' WHERE pe_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
                   ' AND pe_especialidad = ' + SqlString(sdqEspecialidades.FieldByName('PE_ESPECIALIDAD').AsString,True);
    EjecutarSql(Sql);
    RefreshAndRelocate(sdqEspecialidades, ['PE_ESPECIALIDAD']);
  end;
end;

procedure TfrmManPrestador.tbModificarPreocupClick(Sender: TObject);
begin
  Verificar(not(sdqExamenes.Active) or sdqExamenes.IsEmpty, dgExamenes, 'No hay ningún registro seleccionado.');
  DoCargarExamen(False);
  fpExamenPreocup.Showmodal;
  sdqExamenes.Refresh;
end;

procedure TfrmManPrestador.tbNoAuditableClick(Sender: TObject);
begin
  if Do_SetearAuditable(False, edIdentif.Value) then
    MsgBox('La operación se realizó con éxito.', MB_ICONINFORMATION);
end;

procedure TfrmManPrestador.tbOrdenarContratoClick(Sender: TObject);
begin
  sdContratos.Execute;
end;

procedure TfrmManPrestador.tbOrdenarConvClick(Sender: TObject);
begin
  sdValNomencladorAMP.Execute;
end;

procedure TfrmManPrestador.tbOrdenarCPClick(Sender: TObject);
begin
  sdPrestCP.Execute;
end;

procedure TfrmManPrestador.tbOrdenarEmpresaClick(Sender: TObject);
begin
  sdEmpresas.Execute;
end;

procedure TfrmManPrestador.tbOrdenarEspClick(Sender: TObject);
begin
  SortDialogEsp.Execute;
end;

procedure TfrmManPrestador.tbOrdenarNomClick(Sender: TObject);
begin
  sdValNomenclador.Execute;
end;

procedure TfrmManPrestador.tbOrdenarPreocupClick(Sender: TObject);
begin
  sdExamenes.Execute;
end;

procedure TfrmManPrestador.tbOrdenarUMedClick(Sender: TObject);
begin
  SDVUMed.Execute;
end;

procedure TfrmManPrestador.tbPolizaClick(Sender: TObject);
begin
  Verificar(fraPrestadorSel.IsEmpty, fraPrestadorSel, 'Debe seleccionar un prestador.');

  with TfrmManPolizas.Create(Self) do
  begin
    Prestador := fraPrestadorSel.Value;
    ShowModal;
  end;
end;

procedure TfrmManPrestador.tbPracticasPrestadorClick(Sender: TObject);
begin
  if Assigned(sdqValNomenclador) and not(sdqValNomenclador.IsEmpty) then
  begin
    AbrirPracticas(GetValorPrestador(fraPrestadorSel.IDPrestador, sdqValNomencladorON_ID.AsInteger,
                                     sdqValNomencladorVP_VIGENCIADESDE.AsDateTime),
                   sdqValNomencladorON_ID.AsInteger, False);
  end;
end;

procedure TfrmManPrestador.tbPresupuestoAMPClick(Sender: TObject);
var
  sSql: String;
begin
  //grdEstudios.DataSource := dsValoresPrestaciones;

  if (Sender is TToolButton) then
  begin
  
    LimpiarViaticos;

    if TToolButton(Sender).Name = 'tbAgregarPresupuestoAMP' then
      cmbPresupuesto.KeyValue := ''
    else                           //tbModificarPresupuestoAMP
      GridEmpresasCellClick(nil);

  end;

  chkNuevoAMP.Checked := not Assigned(Sender) or ((Sender as TToolButton) = tbAgregarPresupuestoAMP);

  sSql :='UPDATE comunes.cpp_presupuestoprestador' +
           ' SET pp_fechabaja = null,' +
               ' pp_usubaja = null' +
         ' WHERE PP_ID = :idpresupuesto';

  if not chkNuevoAMP.Checked and not sdqPresupuestosAMP.FieldByName('PP_FECHABAJA').IsNull then
  begin
    if not MsgAsk('El presupuesto seleccionado ya ha sido dado de baja.' + CRLF + '¿ Desea reactivarlo ?') then
      Abort
    else
      EjecutarSQLEx(sSql, [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger]);
  end;

  {if ValorSqlEx('select pp_idsolicitud from comunes.cpp_presupuestoprestador where pp_id = :idpresup',
                [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger]) <> '' then
    grdEstudios.DataSource := dsValoresPrestaciones;}


  if not Assigned(Sender) then
    CargarValores(True, False)
  else
    CargarValores(True);

  if Sender = nil then
  begin
    fraEmpresaPresupuestoAMP.Clear;
    fraPP_IDESTABLECIMIENTO.Clear;
    vclextra.LockControls([edPP_VIGENCIADESDE, edPP_VIGENCIAHASTA, edPP_DESCRIPCION, edValorKM_Presupuesto,
                           edValorEstadia_Presupuesto], true);


  end
  else
    if fpValoresPrestaciones.ShowModal = mrOk then
    begin
      sdqPresupuestosAMP.Close;
      OpenQueryEx(sdqPresupuestosAMP, [fraPrestadorSel.IDPrestador]);
      cmbPresupuestoChange(nil);
    end;

end;



procedure TfrmManPrestador.tbRegionesClick(Sender: TObject);
begin
  fraRegiones.Clear;
  sdqRegiones.Close;
  sdqRegiones.ParamByName('pPrestador').AsInteger := fraPrestadorSel.IDPrestador;
  sdqRegiones.Open;
  fpRegiones.ShowModal;
end;

{CAMARILLO - 07/05/2007 - replica los valores desde la secuencia que tiene la marca CA_CARGAVALORES hacia la secuencia en la que estoy parado.
             Si ésta ya posee el valor con vigencia anterior, primero cierra la vigencia.
             En cambio, si el valor es con una vigencia igual o posterior, lo informa al usuario y no inserta el nuevo
 DGASTAL - 28/06/2012 - Modificado para que replique sólo los valores que el usuario seleccione}

procedure TfrmManPrestador.tbReplicarNomClick(Sender: TObject);
var
  bInsertar: Boolean;
  iCargados, i: Integer;
  iPrestador: Integer;
  iValorPrestador: Integer;
  sAux: String;
  sSql: String;
begin
  Verificar((sdqDatosCA_CARGAVALORES.AsString = 'S'), nil, 'Esta secuencia es la mandatoria (tiene la marca de Carga de Valores).');
  RegSelecReplicar.Clear;
  sdqReplicar.Close;
  sdqReplicar.ParamByName('cuit').AsString := fraPrestadorSel.Cuit;
  sdqReplicar.Open;
  if fpReplicar.ShowModal = mrOK then
  begin
    if MsgBox('¿ Confirma que desea replicar los valores de la secuencia mandatoria a ésta secuencia ?', + MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit;

    iPrestador := edIdentif.Value;
    try
      iCargados := 0;
      for i := 0 to RegSelecReplicar.Count - 1 do
      begin
        sdqReplicar.Locate('vp_id', RegSelecReplicar[i], []);

        BeginTrans;
        bInsertar := True;
        sAux := 'SELECT 1' +
                 ' FROM svp_valorprestador' +
                ' WHERE vp_fechabaja IS NULL AND vp_idnomenclador = ' + SqlInt(sdqReplicar.FieldByName('vp_idnomenclador').AsInteger) +
                  ' AND vp_prestador = ' + SqlInt(iPrestador);
        // si el prestador al que le estoy por insertar tiene el valor con fecha posterior o igual, no lo inserto
        if ExisteSql(sAux + ' AND vp_vigenciadesde >= ' + SqlDate(sdqReplicar.FieldByName('vp_vigenciadesde').AsDateTime)) then
        begin
          MsgBox('Este prestador ya posee el valor ' +
                  sdqReplicar.FieldByName('vp_nomenclador').AsString + '-' +
                  sdqReplicar.FieldByName('vp_capitulo').AsString + '-' +
                  sdqReplicar.FieldByName('vp_codigo').AsString + ' con una vigencia igual o posterior.', MB_ICONINFORMATION);
          bInsertar := False;
        end
        //si el prestador al que le estoy por insertar tiene el valor con fecha anterior, primero le cierro la vigencia
        else if ExisteSql(sAux + ' AND vp_vigenciadesde < ' + SqlDate(sdqReplicar.FieldByName('vp_vigenciadesde').AsDateTime) +
                                 ' AND vp_vigenciahasta IS NULL') then
        begin
          sSql := 'UPDATE svp_valorprestador' +
                    ' SET vp_vigenciahasta = ' + SqlDate(sdqReplicar.FieldByName('vp_vigenciadesde').AsDateTime - 1) + ',' +
                        ' vp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                        ' vp_fechamodif = actualdate' +
                  ' WHERE vp_idnomenclador = ' + SqlInt(sdqReplicar.FieldByName('vp_idnomenclador').AsInteger) +
                    ' AND vp_prestador = ' + SqlInt(iPrestador) +
                    ' AND vp_vigenciahasta IS NULL ' +
                    ' AND vp_fechabaja IS NULL ';
          EjecutarSqlST(sSql);
        end;

        //hago el insert en la de valores si corresponde
        if bInsertar then
        begin
          //no utilizo el trigger auto_id porque necesito el valor para las prácticas..
          iValorPrestador := GetSecNextVal('SEQ_SVP_ID');
          //inserto el valor...
          sSql := 'INSERT INTO svp_valorprestador (' +
                  ' vp_prestador, vp_nomenclador, vp_capitulo, vp_codigo, vp_vigenciadesde,' +
                  ' vp_multiplicador, vp_honinternados, vp_honambulatorios, vp_gastointernados, ' +
                  ' vp_gastoambulatorios, vp_valor, vp_multigastos, vp_sesiones, vp_antitetanica, ' +
                  ' vp_hiv, vp_anestesia, vp_psicologica, vp_usualta, vp_fechaalta, vp_id, vp_valorhonorarios, ' +
                  ' vp_valorgastos, vp_default, vp_abona_retorno, vp_suma_fija, vp_monto_minimo, ' +
                  ' vp_viaje_exclusivo, vp_viaje_nocturno, vp_viaje_findesemana ) VALUES (' +     // TK 28942
                  SqlInt(iPrestador) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_nomenclador').AsString) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_capitulo').AsString) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_codigo').AsString) + ',' +
                  SqlDate(sdqReplicar.FieldByName('vp_vigenciadesde').AsDateTime) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_multiplicador').AsCurrency, False) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_honinternados').AsCurrency, True) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_honambulatorios').AsCurrency, True) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_gastointernados').AsCurrency, True) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_gastoambulatorios').AsCurrency, True) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_valor').AsCurrency, True) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_multigastos').AsCurrency, False) + ',' +
                  SqlInt(sdqReplicar.FieldByName('vp_sesiones').AsInteger) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_antitetanica').AsString) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_hiv').AsString) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_anestesia').AsString) + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_psicologica').AsString) + ',' +
                  SqlValue(Sesion.UserID) +
                  ', ActualDate, ' +
                  SqlInt(iValorPrestador) + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_valorhonorarios').AsCurrency, True)   + ',' +    // TK 22296
                  SqlNumber(sdqReplicar.FieldByName('vp_valorgastos').AsCurrency, True)       + ',' +    // TK 28942
                  SqlValue(sdqReplicar.FieldByName('vp_default').AsString)                    + ',' +
                  SqlValue(sdqReplicar.FieldByName('vp_abona_retorno').AsString)              + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_suma_fija').AsCurrency, True)         + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_monto_minimo').AsCurrency, True)      + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_viaje_exclusivo').AsCurrency, True)   + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_viaje_nocturno').AsCurrency, True)    + ',' +
                  SqlNumber(sdqReplicar.FieldByName('vp_viaje_findesemana').AsCurrency, True) + ')' ;

          EjecutarSqlST(sSql);
          //...y las practicas
          sSql := 'INSERT INTO cpp_prestadorpractica ( ' +
                  ' pp_idprestador, pp_idvalorprestador, pp_idpractica, pp_fechaalta, pp_usualta, pp_espractica)' +
                  ' SELECT ' + SqlInt(iPrestador) + ',' +  SqlInt(iValorPrestador) + ',' +
                           ' pp_idpractica, actualdate, ' + SqlValue(Sesion.UserId) + ', im_espractica ' +     // TK 15308
                      ' FROM cpp_prestadorpractica, svp_valorprestador, amed.mim_incluyemodulo ' +
                     ' WHERE pp_idvalorprestador = vp_id' +
                       ' AND im_idnomenclador = vp_idnomenclador ' +
                       ' AND pp_idpractica = im_idpracticamodulo ' +
                       ' AND vp_idnomenclador = ' + SqlInt(sdqReplicar.FieldByName('vp_idnomenclador').AsInteger) +
                       ' AND pp_idprestador = ' + SqlInt(sdqReplicar.FieldByName('ca_identificador').AsInteger) +
                       ' AND pp_fechabaja IS NULL ' +
                       ' AND im_fechabaja IS NULL ' +
                       ' AND vp_vigenciahasta IS NULL ' +
                       ' AND vp_fechabaja IS NULL ';
          EjecutarSqlST(sSql);

          Inc(iCargados);
        end;
        CommitTrans;
      end;   //for

      if (iCargados = 0) then
        MsgBox('No se ha cargado ningún valor.', MB_ICONINFORMATION)
      else
      begin
        sdqValNomenclador.Refresh;
        MsgBox('Se ha/n cargado ' +  IntToStr(iCargados) + ' valor/es correctamente.', MB_ICONINFORMATION);
      end

    except
      on E:Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E);
      end;
    end;

  end;
end;

{CAMARILLO - 15/08/2007 - replica los valores desde la secuencia que tiene la marca CA_CARGAVALORES hacia la secuencia en la que estoy parado.
             Si ésta ya posee el valor con vigencia anterior, primero cierra la vigencia.
             En cambio, si el valor es con una vigencia igual o posterior, lo informa al usuario y no inserta el nuevo }
procedure TfrmManPrestador.tbReplicarUMedClick(Sender: TObject);
var
  bInsertar: Boolean;
  iCargados, iPrestador, i: Integer;
  sAux, sSql: String;
begin
  Verificar((sdqDatosCA_CARGAVALORES.AsString = 'S'), nil, 'Esta secuencia es la mandatoria (tiene la marca de Carga de Valores).');

  iPrestador := edIdentif.Value;
  RegSelecReplicarUM.Clear;
  sdqReplicarUM.Close;
  sdqReplicarUM.ParamByName('cuit').AsString := fraPrestadorSel.Cuit;
  sdqReplicarUM.Open;

  if fpReplicarUM.ShowModal = mrOK then
  begin
    if MsgBox('¿ Confirma que desea replicar los valores de la secuencia mandatoria a esta secuencia ?', + MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit;
    try
      BeginTrans;
      iCargados := 0;
      for i := 0 to RegSelecReplicarUM.Count - 1 do
      begin
        sdqReplicarUM.Locate('up_id', RegSelecReplicarUM[i], []);
        bInsertar := True;
        sAux := 'SELECT 1' +
                 ' FROM sup_unidadprestador' +
                ' WHERE up_unidad = ' + SqlValue(sdqReplicarUM.FieldByName('up_unidad').AsString) +
                  ' AND up_prestador = ' + SqlInt(iPrestador) +
                  ' AND up_fechabaja IS NULL ';

        //si el prestador al que le estoy por insertar tiene el valor con fecha posterior o igual, no lo inserto
        if ExisteSql(sAux + ' AND up_vigenciadesde >= ' + SqlDate(sdqReplicarUM.FieldByName('up_vigenciadesde').AsDateTime)) then
        begin
          MsgBox('Este prestador ya posee el valor ' +
                  sdqReplicarUM.FieldByName('up_unidad').AsString + '-' +
                  sdqReplicarUM.FieldByName('um_descripcion').AsString +
                  ' con una vigencia igual o posterior.', MB_ICONINFORMATION);
          bInsertar := False;
        end
        //si el prestador al que le estoy por insertar tiene el valor con fecha anterior, primero le cierro la vigencia
        else if ExisteSql(sAux + ' AND up_vigenciadesde < ' + SqlDate(sdqReplicarUM.FieldByName('up_vigenciadesde').AsDateTime) +
                                 ' AND up_vigenciahasta IS NULL') then
        begin
          sSql := 'UPDATE sup_unidadprestador ' +
                    ' SET up_vigenciahasta = ' + SqlDate(sdqReplicarUM.FieldByName('up_vigenciadesde').AsDateTime - 1) +
                  ' WHERE up_unidad = ' + SqlValue(sdqReplicarUM.FieldByName('up_unidad').AsString) +
                    ' AND up_prestador = ' + SqlInt(iPrestador) +
                    ' AND up_vigenciahasta IS NULL ' +
                    ' AND up_fechabaja IS NULL ';
          EjecutarSqlST(sSql);
        end;

        //hago el insert en la de valores si corresponde
        if bInsertar then
        begin
          sSql := 'INSERT INTO sup_unidadprestador ' +
                  '(up_prestador, up_unidad, up_vigenciadesde, up_valor) VALUES ( ' +
                  SqlInt(iPrestador) + ',' + SqlValue(sdqReplicarUM.FieldByName('up_unidad').AsString) + ',' +
                  SqlDate(sdqReplicarUM.FieldByName('up_vigenciadesde').AsDateTime) + ',' +
                  SqlNumber(sdqReplicarUM.FieldByName('up_valor').AsCurrency, False) + ')';     // TK 30732 cambio el True por el False, porque puede insertarse Ceros en el valor.(caso Sin Honorarios, sin Gastos).
          EjecutarSqlST(sSql);

          Inc(iCargados);
        end;
      end; //for
      CommitTrans;

      if (iCargados = 0) then
        MsgBox('No se ha cargado ningún valor.', MB_ICONINFORMATION)
      else
      begin
        sdqReplicarUM.Refresh;
        MsgBox('Se ha/n cargado ' +  IntToStr(iCargados) + ' valor/es correctamente.', MB_ICONINFORMATION);
      end;

    except
      on E:Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E);
      end;
    end;
  end;
end;

procedure TfrmManPrestador.tbConsultorioClick(Sender: TObject);
begin
  fpConsultorio.Showmodal;
end;

procedure TfrmManPrestador.tbSolicitudPresupuestosClick(Sender: TObject);
begin
  Abrir(TfrmSolicitarPresupuesto, frmSolicitarPresupuesto, tmvMDIChild, frmPrincipal.mnuSolicitudDePresupuestosAMP);
  with frmSolicitarPresupuesto do
  begin
    ClearData;
    fraCA_IDENTIFICADOR.Cargar(fraPrestadorSel.IDPrestador);
    chkPendientes.Checked := True;
    RefreshData;
  end;
end;

procedure TfrmManPrestador.tbUsuariosPorGrupoClick(Sender: TObject);
begin
  try
    TfrmGruposPrestador.Create(self);
  finally

  end;
end;

procedure TfrmManPrestador.AbrirPracticas(iValorPrestador, iIdNomenclador :Integer; bEsAlta :Boolean);
begin
  with TfrmPracticasPrestador.Create(Self) do
  try
    IdPrestador     := fraPrestadorSel.IDPrestador;
    ValorPrestador  := iValorPrestador;
    IdNomenclador   := iIdNomenclador;
    Habilitar       := Seguridad.Claves.IsActive('CargaPracticasPrestador');
    HabilitarGrilla := (Accion = Edicion);  // TK 60813
    EsAlta          := bEsAlta;
    Execute;

    if ModalResult = mrOk then
      bEsAltaNomenclador := False;
  finally
    Free;
  end;
end;

procedure TfrmManPrestador.ActualizarCargaValores(sCuit: String; iSecuencia: Integer);
var
  sSql: String;
  vIdPrestador: Integer;
begin
  sSql := 'SELECT ca_identificador' +
           ' FROM cpr_prestador' +
          ' WHERE ca_clave = ' + SqlString(sCuit) +
            ' AND ca_secuencia <> ' + SqlInt(iSecuencia) +
            ' AND ca_cargavalores = ''S''';
  vIdPrestador := ValorSqlInteger(sSql);
  if vIdPrestador > 0 then
  begin
    sSql := 'UPDATE cpr_prestador' +
              ' SET ca_cargavalores = ''N''' +
            ' WHERE ca_identificador = ' + SqlInt(vIdPrestador);
    EjecutarSql(sSql);
  end;
end;

procedure TfrmManPrestador.CargarContratos();
begin
  if not(sdqContratos.Eof) then
  begin
    edVigenciaDesdeCont.Date            := sdqContratosPC_VIGENCIADESDE.AsDateTime;
    edVigenciaHastaCont.Date            := sdqContratosPC_VIGENCIAHASTA.AsDateTime;
    edFacturaDesde.Text                 := sdqContratosPC_FACTURACIONDESDE.AsString;
    edFacturaHasta.Text                 := sdqContratosPC_FACTURACIONHASTA.AsString;
    edPlazoRefacturacion.Text           := sdqContratosPC_PLAZOREFACTURACION.AsString;
    chkMedicacionExtra.Checked          := (sdqContratosPC_MEDICACIONEXTRA.AsString = 'S');
    chkSumaModulos.Checked              := (sdqContratosPC_SUMATORIAMODULOS.AsString = 'S');
    chkContratoSocial.Checked           := (sdqContratosPC_CONTRATOSOCIAL.AsString = 'S');
    chkCV.Checked                       := (sdqContratosPC_CV.AsString = 'S');
    chkTitulo.Checked                   := (sdqContratosPC_TITULO.AsString = 'S');
    chkMatricula.Checked                := (sdqContratosPC_MATRICULA.AsString = 'S');
    chkRespCivil.Checked                := (sdqContratosPC_RESPCIVIL.AsString = 'S');
    cmbFechaRespCivil.Date              := sdqContratosPC_FECHARESPCIVIL.AsDateTime;
    cmbFechaVtoHabilitacion.Date        := sdqContratosPC_FECHAVTOHABILITACION.AsDateTime;
    chkHabilitado.Checked               := (sdqContratosPC_HABILITACION.AsString = 'S');
    chkComplejidad.Checked              := (sdqContratosPC_COMPLEJIDAD.AsString = 'S');
    chkCartaCompromiso.Checked          := (sdqContratosPC_CARTACOMP.AsString = 'S');
    chkActaAutoridades.Checked          := (sdqContratosPC_ACTAAUTORIDADES.AsString = 'S');
    chkRenovAutomatica.Checked          := (sdqContratosPC_RENOVAUTOMATICA.AsString = 'S');
    chkDocumento.Checked                := (sdqContratosPC_DOCUMENTO.AsString = 'S');
    edObservacionesContrato.Lines.Text  := sdqContratosPC_GENERALIDADES.AsString;
    dcContSoc1.Date := sdqcontratos.fieldbyname('pc_fechacontsocial').AsDateTime;
    dcActaDesig1.Date := sdqcontratos.fieldbyname('pc_fechaactaauto').AsDateTime;

  end
  else  // si la grilla queda vacia, entonces blanqueo los edits.
  begin
    edVigenciaDesdeCont.Clear;
    edVigenciaHastaCont.Clear;
    edFacturaDesde.Clear;
    edFacturaHasta.Clear;
    edPlazoRefacturacion.Clear;
    edObservacionesContrato.Clear;
    chkDocumento.Checked        := False;
    chkMedicacionExtra.Checked  := False;
    chkSumaModulos.Checked      := False;
    chkContratoSocial.Checked   := False;
    chkCV.Checked               := False;
    chkTitulo.Checked           := False;
    chkMatricula.Checked        := False;
    chkRespCivil.Checked        := False;
    chkHabilitado.Checked       := False;
    chkComplejidad.Checked      := False;
    chkCartaCompromiso.Checked  := False;
    chkActaAutoridades.Checked  := False;
    chkRenovAutomatica.Checked  := False;
    dcContSoc1.Clear;
    dcActaDesig1.Clear;
    cmbFechaVtoHabilitacion.Clear;
    cmbFechaRespCivil.Clear;
  end;

  MarcarRequerimientosLegajo;

end;

procedure TfrmManPrestador.MarcarRequerimientosLegajo;
var ssql: string;
begin
  ssql := ' SELECT tp_renovautomatica, tp_dni, tp_estatuto, tp_acta, tp_cv, tp_matricula, tp_titulo, tp_habilitacion, ' +
          '        tp_complejidad, tp_cartacompromiso, tp_respcivil ' +
          '   FROM mtp_tipoprestador ' +
          '  WHERE tp_codigo = :cod ';

  with GetQueryEx(ssql, [cmbTipoPrestador.FieldValue]) do
  begin
    if FieldByName('tp_renovautomatica').AsString = 'S' then
      chkRenovAutomatica.Font.Style := [fsBold]
    else
      chkRenovAutomatica.Font.Style := [];

    if FieldByName('tp_dni').AsString = 'S' then
      chkDocumento.Font.Style := [fsBold]
    else
      chkDocumento.Font.Style := [];

    if FieldByName('tp_estatuto').AsString = 'S' then
      chkContratoSocial.Font.Style := [fsBold]
    else
      chkContratoSocial.Font.Style := [];

    if FieldByName('tp_acta').AsString = 'S' then
      chkActaAutoridades.Font.Style := [fsBold]
    else
      chkActaAutoridades.Font.Style := [];

    if FieldByName('tp_cv').AsString = 'S' then
      chkCV.Font.Style := [fsBold]
    else
      chkCV.Font.Style := [];

    if FieldByName('tp_matricula').AsString = 'S' then
      chkMatricula.Font.Style := [fsBold]
    else
      chkMatricula.Font.Style := [];

    if FieldByName('tp_titulo').AsString = 'S' then
      chkTitulo.Font.Style := [fsBold]
    else
      chkTitulo.Font.Style := [];

    if FieldByName('tp_habilitacion').AsString = 'S' then
      chkHabilitado.Font.Style := [fsBold]
    else
      chkHabilitado.Font.Style := [];

    if FieldByName('tp_complejidad').AsString = 'S' then
      chkComplejidad.Font.Style := [fsBold]
    else
      chkComplejidad.Font.Style := [];

    if FieldByName('tp_cartacompromiso').AsString = 'S' then
      chkCartaCompromiso.Font.Style := [fsBold]
    else
      chkCartaCompromiso.Font.Style := [];

    if FieldByName('tp_respcivil').AsString = 'S' then
      chkRespCivil.Font.Style := [fsBold]
    else
      chkRespCivil.Font.Style := [];

  end;
end;

procedure TfrmManPrestador.do_CargarEstadoLegajo;
var sEstado: string;
begin
  {is_LegajoCompleto := true;
  ssql := ' SELECT tp_renovautomatica, tp_dni, tp_estatuto, tp_acta, tp_cv, tp_matricula, tp_titulo, tp_habilitacion, ' +
          '        tp_complejidad, tp_cartacompromiso, tp_respcivil ' +
          '   FROM mtp_tipoprestador ' +
          '  WHERE tp_codigo = :cod ';

  with GetQueryEx(ssql, [cmbTipoPrestador.FieldValue]) do
  begin
    if ((FieldByName('tp_renovautomatica').AsString = 'S') and (not chkRenovAutomatica.Checked)) or
       ((FieldByName('tp_dni').AsString = 'S') and (not chkDocumento.Checked)) or
       ((FieldByName('tp_estatuto').AsString = 'S') and (not chkContratoSocial.Checked)) or
       ((FieldByName('tp_acta').AsString = 'S') and (not chkActaAutoridades.Checked)) or
       ((FieldByName('tp_cv').AsString = 'S') and (not chkCV.Checked)) or
       ((FieldByName('tp_matricula').AsString = 'S') and (not chkMatricula.Checked)) or
       ((FieldByName('tp_titulo').AsString = 'S') and (not chkTitulo.Checked)) or
       ((FieldByName('tp_habilitacion').AsString = 'S') and (not chkHabilitado.Checked)) or
       ((FieldByName('tp_complejidad').AsString = 'S') and (not chkComplejidad.Checked)) or
       ((FieldByName('tp_cartacompromiso').AsString = 'S') and (not chkCartaCompromiso.Checked)) or
       ((FieldByName('tp_respcivil').AsString = 'S') and (not chkRespCivil.Checked)) then
       is_LegajoCompleto := false;
       
  end; }

  pnlPie.Caption := StringReplace(pnlPie.Caption, 'Legajo completo', '', []);
  pnlPie.Caption := StringReplace(pnlPie.Caption, 'Legajo incompleto', '', []);

  sEstado := ValorSqlEx('select art.prestadores.get_estadolegajo (:ident) from dual', [fraPrestadorSel.IDPrestador]);
  if sEstado = 'Completo' then
    pnlPie.Caption := pnlPie.Caption + 'Legajo completo'
  else if sEstado = 'Incompleto' then
    pnlPie.Caption := pnlPie.Caption + 'Legajo incompleto'

end;

procedure TfrmManPrestador.CargarDatosEsp;
begin
  with sdqEspecialidades do
  begin
    cmbEspecialidad.Text     := FieldByName('ES_DESCRIPCION').AsString;
    mObservaciones.Text      := FieldByName('PE_OBSERVACIONES').AsString;
    chkGuardiaActEsp.Checked := (FieldByName('PE_GUARDIAACT').AsString = 'S');
    chkGuardiaPasEsp.Checked := (FieldByName('PE_GUARDIAPAS').AsString = 'S');
    edDesdeActEsp.Text       := FieldByName('PE_DESDEGUARDIAACT').AsString;
    edHastaActEsp.Text       := FieldByName('PE_HASTAGUARDIAACT').AsString;
    edDesdePasEsp.Text       := FieldByName('PE_DESDEGUARDIAPAS').AsString;
    edHastaPasEsp.Text       := FieldByName('PE_HASTAGUARDIAPAS').AsString;
  end;
end;

procedure TfrmManPrestador.CargarValores(APresupuesto: Boolean; ACerrarEmpresas: Boolean; AScroll: Boolean);
var
  sPresupuesto: String;
  sSQL, sSQL2: String;
begin
  chkPresupuestoAMP.Checked := APresupuesto;
  chkPresupuestoAMPClick(nil);
  pnlTopAMP.Visible := APresupuesto;
  pnlDatosAMP.Top := 120;

  with sdqValoresPrestaciones do
  begin
    sSQL := FSQLValoresPrestaciones;
    if not VarIsNull(cmbPresupuesto.KeyValue) or chkNuevoAMP.Checked then
    begin
      if chkNuevoAMP.Checked then
      begin
        chkPresupuestoAMPClick(nil);
        VCLExtra.LockControls([edPP_VIGENCIADESDE, edPP_VIGENCIAHASTA, edPP_DESCRIPCION, edValorKM_Presupuesto, edValorEstadia_Presupuesto], not ACerrarEmpresas);

        OpenQueryEx(sdqValoresPrestaciones, [fraPrestadorSel.IDPrestador, 0], sSQL + ' ORDER BY pd_idtipovalor, es_codigo ');
        fraEmpresaPresupuestoAMP.Clear;
        fraPP_IDESTABLECIMIENTO.Clear;
        OnEstablecimientoAMPChange(nil);

        if ACerrarEmpresas then
        begin
          lbNroPresupuesto.Caption := '?';
          edPP_VIGENCIADESDE.Clear;
          edPP_VIGENCIAHASTA.Clear;
          edPP_DESCRIPCION.Clear;
          edValorKM_Presupuesto.Clear;
          edValorEstadia_Presupuesto.Clear;
          if not AScroll then
            sdqEmpresasPresupuestoAMP.Close;
        end;
      end
      else
      begin
        if not sdqEmpresasPresupuestoAMP.Active then
          OpenQueryEx(sdqEmpresasPresupuestoAMP, [sdqPresupuestosAMP.FieldByName('PP_NROPRESUPUESTO').AsInteger]);

        sSQL2 :=
          'SELECT es_contrato, es_id, pp_id, pp_idprestador, pp_idestablecimiento, pp_vigenciadesde, ' +
          '       pp_vigenciahasta, pp_usualta, pp_fechaalta, pp_usubaja, pp_fechabaja, pp_descripcion, ' +
          '       pp_nropresupuesto, pp_valor_km, pp_valor_estadia, pp_idsolicitud, es_nroestableci, ' +
          '       pp_fechaaprobacion, pp_usuaprobacion, pp_viaticosbonif ' +
          '  FROM comunes.cpp_presupuestoprestador, aes_establecimiento ' +
          ' WHERE pp_idestablecimiento = es_id ' +
          '   AND pp_id = :idpresupuesto';
        with GetQueryEx(sSQL2, [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger]) do
        try
          fraEmpresaPresupuestoAMP.Contrato := FieldByName('es_contrato').AsInteger;
          fraPP_IDESTABLECIMIENTO.Cargar(fraEmpresaPresupuestoAMP.CUIT,
                                         FieldByName('es_nroestableci').AsInteger);
          OnEstablecimientoAMPChange(nil);

          edPP_VIGENCIADESDE.Date           := FieldByName('pp_vigenciadesde').AsDateTime;
          edPP_VIGENCIAHASTA.Date           := FieldByName('pp_vigenciahasta').AsDateTime;
          edPP_DESCRIPCION.Text             := FieldByName('pp_descripcion').AsString;
          lbNroPresupuesto.Caption          := FieldByName('pp_nropresupuesto').AsString;
          edValorKM_Presupuesto.Value       := FieldByName('pp_valor_km').AsFloat;
          edValorEstadia_Presupuesto.Value  := FieldByName('pp_valor_estadia').AsFloat;
          lupSolicitudPresupuesto.Value     := FieldByName('pp_idsolicitud').AsString;
          chkViatico.Checked                := FieldByName('pp_viaticosbonif').AsString = 'S';
        finally
          Free;
        end;

        AddCondition(sSQL, ' estudios.es_sincosto = ''N'' ');
        AddCondition(sSQL, ' pd_idpresupuesto = :idpresupuesto ');
        sPresupuesto := ' AND pd_idpresupuesto = ' + sdqEmpresasPresupuestoAMP.FieldByName('pp_id').AsString;

        AddTable(sSQL, 'hys.v_trabajadores_con_riesgo');
        AddTable(sSQL, 'hys.hur_ultimorelevamiento');
        AddCondition(sSQL, 'es_idestudio = rs_idestudio');

        AddCondition(sSQL, ' ur_estableci = ' + sdqEmpresasPresupuestoAMP.FieldByName('es_nroestableci').AsString);
        AddCondition(sSQL, ' ur_cuit = ' + SQLValue(sdqEmpresasPresupuestoAMP.FieldByName('em_cuit').AsString));
        AddCondition(sSQL, ' rs_fecha = ur_fecharelev ');
        AddCondition(sSQL, ' rs_cuit = ur_cuit ');
        AddCondition(sSQL, ' rs_estableci = ur_estableci ');
        AddCondition(sSQL, ' rs_periodicidad <= DECODE((SELECT NVL(sp_operativo, ' +
                           '                                       art.amp.get_operativoproxlote(rs_idestableci)) ' +
                           '                              FROM comunes.csp_solicitudpresupuesto ' +
                           '                             WHERE sp_contrato = rs_contrato ' +
                           '                               AND sp_idestablecimiento = rs_idestableci ' +
                           '                               AND sp_id = (SELECT MAX(sp_id) ' +
                           '                                              FROM comunes.csp_solicitudpresupuesto ' +
                           '                                             WHERE sp_contrato = rs_contrato ' +
                           '                                               AND sp_idestablecimiento = rs_idestableci)), ' +
                           '                           ''S'', 6, ' +
                           '                           ''A'', 24, ' +
                           '                           ''R'', -1, ' +
                           '                           24) ');

        sSQL := sSQL + #13 +
                // Estudios de reconfirmaciones sin presupuestar */
                'UNION ALL ' + #13 +
                'SELECT TO_CHAR(:pprestador) ca_identificador, estudios.es_codigo, ' +
                '       TO_NUMBER(DECODE(:idpresupuesto, ' +
                '                        -1, NULL, ' +
                '                        0, NULL, ' +
                '                        :idpresupuesto)) pd_idpresupuesto, ' +
                '       UPPER(estudios.es_descripcion) es_descripcion, 1 pd_idtipovalor, ' +
                '       NULL pd_valor, NULL pd_vigenciadesde, estudios.es_fechabaja, ' +
                '       estudios.es_id es_idestudio, estudios.es_sincosto ' +
                '  FROM comunes.csp_solicitudpresupuesto, afi.aes_establecimiento aes, ' +
                '       hys.hdl_detallelote hdl, art.aes_estudios estudios, ' +
                '       hys.hre_reconfirmacionestudio hre, hys.hgr_gestionreconfirmacion hgr ' +
                ' WHERE dl_id = gr_iddetallelote ' +
                '   AND sp_contrato = es_contrato ' +
                '   AND sp_idestablecimiento = dl_idestableci ' +
                '   AND sp_id = ' + SqlValue(lupSolicitudPresupuesto.Value) +
                '   AND sp_operativo = ''R'' ' +
                '   AND NOT EXISTS(SELECT 1 ' +
                '                    FROM comunes.cpd_prestadorestudio ' +
                '                   WHERE pd_idprestador = ' + SqlValue (fraPrestadorSel.IDPrestador) +
                '                     AND pd_idestudio = es_codigo ' +
                '                     AND pd_vigenciahasta IS NULL ' +
                '                     AND pd_fechabaja IS NULL ' +
                '                     AND pd_idpresupuesto = :idpresupuesto) ' +
                '   AND aes.es_id = dl_idestableci ' +
                '   AND dl_idestableci = ' + SqlValue(fraPP_IDESTABLECIMIENTO.ID) +
                '   AND dl_id = gr_iddetallelote ' +
                '   AND es_codigo = re_idestudio ' +
                '   AND re_fechabaja IS NULL ' +
                '   AND re_idreconfirmacion = gr_id ' +
                '   AND gr_enfprofesional = ''N'' ' +
                '   AND gr_fechabaja IS NULL ' +
                'UNION ALL ' +
                // Estudios de reconfirmaciones presupuestados
                'SELECT TO_CHAR(pd_idprestador), estudios.es_codigo, ' +
                '       TO_NUMBER(DECODE(:idpresupuesto, ' +
                '                        -1, DECODE(pd_idpresupuesto, ' +
                '                                   NULL, NULL, ' +
                '                                   :idpresupuesto), ' +
                '                        0, NULL, ' +
                '                        pd_idpresupuesto, :idpresupuesto)), ' +
                '       UPPER(estudios.es_descripcion) es_descripcion, pd_idtipovalor, ' +
                '       DECODE(:idpresupuesto, ' +
                '              0, NULL, ' +
                '              pd_idpresupuesto, pd_valor, ' +
                '              -1, DECODE(pd_idpresupuesto, NULL, pd_valor, NULL), ' +
                '              NULL), ' +
                '       DECODE(:idpresupuesto, ' +
                '              0, NULL, ' +
                '              pd_idpresupuesto, pd_vigenciadesde, ' +
                '              -1, DECODE(pd_idpresupuesto, NULL, pd_vigenciadesde, NULL), ' +
                '              NULL), ' +
                '       (SELECT aes2.es_fechabaja ' +
                '          FROM art.aes_estudios aes2 ' +
                '         WHERE aes2.es_codigo = estudios.es_codigo) es_fechabaja, ' +
                '       estudios.es_id es_idestudio, es_sincosto ' +
                '  FROM comunes.cpd_prestadorestudio, comunes.csp_solicitudpresupuesto, ' +
                '       afi.aes_establecimiento aes, hys.hdl_detallelote hdl, ' +
                '       art.aes_estudios estudios, hys.hre_reconfirmacionestudio hre, ' +
                '       hys.hgr_gestionreconfirmacion hgr ' +
                ' WHERE dl_id = gr_iddetallelote ' +
                '   AND sp_contrato = es_contrato ' +
                '   AND sp_idestablecimiento = dl_idestableci ' +
                '   AND sp_id = ' + SqlValue(lupSolicitudPresupuesto.Value) +
                '   AND sp_operativo = ''R'' ' +
                '   AND pd_idprestador = ' + SqlValue (fraPrestadorSel.IDPrestador) +
                '   AND pd_idestudio = es_codigo ' +
                '   AND pd_vigenciahasta IS NULL ' +
                '   AND pd_fechabaja IS NULL ' +
                '   AND pd_idpresupuesto = :idpresupuesto ' +
                '   AND aes.es_id = dl_idestableci ' +
                '   AND dl_idestableci = ' + SqlValue (fraPP_IDESTABLECIMIENTO.ID) +
                '   AND dl_id = gr_iddetallelote ' +
                '   AND es_codigo = re_idestudio ' +
                '   AND re_fechabaja IS NULL ' +
                '   AND re_idreconfirmacion = gr_id ' +
                '   AND gr_enfprofesional = ''N'' ' +
                '   AND gr_fechabaja IS NULL ' +
                ' ORDER BY pd_idtipovalor, es_codigo ';

        OpenQueryEx(sdqValoresPrestaciones, [fraPrestadorSel.IDPrestador, sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger], sSQL);
      end;
    end
    else
    begin
      fraEmpresaPresupuestoAMP.Clear;
      fraPP_IDESTABLECIMIENTO.Clear;
      OnEstablecimientoAMPChange(nil);
      edPP_VIGENCIADESDE.Clear;
      edPP_VIGENCIAHASTA.Clear;
      edPP_DESCRIPCION.Clear;

      sPresupuesto := ' AND pd_idpresupuesto IS NULL ';
      AddCondition(sSQL, ' pd_idpresupuesto IS NULL ');
      OpenQueryEx(sdqValoresPrestaciones, [fraPrestadorSel.IDPrestador, -1], sSQL + ' ORDER BY pd_idtipovalor, es_codigo ');
    end;

    lblCantidadEstudios.Caption := 'Se encontraron ' + IntToStr(sdqValoresPrestaciones.RecordCount) + ' estudios.';

    cdsValoresPrestaciones.Open;
    cdsValoresPrestaciones.EmptyDataSet;
    
    while not EoF do
    begin
      {rxmValoresPrestaciones.InsertRecord([FieldByName('es_codigo').AsString, FieldByName('es_descripcion').AsString,
                                           StringReplace(FieldByName('pd_valor').AsString, '.', ',', []),
                                           FieldByName('pd_vigenciadesde').AsString, FieldByName('es_fechabaja').AsString]);}

      cdsValoresPrestaciones.InsertRecord([FieldByName('es_codigo').AsString, FieldByName('es_descripcion').AsString,
                                           StringReplace(FieldByName('pd_valor').AsString, '.', ',', []),
                                           FieldByName('pd_vigenciadesde').AsString, FieldByName('es_fechabaja').AsString]);

      Next;
    end;

    Close;
  end;

  if (chkNuevoAMP.Checked = false) then
    if (sdqValoresPrestador.IsEmpty) then
      tieneValores := false
    else
      tieneValores := true;

  if not APresupuesto or not chkNuevoAMP.Checked then
  begin
    sSQL :=
      'SELECT pd_idtipovalor, pd_valor, pd_vigenciadesde' +
       ' FROM comunes.cpd_prestadorestudio' +
      ' WHERE pd_idprestador = :prestador' +
        ' AND pd_idtipovalor in (:v1, :v2, :v3)' +
        ' AND pd_vigenciahasta IS NULL ' + sPresupuesto +
        ' AND pd_fechabaja IS NULL ' +
   ' ORDER BY pd_idtipovalor';

    with GetQueryEx(sSQL, [fraPrestadorSel.IDPrestador, 2, 3, 4], [qoIncludeUpdateObject]) do
    try
      while not Eof do
      begin
        if Locate('pd_idtipovalor', 2, []) then
        begin
          edViaticoKM.Value     := FieldByName('pd_valor').AsFloat;
          edFechaViaticoKM.Date := FieldByName('pd_vigenciadesde').AsDateTime;
          Delete;
        end;
        if Locate('pd_idtipovalor', 3, []) then
        begin
          edViaticoEstadia.Value     := FieldByName('pd_valor').AsFloat;
          edFechaViaticoEstadia.Date := FieldByName('pd_vigenciadesde').AsDateTime;
        end;
        if Locate('pd_idtipovalor', 4, []) then
        begin
          edViaticoGastoEnvio.Value     := FieldByName('pd_valor').AsFloat;
          edFechaViaticoGastoEnvio.Date := FieldByName('pd_vigenciadesde').AsDateTime;
          Delete;
        end;
        Next;
      end;
    finally;
      Free;
    end;
  end;

  edValorPres.Clear;
  edVigencia.Clear;
end;

procedure TfrmManPrestador.CheckBaja;
begin
  if not sdqTipoPrestador.FieldByName('TP_FBAJA').IsNull then
  begin
    MsgBox('La prestación ha sido dada de baja el ' + sdqTipoPrestador.FieldByName('TP_FBAJA').AsString);
    cmbTipoPrestador.FieldValue := '';
    CheckVisible;
  end;
  cmbTipoPrestador.Font.Color := clWindowText;
end;

// Evalua si debe habilitar o deshabilitar la 3er. solapa (Datos Medicos): (LU)
procedure TfrmManPrestador.CheckDatosMedicos;
begin
  if cmbTipoPrestador.FieldValue <> '' then
    if ValorSqlEx('SELECT tp_datosmedicos' +
                   ' FROM mtp_tipoprestador' +
                  ' WHERE tp_codigo = :PRESTADOR', [cmbTipoPrestador.FieldValue]) = 'N' then
    begin
      tsDatosMed.Enabled := False;
      tbPoliza.Enabled := False;
      pnlPie.Caption := 'Este prestador NO requiere seguro de mala praxis   -   ';
    end
    else
    begin
      tsDatosMed.Enabled := Seguridad.Activar(tsDatosMed);
      tbPoliza.Enabled := Seguridad.Activar(tbPoliza);
      pnlPie.Caption := 'Este prestador SI requiere seguro de mala praxis   -   ';
    end;
end;

procedure TfrmManPrestador.CheckValoresAMP;
begin
  if fraPrestadorSel.IsSelected then
    if ExisteSQLEx('SELECT 1 FROM apr_prestadores WHERE pr_codigo = :id', [fraPrestadorSel.Value]) then
      tsValoresAMP.Enabled := Seguridad.Activar(tsValoresAMP)
    else
      tsValoresAMP.Enabled := False;

  tsValoresAMP.Enabled := True
end;

procedure TfrmManPrestador.CheckVisible;
var
  bHabilitar: Boolean;
begin
  bHabilitar := HabilitarVisible(cmbTipoPrestador.FieldValue);
  chkVisible.Enabled := bHabilitar;
  if not bHabilitar then
    chkVisible.Checked := False;
end;

procedure TfrmManPrestador.ClearDatosFormPanelEmpresa;
begin
  fraEmpresaEmp.Clear;
  edVigenciaDesdeEmp.Clear;
  edVigenciaHastaEmp.Clear;
  edObservacionesEmp.Clear;
end;

procedure TfrmManPrestador.DisableButtons;
begin
  tbAgregar.Enabled          := False;
  tbModificar.Enabled        := False;
  tbEliminar.Enabled         := False;
  tbLimpiar.Enabled          := False;
  tbImprimir.Enabled         := False;
  tbSalir2.Enabled            := False;
  tbCuentasBancarias.Enabled := False;
  tbAuditable.Enabled        := False;
  tbNoAuditable.Enabled      := False;
  tbRegiones.Enabled         := False;
  tbMediosTransporte.Enabled := False;
  tbObservLiquidaciones.Enabled := False;    // TK 29415
  tbConsultorio.Enabled      := False;
end;

procedure TfrmManPrestador.DoCargarExamen(bEsNuevo :Boolean);
begin
  BeginTrans(True);
  sdqValoresExamen.Close;
  if bEsNuevo then
  begin
    edDescPreocup.Clear;
    dcVigDesdePreocup.Clear;
    dcVigHastaPreocup.Clear;
    edValorExamen.Clear;
  end
  else begin
    sdqValoresExamen.ParamByName('idexamen').AsInteger := sdqExamenes.FieldByName('ep_id').AsInteger;
    sdqValoresExamen.Open;
    edDescPreocup.Text      := sdqExamenes.FieldByName('ep_descripcion').AsString;
    dcVigDesdePreocup.Date  := sdqExamenes.FieldByName('ep_vigenciadesde').AsDateTime;
    dcVigHastaPreocup.Date  := sdqExamenes.FieldByName('ep_vigenciahasta').AsDateTime;
    edValorExamen.Value     := sdqExamenes.FieldByName('valor').AsFloat;
  end;
  AccionExa := IIF(bEsNuevo, Alta, Edicion);
end;

procedure TfrmManPrestador.DoLimpiarPresup;
begin
  fraNomencladorPresup.Limpiar;
  dcDesdePresup.Clear;
  dcHastaPresup.Clear;
  edCantidadPresup.Clear;
  edValorPresup.Clear;
  edSiniestroPresup.Clear;
  edTrabajadorPresup.Clear;
end;

function TfrmManPrestador.Do_SetearAuditable(EsAuditable: Boolean; Identificador: TTableId): Boolean;
var
  sSql: String;
begin
  try
    sSql := 'UPDATE cpr_prestador' +
              ' SET ca_auditable = ' + SqlValue(String(IIF(EsAuditable, 'S', 'N'))) + ',' +
                  ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' ca_fechamodif = ACTUALDATE' +
            ' WHERE ca_identificador = ' + SqlValue(Identificador);
    EjecutarSql(sSql);
    chkAuditable.Checked := EsAuditable;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmManPrestador.EnableButtons;
begin
  tbAgregar.Enabled  := Seguridad.Activar(tbAgregar);
  tbLimpiar.Enabled  := Seguridad.Activar(tbLimpiar);
  tbImprimir.Enabled := Seguridad.Activar(tbImprimir);
  tbSalir2.Enabled    := Seguridad.Activar(tbSalir2);

  if edIdentif.Text <> '' then
  begin
    tbModificar.Enabled        := Seguridad.Activar(tbModificar);
    tbEliminar.Enabled         := Seguridad.Activar(tbEliminar) and sdqDatosCA_FECHABAJA.IsNull;
    tbImprimir.Enabled         := Seguridad.Activar(tbImprimir);
    tbCuentasBancarias.Enabled := Seguridad.Activar(tbCuentasBancarias);
    tbAuditable.Enabled        := Seguridad.Activar(tbAuditable);
    tbNoAuditable.Enabled      := Seguridad.Activar(tbNoAuditable);
    tbRegiones.Enabled         := Seguridad.Activar(tbRegiones);
    tbMediosTransporte.Enabled := Seguridad.Activar(tbMediosTransporte);
    tbObservLiquidaciones.Enabled := Seguridad.Activar(tbObservLiquidaciones);  // TK 29415
    tbConsultorio.Enabled      := Seguridad.Activar(tbConsultorio);       // TK 48426
  end;
end;

function TfrmManPrestador.ExisteCuitSecuenciaActivo :Boolean;
begin
//CAMARILLO - 05/05/2006 - solamente deja reactivar un prestador si no existe
//                         otro activo con el mismo cuit y secuencia
  if ExisteSql('SELECT 1' +
                ' FROM cpr_prestador' +
               ' WHERE ca_clave = ''' + fraPrestadorSel.Cuit + '''' +
                 ' AND ca_secuencia = ' + SqlValue(fraPrestadorSel.Secuencia) +
                 ' AND ca_fechabaja IS NULL') then
  begin
    Result := True;
    MsgBox('Ya existe una empresa activa con el CUIT y la Secuencia seleccionados.', MB_ICONEXCLAMATION);
  end
  else
    Result := False;
end;

function TfrmManPrestador.GetTextoLote :String;
const
  MAIL = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}{\f1\fswiss\fcharset0 Arial;}}{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\b\f0\fs20 Provincia ART\b0\f1\par}' + #13 + #13 +             // TK 26176
         'Informamos a ustedes que se ha autorizado examen preocupacional para la empresa %s, ' +
         'establecimiento %s cuyo detalle es el siguiente: ' + #13 +
         'Número de lote: %s.' + #13 + 'Cantidad de personas: %s ' + #13 +
         '%s' + #13 +
         'Estudios incluidos: ' + #13 + '%s ' + #13 +
         'Los estudios deben ser remitidos a: Provincia ART, Carlos Pellegrini 91 5º piso, ' +   // se cambio 2do piso por 5to piso por ticket 26176
         'o a la delegación mas cercana a su domicilio. ' + #13 + #13 +
         'Sin mas, saluda y agradece atte. ';

var
  sEstudios :String;
  sPersonas :String;
begin
  with sdqValoresExamen do
  begin
    Close;
    ParamByName('idexamen').AsInteger := sdqExamenes.FieldByName('ep_id').AsInteger;
    Open;
    First;
    while not Eof do
    begin
      sEstudios := sEstudios + '- ' + FieldByName('es_codigo').AsString +
                               '- ' + FieldByName('es_descripcion').AsString + #13;
      Next;
    end;
    Close;
  end;

  with sdqPersonasLote do
  begin
    Close;
    ParamByName('idlote').AsInteger := sdqDetalleExamen.FieldByName('le_id').AsInteger;
    Open;
    First;
    while not Eof do
    begin
      sPersonas := sPersonas + ' - ' + FieldByName('pl_nombre').AsString  +
                               ' DNI: ' + FieldByName('pl_dni').AsString +
                               iif(FieldByName('pl_puesto').AsString = '', '', ' - Puesto: ' + FieldByName('pl_puesto').AsString) +
                               iif(FieldByName('pl_mail').AsString = '', '', ' - Mail: ' + FieldByName('pl_mail').AsString) + #13;
      Next;
    end;
    //if sPersonas <> '' then
      //sPersonas := Copy(sPersonas, 4, Length(sPersonas));
    Close;
  end;

  Result := Format(MAIL, [sdqDetalleExamen.FieldByName('em_nombre').AsString,
                          sdqDetalleExamen.FieldByName('es_nroestableci').AsString +
                          ' (' + sdqDetalleExamen.FieldByName('es_nombre').AsString + ')',
                          sdqDetalleExamen.FieldByName('le_id').AsString,
                          sdqDetalleExamen.FieldByName('le_cantidad').AsString,
                          sPersonas, sEstudios]);
end;

function TfrmManPrestador.GetValorPrestador(iPrestador, iNomenclador: Integer; dVigencia: TDateTime): Integer;
var
  sSql: String;
begin
  sSql := 'SELECT vp_id' +
           ' FROM svp_valorprestador' +
          ' WHERE vp_prestador = ' + SqlInt(iPrestador) +
            ' AND vp_idnomenclador = ' + SqlInt(iNomenclador) +
            ' AND vp_vigenciadesde = ' + SqlDate(dVigencia) +
            ' AND vp_fechabaja IS NULL ';
  Result := ValorSqlInteger(sSql);
end;

function TfrmManPrestador.HabilitarVisible(Especialidad: String): Boolean;
var
  bHabilitar: Boolean;
  sSql: String;
begin
  if Especialidad = '' then
    bHabilitar := False
  else
  begin
    sSql := 'SELECT 1' +
             ' FROM mtp_tipoprestador' +
            ' WHERE tp_codigo = ' + SqlValue(Especialidad) +
              ' AND tp_visible = ''S''';
    bHabilitar := ExisteSql(sSql);
  end;
  Result := bHabilitar
end;

procedure TfrmManPrestador.ImpresionGrilla(QueryPrint: TQueryPrint);
begin
  if PrintDialog.Execute then
  begin
    QueryPrint.SubTitle.Text := IntToStr(fraPrestadorSel.IDPrestador) + ' - ' + fraPrestadorSel.RazonSocial;
    QueryPrint.Footer.Text   := Sesion.Usuario;
    QueryPrint.Print;
  end;
end;

function TfrmManPrestador.IsDatosValidosEmpresa(ModoFormEmp: TFuncionShowForm): Boolean;
var
  sSql: String;
begin
  case ModoForm of
    fsAgregar:
    begin
      Verificar(fraEmpresaEmp.IsEmpty, fraEmpresaEmp.mskCUIT, 'Debe ingresar la empresa.');
      Verificar(edVigenciaDesdeEmp.IsEmpty, edVigenciaDesdeEmp, 'Debe ingresar la vigencia desde.');

      // validaciones para que no se solapen los rangos de vigencia
      sSql := 'SELECT 1' +
               ' FROM mpe_prestadorempresa' +
              ' WHERE pe_prestador = ' + SqlValue(edIdentif.Value) +
                ' AND pe_cuit = ' + SqlValue(fraEmpresaEmp.CUIT) +
                ' AND pe_vigenciahasta = ' + SqlValue(edVigenciaDesdeEmp.Date);
      Verificar(ExisteSql(sSql), edValNomVigDesde, 'El valor ingresado en la vigencia desde de la empresa coincide con una fecha de cierre, por favor, modifíquelo en al menos un día y reintente.');

      sSql := 'SELECT 1' +
               ' FROM mpe_prestadorempresa' +
              ' WHERE pe_prestador = ' + SqlValue(edIdentif.Value) +
                ' AND pe_cuit = ' + SqlValue(fraEmpresaEmp.CUIT) +
                ' AND ' + SqlValue(edVigenciaDesdeEmp.Date) + ' BETWEEN pe_vigenciadesde AND pe_vigenciahasta';
      Verificar(ExisteSql(sSql), edValNomVigDesde, 'El valor ingresado en la vigencia desde de la empresa se solapa con un período existente.');
    end;

    fsEliminar:   Verificar(edVigenciaHastaEmp.IsEmpty, edVigenciaHastaEmp, 'Debe ingresar la vigencia hasta.');
  end;

  Result := True;
end;

function TfrmManPrestador.IsRegistroSeleccionadoEmpresaValido: Boolean;
begin
  Verificar(not sdqEmpresas.Active or (sdqEmpresas.RecordCount = 0), dbgEmpresas, 'No hay empresas en la grilla.');
  Verificar(not sdqEmpresas.FieldByName('FECHABAJA').IsNull, dbgEmpresas, 'La empresa se encuentra dada de baja.');
  Result := True;
end;

procedure TfrmManPrestador.Limpiar_fpABMVUMed;
begin
  fraUnidad.Clear;
  VigDdeVUM.Clear;
  VigHtaVUM.Clear;
  edNomValorVUM.Value := 0;
end;

procedure TfrmManPrestador.LoadDatosFormPanelEmpresa;
begin
  fraEmpresaEmp.CUIT      := sdqEmpresas.FieldByName('CUIT').AsString;
  edVigenciaDesdeEmp.Date := sdqEmpresas.FieldByName('V_DESDE').AsDateTime;
  edVigenciaHastaEmp.Date := sdqEmpresas.FieldByName('V_HASTA').AsDateTime;
  edObservacionesEmp.Text := sdqEmpresas.FieldByName('OBSERVACIONES').AsString;
end;

procedure TfrmManPrestador.LockControls(Valor, PK: Boolean);
var
  bDatosContables: Boolean;
  TmpColor: TColor;
begin
  edRSocial.ReadOnly              := Valor;
  edNFantasia.ReadOnly            := Valor;
  edPrestMutual.ReadOnly          := Valor;
  edRanking.ReadOnly              := Valor;
  chkCargaValores.Enabled         := not(Valor) and Seguridad.Claves.IsActive('ModificarCargaValores');
  //chkHabilitado.Enabled           := not(Valor);     //pasado a solapa "legajo"
  chkReferente.Enabled            := not(Valor) and Seguridad.Activar(chkReferente);
  chkVisadoDocum.Enabled          := not(Valor) and Seguridad.Activar(chkVisadoDocum);
  chkCEM.Enabled                  := not(Valor);
  //chkRespCivil.Enabled            := not(Valor);     // pasado a solapa "legajo"
  //cmbFechaRespCivil.Enabled       := not(Valor);     // pasado a solapa "legajo"
  //cmbFechaVtoHabilitacion.Enabled := not(Valor);     // pasado a solapa "legajo"
  edAsistencial.ReadOnly          := Valor;

  fraCartillaWeb.cmbDescripcion.ReadOnly  := Valor;
  VclExtra.LockControls(fraDireccionPrest, Valor);

  fraDireccionLegal.sdqLocalidad.Close;
  fraDireccionLegal.edCPostal.ReadOnly    := Valor;
  fraDireccionLegal.cmbLocalidad.ReadOnly := Valor;
  fraDireccionLegal.cmbCalle.ReadOnly     := Valor;
  fraDireccionLegal.edNumero.ReadOnly     := Valor;
  fraDireccionLegal.edPiso.ReadOnly       := Valor;
  fraDireccionLegal.edDto.ReadOnly        := Valor;
  fraDireccionCom.sdqLocalidad.Close;
  fraDireccionCom.edCPostal.ReadOnly    := Valor;
  fraDireccionCom.cmbLocalidad.ReadOnly := Valor;
  fraDireccionCom.cmbCalle.ReadOnly     := Valor;
  fraDireccionCom.edNumero.ReadOnly     := Valor;
  fraDireccionCom.edPiso.ReadOnly       := Valor;
  fraDireccionCom.edDto.ReadOnly        := Valor;

  VclExtra.LockControls(fraUsuariosContrata, Valor);

  VclExtra.LockControls(fraMotivoBaja, true);

  edTelCaract.ReadOnly      := Valor;
  edTelNumero.ReadOnly      := Valor;
  edCelular.ReadOnly        := Valor;
  edFax.ReadOnly            := Valor;
  edBonificacion.ReadOnly   := Valor;

  cmbCaracter.ReadOnly      := Valor;
  cmbTipoPrestador.ReadOnly := Valor;

  edEMail.ReadOnly          := Valor;
  edMailDebitos.ReadOnly    := Valor;
  edMailAdmin.ReadOnly      := Valor;
  edResponsable.ReadOnly    := Valor;
  edObservaciones.ReadOnly  := Valor;
  edHabilitaciones.ReadOnly := Valor;
  edDiasVenci.ReadOnly      := Valor;

  bDatosContables := Seguridad.Claves.IsActive('DatosContables');

  //datos contables
  dcFechaRevision.ReadOnly      := Valor or not(bDatosContables);
  dcVtoGanancias.ReadOnly       := Valor or not(bDatosContables);
  dcVtoIngBrutos.ReadOnly       := Valor or not(bDatosContables);
  cmbTipoComprobante.ReadOnly   := Valor or not(bDatosContables);
  cmbIngBrutConcepto.ReadOnly   := Valor or not(bDatosContables);
  edCA_ACTIVIDAD.ReadOnly       := Valor or not(bDatosContables);
  mskIngBrutosNro.ReadOnly      := Valor or not(bDatosContables);
  cmbRetDeGanacias.ReadOnly     := Valor or not(bDatosContables);
  cmbIVA.ReadOnly               := Valor or not(bDatosContables);
  edMatricula.ReadOnly          := Valor or not(bDatosContables);
  mObsContables.ReadOnly        := Valor or not(bDatosContables);
  chkFactura.Enabled            := not(Valor) and bDatosContables;
  chkIngBrutos.Enabled          := not(Valor) and bDatosContables;
  chkRetCajaMedico.Enabled      := not(Valor) and bDatosContables;
  chkIVADiscr.Enabled           := not(Valor) and bDatosContables;
  tbIngresoBrutos.Enabled       := not(Valor) and bDatosContables;
  chkFdoTierradelFuego.Enabled  := not(Valor) and bDatosContables and (fraDireccionLegal.Provincia = cPROV_TIERRADELFUEGO) ;  // TK 62879
  vclextra.LockControls([edIBDescripcion, edIBObservaciones]);


  chkCronicos.Enabled           := not Valor;
  chkResonancia.Enabled         := not Valor;
  chkAmbulancia.Enabled         := not Valor;
  chkTAC.Enabled                := not Valor;
  chkElectromiograma.Enabled    := not Valor;
  chkRX.Enabled                 := not Valor;
  chkFKT.Enabled                := not Valor;
  chkFactAnestesia.Enabled      := not Valor;
  chkEcografia.Enabled          := not Valor;

  chkGuardiaAct.Enabled         := not Valor;
  chkGuardiaPas.Enabled         := not Valor;
  edPiso.ReadOnly               := Valor;
  edTIUnidCor.ReadOnly          := Valor;
  edAislamTI.ReadOnly           := Valor;
  edTI.ReadOnly                 := Valor;
  edQuirofano.ReadOnly          := Valor;
  edGuardia.ReadOnly            := Valor;
  edSRayos.ReadOnly             := Valor;
  edConsExt.ReadOnly            := Valor;
  EdMatProfesional.ReadOnly     := Valor;
  edDesdeAct.ReadOnly           := Valor or not(chkGuardiaAct.Checked);
  edHastaAct.ReadOnly           := Valor or not(chkGuardiaAct.Checked);
  edDesdePas.ReadOnly           := Valor or not(chkGuardiaPas.Checked);
  edHastaPas.ReadOnly           := Valor or not(chkGuardiaPas.Checked);
  rbMatNacional.Enabled         := not Valor;
  rbMatProvincial.Enabled       := not Valor;

 // CoolBarEsp.Enabled            := not Valor;
  tbAgregarEsp.Enabled          := not Valor;         // por ticket 48522
  tbModificarEsp.Enabled        := not Valor;
  tbEliminarEsp.Enabled         := not Valor;
  tbOrdenarEsp.Enabled          := not Valor;
  tbExportarEsp.Enabled         := not Valor;
  tbImprimirEsp.Enabled         := not Valor;

  chkContratoART.Enabled        := not Valor;
  chkContratoMutualVig.Enabled  := not Valor;
  chkVisible.Enabled            := not Valor and HabilitarVisible(cmbTipoPrestador.FieldValue);
  edFImprFormInscripc.ReadOnly  := Valor;

  edPlazoDebitos.ReadOnly       := Valor;
  edLimite.ReadOnly             := Valor;
  chkAuditable.Enabled          := not Valor;
  btnCancelar.Enabled           := not Valor;
  btnGuardar.Enabled            := not Valor;

  if Valor then
    TmpColor := clBtnFace
  else
    TmpColor := clWindow;

  edRSocial.Color                      := TmpColor;
  edNFantasia.Color                    := TmpColor;
  edPrestMutual.Color                  := TmpColor;
  edRanking.Color                      := TmpColor;
  edAsistencial.Color                  := TmpColor;

  fraCartillaWeb.edCodigo.Color        := TmpColor;
  fraCartillaWeb.cmbDescripcion.Color  := TmpColor;

  edDomicilio.Color                    := TmpColor;
  fraDireccionLegal.edCPostal.Color    := TmpColor;
  fraDireccionLegal.cmbLocalidad.Color := TmpColor;
  fraDireccionLegal.cmbCalle.Color     := TmpColor;
  fraDireccionLegal.edNumero.Color     := TmpColor;
  fraDireccionLegal.edPiso.Color       := TmpColor;
  fraDireccionLegal.edDto.Color        := TmpColor;

  fraDireccionCom.edCPostal.Color    := TmpColor;
  fraDireccionCom.cmbLocalidad.Color := TmpColor;
  fraDireccionCom.cmbCalle.Color     := TmpColor;
  fraDireccionCom.edNumero.Color     := TmpColor;
  fraDireccionCom.edPiso.Color       := TmpColor;
  fraDireccionCom.edDto.Color        := TmpColor;

  edTelCaract.Color                    := TmpColor;
  edTelNumero.Color                    := TmpColor;
  edCelular.Color                      := TmpColor;
  edFax.Color                          := TmpColor;
  edBonificacion.Color                 := TmpColor;
  edDiasVenci.Color                    := TmpColor;

  //datos contables
  if (not(Valor) and bDatosContables) or Valor then
  begin
    dcFechaRevision.Color    := TmpColor;
    dcVtoGanancias.Color     := TmpColor;
    dcVtoIngBrutos.Color     := TmpColor;
    cmbTipoComprobante.Color := TmpColor;
    cmbIngBrutConcepto.Color := TmpColor;
    edCA_ACTIVIDAD.Color     := TmpColor;
    mskIngBrutosNro.Color    := TmpColor;
    cmbRetDeGanacias.Color   := TmpColor;
    cmbIVA.Color             := TmpColor;
    edMatricula.Color        := TmpColor;
    mObsContables.Color      := TmpColor;
  end;

  cmbCaracter.Color                    := TmpColor;
  cmbTipoPrestador.Color               := TmpColor;
  edEMail.Color                        := TmpColor;
  edMailDebitos.Color                  := TmpColor;
  edMailAdmin.Color                    := TmpColor;
  edResponsable.Color                  := TmpColor;
  edObservaciones.Color                := TmpColor;
  edHabilitaciones.Color               := TmpColor;
  edPiso.Color                         := TmpColor;
  edTIUnidCor.Color                    := TmpColor;
  edAislamTI.Color                     := TmpColor;
  edTI.Color                           := TmpColor;
  edQuirofano.Color                    := TmpColor;
  edGuardia.Color                      := TmpColor;
  edSRayos.Color                       := TmpColor;
  edConsExt.Color                      := TmpColor;
  EdMatProfesional.Color               := TmpColor;
  edDesdeAct.Color                     := TmpColor;
  edHastaAct.Color                     := TmpColor;
  edDesdePas.Color                     := TmpColor;
  edHastaPas.Color                     := TmpColor;
  dbgGrillaEsp.Color                   := TmpColor;
  edPlazoDebitos.Color                 := TmpColor;
  edLimite.Color                       := TmpColor;
  dbgValNomenclador.Color              := TmpColor;
  dbgEmpresas.Color                    := TmpColor;
  dbgSiniestros.Color                  := TmpColor;   // TK 8638
  dbgValoresConvenio.Color             := TmpColor;
  edFImprFormInscripc.Color            := TmpColor;
  dbgContratos.Color                   := TmpColor;
  dBGVUM.Color                         := TmpColor;
  grdAMP.Color                         := TmpColor;
  dgExamenes.Color                     := TmpColor;
  dgExamenesDetalle.Color              := TmpColor; 
  GridPresupuestosDetalle.Color        := TmpColor;
  grdCPostales.Color                   := TmpColor;
  //cmbFechaRespCivil.Color              := TmpColor;
  //cmbFechaVtoHabilitacion.Color        := TmpColor;
  dgSucursales.Color                   := TmpColor;

  // ---- La Primary Key ----------
  if PK then
    TmpColor := clBtnFace
  else
    TmpColor := clWindow;

  mskCUIT.ReadOnly     := PK;
  mskCUIT.Color        := TmpColor;
  {saqué "edSecuencia.ReadOnly := PK;" y "edSecuencia.Color := TmpColor;". Porque edSecuencia va a ser un valor no modificable para el usuario. By Lu.}

  //Cuando Lockea la PK es porque es es una Modificacion;
  tbAgregarEsp.Enabled   := (Accion = Edicion) and Seguridad.Activar(tbAgregarEsp);
  tbModificarEsp.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarEsp);
  tbEliminarEsp.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbEliminarEsp);

  tbAgregarNom.Enabled          := (Accion = Edicion) and Seguridad.Activar(tbAgregarNom);
  tbEliminarNom.Enabled         := (Accion = Edicion) and Seguridad.Activar(tbEliminarNom);
  tbIncluirNomenc.Enabled       := (Accion = Edicion) and Seguridad.Activar(tbIncluirNomenc);
  tbReplicarNom.Enabled         := (Accion = Edicion) and Seguridad.Activar(tbReplicarNom);
  tbAgregarPresup.Enabled       := (Accion = Edicion) and Seguridad.Activar(tbAgregarPresup);
//  tbPracticasPrestador.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbPracticasPrestador);         // Comentado por tk 60813

  tbAgregarUMed.Enabled   := (Accion = Edicion) and Seguridad.Activar(tbAgregarUMed);
  tbEliminarUMed.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbEliminarUMed);
  tbReplicarUMed.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbReplicarUMed);
  //vclextra.LockControls([VigHtaFiltroVUM, VigDdeFiltroVUM], not ((Accion = Edicion) or (Accion = Alta)));
  //vclextra.LockControls([VigHtaFiltroVM, VigDdeFiltroVM], not ((Accion = Edicion) or (Accion = Alta)));

  tbModificarValoresAMP.Enabled     := (Accion = Edicion) and Seguridad.Activar(tbModificarValoresAMP);
  tbBajaPresupuesto.Enabled         := (Accion = Edicion) and Seguridad.Activar(tbBajaPresupuesto);
  tbEliminarConv.Enabled            := (Accion = Edicion) and Seguridad.Activar(tbEliminarConv);
  tbAgregarPresupuestoAMP.Enabled   := (Accion = Edicion) and Seguridad.Activar(tbAgregarPresupuestoAMP);
  tbModificarPresupuestoAMP.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarPresupuestoAMP);

  tbAgregarPreocup.Enabled          := (Accion = Edicion) and Seguridad.Activar(tbAgregarPreocup);
  tbModificarPreocup.Enabled        := (Accion = Edicion) and Seguridad.Activar(tbModificarPreocup);
  tbBajaPreocup.Enabled             := (Accion = Edicion) and Seguridad.Activar(tbBajaPreocup);
  tbAltaEmpresaPreocup.Enabled      := (Accion = Edicion) and Seguridad.Activar(tbAltaEmpresaPreocup);
  tbBajaEmpresaPreocup.Enabled      := (Accion = Edicion) and Seguridad.Activar(tbBajaEmpresaPreocup);
  tbAutorizarPreocup.Enabled        := (Accion = Edicion) and Seguridad.Activar(tbAutorizarPreocup);
  tbPersonasLote.Enabled            := (Accion = Edicion) and Seguridad.Activar(tbPersonasLote);

  tbAgregarEmpresa.Enabled   := (Accion = Edicion) and Seguridad.Activar(tbAgregarEmpresa);
  tbModificarEmpresa.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarEmpresa);
  tbEliminarEmpresa.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbEliminarEmpresa);

  tbAgregarContrato.Enabled   := (Accion = Edicion) and Seguridad.Activar(tbAgregarContrato);
  tbModificarContrato.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarContrato);
  tbEliminarContrato.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbEliminarContrato);

  tbModificarCP.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarContrato);
  tbEliminarCP.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbEliminarContrato);

  tbAgregarSiniestro.Enabled   := (Accion = Edicion) and Seguridad.Activar(tbAgregarSiniestro);      // TK 8638
  tbModificarSiniestro.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarSiniestro);
  tbEliminarSiniestro.Enabled  := (Accion = Edicion) and Seguridad.Activar(tbEliminarSiniestro);

  tbAgregarSuc.Enabled := (Accion = Edicion) and Seguridad.Activar(tbAgregarSuc);
  tbEliminarSuc.Enabled := (Accion = Edicion) and Seguridad.Activar(tbEliminarSuc);
  tbModificarSuc.Enabled := (Accion = Edicion) and Seguridad.Activar(tbModificarSuc);


  VCLExtra.LockControls(gbPrestador, not Valor);
  cmbPresupuestoChange(nil);
  chkhabilitadoABMClick(nil);
  chkRespCivilABMClick(nil);

  if valor = false then
    fraUsuariosContrata.ShowBajas:=false;
    //fraUsuariosContrata.ExtraCondition := fraUsuariosContrata.ExtraCondition + ' AND SE_FECHABAJA IS NULL'

end;

procedure TfrmManPrestador.LockPresupControls(Valor: Boolean);
begin
  fraNomencladorPresup.Enabled    := Valor;
  dcDesdePresup.Enabled           := Valor;
  edSiniestroPresup.Enabled       := Valor;
  edCantidadPresup.Enabled        := Valor;
  edValorPresup.Enabled           := Valor;
  fpABMPresupuesto.Caption        := IIF(Valor, 'Agregar Presupuesto', 'Quitar Presupuesto');
end;

procedure TfrmManPrestador.LockValContControls(Valor: Boolean);
var ssql: string;
begin
  ssql := ' SELECT tp_renovautomatica, tp_dni, tp_estatuto, tp_acta, tp_cv, tp_matricula, tp_titulo, tp_habilitacion, ' +
          '        tp_complejidad, tp_cartacompromiso, tp_respcivil ' +
          '   FROM mtp_tipoprestador ' +
          '  WHERE tp_codigo = :cod ';

  with GetQueryEx(ssql, [cmbTipoPrestador.FieldValue]) do
  begin
    {fraTipoContratoABM.Enabled    := Valor;
    edVigDesdeABM.Enabled         := Valor;
    edVigHastaABM.Enabled         := Valor;
    chkMedExtraABM.Enabled        := Valor;
    chkSumaModulosABM.Enabled     := Valor; }
    chkContratoSocialABM.Enabled  := fieldbyname('tp_estatuto').AsString = 'S';
    chkCVABM.Enabled              := fieldbyname('tp_cv').AsString = 'S';
    chkTituloABM.Enabled          := fieldbyname('tp_titulo').AsString = 'S';
    chkMatriculaABM.Enabled       := fieldbyname('tp_matricula').AsString = 'S';
    chkActaAutoridadesABM.Enabled := fieldbyname('tp_acta').AsString = 'S';
    chkRenovAutomABM.Enabled      := fieldbyname('tp_renovautomatica').AsString = 'S';
    chkDocumentoABM.Enabled       := fieldbyname('tp_dni').AsString = 'S';
    chkhabilitadoABM.Enabled      := fieldbyname('tp_habilitacion').AsString = 'S';
    chkComplejidadABM.Enabled     := fieldbyname('tp_complejidad').AsString = 'S';
    chkCartaCompromisoABM.Enabled := fieldbyname('tp_cartacompromiso').AsString = 'S';
    chkRespCivilABM.Enabled       := fieldbyname('tp_respcivil').AsString = 'S';

    {edFactDesdeABM.Enabled        := Valor;
    edFactHastaABM.Enabled        := Valor;
    edPLazoRefacABM.Enabled       := Valor;
    edObservABM.Enabled           := Valor;}
  end;
end;

procedure TfrmManPrestador.LockValNomControls(Valor: Boolean);
begin
  fraNomencladorABM.Enabled      := Valor;
  edValNomVigDesde.Enabled       := Valor;
  edValNomVigHasta.Enabled       := not Valor;
  rbNomMultiplicador.Enabled     := Valor;
  rbNomValor.Enabled             := Valor;
  rbNomOtros.Enabled             := Valor;
  edNomMultiplicador.Enabled     := Valor;
  chkanestesia.enabled           := Valor;
  chkHIV.enabled                 := Valor;
  chkantitetanica.enabled        := Valor;
  edQSesiones.enabled            := Valor;
  edMultiplicadorGs.enabled      := Valor;
  edNomValor.Enabled             := Valor;
  edNomGastos.Enabled            := Valor;
  edNomHonorarios.Enabled        := Valor;
  edVP_MONTO_MINIMO.Enabled      := Valor;
  edVP_SUMA_FIJA.Enabled         := Valor;
  edVP_KM_INCLUIDOS.Enabled      := Valor;
  chkVP_DEFAULT.Enabled          := Valor;
  edVP_VIAJE_EXCLUSIVO.Enabled   := Valor;
  edVP_VIAJE_NOCTURNO.Enabled    := Valor;
  edVP_VIAJE_FINDESEMANA.Enabled := Valor;
  chkVP_ABONA_RETORNO.Enabled    := Valor;
  chkValorDeAMP.Enabled          := Valor;
  chkUnicaLiquidacion.Enabled    := Valor;   // TK 32945
end;

procedure TfrmManPrestador.LockVUMControls(Valor: Boolean);
begin
  fraunidad.Enabled     := Valor;
  VigDdeVUM.Enabled     := Valor;
  edNomValorVUM.Enabled := Valor;
end;

procedure TfrmManPrestador.OnEmpresaExamenChange(Sender: TObject);
begin
  fraEstabExamen.Contrato := fraEmpresaExamen.Contrato;
end;

procedure TfrmManPrestador.OnEmpresaPresupuestoAMPChange(Sender: TObject);
begin
  fraPP_IDESTABLECIMIENTO.Contrato := fraEmpresaPresupuestoAMP.Contrato;
end;

procedure TfrmManPrestador.OnEstablecimientoAMPChange(Sender: TObject);
begin
  with sdqSolicitudPresupuesto do
  begin
    Close;
    ParamByName('pidprestador').Value := fraPrestadorSel.IDPrestador;
    ParamByName('pidestableci').Value := fraPP_IDESTABLECIMIENTO.ID;
    ParamByName('pcontrato').Value    := fraEmpresaPresupuestoAMP.Contrato;
    Open;
  end
end;

procedure TfrmManPrestador.OnNomencladorChange(Sender: TObject);
var
  sFecha, Sql_svp, Sql: String;
begin
  Sql := 'SELECT MAX(vp_vigenciadesde)' +
          ' FROM svp_valorprestador' +
         ' WHERE vp_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
           ' AND vp_idnomenclador = ' + SqlInt(fraNomencladorABM.IdNomenclador) +
           ' AND vp_fechabaja IS NULL ';
  sFecha := ValorSql(Sql);
  if sFecha <> '' then
    edValNomVigDesde.MinDate := StrToDate(sFecha);

  Sql_svp := 'SELECT vp_valorDeAMP, vp_unicaliquidacion ' +
              ' FROM svp_valorprestador' +
             ' WHERE vp_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
               ' AND vp_idnomenclador = ' + SqlInt(fraNomencladorABM.IdNomenclador) +
               ' AND vp_fechabaja IS NULL ';

  with GetQuery(Sql_svp) do
  try
    chkValorDeAMP.Checked       := IIF((FieldByName('VP_VALORDEAMP').AsString = 'S'), true, false);
    chkUnicaLiquidacion.Checked := IIF((FieldByName('VP_UNICALIQUIDACION').AsString = 'S'), true, false);
  finally
    Free;
  end;

  chkanestesia.Checked    := fraNomencladorABM.sdqDatos.FieldByName('ON_ANESTESIA').AsString = 'S';
  chkHIV.Checked          := fraNomencladorABM.sdqDatos.FieldByName('ON_HIV').AsString = 'S';
  chkantitetanica.Checked := fraNomencladorABM.sdqDatos.FieldByName('ON_ANTITETANICA').AsString = 'S';
  edQSesiones.Text        := fraNomencladorABM.sdqDatos.FieldByName('ON_SESIONES').AsString;

  // Módulo de Traslados
  VCLExtra.LockControls([edVP_MONTO_MINIMO, edVP_SUMA_FIJA, edVP_KM_INCLUIDOS,
                         edVP_VIAJE_EXCLUSIVO, edVP_VIAJE_NOCTURNO, edVP_VIAJE_FINDESEMANA,
                         chkVP_DEFAULT, chkVP_ABONA_RETORNO], fraNomencladorABM.Capitulo <> 'MT');
  VCLExtra.LockControls([chkHIV, chkAntitetanica, chkAnestesia], fraNomencladorABM.Capitulo = 'MT');

  if fraNomencladorABM.Capitulo <> 'MT' then
  begin
    edVP_MONTO_MINIMO.Clear;
    edVP_SUMA_FIJA.Clear;
    edVP_KM_INCLUIDOS.Clear;
    edVP_VIAJE_EXCLUSIVO.Clear;
    edVP_VIAJE_NOCTURNO.Clear;
    edVP_VIAJE_FINDESEMANA.Clear;
    chkVP_DEFAULT.Checked := False;
    chkVP_ABONA_RETORNO.Checked := False;
  end;
end;

procedure TfrmManPrestador.OnPrestadorChange(Sender: TObject);
var
  sSQL: String;
  estadoprest: integer;
begin
  estadoprest := rgEstadoPrest.ItemIndex;
  tbLimpiarClick(nil);
  rgEstadoPrest.ItemIndex := estadoprest;
  sdqDatos.Close;
  sdqDatos.ParamByName('pIdentif').AsInteger := fraPrestadorSel.IDPrestador;
  sdqDatos.Open;
  if not sdqDatos.Eof then
  begin
    tbModificar.Enabled          := Seguridad.Activar(tbModificar);
    tbEliminar.Enabled           := Seguridad.Activar(tbEliminar) and sdqDatosCA_FECHABAJA.IsNull;
    tbImprimir.Enabled           := Seguridad.Activar(tbImprimir);
    tbCuentasBancarias.Enabled   := Seguridad.Activar(tbCuentasBancarias);
    tbAuditable.Enabled          := Seguridad.Activar(tbAuditable);
    tbNoAuditable.Enabled        := Seguridad.Activar(tbNoAuditable);
    tbRegiones.Enabled           := Seguridad.Activar(tbRegiones);
    tbObservLiquidaciones.Enabled := Seguridad.Activar(tbObservLiquidaciones);
    tbConsultorio.Enabled        := Seguridad.Activar(tbConsultorio);  // TK 48426
    tbMediosTransporte.Enabled   := Seguridad.Activar(tbMediosTransporte);
    mskCUIT.Text                 := sdqDatosCA_CLAVE.AsString;
    edSecuencia.Value            := sdqDatosCA_SECUENCIA.AsInteger;
    edIdentif.Text               := sdqDatosCA_IDENTIFICADOR.AsString;
    edRSocial.Text               := sdqDatosCA_DESCRIPCION.AsString;
    edNFantasia.Text             := sdqDatosCA_NOMBREFANTA.AsString;
    edPrestMutual.Text           := sdqDatosCA_PRESTADORMUTUAL.AsString;
    edRanking.Text               := sdqDatosCA_RANKING.AsString;
    chkCargaValores.Checked      := (sdqDatosCA_CARGAVALORES.AsString = 'S');
    chkReferente.Checked         := (sdqDatosCA_REFERENTE.AsString = 'S');
    chkVisadoDocum.Checked       := (sdqDatosCA_VISADODOCUM.AsString = 'S');
    chkCEM.Checked               := (sdqDatosCA_CEM.AsString = 'S');
    chkRespCivil.Checked         := (sdqDatosCA_RESPCIVIL.AsString = 'S');
    //cmbFechaRespCivil.Date       := sdqDatosCA_FECHARESPCIVIL.AsDateTime;
    //cmbFechaVtoHabilitacion.Date := sdqDatosCA_FECHAVTOHABILITACION.AsDateTime;
    edDomicilio.Text             := sdqDatosCA_DOMICILIO.AsString;
    edMatricula.Text             := sdqDatosCA_MATRICULA.AsString;


    EdRegionSanitaria.Clear;
    fraDireccionPrest.Clear;

    fraDireccionPrest.Cargar(sdqDatosCA_CALLE.AsString, sdqDatosCA_CODPOSTAL.AsString, sdqDatosCA_LOCALIDAD.AsString,
                             sdqDatosCA_NUMERO.AsString, sdqDatosCA_PISOCALLE.AsString, sdqDatosCA_DEPARTAMENTO.AsString,
                             sdqDatosCA_PROVINCIA.AsString, sdqDatosCA_CODPOSTALA.AsString,
                             sdqDatosCA_LAT.AsFloat, sdqDatosCA_LNG.AsFloat);
    SetRegionSanitariaDom;
    fraDireccionLegal.Limpiar;
    fraDireccionLegal.edCPostal.Text    := sdqDatosCA_CODPOSTALLEGAL.AsString;
    fraDireccionLegal.cmbLocalidad.Text := sdqDatosCA_LOCALIDADLEGAL.AsString;
    fraDireccionLegal.cmbCalle.Text     := sdqDatosCA_CALLELEGAL.AsString;
    fraDireccionLegal.edNumero.Text     := sdqDatosCA_NUMEROLEGAL.AsString;
    fraDireccionLegal.edPiso.Text       := sdqDatosCA_PISOLEGAL.AsString;
    fraDireccionLegal.edDto.Text        := sdqDatosCA_DEPARTAMENTOLEGAL.AsString;

    fraDireccionCom.Limpiar;
    fraDireccionCom.edCPostal.Text    := sdqDatosCA_CODPOSTALCOMERCIAL.AsString;
    fraDireccionCom.cmbLocalidad.Text := sdqDatosCA_LOCALIDADCOMERCIAL.AsString;
    fraDireccionCom.cmbCalle.Text     := sdqDatosCA_CALLECOMERCIAL.AsString;
    fraDireccionCom.edNumero.Text     := sdqDatosCA_NUMEROCOMERCIAL.AsString;
    fraDireccionCom.edPiso.Text       := sdqDatosCA_PISOCOMERCIAL.AsString;
    fraDireccionCom.edDto.Text        := sdqDatosCA_DEPARTAMENTOCOMERCIAL.AsString;

    fraUsuariosContrata.ShowBajas:=true;
    fraUsuariosContrata.Codigo := sdqDatos.FieldByName('gp_codigo').AsString;

    fraMotivoBaja.Codigo := ValorSqlEx(' select mp_codigo ' +
                                       ' from SIN.smp_motivobajaprestador ' +
                                       ' where mp_id = :cod ' +
                                       ' and mp_fechabaja is null', [sdqDatosCA_IDMOTIVOBAJA.AsString]);

    if sdqDatosCA_PROVINCIALEGAL.IsNull then
      SetProvincia(-1)
    else
      SetProvincia(sdqDatosCA_PROVINCIALEGAL.AsInteger);

    if sdqDatosCA_PROVINCIACOMERCIAL.IsNull then
      fraDireccionCom.Provincia := -1
    else
      fraDireccionCom.Provincia := sdqDatosCA_PROVINCIACOMERCIAL.AsInteger;

    edTelNumero.Text              := sdqDatosCA_TELEFONO.AsString;
    edTelCaract.Text              := sdqDatosCA_CODAREA.asstring;
    edCelular.Text                := sdqDatosCA_CELULAR.asstring;
    edFax.Text                    := sdqDatosCA_FAX.AsString;
    edBonificacion.Value          := sdqDatosCA_BONIFICACION.AsCurrency;
    edAsistencial.Value           := sdqDatosCA_ASISTENCIAL.AsInteger;

    pcdatos.ActivePageIndex       := 1;
    chkRetCajaMedico.Checked      := sdqDatosCA_RETENCAJAMED.AsString = 'S';
    chkIVADiscr.Checked           := sdqDatosCA_IVADISCRIMINADO.AsString = 'S';
    chkFdoTierradelFuego.Checked  := sdqDatosCA_FDOTIERRADELFUEGO.AsString = 'S';   // TK 62879

    pcdatos.ActivePageIndex       := 0;
    dcFechaRevision.Date          := sdqDatosCA_FECHAREVISION.AsDateTime;
    dcVtoGanancias.Date           := sdqDatosCA_VTOEXCGANANCIAS.AsDateTime;
    dcVtoIngBrutos.Date           := sdqDatosCA_VTOEXCINGBRUTOS.AsDateTime;
    cmbRetDeGanacias.FieldValue   := sdqDatosCA_RETGANANCIAS.AsString;
    cmbIVA.FieldValue             := sdqDatosCA_IVA.AsString;
    mObsContables.Text            := AdjustLineBreaks(sdqDatosCA_OBSERVACIONESIMP.AsString);
    cmbTipoComprobante.FieldValue := sdqDatosCA_TIPOCOMPROBANTE.AsString;
    cmbCaracter.FieldValue        := sdqDatosCA_TIPO.AsString;
    cmbTipoPrestador.FieldValue   := sdqDatosCA_ESPECIALIDAD.AsString;
    if sdqTipoPrestador.FieldByName('TP_FBAJA').IsNull then
      cmbTipoPrestador.Font.Color := clWindowText
    else
      cmbTipoPrestador.Font.Color := clRed;

    // Evalua si debe habilitar o deshabilitar la 3er. solapa (Datos Medicos): (LU)
    CheckDatosMedicos;
    CheckValoresAMP;
    edObservaciones.Text          := sdqDatosCA_OBSERVACIONES.AsString;
    edHabilitaciones.Text         := sdqDatosCA_HABILITACIONES.AsString;
    chkFactura.Checked            := sdqDatosCA_CONCERTADO.AsString = 'S';
    edEMail.Text                  := sdqDatosCA_DIRELECTRONICA.AsString;
    edMailDebitos.Text            := sdqDatosCA_maildebitos.AsString;
    edMailAdmin.Text              := sdqDatosca_mailadministracion.AsString;
    edResponsable.Text            := sdqDatosCA_RESPONSABLE.AsString;
    chkIngBrutos.Checked          := sdqDatosCA_RETIENEINGBRUTOS.AsString = 'S';
    chkIngBrutosClick(nil);
    if chkIngBrutos.Checked then
    begin
      if (sdqDatosCA_RETINGRESOSBRUTOS.AsString = 'CUIT') then
        SetTipoIngBrutos(False)
      else
      begin
        SetTipoIngBrutos(True);
        mskIngBrutosNro.Text := sdqDatosCA_RETINGRESOSBRUTOS.AsString;
      end;
      cmbIngBrutConcepto.FieldValue := sdqDatosCA_INGRESOSBRUTOS.AsString;
      edCA_ACTIVIDAD.Value := sdqDatosCA_ACTIVIDAD.AsInteger;
      if edCA_ACTIVIDAD.Value = 0 then
        edCA_ACTIVIDAD.Clear;
    end else
      edCA_ACTIVIDAD.Clear;

    edDiasVenci.Text := sdqDatosCA_DIASVENCI.AsString;

    // Datos Medicos:
    chkCronicos.Checked          := (sdqDatosCA_CRONICO.AsString = 'S');   // de acuerdo a Listado de internados Crónicos. (LU)
    chkResonancia.Checked        := (sdqDatosCA_RMN.AsString = 'S');
    chkTAC.Checked               := (sdqDatosCA_TAC.AsString = 'S');
    chkElectromiograma.Checked   := (sdqDatosCA_EMG.AsString = 'S');
    chkContratoART.Checked       := (sdqDatosCA_CONTRATO.AsString = 'S');
    chkContratoMutualVig.Checked := (sdqDatosCA_CONTRATOMUTUAL.AsString = 'S');
    chkVisible.Checked           := (sdqDatosCA_VISIBLE.AsString = 'S');
    chkAmbulancia.Checked        := (sdqDatosCA_AMBULANCIA.AsString = 'S');
    chkRX.Checked                := (sdqDatosCA_RX.AsString = 'S');
    chkFKT.Checked               := (sdqDatosCA_FKT.AsString = 'S');
    chkFactAnestesia.Checked     := (sdqDatosCA_FACTURACONANESTESIA.AsString = 'S');
    chkEcografia.Checked         := (sdqDatosCA_ECOGRAFIA.AsString = 'S');

    chkAuditable.Checked         := (sdqDatosCA_AUDITABLE.AsString = 'S');
    edFImprFormInscripc.Date     := sdqDatosCA_FECHAIMPRESIONFORMINSCR.AsDateTime;
    fraCartillaWeb.Value         := sdqDatosCA_CARTILLAWEB.AsString;
    rbMatProvincial.Checked      := (sdqDatosCA_TIPOMATPROFESIONAL.Text = 'P');
    rbMatNacional.Checked        := (sdqDatosCA_TIPOMATPROFESIONAL.Text = 'N');
    edPlazoDebitos.Text   := sdqDatosCA_RECLADEBITOS.Text;
    edLimite.Text         := sdqDatosCA_LIMITE.Text;
    edPiso.Text           := sdqDatosCA_PISO.Text;
    edTI.Text             := sdqDatosCA_CTI.Text;
    edTIUnidCor.Text      := sdqDatosCA_UCO.Text;
    edAislamTI.Text       := sdqDatosCA_AUTI.Text;
    edQuirofano.Text      := sdqDatosCA_QUIROFANOS.Text;
    edGuardia.Text        := sdqDatosCA_GUARDIAS.Text;
    edSRayos.Text         := sdqDatosCA_RAYOS.Text;
    edConsExt.Text        := sdqDatosCA_CONEX.Text;
    EdMatProfesional.Text := sdqDatosCA_MATPROFESIONAL.Text;
    chkGuardiaAct.Checked := (sdqDatosCA_GUARDIAACT.AsString = 'S');
    chkGuardiaPas.Checked := (sdqDatosCA_GUARDIAPAS.AsString = 'S');
    edDesdeAct.Text       := sdqDatosCA_DESDEGUARDIAACT.AsString;
    edHastaAct.Text       := sdqDatosCA_HASTAGUARDIAACT.AsString;
    edDesdePas.Text       := sdqDatosCA_DESDEGUARDIAPAS.AsString;
    edHastaPas.Text       := sdqDatosCA_HASTAGUARDIAPAS.AsString;
    {MATRICULA}
    lblMatricula.Enabled := chkRetCajaMedico.Checked;
    edMatricula.Enabled  := chkRetCajaMedico.Checked;

    sdqEspecialidades.Close;
    sdqEspecialidades.Sql.Text := cSQL_Especialidad +
                                 ' AND pe_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
                                 ' AND pe_fechabaja IS NULL ';  // por TK 48522 (hay una opcion para filtrar por esto o sacarlo)
    sdqEspecialidades.Open;
    mnuVisualizarValoresAlta_DatosMed.Checked  := true;      // por TK 48522
    mnuVisualizarTodosValores_DatosMed.Checked := false;

    sdqValNomenclador.SQL.Text := FSQLValoresNomenclador; // No lo puedo poner el la llamada siguiente al OpenQueryEx...
    OpenQueryEx(sdqValNomenclador, [fraPrestadorSel.IDPrestador]);
    tbIncluirNomenc.Down := (sdqDatosCA_INCLUYENOMENCLADOR.AsString = 'S');

    OpenQueryEx(SDQVUMed, [fraPrestadorSel.IDPrestador]);
    sSQL := FSQLValoresPrestador; // No lo puedo poner el la llamada siguiente al OpenQueryEx...
    AddCondition_UNION(sSQL, ' pp_id IS NULL ');
    sdqValoresPrestador.Close;
    OpenQueryEx(sdqValoresPrestador, [fraPrestadorSel.IDPrestador, fraPrestadorSel.IDPrestador], sSQL);
    OpenQueryEx(sdqPresupuestosAMP, [fraPrestadorSel.IDPrestador]);
    cmbPresupuesto.KeyValue := Null;
    OpenQueryEx(sdqEmpresas, [fraPrestadorSel.IDPrestador]);
    OpenQueryEx(sdqSiniestros, [fraPrestadorSel.IDPrestador]);   // TK 8638
    OpenQueryEx(sdqContratos, [fraPrestadorSel.IDPrestador]);
    OpenQueryEx(sdqExamenes, [fraPrestadorSel.IDPrestador]);

    tsRemis.TabVisible := cmbTipoPrestador.FieldValue = '023';
    tsZonas.TabVisible := cmbTipoPrestador.FieldValue = '023';

    do_CargarEstadoLegajo;    

    pmuVisualizarSloVigentesClick(nil);
    mnuVisualizarSoloVigentes_NomencladorClick(nil);
    pmuVisualizarSloVigentesUMClick(nil);
    mnuRenAutoClick(nil);
    
{
    Movido a pcDatosChange
    OpenQueryEx(sdqPrestCP, [fraPrestadorSel.IDPrestador]);
}
    CargarContratos; //camarillo - 19/05/06 - nueva solapa de contratos del prestador
    {fraUsuariosContrata.ExtraCondition := ' AND SE_SECTOR=''CONTRATA'' ' +
                      ' AND SE_USUARIOGENERICO = ''N'' ';}

  end;
end;

procedure TfrmManPrestador.OnProvinciasCPChange(Sender: TObject);
begin
  chkSoloGBA.Visible := fraProvinciasCP.IsSelected and (fraProvinciasCP.Codigo = IntToStr(PV_BUENOS_AIRES));

  with fraLocalidades do
  begin
    Clear;
    TableName   := 'ccp_codigopostal';
    FieldID     := 'cp_codigo';
    FieldCodigo := 'cp_codigo';
    FieldDesc   := 'cp_localidad';
    ExtraCondition := IIF(fraProvinciasCP.IsSelected, ' AND cp_provincia = ' + SqlValue (fraProvinciasCP.Codigo), '');
  end;
end;

// Lu por error enviado
function TfrmManPrestador.ReactivarAlta: Boolean;
var
  sSql :string;
begin
  // Realizo un sql para ver si existe el mismo registro pero con la fecha de baja no nula (dado de baja)
  sSql := ' SELECT 1 ' +
          ' FROM cpc_prestadorcontrato ' +
          ' WHERE pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
            ' AND pc_vigenciadesde = ' + SqlDate(edVigDesdeABM.Date) +
            ' AND pc_fechabaja IS NOT NULL ';
  // Si existe devuelvo true y se va a reactivar el alta pero con los otros datos nuevos
  Result := IIF(ExisteSql(sSql), True, False);
end;

{------[Para Ingresos brutos al refrescar el formulario (es lo que viene de la base)]--------------------------------------------}
procedure TfrmManPrestador.SetProvincia(AProvincia: Integer);
  procedure DisableIngBrutos;
  begin
    chkIngBrutos.Checked := False;
    chkIngBrutosClick(nil);
    chkIngBrutos.Enabled := False;
  end;
begin
  if fraDireccionLegal.Provincia <> AProvincia then
  begin
    fraDireccionLegal.Provincia := AProvincia;
    sdqIngBrutConceptos.Close;
    if AProvincia = -1 then
      DisableIngBrutos
    else
    begin
      sdqIngBrutConceptos.ParamByName('pProvincia').AsInteger := AProvincia;
      sdqIngBrutConceptos.Open;

      if sdqIngBrutConceptos.IsEmpty then
        DisableIngBrutos
      else
        chkIngBrutos.Enabled := True and (not cmbIngBrutConcepto.ReadOnly);
    end;
  end;

end;

procedure TfrmManPrestador.SetRegionSanitariaDom;
var
  sSql, sCodRegion, sDescRegion, sLocalidad: String;
  sRegiones: TStringList;
begin
  if (fraDireccionPrest.IsSelected) and
     (Accion <> Alta) then
  begin
    if fraDireccionPrest.Prov = 1 then
    //para Capital pongo la calle porque en la tabla ccp_codigopostal está así...(?)
      sLocalidad := fraDireccionPrest.Calle
    else
      sLocalidad := fraDireccionPrest.Localidad;

    //obtengo la region correspondiente al domicilio
    sRegiones := ValoresColSql('SELECT tb_codigo, tb_descripcion' +
                                ' FROM ctb_tablas, ccp_codigopostal' +
                               ' WHERE tb_clave = ''REGSA''' +
                                 ' AND tb_codigo = cp_regionsanitaria' +
                                 ' AND cp_codigo = ' + SQLValue(fraDireccionPrest.CodigoPostal) +
                                 ' AND cp_localidad = ' + SqlValue(sLocalidad));
    sCodRegion  := sRegiones[0];
    sDescRegion := sRegiones[1];

    if IsEmptyString(sCodRegion) and IsEmptyString(sDescRegion) then
      InfoHint(btnGuardar, 'Ocurrió un error al detectar la región sanitaria asociada. Consulte con Sistemas.', False)
    else begin
      //chequeo si existe en la tabla crp_regionesprestador y que sea rp_domicilio = 'S'
      sSql := 'SELECT rp_domicilio' +
               ' FROM crp_regionesprestador' +
              ' WHERE rp_prestador = ' + SqlInt(edIdentif.Value) +
                ' AND rp_region = ' + SqlValue(sCodRegion);
      try
        BeginTrans;
        if not(ExisteSql(sSql)) then
        begin
          //inserto la region nueva...
          sSql := 'INSERT INTO crp_regionesprestador ' +
                  '(rp_prestador, rp_region, rp_domicilio, rp_fechaalta, rp_usualta) VALUES ( ' +
                  SqlInt(edIdentif.Value) + ',' + SqlValue(sCodRegion) + ',' +
                  '''S'', ActualDate, ' + SqlValue(Sesion.UserID) + ')';
          EjecutarSqlST(sSql);

          //...y doy de baja la que estaba...
          sSql := 'UPDATE crp_regionesprestador' +
                    ' SET rp_domicilio = ''N'',' +
                        ' rp_fechabaja = ActualDate,' +
                        ' rp_usubaja = ' + SqlValue(Sesion.UserID) +
                  ' WHERE rp_prestador = ' + SqlInt(edIdentif.Value) +
                    ' AND rp_region <> ' + SqlValue(sCodRegion) +
                    ' AND rp_domicilio = ''S''';
          EjecutarSqlST(sSql);
        end
        else if (ValorSql(sSql) = 'N') then
        begin
          //pongo en 'N' la que estaba...
          sSql := 'UPDATE crp_regionesprestador' +
                    ' SET rp_domicilio = ''N''' +
                  ' WHERE rp_prestador = ' + SqlInt(edIdentif.Value) +
                    ' AND rp_domicilio = ''S''';
          EjecutarSqlST(sSql);
          //...y en 'S' la nueva...
          sSql := 'UPDATE crp_regionesprestador' +
                    ' SET rp_domicilio = ''S'',' +
                        ' rp_fechabaja = Null,' +
                        ' rp_usubaja = Null,' +
                        ' rp_fechaalta = ActualDate,' +
                        ' rp_usualta = ' + SqlValue(Sesion.UserID) +
                  ' WHERE rp_prestador = ' + SqlInt(edIdentif.Value) +
                    ' AND rp_region = ' + SqlValue(sCodRegion);
          EjecutarSqlST(sSql);
        end;
        CommitTrans;
        EdRegionSanitaria.Text := sDescRegion;
      except
        on E: Exception do
        begin
          Rollback;
          ErrorMsg(E);
        end;
      end;
    end;
  end;
end;

procedure TfrmManPrestador.SetTipoIngBrutos(IsIngBrutos: Boolean);
begin
  if IsIngBrutos then
  begin
    tbIngresoBrutos.Tag      := 0;
    tbIngresoBrutos.Caption  := mnuNroIngBrutos.Caption;
    mskIngBrutosNro.EditMask := '###-######-#;0;_';
    mskIngBrutosNro.Text     := '';
  end
  else
  begin
    tbIngresoBrutos.Tag      := 1;
    tbIngresoBrutos.Caption  := mnuCUIT.Caption;
    mskIngBrutosNro.EditMask := '##-########-#;0;_' ;
    mskIngBrutosNro.Text     := mskCUIT.Text
  end;
end;

function TfrmManPrestador.TieneLoteAutorizado :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM comunes.cle_lotesexamenes ' +
          ' WHERE le_idexamen = :IdEx ' +
            ' AND le_fechabaja IS NULL ' +
            ' AND le_autorizado = ''S'' ';
  if ExisteSqlEx(sSql, [sdqExamenes.FieldByName('ep_id').AsInteger]) then
  begin
    InfoHint(Nil, 'El examen posee lotes autorizados.');
    Result := True;
  end
  else
    Result := False;
end;

function TfrmManPrestador.Validar: Boolean;
begin
  Result := False;

  if Trim(edRanking.Text) = '' then
    edRanking.Text := 'C';

  if not IsCuit(mskCUIT.Text) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(mskCUIT, 'El número de CUIT no es válido.');
  end
  else if (edSecuencia.Value = 0) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(edSecuencia, 'El número de secuencia no es válido.');
  end
  else if (edIdentif.Value = 0) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(edIdentif, 'El número de identificador no es válido.');
  end
  else if (edPrestMutual.Value = 0) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(edPrestMutual, 'El código de mutual debe ser positivo.');
  end
  else if not(AreIn(Trim(edRanking.Text), ['A','B','C','D'])) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(edRanking, 'El Ranking no puede ser diferente de A, B, C o D.');
  end
  else if (edRSocial.Text = '') then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(edRSocial, 'Debe completar la Razón Social del prestador.');
  end
  else if not fraDireccionPrest.IsValid then
  begin
    Abort;
  end
  else if (ValidarPiso = false) then
    InvalidMsg(fraDireccionPrest.lbPiso, 'Los valores pueden ser ''PB'' o números distintos de ''0''' + chr(13) +
                                            'Para subsuelos debe anteponer el signo ''-'' al piso')

    //validacion del domicilio legal
  else if (fraDireccionLegal.cmbCalle.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionLegal.cmbCalle, 'Debe completar la calle del domicilio legal.');
  end
  else if (fraDireccionLegal.edNumero.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionLegal.edNumero, 'Debe completar el número del domicilio legal.');
  end
  else if (fraDireccionLegal.edCPostal.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionLegal.edCPostal, 'Debe completar el código postal del domicilio legal.');
  end
  else if (fraDireccionLegal.cmbLocalidad.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionLegal.cmbLocalidad, 'Debe completar la localidad del domicilio legal.');
  end
  else if (fraDireccionLegal.edProvincia.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionLegal.cmbLocalidad, 'Debe completar la provincia del domicilio legal.');
  end
      //validacion del domicilio comercial
  else if (fraDireccionCom.cmbCalle.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionCom.cmbCalle, 'Debe completar la calle del domicilio comercial.');
  end
  else if (fraDireccionCom.edNumero.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionCom.edNumero, 'Debe completar el número del domicilio comercial.');
  end
  else if (fraDireccionCom.edCPostal.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionCom.edCPostal, 'Debe completar el código postal del domicilio comercial.');
  end
  else if (fraDireccionCom.cmbLocalidad.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionCom.cmbLocalidad, 'Debe completar la localidad del domicilio comercial.');
  end
  else if (fraDireccionCom.edProvincia.Text = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(fraDireccionCom.cmbLocalidad, 'Debe completar la provincia del domicilio comercial.');
  end
  else if (Accion = Alta) and (dcFechaRevision.Date > 0) and (dcFechaRevision.Date < dHoy) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(dcFechaRevision, 'La Fecha de Revisión no puede ser menor que la Fecha Actual.');
  end
  else if (Accion = Alta) and (dcVtoGanancias.Date > 0) and (dcVtoGanancias.Date < dHoy) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(dcVtoGanancias, 'La Fecha de Vencimiento de Exclusión de Ganancias no puede ser menor que la Fecha Actual.');
  end
  else if (Accion = Alta) and (dcVtoIngBrutos.Date > 0) and (dcVtoIngBrutos.Date < dHoy) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(dcVtoIngBrutos, 'La Fecha de Vencimiento de Exclusión de Ingresos Brutos no puede ser menor que la Fecha Actual.');
  end
  else if (chkIngBrutos.Checked) and (cmbIngBrutConcepto.FieldValue = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(cmbIngBrutConcepto, 'El Concepto del Ingreso Bruto no puede ser nulo si selecciona la opción Ingresos Brutos.');
  end else if (chkIngBrutos.Checked) and (mskIngBrutosNro.Text = '') and
     (ValorSql('SELECT ib_exigenumero ' +
                 'FROM cib_ingresosbrutos' +
               ' WHERE ib_provincia = ' + fraDireccionLegal.ProvinciaSql +
                 ' AND ib_codigo = ' + SqlValue(cmbIngBrutConcepto.FieldValue)) = 'S') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(mskIngBrutosNro, 'El Número del Ingreso Bruto no puede ser nulo si selecciona la opción Ingresos Brutos.');
  end
  else if (Accion = Alta) and
           ExisteSql('SELECT 1' +
                      ' FROM cpr_prestador' +
                     ' WHERE ca_clave = ''' + mskCUIT.Text + ''' AND ca_secuencia = ' + edSecuencia.TextSql) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(edSecuencia, 'Existe un prestador con el mismo CUIT y Secuencia.');
  end
  else if (cmbTipoPrestador.Font.Color = clRed) then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(cmbTipoPrestador, 'Debe cambiar el tipo de prestador.');
  end
  else if (cmbTipoPrestador.Text = '') then
  begin
    pcDatos.ActivePageIndex := 0;
    InvalidMsg(cmbTipoPrestador, 'Debe completar el tipo de prestador.');
  end
  else if (tbIngresoBrutos.Tag = 0) and (mskIngBrutosNro.Text <> '') and
          (sdqIngBrutConceptos.FieldByName('IB_TIPOINGBRUTOS').AsString = 'CM') and
          (not IsIngresosBrutos(mskIngBrutosNro.Text)) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(mskIngBrutosNro, 'El Número de Ingresos Brutos es Inválido.');
  end
  else if chkFactura.Checked and (cmbRetDeGanacias.FieldValue = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(cmbRetDeGanacias, 'Si selecciona la opción "Factura" es obligatoria la carga de "Ganancias".');
  end
  else if (chkFactura.Checked and (cmbIVA.FieldValue = '')) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(cmbIVA, 'Si selecciona la opción "Factura" el campo "I.V.A." es obligatorio.');
  end
  else if (chkFactura.Checked and (cmbTipoComprobante.FieldValue = '')) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(cmbTipoComprobante, 'Si selecciona la opción "Factura" debe cargar el tipo de comprobante.');
  end
  else if (chkRetCajaMedico.Checked and (fraDireccionPrest.Prov <> 2)) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(chkRetCajaMedico, 'La opción "Retención Caja de Médicos" solo se puede seleccionar cuando la provincia es "Buenos Aires".');
  end
  else if (Trim(edDiasVenci.Text) = '') then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(edDiasVenci, 'Debe completar los días de vencimiento.');
  end
  else if (not edFImprFormInscripc.IsEmpty) and (edFImprFormInscripc.Date > dHoy) then
  begin
    pcDatos.ActivePageIndex := 1;
    InvalidMsg(edFImprFormInscripc, 'La "Fecha de Impresión del Formulario de Inscripción a la AFIP" no puede ser mayor a la fecha actual.');
  end
  else if chkGuardiaAct.Checked and ((Trim(edDesdeAct.Text) = ':') or (Trim(edHastaAct.Text) = ':')) then
  begin
    pcDatos.ActivePageIndex := 2;
    InvalidMsg(chkGuardiaAct, 'Si selecciona Guardia Activa, debe completar el horario de guardia.');
  end
  else if chkGuardiaAct.Checked and (not(IsTime(edDesdeAct.Text)) or not(IsTime(edHastaAct.Text))) then
  begin
    pcDatos.ActivePageIndex := 2;
    InvalidMsg(edDesdeAct, 'Hora incorrecta.');
  end
  else if chkGuardiaPas.Checked and ((Trim(edDesdePas.Text) = ':') or (Trim(edHastaPas.Text) = ':')) then
  begin
    pcDatos.ActivePageIndex := 2;
    InvalidMsg(chkGuardiaPas, 'Si selecciona Guardia Pasiva, debe completar el horario de guardia.');
  end
  else if chkGuardiaPas.Checked and (not(IsTime(edDesdePas.Text)) or not(IsTime(edHastaPas.Text))) then
  begin
    pcDatos.ActivePageIndex := 2;
    InvalidMsg(edDesdePas, 'Hora incorrecta.');
  end

  else if (edEMail.Text <> '') and (not ValidarVariosMails(edEMail.Text)) then
  begin
    pcdatos.ActivePageIndex := 0;
    InvalidMsg(edEMail, 'Alguna de las direcciones de e-mail es incorrecta o tiene espacios en blanco.');
    edEMail.SetFocus;
  end
  else if (edMailDebitos.Text <> '') and (not ValidarVariosMails(edMailDebitos.Text)) then
  begin
    pcdatos.ActivePageIndex := 0;
    InvalidMsg(edMailDebitos, 'Alguna de las direcciones de e-mail es incorrecta o tiene espacios en blanco.');
    edMailDebitos.SetFocus;
  end
  else if (edMailAdmin.Text <> '') and (not ValidarVariosMails(edMailAdmin.Text)) then
  begin
    pcdatos.ActivePageIndex := 0;
    InvalidMsg(edMailAdmin, 'Alguna de las direcciones de e-mail es incorrecta o tiene espacios en blanco.');
    edMailAdmin.SetFocus;
  end
  else
    Result := True;
end;


//DFG - 15/03/2012//
function TfrmManPrestador.ValidarPiso: boolean;
begin
  result := true;
  if (fraDireccionPrest.Piso <> 'PB') and (fraDireccionPrest.Piso <> '') then
  begin
    try
      strtoint(fraDireccionPrest.Piso);
    except
      result := false;
    end;
  end;
end;

//DFG - 29/03/2012//
function TfrmManPrestador.EsNumero(cadena: string): boolean;
begin
  EsNumero := true;
  try
    StrToInt(cadena);
  except
    EsNumero := false;
  end;
end;


//DFG - 29/03/2012//
{function TfrmManPrestador.ValidarDepto: boolean;
type
   PosiblesNumeros = set of 1..255;
   PosiblesLetras = set of 'A'..'Z';
var numeros: PosiblesNumeros; letras: PosiblesLetras;
begin
  result := true;
  if fraDireccionPrest.Departamento <> '' then
  begin
    if (EsNumero(fraDireccionPrest.Departamento)) and (Length(fraDireccionPrest.Departamento) > 3) then
      result := false
    else
      if fraDireccionPrest.Departamento in letras then
        showmessage('');
  end;

end; }

//DFG - 27/09/2011//
function TfrmManPrestador.ValidarVariosMails(mails: string): Boolean;
var temp: string; i, comaanterior: integer; valido: boolean;
begin
  valido := True;
  mails := trim(mails);
  EliminarEspacios(mails);
  if pos(' ', mails) = 0 then
  begin
    mails := FormatearCadena(mails);
    comaanterior := 0;
    for i:= 1 to length(mails) do
    begin
      if (mails[i] = ';') then
      begin
        temp := MidStr(mails, comaanterior + 1, i-comaanterior-1);
        valido := valido and IsEMail(temp);
        comaanterior := i;
      end;
    end;
  end
  else
    valido := false;
  ValidarVariosMails := valido;
end;

//DFG - 27/09/2011//
function TfrmManPrestador.EliminarEspacios(cadena: string): String;
var i: integer;
begin
  i:= pos(' ', cadena);
  while i <> 0 do
  begin
     delete (cadena, i, 1);
     i:= pos(' ', cadena);
  end;
  EliminarEspacios := cadena;
end;

//DFG - 27/09/2011//
function TfrmManPrestador.EliminarSeparadoresDuplicados(cadena: string): String;
var i, j: integer;
begin
  for i := 1 to length(cadena) do
  begin
     if cadena[i] = ';' then
     begin
       j := i + 1;
       while cadena[j] = ';' do
         delete (cadena, j, 1);
     end;
  end;
  EliminarSeparadoresDuplicados := cadena;
end;

//DFG - 27/09/2011//
function TfrmManPrestador.FormatearCadena(cadena: string): String;
begin
  //cadena := EliminarEspacios(cadena);
  cadena := StringReplace(cadena, ',', ';', [rfReplaceAll]);
  cadena := cadena + ';';
  cadena := EliminarSeparadoresDuplicados(cadena);
  FormatearCadena := cadena;
end;


function TfrmManPrestador.ValidarContrato: Boolean;
var
  sSql, sSqlAux9, sSqlAux7, sSqlAux: String;
  iCant7, iCant9 :integer;
  bValidarExisteCont: boolean;
begin
  Verificar(fraTipoContratoABM.IsEmpty, fraTipoContratoABM.edCodigo, 'Debe seleccionar el Tipo de Contrato.');
  Verificar((edVigDesdeABM.Date = 0) and (MidStr(fraTipoContratoABM.Especial1, 2, 1) <> 'N'), edVigDesdeABM, 'Debe ingresar la Vigencia Desde.');
  sSql := 'SELECT 1 ' +
           ' FROM cpc_prestadorcontrato' +
          ' WHERE pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
            ' AND pc_vigenciadesde = ' + SqlDate(edVigDesdeABM.Date) +
            ' AND pc_fechabaja IS NULL';
  if (fpABMContratos.Tag > 0) then //si estoy modificando
    sSql := sSql + ' AND pc_idcontrato <> ' + sdqContratosPC_IDCONTRATO.Text;

  with GetQuery(sSql) do        // por TK 19289
  Try
    if AreIn(fraTipoContratoABM.Codigo, ['7','9']) then
    begin
      sSqlAux := 'SELECT nvl(count(*),0) cant ' +
                  ' FROM cpc_prestadorcontrato ' +
                 ' WHERE pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
                   ' AND pc_vigenciadesde = ' + SqlDate(edVigDesdeABM.Date) +
                   ' AND pc_fechabaja IS NULL ';

      sSqlAux7 := sSqlAux + ' AND pc_tipocontrato = ''7'' ';
      iCant7   := ValorSql(sSqlAux7);
      sSqlAux9 := sSqlAux + ' AND pc_tipocontrato = ''9'' ';
      iCant9   := ValorSql(sSqlAux9);

      bValidarExisteCont := (not (fpABMContratos.Tag > 0)) and (
                               ((fraTipoContratoABM.Codigo = '7') and (iCant7 > 0))
                            or ((fraTipoContratoABM.Codigo = '9') and (iCant9 > 0))
                            or ((fraTipoContratoABM.Codigo = '7') and (iCant9 > 1))
                            or ((fraTipoContratoABM.Codigo = '9') and (iCant7 > 1))
                            );
      Verificar ( bValidarExisteCont, edVigDesdeABM, 'Ya existe un contrato con la misma Vigencia Desde');
    end
    else
      Verificar(ExisteSql(sSql), edVigDesdeABM, 'Ya existe un contrato con la misma Vigencia Desde.');
  finally
    free;
  end;


  sSql := 'SELECT 1' +
           ' FROM cpc_prestadorcontrato' +
          ' WHERE pc_idprestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
            ' AND pc_vigenciahasta IS NULL ' +
            ' AND pc_fechabaja IS NULL ';
  if (fpABMContratos.Tag > 0) then //si estoy modificando
    sSql := sSql + ' AND pc_idcontrato <> ' + sdqContratosPC_IDCONTRATO.Text;

  Verificar((edVigHastaABM.Date = 0) and ExisteSql(sSql), edVigHastaABM, 'Ya existe un contrato vigente para el prestador seleccionado.');
  Verificar((edVigHastaABM.Date > 0) and (edVigHastaABM.Date < edVigDesdeABM.Date), edVigHastaABM, 'La fecha de Vigencia Hasta no puede ser menor que la fecha de Vigencia Desde.');
  Verificar((edFactHastaABM.Value < edFactDesdeABM.Value), edFactHastaABM, 'Factura Hasta no puede ser menor que Factura Desde.');

  sSql := ' select max(pc_vigenciahasta) ' +
          '   from cpc_prestadorcontrato ' +
          '  where pc_idprestador = :idpres ' +
          '    and pc_fechabaja IS NULL ';

  if (fpABMContratos.Tag > 0) then //si estoy modificando
    sSql := sSql + ' AND pc_idcontrato <> ' + sdqContratosPC_IDCONTRATO.Text;

  Verificar((edVigDesdeABM.Date > 0) and (ValorSqlDateTimeEx(ssql, [fraPrestadorSel.IDPrestador]) >= edVigDesdeABM.Date), edVigDesdeABM, 'Esta fecha debe ser posterior al cierre de la última vigencia.');

  Result := True;
end;

procedure TfrmManPrestador.dbgSiniestrosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqSiniestros.FieldByName('FECHABAJA').IsNull then        // TK 8638
    AFont.Color := clRed;
end;

procedure TfrmManPrestador.tbAgregarSiniestroClick(Sender: TObject);   // TK 8638
begin
  ModoForm := fsAgregar;
  ClearDatosFormPanelSiniestro;

  VCLExtra.LockControls([edVigenciaHastaSin], True);
  VCLExtra.LockControls([SinEdit, edVigenciaDesdeSin, edObservacionesSin], False);
  sbtnBuscar.Enabled := True;

  fpDialogSiniestros.Caption := 'Agregar Siniestro';
  if fpDialogSiniestros.ShowModal = mrOk then sdqSiniestros.Refresh;
end;

procedure TfrmManPrestador.ClearDatosFormPanelSiniestro;      // TK 8638
begin
  SinEdit.Clear;
  edVigenciaDesdeSin.Clear;
  edVigenciaHastaSin.Clear;
  edObservacionesSin.Clear;
end;


{******** ****** **** ******* *******  ********* **** ***** ******* ***** *** **** *******}


procedure TfrmManPrestador.btnAceptarSiniestrosClick(Sender: TObject);   // TK 8638
var
  Id: TTableId;
  sSql: String;
  IdExpediente: Integer;
begin
  if IsDatosValidosSiniestro(ModoForm) then
  begin
    IdExpediente := Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
    BeginTrans;
    try
      // actualizo los datos de la empresa
      with TSql.Create('MPS_PRESTADORSINIESTRO') do
      try
        Id := ART_EMPTY_ID;

        Fields.Add('PS_OBSERVACIONES', edObservacionesSin.Text);

        case ModoForm of
          fsAgregar:
          begin
            sSql := 'UPDATE mps_prestadorsiniestro' +
                      ' SET ps_vigenciahasta = ' + SqlDate(edVigenciaDesdeSin.Date) + '-1,' +
                          ' ps_fechabaja=ACTUALDATE,' +
                          ' ps_usubaja = ' + SqlValue(Sesion.UserId) +
                    ' WHERE ps_prestador = ' + SqlValue(edIdentif.Value) +
                      ' AND ps_idexpediente = ' + SqlInt(IdExpediente) +
                      ' AND ps_vigenciahasta IS NULL';
            EjecutarSqlST(sSql);

            Id := GetSecNextVal('SEQ_MPS_ID');

            Fields.Add('PS_PRESTADOR',     edIdentif.Value);
            Fields.Add('PS_IDEXPEDIENTE',  IdExpediente);
            Fields.Add('PS_VIGENCIADESDE', edVigenciaDesdeSin.Date);
            Fields.Add('PS_FECHAALTA',     exDate);
            Fields.Add('PS_USUALTA',       Sesion.UserId);
            SqlType := stInsert;
          end;

          fsModificar:
          begin
            Id := sdqSiniestros.FieldByName('PS_ID').AsInteger;
            Fields.Add('PS_FECHAMODIF', exDate);
            Fields.Add('PS_USUMODIF',   Sesion.UserId);
            SqlType := stUpdate;
          end;

          fsEliminar:
          begin
            Id := sdqSiniestros.FieldByName('PS_ID').AsInteger;
            Fields.Add('PS_VIGENCIAHASTA', edVigenciaHastaSin.Date);
            Fields.Add('PS_FECHABAJA',     exDate);
            Fields.Add('PS_USUBAJA',       Sesion.UserId);
            SqlType := stUpdate;
          end;
        end;

        PrimaryKey.Add('PS_ID', Id);

        EjecutarSqlST(Sql);
      finally
        Free;
      end;

      CommitTrans;

      MsgBox('Los datos del siniestro se grabaron correctamente.' , MB_OK + MB_ICONINFORMATION);
      fpDialogSiniestros.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        Rollback;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar los datos del siniestro.');
      end;
    end;
  end;
end;


function TfrmManPrestador.IsDatosValidosSiniestro(ModoFormSin: TFuncionShowForm): Boolean;  // TK 8638
var
  sSql, sCausaFin: String;
  IdExpediente: Integer;
begin
  sCausaFin := ValorSqlEx('select ex_causafin from art.sex_expedientes where ' +
                          '       ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec',
                          [SinEdit.SiniestroS, SinEdit.OrdenS, SinEdit.RecaidaS]);
  case ModoForm of
    fsAgregar:
    begin
      Verificar(SinEdit.IsEmpty, SinEdit, 'Debe ingresar el Siniestro.');
      Verificar((sCausaFin = '99') or (sCausaFin = '95') or (sCausaFin = '02'), SinEdit, 'El siniestro seleccionado se encuentra rechazado o cerrado por error de carga');

      Verificar(edVigenciaDesdeSin.IsEmpty, edVigenciaDesdeSin, 'Debe ingresar la vigencia desde.');

      IdExpediente := Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
      // validaciones para que no se solapen los rangos de vigencia
      sSql := 'SELECT 1' +
               ' FROM mps_prestadorsiniestro' +
              ' WHERE ps_prestador = ' + SqlValue(edIdentif.Value) +
                ' AND ps_idexpediente = ' + SqlInt(IdExpediente) +
                ' AND ps_vigenciahasta = ' + SqlValue(edVigenciaDesdeSin.Date);

      Verificar(ExisteSql(sSql), edValNomVigDesde, 'El valor ingresado en la vigencia desde del Siniestro coincide con una fecha de cierre, por favor, modifíquelo en al menos un día y reintente.');

      sSql := 'SELECT 1' +
               ' FROM mps_prestadorsiniestro' +
              ' WHERE ps_prestador = ' + SqlValue(edIdentif.Value) +
                ' AND ps_idexpediente = ' + SqlInt(IdExpediente) +
                ' AND ' + SqlValue(edVigenciaDesdeSin.Date) + ' BETWEEN ps_vigenciadesde AND ps_vigenciahasta';
      Verificar(ExisteSql(sSql), edValNomVigDesde, 'El valor ingresado en la vigencia desde del Siniestro se solapa con un período existente.');
    end;

    fsEliminar:
      Verificar(edVigenciaHastaSin.IsEmpty, edVigenciaHastaSin, 'Debe ingresar la vigencia hasta.');

    fsModificar:
      Verificar((sCausaFin = '99') or (sCausaFin = '95') or (sCausaFin = '02'), SinEdit, 'El siniestro seleccionado se encuentra rechazado o cerrado por error de carga');
  end;

  Result := True;
end;

procedure TfrmManPrestador.sbtnBuscarClick(Sender: TObject);        // TK 8638
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
     dlgBusqSini.Siniestro  := SinEdit.Siniestro;
     dlgBusqSini.Orden      := SinEdit.Orden;
     dlgBusqSini.Recaida    := SinEdit.Recaida;
     if dlgBusqSini.ShowModal = mrOk then
       Self.SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
  finally
     dlgBusqSini.Free;
  end;
end;

procedure TfrmManPrestador.tbModificarSiniestroClick(Sender: TObject);    // TK 8638
begin
  if IsRegistroSeleccionadoSiniestroValido then
  begin
    ModoForm := fsModificar;
    LoadDatosFormPanelSiniestro;

    VCLExtra.LockControls([SinEdit, edVigenciaDesdeSin, edVigenciaHastaSin], True);
    VCLExtra.LockControls([edObservacionesSin], False);
    sbtnBuscar.Enabled := False;

    fpDialogSiniestros.Caption := 'Modificar Siniestro';
    if fpDialogSiniestros.ShowModal = mrOk then
      sdqSiniestros.Refresh;
  end;
end;

function TfrmManPrestador.IsRegistroSeleccionadoSiniestroValido: Boolean;    // TK 8638
begin
  Verificar(not sdqSiniestros.Active or (sdqSiniestros.RecordCount = 0), dbgSiniestros, 'No hay siniestros en la grilla.');
  verificar(sdqSiniestros.FieldByName('FECHABAJA').AsString <> '', dbgSiniestros, 'El siniestro está dado de baja');
  Result := True;
end;

procedure TfrmManPrestador.LoadDatosFormPanelSiniestro;            // TK 8638
begin
  SinEdit.SetValues(sdqSiniestros.FieldByName('EX_SINIESTRO').AsInteger,
                    sdqSiniestros.FieldByName('EX_ORDEN').AsInteger,
                    sdqSiniestros.FieldByName('EX_RECAIDA').AsInteger);
  edVigenciaDesdeSin.Date := sdqSiniestros.FieldByName('V_DESDE').AsDateTime;
  edVigenciaHastaSin.Date := sdqSiniestros.FieldByName('V_HASTA').AsDateTime;
  edObservacionesSin.Text := sdqSiniestros.FieldByName('OBSERVACIONES').AsString;
end;

procedure TfrmManPrestador.tbEliminarSiniestroClick(Sender: TObject);      // TK 8638
begin
  if IsRegistroSeleccionadoSiniestroValido then
  begin
    ModoForm := fsEliminar;
    LoadDatosFormPanelSiniestro;
    VCLExtra.LockControls([SinEdit, edVigenciaDesdeSin], True);
    VCLExtra.LockControls([edVigenciaHastaSin, edObservacionesSin], False);
    sbtnBuscar.Enabled := False;
    fpDialogSiniestros.Caption := 'Baja de Siniestro';
    if fpDialogSiniestros.ShowModal = mrOk then sdqSiniestros.Refresh;
  end;
end;

procedure TfrmManPrestador.tbOrdenarS(Sender: TObject);   // TK 8638
begin
  sdSiniestros.Execute;
end;

procedure TfrmManPrestador.tbExportarSiniestroClick(Sender: TObject);   // TK 8638
begin
  edlgSiniestros.Execute;
end;

procedure TfrmManPrestador.tbImprimirSiniestroClick(Sender: TObject);    // TK 8638
begin
  ImpresionGrilla(qpSiniestros);
end;

procedure TfrmManPrestador.btnPersonasLoteClick(Sender: TObject);
begin
  fpPersonasLote.Tag := 0;
  fpPersonasLote.ShowModal;
end;

procedure TfrmManPrestador.btnAgregarPerLoteClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(Trim(edDNIPersona.Text) = '', edDNIPersona, 'Debe completar el DNI de la persona.');
  Verificar(Trim(edNombrePersona.Text) = '', edNombrePersona, 'Debe completar el nombre y apellido de la persona.');
  sSql := 'SELECT 1 ' +
           ' FROM comunes.cpl_personasxlote ' +
          ' WHERE pl_idlote = :IdLote ' +
            ' AND pl_fechabaja IS NULL ' +
            ' AND pl_dni = :NroDoc ';
  Verificar(ExisteSqlEx(sSql, [sdqPersonasLote.ParamByName('idlote').AsInteger, Trim(edDNIPersona.Text)]),
            edDNIPersona, 'Ya existe una persona con el mismo DNI para el lote actual.');
  Verificar((edMailPersLote.Text <> '') and (not IsEMail(edMailPersLote.Text)), edMailPersLote, 'Dirección inválida');

  if ValidarCantPersonas(False) and MsgAsk('¿Confirma agregar al lote a la persona ingresada?') then
  begin
    sSql := 'INSERT INTO comunes.cpl_personasxlote ' +
            '(pl_dni, pl_nombre, pl_idlote, pl_usualta, pl_fechaalta, pl_puesto, pl_mail) VALUES ( ' +
            SqlValue(Trim(edDNIPersona.Text)) + ',' + SqlValue(Trim(edNombrePersona.Text)) + ',' +
            SqlInt(sdqPersonasLote.ParamByName('idlote').AsInteger) + ',' +
            SqlValue(Sesion.UserID) + ', ActualDate, ' + SqlValue(Trim(edPuesto.Text)) + ',' +
            SqlValue(Trim(edMailPersLote.Text)) + ')';
    EjecutarSql(sSql);
    edDNIPersona.Clear;
    edNombrePersona.Clear;
    edPuesto.Clear;
    edMailPersLote.Clear;
    sdqPersonasLote.Refresh;
  end;
end;

procedure TfrmManPrestador.fpPersonasLoteBeforeShow(Sender: TObject);
begin
  edDNIPersona.Clear;
  edNombrePersona.Clear;
  with sdqPersonasLote do
  begin
    Close;
    ParamByName('idlote').AsInteger := sdqDetalleExamen.FieldByName('le_id').AsInteger;
    Open;
  end;
  fpPersonasLote.Caption := 'Personas del lote ' + sdqDetalleExamen.FieldByName('le_id').AsString;
  VclExtra.LockControls([edDNIPersona, edNombrePersona, edPuesto, edMailPersLote, btnAgregarPerLote, btnQuitarPerLote], (fpPersonasLote.Tag = 1));
end;

procedure TfrmManPrestador.btnQuitarPerLoteClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqPersonasLote.IsEmpty, dgPersonasLote, 'No hay personas en el lote.');
  if MsgAsk('¿Confirma quitar del lote a la persona seleccionada?') then
  begin
    sSql := 'UPDATE comunes.cpl_personasxlote ' +
              ' SET pl_fechabaja = ActualDate, ' +
                  ' pl_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE pl_id = ' + SqlInt(sdqPersonasLote.FieldByName('pl_id').AsInteger);
    EjecutarSql(sSql);
    sdqPersonasLote.Refresh;
  end;
end;

procedure TfrmManPrestador.tbPersonasLoteClick(Sender: TObject);
begin
  if sdqDetalleExamen.Active and not(sdqDetalleExamen.IsEmpty) and tbModificarPreocup.Enabled then
  begin
    fpPersonasLote.Tag := 1;
    fpPersonasLote.ShowModal;
  end;
end;

function TfrmManPrestador.ValidarCantPersonas(bSoloMenor: Boolean) :Boolean;
var
  iCant: Integer;
begin
  iCant := ValorSqlIntegerEx('SELECT COUNT(*) ' +
                              ' FROM comunes.cpl_personasxlote ' +
                             ' WHERE pl_idlote = :IdLote ' +
                               ' AND pl_fechabaja IS NULL ', [sdqPersonasLote.ParamByName('idlote').AsInteger]);
  Verificar(IIF(bSoloMenor, edCantExa.Value < iCant, edCantExa.Value <= iCant),
            Nil, 'La cantidad de personas ingresadas supera la cantidad especificada para el lote.');
  Result := True;
end;

procedure TfrmManPrestador.Do_Guardar_PrestadorHistBajas_Reactiv;       // TK 15642
var sSql: string;
begin
  sSql := ' UPDATE ART.CPH_PRESTADORHISTBAJAS ' +
            ' SET PH_FECREACTIVACION = TRUNC(SYSDATE), ' +
                ' PH_USUREACTIVACION = ' + SqlValue(Sesion.UserID) +
            ' WHERE PH_IDPRESTADOR = ' + SqlInt(fraPrestadorSel.IDPrestador) +
              ' AND PH_FECREACTIVACION IS NULL ';

  EjecutarSqlST(sSql);
end;

procedure TfrmManPrestador.tbVerHistoricoBajasClick(Sender: TObject);   // TK 15642
begin
  fpVerHistoricoBajas.ShowModal;
end;

procedure TfrmManPrestador.btnHistBajaCerrarClick(Sender: TObject);     // TK 15642
begin
  fpVerHistoricoBajas.ModalResult := mrCancel;
end;

procedure TfrmManPrestador.fpVerHistoricoBajasBeforeShow(Sender: TObject);  // TK 15642
begin
  lprestador.Caption := '  Prestador: ' + fraPrestadorSel.RazonSocial;
  sdqHistBajas.Close;
  sdqHistBajas.ParamByName('IdPrest').AsInteger := fraPrestadorSel.IDPrestador;
  sdqHistBajas.Open;
end;

function TfrmManPrestador.ArmarCuerpoMail(titulo: string): string;
var tipoprest, texto: string;
begin
  tipoprest := ValorSqlEx(' SELECT tp_descripcion ' +
                           ' FROM mtp_tipoprestador, cpr_prestador ' +
                          ' WHERE ca_especialidad = tp_codigo ' +
                            ' AND tp_fbaja IS NULL ' +
                            ' AND ca_identificador = :idprest ', [IntToStr(fraPrestadorSel.IDPrestador)]);


  texto := titulo + chr(13) +
            'Detalles: ' + chr(13) +
            ' Prestador: ' + fraPrestadorSel.RazonSocial + chr (13) +
            ' ID: ' + IntToStr(fraPrestadorSel.IDPrestador) + chr(13) +
            ' Tipo Prestador: ' + tipoprest + chr(13) +
            ' Localidad: ' + fraPrestadorSel.Localidad + chr(13) +
            ' Provincia: ' + fraPrestadorSel.Provincia + chr(13) +
            ' Región Sanitaria: ' + EdRegionSanitaria.Text + chr(13) +
            ' Motivo de baja: ' + fraMotivoBaja.Descripcion;

  ArmarCuerpoMail := texto;

end;

procedure TfrmManPrestador.tbAprobarPresupuestoClick(Sender: TObject);    // TK 19609
var sTextoMail, sSql: string;
    ResultadoEnvio: TResultadoEnvio;
begin
  Verificar(VarIsNull(cmbPresupuesto.KeyValue), nil, 'Debe seleccionar un presupuesto para aprobarlo');
  Verificar((fraPrestadorSel.CorreoElectronico = ''), nil, 'El prestador ' + fraPrestadorSel.NombreFantasia +
                                                           ' no posee correo electrónico cargado.');

  if not (VarIsNull(cmbPresupuesto.KeyValue) or sdqPresupuestosAMP.FieldByName('PP_FECHABAJA').IsNull) then
    MsgBox('Advertencia: Está a punto de enviar un presupuesto que se encuentra dado de baja', MB_ICONEXCLAMATION);

  if MsgAsk('¿Confirma aprobar el presupuesto seleccionado y enviar el mail al prestador?') then
  begin
    sTextoMail     := Get_TextoMailAprobarPresup(fraPrestadorSel.RazonSocial, fraPrestadorSel.Cuit);
    ResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(fraPrestadorSel.CorreoElectronico,
                                                 '[Provincia ART] - Aprobación de Presupuesto Nro ' + cmbPresupuesto.KeyValue, [oAlwaysShowDialog], sTextoMail);
                                                                                                                                // TK 24040
    if ResultadoEnvio.EnvioOk then
    begin
      sSql := 'UPDATE comunes.cpp_presupuestoprestador ' +
                ' SET pp_fechaaprobacion = trunc(sysdate), ' +
                    ' pp_usuaprobacion = ' + SqlValue(Sesion.UserID) +
              ' WHERE pp_id = ' + sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsString;
      EjecutarSql(sSql);
      sdqEmpresasPresupuestoAMP.Refresh;
    end;
  end;
end;

function TfrmManPrestador.Get_TextoMailAprobarPresup(sNomPrestador, sCuitPrestador:string): String;      // TK 19609
var sValores:string;
begin
  sValores := '';
  with sdqValoresPrestador do
  begin
    First;
    while not Eof do
    begin
      sValores := sValores + ' - Cód: ' + sdqValoresPrestador.FieldByName('ES_CODIGO').AsString + ' - ' +
                  sdqValoresPrestador.FieldByName('ES_DESCRIPCION').AsString + ' - $ ' +
                  sdqValoresPrestador.FieldByName('PD_VALOR').AsString + '.-' + #13;
      Next;
    end;
  end;

  Result := '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}{\f1\fswiss\fcharset0 Arial;}}{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\b\f0\fs20 Provincia ART\b0\f1\par}' + #13 +  // TK 26176
            '                                                                                 Buenos Aires, ' + DateFormat(DBDate, 'd ''de'' MMMM ''de'' yyyy') + #13 + #13 +  #13 +
            'Señores:' + #13 +
            sNomPrestador + #13 +
            'C.U.I.T. ' + sCuitPrestador      + #13 + #13 +
            'Ref: Aprobación de Presupuesto'  + #13 + #13 +
            'De nuestra mayor consideración:' + #13 + #13 +
            'Comunicamos la aceptación del presupuesto cotizado para la empresa ' +
             sdqEmpresasPresupuestoAMP.FieldByName('EM_NOMBRE').AsString + ', ' +
            'Nro de C.U.I.T. ' + sdqEmpresasPresupuestoAMP.FieldByName('EM_CUIT').AsString + ', ' + #13 +
            'establecimiento N° ' + sdqEmpresasPresupuestoAMP.FieldByName('ES_NROESTABLECI').AsString +
            ' con los siguientes estudios: ' + #13 + #13 +
            sValores + #13 + #13 +
            'Dentro de las 72 hs. posteriores al envío de esta aprobación el sector ' +
            'de Medicina Laboral de nuestra ART remitirá ' + #13 +
            'vía mail un archivo con:' + #13 + #13 +
            ' - Datos de la empresa: número telefónico y dirección.' + #13 +
            ' - Nómina de empleados.' + #13 +
            ' - Detalle de estudios para cada expuesto en cuestión.' + #13 + #13 +
            ' Datos del Prestador: ' + fraPrestadorSel.NombreFantasia + #13 + #13 +  // TK 26176
            'Sin otro particular, saludamos a Uds. muy atentamente.' + #13 + #13 + #13 +
            'Departamento de Prestadores'    + #13 +
            'Provincia ART '  + #13 +
            'E-Mail: examenes@provart.com.ar'  + #13 +
            'Tel: (011) 4819-2800 Int. ' + Sesion.Interno;
end;


function TfrmManPrestador.ExistenPersonasEnLote(iIdLote, iCantidadPers: integer): Boolean;  // TK 25139
var sSql: string;
begin
  sSql := 'SELECT count(*) CantEnLote ' +
           ' FROM comunes.cpl_personasxlote ' +
          ' WHERE pl_idlote = :lote ' +
           '  AND pl_fechabaja IS NULL ';
  Result := (ValorSqlIntegerEx(sSql, [iIdLote]) = iCantidadPers);
end;

procedure TfrmManPrestador.pmuVisualizarSloVigentesUMClick(Sender: TObject);
var
  sSQL: String;
begin
  pmuVisualizarSloVigentesUM.Checked := true;
  pmuVisualizartodoslosvaloresUM.Checked := false;
  VigHtaFiltroVUM.Clear;
  vclextra.LockControl(VigHtaFiltroVUM);
  sSQL := FSQLValoresUnidMed;
  AddCondition(sSQL, ' up_vigenciahasta IS NULL ');
  if not VigDdeFiltroVUM.IsEmpty then
    sSQL := sSQL + ' AND up_vigenciadesde >= ' + VigDdeFiltroVUM.SqlText;
  if not VigHtaFiltroVUM.IsEmpty then
    sSQL := sSQL + ' AND up_vigenciahasta <= ' + VigHtaFiltroVUM.SqlText;
  OpenQueryEx(SDQVUMed, [fraPrestadorSel.IDPrestador],  sSQL);
end;

procedure TfrmManPrestador.pmuVisualizartodoslosvaloresUMClick(Sender: TObject);
var sSQL: String;
begin
  pmuVisualizarSloVigentesUM.Checked := false;
  pmuVisualizartodoslosvaloresUM.Checked := true;
  vclextra.LockControl(VigHtaFiltroVUM, false);
  sSQL := FSQLValoresUnidMed;
  if not VigDdeFiltroVUM.IsEmpty then
    sSQL := sSQL + ' AND up_vigenciadesde >= ' + VigDdeFiltroVUM.SqlText;
  if not VigHtaFiltroVUM.IsEmpty then
    sSQL := sSQL + ' AND up_vigenciahasta <= ' + VigHtaFiltroVUM.SqlText;
  OpenQueryEx(SDQVUMed, [fraPrestadorSel.IDPrestador], sSQL);
end;

procedure TfrmManPrestador.tbObservLiquidacionesClick(Sender: TObject);
begin
  Do_MostrarObservLiquidaciones(fraPrestadorSel.IDPrestador);
  fpObservLiquidaciones.ShowModal;
end;

procedure TfrmManPrestador.btnCerrarObservLiquidClick(Sender: TObject);
begin
  fpObservLiquidaciones.ModalResult := mrCancel;
end;

procedure TfrmManPrestador.btnGuardarObservLiquidClick(Sender: TObject);
begin
  Verificar(MemoObservLiquidaciones.Text = '', MemoObservLiquidaciones, 'Debe completar las Observaciones');
  Do_GuardarObservLiquid(fraPrestadorSel.IDPrestador, MemoObservLiquidaciones.Text);
  fpObservLiquidaciones.ModalResult := mrOk;
end;

procedure TfrmManPrestador.Do_GuardarObservLiquid(iIdPrest:integer; sObserv: string);     // TK 29415
var sSql:string;
begin
  sSql := 'UPDATE ART.CPR_PRESTADOR ' +
            ' SET CA_OBSERVLIQUIDACIONES = ' + SqlValue(sObserv) +
          ' WHERE CA_IDENTIFICADOR = ' + SqlValue(iIdPrest);
  try
    EjecutarSql(sSql);
  except
    on E: Exception do
      ErrorMsg(E, 'Error al intentar guardar los datos.');
  end;
end;

procedure TfrmManPrestador.Do_MostrarObservLiquidaciones(iIdPrest: integer);    // TK 29415
var sSql:string;
begin
  sSql := 'SELECT CA_OBSERVLIQUIDACIONES FROM ART.CPR_PRESTADOR ' +
          ' WHERE CA_IDENTIFICADOR = :idprest ';
  with GetQueryEx(sSQL, [iIdPrest]) do
  try
    MemoObservLiquidaciones.Text := FieldByName('CA_OBSERVLIQUIDACIONES').AsString;
  finally
    Free;
  end;
end;

procedure TfrmManPrestador.edEMailExit(Sender: TObject);
var mail: string;
begin
  mail := EliminarEspacios(edEMail.Text);
  if (midstr(mail, length(mail), 1) = ';') or (midstr(mail, length(mail), 1) = ',') then
    delete(mail, length(mail), 1);
  edEMail.Text := mail;

end;

procedure TfrmManPrestador.edMailDebitosExit(Sender: TObject);
var mail: string;
begin
  mail := EliminarEspacios(edMailDebitos.Text);
  if (midstr(mail, length(mail), 1) = ';') or (midstr(mail, length(mail), 1) = ',') then
    delete(mail, length(mail), 1);
  edMailDebitos.Text := mail;

end;

procedure TfrmManPrestador.fpMotivosBajaShow(Sender: TObject);
begin
  fraPrestadorRS.Clear;
  fraMotivoBajaFP.Clear;
  chkTransferir.Checked := False;
  dcFechaBaja.Date := DBDate;
  //vclextra.LockControls([fraPrestadorRS, chkTransferir], true);
  fraMotivoBajaFPChange(nil);
end;

procedure TfrmManPrestador.btnAceptarMotBajaClick(Sender: TObject);
begin
  verificar(fraMotivoBajaFP.IsEmpty, fraMotivoBajaFP, 'Debe ingresar un motivo de baja');
  if fraMotivoBajaFP.Codigo = '01' then
  begin
    Verificar(fraPrestadorRS.IsEmpty, fraPrestadorRS, 'Seleccione el prestador relacionado.');
    Verificar(fraPrestadorRS.IDPrestador = fraPrestadorSel.IDPrestador, fraPrestadorRS,
              'El prestador relacionado debe ser diferente del actual.');
  end;
  verificar(dcFechaBaja.Date < DBDate, dcFechaBaja, 'La fecha de baja no puede ser anterior al día de hoy');
  fraMotivoBaja.Codigo := fraMotivoBajaFP.Codigo;
  fpMotivosBaja.ModalResult := mrOK;
end;

procedure TfrmManPrestador.fraMotivoBajaFPChange(Sender: TObject);
begin
  if fraMotivoBajaFP.Codigo = '01' then     // Cambio de razón social
  begin
    vclextra.LockControls([fraPrestadorRS], false);
    if Seguridad.claves.IsActive('TransferirAutorizaciones') then
      vclextra.LockControls(chkTransferir, false);
  end
  else
  begin
    fraPrestadorRS.Clear;
    vclextra.LockControls([fraPrestadorRS, chkTransferir], true);
  end;
end;

  
procedure TfrmManPrestador.fraDireccionLegalExit(Sender: TObject);
begin
  fraDireccionLegal.FrameExit(Sender);
  if (Accion = Alta) and (fraDireccionCom.IsEmpty) then
  begin
    fraDireccionCom.edCPostal.Text      := fraDireccionLegal.edCPostal.Text;
    fraDireccionCom.cmbLocalidad.Text   := fraDireccionLegal.cmbLocalidad.Text;
    fraDireccionCom.cmbCalle.Text       := fraDireccionLegal.cmbCalle.Text;
    fraDireccionCom.edNumero.Text       := fraDireccionLegal.edNumero.Text;
    fraDireccionCom.edPiso.Text         := fraDireccionLegal.edPiso.Text;
    fraDireccionCom.edDto.Text          := fraDireccionLegal.edDto.Text;
    fraDireccionCom.Provincia           := fraDireccionLegal.Provincia;
  end;

end;


procedure TfrmManPrestador.rgEstadoPrestClick(Sender: TObject);
begin

  if rgEstadoPrest.ItemIndex = 0 then
    fraPrestadorSel.ExtraCondition := ' AND ca_fechabaja is null'
  else if rgEstadoPrest.ItemIndex = 1 then
    fraPrestadorSel.ExtraCondition := ' AND ca_fechabaja is not null'
  else if rgEstadoPrest.ItemIndex = 2 then
    fraPrestadorSel.ExtraCondition := '';
end;

procedure TfrmManPrestador.GridEmpresasCellClick(Column: TColumn);
begin
  if sdqEmpresasPresupuestoAMP.FieldByName('PP_IDSOLICITUD').AsString = '' then
  begin
    sdqEstudiosPorEmpresa.Close;
    sdqEstudiosPorEmpresa.ParamByName('idpresup').AsInteger := sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger;
    sdqEstudiosPorEmpresa.ParamByName('idprest').AsInteger := fraPrestadorSel.IDPrestador;
    sdqEstudiosPorEmpresa.Open;
    grdEstudios.DataSource := dsEstudiosPorEmpresa;
  end
  else
    //grdEstudios.DataSource := dsValoresPrestaciones;
    grdEstudios.DataSource := dsValoresPrestador;  //PROBANDO
  
end;

procedure TfrmManPrestador.GridPresupuestosDetalleCellClick(
  Column: TColumn);
begin
  {if sdqEmpresasPresupuestoAMP.FieldByName('PP_IDSOLICITUD').AsString <> '' then
  begin
    sdqPresupDetalle.Close;
    sdqPresupDetalle.ParamByName('idpresupuesto').AsInteger := sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger;
    sdqPresupDetalle.ParamByName('idprestador').AsInteger := fraPrestadorSel.IDPrestador;
    sdqPresupDetalle.ParamByName('idestablecim').AsInteger := sdqEmpresasPresupuestoAMP.FieldByName('es_id').asinteger;
    sdqPresupDetalle.ParamByName('idsolicitud').AsString := sdqEmpresasPresupuestoAMP.FieldByName('pp_idsolicitud').AsString;
    sdqPresupDetalle.ParamByName('cuitestablecim').AsString := sdqEmpresasPresupuestoAMP.FieldByName('em_cuit').AsString;
    sdqPresupDetalle.ParamByName('nroestablecim').AsInteger := sdqEmpresasPresupuestoAMP.FieldByName('es_nroestableci').asinteger;

    sdqPresupDetalle.Open;
    grdAMP.DataSource := dsPresupDetalle;
    DynColWidthsByData(grdAMP, 150);
  end
  else
    grdAMP.DataSource := dsValoresPrestador; } //PROBANDO

end;

procedure TfrmManPrestador.sdqPresupDetalleAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(grdAMP, 150);
end;


procedure TfrmManPrestador.cmbIngBrutConceptoChange(Sender: TObject);
var ssql: string;
begin
  if cmbIngBrutConcepto.Text <> '' then
  begin
  ssql := ' SELECT ib_descripcion, ib_observaciones ' +
          '   FROM art.cib_ingresosbrutos ' +
          '  WHERE ib_provincia = :prov ' +
          '    AND ib_codigo = :cod ';

  with GetQueryEx(ssql, [fraDireccionLegal.Provincia, sdqIngBrutConceptos.FieldByName('ib_codigo').AsString]) do
  begin
    edIBDescripcion.Text := FieldByName('ib_descripcion').AsString;
    edIBObservaciones.Text := FieldByName('ib_observaciones').AsString;
  end;
  end;
end;

function TfrmManPrestador.Es_UnidadBioquimica(sNomenclador, sCapitulo,sCodigo: string): boolean;
begin
  Result := False;
  if ValorSqlExtended('SELECT on_unidadbioquimica FROM art.son_nomenclador ' +
                      ' WHERE on_nomenclador = ' + SqlValue(sNomenclador) +
                        ' AND on_capitulo = ' + SqlValue(sCapitulo) +
                        ' AND on_codigo = ' + SqlValue(sCodigo)) > 0  then
    Result := True;
end;

procedure TfrmManPrestador.GridReplicarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    GridReplicar.Canvas.FillRect(Rect);
    Check := 0;

    if RegSelecReplicar.IndexOf(sdqReplicar.FieldByName('vp_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(GridReplicar.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmManPrestador.GridReplicarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridReplicarCellClick(GridReplicar.ColumnByField['CHECKBOX']);
    //
end;

procedure TfrmManPrestador.GridReplicarCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if RegSelecReplicar.IndexOf(sdqReplicar.FieldByName('vp_id').AsString) > -1 then
      RegSelecReplicar.Delete(RegSelecReplicar.IndexOf(sdqReplicar.FieldByName('vp_id').AsString))
    else
      RegSelecReplicar.Add(sdqReplicar.FieldByName('vp_id').AsString);
    GridReplicar.Repaint;
  end;
end;

function TfrmManPrestador.HayRegistroActivo :Boolean;
begin
  Result := sdqReplicar.Active and not sdqReplicar.IsEmpty;
end;

procedure TfrmManPrestador.GridReplicarUMGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if RegSelecReplicar.IndexOf(sdqReplicar.FieldByName('vp_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;

procedure TfrmManPrestador.Button6Click(Sender: TObject);
begin
  Verificar(RegSelecReplicar.Count = 0, GridReplicar, 'Debe seleccionar algún registro');
  fpReplicar.ModalResult := mrOK;
end;

procedure TfrmManPrestador.LimpiarViaticos;
begin
  edViaticoKM.Clear;
  edFechaViaticoKM.Clear;
  edViaticoEstadia.Clear;
  edFechaViaticoEstadia.Clear;
  edViaticoGastoEnvio.Clear;
  edFechaViaticoGastoEnvio.Clear;
end;

procedure TfrmManPrestador.chkViaticoClick(Sender: TObject);
begin
  if chkViatico.Checked then
  begin
    LimpiarViaticos;
    vclextra.LockControls([edViaticoKM, edFechaViaticoKM, edViaticoEstadia, edFechaViaticoEstadia, edViaticoGastoEnvio, edFechaViaticoGastoEnvio]);
  end
  else
    vclextra.LockControls([edViaticoKM, edFechaViaticoKM, edViaticoEstadia, edFechaViaticoEstadia, edViaticoGastoEnvio, edFechaViaticoGastoEnvio], false);
end;

procedure TfrmManPrestador.tbSICClick(Sender: TObject);
begin
  Verificar(fraPrestadorSel.IsEmpty, fraPrestadorSel, 'Debe seleccionar un prestador.');
  DoMostrarEventosAgendaPrestador(fraPrestadorSel.IDPrestador);
end;

function TfrmManPrestador.ValidarViaticosyEstudios: boolean;
begin
  ValidarViaticosyEstudios := true;
  if (edViaticoKM.Value = 0) and (edFechaViaticoKM.Date = 0) and (edViaticoEstadia.Value = 0) and
     (edFechaViaticoEstadia.Date = 0) and (edViaticoGastoEnvio.Value = 0) and (edFechaViaticoGastoEnvio.Date = 0) and
     (not tieneValores) and (chkViatico.Checked = false) then
    ValidarViaticosyEstudios := false;
end;

procedure TfrmManPrestador.tbEliminarVigAMPClick(Sender: TObject);
var ssql: string;
begin

  if MsgBox('Se va a eliminar la vigencia. Desea Continuar?', MB_YESNO + MB_ICONQUESTION) = mrYes then
  try
    BeginTrans;
    ssql := ' update comunes.cpd_prestadorestudio ' +
            '    set pd_fechabaja = trunc(sysdate), ' +
            '        pd_usubaja = :usu ' +
             ' where pd_id = :id ';

    EjecutarSqlStEx(ssql, [Sesion.UserID, sdqValoresPrestador.FieldByName('pd_id').AsInteger]);

    ssql := ' UPDATE comunes.cpd_prestadorestudio ' +
               ' SET pd_vigenciahasta = NULL, ' +
                   ' pd_usumodif = :usu, ' +
                   ' pd_fechamodif = trunc(sysdate) ' +
             ' WHERE pd_idprestador = :pres ' +
               ' AND pd_idestudio = :est ' +
               ' AND pd_idtipovalor = :tvalor ' +
               ' AND pd_fechabaja IS NULL ' +
               ' AND pd_vigenciadesde = ' +
                      ' (SELECT MAX (pd_vigenciadesde) ' +
                         ' FROM comunes.cpd_prestadorestudio ' +
                         ' WHERE pd_idprestador = :pres ' +
                         ' AND pd_idestudio = :est ' +
                         ' AND pd_idtipovalor = :tvalor ' +
                         ' AND pd_fechabaja IS NULL) ';

    EjecutarSqlSTEx(ssql, [sesion.UserID, sdqValoresPrestador.FieldByName('ca_identificador').AsString,
                           sdqValoresPrestador.FieldByName('es_codigo').AsString,
                           sdqValoresPrestador.FieldByName('pd_idtipovalor').AsString,
                           sdqValoresPrestador.FieldByName('ca_identificador').AsInteger,
                           sdqValoresPrestador.FieldByName('es_codigo').AsString,
                           sdqValoresPrestador.FieldByName('pd_idtipovalor').AsString]);
    CommitTrans;
  except
    on e: exception do
    begin
      Rollback;
      msgbox('Error:' + e.message);
    end;
  end;

  sdqValoresPrestador.Refresh;

end;

procedure TfrmManPrestador.tbEliminarVigClick(Sender: TObject);
var ssql: string; seguir: boolean;
begin
  seguir := true;
  ssql := ' select max(vp_vigenciadesde) ' +
            ' from art.svp_valorprestador ' +
           ' where vp_prestador = :pres and vp_nomenclador = :nom ' +
             ' and vp_capitulo = :cap and vp_codigo = :cod ' +
             ' and vp_fechabaja is null ';

  if ValorSqlEx(ssql, [sdqValNomenclador.FieldByName('vp_prestador').AsInteger,
                       sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                       sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                       sdqValNomenclador.FieldByName('vp_codigo').AsString]) <> sdqValNomenclador.FieldByName('vp_vigenciadesde').AsString then
  begin
    InvalidHint(tbEliminarVig, 'Sólo se puede eliminar la última vigencia');
    seguir := false;
  end;

  ssql := ' SELECT 1 ' +
            ' FROM art.siv_itemvolante, art.svo_volantes, art.svp_valorprestador ' +
           ' WHERE iv_volante = vo_volante ' +
             ' AND vo_prestador = :prestador ' +
             ' AND iv_fecpresta BETWEEN to_date(:VIGDESDE, ''dd/mm/yyyy'') AND NVL(to_date(:VIGHASTA, ''dd/mm/yyyy''), ACTUALDATE) ' +
             ' AND iv_estado NOT IN (''X'', ''Z'') ' +
             ' AND vp_prestador = vo_prestador ' +
             ' AND vp_nomenclador = iv_pres_nomenclador ' +
             ' AND vp_capitulo = iv_pres_capitulo ' +
             ' AND vp_codigo = iv_pres_codigo ' +
             ' AND vp_nomenclador = :nom ' +
             ' AND vp_capitulo = :cap ' +
             ' AND vp_codigo = :cod ' +
             ' AND vp_fechabaja IS NULL ';

  if (seguir = true) and (ExisteSqlEx(ssql, [sdqValNomenclador.FieldByName('vp_prestador').AsInteger,
                       sdqValNomenclador.FieldByName('vp_vigenciadesde').AsString,
                       sdqValNomenclador.FieldByName('vigenciahasta').AsString,
                       sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                       sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                       sdqValNomenclador.FieldByName('vp_codigo').AsString])) then
  begin
    InvalidHint(tbEliminarVig, 'Existen volantes liquidados con este valor, no se puede eliminar');
    seguir := false;
  end;

  ssql := ' SELECT 1 ' +
          ' FROM art.svg_vol_generico, art.svo_volantes, art.svp_valorprestador ' +
         ' WHERE vg_volante = vo_volante ' +
           ' AND vo_prestador = :prestador ' +
           ' AND vg_prestadesde BETWEEN to_date(:VIGDESDE, ''dd/mm/yyyy'') AND NVL(to_date(:VIGHASTA, ''dd/mm/yyyy''), ACTUALDATE) ' +
           ' AND vg_estado NOT IN (''X'', ''Z'') ' +
           ' AND vp_prestador = vo_prestador ' +
           ' AND vp_nomenclador = vg_pres_nomenclador ' +
           ' AND vp_capitulo = vg_pres_capitulo ' +
           ' AND vp_codigo = vg_pres_codigo ' +
           ' AND vp_nomenclador = :nom ' +
           ' AND vp_capitulo = :cap ' +
           ' AND vp_codigo = :cod ' +
           ' AND vp_fechabaja IS NULL ';

  if (seguir = true) and (ExisteSqlEx(ssql, [sdqValNomenclador.FieldByName('vp_prestador').AsInteger,
                       sdqValNomenclador.FieldByName('vp_vigenciadesde').AsString,
                       sdqValNomenclador.FieldByName('vigenciahasta').AsString,
                       sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                       sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                       sdqValNomenclador.FieldByName('vp_codigo').AsString])) then
  begin
    InvalidHint(tbEliminarVig, 'Existen volantes liquidados con este valor, no se puede eliminar');
    seguir := false;
  end;

  ssql := ' SELECT 1 ' +
            ' FROM art.sau_autorizaciones, art.svp_valorprestador, art.son_nomenclador ' +
           ' WHERE NVL(au_identifapro, au_identifprestador) = vp_prestador ' +
             ' AND vp_prestador = :prestador ' +
             ' AND on_id = vp_idnomenclador ' +
             ' AND au_estado IN (''A'', ''C'', ''E'') ' +
             ' AND au_fechasoli BETWEEN to_date(:VIGDESDE, ''dd/mm/yyyy'') AND NVL(to_date(:VIGHASTA, ''dd/mm/yyyy''), ACTUALDATE) ' +
             ' AND au_pres_nomenclador = vp_nomenclador ' +
             ' AND au_pres_capitulo = vp_capitulo ' +
             ' AND au_pres_codigo = vp_codigo ' +
             ' AND vp_nomenclador = :nom ' +
             ' AND vp_capitulo = :cap ' +
             ' AND vp_codigo = :cod ' +
             ' AND vp_fechabaja IS NULL ';

  if (seguir = true) and (ExisteSqlEx(ssql, [sdqValNomenclador.FieldByName('vp_prestador').AsInteger,
                       sdqValNomenclador.FieldByName('vp_vigenciadesde').AsString,
                       sdqValNomenclador.FieldByName('vigenciahasta').AsString,
                       sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                       sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                       sdqValNomenclador.FieldByName('vp_codigo').AsString])) then
  begin
    InvalidHint(tbEliminarVig, 'Existen autorizaciones; no se puede eliminar');
    seguir := false;
  end;

  if (seguir = true) and (msgbox('Se va a eliminar la vigencia actual. Desea Continuar?', MB_YESNO + MB_ICONQUESTION) = mrYes) then
  begin
    try
      BeginTrans;

      ssql := ' UPDATE art.svp_valorprestador ' +
                 ' SET vp_usubaja = :usu, ' +
                 '     vp_fechabaja = sysdate ' +
               ' WHERE vp_nomenclador = :nom ' +
                 ' AND vp_capitulo = :cap ' +
                 ' AND vp_codigo = :cod ' +
                 ' AND vp_prestador = :pres ' +
                 //' AND vp_vigenciahasta IS NULL ' +
                 ' AND vp_fechabaja IS NULL ' +
                 ' AND vp_vigenciadesde = ' +
                       ' (SELECT MAX (vp_vigenciadesde) ' +
                           ' FROM svp_valorprestador ' +
                           ' WHERE vp_nomenclador = :nom ' +
                           ' AND vp_capitulo = :cap ' +
                           ' AND vp_codigo = :cod ' +
                           ' AND vp_prestador = :pres ' +
                           ' AND vp_fechabaja IS NULL) ';;

      EjecutarSqlSTEx(ssql, [sesion.UserID, sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                             sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                             sdqValNomenclador.FieldByName('vp_codigo').AsString,
                             sdqValNomenclador.FieldByName('vp_prestador').AsInteger,
                             sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                             sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                             sdqValNomenclador.FieldByName('vp_codigo').AsString,
                             sdqValNomenclador.FieldByName('vp_prestador').AsInteger]);


      ssql := ' UPDATE svp_valorprestador ' +
                 ' SET vp_vigenciahasta = NULL, ' +
                     ' vp_usumodif = :usu, ' +
                     ' vp_fechamodif = trunc(sysdate) ' +
               ' WHERE vp_nomenclador = :nom ' +
                 ' AND vp_capitulo = :cap ' +
                 ' AND vp_codigo = :cod ' +
                 ' AND vp_prestador = :pres ' +
                 ' AND vp_fechabaja IS NULL ' +
                 ' AND vp_vigenciadesde = ' +
                        ' (SELECT MAX (vp_vigenciadesde) ' +
                           ' FROM svp_valorprestador ' +
                           ' WHERE vp_nomenclador = :nom ' +
                           ' AND vp_capitulo = :cap ' +
                           ' AND vp_codigo = :cod ' +
                           ' AND vp_prestador = :pres ' +
                           ' AND vp_fechabaja IS NULL) ';

      EjecutarSqlSTEx(ssql, [sesion.UserID, sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                             sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                             sdqValNomenclador.FieldByName('vp_codigo').AsString,
                             sdqValNomenclador.FieldByName('vp_prestador').AsInteger,
                             sdqValNomenclador.FieldByName('vp_nomenclador').AsString,
                             sdqValNomenclador.FieldByName('vp_capitulo').AsString,
                             sdqValNomenclador.FieldByName('vp_codigo').AsString,
                             sdqValNomenclador.FieldByName('vp_prestador').AsInteger]);

      CommitTrans;
      MsgBox('Vigencia Eliminada');
    except
      on E: exception do
      begin
        Rollback;
        ErrorMsg(E);
      end;
    end;
    sdqValNomenclador.Refresh;

  end;

end;

procedure TfrmManPrestador.chkContratoSocialABMClick(Sender: TObject);
begin
  if chkContratoSocialABM.Checked then
    vclextra.LockControl(dcContSoc, false)
  else
  begin
    dcContSoc.Clear;
    vclextra.LockControl(dcContSoc);
  end;
end;

procedure TfrmManPrestador.chkActaAutoridadesABMClick(Sender: TObject);
begin
  if chkActaAutoridadesABM.Checked then
    vclextra.LockControls([dcActaDesig], false)
  else
  begin
    dcActaDesig.Clear;
    vclextra.LockControls([dcActaDesig]);
  end;
end;

procedure TfrmManPrestador.OnDomicilioGISRemisChange(Sender: TObject);
begin
  {
  with fraDomicilioGISRemis do
    fraGISRemis.SearchAddress(Calle, Numero, Localidad, Provincia, CodigoPostal);
  }
end;

procedure TfrmManPrestador.tbAgregarBaseRemisClick(Sender: TObject);
begin
  ModoForm := fsAgregar;
  fraDomicilioGISRemis.Clear;
  //fraGISRemis.Clear;
  if fpBaseRemis.ShowModal = mrOk then OpenQueryEx(sdqBaseRemis, [fraPrestadorSel.IDPrestador]);
end;

procedure TfrmManPrestador.tbOrdenarBaseRemisClick(Sender: TObject);
begin
  sdBaseRemis.Execute;
end;

procedure TfrmManPrestador.tbExportarBaseRemisClick(Sender: TObject);
begin
  edlgBaseRemis.Execute;
end;

procedure TfrmManPrestador.tbImprimirBaseRemisClick(Sender: TObject);
begin
  ImpresionGrilla(qpBaseRemis);
end;

procedure TfrmManPrestador.tbEliminarBaseRemisClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqBaseRemis.Active and not(sdqBaseRemis.Eof) and
     MsgAsk('¿Esta seguro que desea eliminar la base de la remisería seleccionada?') then
  begin
    //Verificar(sdqContratosPC_VIGENCIAHASTA.IsNull, edVigenciaHastaCont,'No se puede eliminar el contrato activo.');
    try
      sSql := 'UPDATE amed.mbr_baseremis' +
                ' SET br_usubaja = :usuario,' +
                    ' br_fechabaja = actualdate' +
              ' WHERE br_id = :id';
      EjecutarSqlEx(sSql, [Sesion.UserID, sdqBaseRemis.FieldByName('br_id').AsInteger]);
      OpenQueryEx(sdqBaseRemis, [fraPrestadorSel.IDPrestador]);
    except
      on E:Exception do
        ErrorMsg(E, 'Error al eliminar el registro.');
    end;
  end;
end;

procedure TfrmManPrestador.sdqBaseRemisAfterOpen(DataSet: TDataSet);
begin
  VCLExtra.DynColWidthsByData(dbgRemis);
end;

procedure TfrmManPrestador.btnAceptarRemisClick(Sender: TObject);
var
  IdBaseRemis: Integer;
begin
  Verificar(fraDomicilioGISRemis.IsEmpty, fraDomicilioGISRemis, 'Debe indicar el domicilio de la remisería.');
  if not fraDomicilioGISRemis.GeoCodificar(True, 'O') then
    InfoHint(fraDomicilioGISRemis, 'No se pudo geocodificar la dirección de origen, verifíquela.', True);

  BeginTrans;
  try
    with TSql.Create('AMED.MBR_BASEREMIS') do
    try
      IdBaseRemis := ART_EMPTY_ID;

      Fields.Add('BR_LAT', fraDomicilioGISRemis.Coordenadas.Latitude);
      Fields.Add('BR_LNG', fraDomicilioGISRemis.Coordenadas.Longitude);

      Fields.Add('BR_CALLE', fraDomicilioGISRemis.Calle);
      Fields.Add('BR_NUMERO', fraDomicilioGISRemis.Numero);
      Fields.Add('BR_PISO', fraDomicilioGISRemis.Piso);
      Fields.Add('BR_DEPARTAMENTO', fraDomicilioGISRemis.Departamento);
      Fields.Add('BR_CPOSTAL', fraDomicilioGISRemis.CodigoPostal);
      Fields.Add('BR_CPOSTALA', fraDomicilioGISRemis.CPA);
      Fields.Add('BR_LOCALIDAD', fraDomicilioGISRemis.Localidad);
      Fields.Add('BR_PROVINCIA', fraDomicilioGISRemis.Prov);

      case ModoForm of
        fsAgregar:
        begin
          IdBaseRemis := GetSecNextVal('AMED.SEQ_MBR_ID');

          Fields.Add('BR_IDPRESTADOR', fraPrestadorSel.IDPrestador);
          Fields.Add('BR_FECHAALTA',   exDate);
          Fields.Add('BR_USUALTA',     Sesion.UserId);
          SqlType := stInsert;
        end;

        fsModificar:
        begin
          IdBaseRemis := sdqEmpresas.FieldByName('BR_ID').AsInteger;
          Fields.Add('BR_FECHAMODIF', exDate);
          Fields.Add('BR_USUMODIF',   Sesion.UserId);
          SqlType := stUpdate;
        end;

        fsEliminar:
        begin
          IdBaseRemis := sdqEmpresas.FieldByName('BR_ID').AsInteger;
          Fields.Add('BR_FECHABAJA', exDate);
          Fields.Add('BR_USUBAJA',   Sesion.UserId);
          SqlType := stUpdate;
        end;
      end;

      PrimaryKey.Add('BR_ID', IdBaseRemis);

      EjecutarSqlST(Sql);
    finally
      Free;
    end;
    CommitTrans;

    MsgBox('Los datos de la remisería se grabaron correctamente.' , MB_OK + MB_ICONINFORMATION);
    fpBaseRemis.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar los datos de la remisería.');
    end;
  end;
end;

procedure TfrmManPrestador.dbgRemisGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('BR_FECHABAJA').IsNull then
  begin
    AFont.Color := clRed;
    AFont.Style := [fsStrikeOut];
  end else
  begin
    AFont.Color := clBlack;
    AFont.Style := [];
  end;
end;

procedure TfrmManPrestador.edMailAdminExit(Sender: TObject);
var mail: string;
begin
  mail := EliminarEspacios(edMailAdmin.Text);
  if (midstr(mail, length(mail), 1) = ';') or (midstr(mail, length(mail), 1) = ',') then
    delete(mail, length(mail), 1);
  edMailAdmin.Text := mail;

end;

procedure TfrmManPrestador.cmbEspecialidadDropDown(Sender: TObject);
var sSql: String;
begin
  ssql := ' select es_codigo, es_descripcion ' +
            ' from mes_especialidades ' +
           ' where es_fechabaja is null ';
  sSql := ssql + ' and es_descripcion LIKE ''' + cmbEspecialidad.Text + SQL_WILLCARD + '''';
  OpenQuery(sdqDescEspecialidad, sSql, True);
end;

procedure TfrmManPrestador.tbNotifPresAprobClick(Sender: TObject);
var sSql, sDatosPrestador, sDatosPresupuesto, sDatosEmpresa, sCuerpo: string;
    bEnviar, bViatBonif: boolean; sdqAux: TSDQuery;
begin
  if MsgBox('Desea enviar la notificación?', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    sDatosEmpresa := '';
    sDatosPresupuesto := '';
    bEnviar := false;
    sSql := ' SELECT UPPER (es_descripcion) es_descripcion, pd_valor, ' +
                   ' NVL2 (pp_id, pp_vigenciadesde, pd_vigenciadesde) pd_vigenciadesde, ' +
                   ' NVL2 (pp_id, pp_vigenciahasta, pd_vigenciahasta) pd_vigenciahasta ' +
              ' FROM comunes.cpp_presupuestoprestador, ' +
                   ' comunes.cpd_prestadorestudio, ' +
                   ' art.cpr_prestador cpr, ' +
                   ' art.aes_estudios aes ' +
             ' WHERE pp_id = :idpresup ' +
               ' AND pd_idprestador = :idprest ' +
               ' AND pd_idpresupuesto = pp_id(+) ' +
               ' AND ca_identificador = pd_idprestador ' +
               ' AND es_codigo = pd_idestudio ' +
               ' AND pd_fechabaja IS NULL ' +

            ' UNION ' +

            ' SELECT UPPER (tv_descripcion) es_descripcion, pd_valor, ' +
                   ' NVL2 (pp_id, pp_vigenciadesde, pd_vigenciadesde) pd_vigenciadesde, ' +
                   ' NVL2 (pp_id, pp_vigenciahasta, pd_vigenciahasta) pd_vigenciahasta ' +
              ' FROM comunes.cpp_presupuestoprestador, ' +
                   ' comunes.cpd_prestadorestudio, ' +
                   ' art.cpr_prestador cpr, ' +
                   ' comunes.ctv_tipovalor tv ' +
             ' WHERE pp_id = :idpresup ' +
               ' AND pd_idprestador = :idprest ' +
               ' AND pd_idpresupuesto = pp_id(+) ' +
               ' AND pd_idtipovalor <> 1 ' +
               ' AND ca_identificador = pd_idprestador ' +
               ' AND tv.tv_id = pd_idtipovalor ' +
               ' AND pd_fechabaja IS NULL ';


    sDatosPrestador := 'Prestador' + chr(13) +
                       'ID: ' + sdqDatos.fieldbyname('ca_identificador').AsString + chr(13) +
                       'CUIT: ' + sdqDatos.fieldbyname('ca_clave').AsString + chr(13) +
                       'R. Social: ' + sdqDatos.fieldbyname('ca_descripcion').AsString + chr(13) + chr(13) + chr(13);

    {if sdqEmpresasPresupuestoAMP.FieldByName('PP_IDSOLICITUD').AsString <> '' then
      //sdqAux := sdqPresupDetalle
      sdqAux := sdqValoresPrestador
    else
      sdqAux := sdqValoresPrestador; }

    sdqAux := sdqValoresPrestador;

    with sdqAux do
    begin
      bViatBonif := ValorSqlEx('select pp_viaticosbonif from comunes.cpp_presupuestoprestador where pp_id = :idpresup',
                                    [sdqEmpresasPresupuestoAMP.FieldByName('PP_ID').AsInteger]) = 'S';
      First;
      sDatosPresupuesto := 'Presupuesto ' + cmbPresupuesto.text + chr(13);
      if (not Eof) or bViatBonif then
        bEnviar := true;

      while not Eof do
      begin
        sDatosPresupuesto := sDatosPresupuesto +
                             'Descripción: ' + fieldbyname('es_descripcion').AsString + chr(13) +
                             'Valor: ' + fieldbyname('pd_valor').AsString + chr(13) +
                             'Vig. Desde: ' + fieldbyname('pd_vigenciadesde').AsString + chr(13) +
                             'Vig. Hasta: ' + fieldbyname('pd_vigenciahasta').AsString + chr(13) + chr(13);
        Next;
      end;

      if bViatBonif then
        sDatosPresupuesto := sDatosPresupuesto + 'Viáticos Bonificados' + chr(13);
        
      sDatosPresupuesto := sDatosPresupuesto + chr(13);
    end;

    sdqEmpresasPresupuestoAMP.First;
    while not sdqEmpresasPresupuestoAMP.Eof do
    begin
      sDatosEmpresa := sDatosEmpresa +
                       'Empresa' + chr(13) +
                       'CUIT: ' + sdqEmpresasPresupuestoAMP.FieldByName('em_cuit').AsString + chr(13) +
                       'Nombre: ' + sdqEmpresasPresupuestoAMP.FieldByName('em_nombre').AsString + chr(13) +
                       'Establecim.: ' + sdqEmpresasPresupuestoAMP.FieldByName('es_nroestableci').AsString + ' - ' +
                                         sdqEmpresasPresupuestoAMP.FieldByName('es_nombre').AsString + chr(13) +
                       'Contrato: ' + sdqEmpresasPresupuestoAMP.FieldByName('es_contrato').AsString + chr(13) +
                       'Localidad: ' + sdqEmpresasPresupuestoAMP.FieldByName('es_localidad').AsString + chr(13) + chr(13);

      sdqEmpresasPresupuestoAMP.Next;
    end;

    sCuerpo := 'Se ha aprobado un presupuesto' + chr(13) + chr(13) + chr(13) +
                sDatosPrestador + sDatosPresupuesto + sDatosEmpresa;

    if bEnviar then
      EnviarMailBD(Get_DireccionesEnvioMail('PRESAP'), 'Presupuesto Aprobado', [oBodyIsRTF], sCuerpo, nil, 0, tcDefault, true)
    else
      InfoHint(tbNotifPresAprob, 'No hay datos para enviar');

  end;
end;


procedure TfrmManPrestador.btnConsultorioClick(Sender: TObject);    // TK 48426
begin
  fpConsultorio.ShowModal;
end;

procedure TfrmManPrestador.btnCerrarConsultorioClick(Sender: TObject);
begin
  fpConsultorio.ModalResult := mrCancel;
end;

procedure TfrmManPrestador.btnGuardarConsultorioClick(Sender: TObject);
begin
  Verificar(chkConsultorio.Checked and fraDelegacion.IsEmpty, fraDelegacion, 'Debe completar la Delegación');

  if ((not chkConsultorio.Checked) and (msgbox('Al dejar en blanco Consultorio-Delegación, se guardara en blanco dicha relación con el Prestador. ¿Desea Continuar?', MB_YESNO + MB_ICONEXCLAMATION) = mrYes))
     OR ((chkConsultorio.Checked) and (not fraDelegacion.IsEmpty)) then
  begin
    Do_GuardarConsultorioDelegacion(fraPrestadorSel.IDPrestador, chkConsultorio.Checked, fraDelegacion.Value);
    fpConsultorio.ModalResult := mrOk;
  end;
end;

procedure TfrmManPrestador.tbSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmManPrestador.fpConsultorioBeforeShow(Sender: TObject);    // TK 48426
var sSql: string;
begin
  sSql := 'SELECT CA_CONSULTORIO, CA_DELEGACION FROM ART.CPR_PRESTADOR ' +       // lo hago con esta consulta y  no con los campos persistentes porque sino al modificar me traería el valor anterior y no el que recién se modifico... y lleva a confusión (aunque no sea un error).
          ' WHERE CA_IDENTIFICADOR = :idprest ';
  with GetQueryEx(sSQL, [fraPrestadorSel.IDPrestador]) do
  try
    chkConsultorio.Checked := (FieldByName('CA_CONSULTORIO').AsString = 'S');
    fraDelegacion.Value    := FieldByName('CA_DELEGACION').AsString;
    fraDelegacion.Enabled  := chkConsultorio.Checked;
  finally
    Free;
  end;
end;

procedure TfrmManPrestador.chkConsultorioClick(Sender: TObject);        // TK 48426
begin
  if not chkConsultorio.Checked then
  begin
    fraDelegacion.Clear;
    fraDelegacion.Enabled := False;
  end
  else
    fraDelegacion.Enabled := True;
  VclExtra.LockControls([fraDelegacion], not chkConsultorio.Checked);
end;

procedure TfrmManPrestador.Do_GuardarConsultorioDelegacion(iIdPrest: integer; bConsultorioChequeado: boolean; sCodDelegacion: string);
var sSql, sConsult, sDeleg :string;
begin
  sConsult := iif(bConsultorioChequeado, 'S', 'N');
  sDeleg   := iif(sCodDelegacion = '', 'NULL', SqlValue(sCodDelegacion));

  sSql := 'UPDATE ART.CPR_PRESTADOR ' +
            ' SET CA_CONSULTORIO = ' + SqlValue(sConsult) + ',' +
                ' CA_DELEGACION = ' + sDeleg +
          ' WHERE CA_IDENTIFICADOR = ' + SqlValue(iIdPrest);
  try
    EjecutarSql(sSql);
  except
    on E: Exception do
      ErrorMsg(E, 'Error al intentar guardar los datos de Consultorio.');
  end;
end;

procedure TfrmManPrestador.mnuVisualizarValoresAlta_DatosMedClick(Sender: TObject);  // TK 48522
begin
  mnuVisualizarValoresAlta_DatosMed.Checked  := true;
  mnuVisualizarTodosValores_DatosMed.Checked := false;

  sdqEspecialidades.Close;
  sdqEspecialidades.Sql.Text := cSQL_Especialidad +
                                ' AND pe_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador) +
                                ' AND pe_fechabaja IS NULL ';
  sdqEspecialidades.Open;
end;

procedure TfrmManPrestador.mnuVisualizarTodosValores_DatosMedClick(Sender: TObject);  // TK 48522
begin
  mnuVisualizarValoresAlta_DatosMed.Checked  := false;
  mnuVisualizarTodosValores_DatosMed.Checked := true;

  sdqEspecialidades.Close;
  sdqEspecialidades.Sql.Text := cSQL_Especialidad +
                                ' AND pe_prestador = ' + SqlValue(fraPrestadorSel.IDPrestador);
  sdqEspecialidades.Open;
end;

procedure TfrmManPrestador.mnuRepVMSelecTodoClick(Sender: TObject);
var i: integer;
begin
  if mnuRepVMSelecTodo.Checked = false then
  begin
    mnuRepVMSelecTodo.Checked := true;
    sdqReplicar.First;
    for i := 0 to sdqReplicar.RecordCount - 1 do
    begin
      GridReplicarCellClick(GridReplicar.ColumnByField['CHECKBOX']);
      sdqReplicar.Next;
    end
  end
  else
  begin
    mnuRepVMSelecTodo.Checked := false;
    RegSelecReplicar.Clear;
    GridReplicar.Repaint;
  end;
  
end;

procedure TfrmManPrestador.GridReplicarUMDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    GridReplicarUM.Canvas.FillRect(Rect);
    Check := 0;

    if RegSelecReplicarUM.IndexOf(sdqReplicarUM.FieldByName('up_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(GridReplicarUM.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmManPrestador.GridReplicarUMKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridReplicarUMCellClick(GridReplicarUM.ColumnByField['CHECKBOX']);
    //
end;

procedure TfrmManPrestador.GridReplicarUMCellClick(Column: TColumn);
begin
  if HayRegistroActivoRepUM and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if RegSelecReplicarUM.IndexOf(sdqReplicarUM.FieldByName('up_id').AsString) > -1 then
      RegSelecReplicarUM.Delete(RegSelecReplicarUM.IndexOf(sdqReplicarUM.FieldByName('up_id').AsString))
    else
      RegSelecReplicarUM.Add(sdqReplicarUM.FieldByName('up_id').AsString);
    GridReplicarUM.Repaint;
  end;
end;

function TfrmManPrestador.HayRegistroActivoRepUM :Boolean;
begin
  Result := sdqReplicarUM.Active and not sdqReplicarUM.IsEmpty;
end;

procedure TfrmManPrestador.mnuRepUMSelecTodoClick(Sender: TObject);
var i: integer;
begin
  if mnuRepUMSelecTodo.Checked = false then
  begin
    mnuRepUMSelecTodo.Checked := true;
    sdqReplicarUM.First;
    for i := 0 to sdqReplicarUM.RecordCount - 1 do
    begin
      GridReplicarUMCellClick(GridReplicarUM.ColumnByField['CHECKBOX']);
      sdqReplicarUM.Next;
    end
  end
  else
  begin
    mnuRepUMSelecTodo.Checked := false;
    RegSelecReplicarUM.Clear;
    GridReplicarUM.Repaint;
  end;
end;

procedure TfrmManPrestador.btnAceptarRepUMClick(Sender: TObject);
begin
  Verificar(RegSelecReplicarUM.Count = 0, GridReplicarUM, 'Debe seleccionar algún registro');
  fpReplicarUM.ModalResult := mrOK;
end;

procedure TfrmManPrestador.btnAcepratSucClick(Sender: TObject);
begin
  verificar(trim(edNombreSuc.Text) = '', edNombreSuc, 'Debe ingresar el nombre de la sucursal');
  verificar(trim(fraDireccionSuc.cmbCalle.Text) = '', fraDireccionSuc.cmbCalle, 'Debe completar la dirección de la sucursal');
  verificar(trim(fraDireccionSuc.edNumero.Text) = '', fraDireccionSuc.edNumero, 'Debe completar la dirección de la sucursal');
  verificar(trim(fraDireccionSuc.edCPostal.Text) = '', fraDireccionSuc.edCPostal, 'Debe completar la dirección de la sucursal');
  verificar(trim(fraDireccionSuc.cmbLocalidad.Text) = '', fraDireccionSuc.cmbLocalidad, 'Debe completar la dirección de la sucursal');
  verificar((edMailSuc.Text <> '') and (not IsEMail(edMailSuc.Text)), edMailSuc, 'Dirección de e-mail incorrecta');
  fpSucursales.ModalResult := mrOK;
end;

procedure TfrmManPrestador.tbAgregarSucClick(Sender: TObject);
var ssql: string;
begin
  ModoForm := fsAgregar;
  if fpSucursales.ShowModal = mrOK then
  begin
   ssql := ' INSERT INTO SIN.ssp_sucursalesprestador (sp_idprestador, sp_nombre, sp_calle, sp_numero, sp_piso, ' +
                       ' sp_departamento, sp_codpostal, sp_codpostala, sp_localidad, sp_provincia, sp_telefono, ' +
                       ' sp_contacto, sp_mail, sp_fechaalta, sp_usualta) ' +
                ' VALUES (:sp_idprestador, initcap(:sp_nombre), :sp_calle, :sp_numero, :sp_piso, ' +
                       ' :sp_departamento, :sp_codpostal, :sp_codpostala, :sp_localidad, :sp_provincia, :sp_telefono, ' +
                       ' initcap(:sp_contacto), :sp_mail, trunc(sysdate), :sp_usualta) ';
   EjecutarSqlEx(ssql, [fraPrestadorSel.IDPrestador, edNombreSuc.Text, fraDireccionSuc.cmbCalle.Text,
                        fraDireccionSuc.edNumero.Text, fraDireccionSuc.edPiso.Text,
                        fraDireccionSuc.edDto.Text, fraDireccionSuc.edCPostal.Text, fraDireccionSuc.edCPA.Text,
                        fraDireccionSuc.cmbLocalidad.Text, fraDireccionSuc.Provincia, edTelSuc.Text, edContactoSuc.Text,
                        edMailSuc.Text, Sesion.UserID]);

   sdqSucursales.Refresh;
  end;

end;

procedure TfrmManPrestador.fpSucursalesShow(Sender: TObject);
begin
  if ModoForm = fsAgregar then
  begin
    edNombreSuc.Clear;
    fraDireccionSuc.cmbCalle.Clear;
    fraDireccionSuc.edNumero.Clear;
    fraDireccionSuc.edPiso.Clear;
    fraDireccionSuc.edDto.Clear;
    fraDireccionSuc.edCPostal.Clear;
    fraDireccionSuc.edCPA.Clear;
    fraDireccionSuc.cmbLocalidad.Clear;
    fraDireccionSuc.edProvincia.Clear;
    edTelSuc.Clear;
    edContactoSuc.Clear;
    edMailSuc.Clear;
  end
  else
  begin
    with sdqSucursales do
    begin
      edNombreSuc.Text := fieldbyname('sp_nombre').AsString;
      fraDireccionSuc.cmbCalle.Text := fieldbyname('sp_calle').AsString;
      fraDireccionSuc.edNumero.Text := fieldbyname('sp_numero').AsString;
      fraDireccionSuc.edPiso.Text := fieldbyname('sp_piso').AsString;
      fraDireccionSuc.edDto.Text := fieldbyname('sp_departamento').AsString;
      fraDireccionSuc.edCPostal.Text := fieldbyname('sp_codpostal').AsString;
      fraDireccionSuc.edCPA.Text := fieldbyname('sp_codpostala').AsString;
      fraDireccionSuc.cmbLocalidad.Text := fieldbyname('sp_localidad').AsString;
      fraDireccionSuc.Provincia := fieldbyname('sp_provincia').AsInteger;
      edTelSuc.Text := fieldbyname('sp_telefono').AsString;
      edContactoSuc.Text := fieldbyname('sp_contacto').AsString;
      edMailSuc.Text := fieldbyname('sp_mail').AsString;
    end;
  end;
end;

procedure TfrmManPrestador.tbEliminarSucClick(Sender: TObject);
var ssql: string;
begin
  if sdqSucursales.Active and not(sdqSucursales.Eof) and
     MsgAsk('¿Esta seguro que desea eliminar la sucursal seleccionada?') then
  begin
    try
      sSql := 'UPDATE SIN.ssp_sucursalesprestador ' +
                ' SET sp_usubaja = :usuario,' +
                    ' sp_fechabaja = actualdate ' +
              ' WHERE sp_id = :id';
      EjecutarSqlEx(sSql, [Sesion.UserID, sdqSucursales.FieldByName('sp_id').AsInteger]);
      sdqSucursales.Refresh;
    except
      on E:Exception do
        ErrorMsg(E, 'Error al eliminar el registro.');
    end;
  end;
end;

procedure TfrmManPrestador.tbModificarSucClick(Sender: TObject);
var ssql: string;
begin
  ModoForm := fsModificar;
  if fpSucursales.ShowModal = mrOK then
  begin
    ssql := ' UPDATE SIN.ssp_sucursalesprestador ' +
               ' SET sp_nombre = initcap(:sp_nombre), ' +
                   ' sp_calle = :sp_calle, ' +
                   ' sp_numero = :sp_numero, ' +
                   ' sp_piso = :sp_piso, ' +
                   ' sp_departamento = :sp_departamento, ' +
                   ' sp_codpostal = :sp_codpostal, ' +
                   ' sp_codpostala = :sp_codpostala, ' +
                   ' sp_localidad = :sp_localidad, ' +
                   ' sp_provincia = :sp_provincia, ' +
                   ' sp_telefono = :sp_telefono, ' +
                   ' sp_contacto = initcap(:sp_contacto), ' +
                   ' sp_mail = :sp_mail, ' +
                   ' sp_fechamodif = trunc(sysdate), ' +
                   ' sp_usumodif = :sp_usumodif ' +
             ' WHERE sp_id = :id ';

    EjecutarSqlEx(ssql, [edNombreSuc.Text, fraDireccionSuc.cmbCalle.Text,
                        fraDireccionSuc.edNumero.Text, fraDireccionSuc.edPiso.Text,
                        fraDireccionSuc.edDto.Text, fraDireccionSuc.edCPostal.Text, fraDireccionSuc.edCPA.Text,
                        fraDireccionSuc.cmbLocalidad.Text, fraDireccionSuc.Provincia, edTelSuc.Text, edContactoSuc.Text,
                        edMailSuc.Text, Sesion.UserID, sdqSucursales.FieldByName('sp_id').AsInteger]);

    sdqSucursales.Refresh;
  end;
end;

procedure TfrmManPrestador.tbOrdenarSucClick(Sender: TObject);
begin
  sdSucursales.Execute;  
end;

procedure TfrmManPrestador.tbExportarSucClick(Sender: TObject);
begin
  edSucursales.Execute;
end;

procedure TfrmManPrestador.tbImprimirSucClick(Sender: TObject);
begin
  ImpresionGrilla(qpSucursales);
end;

procedure TfrmManPrestador.tbFiltroEmpresaAMPClick(Sender: TObject);
begin
  fpFiltroEmpresaAMP.ShowModal;
end;

procedure TfrmManPrestador.btnAceptarFiltroEmpAMPClick(Sender: TObject);
var ssql, sCondiciones: string;
begin
  sCondiciones := '';
  ssql := cSqlBasePresupuesto;
  if not fraEmpresaFiltroAMP.IsEmpty then
    sCondiciones := ' AND em_cuit = ' + fraEmpresaFiltroAMP.CUIT;
  if not fraEstablecimientoFiltroAMP.IsEmpty then
    sCondiciones := sCondiciones + ' AND pp_idestablecimiento = ' + inttostr(fraEstablecimientoFiltroAMP.ID);

  Insert(sCondiciones, ssql, Pos('GROUP', UpperCase(ssql)) - 1);
  sdqPresupuestosAMP.Close;
  sdqPresupuestosAMP.SQL.Text := ssql;
  OpenQueryEx(sdqPresupuestosAMP, [fraPrestadorSel.IDPrestador]);

end;


procedure TfrmManPrestador.OnEmpresaFiltroAMPChange(sender: tobject);
begin
  fraEstablecimientoFiltroAMP.Contrato := fraEmpresaFiltroAMP.Contrato;
end;

procedure TfrmManPrestador.tbLimpiarPresupuestoAMPClick(Sender: TObject);
begin
  sdqPresupuestosAMP.Close;
  sdqPresupuestosAMP.SQL.Text := cSqlBasePresupuesto;
  OpenQueryEx(sdqPresupuestosAMP, [fraPrestadorSel.IDPrestador]);
  fraEmpresaFiltroAMP.Clear;
  fraEstablecimientoFiltroAMP.Clear;
end;

procedure TfrmManPrestador.tbEliminarVigUMClick(Sender: TObject);
var ssql: string; seguir: boolean;
begin
  seguir := true;
  ssql := ' select max(up_vigenciadesde) ' +
            ' from art.sup_unidadprestador ' +
           ' where up_prestador = :pres and up_unidad = :uni ' +
            '  and up_fechabaja is null ';

  if ValorSqlEx(ssql, [SDQVUMed.FieldByName('up_prestador').AsInteger,
                       SDQVUMed.FieldByName('up_unidad').AsString]) <> SDQVUMed.FieldByName('up_vigenciadesde').AsString then
  begin
    InvalidHint(tbEliminarVig, 'Sólo se puede eliminar la última vigencia');
    seguir := false;
  end;

  ssql := 'SELECT 1' +
          '  FROM ART.CTB_TABLAS, ART.SON_NOMENCLADOR, ART.SUP_UNIDADPRESTADOR A, ART.SUP_UNIDADPRESTADOR B, SVO_VOLANTES,' +
          '       ART.SIV_ITEMVOLANTE' +
          ' WHERE ON_TIPOHONORARIO = A.UP_UNIDAD' +
          '   AND ON_TIPOGASTO = B.UP_UNIDAD' +
          '   AND A.UP_UNIDAD = :UNIDAD' +
          '   AND TB_CLAVE = ''TNOME''' +
          '   AND ON_CAPITULO = TB_CODIGO' +
          '   AND SUBSTR (TB_ESPECIAL1, 1, 1) = ''S''' +
          '   AND (NVL (ON_HONORARIOS, 0) + NVL (ON_GASTOS, 0) > 0)' +
          '   AND A.UP_PRESTADOR = :PREST' +
          '   AND A.UP_PRESTADOR = B.UP_PRESTADOR' +
          '   AND ON_FECHABAJA IS NULL' +
          '   AND IV_PRES_NOMENCLADOR = ON_NOMENCLADOR' +
          '   AND IV_PRES_CAPITULO = ON_CAPITULO' +
          '   AND IV_PRES_CODIGO = ON_CODIGO' +
          '   AND VO_VOLANTE = IV_VOLANTE' +
          '   AND IV_FECPRESTA BETWEEN to_date(:VIGDESDE, ''dd/mm/yyyy'') AND NVL(to_date(:VIGHASTA, ''dd/mm/yyyy''), ACTUALDATE)' +
          '   AND IV_ESTADO NOT IN (''X'', ''Z'')' +
          '   AND A.UP_FECHABAJA IS NULL' +
          '   AND B.UP_FECHABAJA IS NULL' +
          '   AND a.up_prestador = vo_prestador ';

  if (seguir = true) and (ExisteSqlEx(ssql, [SDQVUMed.FieldByName('up_unidad').AsInteger,
                                             SDQVUMed.FieldByName('up_prestador').AsInteger,
                                             SDQVUMed.FieldByName('up_vigenciadesde').AsString,
                                             SDQVUMed.FieldByName('up_vigenciahasta').AsString])) then
  begin
    InvalidHint(tbEliminarVig, 'Existen volantes liquidados con este valor, no se puede eliminar');
    seguir := false;
  end;

  ssql := 'SELECT 1' +
          '  FROM ART.CTB_TABLAS, ART.SON_NOMENCLADOR, ART.SUP_UNIDADPRESTADOR A, ART.SUP_UNIDADPRESTADOR B, SVO_VOLANTES,' +
          '       ART.SVG_VOL_GENERICO' +
          ' WHERE ON_TIPOHONORARIO = A.UP_UNIDAD' +
          '   AND ON_TIPOGASTO = B.UP_UNIDAD' +
          '   AND A.UP_UNIDAD = :UNIDAD' +
          '   AND TB_CLAVE = ''TNOME''' +
          '   AND ON_CAPITULO = TB_CODIGO' +
          '   AND SUBSTR (TB_ESPECIAL1, 1, 1) = ''S''' +
          '   AND (NVL (ON_HONORARIOS, 0) + NVL (ON_GASTOS, 0) > 0)' +
          '   AND A.UP_PRESTADOR = :PREST' +
          '   AND A.UP_PRESTADOR = B.UP_PRESTADOR' +
          '   AND ON_FECHABAJA IS NULL' +
          '   AND VG_PRES_NOMENCLADOR = ON_NOMENCLADOR' +
          '   AND VG_PRES_CAPITULO = ON_CAPITULO' +
          '   AND VG_PRES_CODIGO = ON_CODIGO' +
          '   AND VO_VOLANTE = VG_VOLANTE' +
          '   AND VG_PRESTADESDE BETWEEN to_date(:VIGDESDE, ''dd/mm/yyyy'') AND NVL(to_date(:VIGHASTA, ''dd/mm/yyyy''), ACTUALDATE)' +
          '   AND VG_ESTADO NOT IN (''X'', ''Z'')' +
          '   AND A.UP_FECHABAJA IS NULL' +
          '   AND B.UP_FECHABAJA IS NULL';

  if (seguir = true) and (ExisteSqlEx(ssql, [SDQVUMed.FieldByName('up_unidad').AsInteger,
                                             SDQVUMed.FieldByName('up_prestador').AsInteger,
                                             SDQVUMed.FieldByName('up_vigenciadesde').AsString,
                                             SDQVUMed.FieldByName('up_vigenciahasta').AsString])) then
  begin
    InvalidHint(tbEliminarVig, 'Existen volantes liquidados con este valor, no se puede eliminar');
    seguir := false;
  end;

  ssql := 'SELECT 1' +
          '  FROM ART.CTB_TABLAS, ART.SON_NOMENCLADOR, ART.SUP_UNIDADPRESTADOR A, ART.SUP_UNIDADPRESTADOR B,' +
          '       ART.SAU_AUTORIZACIONES' +
          ' WHERE ON_TIPOHONORARIO = A.UP_UNIDAD' +
          '   AND ON_TIPOGASTO = B.UP_UNIDAD' +
          '   AND A.UP_UNIDAD = :UNIDAD' +
          '   AND TB_CLAVE = ''TNOME''' +
          '   AND ON_CAPITULO = TB_CODIGO' +
          '   AND SUBSTR (TB_ESPECIAL1, 1, 1) = ''S''' +
          '   AND (NVL (ON_HONORARIOS, 0) + NVL (ON_GASTOS, 0) > 0)' +
          '   AND A.UP_PRESTADOR = :PREST' +
          '   AND A.UP_PRESTADOR = B.UP_PRESTADOR' +
          '   AND ON_FECHABAJA IS NULL' +
          '   AND AU_PRES_NOMENCLADOR = ON_NOMENCLADOR' +
          '   AND AU_PRES_CAPITULO = ON_CAPITULO' +
          '   AND AU_PRES_CODIGO = ON_CODIGO' +
          '   AND AU_FECHASOLI BETWEEN to_date(:VIGDESDE, ''dd/mm/yyyy'') AND NVL(to_date(:VIGHASTA, ''dd/mm/yyyy''), ACTUALDATE)' +
          '   AND AU_ESTADO IN (''A'', ''C'', ''E'')' +
          '   AND A.UP_FECHABAJA IS NULL' +
          '   AND B.UP_FECHABAJA IS NULL';

  if (seguir = true) and (ExisteSqlEx(ssql, [SDQVUMed.FieldByName('up_unidad').AsInteger,
                                             SDQVUMed.FieldByName('up_prestador').AsInteger,
                                             SDQVUMed.FieldByName('up_vigenciadesde').AsString,
                                             SDQVUMed.FieldByName('up_vigenciahasta').AsString])) then
  begin
    InvalidHint(tbEliminarVig, 'Existen autorizaciones; no se puede eliminar');
    seguir := false;
  end;

  if (seguir = true) and (msgbox('Se va a eliminar la vigencia actual. Desea Continuar?', MB_YESNO + MB_ICONQUESTION) = mrYes) then
  begin
    try
      BeginTrans;

      ssql := ' UPDATE art.sup_unidadprestador ' +
                 ' SET up_usubaja = :usu, ' +
                 '     up_fechabaja = sysdate ' +
               ' WHERE up_unidad = :unid ' +
                 ' AND up_prestador = :pres ' +
                 //' AND vp_vigenciahasta IS NULL ' +
                 ' AND up_fechabaja IS NULL ' +
                 ' AND up_vigenciadesde = ' +
                       ' (SELECT MAX (up_vigenciadesde) ' +
                           ' FROM art.sup_unidadprestador ' +
                           ' WHERE up_unidad = :unid ' +
                           ' AND up_prestador = :pres ' +
                           ' AND up_fechabaja IS NULL) ';

      EjecutarSqlSTEx(ssql, [sesion.UserID, SDQVUMed.FieldByName('up_unidad').AsInteger,
                                            SDQVUMed.FieldByName('up_prestador').AsInteger,
                                            SDQVUMed.FieldByName('up_unidad').AsInteger,
                                            SDQVUMed.FieldByName('up_prestador').AsInteger]);


      ssql := ' UPDATE art.sup_unidadprestador ' +
                 ' SET up_vigenciahasta = NULL, ' +
                     ' up_usumodif = :usu, ' +
                     ' up_fechamodif = trunc(sysdate) ' +
               ' WHERE up_unidad = :unid ' +
                 ' AND up_prestador = :pres ' +
                 ' AND up_fechabaja IS NULL ' +
                 ' AND up_vigenciadesde = ' +
                        ' (SELECT MAX (up_vigenciadesde) ' +
                           ' FROM art.sup_unidadprestador ' +
                          ' WHERE up_unidad = :unid ' +
                            ' AND up_prestador = :pres ' +
                            ' AND up_fechabaja IS NULL) ';

      EjecutarSqlSTEx(ssql, [sesion.UserID, SDQVUMed.FieldByName('up_unidad').AsInteger,
                                            SDQVUMed.FieldByName('up_prestador').AsInteger,
                                            SDQVUMed.FieldByName('up_unidad').AsInteger,
                                            SDQVUMed.FieldByName('up_prestador').AsInteger]);

      CommitTrans;
      MsgBox('Vigencia Eliminada');
    except
      on E: exception do
      begin
        Rollback;
        ErrorMsg(E);
      end;
    end;
    SDQVUMed.Refresh;

  end;

end;

procedure TfrmManPrestador.mnuRenAutoClick(Sender: TObject);
var ssql: string;
begin
  mnuRenAuto.Checked := true;
  mnuTodosContratos.Checked := false;
  ssql := FSQLContratos;
  AddCondition(ssql, ' NVL (pc_renovautomatica, ''N'') = ''S''');
  OpenQueryEx(sdqContratos, [fraPrestadorSel.IDPrestador], ssql);
end;

procedure TfrmManPrestador.mnuTodosContratosClick(Sender: TObject);
begin
  mnuRenAuto.Checked := false;
  mnuTodosContratos.Checked := true;
  OpenQueryEx(sdqContratos, [fraPrestadorSel.IDPrestador], FSQLContratos);

end;



procedure TfrmManPrestador.chkRespCivilABMClick(Sender: TObject);
begin
  VCLExtra.LockControls([cmbFechaRespCivilABM], (not chkRespCivilABM.Checked) or (Accion = None));

  if (not chkRespCivilABM.Checked) and (Accion <> None) then
    cmbFechaRespCivilABM.Clear;
end;

procedure TfrmManPrestador.chkhabilitadoABMClick(Sender: TObject);
begin
  VCLExtra.LockControls([cmbFechaVtoHabilitacionABM], (not chkhabilitadoABM.Checked) or (Accion = None));

  if (not chkhabilitadoABM.Checked) and (Accion <> None) then
    cmbFechaVtoHabilitacionABM.Clear;
end;


end.
