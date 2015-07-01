unit unFrmAdministracionSeteo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, mwHighlighter, mwSqlSyn, Menus, DB, SDEngine, ImgList,
  unArtFrame, unFraCodigoDescripcion, mwCustomEdit, ComCtrls, Buttons,
  PatternEdit, unfraCodigoDescripcionExt, ExtCtrls, FormPanel, Grids,
  DBGrids, ToolWin, Mask, ToolEdit, DateComboBox, unfraCtbTablas,
  JvExControls, JvComponent, JvgCheckBox, unImpoExpoTypes, JvExDBGrids,
  JvDBGrid, Placemnt, unArtDBAwareFrame;

type
  TModoEjecucion = (meAlta, meModificacion, meBaja);


  TTipoVariable = class(TObject)
     FId : Integer;
     FTipo : String;
     FLongitud : Integer;
  public
     constructor Create(AId : Integer; ATipo : string; ALongitud : Integer); overload;
     property Id : Integer Read FId Write FId;
     property Tipo : String Read FTipo Write FTipo;
     property Longitud : Integer Read FLongitud Write FLongitud;
  end;

  TFrmAdministracionSeteo = class(TForm)
    pnCabecera: TPanel;
    pcFormulas: TPageControl;
    tsEstados: TTabSheet;
    cbEstados: TCoolBar;
    tbFormulasEstados: TToolBar;
    tbNuevaFormulaEstado: TToolButton;
    tbEditarFormulaEstado: TToolButton;
    tbEliminarFormulaEstado: TToolButton;
    fpFormulasEstados: TFormPanel;
    bvSeparadorBotonesEstados: TBevel;
    lblDescripcionEstado: TLabel;
    lblCodigoEstado: TLabel;
    btnAceptarFormulaEstado: TButton;
    btnCancelarFormulaEstado: TButton;
    edDescripcionEstado: TEdit;
    edFormulaEstados: TmwCustomEdit;
    tbEvToolBar: TToolBar;
    tbLimpiarFormulaEstado: TToolButton;
    tbChequearConsultaEstado: TToolButton;
    tbCamposDisponiblesEstados: TToolButton;
    lblVaciaEstado: TLabel;
    lblExplicacionEstado: TLabel;
    edCodigoEstado: TEdit;
    tsVariables: TTabSheet;
    dbgVariables: TJvDBGrid;
    cbVariables: TCoolBar;
    tbFormulasVariables: TToolBar;
    tbNuevaFormulaVariable: TToolButton;
    tbEditarFormulaVariable: TToolButton;
    tbEliminarFormulaVariable: TToolButton;
    fpFormulasVariables: TFormPanel;
    bvSeparadorBotonesVariables: TBevel;
    btnAceptarFormulaVariable: TButton;
    btnCancelarFormulaVariable: TButton;
    edFormulaVariable: TmwCustomEdit;
    tbHerramientasVariable: TToolBar;
    lblLimpiarFormulaVariable: TToolButton;
    lblChequearFormulaVariable: TToolButton;
    tbCamposDisponiblesVariables: TToolButton;
    lblLabelVacio: TLabel;
    lblExplicacionVariable: TLabel;
    tsAceptacionRechazos: TTabSheet;
    dbgReglasAceptacionRechazo: TJvDBGrid;
    cbReglasAceptacionRechazo: TCoolBar;
    tbFormulasReglasAceptacionRechazo: TToolBar;
    tbNuevaReglasAceptacionRechazo: TToolButton;
    tbEditarReglasAceptacionRechazo: TToolButton;
    tbEliminarReglasAceptacionRechazo: TToolButton;
    tbOrdenarAbajoRegla: TToolButton;
    tbOrdenarArribaRegla: TToolButton;
    fpReglasAceptaRechazo: TFormPanel;
    bvSeparadorBotonesReglasAceptacionRechazo: TBevel;
    lblDescripcionRegla: TLabel;
    lblCodigoRegla: TLabel;
    btnAceptarRegla: TButton;
    btnCancelarRegla: TButton;
    edDescripcionReglaAceptacion: TEdit;
    edCodigoReglaAceptacion: TEdit;
    tbHerramientasReglasAceptacion: TToolBar;
    tbLimpiarFormulaAceptacion: TToolButton;
    tbCheckearFormulaAceptacion: TToolButton;
    tbCamposDisponiblesReglas: TToolButton;
    lblVaciaReglaAceptacion: TLabel;
    lblExplicacionReglaAceptacion: TLabel;
    edFormulaReglaAceptacionYRechazo: TmwCustomEdit;
    tsReglasEstados: TTabSheet;
    sdqReglasAceptacionRechazo: TSDQuery;
    sdqEstados: TSDQuery;
    sdqVariables: TSDQuery;
    dsVariables: TDataSource;
    dsEstados: TDataSource;
    dsReglasAceptacionrechazo: TDataSource;
    pmnuCampos: TPopupMenu;
    mwSqlSynSql: TmwSqlSyn;
    mwSqlSynSql2: TmwSqlSyn;
    cbReglasEstados: TCoolBar;
    tbReglasEstados: TToolBar;
    tbNuevaReglaParaEstado: TToolButton;
    tbEditarReglaParaEstado: TToolButton;
    tbEliminarReglaParaEstado: TToolButton;
    tbOrdenarArribaReglaEstado: TToolButton;
    tbOrdenarAbajoReglaEstado: TToolButton;
    dbgReglasEstados: TJvDBGrid;
    pnRelacionEstados: TPanel;
    gbEdicionReglaEstados: TGroupBox;
    lblEstadoSeleccionado: TLabel;
    fraObservarComoEstados: TfraCodigoDescripcionExt;
    lblObservarComoEstados: TLabel;
    cmbSeteoEstado: TComboBox;
    lblSiEstaSeteado: TStaticText;
    btnAgregar: TSpeedButton;
    tsReglasVariables: TTabSheet;
    cbReglasparaVariables: TCoolBar;
    tbReglasVariables: TToolBar;
    tbNuevaReglaVariable: TToolButton;
    tbEditarReglaParaVariable: TToolButton;
    tbEliminarReglaParaVariable: TToolButton;
    tbSeparadorReglasVariable: TToolButton;
    tbOrdenarArribaReglaVariable: TToolButton;
    tbOrdenarAbajoReglaVariable: TToolButton;
    pnEdicionVariables: TPanel;
    gbEdicionReglaVariables: TGroupBox;
    lblNombresVariable: TLabel;
    lblObservarComoVariables: TLabel;
    AceptarReglaDeVariable: TSpeedButton;
    dbgReglasParaVariables: TJvDBGrid;
    lblValoresEntreVariable: TLabel;
    cboEstadosDiponibles: TComboBox;
    fraObservarComoVariables: TfraCodigoDescripcionExt;
    cboVariables: TComboBox;
    sbSeteo: TStatusBar;
    pnBotones: TPanel;
    bvSeparadorBotonesSeteo: TBevel;
    btnAceptarSeteo: TButton;
    btnCancelarSeteo: TButton;
    dsObservacionEstado: TDataSource;
    sdqObservacionEstado: TSDQuery;
    dsObservacionVariable: TDataSource;
    sdqObservacionVariable: TSDQuery;
    gbCabeceraSeteo: TGroupBox;
    lblFechaAsignacion: TLabel;
    edFechaVigenciaDesde: TDateComboBox;
    lblTipo: TStaticText;
    cmbTipo: TComboBox;
    lbConcurso: TLabel;
    edFechaVigenciaHasta: TDateComboBox;
    lblDestino: TLabel;
    fraObservaciones: TfraCodigoDescripcionExt;
    tsDestinoDeCalculo: TTabSheet;
    cboRelacionVariable: TComboBox;
    pnVariables: TPanel;
    lblTipoDato: TLabel;
    lblDescripcionVariable: TLabel;
    lblCodigoVariable: TLabel;
    lblTamanio: TLabel;
    fraParaTipoDato: TfraCtbTablas;
    EdDescripcionVariable: TEdit;
    edCodigoVariable: TEdit;
    edTamanio: TPatternEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbAgregarProcedimientoDevengado: TToolButton;
    tbEditarProcedimientoDevengado: TToolButton;
    tbEliminarProcedimientoDevengado: TToolButton;
    DBGrid2: TJvDBGrid;
    GroupBox1: TGroupBox;
    DBGrid1: TJvDBGrid;
    mObservacionesProcedumientoCalculoDevengado: TMemo;
    tbImprimirResumenProcedimientos: TToolButton;
    fpProcedimientoAAplicar: TFormPanel;
    Bevel1: TBevel;
    btnAceptarDestinoCalculo: TButton;
    btnCancelaDestinoCalculo: TButton;
    gbEdicionReglaVariablesProcedimiento: TGroupBox;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    cboVariablesProcedimientosCalculo: TComboBox;
    cboRelacionVariableProcedimiento: TComboBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    fraProcesosDevengados: TfraCodigoDescripcionExt;
    Label3: TLabel;
    DBGrid3: TJvDBGrid;
    sbAgregarReglaCalculo: TSpeedButton;
    tsProcedimientoDevengado: TTabSheet;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbAgregarProcedimientoCalculo: TToolButton;
    tbEditarProcedimientoCalculo: TToolButton;
    tbEliminarProcedimientoCalculo: TToolButton;
    dbgProcedimientoDevengado: TJvDBGrid;
    DBGrid5: TJvDBGrid;
    fpProcedimientoCalculoDevengado: TFormPanel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label7: TLabel;
    Button3: TButton;
    Button4: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    ToolBar3: TToolBar;
    tbLimpiarFormulaProcedimiento: TToolButton;
    tbComprobarSintaxisProcedimientoDevengado: TToolButton;
    Label9: TLabel;
    mwCustomEdit1: TmwCustomEdit;
    Label8: TLabel;
    DateComboBox1: TDateComboBox;
    Label11: TLabel;
    DateComboBox2: TDateComboBox;
    ts: TTabSheet;
    CoolBar3: TCoolBar;
    ToolBar4: TToolBar;
    tbParametro: TToolButton;
    tbEditarParametro: TToolButton;
    tbEliminarParametro: TToolButton;
    DBGrid6: TJvDBGrid;
    fpParametros: TFormPanel;
    Bevel3: TBevel;
    btnAceptarParametro: TButton;
    btnCancelarParametro: TButton;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    edtDescripcionParametro: TEdit;
    edtCodigoParametro: TEdit;
    edtValoresVariable: TEdit;
    fraTipoDatoParametro: TfraCtbTablas;
    Label12: TLabel;
    lblValorParametroDesde: TLabel;
    ToolButton9: TToolButton;
    cboClaseParametro: TComboBox;
    chkProcedimientoPorDefecto: TCheckBox;
    CoolBar4: TCoolBar;
    ToolBar5: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sdqParametros: TSDQuery;
    dsParametros: TDataSource;
    sdqProcedimientoDevengado: TSDQuery;
    dsProcediientoDevengado: TDataSource;
    lblValorParametroHasta: TLabel;
    sdqSeleccionCalculo: TSDQuery;
    dsSeleccionCalculo: TDataSource;
    dbgEstados: TJvDBGrid;
    FormStorage: TFormStorage;
    procedure cmbTipoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcFormulasChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevaFormulaEstadoClick(Sender: TObject);
    procedure tbEditarFormulaEstadoClick(Sender: TObject);
    procedure tbEliminarFormulaEstadoClick(Sender: TObject);
    procedure btnAceptarFormulaEstadoClick(Sender: TObject);
    procedure btnAceptarSeteoClick(Sender: TObject);
    procedure btnCancelarSeteoClick(Sender: TObject);
    procedure tbNuevaFormulaVariableClick(Sender: TObject);
    procedure tbEditarFormulaVariableClick(Sender: TObject);
    procedure tbEliminarFormulaVariableClick(Sender: TObject);
    procedure btnAceptarFormulaVariableClick(Sender: TObject);
    procedure tbNuevaReglasAceptacionRechazoClick(Sender: TObject);
    procedure tbEditarReglasAceptacionRechazoClick(Sender: TObject);
    procedure tbEliminarReglasAceptacionRechazoClick(Sender: TObject);
    procedure btnAceptarReglaClick(Sender: TObject);
    procedure tbNuevaReglaParaEstadoClick(Sender: TObject);
    procedure tbEditarReglaParaEstadoClick(Sender: TObject);
    procedure tbEliminarReglaParaEstadoClick(Sender: TObject);
    procedure tbEliminarReglaParaVariableClick(Sender: TObject);
    procedure tbNuevaReglaVariableClick(Sender: TObject);
    procedure tbEditarReglaParaVariableClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure cboRelacionVariableChange(Sender: TObject);
    procedure AceptarReglaDeVariableClick(Sender: TObject);
    procedure cboVariablesChange(Sender: TObject);
    procedure tbAgregarProcedimientoDevengadoClick(Sender: TObject);
    procedure cboRelacionVariableProcedimientoChange(Sender: TObject);
    procedure cboVariablesProcedimientosCalculoChange(Sender: TObject);
    procedure tbAgregarProcedimientoCalculoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure tbEditarProcedimientoDevengadoClick(Sender: TObject);
    procedure dbgEstadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgEstadosDblClick(Sender: TObject);
    procedure dbgVariablesDblClick(Sender: TObject);
    procedure dbgReglasAceptacionRechazoDblClick(Sender: TObject);
    procedure dbgReglasEstadosDblClick(Sender: TObject);
    procedure dbgReglasParaVariablesDblClick(Sender: TObject);
    procedure dbgProcedimientoDevengadoDblClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure tsReglasEstadosShow(Sender: TObject);
    procedure tsReglasVariablesShow(Sender: TObject);
  private
    FIdSeteo : integer;
    FId      : integer;
    FModoSeteo : TModoEjecucion;
    FModoResto : TModoEjecucion;
    FSeteo : TFields;
    ParametroUnario: TWinControl;
    ParametroBinario: TWinControl;
    { Private declarations }
    procedure Limpiar;

    procedure CargarSegunTipo(Index: Integer);
    // function  VerificarCarga(AIdSeteo: Integer): boolean;
    procedure CargarControles;
    procedure Inicializar;

    procedure LimpiarEstado;
    procedure CargarControlesEstado;
    procedure GuardarEstado;
    procedure ValidarConsulta(AConsulta : TStrings; ATipoDato: String = 'B'; ALongitud : Integer = 0);
    function VerificarCodigoEstadoUnico(ACodigo: String): boolean;
    function GetTipoByIndex(AIndex : Integer) : String;
    procedure GuaradarSeteo;
    function Validar: boolean;
    procedure LimpiarVariable;
    procedure CargarControlesVariable;
    procedure GuardarVariable;
    function VerificarCodigoVariableUnico(ACodigo: String): boolean;
    procedure GuardarRegla;
    procedure LimpiarRegla;
    function VerificarCodigoReglaUnico(ACodigo: String): boolean;
    procedure CargarControlesRegla;
    procedure RecargarEstados;
    procedure RecargarVariables;
    procedure LimpiarReglaParaEstado;
    procedure CargarControlesReglaParaEstado;
    procedure GuardarReglaEstado;
    procedure CargarControlesReglaParaVariable;
    procedure LimpiarReglaParaVariables;
    procedure GuardarReglaVariables;
    procedure SetearPorRelaciones;
    function GetRelacionBinariaByIndex(AIndex : integer): boolean;
    function VerificarLongitudVariable: boolean;
    procedure SetearPorRelacionesProcedimiento;
    procedure CargarParametros(Index : Integer);
    procedure pmnuCamposClick(Sender: TObject);
    function IsBaja(sdqConsultaActiva: TSDquery; sFieldBaja : String ): Boolean;
    procedure SetItemIndexComboByIdTipo(ACombo: TComboBox; AId: Integer);
    procedure FreeCombo(ACombo: TComboBox);
  public
    { Public declarations }
    procedure AltaSeteo;
    procedure ModificacionSeteo(ASeteo : TFields);
  end;


var
  FrmAdministracionSeteo: TFrmAdministracionSeteo;


implementation

uses unCustomDataModule, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,
     StrFuncs, VclExtra, Cuit, unCustomConsulta, unFormulaUtils, Math, unParams, unConstEmision, unUtils,
  unDmEmision;

{$R *.dfm}

{ TFrmAdministracionSeteo }

procedure TFrmAdministracionSeteo.Limpiar;
begin
  edFechaVigenciaDesde.Date := 0;
  edFechaVigenciaHasta.Date := 0;
  cmbTipo.ItemIndex := 0;
  pcFormulas.ActivePageIndex := 0;
  CargarSegunTipo(0);

end;

procedure TFrmAdministracionSeteo.CargarControles;
begin
  edFechaVigenciaDesde.Date := FSeteo.FieldByName('SE_FECHAVIGENCIADESDE').AsDateTime;
  edFechaVigenciaHasta.Date := FSeteo.FieldByName('SE_FECHAVIGENCIAHASTA').AsDateTime;
  CargarSegunTipo(cmbTipo.ItemIndex);
end;


procedure TFrmAdministracionSeteo.CargarSegunTipo(Index : Integer);
var
 Tipo : string;
begin
  Tipo := GetTipoByIndex(Index);
  try
    sdqEstados.Close;
    sdqEstados.ParamByName('idseteo').AsInteger := FIdSeteo;
    sdqEstados.ParamByName('idtipo').AsString :=  Tipo;

    sdqVariables.Close;
    sdqVariables.ParamByName('idseteo').AsInteger := FIdSeteo;
    sdqVariables.ParamByName('idtipo').AsString :=  Tipo;

    sdqReglasAceptacionRechazo.Close;
    sdqReglasAceptacionRechazo.ParamByName('idseteo').AsInteger := FIdSeteo;
    sdqReglasAceptacionRechazo.ParamByName('idtipo').AsString :=  Tipo;

    sdqObservacionEstado.Close;
    sdqObservacionEstado.ParamByName('idseteo').AsInteger := FIdSeteo;
    sdqObservacionEstado.ParamByName('idtipo').AsString :=  Tipo;

    sdqObservacionVariable.Close;
    sdqObservacionVariable.ParamByName('idseteo').AsInteger := FIdSeteo;
    sdqObservacionVariable.ParamByName('idtipo').AsString :=  Tipo;


    sdqProcedimientoDevengado.Close;
    sdqProcedimientoDevengado.ParamByName('idseteo').AsInteger := FIdSeteo;

    fraObservaciones.ExtraCondition           := 'and ob_tipo = ' + SqlValue(Tipo);
    fraObservarComoEstados.ExtraCondition     := 'and ob_tipo = ' + SqlValue(Tipo);
    fraObservarComoVariables.ExtraCondition   := 'and ob_tipo = ' + SqlValue(Tipo);

    CargarParametros(Index);

  finally
    sdqEstados.Open;
    sdqVariables.Open;
    sdqReglasAceptacionRechazo.Open;
    sdqObservacionVariable.Open;
    sdqObservacionEstado.Open;
    sdqProcedimientoDevengado.Open;

    RecargarEstados;
    RecargarVariables;

  end;
end;


procedure TFrmAdministracionSeteo.cmbTipoChange(Sender: TObject);
begin
  CargarSegunTipo(cmbTipo.ItemIndex);
end;

procedure TFrmAdministracionSeteo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeCombo(cboVariables);
  Action := caFree;
end;


procedure TFrmAdministracionSeteo.AltaSeteo;
begin
  BeginTrans(True);
  FIdSeteo := GetSecNextVal('emi.seq_ise_id');
  FModoSeteo := meAlta;
  Limpiar;

  EjecutarSqlST('INSERT INTO emi.ise_seteo ' +
                '   (se_id, se_fechavigenciadesde, se_activo, se_usualta, se_fechaalta)' +
                ' Values (' + SqlValue(FIdSeteo) + ', Sysdate, ''N'', ' + SqlValue(Sesion.LoginName) + ', Sysdate)');

  ShowModal;
end;



procedure TFrmAdministracionSeteo.ModificacionSeteo(ASeteo : TFields);
begin
  BeginTrans(True);
  FIdSeteo := ASeteo.FieldByName('se_id').AsInteger;
  FModoSeteo := meModificacion;
  FSeteo := ASeteo;
  Limpiar;

  CargarControles;

  ShowModal;
end;



procedure TFrmAdministracionSeteo.Inicializar;
begin
 pcFormulas.ActivePageIndex := 0;
 fraParaTipoDato.Clave := 'TDAT';
 fraTipoDatoParametro.Clave  := 'TDAT';


 with fraProcesosDevengados do
 begin
    TableName   := 'EMI.IPD_PROCEDIMIENTODEVENGADO';
    FieldID     := 'pd_id';
    FieldCodigo := 'pd_codigo';
    FieldDesc   := 'pd_descripcion';
    FieldBaja   := 'pd_fechabaja';
    ExtraCondition := 'and 1=2';
    ShowBajas := false;
 end;

 with fraObservarComoEstados do
 begin
    TableName   := 'emi.iob_observacion';
    FieldID     := 'ob_id';
    FieldCodigo := 'ob_id';
    FieldDesc   := 'ob_descripcion';
    FieldBaja   := 'ob_fechabaja';
    ExtraCondition := 'and 1=2';
    ExtraFields := ', ob_rechazo as Rechazo ';
    ShowBajas := false;
  end;

  with fraObservarComoVariables do
  begin
    TableName   := 'emi.iob_observacion';
    FieldID     := 'ob_id';
    FieldCodigo := 'ob_id';
    FieldDesc   := 'ob_descripcion';
    FieldBaja   := 'ob_fechabaja';
    ExtraCondition := 'and 1=2';
    ExtraFields := ', ob_rechazo as Rechazo ';
    ShowBajas := false;
  end;

  with fraObservaciones do
  begin
    TableName   := 'emi.iob_observacion';
    FieldID     := 'ob_id';
    FieldCodigo := 'ob_id';
    FieldDesc   := 'ob_descripcion';
    FieldBaja   := 'ob_fechabaja';
    ExtraCondition := 'and 1=2';
    ExtraFields := ', ob_rechazo as Rechazo ';
    ShowBajas := false;
  end;

end;

procedure TFrmAdministracionSeteo.pcFormulasChange(Sender: TObject);
begin
  case pcFormulas.ActivePageIndex of
  0 : begin

      end;
  1 : begin
      end;
  2 : begin
      end;
  3 : begin
        //fixme completar variables;
      end;
  4 : begin
        //fixme completar estados;
      end;
  end;
end;

procedure TFrmAdministracionSeteo.FormCreate(Sender: TObject);
begin
  Inicializar;
  
end;


procedure TFrmAdministracionSeteo.btnAceptarSeteoClick(Sender: TObject);
begin
  GuaradarSeteo;
end;

procedure TFrmAdministracionSeteo.GuaradarSeteo;
begin
  if not Validar then exit;
  try
    if FModoSeteo = meAlta then
    begin
      EjecutarSqlST('UPDATE emi.ise_seteo ise ' +
                    'SET ' +
                    '   se_fechavigenciadesde = ' + SqlDate(edFechaVigenciaDesde.Date) + ' ,' +
                    '   se_fechavigenciahasta = '  + SqlDate(edFechaVigenciaHasta.Date) + ' ,' +
                    '   se_activo = ''S'' ' +
                    ' where se_id = ' + SqlValue(FIdSeteo) );
    end else
    begin
      EjecutarSqlST('UPDATE emi.ise_seteo ise ' +
                    'SET ' +
                    '   se_fechavigenciadesde = ' + SqlDate(edFechaVigenciaDesde.Date) + ' ,' +
                    '   se_fechavigenciahasta = ' + SqlDate(edFechaVigenciaHasta.Date) + ' ,' +
                    '   se_usumodif = ' + SqlValue(Sesion.LoginName) + ' ,' +
                    '   se_fechamodif = SysDate,' +
                    '   se_activo = ''S'' ' +
                    ' where se_id = ' + SqlValue(FIdSeteo));
    end;
    CommitTrans(true);
    Close;
  except
    on E: Exception do
     raise Exception.Create('Error al guardar el seteo. ' + #13#10 + #13#10 + E.Message);
  end;
end;

function TFrmAdministracionSeteo.Validar: boolean;
begin
  result := true;
  VerificarMultiple(['Guardando Fórmula de Cálculo',
    edFechaVigenciaDesde, not edFechaVigenciaDesde.IsEmpty, 'Debe seleccionar Fecha Vigencia.',
    edFechaVigenciaHasta, edFechaVigenciaHasta.Date > edFechaVigenciaDesde.Date, 'La fecha de Fin de Vigencia debe ser menor que la de inicio de vigencia.']);
//  result := VerificarCarga(FIdSeteo) ;
end;


(*function TFrmAdministracionSeteo.VerificarCarga(AIdSeteo : Integer) : boolean;
begin
  result := true;
  if ValorSql('SELECT * FROM emi.ira_reglaaceptacionrechazo ' +
              ' WHERE ra_idseteo = ' +  SqlValue(AIdSeteo) +
              '   AND ra_idtipo  = ''DJ''  ', '0') = 0 then
  begin
    result := false;
    cmbTipo.ItemIndex := 0;
    CargarSegunTipo(0);
    pcFormulas.ActivePageIndex := 2;
    InvalidMsg(dbgReglasAceptacionRechazo,
              'Debe completar reglas de aceptación a nivel declaración jurada.',
              'Guardando Fórmula', MB_ICONERROR);
    exit;
  end;

  if ValorSql('SELECT * FROM emi.ira_reglaaceptacionrechazo '  +
              ' WHERE ra_idseteo = ' +  SqlValue(AIdSeteo) +
              '   AND ra_idtipo  = ''TB'' ', '0') = 0 then
  begin
    result := false;
    cmbTipo.ItemIndex := 1;
    CargarSegunTipo(1);
    pcFormulas.ActivePageIndex := 2;
    InvalidMsg(dbgReglasAceptacionRechazo,
              'Debe completar reglas de aceptación a nivel trabajador.',
              'Guardando Fórmula', MB_ICONERROR);
    exit;
  end;

  if ValorSql('SELECT * FROM emi.ist_seteoestado' +
              ' WHERE st_idseteo = ' +  SqlValue(AIdSeteo) +
              '   AND st_idtipo    = ''DJ'' ', '0') = 0 then
  begin
    result := false;
    cmbTipo.ItemIndex := 0;
    CargarSegunTipo(0);
    pcFormulas.ActivePageIndex := 1;
    InvalidMsg(dbgReglasAceptacionRechazo,
              'Debe calculos de estado a nivel declaración jurada.',
              'Guardando Fórmula', MB_ICONERROR);
    exit;
  end;

  if  ValorSql('SELECT * FROM emi.ist_seteoestado' +
                          ' WHERE st_idseteo = ' +  SqlValue(AIdSeteo) +
                          '   AND st_idtipo    = ''TB'' ', '0') = 0 then
  begin
    result := false;
    cmbTipo.ItemIndex := 1;
    CargarSegunTipo(1);
    pcFormulas.ActivePageIndex := 1;
    InvalidMsg(dbgReglasAceptacionRechazo,
              'Debe calculos de estado a nivel trabajador.',
              'Guardando Fórmula', MB_ICONERROR);
    exit;
  end;

  if ValorSql('SELECT * FROM emi.isv_seteovariable ' +
                          ' WHERE sv_idseteo = ' +  SqlValue(AIdSeteo) +
                          '   AND sv_idtipo    = ''TB'' ', '0') = 0 then
  begin
    result := false;
    cmbTipo.ItemIndex := 0;
    CargarSegunTipo(0);
    pcFormulas.ActivePageIndex := 1;
    InvalidMsg(dbgReglasAceptacionRechazo,
              'Debe completar formas de calculos de variables a nivel trabajador.',
              'Guardando Fórmula', MB_ICONERROR);
    exit;

  end;

  if ValorSql('SELECT * FROM emi.isv_seteovariable ' +
                          ' WHERE sv_idseteo = ' +  SqlValue(AIdSeteo) +
                          '   AND sv_idtipo    = ''DJ'' ', '0') = 0 then
  begin
    result := false;
    cmbTipo.ItemIndex := 1;
    CargarSegunTipo(1);
    pcFormulas.ActivePageIndex := 1;
    InvalidMsg(dbgReglasAceptacionRechazo,
              'Debe completar formas de calculos de variables a nivel trabajador.',
              'Guardando Fórmula', MB_ICONERROR);
     exit;
  end;
end;*)

// ------------------------------------------------------------------------- //
//            ESTADOS                                                        //
// ------------------------------------------------------------------------- //
procedure TFrmAdministracionSeteo.tbNuevaFormulaEstadoClick(
  Sender: TObject);
begin
  FModoResto := meAlta;
  LimpiarEstado;
  edFormulaEstados.Enabled := true;
  fpFormulasEstados.ShowModal;
end;

procedure TFrmAdministracionSeteo.tbEditarFormulaEstadoClick(
  Sender: TObject);
begin
  if sdqEstados.RecordCount > 0 then
  begin
    FId := sdqEstados.FieldByName('ST_ID').AsInteger;
    FModoResto := meModificacion;
    LimpiarEstado;
    CargarControlesEstado;
    edFormulaEstados.Enabled := true;
    fpFormulasEstados.ShowModal;
  end;
end;

procedure TFrmAdministracionSeteo.tbEliminarFormulaEstadoClick(
  Sender: TObject);
begin
  if (not sdqEstados.IsEmpty) and
      sdqEstados.FieldByName('st_fechabaja').IsNull and
      (MsgBox('¿Desea dar de baja el estado seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSqlST('update emi.ist_seteoestado ' +
                ' set st_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                '     st_fechabaja = Sysdate' +
                ' where st_id = ' + SqlValue(sdqEstados.FieldByName('st_id').asString));
    sdqEstados.Refresh;
  end;
end;

procedure TFrmAdministracionSeteo.LimpiarEstado;
begin
  edDescripcionEstado.Text := '';
  edCodigoEstado.Text := '';
  edFormulaEstados.Text := ' ';
end;

procedure TFrmAdministracionSeteo.CargarControlesEstado;
begin
  edDescripcionEstado.Text := sdqEstados.FieldByName('ST_DESCRIPCION').AsString;
  edCodigoEstado.Text := sdqEstados.FieldByName('ST_CODIGO').AsString;
  BlobSql('select ST_FORMADECALCULO FROM emi.ist_seteoestado ' +
          ' WHERE st_id = ' + SqlValue(sdqEstados.FieldByName('ST_ID').AsInteger),
          edFormulaEstados.Lines);
  if IsEmptyString(edFormulaEstados.Text) then
    edFormulaEstados.Lines.Add(' ');
end;

procedure TFrmAdministracionSeteo.btnAceptarFormulaEstadoClick(
  Sender: TObject);
begin
  GuardarEstado;
end;

procedure TFrmAdministracionSeteo.GuardarEstado;
begin
  VerificarMultiple(['Verificación de Formula.',
                      edDescripcionEstado, not IsEmptyString(edDescripcionEstado.Text), 'Debe completar una Descripción para el Estado.',
                      edCodigoEstado, not IsEmptyString(edCodigoEstado.Text), 'Debe completar un Código para el Estado.',
                      edCodigoEstado, not VerificarCodigoEstadoUnico(edCodigoEstado.Text), 'El código que está tratando de asignar ya existe.',
                      edFormulaEstados, not IsEmptyString(edFormulaEstados.Text), 'Debe completar un texto para la fórmula.']);


  ValidarConsulta(edFormulaEstados.Lines);

  if FModoResto = meAlta then
  begin
    FId := GetSecNextVal('emi.seq_ist_id');
    EjecutarSqlST('INSERT INTO emi.ist_seteoestado ' +
                ' (st_id, st_idseteo, st_idtipo, st_descripcion,  ' +
                '  st_codigo, st_usualta, st_fechaalta ) ' +
                '  VALUES (' +  SqlValue(FId) + ', ' +
                    SqlValue(FIdSeteo)  + ', ' +
                    SqlValue(GetTipoByIndex(cmbTipo.ItemIndex))   + ', ' +
                    SqlValue(edDescripcionEstado.Text)  + ', ' +
                    SqlValue(edCodigoEstado.Text) + ', ' +
                    SqlValue(Sesion.LoginName) + ', Sysdate )');
  end else
  begin
    EjecutarSqlST('update emi.ist_seteoestado ' +
                ' set st_descripcion = ' + SqlValue(edDescripcionEstado.Text)  + ', ' +
                '     st_codigo      = ' + SqlValue(edCodigoEstado.Text) +
                ' where st_id = ' + SqlValue(FId));
  end;

  SaveBlob('update emi.ist_seteoestado set ' +
           ' ST_FORMADECALCULO = :ST_FORMADECALCULO ' +
           ' where st_id = ' + SqlValue(FId), edFormulaEstados.Lines, tmNone);

  fpFormulasEstados.close;
  sdqEstados.Refresh;

  RecargarEstados;
end;

procedure TFrmAdministracionSeteo.RecargarEstados;
var
 b : TBookmark;
begin
  b := sdqEstados.GetBookmark;
  try
    sdqEstados.DisableControls;
    sdqEstados.First;

    cboEstadosDiponibles.Clear;
    while not sdqEstados.Eof do
    begin
       cboEstadosDiponibles.AddItem(sdqEstados.FieldByName('st_codigo').AsString + ' - ' + sdqEstados.FieldByName('st_descripcion').AsString,
                                    TObject(sdqEstados.FieldByName('st_id').AsInteger));
       sdqEstados.Next;
    end;

  finally
     sdqEstados.GotoBookmark(b);
     sdqEstados.FreeBookmark(b);
     sdqEstados.EnableControls;
  end;
end;


procedure TFrmAdministracionSeteo.ValidarConsulta(AConsulta : TStrings; ATipoDato: String = 'B'; ALongitud : Integer = 0);
var
 q : TSDQuery;
begin
  q := GetQuery('select * from dual');
  with TFormula.Create do
  try
      TipoDatoRetorno := ATipoDato;
      LongitudDatoRetorno := ALongitud;
      Formula.Text := AConsulta.text;
      Source := q;
      CheckSintaxis;
  finally
    Free;
    q.Free;
  end;
end;

function TFrmAdministracionSeteo.VerificarCodigoEstadoUnico(ACodigo : String) : boolean;
begin
  result := ValorSql('select count(*)  ' +
                     ' from emi.ist_seteoestado ' +
                     ' where ' +
                     '       st_id <> '    + SqlValue(FId) +
                     '   and st_codigo = ' + SqlValue(ACodigo), '0') <> '0';
end;

function TFrmAdministracionSeteo.GetTipoByIndex(AIndex : Integer) : String;
begin
  if AIndex = 0 then
       result := 'D'
  else result := 'T';
end;

procedure TFrmAdministracionSeteo.btnCancelarSeteoClick(Sender: TObject);
begin
  if (MessageBox(0, '¿Descarta todas las modificaciones?',
      'Seteo', MB_ICONQUESTION or MB_YESNO) = idYes) then
         Rollback(true);
end;

// ------------------------------------------------------------------------- //
//            VARIABLES                                                      //
// ------------------------------------------------------------------------- //
procedure TFrmAdministracionSeteo.tbNuevaFormulaVariableClick(
  Sender: TObject);
begin
  FModoResto := meAlta;
  LimpiarVariable;
  edFormulaVariable.Enabled := true;
  edCodigoVariable.Enabled := true;  
  fpFormulasVariables.ShowModal;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEditarFormulaVariableClick(
  Sender: TObject);
begin
  if sdqVariables.RecordCount > 0 then
  begin
    FId := sdqVariables.FieldByName('SV_ID').AsInteger;
    FModoResto := meModificacion;
    LimpiarVariable;
    CargarControlesVariable;
    edFormulaVariable.Enabled := true;
    edCodigoVariable.Enabled := true;
    fpFormulasVariables.ShowModal;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEliminarFormulaVariableClick(
  Sender: TObject);
begin
  if (not sdqVariables.IsEmpty) and
      sdqVariables.FieldByName('sv_fechabaja').IsNull and
      (MsgBox('¿Desea dar de baja la variable seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSqlST('update emi.isv_seteovariable ' +
                ' set sv_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                '     sv_fechabaja = Sysdate' +
                ' where sv_id = ' + SqlValue(sdqVariables.FieldByName('sv_id').asString));
    sdqVariables.Refresh;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.LimpiarVariable;
begin
  edDescripcionVariable.Text := '';
  edCodigoVariable.Text := '';
  edTamanio.Text := '';

  fraParaTipoDato.Codigo := '';
  edFormulaVariable.lines.Clear;
  edFormulaVariable.lines.Add(' ');
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.CargarControlesVariable;
begin
  EdDescripcionVariable.Text := sdqVariables.FieldByName('SV_DESCRIPCION').AsString;
  edCodigoVariable.Text := sdqVariables.FieldByName('SV_CODIGO').AsString;
  edTamanio.Text := sdqVariables.FieldByName('SV_tamanio').AsString;
  fraParaTipoDato.Codigo := sdqVariables.FieldByName('sv_tipoparametro').AsString;

  BlobSql('select SV_FORMADECALCULO FROM emi.isv_seteovariable ' +
          ' WHERE sv_id = ' + SqlValue(sdqVariables.FieldByName('SV_ID').AsInteger),
          edFormulaVariable.Lines);

  if IsEmptyString(edFormulaVariable.Text) then edFormulaVariable.Text := ' ';
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.btnAceptarFormulaVariableClick(
  Sender: TObject);
begin
    GuardarVariable;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.GuardarVariable;
begin
  VerificarMultiple(['Verificación de Formula de Variable.',
                      EdDescripcionVariable, not IsEmptyString(EdDescripcionVariable.Text), 'Debe completar una Descripción para la Variable.',
                      edCodigoVariable, not IsEmptyString(edCodigoVariable.Text), 'Debe completar un Código para la Variable.',
                      edCodigoVariable, not VerificarCodigoVariableUnico(edCodigoVariable.Text), 'El código que está tratando de asignar ya existe.',
                      edFormulaVariable, not IsEmptyString(edFormulaVariable.Text), 'Debe completar un texto para la fórmula de Variable.',
                      fraParaTipoDato, fraParaTipoDato.IsSelected, 'Debe seleccionar un tipo de dato para la Variable.',
                      edTamanio, VerificarLongitudVariable, 'Debe especificar una longitud para la Variable.']);

  ValidarConsulta(edFormulaVariable.Lines, fraParaTipoDato.Codigo, StrToInt(edTamanio.Text));


  if FModoResto = meAlta then
  begin
    FId := GetSecNextVal('emi.seq_isv_id');
    EjecutarSqlST('INSERT INTO emi.isv_seteovariable ' +
                ' (sv_id, sv_idseteo, sv_idtipo, sv_tipoparametro, sv_descripcion,  ' +
                '  sv_codigo, sv_tamanio, sv_usualta, sv_fechaalta ) ' +
                '  VALUES (' +  SqlValue(FId) + ', ' +
                    SqlValue(FIdSeteo)  + ', ' +
                    SqlValue(GetTipoByIndex(cmbTipo.ItemIndex))   + ', ' +
                    SqlValue(fraParaTipoDato.Codigo) + ', ' +
                    SqlValue(EdDescripcionVariable.Text)  + ', ' +
                    SqlValue(edCodigoVariable.Text) + ', ' +
                    SqlValue(edTamanio.Text)  + ', ' +
                    SqlValue(Sesion.LoginName) + ', Sysdate )');
  end else
  begin
    EjecutarSqlST('update emi.isv_seteovariable ' +
                ' set sv_descripcion   = ' + SqlValue(EdDescripcionVariable.Text)  + ', ' +
                '     sv_tipoparametro = ' + SqlValue(fraParaTipoDato.Codigo) + ', ' +
                '     sv_tamanio       = ' + SqlValue(edTamanio.Text)  + ', ' +
                '     sv_codigo        = ' + SqlValue(edCodigoVariable.Text) +
                ' where sv_id = ' + SqlValue(FId));
  end;

  SaveBlob('update emi.isv_seteovariable ' +
           '   set SV_FORMADECALCULO = :SV_FORMADECALCULO ' +
           ' where sv_id = ' + SqlValue(FId), edFormulaVariable.Lines, tmNone);


  fpFormulasVariables.close;
  sdqVariables.Refresh;

  RecargarVariables;
end;
{------------------------------------------------------------------------------}
function TFrmAdministracionSeteo.VerificarLongitudVariable: boolean;
begin

  case ArrayPos(fraParaTipoDato.Codigo, TIPO_DATOS) of
    TD_FIX_STRING, TD_VAR_STRING, TD_INTEGER, TD_LONG:
    begin
      if StrToInt(edTamanio.Text) > 0 then
           result := true
      else result := false;
    end;
  else
    result := true;
  end;

end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.RecargarVariables;
var
 b : TBookmark;
begin
  b := sdqVariables.GetBookmark;
  try
    sdqVariables.DisableControls;
    sdqVariables.First;

    cboVariables.Clear;
    while not sdqVariables.Eof do
    begin
       cboVariables.AddItem(sdqVariables.FieldByName('sv_codigo').AsString + ' - ' + sdqVariables.FieldByName('sv_descripcion').AsString,
                            TObject(TTipoVariable.Create(
                                     sdqVariables.FieldByName('SV_ID').AsInteger ,
                                     sdqVariables.FieldByName('SV_TIPOPARAMETRO').AsString,
                                     sdqVariables.FieldByName('SV_TAMANIO').AsInteger
                                     )));

       sdqVariables.Next;
    end;
  finally
     sdqVariables.GotoBookmark(b);
     sdqVariables.FreeBookmark(b);
     sdqVariables.EnableControls;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmAdministracionSeteo.VerificarCodigoVariableUnico(ACodigo : String) : boolean;
begin
  result := ValorSql('select count(*)  ' +
                     ' from emi.isv_seteovariable ' +
                     ' where sv_codigo = ' + SqlValue(ACodigo) +
                     '   and sv_id    <> ' + SqlValue(FId), '0') <> '0';
end;
{------------------------------------------------------------------------------}



// ------------------------------------------------------------------------- //
// ------------------------------------------------------------------------- //
//            REGLAS                                                      //
// ------------------------------------------------------------------------- //
procedure TFrmAdministracionSeteo.tbNuevaReglasAceptacionRechazoClick(
  Sender: TObject);
begin
  FModoResto := meAlta;
  LimpiarRegla;
  edFormulaReglaAceptacionYRechazo.Enabled := true;
  fpReglasAceptaRechazo.ShowModal;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEditarReglasAceptacionRechazoClick(
  Sender: TObject);
begin
  if sdqReglasAceptacionRechazo.RecordCount > 0 then
  begin
    FId := sdqReglasAceptacionRechazo.FieldByName('RA_ID').AsInteger;
    FModoResto := meModificacion;
    LimpiarRegla;
    CargarControlesRegla;
    edFormulaReglaAceptacionYRechazo.Enabled := true;
    fpReglasAceptaRechazo.ShowModal;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEliminarReglasAceptacionRechazoClick(
  Sender: TObject);
begin
  if (not sdqReglasAceptacionRechazo.IsEmpty) and
      sdqReglasAceptacionRechazo.FieldByName('ra_fechabaja').IsNull and
      (MsgBox('¿Desea dar de baja la regla seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSqlST('update emi.ira_reglaaceptacionrechazo ' +
                ' set ra_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                '     ra_fechabaja = Sysdate' +
                ' where ra_id = ' + SqlValue(sdqReglasAceptacionRechazo.FieldByName('ra_id').asString));
    sdqReglasAceptacionRechazo.Refresh;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.btnAceptarReglaClick(Sender: TObject);
begin
    GuardarRegla;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.LimpiarRegla;
begin
  edDescripcionReglaAceptacion.Text     := '';
  edCodigoReglaAceptacion.Text          := '';
  edFormulaReglaAceptacionYRechazo.Text := ' ';
  fraObservaciones.Codigo := '';
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.CargarControlesRegla;
begin
  edDescripcionReglaAceptacion.Text := sdqReglasAceptacionRechazo.FieldByName('RA_DESCRIPCION').AsString;
  edCodigoReglaAceptacion.Text      := sdqReglasAceptacionRechazo.FieldByName('RA_CODIGO').AsString;
  fraObservaciones.Codigo           := sdqReglasAceptacionRechazo.FieldByName('RA_IDOBSERVACION').AsString;

  BlobSql('select ra_formula FROM emi.ira_reglaaceptacionrechazo ' +
          ' WHERE ra_id = ' + SqlValue(sdqReglasAceptacionRechazo.FieldByName('RA_ID').AsInteger),
          edFormulaReglaAceptacionYRechazo.Lines);
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.GuardarRegla;
begin
  VerificarMultiple(['Verificación de la Regla.',
                      edDescripcionReglaAceptacion, not IsEmptyString(edDescripcionReglaAceptacion.Text), 'Debe completar una Descripción para la Regla.',
                      edCodigoReglaAceptacion, not IsEmptyString(edCodigoReglaAceptacion.Text), 'Debe completar un Código para la Regla.',
                      edCodigoReglaAceptacion, not VerificarCodigoReglaUnico(edCodigoReglaAceptacion.Text), 'El código que está tratando de asignar ya existe.',
                      edFormulaReglaAceptacionYRechazo, not IsEmptyString(edFormulaReglaAceptacionYRechazo.Text), 'Debe completar un texto para la fórmula de Regla.',
                      fraObservaciones, fraObservaciones.IsSelected, 'Debe seleccionar una observación a asignar en caso de que el resultado de la fórmula sea VERDADERO.']);
  ValidarConsulta(edFormulaReglaAceptacionYRechazo.Lines);

  if FModoResto = meAlta then
  begin
    FId := GetSecNextVal('emi.seq_ira_id');
    EjecutarSqlST('INSERT INTO emi.ira_reglaaceptacionrechazo ' +
                ' (ra_id, ra_idseteo, ra_idtipo, ra_codigo, ra_descripcion,   ' +
                '  ra_idobservacion, ra_usualta, ra_fechaalta ) ' +
                '  VALUES (' +  SqlValue(FId) + ', ' +
                    SqlValue(FIdSeteo)  + ', ' +
                    SqlValue(GetTipoByIndex(cmbTipo.ItemIndex))   + ', ' +
                    SqlValue(edCodigoReglaAceptacion.Text)  + ', ' +
                    SqlValue(edDescripcionReglaAceptacion.Text)  + ', ' +
                    SqlValue(fraObservaciones.Codigo)  + ', ' +
                    SqlValue(Sesion.LoginName) + ', Sysdate )');
  end else
  begin
    EjecutarSqlST('update emi.ira_reglaaceptacionrechazo ' +
                ' set ra_descripcion   = ' + SqlValue(edDescripcionReglaAceptacion.Text)  + ', ' +
                '     ra_codigo        = ' + SqlValue(edCodigoReglaAceptacion.Text)  + ', ' +
                '     ra_idobservacion = ' + SqlValue(fraObservaciones.Codigo) +
                ' where ra_id = ' + SqlValue(FId));
  end;

  SaveBlob('update EMI.IRA_REGLAACEPTACIONRECHAZO ' +
           '   set RA_FORMULA = :RA_FORMULA ' +
           ' where RA_ID = ' + SqlValue(FId), edFormulaReglaAceptacionYRechazo.Lines, tmNone);

  fpReglasAceptaRechazo.close;
  sdqReglasAceptacionRechazo.Refresh;
end;
{------------------------------------------------------------------------------}
function TFrmAdministracionSeteo.VerificarCodigoReglaUnico(ACodigo : String) : boolean;
begin
  result := ValorSql('select count(*)  ' +
                     ' from emi.ira_reglaaceptacionrechazo ' +
                     ' where ra_codigo = ' + SqlValue(ACodigo) +
                     '   and ra_id <> ' + SqlValue(FId), '0') <> '0';
end;
{------------------------------------------------------------------------------}




// ------------------------------------------------------------------------- //
//            REGLAS ESTADOS                                                 //
// ------------------------------------------------------------------------- //
procedure TFrmAdministracionSeteo.tbNuevaReglaParaEstadoClick(
  Sender: TObject);
begin
  FModoResto := meAlta;
  LimpiarReglaParaEstado;
  gbEdicionReglaEstados.Enabled := true;
  cboEstadosDiponibles.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEditarReglaParaEstadoClick(
  Sender: TObject);
begin
  if sdqObservacionEstado.RecordCount > 0 then
  begin
    FId := sdqObservacionEstado.FieldByName('OE_ID').AsInteger;
    FModoResto := meModificacion;
    LimpiarReglaParaEstado;
    gbEdicionReglaEstados.Enabled := True;
    CargarControlesReglaParaEstado;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEliminarReglaParaEstadoClick(
  Sender: TObject);
begin
  if (not sdqObservacionEstado.IsEmpty) and
      sdqObservacionEstado.FieldByName('oe_fechabaja').IsNull and
      (MsgBox('¿Desea dar de baja la regla seleccionada?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSqlST('update emi.ioe_observacionestado ' +
                ' set oe_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                '     oe_fechabaja = Sysdate' +
                ' where oe_id = ' + SqlValue(sdqObservacionEstado.FieldByName('oe_id').asString));
    sdqObservacionEstado.Refresh;
  end;
  gbEdicionReglaEstados.Enabled := false;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.LimpiarReglaParaEstado;
begin
  cboEstadosDiponibles.ItemIndex := -1;
  cmbSeteoEstado.ItemIndex := -1;
  cboRelacionVariable.ItemIndex := -1;
  fraObservarComoEstados.Codigo := '';

  if Assigned(ParametroUnario) then FreeAndNil(ParametroUnario);
  if Assigned(ParametroBinario) then FreeAndNil(ParametroBinario);

end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.CargarControlesReglaParaEstado;
begin
  SetItemIndexComboById(cboEstadosDiponibles, sdqObservacionEstado.FieldByName('st_id').AsInteger);
  cmbSeteoEstado.ItemIndex       := ArrayPos(sdqObservacionEstado.FieldByName('oe_relacion').AsString, ['S', 'N']);
  fraObservarComoEstados.Codigo  := sdqObservacionEstado.FieldByName('oe_idobservacion').AsString;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.btnAgregarClick(Sender: TObject);
begin
  GuardarReglaEstado;
  LimpiarReglaParaEstado;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.GuardarReglaEstado;
begin
  VerificarMultiple(['Verificación de la Regla de Estado.',
                      cboEstadosDiponibles, cboEstadosDiponibles.ItemIndex > -1, 'Debe indicar un nombre de estado.',
                      cmbSeteoEstado, cmbSeteoEstado.ItemIndex > -1, 'Debe indicar un valor para el estado.',
                      fraObservarComoEstados, fraObservarComoEstados.IsSelected, 'Debe indicar una observación sobre el estado']);
  if FModoResto = meAlta then
  begin
    FId := GetSecNextVal('emi.seq_ioe_id');
    EjecutarSqlST('INSERT INTO emi.ioe_observacionestado ' +
                  '(oe_id, oe_idseteo, oe_idtipo, oe_idseteoestado, oe_idobservacion, oe_relacion, ' +
                  ' oe_usualta, oe_fechaalta)        ' +
                  '  VALUES (' +  SqlValue(FId) + ', ' +
                    SqlValue(FIdSeteo)  + ', ' +
                    SqlValue(GetTipoByIndex(cmbTipo.ItemIndex))   + ', ' +
                    SqlValue(Integer(cboEstadosDiponibles.Items.Objects[cboEstadosDiponibles.ItemIndex]))  + ', ' +
                    SqlValue(fraObservarComoEstados.Codigo)  + ', ' +
                    SqlValue(Copy('SN', cmbSeteoEstado.ItemIndex + 1, 1))  + ', ' +
                    SqlValue(Sesion.LoginName) + ', Sysdate )');
  end else
  begin
    EjecutarSqlST('update emi.ioe_observacionestado ' +
                ' set oe_idseteoestado   = ' + SqlValue(Integer(cboEstadosDiponibles.Items.Objects[cboEstadosDiponibles.ItemIndex]))  + ', ' +
                '     oe_idobservacion   = ' + SqlValue(fraObservarComoEstados.Codigo)  + ', ' +
                '     oe_relacion        = ' + SqlValue(Copy('SN', cmbSeteoEstado.ItemIndex + 1, 1)) +
                ' where oe_id = ' + SqlValue(FId) );
  end;

  sdqObservacionEstado.Refresh;
  gbEdicionReglaEstados.Enabled := false;
end;
{-------------------------------------------------------------------------------}


// ------------------------------------------------------------------------- //
//            REGLAS VARIABLES                                               //
// ------------------------------------------------------------------------- //
procedure TFrmAdministracionSeteo.tbNuevaReglaVariableClick(
  Sender: TObject);
begin
  FModoResto := meAlta;
  LimpiarReglaParaVariables;
  gbEdicionReglaVariables.Enabled := true;
  cboVariables.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEditarReglaParaVariableClick(
  Sender: TObject);
begin
  if sdqObservacionVariable.RecordCount > 0 then
  begin
    FId := sdqObservacionVariable.FieldByName('OV_ID').AsInteger;
    FModoResto := meModificacion;
    LimpiarReglaParaVariables;
    gbEdicionReglaVariables.Enabled := True;
    CargarControlesReglaParaVariable;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.tbEliminarReglaParaVariableClick(
  Sender: TObject);
begin
  if (not sdqObservacionVariable.IsEmpty) and
      sdqObservacionVariable.FieldByName('ov_fechabaja').IsNull and
      (MsgBox('¿Desea dar de baja la regla seleccionada?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSqlST('update emi.iov_observacionvariable ' +
                ' set ov_usubaja = ' + SqlValue(Sesion.LoginName) + ',' +
                '     ov_fechabaja = Sysdate' +
                ' where ov_id = ' + SqlValue(sdqObservacionVariable.FieldByName('ov_id').asString));
    sdqObservacionVariable.Refresh;
  end;

  gbEdicionReglaVariables.Enabled := false;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.LimpiarReglaParaVariables;
begin
  cboVariables.ItemIndex := -1;
  cboRelacionVariable.ItemIndex := -1;
  fraObservarComoVariables.Codigo := '';

end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.CargarControlesReglaParaVariable;
begin
  self.SetItemIndexComboByIdTipo(cboVariables, sdqObservacionVariable.FieldByName('sv_id').AsInteger);
  cboRelacionVariable.ItemIndex       := ArrayPos(sdqObservacionVariable.FieldByName('ov_relacion').AsString, RELACIONES);
  fraObservarComoVariables.Codigo  := sdqObservacionVariable.FieldByName('ov_idobservacion').AsString;

  SetearPorRelaciones;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.SetearPorRelaciones;
var
  AClass: TWinControlClass;
  Tipo : TTipoVariable;
begin
   if Assigned(ParametroUnario) then FreeAndNil(ParametroUnario);
   if Assigned(ParametroBinario) then FreeAndNil(ParametroBinario);

   if (cboVariables.ItemIndex = -1) or (cboRelacionVariable.ItemIndex = -1) then exit;
   Tipo := TTipoVariable(cboVariables.Items.Objects[cboVariables.ItemIndex]);

   if Assigned(Tipo) then
   begin
    AClass := GetParamEditorClass(Tipo.Tipo);

    if (ParametroUnario = nil) or (ParametroUnario.ClassType <> AClass) then
    begin
      ParametroUnario := AClass.Create(Self);
      ParamInitializeEditor(ParametroUnario, '', Tipo.Longitud);

      with ParametroUnario do
      begin
        Left      := 430;
        Top       := 12;
        Parent    := gbEdicionReglaVariables;
        TabOrder  := cboRelacionVariable.TabOrder + 1;
        Width     := 70;
      end;
    end;

    if GetRelacionBinariaByIndex(cboRelacionVariable.ItemIndex) then
    begin
      ParametroBinario := AClass.Create(Self);
      ParamInitializeEditor(ParametroBinario, '', Tipo.Longitud);

      with ParametroBinario do
      begin
        Left     := 520;
        Top      := 12;
        Parent   := gbEdicionReglaVariables;
        TabOrder := ParametroUnario.TabOrder + 1;
        Width    := 70;
      end;
    end;
  end;

end;
{-------------------------------------------------------------------------------}
function TFrmAdministracionSeteo.GetRelacionBinariaByIndex(AIndex : integer) : boolean;
begin
  result := false;
  if AIndex > -1 then
    if  (TIPORELACION[cboRelacionVariable.ItemIndex] = 2 ) then
      result := true;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.GuardarReglaVariables;
var
  Sql : TSql;
begin
  VerificarMultiple(['Verificación de la Regla de Variables.',
                      cboVariables, cboVariables.ItemIndex > -1, 'Debe indicar una variable.',
                      cboRelacionVariable, cboRelacionVariable.ItemIndex > -1, 'Debe a relación a establecer con la variable.',
                      fraObservarComoVariables, fraObservarComoVariables.IsSelected, 'Debe indicar una observación sobre el la variable de cumplirse la condición.']);

  Sql := TSql.Create('emi.iov_observacionvariable');
  if FModoResto = meAlta then
  begin
    Sql.SqlType := stInsert;
    FId := GetSecNextVal('emi.seq_iov_id');
    Sql.PrimaryKey.Add('OV_ID', FId);
    Sql.Fields.Add('OV_IDSETEO', FIdSeteo);
    Sql.Fields.Add('OV_IDTIPO',  GetTipoByIndex(cmbTipo.ItemIndex));
    Sql.Fields.Add('OV_FECHAALTA', SQL_ACTUALDATE, False);
    Sql.Fields.Add('OV_USUALTA',   Sesion.LoginName);
  end else
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('OV_ID', FId);
    Sql.Fields.Add('OV_FECHAMODIF', SQL_ACTUALDATE, False);
    Sql.Fields.Add('OV_USUMODIF',   Sesion.LoginName);
  end;



  Sql.Fields.Add('OV_IDSETEOVARIABLE', TTipoVariable(cboVariables.Items.Objects[cboVariables.ItemIndex]).Id);
  Sql.Fields.Add('OV_RELACION', RELACIONES[cboRelacionVariable.ItemIndex]);
  Sql.Fields.Add('OV_IDOBSERVACION', fraObservarComoVariables.Codigo);


  if Assigned(ParametroUnario) then
    Sql.Fields.Add('OV_VALORUNARIO', GetParamEditorValue(ParametroUnario));

  if Assigned(ParametroBinario) then
    Sql.Fields.Add('OV_VALORBINARIO', GetParamEditorValue(ParametroBinario));

  EjecutarSqlST(Sql.Sql);

  sdqObservacionVariable.Refresh;
  gbEdicionReglaEstados.Enabled := false;
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.AceptarReglaDeVariableClick(
  Sender: TObject);
begin
  GuardarReglaVariables;
  LimpiarReglaParaVariables
end;
{-------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.cboRelacionVariableChange(
  Sender: TObject);
begin
  SetearPorRelaciones;
end;
{-------------------------------------------------------------------------------}

{ TTipoVariable }

constructor TTipoVariable.Create(AId: Integer; ATipo: string; ALongitud : Integer);
begin
  inherited Create;
  FId := AId;
  FTipo := ATipo;
  FLongitud := ALongitud;
end;

procedure TFrmAdministracionSeteo.cboVariablesChange(Sender: TObject);
begin
  SetearPorRelaciones;
end;

procedure TFrmAdministracionSeteo.tbAgregarProcedimientoDevengadoClick(
  Sender: TObject);
begin
  fpProcedimientoAAplicar.ShowModal;
end;


procedure TFrmAdministracionSeteo.SetearPorRelacionesProcedimiento;
var
  AClass: TWinControlClass;
  Tipo : TTipoVariable;
begin
   if Assigned(ParametroUnario) then FreeAndNil(ParametroUnario);
   if Assigned(ParametroBinario) then FreeAndNil(ParametroBinario);

   if (cboVariablesProcedimientosCalculo.ItemIndex = -1) or
      (cboRelacionVariableProcedimiento.ItemIndex = -1) then exit;
   Tipo := TTipoVariable(cboVariablesProcedimientosCalculo.Items.Objects[
                          cboVariablesProcedimientosCalculo.ItemIndex]);

   if Assigned(Tipo) then
   begin
    AClass := GetParamEditorClass(Tipo.Tipo);

    if (ParametroUnario = nil) or (ParametroUnario.ClassType <> AClass) then
    begin
      ParametroUnario := AClass.Create(Self);
      ParamInitializeEditor(ParametroUnario, '', Tipo.Longitud);

      with ParametroUnario do
      begin
        Left      := 430;
        Top       := 12;
        Parent    := gbEdicionReglaVariablesProcedimiento;
        TabOrder  := cboRelacionVariableProcedimiento.TabOrder + 1;
        Width     := 70;
      end;
    end;

    if GetRelacionBinariaByIndex(cboRelacionVariableProcedimiento.ItemIndex) then
    begin
      ParametroBinario := AClass.Create(Self);
      ParamInitializeEditor(ParametroBinario, '', Tipo.Longitud);

      with ParametroBinario do
      begin
        Left     := 520;
        Top      := 12;
        Parent   := gbEdicionReglaVariablesProcedimiento;
        TabOrder := ParametroUnario.TabOrder + 1;
        Width    := 70;
      end;
    end;
  end;

end;


procedure TFrmAdministracionSeteo.cboRelacionVariableProcedimientoChange(
  Sender: TObject);
begin
  SetearPorRelacionesProcedimiento;
end;

procedure TFrmAdministracionSeteo.cboVariablesProcedimientosCalculoChange(
  Sender: TObject);
begin
  SetearPorRelacionesProcedimiento;
end;

procedure TFrmAdministracionSeteo.tbAgregarProcedimientoCalculoClick(Sender: TObject);
begin
  fpProcedimientoCalculoDevengado.ShowModal;
end;

procedure TFrmAdministracionSeteo.Button3Click(Sender: TObject);
begin
  fpProcedimientoCalculoDevengado.Close;
end;



procedure TFrmAdministracionSeteo.tbEditarProcedimientoDevengadoClick(
  Sender: TObject);
begin
 fpProcedimientoAAplicar.showmodal;
end;


procedure TFrmAdministracionSeteo.CargarParametros(Index : Integer);
var
	MenuItem: TMenuItem;
	i : Integer;
begin
	pmnuCampos.Items.Clear;

  case Index of
  0 : begin
        for i := Low(FIELDS_DECLARACION) to High(FIELDS_DECLARACION) do
        begin
          MenuItem := TMenuItem.Create(pmnuCampos);
          MenuItem.Caption := FIELDS_DECLARACION[i];
          MenuItem.OnClick := pmnuCamposClick;
          pmnuCampos.Items.Add(MenuItem);
        end;
      end;
  1 : begin
        for i := Low(FIELDS_TRABAJADOR) to High(FIELDS_TRABAJADOR) do
        begin
          MenuItem := TMenuItem.Create(pmnuCampos);
          MenuItem.Caption := FIELDS_TRABAJADOR[i];
          MenuItem.OnClick := pmnuCamposClick;
          pmnuCampos.Items.Add(MenuItem);
        end;
      end;
  end;

  tbCamposDisponiblesEstados.Enabled := pmnuCampos.Items.Count > 0;
  tbCamposDisponiblesVariables.Enabled := pmnuCampos.Items.Count > 0;
  tbCamposDisponiblesReglas.Enabled := pmnuCampos.Items.Count > 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.pmnuCamposClick(Sender: TObject);
const
	PAG_ESTADO     		  = 0;
	PAG_VARIABLES       = 1;
	PAG_REGLAS          = 2;
begin
 case pcFormulas.ActivePageIndex of
	PAG_ESTADO		:
		edFormulaEstados.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
	PAG_VARIABLES :
		edFormulaVariable.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
	PAG_REGLAS   	:
		edFormulaReglaAceptacionYRechazo.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
 end;
end;

function TFrmAdministracionSeteo.IsBaja(sdqConsultaActiva: TSDquery; sFieldBaja : String ): Boolean;
begin
  Result := (sFieldBaja <> '') and sdqConsultaActiva.Active and ( not sdqConsultaActiva.FieldByName( sFieldBaja ).IsNull);
end;

{----------------------------------------------------------------------------------------------------------------------}

procedure TFrmAdministracionSeteo.dbgEstadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
 if IsBaja( (( Sender as tjvDbGrid ).DataSource.DataSet) as TSDQuery , 'FECHABAJA') Then
    AFont.Color := clRed;
end;

procedure TFrmAdministracionSeteo.dbgEstadosDblClick(Sender: TObject);
begin
  tbEditarFormulaEstado.Click ;
end;

procedure TFrmAdministracionSeteo.dbgVariablesDblClick(Sender: TObject);
begin
  tbEditarFormulaVariable.Click ;
end;

procedure TFrmAdministracionSeteo.dbgReglasAceptacionRechazoDblClick(
  Sender: TObject);
begin
  tbEditarReglasAceptacionRechazo.Click ;
end;

procedure TFrmAdministracionSeteo.dbgReglasEstadosDblClick(
  Sender: TObject);
begin
  tbEditarReglaParaEstado.Click ;
end;

procedure TFrmAdministracionSeteo.dbgReglasParaVariablesDblClick(
  Sender: TObject);
begin
  tbEditarReglaParaVariable.Click;
end;

procedure TFrmAdministracionSeteo.dbgProcedimientoDevengadoDblClick(
  Sender: TObject);
begin
  tbEditarProcedimientoDevengado.Click;
end;

procedure TFrmAdministracionSeteo.DBGrid5DblClick(Sender: TObject);
begin
  tbEditarReglasAceptacionRechazo.Click;
end;

procedure TFrmAdministracionSeteo.DBGrid2DblClick(Sender: TObject);
begin
  tbEditarProcedimientoDevengado.Click;
end;

procedure TFrmAdministracionSeteo.DBGrid6DblClick(Sender: TObject);
begin
  tbEditarParametro.Click;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TFrmAdministracionSeteo.SetItemIndexComboByIdTipo(ACombo : TComboBox; AId : Integer);
var
 i : integer;
begin
  Acombo.ItemIndex := -1;

  for i := 0 to ACombo.Items.Count - 1 do
   if  Assigned(ACombo.Items.Objects[i])
   and ACombo.Items.Objects[0].ClassType.ClassNameIs('TTipoVariable')
   and (  ((ACombo.Items.Objects[i]) as TTipoVariable ).Id = AId)
   then
   begin
       Acombo.ItemIndex := i;
       break;
   end;
end;

procedure TFrmAdministracionSeteo.tsReglasEstadosShow(Sender: TObject);
begin
  gbEdicionReglaEstados.Enabled := False;
end;


procedure TFrmAdministracionSeteo.tsReglasVariablesShow(Sender: TObject);
begin
  gbEdicionReglaVariables.Enabled := False;
end;

procedure TFrmAdministracionSeteo.FreeCombo(ACombo : TComboBox);
var
 i : integer;
begin
  for i := 0 to ACombo.Items.Count - 1 do
  begin
    if Assigned(ACombo.Items.Objects[i]) then
       ACombo.Items.Objects[i].Free;
  end;
end;


end.

