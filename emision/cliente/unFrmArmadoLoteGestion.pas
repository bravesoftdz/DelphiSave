unit unFrmArmadoLoteGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, PatternEdit, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, PeriodoPicker, StdCtrls, unArtFrame, unFraCodigoDescripcion,
  ExtCtrls, ComCtrls, ToolWin, FormPanel, JvExExtCtrls, JvNetscapeSplitter,
  JvExComCtrls, JvStatusBar, ToolEdit, CurrEdit, CardinalEdit,
  unfraCtbTablas, DB, SDEngine, unFraCriterios, strFuncs, AnsiSql, Periodo, unDmPrincipal,
  ExComboBox, unFuncionesEmision, unArtDBAwareFrame;

type
  TFrmArmadoLoteGestion = class(TForm)
    cbEstadoCuenta: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbPropiedades: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviarMail: TToolButton;
    tbSalir: TToolButton;
    pnFiltros: TPanel;
    dbgContratos: TArtDBGrid;
    btnAsignarALote: TToolButton;
    tbDesasignarDelLote: TToolButton;
    tbLotes: TToolButton;
    tbRealizarGestion: TToolButton;
    ToolButton13: TToolButton;
    od: TOpenDialog;
    btnAnexarDesde: TToolButton;
    ToolButton26: TToolButton;
    sb: TJvStatusBar;
    splitter: TJvNetscapeSplitter;
    pgGestion: TPageControl;
    ts: TTabSheet;
    GroupBox3: TGroupBox;
    dbgPresentaciones: TArtDBGrid;
    GroupBox4: TGroupBox;
    dbgTrabajadores: TArtDBGrid;
    tsObservaciones: TTabSheet;
    gbObservaciones: TGroupBox;
    dbgGestion: TArtDBGrid;
    gbLoteGestion: TGroupBox;
    gbAccionesTomadas: TGroupBox;
    dbgAccionesTomadas: TArtDBGrid;
    cb: TCoolBar;
    tbObservaciones: TToolBar;
    ToolButton16: TToolButton;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    tbMostrarGestion: TToolButton;
    tsCriteriosDefinidos: TTabSheet;
    CoolBar: TCoolBar;
    tbEstadoCuenta: TToolBar;
    tbRefrescarEstadoCuenta: TToolButton;
    ToolButton5: TToolButton;
    tbOrdenartbRefrescarEstadoCuenta: TToolButton;
    tbImprimirtbRefrescarEstadoCuenta: TToolButton;
    tbExportartbRefrescarEstadoCuenta: TToolButton;
    dbgEstadoCuenta: TArtDBGrid;
    TabSheet2: TTabSheet;
    dbgNotasPresentadas: TArtDBGrid;
    sdqCriterios: TSDQuery;
    dsCriterios: TDataSource;
    ToolButton2: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    sdqPresentaciones: TSDQuery;
    dsPresentaciones: TDataSource;
    sdqTrabajadores: TSDQuery;
    dsTrabajadores: TDataSource;
    sdqGestion: TSDQuery;
    dsGestion: TDataSource;
    sdqLotesGestion: TSDQuery;
    dsLotesGestion: TDataSource;
    sdqAccionesTomadas: TSDQuery;
    dsAccionesTomadas: TDataSource;
    lblNroLote: TLabel;
    edLote: TEdit;
    lblTamanio: TLabel;
    edtTamanio: TEdit;
    edtGestorEmision: TEdit;
    lblGestorEmision: TLabel;
    pnLeyenda: TPanel;
    gbLeyenda: TGroupBox;
    lblReferenciaPeriodoRecalculo: TLabel;
    Bevel3: TBevel;
    Panel4: TPanel;
    Panel1: TPanel;
    lblTrabajadorActivo: TLabel;
    Panel2: TPanel;
    lbl: TLabel;
    Label1: TLabel;
    pnColorFondoPeriodoObservacion: TPanel;
    pcCriteriosParaDefinicion: TPageControl;
    tsCriteriosArmadoLote: TTabSheet;
    fraEdicionCriterios: TfraCriterios;
    tsCriteriosLibres: TTabSheet;
    gbDetalleBusqueda: TGroupBox;
    lblCondicionSuss: TLabel;
    lblCUITS: TLabel;
    lblHolding: TLabel;
    lblEjecutivo: TLabel;
    lblTrabajadores: TLabel;
    lblTrabajadoresHasta: TLabel;
    lblVendedor: TLabel;
    lblMasa: TLabel;
    lblMasaHasta: TLabel;
    lblDJAdeudadas: TLabel;
    lblDJAdeudadasHasta: TLabel;
    lblCantidadObservaciones: TLabel;
    lblCantidadObservacionesHasta: TLabel;
    lblObservado: TLabel;
    lblEstadoCuenta: TLabel;
    lblEstadoCuentaHasta: TLabel;
    lblPrima: TLabel;
    lblPrimaHasta: TLabel;
    edtCuits: TEdit;
    fraHolding: TfraCodigoDescripcion;
    edtTrabajadoresDesde: TPatternEdit;
    edtTrabajadoresHasta: TPatternEdit;
    fraEjecutivo: TfraCodigoDescripcion;
    fraVendedor: TfraCodigoDescripcion;
    edtMasaDesde: TPatternEdit;
    edtMasaHasta: TPatternEdit;
    edtDJAdeudadasDesde: TPatternEdit;
    edtDJAdeudadasHasta: TPatternEdit;
    edtCantidadObservacionesDesde: TPatternEdit;
    edtCantObservacionesHasta: TPatternEdit;
    fraObservado: TfraCodigoDescripcion;
    edtEstadoCuentaDesde: TPatternEdit;
    edtEstadoCuentaHasta: TPatternEdit;
    edtPrimaDesde: TPatternEdit;
    edtPrimaHasta: TPatternEdit;
    tbDesdeArchivo: TToolBar;
    tbAbrirArchivo: TToolButton;
    cbCondicionSuss: TExComboBox;
    gbGestion: TGroupBox;
    lblLote: TLabel;
    lblLoteHasta: TLabel;
    lblGestor: TLabel;
    lblTipoGestion: TLabel;
    fraGestor: TfraCodigoDescripcion;
    edtLoteDesde: TPatternEdit;
    edtLoteHasta: TPatternEdit;
    FraTipoGestion: TfraCodigoDescripcion;
    gbPeriodos: TGroupBox;
    StaticText1: TStaticText;
    chkEmpresasSinPresentacionPeriodo: TCheckBox;
    chkEmpresasSinEmisionRealPeriodo: TCheckBox;
    chkConObservacionesPeriodo: TCheckBox;
    chkConContratoDadoBajaPeriodo: TCheckBox;
    chkSinAsignarALoteGestion: TCheckBox;
    chkEmpresasObservacionesSalvadas: TCheckBox;
    ppDesde: TPeriodoPicker;
    ppHasta: TPeriodoPicker;
    procedure btnAdministrarClick(Sender: TObject);
    procedure btnAsignarALoteClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqPresentacionesAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgContratosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgPresentacionesGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
  private
    procedure ArmarConsultaLibre;
    procedure UtilizarCriterioDefinido;
    procedure AgregarContratosALote(AIdLote: integer);
    procedure RefrescarPresentaciones;
    procedure RefrescarTrabajadores;
    procedure RefrescarGestion;
    procedure ResfrescarLotesGestion;
    procedure RefrescarAccionesTomadas;
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses unfrmAdministracionLotes, unDmEmision, unfrmAdmistracionAccionesObservaciones,
  unfrmSeleccionLotes, unPrincipal;

{$R *.dfm}

procedure TFrmArmadoLoteGestion.btnAdministrarClick(Sender: TObject);
begin
    with TfrmAdministracionAccionesObservaciones.Create(self) do
    try
      ShowModal;
    finally
      free;
    end;
end;

procedure TFrmArmadoLoteGestion.btnAsignarALoteClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty
     and sdqPresentaciones.Active and not sdqPresentaciones.IsEmpty then
  begin
    if (sdqConsulta.FieldByName('Gestion').AsString <> 'S') then
    begin
      with TfrmSeleccionLote.Create(self) do
      try
         if (Showmodal = mrOK) and IsSelected then
           AgregarContratosALote(IdLoteSelecciondo);
      finally
        free;
      end;
    end
    else begin
      raise exception.create('Este período ya tiene un lote asignado.');
    end;
  end;
end;


procedure TFrmArmadoLoteGestion.AgregarContratosALote(AIdLote : integer);
begin
  do_asignarlote(AIdLote, sdqConsulta.FieldByName('contrato').AsInteger, sdqConsulta.FieldByName('Periodo').AsString);
end;

procedure TFrmArmadoLoteGestion.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  if pcCriteriosParaDefinicion.ActivePage = tsCriteriosLibres then
   ArmarConsultaLibre
  else UtilizarCriterioDefinido;
  sdqConsulta.Open;
end;

procedure TFrmArmadoLoteGestion.ArmarConsultaLibre;
var
  sFrom : string;
  sWhere : string;
  sSql   : string;
begin
  if IsEmptyString(ppDesde.Text) and
     IsEmptyString(ppHasta.Text) then
    raise exception.create('Debe indicar períodos cuando no se indica empresa.');


  if (cbCondicionSuss.ItemIndex <> -1) then
     sWhere := sWhere + ' AND em_suss = ' + SqlValue(cbCondicionSuss.Value);


  if chkEmpresasSinPresentacionPeriodo.Checked then
    sWhere := sWhere + ' and rp_idddjj is null ';

  if chkEmpresasSinEmisionRealPeriodo.Checked then
  begin
    sFrom  := sFrom  + ', emi.ide_devengado ide ';
    sWhere := sWhere + '  and ide.de_id = rp_iddevengado ' +
                       '  and de_idtipodevengado = ''R'' ';
  end;

  if chkConObservacionesPeriodo.Checked then
    sWhere := sWhere + ' and rp_cantidadobservaciones > 0 ';

  if fraEjecutivo.IsSelected then
    sWhere := sWhere + ' and co_codejecutivo = ' + SqlValue(fraEjecutivo.Codigo);

  if fraHolding.IsSelected then
    sWhere := sWhere + ' and em_idgrupoeconomico = ' + SqlValue(fraHolding.Value);

(*
  if fraSector.IsSelected then
    sWhere := sWhere + ' and em_sector = ' + SqlValue(fraSector.Codigo);
*)

  if not IsEmptyString(ppDesde.Text) and not IsEmptyString(ppHasta.Text) then
    sWhere := sWhere + ' AND (irp.rp_periodo between ' + SqlValue(ppDesde.Text)
                     +  ' AND ' + SqlValue(ppHasta.Text) + ' ) ';

  if chkConContratoDadoBajaPeriodo.Checked then
    sWhere := sWhere + ' AND (RP_COBERTURA = ''N'') ';

  if chkSinAsignarALoteGestion.Checked then
    sWhere := sWhere + ' AND NOT EXISTS ( ' +
                       '                   SELECT 1 ' +
                       '                   FROM emi.idj_ddjj, emi.ild_loteddjj ' +
                       '                   WHERE ld_idddjj = dj_id AND dj_id = rp_idddjj) ';


  if fraObservado.IsSelected then
  begin
    sFrom  := sFrom  + ', emi.ido_ddjjobservacion ido, emi.idj_ddjj idj ';
    sWhere := sWhere + '  and ido.do_idddjj = idj.dj_id ' +
                       '  and ido.do_idobservacion = ' + SqlValue(fraObservado.Codigo) +
                       '  and idj.dj_contrato = rp_contrato ' +
                       '  and idj.dj_periodo = rp_periodo ';
  end;

  if (trim(sWhere) = '') then sWhere:= sWhere + ' AND 1 = 2 ';

  sSql :=
  	'SELECT EM_CUIT CUIT, EM_NOMBRE MP_NOMBRE, CO_CONTRATO CONTRATO, RP_PERIODO PERIODO, CO_ESTADO MP_ESTADO,' +
    			' CO_FECHAAFILIACION MP_FAFILIACION, CO_VIGENCIADESDE MP_VIGENCIADESDE, CO_VIGENCIAHASTA MP_VIGENCIAHASTA,' +
          ' CO_MOTIVOALTA MP_MOTIVOALTA, lpad(co_idartanterior, 5, ''0'') MP_ARTANTERIOR, CO_FECHABAJA MP_FBAJA,' +
          ' CO_MOTIVOBAJA MP_MOTIVOBAJA, lpad(co_idartfutura, 5, ''0'') MP_ARTFUTURA, EM_FORMAJ MP_FORMAJ,' +
          ' EM_FEINICACTIV MP_FEINICACTIV, GE_CODIGO MP_HOLDING, CO_FECHARECEPCION MP_FECHARECEPCION,' +
          ' CO_FECHAIMPRESION MP_FECHAIMPRESION, CO_RECEPCONTRATO MP_RECEPCONTRATO,  CO_NIVEL MP_NIVEL,' +
          ' CO_MASATOTAL MP_MASATOTAL, CO_TOTEMPLEADOS MP_TOTEMPLEADOS, CO_DIASFRANQUICIA MP_DIASFRANQUICIA,' +
          ' CO_VIGENCIAFRANQUICIA MP_VIGENCIAFRANQUICIA, CO_CLAUSULAESPECIAL MP_CLAUSULAESPECIAL,' +
          ' CO_VIGENCIACLAUSULA MP_VIGENCIACLAUSULA, CO_FECHAINT MP_FECHAINT, CO_FECHARES MP_FECHARES, rp_idddjj,' +
          ' rp_iddevengado, rp_estado,' +
          ' decode(rp_estado, ''I'', ''Inválido'', ''P'', ''Pendiente Aprobación'', ''V'', ''Válido'') estado_periodo,' +
      		' rp_cobertura, decode(rp_cobertura, ''S'', ''Si'', ''No'') cobertura, rp_cantidadobservaciones,' +
          ' emi.utiles.get_periododeclaracion(emi.utiles.get_declaracionusada(rp_contrato, rp_periodo)) periodo_nomina,' +
      		' rp_clasehistorica clasehistorica, (SELECT nvl2(max (ld_id), ''S'', ''N'')' +
          																		 ' FROM emi.idj_ddjj, emi.ild_loteddjj' +
                                              ' WHERE ld_idddjj = dj_id' +
                                              	' AND dj_id = rp_idddjj) Gestion,' +
          ' decode((SELECT de_idtipodevengado' +
          					' FROM emi.ide_devengado ide' +
                   ' WHERE ide.de_id = rp_iddevengado), ''R'', ''Real'', ''E'', ''Estimado'') TipoDevengado,' +
          ' nvl((SELECT count(*)' +
          			 ' FROM emi.idj_ddjj' +
                ' WHERE dj_id = rp_idddjj), 0) CantDDJJ' +
     ' FROM afi.aco_contrato aco, afi.aem_empresa aem, emi.irp_resumenperiodo irp, afi.age_grupoeconomico age ' + sFrom +
    ' WHERE aco.co_contrato = irp.rp_contrato' +
    	' AND aem.em_id = aco.co_idempresa' +
      ' AND aem.em_idgrupoeconomico = ge_id(+) ' + sWhere;
//Pablo      '         irp.rp_periodo < ' + SqlValue(GetPeriodo(DBDate, fpAnioMes)) +  sWhere;
  sdqConsulta.SQL.Text := sSql + ' order by co_contrato, rp_periodo ';
end;

procedure TFrmArmadoLoteGestion.UtilizarCriterioDefinido;
begin
//
end;

procedure TFrmArmadoLoteGestion.FormCreate(Sender: TObject);
begin
  with fraGestor do
  begin
    TableName   := '(SELECT us.se_id ID , us.se_nombre NOMBRE, us.se_fechabaja FECHABAJA ' +
                   '   FROM art.use_usuarios us, emi.ilo_lote ilo, emi.igl_gestorlote igl ' +
                   '  WHERE igl.gl_idlote = ilo.lo_id AND igl.gl_usuario = us.se_usuario)';
    FieldID     := 'ID';
    FieldCodigo := 'ID';
    FieldDesc   := 'NOMBRE';
    FieldBaja   := 'FECHABAJA';
    ShowBajas   := true;
  end;

  with FraTipoGestion do
  begin
    TableName   := 'EMI.ITG_TIPOGESTION';
    FieldID     := 'TG_ID';
    FieldCodigo := 'TG_ID';
    FieldDesc   := 'TG_DESCRIPCION';
    FieldBaja   := 'TG_FECHABAJA';
    ShowBajas   := true;
  end;

  with fraHolding do
  begin
		TableName 	:= 'afi.age_grupoeconomico';
    FieldID     := 'ge_id';
    FieldCodigo := 'ge_codigo';
    FieldDesc   := 'ge_descripcion';
  end;

  with fraEjecutivo do
  begin
    TableName := ' afi.aec_ejecutivocuenta ';
    FieldID := 'ec_id';
    FieldCodigo := 'ec_id';
    FieldDesc := 'ec_nombre';
    FieldBaja := 'ec_fechabaja';
    ShowBajas := true;
  end;

  with fraVendedor do
  begin
    TableName := 'com.xve_vendedor';
    FieldID := 've_id';
    FieldCodigo := 've_id';
    FieldDesc := 've_nombre';
    FieldBaja := 've_fechabaja';
    ShowBajas := true;
  end;

  with fraObservado do
  begin
    TableName := 'emi.iob_observacion';
    FieldID := 'ob_id';
    FieldCodigo := 'ob_id';
    FieldDesc := 'ob_descripcion';
    FieldBaja := 'ob_fechabaja';
    OrderBy := 'ob_id';
    ShowBajas := true;
  end;

  pgGestion.TabIndex := 0;

end;

procedure TFrmArmadoLoteGestion.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  RefrescarPresentaciones;
  RefrescarGestion;
end;

procedure TFrmArmadoLoteGestion.RefrescarPresentaciones;
begin
  if sdqConsulta.Active then
  begin
    try
      sdqPresentaciones.DisableControls;
      sdqPresentaciones.close;
      sdqPresentaciones.ParamByName('contrato').AsInteger := sdqConsulta.FieldByName('contrato').AsInteger;
      sdqPresentaciones.ParamByName('periodo').AsString := sdqConsulta.FieldByName('periodo').AsString;
    finally
      sdqPresentaciones.open;

      TFloatField(sdqPresentaciones.FieldByName('Masa Salarial')).currency := True;
      sdqPresentaciones.EnableControls;
    end;
  end;
end;

procedure TFrmArmadoLoteGestion.sdqPresentacionesAfterScroll(
  DataSet: TDataSet);
begin
  RefrescarTrabajadores;
  ResfrescarLotesGestion;
end;

procedure TFrmArmadoLoteGestion.RefrescarTrabajadores;
begin
  if sdqPresentaciones.Active then
  begin
    try
      sdqTrabajadores.DisableControls;
      sdqTrabajadores.close;
      sdqTrabajadores.ParamByName('idddjj').AsInteger := sdqPresentaciones.FieldByName('id').AsInteger;
    finally
      sdqTrabajadores.open;

      TFloatField(sdqTrabajadores.FieldByName('Remuneracion')).currency := True;
      sdqTrabajadores.EnableControls;
    end;
  end;
end;

procedure TFrmArmadoLoteGestion.RefrescarGestion;
begin
  if sdqConsulta.Active then
  begin
    try
      sdqGestion.DisableControls;
      sdqGestion.close;
      sdqGestion.ParamByName('contrato').AsInteger := sdqConsulta.FieldByName('contrato').AsInteger;
      sdqGestion.ParamByName('periodo').AsString := sdqConsulta.FieldByName('periodo').AsString;
    finally
      sdqGestion.open;

      sdqGestion.EnableControls;
    end;
  end;
end;

procedure TFrmArmadoLoteGestion.ResfrescarLotesGestion;
begin
  if sdqPresentaciones.Active then
  begin
    sdqLotesGestion.ParamByName('idddjj').AsInteger := sdqPresentaciones.FieldByName('id').AsInteger;
    sdqLotesGestion.Open;
    edLote.Text := sdqLotesGestion.FieldByName('descripcion').AsString;
    edtTamanio.Text := sdqLotesGestion.FieldByName('Cant').AsString;
    edtGestorEmision.Text := sdqLotesGestion.FieldByName('gl_usuario').AsString;
    RefrescarAccionesTomadas;
    sdqLotesGestion.Close;
  end;
end;

procedure TFrmArmadoLoteGestion.RefrescarAccionesTomadas;
begin
  if sdqLotesGestion.Active then
  begin
    try
      sdqAccionesTomadas.DisableControls;
      sdqAccionesTomadas.close;
      sdqAccionesTomadas.ParamByName('idlote').AsInteger := sdqLotesGestion.FieldByName('lo_id').AsInteger;
    finally
      sdqAccionesTomadas.open;

      sdqAccionesTomadas.EnableControls;
    end;
  end;
end;

procedure TFrmArmadoLoteGestion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.mnuArmadoGestion.Enabled := true;
  Action := caFree;
end;

procedure TFrmArmadoLoteGestion.dbgContratosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.active then exit;

  if (sdqConsulta.FieldByName('Gestion').asString = 'S') then
  begin
    if Highlight Then Background := clTeal else Background := $00FFB7B7;
  end;

  if sdqConsulta.FieldByName('rp_cantidadobservaciones').AsInteger > 0  then
  begin
    AFont.Style := [fsBold]
  end;
end;

procedure TFrmArmadoLoteGestion.dbgPresentacionesGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqPresentaciones.active or not sdqConsulta.active or (sdqPresentaciones.Recordcount = 0) then exit;
  //Activa---
  if sdqPresentaciones.FieldByName('id').AsInteger =
     sdqPresentaciones.FieldByName('idddjj_activa').asInteger then
  begin
    if Highlight Then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;
  //Rechazada --
  if sdqPresentaciones.FieldByName('Rechazada').asstring <> 'No' then
    AFont.Color := clRed;
end;

end.
