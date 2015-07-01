unit unPlanVisitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, PeriodoPicker, unFraCodDesc, unArtDbFrame,
  unfraLocalidad, unfraLocalidadEx, CustomDlgs, AnsiSql, unPlanVisitasDetalle,
  unEspera, General, Mask, ToolEdit, DateComboBox, PatternEdit,
  unFraEmpresa, unDmPrincipal, DBFuncs, Strfuncs, ComboEditor, CheckCombo,
  unFraMultiSeleccion;

type
  TfrmPlanVisitas = class(TfrmCustomGridABM)
    pcFilter: TPageControl;
    tbAfiliaciones: TTabSheet;
    Label47: TLabel;
    fraLocalidad: TfraLocalidadEx;
    fraDepart: TfraCodDesc;
    tbGeneral: TTabSheet;
    Label2: TLabel;
    Label9: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    chkSinPreventor: TCheckBox;
    ShortCutControl1: TShortCutControl;
    Panel1: TPanel;
    chkParcial: TCheckBox;
    chkTerminado: TCheckBox;
    chkPendiente: TCheckBox;
    Label44: TLabel;
    edFechaAltaDesde: TDateComboBox;
    Label46: TLabel;
    edFechaAltaHasta: TDateComboBox;
    Label3: TLabel;
    Label4: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    edEstablecimiento: TPatternEdit;
    fraProcesoFiltro: TfraCodigoDescripcion;
    Label5: TLabel;
    edFechaEmergentesDesde: TDateComboBox;
    edFechaEmergentesHasta: TDateComboBox;
    Label6: TLabel;
    Label7: TLabel;
    edFechaBajaDesde: TDateComboBox;
    Label8: TLabel;
    edFechaBajaHasta: TDateComboBox;
    chkTerminadoUCAP: TCheckBox;
    tbTareas: TTabSheet;
    fraTareasSeleccion: TfraMultiSeleccion;
    Label24: TLabel;
    cmbTareasSegunTipoEmpresa: TCheckCombo;
    Label10: TLabel;
    cmbTipoEmpresaPrev: TCheckCombo;
    procedure FormCreate(Sender: TObject);
    procedure fraDepartcmbDescripcionChange(Sender: TObject);
    procedure fraDepartcmbDescripcionExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    procedure CargarDetalle;
    function GetWhereTareaTipoEmpresa: String;
  public
    { Public declarations }
  protected
    procedure RefreshData; override;
  end;

var
  frmPlanVisitas: TfrmPlanVisitas;
  TotalDetalle: array of Extended;
  CAMPOS_DETALLE: array [0..10] of string = ('PRIORITARIA', 'COMPENSACION', 'COMPENSACIONOTROPERIODO', 'COMPENSACIONMANUAL', 'NOPROGRAMADAS',
                                             'EMERGENTES', 'EMERGENTESFILTRO', 'PRIORITARIAOTROPERIODO', 'EMERGENTESOTROPERIODO', 'EMERGENTESFILTROOTROPER',
                                             'TOTAL');

implementation

uses unCustomConsulta, StrUtils, DateUtils;

{$R *.dfm}

{ TfrmPlanVisitas }

procedure TfrmPlanVisitas.RefreshData;
var
  sSql: String;
  sEstado: String;
  sIn: String;
  i: integer;
begin
  Verificar(not fraProcesoFiltro.IsSelected, fraProcesoFiltro, 'Debe ingresar un período.');
  Verificar(edFechaEmergentesDesde.Date = 0, edFechaEmergentesDesde, 'Debe ingresar la fecha desde para las emergentes.');
  Verificar(edFechaEmergentesHasta.Date = 0, edFechaEmergentesHasta, 'Debe ingresar la fecha hasta para las emergentes.');
  Verificar(edFechaBajaDesde.Date = 0, edFechaBajaDesde, 'Debe ingresar la fecha desde para las bajas.');
  Verificar(edFechaBajaHasta.Date = 0, edFechaBajaHasta, 'Debe ingresar la fecha hasta para las bajas.');
  sSql := ' SELECT  art.hys.get_nombre_preventor_coord(it_codigo) coordinador, ps_idpreventor, it_nombre, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''N'' THEN 1 ELSE 0 END) prioritaria, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 2 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''N'' THEN 1 ELSE 0 END) compensacion, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 2 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''S'' THEN 1 ELSE 0 END) compensacionotroperiodo, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 4 THEN 1 ELSE 0 END) compensacionmanual, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 3 THEN 1 ELSE 0 END) noprogramadas, ' +
          '         SUM(CASE WHEN TRUNC(ps_fechabaja) BETWEEN :fechabajadesde AND :fechabajahasta  THEN 1 ELSE 0 END) bajas, ' +

          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''S'' AND ps_visitaotroperiodo = ''N'' THEN 1 ELSE 0 END) emergentes, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''S'' AND ps_visitaotroperiodo = ''N'' AND trunc(ps_fechaalta) BETWEEN :fechaemdesde AND :fechaemhasta THEN 1 ELSE 0 END) emergentesfiltro, ' +

          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''S'' THEN 1 ELSE 0 END) prioritariaotroperiodo, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''S'' AND MONTHS_BETWEEN(LAST_DAY(ps_fechahasta), LAST_DAY(pv_fechafinal)) = 1 THEN 1 ELSE 0 END) prioritariaotroperiodo2, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''S'' AND MONTHS_BETWEEN(LAST_DAY(ps_fechahasta), LAST_DAY(pv_fechafinal)) = 2 THEN 1 ELSE 0 END) prioritariaotroperiodo3, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''S'' AND MONTHS_BETWEEN(LAST_DAY(ps_fechahasta), LAST_DAY(pv_fechafinal)) = 3 THEN 1 ELSE 0 END) prioritariaotroperiodo4, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''N'' AND ps_visitaotroperiodo = ''S'' AND MONTHS_BETWEEN(LAST_DAY(ps_fechahasta), LAST_DAY(pv_fechafinal)) > 3 THEN 1 ELSE 0 END) prioritariaotroperiodoresto, ' +

          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''S'' AND ps_visitaotroperiodo = ''S'' THEN 1 ELSE 0 END) emergentesotroperiodo, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita = 1 AND ps_visitaemergente = ''S'' AND ps_visitaotroperiodo = ''S'' AND trunc(ps_fechaalta) BETWEEN :fechaemdesde AND :fechaemhasta THEN 1 ELSE 0 END) emergentesfiltrootroper, ' +
          '         SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita NOT IN (3, 5) AND NOT(ps_tipovisita = 1 AND ps_visitaotroperiodo = ''S'')  THEN 1 ELSE 0 END) total, ' +
          '         art.hys_plan.get_cantidadvisitasmax(pv_id, ps_idpreventor, pv_fechainicial) visitamax, ' +
          '         (art.hys_plan.get_cantidadvisitasmax(pv_id, ps_idpreventor, pv_fechainicial)  - SUM(CASE WHEN ps_fechabaja IS NULL AND ps_tipovisita NOT IN (3, 5) AND (NOT(ps_tipovisita = 1 AND ps_visitaotroperiodo = ''S''))  THEN 1 ELSE 0 END)) diferencia ' +
          ' FROM art.pit_firmantes, hys.hps_planhys, hys.hpv_procesovisita ' +
          ' WHERE pv_id = ps_idproceso ';


  if chkSinPreventor.Checked then
  begin
    sSql := sSql + ' AND it_id(+) = ps_idpreventor ';
//                   ' AND it_fechabaja(+) IS NULL ';
  end
  else begin
    sSql := sSql + '  AND it_id = ps_idpreventor ' +
                   '  AND it_fechabaja IS NULL ';
  end;

  if fraEmpresaFiltro.IsSelected then
    sSql := sSql + ' AND ps_idempresa = '+SqlValue(fraEmpresaFiltro.Value);

  if edEstablecimiento.Text <> '' then
    sSql := sSql + ' AND ps_estableci IN ('+edEstablecimiento.Text+')';

  sSql := sSql + ' AND pv_id = ' + SqlValue(fraProcesoFiltro.Value);

  if fraPreventorFiltro.IsSelected then
  begin
    if chkSinPreventor.Checked  then
      sSql := sSql + ' AND (it_id = ' + SqlValue(fraPreventorFiltro.Value) + ' OR it_id IS NULL) '
    else
      sSql := sSql + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value)
  end;

  if fraCoordinadorFiltro.IsSelected then
  begin
    if chkSinPreventor.Checked  then
      sSql := sSql + ' AND (it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value) + ' OR it_id IS NULL) '
    else
      sSql := sSql + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value)
  end;

  if fraLocalidad.IsSelected then
  begin
    sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                   '             FROM afi.aco_contrato, afi.aes_establecimiento ' +
                   '             WHERE co_contrato = es_contrato ' +
                   '               AND co_idempresa = ps_idempresa ' +
                   '               AND es_nroestableci = ps_estableci ' + fraLocalidad.GetWhere + ')';
  end;

  if fraDepart.IsSelected then
    sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                   '             FROM afi.aco_contrato, afi.aes_establecimiento ' +
                   '             WHERE co_contrato = es_contrato ' +
                   '               AND co_idempresa = ps_idempresa ' +
                   '               AND es_nroestableci = ps_estableci ' +
                   '               AND art.utiles.get_partido(es_cpostal, es_provincia) = ' + SqlValue(fraDepart.cmbDescripcion.Text) + ')';


  sEstado := '';
  if chkPendiente.Checked then
    sEstado := SqlValue('N');

  if chkParcial.Checked then
    sEstado := sEstado + iif(sEstado<> '', ',', '') + SqlValue('P');

  if chkTerminado.Checked then
    sEstado := sEstado + iif(sEstado<> '', ',', '') + SqlValue('T');

  if chkTerminadoUCAP.Checked then
    sSql := sSql + ' AND NOT EXISTS (SELECT 1 FROM hys.hts_tareahys WHERE ts_idplan = ps_id AND ts_fechabaja IS NULL AND ts_finalizada = ''N'')';

  if (sEstado <> '') then
    sSql := sSql + ' AND ps_estado IN (' + sEstado + ') ';

  if edFechaAltaDesde.Date > 0 then
    sSql := sSql + ' AND trunc(ps_fechaalta) >= ' + SqlValue(edFechaAltaDesde.Date);

  if edFechaAltaHasta.Date > 0 then
    sSql := sSql + ' AND trunc(ps_fechaalta) <= ' + SqlValue(edFechaAltaHasta.Date);

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
    sSql := sSql + ' and art.hys.get_tipo_estab_prev((select em_cuit from afi.aem_empresa where em_id = ps_idempresa), ps_estableci) in (' + sIn  + ')';

  if cmbTareasSegunTipoEmpresa.CheckedCount > 0 then
    sSql := sSql + ' AND EXISTS (SELECT 1 FROM hys.hta_tarea, hys.hts_tareahys WHERE ts_idplan = ps_id AND ta_id = ts_idtarea AND ts_fechabaja IS NULL AND ta_complementaria = ''N''' + GetWhereTareaTipoEmpresa +  ')';

  if fraTareasSeleccion.CheckCount > 0 then
    sSql := sSql + ' AND EXISTS (SELECT 1 FROM hys.hts_tareahys WHERE ts_idplan = ps_id AND ts_fechabaja IS NULL ' + fraTareasSeleccion.InSQL_IntegerValues('ts_idtarea', false) +  ')';

  sdqConsulta.ParamByName('fechaemdesde').Value := edFechaEmergentesDesde.Date;
  sdqConsulta.ParamByName('fechaemhasta').Value := edFechaEmergentesHasta.Date;

  sdqConsulta.ParamByName('fechabajadesde').Value := edFechaBajaDesde.Date;
  sdqConsulta.ParamByName('fechabajahasta').Value := edFechaBajaHasta.Date;

  sdqConsulta.Sql.Text := sSql + ' GROUP BY ps_idpreventor, it_codigo, it_nombre, pv_id, pv_fechainicial ';
  if SortDialog.OrderBy = '' then
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + ' ORDER BY coordinador '
  else
    sdqConsulta.Sql.Text := sdqConsulta.Sql.Text + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPlanVisitas.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := false;
  pcFilter.ActivePageIndex := 0;

  fraEmpresaFiltro.ShowBajas := true;

  edFechaEmergentesDesde.Date := DBDate;
  edFechaEmergentesHasta.Date := DBDate;

  edFechaBajaDesde.Date := ValorSqlDateTime('SELECT TRUNC(SYSDATE, ''MM'') FROM DUAL');
  edFechaBajaHasta.Date := DBDate;

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

  Grid.ColumnByField['emergentesotroperiodo'].Visible := false; //125
  Grid.ColumnByField['emergentesfiltrootroper'].Visible := false; //150
  Grid.ColumnByField['prioritariaotroperiodo2'].Visible := false; //128
  Grid.ColumnByField['prioritariaotroperiodo3'].Visible := false; //128
  Grid.ColumnByField['prioritariaotroperiodo4'].Visible := false; //128
  Grid.ColumnByField['prioritariaotroperiodoresto'].Visible := false; //153
  Grid.FooterBand := true;
  SetLength(TotalDetalle, Length(CAMPOS_DETALLE));
end;

procedure TfrmPlanVisitas.fraDepartcmbDescripcionChange(Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmPlanVisitas.fraDepartcmbDescripcionExit(Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmPlanVisitas.tbLimpiarClick(Sender: TObject);
begin
  fraProcesoFiltro.Value := ValorSqlInteger('SELECT art.hys_plan.get_idproceso(''M'', trunc(sysdate, ''MM''), last_day(trunc(sysdate, ''MM''))) FROM dual');
  edFechaEmergentesDesde.Date := DBDate;
  edFechaEmergentesHasta.Date := DBDate;
  edFechaBajaDesde.Date := ValorSqlDateTime('SELECT TRUNC(SYSDATE, ''MM'') FROM DUAL');
  edFechaBajaHasta.Date := DBDate;
  chkSinPreventor.Checked := false;
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  fraLocalidad.Clear;
  fraDepart.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  fraEmpresaFiltro.Clear;
  edEstablecimiento.Clear;
  inherited;
end;

procedure TfrmPlanVisitas.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmPlanVisitas.CargarDetalle;
var
  i: integer;
  bmk: TBookmark;
begin
  if sdqConsulta.IsEmpty then Exit;

  bmk := self.sdqConsulta.GetBookmark;
  IniciarEspera; //Pongo esto aca porque por algun error de la grilla me selecciona el primer item cuando
                 //esta tiene registros hasta el final
  with TfrmPlanVisitasDetalle.Create(self) do
  try
    FormStyle := fsNormal;
    Visible := false;

    IdProceso := self.fraProcesoFiltro.Value;

    Prioritarias := UpperCase(Self.Grid.SelectedField.FieldName) = 'PRIORITARIA';

    Compensatorias := UpperCase(Self.Grid.SelectedField.FieldName) = 'COMPENSACION';

    CompensatoriasOtroPeriodo := UpperCase(Self.Grid.SelectedField.FieldName) = 'COMPENSACIONOTROPERIODO';

    CompensatoriasManual := UpperCase(Self.Grid.SelectedField.FieldName) = 'COMPENSACIONMANUAL';

    NoProgramadas := UpperCase(Self.Grid.SelectedField.FieldName) = 'NOPROGRAMADAS';

    Emergentes := UpperCase(Self.Grid.SelectedField.FieldName) = 'EMERGENTES';

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'EMERGENTESFILTRO') then
    begin
      Emergentes := true;
      FechaAltaDesde := edFechaEmergentesDesde.Date;
      FechaAltaHasta := edFechaEmergentesHasta.Date;
    end;

    PrioritariasOtroPeriodo := UpperCase(Self.Grid.SelectedField.FieldName) = 'PRIORITARIAOTROPERIODO';

    EmergentesOtroPeriodo := UpperCase(Self.Grid.SelectedField.FieldName) = 'EMERGENTESOTROPERIODO';

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'EMERGENTESFILTROOTROPER') then
    begin
      EmergentesOtroPeriodo := true;
      FechaAltaDesde := edFechaEmergentesDesde.Date;
      FechaAltaHasta := edFechaEmergentesHasta.Date;
    end;

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'PRIORITARIAOTROPERIODO2') then
    begin
      PrioritariasOtroPeriodo := true;
      FechaDesde := IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 1);
      FechaHasta :=  ValorSqlDateTime('SELECT LAST_DAY(' + SqlValue(IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 1)) + ') FROM DUAL');
    end;

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'PRIORITARIAOTROPERIODO3') then
    begin
      PrioritariasOtroPeriodo := true;
      FechaDesde := IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 2);
      FechaHasta :=  ValorSqlDateTime('SELECT LAST_DAY(' + SqlValue(IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 2)) + ') FROM DUAL');
    end;

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'PRIORITARIAOTROPERIODO4') then
    begin
      PrioritariasOtroPeriodo := true;
      FechaDesde := IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 3);
      FechaHasta :=  ValorSqlDateTime('SELECT LAST_DAY(' + SqlValue(IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 3)) + ') FROM DUAL');
    end;

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'PRIORITARIAOTROPERIODORESTO') then
    begin
      PrioritariasOtroPeriodo := true;
      FechaDesde := IncMonth(self.fraProcesoFiltro.sdqDatos.fieldbyname('pv_fechainicial').AsDateTime, 4);
    end;

    if (UpperCase(Self.Grid.SelectedField.FieldName) = 'TOTAL') and (self.fraProcesoFiltro.Descripcion > '201308') then
    begin
      Prioritarias := true;
      Compensatorias := true;
      CompensatoriasManual := true;
      CompensatoriasOtroPeriodo := true;
      Emergentes := true;
    end;

    if self.sdqConsulta.fieldbyname('ps_idpreventor').IsNull then
    begin
      PreventorId := -1;
      chkSinPreventor.Checked := true;
    end
    else begin
      PreventorId := self.sdqConsulta.fieldbyname('ps_idpreventor').AsInteger;
      chkSinPreventor.Checked := false;
    end;

    if self.fraLocalidad.IsSelected then
    begin
      fraLocalidad.edCPostal.Text := self.fraLocalidad.edCPostal.Text;
      fraLocalidad.cmbLocalidad.Text := self.fraLocalidad.cmbLocalidad.Text;
      for i:=0 to self.fraLocalidad.cmbProvincia.Items.Count-1 do
        fraLocalidad.cmbProvincia.Checked[i] := self.fraLocalidad.cmbProvincia.Checked[i]
    end;

    if self.fraDepart.IsSelected then
    begin
      fraDepart.Propiedades.SQL :=  fraDepart.Propiedades.SQL + ' and cp_departamento = ' + SqlValue(self.fraDepart.cmbDescripcion.Text);
      fraDepart.SelectFirst;
    end;

    VerPendientes := Self.chkPendiente.Checked;
    VerParciales := Self.chkParcial.Checked;
    VerTerminados := Self.chkTerminado.Checked;
    VerTerminadasUcap := Self.chkTerminadoUCAP.Checked;

    if FechaAltaDesde = 0 then
      FechaAltaDesde := Self.edFechaAltaDesde.Date;
    if FechaAltaHasta = 0 then
      FechaAltaHasta := Self.edFechaAltaHasta.Date;
    Contrato :=  Self.fraEmpresaFiltro.Contrato;
    Establecimiento := Self.edEstablecimiento.Text;

    if self.cmbTipoEmpresaPrev.CheckedCount > 0 then
      for i:=0 to self.cmbTipoEmpresaPrev.Items.Count-1 do
        cmbTipoEmpresaPrev.Checked[i] := self.cmbTipoEmpresaPrev.Checked[i];

    if self.cmbTareasSegunTipoEmpresa.CheckedCount > 0 then
      for i:=0 to self.cmbTareasSegunTipoEmpresa.Items.Count-1 do
        cmbTareasSegunTipoEmpresa.Checked[i] := self.cmbTareasSegunTipoEmpresa.Checked[i];

    if self.fraTareasSeleccion.CheckCount > 0 then
    begin
      for i:=0 to self.fraTareasSeleccion.ValuesChecked.Count-1 do
        fraTareasSeleccion.ValuesChecked.Add(self.fraTareasSeleccion.ValuesChecked[i]);
      fraTareasSeleccion.Refresh;
    end;

    DetenerEspera;
    tbRefrescarClick(self);
    ShowModal;
    self.tbRefrescar.Click;
  finally
    free;
    self.sdqConsulta.GotoBookmark(bmk);
  end;
end;

procedure TfrmPlanVisitas.GridDblClick(Sender: TObject);
begin
  inherited;
  CargarDetalle;
end;

procedure TfrmPlanVisitas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  SumFields(sdqConsulta, CAMPOS_DETALLE, TotalDetalle);
end;

procedure TfrmPlanVisitas.GridPaintFooter(Sender: TObject; Column: String;
  var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_DETALLE);
  if (iPos > -1) and (iPos <= Length(CAMPOS_DETALLE)) Then
    Value := ToStr(TotalDetalle[iPos], 0);
end;

procedure TfrmPlanVisitas.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (Field.FieldName = 'TOTAL') then
  begin
    if not sdqConsulta.FieldByName('visitamax').IsNull then
    begin
      if sdqConsulta.FieldByName('total').AsInteger > sdqConsulta.FieldByName('visitamax').AsInteger then
        Background := clRed;
      if sdqConsulta.FieldByName('total').AsInteger < sdqConsulta.FieldByName('visitamax').AsInteger then
        Background := clGreen;
    end;

    if (sdqConsulta.FieldByName('visitamax').IsNull) or (sdqConsulta.FieldByName('total').AsInteger = sdqConsulta.FieldByName('visitamax').AsInteger) then
    begin
      Background := clYellow;
      AFont.Color := clWindowText;
    end;
  end;
end;

function TfrmPlanVisitas.GetWhereTareaTipoEmpresa: String;
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

end.
