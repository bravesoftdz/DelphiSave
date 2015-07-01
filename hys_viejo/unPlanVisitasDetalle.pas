unit unPlanVisitasDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodDesc, unArtDbFrame,
  unfraLocalidad, unfraLocalidadEx, PeriodoPicker, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, CustomDlgs, AnsiSql, CheckLst,
  VCLExtra, JvgGroupBox, JvExExtCtrls, JvNetscapeSplitter, JvExComCtrls,
  JvComCtrls, unSesion, unDmPrincipal, General, Mask, PatternEdit,
  ComboEditor, CheckCombo, unfraEstablecimientoDomic, unFraEmpresa,
  IntEdit, ToolEdit, DateTimeFuncs, unFraDomicilio, SqlFuncs, DateComboBox,
  unFraMultiSeleccion, unGrids, RxToolEdit, RxPlacemnt;

type
  TfrmPlanVisitasDetalle = class(TfrmCustomGridABM)
    pcFilter: TPageControl;
    tbGeneral: TTabSheet;
    Label2: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    chkSinPreventor: TCheckBox;
    tbAfiliaciones: TTabSheet;
    Label47: TLabel;
    fraLocalidad: TfraLocalidadEx;
    fraDepart: TfraCodDesc;
    sdqDetalleTareas: TSDQuery;
    dsDetalleTareas: TDataSource;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    gbDetalleTareas: TJvgGroupBox;
    dbgDetalleTareas: TArtDBGrid;
    chkExcluirBajas: TCheckBox;
    sdqConsultaSELECTED: TStringField;
    tbReasignarTareas: TToolButton;
    fpReasignarTareas: TFormPanel;
    Bevel4: TBevel;
    Label37: TLabel;
    btnAceptarCambioprev: TButton;
    fraCambioTareasPreventor: TfraCodigoDescripcion;
    btnCancel: TButton;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    fpMotivo: TFormPanel;
    Bevel1: TBevel;
    btnAceptarMotivo: TButton;
    btnCancelarMotivo: TButton;
    fraMotivo: TfraCodigoDescripcion;
    Label3: TLabel;
    tbNoRealizar: TToolButton;
    edMotivoLibre: TRichEdit;
    Panel1: TPanel;
    chkParcial: TCheckBox;
    chkTerminado: TCheckBox;
    chkPendiente: TCheckBox;
    cmbTipoEmpresaPrev: TCheckCombo;
    Label4: TLabel;
    cmbSector: TCheckCombo;
    Label5: TLabel;
    edFechaDesde: TDateEdit;
    Label7: TLabel;
    chkTareas: TCheckListBox;
    Label8: TLabel;
    Label10: TLabel;
    fraPreventor: TfraCodigoDescripcion;
    Label11: TLabel;
    edFechaHasta: TDateEdit;
    pcEmpresa: TPageControl;
    tbAfiliada: TTabSheet;
    tbNoAfiliada: TTabSheet;
    Label6: TLabel;
    fraEmpresa: TfraEmpresa;
    fraEstableci: TfraEstablecimientoDomic;
    fraDomicilio: TfraDomicilio;
    Label13: TLabel;
    mskCUIT: TMaskEdit;
    edRSocial: TEdit;
    lbRSocial: TLabel;
    edContacto: TEdit;
    Label14: TLabel;
    edTelefono: TEdit;
    Label15: TLabel;
    rgEmpresa: TRadioGroup;
    tbCP: TToolButton;
    cbVerPreventorSugerido: TCheckBox;
    cbAsignarEstabalPreventor: TCheckBox;
    Label16: TLabel;
    fraMotivoReasignarTareas: TfraCodigoDescripcion;
    edObservacionReasignarTareas: TRichEdit;
    Label17: TLabel;
    Label44: TLabel;
    edFechaAltaDesde: TDateComboBox;
    Label46: TLabel;
    edFechaAltaHasta: TDateComboBox;
    Label18: TLabel;
    Label19: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    edEstablecimiento: TPatternEdit;
    Label20: TLabel;
    edMotivoBaja: TRichEdit;
    Label21: TLabel;
    edFechaDesdeFiltro: TDateComboBox;
    Label22: TLabel;
    edFechaHastaFiltro: TDateComboBox;
    fraProceso: TfraCodigoDescripcion;
    Label12: TLabel;
    fraProcesoFiltro: TfraCodigoDescripcion;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaPS_IDEMPRESA: TFloatField;
    sdqConsultaPS_ESTABLECI: TFloatField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaPS_ID: TFloatField;
    sdqConsultaPS_TAREA: TStringField;
    sdqConsultaPS_FECHADESDE: TDateTimeField;
    sdqConsultaPS_FECHAHASTA: TDateTimeField;
    sdqConsultaPV_MES: TStringField;
    sdqConsultaCOORDINADOR: TStringField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaPS_IDPREVENTOR: TFloatField;
    sdqConsultaIT_FECHABAJA: TDateTimeField;
    sdqConsultaTIPOESTABSRT: TStringField;
    sdqConsultaESTADO: TStringField;
    sdqConsultaTIPOESTABPREV: TStringField;
    sdqConsultaTIPOEMPRESASRT: TStringField;
    sdqConsultaEMPLEADOS: TFloatField;
    sdqConsultaDC_TELEFONOS: TStringField;
    sdqConsultaDOMICILIO: TStringField;
    sdqConsultaDEPARTAMENTO: TStringField;
    sdqConsultaMOTIVOBAJA: TStringField;
    sdqConsultaPS_OBSERVACION: TStringField;
    sdqConsultaES_LOCALIDAD: TStringField;
    sdqConsultaES_CPOSTAL: TStringField;
    sdqConsultaES_CPOSTALA: TStringField;
    sdqConsultaES_PROVINCIA: TStringField;
    sdqConsultaPROV: TStringField;
    sdqConsultaPS_IDMOTIVOBAJA: TFloatField;
    sdqConsultaPS_FECHAALTA: TDateTimeField;
    sdqConsultaPS_USUALTA: TStringField;
    sdqConsultaPS_FECHAMODIF: TDateTimeField;
    sdqConsultaPS_USUMODIF: TStringField;
    sdqConsultaPS_FECHABAJA: TDateTimeField;
    sdqConsultaPS_USUBAJA: TStringField;
    sdqConsultaPS_ESTADO: TStringField;
    sdqConsultaPS_CALLE: TStringField;
    sdqConsultaPS_NUMERO: TStringField;
    sdqConsultaPS_PISO: TStringField;
    sdqConsultaPS_DEPARTAMENTO: TStringField;
    sdqConsultaPS_LOCALIDAD: TStringField;
    sdqConsultaPS_CONTACTO: TStringField;
    sdqConsultaEP_ID: TFloatField;
    sdqConsultaMR_DESCRIPCION: TStringField;
    sdqConsultaPS_OBSERVACIONES: TStringField;
    sdqConsultaEMPRESAVIP: TStringField;
    sdqConsultaFRECUENCIAPERSONALIZADA: TFloatField;
    sdqConsultaPV_ID: TFloatField;
    sdqConsultaPV_FECHAINICIAL: TDateTimeField;
    sdqConsultaPV_FECHAFINAL: TDateTimeField;
    sdqConsultaPS_VISITAEMERGENTE: TStringField;
    sdqConsultaPREVSUGERIDO: TStringField;
    sdqConsultaPS_VISITAOTROPERIODO: TStringField;
    sdqConsultaTIPOVISITA: TStringField;
    chkPrioritarias: TCheckBox;
    chkCompensatorias: TCheckBox;
    chkNoProgramadas: TCheckBox;
    chkEmergentes: TCheckBox;
    chkCompensatoriasManual: TCheckBox;
    chkCompensatoriasOtroPeriodo: TCheckBox;
    tbAsignacionManual: TToolButton;
    sdqConsultaPS_TIPOVISITA: TFloatField;
    chkProgramadaOtroAnio: TCheckBox;
    ShortCutControl1: TShortCutControl;
    chkPrioritariasOtroPeriodo: TCheckBox;
    chkEmergentesOtroPeriodo: TCheckBox;
    tbSumatoria: TToolButton;
    sdqConsultaEP_FECHAULTVISITA: TDateTimeField;
    sdqConsultaPREVULTVIS: TStringField;
    lbAct: TLabel;
    edActividadVieja: TIntEdit;
    sdqConsultaAC_RELACION: TStringField;
    Label23: TLabel;
    edActividadActual: TIntEdit;
    sdqConsultaAC_CODIGO: TStringField;
    sdqConsultaAC_DESCRIPCION: TStringField;
    chkTerminadoUCAP: TCheckBox;
    tbTareas: TTabSheet;
    Label24: TLabel;
    cmbTareasSegunTipoEmpresa: TCheckCombo;
    fraTareasSeleccion: TfraMultiSeleccion;
    sdqConsultaPREVENTORANTERIOR: TStringField;
    cbVerPreventorAnterior: TCheckBox;
    sdqConsultaTIPOPREVEMPRESA: TStringField;
    sdqConsultaVALIDO463: TStringField;
    sdqConsultaPS_INFORMADOCUATRIMESTRE: TStringField;
    chkIncluidoRes771: TCheckBox;
    chkNoIncluidoRes771: TCheckBox;
    Label56: TLabel;
    edFDesdeVigenciaPrevProvisorio: TDateComboBox;
    edFHastaVigenciaPrevProvisorio: TDateComboBox;
    Label57: TLabel;
    Label58: TLabel;
    cbAsignarPreventorProvisorio: TCheckBox;
    chkNoVisitados: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure fraDepartcmbDescripcionChange(Sender: TObject);
    procedure fraDepartcmbDescripcionExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbDetalleTareasExpanded(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure gbDetalleTareasCollapsed(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FSFormDestroy(Sender: TObject);
    procedure sdqConsultaSELECTEDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GridCellClick(Column: TColumn);
    procedure btnAceptarCambioprevClick(Sender: TObject);
    procedure tbReasignarTareasClick(Sender: TObject);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbNoRealizarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarMotivoClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure dbgDetalleTareasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pcEmpresaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbCPClick(Sender: TObject);
    procedure tbAsignacionManualClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure cbVerPreventorAnteriorClick(Sender: TObject);
    procedure chkProgramadaOtroAnioClick(Sender: TObject);
  private
    FfraColorDefault: TColor;
    FContrato: Integer;
    FEstablecimiento: String;
    FPreventorId: integer;
    FIdProceso: Integer;
    SelectedList: TBookMarkLst;
    FVerPendientes: boolean;
    FVerParciales: boolean;
    FVerTerminados: boolean;
    FFechaAltaDesde: TDatetime;
    FFechaAltaHasta: TDatetime;
    FCompensatorias: boolean;
    FEmergentesOtroPeriodo: boolean;
    FEmergentes: boolean;
    FPrioritarias: boolean;
    FNoProgramadas: boolean;
    FPrioritariasOtroPeriodo: boolean;
    FCompensatoriasManual: boolean;
    FCompensatoriasOtroPeriodo: boolean;
    FProgramadasOtroAnio: boolean;
    FFechaDesde: TDatetime;
    FFechaHasta: TDatetime;
    FVerTerminadosUcap: boolean;
    procedure OnEmpresaChange(Sender: TObject);
    procedure SetPreventorId(const Value: integer);
    procedure SetIdProceso(const Value: Integer);
    procedure CargarDetalle;
    procedure DesmarcarItems;
    procedure CargarTareas; overload;
    procedure CargarTareas(aIdPlan: integer); overload;
//    procedure AgregarTareasNoAfiliada(aIdPlan: integer);
    procedure SetVerPendientes(const Value: boolean);
    procedure SetVerParciales(const Value: boolean);
    procedure SetVerTerminados(const Value: boolean);
    procedure SetFechaAltaDesde(const Value: TDatetime);
    procedure SetFechaAltaHasta(const Value: TDatetime);
    procedure SetContrato(const Value: Integer);
    procedure SetEstablecimiento(const Value: String);
    procedure SetCompensatorias(const Value: boolean);
    procedure SetEmergentes(const Value: boolean);
    procedure SetEmergentesOtroPeriodo(const Value: boolean);
    procedure SetNoProgramadas(const Value: boolean);
    procedure SetPrioritarias(const Value: boolean);
    procedure SetPrioritariasOtroPeriodo(const Value: boolean);
    procedure SetCompensatoriasManual(const Value: boolean);
    procedure SetCompensatoriasOtroPeriodo(const Value: boolean);
    procedure SetProgramadasOtroAnio(const Value: boolean);
    procedure SetFechaDesde(const Value: TDatetime);
    procedure SetFechaHasta(const Value: TDatetime);
    procedure SetVerTerminadosUcap(const Value: boolean);
    function GetWhereTareaTipoEmpresa: String;
    procedure SetModo(bModoConsulta: boolean);
  public
    property PreventorId: integer read FPreventorId write SetPreventorId;
    property IdProceso: Integer read FIdProceso write SetIdProceso;
    property Prioritarias: boolean read FPrioritarias write SetPrioritarias;
    property Compensatorias: boolean read FCompensatorias write SetCompensatorias;
    property CompensatoriasManual: boolean read FCompensatoriasManual write SetCompensatoriasManual;
    property CompensatoriasOtroPeriodo: boolean read FCompensatoriasOtroPeriodo write SetCompensatoriasOtroPeriodo;
    property NoProgramadas: boolean read FNoProgramadas write SetNoProgramadas;
    property ProgramadasOtroAnio: boolean read FProgramadasOtroAnio write SetProgramadasOtroAnio;
    property Emergentes: boolean read FEmergentes write SetEmergentes;
    property PrioritariasOtroPeriodo: boolean read FPrioritariasOtroPeriodo write SetPrioritariasOtroPeriodo;
    property EmergentesOtroPeriodo: boolean read FEmergentesOtroPeriodo write SetEmergentesOtroPeriodo;

    property VerPendientes: boolean read FVerPendientes write SetVerPendientes;
    property VerParciales: boolean read FVerParciales write SetVerParciales;
    property VerTerminados: boolean read FVerTerminados write SetVerTerminados;
    property VerTerminadasUcap: boolean read FVerTerminadosUcap write SetVerTerminadosUcap;
    property FechaAltaDesde: TDatetime read FFechaAltaDesde write SetFechaAltaDesde;
    property FechaAltaHasta: TDatetime read FFechaAltaHasta write SetFechaAltaHasta;
    property FechaDesde: TDatetime read FFechaDesde write SetFechaDesde;
    property FechaHasta: TDatetime read FFechaHasta write SetFechaHasta;
    property Contrato : Integer read FContrato write SetContrato;
    property Establecimiento : String read FEstablecimiento write SetEstablecimiento;
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmPlanVisitasDetalle: TfrmPlanVisitasDetalle;

implementation

uses unCustomConsulta, CUIT, unReasignacionCP, unPrincipal;

{$R *.dfm}

procedure TfrmPlanVisitasDetalle.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hps_planhys';
  FieldBaja :=  'ps_fechabaja';

  fraEmpresaFiltro.ShowBajas := true;

  fraEmpresa.OnChange := OnEmpresaChange;
  fraEmpresa.ShowBajas := True;

  fraEstableci.ShowBajas := True;

  SelectedList := TBookMarkLst.Create;
  ShowActived := false;
  pcFilter.ActivePageIndex := 0;
  VCLExtra.LockControls([chkNoVisitados], true);

  with GetQuery('SELECT * FROM art.ctb_tablas WHERE tb_clave = ''SECT'' and tb_codigo <> 0') do
  try
    while not Eof do
    begin
      cmbSector.Items.AddObject(fieldbyname('TB_DESCRIPCION').AsString, TObject(fieldbyname('TB_CODIGO').AsInteger));
//      if fieldbyname('TB_CODIGO').AsInteger <> 1 then
//        cmbSector.Checked[fieldbyname('TB_CODIGO').AsInteger-1] := True;
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV') do
  try
    while not Eof do
    begin
      cmbTipoEmpresaPrev.Items.AddObject(fieldbyname('TE_CODIGO').AsString, TObject(fieldbyname('TE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV') do
  try
    while not Eof do
    begin
      cmbTareasSegunTipoEmpresa.Items.AddObject(fieldbyname('TE_CODIGO').AsString, TObject(fieldbyname('TE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with fraCambioTareasPreventor do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraMotivoReasignarTareas do
  begin
    TableName := 'HYS.HMR_MOTIVOREASIGNACIONTAREA';
    FieldDesc := 'MR_DESCRIPCION';
    FieldID := 'MR_ID';
    FieldCodigo := 'MR_ID';
    FieldBaja := 'MR_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraPreventor do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraCoordinadorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ExtraCondition := ' AND IT_IDROLPREVENTOR >= 5 '; 
    ShowBajas := true;
  end;

  with fraProceso do
  begin
    TableName := 'HYS.HPV_PROCESOVISITA';
    FieldDesc := 'PV_MES';
    FieldID := 'PV_ID';
    FieldCodigo := 'PV_ID';
    ExtraCondition := ' AND PV_TIPOPROCESO = ''M''';
    ExtraFields := ', PV_FECHAINICIAL, PV_FECHAFINAL ';
    CaseSensitive := false;
    OrderBy := 'PV_FECHAINICIAL, PV_FECHAFINAL';
  end;

  with fraProcesoFiltro do
  begin
    TableName := 'HYS.HPV_PROCESOVISITA';
    FieldDesc := 'NVL(PV_MES, PV_ANIO || '' - '' || PV_CUATRIMESTRE)';
    FieldID := 'PV_ID';
    FieldCodigo := 'PV_ID';
    ExtraCondition := ' AND PV_TIPOPROCESO <> ''T''';
    ExtraFields := ', PV_FECHAINICIAL, PV_FECHAFINAL ';
    CaseSensitive := false;
    OrderBy := 'PV_FECHAINICIAL, PV_FECHAFINAL';
  end;

  fraProcesoFiltro.Value := ValorSqlInteger('SELECT art.hys_plan.get_idproceso(''M'', trunc(sysdate, ''MM''), last_day(trunc(sysdate, ''MM''))) FROM dual');

  with fraMotivo do
  begin
    TableName := 'HYS.HMV_MOTIVOBAJAVISITA';
    FieldDesc := 'MV_DESCRIPCION';
    FieldID := 'MV_ID';
    FieldCodigo := 'MV_ID';
    FieldBaja := 'MV_FECHABAJA';
    ExtraCondition := ' AND MV_TIPO = ''M''';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  fraLocalidad.FieldCPostal := 'ES_CPOSTAL';
  fraLocalidad.FieldLocalidad := 'ES_LOCALIDAD';
  fraLocalidad.FieldProvincia := 'ES_PROVINCIA';

  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;
  end;

  with fraTareasSeleccion do
  begin
    TableName := 'HYS.HTA_TAREA';
    FieldDesc := 'TA_DESCRIPCION';
    FieldID := 'TA_ID';
    FieldBaja := 'TA_FECHABAJA';
    ShowBajas := false;
    ShowFilterPanel := true;
    Caption := '  Filtro por tareas';
    Refresh;
  end;

  CargarTareas;

  FfraColorDefault := fraPreventorFiltro.Color;

  tbNoRealizar.Left := tbLimpiar.Left - 1;
  tbSeleccionarTodo.Left := tbLimpiar.Left - 1;
  tbDesSeleccionarTodo.Left := tbLimpiar.Left - 1;
  tbReasignarTareas.Left := tbLimpiar.Left - 1;
  tbCP.Left := tbLimpiar.Left - 1;
  tbSalir.Left := tbSalir.Left + 170;
end;

procedure TfrmPlanVisitasDetalle.fraDepartcmbDescripcionChange(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmPlanVisitasDetalle.fraDepartcmbDescripcionExit(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmPlanVisitasDetalle.tbLimpiarClick(Sender: TObject);
begin
  cbVerPreventorAnterior.Checked := false;
  if fraProcesoFiltro.Value <> 99 then
    fraProcesoFiltro.Value := ValorSqlInteger('SELECT art.hys_plan.get_idproceso(''M'', trunc(sysdate, ''MM''), last_day(trunc(sysdate, ''MM''))) FROM dual');
  chkSinPreventor.Checked := false;
  chkExcluirBajas.Checked := False;
  cbVerPreventorSugerido.Checked := False;
  cbVerPreventorAnterior.Checked := False;
  cmbTipoEmpresaPrev.Clear;
  chkIncluidoRes771.Checked := False;
  chkNoIncluidoRes771.Checked := False;
  edFechaDesdeFiltro.Clear;
  edFechaHastaFiltro.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;

  chkPrioritarias.Checked              := False;
  chkCompensatorias.Checked            := False;
  chkCompensatoriasOtroPeriodo.Checked := False;
  chkCompensatoriasManual.Checked      := False;
  chkEmergentes.Checked                := False;
  chkNoProgramadas.Checked             := False;
  chkPrioritariasOtroPeriodo.Checked   := False;
  chkEmergentesOtroPeriodo.Checked     := False;
  chkProgramadaOtroAnio.Checked        := False;
  chkNoVisitados.Checked               := False;

  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  fraLocalidad.Clear;
  fraDepart.Clear;
  FPreventorId := 0;
  edEstablecimiento.Clear;
  fraEmpresaFiltro.Clear;
  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;
  end;
  inherited;
end;


procedure TfrmPlanVisitasDetalle.RefreshData;
var
  sSqlAfi: String;
  sSqlNoAfi: String;
  sSelectSug: String;
// sFromSug,  sWhereSug : String;

  sWhereAfi: String;
  sWhereNoAfi: String;

  sIn: String;
  i : Integer;
  sEstado: String;
  sTipos: String;
  idprocesoant: integer;
begin
  sSqlAfi := '';
  sWhereAfi := '';
  sTipos := '';

  idprocesoant := 0;

  if cbVerPreventorSugerido.Checked then
  begin
    sSelectSug := sSelectSug +
     ' ,(SELECT pit3.it_nombre FROM art.pit_firmantes pit3 '+
       ' WHERE pit3.it_id = art.hys.get_preventor_sugerido(es_cpostal, es_provincia, ep_idtipoestabprev, '+
     '         ep_actividad, em_sector, es_idactividad, NVL(co_totempleadosactual, co_totempleados))) as prevsugerido ';

    Grid.ColumnByField['prevsugerido'].Visible := true;
  end
  else begin
    Grid.ColumnByField['prevsugerido'].Visible := false;
    sSelectSug := sSelectSug + ', null prevsugerido  ' ;
  end;

  if cbVerPreventorAnterior.Checked then
  begin
    idprocesoant := ValorSqlIntegerEx('SELECT art.hys_plan.get_idproceso(''M'', TRUNC(ADD_MONTHS(:fechaini, -1), ''MM''), LAST_DAY(TRUNC(ADD_MONTHS(:fechafin, -1), ''MM''))) FROM DUAL',
                    [TDateTimeEx.Create(fraProcesoFiltro.sdqDatos.FieldByName('pv_fechainicial').AsDateTime),TDateTimeEx.Create(fraProcesoFiltro.sdqDatos.FieldByName('pv_fechainicial').AsDateTime)]);

    sSelectSug := sSelectSug +
            '        ,(SELECT CAST(WM_CONCAT(DISTINCT prevant.it_nombre) AS VARCHAR2(1000)) ' +
            '         FROM art.pit_firmantes prevant, hys.hps_planhys planant ' +
            '         WHERE planant.ps_idpreventor = prevant.it_id ' +
            '         AND planant.ps_idempresa = hps.ps_idempresa ' +
            '         AND planant.ps_estableci = hps.ps_estableci ' +
            '         AND planant.ps_fechabaja IS NULL ' +
            '         AND planant.ps_idproceso = ' + SqlValue(idprocesoant) + ') preventoranterior';

    Grid.ColumnByField['preventoranterior'].Visible := true;
  end
  else begin
    Grid.ColumnByField['preventoranterior'].Visible := false;
    sSelectSug := sSelectSug + ', null preventoranterior  ' ;
  end;


  if (rgEmpresa.ItemIndex = 0) or (rgEmpresa.ItemIndex = 1) then
    sSqlAfi := ' SELECT em_cuit, em_nombre, co_contrato, ps_idempresa, ps_estableci, es_nombre, ps_id, ps_tarea, ' +
            '        ps_fechadesde, ps_fechahasta, nvl(pv_mes, pv_anio || '' - '' || pv_cuatrimestre) pv_mes, pv_id, pv_fechainicial, pv_fechafinal, ' +
            '        art.hys.get_nombre_preventor_coord(pit.it_codigo) coordinador, pit.it_nombre, ps_idpreventor, pit.it_fechabaja, ' +
            '        ep_tipo tipoestabsrt, DECODE(ps_estado,''N'',''PENDIENTE'',''P'',''PARCIAL'',''T'',''TERMINADO'') estado, ' +
            '        tipoestab.te_codigo tipoestabprev, tipoemp.te_codigo tipoprevempresa, ps_tipovisita, tv_descripcion || decode(ps_visitaemergente, ''S'', '' - Emergente'', '''') || decode(ps_visitaotroperiodo, ''S'', '' - Otro Período'', '''') tipovisita, ' +
            '        art.hys.get_tipo_empresa(em_cuit, NULL, SYSDATE) tipoempresasrt, ' +
            '        NVL(co_totempleadosactual, co_totempleados) empleados, dc_telefonos, ' +
            '        art.afi.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, es_localidad) ' +
            '        || NVL2(es_telefonos, '' Tel.'' ||(NVL(es_codareatelefonos, '''') || es_telefonos), '''') domicilio, ' +
            '        art.utiles.get_partido(es_cpostal, es_provincia) departamento, ' +
            '        mv_descripcion motivobaja, ps_observacion, cac.ac_codigo, cac.ac_descripcion, art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision) ac_relacion, ' +
            '        es_localidad, es_cpostal, es_cpostala, es_provincia, art.getdescripcionprovincia(es_provincia) prov, ps_idmotivobaja, ' +
            '        ps_fechaalta, ps_usualta, ps_fechamodif, ps_usumodif, ps_fechabaja, ps_usubaja, ps_estado, ep_fechaultvisita, prevultvisita.it_nombre prevultvis, ' +
            '        ps_calle, ps_numero, ps_piso, ps_departamento, ps_localidad, ps_contacto, ep_id, mr_descripcion, ps_observaciones, '+
            '        DECODE(art.afiliacion.is_empresavip(co_contrato), ''S'', ''VIP'', ''N'', NULL) empresavip, ' +
            '        art.hys.get_frecuenciapersonalizada(ps_idempresa, ps_estableci) frecuenciapersonalizada, ps_visitaemergente, ps_visitaotroperiodo, ' +
            '        art.hys.get_validorelev463(co_contrato, ps_estableci) valido463, ps_informadocuatrimestre '+
            sSelectSug +
            '   FROM hys.hmv_motivobajavisita, afi.adc_domiciliocontrato, comunes.cac_actividad cac, hys.hte_tipoempresaprev tipoestab, hys.hte_tipoempresaprev tipoemp, '+
            '        hys.hco_cuitoperativo hco, art.pit_firmantes prevultvisita, hys.hep_estabporpreventor, afi.aes_establecimiento, afi.aco_contrato aco, ' +
            '        afi.aem_empresa, art.pit_firmantes pit, hys.hmr_motivoreasignaciontarea, hys.htv_tipovisita, hys.hpv_procesovisita hpv, hys.hps_planhys hps ' +
            '  WHERE em_id = ps_idempresa(+) ' +
            '    AND aco.co_idempresa = em_id ' +
            '    AND es_contrato = co_contrato ' +
            '    AND es_nroestableci(+) = ps_estableci ' +
            '    AND co_contrato = art.get_vultcontrato(em_cuit) ' +
            '    AND ep_idempresa = em_id ' +
            '    AND ep_estableci = es_nroestableci ' +
            '    AND cac.ac_id = es_idactividad ' +
            '    AND ps_idproceso = pv_id ' +
            '    AND prevultvisita.it_id(+) = ep_preventorultvisita ' +
            '    AND tv_id = ps_tipovisita ' +
            '    AND ep_idtipoestabprev = tipoestab.te_id ' +
            '    AND co_idtipoempresaprev = tipoemp.te_id(+) '+
            '    AND hco.co_id(+) = ep_idcooperativo '+
            '    AND mv_id(+) = ps_idmotivobaja ' +
            '    AND dc_contrato(+) = co_contrato '+
            '    AND ps_idmotivoreasignacion = mr_id(+) '+
            '    AND dc_tipo(+) = ''L'' ';

  sSqlNoAfi := '';
  sWhereNoAfi := '';
  if (rgEmpresa.ItemIndex = 0) or (rgEmpresa.ItemIndex = 2) then
    sSqlNoAfi := ' SELECT  ps_cuit em_cuit, ps_razonsocial em_nombre, to_number(NULL) co_contrato, ps_idempresa, ps_estableci, ''EMPRESA NO AFILIADA'' es_nombre, ps_id, ' +
                 '         ps_tarea, ps_fechadesde, ps_fechahasta, nvl(pv_mes, pv_anio || '' - '' || pv_cuatrimestre) pv_mes, pv_id, pv_fechainicial, pv_fechafinal, art.hys.get_nombre_preventor_coord(it_codigo) coordinador, ' +
                 '         it_nombre, ps_idpreventor, it_fechabaja, NULL tipoestabsrt, ' +
                 '         DECODE(ps_estado, ''N'', ''PENDIENTE'', ''P'', ''PARCIAL'', ''T'', ''TERMINADO'') estado, NULL tipoestabprev, NULL tipoprevempresa, ' +
                 '         ps_tipovisita, tv_descripcion || decode(ps_visitaemergente, ''S'', '' - Emergente'', '''') || decode(ps_visitaotroperiodo, ''S'', '' - Otro Período'', '''') tipovisita, NULL tipoempresasrt, to_number(NULL) empleados, ' +
                 '         ps_telefono dc_telefonos, art.afi.armar_domicilio(ps_calle, ps_numero, ps_piso, ps_departamento, ps_localidad) ' +
                 '         || NVL2(ps_telefono, '' Tel. '' || ps_telefono, '''') domicilio, ' +
                 '         art.utiles.get_partido(ps_cpostal, ps_provincia) departamento, mv_descripcion motivobaja, ps_observacion, ' +
                 '         NULL ac_codigo, NULL ac_descripcion,  NULL ac_relacion, ps_localidad es_localidad, ' +
                 '         ps_cpostal es_cpostal, ps_cpostala es_cpostala, ps_provincia es_provincia, art.getdescripcionprovincia(ps_provincia) prov, ps_idmotivobaja, ps_fechaalta, ' +
                 '         ps_usualta, ps_fechamodif, ps_usumodif, ps_fechabaja, ps_usubaja, ps_estado, null ep_fechaultvisita, null prevultvis, ' +
                 '         ps_calle, ps_numero, ps_piso, ps_departamento, ps_localidad, ps_contacto, TO_NUMBER(NULL) ep_id, mr_descripcion, ps_observaciones, ' +
                 '         NULL empresavip, art.hys.get_frecuenciapersonalizada(ps_idempresa, ps_estableci) frecuenciapersonalizada, ps_visitaemergente, ' +
                 '         ps_visitaotroperiodo, null prevsugerido, null preventoranterior, null valido463, ps_informadocuatrimestre ' +
                 '    FROM hys.hmv_motivobajavisita, art.pit_firmantes, hys.hmr_motivoreasignaciontarea, hys.htv_tipovisita, hys.hpv_procesovisita, hys.hps_planhys ' +
                 '   WHERE mv_id(+) = ps_idmotivobaja ' +
                 '     AND ps_idmotivoreasignacion = mr_id(+) '+
                 '     AND ps_idproceso = pv_id ' +
                 '     AND tv_id = ps_tipovisita ' +
                 '     AND ps_idempresa IS NULL ';

  sEstado := '';
  if chkPendiente.Checked then
    sEstado := SqlValue('N');

  if chkParcial.Checked then
    sEstado := sEstado + iif(sEstado<> '', ',', '') + SqlValue('P');

  if chkTerminado.Checked then
    sEstado := sEstado + iif(sEstado<> '', ',', '') + SqlValue('T');

  if chkTerminadoUCAP.Checked then
  begin
    sWhereAfi := sWhereAfi + ' AND NOT EXISTS (SELECT 1 FROM hys.hts_tareahys WHERE ts_idplan = ps_id AND ts_fechabaja IS NULL AND ts_finalizada = ''N'')';
    sWhereNoAfi := sWhereNoAfi + ' AND NOT EXISTS (SELECT 1 FROM hys.hts_tareahys WHERE ts_idplan = ps_id AND ts_fechabaja IS NULL AND ts_finalizada = ''N'')';
  end;

  if chkIncluidoRes771.Checked then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_informadocuatrimestre = ''S''';
    sWhereNoAfi := sWhereNoAfi + ' AND ps_informadocuatrimestre = ''S''';
  end;

  if chkNoIncluidoRes771.Checked then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_informadocuatrimestre = ''N''';
    sWhereNoAfi := sWhereNoAfi + ' AND ps_informadocuatrimestre = ''N''';
  end;

  if fraEmpresaFiltro.IsSelected then
  begin
    sWhereAfi := sWhereAfi + ' AND co_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
    sWhereNoAfi := sWhereNoAfi + ' AND ps_cuit = '+SqlValue(fraEmpresaFiltro.CUIT);
  end;

  if edEstablecimiento.Text <> '' then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_estableci IN  ('+edEstablecimiento.Text+')';
    sWhereNoAfi := sWhereNoAfi + ' AND ps_estableci IN  ('+edEstablecimiento.Text+')';
  end;

  if (sEstado <> '') then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_estado IN (' + sEstado + ') ';
    sWhereNoAfi := sWhereNoAfi + ' AND ps_estado IN (' + sEstado + ') ';
  end;

  if chkExcluirBajas.Checked then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_fechabaja IS NULL ';
    sWhereNoAfi := sWhereNoAfi + ' AND ps_fechabaja IS NULL ';
  end;

  if edFechaDesdeFiltro.Date <> 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_fechahasta >= '+SqlDate(edFechaDesdeFiltro.Date);
    sWhereNoAfi := sWhereNoAfi + ' AND ps_fechahasta >= '+SqlDate(edFechaDesdeFiltro.Date);
  end;

  if edFechaHastaFiltro.Date <> 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_fechahasta <= '+SqlDate(edFechaHastaFiltro.Date);
    sWhereNoAfi := sWhereNoAfi + ' AND ps_fechahasta <= '+SqlDate(edFechaHastaFiltro.Date);
  end;

  if not edActividadVieja.IsEmpty then
    sWhereAfi := sWhereAfi + ' AND substr(art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision), 1,' + inttostr(length(edActividadVieja.Text)) + ') = ' + SqlValue(edActividadVieja.Text);

  if not edActividadActual.IsEmpty then
    sWhereAfi := sWhereAfi + ' AND substr(cac.ac_codigo, 1,' + inttostr(length(edActividadActual.Text)) + ') = ' + SqlValue(edActividadActual.Text);

  sIn := '';
  if cmbTipoEmpresaPrev.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbTipoEmpresaPrev.Items.Count-1 do
      if cmbTipoEmpresaPrev.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(cmbTipoEmpresaPrev.Items.Strings[i]);
      end;
  end;

  if (sIn <> '') then
    sWhereAfi := sWhereAfi + ' and tipoemp.te_codigo in (' + sIn  + ')';

  sIn := '';
  if cmbSector.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbSector.Items.Count-1 do
      if cmbSector.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(integer(cmbSector.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sWhereAfi := sWhereAfi + '   AND em_sector + 0 in (' + sIn  + ')';

  if chkSinPreventor.Checked then
  begin
    sWhereAfi := sWhereAfi + ' AND pit.it_id(+) = ps_idpreventor ';
//                   ' AND pit.it_fechabaja(+) IS NULL ';

    sWhereNoAfi := sWhereNoAfi + ' AND it_id(+) = ps_idpreventor ';
//                   ' AND it_fechabaja(+) IS NULL ';

    if FPreventorId < 0 then
    begin
      sWhereAfi := sWhereAfi + ' AND pit.it_id IS NULL  ';
      sWhereNoAfi := sWhereNoAfi + ' AND it_id IS NULL  ';
    end;
  end
  else begin
    sWhereAfi := sWhereAfi + '  AND pit.it_id = ps_idpreventor ' +
                   '  AND pit.it_fechabaja IS NULL ';

    sWhereNoAfi := sWhereNoAfi + '  AND it_id = ps_idpreventor ' +
                   '  AND it_fechabaja IS NULL ';
  end;


  if FIdProceso = 99 then
  begin
    sWhereAfi := sWhereAfi + ' AND pv_id IN (99, art.hys_plan.get_idproceso(''M'', trunc(sysdate, ''MM''), last_day(trunc(sysdate, ''MM''))) )';
    sWhereNoAfi := sWhereNoAfi + ' AND pv_id IN (99, art.hys_plan.get_idproceso(''M'', trunc(sysdate, ''MM''), last_day(trunc(sysdate, ''MM''))) )';
  end
  else begin
    sWhereAfi := sWhereAfi + ' AND pv_id = ' + SqlValue(fraProcesoFiltro.Value);
    sWhereNoAfi := sWhereNoAfi + ' AND pv_id = ' + SqlValue(fraProcesoFiltro.Value);
  end;

  if fraPreventorFiltro.IsSelected and (fraPreventorFiltro.Color = FfraColorDefault) then
  begin
    if chkSinPreventor.Checked  then
    begin
      sWhereAfi := sWhereAfi + ' AND (pit.it_id = ' + SqlValue(fraPreventorFiltro.Value) + ' OR pit.it_id IS NULL) ';
      sWhereNoAfi := sWhereNoAfi + ' AND (it_id = ' + SqlValue(fraPreventorFiltro.Value) + ' OR it_id IS NULL) ';
    end
    else begin
      sWhereAfi := sWhereAfi + ' AND pit.it_id = ' + SqlValue(fraPreventorFiltro.Value);
      sWhereNoAfi := sWhereNoAfi + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value);
    end;
  end;

  if fraPreventorFiltro.IsSelected and (fraPreventorFiltro.Color <> FfraColorDefault) then
  begin
    sWhereAfi := sWhereAfi + ' AND EXISTS (SELECT 1 ' +
                             '              FROM hys.hps_planhys planant ' +
                             '             WHERE planant.ps_idempresa = hps.ps_idempresa ' +
                             '              AND planant.ps_estableci = hps.ps_estableci ' +
                             '              AND planant.ps_fechabaja IS NULL ' +
                             '              AND planant.ps_idproceso = ' + SqlValue(idprocesoant) +
                             '              AND planant.ps_idpreventor = ' + SqlValue(fraPreventorFiltro.Value) + ') ';
  end;

  if chkPrioritarias.Checked then
    sTipos := sTipos + '(ps_tipovisita = 1 AND ps_visitaotroperiodo = ''N'' AND ps_visitaemergente = ''N'' )';

  if chkCompensatorias.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 2 AND ps_visitaotroperiodo = ''N'')';
  end;

  if chkCompensatoriasOtroPeriodo.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 2 AND ps_visitaotroperiodo = ''S'')';
  end;

  if chkCompensatoriasManual.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 4)';
  end;

  if chkNoProgramadas.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 3)';
  end;

  if chkProgramadaOtroAnio.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 5)';
  end;

  if chkEmergentes.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 1 AND ps_visitaemergente = ''S'' AND ps_visitaotroperiodo = ''N'')';
  end;

  if chkPrioritariasOtroPeriodo.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + '(ps_tipovisita = 1 AND ps_visitaotroperiodo = ''S'' AND ps_visitaemergente = ''N'' )';
  end;

  if chkEmergentesOtroPeriodo.Checked then
  begin
    if sTipos <> '' then
      sTipos := sTipos + ' OR ';
    sTipos := sTipos + ' (ps_tipovisita = 1 AND ps_visitaemergente = ''S'' AND ps_visitaotroperiodo = ''S'')';
  end;

  if sTipos <> '' then
  begin
    sWhereAfi := sWhereAfi + ' AND (' + sTipos + ')';
    sWhereNoAfi := sWhereNoAfi + ' AND (' +  sTipos + ')';
  end;

  if fraCoordinadorFiltro.IsSelected then
  begin
    if chkSinPreventor.Checked  then
    begin
      sWhereAfi := sWhereAfi + ' AND (pit.it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value) + ' OR pit.it_id IS NULL) ';
      sWhereNoAfi := sWhereNoAfi + ' AND (it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value) + ' OR it_id IS NULL) ';
    end
    else begin
      sWhereAfi := sWhereAfi + ' AND pit.it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);
      sWhereNoAfi := sWhereNoAfi + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);
    end;
  end;

  if fraLocalidad.IsSelected then
    sWhereAfi := sWhereAfi + fraLocalidad.GetWhere;

  if fraDepart.IsSelected then
  begin
    sWhereAfi := sWhereAfi + ' AND art.utiles.get_partido(es_cpostal, es_provincia) = ' + SqlValue(fraDepart.cmbDescripcion.Text);
    sWhereNoAfi := sWhereNoAfi + ' AND art.utiles.get_partido(ps_cpostal, ps_provincia) = ' + SqlValue(fraDepart.cmbDescripcion.Text);
  end;

  if edFechaAltaDesde.Date > 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND trunc(ps_fechaalta) >= ' + SqlValue(edFechaAltaDesde.Date);
    sWhereNoAfi := sWhereNoAfi + ' AND trunc(ps_fechaalta) >= ' + SqlValue(edFechaAltaDesde.Date);
  end;

  if edFechaAltaHasta.Date > 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND trunc(ps_fechaalta) <= ' + SqlValue(edFechaAltaHasta.Date);
    sWhereNoAfi := sWhereNoAfi + ' AND trunc(ps_fechaalta) <= ' + SqlValue(edFechaAltaHasta.Date);
  end;

  if edFechaDesdeFiltro.Date > 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_fechadesde >= ' + SqlValue(edFechaDesdeFiltro.Date);
    sWhereNoAfi := sWhereNoAfi + ' AND ps_fechadesde >= ' + SqlValue(edFechaDesdeFiltro.Date);
  end;

  if edFechaHastaFiltro.Date > 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND ps_fechahasta <= ' + SqlValue(edFechaHastaFiltro.Date);
    sWhereNoAfi := sWhereNoAfi + ' AND ps_fechahasta <= ' + SqlValue(edFechaHastaFiltro.Date);
  end;

  if fraTareasSeleccion.CheckCount > 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND EXISTS (SELECT 1 FROM hys.hts_tareahys WHERE ts_idplan = ps_id AND ts_fechabaja IS NULL ' + fraTareasSeleccion.InSQL_IntegerValues('ts_idtarea', false) +  ')';
    sWhereNoAfi := sWhereNoAfi + ' AND EXISTS (SELECT 1 FROM hys.hts_tareahys WHERE ts_idplan = ps_id AND ts_fechabaja IS NULL ' + fraTareasSeleccion.InSQL_IntegerValues('ts_idtarea', false) +  ')';
  end;

  if cmbTareasSegunTipoEmpresa.CheckedCount > 0 then
  begin
    sWhereAfi := sWhereAfi + ' AND EXISTS (SELECT 1 FROM hys.hta_tarea, hys.hts_tareahys WHERE ts_idplan = ps_id AND ta_id = ts_idtarea AND ts_fechabaja IS NULL AND ta_complementaria = ''N''' + GetWhereTareaTipoEmpresa +  ')';
    sWhereNoAfi := sWhereNoAfi + ' AND EXISTS (SELECT 1 FROM hys.hta_tarea, hys.hts_tareahys WHERE ts_idplan = ps_id AND ta_id = ts_idtarea AND ts_fechabaja IS NULL AND ta_complementaria = ''N''' + GetWhereTareaTipoEmpresa +  ')';
  end;

  if chkNoVisitados.Checked then
    sWhereAfi := sWhereAfi + ' AND NOT EXISTS ( SELECT 1 ' +
                             '               FROM hys.hpv_planvisita463, art.prv_resvisitas ' +
                             '              WHERE rv_cuit = em_cuit ' +
                             '                AND rv_estableci = ps_estableci ' +
                             '                AND rv_fechabaja IS NULL ' +
                             '                AND rv_idvisitaasociada IS NULL ' +
                             '                AND rv_firmante NOT IN (''RG657'', ''RG614'') ' +
                             '                AND es_idactividad = pv_idactividad ' +
                             '                AND rv_fecha >= ADD_MONTHS (ps_fechadesde, - (12 * pv_frecuencia)) ' +
                             '                AND EXISTS ( ' +
                             '                       SELECT 1 ' +
                             '                         FROM hys.hvm_visitamotivo ' +
                             '                        WHERE vm_idvisita = rv_id ' +
                             '                          AND vm_fechabaja IS NULL ' +
                             '                          AND vm_idmotivo NOT IN (28, 29, 52, 60))) ';


  if SortDialog.OrderBy = '' then
    sdqConsulta.Sql.Text := iif(sSqlAfi <> '',  sSqlAfi + sWhereAfi, '') + iif(rgEmpresa.ItemIndex = 0, ' UNION ALL ', '') +
                            iif(sSqlNoAfi <> '', sSqlNoAfi + sWhereNoAfi, '') + ' ORDER BY em_cuit, ps_estableci '
  else
     sdqConsulta.Sql.Text := iif(sSqlAfi <> '',  sSqlAfi + sWhereAfi, '') + iif(rgEmpresa.ItemIndex = 0, ' UNION ALL ', '') +
                            iif(sSqlNoAfi <> '', sSqlNoAfi + sWhereNoAfi, '') + SortDialog.OrderBy;
  inherited;
  SelectedList.Clear;
end;

procedure TfrmPlanVisitasDetalle.SetPreventorId(const Value: integer);
begin
  FPreventorId := Value;
  fraPreventorFiltro.Value := Value;
end;

procedure TfrmPlanVisitasDetalle.SetIdProceso(const Value: Integer);
begin
  FIdProceso := Value;
  fraProcesoFiltro.Value := Value;
  if FIdProceso = 99 then
    SetModo(true);
end;

procedure TfrmPlanVisitasDetalle.CargarDetalle;
begin
  if not gbDetalleTareas.Collapsed and not sdqConsulta.IsEmpty then
  begin
    sdqDetalleTareas.Close;
    sdqDetalleTareas.ParamByName('idplan').Value := sdqConsulta.fieldbyname('ps_id').AsInteger;
    sdqDetalleTareas.Open;
  end;
end;

procedure TfrmPlanVisitasDetalle.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmPlanVisitasDetalle.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmPlanVisitasDetalle.gbDetalleTareasExpanded(Sender: TObject);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmPlanVisitasDetalle.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqDetalleTareas.Close;
end;

procedure TfrmPlanVisitasDetalle.gbDetalleTareasCollapsed(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPlanVisitasDetalle.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Column.FieldName = 'SELECTED') then 
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('ps_ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmPlanVisitasDetalle.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmPlanVisitasDetalle.sdqConsultaSELECTEDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if (SelectedList.IndexOf(sdqConsulta.fieldbyname('ps_id').AsString) <> -1) then
    Text := 'S'
  else
    Text := '';
end;

procedure TfrmPlanVisitasDetalle.GridCellClick(Column: TColumn);
var
 i :integer;
begin
  inherited;
  if Assigned(Column.Field) then
    if (Column.Field.FieldName = 'SELECTED') then
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ps_id').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('ps_id').AsString, sdqConsulta.GetBookmark)
      else begin
        {$IFDEF VER150}
        sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
        {$ENDIF}
        SelectedList.Delete(i);
      end;
      Column.Grid.Refresh;
    end;
end;

procedure TfrmPlanVisitasDetalle.btnAceptarCambioprevClick(
  Sender: TObject);
var
  i: integer;
  tipovisita: integer;
begin
  Verificar(not fraCambioTareasPreventor.IsSelected, fraCambioTareasPreventor, 'Debe seleccionar un Preventor.');
  Verificar(not fraMotivoReasignarTareas.IsSelected, fraMotivoReasignarTareas, 'Debe seleccionar un Motivo.');
  Verificar(cbAsignarPreventorProvisorio.Checked and (edFDesdeVigenciaPrevProvisorio.Date = 0), edFDesdeVigenciaPrevProvisorio,
              'Debe completar la fecha desde si va a asignar un preventor provisorio.');
    if edFDesdeVigenciaPrevProvisorio.Date > 0 then
      Verificar((edFDesdeVigenciaPrevProvisorio.Date < DBDate), edFDesdeVigenciaPrevProvisorio,'La fecha de desde debe ser mayor o igual a hoy');
  BeginTrans;
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      //Las visitas del tipo Prioritarias otro periodo, las Emergentes otro periodo, las no programadas
      //y las que deben visitarse mas de un año despues cuya frecuencia es mayor a 2
      if ((sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 1) and (sdqConsulta.fieldbyname('ps_visitaemergente').AsString = 'N') and (sdqConsulta.fieldbyname('ps_visitaotroperiodo').AsString = 'S')) or
         ((sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 1) and (sdqConsulta.fieldbyname('ps_visitaemergente').AsString = 'S') and (sdqConsulta.fieldbyname('ps_visitaotroperiodo').AsString = 'S')) or
         (sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 3) or
         (sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 5) then
        tipovisita := 4
      else
        tipovisita := 0;

     EjecutarSqlSTEx('UPDATE hys.hps_planhys ' +
                      '   SET ps_idpreventor = :idpreventor,'+
                      '       ps_usumodif = :usuario,' +
                      '       ps_fechamodif = sysdate,'+
                      '       ps_idmotivoreasignacion = :motivo,'+
                      '       ps_observaciones = :observacion,'+
                      '       ps_usureasignacion = :usuarioreasig,'+
                      iif(tipovisita <> 0, ' ps_tipovisita = ' + SqlValue(tipovisita) + ',', '') +
                      '       ps_fechareasignacion = sysdate '+
                      ' WHERE ps_id = :id', [fraCambioTareasPreventor.Value,
                                            Sesion.LoginName,
                                            fraMotivoReasignarTareas.Value,
                                            edObservacionReasignarTareas.Text,
                                            Sesion.LoginName,
                                            sdqConsulta.fieldbyname('ps_id').AsInteger]);


     //------------------------------------------------------
      if cbAsignarEstabalPreventor.Checked then
      begin
        EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                      ' set ep_idfirmante = ' + SqlValue(fraCambioTareasPreventor.Value) + ', ' +
                      '     ep_fechamodif = sysdate, '+
                      '     ep_usumodif = '+SqlValue(Sesion.LoginName)+','+
                      '     ep_itcodigo = ' + SqlValue(fraCambioTareasPreventor.Codigo) +
                      ' where ep_id = ' + SqlValue(sdqConsulta.fieldbyname('ep_id').AsInteger));
      end;
      if cbAsignarPreventorProvisorio.Checked then
      begin
        EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                      ' set ep_idpreventorprovisorio = ' + SqlValue(fraCambioTareasPreventor.Value) + ', ' +
                      '     ep_fechamodif = sysdate, '+
                      '     ep_usumodif = '+SqlValue(Sesion.LoginName)+','+
                      '     ep_fdesdeprevprovisorio = '+SqlValue(edFDesdeVigenciaPrevProvisorio.Date)    +','+
                      '     ep_fhastaprevprovisorio = '+SqlValue(edFHastaVigenciaPrevProvisorio.Date) +
                      ' where ep_id = ' + SqlValue(sdqConsulta.fieldbyname('ep_id').AsInteger));
      end;


     //------------------------------------------------------

    end;
    CommitTrans;
    tbRefrescar.Click;
    SelectedList.Clear;
    fpReasignarTareas.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al reasignar las tareas.');
    end;
  end;
end;

procedure TfrmPlanVisitasDetalle.tbReasignarTareasClick(Sender: TObject);
begin
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  fraCambioTareasPreventor.Clear;
  fraMotivoReasignarTareas.Clear;
  edObservacionReasignarTareas.Clear;
  cbAsignarEstabalPreventor.Checked := False;
  fpReasignarTareas.ShowModal;
end;

procedure TfrmPlanVisitasDetalle.tbDesSeleccionarTodoClick(Sender: TObject);
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

procedure TfrmPlanVisitasDetalle.tbSeleccionarTodoClick(Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ps_id').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('ps_id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;


procedure TfrmPlanVisitasDetalle.tbNoRealizarClick(Sender: TObject);
begin
  inherited;
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  fraMotivo.Clear;
  edMotivoLibre.Clear;
  fpMotivo.ShowModal;
end;

procedure TfrmPlanVisitasDetalle.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.Active then
  begin
      if (sdqConsulta.FieldByName('ps_estado').AsString = 'T') then
      begin
        Background := clMoneyGreen;
        if Highlight then
         AFont.Color := clBlack;
      end;

      if (sdqConsulta.FieldByName('ps_estado').AsString = 'P') then
      begin
        Background := $0098E9EB;
        if Highlight then
           AFont.Color := clBlack;
      end;

      if Assigned(Field) and (sdqConsulta.FieldByName('PS_INFORMADOCUATRIMESTRE').AsString = 'S') then
        AFont.Color := chkIncluidoRes771.Font.Color;

      if Assigned(Field) and (UpperCase(Field.FieldName) = 'IT_NOMBRE') and (not sdqConsulta.FieldByName('it_fechabaja').IsNull) then
        AFont.Color := clRed;
  end;
  inherited;
end;

procedure TfrmPlanVisitasDetalle.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  fraEstableci.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  fraProceso.Clear;

  mskCUIT.Clear;
  edRSocial.Clear;
  fraDomicilio.Clear;
  edTelefono.Clear;
  edContacto.Clear;

  fraPreventor.Clear;
  fraEmpresa.Locked := false;
  fraEstableci.Locked := false;
  VclExtra.LockControls([edFechaDesde, edFechaHasta], false);
  edMotivoBaja.Clear;

//  VclExtra.LockControls([mskCUIT, edRSocial, edTelefono, edContacto], false);
//  fraDomicilio.Locked := false;

  fraPreventor.Locked := false;
  pcEmpresa.ActivePage := tbAfiliada;
  CargarTareas;
end;

function TfrmPlanVisitasDetalle.DoABM: Boolean;
var
  i, iIdCodigo :integer;
begin
//  BeginTrans;
  try
    if fraEmpresa.IsSelected and not (ModoABM = maBaja) then
    begin
      for i:=0 to chkTareas.Count - 1 do
      begin
        if not chkTareas.Checked[i] then
          EjecutarSqlEx('UPDATE hys.hts_tareahys ' +
                        '   SET ts_usubaja = :usuario, ' +
                        '       ts_fechabaja = sysdate, ' +
                        '       ts_motivobaja = :motivo '+
                        ' WHERE ts_idplan = :id ' +
                        '   AND ts_fechabaja is null '+
                        '   AND ts_idtarea = :idtarea ', [Sesion.LoginName,
                                                         edMotivoBaja.Text,
                                                         sdqConsulta.fieldbyname('ps_id').AsInteger,
                                                         integer(chkTareas.Items.Objects[i])]);
      end;
    end;
    if (ModoABM = maBaja)  then
    begin
      Sql.Clear;
      Sql.SqlType := stUpdate;
      iIdCodigo := sdqConsulta.FieldByName('PS_ID').AsInteger;
      Sql.Fields.Add('PS_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('PS_FECHABAJA', exDateTime );
      Sql.PrimaryKey.Add('PS_ID', iIdCodigo);
      EjecutarSQL(Sql.Sql);
    end;

    Result := True;
  except
    on E: Exception do
    begin
       Result := false;
       ErrorMsg(E, 'Error al guardar la tarea.');
    end;
  end;
end;

(*
procedure TfrmPlanVisitasDetalle.AgregarTareasNoAfiliada(aIdPlan: integer);
var
  i: integer;
begin
  for i:=0 to chkTareas.Count - 1 do
  begin
    if chkTareas.Checked[i] then
    begin
      if ExisteSqlEx(' SELECT 1 ' +
                     '  FROM hys.hts_tareahys ' +
                     ' WHERE ts_idtarea = :idtarea ' +
                     '  AND ts_idplan = :idplan ', [integer(chkTareas.Items.Objects[i]),
                                                          aIdPlan]) then
      begin
        EjecutarSqlSTEx(' UPDATE hys.hts_tareahys ' +
                        ' SET ts_fechabaja = null, ' +
                        '     ts_usubaja = null, ' +
                        '     ts_fechamodif = sysdate, ' +
                        '     ts_usumodif = :usuario , ' +
                        '     ts_tarea = :tarea, ' +
                        '     ts_fechadesde = :fechadesde, ' +
                        '     ts_fechahasta = :fechahasta ' +
                        ' WHERE ts_idtarea = :idtarea ' +
                        '  AND ts_idplan = :idplan ', [Sesion.LoginName,
                                                       chkTareas.Items[i],
                                                       TDateTimeEx.Create(edFechaDesde.Date),
                                                       TDateTimeEx.Create(edFechaHasta.Date),
                                                       integer(chkTareas.Items.Objects[i]),
                                                       aIdPlan])
      end
      else begin
        EjecutarSqlSTEx(' INSERT INTO hys.hts_tareahys(ts_id, ts_idtarea, ts_tarea, ' +
                        '                                  ts_fechadesde, ts_fechahasta, ts_idproceso ' +
                        '                                  ts_idplan, ts_fechaalta, ts_usualta) ' +
                        ' VALUES(hys.seq_hts_tareahys_id.nextval, :idtarea:, :tarea, ' +
                        '        :fechadesde, :fechahasta, :idproceso, ' +
                        '        :idplan, sysdate, :usuario) ', [integer(chkTareas.Items.Objects[i]),
                                                                 chkTareas.Items[i],
                                                                 TDateTimeEx.Create(edFechaDesde.Date),
                                                                 TDateTimeEx.Create(edFechaHasta.Date),
                                                                 fraProceso.Value, 
                                                                 aIdPlan,
                                                                 Sesion.LoginName]);
      end;
    end;
  end;
end;
*)

function TfrmPlanVisitasDetalle.Validar: Boolean;
begin
  Verificar(fraEmpresa.IsSelected and ((trim(mskCUIT.Text) <> '') or (trim(edRSocial.Text)<> '')), tbAfiliada, 'No pueden estar completos datos de una empresa afilidada y otra no afiliada.');
  if fraEmpresa.IsSelected then
  begin
    Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar una empresa.');
    Verificar(not fraEstableci.IsSelected, fraEstableci, 'Debe seleccionar un establecimiento.');
  end
  else begin
    Verificar((mskCUIT.Text <> '') and not IsCuit(mskCUIT.Text), mskCUIT, 'El Cuit es inválido,');
    Verificar(trim(edRSocial.Text)='', edRSocial, 'Debe ingresar el nombre de la empresa.');
    Verificar(not fraDomicilio.IsSelected, fraDomicilio, 'Debe ingresar un domicilio.');
    Verificar(trim(edContacto.Text) = '', edContacto, 'Debe ingresar un contacto.');
  end;
  Verificar(edFechaDesde.Date = 0, edFechaDesde, 'Debe ingresar una fecha desde.');
  Verificar(edFechaHasta.Date = 0, edFechaHasta, 'Debe ingresar una fecha hasta.');
  Verificar(edFechaHasta.Date < edFechaHasta.Date, edFechaHasta, 'La fecha hasta debe ser mayor o igual a la fecha desde.');
  Verificar(not fraProceso.IsSelected, fraProceso, 'Debe seleccionar el mes.');

  Verificar(CheckListCount(chkTareas) = 0, chkTareas, 'Seleccione alguna tarea.');
  Verificar(not fraPreventor.IsSelected, fraPreventor, 'Debe seleccionar un preventor.');
  result := true;
end;

procedure TfrmPlanVisitasDetalle.DesmarcarItems;
var
  i: integer;
begin
  for i:=0 to chkTareas.Count-1 do
    chkTareas.Checked[i] := false;
end;

procedure TfrmPlanVisitasDetalle.OnEmpresaChange(Sender: TObject);
begin
  fraEstableci.CUIT := fraEmpresa.CUIT;
end;

procedure TfrmPlanVisitasDetalle.CargarTareas;
begin
  chkTareas.Clear;
  with GetQuery('SELECT * FROM HYS.HTA_TAREA WHERE TA_VISIBLE = ''S'' AND TA_FECHABAJA IS NULL ORDER BY 2') do
  try
    while not Eof do
    begin
      chkTareas.AddItem(FieldByName('TA_DESCRIPCION').AsString, TObject(FieldByName('TA_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmPlanVisitasDetalle.btnAceptarMotivoClick(Sender: TObject);
var
  i: integer;
begin
  Verificar(not fraMotivo.IsSelected, fraMotivo, 'No hay un motivo seleccionado.');
  BeginTrans;
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      EjecutarSqlSTEx('UPDATE hys.hps_planhys ' +
                      '   SET ps_idmotivobaja = :idmotivobaja, '+
                      '       ps_usubaja = :usuario, ' +
                      '       ps_fechabaja = sysdate, '+
                      '       ps_observacion = :texto ' +
                      ' WHERE ps_fechabaja is null ' +
                      '   AND ps_id = :id', [fraMotivo.Value,
                                            Sesion.LoginName,
                                            edMotivoLibre.Text,
                                            sdqConsulta.fieldbyname('ps_id').AsInteger]);
    end;
    CommitTrans;
    tbRefrescar.Click;
    SelectedList.Clear;
    fpMotivo.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al marcar tareas como no realizables.');
    end;
  end;
end;

procedure TfrmPlanVisitasDetalle.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maAlta then
  begin
    fraPreventor.Value := fraPreventorFiltro.Value;
    fraProceso.Locked := false;
  end
  else
    fraProceso.Locked := true;
end;

procedure TfrmPlanVisitasDetalle.LoadControls;
begin
  inherited;

  if not sdqConsulta.FieldByName('PS_IDEMPRESA').IsNull then
  begin
    pcEmpresa.ActivePage := tbAfiliada;
    fraEmpresa.Locked := true;
    fraEstableci.Locked := true;
    fraEmpresa.Value := sdqConsulta.FieldByName('PS_IDEMPRESA').AsInteger;
    OnEmpresaChange(self);
    fraEstableci.Value := sdqConsulta.FieldByName('PS_ESTABLECI').AsInteger;
  end
  else begin
    pcEmpresa.ActivePage := tbNoAfiliada;
    mskCUIT.Text := sdqConsulta.FieldByName('EM_CUIT').AsString;
    edRSocial.Text := sdqConsulta.FieldByName('EM_NOMBRE').AsString;
    fraDomicilio.Calle := sdqConsulta.FieldByName('PS_CALLE').AsString;
    fraDomicilio.Numero := sdqConsulta.FieldByName('PS_NUMERO').AsString;
    fraDomicilio.Piso := sdqConsulta.FieldByName('PS_PISO').AsString;
    fraDomicilio.Departamento := sdqConsulta.FieldByName('PS_DEPARTAMENTO').AsString;
    fraDomicilio.CodigoPostal := sdqConsulta.FieldByName('ES_CPOSTAL').AsString;
    fraDomicilio.Localidad := sdqConsulta.FieldByName('PS_LOCALIDAD').AsString;
    fraDomicilio.Prov := sdqConsulta.FieldByName('ES_PROVINCIA').AsInteger;
    fraDomicilio.CPA := sdqConsulta.FieldByName('ES_CPOSTALA').AsString;
    edTelefono.Text := sdqConsulta.FieldByName('DC_TELEFONOS').AsString;
    edContacto.Text := sdqConsulta.FieldByName('PS_CONTACTO').AsString;
//    VclExtra.LockControls([mskCUIT, edRSocial, edTelefono, edContacto], true);
//    fraDomicilio.Locked := true;
  end;

  VclExtra.LockControls([edFechaDesde, edFechaHasta], true);
  fraPreventor.Locked := true;

  fraProceso.Value := sdqConsulta.FieldByName('PV_ID').AsInteger;
  edFechaDesde.Date := sdqConsulta.FieldByName('PS_FECHADESDE').AsDateTime;
  edFechaHasta.Date := sdqConsulta.FieldByName('PS_FECHAHASTA').AsDateTime;
  fraPreventor.Value := sdqConsulta.FieldByName('PS_IDPREVENTOR').AsInteger;
  CargarTareas;
  CargarTareas(sdqConsulta.FieldByName('PS_ID').AsInteger);
end;

procedure TfrmPlanVisitasDetalle.CargarTareas(aIdPlan: integer);
var
  i: integer;
begin
  DesmarcarItems;
  with GetQueryEx('select * from hys.hts_tareahys where ts_idplan = :id and ts_fechabaja is null', [aIdPlan]) do
  try
    while not Eof do
    begin
      for i:=0 to chkTareas.Count-1 do
        if integer(chkTareas.Items.Objects[i]) = FieldByName('TS_IDTAREA').AsInteger then
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

procedure TfrmPlanVisitasDetalle.dbgDetalleTareasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqDetalleTareas.Active and not (sdqDetalleTareas.FieldByName('TS_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmPlanVisitasDetalle.pcEmpresaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (pcEmpresa.ActivePage = tbAfiliada) and fraEmpresa.IsSelected then
  begin
    InvalidMsg(tbAfiliada, 'Debe limpiar los datos para pasar de solapa');
    AllowChange := false;
  end;

  if (pcEmpresa.ActivePage = tbNoAfiliada)
    and ((trim(mskCUIT.Text) <> '') or
         (trim(edRSocial.Text) <> '') or
         (fraDomicilio.IsSelected) or
         (trim(edTelefono.Text) <> '') or
         (trim(edContacto.Text) <> '')) then
  begin
    InvalidMsg(tbNoAfiliada, 'Debe limpiar los datos para pasar de solapa');
    AllowChange := false;
  end;
end;

procedure TfrmPlanVisitasDetalle.tbCPClick(Sender: TObject);
begin
 Abrir(TfrmReasignacionCP, frmReasignacionCP, tmvNormal, frmPrincipal.mnuReasigCP);

  frmReasignacionCP.Caption := 'Consulta de CP asignados';
//  frmReasignacionCP.pnlAsignacion.Visible := false;
//  frmReasignacionCP.btnGuardar.Visible := false;
  frmReasignacionCP.edCP.Text := fraLocalidad.edCPostal.Text;
  if fraPreventorFiltro.IsSelected then
    frmReasignacionCP.fraPreventorOrigen.Value := fraPreventorFiltro.Value;
  frmReasignacionCP.btnCancelar.Caption := '&Salir';
end;

procedure TfrmPlanVisitasDetalle.SetVerPendientes(const Value: boolean);
begin
  FVerPendientes := Value;
  chkPendiente.Checked := FVerPendientes;
end;

procedure TfrmPlanVisitasDetalle.SetVerParciales(const Value: boolean);
begin
  FVerParciales := Value;
  chkParcial.Checked := FVerParciales;
end;

procedure TfrmPlanVisitasDetalle.SetVerTerminados(const Value: boolean);
begin
  FVerTerminados := Value;
  chkTerminado.Checked := FVerTerminados;
end;

procedure TfrmPlanVisitasDetalle.SetFechaAltaDesde(const Value: TDatetime);
begin
  FFechaAltaDesde := Value;
  edFechaAltaDesde.Date := FFechaAltaDesde;
end;

procedure TfrmPlanVisitasDetalle.SetFechaAltaHasta(const Value: TDatetime);
begin
  FFechaAltaHasta := Value;
  edFechaAltaHasta.Date := FFechaAltaHasta;
end;

procedure TfrmPlanVisitasDetalle.SetContrato(const Value: Integer);
begin
  FContrato := Value;
  fraEmpresaFiltro.Contrato := FContrato;
end;

procedure TfrmPlanVisitasDetalle.SetEstablecimiento(const Value: String);
begin
  FEstablecimiento := Value;
  edEstablecimiento.Text := FEstablecimiento;
end;


procedure TfrmPlanVisitasDetalle.SetCompensatorias(const Value: boolean);
begin
  FCompensatorias := Value;
  chkCompensatorias.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetEmergentes(const Value: boolean);
begin
  FEmergentes := Value;
  chkEmergentes.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetEmergentesOtroPeriodo(
  const Value: boolean);
begin
  FEmergentesOtroPeriodo := Value;
  chkEmergentesOtroPeriodo.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetNoProgramadas(const Value: boolean);
begin
  FNoProgramadas := Value;
  chkNoProgramadas.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetPrioritarias(const Value: boolean);
begin
  FPrioritarias := Value;
  chkPrioritarias.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetPrioritariasOtroPeriodo(
  const Value: boolean);
begin
  FPrioritariasOtroPeriodo := Value;
  chkPrioritariasOtroPeriodo.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetCompensatoriasManual(
  const Value: boolean);
begin
  FCompensatoriasManual := Value;
  chkCompensatoriasManual.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.SetCompensatoriasOtroPeriodo(
  const Value: boolean);
begin
  FCompensatoriasOtroPeriodo := Value;
  chkCompensatoriasOtroPeriodo.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.tbAsignacionManualClick(Sender: TObject);
var
  i: integer;
  tipovisita: integer;
begin
  BeginTrans;
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      //Las visitas del tipo Prioritarias otro periodo, las Emergentes otro periodo, las no programadas
      //y las que deben visitarse mas de un año despues cuya frecuencia es mayor a 2
      if ((sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 1) and (sdqConsulta.fieldbyname('ps_visitaemergente').AsString = 'N') and (sdqConsulta.fieldbyname('ps_visitaotroperiodo').AsString = 'S')) or
         ((sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 1) and (sdqConsulta.fieldbyname('ps_visitaemergente').AsString = 'S') and (sdqConsulta.fieldbyname('ps_visitaotroperiodo').AsString = 'S')) or
         (sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 3) or
         (sdqConsulta.fieldbyname('ps_tipovisita').AsInteger = 5) then
        tipovisita := 4
      else
        tipovisita := 0;

     EjecutarSqlSTEx('UPDATE hys.hps_planhys ' +
                      '   SET ps_usumodif = :usuario,' +
                      '       ps_fechamodif = sysdate'+
                      iif(tipovisita <> 0, ' ,ps_tipovisita = ' + SqlValue(tipovisita), '') +
                      ' WHERE ps_id = :id', [Sesion.LoginName,
                                            sdqConsulta.fieldbyname('ps_id').AsInteger]);
    end;
    
    CommitTrans;
    tbRefrescar.Click;
    SelectedList.Clear;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al asignar las tareas.');
    end;
  end;
end;

procedure TfrmPlanVisitasDetalle.SetProgramadasOtroAnio(
  const Value: boolean);
begin
  FProgramadasOtroAnio := Value;
  chkProgramadaOtroAnio.Checked := Value;
end;

procedure TfrmPlanVisitasDetalle.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmPlanVisitasDetalle.tbSumatoriaClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active then
    MsgBox('La cantidad de registros es: ' + IntToStr(sdqConsulta.RecordCount), MB_ICONINFORMATION, Self.Caption);
end;

procedure TfrmPlanVisitasDetalle.SetFechaDesde(const Value: TDatetime);
begin
  FFechaDesde := Value;
  edFechaDesdeFiltro.Date := Value;
end;

procedure TfrmPlanVisitasDetalle.SetFechaHasta(const Value: TDatetime);
begin
  FFechaHasta := Value;
  edFechaHastaFiltro.Date := Value;
end;

procedure TfrmPlanVisitasDetalle.SetVerTerminadosUcap(
  const Value: boolean);
begin
  FVerTerminadosUcap := Value;
  chkTerminadoUCAP.Checked := Value;
end;

function TfrmPlanVisitasDetalle.GetWhereTareaTipoEmpresa: String;
var
  i: integer;
begin
  for i:=0 to cmbTareasSegunTipoEmpresa.Items.Count-1 do
    if cmbTareasSegunTipoEmpresa.Checked[i] then
    begin
      if Result <> '' then
        Result := Result + ' OR ';
      Result := Result + '(TA_TIPOS like ' + SqlValue('%' + cmbTareasSegunTipoEmpresa.Items[i] + '%') + ')';
    end;
  if Result <> '' then
    Result := ' AND ('  + Result + ')';
end;

procedure TfrmPlanVisitasDetalle.cbVerPreventorAnteriorClick(
  Sender: TObject);
begin
  inherited;
  if cbVerPreventorAnterior.Checked then
    if MsgAsk('¿Desea utilizar el filtro de preventor para filtrar el preventor anterior?', 'Preventor Anterior') then
      fraPreventorFiltro.Color := cbVerPreventorAnterior.Font.Color
    else
      fraPreventorFiltro.Color := FfraColorDefault
  else
    fraPreventorFiltro.Color := FfraColorDefault;
end;

procedure TfrmPlanVisitasDetalle.chkProgramadaOtroAnioClick(Sender: TObject);
begin
  inherited;
  if chkProgramadaOtroAnio.Checked then
    VCLExtra.LockControls([chkNoVisitados], false)
  else begin
    chkNoVisitados.Checked := false;
    VCLExtra.LockControls([chkNoVisitados], true);
  end;
end;

procedure TfrmPlanVisitasDetalle.SetModo(bModoConsulta: boolean);
begin
  fraProcesoFiltro.Locked := bModoConsulta;
  tbNuevo.Visible := not bModoConsulta;
  tbModificar.Visible := not bModoConsulta;
  tbNoRealizar.Visible := not bModoConsulta;
  tbReasignarTareas.Visible := not bModoConsulta;
  tbAsignacionManual.Visible := not bModoConsulta;
  tbDesSeleccionarTodo.Visible := not bModoConsulta;
  tbSeleccionarTodo.Visible := not bModoConsulta;
  Grid.ColumnByField['SELECTED'].Visible := not bModoConsulta;
end;

end.
