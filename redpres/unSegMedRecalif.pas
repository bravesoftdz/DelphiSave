unit unSegMedRecalif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unfraPrestador, Mask, ToolEdit,
  ArtComboBox, unFraTrabajadorSIN, Buttons, SinEdit, DateComboBox, Grids, DBGrids, RXDBCtrl, ArtDBGrid, Db, SDEngine,
  General, PatternEdit, DateTimeEditors, unArtDbFrame, unFraEmpresa, artSeguridad, Placemnt, ShortCutControl, SortDlg,
  CurrEdit, unFraCodDesc, unFraCodigoDescripcion, unfraCtbTablas, FormPanel, IntEdit, RxLookup, unfraDireccion,
  QuickRpt, QRCtrls, unFraDomicilio, Menus, RxPlacemnt, RxToolEdit, JvExMask,
  JvToolEdit;

type
  TCartaDatosFijos = record
    // Datos de la Delegacion que imprime la CD
    Domicilio : String;
    CPostal   : String;
    Localidad : String;
    Provincia : String;
    Lugar     : String;
    Fecha     : TDateTime;
  end;

  TFrmSegMedRecalif = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton6: TToolButton;
    tbSalir: TToolButton;
    ToolButton1: TToolButton;
    lblTotales: TLabel;
    Grid: TArtDBGrid;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    tbInfoRecaidas: TToolButton;
    ToolButton5: TToolButton;
    dsSiniestro: TDataSource;
    sdqSiniestro: TSDQuery;
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    grpSiniestro: TGroupBox;
    blSinFecha: TLabel;
    pnlSiniestro: TPanel;
    sbtnBuscar: TSpeedButton;
    SinEdit: TSinEdit;
    Label1: TLabel;
    edEstado: TEdit;
    edSinFecha: TDateEditor;
    Label2: TLabel;
    edDiagnostico: TEdit;
    SortDialog: TSortDialog;
    ShortCutControl: TShortCutControl;
    FormPlacement: TFormPlacement;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    fpEventos: TFormPanel;
    gbProtocolo: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    edObservaciones: TMemo;
    Label4: TLabel;
    SinEditABM: TSinEdit;
    Label5: TLabel;
    fraProfesional: TfraCodDesc;
    Label8: TLabel;
    fraResponsable: TfraCodDesc;
    Label10: TLabel;
    Label12: TLabel;
    fraUbicacion: TfraCtbTablas;
    Label13: TLabel;
    Label14: TLabel;
    DateCitacion: TDateComboBox;
    Label15: TLabel;
    edHora: TMaskEdit;
    edSinFechaABM: TDateComboBox;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    fpSeleccionRecaida: TFormPanel;
    lbSelRecaida: TLabel;
    Bevel8: TBevel;
    btnAceptarRecaida: TButton;
    btnCancelarRecaida: TButton;
    dsRecaidas: TDataSource;
    sdqRecaidas: TSDQuery;
    cmbRecaida: TRxDBLookupCombo;
    Seguridad: TSeguridad;
    dsBusqueda: TDataSource;
    sdqBusqueda: TSDQuery;
    sdqDatosER_SINIESTRO: TFloatField;
    sdqDatosER_ORDEN: TFloatField;
    sdqDatosER_CODIGO: TStringField;
    sdqDatosER_AUDITOR: TFloatField;
    sdqDatosER_RESPONSABLE: TFloatField;
    sdqDatosER_EVENTO: TFloatField;
    sdqDatosER_FECHA: TDateTimeField;
    sdqDatosER_OBSERVACIONES: TStringField;
    sdqDatosER_FECHACONTROL1: TDateTimeField;
    sdqDatosER_HORACITACION1: TStringField;
    sdqDatosER_FIRMA: TStringField;
    sdqDatosER_CODUBIC: TStringField;
    sdqDatosER_EVOLUTIVO: TFloatField;
    sdqDatosER_RECA_EVO: TFloatField;
    sdqDatosDESCR_CODIGO: TStringField;
    sdqDatosAU_AUDITOR: TFloatField;
    sdqDatosAU_NOMBRE: TStringField;
    sdqDatosRE_RESPONSABLE: TFloatField;
    sdqDatosRE_NOMBRE: TStringField;
    sdqDatosDESCR_UBICACION: TStringField;
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
    tbViajar: TToolButton;
    tbTrabajador: TToolButton;
    Panel1: TPanel;
    grpTrabajador: TGroupBox;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    gbUbicacion: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    edDelegacion: TEdit;
    edGTrabajo: TEdit;
    fradireccion: TfraDireccion;
    sdqBusquedaMP_CALLE: TStringField;
    sdqBusquedaMP_NUMERO: TStringField;
    sdqBusquedaMP_PISO: TStringField;
    sdqBusquedaMP_DEPARTAMENTO: TStringField;
    sdqBusquedaMP_LOCALIDAD: TStringField;
    sdqBusquedaMP_CPOSTAL: TStringField;
    sdqBusquedaMP_CPOSTALA: TStringField;
    sdqBusquedaMP_PROVINCIA: TStringField;
    sdqBusquedaDESCPROV: TStringField;
    tbImprimirSRT: TToolButton;
    tbVerBajas: TToolButton;
    Label3: TLabel;
    edTelEmpresa: TEdit;
    sdqBusquedaMP_TELEFONOS: TStringField;
    chkRecaDictamenABM: TCheckBox;
    chkRecaDictamen: TCheckBox;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Label16: TLabel;
    ScrollBox1: TScrollBox;
    qrDerivacion: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qriLogo: TQRImage;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRLabel3: TQRLabel;
    qrlBreveDescripcion: TQRLabel;
    qrlCUIT: TQRLabel;
    QRLabel5: TQRLabel;
    qrlRSocial: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    qrlDomEmpresa: TQRLabel;
    qrlTelEmpresa: TQRLabel;
    QRLabel8: TQRLabel;
    qrlCUIL: TQRLabel;
    QRLabel9: TQRLabel;
    qrlNombreTrab: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlDomTrab: TQRLabel;
    qrlTelTrab: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel7: TQRLabel;
    qrlUbicacion: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrdbParte: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel18: TQRLabel;
    QRShape4: TQRShape;
    sdqBusquedaEX_BREVEDESCRIPCION: TStringField;
    sdqBusquedaUD_NOMBRE: TStringField;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    dsPartes: TDataSource;
    sdqPartes: TSDQuery;
    QRGroup1: TQRGroup;
    sdqPartesPV_RECAIDA: TFloatField;
    sdqPartesPV_NROPARTE: TFloatField;
    sdqPartesPV_FECHACONTROL: TDateTimeField;
    sdqPartesFECHA: TDateTimeField;
    sdqPartesEX_ALTAMEDICA: TDateTimeField;
    sdqPartesCA_NOMBREFANTA: TStringField;
    sdqPartesPV_OBSERVACIONES: TStringField;
    sdqPartesPV_DIAGNOSTICOOMS: TStringField;
    QRDBText5: TQRDBText;
    QRLabel20: TQRLabel;
    QRShape2: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    Label17: TLabel;
    Label18: TLabel;
    DateCitacion2: TDateComboBox;
    edHora2: TMaskEdit;
    sdqDatosER_FECHACONTROL2: TDateTimeField;
    sdqDatosER_HORACITACION2: TStringField;
    sdqBusquedaEX_ID: TFloatField;
    gbConformeAlta: TGroupBox;
    rbSiAlta: TRadioButton;
    rbNoAlta: TRadioButton;
    gbConformeCese: TGroupBox;
    rbSiCese: TRadioButton;
    rbNoCese: TRadioButton;
    sdqDatosER_CONFORMEALTA: TStringField;
    sdqDatosER_CONFORMECESE: TStringField;
    fraEvento: TfraCodDesc;
    sdqDatosEM_SEGTERRENO: TStringField;
    sdqDatosEM_SEGUIMIENTO: TStringField;
    sdqDatosEM_AUTOMATICO: TStringField;
    sdqDatosEM_IMPRIMIRSRT: TStringField;
    sdqDatosEM_TELEGRAMATRAB: TStringField;
    sdqBusquedaUSUGESTOR: TStringField;
    fraFirmante: TfraCodigoDescripcion;
    sdqDatosEM_ALTARECA: TStringField;
    sdqDatosEM_FECHAANTALTA: TStringField;
    Label19: TLabel;
    sdqBusquedaEX_CONTRATO: TFloatField;
    sdqRecaidasEX_RECAIDA: TStringField;
    sdqDatosER_USUALTA: TStringField;
    sdqDatosEM_RESPONSABLE: TStringField;
    TimerConfidencial: TTimer;
    fpDatosAutorizacion: TFormPanel;
    gbConEntregaMaterial: TGroupBox;
    rbEntregaSi: TRadioButton;
    rbEntregaNo: TRadioButton;
    gbDireccionEntrega: TGroupBox;
    rbDireccionPaciente: TRadioButton;
    rbDireccionART: TRadioButton;
    rbOtraDireccion: TRadioButton;
    fraDomicilio: TfraDomicilio;
    gbPersonaRecibe: TGroupBox;
    rbSiniestrado: TRadioButton;
    rbOtro: TRadioButton;
    Label20: TLabel;
    edNombreApellido: TEdit;
    Label21: TLabel;
    gbTelContacto: TGroupBox;
    edTelContacto: TEdit;
    btnAceptarAut: TBitBtn;
    btnCancelarAut: TBitBtn;
    edDNI: TEdit;
    pMenuViajar: TPopupMenu;
    mnuViajarParteEvolutivo: TMenuItem;
    mnuViajarAutorizaciones: TMenuItem;
    gbPresupIncap: TGroupBox;
    rbSiPresupIncap: TRadioButton;
    rbNoPresupIncap: TRadioButton;
    sdqDatosER_PRESUPINCAPACIDAD: TStringField;
    Label22: TLabel;
    edFechaBaja: TDateEdit;
    chkPluriempleo: TCheckBox;
    sdqBusquedaex_pluriempleo: TStringField;
    Label23: TLabel;
    sdqBusquedaTJ_ID: TFloatField;
    rgCapInt: TRadioGroup;
    sdqDatosER_CAPINT: TStringField;
    chkAviso30dias: TCheckBox;
    sdqDatosER_CHKAVISO30DIAS: TStringField;
    sdqDatoscapint: TStringField;
    procedure edSiniestroSelect(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarRecaidaClick(Sender: TObject);
    procedure btnCancelarRecaidaClick(Sender: TObject);
    procedure fpSeleccionRecaidaBeforeShow(Sender: TObject);
    procedure fpSeleccionRecaidaClose(Sender: TObject; var Action: TCloseAction);
    procedure fpEventosBeforeShow(Sender: TObject);
    procedure tbInfoRecaidasClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure tbTrabajadorClick(Sender: TObject);
    procedure fpEventosClose(Sender: TObject; var Action: TCloseAction);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                var Background: TColor; Highlight: Boolean);
    procedure DateCitacionKeyPress(Sender: TObject; var Key: Char);
    procedure edHoraKeyPress(Sender: TObject; var Key: Char);
    procedure fraEventoedCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edSinFechaABMKeyPress(Sender: TObject; var Key: Char);
    procedure fraProfesionaledCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure fraResponsableedCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure fraFirmanteedCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure fraUbicacionedCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure tbImprimirSRTClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure qrDerivacionBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure fraEventoPropiedadesChange(Sender: TObject);
    procedure TimerConfidencialTimer(Sender: TObject);
    procedure btnCancelarAutClick(Sender: TObject);
    procedure btnAceptarAutClick(Sender: TObject);
    procedure fpDatosAutorizacionBeforeShow(Sender: TObject);
    procedure rbOtraDireccionClick(Sender: TObject);
    procedure rbDireccionARTClick(Sender: TObject);
    procedure rbDireccionPacienteClick(Sender: TObject);
    procedure rbOtroClick(Sender: TObject);
    procedure rbSiniestradoClick(Sender: TObject);
    procedure rbEntregaNoClick(Sender: TObject);
    procedure rbEntregaSiClick(Sender: TObject);
    procedure mnuViajarParteEvolutivoClick(Sender: TObject);
    procedure mnuViajarAutorizacionesClick(Sender: TObject);
    procedure CargarFechaBaja(cuil: string);
    procedure pMenuViajarPopup(Sender: TObject);
  private
    EsEventoCartaDoc, EsEventoTelegrama, EsCitacionDoble, EsEventoCitacion,
    bEventoAgregado, bEventoAltaReca, bEventoCese :Boolean;
    SiniestroAct, OrdenAct, RecaidaAct, IdExpediente, iContrato, IdTrabajador :Integer;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure OnFraEventoChange(Sender: TObject);
    procedure ValidarCapInt;
    procedure CargarSiniestro(Siniestro, Orden, Recaida: Integer);
    procedure CargarGrilla(Siniestro, Orden: Integer);
    procedure HabilitarBotones(Habilita: Boolean);
    procedure LimpiarFrameEventos(MostrarBajas, Habilitar: Boolean);
    procedure EventoGeneraCartaDocTlg;
    procedure EventoCitacionDoble;
    procedure GenerarTelegrama(Siniestro, Orden, Recaida: Integer);
    procedure DoInsertarCartaDoc(Siniestro, Orden, Recaida, Evento: Integer);
    procedure DoCargarRecaDictamen(Siniestro, Orden: Integer);
    procedure EnviarMailDerivacion;
    procedure DoSeguimientoCese(iSiniestro, iOrden, iRecaida, iEvento :Integer);
    procedure DoEnviarTelegrama;
    procedure EsEventoAltaReca;
    procedure DoDestinoPapel(iReca, iEvento :Integer; sDoc :String = '');
    procedure DoGeneraTelegRecaProf_O_Prest;     // Lu TK 10911 y 12659
    procedure DoGeneraAutorizacion(iSiniestro, iOrden, iReca, iEventoNuevo: Integer);
    procedure DoHabilitarDirEntrega_OtraDireccion;   // Plan
    procedure DoHabilitarPersonaRecibe_Otro;         // Plan
    procedure Limpiar_DatosAutorizacion;             // Plan
    procedure Do_HabilitarPresupIncap(bHabilitar:boolean);  // TK 31832
    procedure Do_CargarPresupIncap;                         // TK 31832
    procedure Do_GuardarPresupIncap_EnParteEgreso;          // TK 31832
    procedure Do_Mensaje_PorcentIncap;    // TK 32543
    procedure Do_Mensaje_AltaMedica;      // TK 32543
    function ModificarEvento: Boolean;
    function AltaEvento: Boolean;
    function EliminarEvento(Siniestro, Orden, Evento: Integer; CodEvento: String): Boolean;
    function ActualizarFechaAltaMedica(Siniestro, Orden, Recaida: Integer; CodEvento: String): Boolean;
    function ActualizarEstadoSegMedico(Siniestro, Orden, Evento: Integer): Boolean;
    function GetEventoProximoBorrado(Siniestro, Orden: Integer): Integer;
    function EsEventoAutomatico: Boolean;
    function ValidarDatos: Boolean;
    function ValidarFecha: Boolean;
    function ValidarCodEvento: Boolean;
    function ValidarProfesional: Boolean;
    function ValidarFirmante: Boolean;
    function ValidarResponsableYCarta: Boolean;
    function ValidarResponsable: Boolean;
    function ValidarUbicacion: Boolean;
    function ValidarFechaControl: Boolean;
    function Validar2FechaControl :Boolean;
    function ValidarHoraControl: Boolean;
    function Validar2HoraControl: Boolean;
    function ValidarAltaCese :Boolean;
    function ValidarPresupIncap: Boolean;
    function ModificoEventoATelegrama: Boolean;
    function ExisteDireccionTrabajador(TipoSalida: Integer): Boolean;
    function GenerarEventoMedico_0: Boolean;
    function GetProximoEvento(Siniestro, Orden: Integer): Integer;
    function GetMaxFechaHastaLiquidacionILTB(Siniestro, Orden, Recaida: Integer): TDateTime;
    function DoArmarObservaciones(Descripcion: String): String;
    function GetUltimaRecaida(Siniestro, Orden: Integer): Integer;
    function GetSqlDetalleReporte: String;
    function Validar_GeneraAutorizacion: boolean;
    function EsSiniestro_EnAnioAltaMedica: boolean;
    function Get_Recaida_PMEoUltima(vSiniestro, vOrden: Integer): Integer;

  public
  end;

var
  FrmSegMedRecalif: TFrmSegMedRecalif;

implementation

uses
  unConfidencial, unPrincipal, unBusqSini, unDmPrincipal, DateTimeFuncs, AnsiSql,
  ValFuncs, UnArt, unSesion, CustomDlgs,unCartaDocumento, CUIT, strfuncs, unRedPres,
  unParteEvolutivo, unRptInformeSRT, uncomunes, Periodo, Printers, unExportPDF,
  ArchFuncs, unMoldeEnvioMail, VCLExtra, UnDestPapl, unRptCartaDocHeader, unUtilsArchivo,
  unAutSelPorSiniestro, unContratoTrabajador, unRptResumen, unSiniestros, unTercerizadoras;

const
  sqlFirmante = 'SELECT fi_id as id, fi_id as codigo, ' +
                      ' fi_firmante as descripcion, fa_fechabaja as baja ' +
                 ' FROM cat_areatexto, cfa_firmantearea, cfi_firma ' +
                ' WHERE fa_idfirmante = fi_id ' +
                  ' AND fa_idareatexto = at_id ';

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.edSiniestroSelect(Sender: TObject);
begin
  CargarSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.CargarSiniestro(Siniestro, Orden, Recaida: Integer);
begin
  if (Siniestro = 0) or (Orden = 0) then
    Exit;

  with sdqSiniestro do
  begin
    Close;
    ParamByName('pSiniestro').AsInteger := Siniestro;
    ParamByName('pOrden').AsInteger     := Orden;
    ParamByName('pRecaida').AsInteger   := Recaida;
    Open;
  end;

  if sdqSiniestro.RecordCount = 0 then
  begin
    HabilitarBotones(False);
    MsgBox('No existe el siniestro buscado. Verifique los datos ingresados.', 0, 'Error de Búsqueda');
    sdqSiniestro.Close;
    tbLimpiarClick(self);
  end
  else begin
    SiniestroAct := Siniestro;
    OrdenAct     := Orden;
    RecaidaAct   := Recaida;
    IdExpediente := Get_IdExpediente(Siniestro, Orden, Recaida);
    with sdqBusqueda do
    begin
      Close;
      ParamByName('pSiniestro').AsInteger := Siniestro;
      ParamByName('pOrden').AsInteger     := Orden;
      ParamByName('pRecaida').AsInteger   := Recaida;
      Open;
    end;
    IdTrabajador := sdqBusquedaTJ_ID.AsInteger;
    iContrato    := sdqBusquedaEX_CONTRATO.AsInteger;

    chkPluriempleo.Checked := iif(sdqBusqueda.FieldByName('ex_pluriempleo').AsString = 'S', true, false);

    //comienzo a cargar los datos
    if fraEmpresa.Contrato <> sdqBusquedaEX_CONTRATO.AsInteger then
      fraEmpresa.Contrato := sdqBusquedaEX_CONTRATO.AsInteger;

    if fraTrabajadorSIN.mskTrabCUIL.Text <> sdqBusquedaTJ_CUIL.AsString then
      fraTrabajadorSIN.Cargar(sdqBusquedaTJ_CUIL.AsString);

    CargarFechaBaja(fraTrabajadorSIN.CUIL);

    edSinFecha.Date := sdqBusquedaEX_FECHAACCIDENTE.AsDateTime;
    if sdqBusquedaEX_ESTADO.AsString = '03' then //si esta cerrado, agrego la causa
      edEstado.Text := sdqBusquedaESTADO.AsString + '(' + sdqBusquedaEX_CAUSAFIN.AsString + ')'
    else
      edEstado.Text := sdqBusquedaESTADO.AsString;
    edDiagnostico.Text := sdqBusquedaEX_DIAGNOSTICO.AsString;
    edGTrabajo.Text    := sdqBusquedaGTRABAJO.AsString +
                          Get_UsuGestor(sdqBusquedaEX_ID.AsInteger, True);
    edDelegacion.Text  := sdqBusquedaDELEGACION.AsString;
    edTelEmpresa.Text  := sdqBusquedaMP_TELEFONOS.AsString;
    with fradireccion do
    begin
      cmbCalle.Text     := sdqBusquedaMP_CALLE.AsString;
      edNumero.Text     := sdqBusquedaMP_NUMERO.AsString;
      edPiso.Text       := sdqBusquedaMP_PISO.AsString;
      edDto.Text        := sdqBusquedaMP_DEPARTAMENTO.AsString;
      edCPostal.Text    := sdqBusquedaMP_CPOSTAL.AsString;
      edCPA.Text        := sdqBusquedaMP_CPOSTALA.AsString;
      cmbLocalidad.Text := sdqBusquedaMP_LOCALIDAD.AsString;
      edProvincia.Text  := sdqBusquedaDESCPROV.AsString;
    end;

    if SiniestroAct > 0 then
      HabilitarTituloConfidencial(Self, TimerConfidencial, sdqBusquedaEX_CUIT.AsString);
    CargarGrilla(SiniestroAct, OrdenAct);
    HabilitarBotones(True);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbRefrescarClick(Sender: TObject);
begin
  CargarSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  if not fraempresa.IsEmpty then
    LogAuditoria('REDPR',fraempresa.CUIT);

  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    dlgBusqSini.fraEmpresa.edContrato.Text          := fraEmpresa.edContrato.Text;
    dlgBusqSini.fraEmpresa.CUIT                     := fraEmpresa.CUIT;
    dlgBusqSini.fraEmpresa.cmbRSocial.Text          := fraEmpresa.cmbRSocial.Text;
    dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraTrabajadorSIN.mskTrabCUIL.Text;
    dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraTrabajadorSIN.dbcTrabNombre.Text;
    if (fraEmpresa.mskCUIT.Text <> '') or (fraTrabajadorSIN.mskTrabCUIL.Text <> '') then
      dlgBusqSini.tbBuscarClick(nil);

    if dlgBusqSini.ShowModal = mrOk then
    begin
      fraEmpresa.edContrato.Text          := dlgBusqSini.fraEmpresa.edContrato.Text;
      fraEmpresa.CUIT                     := dlgBusqSini.fraEmpresa.CUIT;
      fraEmpresa.cmbRSocial.Text          := dlgBusqSini.fraEmpresa.cmbRSocial.Text;
      fraTrabajadorSIN.mskTrabCUIL.Text   := dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text;
      fraTrabajadorSIN.dbcTrabNombre.Text := dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text;
      SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
      CargarSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
    end;
  finally
    dlgBusqSini.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.FormCreate(Sender: TObject);
begin
  inherited;
  fraTrabajadorSIN.OnChange := OnTrabajadorChange;
  fraEmpresa.OnChange       := OnEmpresaChange;
  fraEvento.OnChange        := OnFraEventoChange;
  HabilitarBotones(False);
  with fraFirmante do
  begin                                   
    TableName       := 'CFI_FIRMA';
    FieldID         := 'FI_ID';
    FieldCodigo     := 'FI_ID';
    FieldDesc       := 'FI_FIRMANTE';
    FieldBaja       := 'FI_FECHABAJA';
    ShowBajas       := True;
    OrderBy         := 'DESCRIPCION';
    ClearOnChange   := False;
  end;
  vclextra.LockControls(edFechaBaja, true);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.OnTrabajadorChange(Sender: TObject);
begin
  with fraTrabajadorSIN do
    if sdqTrabajador.Active then
    begin
      SinEdit.SetValues(sdqTrabajadorEX_SINIESTRO.AsInteger,
                        sdqTrabajadorEX_ORDEN.AsInteger,
                        sdqTrabajadorEX_RECAIDA.AsInteger);
      CargarSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
    end;
  CargarFechaBaja(fraTrabajadorSIN.CUIL);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.OnEmpresaChange(Sender: TObject);
begin
  fraTrabajadorSIN.CUIT := fraEmpresa.CUIT;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.SinEditSelect(Sender: TObject);
begin
  if (not ValidarSiniestroUsuarioTerce(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then   // por Plan Ioma - Tercerizadoras
  begin
    InfoHint(SinEdit, 'Usted no posee permisos para visualizar este siniestro.');
    tbLimpiarClick(nil);
  end
  else
  begin
    CargarSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);

    Do_Mensaje_AltaMedica;
    Do_Mensaje_PorcentIncap;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.CargarGrilla(Siniestro, Orden :Integer);
var
  sSql: String;
begin
  sSql :=
    'SELECT er_siniestro, er_orden, er_codigo, er_auditor, er_responsable, er_evento, ' +
          ' er_fechacontrol1, er_horacitacion1, er_firma, er_codubic, er_evolutivo, er_reca_evo, ' +
          ' em_descripcion descr_codigo, au_auditor, au_nombre, re_responsable, re_nombre, ' +
          ' ctb2.tb_descripcion descr_ubicacion, er_fechacontrol2, er_horacitacion2, ' +
          ' er_fecha, er_observaciones, em_segterreno, em_seguimiento, ' +
          ' er_conformealta, er_conformecese, em_automatico, em_imprimirsrt, ' +
          ' em_telegramatrab, em_altareca, em_fechaantalta, er_usualta, er_capint, ' +
          ' em_responsable, em_telegrecaprof, em_telegrecaprest, er_autorizacion, er_presupincapacidad, ' +
          ' er_chkaviso30dias, decode(er_capint, ''C'', ''Capital'', ''I'', ''Interior'', '''') capint ' +
     ' FROM ser_evemedrecalif, sin.sem_eventomedicoreca, ctb_tablas ctb2, ' +
          ' mau_auditores, mre_responsable' +
    ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
      ' AND er_orden = ' + SqlInt(Orden) +
      ' AND er_evento <> 0' +
      ' AND em_codigo(+) = er_codigo' +
      ' AND ctb2.tb_codigo(+) = er_codubic' +
      ' AND ctb2.tb_clave(+) = ''CUBIC''' +
      ' AND er_auditor = au_auditor(+)' +
      ' AND er_responsable = re_responsable(+)';

  if not(tbVerBajas.Down) then
    sSql := sSql + ' AND er_evento > 0 ';


  sSql := sSql + SortDialog.OrderBy;
  sdqDatos.SQL.Text := sSql;
  sdqDatos.Open;
  DoCargarRecaDictamen(Siniestro, Orden);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.MnuSegMedRecalificacion.Enabled := True;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraTrabajadorSIN.Limpiar;
  fradireccion.Limpiar;
  SinEdit.Clear;
  edSinFecha.Clear;
  edEstado.Clear;
  edDiagnostico.Clear;
  edGTrabajo.Clear;
  edDelegacion.Clear;
  edTelEmpresa.Clear;
  sdqDatos.Close;
  SinEdit.SetFocus;
  SiniestroAct := 0;
  OrdenAct     := 0;
  RecaidaAct   := 0;
  IdTrabajador := 0;
  iContrato    := 0; 
  HabilitarBotones(False);
  HabilitarTituloConfidencial(Self, TimerConfidencial, '');
  edFechaBaja.Clear;
  chkPluriempleo.Checked := false;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.HabilitarBotones(Habilita: Boolean);
begin
  tbNuevo.Enabled            := Habilita;
  tbModificar.Enabled        := Habilita;
  tbEliminar.Enabled         := Habilita;
  tbInfoRecaidas.Enabled     := Habilita;
  tbViajar.Enabled           := Habilita;
  tbTrabajador.Enabled       := Habilita;
  tbVerBajas.Enabled         := Habilita;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbEliminarClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and not(EsEventoAutomatico) then
    if MsgBox('¿Confirma la baja del evento?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      if (EliminarEvento(SiniestroAct, OrdenAct, sdqDatosER_EVENTO.AsInteger, sdqDatosER_CODIGO.AsString)) and
         (ActualizarFechaAltaMedica(SiniestroAct, OrdenAct, RecaidaAct, sdqDatosER_CODIGO.AsString)) and
         (ActualizarEstadoSegMedico(SiniestroAct, OrdenAct, sdqDatosER_EVENTO.AsInteger)) then
      begin
        CommitTrans;
        CargarSiniestro(SiniestroAct, OrdenAct, RecaidaAct);
        MsgBox('El evento se eliminó con éxito.',  MB_ICONEXCLAMATION, 'Eventos Médicos');
      end
      else
      begin
        Rollback;
        MsgBox('Error al intentar eliminar el evento',  MB_ICONERROR, 'Eventos Médicos');
      end;
    end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.EliminarEvento(Siniestro, Orden, Evento: Integer; CodEvento: String): Boolean;
var
  sSql, Recaida, NroParte, vEventoBorrado, vDiasR: String;
  vAltaMedica, vBajaMedica: TDateTime;
begin
  try
    Recaida := ValorSql('SELECT er_reca_evo' +
                         ' FROM ser_evemedrecalif' +
                        ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
                          ' AND er_orden = ' + SqlInt(Orden) +
                          ' AND er_evento = ' + SqlInt(Evento));

    if ExisteSql('SELECT 1 FROM ser_evemedrecalif' +
                 ' WHERE er_siniestro=' + SqlInt(Siniestro) +
                   ' AND er_orden = ' + SqlInt(Orden) +
                   ' AND er_evento = ' + SqlInt(Evento) +
                   ' AND er_evolutivo IS NOT NULL') then
    begin
      //observaciones en el parte evolutivo
      NroParte := ValorSql('SELECT er_evolutivo FROM ser_evemedrecalif' +
                           ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
                             ' AND er_orden= ' + SqlInt(Orden) +
                             ' AND er_evento= ' + SqlInt(Evento));
      sSql := 'UPDATE spv_parteevolutivo' +
                ' SET pv_observaciones= pv_observaciones || '' - Evento dado de baja'', ' +
                    ' pv_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                    ' pv_fechamodif = actualdate' +
              ' WHERE pv_siniestro = ' + SqlInt(Siniestro) +
                ' AND pv_orden = ' + SqlInt(Orden) +
                ' AND pv_recaida = ' + SqlInt(Recaida) +
                ' AND pv_nroparte = ' + SqlInt(NroParte);
      EjecutarSqlST(sSql);
    end;

    if ExisteSql('SELECT 1' +
                  ' FROM ser_evemedrecalif' +
                 ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
                   ' AND er_orden = ' + SqlInt(Orden) +
                   ' AND er_evento = ' + SqlInt(Evento) +
                   ' AND er_reca_evo IS NOT NULL') then
    begin
      if bEventoAltaReca then
      begin
        if not(ExisteSql('SELECT 1' +
                          ' FROM spe_parteegreso' +
                         ' WHERE pe_siniestro = ' + SqlInt(Siniestro) +
                           ' AND pe_orden = ' + SqlInt(Orden) +
                           ' AND pe_recaida = ' + SqlInt(Recaida))) then
          MsgBox('No se puede actualizar la fecha de alta en el Parte de Egreso porque este no existe.')
        else
        begin
          with GetQueryEx('SELECT pe_altamedica, pe_fechabajamedica' +
                           ' FROM spe_parteegreso' +
                          ' WHERE pe_siniestro = :sin ' +
                            ' AND pe_orden = :ord ' +
                            ' AND pe_recaida = :reca ', [Siniestro, Orden, Recaida]) do
          try
            vAltaMedica := FieldByName('pe_altamedica').AsDateTime;
            vBajaMedica := FieldByName('pe_fechabajamedica').AsDateTime;
            vDiasR := IntToStr(DaysBetween(vAltaMedica,vBajaMedica) + 1);
          finally
            Free;
          end;
          //baja en el parte de egreso
          sSql := 'UPDATE sin.spe_partedeegreso ' +
                    ' SET pe_recalificacion = ''S'', ' +
                        ' pe_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                        ' pe_fechamodif = ActualDate, ' +
                        ' pe_fechaaltalaboral = pe_fechaaltamedica, ' +
                        ' pe_fechareinicio = pe_fechaaltamedica+1, ' +
                        ' pe_diasbajatotales = ' + vDiasR +
                  ' WHERE pe_idexpediente = siniestro.get_idexpediente(' + SqlInt(Siniestro) + ',' +
                                                                           SqlInt(Orden) + ',' +
                                                                           SqlInt(Recaida) + ')';
          EjecutarSqlST(sSql);
        end;
      end;
    end;

    vEventoBorrado := IntToStr(GetEventoProximoBorrado(Siniestro,Orden));
    sSql := 'UPDATE ser_evemedrecalif' +
              ' SET er_evento= ' + SqlValue(vEventoBorrado) + ', ' +
                  ' er_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                  ' er_fechamodif = ActualDate' +
            ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
              ' AND er_orden = ' + SqlInt(Orden) +
              ' AND er_evento = ' + SqlInt(Evento);
    EjecutarSqlST(sSql);

    DoEnviarTelegrama;

    Result := True;
  except
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.GetEventoProximoBorrado(Siniestro, Orden: Integer): Integer;
var
  vEvento: Integer;
begin
  vEvento := ValorSql('SELECT MIN(er_evento)' +
                       ' FROM ser_evemedrecalif' +
                      ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
                        ' AND er_orden = ' + SqlInt(Orden)) - 1;
  if vEvento >= 0 then
    GetEventoProximoBorrado := -1
  else
    GetEventoProximoBorrado := vEvento;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ActualizarFechaAltaMedica(Siniestro, Orden, Recaida: Integer; CodEvento: String): Boolean;
var
  sSql :String;
  vAltaMedica  :TDateTime;
begin
  try
    if bEventoAltaReca then
    begin
      vAltaMedica := ValorSqlDateTime('SELECT art.sin.getaltamedica(' +
                                              SqlInt(Siniestro) + ', ' +
                                              SqlInt(Orden) + ' , ' +
                                              SqlInt(Recaida) + ') FROM dual');
      sSql := 'UPDATE sex_expedientes ' +
                ' SET ex_altamedica = TO_DATE(''' + DateFormat(vAltaMedica) + ''', ''DD/MM/YYYY'') ';

      if (vAltaMedica <> 0) then
        //si se carga un alta médica, hay que limpiar el causa fin que no tiene fecha fin
        //(son unos siniestros a los que se les puso por afuera una fecha de alta médica)
        sSql := sSql + ', ex_causafin = IIF_NULL(ex_FechaFin, Null, ex_CausaFin) ';

      sSql := sSql + ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
                       ' AND ex_orden = ' + SqlInt(Orden) +
                       ' AND ex_recaida = ' + SqlInt(Recaida);
      EjecutarSqlST(sSql);
    end;
    Result := True;
  except
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ActualizarEstadoSegMedico(Siniestro, Orden, Evento :Integer):boolean;
var
  sSql, vCodigo :String;
  vAuditor :Integer;
begin
  vAuditor := 0;
  try
    sSql := ' SELECT er_codigo, er_auditor ' +
              ' FROM ser_evemedrecalif ' +
             ' WHERE er_siniestro = :Sin ' +
               ' AND er_orden = :Ord ' +
               ' AND er_evento > 0 ' +
          ' ORDER BY er_codigo DESC, er_fecha DESC, er_evento DESC';
    with GetQueryEx(sSql, [Siniestro, Orden]) do
    try
      if not Eof then
      begin
        vCodigo   := FieldByName('er_codigo').AsString;
        vAuditor  := FieldByName('er_auditor').AsInteger;
      end;
    finally
      Free;
    end;

    if chkRecaDictamenABM.Enabled then
    begin
      sSql := ' UPDATE ser_evemedrecalif ' +
                 ' SET er_codigo = ' + SqlString(vCodigo, True, True) + ',' +
                     ' er_auditor = ' + SqlInt(vAuditor, True) + ',' +
                     ' er_recadictamen = ' + IIF(chkRecaDictamenABM.Checked, '''S''', '''N''') +
               ' WHERE er_evento = 0 ' +
                 ' AND er_siniestro = ' + SqlInt(Siniestro) +
                 ' AND er_orden = ' + SqlInt(Orden);
      EjecutarSqlST(sSql);
    end;

    Result := True;
  except
    Result := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.EsEventoAutomatico: Boolean;
begin
  Verificar((sdqDatos.FieldByName('em_automatico').AsString = 'S'), nil,
            'No se pueden editar o borrar los eventos generados automáticamente');
  Result := False;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbModificarClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and not(EsEventoAutomatico) then
  begin
    LimpiarFrameEventos(True, False);
    SinEditABM.SetValues(SiniestroAct, OrdenAct, RecaidaAct);
    fpEventos.Tag           := 1; //modificacion
    edSinFechaABM.Date      := sdqDatosER_FECHA.AsDateTime;
    fraEvento.Codigo        := sdqDatosER_CODIGO.AsString;
    EventoGeneraCartaDocTlg;
    EventoCitacionDoble;
    EsEventoAltaReca;
    fraProfesional.Value    := sdqDatosAU_AUDITOR.AsString;
    fraResponsable.Value    := sdqDatosRE_RESPONSABLE.AsString;
    fraFirmante.Value       := sdqDatosER_FIRMA.AsString;
    fraUbicacion.Value      := sdqDatosER_CODUBIC.AsString;
    DateCitacion.Date       := sdqDatosER_FECHACONTROL1.AsDateTime;
    edHora.Text             := sdqDatosER_HORACITACION1.AsString;
    DateCitacion2.Date      := sdqDatosER_FECHACONTROL2.AsDateTime;
    edHora2.Text            := sdqDatosER_HORACITACION2.AsString;
    edObservaciones.Text    := sdqDatosER_OBSERVACIONES.AsString;
    rbSiAlta.Checked        := (sdqDatosER_CONFORMEALTA.AsString = 'S');
    rbNoAlta.Checked        := (sdqDatosER_CONFORMEALTA.AsString = 'N');
    rbSiCese.Checked        := (sdqDatosER_CONFORMECESE.AsString = 'S');
    rbNoCese.Checked        := (sdqDatosER_CONFORMECESE.AsString = 'N');

    if sdqDatosER_CAPINT.AsString <> '' then
      if sdqDatosER_CAPINT.AsString = 'C' then
        rgCapInt.ItemIndex := 0
      else
        rgCapInt.ItemIndex := 1;
        
    Do_CargarPresupIncap;  // TK 31832
    fpEventos.Caption       := 'Modificación de Eventos';
    chkAviso30dias.Enabled  := (fpEventos.Tag = 1) and
                               (Seguridad.Activar(chkAviso30dias)) and
                               (fraEvento.Codigo = '086');
    fpEventos.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.LimpiarFrameEventos(MostrarBajas, Habilitar :Boolean);
begin
  fraEvento.Clear;
  fraProfesional.Clear;
  fraResponsable.Clear;
  fraFirmante.Clear;
  fraUbicacion.Limpiar;
  fraUbicacion.Clave  := 'CUBIC';
  DateCitacion.Date   := 0;
  DateCitacion2.Date  := 0;
  edSinFechaABM.Date  := 0;
  rbSiAlta.Checked    := False;
  rbNoAlta.Checked    := False;
  rbSiCese.Checked    := False;
  rbNoCese.Checked    := False;
  rbSiPresupIncap.Checked := False;
  rbNoPresupIncap.Checked := False;
  rbSiPresupIncap.Enabled := False;
  rbNoPresupIncap.Enabled := False;
  
  edHora.Clear;
  edHora2.Clear;
  edObservaciones.Clear;

  fraEvento.ShowBajas                  := MostrarBajas;
  fraProfesional.Propiedades.ShowBajas := MostrarBajas;
  fraResponsable.Propiedades.ShowBajas := MostrarBajas;
  fraUbicacion.ShowBajas               := MostrarBajas;

  fraFirmante.Sql := sqlFirmante +  ' AND at_area = ' +  SqlValue(AREA_RECA);
  if not MostrarBajas then
    fraFirmante.Sql := fraFirmante.Sql + ' AND fa_fechabaja IS NULL ' +
                                         ' AND fi_fechabaja IS NULL ' +
                                         ' AND at_fechabaja IS NULL ';

  edSinFechaABM.Enabled      := Habilitar;
  fraEvento.Enabled          := Habilitar;
  fraProfesional.Enabled     := Habilitar;
  fraResponsable.Enabled     := Habilitar;
  fraFirmante.Enabled        := Habilitar;
  fraUbicacion.Enabled       := Habilitar;
  DateCitacion.Enabled       := Habilitar;
  edHora.Enabled             := Habilitar;
  LockControls([DateCitacion2, edHora2], True);
  vclextra.LockControls([rgCapInt], true);
  rgCapInt.ItemIndex := -1;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.btnCancelarClick(Sender: TObject);
begin
  fpEventos.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.btnAceptarClick(Sender: TObject);
begin
  if not(fraEvento.IsEmpty) then EventoGeneraCartaDocTlg;
  if ValidarDatos then
  begin

    if (fpEventos.Tag=1) then //modificacion
    begin
      BeginTrans;
      if (ModificarEvento) and
         (ActualizarEstadoSegMedico(SinEditABM.Siniestro, SinEditABM.Orden, StrToInt(fraEvento.Codigo))) then
      begin
        CommitTrans;
        MsgBox('El Evento se modificó con éxito', MB_ICONEXCLAMATION, 'Eventos Médicos');
        CargarSiniestro(SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida);
        fpEventos.ModalResult := mrOk;
      end
      else begin
        Rollback;
        MsgBox('Error al intentar modificar el evento',  MB_ICONERROR, 'Eventos Médicos');
      end;
    end;

    if (fpEventos.Tag=0) then //alta
    begin
      BeginTrans;
      if (AltaEvento) and
         (ActualizarEstadoSegMedico(SinEditABM.Siniestro, SinEditABM.Orden, StrToInt(fraEvento.Codigo))) then  // Plan
      begin
        CommitTrans;
        MsgBox('El Evento se grabó con éxito', MB_ICONEXCLAMATION, 'Eventos Médicos');
        bEventoAgregado := True;
        EnviarMailDerivacion;
        LimpiarFrameEventos(False, True);
        if edSinFechaABM.Enabled then edSinFechaABM.SetFocus;
      end
      else begin
        Rollback;
        MsgBox('Error al intentar dar de alta el evento',  MB_ICONERROR, 'Eventos Médicos');
      end;

    end;

  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarDatos :boolean;
begin
  Result := (ValidarFecha and ValidarCodEvento and ValidarProfesional and
             ValidarResponsableYCarta and ValidarFirmante    and ValidarUbicacion and
             ValidarFechaControl      and ValidarHoraControl and Validar2FechaControl and
             Validar2HoraControl      and ValidarAltaCese    and ValidarResponsable and
             ValidarPresupIncap
             and (Verificar((fraEvento.sdqDatos.FieldByName('em_capint').AsString = 'S')
                        and(rgCapInt.ItemIndex = -1), rgCapInt, 'Debe indicar si es ''Capital'' o ''Interior'''))
             );      // TK 31832
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.EventoGeneraCartaDocTlg;
begin
  EsEventoCartaDoc  := (not(fraEvento.sdqDatos.FieldByName('em_codcartadoc').IsNull) and
                        (fraEvento.sdqDatos.FieldByName('em_altareca').AsString = 'N')) or
                       //si es un evento de divergencia en alta, se genera la carta solo si el sin.
                       //supera el año o sea que esta fuera del periodo de ILT
                       (not(fraEvento.sdqDatos.FieldByName('em_codcartadoc').IsNull) and
                        (fraEvento.sdqDatos.FieldByName('em_altareca').AsString = 'S') and
                        (edSinFecha.Date < DBDate - 365));
  EsEventoTelegrama := (fraEvento.sdqDatos.FieldByName('em_telegrama').AsString = 'S');
  EsEventoCitacion  := (fraEvento.sdqDatos.FieldByName('em_citacion').AsString = 'S');
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarFecha :Boolean;
var
  sSql :String;
  dMaxFecha :TDateTime;
begin
  Verificar(edSinFecha.Date > edSinFechaABM.Date,  edSinFechaABM, 'La Fecha del Evento no puede ser menor que la del accidente');
  Verificar((fraEvento.sdqDatos.FieldByName('em_notificacion').AsString <> 'S') and
            (edSinFechaABM.Date > DBDate), edSinFechaABM,
            'La Fecha del Evento, para este código de evento, no puede ser mayor que la actual');
  Verificar((fraEvento.sdqDatos.FieldByName('em_notificacion').AsString <> 'S') and
            (edSinFechaABM.Date > (DBDate + 30)), edSinFechaABM,
            'La Fecha del Evento, para este código de evento, no puede ser mayor que la actual + 30 días');
  Verificar((EsEventoCartaDoc or EsEventoTelegrama) and
            (fraEvento.sdqDatos.FieldByName('em_fechaantalta').AsString = 'N') and (edSinFechaABM.Date < DBDate),
            edSinFechaABM, 'La Fecha del Evento, para este código de evento, no puede ser menor que la fecha actual');
  if bEventoAltaReca then
  begin
    sSql := 'SELECT art.dinerarias.get_maxfechahastaliqilt(' +
                    SqlInt(SinEditABM.Siniestro) + ',' +
                    SqlInt(SinEditABM.Orden) + ',' +
                    SqlInt(SinEditABM.Recaida) + ') FROM dual';
    dMaxFecha := ValorSqlDateTime(sSql);
    Verificar(dMaxFecha > edSinFechaABM.Date, edSinFechaABM,
              'La Fecha Mínima del Evento, para este siniestro y código de evento es ' +  DateToStr(dMaxFecha));
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarCodEvento :Boolean;
var
  sSql :String;
begin
  Verificar(fraEvento.IsEmpty, fraEvento, 'Debe seleccionar un evento.');
  Verificar((fraEvento.sdqDatos.FieldByName('em_automatico').AsString = 'S'), fraEvento,
            'El evento es de carga automática.');
  if (fraEvento.sdqDatos.FieldByName('em_seguimiento').AsString = 'S') and
     (fpEventos.Tag=0) then //si es un alta
  begin
    sSql := ' SELECT 1 FROM ser_evemedrecalif, sin.sem_eventomedicoreca ' +
             ' WHERE er_siniestro = ' + SinEditABM.SiniestroSql +
               ' AND er_orden = ' + SinEditABM.OrdenSql +
               ' AND er_evento > 0 ' +
               ' AND er_codigo = em_codigo ' +
               ' AND em_reubicacion = ''S'' ';
    if ExisteSql(sSql) then
      Result := True
    else begin
      MsgBox('No puede generar eventos de seguimiento cuando no existe un evento ' + #13 +
             'de reubicación y/o reasignación de tareas transitorias (evento 100)',  MB_ICONEXCLAMATION, 'Error');
      Result := False;
    end;
  end
  else if not(fraEvento.sdqDatos.FieldByName('em_eventoanterior').IsNull) and
         (fpEventos.Tag = 0) then //si es un alta
  begin
    sSql := ' SELECT 1 FROM ser_evemedrecalif ' +
             ' WHERE er_siniestro = ' + SinEditABM.SiniestroSql +
               ' AND er_orden = ' + SinEditABM.OrdenSql +
               ' AND er_evento > 0 ' +
               ' AND er_codigo = ' + SqlValue(fraEvento.sdqDatos.FieldByName('em_eventoanterior').AsString);
    if ExisteSql(sSql) then
      Result := True
    else begin
      MsgBox('Para generar este evento, antes debe cargarse un evento ' +
              fraEvento.sdqDatos.FieldByName('em_eventoanterior').AsString, MB_ICONEXCLAMATION, 'Error');
      Result := False;
    end;
  end
  else Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarProfesional :Boolean;
begin
  Verificar(fraProfesional.IsEmpty and
            (fraEvento.sdqDatos.FieldByName('em_profesional').AsString = 'S'),
            fraProfesional, 'El código de profesional es obligatorio para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarFirmante :Boolean;
begin
  Verificar(EsEventoCartaDoc and fraFirmante.IsEmpty, fraFirmante,
            'El Firmante es obligatorio para este código de evento');
  Verificar(not(EsEventoCartaDoc) and not(fraFirmante.IsEmpty), fraFirmante,
            'No debe ingresar el firmante para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarResponsableYCarta :Boolean;
begin
  Verificar(fraResponsable.IsEmpty and
            (EsEventoCartaDoc or EsEventoTelegrama or (fraEvento.sdqDatos.FieldByName('em_telegramatrab').AsString = 'S')) and
            (fraEvento.sdqDatos.FieldByName('em_responsable').AsString = 'S'),
            fraResponsable, 'El Responsable es obligatorio para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarResponsable: Boolean;
begin
  Verificar((fraResponsable.IsEmpty) and (fraEvento.sdqDatos.FieldByName('em_responsable').AsString = 'S'),
            fraResponsable,'El Responsable es obligatorio para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarUbicacion :Boolean;
var
  sSql :String;
begin
  if EsEventoCitacion and not(fraEvento.IsEmpty) and fraUbicacion.IsEmpty then
  begin
    MsgBox('El código de ubicación es obligatorio para este código de evento', MB_ICONEXCLAMATION, 'Error');
    ValidarUbicacion := False;
  end
  else begin
    if fraUbicacion.IsEmpty then
      ValidarUbicacion := True
    else begin
      sSql := ' SELECT count(*) FROM ctb_tablas ' +
               ' WHERE tb_clave = ''CUBIC'' ' +
                 ' AND tb_codigo = ' + SqlValue(fraUbicacion.Codigo);
      ValidarUbicacion := (ValorSql(sSql) > 0);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarFechaControl :Boolean;
begin
  if EsEventoCitacion then
  begin
    Verificar(DateCitacion.IsEmpty, DateCitacion,
              'La fecha de citación es obligatoria para este código de evento');
    Verificar((DateCitacion.Date < DBDate), DateCitacion,
              'La fecha de citación no puede ser menor que la fecha actual');
  end
  else Verificar(not(DateCitacion.IsEmpty), DateCitacion,
                'No debe ingresar la fecha de citación para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarHoraControl :Boolean;
begin
  if (edHora.Text <> '  :  ' ) then
  begin
    Verificar(not(IsTime(edHora.Text)), edHora, 'La Hora de citación ingresada es inválida');
    Verificar(DateCitacion.IsEmpty, DateCitacion,
              'No puede ingresar la Hora de citación si no ingresó la fecha de citación');
  end
  else Verificar(EsEventoCitacion, edHora,
                 'La Hora de citación es obligatoria para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ModificarEvento :Boolean;
var
  sSql, vObserva :String;
  vGenera, bGuardaPresupIncap :Boolean;
begin
  vGenera := False;
  bGuardaPresupIncap := bEventoAltaReca and EsSiniestro_EnAnioAltaMedica;

  try
    if EsEventoTelegrama and ModificoEventoATelegrama then
    begin
      vGenera := True;
      if not(ExisteDireccionTrabajador(1)) then
      begin
        ModificarEvento := False;
        Exit;
      end;
    end;
    sSql := 'UPDATE ser_evemedrecalif ' +
              ' SET er_codigo = ' + SqlValue(fraEvento.Codigo) + ', ' +
                  ' er_fecha = TO_DATE(''' + IIF(edSinFechaABM.Date=0,'', edSinFechaABM.Text) + ''', ''DD/MM/YYYY''), ' +
                  ' er_auditor = ' + SqlValue(fraProfesional.Codigo) + ', ' +
                  ' er_responsable = ' + SqlValue(fraResponsable.Codigo) + ', ' +
                  ' er_firma = ' + SqlValue(fraFirmante.Codigo) + ', ' +
                  ' er_codubic = ' + SqlValue(fraUbicacion.Codigo) + ', ' +
                  ' er_fechacontrol1 = TO_DATE(''' + IIF(DateCitacion.Date=0, '', DateCitacion.Text) + ''', ''DD/MM/YYYY''), ' +
                  ' er_horacitacion1 = ''' + IIF(edHora.Text='  :  ','',edHora.Text) + ''', ' +
                  ' er_fechacontrol2 = TO_DATE(''' + IIF(DateCitacion2.Date=0, '', DateCitacion2.Text) + ''', ''DD/MM/YYYY''), ' +
                  ' er_horacitacion2 = ''' + IIF(edHora2.Text='  :  ','',edHora2.Text) + ''', ' +
                  ' er_observaciones = ' + SqlValue(edObservaciones.Text) + ', ' +
                  ' er_fechamodif = actualdate, ' +
                  IIF(bGuardaPresupIncap,' er_presupincapacidad = ' + IIF(rbSiPresupIncap.Checked, '''S''', '''N''') + ', ', '') +
                  ' er_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                  ' er_capint = ' + iif(rgCapInt.ItemIndex <> -1, (iif(rgCapInt.ItemIndex = 0, SqlValue('C'), SqlValue('I'))), SqlValue('')) + ', ' +
                  ' er_chkaviso30dias = ' + IIF(chkAviso30dias.Checked, '''S''', '''N''') +
            ' WHERE er_siniestro = ' + SqlInt(SinEditABM.Siniestro) +
              ' AND er_orden= ' + SqlInt(SinEditABM.Orden) +
              ' AND er_evento = ' + SqlInt(sdqDatosER_EVENTO.AsInteger);
    EjecutarSqlST(sSql);

    vObserva := DoArmarObservaciones(fraEvento.Descripcion);
    sSql := 'UPDATE spv_parteevolutivo ' +
              ' SET pv_observaciones = ' + SqlValue(vObserva) + ',' +
                  ' pv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pv_fechamodif = actualdate ' +
            ' WHERE pv_siniestro = ' + SqlInt(SinEditABM.Siniestro) +
              ' AND pv_orden = ' + SqlInt(SinEditABM.Orden) +
              ' AND pv_recaida = ' + SqlInt(SinEditABM.Recaida) +
              ' AND pv_nroparte = ' + SqlInt(sdqDatosER_EVOLUTIVO.AsInteger);
    EjecutarSqlST(sSql);

    ModificarEvento := True;
    if vGenera then
      GenerarTelegrama(SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida);

    if bGuardaPresupIncap then              // TK 31832
      Do_GuardarPresupIncap_EnParteEgreso;

  except
    ModificarEvento := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.AltaEvento :Boolean;
var
  Sql :TSql;
  vCancelar, bInsertaParte, bCancelo, autoriza :Boolean;
  sSql, vDescri, vUbic, vResponsable, vObserva :String;
  vFechaCitacion, vMensaje, vDiasBaja, vFechaReinicio, sqlAux :String;
  vTipoSalida, vEventoNuevo, vEvo, vPresta, vSiniestro, vOrden, vReca :Integer;
  vFechaControl, vMaxFechaHastaLiq, vFechaBaja :TDateTime;
begin
  vSiniestro  := SinEditABM.Siniestro;
  vOrden      := SinEditABM.Orden;
  AltaEvento  := False;

  try
    if EsEventoTelegrama or EsEventoCartaDoc then
    begin
      vTipoSalida := IIF(EsEventoTelegrama,1,0);
      if not(ExisteDireccionTrabajador(vTipoSalida)) then Exit;
    end;

    if (GenerarEventoMedico_0) then
    begin
      bInsertaParte := (fraEvento.sdqDatos.FieldByName('em_parteevolutivo').AsString = 'S');
      vReca         := ValorSqlEx('SELECT art.sin.get_recaida_recalificacion(:Sini, :Ord) ' +
                                   ' FROM dual', [vSiniestro, vOrden]);
      vEventoNuevo  := GetProximoEvento(vSiniestro,vOrden);
      vDescri       := fraEvento.Descripcion;

      Sql := TSql.Create;
      try
        Sql.TableName := 'SER_EVEMEDRECALIF';
        Sql.Fields.Add('ER_SINIESTRO',vSiniestro);
        Sql.Fields.Add('ER_ORDEN',vOrden);
        Sql.Fields.Add('ER_CODIGO',fraEvento.Codigo);
        Sql.Fields.Add('ER_EVENTO', IntToStr(vEventoNuevo));
        if edSinFechaABM.Date > 0 then
          Sql.Fields.Add('ER_FECHA', edSinFechaABM.SqlText,False);
        Sql.Fields.Add('ER_AUDITOR',fraProfesional.Codigo);
        Sql.Fields.Add('ER_RESPONSABLE',fraResponsable.Codigo);
        Sql.Fields.Add('ER_FIRMA',fraFirmante.Codigo);
        Sql.Fields.Add('ER_CODUBIC',fraUbicacion.Codigo);
        if DateCitacion.Date > 0 then
          Sql.Fields.Add('ER_FECHACONTROL1','TO_DATE(''' + DateCitacion.Text + ''', ''DD/MM/YYYY'')',False);
        if edHora.Text <> '  :  ' then
          Sql.Fields.Add('ER_HORACITACION1', edHora.Text);
        if DateCitacion2.Date > 0 then
          Sql.Fields.Add('ER_FECHACONTROL2','TO_DATE(''' + DateCitacion2.Text + ''', ''DD/MM/YYYY'')',False);
        if edHora2.Text <> '  :  ' then
          Sql.Fields.Add('ER_HORACITACION2', edHora2.Text);
        Sql.Fields.Add('ER_OBSERVACIONES',edObservaciones.Text);
        Sql.Fields.Add('ER_FECHAALTA','ACTUALDATE',False);
        Sql.Fields.Add('ER_USUALTA',Sesion.UserID);
        Sql.Fields.Add('ER_CHKAVISO30DIAS', String(IIF(chkAviso30dias.Checked, 'S', 'N')));     // TK 49669

        if bEventoAltaReca or bInsertaParte then
          Sql.Fields.Add('ER_RECA_EVO', SqlInt(vReca));
        if bEventoCese then
        begin
          Sql.Fields.Add('ER_CONFORMEALTA', String(IIF(rbSiAlta.Checked, 'S', 'N')));
          Sql.Fields.Add('ER_CONFORMECESE', String(IIF(rbSiCese.Checked, 'S', 'N')));
        end;
        if bEventoAltaReca and EsSiniestro_EnAnioAltaMedica then    // TK 31832
        begin
          Sql.Fields.Add('ER_PRESUPINCAPACIDAD', String(IIF(rbSiPresupIncap.Checked, 'S', 'N')));
          Do_GuardarPresupIncap_EnParteEgreso;
        end;
        if rgCapInt.ItemIndex <> -1 then
          Sql.Fields.Add('ER_CAPINT', String(IIF(rgCapInt.ItemIndex = 0, 'C', 'I')));

        EjecutarSQLST(Sql.InsertSql);
      finally
        Sql.Free;
      end;
//-------------------------------------------------------------------------------------------------------------------
      //inserta parte evolutivo
      if bInsertaParte then
      begin
        vEvo := ValorSql('SELECT NVL(MAX(pv_nroparte),0) FROM spv_parteevolutivo ' +
                         ' WHERE pv_siniestro=' + SqlInt(vSiniestro) +
                           ' AND pv_orden=' + SqlInt(vOrden) +
                           ' AND pv_recaida=' + SqlInt(vReca)) + 1;
        vUbic := ValorSql('SELECT tb_descripcion FROM ctb_tablas ' +
                          ' WHERE tb_clave=''CUBIC'' ' +
                            ' AND tb_codigo=' + SqlValue(fraUbicacion.Codigo));
        vResponsable := ValorSql('SELECT substr(re_nombre,1,30) FROM mre_responsable ' +
                                 ' WHERE re_responsable=' + SqlValue(fraResponsable.Codigo));
        vPresta := ValorSql('SELECT ca_identificador FROM cpr_prestador ' +
                            ' WHERE ca_clave= ' + SqlValue(ART_CUIT) +
                              ' AND ca_descripcion like ''%RECALI%''');
        if edSinFechaABM.Date > 0 then
        begin
          vFechaControl := edSinFechaABM.Date;
          if (vFechaControl > DBDate) and
             (fraEvento.sdqDatos.FieldByName('em_notificacion').AsString <> 'S') then vFechaControl := DBDate;
        end
        else vFechaControl := 0;
        vFechaCitacion := DateCitacion.Text;

        vObserva := DoArmarObservaciones(vDescri);

        sSql := ' INSERT INTO spv_parteevolutivo ' +
                '(pv_siniestro, pv_orden, pv_recaida, pv_nroparte, pv_observaciones, ' +
                ' pv_fechacontrol, pv_medico, pv_fecharecepcion, pv_usualta, ' +
                ' pv_fechaalta, pv_auditor, pv_tipoparte, pv_operprog, pv_evip, ' +
                ' pv_identifprestador, pv_fechacarga) VALUES ( ' +
                  SqlInt(vSiniestro) + ',' + SqlInt(vOrden) + ',' + SqlInt(vReca) + ',' +
                  IntToStr(vEvo) + ',' + SqlValue(vObserva) + ',' +
                  ' TO_DATE(''' + DateFormat(vFechaControl) + ''', ''DD/MM/YYYY'') ,' +
                  SqlValue(fraResponsable.Descripcion)  + ', ActualDate, ' +
                  SqlValue(Sesion.UserID) + ', ActualDate, ' +
                  SqlValue(fraProfesional.Codigo) + ', ''R'', ''N'', ''N'', ' +
                  IntToStr(vPresta) + ', SysDate) ';
        EjecutarSqlST(sSql);

        sSql := ' UPDATE ser_evemedrecalif ' +
                   ' SET er_evolutivo=' + IntToStr(vEvo) +
                 ' WHERE er_siniestro=' + SqlInt(vSiniestro) +
                   ' AND er_orden=' + SqlInt(vOrden) +
                   ' AND er_evento=' + IntToStr(vEventoNuevo);
        EjecutarSqlST(sSql);
      end;
//-------------------------------------------------------------------------------------------------------------------
      //update en Parte Egreso
      if bEventoAltaReca then
      begin
        vMaxFechaHastaLiq := GetMaxFechaHastaLiquidacionILTB(vSiniestro, vOrden, vReca);
        if (edSinFechaABM.Date < vMaxFechaHastaLiq) then
        begin
          MsgBox('La Fecha de egreso no puede ser menor que la máxima fecha hasta de liquidación de ILT: '+
                 DateToStr(vMaxFechaHastaLiq) + '', MB_ICONERROR, 'Error');
          Exit;
        end;
        vCancelar := True;
        if (vReca = -1) then vMensaje := 'No existe parte de egreso'
        else if (vReca = -2) then vMensaje := 'Existen varios partes de egreso'
        else vCancelar := False;
        if vCancelar then
        begin
          MsgBox(vMensaje, MB_ICONERROR, 'Error');
          Exit;
        end
        else begin
          if ExisteSql('SELECT 1 FROM spe_parteegreso ' +
                       ' WHERE pe_siniestro=' + SqlInt(vSiniestro) +
                         ' AND pe_orden=' + SqlInt(vOrden) +
                         ' AND pe_recaida='+ SqlInt(vReca) ) then
          begin
            if edSinFechaABM.Date < ValorSqlDateTime(' SELECT pe_altamedica FROM spe_parteegreso ' +
                                                      ' WHERE pe_siniestro= ' + SqlInt(vSiniestro) +
                                                        ' AND pe_orden=' + SqlInt(vOrden) +
                                                        ' AND pe_recaida=' + SqlInt(vReca)) then
            begin
              MsgBox('La Fecha del evento no puede ser menor que la fecha de alta médica', MB_ICONERROR, 'Error');
              Exit;
            end;
            vFechaBaja := ValorSqlDateTime(' SELECT pe_fechabajamedica FROM spe_parteegreso ' +
                                            ' WHERE pe_siniestro=' + SqlInt(vSiniestro) +
                                              ' AND pe_orden=' + SqlInt(vOrden) +
                                              ' AND pe_recaida= ' + SqlInt(vReca));
            vFechaReinicio :=  DateToStr(edSinFechaABM.Date + 1);
            vDiasBaja := IntToStr(DaysBetween(edSinFechaABM.Date,vFechaBaja) + 1);
            sSql := ' UPDATE sin.spe_partedeegreso ' +
                       ' SET pe_observaciones=''' + vDescri + ' - ' + edObservaciones.Text + ' - '' || pe_observaciones, ' +
                           ' pe_fechaaltalaboral=TO_DATE(''' + IIF(edSinFechaABM.Date=0,'', edSinFechaABM.Text) + ''', ''DD/MM/YYYY''), ' +
                           ' pe_fechareinicio=TO_DATE(''' + IIF(edSinFechaABM.Date=0,'', vFechaReinicio) + ''', ''DD/MM/YYYY''), ' +
                           ' pe_diasbajatotales=' + vDiasBaja + ',' +
                           ' pe_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                           ' pe_fechamodif=actualdate, ' +
                           ' PE_IDTIPODEEGRESO = 2 ' +  //Fin de tratamiento
                     ' WHERE pe_idexpediente = siniestro.get_idexpediente(' + SqlInt(vSiniestro) + ',' +
                                                                              SqlInt(vOrden) + ',' +
                                                                              SqlInt(vReca) + ')';
            EjecutarSqlST(sSql);
          end
          else begin
            MsgBox ('No se pueden actualizar las observaciones del parte de egreso porque éste no existe', MB_ICONERROR, 'Error');
            Exit;
          end;
        end;
        if bEventoCese then DoSeguimientoCese(vSiniestro, vOrden, vReca, vEventoNuevo);
      end;
//-------------------------------------------------------------------------------------------------------------------
      ActualizarFechaAltaMedica(vSiniestro, vOrden, vReca, fraEvento.Codigo);
      if EsEventoCartaDoc then
        DoInsertarCartaDoc(vSiniestro, vOrden, vReca, vEventoNuevo);

      if EsEventoTelegrama then
        GenerarTelegrama(vSiniestro, vOrden, vReca);

      bCancelo := False;
      autoriza := false;

      if (fraEvento.sdqDatos.FieldByName('em_generaautorizacion').AsString = 'S') then
      begin

        autoriza := ExisteSqlEx(' SELECT em_codigo ' +
                                '   FROM art.mpr_prestaciones, SIN.sem_eventomedicoreca ' +
                                '  WHERE em_prestacionaut = pr_codigo ' +
                                 '   AND ((pr_curso = ''S'') OR (pr_herramientas = ''S'')) ' +
                                 '   AND em_codigo = :cod ', [fraEvento.Codigo]);

        if autoriza = false then
        begin
          if ValorSqlEx(' select re_generaautorizacion from art.mre_responsable ' +
                                 ' where re_responsable = :resp ' +
                                   ' and re_fecbaja is null ', [fraResponsable.Codigo]) = 'S' then
          begin
            if ValorSqlEx('select re_generaaut_unica from art.mre_responsable ' +         // TK 55242
                          ' where re_responsable = :resp ' +
                            ' and re_fecbaja is null ', [fraResponsable.Codigo]) = 'N'  then     // arreglo del tk 55242 
                sqlAux := ' and er_codigo = ' + sqlValue(fraEvento.Codigo)
            else
                sqlAux := '';

            if ValorSqlEx(' select er_autorizacion from ser_evemedrecalif where er_siniestro = :sin and er_orden = :ord and er_autorizacion is not null ' +
                          sqlAux, [sinedit.SiniestroS, sinedit.OrdenS]) = '' then   // no hay autorizaciones automáticas generadas anteriormente
                autoriza := true;
          end;
        end

        else  //autoriza = true
          if (fpDatosAutorizacion.ShowModal = mrOk) then
            autoriza := true
          else
          begin
            bCancelo := True;
            autoriza := false;
          end;

      end;

      if autoriza then
        DoGeneraAutorizacion(vSiniestro, vOrden, vReca, vEventoNuevo);

      if not bCancelo then
      begin
        DoDestinoPapel(vReca, vEventoNuevo);
        DoGeneraTelegRecaProf_O_Prest; // Lu TK 10911 y 12659
        AltaEvento := True;
      end
      else
        AltaEvento := False;
    end; // del if GenerarEventoMedico_0

  except
    AltaEvento := False;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ModificoEventoATelegrama: Boolean;
//devuelve verdadero si al editar un evento, el nuevo código debe generar telegrama
var
  sSql, CodigoAnterior, CodigoNuevo :String;
begin
  sSql := ' SELECT er_codigo FROM ser_evemedrecalif ' +
           ' WHERE er_siniestro= ' + SqlInt(SinEditABM.Siniestro) +
             ' AND er_orden= ' + SqlInt(SinEditABM.Orden) +
             ' AND er_evento= ' + SqlInt(sdqDatosER_CODIGO.AsInteger);
  CodigoAnterior  := ValorSQL(sSql);
  CodigoNuevo     := fraEvento.Codigo;

  if CodigoAnterior = CodigoNuevo then
    ModificoEventoATelegrama := False
  else
    if EsEventoTelegrama and (CodigoNuevo <> '') then
      ModificoEventoATelegrama := True
    else
      ModificoEventoATelegrama := False;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ExisteDireccionTrabajador(TipoSalida :Integer): Boolean;
var
  sSql, vNombreTrab, vSalida :String;
  vExiste :Boolean;
begin
  sSql := ' SELECT tj_nombre, utiles.armar_domicilio (tj_calle, tj_numero, tj_piso, ' +
                                                    ' tj_departamento, tj_localidad) domicilio ' +
            ' FROM ctj_trabajador, sex_expedientes ' +
           ' WHERE ex_idtrabajador = tj_id ' +
             ' AND ex_siniestro = :sin ' +
             ' AND ex_orden = :ord ' +
             ' AND ex_recaida = :reca ';
  with GetQueryEx(sSql, [SinEditABM.Siniestro, SinEditABM.Orden, SinEditABM.Recaida]) do
  try
    vExiste := (FieldByName('domicilio').AsString <> '');
    vNombreTrab := FieldByName('tj_nombre').AsString;
  finally
    Free;
  end;
  if not vExiste then
  begin
    vSalida := IIF(TipoSalida=0,'la carta','el telegrama');
    MsgBox('No se puede generar ' + vSalida + ' pues faltan datos ' + #13 +
           'del domicilio del trabajador "' + vNombreTrab + '"', MB_ICONEXCLAMATION, 'Error');
    Result := False;
  end
  else Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.GenerarTelegrama(Siniestro, Orden, Recaida: Integer);
var
  Sql :TSql;
  bEsEmpresaConfidencial :Boolean;
  sCalleTrabajador, sNumeroTrabajador, sPisoTrabajador, sDepartamentoTrabajador :String;
  sLocTrabajador, sCPostalTrabajador, sProvTrabajador, sSql :String;
  sFirmante, sFirmante2, sTexto, sNombreTrabajador, sFormato :String;
begin
  try
    sSql := 'SELECT tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                  ' tj_localidad, tj_cpostal, tj_provincia, mp_calle, mp_numero, ' +
                  ' mp_piso, mp_departamento, mp_localidad, mp_cpostal, mp_provincia, ' +
                  ' afiliacion.isempresaconfidencial(ex_cuit) esempresaconfidencial ' +
             ' FROM ctj_trabajador, cmp_empresas, sex_expedientes ' +
            ' WHERE ex_siniestro = :sin ' +
              ' AND ex_orden = :ord ' +
              ' AND ex_recaida = :reca ' +
              ' AND ex_cuit = mp_cuit ' +
              ' AND ex_idtrabajador = tj_id';
    with GetQueryEx(sSql, [Siniestro, Orden, Recaida]) do
    try
      bEsEmpresaConfidencial  := (FieldByName('esempresaconfidencial').AsString = 'S');
      sNombreTrabajador       := FieldByName('tj_nombre').AsString;
      if bEsEmpresaConfidencial then  // si el trabajador pertenece a una empresa condifencial, entonces solo se manda el telegrama a la dirección de la empresa
      begin
        sCalleTrabajador        := FieldByName('mp_calle').AsString;
        sNumeroTrabajador       := FieldByName('mp_numero').AsString;
        sPisoTrabajador         := FieldByName('mp_piso').AsString;
        sDepartamentoTrabajador := FieldByName('mp_departamento').AsString;
        sLocTrabajador          := FieldByName('mp_localidad').AsString;
        sCPostalTrabajador      := FieldByName('mp_cpostal').AsString;
        sProvTrabajador         := FieldByName('mp_provincia').AsString;
      end
      else begin
        sCalleTrabajador        := FieldByName('tj_calle').AsString;
        sNumeroTrabajador       := FieldByName('tj_numero').AsString;
        sPisoTrabajador         := FieldByName('tj_piso').AsString;
        sDepartamentoTrabajador := FieldByName('tj_departamento').AsString;
        sLocTrabajador          := FieldByName('tj_localidad').AsString;
        sCPostalTrabajador      := FieldByName('tj_cpostal').AsString;
        sProvTrabajador         := FieldByName('tj_provincia').AsString;
      end;
    finally
      Free;
    end;

    sFirmante   := Sesion.Usuario;
    sFirmante2  := ART_NOMBRE;

    sFormato    := ValorSqlEx('SELECT ft_codigo FROM ART.tft_formatotelegrama, SIN.sem_eventomedicoreca ' +
                              ' WHERE ft_id = em_idtelegrama ' +
                                ' AND em_codigo = :codEvento ', [fraEvento.Codigo]);

    sTexto      := ValorSqlEx('SELECT ft_texto FROM ART.tft_formatotelegrama, SIN.sem_eventomedicoreca ' +
                              ' WHERE ft_id = em_idtelegrama ' +
                                ' AND em_codigo = :codEvento ', [fraEvento.Codigo]);

  //  sTexto      := ValorSql('select ft_texto from ART.tft_formatotelegrama where ft_codigo = ''TE15'' ');

    sTexto      := StringReplace(sTexto,'@FECHA', DateCitacion.Text,[rfReplaceAll, rfIgnoreCase]);
    sTexto      := StringReplace(sTexto,'@HORA', edHora.Text,[rfReplaceAll, rfIgnoreCase]);
    sTexto      := StringReplace(sTexto,'@DOMICILIO', fraUbicacion.Descripcion,[rfReplaceAll, rfIgnoreCase]);
    sTexto      := StringReplace(sTexto,'@PROFESIONAL', IIF(fraEvento.sdqDatos.FieldByName('em_responsable').AsString = 'S',
                                                            fraResponsable.Descripcion, fraProfesional.Descripcion), [rfReplaceAll, rfIgnoreCase]);
    if (fraEvento.sdqDatos.FieldByName('em_telegrama').AsString = 'S') and
       (fraEvento.sdqDatos.FieldByName('em_citacion').AsString = 'S') and
       (Trim(edObservaciones.Lines.Text) <> '') then
      sTexto := sTexto + UpperCase(edObservaciones.Lines.Text);

    Sql := TSQL.Create;
    try
      Sql.TableName:='TLG_TELEGRAMAS';
      Sql.Fields.Add('LG_SINIESTRO',Siniestro);
      Sql.Fields.Add('LG_ORDEN',Orden);
      Sql.Fields.Add('LG_RECAIDA',Recaida);
      Sql.Fields.Add('LG_DESTINATARIO',sNombreTrabajador);
      Sql.Fields.Add('LG_CALLE',sCalleTrabajador);
      Sql.Fields.Add('LG_NUMERO',sNumeroTrabajador);
      Sql.Fields.Add('LG_PISO',sPisoTrabajador);
      Sql.Fields.Add('LG_DEPARTAMENTO',sDepartamentoTrabajador);
      Sql.Fields.Add('LG_LOCALIDAD',sLocTrabajador);
      Sql.Fields.Add('LG_CPOSTAL',sCPostalTrabajador);
      Sql.Fields.Add('LG_PROVINCIA',sProvTrabajador);
      Sql.Fields.Add('LG_FIRMANTE',sFirmante);
      Sql.Fields.Add('LG_FIRMANTE2',sFirmante2);
      Sql.Fields.Add('LG_FECHAALTA','ACTUALDATE',False);
      Sql.Fields.Add('LG_TEXTO',sTexto);
      Sql.Fields.Add('LG_FORMATO',sFormato);

      EjecutarSQLST(Sql.InsertSql);
    Finally
      Sql.Free;
    end;

  except
    Raise;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbNuevoClick(Sender: TObject);
begin
  if sdqBusqueda.Active and (SiniestroAct > 0)  then
  begin
    LimpiarFrameEventos(False, True);
    SinEditABM.SetValues(SiniestroAct, OrdenAct, RecaidaAct);
    fpEventos.Caption := 'Carga de Eventos';
    fpEventos.Tag := 0; //alta
    fpEventos.ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.GenerarEventoMedico_0 :Boolean;
var
  Sql :TSql;
  sSql :String;
begin
  sSql := ' SELECT count(*) FROM ser_evemedrecalif ' +
           ' WHERE er_siniestro= ' + SinEditABM.SiniestroS +
             ' AND er_orden= ' + SinEditABM.OrdenS;
  if ValorSql(sSql) = 0 then
  begin
    Sql := TSql.Create;
    try
      Sql.TableName:='SER_EVEMEDRECALIF';
      Sql.Fields.Add('ER_SINIESTRO',SinEditABM.SiniestroS);
      Sql.Fields.Add('ER_ORDEN',SinEditABM.OrdenS);
      Sql.Fields.Add('ER_EVENTO',0);
      Sql.Fields.Add('ER_OBSERVACIONES','Estado del Seguimiento Médico (no visible en grilla)');
      Sql.Fields.Add('ER_FECHAALTA','ACTUALDATE',False);
      Sql.Fields.Add('ER_USUALTA',Sesion.UserID);
      EjecutarSQLST(Sql.InsertSql);
    finally
      Sql.Free;
    end;
  end;
  GenerarEventoMedico_0 := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.GetProximoEvento(Siniestro, Orden :Integer) :Integer;
var
  sSql :String;
  vEvento :Integer;
begin
  sSql := ' SELECT MAX(er_evento) FROM ser_evemedrecalif ' +
           ' WHERE er_siniestro= ' + SqlInt(Siniestro) +
             ' AND er_orden= ' + SqlInt(Orden);
  vEvento := ValorSql(sSql) + 1;
  if vEvento < 0 then
    GetProximoEvento := 1
  else
    GetProximoEvento := vEvento;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.GetMaxFechaHastaLiquidacionILTB(Siniestro, Orden, Recaida :Integer) :TDateTime;
//devuelve para el siniestro la máxima fecha hasta de liquidación de ILT
var
  sSql :String;
begin
  sSql := ' SELECT MAX(le_FechaHas) FROM sle_liquiempsin ' +
           ' WHERE le_siniestro=' + SqlInt(Siniestro) +
             ' AND le_orden=' + SqlInt(Orden) +
             ' AND le_recaida=' + SqlInt(Recaida) +
             ' AND le_conpago IN (' + CONCEPTO_ILT_REINTEGRO + ', ' + CONCEPTO_ILT_PAGODIRECTO + ')' +
             ' AND le_imporperi > 0 ' +
             ' AND NVL(le_estado, '''') IN (''C'',''E'',''M'',''P'',''V'')';
  GetMaxFechaHastaLiquidacionILTB := ValorSqlDateTime(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.btnAceptarRecaidaClick(Sender: TObject);
begin
  if cmbRecaida.Value <> '' then fpSeleccionRecaida.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.btnCancelarRecaidaClick(Sender: TObject);
begin
  fpSeleccionRecaida.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fpSeleccionRecaidaBeforeShow(Sender: TObject);
begin
  sdqRecaidas.ParamByName('siniestro').AsString := SinEditABM.SiniestroS;
  sdqRecaidas.ParamByName('orden').AsString     := SinEditABM.OrdenS;
  sdqRecaidas.Open;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fpSeleccionRecaidaClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqRecaidas.Close;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fpEventosBeforeShow(Sender: TObject);
begin
  bEventoAgregado := False;
  chkRecaDictamenABM.Checked := chkRecaDictamen.Checked;
  chkRecaDictamenABM.Enabled := False;

  chkAviso30dias.Checked := IIF(sdqDatosER_CHKAVISO30DIAS.AsString = 'S', True, False);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbInfoRecaidasClick(Sender: TObject);
begin
  if (SiniestroAct > 0) then frmPrincipal.ShowRecaidas(SiniestroAct, OrdenAct);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbTrabajadorClick(Sender: TObject);
begin
  if (SiniestroAct > 0) and sdqBusqueda.Active and not(sdqBusqueda.Eof) then
    with TfrmContratoTrabajador.Create(Self) do
    try
      CargarDatosTrabajador(IdTrabajador,
                            ValorSQLIntegerEx('SELECT rl_id ' +
                                               ' FROM crl_relacionlaboral ' +
                                              ' WHERE rl_contrato = :CONTRATO ' +
                                                ' AND rl_idtrabajador = :IDTRABAJADOR',
                                                     [iContrato, IdTrabajador]));
      ShowModal;
      fraTrabajadorSIN.Cargar(SiniestroAct, OrdenAct, RecaidaAct);
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fpEventosClose(Sender: TObject; var Action: TCloseAction);
begin
  if bEventoAgregado then //para refrescar la pantalla
    CargarSiniestro(SiniestroAct, OrdenAct, RecaidaAct);
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.DoArmarObservaciones(Descripcion :String) :String;
var
  vTmp :String;
begin
  vTmp := Descripcion;
  if (Trim(edObservaciones.Text) <> '') then
    vTmp := vTmp + ' - ' + edObservaciones.Text;

  if not(DateCitacion.IsEmpty) then
    vTmp := vTmp + ' - F. Cita: ' + DateCitacion.Text;

  if (edHora.Text <> '  :  ' ) and IsTime(edHora.Text) then
    vTmp := vTmp + ' - H. Cita: ' + edHora.Text;

  if not(DateCitacion2.IsEmpty) then
    vTmp := vTmp + ' - 2º F. Cita: ' + DateCitacion2.Text;

  if (edHora2.Text <> '  :  ' ) and IsTime(edHora2.Text) then
    vTmp := vTmp + ' - 2º H. Cita: ' + edHora2.Text;

  if not(fraUbicacion.IsEmpty) then
    vTmp := vTmp + ' - ' + fraUbicacion.Descripcion;

  Result := vTmp;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (sdqDatos.FieldByName('er_evento').AsInteger < 0) then
        AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DateCitacionKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edHora.CanFocus) then
    edHora.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.edHoraKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edObservaciones.CanFocus) then
    edObservaciones.SetFocus;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.GetUltimaRecaida(Siniestro, Orden :Integer) :Integer;
var
  sSql :String;
begin
  sSql := 'SELECT max(ex_recaida) ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
            ' AND ex_orden = ' + SqlInt(Orden);
  Result := ValorSqlInteger(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fraEventoedCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  fraEvento.edCodigoKeyPress(Sender, Key);
  if (Key = #13) and fraProfesional.CanFocus then fraProfesional.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.edSinFechaABMKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and fraEvento.CanFocus then
    fraEvento.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fraProfesionaledCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  fraProfesional.edCodigoKeyPress(Sender, Key);
  if (Key = #13) and fraResponsable.CanFocus then fraResponsable.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fraResponsableedCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  fraResponsable.edCodigoKeyPress(Sender, Key);
  if (Key = #13) and fraFirmante.CanFocus then fraFirmante.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fraFirmanteedCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  fraFirmante.edCodigoKeyPress(Sender, Key);
  if (Key = #13) and fraUbicacion.CanFocus then fraUbicacion.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fraUbicacionedCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  fraUbicacion.edCodigoKeyPress(Sender, Key);
  if (Key = #13) and DateCitacion.CanFocus then DateCitacion.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.tbImprimirSRTClick(Sender: TObject);
begin
  rptInformeSRT := TRptInformeSRT.Create(Self);
  with RptInformeSRT do
  begin
    try
      sdqDatosReporte.ParamByName('pSiniestro').AsInteger := sdqDatosER_SINIESTRO.AsInteger;
      sdqDatosReporte.ParamByName('pOrden').AsInteger     := sdqDatosER_ORDEN.AsInteger;
      sdqDatosReporte.Open;
      qrlEtapas.Caption  := '';
      qrlEtapas2.Caption := 'Datos del Evento';
      sdqDetalleReporte.SQL.Text := GetSqlDetalleReporte;
      sdqDetalleReporte.Open;
      PreviewModal;
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  tbImprimirSRT.Enabled := (sdqDatos.FieldByName('em_imprimirsrt').AsString = 'S');
  bEventoAltaReca       := (sdqDatos.FieldByName('em_altareca').AsString = 'S');
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.GetSqlDetalleReporte :String;
var
  CodEvento, sSql :String;
begin
  CodEvento := sdqDatos.FieldByName('er_codigo').AsString;
  if (sdqDatos.FieldByName('em_seguimiento').AsString = 'S') or
     (sdqDatos.FieldByName('em_segterreno').AsString = 'S') then
    CodEvento := '(' + CodEvento + ',100)'
  else
    CodEvento := '(' + CodEvento + ')';
  sSql := 'SELECT em_descripcion || ''  -  Fecha de Carga: '' || to_date(er_fechaalta,''dd/mm/yyyy'') || ' +
                ' decode(er_responsable, null, null, ''  -  Responsable: '' || re_nombre) em_descripcion, er_observaciones ' +
          ' FROM ser_evemedrecalif, sin.sem_eventomedicoreca, mre_responsable  ' +
         ' WHERE er_siniestro = ' + SqlInt(sdqDatosER_SINIESTRO.AsInteger) +
           ' AND er_orden = ' + SqlInt(sdqDatosER_ORDEN.AsInteger) +
           ' AND er_evento > 0 ' +
           ' AND er_codigo IN ' + CodEvento +
           ' AND er_responsable = re_responsable(+) ' +
           ' AND em_codigo(+)= er_codigo ' +
         ' ORDER BY er_codigo, er_fecha, er_evento ';
  Result := sSql;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.EsEventoAltaReca;
var
  sSql :String;
  sqlResults :TStringList;
begin
  bEventoAltaReca   := (fraEvento.sdqDatos.FieldByName('em_altareca').AsString = 'S');
  bEventoCese       := False;
  iContrato         := 0;

  if bEventoAltaReca then
  begin
    sSql := 'SELECT co_contrato, ex_intercurrencia, NVL(co_diasfranquicia, 0), ' +
                  ' NVL(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_orden), 0), ' +
                  ' ex_fechaaccidente ' +
             ' FROM sex_expedientes, aem_empresa, aco_contrato ' +
            ' WHERE ex_id = ' + SqlInt(IdExpediente) +
              ' AND ex_cuit = em_cuit ' +
              ' AND co_idempresa = em_id ' +
              ' AND co_contrato = NVL(art.afiliacion.get_contratovigente(ex_cuit, ex_fechaaccidente), ' +
                                    ' art.afiliacion.get_ultcontrato(ex_cuit)) ';

    sqlResults := ValoresColSQL(sSql);
    try
      if (sqlResults[1] = 'N') and //que no sea una intercurrencia
         (StrToInt(sqlResults[2]) < StrToInt(sqlResults[3])) and //que superen la franquicia
         (StrToDate(sqlResults[4]) > (IIF(edSinFechaABM.IsEmpty, DBDate, edSinFechaABM.Date) - 365)) //que no superen el año
      then begin
        bEventoCese := True;
        iContrato   := StrToInt(sqlResults[0]);
      end;
    finally
      sqlResults.Free;
    end;

    // TK 31832: Si es Evento de Alta Reca y el siniestro se encuentre dentro del año, a partir de la fecha de Alta Médica + 1 día, entonces se habilita el gbPresupIncap.
    if EsSiniestro_EnAnioAltaMedica then
      Do_HabilitarPresupIncap(True);
  end
  else  // Si no es Evento de Alta Reca, entonces Deshabilita gbPresupIncap
    Do_HabilitarPresupIncap(False);

  rbSiAlta.Enabled  := bEventoCese;
  rbNoAlta.Enabled  := bEventoCese;
  rbSiCese.Enabled  := bEventoCese;
  rbNoCese.Enabled  := bEventoCese;
  LockControls([gbConformeAlta, gbConformeCese], not(bEventoCese) or (fpEventos.Tag = 1));
  rbSiAlta.Checked    := False;
  rbNoAlta.Checked    := False;
  rbSiCese.Checked    := False;
  rbNoCese.Checked    := False;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoCargarRecaDictamen(Siniestro, Orden :Integer);
var
  sSql :String;
  bEventoCero :Boolean;
begin
  sSql := 'SELECT er_recadictamen ' +
           ' FROM ser_evemedrecalif ' +
          ' WHERE er_siniestro = ' + SqlInt(Siniestro) +
            ' AND er_orden = ' + SqlInt(Orden) +
            ' AND er_evento = 0';
  bEventoCero := ExisteSql(sSql);
  if bEventoCero then
    chkRecaDictamen.Checked := (ValorSql(sSql) = 'S')
  else
    chkRecaDictamen.Checked := False;  // Lu 25/09 : si no existia ese SQL, no limpiaba el chkRecaDictamen, y por lo tanto quedaba con el valor anterior.
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.EnviarMailDerivacion;
var
  NombreArchivo, NombreArchivo2 :String;
  sqlResults :TStringList;
  vAdjuntosAdj: TArrayOfAttach;  // por TK 43156
  rptResumen: TrptResumen;       // por TK 43156
  sSqlDEN, NombreArchivoDEN: string;               // por TK 43156
  i, iIndice: integer;
begin
  iIndice := 0;
  if (fraEvento.sdqDatos.FieldByName('em_derivinterior').AsString = 'S') and
     MsgAsk('¿Desea enviar el mail para informar la derivación?') then
  begin
    qrlSiniestro.Caption          := SinEditABM.SinOrdRec;

    sqlResults :=  ValoresColSQL('SELECT utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador, art.trabajador.get_telefono(tj_id, 5) TelefonoTrab, ' +
                                       ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) domtrabajador, ' +
                                       ' utiles.armar_cuit(ex_cuit) cuit, mp_nombre empresa, mp_telefonos, ' +
                                       ' utiles.armar_domicilio(mp_calle, mp_numero, mp_piso, mp_departamento, mp_localidad) domempresa, ' +
                                       ' ex_brevedescripcion, ud_nombre ubicacion ' +
                                  ' FROM ctj_trabajador, sex_expedientes, cmp_empresas, ' +
                                       ' cpv_provincias, sin.sud_ubicaciondenuncia ' +
                                 ' WHERE tj_cuil = ex_cuil ' +
                                   ' AND mp_cuit = ex_cuit ' +
                                   ' AND ex_id = ud_idexpediente(+) ' +
                                   ' AND ex_siniestro = ' + SqlInt(SinEditABM.Siniestro) +
                                   ' AND ex_orden = ' + SqlInt(SinEditABM.Orden) +
                                   ' AND ex_recaida = ' + SqlInt(SinEditABM.Recaida));
    try
      qrlBreveDescripcion.Caption   := sqlResults[8];
      qrlUbicacion.Caption          := sqlResults[9];
      qrlCUIT.Caption               := sqlResults[4];
      qrlRSocial.Caption            := sqlResults[5];
      qrlDomEmpresa.Caption         := sqlResults[7];
      qrlTelEmpresa.Caption         := sqlResults[6];
      qrlCUIL.Caption               := sqlResults[0];
      qrlNombreTrab.Caption         := sqlResults[1];
      qrlTelTrab.Caption            := sqlResults[2];
      qrlDomTrab.Caption            := sqlResults[3];
    finally
      sqlResults.Free;
    end;

    sdqPartes.ParamByName('psiniestro').AsInteger := SinEditABM.Siniestro;
    sdqPartes.ParamByName('porden').AsInteger     := SinEditABM.Orden;
    sdqPartes.Open;


    // Archivos adjuntos para el mail:


    // Incluye Denuncias digitalizadas (TK 43156)
    sSqlDEN := 'SELECT RA_PATHARCHIVO || ''\'' || RA_ARCHIVO IMAGEN ' +    // este select trae 0, 1 o mas denuncias
                ' FROM ARCHIVO.RTD_TIPODOCUMENTO, ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RAR_ARCHIVO, ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
               ' WHERE RA_IDARCHIVO = AR_ID ' +
                 ' AND AR_TIPO = TA_ID ' +
                 ' AND AR_TIPO = 20 ' +
                 ' AND AR_CLAVE = ''' + SinEditABM.SiniestroS + '|' + SinEditABM.OrdenS + '''' +
                 ' AND RA_IDTIPODOCUMENTO = TD_ID(+) ' +
                 ' AND NVL(TD_CODIGO, RA_CODDOCUMENTO) = ''DEN'' ' +
                 ' AND RA_FECHABAJA IS NULL ';
    with GetQuery(sSqlDEN) do
    try
      if not IsEmpty then
      begin
        SetLength(vAdjuntosAdj, RecordCount + 2);
     //   iIndice := RecordCount - 1;
        First;
        i := 0;
        while not Eof do
        begin
          NombreArchivoDEN := IncludeTrailingBackslash(TempPath) + 'Denuncia_' + SinEditABM.SiniestroS + '_' + IntToStr(i) +'.JPG';
          CopyFileExt(FieldByName('IMAGEN').AsString, NombreArchivoDEN, False);
          vAdjuntosAdj[i] := GetAttach(NombreArchivoDEN, 0);
          Next;
          inc(i);
        end;
        iIndice := i;
      end
      else
        SetLength(vAdjuntosAdj, 2);
    finally
      Free;
    end;


    // Incluye Resumen del Siniestro en el mail al prestador (TK 43156)
    rptResumen := TrptResumen.Create(Self);
    rptResumen.VieneDeReca := True;
    rptResumen.Imprimir(SinEditABM.SinOrdRec, IdExpediente, SinEditABM.Siniestro, False);
    NombreArchivo2 := IncludeTrailingBackslash(TempPath) + 'ResumenSiniestro_' + SinEditABM.SiniestroS + '.PDF';
    ExportarPDF(rptResumen, NombreArchivo2);
    rptResumen.Free;


    // Incluye Nota de Derivacion (ya estaba de antes)
    NombreArchivo := IncludeTrailingBackslash(TempPath) + 'Derivacion_' + SinEditABM.SiniestroS +'.PDF';
    ExportarPDF(qrDerivacion, NombreArchivo);


    vAdjuntosAdj[iIndice] := GetAttach(NombreArchivo, 0);
    vAdjuntosAdj[iIndice + 1] := GetAttach(NombreArchivo2, 0);   // TK 43156


    //************************************************************



    if not FileExists(NombreArchivo) then    // por TK 30597
      MessageDlg('Error al generar el Archivo PDF: ' + NombreArchivo + #13#10 + 'Consulte con Sistemas.', mtWarning, [mbOK], 0);

    EnviarMailBD('', 'Derivación al interior', [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                'Se envía el informe de derivación al interior correspondiente al siniestro ' +
                SinEditABM.SiniestroS + '-' + SinEditABM.OrdenS + '-' + SinEditABM.RecaidaS
                + CRLF + CRLF + 'Provincia ART', {GetAttachments(NombreArchivo, 7)} vAdjuntosAdj);
    sdqPartes.Close;
 end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.qrDerivacionBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.OnFraEventoChange(Sender: TObject);
begin
  if not fraEvento.IsEmpty then
  begin
    EventoCitacionDoble;
    EsEventoAltaReca;
    ValidarCapInt;
  end;
end;

procedure TFrmSegMedRecalif.ValidarCapInt;
begin
  rgCapInt.ItemIndex := -1;
  if fraEvento.sdqDatos.FieldByName('em_capint').AsString = 'S' then
    vclextra.LockControls([rgCapInt], false)
  else
    vclextra.LockControls([rgCapInt]);

end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.EventoCitacionDoble;
begin
  EsCitacionDoble := (fraEvento.sdqDatos.FieldByName('em_citaciondoble').AsString  = 'S');
  LockControls([DateCitacion2, edHora2], not(EsCitacionDoble) or (fpEventos.Tag = 1));
  if not(EsCitacionDoble) then
  begin
    DateCitacion2.Clear;
    edHora2.Clear;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.Validar2FechaControl :Boolean;
begin
  if EsCitacionDoble then
  begin
    Verificar(DateCitacion2.IsEmpty, DateCitacion2,
              'La segunda fecha de citación es obligatoria para este código de evento');
    Verificar((DateCitacion2.Date < DateCitacion.Date), DateCitacion2,
              'La segunda fecha de citación no puede ser menor que la primera');
  end
  else Verificar(not(DateCitacion2.IsEmpty), DateCitacion2,
                'No debe ingresar la segunda fecha de citación para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.Validar2HoraControl :Boolean;
begin
  if (Trim(edHora2.Text) <> ':' ) then
  begin
    Verificar(not(IsTime(edHora2.Text)), edHora2, 'La segunda hora de citación ingresada es inválida');
    Verificar(DateCitacion2.IsEmpty, DateCitacion2,
              'No puede ingresar la hora de citación si no ingresó la fecha de citación');
  end
  else Verificar(EsCitacionDoble, edHora2,
                 'La segunda hora de citación es obligatoria para este código de evento');
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoSeguimientoCese(iSiniestro, iOrden, iRecaida, iEvento :Integer);
var
  sSql :String;
  idSeg, iOrigen, iExped :Integer;
begin
  iExped    := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  iOrigen   := IIF(rbSiAlta.Checked, 7, 8);
  sSql      := ' SELECT 1' +
                '  FROM SIN.sgc_seguimientocese, SIN.ssc_situacionorigen' +
                ' WHERE gc_origen = sc_id' +
                '   AND gc_idexpediente = :IdExped' +
                '   AND gc_fechabaja IS NULL' +
                '   AND sc_excluyente = ''S''';

  if ExisteSqlEx(sSql, [iExped]) then
  begin
    sSql := 'UPDATE SIN.sgc_seguimientocese ' +
              ' SET gc_fechabaja = actualdate, ' +
                  ' gc_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE gc_fechabaja IS NULL ' +
              ' AND gc_idexpediente = ' + SqlInt(iExped);
    EjecutarSqlST(sSql);
  end;
  idSeg     := GetSecNextVal('sin.seq_sgc_id');
  sSql      := 'INSERT INTO SIN.sgc_seguimientocese ' +
               '(gc_id, gc_idexpediente, gc_origen, gc_estado, gc_dias, ' +
               ' gc_fechaalta, gc_usualta) VALUES ( ' +
                 SqlInt(idSeg) + ',' + SqlInt(iExped) + ',' +
                 SqlInt(iOrigen) + ', ''P'', ' +
             ' (actualdate - ' +  SqlDate(edSinFechaABM.Date) + '),' +
             ' actualdate, ' + SqlValue(Sesion.UserID) + ')';
  EjecutarSqlST(sSql);

  if rbSiAlta.Checked and MsgAsk('¿Desea enviar el mail de aviso al empleador?') then
    Do_EnviarMailCeseILT(iContrato, idSeg, False);

  sSql := 'UPDATE sex_expedientes ' +
            ' SET ex_fechaceseilt = ' + SqlDate(edSinFechaABM.Date) + ',' +
                ' ex_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' ex_origenceseilt = ''A'' ' +
          ' WHERE ex_id = ' + SqlInt(iExped);
  EjecutarSqlST(sSql);
  DoDestinoPapel(iRecaida, iEvento, 'CI');
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoEnviarTelegrama;
var
  sSql, sCad :String;
  sqlResults :TStringList;
begin
  if (sdqDatos.FieldByName('em_telegramatrab').AsString = 'S')and
     MsgAsk('¿Desea enviar el telegrama para informar al trabajador?') then
  begin
    sSql := 'SELECT tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                 '  tj_localidad, tj_cpostal, tj_provincia ' +
             ' FROM ctj_trabajador ' +
            ' WHERE tj_cuil = ' + SqlValue(fraTrabajadorSIN.CUIL);
    sqlResults := ValoresColSQL(sSql);
    try
      sCad := ValorSql(' select ft_texto from art.tft_formatotelegrama where ft_codigo = ''TEA03'' ');
      sCad := StringReplace(sCad,'@FECHA', sdqDatosER_FECHACONTROL1.AsString, [rfReplaceAll, rfIgnoreCase]);
      sCad := StringReplace(sCad,'@HORA', sdqDatosER_HORACITACION1.AsString, [rfReplaceAll, rfIgnoreCase]);
      sCad := StringReplace(sCad,'@UBICACION', sdqDatosDESCR_UBICACION.AsString, [rfReplaceAll, rfIgnoreCase]);
      sCad := StringReplace(sCad,'@PROFESIONAL', IIF(sdqDatos.FieldByName('em_responsable').AsString = 'S',
                        sdqDatosRE_NOMBRE.AsString, sdqDatosAU_NOMBRE.AsString), [rfReplaceAll, rfIgnoreCase]);

     { 'QUEDA SIN EFECTO CITACION DE FECHA ' +
               sdqDatosER_FECHACONTROL1.AsString + ' A LAS ' +
               sdqDatosER_HORACITACION1.AsString + ' HS. EN ' +
               sdqDatosDESCR_UBICACION.AsString + ' CON ' +                   //tea03
               IIF(sdqDatos.FieldByName('em_responsable').AsString = 'S',
                   sdqDatosRE_NOMBRE.AsString, sdqDatosAU_NOMBRE.AsString)  + '.';  }

      sSql := 'INSERT INTO tlg_telegramas  ' +
              '(lg_siniestro, lg_orden, lg_recaida, lg_destinatario, lg_calle, ' +
              ' lg_numero, lg_piso, lg_departamento, lg_localidad, lg_cpostal, ' +
              ' lg_provincia, lg_firmante, lg_firmante2, lg_fechaalta, lg_texto, lg_formato) VALUES ( ' +
              SqlInt(SiniestroAct) + ',' + SqlInt(OrdenAct) + ',' + SqlInt(RecaidaAct) + ',' +
              SqlValue(sqlResults[0]) + ',' + SqlValue(sqlResults[1]) + ',' +
              SqlValue(sqlResults[2]) + ',' + SqlValue(sqlResults[3]) + ',' +
              SqlValue(sqlResults[4]) + ',' + SqlValue(sqlResults[5]) + ',' +
              SqlValue(sqlResults[6]) + ',' + SqlValue(sqlResults[7]) + ',' +
              SqlValue(Sesion.UserId) + ',' + SqlValue('PROVINCIA ART S.A.') + ',' +
              'ActualDate, ' + SqlValue(sCad) + ', ''TEA03'' ' + ')';
      EjecutarSqlST(sSql);
    finally
      sqlResults.Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function TFrmSegMedRecalif.ValidarAltaCese :Boolean;
begin
  Verificar(bEventoCese and not(rbSiAlta.Checked) and not(rbNoAlta.Checked),
            gbConformeAlta, 'Debe seleccionar el conforme alta');
  Verificar(bEventoCese and not(rbSiCese.Checked) and not(rbNoCese.Checked),
            gbConformeCese, 'Debe seleccionar el conforme cese ILT');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoDestinoPapel(iReca, iEvento :Integer; sDoc :String = '');
var
  sDestinoPapel, sDocu, sObs :String;
  iCantHojas :Integer;
begin
  sDocu := NVL(sDoc, fraEvento.sdqDatos.FieldByName('em_digitaliza').AsString);
  if not IsEmptyString(sDocu) then
  begin
    with TFrmDestinoPapel.Create(Self) do
    try
      LblCDoc.Caption := 'Tipo de Documento: ' + sDocu;
      ShowModal;
      sDestinoPapel := DestinoPapel;
      iCantHojas    := CantHojas;
    finally
      Free;
    end;

    if (not(sDestinoPapel='') and (sDestinoPapel <> DP_SINPAPEL)) then
    begin
      //calculo el max + 1 para que no haya problemas con los que se digitalizan manualmente
      sObs := 'Corresponde al evento: ' + IntToStr(iEvento);

      Do_Actualizar_Archivo_Sin(False, Get_IdExpediente(SinEditABM.Siniestro, SinEditABM.Orden, iReca),
                                sDestinoPapel, iCantHojas, Sesion.UserID, sDocu, 0, 'A', 0, sObs);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoInsertarCartaDoc(Siniestro, Orden, Recaida, Evento :Integer);   // Lu 18/05 cambio este procedimiento a Funcion para que si no selecciona la recaida, entonces que no guarde el evento.
var
  sSql :String;
  iIdFormato, iDestinatario :Integer;
begin
  sSql  := 'SELECT tc_id, tc_destinatario ' +
            ' FROM ctc_textocarta ' +
           ' WHERE tc_codigo = :CodCarta ';
  with GetQueryEx(sSql, [fraEvento.sdqDatos.FieldByName('em_codcartadoc').AsString]) do
  try
    iIdFormato    := Fields[0].AsInteger;
    iDestinatario := Fields[1].AsInteger;
  finally
    Free;
  end;
  DoInsertarCarta(iIdFormato, Siniestro, Orden, Recaida, fraFirmante.Codigo,
                  AREA_RECA, False, ART_EMPTY_ID, IIF(iDestinatario = 2, tdTrabajador, tdEmpresa),
                  '', 0, 0, 0, 0, 0, '', Evento);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.fraEventoPropiedadesChange(Sender: TObject);
begin
  chkRecaDictamenABM.Enabled := (fpEventos.Tag = 0) and
                                (Seguridad.Activar(chkRecaDictamenABM)) and
                                (fraEvento.sdqDatos.FieldByName('em_recadictamen').AsString = 'S');

  chkAviso30dias.Enabled := (fpEventos.Tag = 0) and
                            (Seguridad.Activar(chkAviso30dias)) and
                            (fraEvento.Codigo = '086');
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoGeneraTelegRecaProf_O_Prest;                  // Lu TK 10911 o TK 12659
var sFirmante, sFirmante2, sTexto, sTeleg :String;
    Sql :TSql;
    sCalleTrabajador, sNumeroTrabajador, sPisoTrabajador, sDepartamentoTrabajador :String;
    sLocTrabajador, sCPostalTrabajador, sProvTrabajador, sSql, sNombreTrabajador :String;
    bRecaProf, bRecaPrest : boolean;
begin

  bRecaProf  := (fraEvento.sdqDatos.FieldByName('em_telegrecaprof').AsString = 'S');  // Lu TK 10911
  bRecaPrest := (fraEvento.sdqDatos.FieldByName('em_telegrecaprest').AsString = 'S');  // Lu TK 12659

  if    (bRecaProf  and MsgAsk('¿Desea enviar el telegrama notificando al trabajador?'))  // TK 10911
     or (bRecaPrest and MsgAsk('¿Desea enviar el telegrama de Comunicación de la Prestación por Solicitud de Dictámen, al trabajador?')) // TK 12659
  then
  begin
    sSql := 'SELECT tj_nombre, tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                  ' tj_localidad, tj_cpostal, tj_provincia ' +
             ' FROM ctj_trabajadores, sex_expedientes ' +
            ' WHERE ex_siniestro= :Sini ' +
              ' AND ex_orden= :Orden ' +
              ' AND ex_recaida= :Reca ' +
              ' AND ex_cuil=tj_cuil';

    with GetQueryEx(sSql,[SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) do
    try
      sNombreTrabajador       := FieldByName('TJ_NOMBRE').AsString;
      sCalleTrabajador        := FieldByName('TJ_CALLE').AsString;
      sNumeroTrabajador       := FieldByName('TJ_NUMERO').AsString;
      sPisoTrabajador         := FieldByName('TJ_PISO').AsString;
      sDepartamentoTrabajador := FieldByName('TJ_DEPARTAMENTO').AsString;
      sLocTrabajador          := FieldByName('TJ_LOCALIDAD').AsString;
      sCPostalTrabajador      := FieldByName('TJ_CPOSTAL').AsString;
      sProvTrabajador         := FieldByName('TJ_PROVINCIA').AsString;
    Finally
      Free;
    end;

    if bRecaProf then    // TK 10911
      sTeleg := 'TE13'
    else
      sTeleg := 'TE14';  // TK 12659

    sFirmante  := Sesion.Usuario;
    sFirmante2 := ART_NOMBRE;
    sTexto     := ValorSql(' Select ft_texto ' +
                             ' From art.tft_formatotelegrama ' +
                            ' where ft_codigo = ' + SqlValue(sTeleg));

    sTexto    := StringReplace(sTexto,'@PROFESIONAL', fraResponsable.Descripcion, [rfReplaceAll, rfIgnoreCase]);
    sTexto    := StringReplace(sTexto,'@USUCARGA', Sesion.Usuario, [rfReplaceAll, rfIgnoreCase]);

    Sql := TSQL.Create;
    try
      Sql.TableName:='TLG_TELEGRAMAS';
      Sql.Fields.Add('LG_SINIESTRO',SinEdit.Siniestro);
      Sql.Fields.Add('LG_ORDEN',SinEdit.Orden);
      Sql.Fields.Add('LG_RECAIDA',SinEdit.Recaida);
      Sql.Fields.Add('LG_DESTINATARIO',sNombreTrabajador);
      Sql.Fields.Add('LG_CALLE',sCalleTrabajador);
      Sql.Fields.Add('LG_NUMERO',sNumeroTrabajador);
      Sql.Fields.Add('LG_PISO',sPisoTrabajador);
      Sql.Fields.Add('LG_DEPARTAMENTO',sDepartamentoTrabajador);
      Sql.Fields.Add('LG_LOCALIDAD',sLocTrabajador);
      Sql.Fields.Add('LG_CPOSTAL',sCPostalTrabajador);
      Sql.Fields.Add('LG_PROVINCIA',sProvTrabajador);
      Sql.Fields.Add('LG_FIRMANTE',sFirmante);
      Sql.Fields.Add('LG_FIRMANTE2',sFirmante2);
      Sql.Fields.Add('LG_FECHAALTA','ACTUALDATE',False);
      Sql.Fields.Add('LG_TEXTO',sTexto);
      Sql.Fields.Add('LG_FORMATO',sTeleg);

      EjecutarSQLST(Sql.InsertSql);
    Finally
      Sql.Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.TimerConfidencialTimer(Sender: TObject);
begin
  Caption := GetTituloPantallaConfidencial(Caption, False);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.DoGeneraAutorizacion(iSiniestro, iOrden, iReca, iEventoNuevo: Integer);
var
  sAut, sSql: String;
  iIdex, iNAut: Integer;
begin
  iIdex := Get_IdExpediente(iSiniestro, iOrden, iReca);
  sSql  := 'SELECT TO_NUMBER(''0'' || MAX(au_numauto)) + 1' +
            ' FROM sau_autorizaciones ' +
           ' WHERE au_idexpediente = :IdExped ';
  iNAut := ValorSqlIntegerEx(sSql, [iIdex]);
  sAut  := 'SELECT em_prestacionaut, em_prestadoraut, em_gtrabajoaut ' +
            ' FROM sin.sem_eventomedicoreca ' +
           ' WHERE em_codigo = :codev ';
  with GetQueryEx(sAut, [fraEvento.Codigo]) do
  try
    sSql := 'INSERT INTO sau_autorizaciones ' +
            '(au_idexpediente, au_siniestro, au_orden, au_recaida, au_numauto, ' +
            ' au_identifprestador, au_fechasoli, au_fecharecep, au_pressol, ' +
            ' au_cantidad, au_estado, au_usualta, au_fechaalta, au_trabajo, ' +
            ' au_observaciones, au_fechacarga) VALUES (' +
            SqlInt(iIdex) + ',' + SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' +
            SqlInt(iReca) + ',' + SqlInt(iNAut) + ',' +
            SqlInt(FieldByName('em_prestadoraut').AsInteger) + ',' +
            SqlDate(edSinFechaABM.Date) + ', ActualDate, ' +
            SqlValue(FieldByName('em_prestacionaut').AsString) + ',' +
            ' 1, ''P'', ' + SqlValue(Sesion.UserID) + ', ActualDate, ' +
            SqlValue(FieldByName('em_gtrabajoaut').AsString) + ',' +
            SqlValue(edObservaciones.Lines.Text) + ', SysDate)';
    EjecutarSqlST(sSql);

    sSql := 'UPDATE ser_evemedrecalif ' +
              ' SET er_autorizacion = :aut, ' +
                  ' er_entregamaterial = '  + SqlString(IIF(rbEntregaSi.Checked, 'S', 'N'), true) + ', ' +
                  ' er_direntrega = '       + SqlString(IIF(rbDireccionPaciente.Checked, 'P', IIF(rbDireccionART.Checked, 'A', IIF(rbOtraDireccion.Checked, 'O', ''))), true ) + ', ' +
                  ' er_calleentrega = '     + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.Calle, ''), true)  + ', ' +
                  ' er_numeroentrega = '    + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.Numero, ''), true) + ', ' +
                  ' er_pisoentrega = '      + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.Piso, ''), true)   + ', ' +
                  ' er_deptoentrega = '     + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.Departamento, ''), true) + ', ' +
                  ' er_cpostalentrega = '   + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.CodigoPostal, ''), true) + ', ' +
                  ' er_localidadentrega = ' + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.Localidad, ''), true)    + ', ' +
                  ' er_provinciaentrega = ' + SqlString(IIF(rbOtraDireccion.Checked, fraDomicilio.Prov, ''), true)    + ', ' +
                  ' er_personarecibe = '    + SqlString(IIF(rbSiniestrado.Checked, 'P', IIF(rbOtro.Checked, 'O', '')), true)    + ', ' +
                  ' er_dnirecibe = '        + SqlString(IIF(rbOtro.Checked, edDNI.Text, ''), true) + ', ' +
                  ' er_nombrerecibe = '     + SqlString(IIF(rbOtro.Checked, edNombreApellido.Text, ''), true) + ', ' +
                  ' er_telefonocontacto = ' + SqlString(IIF(edTelContacto.Text <> '', edTelContacto.Text, ''), true) +
            ' WHERE er_siniestro = :sin ' +
              ' AND er_orden = :ord ' +
              ' AND er_evento = :even';
    EjecutarSqlSTEx(sSql, [iNAut, iSiniestro, iOrden, iEventoNuevo]);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSegMedRecalif.btnCancelarAutClick(Sender: TObject);
begin
  fpDatosAutorizacion.ModalResult := mrCancel;
end;

procedure TFrmSegMedRecalif.btnAceptarAutClick(Sender: TObject);
begin
  if Validar_GeneraAutorizacion then
    fpDatosAutorizacion.ModalResult := mrOk;
end;

procedure TFrmSegMedRecalif.fpDatosAutorizacionBeforeShow(Sender: TObject);
begin
  Limpiar_DatosAutorizacion;
  LockControls([fraDomicilio, edDNI, edNombreApellido], True);
end;

procedure TFrmSegMedRecalif.rbOtraDireccionClick(Sender: TObject);
begin
  DoHabilitarDirEntrega_OtraDireccion;
end;

procedure TFrmSegMedRecalif.rbDireccionARTClick(Sender: TObject);
begin
  DoHabilitarDirEntrega_OtraDireccion;
end;

procedure TFrmSegMedRecalif.rbDireccionPacienteClick(Sender: TObject);
begin
  DoHabilitarDirEntrega_OtraDireccion;
end;

procedure TFrmSegMedRecalif.rbOtroClick(Sender: TObject);
begin
  DoHabilitarPersonaRecibe_Otro;
end;

procedure TFrmSegMedRecalif.rbSiniestradoClick(Sender: TObject);
begin
  DoHabilitarPersonaRecibe_Otro;
end;

procedure TFrmSegMedRecalif.DoHabilitarDirEntrega_OtraDireccion;
begin
  LockControl(fraDomicilio, not rbOtraDireccion.Checked);
end;

procedure TFrmSegMedRecalif.DoHabilitarPersonaRecibe_Otro;
begin
  LockControls([edDNI, edNombreApellido], not rbOtro.Checked);
end;

function TFrmSegMedRecalif.Validar_GeneraAutorizacion: boolean;
begin
  Verificar((rbEntregaSi.Checked) and (not rbDireccionPaciente.Checked) and (not rbDireccionART.Checked)
            and (not rbOtraDireccion.Checked) and (not rbSiniestrado.Checked) and (not rbOtro.Checked), rbEntregaSi,
           'Debe completar la Dirección de Entrega y/o Persona que Recibe, si se selecciona "Con Entrega de Material"');
  Verificar((rbOtraDireccion.Checked) and fraDomicilio.IsEmpty, fraDomicilio,
           'Debe completar el Domicilio para la opción "Otra dirección".');
  Verificar((rbOtro.Checked) and ((edDNI.Text = '') or (edNombreApellido.Text = '')), rbOtro,
           'Debe completar el DNI y Nombre para la opción "Otro".');

  Result := True;
end;

procedure TFrmSegMedRecalif.rbEntregaNoClick(Sender: TObject);
begin
  if rbEntregaNo.Checked then
  begin
    fraDomicilio.Clear;
    edDNI.Clear;
    edNombreApellido.Clear;
    edTelContacto.Clear;
    rbDireccionPaciente.Checked := False;
    rbDireccionART.Checked      := False;
    rbOtraDireccion.Checked     := False;
    rbSiniestrado.Checked       := False;
    rbOtro.Checked              := False;
    LockControls([rbDireccionPaciente, rbDireccionART, rbOtraDireccion, fraDomicilio, rbSiniestrado,
                  rbOtro, edDNI, edNombreApellido, edTelContacto], True);
  end;

end;

procedure TFrmSegMedRecalif.rbEntregaSiClick(Sender: TObject);
begin
  if rbEntregaSi.Checked then
  begin
    LockControls([rbDireccionPaciente, rbDireccionART, rbOtraDireccion, rbSiniestrado,
                  rbOtro, edTelContacto], false);
  end;
end;

procedure TFrmSegMedRecalif.Limpiar_DatosAutorizacion;
begin
  rbEntregaSi.Checked         := True;
  rbDireccionPaciente.Checked := False;
  rbDireccionART.Checked      := False;
  rbOtraDireccion.Checked     := False;
  fraDomicilio.Clear;
  rbSiniestrado.Checked       := False;
  rbOtro.Checked              := False;
  edDNI.Clear;
  edNombreApellido.Clear;
  edTelContacto.Clear;
end;

// por ticket 32752
procedure TFrmSegMedRecalif.mnuViajarParteEvolutivoClick(Sender: TObject);
var
  iRecaida :Integer;
begin
  if (SiniestroAct = 0) then exit;
  iRecaida := GetUltimaRecaida(SiniestroAct, OrdenAct);
  frmParteEvolutivo.Free;
  frmParteEvolutivo := TfrmParteEvolutivo.Create(nil);
  with frmParteEvolutivo do
  begin
    SinEdit.SetValues(SiniestroAct, OrdenAct, iRecaida);
    CargarPartes;
    Show;
  end;
end;

// por ticket 32752
procedure TFrmSegMedRecalif.mnuViajarAutorizacionesClick(Sender: TObject);
var iRecaida: Integer;
begin
  if SinEdit.IsEmpty then
    Exit;

  with frmAutSelPorSiniestro do
  begin
    if not(Assigned(frmAutSelPorSiniestro)) then
    begin
      frmAutSelPorSiniestro := TfrmAutSelPorSiniestro.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuAutAprobacion;
      FormStyle             := fsMDIChild;
    end;

    iRecaida := Get_Recaida_PMEoUltima(SiniestroAct, OrdenAct); // TK 32752 ampliacion de este ticke: se quiere la recaida del último evento de reca presunta, y si no hay, entonces la última recaida

    SinEdit.SetValues(Self.SinEdit.Siniestro, Self.SinEdit.Orden, iRecaida);
    tbRefrescarClick(nil);
    Show;
  end;

end;

// TK 31832
function TFrmSegMedRecalif.EsSiniestro_EnAnioAltaMedica: boolean;
var sSql: string;
begin
  sSql := 'SELECT (ex_altamedica + 366) AltaMed_Mas1Anio ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_id = ' + SqlInt(IdExpediente);

  Result := (ValorSqlDateTime(sSql) > DBDate);
end;

// TK 31832
procedure TFrmSegMedRecalif.Do_HabilitarPresupIncap(bHabilitar: boolean);
begin
  if not bHabilitar then
  begin
    rbSiPresupIncap.Checked := False;
    rbNoPresupIncap.Checked := False;
  end;
  rbSiPresupIncap.Enabled := bHabilitar;
  rbNoPresupIncap.Enabled := bHabilitar;
  if bHabilitar then
    Do_CargarPresupIncap;
end;

// TK 31832
function TFrmSegMedRecalif.ValidarPresupIncap: Boolean;
begin
  Verificar(rbSiPresupIncap.Enabled and rbNoPresupIncap.Enabled and (not rbSiPresupIncap.Checked) and (not rbNoPresupIncap.Checked),
            gbPresupIncap, 'Debe completar si Presupone Incapacidad');

  Result := True;
end;

// TK 31832
procedure TFrmSegMedRecalif.Do_CargarPresupIncap;
var sPresupIncap: string;
    iRecaPME: integer;
begin
  // TK 33693: obtengo el er_reca_pme para calcular el presupincap, asi voy a la recaida correcta del pme.
  iRecaPME     := Get_Recaida_PMEoUltima(SiniestroAct, OrdenAct);

  sPresupIncap := ValorSql('SELECT pe_presupincapacidad FROM sin.spe_partedeegreso ' +
                           ' WHERE pe_idexpediente = art.siniestro.get_idexpediente(' + SqlInt(SiniestroAct) + ',' +
                                                                                        SqlInt(OrdenAct)     + ',' +
                                                                                        SqlInt(iRecaPME)     + ')');
  rbSiPresupIncap.Checked := (sPresupIncap = 'S');
  rbNoPresupIncap.Checked := (sPresupIncap = 'N');
end;

// TK 31832
procedure TFrmSegMedRecalif.Do_GuardarPresupIncap_EnParteEgreso;
var SqlPresupIncap: string;
begin
  SqlPresupIncap := 'UPDATE sin.spe_partedeegreso ' +
                      ' SET pe_presupincapacidad = ' + IIF(rbSiPresupIncap.Checked, '''S''', '''N''') +
                    ' WHERE pe_idexpediente = siniestro.get_idexpediente(' + SqlInt(SiniestroAct) + ',' +
                                                                             SqlInt(OrdenAct) + ',' +
                                                                             SqlInt(Get_Recaida_PMEoUltima(SiniestroAct, OrdenAct)) + ')';
  EjecutarSqlST(SqlPresupIncap);
end;

// TK 32543
procedure TFrmSegMedRecalif.Do_Mensaje_AltaMedica;
var sSql, sTipoEgreso, sMensaje: string;
    dFechaAltaMedica: TDateTime;
    bFaltaCeseILT: boolean;
begin
  sSql := ' SELECT pe_fechaaltamedica, te_descripcion TipoEgreso ' +
            ' FROM sin.spe_partedeegreso, SIN.STE_TIPOEGRESO ' +
           ' WHERE pe_idtipodeegreso = te_id ' +
             ' AND pe_idexpediente = siniestro.get_idexpediente(' + SqlInt(SinEdit.Siniestro) + ',' +
                                                                    SqlInt(SinEdit.Orden)     + ',' +
                                                                    SqlInt(SinEdit.Recaida)   + ')';
  with GetQuery(sSql) do
  try
    dFechaAltaMedica := FieldByName('PE_FECHAALTAMEDICA').AsDateTime;
    if (dFechaAltaMedica > 0) then
    begin
      sMensaje      := 'Fecha de alta Médica: ' + DateToStr(dFechaAltaMedica);
      bFaltaCeseILT := (dFechaAltaMedica > StrToDate('01/01/2008')) and
                       (sdqBusquedaEX_CAUSAFIN.AsString <> '02') and
                       (ValorSqlEx('SELECT NVL(ex_fechaceseilt, '''') ' +
                                    ' FROM sex_expedientes ' +
                                   ' WHERE ex_siniestro = :Sini ' +
                                     ' AND ex_orden = :Ord ' +
                                     ' AND ex_recaida = :Reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = '');
      if bFaltaCeseILT then
        sMensaje := sMensaje + #13 + 'Falta formulario de cese de ILT';
    end;

    sTipoEgreso := FieldByName('TIPOEGRESO').AsString;
    if (sTipoEgreso <> '') then
      sMensaje := sMensaje + #13 + 'Tipo de Egreso: ' + sTipoEgreso;
    if not(IsEmptyString(sMensaje)) then
      MsgBox(sMensaje, MB_ICONQUESTION);

  finally
    Free;
  end;

end;

// TK 32543
procedure TFrmSegMedRecalif.Do_Mensaje_PorcentIncap;
var SqlResults: TStringList;
begin
  if (SinEdit.SiniestroSql <> '0') and (SinEdit.OrdenSql <> '0') then
  begin
    SqlResults := ValoresColSql('SELECT tb_descripcion, ev_porcincapacidad' +
                                 ' FROM sev_eventosdetramite, ctb_tablas' +
                                ' WHERE ev_evento = art.amebpba.get_incapacidades(ev_siniestro,ev_orden)' +
                                  ' AND ev_siniestro = ' + SinEdit.SiniestroSql +
                                  ' AND ev_orden = ' + SinEdit.OrdenSql +
                                  ' AND tb_clave = ''EVTRA''' +
                                  ' AND ev_codigo = tb_codigo');
    try
      if (SqlResults[0] <> '') and (SqlResults[1] <> '') then
        MsgBox(SqlResults[0] + #13 + 'Porcentaje de Incapacidad: ' + SqlResults[1] + '%');
    finally
      SqlResults.Free;
    end;
  end;
end;

function TFrmSegMedRecalif.Get_Recaida_PMEoUltima(vSiniestro, vOrden: Integer): Integer;
var sSql: string;
    vRecaida: integer;
begin
  sSql := ' SELECT art.reca.get_recaida_pme(:sin, :ord) from dual ';

  vRecaida := ValorSqlIntegerEx(sSql, [vSiniestro, vOrden]);
  Result := vRecaida;
end;

procedure TFrmSegMedRecalif.CargarFechaBaja(cuil: string);
var ssql, fechafin: string;
begin
  edFechaBaja.Clear;
  if cuil <> '' then
  begin
    ssql :=
        'SELECT mi_fechafin ' +
         ' FROM comunes.cmi_miregistro' +
    ' LEFT JOIN comunes.che_header_miregistro ON (mi_idheader_miregistro = he_id)' +
        ' WHERE mi_cuil = :CUIL ' +
        ' ORDER BY he_fechaalta DESC, mi_id DESC ';
    fechafin := ValorSqlEx(ssql, [cuil]);
    if fechafin <> '' then
      edFechaBaja.Date := strtodate(fechafin);
  end;
end;

procedure TFrmSegMedRecalif.pMenuViajarPopup(Sender: TObject);    // habilitaciones btn Viajar
begin
  mnuViajarAutorizaciones.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuAutAprobacion);
  mnuViajarParteEvolutivo.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuParteEvolutivoCarga);
end;

end.
