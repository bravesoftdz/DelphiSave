unit unTableroEP;

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
  RxPlacemnt;


type
  TfrmTableroEP = class(TfrmCustomGridABM)
    pcFilter: TPageControl;
    tbGeneral: TTabSheet;
    Label2: TLabel;
    Label9: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    tbAfiliaciones: TTabSheet;
    Label47: TLabel;
    fraLocalidad: TfraLocalidadEx;
    fraDepart: TfraCodDesc;
    sdqObservaciones: TSDQuery;
    dsDetalleTareas: TDataSource;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    gbObservaciones: TJvgGroupBox;
    dbgObservaciones: TArtDBGrid;
    chkExcluirBajasEstabs: TCheckBox;
    cmbTipoEmpresaPrev: TCheckCombo;
    Label4: TLabel;
    cmbSector: TCheckCombo;
    Label5: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    edEstablecimiento: TPatternEdit;
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    tbObservaciones: TTabSheet;
    chkExcluirBajasEmpresas: TCheckBox;
    Label6: TLabel;
    chkSoloInconistentes: TCheckBox;
    cmbOperativo: TCheckCombo;
    tbProximasVisitas: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure fraDepartcmbDescripcionChange(Sender: TObject);
    procedure fraDepartcmbDescripcionExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbObservacionesExpanded(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure gbDetalleTareasCollapsed(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgObservacionesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbProximasVisitasClick(Sender: TObject);
  private
    procedure CargarObservaciones;
    procedure SetUltOperativo;
  public
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmTableroEP: TfrmTableroEP;

implementation

uses unCustomConsulta, CUIT, unReasignacionCP, unPrincipal, unConsultaVisitasAnual;

{$R *.dfm}

procedure TfrmTableroEP.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hot_observaciontableroep';
//  FieldBaja :=  'ot_fechabaja';

  fraEmpresaFiltro.ShowBajas := true;

  ShowActived := false;
  pcFilter.ActivePageIndex := 0;

  with GetQuery('SELECT * FROM art.ctb_tablas WHERE tb_clave = ''SECT'' and tb_codigo <> 0') do
  try
    while not Eof do
    begin
      cmbSector.Items.AddObject(fieldbyname('TB_DESCRIPCION').AsString, TObject(fieldbyname('TB_CODIGO').AsInteger));
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

  with GetQuery('SELECT * FROM ART.POP_OPERATIVO') do
  try
    while not Eof do
    begin
      cmbOperativo.Items.Add(FieldByName('OP_CODIGO').AsString);
      Next;
    end;
  finally
    free;
  end;

  SetUltOperativo;
  tbSalir.Left := tbSalir.Left + 170;
end;

procedure TfrmTableroEP.fraDepartcmbDescripcionChange(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmTableroEP.fraDepartcmbDescripcionExit(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmTableroEP.tbLimpiarClick(Sender: TObject);
begin
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  fraLocalidad.Clear;
  fraDepart.Clear;
  edEstablecimiento.Clear;
  fraEmpresaFiltro.Clear;
  cmbTipoEmpresaPrev.Clear;
  chkExcluirBajasEstabs.Checked := false;
  chkExcluirBajasEmpresas.Checked := false;
  cmbSector.Clear;
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
  SetUltOperativo;
  chkSoloInconistentes.Checked := false;
  inherited;
end;


procedure TfrmTableroEP.tbProximasVisitasClick(Sender: TObject);
begin
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmConsultaVisitasAnual.Create(Self) do
    try
      FormStyle := fsNormal;
      Visible := false;
      VerPanelSeleccion := true;
      Contrato := self.sdqConsulta.FieldByName('co_contrato').AsInteger;
      Establecimiento := self.sdqConsulta.FieldByName('ts_estableci').AsInteger;
      tbRefrescarClick(self);
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmTableroEP.RefreshData;
var
  sSql: String;
  sWhere: String;
  sIn: String;
  i: integer;
begin
  sSql := 'SELECT em_cuit, ' +
          '       em_nombre, ' +
          '       co_contrato, ' +
          '       ts_estableci, ' +
          '       es_nombre, ' +
          '       pit.it_nombre, ' +
          '       art.hys.get_nombre_preventor_coord (pit.it_codigo) coordinador, ' +
          '       prevultvis.it_nombre prevultvis, ' +
          '       ts_tipostr, ' +
          '       ts_actividad, ' +
          '       te_codigo tipoestabprev, ' +
          '       ac_relacion, ' +
          '       ac_codigo, ' +
          '       ac_descripcion, ' +
          '       ts_operativo, ' +
          '       ts_fechanotificacion, ' +
          '       ts_estabnotificacion, ' +
          '       DECODE (ts_anexo3, ''S'', ''Si'', ''N'', ''No'', ''F'', ''Ficticio'', ''Z'', ''No Corresponde'', ''ZS'', ''No Corresponde pero tiene'', ts_anexo3) ts_anexo3, ' +
          '       ts_siniestrosmortalesan3, ' +
          '       ts_siniestrosausenciaan3, ' +
          '       ts_enferprofesionalesan3, ' +
          '       ts_fechadenunciaanexo3, ' +
          '       DECODE (ts_anexo4, ''S'', ''Si'', ''N'', ''No'', ''Z'', ''No Corresponde'', ''ZS'', ''No Corresponde pero tiene'', ts_anexo4) ts_anexo4, ' +
          '       DECODE (ts_evalriesgo, ''S'', ''Si'', ''N'', ''No'', ts_evalriesgo) ts_evalriesgo, ' +
          '       DECODE (ts_pape, ''S'', ''Si'', ''N'', ''No'', ''X'', ''No Amerita'', ''Z'', ''No Corresponde'', ''XS'', ''No Amerita pero tiene'',''ZS'', ''No Corresponde pero tiene'', ts_pape) ts_pape, ' +
          '       ts_fechadenunciapape, ' +
          '       ts_cantvisitasverif, ' +
          '       ts_fechaultverif, ' +
          '       ts_fechavisita1, ' +
          '       ts_fechavisita2, ' +
          '       ts_fechavisita3, ' +
          '       ts_fechavisita4, ' +
          '       CASE WHEN instr(ts_firmaspape, ''1'') > 0 THEN ''-Empleador/Responsable '' END || CASE WHEN instr(ts_firmaspape, ''2'') > 0 THEN '' -Serv.HyS'' END || ' +
          '       CASE WHEN instr(ts_firmaspape, ''3'') > 0 THEN ''-Serv.ML'' END || CASE WHEN instr(ts_firmaspape, ''4'') > 0 THEN '' -Repres.Trabajadores/Gremial'' END firmasPape, ' +
          '       CASE WHEN instr(ts_firmasanexo4, ''1'') > 0 THEN ''-Empleador/Responsable '' END || CASE WHEN instr(ts_firmasanexo4, ''2'') > 0 THEN '' -Serv.HyS'' END || ' +
          '       CASE WHEN instr(ts_firmasanexo4, ''3'') > 0 THEN ''-Serv.ML'' END || CASE WHEN instr(ts_firmasanexo4, ''4'') > 0 THEN '' -Repres.Trabajadores/Gremial'' END firmasanexo4, ' +
          '       ts_ultimorar, ' +
          '       ts_iarc, ' +
          '       ts_rgrl, ' +
          '       ts_fechaverosimilitud, ' +
          '       DECODE (ts_correspondeverosimilitud, ''S'', ''Si'', ''N'', ''No'', ts_correspondeverosimilitud) ts_correspondeverosimilitud, ' +
          '       DECODE (ts_cancerigenos, ''S'', ''Si'', ''N'', ''No'', ts_cancerigenos) ts_cancerigenos, ' +
          '       DECODE (ts_difenilos, ''S'', ''Si'', ''N'', ''No'', ts_difenilos) ts_difenilos, ' +
          '       DECODE (ts_accmayores, ''S'', ''Si'', ''N'', ''No'', ts_accmayores) ts_accmayores, ' +
          '       ts_fechadefinicion, ' +
          '       ts_fechaaltaestab, ' +
          '       ts_idpreventor, ' +
          '       ts_fechaalta, ' +
          '       ts_fechamodif, ' +
          '       ts_visita1, ' +
          '       ts_visita2, ' +
          '       ts_visita3, ' +
          '       ts_visita4, ' +
          '       ts_fechabajaestab, ' +
          '       ts_visita1cantrec, ' +
          '       ts_visita1cantverif, ' +
          '       ts_visita2cantrec, ' +
          '       ts_visita2cantverif, ' +
          '       ts_visita3cantrec, ' +
          '       ts_visita3cantverif, ' +
          '       ts_visita4cantrec, ' +
          '       ts_visita4cantverif, ' +
          '       TRUNC (DECODE (ts_visita1cantrec, 0, NULL, (ts_visita1cantverif / ts_visita1cantrec) * 100)) porcvisita1, ' +
          '       TRUNC (DECODE (ts_visita2cantrec, 0, NULL, (ts_visita2cantverif / ts_visita2cantrec) * 100)) porcvisita2, ' +
          '       TRUNC (DECODE (ts_visita3cantrec, 0, NULL, (ts_visita3cantverif / ts_visita3cantrec) * 100)) porcvisita3, ' +
          '       TRUNC (DECODE (ts_visita4cantrec, 0, NULL, (ts_visita4cantverif / ts_visita4cantrec) * 100)) porcvisita4, ' +
          '       ts_fechabajacontrato, ' +
          '       ts_fechaaltaanexo3, ' +
          '       ts_fechapresentacionan3, ' +
          '       ts_fechaultvisita, ' +
          '       ts_fechaultcapacit, ' +
          '       ts_fechaantultcapacit, ' +
          '       ts_fechavigenciatraspaso, ' +
//          '       CASE WHEN ts_fechapresentacionan3 IS NOT NULL THEN (40 - art.varios.get_cantdiashabiles (ts_fechapresentacionan3, TRUNC (SYSDATE))) ELSE NULL END DiasFaltantesDenPAPE, ' +
          '       (SELECT TRUNC (AVG (rc_empleados)) ' +
          '         FROM zrc_resumencobranza ' +
          '        WHERE rc_contrato = co_contrato ' +
          '         AND rc_periodo BETWEEN art.Periodo_Proximo(ts_operativo, -12) AND art.Periodo_Proximo(ts_operativo, -1)) TrabPromUltAno, ' +
          '       NVL (co_totempleadosactual, co_totempleados) trabactual, ' +
          '       ts_id ' +
          '  FROM art.pit_firmantes prevultvis, art.pit_firmantes pit, comunes.cac_actividad, hys.hte_tipoempresaprev, afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa, hys.hts_tableroseguimientoep ' +
          ' WHERE em_id = ts_idempresa ' +
          '   AND co_idempresa = em_id ' +
          '   AND es_contrato = co_contrato ' +
          '   AND es_nroestableci = ts_estableci ' +
          '   AND co_contrato = NVL (art.afiliacion.get_contratovigente (em_cuit, ts_fechaalta), art.get_vultcontrato (em_cuit)) ' +
          '   AND ts_tipoprev = te_id ' +
          '   AND ac_id = es_idactividad ' +
          '   AND ts_idpreventor = pit.it_id(+) ' +
          '   AND ts_idprevultvisita = prevultvis.it_id(+) ' +
          '   AND ts_fechabaja IS NULL '+
          '   AND NOT EXISTS(SELECT 1 ' +
          '        FROM hys.pev_estabeventual ' +
          '       WHERE ev_id = es_idestabeventual ' +
          '         AND ev_asignable = ''N'') ';


  sWhere := '';

  sIn := '';
  if cmbOperativo.CheckedCount > 0 then
  begin
    sIn := '';
    for i:=0 to cmbOperativo.Items.Count-1 do
      if cmbOperativo.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(cmbOperativo.Items.Strings[i]);
      end;
  end;
  if (sIn <> '') then
    sWhere := sWhere + ' AND ts_operativo in (' + sIn  + ')';

  if chkSoloInconistentes.Checked then
    sWhere := sWhere + ' AND EXISTS(SELECT 1 ' +
                       '              FROM hys.hco_casoobservable, hys.hot_observaciontableroep ' +
                       '            WHERE ot_idtablero = ts_id ' +
                       '              AND ot_idobservacion = co_id ' +
                       '              AND co_tipo = ''I''' +
                       '              AND ot_fechabaja IS NULL ' +
                       '              AND co_fechabaja IS NULL ' +
                       '              AND ot_fecharesuelto IS NULL )';

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND ts_idempresa = '+SqlValue(fraEmpresaFiltro.Value);

  if edEstablecimiento.Text <> '' then
    sWhere := sWhere + ' AND ts_estableci IN  ('+edEstablecimiento.Text+')';

  if chkExcluirBajasEstabs.Checked then
    sWhere := sWhere + ' AND ts_fechabajaestab IS NULL ';

  if chkExcluirBajasEmpresas.Checked then
    sWhere := sWhere + ' AND ts_fechabajacontrato IS NULL ';

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
    sWhere := sWhere + ' AND te_codigo in (' + sIn  + ')';

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
    sWhere := sWhere + '   AND em_sector + 0 in (' + sIn  + ')';

  if fraPreventorFiltro.IsSelected then
    sWhere := sWhere + ' AND pit.it_id = ' + SqlValue(fraPreventorFiltro.Value);

  if fraCoordinadorFiltro.IsSelected then
    sWhere := sWhere + ' AND pit.it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);

  if fraLocalidad.IsSelected then
    sWhere := sWhere + fraLocalidad.GetWhere;

  if fraDepart.IsSelected then
    sWhere := sWhere + ' AND art.utiles.get_partido(es_cpostal, es_provincia) = ' + SqlValue(fraDepart.cmbDescripcion.Text);

  if SortDialog.OrderBy = '' then
    sdqConsulta.Sql.Text := sSql + ' ' + sWhere + ' ORDER BY em_cuit, ts_estableci '
  else
     sdqConsulta.Sql.Text := sSql + ' ' + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmTableroEP.CargarObservaciones;
begin
  if not gbObservaciones.Collapsed and not sdqConsulta.IsEmpty then
  begin
    sdqObservaciones.Close;
    sdqObservaciones.ParamByName('idtablero').Value := sdqConsulta.fieldbyname('ts_id').AsInteger;
    sdqObservaciones.Open;
  end;
end;

procedure TfrmTableroEP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CargarObservaciones;
end;

procedure TfrmTableroEP.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CargarObservaciones;
end;

procedure TfrmTableroEP.SetUltOperativo;
var
  i: integer;
begin
  with GetQuery('SELECT vo_operativo ' +
               ' FROM hys.hvo_vigenciaoperativo ' +
               ' WHERE vo_tipo = ''EP''' +
               ' AND SYSDATE BETWEEN vo_vigenciadesde AND NVL(vo_vigenciahasta, SYSDATE + 1)') do
  try
    while not Eof do
    begin
      for i:=0 to cmbOperativo.Items.Count-1 do
        if not cmbOperativo.Checked[i] then
          cmbOperativo.Checked[i] := cmbOperativo.Items[i] = FieldByName('vo_operativo').AsString;
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmTableroEP.gbObservacionesExpanded(Sender: TObject);
begin
  inherited;
  CargarObservaciones;
end;

procedure TfrmTableroEP.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqObservaciones.Close;
end;

procedure TfrmTableroEP.gbDetalleTareasCollapsed(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmTableroEP.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.Active then
  begin
    if (not sdqConsulta.FieldByName('ts_fechabajaestab').IsNull) or (not sdqConsulta.FieldByName('ts_fechabajacontrato').IsNull) then
      AFont.Color := clRed;
  end;

  if Assigned(Field) and (UpperCase(Field.FieldName) = 'TS_FECHAVISITA1') and
    (not sdqConsulta.FieldByName('ts_fechavisita1').IsNull) and
    (sdqConsulta.FieldByName('ts_fechavisita1').AsDateTime  < DBDate) then
  begin
    if (sdqConsulta.FieldByName('ts_visita1').AsString = 'S') then
      Background := clMoneyGreen
    else
      Background := $0098E9EB;
  end;

  if Assigned(Field) and (UpperCase(Field.FieldName) = 'TS_FECHAVISITA2') and
    (not sdqConsulta.FieldByName('ts_fechavisita2').IsNull) and
    (sdqConsulta.FieldByName('ts_fechavisita2').AsDateTime  < DBDate) then
  begin
    if (sdqConsulta.FieldByName('ts_visita2').AsString = 'S') then
      Background := clMoneyGreen
    else
      Background := $0098E9EB;
  end;

  if Assigned(Field) and (UpperCase(Field.FieldName) = 'TS_FECHAVISITA3') and
    (not sdqConsulta.FieldByName('ts_fechavisita3').IsNull) and
    (sdqConsulta.FieldByName('ts_fechavisita3').AsDateTime  < DBDate) then
  begin
    if (sdqConsulta.FieldByName('ts_visita3').AsString = 'S') then
      Background := clMoneyGreen
    else
      Background := $0098E9EB;
  end;

  if Assigned(Field) and (UpperCase(Field.FieldName) = 'TS_FECHAVISITA4') and
    (not sdqConsulta.FieldByName('ts_fechavisita4').IsNull) and
    (sdqConsulta.FieldByName('ts_fechavisita4').AsDateTime  < DBDate) then
  begin
    if (sdqConsulta.FieldByName('ts_visita4').AsString = 'S') then
      Background := clMoneyGreen
    else
      Background := $0098E9EB;
  end;

  inherited;
end;

procedure TfrmTableroEP.ClearControls;
begin
  inherited;
//
end;

function TfrmTableroEP.DoABM: Boolean;
begin
  result := true;
//
end;


function TfrmTableroEP.Validar: Boolean;
begin
//
  result := true;
end;

procedure TfrmTableroEP.LoadControls;
begin
  inherited;
//
end;

procedure TfrmTableroEP.dbgObservacionesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqObservaciones.Active and not (sdqObservaciones.FieldByName('OT_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmTableroEP.tbSumatoriaClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active then
    MsgBox('La cantidad de registros es: ' + IntToStr(sdqConsulta.RecordCount), MB_ICONINFORMATION, Self.Caption);
end;


end.
