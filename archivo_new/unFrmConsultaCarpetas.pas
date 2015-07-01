{-----------------------------------------------------------------------------
 Unit Name: unFrmConsultaCarpetas
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Interfaz para la consulta del estado de todas las carpetas de la
            compañia, pudiendo además consultar si están solicitadas, solicitarlas
            enviar las solicitudes.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unFrmConsultaCarpetas;
 
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, Menus, StdCtrls, unfraSectores, unQrEtiquetasCarpetas,
  unFraCodigoDescripcion, unFraUsuario, Mask, ToolEdit, DateComboBox,
  JvExComCtrls, JvComCtrls, GroupCheckBox, PatternEdit, IntEdit,
  unFraFiltroArchivo, FormPanel, DataExport, DataToXLS, Internet, unsesion,
  ComboEditor, DBComboGrid, unArtDBAwareFrame, Buttons, Provider, DBClient,
  unArt, unFraTrabajador, unFraTrabajadorSiniestro, unArtDbFrame,
  unFraEmpresa, PeriodoPicker, unFraEstablecimiento, CardinalEdit, ImgList,
  CheckCombo, DBCheckCombo, RxToolEdit, RxPlacemnt;
                 
type
  TFrmConsultaCarpetas = class(TfrmCustomConsulta)
    pmnuImpresion: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    pmnuGrilla: TPopupMenu;
    mnuSelectAll: TMenuItem;
    mnuUnselectAll: TMenuItem;
    mnuToggleSelection: TMenuItem;
    tbSolicitarCarpeta: TToolButton;
    tbObservacionesSolicitud: TToolButton;
    tbSeparador1: TToolButton;
    pcOpcionesBusquedaCarpeta: TJvPageControl;
    tsBusquedaSectorUsuario: TTabSheet;
    gbOpcionesBusqueda: TGroupBox;
    lblSector: TLabel;
    lblUsuario: TLabel;
    fraUsuariosBusqueda: TfraUsuarios;
    fraSectoresBusqueda: TfraCodigoDescripcion;
    tsTipoArchivo: TTabSheet;
    gbTipoArchivo: TGroupBox;
    tsSolicitud: TTabSheet;
    gbSolicitud: TGroupBox;
    ChkGrp: TCheckGroup;
    rgEstado: TRadioGroup;
    edFechaMovimientoDesde: TDateComboBox;
    lblFechaMovimientoDesde: TLabel;
    lblFechaMovimientoHasta: TLabel;
    edFechaMovimientoHasta: TDateComboBox;
    gbLeyenda: TGroupBox;
    lblReferenciaPeriodoEstimado: TLabel;
    lblReferenciaPeriodoRecalculo: TLabel;
    pnColorSolicitadoPendiente: TPanel;
    pnColorVencidoPlazoDevolucion: TPanel;
    lblExcedidoPlazoEntrega: TLabel;
    pnColorExcedidoPlazoEntrega: TPanel;
    gbFechaSolicitud: TGroupBox;
    edtFechaDesde: TDateComboBox;
    lblFechaSolicitudDesde: TLabel;
    lblFechaSolicitudHasta: TLabel;
    edtFechaHasta: TDateComboBox;
    pmSolicitarCarpetas: TPopupMenu;
    mnuSolicitarResaltado: TMenuItem;
    mnuSolicitarMultiple: TMenuItem;
    tbEnviarSolicitudes: TToolButton;
    lblCodigoArchivo: TLabel;
    edCodigoArchivo: TIntEdit;
    tbRecepcionCarpetas: TToolButton;
    fpRecepcionCarpetas: TFormPanel;
    btnAceptarRecep: TBitBtn;
    btnCancelarRecep: TBitBtn;
    dsRecepCarpeta: TDataSource;
    cdsRecepCarpeta: TClientDataSet;
    GridRecepCarpeta: TDBGrid;
    sdqRecepCarpeta: TSDQuery;
    dspRecepCarpeta: TDataSetProvider;
    sdqRecepCarpetaTA_DESCRIPCION: TStringField;
    sdqRecepCarpetaAR_DESCRIPCIONCLAVE: TStringField;
    sdqRecepCarpetaSC_USUARIOSOLICITUD: TStringField;
    cdsRecepCarpetaTA_DESCRIPCION: TStringField;
    cdsRecepCarpetaAR_DESCRIPCIONCLAVE: TStringField;
    cdsRecepCarpetaSC_USUARIOSOLICITUD: TStringField;
    Label1: TLabel;
    edCantCarpetasRecep: TIntEdit;
    tbDevolucionCarpetas: TToolButton;
    fpDevolucionCarpetas: TFormPanel;
    Label2: TLabel;
    btnAceptarDevol: TBitBtn;
    btnCancelarDevol: TBitBtn;
    GridDevolCarpeta: TDBGrid;
    edCantCarpetasDevol: TIntEdit;
    sdqDevolCarpeta: TSDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    dsDevolCarpeta: TDataSource;
    cdsDevolCarpeta: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    dspDevolCarpeta: TDataSetProvider;
    tbMovimientoCarpetas: TToolButton;
    fraFiltroArchivoBusqueda: TfraFiltroArchivo;
    fraFiltroArchivoRecCarpeta: TfraFiltroArchivo;
    fraFiltroArchivoDevolCarpeta: TfraFiltroArchivo;
    gbUbicacion: TGroupBox;
    cbGuardaDigitalizacion: TCheckBox;
    cbUsuario: TCheckBox;
    gbEstado: TGroupBox;
    cbPendienteDevolucion: TCheckBox;
    cbSolicitadoOtroUsuario: TCheckBox;
    gbBusquedaGeneral2: TGroupBox;
    CUIL: TLabel;
    lbCUIT: TLabel;
    fraEmpresaCD: TfraEmpresa;
    fraTrabajadorSiniestroCD: TfraTrabajadorSiniestro;
    gbBusquedaGeneral3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    fraEmpresaAMP: TfraEmpresa;
    fraTrabajadorAMP: TfraTrabajador;
    edOperativoAMP: TPeriodoPicker;
    edFechaExamenAMP: TDateComboBox;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    ShortCutControl1: TShortCutControl;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    fraEstudiosCarpeta: TfraCodigoDescripcion;
    Label3: TLabel;
    mnuImprimirRemitoEstudio: TMenuItem;
    Label4: TLabel;
    edObservDevolCarpeta: TMemo;
    lblObsGD: TLabel;
    Panel1: TPanel;
    cbConMotivoRetencion: TCheckBox;
    Label6: TLabel;
    edNroCajaDevolCarpeta: TIntEdit;
    sdqDevolCarpetaAR_CAJA: TFloatField;
    cdsDevolCarpetaAR_CAJA: TFloatField;
    mnuImprimirEtiquetas: TMenuItem;
    tbReemplazoCarpetas: TToolButton;
    cbOtrasUbic: TCheckBox;
    cbSoloUltimaSolicitud: TCheckBox;
    tbVerImagenes: TToolButton;
    ToolButton2: TToolButton;
    fpDetalleMultiplesCarpetas: TFormPanel;
    Label11: TLabel;
    btnAceptarSelMult: TBitBtn;
    btnCancelarSelMult: TBitBtn;
    edCantCarpetasSelMult: TIntEdit;
    fraFiltroArchivoSelMultCarpeta: TfraFiltroArchivo;
    sdqSelMultCarpeta: TSDQuery;
    StringField3: TStringField;
    StringField6: TStringField;
    dsSelMultCarpeta: TDataSource;
    cdsSelMultCarpeta: TClientDataSet;
    StringField8: TStringField;
    StringField9: TStringField;
    dspSelMultCarpeta: TDataSetProvider;
    tbDetallesMultCarpetas: TToolButton;
    btnAgregarSelMult: TBitBtn;
    sdqSelMultCarpetaAR_ID: TFloatField;
    GridSelMultCarpeta: TArtDBGrid;
    cdsSelMultCarpetaAR_ID: TFloatField;
    ilByN: TImageList;
    ilColor: TImageList;
    tbAgregarCuerpos: TToolButton;
    Label12: TLabel;
    edCarpetaDesdeAMP: TIntEdit;
    Label13: TLabel;
    edCarpetaHastaAMP: TIntEdit;
    cbDyG: TCheckBox;
    pmnuDevolCarpetas: TPopupMenu;
    mnuDevolImprimirRemito: TMenuItem;
    mnuDevolGenerarRemito: TMenuItem;
    pmnuDevolCarpeta: TMenuItem;
    tsRemito: TTabSheet;
    gbRemito: TGroupBox;
    Label14: TLabel;
    edFechaRemitoDesde: TDateComboBox;
    Label15: TLabel;
    edFechaRemitoHasta: TDateComboBox;
    Label16: TLabel;
    edRemitoDesde: TIntEdit;
    Label17: TLabel;
    edRemitoHasta: TIntEdit;
    cbRemitoGenerado: TCheckBox;
    mnuDevolEliminarRemito: TMenuItem;
    Label18: TLabel;
    edCantCuerposDevolCarpeta: TIntEdit;
    sdqDevolCarpetaAR_CANTCUERPOS: TFloatField;
    cdsDevolCarpetaAR_CANTCUERPOS: TFloatField;
    chkMoverAdminDevolCarpeta: TCheckBox;
    pnColorEnResguardo: TPanel;
    Label5: TLabel;
    chkEnResguardo: TCheckBox;
    lblNroCaja: TLabel;
    edNroCajaDesde: TIntEdit;
    Label19: TLabel;
    edNroCajaHasta: TIntEdit;
    tbModificarCajas: TToolButton;
    fpModificarCajas: TFormPanel;
    Label22: TLabel;
    btnAceptarModifCajas: TBitBtn;
    btnCancelarModifCajas: TBitBtn;
    edNroCajaModifCaja: TIntEdit;
    BevelAbm: TBevel;
    fraTipoArchivoModifCaja: TfraCodigoDescripcion;
    Label20: TLabel;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    edFExtraviadaDesde: TDateComboBox;
    Label23: TLabel;
    edFExtraviadaHasta: TDateComboBox;
    cbExtraviadas: TCheckBox;
    tsEstadoCarpeta: TTabSheet;
    gbEstadoCarpeta: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    edFechaEstadoDesde: TDateComboBox;
    edFechaEstadoHasta: TDateComboBox;
    Label26: TLabel;
    cmbEstadosCarpeta: TDBCheckCombo;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    chkSoloCarpetasUsuLog: TCheckBox;
    N1: TMenuItem;
    ToolButton7: TToolButton;
    tbCarpetasSolicUsuarios: TToolButton;
    pmnuCarpetasSolicUsu: TPopupMenu;
    pmnuRecepcionCarpetaUsu: TMenuItem;
    pmnuDevolucionCarpetaUsu: TMenuItem;
    Label27: TLabel;
    edFechaSolicitudDesde: TDateComboBox;
    Label28: TLabel;
    edFechaSolicitudHasta: TDateComboBox;
    chkSoloCarpetasPendRecepGyD: TCheckBox;
    chkSoloCarpetasPendDevolGyD: TCheckBox;
    tbBuscarCodigoBarras: TToolButton;
    ToolButton9: TToolButton;
    gbUsuario: TGroupBox;
    fraUsuariosSolicitud: TfraUsuarios;
    gbFechaRecepcion: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    edtFechaRecepDesde: TDateComboBox;
    edtFechaRecepHasta: TDateComboBox;
    tbCargaMasiva: TToolButton;
    cbSolicitudesCanceladas: TCheckBox;
    fraUsuEstadoCarpeta: TfraUsuarios;
    Label31: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuUnselectAllClick(Sender: TObject);
    procedure mnuToggleSelectionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormShow(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure mnuSolicitarResaltadoClick(Sender: TObject);
    procedure mnuSolicitarMultipleClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbEnviarSolicitudesClick(Sender: TObject);
    procedure tbObservacionesSolicitudClick(Sender: TObject);
    procedure tbRecepcionCarpetasClick(Sender: TObject);
    procedure btnAceptarRecepClick(Sender: TObject);
    procedure fpRecepcionCarpetasEnter(Sender: TObject);
    procedure btnCancelarRecepClick(Sender: TObject);
    procedure tbDevolucionCarpetasClick(Sender: TObject);
    procedure btnCancelarDevolClick(Sender: TObject);
    procedure fpDevolucionCarpetasEnter(Sender: TObject);
    procedure btnAceptarDevolClick(Sender: TObject);
    procedure tbMovimientoCarpetasClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure fraFiltroArchivoRecCarpetabtnCargarCodigoBarrasClick(Sender: TObject);
    procedure fraFiltroArchivoDevolCarpetabtnCargarCodigoBarrasClick(Sender: TObject);
    procedure fraFiltroArchivoBusquedaOnArchivoChange(Sender: TObject);
    procedure fraTrabajadorSiniestroCDtbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuImprimirRemitoEstudioClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraFiltroArchivoDevolCarpetaChange(Sender: TObject);
    procedure mnuImprimirEtiquetasClick(Sender: TObject);
    procedure tbReemplazoCarpetasClick(Sender: TObject);
    procedure tbVerImagenesClick(Sender: TObject);
    procedure fpDetalleMultiplesCarpetasEnter(Sender: TObject);
    procedure btnAceptarSelMultClick(Sender: TObject);
    procedure tbDetallesMultCarpetasClick(Sender: TObject);
    procedure btnCancelarSelMultClick(Sender: TObject);
    procedure btnAgregarSelMultClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbAgregarCuerposClick(Sender: TObject);
    procedure pmnuDevolCarpetaClick(Sender: TObject);
    procedure mnuDevolGenerarRemitoClick(Sender: TObject);
    procedure mnuDevolImprimirRemitoClick(Sender: TObject);
    procedure mnuDevolEliminarRemitoClick(Sender: TObject);
    procedure tbModificarCajasClick(Sender: TObject);
    procedure btnAceptarModifCajasClick(Sender: TObject);
    procedure fpModificarCajasEnter(Sender: TObject);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbExportarClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pmnuRecepcionCarpetaUsuClick(Sender: TObject);
    procedure pmnuDevolucionCarpetaUsuClick(Sender: TObject);
    procedure tbCarpetasSolicUsuariosClick(Sender: TObject);
    procedure tbBuscarCodigoBarrasClick(Sender: TObject);
    procedure tbCargaMasivaClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSolicitarCarpetaClick(Sender: TObject);
  public
    fraEstablecimientoAMP: TfraEstablecimiento;
    class procedure DoMostrarCarpeta(ATipoArchivo: TTableId; AClave: String);
    class procedure DoMostrarCarpetasEnTransitoUsuario(Sender: TObject);
  private
    FUltTipoArchDevolCarpeta: Integer;
    FFiltradoPorUltSolicitud, FCrear, FHuboCambiosCarpetas : boolean;
    FFechaActual : TDate;
    tslCheckeados: TStringList;
    procedure CrearArchivo(AIdTipoArchivo: Integer; AClave: String; ATipoUbicacion, AUbicacion : String; Observaciones : String = '');
    function GetExcedidoPlazoEntrega(ATipoSolicitud: integer; AFechaSolicitud: TDate): boolean;
    function MostrarPropiedades(Grilla: TDBGrid; CampoARId: String; VerImagenes: Boolean = False): Boolean;
    function ValidarRecepcionCarpeta: Boolean;
    procedure DoRecepcionCarpeta(Tipo: Integer; Clave: String; EsRecepcion: Boolean);
    procedure DoInsertarRegRecepCarpeta(Tipo: Integer; Clave, UsuarioSolicitud: String);
    procedure DoInsertarRegDevolCarpeta(Tipo: Integer; Clave: String);
    procedure DoInsertarRegSelMultCarpeta(Tipo: Integer; Clave: String);
    function ValidarDevolucionCarpeta: Boolean;
    procedure DoDevolucionCarpeta(Tipo: Integer; Clave, Observaciones: String; NroCaja, CantCuerpos: Integer; MoverCarpetaAdmin: Boolean);
    function ValidarCancelarSolicitud: Boolean;
    function GetHorasSolicitud(TipoSolicitud: Integer): Integer;
    procedure CancelarSolicitudPorMail(IdRSC: TTableId; ConTrans: Boolean);
    procedure InicializarContadores;
    procedure CalcularFilasSel;
    function VerificarRemito: TTableId;
    procedure ImprimirRemitoEstudio(AIdLote: TTableId);
    function Get_ObservacionesCaja(Obligatorio: Boolean; ValorInicial: String; var Observaciones: String): Boolean;
    function ValidarSelMultCarpeta: Boolean;
   {$IFDEF RED_PRES}
    procedure OnEmpresaAMPChange(Sender: TObject);
   {$ENDIF}
    function ValidarRemitoDevolucion: Boolean;
    function GenerarRemitoDevolucion: Boolean;
    function InsertarRemitoDevolucion: Integer;
    procedure IncorporarRemitoACarpeta(IdRemito, Secuencia, IdArchivo: Integer);
    procedure ImprimirRemitoDevolucion(AIdRemito: Integer; Preview: Boolean = False; eMail: String = '');
    function VerificarImpresionRemitoDevolucion: Boolean;
    function ValidarModificarCaja: Boolean;
    function ValidarRecepcionCarpetaUsuario: Boolean;
    function ValidarDevolucionCarpetaUsuario: Boolean;
    procedure CambiarEstadoSolicitudCarpeta(IdArchivo: TTableId);
    function ValidarDatosCargaMasiva: Boolean;
  protected
    procedure RefreshData(EsMasivo: Boolean = False; CantCampos: Integer = 0); reintroduce;
    procedure ClearData; override;
    procedure DoMarcarFila; override;
  end;

  procedure EnviarSolicitud(AIdEnvio : Integer; AIdSolicitud: Integer);
  procedure EnviarSolicitudPorMail(ListaIdEnvio: String; ConTrans : Boolean);

var
  frmConsultaCarpetas: TfrmConsultaCarpetas;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs,
  unArchivo, unConstantArchivo, strFuncs, VCLExtra,
  unUtilsArchivo, unfrmUbicacionActual, unFrmDetalleArchivo, unEspera,
  unFrmSolicitudCarpeta, unComunesMail, ArchFuncs, unMovimientoCarpetas,
  DateTimeFuncs, General, unComunesArchivo,
  unQrDetalleLoteEstudio, unGrids, unReemplazoCarpetas, unQrDetalleRemitoDevolucion,
  unMensajeAlertaAGA, unImpoExpoWizard;

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmConsCarpetas }
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.FormCreate(Sender: TObject);
var
  bAdministrador: Boolean;
begin
  inherited;

  // por compatibilidad con RedPres
  ToolBar.Images    := ilByN;
  ToolBar.HotImages := ilColor;
  IMG_FILTROS_SHOW  := 10;
  IMG_FILTROS_HIDE  := 11;
  tbRefrescar.ImageIndex              := 0;
  tbNuevo.ImageIndex                  := 6;
  tbModificar.ImageIndex              := 7;
  tbEliminar.ImageIndex               := 8;
  tbPropiedades.ImageIndex            := 13;
  tbLimpiar.ImageIndex                := 1;
  tbOrdenar.ImageIndex                := 2;
  tbMostrarOcultarColumnas.ImageIndex := 14;
  tbImprimir.ImageIndex               := 4;
  tbExportar.ImageIndex               := 3;
  tbEnviarMail.ImageIndex             := 31;
  tbMostrarFiltros.ImageIndex         := 11;
  tbMaxRegistros.ImageIndex           := 12;
  tbSalir.ImageIndex                  := 5;

  FFechaActual             := DBDate;
  FFiltradoPorUltSolicitud := False;

  bAdministrador := GetPerfilAdministrador();

  tbSolicitarCarpeta.Enabled       := (not bAdministrador and Seguridad.Activar(tbSolicitarCarpeta)) or (Sesion.Sector = 'COMPUTOS');
  mnuImprimirEtiquetas.Visible     := bAdministrador AND False;

  tbEnviarSolicitudes.Enabled      := bAdministrador and Seguridad.Activar(tbEnviarSolicitudes);
  tbObservacionesSolicitud.Enabled := bAdministrador and Seguridad.Activar(tbObservacionesSolicitud);
  tbEliminar.Enabled               := bAdministrador and Seguridad.Activar(tbEliminar);
  tbMovimientoCarpetas.Enabled     := bAdministrador and Seguridad.Activar(tbMovimientoCarpetas);
  tbAgregarCuerpos.Enabled         := bAdministrador and Seguridad.Activar(tbAgregarCuerpos);
  tbDevolucionCarpetas.Enabled     := bAdministrador and Seguridad.Activar(tbDevolucionCarpetas);
  tbReemplazoCarpetas.Enabled      := bAdministrador and Seguridad.Activar(tbReemplazoCarpetas);

  tbNuevo.Visible := False;

  pnColorSolicitadoPendiente.Color    := COLOR_SOLICITADO;
  pnColorVencidoPlazoDevolucion.Color := COLOR_PLAZOVENCIDO;
  pnColorExcedidoPlazoEntrega.Color   := COLOR_EXCEDIDOPLAZOENTREGA;
  pnColorEnResguardo.Color            := COLOR_CARPETA_EN_RESGUARDO;
  lblObsGD.Font.Color                 := COLORF_OBSERV_GYD_PENDIENTE;

  with fraSectoresBusqueda do
  begin
    TableName   := 'USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas   := true;
  end;

  with fraEstudiosCarpeta do
    begin
      TableName   := 'LEGALES.LBO_ABOGADO';
      FieldID     := 'BO_ID';
      FieldCodigo := 'BO_ID';
      FieldDesc   := 'BO_NOMBRE';
      FieldBaja   := 'BO_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraTipoArchivoModifCaja do
    begin
      TableName   := 'RTA_TIPOARCHIVO';
      FieldID     := 'TA_ID';
      FieldCodigo := 'TA_CODIGO';
      FieldDesc   := 'TA_DESCRIPCION';
      ExtraFields := ', TA_FORMULARIO ';
      ShowBajas   := False;
    end;

  fraFiltroArchivoBusqueda.ReadOnly := False;
  fraFiltroArchivoBusqueda.OnChange := fraFiltroArchivoBusquedaOnArchivoChange;

  gbBusquedaGeneral2.Visible         := False;
  gbBusquedaGeneral3.Visible         := False;

  fraEmpresaCD.ShowBajas             := True;
  fraTrabajadorSiniestroCD.ShowBajas := True;
  fraUsuariosBusqueda.ShowBajas      := True;
  fraUsuariosSolicitud.ShowBajas     := True;
  fraUsuEstadoCarpeta.ShowBajas      := True;
  fraEmpresaAMP.ShowBajas            := True;

  // por compatibilidad con RedPres
  fraEstablecimientoAMP := TfraEstablecimiento.Create(Self);
  with fraEstablecimientoAMP do
    begin
      Parent   := gbBusquedaGeneral3;

      {$IFDEF RED_PRES}
      Left     := 2;
      Width    := 775;
      fraEmpresaAMP.OnChange := OnEmpresaAMPChange;
      {$ELSE}
      Left     := 31;
      Width    := 750;
      with TLabel.Create(Self) do
      begin
        Parent   := gbBusquedaGeneral3;
        Autosize := True;
        Top      := 36;
        Left     := 5;
        Caption  := 'Est.';
      end;
      fraEmpresa := fraEmpresaAMP;
      {$ENDIF}

      Top      := 32;
      Height   := 23;
      Anchors  := [akLeft,akTop,akRight];
      TabOrder := fraEmpresaAMP.TabOrder + 1;

      ShowBajas  := False;
    end;

  fraFiltroArchivoDevolCarpeta.OnChange := fraFiltroArchivoDevolCarpetaChange;
  FUltTipoArchDevolCarpeta := ART_EMPTY_ID;

  tslCheckeados := TStringList.Create;

  VALOR_PARAMETRO_PREVISIMPRESIONREMITO :=
        StrToBoolDef(get_ParametrobyId(PARAMETRO_PREVISIMPRESIONREMITO),
                                       VALOR_PARAMETRO_PREVISIMPRESIONREMITO);

  pcOpcionesBusquedaCarpeta.ActivePage := tsTipoArchivo;
  ActiveControl := fraFiltroArchivoBusqueda.fraTipoArchivo.edCodigo;

  {$IFNDEF ADMGRALARCHIVO}
  DoIniciarCarpetasEnTransitoUsu;
  {$ENDIF}
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuImprimirResultadosClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  QueryPrint.Footer.Text := Sesion.UserID;
  HideUnassignedPrintFields(Grid, QueryPrint);
  PrintResults;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuSelectAllClick(Sender: TObject);
begin
  DoSMMarcarTodos(tslCheckeados, sdqConsulta, SMCampoFila);
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuUnselectAllClick(Sender: TObject);
begin
  DoSMDesmarcarTodos(tslCheckeados, Grid);
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuToggleSelectionClick(Sender: TObject);
begin
  DoSMInvertirSeleccion(tslCheckeados, Grid, SMCampoFila);
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('CARPETAENRESGUARDO').AsString = 'S' then
    begin
      if Highlight then
        AFont.Color := clBlack
      else
        AFont.Color := clNavy;

      Background := COLOR_CARPETA_EN_RESGUARDO;
    end
  else if not sdqConsulta.FieldByName('SC_USUARIOSOLICITUD').IsNull and
     not sdqConsulta.FieldByName('SC_FECHAIMPRESION').IsNull then
    begin
      if Highlight then
        AFont.Color := clBlack
      else
        AFont.Color := clNavy;

      Background := COLOR_SOLICITADO;
    end
  else if not sdqConsulta.FieldByName('SC_FECHAPREVISTADEVOLUCION').IsNull and
          (sdqConsulta.FieldByName('SC_FECHAPREVISTADEVOLUCION').AsDateTime < FFechaActual) then
    begin
      if Highlight then
        AFont.Color := clCream
      else
        AFont.Color := clNavy;

      Background := COLOR_PLAZOVENCIDO;
    end
  else if (not sdqConsulta.FieldByName('SC_TIPOSOLICITUD').IsNull) and
          (sdqConsulta.FieldByName('SC_FECHARECEPCION').IsNull) then
    begin
      if GetExcedidoPlazoEntrega(
            sdqConsulta.FieldByName('TIPOSOLICITUD').AsInteger,
            sdqConsulta.FieldByName('SC_FECHASOLICITUD').AsDateTime) then
      begin
        if Highlight then
          AFont.Color := clBlack
        else
          AFont.Color := clNavy;

        Background := COLOR_EXCEDIDOPLAZOENTREGA;
      end;
    end
  else
    begin
      if Highlight then
        begin
          AFont.Color := clWindow;
          Background  := clNavy;
        end
      else
        begin
          AFont.Color := clNavy;
          Background  := clWindow;
        end;
    end;

  if (not sdqConsulta.FieldByName('TA_FECHABAJA').IsNull) then
    AFont.Color := clRed
  else if sdqConsulta.FieldByName('SC_FECHARECEPCION').IsNull and
          not sdqConsulta.FieldByName('SC_FECHAIMPRESION').IsNull and
          not sdqConsulta.FieldByName('SC_OBSERVACPENDIENTE').IsNull then
    AFont.Color := COLORF_OBSERV_GYD_PENDIENTE;

  if (sdqConsulta.FieldByName('AR_UBICACION').AsString = UBIC_EXTRAVIADA) and (Field.FieldName = 'UBICACION') then
    AFont.Color := clRed;

  if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
    DoSMGridGetCellProps(tslCheckeados, sdqConsulta, SMCampoFila, Background);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.GetExcedidoPlazoEntrega(ATipoSolicitud : integer; AFechaSolicitud : TDate) : boolean;
var
  iHoras: Integer;
begin
  iHoras := GetHorasSolicitud(ATipoSolicitud);

  Result := (DBDateTime>AddHours(AFechaSolicitud, iHoras));
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.RefreshData(EsMasivo: Boolean = False; CantCampos: Integer = 0);
var
  sSqlWhereSol, sSql2, sSql3, sSql, sSqlSelect: string;
  sSqlUrgencia, sSqlFrom, sObservac, sSqlWhere: string;
  ATipoUbicacion, sPorTipo, AUbicacion : string;
  sExtraviadas, sDigit, sSqlUbic, sGD, sUsuario, sOtras: String;
  bAceptar, bGrabar, bEsAMP, bEsCartaDoc, bPorClave, bPorSolicitudCarpeta: Boolean;
  rarId: TTableId;
  iResp: Integer;

  function GetParentTabSheet(AControl: TWinControl): TTabSheet;
    begin
      if Assigned(AControl) then
        if (AControl.ClassType <> TTabSheet) then
          Result := GetParentTabSheet(AControl.Parent)
        else
          Result := TTabSheet(AControl)
      else
        Result := nil;
    end;

  function Verificar(Condicion: Boolean; AControl: TWinControl; AText: String): Boolean;
  var
    tsTabSheet: TTabSheet;
  begin
    if Condicion then
      begin
        tsTabSheet := GetParentTabSheet(AControl);
        TPageControl(tsTabSheet.Parent).ActivePage := tsTabSheet;
        Result := CustomDlgs.Verificar(Condicion, AControl, AText);
      end
    else
      Result := False;
  end;          
begin
  DoPerderFoco(Grid, Grid);
  if fraFiltroArchivoBusqueda.HuboError then
    Exit;

  bEsCartaDoc := fraFiltroArchivoBusqueda.IsCartaDocumento();
  Verificar(bEsCartaDoc and fraEmpresaCD.IsSelected and fraTrabajadorSiniestroCD.IsSelected, fraEmpresaCD, 'No puede elegir un contrato y un siniestro a la vez.');
  Verificar(bEsCartaDoc and (fraEmpresaCD.IsSelected or fraTrabajadorSiniestroCD.IsSelected) and fraFiltroArchivoBusqueda.IsCompleted, fraEmpresaCD, 'Si eligió una carpeta, no puede elegir un contrato o un siniestro.');

  bEsAMP := fraFiltroArchivoBusqueda.IsAMP();
  Verificar(bEsAMP and (fraEmpresaAMP.IsSelected or fraTrabajadorAMP.IsSelected or (edOperativoAMP.Periodo.Valor <> '') or not edFechaExamenAMP.IsEmpty or not edCarpetaDesdeAMP.IsEmpty or not edCarpetaHastaAMP.IsEmpty) and fraFiltroArchivoBusqueda.IsCompleted, fraEmpresaAMP, 'Si eligió una carpeta, no puede elegir un CUIT, un establecimiento, un trabajador, un operativo, una fecha de examen o un rango de carpetas.');

  Verificar(cbDyG.Checked and not cbSoloUltimaSolicitud.Checked, cbSoloUltimaSolicitud, 'Si eligió ''Digitalización y Guarda (Pend. Generar Remito)'', entonces debe seleccionar ''Carpetas solo con Ultima Solicitud/Devol.''.');

  FCrear := false; //Si verifica que se busca una clave en particular y esta no
                   //se encuentra entonces se crea la carpeta automáticamente.
                   //la carpeta puede ser que no exista.
  bPorSolicitudCarpeta := False;
  sSqlWhere := 'WHERE 1 = 1' +
                Iif(EsMasivo, ' AND AG_USUARIO = ' + SqlValue(Sesion.UserID) +
                              ' AND AR_CLAVE = ARCHIVO.GETCLAVEARMADA(' + SqlValue(CantCampos) + ', AG_CAMPO1, AG_CAMPO2, AG_CAMPO3, AG_CAMPO4) '
                    , '');

  // le saqué el /*+ RULE */
  sSqlSelect := 'SELECT 0 ' + SMCampoCheckBox + ', AR_ID, AR_TIPO, TA_DESCRIPCION, TA_FECHABAJA, ' +
                '      DECODE(AR_TIPOUBICACION, ''D'', ''Delegación'', ' +
                '                               ''L'', ''Lugar'', ' +
                '      ''S'', ''Sector'', ''U'', ''Usuario'', ''G'', ''Administradora'') TIPOUBICACION, ' +
                '      ART.ARCHIVO.GETUBICACIONNOMBRE(AR_TIPOUBICACION, AR_UBICACION) UBICACION, ' +
                '      AR_FECHAMOVIMIENTO, AR_CAJA, AR_RECEPTOR, AR_EMISOR, ' +
                '      ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) AR_DESCRIPCIONCLAVE, ' +
                '      SC_FECHASOLICITUD, SC_HORASOLICITUD, SC_USUARIOSOLICITUD, SC_FECHADEVOLUCION, ' +
                '      DECODE (SC_TIPOSOLICITUD,''1'', ''2 HORAS'',  ''2'', ''4 HORAS'', ''3'', ''24 HORAS'') SC_TIPOSOLICITUD, ' +
                '      SC_FECHAIMPRESION, SC_TIPOSOLICITUD TIPOSOLICITUD, ' +
                '      SC_FECHARECEPCION, SC_OBSERVACIONES, SC_USUARIOIMPRESION, TC_ID, AR_CLAVE, SC_ID, ' +
                '      AR_TIPOUBICACION, AR_UBICACION, SC_FECHAPREVISTADEVOLUCION, AR_CANTCUERPOS, ' +
                '      ART.ARCHIVO.GET_CONTRATOCD(TA_ID, AR_CLAVE) CONTRATOCD, BO_NOMBRE ESTUDIOLEG, ' +
                '      ART.ARCHIVO.GET_NROEXPEDIENTECD(TA_ID, AR_CLAVE) NROEXPEDIENTECD, AR_IDABOGADO, ' +
                '      AR_OBSERVACIONES, SC_OBSERVACPENDIENTE, SC_MOTIVORETENCION, SC_FECHAMOTIVORETENCION, ' +
                '      VCE.CE_CUIT CUIT, VCE.CE_NOMBREEMPR NOMBREEMPR, VCE.CE_CONTRATO CONTRATO, ' +
                '      VCE.CE_NROESTABLECI NROESTABLECI, VCE.CE_NOMBREESTABLECI NOMBREESTABLECI, VCE.CE_CUIL CUIL, ' +
                '      VCE.CE_NOMBRETRAB NOMBRETRAB, RD_ID IDREMITODEVOL, TRUNC(RD_FECHAALTA) FALTAREMITODEVOL, TRUNC(RD_FECHABAJA) FBAJAREMITODEVOL, ' +
                '      ART.ARCHIVO.IS_CARPETAENRESGUARDO(TA_ID, AR_CLAVE) CARPETAENRESGUARDO, TA_FORMULARIO, ' +
                '      ART.ARCHIVO.GET_LISTACODUBICCARPETAS(AR_ID) LISTACODUBICCARPETAS, ESTCARP.TB_DESCRIPCION DESCRESTADOCARPETA, ' +
                '      AR_USU_ESTADO USUESTADOCARPETA, TRUNC(AR_FECHA_ESTADO) FECHAESTADOCARPETA, AR_ESTADO ESTADOCARPETA ';

   sSqlFrom  := ' FROM CTB_TABLAS ESTCARP, RRD_REMITODEVOLUCION, LEGALES.LBO_ABOGADO B, RTA_TIPOARCHIVO T, RTC_TIPOCLAVE C, ' +
                      'RSC_SOLICITUDCARPETA S, RAR_ARCHIVO R, ARCHIVO.VCE_CARPETAESTAMP VCE ' +
                      Iif(EsMasivo, ', TAG_CLAVEAGA ', '');

  {----------------}
  sSqlUbic     := '';
  sGD          := '((AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_GUARDA) + ') ' +
                    'OR (AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_LUGAR) + ' AND AR_UBICACION IN (''10'', ''11'', ''12'', ''13''))) ';
  sOtras       := '(AR_IDABOGADO IS NOT NULL ' +
                   'OR (AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_LUGAR) + ' AND AR_UBICACION IN (' + SqlValue(UBIC_EXTRAVIADA) + ', ' + SqlValue(UBIC_TERCEROS) + ', ' + SqlValue(UBIC_ANULADA) + '))) ';
  sUsuario     := '((AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) + ') AND NOT ' + sOtras + ')';
  sDigit       := '(AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_LUGAR) + ' AND AR_UBICACION = ' + SqlValue(UBIC_GyD) + ') ';
  sExtraviadas := '(AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_LUGAR) + ' AND AR_UBICACION = ' + SqlValue(UBIC_EXTRAVIADA) + ') ';

  if cbGuardaDigitalizacion.Checked then
    sSqlUbic := sSqlUbic + sGD + ' OR ';

  if cbUsuario.Checked then
    sSqlUbic := sSqlUbic + sUsuario + ' OR ';

  if cbOtrasUbic.Checked then
    sSqlUbic := sSqlUbic + sOtras + ' OR ';

  if cbDyG.Checked then
    sSqlUbic := sSqlUbic + sDigit + ' OR ';

  if cbExtraviadas.Checked then
    sSqlUbic := sSqlUbic + sExtraviadas + ' OR ';

  if not IsEmptyString(sSqlUbic) then
    begin
      sSqlUbic  := '(' + CutRight(sSqlUbic, 4) + ') ';
      sSqlWhere := sSqlWhere + ' AND ' + sSqlUbic;
    end;

  if (not edFExtraviadaDesde.IsEmpty) or (not edFExtraviadaHasta.IsEmpty) then
    sSqlWhere := sSqlWhere + SqlBetweenDateTime(' AND AR_FECHAMOVIMIENTO ', edFExtraviadaDesde.Date, edFExtraviadaHasta.Date) +
                             ' AND ' + sExtraviadas;

  if chkEnResguardo.Checked then
    sSqlWhere := sSqlWhere + ' AND ART.ARCHIVO.IS_CARPETAENRESGUARDO(TA_ID, AR_CLAVE) = ''S''';

  if cbPendienteDevolucion.Checked then
    begin
      sSqlWhere := sSqlWhere + ' AND SC_FECHAPREVISTADEVOLUCION < SYSDATE ' +
                               ' AND SC_FECHADEVOLUCION IS NULL ' +
                               ' AND SC_FECHARECEPCION IS NOT NULL';
      bPorSolicitudCarpeta := True;
    end;

  if cbSolicitadoOtroUsuario.Checked then
    sSqlWhere := sSqlWhere + ' AND SC_FECHAIMPRESION IS NOT NULL ' +
                             ' AND SC_FECHARECEPCION IS NULL ' +
                             ' AND AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO);

  if cbConMotivoRetencion.Checked then
    sSqlWhere := sSqlWhere + ' AND SC_FECHAMOTIVORETENCION IS NOT NULL ';


  if cbSoloUltimaSolicitud.Checked then
    sSqlWhere := sSqlWhere + ' AND (NVL(SC_ID, -1) = (SELECT NVL(MAX(SC_ID), -1) ' +
                                                       'FROM ARCHIVO.RSC_SOLICITUDCARPETA RSC2 ' +
                                                      'WHERE RSC2.SC_IDARCHIVO = S.SC_IDARCHIVO))';

  if cbSolicitudesCanceladas.Checked then
    sSqlWhere := sSqlWhere + ' AND SC_OBSERVACIONES LIKE ''CANCELADA POR %''';

  if  (fraSectoresBusqueda.IsSelected) then
    begin
      sSqlFrom := sSqlFrom + ' ,USE_USUARIOS ';
      sSqlWhere := sSqlWhere + ' AND AR_UBICACION = SE_USUARIO(+) ';
      sSqlWhere := sSqlWhere + ' AND AR_SECTORUSUARIO = ' + SqlValue(fraSectoresBusqueda.edCodigo.Text);
    end;

  if  (fraUsuariosBusqueda.IsSelected) then
    sSqlWhere := sSqlWhere + ' AND (AR_UBICACION = ' + SqlValue(fraUsuariosBusqueda.Codigo) + ') ';

  sSqlWhere := sSqlWhere + SqlBetweenDateTime(' AND AR_FECHAMOVIMIENTO ', edFechaMovimientoDesde.Date, edFechaMovimientoHasta.Date);

  if  fraEstudiosCarpeta.IsSelected then
    sSqlWhere := sSqlWhere + ' AND AR_IDABOGADO = ' + SqlValue(fraEstudiosCarpeta.Value);

  if not edCodigoArchivo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND AR_ID = ' + SqlValue(edCodigoArchivo.Text);

  sSqlWhere := sSqlWhere + SqlBetween(' AND AR_CAJA ', edNroCajaDesde.Value, edNroCajaHasta.Value);

  if fraFiltroArchivoBusqueda.IsSelected then
    begin
      bPorClave := ((fraFiltroArchivoBusqueda.Clave <> '|') and (fraFiltroArchivoBusqueda.Clave <> ''));

      if fraFiltroArchivoBusqueda.Tipo <> 0 then
        begin
          if bPorClave or (edtFechaDesde.IsEmpty and edtFechaHasta.IsEmpty and edtFechaRecepDesde.IsEmpty and edtFechaRecepHasta.IsEmpty and fraEmpresaCD.IsEmpty) then
            sPorTipo := ''
          else
            sPorTipo := '+0';  // para que no use el índice por AR_TIPO

          sSqlWhere := sSqlWhere + ' AND AR_TIPO' + sPorTipo + ' = ' + SqlValue(fraFiltroArchivoBusqueda.Tipo);
        end;

      if bPorClave then
        begin
          if fraFiltroArchivoBusqueda.IsCompleted then
            begin
              sSqlWhere := sSqlWhere + ' AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoBusqueda.Clave);

              // muestro reemplazos de carpetas
              DoMostrarMensajesAdvertenciaCarpeta(fraFiltroArchivoBusqueda.Tipo, fraFiltroArchivoBusqueda.Clave);
            end
          else if InStr(fraFiltroArchivoBusqueda.Clave, '|') > 0 then
            begin
              if StrLeft(fraFiltroArchivoBusqueda.Clave, 1) = '|' then
                sSqlWhere := sSqlWhere + ' AND AR_CLAVE LIKE ' + SqlValue('%' + fraFiltroArchivoBusqueda.Clave)
              else
                sSqlWhere := sSqlWhere + ' AND AR_CLAVE LIKE ' + SqlValue(fraFiltroArchivoBusqueda.Clave + '%') ;
            end;
        end;

      if fraFiltroArchivoBusqueda.IsCompleted then
        FCrear := true;
    end;

  if not edtFechaDesde.IsEmpty or not edtFechaHasta.IsEmpty or
     fraUsuariosSolicitud.IsSelected or (ChkGrp.SelCount > 0) or
     (rgEstado.ItemIndex <> 4) then
  begin
      if not edtFechaDesde.IsEmpty and not edtFechaHasta.IsEmpty then
        begin
          sSqlWhere := sSqlWhere + ' AND (SC_FECHASOLICITUD BETWEEN  ' +
                                        SqlValue(edtFechaDesde.Date) + ' AND ' +
                                        SqlDate(edtFechaHasta.Date + 1) + ' ) ';
          bPorSolicitudCarpeta := True;
        end
      else if not edtFechaDesde.IsEmpty then
        begin
          sSqlWhere := sSqlWhere + ' AND (SC_FECHASOLICITUD >= ' +
                                        SqlValue(edtFechaDesde.Date) + ') ';
          bPorSolicitudCarpeta := True;
        end;

      if fraUsuariosSolicitud.IsSelected then
        begin
          sSqlWhere := sSqlWhere + ' AND (SC_USUARIOSOLICITUD = ' +
                                        SqlValue(fraUsuariosSolicitud.Codigo) + ') ';
          bPorSolicitudCarpeta := True;
        end;

      if ChkGrp.SelCount > 0 then
      begin
        sSqlUrgencia := '';
        sSqlWhere := sSqlWhere + ' AND (SC_TIPOSOLICITUD IN (';
        if ChkGrp.Checked[0] then sSqlUrgencia := '1';
        if ChkGrp.Checked[1] then
        begin
          if not IsEmptyString(sSqlUrgencia) then
            sSqlUrgencia := sSqlUrgencia + ', 2'
          else
            sSqlUrgencia := '2'
        end;
        if ChkGrp.Checked[2] then
        begin
          if not IsEmptyString(sSqlUrgencia) then
            sSqlUrgencia := sSqlUrgencia + ', 3'
          else
            sSqlUrgencia := '3'
        end;
        sSqlWhere := sSqlWhere + sSqlUrgencia + '))';
      end;

      case rgEstado.ItemIndex of
        0: // Pendiente de envio. Sin fecha de impresión / envio.
           sSqlWhere := sSqlWhere + ' AND SC_FECHAIMPRESION IS NULL ' +
                                    ' AND SC_FECHARECEPCION IS NULL ';
        1: // Pendiente de recepción. Con fecha de impresion envio pero
           // la carpeta aun se encuentra en la Administradora';
           sSqlWhere := sSqlWhere + ' AND SC_FECHARECEPCION IS NULL ' +
                                    ' AND SC_FECHAIMPRESION IS NOT NULL ';
        2, 3: // Pendiente de devolución / Pendiente de devolución y entrega a usuario
           begin
             sSqlWhere := sSqlWhere + ' AND SC_FECHARECEPCION IS NOT NULL ' +
                                      ' AND SC_FECHADEVOLUCION IS NULL ';
             if rgEstado.ItemIndex = 3 then
               sSqlWhere := sSqlWhere + ' AND EXISTS (SELECT 1 ' +
                                                       'FROM RSC_SOLICITUDCARPETA S2 ' +
                                                      'WHERE S2.SC_FECHAIMPRESION IS NOT NULL ' +
                                                       ' AND S2.SC_FECHARECEPCION IS NULL ' +
                                                       ' AND S2.SC_USUARIOSOLICITUD <> AR_UBICACION ' +
                                                       ' AND S2.SC_IDARCHIVO = AR_ID) ';
           end;
      end;
  end;

  sSqlWhereSol := SqlBetweenDateTime(' AND SC_FECHASOLICITUD ', edFechaSolicitudDesde.Date, edFechaSolicitudHasta.Date) +
                  SqlBetweenDateTime(' AND SC_FECHARECEPCION ', edtFechaRecepDesde.Date, edtFechaRecepHasta.Date);

  sSqlWhere := sSqlWhere + SqlBetweenDateTime(' AND RD_FECHAALTA ', edFechaRemitoDesde.Date, edFechaRemitoHasta.Date) +
                           SqlBetween(' AND RD_ID ', edRemitoDesde.Value, edRemitoHasta.Value) +
                           SqlBetweenDateTime(' AND AR_FECHA_ESTADO ', edFechaEstadoDesde.Date, edFechaEstadoHasta.Date) +
                           sSqlWhereSol;

  if not IsEmptyString(sSqlWhereSol) then
    bPorSolicitudCarpeta := True;

  if not IsEmptyString(cmbEstadosCarpeta.Text) then
    sSqlWhere := sSqlWhere + ' AND AR_ESTADO ' + cmbEstadosCarpeta.InSql;

  if fraUsuEstadoCarpeta.IsSelected then
    sSqlWhere := sSqlWhere + ' AND AR_USU_ESTADO = ' + SqlValue(fraUsuEstadoCarpeta.Codigo);

  if chkSoloCarpetasUsuLog.Checked then
    begin
      sSqlWhere := sSqlWhere + ' AND SC_USUARIOSOLICITUD = ' + SqlValue(Sesion.UserId);
      bPorSolicitudCarpeta := True;
    end;

  if chkSoloCarpetasPendRecepGyD.Checked then
    sSqlWhere := sSqlWhere + ' AND AR_ESTADO = ' + SqlValue(ESTADOCARPETA_ENTRANSITO_USU);

  if chkSoloCarpetasPendDevolGyD.Checked then
    sSqlWhere := sSqlWhere + ' AND AR_ESTADO = ' + SqlValue(ESTADOCARPETA_PODERUSUARIO);

  if cbRemitoGenerado.Checked then
    sSqlWhere := sSqlWhere + ' AND AR_IDREMITODEVOL IS NOT NULL';

  sSqlWhere := sSqlWhere + ' AND AR_TIPO = TA_ID ' +
                           ' AND TA_FORMULARIO = TC_CLAVE ' +
                           ' AND AR_ID = SC_IDARCHIVO ' + Iif(bPorSolicitudCarpeta, '', '(+)') + ' ' +
                           ' AND AR_IDABOGADO = BO_ID(+) ' +
                           ' AND AR_IDREMITODEVOL = RD_ID(+) ' +
                           ' AND AR_ESTADO = ESTCARP.TB_CODIGO(+) ' +
                           ' AND ''ESCAR'' = ESTCARP.TB_CLAVE(+) ' +
                           ' AND VCE.CE_ID(+) = (CASE WHEN AR_TIPO IN (' + SqlValue(ID_CARPETA_ML_RX) + ', ' +
                                                                           SqlValue(ID_CARPETA_ML_GRAL) + ', ' +
                                                                           SqlValue(ID_CARPETA_ML_EGRESOS)+ ') THEN TO_NUMBER(AR_CLAVE) ' +
                                                'ELSE -1 END) ';

  if fraEmpresaAMP.IsSelected or fraTrabajadorAMP.IsSelected or (edOperativoAMP.Periodo.Valor <> '') or not edFechaExamenAMP.IsEmpty then
    begin
      sSqlWhere := sSqlWhere + ' AND EXISTS (SELECT 1 ' +
                                              'FROM aet_estrab ' +
                                             'WHERE et_tipo = ''EP'' ' +
                                               'AND et_fechabaja is null ' +
                                               'AND et_idcarpetaamp = TO_NUMBER(ar_clave) ';

      if fraEmpresaAMP.IsSelected then
        begin
          sSqlWhere := sSqlWhere + ' AND ET_CUIT = ' + SqlValue(fraEmpresaAMP.Cuit);

          if fraEstablecimientoAMP.IsSelected then
            sSqlWhere := sSqlWhere + ' AND ET_ESTABLECI = ' + SqlValue(fraEstablecimientoAMP.NroEstablecimiento);
        end;

      if fraTrabajadorAMP.IsSelected then
        sSqlWhere := sSqlWhere + ' AND ET_CUIL = ' + SqlValue(fraTrabajadorAMP.Cuil);

      if edOperativoAMP.Periodo.Valor <> '' then
        sSqlWhere := sSqlWhere + ' AND ET_PERIODO = ' + SqlValue(edOperativoAMP.Periodo.Valor);

      if not edFechaExamenAMP.IsEmpty then
        sSqlWhere := sSqlWhere + ' AND ET_FECHA = ' + SqlValue(edFechaExamenAMP.Date);

      sSqlWhere := sSqlWhere + ')';
    end;

  sSqlWhere := sSqlWhere + SqlBetween(' AND TO_NUMBER(AR_CLAVE) ', edCarpetaDesdeAMP.Value, edCarpetaHastaAMP.Value);

  sSql := sSqlSelect + sSqlFrom + sSqlWhere;

  if fraEmpresaCD.IsSelected then
    begin
      AddTable(sSql, 'cca_carta');
      AddTable(sSql, 'aen_endoso');
      AddCondition(sSql, 'ca_nrocartadoc = ar_clave');
      AddCondition(sSql, 'ca_idendoso = en_id');
      AddCondition(sSql, 'ca_fechabaja is null');
      AddCondition(sSql, 'en_contrato = ' + SqlValue(fraEmpresaCD.Contrato));
    end;

  if fraTrabajadorSiniestroCD.IsSelected then
    begin
      sSql2 := sSql;
      sSql3 := sSql;

      AddTable(sSql2, 'cca_carta');
      AddCondition(sSql2, 'ca_nrocartadoc = ar_clave');
      AddCondition(sSql2, 'ca_fechabaja is null');
      AddCondition(sSql2, 'ca_idexpediente = ' + SqlValue(fraTrabajadorSiniestroCD.IdSiniestro));

      AddTable(sSql3, 'cdo_cartasdocumento');
      AddCondition(sSql3, 'do_nrocartadoc = ar_clave');
      AddCondition(sSql3, 'do_siniestro = ' + SqlValue(fraTrabajadorSiniestroCD.edSiniestro.Siniestro));
      AddCondition(sSql3, 'do_orden = ' + SqlValue(fraTrabajadorSiniestroCD.edSiniestro.Orden));
      AddCondition(sSql3, 'do_recaida = ' + SqlValue(fraTrabajadorSiniestroCD.edSiniestro.Recaida));

      sSql := sSql2 + ' UNION ' + sSql3;
    end;

  sSql := 'SELECT DISTINCT ROWNUM ' + SMCampoFila + ', A.* ' +
            'FROM (' + sSql + ') A';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited RefreshData;

  FFiltradoPorUltSolicitud := cbSoloUltimaSolicitud.Checked;

  if FCrear and
    (sdqConsulta.IsEmpty) and
    (not VerificarClaveExiste(fraFiltroArchivoBusqueda.Tipo, fraFiltroArchivoBusqueda.Clave, rarId)) then
  begin
     iResp := MsgBox('No se conoce la ubicación de la carpeta indicada o es una carpeta nueva. '
                     + #13+#10 +
                     'Puede indicar la localización física ahora. Si presiona NO se creará en la ADMINISTRADORA.'
                     + #13+#10 +
                     '¿Desea indicar la localización física?',
                     MB_ICONQUESTION or MB_YESNOCANCEL, 'Ubicación de la carpeta desconocida');

    if (iResp = idYes) and TfrmUbicacionActual.SeleccionarUbicacion(ATipoUbicacion, AUbicacion) then
    begin
      CrearArchivo(fraFiltroArchivoBusqueda.Tipo, fraFiltroArchivoBusqueda.Clave, ATipoUbicacion, AUbicacion);
      MessageDlg('La carpeta se creó ubicada en: ' + ATipoUbicacion + ' ' +
                  AUbicacion, mtInformation, [mbOK], 0);
    end
    else if iResp = idNo then
    begin
      sObservac := '';
      if fraFiltroArchivoBusqueda.IsTipoArchivoCaja() then
        begin
          bAceptar := Get_ObservacionesCaja(True, '', sObservac);

          if bAceptar and not IsEmptyString(sObservac) then
            bGrabar   := True
          else
            bGrabar := False;
        end
      else
        bGrabar := True;

      if bGrabar then
        begin
          CrearArchivo(fraFiltroArchivoBusqueda.Tipo, fraFiltroArchivoBusqueda.Clave,
                       TIPOUBICACION_GUARDA, '', sObservac);

          MessageDlg('La carpeta se creó ubicada en la ADMINISTRADORA.', mtInformation, [mbOK], 0);
        end;
    end;
    sdqConsulta.Refresh;
  end;

  InicializarContadores;
  HideUnassignedCols(Grid.Columns);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.CrearArchivo(AIdTipoArchivo : Integer; AClave : String; ATipoUbicacion, AUbicacion : String; Observaciones : String = '');
begin
  DoInsertArchivo(AIdTipoArchivo, ATipoUbicacion, AUbicacion, 0, '', '', AClave, True, Observaciones);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.ClearData;
begin
  cbGuardaDigitalizacion.Checked  := False;
  cbUsuario.Checked               := False;
  cbOtrasUbic.Checked             := False;
  cbDyG.Checked                   := False;
  cbExtraviadas.Checked           := False;
  cbPendienteDevolucion.Checked   := False;
  cbSolicitadoOtroUsuario.Checked := False;
  cbConMotivoRetencion.Checked    := False;
  cbSoloUltimaSolicitud.Checked   := True;
  cbSolicitudesCanceladas.Checked := False;
  chkEnResguardo.Checked          := False;

  fraSectoresBusqueda.Clear;
  fraUsuariosBusqueda.Clear;
  edFechaMovimientoDesde.Clear;
  edFechaMovimientoHasta.Clear;
  fraEstudiosCarpeta.Clear;
  edCodigoArchivo.Clear;
  edNroCajaDesde.Clear;
  edNroCajaHasta.Clear;

  fraEmpresaCD.Clear;
  fraTrabajadorSiniestroCD.Clear;

  fraEmpresaAMP.Clear;
  fraEstablecimientoAMP.Clear;
  fraTrabajadorAMP.Clear;
  edOperativoAMP.Clear;
  edFechaExamenAMP.Clear;
  edCarpetaDesdeAMP.Clear;
  edCarpetaHastaAMP.Clear;

  fraFiltroArchivoBusqueda.clear;
  fraFiltroArchivoBusquedaOnArchivoChange(nil);

  edtFechaDesde.Clear;
  edtFechaHasta.Clear;
  edtFechaRecepDesde.Clear;
  edtFechaRecepHasta.Clear;
  fraUsuariosSolicitud.Clear;
  ChkGrp.Clear(false);
  rgEstado.ItemIndex := 4;
  edFExtraviadaDesde.Clear;
  edFExtraviadaHasta.Clear;

  edFechaRemitoDesde.Clear;
  edFechaRemitoHasta.Clear;
  edRemitoDesde.Clear;
  edRemitoHasta.Clear;
  cbRemitoGenerado.Checked := False;

  edFechaSolicitudDesde.Clear;
  edFechaSolicitudHasta.Clear;
  edFechaEstadoDesde.Clear;
  edFechaEstadoHasta.Clear;
  cmbEstadosCarpeta.Clear;
  fraUsuEstadoCarpeta.Clear;
  chkSoloCarpetasUsuLog.Checked       := False;
  chkSoloCarpetasPendRecepGyD.Checked := False;
  chkSoloCarpetasPendDevolGyD.Checked := False;

  tslCheckeados.Clear;

  InicializarContadores;

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
  tslCheckeados.Free;

  {$IFNDEF ADMGRALARCHIVO}
  DoSuspenderCarpetasEnTransitoUsu;
  {$ENDIF}
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.FSFormShow(Sender: TObject);
begin
  inherited;
  fraFiltroArchivoBusqueda.ResetSelection;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.MostrarPropiedades(Grilla: TDBGrid; CampoARId: String; VerImagenes: Boolean = False): Boolean;
var
  sIdArchivos: String;
  sdq: TDataSet;
  APointer: TBookMark;
  bEncontroFila, bGrillaSelChequeados: Boolean;
  i: Integer;
begin
  sdq := Grilla.DataSource.DataSet;
  Verificar(not sdq.Active or sdq.IsEmpty, Grilla, 'La grilla está vacía');

  bGrillaSelChequeados := (Grilla.Name = 'Grid');
  bEncontroFila        := False;

  if not sdq.IsEmpty and ((bGrillaSelChequeados and (tslCheckeados.Count <= 1)) or (not bGrillaSelChequeados and (Grilla.SelectedRows.Count <= 1))) then
    begin
      if bGrillaSelChequeados then
        begin
          with sdq do
            begin
              APointer := GetBookmark;
              DisableControls;
              try
                First;
                while not Eof do
                  begin
                    if IsSMFilaSeleccionada(tslCheckeados, sdq, SMCampoFila) then
                      begin
                        bEncontroFila := True;
                        TFrmDetalleArchivo.MostrarDetalleArchivo(self, sdq.FieldByName(CampoARId).AsInteger, VerImagenes);

                        Break;
                      end;

                    Next;
                  end;
              finally
                GotoBookmark(APointer);
                EnableControls;
              end;

              if not bEncontroFila then
                TFrmDetalleArchivo.MostrarDetalleArchivo(self, sdq.FieldByName(CampoARId).AsInteger, VerImagenes);
            end;
        end
      else
        TFrmDetalleArchivo.MostrarDetalleArchivo(self, sdq.FieldByName(CampoARId).AsInteger, VerImagenes);
    end
  else
    begin
      sIdArchivos := '';

      with sdq do
        begin
          APointer := GetBookmark;
          DisableControls;
          try
            if bGrillaSelChequeados then
              begin
                First;
                while not Eof do
                  begin
                    if IsSMFilaSeleccionada(tslCheckeados, sdq, SMCampoFila) then
                      sIdArchivos := sIdArchivos + FieldByName(CampoARId).AsString + ', ';

                    Next;
                  end;
              end
            else
              begin
                for i := 0 to Grilla.SelectedRows.Count-1 do
                  begin
                    GotoBookmark(pointer(Grilla.SelectedRows.Items[i]));

                    sIdArchivos := sIdArchivos + FieldByName(CampoARId).AsString + ', ';
                  end;
              end;
          finally
            GotoBookmark(APointer);
            EnableControls;
          end;
        end;

      sIdArchivos := CutRight(sIdArchivos, 2);

      TFrmDetalleArchivo.MostrarDetalleArchivos(self, sIdArchivos, VerImagenes);
    end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbPropiedadesClick(Sender: TObject);
begin
  MostrarPropiedades(Grid, 'AR_ID');
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuSolicitarResaltadoClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    TFrmSolicitudCarpeta.AltaSolicitudArchivo(sdqConsulta.FieldByName('ar_id').AsInteger);
    RefreshData;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuSolicitarMultipleClick(Sender: TObject);
begin
  TFrmSolicitudCarpeta.ShowSolicitudes;
  RefreshData;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.GridDblClick(Sender: TObject);
begin
  MostrarPropiedades(Grid, 'AR_ID');
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbEnviarSolicitudesClick(Sender: TObject);
var
  FIdEnvio, IdSolicitud: TTableId;
  APointer: TBookMark;
begin
  if tslCheckeados.Count = 0  Then
    MsgBox('Debe seleccionar al menos una fila para poder realizar el envio de solicitudes.', MB_ICONEXCLAMATION)
  else
  begin
    BeginTrans;
    try
      FIdEnvio := GetSecNextVal('seq_ren_id');

      APointer := sdqConsulta.GetBookmark;
      sdqConsulta.DisableControls;
      try
        with sdqConsulta do
          begin
            First;
            while not Eof do
              begin
                if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                  begin
                    if not sdqConsulta.FieldByName('sc_id').IsNull then
                      begin
                        IdSolicitud := sdqConsulta.FieldByName('sc_id').AsInteger;
                        EnviarSolicitud(FIdEnvio, IdSolicitud);
                      end;
                  end;

                Next;
              end;
          end;
      finally
        sdqConsulta.GotoBookmark(APointer);
        sdqConsulta.EnableControls;
      end;

      CommitTrans(true);
    except
      RollBack;
      raise;
    end;

    EnviarSolicitudPorMail(IntToStr(FIdEnvio), True);
    RefreshData;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbObservacionesSolicitudClick(Sender: TObject);
var
  Observac: TStringList;
  bAceptar: Boolean;
  sSql: String;
  APointer, APrinPointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'Debe seleccionar una solicitud de la grilla.');

  APrinPointer := nil;
  APointer     := sdqConsulta.GetBookmark;
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                Verificar(sdqConsulta.FieldByName('SC_ID').IsNull, nil, 'Alguna de las filas seleccionadas no corresponde a una solicitud.');

                if APrinPointer = nil then
                  APrinPointer := sdqConsulta.GetBookmark;
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Observac := TStringList.Create();
  with Observac do
    try
      if tslCheckeados.Count = 1 then
        begin
          sdqConsulta.GotoBookmark(APrinPointer);
          Text := sdqConsulta.FieldByName('SC_OBSERVACPENDIENTE').AsString
        end
      else
        Text := '';

      bAceptar := InputMemoBox('Observaciones', Observac, False, 250);

      if bAceptar then
        begin
          sdqConsulta.DisableControls;
          try
            with sdqConsulta do
              begin
                First;
                while not Eof do
                  begin
                    if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                      begin
                        sSql := 'UPDATE RSC_SOLICITUDCARPETA ' +
                                   'SET SC_OBSERVACPENDIENTE = :Observ ' +
                                 'WHERE SC_ID = :Id';
                        EjecutarSqlEx(sSql, [Trim(Observac.Text), sdqConsulta.FieldByName('SC_ID').AsInteger]);
                      end;

                    Next;
                  end;
              end;
          finally
            sdqConsulta.GotoBookmark(APointer);
            sdqConsulta.EnableControls;
          end;

          mnuUnselectAllClick(nil);
          sdqConsulta.Refresh;
        end;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbRecepcionCarpetasClick(Sender: TObject);
begin
  if fpRecepcionCarpetas.ShowModal = mrOk then
    RefreshData;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarRecepcionCarpeta: Boolean;
var
  sSql: String;
begin
  Verificar(not fraFiltroArchivoRecCarpeta.IsCompleted, fraFiltroArchivoRecCarpeta.fraTipoArchivo.cmbDescripcion, 'Debe completar los datos de la carpeta');

  sSql := 'SELECT 1 ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RSC_SOLICITUDCARPETA, RAR_ARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_ID = SC_IDARCHIVO(+) ' +
             'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoRecCarpeta.Tipo) + ' ' +
             'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoRecCarpeta.Clave) + ' ' +
             'AND SC_FECHARECEPCION IS NULL ' +
             'AND SC_FECHAIMPRESION IS NOT NULL';

  Verificar(not ExisteSql(sSql), fraFiltroArchivoRecCarpeta.fraTipoArchivo.cmbDescripcion, 'La carpeta debe estar pendiente de entrega por G&&D');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnAceptarRecepClick(Sender: TObject);
begin
  if ValidarRecepcionCarpeta then
    begin
      DoPerderFoco(Grid, Grid);
      if fraFiltroArchivoRecCarpeta.HuboError then
        Exit;

      DoRecepcionCarpeta(fraFiltroArchivoRecCarpeta.Tipo, fraFiltroArchivoRecCarpeta.Clave, True);
      fraFiltroArchivoRecCarpeta.ClearArchivo(False);
    end;

  if fraFiltroArchivoRecCarpeta.CodigoBarrasOk then
    fraFiltroArchivoRecCarpetabtnCargarCodigoBarrasClick(Sender);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.DoRecepcionCarpeta(Tipo: Integer; Clave: String; EsRecepcion: Boolean);
var
  sUsuarioSolicitud, sSql: String;
  IdRAR, IdRCS: TTableId;
begin
  IdRAR := GetIdArchivo(Tipo, Clave);

  sSql := 'SELECT MIN(SC_ID) ' +
            'FROM RSC_SOLICITUDCARPETA ' +
           'WHERE SC_IDARCHIVO = ' + SqlValue(IdRAR) + ' ' +
             'AND SC_FECHARECEPCION IS NULL ' +
             'AND SC_FECHAIMPRESION IS NOT NULL';
  IdRCS := ValorSqlInteger( sSql );

  sSql := 'SELECT SC_USUARIOSOLICITUD ' +
            'FROM RSC_SOLICITUDCARPETA ' +
           'WHERE SC_ID = ' + SqlValue(IdRCS);
  sUsuarioSolicitud := ValorSql(sSql);

  if EsRecepcion then
    BeginTrans;

  try
    sSql := 'UPDATE RSC_SOLICITUDCARPETA ' +
               'SET SC_FECHARECEPCION = SYSDATE, ' +
                   'SC_FECHAPREVISTADEVOLUCION = ACTUALDATE + (SELECT PA_VALOR ' +
                                                                'FROM RPA_PARAMETRO ' +
                                                               'WHERE PA_ID = ' + SqlValue(PARAMETRO_DIASRETENCION) + '), ' +
                   'SC_USUMODIF = ' + SqlValue(Sesion.UserId) + ', ' +
                   'SC_FECHAMODIF = ACTUALDATE ' +
             'WHERE SC_ID = ' + SqlValue(IdRCS);
    EjecutarSqlST( sSql );

    DoRecepcionarCarpetaUsuario(IdRAR, sUsuarioSolicitud);
    DoModificarEstadoCarpeta(IdRAR, ESTADOCARPETA_ENTRANSITO_USU, False);

    if EsRecepcion then
      begin
        CommitTrans;
        FHuboCambiosCarpetas := True;

        DoInsertarRegRecepCarpeta(Tipo, Clave, sUsuarioSolicitud);
      end;
  except
    on E:Exception do
      begin
        if EsRecepcion then
          RollBack;

        Raise Exception.Create ( E.Message + CRLF + 'Error al recepcionar la carpeta' );
      end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fpRecepcionCarpetasEnter(Sender: TObject);
begin
  fraFiltroArchivoRecCarpeta.Clear;
  FHuboCambiosCarpetas := False;

  cdsRecepCarpeta.Open;
  sdqRecepCarpeta.Close;
  edCantCarpetasRecep.Value := 0;
  VCLExtra.LockControl(edCantCarpetasRecep);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnCancelarRecepClick(Sender: TObject);
begin
  if FHuboCambiosCarpetas then
    fpRecepcionCarpetas.ModalResult := mrOk
  else
    fpRecepcionCarpetas.ModalResult := mrCancel;

  cdsRecepCarpeta.Close;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.DoInsertarRegRecepCarpeta(Tipo: Integer; Clave, UsuarioSolicitud: String);
var
  sSql: String;
  qry: TSDQuery;
begin
  sSql := 'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) AR_DESCRIPCIONCLAVE ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_TIPO = ' + SqlValue(Tipo) + ' ' +
             'AND AR_CLAVE = ' + SqlValue(Clave);

  qry := GetQuery(sSql);
  try
    with cdsRecepCarpeta do
      begin
        Insert;

        FieldByName('TA_DESCRIPCION').AsString      := qry.FieldByName('TA_DESCRIPCION').AsString;
        FieldByName('AR_DESCRIPCIONCLAVE').AsString := qry.FieldByName('AR_DESCRIPCIONCLAVE').AsString;
        FieldByName('SC_USUARIOSOLICITUD').AsString := UsuarioSolicitud;

        Post;
      end;
  finally
    qry.Free;
  end;

  edCantCarpetasRecep.Value := cdsRecepCarpeta.RecordCount;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbDevolucionCarpetasClick(Sender: TObject);
begin
  tbDevolucionCarpetas.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnCancelarDevolClick(Sender: TObject);
begin
  if FHuboCambiosCarpetas then
    fpDevolucionCarpetas.ModalResult := mrOk
  else
    fpDevolucionCarpetas.ModalResult := mrCancel;

  cdsDevolCarpeta.Close;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fpDevolucionCarpetasEnter(Sender: TObject);
begin
  fraFiltroArchivoDevolCarpeta.Clear;
  FHuboCambiosCarpetas := False;

  cdsDevolCarpeta.Open;
  sdqDevolCarpeta.Close;
  edCantCarpetasDevol.Value := 0;
  edNroCajaDevolCarpeta.Clear;
  edCantCuerposDevolCarpeta.Clear;
  edObservDevolCarpeta.Clear;
  chkMoverAdminDevolCarpeta.Checked := False;

  VCLExtra.LockControl(edCantCarpetasDevol);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnAceptarDevolClick(Sender: TObject);
var
  iNroCantCuerposDevolAnt, iNroCajaDevolAnt: Integer;
  bMoverAdminDevolCarpeta: Boolean;
begin
  if ValidarDevolucionCarpeta then
    begin
      DoPerderFoco(Grid, Grid);
      if fraFiltroArchivoDevolCarpeta.HuboError then
        Exit;

      DoDevolucionCarpeta(fraFiltroArchivoDevolCarpeta.Tipo, fraFiltroArchivoDevolCarpeta.Clave, edObservDevolCarpeta.Lines.Text, edNroCajaDevolCarpeta.Value, edCantCuerposDevolCarpeta.Value, chkMoverAdminDevolCarpeta.Checked);
      iNroCajaDevolAnt        := edNroCajaDevolCarpeta.Value;
      iNroCantCuerposDevolAnt := edCantCuerposDevolCarpeta.Value;
      bMoverAdminDevolCarpeta := chkMoverAdminDevolCarpeta.Checked;
      fraFiltroArchivoDevolCarpeta.ClearArchivo(False);
      edNroCajaDevolCarpeta.Value       := iNroCajaDevolAnt;
      edCantCuerposDevolCarpeta.Value   := iNroCantCuerposDevolAnt;
      chkMoverAdminDevolCarpeta.Checked := bMoverAdminDevolCarpeta;
      edObservDevolCarpeta.Clear;
    end;

  if fraFiltroArchivoDevolCarpeta.CodigoBarrasOk then
    fraFiltroArchivoDevolCarpetabtnCargarCodigoBarrasClick(Sender);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarDevolucionCarpeta: Boolean;
var
  sUsuSolicitud, sDescrEstado, sEstado, sSql, sSql2: String;
begin
  sSql := 'SELECT SC_USUARIOSOLICITUD ' +
            'FROM RSC_SOLICITUDCARPETA, RAR_ARCHIVO ' +
           'WHERE AR_ID = SC_IDARCHIVO(+) ' +
             'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoDevolCarpeta.Tipo) + ' ' +
             'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoDevolCarpeta.Clave) + ' ' +
             'AND SC_FECHADEVOLUCION IS NULL ' +
             'AND SC_FECHARECEPCION IS NOT NULL';
  sUsuSolicitud := ValorSql(sSql);

  sSql2 := 'SELECT 1 ' +           // si la carpeta estaba extraviada y se la movieron a un usuario, entonces no tengo registro en la RSC_SOLICITUDCARPETA, pero la ubicación de la misma es Usuario
             'FROM RAR_ARCHIVO ' +
            'WHERE AR_TIPO = ' + SqlValue(fraFiltroArchivoDevolCarpeta.Tipo) + ' ' +
              'AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoDevolCarpeta.Clave) + ' ' +
              'AND AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO);

  Verificar(not fraFiltroArchivoDevolCarpeta.IsCompleted, fraFiltroArchivoDevolCarpeta.fraTipoArchivo.cmbDescripcion, 'Debe completar los datos de la carpeta');
  Verificar(not Is_CarpetaExtraviada(fraFiltroArchivoDevolCarpeta.Tipo, fraFiltroArchivoDevolCarpeta.Clave) and IsEmptyString(sUsuSolicitud) and not ExisteSql(sSql2), fraFiltroArchivoDevolCarpeta.fraTipoArchivo.cmbDescripcion, 'La carpeta debe estar recepcionada y pendiente de devolución');

  Verificar(edNroCajaDevolCarpeta.IsEmpty, edNroCajaDevolCarpeta, 'Debe indicar el nro. de caja');
  Verificar(edCantCuerposDevolCarpeta.Value < 1, edCantCuerposDevolCarpeta, 'La cantidad de cuerpos debe ser mayor o igual a 1');

  sEstado := Get_EstadoCarpeta(fraFiltroArchivoDevolCarpeta.IdArchivo, sDescrEstado);

  if not IsEmptyString(sEstado) then
    begin
      Verificar(not AreIn(sEstado, [ESTADOCARPETA_ENTRANSITO_USU, ESTADOCARPETA_PODERUSUARIO, ESTADOCARPETA_TRANSITO_A_GYD]), fraFiltroArchivoDevolCarpeta.fraTipoArchivo.cmbDescripcion, 'La carpeta debe estar En Tránsito al Usuario, En Poder del Usuario o En Tránsito a GyD.');

      if sEstado <> ESTADOCARPETA_TRANSITO_A_GYD then
        if MsgBox(Iif(IsEmptyString(sUsuSolicitud), '', 'Carpeta solicitada por: ' + sUsuSolicitud + ', en ') + 'Estado: ' + sDescrEstado + '. ¿Confirma su devolución?', MB_ICONQUESTION+MB_YESNO ) = ID_NO then
          Abort;
    end;

  if Is_CarpetaEnResguardo(fraFiltroArchivoDevolCarpeta.Tipo, fraFiltroArchivoDevolCarpeta.Clave) then
    if MsgBox('La carpeta se encuentra marcada como ''En Resguardo''. ¿Confirma su devolución?', MB_ICONQUESTION+MB_YESNO ) = ID_NO then
      Abort;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.DoInsertarRegDevolCarpeta(Tipo: Integer; Clave: String);
var
  sSql: String;
  qry: TSDQuery;
begin
  sSql := 'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) AR_DESCRIPCIONCLAVE, AR_CAJA, AR_CANTCUERPOS ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_TIPO = ' + SqlValue(Tipo) + ' ' +
             'AND AR_CLAVE = ' + SqlValue(Clave);

  qry := GetQuery(sSql);
  try
    with cdsDevolCarpeta do
      begin
        Insert;

        FieldByName('TA_DESCRIPCION').AsString      := qry.FieldByName('TA_DESCRIPCION').AsString;
        FieldByName('AR_DESCRIPCIONCLAVE').AsString := qry.FieldByName('AR_DESCRIPCIONCLAVE').AsString;
        FieldByName('AR_CAJA').AsInteger            := qry.FieldByName('AR_CAJA').AsInteger;
        FieldByName('AR_CANTCUERPOS').AsInteger     := qry.FieldByName('AR_CANTCUERPOS').AsInteger;

        Post;
      end;
  finally
    qry.Free;
  end;

  edCantCarpetasDevol.Value := cdsDevolCarpeta.RecordCount;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.DoDevolucionCarpeta(Tipo: Integer; Clave, Observaciones: String; NroCaja, CantCuerpos: Integer; MoverCarpetaAdmin: Boolean);
var
  sEstado, sTipoUbic, sUbic, sUsuarioSolicitudPend, sUsuarioSolicitud, sSql: String;
  IdRAR, IdRCS, IdRCS2: TTableId;
  bRecepcCarpeta: Boolean;
begin
  IdRAR := GetIdArchivo(Tipo, Clave);

  sSql := 'SELECT MIN(SC_ID) ' +
            'FROM RSC_SOLICITUDCARPETA ' +
           'WHERE SC_IDARCHIVO = ' + SqlValue(IdRAR) + ' ' +
             'AND SC_FECHADEVOLUCION IS NULL ' +
             'AND SC_FECHARECEPCION IS NOT NULL';
  IdRCS := ValorSqlInteger( sSql );

  sSql := 'SELECT SC_USUARIOSOLICITUD ' +
            'FROM RSC_SOLICITUDCARPETA ' +
           'WHERE SC_ID = ' + SqlValue(IdRCS);
  sUsuarioSolicitud := ValorSql(sSql);

  BeginTrans;
  try
    sSql := 'UPDATE RSC_SOLICITUDCARPETA ' +
               'SET SC_FECHADEVOLUCION = ACTUALDATE, ' +
                   'SC_OBSERVACIONES =' + SqlValue(Observaciones) + ' ' +
             'WHERE SC_ID = ' + SqlValue(IdRCS);
    EjecutarSqlST( sSql );

    sSql := 'SELECT MAX(SC_ID) ' +
              'FROM RSC_SOLICITUDCARPETA ' +
             'WHERE SC_IDARCHIVO = ' + SqlValue(IdRAR) + ' ' +
               'AND SC_FECHARECEPCION IS NULL';
    IdRCS2 := ValorSqlInteger( sSql, ART_EMPTY_ID );

    if IdRCS2 = ART_EMPTY_ID then
      bRecepcCarpeta := False
    else
      begin
        sSql := 'SELECT SC_USUARIOSOLICITUD ' +
                  'FROM RSC_SOLICITUDCARPETA ' +
                 'WHERE SC_ID = ' + SqlValue(IdRCS2);
        sUsuarioSolicitudPend := ValorSql(sSql);

        MsgBox('Hay una solicitud pendiente de la carpeta para el usuario: ' + sUsuarioSolicitudPend + '. La carpeta se asignará a dicho usuario.', MB_ICONINFORMATION);
        bRecepcCarpeta := True;
      end;

    if bRecepcCarpeta then
      DoRecepcionCarpeta(Tipo, Clave, False)
    else
      begin
        if MoverCarpetaAdmin then
          begin
            sTipoUbic := TIPOUBICACION_GUARDA;
            sUbic     := UBICACION_GD;
            sEstado   := ESTADOCARPETA_ADMINISTRADORA;
          end
        else
          begin
            sTipoUbic := TIPOUBICACION_LUGAR;
            sUbic     := UBIC_GyD;
            sEstado   := ESTADOCARPETA_PODER_GYD;
          end;

        sSql := 'UPDATE RAR_ARCHIVO ' +
                   'SET AR_TIPOUBICACION = ' + SqlValue(sTipoUbic) + ', ' +
                       'AR_UBICACION = ' + SqlValue(sUbic) + ', ' +
                       'AR_FECHAMOVIMIENTO = SYSDATE' + ', ' +
                       'AR_IDABOGADO = NULL, ' +
                       'AR_RECEPTOR =  ' + SqlValue(Sesion.UserId) + ', ' +
                       'AR_EMISOR = ' + SqlValue(sUsuarioSolicitud) + ', ' +
                       'AR_CAJA = ' + SqlValue(NroCaja) + ', ' +
                       'AR_CANTCUERPOS = ' + SqlValue(CantCuerpos) + ', ' +
                       'AR_OBSERVACIONES = ' + SqlValue(Observaciones) + ' ' +
                 'WHERE AR_ID = ' + SqlValue(IdRAR);
        EjecutarSqlST( sSql );

        DoModificarEstadoCarpeta(IdRAR, sEstado, False);
      end;

    CommitTrans;

    FHuboCambiosCarpetas := True;

    DoInsertarRegDevolCarpeta(Tipo, Clave);
  except
    on E:Exception do
      begin
        RollBack;
        Raise Exception.Create ( E.Message + CRLF + 'Error al devolver la carpeta' );
      end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbMovimientoCarpetasClick(Sender: TObject);
begin
  with TfrmMovimientoCarpetas.Create(nil) do
    try
      if ShowModal = mrOk then
        RefreshData;
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  if ValidarCancelarSolicitud then
    begin
      BeginTrans(True);
      try
        sSql := 'UPDATE RSC_SOLICITUDCARPETA ' +
                   'SET SC_FECHARECEPCION = SYSDATE, ' +
                       'SC_USUMODIF = ' + SqlValue(Sesion.UserId) + ', ' +
                       'SC_FECHAMODIF = ACTUALDATE, ' +
                       'SC_FECHADEVOLUCION = ACTUALDATE, ' +
                       'SC_OBSERVACIONES = ' + SqlValue('CANCELADA POR ' + Sesion.UserId) + ' ' +
                 'WHERE SC_ID = ' + SqlValue(sdqConsulta.FieldByName('SC_ID').AsInteger);
        EjecutarSqlST( sSql );

        CancelarSolicitudPorMail(sdqConsulta.FieldByName('SC_ID').AsInteger, False);
        CambiarEstadoSolicitudCarpeta(sdqConsulta.FieldByName('AR_ID').AsInteger);

        MessageDlg('Solicitud cancelada correctamente.', mtInformation, [mbOK], 0);
        CommitTrans(True);

        RefreshData;
      except
        on E:Exception do
          begin
            Rollback(True);
            Raise Exception.Create ( E.Message + CRLF + 'Error al cancelar la solicitud' );
          end;
      end;
    end;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarCancelarSolicitud: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía');
  Verificar(tslCheckeados.Count <> 1, Grid, 'Debe seleccionar exactamente una fila de la grilla');
  Verificar(sdqConsulta.FieldByName('SC_ID').IsNull, Grid, 'No ha seleccionado ninguna solicitud');
  Verificar(not sdqConsulta.FieldByName('SC_FECHARECEPCION').IsNull, Grid, 'La solicitud ya fue entregada al usuario');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure EnviarSolicitudPorMail(ListaIdEnvio: String; ConTrans : Boolean);
var
  sSql, sTempFile: string;
  sdqEnvio: TSDQuery;
begin
//  IniciarEspera('Enviando correo...');
  try
    VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION :=
        get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);

    VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
        get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

    sSql := 'SELECT ar_id, ta_descripcion "Tipo Archivo", ' +
                   'DECODE (ar_tipoubicacion, ' +
                            '''D'', ''Delegación'', ' +
                            '''L'', ''Lugar'', ' +
                            '''S'', ''Sector'', ' +
                            '''U'', ''Usuario'', ' +
                            '''G'', ''Administradora'') "Tipo Ubicación", ' +
                   'art.archivo.getubicacionnombre (ar_tipoubicacion, ar_ubicacion) "Ubicación", ' +
                   'ar_fechamovimiento "Movimiento", ar_caja "Caja", ar_receptor "Receptor", ar_emisor "Emisor", ' +
                   'archivo.getdescripcionclave (tc_id, ar_clave) "Clave", ' +
                   'sc_fechasolicitud "Fecha Solicitud", sc_horasolicitud "Hora Solicitud", sc_usuariosolicitud "Usuario Solicitud", ' +
                   'sc_tiposolicitud "Tipo Solicitud", sc_fecharecepcion "Fecha Recepción", ' +
                   'DECODE(sc_tiposolicitud, ''1'', ''2 HORAS'', ''2'', ''4 HORAS'', ''3'', ''24 HORAS'') sc_tiposolicitud, ' +
                   'sc_observaciones "Observaciones Solicitud", se_mail, se_nombre ' +
              'FROM rar_archivo r, rta_tipoarchivo t, rtc_tipoclave c, use_usuarios u, rsc_solicitudcarpeta s ' +
             'WHERE ar_tipo = ta_id ' +
               'AND ta_formulario = tc_clave ' +
               'AND ar_id = sc_idarchivo ' +
               'AND ar_ubicacion = se_usuario(+) ' +
               'AND sc_idenvio IN (' + ListaIdEnvio + ') ' +
               'AND ar_tipoubicacion = :tipoubicacion';

    //Envios a la Administradora ...
    sdqEnvio := GetQueryEx(sSql, [TIPOUBICACION_GUARDA]);
    try
      if not sdqEnvio.IsEmpty then
      begin
        sTempFile := GetTempFromFileName('Solicitud.xls');

       with sdqEnvio do
         begin
           FieldByName('AR_ID').Visible            := False;
           FieldByName('SE_MAIL').Visible          := False;
           FieldByName('SE_NOMBRE').Visible        := False;
           FieldByName('SC_TIPOSOLICITUD').Visible := False;
         end;

        with TDataToXLS.Create(nil) do
          try
            Title.Text := 'Solicitudes de Carpetas';
            DataSet := sdqEnvio;
            SaveToFile(sTempFile);
          finally
            Free;
          end;

        SendByMailServer(VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION,
           Sesion.UserId, '[Documentación] Solicitud de Carpetas', sTempFile,
           'Se ha adjuntado el archivo con la solicitud de carpetas',
           false, false, false, Sesion.UserId, ConTrans);

        SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,        // by nwk
           Sesion.UserId, '[Documentación] Solicitud de Carpetas', sTempFile,
           'Se ha adjuntado el archivo con la solicitud de carpetas',
           false, true, false, Sesion.UserId, ConTrans);
      end;

      sdqEnvio.Close;
      sdqEnvio.ParamByName('TipoUbicacion').AsString := TIPOUBICACION_USUARIO;
      sdqEnvio.Open;

      while not sdqEnvio.eof do
      begin
        SendByMailServer(sdqEnvio.FieldByName('se_mail').AsString,
           Sesion.UserId, '[Documentación] Solicitud de Carpetas', '',
           'Se solicita se entregue la carpeta del archivo de ' +
           sdqEnvio.FieldByName('Tipo Archivo').AsString + CRLF +
           ' Clave: ' + sdqEnvio.FieldByName('Clave').AsString + CRLF +
           ' Urgencia: ' + sdqEnvio.FieldByName('sc_tiposolicitud').AsString + CRLF +
           ' que se encuentra en su poder.' + CRLF + CRLF +
           'POR FAVOR, COMUNÍQUESE CON EL SECTOR DE DIGITALIZACIÓN Y GUARDA.',
           false, false, false, Sesion.UserId, ConTrans);

        SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
           Sesion.UserId, '[Documentación] Solicitud de Carpetas', '',
           'Se solicita la entrega de la carpeta del archivo de ' +
           sdqEnvio.FieldByName('Tipo Archivo').AsString + CRLF +
           ' Clave: ' + sdqEnvio.FieldByName('Clave').AsString + CRLF +
           ' Urgencia: ' + sdqEnvio.FieldByName('sc_tiposolicitud').AsString + CRLF +
           ' al usuario ' + sdqEnvio.FieldByName('se_nombre').AsString,
           false, false, false, Sesion.UserId, ConTrans);

        sdqEnvio.Next;
      end;
    finally
      sdqEnvio.Free;
    end;
  finally
//    DetenerEspera;
  end;
end;
{------------------------------------------------------------------------------}
procedure EnviarSolicitud(AIdEnvio : Integer; AIdSolicitud : Integer);
begin
  EjecutarSqlSTEx('UPDATE archivo.rsc_solicitudcarpeta rsc'  +
                  '   SET sc_fechaimpresion = sysdate,' +
                  '       sc_usuarioimpresion = :UsuAlta,' +
                  '       sc_idenvio          = :idenvio' +
                  ' WHERE sc_id = :sc_id', [Sesion.UserId, AIdEnvio, AIdSolicitud]);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.GetHorasSolicitud(TipoSolicitud: Integer): Integer;
var
  iHoras: Integer;
begin
  case TipoSolicitud of
    1: iHoras := 2;
    2: iHoras := 4;
    3: iHoras := 24;
  else
    iHoras := 0;
  end;

  Result := iHoras;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fraFiltroArchivoRecCarpetabtnCargarCodigoBarrasClick(Sender: TObject);
begin
  inherited;

  fraFiltroArchivoRecCarpeta.btnCargarCodigoBarrasClick(Sender);

  if fraFiltroArchivoRecCarpeta.CodigoBarrasOk then
    btnAceptarRecepClick(Sender);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fraFiltroArchivoDevolCarpetabtnCargarCodigoBarrasClick(Sender: TObject);
begin
  inherited;

  fraFiltroArchivoDevolCarpeta.btnCargarCodigoBarrasClick(Sender);

  if fraFiltroArchivoDevolCarpeta.CodigoBarrasOk then
    btnAceptarDevolClick(Sender);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.CancelarSolicitudPorMail(IdRSC: TTableId; ConTrans: Boolean);
var
  sSql: string;
  sdqEnvio: TSDQuery;
begin
  IniciarEspera('Enviando correo...');
  try
    VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION :=
        get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);

    VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
        get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

    sSql := 'SELECT ta_descripcion TipoArchivo, ' +
                   'archivo.getdescripcionclave (tc_id, ar_clave) Clave ' +
              'FROM rar_archivo r, rta_tipoarchivo t, rtc_tipoclave c,  rsc_solicitudcarpeta s ' +
             'WHERE ar_tipo = ta_id ' +
               'AND ta_formulario = tc_clave ' +
               'AND ar_id = sc_idarchivo ' +
               'AND sc_id = :scid';

    //Envios a la Administradora ...
    sdqEnvio := GetQueryEx(sSql, [IdRSC]);
    try
      if not sdqEnvio.IsEmpty then
      begin
        SendByMailServer(VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION,
           Sesion.UserId, '[Documentación] Cancelación de Solicitud de Carpetas', '',
           'Tipo Archivo: ' + sdqEnvio.FieldByName('TipoArchivo').AsString + CRLF +
           'Carpeta: ' + sdqEnvio.FieldByName('Clave').AsString,
           false, false, false, Sesion.UserId, ConTrans);

        SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
           Sesion.UserId, '[Documentación] Cancelación de Solicitud de Carpetas', '',
           'Tipo Archivo: ' + sdqEnvio.FieldByName('TipoArchivo').AsString + CRLF +
           'Carpeta: ' + sdqEnvio.FieldByName('Clave').AsString,
           false, false, false, Sesion.UserId, ConTrans);
      end;
    finally
      sdqEnvio.Free;
    end;
  finally
    DetenerEspera;
    Application.ProcessMessages;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fraFiltroArchivoBusquedaOnArchivoChange(Sender: TObject);
begin
  inherited;

  gbBusquedaGeneral2.Visible := (fraFiltroArchivoBusqueda.IsCartaDocumento());
  fraEmpresaCD.Clear;
  fraTrabajadorSiniestroCDtbLimpiarClick(nil);

  gbBusquedaGeneral3.Visible := (fraFiltroArchivoBusqueda.IsAMP());
  fraEmpresaAMP.Clear;
  fraEstablecimientoAMP.Clear;
  fraTrabajadorAMP.Clear;
  edOperativoAMP.Clear;
  edFechaExamenAMP.Clear;
  edCarpetaDesdeAMP.Clear;
  edCarpetaHastaAMP.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fraTrabajadorSiniestroCDtbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTrabajadorSiniestroCD.tbLimpiarClick(Sender);
  fraTrabajadorSiniestroCD.mskCUIL.Clear;
  fraTrabajadorSiniestroCD.cmbNombre.Clear;
  fraTrabajadorSiniestroCD.Contrato := ART_EMPTY_ID;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.CalcularFilasSel;
begin
  edCantSelecc.Value := tslCheckeados.Count;
  Grid.Repaint;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.InicializarContadores;
begin
  edCantSelecc.Value := 0;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbOrdenarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  inherited;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);

  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.GridCellClick(Column: TColumn);
begin
  inherited;

  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = SMCampoCheckBox) then
    begin
      DoSMMarcarDesmarcarFila(tslCheckeados, Grid, SMCampoFila);
      CalcularFilasSel;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuImprimirRemitoEstudioClick(Sender: TObject);
var
  IdLote: TTableId;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos una fila.');

  IdLote := VerificarRemito();
  Verificar(IdLote = ART_EMPTY_ID, nil, 'Solo puede seleccionar carpetas asignadas a Estudios Legales/Abogados y que sean todas del mismo Estudio.');

  ImprimirRemitoEstudio(IdLote);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.VerificarRemito: TTableId;
var
  sSql: String;
  v: integer;
  IdLote: TTableId;
  AnteriorAbogado: Integer;
  APointer: TBookMark;
begin
  Result          := ART_EMPTY_ID;
  AnteriorAbogado := -1;
  v := 0;

  BeginTrans;
  try
    IdLote := GetSecNextVal('seq_rlt_loteterceros');

    APointer := sdqConsulta.GetBookmark;
    sdqConsulta.DisableControls;
    try
      with sdqConsulta do
        begin
          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                begin
                  if sdqConsulta.FieldByName('AR_IDABOGADO').IsNull then
                    begin
                      AnteriorAbogado := -1;
                      Break;
                    end;

                  if sdqConsulta.FieldByName('AR_IDABOGADO').AsInteger <> AnteriorAbogado then
                    begin
                      inc(v);
                      AnteriorAbogado := sdqConsulta.FieldByName('AR_IDABOGADO').AsInteger;
                    end;

                  sSql := 'UPDATE RAR_ARCHIVO ' +
                             'SET AR_LOTE_ENTREGADOTERCEROS = :IdLote ' +
                           'WHERE AR_ID = :Id';
                  EjecutarSqlSTEx(sSql, [IdLote, sdqConsulta.FieldByName('AR_ID').AsInteger]);
                end;

              Next;
            end;
        end;
    finally
      sdqConsulta.GotoBookmark(APointer);
      sdqConsulta.EnableControls;
    end;

    if (v = 1) and (AnteriorAbogado <> -1) then
      begin
        Result := IdLote;
        CommitTrans;
      end
    else
      RollBack;
  except
    RollBack;
    raise;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.ImprimirRemitoEstudio(AIdLote: TTableId);
begin
  with TQrDetalleLoteEstudio.Create(self) do
  try
    ImprimirRemitoEstudio(AIdLote);
  finally
    free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbModificarClick(Sender: TObject);
var
  sObservac, sSql: String;
  bAceptar: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía');
  Verificar(tslCheckeados.Count <> 1, Grid, 'Debe seleccionar exactamente una fila de la grilla');
  Verificar(not Is_TipoArchivoCaja(sdqConsulta.FieldByName('AR_TIPO').AsInteger), Grid, 'Solo puede modificar las observaciones de un tipo de archivo correspondiente a una Caja');

  bAceptar := Get_ObservacionesCaja(False, sdqConsulta.FieldByName('AR_OBSERVACIONES').AsString, sObservac);

  if bAceptar then
    begin
      sSql := 'UPDATE RAR_ARCHIVO ' +
                 'SET AR_OBSERVACIONES = :Observaciones ' +
               'WHERE AR_ID = :Id';
      EjecutarSqlEx(sSql, [sObservac, sdqConsulta.FieldByName('AR_ID').AsInteger]);

      MessageDlg('Observaciones modificadas correctamente.', mtInformation, [mbOK], 0);
      mnuUnselectAllClick(nil);
      sdqConsulta.Refresh;

      if fraFiltroArchivoBusqueda.IsCompleted then      // así actualiza las observaciones en el fraFiltroArchivo
        begin
          fraFiltroArchivoBusqueda.edNumNumeroDesde.SetFocus;
          Grid.SetFocus;
        end;
    end;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.Get_ObservacionesCaja(Obligatorio: Boolean; ValorInicial: String; var Observaciones: String): Boolean;
var
  Observac: TStringList;
  bOk, bAceptar: Boolean;
begin
  bOk := False;

  Observac := TStringList.Create();
  with Observac do
    try
      repeat
        if not IsEmptyString(ValorInicial) then
          Observac.Add(ValorInicial);

        bAceptar := InputMemoBox('Observaciones', Observac, False, 2048);

        if bAceptar then
          if Obligatorio and IsEmptyString(Observac.Text) then
            InfoHint(nil, 'Debe ingresar las observaciones.')
          else
            begin
              bAceptar := False;
              bOk      := True;
            end;
      until not bAceptar;

      Observaciones := Trim(Observac.Text);
    finally
      Free;
    end;

  Result := bOk;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fraFiltroArchivoDevolCarpetaChange(Sender: TObject);
begin
  if fraFiltroArchivoDevolCarpeta.IsSelected  then
    begin
      if FUltTipoArchDevolCarpeta <> fraFiltroArchivoDevolCarpeta.Tipo then
        edNroCajaDevolCarpeta.Clear;

      edCantCuerposDevolCarpeta.Value := Get_CantCuerposCarpeta(fraFiltroArchivoDevolCarpeta.IdArchivo);
    end;

  FUltTipoArchDevolCarpeta := fraFiltroArchivoDevolCarpeta.Tipo;

  if fraFiltroArchivoDevolCarpeta.IsCompleted  and Is_CarpetaExtraviada(fraFiltroArchivoDevolCarpeta.Tipo, fraFiltroArchivoDevolCarpeta.Clave) then
    InfoHint(fraFiltroArchivoDevolCarpeta.fraTipoArchivo.cmbDescripcion, 'La carpeta se encuentra extraviada.');
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuImprimirEtiquetasClick(Sender: TObject);
var
  TipoArchivo: TTableId;
  sClave: String;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos una fila.');

  if MsgBox('¿Confirma la impresión de las etiquetas de las carpetas seleccionadas?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    begin
      APointer := sdqConsulta.GetBookmark;
      sdqConsulta.DisableControls;
      try
        with sdqConsulta do
          begin
            First;
            while not Eof do
              begin
                if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                  begin
                    TipoArchivo := sdqConsulta.FieldByName('AR_TIPO').AsInteger;
                    sClave      := sdqConsulta.FieldByName('AR_CLAVE').AsString;

                    DoImprimirEtiquetaCarpetaClave(TipoArchivo, sClave);
                  end;

                Next;
              end;
          end;
      finally
        sdqConsulta.GotoBookmark(APointer);
        sdqConsulta.EnableControls;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbReemplazoCarpetasClick(Sender: TObject);
begin
  with TfrmReemplazoCarpetas.Create(nil) do
    try
      ShowModal;
      if HuboReemplazosCarpetas then
        RefreshData;
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbRefrescarClick(Sender: TObject);
begin
  RefreshData;
end;
procedure TFrmConsultaCarpetas.tbSolicitarCarpetaClick(Sender: TObject);
begin
  tbSolicitarCarpeta.CheckMenuDropdown;
end;

{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbVerImagenesClick(Sender: TObject);
begin
  MostrarPropiedades(Grid, 'AR_ID', True);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarSelMultCarpeta: Boolean;
begin
  Verificar(not fraFiltroArchivoSelMultCarpeta.IsCompleted, fraFiltroArchivoSelMultCarpeta.fraTipoArchivo.cmbDescripcion, 'Debe completar los datos de la carpeta');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fpDetalleMultiplesCarpetasEnter(Sender: TObject);
begin
  GridSelMultCarpeta.UnSelectAll;
  fraFiltroArchivoSelMultCarpeta.Clear;

  cdsSelMultCarpeta.Close;
  cdsSelMultCarpeta.Open;
  sdqSelMultCarpeta.Close;
  edCantCarpetasSelMult.Value := 0;
  VCLExtra.LockControl(edCantCarpetasSelMult);

  fraFiltroArchivoSelMultCarpeta.fraTipoArchivo.edCodigo.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnAceptarSelMultClick(Sender: TObject);
begin
  GridSelMultCarpeta.SelectAll;
  Application.ProcessMessages;

  if MostrarPropiedades(GridSelMultCarpeta, 'AR_ID') then
    fpDetalleMultiplesCarpetasEnter(nil);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbDetallesMultCarpetasClick(Sender: TObject);
begin
  fpDetalleMultiplesCarpetas.ShowModal;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.DoInsertarRegSelMultCarpeta(Tipo: Integer; Clave: String);
var
  sSql: String;
  qry: TSDQuery;
begin
  sSql := 'SELECT TA_DESCRIPCION, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) AR_DESCRIPCIONCLAVE, AR_ID ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_TIPO = ' + SqlValue(Tipo) + ' ' +
             'AND AR_CLAVE = ' + SqlValue(Clave);

  qry := GetQuery(sSql);
  try
    with cdsSelMultCarpeta do
      begin
        Insert;

        FieldByName('AR_ID').AsInteger              := qry.FieldByName('AR_ID').AsInteger;
        FieldByName('TA_DESCRIPCION').AsString      := qry.FieldByName('TA_DESCRIPCION').AsString;
        FieldByName('AR_DESCRIPCIONCLAVE').AsString := qry.FieldByName('AR_DESCRIPCIONCLAVE').AsString;

        Post;
      end;
  finally
    qry.Free;
  end;

  edCantCarpetasSelMult.Value := cdsSelMultCarpeta.RecordCount;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnCancelarSelMultClick(Sender: TObject);
begin
  fpDetalleMultiplesCarpetas.ModalResult := mrOk;

  cdsSelMultCarpeta.Close;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnAgregarSelMultClick(Sender: TObject);
begin
  if ValidarSelMultCarpeta then
    begin
      DoPerderFoco(Grid, Grid);
      if fraFiltroArchivoSelMultCarpeta.HuboError then
        Exit;

      DoInsertarRegSelMultCarpeta(fraFiltroArchivoSelMultCarpeta.Tipo, fraFiltroArchivoSelMultCarpeta.Clave);
      fraFiltroArchivoSelMultCarpeta.ClearArchivo(False);
    end;
end;
{------------------------------------------------------------------------------}
{$IFDEF RED_PRES}
procedure TFrmConsultaCarpetas.OnEmpresaAMPChange(Sender: TObject);
begin
  fraEstablecimientoAMP.Contrato := fraEmpresaAMP.Contrato;
end;
{$ENDIF}
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.FSFormDestroy(Sender: TObject);
begin
  fraEstablecimientoAMP.Free;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbAgregarCuerposClick(Sender: TObject);
var
  sSql: String;
  iCantCuerpos: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía');
  Verificar(tslCheckeados.Count <> 1, Grid, 'Debe seleccionar exactamente una fila de la grilla');

  iCantCuerpos := InputBoxInteger('Cargar Cantidad de Cuerpos', 'Cuerpos', sdqConsulta.FieldByName('AR_CANTCUERPOS').AsInteger, 1, 999);

  if iCantCuerpos >= 1 then
    begin
      sSql := 'UPDATE RAR_ARCHIVO ' +
                 'SET AR_CANTCUERPOS = :CantCuerpos ' +
               'WHERE AR_ID = :Id';
      EjecutarSqlEx(sSql, [iCantCuerpos, sdqConsulta.FieldByName('AR_ID').AsInteger]);

      MessageDlg('Cantidad de cuerpos modificados correctamente.', mtInformation, [mbOK], 0);
      mnuUnselectAllClick(nil);
      sdqConsulta.Refresh;
    end;
end;
{------------------------------------------------------------------------------}
class procedure TFrmConsultaCarpetas.DoMostrarCarpeta(ATipoArchivo: TTableId; AClave: String);
begin
  Abrir(TFrmConsultaCarpetas, frmConsultaCarpetas, tmvMDIChild, nil);

  with frmConsultaCarpetas do
    begin
      with fraFiltroArchivoBusqueda do
        begin
          Visible := False;
          try
            Tipo := ATipoArchivo;
          finally
            Visible := True;
          end;

          DoCargarClaveArchivo(ATipoArchivo, AClave);
          Verificar(not IsCompleted, fraTipoArchivo.cmbDescripcion, 'No se ha encontrado la carpeta.');
        end;

      RefreshData;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.pmnuDevolCarpetaClick(Sender: TObject);
begin
 if fpDevolucionCarpetas.ShowModal = mrOk then
   RefreshData;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuDevolGenerarRemitoClick(Sender: TObject);
var
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'Debe seleccionar al menos un registro para poder generar el remito.');
  Verificar(not FFiltradoPorUltSolicitud, cbSoloUltimaSolicitud, 'Para generar un remito debe utilizar previamente el filtro ''Carpetas solo con Ultima Solicitud/Devol.''.');

  APointer := sdqConsulta.GetBookmark;
  if ValidarRemitoDevolucion() then
    if GenerarRemitoDevolucion then
      begin
        sdqConsulta.GotoBookmark(APointer);
        RefreshData;
     end;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarRemitoDevolucion: Boolean;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              Verificar(not (sdqConsulta.FieldByName('AR_TIPOUBICACION').AsString = TIPOUBICACION_LUGAR) and (sdqConsulta.FieldByName('AR_UBICACION').AsString = UBIC_GyD), nil, 'Una de las carpetas seleccionadas no se encuentra pendiente de generar remito.');

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.GenerarRemitoDevolucion: Boolean;
var
  i: Integer;
  IdRemito, IdArchivo: TTableId;
begin
  Result := False;
  i      := 0;

  BeginTrans;
  try
    IdRemito := InsertarRemitoDevolucion;

    sdqConsulta.DisableControls;
    try
      with sdqConsulta do
        begin
          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                begin
                  IdArchivo  := sdqConsulta.FieldByName('AR_ID').AsInteger;
                  DoModificarEstadoCarpeta(IdArchivo, ESTADOCARPETA_ADMINISTRADORA, False);
                  IncorporarRemitoACarpeta(IdRemito, i, IdArchivo);
                  inc(i);
                end;

              Next;
            end;
        end;
    finally
      sdqConsulta.EnableControls;
    end;

    CommitTrans;

    ImprimirRemitoDevolucion(IdRemito);
    Result := True;
  except
    on E: exception do
      begin
        Rollback;
        MessageDlg('Se produjo un error al intentar generar el remito de devolución de carpetas.' + E.Message, mtError, [mbOK], 0);
      end;
  end;
end;

{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.InsertarRemitoDevolucion: Integer;
var
  IdRemito : Integer;
  sSql : string;
begin
  IdRemito := GetSecNextVal('SEQ_RRD_ID');

  sSql := 'INSERT INTO ARCHIVO.RRD_REMITODEVOLUCION(RD_ID, RD_FECHAALTA, RD_USUALTA) ' +
                      'VALUES (:re_id, SYSDATE, :UsuAlta)';
  EjecutarSqlSTEx(sSql, [IdRemito, Sesion.UserId]);

  Result := IdRemito;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.IncorporarRemitoACarpeta(IdRemito, Secuencia, IdArchivo: Integer);
var
 sSql: String;
begin
  sSql := 'UPDATE ARCHIVO.RAR_ARCHIVO ' +
             'SET AR_IDREMITODEVOL = :idremito, ' +
                 'AR_SEQ_REMITODEVOL = :seq_remito, ' +
                 'AR_TIPOUBICACION = :tipoubicacion, ' +
                 'AR_UBICACION = :ubicacion, ' +
                 'AR_FECHAMOVIMIENTO = SYSDATE ' +
           'WHERE AR_ID = :id';
  EjecutarSqlSTEx(sSql, [IdRemito, Secuencia, TIPOUBICACION_GUARDA, UBICACION_GD, IdArchivo]);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.ImprimirRemitoDevolucion(AIdRemito: Integer; Preview: Boolean = False; eMail: String = '');
begin
  with TQrDetalleRemitoDevolucion.Create(self) do
    try
      ImprimirRemito(AIdRemito, Preview or VALOR_PARAMETRO_PREVISIMPRESIONREMITO, eMail);         // uso VALOR_PARAMETRO_PREVISIMPRESIONREMITO también para remito de devol. de carpetas
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuDevolImprimirRemitoClick(Sender: TObject);
begin
  if VerificarImpresionRemitoDevolucion() then
    ImprimirRemitoDevolucion(sdqConsulta.FieldByName('IDREMITODEVOL').AsInteger);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.VerificarImpresionRemitoDevolucion: boolean;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');
  Verificar(tslCheckeados.Count > 1, Grid, 'Seleccione solo un registro en la grilla que contenga el remito de devolución de carpetas que quiere imprimir.');
  Verificar(sdqConsulta.FieldByName('IDREMITODEVOL').IsNull, Grid, 'El remito de devolución de carpetas no ha sido generado.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.mnuDevolEliminarRemitoClick(Sender: TObject);
var
  sSql: String;
  IdRemito: TTableId;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'Debe seleccionar un registro.');
  Verificar(tslCheckeados.Count > 1 , Grid, 'Debe seleccionar solo un registro (aquel que contenga el remito de devolución de carpetas a eliminar).');
  Verificar(sdqConsulta.FieldByName('IDREMITODEVOL').IsNull, Grid, 'Debe seleccionar un remito de devolución de carpetas.');
  Verificar(not sdqConsulta.FieldByName('FBAJAREMITODEVOL').IsNull, Grid, 'El remito de devolución de carpetas ya se encuentra dado de baja.');

  if MsgBox('¿Confirma la baja del remito de devolución de carpetas seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        IdRemito := sdqConsulta.FieldByName('IDREMITODEVOL').AsInteger;

        sSql := 'UPDATE ARCHIVO.RRD_REMITODEVOLUCION ' +
                   'SET RD_FECHABAJA = ART.ACTUALDATE, ' +
                       'RD_USUBAJA = :User ' +
                 'WHERE RD_ID = :Id';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, IdRemito]);

        DoModificarEstadoCarpeta(ART_EMPTY_ID, ESTADOCARPETA_PODER_GYD, False, IdRemito);

        sSql := 'UPDATE ARCHIVO.RAR_ARCHIVO ' +
                   'SET AR_IDREMITODEVOL = NULL, ' +
                       'AR_SEQ_REMITODEVOL = NULL, ' +
                       'AR_TIPOUBICACION = :tipoubicacion, ' +
                       'AR_UBICACION = :ubicacion, ' +
                       'AR_FECHAMOVIMIENTO = SYSDATE ' +
                 'WHERE AR_IDREMITODEVOL = :Id';
        EjecutarSqlSTEx(sSql, [TIPOUBICACION_LUGAR, UBIC_GyD, IdRemito]);

        CommitTrans;

        MsgBox('Remito de devolución de carpetas eliminado correctamente.', MB_ICONINFORMATION);
        RefreshData;
      except
        on E:Exception do
          begin
            Rollback;
            Raise Exception.Create(E.Message + CRLF + 'Error al eliminar el remito de devolución de carpetas.');
          end;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbModificarCajasClick(Sender: TObject);
var
  iNroCajaAnt: Integer;
  IdTipoArchivo: TTableId;
  bPrimVez: Boolean;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'Debe seleccionar al menos un registro.');
  Verificar(not FFiltradoPorUltSolicitud, cbSoloUltimaSolicitud, 'Para modificar el contenido de las cajas debe utilizar previamente el filtro ''Carpetas solo con Ultima Solicitud/Devol.''.');

  iNroCajaAnt   := -1;
  IdTipoArchivo := ART_EMPTY_ID;
  bPrimVez      := True;

  APointer := sdqConsulta.GetBookmark;
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                Verificar(sdqConsulta.FieldByName('AR_CAJA').IsNull or (sdqConsulta.FieldByName('AR_CAJA').AsInteger = 0), nil, 'Uno de los registros seleccionados no tiene nro. de caja asignado.');

                if bPrimVez then
                  begin
                    iNroCajaAnt   := sdqConsulta.FieldByName('AR_CAJA').AsInteger;
                    IdTipoArchivo := sdqConsulta.FieldByName('AR_TIPO').AsInteger;

                    bPrimVez := False;
                  end
                else
                  begin
                    Verificar(sdqConsulta.FieldByName('AR_CAJA').AsInteger <> iNroCajaAnt, nil, 'Debe seleccionar registros con el mismo nro. de caja.');
                    Verificar(sdqConsulta.FieldByName('AR_TIPO').AsInteger <> IdTipoArchivo, nil, 'Debe seleccionar registros con el mismo tipo de archivo.');
                  end;
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  sdqConsulta.GotoBookmark(APointer);
  if fpModificarCajas.ShowModal = mrOk then
    RefreshData;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarModificarCaja: Boolean;
var
  APointer: TBookMark;
begin
  Verificar(edNroCajaModifCaja.IsEmpty, edNroCajaModifCaja, 'Debe indicar el nuevo nro. de caja.');

  if fraTipoArchivoModifCaja.IsSelected then
    begin
      APointer := sdqConsulta.GetBookmark;
      sdqConsulta.DisableControls;
      try
        with sdqConsulta do
          begin
            First;
            while not Eof do
              begin
                if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                  begin
                    Verificar(fraTipoArchivoModifCaja.sdqDatos.FieldByName('TA_FORMULARIO').AsString <> sdqConsulta.FieldByName('TA_FORMULARIO').AsString, fraTipoArchivoModifCaja, 'La clave del tipo de archivo seleccionado no es compatible con la de los registros seleccionados.');
                    Verificar(fraTipoArchivoModifCaja.Value = sdqConsulta.FieldByName('AR_TIPO').{$IFDEF ART2}AsInteger{$ELSE}AsString{$ENDIF}, fraTipoArchivoModifCaja, 'El tipo de archivo seleccionado debe ser distinto al de los registros seleccionados.');

                    Break;
                  end;

                Next;
              end;
          end;
      finally
        sdqConsulta.GotoBookmark(APointer);
        sdqConsulta.EnableControls;
      end;
    end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.btnAceptarModifCajasClick(Sender: TObject);
var
  sSql: String;
  bCambiarTipoArchivo: Boolean;
  APointer: TBookMark;
begin
  if ValidarModificarCaja then
    begin
      if MsgBox('¿Confirma la modificación del nro. de caja de las carpetas seleccionadas?', MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          bCambiarTipoArchivo := fraTipoArchivoModifCaja.IsSelected;

          BeginTrans;
          try
            APointer := sdqConsulta.GetBookmark;
            sdqConsulta.DisableControls;
            try
              with sdqConsulta do
                begin
                  First;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        begin
                          if bCambiarTipoArchivo then
                            begin
                              sSql := 'UPDATE RAR_ARCHIVO ' +
                                         'SET AR_CAJA = NULL ' +
                                       'WHERE AR_ID = :Id';
                              EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('AR_ID').AsInteger]);

                              sSql := 'UPDATE RAR_ARCHIVO ' +
                                         'SET AR_CAJA = :NroCaja ' +
                                       'WHERE AR_TIPO = :Tipo ' +
                                         'AND AR_CLAVE = :Clave';
                              EjecutarSqlSTEx(sSql, [edNroCajaModifCaja.Value, fraTipoArchivoModifCaja.Value, sdqConsulta.FieldByName('AR_CLAVE').AsString]);
                            end
                          else
                            begin
                              sSql := 'UPDATE RAR_ARCHIVO ' +
                                         'SET AR_CAJA = :NroCaja ' +
                                       'WHERE AR_ID = :Id';
                              EjecutarSqlSTEx(sSql, [edNroCajaModifCaja.Value, sdqConsulta.FieldByName('AR_ID').AsInteger]);
                            end;
                        end;

                      Next;
                    end;
                end;
            finally
              sdqConsulta.GotoBookmark(APointer);
              sdqConsulta.EnableControls;
            end;

            MsgBox('Cajas modificadas correctamente.', MB_ICONINFORMATION);
            CommitTrans;
            fpModificarCajas.ModalResult := mrOk;
          except
            on E:Exception do
              begin
                Rollback;
                Raise Exception.Create(E.Message + CRLF + 'Error al modificar los nros. de cajas');
              end;
          end;
        end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.fpModificarCajasEnter(Sender: TObject);
begin
  edNroCajaModifCaja.Clear;
  fraTipoArchivoModifCaja.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tslCheckeados.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DoSMsdqConsultaAfterOpen(Grid, SMCampoCheckBox);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  DoSMGridKeyDown(Key, Grid, SMCampoCheckBox);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbExportarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  inherited;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(Grid, tslCheckeados, SMCampoFila, Rect);
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarRecepcionCarpetaUsuario: Boolean;
var
  sUsuarioSolicitud, sEstado: String;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                sEstado := sdqConsulta.FieldByName('ESTADOCARPETA').AsString;

                if not IsEmptyString(sEstado) then
                  Verificar(sEstado <> ESTADOCARPETA_ENTRANSITO_USU, nil, 'Alguna de las carpetas seleccionadas no se encuentra en estado: En Tránsito al Usuario.');

                sUsuarioSolicitud := sdqConsulta.FieldByName('SC_USUARIOSOLICITUD').AsString;

                Verificar(IsEmptyString(sUsuarioSolicitud), nil, 'Alguna de las carpetas seleccionadas no ha sido solicitada.');

                if not GetPerfilAdministrador() then    // para que GyD pueda recepcionar carpetas en tránsito cuando el usuario no se encuentra por algún motivo
                  Verificar(sUsuarioSolicitud <> Sesion.UserId, nil, 'Alguna de las carpetas seleccionadas no fue solicitada por Ud, sino por: ' + sUsuarioSolicitud + '.');

                Verificar(sdqConsulta.FieldByName('SC_FECHARECEPCION').IsNull, nil, 'Alguna de las carpetas seleccionadas no ha sido recepcionada aun por el sector de GyD.');
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.pmnuRecepcionCarpetaUsuClick(Sender: TObject);
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'Debe seleccionar al menos un registro para poder recepcionar las carpetas.');
  Verificar(not FFiltradoPorUltSolicitud, cbSoloUltimaSolicitud, 'Para recepcionar carpetas debe utilizar previamente el filtro ''Carpetas solo con Ultima Solicitud/Devol.''.');

  if ValidarRecepcionCarpetaUsuario then
    begin
      if MsgBox('¿Confirma la Recepción desde GyD de las carpetas seleccionadas?', MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          BeginTrans;
          try
            sdqConsulta.DisableControls;
            try
              with sdqConsulta do
                begin
                  First;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        DoModificarEstadoCarpeta(sdqConsulta.FieldByName('AR_ID').AsInteger, ESTADOCARPETA_PODERUSUARIO, False, 0, '', True);

                      Next;
                    end;
                end;
            finally
              sdqConsulta.EnableControls;
            end;

            MsgBox('Carpetas recepcionadas correctamente.', MB_ICONINFORMATION);
            CommitTrans;
            RefreshData;
          except
            on E:Exception do
              begin
                Rollback;
                Raise Exception.Create(E.Message + CRLF + 'Error al recepcionar las carpetas');
              end;
          end;
        end;
    end;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarDevolucionCarpetaUsuario: Boolean;
var
  sUsuarioSolicitud, sEstado: String;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                sEstado := sdqConsulta.FieldByName('ESTADOCARPETA').AsString;

                if IsEmptyString(sEstado) then
                  Verificar(sdqConsulta.FieldByName('AR_TIPOUBICACION').AsString = TIPOUBICACION_GUARDA, nil, 'Alguna de las carpetas seleccionadas se encuentra en la Administradora.')
                else
                  Verificar(sEstado <> ESTADOCARPETA_PODERUSUARIO, nil, 'Alguna de las carpetas seleccionadas no se encuentra en estado: En Poder del Usuario.');

                sUsuarioSolicitud := sdqConsulta.FieldByName('SC_USUARIOSOLICITUD').AsString;

                Verificar(IsEmptyString(sUsuarioSolicitud), nil, 'Alguna de las carpetas seleccionadas no ha sido solicitada.');
                Verificar(sdqConsulta.FieldByName('SC_FECHARECEPCION').IsNull, nil, 'Alguna de las carpetas seleccionadas no ha sido recepcionada aun por el sector de GyD.');
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.pmnuDevolucionCarpetaUsuClick(Sender: TObject);
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'Debe seleccionar al menos un registro para poder devolver las carpetas.');
  Verificar(not FFiltradoPorUltSolicitud, cbSoloUltimaSolicitud, 'Para devolver carpetas debe utilizar previamente el filtro ''Carpetas solo con Ultima Solicitud/Devol.''.');

  if ValidarDevolucionCarpetaUsuario then
    begin
      if MsgBox('¿Confirma la Devolución a GyD de las carpetas seleccionadas?', MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          BeginTrans;
          try
            sdqConsulta.DisableControls;
            try
              with sdqConsulta do
                begin
                  First;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        DoModificarEstadoCarpeta(sdqConsulta.FieldByName('AR_ID').AsInteger, ESTADOCARPETA_TRANSITO_A_GYD, False, 0, '', True);

                      Next;
                    end;
                end;
            finally
              sdqConsulta.EnableControls;
            end;

            MsgBox('Carpetas devueltas correctamente.', MB_ICONINFORMATION);
            CommitTrans;
            RefreshData;
          except
            on E:Exception do
              begin
                Rollback;
                Raise Exception.Create(E.Message + CRLF + 'Error al devolver las carpetas');
              end;
          end;
        end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbCarpetasSolicUsuariosClick(Sender: TObject);
begin
  tbCarpetasSolicUsuarios.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbBuscarCodigoBarrasClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(not fraFiltroArchivoBusqueda.IsSelected, nil, 'Debe indicar un tipo de archivo y refrescar la grilla.');

  DoBuscarCampoCodigoBarrasArchivo(Self, fraFiltroArchivoBusqueda.Tipo, 'AR_CLAVE', '');
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.DoMarcarFila;
begin
  if not IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
    DoSMMarcarFila(tslCheckeados, Grid, SMCampoFila);

  Grid.Invalidate;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
class procedure TFrmConsultaCarpetas.DoMostrarCarpetasEnTransitoUsuario(Sender: TObject);
begin
  Abrir(TFrmConsultaCarpetas, frmConsultaCarpetas, tmvMDIChild, nil);

  with frmConsultaCarpetas do
    begin
      ClearData;
      
      chkSoloCarpetasUsuLog.Checked       := True;
      chkSoloCarpetasPendRecepGyD.Checked := True;

      pcOpcionesBusquedaCarpeta.ActivePage := tsEstadoCarpeta;
      
      RefreshData;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.CambiarEstadoSolicitudCarpeta(IdArchivo: TTableId);
var
  sSql: String;
begin
  sSql :='SELECT 1 ' +
           'FROM RSC_SOLICITUDCARPETA, RAR_ARCHIVO ' +
          'WHERE SC_IDARCHIVO = AR_ID ' +
            'AND SC_FECHARECEPCION IS NULL ' +
            'AND SC_FECHAIMPRESION IS NOT NULL ' +
            'AND AR_ID = :IdArchivo';

  if not ExisteSqlEx(sSql, [IdArchivo]) and (sdqConsulta.FieldByName('ESTADOCARPETA').AsString = ESTADOCARPETA_SOLICITADA) and
    (sdqConsulta.FieldByName('AR_TIPOUBICACION').AsString = TIPOUBICACION_USUARIO)then
    DoModificarEstadoCarpeta(IdArchivo, ESTADOCARPETA_PODERUSUARIO, False);
end;
{------------------------------------------------------------------------------}
procedure TFrmConsultaCarpetas.tbCargaMasivaClick(Sender: TObject);
var
  sSql: String;
  iCantCampos, iTipo: Integer;
begin
  if ValidarDatosCargaMasiva then
    begin
      if ImpoExpoWizard('AGALO') then
        begin
          sSql := 'SELECT * ' +
                    'FROM TAG_CLAVEAGA ' +
                   'WHERE AG_USUARIO = :User';

          with GetQueryEx(sSql, [Sesion.UserId]) do
            try
              Verificar(Eof, nil, 'No se han encontrado registros en el archivo.');

              iTipo       := fraFiltroArchivoBusqueda.Tipo;
              iCantCampos := GetCantCamposBusquedaTipoArchivo(iTipo);

              RefreshData(True, iCantCampos);
            finally
              Free
            end;
        end;
    end;
end;
{------------------------------------------------------------------------------}
function TFrmConsultaCarpetas.ValidarDatosCargaMasiva: Boolean;
begin
  Verificar(not fraFiltroArchivoBusqueda.IsSelected, fraFiltroArchivoBusqueda, 'Debe indicar un tipo de archivo.');

  Result := True;
end;
{------------------------------------------------------------------------------}
end.

