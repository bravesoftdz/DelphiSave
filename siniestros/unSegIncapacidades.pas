{-----------------------------------------------------------------------------
  Seguimiento de incapacidades (carga de eventos y demas..migrado de Siniestros I)
  Author:       CAMARILLO
  Date:         Agosto/2007
-----------------------------------------------------------------------------}

unit unSegIncapacidades;

interface                                                      

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, Mask, PatternEdit, DateTimeEditors, SinEdit, Buttons,
  FormPanel, unFraCodigoDescripcion, ToolEdit, DateComboBox, CurrEdit,
  unFraCodDesc, RxLookup, IntEdit, unFraTrabajadorSiniestro,
  unFraTrabajador, Menus, unFraSDA_DETALLEARCHIVO, JvExControls,
  JvComponent, JvXPCore, JvXPCheckCtrls, JvExExtCtrls, JvDBRadioPanel,
  unFraStaticCodigoDescripcion, unMoldeEnvioMail, unfraCPR_PRESTADOR,
  unFraCDG_DIAGNOSTICO, unFraStaticCodDesc, unClassLiquidacion,
  AdvOfficeButtons, RxToolEdit, JvExtComponent, JvExMask, JvToolEdit,
  RxPlacemnt, unWSTramitesMedicos, unCustomDataModule;

const
  PORC_RETROACMEDIO: Integer = 50;
  CANTCARACTERES_MINIMO_DOC = 2;
  COMISION_MENDOZA = '004';

  CODAREA_AREAMEDICA_MAIL = '1';  // TK 21336  estos codigos esta en la CTB_TABLAS tb_clave = 'AREAM'. Son sólo para este envio de mails.
  CODAREA_LEGALES_MAIL    = '2';
  CODAREA_PREVENCION_MAIL = '3';

  CODCARTADOC_PORCINCAP = 'IINC';
  CODCARTADOC_INC_C     = 'INC_C';   // TK 16166
  CODCARTADOC_INC_E     = 'INC_E';   // TK 42338
  CODCARTADOC_INC_D     = 'INC_D';   // TK 66201 - Plan Tramite medico
  CODCARTADOC_CITREVMED = 'CITJ';    // TK 24495
  CODCARTADOC_RECITINL  = 'REIN';    // TK 24495
  CODCARTADOC_TURESTCOM  = 'ESTCO';  // TK 25896
  MOTIVO_HOMOLOGACION   = '1';       // TK 16166
  MOTIVO_LEY24557       = '8';

  CODEVENTOREMITO_COMMED  = '250';
  CODEVENTOREMITO_OFHOMOL = '251';
  CODEVENTO_SOLTURNOSRT   = '171';     // TK 66089 (Plan Tramites Medicos 2015)
  CODEVENTO_SOLTURNOSRT_ACEPTADO = '172';
  CODEVENTO_SOLTURNOSRT_RECHAZADO = '173';
  CODEVENTO_SOLTURNOSRT_CITACION = '174';
  CODEVENTO_RESP_RECTIFICATORIA_DIC = '507';

  DEST_COMMED  = 'Sres. Comisión Médica';
  DEST_OFHOMOL = 'Sres. Oficina de Homologación';

  USU_MAILFIJOPLURI   = 'KSZEINKOP';

  TIPODEST_TRABAJADOR = 'T';     // TK 11473
  TIPODEST_EMPRESA    = 'E';
  CUIT_PRESIDENCIANACION = '30546660830';   // TK 20679

  DIR_ASOCIARARCHIVO = '\\ntintraweb\Storage_Data\Incapacidades\ArchivosAsociados\';  // TK 28452

  cTELPROVINCIAARTconAREA = '(011)48192800';
  cMAILINCAPACIDADES = 'incapacidades@provart.com.ar';
  cFIRMANTEFIXEL = '125';

type
  TAccion = (None, Alta , Edicion, Replica);

  TfrmSegIncapacidades = class(TfrmCustomConsulta)
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    grpSiniestro: TGroupBox;
    blSinFecha: TLabel;
    Label1: TLabel;
    pnlSiniestro: TPanel;
    sbtnBuscar: TSpeedButton;
    edSiniestro: TSinEdit;
    edEstadoRecCero: TEdit;
    edSinFecha: TDateEditor;
    grpTrabajador: TGroupBox;
    gbUbicacion: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    edDelegacion: TEdit;
    edGTrabajo: TEdit;
    gbGravedadTipo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edTipo: TEdit;
    edGravedad: TEdit;
    gbExpediente: TGroupBox;
    gbEventos: TGroupBox;
    rbEventosTodos: TRadioButton;
    rbEventosActivos: TRadioButton;
    edExpedIncap: TEdit;
    sdqBusqueda: TSDQuery;
    sdqBusquedaEX_SINIESTRO: TFloatField;
    sdqBusquedaEX_ORDEN: TFloatField;
    sdqBusquedaEX_RECAIDA: TFloatField;
    sdqBusquedaEX_DIAGNOSTICO: TStringField;
    sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField;
    sdqBusquedaTJ_CUIL: TStringField;
    sdqBusquedaTJ_NOMBRE: TStringField;
    sdqBusquedaEX_CUIT: TStringField;
    sdqBusquedaCA_IDENTIFICADOR: TFloatField;
    sdqBusquedaGTRABAJO: TStringField;
    sdqBusquedaDELEGACION: TStringField;
    sdqBusquedaEX_ESTADO: TStringField;
    sdqBusquedaEX_CAUSAFIN: TStringField;
    sdqBusquedaESTADO: TStringField;
    dsBusqueda: TDataSource;
    sdqBusquedaTIPOACC: TStringField;
    sdqBusquedaGRAVEDAD: TStringField;
    sdqBusquedaEX_ID: TFloatField;
    dsExpediente: TDataSource;
    sdqExpediente: TSDQuery;
    tbAutorizacion: TToolButton;
    ToolButton2: TToolButton;
    tbTotalesRegGrilla: TToolButton;
    tbCancelarAutor: TToolButton;
    gbDiagnostico: TGroupBox;
    edDiagnostico: TEdit;
    Label2: TLabel;
    edFechaAlta: TDateEditor;
    sdqBusquedaTJ_SEXO: TStringField;
    sdqBusquedaTJ_FNACIMIENTO: TDateTimeField;
    sdqBusquedaALTAMED: TDateTimeField;
    dsRecaidas: TDataSource;
    sdqRecaidas: TSDQuery;
    sdqRecaidasEX_RECAIDA: TFloatField;
    dsPapeleria: TDataSource;
    sdqPapeleria: TSDQuery;
    dsDictamenes: TDataSource;
    sdqDictamenes: TSDQuery;
    sdqBusquedaEX_TIPO: TStringField;
    sdqBusquedaEX_GRAVEDAD: TStringField;
    tbUsuarios: TToolButton;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    tbViajar: TToolButton;
    mnuViajar: TPopupMenu;
    mnuViajarLiquidaciones: TMenuItem;
    mnuViajarSiniestros: TMenuItem;
    sdqBusquedaCAUSAFIN: TStringField;
    tbNoLiquidar: TToolButton;
    ToolButton9: TToolButton;                                       
    GroupBox1: TGroupBox;
    lblPoseeDni: TLabel;
    lblPoseeRecSueldo: TLabel;
    Label38: TLabel;
    edEstadoRecMax: TEdit;
    gbEnfNoListada: TGroupBox;
    rpNL_MARCADO: TJvDBRadioPanel;
    sdqBusquedaNL_MARCADO: TStringField;
    sdqBusquedaEX_GTRABAJO: TStringField;
    tbExpediente: TToolButton;
    tbReplicarDict: TToolButton;
    chkEsPluriempleo: TCheckBox;
    Bevel14: TBevel;
    Bevel15: TBevel;
    sdqBusquedaEX_PLURIEMPLEO: TStringField;
    Label44: TLabel;
    chkPoseeCartasDoc: TCheckBox;
    Label45: TLabel;
    mnuViajarContCartasDoc: TMenuItem;
    btnRemitoExpedientes: TToolButton;
    tbSinAntCobIncap: TToolButton;
    ToolButton12: TToolButton;
    sdqSiniIncap: TSDQuery;
    dsSiniIncap: TDataSource;
    mnuVerDigitalizacion: TMenuItem;
    tbInsertarFechas: TToolButton;
    tbDigitalizar: TToolButton;
    ScrollBox1: TScrollBox;
    fpPrestadorEstComp: TFormPanel;
    Bevel10: TBevel;
    Label40: TLabel;
    Bevel11: TBevel;
    btnPrestadorAceptar: TBitBtn;
    fraPrestadorEstComp: TfraCPR_PRESTADOR;
    fpDigitalizar: TFormPanel;
    Bevel2: TBevel;
    btnDigAceptar: TBitBtn;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    fpFirmanteBaja: TFormPanel;
    Label37: TLabel;
    btnAceptarFirmante: TBitBtn;
    fraFirmanteBaja: TfraCodigoDescripcion;
    fpFechaDictamen: TFormPanel;
    Label33: TLabel;
    Bevel7: TBevel;
    btnAceptarAltaDict: TBitBtn;
    dcAltaDictamen: TDateComboBox;
    fpNotaEntregaReq: TFormPanel;
    Label32: TLabel;
    Bevel6: TBevel;
    btnAceptarNota: TBitBtn;
    dcNota: TDateComboBox;
    fpUsuarios: TFormPanel;
    Bevel3: TBevel;
    Label30: TLabel;
    Label31: TLabel;
    btnCerrarUsu: TBitBtn;
    edUsuAlta: TEdit;
    edUsuModif: TEdit;
    fpTextoNotaRectif: TFormPanel;
    Bevel9: TBevel;
    Label36: TLabel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    MemoTextoFijo: TMemo;
    memoTexto: TMemo;
    fpDictamenes: TFormPanel;
    Bevel4: TBevel;
    Label24: TLabel;
    btnAceptarDictamenes: TBitBtn;
    dgDictamenes: TArtDBGrid;
    edMotivoApelacion: TEdit;
    ScrollBox2: TScrollBox;
    fpFechaTopeLiquid: TFormPanel;
    Bevel16: TBevel;
    Label49: TLabel;
    btnCancelarFecTopeLiq: TBitBtn;
    btnAceptarFecTopeLiq: TBitBtn;
    dcFecTopeLiq: TDateComboBox;
    fpSeleccionRecaida: TFormPanel;
    lbSelRecaida: TLabel;
    Bevel8: TBevel;
    cmbRecaida: TRxDBLookupCombo;
    btnAceptarRecaida: TBitBtn;
    fpFecha2daCitacion: TFormPanel;
    Label41: TLabel;
    Label42: TLabel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Label43: TLabel;
    btnAceptarFec2daCit: TBitBtn;
    dcFecha2daCit: TDateComboBox;
    mskHora2daCit: TMaskEdit;
    fpImpRemitoExpedientes: TFormPanel;
    Bevel17: TBevel;
    Label46: TLabel;
    Label47: TLabel;
    btnAceptarRemitoExp: TBitBtn;
    dcFechaEventoRemito: TDateComboBox;
    edUsuarioAltaEventoRemito: TEdit;
    btnCancelarRemitoExp: TBitBtn;
    fpSiniIncap: TFormPanel;
    Label48: TLabel;
    btnCerrarSiniIncap: TBitBtn;
    ArtDBGrid_SiniIncap: TArtDBGrid;
    fpTipoCarta: TFormPanel;
    rgTipoCarta: TRadioGroup;
    btnAceptarCarta: TBitBtn;
    fpExpediente: TFormPanel;
    gbDatosExp: TGroupBox;
    Label5: TLabel;
    Label22: TLabel;
    edSiniestroExp: TSinEdit;
    edExpedIncapABM: TEdit;
    btnGuardarExped: TBitBtn;
    btnCerrarExped: TBitBtn;
    btnAceptarExped: TBitBtn;
    dgExpediente: TArtDBGrid;
    gbBaja: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    dcBajaExped: TDateComboBox;
    edMotivoBaja: TEdit;
    btnBajaExp: TBitBtn;
    sbEvento: TScrollBox;
    fpEventos: TFormPanel;
    gbDatosEvento: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Hora: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Bevel5: TBevel;
    Label21: TLabel;
    Label23: TLabel;
    Bevel1: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label39: TLabel;
    lblNiegaFirmarIncap: TLabel;
    edSiniestroABM: TSinEdit;
    dcFecha: TDateComboBox;
    dcFechaVencim: TDateComboBox;
    fraMotivo: TfraCodigoDescripcion;
    fraComMedica: TfraCodigoDescripcion;
    fraMedico: TfraCodigoDescripcion;
    fraUbicIncap: TfraCodigoDescripcion;
    gbGrado: TGroupBox;
    rbParcial: TRadioButton;
    rbTotal: TRadioButton;
    gbCaracter: TGroupBox;
    rbProvisorio: TRadioButton;
    rbDefinitivo: TRadioButton;
    chkGranInvalidez: TCheckBox;
    chkTratamiento: TCheckBox;
    chkRetroactivo: TCheckBox;
    chkRecalificacion: TCheckBox;
    chkEstudios: TCheckBox;
    chkReingreso: TCheckBox;
    chkEnfInculpable: TCheckBox;
    chkAbandono: TCheckBox;
    dcIncDef: TDateComboBox;
    edObservaciones: TMemo;
    mskHora: TMaskEdit;
    fraEvento: TfraCodDesc;
    edPorcentaje: TEdit;
    fraFirmante: TfraCodigoDescripcion;
    dcFechaRetro: TDateComboBox;
    dcIncProv: TDateComboBox;
    chkAccidNoLab: TCheckBox;
    chkMortal: TCheckBox;
    dcFechaDefuncion: TDateComboBox;
    fraContingenciaDic: TfraCodigoDescripcion;
    chkRecupero: TCheckBox;
    chkComplemento: TCheckBox;
    edIDDocAsoc: TIntEdit;
    mskCUITDocAsoc: TMaskEdit;
    cmbTrabDocAsoc: TArtComboBox;
    dcFechaRecep: TDateComboBox;
    chkPrescripto: TCheckBox;
    fraArea: TfraCodigoDescripcion;
    chkNiegaFirmarIncap: TCheckBox;
    btnCerrar: TBitBtn;
    btnLimpiar: TBitBtn;
    btnGuardar: TBitBtn;
    tbLegajo: TToolButton;
    ScrollBox3: TScrollBox;
    fpLegajo: TFormPanel;
    chkLE_HISTORIACLINICA: TCheckBox;
    chkLE_PMI: TCheckBox;
    chkLE_DENUNCIA: TCheckBox;
    chkLE_ACUSERECIBO: TCheckBox;
    chkLE_FOTOCOPIADNI: TCheckBox;
    chkLE_PME: TCheckBox;
    chkLE_ACUERDO: TCheckBox;
    chkLE_TRATAMEDICO: TCheckBox;
    chkLE_REHABILITACION: TCheckBox;
    chkLE_TRATAPSICOLOGICO: TCheckBox;
    chkLE_TRATAQUIRURGICO: TCheckBox;
    chkLE_OTROSTRATAMIENTOS: TCheckBox;
    chkLE_PROTOQUIRURGICO: TCheckBox;
    Bevel18: TBevel;
    btnAceptarLeg: TBitBtn;
    btnCancelarLeg: TBitBtn;
    chkLE_INTERCONSULTA: TCheckBox;
    chkLE_PSICODIAGNOSTICO: TCheckBox;
    chkLE_RADIOGRAFIAS: TCheckBox;
    chkLE_ECOGRAFIAS: TCheckBox;
    chkLE_OTROSESTUDIOS: TCheckBox;
    chkLE_TAC: TCheckBox;
    chkLE_RMN: TCheckBox;
    chkLE_EMG: TCheckBox;
    chkLE_ESTAUDIOLOGICOS: TCheckBox;
    chkLE_ESTOFTALMOLOGICOS: TCheckBox;
    chkLE_ESTNEUMONOLOGICOS: TCheckBox;
    chkLE_LABORATORIO: TCheckBox;
    chkLE_RECALIFICACION: TCheckBox;
    chkLE_ESTCOMPLEMENTARIOS: TCheckBox;
    edLE_OTROSTRATAMIENTOS: TMemo;
    edLE_OTROSESTUDIOS: TMemo;
    Bevel19: TBevel;
    fraCIE101: TfraCDG_DIAGNOSTICO;
    Label50: TLabel;
    Label51: TLabel;
    fraCIE102: TfraCDG_DIAGNOSTICO;
    btnImprimir: TBitBtn;
    mnuLegajo: TPopupMenu;
    mnuDatosLegajo: TMenuItem;
    mnuImpLegajo: TMenuItem;
    chkAFavorART: TCheckBox;
    lblAFavorART: TLabel;
    fpAcuerdo: TFormPanel;
    Bevel20: TBevel;
    btnAceptarAcu: TBitBtn;
    btnCancelarAcu: TBitBtn;
    edDescripcionHecho: TMemo;
    edLesiones: TMemo;
    Label52: TLabel;
    Label53: TLabel;
    edSecuelas: TMemo;
    edPreexistencias: TMemo;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    cmbDificultad: TComboBox;
    fpApelaciones: TFormPanel;
    btnAceptarApelaciones: TBitBtn;
    dgApelaciones: TArtDBGrid;
    sdqApelaciones: TSDQuery;
    dsApelaciones: TDataSource;
    memoSeleccionado: TMemo;
    tbObservLegales: TToolButton;
    GroupBox2: TGroupBox;
    fraCie10: TfraCDG_DIAGNOSTICO;
    sdqBusquedaEX_DIAGNOSTICOOMS: TStringField;
    lblTitulo: TLabel;
    chkExcluirDictAnt: TCheckBox;
    btnSiniMasDatos: TSpeedButton;
    mnuInsertarFechas: TPopupMenu;
    mnuFecTopeLiq: TMenuItem;
    mnuFecLiqDin: TMenuItem;
    fpFecLiqDin: TFormPanel;
    Label58: TLabel;
    Bevel22: TBevel;
    btnAceptarFecLiqDin: TBitBtn;
    dcFecLiqDin: TDateComboBox;
    chkEvalErgonomica: TCheckBox;
    Label59: TLabel;
    sdqBusquedaEVALERGONOMICA: TStringField;
    fpFechaAltaDictamen: TFormPanel;
    Bevel23: TBevel;
    Label60: TLabel;
    btnAceptarFecAltaDictamen: TBitBtn;
    dcFecAltaDictamen: TDateComboBox;
    btnCancelarFecAltaDictamen: TBitBtn;
    fpFirmante_elim: TFormPanel;
    Label61: TLabel;
    Bevel25: TBevel;
    btnAceptarFirmante_elim: TBitBtn;
    fraFirmante_elim: TfraCodigoDescripcion;
    chkApelacion: TCheckBox;
    chkRectificatoria: TCheckBox;
    fpAsociarArchivo: TFormPanel;
    Bevel24: TBevel;
    btnAceptar_AsocArchivo: TBitBtn;
    btnCerrar_AsocArchivo: TBitBtn;
    edDescripcionArchivo: TEdit;
    edArchivoAsociado: TEdit;
    Label63: TLabel;
    Label64: TLabel;
    OpenDialog_AsocArch: TOpenDialog;
    tbSeleccionArchivoAsociar: TSpeedButton;
    tbAsociarArchivo: TToolButton;
    btnAbrirArchivo: TSpeedButton;
    btnDesasociar: TSpeedButton;
    fpSubMotivos: TFormPanel;
    btnAceptarSubMotivos: TBitBtn;
    btnCancelarSubMotivos: TBitBtn;
    Bevel26: TBevel;
    Label65: TLabel;
    chkAltaCargTarde: TCheckBox;
    chkAltaCargTildeErr: TCheckBox;
    chkAltaMalConf: TCheckBox;
    chkCDNotaSic: TCheckBox;
    Label66: TLabel;
    fpDigitalizarDespues: TFormPanel;
    Bevel27: TBevel;
    Label68: TLabel;
    btnDigDicAceptar: TBitBtn;
    cmbDA_OPCION: TComboBox;
    edDA_HOJAS: TIntEdit;
    fraCodDigitalizacion: TfraCodigoDescripcion;
    chkCodigoDigitalizacion: TRadioButton;
    chkDestinoPapel: TRadioButton;
    tbNoRecitar: TToolButton;
    chkRequerimientos: TCheckBox;
    btnCancelarrAltaDict: TBitBtn;
    Label57: TLabel;
    edJUICIO: TEdit;
    edMEDIACIONES: TEdit;
    Label62: TLabel;
    chkIntegral: TCheckBox;
    chkPrevencion: TCheckBox;
    mnuEntregaExpediente: TMenuItem;
    fpDictamen: TFormPanel;
    Label67: TLabel;
    lbTituloSIC: TLabel;
    btnAceptarDictamen: TButton;
    btnCancelarDictamen: TButton;
    fraTipoDocumentoAGA: TfraCodDesc;
    lbPreguntaSIC: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    rgGenerarTareaSI: TAdvOfficeRadioButton;
    rgGenerarTareaNO: TAdvOfficeRadioButton;
    rgDigitalizarSI: TAdvOfficeRadioButton;
    rgDigitalizarNO: TAdvOfficeRadioButton;
    Label73: TLabel;
    Bevel21: TBevel;
    edArchivoDictamen: TFilenameEdit;
    fpAgregarObservLegales: TFormPanel;
    Bevel28: TBevel;
    Label70: TLabel;
    btnAceptar_Leg: TBitBtn;
    btnCancelar_Leg: TBitBtn;
    Label69: TLabel;
    edObserv_Leg: TRichEdit;
    Label74: TLabel;
    tbReenviarPedidoTurnoSRT: TToolButton;
    ToolButton1: TToolButton;
    edCodEvento_Leg: TEdit;
    edDescEvento_Leg: TEdit;
    fpRecaidaSin: TFormPanel;
    Label75: TLabel;
    Bevel29: TBevel;
    btnAceptarRecaidaSin: TButton;
    btnCancelarRecaidaSin: TButton;
    cmbRecaidaSin: TRxDBLookupCombo;
    sdqRecaidaSin: TSDQuery;
    StringField1: TStringField;
    dsRecaidaSin: TDataSource;
    fpConstanciaDomicCobro: TFormPanel;
    Label76: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Bevel30: TBevel;
    btnAceptarCODOC: TButton;
    btnCancelarCODOC: TButton;
    rdDigitalizarCODOC_Si: TAdvOfficeRadioButton;
    rdDigitalizarCODOC_No: TAdvOfficeRadioButton;
    edArchivoCODOC: TFilenameEdit;
    fraTipoDocumentoAGA_CODOC: TfraCodDesc;
    Label77: TLabel;
    chkGrandesSueldos: TCheckBox;
    sdqBusquedaEX_CONTRATO: TIntegerField;
    sdqBusquedaEX_CUIL: TStringField;
    sdqBusquedaTJ_DOCUMENTO: TStringField;
    sdqBusquedaDOMICILIO_TRABAJADOR: TStringField;
    sdqBusquedaTJ_CPOSTAL: TStringField;
    sdqBusquedaPV_CODIGODGI: TStringField;
    sdqBusquedaTJ_MAIL: TStringField;
    sdqBusquedaEX_BREVEDESCRIPCION: TStringField;
    tbSalir7: TToolButton;
    edPorcIntegral: TEdit;
    sdqBusquedaTJ_PROVINCIA: TStringField;
    sdqBusquedaTJ_LOCALIDAD: TStringField;
    chkPatCron: TCheckBox;
    sdqBusquedaMAIL_TRABAJADOR: TStringField;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure edExpedIncapKeyPress(Sender: TObject; var Key: Char);
    procedure edSiniestroSelect(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fraEventoPropiedadesChange(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnBajaExpClick(Sender: TObject);
    procedure btnGuardarExpedClick(Sender: TObject);
    procedure edPorcentajeKeyPress(Sender: TObject; var Key: Char);
    procedure tbCancelarAutorClick(Sender: TObject);
    procedure tbAutorizacionClick(Sender: TObject);
    procedure fpSeleccionRecaidaBeforeShow(Sender: TObject);
    procedure btnAceptarRecaidaClick(Sender: TObject);
    procedure chkMortalClick(Sender: TObject);
    procedure fpExpedienteBeforeShow(Sender: TObject);
    procedure sdqExpedienteAfterScroll(DataSet: TDataSet);
    procedure btnAceptarExpedClick(Sender: TObject);
    procedure chkRetroactivoClick(Sender: TObject);
    procedure fpEventosBeforeShow(Sender: TObject);
    procedure fpDictamenesBeforeShow(Sender: TObject);
    procedure btnAceptarDictamenesClick(Sender: TObject);
    procedure edPorcentajeChange(Sender: TObject);
    procedure edIDDocAsocEnter(Sender: TObject);
    procedure edIDDocAsocExit(Sender: TObject);
    procedure cmbTrabDocAsocEnter(Sender: TObject);
    procedure cmbTrabDocAsocCloseUp(Sender: TObject);
    procedure edIDDocAsocKeyPress(Sender: TObject; var Key: Char);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbUsuariosClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure mnuViajarLiquidacionesClick(Sender: TObject);
    procedure mnuViajarSiniestrosClick(Sender: TObject);
    procedure dcFechaRecepExit(Sender: TObject);
    function TipoCartaAGenerar : Integer;
    procedure btnAceptarCartaClick(Sender: TObject);
    procedure fpNotaEntregaReqBeforeShow(Sender: TObject);
    procedure btnAceptarNotaClick(Sender: TObject);
    procedure fpFechaDictamenBeforeShow(Sender: TObject);
    procedure btnAceptarAltaDictClick(Sender: TObject);
    procedure btnAceptarFirmanteClick(Sender: TObject);
    procedure btnDigAceptarClick(Sender: TObject);
    procedure tbNoLiquidarClick(Sender: TObject);
    procedure rbProvisorioClick(Sender: TObject);
    procedure rbDefinitivoClick(Sender: TObject);
    procedure tbExpedienteClick(Sender: TObject);
    procedure tbReplicarDictClick(Sender: TObject);
    procedure btnPrestadorAceptarClick(Sender: TObject);
    procedure btnAceptarFec2daCitClick(Sender: TObject);
    procedure mnuViajarContCartasDocClick(Sender: TObject);
    procedure btnRemitoExpedientesClick(Sender: TObject);
    procedure btnAceptarRemitoExpClick(Sender: TObject);
    procedure fpImpRemitoExpedientesBeforeShow(Sender: TObject);
    procedure mnuVerDigitalizacionClick(Sender: TObject);
    procedure mnuViajarPopup(Sender: TObject);
    procedure tbSinAntCobIncapClick(Sender: TObject);
    procedure tbInsertarFechasClick(Sender: TObject);
    procedure btnAceptarFecTopeLiqClick(Sender: TObject);
    procedure tbLegajoClick(Sender: TObject);
    procedure chkLE_OTROSTRATAMIENTOSClick(Sender: TObject);
    procedure chkLE_OTROSESTUDIOSClick(Sender: TObject);
    procedure btnAceptarLegClick(Sender: TObject);
    procedure mnuDatosLegajoClick(Sender: TObject);
    procedure mnuImpLegajoClick(Sender: TObject);
    procedure fpAcuerdoBeforeShow(Sender: TObject);
    procedure btnAceptarAcuClick(Sender: TObject);
    procedure btnCancelarAcuClick(Sender: TObject);
    procedure fpApelacionesBeforeShow(Sender: TObject);
    procedure btnAceptarApelacionesClick(Sender: TObject);
    procedure sdqApelacionesAfterScroll(DataSet: TDataSet);
    procedure tbObservLegalesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbDigitalizarClick(Sender: TObject);
    procedure mnuImprimirListaDocDigClick(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure mnuFecTopeLiqClick(Sender: TObject);
    procedure mnuFecLiqDinClick(Sender: TObject);
    procedure mnuEntregaExpedienteClick(Sender: TObject);
    procedure mnuInsertarFechasPopup(Sender: TObject);
    procedure btnAceptarFecLiqDinClick(Sender: TObject);
    procedure fpFecLiqDinBeforeShow(Sender: TObject);
    procedure cmbTrabDocAsocDropDown(Sender: TObject);
    procedure mskCUITDocAsocExit(Sender: TObject);
//    procedure btnAceptarFecAltaDictamenClick(Sender: TObject);    // Comentado por ticket 44287
    procedure fpFechaAltaDictamenBeforeShow(Sender: TObject);
    procedure btnAceptarFirmante_elimClick(Sender: TObject);
    procedure tbAsociarArchivoClick(Sender: TObject);
    procedure tbSeleccionArchivoAsociarClick(Sender: TObject);
    procedure btnAceptar_AsocArchivoClick(Sender: TObject);
    procedure fpAsociarArchivoBeforeShow(Sender: TObject);
    procedure btnAbrirArchivoClick(Sender: TObject);
    procedure btnDesasociarClick(Sender: TObject);
    procedure btnAceptarSubMotivosClick(Sender: TObject);
    procedure fpSubMotivosBeforeShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDigDicAceptarClick(Sender: TObject);
    procedure fpDigitalizarDespuesBeforeShow(Sender: TObject);
    procedure chkDestinoPapelClick(Sender: TObject);
    procedure chkCodigoDigitalizacionClick(Sender: TObject);
    procedure fpDigitalizarDespuesShow(Sender: TObject);
    procedure tbNoRecitarClick(Sender: TObject);
    function GeneraCartaComPresidencia: boolean;
    procedure DoGenerarCitacionPresidencia(idevento: integer);
    procedure btnCancelarrAltaDictClick(Sender: TObject);
    procedure fpDictamenShow(Sender: TObject);
    procedure btnAceptarDictamenClick(Sender: TObject);
    procedure CambioDigitalizarAGA(Sender: TObject);
    procedure DoCambioOpcionCODOC(Sender: TObject);  // TK 62690
    procedure tbReenviarPedidoTurnoSRTClick(Sender: TObject);
    procedure fpAgregarObservLegalesBeforeShow(Sender: TObject);
    procedure btnAceptar_LegClick(Sender: TObject);
    procedure fpRecaidaSinBeforeShow(Sender: TObject);
    procedure btnCancelarRecaidaSinClick(Sender: TObject);
    procedure fpRecaidaSinClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarRecaidaSinClick(Sender: TObject);
    procedure fpConstanciaDomicCobroShow(Sender: TObject);
    procedure btnAceptarCODOCClick(Sender: TObject);
    procedure tbSalir7Click(Sender: TObject);
    procedure edPorcIntegralKeyPress(Sender: TObject; var Key: Char);
    procedure edPorcIntegralChange(Sender: TObject);
    procedure chkIntegralClick(Sender: TObject);

  private
    Siniestro, Orden, Recaida, IdExpediente, IdEvento, IdEventoRel, iNuevoEvento :Integer;
    aNiveles :array of String;
    Accion :TAccion;
    dFechaAlta, dFechaDictamen :TDate;
    dPorcentaje :Double;
    sqlDictamen :String;
    bEsDictamen :Boolean;
    sinCaracter: boolean;
    procedure DoCargarEstado;
    procedure OnTrabajadorChange(Sender : TObject);
    procedure OnEmpresaChange(Sender : TObject);
    procedure OnEventoChange(Sender : TObject);
    procedure DoCargarDatosEvento(iIdEvento :Integer; bCargaEvento, bEventoRel :boolean);
    procedure DoCargarDocumentacion(iID :Integer = 0; sCUIL :String = '');
    procedure DoLimpiarDatosEvento(bLimpiarCodigo :Boolean);
    procedure DoGuardarDatosEvento(bEsAlta, bEnTransaccion :Boolean; sExpedIncap :String = '';
                                   IdSegDictamen :Integer = 0; sDictamenApel :String = '';
                                   IdNuevoEvento :Integer = 0; IdPrest: Integer = 0;
                                   sSqlAcu: String = ''; iIdEvApelacion: Integer = 0; sUsuQuiereAut: String = 'N';
                                   iRecaida: Integer = 0; iIdExpediente: Integer = 0);
    procedure DoBloquearControles;
    function DoBorrarEvento(iIdEvento, iSiniestro, iOrden :Integer; bEnTransaccion :Boolean): integer;  // devuelve el nro de Evento borrado (lo uso para generar la carta doc de elimininacion tk 25894)
    procedure DoRefrescarExpediente(bCargaDictamen :Boolean);
    procedure DoEventoAutorizacion(sEvento :String; bShowMsg, bEnTransaccion :Boolean;
                                   iIdEventoRela :Integer = 0);
    procedure DoInsertarCartaDoc;
    procedure DoInsertarCartaDoc_elim(iNroEventoBorrado: integer);   // por TK 25894
  //  procedure DoInsertarCartaDoc_AltaMed;  // por TK 27283      // comentado por TK 28602
    procedure DoCierreAutomatico;
    //procedure DoAnularAutAsociada(iIdEvento :Integer);
    function DoValidacion(iIdEvento :Integer):String; // TK 8772 (lo cambie de procedure a function)
    procedure DoBloquearDictamen;
    procedure DoBloquearPapeleria;
    procedure DoGenerarNotaEntregaReq(iSiniestro, iIdExpediente:Integer);
    procedure DoGenerarNotaRectificatoria(iSiniestro:Integer; sComision:String; iIdExpediente: integer);
    procedure DoGenerarNotaDesestimoApelacion(iSiniestro, iOrden, iRecaida, iIdExped: Integer; sComision:String);   // TK 17681
    procedure DoGenerarPlanillaSiniRecalif(iSiniestro, iIdExpediente:Integer);  // TK 18591
    procedure DoGenerarNotaReqCarDef(sTrabajador, sCuil: string; iIdExpediente, iIdSEVNuevo :integer);   // TK 62062

    procedure DoGuardarFechaDictamen;
    procedure DoDigitalizar;
    procedure DoCaracterClick;  // Lu: 23/09 por error al replicar.
    procedure DoGenerarReporteBaja(sExpInc:string; iSiniestro, iIdExped: integer); // Lu WF 7232
    procedure DoEnvioMailArea(sIdEvento, sArea :String);  // Lu TK 2560
    procedure DoEnvioMailPluriempleo(sIdEvento :String);  // Lu TK 10277
    procedure DoImprimirPlanillaEstCompl;  // Lu TK 4345
    procedure DoInsertarTelegramaST(sSin, sOrd, sRec, sDest, sCalle, sNro, sPiso,
                                    sDepto, sLoc, sCP, sProv, sTexto, sTipoTeleg, sFormato: string);
    procedure DoCargarFechaTopeLiqYBloquear(iIdEvento: Integer); // Lu 04/11
    procedure DoEnviarMail_SiniParaReingresar(IdNuevoEvento: integer); // TK 11993
    procedure DoImprimirCaratula(iSiniestro, iOrden, iRecaida:Integer);  // TK 21671

    procedure SetSqlFrames(bRestringir :Boolean; bEvento :Boolean = True);
    procedure SetSqlEvento(bRestringir :Boolean);
    procedure SetSqlFirmante(bRestringir :Boolean);
    procedure SetSqlFirmanteBaja(bRestringir :Boolean); // Lu WF 7232
    procedure SetSqlMedico(bRestringir :Boolean);
    procedure SetSqlPapeleria(bRestringir :Boolean);
    procedure MostrarDatosDigitalizacion;   // Lu WF 8109
    procedure DigColorFondo;
    procedure Do_armarTextoMemoNotaRectif(sMedico, sUltFecDictamen, sTrabNomYCuil, sPedido: string); // Lu TK 790
    procedure DoEnviarTelegrama(bEsBaja :Boolean; sFecha, sHora, sUbica :String);                    // Lu TK 1515
  //  procedure DoEnviarTelegramaCitacion(sCodEvento, sFecha, sHora, sNomPrestador, sDomPrestador, sCPPrestador, sLocPrestador, sObserv: string);  // Lu TK 4345     // comentado por TK 25896
    procedure DoFecha2daCit(iNuevoEv: Integer);                    // Lu TK 5949
    procedure DoEvaluar_NiegaFirmIncap(sChkNoFirmIncap: string);   // Lu TK 7039
    procedure DoEvaluar_AFavorART(sChkAFavorART: String);          // Lu TK 9043
    procedure DoEvaluar_EstudiosComplementarios(sEvConcurre: String); // TK 12229
    procedure DoEvaluar_EventosCitacionVarios(sFecEvAnt, sCargaFechaEvHoy, sFecEventoHoy: string);
    procedure DoEvaluar_EventosCitacionTandil(sFecMotCommed_citTandil: string);  // TK 17866
    procedure DoEvaluar_AsociarArchivo; // TK 28452
    procedure DoEvaluar_EventosParaRespLegales(sEvRespLegales:string);  // TK 38322
    procedure DoEvaluar_ObservacionesLegales;  // TK 55299

    procedure DoImprimirRemitoExpedientes(sCodigoEvento, sDestinatario: string);  // Lu TK 7558
    procedure DoHabilitarBtnCobroIncap;                            // Lu TK 8805
    procedure DoGenerarPlanillaSiniParaReingresar(sCodEvento: string; iSiniestro, iIdExpediente :integer); // Lu TK 11993
    procedure Do_LimpiarLegajo_items;  // TK 16166
    procedure Do_VisualizarDocDigitalizados(iIdExpediente: integer); // TK 16032
    procedure DoGuardarDatosLegajo;
    procedure DoEvaluar_RevisionMedica;  // TK 15065
    procedure DoEvaluar_RectifSinContestar;  // TK 25339
    procedure Do_HabilitacionFecLiqDin;  // Lu 04/06/2010
    procedure Do_actualizarFechasAltaMedica(dateFechaDictamen:TDateTime); // TK 19711
    procedure Do_CambiarEstadoActivo;                                     // TK 19711
  //  procedure DoFechaAltaDictamen(iIdExpediente, iNuevoEv: integer);      // TK 22901     // Comentado por Ticket 44287
    procedure Limpiar_AsocArchivo;
    procedure Do_GuardarArchivoAsociado;                                  // TK 28452
    procedure Do_GuardarEnTabla_ArchivoAsociado(iIdEvento:integer; sArchDestino, sNombreArchivo, sDescripcionArchivo: string); // TK 28452
    procedure Do_GuardarEnTabla_ArchivoDESAsociado(iIdEvento:integer);    // TK 29777
    procedure Do_FormatoAsociarArchivo(bHabilitar: boolean);              // TK 28452
    procedure Do_DesasociarArchivo;                                       // TK 29777
    procedure Do_DigitalizarDelMenu(sCodigoDig, sQueDigitalizo: string);        // en consec. del ticket 29564
    procedure Do_DigitalizarStandard;
    procedure Do_SubMotivos(iNuevoEv: Integer);   // TK 33601
    procedure Do_GuardarSubMotivos(iNuevoEv: integer);               // TK 33601
    procedure Do_CompletarJuiciosYMediaciones;   // TK 43890
    procedure DoGenerarTramitesMedicos(sCodEvento :String; EsReCitar: boolean = false);   // Plan Tramites Medicos (TK 66089)

    function GetExpedienteAsociado :String;
    function GetDictamenApelacion(var sDictamen :String):Boolean;
    function GetPermiteEventos(bEsNoLiquidar:boolean = False) :Boolean;
    function ValidarDatos :Boolean;
    function ValidarFecha :Boolean;
    function ValidarHora :Boolean;
    function ValidarFechaVencim :Boolean;
    function ValidarFechaRecep :Boolean;
    function ValidarNivel :Boolean;
    function ValidarEvento :Boolean;
    function ValidarPorcentaje :Boolean;
    function ValidarChecks :Boolean;
    function ValidarFechaIncaDef :Boolean;
    function ValidarUbicacion :Boolean;
    function ValidarDatosTrab :Boolean;
    function ValidarFirmante :Boolean;
    function ValidarFechaIncaProv :Boolean;
    function ValidarMotivo :Boolean;
    function ValidarComision :Boolean;
    function ValidarDictamen :Boolean;
    function ValidarEdPorcentaje :Boolean;
    function ValidarMedico :Boolean;
    function ValidarDocumentacion :Boolean;
    function ValidarObservaciones :Boolean;
    function ValidarArea :Boolean;  // Lu TK 2560
    function ValidarMotivoIgual: Boolean; // Lu TK 6002
    function ValidarComisionIgual: Boolean; // Lu TK 7306
    function ValidarRemitoExpedientes: Boolean; // Lu TK 7558
    function Validar_HabilitarFecTopeLiquid(iIdEvento: integer): Boolean; // Lu 04/11/2009 (pedido)
    function Validar_FechaTopeLiquid: Boolean;   // Lu 04/11/2009 (pedido)
    function ValidarCitacionAfonia_y_DerInlex: Boolean; // TK 17012
    function Validar_FecLiqDin: Boolean; // Lu 04/06/2010 (pedido)
  //  function Validar_FechaAltaDictamen: Boolean;  // TK 22901     // Comentado por ticket 44287
    function ValidarDerInlexConPluri: Boolean;    // TK 28086
    function ValidarSiniCitacionAnioILT: Boolean; // TK 48457
    function ValidarCODOC: Boolean;   // TK 62690
    function ValidarTurnosMedicosSRT: Boolean;
    function ValidarPorcentajeIntegral: Boolean; // Plan Integrales
    function ValidarSiniestroTurnoSRT: Boolean;


    function HaySiniestroActivo :Boolean;
    function HayRegistroActivo :Boolean;
    function GetEsAutorizable :Boolean;
    function GetEsCancelable :Boolean;
    function GetEsNoAutorizable :Boolean;
    function GetNoImpideAutorizar: Boolean; // Lu TK 5661
    function GetCantRecaidas :Integer;
    function GetHoraCorrecta(sHora: string) :String;
    function GetUltFechaDictamen :String;
    function Get_ComisionMedica(sIdExpedIncap:string):String;
    function EsEventoRetroacSiempre(sCodEvento: String): Boolean; // Lu wf 8009
    function GetEventoAutoriza :String;  // Lu tk 5355
    function GetPrestEstCompl: Integer;      // Lu TK 4345      // este ticket fue cambiado por la modificacion del tk 6887
    function ValidarNivelBaja :Boolean;
    function Get_MailUsuario(sUsuId:String) :String;  // Lu TK 10277
    function Es_DictamenAutorizado(iIdEvento:Integer): Boolean;    // Lu 04/11
    function DoCargarDatosLegajo: Integer;
    function GetDatosAcuerdo: String;
    function GetRelacionConApelacion(sCodEvento: string): integer; // Lu TK 9043
    function Get_EvaluarGenAutorizacion(sCodEvento:String): String;  // Lu TK 11992
    function EsPrimeraVez_Legajo(sIdExpediente:Integer): boolean;  // TK 16032
    function Es_EmpresaPresidenciaNacion: boolean;
    function PermiteAutorizarEmpresa: boolean;  // TK 26620
    function Evento_tieneArchivoAsociado: boolean;  // TK 28452
  //  procedure DoEnviarCartaDocEmpAltaMed(sCodEvento, sFecha, sHora, sUbica: string);  // TK 20679    // Comentado por TK 28602, ya no sale mas dicha carta
    function LugarImpresion :String;
    procedure GestionarDictamenAGAySIC;
    procedure GestionarConstanciaDomicCobro;   // TK 62690
    function ValidarDictamenAGAySIC: Boolean;
    procedure Do_GuardarObservacionesLegales;    // TK 55299
    procedure Do_CargarRecaida_ExtensionILT(sCodEvento: string; iIdEvento :Integer; var iRecaida, iIdExpediente: integer);  // por Plan Extensión de ILT - devuelve el nro de recaida elegida en el combo en caso de ser un 112 y el IdExpediente correspondiente a ese nro. Caso contrario devuelve 0 (recaida estandard)
    function IsEventoExtensionILT(sCodEvento: string): boolean;   // por Plan Extensión de ILT
    procedure GuardarDocsEventoInca;
    procedure DoEnviarNotifPedidoDocum;  // TK 60625
    function EsEmpresaExtraSuss(sCuit: string):boolean; // TK 60625
    procedure DoInsertarEventoTM(sCodEvento: string; iSiniestro, iOrden: integer; sComMed: string; dFechaHora: TDateTime; sMensajeError, sHora: string); // Plan Tramites Medicos tk 66089
    procedure Do_InsertarCartaDocTM(iSiniestro, iOrden: integer; sComMed: string);
    procedure DoEnviarMailPatCron;

  protected
    dHoy: TDateTime;

  public
    { Public declarations }
  end;

var
  frmSegIncapacidades: TfrmSegIncapacidades;

implementation

uses
  AnsiSql, UnArt, unSesion, CustomDlgs, uncomunes, unDmPrincipal,
  General, ValFuncs, SqlFuncs, Periodo, VCLExtra, MaskUtils,
  Strfuncs, DateUtils, CUIT, unDlgBusSiniestro, unSiniestros,
  unLiqIncapacidades, unPrincipal, unAdmSiniestros, unContratoTrabajador,
  unRptNotaEntregaReq, QuickRpt, unRptNotaRectificatoria, unRptNotaBaja,
  unRptCartaDocHeader, unVisualizador, unRptEstudiosCompl,
  unListContCartasDoc, unRptRemitoExpedientes, unUtilsArchivo,
  unRptLegajoSiniestro,  unRptSiniestroParaReingresar, unDatosSiniestro, unRptNotaBase,
  unRptSiniestroParaRecalificar, unDinerarias, unEmisionFormularios, unRedPres,
  unFrmDetalleArchivo, unConstantArchivo, unComunesArchivo, unArchivo, ShellAPI,
  unRptCitacionPresidencia, unCargaDocumentosDigitaliz, unSIC, unTercerizadoras,
  unRptPedidoDocum, unRptNotaReqCarDef, unImportCryptoSrt;

const
  sqlEvento =
    'SELECT ei_codigo as codigo, ei_id as id, ei_descripcion as descripcion, ' +
          ' ei_fechabaja as baja, ei_fechaposterior, ei_exigehora, ei_vencimiento, ' +
          ' ei_recepcion, ei_diaspos, ei_nivelperfil, ei_nroexpediente, ' +
          ' ei_porminimo, ei_pormaximo, ei_graninvalidez, ei_tratamiento, ei_tratam_oy_recalif, ' +
          ' ei_retroactivo, ei_recalificacion, ei_estudios, ei_reingreso, ' +
          ' ei_enfinculpable, ei_abandono, ei_telefonograma, ei_tipoevento, ' +
          ' ei_cartadoc, ei_cartacom, ei_codcartadoc, ei_codcartacom, ' +
          ' ei_grupovalidacion, ti_codigo, ei_exigemotivo, ei_exigecomision, ' +
          ' ei_exigemedico, ei_notaentregareq, ei_notarectificatoria, ' +
          ' ei_porcdefecto, ei_digitaliza, ei_exigeobserv, ei_modificafechaev, ' +
          ' ei_digitalizahojas, ei_exigefirmante, ei_digitalmodif, ei_envmailarea, ' +
          ' ei_telegramaalta, ei_telegcittrab, ei_fechapostxcit, ei_motivoigual, ' +
          ' ei_generaevento, ei_comisionigual, ei_chknofirmincap, ei_evcitacion, ' +
          ' ei_citarevmed, ei_requierereca, ei_chkafavorart, ei_acuerdo, ei_reportesinireing, ' +
          ' ei_digitaliza_despues, ei_notadesestapel, ei_planillasinirecalif, ' +
          ' ei_teleg_emp_altamed, ei_checkrecupero, ei_cartadoc_elim, ei_codcartadoc_elim, ' +
          ' ei_cartadoc_alta, ei_codcartadoc_alta, ei_digitaliza_guarda, ei_generaotroevento, ' +
          ' EI_GENERANOTAPRESI, ei_excepciontratamiento, ei_notareqcardef, ei_pdf_ConstDomic ' +
     ' FROM sin.sei_eventoincapacidad, sin.sti_tipoeventoinca ' +
    ' WHERE ei_tipoevento = ti_id ';
  MAXCANTLINEAS: Integer = 25;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlEstado, sBloqueados :String;
begin
  Verificar(edSiniestro.IsEmpty, edSiniestro, 'Debe seleccionar Siniestro / Expediente de incapacidad');
  sSql := 'SELECT ev_codigo, ev_evento, ev_idevento, ei_descripcion evento, ' +
                ' ev_fecha fecha, ev_hora hora, ev_idexpediente, ev_porcincapacidad porcinca, ' +
                ' decode(ev_grado, ''P'', ''Parcial'', ''T'', ''Total'', Null) grado, ' +
                ' decode(ev_caracter, ''P'', ''Provisorio'', ''D'', ''Definitivo'', Null) caracter, ' +
                ' ev_graninc grainc, ev_retroactivo retro, mi_descripcion motivo, ' +
	              ' cm_descripcion comision,  au_nombre medico, ev_fechavencimiento fvenci, ' +
                ' ev_tratamiento tratam, ui_descripcion ubica, ev_inicioincadef finiciodef, ' +
                ' ev_observaciones observa, ev_fechaalta fcarga, ev_abandonotratamiento abandono, ' +
                ' ei_tipoevento, ev_comision, ev_motivo, ev_medico, ev_codubic, ' +
                ' ev_recalificacion, ev_recalificacion, ev_estudios, ev_reingreso, ' +
                ' ev_enfinculpable, ev_firma, ev_fecharecepcion, ev_grado, ' +
                ' ev_caracter, ev_fechacitacion, ev_mortal, ev_fechadefuncion, ' +
                ' ev_complementario, ev_recupero, ev_tipoacci, ' +
                ' ev_expedincapacidad, ev_fecharetroactivo, ev_idseg_dictamen, ' +
                ' ev_idevento_rela, ev_inicio_prov, ev_iddictamen, ev_motivoapelacion, ev_accidnolaboral, ' +
                ' utiles.armar_siniestro(ev_siniestro, ev_orden, ev_recaida) siniestro, ' +
                ' ev_usualta, ev_usumodif, ev_faltadictamen, ev_prescripto, ei_exigefirmante, ' +
                ' ei_telegramabaja, ev_envarea, ei_telegramaalta, ei_autoriza, ei_teleg_emp_altamed, ' +
                ' ei_cancelaautoriza, ei_noautoriza, ei_generaevento, ex_fechaaccidente, ex_altamedica, ' +
                ' ev_nofirmincap, ex_pluriempleo, ei_nivelperfil, ei_evcitacion, ei_citarevmed, ' +
                ' ev_fechatopeliq, ev_idaccidentedictamen, ev_idcie101, ev_idcie102, ' +
                ' d1.dg_codigo codcie101, d1.dg_descripcion descie101, ' +
                ' d2.dg_codigo codcie102, d2.dg_descripcion descie102, ' +
                ' ta_descripcion contdict, ev_afavorart, ev_descripcionhecho, ev_lesionesprovocadas, ' +
                ' ev_secuelas, ev_preexistencias, NVL(ev_dificultadtareas, -1) ev_dificultadtareas,   ' +
                ' DECODE(ev_dificultadtareas, 0, ''Ninguna'', 1, ''Leve'', 2, ''Intermedia'', 3, ''Alta'') dificultad,  ' +
                ' art.inca.get_NroEvento(ev_idev_apelacion) IdEv_Apelacion, ei_digitaliza, ' +
                ' ev_siniestro, ev_orden, ev_recaida, EI_DIGITALIZA_DESPUES, ev_ExcluirDictAnt, ev_fecliqdin, ' +
                ' ei_planillasinirecalif, art.hys.get_ergonomiaaprobada(ev_siniestro, ev_orden) EvalErgonomica, ' +
                ' ev_fechaaltadictamen, ei_codigo, ei_cartadoc_elim, ei_codcartadoc_elim, ' +
                ' ei_cartadoc_alta, ei_codcartadoc_alta, ev_chkfecapelacion, ev_chkfecrectificatoria, ' +
                ' ei_digitaliza_guarda, ev_ArchivoAsociado, ei_caracternulo, ev_SeModificoFechaEvento, ei_marcarecitar, ' +
                ' ev_recitar, ev_integral, ev_prevencion, ei_marcarfechaexped, ev_fechaentregaexped, ' +
                ' ei_autorizaextensionilt, ev_maillegales, ev_recaida, ev_nroexpedientesrt, EV_FECHARECEPCION, ev_porcIntegral ' +
           ' FROM art.sev_eventosdetramite, art.sex_expedientes, sin.sei_eventoincapacidad, ' +
                ' sin.smi_motivoincapacidad, sin.scm_comisionmedica, mau_auditores, ' +
                ' sin.sui_ubicacionincapacidad, cdg_diagnostico d1, cdg_diagnostico d2, ' +
                ' sin.sta_tipoaccidentedictamen ' +
          ' WHERE ev_idexpediente = ex_id ' +
            ' AND ev_codigo = ei_codigo ' +
            ' AND ev_motivo = mi_codigo(+) ' +
            ' AND ev_comision = cm_codigo(+) ' +
            ' AND ev_medico = au_auditor(+) ' +
            ' AND ev_codubic = ui_codigo(+) ' +
            ' AND ev_idaccidentedictamen = ta_id(+) ' +
            ' AND ev_idcie101 = d1.dg_id(+) ' +
            ' AND ev_idcie102 = d2.dg_id(+) ' +
            ' AND ev_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
            ' AND ev_orden = ' + SqlInt(edSiniestro.Orden) +
          //  ' AND ev_recaida = ' + SqlInt(edSiniestro.Recaida) +
            ' AND ev_evento <> 0 ';

  if rbEventosActivos.Checked then
    sSql := sSql + ' AND ev_evento > 0 ';

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  with sdqBusqueda do
  begin
    Close;
    ParamByName('pSiniestro').AsInteger := edSiniestro.Siniestro;
    ParamByName('pOrden').AsInteger     := edSiniestro.Orden;
    ParamByName('pRecaida').AsInteger   := edSiniestro.Recaida;
    Open;
  end;
  //comienzo a cargar los datos
  //------------------------------------------------------------------------//
 // if fraTrabajadorSIN.Siniestro <> edSiniestro.SinOrdRec then       // lo comento porque siempre son iguales (ya que se refresca antes el edSiniestro) y por aca no pasaba nunca. (a raiz del ticket 46381)
//  begin
     fraTrabajadorSIN.IdSiniestro := sdqBusquedaEX_ID.AsInteger;
     fraEmpresa.Value := fraTrabajadorSIN.sdqDatos.FieldByName('EM_ID').AsInteger;
      if (fraEmpresa.Value <> fraTrabajadorSIN.IdEmpresa) and (fraTrabajadorSIN.IdEmpresa <> ART_EMPTY_ID) then
        fraEmpresa.Value := fraTrabajadorSIN.IdEmpresa
      else
        OnEmpresaChange(nil);
 // end;
  edSinFecha.Date   := sdqBusquedaEX_FECHAACCIDENTE.AsDateTime;
  if (sdqBusquedaALTAMED.AsDateTime > 0) then
    edFechaAlta.Date := sdqBusquedaALTAMED.AsDateTime
  else
    edFechaAlta.Clear;

  // Estado de Recaida Maxima (Lu Tk 2948):
  // (Obtengo el estado de la ultima recaida)
  sSqlEstado :=  'SELECT ex_estado, se_descripcion ESTADO, ct_descripcion CAUSAFIN ' +
                  ' FROM art.sex_expedientes A, SIN.sse_siniestroestado, sin.sct_causaterminacion ' +
                 ' WHERE A.ex_estado = se_codigo ' +
                   ' AND ct_codigo(+) = A.ex_causafin ' +
                   ' AND A.ex_siniestro = :pSini ' +
                   ' AND A.ex_orden = :pOrd ' +
                   ' AND A.ex_recaida = (SELECT MAX(B.ex_recaida) ' +
                                        ' FROM art.sex_expedientes B ' +
                                       ' WHERE B.ex_siniestro = A.ex_siniestro ' +
                                         ' AND B.ex_orden = A.ex_orden)';

  with GetQueryEx(sSqlEstado, [edSiniestro.Siniestro, edSiniestro.Orden]) do
  try
    if FieldByName('EX_ESTADO').AsString = '03' then
    begin
      edEstadoRecMax.Text := FieldByName('ESTADO').AsString + '(' + FieldByName('CAUSAFIN').AsString + ')';
      edEstadoRecMax.Font.Color := clRed;
    end
    else begin
      edEstadoRecMax.Text       := FieldByName('ESTADO').AsString;
      edEstadoRecMax.Font.Color := clBlack;
    end;
  finally
    Free;
  end;

  // Estado de Recaida Cero:
  if sdqBusquedaEX_ESTADO.AsString = '03' then //si esta cerrado, agrego la causa
  begin
    edEstadoRecCero.Text       := sdqBusquedaESTADO.AsString + '(' + sdqBusquedaCAUSAFIN.AsString + ')';
    edEstadoRecCero.Font.Color := clRed;
  end
  else begin
    edEstadoRecCero.Text       := sdqBusquedaESTADO.AsString;
    edEstadoRecCero.Font.Color := clBlack;
  end;

  edDiagnostico.Text       := sdqBusquedaEX_DIAGNOSTICO.AsString;
  fraCie10.Codigo          := sdqBusquedaEX_DIAGNOSTICOOMS.AsString;  // TK 13615
  edGTrabajo.Text          := sdqBusquedaGTRABAJO.AsString +
                              Get_UsuGestor(sdqBusquedaEX_ID.AsInteger, True);
  edDelegacion.Text        := sdqBusquedaDELEGACION.AsString;
  edGravedad.Text          := sdqBusquedaGRAVEDAD.AsString;
  edGravedad.Font.Color    := IIF(sdqBusquedaEX_GRAVEDAD.AsString = '5', clRed, clBlack);
  edTipo.Text              := sdqBusquedaTIPOACC.AsString;
  edTipo.Font.Color        := IIF(sdqBusquedaEX_TIPO.AsString = '3', clRed, clBlack);
  IdExpediente             := sdqBusquedaEX_ID.AsInteger;
  Siniestro                := edSiniestro.Siniestro;
  Orden                    := edSiniestro.Orden;
  Recaida                  := edSiniestro.Recaida;

  chkEvalErgonomica.Checked := IIF(not sdqBusquedaEVALERGONOMICA.IsNull, True, False);    // cambio 19/10/10
  chkEsPluriempleo.Checked  := IIF(sdqBusquedaEX_PLURIEMPLEO.AsString = 'S', True, False);  // TK 7818
  chkPoseeCartasDoc.Checked := ExisteSqlEx('SELECT 1 FROM SIN.SCI_INCACARTASDOC ' +
                                           ' WHERE ci_idexpediente = :id',[sdqBusquedaEX_ID.AsInteger]);  // TK 7725
  chkGrandesSueldos.Checked := (ValorSql('SELECT art.trabajador.get_isgrandessueldos(ex_cuil, ex_contrato) FROM ART.SEX_EXPEDIENTES ' +
                                          'WHERE ex_id = ' + SqlInt(sdqBusquedaEX_ID.AsInteger)) = 'S');        // TK 63144

  mnuViajarContCartasDoc.Enabled := chkPoseeCartasDoc.Checked {$IFDEF SINIESTROS}and frmPrincipal.Seguridad.Activar(frmPrincipal.mnuListContCartasDoc){$ENDIF};    // TK 7725
  DoCargarEstado;
  DoHabilitarBtnCobroIncap; // Lu TK 8805
  btnSiniMasDatos.Enabled := True;  // TK 17565
  tbDigitalizar.Enabled   := True;  // TK 19977

  sBloqueados := GetConceptosBloqueados(IdExpediente);
  if (sBloqueados <> '') then
    InfoHint(edSiniestro, 'Atención: el siniestro posee los siguientes conceptos bloqueados: ' + sBloqueados);


  sSql := 'SELECT pe_fechaaltamedica, te_descripcion ' +
           ' FROM sin.spe_partedeegreso, sin.ste_tipoegreso ' +
          ' WHERE pe_idtipodeegreso = te_id ' +
            ' AND te_id = 7 ' +      //tipo de egreso = intercurrencia
            ' AND pe_idexpediente = :idex ';
  with GetQueryEx(sSql, [IdExpediente]) do
  try
    if not Eof then
      MsgBox('Fecha de alta médica: ' + FieldByName('pe_fechaaltamedica').AsString + #13 +
             'Tipo de egreso: ' + FieldByName('te_descripcion').AsString, MB_ICONQUESTION);
  finally
    Free;
  end;

  inherited;
  MostrarDatosDigitalizacion;
  Do_CompletarJuiciosYMediaciones;  // TK 43890
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraTrabajadorSIN.Clear;
  edSiniestro.Clear;
  edSinFecha.Clear;
  edFechaAlta.Clear;
  edEstadoRecCero.Clear;
  edEstadoRecMax.Clear;
  edDiagnostico.Clear;
  edGTrabajo.Clear;
  edDelegacion.Clear;
  edGravedad.Clear;
  edTipo.Clear;
  edExpedIncap.Clear;
  fraCie10.Clear;   // TK 13615
  rbEventosActivos.Checked  := True;
  chkEvalErgonomica.Checked := False;
  chkEsPluriempleo.Checked  := False;
  chkPoseeCartasDoc.Checked := False; // TK 7725
  chkGrandesSueldos.Checked := False; // TK 63144
  IdExpediente       := 0;
  Siniestro          := 0;
  Orden              := 0;
  Recaida            := 0;
  tbDigitalizar.Enabled := False;

  lblPoseeDni.Enabled       := False;
  lblPoseeRecSueldo.Enabled := False;
  DigColorFondo;
  rpNL_MARCADO.ItemIndex := -1;
  btnSiniMasDatos.Enabled := False;   // TK 17565
  tbNoRecitar.Enabled := false;
  tbReenviarPedidoTurnoSRT.Enabled := False;

  edJUICIO.Clear;
  edMEDIACIONES.Clear;

  edSiniestro.SetFocus;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoCargarEstado;
var
  sSql :String;
begin
  sSql := 'SELECT art.inca.get_expedienteincapacidad(:IdExped) FROM dual ';
  edExpedIncap.Text := ValorSqlEx(sSql, [IdExpediente]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edExpedIncapKeyPress(Sender: TObject; var Key: Char);
var
  sSql :String;
  SdqExp :TSDQuery;
begin
  if Key = #13 then
  begin
    sSql := 'SELECT ix_siniestro, ix_orden, ix_recaida ' +
             ' FROM six_expedientesincapacidad ' +
            ' WHERE ix_fbaja IS NULL ' +
              ' AND ix_expedincapacidad = :Exped ';
    SdqExp := GetQueryEx(sSql, [edExpedIncap.Text]);
    try
      if SdqExp.Eof then
        MsgBox('El Expediente de Incapacidad no existe.')
      else begin
        edSiniestro.SetValues(SdqExp.Fields[0].AsInteger,
                              SdqExp.Fields[1].AsInteger,
                              SdqExp.Fields[2].AsInteger);
        tbRefrescarClick(Nil);
      end;
    finally
      SdqExp.Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edSiniestroSelect(Sender: TObject);
begin
  if not ExisteSql('SELECT 1 FROM sex_expedientes ' +
                   ' WHERE ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                     ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                     ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida))
     or (not ValidarSiniestroUsuarioTerce(edSiniestro.Siniestro, edSiniestro.Orden, 0)) then
  begin
     MsgBox('No existe el siniestro seleccionado o bien Ud. no posee permisos para visualizarlo.', MB_ICONEXCLAMATION);
     tbLimpiarClick(Nil);
  end else
  begin
    tbRefrescarClick(Nil);
    Do_GenerarCartelTipoEgreso(IdExpediente);   // TK 28227 (en unRedPres, hacerlo tambien en Parte Evolutivo de Redpres!!)
  //  Do_CompletarJuiciosYMediaciones;  // TK 43890
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.sbtnBuscarClick(Sender: TObject);
var
  iOldIdTrabajador, iNewIdTrabajador: integer;
begin
  ShortCutControl.Enabled := False;
  try
    iOldIdTrabajador := Get_IdExpediente(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
    iNewIdTrabajador := GetIdSiniestro(fraEmpresa.Value, fraTrabajadorSIN.Value,
                                       iOldIdTrabajador, edSinFecha.Date);
    fraTrabajadorSIN.IdSiniestro := iNewIdTrabajador;
    if (fraTrabajadorSIN.IdSiniestro <> ART_EMPTY_ID) and
       (iOldIdTrabajador <> fraTrabajadorSIN.IdSiniestro) then
      OnTrabajadorChange(fraTrabajadorSIN);
  finally
    ShortCutControl.Enabled := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.FormCreate(Sender: TObject);
var
  i :Integer;
begin
  inherited;
  dHoy := DBDateTime;
  mnuViajarSiniestros.Enabled     := frmPrincipal.Seguridad.Claves.IsActive('VerSiniestros') ;
  mnuViajarLiquidaciones.Enabled  := frmPrincipal.Seguridad.Claves.IsActive('VerLiquidaciones');
  MemoTextoFijo.Visible := False;
  LockControl(edUsuarioAltaEventoRemito,True);

  fraTrabajadorSIN.MostrarRelaLaboral := True;
  fraTrabajadorSIN.SinEstablecimiento := True;
  fraTrabajadorSIN.SoloSiniestrados   := True;
  fraTrabajadorSIN.OnChange           := OnTrabajadorChange;
  fraEmpresa.OnChange                 := OnEmpresaChange;
  fraEmpresa.ShowBajas                := True;
  fraEvento.OnChange                  := OnEventoChange;  // Lu WF 7775
  LockControls([chkNiegaFirmarIncap, chkAFavorART], True);     // Lu TK 7039  // Lu TK 9043
  lblNiegaFirmarIncap.Enabled         := False;
  tbSinAntCobIncap.Enabled            := False; // Lu TK 8805
  tbDigitalizar.Enabled               := False;  // TK 19977

  //Datasources
  fraFirmanteBaja.cmbDescripcion.DataSource      := fraFirmanteBaja.dsDatos;
  fraFirmante_elim.cmbDescripcion.DataSource     := fraFirmante_elim.dsDatos;

  dcFechaDefuncion.MaxDate            := DBDate - 1;

  with fraMotivo do
  begin
    TableName       := 'SIN.SMI_MOTIVOINCAPACIDAD';
    FieldID         := 'MI_ID';
    FieldCodigo     := 'MI_CODIGO';
    FieldDesc       := 'MI_DESCRIPCION';
    FieldBaja       := 'MI_FECHABAJA';
    ShowBajas       := False;
    ExtraFields     := ', MI_EXIGEFDICTAMEN, MI_GENERAEVENTO ';
  end;

  with fraComMedica do
  begin
    TableName       := 'SIN.SCM_COMISIONMEDICA';
    FieldID         := 'CM_ID';
    FieldCodigo     := 'CM_CODIGO';
    FieldDesc       := 'CM_DESCRIPCION';
    FieldBaja       := 'CM_FECHABAJA';
    ShowBajas       := False;
  end;
  with fraMedico do
  begin
    TableName       := 'MAU_AUDITORES';
    FieldID         := 'AU_AUDITOR';
    FieldCodigo     := 'AU_AUDITOR';
    FieldDesc       := 'AU_NOMBRE';
    FieldBaja       := 'AU_FBAJA';
    ShowBajas       := True;
    ClearOnChange   := False;
  end;
  with fraUbicIncap do
  begin
    TableName       := 'SIN.SUI_UBICACIONINCAPACIDAD';
    FieldID         := 'UI_ID';
    FieldCodigo     := 'UI_CODIGO';
    FieldDesc       := 'UI_DESCRIPCION';
    FieldBaja       := 'UI_FECHABAJA';
    ShowBajas       := False;
  end;

  with fraFirmante do
  begin
    TableName     := 'CFI_FIRMA';
    FieldID       := 'FI_ID';
    FieldCodigo   := 'FI_ID';
    FieldDesc     := 'FI_FIRMANTE';
    FieldBaja     := 'FI_FECHABAJA';
    ShowBajas     := True;
    ClearOnChange := False;
  end;

  with fraFirmante_elim do
  begin
    TableName     := 'CFI_FIRMA';
    FieldID       := 'FI_ID';
    FieldCodigo   := 'FI_ID';
    FieldDesc     := 'FI_FIRMANTE';
    FieldBaja     := 'FI_FECHABAJA';
    ShowBajas     := True;
    ClearOnChange := False;
  end;

  with fraFirmanteBaja do
  begin
    TableName   := 'CFI_FIRMA';
    FieldID     := 'FI_ID';
    FieldCodigo := 'FI_ID';
    FieldDesc   := 'FI_FIRMANTE';
    FieldBaja   := 'FI_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraContingenciaDic do
  begin
    TableName       := 'SIN.STA_TIPOACCIDENTEDICTAMEN';
    FieldID         := 'TA_ID';
    FieldCodigo     := 'TA_ID';
    FieldDesc       := 'TA_DESCRIPCION';
    OrderBy         := 'ID';
    ClearOnChange   := False;
  end;

  with fraArea do            // Lu TK 2560
  begin
    TableName      := 'CTB_TABLAS';
    FieldID        := 'TB_ID';      // Lu 28/01/2009 se cambio porque el tb_codigo es char y daba error en el IsEmpty del FraArea
    FieldCodigo    := 'TB_CODIGO';
    FieldDesc      := 'TB_DESCRIPCION';
    FieldBaja      := 'TB_FECHABAJA';
    ExtraCondition := 'AND TB_CLAVE = ''AREAM'' AND TB_CODIGO <> ''0'' ';    // TK 21336
    OrderBy        := 'TB_CODIGO';
    ShowBajas      := True;
  end;

   with fraCodDigitalizacion do
   begin
     TableName      := 'ARCHIVO.RTD_TIPODOCUMENTO';
     FieldID        := 'TD_ID';
     FieldCodigo    := 'TD_CODIGO';
     FieldDesc      := 'TD_DESCRIPCION';
     OrderBy        := 'TD_CODIGO';
     ExtraCondition := 'AND TD_INCAPACIDAD = ''S'' ' +
                       'AND TD_FECHABAJA IS NULL ' +
                       'AND EXISTS (SELECT 1 ' +
                                     'FROM ARCHIVO.RAD_TIPOARCHIVODOCUMENTO, ARCHIVO.RTA_TIPOARCHIVO ' +
                                    'WHERE AD_IDTIPODOCUMENTO = TD_ID ' +
                                      'AND AD_IDTIPOARCHIVO = TA_ID ' +
                                      'AND AD_FECHABAJA IS NULL ' +
                                      'AND TA_ID = ' + SqlValue(ID_CARPETA_INCAPACID) + ')';  // Incapacidades
     ExtraFields    := '';
  end;

  with fraTipoDocumentoAGA.Propiedades do
    ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                     'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                    'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(ID_CARPETA_INCAPACID) + ' ' +
                                      'AND AD_FECHABAJA IS NULL ' +
                                      'AND AD_IDTIPODOCUMENTO = TD_ID) ' +
                       'AND TD_CODIGO <> ' + SqlValue(CODDOC_LOTE);

  SetSqlEvento(False);

  SetLength(aNiveles, 0);
  for i := 0 to 3 do
    if Seguridad.Claves.IsActive('PerfilEvento' + IntToStr(i)) then
    begin
      SetLength(aNiveles, Length(aNiveles) + 1);
      aNiveles[Length(aNiveles)-1] := IntToStr(i);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.OnTrabajadorChange(Sender: TObject);
begin
  with fraTrabajadorSIN do
    if sdqDatos.Active then
    begin
       Self.edSiniestro.SetValues(sdqDatos.FieldByName('EX_SINIESTRO').AsInteger,
                                  sdqDatos.FieldByName('EX_ORDEN').AsInteger,
                                  0 {sdqDatos.FieldByName('EX_RECAIDA').AsInteger});
       tbRefrescarClick(Nil);
       Do_CompletarJuiciosYMediaciones;
    end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetPermiteEventos(bEsNoLiquidar:boolean = False) :Boolean;
//devuelve verdadero si se permite dar de alta un evento de incapacidad para el siniestro
var sSql: string;
begin
  sSql := ' SELECT Nvl(ex_estado, '' '') Estado, Nvl(ex_causafin, '' '') CausaFin ' +    // por TK 59862 "causafin" (excepción de los Rechazados y Unic. Prest. en especie)
            ' FROM art.sex_expedientes ' +
           ' WHERE ex_id = :IdExped ';

  with GetQueryEx(sSql, [IdExpediente]) do
  try
    if bEsNoLiquidar then                                     // por TK 59862 (excepción de los Rechazados y Unic. Prest. en especie)
      Verificar((FieldByName('Estado').AsString = '03') and (FieldByName('CausaFin').AsString <> '02') and (FieldByName('CausaFin').AsString <> '03') , Nil, 'El siniestro se encuentra cerrado.')
    else
      Verificar((FieldByName('Estado').AsString = '03'), Nil, 'El siniestro se encuentra cerrado.');      // Cambiado por mail que le llego a Paula de un error.
  finally
    Free;
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbNuevoClick(Sender: TObject);
var
  sExped, sDict, sMensaje, sSqlAcu, sGenAutoriz121: String;
  iCodPrest, iIdEvApelacion, iRecaida, iIdExpediente: Integer;
  bGenerarCarta: Boolean;   // TK 16166
begin
  if not(HaySiniestroActivo) then
    InfoHint(edSiniestro, 'Debe seleccionar un siniestro.', True);

  Verificar(ExisteSqlEx('SELECT 1 ' +
                         ' FROM sev_eventosdetramite, sin.sei_eventoincapacidad ' +
                        ' WHERE ev_codigo = ei_codigo ' +
                          ' AND ev_idexpediente = :IdExped ' +
                          ' AND ei_cierrainca = ''S'' ' +
                          ' AND ev_evento > 0', [IdExpediente]), Nil,
            'No puede dar de alta eventos ya que la incapacidad se encuentra cerrada.');

  DoLimpiarDatosEvento(True);
  fpEventos.Caption := 'Alta de Evento';
  Accion            := Alta;
  SetSqlFrames(True);
  if (fpEventos.ShowModal = mrOk) then
  try

    BeginTrans;
    if bEsDictamen then
    begin
      sExped := GetExpedienteAsociado;
      if (sExped = '') then
        raise Exception.Create('No se seleccionó un expediente de incapacidad.');
    end;
    if not(GetDictamenApelacion(sDict)) then
      raise Exception.Create('No se seleccionó un dictamen de apelación.');

    iIdEvApelacion := GetRelacionConApelacion(fraEvento.Codigo);  // Lu TK 9043

    sSqlAcu := GetDatosAcuerdo;
    if (sSqlAcu = '') then
    begin
      Rollback(True);
      Exit;
    end;

    iNuevoEvento := GetSecNextVal('SEQ_SEV_ID'); //lo traigo aca porque despues lo necesito..

    DoGuardarFechaDictamen;
    iCodPrest := GetPrestEstCompl;              // Lu TK 4345

    sGenAutoriz121 := Get_EvaluarGenAutorizacion(fraEvento.Codigo);          // TK 11992

    Do_CargarRecaida_ExtensionILT(fraEvento.Codigo, iNuevoEvento, iRecaida, iIdExpediente);  // Por plan Extensión ILT

    DoGuardarDatosEvento(True, True, sExped, edIDDocAsoc.Value, sDict, iNuevoEvento, iCodPrest, sSqlAcu, iIdEvApelacion, sGenAutoriz121, iRecaida, iIdExpediente);   // Por plan Extensión ILT (agrego nuevo parametro iRecaida)

    DoDigitalizar;
    DoCierreAutomatico;

    // Este bGenerarCarta tiene que estar primero de todos.
    bGenerarCarta := not Es_EmpresaPresidenciaNacion
                     and ((fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString <> CODCARTADOC_PORCINCAP)    // Esto se hace siempre, menos cuando el codigo de la carta es CODCARTADOC_PORCINCAP, y no esté chequeado el chkNiegaFirmarIncap.
                          or chkNiegaFirmarIncap.Checked);

    if (fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString = CODCARTADOC_INC_D) then      // TK 66201 - Plan Tramite Medico
      bGenerarCarta := {(fraMotivo.Codigo = MOTIVO_HOMOLOGACION)
                        and} not Es_EmpresaPresidenciaNacion
                        and (MsgBox('¿Desea generar la Carta Documento para notificar al Trabajador?', MB_ICONQUESTION + MB_YESNO ) = IDYES);

    if (fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString = CODCARTADOC_CITREVMED)        // TK 24495
      or (fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString = CODCARTADOC_RECITINL)
      or (fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString = CODCARTADOC_TURESTCOM) then   // TK 25896
      bGenerarCarta := not Es_EmpresaPresidenciaNacion
                       and (MsgBox('¿Desea generar la Carta Documento?', MB_ICONQUESTION + MB_YESNO ) = IDYES);

    if bGenerarCarta then       // por TK 7039
      DoInsertarCartaDoc;

    sMensaje := DoValidacion(iNuevoEvento);    // TK 8772 (cambiado por este ticket)

    Verificar(AreIn(fraEvento.sdqDatos.FieldByName('EI_GRUPOVALIDACION').AsString, ['4', '5', '6']) AND (sMensaje <> ''), nil, sMensaje);     // TK 8772  // TK 59620 (a raíz de este ticket, agregue el '6' en el grupo validación).

    DoGenerarCitacionPresidencia(iNuevoEvento);
    DoGenerarNotaEntregaReq(edSiniestro.Siniestro, iIdExpediente);
    DoGenerarNotaRectificatoria(edSiniestro.Siniestro, fraComMedica.Codigo, iIdExpediente);
    DoEnviarTelegrama(False, dcFecha.Text, mskHora.Text, fraUbicIncap.Descripcion);  // tuve que cambiarlo por el ticket 6887
  //  DoEnviarCartaDocEmpAltaMed(fraEvento.Codigo, dcFecha.Text, mskHora.Text, fraUbicIncap.Descripcion);     // Lu TK 11473  // TK 28602 se comenta por este ticket, ya no sale mas dicha carta.
    DoGenerarPlanillaSiniParaReingresar(fraEvento.Codigo, edSiniestro.Siniestro, iIdExpediente); // TK 11993
    DoGenerarNotaDesestimoApelacion(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, IdExpediente, fraComMedica.cmbDescripcion.Text);  // TK 17681
    DoGenerarPlanillaSiniRecalif(edSiniestro.Siniestro, iIdExpediente);  // TK 18591
    DoImprimirCaratula(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);  // TK 21671
    DoGenerarNotaReqCarDef(fraTrabajadorSIN.Nombre, fraTrabajadorSIN.CUIL, iIdExpediente, iNuevoEvento);     // TK 62062
    DoEnviarNotifPedidoDocum;   // TK 60625

    DoFecha2daCit(iNuevoEvento);
  //  DoFechaAltaDictamen(IdExpediente, iNuevoEvento);  // TK 22901 (nuevo pedido)    // Comentado por ticket 44287
    Do_SubMotivos(iNuevoEvento);    // TK 33601

     // Plan Tramites Medicos (TK 66089)
    DoGenerarTramitesMedicos(fraEvento.Codigo);

    CommitTrans;
    GestionarDictamenAGAySIC;
    GestionarConstanciaDomicCobro;  // TK 62690

    DoEnvioMailArea(fraEvento.Codigo, fraArea.Codigo); // Lu TK 2560
    DoEnvioMailPluriempleo(fraEvento.Codigo);          // Lu TK 10277
    DoEnviarMail_SiniParaReingresar(iNuevoEvento);     // Lu TK 11993
    DoEnviarMailPatCron;

    tbRefrescarClick(Nil);
    MsgBox('Los datos del evento se guardaron correctamente.', MB_ICONINFORMATION);
  except
  on E: Exception do
    begin
      if InTransaction then
      begin
        Rollback;
        if (sMensaje = '') then
          ErrorMsg(E, 'Error al grabar los datos del evento.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.FSFormShow(Sender: TObject);
begin
  inherited;
  edSiniestro.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnLimpiarClick(Sender: TObject);
begin
  DoLimpiarDatosEvento(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnGuardarClick(Sender: TObject);
begin
  if ValidarDatos then fpEventos.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarDatos :Boolean;
begin
  Result := ValidarEvento        and ValidarFecha         and ValidarHora and ValidarSiniestroTurnoSRT and  // Plan Tramites medicos
            ValidarFechaVencim   and ValidarFechaRecep    and ValidarMotivo and ValidarMotivoIgual and
            ValidarComision      and ValidarComisionIgual and ValidarMedico and ValidarNivel and    // TK 7306
            ValidarFirmante      and ValidarUbicacion     and ValidarPorcentaje and
            ValidarChecks        and ValidarFechaIncaDef  and ValidarFechaIncaProv and
            ValidarDictamen      and ValidarDocumentacion and ValidarArea and      // Lu TK 2560
            ValidarObservaciones and ValidarCitacionAfonia_y_DerInlex and          // TK 17012
            ValidarDerInlexConPluri and ValidarSiniCitacionAnioILT and    // ValidarDerInlexConPluri: TK 28086;  ValidarSiniCitacionAnioILT: TK 48457
            ValidarTurnosMedicosSRT and ValidarPorcentajeIntegral;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarFecha :Boolean;
var
  sFechaPos, sFechaPosxCit :String;
  iDiasPos :Integer;
begin
  Verificar(dcFecha.IsEmpty, dcFecha, 'Debe ingresar fecha de evento.');
  sFechaPos     := fraEvento.sdqDatos.FieldByName('EI_FECHAPOSTERIOR').AsString;
  sFechaPosxCit := fraEvento.sdqDatos.FieldByName('EI_FECHAPOSTXCIT').AsString;  // TK 4345

  iDiasPos  := Iif((sFechaPos = 'N') and not(fraEvento.sdqDatos.FieldByName('EI_DIASPOS').IsNull),
                   fraEvento.sdqDatos.FieldByName('EI_DIASPOS').AsInteger, 0);
  Verificar((sFechaPos = 'S') and (dcFecha.Date > (DBDate + 60)), dcFecha,
            'La fecha del evento no puede ser superior a la actual + 60 días.');
  Verificar((sFechaPos = 'N') and (dcFecha.Date > (DBDate + iDiasPos)), dcFecha,
            'La fecha del evento no puede ser superior a la actual' +
            iif((iDiasPos > 0), ' + ' + IntToStr(iDiasPos) + ' días.', '.'));
  Verificar((dcFecha.Date < sdqBusquedaEX_FECHAACCIDENTE.AsDateTime), dcFecha,
            'La fecha del evento no puede ser menor que la del accidente.');
  Verificar((sFechaPosxCit = 'S') and (dcFecha.Date < DBDate), dcFecha,
            'La fecha del evento no puede ser menor que la actual.');                 // TK 4345

  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarHora :Boolean;
var
  sExigeHora :String;
begin
  sExigeHora := fraEvento.sdqDatos.FieldByName('EI_EXIGEHORA').AsString;
  Verificar((sExigeHora = 'S') and (Trim(mskHora.Text) = ':'), mskHora, 'La Hora es obligatoria para este código de evento.');
  Verificar((sExigeHora = 'S') and not(IsTime(mskHora.Text)), mskHora, 'Hora incorrecta.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarFechaVencim :Boolean;
begin
  Verificar((fraEvento.sdqDatos.FieldByName('EI_VENCIMIENTO').AsString = 'S') and
             dcFechaVencim.IsEmpty, dcFechaVencim, 'La fecha de vencimiento es obligatoria para este código de evento.');
  Verificar(not(dcFechaVencim.IsEmpty) and (dcFechaVencim.Date < sdqBusquedaEX_FECHAACCIDENTE.AsDateTime),
            dcFechaVencim, 'La fecha de vencimiento no puede ser menor que la del accidente.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarFechaRecep :Boolean;
var
  sExigeFecha :String;
begin
  sExigeFecha := fraEvento.sdqDatos.FieldByName('EI_RECEPCION').AsString;
  Verificar((sExigeFecha = 'S') and dcFechaRecep.IsEmpty, dcFechaRecep,
            'La fecha de recepción es obligatoria para este código de evento.');
  Verificar(not(dcFechaRecep.IsEmpty) and (dcFechaRecep.Date < dcFecha.Date), dcFechaRecep,
            'La fecha de recepción no puede ser menor que la del evento.');
  Verificar(not(dcFechaRecep.IsEmpty) and (dcFechaRecep.Date > DBDate), dcFechaRecep,
            'La fecha de recepción no puede ser mayor que la actual.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarMotivoIgual: Boolean;       // Lu TK 6002
var sMotivo: string;
begin
  sMotivo := fraEvento.sdqDatos.FieldByName('EI_MOTIVOIGUAL').AsString;
  Verificar((sMotivo <> '') and (sMotivo <> fraMotivo.Codigo)
             , fraMotivo, 'El motivo debe ser ' + sMotivo + ' para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarComisionIgual: Boolean;    // Lu TK 7306
var sComision: string;
begin
  sComision := fraEvento.sdqDatos.FieldByName('EI_COMISIONIGUAL').AsString;
  Verificar((sComision <> '') and (sComision <> fraComMedica.Codigo)
             , fraComMedica, 'La comisión debe ser ' + sComision + ' para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnCancelarClick(Sender: TObject);
begin
  inherited;
  DoLimpiarDatosEvento(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoCargarDatosEvento(iIdEvento :Integer; bCargaEvento, bEventoRel :boolean);
var
  sSql :String;
  sdqAux :TSDQuery;
begin
  SetSqlFrames(False);
  sSql := 'SELECT ev_idevento, ev_fecha, ev_hora, ev_fechavencimiento, ev_fecharecepcion, ' +
                ' ev_motivo, ev_comision, ev_medico, ev_firma, ev_codubic, ev_porcincapacidad, ' +
                ' ev_grado, ev_caracter, ev_graninc, ev_tratamiento, ev_retroactivo, ' +
                ' ev_recalificacion, ev_estudios, ev_reingreso, ev_enfinculpable, ' +
                ' ev_abandonotratamiento, ev_inicioincadef, ev_observaciones, ev_codigo, ' +
                ' ev_fechaalta, ev_fecharetroactivo, ev_inicio_prov, ev_accidnolaboral, ' +
                ' ev_mortal, ev_fechadefuncion, ev_complementario, ev_recupero, ' +
                ' ev_idseg_dictamen, ev_prescripto, ev_envarea, ev_nofirmincap, ' +
                ' ev_idaccidentedictamen, ev_idcie101, ev_idcie102, ev_afavorart, ev_excluirdictant, ' +       // TK 9043
                ' ev_chkfecapelacion, ev_chkfecrectificatoria, ev_ArchivoAsociado, ev_integral, ev_prevencion, ' +    // TK 28017
                ' ev_recaida, ev_porcIntegral, ev_patcron ' +
           ' FROM sev_eventosdetramite ' +
          ' WHERE ev_idevento = ' + SqlInt(iIdEvento);
  sdqAux := GetQuery(sSql);
  with sdqAux do
  try
    if bCargaEvento then
      fraEvento.Codigo          := FieldByName('EV_CODIGO').AsString;
    dcFecha.Date                := FieldByName('EV_FECHA').AsDateTime;
    mskHora.Text                := FieldByName('EV_HORA').AsString;
    dcFechaVencim.Date          := FieldByName('EV_FECHAVENCIMIENTO').AsDateTime;
    dcFechaRecep.Date           := FieldByName('EV_FECHARECEPCION').AsDateTime;
    fraMotivo.Codigo            := FieldByName('EV_MOTIVO').AsString;
    fraArea.Codigo              := FieldByName('EV_ENVAREA').AsString;   // Lu TK 2560
    fraComMedica.Codigo         := FieldByName('EV_COMISION').AsString;
    fraMedico.Codigo            := FieldByName('EV_MEDICO').AsString;
    fraUbicIncap.Codigo         := FieldByName('EV_CODUBIC').AsString;
    edPorcentaje.Text           := FieldByName('EV_PORCINCAPACIDAD').AsString;
    chkGranInvalidez.Checked    := IIF((FieldByName('EV_GRANINC').AsString = 'S'), True, False);
    chkTratamiento.Checked      := IIF((FieldByName('EV_TRATAMIENTO').AsString = 'S'), True, False);
    chkRetroactivo.Checked      := IIF((FieldByName('EV_RETROACTIVO').AsString = 'S'), True, False);
    dcFechaRetro.Date           := FieldByName('EV_FECHARETROACTIVO').AsDateTime;
    chkRecalificacion.Checked   := IIF((FieldByName('EV_RECALIFICACION').AsString = 'S'), True, False);
    chkEstudios.Checked         := IIF((FieldByName('EV_ESTUDIOS').AsString = 'S'), True, False);
    chkReingreso.Checked        := IIF((FieldByName('EV_REINGRESO').AsString = 'S'), True, False);
    chkPatCron.Checked          := IIF((FieldByName('EV_PATCRON').AsString = 'S'), True, False);
    chkEnfInculpable.Checked    := IIF((FieldByName('EV_ENFINCULPABLE').AsString = 'S'), True, False);
    chkAbandono.Checked         := IIF((FieldByName('EV_ABANDONOTRATAMIENTO').AsString = 'S'), True, False);
    chkAccidNoLab.Checked       := IIF((FieldByName('EV_ACCIDNOLABORAL').AsString = 'S'), True, False);
    dcIncDef.Date               := FieldByName('EV_INICIOINCADEF').AsDateTime;
    dcIncProv.Date              := FieldByName('EV_INICIO_PROV').AsDateTime;
    edObservaciones.Lines.Text  := FieldByName('EV_OBSERVACIONES').AsString;
    chkMortal.Checked           := IIF((FieldByName('EV_MORTAL').AsString = 'S'), True, False);
    dcFechaDefuncion.Date       := FieldByName('EV_FECHADEFUNCION').AsDateTime;
    fraContingenciaDic.Codigo   := FieldByName('EV_IDACCIDENTEDICTAMEN').AsString;
    fraCIE101.Value             := FieldByName('EV_IDCIE101').AsInteger;
    fraCIE102.Value             := FieldByName('EV_IDCIE102').AsInteger;
    chkComplemento.Checked      := IIF((FieldByName('EV_COMPLEMENTARIO').AsString = 'S'), True, False);
    chkRecupero.Checked         := IIF((FieldByName('EV_RECUPERO').AsString = 'S'), True, False);
    chkPrescripto.Checked       := IIF((FieldByName('EV_PRESCRIPTO').AsString = 'S'), True, False);
    chkNiegaFirmarIncap.Checked := IIF((FieldByName('EV_NOFIRMINCAP').AsString = 'S'), True, False);  // TK 7039
    chkAFavorART.Checked        := IIF((FieldByName('EV_AFAVORART').AsString = 'S'), True, False);    // TK 9043
    chkExcluirDictAnt.Checked   := IIF((FieldByName('EV_EXCLUIRDICTANT').AsString = 'S'), True, False);     // TK 18160
    chkApelacion.Checked        := IIF(not(FieldByName('EV_CHKFECAPELACION').IsNull), True, False);      // TK 28017
    chkRectificatoria.Checked   := IIF(not(FieldByName('EV_CHKFECRECTIFICATORIA').IsNull), True, False); // TK 28017
    chkIntegral.Checked         := FieldByName('EV_INTEGRAL').AsString = 'S';
    edPorcIntegral.Text         := FieldByName('EV_PORCINTEGRAL').AsString;     // Plan casos Integrales
    chkPrevencion.Checked       := FieldByName('EV_PREVENCION').AsString = 'S';

    if (FieldByName('EV_GRADO').AsString = 'T') then
      rbTotal.Checked := True
    else
      rbParcial.Checked := True;
    if (FieldByName('EV_CARACTER').AsString = 'D') then
      rbDefinitivo.Checked := True
    else
      rbProvisorio.Checked := True;

    if sinCaracter then
    begin
      rbProvisorio.Checked := false;
      rbDefinitivo.Checked := false;
    end;

    DoCargarDocumentacion(FieldByName('EV_IDSEG_DICTAMEN').AsInteger);

    if bEventoRel then
      IdEventoRel := FieldByName('EV_IDEVENTO').AsInteger
    else
      IdEventoRel := 0;
    fraFirmante.Codigo := FieldByName('EV_FIRMA').AsString;
    edSiniestroABM.SetValues(Siniestro, Orden, FieldByName('EV_RECAIDA').AsInteger);    // por Plan Extension de ILT pongo la recaida que corresponde.
    edSiniestroABM.Recaida := FieldByName('EV_RECAIDA').AsInteger;
    IdEvento    := iIdEvento;
    dFechaAlta  := FieldByName('EV_FECHAALTA').AsDateTime;
    SetSqlFrames(True, False);

  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fraEventoPropiedadesChange(Sender: TObject);
begin
  if fraEvento.IsEmpty then Exit;

  if not ValidarDatosTrab then
    DoLimpiarDatosEvento(True)
  else begin
    DoLimpiarDatosEvento(False);
    LockControl(edPorcentaje, fraEvento.sdqDatos.FieldByName('EI_PORMINIMO').IsNull and
                              fraEvento.sdqDatos.FieldByName('EI_PORMAXIMO').IsNull);
    DoBloquearDictamen;
    DoBloquearPapeleria;

    VCLExtra.LockControls([edPorcIntegral], not (chkIntegral.Checked and ((sdqBusquedaEX_FECHAACCIDENTE.AsDateTime) >= StrToDate(FECHA_LEY26773))));

    if (fraEvento.sdqDatos.FieldByName('TI_CODIGO').AsString = 'T') then
      rbProvisorio.Checked := True;
    edPorcentaje.Text := fraEvento.sdqDatos.FieldByName('ei_porcdefecto').AsString;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoLimpiarDatosEvento(bLimpiarCodigo :Boolean);
begin
  if bLimpiarCodigo then fraEvento.Clear;
  dcFecha.Clear;
  mskHora.Clear;
  dcFechaVencim.Clear;
  dcFechaRecep.Clear;
  dcFechaRetro.Clear;
  fraMotivo.Clear;
  fraComMedica.Clear;
  fraMedico.Clear;
  fraFirmante.Clear;
  fraUbicIncap.Clear;
  edPorcentaje.Clear;
  dcIncDef.Clear;
  dcIncProv.Clear;
  dcFechaDefuncion.Clear;
  edObservaciones.Clear;
  fraContingenciaDic.Clear;
  edIDDocAsoc.Clear;
  mskCUITDocAsoc.Clear;
  cmbTrabDocAsoc.Clear;
  fraContingenciaDic.Clear;
  fraCIE101.Clear;
  fraCIE102.Clear;
  rbParcial.Checked           := True;
  rbDefinitivo.Checked        := True;
  chkGranInvalidez.Checked    := False;
  chkRecalificacion.Checked   := False;
  chkEnfInculpable.Checked    := False;
  chkTratamiento.Checked      := False;
  chkEstudios.Checked         := False;
  chkAbandono.Checked         := False;
  chkRetroactivo.Checked      := False;
  chkReingreso.Checked        := False;
  chkPatCron.Checked          := False;
  chkAccidNoLab.Checked       := False;
  chkMortal.Checked           := False;
  chkRecupero.Checked         := False;
  chkComplemento.Checked      := False;
  chkExcluirDictAnt.Checked   := False;
  chkPrescripto.Checked       := False;
  LockControls([chkNiegaFirmarIncap, chkAFavorART], True);     // Lu TK 7039
  chkAFavorART.Checked        := False;        // Lu TK 7039
  lblAFavorART.Enabled        := False;
  chkNiegaFirmarIncap.Checked := False;
  chkApelacion.Checked        := False;  // TK 28017
  chkRectificatoria.Checked   := False;
  chkIntegral.Checked         := False;
  chkPrevencion.Checked       := False;

  IdEventoRel := 0;
  fraArea.Clear;        // Lu TK 2560

end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbModificarClick(Sender: TObject);
var
  sSqlAcu: String;
begin
  if not(HayRegistroActivo) then exit;
  DoLimpiarDatosEvento(True);
  fpEventos.Caption := 'Modificación de Evento';
  Accion            := Edicion;

  if sdqConsulta.FieldByName('EI_CARACTERNULO').AsString = 'S' then
    sinCaracter := true
  else
    sinCaracter := false;

  DoCargarDatosEvento(sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger, True, False);
  try
    if (fpEventos.ShowModal = MrOk) then
    begin

      sSqlAcu := GetDatosAcuerdo;
      if (sSqlAcu = '') then Exit;

      DoGuardarDatosEvento(False, False, '', 0, '', 0, 0, sSqlAcu);

      if (fraEvento.sdqDatos.FieldByName('EI_DIGITALMODIF').AsString = 'S') then  // Lu TK 2034
        DoDigitalizar;

      tbRefrescarClick(Nil);
      MsgBox('Los datos del evento se guardaron correctamente.', MB_ICONINFORMATION);
    end;
  except
  on E: Exception do
     ErrorMsg(E, 'Error al grabar los datos del evento.' + E.Message);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.GridDblClick(Sender: TObject);
begin
  if tbModificar.Enabled then tbModificarClick(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoGuardarDatosEvento(bEsAlta, bEnTransaccion :Boolean;
                                                    sExpedIncap :String = '';
                                                    IdSegDictamen :Integer = 0;
                                                    sDictamenApel :String = '';
                                                    IdNuevoEvento :Integer = 0;
                                                    IdPrest :Integer = 0;
                                                    sSqlAcu: String = '';
                                                    iIdEvApelacion: Integer = 0;
                                                    sUsuQuiereAut: String = 'N';
                                                    iRecaida: Integer = 0;
                                                    iIdExpediente: Integer = 0);
var
  sSql, sSqlOtroEvento, sSeModificoFecEvento :String;
  sdqAux :TSDQuery;
  dPorcIntegral: Double;
begin

  if (edPorcIntegral.Text <> '') then
    dPorcIntegral := StrToFloat(edPorcIntegral.Text)
  else
    dPorcIntegral := -1;

  sSeModificoFecEvento := '';
  
  if (sDictamenApel = '') then
    sDictamenApel := 'Null, Null';

  if (Accion = Replica) or (Accion = Edicion) then //si es una replica, traigo los datos del evento que estoy replicando
  begin
    sSql := 'SELECT ev_mortal, ev_fechadefuncion, ev_recupero, ev_complementario, ' +
                  ' ev_iddictamen, ev_motivoapelacion, ev_idseg_dictamen, ev_observaciones, ev_semodificofechaevento, ' +
                  ' ev_expedincapacidad, ev_idaccidentedictamen, ev_idcie101, ev_idcie102, ev_idev_apelacion, ev_fecha ' +
             ' FROM sev_eventosdetramite ' +
            ' WHERE ev_idevento = :IdEv ';
    sdqAux := GetQueryEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger]);
    with sdqAux do
    try
      sqlDictamen   := SqlString(FieldByName('EV_MORTAL').AsString, True, True) + ',' +
                       SqlDate(FieldByName('EV_FECHADEFUNCION').AsDateTime) + ',' +
                       //SqlInt(FieldByName('EV_IDACCIDENTEDICTAMEN').AsInteger, True) + ',' +
                       SqlInt(strtoint(iif(fraContingenciaDic.Codigo <> '', fraContingenciaDic.Codigo, 0)), True) + ',' +
                     //  SqlInt(FieldByName('EV_IDCIE101').AsInteger, True) + ',' +
                     //  SqlInt(FieldByName('EV_IDCIE102').AsInteger, True) + ',' +
                       SqlInt(fraCIE101.Value, True) + ',' +                         // TK 19343
                       SqlInt(fraCIE102.Value, True) + ',' +
                       //SqlString(FieldByName('EV_RECUPERO').AsString, True, True) + ',' +
                       IIF(chkRecupero.Checked, '''S''', '''N''') + ',' +
                       SqlString(FieldByName('EV_COMPLEMENTARIO').AsString, True, True);
                       
      IdSegDictamen := FieldByName('EV_IDSEG_DICTAMEN').AsInteger;
      sExpedIncap   := FieldByName('EV_EXPEDINCAPACIDAD').AsString;  // arreglo 10/08/2010

      //if (dcFecha.Date <> FieldByName('EV_FECHA').AsDateTime) then    // TK 38460
      if (edobservaciones.text <> FieldByName('ev_observaciones').asstring) or (FieldByName('ev_semodificofechaevento').asstring = 'S') then     //Modificado por ticket 40520
        sSeModificoFecEvento := 'S';

      if (Accion = Replica) then
      begin
        sDictamenApel := SqlInt(FieldByName('EV_IDDICTAMEN').AsInteger, True) + ',' +
                         SqlString(FieldByName('EV_MOTIVOAPELACION').AsString, True, True);
      end;
    finally
      sdqAux.Free;
    end;

  end
  else begin
    if (sqlDictamen = '') then
      sqlDictamen := 'Null, Null, Null, Null, Null, Null, Null ';
  end;

  if (sSqlAcu = '') then
    sSqlAcu := 'Null, Null, Null, Null, Null';

  sSql := 'art.inca.do_insertarevento(' + SqlInt(Siniestro) + ',' +
                                          SqlInt(Orden) + ',' +
                                          SqlDate(dcFecha.Date) + ',' +
                                          SqlValue(fraEvento.Codigo) + ',' +
                                          IIF((dPorcentaje < 0), 'Null', 'Round(' + SqlNumber(dPorcentaje, False) + ',2)') + ',' +
                                          SqlValue(Sesion.UserId) +
                                          ', Null, ' +
                                          SqlValue(fraComMedica.Codigo) + ',' +
                                          SqlValue(edObservaciones.Lines.Text) + ',' +
                                          SqlDate(dcFechaVencim.Date) + ',' +
                                          SqlValue(fraMotivo.Codigo) + ',' +
                                          SqlValue(GetHoraCorrecta(mskHora.Text)) + ',' +
                                          SqlValue(fraMedico.Codigo) + ',' +
                                          IIF(rbParcial.Checked, '''P''', '''T''') + ',' +
                                          IIF(sinCaracter, SqlValue(''), iif(rbProvisorio.Checked, '''P''', '''D''')) + ',' +
                                          IIF(chkGranInvalidez.Checked, '''S''', '''N''') + ',' +
                                          IIF(chkTratamiento.Checked, '''S''', '''N''') + ',' +
                                          SqlValue(fraUbicIncap.Codigo) +
                                          ', Null, ' +
                                          IIF(chkRetroactivo.Checked, '''S''', '''N''') + ',' +
                                          IIF(chkRecalificacion.Checked, '''S''', '''N''') + ',' +
                                          IIF(chkEstudios.Checked, '''S''', '''N''') + ',' +
                                          IIF(chkReingreso.Checked, '''S''', '''N''') + ',' +
                                          IIF(chkEnfInculpable.Checked, '''S''', '''N''') + ',' +
                                          SqlValue(fraFirmante.edCodigo.Text) + ',' +
                                          SqlDate(dcFechaRecep.Date) + ',' +
                                          SqlDate(dcIncDef.Date) + ',' +
                                          IIF(chkAbandono.Checked, '''S''', '''N''') + ',' +
                                          IIF((IdEventoRel > 0), SqlInt(IdEventoRel), 'Null') + ',' +
                                          IIF((Accion = Replica), 'Null', IIF((IdNuevoEvento > 0), SqlInt(IdNuevoEvento), SqlInt(IdEvento))) + ',' +
                                          sqlDictamen + ',' +           // 7 columnas
                                          IIF((sExpedIncap <> ''), SqlValue(sExpedIncap), 'Null') + ',' +
                                          SqlDate(dcFechaRetro.Date) + ',' +
                                          IIF((IdSegDictamen > 0), SqlInt(IdSegDictamen), 'Null') + ',' +
                                          sDictamenApel + ',' +
                                          SqlDate(dcIncProv.Date) +
                                          ', Null,' +
                                          IIF(chkAccidNoLab.Checked, '''S''', '''N''') + ',' +
                                          SqlDate(dFechaDictamen) + ',' +
                                          IIF(bEsAlta, 'Null', SqlValue('M')) + ',' +
                                          IIF(chkPrescripto.Checked, '''S''', '''N''') + ',' +
                                          SqlValue(fraArea.Codigo) + ',' +                       // Lu TK 2560
                                          IIF(chkNiegaFirmarIncap.Checked, '''S''', 'Null') + ',' +  // Lu TK 7039
                                          IIF((IdPrest > 0), SqlInt(IdPrest), 'Null') + ',' +      // Lu TK 6887
                                          IIF(chkAFavorART.Checked, '''S''', 'Null') +  ',' +      // TK 9043
                                          sSqlAcu + ',' +
                                          IIF((iIdEvApelacion > 0), SqlInt(iIdEvApelacion), 'Null') + ',' +    // TK 9043
                                          SqlValue(sUsuQuiereAut) + ',' + // TK 11992
                                          IIF(chkExcluirDictAnt.Checked, '''S''', '''N''') + ',' +  // TK 18160
                                          IIF(chkApelacion.Checked, 'TRUNC(SYSDATE)', 'Null') + ',' +       // TK 28017
                                          IIF(chkRectificatoria.Checked, 'TRUNC(SYSDATE)', 'Null') + ',' +    // TK 28017
                                          SqlValue(sSeModificoFecEvento) + ',' +                              // TK 38460
                                          IIF(chkIntegral.Checked, '''S''', '''N''') + ',' +
                                          IIF(chkPrevencion.Checked, '''S''', '''N''') + ',' +
                                          SqlInt(iRecaida) + ',' +                                                // iRecaida Por Plan Extension de ILT
                                          IIF((iIdExpediente > 0), SqlInt(iIdExpediente), 'Null') + ',' +         // iRecaida Por Plan Extension de ILT
                                          IIF((dPorcIntegral < 0), 'Null', 'Round(' + SqlNumber(dPorcIntegral, False) + ',2)') + ',' +
                                          IIF(chkPatCron.Checked, '''S''', '''N''') + ');';     // Plan casos Integrales

  sSqlOtroEvento := '';
  if bEsAlta and not(fraEvento.sdqDatos.FieldByName('ei_generaotroevento').IsNull) and
    (fraMotivo.sdqDatos.FieldByName('mi_generaevento').AsString = 'S') then
    sSqlOtroEvento := 'art.inca.do_insertarevento(' + SqlInt(Siniestro) + ',' +
                                               SqlInt(Orden) +
                                               ', ART.ACTUALDATE,' +
                                               SqlValue(fraEvento.sdqDatos.FieldByName('ei_generaotroevento').AsString) + ',' +
                                               IIF((dPorcentaje < 0), 'Null', 'Round(' + SqlNumber(dPorcentaje, False) + ',2)') + ',' +
                                               SqlValue(Sesion.UserId) +
                                               ', Null, ' +
                                               SqlValue(fraComMedica.Codigo) + ',' +
                                               SqlValue(edObservaciones.Lines.Text) + ',' +
                                               SqlDate(dcFechaVencim.Date) + ',' +
                                               SqlValue(fraMotivo.Codigo) + ',' +
                                               SqlValue(GetHoraCorrecta(mskHora.Text)) + ',' +
                                               SqlValue(fraMedico.Codigo) + ',' +
                                               IIF(rbParcial.Checked, '''P''', '''T''') + ',' +
                                               IIF(sinCaracter, SqlValue(''), iif(rbProvisorio.Checked, '''P''', '''D''')) + ',' +
                                               IIF(chkGranInvalidez.Checked, '''S''', '''N''') + ',' +
                                               IIF(chkTratamiento.Checked, '''S''', '''N''') + ',' +
                                               SqlValue(fraUbicIncap.Codigo) +
                                               ', Null, ' +
                                               IIF(chkRetroactivo.Checked, '''S''', '''N''') + ',' +
                                               IIF(chkRecalificacion.Checked, '''S''', '''N''') + ',' +
                                               IIF(chkEstudios.Checked, '''S''', '''N''') + ',' +
                                               IIF(chkReingreso.Checked, '''S''', '''N''') + ',' +
                                               IIF(chkEnfInculpable.Checked, '''S''', '''N''') + ',' +
                                               SqlValue(fraFirmante.edCodigo.Text) + ',' +
                                               SqlDate(dcFechaRecep.Date) + ',' +
                                               SqlDate(dcIncDef.Date) + ',' +
                                               IIF(chkAbandono.Checked, '''S''', '''N''') + ',' +
                                               IIF((IdEventoRel > 0), SqlInt(IdEventoRel), 'Null') + ',' +
                                               SqlInt (GetSecNextVal('SEQ_SEV_ID')) + ',' +
                                               sqlDictamen + ',' +
                                               IIF((sExpedIncap <> ''), SqlValue(sExpedIncap), 'Null') + ',' +
                                               SqlDate(dcFechaRetro.Date) + ',' +
                                               IIF((IdSegDictamen > 0), SqlInt(IdSegDictamen), 'Null') + ',' +
                                               sDictamenApel + ',' + SqlDate(dcIncProv.Date) +
                                               ', Null,' +
                                               IIF(chkAccidNoLab.Checked, '''S''', '''N''') + ',' +
                                               IIF(bEsAlta, 'Null', SqlValue('M')) +
                                               ', Null, ' +
                                               IIF(chkPrescripto.Checked, '''S''', '''N''') + ',' +
                                               SqlValue(fraArea.Codigo) + ',' +       // Lu TK 2560
                                               IIF(chkNiegaFirmarIncap.Checked, '''S''', 'Null') + ',' +  // Lu TK 7039
                                               SqlInt(IdPrest) + ',' +     // Lu TK 6887
                                               IIF(chkAFavorART.Checked, '''S''', 'Null') + ',' +     // TK 9043
                                               sSqlAcu + ',' +
                                               IIF((iIdEvApelacion > 0), SqlInt(iIdEvApelacion), 'Null') + ',' +  // TK 9043
                                               SqlValue(sUsuQuiereAut) + ',' +  // TK 11992
                                               IIF(chkExcluirDictAnt.Checked, '''S''', '''N''') + ',' +          // TK 18160
                                               IIF(chkApelacion.Checked, 'TRUNC(SYSDATE)', 'Null') + ',' +       // TK 28017
                                               IIF(chkRectificatoria.Checked, 'TRUNC(SYSDATE)', 'Null') + ',' +  // TK 28017
                                               SqlValue(sSeModificoFecEvento) + ',' +                            // TK 38460
                                               IIF(chkIntegral.Checked, '''S''', '''N''') + ',' +
                                               IIF(chkPrevencion.Checked, '''S''', '''N''') + ',' +
                                               SqlInt(iRecaida) + ',' +                                          // iRecaida Por Plan Extension de ILT
                                               IIF((iIdExpediente > 0), SqlInt(iIdExpediente), 'Null') + ',' +   // iRecaida Por Plan Extension de ILT
                                               IIF((dPorcIntegral < 0), 'Null', 'Round(' + SqlNumber(dPorcIntegral, False) + ',2)') + ',' +   // Plan casos Integrales
                                               IIF(chkPatCron.Checked, '''S''', '''N''') + ');';

  if bEnTransaccion then
  begin
    EjecutarStoreST(sSql);
    if sSqlOtroEvento <> '' then
      EjecutarStoreST(sSqlOtroEvento)
  end
  else begin
    EjecutarStore(sSql);
    if sSqlOtroEvento <> '' then
      EjecutarStore(sSqlOtroEvento)
  end;
  if (dFechaDictamen > 0) then  // TK 19711
    Do_actualizarFechasAltaMedica(dFechaDictamen);

end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarNivel :Boolean;
begin
  Verificar(not(AreIn(fraEvento.sdqDatos.FieldByName('EI_NIVELPERFIL').AsString, aNiveles)),
            fraEvento, 'Ud. no posee permisos para cargar este evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarEvento :Boolean;
var
  sSql :String;
begin
  Verificar(fraEvento.IsEmpty or (fraEvento.Codigo = ''), fraEvento, 'Debe seleccionar evento.');
  sSql := 'SELECT art.inca.is_enevaluacioncierre(:IdExped) FROM dual';
  Verificar((fraEvento.Codigo < '250') and (ValorSqlEx(sSql, [IdExpediente]) = 'S'), fraEvento,
            'No puede generar eventos con código ' + fraEvento.Codigo + ' cuando el ' +
            'siniestro se encuentra en evaluación/cerrado.');
  sSql := 'SELECT art.inca.get_expedienteincapacidad(:IdExped) FROM dual';
  Verificar((fraEvento.sdqDatos.FieldByName('EI_NROEXPEDIENTE').AsString = 'S') and (ValorSqlEx(sSql, [IdExpediente]) = ''),
            fraEvento, 'El evento no se puede dar de alta porque falta expediente en SRT.');
  verificar((ValorSqlEx('select ei_pagaenjuicio from sin.sei_eventoincapacidad where ei_codigo = :cod', [fraevento.Codigo]) = 'S') and (GetConceptosBloqueados(IdExpediente) <> ''), fraEvento, 'Siniestro pagado en juicio');
  Result := True;

end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.HaySiniestroActivo :Boolean;
begin
  Result := sdqBusqueda.Active and not(edSiniestro.IsEmpty);
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbEliminarClick(Sender: TObject);
var bGenerarCarta_elim: boolean;
    iNroEventoBorrado: integer;
begin
  if HayRegistroActivo and (sdqConsulta.FieldByName('EI_TIPOEVENTO').AsInteger <> 16) and
    ValidarNivelBaja and MsgAsk('¿Confirma la baja del evento seleccionado?') then
  begin
     DoEnviarTelegrama(True, sdqConsulta.FieldByName('FECHA').AsString,
                      sdqConsulta.FieldByName('HORA').AsString,
                      sdqConsulta.FieldByName('UBICA').AsString);

     iNroEventoBorrado := DoBorrarEvento(sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger,Siniestro, Orden, False);
     bGenerarCarta_elim := not Es_EmpresaPresidenciaNacion
                           and ( ((sdqConsulta.FieldByName('EI_CARTADOC_ELIM').AsString = 'S')            // Esto es: si Genera Carta Elim se fija que si el codigo de carta es CODCARTADOC_INC_E (INC_E), entonces el motivo tiene que ser MOTIVO_HOMOLOGACION. En caso de que sea carta Elim y el codigo de carta NO sea INC_E, ahi tambien genera carta de eliminacion. (por TK 42338)
                                   and (sdqConsulta.FieldByName('EI_CODCARTADOC_ELIM').AsString = CODCARTADOC_INC_E)
                                   and (sdqConsulta.FieldByName('EV_MOTIVO').AsString = MOTIVO_HOMOLOGACION))
                                  OR ((sdqConsulta.FieldByName('EI_CARTADOC_ELIM').AsString = 'S') and
                                      (sdqConsulta.FieldByName('EI_CODCARTADOC_ELIM').AsString <> CODCARTADOC_INC_E))
                                  OR ((sdqConsulta.FieldByName('EI_CODCARTADOC_ELIM').AsString = CODCARTADOC_INC_E) and
                                      (sdqConsulta.FieldByName('EV_CODIGO').AsString = CODEVENTO_SOLTURNOSRT_CITACION)) )
                           and (MsgBox('¿Desea generar la Carta Documento para notificar al Trabajador?', MB_ICONQUESTION + MB_YESNO ) = IDYES);

     if bGenerarCarta_elim then
       DoInsertarCartaDoc_elim(iNroEventoBorrado);

     tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (sdqConsulta.FieldByName('EV_EVENTO').AsInteger < 0) then
    AFont.Color := clRed;
  if (sdqConsulta.FieldByName('EI_CODIGO').AsString = '950') then
    AFont.Color := clBlue;
  if (sdqConsulta.FieldByName('EI_CODIGO').AsString = '957') then
    AFont.Color := clBlue;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('PORCINCA')).DisplayFormat := '#0.00 %';
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarPorcentaje :Boolean;
var
  vPorMin, vPorMax :Double;
begin
  if ValidarEdPorcentaje then
  begin
    Verificar(dPorcentaje > 100, edPorcentaje, 'El porcentaje de incapacidad no puede ser mayor que 100.');
    if fraEvento.sdqDatos.FieldByName('EI_PORMINIMO').IsNull then
    begin
      Verificar((dPorcentaje > 0), edPorcentaje, 'Este código de evento debe cargarse sin porcentaje.');
    end
    else begin
      vPorMin := fraEvento.sdqDatos.FieldByName('EI_PORMINIMO').AsCurrency;
      vPorMax := fraEvento.sdqDatos.FieldByName('EI_PORMAXIMO').AsCurrency;
      Verificar((vPorMin = 0) and (vPorMax = 0) and
              ((edPorcentaje.Text = '') or (dPorcentaje > 0)), edPorcentaje,
              'El porcentaje de incapacidad, para este código de evento, debe ser 0.');
      Verificar((dPorcentaje < 0), edPorcentaje,
                'El porcentaje de incapacidad, para este código de evento, no debe ser nulo.');
      Verificar((dPorcentaje < vPorMin) or (dPorcentaje > vPorMax),
                 edPorcentaje, 'El porcentaje de incapacidad, para este código de evento, debe ser ' +
                 'mayor que ' + CurrToStr(vPorMin) + ' y menor que ' + CurrToStr(vPorMax));
    end;
  end;
  Result := True;
end;

{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarChecks :Boolean;
begin
  Verificar(chkGranInvalidez.Checked and (fraEvento.sdqDatos.FieldByName('EI_GRANINVALIDEZ').AsString <> 'S'),
            chkGranInvalidez, 'Para este código de evento no puede haber Gran Invalidez.');

  Verificar(chkTratamiento.Checked and (fraEvento.sdqDatos.FieldByName('EI_TRATAMIENTO').AsString <> 'S')
                                   and (fraEvento.sdqDatos.FieldByName('EI_TRATAM_OY_RECALIF').AsString <> 'S'),   // TK 65976
            chkTratamiento, 'Para este código de evento no puede marcarse Tratamiento.');

  Verificar((fraEvento.sdqDatos.FieldByName('EI_TRATAM_OY_RECALIF').AsString = 'S') and (not chkTratamiento.Checked) and (not chkRecalificacion.Checked),
             chkTratamiento, 'Para este código de evento debe chequearse: Tratamiento y/o Recalificación.');   // TK 65976

  Verificar(  (GetChar(fraEvento.sdqDatos.FieldByName('TI_CODIGO').AsString) = 'T') and
                    (fraEvento.sdqDatos.FieldByName('ei_excepciontratamiento').AsString = 'N')  and     // por TK 54297
            not(chkTratamiento.Checked), chkTratamiento, 'Para este código de evento debe marcarse Tratamiento.');

  Verificar(chkRetroactivo.Checked and (fraEvento.sdqDatos.FieldByName('EI_RETROACTIVO').AsString <> 'S'),
            chkRetroactivo, 'Para este código de evento no puede haber Retroactividad.');
  Verificar(chkRetroactivo.Checked and dcFechaRetro.IsEmpty,
            dcFechaRetro, 'Debe ingresar la fecha de inicio de la Retroactividad.');

  Verificar(chkRecalificacion.Checked and (fraEvento.sdqDatos.FieldByName('EI_RECALIFICACION').AsString <> 'S')
                                      and (fraEvento.sdqDatos.FieldByName('EI_TRATAM_OY_RECALIF').AsString <> 'S'),    // TK 65976
            chkRecalificacion, 'Para este código de evento no puede haber Recalificación.');

  Verificar(not(chkRecalificacion.Checked) and (fraEvento.sdqDatos.FieldByName('EI_REQUIERERECA').AsString = 'S'),
            chkRecalificacion, 'Para este código de evento debe marcar Recalificación.');
  Verificar(chkEstudios.Checked and (fraEvento.sdqDatos.FieldByName('EI_ESTUDIOS').AsString <> 'S'),
            chkEstudios, 'Para este código de evento no puede marcarse Estudios.');
  Verificar(chkReingreso.Checked and (fraEvento.sdqDatos.FieldByName('EI_REINGRESO').AsString <> 'S'),
            chkReingreso, 'Para este código de evento no puede marcarse Reingreso.');
  Verificar(chkEnfInculpable.Checked and (fraEvento.sdqDatos.FieldByName('EI_ENFINCULPABLE').AsString <> 'S'),
            chkEnfInculpable, 'Para este código de evento no puede marcarse Enfermedad Inculpable.');
  Verificar(chkAbandono.Checked and (fraEvento.sdqDatos.FieldByName('EI_ABANDONO').AsString <> 'S'),
            chkAbandono, 'Para este código de evento no puede marcarse Abandono de Tratamiento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarFechaIncaDef :Boolean;
begin
  Verificar(bEsDictamen and dcIncDef.IsEmpty and rbDefinitivo.Checked and
            ((dPorcentaje > 50) or ((dPorcentaje = 50) and
             (edSinFecha.Date > StrToDate(FECHA_LIQ)))),
            dcIncDef, 'La fecha de inicio de incapacidad definitiva es obligatoria ' +
                      'para una incapacidad definitiva mayor al 50%.');
  Verificar(not(dcIncDef.IsEmpty) and (dcIncDef.Date < edSinFecha.Date), dcIncDef,
            'La fecha de inicio de incapacidad definitiva debe ser mayor o igual a la fecha de accidente.');
  Verificar(not(dcIncDef.IsEmpty) and (dcIncDef.Date > DBDate), dcIncDef,
            'La fecha de inicio de incapacidad definitiva no puede ser mayor que la actual.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarUbicacion :Boolean;
begin
  Verificar((fraEvento.sdqDatos.FieldByName('EI_TELEFONOGRAMA').AsString = 'S') and
             fraUbicIncap.IsEmpty, fraUbicIncap, 'El código de ubicación es obligatorio para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbPropiedadesClick(Sender: TObject);
//datos del trabajador
begin
  if HaySiniestroActivo then
    with TfrmContratoTrabajador.Create(Self) do
    try
      if Self.fraTrabajadorSIN.IsSelected and Self.fraTrabajadorSIN.TieneSiniestro then
        CargarDatosTrabajador(Self.fraTrabajadorSIN.Value,
                              ValorSQLIntegerEx('SELECT rl_id ' +
                                                 ' FROM crl_relacionlaboral ' +
                                                ' WHERE rl_contrato = :CONTRATO ' +
                                                  ' AND rl_idtrabajador = :IDTRABAJADOR',
                              [Self.fraTrabajadorSIN.Contrato, Self.fraTrabajadorSIN.Value]))
      else if Self.fraTrabajadorSIN.IsSelected then
        BuscarTrabajadores(' TJ_CUIL = ' + SqlValue(Self.fraTrabajadorSIN.CUIL), ART_EMPTY_ID)
      else
        DoCargarDatos(fraEmpresa.Contrato);   

      ShowModal;
      fraTrabajadorSIN.Reload;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoBloquearControles;
var
  bBloquear :Boolean;
  iTipoEv   :Integer;
  sNotaRect :String;
  sModifFechaEv :String; // Lu 17/07
begin
  iTipoEv := 0;
  sModifFechaEv := '';
  if (Accion = Alta) or (Accion = Replica) then
    bBloquear := False
  else begin
    iTipoEv   := fraEvento.sdqDatos.FieldByName('EI_TIPOEVENTO').AsInteger;
    sNotaRect := fraEvento.sdqDatos.FieldByName('EI_NOTARECTIFICATORIA').AsString;
    bBloquear := ((dFechaAlta < (DBDate - 3)) OR ((iTipoEv in [1,5,6,7,16]) and not(fraEvento.sdqDatos.FieldByName('EI_CHKAFAVORART').AsString = 'S') ));  // TK 9043 excepcion de los tipo de evento, los 799, 800 y 808

    sModifFechaEv := fraEvento.sdqDatos.FieldByName('EI_MODIFICAFECHAEV').AsString;  // Lu 17/07
  end;
  LockControls([mskHora, dcFechaVencim, dcFechaRecep, fraMotivo, fraComMedica,
                fraMedico, fraFirmante.edCodigo, fraFirmante.cmbDescripcion, fraUbicIncap,
                edPorcentaje, rbParcial, rbTotal, rbProvisorio, rbDefinitivo, chkGranInvalidez,
                chkTratamiento, chkRecalificacion, chkEstudios, chkReingreso, chkPatCron, chkRetroactivo,
                chkEnfInculpable, chkAbandono, dcIncDef, dcIncProv, chkAccidNoLab, chkprescripto, fraArea], bBloquear);

  if EsEventoRetroacSiempre(fraEvento.edCodigo.Text) and (StrToFloat(edPorcentaje.Text) > PORC_RETROACMEDIO) then
    LockControl(chkRetroactivo, False);               // Lu wf 8009

  LockControl(dcFecha, bBloquear and (sNotaRect <> 'S') and (sModifFechaEv = 'N') );   // Lu 17/07    {ACA SE BLOQUEA EL DCFECHA !!!}
  btnGuardar.Enabled := Seguridad.Activar(btnGuardar) and not(iTipoEv = 16);    // Descomente el "btnGuardar.Enabled" por ticket 63862
  LockControl(edObservaciones, (iTipoEv = 16));
  LockControls([fraEvento, btnLimpiar, fraArea], not(Accion = Alta));
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.DoBorrarEvento(iIdEvento, iSiniestro, iOrden :Integer; bEnTransaccion :Boolean): integer;
var
  sSql :String;
  iEvBorrado :Integer;
begin
  sSql := 'SELECT min(ev_evento) ' +
           ' FROM sev_eventosdetramite ' +
          ' WHERE ev_siniestro = :iSini ' +
            ' AND ev_orden = :iOrden ' + 
            ' AND ev_recaida = 0';
  iEvBorrado := ValorSqlIntegerEx(sSql, [iSiniestro, iOrden]) - 1;
  if (iEvBorrado >= 0) then iEvBorrado := -1;

  {sSql := 'UPDATE sev_eventosdetramite ' +
            ' SET ev_evento = ' + SqlInt(iEvBorrado) + ',' +
                ' ev_fechamodif = Actualdate, ' +
                ' ev_usumodif = ' + SqlValue(Sesion.UserID) +
          ' WHERE ev_idevento = ' + SqlInt(iIdEvento);}

  ssql := ' art.inca.do_anularevento(:idevento, :usuario); ';

  if bEnTransaccion then
    EjecutarStoreSTEx(sSql, [sdqConsulta.FieldByName('ev_idevento').AsInteger, Sesion.UserID])
  else
    EjecutarStoreEx(sSql, [sdqConsulta.FieldByName('ev_idevento').AsInteger, Sesion.UserID]);

  Result := iEvBorrado;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnBajaExpClick(Sender: TObject);
var
  sSql :String;
  sExpedIncap : string;
begin
  sExpedIncap := sdqExpediente.FieldByName('IX_EXPEDINCAPACIDAD').AsString;
  Verificar(sdqExpediente.IsEmpty, dgExpediente, 'No hay ningún expediente seleccionado.');
  Verificar(dcBajaExped.IsEmpty and sdqExpediente.FieldByName('IX_FBAJA').IsNull,
            dcBajaExped, 'Debe ingresar la fecha de baja.');
  Verificar((Trim(edMotivoBaja.Text) = ''), edMotivoBaja, 'Debe ingresar el Motivo de Baja.');

  sSql := 'UPDATE six_expedientesincapacidad ' +
            ' SET ix_fbaja = ' + SqlDate(dcBajaExped.Date) + ', ' +
                ' ix_motivobaja = ' + SqlValue(edMotivoBaja.Text) +
          ' WHERE ix_idexpediente = ' + SqlInt(sdqExpediente.FieldByName('IX_IDEXPEDIENTE').AsInteger) +
            ' AND ix_contador = ' + SqlInt(sdqExpediente.FieldByName('IX_CONTADOR').AsInteger);
  EjecutarSql(sSql);
  DoCargarEstado;

    // Lu WF 7232
  if MsgAsk('¿Desea visualizar el reporte de la Baja?') then
  begin
    SetSqlFirmanteBaja(True);
    fraFirmanteBaja.Clear;

    if fpFirmanteBaja.ShowModal = mrOk then
    begin
       iIdExped := Get_IdExpediente(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
       DoGenerarReporteBaja(sExpedIncap, edSiniestro.Siniestro, iIdExped);
    end;
  end;

  DoRefrescarExpediente(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoRefrescarExpediente(bCargaDictamen :Boolean);
begin
  sdqExpediente.Close;
  sdqExpediente.ParamByName('PIDEXPEDIENTE').AsInteger := IdExpediente;
  sdqExpediente.Open;
  edExpedIncapABM.Clear;
  dcBajaExped.Clear;
  edMotivoBaja.Clear;                               // Lu WF 7232
  dcBajaExped.Visible       := not bCargaDictamen;
  btnBajaExp.Visible        := not bCargaDictamen;
  edMotivoBaja.Visible      := not bCargaDictamen; // Lu WF 7232
  gbBaja.Visible            := not bCargaDictamen; // Lu WF 7232
  btnCerrarExped.Visible    := not bCargaDictamen;
  btnGuardarExped.Visible   := not bCargaDictamen;
  btnAceptarExped.Visible   := bCargaDictamen;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnGuardarExpedClick(Sender: TObject);
var
  sSql, sExped :String;
  iCont :Integer;
begin
  sExped := Trim(edExpedIncapABM.Text);
  Verificar((sExped = ''), edExpedIncapABM, 'Debe ingresar el Expediente de Incapacidad.');

  sSql := 'SELECT 1 FROM six_expedientesincapacidad ' +
          ' WHERE ix_expedincapacidad = :Exped ' +
            ' AND ix_fbaja IS NULL ' +
            ' AND ix_idexpediente <> :IdExped ' +
            ' AND ix_idexpediente NOT IN(SELECT ex_id ' +
                                         ' FROM art.sex_expedientes ' +
                                        ' WHERE ex_cuil = :Cuil) ';
  Verificar(ExisteSqlEx(sSql, [sExped, IdExpediente, fraTrabajadorSIN.CUIL]), edExpedIncapABM,
            'El Expediente de Incapacidad ya existe para otro siniestro.');

  sSql := 'SELECT 1 FROM six_expedientesincapacidad ' +
          ' WHERE ix_expedincapacidad = ' + SqlValue(sExped) +
            ' AND ix_idexpediente = ' + SqlInt(IdExpediente);
  Verificar(ExisteSql(sSql), edExpedIncapABM, 'El Expediente de Incapacidad ya existe para el siniestro.');

  sSql    := 'SELECT NVL(MAX(ix_contador),0) + 1 ' +
              ' FROM six_expedientesincapacidad ' +
              ' WHERE ix_idexpediente = :IdExped ';
  iCont   := ValorSqlIntegerEx(sSql, [IdExpediente]);

  try
    BeginTrans(True);
    sSql := 'INSERT INTO six_expedientesincapacidad ' +
            '(ix_siniestro, ix_orden, ix_recaida, ix_contador, ' +
            ' ix_expedincapacidad, ix_idexpediente) VALUES ( ' +
            SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' +
            SqlInt(Recaida) + ',' + SqlInt(iCont) + ',' +
            SqlValue(sExped) + ',' + SqlInt(IdExpediente) + ')';
    EjecutarSqlST(sSql);

    sSql := 'SELECT et_expedincapacidad ' +
             ' FROM set_evemedtrata ' +
            ' WHERE et_siniestro = :Sini ' +
              ' AND et_orden = :Orden ' +
              ' AND et_evento = 0 ';
    if (ValorSqlEx(sSql, [Siniestro, Orden]) = '') then
    begin
      sSql := 'UPDATE set_evemedtrata ' +
                ' SET et_expedincapacidad = ' + SqlValue(sExped) +
              ' WHERE et_siniestro = ' + SqlInt(Siniestro) +
                ' AND et_orden = ' + SqlInt(Orden) +
                ' AND et_evento = 0 ';
      EjecutarSqlST(sSql);
    end;
    CommitTrans(True);
    DoRefrescarExpediente(False);
    DoCargarEstado;
    MsgBox('El Expediente de Incapacidad se grabó con éxito', MB_ICONINFORMATION);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edPorcentajeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ','
  else if not(Key in [#8, #9, '1', '2', '3','4', '5', '6', '7', '8', '9', '0', ',']) then
    Key := #0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edPorcIntegralChange(Sender: TObject);
begin
  //

end;
{-------------------------------------------------------------------------------}

procedure TfrmSegIncapacidades.edPorcIntegralKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ','
  else if not(Key in [#8, #9, '1', '2', '3','4', '5', '6', '7', '8', '9', '0', ',']) then
    Key := #0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbCancelarAutorClick(Sender: TObject);
begin
  if HayRegistroActivo and GetPermiteEventos and GetEsCancelable and
     MsgAsk('¿Confirma cancelar la autorización del evento seleccionado?') then
  begin
    if (sdqConsulta.FieldByName('EI_AUTORIZAEXTENSIONILT').AsString = 'S') then
      DoEventoAutorizacion('958', True, False)
    else
      DoEventoAutorizacion('951', True, False);
      
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetEsAutorizable :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT inca.get_esautorizable(:IdEvento, :ExtensionILT ) FROM dual';    // el EI_AUTORIZAEXTENSIONILT por Plan Extensión de ILT

  if (ValorSqlEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger, sdqConsulta.FieldByName('EI_AUTORIZAEXTENSIONILT').AsString]) = 'S') then
    Result := True
  else begin
    InfoHint(Nil, 'El evento no es autorizable ó ya se encuentra autorizado.');
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetNoImpideAutorizar: Boolean;       // Lu TK 5661
var sSql :String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM art.sev_eventosdetramite, sin.sei_eventoincapacidad ' +
          ' WHERE EV_CODIGO = EI_CODIGO ' +
            ' AND EV_SINIESTRO = ' + SqlInt(edSiniestro.Siniestro) +
            ' AND EV_ORDEN = ' + SqlInt(edSiniestro.Orden) +
        //    ' AND EV_RECAIDA = ' + SqlInt(edSiniestro.Recaida) +
            ' AND EV_EVENTO > 0 ' +
            ' AND EI_IMPIDEAUTORIZAR = ''S'' ';
  if not ExisteSql(sSql) then
    Result := True
  else begin
    InfoHint(Nil, 'No es posible cargar autorizaciones, ya que se ha cargado un evento que lo impide.');
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbAutorizacionClick(Sender: TObject);
//var sCodEvento: string;
begin
  if HayRegistroActivo and GetPermiteEventos and GetEsAutorizable and GetNoImpideAutorizar and
     PermiteAutorizarEmpresa and      // TK 26620
     MsgAsk('¿Confirma la autorización del evento seleccionado?') then
  begin
    DoEventoAutorizacion(GetEventoAutoriza, True, False);
    tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEventoAutorizacion(sEvento :String; bShowMsg, bEnTransaccion :Boolean;
                                                    iIdEventoRela :Integer = 0);
var
  sSql :String;
begin
  try
    sSql := 'art.inca.do_insertarevento(' + SqlInt(Siniestro) + ',' + SqlInt(Orden) + ', Actualdate, ' +
                                            SqlValue(sEvento) + ',' +
                                            SqlNumber(sdqConsulta.FieldByName('PORCINCA').AsCurrency, True) + ',' +
                                            SqlValue(Sesion.UserId) + ', Null, ' +
                                            SqlValue(sdqConsulta.FieldByName('EV_COMISION').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('OBSERVA').AsString) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('FVENCI').AsDateTime) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_MOTIVO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('HORA').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_MEDICO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_GRADO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_CARACTER').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('GRAINC').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('TRATAM').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_CODUBIC').AsString) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('EV_FECHACITACION').AsDateTime) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('RETRO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_RECALIFICACION').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_ESTUDIOS').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_REINGRESO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_ENFINCULPABLE').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_FIRMA').AsString) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('EV_FECHARECEPCION').AsDateTime) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('FINICIODEF').AsDateTime) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('ABANDONO').AsString) + ',' +
                                            IIF((iIdEventoRela > 0),
                                                 SqlInt(iIdEventoRela),
                                                 SqlInt(sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger, True)) + ', Null, ' +
                                            SqlValue(sdqConsulta.FieldByName('EV_MORTAL').AsString) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('EV_FECHADEFUNCION').AsDateTime) + ',' +
                                            SqlInt(sdqConsulta.FieldByName('EV_IDACCIDENTEDICTAMEN').AsInteger, True) + ',' +
                                            SqlInt(sdqConsulta.FieldByName('EV_IDCIE101').AsInteger, True) + ',' +
                                            SqlInt(sdqConsulta.FieldByName('EV_IDCIE102').AsInteger, True) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_RECUPERO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_COMPLEMENTARIO').AsString) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_EXPEDINCAPACIDAD').AsString) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('EV_FECHARETROACTIVO').AsDateTime) + ',' +
                                            SqlInt(sdqConsulta.FieldByName('EV_IDSEG_DICTAMEN').AsInteger, True) + ',' +
                                            SqlInt(sdqConsulta.FieldByName('EV_IDDICTAMEN').AsInteger, True) + ',' +
                                            SqlValue(sdqConsulta.FieldByName('EV_MOTIVOAPELACION').AsString) + ',' +
                                            SqlDate(sdqConsulta.FieldByName('EV_INICIO_PROV').AsDateTime) + ',Null, ' +
                                            SqlValue(sdqConsulta.FieldByName('EV_ACCIDNOLABORAL').AsString) + ', Null, Null, ' +
                                            SqlValue(sdqConsulta.FieldByName('EV_PRESCRIPTO').AsString) + ', Null, Null, ' +
                                            'Null, Null , Null, Null, Null, Null, Null, Null, ''N'', Null, Null, Null, Null, ' +
                                            SqlValue(sdqConsulta.FieldByName('EV_INTEGRAL').AsString) + ', ' +
                                            ' Null, ' +
                                            SqlInt(sdqConsulta.FieldByName('EV_RECAIDA').AsString) + ');';

    if bEnTransaccion then
      EjecutarStoreST(sSql)
    else
      EjecutarStore(sSql);

    if bShowMsg then MsgBox('Los datos del evento se guardaron correctamente.', MB_ICONINFORMATION);
  except
    on E:Exception do ErrorMsg(E);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetEsCancelable :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT inca.get_escancelable(:IdEvento, :ExtensionILT) FROM dual';

  if (ValorSqlEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger, sdqConsulta.FieldByName('EI_AUTORIZAEXTENSIONILT').AsString]) = 'S') then
    Result := True
  else begin
    InfoHint(Nil, 'El evento no es cancelable ó ya se encuentra cancelado.');
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarDatosTrab :Boolean;
var
  sExigeFecha :String;
begin
  sExigeFecha := fraEvento.sdqDatos.FieldByName('EI_RECEPCION').AsString;
  if (sExigeFecha = 'S') and sdqBusquedaTJ_SEXO.IsNull then
  begin
    InfoHint(fraEvento, 'Debe cargar el sexo del trabajador para este código de evento.');
    Result := False;
  end
  else if (sExigeFecha = 'S') and sdqBusquedaTJ_FNACIMIENTO.IsNull then
  begin
    InfoHint(fraEvento, 'Se requiere la fecha de nacimiento del trabajador para este código de evento.');
    Result := False;
  end
  else  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarFirmante :Boolean;
var
  bExigeCarta, bExigeFirmante, bAfiNoFirmIncap, bCartaINC_C_MotDist1 :boolean;
begin
  bExigeCarta := (bEsDictamen and chkEnfInculpable.Checked and
                 ((fraEvento.sdqDatos.FieldByName('EI_CARTADOC').AsString = 'S') or
                  (fraEvento.sdqDatos.FieldByName('EI_CARTACOM').AsString = 'S'))
                 ) or
                 (not(bEsDictamen) and
                 ((fraEvento.sdqDatos.FieldByName('EI_CARTADOC').AsString = 'S') or
                  (fraEvento.sdqDatos.FieldByName('EI_CARTACOM').AsString = 'S'))
                 );
  bExigeFirmante := (fraEvento.sdqDatos.FieldByName('EI_EXIGEFIRMANTE').AsString = 'S');  // Lu TK 166

  bAfiNoFirmIncap := (fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString = CODCARTADOC_PORCINCAP)
                     and not chkNiegaFirmarIncap.Checked;

  bCartaINC_C_MotDist1 := (fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString = CODCARTADOC_INC_C)
                          and (fraMotivo.Codigo <> MOTIVO_HOMOLOGACION);

  Verificar((bExigeCarta or bExigeFirmante)
            and (not bAfiNoFirmIncap)
            and fraFirmante.IsEmpty
            and (not bCartaINC_C_MotDist1), fraFirmante,         // TK 16166
            'El firmante es obligatorio para este código de evento.');

  Verificar( (not(bExigeCarta) and not(bExigeFirmante)) and not(fraFirmante.IsEmpty), fraFirmante,
            'No debe ingresar firmante para este código de evento.');
  Result := not(bExigeCarta) or
           (bExigeCarta and HasValidAddress(Siniestro, Orden, Recaida));
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoInsertarCartaDoc;
var
  sSql: String;
  iIdFormato, iEvento, iReca, TipoCarta, iDestinatario :Integer;
  dAltaMedica :TDate;
  vDestinatario :TTipoDestinatario;
begin
  // WF 6501: Ya no es necesario el análisis pués lo realiza la
  // función TipoCartaAGenerar
(*
  if (bEsDictamen and chkEnfInculpable.Checked and
     (fraEvento.sdqDatos.FieldByName('EI_CARTADOC').AsString = 'S')) or
     (not(bEsDictamen) and
     (fraEvento.sdqDatos.FieldByName('EI_CARTADOC').AsString = 'S'))
  then begin
*)
  TipoCarta     := TipoCartaAGenerar;
  vDestinatario := tdEmpresa;

  if TipoCarta > 0 then
  begin
    sSql := 'SELECT tc_id, tc_destinatario ' +
             ' FROM ctc_textocarta ' +
            ' WHERE tc_codigo = ' + IIF(TipoCarta = 1, SqlValue(fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC').AsString),
                                                       SqlValue(fraEvento.sdqDatos.FieldByName('EI_CODCARTACOM').AsString));

    with GetQuery(sSql) do
    try
      if not eof then
      begin
        iIdFormato    := Fields[0].AsInteger;
        iDestinatario := Fields[1].AsInteger;
      end
      else begin                // Lu 13/11 puse este else porque daba error si el query no devolvia nada.
        iIdFormato    := 0;
        iDestinatario := 0;
      end;
    finally
      Free;
    end;

    sSql := 'SELECT ex_altamedica ' +
             ' FROM sex_expedientes ' +
            ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
              ' AND ex_orden = ' + SqlInt(Orden);
    if (GetCantRecaidas > 1) and (fpSeleccionRecaida.ShowModal = mrOk) then
      iReca := sdqRecaidasEX_RECAIDA.AsInteger
    else
      iReca := Recaida;
    sSql        := sSql + ' AND ex_recaida = ' + SqlInt(iReca);
    dAltaMedica := ValorSqlDateTime(sSql);

    sSql := 'SELECT MAX(ev_evento) ' +
             ' FROM sev_eventosdetramite ' +
            ' WHERE ev_siniestro = :Sini ' +
              ' AND ev_orden = :Orden ' +
              ' AND ev_recaida = 0 ' +
              ' AND ev_evento >= 0' +
              ' AND ev_codigo = :codev ';
    iEvento := ValorSqlIntegerEx(sSql, [Siniestro, Orden, fraEvento.Codigo]);

    case iDestinatario of      // Lu 02/07
      1: vDestinatario := tdEmpresa;
      2: vDestinatario := tdTrabajador;
      3: vDestinatario := tdAmbos;
      4: vDestinatario := tdArt;
      5: vDestinatario := tdOtros;
      6: vDestinatario := tdComisionMedica;
    end;

    DoInsertarCarta(iIdFormato, Siniestro, Orden, iReca, fraFirmante.Codigo,
                    AREA_INC, False, IIF(vDestinatario = tdComisionMedica,  fraComMedica.ID, ART_EMPTY_ID),
                    vDestinatario, '', iEvento, dAltaMedica, 840);
  end;

end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpSeleccionRecaidaBeforeShow(Sender: TObject);
begin
  with sdqRecaidas do
  begin
    Close;
    ParamByName('SINIESTRO').AsInteger  := Siniestro;
    ParamByName('ORDEN').AsInteger      := Orden;
    Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarRecaidaClick(Sender: TObject);
begin
  if cmbRecaida.Value <> '' then fpSeleccionRecaida.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.chkMortalClick(Sender: TObject);
begin
  LockControl(dcFechaDefuncion, not chkMortal.Checked);
  if chkMortal.Checked then
    if dcFechaDefuncion.CanFocus then dcFechaDefuncion.SetFocus
  else
    dcFechaDefuncion.Clear;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetExpedienteAsociado :String;
var
  sSql, sExped :String;
  sdqAux :TSDQuery;
begin
  sSql := 'SELECT ix_expedincapacidad ' +
           ' FROM six_expedientesincapacidad ' +
          ' WHERE ix_idexpediente = ' + SqlInt(IdExpediente) +
            ' AND ix_fbaja IS NULL';
  sdqAux := GetQuery(sSql);
  try
    if (sdqAux.RecordCount = 1) then
      sExped := sdqAux.FieldByName('IX_EXPEDINCAPACIDAD').AsString
    else begin
      DoRefrescarExpediente(True);
      if (fpExpediente.ShowModal = mrOk) then
        sExped := sdqExpediente.FieldByName('IX_EXPEDINCAPACIDAD').AsString
      else
        sExped := '';
    end;
  finally
    sdqAux.Free;
  end;

  Result := sExped;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpExpedienteBeforeShow(Sender: TObject);
begin
  inherited;
  edSiniestroExp.SetValues(Siniestro, Orden, Recaida);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.sdqExpedienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edExpedIncapABM.Text := DataSet.FieldByName('IX_EXPEDINCAPACIDAD').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarExpedClick(Sender: TObject);
begin
  Verificar(not(sdqExpediente.FieldByName('IX_FBAJA').IsNull), dgExpediente,
            'El expediente seleccionado se encuentra dado de baja.');
  fpExpediente.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.chkRetroactivoClick(Sender: TObject);
begin
  LockControl(dcFechaRetro, not chkRetroactivo.Checked);
  if chkRetroactivo.Checked and dcFechaRetro.CanFocus then
    dcFechaRetro.SetFocus
  else if not(chkRetroactivo.Checked) then
    dcFechaRetro.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoCierreAutomatico;
var
  sSql :String;
begin
  if chkEnfInculpable.Checked and
    (GetChar(fraEvento.sdqDatos.FieldByName('TI_CODIGO').AsString) in ['D','H']) and
    ( (sdqBusquedaEX_ESTADO.AsString <> '03') or ((sdqBusquedaEX_ESTADO.AsString='03') and
      (sdqBusquedaEX_CAUSAFIN.AsString ='02')) ) and      // Lu WF 7947
    MsgAsk('¿Desea realizar el cierre automático del siniestro?') then
  begin
    sSql := 'SELECT ex_id ' +
             ' FROM art.sex_expedientes ' +
            ' WHERE ex_siniestro = :Sin ' +
              ' AND ex_orden = :Ord ' +
              ' AND ((NVL(ex_estado, '' '') <> ''03'') ' +
               ' OR ((NVL(ex_estado, '' '') = ''03'') AND (NVL(ex_causafin, '' '') = ''02'')) )';
    with GetQueryEx(sSql, [Siniestro, Orden]) do
    try
      while not Eof do
      begin
        sSql := 'UPDATE sex_expedientes ' +
                  ' SET ex_estado = ''03'', ' +
                      ' ex_causafin = ''07'', ' +
                      ' ex_fechafin = actualdate ' +
                ' WHERE ex_id = ' + SqlInt(FieldByName('ex_id').AsInteger);
        EjecutarSqlST(sSql);

        sSql := 'siniestro.do_actu_estado_siniestro( ' +
                    SqlInt(FieldByName('ex_id').AsInteger) + ', ''03'', ''Recepción de Dictamen por Enfermedad Inculpable'', ' +
                    ' ''07'', actualdate, ' + SqlValue(Sesion.UserID) + ', Null);';
        EjecutarStoreST(sSql);
        Next;
      end;
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
//anula la autorizacion 950 asociada con un 951
{procedure TfrmSegIncapacidades.DoAnularAutAsociada(iIdEvento :Integer);
var
  sSql :String;
  iIdAutRela :Integer;
begin
  sSql := 'SELECT NVL(ev_idevento, 0) ' +
           ' FROM sev_eventosdetramite, sin.sei_eventoincapacidad ' +
          ' WHERE ev_codigo = ei_codigo ' +
            ' AND ev_idevento_rela = :IdEvento ' +
            ' AND ei_autoriza = ''S'' ';
  iIdAutRela := ValorSqlIntegerEx(sSql, [iIdEvento]);
  if (iIdAutRela > 0) then
    DoEventoAutorizacion('951', False, True, iIdAutRela);
end; }
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpEventosBeforeShow(Sender: TObject);
begin
  inherited;
  edSiniestroABM.SetValues(Siniestro, Orden, sdqConsulta.FieldByName('ev_recaida').AsInteger);
  DoBloquearControles;
  DoBloquearDictamen;
  DoBloquearPapeleria;
  DoCaracterClick;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpDictamenesBeforeShow(Sender: TObject);
begin
  inherited;
  edMotivoApelacion.Clear;
  sdqDictamenes.Close;
  sdqDictamenes.ParamByName('PIDEXPEDIENTE').AsInteger := IdExpediente;
  sdqDictamenes.Open;
end;

{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetDictamenApelacion(var sDictamen :String):Boolean;
begin
  if (fraEvento.sdqDatos.FieldByName('TI_CODIGO').AsString <> 'A') then
    Result := True
  else if (fraEvento.sdqDatos.FieldByName('TI_CODIGO').AsString = 'A') and
          (fpDictamenes.ShowModal = mrOk) then
  begin
    sDictamen := sdqDictamenes.FieldByName('EV_IDEVENTO').AsString + ',' +
                 SqlValue(Trim(edMotivoApelacion.Text));
    Result := True;
  end
  else Result := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarDictamenesClick(Sender: TObject);
begin
  Verificar(sdqDictamenes.IsEmpty, dgDictamenes, 'Debe seleccionar un dictamen.');
  Verificar((Trim(edMotivoApelacion.Text) = ''), edMotivoApelacion,
            'Debe ingresar el motivo de apelación.');
  fpDictamenes.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.DoValidacion(iIdEvento :Integer):string;
var
  sSql, sMens :String;
begin
  if not fraEvento.sdqDatos.FieldByName('EI_GRUPOVALIDACION').IsNull then
  begin
    sSql  := 'SELECT art.inca.get_validacion(' +
                     SqlInt(IdExpediente) + ',' +
                     SqlInt(iIdEvento) + ',' +
                     SqlValue(fraEvento.sdqDatos.FieldByName('EI_GRUPOVALIDACION').AsString) + ')' +
              ' FROM dual';
    sMens := ValorSql(sSql);

    if (sMens <> '') and
       (fraEvento.sdqDatos.FieldByName('EI_GRUPOVALIDACION').AsString <> '4') and
       (fraEvento.sdqDatos.FieldByName('EI_GRUPOVALIDACION').AsString <> '5') then
        MsgBox(sMens, MB_ICONWARNING);

    Result := sMens;    // TK 8772
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarFechaIncaProv :Boolean;
var
  bExigeFecha :Boolean;
begin
  bExigeFecha := (GetChar(fraEvento.sdqDatos.FieldByName('TI_CODIGO').AsString) in ['D','H']) and
                 (dPorcentaje > 50) and rbDefinitivo.Checked;
  Verificar(bExigeFecha and dcIncProv.IsEmpty, dcIncProv,
            'La fecha de inicio de incapacidad provisoria es obligatoria ' +
            'para una incapacidad mayor al 50%.');
  Verificar(not(dcIncProv.IsEmpty) and (dcIncProv.Date > DBDate), dcIncProv,
            'La fecha de inicio de incapacidad provisoria no puede ser mayor que la actual.');
  Verificar(not(bExigeFecha) and not(dcIncProv.IsEmpty), dcIncProv,
            'No debe cargarse fecha de inicio de incapacidad provisoria para este evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetCantRecaidas :Integer;
var
  sSql :String;
begin
  sSql := 'SELECT count(*) ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = :Sini ' +
            ' AND ex_orden = :Orden ' +
            ' AND NVL(ex_causafin, '' '') NOT IN(''02'', ''99'', ''95'') ';
  Result := ValorSqlIntegerEx(sSql, [Siniestro, Orden]);
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetHoraCorrecta(sHora:string) :String;
var
  sSql, sAux :String;
begin
  if (Trim(sHora) <> ':') then
  begin
    sAux := '01/01/01 ' + sHora;
    sSql := 'SELECT to_char(to_date(:Hora, ''dd/mm/yyyy hh24:mi''), ''hh24:mi'') ' +
             ' FROM dual ';
    Result := ValorSqlEx(sSql, [sAux]);
  end
  else Result := '';
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarMotivo :Boolean;
begin
  Verificar((fraEvento.sdqDatos.FieldByName('EI_EXIGEMOTIVO').AsString = 'S') and
             fraMotivo.IsEmpty, fraMotivo, 'El motivo es obligatorio para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarComision :Boolean;
begin
  Verificar((fraEvento.sdqDatos.FieldByName('EI_EXIGECOMISION').AsString = 'S') and
             fraComMedica.IsEmpty, fraComMedica, 'La comisión médica es obligatoria para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}  // Lu 10/07 WF 7745
function TfrmSegIncapacidades.ValidarObservaciones: Boolean;
begin
  Verificar((fraEvento.sdqDatos.FieldByName('EI_EXIGEOBSERV').AsString = 'S') and
             (Trim(edObservaciones.Text) = ''), edObservaciones,
             'El campo Observaciones es obligatorio para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoBloquearDictamen;
var
  bBloquear, bBloquearCIE10, bHabilitarRecupero, bHabilitarExclDictAnt, bHabilitarApelacion, bHabilitarRectif :Boolean;
  sCIE: String;
  iTipoEv: Integer;
begin
  bHabilitarRecupero := False;

  iTipoEv     := fraEvento.sdqDatos.FieldByName('ei_tipoevento').AsInteger;
  bEsDictamen := fraEvento.IsSelected and (iTipoEv in [1,6,7]);

  bBloquear   := not(bEsDictamen) or (Accion <> Alta);
  LockControls([chkMortal, chkComplemento, dcFechaDefuncion, fraContingenciaDic, chkPatCron], bBloquear);

  bBloquearCIE10 := not(bEsDictamen);
  LockControls([fraCIE101.edCodigo, fraCIE101.cmbDescripcion,                             // TK 19343
                fraCIE102.edCodigo, fraCIE102.cmbDescripcion], bBloquearCIE10);

  // habilitar Recupero TK 20709  Atencion: "Recupero" es independiente de dictamen...
  if (Accion = Edicion) then
    bHabilitarRecupero := (dFechaAlta >= (DBDate - 5)) and fraEvento.IsSelected
                          and (fraEvento.sdqDatos.FieldByName('ei_checkrecupero').AsString = 'S')
  else if (Accion = Alta) then
    bHabilitarRecupero := fraEvento.IsSelected and (fraEvento.sdqDatos.FieldByName('ei_checkrecupero').AsString = 'S');

  bHabilitarExclDictAnt     := bEsDictamen and ( (Accion = Alta) or ((Accion = Edicion) and (dFechaAlta >= (DBDate - 10))) );

  LockControl(chkRecupero, not bHabilitarRecupero);

  LockControls([chkExcluirDictAnt, chkIntegral, chkPrevencion], not bHabilitarExclDictAnt);

  VCLExtra.LockControls([edPorcIntegral], not (chkIntegral.Checked and ((sdqBusquedaEX_FECHAACCIDENTE.AsDateTime) >= StrToDate(FECHA_LEY26773))));

  if seguridad.Claves.IsActive('ModifContingencia') then
    LockControl(fraContingenciaDic, not bHabilitarExclDictAnt);


  bHabilitarApelacion :=( (bEsDictamen and (Accion = Alta)) or ((Accion = Edicion) and (dFechaAlta >= (DBDate - 20))) ) AND Seguridad.Activar(chkApelacion);       // TK 28017 (20 dias de habilitacion)
  bHabilitarRectif    :=( (bEsDictamen and (Accion = Alta)) or ((Accion = Edicion) and (dFechaAlta >= (DBDate - 20))) ) AND Seguridad.Activar(chkRectificatoria);  // TK 28017 (20 dias de habilitacion)
  LockControls([chkApelacion],      not bHabilitarApelacion);      // TK 28017
  LockControls([chkRectificatoria], not bHabilitarRectif);

  if not bBloquear then
  begin
    sCIE := ValorSqlEx('SELECT dg_codigo ' +
                        ' FROM sin.spe_partedeegreso, cdg_diagnostico ' +
                       ' WHERE pe_iddiagnostico = dg_id ' +
                         ' AND pe_idexpediente = :IdExped ', [IdExpediente]);
    fraCIE101.Codigo          := sCIE;
    fraContingenciaDic.Codigo := sdqBusquedaEX_TIPO.AsString;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarDictamen :Boolean;
begin
  if bEsDictamen and (Accion = Alta) then
  begin
    Verificar(chkMortal.Checked and dcFechaDefuncion.IsEmpty, dcFechaDefuncion,
              'Debe ingresar la fecha de defunción.');
    Verificar(not(dcFechaDefuncion.IsEmpty) and
              (dcFechaDefuncion.Date < sdqBusquedaEX_FECHAACCIDENTE.AsDateTime),
               dcFechaDefuncion, 'La fecha de defunción no puede ser menor que la del accidente.');
    Verificar(fraContingenciaDic.IsEmpty, fraContingenciaDic, 'Debe seleccionar la contingencia del dictamen.');
    Verificar(fraCIE101.IsEmpty, fraCIE101, 'Debe seleccionar el CIE10 del dictamen.');
    sqlDictamen := IIF(chkMortal.Checked, '''S''', '''N''') + ',' +
                   SqlDate(dcFechaDefuncion.Date) + ',' +
                   SqlInt(fraContingenciaDic.Value, True) + ',' +
                   SqlInt(fraCIE101.Value, True) + ',' +
                   SqlInt(fraCIE102.Value, True) + ',' +
                   IIF(chkRecupero.Checked, '''S''', '''N''') + ',' +
                   IIF(chkComplemento.Checked, '''S''', '''N''');
  end
  else sqlDictamen := '';
  Result := True;
end;
{-------------------------------------------------------------------------------}  // Lu TK 2560
function TfrmSegIncapacidades.ValidarArea: Boolean;
var sSql: string;
    sMailArea: string;
begin
  Verificar((fraEvento.sdqDatos.FieldByName('EI_ENVMAILAREA').AsString = 'S') and
             fraArea.IsEmpty, fraArea, 'El Área de envío de mail es obligatorio para este código de evento.');
  Verificar((fraEvento.sdqDatos.FieldByName('EI_ENVMAILAREA').AsString = 'N') and
             (not fraArea.IsEmpty), fraArea, 'Este código de evento debe cargarse sin Área de envío de mail');
  sSql := ' SELECT EI_AREAMAIL_MEDICA, TB_DESCRIPCION ' +              // por TK 30001
            ' FROM SIN.SEI_EVENTOINCAPACIDAD, ART.CTB_TABLAS ' +
           ' WHERE EI_CODIGO = ' + SqlValue(fraEvento.Codigo) +
             ' AND TB_CLAVE = ''AREAM'' ' +
             ' AND TB_CODIGO <> ''0'' ' +
             ' AND TB_CODIGO(+) = EI_AREAMAIL_MEDICA ';

  with GetQuery(sSql) do
  try
    if not Eof then
    begin
      sMailArea := FieldByName('EI_AREAMAIL_MEDICA').AsString;
      Verificar((fraArea.edCodigo.Text <> sMailArea), fraArea,
                'El Area Mail para este código de evento debe ser ' + sMailArea + ' - ' + FieldByName('TB_DESCRIPCION').AsString);
    end;
  finally
    Free;
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.SetSqlEvento(bRestringir :Boolean);
begin
  fraEvento.sdqDatos.Close;
  fraEvento.sdqDatos.SQL.Text := sqlEvento + IIF(bRestringir, ' AND EI_AUTOMATICO = ''N''', '');
  fraEvento.Propiedades.Sql   := sqlEvento + IIF(bRestringir, ' AND EI_AUTOMATICO = ''N''', '');
  fraEvento.sdqDatos.Open;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarEdPorcentaje :Boolean;
begin
  if (Trim(edPorcentaje.Text) = '') then
    dPorcentaje := -1
  else
    try
      dPorcentaje := StrToFloat(edPorcentaje.Text);
    except
      InfoHint(edPorcentaje, 'El porcentaje de incapacidad es inválido.', True);
    end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edPorcentajeChange(Sender: TObject);
begin
  if ValidarEdPorcentaje then
    if (dPorcentaje >= 66) then
      rbTotal.Checked := True
    else
      rbParcial.Checked := True;

    DoCaracterClick;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.SetSqlFirmante(bRestringir :Boolean);
var
  sSql :String;
begin
  sSql := ' SELECT fi_id as id, fi_id as codigo, fi_firmante as descripcion, ' +
                 ' fa_fechabaja as baja ' +
            ' FROM cfa_firmantearea, cat_areatexto, cfi_firma ' +
           ' WHERE fa_idareatexto = at_id ' +
             ' AND fa_idfirmante = fi_id ';
  if bRestringir then
    sSql := sSql + ' AND at_modulo = ''07'' ' +
                   ' AND at_area = ''35'' '   +
                   ' AND fa_fechabaja IS NULL ' +
                   ' AND fi_fechabaja IS NULL ' +
                   ' AND at_fechabaja IS NULL';
  fraFirmante.Sql := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.SetSqlFrames(bRestringir :Boolean; bEvento :Boolean = True);
begin
  if bEvento then SetSqlEvento(bRestringir);
  SetSqlFirmante(bRestringir);
  SetSqlMedico(bRestringir);
  SetSqlPapeleria(bRestringir);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.SetSqlMedico(bRestringir :Boolean);
begin
  fraMedico.ExtraCondition  := IIF(bRestringir, ' AND au_incapacidades = ''S'' ', '');
  fraMedico.ShowBajas       := not bRestringir;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarMedico :Boolean;
var
  sExigeMedico :String;
begin
  sExigeMedico := fraEvento.sdqDatos.FieldByName('EI_EXIGEMEDICO').AsString;
  Verificar((sExigeMedico = 'S') and fraMedico.IsEmpty, fraMedico,
            'El médico es obligatorio para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoCargarDocumentacion(iID :Integer = 0; sCUIL :String = '');
var
  sSql: String;
begin
  sSql := 'SELECT id_id, id_cuil, id_nombre ' +
           ' FROM SIN.sid_informacion_dictamen ' +
          ' WHERE id_fechabaja IS NULL ';

  if (Accion = Alta) then
    sSql := sSql + ' AND id_fechacargadicta IS NULL ';

  if (iID > 0) then
    sSql := sSql + ' AND id_id = ' + SqlInt(iID)
  else
    sSql := sSql + ' AND id_cuil = ' + SqlValue(sCUIL);

  with GetQuery(sSql) do
  try
    if Eof then
    begin
      if (Accion = Alta) then
        MsgBox('No se encontró la documentación.', MB_ICONEXCLAMATION);
      edIDDocAsoc.Clear;
      mskCUITDocAsoc.Clear;
      cmbTrabDocAsoc.Clear;
    end
    else begin
      edIDDocAsoc.Value   := FieldByName('id_id').AsInteger;
      mskCUITDocAsoc.Text := FIeldByName('id_cuil').AsString;
      cmbTrabDocAsoc.Text := FieldByName('id_nombre').AsString;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edIDDocAsocEnter(Sender: TObject);
begin
  edIDDocAsoc.Tag := edIDDocAsoc.Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edIDDocAsocExit(Sender: TObject);
begin
  if (Accion = Alta) and (edIDDocAsoc.Tag <> edIDDocAsoc.Value) then
  begin
    DoCargarDocumentacion(edIDDocAsoc.Value);
    edIDDocAsoc.Tag := edIDDocAsoc.Value;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.cmbTrabDocAsocEnter(Sender: TObject);
begin
  sdqPapeleria.Open;
  cmbTrabDocAsoc.Tag := edIDDocAsoc.Value;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.cmbTrabDocAsocCloseUp(Sender: TObject);
begin
  inherited;
  if (cmbTrabDocAsoc.Tag <> sdqPapeleria.FieldByName('ID_ID').AsInteger) then
  begin
    DoCargarDocumentacion(sdqPapeleria.FieldByName('ID_ID').AsInteger);
    cmbTrabDocAsoc.Tag := sdqPapeleria.FieldByName('ID_ID').AsInteger;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.SetSqlPapeleria(bRestringir :Boolean);
var
  sSql :String;
begin
  sSql := 'SELECT id_id, id_cuil, id_nombre ' +
           ' FROM SIN.sid_informacion_dictamen ' +
          ' WHERE id_fechabaja IS NULL ';
  if bRestringir then
    sSql := sSql + ' AND id_fechacargadicta IS NULL';

  sdqPapeleria.Close;
  sdqPapeleria.SQL.Text := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoBloquearPapeleria;
var
  bEsPape, bBloquear :Boolean;
begin
  bEsPape     := fraEvento.IsSelected and(fraEvento.sdqDatos.FieldByName('EI_RECEPCION').AsString = 'S');
  bBloquear   := not(bEspape) or (Accion <> Alta);
  LockControls([edIDDocAsoc, mskCUITDocAsoc, cmbTrabDocAsoc], bBloquear);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.edIDDocAsocKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then edIDDocAsocExit(Nil);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.SubTitle.Lines.Clear;
  QueryPrint.SubTitle.Lines.Add('Siniestro: ' + sdqConsulta.FieldByName('SINIESTRO').AsString);
  QueryPrint.SubTitle.Lines.Add(CRLF + 'CUIL: ' + PonerGuiones(fraTrabajadorSIN.CUIL) + '  -  ' +
                                       'Apellido y nombre: ' + fraTrabajadorSIN.Nombre);
  QueryPrint.SubTitle.Lines.Add(CRLF + 'Empresa: ' + fraEmpresa.NombreEmpresa);
  QueryPrint.SubTitle.Lines.Add(CRLF);
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then QueryPrint.Print;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbUsuariosClick(Sender: TObject);
begin
  if HaySiniestroActivo then
  begin
    edUsuAlta.Text  := sdqConsulta.FieldByName('EV_USUALTA').AsString;
    edUsuModif.Text := sdqConsulta.FieldByName('EV_USUMODIF').AsString;
    fpUsuarios.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuViajarLiquidacionesClick(Sender: TObject);
var
  frmLiqIncapacidades: TfrmLiqIncapacidades;
begin
  if HaySiniestroActivo then
    with frmLiqIncapacidades do
    begin
      frmLiqIncapacidades           := TfrmLiqIncapacidades.Create(frmPrincipal);
      MenuItem                      := frmPrincipal.mnuLiqIncapacidades;
      fraEmpresa.Value              := Self.fraEmpresa.Value;
      fraTrabajadorSIN.IdSiniestro  := Self.sdqBusquedaEX_ID.AsInteger;
      DoCargarLiquidaciones(True);
      Show;
      Self.Close;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuViajarSiniestrosClick(Sender: TObject);
var
  frmAdmSiniestros :TfrmAdmSiniestros;
begin
  if HaySiniestroActivo then
    with frmAdmSiniestros do
    begin
      frmAdmSiniestros          := TfrmAdmSiniestros.Create(frmPrincipal);
      MenuItem                  := frmPrincipal.mnuAdmSiniestros;
      fraTrabajador.IdSiniestro := Self.sdqBusquedaEX_ID.AsInteger;
      OnfraTrabajadorChange(nil);
      Show;
      Self.Close;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuViajarContCartasDocClick(Sender: TObject);   // TK 7725
var
  frmListContCartasDoc: TfrmListContCartasDoc;
begin
  if HaySiniestroActivo then
  begin
    Abrir(TfrmListContCartasDoc, frmListContCartasDoc, tmvMDIChild, {$IFDEF SINIESTROS}frmPrincipal.mnuListContCartasDoc{$ELSE}nil{$ENDIF});
    with frmListContCartasDoc do
    begin
      chkSiniestro.Checked  := True;
      edSiniestro.SetValues(Self.edSiniestro.Siniestro,
                            Self.edSiniestro.Orden,
                            Self.edSiniestro.Recaida);
      tbRefrescarClick(nil);
      Show;
      Self.Close;          
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.OnEmpresaChange(Sender: TObject);
var sMensaje: string;
begin
  if Assigned(Sender) then { Si no fue llamado desde FraTrabajadorChange }
    fraTrabajadorSIN.Contrato := fraEmpresa.Contrato;

  if (edSiniestro.Siniestro > 0) then
    sMensaje := GetMensajeEstadoEmpresa(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)
  else    // TK 46381
    sMensaje := GetMensajeEstadoEmpresaConContrato(fraEmpresa.Contrato);
    
  if (sMensaje > '') then
    InfoHint(fraEmpresa.edContrato, sMensaje);
end;

{------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.OnEventoChange(Sender: TObject);   // Lu WF 7775
var
  sSql: String;
  SqlResults: TStringList;
begin

  ssql := 'select ei_caracternulo ' +
           ' from sin.sei_eventoincapacidad ' +
          ' where ei_id = :idev ';

  if ValorSqlEx(ssql, [fraEvento.ID]) = 'S' then
  begin
    sinCaracter := true;
    rbProvisorio.Checked := false;
    rbDefinitivo.Checked := false;
  end
  else
    sinCaracter := false;


  DoEvaluar_RevisionMedica;  // TK 15065
  DoEvaluar_RectifSinContestar;  // TK 25339

  sSql := 'SELECT EI_FECEVANT, EI_CARGAFECHAEVHOY, EI_CHKNOFIRMINCAP, ' +
                ' EI_CHKAFAVORART, EI_EVCONCURRE_ESTCOMPL, EI_FECEVENTO_HOY, ' +   // TK 12229 y 13003
                ' EI_FECMOTYCOMMED_CITTANDIL, EI_RESP_LEGALES ' +  // TK 17866  // tk 38322
           ' FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = ' + SqlValue(fraEvento.Codigo);

  SqlResults := ValoresColSql(sSql);
  try
    DoEvaluar_NiegaFirmIncap(SqlResults[2]);           // TK 7039
    DoEvaluar_AFavorART(SqlResults[3]);                // TK 9043
    DoEvaluar_EstudiosComplementarios(SqlResults[4]);  // TK 12229
    DoEvaluar_EventosCitacionVarios(SqlResults[0], SqlResults[1], SqlResults[5]);
    DoEvaluar_EventosCitacionTandil(SqlResults[6]);    // TK 17866
    DoEvaluar_EventosParaRespLegales(SqlResults[7]);   // TK 38322
  finally
    SqlResults.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.dcFechaRecepExit(Sender: TObject);
begin
  if not(fraEvento.IsEmpty) and not(dcFechaRecep.IsEmpty) and
     (Accion = Alta) and bEsDictamen then
    dcFechaVencim.Date := CalcDiasHabiles(dcFechaRecep.Date, 10);
end;
{------------------------------------------------------------------------------}
// WF 6501
function TfrmSegIncapacidades.TipoCartaAGenerar : Integer;
var
  vGenera: Integer;
begin
  vGenera := iif ((bEsDictamen and chkEnfInculpable.Checked and
                   (fraEvento.sdqDatos.FieldByName('EI_CARTADOC').AsString = 'S')) or
                  (not(bEsDictamen) and
                    (fraEvento.sdqDatos.FieldByName('EI_CARTADOC').AsString = 'S')), 1, 0) +
             iif ((bEsDictamen and chkEnfInculpable.Checked and
                   (fraEvento.sdqDatos.FieldByName('EI_CARTACOM').AsString = 'S')) or
                  (not(bEsDictamen) and
                   (fraEvento.sdqDatos.FieldByName('EI_CARTACOM').AsString = 'S')), 2, 0);

  if vGenera = 3 then
  begin
    rgTipoCarta.ItemIndex := -1;
    if fpTipoCarta.ShowModal = mrOk then
      vGenera := rgTipoCarta.ItemIndex + 1
    else
      vGenera := 0;
  end;

  result := vGenera
end;
{------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarCartaClick(Sender: TObject);
begin
  Verificar(rgTipoCarta.ItemIndex = -1, rgTipoCarta, 'Debe seleccionar el tipo de Carta.');
  fpTipoCarta.ModalResult := mrOk;
end;

{------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarDocumentacion :Boolean;
begin
  Verificar(not(edIDDocAsoc.ReadOnly) and edIDDocAsoc.IsEmpty,
            edIDDocAsoc, 'La documentación asociada es obligatoria para este código de evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoGenerarNotaEntregaReq(iSiniestro, iIdExpediente: Integer);
var
  qrNota :TqrNotaEntregaReq;
begin
  if (fraEvento.sdqDatos.FieldByName('EI_NOTAENTREGAREQ').AsString = 'S') and
     (fpNotaEntregaReq.ShowModal = mrOk) then
  begin
    qrNota := TqrNotaEntregaReq.Create(Self);
    with qrNota do
    try
      if Is_SiniestroDeGobernacion(iIdExpediente) then
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
      else
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

      qrlFecha.Caption          := LugarImpresion + ', ' + DateFormat(dcNota.Date, 'd ''de'' MMMM ''de'' yyyy');
      qrlComisionMedica.Caption := fraComMedica.Codigo;
      qrlDaminificado.Caption   := fraTrabajadorSIN.Nombre;
      qrlExpediente.Caption     := edExpedIncap.Text;
      qrlSiniestro.Caption      := sdqConsulta.FieldByName('SINIESTRO').AsString;
      qrmPedido.Lines.Text      := edObservaciones.Lines.Text;
      qrlFirmante.Caption       := ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                              ' WHERE se_usuario = :Usu', [Sesion.UserID]);

      ImprimirNotaEntregaReq(fraEvento.edCodigo.Text); // Lu wf 7877
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpNotaEntregaReqBeforeShow(Sender: TObject);
begin
  dcNota.Date := Date;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarNotaClick(Sender: TObject);
begin
  Verificar(dcNota.IsEmpty, dcNota, 'Debe seleccionar fecha');
  fpNotaEntregaReq.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.LugarImpresion :String;
begin
  Result := ValorSqlEx('SELECT IIF_CHAR(lg_localidad, :V1, INITCAP(:V2), INITCAP(lg_localidad))' +
                          ' FROM dlg_delegaciones, usc_sectores, use_usuarios' +
                         ' WHERE se_sector = sc_codigo' +
                           ' AND lg_codigo = sc_delegacion' +
                           ' AND se_usuario = :Usuario', ['CAPITAL FEDERAL', 'BUENOS AIRES', Sesion.UserID]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoGenerarNotaRectificatoria(iSiniestro:integer; sComision:String; iIdExpediente: integer);
var
  qrNota :TqrNotaRectificatoria;
  sFirmante, sTrabajadorNomYCuil, sMatricula, sSql: string;
  SqlResults: TStringList;
  CantLineas: integer;
begin
  sFirmante  := '';
  sMatricula := '';
  if (fraEvento.sdqDatos.FieldByName('EI_NOTARECTIFICATORIA').AsString = 'S') and
     MsgAsk('¿Desea enviar la Nota Rectificatoria?') then
  begin
    qrNota := TqrNotaRectificatoria.Create(Self);
    with qrNota do
    begin
      // Lu TK 166 : para obtener el firmante para la Nota:
      sSql := ' SELECT FI_FIRMANTE, FI_MATRICULA ' +
                ' FROM COMUNES.CFI_FIRMA ' +
               ' WHERE FI_ID = ' + fraFirmante.Codigo;
      SqlResults := ValoresColSql(sSql);
      try
        if Is_SiniestroDeGobernacion(iIdExpediente) then
          qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
        else
          qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

        qrlFecha.Caption          := LugarImpresion + ', ' + DateFormat(Date, 'd ''de'' MMMM ''de'' yyyy');
        qrlComisionMedica.Caption := fraComMedica.Codigo;
        qrlDireccion.Caption      := ValorSqlEx('SELECT utiles.armar_domicilio(cm_calle, cm_numero, cm_piso, null, cm_localidad) ' +
                                                 ' FROM sin.scm_comisionmedica ' +
                                                ' WHERE cm_codigo = :cod ', [fraComMedica.Codigo]);
        qrlDaminificado.Caption   := fraTrabajadorSIN.Nombre;
        qrlExpediente.Caption     := edExpedIncap.Text;
        qrlSiniestro.Caption      := sdqConsulta.FieldByName('SINIESTRO').AsString;
        sTrabajadorNomYCuil       := fraTrabajadorSIN.Nombre + ' - CUIL: ' + PonerGuiones(fraTrabajadorSIN.CUIL);

        qrlFirma.Lines.Clear;   // Lu TK 166

        qrlFirma.Lines.Add(SqlResults[0]);
        qrlFirma.Lines.Add(SqlResults[1]);

        Do_armarTextoMemoNotaRectif(SqlResults[0], GetUltFechaDictamen, sTrabajadorNomYCuil, edObservaciones.Lines.Text);    // Lu TK 790
        memoTextoFijo.Lines.Clear;
        memoTextoFijo.Lines := memoTexto.Lines;  // guardo el memo antes de modificarse por si Cancela.

        if fpTextoNotaRectif.showmodal = mrOk then   // modifica texto de la nota
        begin
          CantLineas := memoTexto.Lines.Count;
          while (CantLineas > MAXCANTLINEAS) do
          begin
            if MsgBox('Usted ha excedido la máxima cantidad de lineas que posee el texto (' + IntToStr(MAXCANTLINEAS) + ' lineas).' + #13#10 +
                      'Presione Aceptar para modificar nuevamente el texto.' + #13#10 +
                      'De lo contrario presione Cancelar para truncarlo.'  , MB_ICONQUESTION + MB_OKCANCEL ) = IDOK then
            begin
                if fpTextoNotaRectif.showmodal = mrOk then
                   CantLineas := memoTexto.Lines.Count;
            end
            else
               CantLineas := MAXCANTLINEAS;  // trunca, igual esto es para salir del while.
          end;
          qrMemoTexto.Lines := memoTexto.Lines;
        end
        else      // no modifica el texto de la nota.
          qrMemoTexto.Lines := memoTextoFijo.Lines;

        Visualizar(qrNota, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);  // Lu WF 7946
      finally
        Free;
        SqlResults.Free;
      end;
    end; // del with
  end;
end;

{-------------------------------------------------------------------------------}  // TK 62062
procedure TfrmSegIncapacidades.DoGenerarNotaReqCarDef(sTrabajador, sCuil: string; iIdExpediente, iIdSEVNuevo: integer);
var
  qrNota :TrptNotaReqCarDef;
begin
  if (fraEvento.sdqDatos.FieldByName('ei_notareqcardef').AsString = 'S')  then
  begin
    qrNota := TrptNotaReqCarDef.Create(Self);
    qrNota.Preparar(iIdExpediente, iIdSEVNuevo, sCuil, sTrabajador);
  end;
end;


{-------------------------------------------------------------------------------} // Lu TK 790
procedure TfrmSegIncapacidades.Do_armarTextoMemoNotaRectif(sMedico, sUltFecDictamen, sTrabNomYCuil, sPedido: string);
begin
  memoTexto.Lines.Clear;

  with memoTexto.Lines do
  begin
    Add('De mi mayor consideración:');
    Add('');
    Add(sMedico + ', médico del Area Médica de PROVINCIA A.R.T. con domicilio legal en');
    Add('Carlos Pellegrini 91 de Ciudad  Autónoma de Buenos Aires, me presento y respetuosamente digo:');
    Add('');
    Add('Que vengo por la presente a solicitar rectificatoria,  respecto  del  dictamen  emitido  con  fecha');
    Add(sUltFecDictamen + ' en el expediente de referencia, trabajador:');
    Add(sTrabNomYCuil);
    Add('');
    Add('En el sentido de solicitar que vuestro organismo se pronuncie expresamente acerca de:');
    Add(sPedido);
    Add('');
    Add('Proveer de conformidad.');
    Add('');
    Add('          Sin otro particular, saludamos cordialmente.');
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetUltFechaDictamen :String;
var
  sSql :String;
begin
  sSql := ' SELECT max(ev_fecha) ' +                        // cambio por TK 21140
            ' FROM art.sev_eventosdetramite, sin.sei_eventoincapacidad ' +
           ' WHERE ev_idexpediente = :IdExped ' +
             ' and ei_codigo = ev_codigo ' +
             ' and ei_tipoevento in (1,6,7) ';  // Dictamen

  Result := ValorSqlEx(sSql, [IdExpediente]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoGuardarFechaDictamen;
begin
  dFechaDictamen := 0;
  if bEsDictamen and ( chkAbandono.Checked and not fraMotivo.IsEmpty and
                     (fraMotivo.sdqDatos.FieldByName('mi_exigefdictamen').AsString = 'S') )
                 and (fpFechaDictamen.ShowModal = mrOk) then
    dFechaDictamen := dcAltaDictamen.Date

  else if bEsDictamen and (sdqBusquedaEX_CAUSAFIN.AsString ='02')     // TK 19711
          and MsgAsk('¿Desea reactivar automaticamente el siniestro al estado Activo?')
          and (fpFechaDictamen.ShowModal = mrOk) then
  begin
    dFechaDictamen := dcAltaDictamen.Date;
    Do_CambiarEstadoActivo;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpFechaDictamenBeforeShow(Sender: TObject);
begin
  dcAltaDictamen.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarAltaDictClick(Sender: TObject);
begin
  Verificar(dcAltaDictamen.IsEmpty, dcAltaDictamen, 'Debe seleccionar una fecha.');
  Verificar(dcAltaDictamen.Date > dHoy, dcAltaDictamen, 'La fecha de Alta de Dictamen no puede ser mayor a la fecha actual');    // Validacion adicional de la Fecha de Alta de Dictamen (Lu 30/10/2013)
  fpFechaDictamen.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoDigitalizar;
var
  sSql: String;
  bDigitaliza: boolean;
begin
  if not(fraEvento.sdqDatos.FieldByName('ei_digitaliza').IsNull) then
  begin
    // TK 21670: si es evento de citacion, digitaliza solo si el motivo = 1 (homologación). y (el or: por el resto de los casos)
    bDigitaliza := ((fraEvento.sdqDatos.FieldByName('ei_evcitacion').asString = 'S') and (fraMotivo.Codigo = MOTIVO_HOMOLOGACION))
                   or (fraEvento.sdqDatos.FieldByName('ei_evcitacion').asString = 'N');

    if bDigitaliza then
    begin
      // Lu WF 7267
      fraSDA_DETALLEARCHIVO.Clear;

      if not (fraEvento.sdqDatos.FieldByName('ei_digitalizahojas').IsNull) then         // Lu WF 8131
        fraSDA_DETALLEARCHIVO.HojasDefault := fraEvento.sdqDatos.FieldByName('ei_digitalizahojas').AsInteger
      else
        fraSDA_DETALLEARCHIVO.HojasDefault := 0;

      if (fpDigitalizar.ShowModal = mrOk) and (fraSDA_DETALLEARCHIVO.Opcion <> 'S') then
      begin
        sSql := 'siniestro.do_actualizar_archivo(' + SqlInt(IdExpediente) + ',' +
                                                 SqlValue(fraSDA_DETALLEARCHIVO.Opcion)  + ', ' +
                                                 SqlInt(fraSDA_DETALLEARCHIVO.Hojas) + ', ' +
                                                 SqlValue(Sesion.UserID) + ', ' +
                                                 SqlValue(fraEvento.sdqDatos.FieldByName('ei_digitaliza').AsString) + ', ' +
                                                 'Null, ' +
                                                 'Null, ' +
                                                 '0, ' +
                                                 'Null, ' +
                                                 '''S'');';
        EjecutarStoreST(sSql);
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
// Lu 16/05/2008 - WF 7232 - Genera el reporte o nota de baja del expediente.
procedure TfrmSegIncapacidades.DoGenerarReporteBaja(sExpInc:string; iSiniestro, iIdExped: integer);
var
  qrNotaBaja :TqrNotaBaja;
begin
  qrNotaBaja := TqrNotaBaja.Create(Self);
  try
    with qrNotaBaja do
    begin
      if Is_SiniestroDeGobernacion(iIdExped) then
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
      else
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

      qrlFecha.Caption := LugarImpresion + ', ' + DateFormat(Date, 'd ''de'' MMMM ''de'' yyyy');
      qrlComisionMedica.Caption := Get_ComisionMedica(sExpInc);
      qrlDamnificado.Caption    := fraTrabajadorSIN.cmbNombre.Text;
      qrlSiniestro.Caption      := edSiniestro.SiniestroS + '/' + edSiniestro.OrdenS;
      QRMemoNota.Lines.Add('De nuestra consideración:');
      QRMemoNota.Lines.Add('');
      QRMemoNota.Lines.Add('Por la presente solicito a Uds. se proceda a archivar el expediente ' + sExpInc +
                           ', que pertenece al damnificado de referencia. ');    // se sacó "donde la abrieron el expediente..." por Ticket 59163   // TK 59858: se saco "ya que el mismo se presento en vuestra comision..."
      QRMemoNota.Lines.Add('');
      QRMemoNota.Lines.Add(Trim(edMotivoBaja.Text) + '.' );
      QRMemoNota.Lines.Add('');
      QRMemoNota.Lines.Add('Sin otro particular, aprovecho la oportunidad para saludar a Ud. muy atentamente.');
      qrlFirmante.Caption         := fraFirmanteBaja.cmbDescripcion.Text;
      qrlFirmanteCaracter.Caption := ValorSql('SELECT fi_caracter FROM cfi_firma WHERE fi_id = ' + fraFirmanteBaja.Codigo);

      Preview;
    end;
  finally
    qrNotaBaja.Free;
  end;
end;


{-------------------------------------------------------------------------------}
// Lu WF 7232 - 19/05/2008 Toma la comision medica del expediente que se le pasa. Comision: primera cadena hasta el guion del expediente.
function TfrmSegIncapacidades.Get_ComisionMedica(sIdExpedIncap: string): String;
var
  cadena :String;
begin
  Result := '';
  cadena := Copy(sIdExpedIncap, 1, Pos('-', sIdExpedIncap) -1 );

  if cadena <> '' then
    Result := cadena;
end;
{-------------------------------------------------------------------------------}
// Lu WF 7232
procedure TfrmSegIncapacidades.SetSqlFirmanteBaja(bRestringir: Boolean);
var
  sSql :String;
begin
  sSql := ' SELECT fi_id as id, fi_id as codigo, fi_firmante as descripcion, ' +
                 ' fa_fechabaja as baja ' +
            ' FROM cfa_firmantearea, cat_areatexto, cfi_firma ' +
           ' WHERE fa_idareatexto = at_id ' +
             ' AND fa_idfirmante = fi_id ';
  if bRestringir then
    sSql := sSql + ' AND at_modulo = ''07'' ' +
                   ' AND at_area = ''35'' '   +
                   ' AND fa_fechabaja IS NULL ' +
                   ' AND fi_fechabaja IS NULL ' +
                   ' AND at_fechabaja IS NULL';
  fraFirmanteBaja.Sql := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarFirmanteClick(Sender: TObject);
begin
  inherited;
  Verificar(fraFirmanteBaja.IsEmpty, fraFirmanteBaja, 'Debe seleccionar un firmante.');
  fpFirmanteBaja.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnDigAceptarClick(Sender: TObject);
begin
  if fraSDA_DETALLEARCHIVO.Validate then
    fpDigitalizar.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbNoLiquidarClick(Sender: TObject);
begin
  if HayRegistroActivo and GetPermiteEventos(True) and GetEsNoAutorizable and
     MsgAsk('¿Confirma la NO liquidación del evento seleccionado?') then
  begin
     DoEventoAutorizacion('955', True, False);
     tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}

function TfrmSegIncapacidades.EsEventoRetroacSiempre(sCodEvento: String): Boolean;    // Lu wf 8009
var sSql: String;
begin
  sSql := 'SELECT EI_RETROACSIEMPRE ' +
           ' FROM SIN.SEI_EVENTOINCAPACIDAD ' +
          ' WHERE EI_CODIGO = :cEv ';

  Result := ( ValorSqlEx(sSql, [sCodEvento]) = 'S' );
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.MostrarDatosDigitalizacion;
begin
  if not edSiniestro.IsEmpty then
  begin                      
    lblPoseeDni.Enabled := Is_ExisteDocumentoSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, 'P31');
    lblPoseeRecSueldo.Enabled := Is_ExisteDocumentoSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, 'P49');
  end
  else begin
    lblPoseeDni.Enabled       := False;
    lblPoseeRecSueldo.Enabled := False;
  end;
  DigColorFondo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DigColorFondo;
begin
  If lblPoseeDni.Enabled then
    lblPoseeDni.Color := clGray
  else
    lblPoseeDni.Color := clBtnFace;
  if lblPoseeRecSueldo.Enabled then
    lblPoseeRecSueldo.Color := clGray
  else
    lblPoseeRecSueldo.Color := clBtnFace;
end;
{-------------------------------------------------------------------------------}


procedure TfrmSegIncapacidades.DoCaracterClick;
begin
  if rbProvisorio.enabled and rbDefinitivo.enabled and (dPorcentaje <= 50) then
  begin
    dcIncProv.ReadOnly := not rbProvisorio.Checked;
    dcIncDef.ReadOnly  := not rbDefinitivo.Checked;

    if not dcIncProv.ReadOnly then
    begin
      dcIncProv.Color := clWindow;
      dcIncDef.Color  := $00E8E1D9;
      dcIncDef.Clear;
    end
    else begin
      dcIncProv.Color := $00E8E1D9;
      dcIncDef.Color  := clWindow;
      dcIncProv.Clear;
    end;
  end
  else if (dPorcentaje > 50) then   // se habilitan los dos si el porcentaje es mayor a 50
  begin
    dcIncProv.ReadOnly := False;
    dcIncDef.ReadOnly  := False;
    dcIncProv.Color    := clWindow;
    dcIncDef.Color     := clWindow;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.rbProvisorioClick(Sender: TObject);
begin
  inherited;
  DoCaracterClick;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.rbDefinitivoClick(Sender: TObject);
begin
  inherited;
  DoCaracterClick;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEnviarTelegrama(bEsBaja :Boolean; sFecha, sHora, sUbica :String);
var
  sSql, sCadena, sFormatoTlg :String;
begin

  if bEsBaja then
  begin
    sFormatoTlg := 'TEA04';
    sCadena := ValorSqlEx('select ft_texto from ART.tft_formatotelegrama where ft_codigo = :cod', [sFormatoTlg]);
    sCadena := StringReplace(sCadena,'@FECHA', sFecha,[rfReplaceAll, rfIgnoreCase]);
    sCadena := StringReplace(sCadena,'@HORA', sHora,[rfReplaceAll, rfIgnoreCase]);

    if (Trim(sUbica) <> '') then              // lo cambie por TK 6887, no se completa el sUbica porque el domicilio se saca del domicilio del prestador (fpPrestadorEstCompl), y como era engorroso sacarlo de ahi, consulte con Paula Weissman, a ver si se podia dejar asi.
      sCadena := sCadena + ' EN ' + sUbica + '.';

  end
  else
  begin
    sFormatoTlg := 'TE16';
    sCadena := ValorSqlEx('select ft_texto from ART.tft_formatotelegrama where ft_codigo = :cod', [sFormatoTlg]);
    sCadena := StringReplace(sCadena,'@FECHA', sFecha,[rfReplaceAll, rfIgnoreCase]);
    sCadena := StringReplace(sCadena,'@HORA', sHora,[rfReplaceAll, rfIgnoreCase]);
    sCadena := StringReplace(sCadena,'@DOMICILIO', sUbica,[rfReplaceAll, rfIgnoreCase]);
    sCadena := StringReplace(sCadena,'@SINIESTRO', edSiniestro.SinOrdRec,[rfReplaceAll, rfIgnoreCase]);
  end;

  if  ((bEsBaja and (sdqConsulta.FieldByName('EI_TELEGRAMABAJA').AsString = 'S')) or
      (not(bEsBaja) and (fraEvento.sdqDatos.FieldByName('EI_TELEGRAMAALTA').AsString = 'S'))) and
      not Es_EmpresaPresidenciaNacion and
      MsgAsk('¿Desea enviar el telegrama para informar al trabajador?') then
  begin
    sSql := 'SELECT tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                 '  tj_localidad, tj_cpostal, tj_provincia ' +
             ' FROM ctj_trabajador ' +
            ' WHERE tj_cuil = :CUIL ';
    with GetQueryEx(sSql, [fraTrabajadorSIN.CUIL]) do
    try
      DoInsertarTelegramaST(edSiniestro.SiniestroS,
                            edSiniestro.OrdenS,
                            edSiniestro.RecaidaS,
                            FieldByName('tj_nombre').AsString,
                            FieldByName('tj_calle').AsString,
                            FieldByName('tj_numero').AsString,
                            FieldByName('tj_piso').AsString,
                            FieldByName('tj_departamento').AsString,
                            FieldByName('tj_localidad').AsString,
                            FieldByName('tj_cpostal').AsString,
                            FieldByName('tj_provincia').AsString,
                            sCadena,
                            TIPODEST_TRABAJADOR,
                            sFormatoTlg);

    finally
      Free;
    end;
  end;

  if bEsBaja and (sdqConsulta.FieldByName('EI_TELEGRAMABAJA').AsString = 'S')      // Telegrama a Empresa TK 14768
     and (sdqConsulta.FieldByName('EI_TELEG_EMP_ALTAMED').AsString = 'S')
     and not Es_EmpresaPresidenciaNacion 
     and MsgAsk('¿Desea enviar el telegrama para informar a la Empresa?') then
  begin
     sSql := 'SELECT em_nombre, dc_calle, dc_numero, dc_piso, dc_departamento, ' +
                   ' dc_localidad, dc_cpostal, dc_provincia ' +
              ' FROM adc_domiciliocontrato, aco_contrato, aem_empresa ' +
             ' WHERE em_cuit = :Cuit ' +
               ' AND co_contrato = get_vultcontrato(em_cuit) ' +
               ' AND dc_contrato = co_contrato ' +
               ' AND dc_tipo= ''L'' ';

      with GetQueryEx(sSql, [fraEmpresa.CUIT]) do
      try
        sCadena := 'INFORMAMOS A USTEDES QUE HEMOS REMITIDO AL TRABAJADOR DE LA REFERENCIA TELEGRAMA CON EL TEXTO QUE A CONTINUACIÓN SE TRANSCRIBE. : "' +
                   sCadena + '".';
        DoInsertarTelegramaST(edSiniestro.SiniestroS,
                              edSiniestro.OrdenS,
                              edSiniestro.RecaidaS,
                              FieldByName('em_nombre').AsString,
                              FieldByName('dc_calle').AsString,
                              FieldByName('dc_numero').AsString,
                              FieldByName('dc_piso').AsString,
                              FieldByName('dc_departamento').AsString,
                              FieldByName('dc_localidad').AsString,
                              FieldByName('dc_cpostal').AsString,
                              FieldByName('dc_provincia').AsString,
                              sCadena,
                              TIPODEST_EMPRESA,
                              sFormatoTlg);
      finally
        Free;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
{procedure TfrmSegIncapacidades.DoEnviarCartaDocEmpAltaMed(sCodEvento, sFecha, sHora, sUbica :string);         // TK 11473
var sSql, sSqlAlta: string;
    dAltaMedica :TDate;
begin
  sSql := 'SELECT ei_cartadoc_alta ' +   // TK 27283
           ' FROM Sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :CodEv ';

  sSqlAlta := 'SELECT art.sin.getaltamedultrecexped(ex_siniestro, ex_orden) ALTAMEDICA ' +
                 ' FROM sex_expedientes ' +
                ' WHERE ex_id = :IdExped ';

  dAltaMedica := ValorSqlDateTimeEx(sSqlAlta, [IdExpediente]);

  if (ValorSqlEx(sSql, [sCodEvento]) = 'S')
     and (dAltaMedica > 0)
     and not Es_EmpresaPresidenciaNacion
     and MsgAsk('El Trabajador posee Alta Médica. ¿Desea enviar la Carta Documento para informar a la Empresa?') then
   DoInsertarCartaDoc_AltaMed;
end;    }  // TK 28602 : se comenta este código por este ticket, ya no sale mas dicha carta.

{-------------------------------------------------------------------------------}     // comentado por TK 25896
{procedure TfrmSegIncapacidades.DoEnviarTelegramaCitacion(sCodEvento, sFecha, sHora,     // Lu TK 4345
          sNomPrestador, sDomPrestador, sCPPrestador, sLocPrestador, sObserv: string);
var sSql, sSql2, sCadena: string;
begin
  sSql := 'SELECT ei_telegcittrab ' +
           ' FROM Sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :CodEv ';
  if (ValorSqlEx(sSql, [sCodEvento]) = 'S') and (not Es_EmpresaPresidenciaNacion) then
  begin
    sSql2 := 'SELECT tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                  '  tj_localidad, tj_cpostal, tj_provincia ' +
              ' FROM ctj_trabajador ' +
             ' WHERE tj_cuil = :CUIL ';
    with GetQueryEx(sSql2, [fraTrabajadorSIN.CUIL]) do
    try
      sCadena := 'PRESENTARSE EL DIA ' + sFecha + ' A LAS ' + sHora + ', EN ' +
                 sNomPrestador + ' CALLE ' + sDomPrestador + ' - (' + sCPPrestador + ') - ' +
                 sLocPrestador + ', PARA ' + sObserv +
                 ' PORTANDO ESTUDIOS.  DEBERA ASISTIR CON EL DNI Y ULTIMO RECIBO DE SUELDO.';

      DoInsertarTelegramaST(edSiniestro.SiniestroS,
                            edSiniestro.OrdenS,
                            edSiniestro.RecaidaS,
                            FieldByName('tj_nombre').AsString,
                            FieldByName('tj_calle').AsString,
                            FieldByName('tj_numero').AsString,
                            FieldByName('tj_piso').AsString,
                            FieldByName('tj_departamento').AsString,
                            FieldByName('tj_localidad').AsString,
                            FieldByName('tj_cpostal').AsString,
                            FieldByName('tj_provincia').AsString,
                            sCadena,
                            TIPODEST_TRABAJADOR);
    finally
      Free;
    end;
  end;
end;   }

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoInsertarTelegramaST(sSin, sOrd, sRec, sDest,
                                                     sCalle, sNro, sPiso, sDepto,
                                                     sLoc, sCP, sProv, sTexto, sTipoTeleg, sFormato: string);
var sSql:string;
begin
  sSql := 'INSERT INTO tlg_telegramas  ' +
          '(lg_siniestro, lg_orden, lg_recaida, lg_destinatario, lg_calle, ' +
          ' lg_numero, lg_piso, lg_departamento, lg_localidad, lg_cpostal, ' +
          ' lg_provincia, lg_firmante, lg_firmante2, lg_fechaalta, lg_texto, ' +
          ' lg_tipodestinatario, lg_formato) VALUES ( ' +
          SqlInt(sSin) + ', ' + SqlInt(sOrd) + ', ' + SqlInt(sRec) + ', ' +
          SqlValue(sDest) + ', ' + SqlValue(sCalle) + ', ' + SqlValue(sNro)   + ', ' +
          SqlValue(sPiso) + ', ' + SqlValue(sDepto) + ', ' + SqlValue(sLoc)   + ', ' +
          SqlValue(sCP) + ', ' + SqlValue(sProv) + ', ' + SqlValue(Sesion.Usuario) + ',' +
          ' ''PROVINCIA ART S.A.'', TRUNC(SysDate), ' + SqlValue(sTexto)  + ', ' +
          SqlValue(sTipoTeleg) + ', ' + SqlValue(sFormato) + ')';    // TK 11473
  EjecutarSqlST(sSql);
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEnvioMailArea(sIdEvento, sArea :String);   // Lu TK 2560
var
  sMails, sSql, sSql2 :string;
  sdqAux :TSDQuery;
begin
  if (ValorSql('SELECT ei_envmailarea ' +
                ' FROM SIN.SEI_EVENTOINCAPACIDAD ' +
               ' WHERE ei_codigo = ' + SqlString(sIdEvento)) = 'S') then
  begin
    if (sArea = CODAREA_LEGALES_MAIL) then              // LEGALES
    begin
      EnviarMailBD(Get_DireccionesEnvioMail('AV_EVLEGAL'),
                  'Solicitud de Documentación Interna. Siniestro: ' + edSiniestroABM.SinOrdRec, [],
                  'El Usuario ' + Sesion.Usuario + ' solicita la siguiente documentación: ' +
                   edObservaciones.Text + ' para presentar en Comisión Médica.' );
    end
    else if (sArea = CODAREA_AREAMEDICA_MAIL) then      // AREA MEDICA
    begin
      // Supervisor y Referente
      sSql := ' SELECT se_mail ' +
                ' FROM art.mug_usuariogrupotrabajo, art.use_usuarios ' +
               ' WHERE ug_usuario = se_usuario ' +
                 ' AND ug_fechabaja IS NULL ' +
                 ' AND se_fechabaja IS NULL ' +
                 ' AND ug_tipousuario IN (''01'',''02'') ' +
                 ' AND ug_grupo = ' + sdqBusquedaEX_GTRABAJO.AsString;
      sdqAux := GetQuery(sSql);
      try
        sMails := '';
        while not sdqAux.Eof do
        begin
          if (sMails <> '') then
            sMails := sMails + ',';
          sMails := sMails + sdqAux.FieldByName('SE_MAIL').AsString;
          sdqAux.Next;
        end;
      finally
        sdqAux.Free;
      end;

      // Gestor
      sSql2 := ' SELECT se_mail ' +
                 ' FROM art.use_usuarios, art.sex_expedientes ' +
                ' WHERE se_usuario = ex_gestor ' +
                  ' AND se_fechabaja IS NULL ' +
                  ' AND ex_id = ' + sqlValue(sdqBusquedaEX_ID.AsInteger);
      sdqAux := GetQuery(sSql2);
      if not sdqAux.Eof then
      begin
        if (sMails <> '') then
          sMails := sMails + ',';
        sMails := sMails + sdqAux.FieldByName('SE_MAIL').AsString;
      end;

      if (sMails <> '') and not ((fraEvento.Codigo = '082') and (chkRecalificacion.Checked)) then    // TK 39543: el "and not.." es por el ticket 37492 (segun Karina quiere que si es un 082 y esta chequeado "Recalificacion", sólo tiene que enviar a los que dice abajo.
         EnviarMailBD(sMails,
                     'Solicitud de Documentación Interna. Siniestro: ' + edSiniestroABM.SinOrdRec, [],
                     'El Usuario ' + Sesion.Usuario + ' solicita la siguiente documentación: ' +
                      edObservaciones.Text + ' para presentar en Comisión Médica.');

      // TK 37492
      if (fraEvento.Codigo = '082') and (chkRecalificacion.Checked) then
         EnviarMailBD(Get_DireccionesEnvioMail('RECA082'),
                  'Solicitud de Documentación Interna. Siniestro: ' + edSiniestroABM.SinOrdRec, [],
                  'El Usuario ' + Sesion.Usuario + ' solicita la siguiente documentación: ' +
                   edObservaciones.Text + ' para presentar en Comisión Médica.');

    end
    else if (sArea = CODAREA_PREVENCION_MAIL) then         // PREVENCION   // TK 21336
    begin
      EnviarMailBD(Get_DireccionesEnvioMail('AV_EVPREV'),
                  'Solicitud de Documentación Interna. Siniestro: ' + edSiniestroABM.SinOrdRec, [],
                  'El Usuario ' + Sesion.Usuario + ' solicita la siguiente documentación: ' +
                   edObservaciones.Text + ' para presentar en Comisión Médica.' + #13#10 +
                   'Damnificado: ' + fraTrabajadorSIN.Nombre + ' - N° CUIL: ' + fraTrabajadorSIN.CUIL + #13#10 +
                   'Empresa: ' + fraEmpresa.RazonSocial + ' - N° CUIT: ' + fraEmpresa.CUIT + #13#10 +
                   'Diagnóstico: ' + edDiagnostico.Text);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetEsNoAutorizable :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT inca.get_esnoautorizable(:IdEvento) FROM dual';

  if (ValorSqlEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger]) = 'S') then
    Result := True
  else begin
    InfoHint(Nil, 'El evento no es "no autorizable" ó ya se ha marcado para no liquidar.');
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbExpedienteClick(Sender: TObject);
begin
  if not(HaySiniestroActivo) then Exit;
  DoRefrescarExpediente(False);
  fpExpediente.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbReplicarDictClick(Sender: TObject);
var
  idEv :Integer;
begin
  if HayRegistroActivo and
    (sdqConsulta.FieldByName('EI_TIPOEVENTO').AsInteger in [1,6,7]) and
    (sdqConsulta.FieldByName('EV_EVENTO').AsInteger > 0) then
  begin
    DoLimpiarDatosEvento(True);
    fpEventos.Caption := 'Réplica de Dictamen';
    Accion            := Replica;
    idEv := sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger;
    DoCargarDatosEvento(idEv, True, True);
    if (fpEventos.ShowModal = MrOk) then
    try
      BeginTrans;
      DoBorrarEvento(idEv, Siniestro, Orden, True);
      DoGuardarDatosEvento(True, True);
      //DoAnularAutAsociada(idEv);    47986
      CommitTrans;
      GestionarDictamenAGAySIC;
      tbRefrescarClick(Nil);
      MsgBox('Los datos del evento se guardaron correctamente.', MB_ICONINFORMATION);
    except
      on E: Exception do
      begin
        Rollback(True);
        ErrorMsg(E, 'Error al grabar los datos del evento.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetEventoAutoriza :String;
var
  sSql: String;
begin
  sSql   := 'SELECT art.inca.get_codeventoautoriza(:IdEvento, :extensionILT) FROM dual';
  Result := ValorSqlEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger, sdqConsulta.FieldByName('EI_AUTORIZAEXTENSIONILT').AsString]);
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetPrestEstCompl: Integer;       // Lu TK 4345
begin
  Result := 0;
  if (fraEvento.sdqDatos.FieldByName('EI_TELEGCITTRAB').AsString = 'S') then     // por ahora solo el evento 121
  begin
      fraPrestadorEstComp.Clear;
      if (fpPrestadorEstComp.ShowModal = MrOk) then
      begin
        Result := fraPrestadorEstComp.edCA_IDENTIFICADOR.Value;
        DoImprimirPlanillaEstCompl;
      {  if not Es_EmpresaPresidenciaNacion
           and MsgAsk('¿Desea enviar el telegrama para informar al trabajador?') then
          DoEnviarTelegramaCitacion(fraEvento.Codigo, dcFecha.Text, mskHora.Text,
                                    fraPrestadorEstComp.cmbCA_DESCRIPCION.Text,
                                    fraPrestadorEstComp.edCA_DOMICILIO.Text,
                                    fraPrestadorEstComp.edCA_CODPOSTAL.Text,
                                    fraPrestadorEstComp.edCA_LOCALIDAD.Text,
                                    edObservaciones.Text);        }   // comentado por TK 25896 (ahora manda la carta documento cód: ESTCO, y no manda mas el telegrama)
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnPrestadorAceptarClick(Sender: TObject);
begin
  Verificar(fraPrestadorEstComp.IsEmpty, fraPrestadorEstComp, 'Debe completar el Prestador');
  fpPrestadorEstComp.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoImprimirPlanillaEstCompl;   // Lu TK 4345
var
  rptEstudiosCompl: TqrEstudiosCompl;
begin
  rptEstudiosCompl := TqrEstudiosCompl.Create(Self);
  with rptEstudiosCompl do
    try
      qrlNombre.Caption         := fraTrabajadorSIN.cmbNombre.Text;
      qrlSiniestro.Caption      := edSiniestro.SinOrdRec;
      qrlPrestador.Caption      := fraPrestadorEstComp.cmbCA_DESCRIPCION.Text;
      qrlDomicPrestador.Caption := fraPrestadorEstComp.edCA_DOMICILIO.Text + ' - '
                                   + fraPrestadorEstComp.edCA_LOCALIDAD.Text + ' - CP '
                                   + fraPrestadorEstComp.edCA_CODPOSTAL.Text;
      qrlFechaTurno.Caption     := dcFecha.Text;
      qrlHoraTurno.Caption      := mskHora.Text + ' hs.';
      qrlRequerimiento.Caption  := edObservaciones.text;
      Print;
    finally
      free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoFecha2daCit(iNuevoEv: Integer);   // Lu TK 5949  (relacionado ademas con el procedimiento.. )
var sSql:string;
    iNuevoEvento107: integer;
begin
  if (not fraEvento.sdqDatos.FieldByName('EI_GENERAEVENTO').isNull) then   // por ahora sólo sirve para el 101, que genera el 107
  begin
    dcFecha2daCit.Clear;
    mskHora2daCit.Clear;
    if fpFecha2daCitacion.ShowModal = mrOk then
    begin
      sSql := ' UPDATE art.sev_eventosdetramite ' +
                 ' SET ev_fecha2dacit = ' + SqlDate(dcFecha2daCit.Date) + ', ' +
                     ' ev_hora2dacit = ' + SqlValue(GetHoraCorrecta(mskHora2daCit.Text)) +
               ' WHERE ev_idevento = ' + SqlInt(iNuevoEv);

      EjecutarSqlST(sSql);

      iNuevoEvento107 := GetSecNextVal('SEQ_SEV_ID');

      sSql := 'art.inca.do_insertarevento(' + SqlInt(edSiniestro.Siniestro) + ', ' +
                                              SqlInt(edSiniestro.Orden) + ', ' +
                                              SqlDate(dcFecha2daCit.Date) + ', ' +
                                              SqlValue(fraEvento.sdqDatos.FieldByName('EI_GENERAEVENTO').AsString) +
                                              ', NULL, ' +
                                              SqlValue(Sesion.UserId) +
                                              ', NULL, ' +
                                              SqlValue(fraComMedica.Codigo) + ', ' +
                                              ' NULL, NULL, ' +
                                              SqlValue(fraMotivo.Codigo) + ', ' +
                                              SqlValue(GetHoraCorrecta(mskHora2daCit.Text)) + ', ' +
                                              SqlValue(fraMedico.Codigo) + ', ' +
                                              ' NULL, NULL, NULL, NULL, ' +
                                              SqlValue(fraUbicIncap.Codigo) +
                                              ', NULL, NULL, NULL, NULL, NULL, NULL, ' +
                                              SqlValue(fraFirmante.edCodigo.Text) +
                                              ', NULL, NULL, NULL, NULL, ' +
                                              SqlInt(iNuevoEvento107) + ',' +
                                              ' NULL, NULL, NULL, NULL, NULL, NULL, ' +
                                              ' NULL, NULL, NULL, NULL, NULL, NULL, ' +
                                              ' NULL, NULL, NULL, NULL, NULL, NULL, NULL);';
      EjecutarStoreST(sSql);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarFec2daCitClick(Sender: TObject);   // Lu TK 5949
begin
  inherited;
  Verificar((dcFecha2daCit.IsEmpty) or (Trim(mskHora2daCit.Text) = ':'), nil, 'Debe completar Fecha y Hora');
  fpFecha2daCitacion.ModalResult := mrOk;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEvaluar_NiegaFirmIncap(sChkNoFirmIncap:String);     // Lu TK 7039
begin
  if (sChkNoFirmIncap = 'S') then
  begin
    LockControls([chkNiegaFirmarIncap], False);
    lblNiegaFirmarIncap.Enabled := True;
  end
  else begin
    LockControls([chkNiegaFirmarIncap], True);
    lblNiegaFirmarIncap.Enabled := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEvaluar_AFavorART(sChkAFavorART: String);        // Lu TK 9043
begin
  if (sChkAFavorART = 'S') then
  begin
    LockControls([chkAFavorART], False);
    lblAFavorART.Enabled := True;
  end
  else begin
    LockControls([chkAFavorART], True);
    lblAFavorART.Enabled := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnRemitoExpedientesClick(Sender: TObject);       // Lu TK 7558
begin
  if fpImpRemitoExpedientes.ShowModal = mrOk then
  begin
    DoImprimirRemitoExpedientes(CODEVENTOREMITO_COMMED, DEST_COMMED);
    DoImprimirRemitoExpedientes(CODEVENTOREMITO_OFHOMOL, DEST_OFHOMOL);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarRemitoExpClick(Sender: TObject);        // Lu TK 7558
begin
  if ValidarRemitoExpedientes then fpImpRemitoExpedientes.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpImpRemitoExpedientesBeforeShow(Sender: TObject);    // Lu TK 7558
begin
  edUsuarioAltaEventoRemito.Text := Sesion.Usuario;
  dcFechaEventoRemito.Date       := dHoy;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarRemitoExpedientes: Boolean;     // Lu TK 7558
begin
  Verificar(dcFechaEventoRemito.IsEmpty, dcFechaEventoRemito, 'Debe seleccionar una Fecha de Evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoImprimirRemitoExpedientes(sCodigoEvento, sDestinatario: string);   // Lu TK 7558
var
  qrRemitoExpedientes: TqrRemitoExpedientes;
begin
  qrRemitoExpedientes := TqrRemitoExpedientes.Create(Self);
  with qrRemitoExpedientes do
    try
      qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
      qrlFecha.Caption           := LugarImpresion + ', ' + DateFormat(dcFechaEventoRemito.Date, 'd ''de'' MMMM ''de'' yyyy');
      qrlDestinatario.Caption    := sDestinatario;
      qrlUsuarioFirma.Caption    := Sesion.Usuario;
      qrlSectorUsuario.Caption   := Sesion.SectorDesc;


      with sdqRemitoExpedientes do
      begin
        Close;
        ParamByName('pFechaEv').AsDate   := dcFechaEventoRemito.Date;
        ParamByName('pUsuario').AsString := Sesion.LoginName;
        ParamByName('pCodigo').AsString  := sCodigoEvento;
        Open;
      end;
      print;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbSinAntCobIncapClick(Sender: TObject);   // TK 8805
var
  sSql: string;
begin
  if HaySiniestroActivo then
  begin
    sSql := 'SELECT ex_siniestro Siniestro, ex_orden orden, ex_recaida recaida ' +
             ' FROM art.sex_expedientes, art.sev_eventosdetramite A ' +
            ' WHERE ex_siniestro = A.ev_siniestro ' +
              ' AND ex_orden = A.ev_orden ' +
              ' AND ex_recaida = A.ev_recaida ' +
              ' AND ex_cuil = ' + SqlValue(fraTrabajadorSIN.mskCUIL.Text) +
              ' AND NVL(EX_CAUSAFIN, '' '') NOT IN (''95'',''99'') ' +
             // ' AND ex_fechaaccidente < ' + SqlDate(edSinFecha.Date) +  // Se comentó por TK 9890
              ' AND A.ev_evento = (SELECT MAX(B.ev_evento) ' +
                                  ' FROM art.sev_eventosdetramite B, sin.sei_eventoincapacidad ' +
                                  ' WHERE B.ev_siniestro = A.ev_siniestro ' +
                                    ' AND B.ev_orden = A.ev_orden ' +
                                    ' AND B.ev_recaida = A.ev_recaida ' +
                                    ' AND B.ev_codigo = ei_codigo ' +
                                    ' AND ei_autoriza = ''S'' ' +       // actualmente estos son los 950 y 953
                                    ' AND B.ev_evento > 0) ';
    sdqSiniIncap.Close;
    sdqSiniIncap.SQL.Text := sSql;
    sdqSiniIncap.Open;
    fpSiniIncap.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoHabilitarBtnCobroIncap;    // TK 8805
var sSql:string;
begin
  sSql := 'SELECT 1 ' +
           ' FROM art.sex_expedientes, art.sev_eventosdetramite A ' +
          ' WHERE ex_siniestro = A.ev_siniestro ' +
            ' AND ex_orden = A.ev_orden ' +
            ' AND ex_recaida = A.ev_recaida ' +
            ' AND ex_CUIL = ' + SqlValue(fraTrabajadorSIN.mskCUIL.Text) +
            ' AND NVL(EX_CAUSAFIN, '' '') NOT IN (''95'',''99'') ' +
           // ' AND ex_fechaaccidente < ' + SqlDate(edSinFecha.Date) +     // Se comentó por TK 9890
            ' AND A.ev_evento = (SELECT MAX(B.ev_evento) ' +
                                 ' FROM art.sev_eventosdetramite B, sin.sei_eventoincapacidad  ' +
                                ' WHERE B.ev_siniestro = A.ev_siniestro ' +
                                  ' AND B.ev_orden = A.ev_orden ' +
                                  ' AND B.ev_recaida = A.ev_recaida ' +
                                  ' AND B.ev_codigo = ei_codigo ' +
                                  ' AND ei_autoriza = ''S'' ' +
                                  ' AND B.ev_evento > 0) ';

  tbSinAntCobIncap.Enabled := ExisteSql(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuVerDigitalizacionClick(Sender: TObject);
var
  sClaveArmada: String;
  IdArchivo: TTableId;
begin
  if not edSiniestro.IsEmpty then
    begin
      sClaveArmada := GetClaveArmada(2, IntToStr(edSiniestro.Siniestro), IntToStr(edSiniestro.Orden), '', '');
      IdArchivo    := GetIdArchivo(ID_CARPETA_INCAPACID, sClaveArmada);

      if IdArchivo <> ART_EMPTY_ID then
        TFrmDetalleArchivo.MostrarDetalleArchivo(Owner, IdArchivo, True);
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuViajarPopup(Sender: TObject);
begin
  mnuVerDigitalizacion.Visible := not edSiniestro.IsEmpty;

  // habilitaciones boton Viajar
  mnuViajarLiquidaciones.Enabled := frmPrincipal.Seguridad.Claves.IsActive('VerLiquidaciones');
  mnuViajarSiniestros.Enabled    := frmPrincipal.Seguridad.Claves.IsActive('VerSiniestros');
  // el de mnuViajarContCartasDoc esta en el Refrescar.
  // el de Ver Digitalizacion no es una pantalla que salga del principal.
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.ValidarNivelBaja :Boolean;
begin
  Verificar(not(AreIn(sdqConsulta.FieldByName('EI_NIVELPERFIL').AsString, aNiveles)),
            tbEliminar, 'Ud. no posee permisos para dar de baja este evento.');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEnvioMailPluriempleo(sIdEvento: String);     // TK 10277
var
  IdExpRelacionado, SiniPluriemp, sbody, smails, sql : String;
begin
  sql := 'SELECT ei_mailpluriempleo ' + // me fijo si al evento corresponde enviarle el mail (por ahora son el 500, 504 y 800)
          ' FROM sin.sei_eventoincapacidad ' +
         ' WHERE ei_codigo = ' + SqlValue(sIdEvento);

  if (ValorSql(sql) = 'S') then
  begin
     IdExpRelacionado := Get_ExpedPluriempleo(IntToStr(IdExpediente));
     if (IdExpRelacionado <> '') then
     begin
       SiniPluriemp := ValorSQLEx('SELECT art.siniestro.get_siniestrocompleto(:IdExp) FROM DUAL', [IdExpRelacionado]);
       sbody        := 'Se ha cargado un dictámen que posee Pluriempleo.';
       sbody        := sbody + #13#10 + 'Nro Siniestro en cuestión: ' + edSiniestro.SinOrdRec;
       sbody        := sbody + #13#10 + 'Nro Siniestro relacionado: ' + SiniPluriemp;
       smails       := Get_MailUsuario(Sesion.UserID) + ',' + Get_MailUsuario(USU_MAILFIJOPLURI);

       EnviarMailBD(smails, '[AvisosAutomaticos] - Pluriempleo', [], sbody, nil, 0, tcDefault, True);
     end;
  end;
end;

{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.Get_EvaluarGenAutorizacion(sCodEvento: string): string;   // TK 11992
var Sql: string;
begin
  Result := 'N';
  Sql := 'SELECT EI_PREGUNTAUSUQUIEREAUT ' +
          ' FROM SIN.SEI_EVENTOINCAPACIDAD ' +
         ' WHERE EI_CODIGO = ' + SqlValue(sCodEvento);
  if (ValorSql(Sql) = 'S') then
    if MsgAsk('¿Desea generar la autorización correspondiente?') then
      Result := 'S';
end;

{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.Get_MailUsuario(sUsuId:String): String;      // TK 10277
begin
  Result := ValorSqlEx('SELECT se_mail FROM art.use_usuarios ' +
                       ' WHERE se_usuario = :UsuId ', [sUsuId]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbInsertarFechasClick(Sender: TObject);
begin
  tbInsertarFechas.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoCargarFechaTopeLiqYBloquear(iIdEvento: Integer);   // Lu 04/11 (pedido)   // carga la fecha y si existe la misma, la bloquea para que no se modifique
var
  bbloquea : boolean;
begin
  dcFecTopeLiq.Clear;
  dcFecTopeLiq.Date := ValorSqlDateTimeEx('SELECT ev_fechatopeliq ' +
                                           ' FROM art.sev_eventosdetramite ' +
                                          ' WHERE ev_idevento = :IDEVENTO ', [iIdEvento]);
  bbloquea := (dcFecTopeLiq.Date > 0);
  LockControls([dcFecTopeLiq, btnAceptarFecTopeLiq], bbloquea);
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.Validar_HabilitarFecTopeLiquid(iIdEvento: integer): Boolean;           // Lu 04/11
var
  dFecha: TDate;
begin
  Verificar(not (sdqConsulta.FieldByName('EI_TIPOEVENTO').AsInteger in [1,6,7]), nil,
            'El evento seleccionado no es un Dictámen');
  Verificar(not Es_DictamenAutorizado(iIdEvento), nil, 'El Dictámen seleccionado no se encuentra autorizado');

  if (sdqConsulta.FieldByName('EV_CARACTER').AsString = 'P') then   // 'P' (Provisorio)
  begin
    dFecha := ValorSqlDateTimeEx('SELECT art.inca.get_finprovisoria(:IdEV) From Dual', [iIdEvento]);
    Verificar(dFecha > 0, nil, 'El Dictámen seleccionado ya posee una fecha tope para liquidaciones');
  end
  else begin // aca entra por 'D' (Definitivo) o nulo
    dFecha := ValorSqlDateTimeEx('SELECT art.inca.get_findefinitiva(:IdEV) From Dual', [iIdEvento]);
    Verificar(dFecha > 0, nil, 'El Dictámen seleccionado ya posee una fecha tope para liquidaciones');
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.Es_DictamenAutorizado(iIdEvento: integer): Boolean;   // Lu 04/11
var
  sSql: string;
begin
  sSql := ' SELECT art.inca.get_autorizado(:IdEv) ' +
            ' FROM dual ';
  Result := ValorSqlEx(sSql, [iIdEvento]) = 'S';
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarFecTopeLiqClick(Sender: TObject);          // Lu 04/11
begin
  if Validar_FechaTopeLiquid then
    fpFechaTopeLiquid.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.Validar_FechaTopeLiquid: Boolean;     // Lu 04/11
var
  dFecha: TDate;
  iEvento: integer;
begin
  iEvento := sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger;

  Verificar(dcFecTopeLiq.isEmpty, dcFecTopeLiq, 'La fecha no puede ser nula');

  if (sdqConsulta.FieldByName('EV_CARACTER').AsString = 'P') then   // 'P' (Provisorio)
  begin
    dFecha := ValorSqlDateTimeEx('SELECT art.inca.get_inicioprovisoria(:IdEV) From Dual', [iEvento]);
    Verificar((dcFecTopeLiq.Date < dFecha), dcFecTopeLiq,
              'Esta fecha debe ser mayor a la de Fecha inicio Provisoria (' + DateToStr(dFecha) + ')');
  end
  else begin // aca entra por 'D' (Definitivo) o nulo
    dFecha := ValorSqlDateTimeEx('SELECT art.inca.get_iniciodefinitiva(:IdEV) From Dual', [iEvento]);
    Verificar((dcFecTopeLiq.Date < dFecha), dcFecTopeLiq,
              'Esta fecha debe ser mayor a la de Fecha inicio Definitiva (' + DateToStr(dFecha) + ')');
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbLegajoClick(Sender: TObject);
begin
  tbLegajo.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.DoCargarDatosLegajo: Integer;
var
  sSql, sAcu: String;
  iIdLegajo: Integer;
begin
  lblTitulo.Caption := '';
  sSql := 'SELECT le_id, le_historiaclinica, le_pmi, le_denuncia, le_acuserecibo, ' +
                ' le_fotocopiadni, le_pme, le_acuerdo, le_tratamedico, le_rehabilitacion, ' +
                ' le_tratapsicologico, le_trataquirurgico, le_recalaboral, le_otrostratamientos, ' +
                ' le_protoquirurgico, le_interconsulta, le_psicodiagnostico, le_radiografias, ' +
                ' le_ecografias, le_tac, le_rmn, le_emg, le_estaudiologicos, le_estoftalmologicos, ' +
                ' le_estneumonologicos, le_recalificacion, le_laboratorio, le_estcomplementarios, ' +
                ' le_otrosestudios ' +
           ' FROM sin.sle_legajoexpediente ' +
          ' WHERE le_idexpediente = :IdExped ' +
            ' AND le_fechabaja IS NULL ';

  with GetQueryEx(sSql, [IdExpediente]) do
  try
    if not Eof then
    begin
      chkLE_HISTORIACLINICA.Checked     := (FieldByName('le_historiaclinica').AsString = 'S');
      chkLE_PMI.Checked                 := (FieldByName('le_pmi').AsString = 'S');
      chkLE_DENUNCIA.Checked            := (FieldByName('le_denuncia').AsString = 'S');
      chkLE_ACUSERECIBO.Checked         := (FieldByName('le_acuserecibo').AsString = 'S');
      chkLE_FOTOCOPIADNI.Checked        := (FieldByName('le_fotocopiadni').AsString = 'S');
      chkLE_PME.Checked                 := (FieldByName('le_pme').AsString = 'S');
      chkLE_ACUERDO.Checked             := (FieldByName('le_acuerdo').AsString = 'S');
      chkLE_TRATAMEDICO.Checked         := (FieldByName('le_tratamedico').AsString = 'S');
      chkLE_REHABILITACION.Checked      := (FieldByName('le_rehabilitacion').AsString = 'S');
      chkLE_TRATAPSICOLOGICO.Checked    := (FieldByName('le_tratapsicologico').AsString = 'S');
      chkLE_TRATAQUIRURGICO.Checked     := (FieldByName('le_trataquirurgico').AsString = 'S');
      chkLE_OTROSTRATAMIENTOS.Checked   := not(FieldByName('le_otrostratamientos').IsNull);
      edLE_OTROSTRATAMIENTOS.Lines.Text := FieldByName('le_otrostratamientos').AsString;
      chkLE_PROTOQUIRURGICO.Checked     := (FieldByName('le_protoquirurgico').AsString = 'S');
      chkLE_INTERCONSULTA.Checked       := (FieldByName('le_interconsulta').AsString = 'S');
      chkLE_PSICODIAGNOSTICO.Checked    := (FieldByName('le_psicodiagnostico').AsString = 'S');
      chkLE_RADIOGRAFIAS.Checked        := (FieldByName('le_radiografias').AsString = 'S');
      chkLE_ECOGRAFIAS.Checked          := (FieldByName('le_ecografias').AsString = 'S');
      chkLE_TAC.Checked                 := (FieldByName('le_tac').AsString = 'S');
      chkLE_RMN.Checked                 := (FieldByName('le_rmn').AsString = 'S');
      chkLE_EMG.Checked                 := (FieldByName('le_emg').AsString = 'S');
      chkLE_ESTAUDIOLOGICOS.Checked     := (FieldByName('le_estaudiologicos').AsString = 'S');
      chkLE_ESTOFTALMOLOGICOS.Checked   := (FieldByName('le_estoftalmologicos').AsString = 'S');
      chkLE_ESTNEUMONOLOGICOS.Checked   := (FieldByName('le_estneumonologicos').AsString = 'S');
      chkLE_RECALIFICACION.Checked      := (FieldByName('le_recalificacion').AsString = 'S');
      chkLE_LABORATORIO.Checked         := (FieldByName('le_laboratorio').AsString = 'S');
      chkLE_ESTCOMPLEMENTARIOS.Checked  := (FieldByName('le_estcomplementarios').AsString = 'S');
      chkLE_OTROSESTUDIOS.Checked       := not(FieldByName('le_otrosestudios').IsNull);
      edLE_OTROSESTUDIOS.Lines.Text     := FieldByName('le_otrosestudios').AsString;
      iIdLegajo                         := FieldByName('le_id').AsInteger;
    end                                            
    else begin
      sSql                              := 'SELECT art.siniestro.get_existedocumento(:IdExpe, :Docu) ' +
                                            ' FROM dual';
      chkLE_HISTORIACLINICA.Checked     := False;
      chkLE_PMI.Checked                 := (ValorSqlEx(sSql, [IdExpediente, 'PMI']) = 'S');
      chkLE_DENUNCIA.Checked            := (ValorSqlEx(sSql, [IdExpediente, 'DEN']) = 'S');
      chkLE_ACUSERECIBO.Checked         := False;
      chkLE_FOTOCOPIADNI.Checked        := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'P31');
      chkLE_PME.Checked                 := (ValorSqlEx(sSql, [IdExpediente, 'PME']) = 'S');
      sAcu                              := 'SELECT 1 ' +
                                            ' FROM sev_eventosdetramite, sin.sei_eventoincapacidad ' +
                                           ' WHERE ev_codigo = ei_codigo ' +
                                             ' AND ev_evento > 0 ' +
                                             ' AND ei_tipoevento IN (2, 3) ' + //los acuerdos
                                             ' AND ev_idexpediente = :Idexped ';
      chkLE_ACUERDO.Checked             := ExisteSqlEx(sAcu, [IdExpediente]);
      chkLE_TRATAMEDICO.Checked         := False;
      chkLE_REHABILITACION.Checked      := False;
      chkLE_TRATAPSICOLOGICO.Checked    := False;
      chkLE_TRATAQUIRURGICO.Checked     := False;
     // chkLE_RECALABORAL.Checked         := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'CAR');
      chkLE_OTROSTRATAMIENTOS.Checked   := False;
      chkLE_PROTOQUIRURGICO.Checked     := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'PRQ');
      chkLE_INTERCONSULTA.Checked       := False;
      chkLE_PSICODIAGNOSTICO.Checked    := False;
      chkLE_RADIOGRAFIAS.Checked        := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'PLA');
      chkLE_ECOGRAFIAS.Checked          := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'ECO') or
                                           Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'ECODO');
      chkLE_TAC.Checked                 := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'TAC');
      chkLE_RMN.Checked                 := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'RMN');
      chkLE_EMG.Checked                 := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'EMG');
      chkLE_ESTAUDIOLOGICOS.Checked     := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'AUDIO');
      chkLE_ESTOFTALMOLOGICOS.Checked   := False;
      chkLE_ESTNEUMONOLOGICOS.Checked   := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'ESPIRO');
      chkLE_RECALIFICACION.Checked      := False;
      chkLE_LABORATORIO.Checked         := Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, -1, 'LAB');
      chkLE_ESTCOMPLEMENTARIOS.Checked  := False;
      chkLE_OTROSESTUDIOS.Checked       := False;
      iIdLegajo                         := 0;
    end;
  finally
    Free;
  end;
  Result := iIdLegajo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.chkLE_OTROSTRATAMIENTOSClick(Sender: TObject);
begin
  LockControl(edLE_OTROSTRATAMIENTOS, not chkLE_OTROSTRATAMIENTOS.Checked);
  if not chkLE_OTROSTRATAMIENTOS.Checked then
    edLE_OTROSTRATAMIENTOS.Lines.Clear
  else if edLE_OTROSTRATAMIENTOS.CanFocus then
    edLE_OTROSTRATAMIENTOS.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.chkLE_OTROSESTUDIOSClick(Sender: TObject);
begin
  LockControl(edLE_OTROSESTUDIOS, not chkLE_OTROSESTUDIOS.Checked);
  if not chkLE_OTROSESTUDIOS.Checked then
    edLE_OTROSESTUDIOS.Lines.Clear
  else if edLE_OTROSESTUDIOS.CanFocus then
    edLE_OTROSESTUDIOS.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarLegClick(Sender: TObject);
begin
  if (MsgBox('¿Esta seguro que desea guardar los cambios del Legajo?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    Verificar(chkLE_OTROSTRATAMIENTOS.Checked and (Trim(edLE_OTROSTRATAMIENTOS.Lines.Text) = ''),
              edLE_OTROSTRATAMIENTOS, 'Debe ingresar los tratamientos o prestaciones correspondientes.');
    Verificar(chkLE_OTROSESTUDIOS.Checked and (Trim(edLE_OTROSESTUDIOS.Lines.Text) = ''),
              edLE_OTROSESTUDIOS, 'Debe ingresar los estudios correspondientes.');
    fpLegajo.ModalResult := mrOk;
    DoGuardarDatosLegajo;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuDatosLegajoClick(Sender: TObject);
begin
  if not EsPrimeraVez_Legajo(IdExpediente) then          // TK 16032
  begin
    DoCargarDatosLegajo;
    fpLegajo.ShowModal;
  end
  else  // Si es primera vez:
    Do_VisualizarDocDigitalizados(IdExpediente);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuImpLegajoClick(Sender: TObject);
var
  sSql: String;
  bNuevo: boolean;
begin
 if HaySiniestroActivo then
  begin
    sSql := 'SELECT 1 ' +
             ' FROM sin.sle_legajoexpediente ' +
            ' WHERE le_idexpediente = :IdExped ' +
              ' AND le_fechabaja IS NULL ';
    bNuevo := not ExisteSqlEx(sSql, [IdExpediente]);

    with TqrLegajoSiniestro.Create(Self) do
    try
      Preparar(IdExpediente, edSiniestro.Siniestro, bNuevo, fraTrabajadorSIN.CUIL, fraTrabajadorSIN.Nombre);
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpAcuerdoBeforeShow(Sender: TObject);
begin
  if (Accion = Edicion) then
  begin
    edDescripcionHecho.Lines.Text := sdqConsulta.FieldByName('ev_descripcionhecho').AsString;
    edLesiones.Lines.Text         := sdqConsulta.FieldByName('ev_lesionesprovocadas').AsString;
    edSecuelas.Lines.Text         := sdqConsulta.FieldByName('ev_secuelas').AsString;
    edPreexistencias.Text         := sdqConsulta.FieldByName('ev_preexistencias').AsString;
    cmbDificultad.ItemIndex       := sdqConsulta.FieldByName('ev_dificultadtareas').AsInteger;
  end
  else begin
    edDescripcionHecho.Lines.Text := ValorSqlEx('SELECT de_descripcion ' +
                                                 ' FROM sin.sde_denuncia ' +
                                                ' WHERE de_idexpediente = :IdEx', [IdExpediente]);
    edLesiones.Lines.Text := edDiagnostico.Text;
    edSecuelas.Lines.Clear;
    edPreexistencias.Lines.Clear;
    cmbDificultad.ItemIndex := -1;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetDatosAcuerdo: String;
var
  sSql: String;
begin
  if ((Accion = Alta) or (Accion = Edicion)) and
     (fraEvento.sdqDatos.FieldByName('ei_acuerdo').AsString = 'S') then //los acuerdos
  begin
    if (fpAcuerdo.ShowModal = mrOk) then
      sSql := SqlString(edDescripcionHecho.Lines.Text, True, True) + ',' +
              SqlString(edLesiones.Lines.Text, True, True) + ',' +
              SqlString(edSecuelas.Lines.Text, True, True) + ',' +
              SqlString(edPreexistencias.Lines.Text, True, True) + ',' +
              SqlInt(cmbDificultad.ItemIndex);
  end
  else
    sSql := 'Null, Null, Null, Null, Null';
  Result := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarAcuClick(Sender: TObject);
begin
  Verificar(cmbDificultad.ItemIndex < 0, cmbDificultad, 'Debe seleccionar la Dificultad.');
  fpAcuerdo.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnCancelarAcuClick(Sender: TObject);
begin
  if not(MsgAsk('Si cancela la operación, no se guardarán los datos del evento, ¿confirma la cancelación?')) then
    fpAcuerdo.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.GetRelacionConApelacion(sCodEvento: string):integer;    // TK 9043
begin
  Result := 0;
  if (ValorSql('SELECT ei_chkafavorart ' +
                ' FROM SIN.SEI_EVENTOINCAPACIDAD ' +
               ' WHERE ei_codigo = ' + SqlString(sCodEvento)) = 'S') and (fpApelaciones.ShowModal = mrOk) then

     Result := sdqApelaciones.FieldByName('EV_IDEVENTO').AsInteger;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpApelacionesBeforeShow(Sender: TObject);         // TK 9043
begin
  inherited;
  sdqApelaciones.Close;
  sdqApelaciones.ParamByName('PIDEXPEDIENTE').AsInteger := IdExpediente;
  sdqApelaciones.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnAceptarApelacionesClick(Sender: TObject);        // TK 9043
begin
  Verificar(sdqApelaciones.IsEmpty, dgApelaciones, 'Debe seleccionar una Apelación.');
  fpApelaciones.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.sdqApelacionesAfterScroll(DataSet: TDataSet);
begin
  memoSeleccionado.text := DataSet.FieldByName('CODEVENTO').AsString   + ' - ' +
                           DataSet.FieldByName('EVENTO').AsString      + ' - ' +
                           DataSet.FieldByName('FECHAEVENTO').AsString + ' - ' +
                           DataSet.FieldByName('EV_HORA').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoGenerarPlanillaSiniParaReingresar(sCodEvento: string; iSiniestro, iIdExpediente:integer);  // TK 11993
var qrSiniestroParaReingresar : TqrSiniestroParaReingresar;
begin
  if (fraEvento.sdqDatos.FieldByName('EI_REPORTESINIREING').AsString = 'S') then
  begin
     // Reporte
     qrSiniestroParaReingresar := TqrSiniestroParaReingresar.Create(Self);
     with qrSiniestroParaReingresar do
     try
       if Is_SiniestroDeGobernacion(iIdExpediente) then
         qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
       else
         qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

       qrlNroSiniestro.Caption    := edSiniestro.SinOrdRec;
       qrlPedido.Caption          := 'Reingreso';     // Dato fijo segun consulte con Paula Weissmann hoy 19/01/2010
       qrlFechaEntrega.Caption    := DateToStr(dHoy); // Fecha de carga
       qrlSectorRecepcion.Caption := 'Mesa de Carga'; // Dato fijo segun consulte con Paula Weissmann hoy 19/01/2010
       print;

     finally
       Free;
     end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEnviarMail_SiniParaReingresar(IdNuevoEvento: integer);
var sLocalidadTrab, sGrupoTrab, sMotivoReingreso, sSql, sIdEjecutable, sBody: string;
begin
  if (fraEvento.sdqDatos.FieldByName('EI_REPORTESINIREING').AsString = 'S') then
  begin
    Try
      sSql := 'SELECT tj_localidad LocalidadTrab, gp_nombre GrupoTrab, ev_observaciones MotivoReingreso ' +
               ' FROM art.sev_eventosdetramite, art.sex_expedientes, ctj_trabajador, art.mgp_gtrabajo ' +
              ' WHERE ex_id = ev_idexpediente ' +
                ' AND ex_idtrabajador = tj_id ' +
                ' AND ex_gtrabajo = gp_codigo ' +
                ' AND ev_idevento = ' + SqlInt(IdNuevoEvento);

      with Getquery(sSql) do
      try
        sLocalidadTrab   := FieldByName('LOCALIDADTRAB').AsString;
        sGrupoTrab       := FieldByName('GRUPOTRAB').AsString;
        sMotivoReingreso := FieldByName('MOTIVOREINGRESO').AsString;
      finally
        free;
      end;

      sIdEjecutable := ValorSql('SELECT ej_id FROM comunes.cej_ejecutable ' +
                                 'WHERE UPPER(ej_proyecto) = ''SINIESTROS'' ' +
                                  ' AND ej_fechabaja IS NULL');

      sBody := 'El Siniestro ' + edSiniestro.SinOrdRec +
               ' debe ser reingresado.' + #13#10 +
               'Localidad del Trabajador: ' + sLocalidadTrab + #13#10 +
               'Grupo de Trabajo:         ' + sGrupoTrab + #13#10 +
               'Motivo de Reingreso:      ' + sMotivoReingreso + '.';

      EnviarMailBD(Get_DireccionesEnvioMail('AVREI'),
                    'Siniestro para Reingresar', [], sBody );
    Except
      on E: Exception do
      begin
        MsgBox('Ha ocurrido un error al intentar enviar el Mail: ' + E.Message );
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEnviarNotifPedidoDocum;        // TK 60625
var frmPedidoDocum: TfrmPedidoDocum;
begin
  if (ValorSqlEx('select ei_pedidodocumentacion from sin.sei_eventoincapacidad where ei_codigo = :cod', [fraevento.Codigo]) = 'S') and
     EsEmpresaExtraSuss(fraEmpresa.CUIT) then
  begin

    frmPedidoDocum := TfrmPedidoDocum.Create(Self);
    with frmPedidoDocum do
    try
      PrepararReporte(fraEmpresa.CUIT, fraEmpresa.NombreEmpresa, fraTrabajadorSIN.Nombre, fraTrabajadorSIN.CUIL, sdqBusquedaEX_FECHAACCIDENTE.AsDateTime, Siniestro, Orden, Recaida);

    finally
      Free;
    end;

  end;
end;

{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.EsEmpresaExtraSuss(sCuit: string): boolean;
var sSql: string;
begin
  sSql := 'SELECT em_suss FROM aem_empresa WHERE em_cuit = :cuit';
  Result := (ValorSqlEx(sSql, [sCuit]) = '2');  // '1' = suss  '2' = no suss y '3' = mixto
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEvaluar_EstudiosComplementarios(sEvConcurre: String); // TK 12229
var sSql: string;
begin
  if (sEvConcurre = 'S') then     // si es 124 o 125, se deben autocompletar Motivo, Com.Med. del evento 121 ultimo
  begin
    sSql := 'SELECT A.ev_motivo, A.ev_comision ' +
             ' FROM art.sev_eventosdetramite A ' +
            ' WHERE A.ev_siniestro = :Sini ' +
              ' AND A.ev_orden = :Orden ' +
              ' AND A.ev_codigo = ''121'' ' +  // tiene un campo en la SEI que es EI_GENERA_AUTORIZ_SAU en S, para el 121... veo que hago
              ' AND A.ev_evento = ( SELECT max(B.ev_evento) ' +
                                    ' FROM art.sev_eventosdetramite B ' +
                                   ' WHERE B.ev_siniestro = A.ev_siniestro ' +
                                     ' AND B.ev_orden = A.ev_orden ' +
                                     ' AND B.ev_codigo = A.ev_codigo) ';

    with GetQueryEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden]) do
    try
      fraMotivo.Codigo    := FieldByName('EV_MOTIVO').AsString;
      fraComMedica.Codigo := FieldByName('EV_COMISION').AsString;
    finally
      free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoEvaluar_EventosParaRespLegales(sEvRespLegales:string);  // TK 38322
var sSql: string;
begin
  if (sEvRespLegales = 'S') then     // si es 309, debe autocompletar algunos datos del ultimo 302 ingresado
  begin
    sSql := 'SELECT A.ev_motivo, A.ev_comision, A.ev_medico ' +
             ' FROM art.sev_eventosdetramite A ' +
            ' WHERE A.ev_siniestro = :Sini ' +
              ' AND A.ev_orden = :Orden ' +
              ' AND A.ev_codigo = ''302'' ' +  // hardcodeé ... porque hay muchos campos!!
              ' AND A.ev_evento = ( SELECT max(B.ev_evento) ' +
                                    ' FROM art.sev_eventosdetramite B ' +
                                   ' WHERE B.ev_siniestro = A.ev_siniestro ' +
                                     ' AND B.ev_orden = A.ev_orden ' +
                                     ' AND B.ev_codigo = A.ev_codigo) ';

    with GetQueryEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden]) do
    try
      fraMotivo.Codigo    := FieldByName('EV_MOTIVO').AsString;
      fraComMedica.Codigo := FieldByName('EV_COMISION').AsString;
      fraMedico.Codigo    := FieldByName('EV_MEDICO').AsString;
    finally
      free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbObservLegalesClick(Sender: TObject);  // TK 55299
begin
  if (not sdqConsulta.Eof) and (fpAgregarObservLegales.ShowModal = mrOk) then
  begin
    //
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.sdqConsultaAfterScroll(DataSet: TDataSet);        // TK 13005
var sCodDigitalizaDesp: String;
begin
  sCodDigitalizaDesp := ValorSqlEx('SELECT EI_DIGITALIZA_DESPUES FROM sin.sei_eventoincapacidad ' +
                                  ' WHERE ei_codigo = :sCodEvento ',
                              [sdqConsulta.FieldByName('EV_CODIGO').AsString]);
  // Uso esto (el ei_digitaliza), en vez de ver si es Dictámen, porque hay un codigo de evento (el 808) que
  // lo debe tener habilitado y no corresponde a un dictamen.

  LockControls([cmbDA_OPCION,chkDestinoPapel], not(sCodDigitalizaDesp <> ''));        // TK 37769

  DoEvaluar_AsociarArchivo;      // TK 28452

  DoEvaluar_ObservacionesLegales; // TK 55299

  if sdqConsulta.FieldByName('ei_marcarecitar').AsString = 'S' then
  begin
    tbNoRecitar.Enabled := true;
    tbNoRecitar.Down := ValorSqlEx(' select ev_recitar from art.sev_eventosdetramite where ev_siniestro = :sin and ev_orden = :ord and ev_recaida = :rec ' +
              ' and ev_evento = :ev', [Siniestro, Orden, Recaida, sdqConsulta.FieldByName('ev_evento').AsInteger]) = 'N'
  end
  else
    tbNoRecitar.Enabled := false;

  if (sdqConsulta.FieldByName('ei_marcarfechaexped').AsString = 'S') and
     (sdqConsulta.FieldByName('EV_FECHAENTREGAEXPED').AsString = '') then
    mnuEntregaExpediente.Enabled := true
  else
    mnuEntregaExpediente.Enabled := false;

  tbReenviarPedidoTurnoSRT.Enabled := Seguridad.Activar(tbReenviarPedidoTurnoSRT) and (sdqConsulta.FieldByName('EI_CODIGO').AsString = CODEVENTO_SOLTURNOSRT);  // plan Turnos Medicos

end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.tbDigitalizarClick(Sender: TObject);       // TK 37769
begin
  if (fpDigitalizarDespues.ShowModal = mrOk) then          // TK 13005
    if chkCodigoDigitalizacion.Checked then
      Do_DigitalizarDelMenu(fraCodDigitalizacion.Codigo, fraCodDigitalizacion.Descripcion)
    else
      Do_DigitalizarStandard;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.btnDigDicAceptarClick(Sender: TObject);
begin
  Verificar((chkCodigoDigitalizacion.Checked and fraCodDigitalizacion.IsEmpty), fraCodDigitalizacion, 'Debe seleccionar el Código Digitalizacion');
  Verificar((chkDestinoPapel.Checked) and (Trim(cmbDA_OPCION.Text) = ''), cmbDA_OPCION, 'Debe seleccionar el Tipo de Destino de Papel');
  Verificar((chkDestinoPapel.Checked) and (cmbDA_OPCION.ItemIndex = -1), cmbDA_OPCION, 'La opción seleccionada es inválida');
  Verificar(Trim(edDA_HOJAS.Text) = '', edDA_HOJAS, 'Debe seleccionar la cantidad de hojas');
  Verificar((StrToInt(edDA_HOJAS.Text) <= 0), edDA_HOJAS, 'Debe seleccionarse una cantidad de hojas mayor a cero');
  fpDigitalizarDespues.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpDigitalizarDespuesBeforeShow(Sender: TObject);
begin
  if chkDestinoPapel.Enabled then   //  TK 37769: esto lo hago para que sea mas rapido para los usuarios digitalizar!!
  begin
    chkDestinoPapel.Checked := True;
    cmbDA_OPCION.ItemIndex  := 0;
  end
  else begin
    cmbDA_OPCION.ItemIndex := -1;
    cmbDA_OPCION.Text      := '';
    chkCodigoDigitalizacion.Checked := True;
  end;

  edDA_HOJAS.Clear;
  fraCodDigitalizacion.Clear;
  LockControl(cmbDA_OPCION, chkCodigoDigitalizacion.Checked);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.fpDigitalizarDespuesShow(Sender: TObject);
begin
  if chkDestinoPapel.Enabled then
    edDA_HOJAS.SetFocus
  else
    fraCodDigitalizacion.cmbDescripcion.SetFocus;

end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.Do_LimpiarLegajo_items;
begin
  chkLE_HISTORIACLINICA.Checked   := False;
  chkLE_PMI.Checked               := False;
  chkLE_DENUNCIA.Checked          := False;
  chkLE_ACUSERECIBO.Checked       := False;
  chkLE_FOTOCOPIADNI.Checked      := False;
  chkLE_PME.Checked               := False;
  chkLE_ACUERDO.Checked           := False;
  chkLE_TRATAMEDICO.Checked       := False;
  chkLE_REHABILITACION.Checked    := False;
  chkLE_TRATAPSICOLOGICO.Checked  := False;
  chkLE_TRATAQUIRURGICO.Checked   := False;
  chkLE_OTROSTRATAMIENTOS.Checked := False;
  chkLE_INTERCONSULTA.Checked     := False;
  chkLE_PSICODIAGNOSTICO.Checked  := False;
  chkLE_RADIOGRAFIAS.Checked      := False;
  chkLE_ECOGRAFIAS.Checked        := False;
  chkLE_TAC.Checked               := False;
  chkLE_RMN.Checked               := False;
  chkLE_EMG.Checked               := False;
  chkLE_ESTAUDIOLOGICOS.Checked   := False;
  chkLE_ESTOFTALMOLOGICOS.Checked := False;
  chkLE_ESTNEUMONOLOGICOS.Checked := False;
  chkLE_RECALIFICACION.Checked    := False;
  chkLE_LABORATORIO.Checked       := False;
  chkLE_ESTCOMPLEMENTARIOS.Checked:= False;
  chkLE_OTROSESTUDIOS.Checked     := False;
  chkLE_PROTOQUIRURGICO.Checked   := False;
  edLE_OTROSTRATAMIENTOS.Text     := '';
  edLE_OTROSESTUDIOS.Text         := '';
end;

{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.mnuImprimirListaDocDigClick(Sender: TObject);   // TK 16032
begin

end;
{-------------------------------------------------------------------------------}
function TfrmSegIncapacidades.EsPrimeraVez_Legajo(sIdExpediente: Integer): boolean;   // TK 16032
var sSql:String;
begin
  sSql := 'Select 1 From sin.sle_legajoexpediente ' +
          ' where le_idexpediente = :idexp ';
  Result := not ExisteSqlEx(sSql, [sIdExpediente]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.Do_VisualizarDocDigitalizados(iIdExpediente: Integer);  // TK 16032
var
  sSql: string;
  qryDocumentos: TSDQuery;
begin
  lblTitulo.Caption := 'Documentos Digitalizados (Valores sugeridos según datos del sistema)';
  if HaySiniestroActivo then
  begin
    sSql := 'SELECT DISTINCT TD_CODIGO CODIGO_DOCUMENTO ' +
              'FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO, ARCHIVO.RAR_ARCHIVO, ARCHIVO.RTD_TIPODOCUMENTO, ' +
                   'ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
             'WHERE RA_FECHABAJA IS NULL ' +
               'AND RA_IDTIPODOCUMENTO = TD_ID ' +
               'AND RA_IDARCHIVO = AR_ID ' +
               'AND AR_CLAVE = :Clave ' +
               'AND AU_IDTIPOARCHIVO = AR_TIPO ' +
               'AND AU_USUARIO = :Usuario ' +
               'AND AR_TIPO IN (:Tipo1, :Tipo2, :Tipo3, :Tipo4) ' +
               'AND AU_FECHABAJA IS NULL ' +
               'AND ROWNUM <= 1000';

    Do_LimpiarLegajo_items;
    qryDocumentos := GetQueryEx(sSql, [GetClaveArmada(2, IntToStr(Siniestro), IntToStr(Orden), '', ''), Sesion.UserId,
                                       ID_CARPETA_SINIESTRO, ID_CARPETA_INCAPACID, ID_CARPETA_PRESTDIN, ID_CARPETA_CD_SIN]);
    with qryDocumentos do
      try
        while not eof do
        begin
          chkLE_ACUERDO.Checked           := chkLE_ACUERDO.Checked            or (FieldByName('CODIGO_DOCUMENTO').AsString = 'ACU');
          chkLE_ACUSERECIBO.Checked       := chkLE_ACUSERECIBO.Checked        or (FieldByName('CODIGO_DOCUMENTO').AsString = 'P49');
          chkLE_PME.Checked               := chkLE_PME.Checked                or (FieldByName('CODIGO_DOCUMENTO').AsString = 'PME');
          chkLE_DENUNCIA.Checked          := chkLE_DENUNCIA.checked           or (FieldByName('CODIGO_DOCUMENTO').AsString = 'DEN');
          chkLE_ECOGRAFIAS.Checked        := chkLE_ECOGRAFIAS.Checked         or (FieldByName('CODIGO_DOCUMENTO').AsString = 'ECO');
          chkLE_EMG.Checked               := chkLE_EMG.Checked                or (FieldByName('CODIGO_DOCUMENTO').AsString = 'EMG');
          chkLE_ESTAUDIOLOGICOS.Checked   := chkLE_ESTAUDIOLOGICOS.Checked    or (FieldByName('CODIGO_DOCUMENTO').AsString = 'AUDIO');
          chkLE_ESTNEUMONOLOGICOS.Checked := chkLE_ESTNEUMONOLOGICOS.Checked  or (FieldByName('CODIGO_DOCUMENTO').AsString = 'ESPIRO');
          chkLE_ESTOFTALMOLOGICOS.Checked := chkLE_ESTOFTALMOLOGICOS.Checked  or (FieldByName('CODIGO_DOCUMENTO').AsString = 'INF');
          chkLE_FOTOCOPIADNI.Checked      := chkLE_FOTOCOPIADNI.Checked       or (FieldByName('CODIGO_DOCUMENTO').AsString = 'P31');
          chkLE_INTERCONSULTA.Checked     := chkLE_INTERCONSULTA.Checked      or (FieldByName('CODIGO_DOCUMENTO').AsString = 'INF');
          chkLE_LABORATORIO.Checked       := chkLE_LABORATORIO.Checked        or (FieldByName('CODIGO_DOCUMENTO').AsString = 'LAB');
          chkLE_PMI.Checked               := chkLE_PMI.Checked                or (FieldByName('CODIGO_DOCUMENTO').AsString = 'PMI');
          chkLE_PROTOQUIRURGICO.Checked   := chkLE_PROTOQUIRURGICO.Checked    or (FieldByName('CODIGO_DOCUMENTO').AsString = 'PRQ');
          chkLE_PSICODIAGNOSTICO.Checked  := chkLE_PSICODIAGNOSTICO.Checked   or (FieldByName('CODIGO_DOCUMENTO').AsString = 'INF');
          chkLE_RADIOGRAFIAS.Checked      := chkLE_RADIOGRAFIAS.Checked       or (FieldByName('CODIGO_DOCUMENTO').AsString = 'PLA');
          chkLE_RECALIFICACION.Checked    := chkLE_RECALIFICACION.Checked     or (FieldByName('CODIGO_DOCUMENTO').AsString = 'CAR') or (FieldByName('CODIGO_DOCUMENTO').AsString = 'RINF');
          chkLE_REHABILITACION.Checked    := chkLE_REHABILITACION.Checked     or (FieldByName('CODIGO_DOCUMENTO').AsString = 'RDR');
          chkLE_RMN.Checked               := chkLE_RMN.Checked                or (FieldByName('CODIGO_DOCUMENTO').AsString = 'RMN');
          chkLE_TAC.Checked               := chkLE_TAC.Checked                or (FieldByName('CODIGO_DOCUMENTO').AsString = 'TAC');
          chkLE_TRATAMEDICO.Checked       := chkLE_TRATAMEDICO.Checked        or (FieldByName('CODIGO_DOCUMENTO').AsString = 'PEV');
          chkLE_TRATAPSICOLOGICO.Checked  := chkLE_TRATAPSICOLOGICO.Checked   or (FieldByName('CODIGO_DOCUMENTO').AsString = 'INF');
          chkLE_TRATAQUIRURGICO.Checked   := chkLE_TRATAQUIRURGICO.Checked    or (FieldByName('CODIGO_DOCUMENTO').AsString = 'PRQ');
          chkLE_HISTORIACLINICA.Checked   := chkLE_HISTORIACLINICA.Checked    or (FieldByName('CODIGO_DOCUMENTO').AsString = 'VAR');
        //  chkLE_ESTCOMPLEMENTARIOS.Checked   := chkLE_ESTCOMPLEMENTARIOS.Checked   or (FieldByName('CODIGO_DOCUMENTO').AsString = '');  no hay codigo!! que hago?
          Next;
        end;
      finally
        free;
      end;
    fpLegajo.ShowModal;
  end;

end;
{-------------------------------------------------------------------------------}
procedure TfrmSegIncapacidades.DoGuardarDatosLegajo;
var sIdLegajo: string;
    iIdLegajo: integer;
begin
  sIdLegajo := ValorSqlEx('Select nvl(le_id,''0'') From sin.sle_legajoexpediente ' +
                          ' Where le_idexpediente = :idexp', [IdExpediente]);
  iIdLegajo := StrToInt(IIF(sIdLegajo = '', '0', sIdLegajo));

  with TSql.Create('sin.sle_legajoexpediente') do
    try
    if (iIdLegajo > 0) then
    begin
      PrimaryKey.Add('le_id',             iIdLegajo);
      Fields.Add('le_usumodif',           Sesion.UserId);
      Fields.Add('le_fechamodif',         SQL_DATETIME, False);
      SqlType := stUpdate;
    end
    else begin
      PrimaryKey.Add('le_id',             GetSecNextVal('sin.seq_sle_id'));
      Fields.Add('le_usualta',            Sesion.UserId);
      Fields.Add('le_fechaalta',          SQL_DATETIME, False);
      SqlType := stInsert;
    end;

    Fields.Add('le_idexpediente',         IdExpediente);
    Fields.Add('le_historiaclinica',      String(IIF(chkLE_HISTORIACLINICA.Checked, 'S', 'N')));
    Fields.Add('le_pmi',                  String(IIF(chkLE_PMI.Checked, 'S', 'N')));
    Fields.Add('le_denuncia',             String(IIF(chkLE_DENUNCIA.Checked, 'S', 'N')));
    Fields.Add('le_acuserecibo',          String(IIF(chkLE_ACUSERECIBO.Checked, 'S', 'N')));
    Fields.Add('le_fotocopiadni',         String(IIF(chkLE_FOTOCOPIADNI.Checked, 'S', 'N')));
    Fields.Add('le_pme',                  String(IIF(chkLE_PME.Checked, 'S', 'N')));
    Fields.Add('le_acuerdo',              String(IIF(chkLE_ACUERDO.Checked, 'S', 'N')));
    Fields.Add('le_tratamedico',          String(IIF(chkLE_TRATAMEDICO.Checked, 'S', 'N')));
    Fields.Add('le_rehabilitacion',       String(IIF(chkLE_REHABILITACION.Checked, 'S', 'N')));
    Fields.Add('le_tratapsicologico',     String(IIF(chkLE_TRATAPSICOLOGICO.Checked, 'S', 'N')));
    Fields.Add('le_trataquirurgico',      String(IIF(chkLE_TRATAQUIRURGICO.Checked, 'S', 'N')));
   // Fields.Add('le_recalaboral',          String(IIF(chkLE_RECALABORAL.Checked, 'S', 'N')));
    Fields.Add('le_otrostratamientos',    edLE_OTROSTRATAMIENTOS.Lines.Text);
    Fields.Add('le_protoquirurgico',      String(IIF(chkLE_PROTOQUIRURGICO.Checked, 'S', 'N')));
    Fields.Add('le_interconsulta',        String(IIF(chkLE_INTERCONSULTA.Checked, 'S', 'N')));
    Fields.Add('le_psicodiagnostico',     String(IIF(chkLE_PSICODIAGNOSTICO.Checked, 'S', 'N')));
    Fields.Add('le_radiografias',         String(IIF(chkLE_RADIOGRAFIAS.Checked, 'S', 'N')));
    Fields.Add('le_ecografias',           String(IIF(chkLE_ECOGRAFIAS.Checked, 'S', 'N')));
    Fields.Add('le_tac',                  String(IIF(chkLE_TAC.Checked, 'S', 'N')));
    Fields.Add('le_rmn',                  String(IIF(chkLE_RMN.Checked, 'S', 'N')));
    Fields.Add('le_emg',                  String(IIF(chkLE_EMG.Checked, 'S', 'N')));
    Fields.Add('le_estaudiologicos',      String(IIF(chkLE_ESTAUDIOLOGICOS.Checked, 'S', 'N')));
    Fields.Add('le_estoftalmologicos',    String(IIF(chkLE_ESTOFTALMOLOGICOS.Checked, 'S', 'N')));
    Fields.Add('le_estneumonologicos',    String(IIF(chkLE_ESTNEUMONOLOGICOS.Checked, 'S', 'N')));
    Fields.Add('le_recalificacion',       String(IIF(chkLE_RECALIFICACION.Checked, 'S', 'N')));
    Fields.Add('le_laboratorio',          String(IIF(chkLE_LABORATORIO.Checked, 'S', 'N')));
    Fields.Add('le_estcomplementarios',   String(IIF(chkLE_ESTCOMPLEMENTARIOS.Checked, 'S', 'N')));
    Fields.Add('le_otrosestudios',        edLE_OTROSESTUDIOS.Lines.Text);

    EjecutarSql(Sql);
    finally
     Free;
    end;
  MsgBox('Datos del legajo guardados correctamente.', MB_ICONINFORMATION);
end;

procedure TfrmSegIncapacidades.DoEvaluar_RevisionMedica;  // TK 15065
var sSql: string;
    SqlResults: TStringList;
    bHayEvCitacionAnterior: boolean;
begin
  sSql := 'SELECT EI_FECUBICMED_REV ' +
           ' FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :codEv ';



  if (ValorSqlEx(sSql, [fraEvento.Codigo]) = 'S') then
  begin
    bHayEvCitacionAnterior := ExisteSqlEx('SELECT 1 ' +                  // TK 19844
                                           ' FROM art.sev_eventosdetramite, sin.sei_eventoincapacidad ' +
                                          ' WHERE ei_codigo = ev_codigo ' +
                                            ' AND ev_siniestro = :sini ' +
                                            ' AND ev_orden = :orden ' +
                                            ' AND ev_recaida = :reca ' +
                                            ' AND ei_citjunrevmed = ''S'' ',
                                          [SqlInt(edSiniestro.Siniestro),
                                           SqlInt(edSiniestro.Orden),
                                           SqlInt(edSiniestro.Recaida)]);
    Verificar(not bHayEvCitacionAnterior, fraEvento.edCodigo, 'Advertencia: No se registra Citación a Revisión Médica anterior');

    sSql := 'SELECT A.ev_fecha, A.ev_codubic, A.ev_medico ' +
             ' FROM art.sev_eventosdetramite A, sin.sei_eventoincapacidad B ' +
            ' WHERE B.ei_codigo = A.ev_codigo ' +
              ' AND A.ev_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
              ' AND A.ev_orden = ' + SqlInt(edSiniestro.Orden) +
              ' AND A.ev_recaida = 0 ' +
              ' AND B.ei_citjunrevmed = ''S'' ' +
              ' AND A.ev_evento = ( SELECT max(C.ev_evento) ' +
                                    ' FROM art.sev_eventosdetramite C, sin.sei_eventoincapacidad D ' +
                                   ' WHERE D.ei_codigo = C.ev_codigo ' +
                                     ' AND C.ev_siniestro = A.ev_siniestro ' +
                                     ' AND C.ev_orden = A.ev_orden ' +
                                     ' AND C.ev_recaida = 0 ' +
                                     ' AND D.ei_citjunrevmed = ''S'') ';
    SqlResults := ValoresColSql(sSql);
    Try
      dcFecha.Date        := StrToDate(SqlResults[0]);
      fraUbicIncap.Codigo := SqlResults[1];
      fraMedico.Codigo    := SqlResults[2];
    finally
      SqlResults.Free;
    end;
  end;
end;

procedure TfrmSegIncapacidades.DoEvaluar_EventosCitacionVarios(sFecEvAnt, sCargaFechaEvHoy, sFecEventoHoy: string);
var sSqlCit: string;
begin
   if ((sFecEvAnt <> '') and (sFecEvAnt = 'S'))
     or (sFecEventoHoy = 'S') then   // si tiene la marca, entonces se busca la fecha de citacion del evento de citacion anterior.
   begin
     sSqlCit := ' SELECT A.ev_fecha, A.ev_motivo, A.ev_comision ' +               // TK 12230
                  ' FROM sev_eventosdetramite A, sin.sei_eventoincapacidad B ' +
                 ' WHERE B.ei_codigo = A.ev_codigo ' +
                   ' AND A.ev_siniestro = :Siniestro ' +
                   ' AND A.ev_orden = :Orden ' +
                   ' AND A.ev_recaida = 0 ' +
                   ' AND B.ei_evcitacion = ''S'' ' +
                   ' AND A.ev_fecha = ( SELECT max(C.ev_fecha) ' +
                                        ' FROM sev_eventosdetramite C, sin.sei_eventoincapacidad D ' +
                                       ' WHERE D.ei_codigo = C.ev_codigo ' +
                                         ' AND C.ev_siniestro = A.ev_siniestro ' +
                                         ' AND C.ev_orden = A.ev_orden ' +
                                         ' AND C.ev_recaida = 0 ' +
                                         ' AND D.ei_evcitacion = ''S'') ';

     with GetQueryEx(sSqlCit, [edSiniestro.Siniestro, edSiniestro.Orden]) do
     begin
       if (sFecEventoHoy = 'S') then   // Si es el 302 pone la fecha de hoy en la fecha de evento: TK 13003
         dcFecha.Date := dHoy
       else
         dcFecha.Date := FieldByName('EV_FECHA').AsDateTime;

       if (ValorSqlEx('SELECT EI_MOTYCOMMED_CIT FROM sin.sei_eventoincapacidad ' +
                      ' WHERE ei_codigo = :CodEvento', [fraEvento.Codigo]) = 'S') then
       begin
         fraMotivo.Codigo    := FieldByName('EV_MOTIVO').AsString;
         fraComMedica.Codigo := FieldByName('EV_COMISION').AsString;
       end;
     end;
   end;
   if (sCargaFechaEvHoy <> '') and (sCargaFechaEvHoy = 'S') then    // Lu WF 7963
     dcFecha.Date := Date;
end;

procedure TfrmSegIncapacidades.DoEvaluar_EventosCitacionTandil(sFecMotCommed_citTandil: string);  // TK 17866
var sSql: string;
begin
  if (sFecMotCommed_citTandil = 'S') then
  begin
    sSql := ' SELECT A.ev_fecha, A.ev_motivo, A.ev_comision ' +
                  ' FROM sev_eventosdetramite A, sin.sei_eventoincapacidad B ' +
                 ' WHERE B.ei_codigo = A.ev_codigo ' +
                   ' AND A.ev_siniestro = :Siniestro ' +
                   ' AND A.ev_orden = :Orden ' +
                   ' AND A.ev_recaida = 0 ' +
                   ' AND B.ei_evcitaciontandil = ''S'' ' +
                   ' AND A.ev_evento = ( SELECT max(C.ev_evento) ' +
                                         ' FROM sev_eventosdetramite C, sin.sei_eventoincapacidad D ' +
                                        ' WHERE D.ei_codigo = C.ev_codigo ' +
                                          ' AND C.ev_siniestro = A.ev_siniestro ' +
                                          ' AND C.ev_orden = A.ev_orden ' +
                                          ' AND C.ev_recaida = 0 ' +
                                          ' AND D.ei_evcitaciontandil = ''S'') ';
    with GetQueryEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden]) do
    begin
      dcFecha.Date        := FieldByName('EV_FECHA').AsDateTime;
      fraMotivo.Codigo    := FieldByName('EV_MOTIVO').AsString;
      fraComMedica.Codigo := FieldByName('EV_COMISION').AsString;
    end;
  end;
end;

function TfrmSegIncapacidades.ValidarCitacionAfonia_y_DerInlex: Boolean;   // TK 17012 y 17063
var sSql, sSqlSin, sSiniestroYaCitado, sCitaRevMed, sExpedDerInlex, sLeyenda : string;
begin
  sCitaRevMed    := ValorSqlEx('SELECT ei_citarevmed FROM sin.sei_eventoincapacidad ' +     // Si es evento de citacion (100)
                               ' WHERE ei_codigo = :codEv', [fraEvento.edCodigo.Text]);
  sExpedDerInlex := ValorSqlEx('SELECT ei_expedDerInlex FROM sin.sei_eventoincapacidad' +   // TK 24496: si es evento de Derivacion Inlex (074, 075, 076 y 078)
                               ' WHERE ei_codigo = :codEv', [fraEvento.edCodigo.Text]);

  if (sCitaRevMed = 'S') or (sExpedDerInlex = 'S') then
  begin
    sSql := 'SELECT A.ex_siniestro, A.ex_orden, A.ex_recaida, A.ex_id, A.ex_cuil ' +
             ' FROM art.sex_expedientes A, art.cdg_diagnostico C ' +
            ' WHERE A.ex_tipo = ''3'' ' +           // enfermedad profesional
              ' AND A.ex_iddiagnostico = C.dg_id  ' +   // cie 10 'J38'
              ' AND C.dg_afoniacobincap = ''S'' ' +
              ' AND ex_id = :idexped ' +
              ' AND NVL(ex_causafin, '' '') NOT IN (''99'', ''95'', ''02'') ' +
              ' AND EXISTS ( SELECT B.ex_siniestro ' +
                             ' FROM art.sex_expedientes B, art.cdg_diagnostico D ' +
                            ' WHERE B.ex_cuil = A.ex_cuil ' +             // mismo trabajador
                              ' AND B.ex_siniestro <> A.ex_siniestro ' +  // distinto siniestro (por nro de siniestro, no valen las recaidas)
                              ' AND B.ex_iddiagnostico = D.dg_id ' +
                              ' AND D.dg_afoniacobincap = ''S'' ' +
                              ' AND B.ex_tipo = ''3'' ' +
                              ' AND NVL(b.ex_causafin, '' '') NOT IN (''99'', ''95'', ''02'') ' +
                              ' AND EXISTS ( SELECT 1 ' +
                                             ' FROM art.sev_eventosdetramite, sin.sei_eventoincapacidad ' +
                                            ' WHERE ev_codigo = ei_codigo ' +
                                              ' AND ev_idexpediente = B.ex_id ' +
                                              ' AND ei_tipoevento IN (1,6,7) ' +       // que sea dictamen
                                              ' AND ev_porcincapacidad IS NOT NULL ' + // con % incapacidad > 0
                                              ' AND ev_evento > 0 ' +
                                              ' AND ev_porcincapacidad > 0 ) ) ';
    with GetQueryEx(sSql, [IdExpediente]) do
      try
        if not Eof  then
        begin
          Result := False;
           // hay que obtener el ultimo siniestro del trabajador que tenga J38 y una incapacidad ya cobrada, para que salga en el cartel (así se pide)
          sSqlSin := ' SELECT art.utilEs.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) SINIESTRO ' +
                       ' FROM art.sex_expedientes, art.cdg_diagnostico ' +
                      ' WHERE ex_cuil = :cuil ' +
                        ' AND ex_siniestro <> :sini' +
                        ' AND ex_iddiagnostico = dg_id ' +
                        ' AND dg_afoniacobincap = ''S'' ' +
                        ' AND ex_tipo = ''3'' ' +
                        ' AND NVL(ex_causafin, '' '') NOT IN (''99'', ''95'', ''02'') ' +
                        ' AND exists (SELECT 1 ' +
                                      ' FROM art.sev_eventosdetramite A, sin.sei_eventoincapacidad B ' +
                                     ' WHERE A.ev_idexpediente = ex_id ' +
                                       ' AND A.ev_codigo = B.ei_codigo ' +
                                       ' AND B.ei_tipoevento IN (1,6,7) ' +
                                       ' AND A.ev_porcincapacidad IS NOT NULL ' +
                                       ' AND A.ev_porcincapacidad > 0 ' +
                                       ' AND A.ev_evento > 0 ) ' +
                      ' ORDER BY ex_fechaaccidente DESC ';
           sSiniestroYaCitado := ValorSqlEx(sSqlSin, [FieldByName('EX_CUIL').AsString,
                                                      FieldByName('EX_SINIESTRO').AsString]);


           if (sCitaRevMed = 'S') then
             sLeyenda := 'No debe citar al Trabajador debido a que ya fue citado con el siniestro '
           else
             sLeyenda := 'No se puede derivar debido a que el Trabajador ya fue citado con el siniestro ';

           if Seguridad.Claves.IsActive('Derivar_IncapPagada') then   // TK 63020
           begin
             if not MsgAsk(sLeyenda + sSiniestroYaCitado + '. Y por el mismo ha cobrado la incapacidad. Desea Continuar?') then
               Exit;
           end
           else begin
             InfoHint(btnGuardar, sLeyenda + sSiniestroYaCitado + '. Y por el mismo ha cobrado la incapacidad.');
             Exit;
           end;

        end;
      finally
        free;
      end;
  end;
  Result := true;
end;


procedure TfrmSegIncapacidades.btnSiniMasDatosClick(Sender: TObject);     // TK 17565
var
  frmDatosSiniestro: TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  try
    frmDatosSiniestro.ShowDialog(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;

procedure TfrmSegIncapacidades.DoGenerarNotaDesestimoApelacion(iSiniestro, iOrden, iRecaida, iIdExped: Integer; sComision: String);   // TK 17681
var sLugarYFecha, sTitulo, sSubtitulo, sPresente, sTrabajador, sExpedIncap,
    sCuerpo, sFechaEv550, sSql, sFirmante, sSinOrdRec, sFirmDepto: String;
    qrNotaDesestApel: TqrNotaBase;
begin
  if (ValorSqlEx('SELECT ei_notaDesestApel FROM sin.sei_eventoincapacidad ' +       // Si es evento de Anulación/Rechazo Apelación CMC (554)
                 ' WHERE ei_codigo = :codEv', [fraEvento.edCodigo.Text]) = 'S') then
  begin
    sLugarYFecha := LugarImpresion + ', ' + DateFormat(Date, 'd ''de'' MMMM ''de'' yyyy');
    sTitulo      := 'Desestimo de Apelación';
    sSubtitulo   := sComision;
    sPresente    := 'Presente.';
    sTrabajador  := fraTrabajadorSIN.cmbNombre.Text;
    sExpedIncap  := edExpedIncap.Text;
    sSinOrdRec   := IntToStr(iSiniestro) + '/' + IntToStr(iOrden) + '/' + IntToStr(iRecaida);

    sSql := 'Select ev_fecha ' +
             ' From art.sev_eventosdetramite A, sin.sei_eventoincapacidad C ' +
            ' Where C.ei_codigo = A.ev_codigo ' +
              ' and A.ev_idexpediente = :idexped ' +
              ' and A.ev_evento > 0 ' +
              ' and C.ei_evApelDict = ''S'' ' +   // evento 550
              ' and A.ev_evento = (Select max(B.ev_evento) ' +
                                   ' From art.sev_eventosdetramite B, sin.sei_eventoincapacidad D ' +
                                  ' Where D.ei_codigo = B.ev_codigo ' +
                                    ' and B.ev_idexpediente = A.ev_idexpediente ' +
                                    ' and B.ev_evento > 0 ' +
                                    ' and D.ei_evApelDict = ''S'') ';

    sFechaEv550 := ValorSqlEx(sSql, [iIdExped]);
    sCuerpo     := 'De nuestra Consideración: ' + #10#13 + #10#13 +
                   'Esta aseguradora ha decidido desestimar la Apelación interpuesta el ' + sFechaEv550 +
                   ' del trabajador de referencia.';
    sFirmante   := 'Dr. Isaac Fixel';
    sFirmDepto  := 'Departamento de Incapacidades';

    qrNotaDesestApel := TqrNotaBase.Create(Self);
    with qrNotaDesestApel do
    try
      if (sFechaEv550 = '') then
        showmessage('Atención: Este siniestro no posee evento 550, por lo cual, la siguiente Nota saldrá sin fecha de Apelación.');

      ImprimirNotaBase(iSiniestro, iOrden, iRecaida, sCuerpo, sLugarYFecha, sTitulo, sSubtitulo,
                       sTrabajador, sExpedIncap, sSinOrdRec, sFirmante, sFirmDepto, 2);
    finally
      Free;
    end;

  end;
end;

procedure TfrmSegIncapacidades.mnuFecTopeLiqClick(Sender: TObject);   // Lu 04/11 (pedido)
var
  iIdEv: integer;
begin
  if HaySiniestroActivo then
  begin
    iIdEv := sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger;
    if Validar_HabilitarFecTopeLiquid(iIdEv) then
    begin
      DoCargarFechaTopeLiqYBloquear(iIdEv);  // carga la fecha y si existe la misma, la bloquea para que no se modifique
      if (fpFechaTopeLiquid.ShowModal = MrOk) then  // y aca no deberia entrar si estoy en modo Ver, ya que deshabilito el boton Aceptar.
        EjecutarSql('UPDATE art.sev_eventosdetramite ' +
                      ' SET ev_fechatopeliq = ' + SqlDate(dcFecTopeLiq.Date) +
                    ' WHERE ev_idevento = ' + SqlInt(iIdEv));
    end;
  end;
end;

procedure TfrmSegIncapacidades.mnuFecLiqDinClick(Sender: TObject);  // Lu 04/06/2010 (pedido)
begin
  if (fpFecLiqDin.ShowModal = mrOk) then
  begin
     //
  end;

end;

procedure TfrmSegIncapacidades.mnuEntregaExpedienteClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' UPDATE ART.SEV_EVENTOSDETRAMITE ' +
             ' SET ev_fechaentregaexped = trunc(sysdate) ' +
           ' WHERE ev_idevento = :idev ';
  EjecutarSQLEx(sSql, [sdqConsulta.Fieldbyname('EV_IDEVENTO').AsString]);

end;


procedure TfrmSegIncapacidades.Do_HabilitacionFecLiqDin;      // Lu 04/06/2010 (pedido)
var iTipoEv: integer;
begin
  iTipoEv              := sdqConsulta.FieldByName('EI_TIPOEVENTO').AsInteger;
  mnuFecLiqDin.Enabled := (iTipoEv in [1,6,7]);
end;

procedure TfrmSegIncapacidades.mnuInsertarFechasPopup(Sender: TObject);    // Lu 04/06/2010 (pedido)
begin
  Do_HabilitacionFecLiqDin;
end;

procedure TfrmSegIncapacidades.btnAceptarFecLiqDinClick(Sender: TObject);   // Lu 04/06/2010 (pedido)
var sSql: string;
begin
  if Validar_FecLiqDin then
  begin
    fpFecLiqDin.ModalResult := mrOk;

    sSql := 'UPDATE ART.SEV_EVENTOSDETRAMITE ' +
              ' SET EV_FECLIQDIN = ' + dcFecLiqDin.SqlText +
            ' WHERE EV_IDEVENTO = ' + sdqConsulta.Fieldbyname('EV_IDEVENTO').AsString;
    EjecutarSQL(sSql);
  end;
end;

function TfrmSegIncapacidades.Validar_FecLiqDin: Boolean;  // Lu 04/06/2010 (pedido)
begin
  Verificar(dcFecLiqDin.IsEmpty, dcFecLiqDin, 'Debe ingresar una Fecha');
  Verificar(dcFecLiqDin.Date > Date, dcFecLiqDin, 'La Fecha debe ser menor o igual a la actual');
  Result := True;
end;

procedure TfrmSegIncapacidades.fpFecLiqDinBeforeShow(Sender: TObject);    // Lu 04/06/2010 (pedido)
begin
  dcFecLiqDin.Clear;
end;

procedure TfrmSegIncapacidades.DoGenerarPlanillaSiniRecalif(iSiniestro, iIdExpediente: Integer);   // TK 18591
var
  qrSiniRecalif :TqrSiniestroParaRecalificar;
begin
  if (fraEvento.sdqDatos.FieldByName('EI_PLANILLASINIRECALIF').AsString = 'S') then
  begin
    qrSiniRecalif := TqrSiniestroParaRecalificar.Create(Self);
    with qrSiniRecalif do
    try
      if Is_SiniestroDeGobernacion(iIdExpediente) then
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
      else
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

      qrlFecha.Caption          := DateToStr(dHoy);  // fecha de carga del evento
      qrlHoy.Caption            := DateToStr(dHoy);
      qrlSiniestro.Caption      := sdqConsulta.FieldByName('SINIESTRO').AsString;
      qrlUsuario.Caption        := ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                              ' WHERE se_usuario = :Usu', [Sesion.UserID]);
      print;
    finally
      Free;
    end;
  end;
end;

procedure TfrmSegIncapacidades.cmbTrabDocAsocDropDown(Sender: TObject);
var sSql: string;
begin
  if (Length(Trim(cmbTrabDocAsoc.Text)) > 0) then
  begin
    cmbTrabDocAsoc.DataSource := dsPapeleria;
    sSql := sdqPapeleria.Sql.Text + ' AND ID_NOMBRE LIKE ''' + Trim(cmbTrabDocAsoc.Text) + '%''';
    OpenQuery(sdqPapeleria, sSql, True);
  end;
end;

procedure TfrmSegIncapacidades.Do_actualizarFechasAltaMedica(dateFechaDictamen: TDateTime);   // TK 19711
var sSql, sSqlUpdate: String;
    iDiasBajasTotales: integer;
begin
  sSql := 'SELECT ex_altamedica, ex_id, ex_bajamedica, ex_fechaaccidente, pe_fechaaltamedica, pe_fechabajamedica ' +
           ' FROM art.sex_expedientes, sin.spe_partedeegreso ' +
          ' WHERE ex_siniestro = :psiniestro ' +
            ' AND ex_orden = :porden ' +
            ' AND ex_recaida = :precaida ' +
            ' AND ex_id = pe_idexpediente ';

  with GetQueryEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden, 0]) do
  try
    if not FieldByName('EX_ALTAMEDICA').IsNull then       // Actualizo ex_altamedica
    begin
      sSqlUpdate := 'UPDATE art.sex_expedientes ' +
                      ' SET ex_altamedica = ' + SqlDate(dateFechaDictamen) +
                      iif(fieldbyname('ex_bajamedica').AsDateTime > dateFechaDictamen, ' , ex_bajamedica = ex_fechaaccidente ', '') +
                    ' WHERE ex_id = ' + SqlInt(FieldByName('EX_ID').AsInteger);
      EjecutarSqlST(sSqlUpdate);
    end;
    if (not FieldByName('PE_FECHAALTAMEDICA').IsNull)
        and (FieldByName('PE_FECHAALTAMEDICA').AsDateTime <> dateFechaDictamen) then  // Actualizo pe_fechaaltamedica
    begin
      // Actualizo demás fechas y cantidades de días:
      if fieldbyname('ex_bajamedica').AsDateTime > dateFechaDictamen then
        iDiasBajasTotales := Calcular_Dias(fieldbyname('ex_fechaaccidente').AsDateTime, dateFechaDictamen, 9999)
      else
        iDiasBajasTotales := Calcular_Dias(FieldByName('PE_FECHABAJAMEDICA').AsDateTime, dateFechaDictamen, 9999);

      sSqlUpdate := 'UPDATE sin.spe_partedeegreso ' +
                      ' SET pe_fechaaltamedica   = ' + SqlDate(dateFechaDictamen) +
                          ', pe_diasbajatotales  = ' + SqlInt(iDiasBajasTotales)  +
                          ', pe_fechaaltalaboral = ' + SqlDate(dateFechaDictamen) +
                          ', pe_fechareinicio    = ' + SqlDate(dateFechaDictamen+1) +
                          iif(fieldbyname('ex_bajamedica').AsDateTime > dateFechaDictamen, ' , pe_fechabajamedica = ' + SqlDate(fieldbyname('ex_fechaaccidente').AsDateTime) , '') +
                    ' WHERE pe_idexpediente = ' + SqlInt(FieldByName('EX_ID').AsInteger);
      EjecutarSqlST(sSqlUpdate);
    end;
  finally
    Free;
  end;
end;

procedure TfrmSegIncapacidades.Do_CambiarEstadoActivo;     // TK 19711
var sSql: string;
begin
  sSql := 'SELECT ex_id ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_siniestro = :Sin ' +
            ' AND ex_orden = :Ord ' +
            ' AND NVL(ex_estado, '' '') = ''03'' ' +
            ' AND NVL(ex_causafin, '' '') = ''02'' ';
  with GetQueryEx(sSql, [Siniestro, Orden]) do
  try
    while not Eof do
    begin
      sSql := 'UPDATE sex_expedientes ' +
                ' SET ex_estado = ''01'', ' +
                    ' ex_causafin = NULL, ' +
                    ' ex_fechafin = NULL ' +
              ' WHERE ex_id = ' + SqlInt(FieldByName('ex_id').AsInteger);
      EjecutarSqlST(sSql);

      sSql := 'siniestro.do_actu_estado_siniestro( ' +
                  SqlInt(FieldByName('ex_id').AsInteger) + ', ''01'', ''Reapertura por recepción de Dictamen'', ' +
                  ' NULL, NULL, ' + SqlValue(Sesion.UserID) + ', Null);';
      EjecutarStoreST(sSql);
      Next;
    end;
  finally
    Free;
  end;
end;

function TfrmSegIncapacidades.Es_EmpresaPresidenciaNacion: boolean;    // TK 20679
begin
  Result := (fraEmpresa.CUIT = CUIT_PRESIDENCIANACION);
end;

procedure TfrmSegIncapacidades.Do_DigitalizarStandard;
var sSql, sDA_OPCION, sCodDigitaliza :string;
begin
  if (cmbDA_OPCION.ItemIndex = 0) then       // Digitalización
  begin
    sDA_OPCION     := 'D';
    sCodDigitaliza := sdqConsulta.FieldByName('EI_DIGITALIZA_DESPUES').AsString;
  end
  else if (cmbDA_OPCION.ItemIndex = 1) then  // Guarda  TK 27308
  begin
    sDA_OPCION     := 'G';
    sCodDigitaliza := sdqConsulta.FieldByName('EI_DIGITALIZA_GUARDA').AsString;   // TK 28614
  end;

  sSql := 'siniestro.do_actualizar_archivo(' + SqlInt(IdExpediente)     + ',' +
                                               SqlValue(sDA_OPCION)     + ',' +
                                               SqlInt(edDA_HOJAS.Text)  + ',' +
                                               SqlValue(Sesion.UserID)  + ',' +
                                               SqlValue(sCodDigitaliza) + ',' +
                                               'Null, ' +
                                               'Null, ' +
                                               '0, ' +
                                               'Null, ' +
                                               '''S'');';
  EjecutarStore(sSql);
  MsgBox('Se ha digitalizado correctamente');
end;

procedure TfrmSegIncapacidades.Button1Click(Sender: TObject);          // TK 37769  boton tbDigitalizar futuro
begin
  if (fpDigitalizarDespues.ShowModal = mrOk) then
    if chkCodigoDigitalizacion.Checked then
      Do_DigitalizarDelMenu(fraCodDigitalizacion.Codigo, fraCodDigitalizacion.Descripcion)
    else
      Do_DigitalizarStandard;
end;

// Procedure generico que realiza las digitalizaciones de todos los menues de Digitalizacion (mnuDigitalizar)
procedure TfrmSegIncapacidades.Do_DigitalizarDelMenu(sCodigoDig, sQueDigitalizo: string);   // en consec. del TK 29564
var sSql:string;
begin
  sSql := 'siniestro.do_actualizar_archivo(' + SqlInt(IdExpediente)    + ',''D'',  ' +
                                               SqlInt(edDA_HOJAS.Text) + ', ' +
                                               SqlValue(Sesion.UserID) + ', ' +
                                               SqlValue(sCodigoDig)    + ', ' +
                                               'Null, ' +
                                               'Null, ' +
                                               '0, '    +
                                               'Null, ' +
                                               '''S'');';

  EjecutarStore(sSql);
  MsgBox('Se ha digitalizado el ' + sQueDigitalizo + ' correctamente');
end;

procedure TfrmSegIncapacidades.DoImprimirCaratula(iSiniestro, iOrden, iRecaida: Integer);    // TK 21671
var frmEmisionFormularios: TfrmEmisionFormularios;
begin
  if (fraEvento.sdqDatos.FieldByName('EI_EVCITACION').AsString = 'S') and
     (fraMotivo.Codigo = MOTIVO_HOMOLOGACION) then
  begin
    frmEmisionFormularios := TfrmEmisionFormularios.Create(self);
    try
      frmEmisionFormularios.DoGenerarCaratulaSiniestros(iSiniestro, iOrden, iRecaida);
    finally
      frmEmisionFormularios.Free;
    end;
  end;
end;

procedure TfrmSegIncapacidades.mskCUITDocAsocExit(Sender: TObject);
begin
  if (Accion = Alta) then
    DoCargarDocumentacion(ART_EMPTY_ID, mskCUITDocAsoc.Text);
end;

{procedure TfrmSegIncapacidades.DoFechaAltaDictamen(iIdExpediente, iNuevoEv: integer);  // TK 22901       // Comentado por ticket 44287
var sSql: string;
begin
  if chkEnfInculpable.Checked then
  begin
    sSql := ' SELECT ex_estado, ex_causafin ' +
              ' FROM art.sex_expedientes ' +
             ' WHERE ex_id = :idexp ';

    with GetQueryEx(sSql, [iIdExpediente]) do
    try
      if (FieldByName('EX_ESTADO').AsString = '03') and
         (FieldByName('EX_CAUSAFIN').AsString = '07') then
      begin
        if (MsgBox('¿Se trata de un Alta de Dictamen?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK) and
           (fpFechaAltaDictamen.ShowModal = MrOk) then
          EjecutarSqlST('UPDATE art.sev_eventosdetramite ' +
                          ' SET ev_fechaaltadictamen = ' + SqlDate(dcFecAltaDictamen.Date) +
                        ' WHERE ev_idevento = ' + SqlInt(iNuevoEv));
      end;
    finally
      Free;
    end;
  end;
end;   }

{procedure TfrmSegIncapacidades.btnAceptarFecAltaDictamenClick(Sender: TObject);   // TK 22901     // Comentado por ticket 44287
begin
  if Validar_FechaAltaDictamen then
    fpFechaAltaDictamen.ModalResult := mrOk;
end;   }

{function TfrmSegIncapacidades.Validar_FechaAltaDictamen: Boolean;    // TK 22901       // Comentado por ticket 44287
var sSql: string;
    dFechaAccidente: Tdatetime;
begin
  Verificar(dcFecAltaDictamen.Date > dHoy, dcFecAltaDictamen, 'La fecha de Alta de Dictamen no puede ser mayor a la fecha actual');

  sSql := 'SELECT ex_fechaaccidente ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_id = :idexp ';
  dFechaAccidente := ValorSqlDateTimeEx(sSql, [IdExpediente]);

  Verificar(dcFecAltaDictamen.Date < dFechaAccidente, dcFecAltaDictamen, 'La fecha de Alta de Dictamen no puede ser menor a la fecha de Accidente (' + DateToStr(dFechaAccidente) + ').');

  Result := True;
end;   }

procedure TfrmSegIncapacidades.fpFechaAltaDictamenBeforeShow(Sender: TObject);
begin
  dcFecAltaDictamen.Clear;
end;

procedure TfrmSegIncapacidades.DoEvaluar_RectifSinContestar;  // TK 25339
var sSql: string;
    SqlResults: TStringList;
begin
  sSql := 'SELECT EI_FECMOTCM ' +
           ' FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :codEv ';

  if (ValorSqlEx(sSql, [fraEvento.Codigo]) = 'S') then
  begin
    sSql := 'SELECT A.ev_fecha, A.ev_motivo, A.ev_comision ' +
             ' FROM art.sev_eventosdetramite A, sin.sei_eventoincapacidad B ' +
            ' WHERE B.ei_codigo = A.ev_codigo ' +
              ' AND A.ev_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
              ' AND A.ev_orden = ' + SqlInt(edSiniestro.Orden) +
              ' AND A.ev_recaida = 0 ' +
              ' AND B.ei_rectif_dictapel = ''S'' ' +
              ' AND A.ev_evento = ( SELECT max(C.ev_evento) ' +
                                    ' FROM art.sev_eventosdetramite C, sin.sei_eventoincapacidad D ' +
                                   ' WHERE D.ei_codigo = C.ev_codigo ' +
                                     ' AND C.ev_siniestro = A.ev_siniestro ' +
                                     ' AND C.ev_orden = A.ev_orden ' +
                                     ' AND C.ev_recaida = 0 ' +
                                     ' AND D.ei_rectif_dictapel = ''S'') ';
    SqlResults := ValoresColSql(sSql);
    Try
      dcFecha.Date        := StrToDate(SqlResults[0]);
      fraMotivo.Codigo    := SqlResults[1];
      fraComMedica.Codigo := SqlResults[2];
    finally
      SqlResults.Free;
    end;
  end;
end;

procedure TfrmSegIncapacidades.DoInsertarCartaDoc_elim(iNroEventoBorrado: integer);   // por TK 25894
var
  sSql, sFirmante, sCodCartaDoc_Elim: String;
  iIdFormato, iReca, iDestinatario: Integer;
  dAltaMedica: TDate;
  vDestinatario: TTipoDestinatario;
begin
  sCodCartaDoc_Elim := ValorSqlEx('SELECT EI_CODCARTADOC_ELIM ' +         // TK 27744
                                   ' FROM SIN.SEI_EVENTOINCAPACIDAD ' +
                                  ' WHERE EI_CODIGO = :codev ', [sdqConsulta.FieldByName('EV_CODIGO').AsString]);

  sSql := 'SELECT tc_id, tc_destinatario ' +
           ' FROM ctc_textocarta ' +
          ' WHERE tc_codigo = ' + SqlValue(sCodCartaDoc_Elim);

  with GetQuery(sSql) do
  try
    if not eof then
    begin
      iIdFormato    := Fields[0].AsInteger;
      iDestinatario := Fields[1].AsInteger;
    end
    else begin                // Lu 13/11 puse este else porque daba error si el query no devolvia nada.
      iIdFormato    := 0;
      iDestinatario := 0;
    end;
  finally
    Free;
  end;

  case iDestinatario of      // Lu 02/07
    1: vDestinatario := tdEmpresa;
    2: vDestinatario := tdTrabajador;
    3: vDestinatario := tdAmbos;
    4: vDestinatario := tdArt;
    5: vDestinatario := tdOtros;
    6: vDestinatario := tdComisionMedica;
    else
      vDestinatario := tdOtros; // Para omitir el Warning
  end;

  sSql := 'SELECT ex_altamedica ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
            ' AND ex_orden = ' + SqlInt(Orden);
  if (GetCantRecaidas > 1) and (fpSeleccionRecaida.ShowModal = mrOk) then
    iReca := sdqRecaidasEX_RECAIDA.AsInteger
  else
    iReca := Recaida;
  sSql        := sSql + ' AND ex_recaida = ' + SqlInt(iReca);
  dAltaMedica := ValorSqlDateTime(sSql);

  sFirmante := sdqConsulta.FieldByName('EV_FIRMA').AsString;
  frafirmante_elim.Clear;
  if (sFirmante = '') and (fpFirmante_elim.ShowModal = mrOk) then
    sFirmante := frafirmante_elim.Codigo;

  DoInsertarCarta(iIdFormato, Siniestro, Orden, iReca, sFirmante,
                  AREA_INC, False, IIF(vDestinatario = tdComisionMedica,  fraComMedica.ID, ART_EMPTY_ID),
                  vDestinatario, '', iNroEventoBorrado, dAltaMedica, 840);
end;


procedure TfrmSegIncapacidades.btnAceptarFirmante_elimClick(Sender: TObject);
begin
  inherited;
  Verificar(fraFirmante_elim.IsEmpty, nil, 'Debe completar el Firmante');
  fpFirmante_elim.ModalResult := mrOk;
end;

{procedure TfrmSegIncapacidades.DoInsertarCartaDoc_AltaMed;   // por TK 27283     // comentado por TK 28602
var
  sSql: String;
  iIdFormato, iEvento, iReca, iDestinatario: Integer;
  dAltaMedica: TDate;
  vDestinatario: TTipoDestinatario;
begin
  sSql := 'SELECT tc_id, tc_destinatario ' +
           ' FROM ctc_textocarta ' +
          ' WHERE tc_codigo = ' + SqlValue(fraEvento.sdqDatos.FieldByName('EI_CODCARTADOC_ALTA').AsString);

  with GetQuery(sSql) do
  try
    if not eof then
    begin
      iIdFormato    := Fields[0].AsInteger;
      iDestinatario := Fields[1].AsInteger;
    end
    else begin                // Lu 13/11 puse este else porque daba error si el query no devolvia nada.
      iIdFormato    := 0;
      iDestinatario := 0;
    end;
  finally
    Free;
  end;

  sSql := 'SELECT ex_altamedica ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
            ' AND ex_orden = ' + SqlInt(Orden);
  if (GetCantRecaidas > 1) and (fpSeleccionRecaida.ShowModal = mrOk) then
    iReca := sdqRecaidasEX_RECAIDA.AsInteger
  else
    iReca := Recaida;
  sSql        := sSql + ' AND ex_recaida = ' + SqlInt(iReca);
  dAltaMedica := ValorSqlDateTime(sSql);

  sSql := 'SELECT MAX(ev_evento) ' +
             ' FROM sev_eventosdetramite ' +
            ' WHERE ev_siniestro = :Sini ' +
              ' AND ev_orden = :Orden ' +
              ' AND ev_recaida = 0 ' +
              ' AND ev_evento >= 0';
  iEvento := ValorSqlIntegerEx(sSql, [Siniestro, Orden]);

  case iDestinatario of      // Lu 02/07
    1: vDestinatario := tdEmpresa;
    2: vDestinatario := tdTrabajador;
    3: vDestinatario := tdAmbos;
    4: vDestinatario := tdArt;
    5: vDestinatario := tdOtros;
    6: vDestinatario := tdComisionMedica;
    else
      vDestinatario := tdOtros; // Para omitir el Warning
  end;

  DoInsertarCarta(iIdFormato, Siniestro, Orden, iReca, fraFirmante.Codigo,
                  AREA_INC, False, IIF(vDestinatario = tdComisionMedica,  fraComMedica.ID, ART_EMPTY_ID),
                  vDestinatario, '', iEvento, dAltaMedica, 840);

end;   }

function TfrmSegIncapacidades.PermiteAutorizarEmpresa: boolean;   // TK 26620
var sMensaje: string;
begin
  Result := True;

  sMensaje := GetMensajeEstadoEmpresa(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
  if (sMensaje > '') then
    Result := (MsgBox(sMensaje + #13 + #13 + '¿Desea ingresar dicho evento de todos modos?', MB_ICONQUESTION + MB_YESNO ) = IDYES);
end;

function TfrmSegIncapacidades.ValidarDerInlexConPluri: Boolean;   // TK 28086
var sSql: string;
begin
  Result := true;
  sSql := 'SELECT 1 FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_expedderinlex = ''S'' ' +  // este campo trae los eventos de derivacion a inlex
            ' AND ei_fechabaja IS NULL' +
            ' AND ei_codigo = :codevento ';

  if (sdqBusquedaEX_PLURIEMPLEO.AsString = 'S') and ExisteSqlEx(sSql, [fraEvento.Codigo]) then
    Result := (MsgBox('¿Esta seguro que desea ingresar el evento de Derivación, siendo un Siniestro con Pluriempleo?', MB_ICONQUESTION + MB_YESNO) = IDYES);

  if not Result then fpEventos.ModalResult := mrCancel;   // Esto lo hago porque al darle "no" no cierra el form de Eventos
end;

procedure TfrmSegIncapacidades.tbAsociarArchivoClick(Sender: TObject);    // TK 28452
begin
  Limpiar_AsocArchivo;
  if (fpAsociarArchivo.ShowModal = mrOk) then
  begin
    //
  end;
end;

procedure TfrmSegIncapacidades.tbSeleccionArchivoAsociarClick(Sender: TObject); // TK 28452
begin
  if OpenDialog_AsocArch.Execute then
    edArchivoAsociado.Text := OpenDialog_AsocArch.FileName;
end;

procedure TfrmSegIncapacidades.btnAceptar_AsocArchivoClick(Sender: TObject);    // TK 28452
begin
  Verificar((edDescripcionArchivo.Text = ''), edDescripcionArchivo, 'Debe especificar una Descripción del Archivo');
  Verificar((edArchivoAsociado.Text = ''), edArchivoAsociado, 'Debe especificar un Archivo para Asociar');
  Do_GuardarArchivoAsociado;
  fpAsociarArchivo.ModalResult := mrOk;
end;

procedure TfrmSegIncapacidades.btnDesasociarClick(Sender: TObject);   // TK 29777
begin
  if MsgAsk('¿Esta seguro que desea Desasociar el archivo?') then
  begin
    Do_DesasociarArchivo;
    fpAsociarArchivo.ModalResult := mrOk;
  end;
end;

procedure TfrmSegIncapacidades.DoEvaluar_AsociarArchivo;  // TK 28452
var sSql: string;
begin
  sSql := 'SELECT ei_asociaarchivo FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :codEv ';

  tbAsociarArchivo.Enabled := Seguridad.Activar(tbAsociarArchivo) and (ValorSqlEx(sSql, [sdqConsulta.FieldByName('EV_CODIGO').AsInteger]) = 'S');
end;

procedure TfrmSegIncapacidades.Limpiar_AsocArchivo;
begin
  edDescripcionArchivo.Text := '';
  edArchivoAsociado.Text    := '';
end;

procedure TfrmSegIncapacidades.Do_GuardarArchivoAsociado;                       // TK 28452
var sArchivoOrigen, sArchivoDestino: string;
begin
  sArchivoOrigen  := edArchivoAsociado.Text;
  sArchivoDestino := DIR_ASOCIARARCHIVO + ExtractFileName(edArchivoAsociado.Text);

  if Not FileExists(PAnsiChar(sArchivoDestino)) then
  begin
    if not CopyFile(PChar(sArchivoOrigen), PChar(sArchivoDestino), true) then
       raise Exception.Create('El archivo ' + sArchivoOrigen +  'no pudo ser copiado al directorio '
                              + DIR_ASOCIARARCHIVO + ' indicado en el parámetro ')
    else
      Do_GuardarEnTabla_ArchivoAsociado(sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger, sArchivoDestino,
                                        ExtractFileName(edArchivoAsociado.Text), edDescripcionArchivo.Text);
  end
  else
    raise Exception.Create('Un archivo con el mismo nombre ya existe en el directorio.');
 
end;

procedure TfrmSegIncapacidades.Do_GuardarEnTabla_ArchivoAsociado(iIdEvento: integer; sArchDestino, sNombreArchivo,
                                                                 sDescripcionArchivo: string);   // TK 28452
var sSql, sSqlSev: string;
begin
  try
    BeginTrans(True);
    sSql := 'INSERT into SIN.SEE_INCAARCHIVOSASOCIADOS ' +
            ' (ee_idevento, ee_path, ee_nombrearchivo, ' +
             ' ee_descripcionarchivo, ee_fechaalta, ee_usualta) VALUES (' +
            SqlInt(iIdEvento) + ',' + SqlValue(sArchDestino) + ',' + SqlValue(sNombreArchivo) + ',' +
            SqlValue(sDescripcionArchivo) + ', trunc(sysdate), ' + SqlValue(Sesion.UserId) + ')';
    EjecutarSqlST(sSql);

    sSqlSev := 'UPDATE art.sev_eventosdetramite ' +
                 ' SET ev_ArchivoAsociado = ''S'' ' +
               ' WHERE ev_idevento = ' + SqlInt(iIdEvento);
    EjecutarSqlST(sSqlSev);

    CommitTrans(True);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al guardar los datos en la tabla de Archivos Asociados.');
    end;
  end;
end;

procedure TfrmSegIncapacidades.Do_GuardarEnTabla_ArchivoDESAsociado(iIdEvento: integer);   // TK 29777
var sSql:string;
begin
  Try
    BeginTrans(True);
    sSql := 'UPDATE SIN.SEE_INCAARCHIVOSASOCIADOS ' +
              ' SET ee_fechabaja = art.actualdate, ' +
                  ' ee_usubaja = ' + SqlValue(Sesion.UserId) +
            ' WHERE ee_idevento = ' + SqlInt(iIdEvento);
    EjecutarSqlST(sSql);

    sSql := 'UPDATE ART.SEV_EVENTOSDETRAMITE ' +
              ' SET ev_archivoasociado = ''N'' ' +
            ' WHERE ev_idevento = '  + SqlInt(iIdEvento);
    EjecutarSqlST(sSql);

    CommitTrans(True);
  except
    on E:Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al guardar los datos en la tabla de Archivos Asociados (Desasociar).');
    end;
  end;
end;

procedure TfrmSegIncapacidades.fpAsociarArchivoBeforeShow(Sender: TObject);   // TK 28452
begin
  if Evento_tieneArchivoAsociado then
    Do_FormatoAsociarArchivo(False)
  else
    Do_FormatoAsociarArchivo(True);
end;

function TfrmSegIncapacidades.Evento_tieneArchivoAsociado: boolean;           // TK 28452
var sSql: string;
begin
  sSql := 'SELECT 1 FROM sin.see_incaarchivosasociados ' +
          ' WHERE ee_idevento = :idev ' +
            ' AND ee_fechabaja is null ';
  Result := ExisteSqlEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger]);
end;

procedure TfrmSegIncapacidades.Do_FormatoAsociarArchivo(bHabilitar: boolean); // TK 28452
var sSql: string;
begin
  LockControls([edDescripcionArchivo,  btnAceptar_AsocArchivo], not bHabilitar);
  btnAbrirArchivo.Enabled           := not bHabilitar;
  btnDesasociar.Enabled             := not bHabilitar;   // TK 29777
  tbSeleccionArchivoAsociar.Enabled := Seguridad.Activar(tbSeleccionArchivoAsociar) and bHabilitar;
  btnAceptar_AsocArchivo.Enabled    := Seguridad.Activar(btnAceptar_AsocArchivo) and bHabilitar;

  if not bHabilitar then  // Modo "Ver" archivo asociado => cargo los datos
  begin
    fpAsociarArchivo.Caption := 'Ver Archivo Asociado';
    sSql := 'SELECT ee_idevento, ee_path, ee_descripcionarchivo ' +
             ' FROM sin.see_incaarchivosasociados ' +
            ' WHERE ee_idevento = :idev ' +
              ' AND ee_fechabaja is null ';
    with GetQueryEx(sSql, [sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger]) do
      try
        edDescripcionArchivo.Text := FieldByName('EE_DESCRIPCIONARCHIVO').AsString;
        edArchivoAsociado.Text    := FieldByName('EE_PATH').AsString;
      finally
        Free;
      end;
  end
  else
    fpAsociarArchivo.Caption := 'Asociar Archivo';
end;

procedure TfrmSegIncapacidades.btnAbrirArchivoClick(Sender: TObject);         // TK 28452
begin
  ShellExecute(Application.Handle, nil, PChar(edArchivoAsociado.Text), '', '', SW_SHOWNORMAL);
end;


procedure TfrmSegIncapacidades.Do_DesasociarArchivo;    // TK 29777
var sArchivoOrigen: string;
begin
  sArchivoOrigen  := edArchivoAsociado.Text;

  if FileExists(PAnsiChar(sArchivoOrigen)) then
  begin
    if not DeleteFile(PAnsiChar(sArchivoOrigen)) then
       raise Exception.Create('El archivo ' + sArchivoOrigen +  'no pudo ser desasociado del directorio '
                              + DIR_ASOCIARARCHIVO + ' indicado en el parámetro ')
    else
      Do_GuardarEnTabla_ArchivoDESAsociado(sdqConsulta.FieldByName('EV_IDEVENTO').AsInteger);
  end
  else
    raise Exception.Create('El archivo indicado no existe en el directorio.');
end;


procedure TfrmSegIncapacidades.Do_SubMotivos(iNuevoEv: Integer);   // TK 33601
var sSql: string;
begin
  sSql := 'SELECT ei_submotivo ' +
           ' FROM SIN.SEI_EVENTOINCAPACIDAD, ART.SEV_EVENTOSDETRAMITE ' +
          ' WHERE EI_CODIGO = EV_CODIGO ' +
            ' AND ev_idevento = :idev ';
  if (ValorSqlEx(sSql, [iNuevoEv]) = 'S') then
  begin
    if (fpSubMotivos.ShowModal = mrOk) then
      Do_GuardarSubMotivos(iNuevoEv);
  end;
end;

procedure TfrmSegIncapacidades.btnAceptarSubMotivosClick(Sender: TObject);     // TK 33601
begin
  inherited;
  fpSubMotivos.ModalResult := mrOk;
end;

procedure TfrmSegIncapacidades.fpSubMotivosBeforeShow(Sender: TObject);       // TK 33601
begin
  chkAltaCargTarde.Checked    := False;
  chkAltaCargTildeErr.Checked := False;
  chkAltaMalConf.Checked      := False;
  chkCDNotaSic.Checked        := False;
  chkRequerimientos.Checked   := False;
end;

procedure TfrmSegIncapacidades.Do_GuardarSubMotivos(iNuevoEv: integer);       // TK 33601
var sSql: string;
begin
  sSql := 'INSERT INTO sin.see_eventoinca_submotivos ' +
          '(ee_idevento, ee_altacargtarde, ee_altacargtildeerr, ee_altamalconf, ee_cdnotasic, ' +
          ' ee_usualta, ee_fechaalta, ee_requerimientos) VALUES ( ' +
          SqlInt(iNuevoEv) + ', ' +
          IIF(chkAltaCargTarde.Checked, '''S''', '''N''')    + ',' +
          IIF(chkAltaCargTildeErr.Checked, '''S''', '''N''') + ',' +
          IIF(chkAltaMalConf.Checked, '''S''', '''N''')      + ',' +
          IIF(chkCDNotaSic.Checked, '''S''', '''N''')        + ',' +
          SqlValue(Sesion.UserId) + ', trunc(sysdate), ' +
          IIF(chkRequerimientos.Checked, '''S''', '''N''') + ')';

  EjecutarSqlST(sSql);
end;

procedure TfrmSegIncapacidades.chkDestinoPapelClick(Sender: TObject);
begin
  LockControl(cmbDA_OPCION, not chkDestinoPapel.Checked);
  LockControl(fraCodDigitalizacion, chkDestinoPapel.Checked);
  if chkDestinoPapel.Checked then
  begin
    fraCodDigitalizacion.Clear;
    cmbDA_OPCION.ItemIndex := 0;   // para que sea mas rapido para los usuarios
  end;
end;

procedure TfrmSegIncapacidades.chkIntegralClick(Sender: TObject);
begin
  VCLExtra.LockControls([edPorcIntegral], not (chkIntegral.Checked and ((sdqBusquedaEX_FECHAACCIDENTE.AsDateTime) >= StrToDate(FECHA_LEY26773))  ) );

  if edPorcIntegral.Enabled then
    edPorcIntegral.Clear;
end;

procedure TfrmSegIncapacidades.chkCodigoDigitalizacionClick(Sender: TObject);
begin
  LockControl(fraCodDigitalizacion, not chkCodigoDigitalizacion.Checked);
  LockControl(cmbDA_OPCION, chkCodigoDigitalizacion.Checked);
  if chkCodigoDigitalizacion.Checked then
  begin
    cmbDA_OPCION.ItemIndex := -1;
    cmbDA_OPCION.Text      := '';
  end;
end;

procedure TfrmSegIncapacidades.tbNoRecitarClick(Sender: TObject);  //DFG 14/06/2012
var ssql, recita: string;
begin
  if tbNoRecitar.Down then
    recita := 'N'
  else
    recita := 'S';

  ssql := ' update art.sev_eventosdetramite ' +
            '  set ev_recitar = :recita ' +
           ' where ev_siniestro = :sin and ev_orden = :ord ' +
            '  and ev_recaida = :rec and ev_evento = :ev ';
  EjecutarSqlEx(ssql, [recita, Siniestro, Orden, Recaida, sdqConsulta.FieldByName('ev_evento').AsInteger]);

end;


function TfrmSegIncapacidades.GeneraCartaComPresidencia: boolean;          //DFG 22/08/2012 (40496)
begin
  GeneraCartaComPresidencia := false;
  if Es_EmpresaPresidenciaNacion and (fraEvento.sdqDatos.FieldByName('EI_GENERANOTAPRESI').AsString = 'S') then
    GeneraCartaComPresidencia := true;

end;

procedure TfrmSegIncapacidades.DoGenerarCitacionPresidencia(idevento: integer);
var rpt: TqrCitacionPresidencia;
begin
  if GeneraCartaComPresidencia and (MsgBox('¿Desea generar la carta de citación?', MB_ICONQUESTION + MB_YESNO ) = IDYES) then
  begin
    rpt := TqrCitacionPresidencia.Create(self);
    try
      rpt.Imprimir(idevento, fraFirmante.Codigo);
    finally
      rpt.free;
    end;
  end;

end;

procedure TfrmSegIncapacidades.btnCancelarrAltaDictClick(Sender: TObject);
begin
  fpFechaDictamen.ModalResult := mrCancel;      

end;

procedure TfrmSegIncapacidades.Do_CompletarJuiciosYMediaciones;    // TK 43890
begin
  with GetQueryEx('SELECT art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio, ' +
                        ' art.SIN.get_listanrosmediacionesexp(ex_id) mediaciones ' +
                   ' FROM art.sex_expedientes ' +
                  ' WHERE ex_id = :idexp', [IdExpediente]) do
  try
    edJUICIO.Text       := FieldByName('JUICIO').AsString;
    edJUICIO.Hint       := FieldByName('JUICIO').AsString;
    edMEDIACIONES.Text  := FieldByName('MEDIACIONES').AsString;
    edMEDIACIONES.Hint  := FieldByName('MEDIACIONES').AsString;
  finally
    Free;
  end;
end;

function TfrmSegIncapacidades.ValidarSiniCitacionAnioILT: Boolean;    // TK 48457
var dAltaMedica: TDateTime;
begin
  if (fraMotivo.Codigo = MOTIVO_HOMOLOGACION) then
  begin
    dAltaMedica := ValorSqlDateTimeEx('SELECT ART.SINIESTRO.getaltamedica(:idexped) FROM dual', [IdExpediente]);
    Verificar(  ((dAltaMedica = 0) and (ValorSqlEx('SELECT ei_siniestroenilt FROM sin.sei_eventoincapacidad WHERE ei_codigo = :codi ', [fraEvento.Codigo]) = 'S') and
                 Siniestro_EsDentroAnioILT(edSiniestro.Siniestro, edSiniestro.Orden) ), fraEvento,
                 'No se puede cargar la citación debido a que el siniestro se encuentra dentro del período de ILT y sin alta médica.');

  end;
  Result := True;
end;


procedure TfrmSegIncapacidades.fpDictamenShow(Sender: TObject);
var
  iTipoEv: Integer;
begin
  rgDigitalizarSI.Checked := True;
  rgGenerarTareaSI.Checked := True;
  edArchivoDictamen.Clear;

  if (fraEvento.edCodigo.Text = CODEVENTO_RESP_RECTIFICATORIA_DIC) then     // TK 68674
    fraTipoDocumentoAGA.Codigo := 'REC'
  else
    fraTipoDocumentoAGA.Codigo := 'DIC';

  iTipoEv := fraEvento.sdqDatos.FieldByName('EI_TIPOEVENTO').AsInteger;

  VCLExtra.LockControls([rgGenerarTareaSI, rgGenerarTareaNO], not ((iTipoEv = 6) or
                                                                   (((iTipoEv = 1) or (iTipoEv = 7)) and (chkTratamiento.Checked or chkRecalificacion.Checked)) or
                                                                   ((iTipoEv = 1) and chkPrevencion.Checked and (not chkTratamiento.Checked))));
  rgGenerarTareaNO.Checked := not rgGenerarTareaNO.Enabled;
end;

procedure TfrmSegIncapacidades.fpConstanciaDomicCobroShow(Sender: TObject);   // TK 62690
begin
  rdDigitalizarCODOC_Si.Checked := True;
  rdDigitalizarCODOC_No.Checked := False;
  fraTipoDocumentoAGA_CODOC.Codigo := 'CODOC';
  LockControl(fraTipoDocumentoAGA_CODOC, true);
  edArchivoCODOC.Clear;
end;

procedure TfrmSegIncapacidades.btnAceptarDictamenClick(Sender: TObject);
begin
  if ValidarDictamenAGAySIC then
  begin
    if rgDigitalizarSI.Checked then
    begin
      if not TfrmCargaDocumentosDigitaliz.DoCargarDocumentosDigitalizados(ID_CARPETA_INCAPACID,
                                                                          IntToStr(Siniestro), IntToStr(Orden), '', '',
                                                                          fraTipoDocumentoAGA.Codigo, edArchivoDictamen.FileName,
                                                                          '', False, False) then
        InfoHint(edArchivoDictamen, 'No se pudo digitalizar el archivo', True)
      else
        GuardarDocsEventoInca;

    end;
    fpDictamen.ModalResult := mrOk;
  end;
end;

procedure TfrmSegIncapacidades.btnAceptarCODOCClick(Sender: TObject);
begin
  if ValidarCODOC then
  begin
    if rdDigitalizarCODOC_Si.Checked then
    begin
      if not TfrmCargaDocumentosDigitaliz.DoCargarDocumentosDigitalizados(ID_CARPETA_INCAPACID,
                                                                          IntToStr(Siniestro), IntToStr(Orden), '', '',
                                                                          fraTipoDocumentoAGA_CODOC.Codigo, edArchivoCODOC.FileName,
                                                                          '', False, False) then
        InfoHint(edArchivoCODOC, 'No se pudo digitalizar la Constancia de domicilio de Cobro.', True)
      else
        GuardarDocsEventoInca;

    end;
    fpConstanciaDomicCobro.ModalResult := mrOk;
  end;
end;

function TfrmSegIncapacidades.ValidarDictamenAGAySIC: Boolean;
begin
  Verificar(rgDigitalizarSI.Checked and (not FileExists(edArchivoDictamen.FileName)), edArchivoDictamen, 'Debe seleccionar el archivo del dictamen.');
  Verificar(rgGenerarTareaSI.Checked and (not FileExists(edArchivoDictamen.FileName)), edArchivoDictamen, 'Debe seleccionar el archivo del dictamen.');
  Result := True;
end;

function TfrmSegIncapacidades.ValidarCODOC: Boolean;     // TK 62690
begin
  Verificar(rdDigitalizarCODOC_Si.Checked and (not FileExists(edArchivoCODOC.FileName)), edArchivoCODOC, 'Debe seleccionar el archivo de la Constancia de Domicilio de Cobro.');
  Result := True;
end;

procedure TfrmSegIncapacidades.GestionarDictamenAGAySIC;
  procedure GestionarSIC(nMotivo: Integer);
  var
    nIdTarea: Integer;
  begin
    do_insertartarea(nMotivo, SIC_CANAL_GESTION_INTERNA, DBDateTime, nIdTarea, 0{CalcDiasHabiles(dcFechaVencim.Date, -1) + (22/24)},
                     'S' {Asignar automáticamente}, 'S' {Enviar mail}, Sesion.UserID,
                     'Dictamen digitalizado automáticamente para ser gestionado.' + CRLF + 'Recibido el ' + FormatDateTime('dddd', dcFechaRecep.Date) + ' ' + DateToStr(dcFechaRecep.Date) + '.' +
                     IIF(IsEmptyString(edObservaciones.Text), '', CRLF + edObservaciones.Text),
                     0{ideventooriginal}, 0{prioridad},
                     Self.fraTrabajadorSIN.Contrato, Self.fraTrabajadorSIN.Value, IdExpediente);
    do_insertaradjuntotarea(nIdTarea, edArchivoDictamen.FileName, Sesion.UserID);
  end;
var
  iTipoEv: Integer;  
begin
  iTipoEv := fraEvento.sdqDatos.FieldByName('EI_TIPOEVENTO').AsInteger;
  if iTipoEv in [1,6,7] then
  begin
    if fpDictamen.ShowModal = mrOk then
    begin
      if rgGenerarTareaSI.Checked then
      begin
        BeginTrans(True);
        try
          if (iTipoEv = 6) or chkTratamiento.Checked then
            GestionarSIC(SIC_MOTIVO_INCA_DICTAMEN_GESTOR);

          if chkRecalificacion.Checked then
            GestionarSIC(SIC_MOTIVO_INCA_DICTAMEN_RECA);

          if chkPrevencion.Checked then
            GestionarSIC(SIC_MOTIVO_INCA_DICTAMEN_PREVENTOR);

          CommitTrans(True);
        except
          on E: Exception do
          begin
            RollBack(True);
            raise;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmSegIncapacidades.GestionarConstanciaDomicCobro;    // TK 62690
begin
  if (fraEvento.sdqDatos.FieldByName('EI_PDF_CONSTDOMIC').AsString = 'S') and (fraMotivo.Codigo = MOTIVO_HOMOLOGACION) then
  begin
    if fpConstanciaDomicCobro.ShowModal = mrOk then
    begin
       //
    end;
  end;

end;

procedure TfrmSegIncapacidades.CambioDigitalizarAGA(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraTipoDocumentoAGA], rgDigitalizarNO.Checked);
end;

procedure TfrmSegIncapacidades.DoCambioOpcionCODOC(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([edArchivoCODOC], rdDigitalizarCODOC_No.Checked);
end;

procedure TfrmSegIncapacidades.tbSalir7Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSegIncapacidades.fpAgregarObservLegalesBeforeShow(Sender: TObject);      // TK 55299
begin
  edCodEvento_Leg.Text     := sdqConsulta.FieldByName('EV_CODIGO').AsString;
  edDescEvento_Leg.Text    := sdqConsulta.FieldByName('EVENTO').AsString;
  edCodEvento_Leg.Enabled  := false;
  edDescEvento_Leg.Enabled := false;
  edObserv_Leg.Lines.Text  := sdqConsulta.FieldByName('EV_MAILLEGALES').AsString;
  btnAceptar_Leg.Enabled   := Seguridad.Activar(btnAceptar_Leg);
end;

procedure TfrmSegIncapacidades.DoEvaluar_ObservacionesLegales;        // TK 55299
var sSql: string;
begin
  sSql := 'SELECT ei_guardamaillegales FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :codEv ';

  tbObservLegales.Enabled := Seguridad.Activar(tbObservLegales) and (ValorSqlEx(sSql, [sdqConsulta.FieldByName('EV_CODIGO').AsInteger]) = 'S');
end;

procedure TfrmSegIncapacidades.btnAceptar_LegClick(Sender: TObject);    // TK 55299
begin
  Verificar((edObserv_Leg.Text = ''), edObserv_Leg, 'Debe completar las observaciones');
  Do_GuardarObservacionesLegales;
  fpAgregarObservLegales.ModalResult := mrOk;
end;

procedure TfrmSegIncapacidades.Do_GuardarObservacionesLegales;        // TK 55299
var sSql: string;
begin
  try
    BeginTrans;

    sSql := 'UPDATE art.sev_eventosdetramite ' +
              ' SET ev_maillegales = ' + SqlValue(edObserv_Leg.Lines.Text) +
            ' WHERE ev_siniestro = :sini ' +
              ' AND ev_orden = :orden ' +
              ' AND ev_recaida = :reca ' +
              ' AND ev_evento = :evento ';

    EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('EV_SINIESTRO').AsInteger,
                           sdqConsulta.FieldByName('EV_ORDEN').AsInteger,
                           sdqConsulta.FieldByName('EV_RECAIDA').AsInteger,
                           sdqConsulta.FieldByName('EV_EVENTO').AsInteger]);

    CommitTrans;
  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al guardar las Observaciones en la tabla de Eventos.');
    end;
  end;

end;

procedure TfrmSegIncapacidades.fpRecaidaSinBeforeShow(Sender: TObject);    // Por plan de Extension de ILT
begin
  sdqRecaidaSin.ParamByName('siniestro').AsString := edSiniestroABM.SiniestroS;
  sdqRecaidaSin.ParamByName('orden').AsString     := edSiniestroABM.OrdenS;
  sdqRecaidaSin.Open;
end;

procedure TfrmSegIncapacidades.btnCancelarRecaidaSinClick(Sender: TObject);    // Por plan de Extension de ILT
begin
  fpRecaidaSin.ModalResult := mrCancel;
end;

procedure TfrmSegIncapacidades.fpRecaidaSinClose(Sender: TObject; var Action: TCloseAction);     // Por plan de Extension de ILT
begin
  sdqRecaidaSin.Close;
end;

procedure TfrmSegIncapacidades.btnAceptarRecaidaSinClick(Sender: TObject);       // Por plan de Extension de ILT
begin
  Verificar((cmbRecaidaSin.Value = ''), cmbRecaidaSin, 'Debe ingresar el nro de Recaída.');
  fpRecaidaSin.ModalResult := mrOk;
end;

// por Plan Extensión de ILT - devuelve el nro de recaida elegida en el combo en caso de ser un 112. Caso contrario devuelve 0 (recaida estandard). y el IdExpediente correspondiente a esa recaida (de lo contrario 0).
procedure TfrmSegIncapacidades.Do_CargarRecaida_ExtensionILT(sCodEvento: string; iIdEvento:Integer; var iRecaida, iIdExpediente: integer);
begin
  if (IsEventoExtensionILT(sCodEvento)) and (GetCantRecaidas > 1) and (fpRecaidaSin.ShowModal = mrOk) then
  begin
    iRecaida      := StrToInt(cmbRecaidaSin.Value);
    iIdExpediente := ValorSqlEx('SELECT ex_id FROM art.sex_expedientes ' +
                                ' WHERE ex_siniestro = :sini ' +
                                  ' AND ex_orden = :orden ' +
                                  ' AND ex_recaida = :reca ', [edSiniestro.Siniestro, edSiniestro.Orden, iRecaida]);

  end
  else
  begin
    iRecaida      := 0;
    iIdExpediente := 0;
  end;
end;

function TfrmSegIncapacidades.IsEventoExtensionILT(sCodEvento: string): boolean;     // Por plan de Extension de ILT
var sSql: string;
begin
  sSql := 'SELECT ei_autorizaextensionilt FROM sin.sei_eventoincapacidad ' +
          ' WHERE ei_codigo = :codigo ';

  Result := (ValorSqlEx(sSql, [sCodEvento]) = 'S');
end;


procedure TfrmSegIncapacidades.GuardarDocsEventoInca;
var sRutaCompletaArchivos, sArchivo: string;
begin

  sRutaCompletaArchivos := TfrmCargaDocumentosDigitaliz.GetRutaCompletaArchivos;
  while pos(',', sRutaCompletaArchivos) > 0 do
  begin
    sArchivo := Copy(sRutaCompletaArchivos, 0, Pos(',', sRutaCompletaArchivos) - 1);
    sRutaCompletaArchivos := Copy(sRutaCompletaArchivos, pos(',', sRutaCompletaArchivos)+1, length(sRutaCompletaArchivos));
    EjecutarSqlEx('insert into sae_archivoeventoinca (ae_idevento, ae_archivo) ' +
                      ' values (:idev, :ruta)', [iNuevoEvento, sArchivo]);
  end;

end;


procedure TfrmSegIncapacidades.DoGenerarTramitesMedicos(sCodEvento :String; EsReCitar: boolean = false);
var pTramiteMedico: TTramiteMedico;
    pTurnoMedico:  TTurnoMedico;
    sErrorNulidad, sSql, sTelef, sCelu, sHora: string;
    wAnio, wMes, wDia, wHora, wMinutos, wSegundos, wMilisegundos: Word;
    dHora: TDateTime;

begin
  sErrorNulidad := '';

  if (sCodEvento = CODEVENTO_SOLTURNOSRT) then
  begin
    with pTramiteMedico do
    begin
      NumeroAccidente := ValorSqlEx('select art.srt.get_numerosrt(:sini, :orden, :reca) from dual',[edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]); // Obligatorio

      if (fraMotivo.Codigo = MOTIVO_LEY24557) then         // por pedido de Karina, mail de Paula del 20/05/2015  (Motivo 8)
        CodigoMotivo := 54
      else
        CodigoMotivo    := 53; //integer; //Tipo de trámite médico por el que se presenta el caso SRT.SME_MOTIVOEXPEDIENTE. (en desa hay dos campos y el que iría es el 53. en part no hay nada!.) Obligatorio

      if (sdqBusquedaEX_TIPO.AsString = TA_ENFERMEDAD) then  // : String; //Tipo de contingencia del caso (debe coincidir con el declarado en los registros de AT/EP).  "AT" o "EP" (me fijo si es in itinere, acc laboral o ep, el los dos primeros casos le pongo AT y en el segundo EP.. esta bien?, porque no veo que diga que es obligatorio)
        Contingencia := 'EP'
      else
        Contingencia := 'AT';

      CuitCuilDamnificado      := sdqBusquedaEX_CUIL.AsString;  //  String;  //Sin guiones ni signos de puntuación. Obligatorio SUSS
      FechaNacimiento          := sdqBusquedaTJ_FNACIMIENTO.AsDateTime;  // TDate;   //Fecha de nacimiento del trabajador  (enviar AAAAMMDD en el XML). Obligatorio. (me dijo vonver que lo ponga como Date comun)

      if (CuitCuilDamnificado = '') then     // String;  //Número del documento del trabajador. Solo cuando el trabajador no posea CUIL. //Obligatorio si no se consigna el campo CUIL
      begin
        NroDocumentoDamnificado  := sdqBusquedaTJ_DOCUMENTO.AsString;
        TipoDocumentoDamnificado := 38;   // Integer; //Tipo de Documento del Trabajador SRT.STD_TIPODOCUMENTO. Obligatorio si se consigna el Número de Documento. (esta tabla tiene los codigos de doc segun la SRT, no se ¿de donde sacar el tipo documento?? o va este fijo?, ¿debe quedar en blanco si es que se consigna el nro de Cuil?)
      end
      else begin
        NroDocumentoDamnificado  := '';
        // TipoDocumentoDamnificado := 0;
      end;

      DomicilioDelDamnificado := sdqBusquedaDOMICILIO_TRABAJADOR.AsString;  // : String; * *  ART.utiles.get_textolimpio(UPPER(art.utiles.armar_domicilio ... * *   //Domicilio de notificación del trabajador. Completar con mayúsculas y espacios en blancos, sin puntos ni guiones. Obligatorio.  (con las funciones del ppio tiene puntos y la palabra "DPTO.", etc.. habria que sacar todo eso?

      if (sdqBusquedaTJ_CPOSTAL.AsString <> '') then
        CodPostal := StrToInt(sdqBusquedaTJ_CPOSTAL.AsString)  //  : Integer; //Código postal de notificación del trabajador. Completar según tabla de códigos postales (Que tabla??). Obligatorio
      else
        sErrorNulidad := 'El código postal es nulo.';

   //   CodigoLocalidad: Integer; //Localidad de notificación del trabajador. SRT.SLS_LOCALIDADSRT. Obligatorio.
      if sdqBusquedaTJ_PROVINCIA.IsNull then    // si la provincia es nula, no se va a poder obtener el CodigoLocalidad
        sErrorNulidad := sErrorNulidad + #13#10 + 'Provincia Nula (y/o domicilio nulo)'
      else if (sdqBusquedaTJ_PROVINCIA.AsString = '1') then  // Si es Capital Federal, el CodigoLocalidad es fijo: LS_ID = 20308
        CodigoLocalidad := 20308
      else begin
        sSql := 'SELECT ls_id ' +
                 ' FROM SRT.SLS_LOCALIDADSRT, srt.scl_codigo_localidad, art.cpv_provincias, cub_ubicacion ' +
                ' WHERE cl_codigo_srt = ls_codigo ' +
                  ' AND ub_provincia = pv_codigo ' +
                  ' AND ub_id = cl_idubicacion(+) ' +
                  ' AND ub_localidad like UPPER (''%' + sdqBusquedaTJ_LOCALIDAD.AsString + '%'') ' +
                  ' AND ub_cpostal = ' + SqlValue(sdqBusquedaTJ_CPOSTAL.AsString) +
                  ' AND ub_provincia = ' + SqlValue(sdqBusquedaTJ_PROVINCIA.AsString);
        CodigoLocalidad := ValorSql(sSql);
      end;

    //  CodigoProvincia: Integer; //Provincia de notificación del trabajador. SRT.SPR_PROVINCIASRT. Obligatorio
      CodigoProvincia := ValorSqlIntegerEx('SELECT pr_id ' +
                                            ' FROM SRT.SPR_PROVINCIASRT, cpv_provincias ' +
                                           ' WHERE pv_codigodgi = pr_provinciadgi ' +
                                             ' AND pv_codigodgi = :coddgi', [sdqBusquedaPV_CODIGODGI.AsString]);


      // Teléfonos   //Teléfono fijo de contacto del trabajador. 1143213500. Obligatorio
      sSql := 'SELECT ''('' || tt_area || '')'' || tt_numero  Tel FROM att_telefonotrabajador ' +        // cambio (area)telefono por mail del 09/04/2015
              ' WHERE tt_idtrabajador = :idtrab ';

      sTelef := ValorSqlEx(sSql + ' AND TT_IDTIPOTELEFONO = 2 ', [fraTrabajadorSIN.Value]);   // Tel Particular
      if (sTelef = '') then
        sTelef := ValorSqlEx(sSql + ' AND TT_IDTIPOTELEFONO = 1 ', [fraTrabajadorSIN.Value]);  // si no hay, me fijo si tiene el Laboral
      if (sTelef = '') then
        sTelef := cTELPROVINCIAARTconAREA; // si tampoco tiene el laboral, colocamos el telefono de aca.

      Telefono := sTelef;

      sCelu := ValorSqlEx(sSql + ' AND TT_IDTIPOTELEFONO = 3 ', [fraTrabajadorSIN.Value]);   // Celular  //Teléfono celular de contacto primario del trabajador.  111543213501. Obligatorio
      if (sCelu = '') then
        sCelu := cTELPROVINCIAARTconAREA;  // si no tiene Celular, coloco el telefono de aca.

      Email := sdqBusquedaMAIL_TRABAJADOR.AsString;  //  String;  //Dirección de correo electrónico de contacto del trabajador.  alguien@dominio.com.ar. Obligatorio
      if (Email = '') then
        Email := cMAILINCAPACIDADES;

      Relato := sdqBusquedaEX_BREVEDESCRIPCION.AsString;  // : String;  //Información adicional del trámite presentado. Texto Libre Obligatorio
      if (Relato = '') then
        sErrorNulidad := sErrorNulidad + #13#10 + 'El Relato es nulo.';

      if EsReCitar then
        ComisionMedica := sdqConsulta.FieldByName('EV_COMISION').AsString
      else
        ComisionMedica := fraComMedica.Codigo;  //Comisión Médica en la que se presenta el trámite. SRT.SCM_COMISIONMEDICA. Obligatorio.
    end;

    if sErrorNulidad = '' then
    begin

      if Is_SiniestroDeGobernacion(IdExpediente) then
        pTurnoMedico := AltaTramiteMedico(pTramiteMedico, tmNone, ueGBA)
      else
        pTurnoMedico := AltaTramiteMedico(pTramiteMedico, tmNone, ueProvincia);   // funcion que llama al web service

      with pTurnoMedico do
      begin
        if (Error = '') then    // Si esto sucede, entonces el pedido se procesó correctamente. Genero el "Aceptado" y el evento de citacion 174.
        begin
          // Parametros a pasar:
         { CuitCuilDamnificado        : String;
          NombreyApellidoDamnificado : String;
          Domicilio                  : String;
          CodigoLocalidad            : integer;
          CodigoProvincia            : integer;
          Citacion                   : TDateTime;
          Expediente                 : String;
          ComisionMedica             : String; }

          DecodeDateTime(Citacion, wAnio, wMes, wDia, wHora, wMinutos, wSegundos, wMilisegundos);

          dHora := EncodeTime(wHora, wMinutos, wSegundos, wMilisegundos);
          sHora := Copy(TimeToStr(dHora), 0, 5);

          DoInsertarEventoTM(CODEVENTO_SOLTURNOSRT_ACEPTADO, edSiniestro.Siniestro, edSiniestro.Orden, ComisionMedica, Citacion, '', sHora);
          DoInsertarEventoTM(CODEVENTO_SOLTURNOSRT_CITACION, edSiniestro.Siniestro, edSiniestro.Orden, ComisionMedica, Citacion, '', sHora);

          // Inserto la carta documento a mano porque el evento es automatico
          Do_InsertarCartaDocTM(edSiniestro.Siniestro, edSiniestro.Orden, ComisionMedica);
        end
        else begin   // Si viene con Error, genero el "Rechazado"
          DoInsertarEventoTM(CODEVENTO_SOLTURNOSRT_RECHAZADO, edSiniestro.Siniestro, edSiniestro.Orden, ComisionMedica, Citacion, Error, '');
        end;
      end;
    end
    else
      MsgBox('No se puede insertar el evento 171.' + #13#10 + sErrorNulidad);


  end;
end;


procedure TfrmSegIncapacidades.DoInsertarEventoTM(sCodEvento: string; iSiniestro, iOrden: integer; sComMed: string; dFechaHora: TDateTime; sMensajeError, sHora: string);
var sSql: string;
begin
   sSql := 'art.inca.do_insertarevento(' + SqlInt(iSiniestro) + ',' +
                                           SqlInt(iOrden) + ',' +
                                           IIF((sCodEvento = CODEVENTO_SOLTURNOSRT_CITACION), SqlDate(dFechaHora), ' art.actualdate' ) + ',' +
                                           SqlValue(sCodEvento) + ',' +
                                           ' Null, ' +
                                           SqlValue(Sesion.UserId) + ',' +
                                           ' Null, ' +
                                           IIF((sCodEvento = CODEVENTO_SOLTURNOSRT_CITACION), SqlValue(sComMed), ' Null') + ',' +

                                           IIF ((sCodEvento = CODEVENTO_SOLTURNOSRT_RECHAZADO), SqlValue('Motivo: ' + sMensajeError), ' Null') + ',' +     // Observaciones
                                           ' Null, ' +
                                           ' Null, ' +

                                           IIF((sCodEvento = CODEVENTO_SOLTURNOSRT_CITACION), SqlValue(sHora), 'Null') + ',' +


                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +

                                           ' Null, ' +

                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +
                                           ' Null, ' +

                                           IIF ((sCodEvento = CODEVENTO_SOLTURNOSRT_CITACION), SqlValue(cFIRMANTEFIXEL), ' Null' ) + ');';

  EjecutarStoreST(sSql);
end;

procedure TfrmSegIncapacidades.Do_InsertarCartaDocTM(iSiniestro, iOrden: integer; sComMed: string);
var sSqlCarta, sSql: string;
    iIdFormato, {iDestinatario,} iReca, iEvento :Integer;
    dAltaMedica: TDateTime;
begin
  sSqlcarta := 'SELECT tc_id, tc_destinatario ' +
                ' FROM ctc_textocarta, sin.sei_eventoincapacidad ' +
               ' WHERE tc_codigo = ei_codcartadoc ' +
                 ' AND ei_codigo = ' + sqlValue(CODEVENTO_SOLTURNOSRT_CITACION);

  with GetQuery(sSqlcarta) do
  try
    if not eof then
    begin
      iIdFormato    := Fields[0].AsInteger;
    //  iDestinatario := Fields[1].AsInteger;
    end
    else begin
      iIdFormato    := 0;
    //  iDestinatario := 0;
    end;
  finally
    Free;
  end;

  sSql := 'SELECT ex_altamedica ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SqlInt(iSiniestro) +
            ' AND ex_orden = ' + SqlInt(iOrden);
    if (GetCantRecaidas > 1) and (fpSeleccionRecaida.ShowModal = mrOk) then
      iReca := sdqRecaidasEX_RECAIDA.AsInteger
    else
      iReca := Recaida;

    sSql        := sSql + ' AND ex_recaida = ' + SqlInt(iReca);
    dAltaMedica := ValorSqlDateTime(sSql);



    sSql := 'SELECT MAX(ev_evento) ' +
             ' FROM sev_eventosdetramite ' +
            ' WHERE ev_siniestro = :Sini ' +
              ' AND ev_orden = :Orden ' +
              ' AND ev_recaida = 0 ' +
              ' AND ev_evento >= 0';
    iEvento := ValorSqlIntegerEx(sSql, [iSiniestro, iOrden]);

    DoInsertarCarta(iIdFormato, iSiniestro, iOrden, iReca, cFIRMANTEFIXEL,
                    AREA_INC, False, ART_EMPTY_ID, tdTrabajador, '', iEvento, dAltaMedica, 840);

end;

function TfrmSegIncapacidades.ValidarTurnosMedicosSRT: Boolean;
begin
  Verificar((fraEvento.codigo = CODEVENTO_SOLTURNOSRT) and Es_EmpresaPresidenciaNacion, fraEvento.edcodigo,
            'No se puede ingresar este evento para la empresa Presidencia de la Nación.');

  Result := True;
end;

procedure TfrmSegIncapacidades.tbReenviarPedidoTurnoSRTClick(Sender: TObject);
begin
  DoGenerarTramitesMedicos(CODEVENTO_SOLTURNOSRT, True);
  tbRefrescarClick(Nil);
end;

function TfrmSegIncapacidades.ValidarPorcentajeIntegral: Boolean;   // Plan Integrales
var dPorcIntegral: Double;
    sSql: string;
begin

  if (edPorcIntegral.Text <> '') then
  begin
    Verificar(chkIntegral.Checked and (edPorcIntegral.Text = ''), chkIntegral, 'Debe completar el Porcentaje de la Integral.');

    dPorcIntegral := StrToFloat(edPorcIntegral.Text);

    Verificar(dPorcIntegral > 100, edPorcIntegral, 'El porcentaje no puede ser mayor que 100.');
    Verificar(dPorcIntegral < 50, edPorcIntegral, 'El porcentaje no puede ser menor que 50.');

    // debe ser mayor al porcentaje del dictamen anterior (si es que existe)
    sSql := 'SELECT A.ev_porcintegral Porcent' +
             ' FROM art.sev_eventosdetramite A, sin.sei_eventoincapacidad B ' +
            ' WHERE A.ev_siniestro = :sini ' +
              ' AND A.ev_orden = :orden ' +
              ' AND A.ev_recaida = 0 ' +
              ' AND B.ei_codigo = A.ev_codigo ' +
              ' AND B.ei_tipoevento in (1,6,7) ' +
              ' AND A.ev_evento > 0 ' +
              ' AND A.ev_evento = ( SELECT max(C.ev_evento) maxev ' +
                                    ' FROM art.sev_eventosdetramite C, sin.sei_eventoincapacidad D ' +
                                   ' WHERE C.ev_siniestro = A.ev_siniestro ' +
                                     ' AND C.ev_orden = A.ev_orden ' +
                                     ' AND C.ev_recaida = 0 ' +
                                     ' AND D.ei_codigo = C.ev_codigo ' +
                                     ' AND D.ei_tipoevento in (1,6,7) ' +
                                     ' AND C.ev_evento > 0 ) ';

    with GetQueryEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden]) do
    try
      Verificar((not FieldByName('PORCENT').IsNull) and (dPorcIntegral <= FieldByName('PORCENT').AsFloat), edPorcIntegral, 'El porcentaje Integral debe ser mayor al del último Dictamen.');
    finally
      Free;
    end;

    Result := true;
  end
  else
    Result := true;
end;

function TfrmSegIncapacidades.ValidarSiniestroTurnoSRT: Boolean;
var sSql, sMsgError: string;
    bError: boolean;
begin
  sMsgError := '';
  bError    := false; // tuve que poner esto por un error que esta surgiendo...
  if (fraEvento.Codigo = CODEVENTO_SOLTURNOSRT) then
  begin
     if (sdqBusquedaEX_TIPO.AsString = TA_ENFERMEDAD) then
       sSql := 'SELECT ds_secuelasinc SECUELASINC, ds_srt_catreg SRT_CATREG ' +
                ' FROM sin.sds_detalle_srt_ep A ' +
               ' WHERE A.ds_siniestro = :sini ' +
                 ' AND A.ds_orden = :orden ' +
                 ' AND A.ds_recaida = :recaida ' +
                 ' AND A.ds_fenvio = (SELECT max(B.ds_fenvio) ' +
                                      ' FROM sin.sds_detalle_srt_ep B ' +
                                     ' WHERE B.ds_siniestro = A.ds_siniestro ' +
                                       ' AND B.ds_orden = A.ds_orden ' +
                                       ' AND B.ds_recaida = A.ds_recaida ' +
                                       ' AND B.ds_cod_error is null) '

     else
       sSql := 'SELECT ds_secuelasinc SECUELASINC, ds_srt_catreg SRT_CATREG ' +
                ' FROM sin.sds_detalle_srt_at A ' +
               ' WHERE A.ds_siniestro = :sini ' +
                 ' AND A.ds_orden = :orden ' +
                 ' AND A.ds_recaida = :recaida ' +
                 ' AND A.ds_fenvio = (SELECT max(B.ds_fenvio) ' +
                                      ' FROM sin.sds_detalle_srt_at B ' +
                                     ' WHERE B.ds_siniestro = A.ds_siniestro ' +
                                       ' AND B.ds_orden = A.ds_orden ' +
                                       ' AND B.ds_recaida = A.ds_recaida ' +
                                       ' AND B.ds_cod_error is null) ';

    with GetQueryEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]) do
    try
      if Eof then
      begin
        sMsgError := 'El siniestro no esta aceptado por la SRT';
        bError    := True;
      end
      else if (FieldByName('SECUELASINC').AsString = 'N') then
      begin
        sMsgError := 'No se puede solicitar turno a la SRT:' + #13#10 + 'El Siniestro no posee Secuelas Incapacitantes en su último envío.';
        bError    := True;
      end
      else if (FieldByName('SECUELASINC').IsNull) and (FieldByName('SRT_CATREG').AsString <> 'IN') then
      begin
        sMsgError := 'No se puede solicitar turno a la SRT:' + #13#10 + 'El Siniestro no posee Secuelas Incapacitantes y la Categoría del registro no es "IN", en su último envío.';
        bError    := True;
      end;
    finally
      Free;
    end;
  end;

  Result := not bError;
  Verificar(bError, fraEvento, sMsgError);

  // sdqBusquedaTIPOACC.AsString;

end;

procedure TfrmSegIncapacidades.DoEnviarMailPatCron;
var cuerpo: string;
begin
  if chkPatCron.Checked then
  begin
    cuerpo := 'Siniestro: ' + edSiniestroABM.SinOrdRec + #13#10 +
              'Nombre: ' + Valorsqlex('select tj_nombre from ctj_trabajador, sex_expedientes where ex_idtrabajador = tj_id and ' +
                                      ' ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec', [edSiniestroABM.Siniestro, edSiniestroABM.Orden, edSiniestroABM.Recaida]) + #13#10 +
              'Fecha Rec.: ' + DateToStr(dcFechaRecep.Date) + #13#10 +
              'Fecha Carga: ' + DateToStr(dcFecha.Date);

    EnviarMailBD('laguero@provart.com.ar, ediaz@provart.com.ar', 'Se ha cargado un dictamen correspondiente a Pat. Crónicas',
                 [], cuerpo);
  end;
end;


end.
