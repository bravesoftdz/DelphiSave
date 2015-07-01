unit unFrmRecepcionNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit,
  DateTimeEditors, PeriodoPicker, unFraCodigoDescripcion,
  unfraCodigoDescripcionExt, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, DBCtrls, AnsiSql, DBClient, CustomDlgs, unSesion, SqlFuncs,
  General, ToolEdit, DateComboBox, IntEdit, EditNew, unfrmSeleccionLotes,
  unConstEmision, VCLExtra, JvgGroupBox, JvComCtrls,
  JvExComCtrls, dbcgrids, JvComponent, JvExMask, JvToolEdit, JvDBControls,
  JvExExtCtrls, JvgFlyingText, JvExControls, JvaScrollText, JvgCaption, JvgTypes,
  CurrEdit, unFraStaticCodigoDescripcion, Periodos, unEspera;

type

  TModoForm = (mfABM, mfGestionar);

  TFrmRecepcionNota = class(TfrmCustomGridABM)
    gbCargaNotas: TjvgGroupBox;
    bvSeparador: TBevel;
    btnAceptarDerivacion: TButton;
    btnCancelarDeriviacion: TButton;
    fpDerivacionNota: TFormPanel;
    tbDerivacionNota: TToolButton;
    btnSimulacion: TButton;
    cdsPeriodos: TClientDataSet;
    btnGestionar: TButton;
    gbDerivacionNota: TJvgGroupBox;
    lblSector: TLabel;
    lblFechaDerivacionNota: TLabel;
    lblObservaciones: TLabel;
    fraDerivador: TfraCodigoDescripcionExt;
    edtFechaDerivacion: TDateComboBox;
    mObservacionesDerivacion: TMemo;
    gbGeneral: TJvgGroupBox;
    lblSolicitudFiltro: TLabel;
    lblSolicitanteFiltro: TLabel;
    lblFechaDesdeFiltro: TLabel;
    lblFechaHastaFIltro: TLabel;
    lblNivelRequeridoFiltro: TLabel;
    lblEstadoFiltro: TLabel;
    fraSolicitud: TfraCodigoDescripcionExt;
    fraSolicitante: TfraCodigoDescripcionExt;
    fraAutorizacionRequerimiento: TfraCodigoDescripcionExt;
    edtFechaDesde: TDateComboBox;
    edtFechaHasta: TDateComboBox;
    fraEstadoNota: TfraCodigoDescripcionExt;
    gbEmpresaPeriodos: TJvgGroupBox;
    lblEmpresa: TLabel;
    lblPeriodosFiltro: TLabel;
    lblHastaPeriodosFiltro: TLabel;
    lblBiblioratoFiltro: TLabel;
    lblSecuenciaFiltro: TLabel;
    lblNroNotaFiltro: TLabel;
    fraEmpresaNota: TfraEmpresa;
    ppPeriodosDesde: TPeriodoPicker;
    ppPeriodosHasta: TPeriodoPicker;
    edtBibliorato: TIntEdit;
    edtSecuencia: TIntEdit;
    edtNroNota: TIntEdit;
    chkNotaDelaEmpresa: TCheckBox;
    chkSGC: TCheckBox;
    lblNroEvento: TLabel;
    edtEvento: TIntEdit;
    fpDetalleEvento: TFormPanel;
    Bevel1: TBevel;
    btnSalir: TButton;
    gbDatosEventos: TJvgGroupBox;
    spDatosEventos: TShape;
    lblFechaEvento: TLabel;
    lblDescripcionEvento: TLabel;
    lblFechaCarga: TLabel;
    lblSectorInterviniente: TLabel;
    lblUsuarioInterviniente: TLabel;
    lblContacto: TLabel;
    lblCargo: TLabel;
    lbNroEvento: TLabel;
    edtFechaEvento: TDateComboBox;
    edtFechaCarga: TDateComboBox;
    lblIngreso: TLabel;
    lblMotivoEvento: TLabel;
    lblFechaVencimiento: TLabel;
    edtFechaVencimiento: TDateComboBox;
    chkNotificado: TCheckBox;
    lblFechaRealizado: TLabel;
    edtFechaRealizacion: TDateComboBox;
    lblNombreEmpresa: TLabel;
    lblUsuarioDerivacion: TLabel;
    lblPrioridad: TLabel;
    lblObservacionesEvento: TLabel;
    edtDescripcionEvento: TEdit;
    edtDescripcionMotivoEvento: TEdit;
    edtDescripcionIngreso: TEdit;
    edtDescripcionPrioridadEvento: TEdit;
    edtDescripcionCargo: TEdit;
    edtDescripcionContacto: TEdit;
    edtDescripcionSectorInterviniente: TEdit;
    edtDescripcionUsuarioInterviniente: TEdit;
    edtUsuarioDerivacion: TEdit;
    edtObservacionesEvento: TEdit;
    pcDetalle: TJvPageControl;
    tsObservaciones: TTabSheet;
    tsDetalleEvento: TTabSheet;
    edtObservaciones: TMemo;
    TabSheet3: TTabSheet;
    mObservacionesCumplimiento: TMemo;
    dbcgStatus: TDBCtrlGrid;
    dbTextoObservaciones: TDBMemo;
    sdqEvolucion: TSDQuery;
    dsEvolucion: TDataSource;
    lblFechaAlta: TLabel;
    dbdFechaAlta: TJvDBDateEdit;
    dbedtUsuarioAlta: TDBEdit;
    lblUsuarioAlta: TLabel;
    lblEvento: TLabel;
    lbRSocial: TLabel;
    Panel1: TPanel;
    tbAsignarmotivoEvento: TToolButton;
    fpAsignacionNota: TFormPanel;
    Bevel2: TBevel;
    btnAceptarAsignacion: TButton;
    btnCancelarAsignacion: TButton;
    gbAsignacionNotaEventoSGC: TJvgGroupBox;
    lblBiblioratoNotaAsignacion: TLabel;
    edtBiblioratoNotaAsignacion: TIntEdit;
    lblSecuenciaNotaAsignacion: TLabel;
    edtSecuenciaNotaAsignacion: TIntEdit;
    fraMotivoSolicitudNotaAsignacion: TfraCodigoDescripcionExt;
    lblMotivoSolicitudNotaAsignacion: TLabel;
    lblObservacionNotaAsignacion: TLabel;
    mObservacionNotaAsignacion: TMemo;
    tbMostrarDetalleEvento: TToolBar;
    btnDetalleEventoAsignacion: TToolButton;
    Label1: TLabel;
    Panel2: TPanel;
    lblColorCerrado: TLabel;
    lblColorPendienteAsignar: TLabel;
    lblDerivado: TLabel;
    pnColorCerrada: TPanel;
    pnColorPendienteAsignar: TPanel;
    pnColorDerivado: TPanel;
    Bevel3: TBevel;
    gbEstado: TGroupBox;
    chkCerrada: TCheckBox;
    chkDerivada: TCheckBox;
    chkNoAsignada: TCheckBox;
    chkAbiertas: TCheckBox;
    mDetalleEvento: TMemo;
    Label2: TLabel;
    mDetalleEventoDerivacion: TMemo;
    Bevel4: TBevel;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    btnAutorizacion: TButton;
    lblNroEventoAsociado: TLabel;
    fpSolicitudAutorizacion: TFormPanel;
    Bevel5: TBevel;
    btnAceptarSolicitudAutorizacion: TButton;
    btnCancelarSolicitudAutorizacion: TButton;
    gbSolicitudAutorizacion: TJvgGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    fraTipoAutorizacion: TfraCodigoDescripcionExt;
    mObservacionesSolicitudAutorizacion: TMemo;
    Label6: TLabel;
    fraNivelAutorizacion: TfraCodigoDescripcionExt;
    rgpTipoDerivacion: TRadioGroup;
    pgNotas: TPageControl;
    tbNota: TTabSheet;
    rgpTipoSolicitante: TRadioGroup;
    lblSolicitanteSolicitud: TLabel;
    fraSolicitanteNota: TfraCodigoDescripcionExt;
    lblFechaSolicitud: TLabel;
    edtFechaSolicitud: TDateComboBox;
    lblFechaRecepcionART: TLabel;
    edtFechaRecepcionART: TDateComboBox;
    chkNotaProvieneEmpresa: TCheckBox;
    fraSolicitudAbm: TfraCodigoDescripcionExt;
    lblSolicitudSolicitud: TLabel;
    lblCUIT: TStaticText;
    fraEmpresaSolicitud: TfraEmpresa;
    lbContrato: TLabel;
    edtEventoNota: TIntEdit;
    tbBotonesEventos: TToolBar;
    tbBuscarEvento: TToolButton;
    tbMostrarDetalle: TToolButton;
    lblObservacionesSolicitud: TLabel;
    mObservacion: TMemo;
    bvSeparador1: TBevel;
    lblBibliorato: TLabel;
    edtBiblioratoNota: TIntEdit;
    lblSecuencia: TLabel;
    edtSecuenciaNota: TIntEdit;
    tbMostrarImagen: TToolBar;
    tbMostrarImagenBank: TToolButton;
    pnDetalleAutorizacion: TPanel;
    tbAprobacion: TToolBar;
    lblNroAutorizacion: TLabel;
    edtNroAutorizacion: TIntEdit;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    lblDetalleAutorizacion: TLabel;
    tbGestion: TToolBar;
    lblGestion: TLabel;
    edtNroGestion: TIntEdit;
    ToolButton7: TToolButton;
    tbMostrarGestion: TToolButton;
    tbPresentaciones: TTabSheet;
    Bevel6: TBevel;
    gbGrupoMultiperiodo: TGroupBox;
    lblTipoFormularioMultiperiodo: TLabel;
    lblEmpleadosMultiperiodo: TLabel;
    lblMasaSalarialMultiperiodo: TLabel;
    lblEnCeroMultiperiodo: TLabel;
    lblFechaPresentacionMultiperiodo: TLabel;
    BvSeparador4: TBevel;
    lblTipoNomina: TLabel;
    lblCodigoRectificativaMultiperiodo: TLabel;
    fraTipoFormulario: TfraStaticCodigoDescripcion;
    edtCantidadEmpleados: TIntEdit;
    edtMasaSalarial: TCurrencyEdit;
    edtSalariosEnCero: TIntEdit;
    edtFechaPresentacion: TDateEditor;
    dbgMultiperiodo: TArtDBGrid;
    fraTipoNomina: TfraStaticCodigoDescripcion;
    edtCodigoRectificativa: TIntEdit;
    gbObservacionesMultiperiodo: TGroupBox;
    lblObservacionesMultiperiodo: TLabel;
    lblDetalleObservacion: TLabel;
    fraObservacion: TfraStaticCodigoDescripcion;
    mObservacionDDJJ: TMemo;
    lblPeriodosSolicitud: TLabel;
    ppPeriodoDesdeDDJJ: TPeriodoPicker;
    lblHastaPeriodos: TLabel;
    ppPeriodoHastaDDJJ: TPeriodoPicker;
    tbComandosDDJJ: TToolBar;
    tbAddDDJJ: TToolButton;
    tbDeleteDDJJ: TToolButton;
    tbLimpiarPres: TToolButton;
    Label8: TLabel;
    ppPeriodoDesdeSolicitud: TPeriodoPicker;
    Label9: TLabel;
    ppPeriodoHastaSolicitud: TPeriodoPicker;
    tbComnadosNota: TToolBar;
    tbAddPeriodo: TToolButton;
    tbDeletePeriodo: TToolButton;
    dblPeriodosSeleccionados: TListBox;
    cdsDDJJ: TClientDataSet;
    dsDDJJ: TDataSource;
    Panel5: TPanel;
    lblTrabajadorActivo: TLabel;
    Panel6: TPanel;
    lbl: TLabel;
    lblLeyendaPeriodoPendienteAprob: TLabel;
    pnColorFOndoPendienteAprobacion: TPanel;
    tbCerrar: TToolButton;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbDerivacionNotaClick(Sender: TObject);
    procedure btnSimulacionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbAddDDJJClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarAsignacionLoteClick(Sender: TObject);
    procedure btnModificarNotaClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure chkNotaDelaEmpresaClick(Sender: TObject);
    procedure btnGestionarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btnAceptarDerivacionClick(Sender: TObject);
    procedure fpDerivacionNotaShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbMostrarDetalleClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAsignarmotivoEventoClick(Sender: TObject);
    procedure btnDetalleEventoAsignacionClick(Sender: TObject);
    procedure tbBuscarEventoClick(Sender: TObject);
    procedure btnCancelarAsignacionClick(Sender: TObject);
    procedure btnAceptarAsignacionClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure chkAbiertasClick(Sender: TObject);
    procedure chkCerradaClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnAutorizacionClick(Sender: TObject);
    procedure btnAceptarSolicitudAutorizacionClick(Sender: TObject);
    procedure edtBiblioratoNotaExit(Sender: TObject);
    procedure edtSecuenciaNotaExit(Sender: TObject);
    procedure tbMostrarImagenBankClick(Sender: TObject);
    procedure rgpTipoSolicitanteClick(Sender: TObject);
    procedure rgpTipoDerivacionClick(Sender: TObject);
    procedure tbAddPeriodoClick(Sender: TObject);
    procedure tbDeletePeriodoClick(Sender: TObject);
    procedure tbDeleteDDJJClick(Sender: TObject);
    procedure tbLimpiarPresClick(Sender: TObject);
    procedure dbgMultiperiodoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FIdEvento     : Integer;
    FIdNota       : Integer;
    FAbmCaption   : TJvgCaption;
    FModoForm     : TModoForm;
    FSinPersonal : boolean;
    procedure CargarPeriodosAsignados(aIdNota: integer);
    procedure GuardarDDJJAignadasalLote(aIdLoteSelecciondo: integer);
    procedure GuardarDatosDerivacion(aIdNota: integer);
    procedure CambiarEstadoNota(aIdNota, aNewEstado: integer);
    procedure ReCargarPeriodosAsignados;
    function ValidarPeriodos: boolean;
    function ValidarDerivacion: boolean;
    procedure AgregarPeriodosASolicitud(aIdNota: integer);
    function ExisteBibliorato: boolean;
    function ExistePeriodo(aIdNota: integer; aperiodo: string): boolean;
    function VerificarPeriodosValidos: boolean;
    procedure CalcularFiltro(var sFrom, sWhere: string);
    procedure SetearComponentesForm(modoForm: TModoForm);
    procedure HabilitarCargaDDJJ(aHabilita: boolean);
    procedure MostrarDetalleEvento(AIdEvento : Integer);
    procedure LimpiarEvento;
    procedure AsignarNota;
    procedure LimpiarAsignarNota;
    procedure CargarAsignarNota;
    procedure GetDetalleEvento(AIdEvento: Integer);
    procedure GrabarAsignacion;
    procedure VerificarRequeridosPorAsignacion;
    procedure GetDatosAprobacion;
    procedure GetDatosGestion;
    procedure GenerarAutorizacion;
    procedure LimpiarAutorizacion;
    procedure ValidarSolicitudAutorizacion;
    procedure CheckBank;
    procedure ValidarDDJJ;
    procedure AgregarDDJJ;
    function ValidarMasaYPersonal(SinPersonal: boolean; Empleados,
      EmpleadosDeclar, SalariosEnCero : Integer; MasaSalarial,
      MasaSalarialDeclar: Currency): boolean;
    procedure Get_ValidarPeriodoPresentacionNota(aPeriodoDesde, aPeriodoHasta: string);
    procedure LimpiarAltaPeriodo;
    procedure SetearSinPersonal;
    function ExisteNominaGrilla(aPeriodo: String; aFechaPresentacion: TDate): Boolean;
    procedure OnChangeTipoFormulario(Sender: TObject);
    procedure LimpiarDDJJ;
    function ValidarDDJJCargadas: boolean;

  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure NuevaNota(aContrato: integer; aPeriodo: String);

  end;


implementation

uses unDmEmision, unDmPrincipal, unPrincipal, unFrmSimulacion, Strfuncs, 
  unCustomConsulta, unAdministracionEventosEMISION, unFuncionesEmision,
  unfrmNotasEnBank;

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := false;

  FieldBaja := 'NO_FECHABAJA';
  Sql.TableName := 'EMI.INO_NOTA';
  CheckPK := True;

  fraEmpresaSolicitud.ShowBajas := True;

  cdsPeriodos.CreateDataSet;

  ppPeriodoDesdeSolicitud.Periodo.SetPeriodoActual;
  ppPeriodoHastaSolicitud.Periodo.SetPeriodoActual;
  ppPeriodoDesdeDDJJ.Periodo.SetPeriodoActual;
  ppPeriodoHastaDDJJ.Periodo.SetPeriodoActual;

  VCLExtra.LockControl(edtFechaSolicitud, true);

  with fraSolicitud do
  begin
    TableName := 'emi.ims_motivosolicitudnota';
    FieldID := 'ms_id';
    FieldCodigo := 'ms_id';
    FieldDesc := 'ms_descripcion';
    FieldBaja := 'ms_fechabaja';
    ShowBajas := true;
  end;

  with fraSolicitudAbm do
  begin
    TableName := 'emi.ims_motivosolicitudnota';
    FieldID := 'ms_id';
    FieldCodigo := 'ms_id';
    FieldDesc := 'ms_descripcion';
    FieldBaja := 'ms_fechabaja';
    ShowBajas := true;
  end;

  with fraSolicitante do
  begin
    TableName := 'art.use_usuarios';
    FieldID := 'SE_ID';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc := 'SE_NOMBRE';
    FieldBaja := 'SE_FECHABAJA';
    ShowBajas := true;
  end;

  with fraMotivoSolicitudNotaAsignacion do
  begin
    TableName := 'emi.ims_motivosolicitudnota';
    FieldID := 'ms_id';
    FieldCodigo := 'ms_id';
    FieldDesc := 'ms_descripcion';
    FieldBaja := 'ms_fechabaja';
    ShowBajas := true;
  end;

  with fraAutorizacionRequerimiento do
  begin
    TableName := 'EMI.INA_NIVELAUTORIZACION';
    FieldID := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc := 'NA_DESCRIPCION';
  end;

  with fraEstadoNota do
  begin
    TableName := 'EMI.IEN_ESTADONOTA';
    FieldID := 'EN_ID';
    FieldCodigo := 'EN_ID';
    FieldDesc := 'EN_DESCRIPCION';
  end;

  with fraTipoAutorizacion do
  begin
    TableName   := 'EMI.ita_tipoautorizacion';
    FieldID     := 'TA_ID';
    FieldCodigo := 'TA_ID';
    FieldDesc   := 'TA_DESCRIPCION';
    ShowBajas   := true;
  end;


  with fraNivelAutorizacion do
  begin
    TableName := 'EMI.INA_NIVELAUTORIZACION';
    FieldID := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc := 'NA_DESCRIPCION';
    ShowBajas := true;
  end;

  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';

    ExtraCondition := ' AND TF_NOMINA = ''S'' ' +
                      ' AND TF_TRABAJADORES = ''N'' ' +
                      ' AND TF_MULTIPERIODO = ''N'' ' +
                      ' AND TF_PRESENTACIONMANUAL = ''S'' ';
    ExtraFields := ', TF_SINPERSONAL AS SIN_PERSONAL ';

(*
    ExtraCondition := ' AND TF_NOMINA = ''S'' ' +
                      ' AND TF_TRABAJADORES = ''S'' ' +
                      ' AND TF_MULTIPERIODO = ''S'' ' +
                      ' AND TF_PRESENTACIONMANUAL = ''S'' ';
    ExtraFields := ', TF_SINPERSONAL AS SIN_PERSONAL ';
*)
    DynamicCols := true;
    ShowBajas   := False;

    OnChange := OnChangeTipoFormulario;
  end;

  with fraObservacion do
  begin
    TableName   := 'EMI.IOB_OBSERVACION';
    FieldID     := 'OB_ID';
    FieldCodigo := 'OB_ID';
    FieldDesc   := 'OB_DESCRIPCION';
    FieldBaja   := 'OB_FECHABAJA';
    ShowBajas   := false;
  end;

  with fraTipoNomina do
  begin
    TableName   := 'EMI.ITN_TIPONOMINA';
    FieldID     := 'TN_ID';
    FieldCodigo := 'TN_ID';
    FieldDesc   := 'TN_DESCRIPCION';
    FieldBaja   := 'TN_FECHABAJA';
    ShowBajas   := False;
    ExtraCondition := ' AND TN_CARGAMANUAL = ''S''';
  end;

  tbDerivacionNota.Left := 131;
  tbAsignarmotivoEvento.Left := 154;

end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbPropiedadesClick(Sender: TObject);
begin
//  inherited;
  if (sdqConsulta.Active) and (sdqConsulta.RecordCount > 0) then
  begin
    if (sdqConsulta.FieldByName('NO_IDESTADONOTA').AsInteger <> 1) then //ESTADO_NOTA_PENDIENTE) then
      MsgBox('El estado de la nota es ' + sdqConsulta.FieldByName('EN_DESCRIPCION').AsString + #13#10 +
             'Sólo las notas en estado Pendiente pueden gestionarse.', MB_ICONWARNING, 'Solicitudes de Revisión')
    else
    if (sdqConsulta.FieldByName('NO_FECHABAJA').IsNull) then
      begin
        LoadControls;
        fpABM.Caption := 'Dar Curso...';
        ModoABM := maModificacion;
        SetearComponentesForm(mfGestionar);
        fpABM.ShowModal;
      end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbDerivacionNotaClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (sdqConsulta.RecordCount > 0) then
  begin
    if (sdqConsulta.FieldByName('NO_IDESTADONOTA').AsInteger <> 1) then //ESTADO_NOTA_PENDIENTE) then
      MsgBox('El estado de la nota es ' + sdqConsulta.FieldByName('EN_DESCRIPCION').AsString + #13#10 +
             'Sólo las notas en estado Pendiente pueden derivarse.', MB_ICONWARNING, 'Solicitudes de Revisión')
    else
      if (sdqConsulta.FieldByName('NO_FECHABAJA').IsNull) then fpDerivacionNota.ShowModal;
  end;
end;

{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('NO_FECHACUMPLIMIENTO').IsNull then Background := $00EEFFFF;

  if not sdqConsulta.FieldByName('NO_DERIVADO').IsNull then Background := $00CEDFFF;

  if ( (sdqConsulta.FieldByName('NO_IDMOTIVOSOLICITUDNOTA').IsNull) or
       (sdqConsulta.FieldByName('NO_BIBLIORATO').IsNull) OR
       (sdqConsulta.FieldByName('NO_BIBLIORATO').IsNull)) then Background := $00FFEAEA;

end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPeriodos.Close;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnAceptarAsignacionLoteClick(Sender: TObject);
begin
//  inherited;

end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnModificarNotaClick(Sender: TObject);
begin
  tbModificar.Click;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbRefrescarClick(Sender: TObject);
var
  sWhere, sFrom: string;
begin
  sWhere  := '';
  sFrom   := '';

  CalcularFiltro(sFrom, sWhere);

  if chkAbiertas.Checked then
    sWhere := sWhere + ' AND INO.NO_FECHACUMPLIMIENTO IS NULL';

  if chkCerrada.Checked then
    sWhere := sWhere + ' AND INO.NO_FECHACUMPLIMIENTO IS NOT NULL';

  if chkDerivada.Checked then
    sWhere := sWhere + ' AND INO.NO_FECHADERIVADO IS NOT NULL';
//  else
//    sWhere := sWhere + ' AND INO.NO_FECHADERIVADO IS NULL';

  if chkNoAsignada.Checked then
    sWhere := sWhere + ' AND INO.NO_FECHADERIVADO IS NULL';

  sdqConsulta.SQL.Text := 'SELECT ien.en_descripcion, ims.ms_descripcion, ino.no_id, ' +
                          '       DECODE (TRIM (ino.no_tiposolicitante), ' +
                          '               ''0'', (SELECT se_nombre ' +
                          '                       FROM art.use_usuarios ' +
                          '                      WHERE se_id = ino.no_solicitante), ' +
                          '               ''1'', (SELECT sc_descripcion ' +
                          '                       FROM art.usc_sectores ' +
                          '                      WHERE sc_id = ino.no_solicitante), ' +
                          '               ''2'', (SELECT sn_descripcion ' +
                          '                       FROM emi.isn_solicitantesnota ' +
                          '                      WHERE sn_id = ino.no_solicitante), ' +
                          '               ''N/D'' ' +
                          '              ) solicitante, ' +
                          '       ino.no_fecharecepcion, ino.no_fecharecepcionart, no_solicitante, ' +
                          '       ino.no_idmotivosolicitudnota, ino.no_contrato, ino.no_derivado, ' +
                          '       ino.no_fechaderivado, ino.no_observaciones, ino.no_bibliorato, ' +
                          '       ino.no_secuencia, ino.no_fechacumplimiento, ino.no_usuariocumplimiento, ' +
                          '       ino.no_idevento, ino.no_usualta, ino.no_fechaalta, ino.no_usumodif, ' +
                          '       ino.no_fechamodif, ino.no_fechabaja, ino.no_usubaja, ' +
                          '       ino.no_idmotivosolicitudnota, ino.no_observacionescumplimiento, ' +
                          '       ino.no_idestadonota, ino.no_tiposolicitante, ino.no_notaempresa, ' +
                          '       ino.no_idloteddjj, no_idsolicitudautorizacion ' +
                          'FROM EMI.INO_NOTA INO, ' +
                          '     EMI.IEN_ESTADONOTA IEN, ' +
                          '     EMI.IMS_MOTIVOSOLICITUDNOTA IMS ' + sFrom +
                          'WHERE (    (INO.NO_IDESTADONOTA = IEN.EN_ID (+)) ' +
                          '       AND (INO.NO_IDMOTIVOSOLICITUDNOTA = IMS.MS_ID (+) )) ' +  sWhere;

  sdqConsulta.SQL.Add(SortDialog.OrderBy);

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.CalcularFiltro(var sFrom, sWhere: string);
begin
  if fraSolicitud.IsSelected then
    sWhere:= sWhere + ' and NO_IDMOTIVOSOLICITUDNOTA = ' + SqlValue(fraSolicitud.Codigo);

  if fraSolicitante.IsSelected then
    sWhere:= sWhere + ' and NO_SOLICITANTE = ' + SqlValue(fraSolicitante.Codigo);

  if edtFechaDesde.Date > 0 then
    sWhere:= sWhere + ' and NO_FECHARECEPCION >= ' + SqlValue(edtFechaDesde.Date);

  if edtFechaHasta.Date > 0 then
    sWhere:= sWhere + ' and NO_FECHARECEPCION <= ' + SqlValue(edtFechaHasta.Date);

  if (edtBibliorato.Text <> '') then
    sWhere:= sWhere + ' and NO_BIBLIORATO = ' + SqlValue(edtBibliorato.Value);

  if (edtSecuencia.Text <> '') then
    sWhere:= sWhere + ' and NO_SECUENCIA = ' + SqlValue(edtSecuencia.Value);

  if fraEmpresaNota.IsSelected then
    sWhere:= sWhere + ' and NO_CONTRATO = ' + SqlValue(fraEmpresaNota.Contrato);

  if (ppPeriodosDesde.Periodo.Valor <> '') or (ppPeriodosHasta.Periodo.Valor <> '') then
    sWhere:= sWhere + ' and Exists (select 1 from EMI.INP_NOTACONTRATOPERIODO where NP_IDNOTA = NO_ID and NP_FECHABAJA IS NULL ';

  if (ppPeriodosDesde.Periodo.Valor <> '') then
    sWhere:= sWhere + ' and NP_PERIODO >= ' + SqlValue(ppPeriodosDesde.Periodo.Valor);

  if (ppPeriodosHasta.Periodo.Valor <> '') then
    sWhere:= sWhere + ' and NP_PERIODO <= ' + SqlValue(ppPeriodosHasta.Periodo.Valor);

  if (ppPeriodosDesde.Periodo.Valor <> '') or (ppPeriodosHasta.Periodo.Valor <> '') then
    sWhere:= sWhere + ' ) ';

  if chkNotaProvieneEmpresa.Tag > 0  then
    sWhere:= sWhere + ' and NO_NOTAEMPRESA = ' + SqlValue(chkNotaDelaEmpresa.Checked);

  if fraEstadoNota.IsSelected then
    sWhere:= sWhere + ' and NO_IDESTADONOTA = ' + SqlValue(fraEstadoNota.Codigo);

  if (edtNroNota.Text <> '') then
    sWhere:= sWhere + ' and NO_ID = ' + SqlValue(edtNroNota.Value);

end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbLimpiarClick(Sender: TObject);
begin
  fraSolicitud.Limpiar;
  fraSolicitante.Limpiar;
  fraEstadoNota.Limpiar;
  chkNotaDelaEmpresa.Checked := false;
  fraAutorizacionRequerimiento.Limpiar;
  edtFechaDesde.Clear;
  edtFechaHasta.Clear;
  edtNroNota.Clear;
  edtBibliorato.Clear;
  edtSecuencia.Clear;
  ppPeriodosDesde.Clear;
  ppPeriodosHasta.Clear;
  fraEmpresaNota.Clear;
  chkNotaDelaEmpresa.Checked := false;
  edtObservacionesEvento.Clear;
  chkSGC.Checked := false;
  edtEvento.Clear;
  edtNroNota.Clear;
  chkNotaProvieneEmpresa.Tag := 0;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.chkNotaDelaEmpresaClick(Sender: TObject);
begin
  chkNotaProvieneEmpresa.Tag := 1;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbNuevoClick(Sender: TObject);
begin
  SetearComponentesForm(mfABM);
  HabilitarCargaDDJJ(True);
  inherited;
end;

procedure TFrmRecepcionNota.tbModificarClick(Sender: TObject);
begin
  FIdEvento := sdqConsulta.FieldByName('NO_IDEVENTO').AsInteger;

  if not sdqConsulta.FieldByName('NO_DERIVADO').IsNull or
     not sdqConsulta.FieldByName('NO_FECHACUMPLIMIENTO').IsNull then
  begin
      SetearComponentesForm(mfGestionar);
  end
  else if ( (sdqConsulta.FieldByName('NO_IDMOTIVOSOLICITUDNOTA').IsNull) or
            (sdqConsulta.FieldByName('NO_BIBLIORATO').IsNull) OR
            (sdqConsulta.FieldByName('NO_BIBLIORATO').IsNull) ) then
       begin
          if (MessageBox(0, 'La nota no ha sido asignada. Al Editarla deberá asignarle una localización',
                            'Confirmación de Asignación', MB_ICONQUESTION or MB_YESNO) = idYes) then
            SetearComponentesForm(mfABM)
          else exit;
       end;
   HabilitarCargaDDJJ(False);
   inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.GridDblClick(Sender: TObject);
begin
  SetearComponentesForm(mfABM);
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.SetearComponentesForm(modoForm: TModoForm);
begin
  FModoForm := mfAbm;

  if (modoForm = mfABM) then
  begin
    btnGestionar.Visible := false;
    btnSimulacion.Visible := false;
    btnAutorizacion.Visible := false;
    VCLExtra.LockControls([edtFechaRecepcionART, edtBibliorato, edtSecuencia, mObservacion], false);
    fraEmpresaSolicitud.Locked := false;
    fraSolicitudAbm.Locked := false;
    btnAceptar.Enabled := true;
    chkNotaProvieneEmpresa.Enabled := true;
    edtEventoNota.Enabled := true;
  end;

  if (modoForm = mfGestionar) then
  begin
    btnGestionar.Visible := true;
    btnSimulacion.Visible := true;
    btnAutorizacion.Visible := true;
    VCLExtra.LockControls([edtFechaRecepcionART, edtBibliorato, edtSecuencia, mObservacion], true);
    fraEmpresaSolicitud.Locked := true;
    fraSolicitudAbm.Locked := true;
    btnAceptar.Enabled := false;
    chkNotaProvieneEmpresa.Enabled := false;
    edtEventoNota.Enabled := false;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmRecepcionNota.ValidarDerivacion: boolean;
begin
    Result := VerificarMultiple([fpDerivacionNota.Caption,
                                  edtFechaDerivacion, edtFechaDerivacion.Date > 0 , 'Debe especificar la fecha de la derivación.',
                                  fraDerivador, fraDerivador.IsSelected , 'Debe especificar el usuario/sector a derivar.'
                                ]);
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnAceptarDerivacionClick(Sender: TObject);
begin
  if ValidarDerivacion then
  begin
    try
      BeginTrans(true);
      GuardarDatosDerivacion(sdqConsulta.FieldByName('NO_ID').AsInteger);
      CommitTrans(true);
      fpDerivacionNota.Close;
      tbRefrescar.Click;
    except
      on E: Exception do begin
        Rollback(true);
        MsgBox('Error al guardar los datos de la derivación. ' + #13#10 + E.Message, MB_ICONERROR, fpDerivacionNota.Caption)
      end;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.GuardarDatosDerivacion(aIdNota: integer);
begin
  EjecutarSqlST('update EMI.INO_NOTA ' +
                  ' set NO_IDESTADONOTA = ' + SqlValue(5{ESTADO_NOTA_DERIVADA}) + ',' +
                  ' NO_DERIVADO = ' + SqlValue(Copy (fraDerivador.Descripcion, 1, 20)) + ',' +
                  ' NO_FECHADERIVADO = ' + SqlValue(edtFechaDerivacion.Date) + ',' +
                  ' NO_OBSERVACIONESDERIVADO = ' + SqlValue(mObservacionesDerivacion.Text) +
                  ' where NO_ID = ' + SqlValue(aIdNota));
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.fpDerivacionNotaShow(Sender: TObject);
begin
  VCLExtra.LockControl(edtFechaDerivacion, true);
  edtFechaDerivacion.Date := DBDate;
  rgpTipoDerivacionClick(Sender);
end;
{------------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
{  NOTA                                                                        }
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.fpAbmShow(Sender: TObject);
begin
  inherited;

  pgNotas.ActivePageIndex := 0;

  if (ModoABM = maModificacion) and (sdqConsulta.FieldByName('NO_IDESTADONOTA').AsInteger <> 1{ESTADO_NOTA_PENDIENTE}) then
  begin
    MsgBox('El estado de la nota es ' + sdqConsulta.FieldByName('EN_DESCRIPCION').AsString + #13#10 +
           'Sólo las notas en estado Pendiente pueden modificarse', MB_ICONWARNING, 'Solicitudes de Revisión');
    btnAceptar.Enabled := false;
  end;


  CheckBank;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.ClearControls;
begin
  inherited;

  fraSolicitanteNota.Clear;
  rgpTipoSolicitante.ItemIndex := 0;
  rgpTipoSolicitanteClick(self);
  fraSolicitanteNota.Codigo := Sesion.LoginName;
  edtFechaSolicitud.Date := DBDate;
  edtFechaRecepcionART.Clear;
  fraSolicitudAbm.Limpiar;
  chkNotaProvieneEmpresa.Checked := false;
  fraEmpresaSolicitud.Clear;

  ppPeriodoDesdeSolicitud.Periodo.SetPeriodoActual;
  ppPeriodoHastaSolicitud.Periodo.SetPeriodoActual;
  dblPeriodosSeleccionados.Clear;
  cdsPeriodos.EmptyDataSet;
  edtEventoNota.Clear;
  mObservacion.Clear;

  edtBiblioratoNota.Clear;
  edtSecuenciaNota.Clear;
  edtNroGestion.Clear;
  tbGestion.Visible := false;
  tbAprobacion.Visible := false;

  cdsDDJJ.EmptyDataSet;
  LimpiarDDJJ;

  fraTipoFormulario.Clear;
  fraTipoNomina.Clear;
  ppPeriodoDesdeDDJJ.Periodo.SetPeriodoActual;
  ppPeriodoHastaDDJJ.Periodo.SetPeriodoActual;
  fraObservacion.Clear;
  mObservacionDDJJ.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.LoadControls;
begin
  inherited;
  LimpiarDDJJ;
  rgpTipoSolicitante.ItemIndex   := sdqConsulta.fieldbyname('NO_TIPOSOLICITANTE').AsInteger;
  rgpTipoSolicitanteClick(self);
  fraSolicitanteNota.Value       := sdqConsulta.fieldbyname('NO_SOLICITANTE').AsInteger;
  edtFechaSolicitud.Date         := sdqConsulta.fieldbyname('NO_FECHARECEPCION').AsDateTime;
  edtFechaRecepcionART.Date      := sdqConsulta.fieldbyname('NO_FECHARECEPCIONART').AsDateTime;
  fraSolicitudAbm.Codigo         := sdqConsulta.fieldbyname('NO_IDMOTIVOSOLICITUDNOTA').AsString;
  fraEmpresaSolicitud.Contrato   := sdqConsulta.fieldbyname('NO_CONTRATO').AsInteger;
  chkNotaProvieneEmpresa.Checked := (sdqConsulta.fieldbyname('NO_NOTAEMPRESA').AsString = 'S');
  CargarPeriodosAsignados(sdqConsulta.fieldbyname('NO_ID').AsInteger);
  edtEventoNota.Text             := sdqConsulta.fieldbyname('NO_IDEVENTO').AsString;
  mObservacion.Text              := sdqConsulta.fieldbyname('NO_OBSERVACIONES').AsString;
  edtBiblioratoNota.Text         := sdqConsulta.fieldbyname('NO_BIBLIORATO').AsString;
  edtSecuenciaNota.Text          := sdqConsulta.fieldbyname('NO_SECUENCIA').AsString;
//  fraSolicitanteNota.Codigo      := sdqConsulta.fieldbyname('NO_SOLICITANTE').AsString;

  GetDatosGestion;
  GetDatosAprobacion;

  VerificarRequeridosPorAsignacion;


end;

procedure TFrmRecepcionNota.GetDatosGestion;
begin
  tbGestion.Visible              := not sdqConsulta.fieldbyname('NO_IDLOTEDDJJ').IsNull;
  edtNroGestion.Value := sdqConsulta.fieldbyname('NO_IDLOTEDDJJ').AsInteger;
end;

procedure TFrmRecepcionNota.GetDatosAprobacion;
begin
  if not sdqConsulta.fieldbyname('NO_IDSOLICITUDAUTORIZACION').IsNull then
  begin
    pnDetalleAutorizacion.Visible := true;
    edtNroAutorizacion.Value := sdqConsulta.fieldbyname('NO_IDSOLICITUDAUTORIZACION').AsInteger;
    lblDetalleAutorizacion.Caption :=
      get_descripcionautorizacion(sdqConsulta.fieldbyname('NO_IDSOLICITUDAUTORIZACION').AsInteger);
//Pablo    fpAbm.Height := 525;
  end
  else
  begin
    pnDetalleAutorizacion.Visible := false;
//Pablo    fpAbm.Height := 420;
  end;
end;

{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.VerificarRequeridosPorAsignacion;
begin
  if edtBiblioratoNota.IsEmpty and (FModoForm = mfABM) then
  begin
      edtBiblioratoNota.Color := $00C4D7FF;
      edtSecuenciaNota.Color := $00C4D7FF;
  end else
  begin
      edtBiblioratoNota.Color := clWindow;
      edtSecuenciaNota.Color := clWindow;
  end;

  if not fraSolicitudAbm.IsSelected and (FModoForm = mfABM) then
  begin
    fraSolicitudAbm.edCodigo.Color := $00C4D7FF;
    fraSolicitudAbm.cmbDescripcion.Color := $00C4D7FF;
  end
  else
  begin
    fraSolicitudAbm.edCodigo.Color := clWindow;
    fraSolicitudAbm.cmbDescripcion.Color := clWindow;
  end;
end;


procedure TFrmRecepcionNota.LimpiarEvento;
begin
  edtFechaEvento.Clear;
  edtFechaCarga.Clear;
  edtFechaVencimiento.Clear;
  edtDescripcionPrioridadEvento.Clear;
  edtFechaRealizacion.Clear;
  chkNotificado.Checked := False;
  edtDescripcionCargo.Clear;
  edtDescripcionContacto.Clear;
  edtDescripcionSectorInterviniente.Clear;
  edtDescripcionUsuarioInterviniente.Clear;
  edtUsuarioDerivacion.Clear;
  edtObservaciones.Clear;
  sdqEvolucion.close;
  mObservacionesCumplimiento.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnAceptarClick(Sender: TObject);
begin
  inherited;
  tbRefrescar.Click;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnCancelarClick(Sender: TObject);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbMostrarDetalleClick(Sender: TObject);
begin
  MostrarDetalleEvento(edtEventoNota.Value);
end;
{------------------------------------------------------------------------------}
function TFrmRecepcionNota.DoABM: Boolean;
var
 aIdNotaSimilar: integer;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    aIdNotaSimilar := -1;
(*
    if (ModoABM = maModificacion) then
      //Si existe una solicitud con características similares se anexan los períodos a la otra
      aIdNotaSimilar := ValorSql('select NO_ID from EMI.INO_NOTA where no_contrato = ' + SqlValue(fraEmpresaSolicitud.Contrato) +
                        ' and no_fechabaja is null and NO_IDMOTIVOSOLICITUDNOTA = ' + SqlValue(fraSolicitudAbm.Codigo) + ' and NO_IDESTADONOTA = 1 ' +
                        ' and no_id <> ' +  sdqConsulta.FieldByName('NO_ID').AsString, '-1')
    else
      if (ModoABM = maAlta) then
        //Si existe una solicitud con características similares se anexan los períodos a la otra
        aIdNotaSimilar := ValorSql('select NO_ID from EMI.INO_NOTA where no_contrato = ' + SqlValue(fraEmpresaSolicitud.Contrato) +
                          ' and no_fechabaja is null and NO_IDMOTIVOSOLICITUDNOTA = ' + SqlValue(fraSolicitudAbm.Codigo) + ' and NO_IDESTADONOTA = 1 ', '-1');
*)
    if (aIdNotaSimilar <> -1) then
    begin
      AgregarPeriodosASolicitud(aIdNotaSimilar);
      EjecutarSqlSt('UPDATE EMI.INO_NOTA SET NO_USUMODIF = ' + SqlValue(Sesion.LoginName) +
                    ', NO_FECHAMODIF = SYSDATE WHERE NO_ID = ' + SqlValue(aIdNotaSimilar));
      if ModoABM = maModificacion then
        EjecutarSqlSt('UPDATE EMI.INO_NOTA SET NO_USUBAJA = ' + SqlValue(Sesion.LoginName) +
                      ', NO_FECHABAJA = SYSDATE WHERE NO_ID = ' + SqlValue(sdqConsulta.FieldByName('NO_ID').AsInteger));
    end
    else begin
      if ModoABM = maBaja Then
      begin
        Sql.PrimaryKey.Add('NO_ID', sdqConsulta.FieldByName('NO_ID').AsInteger );
        Sql.Fields.Add('NO_USUBAJA', Sesion.LoginName );
        Sql.Fields.Add('NO_FECHABAJA', exDateTime );
        Sql.SqlType := stUpdate;
      end else begin
        Sql.Fields.Add('NO_TIPOSOLICITANTE', rgpTipoSolicitante.ItemIndex);
        Sql.Fields.Add('NO_SOLICITANTE', fraSolicitanteNota.ID);
        Sql.Fields.Add('NO_FECHARECEPCION', edtFechaSolicitud.Date);
        Sql.Fields.Add('NO_FECHARECEPCIONART', edtFechaRecepcionART.Date);
        Sql.Fields.Add('NO_IDMOTIVOSOLICITUDNOTA', fraSolicitudAbm.Codigo);
        Sql.Fields.Add('NO_CONTRATO', fraEmpresaSolicitud.Contrato);
        Sql.Fields.Add('NO_OBSERVACIONES', mObservacion.Text);
        Sql.Fields.Add('NO_IDESTADONOTA', 1);//PENDIENTE
        Sql.Fields.Add('NO_BIBLIORATO', edtBiblioratoNota.Value, true);
        Sql.Fields.Add('NO_SECUENCIA', edtSecuenciaNota.Value, true);
        Sql.Fields.Add('NO_NOTAEMPRESA', chkNotaProvieneEmpresa.Checked);

        if ModoABM = maAlta Then
        begin
          Sql.PrimaryKey.Add('NO_ID', GetSecNextVal('emi.seq_ino_id'));
          Sql.Fields.Add('NO_USUALTA', Sesion.LoginName );
          Sql.Fields.Add('NO_FECHAALTA', exDateTime );
          Sql.Fields.Add('NO_IDEVENTO', edtEventoNota.Value, true);          
        end else begin
          Sql.PrimaryKey.Add('NO_ID', sdqConsulta.FieldByName('NO_ID').AsInteger);
          Sql.Fields.Add('NO_USUMODIF', Sesion.LoginName);
          Sql.Fields.Add('NO_FECHAMODIF', exDateTime );
          Sql.Fields.Add('NO_USUBAJA', exNull );
          Sql.Fields.Add('NO_FECHABAJA', exNull );
        end;
      end;
      EjecutarSqlST( GetSqlABM );
      AgregarPeriodosASolicitud(Sql.PrimaryKey[0].Value);
    end;
    CommitTrans(true);
    if (aIdNotaSimilar <> -1) and (ModoABM = maAlta) then
        MsgBox('La solicitud fue añadida a la número ' + SqlValue(aIdNotaSimilar) +
                ' que es idéntica a ésta.', MB_ICONINFORMATION, Self.Caption);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la solicitud.');
    end;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmRecepcionNota.Validar: Boolean;
begin

    pgNotas.ActivePageIndex := 0;

    Result := VerificarMultiple(['Recepción de Notas',
                                  fraSolicitanteNota, fraSolicitanteNota.IsSelected , 'Debe especificar el solicitante.',
                                  edtFechaSolicitud, edtFechaSolicitud.Date > 0 , 'Debe especificar la fecha de la solicitud.',
                                  edtFechaRecepcionART, (edtFechaRecepcionART.Date > 0), 'Debe especificar una fecha de presentación',
                                  fraSolicitudAbm, fraSolicitudAbm.IsSelected , 'Debe especificar el tipo de solicitud.',
                                  fraEmpresaSolicitud, fraEmpresaSolicitud.IsSelected, 'Debe especificar una empresa para la solicitud.',
//                                  dblPeriodosSeleccionados, dblPeriodosSeleccionados.Count > 0 , 'Debe especificar una empresa para la solicitud.',
                                  edtBiblioratoNota, not (edtBiblioratoNota.IsEmpty), 'Debe especificar el bibliorato para la solicitud.',
                                  edtSecuenciaNota, not (edtSecuenciaNota.IsEmpty), 'Debe especificar la secuencia para la solicitud.',
                                  edtBiblioratoNota, not ExisteBibliorato, 'El bibliorato y la secuencia ya exiten en otra solicitud.'
                                ]);

    Result := VerificarPeriodosValidos;

    if (not cdsDDJJ.IsEmpty) or fraTipoFormulario.IsSelected or fraTipoNomina.IsSelected then
    begin
      pgNotas.ActivePageIndex := 1;

      Result := VerificarMultiple(['Validando Período Individual',
                                    fraTipoFormulario, (fraTipoFormulario.IsSelected) or (cdsDDJJ.IsEmpty), 'Debe seleccionar un formulario',
                                    dbgMultiperiodo, ((fraTipoFormulario.IsSelected and fraTipoNomina.IsSelected) or (cdsDDJJ.IsEmpty)), 'Seleccionó el tipo de formulario o el tipo de nómina cargados y no agregó la presentación.',
                                    fraTipoNomina, (fraTipoNomina.IsSelected) or (cdsDDJJ.IsEmpty), 'Debe seleccionar un tipo de nómina.',
                                    dbgMultiperiodo, (dblPeriodosSeleccionados.Count > 0) or (not cdsDDJJ.IsEmpty), 'Debe agregar algún período o nómina.'
                                           ]);

      Result := ValidarDDJJCargadas;

    end;


end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.CargarPeriodosAsignados(aIdNota: integer);
var
  Query : TSDQuery;
begin
  cdsPeriodos.EmptyDataSet;
  cdsDDJJ.EmptyDataSet;
  dblPeriodosSeleccionados.Clear;

  Query := GetQuery('SELECT * ' +
                    'FROM EMI.INP_NOTACONTRATOPERIODO INP, ' +
                    'EMI.IDJ_DDJJ, ' +
                    'EMI.IEV_ESTADOVERIFICADO ' +
                    'WHERE INP.NP_IDDDJJ = DJ_ID(+) AND DJ_ESTADO = EV_ID(+) AND NP_IDNOTA = ' + SqlValue(aIdNota));
  try

    if Query.RecordCount > 0 then
    begin
      while not Query.Eof do
      begin
        if Query.fieldbyname('NP_IDDDJJ').IsNull then
        begin
          with cdsPeriodos do
          begin
            Append;
            FieldByName('NP_ID').AsInteger := Query.fieldbyname('NP_ID').AsInteger;
            FieldByName('NP_PERIODO').AsString := Query.fieldbyname('NP_PERIODO').AsString;
            FieldByName('NP_FECHABAJA').Value := Query.fieldbyname('NP_FECHABAJA').Value;
            if Query.fieldbyname('NP_FECHABAJA').IsNull then
              dblPeriodosSeleccionados.Items.Add(Query.fieldbyname('NP_PERIODO').AsString);
            Post;
            cdsPeriodos.IndexDefs.Update;
          end;
        end
        else begin
          with cdsDDJJ do
          begin
            if not fraTipoFormulario.IsSelected then fraTipoFormulario.Codigo := Query.fieldbyname('DJ_IDFORMULARIO').AsString;
            if not fraTipoNomina.IsSelected then fraTipoNomina.Codigo := Query.fieldbyname('DJ_IDTIPONOMINA').AsString;
            Append;
            FieldByName('Periodo').AsString := Query.fieldbyname('NP_PERIODO').AsString;
            FieldByName('Empleados').AsInteger := Query.fieldbyname('DJ_EMPLEADOS').AsInteger;
            FieldByName('Masa').AsFloat := Query.fieldbyname('DJ_MASASALARIAL').AsFloat;
            FieldByName('ImpCeros').AsInteger := Query.fieldbyname('DJ_IMPORTESCERO').AsInteger;
            FieldByName('FechaPresentacion').AsDateTime := Query.fieldbyname('DJ_FECHAPRESENTACION').AsDateTime;
            FieldByName('Rectificativa').AsInteger := Query.fieldbyname('DJ_CODIGORECTIFICATIVA').AsInteger;
            FieldByName('IdDDJJ').AsInteger := Query.fieldbyname('DJ_ID').AsInteger;
            FieldByName('IdEstado').AsInteger := Query.fieldbyname('EV_ID').AsInteger;
            FieldByName('Estado').AsString := Query.fieldbyname('EV_DESCRIPCION').AsString;
            FieldByName('IdAutorizacion').AsInteger := Query.fieldbyname('DJ_IDSOLICITUDAUTORIZACION').AsInteger;
            Post;
            IndexDefs.Update;
          end;
        end;

        Query.Next;
      end;
    end;
  finally
      Query.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbAddDDJJClick(Sender: TObject);
begin
  ValidarDDJJ;
  AgregarDDJJ;
end;
{------------------------------------------------------------------------------}
function TFrmRecepcionNota.ValidarPeriodos: boolean;
begin
  if (ppPeriodoDesdeSolicitud.Periodo.Ano > ppPeriodoHastaSolicitud.Periodo.Ano)
      or ((ppPeriodoDesdeSolicitud.Periodo.Ano = ppPeriodoHastaSolicitud.Periodo.Ano) and
          (ppPeriodoDesdeSolicitud.Periodo.Mes > ppPeriodoHastaSolicitud.Periodo.Mes)) then
  begin
    InvalidMsg(ppPeriodoDesdeSolicitud, 'El período inicial debe ser menor o igual al final' );
    result := false;
  end
  else result := true;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.ReCargarPeriodosAsignados;
begin
  dblPeriodosSeleccionados.Clear;
  cdsPeriodos.First;
  while not cdsPeriodos.Eof do
  begin
    if (cdsPeriodos.fieldbyname('NP_FECHABAJA').IsNull) then
      dblPeriodosSeleccionados.Items.Add(cdsPeriodos.fieldbyname('NP_PERIODO').AsString);
    cdsPeriodos.Next;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnGestionarClick(Sender: TObject);
begin
  if not Validar then Exit;
  with TfrmSeleccionLote.Create(self) do
  begin
    try
      FormStyle := fsNormal;
      if (showmodal = mrOk) and (IsSelected) then
      begin
        BeginTrans(true);
        GuardarDDJJAignadasalLote(IdLoteSelecciondo);
        AgregarPeriodosASolicitud(sdqConsulta.FieldByName('NO_ID').AsInteger);
        CambiarEstadoNota(sdqConsulta.FieldByName('NO_ID').AsInteger, 3{ESTADO_NOTA_GESTION_REALIZADA});
        fpAbm.ModalResult := mrCancel;
        CommitTrans(true);
        sdqConsulta.Refresh;
      end;
    except
      on E: Exception do begin
        Rollback(true);
        MsgBox('Error al guardar: ' + E.Message, MB_ICONERROR, fpAbm.Caption)
      end;
    end;
    free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.GuardarDDJJAignadasalLote(
  aIdLoteSelecciondo: integer);
var
  aidDJ: integer;
begin
  try
    cdsPeriodos.First;
    while not cdsPeriodos.Eof do
    begin
      if cdsPeriodos.FieldByName('NP_FECHABAJA').IsNull then
      begin
        aidDJ := ValorSql('select NVL(EMI.UTIL_EMI.get_ultimapresentacionperiodo(' + SqlValue(fraEmpresaSolicitud.Contrato) +
                  ', ' +  SqlValue(cdsPeriodos.FieldByName('NP_PERIODO').AsString)  + '), -1) from dual ' , '-1');
        if (aidDJ <> -1) then
          EjecutarSqlST('insert into EMI.ILD_LOTEDDJJ(LD_ID, LD_IDDDJJ, LD_IDLOTE, LD_FECHAINICIOGESTION, LD_FECHAVENCIMIENTOGESTION)' +
                        ' values(emi.seq_idl_id.nextval, ' + SqlValue(aidDJ) + ', ' + SqlValue(aIdLoteSelecciondo) +
                        ', SYSDATE, sysdate + nvl(EMI.UTIL_EMI.get_parametrobyclave(''TDG''),0)) ');
      end;
      cdsPeriodos.Next;
    end;
  except
    on E: Exception do begin
      raise Exception.Create(' DDJJ Asignadas.' + #13#10 + e.Message);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.CambiarEstadoNota(aIdNota,
  aNewEstado: integer);
begin
  try
    EjecutarSqlST('update EMI.INO_NOTA ' +
                  ' set NO_IDESTADONOTA = ' + SqlValue(aNewEstado) +
                  ' where NO_ID = ' + SqlValue(aIdNota));
  except
    on E: Exception do begin
      raise Exception.Create(' Cambio de Estado de la Nota.' + #13#10 + e.Message);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnSimulacionClick(Sender: TObject);
begin
//  inherited;
  with TFrmSimulacion.create(self) do
  try
//    FormStyle := fsNormal;
//    hide;
    showmodal;
  finally
    free;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmRecepcionNota.VerificarPeriodosValidos: boolean;
var
  i: integer;
begin
  result := true;
  for i:= 0 to dblPeriodosSeleccionados.Count - 1 do
    if ValorSql('select ART.COBRANZA.check_cobertura_periodocobranz(' + SqlValue(fraEmpresaSolicitud.Contrato) +
                ' , ' +  SqlValue(Trim(dblPeriodosSeleccionados.Items[i])) + ') from dual ', '-1') <> 1 then
    begin
      result := false;
      InvalidMsg(dblPeriodosSeleccionados, 'En el período ' + Trim(dblPeriodosSeleccionados.Items[i]) + ' la empresa no posee cobertura' );
      abort;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.AgregarPeriodosASolicitud(
  aIdNota: integer);
var
  CountPresent: integer;
begin

  cdsPeriodos.First;
  while not cdsPeriodos.Eof do
  begin
    if not ExistePeriodo(aIdNota, cdsPeriodos.FieldByName('NP_PERIODO').AsString) then
      EjecutarSqlST('INSERT INTO EMI.INP_NOTACONTRATOPERIODO(NP_ID, NP_IDNOTA, NP_PERIODO, NP_USUALTA, NP_FECHAALTA) ' +
                    'VALUES(emi.seq_inp_id.NEXTVAL, ' + SqlValue(aIdNota) + ',' + SqlValue(cdsPeriodos.FieldByName('NP_PERIODO').AsString)  +
                    ',' + SqlValue(Sesion.LoginName) + ', SYSDATE)' )
    else EjecutarSqlST('UPDATE EMI.INP_NOTACONTRATOPERIODO SET NP_FECHAMODIF = SYSDATE, NP_USUMODIF = ' + SqlValue(Sesion.LoginName) +
                    ', NP_FECHABAJA = ' + SqlValue(cdsPeriodos.FieldByName('NP_FECHABAJA').AsDateTime) + ', NP_USUBAJA = '  +
                    iif(cdsPeriodos.FieldByName('NP_FECHABAJA').IsNull, SQL_NULL, '''' + Sesion.LoginName + '''') +
                    ' where np_periodo = ' + SqlValue( cdsPeriodos.FieldByName('NP_PERIODO').AsString) +
                    ' and np_idnota = ' + SqlValue(aIdNota));
    cdsPeriodos.Next;
  end;

  if not cdsDDJJ.IsEmpty then
  begin

    cdsDDJJ.DisableControls;
    IniciarEspera('Agregando Presentaciones...');
    try
      CountPresent := 0;
      cdsDDJJ.First;
      while not cdsDDJJ.Eof do
      begin
        if cdsDDJJ.FieldByName('Estado').IsNull then
        begin
          do_incorporardeclperiodonota(aIdNota, fraEmpresaSolicitud.Contrato,
             cdsDDJJ.FieldByName('Periodo').AsString,
             cdsDDJJ.FieldByName('FechaPresentacion').AsDateTime,
             cdsDDJJ.FieldByName('Empleados').AsInteger,
             cdsDDJJ.FieldByName('Masa').AsFloat,
             cdsDDJJ.FieldByName('ImpCeros').AsInteger,
             cdsDDJJ.FieldByName('Masa').AsFloat,
             cdsDDJJ.FieldByName('Empleados').AsInteger,
             cdsDDJJ.FieldByName('ImpCeros').AsInteger,
             fraTipoFormulario.Value,
             fraTipoNomina.Value, cdsDDJJ.FieldByName('Rectificativa').AsString,
             fraObservacion.Value, mObservacion.Text);

            do_activardeclaracion(fraEmpresaSolicitud.Contrato, cdsDDJJ.FieldByName('Periodo').AsString);
            Inc(CountPresent);
        end;
        cdsDDJJ.Next;
      end;

      if CountPresent > 0 then do_devengarinvalidcontrato(fraEmpresaSolicitud.Contrato);
    finally
      DetenerEspera;
      cdsDDJJ.EnableControls;
    end;
  end;

end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
{     Asignación                                                               }
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbAsignarmotivoEventoClick(Sender: TObject);
begin
//  inherited;
  if (sdqConsulta.Active) and (sdqConsulta.RecordCount > 0) then
  begin
    if IsEmptyString(sdqConsulta.FieldByName('NO_BIBLIORATO').AsString) and not
      IsEmptyString(sdqConsulta.FieldByName('NO_IDEVENTO').AsString) then
      AsignarNota;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.AsignarNota;
begin
   FIdEvento := sdqConsulta.FieldByName('NO_IDEVENTO').AsInteger;
   FIdNota   := sdqConsulta.FieldByName('NO_ID').AsInteger;
   LimpiarAsignarNota;
   CargarAsignarNota;
   fpAsignacionNota.ShowModal;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.LimpiarAsignarNota;
begin
  fraMotivoSolicitudNotaAsignacion.Clear;
  edtBiblioratoNotaAsignacion.Clear;
  edtSecuenciaNotaAsignacion.Clear;
  mObservacionNotaAsignacion.Clear;
  mDetalleEvento.Lines.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.CargarAsignarNota;
begin
  fraMotivoSolicitudNotaAsignacion.Value := sdqConsulta.FieldByName('no_idmotivosolicitudnota').Asinteger;
  edtBiblioratoNotaAsignacion.Value := sdqConsulta.FieldByName('no_bibliorato').Asinteger;
  edtSecuenciaNotaAsignacion.Value := sdqConsulta.FieldByName('no_secuencia').Asinteger;

  if FIdEvento > 0 then
       GetDetalleEvento(sdqConsulta.FieldByName('no_idevento').AsInteger)
  else mObservacionNotaAsignacion.Lines.Add(sdqConsulta.FieldByName('NO_OBSERVACIONES').Asstring);
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnCancelarAsignacionClick(Sender: TObject);
begin
  fpAsignacionNota.Close;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnAceptarAsignacionClick(Sender: TObject);
begin
  GrabarAsignacion;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.GrabarAsignacion;
begin
  VerificarMultiple(['Validando asignación',
              fraMotivoSolicitudNotaAsignacion, fraMotivoSolicitudNotaAsignacion.IsSelected,
              'Debe seleccionar un motivo de solicitud de nota',
              edtBiblioratoNotaAsignacion, not edtBiblioratoNotaAsignacion.IsEmpty, 'Debe completar un Nro. de Bibliorato',
              edtSecuenciaNotaAsignacion, not edtSecuenciaNotaAsignacion.IsEmpty, 'Debe completar un Nro. de Secuencia']);

  EjecutarSql('update emi.ino_nota ' +
              ' set no_idmotivosolicitudnota = ' + SqlValue(fraMotivoSolicitudNotaAsignacion.Value) + ', ' +
              '     no_bibliorato = ' + SqlValue(edtBiblioratoNotaAsignacion.Value) + ', ' +
              '     no_secuencia  = ' + SqlValue(edtSecuenciaNotaAsignacion.Value) +
              ' where no_id = ' + SqlValue(FIdNota)
              );

  fpAsignacionNota.Close;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.btnDetalleEventoAsignacionClick(
  Sender: TObject);
begin
  MostrarDetalleEvento(edtEventoNota.Value);
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.tbBuscarEventoClick(Sender: TObject);
var
 evento : integer;
begin
  if edtEventoNota.Enabled then
  begin
    if fraEmpresaSolicitud.IsSelected then
    begin
      Evento := ObtenerEventosAgenda(fraEmpresaSolicitud.Contrato);
      if evento > 0 then
      begin
        edtEventoNota.Value := evento;
        lblNroEventoAsociado.Caption := get_nroevento(edtEventoNota.Value);
      end;
    end
    else MessageDlg('Debe seleccionar un contrato previamente.', mtWarning, [mbOK], 0);
  end;
end;
{------------------------------------------------------------------------------}


procedure TFrmRecepcionNota.GetDetalleEvento(AIdEvento : Integer);
var
  Q : TSDQuery;
  sSql : string;
  sEmpresa : string;
begin
  sSql := SQL_EVENTOS + '   AND SE.SE_IDENTIFICADOR = '  + SqlValue(AIdEvento);

  Q := GetQuery(sSql);
  try
    tbMostrarDetalleEvento.Visible := Q.RecordCount > 0 ;
    if Q.RecordCount > 0 then
    begin
      sEmpresa :=
            ValorSQLEx('SELECT TO_CHAR(CO_CONTRATO) || '' - '' || EM_NOMBRE FROM AEM_EMPRESA, ' +
                       '        ACO_CONTRATO '                                                  +
                       ' WHERE CO_IDEMPRESA = EM_ID AND CO_CONTRATO = :CONTRATO',
                       [Q.FieldByName('SE_CONTRATO').AsString]);

      mDetalleEvento.Lines.Add(sEmpresa);
      mDetalleEvento.Lines.Add(Q.FieldByName('IDEVENTO').AsString + ' - ' + Q.FieldByName('SUBEVENTO').AsString);
      mDetalleEvento.Lines.Add('Prioridad: ' + Q.FieldByName('PRIORIDAD').AsString);
      mDetalleEvento.Lines.Add(Q.FieldByName('SE_OBSERVACION').AsString);
    end;
  finally
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.MostrarDetalleEvento(AIdEvento : Integer);
var
 sSql : string;
 Q : TSDQuery;
begin
   if AIdEvento > 0 then
   begin
     LimpiarEvento;
     sSql    := SQL_EVENTOS + '   AND SE.SE_IDENTIFICADOR = '  + SqlValue(AIdEvento);

      Q := GetQuery(sSql);
      if Q.RecordCount > 0 then
      begin
         edtFechaEvento.Date := Q.FieldByName('FECHA').AsDateTime;
         edtFechaCarga.Date :=  Q.FieldByName('SE_FECHAALTA').AsDateTime;
         lblNombreEmpresa.Caption :=
              ValorSQLEx('SELECT TO_CHAR(CO_CONTRATO) || '' - '' || EM_NOMBRE FROM AEM_EMPRESA, ' +
                         '        ACO_CONTRATO '                                                  +
                         ' WHERE CO_IDEMPRESA = EM_ID AND CO_CONTRATO = :CONTRATO',
                         [Q.FieldByName('SE_CONTRATO').AsString]);
         lblEvento.Caption := Q.FieldByName('IDEVENTO').AsString + ' - ' + Q.FieldByName('SUBEVENTO').AsString;
         edtDescripcionEvento.Text := Q.FieldByName('EVENTO').AsString;
         edtDescripcionMotivoEvento.Text := Q.FieldByName('MOTIVO').AsString;
         edtDescripcionIngreso.Text := Q.FieldByName('INGRESO').AsString;
         edtFechaVencimiento.Date := Q.FieldByName('SE_FECHACOMPROMETIDA').AsDateTime;
         edtDescripcionPrioridadEvento.Text := Q.FieldByName('PRIORIDAD').AsString;
         edtFechaRealizacion.Date := Q.FieldByName('SE_FECHAREALIZADO').AsDateTime;
         chkNotificado.Checked := not Q.FieldByName('SE_FECHAREALIZADO').IsNull;
         edtDescripcionCargo.Text :=  Q.FieldByName('SE_CARGO').AsString;
         edtDescripcionContacto.Text := Q.FieldByName('SE_CONTACTO').AsString;
         edtDescripcionSectorInterviniente.Text := Q.FieldByName('SE_SECTORINTERVINIENTE').AsString;
         edtDescripcionUsuarioInterviniente.Text := Q.FieldByName('SE_USUARIOINTERVINIENTE').AsString;
         edtUsuarioDerivacion.Text := Q.FieldByName('SE_USUARIODERIVACIONTELEF').AsString;
         edtObservaciones.Text := Q.FieldByName('SE_OBSERVACION').AsString;
         edtEvento.Text :=  Q.FieldByName('IDENTIFICADOREVENTO').AsString;

         lblNroEventoAsociado.Caption := get_nroevento(Q.FieldByName('IDENTIFICADOREVENTO').AsInteger);

         mObservacionesCumplimiento.Text := Q.FieldByName('SE_USUARIODERIVACIONTELEF').AsString;
         edtBibliorato.Text := Q.FieldByName('NO_BIBLIORATO').AsString;
         edtSecuencia.Text := Q.FieldByName('NO_SECUENCIA').AsString;

         sdqEvolucion.ParamByName('ID').AsInteger := Q.FieldByName('IDEVENTO').AsInteger;
         sdqEvolucion.ParamByName('IDSUBEVENTO').AsInteger := Q.FieldByName('SUBEVENTO').AsInteger;
         sdqEvolucion.Open;
      end
      else raise Exception.Create('Se ha producido un error al intentar recuperar la información asociada al evento.');

      fpDetalleEvento.ShowModal;
   end;
end;
{------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------}
function TFrmRecepcionNota.ExistePeriodo(aIdNota: integer; aperiodo: string): boolean;
begin
  result := ExisteSql('select * from EMI.INP_NOTACONTRATOPERIODO where np_periodo = ' + SqlValue(aperiodo) +
                      ' and np_idnota = ' + SqlValue(aIdNota));
end;
{------------------------------------------------------------------------------}
function TFrmRecepcionNota.ExisteBibliorato: boolean;
var
  idNota : String;
begin
  if sdqConsulta.Active then idNota := sdqConsulta.FieldByName('NO_ID').AsString;
  result := ExisteSql('select * from EMI.INO_NOTA where no_bibliorato = ' + SqlValue(edtBiblioratoNota.Value) +
                      ' and no_fechabaja is null and no_secuencia = ' + SqlValue(edtSecuenciaNota.Value) +
                      iif(ModoABM = maModificacion, ' and no_id <> ' + SqlValue(idNota), ''));
end;
{------------------------------------------------------------------------------}
procedure TFrmRecepcionNota.chkAbiertasClick(Sender: TObject);
begin
  inherited;
//  chkCerrada.Checked := chkAbiertas.Checked xor chkCerrada.Checked;
end;

procedure TFrmRecepcionNota.chkCerradaClick(Sender: TObject);
begin
  inherited;
//  chkAbiertas.Checked := chkAbiertas.Checked xor chkCerrada.Checked;
end;

procedure TFrmRecepcionNota.btnSalirClick(Sender: TObject);
begin
  inherited;
  fpDetalleEvento.close;  
end;

procedure TFrmRecepcionNota.btnAutorizacionClick(Sender: TObject);
begin
  GenerarAutorizacion;
  fpAbm.Close;
end;

procedure TFrmRecepcionNota.LimpiarAutorizacion;
begin
  fraTipoAutorizacion.Clear;
  fraNivelAutorizacion.Clear;
  mObservacionesSolicitudAutorizacion.Clear;
end;

procedure TFrmRecepcionNota.GenerarAutorizacion;
begin
  LimpiarAutorizacion;
  fpSolicitudAutorizacion.ShowModal;
end;

procedure TFrmRecepcionNota.ValidarSolicitudAutorizacion;
begin
  VerificarMultiple(['Generando solicitud de autorización.',
   fraTipoAutorizacion, fraTipoAutorizacion.IsSelected, 'Debe seleccionar un tipo de autorización.',
   fraNivelAutorizacion, fraNivelAutorizacion.IsSelected, 'Debe seleccionar un nivel de autorización.',
   mObservacion, IsEmptyString(mObservacion.Text), 'Debe escribir un texto para la observacion de la autorización']);
end;


procedure TFrmRecepcionNota.btnAceptarSolicitudAutorizacionClick(
  Sender: TObject);
begin
  ValidarSolicitudAutorizacion;
  do_generarautorizacionnota(FIdNota,
            fraTipoAutorizacion.Value,
            fraNivelAutorizacion.Value,
            mObservacionesDerivacion.Text);
end;

procedure TFrmRecepcionNota.CheckBank;
begin
  if (fraEmpresaSolicitud.IsSelected) and
     (not edtBiblioratoNota.IsEmpty ) and
     (not edtSecuenciaNota.IsEmpty)
  then
     TFrmNotasEnBank.CheckBiblioratoSecuenciaContrato(
          fraEmpresaSolicitud.Contrato,
          edtBiblioratoNota.Value,
          edtSecuenciaNota.Value);
end;

procedure TFrmRecepcionNota.edtBiblioratoNotaExit(Sender: TObject);
begin
  inherited;
  CheckBank;
end;

procedure TFrmRecepcionNota.edtSecuenciaNotaExit(Sender: TObject);
begin
  inherited;
  CheckBank;
end;

procedure TFrmRecepcionNota.tbMostrarImagenBankClick(Sender: TObject);
begin
  if (fraEmpresaSolicitud.IsSelected) and
     (not edtBiblioratoNota.IsEmpty ) and
     (not edtSecuenciaNota.IsEmpty)
  then
     TFrmNotasEnBank.LoadBiblioratoSecuenciaContrato(
          fraEmpresaSolicitud.Contrato,
          edtBiblioratoNota.Value,
          edtSecuenciaNota.Value);
end;

procedure TFrmRecepcionNota.rgpTipoSolicitanteClick(Sender: TObject);
begin
  inherited;

  fraSolicitanteNota.Clear;

  with fraSolicitanteNota do
  begin
    case rgpTipoSolicitante.ItemIndex of
      0: begin
        TableName := 'art.use_usuarios';
        FieldID := 'se_id';
        FieldCodigo := 'se_usuario';
        FieldDesc := 'se_nombre';
        FieldBaja := 'se_fechabaja';
      end;

      1: begin
        TableName := 'art.usc_sectores';
        FieldID := 'sc_id';
        FieldCodigo := 'sc_codigo';
        FieldDesc := 'sc_descripcion';
        FieldBaja := 'sc_fechabaja';
      end;

      2: begin
        TableName := 'emi.isn_solicitantesnota';
        FieldID := 'sn_id';
        FieldCodigo := 'sn_id';
        FieldDesc := 'sn_descripcion';
        FieldBaja := 'sn_fechabaja';
      end
    end;

    ShowBajas := true
  end;
end;

procedure TFrmRecepcionNota.rgpTipoDerivacionClick(Sender: TObject);
begin
  inherited;

  with fraDerivador do
  begin
    case rgpTipoDerivacion.ItemIndex of
      0: begin
        TableName := 'art.use_usuarios';
        FieldID := 'se_id';
        FieldCodigo := 'se_id';
        FieldDesc := 'se_nombre';
        FieldBaja := 'se_fechabaja';
      end;

      1: begin
        TableName := 'art.usc_sectores';
        FieldID := 'sc_id';
        FieldCodigo := 'sc_id';
        FieldDesc := 'sc_descripcion';
        FieldBaja := 'sc_fechabaja';
      end;
    end;

    ShowBajas := true
  end;

  fraDerivador.Clear
end;

procedure TFrmRecepcionNota.tbAddPeriodoClick(Sender: TObject);
var
  Mes, Ano, Dia: Word;
begin
  if ValidarPeriodos then
  begin
    Ano := ppPeriodoDesdeSolicitud.Periodo.Ano;
    Mes := ppPeriodoDesdeSolicitud.Periodo.Mes;
    Dia:= 1;
    while ((ppPeriodoHastaSolicitud.Periodo.Ano > Ano)
            or ((ppPeriodoHastaSolicitud.Periodo.Ano = Ano) and
                (ppPeriodoHastaSolicitud.Periodo.Mes >= Mes))) do
    begin
      cdsPeriodos.SetKey;
      cdsPeriodos.FieldByName('NP_PERIODO').AsString := IntToStr(Ano) +   FormatFloat('00' ,Mes);
      if cdsPeriodos.GotoKey then
      begin
        cdsPeriodos.Edit;
        cdsPeriodos.FieldByName('NP_FECHABAJA').Value := NULL;
        cdsPeriodos.Post;
      end
      else begin
        cdsPeriodos.Append;
        cdsPeriodos.FieldByName('NP_ID').Value := NULL;
        cdsPeriodos.FieldByName('NP_FECHABAJA').Value := NULL;
        cdsPeriodos.FieldByName('NP_PERIODO').AsString := IntToStr(Ano) +   FormatFloat('00' ,Mes);
        cdsPeriodos.Post;
      end;
      cdsPeriodos.IndexDefs.Update;
      IncAMonth(Ano, Mes, Dia);
    end;
    ReCargarPeriodosAsignados;
  end;
end;

procedure TFrmRecepcionNota.tbDeletePeriodoClick(Sender: TObject);
var
  Mes, Ano, Dia: Word;
begin
  if ValidarPeriodos then
  begin
    Ano := ppPeriodoDesdeSolicitud.Periodo.Ano;
    Mes := ppPeriodoDesdeSolicitud.Periodo.Mes;
    Dia:= 1;
    while ((ppPeriodoHastaSolicitud.Periodo.Ano > Ano)
            or ((ppPeriodoHastaSolicitud.Periodo.Ano = Ano) and
                (ppPeriodoHastaSolicitud.Periodo.Mes >= Mes))) do
    begin
      cdsPeriodos.SetKey;
      cdsPeriodos.FieldByName('NP_PERIODO').AsString := IntToStr(Ano) +   FormatFloat('00' ,Mes);
      if cdsPeriodos.GotoKey then
      begin
        if not cdsPeriodos.FieldByName('NP_ID').IsNull then
        begin
          cdsPeriodos.Edit;
          cdsPeriodos.FieldByName('NP_FECHABAJA').Value := DBDateTime;
          cdsPeriodos.Post;
        end
        else cdsPeriodos.Delete;
      end;
      cdsPeriodos.IndexDefs.Update;
      IncAMonth(Ano, Mes, Dia);
    end;
    ReCargarPeriodosAsignados;
  end;
end;

procedure TFrmRecepcionNota.tbDeleteDDJJClick(Sender: TObject);
begin
  if not (cdsDDJJ.IsEmpty) and (dbgMultiperiodo.SelectedIndex > -1) then
  begin
    if not cdsDDJJ.FieldByName('Estado').IsNull then
      MsgBox('Esta presentación ya fue procesada y no puede eliminarse.', MB_ICONERROR, self.Caption)
    else
      cdsDDJJ.Delete;
  end;
end;

procedure TFrmRecepcionNota.AgregarDDJJ;
var
  aPeriodo: String;
begin

  aPeriodo := ppPeriodoDesdeDDJJ.Periodo.Valor;

  while (aPeriodo <= ppPeriodoHastaDDJJ.Periodo.Valor) do
  begin
    cdsDDJJ.Append;
    cdsDDJJ.FieldByName('Periodo').AsString := aPeriodo;
    cdsDDJJ.FieldByName('Empleados').AsInteger := edtCantidadEmpleados.Value;
    cdsDDJJ.FieldByName('Masa').AsFloat := edtMasaSalarial.Value;
    cdsDDJJ.FieldByName('ImpCeros').AsInteger := edtSalariosEnCero.Value;
    cdsDDJJ.FieldByName('FechaPresentacion').AsDateTime := edtFechaPresentacion.Date;
    cdsDDJJ.FieldByName('Rectificativa').AsInteger := edtCodigoRectificativa.Value;
    cdsDDJJ.FieldByName('Estado').Value := null;
    cdsDDJJ.Post;

    aPeriodo := NextPeriodo(aPeriodo);
  end;

end;

procedure TFrmRecepcionNota.ValidarDDJJ;
var
  aPeriodo: String;
begin

  VerificarMultiple(['Registrando Período',
                      fraTipoFormulario, (fraTipoFormulario.IsSelected), 'Debe seleccionar un formulario',
                      fraTipoNomina, (fraTipoNomina.IsSelected), 'Debe seleccionar un tipo de nómina.',
                      edtFechaPresentacion, edtFechaPresentacion.Date > 0, 'Debe seleccionar la fecha de presentación.' ]);

//  Get_ValidarPeriodoPresentacionNota(ppPeriodoDesdeDDJJ.Periodo.Valor, ppPeriodoHastaDDJJ.Periodo.Valor);

  VerificarMultiple(['Registrando Período',
    ppPeriodoDesdeDDJJ, Not IsEmptyString(ppPeriodoDesdeDDJJ.Text), 'Debe seleccionar un período desde.',
    ppPeriodoHastaDDJJ, Not IsEmptyString(ppPeriodoHastaDDJJ.Text), 'Debe seleccionar un período hasta.',

//Pablo    ppPeriodoDesdeDDJJ, (ppPeriodoDesdeDDJJ.Periodo.Valor > '199606'), 'Período Inválido.',
//Pablo    ppPeriodoHastaDDJJ, (ppPeriodoHastaDDJJ.Periodo.Valor > '199606'), 'Período Inválido.',

    ppPeriodoDesdeDDJJ, (ppPeriodoDesdeDDJJ.Periodo.Valor <= ppPeriodoHastaDDJJ.Periodo.Valor), 'El período desde debe ser mayor al hasta.',

    ppPeriodoDesdeDDJJ,
                ppPeriodoDesdeDDJJ.Periodo.Valor <=
                ppPeriodoDesdeDDJJ.Periodo.GetPeriodoFromDate(edtFechaPresentacion.Date),
                'El Período debe ser anterior a la fecha de presentación',

    ppPeriodoHastaDDJJ,
                ppPeriodoHastaDDJJ.Periodo.Valor <=
                ppPeriodoHastaDDJJ.Periodo.GetPeriodoFromDate(edtFechaPresentacion.Date),
                'El Período debe ser anterior a la fecha de presentación',

     edtCantidadEmpleados, ValidarMasaYPersonal(FSinPersonal,
           edtCantidadEmpleados.Value, edtCantidadEmpleados.Value,
           edtSalariosEnCero.Value, edtMasaSalarial.Value,
           edtMasaSalarial.Value),
                             'La especificación de cantidad de empleados y masa para este formulario es incorrecta.']);


      aPeriodo := ppPeriodoDesdeDDJJ.Periodo.Valor;

      while (aPeriodo <= ppPeriodoHastaDDJJ.Periodo.Valor) do
      begin
        VerificarMultiple(['Registrando Período',
          edtFechaPresentacion, (ValorSql('SELECT NVL(EMI.UTILES.get_idddjj(' +
                                    SqlValue(fraEmpresaSolicitud.CUIT) + ', ' +
                                    SqlValue(aPeriodo) + ',' +
                                    SqlDate (edtFechaPresentacion.Date) + '), -1) from dual ') = -1),
                                    'Ya existe una nómina cargada con la misma fecha de presentación para el período ' + aPeriodo,
          ppPeriodoDesdeDDJJ, not ExisteNominaGrilla(aPeriodo, edtFechaPresentacion.Date),
                                    'Ya existe una nómina cargada con la misma fecha de presentación para el período ' + aPeriodo + ' en la grilla'
          ]);

        aPeriodo := NextPeriodo(aPeriodo);
      end;

end;

function TFrmRecepcionNota.ValidarMasaYPersonal(SinPersonal: boolean;
  Empleados, EmpleadosDeclar, SalariosEnCero: Integer; MasaSalarial,
  MasaSalarialDeclar: Currency): boolean;
begin
  result := ( not  SinPersonal
              and  (Empleados > 0)
              and ((EmpleadosDeclar > 0)
              and  (MasaSalarial > 0)
              and  (MasaSalarialDeclar > 0))
              and  (Empleados > SalariosEnCero)
             )
           or
             (SinPersonal
              and  (Empleados    = 0)
              and ((EmpleadosDeclar = 0)
              and  (MasaSalarial = 0)
              and  (MasaSalarialDeclar = 0))
           );
end;

procedure TFrmRecepcionNota.Get_ValidarPeriodoPresentacionNota(aPeriodoDesde, aPeriodoHasta: string);
begin
//Validar que el periodo-contrato-fechapres no este en otra nota
  //      'El período ya se encuentra cargado.']);
end;

procedure TFrmRecepcionNota.SetearSinPersonal;
begin
  if fraTipoFormulario.IsSelected then
   if fraTipoFormulario.FieldValue('SIN_PERSONAL') = 'S' then
   begin
      LimpiarAltaPeriodo;
      FSinPersonal := true;
   end
   else FSinPersonal := False;

   edtCantidadEmpleados.Enabled := not FSinPersonal;
   edtMasaSalarial.Enabled := not FSinPersonal;
   edtSalariosEnCero.Enabled := not FSinPersonal;
end;

procedure TFrmRecepcionNota.LimpiarAltaPeriodo;
begin
  edtCantidadEmpleados.Value := 0;
  edtMasaSalarial.Value := 0;
  edtSalariosEnCero.Value := 0;
end;


function TFrmRecepcionNota.ExisteNominaGrilla(aPeriodo: String;
  aFechaPresentacion: TDate): Boolean;
begin
  cdsDDJJ.DisableControls;
  try
    cdsDDJJ.SetKey;
    cdsDDJJ.FieldByName('Periodo').AsString := aPeriodo;
    cdsDDJJ.FieldByName('FechaPresentacion').AsDateTime := aFechaPresentacion;
    result := cdsDDJJ.GotoKey;
  finally
    cdsDDJJ.EnableControls;
  end;

end;

procedure TFrmRecepcionNota.OnChangeTipoFormulario(Sender : TObject);
begin
  SetearSinPersonal;
end;


procedure TFrmRecepcionNota.tbLimpiarPresClick(Sender: TObject);
begin
  LimpiarDDJJ;
end;

procedure TFrmRecepcionNota.LimpiarDDJJ;
begin
  edtFechaPresentacion.Clear;
  edtCodigoRectificativa.Clear;
  edtCantidadEmpleados.Clear;
  edtMasaSalarial.Clear;
  edtSalariosEnCero.Clear;
end;

function TFrmRecepcionNota.ValidarDDJJCargadas: boolean;
begin

  cdsDDJJ.DisableControls;

  ValidarDDJJCargadas := false;

  try
    cdsDDJJ.First;
    while cdsDDJJ.Eof do
    begin
      VerificarMultiple(['Recepción de Notas',
                        dbgMultiperiodo, ValidarMasaYPersonal(FSinPersonal,
                                                              cdsDDJJ.FieldByName('Empleados').AsInteger, cdsDDJJ.FieldByName('Empleados').AsInteger,
                                                              cdsDDJJ.FieldByName('ImpCeros').AsInteger, cdsDDJJ.FieldByName('Masa').AsFloat,
                                                              cdsDDJJ.FieldByName('Masa').AsFloat),
                        'La especificación de cantidad de empleados y masa para este formulario es incorrecta.'
                        ]);

      cdsDDJJ.Next;
    end;
    ValidarDDJJCargadas := true;
  finally
    cdsDDJJ.EnableControls;
  end;
end;

procedure TFrmRecepcionNota.HabilitarCargaDDJJ(aHabilita: boolean);
begin
(*
  tbComandosDDJJ.Enabled := aHabilita;
  ppPeriodoDesdeDDJJ.Enabled := aHabilita;
  ppPeriodoHastaDDJJ.Enabled := aHabilita;
  edtFechaPresentacion.Enabled := aHabilita;
  edtCodigoRectificativa.Enabled := aHabilita;
  edtCantidadEmpleados.Enabled := aHabilita;
  edtMasaSalarial.Enabled := aHabilita;
  edtSalariosEnCero.Enabled := aHabilita;
  fraObservacion.Enabled := aHabilita;
  mObservacionDDJJ.Enabled := aHabilita;
*)
  fraTipoFormulario.Locked := not aHabilita;
  fraTipoNomina.Locked := not aHabilita;
end;

procedure TFrmRecepcionNota.dbgMultiperiodoGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not cdsDDJJ.active or (cdsDDJJ.IsEmpty) then exit;

  //Activa---
  if (cdsDDJJ.FieldByName('IdEstado').AsInteger = 1) or
     (cdsDDJJ.FieldByName('IdEstado').AsInteger = 2) then
  begin
    if Highlight Then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;

  //Con autorizacion
  if cdsDDJJ.FieldByName('IdAutorizacion').AsInteger <> 0 then
  begin
    AFont.Color := clNavy;
    if Highlight Then Background := clTeal;
  end;

  //Rechazada --
  if (cdsDDJJ.FieldByName('IdEstado').AsInteger = 5) then
    AFont.Color := clRed;
end;

procedure TFrmRecepcionNota.NuevaNota(aContrato: integer;
  aPeriodo: String);
begin
//  SetearComponentesForm(mfABM);
  ClearControls;
  HabilitarCargaDDJJ(True);
  fraEmpresaSolicitud.Contrato := aContrato;
  ppPeriodoDesdeDDJJ.Periodo.Valor := aPeriodo;
  ppPeriodoHastaDDJJ.Periodo.Valor := aPeriodo;
  fraSolicitudAbm.Codigo := '2';
  fraSolicitudAbm.Locked := true;
  fraEmpresaSolicitud.Locked := true;
//  fraSolicitanteNota.Locked := true;
  ppPeriodoDesdeSolicitud.Enabled := false;
  ppPeriodoHastaSolicitud.Enabled := false;
  tbComnadosNota.Enabled := false;
  dblPeriodosSeleccionados.Enabled := false;
//  rgpTipoSolicitante.Enabled := false;
//  tbNuevoClick(self);
  ModoABM := maAlta;
  ModoABMToSqlType;
  fpABM.Caption := 'Ingreso de Nómina...';
  fpABM.ShowModal;
  Close;
end;

end.

