unit unTableroET;

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
  TfrmTableroET = class(TfrmCustomGridABM)
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
    fraOperativo: TfraCodigoDescripcion;
    Label6: TLabel;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaTS_ESTABLECI: TFloatField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaCOORDINADOR: TStringField;
    sdqConsultaTS_TIPOSTR: TStringField;
    sdqConsultaTS_ACTIVIDAD: TStringField;
    sdqConsultaTIPOESTABPREV: TStringField;
    sdqConsultaAC_RELACION: TStringField;
    sdqConsultaAC_CODIGO: TStringField;
    sdqConsultaAC_DESCRIPCION: TStringField;
    sdqConsultaTS_OPERATIVO: TStringField;
    sdqConsultaMOTIVOINGRESO: TStringField;
    sdqConsultaTS_ESTABPRAM: TStringField;
    sdqConsultaTS_FECHANOTIFICACION: TDateTimeField;
    sdqConsultaTS_ESTABNOTIFICACION: TFloatField;
    sdqConsultaTS_ANEXO1: TStringField;
    sdqConsultaTS_CANTSINIESTROSAN1: TFloatField;
    sdqConsultaTS_FECHADENUNCIAANEXO1: TDateTimeField;
    sdqConsultaTS_ANEXO2: TStringField;
    sdqConsultaTS_PRS: TStringField;
    sdqConsultaTS_FECHADENUNCIAPRS: TDateTimeField;
    sdqConsultaTS_CANTVISITASVERIF: TFloatField;
    sdqConsultaTS_FECHAULTVERIF: TDateTimeField;
    sdqConsultaTS_FECHAVISITA1: TDateTimeField;
    sdqConsultaTS_FECHAVISITA2: TDateTimeField;
    sdqConsultaTS_FECHAVISITA3: TDateTimeField;
    sdqConsultaTS_FECHAVISITA4: TDateTimeField;
    sdqConsultaTS_FIRMASPRS: TStringField;
    sdqConsultaTS_PAL: TStringField;
    sdqConsultaTS_FECHADENUNCIAPAL: TDateTimeField;
    sdqConsultaTS_FIRMASPAL: TStringField;
    sdqConsultaTS_ULTIMORAR: TDateTimeField;
    sdqConsultaTS_IARC: TStringField;
    sdqConsultaTS_RGRL: TDateTimeField;
    sdqConsultaTS_FECHAVEROSIMILITUD: TDateTimeField;
    sdqConsultaTS_CORRESPONDEVEROSIMILITUD: TStringField;
    sdqConsultaTS_CANCERIGENOS: TStringField;
    sdqConsultaTS_DIFENILOS: TStringField;
    sdqConsultaTS_ACCMAYORES: TStringField;
    sdqConsultaTS_FECHADEFINICION: TDateTimeField;
    sdqConsultaTS_FECHAALTAESTAB: TDateTimeField;
    sdqConsultaTS_IDPREVENTOR: TFloatField;
    sdqConsultaTS_FECHAALTA: TDateTimeField;
    sdqConsultaTS_FECHAMODIF: TDateTimeField;
    sdqConsultaTS_VISITA1: TStringField;
    sdqConsultaTS_VISITA2: TStringField;
    sdqConsultaTS_VISITA3: TStringField;
    sdqConsultaTS_VISITA4: TStringField;
    sdqConsultaTS_CANTMORTALESAN1: TFloatField;
    sdqConsultaTS_FECHABAJAESTAB: TDateTimeField;
    sdqConsultaTS_VISITA1CANTREC: TFloatField;
    sdqConsultaTS_VISITA1CANTVERIF: TFloatField;
    sdqConsultaTS_VISITA2CANTREC: TFloatField;
    sdqConsultaTS_VISITA2CANTVERIF: TFloatField;
    sdqConsultaTS_VISITA3CANTREC: TFloatField;
    sdqConsultaTS_VISITA3CANTVERIF: TFloatField;
    sdqConsultaTS_VISITA4CANTREC: TFloatField;
    sdqConsultaTS_VISITA4CANTVERIF: TFloatField;
    sdqConsultaPORCVISITA1: TFloatField;
    sdqConsultaPORCVISITA2: TFloatField;
    sdqConsultaPORCVISITA3: TFloatField;
    sdqConsultaPORCVISITA4: TFloatField;
    sdqConsultaTS_FECHABAJACONTRATO: TDateTimeField;
    sdqConsultaTS_FECHAALTAANEXO1: TDateTimeField;
    sdqConsultaTS_FECHAPRESENTACIONAN1: TDateTimeField;
    sdqConsultaSUBTIPO: TStringField;
    sdqConsultaTS_FECHAULTVISITA: TDateTimeField;
    sdqConsultaTS_FECHAULTCAPACIT: TDateTimeField;
    sdqConsultaTS_FECHAVIGENCIATRASPASO: TDateTimeField;
    sdqConsultaTS_ID: TFloatField;
    chkSoloInconistentes: TCheckBox;
    sdqConsultaTS_PRSAMERITA: TStringField;
    sdqConsultaTS_PALAMERITA: TStringField;
    sdqConsultaTRABPROMULTANO: TFloatField;
    sdqConsultaTRABACTUAL: TFloatField;
    sdqConsultaPREVULTVIS: TStringField;
    sdqConsultaTS_ENFERPROFESIONALESAN1: TFloatField;
    fraObservaciones: TfraMultiSeleccion;
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
  frmTableroET: TfrmTableroET;

implementation

uses unCustomConsulta, CUIT, unReasignacionCP, unPrincipal, unConsultaVisitasAnual;

{$R *.dfm}

procedure TfrmTableroET.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hot_observaciontableroet';
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

  with fraOperativo do
  begin
    TableName    := 'ART.POP_OPERATIVO';
    FieldID      := 'OP_CODIGO';
    FieldCodigo  := 'OP_CODIGO';
    FieldDesc    := 'OP_DESCRIPCION';
    FieldBaja    := 'OP_FECHABAJA';
  end;

  with fraObservaciones do
  begin
    TableName    := 'HYS.HCO_CASOOBSERVABLE';
    FieldID      := 'CO_ID';
    FieldCodigo  := 'CO_ID';
    FieldDesc    := 'CO_DESCRIPCION';
    FieldBaja    := 'CO_FECHABAJA';
    ShowBajas := false;
    ShowFilterPanel := true;
    Refresh;
  end;

  SetUltOperativo;
  tbSalir.Left := tbSalir.Left + 170;
end;

procedure TfrmTableroET.fraDepartcmbDescripcionChange(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmTableroET.fraDepartcmbDescripcionExit(
  Sender: TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
  inherited;
end;

procedure TfrmTableroET.tbLimpiarClick(Sender: TObject);
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


procedure TfrmTableroET.tbProximasVisitasClick(Sender: TObject);
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

procedure TfrmTableroET.RefreshData;
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
          '       DECODE (ts_motivoingreso, ''I'', ''Indice'', ''Mortal'') motivoingreso, ' +
          '       DECODE (ts_estabpram, ''S'', ''Si'', ''N'', ''No'', ts_estabpram) ts_estabpram, ' +
          '       ts_fechanotificacion, ' +
          '       ts_estabnotificacion, ' +
          '       DECODE (ts_anexo1, ''S'', ''Si'', ''N'', ''No'', ''F'', ''Ficticio'', ''Z'', ''No Corresponde'', ''ZF'', ''No Corresponde'', ''ZS'', ''No Corresponde pero tiene'', ts_anexo1) ts_anexo1, ' +
          '       ts_cantsiniestrosan1, ' +
          '       ts_enferprofesionalesan1, ' +
          '       ts_fechadenunciaanexo1, ' +
          '       DECODE (ts_anexo2, ''S'', ''Si'', ''N'', ''No'', ''Z'', ''No Corresponde'', ''ZS'', ''No Corresponde pero tiene'', ts_anexo2) ts_anexo2, ' +
          '       DECODE (ts_prs, ''S'', ''Si'', ''N'', ''No'', ''X'', ''No Amerita'', ''Z'', ''No Corresponde'', ''XS'', ''No Amerita pero tiene'', ''ZS'', ''No Corresponde pero tiene'', ts_prs) ts_prs, ' +
          '       ts_fechadenunciaprs, ' +
          '       ts_cantvisitasverif, ' +
          '       ts_fechaultverif, ' +
          '       ts_fechavisita1, ' +
          '       ts_fechavisita2, ' +
          '       ts_fechavisita3, ' +
          '       ts_fechavisita4, ' +
          '       CASE WHEN instr(ts_firmasprs, ''1'') > 0 THEN ''-Empleador/Responsable '' END || CASE WHEN instr(ts_firmasprs, ''2'') > 0 THEN '' -Serv.HyS'' END || ' +
          '       CASE WHEN instr(ts_firmasprs, ''3'') > 0 THEN ''-Serv.ML'' END || CASE WHEN instr(ts_firmasprs, ''4'') > 0 THEN '' -Repres.Trabajadores/Gremial'' END ts_firmasprs, ' +
          '       CASE WHEN instr(ts_firmaspal, ''1'') > 0 THEN ''-Empleador/Responsable '' END || CASE WHEN instr(ts_firmaspal, ''2'') > 0 THEN '' -Serv.HyS'' END || ' +
          '       CASE WHEN instr(ts_firmaspal, ''3'') > 0 THEN ''-Serv.ML'' END || CASE WHEN instr(ts_firmaspal, ''4'') > 0 THEN '' -Repres.Trabajadores/Gremial'' END ts_firmaspal, ' +
          '       DECODE (ts_pal, ''S'', ''Si'', ''N'', ''No'', ''X'', ''No Amerita'', ''Z'', ''No Corresponde'', ''XS'', ''No Amerita pero tiene'', ''ZS'', ''No Corresponde pero tiene'', ts_pal) ts_pal, ' +
          '       ts_fechadenunciapal, ' +
          '       ts_firmaspal, ' +
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
          '       ts_cantmortalesan1, ' +
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
          '       ts_fechaaltaanexo1, ' +
          '       ts_fechapresentacionan1, ' +
          '       st_descripcion subtipo, ' +
          '       ts_fechaultvisita, ' +
          '       ts_fechaultcapacit, ' +
          '       ts_fechavigenciatraspaso, ' +
          '       DECODE (ts_prsamerita, ''S'', ''Si'', ''N'', ''No'', ts_prsamerita) ts_prsamerita, ' +
          '       DECODE (ts_palamerita, ''S'', ''Si'', ''N'', ''No'', ts_palamerita) ts_palamerita, ' +
//          '       CASE WHEN ts_fechapresentacionan1 IS NOT NULL THEN (40 - art.varios.get_cantdiashabiles (ts_fechapresentacionan1, TRUNC (SYSDATE))) ELSE NULL END DiasFaltantesDenPRSPAL, ' +
          '       (SELECT TRUNC (AVG (rc_empleados)) ' +
          '         FROM zrc_resumencobranza ' +
          '        WHERE rc_contrato = co_contrato ' +
          '         AND rc_periodo BETWEEN ts_operativo AND art.Periodo_Proximo(ts_operativo, 11)) TrabPromUltAno, ' +
          '       NVL (co_totempleadosactual, co_totempleados) trabactual, ' +
          '       ts_id ' +
          '  FROM hys.hst_subtipo, art.pit_firmantes prevultvis, art.pit_firmantes pit, comunes.cac_actividad, hys.hte_tipoempresaprev, afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa, hys.hts_tableroseguimientoet ' +
          ' WHERE em_id = ts_idempresa ' +
          '   AND co_idempresa = em_id ' +
          '   AND es_contrato = co_contrato ' +
          '   AND es_nroestableci = ts_estableci ' +
          '   AND co_contrato = NVL (art.afiliacion.get_contratovigente (em_cuit, ts_fechaalta), art.get_vultcontrato (em_cuit)) ' +
          '   AND ts_tipoprev = te_id ' +
          '   AND ac_id = es_idactividad ' +
          '   AND ts_subtipo = st_id(+) ' +
          '   AND ts_idpreventor = pit.it_id(+) ' +
          '   AND ts_idprevultvisita = prevultvis.it_id(+) ' +
          '   AND ts_fechabaja IS NULL '+
          '   AND NOT EXISTS(SELECT 1 ' +
          '        FROM hys.pev_estabeventual ' +
          '       WHERE ev_id = es_idestabeventual ' +
          '         AND ev_asignable = ''N'') ';

  sWhere := '';

  if fraOperativo.IsSelected then
    sWhere := sWhere + ' AND ts_operativo = '+SqlValue(fraOperativo.Value);

  if chkSoloInconistentes.Checked then
    sWhere := sWhere + ' AND EXISTS(SELECT 1 ' +
                       '              FROM hys.hco_casoobservable, hys.hot_observaciontableroet ' +
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

  if fraObservaciones.CheckCount > 0 then
    sWhere := sWhere + ' AND EXISTS (SELECT 1 FROM hys.hot_observaciontableroet WHERE ot_idtablero = ts_id AND ot_fecharesuelto IS NULL AND ot_fechabaja IS NULL ' + fraObservaciones.InSQL_IntegerValues('ot_idobservacion', false) +  ')';

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

procedure TfrmTableroET.CargarObservaciones;
begin
  if not gbObservaciones.Collapsed and not sdqConsulta.IsEmpty then
  begin
    sdqObservaciones.Close;
    sdqObservaciones.ParamByName('idtablero').Value := sdqConsulta.fieldbyname('ts_id').AsInteger;
    sdqObservaciones.Open;
  end;
end;

procedure TfrmTableroET.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CargarObservaciones;
end;

procedure TfrmTableroET.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CargarObservaciones;
end;

procedure TfrmTableroET.SetUltOperativo;
begin
  fraOperativo.Value := ValorSql('SELECT MAX (vo_operativo) ' +
                                 ' FROM hys.hvo_vigenciaoperativo ' +
                                 ' WHERE vo_tipo = ''ET''');
end;

procedure TfrmTableroET.gbObservacionesExpanded(Sender: TObject);
begin
  inherited;
  CargarObservaciones;
end;

procedure TfrmTableroET.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqObservaciones.Close;
end;

procedure TfrmTableroET.gbDetalleTareasCollapsed(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmTableroET.GridGetCellParams(Sender: TObject;
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

procedure TfrmTableroET.ClearControls;
begin
  inherited;
//
end;

function TfrmTableroET.DoABM: Boolean;
begin
  result := true;
//
end;


function TfrmTableroET.Validar: Boolean;
begin
//
  result := true;
end;

procedure TfrmTableroET.LoadControls;
begin
  inherited;
//
end;

procedure TfrmTableroET.dbgObservacionesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqObservaciones.Active and not (sdqObservaciones.FieldByName('OT_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmTableroET.tbSumatoriaClick(Sender: TObject);
begin
  inherited;
  if sdqConsulta.Active then
    MsgBox('La cantidad de registros es: ' + IntToStr(sdqConsulta.RecordCount), MB_ICONINFORMATION, Self.Caption);
end;


end.
