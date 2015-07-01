unit unTableroCO;

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
  RxPlacemnt, RxToolEdit, ExComboBox;


type
  TfrmTableroCO = class(TfrmCustomGridABM)
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
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    gbVisitas: TJvgGroupBox;
    dbgVisitas: TArtDBGrid;
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
    chkSoloInconistentes: TCheckBox;
    Label21: TLabel;
    edFechaFinAODesdeFiltro: TDateComboBox;
    Label22: TLabel;
    edFechaFinAOHastaFiltro: TDateComboBox;
    tbExportarVisitas: TToolButton;
    sdqTareasObra: TSDQuery;
    dsTareasObra: TDataSource;
    dbgTareasObra: TArtDBGrid;
    ExportDialogTareasObra: TExportDialog;
    cbExcavacion: TCheckBox;
    cbExcavacion503: TCheckBox;
    cbDemolicion: TCheckBox;
    cmbExcavacion: TExComboBox;
    cmbExcavacion503: TExComboBox;
    cmbDemolicion: TExComboBox;
    tbProximasVisitas: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure fraDepartcmbDescripcionChange(Sender: TObject);
    procedure fraDepartcmbDescripcionExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbVisitasExpanded(Sender: TObject);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure gbDetalleTareasCollapsed(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgVisitasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbExportarVisitasClick(Sender: TObject);
    procedure tbProximasVisitasClick(Sender: TObject);
  private
    FSQLTareaObra : String;
    procedure CargarVisitas;
    function ArmarWhere : String;
  public
  protected
    procedure RefreshData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmTableroCO: TfrmTableroCO;

implementation

uses unCustomConsulta, CUIT, unReasignacionCP, unPrincipal, unConsultaVisitasAnual;

{$R *.dfm}

procedure TfrmTableroCO.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hot_observaciontableroco';
//  FieldBaja :=  'ot_fechabaja';

  FSQLTareaObra := sdqTareasObra.SQL.Text;

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

  edFechaFinAODesdeFiltro.Date := DBDate;
  tbSalir.Left := tbSalir.Left + 170;
end;

procedure TfrmTableroCO.fraDepartcmbDescripcionChange(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmTableroCO.fraDepartcmbDescripcionExit(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmTableroCO.tbExportarVisitasClick(Sender: TObject);
var
  sWhere : String;
  AutoCols : Boolean;
begin
  inherited;
  sWhere := ArmarWhere;
  sdqTareasObra.SQL.Text := FSQLTareaObra + sWhere + ' ORDER BY em_cuit, tablero.ts_estableci, pv_mes DESC';
  sdqTareasObra.Open;

  if sdqTareasObra.Active and (not sdqTareasObra.IsEmpty) then begin
     tbExportarVisitas.Enabled := False;
     Try
       AutoCols := ExportDialogTareasObra.Fields.Count = 0;
       try
         if AutoCols Then
           ExportDialogTareasObra.Fields.Assign( dbgTareasObra.Columns );

         ExportDialogTareasObra.Execute;
       finally
         if AutoCols Then
            ExportDialogTareasObra.Fields.Clear;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
end;

procedure TfrmTableroCO.tbLimpiarClick(Sender: TObject);
begin
  edFechaFinAODesdeFiltro.Date := DBDate;
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
  chkSoloInconistentes.Checked := false;
  cbExcavacion.Checked := False;
  cbExcavacion503.Checked := False;
  cbDemolicion.Checked := False;
  inherited;
end;


procedure TfrmTableroCO.tbProximasVisitasClick(Sender: TObject);
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

procedure TfrmTableroCO.RefreshData;
var
  sSql: String;
  sWhere: String;

begin
  sSql := 'SELECT em_cuit, ' +
          '       em_nombre, ' +
          '       co_contrato, ' +
          '       ts_idempresa, ' +
          '       ts_estableci, ' +
          '       es_nombre, ' +
          '       prevprgseg.it_nombre prevprgseg, ' +
          '       ts_tipostr, ' +
          '       ts_actividad, ' +
          '       te_codigo tipoestabprev, ' +
          '       ac_relacion, ' +
          '       ac_codigo, ' +
          '       ac_descripcion, ' +
          '       DECODE (ts_eventual, ''S'', ''Si'', ''No'') ts_eventual, ' +
          '       DECODE (ts_avisoobra, ''S'', ''Si'', ''No'') ts_avisoobra, ' +
          '       ts_fecharecepcionao, ' +
          '       ts_fechacargaao, ' +
          '       DECODE (ts_programaseguridad, ''S'', ''Si'', ''No'') ts_programaseguridad, ' +
          '       ts_fecharecepcionps, ' +
          '       ts_idpreventoraprobacionps, ' +
          '       ts_fechaaprobacionps, ' +
          '       ts_fechadenunciaao, ' +
          '       ts_denunciaps, ' +
          '       ts_denunciapsfueratermino, ' +
          '       DECODE (ts_demolicion, ''S'', ''Si'', ''No'') ts_demolicion, ' +
          '       ts_fechadesdedemolicion, ' +
          '       ts_fechahastademolicion, ' +
          '       DECODE (ts_excavacion, ''S'', ''Si'', ''No'') ts_excavacion, ' +
          '       ts_fechadesdeexcavacion, ' +
          '       ts_fechahastaexcavacion, ' +
          '       DECODE (ts_excavacion503, ''S'', ''Si'', ''No'') ts_excavacion503, ' +
          '       ts_fechadesdeexcavacion503, ' +
          '       ts_fechahastaexcavacion503, ' +
          '       ts_fechainicioobra, ' +
          '       ts_fechaextension, ' +
          '       ts_fechasuspension, ' +
          '       ts_fechafinobra, ' +
          '       ts_fechareinicio, ' +
          '       ts_fechafinoriginal, ' +
          '       ts_fechaaltaestab, ' +
          '       ts_fechaalta, ' +
          '       ts_fechamodif, ' +
          '       ts_fechabajaestab, ' +
          '       ts_fechabajacontrato, ' +
          '       ts_fechavigenciatraspaso, ' +
          '       ts_cumplimiento cumplimiento, ' +
          '       DECODE (ts_tareasfuturas, ''S'', ''Si'', ''No'') tareasfuturas, ' +
          '       ts_id, ' +
          '       art.hys.get_nombre_preventor_estab (em_cuit, ts_estableci, art.actualdate ) nombrepreventorestab, '+
          '       art.hys.get_preventor_estab (em_cuit, ts_estableci, art.actualdate ) codigopreventorestab, '+
          '       art.afi.armar_domicilio (es_calle, es_numero, es_piso, es_departamento, art.afi.armar_localidad (es_cpostal, '+
          '                                es_localidad, es_provincia)) domicilioestab, art.hys.get_cantdiasobraoriginal (co_contrato, ts_estableci, ''S'' ) CantidaddiasObra, '+
          '       ts_observaciones, ts_ultimorar, ts_rgrl, ts_fechaverosimilitud, ts_fechaultcapacitacion '+
          '  FROM art.pit_firmantes prevprgseg, comunes.cac_actividad, hys.hte_tipoempresaprev, afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa, hys.hts_tableroseguimientoco tablero ' +
          ' WHERE em_id = ts_idempresa ' +
          '   AND co_idempresa = em_id ' +
          '   AND es_contrato = co_contrato ' +
          '   AND es_nroestableci = ts_estableci ' +
          '   AND co_contrato = NVL (art.afiliacion.get_contratovigente (em_cuit, ts_fechaalta), art.get_vultcontrato (em_cuit)) ' +
          '   AND ts_tipoprev = te_id ' +
          '   AND ac_id = es_idactividad ' +
          '   AND ts_idpreventoraprobacionps = prevprgseg.it_id(+) ';

  sWhere := ArmarWhere;

  if SortDialog.OrderBy = '' then
    sdqConsulta.Sql.Text := sSql + ' ' + sWhere + ' ORDER BY em_cuit, ts_estableci '
  else
     sdqConsulta.Sql.Text := sSql + ' ' + sWhere + SortDialog.OrderBy;
  inherited;
end;

function TfrmTableroCO.ArmarWhere: String;
var
  sWhere: String;
  i: integer;
  sIn: String;
begin
  sWhere := '';

  if chkSoloInconistentes.Checked then
    sWhere := sWhere + ' AND EXISTS(SELECT 1 ' +
                       '              FROM hys.hco_casoobservable, hys.hot_observaciontableroep ' +
                       '            WHERE ot_idtablero = tablero.ts_id ' +
                       '              AND ot_idobservacion = co_id ' +
                       '              AND co_tipo = ''I''' +
                       '              AND ot_fechabaja IS NULL ' +
                       '              AND co_fechabaja IS NULL ' +
                       '              AND ot_fecharesuelto IS NULL )';

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND tablero.ts_idempresa = '+SqlValue(fraEmpresaFiltro.Value);

  if edEstablecimiento.Text <> '' then
    sWhere := sWhere + ' AND tablero.ts_estableci IN  ('+edEstablecimiento.Text+')';

  if chkExcluirBajasEstabs.Checked then
    sWhere := sWhere + ' AND tablero.ts_fechabajaestab IS NULL ';

  if chkExcluirBajasEmpresas.Checked then
    sWhere := sWhere + ' AND tablero.ts_fechabajacontrato IS NULL ';

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
    sWhere := sWhere + ' AND art.hys.get_preventor_estab (em_cuit, ts_estableci, art.actualdate) = ' + SqlValue(fraPreventorFiltro.Codigo);

    {' AND EXISTS (SELECT 1 ' +
                       '              FROM hys.hpv_procesovisita, hys.hps_planhys, hys.hts_tareahys tarea ' +
                       '             WHERE tablero.ts_idempresa = tarea.ts_idempresa ' +
                       '                AND tablero.ts_estableci = tarea.ts_estableci ' +
                       '                AND ts_idplan = ps_id ' +
                       '                AND tarea.ts_fechabaja IS NULL ' +
                       '                AND ps_fechabaja IS NULL ' +
                       '                AND NOT EXISTS (SELECT 1 ' +
                       '                                  FROM hys.hta_tarea ' +
                       '                                 WHERE ta_complementaria = ''S'' ' +
                       '                                   AND tarea.ts_idtarea = ta_id) ' +
                       '                AND tarea.ts_idproceso = pv_id ' +
                       '                AND ps_idpreventor = ' + SqlValue(fraPreventorFiltro.Value) +
                       '                AND pv_tipoproceso = ''M'')'};


  if fraCoordinadorFiltro.IsSelected then
    sWhere := sWhere + ' AND  art.hys.get_preventor_estab (em_cuit, ts_estableci, art.actualdate) in (SELECT it_codigo ' +
                       '              FROM art.pit_firmantes ' +
                       '             WHERE it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value) + ' )';

  if fraLocalidad.IsSelected then
    sWhere := sWhere + fraLocalidad.GetWhere;

  if fraDepart.IsSelected then
    sWhere := sWhere + ' AND art.utiles.get_partido(es_cpostal, es_provincia) = ' + SqlValue(fraDepart.cmbDescripcion.Text);

  if edFechaFinAODesdeFiltro.Date <> 0 then
  sWhere := sWhere + ' AND NVL(tablero.ts_fechaextension, tablero.ts_fechafinobra) >= '+SqlDate(edFechaFinAODesdeFiltro.Date);

  if edFechaFinAOHastaFiltro.Date <> 0 then
  sWhere := sWhere + ' AND NVL(tablero.ts_fechaextension, tablero.ts_fechafinobra) <= '+SqlDate(edFechaFinAOHastaFiltro.Date);

  if cbExcavacion.Checked then
    sWhere := sWhere + ' AND tablero.ts_excavacion = '+ SqlValue(cmbExcavacion.Value);

  if cbExcavacion503.Checked then
    sWhere := sWhere + ' AND tablero.ts_excavacion503 = '+ SqlValue(cmbExcavacion503.Value);

  if cbDemolicion.Checked then
    sWhere := sWhere + ' AND tablero.TS_DEMOLICION = '+ SqlValue(cmbDemolicion.Value);

  Result := sWhere;
end;

procedure TfrmTableroCO.CargarVisitas;
begin
  if not gbVisitas.Collapsed and not sdqConsulta.IsEmpty then
  begin
    sdqVisitas.Close;
    sdqVisitas.ParamByName('idempresa').Value := sdqConsulta.fieldbyname('ts_idempresa').AsInteger;
    sdqVisitas.ParamByName('estableci').Value := sdqConsulta.fieldbyname('ts_estableci').AsInteger;
    sdqVisitas.Open;
  end;
end;

procedure TfrmTableroCO.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CargarVisitas;
end;

procedure TfrmTableroCO.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CargarVisitas;
end;

procedure TfrmTableroCO.gbVisitasExpanded(Sender: TObject);
begin
  inherited;
  CargarVisitas;
end;

procedure TfrmTableroCO.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqVisitas.Close;
end;

procedure TfrmTableroCO.gbDetalleTareasCollapsed(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmTableroCO.GridGetCellParams(Sender: TObject;
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

procedure TfrmTableroCO.ClearControls;
begin
  inherited;
//
end;

function TfrmTableroCO.DoABM: Boolean;
begin
  result := true;
//
end;


function TfrmTableroCO.Validar: Boolean;
begin
//
  result := true;
end;

procedure TfrmTableroCO.LoadControls;
begin
  inherited;
//
end;

procedure TfrmTableroCO.dbgVisitasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqVisitas.Active and (sdqVisitas.FieldByName('cumplimiento').AsInteger < 0) then
    AFont.Color := clBlue;
end;

procedure TfrmTableroCO.tbSumatoriaClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active then
    MsgBox('La cantidad de registros es: ' + IntToStr(sdqConsulta.RecordCount), MB_ICONINFORMATION, Self.Caption);
end;


end.
