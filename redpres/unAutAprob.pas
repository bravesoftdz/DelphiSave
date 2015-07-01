unit unAutAprob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit,
  ArtComboBox, Db, SDEngine, unfraPrestador, unfraPrestaciones, Buttons, artSeguridad, LookupDialog, DBGrids, General,
  RxRichEd, StrFuncs, ComCtrls, DateComboBox, Placemnt, ShortCutControl, CurrEdit, IntEdit, unfraSubPrestacion,
  unfraNomenclador, RXDice, Grids, RXDBCtrl, ArtDBGrid, PatternEdit, unVisualizador, FormPanel,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unAutTurnos, unTraslados, unRptRegRehabilitacion, sqlfuncs,
  unRptRegRehabNuevo, unrptFKTNuevo, unrptFonoaudNuevo, unrptMatOrtNuevo, UnRptPedidoEntregaNuevo, UnRptInvestAdmNuevo,
  unRptNotaAprobacion, strutils, unImpParteEvolutivo, RxPlacemnt, RxToolEdit,
  RxCurrEdit;


type
  TfrmAutAprob = class(TForm)
    grpPaciente: TGroupBox;
    lbTrabCUIL: TLabel;
    lbTrabNombre: TLabel;
    edTrabCUIL: TEdit;
    edTrabNombre: TEdit;
    lbTrabFecha: TLabel;
    edSiniFecha: TEdit;
    lbTrabDiagn: TLabel;
    edSiniDiagnostico: TEdit;
    lbTrabNumAuto: TLabel;
    edNroAuto: TEdit;
    lbTrabSiniestro: TLabel;
    edSiniestro: TEdit;
    grpPrestador: TGroupBox;
    grpPrestacion: TGroupBox;
    lbPrestFSolicitud: TLabel;
    lbPrestFRecep: TLabel;
    lbPrestPrestacion: TLabel;
    lbPrestCantidad: TLabel;
    lbPrestDetalle: TLabel;
    edPrestDetalle: TEdit;
    edPrestacFSolicitud: TEdit;
    edPrestFRecepcion: TEdit;
    edPrestPrestacCodigo: TEdit;
    edPrestPrestDescripcion: TEdit;
    pnlBotones: TPanel;
    groAprobacion: TGroupBox;
    grpDatoRef: TGroupBox;
    fraPrestadorAprob: TfraPrestador;
    lbAproCantidad: TLabel;
    lbAproDetalle: TLabel;
    memoObservaciones: TMemo;
    btnAprobar: TSpeedButton;
    btnRechazar: TSpeedButton;
    btnHistoria: TSpeedButton;
    lbDatRefFAlta: TLabel;
    edDatRefFAlta: TEdit;
    lbDatRefUsuario: TLabel;
    edDatRefUsuAlta: TEdit;
    lbDatRefEstado: TLabel;
    edDatRefEstado: TEdit;
    lbDatRefFAprob: TLabel;
    edDatRefFAprob: TEdit;
    edDatRefUsuAprob: TEdit;
    lbDatRefUAprob: TLabel;
    sdqDatos: TSDQuery;
    btnSalir: TSpeedButton;
    Seguridad: TSeguridad;
    btnSiniMasDatos: TSpeedButton;
    lbAproImporte: TLabel;
    lbAproObservaciones: TLabel;
    btnPedInfo: TSpeedButton;
    lbPrestImporte: TLabel;
    edPrestImporte: TEdit;
    btnTrabajador: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edHoraTurno: TMaskEdit;
    edFechaTurno: TDateComboBox;
    btnImprimir: TSpeedButton;
    FormPlacement: TFormPlacement;
    Label6: TLabel;
    edMedico: TEdit;
    Label7: TLabel;
    edAval: TEdit;
    ShortCutControl: TShortCutControl;
    edImporte: TCurrencyEdit;
    Label9: TLabel;
    cmbImplante: TArtComboBox;
    sdqImplante: TSDQuery;
    dsImplante: TDataSource;
    Label12: TLabel;
    edPrestCodSubPrest: TEdit;
    edPrestDescSubPrest: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edDiasDevol: TIntEdit;
    lbPrestFDesde: TLabel;
    edPrestFDesde: TEdit;
    lbPrestFHasta: TLabel;
    edPrestFHasta: TEdit;
    Label15: TLabel;
    edPrestGTrabajo: TEdit;
    sdqRecorreTurnos: TSDQuery;
    btnVerTraslado: TSpeedButton;
    edImplante: TIntEdit;
    fraSubPrestacion: TfraSubPrestacion;
    fraPrestacionAut: TfraPrestacion;
    Label16: TLabel;
    Label17: TLabel;
    edNomNomenclador: TEdit;
    edNomCapitulo: TEdit;
    edNomCodigo: TEdit;
    edNomDescripcion: TEdit;
    fraNomencladorAprob: TfraNomenclador;
    lbPrestacion: TLabel;
    edCantidad: TCurrencyEdit;
    edPrestCantidad: TCurrencyEdit;
    btnCotizPresupuesto: TSpeedButton;
    memoObservacionesImpresion: TMemo;
    Label18: TLabel;
    fraPrestadorAut: TfraPrestador;
    Bevel12: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    fpVencimiento: TFormPanel;
    Label3: TLabel;
    dcFechaAlquiler: TDateComboBox;
    btnAceptarFecha: TButton;
    btnCancelarFecha: TButton;
    Bevel3: TBevel;
    btnStockOrtopedia: TSpeedButton;
    fpStockOrto: TFormPanel;
    lvStockOrto: TListView;
    Bevel4: TBevel;
    btnAceptarOrto: TButton;
    btnCancelarOrto: TButton;
    Label4: TLabel;
    edNomFantaAprob: TEdit;
    fpTurnoExistente: TFormPanel;
    Bevel5: TBevel;
    btnCancelarTurno: TButton;
    btnContinuarTurno: TButton;
    Label5: TLabel;
    Bevel6: TBevel;
    Label8: TLabel;
    edNroAutTurno: TEdit;
    fraPrestacionTurno: TfraPrestacion;
    Label10: TLabel;
    edPresTurno: TEdit;
    edHoraTur: TMaskEdit;
    Label11: TLabel;
    edDestinoTurno: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edFechaOrtop: TDateComboBox;
    btnVerTurnos: TSpeedButton;
    edPrestSugerido: TEdit;
    Label22: TLabel;
    lvRelaciones: TListView;
    btnAgregarSubPr: TSpeedButton;
    btnQuitarSubPr: TSpeedButton;
    Label24: TLabel;
    fpAgregarRel: TFormPanel;
    Bevel7: TBevel;
    btnAceptarRel: TButton;
    btnCancelarRel: TButton;
    fraNomencladorRel: TfraNomenclador;
    Label23: TLabel;
    Label25: TLabel;
    edKilometraje: TCurrencyEdit;
    Label26: TLabel;
    edKilometrajeExcedente: TCurrencyEdit;
    meEspera: TMaskEdit;
    lblEspera: TLabel;
    edDetalle: TMemo;
    fpCartelEnvio: TFormPanel;
    Bevel8: TBevel;
    Button1: TButton;
    Label27: TLabel;
    memoDirecciones: TMemo;
    btnSIC: TSpeedButton;
    btnSICToolbar: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure btnAprobarClick(Sender: TObject);
    procedure btnRechazarClick(Sender: TObject);
    procedure btnHistoriaClick(Sender: TObject);
    procedure btnPedInfoClick(Sender: TObject);
    procedure btnTrabajadorClick(Sender: TObject);
    procedure edFechaTurnoExit(Sender: TObject);
    procedure edHoraTurnoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edImplanteExit(Sender: TObject);
    procedure edImplanteKeyPress(Sender: TObject; var Key: Char);
    procedure cmbImplanteGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cmbImplanteCloseUp(Sender: TObject);
    procedure btnVerTrasladoClick(Sender: TObject);
    procedure edCantidadExit(Sender: TObject);
    procedure fraNomencladorAprobExit(Sender: TObject);
    procedure edImporteChange(Sender: TObject);
    procedure edImporteEnter(Sender: TObject);
    procedure btnCotizPresupuestoClick(Sender: TObject);
    procedure edPrestIdentifChange(Sender: TObject);
    procedure btnAceptarFechaClick(Sender: TObject);
    procedure btnStockOrtopediaClick(Sender: TObject);
    procedure btnAceptarOrtoClick(Sender: TObject);
    procedure edFechaTurnoChange(Sender: TObject);
    procedure btnVerTurnosClick(Sender: TObject);
    procedure lvRelacionesResize(Sender: TObject);
    procedure btnAgregarSubPrClick(Sender: TObject);
    procedure btnQuitarSubPrClick(Sender: TObject);
    procedure btnAceptarRelClick(Sender: TObject);
    procedure fpAgregarRelBeforeShow(Sender: TObject);
    procedure fraPrestacionAutExit(Sender: TObject);
    procedure meEsperaExit(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure btnSICClick(Sender: TObject);
    procedure edCantidadChange(Sender: TObject);
  private
    EsSiniestroProtocolizable: Boolean;
    FIsOrtopedia, FHuboCambioPrestacion: Boolean;
    IsPresupuestos: boolean;
    FIdAuto: Integer;
    NumAutoDeriv: Integer;
    PrestadorBaja: Integer; {Si necesito imprimir notas que luego de ser aprobadas, fue dado de baja el prestador, guardo el prestador de baja en esta variable}
    vExigeVencimiento: Boolean;
    vIdPresupuesto: Integer;
    vIdStock: Integer;
    vMatStock: String;
    vNroPedido: Integer;
    vVencimAlquiler: TDate;
    vNroDocTrabajador :String;
    iFirmante: Integer;
    IdTrabajador, Contrato: Integer;

    function CantSelStock: Boolean;
    function GetDelegacion(iSiniestro, iOrden, iRecaida: Integer): String;
    function GetGrupoTrabajo(iSiniestro, iOrden, iRecaida: Integer): String;
    function ImprimirNotas: Boolean;
    function Reporte_Caracter: String;
    function Reporte_Firmante: String;       // Estas cuatro funciones son para los reportes y cartas.
    function Reporte_NroDocumento: String;
    function Reporte_Usuario: String;
    function SeModifico: Boolean;
    function TrasladosAprobar(TipoPrest: TTipoPrestacion): Boolean;
    function TurnosAprobar(TCarga :TTipoCarga) :TModalResult;
    function GetPrestacionesPrevias(codprestacion: string): boolean;
    function Validar(Sender: TObject): Boolean;
    function Validar_FecSolicitud_AltaPrestador(dFecSolicitud: TDate; iIdPrestador: integer; VAR dFecAltaPrestador:TDate{; capitulo: string}): Boolean;
    function ValidarTurnoExistente :Boolean;
    function ValidarReqTrasladoAut :Boolean;   // Lu TK 6220
    function GetCantSesiones: Integer;
    function FechaAutMayoralAlta: boolean;     // Lu WF 8206
    function GetFirmanteAuditor(sArea: String): Integer;
    function Valida_SML_AprobRech: Boolean;                  // Plan - SML
    function Es_TipoPrestacionPermitida_AprobRech: Boolean;  // Plan - SML

    procedure GetDatosCotizacionOrtopedia(iSiniestro, iOrden, iRecaida, iNroAutorizacion: Integer;
                                          var iPrestador: TPrestador; var sMaterialCotizado: String;
                                          var rCotizacion: Currency);
    procedure HabilitacionControles;
    procedure OnNomencladorChange(Sender: TObject);
    procedure OnPrestacionChange(Sender: TObject);
    procedure OnPrestadorChange(Sender: TObject);
    procedure SetIsOrtopedia(const Value: Boolean);
    procedure DoCambioPrestador;
    procedure CopiarTraslados(Siniestro, Orden, Recaida, NumAuto: Integer; EnTransaccion: Boolean);
    procedure CopiarTurnos(IdAutoOrig, NumAutoDeriv: Integer; EnTransaccion: Boolean);
    procedure DoCargarPrestadorSugerido;
    procedure DoBloquearValor;
    procedure DoCargarRelaciones;
    procedure SetValor;
    procedure DoInsertarPrestaciones;
    procedure DoHabilitarMultiples;
    procedure DoHabilitarBotones;
    procedure VerificarGastosyHonorarios;
    procedure SetPrestadorNomen;
    procedure Do_UpdateAutorizReca_PorDerivacion(iNumAutoDeriv, iNumAutoAprob: Integer);
    procedure Do_EnviarMailAvisoEvolutivos;
    function NoSePuedeModificarObservaciones:boolean; // TK 57576
    function ValidarHoraIngresada:boolean;

  public
    class function LugarImpresion(sUsuario: String = ''): String;

    function GetFechaAprobacion: TDateTime;

    procedure CargarAutorizacion(iIdAuto: Integer);
    procedure DoActualizarImpresionAutorizacion(iSiniestro, iOrden, iRecaida, iNumeroAutorizacion: Integer;
                                                Accion: TResultados = []);
    procedure GenerarNota1(iNroAutorizacion: Integer; sAgregado: String = '');
    procedure GenerarNota2;
    procedure GenerarNotaDerivacion(iNroAutorizacion: Integer);
    procedure GenerarNotaRechazo(iNroAutorizacion: Integer);
    procedure ImprimirComodato(iNroAutorizacion: Integer);

    property IsOrtopedia: Boolean read FIsOrtopedia write SetIsOrtopedia;  { by NWK, 24/03/03 }
    property IdAuto: Integer      read FIdAuto      write FIdAuto;
  end;

  function DomicilioDelegacion(APicture: TPicture; iSiniestro: Integer = 0): String; // Funcion que devuelve el domicilio de la delegacion del usuario logueado.

implementation

uses
  AnsiSql, CUIT, CustomDlgs, unDmPrincipal, unPrincipal, unDatosSiniestro, unRTF, unPedidoInfo, 
  unFraTrabajadorSIN, unRptFKT, unART, unRptPedidoEntrega, UnRptFonoaudiologia, UnRepTraslados,
  unRptInvestAdministrativa, UnFirmantes, UnDestPapl, SinEdit, Numeros, unPresupuestos, VCLExtra, Math,
  unRptMoldeReporteRTF, Internet, unSesion, Periodo, unRedPres, unRptTrasladosPlataforma,
  DateUtils, Printers, unComunes, unUtilsArchivo, unContratoTrabajador, unSiniestros,
  unGIS, unAgendaVistaExpediente;

var
  bRefrescar: Boolean;
  NumAuto: Integer;
  vOrden: Integer;
  vRecaida: Integer;
  vSiniestro: Integer;

{$R *.DFM}

{ TfrmAutAprob }

procedure TfrmAutAprob.CargarAutorizacion(iIdAuto :Integer);
var
  iNomenclador: Integer;
  SqlResultsPres, SqlResults: TStringList;
begin
  sdqDatos.ParamByName('pIdAuto').AsInteger := iIdAuto;
  sdqDatos.Open;
  IdTrabajador  := sdqDatos.FieldByName('tj_id').AsInteger;
  Contrato      := sdqDatos.FieldByName('ex_contrato').AsInteger;  
  vSiniestro    := sdqDatos.FieldByName('ex_siniestro').AsInteger;
  vOrden        := sdqDatos.FieldByName('ex_orden').AsInteger;
  vRecaida      := sdqDatos.FieldByName('ex_recaida').AsInteger;
  NumAuto       := sdqDatos.FieldByName('au_numauto').AsInteger;
  vIdStock      := sdqDatos.FieldByName('au_idstock').AsInteger;
  vNroDocTrabajador := sdqDatos.FieldByName('tj_documento').AsString;  // tk 5303
  PrestadorBaja := 0;
  FIdAuto       := iIdAuto;

  IsPresupuestos := sdqDatos.FieldByName('pr_presupuestos').AsString = 'S';

  EsSiniestroProtocolizable := not (ValorSQLEx('SELECT ART.PROTOCOLO.IS_SINIPROTOCOLIZABLE(:Sin, :Orden, :Reca) FROM DUAL', [vSiniestro, vOrden, vRecaida]) = 'N');
  { Paciente }
  edTrabCUIL.Text        := sdqDatos.FieldByName('EX_CUIL').AsString;
  edTrabNombre.Text      := sdqDatos.FieldByName('TJ_NOMBRE').AsString;
  edSiniestro.Text       := IntToStr(vSiniestro) + '-' + IntToStr(vOrden) + '-' + IntToStr(vRecaida);
  edSiniFecha.Text       := sdqDatos.FieldByName('EX_FECHAACCIDENTE').AsString;
  edSiniDiagnostico.Text := sdqDatos.FieldByName('EX_DIAGNOSTICO').AsString;
  edNroAuto.Text         := IntToStr(NumAuto);
  { Prestador }
  fraPrestadorAut.Cargar(sdqDatos.FieldByName('CA_IDENTIFICADOR').AsInteger);
  { Prestacion }
  edPrestacFSolicitud.Text     := sdqDatos.FieldByName('AU_FECHASOLI').AsString;
  edPrestFRecepcion.Text       := sdqDatos.FieldByName('AU_FECHARECEP').AsString;
  edPrestPrestacCodigo.Text    := sdqDatos.FieldByName('AU_PRESSOL').AsString;
  edPrestPrestDescripcion.Text := sdqDatos.FieldByName('PR_DESCRIPCION').AsString;
  edPrestCantidad.Text         := sdqDatos.FieldByName('AU_CANTIDAD').AsString;
  edPrestFDesde.Text           := sdqDatos.FieldByName('AU_FECHADESDE').AsString;
  edPrestFHasta.Text           := sdqDatos.FieldByName('AU_FECHAHASTA').AsString;
  edPrestImporte.Text          := sdqDatos.FieldByName('AU_IMPORTE').AsString;
  edPrestDetalle.Text          := sdqDatos.FieldByName('AU_DETALLE').AsString;
  edMedico.Text                := sdqDatos.FieldByName('AU_MEDICO').AsString;
  edPrestGTrabajo.Text         := sdqDatos.FieldByName('GP_NOMBRE').AsString +
                                  Get_UsuGestor(sdqDatos.FieldByName('EX_ID').AsInteger, True);
  edPrestGTrabajo.Hint         := sdqDatos.FieldByName('GP_CODIGO').AsString;
  edNomNomenclador.Text        := sdqDatos.FieldByName('AU_PRES_NOMENCLADOR').AsString;
  edNomCapitulo.Text           := sdqDatos.FieldByName('AU_PRES_CAPITULO').AsString;
  edNomCodigo.Text             := sdqDatos.FieldByName('AU_PRES_CODIGO').AsString;
  edNomDescripcion.Text        := sdqDatos.FieldByName('ON_DESCRIPCION').AsString;
  { Datos Referenciales }
  edDatRefFAlta.Text     := sdqDatos.FieldByName('AU_FECHAALTA').AsString;
  edDatRefUsuAlta.Text   := sdqDatos.FieldByName('AU_USUALTA').AsString;
  edDatRefEstado.Text    := sdqDatos.FieldByName('ESTADO').AsString;
  edDatRefFAprob.Text    := sdqDatos.FieldByName('AU_FECHAPRO').AsString;
  edDatRefUsuAprob.Text  := sdqDatos.FieldByName('AU_USUAPRO').AsString;
  edDatRefEstado.Tag     := Ord(sdqDatos.FieldByName('AU_ESTADO').AsString[1]);
  edAval.Text            := sdqDatos.FieldByName('FI_FIRMANTE').AsString;

  edFechaTurno.Date      := sdqDatos.FieldByName('AU_TURNO').AsDateTime;
  edHoraTurno.Text       := sdqDatos.FieldByName('AU_TURNOHORA').AsString;
  edImplante.Text        := sdqDatos.FieldByName('AU_IMPLANTE').AsString;
  cmbImplante.FieldValue := sdqDatos.FieldByName('AU_IMPLANTE').AsString;
  edFechaOrtop.Date      := sdqDatos.FieldByName('AU_FENTREGAORTOP').AsDateTime;

  { SubPrest }
  if sdqDatos.FieldByName('AU_SUBAPRO').IsNull then // si no esta aprobada aun, le asigna el Au_SubPrest
     fraSubPrestacion.Cargar(sdqDatos.FieldByName('AU_SUBPREST').AsString)
  else
     fraSubPrestacion.Cargar(sdqDatos.FieldByName('AU_SUBAPRO').AsString);

  edPrestCodSubPrest.Text  := sdqDatos.FieldByName('AU_SUBPREST').AsString;
  if sdqDatos.FieldByName('AU_SUBPREST').Text <> '' then
    edPrestDescSubPrest.Text := ValorSql('SELECT tb_descripcion FROM ctb_tablas WHERE tb_clave = ''SUBPR'' AND tb_codigo = ' + sdqDatos.FieldByName('AU_SUBPREST').Text);

  edDiasDevol.Text   := sdqDatos.FieldByName('AU_DIASDEVOL').AsString;

  memoObservaciones.Lines.Text          := sdqDatos.FieldByName('AU_OBSERVACIONES').AsString;
  memoObservacionesImpresion.Lines.Text := sdqDatos.FieldByName('AU_OBSERVACIONESIMPRESION').AsString;
  {--[ Carga los Valores por Defecto ]-------------------------------------------------------------------------------}
  // Permite ver los prestadores dados de baja consultando el campo tb_especial1 del los registro de estado...
  fraPrestadorAprob.ShowBajas := Get_CTBEspecial1('MUAUT', sdqDatos.FieldByName('AU_ESTADO').AsString) = 'S';

  if sdqDatos.FieldByName('AU_IDENTIFAPRO').IsNull then
  begin
    fraPrestadorAprob.Cargar(sdqDatos.FieldByName('CA_IDENTIFICADOR').AsInteger);
    edNomFantaAprob.Text := fraPrestadorAprob.NombreFantasia;
  end
  else begin
    fraPrestadorAprob.Cargar(sdqDatos.FieldByName('AU_IDENTIFAPRO').AsInteger);
    edNomFantaAprob.Text := fraPrestadorAprob.NombreFantasia;
    if fraPrestadorAprob.IDPrestador = 0 then
    begin
      PrestadorBaja := sdqDatos.FieldByName('AU_IDENTIFAPRO').AsInteger;
      with fraPrestadorAprob do
      begin                              //        [0]       [1]           [2]             [3]           [4]           [5]
        SqlResultsPres := ValoresColSql('Select CA_CLAVE, CA_SECUENCIA, CA_DESCRIPCION, CA_DOMICILIO, CA_LOCALIDAD, CA_CODPOSTAL ' +
                                          ' From CPR_PRESTADOR Where CA_IDENTIFICADOR = ' + SqlNumber(PrestadorBaja));
        try
          IDPrestador  := PrestadorBaja;
          Cuit         := SqlResultsPres[0];
          Secuencia    := StrToIntDef(SqlResultsPres[1], 0);
          RazonSocial  := SqlResultsPres[2];
          Domicilio    := SqlResultsPres[3];
          Localidad    := SqlResultsPres[4];
          CodigoPostal := SqlResultsPres[5];
          CambiarColor(clRed);
        finally
          SqlResultsPres.Free;
        end;
      end;
    end;
  end;

  edNomFantaAprob.Text := edNomFantaAprob.Text + ' (' + sdqDatos.FieldByName('tp_descripcion').AsString + ')';

  if sdqDatos.FieldByName('AU_PRESAPRO').IsNull then
  begin
     fraPrestacionAut.Cargar(sdqDatos.FieldByName('AU_PRESSOL').AsString);
     DoCargarPrestadorSugerido;
  end
  else
     fraPrestacionAut.Cargar(sdqDatos.FieldByName('AU_PRESAPRO').AsString);
  OnPrestacionChange(Self);

  vIdPresupuesto := sdqDatos.FieldByName('au_idpresupuesto').AsInteger;

  with fraNomencladorAprob do      // TK 55252
  begin
    ShowVigencias  := not(Self.sdqDatos.FieldByName('au_estado').AsString = 'P');
    FechaSolicitud := Self.sdqDatos.FieldByName('au_fechasoli').AsDateTime;
    Vigencia       := Self.sdqDatos.FieldByName('au_fechasoli').AsDateTime;
  end;

  //primero lo cargo, por las restricciones que siguen
  //si la autorizacion ya tenia un presupuesto relacionado, lo cargo
  if (vIdPresupuesto > 0) then
  begin
     iNomenclador := ValorSqlInteger('SELECT pp_idnomenclador' +
                                      ' FROM spp_prestador_presupuesto' +
                                     ' WHERE pp_id = ' + SqlInt(vIdPresupuesto));
     fraNomencladorAprob.Presupuesto := vIdPresupuesto;      // TK 10570
     fraNomencladorAprob.Cargar(iNomenclador);
  end else
    fraNomencladorAprob.Cargar(sdqDatos.FieldByName('IDNOMENCLADOR').AsInteger);

  fraNomencladorAprob.Presupuesto := 0;      // Lu 16/09/2009

  SetPrestadorNomen;

  if sdqDatos.FieldByName('AU_CANTAPRO').isNull then
     edCantidad.Text := sdqDatos.FieldByName('AU_CANTIDAD').AsString
  else
     edCantidad.Text := sdqDatos.FieldByName('AU_CANTAPRO').AsString;

  //if Nvl(sdqDatos.FieldByName('au_presapro').AsString, sdqDatos.FieldByName('au_pressol').AsString) = '449101' then  //ESPERA REMIS
  if fraPrestacionAut.sdqDatospr_canttiempo.AsString = 'S' then
    meEspera.Text := sdqDatos.fieldbyname('au_tiempoespera').AsString;

  edKilometraje.Value := sdqDatos.FieldByName('AU_KMVIAJE').AsFloat + sdqDatos.FieldByName('AU_KMBASE').AsFloat;
  edKilometrajeExcedente.Value := sdqDatos.FieldByName('AU_KMEXCEDENTE').AsFloat;

  if edKilometraje.Value > 0 then
    edKilometraje.Hint := 'Kilometraje Total' + iif(sdqDatos.FieldByName('AU_KMBASE').IsNull, '', CRLF + CRLF + 'Tenga en cuenta que ' + sdqDatos.FieldByName('AU_KMBASE').AsString + ' kilómetros corresponden a kilometraje adicional autorizado desde la base de la remisería hacia el origen del traslado.')
  else
    edKilometraje.Hint := 'Kilometraje Total';

  if sdqDatos.FieldByName('AU_DETALLEAPRO').IsNull then
     edDetalle.Text  := edPrestDetalle.Text
  else if sdqDatos.FieldByName('AU_DETALLEAPRO').AsString <> edPrestDetalle.Text then
     edDetalle.Text  := sdqDatos.FieldByName('AU_DETALLEAPRO').AsString
  else
     edDetalle.Text  := edPrestDetalle.Text;

  if sdqDatos.FieldByName('AU_IMPOAPRO').IsNull then
     edImporte.Text  := edPrestImporte.Text
  else
     edImporte.Value := sdqDatos.FieldByName('AU_IMPOAPRO').AsCurrency;

  DoBloquearValor;
  {-----------------------------------------------------------------------------}
  if (sdqDatos.FieldByName('EX_CAUSAFIN').AsString = '02') then
    MsgBox('El siniestro seleccionado ha sido Rechazado.', MB_ICONEXCLAMATION, 'ATENCIÓN')
  else if (sdqDatos.FieldByName('EX_ESTADO').AsString = '02') then
    MsgBox('El siniestro seleccionado se encuentra Suspendido.', MB_ICONINFORMATION);

  {-[ Habilita o deshabilita los Controles ]------------------------------------}
  HabilitacionControles;
  {-----------------------------------------------------------------------------}

   fraPrestadorAprob.Modified := False;
   fraPrestacionAut.Modified  := False;
   fraSubprestacion.Modified  := False;
   edCantidad.Modified        := False;
   meEspera.Modified          := false; 
   edDiasDevol.Modified       := False;
   edImporte.Modified         := False;
   cmbImplante.Modified       := False;
   edImplante.Modified        := False;
   memoObservaciones.Modified := False;
   edFechaTurno.Modified      := False;
   edHoraTurno.Modified       := False;
   edFechaOrtop.Modified      := False;

   memoObservacionesImpresion.Modified := False;

   {-------[Mensaje de Incapacidad]---------------------------------------------------------------------------------}
   SqlResults := ValoresColSql('Select tb_descripcion, ev_porcincapacidad' +
                                ' From sev_eventosdetramite, ctb_tablas' +
                               ' where ev_evento = art.amebpba.get_incapacidades(ev_siniestro, ev_orden)' +
                                 ' and ev_siniestro = ' + IntToStr(vSiniestro) +
                                 ' and ev_orden = ' + IntToStr(vOrden) +
                                 ' and tb_clave = ''EVTRA''' +
                                 ' and ev_codigo = tb_codigo');
  try
    if (SqlResults[0] <> '') and (SqlResults[1] <> '') then
      MsgBox(SqlResults[0] + #13 + 'Porcentaje de Incapacidad: ' + SqlResults[1] + '%', MB_ICONINFORMATION);
  finally
    SqlResults.Free;
  end;
end;

procedure TfrmAutAprob.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;
end;

procedure TfrmAutAprob.btnSalirClick(Sender: TObject);
begin
  if bRefrescar then
    ModalResult := MrOk
  else
    ModalResult := mrCancel;
end;

procedure TfrmAutAprob.btnSICClick(Sender: TObject);
begin
  Verificar(IsEmptyString(edSiniestro.Text), edSiniestro, 'Debe seleccionar un siniestro para acceder al SIC desde aquí.');
  DoMostrarEventosAgendaExpediente(Get_IdExpediente(vSiniestro, vOrden, vRecaida));
end;

procedure TfrmAutAprob.btnSiniMasDatosClick(Sender: TObject);
var
  frmDatosSiniestro: TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  try
    frmDatosSiniestro.ShowDialog (vSiniestro, vOrden, vRecaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;

procedure TfrmAutAprob.btnAprobarClick(Sender: TObject);    // eliminado frmfirmantes por dgastal
var
  Aprobo, bEsTraslado, PrestaReca :Boolean;
//  frmFirmantes: TfrmFirmantes;
  iAutoStock, iCantHojas: Integer;
  sDestinoPapel, sEstado, sSQL, SqlTras, sStockDeriv, sStockOrig, Area: String;
  TmpImpo: Double;
  mrTurnos :TModalResult;
  vFecAutMayorAlAlta: boolean;
begin
  vFecAutMayorAlAlta := FechaAutMayoralAlta;
  if (vFecAutMayorAlAlta and (MsgBox('La fecha de aprobación es posterior al Alta Médica.' + #13 + '¿Desea Continuar?', MB_ICONQUESTION + MB_OKCANCEL) = IDOK))
    or (Not vFecAutMayorAlAlta) then         // Lu WF 8206
  begin
    OnPrestacionChange(Sender);
    DoCambioPrestador;
    if (edImporte.Tag = 0) and (fraNomencladorAprob.Nomenclador <> '') then
      fraNomencladorAprobExit(Sender);

    bEsTraslado   := (fraPrestacionAut.sdqDatosPR_FORMULARIO.AsString = 'T');

    Verificar((edPrestGTrabajo.Hint = '21') and (Sesion.Sector <> 'CEM'), pnlBotones,
              'La prestación de esta autorización solo puede ser aprobada por el CEM, quien ya ha sido notificado al momento de su carga.');

    Verificar((not bEsTraslado) and (fraNomencladorAprob.Nomenclador <> '') and (edImporte.Value = 0) and not seguridad.Claves.IsActive('AprobarSinValor'), btnAprobar,
              'No corresponde aprobar practica con valor 0');

    iCantHojas    := 0;
    edImporte.tag := 0;
    Aprobo        := True;
    SqlTras       := '';

    VerificarGastosyHonorarios;

    try
      Area := IIF(bEsTraslado, AREA_APTR, AREA_APAU);
      if Validar(Sender) and ValidarTurnoExistente then
      begin
        if ExisteSql('SELECT 1' +
                      ' FROM dlg_delegaciones' +
                     ' WHERE lg_sistemaarchivo = ''S''' +
                       ' AND lg_codigo = ' + SqlValue(Sesion.Delegacion)) then
        begin
          frmDestinoPapel := TfrmDestinoPapel.Create(self);
          try
            frmDestinoPapel.LblCDoc.Caption := 'Tipo de Documento: AUR';
            frmDestinoPapel.Showmodal;
            sDestinoPapel := frmDestinoPapel.DestinoPapel;
            iCantHojas    := frmDestinoPapel.CantHojas;
          finally
            FreeAndNil(frmDestinoPapel);
          end;
        end;

        BeginTrans;
        try
          sSQL := 'UPDATE sau_autorizaciones' +
                    ' SET au_pres_nomenclador = ' + SqlValue(fraNomencladorAprob.Nomenclador) + ',' +
                        ' au_pres_capitulo = ' + SqlValue(fraNomencladorAprob.Capitulo) + ',' +
                        ' au_pres_codigo = ' + SqlValue(fraNomencladorAprob.Codigo) +
                  ' WHERE au_id = ' + SqlInt(IdAuto);
          EjecutarSqlST(sSQL);

          if bEsTraslado then
            Aprobo := TrasladosAprobar(tpTraslado)
          else if (fraPrestacionAut.sdqDatosPR_REQUIERETURNOS.AsString = 'S') then
          begin
            mrTurnos := TurnosAprobar(tcAprobacion);
            if mrTurnos = mrYes then
              Aprobo := TrasladosAprobar(tpOtra)
            else if mrTurnos = mrCancel then
              Aprobo := False;
          end;

          if Aprobo then
          begin
            if EsSiniestroProtocolizable then
              sEstado := IIF(fraPrestacionAut.sdqDatos.FieldByName('PR_DIASEVOP').IsNull, 'A', 'E')
            else
              sEstado := IIF(fraPrestacionAut.sdqDatos.FieldByName('PR_DIASEVO').IsNull, 'A', 'E');

            iFirmante := GetFirmanteAuditor(Area);

            if (iFirmante = 0) then
            begin

              sSQL := 'select art.siniestro.get_firmaarea(:usuario, :area) from dual';
              If bEsTraslado then
                iFirmante := ValorSqlEx(ssql, [Sesion.LoginName, 70])
              else
                iFirmante := ValorSqlEx(ssql, [Sesion.LoginName, 69]);

              if iFirmante = 0 then
              begin
                MsgBox('Usted no posee firmante para avalar esta autorización');
                Rollback;
                Exit;
              end;
            end;

            if fraNomencladorAprob.IsPresup then
            begin
              sSQL := 'UPDATE spp_prestador_presupuesto' +
                        ' SET pp_consumido = pp_consumido + 1,' +
                            ' pp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                            ' pp_fechamodif = actualdate' +
                      ' WHERE pp_id = ' + IIF((vIdPresupuesto > 0), SqlInt(vIdPresupuesto), SqlInt(fraNomencladorAprob.sdqDatosIDPRESUP.AsInteger));
              EjecutarSqlST(sSQL);
            end;

            if fraPrestadorAprob.IDPrestador = fraPrestadorAut.IDPrestador then
              sStockOrig := IIF((vIdStock > 0), ' au_idstock = ' + SqlInt(vIdStock) + ',' , '')
            else
              sStockDeriv := IIF((vIdStock > 0), IntToStr(vIdStock), 'Null');

            DoInsertarPrestaciones;

            sSQL :=
              'UPDATE sau_autorizaciones' +
                ' SET au_estado = ''' + IIF(fraPrestadorAprob.IDPrestador = fraPrestadorAut.IDPrestador, sEstado, 'D') + ''',' +
                    ' au_usuapro = ' + SqlValue(Sesion.LoginName) + ',' +
                    ' au_fechapro = ActualDate,' +
                    ' au_identifapro = ' + SqlValue(fraPrestadorAprob.IDPrestador) + ',' +
                    ' au_presapro = ' + SqlValue(fraPrestacionAut.edCodigo.Text) + ',' +
                    iif(FHuboCambioPrestacion, '',
                    ' au_pres_nomenclador = ' + SqlValue(fraNomencladorAprob.Nomenclador) + ',' +
                    ' au_pres_capitulo = ' + SqlValue(fraNomencladorAprob.Capitulo) + ',' +
                    ' au_pres_codigo = ' + SqlValue(fraNomencladorAprob.Codigo) + ','
                    ) +
                    ' au_cantapro = ' + SqlNumber(edCantidad.Value) + ',' +
                    ' au_tiempoespera = ' + SqlValue(meEspera.Text) + ',' +
                    IIF(edCantidad.Value > edPrestCantidad.Value, ' au_cantidad = ' + SqlNumber(edCantidad.Value) + ', ', '') +
                    ' au_diasdevol = ' + edDiasDevol.TextSql + ',' +
                    ' au_impoapro = NVL(au_impoapro, ' + IIF(fraPrestadorAprob.IDPrestador = fraPrestadorAut.IDPrestador, SqlNumber(edImporte.Value), '0') + '),' +
                    IIF(edDetalle.Text = edPrestDetalle.Text, '', ' au_detalleapro = ' +  SqlString(edDetalle.Text, True) + ',') +
                    ' au_observaciones = ' + SqlString(memoObservaciones.Text, True) +  ',' +
                    ' au_observacionesimpresion = ' + SqlString(memoObservacionesImpresion.Text, True) +  ',' +
                    ' au_aval = ' + SqlInt(iFirmante) + ',' +
                    ' au_turno = TO_DATE(''' + IIF(TRIM(edFechaTurno.Text) = '/  /', '', edFechaTurno.Text) + ''', ''dd/mm/yyyy''),' +
                    ' au_turnohora = ''' + IIF(TRIM(edHoraTurno.Text) = ':', '', edHoraTurno.Text) + ''',' +
                    ' au_implante = ' +  SqlValue(cmbImplante.FieldValue) + ',' + sStockOrig +
                    ' au_subapro = ' + SqlValue(fraSubPrestacion.edCodigo.Text) + ',' +
                    ' au_fentregaortop = ' + SqlDate(edFechaOrtop.Date) +
              ' WHERE au_id = ' + SqlInt(IdAuto);
            EjecutarSqlST(sSQL);

            sSQL := 'SELECT au_id, au_extension ' +
                      'FROM sau_autorizaciones ' +
                    ' WHERE au_idautorizacionorigen = :IdAut ' +
                      ' AND au_estado = :Estado ';
            with GetQueryEx(sSQL, [IdAuto, 'A']) do
            try
              if not IsEmpty then
              begin
                sSQL := ' UPDATE sau_autorizaciones ' +
                           ' SET au_aval = :aval ' +
                         ' WHERE au_id = :id ';
                EjecutarSqlSTEx(sSQL, [iFirmante, FieldByName('au_id').AsInteger]);
              end;

              if FieldByName('au_extension').AsString = 'S' then
              begin
                sSQL := ' UPDATE sau_autorizaciones ' +
                           ' SET au_estado = :estado ' +
                         ' WHERE au_id = :id ';
                EjecutarSqlSTEx(sSQL, [sEstado, FieldByName('au_id').AsInteger]);
              end;
            finally
              Free;
            end;

            if not (sDestinoPapel = '') and (sDestinoPapel <> DP_SINPAPEL) then
              Do_Actualizar_Archivo_Sin(False, Get_IdExpediente(vSiniestro, vOrden, vRecaida), sDestinoPapel, iCantHojas, Sesion.LoginName, 'AUR', 0, 'A', NumAuto);

            if fraPrestadorAprob.IDPrestador <> fraPrestadorAut.IDPrestador then
            begin
              sSQL :=
                'SELECT max(au_numauto) + 1' +
                 ' FROM sau_autorizaciones' +
                ' WHERE au_siniestro = ' + SqlInt(vSiniestro) +
                  ' AND au_orden = ' + SqlInt(vOrden) +
                  ' AND au_recaida = ' + SqlInt(vRecaida);
              NumAutoDeriv := ValorSql(sSQL);
              if bEsTraslado then  {para copiar el TRASLADO al registro aprobado. byLU}
                SqlTras := ', au_eltraslado, au_solicitante, au_dcalle, au_dnumero, au_dpiso, au_ddepartamento, ' +
                            ' au_dcpostal, au_dlocalidad, au_dprovincia, au_hcalle, au_hnumero, au_hpiso, au_hdepartamento, ' +
                            ' au_hcpostal, au_hlocalidad, au_hprovincia, au_acompanante, au_espera, au_retorno, au_elcontencion, ' +
                            ' au_elcontencion2, au_elcontencion3, au_tdesde, au_thasta, au_prestDesde, au_prestHasta, ' +
                            ' au_nrovueloida, au_nrovuelovuelta ';
              //-----------------------------------------------------------------------------------------------------//
              if (edimporte.Text <> '') then
                TmpImpo:=strtofloat(edimporte.Text)
              else
                TmpImpo:=0;

             sSQL := ' INSERT INTO sau_autorizaciones ' +    // derivación.
                      ' (au_siniestro, au_orden, au_recaida, au_numauto, au_identifprestador,  au_fechasoli, au_fecharecep, ' +
                      ' au_pressol, au_cantidad, au_fechadesde,  au_fechahasta, au_estado, au_usualta, au_fechaalta, au_fechacarga, '+
                      ' au_detalle,  au_trabajo, au_usuapro, au_fechapro, au_presapro, au_cantapro, au_observaciones, au_observacionesimpresion, '+
                      ' au_identifapro, au_importe, au_impoapro,  au_medico, au_detalleapro, au_aval, au_cantconsu, au_turno, ' +
                      ' au_turnohora, au_implante, au_subapro, au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                      ' au_fechaauditoria, au_usuauditoria, au_fechahabilitacion, au_usuhabilitacion, ' +
                      ' au_accionauditoria, au_diagnosticooms, au_porcincapacidad, au_numautoderiv, ' +
                      ' au_dlat, au_dlng, au_hlat, au_hlng, au_kmviaje, au_kmexcedente, au_kmbase, ' +
                      ' au_idstock ' + SqlTras + ' ) ' +
                      ' SELECT au_siniestro, au_orden, au_recaida, ' + IntToStr(NumAutoDeriv) + ', ' +
                               IntToStr(fraPrestadorAprob.IDPrestador) + ', au_fechasoli, au_fecharecep, ' +
                             ' au_pressol, au_cantidad, au_fechadesde, au_fechahasta, ''' + sEstado + ''' au_estado, au_usualta, au_fechaalta, au_fechacarga, '+
                             ' au_detalle,  au_trabajo, au_usuapro, au_fechapro, au_presapro, au_cantapro, au_observaciones, au_observacionesimpresion, ' +
                             ' au_identifapro, au_importe, ' + SqlNumber(TmpImpo) + ' , au_medico, au_detalleapro, au_aval, au_cantconsu, au_turno, ' +
                             ' au_turnohora, au_implante, au_subapro, au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                             ' au_fechaauditoria, au_usuauditoria, au_fechahabilitacion, au_usuhabilitacion, ' +
                             ' au_accionauditoria, au_diagnosticooms, au_porcincapacidad, ' + SqlInt(NumAuto) + ',' +
                             ' au_dlat, au_dlng, au_hlat, au_hlng, au_kmviaje, au_kmexcedente, au_kmbase, ' +
                               sStockDeriv + SqlTras +
                        ' FROM sau_autorizaciones ' +
                       ' WHERE au_id = ' + SqlInt(IdAuto);
              EjecutarSqlST(sSQL);

              Do_UpdateAutorizReca_PorDerivacion(NumAuto, NumAutoDeriv);
                 //  Id autoriz de la Derivada, Nro autorizacion aprobada

              if not (sDestinoPapel='') and (sDestinoPapel <> DP_SINPAPEL) then
                Do_Actualizar_Archivo_Sin(False, Get_IdExpediente(vSiniestro, vOrden, vRecaida), sDestinoPapel, iCantHojas, Sesion.LoginName, 'AUR', 0, 'A', NumAutoDeriv);

              if bEsTraslado then
                CopiarTraslados(vSiniestro, vOrden, vRecaida, NumAuto, True);

              if (fraPrestacionAut.sdqDatosPR_REQUIERETURNOS.AsString = 'S') then
                CopiarTurnos(IdAuto, NumAutoDeriv, True);

              ssql := ' select 1 from art.mpr_prestaciones ' +
                      '  where pr_codigo = :cod ' +
                      '    and (pr_curso = ''S'' or pr_herramientas = ''S'') ';

              PrestaReca := ExisteSqlEx(ssql, [fraprestacionaut.edCodigo.Text]);

              if PrestaReca then
              begin
                ssql := ' update amed.msp_siniestropresup ' +
                           ' set sp_autoapro = ' + inttostr(NumAutoDeriv) +
                         ' where sp_siniestro = :sin ' +
                           ' and sp_orden = :ord ' +
                           ' and sp_recaida = :rec ' +
                           ' and sp_autooriginal = :auto ' +
                           ' and sp_adjudicado = ''S'' ';
                EjecutarSqlSTEx(ssql, [vSiniestro, vOrden, vRecaida, sdqDatos.FieldByName('au_numauto').AsString]);
              end;

              if IsOrtopedia then
              begin
                sSQL := 'UPDATE mso_siniestroortopedia ' +
                          ' SET so_autoapro = ' + SqlInt(NumAutoDeriv) +
                        ' WHERE so_siniestro = ' + SqlInt(vSiniestro) +
                          ' AND so_orden = ' + SqlInt(vOrden) +
                          ' AND so_recaida = ' + SqlInt(vRecaida) +
                          ' AND so_autooriginal = ' + SqlInt(NumAuto);
                EjecutarSqlST(sSQL);

                if (vIdStock > 0) then
                begin
                  iAutoStock := IIF(fraPrestadorAprob.IDPrestador <> fraPrestadorAut.IDPrestador,
                                ValorSqlInteger('SELECT au_id FROM sau_autorizaciones ' +
                                                ' WHERE au_siniestro = ' + SqlInt(vSiniestro) +
                                                  ' AND au_orden = ' + SqlInt(vOrden) +
                                                  ' AND au_recaida = ' + SqlInt(vRecaida) +
                                                  ' AND au_numauto = ' + SqlInt(NumAutoDeriv)), IdAuto);

                  sSQL := 'INSERT INTO amed.mms_movim_stock ' +
                          '(ms_id, ms_idstock, ms_idautorizacion, ms_fechaentrega, ' +
                          ' ms_fechaalta, ms_usualta) VALUES ' +
                          '(amed.seq_mms_id.nextval, ' + SqlInt(vIdStock) + ',' +
                          SqlInt(iAutoStock) + ', ActualDate, ActualDate, ' + SqlValue(Sesion.UserID) + ')';
                  EjecutarSqlST(sSQL);

                  sSQL := 'UPDATE amed.mso_stock_ortopedia ' +
                            ' SET so_estado = ''E'' ' +  //estado ENTREGADO
                           'WHERE so_id = ' + SqlInt(vIdStock);
                  EjecutarSqlST(sSQL);
                end;
              end;
            end;

            Do_EnviarMailAvisoEvolutivos;      // TK 43444

            CommitTrans(True);
            memoObservaciones.Modified := False;
            memoObservacionesImpresion.Modified := False;
            ImprimirNotas;
            ModalResult := mrOk;
          end {del if Aprobo}
          else Rollback(True);
        except
          on E: Exception do
          begin
            Rollback(True);
            ErrorMsg(E, 'No se han podido guardar los cambios.');
          end;
        end; {del Try}
      end; {del if Validar}
    finally

    end;

  end; //del primer if
end;



procedure TfrmAutAprob.CopiarTraslados(Siniestro, Orden, Recaida, NumAuto: Integer; EnTransaccion: Boolean);
var
  NumTraslado: String;
  sql: String;
begin
  SdqRecorreTurnos.Close;
  SdqRecorreTurnos.Sql.Text :=
    'SELECT tr_fecha,tr_hora,tr_fechabaja' +
     ' FROM str_traslados' +
    ' WHERE tr_siniestro = ' + SqlInt(Siniestro) +
      ' AND tr_orden = ' + SqlInt(Orden) +
      ' AND tr_recaida = ' + SqlInt(Recaida) +
      ' AND tr_numauto = ' + SqlInt(NumAuto) +
      ' AND tr_fechaanulacion IS NULL ' +
 ' ORDER BY tr_siniestro, tr_orden, tr_recaida, tr_numauto';
  SdqRecorreTurnos.Open;
  SdqRecorreTurnos.First;

  while not SdqRecorreTurnos.Eof do
  begin
    NumTraslado := ValorSql('SELECT nvl(max(tr_numtraslado), 0) + 1' +
                             ' FROM str_traslados' +
                            ' WHERE tr_siniestro = ' + SqlInt(Siniestro) +
                              ' AND tr_orden = ' + SqlInt(Orden) +
                              ' AND tr_recaida = ' + SqlInt(Recaida) +
                              ' AND tr_numauto = ' + SqlInt(NumAutoDeriv));
    sql :=
      'INSERT INTO str_traslados (tr_siniestro, tr_orden, tr_recaida, tr_numauto, tr_numtraslado, tr_fecha, tr_hora,' +
                                ' tr_fechabaja)' +
                        ' VALUES (' + SqlInt(Siniestro) + ',' + SqlInt(Orden) + ',' + SqlInt(Recaida) + ',' +
                                      SqlInt(NumAutoDeriv) + ',' + NumTraslado + ', ' +
                                      SqlDate(sdqRecorreTurnos.FieldByName('TR_FECHA').AsDateTime) + ',' +
                                      SqlValue(sdqRecorreTurnos.FieldByName('TR_HORA').AsString) + ', ' +
                                      SqlDate(sdqRecorreTurnos.FieldByName('TR_FECHABAJA').AsDateTime) + ')';

    if EnTransaccion then
      EjecutarSqlST(sql)
    else
      EjecutarSql(sql);
    SdqRecorreTurnos.Next;
  end;
  SdqRecorreTurnos.Close;
end;

procedure TfrmAutAprob.btnRechazarClick(Sender: TObject);
var
  frmFirmantes: TfrmFirmantes;
  iCantHojas: Integer;
  sDestinoPapel, Sql: String;
begin
  fraPrestacionAut.FrameExit(Sender);
  fraPrestadorAprob.FrameExit(Sender);

  frmFirmantes            := TfrmFirmantes.Create(Self);
  frmFirmantes.Area       := IIF((fraPrestacionAut.sdqDatosPR_FORMULARIO.AsString = 'T'), AREA_APTR, AREA_APAU);
  fraNomencladorAprob.ExigePrestacion := False;

  if Validar(Sender) then
  try
    if frmFirmantes.ShowModal = mrOk then
    begin
      iCantHojas  := 0;
      if Sesion.Delegacion = '840' then
      begin
        frmDestinoPapel := TfrmDestinoPapel.Create(self);
        try
          frmDestinoPapel.LblCDoc.Caption := 'Tipo de Documento: AUR';
          frmDestinoPapel.Showmodal;
          sDestinoPapel := frmDestinoPapel.DestinoPapel;
          iCantHojas    := frmDestinoPapel.CantHojas;
        finally
          FreeAndNil(frmDestinoPapel);
        end;
      end;

      Sql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_estado = ''R'',' +
              ' au_aval = ' + SqlInt(frmFirmantes.sdqFirmasCODFIRMA.AsInteger) + ',' +
              ' au_usuapro = ' + SqlValue(Sesion.UserID) + ',' +
              ' au_fechapro = ActualDate,' +
              ' au_fechaimpresion = ActualDate,' +
              ' au_observaciones = ' + SqlString(memoObservaciones.Text, True) + ',' +
              ' au_observacionesimpresion = ' + SqlString(memoObservacionesImpresion.Text, True) + ',' +
              ' au_impoapro = 0 ' +
        ' WHERE au_id = ' + SqlInt(IdAuto);
      EjecutarSql(Sql);

      {by Rama. 17/3/2002}
      if not (sDestinoPapel = '') and (sDestinoPapel <> DP_SINPAPEL) then
        Do_Actualizar_Archivo_Sin(True, Get_IdExpediente(vSiniestro, vOrden, vRecaida), sDestinoPapel, iCantHojas, Sesion.LoginName, 'AUR', 0, 'A', NumAuto);

      iFirmante := frmFirmantes.sdqFirmasCODFIRMA.AsInteger;

      GenerarNotaRechazo(NumAuto);
      ModalResult := mrOk;
      memoObservaciones.Modified := False;
      memoObservacionesImpresion.Modified := False;
    end
    else
      ChkDialog('ImprimirNotas_NoSelFirmante', 'Si no selecciona un firmante no se podrá imprimir la nota', '', '', mtInformation);
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'No se han podido guardar los cambios.');
      frmFirmantes.Free;
    end;
  end; {del Validar}
  frmFirmantes.Free;
end;

procedure TfrmAutAprob.btnHistoriaClick(Sender: TObject);
begin
  frmPrincipal.ShowHistorias(vSiniestro, vOrden, vRecaida);
end;

{---[ Se fija si se cambiaron los datos de Aprobacion/Rechazo ]------------------------------------------------------------------}
function TfrmAutAprob.SeModifico: Boolean;
begin
  // Por algun motivo el Modified no funciona en los frames, despues de 1 día y medio
  // de lucha, modifico como se calcula estas modificaciones.
  Result := (fraPrestadorAprob.IDPrestador <> fraPrestadorAut.IDPrestador) or
            (fraPrestacionAut.edCodigo.Text <> edPrestPrestacCodigo.Text) or
             edCantidad.Modified or meEspera.Modified or edImporte.Modified or
             memoObservaciones.Modified or memoObservacionesImpresion.Modified or
             cmbImplante.Modified or edDetalle.Modified or edDiasDevol.Modified or
             edFechaTurno.Modified or edHoraTurno.Modified or
            (fraSubprestacion.edCodigo.Text <> edPrestCodSubPrest.Text)
end;

{----[Esta es la primera vez que imprime]----------------------------------------------------------------------------------------}
function TfrmAutAprob.ImprimirNotas: Boolean; // Retorna Falso si hubo algún Error
begin
  try
    if fraPrestadorAprob.IDPrestador <> fraPrestadorAut.IDPrestador then
    begin
      GenerarNotaDerivacion(NumAuto);
      GenerarNota1(NumAutoDeriv);
    end
    else if SeModifico then
      GenerarNota2
    else
      GenerarNota1(NumAuto);
     Result := True;
  except
    on E: Exception do
    begin
      MsgBox('Error inesperado al intentar generar o imprimir las notas.' + CRLF + E.Message, MB_ICONERROR);
      Result := False;
    end;
  end;
end;

// DGastal (se modifico)
procedure TfrmAutAprob.GenerarNota1(iNroAutorizacion: Integer; sAgregado: String = '');
var
  TieneTraslados: String;
  auID: integer;
  FKT: TrptFKTNuevo;
  Fonoaud: TrptFonoaudNuevo;
  RegRehab: TrptRegRehabNuevo;
  MatOrt: TrptMatOrtNuevo;
  PedidoEntrega: TrptPedidoEntregaNuevo;
  InvestAdmin: TrptInvestAdminNueva;
  TrasPlataforma: TrptTrasladosPlataforma;
  Traslados: TrptTraslados;
  NotaAprobacion: TrptNotaAprobacion;
begin

  TieneTraslados := ValorSql('SELECT au_tdesde' +
                              ' FROM sau_autorizaciones' +
                             ' WHERE au_siniestro = ' + SqlInt(vSiniestro) +
                               ' AND au_orden = ' + SqlInt(vOrden) +
                               ' AND au_recaida = ' + SqlInt(vRecaida) +
                               ' AND au_numauto = ' + SqlInt(iNroAutorizacion));

  auID := ValorSqlEx('select au_id ' +
                      ' from art.sau_autorizaciones ' +
                      'where au_siniestro = :sin ' +
                        'and au_orden = :ord ' +
                        'and au_recaida = :rec ' +
                        'and au_numauto = :num ', [sqlint(vSiniestro), sqlint(vOrden), sqlint(vRecaida), sqlint(iNroAutorizacion)]);

  with fraPrestacionAut.sdqDatos.FieldByName('PR_FORMULARIO') do
  begin
     if AsString = 'F' then
     begin
       FKT := TrptFKTNuevo.Create(nil);
       try
         FKT.Imprimir(auID);
       except
         FKT.Free;
       end;

       RegRehab := TrptRegRehabNuevo.Create(nil);
       try
         RegRehab.Imprimir(auID);
       finally
         FKT.Free;
         RegRehab.Free;
       end;
     end
     else if (AsString = 'T') and (TieneTraslados <> '') and (EsPlataforma10(fraPrestacionAut.edCodigo.Text, fraPrestadorAprob.IDPrestador)) then
     begin
       TrasPlataforma := TrptTrasladosPlataforma.Create(nil);
       try
         TrasPlataforma.Imprimir(auID);
       finally
         TrasPlataforma.Free;
       end;
     end
     else if (AsString = 'T') and (TieneTraslados <> '') then
     begin
       Traslados := TrptTraslados.create(nil);
       try
         Traslados.Imprimir(auID);
       finally
         Traslados.Free;
       end;
     end
     else if (fraPrestacionAut.sdqDatos.FieldByName('PR_PRESUPUESTOS').AsString = 'S') and (vIdStock > 0) then  //if (AsString = 'P') and (vIdStock > 0) then       //reemplazar para cualquier prestacion de presupuestos pr_presupuestos = 'S'
     begin
       MatOrt := TrptMatOrtNuevo.create(nil);
       try
         MatOrt.Imprimir(auID);
       finally
         MatOrt.Free;
       end;
     end
     else if (fraPrestacionAut.sdqDatos.FieldByName('PR_PRESUPUESTOS').AsString = 'S') then //if (AsString = 'P') then // Pedido de Entrega
     begin
       PedidoEntrega := TrptPedidoEntregaNuevo.Create(nil);
       try
         PedidoEntrega.Imprimir(auID);
       finally
         PedidoEntrega.Free;
       end;
     end
     else if AsString = 'N' then  // Fonoaudiología
     begin
       Fonoaud := TrptFonoaudNuevo.Create(nil);
       try
         Fonoaud.Imprimir(auID);
       finally
         Fonoaud.Free;
       end;
     end
     else if AsString = 'I' then  // Investigaciones Administrativas
     begin
       InvestAdmin := TrptInvestAdminNueva.Create(nil);
       try
         InvestAdmin.Imprimir(auID);
       finally
         InvestAdmin.Free;
       end;
     end
     else
     begin
       NotaAprobacion := TrptNotaAprobacion.Create(nil);
       try
         NotaAprobacion.Imprimir(auID);
       finally
         NotaAprobacion.Free;
       end;
     end;
  end;

  if ValorSql('SELECT tb_especial1' +
               ' FROM ctb_tablas' +
              ' WHERE tb_clave = ''SUBPR''' +
                ' AND tb_codigo = ' + SqlString(NVL(fraSubPrestacion.edCodigo.Text,
                                                    sdqDatos.FieldByName('AU_SUBAPRO').Text), True)) = 'S' then
  begin
    sdqDatos.Close;
    sdqDatos.Open;
    if (sdqDatos.FieldByName('TJ_CALLE').Text = '') or
       (sdqDatos.FieldByName('TJ_CPOSTAL').Text = '') or
       (sdqDatos.FieldByName('TJ_LOCALIDAD').Text = '') or
       (sdqDatos.FieldByName('TJ_NUMERO').Text = '') then
      MsgBox('El domicilio del Trabajador está incompleto', MB_ICONEXCLAMATION)
    else
      ImprimirComodato(iNroAutorizacion);
  end;   
end;


procedure TfrmAutAprob.GenerarNota2;
var
  sTmp: String;
begin
  sTmp := ' en lugar de ' + edPrestCantidad.Text + ' ' + edPrestPrestDescripcion.Text + ' - '  + edPrestDetalle.Text;
  GenerarNota1(NumAuto, sTmp);
end;


procedure TfrmAutAprob.ImprimirComodato(iNroAutorizacion: Integer);
var
  Ciudad: String;
  DatosFirmante: TDatosFirmante;
  FechaDevol: String;
  FechaEntrega: String;
  Material: String;
  Provincia: String;
  Resultado: TResultados;
  iIdExped: Integer;
begin
  Provincia := '';
  Material  := '';
  Provincia := ValorSql('SELECT pv_descripcion' +
                         ' FROM cpv_provincias' +
                        ' WHERE pv_codigo = ' + sdqDatos.FieldByName('TJ_PROVINCIA').Text);
  Material  := ValorSql('SELECT tb_descripcion' +
                         ' FROM ctb_tablas' +
                        ' WHERE tb_clave = ''SUBPR''' +
                          ' AND tb_codigo = ' + SqlString(sdqDatos.FieldByName('AU_SUBAPRO').Text, True));
  FechaEntrega := ValorSql('SELECT to_char(nvl(au_fechaimpresion, actualdate), ''DD/MM/YYYY'')' +
                            ' FROM sau_autorizaciones' +
                           ' WHERE au_siniestro = ' + IntToStr(vSiniestro) +
                             ' AND au_orden = ' + IntToStr(vOrden) +
                             ' AND au_recaida = ' + IntToStr(vRecaida) +
                             ' AND au_numauto = ' + IntToStr(iNroAutorizacion));
  if (FechaEntrega <> '') then
    FechaDevol := DateToStr(StrToDate(FechaEntrega) + StrToInt(NVL(sdqDatos.FieldByName('AU_DIASDEVOL').AsString, '0')));
  Ciudad := ValorSql('SELECT IIF_CHAR(lg_localidad, ''CAPITAL FEDERAL'', ''Buenos Aires'', InitCap(lg_localidad))' +
                      ' FROM dlg_delegaciones, usc_sectores' +
                     ' WHERE sc_delegacion = lg_codigo' +
                       ' AND sc_codigo = ''' + Sesion.Sector + '''');

  with TqrMoldeReporteRTF.Create(Self) do
  try
    Fecha := GetFechaAprobacion;
    Lugar := LugarImpresion;
    EMail := fraPrestadorAprob.CorreoElectronico;
    Name  := ClassName + '_ContratoDeComodato';

    ReportTitle := 'Contrato de Comodato - Siniestro ' + edSiniestro.Text;
    MuestraSaludo := False;

    Prestador := fraPrestadorAut.RazonSocial + ' (' + IntToStr(fraPrestadorAut.IDPrestador) + ')';
    Domicilio := InitCap(fraPrestadorAut.Domicilio) + CRLF +
                 '(' + fraPrestadorAut.CodigoPostal  + ')-' + InitCap(fraPrestadorAut.Localidad) + CRLF +
                 InitCap(Self.sdqDatos.FieldByName('PV_DESCRIPCION').AsString) + CRLF +
                 IIF(fraPrestadorAut.Telefono > '', 'Tel: ' + fraPrestadorAut.Telefono, '');
    Referente := 'Damnificado: ' + edTrabNombre.Text + CRLF +
                 'D.N.I.: ' + GetDNI(edTrabCUIL.Text) + CRLF +
                  iif(not(Self.sdqDatos.FieldByName('TELEFONO').IsNull),                              // TK 35353
                     'Teléfono: ' + Self.sdqDatos.FieldByName('TELEFONO').AsString + CRLF + '','') +
                 'Fecha de Ocurrencia: ' + edSiniFecha.Text  + CRLF +
                 'Denuncia Nº:' + edSiniestro.Text + CRLF +
                 'Autorización Nº: ' + IntToStr(iNroAutorizacion) + CRLF +
                 'Fecha de Solicitud: ' + edPrestacFSolicitud.Text;

    DatosFirmante := Get_DatosFirmante(ID_FIRMA_PREST);

    with qrmDetalle do
    begin
      Lines.Add('Entre "' + TXT_EMP_NOMBRE_LARGO + '", con domicilio legal en ' + TXT_EMP_DOMICILIO + ', '
                + TXT_EMP_LOCALIDAD + ', representada en este acto por ' + String(iif(Uppercase(Copy(DatosFirmante.Nombre, 0, 2)) = 'DR', 'el ', '')) + DatosFirmante.Nombre + ', en su carácter de ' + DatosFirmante.Cargo + ', '
                + 'según lo acreditan los elementos que se exhiben, en adelante "' + TXT_EMP_RSOCIAL + '", por una parte; y por la '
                + 'otra, el Sr. '
                + Self.sdqDatos.FieldByName('TJ_NOMBRE').Text + ' CUIL Nº ' + Self.sdqDatos.FieldByName('EX_CUIL').Text + ', constituyendo domicilio en '
                + Self.sdqDatos.FieldByName('TJ_CALLE').Text + ' ' + Self.sdqDatos.FieldByName('TJ_NUMERO').Text + ' ' + Self.sdqDatos.FieldByName('TJ_PISO').Text
                + ' ' + Self.sdqDatos.FieldByName('TJ_DEPARTAMENTO').Text + ' (' + Self.sdqDatos.FieldByName('TJ_CPOSTAL').Text + ') ' + Self.sdqDatos.FieldByName('TJ_LOCALIDAD').Text + ' ' + Provincia
                + '; en adelante "EL ACCIDENTADO", convienen en celebrar el presente Contrato de Comodato, conforme las cláusulas y '
                + 'condiciones que seguidamente se enuncian: ');
      Lines.Add(' ');

      Lines.Add('Primera:');

      Lines.Add('Según las constancias fehacientes sobrantes en poder de "' + TXT_EMP_RSOCIAL + '", "EL ACCIDENTADO" '
                + 'es trabajador de la empresa ' + Self.sdqDatos.FieldByName('MP_NOMBRE').Text + ', CUIT Nº ' + Self.sdqDatos.FieldByName('EX_CUIT').Text + ', resultando cubierto por el '
                + 'infortunio que sufriera, en los términos de la Ley de Riesgos del Trabajo 24.557, sus '
                + 'reglamentaciones y anexos. ');

      Lines.Add('Segunda:');

      Lines.Add('Con arreglo a lo expuesto en la Cláusula anterior, "' + TXT_EMP_RSOCIAL + '" hace entrega en este acto y en '
                + 'calidad de comodato a "EL ACCIDENTADO", del siguiente material ' + Material
                + ' sirviendo la firma del presente de suficiente constancia de la recepción del mismo. ');

      Lines.Add('Tercera:');

      Lines.Add('La entrega del material de mención , genera para "EL ACCIDENTADO", la obligación de restituirlo '
                + 'dentro del plazo de ' + Self.sdqDatos.FieldByName('AU_DIASDEVOL').Text + ' días, o de aquel que se deje constancia al pie del presente, en caso de que se deje el '
                + 'tratamiento para cual se provee el elemento de mención. ');

      Lines.Add('Cuarta:');

      Lines.Add('Asimismo "EL ACCIDENTADO" asume la obligación de restituir el material en el tiempo y forma '
                + 'indicados, y en las mismas condiciones en que lo recibe, salvo el desgaste propio que genere su normal utilización. ');

      Lines.Add('Quinta:');

      Lines.Add('En caso de extravío, robo, ruptura o cualquier otra circunstancia que determine la imposibilidad de '
                + 'reintegro del material en las condiciones estipuladas, "EL ACCIDENTADO" asume la responsabilidad de '
                + 'reponerlo por otro de idénticas características a las del que le fuera entregado, dentro del plazo que en tal '
                + 'supuesto establezca "' + TXT_EMP_RSOCIAL + '". En caso contrario, ésta última se reserva el ejercicio de las acciones '
                + 'legales correspondientes para resarcirse del perjuicio ocasionado. ');

      Lines.Add('Sexta:');

      Lines.Add('"' + TXT_EMP_RSOCIAL + '" se reserva la facultad de reemplazar o sustituir el material objeto de este contrato, '
                + 'por otro, y de acuerdo a la evolución de la patología que presente "EL ACCIDENTADO".  En este caso, se '
                + 'dejará debida constancia por escrito, suscripta por "' + TXT_EMP_RSOCIAL + '" y por "EL ACCIDENTADO" del '
                + 'cambio llevado a cabo, detallándose las características del nuevo material que se entregue. ');

      Lines.Add('Séptima:');

      Lines.Add('El material a que se refiere el presente se entrega desde el ' + FechaEntrega + ' hasta el ' + FechaDevol + '. Dicho lapso podrá ser '
                + 'prorrogado cuando las necesidades del tratamiento y/o la utilidad que debe prestar el mismo, así lo '
                + 'determinen, mediante comunicación fehaciente del médico interviniente. ');

      Lines.Add(' ');
      Lines.Add('No siendo para mas se firman dos ejemplares de un mismo tenor y a un solo efecto, en '
                + Ciudad
                + ', a los ' + DateFormat(StrToDate(FechaEntrega)  , 'd ''días del mes de '' MMMM ''de'' yyyy')   + '.');
      Lines.Add(' ');

      Lines.Add('Cláusula Adicional:');
      Lines.Add('Encontrándose debidamente acreditado ante "' + TXT_EMP_RSOCIAL + '" que "EL ACCIDENTADO" '
                + 'se encuentra imposibilitado de retirar personalmente el material que se entrega en comodato, '
                + 'se deja constancia de que el mismo procede a ser retirado por _ _ _ _ _ _ _ _ _ DNI _ _ _ _ _ _ _ en '
                + 'su carácter de _ _ _ _ _ _ _ _ _ _ _ , de "EL ACCIDENTADO", firmando al pie de la presente cláusula en prueba de recepción '
                + 'de dicho material.');
    end;

    PrinterSettings.Copies := 2;

    iIdExped := Get_IdExpediente(vSiniestro, vOrden, vRecaida);

    Resultado := Ejecutar([], 'AMED', Armar_Siniestro(vSiniestro, vOrden, vRecaida), 'C' {TipoDoc}, 'P' {TipoDest},
                              fraPrestadorAprob.Fax {Telefono}, fraPrestadorAprob.RazonSocial {Nombre},
                              fraPrestadorAprob.IDPrestador {IdDest}, vSiniestro, false, iIdExped);
    DoActualizarImpresionAutorizacion(vSiniestro, vOrden, vRecaida, iNroAutorizacion, Resultado);
  finally
    Printers.Printer.Copies := 1;
    Free;
  end;
end;

procedure TfrmAutAprob.GenerarNotaRechazo(iNroAutorizacion :Integer);
var
  Resultado: TResultados;
  sTmp: String;  
begin
  with TqrMoldeReporteRTF.Create(Self) do
  try
    Fecha := GetFechaAprobacion;
    Lugar := LugarImpresion;
    EMail := fraPrestadorAprob.CorreoElectronico;
    Name  := ClassName + '_NotaDeRechazo';

    ReportTitle := 'Nota de Rechazo - Siniestro ' + edSiniestro.Text;
        
    Prestador := fraPrestadorAut.RazonSocial + ' (' + IntToStr(fraPrestadorAut.IDPrestador) + ')';
    Domicilio := InitCap(fraPrestadorAut.Domicilio) + CRLF +
                 '(' + fraPrestadorAut.CodigoPostal + ')-' + InitCap(fraPrestadorAut.Localidad) + CRLF +
                 InitCap(Self.sdqDatos.FieldByName('PV_DESCRIPCION').AsString) + CRLF +
                 IIF(fraPrestadorAut.Telefono > '', 'Tel: ' + fraPrestadorAut.Telefono, '');
    Referente := 'Damnificado: ' + edTrabNombre.Text + CRLF +
                 'D.N.I.: ' + GetDNI(edTrabCUIL.Text) + CRLF +
                 'Fecha de Ocurrencia: ' + edSiniFecha.Text  + CRLF +
                 'Denuncia Nº:' + edSiniestro.Text + CRLF +
                 'Autorización Nº: ' + IntToStr(iNroAutorizacion) + CRLF +
                 'Fecha de Solicitud: ' + edPrestacFSolicitud.Text;

    with qrmDetalle do
    begin
      sTmp := Nvl(edCantidad.Text, edPrestCantidad.Text);

      if StrTofloat(sTmp) <= 1 then
        sTmp := ''
      else
        sTmp := sTmp + ' ';

      Lines.Add('Nos dirigimos a Ud. a fin de informarle que se rechaza la prestación ' +
                edPrestPrestacCodigo.Text + ' - ' + edPrestPrestDescripcion.Text + ', cant. ' + sTmp + '.');
      Lines.Add('');
      Lines.Add('');
      Lines.Add('');

      //Si fue una DERIVACION se le agrega el Prestador Solicitante tambien.
      if fraPrestadorAprob.IDPrestador <> fraPrestadorAut.IDPrestador then
      begin
        Lines.Add('Prestador Solicitante:');
        Lines.Add(fraPrestadorAut.RazonSocial);
        Lines.Add(fraPrestadorAut.Domicilio);
        Lines.Add('(' + fraPrestadorAut.CodigoPostal + ') - ' + fraPrestadorAut.Localidad);
        Lines.Add(InitCap(fraPrestadorAprob.Provincia));
        Lines.Add(fraPrestadorAut.Telefono);
      end;
      Lines.Add('');
      Lines.Add('');
      Lines.Add('Observaciones: ' + IIF(memoObservacionesImpresion.Lines.Text > '', memoObservacionesImpresion.Lines.Text, '-'));
      Lines.Add('');
      Lines.Add('');

      //---[Aval, Nro.Documento, Caracter y Usuario de aprobación]--------------------------------------------------------------
      Lines.Add('Aval: ' + InitCap(Reporte_Firmante) + ' - Nro.Doc: ' + Reporte_NroDocumento);
      Lines.Add(InitCap(Reporte_Caracter));
      Lines.Add('');
      Lines.Add('');
      Lines.Add('Gestionó: ' + InitCap(Reporte_Usuario));
    end;

    Resultado := Ejecutar([], 'AMED', Armar_Siniestro(vSiniestro, vOrden, vRecaida), 'R' {TipoDoc}, 'P' {TipoDest},
                              fraPrestadorAprob.Fax {Telefono}, fraPrestadorAprob.RazonSocial {Nombre},
                              fraPrestadorAprob.IDPrestador {IdDest});

    DoActualizarImpresionAutorizacion(vSiniestro, vOrden, vRecaida, iNroAutorizacion, Resultado);
  finally
    Free;
  end;
end;

procedure TfrmAutAprob.btnPedInfoClick(Sender: TObject);
var
  frmPedidoInfo: TfrmPedidoInfo;
  tmpEstado: Char;
begin
  frmPedidoInfo := TfrmPedidoInfo.Create(Self);
  try
    tmpEstado := frmPedidoInfo.ShowForm(vSiniestro, vOrden, vRecaida, NumAuto, 'A', Chr(edDatRefEstado.Tag), 0 , 0);   // los dos "0" que le paso como ultimos parametros, corresponde al parametro "Volante", y al parametro "NroParte" que solo se utiliza en el modulo Liquidaciones y P.Evol., aca no se usa.
    if tmpEstado <> Chr(edDatRefEstado.Tag) then
    begin
      edDatRefEstado.Text := ValorSql('SELECT tb_descripcion' +
                                       ' FROM ctb_tablas' +
                                      ' WHERE tb_codigo = ''' + tmpEstado + '''' +
                                        ' AND tb_clave = ''MUAUT''');
      edDatRefEstado.Tag := Ord(tmpEstado);
      edDatRefEstado.Font.Color := clRed;
    end
    else
      edDatRefEstado.Font.Color := clWindowText;
  finally
    frmPedidoInfo.Free;
  end;
  sdqDatos.Close;
  CargarAutorizacion(IdAuto);
end;

procedure TfrmAutAprob.btnTrabajadorClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    CargarDatosTrabajador(IdTrabajador,
                          ValorSQLIntegerEx('SELECT rl_id ' +
                                             ' FROM crl_relacionlaboral ' +
                                            ' WHERE rl_contrato = :CONTRATO ' +
                                              ' AND rl_idtrabajador = :IDTRABAJADOR',
                                                   [Contrato, IdTrabajador]));
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmAutAprob.GenerarNotaDerivacion(iNroAutorizacion: Integer);
var
  nIndice: Integer;
  Resultado: TResultados;
  sTmp: String;
begin
  with TqrMoldeReporteRTF.Create(Self) do
  try
    Fecha := GetFechaAprobacion;
    Lugar := LugarImpresion;
    EMail := Self.sdqDatos.FieldByName('CA_DIRELECTRONICA').AsString;
    Name  := ClassName + '_NotaDeDerivacion';

    ReportTitle := 'Nota de Derivación - Siniestro ' + edSiniestro.Text;

    Prestador :=  fraPrestadorAut.RazonSocial + ' (' + IntToStr(fraPrestadorAut.IDPrestador) + ')';
    Domicilio := InitCap(fraPrestadorAut.Domicilio) + CRLF +
                 '(' + fraPrestadorAut.CodigoPostal + ')-' + InitCap(fraPrestadorAut.Localidad) + CRLF +
                 InitCap(Self.sdqDatos.FieldByName('PV_DESCRIPCION').AsString) + CRLF +
                 IIF(fraPrestadorAut.Telefono > '', 'Tel: ' + fraPrestadorAut.Telefono, '');
    Referente := 'Damnificado: ' + edTrabNombre.Text + CRLF +
                 'D.N.I.: ' + GetDNI(edTrabCUIL.Text) + CRLF +
                 'Fecha de Ocurrencia: ' + edSiniFecha.Text  + CRLF +
                 'Denuncia Nº:' + edSiniestro.Text + CRLF +
                 'Autorización Nº: ' + IntToStr(iNroAutorizacion) + CRLF +
                 'Fecha de Solicitud: ' + edPrestacFSolicitud.Text;

    qrlGTrabajo.Caption := GetGrupoTrabajo(vSiniestro,vOrden,vRecaida);
    qrlDelegacion.Caption := GetDelegacion(vSiniestro,vOrden,vRecaida);

    with qrmDetalle do
    begin
      sTmp := edPrestCantidad.Text;

      if StrTofloat(sTmp) <= 1 then
        sTmp := ''
      else
        sTmp := sTmp + ' ';

      nIndice := Lines.Add('Nos dirigimos a Ud. a fin de informarle que se deriva la prestación por Uds. solicitada (' +
                           sTmp + edPrestPrestDescripcion.Text + '), al prestador ' +
                           InitCap(fraPrestadorAprob.RazonSocial));
      if fraPrestadorAprob.Domicilio <> '' then
        Lines[nIndice] := Lines[nIndice] + ' con domicilio en ' +
                          fraPrestadorAprob.Domicilio + ' (' +
                          fraPrestadorAprob.CodigoPostal + ') ' +
                          fraPrestadorAprob.Localidad + ', ' +
                          fraPrestadorAprob.Provincia;

      if fraPrestadorAprob.Telefono <> '' then
        Lines[nIndice] := Lines[nIndice] + ', teléfono ' + fraPrestadorAprob.Telefono;

      Lines[nIndice] := Lines[nIndice] + '.';
      Lines.Add('');

      if edFechaTurno.Date <> 0 then
        Lines.Add('Turno para el día ' + edFechaTurno.LongDate('dddd, dd'' de ''MMMM'' de ''yyyy') +  ' a las ' + edHoraTurno.Text  + 'Hs.');

      Lines.Add('');
      Lines.Add('');
      Lines.Add('');
      Lines.Add('');

      //---[Aval, Nro.Documento, Caracter y Usuario de aprobación]--------------------------------------------------------------
      Lines.Add('Aval: ' + InitCap(Reporte_Firmante) + ' - Nro.Doc: ' + Reporte_NroDocumento);
      Lines.Add(InitCap(Reporte_Caracter));
      Lines.Add('');
      Lines.Add('');
      Lines.Add('Gestionó: ' + InitCap(Reporte_Usuario));

    end;

    Resultado := Ejecutar([], 'AMED', Armar_Siniestro(vSiniestro, vOrden, vRecaida), 'D' {TipoDoc}, 'P' {TipoDest},
                              fraPrestadorAprob.Fax {Telefono}, fraPrestadorAprob.RazonSocial {Nombre},
                              fraPrestadorAprob.IDPrestador {IdDest});

    DoActualizarImpresionAutorizacion(vSiniestro, vOrden, vRecaida, iNroAutorizacion, Resultado);
  finally
    Free;
  end;
end;

procedure TfrmAutAprob.edFechaTurnoExit(Sender: TObject);
begin
  if (edFechaTurno.Date < DBDate) then
  begin
    MessageDlg('La fecha del turno debe ser mayor a la fecha de hoy.', mtError, [mbOK], 0);
    edFechaTurno.Date := 0;
    Exit;
  end;
end;

procedure TfrmAutAprob.edHoraTurnoExit(Sender: TObject);
var
  hora: Integer;
  min: Integer;
begin
  if edHoraTurno.Text <> '  :  ' then
  begin
    hora := StrToInt(Copy(edHoraTurno.Text, 1, Pos(':', edHoraTurno.text) - 1));
    min  := StrToInt(Copy(edHoraTurno.Text, Pos(':', edHoraTurno.text) + 1, 2));
    if (Hora < 0) or (hora > 23) or (min < 0) or (min > 59) then
    begin
      MessageDlg('La hora del turno es invalida', mtError, [mbOK], 0);
      edHoraTurno.text := '';
      Exit;
    end;
  end;
end;

procedure TfrmAutAprob.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sSql, sSqlObs: String;
  bNoModifObserv: boolean;
begin
  bNoModifObserv := NoSePuedeModificarObservaciones;

  if ((memoObservaciones.Modified and not(bNoModifObserv)) or edFechaTurno.Modified or      // arreglo tk 57576
      edHoraTurno.Modified or edFechaOrtop.Modified) and
      MsgAsk('¿Desea guardar los cambios realizados?') and ValidarTurnoExistente then
  try

    if ValidarHoraIngresada then
    begin
      if bNoModifObserv then                // por ticket 57576
        sSqlObs := ''
      else
        sSqlObs := ' au_observaciones = ' + SqlString(memoObservaciones.Text, True) + ',';

      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET ' + sSqlObs +
              ' au_turno = TO_DATE(''' + IIF(TRIM(edFechaTurno.Text) = '/  /', '', edFechaTurno.Text) + ''', ''dd/mm/yyyy''),' +
              ' au_turnohora = ''' + IIF(TRIM(edHoraTurno.Text) = ':', '', edHoraTurno.Text) + ''', ' +
              ' au_fentregaortop = ' + SqlDate(edFechaOrtop.Date) +
        ' WHERE au_id = ' + SqlInt(IdAuto);
      EjecutarSql(sSql);
      ModalResult := MrOk;
    end;

  except
    on E: Exception do
      ErrorMsg(E, 'No se han podido guardar los cambios.');
  end;

end;


function TfrmAutAprob.ValidarHoraIngresada: boolean;
var hora, min: integer;
begin
  Result := True;
  // Validacion de la hora modificada
  if edHoraTurno.Text <> '  :  ' then
  begin
    hora := StrToInt(Copy(edHoraTurno.Text, 1, Pos(':', edHoraTurno.text) - 1));
    min  := StrToInt(Copy(edHoraTurno.Text, Pos(':', edHoraTurno.text) + 1, 2));
    if (Hora < 0) or (hora > 23) or (min < 0) or (min > 59) then
    begin
      MessageDlg('La hora del turno es invalida', mtError, [mbOK], 0);
      edHoraTurno.text := '';
      Result  := False;
    end;
  end;
end;

{-----[Reimpresión]--------------------------------------------------------------------------------------------------------------}
// DGastal (se modifico)
procedure TfrmAutAprob.btnImprimirClick(Sender: TObject);
var
  sEstado: String;
  TrasPlataforma: TrptTrasladosPlataforma;
begin
  bRefrescar := True;
  sEstado    := sdqDatos.FieldByName('AU_ESTADO').AsString;

  if  EsPlataforma10(fraPrestacionAut.edCodigo.Text, fraPrestadorAprob.IDPrestador) and ((sEstado = 'P') or (sEstado = 'A')) then
    //ImprimirTrasladosPlataforma(IdAuto)
  begin
    TrasPlataforma := TrptTrasladosPlataforma.Create(nil);
    try
      TrasPlataforma.Imprimir(sdqdatos.FieldByName('au_id').AsInteger);
    finally
      TrasPlataforma.Free;
    end;
  end
  else if (sEstado = 'R') then
    GenerarNotaRechazo(NumAuto)
  else if (sEstado = 'D') then
    GenerarNotaDerivacion(NumAuto)
  else if (sEstado = 'A') or (sEstado = 'E') or (sEstado = 'U')// and (fraPrestacionAut.sdqDatos.FieldByName('PR_FORMULARIO').AsString = 'T'))
  then
  begin
    if (fraPrestacionAut.edCodigo.Text <> edPrestPrestacCodigo.Text) or
       ((fraPrestacionAut.edCodigo.Text = edPrestPrestacCodigo.Text) and
        (edcantidad.Value <> edprestcantidad.Value)) then
      GenerarNota2
    else
      GenerarNota1(NumAuto);
  end
  else
  begin
    MsgBox('No hay ninguna nota que imprimir, para las autorizaciones con estado "' + edDatRefEstado.Text + '".', MB_ICONINFORMATION);
    bRefrescar := False;
  end;
end;


function TfrmAutAprob.Validar(Sender: TObject): Boolean;
var
  iPrestador: TPrestador;
  rCotizacion: Currency;
  sMaterialCotizado, sSql, msjfecha: String;
  valormultiplo: integer;
  dFechaAltaPrestador: TDate;
begin
  Result := False;
  valormultiplo := ValorSqlEx('select pr_cantidadmultiplo from art.mpr_prestaciones where pr_codigo = :cod',
                   [fraPrestacionAut.edCodigo.Text]);

  if (Sender = btnAprobar) then
  begin
    //si la prestación es del tipo "M" (Medicamento) o si es ortopedia la prestación no es obligatoria
    if (fraPrestacionAut.sdqDatosPR_FORMULARIO.AsString = 'M') or IsPresupuestos then
      fraNomencladorAprob.ExigePrestacion := False;

    if edCantidad.Focused then
      edCantidadExit(nil);

    if (fraPrestacionAut.sdqDatos.FieldByName('PR_FORMULARIO').AsString = 'P') and
            (edImporte.Value = 0) and (vIdStock = 0) then
      InvalidMsg(edImporte, 'Debe completar el Importe (por el tipo de formulario).')

    else if (fraPrestacionAut.sdqDatos.FieldByName('PR_FORMULARIO').AsString = 'P') and (edDetalle.Text = '') then
      InvalidMsg(edDetalle, 'Debe completar el Detalle (por el tipo de formulario).')

    else if (fraPrestadorAprob.IDPrestador = 0) then
      InvalidMsg(fraPrestadorAprob, 'El Prestador es obligatorio.')

    else if (fraPrestacionAut.edCodigo.Text = '') then
      InvalidMsg(fraPrestacionAut.edCodigo, 'El Tipo de Prestación es obligatorio.')

    else if ((meEspera.Text = '  :  ') and (fraPrestacionAut.edCodigo.Text = '449101')) then
      InvalidMsg(meEspera, 'Es necesario especificar el tiempo de espera para esta prestación.')

    else if (fraNomencladorAprob.ExigePrestacion) and {(fraNomencladorAprob.IdNomenclador <= 0)}
            ((fraNomencladorAprob.Nomenclador = '') or (fraNomencladorAprob.Capitulo = '') or (fraNomencladorAprob.Codigo = '')) then
      InvalidMsg(fraNomencladorAprob, 'La Prestación es obligatoria.')

    else if (not fraNomencladorAprob.IsSelected) and (not Validar_FecSolicitud_AltaPrestador(sdqDatos.FieldByName('AU_FECHASOLI').AsDateTime, fraPrestadorAprob.IDPrestador,
                                                                           dFechaAltaPrestador{, fraNomencladorAprob.Capitulo})) then   // TK 40001
    begin
      msjfecha := 'La Fecha de solicitud no puede ser anterior a la fecha de alta del Prestador.' + #13#10 +
                    '(Fecha de alta del Prestador: ';
      InvalidMsg(edPrestacFSolicitud, msjfecha + DateToStr(dFechaAltaPrestador) +')');
    end

    else if (valormultiplo <> 0) and (strtoint(edCantidad.Text) mod valormultiplo <> 0) then            //si valormultiplo es = 0, la prestación no requiere validación de múltiplo en la cantidad
      InvalidMsg(edCantidad, 'La Cantidad debe ser múltiplo de ' + inttostr(valormultiplo) + ' para la prestación seleccionada')      //DFG - 13/12/2011

    else if (fraPrestacionAut.sdqDatosPR_PERMITEESPERA.AsString = 'N') and
           ExisteSqlEx(' SELECT 1 ' +
                         ' FROM art.son_nomenclador ' +
                        ' WHERE on_nomenclador = ''1'' ' +
                          ' AND on_capitulo = ''MT'' ' +
                          ' AND on_codigo like ''1.03%'' ' +
                          ' AND on_nomenclador = :nom ' +
                          ' AND on_capitulo = :cap ' +
                          ' AND on_codigo = :cod ', [fraNomencladorAprob.Nomenclador, fraNomencladorAprob.Capitulo, fraNomencladorAprob.Codigo]) then
      InvalidMsg(fraNomencladorAprob, 'No se pueden asignar prestaciones de ''Espera'' al tipo de prestación seleccionado')

    else if not ValidarReqTrasladoAut then  // Lu TK 6220: por los casos de Conexia que se cargan directo.
      InvalidMsg(fraPrestacionAut, 'Auditoría de Provincia ART no amerita traslado en remis para el siniestro seleccionado.')

  {  else if Prestacion_ExigeTurno(fraPrestacionAut.sdqDatos.FieldByName('PR_CODIGO').AsString) and    // TK 15625
           (TRIM(edFechaTurno.Text) = '/  /') then        // <-- tuve que poner eso, porque esto: (edFechaTurno.Date = 0) no anda ...     // Estos dos tickes fueron quedados sin efecto con el ticket que los anula (el 16226), igualmente esto estaba todo comentado, ya que la funcionalidad definitiva se encontraba en el unAutCarga.
      InvalidMsg(edFechaTurno, 'El Turno es obligatorio para esta Prestación')         }  // esto se paso al unAutCarga por TK 15891

    else if fraNomencladorAprob.IsPresup and
      ExisteSql('SELECT 1' +
                 ' FROM spp_prestador_presupuesto' +
                ' WHERE pp_id = ' + SqlInt(fraNomencladorAprob.sdqDatosIDPRESUP.AsInteger) +
                  ' AND pp_prestador = ' + SqlInt(fraPrestadorAprob.IDPrestador) +
                  ' AND pp_idexpediente = siniestro.get_idexpediente( ' + SqlInt(vSiniestro) + ',' +
                                                                          SqlInt(vOrden) + ',' +
                                                                          SqlInt(vRecaida) + ')' +
                  ' AND pp_consumido >= pp_cantidad') then
        InvalidMsg(fraNomencladorAprob, 'La prestación seleccionada ya ha sido utilizada en su totalidad.')

    else if (ExisteSqlEx(' SELECT 1 FROM SIN.sem_eventomedicoreca ' +
                         ' WHERE em_prestacionaut = :prest AND em_generaautorizacion = ''S'' ',
                         [fraPrestacionAut.edCodigo.Text])) and
            (GetPrestacionesPrevias(fraPrestacionAut.edCodigo.Text) = false) then
      InvalidMsg(fraPrestacionAut, 'No es posible aprobar')

    else if (Sender = btnAprobar) and IsPresupuestos then  //and IsOrtopedia then
    begin
      GetDatosCotizacionOrtopedia(vSiniestro, vOrden, vRecaida, NumAuto, iPrestador, sMaterialCotizado, rCotizacion);

      if (vIdStock = 0) and     //********//
         ((fraPrestadorAprob.Value <> iPrestador) or (edDetalle.Text <> sMaterialCotizado) or
          (Abs(edImporte.Value - rCotizacion) > ErrorPrecisionReales)) then
        InvalidMsg(fraPrestadorAprob, 'Los valores ingresados no coinciden con la cotización adjudicada.')
      else  if vExigeVencimiento then
      begin
        dcFechaAlquiler.Date := vVencimAlquiler;
        if (fpVencimiento.ShowModal = mrOk) then
        begin
          sSql := 'UPDATE mso_siniestroortopedia' +
                    ' SET so_vencimiento = ' + SqlDate(dcFechaAlquiler.Date) + ',' +
                        ' so_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                        ' so_fechamodif = ART.ACTUALDATE' +
                  ' WHERE so_nropedido = ' + SqlInt(vNroPedido);
          EjecutarSql(sSql);

          sSql := 'UPDATE amed.msp_siniestropresup' +
                    ' SET sp_vencimiento = ' + SqlDate(dcFechaAlquiler.Date) + ',' +
                        ' sp_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                        ' sp_fechamodif = ART.ACTUALDATE' +
                  ' WHERE sp_nropedido = ' + SqlInt(vNroPedido);
          EjecutarSql(sSql);

          Result := True;
        end;
      end
      else
        Result := True;
    end
    else if (fraPrestacionAut.sdqDatos.FieldByName('PR_FORMULARIO').AsString = 'P') and
            (Trim(memoObservacionesImpresion.Lines.Text) = '') then
      InvalidMsg(memoObservacionesImpresion, 'Debe completar las Observaciones (por el tipo de formulario).')

    else
      Result := True;
  end
  else
    Result := True;
end;


function TfrmAutAprob.Validar_FecSolicitud_AltaPrestador(dFecSolicitud: TDate; iIdPrestador: integer;
                                                       VAR dFecAltaPrestador:TDate{; capitulo: string}): Boolean;  // TK 40001
//var ssql: string;
begin
  result := true;
  {ssql := ' select tb_especial2 from ctb_tablas ' +
          ' where tb_clave = ''TNOME'' and tb_codigo = :cod ';
  if (ValorSqlEx(ssql, [capitulo]) <> 'S') and (not IsPresupuestos) then }
  if (not IsPresupuestos) then
  begin
    dFecAltaPrestador := ValorSqlDateTimeEx('SELECT trunc(ca_fechalta) FROM art.cpr_prestador WHERE ca_identificador = :idPrest ',[iIdPrestador]);
    Result := (dFecSolicitud >= dFecAltaPrestador);  // la fecha de solicitud debe ser mayor o igual a la fecha en que se dio de alta el prestador.
  end;
end;

function TfrmAutAprob.GetPrestacionesPrevias(codprestacion: string): boolean;
var ssql, lista: string;
begin

  ssql := ' SELECT au_identifprestador, on_descripcion prestacion, au_fechaalta, ' +
                 ' tb_descripcion, iv_fecpresta, ' +
                 ' NVL(re_nombre, ''Sin responsable'') responsable, ' +
                 ' au_siniestro, au_orden, au_recaida, ca_descripcion ' +
            ' FROM art.sau_autorizaciones, art.ser_evemedrecalif, art.siv_itemvolante, ' +
                 ' art.mre_responsable, art.ctb_tablas, art.son_nomenclador, art.cpr_prestador ' +
           ' WHERE au_siniestro = er_siniestro(+) ' +
             ' AND au_orden = er_orden(+) ' +
             ' AND au_numauto = er_autorizacion(+) ' +
             ' AND er_evento(+) > 0 ' +
             ' AND au_siniestro = iv_siniestro(+) ' +
             ' AND au_orden = iv_orden(+) ' +
             ' AND au_recaida = iv_recaida(+) ' +
             ' AND au_numauto = iv_numauto(+) ' +
             ' AND er_responsable = re_responsable(+) ' +
             ' AND au_pres_nomenclador = on_nomenclador(+) ' +
             ' AND au_pres_capitulo = on_capitulo(+) ' +
             ' AND au_pres_codigo = on_codigo(+) ' +
             ' AND tb_codigo = au_estado ' +
             ' AND tb_clave = ''MUAUT'' ' +
             ' AND au_estado IN (''P'', ''A'', ''L'') ' +
             ' AND NVL(au_presapro, au_pressol) = :prest ' +
             ' AND au_siniestro = :sin ' +
             ' AND au_orden = :ord ' +
             ' AND au_recaida = :rec ' +
             ' AND au_numauto < :numauto ' +
             ' AND au_identifprestador = ca_identificador';

  with GetQueryEx(ssql, [CodPrestacion, vSiniestro, vOrden, vRecaida, NumAuto]) do
  begin
    if not Eof then
    begin
      lista := 'Existen las siguientes prestaciones previas. Desea continuar? ' + #13;
      while not Eof do
      begin
        lista := lista + 'Prestador: ' + fieldbyname('au_identifprestador').AsString + ' - ' +
                                         fieldbyname('ca_descripcion').AsString +
                         ' - Prestación: ' + fieldbyname('prestacion').AsString +
                         ' - Estado: ' + fieldbyname('tb_descripcion').AsString +
                         ' - Responsable: ' + fieldbyname('responsable').AsString +
                         ' - Fecha Alta: ' + fieldbyname('au_fechaalta').AsString +
                         ' - Fecha Liq.:' + fieldbyname('iv_fecpresta').AsString + #13;
        Next;
      end;
    end;
  end;

  GetPrestacionesPrevias := true;
  if lista <> '' then
    if msgbox(lista, MB_YESNO + MB_ICONQUESTION) = mrNo then
      GetPrestacionesPrevias := false;

end;

procedure TfrmAutAprob.FormCreate(Sender: TObject);
begin
  sdqImplante.Open;
  fraPrestacionAut.OnChange           := OnPrestacionChange;
  fraPrestadorAprob.OnChange          := OnPrestadorChange;
  fraNomencladorAprob.OnChange        := OnNomencladorChange;
  fraPrestadorAut.ShowNombreFanta     := True;
  fraPrestadorAut.ShowBajas           := True;
  fraPrestadorAut.Locked              := True;
  fraNomencladorAprob.ShowPresup      := True;
  fraNomencladorAprob.ShowConsumidos  := True;
  fraNomencladorAprob.ShowAbonos      := False;
  fraNomencladorAprob.ExigePrestacion := False;
  fraNomencladorAprob.OcultarValorNulo := False;  // TK 21117
  NumAutoDeriv      := 0;
  vNroDocTrabajador := '';
  bRefrescar        := False;
  FIsOrtopedia      := False;
  //malditos data sources! ME TIENEN PODRIDO.
  fraPrestacionAut.cmbDescripcion.DataSource    := fraPrestacionAut.dsDatos;
  VCLExtra.LockControls([edKilometraje, edKilometrajeExcedente], True);
  vclextra.LockControls(meEspera, true);
end;

procedure TfrmAutAprob.edImplanteExit(Sender: TObject);
begin
  cmbImplante.FieldValue := edImplante.Text;
end;

procedure TfrmAutAprob.edImplanteKeyPress(Sender: TObject; var Key: Char);
begin
  cmbImplante.FieldValue := edImplante.Text;
end;

procedure TfrmAutAprob.cmbImplanteGetCellParams(Sender: TObject;Field: TField; AFont: TFont; var Background: TColor;
                                                Highlight: Boolean);
begin
  if not sdqImplante.FieldByName('IM_FBAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmAutAprob.cmbImplanteCloseUp(Sender: TObject);
begin
  if not sdqImplante.FieldByName('IM_FBAJA').IsNull then
  begin
    MsgBox('No puede seleccionar un Implante dado de baja.', MB_ICONEXCLAMATION);
    edImplante.Text        := '';
    cmbImplante.FieldValue := '';
    cmbImplante.Text       := ''; // por las dudas...
  end
  else
    edImplante.Text := cmbImplante.FieldValue;
end;

function DomicilioDelegacion(APicture: TPicture; iSiniestro: Integer = 0): String;
var
  sqlResults: TStringList;
  sSql: String;
begin
  sSql :=
    'SELECT lg_logo, initcap(utiles.armar_domicilio(lg_calle, lg_numero, lg_piso, lg_departamento) || '' '' ||' +
          ' utiles.armar_localidad(lg_cpostal, '''', lg_localidad, lg_provincia)) direccion,' +
          ' utiles.armar_telefono(lg_codareatelefono, null, lg_telefono) telefono,' +
          ' IIF_CHAR(lg_localidad, ''CAPITAL FEDERAL'', ''Buenos Aires'', InitCap(lg_localidad)), ' + SQL_ACTUALDATE +
     ' FROM dlg_delegaciones, usc_sectores' +
    ' WHERE sc_delegacion = lg_codigo' +
      ' AND sc_codigo = ''' + Sesion.Sector + '''';
  sqlResults := ValoresColSql(sSql);
  try
    if SqlResults[0] = 'M' then
      APicture.Assign(frmPrincipal.imgLogoMutual.Picture)
    else begin
      if (iSiniestro <> 0) then
      begin
        if Is_SiniestroGobernacion(iSiniestro) then
          APicture.Assign(frmPrincipal.imgLogoGob.Picture)
        else
          APicture.Assign(frmPrincipal.imgLogo.Picture);
      end;
    end;

    Result := sqlResults[1] + #13 + #10 + sqlResults[2];
  finally
    sqlResults.Free;
  end;
end;

procedure TfrmAutAprob.OnPrestacionChange(Sender: TObject);
var
  bEsTraslado :Boolean;
begin
  bEsTraslado := (fraPrestacionAut.sdqDatosPR_FORMULARIO.AsString = 'T');
  if bEsTraslado or (fraPrestacionAut.sdqDatosPR_REQUIERETURNOS.AsString = 'S') then
  begin
    LockControls([fraSubPrestacion, edFechaTurno, edHoraTurno, edDiasDevol,
                  edImporte, edImplante, cmbImplante, edFechaOrtop], True);
    fraSubprestacion.Enabled  := False;
    edFechaTurno.Enabled      := False;
    edHoraTurno.Enabled       := False;
    edDiasDevol.Enabled       := False;
    edImporte.Enabled         := False;
    edImplante.Enabled        := False;
    cmbImplante.Enabled       := False;
    edFechaOrtop.Enabled      := False;
  end;
  DoHabilitarMultiples;
  DoHabilitarBotones;
  LockControl(edCantidad, bEsTraslado);
  edCantidad.Enabled         := not bEsTraslado;
  fraPrestadorAprob.Modified := False;
  fraPrestacionAut.Modified  := False;
  fraSubprestacion.Modified  := False;
  edCantidad.Modified        := False;
  edDiasDevol.Modified       := False;
  meEspera.Modified       := False;
  edImporte.Modified         := False;
  cmbImplante.Modified       := False;
  edImplante.Modified        := False;
  memoObservaciones.Modified := False;
  edFechaTurno.Modified      := False;
  edHoraTurno.Modified       := False;
  edFechaOrtop.Modified      := False;
  memoObservacionesImpresion.Modified := False;

  //if fraPrestacionAut.edCodigo.Text = '449101' then    //DFG 91111
  if fraPrestacionAut.sdqDatospr_canttiempo.AsString = 'S' then
    vclextra.LockControls( meEspera, false)
  else
  begin
    vclextra.LockControls( meEspera, true);
    meespera.Text := '  :  ';
  end;
    
end;

procedure TfrmAutAprob.HabilitacionControles;
var
  TmpBoolean, bHabProtesis :Boolean;
  sEstado :String;
begin
  DoHabilitarBotones;

  sEstado       := sdqDatos.FieldByName('au_estado').AsString;
  TmpBoolean   := not((sEstado = 'P') and btnAprobar.Enabled);
  bHabProtesis := not((sEstado = 'P') and
                      (fraPrestacionAut.sdqDatosPR_FORMULARIO.AsString = 'P') and
                      (fraPrestacionAut.sdqDatosPR_EXIGETURNO.AsString = 'S') and
                      sdqDatos.FieldByName('au_turno').IsNull); // TK 16264

  LockControls([fraPrestadorAprob, fraPrestacionAut.edCodigo, fraPrestacionAut.cmbDescripcion,
                fraSubprestacion.edCodigo, fraSubPrestacion.cmbDescripcion, fraNomencladorAprob,
                edCantidad, edDiasDevol, edImporte, meEspera, edDetalle, cmbImplante, edImplante], TmpBoolean);
  LockControl(edFechaTurno, TmpBoolean and not(AreIn(sEstado, ['A', 'E'])) and bHabProtesis);   // TK 16264
  LockControl(edHoraTurno,  TmpBoolean and not(AreIn(sEstado, ['A', 'E'])));
  LockControl(memoObservacionesImpresion, TmpBoolean and not btnRechazar.Enabled);
  LockControl(edFechaOrtop, not(IsOrtopedia) or not(AreIn(sEstado, ['A', 'C', 'L', 'E'])));

  if TmpBoolean then
  begin
    btnAgregarSubPr.Enabled := False;
    btnQuitarSubPr.Enabled  := False;
  end;
end;

function TfrmAutAprob.TrasladosAprobar(TipoPrest: TTipoPrestacion): Boolean;
var
  frmTraslados: TfrmTraslados;
begin
  frmTraslados := TfrmTraslados.Create(Self);
  try
    frmTraslados.IDPrestador := fraPrestadorAprob.Value;
    frmTraslados.CargarPantalla(vSiniestro, vOrden, vRecaida, NumAuto, edTrabCuil.Text,
                                edTrabNombre.Text, fraPrestacionAut.edCodigo.Text,
                                TipoPrest);
    frmTraslados.cmbTurnoFecha.MinDate  := StrToDate(edPrestFRecepcion.Text);
    if frmTraslados.ShowModal = mrOk then {quiere decir que aprobó}
    begin
      edCantidad.Text         := IntToStr(frmTraslados.CalcularCantidad);
      fraPrestadorAprob.Value := frmTraslados.IDPrestador;

      if (frmTraslados.edTarifaVuelo.Value > 0) then
        edImporte.Value := frmTraslados.edTarifaVuelo.Value
      else begin
        if edImporte.Value = 0 then
          edImporte.Value := ValorSqlExtendedEx('SELECT au_impoapro ' +
                                                 ' FROM sau_autorizaciones ' +
                                                ' WHERE au_id = :id', [IdAuto]);
      end;

      // Cambio la prestación si corresponde...
      FHuboCambioPrestacion := frmTraslados.HuboCambioPrestacion;
      Result := True
    end
    else
      Result := False; {que no aprobó}
  finally
    frmTraslados.Free;
  end
end;

{------[para ver el detalle del traslado una vez aprobado]-----------------------------------------------------------------------}
procedure TfrmAutAprob.btnVerTrasladoClick(Sender: TObject);
var
  frmTraslados:TfrmTraslados;
begin
  frmTraslados := TfrmTraslados.Create(Self);
  try
    with frmTraslados do
    begin
      IDPrestador := fraPrestadorAprob.IDPrestador; 
      CargarPantalla(vSiniestro, vOrden, vRecaida, NumAuto, edTrabCuil.Text, edTrabNombre.Text,
                     fraPrestacionAut.edCodigo.Text);
      DeshabilitarControles;
    end;
    frmTraslados.ShowModal;
    bRefrescar := frmTraslados.bRefrescar;
  finally
    frmTraslados.Free;
  end;
end;

{-----[Trae el caracter del firmante]--------------------------------------------------------------------------------------------}
function TfrmAutAprob.Reporte_Caracter: String;
begin
  Result := ValorSqlEx('SELECT INITCAP(fi_caracter) ' +
                        ' FROM cfi_firma ' +
                       ' WHERE fi_id = :IdFirma', [IIF(iFirmante > 0, iFirmante, sdqDatos.FieldByName('AU_AVAL').AsInteger)]);
end;

{-----[Trae el Firmante ó Aval]--------------------------------------------------------------------------------------------------}
function TfrmAutAprob.Reporte_Firmante: String;
begin
  Result := ValorSqlEx('SELECT INITCAP(fi_firmante) ' +
                        ' FROM cfi_firma ' +
                       ' WHERE fi_id  = :IdFirma ', [IIF(iFirmante > 0, iFirmante, sdqDatos.FieldByName('AU_AVAL').AsInteger)]);
end;

{-----[Trae el Nro.Documento del Firmante]---------------------------------------------------------------------------------------}
function TfrmAutAprob.Reporte_NroDocumento: String;
begin
  Result := ValorSqlEx('SELECT UPPER(fi_documento) ' +
                        ' FROM cfi_firma ' +
                       ' WHERE fi_id = :IdFirma', [IIF(iFirmante > 0, iFirmante, sdqDatos.FieldByName('AU_AVAL').AsInteger)]);
end;

{-----[Trae el Nombre del usuario que aprobó]------------------------------------------------------------------------------------}
function TfrmAutAprob.Reporte_Usuario: String;
begin
  if edDatRefUsuAprob.Text = '' then
    Result := Sesion.Usuario
  else
    Result := ValorSql('SELECT se_nombre FROM use_usuarios WHERE se_usuario = ''' + edDatRefUsuAprob.Text + '''');
end;

{-----[Fecha de aprobacion de las cartas--}
function TfrmAutAprob.GetFechaAprobacion: TDateTime;
begin
  Result := ValorSQLDateTimeEx('SELECT au_fechapro' +
                                ' FROM sau_autorizaciones' +
                               ' WHERE au_siniestro = :V1' +
                                 ' AND au_orden     = :V2' +
                                 ' AND au_recaida   = :V3' +
                                 ' AND au_numauto   = :V4', [vSiniestro, vOrden, vRecaida, NumAuto]);
end;

{-----[Lugar de impresion de las cartas (agregado del campo Au_FechaImpresion)]---}
class function TfrmAutAprob.LugarImpresion(sUsuario: String = ''): String;
begin
  if sUsuario = '' then
    sUsuario := ValorSQLEx('SELECT au_usuapro' +
                            ' FROM sau_autorizaciones' +
                           ' WHERE au_siniestro = :V1' +
                             ' AND au_orden     = :V2' +
                             ' AND au_recaida   = :V3' +
                             ' AND au_numauto   = :V4', [vSiniestro, vOrden, vRecaida, NumAuto]);

  if (sUsuario > '') then
    Result := ValorSqlEx('SELECT IIF_CHAR(lg_localidad, :V1, INITCAP(:V2), INITCAP(lg_localidad))' +
                          ' FROM dlg_delegaciones, usc_sectores, use_usuarios' +
                         ' WHERE se_sector = sc_codigo' +
                           ' AND lg_codigo = sc_delegacion' +
                           ' AND se_usuario = :Usuario', ['CAPITAL FEDERAL', 'BUENOS AIRES', sUsuario])
  else
    Result := 'Buenos Aires';
end;

{function TfrmAutAprob.DescProvincia(CodProvincia: String): String;
begin
  Result := ValorSql('SELECT pv_descripcion FROM cpv_provincias WHERE pv_codigo = ' + SqlString(CodProvincia, True));
end;

function TfrmAutAprob.FaxPrestador: String;
begin
  if fraPrestadorAprob.IDPrestador <> 0 then
    Result := ValorSql('SELECT ca_fax FROM cpr_prestador WHERE ca_identificador = ' + SqlValue(fraPrestadorAprob.IDPrestador))
  else
    Result := ValorSql('SELECT ca_fax FROM cpr_prestador WHERE ca_identificador = ' + IntToStr(PrestadorBaja));
end;}

{---[ Avisa si la Cantidad es Mayor a la Autorizada ]----------------------------------------------------------------------------}
procedure TfrmAutAprob.edCantidadChange(Sender: TObject);
begin
  if (not meEspera.ReadOnly) and meEspera.Visible then
    meEspera.Text := LPad(Trunc(edCantidad.Value), '0', 2) + ':' + LPad(Trunc((edCantidad.Value - Trunc(edCantidad.Value)) * 60), '0', 2);
end;

procedure TfrmAutAprob.edCantidadExit(Sender: TObject);
begin
  if (edCantidad.Value > edPrestCantidad.Value) and (MsgBox('La Cantidad Aprobada es mayor que la Cantidad Solicitada' + #13 + '¿Desea conservar este valor?', MB_ICONQUESTION + MB_YESNO, 'Atención') = IDNO) then
    edCantidad.Value := edPrestCantidad.Value;

  if (edCantidad.Value > 0) and (btnCotizPresupuesto.Tag <> 1) then
    SetValor;
  DoBloquearValor;
end;

procedure TfrmAutAprob.OnPrestadorChange(Sender: TObject);
begin
   DoCambioPrestador;
   if btnCotizPresupuesto.Tag <> 1 then  { by NWK, 28/03/03, el valor de la cotización de ortopedia no se puede cambiar }
   begin
     edImporte.Clear;
     edImporte.Value    := 0;
     edImporte.Enabled  := True;
     edImporte.ReadOnly := False;
     edImporte.Color    := clWindow;
   end;
end;

procedure TfrmAutAprob.OnNomencladorChange(Sender: TObject);
begin
  if btnCotizPresupuesto.Tag <> 1 then  { by NWK, 28/03/03, el valor de la cotización de ortopedia no se puede cambiar }
    DoCargarRelaciones;
  vIdPresupuesto := fraNomencladorAprob.sdqDatosIDPRESUP.AsInteger;
  DoBloquearValor;
end;

procedure TfrmAutAprob.fraNomencladorAprobExit(Sender: TObject);
begin
  fraNomencladorAprob.FrameExit(Sender);
  if btnCotizPresupuesto.Tag <> 1 then  { by NWK, 28/03/03, el valor de la cotización de ortopedia no se puede cambiar }
    DoCargarRelaciones;
  DoBloquearValor;
  edImporte.Tag                := 0;
  fraNomencladorAprob.Modified := False;
end;

procedure TfrmAutAprob.edImporteChange(Sender: TObject);
begin
  edImporte.Tag := 1;
end;

procedure TfrmAutAprob.edImporteEnter(Sender: TObject);
begin
  if edImporte.Tag > 0 then
    edImporte.Tag := 0;
end;

procedure TfrmAutAprob.SetIsOrtopedia(const Value: Boolean);
begin
  if FIsOrtopedia <> Value then
    FIsOrtopedia := Value;
end;

procedure TfrmAutAprob.GetDatosCotizacionOrtopedia(iSiniestro, iOrden, iRecaida, iNroAutorizacion: Integer;
                                                   var iPrestador: TPrestador; var sMaterialCotizado: String;
                                                   var rCotizacion: Currency);
var
  sSql: String;
begin
  sSql := 'SELECT pa_prestador, pa_materialcoti, sp_valor_adju, sp_vencimiento, sp_nropedido, tp_exigevencimiento' +
           ' FROM AMED.msp_siniestropresup, AMED.mpa_presupuestoautorizacion, amed.mtp_tipopresupuesto' +
          ' WHERE sp_siniestro = ' + SqlValue(iSiniestro) +
            ' AND sp_orden = ' + SqlValue(iOrden) +
            ' AND sp_recaida = ' + SqlValue(iRecaida) +
            ' AND (sp_autooriginal = ' + SqlValue(iNroAutorizacion) +
             ' OR sp_autoapro = ' + SqlValue(iNroAutorizacion) + ')' +
            ' AND sp_adjudicado = ''S''' +
            ' AND sp_fechabaja IS NULL' +
            ' AND sp_presupuesto = pa_id' +
            ' AND pa_tipo = tp_id';
  with GetQuery(sSql) do
  try
    if IsEmpty then
    begin
      iPrestador        := 0;
      vNroPedido        := 0;
      rCotizacion       := 0;
      vVencimAlquiler   := 0;
      sMaterialCotizado := '';
      vExigeVencimiento := False;
    end
    else begin
      iPrestador        := FieldByName('PA_PRESTADOR').AsInteger;
      sMaterialCotizado := FieldByName('PA_MATERIALCOTI').AsString;
      rCotizacion       := FieldByName('SP_VALOR_ADJU').AsCurrency;
      vExigeVencimiento := (FieldByName('TP_EXIGEVENCIMIENTO').AsString = 'S');
      vVencimAlquiler   := FieldByName('SP_VENCIMIENTO').AsDateTime;
      vNroPedido        := FieldByName('SP_NROPEDIDO').AsInteger;
    end;
  finally
    Free;
  end;
end;

{ by NWK, 24/03/03 }
procedure TfrmAutAprob.btnCotizPresupuestoClick(Sender: TObject);
var
  iPrestador: TPrestador;
  rCotizacion: Currency;
  sMaterialCotizado: String;
begin
  GetDatosCotizacionOrtopedia(vSiniestro, vOrden, vRecaida, NumAuto, iPrestador, sMaterialCotizado, rCotizacion);
  if iPrestador <> 0 then
  begin
    btnCotizPresupuesto.Tag := 1;  // lo uso para que luego no pueda volver a deshabilitarlo
    fraPrestadorAprob.Value := iPrestador;
    OnPrestadorChange(nil);
    edDetalle.Text  := sMaterialCotizado;
    edImporte.Value := rCotizacion;
    LockControl(EdImporte);
  end;
end;

{ by NWK, 17/06/03 }
procedure TfrmAutAprob.DoActualizarImpresionAutorizacion(iSiniestro, iOrden, iRecaida, iNumeroAutorizacion: Integer;
                                                         Accion: TResultados = []);
var
  sSql: String;
  bEsFechaImprNula, bEsFechaMailNula, EsFechaMailAnulNula: boolean;
begin
  sSql := ' SELECT au_fechaimpresion, au_fechamail, AU_FECHAENVIOANUL ' +            // TK 21373
            ' FROM art.sau_autorizaciones ' +
           ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
             ' AND au_orden = ' + SqlValue(iOrden) +
             ' AND au_recaida = ' + SqlValue(iRecaida) +
             ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
  with GetQuery(sSql) do
  try
    bEsFechaImprNula := (FieldByName('AU_FECHAIMPRESION').IsNull);
    bEsFechaMailNula := (FieldByName('AU_FECHAMAIL').IsNull);
    EsFechaMailAnulNula := (FieldByName('AU_FECHAENVIOANUL').IsNull);
  finally
    Free;
  end;

  if sdqDatos.FieldByName('AU_ESTADO').AsString = 'U' then     //aprobación anulada
  begin                                                        //DGASTAL 21/07/2011
    if (rMail in Accion) and EsFechaMailAnulNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET AU_FECHAENVIOANUL = sysdate, AU_USUENVIOANUL = :usuario ' +
        ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
          ' AND au_orden = ' + SqlValue(iOrden) +
          ' AND au_recaida = ' + SqlValue(iRecaida) +
          ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
      EjecutarSqlEX(sSql, [Sesion.UserID]);
    end;
  end
  else
  begin
    if (rImpresora in Accion) and bEsFechaImprNula then     // TK 21373
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_fechaimpresion = trunc(sysdate) ' +
        ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
          ' AND au_orden = ' + SqlValue(iOrden) +
          ' AND au_recaida = ' + SqlValue(iRecaida) +
          ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
      EjecutarSql(sSql);
    end;

    if (rMail in Accion) and bEsFechaMailNula then     // TK 21373
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_fechamail = trunc(sysdate) ' +
        ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
          ' AND au_orden = ' + SqlValue(iOrden) +
          ' AND au_recaida = ' + SqlValue(iRecaida) +
          ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
      EjecutarSql(sSql);
    end;
  end;

end;

function TfrmAutAprob.GetCantSesiones: Integer;
var
  CantSesiones: Integer;
begin
  if fraNomencladorAprob.Descripcion = '' then   // by NWK, 27/11/03, para la cant. de sesiones tomar la parte entera por exceso
    CantSesiones := Ceil(StrToFloat(NVL(edCantidad.Text, edPrestCantidad.Text)))
  else
  begin
    if ValorSqlEx(' SELECT COUNT(*) ' +
                ' FROM svp_valorprestador ' +
                ' WHERE VP_PRESTADOR(+) = :prest AND VP_NOMENCLADOR(+) = :nom ' +
                ' AND VP_CAPITULO(+) = :cap AND VP_CODIGO(+) = :cod ' +
                ' AND VP_NOMENCLADOR = ''1'' AND VP_CAPITULO <> ''PP'' ' +
                ' AND vp_fechabaja IS NULL ', [IntToStr(fraPrestadorAprob.IDPrestador),
                                              fraNomencladorAprob.Nomenclador, fraNomencladorAprob.Capitulo,
                                              fraNomencladorAprob.Codigo]) > 0 then
      CantSesiones := Ceil(StrToFloat(edcantidad.Text) *
                      ValorSqlIntegerEx(' SELECT VP_SESIONES ' +
                                        ' FROM SVP_VALORPRESTADOR ' +
                                        ' WHERE VP_PRESTADOR(+) = :prest AND VP_NOMENCLADOR(+) = :nomen ' +
                                        ' AND VP_CAPITULO(+) = :cap and vp_codigo(+)= :cod ' +
                                        ' AND vp_fechabaja IS NULL ' +
                                        ' AND :fechapro BETWEEN VP_VIGENCIADESDE ' +
                                        '                             AND NVL(GREATEST(VP_FECHAMODIF,VP_VIGENCIAHASTA), SYSDATE) ' +
                                        ' ORDER BY VP_VIGENCIAHASTA DESC', [IntToStr(fraPrestadorAprob.IDPrestador),
                                        fraNomencladorAprob.Nomenclador, fraNomencladorAprob.Capitulo, fraNomencladorAprob.Codigo,
                                        nvl(sdqDatos.FieldByName('AU_FECHAPRO').Asstring, dbdatetime)]))
    else
      CantSesiones := Ceil(StrToFloat(edcantidad.Text) *
                      ValorSqlIntegerEx(' SELECT ON_SESIONES ' +
                                        ' FROM SON_NOMENCLADOR ' +
                                        ' WHERE ON_NOMENCLADOR(+) = :nomen  AND ON_CAPITULO(+) = :cap ' +
                                        ' AND ON_CODIGO(+) = :cod ', [fraNomencladorAprob.Nomenclador,
                                        fraNomencladorAprob.Capitulo, fraNomencladorAprob.Codigo]));
  end;
  if cantsesiones = 0 then
    cantsesiones := strtoint(edcantidad.Text);

  Result := CantSesiones;
end;

procedure TfrmAutAprob.edPrestIdentifChange(Sender: TObject);
begin
  fraPrestadorAprob.Extracondition := ' AND (CA_VISIBLE = ''S'' OR CA_IDENTIFICADOR = ' + SqlInt(fraPrestadorAut.IDPrestador, True) + ')';
end;

{by camarillo}
function TfrmAutAprob.GetGrupoTrabajo(iSiniestro, iOrden, iRecaida: Integer): String;
begin
  Result := ValorSqlEx('SELECT gp_nombre' +
                        ' FROM mgp_gtrabajo, sex_expedientes' +
                       ' WHERE ex_gtrabajo = gp_codigo' +
                         ' AND ex_siniestro = :Siniestro' +
                         ' AND ex_orden = :Orden' +
                         ' AND ex_recaida = :Recaida', [iSiniestro, iOrden, iRecaida]);
end;

{by camarillo}
function TfrmAutAprob.GetDelegacion(iSiniestro, iOrden, iRecaida: Integer): String;
begin
  Result := ValorSqlEx('SELECT lg_nombre' +
                        ' FROM dlg_delegaciones, sex_expedientes' +
                       ' WHERE ex_delegacion = lg_codigo' +
                         ' AND ex_siniestro = :Siniestro' +
                         ' AND ex_orden = :Orden' +
                         ' AND ex_recaida = :Recaida', [iSiniestro, iOrden, iRecaida]);
end;

procedure TfrmAutAprob.btnAceptarFechaClick(Sender: TObject);
begin
  Verificar(dcFechaAlquiler.IsEmpty, dcFechaAlquiler, 'Debe ingresar una fecha de vencimiento.');
  fpVencimiento.ModalResult := mrOk;
end;

procedure TfrmAutAprob.btnStockOrtopediaClick(Sender: TObject);
var
  sdqStock: TSDQuery;
  sSql: String;
begin
  sSql := 'SELECT so_id, so_descripcion, so_observaciones, ' +
                ' DECODE(so_origen, ''R'', ''Recupero'', ''C'', ''Compra'') origen' +
           ' FROM amed.mso_stock_ortopedia' +
          ' WHERE so_fechabaja IS NULL' +
            ' AND so_estado = ''A''';
  sdqStock := GetQuery(sSql);
  with sdqStock do
  try
    lvStockOrto.Items.BeginUpdate;
    lvStockOrto.Items.Clear;
    while not Eof do
    begin
      with lvStockOrto.Items.Add do
      begin
        Caption := sdqStock.FieldByName('SO_ID').AsString;
        SubItems.Add(sdqStock.FieldByName('SO_DESCRIPCION').AsString);
        SubItems.Add(sdqStock.FieldByName('ORIGEN').AsString);
        SubItems.Add(sdqStock.FieldByName('SO_OBSERVACIONES').AsString);
      end;
      Next;
    end;
    lvStockOrto.Items.EndUpdate;
  finally
    sdqStock.Free;
  end;

  if (fpStockOrto.ShowModal = mrOk) then
  begin
    fraPrestadorAprob.Value := 18144;
    OnPrestadorChange(nil);
    edDetalle.Text := vMatStock;
    edImporte.Clear;
    LockControl(EdImporte);
    HabilitacionControles;
  end;
end;

procedure TfrmAutAprob.btnAceptarOrtoClick(Sender: TObject);
begin
  Verificar(not(CantSelStock), lvStockOrto, 'Debe seleccionar un material.');
  fpStockOrto.ModalResult := mrOk;
end;

function TfrmAutAprob.CantSelStock :Boolean;
var
  i: Integer;
  iCant: Integer;
begin
  iCant := 0;
  for i := 0 to lvStockOrto.Items.Count - 1 do
    if lvStockOrto.Items.Item[i].Checked then
    begin
      Inc(iCant);
      vIdStock  := StrToInt(lvStockOrto.Items[i].Caption);
      vMatStock := lvStockOrto.Items[i].SubItems[0];
    end;

  if (iCant = 1) then
    Result := True
  else
  begin
    vIdStock := 0;
    Result   := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TfrmAutAprob.ValidarTurnoExistente :Boolean;
var
  //hora, min: integer;
  sSql, sTiene: String;
begin

  sTiene := ValorSqlEx('SELECT siniestro.get_turnofecha(:Sini, :Ord, :Reca, :Numaut, ' + SqlDate(edFechaTurno.Date) + ')' +
                        ' FROM dual', [vSiniestro, vOrden, vRecaida, NumAuto]);

  if (sTiene = 'A') then
    sSql :=
      'SELECT au_numauto numauto, au_turnohora hora, nvl(au_presapro, au_pressol) prestacion,' +
            ' ''('' || p.ca_identificador || '') - '' || p.ca_descripcion prestador,' +
            ' decode(d.ca_identificador, Null, Null, ''('' || d.ca_identificador || '') - '' || d.ca_descripcion) destino' +
       ' FROM sau_autorizaciones, cpr_prestador p, cpr_prestador d' +
      ' WHERE au_idexpediente = siniestro.get_idexpediente(:Sini, :Orden, :Reca)' +
        ' AND au_numauto <> :NumAuto' +
        ' AND au_estado NOT IN (''N'', ''R'', ''D'', ''U'', ''V'')' +
        ' AND au_identifprestador = p.ca_identificador' +
        ' AND au_presthasta = d.ca_identificador(+)' +
        ' AND au_turno = ' + SqlDate(edFechaTurno.Date)
  else if (sTiene = 'T') then
    sSql :=
      'SELECT tr_numauto numauto, tr_hora hora, nvl(au_presapro, au_pressol) prestacion,' +
            ' ''('' || p.ca_identificador || '') - '' || p.ca_descripcion prestador,' +
            ' decode(d.ca_identificador, Null, Null, ''('' || d.ca_identificador || '') - '' || d.ca_descripcion) destino' +
       ' FROM sau_autorizaciones, cpr_prestador p, cpr_prestador d, str_traslados' +
      ' WHERE au_idexpediente = siniestro.get_idexpediente(:Sini, :Orden, :Reca)' +
        ' AND au_numauto <> :NumAuto' +
        ' AND au_estado NOT IN (''N'', ''R'', ''D'', ''U'', ''V'')' +
        ' AND au_identifprestador = p.ca_identificador' +
        ' AND au_presthasta = d.ca_identificador(+)' +
        ' AND au_id = tr_idauto' +
        ' AND tr_fecha = ' + SqlDate(edFechaTurno.Date) +
        ' AND tr_fechabaja IS NULL' +
        ' AND tr_fechaanulacion IS NULL'
  else
  begin
    Result := True;
    Exit;
  end;

  with GetQueryEx(sSql, [vSiniestro, vOrden, vRecaida, NumAuto]) do
  try
    if not IsEmpty then
    begin
      edNroAutTurno.Text  := FieldByName('NUMAUTO').AsString;
      edPresTurno.Text    := FieldByName('PRESTADOR').AsString;
      edHoraTur.Text      := FieldByName('HORA').AsString;
      edDestinoTurno.Text := FieldByName('DESTINO').AsString;
      fraPrestacionTurno.Cargar(FieldByName('PRESTACION').AsString);
      Result := (fpTurnoExistente.ShowModal = MrOk);
    end
    else
      Result := True;
  finally
    Free;
  end;

end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.edFechaTurnoChange(Sender: TObject);
begin
  edFechaTurno.Modified := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.btnVerTurnosClick(Sender: TObject);
begin
  TurnosAprobar(tcConsulta);
end;
{-------------------------------------------------------------------------------}
function TfrmAutAprob.TurnosAprobar(TCarga :TTipoCarga) :TModalResult;
begin
  with TfrmAutTurnos.Create(Self) do
  try
    TipoCarga         := TCarga;
    IdExpediente      := Get_IdExpediente(vSiniestro, vOrden, vRecaida);
    IdAutorizacion    := IdAuto;
    ICantSesiones     := GetCantSesiones;
    sEstado           := Self.sdqDatos.FieldByName('au_estado').AsString;
    edPrestador.Text  := IntToStr(Self.fraPrestadorAprob.IDPrestador) + ' - ' +
                         Self.fraPrestadorAprob.RazonSocial;
    fraPrestacion.Cargar(Self.fraPrestacionAut.edCodigo.Text);
    ShowModal;
    Result := ModalResult;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.DoCambioPrestador;
var
  iPrestadorAnt :Integer;
begin
   iPrestadorAnt                  := fraNomencladorAprob.Prestador;
   fraNomencladorAprob.Prestador  := fraPrestadorAprob.Value;
   edNomFantaAprob.Text           := fraPrestadorAprob.NombreFantasia + ' (' + sdqDatos.FieldByName('tp_descripcion').AsString + ')';
   lbPrestacion.Font.Color        := IIF(fraNomencladorAprob.ExigePrestacion, clRed, clWindowText);
   DoCargarPrestadorSugerido;
// EJV (15/08/2002) Cuando el Valor ya esta calculado no se puede tocar.
   if iPrestadorAnt <> fraNomencladorAprob.Prestador then
   begin
     fraNomencladorAprob.Limpiar;
     fraNomencladorAprob.OnChange(Nil);
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.CopiarTurnos(IdAutoOrig, NumAutoDeriv: Integer; EnTransaccion: Boolean);
var
  IdAutoDeriv :Integer;
  sql: String;
begin
  SdqRecorreTurnos.Close;
  SdqRecorreTurnos.ParamByName('idautoorig').AsInteger := IdAutoOrig;
  SdqRecorreTurnos.Open;
  SdqRecorreTurnos.First;

  IdAutoDeriv := ValorSqlInteger('SELECT au_id FROM sau_autorizaciones ' +
                                 ' WHERE au_siniestro = ' + SqlInt(vSiniestro) +
                                   ' AND au_orden = ' + SqlInt(vOrden) +
                                   ' AND au_recaida = ' + SqlInt(vRecaida) +
                                   ' AND au_numauto = ' + SqlInt(NumAutoDeriv));

  while not SdqRecorreTurnos.Eof do
  begin
    sql := 'INSERT INTO sin.stp_turnosprestaciones (' +
           ' tp_idautorizacion, tp_fechaturno, tp_horaturno, tp_fechaalta, tp_usualta) VALUES (' +
           SqlInt(IdAutoDeriv) + ',' + SqlDate(sdqRecorreTurnos.FieldByName('tp_fechaturno').AsDateTime) + ',' +
           SqlValue(sdqRecorreTurnos.FieldByName('tp_horaturno').AsString) + ', Actualdate, ' +
           SqlValue(Sesion.UserID) + ')';

    if EnTransaccion then
      EjecutarSqlST(sql)
    else
      EjecutarSql(sql);
    SdqRecorreTurnos.Next;
  end;
  SdqRecorreTurnos.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.DoCargarPrestadorSugerido;
var
  sSql :String;
  IdPresPosible :Integer;
begin
  edPrestSugerido.Clear;
  sSql := 'SELECT ca_permitetransporte ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = :IdPres ';
  if (fraPrestacionAut.edCodigo.Text <> '') and
     (fraPrestacionAut.sdqDatosPR_REQUIERETURNOS.AsString = 'S') and
     (sdqDatos.FieldByName('au_estado').AsString = 'P') and
     (ValorSqlEx(sSql, [fraPrestadorAprob.IDPrestador]) = 'S') then
  begin
    IdPresPosible := ValorSqlIntegerEx('SELECT art.siniestro.get_prestadorposible(:IdTrab) ' +
                                        ' FROM dual', [sdqDatos.FieldByName('tj_id').AsInteger]);
    if (IdPresPosible <> fraPrestadorAprob.IDPrestador) then
      edPrestSugerido.Text := ValorSqlEx('SELECT ca_identificador || '' - '' || ca_descripcion ' +
                                          ' FROM cpr_prestador ' +
                                         ' WHERE ca_identificador = :IdPres', [IdPresPosible]);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmAutAprob.FechaAutMayoralAlta: boolean;  // WF 8206
var
  FecAltaMedica: TDateTime;
begin
  FecAltaMedica := sdqDatos.FieldByName('EX_ALTAMEDICA').AsDateTime;
  if (FecAltaMedica > 0) then
    Result := (DBDate > FecAltaMedica)
  else
    Result := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.DoBloquearValor;
begin
// EJV (15/08/2002) Cuando el Valor ya esta calculado no se puede tocar.
  if ((edImporte.Value > 0) and (fraNomencladorAprob.Nomenclador <> '')) or
      (btnCotizPresupuesto.Tag = 1) then { by NWK, 28/03/03, el valor de la cotización de ortopedia no se puede cambiar }
  begin
    edImporte.Enabled  := Seguridad.Activar(edImporte);
    edImporte.ReadOnly := not Seguridad.Activar(edImporte);
    edImporte.Color    := IIF(edImporte.Enabled, clWindow, clInactiveCaption);
  end
  else begin
    edImporte.Enabled  := True;
    edImporte.ReadOnly := False;
    edImporte.Color    := clWindow;
  end;
// EJV (Fin)
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.SetValor;
var
  sSql :String;
  i :Integer;
  dValor :Double;
begin
  if edImporte.ReadOnly then
    Exit;

  dValor := 0;
  if (lvRelaciones.Items.Count > 0) then
    for i := 0 to lvRelaciones.Items.Count -1 do
    begin
      sSql := 'SELECT NVL(art.amebpba.get_val_prestacion(' + SqlValue(fraPrestadorAprob.IDPrestador) + ',' +
                                                             SqlValue(lvRelaciones.Items[i].SubItems.Strings[0]) + ',' +
                                                             SqlValue(lvRelaciones.Items[i].SubItems.Strings[1]) + ',' +
                                                             SqlValue(lvRelaciones.Items[i].SubItems.Strings[2]) + ',' +
                                                             SqlInt(vSiniestro) + ',' + SqlInt(vOrden) + ',' +
                                                             SqlInt(vRecaida) + ', ART.ACTUALDATE, ' +
                                                             SqlInt(IdAuto) + ', NULL, ' +
                                                             SqlNumber((edKilometraje.Value * PORC_DESVIO_GIS) + edKilometrajeExcedente.Value, True) + '), 0) FROM dual '; 
      dValor := dValor + (ValorSql(sSql) * IIF(edCantidad.Value > 0, edCantidad.Value, 1));
    end;

  if (fraNomencladorAprob.IdNomenclador > 0) then
  begin
    sSql := 'SELECT NVL(art.amebpba.get_val_prestacion(' + SqlValue(fraPrestadorAprob.IDPrestador) + ',' +
                                                           SqlValue(fraNomencladorAprob.Nomenclador) + ',' +
                                                           SqlValue(fraNomencladorAprob.Capitulo) + ',' +
                                                           SqlValue(fraNomencladorAprob.Codigo) + ',' +
                                                           SqlInt(vSiniestro) + ',' + SqlInt(vOrden) + ',' +
                                                           SqlInt(vRecaida) + ',' + SqlDate(sdqDatos.FieldByName('au_fechasoli').AsDateTime) + ',' +
                                                           SqlInt(IdAuto) + ', NULL, ' +
                                                           SqlNumber((edKilometraje.Value * PORC_DESVIO_GIS) + edKilometrajeExcedente.Value, True) + '), 0) FROM dual ';
    dValor := dValor + (ValorSql(sSql) * IIF(edCantidad.Value > 0, edCantidad.Value, 1));
  end;
  edImporte.Value := dValor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.DoInsertarPrestaciones;
var
  sSql :String;
  i :Integer;
begin
  if not(btnAgregarSubPr.Enabled) and (lvRelaciones.Items.Count > 0) then
  begin
    for i := 0 to lvRelaciones.Items.Count -1 do
    begin
      sSql := 'SELECT 1 FROM art.ppa_prestacionesxautorizacion ' +
              ' WHERE pa_idnomenclador = ' + SqlInt(StrToInt(lvRelaciones.Items[i].Caption)) +
                ' AND pa_idautorizacion = ' + SqlInt(IdAuto) +
                ' AND pa_automatico = ''N'' ';
      if ExisteSql(sSql) then
        sSql := 'UPDATE art.ppa_prestacionesxautorizacion ' +
                  ' SET pa_fechabaja = ActualDate, ' +
                      ' pa_usubaja = ' + SqlValue(Sesion.UserID) +
                ' WHERE pa_idnomenclador = ' + SqlInt(StrToInt(lvRelaciones.Items[i].Caption)) +
                  ' AND pa_idautorizacion = ' + SqlInt(IdAuto) +
                  ' AND pa_automatico = ''N'' '
      else
        sSql := 'INSERT INTO art.ppa_prestacionesxautorizacion ' +
                '(pa_idautorizacion, pa_idnomenclador, pa_automatico, pa_fechaalta, pa_usualta) VALUES (' +
                 SqlInt(IdAuto) + ',' + SqlInt(StrToInt(lvRelaciones.Items[i].Caption)) + ',' +
                ' ''S'', ActualDate, ' + SqlValue(Sesion.UserID) + ')';

      EjecutarSqlST(sSql);
    end;
  end;
  if (lvRelaciones.Items.Count > 0) then
  begin
    sSql := 'INSERT INTO art.ppa_prestacionesxautorizacion ' +
            '(pa_idautorizacion, pa_idnomenclador, pa_automatico, pa_principal, ' +
            ' pa_fechaalta, pa_usualta) VALUES (' +
             SqlInt(IdAuto) + ',' + SqlInt(fraNomencladorAprob.IdNomenclador) + ',' +
            ' ''S'', ''S'', ActualDate, ' + SqlValue(Sesion.UserID) + ')';
    EjecutarSqlST(sSql);
  end;
end;
{-------------------------------------------------------------------------------}
{function TfrmAutAprob.GetRelaciones :String;
var
  sSql, sTmp :String;
begin
  sTmp := '';
  sSql := 'SELECT on_capitulo, on_codigo, on_descripcion ' +
           ' FROM art.son_nomenclador, art.ppa_prestacionesxautorizacion ' +
          ' WHERE on_id = pa_idnomenclador ' +
            ' AND pa_fechabaja IS NULL ' +
            ' AND on_fechabaja IS NULL ' +
            ' AND pa_principal = ''N'' ' + 
            ' AND pa_idautorizacion = :IdAut ';
  with GetQueryEx(sSql, [IdAuto]) do
  try
    while not Eof do
    begin
      sTmp := sTmp + FieldByName('on_capitulo').AsString + ' ' +
                     FieldByName('on_codigo').AsString + ' ' +
                     FieldByName('on_descripcion').AsString + CRLF;
      Next;
    end;
  finally
    Free;
  end;
  Result := sTmp;
end;}
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.DoCargarRelaciones;
var
  sSql :String;
  i :Integer;
begin
  lvRelaciones.Items.BeginUpdate;
  lvRelaciones.Items.Clear;
   if btnAgregarSubPr.Enabled then
   begin
     for i := 0 to lvRelaciones.Items.Count - 1 do
       if StrToInt(lvRelaciones.Items[i].Caption) = fraNomencladorAprob.IdNomenclador then
       begin
         fraNomencladorAprob.Limpiar;
         Verificar(True, fraNomencladorAprob, 'La prestación ya ha sido agregada');
       end;
     sSql := 'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion ' +
              ' FROM son_nomenclador, art.ppa_prestacionesxautorizacion ' +
             ' WHERE on_id = pa_idnomenclador ' +
               ' AND pa_fechabaja IS NULL ' +
               ' AND pa_principal = ''N'' ' +
               ' AND pa_idautorizacion = ' + SqlInt(IdAuto) +
               ' AND pa_idnomenclador <> ' + SqlInt(fraNomencladorAprob.IdNomenclador) +
               ' AND pa_automatico = ''N'' ';
  end
  else
    sSql := 'SELECT on_id, on_nomenclador, on_capitulo, on_codigo, on_descripcion ' +
             ' FROM son_nomenclador, SIN.sgp_gruposprestaciones, SIN.spg_prestacionesxgrupo a ' +
            ' WHERE gp_id = a.pg_idgrupo ' +
              ' AND on_id = a.pg_idnomenclador ' +
              ' AND a.pg_fechabaja IS NULL ' +
              ' AND gp_fechabaja IS NULL ' +
              ' AND art.amebpba.get_admitesubprestaciones(' + SqlInt(fraNomencladorAprob.Prestador) + ' ) = ''S'' ' +
              ' AND pg_fechaalta <= ' + SqlDate(sdqDatos.FieldByName('au_fechaalta').AsDateTime) +
              ' AND a.pg_idgrupo IN(SELECT b.pg_idgrupo ' +
                                    ' FROM SIN.spg_prestacionesxgrupo b ' +
                                   ' WHERE b.pg_idgrupo = a.pg_idgrupo ' +
                                     ' AND b.pg_idnomenclador <> a.pg_idnomenclador ' +
                                     ' AND b.pg_fechabaja IS NULL ' +
                                     ' AND b.pg_idnomenclador = ' + SqlInt(fraNomencladorAprob.IdNomenclador) + ')';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      with lvRelaciones.Items.Add do
      begin
        Caption := FieldByName('on_id').AsString;
        SubItems.Add(FieldByName('on_nomenclador').AsString);
        SubItems.Add(FieldByName('on_capitulo').AsString);
        SubItems.Add(FieldByName('on_codigo').AsString);
        SubItems.Add(FieldByName('on_descripcion').AsString);
      end;
      Next;
    end;
  finally
    Free;
  end;
  lvRelaciones.Items.EndUpdate;
  SetValor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.DoHabilitarMultiples;
begin
  btnAgregarSubPr.Enabled    := not(IsEmptyString(fraPrestacionAut.edCodigo.Text)) and
                                (fraPrestacionAut.sdqDatosPR_MULTIPLESPRESTACIONES.AsString = 'S');
  btnQuitarSubPr.Enabled     := not(IsEmptyString(fraPrestacionAut.edCodigo.Text)) and
                                (fraPrestacionAut.sdqDatosPR_MULTIPLESPRESTACIONES.AsString = 'S');
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.lvRelacionesResize(Sender: TObject);
begin
  lvRelaciones.Columns.Items[0].Width := 0;
  lvRelaciones.Columns.Items[4].Width := lvRelaciones.Width - 150;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.btnAgregarSubPrClick(Sender: TObject);
var
  sSql :String;
begin
  if fpAgregarRel.ShowModal = mrOk then
  begin
    sSql := 'INSERT INTO art.ppa_prestacionesxautorizacion ' +
            '(pa_idautorizacion, pa_idnomenclador, pa_automatico, pa_fechaalta, pa_usualta) VALUES (' +
             SqlInt(IdAuto) + ',' + SqlInt(fraNomencladorRel.IdNomenclador) + ',' +
            ' ''N'', ActualDate, ' + SqlValue(Sesion.UserID) + ')';
    EjecutarSql(sSql);
    DoCargarRelaciones;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.btnQuitarSubPrClick(Sender: TObject);
var
  sSql :String;
begin
  if (lvRelaciones.SelCount > 0) then
  begin
    sSql := 'UPDATE art.ppa_prestacionesxautorizacion ' +
              ' SET pa_fechabaja = ActualDate, ' +
                  ' pa_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE pa_idnomenclador = ' + SqlInt(StrToInt(lvRelaciones.Selected.Caption)) +
              ' AND pa_idautorizacion = ' + SqlInt(IdAuto);
    EjecutarSql(sSql);
    DoCargarRelaciones;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.btnAceptarRelClick(Sender: TObject);
var
  i :Integer;
begin
  Verificar(not fraNomencladorRel.IsSelected, fraNomencladorRel, 'Debe seleccionar la prestación.');
  Verificar(fraNomencladorAprob.IdNomenclador = fraNomencladorRel.IdNomenclador, fraNomencladorRel,
            'La prestación ya pertenece a la autorización.');
  for i := 0 to lvRelaciones.Items.Count - 1 do
    if StrToInt(lvRelaciones.Items[i].Caption) = fraNomencladorRel.IdNomenclador then
      Verificar(True, fraNomencladorRel, 'La prestación ya ha sido agregada');
  fpAgregarRel.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutAprob.fpAgregarRelBeforeShow(Sender: TObject);
begin
  //copio todas las propiedades del otro fraNomenclador
  fraNomencladorRel.Prestador       := fraNomencladorAprob.Prestador;
  fraNomencladorRel.ShowVigencias   := fraNomencladorAprob.ShowVigencias;
  fraNomencladorRel.Siniestro       := fraNomencladorAprob.Siniestro;
  fraNomencladorRel.FechaSolicitud  := fraNomencladorAprob.FechaSolicitud;
  fraNomencladorRel.ShowPresup      := fraNomencladorAprob.ShowPresup;
  fraNomencladorRel.ShowConsumidos  := fraNomencladorAprob.ShowConsumidos;
  fraNomencladorRel.ExigePrestacion := fraNomencladorAprob.ExigePrestacion;
  fraNomencladorRel.Limpiar;
end;
{-------------------------------------------------------------------------------}
function TfrmAutAprob.ValidarReqTrasladoAut: Boolean;    // Lu TK 6220
var
  bAmerita, bExcepcion: Boolean;
  sSql: String;
begin
  if (fraPrestacionAut.edCodigo.Text = '449100') then  //traslados en remis
  begin
    sSql       := 'SELECT NVL(ex_ameritaremis, ''S'') ' +
                   ' FROM sex_expedientes ' +
                  ' WHERE ex_id = :IdExped ';
    bAmerita   := (ValorSqlEx(sSql, [Get_IdExpediente(vSiniestro, vOrden, vRecaida)]) = 'S');
    bExcepcion := IIF(bAmerita, True, Get_AmeritaRemis(fraPrestadorAprob.IDPrestador, fraNomencladorAprob.IdNomenclador) and
                                                       Seguridad.Claves.IsActive('AutorizaExcepcion'));
    Result     := bAmerita or bExcepcion or
                 (not(bAmerita) and Seguridad.Claves.IsActive('AutorizaTrasladoRemis') and
                  MsgAsk('Atención: está a punto de aprobar un traslado en remis para un siniestro ' + chr(13) +
                         'que no lo amerita segun la Auditoría de Provincia ART, ¿Desea continuar?'));
  end
  else Result := True;
end;
{-------------------------------------------------------------------------------}
{si el auditor tiene firmante asociado al area correspondiente, trae ése,
 sino se muestra la pantalla de firmantes para que lo seleccionen}
{-------------------------------------------------------------------------------}
function TfrmAutAprob.GetFirmanteAuditor(sArea: String): Integer;
var
  iFirm: Integer;
  sSql, sUsu: String;
begin
  iFirm := 0;
  sUsu  := ValorSqlEx('SELECT au_usuauditoria ' +
                       ' FROM sau_autorizaciones ' +
                      ' WHERE au_id = :IdAut', [IdAuto]);
  if (sUsu <> '') then
  begin
    sSql  := 'SELECT fi_id ' +
              ' FROM cfa_firmantearea, cat_areatexto, cfi_firma ' +
             ' WHERE fa_idareatexto = at_id ' +
               ' AND fi_id = fa_idfirmante ' +
               ' AND at_area = :area ' +
               ' AND fi_codusuario = :usu ' +
               ' AND fi_fechabaja IS NULL ' +
               ' AND fa_fechabaja IS NULL ' +
               ' AND at_fechabaja IS NULL';
    iFirm := ValorSqlIntegerEx(sSql, [sArea, sUsu]);
  end;
  Result := iFirm;
end;

procedure TfrmAutAprob.DoHabilitarBotones;
var
  bReqAuditoria, bHabilitarOrtop, bHayPresupAdju :Boolean;
  sEstado, sFormu :String;
begin
  sEstado                     := sdqDatos.FieldByName('au_estado').AsString;
  sFormu                      := fraPrestacionAut.sdqDatosPR_FORMULARIO.AsString;
  btnPedInfo.Enabled          := Seguridad.Activar(btnPedInfo) and AreIn(sEstado, ['P','T']);
  btnVerTraslado.Enabled      := Seguridad.Activar(btnVerTraslado) and (sFormu = 'T');
  btnVerTurnos.Enabled        := Seguridad.Activar(btnVerTurnos) and
                                (fraPrestacionAut.sdqDatosPR_REQUIERETURNOS.AsString = 'S');
  bHayPresupAdju              := IsPresupuestos and GetExistePresupuestoAuditado(vSiniestro, vOrden, vRecaida, NumAuto);
  bHabilitarOrtop             := Seguridad.Activar(btnCotizPresupuesto) and (sEstado = 'P');
  btnCotizPresupuesto.Enabled := bHabilitarOrtop and bHayPresupAdju;
  btnStockOrtopedia.Enabled   := bHabilitarOrtop and IsOrtopedia;

  bReqAuditoria := ValorSqlEx('SELECT art.siniestro.get_autorizacionexigeaudit(:IdAut, :CodPres, :Sector) ' +
                               ' FROM dual', [IdAuto, fraPrestacionAut.edCodigo.Text, Sesion.Sector]) = 'S';

  btnAprobar.Enabled     := Seguridad.Activar(btnAprobar)  and AreIn(sEstado, ['P','T']) and not(bReqAuditoria)
                            and Valida_SML_AprobRech and esUsuarioRecaAutoReca(IdAuto);         // Plan - SML
  btnRechazar.Enabled    := Seguridad.Activar(btnRechazar) and AreIn(sEstado, ['P','T']) and not(bReqAuditoria)
                            and Valida_SML_AprobRech and esUsuarioRecaAutoReca(IdAuto);        // Plan - SML

  if not(sdqDatos.FieldByName('au_fechaauditoria').IsNull) and
     (((sFormu = 'T') and bReqAuditoria) or
      (sFormu <> 'T') or (sFormu <> 'I')) then
  begin
    btnAprobar.Enabled  := btnAprobar.Enabled and  (sdqDatos.FieldByName('au_accionauditoria').AsString = 'A');
    btnRechazar.Enabled := btnRechazar.Enabled and (sdqDatos.FieldByName('au_accionauditoria').AsString = 'R');
  end;

  if btnAprobar.Enabled and IsPresupuestos then
    btnAprobar.Enabled := bHayPresupAdju or (vIdStock > 0);
end;

procedure TfrmAutAprob.fraPrestacionAutExit(Sender: TObject);
begin
  fraPrestacionAut.FrameExit(Sender);
  OnPrestacionChange(Sender);
end;

procedure TfrmAutAprob.VerificarGastosyHonorarios;
var
  sSql, gastos, honorarios: string;
begin
  sSql        := 'SELECT vp_valorgastos ' +
                   'FROM art.svp_valorprestador ' +
                  'WHERE vp_prestador = :prest ' +
                    'AND vp_idnomenclador = :nomen ' +
                    'AND vp_vigenciahasta IS NULL ' +
                    'AND vp_fechabaja IS NULL ';
  gastos      := ValorSqlEx(sSql, [fraPrestadorAprob.IDPrestador,
                                   fraNomencladorAprob.IdNomenclador]);
  sSql        := 'SELECT vp_valorhonorarios ' +
                   'FROM art.svp_valorprestador ' +
                  'WHERE vp_prestador = :prest ' +
                    'AND vp_idnomenclador = :nomen ' +
                    'AND vp_vigenciahasta IS NULL ' +
                    'AND vp_fechabaja IS NULL ';
  honorarios  := ValorSqlEx(sSql, [fraPrestadorAprob.IDPrestador,
                                   fraNomencladorAprob.IdNomenclador]);

  if (gastos <> '') and (honorarios = '') then
    msgbox('Atención: recuerde que esta autorizando sólo GASTOS para la prestación seleccionada',
            MB_ICONINFORMATION, 'Información');
  if (gastos = '') and (honorarios <> '') then
    msgbox('Atención: recuerde que esta autorizando sólo HONORARIOS para la prestación seleccionada',
            MB_ICONINFORMATION, 'Información');
end;

procedure TfrmAutAprob.SetPrestadorNomen;
begin
  fraNomencladorAprob.Siniestro := SinEdit.Siniestro(vSiniestro, vOrden, vRecaida);
  with fraNomencladorAprob do
  begin
    Prestador      := fraPrestadorAprob.Value;
    OcultarValorNulo := True;
    //no filtro por fecha de vigencia si la autorizacion no está pendiente
    ShowVigencias  := not(Self.sdqDatos.FieldByName('au_estado').AsString = 'P');
    FechaSolicitud := Self.sdqDatos.FieldByName('au_fechasoli').AsDateTime; // DBDate;
    Vigencia       := Self.sdqDatos.FieldByName('au_fechasoli').AsDateTime; // DBDate;
    Prestador      := fraPrestadorAprob.Value;
    OnChange(Nil);
    lbPrestacion.Font.Color := IIF(ExigePrestacion, clRed, clWindowText);
  end;
end;


// Cuando se Deriva una autorizacion automatica generada por Recalificación, debe guardarse en la tabla de
// Reca el Nro de Autorizacion aprobada y no la Derivada, por eso esta este update
procedure TfrmAutAprob.Do_UpdateAutorizReca_PorDerivacion(iNumAutoDeriv, iNumAutoAprob: Integer);
var
  sSql: String;
begin
  // Me fijo si existe un evento en Reca que sea del codigo de Genera Autorizacion y con el Número de autorizacion de la derivada
  sSql := 'UPDATE art.ser_evemedrecalif ' +
            ' SET er_autorizacion = :autAprob ' +
          ' WHERE er_siniestro = :sini ' +
            ' AND er_orden = :orden ' +
            ' AND er_autorizacion = :autDeriv ' +
            ' AND er_codigo in (SELECT em_codigo ' +
                                ' FROM sin.sem_eventomedicoreca ' +
                               ' WHERE em_generaautorizacion = ''S'') ';
  EjecutarSqlSTEx(sSql, [iNumAutoAprob, vSiniestro, vOrden, iNumAutoDeriv]);
end;

procedure TfrmAutAprob.meEsperaExit(Sender: TObject);
var
  horas, minutos: integer; cantidad: Real;
begin
  if meEspera.Text <> '  :  ' then
  begin
    meEspera.Text := StringReplace(meEspera.Text, ' ', '0', [rfReplaceAll]);
    horas := StrToInt(LeftStr(meEspera.Text, 2));
    minutos := StrToInt(RightStr(meEspera.text, 2));
    cantidad := horas + minutos / 60;
    edCantidad.Text := FloatToStr(cantidad);
  end
  else
    edCantidad.text := '1';
  edCantidadExit(nil);
end;

function TfrmAutAprob.Valida_SML_AprobRech: Boolean;    // Plan - SML
var
  bEsTraslado, pPermisoAprobRechTrasladosSML, pPermisoAprobRechSML: Boolean;
begin
  Result := True;

  bEsTraslado     := (ValorSqlEx('SELECT pr_formulario FROM art.mpr_prestaciones WHERE pr_codigo = :CodPrest', [sdqDatos.fieldbyname('AU_PRESSOL').AsString]) = 'T');
  pPermisoAprobRechTrasladosSML := Seguridad.Claves.IsActive('AprobRechTrasladosSML');
  pPermisoAprobRechSML          := Seguridad.Claves.IsActive('AprobRechSML'); // TK 37842

  if Is_SiniestroSML(Get_IdExpediente(vSiniestro, vOrden, vRecaida))
     and not Is_UsuarioSML(Sesion.UserID)
     and not Es_UsuarioSupervisor(Sesion.UserID) then
  begin                                                                                                      // TK 37842
    if not (Es_TipoPrestacionPermitida_AprobRech or (bEsTraslado and pPermisoAprobRechTrasladosSML) or pPermisoAprobRechSML or esSiniestroMixto(vSiniestro, vOrden, vRecaida)) then
      Result := False;
  end;
end;

function TfrmAutAprob.Es_TipoPrestacionPermitida_AprobRech: Boolean;   // Plan - SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_tipoprestacionnosml(:tipoprest,''A'') FROM dual',
             [sdqDatos.fieldbyname('AU_PRESSOL').AsString]) = 'S');
end;

procedure TfrmAutAprob.Do_EnviarMailAvisoEvolutivos;    // TK 43444
var
  sSqlNom, sSqlMau: String;
begin
  sSqlNom := 'SELECT on_avisoevolutivos, on_id ' +
               'FROM art.son_nomenclador ' +
             ' WHERE on_nomenclador = :nom ' +
               ' AND on_capitulo = :capitulo ' +
               ' AND on_codigo = :codigo ';

  with GetQueryEx(sSqlNom, [fraNomencladorAprob.Nomenclador, fraNomencladorAprob.Capitulo, fraNomencladorAprob.Codigo]) do
  try
    if (FieldByName('ON_AVISOEVOLUTIVOS').AsString = 'S') and (FieldByName('ON_ID').AsInteger = fraNomencladorAprob.IdNomenclador) then // si el auditor tiene la marca y es el nomenclador que esta aprobando
    begin
      sSqlMau := 'SELECT au_consultorio ' +
                   'FROM art.mau_auditores ' +
                 ' WHERE au_prestador = :pres_apro';
      if (ValorSqlEx(sSqlMau, [fraPrestadorAprob.IDPrestador]) = 'S') then   // tiene la marca en auditores tambien
      begin
        // TK 59791:
        // Si todo esta en condiciones, entonces muestra la pantalla de impresion y envio de partes, para que ellos determinen qué quieren hacer:
        with TdlgImpParteEvolutivo.Create(Self) do
        try
          ISiniestro := vSiniestro;
          IOrden     := vOrden;
          IRecaida   := vRecaida;

          MailPrestadorDerivado  := fraPrestadorAprob.CorreoElectronico;
          BConTransaccionMail    := False;

          rgImprimir.itemindex   := 0;
          rgImprimir.Enabled     := False;

          opTodos.Checked        := True;
          opDesde.Enabled        := False;
          opSeleccionado.Enabled := False;
          edDesde.Enabled        := False;
          edHasta.Enabled        := False;

         // Orden := SortDialog.OrderBy;
          ShowModal;
        finally
          Free;
        end;


       { memoDirecciones.Lines.Add(fraPrestadorAprob.CorreoElectronico);
        if (fpCartelEnvio.ShowModal = mrOk) then
          fpCartelEnvio.Free;  }      // Esto es lo viejo


      end;
    end;
  finally
    Free;
  end;   
end;

procedure TfrmAutAprob.Label25Click(Sender: TObject);
begin
  InfoHint(edKilometraje, edKilometraje.Hint);
end;

procedure TfrmAutAprob.Label26Click(Sender: TObject);
begin
  InfoHint(edKilometrajeExcedente, edKilometrajeExcedente.Hint);
end;

function TfrmAutAprob.NoSePuedeModificarObservaciones: boolean;        // TK 57576
var sSql:string;
begin
  sSql := 'SELECT ca_prohibeborrarobs_aut FROM ART.CPR_PRESTADOR ' +
          ' WHERE ca_identificador = :idprest ';

  Result := (ValorSqlEx(sSql, [fraPrestadorAprob.IDPrestador]) = 'S') and (sdqDatos.FieldByName('AU_ESTADO').AsString = 'A');  // No se podra modificar las observaciones si es uno de los id de prestador nombrados y si la autorizacion esta aprobada.
end;

end.
