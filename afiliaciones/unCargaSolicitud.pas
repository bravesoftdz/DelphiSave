unit unCargaSolicitud;

{-----------------------------------------------------------------------------
  CARGA DE SOLICITUDES DE COBERTURA.
  Autor:       evila
-----------------------------------------------------------------------------}

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Placemnt, artSeguridad, ToolWin, ShortCutControl, StdCtrls, unArtFrame, Mask,
  ToolEdit, DateComboBox, IntEdit, PatternEdit, unfraCuadroTarifario, Db, SDEngine, ArtComboBox, CurrEdit, unfraVendedores, unFraEntidades, unfraContacto, RxDBComb,
  RxLookup, unArt, unArtDbFrame, unFraEmpresa, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unfraStaticActividad, unFraCodigoDescripcion, CardinalEdit, ExtCtrls,
  FormPanel, unFraDomicilioTrab, unArtDBAwareFrame, unFraTelefono, unFraDomicilio, unFraCodDesc, unCustomGridABM, Math, DateTimeFuncs, unfraSucursal, Buttons, DateUtils,
  unFraCanal, Grids, BaseGrid, AdvGrid, RxPlacemnt, AdvObj, RxToolEdit,
  RxCurrEdit;

type
  TDatosCotizacion = record
    Ciiu: Integer;
    Empleados: Integer;
    MasaSalarial: Extended;
    PorcentajeVariable: Extended;
    SumaFija: Extended;
  end;

  TfrmCargaSolicitudes = class(TForm)
    Seguridad: TSeguridad;
    FormStorage1: TFormStorage;
    ShortCutControl: TShortCutControl;
    grbDomicilioLegal: TGroupBox;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
    grbDomicilioPostal: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    edSA_FAX: TPatternEdit;
    edSA_CODAREAFAX: TPatternEdit;
    edSA_CODAREAFAX_POST: TPatternEdit;
    edSA_FAX_POST: TPatternEdit;
    ScrollBox: TScrollBox;
    ToolBar: TToolBar;
    ToolButton4: TToolButton;
    tblLimpiar: TToolButton;
    ToolButton2: TToolButton;
    tblGuardar: TToolButton;
    ToolButton3: TToolButton;
    tblNomina: TToolButton;
    tblEstablecimiento: TToolButton;
    ToolButton9: TToolButton;
    tblImprimir: TToolButton;
    tblSalir: TToolButton;
    ToolButton1: TToolButton;
    grbContacto: TGroupBox;
    tblSRT: TToolButton;
    sdqBuscoNombre: TSDQuery;
    dsBuscoNombre: TDataSource;
    gbAceptar: TGroupBox;
    btnAceptar: TButton;
    fpVendedor: TFormPanel;
    btnAceptarVendedor: TButton;
    btnCancelarVendedor: TButton;
    Bevel1: TBevel;
    Label4: TLabel;
    fraEntidadVendedor: TfraEntidades;
    fpNacion: TFormPanel;
    Bevel2: TBevel;
    Label5: TLabel;
    btnAceptarNacion: TButton;
    btnCancelarNacion: TButton;
    edVendedorNacion: TMaskEdit;
    fraTELEFONO_LEGAL: TfraTelefono;
    fraTELEFONO_POSTAL: TfraTelefono;
    fraDOMICILIO_LEGAL: TfraDomicilio;
    fraDOMICILIOPOSTAL: TfraDomicilio;
    lbeMail: TLabel;
    edSA_MAIL_LEGAL: TEdit;
    Label7: TLabel;
    edSA_MAIL_POSTAL: TEdit;
    gbDatosTitular: TGroupBox;
    gbDatosVendedor: TGroupBox;
    Label8: TLabel;
    edSA_NOMBRE_VENDEDOR: TEdit;
    Label9: TLabel;
    edSA_TITULAR: TEdit;
    Label10: TLabel;
    fraTipoDocumento: TfraStaticCTB_TABLAS;
    Label11: TLabel;
    edNumeroDocumento: TEdit;
    Label12: TLabel;
    fraContacto: TfraContacto;
    gbPersoneriaFirmante: TGroupBox;
    tbDocumentacion: TToolButton;
    fpMasDatos: TFormPanel;
    btnAceptar2: TButton;
    btnCancelar: TButton;
    lbCotizacionCerrada: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    gbFormulariosAnexos: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    tbDatosLegajos: TToolButton;
    lblCantidadHojas: TLabel;
    edSA_HOJASLEGAJOS: TIntEdit;
    fraFirmante: TfraCodigoDescripcion;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    btnRefreshDoc: TBitBtn;
    gbPep: TGroupBox;
    chkPep: TCheckBox;
    chkPepFirma1: TCheckBox;
    chkPepFirma2: TCheckBox;
    cboxPep: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbWorldsys: TLabel;
    cmbSA_SEXO_TITULAR: TComboBox;
    edSA_DIRELECTRONICA_TITULAR: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    edSA_TELEFONO_TITULAR: TEdit;
    Label28: TLabel;
    gbRevision: TGroupBox;
    ToolBar2: TToolBar;
    tbGuardarRevision: TToolButton;
    edUsuarioRevision: TEdit;
    edFechaRevision: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    tblGuardarTemporal: TToolButton;
    tblGuardarPDF: TToolButton;
    SaveDialog: TSaveDialog;
    fpTareaSIC: TFormPanel;
    edObservacionSIC: TMemo;
    btnAceptarSIC: TButton;
    btnCancelarSIC: TButton;
    Label31: TLabel;
    Label32: TLabel;
    GridDocFaltante: TAdvStringGrid;
    ToolBar1: TToolBar;
    ToolButton20: TToolButton;
    tbSalirSic: TToolButton;
    tbCheckSic: TToolButton;
    tbUncheckSic: TToolButton;
    lbRecepcion: TLabel;
    tblVerArchivos: TToolButton;
    btnAdministracionArchivos: TBitBtn;
    fraCargo: TfraCodDesc;
    Panel1: TPanel;
    edFechaRecepcionFaxEmail: TDateComboBox;
    Label25: TLabel;
    fraSA_ORIGEN: TfraStaticCTB_TABLAS;
    lbOrigen: TLabel;
    dcbFechaRecepcionAfiliaciones: TDateComboBox;
    Label6: TLabel;
    edVigencia: TDateComboBox;
    lbFRecepcion: TLabel;
    edFechaSuscripcion: TDateComboBox;
    lbFechaAfiliacion: TLabel;
    edSA_FORMULARIO: TEdit;
    lbNroFormulario: TLabel;
    Panel2: TPanel;
    fraVendedor: TfraVendedores;
    lbVendedor: TLabel;
    fraSucursal: TfraSucursal;
    Label13: TLabel;
    fraEntidad: TfraEntidades;
    lbEntidad: TLabel;
    Label24: TLabel;
    fraCanal: TfraCanal;
    Panel3: TPanel;
    edSA_FEINICACTIV: TDateComboBox;
    lbFInicioAct: TLabel;
    edSA_NROINTERNO: TCardinalEdit;
    Label2: TLabel;
    edSA_CUIT: TMaskEdit;
    lbCUIT: TLabel;
    fraSA_FORMAJ: TfraCodDesc;
    lbFormaJuridica: TLabel;
    cmbSA_NOMBRE: TArtComboBox;
    lbRazonSocial: TLabel;
    fraSA_SUSS: TfraStaticCTB_TABLAS;
    lbSUSS: TLabel;
    fraSA_ARTANTERIOR: TfraStaticCodigoDescripcion;
    lbARTAnterior: TLabel;
    lbSector: TLabel;
    fraSA_MOTIVOALTA: TfraStaticCTB_TABLAS;
    lbMotivoAlta: TLabel;
    fraSA_SECTOR: TfraStaticCTB_TABLAS;
    edFranquicia: TCurrencyEdit;
    Label1: TLabel;
    fraEstado: TfraStaticCTB_TABLAS;
    Label3: TLabel;
    lbHolding: TLabel;
    fraSA_HOLDING: TfraCodDesc;
    Panel4: TPanel;
    lbObservacion: TLabel;
    edSA_OBSERVACIONES: TMemo;
    Panel5: TPanel;
    edSA_OBSERVACIONES_POST: TMemo;
    lbSA_OBSERVACIONES: TLabel;
    pnlPCP: TPanel;
    GroupBox1: TGroupBox;
    Bevel3: TBevel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edCantTrabMenosDe12: TIntEdit;
    edCantTrabDe12a16: TIntEdit;
    edCantTrabMasDe16: TIntEdit;
    Label40: TLabel;
    pnlCuadroTarifario: TPanel;
    grbCuadroTarifario: TGroupBox;
    lbCIIU: TLabel;
    ciiu3: TLabel;
    fraCuadroTarifario: TfraCuadroTarifario;
    fraCIIU2: TfraStaticActividad;
    fraCIIU3: TfraStaticActividad;
    tbPCP: TToolButton;
    lbPcp: TLabel;
    edAlicuotaMenosDe12: TCurrencyEdit;
    edAlicuotaDe12a16: TCurrencyEdit;
    edAlicuotaMasDe16: TCurrencyEdit;
    edAlicuota: TCurrencyEdit;
    edValorMenosDe12: TCurrencyEdit;
    edValorDesde12a16: TCurrencyEdit;
    edValorMasDe16: TCurrencyEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    tblCasasParticulares: TToolButton;
    procedure tblSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblGuardarClick(Sender: TObject);
    procedure tblLimpiarClick(Sender: TObject);
    procedure edFechaSuscripcionExit(Sender: TObject);
    procedure tblEstablecimientoClick(Sender: TObject);
    procedure edVigenciaExit(Sender: TObject);
    procedure tblNominaClick(Sender: TObject);
    procedure tblSRTClick(Sender: TObject);
    procedure tblImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbSA_NOMBREDropDown(Sender: TObject);
    procedure cmbSA_NOMBRECloseUp(Sender: TObject);
    procedure fraVendedorcmbDescripcionDropDown(Sender: TObject);
    procedure fraEntidadExit(Sender: TObject);
    procedure fraVendedorExit(Sender: TObject);
    procedure edSA_CUITKeyPress(Sender: TObject; var Key: Char);
    procedure edSA_FORMULARIOKeyPress(Sender: TObject; var Key: Char);
    procedure edSA_CUITExit(Sender: TObject);
    procedure edSA_FORMULARIOExit(Sender: TObject);
    procedure edSA_NROINTERNOExit(Sender: TObject);
    procedure edSA_NROINTERNOKeyPress(Sender: TObject; var Key: Char);
    procedure btnCrearRelacionClick(Sender: TObject);
    procedure btnCancelarVendedorClick(Sender: TObject);
    procedure btnAceptarVendedorClick(Sender: TObject);
    procedure btnCancelarNacionClick(Sender: TObject);
    procedure btnAceptarNacionClick(Sender: TObject);
    procedure fpNacionEnter(Sender: TObject);
    procedure fraSA_FORMAJExit(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure CambiaEntidad(Sender: TObject);
    procedure grbDomicilioLegalExit(Sender: TObject);
    procedure tbDocumentacionClick(Sender: TObject);
    procedure tbDatosLegajosClick(Sender: TObject);
    procedure fraFirmanteExit(Sender: TObject);
    procedure btnRefreshDocClick(Sender: TObject);
    procedure CambiaOrigen(Sender: TObject);
    procedure edNumeroDocumentoExit(Sender: TObject);
    procedure tbGuardarRevisionClick(Sender: TObject);
    procedure tblGuardarTemporalClick(Sender: TObject);
    procedure tblGuardarPDFClick(Sender: TObject);
    procedure fraSA_SECTORExit(Sender: TObject);
    procedure btnAceptarSICClick(Sender: TObject);
    procedure btnCancelarSICClick(Sender: TObject);
    procedure fpTareaSICShow(Sender: TObject);
    procedure tbSalirSicClick(Sender: TObject);
    procedure tbCheckSicClick(Sender: TObject);
    procedure tbUncheckSicClick(Sender: TObject);
    procedure fraSA_MOTIVOALTAExit(Sender: TObject);
    procedure tblVerArchivosClick(Sender: TObject);
    procedure btnAdministracionArchivosClick(Sender: TObject);
    procedure tbPCPClick(Sender: TObject);
    procedure edCantTrabMenosDe12Change(Sender: TObject);
    procedure edCantTrabDe12a16Change(Sender: TObject);
    procedure edCantTrabMasDe16Change(Sender: TObject);
    procedure tblCasasParticularesClick(Sender: TObject);
    procedure chkPepFirma1Click(Sender: TObject);
  private
    FCargarNomina: Boolean;
    FContratoAnterior: Integer;
    FCuit: String;
    FDatosCotizacion: TDatosCotizacion;
    FEsModificacion, FEsPCP: Boolean;
    FFechaBaja: TDateTime;
    FIdFormulario: TTableId;
    FModoABM: TModoABM;
    FMotivoAlta: Integer; //guardo para verificar si lo cambiaron al guardar
    FReafiliacion: Boolean;
    FPresentoRGRL : String;
    FClausulasAdicionales : String;
    FTextoSIC : String;
    FFechaAlta : TDate;

    function EsBancoNacion(Codigo: String): Boolean;
    function ExisteFormulario(ID: string): Boolean;
    function GetEstadoActual(const aId: Integer): String;
    function isEstaCargado(AControl: TWinControl; aCheckEstado: Boolean; sFormulario, sCuit: String; sNroInterno: String = ''): Boolean;
    function isValidar: Boolean;
    function isFechaSuscripcionEnBaseOk(const aId: TTableID): Boolean;
    function ObtenerEntidad(EV_ID: String): Integer;
    function ObtenerEV_ID(Entidad, Vendedor: Integer): Integer;
    function ObtenerIDFormulario(FO_FORMULARIO: String): String;
    function ObtenerVendedor(EV_ID: String): Integer;
    function TarifaVerificada(const aIdSolicitudAfiliacion: Integer; const aCuit: String; var aSolicitudCotizacionId: Integer; var aMotivosNoAprobacionTarifa: String;
                              const aMasaTotal, aAlicuotaPesos, aAlicuotaPorcentaje, aTotalEmpleados: Extended): Boolean;
    function VerificarDocumentacionFaltante(const aFormaJuridica: String; const aCaracterFirma, aIdDocumentoAfi: Integer; const aPresento, aFirmaTitular, aFirmaVendedor: String): String;
    function ExisteIdDatosTemporales(const iId: TTableID): Boolean;
    function GetIdCotizacion(const iId: TTableID): Integer;
    function GetIdReafiliacion(const iId: TTableID): Integer;
    function GetLugarSuscripcion(const iId: TTableID): String;
    function GetDocumentacion(const aTexto, aTipo: String): String;
    function ParceObservacion(const aTexto: String): String;
    function DocWasUnchecked (const aDoc: String): boolean;
    function isEstablecerUsuarioAFI(const aId: TTableID): Boolean;
    function TieneRgrl: Boolean;
    function GetIdRenglonPCP(const aRenglon: Integer) : TTableId;
   // function GetCantidadDocFaltante(const aId: TTableID): Integer;
   // function ExisteTarea355SicActiva(const aIdFormulario: Integer): boolean;

    procedure ActualizarDocumentacionFaltante;
    procedure BloqueaTarifas(Valor: Boolean);
    procedure BloquearControlesPDF(const aActivados: Boolean);
    procedure BuscarEnWorldSys(const aNumeroDoc: Integer);
    procedure CambiaMotivoAlta(Sender: TObject);
    procedure CambiaSector(Sender: TObject);
    procedure CargarDatosDocumentacion(const aIdSolicitud: Integer);
    procedure CargarDatosFromContrato(const aContrato: Integer);
    procedure CargarDatosPep(const aIdSolicitud: Integer);
    procedure CargarEstablecimientosFromContrato(const aContrato, aIdSolicitud: Integer);
    procedure CargarNominaFromContrato(const aContrato, aIdSolicitud: Integer);
    procedure CargarTelefonosFromContacto;
    procedure CargarTelefonosFromContrato(const aContrato: Integer);
    procedure CargarTelefonosFromEstablecimientos(const aEstOld, aEstablecimientoId: Integer);
    procedure CargarUsuarioRevision(const aIdSolicitud: Integer);
    procedure ClearControls;
//    procedure ClickFirmaFaltante(Sender: TObject);
    procedure ClickFirmaPresento(Sender: TObject);
    procedure ClickFirmaTitular(Sender: TObject);
    procedure ClickFirmaVendedor(Sender: TObject);
    procedure CrearComponentesDocumentacion;
    procedure CrearRelacion;
    procedure CrearVendedor;
    procedure DoGrabaEstablecimiento(iIDFORMULARIO: Integer);
    procedure DoGrabaTelefonosEstablecimiento(const iEstablecimientoId, iFormularioId: Integer);
    procedure DoGuardarSolicitud(const IsRevision: Boolean);
    procedure DoGuardarSolicitudTemporal(const isUpdate:Boolean);
    procedure DoPrepararSolicitudTemporal;
    procedure GetTarifaFromCotizacion(const aNumeroFormulario: String);
    procedure GuardarDatosDocumentacion(const aIdSolicitud: Integer; const aCommit: Boolean);
    procedure GuardarDatosPep(const aIdSolicitud: Integer);
    procedure LiberarComponentesDocumentacion;
    procedure VerificarDocumentacionFaltanteFila(const aTag: Integer);
    procedure FiltrarFirmante;
    procedure SetEstadoBotonPDF;
    procedure GenerarPDFSolicitudAfiliacion;
    procedure DoEliminarPDFTemporal(const aIdSolicitud: Integer);
    procedure MensajeCampaniaF931(const aId: TTableID);
    procedure TelefonosModoTemporal(aEsTemporal: boolean);
    procedure CopiarTelefonosTemporalesProd;
    procedure CopiarTelefonosProdTemporales;
    procedure DoTareaSic(aIdFormulario: Integer);
    procedure AddText(const aText: String; const StrikedOut, Checked : Boolean);
    procedure LoadDocumentos(var aDocs, aDocsActuales : TStringList);
    procedure LoadDocumentosFaltantes(const aIdSolicitud: TTableId; var aDocs: TStringList);
    procedure CompareAndFillDocumentosFaltantes(const aDocs, aDocsActualesSic, aDocumentosFaltantes: TStringList);
    procedure SicListCheckState(aChecked: Boolean);
    procedure ClearFpSic;
    procedure CerrarTarea355SiExiste(const aIdFormulario: integer); //Si existe una tarea 355 y no queda documentacion faltante cerrarla
    procedure CalcularArchivos;
    procedure AnularMailAutorizacion;
    procedure PersonalCasasParticularesVisible(const aBoolean: Boolean);
    procedure CargarCostosPCP;
    procedure RecalcularCostosPCP;
    procedure GuardarCostosPCP;
    procedure CargarDatosPCP(const aIdSolicitud: TTableId);
  public
    iID_Modificacion: TTableID;

    function DoCargaDatosSolicitud(iID: TTableID): Boolean;
    function DoCargaDatosSolicitudOriginal(const iId: TTableID): Boolean;
    function DoCargaDatosSolicitudTemporal(const iId: TTableID): Boolean;

    procedure Mostrar(const aEsAlta: Boolean);
  end;

var
  frmCargaSolicitudes: TfrmCargaSolicitudes;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, CUIT, General, AnsiSQL, SqlFuncs, unCargaEstablecimiento, unCargaTrabajador, unCargaSRT, unRptSolicitud, VCLExtra,
  unAfiliaciones, unCustomDataModule, unSesion, Strfuncs, Internet, unComisiones, unDatosLegajosDigitalizacion, Variants, unQRSolicitudAfiliacion, StrUtils,
  unAdministracionArchivosRecepcion, unComunes, unPCP, unCargaLugarDeTrabajo;

const
  SIC_DOCU_FALTANTE: Integer = 354;
  SIC_RECEP_FALTANTE = 355;
  SIC_MOTIVO_INGRESO: Integer = 11;

{$R *.DFM}

procedure TfrmCargaSolicitudes.tblSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaSolicitudes.FormCreate(Sender: TObject);
begin
  inherited;

  lbWorldSys.Caption := '';

  with fraFirmante do
  begin
    TableName   := 'acf_caracterfirma';
    FieldID     := 'cf_id';
    FieldCodigo := 'cf_id';
    FieldDesc   := 'cf_caracter';
    FieldBaja   := 'cf_fechabaja';
    ShowBajas   := False;
  end;

  fraSA_ORIGEN.Clave          := 'ORSOL';
  fraSA_ORIGEN.ExtraCondition := ' AND tb_codigo NOT IN (''3'', ''4'')';
  fraSA_ORIGEN.OnChange       := CambiaOrigen;

 // fraSA_FORMAJ.Clave          := 'FJURI';
  fraSA_FORMAJ.ExtraCondition := ' AND tb_codigo <> 999 AND TB_CLAVE = ''FJURI'' ';

  fraSA_MOTIVOALTA.Clave    := 'MOTIA';
  fraSA_MOTIVOALTA.OnChange := CambiaMotivoAlta;
  CambiaMotivoAlta(nil);

  fraSA_SUSS.Clave := 'SUSS';

  fraSA_SECTOR.Clave    := 'SECT';
  fraSA_SECTOR.OnChange := CambiaSector;

  fraEstado.Clave := 'ESSOL';
  LockControls(fraEstado, True);

  fraCanal.FiltraUsuario := False;
  LockControl(fraCanal, True);

  fraEntidad.CaseSensitive  := False;
  //fraEntidad.ExtraCondition := ' AND en_entramite = ''N'' ';
  fraEntidad.OnChange       := CambiaEntidad;

  fraVendedor.CaseSensitive  := False;
  fraVendedor.ExtraCondition := ' AND ev_fechabaja IS NULL ';

  fraSA_ARTANTERIOR.TableName      := 'aar_art';
  fraSA_ARTANTERIOR.FieldID        := 'ar_id';
  fraSA_ARTANTERIOR.FieldCodigo    := 'ar_id';
  fraSA_ARTANTERIOR.FieldDesc      := 'ar_nombre';
  fraSA_ARTANTERIOR.FieldBaja      := 'ar_fechabaja';
  fraSA_ARTANTERIOR.ShowBajas      := False;  //tk 56234

  fraTipoDocumento.Clave     := 'TDOC';
  fraTipoDocumento.ShowBajas := False;

  {fraCargo.Clave          := 'CARGO';
  fraCargo.ExtraCondition := ' AND tb_especial2 = ''SOLO_FIRMANTE'' ';
  fraCargo.ShowBajas      := False;  }

  fraEntidadVendedor.FiltraBanco := True;

  iID_Modificacion := ART_EMPTY_ID;
  tbDocumentacion.Enabled := False;
  edFranquicia.Value := 10;

  ScrollBox.VertScrollBar.Position := 0;

  ClearControls;
  CrearComponentesDocumentacion;
  LockControls(grbDomicilioPostal, True);

  SetEstadoBotonPDF;
  PersonalCasasParticularesVisible(False);

  CargarCostosPCP;
end;

procedure TfrmCargaSolicitudes.tblGuardarClick(Sender: TObject);
begin
  grbDomicilioLegalExit(Sender);
  if (fraSA_MOTIVOALTA.Value = '06') or (isValidar) then //Si son sorteos por orden de EJV no se hacen las validaciones.
    DoGuardarSolicitud(False); //no es revision
end;

function TfrmCargaSolicitudes.isValidar: Boolean;
var
  sSql: String;
begin
  Verificar(edFechaRecepcionFaxEmail.Date > Date, edFechaRecepcionFaxEmail, 'La fecha de recepción de Fax/e-Mail no puede ser posterior al día de hoy.');
  Verificar((Trim(edSA_FORMULARIO.Text) <> '') and ExisteFormulario(Trim(edSA_FORMULARIO.Text)), edSA_FORMULARIO, 'El Nº de formulario ya existe.');
  Verificar(fraSA_ORIGEN.IsEmpty, fraSA_ORIGEN.edCodigo, 'El origen de la solicitud es obligatorio.');
  Verificar(edFechaSuscripcion.IsEmpty, edFechaSuscripcion, 'La fecha de suscripción es obligatoria.');
  Verificar(edFechaSuscripcion.Date < StrToDate('01/07/1996'), edFechaSuscripcion, 'La fecha de suscripción no es correcta.');
  //tk 45250  despues hay que verlo por ahora tiene 2meses a futuro. En suspenso, segun la fecha de cierre de la cotizacion, hay que sumarle 30 o 60 segun el canal
  //pero no estoy seguro, hay que preguntarle a VILA a ver si se acuerda. En suscripciones en consulta de cotizacion
  // hice un campo que se llama Dias para vencimiento. 
  Verificar(edFechaSuscripcion.Date > AddMonths(DATE, 2), edFechaSuscripcion, 'La fecha de suscripción no es correcta.');
  Verificar(fReafiliacion and (edFechaSuscripcion.Date < fFechaBaja), edFechaSuscripcion, 'La fecha de suscripción debe ser superior a la fecha de baja del contrato anterior.');
  Verificar(edVigencia.IsEmpty, edVigencia, 'La vigencia es obligatoria.');
  Verificar(edVigencia.Date < StrToDate('01/01/1996'), edVigencia, 'La vigencia no puede ser anterior al 01/01/1996.');
  Verificar(edVigencia.Date < edFechaSuscripcion.Date, edVigencia, 'La vigencia no puede ser anterior a la fecha de suscripción.');

  if (DBDate - edVigencia.Date) > 60 then
    if not MsgAsk('La vigencia tiene mas de dos meses de antigüedad. ¿ Está seguro que la fecha es correcta ?') then
      Abort;

  if fraSA_ORIGEN.Codigo <> '2' then // Tk 29639 no validar fecha cuando es recepcion por fax.
  begin
    Verificar(dcbFechaRecepcionAfiliaciones.IsEmpty, dcbFechaRecepcionAfiliaciones, 'El campo F. Recep. Afiliaciones es obligatorio.');
    //Verificar(dcbFechaRecepcionAfiliaciones.Date < edFechaSuscripcion.Date, dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede ser menor a la fecha de suscripción.');
    //definido por GGROSSI viernes 21/03/2014 lo de 5 dias habiles. 
    Verificar(dcbFechaRecepcionAfiliaciones.Date < DateOf(FFechaAlta), dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede ser menor a la fecha de Alta (' + DateToStr(FFechaAlta) + ').');
    if (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'ATCLI') and (Sesion.Sector <> 'AFINOM') then //si es delegacion
      Verificar(dcbFechaRecepcionAfiliaciones.Date < CalcDiasHabiles(Date,-5) , dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede ser anterior a 5 hábiles.');
  end;
   //esta validacion primero era "recepcion no puede superar el dia de hoy" luego "recepcion no puede superar fecha de suscripcion", y ahora "no puede superar 6 meses el dia de hoy"  //Cambios de Vila y Grossi
   //Verificar(dcbFechaRecepcionAfiliaciones.Date > AddMonths(Date, 6), dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede superar la fecha actual más 6 meses.');
   //Pedido de grossi 28/01/2014 La fecha de afiliaciones no puede superar el dia de hoy.. tk 54211  //Este tk es consecuencia de una Auditoria. No cambiar aunque lo pida Mileo
   Verificar(dcbFechaRecepcionAfiliaciones.Date > Date, dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no puede ser posterior a hoy.');

  sSql :=
    'SELECT en_requieresucursal' +
     ' FROM xen_entidad' +
    ' WHERE en_id = :id';
  Verificar((ValorSqlEx(sSql, [fraEntidad.Value]) = 'S') and (fraSucursal.IsEmpty), fraSucursal.edCodigo, 'La sucursal es obligatoria.');

  Verificar(fraVendedor.IsSelected and fraEntidad.IsEmpty, fraEntidad.edCodigo, 'La entidad es obligatoria si elige un vendedor.');
  Verificar(fraVendedor.IsEmpty and fraEntidad.IsSelected, fraVendedor.edCodigo, 'El vendedor es obligatorio si elige una entidad.');
  Verificar(cmbSA_NOMBRE.Text = '', cmbSA_NOMBRE, 'La Razón Social es obligatoria.');
  Verificar(fraSA_FORMAJ.IsEmpty, fraSA_FORMAJ.edCodigo, 'El campo Forma Jurídica es obligatorio.');
  Verificar(edSA_CUIT.Text = '', edSA_CUIT, 'La C.U.I.T. es obligatoria.');
  Verificar(not IsCUIT(edSA_CUIT.Text), edSA_CUIT, 'La C.U.I.T. es incorrecta.');
  Verificar(fraSA_MOTIVOALTA.IsEmpty, fraSA_MOTIVOALTA.edCodigo, 'El motivo de alta es obligatorio.');
  //Verificar((fraSA_ARTANTERIOR.IsSelected) and (fraSA_MOTIVOALTA.Value <> '02') and (fraSA_MOTIVOALTA.Value <> '05'), fraSA_MOTIVOALTA.edCodigo, 'Si ingresa la ART anterior entonces el motivo de alta debe ser "02" o "05".');
  Verificar((fraSA_ARTANTERIOR.IsSelected) and (fraSA_MOTIVOALTA.Value <> '02'), fraSA_MOTIVOALTA.edCodigo, 'El motivo de Alta no es Traspaso Ingreso, el campo ART Anterior debe estar en blanco, Verificar Extranet.');

  Verificar((fraSA_MOTIVOALTA.Value = '02') and fraSA_ARTANTERIOR.IsEmpty, fraSA_ARTANTERIOR.edCodigo, 'Si ingresa el motivo de alta "02" entonces el campo ART anterior es obligatorio.');
  Verificar(((not edSA_FEINICACTIV.isEmpty) and (edSA_FEINICACTIV.Date > DATE)), edSA_FEINICACTIV, 'La fecha de inicio de Actividad no puede ser posterior a la fecha de alta.');
  Verificar(edFranquicia.Value < 0, edFranquicia, 'El valor de la franquicia tiene que ser mayor o igual a 0 cero.');

  //tk 60119
  Verificar(fraSA_SECTOR.isEmpty, fraSA_SECTOR,' El Sector no puede quedar vacío');
  Verificar(fraSA_SUSS.IsEmpty, fraSA_SUSS, 'El SUSS no puede queda vacío');
  //**

  if not fraDOMICILIO_LEGAL.IsValid then
    Abort;

  if fraDOMICILIO_LEGAL.Numero = '' then
    fraDOMICILIO_LEGAL.Numero := 'S\N';

  if fraDOMICILIO_LEGAL.CodigoPostal <> '' then
    Verificar(fraDOMICILIO_LEGAL.Localidad = '', fraDOMICILIO_LEGAL,' El campo Localidad quedó vacío.');

  if fraDOMICILIO_LEGAL.Localidad = '' then
    InfoHint(fraDOMICILIO_LEGAL.lbLocalidad, 'El campo Localidad quedó vacío.', False, 'Información', blnInfo, 3, False);

  if ((fraSA_SECTOR.IsSelected) and (fraSA_SECTOR.Value = '4')) then
    Verificar(fraSA_SUSS.Value <> '1', fraSA_SUSS, 'Si el sector es Privado, entonces la empresa debe ser SUSS.');

  if edSA_MAIL_LEGAL.Text <> '' then
    Verificar(not IsEMails(edSA_MAIL_LEGAL.Text), edSA_MAIL_LEGAL, 'Por favor ingrese una dirección de e-mail válida.');


  if not FEsPCP then
  begin
    Verificar(fraCuadroTarifario.edTOTEMPLEADOS.Value <= 0, fraCuadroTarifario.edTOTEMPLEADOS, 'Debe especificar la cantidad de empleados de la empresa.');
    Verificar(fraCuadroTarifario.edMASATOTAL.Value < 240, fraCuadroTarifario.edMASATOTAL, 'La masa salarial no puede ser inferior a los $240.');
    fraCuadroTarifario.isValid(False);
  end
  else
  begin
    PersonalCasasParticularesVisible(True); //Setea los valores correctos al cuadro tarifario
    Verificar(fraCuadroTarifario.edTOTEMPLEADOS.Value = 0, edCantTrabMenosDe12, 'La suma de personal no puede ser 0');
  end;

  if not fraDomicilioPostal.IsValid then
    Abort;

  if edSA_MAIL_POSTAL.Text <> '' then
    Verificar(not IsEMails(edSA_MAIL_POSTAL.Text), edSA_MAIL_POSTAL, 'Por favor ingrese una dirección de e-mail válida.');

  if fraContacto.Email <> '' then
    if not Verificar(not IsEMails(fraContacto.Email), nil, 'Por favor ingrese una dirección de e-mail válida.') then
      fraContacto.FocusEmail;
  Verificar(fraContacto.Cargo = '', fraContacto.FindChildControl('fraCargo'), 'El cargo del Responsable es obligatorio.');

  // Titular..
  Verificar((edSA_TITULAR.Text = ''), edSA_TITULAR, 'El apellido y nombre del titular es obligatorio.');
  Verificar(fraCargo.IsEmpty, fraCargo.edCodigo, 'El cargo del titular es obligatorio.');
  Verificar(fraFirmante.IsEmpty, fraFirmante.edCodigo, 'El carácter del firmante de la solicitud es obligatorio.');
  Verificar(cmbSA_SEXO_TITULAR.ItemIndex = -1, cmbSA_SEXO_TITULAR, 'El sexo del titular es obligatorio.');

  Result := True;
end;

procedure TfrmCargaSolicitudes.tblLimpiarClick(Sender: TObject);
begin
  ClearControls;
  LiberarComponentesDocumentacion;
  CrearComponentesDocumentacion;
  FiltrarFirmante;
  fraSA_ORIGEN.edCodigo.SetFocus;
  LockControls(edSA_FORMULARIO, False);
  
end;

procedure TfrmCargaSolicitudes.edCantTrabDe12a16Change(Sender: TObject);
begin
  RecalcularCostosPCP
end;

procedure TfrmCargaSolicitudes.edCantTrabMasDe16Change(Sender: TObject);
begin
  RecalcularCostosPCP;
end;

procedure TfrmCargaSolicitudes.edCantTrabMenosDe12Change(Sender: TObject);
begin
  RecalcularCostosPCP;
end;

procedure TfrmCargaSolicitudes.edFechaSuscripcionExit(Sender: TObject);
begin
  fraCuadroTarifario.FechaAfiliacion := edFechaSuscripcion.Date;
end;

procedure TfrmCargaSolicitudes.DoGuardarSolicitud(const IsRevision: Boolean);
var
  bGrabaSQL: Boolean; // Esta constante se usa para indicar que deseo grabar o actualizar un ID en la tabla AFO_FORMULARIO
  iDiasSolicitud: Integer;
  iIDProvisorio: Integer;
  iNroInterno: TTableID;
  iSA_ID: Integer;
  iSolicitudCotizacionId: Integer;
  sEstado: String;
  sMotivosNoAprobacionTarifa: String;
  sSql: String;
  sSqlFormulario: String;
  sSqlTrans: TSql;
begin
  //ActualizarDocumentacionFaltante;  //No verificar al guardar

  sSqlTrans := TSQL.Create('asa_solicitudafiliacion');

  sSqlTrans.Fields.Add('sa_idactividad', fraCuadroTarifario.Actividad);

  if fraCIIU2.Value <> 0 then
    sSqlTrans.Fields.Add('sa_idactividad2', fraCIIU2.Value)
  else
    sSqlTrans.Fields.Add('sa_idactividad2', 'NULL', False);

  if fraCIIU3.Value <> 0 then
    sSqlTrans.Fields.Add('sa_idactividad3', fraCIIU3.Value)
  else
    sSqlTrans.Fields.Add('sa_idactividad3', 'NULL', False);

  sSqlTrans.Fields.Add('sa_area', fraContacto.Area);

  if fraSA_ARTANTERIOR.IsSelected then
    sSqlTrans.Fields.Add('sa_idartanterior', fraSA_ARTANTERIOR.Value)
  else
    sSqlTrans.Fields.Add('sa_idartanterior', 'NULL', False);

  sSqlTrans.Fields.Add('sa_cargo',                   fraContacto.Cargo);
  sSqlTrans.Fields.Add('sa_codareafax',              edSA_CODAREAFAX.Text);
  sSqlTrans.Fields.Add('sa_codareafax_post',         edSA_CODAREAFAX_POST.Text);
  sSqlTrans.Fields.Add('sa_codareafax_cont',         fraContacto.AreaFax);
  sSqlTrans.Fields.Add('sa_contacto',                fraContacto.Contacto);
  sSqlTrans.Fields.Add('sa_cuit',                    edSA_CUIT.Text);
  sSqlTrans.Fields.Add('sa_direlectronica_cont',     fraContacto.Email);
  sSqlTrans.Fields.Add('sa_fax_cont',                fraContacto.Fax);
  sSqlTrans.Fields.Add('sa_fax',                     edSA_FAX.Text);
  sSqlTrans.Fields.Add('sa_mail_legal',              edSA_MAIL_LEGAL.Text);
  sSqlTrans.Fields.Add('sa_fax_post',                edSA_FAX_POST.Text);
  sSqlTrans.Fields.Add('sa_mail_postal',             edSA_MAIL_POSTAL.Text);

  sSqlTrans.Fields.Add('sa_titular',                 edSA_TITULAR.Text);
  sSqlTrans.Fields.Add('sa_telefono_titular',        edSA_TELEFONO_TITULAR.Text);
  sSqlTrans.Fields.Add('sa_sexo_titular',            IIF(cmbSA_SEXO_TITULAR.ItemIndex = 0, 'F', 'M'), dtString);
  sSqlTrans.Fields.Add('sa_direlectronica_titular',  edSA_DIRELECTRONICA_TITULAR.Text);
  sSqlTrans.Fields.Add('sa_tipo_documento_titular',  fraTipoDocumento.Value);
  sSqlTrans.Fields.Add('sa_documento_titular',       edNumeroDocumento.Text);
  sSqlTrans.Fields.Add('sa_cargo_titular',           fraCargo.Codigo);
  sSqlTrans.Fields.Add('sa_idcaracterfirma',         fraFirmante.Value);
  sSqlTrans.Fields.Add('sa_nombre_vendedor',         edSA_NOMBRE_VENDEDOR.Text);

  if IsRevision then
  begin
    sSqlTrans.Fields.Add('sa_usurevision',   Sesion.UserID);
    sSqlTrans.Fields.Add('sa_fecharevision', DBDateTime);
  end
  else
  begin  //se comenta por pedido de CALLO Y GROSSI
    {sSqlTrans.Fields.Add('SA_USUREVISION',         'NULL', False);
    sSqlTrans.Fields.Add('SA_FECHAREVISION',       'NULL', False);  }
    if (edUsuarioRevision.Text <> '') and (edFechaRevision.Text <> '') then
    begin
      sSqlTrans.Fields.Add('sa_usurevision',   Sesion.UserID);
      sSqlTrans.Fields.Add('sa_fecharevision', DBDateTime);
    end;
  end;

  sSqlTrans.Fields.Add('sa_fechaafiliacion',         edFechaSuscripcion.Date);
  sSqlTrans.Fields.Add('sa_fechavigenciadesde',      edVigencia.Date);
  sSqlTrans.Fields.Add('sa_fechavigenciahasta',      GetFechaVigenciaHasta(iID_Modificacion, edVigencia.Date));
  sSqlTrans.Fields.Add('sa_fecharecepcionsectorafi', dcbFechaRecepcionAfiliaciones.Date);
  sSqlTrans.Fields.Add('sa_fecharecepcionfaxemail',  edFechaRecepcionFaxEmail.Date);

  if not edSA_FEINICACTIV.IsEmpty then
    sSqlTrans.Fields.Add('sa_feinicactiv',           edSA_FEINICACTIV.Date);

  sSqlTrans.Fields.Add('sa_formaj',                  fraSA_FORMAJ.Codigo);
  sSqlTrans.Fields.Add('sa_idgrupoeconomico',        fraSA_HOLDING.Value);
  sSqlTrans.Fields.Add('sa_identidadvendedor',       ObtenerEV_ID(fraEntidad.Value, fraVendedor.Value), True);
  sSqlTrans.Fields.Add('sa_idsucursal',              fraSucursal.Value, True);
  sSqlTrans.Fields.AddExtended('sa_masatotal',       fraCuadroTarifario.edMASATOTAL.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.Add('sa_motivoalta',              fraSA_MOTIVOALTA.edCodigo.Text);
  sSqlTrans.Fields.Add('sa_nivel',                   fraCuadroTarifario.edNIVEL.Text);
  sSqlTrans.Fields.Add('sa_nombre',                  cmbSA_NOMBRE.Text);
  sSqlTrans.Fields.Add('sa_observaciones',           edSA_OBSERVACIONES.Text);
  sSqlTrans.Fields.Add('sa_observaciones_post',      edSA_OBSERVACIONES_POST.Text);

  //TARIFA
  sSqlTrans.Fields.AddExtended('sa_porcdescnivel',   fraCuadroTarifario.edPORCDESCNIVEL.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcdescvolumen', fraCuadroTarifario.edPORCDESCVOLUMEN.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcmasatarifa',  fraCuadroTarifario.edPORCMASATARIFA.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_sumafijatarifa',  fraCuadroTarifario.edSUMAFIJATARIFA.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_alicuotaporc',    fraCuadroTarifario.edALICUOTAPORC.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_alicuotapesos',   fraCuadroTarifario.edALICUOTAPESOS.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_sumafija',        fraCuadroTarifario.SumaFija, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_porcmasa',        fraCuadroTarifario.PorcMasa, ALL_DECIMALS, False);

  //Resetea los valores correspondientes al resto de la tarifa
  sSqlTrans.Fields.AddExtended('sa_recargosin_montofijo', 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_recargosin'          , 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_recargosin_sobrefijo', 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_recargoesp'          , 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('sa_recargoesp_sobrefijo', 0, ALL_DECIMALS, False);

  //FIN TARIFA
  sSqlTrans.Fields.Add('sa_sector',       fraSA_SECTOR.Value);
  sSqlTrans.Fields.Add('sa_suss',         fraSA_SUSS.edCodigo.Text);
//  sSqlTrans.Fields.Add('sa_tipodetarifa', fraCuadroTarifario.fraTIPOTARIFA.Value);
  sSqlTrans.Fields.Add('sa_totempleados', fraCuadroTarifario.edTOTEMPLEADOS.Value);
  sSqlTrans.Fields.Add('sa_franquicia',   edFranquicia.Value);
  sSqlTrans.Fields.Add('sa_origen',       fraSA_ORIGEN.edCodigo.Text);

  //DIRECCION LEGAL
  sSqlTrans.Fields.Add('sa_cpostal',   fraDOMICILIO_LEGAL.CodigoPostal);
  sSqlTrans.Fields.Add('sa_calle',     fraDOMICILIO_LEGAL.Calle);
  sSqlTrans.Fields.Add('sa_localidad', fraDOMICILIO_LEGAL.Localidad);
  if fraDOMICILIO_LEGAL.Provincia <> '' then
    sSqlTrans.Fields.Add('sa_provincia', String(ValorSqlEx('SELECT pv_codigo' +
                                                            ' FROM cpv_provincias' +
                                                           ' WHERE pv_descripcion = :descripcion',
                                         [fraDOMICILIO_LEGAL.Provincia], 'NULL')), False);

  sSqlTrans.Fields.Add('sa_cpostala',     fraDOMICILIO_LEGAL.CPA);
  sSqlTrans.Fields.Add('sa_departamento', fraDOMICILIO_LEGAL.Departamento);

  if Trim(fraDOMICILIO_LEGAL.Numero) = '' then
    fraDOMICILIO_LEGAL.Numero := 'S/N';

  sSqlTrans.Fields.Add('sa_numero', fraDOMICILIO_LEGAL.Numero);
  sSqlTrans.Fields.Add('sa_piso',   fraDOMICILIO_LEGAL.Piso);

  //DIRECCION POSTAL
  sSqlTrans.Fields.Add('sa_cpostal_post',   fraDomicilioPostal.CodigoPostal);
  sSqlTrans.Fields.Add('sa_calle_post',     fraDomicilioPostal.Calle);
  sSqlTrans.Fields.Add('sa_localidad_post', fraDomicilioPostal.Localidad);

  if fraDomicilioPostal.Provincia <> '' then
    sSqlTrans.Fields.Add('sa_provincia_post', String(ValorSqlEx('SELECT pv_codigo' +
                                                                 ' FROM cpv_provincias' +
                                                                ' WHERE pv_descripcion = :descripcion',
                                              [fraDomicilioPostal.Provincia], 'NULL')), False);

  sSqlTrans.Fields.Add('sa_cpostala_post',     fraDomicilioPostal.CPA);
  sSqlTrans.Fields.Add('sa_departamento_post', fraDomicilioPostal.Departamento);

  if Trim(fraDomicilioPostal.Numero) = '' then
    fraDomicilioPostal.Numero := 'S/N';

  sSqlTrans.Fields.Add('sa_numero_post', fraDomicilioPostal.Numero);
  sSqlTrans.Fields.Add('sa_piso_post',   fraDomicilioPostal.Piso);

  sSqlTrans.Fields.Add('sa_hojaslegajos', edSA_HOJASLEGAJOS.Value);
  sSqlTrans.Fields.Add('sa_recepcionexpress', 'N'); //segun indica ggrossi si se guarda desde esta pantalla deja de ser una recepcion express

  if not FEsModificacion then
  begin
    fIdFormulario := ValorSql('SELECT afi.seq_afo_id.NEXTVAL FROM DUAL');
    if edSA_FORMULARIO.Text = '' then
    begin
      iIDProvisorio := ValorSql('SELECT afi.seq_afo_id_provisorio.NEXTVAL FROM DUAL');
      edSA_FORMULARIO.Text := 'Provisorio ' + IntToStr(iIDProvisorio);
    end;
    sSqlFormulario :=
      'INSERT INTO afo_formulario (fo_id, fo_formulario, fo_usualta)' +
                         ' VALUES (' + SqlValue(fIdFormulario) + ', ''' +
                                       edSA_FORMULARIO.Text + ''', ' +
                                       SqlValue(Sesion.UserID) + ')';
    bGrabaSQL := True;

    iNroInterno := ValorSql('SELECT seq_asa_nrointerno.NEXTVAL FROM DUAL');
    iSA_ID := ValorSql('SELECT afi.seq_asa_id.NEXTVAL FROM DUAL');
    iID_Modificacion := iSA_ID;
    tbDocumentacion.Enabled := True;
    sSqlTrans.SqlType := stInsert;

    sSqlTrans.PrimaryKey.Add('sa_id',       iSA_ID, False);
    sSqlTrans.Fields.Add('sa_idformulario', fIdFormulario);
    sSqlTrans.Fields.Add('sa_nrointerno',   iNroInterno);
    sSqlTrans.Fields.Add('sa_fechaalta', '  Actualdate', False);
    sSqlTrans.Fields.Add('sa_usualta',      Sesion.UserId);


    // Si no se modificaron las tarifas obtenidas de la cotización..
    if (FDatosCotizacion.Ciiu = fraCuadroTarifario.fraCIIU.Value) and
       (FDatosCotizacion.Empleados = fraCuadroTarifario.edTOTEMPLEADOS.Value) and
       (RoundTo(FDatosCotizacion.MasaSalarial, -2) = RoundTo(fraCuadroTarifario.edMASATOTAL.Value, -2)) and
       (RoundTo(FDatosCotizacion.PorcentajeVariable, -4) = RoundTo(fraCuadroTarifario.edALICUOTAPORC.Value, -4)) and
       (RoundTo(FDatosCotizacion.SumaFija, -2) = RoundTo(fraCuadroTarifario.edALICUOTAPESOS.Value, -2)) then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM ati_traspasoingreso' +
        ' WHERE ti_idformulario = :idformulario' +
          ' AND ti_fechabaja IS NULL';
      if ExisteSqlEx(sSql, [fIdFormulario]) then
      begin
        sEstado := '7.0 - Traspaso en Trámite';
        sSqlTrans.Fields.Add('sa_estado', '7.0');
      end
      else
      begin
        sEstado := '3.1 - Tarifa Aprobada';
        sSqlTrans.Fields.Add('sa_estado', '3.1');
      end;
    end
    else
    begin
      if TarifaVerificada(iSA_ID, edSA_CUIT.Text, iSolicitudCotizacionId, sMotivosNoAprobacionTarifa,
                          fraCuadroTarifario.edMASATOTAL.Value, fraCuadroTarifario.edALICUOTAPESOS.Value,
                          fraCuadroTarifario.edALICUOTAPORC.Value, fraCuadroTarifario.edTOTEMPLEADOS.Value) then
      begin
        sEstado := '3.1 - Tarifa Aprobada';
        sSqlTrans.Fields.Add('sa_estado', '3.1');
        sSqlTrans.Fields.Add('sa_idsolicitudcotizacion', iSolicitudCotizacionId);
      end
      else
      begin
        sEstado := '1.1 - Tarifa a Verificar';
        sSqlTrans.Fields.Add('sa_estado', '1.1');
        sSqlTrans.Fields.Add('sa_motivosnoaprobaciontarifa', sMotivosNoAprobacionTarifa);
      end;
    end;
  end
  else
  begin
    //Busca el ID del formulario, si no existe le crea uno
    sSqlFormulario :=
      'UPDATE afo_formulario' +
        ' SET fo_formulario = ' + SqlValue(edSA_FORMULARIO.Text) +
      ' WHERE fo_id = '+ SqlValue(fIdFormulario);
    bGrabaSQL := True;

    iSA_ID := iID_Modificacion;
    sSqlTrans.PrimaryKey.Add('sa_id', iSA_ID, False);
    iNroInterno := edSA_NROINTERNO.Value;
    sSqlTrans.Fields.Add('sa_nrointerno',   iNroInterno);
    sSqlTrans.Fields.Add('sa_idformulario', fIdFormulario);
    sSqlTrans.Fields.Add('sa_fechamodif',   'ACTUALDATE', False);
    sSqlTrans.Fields.Add('sa_usumodif',     Sesion.UserId);

    //***  Ex trigger AFI.trg_asa_usuariorecepcionafi
    if isEstablecerUsuarioAFI(iSA_ID) then
    begin
      sSqlTrans.Fields.Add('sa_usurecepcionsectorafi',     Sesion.UserId);
      sSqlTrans.Fields.Add('sa_fechaaltasectorafi',     'SYSDATE', False);
    end;
    //fin Ex trigger AFI.trg_asa_usuariorecepcionafi

    if (fraEstado.Value = '18.0') or (fraEstado.Value = '18.1') or (fraEstado.Value = '18.3') then
      sSqlTrans.Fields.Add('sa_estado', '1.1')
    else                           //diferente de traspaso                       //fax                           //no vacia
      if (fraSA_MOTIVOALTA.Value <> '02') and (fraSA_ORIGEN.Value = '2') and Not(edFechaRecepcionFaxEmail.IsEmpty) then
      begin
        sEstado := fraEstado.Value;
        sSqlTrans.Fields.Add('sa_estado', fraEstado.Codigo);
        {if fraEstado.Value <> '3.0' then
          sSqlTrans.Fields.Add('sa_estado', fraEstado.Codigo)
        else
          sSqlTrans.Fields.Add('sa_estado', '3.1'); }//Tarifa Aprobada segun callo deberia cambiarse el a este estado cuando es 3.0.
      end
      else
        if (FMotivoAlta <> StrToIntDef(fraSA_MOTIVOALTA.Value, -1))
          and (FEsModificacion)
          and ((fraSA_MOTIVOALTA.Value = '04') or (fraSA_MOTIVOALTA.Value = '05'))
          and (Sesion.Sector = 'AFI')  then
        begin
          sSqlTrans.Fields.Add('sa_estado', '1.1');
          sEstado := '1.1 - Tarifa a Verificar';
        end
        else
          if ((fraEstado.Value = '20') or (fraEstado.Value = '3.0')) and
             ((not dcbFechaRecepcionAfiliaciones.IsEmpty) or (not edFechaRecepcionFaxEmail.IsEmpty)) then
            if TarifaVerificada(iSA_ID, edSA_CUIT.Text, iSolicitudCotizacionId, sMotivosNoAprobacionTarifa,
                          fraCuadroTarifario.edMASATOTAL.Value, fraCuadroTarifario.edALICUOTAPESOS.Value,
                          fraCuadroTarifario.edALICUOTAPORC.Value, fraCuadroTarifario.edTOTEMPLEADOS.Value) then
            begin
              sEstado := '3.1 - Tarifa Aprobada';
              sSqlTrans.Fields.Add('sa_estado', '3.1');
              sSqlTrans.Fields.Add('sa_idsolicitudcotizacion', iSolicitudCotizacionId);
            end
            else
            begin
              sEstado := '1.1 - Tarifa a Verificar';
              sSqlTrans.Fields.Add('sa_estado', '1.1');
              sSqlTrans.Fields.Add('sa_motivosnoaprobaciontarifa', sMotivosNoAprobacionTarifa);
            end
          else
            if (fraEstado.Value = '31') and TieneRGRL then  //pedido por EVILA 07/10/2013  //Si consiguen el RGRL y esta en espera de autorizacion
            begin                                          //AutoAutorizar y dejar en estado 7.0
              sSqlTrans.Fields.Add('sa_estado', '7.0');
              sEstado := '7.0 - Traspaso en Trámite';
              AnularMailAutorizacion;
            end;



    sSqlTrans.SqlType := stUpdate;
  end;

  try
    try
      BeginTrans;
      if bGrabaSQL then
        EjecutarSQLST(sSqlFormulario);
      EjecutarSQLST(sSqlTrans.Sql);
      ActualizarEstadoSolicitud(iSA_ID); //Ubica la solicitud en estado=3.1 si no necesita supervision

      // Pasa las modificaciones sobre los teléfonos de la tabla temporal a la original..
      fraTELEFONO_LEGAL.CopiarTempATelefonos(iSA_ID);
      fraTELEFONO_POSTAL.CopiarTempATelefonos(iSA_ID);
      fraContacto.fraTelefonos.CopiarTempATelefonos(iSA_ID);

      GuardarDatosDocumentacion(iSA_ID, False);
      GuardarDatosPep(iSA_ID);

      if pnlPCP.Visible then
        GuardarCostosPCP;


      DoTareaSIC(fIdFormulario); //Supongo que se guardo y ejecuto el proceso de SIC

      if not FEsModificacion then
      begin
        // Relaciono el formulario con la cotización.
        if StrToIntDef(edSA_FORMULARIO.Text, 0) >= 6000000 then
        begin
          if Copy(edSA_FORMULARIO.Text, 1, 1) = '6' then   // Si es una solicitud de cotización..
            sSql :=
              'UPDATE asc_solicitudcotizacion' +
                ' SET sc_idformulario = :idformulario,' +
                    ' sc_estado = ''08''' +
              ' WHERE sc_nrosolicitud = :nrosolicitud';
          if Copy(edSA_FORMULARIO.Text, 1, 1) = '7' then   // Si es una solicitud de cotización..
            sSql :=
              'UPDATE asr_solicitudreafiliacion' +
                ' SET sr_idformulario = :idformulario,' +
                    ' sr_estadosolicitud = ''08''' +
              ' WHERE sr_nrosolicitud = :nrosolicitud';
          EjecutarSqlSTEx(sSql, [fIdFormulario, StrToInt(Copy(edSA_FORMULARIO.Text, 2, 10))]);
        end;

        FEsModificacion := True;
        edSA_NROINTERNO.Value := iNroInterno;
        LockControls(edSA_NROINTERNO, True);
        if fraSA_MOTIVOALTA.Value = '04' then    // Si es una reafiliación..
          CargarEstablecimientosFromContrato(FContratoAnterior, iSA_ID);
        if FCargarNomina then
          CargarNominaFromContrato(FContratoAnterior, iSA_ID);
        MessageDlg('El número interno generado es: ' + IntToStr(iNroInterno) + #13#10#13#10 +
                   'La solicitud quedó en estado: ' + sEstado, mtInformation, [mbOK], 0);
      end
      else
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

      CommitTrans;

      fraEstado.Value := GetEstadoActual(iSA_ID);

      //Tk 46319 
      //Siempre que un usuario de Afiliaciones modifique el "Motivo de Alta" de una solicitud
      //(de Nueva al Régimen a Re-Afiliación ó Rescindida ó Traspaso) el sistema debe emitir la alarma para que la
      //cotización sea revisada por Suscripción.

      if (FMotivoAlta = 3) and ((StrToIntDef(fraSA_MOTIVOALTA.Value, -1) = 02) or
                                  (StrToIntDef(fraSA_MOTIVOALTA.Value, -1) = 04) or
                                  (StrToIntDef(fraSA_MOTIVOALTA.Value, -1) = 05)
                                  ) then
      begin
        MessageDlg('El "Motivo de Alta" ha cambiado. '+ #13#10#13#10 +'La tarifa de esta Solicitud deberá ser revisada por Suscripción.', mtInformation, [mbOK], 0);
      end
      else  //Esto es para que no salgan mensajes contradictorios.
      begin

        //Pedido por evila 23/07/2012  via spark por tk 38735
        if (fraEstado.Codigo <> '7.2') and (fraEstado.Codigo <> '7.3') and
           (fraEstado.Codigo <> '7.4') and (fraEstado.Codigo <> '30') then
        begin
          if fraEstado.Codigo = '7.0' then
            MsgBox('Esta Solicitud pasa a la gestión de TRASPASO.')
          else if (fraEstado.Codigo = '3.1') or (fraEstado.Codigo = '7.1') then
            MsgBox('Esta Solicitud pasa para la APROBACIÓN del contrato.')
          else if (fraEstado.Codigo = '1.1') then  //Pedido por el dúo VILA/GROSSI 07/09/2012
            MsgBox('La tarifa de esta Solicitud deberá ser revisada por Suscripción.');
        end;
      end;
      //

      iDiasSolicitud := Trunc(DBDate - edVigencia.Date);
      if (iDiasSolicitud > 30) and (iDiasSolicitud < 40) then
        MsgBox(Format('Faltan %d días para el vencimiento del plazo de presentación del contrato en la SRT.', [40 - iDiasSolicitud]), MB_OK + MB_ICONWARNING, 'Advertencia')
      else if iDiasSolicitud = 40 then
        MsgBox('Hoy vence el plazo para presentar el alta del contrato en la SRT.', MB_OK + MB_ICONWARNING, 'Advertencia')
      else if iDiasSolicitud > 40 then
        MsgBox(Format('La solicitud tiene %d días. Se encuentra vencido el plazo para presentar el alta del contrato en la SRT.', [iDiasSolicitud]), MB_OK + MB_ICONINFORMATION, 'Advertencia');

      if not FEsPCP then
        if (fraSA_MOTIVOALTA.Value <> '04') and (MsgBox('¿ Desea cargar los establecimientos ?', MB_ICONINFORMATION + MB_YESNO) = IDYES) then
          tblEstablecimientoClick(nil);
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    sSqlTrans.Free;
  end;
  CargarUsuarioRevision(iSA_ID);

  if not fraSA_MOTIVOALTA.IsEmpty then
    FMotivoAlta :=  StrToIntDef(fraSA_MOTIVOALTA.Value, -1);

end;

procedure TfrmCargaSolicitudes.DoGrabaEstablecimiento(iIDFORMULARIO: Integer);
var
  iSE_ID: Integer;
  iSE_NROESTABLECI: Integer;
  sSqlTrans: TSql;
begin
  sSqlTrans := TSQL.Create('ase_solicitudestablecimiento');

  sSqlTrans.Fields.Add('se_idactividad', fraCuadroTarifario.Actividad);
  sSqlTrans.Fields.Add('se_nombre',      cmbSA_NOMBRE.Text);
  sSqlTrans.Fields.Add('se_codareafax',  edSA_CODAREAFAX.Text);
  sSqlTrans.Fields.Add('se_fax',         edSA_FAX.Text);
  sSqlTrans.Fields.Add('se_idsolicitud', iIDFORMULARIO);
  sSqlTrans.Fields.Add('se_nivel',       fraCuadroTarifario.edNIVEL.Text);

  // DIRECCIÓN LEGAL
  sSqlTrans.Fields.Add('se_numero',       fraDOMICILIO_LEGAL.Numero);
  sSqlTrans.Fields.Add('se_piso',         fraDOMICILIO_LEGAL.Piso);
  sSqlTrans.Fields.Add('se_cpostala',     fraDOMICILIO_LEGAL.CPA);
  sSqlTrans.Fields.Add('se_departamento', fraDOMICILIO_LEGAL.Departamento);
  sSqlTrans.Fields.Add('se_cpostal',      fraDOMICILIO_LEGAL.CodigoPostal);
  sSqlTrans.Fields.Add('se_calle',        fraDOMICILIO_LEGAL.Calle);
  sSqlTrans.Fields.Add('se_localidad',    fraDOMICILIO_LEGAL.Localidad);

  if fraDOMICILIO_LEGAL.Provincia <> '' then
    sSqlTrans.Fields.Add('se_provincia', String(ValorSqlEx('SELECT pv_codigo' +
                                                            ' FROM cpv_provincias' +
                                                           ' WHERE pv_descripcion = :descripcion',
                                                           [fraDOMICILIO_LEGAL.Provincia], 'NULL')), False);

  sSqlTrans.Fields.Add('se_feinicactiv',  edSA_FEINICACTIV.Date);
  sSqlTrans.Fields.Add('se_empleados',    fraCuadroTarifario.edTOTEMPLEADOS.Value);
  sSqlTrans.Fields.AddExtended('se_masa', fraCuadroTarifario.edMASATOTAL.Value, ALL_DECIMALS, False);

  iSE_ID := ValorSql('SELECT afi.seq_ase_id.NEXTVAL FROM DUAL');
  sSqlTrans.PrimaryKey.Add('se_id', iSE_ID, False);

  iSE_NROESTABLECI := ValorSqlEx('SELECT NVL(MAX(se_nroestableci), 0) + 1' +
                                  ' FROM ase_solicitudestablecimiento' +
                                 ' WHERE se_idsolicitud = :idsolicitud', [iIDFORMULARIO]);
  sSqlTrans.Fields.Add('se_nroestableci', iSE_NROESTABLECI);
  sSqlTrans.Fields.Add('se_fechaalta', '  Actualdate', False);
  sSqlTrans.Fields.Add('se_usualta',      Sesion.UserId);
  sSqlTrans.SqlType := stInsert;
  try
    EjecutarSQL(sSqlTrans.Sql);
  finally
    sSqlTrans.Free;
  end;

  DoGrabaTelefonosEstablecimiento(iSE_ID, iIDFORMULARIO);
end;

procedure TfrmCargaSolicitudes.DoGrabaTelefonosEstablecimiento(const iEstablecimientoId, iFormularioId: Integer);
var
  sSql: String;
  sSqlTrans: TSql;
begin
  sSql :=
    'SELECT *' +
     ' FROM ats_telefonosolicitud' +
    ' WHERE ts_solicitud = :solicitud' +
      ' AND ts_tipo = ''L''';

  sSqlTrans := TSQL.Create('asf_solicitudtelefonoestableci');
  sSqlTrans.SqlType := stInsert;
  with GetQueryEx(sSql, [iFormularioId]) do
  try
    while not Eof do
    begin
      sSqlTrans.Fields.Clear;
      sSqlTrans.Fields.Add('sf_id', 1);
      sSqlTrans.Fields.Add('sf_idestablecimiento', iEstablecimientoId);
      sSqlTrans.Fields.Add('sf_idtipotelefono',    FieldByName('ts_idtipotelefono').AsInteger);
      sSqlTrans.Fields.Add('sf_area',              FieldByName('ts_area').AsString);
      sSqlTrans.Fields.Add('sf_numero',            FieldByName('ts_numero').AsString);
      sSqlTrans.Fields.AddInteger('sf_interno',    FieldByName('ts_interno').AsInteger, True);
      sSqlTrans.Fields.Add('sf_principal',         FieldByName('ts_principal').AsString);
      sSqlTrans.Fields.Add('sf_observacion',       FieldByName('ts_observacion').AsString);
      EjecutarSQL(sSqlTrans.Sql);

      Next;
      Application.ProcessMessages;
    end;
  finally
    sSqlTrans.Free;
    Free;
  end;
end;


function TfrmCargaSolicitudes.GetEstadoActual(const aId: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT sa_estado' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  Result := ValorSqlEx(sSql, [aId]);
end;

function TfrmCargaSolicitudes.isEstaCargado(AControl: TWinControl; aCheckEstado: Boolean; sFormulario, sCuit: String;
                                            sNroInterno: String = ''): Boolean;
var
  fEstado: String;
  fEstadoDesc: String;
  iID: Integer;
  sdqControlDatos: TSDQuery;
  sSql: String;
  oldCursor: TCursor;
begin
  Result := False;

  if (sCuit = '') or (sCuit <> fCuit) then
  begin
    fCuit := sCuit;
    fReafiliacion := False;
    oldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    sdqControlDatos := TSDQuery.Create(Self);
    try
      sdqControlDatos.DataBaseName := 'dbPrincipal';
      FCargarNomina := False;
      if not FEsModificacion then
      begin
        BloqueaTarifas (False);
        sSql :=
          'SELECT sa_id, sa_estado, sa_recepcionexpress' +
           ' FROM asa_solicitudafiliacion, afo_formulario' +
          ' WHERE (fo_formulario = :formulario' +
                 ' OR sa_cuit = :cuit' +
                 ' OR sa_nrointerno = :nrointerno)' +
            ' AND sa_idformulario = fo_id';

        if aCheckEstado then
        begin
          sSql := sSql + ' AND sa_estado NOT IN (:v1, :v2, :v3, :v4, :v5, :v6, :v7, :v8)';
          OpenQueryEx(sdqControlDatos, [sFormulario, sCuit, sNroInterno, '2.6', '5.2', '5.3', '5.4', '6.3', '7.2', '9.0', '9.9'], sSql, True);
        end
        else
          OpenQueryEx(sdqControlDatos, [sFormulario, sCuit, sNroInterno], sSql, True);

        if not sdqControlDatos.IsEmpty then
        begin
          if MsgBox('Este formulario ya está '+ IIF(sdqControlDatos.FieldByName('sa_recepcionexpress').AsString = 'S', 'recepcionado.', 'cargado.') +
                     CRLF + '¿ Desea modificarlo ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
          begin
            iID := sdqControlDatos.FieldByName('sa_id').AsInteger;
            DoCargaDatosSolicitud(iID);
            Result := True;
          end
          else
          begin
            if Assigned(AControl) and AControl.CanFocus then
            try
              AControl.SetFocus;
            except
              //
            end;
            edSA_FORMULARIO.Clear;
            edSA_CUIT.Clear;
            fCuit := '';
            Abort;
          end;
        end
        else
        begin
          if (sFormulario <> '-1') and ExisteSqlEx('SELECT 1' +
                                                    ' FROM afo_formulario' +
                                                   ' WHERE fo_formulario = :formulario', [sFormulario]) then
          begin
            //si el numero de formulario ya fue usado que termine con el proceso
            MessageDlg('El número de formulario ya existe en un contrato cargado previamente.', mtWarning, [mbOK], 0);
            edSA_FORMULARIO.Clear;
            Abort;
          end;
          //NVL(CO_FECHABAJA, ACTUALDATE+1) ESTO LO HACE PARA VER SI ESTA ACTIVA O NO (VER MAS ADELANTE)
          sSql :=
            'SELECT   co_contrato, co_vigenciadesde, NVL(co_fechabaja, actualdate + 1) fechabaja, co_fechabaja, co_estado, tb_especial1' +
               ' FROM aem_empresa, aco_contrato, afo_formulario, ctb_tablas' +
              ' WHERE co_idempresa = em_id' +
                ' AND tb_clave = ''AFEST''' +
                ' AND tb_codigo = co_estado' +
                ' AND (   fo_formulario = :formulario' +
                     ' OR em_cuit = :cuit)' +
                ' AND co_idformulario = fo_id' +
           ' ORDER BY co_vigenciadesde DESC';
          OpenQueryEx(sdqControlDatos, [sFormulario, sCuit], sSql, True);

          if not sdqControlDatos.IsEmpty then
          begin
            //Aca hay dos posibilidades: que la empresa siga activa o quiera reafiliarse y que no este en estado 5 (Rechazado por la SRT)
            if (sdqControlDatos.FieldByName('fechabaja').AsDateTime > Date) and
               (sdqControlDatos.FieldByName('tb_especial1').AsString <> '4') and
               (sdqControlDatos.FieldByName('co_estado').AsString <> '5') then
            begin
              //La empresa esta activa
              InvalidMsg(AControl, 'La empresa está activa con contrato Nº ' + sdqControlDatos.FieldByName('CO_CONTRATO').AsString + ', con vigencia ' + DateToStr(sdqControlDatos.FieldByName('CO_VIGENCIADESDE').AsDateTime) +
                                   CRLF + 'Si desea modificarlo debe ir a Administración de Contrato.');
              edSA_FORMULARIO.Clear;
              edSA_CUIT.Clear;
              fCuit := '';
              Abort;
            end
            else
            begin
              fReafiliacion := True;

              // Obtiene el motivo de baja
              fEstado     := sdqControlDatos.FieldByName('co_estado').AsString;
              fEstadoDesc := ValorSqlEx('SELECT afiliacion.msg_cobertura(:contrato) FROM DUAL', [sdqControlDatos.FieldByName('co_contrato').AsString]);
              fFechaBaja  := sdqControlDatos.FieldByName('co_fechabaja').AsDateTime;

              // Le pregunta si desea aprovechar los datos de la ultima afiliacion
              if MsgBox('Esta empresa se encontraba afiliada con los siguientes datos: ' + CRLF +
                        'Número de contrato: ' + sdqControlDatos.FieldByName('co_contrato').AsString + CRLF +
                        'Motivo de baja: ' + fEstadoDesc + CRLF +
                        'Fecha de baja: ' + sdqControlDatos.FieldByName('co_fechabaja').AsString + CRLF +
                        '¿ Desea utilizar los datos de la última afiliación ?', MB_ICONQUESTION + MB_YESNO, 'Atención') = IDYES then
              begin
                FContratoAnterior := sdqControlDatos.FieldByName('co_contrato').AsInteger;
                CargarDatosFromContrato(FContratoAnterior);

                FCargarNomina := (MsgBox('¿ Desea recuperar la nómina ?', MB_ICONQUESTION + MB_YESNO, 'Atención') = IDYES);
              end
              else
                Abort;
            end;
          end;
        end;
        sdqControlDatos.Close;
      end;
    finally
      sdqControlDatos.Free;
      Screen.Cursor := OldCursor;
    end;
  end;
end;

function TfrmCargaSolicitudes.DoCargaDatosSolicitud(iId: TTableID): Boolean;
begin
  if ExisteIdDatosTemporales(iId) then
    if MsgAsk('Existen datos temporales para esta solicitud. ¿ Desea cargarlos ?') then
      if DoCargaDatosSolicitudOriginal(iId) then
        Result := DoCargaDatosSolicitudTemporal(iId)
      else
        Result := DoCargaDatosSolicitudOriginal(iId)
    else
      Result := DoCargaDatosSolicitudOriginal(iId)
  else
    Result := DoCargaDatosSolicitudOriginal(iId);
end;

procedure TfrmCargaSolicitudes.tblEstablecimientoClick(Sender: TObject);
begin
  Verificar(not FEsModificacion, ToolBar, 'No es posible cargar un Establecimiento sin antes haber cargado una solicitud.');
  frmCargaEstablecimiento.Free;
  try
    // Busca si ya tiene datos sino ingresa los datos actuales...
    if not ExisteSQLEx('SELECT 1' +
                        ' FROM ase_solicitudestablecimiento' +
                       ' WHERE se_idsolicitud = :idsolicitud', [iID_Modificacion]) then
      DoGrabaEstablecimiento(iID_Modificacion);

    frmCargaEstablecimiento := TfrmCargaEstablecimiento.Create(frmPrincipal);
    frmCargaEstablecimiento.DoCargaIDSolicitud(iID_Modificacion);
  except
    //
  end;
end;

procedure TfrmCargaSolicitudes.edVigenciaExit(Sender: TObject);
begin
  if not edVigencia.IsEmpty then
  begin
    Verificar(edVigencia.Date < StrToDate('01/01/1996'), edVigencia, 'La vigencia no puede ser anterior al 01/01/1996.');
    Verificar(edVigencia.Date < edFechaSuscripcion.Date, edVigencia, 'La vigencia no puede ser anterior a la fecha de suscripción.');
  end;
end;

procedure TfrmCargaSolicitudes.tblNominaClick(Sender: TObject);
begin
  Verificar(not FEsModificacion, ToolBar, 'No es posible cargar una nómina sin antes haber cargado una solicitud.');
  
  try
    frmCargaTrabajador.Show;
  except
    frmCargaTrabajador := TfrmCargaTrabajador.Create(frmPrincipal);
  end;
  frmCargaTrabajador.DoCargaIDSolicitud(iID_Modificacion);
end;

procedure TfrmCargaSolicitudes.tblSRTClick(Sender: TObject);
begin
  Verificar(not FEsModificacion, ToolBar, 'No es posible cargar un SRT, sin antes haber cargado una solicitud.');

  try
    frmCargaSRT.Show;
  except
    frmCargaSRT := TfrmCargaSRT.Create(frmPrincipal);
  end;
  frmCargaSRT.DoCargaIDSolicitud(iID_Modificacion);
end;

procedure TfrmCargaSolicitudes.tblImprimirClick(Sender: TObject);
begin
  if edSA_FORMULARIO.Text <> '' then
  begin
    RptSolicitud := TRptSolicitud.Create(Self);
    try
      RptSolicitud.sdqReporte.ParamByName('sa_id').AsInteger := iID_Modificacion;
      RptSolicitud.sdqReporte.Open;
      if not RptSolicitud.sdqReporte.Eof then
        RptSolicitud.Print
      else
        MessageDlg('No hay datos disponibles para la impresión.', mtError, [mbOK], 0);
    finally
      RptSolicitud.Free;
    end;
  end;
end;

procedure TfrmCargaSolicitudes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCargaSolicitudes := nil;
  {$IFNDEF SUSCRIPCIONES}
  frmPrincipal.mnuCargadeSolicitudes.Enabled := True;
  {$ENDIF}

  // Elimino los teléfonos de la tabla temporal..
  BeginTrans;
  try
    fraTELEFONO_LEGAL.QuitarTelefonosTemporales;
    fraTELEFONO_POSTAL.QuitarTelefonosTemporales;
    fraContacto.fraTelefonos.QuitarTelefonosTemporales;
    CommitTrans;
  except
    Rollback;
  end;
  inherited;
end;

procedure TfrmCargaSolicitudes.cmbSA_NOMBREDropDown(Sender: TObject);
var
  sSql: String;
begin
  sdqBuscoNombre.Close;
  sSql :=
    'SELECT sa_id, sa_cuit, sa_nombre' +
     ' FROM asa_solicitudafiliacion';

  if not ((sdqBuscoNombre.Active and (sdqBuscoNombre.FieldByName('ASA_NOMBRE').AsString = cmbSA_NOMBRE.Text) or
          (cmbSA_NOMBRE.Text = ''))) then
    sSql := sSql + ' WHERE sa_nombre LIKE ' + SQL_QUOTE + cmbSA_NOMBRE.Text + SQL_WILLCARD + SQL_QUOTE;
  OpenQuery(sdqBuscoNombre, sSql, True);
end;

procedure TfrmCargaSolicitudes.cmbSA_NOMBRECloseUp(Sender: TObject);
begin
  if cmbSA_NOMBRE.Text = '' then
    edSA_CUIT.Text := ''
  else
  begin
    edSA_CUIT.Text := sdqBuscoNombre.FieldByName('sa_cuit').AsString;
    isEstaCargado(edSA_CUIT, True, '-1', edSA_CUIT.Text);
  end;
end;

procedure TfrmCargaSolicitudes.fraVendedorcmbDescripcionDropDown(Sender: TObject);
begin
  fraVendedor.Entidad := fraEntidad.Value;
  fraVendedor.cmbDescripcionDropDown(Sender);
end;

procedure TfrmCargaSolicitudes.fraEntidadExit(Sender: TObject);
begin
  fraEntidad.FrameExit(Sender);
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmCargaSolicitudes.fraVendedorExit(Sender: TObject);
begin
  fraVendedor.FrameExit(Sender);
  fraEntidad.Vendedor := fraVendedor.Value;

  fraEntidadVendedor.Vendedor := fraVendedor.Value;
end;

function TfrmCargaSolicitudes.ObtenerEntidad(EV_ID: String): Integer;
begin
  try
    Result := ValorSqlIntegerEx('SELECT ev_identidad' +
                                 ' FROM xev_entidadvendedor' +
                                ' WHERE ev_id = :id', [EV_ID]);
  except
    Result := 0
  end;
end;

function TfrmCargaSolicitudes.ObtenerVendedor(EV_ID: String): Integer;
begin
  try
    Result := ValorSqlIntegerEx('SELECT ev_idvendedor' +
                                 ' FROM xev_entidadvendedor' +
                                ' WHERE ev_id = :id', [EV_ID]);
  except
    Result := 0
  end;
end;

function TfrmCargaSolicitudes.ObtenerEV_ID(Entidad, Vendedor: Integer): Integer;
begin
  try
    Result := ValorSqlIntegerEx('SELECT ev_id' +
                                 ' FROM xev_entidadvendedor' +
                                ' WHERE ev_fechabaja IS NULL' +
                                  ' AND ev_idvendedor = :idvendedor' +
                                  ' AND ev_identidad = :identidad', [Vendedor, Entidad]);
  except
    Result := 0;
  end;
end;

procedure TfrmCargaSolicitudes.CargarDatosFromContrato(const aContrato: Integer);
var
  sdqCargaDatos: TSDQuery;
  sSql: String;
  sSql2: String;
begin
  sdqCargaDatos := TSDQuery.Create(Self);
  try
    sdqCargaDatos.DataBaseName := 'dbPrincipal';
    sSql :=
      'SELECT co_contrato, co_diasfranquicia, co_idactividad, co_nivel, em_id, em_nombre, em_formaj, em_feinicactiv,' +
            ' em_idgrupoeconomico, em_suss, em_sector, dompostal.dc_calle "CALLE_POSTAL",' +
            ' dompostal.dc_cpostal "CPOSTAL_POSTAL", dompostal.dc_localidad "LOCALIDAD_POSTAL",' +
            ' dompostal.dc_provincia "PROVINCIA_POSTAL", dompostal.dc_numero "NUMERO_POSTAL",' +
            ' dompostal.dc_piso "PISO_POSTAL", dompostal.dc_departamento "DEPARTAMENTO_POSTAL",' +
            ' dompostal.dc_cpostala "CPOSTALA_POSTAL", dompostal.dc_codareatelefonos "CODAREATELEFONOS_POSTAL",' +
            ' dompostal.dc_telefonos "TELEFONOS_POSTAL", dompostal.dc_codareafax "CODAREAFAX_POSTAL",' +
            ' dompostal.dc_fax "FAX_POSTAL", dompostal.dc_observaciones "OBSERVACIONES_POSTAL",' +
            ' dompostal.dc_mail mail_postal, domlegal.dc_calle "CALLE_LEGAL", domlegal.dc_cpostal "CPOSTAL_LEGAL",' +
            ' domlegal.dc_localidad "LOCALIDAD_LEGAL", domlegal.dc_provincia "PROVINCIA_LEGAL",' +
            ' domlegal.dc_numero "NUMERO_LEGAL", domlegal.dc_piso "PISO_LEGAL",' +
            ' domlegal.dc_departamento "DEPARTAMENTO_LEGAL", domlegal.dc_cpostala "CPOSTALA_LEGAL",' +
            ' domlegal.dc_codareatelefonos "CODAREATELEFONOS_LEGAL", domlegal.dc_telefonos "TELEFONOS_LEGAL",' +
            ' domlegal.dc_codareafax "CODAREAFAX_LEGAL", domlegal.dc_fax "FAX_LEGAL",' +
            ' domlegal.dc_observaciones "OBSERVACIONES_LEGAL", domlegal.dc_mail mail_legal, tc_tipodetarifa,' +
            ' tc_porcdescnivel, tc_porcdescvolumen, tc_porcmasa, tc_porcmasatarifa, tc_sumafija, tc_sumafijatarifa' +
       ' FROM aco_contrato, aem_empresa, adc_domiciliocontrato domlegal, adc_domiciliocontrato dompostal,' +
            ' atc_tarifariocontrato' +
      ' WHERE co_idempresa = em_id' +
        ' AND domlegal.dc_contrato = co_contrato' +
        ' AND domlegal.dc_tipo = ''P''' +
        ' AND dompostal.dc_contrato = co_contrato' +
        ' AND dompostal.dc_tipo = ''L''' +
        ' AND tc_contrato = co_contrato' +
        ' AND co_contrato = :contrato';
    OpenQueryEx(sdqCargaDatos, [aContrato], sSql, True);

    cmbSA_NOMBRE.Text     := sdqCargaDatos.FieldByName('em_nombre').AsString;
    fraSA_FORMAJ.Codigo    := sdqCargaDatos.FieldByName('em_formaj').AsString;
    fraSA_SECTOR.Value    := sdqCargaDatos.FieldByName('em_sector').AsString;

    fraSA_SECTORExit(Nil);
    if (fraSA_SUSS.Value = '') then
      fraSA_SUSS.Value      := sdqCargaDatos.FieldByName('em_suss').AsString;

    fraSA_HOLDING.Value   := sdqCargaDatos.FieldByName('em_idgrupoeconomico').AsInteger;
    edSA_FEINICACTIV.Date := sdqCargaDatos.FieldByName('em_feinicactiv').AsDateTime;
    edFranquicia.Value    := sdqCargaDatos.FieldByName('co_diasfranquicia').AsInteger;

    // DIRECCIÓN LEGAL
    fraDOMICILIO_LEGAL.CPA          := sdqCargaDatos.FieldByName('cpostala_legal').AsString;
    fraDOMICILIO_LEGAL.Piso         := sdqCargaDatos.FieldByName('piso_legal').AsString;
    fraDOMICILIO_LEGAL.Departamento := sdqCargaDatos.FieldByName('departamento_legal').AsString;
    fraDOMICILIO_LEGAL.Numero       := sdqCargaDatos.FieldByName('numero_legal').AsString;
    fraDOMICILIO_LEGAL.CodigoPostal := sdqCargaDatos.FieldByName('cpostal_legal').AsString;
    fraDOMICILIO_LEGAL.Calle        := sdqCargaDatos.FieldByName('calle_legal').AsString;
    fraDOMICILIO_LEGAL.Localidad    := sdqCargaDatos.FieldByName('localidad_legal').AsString;

    if sdqCargaDatos.FieldByName('provincia_legal').AsString <> '' then
      fraDOMICILIO_LEGAL.Provincia := ValorSqlEx('SELECT pv_descripcion' +
                                                  ' FROM cpv_provincias' +
                                                 ' WHERE pv_codigo = :codigo',
                                                 [sdqCargaDatos.FieldByName('provincia_legal').AsString]);

    //DIRECCION POSTAL
    fraDomicilioPostal.CPA          := fraDOMICILIO_LEGAL.CPA;
    fraDomicilioPostal.Piso         := fraDOMICILIO_LEGAL.Piso;
    fraDomicilioPostal.Departamento := fraDOMICILIO_LEGAL.Departamento;
    fraDomicilioPostal.Numero       := fraDOMICILIO_LEGAL.Numero;
    fraDomicilioPostal.CodigoPostal := fraDOMICILIO_LEGAL.CodigoPostal;
    fraDomicilioPostal.Calle        := fraDOMICILIO_LEGAL.Calle;
    fraDomicilioPostal.Localidad    := fraDOMICILIO_LEGAL.Localidad;
    fraDomicilioPostal.Provincia    := fraDOMICILIO_LEGAL.Provincia;

    edSA_CODAREAFAX.Text         := sdqCargaDatos.FieldByName('codareafax_legal').AsString;
    edSA_FAX.Text                := sdqCargaDatos.FieldByName('fax_legal').AsString;
    edSA_MAIL_LEGAL.Text         := sdqCargaDatos.FieldByName('mail_legal').AsString;
    edSA_OBSERVACIONES.Text      := sdqCargaDatos.FieldByName('observaciones_legal').AsString;
    edSA_CODAREAFAX_POST.Text    := edSA_CODAREAFAX.Text;
    edSA_FAX_POST.Text           := edSA_FAX.Text;
    edSA_MAIL_POSTAL.Text        := edSA_MAIL_LEGAL.Text;
    edSA_OBSERVACIONES_POST.Text := sdqCargaDatos.FieldByName('observaciones_postal').AsString;

    // Titular..
    sSql :=
      'SELECT em_id' +
       ' FROM aem_empresa' +
      ' WHERE em_cuit = :cuit';

    sSql2 :=
      'SELECT *' +
       ' FROM act_contacto' +
      ' WHERE ct_idempresa = :idempresa' +
        ' AND ct_firmante = ''S''';
    with GetQueryEx(sSql2, [ValorSqlIntegerEx(sSql, [edSA_CUIT.Text])]) do
    try
      if not Eof then
      begin
        edSA_TITULAR.Text      := FieldByName('ct_contacto').AsString;
        fraTipoDocumento.Value := FieldByName('ct_tipodocumento').AsString;
        edNumeroDocumento.Text := FieldByName('ct_numerodocumento').AsString;
        fraCargo.Codigo        := FieldByName('ct_cargo').AsString;
      end;
    finally
      Free;
    end;

    //Contacto
    fraContacto.Contrato := aContrato;

    //Cuadro Tarifario
    fraCuadroTarifario.fraCIIU.Value           := sdqCargaDatos.FieldByName('co_idactividad').AsInteger;
    fraCuadroTarifario.edNIVEL.Text            := sdqCargaDatos.FieldByName('co_nivel').AsString;
//    fraCuadroTarifario.fraTIPOTARIFA.Value     := sdqCargaDatos.FieldByName('tc_tipodetarifa').AsString;
    fraCuadroTarifario.edPORCDESCNIVEL.Value   := sdqCargaDatos.FieldByName('tc_porcdescnivel').AsCurrency;
    fraCuadroTarifario.edPORCDESCVOLUMEN.Value := sdqCargaDatos.FieldByName('tc_porcdescvolumen').AsCurrency;
    fraCuadroTarifario.edPORCMASATARIFA.Value  := sdqCargaDatos.FieldByName('tc_porcmasatarifa').AsCurrency;
    fraCuadroTarifario.edSUMAFIJATARIFA.Value  := sdqCargaDatos.FieldByName('tc_sumafijatarifa').AsCurrency;

    if StrToIntDef(edSA_FORMULARIO.Text, 0) < 6000000 then
    begin
      fraCuadroTarifario.edALICUOTAPESOS.Value := sdqCargaDatos.FieldByName('tc_sumafija').AsCurrency + 0.6;
      fraCuadroTarifario.edALICUOTAPORC.Value  := sdqCargaDatos.FieldByName('tc_porcmasa').AsCurrency;
    end;

    CargarTelefonosFromContrato(aContrato);
    CargarTelefonosFromContacto;
  finally
    sdqCargaDatos.Free;
  end;
end;

procedure TfrmCargaSolicitudes.CargarTelefonosFromContrato(const aContrato: Integer);
  procedure CopiarRegistros(const aContrato: Integer; const aTipo: String);
  var
    sSql: String;
    sSqlTrans: TSql;
  begin
    sSqlTrans := TSQL.Create('tmp_telefonos');
    sSqlTrans.SqlType := stInsert;

    sSql :=
      'SELECT *' +
       ' FROM ato_telefonocontrato' +
      ' WHERE to_contrato = :contrato' +
        ' AND to_tipo = ''L''';

    with GetQueryEx(sSql, [aContrato]) do
    try
      while not Eof do
      begin
        sSqlTrans.Fields.Clear;
        sSqlTrans.Fields.Add('mp_id',             1);
        sSqlTrans.Fields.Add('mp_usuarioid',      Sesion.ID);
        sSqlTrans.Fields.Add('mp_tablatel',       'ATS_TELEFONOSOLICITUD');
        sSqlTrans.Fields.Add('mp_registrotelid',  0);
        sSqlTrans.Fields.Add('mp_tablapadreid',   0);
        sSqlTrans.Fields.Add('mp_tipo',           aTipo);
        sSqlTrans.Fields.Add('mp_idtipotelefono', FieldByName('to_idtipotelefono').AsInteger);
        sSqlTrans.Fields.Add('mp_area',           FieldByName('to_area').AsString);
        sSqlTrans.Fields.Add('mp_numero',         FieldByName('to_numero').AsString);
        sSqlTrans.Fields.AddInteger('mp_interno', FieldByName('to_interno').AsInteger, True);
        sSqlTrans.Fields.Add('mp_principal',      FieldByName('to_principal').AsString);
        sSqlTrans.Fields.Add('mp_historico',      'F');
        sSqlTrans.Fields.Add('mp_observacion',    FieldByName('to_observacion').AsString);
        sSqlTrans.Fields.Add('mp_estado',         'A');
        EjecutarSQL(sSqlTrans.Sql);

        Next;
        Application.ProcessMessages;
      end;
    finally
      sSqlTrans.Free;
      Free;
    end;
  end;

begin
  CopiarRegistros(aContrato, 'L');
  CopiarRegistros(aContrato, 'P');

  fraTELEFONO_LEGAL.FillCombo(False, 0);
  fraTELEFONO_POSTAL.FillCombo(False, 0);
end;

procedure TfrmCargaSolicitudes.CargarTelefonosFromContacto;
var
  sSql: String;
  sSqlTrans: TSql;
begin
  sSqlTrans := TSQL.Create('tmp_telefonos');
  sSqlTrans.SqlType := stInsert;

  sSql :=
    'SELECT *' +
     ' FROM atn_telefonocontacto' +
    ' WHERE tn_idcontacto = :idcontacto';

  with GetQueryEx(sSql, [fraContacto.fraTelefonos.Id]) do
  try
    while not Eof do
    begin
      sSqlTrans.Fields.Clear;
      sSqlTrans.Fields.Add('mp_id', 1);
      sSqlTrans.Fields.Add('mp_usuarioid',      Sesion.ID);
      sSqlTrans.Fields.Add('mp_tablatel',       'ATS_TELEFONOSOLICITUD');
      sSqlTrans.Fields.Add('mp_registrotelid',  0);
      sSqlTrans.Fields.Add('mp_tablapadreid',   0);
      sSqlTrans.Fields.Add('mp_tipo',           'X');
      sSqlTrans.Fields.Add('mp_idtipotelefono', FieldByName('tn_idtipotelefonon').AsInteger);
      sSqlTrans.Fields.Add('mp_area',           FieldByName('tn_area').AsString);
      sSqlTrans.Fields.Add('mp_numero',         FieldByName('tn_numero').AsString);
      sSqlTrans.Fields.AddInteger('mp_interno', FieldByName('tn_interno').AsInteger, True);
      sSqlTrans.Fields.Add('mp_principal',      FieldByName('tn_principal').AsString);
      sSqlTrans.Fields.Add('mp_historico',      'F');
      sSqlTrans.Fields.Add('mp_observacion',    FieldByName('tn_observacion').AsString);
      sSqlTrans.Fields.Add('mp_estado',         'A');
      EjecutarSQL(sSqlTrans.Sql);

      Next;
      Application.ProcessMessages;
    end;
  finally
    sSqlTrans.Free;
    Free;
  end;

  fraContacto.fraTelefonos.FillCombo(False, 0);
end;

procedure TfrmCargaSolicitudes.BloqueaTarifas(Valor: Boolean);
begin
  LockControls(fraCuadroTarifario, Valor);
  LockControls(fraCIIU2, Valor);
  LockControls(fraCIIU3, Valor);

  //Estos no se deben lockear nunca
  LockControls(fraCuadroTarifario.edNIVEL,        False);

  //Estos deben estar lockeados siempre
  LockControls(fraCuadroTarifario.edSUMAFIJATARIFA, True);
  LockControls(fraCuadroTarifario.edPORCMASATARIFA, True);

  if Seguridad.Claves.IsActive('ModificarDatosBloqueados') then
    LockControls([fraCuadroTarifario.fraCIIU.edCodigo, fraCuadroTarifario.fraCIIU.cmbDescripcion,
                  fraCuadroTarifario.edTOTEMPLEADOS, fraCuadroTarifario.edMASATOTAL], False);
end;

function TfrmCargaSolicitudes.ExisteFormulario(ID: String): Boolean;
var
  sSA_ID: String;
begin
  // Devuelve True si existe una solicitud ya cargada con el codigo de formulario
  // ingresado (que sea diferente de la que estoy cargando)
  if FEsModificacion then
  begin
    sSA_ID := ValorSqlEx('SELECT sa_id' +
                          ' FROM asa_solicitudafiliacion' +
                         ' WHERE sa_idformulario = :idformulario', [ObtenerIDFormulario(ID)]);
    if (sSA_ID = IntTostr(iID_Modificacion)) or (sSA_ID = '') then
      Result := False //No existe un duplicado, es el registro actual que estoy modificando el que posee el mismo ID
    else
      Result := True;
  end
  else
    Result := ExisteSqlEx('SELECT 1' +
                           ' FROM asa_solicitudafiliacion' +
                          ' WHERE sa_idformulario = :idformulario', [ObtenerIDFormulario(ID)]);
end;

function TfrmCargaSolicitudes.ObtenerIDFormulario(FO_FORMULARIO: String): String;
begin
  Result := ValorSqlEx('SELECT fo_id' +
                        ' FROM afo_formulario' +
                       ' WHERE fo_formulario = :formulario', [FO_FORMULARIO], '0');
end;

procedure TfrmCargaSolicitudes.edSA_CUITKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if edSA_CUIT.Text <> '' then
    begin
      Verificar(not IsCUIT(edSA_CUIT.Text), edSA_CUIT, 'La C.U.I.T. es inválida.');
      isEstaCargado(edSA_CUIT, True, '-1', edSA_CUIT.Text);
    end;
end;

procedure TfrmCargaSolicitudes.edSA_CUITExit(Sender: TObject);
begin
  if edSA_CUIT.Text <> '' then
  begin
    Verificar(not IsCUIT(edSA_CUIT.Text), edSA_CUIT, 'La C.U.I.T. es inválida.');
    isEstaCargado(edSA_CUIT, True, '-1', edSA_CUIT.Text);
  end;
end;

procedure TfrmCargaSolicitudes.edSA_FORMULARIOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if edSA_FORMULARIO.Text <> '' then
      isEstaCargado(edSA_FORMULARIO, True, edSA_FORMULARIO.Text, '');
end;

procedure TfrmCargaSolicitudes.edSA_FORMULARIOExit(Sender: TObject);
begin
  if edSA_FORMULARIO.Text <> '' then
    if not isEstaCargado(edSA_FORMULARIO, True, edSA_FORMULARIO.Text, '') then
      if (not FEsModificacion) and (StrToIntDef(edSA_FORMULARIO.Text, 0) >= 6000000) then
        GetTarifaFromCotizacion(edSA_FORMULARIO.Text);
end;

procedure TfrmCargaSolicitudes.edSA_NROINTERNOExit(Sender: TObject);
begin
  if not edSA_NROINTERNO.ReadOnly then
    if edSA_NROINTERNO.Value <> 0 then
      if not isEstaCargado(edSA_NROINTERNO, False, '', '', IntToStr(edSA_NROINTERNO.Value)) then
        edSA_NROINTERNO.Clear;
end;

procedure TfrmCargaSolicitudes.edSA_NROINTERNOKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edSA_NROINTERNO.Value <> 0) then
    if not isEstaCargado(edSA_NROINTERNO, False, '', '', IntToStr(edSA_NROINTERNO.Value)) then
      edSA_NROINTERNO.Clear;
end;

procedure TfrmCargaSolicitudes.CargarCostosPCP;
var
  aQuery: TSDQuery;
  sSql : String;
begin
  sSql :=
        'SELECT pp_renglon, pp_valor ' +
        '   FROM afi.app_parametro_pcp ' +
        '  WHERE pp_fechabaja IS NULL ' +
        '    AND SYSDATE BETWEEN pp_fechadesde AND pp_fechahasta';
  aQuery := GetQueryEx(sSql, []);
  try
    while not aQuery.Eof do
    begin
      if aQuery.FieldByName('pp_renglon').AsInteger = 1 then
        edValorMenosDe12.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      if aQuery.FieldByName('pp_renglon').AsInteger = 2 then
        edValorDesde12a16.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      if aQuery.FieldByName('pp_renglon').AsInteger = 3 then
        edValorMasDe16.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmCargaSolicitudes.CargarDatosDocumentacion(const aIdSolicitud: Integer);
var
  aCheck: TCheckBox;
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT do_firmatitular, do_firmavendedor, do_iddocumentoafi, do_presente, do_faltante' +
     ' FROM ado_documentacion, asa_solicitudafiliacion' +
    ' WHERE do_idformulario = sa_idformulario' +
      ' AND sa_id = :id';
  aQuery := GetQueryEx(sSql, [aIdSolicitud]);
  try
    while not aQuery.Eof do
    begin
      aCheck := TCheckBox(FindComponent('_check_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_presente').AsString = 'S');

      aCheck := TCheckBox(FindComponent('check_firmatitular_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmatitular').AsString = 'S');

      aCheck := TCheckBox(FindComponent('check_firmavendedor_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmavendedor').AsString = 'S');

      aCheck := TCheckBox(FindComponent('check_faltante_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_faltante').AsString = 'S');


        {VerificarDocumentacionFaltante(fraSA_FORMAJ.Value,
                                                         fraFirmante.Value,
                                                         aQuery.FieldByName('do_iddocumentoafi').AsInteger,
                                                         aQuery.FieldByName('do_presente').AsString,
                                                         aQuery.FieldByName('do_firmatitular').AsString,
                                                         aQuery.FieldByName('do_firmavendedor').AsString)
                                                         = 'S';}


      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmCargaSolicitudes.CargarEstablecimientosFromContrato(const aContrato, aIdSolicitud: Integer);
var
  aQuery: TSDQuery;
  aSqlTrans: TSql;
  iSE_ID: Integer;
  iSE_NROESTABLECI: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT es_id, es_nroestableci, es_nombre, es_nivel, es_observaciones, es_calle, es_localidad, es_cpostal,' +
          ' es_provincia, es_numero, es_piso, es_departamento, es_cpostala, es_codareatelefonos, es_telefonos,' +
          ' es_codareafax, es_fax, es_empleados, es_masa, es_idactividad, es_nivel, es_feinicactiv, es_fechainicest,' +
          ' es_empleados, es_masa, es_observaciones, es_eventual, es_domicilio, es_superficie,' +
          ' es_descripcionactividad, es_usubaja, es_fechabaja' +
     ' FROM aes_establecimiento' +
    ' WHERE es_contrato = :contrato';

  aSqlTrans := TSQL.Create('ase_solicitudestablecimiento');
  aQuery := GetQueryEx(sSql, [aContrato], [qoUnidirectional]);
  try
    while not aQuery.Eof do
    begin
      aSqlTrans.SqlType := stInsert;
      iSE_ID := ValorSql('SELECT afi.seq_ase_id.NEXTVAL FROM DUAL');
      iSE_NROESTABLECI := ValorSqlEx('SELECT NVL(MAX(se_nroestableci), 0) + 1' +
                                      ' FROM ase_solicitudestablecimiento' +
                                     ' WHERE se_idsolicitud = :idsolicitud', [aIdSolicitud]);
      aSqlTrans.PrimaryKey.Add('se_id',               iSE_ID, False);
      aSqlTrans.Fields.Add('se_idsolicitud',          aIdSolicitud);
      aSqlTrans.Fields.Add('se_nroestableci',         iSE_NROESTABLECI);
      aSqlTrans.Fields.AddExtended('se_masa',         aQuery.FieldByName('es_masa').AsFloat, ALL_DECIMALS, False);
      aSqlTrans.Fields.Add('se_idactividad',          aQuery.FieldByName('es_idactividad').AsString);
      aSqlTrans.Fields.Add('se_codareafax',           aQuery.FieldByName('es_codareafax').AsString);
      aSqlTrans.Fields.Add('se_codareatelefonos',     aQuery.FieldByName('es_codareatelefonos').AsString);
      aSqlTrans.Fields.Add('se_cpostala',             aQuery.FieldByName('es_cpostala').AsString);
      aSqlTrans.Fields.Add('se_departamento',         aQuery.FieldByName('es_departamento').AsString);
      aSqlTrans.Fields.Add('se_empleados',            aQuery.FieldByName('es_empleados').AsString);
      aSqlTrans.Fields.Add('se_fax',                  aQuery.FieldByName('es_fax').AsString);
      aSqlTrans.Fields.Add('se_fechainicest',         aQuery.FieldByName('es_fechainicest').AsDateTime);
      aSqlTrans.Fields.Add('se_feinicactiv',          aQuery.FieldByName('es_feinicactiv').AsDateTime);
      aSqlTrans.Fields.Add('se_nivel',                aQuery.FieldByName('es_nivel').AsString);
      aSqlTrans.Fields.Add('se_nombre',               aQuery.FieldByName('es_nombre').AsString);
      aSqlTrans.Fields.Add('se_numero',               aQuery.FieldByName('es_numero').AsString);
      aSqlTrans.Fields.Add('se_observaciones',        aQuery.FieldByName('es_observaciones').AsString);
      aSqlTrans.Fields.Add('se_piso',                 aQuery.FieldByName('es_piso').AsString);
      aSqlTrans.Fields.Add('se_telefonos',            aQuery.FieldByName('es_telefonos').AsString);
      aSqlTrans.Fields.Add('se_domicilio',            aQuery.FieldByName('es_domicilio').AsString);
      aSqlTrans.Fields.Add('se_calle',                aQuery.FieldByName('es_calle').AsString);
      aSqlTrans.Fields.Add('se_localidad',            aQuery.FieldByName('es_localidad').AsString);
      aSqlTrans.Fields.Add('se_cpostal',              aQuery.FieldByName('es_cpostal').AsString);
      aSqlTrans.Fields.Add('se_provincia',            aQuery.FieldByName('es_provincia').AsString);
      aSqlTrans.Fields.AddExtended('se_superficie',   aQuery.FieldByName('es_superficie').AsFloat, 2, True);
      aSqlTrans.Fields.Add('se_descripcionactividad', aQuery.FieldByName('es_descripcionactividad').AsString);
      aSqlTrans.Fields.Add('se_usubaja',              aQuery.FieldByName('es_usubaja').AsString);
      aSqlTrans.Fields.Add('se_fechabaja',            TDateTime(IIF((aQuery.FieldByName('es_fechabaja').IsNull), DBDateTime, aQuery.FieldByName('es_fechabaja').AsDateTime)));
      aSqlTrans.Fields.Add('se_usualta',              Sesion.UserId);
      aSqlTrans.Fields.Add('se_fechaalta',            'ACTUALDATE', False);

      EjecutarSQLST(aSqlTrans.Sql);
      CargarTelefonosFromEstablecimientos(aQuery.FieldByName('es_id').AsInteger, iSE_ID);
      aSqlTrans.Clear;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
    aSqlTrans.Free;
  end;
end;

procedure TfrmCargaSolicitudes.CargarTelefonosFromEstablecimientos(const aEstOld, aEstablecimientoId: Integer);
var
  sSql: String;
  sSqlTrans: TSql;
begin
  sSqlTrans := TSQL.Create('asf_solicitudtelefonoestableci');
  sSqlTrans.SqlType := stInsert;

  sSql :=
    'SELECT *' +
     ' FROM ate_telefonoestablecimiento' +
    ' WHERE te_idestablecimiento = :idestablecimiento';

  with GetQueryEx(sSql, [aEstOld]) do
  try
    while not Eof do
    begin
      sSqlTrans.Fields.Clear;
      sSqlTrans.Fields.Add('sf_id',                1);
      sSqlTrans.Fields.Add('sf_idestablecimiento', aEstablecimientoId);
      sSqlTrans.Fields.Add('sf_idtipotelefono',    FieldByName('te_idtipotelefono').AsInteger);
      sSqlTrans.Fields.Add('sf_area',              FieldByName('te_area').AsString);
      sSqlTrans.Fields.Add('sf_numero',            FieldByName('te_numero').AsString);
      sSqlTrans.Fields.AddInteger('sf_interno',    FieldByName('te_interno').AsInteger, True);
      sSqlTrans.Fields.Add('sf_principal',         FieldByName('te_principal').AsString);
      sSqlTrans.Fields.Add('sf_observacion',       FieldByName('te_observacion').AsString);
      EjecutarSQLST(sSqlTrans.Sql);

      Next;
      Application.ProcessMessages;
    end;
  finally
    sSqlTrans.Free;
    Free;
  end;

  fraContacto.fraTelefonos.FillCombo(False, 0);
end;

procedure TfrmCargaSolicitudes.CambiaMotivoAlta(Sender: TObject);
var
  bLockear: Boolean;
begin
  bLockear := (fraSA_MOTIVOALTA.IsEmpty) or ((fraSA_MOTIVOALTA.Value <> '02') and (fraSA_MOTIVOALTA.Value <> '05'));
  VCLExtra.LockControls(fraSA_ARTANTERIOR, bLockear);
end;

procedure TfrmCargaSolicitudes.CambiaSector(Sender: TObject);
begin
  if fraSA_SECTOR.IsSelected then
    if fraSA_SECTOR.Value = '4' then
      fraSA_SUSS.Value := '1'
    else
      fraSA_SUSS.Value := '2';
end;

procedure TfrmCargaSolicitudes.ClearControls;
begin
  lbWorldSys.Caption := '';

  FModoABM := maAlta;
  FMotivoAlta := -1;
  fraSA_ORIGEN.Value := '3'; //Valor por default
  CambiaOrigen(fraSA_ORIGEN);

  fraSA_SECTOR.Value := '4'; //Valor por default
  fraSA_SUSS.Value := '1'; //valor por default
  fCuit := '';
  FPresentoRGRL := '';
  FClausulasAdicionales := '';
  edSA_FORMULARIO.Clear;
  edFechaSuscripcion.Clear;
  edVigencia.Clear;
  edSA_HOJASLEGAJOS.Value := 0;
  dcbFechaRecepcionAfiliaciones.Clear;
  edFechaRecepcionFaxEmail.Clear;

  fraEntidad.Vendedor := ART_EMPTY_ID;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraCanal.Clear;
  fraEntidad.Clear;
  CambiaEntidad(fraEntidad);

  fraSucursal.Clear;
  fraVendedor.Clear;
  fraEstado.Clear;

  cmbSA_NOMBRE.Clear;
  edSA_CUIT.Clear;
  fraSA_FORMAJ.Clear;
  fraSA_MOTIVOALTA.Clear;
  CambiaMotivoAlta(nil);

  fraSA_ARTANTERIOR.Clear;
  edSA_FEINICACTIV.Clear;
  fraSA_HOLDING.Clear;
  fraDOMICILIO_LEGAL.Clear;

  fraTELEFONO_LEGAL.Clear(True);
  fraTELEFONO_LEGAL.ShowCargaRapida := True;
  fraTELEFONO_POSTAL.Clear(True);
  fraTELEFONO_POSTAL.ShowCargaRapida := True;
  fraContacto.fraTelefonos.Clear(True);
  fraContacto.fraTelefonos.ShowCargaRapida := True;

  edSA_CODAREAFAX.Clear;
  edSA_FAX.Clear;
  edSA_MAIL_LEGAL.Clear;
  fraDomicilioPostal.Clear;
  edSA_CODAREAFAX_POST.Clear;
  edSA_FAX_POST.Clear;
  edSA_MAIL_POSTAL.Clear;

  edSA_TITULAR.Clear;
  fraTipoDocumento.Clear;
  edNumeroDocumento.Clear;
  cmbSA_SEXO_TITULAR.ItemIndex := -1; //Default -1
  edSA_TELEFONO_TITULAR.Clear;
  edSA_DIRELECTRONICA_TITULAR.Clear;

  edUsuarioRevision.Clear;
  edFechaRevision.Clear;

  fraCargo.Clear;
  edSA_NOMBRE_VENDEDOR.Clear;

  fraCuadroTarifario.Clear;
  fraCIIU2.Clear;
  fraCIIU3.Clear;
  fraContacto.Clear;
  edSA_OBSERVACIONES.Clear;
  edSA_OBSERVACIONES_POST.Clear;
  edSA_NROINTERNO.Clear;
  edSA_NROINTERNO.ReadOnly := False;
  edSA_NROINTERNO.Color := clWindow;
  edFranquicia.Value := 10;
  fraCIIU2.Clear;
  fraCIIU3.Clear;
  FEsModificacion := False;
  iID_Modificacion := ART_EMPTY_ID;
  tbDocumentacion.Enabled := False;
  lbRecepcion.Visible := False;
  lbPcp.Visible := False;
  //fraCuadroTarifario.fraTIPOTARIFA.Value := ValorSql('SELECT TB_CODIGO FROM CTB_TABLAS WHERE TB_CLAVE = ''TARIF'' AND TB_ESPECIAL1 = ''D''');
  BloqueaTarifas(False);
end;

procedure TfrmCargaSolicitudes.btnCrearRelacionClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT NVL(en_crearvendedor, ''N'')' +
     ' FROM xen_entidad' +
    ' WHERE en_id = :id';

  if ValorSqlEx(sSql, [fraEntidad.Value]) = 'S' then
    CrearVendedor
  else
    CrearRelacion;
end;

procedure TfrmCargaSolicitudes.btnCancelarVendedorClick(Sender: TObject);
begin
  fpVendedor.ModalResult := mrCancel;
end;

procedure TfrmCargaSolicitudes.btnAceptarVendedorClick(Sender: TObject);
var
  sSql: String;
begin
  //Validaciones
  if fraEntidadVendedor.IsEmpty then
    raise Exception.Create('Debe elegir la entidad que desea asociar al vendedor.');

  sSql :=
    'SELECT 1' +
     ' FROM xen_entidad, xev_entidadvendedor' +
    ' WHERE en_id = ev_identidad' +
      ' AND en_id = :id' +
      ' AND ev_idvendedor = :idvendedor' +
      ' AND ev_fechabaja IS NULL';

  if ExisteSqlEx(sSql, [fraEntidadVendedor.Value, fraVendedor.Value]) then
    raise Exception.Create('La relación con esta entidad ya existe.');

  //Sigue adelante con la rutina
  fpVendedor.ModalResult := mrOk;
end;

procedure TfrmCargaSolicitudes.CrearVendedor;
var
  iCanalId: Integer;
  IdVendedor: Integer;
  Sql: TSql;
  sSql: String;
begin
  //Crea la relacion para el actual si no está creada ya...
  if MsgBox('¿ Desea ingresar el vendedor asociado ?', MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    if fpNacion.ShowModal = mrOK then
    begin
      Sql := TSql.Create('xve_vendedor');
      BeginTrans;
      try
        try
          sSql :=
            'SELECT ve_id' +
             ' FROM xve_vendedor' +
            ' WHERE ve_vendedor = :vendedor';
          IdVendedor := ValorSqlIntegerEx(sSql, [Trim(edVendedorNacion.Text)], 0);

          sSql :=
            'SELECT en_idcanal' +
             ' FROM xen_entidad' +
            ' WHERE en_id = :id';
          iCanalId := ValorSqlIntegerEx(sSql, [fraEntidad.Value]);

          if IdVendedor = 0 then
          begin
            sSql := 'SELECT seq_xve_id.NEXTVAL FROM DUAL';
            IdVendedor := ValorSqlInteger(sSql, 0);

            Sql.Clear;
            Sql.SqlType := stInsert;
            Sql.TableName := 'xve_vendedor';
            Sql.PrimaryKey.Add('ve_id',     IdVendedor, False);
            Sql.Fields.Add('ve_vendedor',   Trim(edVendedorNacion.Text));
            Sql.Fields.Add('ve_nombre',     'Vendedor ' + fraEntidad.cmbDescripcion.Text);
            Sql.Fields.Add('ve_idcanal',    iCanalId);
            Sql.Fields.Add('ve_tipovend',   'I');
            Sql.Fields.Add('ve_sitiva',     '2');
            Sql.Fields.Add('ve_usualta',    Sesion.USerId);
            Sql.Fields.Add('ve_fechaalta', 'ACTUALDATE', False);
            EjecutarSqlST(Sql.Sql);
          end;
            
          //Crea la relacion
          Sql.Clear;
          Sql.SqlType := stInsert;
          Sql.TableName := 'xev_entidadvendedor';
          Sql.PrimaryKey.Add('ev_id',                  'SEQ_XEV_ID.NEXTVAL', False);
          Sql.Fields.Add('ev_idvendedor',              IdVendedor, dtNumber);
          Sql.Fields.Add('ev_identidad',               fraEntidad.Value, dtNumber);
          Sql.Fields.AddExtended('ev_porccomision',    Get_PorcComisionVendedor(fraEntidad.Value));
          Sql.Fields.AddExtended('ev_porccomisionpub', Get_PorcComisionVendedorPub(fraEntidad.Value));
          Sql.Fields.Add('ev_usualta',                 Sesion.USerId);
          Sql.Fields.Add('ev_fechaalta',               'ACTUALDATE', False);
          EjecutarSqlST(Sql.Sql);

          FraVendedor.Clear;
          FraVendedor.Entidad := fraEntidad.Value;
          FraVendedor.Value := IdVendedor;

          CommitTrans;
          MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        except
          on E:Exception do
          begin
            RollBack;
            MessageDlg('Error al guardar los datos' + #13#10 + E.Message, mtError, [mbOK], 0);
          end;
        end;
      finally
        Sql.Free;
      end;
    end;
  end;
end;

procedure TfrmCargaSolicitudes.ClickFirmaPresento(Sender: TObject);
var
  aCheck: TCheckBox;
begin
  if not TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(TCheckBox(Sender).Tag)));
    if aCheck <> nil then
      aCheck.Checked := False;
  end;
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag);
end;

procedure TfrmCargaSolicitudes.ClickFirmaTitular(Sender: TObject);
var
  aCheck: TCheckBox;
begin
  if TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('_check_' + IntToStr(TCheckBox(Sender).Tag)));
    if not aCheck.Checked then
    begin
      TCheckBox(Sender).Checked := False;
      InfoHint(aCheck, 'Antes de tildar si el documento fue firmado por el titular/apoderado debe indicar la existencia del documento.');
    end;
  end;
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag);
end;

procedure TfrmCargaSolicitudes.CrearComponentesDocumentacion;
  procedure CrearCheckBox(const aChecked: Boolean; const aCaption, aName: String; const aLeft, aTag, aTop,
                          aWidth: Integer; const aParent: TGroupBox; const aOnClick: TNotifyEvent);
  begin
    with TCheckBox.Create(Self) do
    begin
      Caption := aCaption;
      Checked := aChecked;
      Left    := aLeft;
      Name    := aName;
      Parent  := aParent;
      Tag     := aTag;
      Top     := aTop;
      Width   := aWidth;

      OnClick := aOnClick;
    end;
  end;

var
  iTop: Integer;
  sSql: String;
begin
  // Agrego la personería firmante..
  sSql :=
    'SELECT   df_default, df_descripcion, df_id, df_firmatitular, df_firmavendedor, df_ctrl_faltante' +
       ' FROM adf_documentoafi' +
      ' WHERE df_tipodocumento = ''P''' +
        ' AND df_fechabaja IS NULL' +
   ' ORDER BY df_orden';
  with GetQuery(sSql) do
  try
    iTop := 32;
    while not Eof do
    begin
      CrearCheckBox((FieldByName('df_default').AsString = 'S'),
                    FieldByName('df_descripcion').AsString, '_check_' + FieldByName('df_id').AsString, 24,
                    FieldByName('df_id').AsInteger, iTop, 220, gbPersoneriaFirmante, ClickFirmaPresento);

      if FieldByName('df_firmatitular').AsString = 'S' then
        CrearCheckBox((FieldByName('df_default').AsString = 'S'), '',
                      'check_firmatitular_' + FieldByName('df_id').AsString, 280, FieldByName('df_id').AsInteger, iTop,
                      16, gbPersoneriaFirmante, ClickFirmaTitular);

      if FieldByName('df_firmavendedor').AsString = 'S' then
        CrearCheckBox((FieldByName('df_default').AsString = 'S'), '',
                      'check_firmavendedor_' + FieldByName('df_id').AsString, 460, FieldByName('df_id').AsInteger, iTop,
                      16, gbPersoneriaFirmante, ClickFirmaVendedor);

      if FieldByName('df_ctrl_faltante').AsString = 'S' then
        CrearCheckBox(False, '',
                      'check_faltante_'+ FieldByName('df_id').AsString, 615, FieldByName('df_id').AsInteger, iTop,
                      16, gbPersoneriaFirmante, nil {ClickFirmaFaltante});

      Inc(iTop, 20);
      Next;
    end;

    gbPersoneriaFirmante.Height := iTop + 8;
    gbFormulariosAnexos.Top := gbPersoneriaFirmante.Top + gbPersoneriaFirmante.Height + 8;
  finally
    Free;
  end;


  // Agrego los formularios y anexos..
  sSql :=
    'SELECT   df_default, df_descripcion, df_id, df_firmatitular, df_firmavendedor, df_ctrl_faltante' +
       ' FROM adf_documentoafi' +
      ' WHERE df_tipodocumento = ''F''' +
        ' AND df_fechabaja IS NULL' +
   ' ORDER BY df_orden';
  with GetQuery(sSql) do
  try
    iTop := 32;
    while not Eof do
    begin
      CrearCheckBox((FieldByName('df_default').AsString = 'S'),
                    FieldByName('df_descripcion').AsString, '_check_' + FieldByName('df_id').AsString, 24,
                    FieldByName('df_id').AsInteger, iTop, 220, gbFormulariosAnexos, ClickFirmaPresento);

      if FieldByName('df_firmatitular').AsString = 'S' then
        CrearCheckBox((FieldByName('df_default').AsString = 'S'), '',
                      'check_firmatitular_' + FieldByName('df_id').AsString, 280, FieldByName('df_id').AsInteger, iTop,
                      16, gbFormulariosAnexos, ClickFirmaTitular);

      if FieldByName('df_firmavendedor').AsString = 'S' then
        CrearCheckBox((FieldByName('df_default').AsString = 'S'), '',
                      'check_firmavendedor_' + FieldByName('df_id').AsString, 460, FieldByName('df_id').AsInteger, iTop,
                      16, gbFormulariosAnexos, nil);

      if FieldByName('df_ctrl_faltante').AsString = 'S' then
        CrearCheckBox(False , '',
                      'check_faltante_'+ FieldByName('df_id').AsString, 615, FieldByName('df_id').AsInteger, iTop,
                      16, gbFormulariosAnexos, nil {ClickFirmaFaltante});

      Inc(iTop, 20);
      Next;
    end;

    gbFormulariosAnexos.Height := iTop + 8 + btnRefreshDoc.Height;
    btnRefreshDoc.Top := iTop - 2;
    btnRefreshDoc.Left := 610;

  finally
    Free;
  end;

  gbPep.Top             :=  gbFormulariosAnexos.Top + gbFormulariosAnexos.Height + 8;

  gbRevision.Top        := gbPep.Top + gbPep.Height + 8;
  edSA_HOJASLEGAJOS.Top := gbRevision.Top + gbRevision.Height + 8;
  lblCantidadHojas.Top  := edSA_HOJASLEGAJOS.Top + 3;

  gbDatosTitular.Height := edSA_HOJASLEGAJOS.Top + edSA_HOJASLEGAJOS.Height + 8;
  gbDatosVendedor.Top   := gbDatosTitular.Top + gbDatosTitular.Height + 8;
  //gbRevisionOk.Top      := gbDatosVendedor.Top;
  gbAceptar.Top         := gbDatosVendedor.Top + gbDatosVendedor.Height + 8;
end;

procedure TfrmCargaSolicitudes.CrearRelacion;
var
  Sql: TSql;
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM xen_entidad, xev_entidadvendedor' +
    ' WHERE en_id = ev_identidad' +
      ' AND en_modoliq = ''03''' +
      ' AND ev_idvendedor = :idvendedor' +
      ' AND ev_fechabaja IS NULL';
  if fraVendedor.IsEmpty or not ExisteSqlEx(sSql, [fraVendedor.Value]) then
    raise Exception.Create('Para poder crear la nueva relación, el vendedor debe pertenecer a alguna delegación del Banco Provincia.');

  //Crea la relacion para el actual si no está creada ya...
  if MsgBox('¿ Desea crear una nueva relación con una entidad del Banco Provincia ?', MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    if fpVendedor.ShowModal = mrOK then
    begin
      Sql := TSql.Create('xev_entidadvendedor');
      try
        Sql.SqlType := stInsert;
        Sql.PrimaryKey.Add('ev_id',                  'SEQ_XEV_ID.NEXTVAL', False);
        Sql.Fields.Add('ev_idvendedor',              fraVendedor.Value);
        Sql.Fields.Add('ev_identidad',               fraEntidadVendedor.Value);
        Sql.Fields.AddExtended('ev_porccomision',    Get_PorcComisionVendedor(fraEntidadVendedor.Value));
        Sql.Fields.AddExtended('ev_porccomisionpub', Get_PorcComisionVendedorPub(fraEntidadVendedor.Value));
        Sql.Fields.Add('ev_usualta',                 Sesion.USerId);
        Sql.Fields.Add('ev_fechaalta',               'ACTUALDATE', False);
        EjecutarSql(Sql.Sql);

        fraEntidad.Clear;
        fraEntidad.Vendedor := FraVendedor.Value;
        fraEntidad.Value := fraEntidadVendedor.Value;
        CambiaEntidad(fraEntidad);
      finally
        Sql.Free;
      end;
    end;
  end;
end;

procedure TfrmCargaSolicitudes.btnCancelarNacionClick(Sender: TObject);
begin
  fpNacion.ModalResult := mrCancel;
end;

procedure TfrmCargaSolicitudes.btnAceptarNacionClick(Sender: TObject);
var
  sSql: String;
begin
  //Validaciones
  if (Trim(edVendedorNacion.Text) = '') then
    raise Exception.Create('El número de vendedor es obligatorio.');

  if EsBancoNacion(fraEntidad.Code) then
  begin
    if (Length(Trim(edVendedorNacion.Text)) <> 10) then
      raise Exception.Create('El número de vendedor no es correcto.');

    if (edVendedorNacion.Text = '0000-00000') then
      raise Exception.Create('El número de vendedor no es correcto.');
  end;

  sSql :=
    'SELECT 1' +
     ' FROM xve_vendedor, xev_entidadvendedor' +
    ' WHERE ev_identidad = :identidad' +
      ' AND ve_vendedor = :vendedor' +
      ' AND ev_fechabaja IS NULL';
  if ExisteSqlEx(sSql, [fraEntidad.Value, Trim(edVendedorNacion.Text)]) then
    raise Exception.Create('La relación con este vendedor ya existe.');

  //Sigue adelante con la rutina
  fpNacion.ModalResult := mrOk;
end;

procedure TfrmCargaSolicitudes.CargarNominaFromContrato(const aContrato, aIdSolicitud: Integer);
var
  IDEstablecimiento: Integer;
  IDTrabajador: Integer;
  NroEstablecimiento: Integer;
  Query: TSDQuery;
  SqlTrabajador: TSql;
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM ctj_trabajador, crl_relacionlaboral' +
    ' WHERE rl_idtrabajador = tj_id' +
      ' AND rl_contrato = :contrato';

  SqlTrabajador := TSQL.Create('ast_solicitudtrabajador');
  Query := GetQueryEx(sSql, [aContrato], [qoUnidirectional]);
  try
    while not Query.Eof do
    begin
      sSql :=
        'SELECT es_nroestableci' +
         ' FROM aes_establecimiento, cre_relacionestablecimiento' +
        ' WHERE re_idestablecimiento = es_id' +
          ' AND re_idrelacionlaboral = :idrelacionlaboral';
      NroEstablecimiento := ValorSqlIntegerEx(sSql, [Query.FieldByName('rl_id').AsInteger]);

      sSql :=
        'SELECT se_id' +
         ' FROM ase_solicitudestablecimiento' +
        ' WHERE se_idsolicitud = :idsolicitud' +
          ' AND se_nroestableci = :nroestableci';
      IDEstablecimiento  := ValorSqlIntegerEx(sSql, [aIdSolicitud, NroEstablecimiento]);
      
      //Si no se encontro un establecimiento de los migrados anteriormente
      //migra todo a cualquier establecimiento (al primero)
      if IDEstablecimiento = ART_EMPTY_ID then
      begin
        sSql :=
          'SELECT MIN(se_id)' +
           ' FROM ase_solicitudestablecimiento' +
          ' WHERE se_idsolicitud = :idsolicitud';
        IDEstablecimiento  := ValorSqlIntegerEx(sSql, [aIdSolicitud]);
      end;
      SqlTrabajador.Clear;
      SqlTrabajador.SqlType := stInsert;
      IDTrabajador := ValorSql('SELECT seq_ast_id.NEXTVAL FROM DUAL');
      SqlTrabajador.PrimaryKey.Add('st_id',         IDTrabajador, False);
      SqlTrabajador.Fields.Add('st_idsolicitud',    aIdSolicitud, False);
      SqlTrabajador.Fields.Add('st_idsolicitudest', IDEstablecimiento);
      SqlTrabajador.Fields.Add('st_usualta',        Sesion.UserID);
      SqlTrabajador.Fields.Add('st_fechaalta',      'ACTUALDATE', False);

      //Campos
      SqlTrabajador.Fields.Add('st_cuil',         Query.FieldByName('tj_cuil').AsString);
      SqlTrabajador.Fields.Add('st_documento',    Query.FieldByName('tj_documento').AsString);
      SqlTrabajador.Fields.Add('st_nombre',       Query.FieldByName('tj_nombre').AsString);
      SqlTrabajador.Fields.Add('st_sexo',         Query.FieldByName('tj_sexo').AsString);
      SqlTrabajador.Fields.Add('st_fnacimiento',  Query.FieldByName('tj_fnacimiento').AsDateTime);
      SqlTrabajador.Fields.Add('st_tarea',        Query.FieldByName('rl_tarea').AsString);
      SqlTrabajador.Fields.Add('st_sueldo',       Query.FieldByName('rl_sueldo').AsFloat, dtNumber);
      SqlTrabajador.Fields.Add('st_categoria',    Query.FieldByName('rl_categoria').AsString);
      SqlTrabajador.Fields.Add('st_fechaingreso', Query.FieldByName('rl_fechaingreso').AsFloat);

      EjecutarSqlST(SqlTrabajador.Sql);

      Query.Next;
    end;
  finally
    Query.Free;
    SqlTrabajador.Free;
  end;
end;

procedure TfrmCargaSolicitudes.fpNacionEnter(Sender: TObject);
begin
  edVendedorNacion.Clear;

  if EsBancoNacion(fraEntidad.Code) then
    edVendedorNacion.EditMask := '9999-99999;1;_'
  else
    edVendedorNacion.EditMask := '999999999;1;_';
end;

function TfrmCargaSolicitudes.EsBancoNacion(Codigo: String): Boolean;
begin
  Result := (Codigo = '400');   // BANCO DE LA NACION ARGENTINA
end;

procedure TfrmCargaSolicitudes.Mostrar(const aEsAlta: Boolean);
begin
// Uso este evento en vez del create por un posible bug de Delphi al destruir formularios..
  fraTELEFONO_LEGAL.Initialize('TS_SOLICITUD', aEsAlta, False, 'TS', 'ATS_TELEFONOSOLICITUD', 'L');
  fraTELEFONO_POSTAL.Initialize('TS_SOLICITUD', aEsAlta, False, 'TS', 'ATS_TELEFONOSOLICITUD', 'P');
  fraContacto.fraTelefonos.Initialize('TS_SOLICITUD', aEsAlta, False, 'TS', 'ATS_TELEFONOSOLICITUD', 'X');

  Self.Show;
end;

procedure TfrmCargaSolicitudes.fraSA_FORMAJExit(Sender: TObject);
begin
  fraSA_FORMAJ.FrameExit(Sender);

  if fraSA_FORMAJ.Codigo = '009' then
    if fraContacto.Contacto = '' then
      fraContacto.Contacto := cmbSA_NOMBRE.Text;

  FiltrarFirmante;

  ActualizarDocumentacionFaltante;
end;

procedure TfrmCargaSolicitudes.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
                                              var Handled: Boolean);
var
  code: Cardinal;
  i: Integer;
  msg: Cardinal;
  n: Integer;
begin
  Handled := True;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n:= Mouse.WheelScrollLines;
  for i:= 1 to n do
    ScrollBox.Perform(msg, code, 0);
  ScrollBox.Perform(msg, SB_ENDSCROLL, 0);
end;

function TfrmCargaSolicitudes.TarifaVerificada(const aIdSolicitudAfiliacion: Integer; const aCuit: String;
                                               var aSolicitudCotizacionId: Integer;
                                               var aMotivosNoAprobacionTarifa: String; const aMasaTotal, aAlicuotaPesos,
                                               aAlicuotaPorcentaje, aTotalEmpleados: Extended): Boolean;
var
  iIdFormulario: Integer;
  sSql: String;
begin
  Result := True;

  aMotivosNoAprobacionTarifa := '';

  sSql :=
    'SELECT 1' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = ' + SqlValue(aIdSolicitudAfiliacion) +
      ' AND sa_tipocotizacion = ''R''';
  if ExisteSql(sSql) then   // Si es una reafiliación se aprueba automaticamente..
    Exit;


  if fraSA_MOTIVOALTA.Codigo = '04' then
  begin
    Result := False;
    aMotivosNoAprobacionTarifa := aMotivosNoAprobacionTarifa + ' Motivo de Alta Re-Afiliación.';
  end;


  sSql :=
    'SELECT sa_idformulario' +
     ' FROM asa_solicitudafiliacion, asc_solicitudcotizacion' +
    ' WHERE sa_idformulario = sc_idformulario' +
      ' AND sa_id = :id';
  iIdFormulario := ValorSqlIntegerEx(sSql, [aIdSolicitudAfiliacion]);


  sSql :=
    'SELECT CASE' +
            ' WHEN sc_idcotizacion IS NULL THEN sc_idactividad' +
            ' ELSE co_idactividad' +
          ' END actividad, CASE' +
            ' WHEN sc_idcotizacion IS NULL THEN sc.sc_masasalarial' +
            ' ELSE co.co_masasalarial' +
          ' END masa, CASE' +
            ' WHEN sc_idcotizacion IS NULL THEN sc.sc_canttrabajador' +
            ' ELSE co.co_canttrabajador' +
          ' END canttrabajador, sc.sc_finalsumafija, ROUND(sc.sc_finalporcmasa, 4) AS finalporcmasa, sc_id' +
     ' FROM asc_solicitudcotizacion sc' +
' LEFT JOIN aco_cotizacion co ON co_id = sc_idcotizacion' +
    ' WHERE (TRUNC(sc_fechavigencia) - ACTUALDATE) <= 30';

  if iIdFormulario > 0 then
    sSql := sSql + ' AND sc_idformulario = ' + SqlValue(iIdFormulario)
  else
  begin
    sSql := sSql +
      ' AND sc.sc_id = (SELECT MAX(s.sc_id)' +
                        ' FROM asc_solicitudcotizacion s' +
                       ' WHERE sc.sc_cuit = s.sc_cuit)' +
      ' AND sc_cuit = ' + SqlValue(aCuit);
  end;

  with GetQuery(sSql) do
  try
    if FieldByName('actividad').AsInteger <> fraCuadroTarifario.fraCIIU.Value then
    begin
      Result := False;
      aMotivosNoAprobacionTarifa := aMotivosNoAprobacionTarifa + ' El CIIU principal es distinto al de la cotización.';
    end;

    if Round(FieldByName('masa').AsFloat) <> Round(fraCuadroTarifario.edMASATOTAL.Value) then
    begin
      Result := False;
      aMotivosNoAprobacionTarifa := aMotivosNoAprobacionTarifa + ' La masa es distinta al de la cotización.';
    end;

    if not FEsPCP then
      if FieldByName('canttrabajador').AsInteger <> fraCuadroTarifario.edTOTEMPLEADOS.Value then
      begin
        Result := False;
        aMotivosNoAprobacionTarifa := aMotivosNoAprobacionTarifa + ' La cantidad de trabajadores es distinta al de la cotización.';
      end;

    if not FEsPCP then   //pedido de vila en el mail del martes, 21 de octubre de 2014 11:53 a.m.
      if Abs(RoundTo(FieldByName('sc_finalsumafija').AsFloat, -2) - RoundTo(fraCuadroTarifario.edALICUOTAPESOS.Value, -2)) > 0.02 then
      begin
        Result := False;
        aMotivosNoAprobacionTarifa := aMotivosNoAprobacionTarifa + ' La suma fija de la tarifa es distinta a la de la cotización.';
      end;

    if Abs(RoundTo(FieldByName('finalporcmasa').AsFloat, -3) - RoundTo(fraCuadroTarifario.edALICUOTAPORC.Value, -3)) > 0.002 then
    begin
      Result := False;
      aMotivosNoAprobacionTarifa := aMotivosNoAprobacionTarifa + ' El porcentaje variable de la tarifa es distinto a la de la cotización.';
    end;

    aSolicitudCotizacionId := FieldByName('sc_id').AsInteger;
  finally
    Free;
  end;
end;

procedure TfrmCargaSolicitudes.btnCancelarClick(Sender: TObject);
begin
  fpMasDatos.ModalResult := mrCancel;
end;

procedure TfrmCargaSolicitudes.btnAceptar2Click(Sender: TObject);
begin
  fpMasDatos.ModalResult := mrOk;
end;

procedure TfrmCargaSolicitudes.GetTarifaFromCotizacion(const aNumeroFormulario: String);
var
  sSql: String;
begin
  if Copy(aNumeroFormulario, 1, 1) = '6' then   // Si es una solicitud de cotización..
    sSql :=
      'SELECT NVL(co_canttrabajador, sc_canttrabajador) canttrabajadores, NVL(co_idactividad, sc_idactividad) ciiu1,' +
            ' sc_idactividad2 ciiu2, sc_idactividad3 ciiu3, NVL(co_cuit, sc_cuit) cuit, sc_identidad entidad,' +
            ' NVL(co_masasalarial, sc_masasalarial) masasalarial, tc_porcvariable porcvariable,' +
            ' NVL(co_razonsocial, sc_razonsocial) razonsocial, tc_sumafija sumafija, sc_idvendedor vendedor' +
       ' FROM asc_solicitudcotizacion sc, aco_cotizacion cotizaciones, atc_tarifacobrar' +
      ' WHERE sc_idcotizacion = co_id' +
        ' AND tc_id = (SELECT MAX(tc_id)' +
                       ' FROM atc_tarifacobrar' +
                      ' WHERE tc_idcotizacion = co_id)' +
        ' AND sc_nrosolicitud = ' + SqlInteger(Copy(aNumeroFormulario, 2, 10)) +
     ' UNION ALL' +
     ' SELECT sc_canttrabajador, sc_idactividad, sc_idactividad2, sc_idactividad3, sc_cuit, sc_identidad,' +
            ' sc_masasalarial, sc_finalporcmasa, sc_razonsocial, sc_finalsumafija, sc_idvendedor' +
       ' FROM asc_solicitudcotizacion sc' +
      ' WHERE sc_idcotizacion IS NULL' +
        ' AND sc_nrosolicitud = ' + SqlInteger(Copy(aNumeroFormulario, 2, 10));

  if Copy(aNumeroFormulario, 1, 1) = '7' then   // Si es una revisión de precio..
    sSql :=
      'SELECT DECODE(NVL(sr_canttrabajadores, 0), 0, hc_totempleadosmayorcero, sr_canttrabajadores) canttrabajadores,' +
            ' NVL(sr_idactividad1, hc_idactividad) ciiu1, NVL(sr_idactividad2, hc_idactividad2) ciiu2,' +
            ' NVL(sr_idactividad3, hc_idactividad3) ciiu3, sr_cuit cuit, sr_identidad entidad,' +
            ' DECODE(NVL(sr_masasalarial, 0), 0, hc_masatotalmayorcero, sr_masasalarial) masasalarial,' +
            ' NVL(sr_porcentajevariablecotizado, sr_porcentajevariable) porcvariable, em_nombre razonsocial,' +
            ' NVL(sr_costofijocotizado, sr_costofijo) sumafija, sr_idvendedor vendedor' +
       ' FROM asr_solicitudreafiliacion asr, ahc_historicocontrato, aem_empresa' +
      ' WHERE sr_idhistoricocontrato = hc_id' +
        ' AND hc_idempresa = em_id' +
        ' AND sr_nrosolicitud = ' + SqlInteger(Copy(aNumeroFormulario, 2, 10));

  with GetQuery(sSql) do
  try
    with fraCuadroTarifario do
    begin
      edTOTEMPLEADOS.Value  := FieldByName('canttrabajadores').AsInteger;
      fraCIIU.Value         := FieldByName('ciiu1').AsInteger;
      fraCIIU2.Value        := FieldByName('ciiu2').AsInteger;
      fraCIIU3.Value        := FieldByName('ciiu3').AsInteger;
      edSA_CUIT.Text        := FieldByName('cuit').AsString;

      fraEntidad.Value      := FieldByName('entidad').AsInteger;
      CambiaEntidad(fraEntidad);

      edMASATOTAL.Value     := FieldByName('masasalarial').AsFloat;
      edALICUOTAPORC.Value  := FieldByName('porcvariable').AsFloat;
      cmbSA_NOMBRE.Text     := FieldByName('razonsocial').AsString;
      edALICUOTAPESOS.Value := FieldByName('sumafija').AsFloat;
      fraVendedor.Value     := FieldByName('vendedor').AsInteger;

      Actualizar;

      FDatosCotizacion.Ciiu               := fraCIIU.Value;
      FDatosCotizacion.Empleados          := Trunc(edTOTEMPLEADOS.Value);
      FDatosCotizacion.MasaSalarial       := edMASATOTAL.Value;
      FDatosCotizacion.PorcentajeVariable := edALICUOTAPORC.Value;
      FDatosCotizacion.SumaFija           := edALICUOTAPESOS.Value;
    end;
  finally
    Free;
  end;
end;

procedure TfrmCargaSolicitudes.GuardarCostosPCP;
var
  aSql: TSQL;
  sSql : String;
  idAlicuota, I : Integer;

begin
  sSql :=
      'SELECT ap_id' +
      '  FROM afi.aap_alicuotas_pcp' +
      ' WHERE ap_idsolicitud = :id' +
      '  AND  ap_idparametro_pcp =(SELECT pp_id ' +
                                    '  FROM afi.app_parametro_pcp ' +
                                    ' WHERE pp_renglon = :param)';

  for I := 1 to 3 do
  begin
    idAlicuota := ValorSqlIntegerEx(sSql, [iID_Modificacion, I], -1);

    aSql := TSQL.Create('afi.aap_alicuotas_pcp');
    try
      if idAlicuota = -1 then
      begin
        aSql.SqlType := stInsert;
        aSql.Fields.Add('ap_usualta',   Sesion.UserID);
        aSql.Fields.Add('ap_fechaalta', SQL_DATETIME, False);
      end
      else
      begin
        aSql.SqlType := stUpdate;
        aSql.PrimaryKey.Add('ap_id',         idAlicuota);
        aSql.Fields.Add('ap_fechamodif', SQL_DATETIME, False);
        aSql.Fields.Add('ap_usumodif',   Sesion.UserID);
      end;
      aSql.Fields.Add('ap_idformulario',   FIdFormulario);
      aSql.Fields.Add('ap_idsolicitud',    iID_Modificacion);
      aSql.Fields.Add('ap_idparametro_pcp',    GetIdRenglonPCP(I));
      case I of
        1:
        begin
          aSql.Fields.Add('ap_alicuota',    edAlicuotaMenosDe12.Value);
          aSql.Fields.Add('ap_canttrabajador',    edCantTrabMenosDe12.Value);
        end;
        2:
        begin
          aSql.Fields.Add('ap_alicuota',    edAlicuotaDe12a16.Value);
          aSql.Fields.Add('ap_canttrabajador',    edCantTrabDe12a16.Value);
        end;
        3:
        begin
          aSql.Fields.Add('ap_alicuota',    edAlicuotaMasDe16.Value);
          aSql.Fields.Add('ap_canttrabajador',    edCantTrabMasDe16.Value);
        end;
      end;
      EjecutarSqlST(aSql.Sql);
    finally
      aSql.Free;
    end;
  end;
end;

procedure TfrmCargaSolicitudes.GuardarDatosDocumentacion(const aIdSolicitud: Integer; const aCommit: Boolean);
var
  aCheck: TCheckBox;
  aSql: TSQL;
  iIdDocumentacion: Integer;
  iIdFormulario: Integer;
  iLoop: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT sa_idformulario' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  iIdFormulario := ValorSqlIntegerEx(sSql, [aIdSolicitud]);

  for iLoop := 0 to ComponentCount - 1 do
  begin
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') then
    begin
      sSql :=
        'SELECT do_id' +
         ' FROM ado_documentacion' +
        ' WHERE do_idformulario = :idformulario' +
          ' AND do_iddocumentoafi = :iddocumentoafi';
      iIdDocumentacion := ValorSqlIntegerEx(sSql, [iIdFormulario, Components[iLoop].Tag]);

      aSql := TSQL.Create('ado_documentacion');
      try
        if iIdDocumentacion = 0 then
        begin
          aSql.SqlType := stInsert;
          aSql.Fields.Add('do_fechaalta', SQL_DATETIME, False);
          aSql.Fields.Add('do_usualta',   Sesion.UserID);
        end
        else
        begin
          aSql.SqlType := stUpdate;
          aSql.Fields.Add('do_fechamodif', SQL_DATETIME, False);
          aSql.Fields.Add('do_usumodif',   Sesion.UserID);
        end;

        aSql.PrimaryKey.Add('do_id',         iIdDocumentacion);
        aSql.Fields.Add('do_idformulario',   iIdFormulario);
        aSql.Fields.Add('do_iddocumentoafi', Components[iLoop].Tag);

        aCheck := TCheckBox(Components[iLoop]);
        aSql.Fields.Add('do_presente', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmatitular', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmavendedor', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_faltante_'+ IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_faltante', String(IIF(aCheck.Checked, 'S', 'N')));

        if aCommit then
          EjecutarSql(aSql.Sql)
        else
          EjecutarSqlST(aSql.Sql);
      finally
        aSql.Free;
      end;
    end;
  end;
end;

procedure TfrmCargaSolicitudes.CambiaEntidad(Sender: TObject);
begin
  fraCanal.Value := fraEntidad.Canal;

  fraSucursal.Clear;
  fraSucursal.ClearFilter;
  if fraEntidad.IsSelected then
    fraSucursal.ExtraCondition := 'AND su_identidad = ' + SqlValue(fraEntidad.Value)
  else
    fraSucursal.ExtraCondition := '';
end;

procedure TfrmCargaSolicitudes.grbDomicilioLegalExit(Sender: TObject);
begin
  fraDomicilioPostal.Numero       := fraDOMICILIO_LEGAL.Numero;
  fraDomicilioPostal.Piso         := fraDOMICILIO_LEGAL.Piso;
  fraDomicilioPostal.Departamento := fraDOMICILIO_LEGAL.Departamento;
  fraDomicilioPostal.CodigoPostal := fraDOMICILIO_LEGAL.CodigoPostal;
  fraDomicilioPostal.CPA          := fraDOMICILIO_LEGAL.CPA;
  fraDomicilioPostal.Calle        := fraDOMICILIO_LEGAL.Calle;
  fraDomicilioPostal.Localidad    := fraDOMICILIO_LEGAL.Localidad;
  fraDomicilioPostal.Provincia    := fraDOMICILIO_LEGAL.Provincia;

  fraTELEFONO_POSTAL.QuitarTelefonosTemporales;
  fraTELEFONO_LEGAL.CopiarLegalAPostal;
  fraTELEFONO_POSTAL.FillCombo(False, iID_Modificacion);

  edSA_CODAREAFAX_POST.Text := edSA_CODAREAFAX.Text;
  edSA_FAX_POST.Text        := edSA_FAX.Text;
  edSA_MAIL_POSTAL.Text     := edSA_MAIL_LEGAL.Text;
end;

procedure TfrmCargaSolicitudes.tbDocumentacionClick(Sender: TObject);
var
  iTopFormulariosAnexos: Integer;
  iTopPersoneriaFirmante: Integer;
  iWidthFormulariosAnexos: Integer;
  iWidthPersoneriaFirmante: Integer;
  iTopHojas: Integer;
  iTopLabelHojas: Integer;
  sSql: String;
begin
  iTopFormulariosAnexos  := gbFormulariosAnexos.Top;
  iTopPersoneriaFirmante := gbPersoneriaFirmante.Top;

  iWidthFormulariosAnexos  := gbFormulariosAnexos.Width;
  iWidthPersoneriaFirmante := gbPersoneriaFirmante.Width;

  iTopHojas      := edSA_HOJASLEGAJOS.Top;
  iTopLabelHojas := lblCantidadHojas.Top;

  gbPersoneriaFirmante.Parent := fpMasDatos;
  gbFormulariosAnexos.Parent  := fpMasDatos;
  edSA_HOJASLEGAJOS.Parent    := fpMasDatos;
  lblCantidadHojas.Parent     := fpMasDatos;

  gbPersoneriaFirmante.Top := 8;
  gbFormulariosAnexos.Top  := gbPersoneriaFirmante.Top + gbPersoneriaFirmante.Height + 8;

  edSA_HOJASLEGAJOS.Top := gbFormulariosAnexos.Top + gbFormulariosAnexos.Height + 8;
  lblCantidadHojas.Top  := edSA_HOJASLEGAJOS.Top + 3;
  fpMasDatos.Height     := gbFormulariosAnexos.Top + gbFormulariosAnexos.Height + 40;

  gbFormulariosAnexos.Width  := 672;
  gbPersoneriaFirmante.Width := 672;

  if fpMasDatos.ShowModal = mrOk then
    begin
      GuardarDatosDocumentacion(iID_Modificacion, True);

      sSql :=
        'UPDATE asa_solicitudafiliacion' +
          ' SET sa_hojaslegajos = :hojas' +
        ' WHERE sa_id = :id';
      EjecutarSqlEx(sSql, [edSA_HOJASLEGAJOS.Value, iID_Modificacion]);
    end;

  gbPersoneriaFirmante.Parent := gbDatosTitular;
  gbFormulariosAnexos.Parent  := gbDatosTitular;
  edSA_HOJASLEGAJOS.Parent    := gbDatosTitular;
  lblCantidadHojas.Parent     := gbDatosTitular;

  gbPersoneriaFirmante.Top := iTopPersoneriaFirmante;
  gbFormulariosAnexos.Top  := iTopFormulariosAnexos;

  gbPersoneriaFirmante.Width := iWidthPersoneriaFirmante;
  gbFormulariosAnexos.Width  := iWidthFormulariosAnexos;

  edSA_HOJASLEGAJOS.Top := iTopHojas;
  lblCantidadHojas.Top  := iTopLabelHojas;
end;

procedure TfrmCargaSolicitudes.tbDatosLegajosClick(Sender: TObject);
begin
  Verificar(not FEsModificacion, ToolBar, 'No es posible cargar los Datos de los Legajos sin antes haber cargado una solicitud.');

  if DoCargarLegajosDigitalizacion(iID_Modificacion) then
    DoCargaDatosSolicitud(iID_Modificacion);
end;

procedure TfrmCargaSolicitudes.LiberarComponentesDocumentacion;
var
  aCheck: TCheckBox;
  iLoop: Integer;
begin
  iLoop := 0;
  while iLoop < ComponentCount do
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') or
       (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 6) = 'check_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      FreeAndNil(aCheck);
    end
    else
      Inc(iLoop);
end;

//*****  Proceso con comportamiento selectivo... ******

{procedure TfrmCargaSolicitudes.ClickFirmaFaltante(Sender: TObject);
var
  aCheck, aCheckFaltante : TCheckBox;
begin
  aCheckFaltante := TCheckBox(FindComponent('_check_' + IntToStr(TCheckBox(Sender).Tag)));

  if not TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('check_faltante_' + IntToStr(TCheckBox(Sender).Tag)));
    if aCheck <> nil then
      begin
      aCheck.Checked := False;
      aCheckFaltante.Checked:=True;
      end;
  end else aCheckFaltante.Checked:=False;
end;}

function TfrmCargaSolicitudes.VerificarDocumentacionFaltante(const aFormaJuridica: String; const aCaracterFirma,
                                                             aIdDocumentoAfi: Integer; const aPresento, aFirmaTitular,
                                                             aFirmaVendedor: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT afiliacion.documentofaltante(:formaj, :idcaracterfirma, :id, :presente, :firmatitular, :firmavendedor, :espcp)' +
     ' FROM DUAL';
  Result := ValorSqlEx(sSql, [aFormaJuridica, aCaracterFirma, aIdDocumentoAfi, aPresento, aFirmaTitular, aFirmaVendedor, IIF(FEsPCP, 'S', 'N')]);
end;

procedure TfrmCargaSolicitudes.fraFirmanteExit(Sender: TObject);
begin
  fraFirmante.FrameExit(Sender);
  ActualizarDocumentacionFaltante;
end;

procedure TfrmCargaSolicitudes.ActualizarDocumentacionFaltante;
var
  aCheck: TCheckBox;
  iCaracter: Integer;
  iIdDocumentacion: Integer;
  iLoop: Integer;
  sFirmaTitular: String;
  sFirmaVendedor: String;
  sFormaJ: String;
  sPresento: String;
begin
  for iLoop := 0 to ComponentCount - 1 do
  begin
    sPresento := '';
    sFirmaTitular := '';
    sFirmaVendedor := '';

    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      if aCheck <> nil then
        sPresento := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        sFirmaTitular := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        sFirmaVendedor := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent('check_faltante_'+ IntToStr(Components[iLoop].Tag)));
      if (aCheck <> nil) and not((fraSA_FORMAJ.IsEmpty) or (fraFirmante.IsEmpty)) then
      begin
        iIdDocumentacion := Components[iLoop].Tag;
        sFormaJ          := fraSA_FORMAJ.Codigo;
        iCaracter        := fraFirmante.Value;

        aCheck.Checked := (VerificarDocumentacionFaltante(sFormaJ, iCaracter, iIdDocumentacion, sPresento, sFirmaTitular,
                                                          sFirmaVendedor) = 'S');
      end;
    end;
  end;
end;

procedure TfrmCargaSolicitudes.btnRefreshDocClick(Sender: TObject);
begin
  Verificar(fraSA_FORMAJ.IsEmpty, fraSA_FORMAJ, 'Para verificar el estado de documentacion faltante son necesarios los datos de "Forma Jurídica" y firma "En Carácter De".');
  Verificar(fraFirmante.IsEmpty, fraFirmante, 'Para verificar el estado de documentacion faltante son necesarios los datos de "Forma Jurídica" y firma "En Carácter De".');
  ActualizarDocumentacionFaltante;
end;

procedure TfrmCargaSolicitudes.VerificarDocumentacionFaltanteFila(const aTag: Integer);
var
  aCheckFaltante: TCheckBox;
  aCheckPresento: TCheckBox;
  aCheckTitular: TCheckBox;
  aCheckVendedor: TCheckBox;
  iCaracter: Integer;
  iIdDocumentacion: Integer;
  sFirmaTitular: String;
  sFirmaVendedor: String;
  sFormaJ: String;
  sPresento: String;
begin
  aCheckPresento := TCheckBox(FindComponent('_check_' + IntToStr(aTag)));
  aCheckTitular  := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(aTag)));
  aCheckVendedor := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(aTag)));
  aCheckFaltante := TCheckBox(FindComponent('check_faltante_' + IntToStr(aTag)));

  if (aCheckPresento <> nil) and (aCheckTitular <> nil) and (aCheckVendedor <> nil) and (aCheckFaltante <> nil) then
  begin
    sPresento      := IIF(aCheckPresento.Checked, 'S', 'N');
    sFirmaTitular  := IIF(aCheckTitular.Checked, 'S', 'N');
    sFirmaVendedor := IIF(aCheckVendedor.Checked, 'S', 'N');

    if not ((fraSA_FORMAJ.IsEmpty) or (fraFirmante.IsEmpty)) then
    begin
      iIdDocumentacion := aTag;
      sFormaJ          := fraSA_FORMAJ.Codigo;
      iCaracter        := fraFirmante.Value;

      aCheckFaltante.Checked:= (VerificarDocumentacionFaltante(sFormaJ, iCaracter, iIdDocumentacion, sPresento,
                                                               sFirmaTitular, sFirmaVendedor) = 'S');
      end;
    end;
end;

procedure TfrmCargaSolicitudes.ClickFirmaVendedor(Sender: TObject);
begin
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag);
end;

procedure TfrmCargaSolicitudes.GuardarDatosPep(const aIdSolicitud: Integer);
var
  sExpuesta: String;
  sPresente: String;
  sSql: String;
  sTitular: String;
  sVendedor: String;
begin
  sPresente := IIF(chkPep.Checked, 'S', 'N');
  sTitular  := IIF(chkPepFirma1.Checked, 'S', 'N');
  sVendedor := IIF(chkPepFirma2.Checked, 'S', 'N');
  case cboxPep.ItemIndex of
    -1: sExpuesta := '';
     0: sExpuesta := 'N';
     1: sExpuesta := 'S';
     2: sExpuesta := 'B';
   end;

  sSql :=
    'UPDATE ape_personaexpuesta' +
      ' SET pe_presente = :presente,' +
          ' pe_firma1 = :titular,' +
          ' pe_firma2 = :vendedor,' +
          ' pe_expuesta = :expuesta';
  if FEsModificacion then // Si no es modificacion no cargar usualta porque lo hace un trigger en ASA_SOLICITUDAFILIACION
    sSql := sSql + ', pe_usumodif = :usumodif, pe_fechamodif = :fechamodif';

  sSql := sSql + ' WHERE pe_idsolicitud = :idsolicitud';

  if FEsModificacion then
    EjecutarSqlSTEx(sSql, [sPresente, sTitular, sVendedor, sExpuesta, Sesion.UserID, TDateTimeEx.Create(Now), aIdSolicitud])
  else
    EjecutarSqlSTEx(sSql, [sPresente, sTitular, sVendedor, sExpuesta, aIdSolicitud]);
end;

procedure TfrmCargaSolicitudes.CargarDatosPCP(const aIdSolicitud: TTableId);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
       'SELECT pp_renglon, ap_canttrabajador, ap_alicuota ' +
       '  FROM afi.aap_alicuotas_pcp ' +
       '       LEFT JOIN afi.app_parametro_pcp ON ap_idparametro_pcp = pp_id ' +
       ' WHERE ap_idsolicitud = :id ' ;

  aQuery := GetQueryEx(sSql, [aIdSolicitud]);
  try
    while not aQuery.Eof do
    begin
      case aQuery.FieldByName('pp_renglon').AsInteger of
      1:
        begin
          edCantTrabMenosDe12.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
          edAlicuotaMenosDe12.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
        end;
        2:
        begin
          edCantTrabDe12a16.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
          edAlicuotaDe12a16.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
        end;
        3:
        begin
          edCantTrabMasDe16.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
          edAlicuotaMasDe16.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
        end;
      end;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmCargaSolicitudes.CargarDatosPep(const aIdSolicitud: Integer);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT pe_presente, pe_firma1, pe_firma2, pe_expuesta' +
     ' FROM ape_personaexpuesta' +
    ' WHERE pe_idsolicitud = :idsolicitud';
  aQuery := GetQueryEx(sSql, [aIdSolicitud]);
  try
    if not aQuery.Eof then
    begin
      chkPep.Checked       := (aQuery.FieldByName('pe_presente').AsString = 'S');
      chkPepFirma1.Checked := (aQuery.FieldByName('pe_firma1').AsString = 'S');
      chkPepFirma2.Checked := (aQuery.FieldByName('pe_firma2').AsString = 'S');

      if aQuery.FieldByName('pe_expuesta').IsNull then
        cboxPep.ItemIndex := 2;
      if aQuery.FieldByName('pe_expuesta').AsString = 'B' then
        cboxPep.ItemIndex := 2;
      if aQuery.FieldByName('pe_expuesta').AsString = 'N' then
        cboxPep.ItemIndex := 0;
      if aQuery.FieldByName('pe_expuesta').AsString = 'S' then
        cboxPep.ItemIndex := 1;
      //cboxPep.ItemIndex := IIF(aQuery.FieldByName('pe_expuesta').AsString = 'S', 1, 0);  //1 Si //0 No
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmCargaSolicitudes.CambiaOrigen(Sender: TObject);
begin
  LockControl(edFechaRecepcionFaxEmail, (fraSA_ORIGEN.Value <> '2'));
  //Comentado a pedido de GGROSSI
 // if fraSA_ORIGEN.Value <> '2' then
 //   edFechaRecepcionFaxEmail.Clear;
end;

procedure TfrmCargaSolicitudes.edNumeroDocumentoExit(Sender: TObject);
begin
  if edNumeroDocumento.Text <> '' then
    BuscarEnWorldSys(StrToInt(edNumeroDocumento.Text));
end;

procedure TfrmCargaSolicitudes.BuscarEnWorldSys(const aNumeroDoc: Integer);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT wo_fechalote, wo_denominacion' +
     ' FROM pep.pwo_worldsys' +
    ' WHERE wo_nrodocumento = :nrodocumento';
  aQuery := GetQueryEx(sSql, [aNumeroDoc]);
  try
    if not aQuery.Eof then
      lbWorldSys.Caption := 'DNI encontrado: '+ aQuery.FieldByName('wo_denominacion').AsString
                         // '. Lote: '+ aQuery.FieldByName('wo_fechalote').AsString
    else
      lbWorldSys.Caption := 'DNI no encontrado';
  finally
    aQuery.Free;
  end;
end;

procedure TfrmCargaSolicitudes.tbGuardarRevisionClick(Sender: TObject);
begin
  grbDomicilioLegalExit(Sender);
  if isValidar then
    DoGuardarSolicitud(True); //Es Revision
end;

procedure TfrmCargaSolicitudes.CargarUsuarioRevision(const aIdSolicitud: Integer);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT sa_usurevision, sa_fecharevision' +
     ' FROM afi.asa_solicitudafiliacion' +
    ' WHERE sa_id = :said';
  aQuery := GetQueryEx(sSql, [aIdSolicitud]);
  try
    if not aQuery.Eof then
    begin
      edUsuarioRevision.Text := aQuery.FieldByName('sa_usurevision').AsString;
      edFechaRevision.Text   := aQuery.FieldByName('sa_fecharevision').AsString;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmCargaSolicitudes.FiltrarFirmante;
var
  iAux: Integer;
begin
  if not fraSA_FORMAJ.IsEmpty then //Filtrar frafirmate segun documentacion faltante
  begin
    iAux := frafirmante.Value;
    fraFirmante.Clear;
    fraFirmante.ExtraCondition :=
      ' AND cf_id IN (SELECT df_caracterfirma' +
                      ' FROM adf_documentacionfalta' +
                     ' WHERE df_formajuridica = ' + fraSA_FORMAJ.Codigo + ')';
    fraFirmante.Value := iAux; //Si habia algo seleccionado y esta en el filtro dejarlo como estaba
  end
  else
  begin
    fraFirmante.Clear;
    fraFirmante.ExtraCondition := ' AND cf_id = 0';
  end;
end;

function TfrmCargaSolicitudes.ExisteIdDatosTemporales(const iId: TTableId): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM tmp.tmp_solicitudafiliacion' +
    ' WHERE mp_id = :id';
  Result := ExisteSqlEx(sSql, [iId])
end;

function TfrmCargaSolicitudes.DoCargaDatosSolicitudOriginal(const iId: TTableID): Boolean;
var
  sdqCargaDatos: TSDQuery;
  sSql: String;
begin
  Result := True;

  FModoABM := maModificacion;

  LockControls(edSA_FORMULARIO, True);

  sdqCargaDatos := TSDQuery.Create(Self);
  with sdqCargaDatos do
  try
    DataBaseName := 'dbPrincipal';

    sSql :=
      'SELECT *' +
       ' FROM asa_solicitudafiliacion, ctb_tablas' +
      ' WHERE tb_clave = ''ESSOL''' +
        ' AND sa_estado = tb_codigo' +
        ' AND sa_id = :id';
    OpenQueryEx(sdqCargaDatos, [iId], sSql, True);

    lbCotizacionCerrada.Visible := (FieldByName('sa_cotizacioncerrada').AsString = 'T');
    lbRecepcion.Visible := (FieldByName('sa_recepcionexpress').AsString = 'S');
    lbPcp.Visible := (FieldByName('sa_solicitud_pcp').AsString = 'S');

    BloqueaTarifas(True);
    fraEstado.Value                  := FieldByName('sa_estado').AsString;
    edSA_NROINTERNO.Value            := FieldByName('sa_nrointerno').AsInteger;
    edSA_NROINTERNO.ReadOnly         := True;
    edSA_NROINTERNO.Color            := clSilver;
    iID_Modificacion                 := FieldByName('sa_id').AsInteger;
    tbDocumentacion.Enabled := True;
    fraCuadroTarifario.fraCIIU.Value := FieldByName('sa_idactividad').AsInteger;
    fraCIIU2.Value                   := FieldByName('sa_idactividad2').AsInteger;
    fraCIIU3.Value                   := FieldByName('sa_idactividad3').AsInteger;
    fraContacto.Area                 := FieldByName('sa_area').AsString;

    if not FieldByName('sa_documento_titular').IsNull then
      BuscarEnWorldSys(FieldByName('sa_documento_titular').AsInteger);

    if FieldByName('sa_idartanterior').AsString <> '' then
      fraSA_ARTANTERIOR.Value := FieldByName('sa_idartanterior').AsInteger
    else
      fraSA_ARTANTERIOR.Clear;

    fraContacto.Cargo         := FieldByName('sa_cargo').AsString;
    edSA_CODAREAFAX.Text      := FieldByName('sa_codareafax').AsString;
    edSA_CODAREAFAX_POST.Text := FieldByName('sa_codareafax_post').AsString;
    fraContacto.AreaFax       := FieldByName('sa_codareafax_cont').AsString;
    fraContacto.Contacto      := FieldByName('sa_contacto').AsString;
    fraContacto.Email         := FieldByName('sa_direlectronica_cont').AsString;
    fraContacto.Fax           := FieldByName('sa_fax_cont').AsString;
    edSA_FAX.Text             := FieldByName('sa_fax').AsString;
    edSA_MAIL_LEGAL.Text      := FieldByName('sa_mail_legal').AsString;
    edSA_FAX_POST.Text        := FieldByName('sa_fax_post').AsString;
    edSA_MAIL_POSTAL.Text     := FieldByName('sa_mail_postal').AsString;
    edSA_TITULAR.Text         := FieldByName('sa_titular').AsString;
    fraTipoDocumento.Value    := FieldByName('sa_tipo_documento_titular').AsString;
    edNumeroDocumento.Text    := FieldByName('sa_documento_titular').AsString;

    if not FieldByName('sa_sexo_titular').IsNull then       //aca habia puesto un IIF pero
      if FieldByName('sa_sexo_titular').AsString = 'F' then  //no se porque no funciono.
         cmbSA_SEXO_TITULAR.ItemIndex := 0
      else
         cmbSA_SEXO_TITULAR.ItemIndex := 1
    else
      cmbSA_SEXO_TITULAR.ItemIndex := -1;

    edSA_DIRELECTRONICA_TITULAR.Text   := FieldByName('sa_direlectronica_titular').AsString;
    edSA_TELEFONO_TITULAR.Text         := FieldByName('sa_telefono_titular').AsString;

    fraCargo.Codigo                    := FieldByName('sa_cargo_titular').AsString;
    fraFirmante.Value                  := FieldByName('sa_idcaracterfirma').AsInteger;
    edSA_NOMBRE_VENDEDOR.Text          := FieldByName('sa_nombre_vendedor').AsString;

      // Pide Callo cambiar el checkRevision a un BOTON! locura
    //checkRevisionOk.Checked            := not FieldByName('sa_fecharevision').IsNull;
    //checkRevisionOk.Enabled            := (Seguridad.ControlHabilitado(frmCargaSolicitudes, checkRevisionOk)) or (FieldByName('sa_fecharevision').IsNull);

    edFechaSuscripcion.Date            := FieldByName('sa_fechaafiliacion').AsDateTime;
    edVigencia.Date                    := FieldByName('sa_fechavigenciadesde').AsDateTime;
    dcbFechaRecepcionAfiliaciones.Date := FieldByName('sa_fecharecepcionsectorafi').AsDateTime;
    edFechaRecepcionFaxEmail.Date      := FieldByName('sa_fecharecepcionfaxemail').AsDateTime;
    edSA_FEINICACTIV.Date              := FieldByName('sa_feinicactiv').AsDateTime;
    fraSA_FORMAJ.Codigo                 := FieldByName('sa_formaj').AsString;
    FiltrarFirmante; //actualizar el otro frame
    fraFirmante.Value                  := FieldByName('sa_idcaracterfirma').AsInteger;
    fIdFormulario                      := FieldByName('sa_idformulario').AsInteger;
    edSA_FORMULARIO.Text               := ValorSQLEx('SELECT fo_formulario' +
                                                      ' FROM afo_formulario' +
                                                     ' WHERE fo_id = :id', [fIdFormulario]);
    fraSA_HOLDING.Value                := FieldByName('sa_idgrupoeconomico').AsInteger;
    edSA_CUIT.Text                     := FieldByName('sa_cuit').AsString;

    // DIRECCIÓN LEGAL..
    fraDOMICILIO_LEGAL.Numero       := FieldByName('sa_numero').AsString;
    fraDOMICILIO_LEGAL.Piso         := FieldByName('sa_piso').AsString;
    fraDOMICILIO_LEGAL.Departamento := FieldByName('sa_departamento').AsString;
    fraDOMICILIO_LEGAL.CPA          := FieldByName('sa_cpostala').AsString;
    fraDOMICILIO_LEGAL.CodigoPostal := FieldByName('sa_cpostal').AsString;
    fraDOMICILIO_LEGAL.Calle        := FieldByName('sa_calle').AsString;
    fraDOMICILIO_LEGAL.Localidad    := FieldByName('sa_localidad').AsString;

    if FieldByName('sa_provincia').AsString <> '' then
      fraDOMICILIO_LEGAL.Provincia := ValorSqlEx('SELECT pv_descripcion' +
                                                  ' FROM cpv_provincias' +
                                                 ' WHERE pv_codigo = :codigo',
                                                 [FieldByName('sa_provincia').AsString]);

    //DIRECCION POSTAL
    fraDomicilioPostal.Numero       := FieldByName('sa_numero_post').AsString;
    fraDomicilioPostal.Piso         := FieldByName('sa_piso_post').AsString;
    fraDomicilioPostal.Departamento := FieldByName('sa_departamento_post').AsString;
    fraDomicilioPostal.CPA          := FieldByName('sa_cpostala_post').AsString;
    fraDomicilioPostal.CodigoPostal := FieldByName('sa_cpostal_post').AsString;
    fraDomicilioPostal.Calle        := FieldByName('sa_calle_post').AsString;
    fraDomicilioPostal.Localidad    := FieldByName('sa_localidad_post').AsString;

    if FieldByName('sa_provincia_post').AsString <> '' then
      fraDomicilioPostal.Provincia := ValorSqlEx('SELECT pv_descripcion' +
                                                  ' FROM cpv_provincias' +
                                                 ' WHERE pv_codigo = :codigo',
                                                 [FieldByName('sa_provincia_post').AsString]);

    fraVendedor.Value                    := ObtenerVendedor(FieldByName('sa_identidadvendedor').AsString);

    fraEntidad.Value                     := ObtenerEntidad(FieldByName('sa_identidadvendedor').AsString);
    CambiaEntidad(fraEntidad);

    fraSucursal.Value                    := FieldByName('sa_idsucursal').AsInteger;

    edFranquicia.Value                   := FieldByName('sa_franquicia').AsInteger;
    fraCuadroTarifario.edMASATOTAL.Value := FieldByName('sa_masatotal').AsFloat;
    fraSA_MOTIVOALTA.Value               := FieldByName('sa_motivoalta').AsString;
    FMotivoAlta                          := FieldByName('sa_motivoalta').AsInteger;
    CambiaMotivoAlta(nil);

    fraCuadroTarifario.edNIVEL.Text := FieldByName('sa_nivel').AsString;
    cmbSA_NOMBRE.Text               := FieldByName('sa_nombre').AsString;
    edSA_OBSERVACIONES.Text         := FieldByName('sa_observaciones').AsString;
    edSA_OBSERVACIONES_POST.Text    := FieldByName('sa_observaciones_post').AsString;

    fraSA_ORIGEN.Value := FieldByName('sa_origen').AsString;
    CambiaOrigen(fraSA_ORIGEN);

    fraSA_SECTOR.Value := FieldByName('sa_sector').AsString;
    fraSA_SECTORExit(nil);
    if (fraSA_SUSS.Value = '') then
      fraSA_SUSS.Value := FieldByName('SA_SUSS').AsString;
      
    //fraSA_SUSS.Value := FieldByName('SA_SUSS').AsString;
    //Datos Tarifa
    fraCuadroTarifario.edPORCDESCNIVEL.Value   := FieldByName('sa_porcdescnivel').AsCurrency;
    fraCuadroTarifario.edPORCDESCVOLUMEN.Value := FieldByName('sa_porcdescvolumen').AsCurrency;
    fraCuadroTarifario.edPORCMASATARIFA.Value  := FieldByName('sa_porcmasatarifa').AsCurrency;
    fraCuadroTarifario.edALICUOTAPORC.Value    := FieldByName('sa_alicuotaporc').AsCurrency;
    fraCuadroTarifario.edSUMAFIJATARIFA.Value  := FieldByName('sa_sumafijatarifa').AsCurrency;
    fraCuadroTarifario.edALICUOTAPESOS.Value   := FieldByName('sa_alicuotapesos').AsCurrency;

    //Actualiza la sumafija y el PorcMasa
    fraCuadroTarifario.Actualizar;



    fraTELEFONO_LEGAL.FillCombo(True, iID_Modificacion);
    fraTELEFONO_POSTAL.FillCombo(True, iID_Modificacion);
    fraContacto.fraTelefonos.FillCombo(True, iID_Modificacion);

    edSA_HOJASLEGAJOS.Value := FieldByName('sa_hojaslegajos').AsInteger;

    CargarDatosDocumentacion(iID);
    CargarDatosPep(iID);
    CargarDatosPCP(iID);
    //CargarUsuarioRevision(iID);

    edUsuarioRevision.Text := FieldByName('sa_usurevision').AsString;
    edFechaRevision.Text := FieldByName('sa_fecharevision').AsString;

//    fraCuadroTarifario.fraTIPOTARIFA.Value  := FieldByName('sa_tipodetarifa').AsString;
    fraCuadroTarifario.edTOTEMPLEADOS.Value := FieldByName('sa_totempleados').AsInteger;

    FPresentoRGRL := FieldByName('sa_presentorgrl').AsString;
    FClausulasAdicionales := FieldByName('sa_clausulasadicionales').AsString;

    FFechaAlta := FieldByName('sa_fechaalta').AsDateTime;

    if Copy(FieldByName('tb_especial1').AsString, 1, 1) <> 'S' then
    begin
      MsgBox('El estado de la solicitud no le permite guardar cambios a este formulario.', MB_ICONSTOP);
      Result := False;
      tblGuardar.Enabled := False;
      btnAceptar.Enabled := False;
      tblGuardarTemporal.Enabled := False;
      tbGuardarRevision.Enabled := False;
    end
    else
    begin
      tblGuardar.Enabled := Seguridad.Claves.IsActive('PermiteGuardar');
      btnAceptar.Enabled := Seguridad.Claves.IsActive('PermiteGuardar');
    end;

    PersonalCasasParticularesVisible(FieldByName('sa_solicitud_pcp').AsString = 'S');

    FEsModificacion := True;
    sdqCargaDatos.Close;
    MensajeCampaniaF931(iId);
    CalcularArchivos;
  finally
    sdqCargaDatos.Free;
  end;
end;

function TfrmCargaSolicitudes.DoCargaDatosSolicitudTemporal(const iId: TTableID): Boolean;
var
  sdqCargaDatos: TSDQuery;
  sSql: String;
begin
  Result := True;

  FModoABM := maModificacion;

  LockControls(edSA_FORMULARIO, True);

  sdqCargaDatos := TSDQuery.Create(Self);
  with sdqCargaDatos do
  try
    DataBaseName := 'dbPrincipal';

    sSql :=
      'SELECT *' +
       ' FROM tmp.tmp_solicitudafiliacion' +
      ' WHERE mp_id = :id';
    OpenQueryEx(sdqCargaDatos, [iId], sSql, True);

    BloqueaTarifas(True);
    tbDocumentacion.Enabled := True;
    fraCuadroTarifario.fraCIIU.Value := FieldByName('mp_idactividad').AsInteger;
    fraCIIU2.Value                   := FieldByName('mp_idactividad2').AsInteger;
    fraCIIU3.Value                   := FieldByName('mp_idactividad3').AsInteger;
    fraContacto.Area                 := FieldByName('mp_area').AsString;

    if not FieldByName('mp_documento_titular').IsNull then
      BuscarEnWorldSys(FieldByName('mp_documento_titular').AsInteger);

    if FieldByName('mp_idartanterior').AsString <> '' then
      fraSA_ARTANTERIOR.Value := FieldByName('mp_idartanterior').AsInteger
    else
      fraSA_ARTANTERIOR.Clear;

    fraContacto.Cargo         := FieldByName('mp_cargo').AsString;
    edSA_CODAREAFAX.Text      := FieldByName('mp_codareafax').AsString;
    edSA_CODAREAFAX_POST.Text := FieldByName('mp_codareafax_post').AsString;
    fraContacto.AreaFax       := FieldByName('mp_codareafax_cont').AsString;
    fraContacto.Contacto      := FieldByName('mp_contacto').AsString;
    fraContacto.Email         := FieldByName('mp_direlectronica_cont').AsString;
    fraContacto.Fax           := FieldByName('mp_fax_cont').AsString;
    edSA_FAX.Text             := FieldByName('mp_fax').AsString;
    edSA_MAIL_LEGAL.Text      := FieldByName('mp_mail_legal').AsString;
    edSA_FAX_POST.Text        := FieldByName('mp_fax_post').AsString;
    edSA_MAIL_POSTAL.Text     := FieldByName('mp_mail_postal').AsString;
    edSA_TITULAR.Text         := FieldByName('mp_titular').AsString;
    fraTipoDocumento.Value    := FieldByName('mp_tipo_documento_titular').AsString;
    edNumeroDocumento.Text    := FieldByName('mp_documento_titular').AsString;

    edSA_DIRELECTRONICA_TITULAR.Text   := FieldByName('mp_direlectronica_titular').AsString;
    edSA_TELEFONO_TITULAR.Text         := FieldByName('mp_telefono_titular').AsString;

    fraCargo.Codigo                    := FieldByName('mp_cargo_titular').AsString;
    edSA_NOMBRE_VENDEDOR.Text          := FieldByName('mp_nombre_vendedor').AsString;

    edFechaSuscripcion.Date            := FieldByName('mp_fechaafiliacion').AsDateTime;
    edVigencia.Date                    := FieldByName('mp_fechavigenciadesde').AsDateTime;
    dcbFechaRecepcionAfiliaciones.Date := FieldByName('mp_fecharecepcionsectorafi').AsDateTime;
    edFechaRecepcionFaxEmail.Date      := FieldByName('mp_fecharecepcionfaxemail').AsDateTime;
    edSA_FEINICACTIV.Date              := FieldByName('mp_feinicactiv').AsDateTime;
    fraSA_FORMAJ.Codigo                 := FieldByName('mp_formaj').AsString;
    fraFirmante.Value                  := FieldByName('mp_idcaracterfirma').AsInteger;
    FiltrarFirmante; //actualizar el otro frame
    //fIdFormulario                      := FieldByName('mp_idformulario').AsInteger;

    fraSA_HOLDING.Value                := FieldByName('mp_idgrupoeconomico').AsInteger;
    //edSA_CUIT.Text                     := FieldByName('mp_cuit').AsString;

    // DIRECCIÓN LEGAL..
    fraDOMICILIO_LEGAL.Numero       := FieldByName('mp_numero').AsString;
    fraDOMICILIO_LEGAL.Piso         := FieldByName('mp_piso').AsString;
    fraDOMICILIO_LEGAL.Departamento := FieldByName('mp_departamento').AsString;
    fraDOMICILIO_LEGAL.CPA          := FieldByName('mp_cpostala').AsString;
    fraDOMICILIO_LEGAL.CodigoPostal := FieldByName('mp_cpostal').AsString;
    fraDOMICILIO_LEGAL.Calle        := FieldByName('mp_calle').AsString;
    fraDOMICILIO_LEGAL.Localidad    := FieldByName('mp_localidad').AsString;

    if FieldByName('mp_provincia').AsString <> '' then
      fraDOMICILIO_LEGAL.Provincia := ValorSqlEx('SELECT pv_descripcion' +
                                                  ' FROM cpv_provincias' +
                                                 ' WHERE pv_codigo = :codigo',
                                                 [FieldByName('mp_provincia').AsString]);

    //DIRECCION POSTAL
    fraDomicilioPostal.Numero       := FieldByName('mp_numero_post').AsString;
    fraDomicilioPostal.Piso         := FieldByName('mp_piso_post').AsString;
    fraDomicilioPostal.Departamento := FieldByName('mp_departamento_post').AsString;
    fraDomicilioPostal.CPA          := FieldByName('mp_cpostala_post').AsString;
    fraDomicilioPostal.CodigoPostal := FieldByName('mp_cpostal_post').AsString;
    fraDomicilioPostal.Calle        := FieldByName('mp_calle_post').AsString;
    fraDomicilioPostal.Localidad    := FieldByName('mp_localidad_post').AsString;

    if FieldByName('mp_provincia_post').AsString <> '' then
      fraDomicilioPostal.Provincia := ValorSqlEx('SELECT pv_descripcion' +
                                                  ' FROM cpv_provincias' +
                                                 ' WHERE pv_codigo = :codigo',
                                                 [FieldByName('mp_provincia_post').AsString]);

    fraVendedor.Value                    := ObtenerVendedor(FieldByName('mp_identidadvendedor').AsString);

    fraEntidad.Value                     := ObtenerEntidad(FieldByName('mp_identidadvendedor').AsString);
    CambiaEntidad(fraEntidad);

    fraSucursal.Value                    := FieldByName('mp_idsucursal').AsInteger;

    edFranquicia.Value                   := FieldByName('mp_franquicia').AsInteger;
    //fraCuadroTarifario.edMASATOTAL.Value := FieldByName('mp_masatotal').AsFloat;
    fraSA_MOTIVOALTA.Value               := FieldByName('mp_motivoalta').AsString;
    FMotivoAlta                          := FieldByName('mp_motivoalta').AsInteger;
    //CambiaMotivoAlta(nil);

    fraCuadroTarifario.edNIVEL.Text := FieldByName('mp_nivel').AsString;
    cmbSA_NOMBRE.Text               := FieldByName('mp_nombre').AsString;
    edSA_OBSERVACIONES.Text         := FieldByName('mp_observaciones').AsString;
    //edSA_OBSERVACIONES_POST.Text    := FieldByName('mp_observaciones_post').AsString;

    fraSA_SECTOR.Value := FieldByName('mp_sector').AsString;
    fraSA_SECTORExit(Nil);
    if (fraSA_SUSS.Value = '') then
      fraSA_SUSS.Value := FieldByName('mp_suss').AsString;
    //fraSA_SUSS.Value := FieldByName('mp_suss').AsString;

    //Datos Tarifa
    {fraCuadroTarifario.edPORCDESCNIVEL.Value   := FieldByName('sa_porcdescnivel').AsCurrency;
    fraCuadroTarifario.edPORCDESCVOLUMEN.Value := FieldByName('sa_porcdescvolumen').AsCurrency;
    fraCuadroTarifario.edPORCMASATARIFA.Value  := FieldByName('sa_porcmasatarifa').AsCurrency;
    fraCuadroTarifario.edALICUOTAPORC.Value    := FieldByName('sa_alicuotaporc').AsCurrency;
    fraCuadroTarifario.edSUMAFIJATARIFA.Value  := FieldByName('sa_sumafijatarifa').AsCurrency;
    fraCuadroTarifario.edALICUOTAPESOS.Value   := FieldByName('sa_alicuotapesos').AsCurrency;}

    //Actualiza la sumafija y el PorcMasa
    //fraCuadroTarifario.Actualizar;

    {TelefonosModoTemporal(True);

    fraTELEFONO_LEGAL.FillCombo(True, iID_Modificacion);
    fraTELEFONO_POSTAL.FillCombo(True, iID_Modificacion);
    fraContacto.fraTelefonos.FillCombo(True, iID_Modificacion);}

    edUsuarioRevision.Text := FieldByName('mp_usurevision').AsString;
    edFechaRevision.Text := FieldByName('mp_fecharevision').AsString;

    PersonalCasasParticularesVisible(False);


    //fraCuadroTarifario.fraTIPOTARIFA.Value  := FieldByName('sa_tipodetarifa').AsString;
    //fraCuadroTarifario.edTOTEMPLEADOS.Value := FieldByName('mp_totempleados').AsInteger;
    CalcularArchivos;
    sdqCargaDatos.Close;
  finally
    sdqCargaDatos.Free;
  end;
end;

function TfrmCargaSolicitudes.GetIdCotizacion(const iId: TTableID): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT sa_idsolicitudcotizacion' +
     ' FROM afi.asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  Result := ValorSqlIntegerEx(sSql, [iId]);
end;

procedure TfrmCargaSolicitudes.tblGuardarTemporalClick(Sender: TObject);
begin
  if tblGuardarTemporal.ImageIndex = 58 then
  begin
    Verificar((edSA_Formulario.Text = ''), edSA_Formulario, 'No se puede crear pdf sin número de formulario.');
    Verificar(not isFechaSuscripcionEnBaseOk(iID_Modificacion), dcbFechaRecepcionAfiliaciones, 'La fecha de recepción de afiliaciones no está establecida.');
    if isValidar then
    begin
      if ExisteIdDatosTemporales(iID_Modificacion) then
      begin
        if MsgAsk('Existen datos temporales para esta solicitud. ¿ Desea cargarlos ?') then
        begin
          DoCargaDatosSolicitudOriginal(iID_Modificacion);
          DoCargaDatosSolicitudTemporal(iID_Modificacion)
        end
        else
        begin
          DoCargaDatosSolicitudOriginal(iID_Modificacion);
          CopiarTelefonosProdTemporales;
        end;
      end
      else
      begin
        DoCargaDatosSolicitudOriginal(iID_Modificacion);
        CopiarTelefonosProdTemporales;
      end;
      BloquearControlesPDF(tblGuardarTemporal.ImageIndex <> 58);
    end;
  end
  else
  begin
    DoCargaDatosSolicitudOriginal(iID_Modificacion);
    BloquearControlesPDF(tblGuardarTemporal.ImageIndex <> 58);
  end;
end;

procedure TfrmCargaSolicitudes.SetEstadoBotonPDF;
var
  ListaUsuariosPDF : TStringList;
begin
  ListaUsuariosPDF := TStringList.Create;
  ListaUsuariosPDF.Add('FMFIRENZE');
  ListaUsuariosPDF.Add('CALLO');
  ListaUsuariosPDF.Add('ASUAREZ');
  ListaUsuariosPDF.Add('CFIORELLI');
  ListaUsuariosPDF.Add('GALOPEZ');
  ListaUsuariosPDF.Add('SBASSI'); //tk 60886
  tblGuardarTemporal.Enabled := ListaUsuariosPDF.IndexOf(Sesion.UserID) <> -1;
  ListaUsuariosPDF.Free;
end;

procedure TfrmCargaSolicitudes.GenerarPDFSolicitudAfiliacion;
begin
  with TqrSolicitudAfiliacion.Create(Self) do
  try
    if fraSA_MOTIVOALTA.Value <> '04' then
    begin
      Preparar(8, GetIdCotizacion(iID_Modificacion), '');
      if SaveDialog.Execute then
        Preparar(8, GetIdCotizacion(iID_Modificacion), SaveDialog.FileName);
    end
    else
    begin
      Preparar(9, GetIdReafiliacion(iID_Modificacion), '');
      if SaveDialog.Execute then
        Preparar(9, GetIdReafiliacion(iID_Modificacion), SaveDialog.FileName);
    end;
  finally
    Free;
  end;
end;

procedure TfrmCargaSolicitudes.DoGuardarSolicitudTemporal(const isUpdate:Boolean);
var
  iNroInterno: TTableID;
  iSA_ID: Integer;
  sSqlTrans: TSql;
begin
  //ActualizarDocumentacionFaltante;  //No verificar al guardar

  sSqlTrans := TSQL.Create('tmp.tmp_solicitudafiliacion');
  if IsUpdate then
  begin
    sSqlTrans.SqlType := stUpdate;
    sSqlTrans.Fields.Add('mp_fechamodif',   'ACTUALDATE', False);
    sSqlTrans.Fields.Add('mp_usumodif',     Sesion.UserId);
  end
  else
  begin
    sSqlTrans.SqlType := stInsert;
    sSqlTrans.Fields.Add('mp_fechaalta',   'ACTUALDATE', False);
    sSqlTrans.Fields.Add('mp_usualta',     Sesion.UserId);
  end;


  sSqlTrans.Fields.Add('mp_idactividad', fraCuadroTarifario.Actividad);

  if fraCIIU2.Value <> 0 then
    sSqlTrans.Fields.Add('mp_idactividad2', fraCIIU2.Value)
  else
    sSqlTrans.Fields.Add('mp_idactividad2', 'NULL', False);

  if fraCIIU3.Value <> 0 then
    sSqlTrans.Fields.Add('mp_idactividad3', fraCIIU3.Value)
  else
    sSqlTrans.Fields.Add('mp_idactividad3', 'NULL', False);

  sSqlTrans.Fields.Add('mp_area', fraContacto.Area);

  if fraSA_ARTANTERIOR.IsSelected then
    sSqlTrans.Fields.Add('mp_idartanterior', fraSA_ARTANTERIOR.Value)
  else
    sSqlTrans.Fields.Add('mp_idartanterior', 'NULL', False);

  sSqlTrans.Fields.Add('mp_cargo',                   fraContacto.Cargo);
  sSqlTrans.Fields.Add('mp_codareafax',              edSA_CODAREAFAX.Text);
  sSqlTrans.Fields.Add('mp_codareafax_post',         edSA_CODAREAFAX_POST.Text);
  sSqlTrans.Fields.Add('mp_codareafax_cont',         fraContacto.AreaFax);
  sSqlTrans.Fields.Add('mp_contacto',                fraContacto.Contacto);
  sSqlTrans.Fields.Add('mp_cuit',                    edSA_CUIT.Text);
  sSqlTrans.Fields.Add('mp_direlectronica_cont',     fraContacto.Email);
  sSqlTrans.Fields.Add('mp_fax_cont',                fraContacto.Fax);
  sSqlTrans.Fields.Add('mp_fax',                     edSA_FAX.Text);
  sSqlTrans.Fields.Add('mp_mail_legal',              edSA_MAIL_LEGAL.Text);
  sSqlTrans.Fields.Add('mp_fax_post',                edSA_FAX_POST.Text);
  sSqlTrans.Fields.Add('mp_mail_postal',             edSA_MAIL_POSTAL.Text);

  sSqlTrans.Fields.Add('mp_titular',                 edSA_TITULAR.Text);
  sSqlTrans.Fields.Add('mp_telefono_titular',        edSA_TELEFONO_TITULAR.Text);
  sSqlTrans.Fields.Add('mp_sexo_titular',            IIF(cmbSA_SEXO_TITULAR.ItemIndex = 0, 'F', 'M'), dtString);
  sSqlTrans.Fields.Add('mp_direlectronica_titular',  edSA_DIRELECTRONICA_TITULAR.Text);
  sSqlTrans.Fields.Add('mp_tipo_documento_titular',  fraTipoDocumento.Value);
  sSqlTrans.Fields.Add('mp_documento_titular',       edNumeroDocumento.Text);
  sSqlTrans.Fields.Add('mp_cargo_titular',           fraCargo.Codigo);
  sSqlTrans.Fields.Add('mp_idcaracterfirma',         fraFirmante.Value);
  sSqlTrans.Fields.Add('mp_nombre_vendedor',         edSA_NOMBRE_VENDEDOR.Text);

  if edUsuarioRevision.Text <> '' then
  begin
    sSqlTrans.Fields.Add('mp_usurevision',   edUsuarioRevision.Text);
    sSqlTrans.Fields.Add('mp_fecharevision', StrToDate(edFechaRevision.Text));
  end;

  sSqlTrans.Fields.Add('mp_fechaafiliacion',         edFechaSuscripcion.Date);
  sSqlTrans.Fields.Add('mp_fechavigenciadesde',      edVigencia.Date);
  sSqlTrans.Fields.Add('mp_fechavigenciahasta',      GetFechaVigenciaHasta(iID_Modificacion, edVigencia.Date));
  sSqlTrans.Fields.Add('mp_fecharecepcionsectorafi', dcbFechaRecepcionAfiliaciones.Date);
  sSqlTrans.Fields.Add('mp_fecharecepcionfaxemail',  edFechaRecepcionFaxEmail.Date);

  if not edSA_FEINICACTIV.IsEmpty then
    sSqlTrans.Fields.Add('mp_feinicactiv',           edSA_FEINICACTIV.Date);

  sSqlTrans.Fields.Add('mp_formaj',                  fraSA_FORMAJ.Codigo);
  sSqlTrans.Fields.Add('mp_idgrupoeconomico',        fraSA_HOLDING.Value);
  sSqlTrans.Fields.Add('mp_identidadvendedor',       ObtenerEV_ID(fraEntidad.Value, fraVendedor.Value), True);
  sSqlTrans.Fields.Add('mp_idsucursal',              fraSucursal.Value, True);
  sSqlTrans.Fields.AddExtended('mp_masatotal',       fraCuadroTarifario.edMASATOTAL.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.Add('mp_motivoalta',              fraSA_MOTIVOALTA.edCodigo.Text);
  sSqlTrans.Fields.Add('mp_nivel',                   fraCuadroTarifario.edNIVEL.Text);
  sSqlTrans.Fields.Add('mp_nombre',                  cmbSA_NOMBRE.Text);
  sSqlTrans.Fields.Add('mp_observaciones',           edSA_OBSERVACIONES.Text);
  sSqlTrans.Fields.Add('mp_observaciones_post',      edSA_OBSERVACIONES_POST.Text);

  //TARIFA
  sSqlTrans.Fields.AddExtended('mp_porcdescnivel',   fraCuadroTarifario.edPORCDESCNIVEL.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_porcdescvolumen', fraCuadroTarifario.edPORCDESCVOLUMEN.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_porcmasatarifa',  fraCuadroTarifario.edPORCMASATARIFA.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_sumafijatarifa',  fraCuadroTarifario.edSUMAFIJATARIFA.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_alicuotaporc',    fraCuadroTarifario.edALICUOTAPORC.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_alicuotapesos',   fraCuadroTarifario.edALICUOTAPESOS.Value, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_sumafija',        fraCuadroTarifario.SumaFija, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_porcmasa',        fraCuadroTarifario.PorcMasa, ALL_DECIMALS, False);

  //Resetea los valores correspondientes al resto de la tarifa
  sSqlTrans.Fields.AddExtended('mp_recargosin_montofijo', 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_recargosin'          , 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_recargosin_sobrefijo', 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_recargoesp'          , 0, ALL_DECIMALS, False);
  sSqlTrans.Fields.AddExtended('mp_recargoesp_sobrefijo', 0, ALL_DECIMALS, False);

  sSqlTrans.Fields.Add('mp_presentorgrl',       FPresentoRGRL);
  sSqlTrans.Fields.Add('mp_clausulasadicionales',       FClausulasAdicionales);

  //FIN TARIFA
  sSqlTrans.Fields.Add('mp_sector',       fraSA_SECTOR.Value);
  sSqlTrans.Fields.Add('mp_suss',         fraSA_SUSS.edCodigo.Text);
//  sSqlTrans.Fields.Add('sa_tipodetarifa', fraCuadroTarifario.fraTIPOTARIFA.Value);
  sSqlTrans.Fields.Add('mp_totempleados', fraCuadroTarifario.edTOTEMPLEADOS.Value);
  sSqlTrans.Fields.Add('mp_franquicia',   edFranquicia.Value);
  sSqlTrans.Fields.Add('mp_origen',       fraSA_ORIGEN.edCodigo.Text);

  //DIRECCION LEGAL
  sSqlTrans.Fields.Add('mp_cpostal',   fraDOMICILIO_LEGAL.CodigoPostal);
  sSqlTrans.Fields.Add('mp_calle',     fraDOMICILIO_LEGAL.Calle);
  sSqlTrans.Fields.Add('mp_localidad', fraDOMICILIO_LEGAL.Localidad);
  if fraDOMICILIO_LEGAL.Provincia <> '' then
    sSqlTrans.Fields.Add('mp_provincia', String(ValorSqlEx('SELECT pv_codigo' +
                                                            ' FROM cpv_provincias' +
                                                           ' WHERE pv_descripcion = :descripcion',
                                         [fraDOMICILIO_LEGAL.Provincia], 'NULL')), False);

  sSqlTrans.Fields.Add('mp_cpostala',     fraDOMICILIO_LEGAL.CPA);
  sSqlTrans.Fields.Add('mp_departamento', fraDOMICILIO_LEGAL.Departamento);

  if Trim(fraDOMICILIO_LEGAL.Numero) = '' then
    fraDOMICILIO_LEGAL.Numero := 'S/N';

  sSqlTrans.Fields.Add('mp_numero', fraDOMICILIO_LEGAL.Numero);
  sSqlTrans.Fields.Add('mp_piso',   fraDOMICILIO_LEGAL.Piso);

  //DIRECCION POSTAL
  sSqlTrans.Fields.Add('mp_cpostal_post',   fraDomicilioPostal.CodigoPostal);
  sSqlTrans.Fields.Add('mp_calle_post',     fraDomicilioPostal.Calle);
  sSqlTrans.Fields.Add('mp_localidad_post', fraDomicilioPostal.Localidad);

  if fraDomicilioPostal.Provincia <> '' then
    sSqlTrans.Fields.Add('mp_provincia_post', String(ValorSqlEx('SELECT pv_codigo' +
                                                                 ' FROM cpv_provincias' +
                                                                ' WHERE pv_descripcion = :descripcion',
                                              [fraDomicilioPostal.Provincia], 'NULL')), False);

  sSqlTrans.Fields.Add('mp_cpostala_post',     fraDomicilioPostal.CPA);
  sSqlTrans.Fields.Add('mp_departamento_post', fraDomicilioPostal.Departamento);

  if Trim(fraDomicilioPostal.Numero) = '' then
    fraDomicilioPostal.Numero := 'S/N';

  sSqlTrans.Fields.Add('mp_numero_post', fraDomicilioPostal.Numero);
  sSqlTrans.Fields.Add('mp_piso_post',   fraDomicilioPostal.Piso);

  sSqlTrans.Fields.Add('mp_hojaslegajos', edSA_HOJASLEGAJOS.Value);

  iSA_ID := iID_Modificacion;
  sSqlTrans.PrimaryKey.Add('mp_id', iSA_ID, False);
  iNroInterno := edSA_NROINTERNO.Value;
  sSqlTrans.Fields.Add('mp_nrointerno',   iNroInterno);
  sSqlTrans.Fields.Add('mp_idformulario', fIdFormulario);

  sSqlTrans.Fields.Add('mp_lugarsuscripcion', GetLugarSuscripcion(iSA_ID));
  try
    try
      BeginTrans;
      EjecutarSqlST(sSqlTrans.Sql);

      // Pasa las modificaciones sobre los teléfonos de la tabla temporal a la original..

      fraTELEFONO_LEGAL.CopiarTempATelefonos(iSA_ID);
      fraTELEFONO_POSTAL.CopiarTempATelefonos(iSA_ID);
      fraContacto.fraTelefonos.CopiarTempATelefonos(iSA_ID);

      CommitTrans;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    sSqlTrans.Free;
  end;
end;

procedure TfrmCargaSolicitudes.BloquearControlesPDF(const aActivados: Boolean);
begin
  LockControls([edSA_FORMULARIO, edSA_CUIT, fraCuadroTarifario.edTOTEMPLEADOS, fraCuadroTarifario.edMASATOTAL, fraCuadroTarifario.edTOTEMPLEADOS,
                fraCuadroTarifario.edMASATOTAL, fraCuadroTarifario.edNIVEL, fraCuadroTarifario.fraCIIU, fraEstado, edSA_FAX_POST, gbPersoneriaFirmante,
                gbFormulariosAnexos, gbPep, gbRevision, edSA_HOJASLEGAJOS, {edSA_NOMBRE_VENDEDOR,} btnAceptar ], not aActivados);


  tblLimpiar.Enabled         := aActivados;
  tblGuardar.Enabled         := aActivados;
  tblNomina.Enabled          := aActivados;
  tblEstablecimiento.Enabled := aActivados;
  tblSRT.Enabled             := aActivados;
  tbDocumentacion.Enabled    := aActivados;
  tbDatosLegajos.Enabled     := aActivados;
  tblImprimir.Enabled        := aActivados;
  tblVerArchivos.Enabled     := aActivados;
  btnAdministracionArchivos.Enabled := aActivados;
  tblCasasParticulares.Enabled := aActivados;
  tblSalir.Enabled           := aActivados;

  tblGuardarPDF.Enabled := not aActivados;

  if not aActivados then
  begin
    tblGuardarTemporal.ImageIndex := 39;
    ToolBar.Images := frmPrincipal.ilColor;
    tblGuardarTemporal.Hint := 'Cancelar Edición PDF';
    TelefonosModoTemporal(True);
  end
  else
  begin
    ToolBar.Images := frmPrincipal.ilByN;
    tblGuardarTemporal.ImageIndex := 58;
    TelefonosModoTemporal(False);
    DoCargaDatosSolicitudOriginal(iID_Modificacion);
    tblGuardarTemporal.Hint := 'Habilitar Edición PDF';
  end;
end;

procedure TfrmCargaSolicitudes.DoPrepararSolicitudTemporal;
begin
  //Guardar en temp y existen preguntar (Existen datos en la tabla temporal quiere eliminarlos para dejar los datos actuales en producción
  if ExisteIdDatosTemporales(iID_Modificacion) then
  begin
    if MsgAsk('Existen datos en la tabla temporal. ¿ Desea eliminarlos para dejar los datos actuales en producción ?') then
    begin
      DoGuardarSolicitudTemporal(True);
      GenerarPDFSolicitudAfiliacion;
      CopiarTelefonosTemporalesProd;
      tblGuardarClick(nil);
      DoEliminarPDFTemporal(iID_Modificacion);
    end
    else
    begin
      DoGuardarSolicitudTemporal(True);
      GenerarPDFSolicitudAfiliacion;
    end;
  end
  else
  begin
    DoGuardarSolicitudTemporal(False);
    GenerarPDFSolicitudAfiliacion;
  end;

  BloquearControlesPDF(True);
end;

procedure TfrmCargaSolicitudes.tblGuardarPDFClick(Sender: TObject);
begin
  if IsValidar then
  begin
    DoPrepararSolicitudTemporal;
    DoCargaDatosSolicitudOriginal(iID_Modificacion);
  end;
end;

procedure TfrmCargaSolicitudes.DoEliminarPDFTemporal(const aIdSolicitud: Integer);
var
  sSql: String;
begin
  sSql :=
    'DELETE FROM tmp.tmp_solicitudafiliacion' +
         ' WHERE mp_id = :id';
  EjecutarSqlEx(sSql, [aIdSolicitud]);
end;

function TfrmCargaSolicitudes.GetLugarSuscripcion(const iId: TTableID): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT sa_lugarsuscripcion' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  Result := ValorSqlEx(sSql, [iId]);
end;

function TfrmCargaSolicitudes.isFechaSuscripcionEnBaseOk(const aId: TTableID): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = :id' +
      ' AND sa_fecharecepcionsectorafi IS NOT NULL';
  Result := ExisteSqlEx(sSql, [aId]);
end;

procedure TfrmCargaSolicitudes.MensajeCampaniaF931(const aId: TTableID);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM asa_solicitudafiliacion' +
     ' JOIN asc_solicitudcotizacion ON sc_id = sa_idsolicitudcotizacion' +
     ' JOIN aca_campania931 ON ca_identidad = sc_identidad AND ca_fechabaja IS NULL AND ca_fechahasta >= SYSDATE' +
    ' WHERE sc_campania931 = ''S''' +
      ' AND sa_id = :id';

   if ExisteSqlEx(sSql, [aId]) then
     MessageBox(0, 'Debe presentar un Formulario 931.', 'Formulario 931', MB_ICONWARNING or MB_OK);
end;

function TfrmCargaSolicitudes.GetIdReafiliacion(const iId: TTableID): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT sa_idrevisionprecio' +
     ' FROM afi.asa_solicitudafiliacion' +
    ' WHERE sa_id = :id';
  Result := ValorSqlIntegerEx(sSql, [iId]);
end;

function TfrmCargaSolicitudes.GetIdRenglonPCP(const aRenglon: Integer): TTableId;
var
  sSql : String;
begin
  sSql := 'SELECT pp_id ' +
          '  FROM afi.app_parametro_pcp ' +
          ' WHERE pp_renglon = :renglon ';

  Result := ValorSqlIntegerEx(sSql, [aRenglon], -1);
end;

procedure TfrmCargaSolicitudes.TelefonosModoTemporal(aEsTemporal: boolean);
begin
  if aEsTemporal then
  begin
    fraTELEFONO_LEGAL.Initialize('MP_SOLICITUD', False, False, 'MP', 'TMP.TMP_TELEFONOSOLICITUD', 'L');
    fraTELEFONO_POSTAL.Initialize('MP_SOLICITUD', False, False, 'MP', 'TMP.TMP_TELEFONOSOLICITUD', 'P');
    fraContacto.fraTelefonos.Initialize('MP_SOLICITUD', False, False, 'MP', 'TMP.TMP_TELEFONOSOLICITUD', 'X');
    fraTELEFONO_LEGAL.FillCombo(True, iID_Modificacion);
    fraTELEFONO_POSTAL.FillCombo(True, iID_Modificacion);
    fraContacto.fraTelefonos.FillCombo(True, iID_Modificacion);
  end
  else
  begin
    fraTELEFONO_LEGAL.Initialize('TS_SOLICITUD', False, False, 'TS', 'ATS_TELEFONOSOLICITUD', 'L');
    fraTELEFONO_POSTAL.Initialize('TS_SOLICITUD', False, False, 'TS', 'ATS_TELEFONOSOLICITUD', 'P');
    fraContacto.fraTelefonos.Initialize('TS_SOLICITUD', False, False, 'TS', 'ATS_TELEFONOSOLICITUD', 'X');
    fraTELEFONO_LEGAL.FillCombo(True, iID_Modificacion);
    fraTELEFONO_POSTAL.FillCombo(True, iID_Modificacion);
    fraContacto.fraTelefonos.FillCombo(True, iID_Modificacion);
  end;
end;

procedure TfrmCargaSolicitudes.CopiarTelefonosTemporalesProd;
var
  sSql: String;
  sSqlTrans: TSql;
begin

  sSql :=
    'DELETE FROM ats_telefonosolicitud' +
         ' WHERE ts_solicitud = :id';
  EjecutarSqlEx(sSql, [iID_Modificacion]);

  sSqlTrans := TSQL.Create('ATS_TELEFONOSOLICITUD');
  sSqlTrans.SqlType := stInsert;

  sSql :=
    'SELECT *' +
     ' FROM tmp.tmp_telefonosolicitud' +
    ' WHERE mp_solicitud = :id';

  with GetQueryEx(sSql, [iID_Modificacion]) do
  try
    while not Eof do
    begin
      sSqlTrans.Fields.Clear;
      //sSqlTrans.Fields.Add('mp_id',             1);
      sSqlTrans.Fields.Add('ts_solicitud',      FieldByName('mp_solicitud').AsInteger);
      sSqlTrans.Fields.Add('ts_tipo',           FieldByName('mp_tipo').AsString);
      sSqlTrans.Fields.Add('ts_idtipotelefono', FieldByName('mp_idtipotelefono').AsInteger);
      sSqlTrans.Fields.Add('ts_area',           FieldByName('mp_area').AsString);
      sSqlTrans.Fields.Add('ts_numero',         FieldByName('mp_numero').AsString);
      sSqlTrans.Fields.AddInteger('ts_interno', FieldByName('mp_interno').AsInteger, True);
      sSqlTrans.Fields.Add('ts_principal',      FieldByName('mp_principal').AsString);
      sSqlTrans.Fields.Add('ts_observacion',    FieldByName('mp_observacion').AsString);
      sSqlTrans.Fields.Add('ts_usualta',        FieldByName('mp_usualta').AsString);
      sSqlTrans.Fields.Add('ts_fechaalta',      FieldByName('mp_fechaalta').AsDateTime);
      sSqlTrans.Fields.Add('ts_usumodif',       FieldByName('mp_usumodif').AsString);
      sSqlTrans.Fields.Add('ts_fechamodif',     FieldByName('mp_fechamodif').AsDateTime);
      sSqlTrans.Fields.Add('ts_usubaja',        FieldByName('mp_usubaja').AsString);
      sSqlTrans.Fields.Add('ts_fechabaja',      FieldByName('mp_fechabaja').AsDateTime);
      EjecutarSQL(sSqlTrans.Sql);

      Next;
      Application.ProcessMessages;
    end;
  finally
    sSqlTrans.Free;
    Free;
  end;
end;

procedure TfrmCargaSolicitudes.CopiarTelefonosProdTemporales;
var
  sSql: String;
  sSqlTrans: TSql;
begin

  sSql :=
    'DELETE FROM tmp.tmp_telefonosolicitud' +
         ' WHERE mp_solicitud = :id';
  EjecutarSqlEx(sSql, [iID_Modificacion]);

  sSqlTrans := TSql.Create('tmp.tmp_telefonosolicitud');
  sSqlTrans.SqlType := stInsert;

  sSql :=
    'SELECT *' +
     ' FROM ats_telefonosolicitud' +
    ' WHERE ts_solicitud = :solicitud';

  with GetQueryEx(sSql, [iID_Modificacion]) do
  try
    while not Eof do
    begin
      sSqlTrans.Fields.Clear;
      //sSqlTrans.Fields.Add('mp_id',             1);
      sSqlTrans.Fields.Add('mp_solicitud',      FieldByName('ts_solicitud').AsInteger);
      sSqlTrans.Fields.Add('mp_tipo',           FieldByName('ts_tipo').AsString);
      sSqlTrans.Fields.Add('mp_idtipotelefono', FieldByName('ts_idtipotelefono').AsInteger);
      sSqlTrans.Fields.Add('mp_area',           FieldByName('ts_area').AsString);
      sSqlTrans.Fields.Add('mp_numero',         FieldByName('ts_numero').AsString);
      sSqlTrans.Fields.AddInteger('mp_interno', FieldByName('ts_interno').AsInteger, True);
      sSqlTrans.Fields.Add('mp_principal',      FieldByName('ts_principal').AsString);
      sSqlTrans.Fields.Add('mp_observacion',    FieldByName('ts_observacion').AsString);
      sSqlTrans.Fields.Add('mp_usualta',        FieldByName('ts_usualta').AsString);
      sSqlTrans.Fields.Add('mp_fechaalta',      FieldByName('ts_fechaalta').AsDateTime);
      sSqlTrans.Fields.Add('mp_usumodif',       FieldByName('ts_usumodif').AsString);
      sSqlTrans.Fields.Add('mp_fechamodif',     FieldByName('ts_fechamodif').AsDateTime);
      sSqlTrans.Fields.Add('mp_usubaja',        FieldByName('ts_usubaja').AsString);
      sSqlTrans.Fields.Add('mp_fechabaja',      FieldByName('ts_fechabaja').AsDateTime);
      EjecutarSQL(sSqlTrans.Sql);

      Next;
      Application.ProcessMessages;
    end;
  finally
    sSqlTrans.Free;
    Free;
  end;
end;

procedure TfrmCargaSolicitudes.fraSA_SECTORExit(Sender: TObject);
begin
  fraSA_SECTOR.FrameExit(Sender);
  
  if not fraSA_SECTOR.IsEmpty then
  begin
    case StrToInt(fraSA_SECTOR.Value) of
      4:
      begin
        fraSA_SUSS.Value := '1';
       // fraSA_SUSS.Locked := True;
      end;
      2:
      begin
        fraSA_SUSS.Value := '2';
       // fraSA_SUSS.Locked := True;
      end;
      3:
      begin
        fraSA_SUSS.Value := '2';
      //  fraSA_SUSS.Locked := True;
      end;
      else
      //  fraSA_SUSS.Locked := False;
        fraSA_SUSS.Clear;
    end;
  end
  else
  begin
    //fraSA_SUSS.Locked := False;
    fraSA_SUSS.Clear;
  end;
end;

procedure TfrmCargaSolicitudes.DoTareaSic(aIdFormulario: Integer);
var
  i, nIdTarea: Integer;
  sDocumentacion: String;
  sContacto: String;
  sSql: String;
begin
  //Segun hablado con tavasci esto evitaria que se generen tareas nuevas mientras hay una activa 355 (automatica sic)
  if not ExisteSqlEx('SELECT 1 FROM agenda.aat_agendatarea WHERE at_idtipoevento = :idtipoevento AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_RECEP_FALTANTE, 1, aIdFormulario]) then
  begin
    if (MessageDlg('¿ Desea gestionar la tarea a través del SIC ?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
    begin
      if fpTareaSIC.ShowModal = MrOk then
      begin
        nIdTarea := ValorSqlIntegerEx('SELECT at_id FROM agenda.aat_agendatarea WHERE at_idtipoevento = :idtipoevento AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_DOCU_FALTANTE, 1, aIdFormulario]);

        for i := 0 to GridDocFaltante.RowCount - 1 do
          if (GridDocFaltante.IsChecked(0, i)) and (GridDocFaltante.FontStyles[1, i] <> [fsStrikeOut]) then
            sDocumentacion := sDocumentacion + GridDocFaltante.Cells[1, i] + ', ';



        //if (sDocumentacion > '') or (GetCantidadDocFaltante(iID_Modificacion) > 0) then
        if (sDocumentacion > '') then
        begin
          if Pos('<Contacto:', edObservacionSic.Text) = 0 then //Si detecto que borraron los datos del contacto los agrego
            sContacto := ' <Contacto: ' + edSA_TITULAR.Text +' Cargo: '+ fraCargo.cmbDescripcion.Text +' DNI: '+ edNumeroDocumento.Text+ '>';

          sDocumentacion := LeftStr(sDocumentacion, Length(sDocumentacion) - 2);

          if nIdTarea > 0 then
          begin
            if FTextoSic <> 'Todavía falta la siguiente documentación: ' + sDocumentacion + CRLF + iif(Trim(edObservacionSIC.Text) > '', 'Observación: ' + edObservacionSIC.Text, '') then
            begin
              sSql :=
                'INSERT INTO agenda.aot_observaciontarea' +
                         ' (ot_id, ot_observaciones, ot_idagendatarea, ot_fechaalta, ot_usualta)' +
                  ' VALUES (agenda.seq_aot_id.NEXTVAL, :observaciones, :idagendatarea, SYSDATE, :usualta)';
              EjecutarSqlSTEx(sSql, ['Todavía falta la siguiente documentación: ' + sDocumentacion + CRLF + iif(Trim(edObservacionSIC.Text) > '', 'Observación: ' +
                                   edObservacionSIC.Text, '') + sContacto, nIdTarea, Sesion.UserID])
            end
            else
              ShowMessage('No se detectaron cambios para el SIC.');
          end
          else
          begin
            if FTextoSic <> 'Documentación faltante: ' + sDocumentacion + CRLF + IIF(Trim(edObservacionSIC.Text) > '', 'Observación: ' + edObservacionSIC.Text, '') then
            begin
              sSql :=
                'DECLARE' +
                ' idtarea NUMBER(8);' +
              ' BEGIN' +
                 ' art.agenda_pkg.do_insertartarea(:idtipoevento, :idmotivoingreso, SYSDATE, idtarea, NULL, :asignaauto, :enviamail, :usuario, :descripcion, NULL, NULL);' +
                ' UPDATE agenda.aat_agendatarea' +
                   ' SET at_idformulario = :idformulario,' +
                        ' at_idvendedor = (SELECT ev_idvendedor' +
                                          ' FROM xev_entidadvendedor' +
                                          ' WHERE ev_id = (SELECT sa_identidadvendedor' +
                                                           ' FROM asa_solicitudafiliacion' +
                                                          ' WHERE sa_idformulario = :idformulario)),' +   // Esto en algunos casos puede ser null
                       ' at_identidad = (SELECT ev_identidad' +
                                          ' FROM xev_entidadvendedor' +
                                         ' WHERE ev_id = (SELECT sa_identidadvendedor' +
                                                          ' FROM asa_solicitudafiliacion' +
                                                         ' WHERE sa_idformulario = :idformulario))' +
                  ' WHERE at_id = idtarea;' +
                 ' art.agenda_pkg.do_asignartareaautomaticamente(idtarea, ''S'');' +
              ' END;';
              EjecutarSqlSTEx(sSql, [SIC_DOCU_FALTANTE, SIC_MOTIVO_INGRESO, 'N', 'N', Sesion.UserID, 'Documentación faltante: ' + sDocumentacion + CRLF +
                                    IIF(Trim(edObservacionSIC.Text) > '', 'Observación: ' + edObservacionSIC.Text, '') + sContacto, aIdFormulario])
            end
            else
              MessageDlg('No se detectaron cambios para el SIC.', mtInformation, [mbOK], 0);
          end
        end
        else
        begin
          //Esto por ahora lo voy a comentar hasta que se defina exactamente como tiene que funcionar.
          CerrarTarea355SiExiste(aIdFormulario); //Si se recepciona todo y veo que hay una tarea 355 activa tambien la cierro
          if nIdTarea > 0 then
          begin
            sSql :=
              'BEGIN' +
              ' art.agenda_pkg.do_agendartarea(:idtarea, SYSDATE, :idusuario, :respuesta, NULL);' +
            ' END;';
            EjecutarSqlSTEx(sSql, [nIdTarea, Sesion.ID, 'Se recepcionó toda la documentación que faltaba.']);
            MessageDlg('La tarea del SIC ha sido cerrada.', mtInformation, [mbOK], 0);
          end
          else
            MessageDlg('No hay nada que guardar en el SIC.', mtInformation, [mbOK], 0);
        end
      end
      else
        MessageDlg('Tarea del SIC cancelada.', mtInformation, [mbOK], 0);
    end
    else
      MessageDlg('No se guardará tarea en el SIC.', mtInformation, [mbOK], 0);
  end else
    begin
      if ExisteSqlEx('SELECT 1 FROM agenda.aat_agendatarea WHERE at_idtipoevento = :idtipoevento AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_RECEP_FALTANTE, 1, aIdFormulario]) then
        MessageDlg('Tenga en cuenta que su sector, tiene pendiente una tarea de "Recepción de documentación faltante de contratos nuevos" para esta Solicitud de Afiliación. ' + #13#10 +
                   ' Esto quiere decir que Comercial ha indicado que toda documentación ha sido entregada.', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmCargaSolicitudes.btnAceptarSICClick(Sender: TObject);
begin
  fpTareaSIC.ModalResult := MrOk;
end;

procedure TfrmCargaSolicitudes.btnCancelarSICClick(Sender: TObject);
begin
  fpTareaSIC.ModalResult := MrCancel;
end;

procedure TfrmCargaSolicitudes.fpTareaSICShow(Sender: TObject);
var
  aDocumentos, aDocumentosActualesSic: TStringList;
  aDocumentosFaltantes: TStringList;
begin
  ClearFpSIC;

  aDocumentos            := TStringList.Create;
  aDocumentosActualesSic := TStringList.Create;
  aDocumentosFaltantes   := TStringList.Create;

  LoadDocumentos(aDocumentos, aDocumentosActualesSic);  //cargo la Documentacion enviada al SIC (orignal tarea y ahora obser)
  LoadDocumentosFaltantes(iID_Modificacion, aDocumentosFaltantes); // cargo los que faltan ahora en AFI
  CompareAndFillDocumentosFaltantes(aDocumentos, aDocumentosActualesSic, aDocumentosFaltantes); //comparo y lleno la lista

  aDocumentosFaltantes.Free;
  aDocumentos.Free;
  aDocumentosActualesSic.Free;
end;

procedure TfrmCargaSolicitudes.LoadDocumentos(var aDocs, aDocsActuales: TStringList);
var
  sSql, sTextoAux, sFaltantesOrig: String;
  iTarea: TTAbleId;
begin
  iTarea := 0;

  //DocFaltante Original
  sSQL := 'SELECT at_id, at_descripcion FROM agenda.aat_agendatarea WHERE at_idtipoevento = :idtipoevento AND at_estado = :estado AND at_idformulario = :idformulario';
  with GetQueryEx(sSql, [SIC_DOCU_FALTANTE, 1, FIdFormulario]) do
  try
    if not IsEmpty then
    begin
      iTarea := FieldByName('at_id').AsInteger;
      FTextoSIC := FieldByName('at_descripcion').AsString;
      sTextoAux := FieldByName('at_descripcion').AsString;

      sFaltantesOrig := GetDocumentacion(sTextoAux, 'Documentación faltante: ');

      edObservacionSic.Text := ParceObservacion(sTextoAux);

      while (sFaltantesOrig <> '') or (Pos(',', sFaltantesOrig) <> 0) do //Busco la documentacion faltante
        if (Pos(',', sFaltantesOrig) = 0) and (sFaltantesOrig <> '') then //puede ser que quede una coma por algun lado
        begin
          aDocs.Add(Trim(sFaltantesOrig));
          sFaltantesOrig := '';
        end
        else
        begin
          sTextoAux := Copy(sFaltantesOrig,0,Pos(',', sFaltantesOrig) - 1 );
          aDocs.Add(Trim(sTextoAux));
          sFaltantesOrig := AnsiReplaceStr(sFaltantesOrig, sTextoAux + ',', '');
        end;
    end;
  finally
    Free;
  end;

  //aDocumentosFaltantes.Add('Mi Simplificacion');

  //Ultimo Comentario
  sTextoAux := '';
  sFaltantesOrig := '';
  sSql := 'SELECT ot_observaciones FROM agenda.aot_observaciontarea WHERE ot_idagendatarea = :idagendatarea ORDER BY ot_id DESC';
  with GetQueryEx(sSql, [iTarea]) do
  try
    if not IsEmpty then
      while not Eof do
      begin
        sTextoAux := FieldByName('ot_observaciones').AsString;
        FTextoSIC := FieldByName('ot_observaciones').AsString;
        sFaltantesOrig := GetDocumentacion(sTextoAux, 'Todavía falta la siguiente documentación: ');
        edObservacionSic.Text := ParceObservacion(sTextoAux);
        if Trim(sFaltantesOrig) > '' then
          Break;

        Next;
      end;

    while (sFaltantesOrig <> '') or (Pos(',', sFaltantesOrig) <> 0) do //Busco la documentacion faltante
    begin
      if (Pos(',',sFaltantesOrig) = 0) and (sFaltantesOrig <> '') then //puede ser que quede una coma por algun lado
        sTextoAux := sFaltantesOrig
      else
        sTextoAux := Copy(sFaltantesOrig,0,Pos(',', sFaltantesOrig) + 1);

      sFaltantesOrig := AnsiReplaceStr(sFaltantesOrig, sTextoAux, '');
      sTextoAux := AnsiReplaceStr(sTextoAux, ',', '');
      aDocsActuales.Add(Trim(sTextoAux));
    end;
  finally
    Free;
  end;

end;

procedure TfrmCargaSolicitudes.CompareAndFillDocumentosFaltantes(const aDocs, aDocsActualesSic, aDocumentosFaltantes: TStringList);
var
  iLoop: Integer;
  aPoint: TPoint;
  SearchPoint: TPoint;
begin
  aPoint := Point(-1, -1);
  //edObservacionSic.Text := aDocs.Text + '/ '+ aDocumentosFaltantes.Text;

  if aDocs.IndexOf('Mi Simplificacion') = -1 then
    aDocs.Add('Mi Simplificacion');
  if aDocs.IndexOf('Otros Faltantes') = -1 then   //esto despues hay que ver de hacerlo mejor, por ahora con solo 2 docs, va a andar
    aDocs.Add('Otros Faltantes');                //recordar abajo hay que sumar 1 al docs.count para testear si es la primera vez que entra

  if aDocsActualesSic.Count > 0 then   //agrego los documentos del ultimo evento en el otro stringlist
    //agregar los docs orignales faltantes
    for iLoop := 0 to aDocsActualesSic.Count -1 do
      if aDocs.IndexOf(aDocsActualesSic[iLoop]) = -1 then
        aDocs.Add(aDocsActualesSic[iLoop]);

  if aDocs.Count > 0 then
    //agregar los docs orignales faltantes
    for iLoop := 0 to aDocs.Count - 1 do
      AddText(aDocs[iLoop], aDocumentosFaltantes.IndexOf(aDocs[iLoop]) = -1, True);

  if (aDocumentosFaltantes.IndexOf('Mi Simplificacion') = -1) then
    if not DocWasUnchecked('Mi Simplificacion') then
      aDocumentosFaltantes.Add('Mi Simplificacion');
  if (aDocumentosFaltantes.IndexOf('Otros Faltantes') = -1) then
    if not DocWasUnchecked('Otros Faltantes') then
      aDocumentosFaltantes.Add('Otros Faltantes');

  if aDocumentosFaltantes.Count > 0 then  //agregar docs faltantes actuales
    for iLoop := 0 to aDocumentosFaltantes.Count -1 do
    begin
      SearchPoint := GridDocFaltante.Find(aPoint, aDocumentosFaltantes[iLoop], []);
      if (SearchPoint.X = -1) or (SearchPoint.Y = -1) then //si no esta en doc faltante original agregar
        AddText(aDocumentosFaltantes[iLoop], False, False)
      else  //Como ya los agrego a la grilla arriba tengo que tacharlo
      begin
        GridDocFaltante.FontStyles[SearchPoint.X, SearchPoint.Y] := [];
        GridDocFaltante.SetCheckBoxState(SearchPoint.X, SearchPoint.Y, False);
      end
    end;

  GridDocFaltante.RowCount := GridDocFaltante.RowCount - 1;

  if (aDocsActualesSic.Count = 0) and (aDocs.Count = 2) then //Si es la primera vez check todos
    SicListCheckState(True);
end;

procedure TfrmCargaSolicitudes.LoadDocumentosFaltantes(const aIdSolicitud: TTableId; var aDocs: TStringList);
var
  sSql: String;
  sTexto, sDoc: String;
begin
  sSql := 'SELECT art.afiliacion.falta_doc_solicitud(:id) FROM DUAL';
  sTexto := ValorSqlEx(sSql, [aIdSolicitud]);

  if Pos(', ', sTexto) = 1 then
    sTexto := Copy(sTexto, 2, Length(sTexto) - 2); // a veces me viene con un ', ' al principio

  while (sTexto <> '') or (Pos(',', sTexto)<> 0) do
  begin
    if (Pos(',', sTexto) = 0) and (sTexto <> '') then
      sDoc := sTexto
    else
      sDoc := Copy(sTexto, 0, Pos(',', sTexto) + 1);

    sTexto := AnsiReplaceStr(sTexto,sDoc, '');
    sDoc := AnsiReplaceStr(sDoc, ',', '');
    aDocs.Add(Trim(sDoc));
  end;
end;

procedure TfrmCargaSolicitudes.AddText(const aText: String; const StrikedOut, Checked : Boolean);
begin
  GridDocFaltante.Cells[1, GridDocFaltante.RowCount - 1] := aText;
  GridDocFaltante.AddCheckBox(0, GridDocFaltante.RowCount - 1, Checked, False);
  if StrikedOut then
    GridDocFaltante.FontStyles[1, GridDocFaltante.RowCount - 1] := [fsStrikeOut];
  GridDocFaltante.AddRow;
end;

function TfrmCargaSolicitudes.GetDocumentacion(const aTexto, aTipo: String): String;
var
  sResultado: String;
begin
  if InStr(aTexto, aTipo) > 0 then
  begin
    sResultado := Copy(aTexto, Pos(aTipo, aTexto), Length(aTexto) - Pos(aTipo, aTexto) + 1);
    sResultado := AnsiReplaceStr(sResultado, aTipo , '');
    sResultado := AnsiReplaceStr(sResultado, CRLF, ''); //quito el enter
  end;

  if InStr(sResultado, 'Observación:', 0) > 0 then    //Quito las observaciones
    sResultado := Copy(sResultado, 0, Pos('Observación: ', sResultado) - 1);

  if InStr(sResultado, ' <Contacto:', 0)  > 0 then      //Quito los datos del contacto si es que no habia observacion
    sResultado := Copy(sResultado, 0, Pos(' <Contacto: ', sResultado) - 1);

  Result := sResultado;
end;

function TfrmCargaSolicitudes.ParceObservacion(const aTexto: String): String;
var
  sResultado: String;
begin
  if InStr(aTexto, 'Observación: ') > 0 then
  begin
    sResultado := Copy(aTexto, Pos('Observación: ', aTexto), Length(aTexto) - Pos('Observación: ', aTexto) + 1);
    sResultado := AnsiReplaceStr(sResultado, 'Observación: ', '');
    //sResultado := AnsiReplaceStr(sResultado, CRLF, ''); //quito el enter
  end;

  if (sResultado = '') and (InStr(aTexto, ' <Contacto:') > 0) then  //Si no hay observacion ver si hay algun dato de contacto
    sResultado := Copy(aTexto, Pos(' <Contacto:', aTexto), Length(aTexto) - Pos(' <Contacto:', aTexto) + 1);

  Result := sResultado;
end;

procedure TfrmCargaSolicitudes.PersonalCasasParticularesVisible(
  const aBoolean: Boolean);
begin
  FEsPCP := aBoolean;
  pnlCuadroTarifario.Visible := not aBoolean;
  pnlPCP.Visible := aBoolean;
  tbPCP.Visible := aBoolean;
  edFranquicia.Enabled := not aBoolean;
  fraSA_SECTOR.Enabled := not aBoolean;
  fraSA_SUSS.Enabled   := not aBoolean;

  tblCasasParticulares.Visible := aBoolean;


  if FEsPCP then
  begin
    fraCuadroTarifario.edNIVEL.Text := '0';
    fraCuadroTarifario.edTOTEMPLEADOS.Value := edCantTrabMenosDe12.Value + edCantTrabDe12a16.Value + edCantTrabMasDe16.Value;
    fraCuadroTarifario.edMASATOTAL.Value := 0;//edAlicuota.Value;
    fraCuadroTarifario.fraCIIU.Value := 1569;  // (950000= Servicios de hogares privados que contratan servicio doméstico)
    fraSA_SUSS.Value := '1';
    fraSA_SECTOR.Value := '4';
    edFranquicia.Text := '10';
  end;
end;

procedure TfrmCargaSolicitudes.RecalcularCostosPCP;
begin
  edAlicuotaMenosDe12.Value := edValorMenosDe12.Value * edCantTrabMenosDe12.Value;
  edAlicuotaDe12a16.Value   := edValorDesde12a16.Value * edCantTrabDe12a16.Value;
  edAlicuotaMasDe16.Value   := edValorMasDe16.Value * edCantTrabMasDe16.Value;

  edAlicuota.Value := edAlicuotaMenosDe12.Value + edAlicuotaDe12a16.Value + edAlicuotaMasDe16.Value;
  fraCuadroTarifario.edTOTEMPLEADOS.Value := edCantTrabMenosDe12.Value + edCantTrabDe12a16.Value + edCantTrabMasDe16.Value;

end;

procedure TfrmCargaSolicitudes.tbSalirSicClick(Sender: TObject);
begin
  fpTareaSIC.ModalResult := MrCancel;
end;

procedure TfrmCargaSolicitudes.SicListCheckState(aChecked: Boolean);
var
  iLoop: Integer;
begin
  for iLoop := 0 to GridDocFaltante.RowCount - 1 do
    GridDocFaltante.SetCheckBoxState(0, iLoop, aChecked);
end;

procedure TfrmCargaSolicitudes.tbCheckSicClick(Sender: TObject);
begin
  SicListCheckState(True);
end;

procedure TfrmCargaSolicitudes.tbUncheckSicClick(Sender: TObject);
begin
  SicListCheckState(False);
end;

procedure TfrmCargaSolicitudes.ClearFpSic;
begin
  GridDocFaltante.Clear;
  GridDocFaltante.RowCount := 0;
  GridDocFaltante.DefaultRowHeight := 16;
  GridDocFaltante.ColWidths[0] := 20;
  edObservacionSIC.Clear;
end;

procedure TfrmCargaSolicitudes.fraSA_MOTIVOALTAExit(Sender: TObject);
begin
  fraSA_MOTIVOALTA.FrameExit(Sender);  //Pedido por grossi como un extra al tk 49178
  if fraSA_MOTIVOALTA.Value <> '02' then
    fraSA_ARTANTERIOR.Clear;
end;

function TfrmCargaSolicitudes.DocWasUnchecked(const aDoc: String): boolean;
var
  aDocumentosActualesSic, aDocumentos, aDocumentosFaltantes: TStringList;
begin
  Result := False;

  aDocumentosActualesSic := TStringList.Create;
  aDocumentos := TStringList.Create;
  aDocumentosFaltantes := TStringList.Create;

  LoadDocumentos(aDocumentos, aDocumentosActualesSic);  //cargo la Documentacion enviada al SIC (orignal tarea y ahora obser)
  LoadDocumentosFaltantes(iID_Modificacion, aDocumentosFaltantes); // cargo los que faltan ahora en AFI

  if (aDocumentosActualesSic.Count > 0) and (aDocumentosActualesSic.IndexOf(aDoc) = -1) then
    Result := True;

  aDocumentosFaltantes.Free;
  aDocumentos.Free;
  aDocumentosActualesSic.Free;
end;

procedure TfrmCargaSolicitudes.CerrarTarea355SiExiste(
  const aIdFormulario: integer);
var
  sSql : String;
  nIdTarea : Integer;
begin
  nIdTarea := ValorSqlIntegerEx('SELECT at_id FROM agenda.aat_agendatarea WHERE at_idtipoevento = :idtipoevento AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_RECEP_FALTANTE, 1, aIdFormulario]);
  if nIdTarea > 0 then
  begin
    sSql :=
            'BEGIN' +
             ' art.agenda_pkg.do_agendartarea(:idtarea, SYSDATE, :idusuario, :respuesta, NULL);' +
            ' END;';
    EjecutarSqlSTEx(sSql, [nIdTarea, Sesion.ID, 'Se recepcionó toda la documentación que faltaba.']);
    ShowMessage('Se cerrará la tarea Recepción de documentación faltante de contratos nuevos');
  end;
end;

procedure TfrmCargaSolicitudes.chkPepFirma1Click(Sender: TObject);
begin
//tk 65656
{Se solicita que cuando se realice la carga de documentación en la ruta Afiliaciones-Adm. de Solic.-Carga de Solic. al tildar la primer firma del documento PEP la segunda firma se tilde automáticamente.
también cuando de incorpora documentación (Afiliaciones-Adm. de Contratos-Modificación de Contratos)}
  if chkPepFirma1.Checked then
    chkPepFirma2.Checked := True;
end;

{function TfrmCargaSolicitudes.ExisteTarea355SicActiva(
  const aIdFormulario: Integer): boolean;
begin
  Result := ValorSqlIntegerEx('SELECT 1 FROM agenda.aat_agendatarea WHERE at_idtipoevento = :idtipoevento AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_RECEP_FALTANTE, 1, aIdFormulario]) = 1;
end;  }

procedure TfrmCargaSolicitudes.tblVerArchivosClick(Sender: TObject);
  procedure ShowFormAdmArchivos(const aIdSolicitud: Integer);
  begin      //creo el form TfrmAdministracionArchivosRecepcion
    Application.CreateForm(TfrmAdministracionArchivosRecepcion, frmAdministracionArchivosRecepcion);
    try
      frmAdministracionArchivosRecepcion.Mostrar(aIdSolicitud, True); //muestro
      CalcularArchivos; //veo files cuantos tiene
    finally
      FreeAndNil(frmAdministracionArchivosRecepcion); //libero el formulario
    end;
  end;

begin
  Verificar(iID_Modificacion <= 0, edSA_FORMULARIO, 'No se encontró el formulario');
  ShowFormAdmArchivos(iID_Modificacion); //arranco el procedimiento de arriba
end;

procedure TfrmCargaSolicitudes.tbPCPClick(Sender: TObject);
var
  frmPCP : TfrmPCP;
begin
  frmPCP := TfrmPCP.Create(Self);
  with frmPCP do
  try
    LoadData(FIdFormulario);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCargaSolicitudes.CalcularArchivos;
var
  sSql: String;
begin
  sSql :=
      'SELECT COUNT(*)' +
       ' FROM afi.aar_archivosrecepcion' +
      ' WHERE ar_fechabaja IS NULL ' +
        ' AND ar_idsolicitudafiliacion = :idsolicitudafiliacion';

  btnAdministracionArchivos.Caption := 'Administración de Archivos (' + ValorSqlEx(sSql, [iID_Modificacion]) + ')';
end;

procedure TfrmCargaSolicitudes.btnAdministracionArchivosClick(
  Sender: TObject);
begin
  tblVerArchivosClick(nil);
end;

function TfrmCargaSolicitudes.isEstablecerUsuarioAFI(
  const aId: TTableID): Boolean;
var
  sSql : String;
  sdqUsuarioAfi: TSDQuery;
begin
  Result := False;
  sdqUsuarioAfi := TSDQuery.Create(Self);
  try
    sdqUsuarioAfi.DataBaseName := 'dbPrincipal';
    //sSql := 'SELECT sa_fecharecepcionsectorafi, sa_fecharecepcionfaxemail, sa_usurecepcionsectorafi' +
    sSql := 'SELECT sa_usurecepcionsectorafi' +
            '  FROM asa_solicitudafiliacion '+
            ' WHERE sa_id =:id ';

    OpenQueryEx(sdqUsuarioAfi, [aId], sSql, True);
    if not sdqUsuarioAfi.IsEmpty then
    begin
      if //((not dcbFechaRecepcionAfiliaciones.IsEmpty) and sdqUsuarioAfi.FieldByName('sa_fecharecepcionsectorafi').IsNull) or
        // ((not edFechaRecepcionFaxEmail.IsEmpty) and (sdqUsuarioAfi.FieldByName('sa_fecharecepcionfaxemail').IsNull)) and
         (sdqUsuarioAfi.FieldByName('sa_usurecepcionsectorafi').IsNull)  then
      begin
        Result := True;
      end;
    end;
  finally
    sdqUsuarioAfi.Free;
  end;
end;

{function TfrmCargaSolicitudes.GetCantidadDocFaltante(
  const aId: TTableID): Integer;
var
  sSql: String;
begin
  sSql := 'SELECT' +
          '   (LENGTH(art.afiliacion.falta_doc_solicitud(sa_id, ''S'')) - ' +
          '    LENGTH(REPLACE(art.afiliacion.falta_doc_solicitud(sa_id, ''S''), '',''))) / LENGTH('','') TOTAL_DOC' +
          '  FROM asa_solicitudafiliacion' +
          ' WHERE sa_id = :id';
  Result := ValorSqlIntegerEx(sSql, [aId], 0);
end;  }

function TfrmCargaSolicitudes.TieneRGRL: Boolean;
var
  aCheck : TCheckBox;
begin
  aCheck := TCheckBox(FindComponent('_check_' + '11'));
  Result := aCheck.Checked;
end;

procedure TfrmCargaSolicitudes.tblCasasParticularesClick(Sender: TObject);
begin
  Verificar(not FEsModificacion, ToolBar, 'No es posible cargar un Establecimiento sin antes haber cargado una solicitud.');
  frmCargaLugarDeTrabajo.Free;
  try
    // Busca si ya tiene datos sino ingresa los datos actuales...
    if not ExisteSQLEx('SELECT 1' +
                        ' FROM ase_solicitudestablecimiento' +
                       ' WHERE se_idsolicitud = :idsolicitud', [iID_Modificacion]) then
      DoGrabaEstablecimiento(iID_Modificacion);

    frmCargaLugarDeTrabajo := TfrmCargaLugarDeTrabajo.Create(frmPrincipal);
    frmCargaLugarDeTrabajo.DoCargaIDFormulario(FIdFormulario);
  except
    //
  end;
end;

procedure TfrmCargaSolicitudes.AnularMailAutorizacion;
var
  sSql : String;
begin
 { sSql := 'UPDATE afi.are_autorizarecepcion' +
           ' SET re_fechaautorizacion = SYSDATE,' +
           '     re_usuarioautorizacion = :usuario,' +
           '     re_autorizado = ''S''' +
           '  WHERE re_idsolicitud = :solicitud';
  EjecutarSQLSTEx(sSql, [Sesion.UserID, iID_Modificacion]);   }

  sSql := 'UPDATE web.wtw_transaccionweb' +
           ' SET tw_fechaejecucion = SYSDATE,' +
					 '	   tw_usuejecucion = :usuario' +
           '  WHERE tw_id = (SELECT re_idtransaccionweb' +
                             '  FROM afi.are_autorizarecepcion' +
                             ' WHERE re_idsolicitud = :solicitud)';
  EjecutarSQLSTEx(sSql, [Sesion.UserID, iID_Modificacion]);
end;

end.
