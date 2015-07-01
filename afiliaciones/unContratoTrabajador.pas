{Usar ClientHeight 497 ClientWidth 752 sino a los que usan 800x600 de resolucion
les corta unos pixels del form y no ven bien los campos}

{$IFDEF SINIESTROS}
  {$DEFINE AMEDICA}
{$ENDIF}

{$IFDEF RED_PRES}
  {$DEFINE AMEDICA}
{$ENDIF}

{$IFDEF CEM}
  {$DEFINE AMEDICA}
{$ENDIF}

{$IFDEF AGENDA_SIC}
  {$DEFINE AMEDICA}
{$ENDIF}


unit unContratoTrabajador;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  {$IFNDEF VER150}rxCurrEdit, rxToolEdit, rxPlacemnt, {$ELSE}CurrEdit, ToolEdit, Placemnt, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, unArtFrame,
  Mask, DateComboBox, HotKeyControl, IntEdit, unFraEmpresa, unArtDbFrame, ShortCutControl, unART, LookupDialog, Menus, QueryPrint, ExtCtrls, FormPanel, unFraEstablecimiento, PeriodoPicker,
  unFraCodigoDescripcion, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraDomicilioTrab, unArtDBAwareFrame, artSeguridad, unFraDomicilio, JvExStdCtrls, JvCombobox, unFraActividad,
  Buttons, unfraCtbTablas, ImgList, unFraEmpresaAfi, DateUtils, unFraCodDesc, Math, DateTimeEditors, JvExExtCtrls, JvComponent, JvPanel, unFraTelefono, Internet, JvExtComponent;

type

  TValidateType = (vtHYS);
  TValidateSet = set of TValidateType;

  TfrmContratoTrabajador = class(TForm)
    tlbControl: TToolBar;
    tbNuevoTrabajador: TToolButton;
    tbGuardar: TToolButton;
    tbBaja: TToolButton;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    tblSeparador4: TToolButton;
    grbEmpresa: TGroupBox;
    ShortCutControl: TShortCutControl;
    grbDomicilio: TGroupBox;
    pgDatos: TPageControl;
    tabDatosLaborales: TTabSheet;
    tsHistoricoLaboral: TTabSheet;
    tsDGI: TTabSheet;
    cmbRL_FECHAINGRESO: TDateComboBox;
    Label3: TLabel;
    lbTarea: TLabel;
    lbMasaSalarial: TLabel;
    edRL_SUELDO: TCurrencyEdit;
    lbCategoria: TLabel;
    lbActividad: TLabel;
    Label11: TLabel;
    cmbRL_FECHARECEPCION: TDateComboBox;
    Label12: TLabel;
    Label13: TLabel;
    edRL_SECTOR: TEdit;
    Label14: TLabel;
    cmbTJ_FECHAALTA: TDateComboBox;
    Label15: TLabel;
    edTJ_USUALTA: TEdit;
    Label16: TLabel;
    edTJ_USUMODIF: TEdit;
    Label17: TLabel;
    cmbTJ_FECHAMODIF: TDateComboBox;
    Label18: TLabel;
    Label19: TLabel;
    edRL_TAREA: TEdit;
    grdHistoriaLaboral: TArtDBGrid;
    grdNomina: TArtDBGrid;
    sdqHistoricoLaboral: TSDQuery;
    dsHistoricoLaboral: TDataSource;
    pmImpresiones: TPopupMenu;
    mFicha: TMenuItem;
    mListadoTotal: TMenuItem;
    QueryPrintFicha: TQueryPrint;
    PrintDialog: TPrintDialog;
    QueryPrintTotal: TQueryPrint;
    Label26: TLabel;
    edTJ_DOMICILIO: TEdit;
    fraEmpresaDatosLaborales: TfraEmpresa;
    Label7: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    Label1: TLabel;
    fpDialogBajaTrabajador: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarBajaTrabajador: TButton;
    btnCancelarBajaTrabajador: TButton;
    cmbHL_FECHAEGRESO: TDateComboBox;
    Label8: TLabel;
    tbCambiarCuil: TToolButton;
    fpDialogCambioCuil: TFormPanel;
    Bevel1: TBevel;
    lbCuilAnterior: TLabel;
    lbCuilNuevo: TLabel;
    btnAceptarCambioCuil: TButton;
    btnCancelarCambioCuil: TButton;
    edCuilActual: TMaskEdit;
    edCuilNuevo: TMaskEdit;
    tblSeparador3: TToolButton;
    dsDGI: TDataSource;
    sdqDGI: TSDQuery;
    FormStorage: TFormStorage;
    edRL_ULTIMANOMINA: TPeriodoPicker;
    tbCuentasBancarias: TToolButton;
    tbEstablecimientos: TToolButton;
    tbNuevaRelacionLaboral: TToolButton;
    lbEstablec: TLabel;
    gbTrabajador: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label24: TLabel;
    Label2: TLabel;
    cmbTJ_FNACIMIENTO: TDateComboBox;
    edTJ_CUIL: TMaskEdit;
    cmbTJ_NOMBRE: TArtComboBox;
    sdqNombresTrabajadores: TSDQuery;
    dsNombresTrabajadores: TDataSource;
    fraTJ_SEXO: TfraStaticCTB_TABLAS;
    fraTJ_ESTADOCIVIL: TfraStaticCTB_TABLAS;
    fraTJ_LATERALIDADDOMINANTE: TfraStaticCTB_TABLAS;
    tlbLimpiar: TToolButton;
    ToolButton1: TToolButton;
    cmbFechaRecepcion: TDateComboBox;
    lblRecepcion: TLabel;
    fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    Label25: TLabel;
    fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion;
    edTJ_OTRANACIONALIDAD: TEdit;
    fraRL_CIUO: TfraStaticCodigoDescripcion;
    Seguridad: TSeguridad;
    fraDomicilio: TfraDomicilio;
    chkTrabNoDevengable: TCheckBox;
    chRL_PREOCUPACIONAL: TCheckBox;
    chRL_PREEXISTENTE: TCheckBox;
    Label27: TLabel;
    popupDomicilioDel: TPopupMenu;
    mnuLimpiar: TMenuItem;
    cmbTJ_DOMICILIODEL: TJvComboBox;
    tsMiSimplificacion: TTabSheet;
    fraEmpresa: TfraEmpresa;
    Label28: TLabel;
    Label29: TLabel;
    edSituacionRevista: TEdit;
    Label30: TLabel;
    edModalidadContratacion: TEdit;
    Label31: TLabel;
    edTrabajadorAgropecuario: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    edJubilacion: TEdit;
    Label34: TLabel;
    edFechaClaveAlta: TDateEdit;
    Label35: TLabel;
    edFechaClaveBaja: TDateEdit;
    Label36: TLabel;
    edFechaRegistroDato: TDateEdit;
    Label37: TLabel;
    edRemuneracion: TCurrencyEdit;
    Label38: TLabel;
    Label39: TLabel;
    fraActividad: TfraActividad;
    Label40: TLabel;
    edFechaBaja: TDateEdit;
    Label41: TLabel;
    Label43: TLabel;
    pnBotoneraMiSimplificacion: TPanel;
    fraModalidadLiquidacion: TfraCtbTablas;
    fraPuesto: TfraCtbTablas;
    sdqMiSimplificacion: TSDQuery;
    btnPrimero: TBitBtn;
    btnAnterior: TBitBtn;
    btnSiguiente: TBitBtn;
    btnUltimo: TBitBtn;
    sdqDatosTrabajador: TSDQuery;
    pnBotoneraTrabajador: TPanel;
    btnPrimeroTrabajador: TBitBtn;
    btnAnteriorTrabajador: TBitBtn;
    btnSiguienteTrabajador: TBitBtn;
    btnUltimoTrabajador: TBitBtn;
    pnNumeroMovimiento: TPanel;
    ilColor: TImageList;
    ilByN: TImageList;
    Label44: TLabel;
    edFechaIngreso: TDateEdit;
    Label45: TLabel;
    edFechaProceso: TDateEdit;
    fraCodigoMovimiento: TfraCtbTablas;
    sdspSaveTrabajador: TSDStoredProc;
    edRL_CATEGORIA: TEdit;
    tbComisionMedica: TToolButton;
    fpComisionMedica: TFormPanel;
    btnCerrar: TButton;
    memoComisionMedica: TMemo;
    gbAlta: TGroupBox;
    gbModificacion: TGroupBox;
    edRL_USUALTA: TEdit;
    cmbRL_FECHAALTA: TDateComboBox;
    edRL_USUMODIF: TEdit;
    cmbRL_FECHAMODIF: TDateComboBox;
    Label20: TLabel;
    fraOrigenDato: TfraCodDesc;
    edHoraClaveAlta: TTimeEditor;
    pnlAlertaDomicilio: TJvPanel;
    fraMotivoBaja: TfraStaticCTB_TABLAS;
    Label21: TLabel;
    pnAvisoSiniestroActivo: TPanel;
    fraTelefonoTrabajador: TfraTelefono;
    edTJ_EDIFICIO: TEdit;
    lbDescEdif: TLabel;
    edTelefonoAnt: TEdit;
    edAFJP: TEdit;
    Label22: TLabel;
    lbAfip: TLabel;
    edModalidadPresentacion: TEdit;
    lbMiSimpl: TLabel;
    edMiSimplificacion: TEdit;
    tbGuardarSoloTrabajador: TToolButton;
    chkConfirmado: TCheckBox;
    edTJ_MAIL: TEdit;
    Label23: TLabel;
    fraLugarDeTrabajo: TfraCodDesc;
    lbLugarTrabajo: TLabel;
    Label42: TLabel;
    fraHorasTrabajadas: TfraCodDesc;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoTrabajadorClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbBajaClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure mFichaClick(Sender: TObject);
    procedure mListadoTotalClick(Sender: TObject);
    procedure fraEmpresaFiltroOnChange(Sender: TObject);
    procedure btnAceptarBajaTrabajadorClick(Sender: TObject);
    procedure btnAceptarCambioCuilClick(Sender: TObject);
    procedure tbCambiarCuilClick(Sender: TObject);
    procedure fpDialogBajaTrabajadorEnter(Sender: TObject);
    procedure fpDialogCambioCuilEnter(Sender: TObject);
    procedure sdqDGIAfterOpen(DataSet: TDataSet);
    procedure fraEmpresaDatosLaboralesOnInvalidCuit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sdqHistoricoLaboralAfterOpen(DataSet: TDataSet);
    procedure cmbTJ_NOMBRECloseUp(Sender: TObject);
    procedure edTJ_CUILExit(Sender: TObject);
    procedure cmbTJ_NOMBREDropDown(Sender: TObject);
    procedure tbCuentasBancariasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEstablecimientosClick(Sender: TObject);
    procedure fraEmpresaDatosLaboralesOnChange(Sender: TObject);
    procedure tbNuevaRelacionLaboralClick(Sender: TObject);
    procedure cmbTJ_NOMBREGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tlbLimpiarClick(Sender: TObject);
    procedure edTJ_CUILKeyPress(Sender: TObject; var Key: Char);
    procedure OnfraTJ_IDNACIONALIDADChange(Sender: TObject);
    procedure mnuLimpiarClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure sdqMiSimplificacionAfterScroll(DataSet: TDataSet);
    procedure btnPrimeroTrabajadorClick(Sender: TObject);
    procedure btnAnteriorTrabajadorClick(Sender: TObject);
    procedure btnSiguienteTrabajadorClick(Sender: TObject);
    procedure btnUltimoTrabajadorClick(Sender: TObject);
    procedure sdqDatosTrabajadorAfterScroll(DataSet: TDataSet);
    procedure ShortCutControlShortCuts10ShortCutPress(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure fpComisionMedicaKeyPress(Sender: TObject; var Key: Char);
    procedure tbComisionMedicaClick(Sender: TObject);
    procedure cmbTJ_FNACIMIENTOValidate(Sender: TObject; var Cancel: Boolean);
    procedure ShortCutControlShortCuts11ShortCutPress(Sender: TObject);
    procedure cmbTJ_FNACIMIENTOExit(Sender: TObject);
    procedure fraTelefonoTrabajadorbtnABMTelefonosClick(Sender: TObject);
    procedure tbGuardarSoloTrabajadorClick(Sender: TObject);
    procedure fraRL_CIUOExit(Sender: TObject);
    procedure fraOrigenDatoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FContrato: TTableId;
    FCuil: String;
    FEstablecimientoAnterior: Integer;
    FLugarTrabajoAnterior: Integer;
    FFechaIngreso: TDate;
    FFuncion: TFuncionShowForm;
    FIdRelacionLaboral: TTableId;
    FIdTrabajador: TTableId;
    FOrigen: String;
    FPermitirFecIngresoVacia: Boolean;
    FPorContrato: Boolean;
    FValidateType: TValidateSet;
    FTipoRegimen : Integer;

    function GetContratoRelacionLaboral(aIdRelacionLaboral: TTableId): Integer;
    function GetDomicilioDel: String;
    function GetSituacionRevista(const aCuit, aCuil, aPeriodo, aCodigo: String): String;
    function GuardarTrabajador(const aIdTrabajador: Integer): Integer;
    function PermitirModificarFechaNacimiento(const aCuil: String): Boolean;
    function SetPosDomicilioDel(aDomicilioDel: String): Integer;
    function Validar: Boolean;
    function ValidarTrabajador: Boolean;
    function HuboCambiosRelacionLaboral: Boolean;
    function GetTipoRegimen(const aContrato: TTableId): Integer;

    procedure CargarDatosMiSimplificacion;
    procedure CargarDatosTrabajadorEnControles;
    procedure InicializarComboTrabajadoresDelContrato(aCuil, aNombreBuscado: String; aContrato: Integer);
    procedure InicializarVarRelacionLaboralContrato;
    procedure Limpiar(aSetearFoco, aLimpiarEmpresa, aLimpiarSoloRelacionLaboral: Boolean);
    procedure LimpiarMiSimplificacion;
    procedure LimpiarRelacionLaboral(aHabilitarEmpresa: Boolean);
    procedure LockearControlesTrabajador(const aLock: Boolean);
    procedure LockearControlesRelacionLaboral(const aLock: Boolean);
    procedure LockearOrigenDato(const aLock: Boolean);
    procedure MostrarLeyendaSiniestros(aCuil: String);
    procedure SetearFoco(aFocoEnTrabajador: Boolean);
    procedure SetFuncion(F: TFuncionShowForm);
    procedure CargarDatosTrabajadorMasLaborales(aSoloLaboral: boolean = false);
    procedure VerificarConfirmaPuestoHabilitado(const aContrato : TTableId);
    procedure CargarDatosPrincipales;
    {$IFDEF AFILIACIONES}
    procedure LoadModalidadPresentacion(const aIdEmpresa: Integer);
    procedure LoadFechaMiSimplificacion(const aCuit: String);
    {$ELSE}
    procedure HideMiSimplificacion;
    {$ENDIF}

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  protected
    FActualizarCRE_RELACIONESTABLECIMIENTO: Boolean;
    FActualizarCRP_RELALUGARTRABAJO : Boolean;
    FSilent: Boolean;

    {Creación dinámica por Compatibilidad con RedPres}
    fraEstablecimientoDatosLaborales: TfraEstablecimiento;
  public
    FDate: TDate;

    function BuscarTrabajadores(const aCondicion: String; aContrato: Integer): Boolean;

    procedure CargarDatosTrabajador(aIdTrabajador, aIdRelacionLaboral: TTableId; aDate : TDate = 0);
    procedure DoCargarDatos(const aContrato: Integer; aFuncion: TFuncionShowForm); overload;
    procedure DoCargarDatos(const aContrato: Integer); overload;
  published
    property Origen: String                   read FOrigen                  write FOrigen;
    property PermitirFecIngresoVacia: Boolean read FPermitirFecIngresoVacia write FPermitirFecIngresoVacia;
    property ValidateType: TValidateSet       read FValidateType            write FValidateType;
  end;

var
  frmContratoTrabajador: TfrmContratoTrabajador;

function DoContratoTrabajador(AIdTrabajador, AIdRelacionLaboral: TTableID): Boolean;

implementation

uses
  VCLExtra, unDmPrincipal, CUIT, General, CustomDlgs, DateTimeFuncs, AnsiSQL, SqlFuncs, unCompatibilidad, unAfiliaciones, unEstablecimientosTrabajador, StrFuncs, unPrincipal, unSesion,
  ParamFuncs, unTercerizadoras
  {$IFNDEF NO_CUENTAPAGO}, unManCCP_CUENTAPAGO{$ENDIF};

{$R *.DFM}

const
  CaptionBase: String = 'Mantenimiento de Trabajadores';

function DoContratoTrabajador(AIdTrabajador, AIdRelacionLaboral: TTableID): Boolean;
begin
  with TfrmContratoTrabajador.Create(nil) do

  try
    CargarDatosTrabajador(AIdTrabajador, AIdRelacionLaboral);
    Result := (ShowModal = mrOk);
  finally
    Free;
  end;
end;

procedure TfrmContratoTrabajador.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption                    := CaptionBase;
      tbBaja.Enabled             := False;
      tbEstablecimientos.Enabled := False;
      tbImprimir.Enabled         := False;
      tbComisionMedica.Enabled   := False;
    end;

    fsAgregar:
    begin
      Caption                    := CaptionBase + ' [ALTA] ';
      tbBaja.Enabled             := False;
      tbEstablecimientos.Enabled := False;
      tbImprimir.Enabled         := False;
      tbComisionMedica.Enabled   := False;
    end;
    fsModificar:
    begin
      Caption                    := CaptionBase + ' [MODIFICACION] ';
      tbBaja.Enabled             := Seguridad.ControlHabilitado(Self, tbBaja);
      tbEstablecimientos.Enabled := Seguridad.ControlHabilitado(Self, tbEstablecimientos);
      tbImprimir.Enabled         := Seguridad.ControlHabilitado(Self, tbImprimir);
      tbComisionMedica.Enabled   := Seguridad.ControlHabilitado(Self, tbComisionMedica);
    end;

    fsConsultar:
    begin
      Caption                        := CaptionBase + ' [CONSULTA] ';
      tbNuevoTrabajador.Enabled      := False;
      tbNuevaRelacionLaboral.Enabled := False;
      tbGuardar.Enabled              := False;
      tbBaja.Enabled                 := False;
      tbCambiarCuil.Enabled          := False;
      tbCuentasBancarias.Enabled     := False;
      tbEstablecimientos.Enabled     := False;
      tbComisionMedica.Enabled       := Seguridad.ControlHabilitado(Self, tbComisionMedica);
      LockControls([grbDomicilio, tabDatosLaborales], True);
    end;
  end;
end;

procedure TfrmContratoTrabajador.DoCargarDatos(const aContrato: Integer; aFuncion: TFuncionShowForm);
begin
  Funcion := aFuncion;
  DoCargarDatos(aContrato);
end;

procedure TfrmContratoTrabajador.DoCargarDatos(const aContrato: Integer);
begin
  FPorContrato := (aContrato <> ART_EMPTY_ID);

  LockControls([fraEmpresaFiltro, fraEmpresaDatosLaborales], FPorContrato);

  if (Funcion <> fsConsultar) then
    tbNuevaRelacionLaboral.Enabled := (not FPorContrato) and (Seguridad.ControlHabilitado(Self, tbNuevaRelacionLaboral));

  if not tbGuardar.Enabled then
    tbNuevaRelacionLaboral.Enabled := tbGuardar.Enabled;

  {if Seguridad.ControlHabilitado(Self, tbGuardarSoloTrabajador) then
    tbGuardarSoloTrabajador.Enabled := Not(tbGuardar.Enabled); }

  fraEmpresaFiltro.Contrato := aContrato;
  fraEmpresaFiltroOnChange(nil);

  FPermitirFecIngresoVacia := True;
end;

procedure TfrmContratoTrabajador.CargarDatosTrabajador(aIdTrabajador, aIdRelacionLaboral: TTableId; aDate: TDate = 0);
begin
  chkConfirmado.Enabled := False;
  FDate := aDate;

  Limpiar(False, False, False);

  if not tbGuardar.Enabled then
    tbNuevaRelacionLaboral.Enabled := tbGuardar.Enabled;

  aIdRelacionLaboral := NVL(aIdRelacionLaboral, ART_EMPTY_ID);

  FPermitirFecIngresoVacia := False;

  {if Seguridad.ControlHabilitado(Self, tbGuardarSoloTrabajador) then
    tbGuardarSoloTrabajador.Enabled := Not(tbGuardar.Enabled);

  tbGuardarSoloTrabajador.Visible := tbGuardarSoloTrabajador.Enabled;
  tbGuardar.Visible               := tbGuardar.Enabled;}

  with sdqDatosTrabajador do
  begin
    Close;
    SQL.Text :=
      'SELECT et_movimiento, mt_idtrabajador, mt_cuil, mt_nombre, mt_sexo, mt_fnacimiento, mt_estadocivil,' +
            ' mt_lateralidaddominante, mt_idnacionalidad, mt_calle, mt_numero, mt_piso, mt_departamento, mt_cpostal,' +
            ' mt_cpostala, mt_localidad, pv_descripcion, mt_codareatelefono, mt_telefono, mt_usualta, mt_fechaalta,' +
            ' mt_usumodif, mt_fechamodif, mt_documento, mt_domicilio, mt_otranacionalidad, mt_edificio,' +
            ' domde.tb_descripcion domidel, ml_idrelacionlaboral, ml_contrato, me_idestablecimiento,' +
            ' ml_fechaingreso, ml_fecharecepcion, ml_idmodalidadcontratacion, ml_tarea, ml_ciuo, ml_sector,' +
            ' ml_ultimanomina, ml_sueldo, ml_categoria, ml_usualta, ml_fechaalta, ml_usumodif, ml_fechamodif,' +
            ' ml_estado, ml_preocupacional, ml_preexistente, ml_idorigendato, em_cuit, es_nroestableci, ml_confirmapuesto, ' +
            ' mt_mail, rp_idlugartrabajo, mp_rangohstrabaja' +
       ' FROM cet_endosotrabajador, cmt_movitrabajador, cml_movirelacionlaboral, cme_movirelaestablecimiento,' +
            ' aes_establecimiento, aco_contrato, aem_empresa,  cpv_provincias, ctb_tablas domde, ' +
            ' comunes.cmp_movirelalugartrabajo, comunes.crp_relalugartrabajo, afi.alt_lugartrabajo_pcp ' +
      ' WHERE et_idmovitrabajador = mt_id(+)' +
        ' AND et_idmovirelacionlaboral = ml_id(+)' +
        ' AND et_idmoviestablecimiento = me_id(+)' +
        ' AND me_idestablecimiento = es_id(+)' +
        ' AND et_idmovilugartrabajo = mp_id(+) ' +
        ' AND mp_idrelalugartrabajo = rp_id(+) ' +
        ' AND rp_idlugartrabajo = lt_id(+) ' +
        ' AND et_contrato = co_contrato(+)' +
        ' AND co_idempresa = em_id(+)' +
        ' AND mt_provincia = pv_codigo(+)' +
        ' AND domde.tb_clave(+) = ''DOMDE''' +
        ' AND domde.tb_codigo(+) = mt_domiciliodel' +
        ' AND ml_contrato(+) = et_contrato' +
        ' AND et_idtrabajador = ' + SqlValue(aIdTrabajador) +
        IIF(aIdRelacionLaboral = ART_EMPTY_ID, ' AND ((et_contrato = AFILIACION.GET_ULTCONTRATO(em_cuit)) OR (et_contrato IS NULL))', ' AND ml_idrelacionlaboral = ' + SqlValue(aIdRelacionLaboral)) +
   ' ORDER BY et_contrato, et_movimiento DESC, NVL(mt_fechamodif, TO_DATE(''01/01/1996'', ''dd/mm/yyyy'')) DESC';
    Open;
  end;

  if not sdqDatosTrabajador.IsEmpty then
    FIdTrabajador := aIdTrabajador;
    
  fraTelefonoTrabajador.UsarValidacionesTrabajador := True;
  fraTelefonoTrabajador.Initialize(False, 'TT_IDTRABAJADOR', 'TT', 'ATT_TELEFONOTRABAJADOR');
  fraTelefonoTrabajador.FillCombo(True, FIdTrabajador);
  CargarDatosTrabajadorEnControles;
  
  LockControls([fraEmpresaDatosLaborales], True);

  if (Funcion <> fsConsultar) then
    Caption := CaptionBase + ' [Datos Cargados]';
  
  // Busco los datos de Mi Simplificación..
  with sdqMiSimplificacion do
  begin
    if Active then
      Close;
      SQL.Text :=
     'SELECT mi_cuit, mi_modcont || '' '' || NVL (mi_desmodcont, mc_descripcion) desmodcont, mi_modcont, mi_trabaagro, mi_codmov, mi_infosistjubil, mi_fechaca, mi_fechacb, mi_fechamov,' +
           ' mi_modliquid, mi_rembrut, mi_actividad, mi_fechafin, mi_puesto, mi_afjp, mi_fechaini, he_fechaalta, ' +
           ' mi_horaca, mi_sitbaja, mi_descsit ' +
     ' FROM comunes.cmi_miregistro' +
     ' LEFT JOIN comunes.che_header_miregistro ON (mi_idheader_miregistro = he_id)' +
     ' LEFT JOIN comunes.cmc_modalidadcontratacion ON mi_modcont = mc_codigo' +
     ' WHERE mi_cuil = ' + SqlValue(FCuil);

    {SQL.Text :=
      'SELECT mi_cuit, mi_desmodcont, mi_trabaagro, mi_codmov, mi_infosistjubil, mi_fechaca, mi_fechacb, mi_fechamov,' +
            ' mi_modliquid, mi_rembrut, mi_actividad, mi_fechafin, mi_puesto, mi_afjp, mi_fechaini, he_fechaalta,' +
            ' mi_horaca, mi_sitbaja, mi_descsit' +
       ' FROM comunes.cmi_miregistro' +
  ' LEFT JOIN comunes.che_header_miregistro ON (mi_idheader_miregistro = he_id)' +
      ' WHERE mi_cuil = ' + SqlValue(FCuil); }

    if fraEmpresaDatosLaborales.CUIT <> '' then
      SQL.Text := SQL.Text + ' AND mi_cuit = ' + SqlValue(fraEmpresaDatosLaborales.CUIT);

    SQL.Text := SQL.Text + ' ORDER BY he_fechaalta DESC, mi_id DESC';

    Open;
  end;
end;

procedure TfrmContratoTrabajador.LimpiarRelacionLaboral(aHabilitarEmpresa: Boolean);
begin
  FEstablecimientoAnterior := 0;
  FLugarTrabajoAnterior := 0;

  fraEmpresaDatosLaborales.Clear;
  fraEstablecimientoDatosLaborales.Clear;
  cmbRL_FECHAINGRESO.Clear;
  FFechaIngreso := 0;
  cmbRL_FECHARECEPCION.Clear;
  fraRL_IDMODALIDADCONTRATACION.Clear;
  edRL_TAREA.Clear;
  fraRL_CIUO.Clear;
  edRL_SECTOR.Clear;
  edRL_ULTIMANOMINA.Clear;
  edRL_SUELDO.Clear;
  edModalidadPresentacion.Text := '';
  edMiSimplificacion.Clear;
  edMiSimplificacion.Color := clWindow;
  edModalidadPresentacion.Color:= clBtnFace;
  edRL_CATEGORIA.Clear;
  edRL_USUALTA.Clear;
  cmbRL_FECHAALTA.Clear;
  edRL_USUMODIF.Clear;
  cmbRL_FECHAMODIF.Clear;
  chkTrabNoDevengable.Checked := False;
  chRL_PREOCUPACIONAL.Checked := False;
  chRL_PREEXISTENTE.Checked := False;
  chkConfirmado.Checked := False;
  fraOrigenDato.Clear;
  fraHorasTrabajadas.Clear;

  if not FPorContrato then
    LockControls([fraEmpresaDatosLaborales], not aHabilitarEmpresa)
  else
    LockControls([fraEstablecimientoDatosLaborales, fraLugarDeTrabajo], False);
end;

procedure TfrmContratoTrabajador.Limpiar(aSetearFoco, aLimpiarEmpresa, aLimpiarSoloRelacionLaboral: Boolean);
begin
  pnAvisoSiniestroActivo.Hide;
  pnlAlertaDomicilio.Hide;
  FIdRelacionLaboral       := ART_EMPTY_ID;
  FPermitirFecIngresoVacia := True;

  pnNumeroMovimiento.Caption := '-';
  LockControls([btnPrimeroTrabajador, btnAnteriorTrabajador, btnSiguienteTrabajador, btnUltimoTrabajador], True);
  VCLExtra.LockControls([edTJ_CUIL], False);

  if aLimpiarSoloRelacionLaboral then
  begin
    if not FPorContrato then
      fraEmpresaDatosLaborales.Clear;

    FEstablecimientoAnterior := 0;
    FLugarTrabajoAnterior := 0;
    fraEstablecimientoDatosLaborales.Clear;
    fraLugarDeTrabajo.Clear;
    fraLugarDeTrabajo.Propiedades.ExtraCondition := '';
  end
  else
  begin
    sdqHistoricoLaboral.Close;
    sdqDGI.Close;

    FIdTrabajador   := ART_EMPTY_ID;
    FCuil           := '';
    FContrato := IIF((fraEmpresaFiltro.edContrato.Text = ''), ART_EMPTY_ID, fraEmpresaFiltro.edContrato.Value);

    FTipoRegimen := GetTipoRegimen(FContrato);

    if Funcion <> fsConsultar then
      Funcion := fsAgregar
    else
      tbNuevaRelacionLaboral.Enabled := Seguridad.ControlHabilitado(Self, tbNuevaRelacionLaboral);

    if aLimpiarEmpresa and (edTJ_CUIL.Text = '') then
    begin
      VCLExtra.LockControls(fraEmpresaFiltro, False);
      fraEmpresaFiltro.Clear;
      FPorContrato := False;

      if not fraEmpresaDatosLaborales.Locked then
      begin
        fraEmpresaDatosLaborales.Clear;
        FEstablecimientoAnterior := 0;
        fraEstablecimientoDatosLaborales.Clear;
      end;

      if not fraLugarDeTrabajo.Locked then
      begin
        fraEmpresaDatosLaborales.Clear;
        FLugarTrabajoAnterior := 0;
        fraLugarDeTrabajo.Clear;
        fraLugarDeTrabajo.Propiedades.ExtraCondition := ' AND lt_id = 0 '
      end;

    end
    else
    begin
      //fraEmpresaDatosLaborales.Value := fraEmpresaFiltro.Value;
      fraEmpresaDatosLaborales.Contrato := fraEmpresaFiltro.Contrato;
      fraEmpresaDatosLaboralesOnChange(nil);
    end;

    edTJ_CUIL.Clear;
    cmbTJ_NOMBRE.Clear;
    fraTJ_SEXO.Clear;
    cmbTJ_FNACIMIENTO.Clear;
    fraTJ_ESTADOCIVIL.Clear;
    fraTJ_LATERALIDADDOMINANTE.Clear;
    fraTJ_IDNACIONALIDAD.Clear;
    OnfraTJ_IDNACIONALIDADChange(nil);
    edTJ_OTRANACIONALIDAD.Clear;
    fraDomicilio.Clear;
    edTJ_DOMICILIO.Clear;
    fraTelefonoTrabajador.Clear;
    edTelefonoAnt.Clear;
    cmbTJ_DOMICILIODEL.ItemIndex := SetPosDomicilioDel(cmbTJ_DOMICILIODEL.EmptyValue);//cmbTJ_DOMICILIODEL.ItemIndex := -1;
    edTJ_USUALTA.Clear;
    cmbTJ_FECHAALTA.Clear;
    edTJ_USUMODIF.Clear;
    cmbTJ_FECHAMODIF.Clear;
    edTJ_EDIFICIO.Clear;
    edTJ_MAIL.Clear;
    VCLExtra.LockControl(cmbTJ_FNACIMIENTO, False);
  end;

  LimpiarRelacionLaboral(aLimpiarSoloRelacionLaboral);
  LimpiarMiSimplificacion;

  if aSetearFoco then
    SetearFoco(not aLimpiarSoloRelacionLaboral);
end;

procedure TfrmContratoTrabajador.LimpiarMiSimplificacion;
begin
  LockControls([btnPrimero, btnAnterior, btnSiguiente, btnUltimo], True);
  edFechaProceso.Clear;
  fraEmpresa.Clear;
  edSituacionRevista.Clear;
  edFechaIngreso.Clear;
  edModalidadContratacion.Clear;
  edTrabajadorAgropecuario.Clear;
  fraCodigoMovimiento.Clear;
  edJubilacion.Clear;
  edFechaClaveAlta.Clear;
  edHoraClaveAlta.Clear;
  edFechaClaveBaja.Clear;
  edFechaRegistroDato.Clear;
  fraModalidadLiquidacion.Clear;
  edRemuneracion.Clear;
  fraActividad.Clear;
  edFechaBaja.Clear;
  fraPuesto.Clear;
  edAFJP.Clear;
end;

procedure TfrmContratoTrabajador.LockearControlesTrabajador(const aLock: Boolean);
begin
  LockControls([edTJ_CUIL, cmbTJ_NOMBRE, fraTJ_LATERALIDADDOMINANTE, fraTJ_SEXO, cmbTJ_FNACIMIENTO, fraTJ_ESTADOCIVIL, fraTJ_IDNACIONALIDAD, edTJ_OTRANACIONALIDAD, fraDomicilio,
                fraTelefonoTrabajador, cmbTJ_DOMICILIODEL, edTJ_DOMICILIO, edTJ_EDIFICIO, edTJ_MAIL], aLock);
end;

procedure TfrmContratoTrabajador.LockearControlesRelacionLaboral(const aLock: Boolean);
begin
  LockControls([fraEstablecimientoDatosLaborales, fraLugarDeTrabajo, cmbRL_FECHAINGRESO, cmbRL_FECHARECEPCION, fraRL_IDMODALIDADCONTRATACION, edRL_TAREA, edRL_SECTOR, fraRL_CIUO, edRL_SUELDO,
                edRL_CATEGORIA, chRL_PREOCUPACIONAL, chRL_PREEXISTENTE, fraLugarDeTrabajo, fraHorasTrabajadas], aLock);
  LockearOrigenDato(aLock);

  LockControls([chkTrabNoDevengable], not Seguridad.Activar(chkTrabNoDevengable) or aLock);
end;

function TfrmContratoTrabajador.Validar: Boolean;
var
  bExisteCuil: Boolean;
  dFecActual: TDateTime;
//  eTopeSalarial: Extended;
  iEdad: Integer;
  sCuilValido: String;
  sSql: String;
  {$IFNDEF AMEDICA}
  sFileName: String;
  {$ENDIF}
begin
  dFecActual := DBDate;
  FActualizarCRE_RELACIONESTABLECIMIENTO := False;
  FActualizarCRP_RELALUGARTRABAJO := False;
  bExisteCuil := ExisteCuil(edTJ_CUIL.Text);

  Verificar((edTJ_CUIL.Text = ''), edTJ_CUIL, 'La C.U.I.L. es obligatoria.');
  Verificar(fraTJ_SEXO.IsEmpty, fraTJ_SEXO.edCodigo, 'Identificar el sexo es obligatorio.');

  if IsCuil(edTJ_CUIL.Text) then
  begin
    if Funcion = fsAgregar then
    begin
      Verificar(bExisteCuil, edTJ_CUIL, 'Ya existe un trabajador con la C.U.I.L. ingresada.');

      if Is_CUILIndeterminado(edTJ_CUIL.Text) then
        begin
          if Is_GrabarCuilValido(StrMid(edTJ_CUIL.Text, 3, 8), fraTJ_SEXO.Value, sCuilValido) then
            edTJ_CUIL.Text := sCuilValido
          else
            Verificar(not IsEmptyString(sCuilValido), edTJ_CUIL, 'Para el DNI y sexo ingresados, ya existe la C.U.I.L. ' + PonerGuiones(sCuilValido) + '.');
        end;
    end;
  end
  else
  begin
    if bExisteCuil then
      MsgBox('El número ingresado ya existe y no es una C.U.I.L. válida.', MB_ICONINFORMATION + MB_OK)
    else
      Verificar(True, edTJ_CUIL, 'El número ingresado no es una C.U.I.L. válida.');
  end;

  Verificar((cmbTJ_NOMBRE.Text = ''), cmbTJ_NOMBRE, 'El Nombre es obligatorio.');

  Verificar((vtHYS in FValidateType) and (fraTJ_IDNACIONALIDAD.IsEmpty), fraTJ_IDNACIONALIDAD.cmbDescripcion , 'Debe indicar la nacionalidad del trabajador.');
  Verificar((fraTJ_IDNACIONALIDAD.Codigo = '7') and IsEmptyString(edTJ_OTRANACIONALIDAD.Text), edTJ_OTRANACIONALIDAD, 'Debe indicar la nacionalidad del trabajador.');
  Verificar((fraTJ_IDNACIONALIDAD.Codigo <> '7') and not IsEmptyString(edTJ_OTRANACIONALIDAD.Text), edTJ_OTRANACIONALIDAD, 'Solo puede ingresar la nacionalidad si eligió Otros.');

  Verificar((vtHYS in FValidateType) and (fraTJ_ESTADOCIVIL.IsEmpty), fraTJ_ESTADOCIVIL.cmbDescripcion , 'Debe indicar el estado civil del trabajador.');
  Verificar((vtHYS in FValidateType) and (cmbTJ_FNACIMIENTO.IsEmpty), cmbTJ_FNACIMIENTO, 'Debe indicar la fecha de nacimiento del trabajador.');

  // E-mail
  if edTJ_MAIL.Text <> '' then
    Verificar(not IsEMails(edTJ_MAIL.Text + ';'), edTJ_MAIL, 'El e-Mail no es correcto.');

  if not cmbTJ_FNACIMIENTO.IsEmpty then
  begin
    iEdad := GetAge(cmbTJ_FNACIMIENTO.Date, dFecActual);
    Verificar((iEdad <= 16) or (iEdad >= 90), cmbTJ_FNACIMIENTO, 'La edad del trabajador tiene que estar entre los 16 y los 90 años.');
  
    if (iEdad >= 80) then //tk 54072 siempre que la edad se encuentre entre 80 y 90 años consulte si es correcto
      if MsgBox('La edad del cuil ' + edTJ_CUIL.Text + ' es de ' + IntToStr(iEdad) +'.' + #13#10 +
              '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
        Abort;
  end;

  if (not fraDomicilio.IsEmpty) and (not fraDomicilio.IsValid) then
    Abort;

  if not fraDomicilio.ValidarPermisoCalle then
    Abort;

  if not fraDomicilio.ValidarCPA('El Código Postal Argentino no es correcto.') then
    Abort;

  // Verificacion del estado del trabajador
  sSql := 'SELECT afiliacion.check_cobertura(''0'', :cuil) FROM DUAL';
  if ValorSqlEx(sSql, [edTJ_CUIL.Text]) = cTRABAJADOR_MUERTO then
  begin
    sSql := 'SELECT afiliacion.msg_cobertura(''0'', :cuil) FROM DUAL';
    MsgBox(ValorSqlEx(sSql, [edTJ_CUIL.Text]), MB_ICONINFORMATION + MB_OK);

    Verificar((not fraEmpresaDatosLaborales.IsEmpty), edTJ_CUIL, 'Si el trabajador ha fallecido no puede haber datos laborales cargados.');
  end;


  if fraEmpresaDatosLaborales.IsEmpty then
  begin
    Verificar(not cmbRL_FECHAINGRESO.IsEmpty, cmbRL_FECHAINGRESO, 'No puede ingresar la fecha de ingreso si no seleccionó la empresa del trabajador.');
    Verificar(not cmbRL_FECHARECEPCION.IsEmpty, cmbRL_FECHARECEPCION, 'No puede ingresar la fecha de recepción si no seleccionó la empresa del trabajador.');
    Verificar((cmbRL_FECHARECEPCION.Date > DBDate), cmbRL_FECHARECEPCION, 'La Fecha de Recepción no puede ser posterior al día de hoy.');
    Verificar(not fraRL_IDMODALIDADCONTRATACION.IsEmpty, fraRL_IDMODALIDADCONTRATACION.edCodigo, 'No puede ingresar el tipo de contrato si no seleccionó la empresa del trabajador.');
    Verificar((Trim(edRL_TAREA.Text) <> ''), edRL_TAREA, 'No puede ingresar la tarea si no seleccionó la empresa del trabajador.');
    Verificar(not fraRL_CIUO.IsEmpty, fraRL_CIUO.edCodigo, 'No puede ingresar el CIUO si no seleccionó la empresa del trabajador.');
    Verificar((Trim(edRL_SECTOR.Text) <> ''), edRL_SECTOR, 'No puede ingresar el sector si no seleccionó la empresa del trabajador.');
    Verificar(edRL_SUELDO.Value <> 0, edRL_SUELDO, 'No puede ingresar el sueldo si no seleccionó la empresa del trabajador.');
    Verificar((Trim(edRL_CATEGORIA.Text) <> ''), edRL_CATEGORIA, 'No puede ingresar la categoría si no seleccionó la empresa del trabajador.');
  end
  else
  begin
    if not fraEstablecimientoDatosLaborales.Locked then
    begin
      //Lo que sigue es para HYS, que es para el caso que exista la R. Laboral y el accidentado no halla fallecido se debe validar lo que sigue
      if (vtHYS in FValidateType) then
      begin
        Verificar(fraRL_IDMODALIDADCONTRATACION.IsEmpty, fraRL_IDMODALIDADCONTRATACION.cmbDescripcion, 'Debe seleccionar el tipo de contrato.');
        Verificar((Trim(edRL_TAREA.Text) = ''), edRL_TAREA, 'Debe ingresar la tarea.');
        Verificar((Trim(edRL_SECTOR.Text) = ''), edRL_SECTOR, 'Debe ingresar el sector.');
        Verificar(fraRL_CIUO.IsEmpty, fraRL_CIUO.cmbDescripcion, 'Debe seleccionar el CIUO.');
      end;
    end;

    if FTipoRegimen = 3 then
    begin
      //SI co_idtiporegimen = 3
      // Si Origen del Dato es = DJCP o MSCP
      //Debera estar disponible el campo Lugar de trabajo
      //El campo Lugar de trabajo debera tomar la validacion “Debe seleccionar el lugar de trabajo del trabajador”.
      //Si Origen del Dato es <> DJCP o MSCP
      //Debera estar disponible el campo Establecimiento
      //El campo Establecimiento debera tomar la validacion “Debe seleccionar el establecimiento del trabajador”.

      Verificar(fraOrigenDato.IsEmpty, fraOrigenDato, 'El origen del dato no puede quedar vacío');
      if (fraOrigenDato.Codigo = 'DJCP') or (fraOrigenDato.Codigo = 'MSCP') or (fraOrigenDato.Codigo = 'RPCP') then
        Verificar(fraLugarDeTrabajo.IsEmpty, fraLugarDeTrabajo, 'El lugar de trabajo no puede quedar vacío')
      else
        Verificar(fraEstablecimientoDatosLaborales.IsEmpty, fraEstablecimientoDatosLaborales.edCodigo, 'Debe seleccionar el establecimiento del trabajador.');
      //tk 67114
      if fraOrigenDato.Codigo = 'MSCP' then
        Verificar(fraHorasTrabajadas.IsEmpty, fraHorasTrabajadas, 'El rango horario del trabajador es obligatorio');
    end;


    //SI  co_idtiporegimen = 2
    //El campo Establecimiento debera estar grisado y
    //al guardar los datos no debera tomar la validacion que indica “Debe seleccionar el establecimiento del trabajador”.
    //Ademas se debera habilitar un nuevo campo Lugar de trabajo,
    //el cual hace referencia a la tabla afi.alt_lugartrabajo_pcp.lt_id
    //El campo Origen del Dato por default debe estar seteado en “DJCP - DDJJ Casas Particulares.”

    //Modificado por el Mail del 30/12/2014  RV: Trabajador
    //SI  co_idtiporegimen = 2
    //•	El campo Origen del Dato puede ser DJCP o MSCP

    if FTipoRegimen = 2 then
    begin
      Verificar((fraOrigenDato.Codigo <> 'DJCP') and (fraOrigenDato.Codigo <> 'RPCP') and (fraOrigenDato.Codigo <> 'MSCP'), fraOrigenDato, 'El codigo debe ser DJCP para contratos con Régimen Especial');
      Verificar(fraLugarDeTrabajo.IsEmpty, fraLugarDeTrabajo, 'Debe seleccionar el lugar de trabajo');
      //tk 67114
      if fraOrigenDato.Codigo = 'MSCP' then
        Verificar(fraHorasTrabajadas.IsEmpty, fraHorasTrabajadas, 'El rango horario del trabajador es obligatorio');
    end;


    //SI co_idtiporegimen = 1
    //El campo Establecimiento debera tomar la validacion “Debe seleccionar el establecimiento del trabajador”.
    //El campo Origen del Dato no debera permitir guardar codigos del tipo MSCP ni DJCP
    if FTipoRegimen = 1 then
    begin
      Verificar((fraOrigenDato.Codigo = 'MSCP') or (fraOrigenDato.Codigo = 'DJCP'), fraOrigenDato, 'El codigo no puede ser MSCP ni DJCP para Régimen General');
      Verificar(fraEstablecimientoDatosLaborales.IsEmpty, fraEstablecimientoDatosLaborales.edCodigo, 'Debe seleccionar el establecimiento del trabajador.');
    end;
    //TK 31897 hacer fecha de ingreso obligatoria.
    //Verificar((not FPermitirFecIngresoVacia) and cmbRL_FECHAINGRESO.IsEmpty, cmbRL_FECHAINGRESO, 'La fecha de ingreso del trabajador es obligatoria.');

    //TK 37543 Cambiar los mesnsajes para siniestros de la fecha de ingreso obligatoria //Pidio Grossi via oral
    {If Application.Title <> 'Siniestros' then
      Verificar(cmbRL_FECHAINGRESO.IsEmpty, cmbRL_FECHAINGRESO, 'La fecha de ingreso del trabajador es obligatoria.')
    else
      Verificar(cmbRL_FECHAINGRESO.IsEmpty, cmbRL_FECHAINGRESO, 'Recuerde ingresar la fecha del siniestro como fecha ingreso.');
    //******

    //Tk 37486
    if (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'AFINOM') and (Sesion.Sector <> 'ATCLI') then
    begin
      if Funcion = fsModificar then //Si esta modificando, ver si toco la fecha de ingreso y entonces verificar.
      begin
        if FFechaIngreso <> cmbRL_FECHAINGRESO.Date then
            Verificar((DaysBetween(today, cmbRL_FECHAINGRESO.Date) > 60) or (DaysBetween(today, cmbRL_FECHAINGRESO.Date) < -60) , cmbRL_FECHAINGRESO, 'La fecha de ingreso del trabajador se encuentra fuera de parámetros. Comunicarse con Afiliaciones');
      end
      else
        Verificar((DaysBetween(today, cmbRL_FECHAINGRESO.Date) > 60) or (DaysBetween(today, cmbRL_FECHAINGRESO.Date) < -60) , cmbRL_FECHAINGRESO, 'La fecha de ingreso del trabajador se encuentra fuera de parámetros. Comunicarse con Afiliaciones');
    end;
    //****
    }
    //Tk piden Rollback de los 2 tickets de arriba, queda solo el Tk31897
    Verificar(cmbRL_FECHAINGRESO.IsEmpty, cmbRL_FECHAINGRESO, 'La fecha de ingreso del trabajador es obligatoria.');

    if ((Sesion.Sector = 'AFI') or (Sesion.Sector = 'ATCLI') or (Sesion.Sector = 'AFINOM')) and (fraOrigenDato.Codigo <> 'INICIAL') then
    begin
      if not Is_FechaIngresoAltaRelacionLaboralOk(cmbRL_FECHAINGRESO.Date, edTJ_CUIL.Text, fraEmpresaDatosLaborales.Contrato) then
        if MsgBox('La fecha de ingreso difiere en 2 meses o mas, a la fecha del registro actual en el Cuil ' + edTJ_CUIL.Text +'.' + #13#10 +
                '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
          Abort;
        if (not Is_FechaIngresoVigenciaDesdeIngresoTrabajadorOk(cmbRL_FECHAINGRESO.Date, fraEmpresaDatosLaborales.Contrato)) then
          if MsgBox('La fecha de ingreso es menor a la vigencia desde del contrato ' + edTJ_CUIL.Text +'.' + #13#10 +
                  '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
           Abort;
    end;


    if (not cmbTJ_FNACIMIENTO.IsEmpty) and (not cmbRL_FECHAINGRESO.IsEmpty) then
      Verificar(cmbTJ_FNACIMIENTO.Date > cmbRL_FECHAINGRESO.Date, cmbTJ_FNACIMIENTO, 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso del trabajador.');

    // Control.. la edad al ingreso de la empresa (tiene que ser mayor a 14 años.)
    if (not cmbTJ_FNACIMIENTO.IsEmpty) and (not cmbRL_FECHAINGRESO.IsEmpty) then
      Verificar((YearsBetween(cmbTJ_FNACIMIENTO.Date, cmbRL_FECHAINGRESO.Date) < 14), cmbTJ_FNACIMIENTO, 'El trabajador no puede tener menos de 14 años con respecto a la fecha de ingreso.');

    if not cmbRL_FECHAINGRESO.IsEmpty then
      Verificar((YearsBetween(cmbRL_FECHAINGRESO.Date, dFecActual) >= 80), cmbRL_FECHAINGRESO, 'La fecha de ingreso no puede ser mayor a 80 años desde la fecha de carga del trabajador.');

    FActualizarCRE_RELACIONESTABLECIMIENTO := True;
    FActualizarCRP_RELALUGARTRABAJO := True;

    Verificar((cmbRL_FECHARECEPCION.Date > dFecActual), cmbRL_FECHARECEPCION, 'La fecha de recepción no puede ser mayor que la fecha actual.');
    Verificar((edRL_SUELDO.Value < 0), edRL_SUELDO, 'El sueldo debe ser mayor o igual que cero.');

    sSql :=
      'SELECT am_importope' +
       ' FROM cam_topeampos' +
      ' WHERE am_periodo = (SELECT MAX(a.am_periodosi )' +
                            ' FROM cam_topeampos a' +
                           ' WHERE a.am_periodo <= :periodo)';
    //eTopeSalarial := ValorSqlExtendedEx(sSql, [NVL(edRL_ULTIMANOMINA.Periodo.Valor, FormatDateTime('yyyymm', DBDateTime))]);


     //Comentado por tk 46068
    //if edRL_ULTIMANOMINA.Periodo.Mes in [6, 12] then {Tengo en cuenta el aguinaldo para esos meses}
    //  eTopeSalarial := eTopeSalarial * 1.5;

    //Verificar((RoundTo(edRL_SUELDO.Value, -2) > RoundTo(eTopeSalarial, -2)), edRL_SUELDO, Format('El sueldo no puede superar el tope salarial ($ %s).', [FormatFloat('#,##0.00', eTopeSalarial)]));

    if (not fraEmpresaDatosLaborales.Locked)  // está dando de alta una nueva relación laboral
        and (GetIdRelacionLaboral(FIdTrabajador, FContrato) = ART_EMPTY_ID) then
    begin
      Verificar((edTJ_CUIL.Text = fraEmpresaDatosLaborales.mskCUIT.Text), edTJ_CUIL, 'El trabajador no se puede autoasegurar.');
          //Verificar( edTJ_CUIL.Text = fraEmpresaDatosLaborales.mskCUIT, edTJ_CUIL, 'No es legal que el empleador sea empleado de si mismo.' );

      {$IFNDEF AMEDICA}
        if (not (vtHYS in FValidateType)) and (Sesion.Sector <> 'HYS') then
        begin
          sFileName := UpperCase(Copy(ExtractFileName(Application.ExeName), 1, 7));
          if sFileName <> 'MANTRAB' then
            Verificar(fraOrigenDato.IsEmpty, fraOrigenDato.edCodigo, 'Debe indicar el Origen del Dato.');
        end;
      {$ENDIF}
    end;

    if (not cmbRL_FECHAINGRESO.IsEmpty) and (cmbRL_FECHAINGRESO.Date > dFecActual) then
      if MsgBox('Usted está por dar un Alta Temprana. ¿ Está seguro ?', MB_ICONQUESTION + MB_YESNO ) = IDNO then
      begin
        cmbRL_FECHAINGRESO.SetFocus;
        Abort;
      end;
  end;

  Result := True;
end;

procedure TfrmContratoTrabajador.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  pgDatos.ActivePageIndex := tabDatosLaborales.TabIndex;
  with Seguridad do
  begin
    Claves.Add.Name := 'PermitirModificarFNacimiento';
    DBLogin := frmPrincipal.DBLogin;
    Ejecutar;
  end;

  pgDatos.Visible := (Sesion.Sector <> 'CALLCENT') {$IFDEF AGENDA_SIC} and False {$ENDIF} {$IFDEF CEM} and False {$ENDIF};

  if not pgDatos.Visible then
  begin
    Constraints.MinHeight := 332;
    Constraints.MaxHeight := 332;
    tbNuevoTrabajador.Visible := False;
    tbNuevaRelacionLaboral.Visible := False;
    tblSeparador1.Visible := False;
    tbBaja.Visible := False;
    tblSeparador2.Visible := False;
    tbImprimir.Visible := False;
    tblSeparador3.Visible := False;
    tlbLimpiar.Visible := False;
    tbCambiarCuil.Visible := False;
    tbCuentasBancarias.Visible := False;
    tbEstablecimientos.Visible := False;
    tbComisionMedica.Visible := False;
    tblSeparador4.Visible := False;
    tbGuardar.Visible := False;
    tbGuardarSoloTrabajador.ImageIndex := tbGuardar.ImageIndex;
    VCLExtra.LockControls([fraEmpresaFiltro], True);
  end;

  inherited;
  {$IFDEF NO_CUENTAPAGO}
  tbCuentasBancarias.Visible := False;
  {$ENDIF}

  fraEstablecimientoDatosLaborales := TfraEstablecimiento.Create(Self);
  with fraEstablecimientoDatosLaborales do
  begin
    Parent := tabDatosLaborales;
    Top := 60;
    Left := fraOrigenDato.Left -1;
    Width := fraOrigenDato.Width;//fraEmpresaDatosLaborales.Width;
    Anchors := [akLeft, akTop, akRight];
    TabOrder := fraEmpresaDatosLaborales.TabOrder + 1;
     
    {$IFNDEF ART2}
    AutoScroll := False;
    edCodigo.Left := 2;
    cmbDescripcion.Left := 48;
    cmbDescripcion.Width := Width - cmbDescripcion.Left - edCodigo.Left;
    edCPostal.Visible := False;
    edDomicilio.Visible := False;
    edLocalidad.Visible := False;
    edProvincia.Visible := False;
    Height := 22; 
    {$ENDIF}
  end;

 {$IFNDEF AFILIACIONES}
  HideMiSimplificacion;
 {$ENDIF}

  FSilent  := True;
  FEstablecimientoAnterior := 0;
  FLugarTrabajoAnterior := 0;
  FFuncion := fsNone;
  FOrigen  := 'A';

  fraEmpresaFiltro.ShowBajas := True;
  fraEmpresaFiltro.OnChange := fraEmpresaFiltroOnChange;
  fraDomicilio.AutoSize := False;

  with fraEmpresaDatosLaborales do
  begin
    OnInvalidCuit := fraEmpresaDatosLaboralesOnInvalidCuit;
    ShowBajas     := True;
    OnChange      := fraEmpresaDatosLaboralesOnChange;
  end;

  fraEstablecimientoDatosLaborales.ShowBajas := False;
  fraEstablecimientoDatosLaborales.fraEmpresa := fraEmpresaDatosLaborales;

  fraTJ_SEXO.Clave                 := 'SEXOS';
  fraTJ_ESTADOCIVIL.Clave          := 'ESTAD';
  fraTJ_LATERALIDADDOMINANTE.Clave := 'LATDO';
  fraCodigoMovimiento.Clave        := 'COMOV';

  with fraRL_CIUO do
  begin
    TableName      := 'cci_ciuo';
    FieldID        := 'ci_codigo';
    FieldCodigo    := 'ci_codigo';
    FieldDesc      := 'ci_descripcion';
    ExtraCondition := ' AND LENGTH(ci_codigo) = 4';
  end;

  with fraTJ_IDNACIONALIDAD do
  begin
    TableName   := 'cna_nacionalidad';
    FieldID     := 'na_id';
    FieldCodigo := 'na_codigo_srt';
    FieldDesc   := 'na_descripcion';
    FieldBaja   := 'na_fechabaja';
    OnChange    := OnfraTJ_IDNACIONALIDADChange;
  end;

  with fraRL_IDMODALIDADCONTRATACION do
  begin
    TableName   := 'cmc_modalidadcontratacion';
    FieldID     := 'mc_id';
    FieldCodigo := 'mc_codigo';
    FieldDesc   := 'mc_descripcion';
    FieldBaja   := 'mc_fechabaja';
  end;

  // Cargo los tipos de domicilio de la ctb_tablas..
  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''DOMDE''' +
      ' AND tb_codigo <> ''0''' +
      ' AND tb_fechabaja is null' +
 ' ORDER BY tb_descripcion';
  with GetQuery(sSql) do
  try
    cmbTJ_DOMICILIODEL.Items.Clear;
    cmbTJ_DOMICILIODEL.Items.Add(cmbTJ_DOMICILIODEL.EmptyValue);
    while not Eof do
    begin
      cmbTJ_DOMICILIODEL.Items.Add(FieldByName('tb_descripcion').AsString);
      Next;
    end;
    cmbTJ_DOMICILIODEL.DropDownCount := cmbTJ_DOMICILIODEL.Items.Count;
  finally
    Free;
  end;

  InicializarVarRelacionLaboralContrato;

  FPermitirFecIngresoVacia := False;

  FValidateType := [];

  fraEmpresa.ShowBajas := True;
  fraEmpresa.UltContrato := True;

  fraModalidadLiquidacion.Clave := 'MLIQ';
  fraMotivoBaja.Clave           := 'MOTIB';
  fraMotivoBaja.ExtraCondition  := ' AND tb_codigo IN (''03'', ''04'', ''05'', ''07'', ''08'', ''11'')';
  fraPuesto.Clave               := 'TAREA';

  tabDatosLaborales.TabVisible  := Seguridad.Claves.IsActive('SolapaDatosLaborales');
  tsHistoricoLaboral.TabVisible := Seguridad.Claves.IsActive('SolapaHistoricoLaboral');
  tsDGI.TabVisible              := Seguridad.Claves.IsActive('SolapaAfip');
  tsMiSimplificacion.TabVisible := Seguridad.Claves.IsActive('SolapaMiSimplificacion');

  edMiSimplificacion.Text := '';

  LockControls([edFechaProceso, fraEmpresa, edSituacionRevista, edFechaIngreso, edModalidadContratacion,
                edTrabajadorAgropecuario, fraCodigoMovimiento, edJubilacion, edFechaClaveAlta, edHoraClaveAlta,
                edFechaClaveBaja, edFechaRegistroDato, fraModalidadLiquidacion, edRemuneracion, fraActividad,
                edFechaBaja, fraPuesto, edAFJP, memoComisionMedica], True);

  LockControls([edTJ_USUALTA, cmbTJ_FECHAALTA, edTJ_USUMODIF, cmbTJ_FECHAMODIF, edRL_ULTIMANOMINA, edRL_USUALTA,
                cmbRL_FECHAALTA, edRL_USUMODIF, cmbRL_FECHAMODIF], True);

  LockearOrigenDato(True);
  fraTelefonoTrabajador.cmbTelefonos.Show;
  edTelefonoAnt.Hide;
end;

procedure TfrmContratoTrabajador.tbNuevoTrabajadorClick(Sender: TObject);
begin
  Limpiar(True, True, False);
  LockearControlesTrabajador(False);
  LockearControlesRelacionLaboral(False);
end;

procedure TfrmContratoTrabajador.tbGuardarClick(Sender: TObject);
var
  aSqlRelacionEstablecimiento: TSql;
  aSqlRelacionLugarTrabajo : TSql;
  aSqlRelacionLaboral: TSql;
  bDarAltaRelacionLaboral: Boolean;
  bInsertarEstablecimiento: Boolean;
  bInsertarLugarTrabajo: Boolean;
  IdRelacionEstablecimiento: TTableId;
  IdRelacionLugarTrabajo : TTableId;
  IdRelacionLaboral: TTableId;
  iIdOrigenDato: Integer;
  sSql: String;
{$IFNDEF AMEDICA}
  sFileName: String;
{$ENDIF}
begin
  if (Sender = tbGuardarSoloTrabajador) or (not pgDatos.Visible) then  //Si viene del boton guardar solo trabajador no verifico
  begin                                    //los datos laborales asi no cae en las validaciones de por ej fecha de ingreso
    if not ValidarTrabajador then
      Abort;
  end
  else
  if not Validar then
    Abort;

  if chkConfirmado.Checked and fraEmpresaDatosLaborales.IsEmpty then
     ShowMessage('No confirmado al puesto no se guardará por no existir relación laboral');

  bDarAltaRelacionLaboral := False;
  IdRelacionLaboral := 0;

  aSqlRelacionLaboral         := TSql.Create('crl_relacionlaboral');
  aSqlRelacionEstablecimiento := TSql.Create('cre_relacionestablecimiento');
  aSqlRelacionLugarTrabajo := TSql.Create('comunes.crp_relalugartrabajo');
  try
    try
      BeginTrans;

      //////////////////
      //  TRABAJADOR  //
      //////////////////
      case Funcion of
        fsAgregar:
        begin
          FIdTrabajador := GuardarTrabajador(-1);
          FCuil         := edTJ_CUIL.Text;
        end;

        fsModificar:
        begin
          GuardarTrabajador(FIdTrabajador);
        end;
      else
        raise Exception.Create('ERROR FATAL: Acá debería haber llegado con Funcion en fsAgregar o fsModificar.');
      end;


      ////////////////////////
      //  RELACIÓN LABORAL  //
      ////////////////////////
      if not fraEmpresaDatosLaborales.IsEmpty then
      begin
        IdRelacionLaboral := GetIdRelacionLaboral(FIdTrabajador, FContrato);

        bDarAltaRelacionLaboral := (IdRelacionLaboral = ART_EMPTY_ID);

        if bDarAltaRelacionLaboral then
        begin
          IdRelacionLaboral := GetSecNextVal('SEQ_CRL_ID');
          FIdRelacionLaboral := IdRelacionLaboral;

          aSqlRelacionLaboral.PrimaryKey.Add('rl_id',    IdRelacionLaboral);
          aSqlRelacionLaboral.Fields.Add('rl_usualta',   Sesion.UserId);
          aSqlRelacionLaboral.Fields.Add('rl_fechaalta', SQL_DATETIME, False);
          aSqlRelacionLaboral.SqlType := stInsert;
        end
        else
        begin
          FIdRelacionLaboral := IdRelacionLaboral;

          aSqlRelacionLaboral.PrimaryKey.Add('rl_id',     IdRelacionLaboral);
          aSqlRelacionLaboral.Fields.Add('rl_usumodif',   Sesion.UserId);
          aSqlRelacionLaboral.Fields.Add('rl_fechamodif', SQL_DATETIME, False);
          aSqlRelacionLaboral.SqlType := stUpdate;
        end;

        aSqlRelacionLaboral.Fields.Add('rl_contrato',                FContrato);
        aSqlRelacionLaboral.Fields.Add('rl_fechaingreso',            cmbRL_FECHAINGRESO.Date);
        aSqlRelacionLaboral.Fields.Add('rl_fecharecepcion',          cmbRL_FECHARECEPCION.Date);
        aSqlRelacionLaboral.Fields.Add('rl_idmodalidadcontratacion', fraRL_IDMODALIDADCONTRATACION.Value, True);
        aSqlRelacionLaboral.Fields.Add('rl_tarea',                   edRL_TAREA.Text);
        aSqlRelacionLaboral.Fields.Add('rl_ciuo',                    fraRL_CIUO.Codigo);
        aSqlRelacionLaboral.Fields.Add('rl_sector',                  edRL_SECTOR.Text);
        aSqlRelacionLaboral.Fields.AddExtended('rl_sueldo',          edRL_SUELDO.value, ALL_DECIMALS, False);
        aSqlRelacionLaboral.Fields.Add('rl_categoria',               edRL_CATEGORIA.Text);
        aSqlRelacionLaboral.Fields.Add('rl_idtrabajador',            FIdTrabajador);
        aSqlRelacionLaboral.Fields.Add('rl_estado',                  String(IIF(chkTrabNoDevengable.Checked, 'S', 'N')));
        aSqlRelacionLaboral.Fields.Add('rl_preocupacional',          String(IIF(chRL_PREOCUPACIONAL.Checked, 'S', 'N')));
        aSqlRelacionLaboral.Fields.Add('rl_preexistente',            String(IIF(chRL_PREEXISTENTE.Checked, 'S', 'N')));
        aSqlRelacionLaboral.Fields.Add('rl_confirmapuesto',          String(IIF(chkConfirmado.Checked, 'N', 'S')));


        ///////////////////////
        //  ESTABLECIMIENTO  //
        ///////////////////////
        ///

        if (FTipoRegimen = 1) or (FTipoRegimen = 3) and (not fraEstablecimientoDatosLaborales.IsEmpty)  then
        begin
          sSql :=
            'SELECT re_id' +
             ' FROM cre_relacionestablecimiento' +
            ' WHERE re_idrelacionlaboral = :idrelacionlaboral' +
              ' AND re_idestablecimiento = :idestablecimiento';
          IdRelacionEstablecimiento := ValorSqlIntegerEx(sSql, [IdRelacionLaboral,  {$IFDEF ART2}fraEstablecimientoDatosLaborales.Value
                                                                                        {$ELSE}fraEstablecimientoDatosLaborales.ID{$ENDIF}]);
          bInsertarEstablecimiento := True;
          if (FEstablecimientoAnterior > 0) and
             (FEstablecimientoAnterior <> {$IFDEF ART2}fraEstablecimientoDatosLaborales.Value
                                          {$ELSE}fraEstablecimientoDatosLaborales.ID{$ENDIF}) then
            bInsertarEstablecimiento := not MsgAsk('¿ Desea reemplazar el establecimiento ?');

          if ((bDarAltaRelacionLaboral) or (IdRelacionEstablecimiento = 0)) and (bInsertarEstablecimiento) then
            with aSqlRelacionEstablecimiento do
            begin
              SqlType := stInsert;
              PrimaryKey.Add('re_id',           'SEQ_CRE_ID.NEXTVAL', False);
              Fields.Add('re_idrelacionlaboral', IdRelacionLaboral);
              Fields.Add('re_idestablecimiento', {$IFDEF ART2}fraEstablecimientoDatosLaborales.Value
                                                       {$ELSE}fraEstablecimientoDatosLaborales.ID{$ENDIF});
              Fields.Add('re_fechaingreso',      cmbRL_FECHAINGRESO.Date);
              Fields.Add('re_usualta',           Sesion.UserId);
              Fields.Add('re_fechaalta',         SQL_DATETIME, False);
            end
          else
          begin
            if FActualizarCRE_RELACIONESTABLECIMIENTO then
              with aSqlRelacionEstablecimiento do
              begin
                sSql :=
                  'SELECT re_id' +
                   ' FROM cre_relacionestablecimiento' +
                  ' WHERE re_idrelacionlaboral = :idrelacionlaboral' +
                    ' AND re_idestablecimiento = :idestablecimiento';

                PrimaryKey.Add('re_id',            ValorSqlIntegerEx(sSql, [IdRelacionLaboral, FEstablecimientoAnterior]));
                {$IFDEF ART2}
                Fields.Add('re_idestablecimiento', fraEstablecimientoDatosLaborales.Value);
                {$ELSE}
                Fields.Add('re_idestablecimiento', fraEstablecimientoDatosLaborales.ID);
                {$ENDIF}
                //Fields.Add('re_fechaingreso',      SQL_DATETIME, False);
                Fields.Add('re_usumodif',          Sesion.UserId);
                Fields.Add('re_fechamodif',        SQL_DATETIME, False);

                SqlType := stUpdate;
              end;
          end;
        end
      end;


      ///////////////////////
      //  LUGAR DE TRABAJO //
      ///////////////////////
      if  (FTipoRegimen = 2) or (FTipoRegimen = 3) and (not fraLugarDeTrabajo.IsEmpty) then
      begin
        sSql :=
          'SELECT rp_id' +
           ' FROM COMUNES.CRP_RELALUGARTRABAJO' +
          ' WHERE rp_idrelacionlaboral = :idrelacionlaboral' +
            ' AND rp_idlugartrabajo = :idlugartrabajo';
        IdRelacionLugarTrabajo := ValorSqlIntegerEx(sSql, [IdRelacionLaboral, fraLugarDeTrabajo.Value]);
        bInsertarLugarTrabajo := True;

        //**
        if ((bDarAltaRelacionLaboral) or (IdRelacionLugarTrabajo = 0)) and (bInsertarLugarTrabajo) then
          with aSqlRelacionLugarTrabajo do
          begin
            SqlType := stInsert;
            PrimaryKey.Add('rp_id',           'SEQ_CRP_ID.NEXTVAL', False);
            Fields.Add('rp_idrelacionlaboral', IdRelacionLaboral);
            Fields.Add('rp_idlugartrabajo', fraLugarDeTrabajo.Value);
            Fields.Add('rp_fechaingreso',      cmbRL_FECHAINGRESO.Date);
            Fields.Add('rp_usualta',           Sesion.UserId);
            Fields.Add('rp_fechaalta',         SQL_DATETIME, False);
            if not fraHorasTrabajadas.IsEmpty then
              Fields.Add('rp_rangohstrabaja',    fraHorasTrabajadas.Value);
          end
        else
        begin
          if FActualizarCRP_RELALUGARTRABAJO then
            with aSqlRelacionLugarTrabajo do
            begin
              sSql :=
                'SELECT rp_id' +
                 ' FROM crp_relalugartrabajo' +
                ' WHERE rp_idrelacionlaboral = :idrelacionlaboral' +
                  ' AND rp_idlugartrabajo = :idlugartrabajo';

              PrimaryKey.Add('rp_id',            ValorSqlIntegerEx(sSql, [IdRelacionLaboral, FLugarTrabajoAnterior]));
              Fields.Add('rp_idlugartrabajo', fraLugarDeTrabajo.Value);
              Fields.Add('rp_usumodif',          Sesion.UserId);
              Fields.Add('rp_fechamodif',        SQL_DATETIME, False);
              if not fraHorasTrabajadas.IsEmpty then
                Fields.Add('rp_rangohstrabaja',    fraHorasTrabajadas.Value);

              SqlType := stUpdate;
            end;
        end;
      end;

      if not fraEmpresaDatosLaborales.IsEmpty then
      begin
        if aSqlRelacionLaboral.SqlType = stInsert then    // Si es un alta llamo al store procedure correspondiente..
        begin
          if (fraOrigenDato.IsEmpty) and (FTipoRegimen = 1) then
          begin
            {$IFDEF AMEDICA}
              iIdOrigenDato := 4;
            {$ELSE}
              if (vtHYS in FValidateType) then
                iIdOrigenDato := 5
              else if Sesion.Sector = 'HYS' then
                iIdOrigenDato := 5
              else
              begin
                sFileName := UpperCase(Copy(ExtractFileName(Application.ExeName), 1, 7));
                if sFileName = 'MANTRAB' then
                  iIdOrigenDato := 4
                else
                  iIdOrigenDato := StrToIntDef(fraOrigenDato.ID, 0);
              end;
            {$ENDIF}
          end
          else
          if (fraOrigenDato.IsEmpty) and (FTipoRegimen = 2) then
          begin
            {$IFDEF AMEDICA}
              iIdOrigenDato := 13;
            {$ELSE}
              if (vtHYS in FValidateType) then
                iIdOrigenDato := 13
              else if Sesion.Sector = 'HYS' then
                iIdOrigenDato := 13
              else
                iIdOrigenDato := StrToIntDef(fraOrigenDato.ID, 0);
            {$ENDIF}
          end
          else
            iIdOrigenDato := StrToIntDef(fraOrigenDato.ID, 0);


          sSql :=
            'art.trabajador.insert_relacionlaboral(:idtrabajador, :fechaingreso, :sueldo, :tarea, :categoria, NULL,' +
                                                 ' :ciuo, NULL, :fecharecepcion, :nodevengable, :contrato,' +
                                                 ' :preexistente, :preocupacional, ' +
                                                   SqlNumber(fraRL_IDMODALIDADCONTRATACION.Value, True) + ', NULL,' +
                                                 ' NULL, :origendato, :usuario, :relacionlaboral, SYSDATE ,:confirmado);';
          EjecutarStoreSTEx(sSql, [FIdTrabajador,
                                   TDateTimeEx.Create(cmbRL_FECHAINGRESO.Date),
                                   edRL_SUELDO.Value,
                                   edRL_TAREA.Text,
                                   edRL_CATEGORIA.Text,
                                   fraRL_CIUO.Codigo,
                                   TDateTimeEx.Create(cmbRL_FECHARECEPCION.Date),
                                   String(IIF(chkTrabNoDevengable.Checked, 'S', 'N')),
                                   FContrato,
                                   String(IIF(chRL_PREEXISTENTE.Checked, 'S', 'N')),
                                   String(IIF(chRL_PREOCUPACIONAL.Checked, 'S', 'N')),
                                   iIdOrigenDato,
                                   Sesion.UserId,
                                   IdRelacionLaboral,
                                   String(IIF(chkConfirmado.Checked, 'N', 'S'))
                                   ]);
        end
        else
          EjecutarSqlST(aSqlRelacionLaboral.Sql);


        // trabajador en primer establecimiento o cambio de fecha de ingreso
        if (bDarAltaRelacionLaboral or FActualizarCRE_RELACIONESTABLECIMIENTO) and ((FTipoRegimen = 1) or (FTipoRegimen = 3)) and
           (not fraEstablecimientoDatosLaborales.IsEmpty) then
          EjecutarSqlST(aSqlRelacionEstablecimiento.Sql);
        if (bDarAltaRelacionLaboral or FActualizarCRP_RELALUGARTRABAJO) and ((FTipoRegimen = 2) or (FTipoRegimen = 3)) and
           (not fraLugarDeTrabajo.IsEmpty) then
          EjecutarSqlST(aSqlRelacionLugarTrabajo.Sql);
      end;

      sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:idtrabajador, :userid); END;';
      EjecutarSqlSTEx(sSql, [FIdTrabajador, Sesion.UserID]);

      CommitTrans;

      if Sender <> nil then
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

      Funcion := fsModificar;
      LockControls([fraEmpresaDatosLaborales], True);
      SetearFoco(True);

      // Cargo los datos de nuevo para que muestre los del último endoso recien guardado..
      CargarDatosTrabajador(FIdTrabajador, FIdRelacionLaboral);
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    aSqlRelacionLaboral.Free;
    aSqlRelacionEstablecimiento.Free;
  end;
end;

procedure TfrmContratoTrabajador.tbBajaClick(Sender: TObject);
var
  sSql: String;
begin
  if (Funcion = fsModificar) and (FIdRelacionLaboral <> ART_EMPTY_ID) then // este es el único caso en el que hay
  begin                                                                    // trabajador y relación laboral seleccionados
    if GetContratoRelacionLaboral(FIdRelacionLaboral) = fraEmpresaDatosLaborales.edContrato.Value then
    begin
      cmbHL_FECHAEGRESO.Date := DBDate;
      cmbFechaRecepcion.Date := DBDate;
      fraMotivoBaja.Clear;
      
      if fpDialogBajaTrabajador.ShowModal = mrOk then
      begin
        tbGuardarClick(nil);
        try
          BeginTrans;

          BorrarTrabajador(FIdRelacionLaboral, cmbHL_FECHAEGRESO.Date, Sesion.UserId, cmbFechaRecepcion.Date, fraMotivoBaja.Value);

          sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:idtrabajador, :usuario); END;';
          EjecutarSqlSTEx(sSql, [FIdTrabajador, Sesion.UserID]);

          CommitTrans;

          MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

          CargarDatosTrabajador(FIdTrabajador, ART_EMPTY_ID);
        except
          on E: Exception do
          begin
            RollBack;
            ErrorMsg(E, 'Error al guardar los datos.');
          end;
        end;
      end;
    end
    else
      MsgBox('Debe grabar previamente los datos laborales del trabajador.');
  end
  else
    MsgBox('Para poder dar de baja al trabajador debe estar en modo [MODIFICACION], y éste debe tener datos laborales cargados.');
end;

procedure TfrmContratoTrabajador.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratoTrabajador.mFichaClick(Sender: TObject);
begin
  try
    if sdqHistoricoLaboral.Active and PrintDialog.Execute then
    begin
      QueryPrintFicha.SubTitle.Lines.Text :=
        'C.U.I.L.: ' + edTJ_CUIL.EditText +
        '     Nombre: ' + cmbTJ_NOMBRE.Text + #13#10 +
        'Sexo: ' + fraTJ_SEXO.cmbDescripcion.Text +
        '     Nacionalidad: ' + fraTJ_IDNACIONALIDAD.cmbDescripcion.Text +
        '     F. Nacimiento: ' + cmbTJ_FNACIMIENTO.EditText +
        '     Est. Civil: ' + fraTJ_ESTADOCIVIL.cmbDescripcion.Text +
        '     L. Dominante: ' + fraTJ_LATERALIDADDOMINANTE.cmbDescripcion.Text + #13#10 +
        '     E-Mail: ' + edTJ_MAIL.Text + #13#10 +
        'Domicilio: ' + fraDomicilio.Calle +
        '     Nro: ' + fraDomicilio.Numero +
        '     Piso: ' + fraDomicilio.Piso +
        '     Dto: ' + fraDomicilio.Departamento + #13#10 +
        'C. Postal: ' + fraDomicilio.CodigoPostal +
        '     CPA: ' + fraDomicilio.CPA +
        '     Localidad: ' + fraDomicilio.Localidad +
        '     Provincia: ' + fraDomicilio.Provincia + #13#10 +
        '     Desc. Edif.: ' + edTJ_EDIFICIO.Text + #13#10 +
        '     Tel.: ' + fraTelefonoTrabajador.cmbTelefonos.Text+ #13#10#13#10 +
        'C.U.I.T. Empresa: ' + fraEmpresaDatosLaborales.mskCUIT.Text +
        '     Razón Social: ' + fraEmpresaDatosLaborales.cmbRSocial.Text +
        '     Contrato: ' + fraEmpresaDatosLaborales.edContrato.Text +
        '     Tipo de Contrato: ' + fraRL_IDMODALIDADCONTRATACION.cmbDescripcion.Text + #13#10 +
        'Fecha Ingreso: ' + cmbRL_FECHAINGRESO.EditText +
        '     Fecha Recepción: ' + cmbRL_FECHARECEPCION.EditText + #13#10 +
        'Tarea: ' + edRL_TAREA.Text + #13#10 +
        'CIUO: ' + fraRL_CIUO.cmbDescripcion.Text + #13#10 +
        'Sector: ' + edRL_SECTOR.Text + #13#10 +
        'Ult. Nómina: ' + edRL_ULTIMANOMINA.Periodo.Valor +
        '     Sueldo: ' + edRL_SUELDO.EditText +
        '     Categoría: ' + edRL_CATEGORIA.Text + #13#10#13#10;

      QueryPrintFicha.DataSource := dsHistoricoLaboral;
      QueryPrintFicha.SetGridColumns(grdHistoriaLaboral, True, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrintFicha.Print;
    end;
  finally
    QueryPrintFicha.SubTitle.Lines.Clear;
    QueryPrintFicha.Fields.Clear;
  end;
end;

procedure TfrmContratoTrabajador.mListadoTotalClick(Sender: TObject);
var
  aPrintTotal: TDataSource;
  aSDQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT tj_cuil, tj_nombre, es_nombre' +
     ' FROM ctj_trabajador, crl_relacionlaboral, cre_relacionestablecimiento, aes_establecimiento, aco_contrato, aem_empresa' +
    ' WHERE rl_idtrabajador = tj_id' +
      ' AND re_idrelacionlaboral = rl_id' +
      ' AND es_id = re_idestablecimiento' +
      ' AND rl_contrato = co_contrato' +
      ' AND co_idempresa = em_id' +
      ' AND es_contrato = :contrato';

  aSDQuery := GetQueryEx(sSql, [FContrato]);
  with aSDQuery do
  try
    if not IsEmpty and PrintDialog.Execute then
    begin
      aPrintTotal := TDataSource.Create(Self);
      try
        aPrintTotal.DataSet := aSDQuery;
        QueryPrintTotal.DataSource := aPrintTotal;
        QueryPrintTotal.SubTitle.Lines.Text :=
          'CUIT Empresa: ' + fraEmpresaDatosLaborales.mskCUIT.Text +
          '     Razón Social: ' + fraEmpresaDatosLaborales.cmbRSocial.Text +
          '     Contrato: ' + fraEmpresaDatosLaborales.edContrato.Text + #13#10#13#10;
        QueryPrintTotal.Print;
      finally
        aPrintTotal.Free;
      end;
    end;
  finally
    QueryPrintTotal.SubTitle.Lines.Clear;
    Free;
  end;
end;

procedure TfrmContratoTrabajador.fraEmpresaFiltroOnChange(Sender: TObject);
var
  sSql: String;
begin
  if fraEmpresaFiltro.edContrato.Text <> '' then
    if FContrato <> fraEmpresaFiltro.edContrato.Value then
    begin
      Limpiar(False, False, False);

      //fraEmpresaDatosLaborales.Value := fraEmpresaFiltro.Value;
      fraEmpresaDatosLaborales.Contrato := fraEmpresaFiltro.Contrato;
      fraEmpresaDatosLaboralesOnChange(nil);

      fraLugarDeTrabajo.Propiedades.ExtraCondition := ' AND lt_contrato = ' + SqlValue(FContrato);

      sSql :=
        'SELECT co_idtiporegimen' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato';
      if ValorSqlEx(sSql, [fraEmpresaFiltro.Contrato]) = 2 then
      begin
        LockControls([fraEstablecimientoDatosLaborales, fraLugarDeTrabajo], True);
        fraOrigenDato.Codigo := 'DJCP';
      end
      else
      begin
        LockControls([fraEstablecimientoDatosLaborales, fraLugarDeTrabajo], False);
        fraOrigenDato.Clear;
      end;

      If Is_DDJJEmptyUltPeriodo(fraEmpresaFiltro.edContrato.Value) then
      begin
        MsgBox('La última DDJJ de este contrato, se encuentra sin empleados.', MB_OK + MB_ICONINFORMATION);
        //fraOrigenDato.Propiedades.ExtraCondition :=  ' AND od_codigo IN (''MS'') ';
      end;
     { else
        fraOrigenDato.Propiedades.ExtraCondition :=  '';  }
      FContrato := fraEmpresaFiltro.edContrato.Value;
      FTipoRegimen := GetTipoRegimen(FContrato);

      Verificar(fraEmpresaFiltro.IsBaja, fraEmpresaFiltro.mskCUIT, 'La empresa ha sido dada de baja.');
    end;
end;

procedure TfrmContratoTrabajador.fraOrigenDatoExit(Sender: TObject);
begin
  fraOrigenDato.FrameExit(Sender);

  if (FTipoRegimen = 2) or (FTipoRegimen = 3) then
  begin
    LockControl(fraHorasTrabajadas, not ((fraOrigenDato.Codigo = 'DJCP') or (fraOrigenDato.Codigo = 'MSCP') or (fraOrigenDato.Codigo = 'RPCP')));
  end
  else
  begin
    fraHorasTrabajadas.Clear;
    LockControl(fraHorasTrabajadas, True);
  end;
end;

procedure TfrmContratoTrabajador.btnAceptarBajaTrabajadorClick(Sender: TObject);
var
  dFechaIngreso: TDateTime;
  sSql: String;
begin
  if cmbHL_FECHAEGRESO.IsEmpty then
    InvalidMsg(cmbHL_FECHAEGRESO, 'Falta la fecha de egreso del trabajador.')
  else
  begin
    sSql :=
      'SELECT rl_fechaingreso' +
       ' FROM crl_relacionlaboral' +
      ' WHERE rl_id = :id';
    dFechaIngreso := ValorSqlDateTimeEx(sSql, [FIdRelacionLaboral]);

    if cmbHL_FECHAEGRESO.Date < dFechaIngreso then
      InvalidMsg(cmbHL_FECHAEGRESO, 'La fecha de egreso del trabajador debe ser mayor o igual a la fecha de ingreso: ' + DateToStr(dFechaIngreso))
    else if MsgBox('¿ Confirma la baja del trabajador ?', MB_ICONQUESTION + MB_OKCANCEL) = IDOK then
      fpDialogBajaTrabajador.ModalResult := mrOk;
  end;
end;

procedure TfrmContratoTrabajador.btnAceptarCambioCuilClick(Sender: TObject);
var
  sMensajeError: String;

  function IsDatosValidosCambioCuil: Boolean;
  begin
    Result := False;

    if edCuilNuevo.Text = '' then
      InvalidMsg(edCuilNuevo, 'Debe ingresar la nueva C.U.I.L.')
    else if not IsCuil(edCuilNuevo.Text) then
      InvalidMsg(edCuilNuevo, 'La C.U.I.L. ingresada no es válida.')
    else
      Result := True;
  end;

begin
  if IsDatosValidosCambioCuil then
    if MsgBox('La operación puede tardar algunos minutos. ¿ Confirma el cambio de CUIL ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      if DoCambiarCuilBaseDatos(edCuilActual.Text, edCuilNuevo.Text, sMensajeError) then
      begin
        MsgBox('Cambio de C.U.I.L. finalizado exitosamente.', MB_OK + MB_ICONINFORMATION);
        fpDialogCambioCuil.ModalResult := mrOk;
      end
      else
        if sMensajeError <> '' then
          InvalidMsg(edCuilNuevo, sMensajeError)
    end;
end;

procedure TfrmContratoTrabajador.tbCambiarCuilClick(Sender: TObject);
var
  IdTrabajadorNuevo: TTableId;
begin
  if Funcion = fsModificar then
  begin
    edCuilActual.Text := FCuil;//sdqDatosTrabajador.FieldByName('TJ_CUIL').AsString;

    if fpDialogCambioCuil.ShowModal = mrOk then
    begin
      IdTrabajadorNuevo := GetIdTrabajadorPorCuil(edCuilNuevo.Text);
      CargarDatosTrabajador(IdTrabajadorNuevo, FIdRelacionLaboral);
    end;
  end
  else
    MsgBox('Para poder cambiar la C.U.I.L. del trabajador debe estar en modo [MODIFICACION].');
end;

procedure TfrmContratoTrabajador.fpDialogBajaTrabajadorEnter(Sender: TObject);
begin
  cmbHL_FECHAEGRESO.Clear;
end;

procedure TfrmContratoTrabajador.fpDialogCambioCuilEnter(Sender: TObject);
begin
  edCuilNuevo.Clear;
end;

procedure TfrmContratoTrabajador.sdqDGIAfterOpen(DataSet: TDataSet);
begin
  sdqDGI.FieldByName('cuit').EditMask := EMSK_CUIT;  // para ponerle los guiones al CUIT

  if sdqDGI.FieldByName('importe') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqDGI.FieldByName('importe')).Currency := True;
  if sdqDGI.FieldByName('remuneracion') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqDGI.FieldByName('remuneracion')).Currency := True;
end;

procedure TfrmContratoTrabajador.SetearFoco(aFocoEnTrabajador: Boolean);
begin
  if Visible Then
  begin
    if aFocoEnTrabajador then
      edTJ_CUIL.SetFocus
    else   // foco en la relación laboral
      if FPorContrato then  // si entró por contrato, la empresa ya está seleccionada (y deshabilitado el control)
        fraEstablecimientoDatosLaborales.edCodigo.SetFocus
      else
        fraEmpresaDatosLaborales.mskCUIT.SetFocus;
  end;
end;

procedure TfrmContratoTrabajador.FormShow(Sender: TObject);
begin
  SetearFoco(True);

  if (FFuncion <> fsConsultar) and (FFuncion <> fsModificar) then
    tbNuevoTrabajadorClick(nil);
  fraTelefonoTrabajador.UsarValidacionesTrabajador := True;
  fraTelefonoTrabajador.Initialize(False, 'TT_IDTRABAJADOR', 'TT', 'ATT_TELEFONOTRABAJADOR');
  fraTelefonoTrabajador.FillCombo(True, FIdTrabajador);
  LockControl(edTelefonoAnt);
end;

procedure TfrmContratoTrabajador.sdqHistoricoLaboralAfterOpen(DataSet: TDataSet);
begin
  sdqHistoricoLaboral.FieldByName('em_cuit').EditMask := EMSK_CUIT;  // para ponerle los guiones al CUIT

  if sdqHistoricoLaboral.FieldByName('hl_sueldo') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqHistoricoLaboral.FieldByName('hl_sueldo')).Currency := True;
end;

procedure TfrmContratoTrabajador.InicializarVarRelacionLaboralContrato;
begin
  FIdRelacionLaboral := ART_EMPTY_ID;
  FContrato    := ART_EMPTY_ID;
end;

function TfrmContratoTrabajador.GetTipoRegimen(const aContrato: TTableId): Integer;
var
  sSql : String;
begin
  sSql :=  'SELECT co_idtiporegimen' +
             ' FROM aco_contrato' +
            ' WHERE co_contrato = :contrato';
  Result := ValorSqlIntegerEx(sSql, [aContrato], 1);
end;

procedure TfrmContratoTrabajador.fraEmpresaDatosLaboralesOnInvalidCuit(Sender: TObject);
var
  IdFormulario: TTableId;
  sNroFormulario: String;
begin
  IdFormulario := GetIdFormularioSolicitudAfiliacionPorCuit(fraEmpresaDatosLaborales.mskCUIT.Text);

  if IdFormulario <> ART_EMPTY_ID then
  begin
    sNroFormulario := GetNroFormularioPorIdFormulario(IdFormulario);
    MsgBox('Esta empresa tiene una solicitud pendiente Nº ' + sNroFormulario, MB_OK + MB_ICONINFORMATION);
  end;

  fraEmpresaDatosLaborales.Clear;

  FEstablecimientoAnterior := 0;
  FLugarTrabajoAnterior := 0;
  fraEstablecimientoDatosLaborales.Clear;
  fraLugarDeTrabajo.Clear;
end;

procedure TfrmContratoTrabajador.cmbTJ_NOMBRECloseUp(Sender: TObject);
begin
  if cmbTJ_NOMBRE.Text <> '' then
    CargarDatosTrabajador(sdqNombresTrabajadores.FieldByName('tj_id').AsInteger,
                          sdqNombresTrabajadores.FieldByName('rl_id').AsInteger);
end;

procedure TfrmContratoTrabajador.edTJ_CUILExit(Sender: TObject);
var
  sCuil: String;
  sExtra: String;
  sSql: String;
begin
  if FCuil <> edTJ_CUIL.Text then
  begin
    if edTJ_CUIL.Text = '' then
      Limpiar(False, False, False)
    else
    begin
      sSql := '';
      if not (IsCuil(edTJ_CUIL.Text) or IsDNI(Trim(edTJ_CUIL.Text))) and (not ExisteCuil(edTJ_CUIL.Text)) then
        InvalidMsg(edTJ_CUIL, 'El número ingresado no es una C.U.I.L. ni un documento válidos.')
      else    // if Funcion <> fsAgregar Then
      begin
        InicializarComboTrabajadoresDelContrato(Trim(edTJ_CUIL.Text), '', fraEmpresaFiltro.Contrato);

        if sdqNombresTrabajadores.IsEmpty then
        begin
          if (FSilent) and (Funcion <> fsConsultar) and (MsgAsk('No se ha encontrado un trabajador con estos datos.'#13#10'¿ Desea dar de alta uno nuevo ?')) then
          begin
            sCuil := edTJ_CUIL.Text;
            Limpiar(False, False, False);
            edTJ_CUIL.Text := sCuil;

            if ExisteCuil(edTJ_CUIL.Text) then
              if MsgAsk(Format('El trabajador ya existe en la base de datos pero no tiene relación laboral con %s' + CRLF + '¿Desea ver sus datos ahora?', [fraEmpresaFiltro.NombreEmpresa])) then
              begin
                sCuil := edTJ_CUIL.Text;
                edTJ_CUIL.Text := '';
                Limpiar(True, True, False);
                edTJ_CUIL.Text := sCuil;
                edTJ_CUILExit(nil);
                Abort;
              end;

            if Funcion <> fsConsultar then
              Funcion := fsAgregar;

            if IsCuil(edTJ_CUIL.Text) then
              cmbTJ_NOMBRE.SetFocus
            else begin
              if ExisteDNI(edTJ_CUIL.Text) then
                sExtra := ' Tenga en cuenta que existe al menos un trabajador que tiene el mismo número documento pero no trabaja en la empresa ' + fraEmpresaFiltro.NombreEmpresa + '.'
              else
                sExtra := '';

              InfoHint(edTJ_CUIL, 'Complete el N° de C.U.I.L. para continuar con la carga de datos.' + sExtra);
            end;
          end
          else
            Limpiar(False, False, False)
        end
        else if sdqNombresTrabajadores.RecordCount = 1 then
          CargarDatosTrabajador(sdqNombresTrabajadores.FieldByName('tj_id').AsInteger,
                                sdqNombresTrabajadores.FieldByName('rl_id').AsInteger)
        else
        begin
          sdqNombresTrabajadores.Locate('esbaja', '1', [loCaseInsensitive]);
          cmbTJ_NOMBRE.DoDropDown(False);
        end;
      end;
    end;
  end;
end;

function TfrmContratoTrabajador.BuscarTrabajadores(const aCondicion: string; aContrato: Integer): Boolean;
var
  sSql: String;
begin
  if aContrato <> 0 then
    sSql :=
      'SELECT tj_id, tj_cuil, rl_id' +
       ' FROM ctj_trabajador, crl_relacionlaboral, aco_contrato, aem_empresa' +
      ' WHERE tj_id = rl_idtrabajador' +
        ' AND rl_contrato = co_contrato' +
        ' AND co_idempresa = em_id' +
        ' AND co_contrato = ' + SqlValue(aContrato)
  else
    sSql :=
      'SELECT tj_id, tj_cuil, 0 rl_id' +
       ' FROM ctj_trabajador' +
      ' WHERE 1 = 1';

  if aCondicion <> '' then
    sSql := sSql + ' AND ' + aCondicion;

  with GetQuery(sSql) do
  try
    Result := not IsEmpty;
    if Result then
    begin
      InicializarComboTrabajadoresDelContrato(FieldByName('tj_cuil').AsString, '', aContrato);
      CargarDatosTrabajador(sdqNombresTrabajadores.FieldByName('tj_id').AsInteger,
                            sdqNombresTrabajadores.FieldByName('rl_id').AsInteger);
    end
    else
    begin
      // Si no encontró nada traigo todos los movimientos del trabajador..
      Close;
      SQL.Text :=
        'SELECT tj_id, 0 tj_cuil, rl_id' +
         ' FROM ctj_trabajador' +
        ' WHERE 1 = 1' +
          ' AND ' + aCondicion;
      Open;

      Result := not IsEmpty;
      if Result then
      begin
        InicializarComboTrabajadoresDelContrato(FieldByName('tj_cuil').AsString, '', aContrato);
        CargarDatosTrabajador(sdqNombresTrabajadores.FieldByName('tj_id').AsInteger,
                              sdqNombresTrabajadores.FieldByName('rl_id').AsInteger);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoTrabajador.CargarDatosMiSimplificacion;
begin
  with sdqMiSimplificacion do
  begin
    edFechaProceso.Date           := FieldByName('he_fechaalta').AsDateTime;
    fraEmpresa.CUIT               := FieldByName('mi_cuit').AsString;
    edSituacionRevista.Text       := GetSituacionRevista(FieldByName('mi_cuit').AsString, FCuil, FormatDateTime('yyyymm', FieldByName('mi_fechaca').AsDateTime), FieldByName('mi_sitbaja').AsString);
    edFechaIngreso.Date           := FieldByName('mi_fechaini').AsDateTime;
    edModalidadContratacion.Text  := FieldByName('desmodcont').AsString;
    edTrabajadorAgropecuario.Text := FieldByName('mi_trabaagro').AsString;
    fraCodigoMovimiento.Value     := FieldByName('mi_codmov').AsString;
    edJubilacion.Text             := FieldByName('mi_infosistjubil').AsString;
    edFechaClaveAlta.Date         := FieldByName('mi_fechaca').AsDateTime;
    edHoraClaveAlta.Text          := StringReplace(FieldByName('mi_horaca').AsString, '.', ':', []);
    edFechaClaveBaja.Date         := FieldByName('mi_fechacb').AsDateTime;
    edFechaRegistroDato.Date      := FieldByName('mi_fechamov').AsDateTime;
    fraModalidadLiquidacion.Value := FieldByName('mi_modliquid').AsString;
    edRemuneracion.Value          := FieldByName('mi_rembrut').AsFloat;
    fraActividad.Codigo           := FieldByName('mi_actividad').AsString;
    edFechaBaja.Date              := FieldByName('mi_fechafin').AsDateTime;
    fraPuesto.Value               := FieldByName('mi_puesto').AsString;
    edAFJP.Text                   := FieldByName('mi_afjp').AsString;
  end;
end;

procedure TfrmContratoTrabajador.CargarDatosPrincipales;
var
  sSql : String;
begin
    edTJ_CUIL.Text                   := sdqDatosTrabajador.FieldByName('mt_cuil').AsString;
    cmbTJ_NOMBRE.Text                := sdqDatosTrabajador.FieldByName('mt_nombre').AsString;
    fraTJ_SEXO.Value                 := sdqDatosTrabajador.FieldByName('mt_sexo').AsString;
    cmbTJ_FNACIMIENTO.Date           := sdqDatosTrabajador.FieldByName('mt_fnacimiento').AsDateTime;
    fraTJ_ESTADOCIVIL.Value          := sdqDatosTrabajador.FieldByName('mt_estadocivil').AsString;
    fraTJ_LATERALIDADDOMINANTE.Value := sdqDatosTrabajador.FieldByName('mt_lateralidaddominante').AsString;
    fraTJ_IDNACIONALIDAD.Codigo      := sdqDatosTrabajador.FieldByName('mt_idnacionalidad').AsString;
    OnfraTJ_IDNACIONALIDADChange(nil);
    edTJ_OTRANACIONALIDAD.Text       := sdqDatosTrabajador.FieldByName('mt_otranacionalidad').AsString;
    edTJ_EDIFICIO.Text               := sdqDatosTrabajador.FieldByName('mt_edificio').AsString;
    edTJ_MAIL.Text                   := sdqDatosTrabajador.FieldByName('mt_mail').AsString;
    with sdqDatosTrabajador do
    	fraDomicilio.Cargar(FieldByName('mt_calle').AsString, FieldByName('mt_cpostal').AsString,
      										FieldByName('mt_localidad').AsString, FieldByName('mt_numero').AsString,
                          FieldByName('mt_piso').AsString, FieldByName('mt_departamento').AsString,
                          FieldByName('pv_descripcion').AsString, FieldByName('mt_cpostala').AsString);

  //  edTJ_CODAREATELEFONO.Text        := sdqDatosTrabajador.FieldByName('mt_codareatelefono').AsString;

    sSql :=
      'SELECT 1' +
       ' FROM att_telefonotrabajador' +
      ' WHERE tt_idtrabajador = :id';
    if ExisteSqlEx(sSql,[sdqDatosTrabajador.FieldByName('mt_idtrabajador').AsInteger]) then
    begin
      fraTelefonoTrabajador.cmbTelefonos.Show;
      edTelefonoAnt.Hide;
    end
    else
    begin
      fraTelefonoTrabajador.cmbTelefonos.Hide;
      edTelefonoAnt.Show;

      sSql :=
        'SELECT tj_telefono' +
         ' FROM ctj_trabajador' +
        ' WHERE tj_id = :id';
      with GetQueryEx(sSql, [sdqDatosTrabajador.FieldByName('mt_idtrabajador').AsInteger]) do
      try
        edTelefonoAnt.Text := FieldByname('tj_telefono').AsString;
        if edTelefonoAnt.Text ='' then
        begin
          fraTelefonoTrabajador.cmbTelefonos.Show;
          edTelefonoAnt.Hide;
        end;
      finally
        Free;
      end;
    end;
end;

procedure TfrmContratoTrabajador.CargarDatosTrabajadorMasLaborales(aSoloLaboral: boolean = false);
var
  sSql : String;
begin
  if sdqDatosTrabajador.IsEmpty then
  begin
    InicializarVarRelacionLaboralContrato;

    FPermitirFecIngresoVacia := True;

    if Funcion <> fsConsultar then
      Funcion := fsAgregar;

    VCLExtra.LockControl(cmbTJ_FNACIMIENTO, False);
  end
  else
  begin
//    FIdTrabajador := aIDTrabajador;
    FCuil := sdqDatosTrabajador.FieldByName('mt_cuil').AsString;

    if Funcion <> fsConsultar then
      Funcion := fsModificar;

    pnNumeroMovimiento.Caption := Format('Mov. %s', [sdqDatosTrabajador.FieldByName('et_movimiento').AsString]);

    // Cargar datos trabajador
    if not aSoloLaboral then
      CargarDatosPrincipales;

    cmbTJ_DOMICILIODEL.ItemIndex := SetPosDomicilioDel(sdqDatosTrabajador.FieldByName('domidel').AsString);
    edTJ_USUALTA.Text            := sdqDatosTrabajador.FieldByName('mt_usualta').AsString;
    cmbTJ_FECHAALTA.Date         := sdqDatosTrabajador.FieldByName('mt_fechaalta').AsDateTime;
    edTJ_USUMODIF.Text           := sdqDatosTrabajador.FieldByName('mt_usumodif').AsString;
    cmbTJ_FECHAMODIF.Date        := sdqDatosTrabajador.FieldByName('mt_fechamodif').AsDateTime;
    //edTJ_DOMICILIO.Text          := sdqDatosTrabajador.FieldByName('mt_domicilio').AsString;

    //**** CARGAR PARTE QUICKPASS ACA********
    sSql :=
      ' SELECT pv_observaciones' +
      '   FROM art.spv_parteevolutivo' +
      '   LEFT JOIN art.sex_expedientes ON ex_siniestro = pv_siniestro' +
      '  WHERE ex_cuil =:cuil' +
      '    AND pv_tipoparte = ''RQ'' and rownum < 2 ' +
      '  ORDER BY ex_siniestro desc, PV_NROPARTE DESC';
    edTJ_DOMICILIO.Text := ValorSQLEx(sSql, [sdqDatosTrabajador.FieldByName('mt_cuil').AsString]);

    VCLExtra.LockControl(cmbTJ_FNACIMIENTO, not PermitirModificarFechaNacimiento(edTJ_CUIL.Text));
    MostrarLeyendaSiniestros(edTJ_CUIL.Text);

    // Cargar datos laborales
    if sdqDatosTrabajador.FieldByName('ml_idrelacionlaboral').IsNull then
    begin
      InicializarVarRelacionLaboralContrato;
//      LimpiarRelacionLaboral(False);

      FPermitirFecIngresoVacia := True;
    end
    else
    begin
      FIdRelacionLaboral := sdqDatosTrabajador.FieldByName('ml_idrelacionlaboral').AsInteger;
      FContrato          := sdqDatosTrabajador.FieldByName('ml_contrato').AsInteger;
      FTipoRegimen       := GetTipoRegimen(FContrato);

      fraEmpresaDatosLaborales.Contrato      := sdqDatosTrabajador.FieldByName('ml_contrato').AsInteger;



      {$IFDEF ART2}
      fraEstablecimientoDatosLaborales.Value := sdqDatosTrabajador.FieldByName('me_idestablecimiento').AsInteger;
      FEstablecimientoAnterior               := fraEstablecimientoDatosLaborales.Value;
      {$ELSE}
      fraEstablecimientoDatosLaborales.Cargar(sdqDatosTrabajador.FieldByName('em_cuit').AsString, sdqDatosTrabajador.FieldByName('es_nroestableci').AsInteger, False);
      FEstablecimientoAnterior               := fraEstablecimientoDatosLaborales.ID;
      {$ENDIF}

      {$IFDEF AFILIACIONES}
      LoadModalidadPresentacion(fraEmpresaDatosLaborales.Value);
      LoadFechaMiSimplificacion(fraEmpresaDatosLaborales.CUIT);
      {$ENDIF}


      cmbRL_FECHAINGRESO.Date                  := sdqDatosTrabajador.FieldByName('ml_fechaingreso').AsDateTime;
      FFechaIngreso                            := sdqDatosTrabajador.FieldByName('ml_fechaingreso').AsDateTime;
      cmbRL_FECHARECEPCION.Date                := sdqDatosTrabajador.FieldByName('ml_fecharecepcion').AsDateTime;


      {$IFDEF RED_PRES}
      fraRL_IDMODALIDADCONTRATACION.Codigo     := sdqDatosTrabajador.FieldByName('ml_idmodalidadcontratacion').AsString;
      fraLugarDeTrabajo.Value                 := sdqDatosTrabajador.FieldByName('rp_idlugartrabajo').AsString;
      FLugarTrabajoAnterior                    := StrToIntDef(fraLugarDeTrabajo.Value, 0);
      {$ELSE}
      fraRL_IDMODALIDADCONTRATACION.Value      := sdqDatosTrabajador.FieldByName('ml_idmodalidadcontratacion').AsInteger;
      fraLugarDeTrabajo.Value                  := sdqDatosTrabajador.FieldByName('rp_idlugartrabajo').AsInteger;
      FLugarTrabajoAnterior                    := fraLugarDeTrabajo.Value;
      {$ENDIF}

      {$IFDEF ART2}
      fraHorasTrabajadas.Value := sdqDatosTrabajador.FieldByName('mp_rangohstrabaja').AsInteger;
      {$ELSE}
      fraHorasTrabajadas.Codigo := sdqDatosTrabajador.FieldByName('mp_rangohstrabaja').AsString;
      {$ENDIF}

      fraLugarDeTrabajo.Propiedades.ExtraCondition := ' AND lt_contrato = ' + SqlValue(FContrato);

      edRL_TAREA.Text                          := sdqDatosTrabajador.FieldByName('ml_tarea').AsString;
      fraRL_CIUO.Codigo                        := sdqDatosTrabajador.FieldByName('ml_ciuo').AsString;
      edRL_SECTOR.Text                         := sdqDatosTrabajador.FieldByName('ml_sector').AsString;
      edRL_ULTIMANOMINA.Periodo.Valor          := sdqDatosTrabajador.FieldByName('ml_ultimanomina').AsString;
      edRL_SUELDO.Value                        := sdqDatosTrabajador.FieldByName('ml_sueldo').AsCurrency;
      edRL_CATEGORIA.Text                      := sdqDatosTrabajador.FieldByName('ml_categoria').AsString;
      edRL_USUALTA.Text                        := sdqDatosTrabajador.FieldByName('ml_usualta').AsString;
      cmbRL_FECHAALTA.Date                     := sdqDatosTrabajador.FieldByName('ml_fechaalta').AsDateTime;
      edRL_USUMODIF.Text                       := sdqDatosTrabajador.FieldByName('ml_usumodif').AsString;
      cmbRL_FECHAMODIF.Date                    := sdqDatosTrabajador.FieldByName('ml_fechamodif').AsDateTime;
      chkTrabNoDevengable.Checked              := (sdqDatosTrabajador.FieldByName('ml_estado').AsString = 'S');
      chRL_PREOCUPACIONAL.Checked              := (sdqDatosTrabajador.FieldByName('ml_preocupacional').AsString = 'S');
      chRL_PREEXISTENTE.Checked                := (sdqDatosTrabajador.FieldByName('ml_preexistente').AsString = 'S');
      chkConfirmado.Checked                    := sdqDatosTrabajador.FieldByName('ml_confirmapuesto').AsString = 'N';

      fraOrigenDato.Propiedades.ExtraCondition := '';

      {$IFDEF ART2}
      fraOrigenDato.Value                      := sdqDatosTrabajador.FieldByName('ml_idorigendato').AsInteger;
      {$ELSE}
      fraOrigenDato.Value                      := sdqDatosTrabajador.FieldByName('ml_idorigendato').AsString;
      {$ENDIF}
      FPermitirFecIngresoVacia := (sdqDatosTrabajador.FieldByName('ml_fechaingreso').IsNull);

      VerificarConfirmaPuestoHabilitado(FContrato);
    end;


    // Cargar datos Historico Laboral
    sdqHistoricoLaboral.Close;
    sdqHistoricoLaboral.SQL.Text :=
      'SELECT   aem.em_cuit, co_contrato, aem.em_nombre, chl.hl_tarea, ciu.tb_descripcion, chl.hl_categoria,' +
              ' chl.hl_sueldo, chl.hl_sector, chl.hl_fechaingreso, chl.hl_fechaegreso, chl.hl_fecharecepcion,' +
              ' chl.hl_usualta, chl.hl_fechaalta, hl_bajaempresa, hl_motivobaja, motib.tb_descripcion motivo_baja' +
         ' FROM chl_historicolaboral chl, aco_contrato aco, aem_empresa aem, ctb_tablas ciu, ctb_tablas motib' +
        ' WHERE chl.hl_contrato = aco.co_contrato' +
          ' AND aco.co_idempresa = aem.em_id' +
          ' AND chl.hl_ciuo = ciu.tb_codigo(+)' +
          ' AND ciu.tb_clave(+) = ''TAREA''' +
          ' AND chl.hl_idtrabajador = :idtrabajador' +
          ' AND hl_motivobaja = motib.tb_codigo(+)' +
          ' AND motib.tb_clave(+) = ''MOTIB''' +
     ' ORDER BY NVL(chl.hl_fechaingreso, chl.hl_fechaegreso)';
    OpenQueryEx(sdqHistoricoLaboral, [FIdTrabajador]);

    // Cargar datos nóminas dgi
    sdqDGI.Close;
    sdqDGI.SQL.Text :=
      'SELECT   /*+ INDEX(ZNR_NOMREC INX_ZNRCUILCUIT)*/' +
              ' DECODE (nr_recep, 3, NULL, art.utiles.periodo_ponerbarra (nr_period)) periodo, nr_fecre,'+
              ' nr_remimss importe, nr_cuit cuit,' +
              ' afiliacion.get_nombreempresa(nr_cuit) em_nombre, nr_fecreempre,' +
              ' DECODE (nr_recep, 3, art.utiles.periodo_ponerbarra (nr_period),' +
              '                   4, art.utiles.periodo_ponerbarra (nr_period), NULL) AS periododkt,' +
              ' DECODE(nr_recep, 1, ''AFIP'', 2, ''Carga Manual'', 3, ''Diskette'', 4, ''Mixto'') AS DKT,' +
              ' (SELECT dt_remuneraciontotal' +
              '    FROM emi.iev_estadoverificado, emi.idt_ddjjtrabajador, emi.idj_ddjj' +
              '   WHERE dt_idddjj = dj_id' +
              '  AND dj_contrato = :contrato ' +
              '    AND dj_periodo = nr_period' +
              '    AND dt_cuil = tj_cuil' +
              '    AND dj_estado = ev_id' +
              '    AND ev_estado || '''' = ''A'') remuneracion' +
         ' FROM znr_nomrec, ctj_trabajador' +
        ' WHERE nr_cuil = tj_cuil' +
          ' AND tj_id = :id' +
     ' ORDER BY nr_period, nr_cuit';
    OpenQueryEx(sdqDGI, [sdqDatosTrabajador.FieldByName('ml_contrato').AsInteger, FIdTrabajador]);
  end;
end;

procedure TfrmContratoTrabajador.InicializarComboTrabajadoresDelContrato(aCuil, aNombreBuscado: String; aContrato: Integer);
var
  sSql: String;
begin
  sSql :=
    'SELECT tj_nombre, tj_cuil, tj_id, em_nombre, em_cuit, rl_id, co_contrato, co_fechabaja,' +
          ' afiliacion.check_cobertura(co_contrato) esbaja' +
     ' FROM ctj_trabajador, crl_relacionlaboral, aco_contrato, aem_empresa';

  if aContrato <> 0 then
  begin
    sSql := sSql +
     ' WHERE tj_id = rl_idtrabajador' +
       ' AND rl_contrato = co_contrato' +
       ' AND co_idempresa = em_id' +
       ' AND co_contrato = ' + SqlValue(aContrato);

    if aCuil <> '' then
    begin
      if IsDni(aCuil) then
        sSql := sSql + ' AND tj_documento = ' + SqlValue(aCuil)
      else
        sSql := sSql + ' AND tj_cuil = ' + SqlValue(aCuil);
    end
  end
  else
  begin
    sSql := sSql +
     ' WHERE tj_id = rl_idtrabajador(+)' +
       ' AND rl_contrato = co_contrato(+)' +
       ' AND co_idempresa = em_id(+)';

    if aCuil <> '' then
    begin
      if IsDni(aCuil) then
        sSql := sSql + ' AND tj_documento = ' + SqlValue(aCuil)
      else
        sSql := sSql + ' AND tj_cuil = ' + SqlValue(aCuil);
    end;
  end;

  if aNombreBuscado <> '' then
    sSql := sSql + ' AND tj_nombre LIKE ' + SqlValue(aNombreBuscado + '%');

  if EsUsuarioDeTercerizadora  then
    if FDate = 0 then
      sSql := sSql + ' AND siniestro.is_trabenempresatercerizada(tj_documento, actualdate) = ''S'''
    else
      sSql := sSql + ' AND siniestro.is_trabenempresatercerizada(tj_documento, ' + SqlDate(FDate) + ') = ''S''';

  sdqNombresTrabajadores.SQL.Text := sSql + ' ORDER BY co_contrato, tj_nombre';
  OpenQuery(sdqNombresTrabajadores);
end;

procedure TfrmContratoTrabajador.cmbTJ_NOMBREDropDown(Sender: TObject);
begin
  InicializarComboTrabajadoresDelContrato(Trim(edTJ_CUIL.Text), cmbTJ_NOMBRE.Text, fraEmpresaFiltro.Contrato)
end;

procedure TfrmContratoTrabajador.tbCuentasBancariasClick(Sender: TObject);
begin
  {$IFNDEF NO_CUENTAPAGO}
  if (Funcion = fsModificar) and (FIdTrabajador <> ART_EMPTY_ID) then
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    try
      Execute('TA', FIdTrabajador, '');
    finally
      Free;
    end
  else
    MsgBox('Para poder dar de alta cuentas bancarias, el trabajador debe estar en modo [MODIFICACION].');
  {$ENDIF}
end;

procedure TfrmContratoTrabajador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmContratoTrabajador := nil;

  {$IFDEF AFILIACIONES}
  frmPrincipal.mnuMantenimientoDeTrabajadores.Enabled := True;
  {$ENDIF}

  inherited;
end;

procedure TfrmContratoTrabajador.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if fraTelefonoTrabajador.HasChanges then
    if not MsgAsk('Se han realizado cambios en los datos del trabajador.' + CRLF + CRLF + '¿Desea DESCARTAR dichos cambios y salir?') then
      CanClose := False;
end;

procedure TfrmContratoTrabajador.tbEstablecimientosClick(Sender: TObject);
begin
  if (Funcion = fsModificar) and (FIdRelacionLaboral <> ART_EMPTY_ID) then // este es el único caso en el que hay
  begin                                                                    // trabajador y relación laboral seleccionados
    if GetContratoRelacionLaboral(FIdRelacionLaboral) = fraEmpresaDatosLaborales.edContrato.Value then
    begin
      with TfrmEstablecimientosTrabajador.Create(Self) do
      try
        DoCargarDatos(FIdRelacionLaboral, cmbRL_FECHAINGRESO.Date);
        ShowModal;
        if RelacionLaboralEliminada then
          CargarDatosTrabajador(FIdTrabajador, FIdRelacionLaboral);
      finally
        Free;
      end;
    end
    else
      MsgBox('Debe grabar previamente los datos laborales del trabajador.');
  end
  else
    MsgBox('Para poder cargar los establecimientos del trabajador debe estar en modo [MODIFICACION], y éste debe tener datos laborales cargados.');
end;

procedure TfrmContratoTrabajador.fraEmpresaDatosLaboralesOnChange(Sender: TObject);
begin
  FContrato := fraEmpresaDatosLaborales.Contrato;
  FTipoRegimen := GetTipoRegimen(FContrato);
  if fraEmpresaDatosLaborales.edContrato.Text <> '' then
  begin
    If Is_DDJJEmptyUltPeriodo(fraEmpresaDatosLaborales.edContrato.Value) and
       Is_EmpresaPagoSUSS(fraEmpresaDatosLaborales.edContrato.Value) and
       (FContrato <> fraEmpresaDatosLaborales.edContrato.Value) then
    begin
      MsgBox('La última DDJJ de este contrato, se encuentra sin empleados.', MB_OK + MB_ICONINFORMATION);
    end;

    if (Is_DDJJEmptyUltPeriodo(fraEmpresaDatosLaborales.edContrato.Value)) and (Is_EmpresaPagoSUSS(fraEmpresaDatosLaborales.edContrato.Value)) then
    begin
      if FTipoRegimen = 1 then
        fraOrigenDato.Propiedades.ExtraCondition :=  ' AND od_codigo IN (''MS'') '  //Cristian, cambia la lógica solicitada para el tk 54128. Dado que por el Tk 66096 necesitamos agregarle una condición más.
      else
        if FTipoRegimen = 2 then                                                                     //deberías preguntar a qué régimen pertenece. Si es general que solo este habilitado “MS”
          fraOrigenDato.Propiedades.ExtraCondition :=  ' AND od_codigo IN (''MSCP'', ''DJCP'') ' //sino deberían elegir entre “DJCP o MSCP”. Basándose en el campo co_idtiporegimen
        else
          fraOrigenDato.Propiedades.ExtraCondition :=  ' AND od_codigo IN (''MSCP'', ''DJCP'', ''MS'') ';  //Che en el ticket 66096. Me equivoque en algo. Si es Mixto te tiene que aparecer DJCP MSCP y MS.  Faltaria MS
                                                                                                          //Cuando veas el msj corregilo y dejamelo en pruebas, que me estan pidiendo el exe

    end
    else
      fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''MS'', ''ANX'', ''DJMAN'', ''INICIAL'', ''MSCP'', ''DJCP'') ';

    fraLugarDeTrabajo.Propiedades.ExtraCondition := ' AND lt_contrato = ' + SqlValue(FContrato);

    if (not fraEmpresaDatosLaborales.Locked)  // está dando de alta una nueva relación laboral
      and (FIdTrabajador <> ART_EMPTY_ID) and (GetIdRelacionLaboral(FIdTrabajador, FContrato) <> ART_EMPTY_ID) then
    begin
      MsgBox('La relación laboral ya existe.' + #13 + 'Al momento de grabar, se sustituirán los datos existentes por los nuevos ingresados.');
      FEstablecimientoAnterior := 0;
      fraEstablecimientoDatosLaborales.Clear;

      FLugarTrabajoAnterior := 0;
      fraLugarDeTrabajo.Clear;
    end;
    {$IFDEF AFILIACIONES}
    LoadModalidadPresentacion(fraEmpresaDatosLaborales.Value);
    LoadFechaMiSimplificacion(fraEmpresaDatosLaborales.CUIT);
    {$ENDIF}
    VerificarConfirmaPuestoHabilitado(fraEmpresaDatosLaborales.Contrato);

    if FTipoRegimen = 2 then
      if fraOrigenDato.IsEmpty then
        fraOrigenDato.Codigo := 'DJCP'
      else
        fraOrigenDato.Clear
    else
      fraOrigenDato.Clear;

      {$IFDEF AMEDICA}
        if FTipoRegimen = 3 then
        begin
          fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''SN'', ''RPCP'') ';
          LockControl(fraOrigenDato, False);
        end
        else
        if FTipoRegimen = 2 then
        begin
          fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''RPCP'') ';
          fraOrigenDato.Codigo := 'RPCP';
          LockControl(fraOrigenDato, True);
          LockControl(fraEstablecimientoDatosLaborales, True);
          LockControl(fraLugarDeTrabajo, False);
        end
        else
        if FTipoRegimen = 1 then
          LockControl(fraOrigenDato, True);
      {$ELSE}
        if FTipoRegimen = 3 then
        begin
          if (vtHYS in FValidateType) then
            fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''PR'', ''RPCP'') '
          else if Sesion.Sector = 'HYS' then
            fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''PR'', ''RPCP'') ';
          LockControl(fraOrigenDato, False)
        end
        else
        if FTipoRegimen = 2 then
        begin
          //fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''RPCP'') ';
          if fraOrigenDato.IsEmpty then
            fraOrigenDato.Codigo := 'DJCP';
          //fraOrigenDato.Codigo := 'RPCP';
          LockControl(fraOrigenDato, False);
        end
        else
        if FTipoRegimen = 1 then
          LockControl(fraOrigenDato, False);
      {$ENDIF}
  end
  else
  begin
    FContrato := ART_EMPTY_ID;
    FEstablecimientoAnterior := 0;
    fraEstablecimientoDatosLaborales.Clear;
    FLugarTrabajoAnterior := 0;
    fraLugarDeTrabajo.Clear;
  end;
end;

function TfrmContratoTrabajador.GetContratoRelacionLaboral(aIdRelacionLaboral: TTableId): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT rl_contrato' +
     ' FROM crl_relacionlaboral' +
    ' WHERE rl_id = :id';
  Result := ValorSqlIntegerEx(sSql, [aIdRelacionLaboral]);
end;

procedure TfrmContratoTrabajador.tbNuevaRelacionLaboralClick(Sender: TObject);
begin
  Limpiar(True, False, True);
  LockearControlesRelacionLaboral(False);
end;

procedure TfrmContratoTrabajador.cmbTJ_NOMBREGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (LowerCase(Field.FieldName) = 'co_contrato') and (sdqNombresTrabajadores.FieldByName('esbaja').AsString <> '1') then
    AFont.Color := COL_BAJA;
end;

procedure TfrmContratoTrabajador.tlbLimpiarClick(Sender: TObject);
begin
  Caption := CaptionBase;

  if Funcion <> fsConsultar then
    fraEmpresaFiltro.Clear;

  FEstablecimientoAnterior := 0;
  FLugarTrabajoAnterior := 0;
  fraEstablecimientoDatosLaborales.Clear;
  fraEmpresaDatosLaborales.Clear;
  edTJ_CUIL.Clear;
  cmbTJ_NOMBRE.Clear;
  fraTJ_SEXO.Clear;
  cmbTJ_FNACIMIENTO.Clear;
  fraTJ_ESTADOCIVIL.Clear;
  fraTJ_LATERALIDADDOMINANTE.Clear;
  fraTJ_IDNACIONALIDAD.Clear;
  OnfraTJ_IDNACIONALIDADChange(nil);
  edTJ_OTRANACIONALIDAD.Clear;
  fraDomicilio.Clear;
  edTJ_DOMICILIO.Clear;
  edTelefonoAnt.Clear;
  cmbTJ_DOMICILIODEL.ItemIndex := SetPosDomicilioDel(cmbTJ_DOMICILIODEL.EmptyValue);//cmbTJ_DOMICILIODEL.ItemIndex := -1;
  edTJ_USUALTA.Clear;
  cmbTJ_FECHAALTA.Clear;
  edTJ_USUMODIF.Clear;
  cmbTJ_FECHAMODIF.Clear;
  edTJ_EDIFICIO.Clear;
  edTJ_MAIL.Clear;

  sdqHistoricoLaboral.Close;
  sdqDGI.Close;

  Limpiar(True, True, False);
  LimpiarRelacionLaboral(False);
  fraTelefonoTrabajador.Clear;
  fraTelefonoTrabajador.Initialize(False, 'TT_IDTRABAJADOR', 'TT', 'ATT_TELEFONOTRABAJADOR');
  fraTelefonoTrabajador.FillCombo(True, FIdTrabajador);

  VCLExtra.LockControls([edTJ_CUIL, cmbTJ_NOMBRE, cmbTJ_FNACIMIENTO], False);
end;

procedure TfrmContratoTrabajador.edTJ_CUILKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext (edTJ_CUIL, True, True);
end;

procedure TfrmContratoTrabajador.OnfraTJ_IDNACIONALIDADChange(Sender: TObject);
var
  bNacionalidadExistente: Boolean;
begin
  bNacionalidadExistente := (fraTJ_IDNACIONALIDAD.Codigo <> '7');

  VCLExtra.LockControl(edTJ_OTRANACIONALIDAD, bNacionalidadExistente);
  if bNacionalidadExistente then
    edTJ_OTRANACIONALIDAD.Clear;
end;

function TfrmContratoTrabajador.PermitirModificarFechaNacimiento(const aCuil: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes, scp_conpago, sle_liquiempsin' +
    ' WHERE cp_tipo IN(''M'', ''P'')' +   // P=ILP M=Mortal
      ' AND le_conpago = cp_conpago' +
      ' AND le_faprobado IS NOT NULL' +
      ' AND le_siniestro = ex_siniestro' +
      ' AND le_orden = ex_orden' +
      ' AND le_recaida = ex_recaida' +
      ' AND ex_cuil = :cuil';
  Result := (Seguridad.Claves.IsActive('PermitirModificarFNacimiento') or (not ExisteSqlEx(sSql, [SacarGuiones(aCuil)])));
end;

function TfrmContratoTrabajador.SetPosDomicilioDel(aDomicilioDel: String): Integer;
var
  iLoop: Integer;
begin
  Result := -1;

  if (aDomicilioDel = '') then
    aDomicilioDel := cmbTJ_DOMICILIODEL.EmptyValue;

  for iLoop := 0 to cmbTJ_DOMICILIODEL.Items.Count - 1 do
    if cmbTJ_DOMICILIODEL.Items[iLoop] = aDomicilioDel then
    begin
      Result := iLoop;
      Exit;
    end;
end;

function TfrmContratoTrabajador.GetDomicilioDel: String;
var
  sSql: String;
begin
  if (cmbTJ_DOMICILIODEL.ItemIndex = -1) or (cmbTJ_DOMICILIODEL.Items[cmbTJ_DOMICILIODEL.ItemIndex] = cmbTJ_DOMICILIODEL.EmptyValue) then
  begin
    Result := '';//SQL_NULL;
    Exit;
  end;

  sSql :=
    'SELECT tb_codigo' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''DOMDE''' +
      ' AND tb_descripcion = :descripcion';
  Result := ValorSqlEx(sSql, [cmbTJ_DOMICILIODEL.Items[cmbTJ_DOMICILIODEL.ItemIndex]], '');
end;

procedure TfrmContratoTrabajador.mnuLimpiarClick(Sender: TObject);
begin
  cmbTJ_DOMICILIODEL.ItemIndex := SetPosDomicilioDel(cmbTJ_DOMICILIODEL.EmptyValue);
end;

procedure TfrmContratoTrabajador.btnPrimeroClick(Sender: TObject);
begin
  sdqMiSimplificacion.Last;
end;

procedure TfrmContratoTrabajador.btnAnteriorClick(Sender: TObject);
begin
  sdqMiSimplificacion.Next
end;

procedure TfrmContratoTrabajador.btnSiguienteClick(Sender: TObject);
begin
  sdqMiSimplificacion.Prior;
end;

procedure TfrmContratoTrabajador.btnUltimoClick(Sender: TObject);
begin
  sdqMiSimplificacion.First;
end;

procedure TfrmContratoTrabajador.sdqMiSimplificacionAfterScroll(DataSet: TDataSet);
begin
  CargarDatosMiSimplificacion;

  LockControls([btnPrimero, btnAnterior], (sdqMiSimplificacion.RecNo = (sdqMiSimplificacion.RecordCount {$IFDEF VER150}- 1{$ENDIF})));
  LockControls([btnSiguiente, btnUltimo], (sdqMiSimplificacion.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF}));
end;

procedure TfrmContratoTrabajador.btnPrimeroTrabajadorClick(Sender: TObject);
begin
  sdqDatosTrabajador.Last;
end;

procedure TfrmContratoTrabajador.btnAnteriorTrabajadorClick(Sender: TObject);
begin
  sdqDatosTrabajador.Next;
end;

procedure TfrmContratoTrabajador.btnSiguienteTrabajadorClick(Sender: TObject);
begin
  sdqDatosTrabajador.Prior;
end;

procedure TfrmContratoTrabajador.btnUltimoTrabajadorClick(Sender: TObject);
begin
  sdqDatosTrabajador.First;
end;

procedure TfrmContratoTrabajador.sdqDatosTrabajadorAfterScroll(DataSet: TDataSet);
begin
  LimpiarRelacionLaboral(False);
  CargarDatosTrabajadorEnControles;
end;

procedure TfrmContratoTrabajador.CargarDatosTrabajadorEnControles;
begin
  CargarDatosTrabajadorMasLaborales;

  LockControls([btnPrimeroTrabajador, btnAnteriorTrabajador], (sdqDatosTrabajador.RecNo = (sdqDatosTrabajador.RecordCount {$IFDEF VER150}- 1{$ENDIF})));
  LockControls([btnSiguienteTrabajador, btnUltimoTrabajador], (sdqDatosTrabajador.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF}));




  // Si no es el primero, lockeo los controles..
  LockearControlesTrabajador((sdqDatosTrabajador.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF}));
  LockearControlesRelacionLaboral((sdqDatosTrabajador.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF}));
  LockearOrigenDato(True);
  VCLExtra.LockControls([edTJ_CUIL], True);

  if (sdqDatosTrabajador.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF}) then
  begin
    case FTipoRegimen of
      1:
      begin
        LockControl(fraEstablecimientoDatosLaborales, False);
        LockControl(fraLugarDeTrabajo, True);
      end;
      2:
      begin
        LockControl(fraEstablecimientoDatosLaborales, True);
        LockControl(fraLugarDeTrabajo, False);
        if fraOrigenDato.IsEmpty then
          fraOrigenDato.Codigo := 'DJCP';
      end;
      3:
      begin
        LockControl(fraEstablecimientoDatosLaborales, False);
        LockControl(fraLugarDeTrabajo, False);
      end;
    end;

    if (FTipoRegimen = 2) or (FTipoRegimen = 3) then
    begin
      if (fraOrigenDato.Codigo = 'MSCP') or (fraOrigenDato.Codigo = 'RPCP') or (fraOrigenDato.Codigo = 'DJCP')  then
      begin
        LockControl(fraHorasTrabajadas, False);
      end
      else
      begin
        LockControl(fraHorasTrabajadas, True);
      end
    end
    else
    begin
      fraHorasTrabajadas.Clear;
      LockControl(fraHorasTrabajadas, True);
    end;
  end;
end;

procedure TfrmContratoTrabajador.ShortCutControlShortCuts10ShortCutPress(Sender: TObject);
begin
  cmbRL_FECHAINGRESO.SetFocus;
end;

function TfrmContratoTrabajador.GetSituacionRevista(const aCuit, aCuil, aPeriodo, aCodigo: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT tm_descripcion' +
     ' FROM emi.itm_topemasas' +
    ' WHERE tm_codigo = :codigo' +
      ' AND tm_procedencia IN(''T'', ''S'')' +
      ' AND tm_periodovigenciadesde <= TO_CHAR(art.actualdate, ''YYYYMM'')' +
      ' AND (   tm_periodovigenciahasta >= TO_CHAR(art.actualdate, ''YYYYMM'')' +
           ' OR tm_periodovigenciahasta IS NULL)';
  Result := ValorSqlEx(sSql, [aCodigo]);
  if Result <> '' then
    Result := aCodigo + ' - ' + Result;
end;

function TfrmContratoTrabajador.GuardarTrabajador(const aIdTrabajador: Integer): Integer;
var
{$IFNDEF AMEDICA}
  sFileName: String;
{$ENDIF}
  sSql: String;
begin
  with sdspSaveTrabajador do
  begin
    ParamByName('id').Value                      := IIF((aIdTrabajador = -1), NULL, aIdTrabajador);
    ParamByName('calle').AsString                := fraDomicilio.Calle;
    ParamByName('cpostal').AsString              := fraDomicilio.CodigoPostal;
    ParamByName('cpostala').AsString             := fraDomicilio.CPA;
    ParamByName('cuil').AsString                 := edTJ_CUIL.Text;
    ParamByName('departamento').AsString         := fraDomicilio.Departamento;
    ParamByName('domiciliodel').AsString         := GetDomicilioDel;
    ParamByName('estadocivil').AsString          := fraTJ_ESTADOCIVIL.Value;
    ParamByName('fechamovi').AsDateTime          := DBDateTime;

    if cmbTJ_FNACIMIENTO.Date > 0 then
      ParamByName('fnacimiento').AsDateTime      := cmbTJ_FNACIMIENTO.Date
    else
    	ParamByName('fnacimiento').Value					 := NULL;

    ParamByName('idnacionalidad').AsInteger      := StrToIntDef(fraTJ_IDNACIONALIDAD.Codigo, 0);
    ParamByName('lateralidaddominante').AsString := fraTJ_LATERALIDADDOMINANTE.Value;
    ParamByName('localidad').AsString            := fraDomicilio.Localidad;
    ParamByName('nombre').AsString               := Trim(cmbTJ_NOMBRE.Text);
    ParamByName('numero').AsString               := fraDomicilio.Numero;
    ParamByName('origen').AsString               := FOrigen;
    ParamByName('otranacionalidad').AsString     := edTJ_OTRANACIONALIDAD.Text;
    ParamByName('piso').AsString                 := fraDomicilio.Piso;
    ParamByName('provincia').AsInteger           := ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                       ' FROM cpv_provincias' +
                                                                      ' WHERE pv_descripcion = :provincia',
                                                                      [fraDomicilio.Provincia], 0);
    ParamByName('sexo').AsString                 := fraTJ_SEXO.Value;
    ParamByName('telefono').AsString             := edTelefonoAnt.Text;
    ParamByName('usuario').AsString              := Sesion.UserId;
    ParamByName('edificio').AsString             := edTJ_Edificio.Text;
    ParamByName('email').AsString                := edTJ_MAIL.Text;

    {$IFDEF AMEDICA}
      ParamByName('modulo').AsString := 'S';
    {$ELSE}
      if (vtHYS in FValidateType) then
        ParamByName('modulo').AsString := 'H'
      else
      begin
        sFileName := UpperCase(Copy(ExtractFileName(Application.ExeName), 1, 7));
        ParamByName('modulo').AsString := IIF((sFileName = 'MANTRAB'), 'S', 'A');
      end;
    {$ENDIF}

    sSql :=
      'SELECT 1' +
       ' FROM art.sex_expedientes' +
      ' WHERE ex_idtrabajador = :id' +
        ' AND NVL(ex_causafin, ''0'') NOT IN(''02'', ''95'')';

    pnlAlertaDomicilio.Visible := (aIdTrabajador > -1) and (ParamByName('modulo').AsString = 'A') and
                                  (ExisteSqlEx(sSql, [aIdTrabajador]));
    ExecProc;

    if ParamByName('error').AsInteger = 0 then
    begin
      fraTelefonoTrabajador.CopiarTempATelefonos(ParamByName('id').AsInteger);
      fraTelefonoTrabajador.QuitarTelefonosTemporales;

      sSql :=
        'SELECT 1' +
         ' FROM att_telefonotrabajador' +
        ' WHERE tt_idtrabajador = :id';
      if ExisteSqlEx(sSql,[ParamByName('id').AsInteger]) then
      begin
        sSql :=
          'UPDATE ctj_trabajador' +
            ' SET tj_telefono = (SELECT SUBSTR(art.afi.get_telefonos(''ATT_TELEFONOTRABAJADOR'', tj_id), 1, 30)' +
                                 ' FROM ctj_trabajador' +
                                ' WHERE tj_id = :id)' +
          ' WHERE tj_id = :id';
        EjecutarSQLSTEx(sSql, [ParamByName('id').AsInteger]);
      end;
      Result := ParamByName('id').AsInteger;
    end
    else
      raise Exception.Create(Format('%s [%d]', [ParamByName('desc_error').AsString, ParamByName('error').AsInteger]));
  end;
end;

procedure TfrmContratoTrabajador.btnCerrarClick(Sender: TObject);
begin
  fpComisionMedica.Close;
end;

procedure TfrmContratoTrabajador.fpComisionMedicaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpComisionMedica.Close;
end;

procedure TfrmContratoTrabajador.tbComisionMedicaClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT art.inca.get_comisiontrabajador(tj_cuil)' +
     ' FROM ctj_trabajador' +
    ' WHERE tj_id = :id';
  memoComisionMedica.Lines.Text := ValorSqlEx(sSql, [FIdTrabajador]);

  fpComisionMedica.ShowModal;
end;

procedure TfrmContratoTrabajador.cmbTJ_FNACIMIENTOValidate(Sender: TObject; var Cancel: Boolean);
begin
  // Si ponen como fecha de nacimiento algún año superior en 10 años al año actual, le resto cien años, esto lo hago
  // por ejemplo para los casos donde cargan "01/01/45", y que salga como "01/01/1945"..
  if cmbTJ_FNACIMIENTO.Date > DBDate + 10 then
    cmbTJ_FNACIMIENTO.Date := IncYear(cmbTJ_FNACIMIENTO.Date, -100);
end;
                                 
procedure TfrmContratoTrabajador.LockearOrigenDato(const aLock: Boolean);
{$IFNDEF AMEDICA}
var
  sFileName: String;
{$ENDIF}
begin
  fraOrigenDato.Propiedades.ExtraCondition := '';

  {$IFDEF AMEDICA}
    case FTipoRegimen of
      3:
      begin
        fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''RPCP'', ''SN'') ';
        LockControl(fraOrigenDato, False);
      end;
      2:
      begin
        fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''DJCP'') ';
        LockControl(fraOrigenDato, True);
      end;
      1:
        LockControl(fraOrigenDato, True);
      else
        LockControl(fraOrigenDato, True);
    end;

  {$ELSE}
    if (vtHYS in FValidateType) then
      LockControl(fraOrigenDato, True)
    else if Sesion.Sector = 'HYS' then
      LockControl(fraOrigenDato, True)
    else
    begin
      sFileName := UpperCase(Copy(ExtractFileName(Application.ExeName), 1, 7));
      if sFileName = 'MANTRAB' then
        LockControl(fraOrigenDato, True)
      else
      begin
        LockControl(fraOrigenDato, aLock);
        if not aLock then
          fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''MS'', ''ANX'', ''DJMAN'', ''INICIAL'', ''MSCP'', ''DJCP'') ';
      end;
    end;
  {$ENDIF}
end;

procedure TfrmContratoTrabajador.ShortCutControlShortCuts11ShortCutPress(Sender: TObject);
begin
  fraOrigenDato.edCodigo.SetFocus;
end;

procedure TfrmContratoTrabajador.cmbTJ_FNACIMIENTOExit(Sender: TObject);
begin
  if (StrToIntDef(Copy(edTJ_CUIL.Text, 3, 8), 0) < 10000000) and (cmbTJ_FNACIMIENTO.Date >= StrToDate('01/01/1951')) then
    InfoHint(cmbTJ_FNACIMIENTO, 'La fecha de nacimiento no debería ser posterior al año 1950 si el número de documento es menor a 10.000.000.', False, 'Advertencia', blnInfo, 3, False);
  if (StrToIntDef(Copy(edTJ_CUIL.Text, 3, 8), 0) >= 10000000) and (cmbTJ_FNACIMIENTO.Date < StrToDate('01/01/1951')) then
    InfoHint(cmbTJ_FNACIMIENTO, 'La fecha de nacimiento no debería ser anterior al año 1951 si el número de documento es mayor a 10.000.000.', False, 'Advertencia', blnInfo, 3, False);
end;

procedure TfrmContratoTrabajador.MostrarLeyendaSiniestros(aCuil: String);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_estado = ''01''' +
      ' AND ex_cuil = :cuil';
  pnAvisoSiniestroActivo.Visible := ExisteSqlEx(sSql, [aCuil]);
end;

procedure TfrmContratoTrabajador.fraTelefonoTrabajadorbtnABMTelefonosClick(Sender: TObject);
begin
  if edTelefonoAnt.Visible then
    ShowMessage('Incluir todos los teléfonos registrados anteriormente al formato de lista.');

  fraTelefonoTrabajador.btnABMTelefonosClick(Sender);

  if (fraTelefonoTrabajador.HasChanges) and (edTelefonoAnt.Visible) then
  begin
    edTelefonoAnt.Hide;
    fraTelefonoTrabajador.cmbTelefonos.Show;
  end;
end;

{$IFDEF AFILIACIONES}
procedure TfrmContratoTrabajador.LoadModalidadPresentacion(const aIdEmpresa: Integer);
var
  sSql: String;
begin
  sSql :=
    'SELECT mp_descripcion, mp_id' +
     ' FROM emi.imp_modopresentacion' +
    ' WHERE mp_id = emi.utiles.get_modopresentacion(:idempresa, :periodo)';
  with GetQueryEx(sSql, [aIdEmpresa, FormatDateTime('yyyymm', IncMonth(DBDate, -1))]) do
  try
    edModalidadPresentacion.Text := FieldByName('mp_descripcion').AsString;
    if FieldByName('mp_id').AsInteger = 1 then
      edModalidadPresentacion.Color := clRed
    else if FieldByName('mp_id').AsInteger = 2 then
      edModalidadPresentacion.Color := clGreen
    else if FieldByName('mp_id').AsInteger = 3 then
      edModalidadPresentacion.Color := clGreen
    else
      edModalidadPresentacion.Color := clBtnFace;
  finally
    Free;
  end;
end;

procedure TfrmContratoTrabajador.LoadFechaMiSimplificacion(const aCuit: String);
var
  sSql: String;
begin
  sSql :=
   // 'SELECT afiliacion.get_idultimatafechaMS(:cuit) as fecha from DUAL';  //En esta funcion, por alguna razon extraña
    'SELECT MAX(mi_fechamov) fecha' +                                    //Oracle decide no usar los indices
     ' FROM cmi_miregistro' +
    ' WHERE mi_cuit = :cuit';
  with GetQueryEx(sSql, [aCuit]) do
  try
    if not FieldByName('fecha').IsNull then
    begin
      edMiSimplificacion.Text := FieldByName('fecha').AsString;
      edMiSimplificacion.Color := clBlue;
      edMiSimplificacion.Font.Color := clWhite;
    end
    else
    begin
      edMiSimplificacion.Text := 'NO';
      edMiSimplificacion.Color := clPurple;
      edMiSimplificacion.Font.Color := clWhite;
    end;
  finally
    Free;
  end;
end;
{$ELSE}
procedure TfrmContratoTrabajador.HideMiSimplificacion;
begin
  lbAfip.Hide;
  edModalidadPresentacion.Hide;
  lbMiSimpl.Hide;
  edMiSimplificacion.Hide;
end;
{$ENDIF}
procedure TfrmContratoTrabajador.tbGuardarSoloTrabajadorClick(
  Sender: TObject);
begin
  if HuboCambiosRelacionLaboral then
    if not MsgAsk('Se detectaron cambios en la relación laboral, pero solo se guardaran los datos del trabajador. ¿Continuar de todas formas?') then
      Abort;
  CargarDatosTrabajadorMasLaborales(True);
  tbGuardarClick(tbGuardarSoloTrabajador); //tiene el sender para que muestre el mensaje de guardar ok
end;

function TfrmContratoTrabajador.ValidarTrabajador: Boolean;
var
  bExisteCuil: Boolean;
  dFecActual: TDateTime;
  iEdad: Integer;
  sCuilValido: String;
begin
  dFecActual := DBDate;
  FActualizarCRE_RELACIONESTABLECIMIENTO := False;
  FActualizarCRP_RELALUGARTRABAJO := False;
  bExisteCuil := ExisteCuil(edTJ_CUIL.Text);

  Verificar((edTJ_CUIL.Text = ''), edTJ_CUIL, 'La C.U.I.L. es obligatoria.');
  Verificar(fraTJ_SEXO.IsEmpty, fraTJ_SEXO.edCodigo, 'Identificar el sexo es obligatorio.');

  if IsCuil(edTJ_CUIL.Text) then
  begin
    if Funcion = fsAgregar then
    begin
      Verificar(bExisteCuil, edTJ_CUIL, 'Ya existe un trabajador con la C.U.I.L. ingresada.');

      if Is_CUILIndeterminado(edTJ_CUIL.Text) then
        begin
          if Is_GrabarCuilValido(StrMid(edTJ_CUIL.Text, 3, 8), fraTJ_SEXO.Value, sCuilValido) then
            edTJ_CUIL.Text := sCuilValido
          else
            Verificar(not IsEmptyString(sCuilValido), edTJ_CUIL, 'Para el DNI y sexo ingresados, ya existe la C.U.I.L. ' + PonerGuiones(sCuilValido) + '.');
        end;
    end;
  end
  else
  begin
    if bExisteCuil then
      MsgBox('El número ingresado ya existe y no es una C.U.I.L. válida.', MB_ICONINFORMATION + MB_OK)
    else
      Verificar(True, edTJ_CUIL, 'El número ingresado no es una C.U.I.L. válida.');
  end;

  Verificar((cmbTJ_NOMBRE.Text = ''), cmbTJ_NOMBRE, 'El Nombre es obligatorio.');

  Verificar((vtHYS in FValidateType) and (fraTJ_IDNACIONALIDAD.IsEmpty), fraTJ_IDNACIONALIDAD.cmbDescripcion , 'Debe indicar la nacionalidad del trabajador.');
  Verificar((fraTJ_IDNACIONALIDAD.Codigo = '7') and IsEmptyString(edTJ_OTRANACIONALIDAD.Text), edTJ_OTRANACIONALIDAD, 'Debe indicar la nacionalidad del trabajador.');
  Verificar((fraTJ_IDNACIONALIDAD.Codigo <> '7') and not IsEmptyString(edTJ_OTRANACIONALIDAD.Text), edTJ_OTRANACIONALIDAD, 'Solo puede ingresar la nacionalidad si eligió Otros.');

  Verificar((vtHYS in FValidateType) and (fraTJ_ESTADOCIVIL.IsEmpty), fraTJ_ESTADOCIVIL.cmbDescripcion , 'Debe indicar el estado civil del trabajador.');
  Verificar((vtHYS in FValidateType) and (cmbTJ_FNACIMIENTO.IsEmpty), cmbTJ_FNACIMIENTO, 'Debe indicar la fecha de nacimiento del trabajador.');

  // E-mail
  if edTJ_MAIL.Text <> '' then
    Verificar(not IsEMails(edTJ_MAIL.Text + ';'), edTJ_MAIL, 'El e-Mail no es correcto.');

  if not cmbTJ_FNACIMIENTO.IsEmpty then
  begin
    iEdad := GetAge(cmbTJ_FNACIMIENTO.Date, dFecActual);
    Verificar((iEdad <= 16) or (iEdad >= 90), cmbTJ_FNACIMIENTO, 'La edad del trabajador tiene que estar entre los 16 y los 90 años.');
  end;

  if (((Sesion.Sector = 'AFI') or (Sesion.Sector = 'ATCLI') or (Sesion.Sector = 'AFINOM')) and not (cmbRL_FECHAINGRESO.IsEmpty)) and
      (fraOrigenDato.Codigo <> 'INICIAL') then
  begin
    if not Is_FechaIngresoAltaRelacionLaboralOk(cmbRL_FECHAINGRESO.Date, edTJ_CUIL.Text, fraEmpresaDatosLaborales.Contrato) then
      if MsgBox('La fecha de ingreso difiere en 2 meses o mas, a la fecha del registro actual en el Cuil ' + edTJ_CUIL.Text +'.' + #13#10 +
                '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
        Abort;
      if (not Is_FechaIngresoVigenciaDesdeIngresoTrabajadorOk(cmbRL_FECHAINGRESO.Date, fraEmpresaDatosLaborales.Contrato)) then
        if MsgBox('La fecha de ingreso es menor a la vigencia desde del contrato ' + edTJ_CUIL.Text +'.' + #13#10 +
                  '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
          Abort;
    end;

  if edTJ_DOMICILIO.Text <> '' then
    fraDomicilio.ValidarDomicilio('Debe ingresar el domicilio del trabajador.');

  if (not fraDomicilio.IsEmpty) and (not fraDomicilio.IsValid) then
    Abort;

  if not fraDomicilio.ValidarPermisoCalle then
    Abort;

  if not fraDomicilio.ValidarCPA('El Código Postal Argentino no es correcto.') then
    Abort;

  Result := True;
end;

procedure TfrmContratoTrabajador.VerificarConfirmaPuestoHabilitado(
  const aContrato: TTableId);
var
  sSql : String;
begin
  sSql := 'SELECT ct_id ' +
          '  FROM afi.act_cont_trab_noconf ' +
          ' WHERE ct_contrato = :contrato' ;
  chkConfirmado.Enabled :=  ExisteSqlEx(sSql, [FContrato]);
end;

function TfrmContratoTrabajador.HuboCambiosRelacionLaboral: Boolean;
begin
  if FFuncion <> fsAgregar then
    Result := not(
      (fraEmpresaDatosLaborales.Contrato = sdqDatosTrabajador.FieldByName('ml_contrato').AsInteger) and
      {$IFDEF ART2}
      (fraEstablecimientoDatosLaborales.Value = sdqDatosTrabajador.FieldByName('me_idestablecimiento').AsInteger) and
      {$ENDIF}
      (cmbRL_FECHAINGRESO.Date                  = sdqDatosTrabajador.FieldByName('ml_fechaingreso').AsDateTime) and
      (cmbRL_FECHARECEPCION.Date                = sdqDatosTrabajador.FieldByName('ml_fecharecepcion').AsDateTime) and
      {$IFDEF RED_PRES}
      (fraRL_IDMODALIDADCONTRATACION.Codigo     = sdqDatosTrabajador.FieldByName('ml_idmodalidadcontratacion').AsString) and
      (fraLugarDeTrabajo.Codigo                  = sdqDatosTrabajador.FieldByName('rp_idlugartrabajo').AsString) and
      {$ELSE}
      (fraRL_IDMODALIDADCONTRATACION.Value      = sdqDatosTrabajador.FieldByName('ml_idmodalidadcontratacion').AsInteger) and
      (fraLugarDeTrabajo.Value                  = sdqDatosTrabajador.FieldByName('rp_idlugartrabajo').AsInteger) and
      {$ENDIF}
      (edRL_TAREA.Text                          = sdqDatosTrabajador.FieldByName('ml_tarea').AsString) and
      (fraRL_CIUO.Codigo                        = sdqDatosTrabajador.FieldByName('ml_ciuo').AsString) and
      (edRL_SECTOR.Text                         = sdqDatosTrabajador.FieldByName('ml_sector').AsString) and
      (edRL_ULTIMANOMINA.Periodo.Valor          = sdqDatosTrabajador.FieldByName('ml_ultimanomina').AsString) and
      (edRL_SUELDO.Value                        = sdqDatosTrabajador.FieldByName('ml_sueldo').AsCurrency) and
      (edRL_CATEGORIA.Text                      = sdqDatosTrabajador.FieldByName('ml_categoria').AsString) and
      (edRL_USUALTA.Text                        = sdqDatosTrabajador.FieldByName('ml_usualta').AsString) and
      (edRL_USUMODIF.Text                       = sdqDatosTrabajador.FieldByName('ml_usumodif').AsString) and
      (chkTrabNoDevengable.Checked              = (sdqDatosTrabajador.FieldByName('ml_estado').AsString = 'S')) and
      (chRL_PREOCUPACIONAL.Checked              = (sdqDatosTrabajador.FieldByName('ml_preocupacional').AsString = 'S')) and
      (chRL_PREEXISTENTE.Checked                = (sdqDatosTrabajador.FieldByName('ml_preexistente').AsString = 'S')) and
      (chkConfirmado.Checked                    = (sdqDatosTrabajador.FieldByName('ml_confirmapuesto').AsString = 'N')) and

      {$IFDEF ART2}
      (fraHorasTrabajadas.Value                 = sdqDatosTrabajador.FieldByName('mp_rangohstrabaja').AsInteger) and
      {$ELSE}
      (fraHorasTrabajadas.Codigo                = sdqDatosTrabajador.FieldByName('mp_rangohstrabaja').AsString) and
      {$ENDIF}

      {$IFDEF ART2}
      (fraOrigenDato.Value                      = sdqDatosTrabajador.FieldByName('ml_idorigendato').AsInteger))
      {$ELSE}
      (fraOrigenDato.Value                      = sdqDatosTrabajador.FieldByName('ml_idorigendato').AsString))
      {$ENDIF}
  else
    Result := not (
      (fraEmpresaDatosLaborales.IsEmpty) and
      (cmbRL_FECHAINGRESO.IsEmpty) and
      (cmbRL_FECHARECEPCION.IsEmpty) and
      (fraRL_IDMODALIDADCONTRATACION.IsEmpty) and
      (edRL_TAREA.Text = '') and
      (fraRL_CIUO.IsEmpty) and
      (edRL_SECTOR.Text = '') and
      (edRL_ULTIMANOMINA.Periodo.Valor = '') and
      (edRL_SUELDO.Value = 0) and
      (edRL_CATEGORIA.Text = '') and
      (edRL_USUALTA.Text = '') and
      (cmbRL_FECHAALTA.IsEmpty) and
      (edRL_USUMODIF.Text = '') and
      (cmbRL_FECHAMODIF.IsEmpty) and
      (not chkTrabNoDevengable.Checked) and
      (not chRL_PREOCUPACIONAL.Checked) and
      (not chRL_PREEXISTENTE.Checked) and
      (not chkConfirmado.Checked) and
      (fraOrigenDato.IsEmpty));
end;

procedure TfrmContratoTrabajador.fraRL_CIUOExit(Sender: TObject);
begin
  fraRL_CIUO.FrameExit(Sender);
  if not fraRL_CIUO.IsEmpty then
  begin
    edRL_TAREA.Text := fraRL_CIUO.Descripcion;
    if not fraOrigenDato.Locked then
      fraOrigenDato.Codigo := 'MS';
  end;
end;

initialization
  RegisterClasses([TfraEstablecimiento]);

end.
