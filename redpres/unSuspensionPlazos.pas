{********************************************************}
{    Módulo de Suspensión de Plazos                      }
{                                                        }
{    ¡¡¡ESTE MÓDULO UTILIZA CAMPOS PERSISTENTES!!!       }
{                                                        }
{    Autor: Federico Firenze                             }
{           Nelson Lilly Kuster                          }
{    Fecha: 02/2004                                      }
{                                                        }
{   Camarillo: cambio completo de la pantalla:           }
{              unificacion de suspension area medica,    }
{              area siniestros y rechazos.               }
{   Fecha: 11/2006                                       }
{                                                        }
{   Camarillo: reversion de rechazos.                    }
{   Fecha: 04/2007                                       }
{                                                        }
{   LPiparo: Personalizacion de los Siniestros           }
{   (G. Trabajo y Usuario Gestor)                        }
{   Fecha: 04/2008                                       }
{                                                        }
{********************************************************}

unit unSuspensionPlazos;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  Mask, ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcion, SinEdit,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, DBCtrls, FormPanel,
  unfraFirmante, RXDBCtrl, unFraCodDesc, unArtDBAwareFrame, unfraCtbTablas,
  Buttons, Menus, RxToolEdit, RxPlacemnt;

type
  TAccionCita = (None, Alta , Edicion);
  TfrmSuspensionPlazos = class(TfrmCustomConsulta)
    gbFechaReasignacion: TGroupBox;
    Label2: TLabel;
    edFReasigDesde: TDateComboBox;
    edFReasigHasta: TDateComboBox;
    gbDelegacion: TGroupBox;
    gbFVencimSusp: TGroupBox;
    Label3: TLabel;
    edFVtoSuspDesde: TDateComboBox;
    edFVtoSuspHasta: TDateComboBox;
    gbRangoSiniestro: TGroupBox;
    SinDesde: TSinEdit;
    Label5: TLabel;
    SinHasta: TSinEdit;
    cmbDelegacion: TDBCheckCombo;
    dsDelegacion: TDataSource;
    sdqDelegacion: TSDQuery;
    dsTipoAccidente: TDataSource;
    sdqTipoAccidente: TSDQuery;
    gbTipoAccidente: TGroupBox;
    cmbTipoAccidente: TArtComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    gbFVencimRechazo: TGroupBox;
    Label1: TLabel;
    edFVtoRechDesde: TDateComboBox;
    edFVtoRechHasta: TDateComboBox;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaFECHA_ACCIDENTE: TDateTimeField;
    sdqConsultaTA_DESCRIPCIONABREV: TStringField;
    sdqConsultaGRAVEDAD: TStringField;
    sdqConsultaEX_DIAGNOSTICOOMS: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEX_CUIL: TStringField;
    sdqConsultaEX_VENCIMSUSPENSION: TDateTimeField;
    sdqConsultaEX_FECHARECEPCION: TDateTimeField;
    sdqConsultaSUSPPLAZOSIN: TStringField;
    sdqConsultaEX_SUSPPLAZOMED: TStringField;
    sdqConsultaSUSPPLAZOMED: TStringField;
    sdqConsultaTC_CODIGO: TStringField;
    sdqConsultaTC_NOMBRE: TStringField;
    sdqConsultaEX_FECHAALTA: TDateTimeField;
    sdqConsultaEX_USUARIOSUSPSIN: TStringField;
    sdqConsultaEX_USUARIOSUSPMED: TStringField;
    sdqConsultaLG_NOMBRE: TStringField;
    sdqConsultaGP_NOMBRE: TStringField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaCA_DESCRIPCION: TStringField;
    sdqConsultaEX_BREVEDESCRIPCION: TStringField;
    sdqConsultaEX_DIAGNOSTICO: TStringField;
    sdqConsultaFI_FIRMANTE: TStringField;
    sdqConsultaEX_VENCIMRECHAZO: TDateTimeField;
    sdqConsultaEX_RECHAZOSIN: TStringField;
    sdqConsultaEX_USUARIORECHAZOSIN: TStringField;
    sdqConsultaEX_RECHAZOMED: TStringField;
    sdqConsultaEX_USUARIORECHAZOMED: TStringField;
    sdqConsultaTC_CODIGO_1: TStringField;
    sdqConsultaFORM_RECH: TStringField;
    sdqConsultaFIRM_RECH: TStringField;
    fpABM: TFormPanel;
    lblDatSin: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    gbSuspAreaMedica: TGroupBox;
    Bevel3: TBevel;
    gbSuspAreaSiniestros: TGroupBox;
    Bevel4: TBevel;
    Label4: TLabel;
    Label6: TLabel;
    sdqConsultaTJ_ID: TFloatField;
    Bevel5: TBevel;
    gbRechazoAreaMedica: TGroupBox;
    gbRechazoAreaSiniestros: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sdqConsultaFIMPRSUSP: TDateTimeField;
    sdqConsultaFIMPRRECH: TDateTimeField;
    fraFormatoSusp: TfraCodigoDescripcion;
    fraFirmanteSusp: TfraCodigoDescripcion;
    fraFormatoRech: TfraCodigoDescripcion;
    fraFirmanteRech: TfraCodigoDescripcion;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    SinABM: TSinEdit;
    Label8: TLabel;
    edTrabajador: TEdit;
    sdqConsultaIDCARTASUSP: TFloatField;
    sdqConsultaIDCARTARECH: TFloatField;
    sdqConsultaFORMATOSUSP: TStringField;
    sdqConsultaFORMATORECH: TStringField;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    edMotivoRechazo: TMemo;
    Label13: TLabel;
    sdqConsultaOBSRECHAZO: TStringField;
    sdqConsultaESTADO: TStringField;
    gbEstado: TGroupBox;
    rbTodos: TRadioButton;
    rbSuspMed: TRadioButton;
    rbSuspSin: TRadioButton;
    rbRechMed: TRadioButton;
    rbRechSin: TRadioButton;
    sdqConsultaEX_SUSPPLAZOSIN: TStringField;
    sdqConsultaD_RSIN: TStringField;
    sdqConsultaD_RMED: TStringField;
    tbReversion: TToolButton;
    tbSalir2: TToolButton;
    fpReversion: TFormPanel;
    Label14: TLabel;
    fraFormatoRev: TfraCodigoDescripcion;
    Label15: TLabel;
    fraFirmanteRev: TfraCodigoDescripcion;
    btnCancelarRev: TButton;
    btnAceptarRev: TButton;
    Bevel6: TBevel;
    gbRevAMed: TGroupBox;
    fraRevRechAMed: TfraCodigoDescripcion;
    Label16: TLabel;
    Label17: TLabel;
    gbRevASin: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    fraRevRechASin: TfraCodigoDescripcion;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    edSinRev: TSinEdit;
    edTrabajadorRev: TEdit;
    sdqConsultaFIMPRREV: TDateTimeField;
    sdqConsultaEX_REVERSIONSIN: TStringField;
    sdqConsultaEX_REVERSIONMED: TStringField;
    pnlRevAMed: TPanel;
    Label18: TLabel;
    rbSiRevAMed: TRadioButton;
    rbNoRevAMed: TRadioButton;
    pnlRevASin: TPanel;
    Label21: TLabel;
    rbSiRevASin: TRadioButton;
    rbNoRevASin: TRadioButton;
    sdqConsultaIDCARTAREV: TFloatField;
    sdqConsultaFIRMANTEREV: TFloatField;
    sdqConsultaFORMATOREV: TStringField;
    sdqConsultaEX_FRECHAZOSIN: TDateTimeField;
    sdqConsultaEX_FRECHAZOMED: TDateTimeField;
    sdqConsultaEX_FSUSPSIN: TDateTimeField;
    sdqConsultaEX_FSUSPMED: TDateTimeField;
    sdqConsultaEX_ESTADO: TStringField;
    sdqConsultaEX_ID: TFloatField;
    sdqConsultaFI_FIRMANTESUSP: TFloatField;
    sdqConsultaFI_FIRMANTERECH: TFloatField;
    gbArea: TGroupBox;
    rbAreaSiniestros: TRadioButton;
    rbAreaMedica: TRadioButton;
    fraSuspASin: TfraCodDesc;
    fraSuspAMedica: TfraCodDesc;
    fraRechAMedica: TfraCodDesc;
    fraRechASin: TfraCodDesc;
    sdqConsultaSINIESTROREV: TStringField;
    ToolButton1: TToolButton;
    fpDatosCitacion: TFormPanel;
    Label26: TLabel;
    Bevel8: TBevel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    btnGetTurno: TSpeedButton;
    btnGetTurno2: TSpeedButton;
    edFecha: TDateComboBox;
    edFechaTXT: TEdit;
    btnAceptarCitacion: TButton;
    btnCancelarCitacion: TButton;
    edObservaciones: TMemo;
    edHora: TMaskEdit;
    edFecha2: TDateComboBox;
    edHora2: TMaskEdit;
    edFecha2TXT: TEdit;
    fraSector: TfraCtbTablas;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label32: TLabel;
    SinCitacion: TSinEdit;
    edTrabajadorCita: TEdit;
    fraConsultorio: TfraCtbTablas;
    Label25: TLabel;
    Label31: TLabel;
    fraMedicoCitacion: TfraCodigoDescripcion;
    tbCitacion: TToolButton;
    ToolButton2: TToolButton;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    sdqConsultaUSUGESTOR: TStringField;
    tbViajar: TToolButton;
    ToolButton9: TToolButton;
    pMenuViajar: TPopupMenu;
    mnuViajarParte: TMenuItem;
    sdqConsultaCA_IDENTIFICADOR: TFloatField;
    fpCie10: TFormPanel;
    Bevel7: TBevel;
    btnCancelarCIE10: TButton;
    btnAceptarCIE10: TButton;
    Label28: TLabel;
    fraCIE10: TfraCodigoDescripcion;
    Label33: TLabel;
    Label34: TLabel;
    edMotivoRechazoPatBase: TMemo;
    rgRechAMed: TRadioGroup;
    rgRechASin: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure SinDesdeExit(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure edMotivoRechazoChange(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbReversionClick(Sender: TObject);
    procedure btnAceptarRevClick(Sender: TObject);
    procedure rbSiRevAMedClick(Sender: TObject);
    procedure rbSiRevASinClick(Sender: TObject);
    procedure rbNoRevAMedClick(Sender: TObject);
    procedure rbNoRevASinClick(Sender: TObject);
    procedure fpReversionClose(Sender: TObject; var Action: TCloseAction);
    procedure rbAreaSiniestrosClick(Sender: TObject);
    procedure rbAreaMedicaClick(Sender: TObject);
    procedure fraSuspASinPropiedadesChange(Sender: TObject);
    procedure fraSuspAMedicaPropiedadesChange(Sender: TObject);
    procedure fraRechAMedicaPropiedadesChange(Sender: TObject);
    procedure fraRechASinPropiedadesChange(Sender: TObject);
    procedure edFechaChange(Sender: TObject);
    procedure edFecha2Change(Sender: TObject);
    procedure btnGetTurnoClick(Sender: TObject);
    procedure btnGetTurno2Click(Sender: TObject);
    procedure btnAceptarCitacionClick(Sender: TObject);
    procedure fpDatosCitacionClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarCitacionClick(Sender: TObject);
    procedure tbCitacionClick(Sender: TObject);
    procedure fpDatosCitacionBeforeShow(Sender: TObject);
    procedure cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuViajarParteClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure fpABMClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarCIE10Click(Sender: TObject);
    procedure btnCancelarCIE10Click(Sender: TObject);
    procedure fpABMShow(Sender: TObject);
    procedure fraRechAMedicaEnter(Sender: TObject);
    procedure fraRechASinEnter(Sender: TObject);
    procedure edSiniestroSelect(Sender: TObject);
    procedure pMenuViajarPopup(Sender: TObject);
  private
    AccionCita :TAccionCita;
    bSuspendeAMed, bSuspendeASin, bSuspendidoAMed, bSuspendidoASin, bCartaImpresaSusp,
    bRechazaAMed, bRechazaASin, bRechazadoAMed, bRechazadoASin, bCartaImpresaRech,
    bCartaImpresaRev, bCartaGeneradaRev, bCambioObservaciones, bEsSinRevertido,
    bCambiarArea: Boolean;
    sSuspPlazoMed, sSuspPlazoSin, sRechazoMed, sRechazoSin, sFormatoSusp,
    sFormatoRech, sFirmanteSusp, sFirmanteRech, sEstado, sRevMed, sRevSin,
    sFormatoRev, sFirmanteRev :String;
    iDelegacionCitacion, iIdCartaSusp, iIdCartaRech :Integer;
    dVencimSusp, dVencimRech, dRechazoSin, dRechazoMed, dSuspSin, dSuspMed :TDate;
    FDecisionMedica, FConTransaccion: Boolean;
    FPrestadorParte: Integer;
    procedure HabilitarFormatoFirmanteSusp(Decision :String);
    procedure HabilitarFormatoFirmanteRech(Decision :String);
    procedure DoUpdateCartaSusp(IdCartaSusp :Integer);
    procedure DoUpdateCartaRech(IdCartaRech :Integer);
    procedure DoUpdateCartaRev(IdCartaRev :Integer);
    procedure DoHabilitarFormatoRev(bChecked :Boolean);
    procedure DoActualizarEstado(bEsAreaSin :Boolean);
    procedure DoCambiarPermisos;
    procedure DoHabilitarFechaHora(bHabilitar :boolean);
    procedure GetTurno(dFecha :TDate; sMedico :String; iTurno :integer);
    procedure OnfraMedicoChange(Sender: TObject);
    procedure DoBloquearCitacion(bBloquear :boolean);
    procedure Do_habilitacionCmbDelegacion(sDelegSesion: String);     // TK 25087
    procedure DoGenerarParteSuspension;
    procedure Do_GuardarCIE10(sCodCIE10:string; iIdExped: integer);    // TK 34934
    procedure OnfraFormatoRechChange(Sender: TObject);
    function DoMostrarCitacion(bEsAlta, bSoloLectura :Boolean) :Boolean;
    function ValidarDatos :Boolean;
    function ValidarDatosReversion :Boolean;
    function SiniestroRechazado(CodRechazo :String) :Boolean;
    function ExigeMotivoRechazo(Codigo :String) :Boolean;
    function HayRegistroActivo :Boolean;
    function ActualizarEstadoSin :String;
    function ActualizarEstadoMed :String;
    function UsuarioTienePermiso :Boolean;
    function GetDelegacionCitacion :Integer;
    function DelegacionesDLS_inSql(sDelegSesion: String): String;     // TK 25087
    function Do_ControlarCIE10: boolean;     // TK 34934
    function SiniestroTieneCIE10: boolean;   // TK 34934
    function EsExcepcionEstadoRech(sCodRechazoAMed:string): boolean;  // TK 54442
  public
    property DecisionMedica: Boolean    read FDecisionMedica      write FDecisionMedica;
    property ConTransaccion: Boolean    read FConTransaccion      write FConTransaccion;
    property PrestadorParte: Integer    read FPrestadorParte      write FPrestadorParte;
  end;
                                
var
  frmSuspensionPlazos: TfrmSuspensionPlazos; sTextoObs, sTipoRechAMed, sTipoRechASin: string; // Lu wf 7862

implementation

uses unDmPrincipal, AnsiSql, unComunes, unArt, CustomDlgs, unSesion, General,
     Strfuncs, VCLExtra, ValFuncs, unRptCartaDocHeader, unParteEvolutivo,
     unPrincipal, unRedPres, unTercerizadoras, unSiniestros;

const
  sqlFormato = 'SELECT tc_id as id, tc_codigo as codigo, tc_destinatario, ' +
                     ' tc_nombre as descripcion, tc_fechabaja as baja, at_id, ' +
                     ' tc_datoscitacion, tc_ordensusprechazo, tc_rechazobase ' +
                ' FROM ctc_textocarta, cta_textoarea, cat_areatexto ' +
               ' WHERE tc_id = ta_idtextocarta ' +
                 ' AND ta_idareatexto = at_id ';
  sqlFirmante = 'SELECT fi_id as id, fi_id as codigo, ' +
                      ' fi_firmante as descripcion, fa_fechabaja as baja ' +
                 ' FROM cat_areatexto, cfa_firmantearea, cfi_firma ' +
                ' WHERE fa_idfirmante = fi_id ' +
                  ' AND fa_idareatexto = at_id ';

  sqlBase =
      'SELECT ex_suspplazomed, ex_suspplazosin, ex_rechazomed, ex_rechazosin, ' +
            ' siniestro.is_siniestrorevertido(ex_id) siniestrorev, ' +
            ' prestc.ca_fechaimpresion fimprsusp, crech.ca_fechaimpresion fimprrech, ' +
            ' crech.ca_observaciones obsrechazo, prestt.tc_codigo tc_codigo, rech.tc_codigo, ' +
            ' prestf.fi_id fi_firmantesusp, rechf.fi_id fi_firmanterech, ' +
            ' nvl(prestc.ca_id, 0) idcartasusp, nvl(crech.ca_id, 0) idcartarech, ' +
            ' prestt.tc_codigo formatosusp, rech.tc_codigo formatorech, ex_vencimsuspension, ' +
            ' ex_vencimrechazo, ex_frechazosin, ex_frechazomed, ex_fsuspsin, ex_fsuspmed, ex_estado, ' +
            ' crev.ca_fechaimpresion fimprrev, nvl(crev.ca_id, 0) IdCartaRev, ' +
            ' ex_reversionmed, ex_reversionsin, rev.tc_codigo FormatoRev, ' +
            ' nvl(crev.ca_idfirmareimpresion, crev.ca_idfirma) FirmanteRev, ' +
            ' ex_id, ex_siniestro, ex_orden, ex_recaida, armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
            ' nvl(ex_fecharecaida, ex_fechaaccidente) fecha_accidente, ta_descripcionabrev, tg_descripcion gravedad, ' +
            ' ex_diagnostico, ex_diagnosticooms, ex_brevedescripcion, em_nombre, ex_cuil, tj_nombre, tj_id, ' +
            ' ex_fecharecepcion, ex_fechaalta, lg_nombre, gp_nombre, ca_descripcion,  ' +
            ' ex_suspplazosin || decode(ex_suspplazosin, null, null, ''-''||suspl_sin.ts_descripcion) suspplazosin, ' +
            ' ex_suspplazomed || decode(ex_suspplazomed, null, null, ''-''||suspl_med.ts_descripcion) suspplazomed, ' +
            ' ex_usuariosuspsin, ex_usuariosuspmed, ex_usuariorechazosin, ex_usuariorechazomed, ' +
            ' rpad(prestt.tc_codigo, 6) ||prestt.tc_nombre tc_nombre, ' +
            ' rpad(to_char(prestf.fi_id), 6) || prestf.fi_firmante fi_firmante, ' +
            ' ex_rechazosin || decode(ex_rechazosin, null, null, ''-''||rech_sin.tr_descripcion) d_rsin, ' +
            ' ex_rechazomed || decode(ex_rechazomed, null, null, ''-''||rech_med.tr_descripcion) d_rmed, ' +
            ' rpad(rech.tc_codigo, 6) || rech.tc_nombre form_rech, ' +
            ' rpad(to_char(rechf.fi_id), 6) || rechf.fi_firmante firm_rech, ' +
            ' se_descripcion || decode(se_cerrado, ''S'', ''('' || ex_causafin || '')'') estado, ' +
            ' siniestro.get_usuariogestor(ex_id) usugestor, ca_identificador, crech.ca_motivorechazobase ' +
       ' FROM sex_expedientes, sta_tipoaccidente, stg_tipogravedad, sts_tiposuspensionplazos suspl_sin, ' +
            ' sts_tiposuspensionplazos suspl_med, aem_empresa, mgp_gtrabajo, dlg_delegaciones, ' +
            ' cca_carta prestc, ctc_textocarta prestt, ctj_trabajador, cpr_prestador, ' +
            ' cfi_firma prestf, str_tiporechazosin rech_sin, str_tiporechazosin rech_med, ' +
            ' ctc_textocarta rech, cfi_firma rechf, cca_carta crech, sin.sse_siniestroestado, ' +
            ' cca_carta crev, ctc_textocarta rev ' +
      ' WHERE ex_tipo=ta_codigo(+) ' +
        ' AND ex_gravedad=tg_codigo(+) ' +
        ' AND ex_suspplazosin=suspl_sin.ts_codigo(+) ' +
        ' AND ex_suspplazomed=suspl_med.ts_codigo(+) ' +
        ' AND ex_cuit=em_cuit ' +
        ' AND ex_gtrabajo=gp_codigo ' +
        ' AND ex_delegacion=lg_codigo ' +
        ' AND ex_id = prestc.ca_idexpediente(+) ' +
        ' AND prestc.ca_idtextocarta=prestt.tc_id(+) ' +
        ' AND ex_cuil=tj_cuil ' +
        ' AND ex_prestador=ca_identificador(+) ' +
        ' AND nvl(prestc.ca_idfirmareimpresion, prestc.ca_idfirma)=prestf.fi_id(+) ' +
        ' AND ex_rechazosin=rech_sin.tr_codigo(+) ' +
        ' AND ex_rechazomed=rech_med.tr_codigo(+) ' +
        ' AND ex_id = crech.ca_idexpediente(+) ' +
        ' AND crech.ca_idtextocarta=rech.tc_id(+) ' +
        ' AND nvl(crech.ca_idfirmareimpresion, crech.ca_idfirma)=rechf.fi_id(+) ' +
        ' AND ex_id = crev.ca_idexpediente(+) ' +
        ' AND crev.ca_idtextocarta=rev.tc_id(+) ' +
        ' AND ex_estado = se_codigo(+) ' +
        ' AND nvl(ex_causafin, '' '') NOT IN (''99'',''95'') ' ;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.FormCreate(Sender: TObject);
begin
  inherited;
  bCambiarArea    := Seguridad.Claves.IsActive('CAMBIAR_AREA');
  gbArea.Enabled  := bCambiarArea;
  bSuspendeAMed   := Seguridad.Claves.IsActive('SUSPENDER_MED') or
                     (bCambiarArea and rbAreaMedica.Checked);
  bSuspendeASin   := Seguridad.Claves.IsActive('SUSPENDER_SIN') or
                     (bCambiarArea and rbAreaSiniestros.Checked);
  bRechazaAMed    := Seguridad.Claves.IsActive('RECHAZAR_MED') or
                     (bCambiarArea and rbAreaMedica.Checked);
  bRechazaASin    := Seguridad.Claves.IsActive('RECHAZAR_SIN') or
                     (bCambiarArea and rbAreaSiniestros.Checked);
  sdqGTrabajo.Open;
  cmbGTrabajo.DataSource := dsGTrabajo;
  cmbGestor.DataSource   := dsGestor;

  sdqTipoAccidente.Open;

  Do_habilitacionCmbDelegacion(Sesion.Delegacion);

  with fraFormatoSusp do
  begin
    TableName       := 'CTC_TEXTOCARTA';
    FieldID         := 'TC_ID';
    FieldCodigo     := 'TC_CODIGO';
    FieldDesc       := 'TC_NOMBRE';
    FieldBaja       := 'TA_FECHABAJA';
    ShowBajas       := False;
    OrderBy         := 'TC_ORDENSUSPRECHAZO, DESCRIPCION';
    OrderBy         := 'DESCRIPCION';
    ClearOnChange   := False;
  end;
  with fraFormatoRech do
  begin
    TableName       := 'CTC_TEXTOCARTA';
    FieldID         := 'TC_ID';
    FieldCodigo     := 'TC_CODIGO';
    FieldDesc       := 'TC_NOMBRE';
    FieldBaja       := 'TC_FECHABAJA';
    ShowBajas       := True;
    ExtraCondition  := ' AND TC_DESTINATARIO IN (' + SqlValue(DESTI_EMPRESA) + ',' +
                                                     SqlValue(DESTI_AMBOS) + ')';
    OrderBy         := 'TC_ORDENSUSPRECHAZO, DESCRIPCION';
    OrderBy         := 'DESCRIPCION';
    ClearOnChange   := False;
    //ExtraFields     := ',TC_RECHAZOBASE';
    OnChange        := OnfraFormatoRechChange;
  end;
  with fraFirmanteSusp do
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
  with fraFirmanteRech do
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
  with fraRevRechAMed do
  begin
    TableName     := 'STR_TIPORECHAZOSIN';
    FieldID       := 'TR_CODIGO';
    FieldCodigo   := 'TR_CODIGO';
    FieldDesc     := 'TR_DESCRIPCION';
    FieldBaja     := 'TR_FECHABAJA';
    ShowBajas     := True;
  end;
  with fraRevRechASin do
  begin
    TableName       := 'STR_TIPORECHAZOSIN';
    FieldID         := 'TR_CODIGO';
    FieldCodigo     := 'TR_CODIGO';
    FieldDesc       := 'TR_DESCRIPCION';
    FieldBaja       := 'TR_FECHABAJA';
    ShowBajas       := True;
  end;
  with fraFormatoRev do
  begin
    TableName       := 'CTC_TEXTOCARTA';
    FieldID         := 'TC_ID';
    FieldCodigo     := 'TC_CODIGO';
    FieldDesc       := 'TC_NOMBRE';
    FieldBaja       := 'TC_FECHABAJA';
    ShowBajas       := True;
    OrderBy         := 'DESCRIPCION';
    ClearOnChange   := False;
  end;
  with fraFirmanteRev do
  begin
    TableName       := 'CFI_FIRMA';
    FieldID         := 'FI_ID';
    FieldCodigo     := 'FI_ID';
    FieldDesc       := 'FI_FIRMANTE';
    FieldBaja       := 'FI_FECHABAJA';
    ShowBajas       := False;
    OrderBy         := 'DESCRIPCION';
    ClearOnChange   := False;
  end;
  edFReasigDesde.Date := DBDate - 2;
  edFReasigHasta.Date := DBDate;

  fraConsultorio.Clave  := 'CUBIC';
  fraSector.Clave       := 'SUBSE';
  with fraMedicoCitacion do
  begin
    TableName   := 'MAU_AUDITORES';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc   := 'AU_NOMBRE';
    FieldID     := 'AU_AUDITOR';
    FieldBaja   := 'AU_FBAJA';
    ShowBajas   := False;
    OnChange    := OnfraMedicoChange;
  end;

  with fraCIE10 do      // TK 34934
  begin
    TableName   := 'CDG_DIAGNOSTICO';
    FieldID     := 'DG_CODIGO';
    FieldCodigo := 'DG_CODIGO';
    FieldDesc   := 'DG_DESCRIPCION';
    FieldBaja   := 'DG_FECHABAJA';
    ShowBajas   := False;
  end;

end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbLimpiarClick(Sender: TObject);
begin
  edFReasigDesde.Clear;
  edFReasigHasta.Clear;
  edFVtoSuspDesde.Clear;
  edFVtoSuspHasta.Clear;
  edFVtoRechDesde.Clear;
  edFVtoRechHasta.Clear;
  edSiniestro.Clear;
  cmbGTrabajo.Clear;
  cmbGestor.Clear;
  cmbDelegacion.Clear;
  SinDesde.Clear;
  SinHasta.Clear;
  cmbTipoAccidente.Clear;
  edFReasigDesde.SetFocus;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbRefrescarClick(Sender: TObject);
var
   sSql, sSqlWhere: String;
begin
  sSqlWhere := SqlBetweenDateTime(' AND EX_FECHAREASIGNACION', edFReasigDesde.Date, edFReasigHasta.Date) +
               SqlBetween(' AND EX_VENCIMSUSPENSION', edFVtoSuspDesde.Date, edFVtoSuspHasta.Date) +
               SqlBetween(' AND EX_VENCIMRECHAZO', edFVtoRechDesde.Date, edFVtoRechHasta.Date);

   if cmbDelegacion.Enabled = False then
      sSqlWhere := sSqlWhere + ' AND ex_delegacion = ' + SqlValue(Sesion.Delegacion)
   else if (cmbDelegacion.Text <> '') then
      sSqlWhere := sSqlWhere + ' AND ex_delegacion ' + cmbDelegacion.InSql
   else if (cmbDelegacion.Text = '') then    // trae todos los que estan en la tabla dls_delegsusp  // TK 25087
      sSqlWhere := sSqlWhere + ' AND ex_delegacion in ' + DelegacionesDLS_inSql(Sesion.Delegacion);


   if (cmbGtrabajo.Text <> '') then
      sSqlWhere := sSqlWhere + ' AND ex_gtrabajo ' + cmbGtrabajo.InSql;

   if (cmbGestor.Text <> '') then
     sSqlWhere := sSqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

  if not SinDesde.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ex_siniestro BETWEEN ' + SinDesde.SiniestroSql  + ' AND ' + SinHasta.SiniestroSql
  else if not edSiniestro.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ex_siniestro = ' + edSiniestro.SiniestroSql +
                             ' AND ex_orden = ' + edSiniestro.OrdenSql +
                             ' AND ex_recaida = ' + edSiniestro.RecaidaSql;

  if Trim(cmbTipoAccidente.Text) <> '' then
    sSqlWhere := sSqlWhere + ' AND ex_tipo = ' + SqlString(cmbTipoAccidente.FieldValue,True);

  if rbSuspMed.Checked then
    sSqlWhere := sSqlWhere + ' AND ex_estado = ''01'' ' +
                             ' AND (suspl_sin.ts_bloqueaotra = ''N'' OR suspl_sin.ts_bloqueaotra IS NULL) ' +
                             ' AND (ex_suspplazomed IS NULL OR NVL(ex_suspensionplazo,'' '') <> ''S'') ' +
                             ' AND ex_rechazomed IS NULL ' +
                             ' AND (rech_sin.tr_suspendeotra = ''N'' OR rech_sin.tr_suspendeotra IS NULL)'

  else if rbSuspSin.Checked then
    sSqlWhere := sSqlWhere + ' AND ex_estado = ''01'' ' +
                             ' AND (suspl_med.ts_bloqueaotra = ''N'' OR suspl_med.ts_bloqueaotra IS NULL) ' +
                             ' AND (ex_suspplazosin IS NULL OR NVL(ex_suspensionplazo,'' '') <> ''S'') ' +
                             ' AND ex_rechazosin IS NULL ' +
                             ' AND (rech_med.tr_suspendeotra = ''N'' OR rech_med.tr_suspendeotra IS NULL)'

  else if rbRechMed.Checked then
    sSqlWhere := sSqlWhere + ' AND (suspl_med.ts_generacarta = ''S'' OR suspl_sin.ts_generacarta = ''S'') ' +
                             ' AND ex_rechazomed IS NULL ' +
                             ' AND art.sin.get_nrojuicioexp(ex_siniestro, ex_orden, ex_recaida) IS NULL '

  else if rbRechSin.Checked then
    sSqlWhere := sSqlWhere + ' AND (suspl_med.ts_generacarta = ''S'' OR suspl_sin.ts_generacarta = ''S'') ' +
                             ' AND ex_rechazosin IS NULL ' +
                             ' AND art.sin.get_nrojuicioexp(ex_siniestro, ex_orden, ex_recaida) IS NULL ';

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    sSqlWhere := sSqlWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';


  case rgRechAMed.ItemIndex of
    0: sSqlWhere := sSqlWhere + ' AND ex_rechazomed = ''S'' ';
    1: sSqlWhere := sSqlWhere + ' AND NVL(ex_rechazomed, ''N'') = ''N'' ';
  end;

  case rgRechASin.ItemIndex of
    0: sSqlWhere := sSqlWhere + ' AND ex_rechazosin = ''S'' ';
    1: sSqlWhere := sSqlWhere + ' AND NVL(ex_rechazosin, ''N'') = ''N'' ';
  end;

  sSql := sqlBase +
      	   ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_SUSPPLAZO) + ')=prestc.ca_id(+) ' +
           ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_RECHAZOPLAZO) + ')=crech.ca_id(+) ' +
        	 ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_REVERSION) + ')=crev.ca_id(+) ' +
          sSqlWhere;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.SinDesdeExit(Sender: TObject);
begin
  inherited;
  if SinHasta.IsEmpty then SinHasta.Siniestro := SinDesde.Siniestro;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbModificarClick(Sender: TObject);
var
  bEsSinGobernacion, bHabilitarRech, bHabilitarSusp :Boolean;
  sAux, sSql, sGob, sDesti:String;
  SqlResults :TStringList;
begin
  if UsuarioTienePermiso and HayRegistroActivo then
  begin
    if DecisionMedica then
    begin
      bRechazaAMed  := True;
      bSuspendeAMed := True;
      bRechazaASin  := False;
      bSuspendeASin := False;
    end;
    SinABM.SetValues(sdqConsultaEX_SINIESTRO.AsInteger,
                     sdqConsultaEX_ORDEN.AsInteger,
                     sdqConsultaEX_RECAIDA.AsInteger);
    edTrabajador.Text               := sdqConsultaTJ_NOMBRE.AsString;
    //a esto lo hago asi porque no puedo refrescar la pantalla despues de que dieron aceptar (!!!),
    //entonces cargo los valores nuevamente para asegurarme de que no estén desactualizados
    sSql := sqlBase +
      	   ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_SUSPPLAZO) + ')=prestc.ca_id(+) ' +
           ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_RECHAZOPLAZO) + ')=crech.ca_id(+) ' +
        	 ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_REVERSION) + ')=crev.ca_id(+) ' +
           ' AND ex_id = ' + SqlInt(sdqConsultaEX_ID.AsInteger);

    SqlResults := ValoresColSQL(sSql);
    try
      bSuspendidoAMed                 := (SqlResults[0] = 'S');
      bSuspendidoASin                 := (SqlResults[1] = 'S');
      bRechazadoAMed                  := (SqlResults[2] = 'R') or (SqlResults[2] = 'RPB');
      bRechazadoASin                  := (SqlResults[3] = 'R') or (SqlResults[3] = 'RPB');;
      bEsSinRevertido                 := (SqlResults[4] = 'S'); //indica si se revirtio un rechazo
      bCartaImpresaSusp               := not(IsEmptyString(SqlResults[5]));
      bCartaImpresaRech               := not(IsEmptyString(SqlResults[6]));
      fraSuspAMedica.Codigo           := SqlResults[0];
      fraSuspASin.Codigo              := SqlResults[1];
      fraRechAMedica.Codigo           := SqlResults[2];
      fraRechASin.Codigo              := SqlResults[3];
      edMotivoRechazo.Text            := AdjustLineBreaks(SqlResults[7]);
      edMotivoRechazoPatBase.Text     := AdjustLineBreaks(SqlResults[64]);
      fraSuspAMedica.Locked           := not(bSuspendeAMed) or bCartaImpresaSusp or bSuspendidoAMed;
      fraSuspASin.Locked              := not(bSuspendeASin) or bCartaImpresaSusp or bSuspendidoASin;
      fraRechAMedica.Locked           := not(bRechazaAMed) or (bRechazadoAMed and not(bEsSinRevertido) and bCartaImpresaRech);
      fraRechASin.Locked              := not(bRechazaASin) or (bRechazadoASin and not(bEsSinRevertido) and bCartaImpresaRech);
      sTextoObs := edMotivoRechazo.text;
      //todas estas variables tengo que usar por el maldito NO refresco de pantalla
      sSuspPlazoMed                   := SqlResults[0];
      sSuspPlazoSin                   := SqlResults[1];
      sRechazoMed                     := SqlResults[2];
      sRechazoSin                     := SqlResults[3];
      sFirmanteSusp                   := SqlResults[10];
      sFirmanteRech                   := SqlResults[11];
      iIdCartaSusp                    := StrToInt(SqlResults[12]);
      iIdCartaRech                    := StrToInt(SqlResults[13]);
      sFormatoSusp                    := SqlResults[14];
      sFormatoRech                    := SqlResults[15];
      //cuando tenga tiempo lo hago mas prolijito....(el IIF no me da pelota)..
      if not(IsEmptyString(SqlResults[16])) then
        dVencimSusp := StrToDate(SqlResults[16])
      else
        dVencimSusp := 0;
      if not(IsEmptyString(SqlResults[17])) then
        dVencimRech := StrToDate(SqlResults[17])
      else
        dVencimRech := 0;
      if not(IsEmptyString(SqlResults[18])) then
        dRechazoSin := StrToDateTime(SqlResults[18])
      else
        dRechazoSin := 0;
      if not(IsEmptyString(SqlResults[19])) then
        dRechazoMed := StrToDateTime(SqlResults[19])
      else
        dRechazoMed := 0;
      if not(IsEmptyString(SqlResults[20])) then
        dSuspSin := StrToDateTime(SqlResults[20])
      else
        dSuspSin := 0;
      if not(IsEmptyString(SqlResults[21])) then
        dSuspMed := StrToDateTime(SqlResults[21])
      else
        dSuspMed := 0;

      sEstado                         := SqlResults[22];

      fraFirmanteSusp.Clear;
      fraFormatoSusp.Clear;
      fraFirmanteRech.Clear;
      fraFormatoRech.Clear;
      bCambioObservaciones := False;
      bEsSinGobernacion    := Is_SiniestroDeGobernacion(sdqConsultaEX_ID.AsInteger);      // Cambio de la funcion de Gob.
      sGob                 := ' AND tc_gobernacion ' + IIF(bEsSinGobernacion, '=', '<>') + ' ''S'' ';
      sDesti               := ' AND tc_destinatario IN (' + SqlValue(DESTI_EMPRESA) + ',' +
                                                             SqlValue(DESTI_AMBOS) + ') ';


      if bSuspendeAMed or bSuspendidoAMed or
         bSuspendeASin or bSuspendidoASin then
      begin
        fraFormatoSusp.Sql  := sqlFormato +  ' AND at_modulo = ' + SqlValue(MODULO_SUSPPLAZO);
      end;

      if bRechazaAMed or bRechazadoAMed or bRechazaASin or bRechazadoASin then
        fraFormatoRech.Sql  := sqlFormato + sDesti + ' AND at_modulo = ' + SqlValue(MODULO_RECHAZOPLAZO);

      fraFirmanteSusp.Sql       := sqlFirmante;
      fraFirmanteRech.Sql       := sqlFirmante;
      //primero se cargan...
      fraFormatoSusp.Codigo     := SqlResults[8];
      fraFormatoRech.Codigo     := SqlResults[9];
      fraFirmanteSusp.Codigo    := SqlResults[10];
      fraFirmanteRech.Codigo    := SqlResults[11];
    finally
      SqlResults.Free;
    end;

    sAux := ' AND at_area = ' +  IIF(bRechazaAMed or bSuspendeAMed,
                                 SqlValue(AREA_MED), SqlValue(AREA_SIN));
    //...y despues se restringen segun el area, el modulo y la baja
    fraFormatoRech.Sql  := fraFormatoRech.Sql + sAux + sGob +
                           ' AND tc_fechabaja IS NULL ' +
                           ' AND at_fechabaja IS NULL ' +
                           ' AND ta_fechabaja IS NULL ';
    fraFormatoSusp.Sql  := fraFormatoSusp.Sql + sAux + sGob + sDesti +
                           ' AND tc_fechabaja IS NULL ' +
                           ' AND at_fechabaja IS NULL ' +
                           ' AND ta_fechabaja IS NULL ';
    fraFirmanteRech.Sql := fraFirmanteRech.Sql + sAux +
                          ' AND fa_fechabaja IS NULL ' +
                          ' AND fi_fechabaja IS NULL ' +
                          ' AND at_fechabaja IS NULL ' +
                          ' AND at_modulo = ' + SqlValue(MODULO_RECHAZOPLAZO);
    fraFirmanteSusp.Sql := fraFirmanteSusp.Sql + sAux +
                          ' AND fa_fechabaja IS NULL ' +
                          ' AND fi_fechabaja IS NULL ' +
                          ' AND at_fechabaja IS NULL ' +
                          ' AND at_modulo = ' + SqlValue(MODULO_SUSPPLAZO);

    bHabilitarSusp            := ((bSuspendeAMed and bSuspendidoAMed) or
                                  (bSuspendeASin and bSuspendidoASin)) and not(bCartaImpresaSusp);
    LockControls([fraFirmanteSusp, fraFormatoSusp], not bHabilitarSusp);
    bHabilitarRech            := (((bRechazaAMed and bRechazadoAMed) or
                                   (bRechazaASin and bRechazadoASin)) and not(bCartaImpresaRech)) or bEsSinRevertido;
    LockControls([fraFirmanteRech, fraFormatoRech], not(bHabilitarRech));
    edMotivoRechazo.ReadOnly  := not(bHabilitarRech);
    if bHabilitarRech then
      edMotivoRechazo.Color   := clWhite
    else
      edMotivoRechazo.Color   := clBtnFace;

    OnfraFormatoRechChange(nil);
    fpABM.ShowModal;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnAceptarClick(Sender: TObject);
var
  sSql, sWhere, sAdd :String;
begin
  if ValidarDatos then
  begin
    sWhere := ' WHERE ex_siniestro = ' + SqlInt(SinABM.Siniestro) +
                ' AND ex_orden = ' + SqlInt(SinABM.Orden) +
                ' AND ex_recaida = ' + SqlInt(SinABM.Recaida);

    try
      BeginTrans(True);
      //si tiene permisos para suspender Area Medica y esta cambiando
      if bSuspendeAMed then
      begin
        if (sSuspPlazoMed <> fraSuspAMedica.Codigo) then
        begin
          sSql := 'UPDATE sex_expedientes ' +
                    ' SET ex_suspplazomed = ' + SqlValue(fraSuspAMedica.Codigo) + ',' +
                        ' ex_usuariosuspmed = ' + SqlValue(Sesion.UserID) + ',' +
                        ' ex_fsuspmed = ActualDate ' + sWhere;
          EjecutarSqlST(sSql);
        end;
        DoUpdateCartaSusp(iIdCartaSusp);
      end;
      //si tiene permisos para rechazar Area Medica y esta cambiando
      if bRechazaAMed then
      begin
        if (sRechazoMed <> fraRechAMedica.Codigo) then
        begin
          if (not SiniestroTieneCIE10) and (not Do_ControlarCIE10) then Exit;  // TK 34934
          sAdd  := ActualizarEstadoMed;
          sSql  := 'UPDATE sex_expedientes ' +
                     ' SET ex_rechazomed = ' + SqlValue(fraRechAMedica.Codigo) + ',' +
                         ' ex_usuariorechazomed = ' + SqlValue(Sesion.UserID) + ',' +
                         ' ex_frechazomed = ActualDate ' + sAdd + sWhere;
          EjecutarSqlST(sSql);
        end;
        if not(bEsSinRevertido) then DoUpdateCartaRech(iIdCartaRech);
      end;
      //si tiene permisos para suspender Area Siniestros y esta cambiando
      if bSuspendeASin then
      begin
        if (sSuspPlazoSin <> fraSuspASin.Codigo) then
        begin
          sSql := 'UPDATE sex_expedientes ' +
                    ' SET ex_suspplazosin = ' + SqlValue(fraSuspASin.Codigo) + ',' +
                        ' ex_usuariosuspsin = ' + SqlValue(Sesion.UserID) + ',' +
                        ' ex_fsuspsin = ActualDate ' + sWhere;
          EjecutarSqlST(sSql);
        end;
        DoUpdateCartaSusp(iIdCartaSusp);
      end;
      //si tiene permisos para rechazar Area Siniestros y esta cambiando
      if bRechazaASin then
      begin
        if (sRechazoSin <> fraRechASin.Codigo) then
        begin
          if (not SiniestroTieneCIE10) and (not Do_ControlarCIE10) then Exit;  // TK 34934
          sAdd := ActualizarEstadoSin;
          sSql := 'UPDATE sex_expedientes ' +
                    ' SET ex_rechazosin = ' + SqlValue(fraRechASin.Codigo) + ',' +
                        ' ex_usuariorechazosin = ' + SqlValue(Sesion.UserID) + ',' +
                        ' ex_frechazosin = ActualDate ' + sAdd + sWhere;
          EjecutarSqlST(sSql);
        end;
        if not(bEsSinRevertido) then DoUpdateCartaRech(iIdCartaRech);
      end;

      //inserto la carta de suspension si corresponde
      if (
          (not(bSuspendidoAMed) and bSuspendeAMed and not(fraSuspAMedica.IsEmpty) and
          (fraSuspAMedica.sdqDatos.FieldByName('ts_generacarta').AsString = 'S'))
         or
          (not(bSuspendidoASin) and bSuspendeASin and not(fraSuspASin.IsEmpty) and
          (fraSuspASin.sdqDatos.FieldByName('ts_generacarta').AsString = 'S'))
         )
         and
         //estas condiciones van para todos: que haya cambiado el formato o el firmante con respecto a la base
         ((fraFormatoSusp.Codigo <> sFormatoSusp) or
          (fraFirmanteSusp.Codigo <> sFirmanteSusp)) then
      begin
        iIdCartaSusp := DoInsertarCarta(StrToInt(fraFormatoSusp.ID), SinABM.Siniestro,
                                        SinABM.Orden, SinABM.Recaida, fraFirmanteSusp.Codigo,
                                        IIF(bSuspendeAMed, AREA_MED, AREA_SIN), False,
                                        ART_EMPTY_ID, tdEmpresa);
        if not DoMostrarCitacion(True, False) then Exit;
      end;
      //inserto la carta de rechazo si corresponde
      if (
          (not(bRechazadoAMed) and bRechazaAMed and not(fraRechAMedica.IsEmpty) and
          (fraRechAMedica.sdqDatos.FieldByName('tr_generacarta').AsString = 'S'))
         or
          (not(bRechazadoASin) and bRechazaASin and not(fraRechASin.IsEmpty) and
          (fraRechASin.sdqDatos.FieldByName('tr_generacarta').AsString = 'S'))
         or
          //esto es para el caso en que estén rechazando nuevamente un siniestro revertido
          (((bRechazaAMed and not(fraRechAMedica.IsEmpty) and (fraRechAMedica.sdqDatos.FieldByName('tr_generacarta').AsString = 'S')) or
            (bRechazaASin and not(fraRechASin.IsEmpty) and (fraRechASin.sdqDatos.FieldByName('tr_generacarta').AsString = 'S'))
            ) and bEsSinRevertido)
         )
         and
         //estas condiciones van para todos: que haya cambiado el formato o el firmante con respecto a la base
          ((fraFormatoRech.Codigo <> sFormatoRech) or
           (fraFirmanteRech.Codigo <> sFirmanteRech)) or
          //para la reversion, tengo en cuenta la observacion tambien
         (bEsSinRevertido and bCambioObservaciones) then
      begin
        DoInsertarCarta(StrToInt(fraFormatoRech.ID), SinABM.Siniestro, SinABM.Orden,
                        SinABM.Recaida, fraFirmanteRech.Codigo, IIF(bRechazaAMed, AREA_MED, AREA_SIN), False, ART_EMPTY_ID, 
                        tdEmpresa, edMotivoRechazo.Lines.Text, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, edMotivoRechazoPatBase.Lines.Text);
      end;

      DoGenerarParteSuspension;
      if not ConTransaccion then
        CommitTrans(True);
      MsgBox('Datos guardados correctamente', MB_ICONINFORMATION);
      fpABM.ModalResult := mrOk;
      if FDecisionMedica then Close;
    except
      on E: Exception do
      begin
        RollBack(True);
        ErrorMsg(E, 'Error al Guardar los Datos.');
      end;
    end;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.ValidarDatos :Boolean;
{var sSql: string;
    bDomicilioVacio, bSuspORech: boolean;    }
begin
  ValidarDatos := False;
  Verificar(not(bSuspendeAMed) and not(bSuspendeASin) and
            not(bRechazaAMed)  and not(bRechazaASin), btnAceptar, 'No posee permisos para suspender/rechazar');

  if SinABM.Recaida > 0 then
    verificar((((not fraFormatoSusp.ReadOnly) and (not fraFormatoSusp.IsEmpty)) or ((not fraFormatoRech.ReadOnly) and (not fraFormatoRech.IsEmpty) and (fraRechAMedica.Codigo <> 'RPB'))) and
              (ValorSqlEx('select ex_intercurrencia from art.sex_expedientes ' +
                          'where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec', [SinABM.Siniestro, SinABM.Orden, SinABM.Recaida]) <> 'S'),
                 SinABM, 'No se puede suspender/rechazar una recaida');

  // Validacion del domicilio del trabajador TK 52798
  {sSql := 'SELECT tj_nombre, ex_siniestro, ex_orden, ex_recaida, tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad ' +
           ' FROM ctj_trabajador, art.sex_expedientes ' +
          ' WHERE ex_idtrabajador = tj_id ' +
            ' AND ex_siniestro = :sin ' +
            ' AND ex_orden = :ord ' +
            ' AND ex_recaida = :reca ';
  with GetQueryEx(sSql, [sdqConsultaEX_SINIESTRO.AsInteger, sdqConsultaEX_ORDEN.AsInteger, sdqConsultaEX_RECAIDA.AsInteger]) do
  try
    bDomicilioVacio := ((FieldByName('tj_calle').AsString = '') and
                        (FieldByName('tj_piso').AsString = '')  and
                        (FieldByName('tj_departamento').AsString = '') and
                        (FieldByName('tj_localidad').AsString = ''));

    bSuspORech := (fraSuspAMedica.Codigo = 'S') or (fraSuspASin.Codigo = 'S') or (fraRechAMedica.Codigo = 'R') or (fraRechASin.Codigo = 'R');

    Verificar(bSuspORech and bDomicilioVacio, btnAceptar, 'Imposible modificar los datos: El domicilio del trabajador no se encuentra cargado.');
  finally
    Free;
  end; }

  //validaciones para suspender o rechazar por area medica ---------------------
  if bSuspendeAMed or bRechazaAMed then
  begin
    //si ya estaba suspendido, la carta ya esta impresa y estoy queriendo modificar la suspension
    Verificar(bSuspendidoAMed and bCartaImpresaSusp and
             ((sSuspPlazoMed <> fraSuspAMedica.Codigo) or
              (sFormatoSusp <> fraFormatoSusp.Codigo) or
              (sFirmanteSusp <> fraFirmanteSusp.Codigo)),
              btnAceptar, 'Imposible modificar los datos: la Carta de Suspensión ya ha sido impresa');
    //si ya estaba rechazado, la carta ya esta impresa y estoy queriendo modificar el rechazo
    Verificar(bRechazadoAMed and bCartaImpresaRech and not(bEsSinRevertido) and
             ((sRechazoMed <> fraRechAMedica.Codigo) or
              (sFormatoRech <> fraFormatoRech.Codigo) or
              (sFirmanteRech <> fraFirmanteRech.Codigo)),
              btnAceptar, 'Imposible modificar los datos: la Carta de Rechazo ya ha sido impresa');
    //si el siniestro ya estaba rechazado por cualquier area, no puedo modificar la suspension
    Verificar((SiniestroRechazado(sRechazoMed) or
               SiniestroRechazado(sRechazoSin)) and
             (sSuspPlazoMed <> fraSuspAMedica.Codigo), fraSuspAMedica, 'El siniestro ya se encuentra Rechazado');
    //si no estaba ni suspendido ni rechazado y elige un codigo de suspension que genera carta, no puede cargar nada en rechazo
    Verificar(not(bSuspendidoAMed) and not(bRechazadoAMed) and
              not(fraSuspAMedica.IsEmpty) and (fraSuspAMedica.sdqDatos.FieldByName('ts_generacarta').AsString = 'S') and
              not(fraRechAMedica.IsEmpty), fraSuspAMedica, 'No es posible rechazar con éste código de suspensión');
    //si ya estaba suspendido por siniestros con un codigo que bloquea, no puedo suspender en area medica
    Verificar(bSuspendidoASin and not(fraSuspASin.IsEmpty) and
              (fraSuspASin.sdqDatos.FieldByName('ts_bloqueaotra').AsString = 'S') and not(fraSuspAMedica.IsEmpty) and
              (sSuspPlazoMed <> fraSuspAMedica.Codigo),
               fraSuspAMedica, 'El siniestro ya se encuentra Suspendido por Area Siniestros');
    //si esta rechazando del area medica, depende de la desicion que se haya tomado en Siniestros
    Verificar(not(fraRechAMedica.IsEmpty) and (sRechazoMed <> fraRechAMedica.Codigo) and
              not(fraRechAMedica.sdqDatos.FieldByName('tr_decisionotra').IsNull) and not(bEsSinRevertido) and
              (fraRechASin.IsEmpty
              or
              (not(fraRechASin.IsEmpty) and (fraRechAMedica.sdqDatos.FieldByName('tr_decisionotra').AsString <> fraRechASin.Codigo))
              or
              (not(fraRechASin.IsEmpty) and (fraRechAMedica.Codigo = 'RPB') and (fraRechASin.Codigo <> 'A'))),
              fraRechAMedica, 'El Código de Rechazo no es compatible con el del Area Siniestros');
     //formato para el codigo de suspension que genera carta
    Verificar(not(fraSuspAMedica.IsEmpty) and (fraSuspAMedica.sdqDatos.FieldByName('ts_generacarta').AsString = 'S') and
              fraFormatoSusp.IsEmpty, fraFormatoSusp, 'El Formato es obligatorio para éste Código de Suspensión');
    //firmante para el codigo de suspension que genera carta
    Verificar(not(fraSuspAMedica.IsEmpty) and (fraSuspAMedica.sdqDatos.FieldByName('ts_generacarta').AsString = 'S') and
              fraFirmanteSusp.IsEmpty, fraFirmanteSusp, 'El Firmante es obligatorio para éste Código de Suspensión');
    //formato para el codigo de rechazo que genera carta
    Verificar(not(fraRechAMedica.IsEmpty) and (fraRechAMedica.sdqDatos.FieldByName('tr_generacarta').AsString = 'S') and
              fraFormatoRech.IsEmpty, fraFormatoRech, 'El Formato es obligatorio para éste Código de Rechazo');
    //firmante para el codigo de rechazo que genera carta
    Verificar(not(fraRechAMedica.IsEmpty) and (fraRechAMedica.sdqDatos.FieldByName('tr_generacarta').AsString = 'S') and
              fraFirmanteRech.IsEmpty, fraFirmanteRech, 'El Firmante es obligatorio para éste Código de Rechazo');
    //si estoy por suspender con fecha de vencimiento menor a la actual
    Verificar(not(bSuspendidoAMed) and
             (sSuspPlazoMed <> fraSuspAMedica.Codigo) and
             (dVencimSusp < DBDate) and
              not(Seguridad.Claves.IsActive('SUSPENDER_VENCIDO_MED')) and
              not(bCambiarArea),
              fraSuspAMedica.cmbDescripcion, 'No posee permisos para suspender plazos anteriores a la fecha actual');
    //si estoy por rechazar con fecha de vencimiento menor a la actual
    Verificar(not(bRechazadoAMed) and
             (sRechazoMed <> fraRechAMedica.Codigo) and
             (dVencimRech < DBDate) and
              not(Seguridad.Claves.IsActive('RECHAZAR_VENCIDO_MED')) and
              not(bCambiarArea),
              fraRechAMedica, 'No posee permisos para rechazar plazos anteriores a la fecha actual');
    //si esta por rechazar del area medica, y el formato seleccionado requiere motivo de rechazo
    Verificar(not(fraRechAMedica.IsEmpty) and ExigeMotivoRechazo(fraFormatoRech.Codigo) and
             (Trim(edMotivoRechazo.Text) = '') and not edMotivoRechazo.ReadOnly,
              edMotivoRechazo, 'El Motivo de Rechazo es obligatorio para éste Código de Rechazo');

    Verificar(not(fraRechAMedica.IsEmpty) and ExigeMotivoRechazo(fraFormatoRech.Codigo) and
             (Trim(edMotivoRechazoPatBase.Text) = '') and not edMotivoRechazoPatBase.ReadOnly,
             edMotivoRechazoPatBase, 'El Motivo de Rechazo es obligatorio para éste Código de Rechazo');

    ValidarDatos := True;
  end
  //validaciones para suspender o rechazar por area siniestros------------------
  else if bSuspendeASin or bRechazaASin then
  begin
    //si ya estaba suspendido, la carta ya esta impresa y estoy queriendo modificar la suspension
    Verificar(bSuspendidoASin and bCartaImpresaSusp and
             ((sSuspPlazoSin <> fraSuspASin.Codigo) or
              (sFormatoSusp <> fraFormatoSusp.Codigo) or
              (sFirmanteSusp <> fraFirmanteSusp.Codigo)),
              btnAceptar, 'Imposible modificar los datos: la Carta de Suspensión ya ha sido impresa');
    //si ya estaba rechazado, la carta ya esta impresa y estoy queriendo modificar el rechazo
    Verificar(bRechazadoASin and bCartaImpresaRech and not(bEsSinRevertido) and
             ((sRechazoSin <> fraRechAMedica.Codigo) or
              (sFormatoRech <> fraFormatoRech.Codigo) or
              (sFirmanteRech <> fraFirmanteRech.Codigo)),
              btnAceptar, 'Imposible modificar los datos: la Carta de Rechazo ya ha sido impresa');
    //si el siniestro ya estaba rechazado por cualquier area, no puedo modificar la suspension
    Verificar((SiniestroRechazado(sRechazoMed) or
               SiniestroRechazado(sRechazoSin)) and
             (sSuspPlazoSin <> fraSuspASin.Codigo), fraSuspASin, 'El siniestro ya se encuentra Rechazado');
    //si no estaba ni suspendido ni rechazado y elige un codigo de suspension que genera carta, no puede cargar nada en rechazo
    Verificar(not(bSuspendidoASin) and not(bRechazadoASin) and
              not(fraSuspASin.IsEmpty) and (fraSuspASin.sdqDatos.FieldByName('ts_generacarta').AsString = 'S') and
              not(fraRechASin.IsEmpty), fraSuspASin, 'No es posible rechazar con éste código de suspensión');
    //si ya estaba suspendido por area medica con un codigo que bloquea, no puedo suspender en siniestros
    Verificar(bSuspendidoAMed and not(fraSuspAMedica.IsEmpty) and
              (fraSuspAMedica.sdqDatos.FieldByName('ts_bloqueaotra').AsString = 'S') and not(fraSuspASin.IsEmpty) and
              (sSuspPlazoSin <> fraSuspASin.Codigo),
              fraSuspASin, 'El siniestro ya se encuentra Suspendido por Area Médica');
    //formato para el codigo de suspension que genera carta
    Verificar(not(fraSuspASin.IsEmpty) and (fraSuspASin.sdqDatos.FieldByName('ts_generacarta').AsString = 'S') and
              fraFormatoSusp.IsEmpty, fraFormatoSusp, 'El Formato es obligatorio para éste Código de Suspensión');
    //firmante para el codigo de suspension que genera carta
    Verificar(not(fraSuspASin.IsEmpty) and (fraSuspASin.sdqDatos.FieldByName('ts_generacarta').AsString = 'S') and
              fraFirmanteSusp.IsEmpty, fraFirmanteSusp, 'El Firmante es obligatorio para éste Código de Suspensión');
    //formato para el codigo de rechazo que genera carta
    Verificar(not(fraRechASin.IsEmpty) and (fraRechASin.sdqDatos.FieldByName('tr_generacarta').AsString = 'S') and
              fraFormatoRech.IsEmpty, fraFormatoRech, 'El Formato es obligatorio para éste Código de Rechazo');
    //firmante para el codigo de rechazo que genera carta
    Verificar(not(fraRechASin.IsEmpty) and (fraRechASin.sdqDatos.FieldByName('tr_generacarta').AsString = 'S') and
              fraFirmanteRech.IsEmpty, fraFirmanteRech, 'El Firmante es obligatorio para éste Código de Rechazo');
    //si estoy por suspender con fecha de vencimiento menor a la actual
    Verificar(not(bSuspendidoASin) and
             (sSuspPlazoSin <> fraSuspASin.Codigo) and
             (dVencimSusp < DBDate) and
              not(Seguridad.Claves.IsActive('SUSPENDER_VENCIDO_SIN')) and
              not(bCambiarArea),
              fraSuspASin, 'No posee permisos para suspender plazos anteriores a la fecha actual');
    //si estoy por rechazar con fecha de vencimiento menor a la actual
    Verificar(not(bRechazadoASin) and
             (sRechazoSin <> fraRechASin.Codigo) and
             (dVencimRech < DBDate) and
              not(Seguridad.Claves.IsActive('RECHAZAR_VENCIDO_SIN')) and
              not(bCambiarArea),
              fraRechASin, 'No posee permisos para rechazar plazos anteriores a la fecha actual');
    //si esta por rechazar del area siniestros, y el formato seleccionado requiere motivo de rechazo
    Verificar(not(fraRechASin.IsEmpty) and ExigeMotivoRechazo(fraFormatoRech.Codigo) and
             (Trim(edMotivoRechazo.Text) = '') and (not edMotivoRechazo.ReadOnly), edMotivoRechazo,
             'El Motivo de Rechazo es obligatorio para éste Código de Rechazo'); 

    ValidarDatos := True;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.GridDblClick(Sender: TObject);
begin
  tbModificarClick(Self);
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.SiniestroRechazado(CodRechazo :String) :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT tr_suspendeotra ' +
           ' FROM str_tiporechazosin ' +
          ' WHERE tr_codigo = ' + SqlValue(CodRechazo);
  Result := (CodRechazo <> '') and (ValorSql(sSql) = 'S');
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.HabilitarFormatoFirmanteSusp(Decision :String);
begin
  if (Decision <> 'S') and not(fraFormatoSusp.ReadOnly) then
  begin
    fraFormatoSusp.Clear;
    fraFirmanteSusp.Clear;
  end;
  LockControls([fraFormatoSusp, fraFirmanteSusp], not(Decision = 'S'));

  if (Decision = 'S') and fraFirmanteSusp.IsEmpty then
    fraFirmanteSusp.Codigo := IntToStr(GetFirmaDigital(IIF(bRechazaAMed, AREA_MED, AREA_SIN),
                                                       MODULO_SUSPPLAZO, Sesion.UserID));
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.HabilitarFormatoFirmanteRech(Decision :String);
var
  bHabilitar :Boolean;
begin
  //solamente habilito si no estaba rechazado por el otro area y la carta no esta impresa
  bHabilitar  := (Decision = 'S') and
                 ((bRechazaAMed and not bRechazadoASin and not bCartaImpresaRech) or
                  (bRechazaASin and not bRechazadoAMed and not bCartaImpresaRech) or
                  bEsSinRevertido);

  if (not(bHabilitar) and not(fraFormatoRech.ReadOnly)) then
  begin
    fraFormatoRech.Clear;
    fraFirmanteRech.Clear;
    edMotivoRechazo.Clear;
  end;
  LockControls([fraFormatoRech, fraFirmanteRech, edMotivoRechazo], not(bHabilitar));

  if bHabilitar and fraFirmanteRech.IsEmpty then
    fraFirmanteRech.Codigo := IntToStr(GetFirmaDigital(IIF(bRechazaAMed, AREA_MED, AREA_SIN),
                                                       MODULO_RECHAZOPLAZO, Sesion.UserID));
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoUpdateCartaSusp(IdCartaSusp :Integer);
var
  sSql :String;
begin
  if (IdCartaSusp > 0) and
     ((sFirmanteSusp <> fraFirmanteSusp.Codigo) or
      (sFormatoSusp <> fraFormatoSusp.Codigo)) and
     (
     (bSuspendidoAMed and bSuspendeAMed and not(fraSuspAMedica.IsEmpty) and
      (fraSuspAMedica.sdqDatos.FieldByName('ts_generacarta').AsString = 'S'))
     or
     (bSuspendidoASin and bSuspendeASin and not(fraSuspASin.IsEmpty) and
     (fraSuspASin.sdqDatos.FieldByName('ts_generacarta').AsString = 'S'))
     )
     then begin
       sSql := 'UPDATE cca_carta ' +
                 ' SET ca_idfirma = ' + SqlInt(StrToInt(fraFirmanteSusp.Codigo)) + ',' +
                     ' ca_idtextocarta = ' + SqlInt(StrToInt(fraFormatoSusp.ID)) + ',' +
                     ' ca_idareatexto = ' + SqlInt(fraFormatoSusp.sdqDatos.FieldByName('at_id').AsInteger) + ',' +
                     ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                     ' ca_fechamodif = actualdate ' +
               ' WHERE ca_id = ' + SqlInt(IdCartaSusp);
       EjecutarSqlST(sSql);
     end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoUpdateCartaRech(IdCartaRech :Integer);
var
  sSql :String;
begin
  if (IdCartaRech > 0) and
     ((sFirmanteRech <> fraFirmanteRech.Codigo) or
      (sFormatoRech <> fraFormatoRech.Codigo) or bCambioObservaciones) and
     (
     ({bRechazadoAMed and } bRechazaAMed and not(fraRechAMedica.IsEmpty) and
      (fraRechAMedica.sdqDatos.FieldByName('tr_generacarta').AsString = 'S'))
     or
     ({bRechazadoASin and } bRechazaASin and not(fraRechASin.IsEmpty) and
     (fraRechASin.sdqDatos.FieldByName('tr_generacarta').AsString = 'S'))
     )
     then begin
      sSql := 'UPDATE cca_carta ' +
                ' SET ca_idfirma = ' + SqlInt(StrToInt(fraFirmanteRech.Codigo)) + ',' +
                    ' ca_idtextocarta = ' + SqlInt(StrToInt(fraFormatoRech.ID)) + ',' +
                    ' ca_observaciones = ' + SqlString(edMotivoRechazo.Lines.Text, True) + ',' +
                    ' ca_motivorechazobase = ' + SqlString(edMotivoRechazoPatBase.Lines.Text, True) + ',' +
                    ' ca_idareatexto = ' + SqlInt(fraFormatoRech.sdqDatos.FieldByName('at_id').AsInteger) + ',' +
                    ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' ca_fechamodif = actualdate ' +
              ' WHERE ca_id = ' + SqlInt(IdCartaRech);
      EjecutarSqlST(sSql);
    end;
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.ExigeMotivoRechazo(Codigo :String) :Boolean;
var
  sSql :String;
begin
  {sSql := 'SELECT dt_detalle ' +
           ' FROM cdt_textoscartasdoc ' +
          ' WHERE dt_formato = ' + SqlValue(Codigo); }

  ssql := ' select tc_exigerechazo ' +
          '   from ctc_textocarta ' +
          '  where tc_codigo = :cod ' +
          '    and tc_fechabaja is null ';

  Result := (ValorSqlEx(sSql, [Codigo]) = 'S');
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.edMotivoRechazoChange(Sender: TObject);
begin
  bCambioObservaciones := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbSalir2Click(Sender: TObject);
begin
  tbSalirClick(Nil);
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.HayRegistroActivo :Boolean;
begin
  Result := sdqConsulta.Active and not sdqConsulta.Eof;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbReversionClick(Sender: TObject);
var
  bRechazado, bEsSinGobernacion :Boolean;
  sSql, sGob :String;
  sqlResults :TStringList;
begin
  if HayRegistroActivo then
  begin
    edSinRev.SetValues(sdqConsultaEX_SINIESTRO.AsInteger,
                       sdqConsultaEX_ORDEN.AsInteger,
                       sdqConsultaEX_RECAIDA.AsInteger);
    edTrabajadorRev.Text  := sdqConsultaTJ_NOMBRE.AsString;

    //a esto lo hago asi porque no puedo refrescar la pantalla despues de que dieron aceptar (!!!),
    //entonces cargo los valores nuevamente para asegurarme de que no estén desactualizados
    sSql := sqlBase +
      	   ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_SUSPPLAZO) + ')=prestc.ca_id(+) ' +
           ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_RECHAZOPLAZO) + ')=crech.ca_id(+) ' +
        	 ' AND art.siniestro.get_ultidcartadocumentoempresa(ex_id, ' + SqlValue(MODULO_REVERSION) + ')=crev.ca_id(+) ' +
           ' AND ex_id = ' + SqlInt(sdqConsultaEX_ID.AsInteger);

    SqlResults := ValoresColSQL(sSql);
    try
      //todas estas variables tengo que usar por el maldito NO refresco de pantalla
      sRechazoMed   := SqlResults[2];
      sRechazoSin   := SqlResults[3];
      sRevMed       := sqlResults[25];
      sRevSin       := sqlResults[26];
      sFormatoRev   := sqlResults[27];
      sFirmanteRev  := sqlResults[28];

      fraRevRechAMed.Codigo := sRechazoMed;
      fraRevRechASin.Codigo := sRechazoSin;
      sSql := 'SELECT 1 FROM str_tiporechazosin ' +
              ' WHERE tr_generacarta = ''S'' ' +
                ' AND tr_codigo = ' + IIF(bRechazaAMed, SqlValue(sRechazoMed), SqlValue(sRechazoSin));
      bRechazado              := ExisteSql(sSql);
      bCartaImpresaRev        := not(IsEmptyString(sqlResults[23]));
      bCartaGeneradaRev       := (StrToInt(sqlResults[24]) > 0);
      pnlRevAMed.Enabled      := bRechazaAMed and not(bCartaImpresaRev) and
                                 (bRechazado or (not(bRechazado) and fraRevRechAMed.IsEmpty));
      pnlRevASin.Enabled      := bRechazaASin and not(bCartaImpresaRev) and
                                 (bRechazado or (not(bRechazado) and fraRevRechASin.IsEmpty));
      rbSiRevAMed.Checked     := (sRevMed = 'S');
      rbSiRevASin.Checked     := (sRevSin = 'S');
      rbNoRevAMed.Checked     := (sRevMed = 'N');
      rbNoRevASin.Checked     := (sRevSin = 'N');
      bEsSinGobernacion       := Is_SiniestroDeGobernacion(sdqConsultaEX_ID.AsInteger);
      sGob                    := ' AND tc_gobernacion ' + IIF(bEsSinGobernacion, '=', '<>') + ' ''S'' ';
      //primero se cargan...
      fraFormatoRev.Sql       := sqlFormato;
      fraFirmanteRev.Sql      := sqlFirmante;
      fraFormatoRev.Codigo    := sFormatoRev;
      fraFirmanteRev.Codigo   := sFirmanteRev;
    finally
      SqlResults.Free;
    end;
    //...y despues se restringen segun el area y la baja
    fraFormatoRev.Sql       := sqlFormato + ' AND ta_fechabaja IS NULL ' + sGob +
                                            ' AND tc_fechabaja IS NULL ' +
                                            ' AND at_modulo = ' + SqlValue(MODULO_REVERSION) +
                                            ' AND at_area = ' +  IIF(bRechazaAMed, SqlValue(AREA_MED), SqlValue(AREA_SIN));
    fraFirmanteRev.Sql      := sqlFirmante + ' AND at_area = ' +  IIF(bRechazaAMed, SqlValue(AREA_MED), SqlValue(AREA_SIN)) +
                                             ' AND fa_fechabaja IS NULL ' +
                                             ' AND fi_fechabaja IS NULL ' +
                                             ' AND at_fechabaja IS NULL ' +
                                             ' AND at_modulo = ' + SqlValue(MODULO_REVERSION);
    fpReversion.ShowModal;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoHabilitarFormatoRev(bChecked :Boolean);
var
  sSql :String;
  bNoRechazo, bHabilita :Boolean;
begin
  sSql := 'SELECT 1 FROM str_tiporechazosin ' +
          ' WHERE tr_generacarta = ''N'' ' +
            ' AND tr_codigo = ' + IIF(bRechazaAMed, SqlValue(fraRevRechASin.Codigo),
                                                    SqlValue(fraRevRechAMed.Codigo));
  if bChecked then
  begin
    bNoRechazo  := ExisteSql(sSql);
    bHabilita   := not(bCartaImpresaRev) and
                   (
                    bNoRechazo or //si el otro area no rechazó
                    (bRechazaAMed and rbSiRevASin.Checked) or //si el otro area ya decidio revertir
                    (bRechazaASin and rbSiRevAMed.Checked)
                   );
    LockControls([fraFormatoRev, fraFirmanteRev], not(bHabilita));

    if bHabilita and fraFirmanteRev.IsEmpty then
      fraFirmanteRev.Codigo := IntToStr(GetFirmaDigital(IIF(bRechazaAMed, AREA_MED, AREA_SIN),
                                                        MODULO_REVERSION, Sesion.UserID));
  end
  else begin
    fraFormatoRev.Clear;
    fraFirmanteRev.Clear;
    LockControls([fraFormatoRev, fraFirmanteRev], True);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnAceptarRevClick(Sender: TObject);
var
  sSql, sRevierte, sWhere :String;
begin
  if ValidarDatosReversion then
  begin
    sWhere := ' WHERE ex_siniestro = ' + SqlInt(edSinRev.Siniestro) +
                ' AND ex_orden = ' + SqlInt(edSinRev.Orden) +
                ' AND ex_recaida = ' + SqlInt(edSinRev.Recaida);
    try
      BeginTrans;

      if bRechazaAMed then
      begin
        sRevierte := IIF(rbSiRevAMed.Checked, 'S', IIF(rbNoRevAMed.Checked, 'N', ''));
        if (sRevMed <> sRevierte) then
        begin
          sSql := 'UPDATE sex_expedientes ' +
                    ' SET ex_reversionmed = ' + SqlString(sRevierte, True, True) + ',' +
                        ' ex_usurevmed = ' + SqlValue(Sesion.UserID) + ',' +
                        ' ex_fecharevmed = ActualDate ' + sWhere;
          EjecutarSqlST(sSql);
        end;
      end;

      if bRechazaASin then
      begin
        sRevierte := IIF(rbSiRevASin.Checked, 'S', IIF(rbNoRevASin.Checked, 'N', ''));
        if (sRevSin <> sRevierte) then
        begin
          sSql := 'UPDATE sex_expedientes ' +
                    ' SET ex_reversionsin = ' + SqlString(sRevierte, True, True) + ',' +
                        ' ex_usurevsin = ' + SqlValue(Sesion.UserID) + ',' +
                        ' ex_fecharevsin = ActualDate ' + sWhere;
          EjecutarSqlST(sSql);
        end;
      end;

      DoUpdateCartaRev(sdqConsultaIDCARTAREV.AsInteger);

      //inserto la carta de reversion si corresponde
      if (not(bCartaGeneradaRev) and rbSiRevAMed.Checked and bRechazaAMed and not(fraFormatoRev.IsEmpty)) or
         (not(bCartaGeneradaRev) and rbSiRevASin.Checked and bRechazaASin and not(fraFormatoRev.IsEmpty)) then
      begin
        DoInsertarCarta(StrToInt(fraFormatoRev.ID), edSinRev.Siniestro, edSinRev.Orden,
                        edSinRev.Recaida, fraFirmanteRev.Codigo, IIF(bRechazaAMed, AREA_MED, AREA_SIN),
                        False, ART_EMPTY_ID, tdEmpresa);
      end;
      CommitTrans;
      fpReversion.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        if InTransaction then RollBack;
        ErrorMsg(E, 'Error al Guardar los Datos.');
      end;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.rbSiRevAMedClick(Sender: TObject);
begin
  DoHabilitarFormatoRev(True);
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.rbSiRevASinClick(Sender: TObject);
begin
  DoHabilitarFormatoRev(True);
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.rbNoRevAMedClick(Sender: TObject);
begin
  DoHabilitarFormatoRev(False);
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.rbNoRevASinClick(Sender: TObject);
begin
  DoHabilitarFormatoRev(False);
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoUpdateCartaRev(IdCartaRev :Integer);
var
  sSql :String;
begin
  if (IdCartaRev > 0) and bCartaGeneradaRev and not(bCartaImpresaRev) and
     ((sFormatoRev <> fraFormatoRev.Codigo) or
      (sFirmanteRev <> fraFirmanteRev.Codigo))
  then
  begin
    sSql := 'UPDATE cca_carta ' +
              ' SET ca_idfirma = ' + SqlInt(StrToInt(fraFirmanteRev.Codigo)) + ',' +
                  ' ca_idtextocarta = ' + SqlInt(StrToInt(fraFormatoRev.ID)) + ',' +
                  ' ca_idareatexto = ' + SqlInt(fraFormatoRev.sdqDatos.FieldByName('at_id').AsInteger) + ',' +
                  ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' ca_fechamodif = actualdate ' +
            ' WHERE ca_id = ' + SqlInt(IdCartaRev);
    EjecutarSqlST(sSql);
  end;
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.ValidarDatosReversion :Boolean;
begin
  Verificar(bCartaGeneradaRev and fraFormatoRev.IsEmpty, fraFormatoRev,
            'Debe seleccionar formato para la Carta.');
  Verificar(bCartaGeneradaRev and fraFirmanteRev.IsEmpty, fraFirmanteRev,
            'Debe seleccionar firmante para la Carta.');
  Verificar(not(fraFormatoRev.IsEmpty) and fraFirmanteRev.IsEmpty, fraFirmanteRev,
           'Si selecciona formato, debe seleccionar firmante.');
  Verificar(fraFormatoRev.IsEmpty and not(fraFirmanteRev.IsEmpty), fraFormatoRev,
           'Si selecciona firmante, debe seleccionar formato.');
  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fpReversionClose(Sender: TObject; var Action: TCloseAction);
begin
  edSinRev.Clear;
  edTrabajadorRev.Clear;
  fraRevRechAMed.Clear;
  fraRevRechASin.Clear;
  fraFormatoRev.Clear;
  fraFirmanteRev.Clear;
  rbSiRevAMed.Checked := False;
  rbNoRevAMed.Checked := False;
  rbSiRevASin.Checked := False;
  rbNoRevASin.Checked := False;
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.ActualizarEstadoSin :String;
var
  sSql, sRes :String;
begin
  sSql := 'SELECT tr_generacarta ' +
           ' FROM sin.str_tiporechazosin ' +
          ' WHERE tr_codigo = ' + SqlValue(fraRechASin.Codigo);

  if (ValorSql(sSql) = 'N') and
     (sEstado = '02') and (sSuspPlazoSin = 'S') and
     ((dSuspMed = 0) or (sSuspPlazoMed <> 'S') or
      ((sSuspPlazoMed = 'S') and (dSuspMed > Nvl(dSuspSin, dSuspMed + 1)))
     ) then
  begin
    sRes := ', ex_suspensionplazo = ''N'', ex_estado = ''01'' ';
    DoActualizarEstado(True);
  end;
  Result := sRes;
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.ActualizarEstadoMed :String;
var
  sSql, sRes :String;
begin
  sSql := 'SELECT tr_generacarta ' +
           ' FROM sin.str_tiporechazosin ' +
          ' WHERE tr_codigo = ' + SqlValue(fraRechAMedica.Codigo);

  if (ValorSql(sSql) = 'N') and
     (sEstado = '02') and (sSuspPlazoMed = 'S') and
     ((dSuspSin = 0) or (sSuspPlazoSin <> 'S') or
      ((sSuspPlazoSin = 'S') and (dSuspSin > Nvl(dSuspMed, dSuspSin + 1)))
     ) then
  begin
    sRes := ', ex_suspensionplazo = ''N'', ex_estado = ''01'' ';
    DoActualizarEstado(False);
  end;
  Result := sRes;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoActualizarEstado(bEsAreaSin :Boolean);
var
  sSql, sObs :String;
begin
  sObs := Decode(IIF(bEsAreaSin, fraRechASin.Codigo, fraRechAMedica.Codigo),
          ['A'], ['Aceptación del siniestro (módulo Aceptación/Rechazo)'],
          'No rechazo del siniestro por plazo vencido (módulo Aceptación/Rechazo)');

  sSql  := 'siniestro.do_actu_estado_siniestro(' + sdqConsultaEX_ID.AsString + ', ''01'', ' +
           SqlValue(sObs) + ',null, null, ' +
           SqlValue(Sesion.UserID) + ', null);';
  EjecutarStoreST(sSql);
end;
{------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.UsuarioTienePermiso :Boolean;
begin
  Verificar(not(bSuspendeAMed) and not(bSuspendeASin) and
            not(bRechazaAMed) and not(bRechazaASin), Grid,
            'Usted no posee permisos para Suspender o Aceptar/Rechazar.'); 
  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.rbAreaSiniestrosClick(Sender: TObject);
begin
  DoCambiarPermisos;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.rbAreaMedicaClick(Sender: TObject);
begin
  DoCambiarPermisos;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoCambiarPermisos;
begin
  bSuspendeASin := rbAreaSiniestros.Checked;
  bRechazaASin  := rbAreaSiniestros.Checked;
  bSuspendeAMed := rbAreaMedica.Checked;
  bRechazaAMed  := rbAreaMedica.Checked;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fraSuspASinPropiedadesChange(Sender: TObject);
begin
  inherited;
  //esto no me gusta pero ya lo voy a corregir....
  if fraSuspASin.IsEmpty then
    HabilitarFormatoFirmanteSusp('N')
  else
    HabilitarFormatoFirmanteSusp(fraSuspASin.sdqDatos.FieldByName('ts_generacarta').AsString);
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fraSuspAMedicaPropiedadesChange(Sender: TObject);
begin
  inherited;
  if fraSuspAMedica.IsEmpty then
    HabilitarFormatoFirmanteSusp('N')
  else
    HabilitarFormatoFirmanteSusp(fraSuspAMedica.sdqDatos.FieldByName('ts_generacarta').AsString);
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fraRechAMedicaPropiedadesChange(Sender: TObject);
begin
  inherited;
  if fraRechAMedica.IsEmpty then
    HabilitarFormatoFirmanteRech('N')
  else
  begin
    HabilitarFormatoFirmanteRech(fraRechAMedica.sdqDatos.FieldByName('tr_generacarta').AsString);
    if ((fraRechAMedica.sdqDatos.FieldByName('tr_automatico').AsString = 'S') or
        (valorsqlex('select tr_automatico from str_tiporechazosin where tr_codigo = :cod and tr_fechabaja is null', [sTipoRechAMed]) = 'S'))
        and (not Seguridad.Claves.IsActive('REVERTIR_AV_MED')) then    // la Clave es por Ticket 54442
    begin
      InvalidHint(fraRechAMedica, 'Este motivo de rechazo es automático y no se puede seleccionar ni cambiar');
      fraRechAMedica.Codigo := sTipoRechAMed;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fraRechASinPropiedadesChange(Sender: TObject);
begin
  inherited;
  if fraRechASin.IsEmpty then
    HabilitarFormatoFirmanteRech('N')
  else
  begin
    HabilitarFormatoFirmanteRech(fraRechASin.sdqDatos.FieldByName('tr_generacarta').AsString);
    if ((fraRechASin.sdqDatos.FieldByName('tr_automatico').AsString = 'S') or
        (valorsqlex('select tr_automatico from str_tiporechazosin where tr_codigo = :cod and tr_fechabaja is null', [sTipoRechASin]) = 'S'))
       and (not Seguridad.Claves.IsActive('REVERTIR_AV_SIN')) then     // la Clave es por Ticket 54442
    begin
      InvalidHint(fraRechASin, 'Este motivo de rechazo es automático y no se puede seleccionar ni cambiar');
      fraRechASin.Codigo := sTipoRechASin;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.edFechaChange(Sender: TObject);
begin
  if (iDelegacionCitacion > 0) then edHora.Clear;
  edFecha2.Clear;
  edFecha2.MinDate := edFecha.Date;

  if edFecha.Date > 0 then
    edFechaTXT.Text := DateFormat(edFecha.Date, dfLong)
  else
    edFechaTXT.Text := '';
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.edFecha2Change(Sender: TObject);
begin
  if (iDelegacionCitacion > 0) then edHora2.Clear;
  if edFecha2.Date > 0 then
    edFecha2TXT.Text := DateFormat(edFecha2.Date, dfLong)
  else
    edFecha2TXT.Text := '';
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.OnfraMedicoChange(Sender: TObject);
var
  sSql :String;
  bTieneTurnos :Boolean;
begin
  bTieneTurnos        := False;
  iDelegacionCitacion := GetDelegacionCitacion;
  if not(fraMedicoCitacion.IsEmpty) then
  begin
    sSql := 'SELECT 1 FROM stm_turnosmedicos ' +
            ' WHERE tm_auditor = :Medico ' +
              ' AND tm_fechabaja IS NULL';
    if ExisteSqlEx(sSql, [fraMedicoCitacion.ID]) then bTieneTurnos := True;
  end;
  DoHabilitarFechaHora(((iDelegacionCitacion > 0) and bTieneTurnos));
end;
{------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoHabilitarFechaHora(bHabilitar :boolean);
begin
  edHora.Clear;
  edHora2.Clear;
  edHora.Enabled       := not(bHabilitar);
  edHora2.Enabled      := not(bHabilitar);
  btnGetTurno.Visible  := bHabilitar;
  btnGetTurno2.Visible := bHabilitar;
end;
{-------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.GetDelegacionCitacion :Integer;
begin
  if (fraConsultorio.Especial1 <> '') then
  //la delegacion de citacion al consultorio está en TB_ESPECIAL1
    Result := StrToInt(fraConsultorio.Especial1)
  else
    Result := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnGetTurnoClick(Sender: TObject);
begin
  if Verificar(fraMedicoCitacion.IsEmpty, fraMedicoCitacion, 'Debe ingresar el médico') and
     Verificar(edFecha.IsEmpty, edFecha, 'Debe ingresar la fecha del turno')
  then
    GetTurno(edFecha.Date, fraMedicoCitacion.Codigo, 1);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.GetTurno(dFecha :TDate; sMedico :String; iTurno :integer);
var
  sTurno, sSql :String;
begin
  sSql := 'SELECT art.amebpba.get_proximoturno(' +
                 SqlValue(sMedico) + ',' +
                 SqlDate(dFecha) + ') FROM dual';

  sTurno  := ValorSql(sSql);
  if (length(sTurno) = 5) then //dio un horario como resultado
  begin
     if (iTurno = 1) then
     begin
      edHora.Text := sTurno;
      //la segunda fecha debe ser al menos un dia habil por medio despues de la primera
      edFecha2.Date    := CalcDiasHabiles(edFecha.Date, 2);
      edFecha2.MinDate := edFecha2.Date;
     end else
       edHora2.Text := sTurno;
  end else
    MsgBox(sTurno);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnGetTurno2Click(Sender: TObject);
begin
  if Verificar(fraMedicoCitacion.IsEmpty, fraMedicoCitacion, 'Debe ingresar el médico') and
     Verificar(edFecha2.IsEmpty, edFecha2, 'Debe ingresar la segunda fecha del turno')
  then
    GetTurno(edFecha2.Date, fraMedicoCitacion.Codigo, 2);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnAceptarCitacionClick(Sender: TObject);
var
  sSql :String;
  iIdTurno, iIdTurno2 :Integer;
begin
  Verificar(fraConsultorio.IsEmpty, fraConsultorio, 'Debe seleccionar consultorio.');
  Verificar(fraMedicoCitacion.IsEmpty, fraMedicoCitacion, 'Debe seleccionar médico.');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe ingresar la fecha de citación.');
  Verificar(edFecha.Date < DBDate, edFecha, 'La fecha de citación no puede ser menor a la actual.');
  Verificar((Trim(edHora.Text) = ':'), edHora, 'Debe ingresar la hora de citación.');
  Verificar(not(IsTime(edHora.Text)), edHora, 'La hora de citación ingresada es inválida.');
  Verificar(edFecha2.IsEmpty, edFecha2, 'Debe ingresar la segunda fecha de citación.');
  Verificar((Trim(edHora2.Text) = ':'), edHora2, 'Debe ingresar la segunda hora de citación.');
  Verificar(not(IsTime(edHora2.Text)), edHora2, 'La segunda hora de citación ingresada es inválida.');
  Verificar(fraSector.IsEmpty, fraSector, 'Debe seleccionar el sector.');

  iIdTurno   := 0;
  iIdTurno2  := 0;
  sSql       := 'SELECT cc_id ' +
                 ' FROM mcc_citacionconsultorio ' +
                ' WHERE cc_idcartaemp = :IdCarta ';

  if (AccionCita = Edicion) then
  begin
    iIdTurno  := ValorSqlIntegerEx(sSql + ' AND cc_primerturno = ''S'' ', [iIdCartaSusp]);
    iIdTurno2 := ValorSqlIntegerEx(sSql + ' AND cc_primerturno = ''N'' ', [iIdCartaSusp]);
  end;
  ActualizarTurno(SinCitacion.Siniestro, SinCitacion.Orden, SinCitacion.Recaida,
                  GetDelegacionCitacion, edFecha.Date, edHora.Text,
                  fraMedicoCitacion.Codigo, fraSector.Codigo,
                  fraConsultorio.Codigo, iIdTurno,
                  IIF((AccionCita = Alta), iIdCartaSusp, 0), 0, 0, 'S',
                  edObservaciones.Lines.Text, (AccionCita = Edicion));
  ActualizarTurno(SinCitacion.Siniestro, SinCitacion.Orden, SinCitacion.Recaida,
                  GetDelegacionCitacion, edFecha2.Date, edHora2.Text,
                  fraMedicoCitacion.Codigo, fraSector.Codigo,
                  fraConsultorio.Codigo, iIdTurno2,
                  IIF((AccionCita = Alta), iIdCartaSusp, 0), 0, 0, 'N',
                  edObservaciones.Lines.Text, (AccionCita = Edicion));

  fpDatosCitacion.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.DoMostrarCitacion(bEsAlta, bSoloLectura :Boolean) :Boolean;
var
  sSql :String;
  sdqAux :TSDQuery;
begin
  if bEsAlta and not(fraFormatoSusp.IsEmpty) and
    (fraFormatoSusp.sdqDatos.FieldByName('tc_datoscitacion').AsString = 'S') then
  begin
    fraConsultorio.Clear;
    fraMedicoCitacion.Clear;
    edFecha.Clear;
    edHora.Clear;
    edFechaTXT.Clear;
    edFecha2.Clear;
    edHora2.Clear;
    edFecha2TXT.Clear;
    fraSector.Clear;
    edObservaciones.Clear;
    AccionCita  := Alta;
    DoBloquearCitacion(False);
    Result      := (fpDatosCitacion.ShowModal = mrOk);
  end
  else if not(bEsAlta) then
  begin
    sSql := 'SELECT cc_fecha, cc_hora, cc_medico, cc_observaciones, cc_sector, ' +
                  ' cc_primerturno, cc_consultorio ' +
             ' FROM mcc_citacionconsultorio, cca_carta ' +
            ' WHERE cc_idcartaemp = ca_id ' +
              ' AND cc_idcartaemp = :IdCarta ' +
              ' AND cc_siniestro = :Sini ' +
              ' AND cc_orden = :Orden ' +
              ' AND cc_recaida = :Reca ';
    sdqAux := GetQueryEx(sSql, [iIdCartaSusp, sdqConsultaEX_SINIESTRO.AsInteger,
                                sdqConsultaEX_ORDEN.AsInteger, sdqConsultaEX_RECAIDA.AsInteger]);
    with sdqAux do
    try
      fraConsultorio.Codigo       := FieldByName('cc_consultorio').AsString;
      fraMedicoCitacion.Codigo    := FieldByName('cc_medico').AsString;
      edFecha.Date                := FieldByName('cc_fecha').AsDateTime;
      edHora.Text                 := FieldByName('cc_hora').AsString;
      fraSector.Codigo            := FieldByName('cc_sector').AsString;
      edObservaciones.Lines.Text  := FieldByName('cc_observaciones').AsString;
      Next;
      if not Eof then
      begin
        edFecha2.Date  := FieldByName('cc_fecha').AsDateTime;
        edHora2.Text   := FieldByName('cc_hora').AsString;
      end;
    finally
      Free;
    end;
    AccionCita  := Edicion;
    DoBloquearCitacion(bSoloLectura);
    Result      := (fpDatosCitacion.ShowModal = mrOk);
  end
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fpDatosCitacionClose(Sender: TObject; var Action: TCloseAction);
begin
  AccionCita := None;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnCancelarCitacionClick(Sender: TObject);
begin
  Rollback(True);
  fpDatosCitacion.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbCitacionClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT nvl(ca_id, 0) idcartasusp, NVL((trunc(ca_fechaimpresion)-1), cc_fecha) fecha ' +
           ' FROM cca_carta, sex_expedientes, mcc_citacionconsultorio ' +
          ' WHERE ex_id = ca_idexpediente ' +
            ' AND ex_id = :idex ' +
            ' AND siniestro.get_ultidcartadocumentoempresa(ex_id, :modulo) = ca_id ' +
            ' AND cc_idcartaemp = ca_id ' +
            ' AND cc_fechabaja IS NULL ' +
            ' AND cc_primerturno = ''S'' ';
  with GetQueryEx(sSql, [sdqConsultaEX_ID.AsInteger, MODULO_SUSPPLAZO]) do
  try
    if not Eof then
    begin
      iIdCartaSusp := FieldByName('idcartasusp').AsInteger;
      DoMostrarCitacion(False, FieldByName('fecha').AsDateTime < DBDate);
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fpDatosCitacionBeforeShow(Sender: TObject);
begin
  SinCitacion.SetValues(sdqConsultaEX_SINIESTRO.AsInteger,
                        sdqConsultaEX_ORDEN.AsInteger,
                        sdqConsultaEX_RECAIDA.AsInteger);
  edTrabajadorCita.Text := sdqConsultaTJ_NOMBRE.AsString;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoBloquearCitacion(bBloquear :boolean);
begin
  LockControls([fraConsultorio, fraMedicoCitacion, edFecha, edHora, edFecha2, edHora2,
                fraSector, edObservaciones, btnAceptarCitacion], bBloquear);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
var
  sSql :String;
begin
  if Trim(cmbGTrabajo.Text) <> '' then  // Lu 04/04/2008 pongo este if para que ejecute lo siguiente solo si se ingreso algo en el combo.
  begin
      cmbGestor.Clear;
      sSql := 'SELECT ug_id, ug_usuario ' +
               ' FROM mgp_gtrabajo, mug_usuariogrupotrabajo, ctb_tablas ' +
              ' WHERE ug_fechabaja IS NULL ' +
                ' AND ug_tipousuario = tb_codigo ' +
                ' AND tb_clave = ''TUSU'' ' +
                ' AND tb_especial1 = ''S'' ' +
                ' AND gp_codigo = ug_grupo ' +
                ' AND gp_gestionado = ''S'' ' +
                ' AND gp_codigo ' + cmbGtrabajo.InSql;
      sdqGestor.Close;
      sdqGestor.SQL.Text := sSql;
      sdqGestor.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmSuspensionPlazos := Nil;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.mnuViajarParteClick(Sender: TObject);   // Lu WF 7862
begin
  inherited;
  if edSiniestro.IsEmpty then
    Exit;
  with frmParteEvolutivo do
  begin
    if not(Assigned(frmParteEvolutivo)) then
    begin
      frmParteEvolutivo := TfrmParteEvolutivo.Create(frmPrincipal);
      FormStyle         := fsMDIChild;
    end;
    SinEdit.SetValues(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
    CargarPartes;
    Show;
  end;
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.tbImprimirClick(Sender: TObject);
var
  sSubtitulo: string;
begin
  QueryPrint.Title.Text    := '';
  QueryPrint.SubTitle.Text := '';

  if rbSuspMed.checked or rbSuspSin.Checked then           // Lu TK 2437
    QueryPrint.Title.Text := 'Suspensión de Plazos'
  else if rbRechMed.Checked or rbRechSin.Checked then
    QueryPrint.Title.Text := 'Aceptación de Rechazo'
  else
    QueryPrint.Title.Text := 'Suspensión de Plazos / Aceptación - Rechazo';

  // Subtitulos por TK 2437 pedidos por Adriana Aguirre..
  if (edFReasigDesde.Date > 0) or (edFReasigHasta.Date > 0) then    // Fecha de Reasignacion
  begin
    sSubtitulo := '';
    sSubtitulo := sSubtitulo + 'F.Reasign';
    if (edFReasigDesde.Date > 0) then
      sSubtitulo := sSubtitulo + ' desde ' + edFReasigDesde.Text;
    if (edFReasigHasta.Date > 0) then
      sSubtitulo := sSubtitulo + ' hasta ' + edFReasigHasta.Text;
    QueryPrint.SubTitle.Lines.Add(sSubtitulo);
  end;
  if (edFVtoSuspDesde.Date > 0) or (edFVtoSuspHasta.Date > 0) then    // Fecha de Vencimiento de Suspensión.
  begin
    sSubtitulo := '';
    sSubtitulo := sSubtitulo + 'F.Venc.Susp.';
    if (edFVtoSuspDesde.Date > 0) then
      sSubtitulo := sSubtitulo + ' desde ' + edFVtoSuspDesde.Text;
    if (edFVtoSuspHasta.Date > 0) then
      sSubtitulo := sSubtitulo + ' hasta ' + edFVtoSuspHasta.Text;
    QueryPrint.SubTitle.Lines.Add(sSubtitulo);
  end;
  if (edFVtoRechDesde.Date > 0) or (edFVtoRechHasta.Date > 0) then    // Fecha de Vencimiento de Rechazo.
  begin
    sSubtitulo := '';
    sSubtitulo := sSubtitulo + 'F.Venc.Rech.';
    if (edFVtoRechDesde.Date > 0) then
      sSubtitulo := sSubtitulo + ' desde ' + edFVtoRechDesde.Text;
    if (edFVtoRechHasta.Date > 0) then
      sSubtitulo := sSubtitulo + ' hasta ' + edFVtoRechHasta.Text;
    QueryPrint.SubTitle.Lines.Add(sSubtitulo);
  end;
  if (Trim(cmbDelegacion.Text) <> '') then                            // Delegacion
    QueryPrint.SubTitle.Lines.Add('Deleg: ' + cmbDelegacion.Text);
  if (Trim(cmbGtrabajo.Text) <> '') then                              // Grupo de Trabajo
    QueryPrint.SubTitle.Lines.Add('Gr.Tr: ' + cmbGtrabajo.Text);
  if (Trim(cmbGestor.Text) <> '') then                                // Gestor
    QueryPrint.SubTitle.Lines.Add('Gest: ' + cmbGestor.Text);

  QueryPrint.SubTitle.Lines.Add(' ');
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.Do_habilitacionCmbDelegacion(sDelegSesion: String);   // TK 25087
var
  sSql: string;
begin
  sSql := 'SELECT ls_deleg_susp ID, el_nombre NOMBRE ' +
           ' FROM art.dls_delegsusp, art.del_delegacion ' +
          ' WHERE el_id = ls_deleg_susp(+) ' +
            ' AND ls_deleg_padre = :dele ' +
       ' ORDER BY el_nombre';
  OpenQueryEx(sdqDelegacion, [sDelegSesion], sSql);
  cmbDelegacion.Enabled := not sdqDelegacion.Eof;
end;
{-------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.DelegacionesDLS_inSql(sDelegSesion: String): String;   // TK 25087
var
  sSql, sCadena: string;
begin
  sSql := 'SELECT ls_deleg_susp ' +
           ' FROM art.dls_delegsusp ' +
          ' WHERE ls_deleg_padre = :dele ';
  sCadena := '(';

  with GetQueryEx(sSql, [sDelegSesion]) do
  try
    while not eof do
    begin
      sCadena := sCadena + FieldByName('ls_deleg_susp').AsString + ',';
      Next;
    end;
    sCadena := Copy(sCadena, 1, length(sCadena)-1) + ')';
    Result  := sCadena;
  finally
    free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.fpABMClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  if FDecisionMedica then Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.DoGenerarParteSuspension;
var
  sDeci: String;
  iPrestador: Integer;
begin
  if bSuspendeAMed and IsEmptyString(sSuspPlazoMed) and
    (sSuspPlazoMed <> fraSuspAMedica.Codigo) then
    sDeci := 'Decisión Area Médica: ' + fraSuspAMedica.Descripcion + #10 +
             IIF(fraFormatoSusp.IsSelected, 'Formato suspensión: ' + fraFormatoSusp.Codigo, '') + #10;

  if bRechazaAMed and (( IsEmptyString(sRechazoMed) and (sRechazoMed <> fraRechAMedica.Codigo) ) or ( Seguridad.Claves.IsActive('REVERTIR_AV_MED') and (EsExcepcionEstadoRech(sRechazoMed)) ) ) then    // TK 54442 (EsExcepcionEstadoRech.. ultima observacion de Mario en el ticket
    sDeci := sDeci +  'Decisión Area Médica: ' + fraRechAMedica.Descripcion + #10 +
             IIF(fraFormatoRech.IsSelected, 'Formato rechazo: ' + fraFormatoRech.Codigo, '') + #10 +
             //IIF(IsEmptyString(edMotivoRechazo.Lines.Text), '', 'Motivo rechazo: ' +
             iif(edMotivoRechazo.Lines.Text <> '', 'Motivo rechazo: ' + edMotivoRechazo.Lines.Text, iif(edMotivoRechazoPatBase.Lines.Text <> '', 'Motivo rechazo: ' + edMotivoRechazoPatBase.Lines.Text, '')) + #10;

  if not(IsEmptyString(sDeci)) then
  begin
    iPrestador := IIF(DecisionMedica, PrestadorParte,
                                      ValorSqlIntegerEx('SELECT art.amebpba.get_prestador(:p1, :p2, :p3) ' +
                                                         ' FROM DUAL', [SinABM.Siniestro,
                                                                        SinABM.Orden,
                                                                        SinABM.Recaida]));

    InsertarParteEvolutivo(False, SinABM.Siniestro, SinABM.Orden, SinABM.Recaida, iPrestador,
                           ValorSqlIntegerEx('SELECT NVL(MAX(pv_nroparte), 0) + 1 ' +
                                              ' FROM art.spv_parteevolutivo ' +
                                             ' WHERE pv_siniestro = :Sin ' +
                                               ' AND pv_orden = :Orden ' +
                                               ' AND pv_recaida = :Reca', [SinABM.Siniestro,
                                                                           SinABM.Orden,
                                                                           SinABM.Recaida]),
                           'J', DBDate, 0, 0, 0, '', 0, DBDate, sDeci);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.Do_ControlarCIE10: boolean;    // TK 34934
begin
  // Si el ex_diagnosticooms (Cie-10) es nulo, entonces debe ingresarlo antes de rechazar el siniestro.
  fraCIE10.Clear;
  fraCIE10.ShowBajas := False;
  Result := (fpCie10.ShowModal = mrOk);
end;
{-------------------------------------------------------------------------------}
function TfrmSuspensionPlazos.SiniestroTieneCIE10: boolean;             // TK 34934  Tuve que hacer estas dos funciones por separado
begin
  Result := (ValorSqlEx('Select ex_diagnosticooms From art.sex_expedientes ' +
                        ' where ex_id = :idexp ', [sdqConsultaEX_ID.AsInteger]) <> '');
end;
{-------------------------------------------------------------------------------}
procedure TfrmSuspensionPlazos.btnAceptarCIE10Click(Sender: TObject);   // TK 34934
begin
  Verificar(fraCIE10.IsEmpty, fraCIE10, 'Debe completar el campo CIE-10');
  Do_GuardarCIE10(fraCie10.edCodigo.Text, sdqConsultaEX_ID.AsInteger);
  fpCie10.ModalResult := mrOk;
end;

procedure TfrmSuspensionPlazos.btnCancelarCIE10Click(Sender: TObject);  // TK 34934
begin
  Rollback(True);
  fpCie10.ModalResult := mrCancel;
end;

procedure TfrmSuspensionPlazos.Do_GuardarCIE10(sCodCIE10: string; iIdExped: integer);     // TK 34934
var sSql: string;
begin
  sSql := 'Update art.sex_expedientes ' +
            ' set ex_diagnosticooms = :cie10 ' +
          ' where ex_id = :idexp ';
  EjecutarSqlSTEx(sSql, [sCodCIE10, iIdExped]);
end;

procedure TfrmSuspensionPlazos.OnfraFormatoRechChange(Sender: TObject);
begin
  if (not fraFormatoRech.IsEmpty) and (fraFormatoRech.sdqDatos.FieldByName('tc_rechazobase').AsString = 'S') then
  begin
    vclextra.LockControls(edMotivoRechazoPatBase, false);
    vclextra.LockControls(edMotivoRechazo);
    edMotivoRechazo.Lines.Text := sTextoObs;
  end
  else
  begin
    vclextra.LockControls(edMotivoRechazoPatBase);
    edMotivoRechazoPatBase.Clear;
    vclextra.LockControls(edMotivoRechazo, false);
  end;

end;


procedure TfrmSuspensionPlazos.fpABMShow(Sender: TObject);
begin
  //vclextra.LockControls(edMotivoRechazoPatBase);
  //edMotivoRechazoPatBase.Clear;
end;

procedure TfrmSuspensionPlazos.fraRechAMedicaEnter(Sender: TObject);
begin
  sTipoRechAMed := fraRechAMedica.Codigo;
end;

procedure TfrmSuspensionPlazos.fraRechASinEnter(Sender: TObject);
begin
  sTipoRechASin := fraRechASin.Codigo;
end;

function TfrmSuspensionPlazos.EsExcepcionEstadoRech(sCodRechazoAMed: string): boolean;
var sSql: string;
begin
  sSql := 'SELECT tr_excepcion_parteevol ' +
           ' FROM sin.STR_TIPORECHAZOSIN ' +
          ' WHERE tr_codigo = :codrechamed ';

  Result := (ValorSqlEx(sSql, [sCodRechazoAMed]) = 'S');
end;

procedure TfrmSuspensionPlazos.edSiniestroSelect(Sender: TObject);
begin
  if (not ValidarSiniestroUsuarioTerce(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)) then   // por Plan Ioma - Tercerizadoras
  begin
    InfoHint(edSiniestro, 'Usted no posee permisos para visualizar este siniestro.');
    tbLimpiarClick(nil);
  end;
end;

procedure TfrmSuspensionPlazos.pMenuViajarPopup(Sender: TObject);     // Habilitacion Btn Viajar
begin
  mnuViajarParte.Enabled  := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuParteEvolutivoCarga);
end;

end.
