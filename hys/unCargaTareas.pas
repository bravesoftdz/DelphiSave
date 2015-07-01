unit unCargaTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PatternEdit, IntEdit, Mask,
  ToolEdit, unfraEstablecimientoDomic, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, CheckLst, unDmPrincipal, CustomDlgs,
  VCLExtra, unSesion, unFraCodigoDescripcion, SqlFuncs, AnsiSql,
  DateComboBox, DateTimeFuncs, General, JvgGroupBox, JvExExtCtrls,
  JvNetscapeSplitter, ComboEditor, CheckCombo, unRptRemitoPreventor, RxToolEdit,
  RxPlacemnt, unFraStaticCodigoDescripcion, ExComboBox, unArt, unGrids,
  RxCurrEdit, unFraTrabajador, unFraTrabajadorSiniestro_D5;

type
  TTareaMotivo = class
  private
    FIdTarea: integer;
    FIdMotivo: integer;
    FFaltaDoc: Boolean;
  public
    property IdTarea: integer read FIdTarea write FIdTarea;
    property IdMotivo: integer read FIdMotivo write FIdMotivo;
    constructor Create(aIdTarea, aIdMotivo: integer; aFaltaDoc : Boolean); overload;
  end;

  TfrmCargaTareas = class(TfrmCustomGridABM)
    chkExcluirBajas: TCheckBox;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label5: TLabel;
    Label19: TLabel;
    Label14: TLabel;
    edEstablecimientoFiltro: TPatternEdit;
    fraEmpresaFiltro: TfraEmpresa;
    Label44: TLabel;
    edVisitaDesde: TDateComboBox;
    Label46: TLabel;
    edVisitaHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    sdqDetalleTareas: TSDQuery;
    dsDetalleTareas: TDataSource;
    fraCoordinador: TfraCodigoDescripcion;
    Label8: TLabel;
    chkPreventor: TCheckBox;
    chkActuaciones: TCheckBox;
    tbImprimirRemito: TToolButton;
    btnAprobar: TButton;
    Label11: TLabel;
    cbPendiente: TCheckBox;
    cbAprobado: TCheckBox;
    pnDatos: TPanel;
    Label1: TLabel;
    Label9: TLabel;
    Label56: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblDetalle: TLabel;
    fraEmpresa: TfraEmpresa;
    fraEstableci: TfraEstablecimientoDomic;
    edFechaVisita: TDateEdit;
    edHoraDesde: TDateTimePicker;
    chkTareas: TCheckListBox;
    fraPreventor: TfraCodigoDescripcion;
    edCantVisitas: TIntEdit;
    edCantVisitasCargadas: TIntEdit;
    chkVerTodas: TCheckBox;
    chkDetalleMotivos: TCheckListBox;
    fpVerificaciones: TFormPanel;
    pnControl: TPageControl;
    tsAccidente: TTabSheet;
    tsEnfermedad: TTabSheet;
    tsPRS: TTabSheet;
    tsPAL: TTabSheet;
    ts463: TTabSheet;
    btnCerrarVerificacion: TButton;
    dbgRecomendaciones: TArtDBGrid;
    prItemsRec: TPageControl;
    tsVisitas: TTabSheet;
    pnlVisitas: TPanel;
    CoolBar3: TCoolBar;
    tbVisitas: TToolBar;
    tbVisAgregar: TToolButton;
    tbVisQuitar: TToolButton;
    dbgVisitas: TArtDBGrid;
    sdqRecomendaciones: TSDQuery;
    dsRecomendaciones: TDataSource;
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    pcCausasVisitas: TPageControl;
    tsSeguimientoVisitas: TTabSheet;
    CoolBar5: TCoolBar;
    tBarPSV_SEGUIMIENTOVISITA: TToolBar;
    tbNuevoSegEnfermedades: TToolButton;
    tbModificarSegEnfermedades: TToolButton;
    tbBajaSegEnfermedades: TToolButton;
    dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid;
    fpSeguimientoEnfermedades: TFormPanel;
    Bevel12: TBevel;
    Label70: TLabel;
    Label71: TLabel;
    btAceptarSegEnfermedades: TButton;
    btCancelarSegEnfermedades: TButton;
    edFechaSegEnfermedades: TDateComboBox;
    cbTipoEnfermedades: TExComboBox;
    dbgPMC_MEDIDACORRECTIVA: TRxDBGrid;
    sdqMedidasEnfermedades: TSDQuery;
    sdqSeguimientoEnfermedades: TSDQuery;
    dsSeguimientoEnfermedades: TDataSource;
    dsMedidasEnfermedades: TDataSource;
    fpVisitas: TFormPanel;
    Label12: TLabel;
    Bevel7: TBevel;
    Label13: TLabel;
    btnVisAceptar: TButton;
    btnVisCancelar: TButton;
    cmbVisTipo: TExComboBox;
    edVisFecha: TDateEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbNuevoAccidentes: TToolButton;
    tbModificarSegAccidente: TToolButton;
    tbBajaSegAccidente: TToolButton;
    RxDBGrid1: TRxDBGrid;
    fpSegAccidente: TFormPanel;
    Bevel1: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    btnAceptarSegAccidente: TButton;
    btnCancelarSegAccidente: TButton;
    edFechaSegAccidente: TDateComboBox;
    RxDBGrid2: TRxDBGrid;
    Panel1: TPanel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbNuevoPAL: TToolButton;
    tbEliminarPAL: TToolButton;
    ToolButton13: TToolButton;
    tbVisOrdenar: TToolButton;
    ArtDBGrid1: TArtDBGrid;
    fpVisita: TFormPanel;
    Label17: TLabel;
    Bevel2: TBevel;
    Label18: TLabel;
    lbFechaComprometida: TLabel;
    btnAceptarPAL: TButton;
    btnCancelarPAL: TButton;
    edFechaVisitaPal: TDateComboBox;
    cmbTipoCumplimientoPAL: TExComboBox;
    edFechaComprometidaPal: TDateComboBox;
    dbgPAL: TArtDBGrid;
    sdqMedidasAccidente: TSDQuery;
    dsMedidasAccidente: TDataSource;
    sdqSeguimientoAccidentes: TSDQuery;
    dsSeguimientoAccidentes: TDataSource;
    sdqPAL: TSDQuery;
    sdqVisitasPal: TSDQuery;
    dsPAL: TDataSource;
    dsVisitasPal: TDataSource;
    Panel2: TPanel;
    CoolBar4: TCoolBar;
    ToolBar3: TToolBar;
    tbNuevoRes463: TToolButton;
    tbEliminarRes463: TToolButton;
    ToolButton16: TToolButton;
    ArtDBGrid2: TArtDBGrid;
    ArtDBGrid3: TArtDBGrid;
    dsRes463: TDataSource;
    dsSeguimientoRes463: TDataSource;
    sdqRes463: TSDQuery;
    sdqSeguimientoRes463: TSDQuery;
    cbTipoAccidentes: TExComboBox;
    fpSeguimiento463: TFormPanel;
    Label20: TLabel;
    Bevel3: TBevel;
    Label21: TLabel;
    btnAceptarSeg463: TButton;
    btnCancelarSeg463: TButton;
    cmbSegTipo463: TExComboBox;
    edSegFecha463: TDateEdit;
    Label23: TLabel;
    fraPrevTercerizado: TfraCodigoDescripcion;
    chkFaltaDocFisico: TCheckListBox;
    edObservacion: TMemo;
    Label22: TLabel;
    Label24: TLabel;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaES_NROESTABLECI: TFloatField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaVP_FECHAVISITA: TDateTimeField;
    sdqConsultaVD_CANTVISITAS: TFloatField;
    sdqConsultaVP_KMS: TFloatField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaVP_FECHAALTA: TDateTimeField;
    sdqConsultaVP_USUALTA: TStringField;
    sdqConsultaVP_FECHAMODIF: TDateTimeField;
    sdqConsultaVP_USUMODIF: TStringField;
    sdqConsultaVP_FECHABAJA: TDateTimeField;
    sdqConsultaVP_USUBAJA: TStringField;
    sdqConsultaVP_APROBADO: TStringField;
    sdqConsultaVP_USUAPROBADO: TStringField;
    sdqConsultaVP_FECHAAPROBADO: TDateTimeField;
    sdqConsultaVP_IDEMPRESA: TFloatField;
    sdqConsultaVP_ESTABLECIMIENTO: TFloatField;
    sdqConsultaVP_IDPREVENTOR: TFloatField;
    sdqConsultaVP_OBSERVACIONES: TStringField;
    sdqConsultaVP_IDPREVENTORCONSULTORA: TFloatField;
    sdqConsultaVP_ID: TFloatField;
    sdqConsultaCANTVISITAS: TFloatField;
    sdqConsultaEMPRESAVIP: TStringField;
    sdqConsultaORIGENCARGA: TStringField;
    sdqConsultaSELECTED: TStringField;
    sdqConsultaVP_ORIGEN: TStringField;
    tbProcesarViatico: TToolButton;
    sdqConsultaVP_IDVIATICO: TFloatField;
    fpViaticos: TFormPanel;
    Bevel4: TBevel;
    btnAceptarViatico: TButton;
    btnCancelarViatico: TButton;
    fraPreventorViatico: TfraCodigoDescripcion;
    Label25: TLabel;
    edFechaDesdeViatico: TDateEdit;
    Label26: TLabel;
    edFechaHastaViatico: TDateEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edObservacionViatico: TMemo;
    Label30: TLabel;
    Label31: TLabel;
    ToolBar4: TToolBar;
    tbBusquedaViatico: TToolButton;
    Label39: TLabel;
    Panel3: TPanel;
    edMontoTotalViaticos: TCurrencyEdit;
    fraViaticoFiltro: TfraStaticCodigoDescripcion;
    Label32: TLabel;
    edFechaViatico: TDateEdit;
    Label33: TLabel;
    edOtrosGastos: TCurrencyEdit;
    sdqConsultaVP_FECHAVIATICO: TDateTimeField;
    Panel4: TPanel;
    ToolBar5: TToolBar;
    tbRefrescarAccidente: TToolButton;
    tbLimpiarAccidente: TToolButton;
    fraTrabajadorAccidente: TfraTrabajadorSiniestro_D5;
    lbCUIT: TLabel;
    Panel5: TPanel;
    Label34: TLabel;
    fraTrabajadorEnfermedades: TfraTrabajadorSiniestro_D5;
    ToolBar6: TToolBar;
    tbRefrescarEnfermedades: TToolButton;
    tbLimpiarEnfermedades: TToolButton;
    gbDetalleTareas: TJvgGroupBox;
    Label35: TLabel;
    gridDetalleTareas: TArtDBGrid;
    gbSubDetalleTareas: TArtDBGrid;
    sdqTareaSubDetalle: TSDQuery;
    dsTareaSubDetalle: TDataSource;
    Label10: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edPeaje: TCurrencyEdit;
    edEstacionamiento: TCurrencyEdit;
    edHoteles: TCurrencyEdit;
    Label38: TLabel;
    fraPreventorTercerizadoFiltro: TfraCodigoDescripcion;
    edKms: TEdit;
    edKmsViatico: TEdit;
    edKmRegreso: TEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edFechaRecepcionViatico: TDateEdit;
    edFechaEntregaCoordinador: TDateEdit;
    tsBasica: TTabSheet;
    fraGrupoDenuncia: TfraCodigoDescripcion;
    Label43: TLabel;
    chkRubros: TCheckListBox;
    Label45: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure OnfraDenDetGrupoChange(Sender: TObject);
    procedure edFechaVisitaChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbDetalleTareasExpanded(Sender: TObject);
    procedure sdqConsultaBeforeClose(DataSet: TDataSet);
    procedure dbgDetalleTareasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkVerTodasClick(Sender: TObject);
    procedure chkTareasClick(Sender: TObject);
    procedure chkDetalleMotivosClickCheck(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure chkTareasClickCheck(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbImprimirRemitoClick(Sender: TObject);
    procedure btnAprobarClick(Sender: TObject);
    procedure sdqRecomendacionesAfterScroll(DataSet: TDataSet);
    procedure sdqMedidasEnfermedadesAfterScroll(DataSet: TDataSet);
    procedure sdqMedidasAccidenteAfterScroll(DataSet: TDataSet);
    procedure sdqPALAfterScroll(DataSet: TDataSet);
    procedure sdqRes463AfterScroll(DataSet: TDataSet);
    procedure btnAceptarSegAccidenteClick(Sender: TObject);
    procedure tbNuevoAccidentesClick(Sender: TObject);
    procedure tbModificarSegAccidenteClick(Sender: TObject);
    procedure tbBajaSegAccidenteClick(Sender: TObject);
    procedure tbNuevoSegEnfermedadesClick(Sender: TObject);
    procedure tbModificarSegEnfermedadesClick(Sender: TObject);
    procedure tbBajaSegEnfermedadesClick(Sender: TObject);
    procedure btAceptarSegEnfermedadesClick(Sender: TObject);
    procedure tbVisAgregarClick(Sender: TObject);
    procedure tbVisQuitarClick(Sender: TObject);
    procedure btnVisAceptarClick(Sender: TObject);
    procedure tbNuevoPALClick(Sender: TObject);
    procedure cmbTipoCumplimientoPALChange(Sender: TObject);
    procedure btnAceptarPALClick(Sender: TObject);
    procedure tbEliminarPALClick(Sender: TObject);
    procedure btnAceptarSeg463Click(Sender: TObject);
    procedure tbNuevoRes463Click(Sender: TObject);
    procedure tbEliminarRes463Click(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkFaltaDocFisicoClickCheck(Sender: TObject);
    procedure tbProcesarViaticoClick(Sender: TObject);
    procedure btnAceptarViaticoClick(Sender: TObject);
    procedure tbBusquedaViaticoClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure edKmsViaticosChange(Sender: TObject);
    procedure tbLimpiarAccidenteClick(Sender: TObject);
    procedure tbRefrescarAccidenteClick(Sender: TObject);
    procedure tbLimpiarEnfermedadesClick(Sender: TObject);
    procedure tbRefrescarEnfermedadesClick(Sender: TObject);
    procedure edKmsKeyPress(Sender: TObject; var Key: Char);
    procedure edKmsViaticoKeyPress(Sender: TObject; var Key: Char);
    procedure tbExportarClick(Sender: TObject);
    procedure btnCerrarVerificacionClick(Sender: TObject);
  private
    ModoABMSegAccidente   : TModoABM;
    ModoABMSegEnfermedades: TModoABM;
    FIdUltimaVisitaPRS    : Integer;
    FFechaVisita : TDate;
    FFechaMinDesdeViatico : TDate;
    FFechaMaxHastaViatico : TDate;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEstableciChange(Sender: TObject);
    procedure OnPreventorChange(Sender: TObject);
    procedure OnEmpresaChangeFiltro(Sender: TObject);
    procedure DesmarcarItems;
    procedure MarcarTareas;
    procedure CargarTareas(aVerTodas: boolean = false); overload;
    procedure CargarTareas(aIdVisita: integer); overload;
    procedure GuardarTareas(aIdVisita: integer);
//    procedure ActualizarPlan(aIdVisita: integer);
    function ArmarFiltroEstab(Establecimientos: string): string;
    procedure CargarDetalle;
    procedure CargarVisitaDeclarada(aFechaVisita: TDateTime; aIdPreventor: Integer);
    procedure GuardarVisitaDeclarada(aFechaVisita: TDateTime; aIdPreventor: Integer);
    function GetTipoEstabPrev(aCuit: String; aEstab: integer): String;
    procedure CargarDetalleMotivos(aIdTarea: integer);
    function TieneDetalle: boolean;
    function NoCorrepondeDetalle(aIdTarea, aIdMotivo: integer): boolean;
    function VerificarFechasCumSegPal: Boolean;
    //procedure SetID(ADataSet: TSDQuery; AId: TTableId);
    procedure DoDarDeBaja(ADataSet: TSDQuery; APrefijo: string; AAllowDelete: Boolean = True);
    procedure ActualizarSeguimientos(iCodigo : Integer);
    procedure CargarFaltaDocFisicoOnChange;
    procedure GuardarFaltaDoc(aIdVisita: integer);
    procedure CargarFaltaDoc(aIdVisita: integer);
    procedure HabilitarTercerizado(iCodigo: Integer);
    procedure OnPreventorFiltroChange(Sender: TObject);
    procedure CargaAccidentes;
    procedure CargaEnfermedades;
  protected
    SelectedList: TBookMarkLst;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmCargaTareas: TfrmCargaTareas;

implementation

uses unCustomConsulta, unComunesFet, unSeleccionarViatico, archfuncs, unMoldeEnvioMail;

{$R *.dfm}

procedure TfrmCargaTareas.ClearControls;
begin
  inherited;
  chkDetalleMotivos.Clear;
  fraEmpresa.Clear;
  fraEstableci.Clear;
  edFechaVisita.Clear;
  edHoraDesde.Time := 0;
  edKms.Clear;
  CargarTareas;
  fraPreventor.Clear;
  edCantVisitas.Clear;
  chkVerTodas.Checked := false;
  edObservacion.Clear;
  edFechaViatico.Clear;
  chkFaltaDocFisico.Clear;
  fraPrevTercerizado.Clear;
end;

procedure TfrmCargaTareas.cmbTipoCumplimientoPALChange(Sender: TObject);
begin
  if cmbVisTipo.Value = 'I' then
  begin
    lbFechaComprometida.Visible := True;
    edFechaComprometidaPal.Visible := True;
  end
  else
  begin
    lbFechaComprometida.Visible := false;
    edFechaComprometidaPal.Visible := false;
    edFechaComprometidaPal.Clear;
  end;
end;

function TfrmCargaTareas.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('VP_ID').AsInteger;
      Sql.Fields.Add('VP_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('VP_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('VP_IDEMPRESA', fraEmpresa.Value);
      Sql.Fields.Add('VP_ESTABLECIMIENTO', fraEstableci.Value);
      edHoraDesde.Date := edFechaVisita.Date;
      Sql.Fields.AddDateTime('VP_FECHAVISITA', edHoraDesde.DateTime);
      Sql.Fields.AddExtended('VP_KMS', edKms.Text,-1, False);
      Sql.Fields.Add('VP_IDPREVENTOR', fraPreventor.Value);
      Sql.Fields.AddInteger('VP_IDPREVENTORCONSULTORA', fraPrevTercerizado.Value,True);
      Sql.Fields.Add('VP_OBSERVACIONES', edObservacion.Text);
      Sql.Fields.Add('VP_FECHAVIATICO', edFechaViatico.Date);

      if ModoABM = maAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HVP_VISITAPREVENTOR');
        Sql.Fields.Add('VP_USUALTA', Sesion.UserID );
        Sql.Fields.Add('VP_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('VP_ID').AsInteger;
        Sql.Fields.Add('VP_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('VP_FECHAMODIF', exDateTime );
        Sql.Fields.Add('VP_USUBAJA', exNull );
        Sql.Fields.Add('VP_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('VP_ID', iIdCodigo);
    EjecutarSQLST(Sql.Sql);
    if ModoABM <> maBaja then
    begin
      GuardarTareas(iIdCodigo);
      GuardarFaltaDoc(iIdCodigo);
    end
    else
      EjecutarSqlSTEx('UPDATE HYS.HTP_TAREAPREVENTOR SET TP_FECHABAJA = SYSDATE, TP_USUBAJA = :USUARIO WHERE TP_IDVISITAPREVENTOR = :ID', [Sesion.LoginName, iIdCodigo]);

    ActualizarPlan(iIdCodigo, fraEmpresa.Value, fraEstableci.Value);
    GuardarVisitaDeclarada(edFechaVisita.Date, fraPreventor.Value);
    CommitTrans(True);
    ActualizarSeguimientos(iIdCodigo);
    Result := True;
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar la visita.');
    end;
  end;
end;

procedure TfrmCargaTareas.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'VP_FECHABAJA';
  Sql.TableName := 'HYS.HVP_VISITAPREVENTOR';
  ShowActived := false;

  SelectedList := TBookMarkLst.Create;

  fraEmpresa.OnChange := OnEmpresaChange;
  fraEmpresa.ShowBajas := True;
  fraEstableci.OnChange := OnEstableciChange;

  fraEmpresaFiltro.OnChange := OnEmpresaChangeFiltro;
  fraEmpresaFiltro.ShowBajas := True;

  fraEstableci.ShowBajas := True;
  CargarTareas;

  with fraPreventor do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_ID';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    OnChange := OnPreventorChange;
  end;

  with fraGrupoDenuncia do
  begin
    TableName := 'HYS.HGD_GRUPODENUNCIA';
    FieldDesc := 'GD_DESCRIPCION';
    FieldID := 'GD_ID';
    FieldCodigo := 'GD_CODIGO';
    FieldBaja := 'GD_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    OnChange := OnfraDenDetGrupoChange;
  end;

  with fraPreventorViatico do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_ID';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    OnChange := OnPreventorChange;
  end;

  with fraPrevTercerizado do
  begin
    TableName := 'hys.hpc_preventorconsultora';
    FieldDesc := 'PC_NOMBRE';
    FieldID := 'PC_ID';
    FieldCodigo := 'PC_ID';
    FieldBaja := 'PC_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraPreventorTercerizadoFiltro do
  begin
    TableName := 'hys.hpc_preventorconsultora';
    FieldDesc := 'PC_NOMBRE';
    FieldID := 'PC_ID';
    FieldCodigo := 'PC_ID';
    FieldBaja := 'PC_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraViaticoFiltro do
  begin
    TableName := 'hys.hvt_viaticotareas';
    FieldDesc := ' (SELECT it_nombre '+
                 '    FROM art.pit_firmantes '+
                 '   WHERE it_id = vt_idpreventor) '
                 {' || '' - F.Desde:'' '+
                 ' || vt_fechadesde '+
                 ' || '' - F.Hasta:'' '+
                 ' || vt_fechahasta'};
    FieldID := 'vt_id';
    FieldCodigo := 'vt_id';
    FieldBaja := 'vt_fechabaja';
    ShowBajas := true;
    ExtraFields := ', vt_fechadesde "Fecha desde", vt_fechahasta "Fecha hasta"';
    DynamicCols := True;
    VisibleExtraFields[0] := True;
    VisibleExtraFields[1] := True;
   { Sql         := ' SELECT DISTINCT vt_id ' + ' AS ' + CD_ALIAS_ID + ', ' +
                   '                 vt_id ' + ' AS ' + CD_ALIAS_CODIGO + ', ' +
                   ' (SELECT it_nombre FROM art.pit_firmantes WHERE it_id = vt_idpreventor) '+
                   ' || '' - F.Desde:'' || vt_fechadesde || '' - F.Hasta:'' '+
                   ' || vt_fechahasta '+ ' AS ' + CD_ALIAS_DESC +
                   '   FROM hys.hvt_viaticotareas '+
                   '  WHERE 1 = 1 ';}
  end;

  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_ID';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    onChange :=OnPreventorFiltroChange;
  end;

  with fraCoordinador do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  tbSalir.Left := 500;
  //vclextra.LockControls(cbFaltaFisico,btnAprobar.Enabled);
  VCLExtra.LockControl(edEstablecimientoFiltro, true);
  VCLExtra.LockControl(edMontoTotalViaticos, true);
  VCLExtra.LockControl(edCantVisitasCargadas, true);
end;

procedure TfrmCargaTareas.LoadControls;
begin
  inherited;
  fraEmpresa.Value := sdqConsulta.FieldByName('VP_IDEMPRESA').AsInteger;
  OnEmpresaChange(self);
  fraEstableci.Value := sdqConsulta.FieldByName('VP_ESTABLECIMIENTO').AsInteger;
  edFechaVisita.Date := sdqConsulta.FieldByName('VP_FECHAVISITA').AsDateTime;
  edHoraDesde.DateTime := sdqConsulta.FieldByName('VP_FECHAVISITA').AsDateTime;
  edKms.Text := sdqConsulta.FieldByName('VP_KMS').AsString;
  fraPreventor.Value := sdqConsulta.FieldByName('VP_IDPREVENTOR').AsInteger;
  edObservacion.Text := sdqConsulta.FieldByName('VP_OBSERVACIONES').AsString;
  edFechaViatico.Date := sdqConsulta.FieldByName('VP_FECHAVIATICO').AsDateTime;
  fraPrevTercerizado.Value := sdqConsulta.FieldByName('VP_IDPREVENTORCONSULTORA').AsInteger;
  CargarTareas(true);
  CargarTareas(sdqConsulta.FieldByName('VP_ID').AsInteger);
  chkTareasClickCheck(nil);
  CargarFaltaDoc(sdqConsulta.FieldByName('VP_ID').AsInteger);
  chkFaltaDocFisicoClickCheck(nil);
  CargarVisitaDeclarada(edFechaVisita.Date, fraPreventor.Value);
  HabilitarTercerizado(fraPreventor.Value);
end;

procedure TfrmCargaTareas.OnEmpresaChange(Sender: TObject);
begin
  fraEstableci.CUIT := fraEmpresa.CUIT;
  MarcarTareas;
end;

procedure TfrmCargaTareas.OnfraDenDetGrupoChange(Sender: TObject);
begin
  chkRubros.Clear;
  with getquery(
  ' SELECT RD_DESCRIPCIONRUBRO,RD_ID '+
	'   FROM hys.hrd_rubrodenuncia '+
  '  WHERE rd_fechabaja IS NULL '+
	'	 	 AND RD_IDGRUPO = ' + SqlValue(fraGrupoDenuncia.ID) +
  '      AND (rd_vigenciadesde <= art.hys.get_operativovigente_empresa('+SqlValue(fraEmpresa.CUIT)+',sysdate) OR rd_vigenciadesde IS NULL) '+
  ' AND (rd_vigenciahasta > art.hys.get_operativovigente_empresa('+SqlValue(fraEmpresa.CUIT)+',sysdate) OR rd_vigenciahasta IS NULL)'+
  ' ORDER BY rd_codigorubro ') do
  try
    while not Eof do
    begin
      chkRubros.AddItem(FieldByName('RD_DESCRIPCIONRUBRO').AsString, TObject(FieldByName('RD_ID').AsInteger));
      Next;
    end;
  finally
    Free;
  end;
end;

function TfrmCargaTareas.Validar: Boolean;
var
  sIdModif: String;
begin
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar una empresa.');
  Verificar(not fraEstableci.IsSelected, fraEstableci, 'Debe seleccionar un establecimiento.');
  Verificar(edFechaVisita.Date = 0, edFechaVisita, 'Debe ingresar una fecha de visita.');
  Verificar((edKms.Text = '') ,edKms, 'Debe ingresar los Kms.');

  if not ExisteSql( ' SELECT 1 FROM art.pit_firmantes '+
                    '  WHERE it_tercerizado = 1 AND it_fechabaja IS NULL '+
                    '    AND it_id = '+SqlValue(fraPreventor.Value)) then
  begin
    Verificar(frac(edHoraDesde.Time) = 0, edHoraDesde, 'Debe ingresar la hora desde de la visita.');
    Verificar(edCantVisitas.Value = 0, edCantVisitas, 'Debe ingresar la cantidad de visitas del día.');
  end;

  Verificar(CheckListCount(chkTareas) = 0, chkTareas, 'Seleccione alguna tarea.');
  Verificar(not fraPreventor.IsSelected, fraPreventor, 'Debe seleccionar un preventor.');
  Verificar(not TieneDetalle, chkDetalleMotivos, 'Falta seleccionar el detalle de alguna tarea.');
  if not fraPrevTercerizado.ReadOnly then
    Verificar(not fraPrevTercerizado.IsSelected, fraPrevTercerizado,'Debe seleccionar el preventor tercerizado.');

  if ModoABM = maModificacion then
    sIdModif := ' AND vp_id <> ' + SqlValue(sdqConsulta.FieldByName('vp_id').AsInteger)
  else
    sIdModif := '';

  Verificar(ExisteSqlEx(' SELECT 1 ' +
                        '  FROM hys.hvp_visitapreventor ' +
                        ' WHERE vp_idempresa = :idempresa ' +
                        '   AND vp_establecimiento = :estab ' +
                        '   AND trunc(vp_fechavisita) = :fechavisita ' +
                        '   AND vp_idpreventor = :idpreventor ' +
                        '   AND vp_origen = ''P'' ' +
                            sIdModif +
                        '   AND vp_fechabaja IS NULL ', [fraEmpresa.Value,
                                                         fraEstableci.Value,
                                                         TDateTimeEx.Create(edFechaVisita.Date),
                                                         fraPreventor.Value]), edFechaVisita, 'Ya existe una visita con esta fecha');
  result := true;
end;

procedure TfrmCargaTareas.edFechaVisitaChange(Sender: TObject);
begin
  inherited;
  MarcarTareas;
  CargarVisitaDeclarada(edFechaVisita.Date, fraPreventor.Value);
  if edfechaviatico.date = 0 then
    edFechaViatico.Date := edFechaVisita.Date;
end;



procedure TfrmCargaTareas.edKmsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ','
  else if not(Key in [#8, #9, '1', '2', '3','4', '5', '6', '7', '8', '9', '0', ',']) then
    Key := #0;
end;

procedure TfrmCargaTareas.edKmsViaticoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ','
  else if not(Key in [#8, #9, '1', '2', '3','4', '5', '6', '7', '8', '9', '0', ',']) then
    Key := #0;
end;

procedure TfrmCargaTareas.edKmsViaticosChange(Sender: TObject);
var
  valorKM : Extended;
begin
  inherited;
  valorKM := (StrToFloatDef(edKmsViatico.Text,0)+StrToFloatDef(edKmRegreso.Text,0)) * ValorSqlExtended('SELECT pa_valor FROM hys.hpa_parametro WHERE pa_clave = ''VALORKM'' ');
  edMontoTotalViaticos.Value := valorKM + edPeaje.Value + edEstacionamiento.Value+ edHoteles.Value +edOtrosGastos.Value;
end;

procedure TfrmCargaTareas.MarcarTareas;
var
  i: integer;
begin
  if ModoABM = maAlta then
  begin
    CargarTareas(chkVerTodas.Checked);
    if fraEmpresa.IsSelected and fraEstableci.IsSelected and (edFechaVisita.Date > 0) then
    begin
      with GetQueryEx('SELECT DISTINCT ts_idtarea ' +
                      '         FROM hys.hts_tareahys ' +
                      '        WHERE ts_idvisitapreventor IS NULL ' +
                      '          AND ts_idempresa = :idempresa ' +
                      '          AND ts_estableci = :estableci ' +
                      '          AND (ts_idproceso = art.hys_plan.get_idproceso(''M'', trunc(add_months(:fecha, -1), ''MM''), LAST_DAY(add_months(:fecha, -1))) ' +
                      '               OR ts_idproceso = art.hys_plan.get_idproceso(''M'', trunc(:fecha, ''MM''), LAST_DAY(:fecha))) ' +
                      ' ORDER BY 1 DESC ',
                      [fraEmpresa.Value,
                       fraEstableci.Value,
                       TDateTimeEx.Create(edFechaVisita.Date)]) do
      try
        while not Eof do
        begin
          for i:=0 to chkTareas.Count-1 do
            if TTareaMotivo(chkTareas.Items.Objects[i]).IdTarea = FieldByName('ts_idtarea').AsInteger then
            begin
              chkTareas.Checked[i] := true;
              chkTareas.Items.Move(i, 0);
            end;
          Next;
        end;
      finally
        free;
      end;
    end;

    chkTareas.ItemIndex := 0;
    CargarDetalleMotivos(TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdTarea);
  end;
end;

procedure TfrmCargaTareas.DesmarcarItems;
var
  i: integer;
begin
  for i:=0 to chkTareas.Count-1 do
    chkTareas.Checked[i] := false;
end;

procedure TfrmCargaTareas.CargarTareas(aVerTodas: boolean = false);
var
  sCondicionTipo: String;
  sTipoEstabPrev: String;
begin
  chkTareas.Clear;
  if not aVerTodas then
  begin
    sTipoEstabPrev := GetTipoEstabPrev(fraEmpresa.CUIT, fraEstableci.Value);
    if sTipoEstabPrev <> '' then
      sCondicionTipo := ' AND (TA_TIPOS LIKE ' + SqlValue('%' + sTipoEstabPrev + '%') + ' OR TA_TIPOS IS NULL) ';
  end;
  with GetQuery('SELECT * FROM HYS.HTA_TAREA WHERE TA_VISIBLE = ''S'' AND TA_FECHABAJA IS NULL ' + sCondicionTipo + ' ORDER BY 2') do
  try
    while not Eof do
    begin
      chkTareas.AddItem(FieldByName('TA_DESCRIPCION').AsString, TTareaMotivo.Create(FieldByName('TA_ID').AsInteger, 0,false));
      Next;
    end;
  finally
    free;
  end;
  chkTareas.ItemIndex := 0;
  CargarDetalleMotivos(TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdTarea);
end;

procedure TfrmCargaTareas.OnEstableciChange(Sender: TObject);
begin
  MarcarTareas;
end;

procedure TfrmCargaTareas.btAceptarSegEnfermedadesClick(Sender: TObject);
var
  bEsAlta: Boolean;
begin
  bEsAlta := (ModoABMSegEnfermedades = maAlta);

  Verificar(cbTipoEnfermedades.ItemIndex = -1, cbTipoEnfermedades, 'Debe seleccionar un tipo de visita.');
  Verificar(bEsAlta and (edFechaSegEnfermedades.Date = 0), edFechaSegEnfermedades, 'Debe ingresar la fecha de visita.');
  Verificar(bEsAlta and (edFechaSegEnfermedades.Date > DBDate), edFechaSegEnfermedades, 'La fecha de visita tiene que ser menor o igual a hoy.');

  if ((cbTipoEnfermedades.Value = 'C') and (not ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITAENF WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqMedidasEnfermedades.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqSeguimientoEnfermedades.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(cbTipoEnfermedades, 'La primer visita debe ser "Visita" o "Incumplimiento".');
    Abort;
  end;

  if ((cbTipoEnfermedades.Value = 'V') and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITAENF WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqMedidasEnfermedades.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqSeguimientoEnfermedades.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(cbTipoEnfermedades, 'La visita debe ser "Cumplimiento" o "Incumplimiento".');
    Abort;
  end;

  if bEsAlta and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITAENF WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqMedidasEnfermedades.FieldByName('MC_ID').AsInteger) + ' AND SV_FECHA = ' + SqlValue(edFechaSegEnfermedades.Date))) then
  begin
    InvalidMsg(edFechaSegEnfermedades, 'Ya existe una visita con esta fecha.');
    Abort;
  end;

  if bEsAlta and (edFechaSegEnfermedades.Date < sdqMedidasEnfermedades.FieldByName('MC_FECHAEJECUCION').AsDateTime) then
    if not MsgAsk('La fecha de visita es mayor o igual a la fecha de ejecución.' + CRLF + '¿Está seguro que la fecha ingresada es correcta?') then
      Abort;


  guardarSeguimientoEnfermedad(ModoABMSegEnfermedades = maAlta, sdqMedidasEnfermedades.FieldByName('MC_ID').AsInteger, cbTipoEnfermedades.Value, edFechaSegEnfermedades.Date, IIF(ModoABMSegEnfermedades = maAlta,0,sdqSeguimientoEnfermedades.FieldByName('sv_ID').AsInteger));
  sdqSeguimientoEnfermedades.Refresh;
  fpSeguimientoEnfermedades.ModalResult := mrOk;
end;

procedure TfrmCargaTareas.btnAceptarClick(Sender: TObject);
begin
  if ModoABM = maModificacion then
    inherited
  else
  begin
    if Validar and DoABM then
    begin
      fraEmpresa.Clear;
      fraEstableci.Clear;
      edHoraDesde.Time := 0;
      edKms.Clear;
      CargarTareas;
      CargarVisitaDeclarada(edFechaVisita.Date, fraPreventor.Value);
      ModoABM := maAlta;
      ModoABMToSqlType;
      fraEmpresa.mskCUIT.SetFocus;
    end;
  end;
end;

procedure TfrmCargaTareas.btnAceptarPALClick(Sender: TObject);
var
  Sql: String;
  idVisita, i: integer;
begin
  VerificarMultiple (['Registro de Visita para el PAL',
                      cmbTipoCumplimientoPAL,
                      cmbTipoCumplimientoPAL.ItemIndex >= 0,
                      'Debe seleccionar el Tipo de Seguimiento',
                      edFechaVisitaPal,
                      edFechaVisitaPal.IsValid,
                      'Debe ingresar una fecha válida',
                      edVisFecha,
                      not edFechaVisitaPal.IsEmpty,
                      'Debe seleccionar la Fecha de Visita',
                      edFechaVisitaPal,
                      edFechaVisitaPal.Date <= DBDate,
                      'La Fecha de Visita debe ser menor o igual a hoy'
                     ]);

  Verificar(edFechaComprometidaPal.Visible and (edFechaComprometidaPal.Date = 0), edFechaComprometidaPal, 'Debe ingresar una fecha');
  Verificar(edFechaComprometidaPal.Visible and (edFechaComprometidaPal.Date < edVisFecha.Date), edFechaComprometidaPal, 'Le fecha debe ser mayor');

  IdVisita := ValorSqlInteger('SELECT rv_id FROM art.prv_resvisitas ' +
                               ' WHERE rv_cuit = ' + SqlValue(sdqPAL.FieldByName('pa_cuit').AsString) +
                               '   AND rv_estableci = ' + SqlValue(sdqPAL.FieldByName('pa_estableci').AsInteger) +
                               '   AND rv_fecha = ' + SqlDate (edFechaVisitaPal.Date) +
                               '   AND rv_tipo = ' + SqlValue(sdqPAL.FieldByName('pa_tipo').AsString) +
                               '   AND rv_operativo= ' + SqlValue (sdqPAL.FieldByName('pa_operativo').AsString));
 {
  if FIdVisita = 0 then
  begin
    InvalidMsg(edVisFecha, 'No existe una visita para la fecha indicada.');
    abort;
  end;
}
  try
    BeginTrans(True);
    for i := 0 to dbgPAL.SelectedRows.Count-1 do
    begin
      dbgPAL.GotoSelection(i);

      if not ExisteSql('SELECT 1 ' +
                       '  FROM hys.hps_palseguimiento ' +
                       ' WHERE ps_fechabaja IS NULL ' +
                       '   AND ps_idpal = ' + SqlValue(sdqPAL.FieldByName('pa_id').AsInteger) +
                       '   AND ps_fechavisita = ' + edFechaVisitaPal.SqlText) then
      begin

        Sql := 'INSERT INTO hys.hps_palseguimiento ' +
               '            (ps_id, ps_idpal, ps_fechavisita, ' +
               '             ps_tiposeguimiento, ps_idvisita, ps_fechaalta, ' +
               '             ps_usualta,ps_fechacomprometida) ' +
               '     VALUES (hys.seq_hps_palseguimiento.NEXTVAL, ' +
                             SqlValue(sdqPAL.FieldByName('pa_id').AsInteger) +  ', ' +
                             edFechaVisitaPal.SqlText + ', ' +
                             SqlValue(cmbTipoCumplimientoPAL.Value) + ', ' +
                             SqlInt(idVisita, True) +
                             ', SYSDATE, ' +
                             SqlValue(Sesion.LoginName) + ','+SqlValue(edFechaComprometidaPal.Date)+')';

        EjecutarSqlST(Sql);
      end
      else begin
        Rollback(True);
        Verificar(true, edFechaVisitaPal, 'Ya existe una visita con esta fecha cargada.');
      end;
    end;
    CommitTrans(True);
    dbgPAL.UnselectAll;

    if sdqVisitasPal.Active then
      sdqVisitasPal.Refresh
    else
      sdqVisitasPal.Open;

    fpVisita.ModalResult := mrOk ;
  except
    on E: Exception do begin
       ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;

procedure TfrmCargaTareas.btnAprobarClick(Sender: TObject);
begin
  btnAceptar.Click;
  EjecutarSqlST('UPDATE HYS.HVP_VISITAPREVENTOR'+
                '   SET VP_APROBADO = ''S'','+
                '       VP_USUAPROBADO = '+SqlValue(Sesion.LoginName)+','+
                '       VP_FECHAAPROBADO = SYSDATE'+
                ' WHERE VP_ID = '+SqlValue(sdqConsulta.FieldByName('VP_ID').AsInteger));
  tbRefrescarClick(nil);
end;

procedure TfrmCargaTareas.btnCancelarClick(Sender: TObject);
begin
  if sdqConsulta.Active then
  begin
    //sdqConsulta.Refresh;
    CheckButtons;
  end;
  //else
  //  tbRefrescarClick(nil);
  inherited;
end;

procedure TfrmCargaTareas.btnVisAceptarClick(Sender: TObject);
Var Sql,
    Sql2    : String;
    i       : Integer;
    VisTipo : Char;
begin
  VerificarMultiple (['Registro de Visita',
                      edVisFecha,
                      IsValidDate (edVisFecha.Text, 'DD/MM/YYYY'),
                      'Debe especificar la fecha de la visita',
                      edVisFecha,
                      edVisFecha.Date <= DBDateTime,
                      'La fecha no puede ser posterior a la fecha actual'
                     ]);

  try
    for i := 0 to dbgRecomendaciones.SelectedRows.Count -1 do
    begin

        sdqRecomendaciones.GotoBookmark( Pointer(dbgRecomendaciones.SelectedRows.Items[i]) );
        //VisTipo := cmbVisTipo.Value[1];
        VisTipo := GetVisitaCorrecta(sdqRecomendaciones.FieldByName('re_cuit').AsString, sdqRecomendaciones.FieldByName('re_estableci').AsInteger,
                                     sdqRecomendaciones.FieldByName('re_tipo').AsString, sdqRecomendaciones.FieldByName('re_operativo').AsString,
                                     sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsInteger,
                                     edVisFecha.Date, cmbVisTipo.Value[1])[1];

        Sql := 'SELECT 1 FROM PRV_RECVISITAS ' +
               ' WHERE RV_CUIT = ' + SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) +
               '   AND RV_ESTABLECI = ' + SqlInt( sdqRecomendaciones.FieldByName('re_estableci').AsInteger ) +
               '   AND RV_TIPO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) +
               '   AND RV_OPERATIVO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) +
               '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
               '   AND RV_FECHABAJA IS NULL ';

        if (VisTipo = 'C') or (VisTipo = 'T') then
          Sql := Sql + ' AND (RV_TIPO_VISITA <> ' + SqlValue(VisTipo) + ' AND RV_FECHA > ' + SqlDate (edVisFecha.Date) + ') '
      (*Pablo 26/12/2006
          Sql := Sql + ' AND ((RV_TIPO_VISITA <> ' + SqlValue(VisTipo) + ' AND RV_FECHA > ' + SqlValue (edVisFecha.Date)+ ') ' +
                       'OR (RV_TIPO_VISITA = ' + SqlValue(VisTipo) + ')) '
      *)
        else
          Sql := Sql + ' AND RV_TIPO_VISITA = ' + SqlValue(VisTipo);


        Sql2 := 'SELECT 1 FROM PRV_RECVISITAS' +
                ' WHERE RV_CUIT = ' + SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) +
                '   AND RV_ESTABLECI = ' + SqlInt( sdqRecomendaciones.FieldByName('re_estableci').AsInteger ) +
                '   AND RV_TIPO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) +
                '   AND RV_OPERATIVO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) +
                '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
                '   AND RV_TIPO_VISITA = ''I''' +
                '   AND RV_FECHABAJA IS NULL';

        if cmbVisTipo.ItemIndex = -1 then
          InvalidMsg(cmbVisTipo, 'Debe seleccionar el Tipo de Seguimiento')

        else
          if ((VisTipo = 'C') or (VisTipo = 'T')) and ExisteSql( Sql ) then
            InvalidMsg(cmbVisTipo, 'No se puede seleccionar un tipo "' + copy(cmbVisTipo.Text, 3, Length(cmbVisTipo.Text))  +
                                   '" cuando hay visitas posteriores o cuando ya se ha cumplido' )
          else
            if ((VisTipo = 'C') or (VisTipo = 'T')) and not ExisteSql( Sql2 ) then
              InvalidMsg(cmbVisTipo, 'No se puede seleccionar un tipo "' + copy(cmbVisTipo.Text, 3, Length(cmbVisTipo.Text)) +
                                      '" cuando no existe una denuncia de incumplimiento' )

      { By Fede 10/05/2002
           else if (VisTipo <> 'C') and ExisteSql( Sql ) Then
              InvalidMsg(cmbVisTipo, 'No se puede seleccionar un tipo "' + cmbVisTipo.Text + '" cuando hay un cumplimiento' )
      }
            else
              if (sdqRecomendaciones.FieldByName('re_tipo').AsString = 'EP') and
                 (ExisteSql('SELECT 1 FROM PRV_RECVISITAS ' +
                            ' WHERE RV_CUIT = ' + SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) +
                            '   AND RV_ESTABLECI = ' + SqlInt( sdqRecomendaciones.FieldByName('re_estableci').AsInteger ) +
                            '   AND RV_TIPO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) +
                            '   AND RV_OPERATIVO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) +
                            '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('re_recomendacion').AsString +
                            '   AND RV_FECHABAJA IS NULL' +
                            '   AND RV_FECHA = ' + SqlDate (edVisFecha.Date))) then
                InvalidMsg(edVisFecha, 'Ya existe una visita en esa fecha')
              else begin
                    Sql := 'SELECT NVL(TO_CHAR(RV_FECHABAJA), ''EXISTE'') ' +
                           '  FROM PRV_RECVISITAS ' +
                           ' WHERE RV_CUIT = ' + SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) +
                           '   AND RV_ESTABLECI = ' + SqlInt(sdqRecomendaciones.FieldByName('re_estableci').AsInteger) +
                           '   AND RV_TIPO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) +
                           '   AND RV_OPERATIVO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) +
                           '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('re_recomendacion').AsString +
                           '   AND RV_TIPO_VISITA = ' + SqlValue (VisTipo) +
                           '   AND RV_FECHA = ' + SqlDate(edVisFecha.Date);
                    Sql := ValorSql(Sql);

                    if Sql = 'EXISTE' then
                      MsgBox('El registro ya ha sido cargado para la recomendación ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString)
                    else
                      if ((VisTipo = 'S') or (VisTipo = 'V')) and
                        (ValorSQL('SELECT rv_tipo_visita ' +
                                  '  FROM prv_recvisitas v1 ' +
                                  ' WHERE rv_cuit = ' + SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) +
                                  '   AND rv_estableci = ' + SqlInt(sdqRecomendaciones.FieldByName('re_estableci').AsInteger) +
                                  '   AND rv_tipo = ' + SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) +
                                  '   AND rv_operativo = ' + SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) +
                                  '   AND rv_recomendacion = ' + sdqRecomendaciones.fieldbyname('re_recomendacion').AsString +
                                  '   AND rv_fechabaja IS NULL ' +
                                  '   AND rv_fecha = ' +
                                  '          (SELECT MAX (v2.rv_fecha) ' +
                                  '             FROM prv_recvisitas v2 ' +
                                  '            WHERE v2.rv_cuit = v1.rv_cuit ' +
                                  '              AND v2.rv_estableci = v1.rv_estableci ' +
                                  '              AND v2.rv_tipo = v1.rv_tipo ' +
                                  '              AND v2.rv_operativo = v1.rv_operativo ' +
                                  '              AND v2.rv_recomendacion = v1.rv_recomendacion ' +
                                  '              AND v2.rv_fechabaja IS NULL) '
                                 ) = 'I') then
                        MsgBox( 'No se puede asignar el tipo "' + copy(cmbVisTipo.Text, 3, Length(cmbVisTipo.Text)) +
                                '" cuando existe una denuncia de incumplimiento previo')
                      else begin
                        if Sql <> '' then
                          Sql := 'UPDATE PRV_RECVISITAS ' +
                                 '   SET RV_USUALTA = ' + SqlValue(Sesion.LoginName) + ', ' +
                                 '       RV_FECHAALTA = SYSDATE, ' +
                                 '       RV_USUBAJA = NULL, ' +
                                 '       RV_FECHABAJA = NULL ' +
                                 ' WHERE RV_CUIT = ' + SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) +
                                 '   AND RV_ESTABLECI = ' + SqlInt(sdqRecomendaciones.FieldByName('re_estableci').AsInteger) +
                                 '   AND RV_TIPO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) +
                                 '   AND RV_OPERATIVO = ' + SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) +
                                 '   AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
                                 '   AND RV_TIPO_VISITA = ' + SqlValue(VisTipo) +
                                 '   AND RV_FECHA = ' + SqlDate(edVisFecha.Date)
                        else
                          Sql := 'INSERT INTO PRV_RECVISITAS ' +
                                 '       (RV_CUIT, ' +
                                 '        RV_ESTABLECI, ' +
                                 '        RV_TIPO, ' +
                                 '        RV_OPERATIVO, ' +
                                 '        RV_RECOMENDACION, ' +
                                 '        RV_TIPO_VISITA, ' +
                                 '        RV_FECHA, ' +
                                 '        RV_FECHAALTA, ' +
                                 '        RV_USUALTA) ' +
                                 'VALUES (' +
                                          SqlValue(sdqRecomendaciones.FieldByName('re_cuit').AsString) + ', ' +
                                          SqlInt(sdqRecomendaciones.FieldByName('re_estableci').AsInteger) + ', ' +
                                          SqlValue(sdqRecomendaciones.FieldByName('re_tipo').AsString) + ', ' +
                                          SqlValue(sdqRecomendaciones.FieldByName('re_operativo').AsString) + ', ' +
                                          sdqRecomendaciones.FieldByName('RE_RECOMENDACION').AsString + ', ' +
                                          SqlValue(VisTipo) + ', ' +
                                          SqlDate (edVisFecha.Date) + ', ' +
                                 '        SYSDATE, ' +
                                          SqlValue(Sesion.LoginName) +
                                        ')';

                        EjecutarSqlST( Sql );
                      end;
                  end;
      end;
    except
      on E: Exception do begin
        ErrorMsg(E, 'Error al guardar los datos');
      end;
    end;
    fpVisitas.ModalResult := mrOk;
end;

procedure TfrmCargaTareas.btnCerrarVerificacionClick(Sender: TObject);
var
  i,j, idvisita, idObraDenuncia, nroRecomendacion : Integer;
begin
  inherited;
   if fraGrupoDenuncia.IsSelected then
  begin
    Verificar(CheckListCount(chkRubros) = 0, chkRubros, 'Debe Seleccionar un rubro si tiene seleccionado un grupo.');
    BeginTrans(True);

    try
      nroRecomendacion := ValorSql(' SELECT NVL (MAX (dd_nrorecomendacion), 0) '+
        '   FROM art.pdd_detalledenuncia, pod_obradenuncia '+
        '  WHERE od_cuit = '+SqlValue(fraEmpresa.CUIT)+
        '    AND od_estableci = '+SqlValue(fraEstableci.Value)+
        '    AND od_id = dd_idpodobradenuncia');
      for i:=0 to chkRubros.Count-1 do
      begin
        if chkRubros.Checked[i] then
        begin
          nroRecomendacion := nroRecomendacion+1;
          if not ExisteSql(
            ' SELECT 1 ' +
            '   FROM art.prv_resvisitas ' +
            ' WHERE rv_cuit = ' +SqlValue(fraEmpresa.CUIT)+
            '    AND rv_estableci = ' +SqlValue(fraEstableci.Value)+
            '    AND rv_fecha = '+SqlValue(edFechaVisita.Date)) then
          begin
            idvisita := GetSecNextVal('ART.SEQ_PRV_ID');
            EjecutarSqlST(' INSERT INTO art.prv_resvisitas '+
                          '             (rv_id, rv_cuit, rv_estableci, rv_tipo, '+
                          '              rv_operativo, rv_prestador, rv_indicevisita, '+
                          '              rv_fechaalta, rv_usualta, rv_fecha, rv_firmante) '+
                          '      VALUES ('+SqlValue(idvisita)+', '+SqlValue(fraEmpresa.CUIT)+', '+
                                          SqlValue(fraEstableci.Value)+', art.hys.get_tipo_estab_prev('+
                                           SqlValue(fraEmpresa.CUIT)+','+SqlValue(fraEstableci.edCodigo.Text)+'),'+
                                         ' art.hys.get_operativovigente_empresa ('+SqlValue(fraEmpresa.CUIT)+','+
                                          SqlValue(edFechaVisita.Date)+'), ''0001'',0, sysdate,'+SqlValue(Sesion.LoginName)+
                                         ',' +SqlValue(edFechaVisita.Date)+','+SqlValue(fraPreventor.Value)+')');

            for j:=0 to chkTareas.Count - 1 do
            if chkTareas.Checked[j] then
            begin
              if not ExisteSQL ('SELECT 1 ' +
                                '  FROM hys.hvm_visitamotivo ' +
                                ' WHERE vm_idvisita = ' + SqlValue(idvisita) +
                                '   AND vm_idmotivo = ' + SqlValue(TTareaMotivo(chkTareas.Items.Objects[j]).IdMotivo)) then
              begin
                EjecutarSqlST(
                              'INSERT INTO hys.hvm_visitamotivo ' +
                              '            (vm_idvisita, vm_idmotivo, vm_usualta, vm_fechaalta, vm_id) ' +
                              '     VALUES (' + SqlValue(idvisita) + ', ' +
                                                SqlValue(TTareaMotivo(chkTareas.Items.Objects[j]).IdMotivo) + ', ' +
                                                SqlValue(Sesion.LoginName) + ', ' +
                                            'SYSDATE, HYS.SEQ_HVM_ID.NEXTVAL)');
              end
              else
              begin
                EjecutarSqlST(
                  'UPDATE hys.hvm_visitamotivo ' +
                  '   SET vm_usubaja = NULL, ' +
                  '       vm_fechabaja = NULL' +
                  ' WHERE vm_idvisita = ' + SqlValue(idvisita) +
                  '   AND vm_idmotivo = ' + SqlValue(TTareaMotivo(chkTareas.Items.Objects[j]).IdMotivo));
              end;
            end;
          end
          else
          begin
            idVisita := ValorSql(
                                ' SELECT rv_id '+
                                '   FROM art.prv_resvisitas ' +
                                ' WHERE rv_cuit = ' +SqlValue(fraEmpresa.CUIT)+
                                '    AND rv_estableci = ' +SqlValue(fraEstableci.Value)+
                                '    AND rv_fecha = '+SqlValue(edFechaVisita.Date));
          end;
          if not ExisteSQL ('SELECT 1 FROM art.pod_obradenuncia ' +
                    ' WHERE od_cuit = ' + SqlValue(fraEmpresa.CUIT) +
                    '   AND od_estableci = ' + SqlValue(fraEstableci.Value) +
                    '   AND od_fecha = ' + SqlDate (edFechaVisita.Date) +
                    '   AND od_operativo= art.hys.get_operativovigente_empresa ('+SqlValue(fraEmpresa.CUIT)+','+
                    SqlValue(edFechaVisita.Date)+')') then
          begin
            idObraDenuncia := GetSecNextVal('ART.SEQ_POD_ID');
            EjecutarSqlST(' INSERT INTO art.pod_obradenuncia '+
                          '             (od_cuit, od_estableci, od_fecha, od_tipo, '+
                          '              od_usualta, od_fechaalta, od_operativo, od_idvisita, '+
                          '              od_tipo_visita, od_id '+
                          '             ) '+
                          '      VALUES ('+SqlValue(fraEmpresa.CUIT)+','+
                           SqlValue(fraEstableci.Value) +' , '+
                           SqlDate(edFechaVisita.Date)+', art.hys.get_tipo_estab_prev('+
                           SqlValue(fraEmpresa.CUIT)+','+ SqlValue(fraEstableci.Value)+'),'+
                           sqlvalue(Sesion.LoginName)+', SYSDATE, art.hys.get_operativovigente_empresa ('+
                           SqlValue(fraEmpresa.CUIT)+','+SqlValue(edFechaVisita.Date)+'), '+SqlValue(idvisita) +','+
                          ' ''U'' ,'+SqlValue(idObraDenuncia)+')');
          end
          else
          begin
            idObraDenuncia := ValorSql ('SELECT od_id FROM art.pod_obradenuncia ' +
                    ' WHERE od_cuit = ' + SqlValue(fraEmpresa.CUIT) +
                    '   AND od_estableci = ' + SqlValue(fraEstableci.Value) +
                    '   AND od_fecha = ' + SqlDate (edFechaVisita.Date) +
                    '   AND od_operativo= art.hys.get_operativovigente_empresa ('+SqlValue(fraEmpresa.CUIT)+','+
                    SqlValue(edFechaVisita.Date)+')');
          end;

          EjecutarSqlST(' INSERT INTO art.pdd_detalledenuncia '+
                        '             (dd_id, dd_grupo, dd_rubro, dd_usualta, dd_fechaalta, dd_tipo, '+
                        '              dd_operativo, dd_idvisita, dd_observaciones, dd_idpodobradenuncia, '+
                        '              dd_nrorecomendacion, dd_tipodenuncia, dd_seguimiento ) '+
                        '      VALUES (art.seq_pdd_id.NEXTVAL, '+SqlValue(fraGrupoDenuncia.Codigo)+','+
                                       SqlValue(integer(chkRubros.Items.Objects[i]))+','+SqlValue(Sesion.LoginName)+', SYSDATE,'+
                        '              art.hys.get_tipo_estab_prev('+SqlValue(fraEmpresa.CUIT)+','+ SqlValue(fraEstableci.Value)+'), '+
                        '              art.hys.get_operativovigente_empresa ('+SqlValue(fraEmpresa.CUIT)+','+SqlValue(edFechaVisita.Date)+'), '+
                                       SqlValue(idvisita)+', '''', '+SqlValue(idObraDenuncia)+','+SqlValue(nroRecomendacion)+' , ''M'', '+
                        '               NULL '+
                        '              )');
        end;
      end;
      CommitTrans(True);
    except
      on E: Exception do begin
        Rollback(True);
        ErrorMsg(E, 'Error al guardar Verificacion de basica');
      end;
    end;
  end;
  fpVerificaciones.ModalResult := mrClose;
end;

procedure TfrmCargaTareas.btnAceptarSeg463Click(Sender: TObject);
var
  IdVisita : Integer;
begin
  Verificar(cmbSegTipo463.ItemIndex = -1, cmbSegTipo463, 'Debe Ingresar el Cumplimiento.');
  Verificar(edSegFecha463.Date = 0, edSegFecha463, 'Debe Ingresar la fecha de Seguimiento.');


  IdVisita := ValorSqlInteger('SELECT rv_id FROM art.prv_resvisitas ' +
                               ' WHERE rv_cuit = ' + SqlValue(sdqRes463.FieldByName('em_cuit').AsString) +
                               '   AND rv_estableci = ' + SqlValue(sdqRes463.FieldByName('rl_estableci').AsInteger) +
                               '   AND rv_fecha = ' + SqlDate (edSegFecha463.Date)+
                               '   AND rv_fechabaja IS NULL ');

  if IdVisita = 0 then
  begin
    InvalidMsg(edSegFecha463, 'No existe una visita para la fecha indicada.');
    abort;
  end;

  Verificar(ExisteSql(
    'SELECT 1 ' +
    '  FROM hys.hrt_relevseguimiento ' +
    ' WHERE rt_fechabaja IS NULL ' +
    '   AND rt_idrelevriesgolaboral = ' + SqlValue(sdqRes463.FieldByName('rl_id').AsInteger)+
    '   AND rt_iditem = ' +sqlvalue(sdqRes463.FieldByName('ia_id').AsInteger)+
    '   AND rt_fechaseguimiento = '+SqlValue(edSegFecha463.Date) ),edSegFecha463, 'Ya existe seguimiento para esa fecha.');

  EjecutarSql(
    ' INSERT INTO hys.hrt_relevseguimiento '+
    '             (rt_id, rt_idrelevriesgolaboral, rt_iditem, rt_fechaseguimiento, '+
    '              rt_cumple, rt_usualta, rt_fechaalta '+
    '             ) '+
    '      VALUES (hys.seq_hrt_relev_id.nextval, '+SqlValue(sdqRes463.FieldByName('rl_id').AsInteger)+','+
     SqlValue(sdqRes463.FieldByName('ia_id').AsInteger)+','+ SqlValue(edSegFecha463.Date)+','+SqlValue(cmbSegTipo463.Value)+','+
      SqlValue(Sesion.UserID)+', SYSDATE )');
  fpSeguimiento463.ModalResult := mrOk;
end;

procedure TfrmCargaTareas.btnAceptarSegAccidenteClick(Sender: TObject);
var
  bEsAlta: Boolean;
begin
  bEsAlta := (ModoABMSegAccidente = maAlta);

  Verificar(cbTipoAccidentes.ItemIndex = -1, cbTipoAccidentes, 'Debe seleccionar un tipo de visita.');
  Verificar(bEsAlta and (edFechaSegAccidente.Date = 0), edFechaSegAccidente, 'Debe ingresar la fecha de visita.');
  Verificar(bEsAlta and (edFechaSegAccidente.Date > DBDate), edFechaSegAccidente, 'La fecha de visita tiene que ser menor o igual a hoy.');

  if ((cbTipoAccidentes.Value = 'C') and (not ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITA WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqMedidasAccidente.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqSeguimientoAccidentes.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(cbTipoAccidentes, 'La primer visita debe ser "Visita" o "Incumplimiento".');
    Abort;
  end;

  if ((cbTipoAccidentes.Value = 'V') and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITA WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqMedidasAccidente.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqSeguimientoAccidentes.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(cbTipoAccidentes, 'La visita debe ser "Cumplimiento" o "Incumplimiento".');
    Abort;
  end;

  if bEsAlta and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITA WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqMedidasAccidente.FieldByName('MC_ID').AsInteger) + ' AND SV_FECHA = ' + SqlValue(edFechaSegAccidente.Date))) then
  begin
    InvalidMsg(cbTipoAccidentes, 'Ya existe una visita con esta fecha.');
    Abort;
  end;

  if bEsAlta and (edFechaSegAccidente.Date < sdqMedidasAccidente.FieldByName('MC_FECHAEJECUCION').AsDateTime) then
    if not MsgAsk('La fecha de visita es mayor o igual a la fecha de ejecución.' + CRLF + '¿Está seguro que la fecha ingresada es correcta?') then
      Abort;

  guardarSeguimientoAccidente(ModoABMSegAccidente = maAlta, sdqMedidasAccidente.FieldByName('MC_ID').AsInteger, cbTipoAccidentes.Value, edFechaSegAccidente.Date, IIF(ModoABMSegAccidente = maAlta,0,sdqSeguimientoAccidentes.FieldByName('sv_ID').AsInteger));
  sdqSeguimientoAccidentes.Refresh;
  fpSegAccidente.ModalResult := mrOk;
end;

procedure TfrmCargaTareas.btnAceptarViaticoClick(Sender: TObject);
begin
  inherited;
  Verificar(edFechaDesdeViatico.Date = 0, edFechaDesdeViatico, 'Debe seleccionar una fecha desde.');
  Verificar(edFechaHastaViatico.Date = 0, edFechaHastaViatico, 'Debe seleccionar una fecha hasta.');
  Verificar(edFechaRecepcionViatico.Date = 0, edFechaRecepcionViatico, 'Debe seleccionar una fecha recepcion Viatico.');
  Verificar(edFechaEntregaCoordinador.Date = 0, edFechaEntregaCoordinador, 'Debe seleccionar una fecha entrega coordinador.');
  Verificar(edKmsViatico.Text = '', edKmsViatico, 'Debe seleccionar KMS totales.');
  Verificar(edKmRegreso.Text = '', edKmRegreso, 'Debe seleccionar KMS Regreso.');
  //Verificar(edOtrosGastos.Value = 0, edMontoTotalViaticos, 'Debe seleccionar el Otros.');
  Verificar(FFechaMinDesdeViatico < edFechaDesdeViatico.Date, edFechaDesdeViatico, 'Hay fechas de visitas menores a la fecha desde.');
  Verificar(FFechaMaxHastaViatico > edFechaHastaViatico.Date, edFechaHastaViatico, 'Hay fechas de visitas mayores a la fecha hasta.');
  fpViaticos.ModalResult := mrOk;
end;

procedure TfrmCargaTareas.GuardarTareas(aIdVisita: integer);
var
  i: integer;
begin
  EjecutarSqlSTEx('DELETE FROM HYS.HTP_TAREAPREVENTOR WHERE TP_IDVISITAPREVENTOR = :ID', [aIdVisita]);
  for i:=0 to chkTareas.Count - 1 do
    if chkTareas.Checked[i] then
      EjecutarSqlSTEx('INSERT INTO HYS.HTP_TAREAPREVENTOR(TP_ID, TP_IDVISITAPREVENTOR, TP_IDTAREA, TP_FECHAALTA, TP_USUALTA, TP_IDMOTIVO) ' +
                      'VALUES(HYS.SEQ_HTP_TAREAPREVENTOR.NEXTVAL, :IDVISITAPREV, :IDTAREA, SYSDATE, :USUARIO, :IDMOTIVO) ',
                      [aIdVisita, TTareaMotivo(chkTareas.Items.Objects[i]).IdTarea, Sesion.LoginName, TTareaMotivo(chkTareas.Items.Objects[i]).IdMotivo]);
end;

procedure TfrmCargaTareas.GuardarFaltaDoc(aIdVisita: integer);
var
  i: integer;
begin
  EjecutarSqlSTEx('DELETE FROM HYS.HFT_FALTADOCTAREAS WHERE FT_IDVISITAPREVENTOR = :ID', [aIdVisita]);
  for i:=0 to chkFaltaDocFisico.Count - 1 do
    if chkFaltaDocFisico.Checked[i] then
      EjecutarSqlSTEx('INSERT INTO HYS.HFT_FALTADOCTAREAS(FT_ID, FT_IDVISITAPREVENTOR, FT_IDTAREA, FT_FECHAALTA, FT_USUALTA) ' +
                      'VALUES(HYS.SEQ_HTP_TAREAPREVENTOR.NEXTVAL, :IDVISITAPREV, :IDTAREA, SYSDATE, :USUARIO) ',
                      [aIdVisita, TTareaMotivo(chkFaltaDocFisico.Items.Objects[i]).IdTarea, Sesion.LoginName]);
end;

procedure TfrmCargaTareas.CargarFaltaDoc(aIdVisita: integer);
var
  i: integer;
begin
  chkTareasClick(nil);
  with GetQueryEx('SELECT * FROM HYS.HFT_FALTADOCTAREAS WHERE FT_IDVISITAPREVENTOR = :ID', [aIdVisita]) do
  try
    while not Eof do
    begin
      for i:=0 to chkFaltaDocFisico.Count-1 do
        if TTareaMotivo(chkFaltaDocFisico.Items.Objects[i]).IdTarea = FieldByName('FT_IDTAREA').AsInteger then
        begin
          chkFaltaDocFisico.Checked[i] := true;
          chkFaltaDocFisico.Items.Move(i, 0);
        end;
      Next;
    end;
  finally
    free;
  end;

  chkTareas.ItemIndex := 0;
  CargarDetalleMotivos(TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdTarea);
end;

procedure TfrmCargaTareas.CargarTareas(aIdVisita: integer);
var
  i: integer;
begin
  DesmarcarItems;
  with GetQueryEx('SELECT * FROM HYS.HTP_TAREAPREVENTOR WHERE TP_IDVISITAPREVENTOR = :ID', [aIdVisita]) do
  try
    while not Eof do
    begin
      for i:=0 to chkTareas.Count-1 do
        if TTareaMotivo(chkTareas.Items.Objects[i]).IdTarea = FieldByName('tp_idtarea').AsInteger then
        begin
          chkTareas.Checked[i] := true;
          TTareaMotivo(chkTareas.Items.Objects[i]).IdMotivo := FieldByName('tp_idmotivo').AsInteger;
          chkTareas.Items.Move(i, 0);
        end;
      Next;
    end;
  finally
    free;
  end;

  chkTareas.ItemIndex := 0;
  CargarDetalleMotivos(TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdTarea);
end;

procedure TfrmCargaTareas.tbNuevoClick(Sender: TObject);
begin
  btnAceptar.Caption := '&Guardar';
  btnCancelar.Caption := '&Cerrar';
  inherited;
end;

procedure TfrmCargaTareas.tbNuevoPALClick(Sender: TObject);
//var
//  IdUltimaVisita: integer;
begin
    if dbgPAL.SelectedRows.Count > 0 then
    begin
      if VerificarFechasCumSegPal then
      begin
        {IdUltimaVisita := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                           '  FROM art.prv_resvisitas rv ' +
                                           ' WHERE rv.rv_cuit = ' + SqlValue (sdqPAL.FieldByName('pa_cuit').AsString) +
                                           '   AND rv.rv_estableci = ' + SqlValue (sdqPAL.FieldByName('pa_estableci').AsString) +
                                           '   AND rv.rv_operativo = ' + SqlValue (sdqPAL.FieldByName('pa_operativo').AsString) +
                                           '   AND rv.rv_fechabaja IS NULL ') ;
        }
        cmbTipoCumplimientoPAL.ItemIndex := 0;
        cmbTipoCumplimientoPALChange(nil);
        {edFechaVisitaPal.Date      := ValorSqlDateTime (
                                  'SELECT rv_fecha ' +
                                  '  FROM art.prv_resvisitas ' +
                                  ' WHERE rv_id = ' + SqlValue (IdUltimaVisita)
                                );
         }
        edFechaVisitaPal.Date := FFechaVisita;

        if fpVisita.ShowModal = mrOk Then
        begin
          sdqVisitasPal.Refresh;
          sdqPAL.Refresh;
        end;

      end else
        MessageBox(0,
            'No es posible proceder. Existe al menos un registro sin fecha de cumplimiento/seguimiento.',
            'Atención.', MB_ICONEXCLAMATION or MB_OK);
  end;
end;

procedure TfrmCargaTareas.tbNuevoRes463Click(Sender: TObject);
begin
  if fpSeguimiento463.ShowModal = mrOk then
    sdqSeguimientoRes463.Refresh;
end;

function TfrmCargaTareas.VerificarFechasCumSegPal: Boolean;
var
  i: integer;
  bmk: TBookmark;
begin
  Result := True;
  sdqPAL.DisableControls;
  bmk := sdqPAL.GetBookmark;

  try
    for i := 0 to dbgPAL.SelectedRows.Count -1 do
    begin
      sdqPAL.GotoBookmark(pointer(dbgPAL.SelectedRows.Items[i]));
      if (sdqPAL.FieldByName('pa_cumplimiento').IsNull) or
         (sdqPAL.FieldByName('pa_seguimiento').IsNull) then
      begin
        Result := False;
        Break;
      end;
    end;
  finally
    sdqPAL.GotoBookmark(bmk);
    sdqPAL.EnableControls;
  end;
end;


procedure TfrmCargaTareas.tbNuevoSegEnfermedadesClick(Sender: TObject);
begin
  if not sdqMedidasEnfermedades.IsEmpty then
  begin
    if sdqMedidasEnfermedades.FieldByName('MC_FECHABAJA').IsNull then
    begin
      cbTipoEnfermedades.ItemIndex := -1;
      edFechaSegEnfermedades.Clear;
      edFechaSegEnfermedades.Date := FFechaVisita;

      VCLExtra.LockControl(edFechaSegEnfermedades, False);

      ModoABMSegEnfermedades := maAlta;

      fpSeguimientoEnfermedades.ShowModal;
    end
    else
      MsgBox('La medida correctiva seleccionada se encuentra dada de baja.', MB_ICONERROR);
  end
  else
    MsgBox('Para poder dar de alta una visita, debe haber seleccionado previamente alguna medida correctiva.', MB_ICONERROR);
end;

procedure TfrmCargaTareas.tbProcesarViaticoClick(Sender: TObject);
var
  i : Integer;
  idViatico : Integer;
  KmsTotales : Extended;
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  VCLExtra.LockControls([fraPreventorViatico, edMontoTotalViaticos],True);

  VCLExtra.LockControls([edFechaDesdeViatico,edFechaHastaViatico,edKmsViatico,
                         edObservacionViatico,btnAceptarViatico,edKmRegreso,edFechaRecepcionViatico,
                         edFechaEntregaCoordinador],False);
  fraPreventorViatico.Value := ValorSql(' SELECT vp_idpreventor '+
                                         ' FROM hys.hvp_visitapreventor '+
                                         ' WHERE vp_id = '+SqlValue(SelectedList.Strings[SelectedList.Count-1]));
  edFechaDesdeViatico.Clear;
  edFechaHastaViatico.Clear;
  edFechaEntregaCoordinador.Clear;
  edFechaRecepcionViatico.Clear;
  edKmsViatico.Text := '';
//  edKmRegreso.Text := '';
  edMontoTotalViaticos.Clear;
  edOtrosGastos.Clear;
  edPeaje.Clear;
  edHoteles.Clear;
  edEstacionamiento.Clear;
  edObservacionViatico.Clear;
  FFechaMinDesdeViatico := 0;
  FFechaMaxHastaViatico := 0;
  KmsTotales := 0;
  for i:=0 to SelectedList.Count-1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
    if (FFechaMinDesdeViatico > sdqConsulta.FieldByName('VP_FECHAVIATICO').AsDateTime) or (FFechaMinDesdeViatico = 0) then
      FFechaMinDesdeViatico := trunc(sdqConsulta.FieldByName('VP_FECHAVIATICO').AsDateTime);
    if (FFechaMaxHastaViatico < sdqConsulta.FieldByName('VP_FECHAVIATICO').AsDateTime) or (FFechaMaxHastaViatico = 0) then
      FFechaMaxHastaViatico := trunc(sdqConsulta.FieldByName('VP_FECHAVIATICO').AsDateTime);
    if not sdqConsulta.FieldByName('vp_kms').IsNull then
      KmsTotales := KmsTotales + sdqConsulta.FieldByName('vp_kms').AsFloat;
  end;
  edKmsViatico.Text := FloatToStr(KmsTotales);
  edKmsViaticosChange(nil);
  if fpViaticos.ShowModal = mrOk then
  begin
    BeginTrans(True);
    idViatico := GetSecNextVal('hys.seq_hvt_id');
    EjecutarSqlST(
       'INSERT INTO hys.hvt_viaticotareas ' +
       '            (vt_id, vt_idpreventor, vt_fechadesde, vt_fechahasta, ' +
       '             vt_kmtotal, vt_montototal, vt_observaciones, vt_usualta, ' +
       '             vt_fechaalta, VT_OTROSGASTOS, VT_PEAJES, VT_HOTELES, VT_ESTACIONAMIENTO, VT_KMTOTALESREGRESO, ' +
       '             VT_FECHARECEPCIONVIATICO, VT_FECHAENTREGACOORDINADOR '+
       '            ) ' +
       '     VALUES ('+SqlValue(idViatico)+','+SqlValue(fraPreventorViatico.Value)+','+
                       SqlValue(edFechaDesdeViatico.Date)+','+ SqlValue(edFechaHastaViatico.Date)+', ' +
                       SqlNumber(edKmsViatico.Text, False)+','+SqlValue(edMontoTotalViaticos.Value)+','+
                       SqlValue(edObservacionViatico.Text)+' , '+ SqlValue(Sesion.LoginName)+', ' +
       '             SYSDATE,'+SqlValue(edOtrosGastos.Value)+', '+SqlValue(edPeaje.Value)+', '+
                       SqlValue(edHoteles.Value)+', '+SqlValue(edEstacionamiento.Value)+', '+
                       SqlNumber(edKmRegreso.Text, False)+','+ SqlValue(edFechaRecepcionViatico.Date)+','+
                       SqlValue(edFechaEntregaCoordinador.Date)+' ) ');
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      EjecutarSqlST(' UPDATE hys.hvp_visitapreventor ' +
                    '    SET vp_idviatico = ' + SqlValue(idViatico) +
                    '  WHERE vp_id = ' + SqlValue(SelectedList.Strings[i]));
    end;
    CommitTrans(True);
  end;
  tbRefrescarClick(nil);
end;

procedure TfrmCargaTareas.tbRefrescarAccidenteClick(Sender: TObject);
begin
  inherited;
  CargaAccidentes;
end;

procedure TfrmCargaTareas.tbRefrescarEnfermedadesClick(Sender: TObject);
begin
  inherited;
  CargaEnfermedades;
end;

procedure TfrmCargaTareas.tbSeleccionarTodoClick(Sender: TObject);
var
  i: integer;
  bVerifica : boolean;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      bVerifica := sdqConsulta.FieldByName('vp_idviatico').IsNull;
      if bVerifica then
      begin
        if SelectedList.Count > 0 then
          bVerifica := ExisteSql(' SELECT 1 ' +
                                 '  FROM hys.hvp_visitapreventor ' +
                                 ' WHERE vp_id = '+sqlvalue(SelectedList.Strings[SelectedList.Count-1])+
                                 '   AND vp_idpreventor = '+SqlValue(sdqConsulta.FieldByName('VP_IDPREVENTOR').AsString));
      end;
      if bVerifica then
      begin
          bVerifica := sdqConsulta.FieldByName('vp_aprobado').AsString = 'S';
      end;
      if bVerifica then
      begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('VP_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('VP_ID').AsString, sdqConsulta.GetBookmark);
      end;
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;

procedure TfrmCargaTareas.tbVisAgregarClick(Sender: TObject);
begin
  if dbgRecomendaciones.SelectedRows.Count > 0 then begin
    cmbVisTipo.ItemIndex := 0;

    FIdUltimaVisitaPRS := ValorSqlInteger ('SELECT MAX (rv.rv_id) rv_id ' +
                                        '  FROM art.prv_resvisitas rv ' +
                                        ' WHERE rv.rv_cuit = ' + SqlValue (sdqRecomendaciones.FieldByName('re_cuit').AsString) +
                                        '   AND rv.rv_estableci = ' + SqlValue (sdqRecomendaciones.FieldByName('re_estableci').AsString) +
                                        '   AND rv.rv_operativo = ' + SqlValue (sdqRecomendaciones.FieldByName('re_operativo').AsString) +
                                        '   AND rv.rv_fechabaja IS NULL ' );

    {edVisFecha.Date      := ValorSqlDateTime (
                              'SELECT rv_fecha ' +
                              '  FROM art.prv_resvisitas ' +
                              ' WHERE rv_id = ' + SqlValue (FIdUltimaVisitaPRS)
                            );}
    edVisFecha.Date := FFechaVisita;

    if fpVisitas.ShowModal = mrOk Then
      sdqVisitas.Refresh ;
  end;
end;

procedure TfrmCargaTareas.tbVisQuitarClick(Sender: TObject);
Var Sql : String;
begin
  Verificar(sdqVisitas.FieldByName('RV_FECHAALTA').AsDateTime < DBDate,tbVisQuitar,'No se pueden eliminar seguimientos dados de alta en otra fecha.');
  Try
    Sql := 'UPDATE PRV_RECVISITAS ' +
              'SET RV_USUBAJA = ''' + Sesion.LoginName + ''', ' +
                  'RV_FECHABAJA = SYSDATE ' +
            'WHERE RV_CUIT = ' + SqlValue (sdqRecomendaciones.FieldByName('re_cuit').AsString) +
             ' AND RV_ESTABLECI = ' + SqlValue (sdqRecomendaciones.FieldByName('re_estableci').AsString)+
             ' AND RV_TIPO = '+ SqlValue (sdqRecomendaciones.FieldByName('re_tipo').AsString)+
             ' AND RV_OPERATIVO = ' + SqlValue (sdqRecomendaciones.FieldByName('re_operativo').AsString)+
             ' AND RV_RECOMENDACION = ' + sdqRecomendaciones.fieldbyname('RE_RECOMENDACION').AsString +
             ' AND RV_TIPO_VISITA = ''' + sdqVisitas.FieldByName('RV_TIPO_VISITA').AsString + '''' +
             ' AND RV_FECHA = ' + SqlDate(sdqVisitas.FieldByName('RV_FECHA').AsDateTime);

    EjecutarSql( Sql );
    sdqVisitas.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;
end;

procedure TfrmCargaTareas.tbModificarClick(Sender: TObject);
begin
  btnAceptar.Caption := '&Aceptar';
  btnCancelar.Caption := '&Cancelar';
  inherited;
end;

procedure TfrmCargaTareas.tbModificarSegAccidenteClick(Sender: TObject);
begin
  if (not sdqSeguimientoAccidentes.IsEmpty) and (sdqSeguimientoAccidentes.FieldByName('SV_FECHABAJA').IsNull) then
    with sdqSeguimientoAccidentes do
    begin
      cbTipoAccidentes.Value := FieldByName('SV_TIPO').AsString;
      edFechaSegAccidente.Date := FieldByName('SV_FECHA').AsDateTime;

      VCLExtra.LockControl(edFechaSegAccidente, True);

      ModoABMSegAccidente := maModificacion;

      fpSegAccidente.ShowModal;
    end;
end;

procedure TfrmCargaTareas.tbModificarSegEnfermedadesClick(Sender: TObject);
begin
  if (not sdqSeguimientoEnfermedades.IsEmpty) and (sdqSeguimientoEnfermedades.FieldByName('SV_FECHABAJA').IsNull) then
    with sdqSeguimientoEnfermedades do
    begin
      cbTipoEnfermedades.Value := FieldByName('SV_TIPO').AsString;
      edFechaSegEnfermedades.Date := FieldByName('SV_FECHA').AsDateTime;
      VCLExtra.LockControl(edFechaSegEnfermedades, True);

      ModoABMSegEnfermedades := maModificacion;

      fpSeguimientoEnfermedades.ShowModal;
    end;
end;

procedure TfrmCargaTareas.RefreshData;
var
  sSql : String;
  sOrigenIn : String;
begin
  SelectedList.Clear;
  sSql := ' SELECT pit.*,  aes.*, aco.*, aem.*, hvd.*, hvp.*, ' +
          '  (SELECT COUNT(*) ' +
          '     FROM hys.hvp_visitapreventor hvp2 ' +
          '    WHERE hvp2.vp_fechabaja IS NULL ' +
          '       AND trunc(hvp2.vp_fechavisita) = trunc(hvp.vp_fechavisita) ' +
          '       AND hvp2.vp_origen = ''P'' '+
          '       AND hvp2.vp_idpreventor = hvp.vp_idpreventor) cantvisitas,' +
          '       DECODE(art.afiliacion.is_empresavip(co_contrato), ''S'', ''VIP'', ''N'', NULL) empresavip, ' +
          '       decode(vp_origen, ''P'', ''Preventor'', ''A'', ''Actuaciones'') origencarga '+
          '  FROM art.pit_firmantes pit, ' +
          '       afi.aes_establecimiento aes, ' +
          '       afi.aco_contrato aco, ' +
          '       afi.aem_empresa aem, ' +
          '       hys.hvd_visitadeclarada hvd, ' +
          '       hys.hvp_visitapreventor hvp ' +
          ' WHERE em_id = vp_idempresa ' +
          '   AND em_id = co_idempresa ' +
          '   AND es_contrato = co_contrato ' +
          '   AND co_contrato = art.get_vultcontrato(em_cuit) ' +
          '   AND es_nroestableci = vp_establecimiento ' +
          '   AND trunc(vp_fechavisita) = vd_fechavisita(+) ' +
          '   AND vp_idpreventor = vd_idpreventor(+) ' +
          '   AND it_id = vp_idpreventor ';

  if chkExcluirBajas.Checked then
    sSql := sSql + ' AND vp_fechabaja IS NULL ';

  if fraPreventorFiltro.IsSelected then
    sSql := sSql + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value);

  if fraPreventorTercerizadoFiltro.IsSelected then
    sSql := sSql + ' AND VP_IDPREVENTORCONSULTORA = ' + SqlValue(fraPreventorTercerizadoFiltro.Value);

  if fraCoordinador.IsSelected then
    sSql := sSql + ' AND IT_IDSUPERVISOR = ' + SqlValue(fraCoordinador.Value);

  if fraEmpresaFiltro.IsSelected then
    sSql := sSql + ' AND em_id = ' + SqlValue(fraEmpresaFiltro.Value);

  if edEstablecimientoFiltro.Text <> '' then
    sSql := sSql + ' AND es_nroestableci in (' + ArmarFiltroEstab(edEstablecimientoFiltro.Text)  + ') ';

  if edVisitaDesde.Date > 0 then
    sSql := sSql + ' AND vp_fechavisita >= ' + SqlValue(edVisitaDesde.Date);

  if edVisitaHasta.Date > 0 then
    sSql := sSql + ' AND trunc(vp_fechavisita) <= ' + SqlValue(edVisitaHasta.Date);

  if cbPendiente.Checked then
    sSql := sSql + ' AND vp_aprobado = ''N'' ';

  if cbAprobado.Checked then
    sSql := sSql + ' AND vp_aprobado = ''S'' ';

  if fraViaticoFiltro.IsSelected then
    sSql := sSql + ' AND VP_IDVIATICO = '+SqlValue(fraViaticoFiltro.Value);

  sOrigenIn := '';

  if chkPreventor.Checked then
    sOrigenIn := SqlValue('P');

  if chkActuaciones.Checked then
    sOrigenIn := sOrigenIn + iif(sOrigenIn <> '', ',', '') + SqlValue('A');

  if sOrigenIn <> '' then
    sSql := sSql + ' AND vp_origen in( ' + sOrigenIn + ')';

  if SortDialog.OrderBy <> '' then
    sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy
  else
    sdqConsulta.Sql.Text := sSql + ' ORDER BY co_contrato, es_nroestableci ';

  inherited;
end;

function TfrmCargaTareas.ArmarFiltroEstab(
  Establecimientos: string): string;
var
  i, j: integer;
  cotaMenor, cotaMayor: integer;
  tmpValores: string;
begin
  while (pos('-', Establecimientos) > 0) do
  begin
      i:= pos('-', Establecimientos);
      while (i > 0) and (Establecimientos[i] <> ',') do
          i := i - 1;

      cotaMenor := strtoint(copy(Establecimientos, i+1, pos('-', Establecimientos)-1 - i ));
      i:= pos('-', Establecimientos);

      while (i <= length(Establecimientos)) and (Establecimientos[i] <> ',') do
          i := i + 1;
      cotaMayor := strtoint(copy(Establecimientos, pos('-', Establecimientos)+1, i-1 - pos('-', Establecimientos)));

      tmpValores := '';

      for j:=cotaMenor to cotaMayor do
          tmpValores := tmpValores + ',' + IntToStr(j);
      Establecimientos := StringReplace(Establecimientos, '-', tmpValores + ',', []);
  end;
  result := Establecimientos;
end;

procedure TfrmCargaTareas.OnEmpresaChangeFiltro(Sender: TObject);
begin
  VCLExtra.LockControl(edEstablecimientoFiltro, not fraEmpresaFiltro.IsSelected);
  if not fraEmpresaFiltro.IsSelected then
    edEstablecimientoFiltro.Clear;
end;

procedure TfrmCargaTareas.tbLimpiarAccidenteClick(Sender: TObject);
begin
  inherited;
  fraTrabajadorAccidente.Clear;
end;

procedure TfrmCargaTareas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  edEstablecimientoFiltro.Clear;
  edVisitaDesde.Clear;
  edVisitaHasta.Clear;
  fraPreventorFiltro.Clear;
  fraPreventorTercerizadoFiltro.Clear;
  fraCoordinador.Clear;
  chkExcluirBajas.Checked := true;
  cbPendiente.Checked := False;
  cbAprobado.Checked := False;
  fraViaticoFiltro.Clear;

end;

procedure TfrmCargaTareas.tbLimpiarEnfermedadesClick(Sender: TObject);
begin
  inherited;
  fraTrabajadorEnfermedades.Clear;
end;

procedure TfrmCargaTareas.CargarDetalle;
begin
  if not gbDetalleTareas.Collapsed and not sdqConsulta.IsEmpty then
  begin
    sdqDetalleTareas.Close;
    sdqDetalleTareas.ParamByName('ID').Value := sdqConsulta.fieldbyname('vp_id').AsInteger;
    sdqDetalleTareas.ParamByName('idempresa').Value := sdqConsulta.fieldbyname('vp_idempresa').AsInteger;
    sdqDetalleTareas.ParamByName('estableci').Value := sdqConsulta.fieldbyname('vp_establecimiento').AsInteger;
    sdqDetalleTareas.ParamByName('fecha').Value := sdqConsulta.fieldbyname('VP_FECHAVISITA').AsDateTime;
    sdqDetalleTareas.Open;
    sdqTareaSubDetalle.Close;
    sdqTareaSubDetalle.ParamByName('ID').Value := sdqConsulta.fieldbyname('vp_id').AsInteger;
    sdqTareaSubDetalle.Open;
  end;

end;

procedure TfrmCargaTareas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  CargarDetalle;
  inherited;
end;

procedure TfrmCargaTareas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmCargaTareas.gbDetalleTareasExpanded(Sender: TObject);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmCargaTareas.sdqConsultaBeforeClose(DataSet: TDataSet);
begin
  sdqDetalleTareas.Close;
  inherited;
end;

procedure TfrmCargaTareas.sdqMedidasAccidenteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if sdqMedidasAccidente.IsEmpty Then begin
    sdqSeguimientoAccidentes.Close;
  end else
  begin
    if sdqSeguimientoAccidentes.Active then
    begin
      sdqSeguimientoAccidentes.Close;
    end;
    sdqSeguimientoAccidentes.ParamByName('id').AsString := sdqMedidasAccidente.FieldByName('mc_id').AsString;
    sdqSeguimientoAccidentes.Open;
  end;
end;

procedure TfrmCargaTareas.sdqMedidasEnfermedadesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if sdqMedidasEnfermedades.IsEmpty Then begin
    sdqSeguimientoEnfermedades.Close;
  end else
  begin
    if sdqSeguimientoEnfermedades.Active then
    begin
      sdqSeguimientoEnfermedades.Close;
    end;
    sdqSeguimientoEnfermedades.ParamByName('id').AsString := sdqMedidasEnfermedades.FieldByName('mc_id').AsString;
    sdqSeguimientoEnfermedades.Open;
  end;
end;

procedure TfrmCargaTareas.sdqPALAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if sdqPAL.IsEmpty Then begin
    sdqVisitasPal.Close;
  end else
  begin
    if sdqVisitasPal.Active then
    begin
      sdqVisitasPal.Close;
    end;
    sdqVisitasPal.ParamByName('pa_id').AsString := sdqPAL.FieldByName('pa_id').AsString;
    sdqVisitasPal.Open;
  end;
end;

procedure TfrmCargaTareas.sdqRecomendacionesAfterScroll(DataSet: TDataSet);
begin
  if sdqRecomendaciones.IsEmpty Then begin
    sdqVisitas.Close;
  end else
  begin
    if sdqVisitas.Active then
    begin
      sdqVisitas.Close;
    end;
    sdqVisitas.ParamByName('cuit').AsString := sdqConsulta.FieldByName('em_cuit').AsString;
    sdqVisitas.ParamByName('estableci').AsString := sdqConsulta.FieldByName('es_nroestableci').AsString;
    sdqVisitas.ParamByName('tipo').AsString := sdqRecomendaciones.FieldByName('re_tipo').AsString;
    sdqVisitas.ParamByName('operativo').AsString := sdqRecomendaciones.FieldByName('re_operativo').AsString;
    sdqVisitas.ParamByName('recomendacion').AsString := sdqRecomendaciones.FieldByName('re_recomendacion').AsString;
    sdqVisitas.Open;
  end;
end;

procedure TfrmCargaTareas.sdqRes463AfterScroll(DataSet: TDataSet);
begin
  if sdqRes463.IsEmpty Then begin
    sdqSeguimientoRes463.Close;
  end else
  begin
    if sdqSeguimientoRes463.Active then
    begin
      sdqSeguimientoRes463.Close;
    end;
    sdqSeguimientoRes463.ParamByName('idrelev').AsString := sdqRes463.FieldByName('rl_id').AsString;
    sdqSeguimientoRes463.ParamByName('iditem').AsString := sdqRes463.FieldByName('IA_NRODESCRIPCION').AsString;
    sdqSeguimientoRes463.Open;
  end;

end;

procedure TfrmCargaTareas.dbgDetalleTareasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqDetalleTareas.Active and not (sdqDetalleTareas.FieldByName('TP_FECHABAJA').IsNull) then
    AFont.Color := clRed;

  if sdqDetalleTareas.Active and (sdqDetalleTareas.FieldByName('realizado').AsString = 'N') then
  begin
    Background := $0098E9EB;
    if Highlight then
      AFont.Color := clBlack;
  end;
end;

procedure TfrmCargaTareas.CargarVisitaDeclarada(aFechaVisita: TDateTime;
  aIdPreventor: Integer);
begin
  with GetQueryEx(' SELECT vd_fechavisita, vd_idpreventor, vd_cantvisitas, TRUNC(vd_fechalata) vd_fechalata, vd_usualta ' +
                  ' FROM hys.hvd_visitadeclarada WHERE vd_fechavisita = :fecha AND vd_idpreventor = :idprev',
                   [TDateTimeEx.Create(aFechaVisita), aIdPreventor]) do
  try
    if FieldByName('vd_fechalata').IsNull or (FieldByName('vd_fechalata').AsDateTime = DBDate) then
      VCLExtra.LockControl(edCantVisitas, false)
    else
      VCLExtra.LockControl(edCantVisitas, true);
    edCantVisitas.Value := FieldByName('vd_cantvisitas').AsInteger;

    if FieldByName('vd_fechalata').IsNull then
      edCantVisitas.Tag := 0
    else
      edCantVisitas.Tag := 1;
  finally
    free;
  end;
  edCantVisitasCargadas.Value := ValorSqlIntegerEx(' SELECT COUNT(*) ' +
                                                   '   FROM hys.hvp_visitapreventor ' +
                                                   ' WHERE vp_fechabaja IS NULL ' +
                                                   '   AND trunc(vp_fechavisita) = :fecha ' +
                                                   '   AND vp_origen = ''P'' ' +
                                                   '   AND vp_idpreventor = :idprev ', [TDateTimeEx.Create(aFechaVisita), aIdPreventor], 0);
end;

procedure TfrmCargaTareas.OnPreventorChange(Sender: TObject);
begin
  HabilitarTercerizado(fraPreventor.Value);
  CargarVisitaDeclarada(edFechaVisita.Date, fraPreventor.Value);
end;

procedure TfrmCargaTareas.OnPreventorFiltroChange(Sender: TObject);
begin
  fraViaticoFiltro.ExtraCondition := ' AND vt_idpreventor = '+SqlValue(fraPreventorFiltro.Value);
end;

procedure TfrmCargaTareas.GuardarVisitaDeclarada(aFechaVisita: TDateTime;
  aIdPreventor: Integer);
begin
  if edCantVisitas.Enabled then
  begin
    if edCantVisitas.Tag = 1 then
      EjecutarSqlSTEx(' UPDATE hys.hvd_visitadeclarada ' +
                      '  SET vd_cantvisitas = :cantvisitas, ' +
                      '      vd_fechalata = sysdate, ' +
                      '      vd_usualta = :usualta ' +
                      ' WHERE vd_fechavisita = TRUNC(:fecha) AND vd_idpreventor = :idprev', [edCantVisitas.Value, Sesion.LoginName, TDateTimeEx.Create(aFechaVisita), aIdPreventor])
    else
      EjecutarSqlSTEx(' INSERT INTO hys.hvd_visitadeclarada(vd_fechavisita, vd_idpreventor, vd_cantvisitas, vd_fechalata, vd_usualta) ' +
                      ' VALUES(TRUNC(:fecha), :idprev, :cantvisitas, sysdate, :usualta)', [TDateTimeEx.Create(aFechaVisita), aIdPreventor, edCantVisitas.Value, Sesion.LoginName])

  end;
end;

procedure TfrmCargaTareas.chkVerTodasClick(Sender: TObject);
begin
  inherited;
  CargarTareas(chkVerTodas.Checked);
end;

function TfrmCargaTareas.GetTipoEstabPrev(aCuit: String;
  aEstab: integer): String;
begin
  if aCuit <>  '' then
    result := ValorSql(' SELECT te_codigo ' +
                       '  FROM hys.hte_tipoempresaprev ' +
                       '  WHERE te_id = hys.get_tipo_estab_prevencion( '+
                                      SqlValue(aCuit) + ',' + SqlValue(aEstab) + ')');
end;

procedure TfrmCargaTareas.GridCellClick(Column: TColumn);
var
 i :integer;
begin
  inherited;

  if Assigned(Column.Field) then
    if (Column.Field.FieldName = 'SELECTED') then
    begin
      Verificar(not sdqConsulta.FieldByName('vp_idviatico').IsNull,Grid,'Ya esta asignado a un viatico');
      Verificar(not (sdqConsulta.FieldByName('VP_APROBADO').AsString = 'S'),Grid,'Tiene que estar aprobada la tarea');
      if SelectedList.Count > 0 then
        Verificar(not ExisteSql(' SELECT 1 ' +
                                '  FROM hys.hvp_visitapreventor ' +
                                ' WHERE vp_id = '+sqlvalue(SelectedList.Strings[SelectedList.Count-1])+
                                '   AND vp_idpreventor = '+SqlValue(sdqConsulta.FieldByName('VP_IDPREVENTOR').AsString)),
                  Grid, 'No puede seleccionar un preventor distinto');
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('VP_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('VP_ID').AsString, sdqConsulta.GetBookmark)
      else begin
        {$IFDEF VER150}
        sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
        {$ENDIF}
        SelectedList.Delete(i);
      end;
      Column.Grid.Refresh;
    end;
end;

procedure TfrmCargaTareas.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('VP_ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCargaTareas.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('vp_idviatico').IsNull then
    AFont.Color := clBlue;
end;

procedure TfrmCargaTareas.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmCargaTareas.CargarDetalleMotivos(aIdTarea: integer);
begin
  chkDetalleMotivos.Clear;
  with GetQueryEx(' SELECT * ' +
                  ' FROM ART.PMO_MOTIVOS, HYS.HTM_TAREAMOTIVO ' +
                  ' WHERE TM_IDTAREA = :idtarea ' +
                  '   AND TM_FECHABAJA IS NULL ' +
                  '   AND TM_IDMOTIVO = MO_ID ' +
                  '   AND MO_FECHABAJA IS NULL ', [aIdTarea]) do
  try
    while not Eof do
    begin
      chkDetalleMotivos.AddItem(FieldByName('MO_DESCRIPCION').AsString, TObject(FieldByName('MO_ID').AsInteger));
      if chkTareas.Checked[chkTareas.ItemIndex] then
        chkDetalleMotivos.Checked[chkDetalleMotivos.Count-1] := TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdMotivo = FieldByName('MO_ID').AsInteger
      else
        TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdMotivo := 0;
      Next;
    end;
  finally
    free;
  end;
  if chkTareas.Checked[chkTareas.ItemIndex] and (chkDetalleMotivos.Count = 1) and not chkDetalleMotivos.Checked[0] then
  begin
    chkDetalleMotivos.Checked[0] := true;
    chkDetalleMotivos.ItemIndex := 0;
    chkDetalleMotivosClickCheck(nil);
  end;
end;

procedure TfrmCargaTareas.CargarFaltaDocFisicoOnchange;
var
  i : integer;
begin
  for i:= 0 to chkFaltaDocFisico.Count-1 do
    TTareaMotivo(chkFaltaDocFisico.Items.Objects[i]).Free;
  chkFaltaDocFisico.Clear;

  for i:= 0 to chkTareas.Count-1 do
    if chkTareas.Checked[i] then
    begin
      chkFaltaDocFisico.AddItem(chkTareas.Items[i], TTareaMotivo.Create(TTareaMotivo(chkTareas.Items.Objects[i]).IdTarea, 0,False));
      chkFaltaDocFisico.checked[chkFaltaDocFisico.count-1] := TTareaMotivo(chkTareas.Items.Objects[i]).FFaltaDoc;
    end;
end;


procedure TfrmCargaTareas.chkTareasClick(Sender: TObject);
begin
  inherited;
  CargarDetalleMotivos(TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdTarea);

end;

procedure TfrmCargaTareas.chkDetalleMotivosClickCheck(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i:= 0 to chkDetalleMotivos.Count - 1 do
  if (integer(chkDetalleMotivos.Items.Objects[i]) = TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdMotivo) then
    chkDetalleMotivos.Checked[i] := false;

  if chkDetalleMotivos.Checked[chkDetalleMotivos.ItemIndex] then
  begin
    TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdMotivo := integer(chkDetalleMotivos.Items.Objects[chkDetalleMotivos.ItemIndex]);
    chkTareas.Checked[chkTareas.ItemIndex] := true;
  end
  else
    TTareaMotivo(chkTareas.Items.Objects[chkTareas.ItemIndex]).IdMotivo := 0;

end;

procedure TfrmCargaTareas.chkFaltaDocFisicoClickCheck(Sender: TObject);
var
  i, j :Integer;
begin
  inherited;
  for i:= 0 to chkTareas.Count-1 do
  begin
    if chkTareas.Checked[i] then
    begin
      for j := 0 to chkFaltaDocFisico.Count-1 do
      begin
        if TTareaMotivo(chkTareas.Items.Objects[i]).IdTarea = TTareaMotivo(chkFaltaDocFisico.Items.Objects[j]).IdTarea then
        begin
          TTareaMotivo(chkTareas.Items.Objects[i]).FFaltaDoc := chkFaltaDocFisico.Checked[j];
        end;
      end;
    end
    else
      TTareaMotivo(chkTareas.Items.Objects[i]).FFaltaDoc := False;
  end;
end;

constructor TTareaMotivo.Create(aIdTarea, aIdMotivo: integer; aFaltaDoc : Boolean);
begin
  FIdTarea := aIdTarea;
  FIdMotivo := aIdMotivo;
  FFaltaDoc := aFaltaDoc;
end;

procedure TfrmCargaTareas.FSFormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to chkTareas.Count-1 do
    TTareaMotivo(chkTareas.Items.Objects[i]).Free;
  for i:= 0 to chkFaltaDocFisico.Count-1 do
    TTareaMotivo(chkFaltaDocFisico.Items.Objects[i]).Free;
  SelectedList.Free;
  inherited;
end;

function TfrmCargaTareas.TieneDetalle: boolean;
var
  i:integer;
begin
  result := true;
  for i:= 0 to chkTareas.Count-1 do
    if chkTareas.Checked[i] and ((TTareaMotivo(chkTareas.Items.Objects[i]).IdMotivo = 0)
      or (NoCorrepondeDetalle(TTareaMotivo(chkTareas.Items.Objects[i]).IdTarea, TTareaMotivo(chkTareas.Items.Objects[i]).IdMotivo))) then
    begin
      chkTareas.ItemIndex := i;
      chkTareasClick(nil);
      result := false;
      break;
    end;
end;

procedure TfrmCargaTareas.tbNuevoAccidentesClick(Sender: TObject);
begin
  if not sdqMedidasAccidente.IsEmpty then
  begin
    if sdqMedidasAccidente.FieldByName('MC_FECHABAJA').IsNull then
    begin
      cbTipoAccidentes.ItemIndex := -1;
      edFechaSegAccidente.Clear;
      edFechaSegAccidente.Date := FFechaVisita;

      VCLExtra.LockControl(edFechaSegAccidente, False);

      ModoABMSegAccidente := maAlta;

      fpSegAccidente.ShowModal;
    end
    else
      MsgBox('La medida correctiva seleccionada se encuentra dada de baja.', MB_ICONERROR);
  end
  else
    MsgBox('Para poder dar de alta una visita, debe haber seleccionado previamente alguna medida correctiva.', MB_ICONERROR);
end;

procedure TfrmCargaTareas.chkTareasClickCheck(Sender: TObject);
begin
  inherited;
  chkTareasClick(Sender);
  CargarFaltaDocFisicoOnChange;
end;

procedure TfrmCargaTareas.fpAbmShow(Sender: TObject);
begin
  inherited;
  if (ModoABM = maModificacion) and
      ((sdqConsulta.FieldByName('vp_origen').AsString = 'A') or
       ((sdqConsulta.FieldByName('VP_APROBADO').AsString = 'S') and not Seguridad.Activar(btnAprobar))) then
  begin
    VCLExtra.LockControls([btnAprobar,btnAceptar], true);
    VCLExtra.LockControls([fraEmpresa,fraEstableci,edFechaVisita,edHoraDesde,edCantVisitas,edCantVisitasCargadas,
                           edKms, chkVerTodas, chkTareas, chkDetalleMotivos, fraPreventor,edObservacion, edFechaViatico], true);
    btnCancelar.Enabled := true;
  end
  else
  begin
    VCLExtra.LockControls([fraEmpresa,fraEstableci,edFechaVisita,edHoraDesde,edCantVisitas,edCantVisitasCargadas,
                           edKms, chkVerTodas, chkTareas, chkDetalleMotivos, fraPreventor, edObservacion, edFechaViatico], false);
    VCLExtra.LockControls(btnAceptar, false);
    VCLExtra.LockControls([btnAprobar,chkFaltaDocFisico],not Seguridad.Activar(btnAprobar));
  end;
end;

function TfrmCargaTareas.NoCorrepondeDetalle(aIdTarea, aIdMotivo: integer): boolean;
begin
  result := not ExisteSqlEx(' SELECT 1 ' +
                            ' FROM HYS.HTM_TAREAMOTIVO ' +
                            ' WHERE TM_IDTAREA = :idtarea ' +
                            '   AND TM_FECHABAJA IS NULL ' +
                            '   AND TM_IDMOTIVO = :idmotivo ', [aIdTarea, aIdMotivo]);
end;

procedure TfrmCargaTareas.tbBajaSegAccidenteClick(Sender: TObject);
begin
  Verificar(sdqSeguimientoAccidentes.FieldByName('SV_FECHAALTA').AsDateTime < DBDate,tbBajaSegAccidente,'No se pueden eliminar seguimientos dados de alta en otra fecha.');
  DoDarDeBaja(sdqSeguimientoAccidentes, 'SV');
end;

procedure TfrmCargaTareas.tbBajaSegEnfermedadesClick(Sender: TObject);
begin
  Verificar(sdqSeguimientoEnfermedades.FieldByName('SV_FECHAALTA').AsDateTime < DBDate,tbBajaSegEnfermedades,'No se pueden eliminar seguimientos dados de alta en otra fecha.');
  DoDarDeBaja(sdqSeguimientoEnfermedades, 'SV');
end;

procedure TfrmCargaTareas.tbBusquedaViaticoClick(Sender: TObject);
begin
  with TfrmSeleccionarViatico.Create(nil) do
  try
    Visible := False;
    fraPreventorFiltro.Value := Self.fraPreventorFiltro.Value;
    if ShowModal = mrOk then
    begin
      fraViaticoFiltro.Value := FIdviatico;
      if fraViaticoFiltro.IsSelected then
        Self.tbRefrescarClick(nil);
    end;
  finally
    Free;
  end;
end;

procedure TfrmCargaTareas.tbDesSeleccionarTodoClick(Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  Grid.Refresh;
end;

procedure TfrmCargaTareas.tbEliminarPALClick(Sender: TObject);
var
  Sql: String;
begin
  Verificar(sdqVisitas.FieldByName('PS_FECHAALTA').AsDateTime < DBDate,tbEliminarPAL,'No se pueden eliminar seguimientos dados de alta en otra fecha.');
  Try
    Sql := 'UPDATE hys.hps_palseguimiento ' +
           '   SET ps_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
           '       ps_fechabaja = SYSDATE ' +
           ' WHERE ps_id = ' + SqlValue(sdqVisitasPal.FieldByName('ps_id').AsInteger) +
           ' AND ps_fechabaja IS NULL ';

    EjecutarSql(Sql);
    sdqVisitas.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;
end;

procedure TfrmCargaTareas.tbEliminarRes463Click(Sender: TObject);
var
  Sql : String;
begin
  Verificar(sdqVisitas.FieldByName('RT_FECHAALTA').AsDateTime < DBDate,tbEliminarRes463,'No se pueden eliminar seguimientos dados de alta en otra fecha.');
  Try
    Sql := 'UPDATE hys.hrt_relevseguimiento ' +
           '   SET rt_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
           '       rt_fechabaja = SYSDATE ' +
           ' WHERE rt_id = ' + SqlValue(sdqSeguimientoRes463.FieldByName('rt_id').AsInteger) +
           ' AND rt_fechabaja IS NULL ';

    EjecutarSql(Sql);
    sdqSeguimientoRes463.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;
end;

procedure TfrmCargaTareas.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
begin
  inherited;
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    Try
      AutoCols := ExportDialog.Fields.Count = 0;
      try
        if AutoCols Then
          ExportDialog.Fields.Assign( Grid.Columns );
        ExportDialog.OutputFile := TempPath +'CargaTareas.xls';
        ExportDialog.ExportFileType := etExcelFile;
        ExportDialog.SaveToFile;
        EnviarMailBD('', 'Carga Tareas', [oAutoFirma, oAlwaysShowDialog, oDeleteAttach], '', GetAttachments(TempPath +'CargaTareas.xls', 0));
      finally
        if AutoCols Then
          ExportDialog.Fields.Clear;
      end;
    Finally
      tbExportar.Enabled := True;
    End;
  end;
end;

procedure TfrmCargaTareas.tbImprimirRemitoClick(Sender: TObject);
begin
  Verificar(edVisitaDesde.Date = 0, edVisitaDesde, 'Debe seleccionar un fecha desde.');
  Verificar(edVisitaHasta.Date = 0, edVisitaHasta, 'Debe seleccionar un fecha hasta.');
  Verificar(not fraPreventorFiltro.IsSelected, fraPreventorFiltro, 'Debe seleccionar un preventor.');

  with TRptRemitoPreventor.Create(nil) do
  try
    VistaPrevia(edVisitaDesde.Date, edVisitaHasta.Date, fraPreventorFiltro.Value, fraPreventorFiltro.Descripcion);
  finally
    Free;
  end;

end;

{procedure TfrmCargaTareas.SetID(ADataSet: TSDQuery; AId: TTableId);
begin
  ADataSet.Close;
  ADataSet.Params[0].AsInteger := AId;
end;
}
procedure TfrmCargaTareas.DoDarDeBaja(ADataSet: TSDQuery; APrefijo: string; AAllowDelete: Boolean);
begin
  if (not ADataSet.IsEmpty) and ADataSet.FieldByName(APrefijo + '_FECHABAJA').IsNull and
      MsgAsk('¿ Desea dar de baja el registro seleccionado ?') then
  begin
    if AAllowDelete and ADataSet.FieldByName(APrefijo + '_FECHAEXPORT').IsNull then
    begin
      try
        ADataSet.Edit;
        ADataSet.FieldByName(APrefijo + '_USUBAJA').AsString     := Sesion.UserID;
        ADataSet.FieldByName(APrefijo + '_FECHABAJA').AsDateTime := DBDate;
        ADataSet.Post;
        ADataSet.ApplyUpdates;
      except
        on E: Exception do
        begin
          ADataSet.CancelUpdates;
          ErrorMsg(E, 'Error al dar de baja el registro.');
        end;
      end;
    end
    else
      MsgBox('El registro no se puede dar de baja ya que fue informado a la SRT.', MB_ICONERROR);
  end;
end;

procedure TfrmCargaTareas.ActualizarSeguimientos(iCodigo : Integer);
var
  i : Integer;
begin
  if ExisteSql('SELECT 1 ' +
               '  FROM hys.htp_tareapreventor, hys.hta_tarea ' +
               ' WHERE tp_idvisitapreventor = ' +SqlValue(iCodigo)+
               '   AND tp_idtarea = ta_id ' +
               '   AND tp_fechabaja IS NULL ' +
               '   AND ta_fechabaja IS NULL ' +
               '   AND ta_visible = ''S'' ' +
               '   AND ta_verificaseguimiento IS NOT NULL ') then
  begin
    if MsgBox('¿Desea ver las verificaciones?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      FFechaVisita := edFechaVisita.Date;
      for i:=0 to pnControl.PageCount-1 do
      begin
        pnControl.Pages[i].TabVisible := ExisteSql('SELECT 1 ' +
               '  FROM hys.htp_tareapreventor, hys.hta_tarea ' +
               ' WHERE tp_idvisitapreventor = ' +SqlValue(iCodigo)+
               '   AND tp_idtarea = ta_id ' +
               '   AND tp_fechabaja IS NULL ' +
               '   AND ta_fechabaja IS NULL ' +
               '   AND ta_visible = ''S'' ' +
               '   AND ta_verificaseguimiento = '+SqlValue(pnControl.Pages[i].Name)+
               '   AND ta_verificaseguimiento IS NOT NULL ')
      end;

      //Carga Accidentes
      CargaAccidentes;

      //Carga Enfermedades
      CargaEnfermedades;
      //Carga PRS
      if tsPRS.TabVisible then
      begin
        if sdqRecomendaciones.Active then
        begin
          sdqRecomendaciones.Close;
        end;
        sdqRecomendaciones.ParamByName('cuit').AsString      := sdqConsulta.FieldByName('em_cuit').AsString;
        sdqRecomendaciones.ParamByName('estableci').AsString := sdqConsulta.FieldByName('es_nroestableci').AsString;
        sdqRecomendaciones.Open;
        sdqRecomendacionesAfterScroll(nil);
      end;
      //Carga PAL
      if tsPAL.TabVisible then
      begin
        if sdqPAL.Active then
        begin
          sdqPAL.Close;
        end;
        sdqPAL.ParamByName('cuit').AsString      := sdqConsulta.FieldByName('em_cuit').AsString;
        sdqPAL.ParamByName('estableci').AsString := sdqConsulta.FieldByName('es_nroestableci').AsString;
        sdqPAL.Open;
        sdqPALAfterScroll(nil);
      end;
      //Carga 463
      if ts463.TabVisible then
      begin
        if sdqRes463.Active then
        begin
          sdqRes463.Close;
        end;
        sdqRes463.ParamByName('contrato').AsString  := sdqConsulta.FieldByName('co_contrato').AsString;
        sdqRes463.ParamByName('estableci').AsString := sdqConsulta.FieldByName('es_nroestableci').AsString;
        sdqRes463.Open;
        sdqRes463AfterScroll(nil);
      end;
      if ts463.TabVisible then
      begin
        if sdqRes463.Active then
        begin
          sdqRes463.Close;
        end;
        sdqRes463.ParamByName('contrato').AsString  := sdqConsulta.FieldByName('co_contrato').AsString;
        sdqRes463.ParamByName('estableci').AsString := sdqConsulta.FieldByName('es_nroestableci').AsString;
        sdqRes463.Open;
        sdqRes463AfterScroll(nil);
      end;
      if tsBasica.TabVisible then
      begin
       { if FGrupo <> Value Then begin
          FGrupo := Value;
        }
          fraGrupoDenuncia.ExtraCondition := ' AND (gd_tipo = art.hys.get_tipo_estab_prev('+
                                             SqlValue(sdqConsulta.FieldByName('em_cuit').AsString)+','+
                                             SqlValue(sdqConsulta.FieldByName('es_nroestableci').AsString)+')) ' +
                                             ' AND (gd_codigo  NOT IN (''TE'', ''PE'', ''CG'', ''BG'', ''PG'')) ';
          fraGrupoDenuncia.Clear;
          fraGrupoDenuncia.SelectFirst;
        //end;
      end;
      fpVerificaciones.ShowModal;
    end;
  end;

end;

procedure TfrmCargaTareas.CargaEnfermedades;
var
  sSQL : String;
  sWhere : String;
begin
  if tsEnfermedad.TabVisible then
  begin
    sWhere := '';
    sSQL := 'SELECT   ee_id, ee_idexpediente, '+
            '         ex_siniestro || ''/'' || ex_orden || ''/'' || ex_recaida siniestro, '+
            '         ee_nroestablecimiento, mc_id, mc_idenfermedadestablecimiento, '+
            '         mc_medida, mc_fechaejecucion, mc_fechaverificacion, mc_descripcion, '+
            '         mc_usualta usuario, mc_usubaja, mc_fechabaja, mc_fechaexport '+
            '    FROM hys.pee_enfermedadestablecimiento, '+
            '         art.sex_expedientes, '+
            '         hys.pmc_medidacorrectivaenf '+
            '   WHERE ee_idexpediente = ex_id '+
            '     AND ee_cuit = '+SqlValue(sdqConsulta.FieldByName('em_cuit').AsString)+
            '     AND ee_nroestablecimiento = '+SqlValue(sdqConsulta.FieldByName('es_nroestableci').AsString)+
            '     AND mc_idenfermedadestablecimiento = ee_id ';


    if sdqMedidasEnfermedades.Active then
    begin
      sdqMedidasEnfermedades.Close;
    end;

    if fraTrabajadorEnfermedades.IsSelected then
    begin
      sWhere := ' AND ee_idexpediente = '+ SqlValue(fraTrabajadorEnfermedades.IdSiniestro);
    end;
    sdqMedidasEnfermedades.SQL.Text := sSQL + sWhere + 'ORDER BY mc_medida ';
    sdqMedidasEnfermedades.Open;
    sdqMedidasEnfermedadesAfterScroll(nil);
  end;
end;

procedure tfrmcargaTareas.CargaAccidentes;
var
  sSQL : String;
  sWhere : String;
begin
  if tsAccidente.TabVisible then
  begin
    sWhere := '';
    sSQL := 'SELECT   ae_id, ae_cuit, ae_nroestablecimiento, '+
            '         ex_siniestro || ''/'' || ex_orden || ''/'' || ex_recaida siniestro, '+
            '         mc_id, mc_idaccidenteestablecimiento, mc_medida, mc_fechaejecucion, '+
            '         mc_fechaverificacion, mc_descripcion, mc_usualta usuario, mc_usubaja, '+
            '         mc_fechabaja, mc_fechaexport '+
            '    FROM hys.pmc_medidacorrectiva, '+
            '         hys.pae_accidenteestablecimiento, '+
            '         art.sex_expedientes '+
            '   WHERE ae_idexpediente = ex_id '+
            '     AND mc_idaccidenteestablecimiento = ae_id '+
            '     AND ae_fechabaja IS NULL '+
            '     AND ae_cuit = '+SqlValue(sdqConsulta.FieldByName('em_cuit').AsString)+
            '     AND ae_nroestablecimiento = '+SqlValue(sdqConsulta.FieldByName('es_nroestableci').AsString);
    if fraTrabajadorAccidente.IsSelected then
    begin
      sWhere := ' AND ae_idexpediente = '+ SqlValue(fraTrabajadorAccidente.IdSiniestro);
    end;

    if sdqMedidasAccidente.Active then
    begin
      sdqMedidasAccidente.Close;
    end;

    sdqMedidasAccidente.SQL.Text := sSQL + sWhere + ' ORDER BY mc_medida ';

    sdqMedidasAccidente.Open;
    sdqMedidasAccidenteAfterScroll(nil);
  end;
end;

procedure TfrmCargaTareas.HabilitarTercerizado(iCodigo : Integer);
begin
  if ExisteSql(' SELECT 1 ' +
               '  FROM art.pit_firmantes ' +
               ' WHERE it_tercerizado = 1  ' +
               '   AND it_id = '+SqlValue(iCodigo)) then
  begin
    VCLExtra.LockControls([fraPrevTercerizado],False or (sdqConsulta.FieldByName('vp_origen').AsString = 'A') or
       ((sdqConsulta.FieldByName('VP_APROBADO').AsString = 'S') and not Seguridad.Activar(btnAprobar)));
    fraPrevTercerizado.ExtraCondition := ' AND PC_IDPREVENTOR = '+SqlValue(iCodigo);
  end
  else
  begin
    fraPrevTercerizado.Clear;
    VCLExtra.LockControls([fraPrevTercerizado],True);
  end;
end;


end.
