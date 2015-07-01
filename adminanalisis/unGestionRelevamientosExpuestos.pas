unit unGestionRelevamientosExpuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, PeriodoPicker,
  unFraCodigoDescripcion, unFraEstablecimiento, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Menus, PatternEdit,
  ComboEditor, CheckCombo, Mask, ToolEdit, SqlFuncs, IntEdit, unGrids;

type
  TfrmGestionRelevamientosExpuestos = class(TfrmCustomGridABM)
    lbCUIT: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    fraEstablecimientoFiltro: TfraEstablecimiento;
    lbEstablecimiento: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edPeriodoDesde: TPeriodoPicker;
    edPeriodoHasta: TPeriodoPicker;
    tbReclamo: TToolButton;
    pmnuReclamo: TPopupMenu;
    mnuVentanilla: TMenuItem;
    mnuFax: TMenuItem;
    mnuMail: TMenuItem;
    mnuCarta: TMenuItem;
    edFechaReclamoDesde: TDateEdit;
    lbFechaAccidenteFiltro: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edFechaReclamoHasta: TDateEdit;
    Label6: TLabel;
    cmbReclamo: TCheckCombo;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    ShortCutControl1: TShortCutControl;
    dbgEstablecimiento: TArtDBGrid;
    tbEstablecimientos: TToolBar;
    ToolButton2: TToolButton;
    tbRefrescarEstablecimiento: TToolButton;
    ToolButton7: TToolButton;
    tbOcultarGridEstablecimiento: TToolButton;
    Splitter: TSplitter;
    dsDatosEstablecimiento: TDataSource;
    sdqDatosEstablecimiento: TSDQuery;
    sdqDatosEstablecimientoES_ID: TFloatField;
    sdqDatosEstablecimientoES_NROESTABLECI: TFloatField;
    sdqDatosEstablecimientoES_NOMBRE: TStringField;
    sdqDatosEstablecimientoES_NUMERO: TStringField;
    sdqDatosEstablecimientoES_PISO: TStringField;
    sdqDatosEstablecimientoES_DEPARTAMENTO: TStringField;
    sdqDatosEstablecimientoES_CPOSTAL: TStringField;
    sdqDatosEstablecimientoES_CPOSTALA: TStringField;
    sdqDatosEstablecimientoES_CALLE: TStringField;
    sdqDatosEstablecimientoES_LOCALIDAD: TStringField;
    sdqDatosEstablecimientoES_PROVINCIA: TStringField;
    sdqDatosEstablecimientoPV_DESCRIPCION: TStringField;
    tbPresentacion: TToolButton;
    fpDefinirPresentacion: TFormPanel;
    Bevel1: TBevel;
    btnAceptarPresentacion: TButton;
    btnCancelarPresentacion: TButton;
    GroupBox1: TGroupBox;
    fraEstadoPresentacion: TfraCodigoDescripcion;
    fraCausa: TfraCodigoDescripcion;
    Label8: TLabel;
    Label9: TLabel;
    cbNotifPreventor: TCheckBox;
    sdqDatosEstablecimientoGE_ID: TFloatField;
    sdqDatosEstablecimientoGE_IDPREVNOTIFICACION: TFloatField;
    sdqDatosEstablecimientoGE_FECHANOTIFPREVENTOR: TDateTimeField;
    sdqDatosEstablecimientoGE_IDESTADO: TFloatField;
    sdqDatosEstablecimientoGE_IDCAUSA: TFloatField;
    sdqDatosEstablecimientoGE_NOTIFICARALPREV: TStringField;
    sdqDatosEstablecimientoGE_PRESENTORELEV: TStringField;
    sdqDatosEstablecimientoGE_FECHAALTA: TDateTimeField;
    sdqDatosEstablecimientoGE_USUALTA: TStringField;
    sdqDatosEstablecimientoGE_FECHAMODIF: TDateTimeField;
    sdqDatosEstablecimientoGE_USUMODIF: TStringField;
    sdqDatosEstablecimientoGE_FECHABAJA: TDateTimeField;
    sdqDatosEstablecimientoGE_USUBAJA: TStringField;
    sdqDatosEstablecimientoGE_IDESTAB: TFloatField;
    sdqDatosEstablecimientoCA_ID: TFloatField;
    sdqDatosEstablecimientoCA_IDESTADO: TFloatField;
    sdqDatosEstablecimientoCA_DESCRIPCION: TStringField;
    sdqDatosEstablecimientoCA_FECHAALTA: TDateTimeField;
    sdqDatosEstablecimientoCA_USUALTA: TStringField;
    sdqDatosEstablecimientoCA_FECHAMODIF: TDateTimeField;
    sdqDatosEstablecimientoCA_USUMODIF: TStringField;
    sdqDatosEstablecimientoCA_FECHABAJA: TDateTimeField;
    sdqDatosEstablecimientoCA_USUBAJA: TStringField;
    sdqDatosEstablecimientoEP_ID: TFloatField;
    sdqDatosEstablecimientoEP_DESCRIPCION: TStringField;
    sdqDatosEstablecimientoEP_FECHAALTA: TDateTimeField;
    sdqDatosEstablecimientoEP_USUALTA: TStringField;
    sdqDatosEstablecimientoEP_FECHAMODIF: TDateTimeField;
    sdqDatosEstablecimientoEP_USUMODIF: TStringField;
    sdqDatosEstablecimientoEP_FECHABAJA: TDateTimeField;
    sdqDatosEstablecimientoEP_USUBAJA: TStringField;
    sdqDatosEstablecimientoIT_NOMBRE: TStringField;
    sdqDatosEstablecimientoTIPOEMPRESA: TStringField;
    sdqDatosEstablecimientoFECHAULTIMORELEV: TDateTimeField;
    sdqDatosEstablecimientoGE_IDHISTORICOCONTRATO: TFloatField;
    tbReclamoPresentacion: TToolButton;
    cmbEstado: TCheckCombo;
    cbPresentoRelev: TCheckBox;
    rgModoNotif: TRadioGroup;
    Label7: TLabel;
    Label11: TLabel;
    fraPreventorNotif: TfraCodigoDescripcion;
    mnuNinguno: TMenuItem;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edPorcentajePresentacionMin: TIntEdit;
    edPorcentajePresentacionMax: TIntEdit;
    Label14: TLabel;
    Label15: TLabel;
    cbEmpConCorreo: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    sdqDatosEstablecimientoCA_NOTIFPREV: TStringField;
    sdqDatosEstablecimientoCA_NOTIFEMPRESA: TStringField;
    sdqDatosEstablecimientoEXISTERELEV: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraEmpresaFiltroOnChange(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuVentanillaClick(Sender: TObject);
    procedure mnuMailClick(Sender: TObject);
    procedure mnuFaxClick(Sender: TObject);
    procedure mnuCartaClick(Sender: TObject);
    procedure tbOcultarGridEstablecimientoClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbRefrescarEstablecimientoClick(Sender: TObject);
    procedure tbPresentacionClick(Sender: TObject);
    procedure btnAceptarPresentacionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbReclamoPresentacionClick(Sender: TObject);
    procedure dbgEstablecimientoDblClick(Sender: TObject);
    procedure cbPresentoRelevClick(Sender: TObject);
    procedure cbNotifPreventorClick(Sender: TObject);
    procedure mnuNingunoClick(Sender: TObject);
    procedure dbgEstablecimientoCellClick(Column: TColumn);
    procedure dbgEstablecimientoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgEstablecimientoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEstablecimientoGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure tbExportarClick(Sender: TObject);
  private
    Sql: TCustomSql;
    FContratoAnterior : String;
    SelectedList: TBookMarkLst;
    SelectedListEstablecimiento: TBookMarkLst;
    procedure CargarGestionRelev(idhistcontrato : Integer; tipoGestion : Integer;estado : String = '');
    procedure ProcesarReclamo(tipoGestion: Integer);
    procedure ClearDefinirPresentacion;
//    function tipoModoNotif: String;
    procedure LoadDefinirPresentacion;
    procedure ValidarPresentacion;
    procedure fraEstadoPresentacionOnChange(Sender: TObject);
    procedure fraCausaOnChange(Sender: TObject);
    procedure GuardarPresentacion;
  public
    { Public declarations }
  end;

var
  frmGestionRelevamientosExpuestos: TfrmGestionRelevamientosExpuestos;

const
  MAILRECLAMO = 3;
  VENTANILLARECLAMO = 1;
  FAXRECLAMO = 2;
  CARTARECLAMO = 4;
  NINGUNRECLAMO = 5;
implementation

uses unDmPrincipal, AnsiSql, unCustomConsulta, VclEXtra, CustomDlgs, unSesion, unrptReclamoNominaEmpresa,
  General, Math, DBSql;

{$R *.dfm}

procedure TfrmGestionRelevamientosExpuestos.FormCreate(Sender: TObject);
begin
  inherited;
  Sql := TDBSql.Create;

  tbSalir.left := tbReclamoPresentacion.left + 100;

  //tbReclamo.Left := tbDesSeleccionarTodo.Left-5;
  //tbDesSeleccionarTodo.Left := tbSeleccionarTodo.Left-5;
  //tbSeleccionarTodo.Left := tbSalir.left-5;
  //tbReclamoPresentacion.Left := tbSalir.left-5;

  //tbSalir.Left := tbReclamoPresentacion.left+20;
  FContratoAnterior := '';
  fraEmpresaFiltro.ShowBajas := True;
  sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
  SelectedList := TBookMarkLst.Create;
  SelectedListEstablecimiento := TBookMarkLst.Create;
  with GetQuery('SELECT * FROM HYS.HTR_TIPORECLAMO ') do
  try
    cmbReclamo.Items.AddObject('SIN RECLAMO', TObject(0));
    while not Eof do
    begin
      cmbReclamo.Items.AddObject(fieldbyname('tr_descripcion').AsString, TObject(fieldbyname('tr_id').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  cmbEstado.Items.AddObject('Sin Estado', TObject('N'));
  cmbEstado.Items.AddObject('Pendiente', TObject('P'));
  cmbEstado.Items.AddObject('Reclamado', TObject('R'));
  cmbEstado.Items.AddObject('Vencido', TObject('V'));

  fraEmpresaFiltro.OnChange := fraEmpresaFiltroOnChange;
  edPeriodoDesde.Periodo.SetPeriodo(
          ValorSql('SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -1), ''YYYYMM'' )'+
                   '  FROM DUAL'));
  edPeriodoHasta.Periodo.SetPeriodo(edPeriodoDesde.TEXT);
  with fraEstadoPresentacion do
  begin
    TableName   := 'HYS.HEP_ESTADOPRESENTACION';
    FieldID     := 'EP_ID';
    FieldCodigo := 'EP_ID';
    FieldDesc   := 'EP_DESCRIPCION';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    OnChange    := fraEstadoPresentacionOnChange;
    FieldBaja   := 'EP_FECHABAJA';
  end;
  with fraPreventorNotif do
  begin
    TableName   := 'art.pit_firmantes';
    FieldID     := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldDesc   := 'IT_NOMBRE';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    CaseSensitive := false;
    FieldBaja   := 'IT_FECHABAJA';
  end;
  with fraCausa do
  begin
    TableName   := 'HYS.HCA_CAUSA';
    FieldID     := 'CA_ID';
    FieldCodigo := 'CA_ID';
    FieldDesc   := 'CA_DESCRIPCION';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    OnChange    := fraCausaOnChange;
    ExtraCondition := ' AND CA_IDESTADO = 0';
    FieldBaja   := 'CA_USUBAJA';
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.fraEmpresaFiltroOnChange(Sender: TObject);
begin
  fraEstablecimientoFiltro.Contrato := fraEmpresaFiltro.Contrato;
end;

procedure TfrmGestionRelevamientosExpuestos.tbRefrescarClick(
  Sender: TObject);
var
  sSelect, sWhere : String;
  sIn : String;
  i : Integer;
begin
  Verificar(edPeriodoDesde.text = '', edPeriodoDesde, 'Debe tener Periodo');
  Verificar(edPeriodoHasta.text = '', edPeriodoHasta, 'Debe tener Periodo');

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND hc_contrato = '+ SqlValue(fraEmpresaFiltro.Contrato);

  if (cmbReclamo.Text <> '') then
  begin
    sIn := '';
    for i:=0 to cmbReclamo.Items.Count-1 do
      if cmbReclamo.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(integer(cmbReclamo.Items.Objects[i]));
      end;
  end;

  if edPorcentajePresentacionMin.Text <> '' then
    sWhere := sWhere   + ' AND (((SELECT COUNT(*) '+
    '                FROM hys.hge_gestionrelevestab '+
    '               WHERE ge_presentorelev = ''S'' '+
    '                 AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT COUNT(*) '+
    '                                                              FROM afi.aes_establecimiento '+
    '                                                             WHERE es_contrato = ahc.hc_contrato '+
    '                                                               AND es_fechabaja IS NULL)) '+
    '           * 100) >='+ SqlValue(edPorcentajePresentacionMin.Text);

  if edPorcentajePresentacionMax.Text <> '' then
    sWhere := sWhere   + ' AND (((SELECT COUNT(*) '+
    '                FROM hys.hge_gestionrelevestab '+
    '               WHERE ge_presentorelev = ''S'' '+
    '                 AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT COUNT(*) '+
    '                                                              FROM afi.aes_establecimiento '+
    '                                                             WHERE es_contrato = ahc.hc_contrato '+
    '                                                               AND es_fechabaja IS NULL)) '+
    '           * 100) <='+ SqlValue(edPorcentajePresentacionMax.Text);

  if (edFechaReclamoDesde.Date = edFechaReclamoHasta.Date) and
      (edFechaReclamoDesde.Date <> 0) then
     sWhere := sWhere + ' AND gr_fechareclamo = '+ SqlValue(edFechaReclamoDesde.Date)
  else
  begin
    if edFechaReclamoDesde.Date > 0 then
      sWhere := sWhere + ' AND gr_fechareclamo >= '+ SqlValue(edFechaReclamoDesde.Date);
    if edFechaReclamoHasta.Date > 0 then
      sWhere := sWhere + ' AND gr_fechareclamo <= '+ SqlValue(edFechaReclamoHasta.Date);
  end;

  if cbEmpConCorreo.Checked then
  begin
    sWhere := sWhere +' AND EXISTS(SELECT 1 '+
                 '        FROM afi.aco_contrato '+
                 '       WHERE co_contrato = hc_contrato and co_direlectronica IS NOT NULL)';

  end;

  if (sIn <> '') then
    sWhere := sWhere + ' and nvl(gr_tiporeclamo,0) in (' + sIn  + ')';
  sIn := '';

  if (cmbEstado.Text <> '') then
  begin
    sIn := '';
    for i:=0 to cmbEstado.Items.Count-1 do
      if cmbEstado.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(Char(cmbEstado.Items.Objects[i]));
      end;
  end;

  if (sIn <> '') then
    sWhere := sWhere + ' and nvl(GR_ESTADORECLAMO,''N'') in (' + sIn  + ')';

  sSelect :=
    ' SELECT   ahc.hc_id, NVL(ahc.hc_totempleadosactual, ahc.hc_totempleados) hc_totempleadosactual, em_cuit, em_nombre, '+
    '          ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, '+
    '          DECODE((SELECT COUNT(*) '+
    '             FROM afi.aes_establecimiento '+
    '            WHERE es_contrato = ahc.hc_contrato '+
    '              AND es_fechabaja IS NULL), '+
    '          0, '''', '+
    '          (((SELECT COUNT(*) '+
    '               FROM hys.hge_gestionrelevestab '+
    '              WHERE ge_presentorelev = ''S'' '+
    '                AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT COUNT(*) '+
    '                                                             FROM afi.aes_establecimiento '+
    '                                                            WHERE es_contrato = ahc.hc_contrato '+
    '                                                              AND es_fechabaja IS NULL)) '+
    '           * 100)) porpresent, '+
    '          gr_fechadenunciasrt, gr_fechasegdenuncia, gr_tiporeclamo, tr_descripcion, gr_fechareclamo, gr_id, '+
    '          DECODE(gr_estadoreclamo, ''P'', ''Pendiente'', ''R'', ''Reclamado'', ''V'', ''Vencido'') AS estado, hc_vigenciadesde vigencia '+
    '     FROM hys.htr_tiporeclamo, hys.hgr_gestionrelevamiento, afi.aem_empresa, afi.aen_endoso aen, ahc_historicocontrato ahc '+
    '    WHERE aen.en_idhistoricocontrato = ahc.hc_id '+
    '      AND hc_idempresa = em_id '+
    '      AND gr_idhistoricocontrato(+) = hc_id '+
    '      AND gr_tiporeclamo = tr_id(+) '+
    '      AND aen.en_motivo = ''0.01'' '+
    '      AND hc_vigenciadesde >= TO_DATE('+SqlValue(edPeriodoDesde.Periodo.Valor)+', ''YYYYMM'') '+
    '      AND hc_vigenciadesde <= LAST_DAY(TO_DATE('+SqlValue(edPeriodoHasta.Periodo.Valor)+', ''YYYYMM'')) '+sWhere+
    ' UNION ALL '+
    ' SELECT   ahc.hc_id, NVL(ahc.hc_totempleadosactual, ahc.hc_totempleados) hc_totempleadosactual, em_cuit, em_nombre, '+
    '          ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, '+
    '          DECODE((SELECT COUNT(*) '+
    '             FROM afi.aes_establecimiento '+
    '            WHERE es_contrato = ahc.hc_contrato '+
    '              AND es_fechabaja IS NULL), '+
    '          0, '''', '+
    '          (((SELECT COUNT(*) '+
    '               FROM hys.hge_gestionrelevestab '+
    '              WHERE ge_presentorelev = ''S'' '+
    '                AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT COUNT(*) '+
    '                                                             FROM afi.aes_establecimiento '+
    '                                                            WHERE es_contrato = ahc.hc_contrato '+
    '                                                              AND es_fechabaja IS NULL)) '+
    '           * 100)) porpresent, '+
    '          gr_fechadenunciasrt, gr_fechasegdenuncia, gr_tiporeclamo, tr_descripcion, gr_fechareclamo, gr_id, '+
    '          DECODE(gr_estadoreclamo, ''P'', ''Pendiente'', ''R'', ''Reclamado'', ''V'', ''Vencido'') AS estado, hc_vigenciahasta vigencia '+
    '     FROM hys.htr_tiporeclamo, hys.hgr_gestionrelevamiento, afi.aem_empresa, afi.aen_endoso aen, ahc_historicocontrato ahc '+
    '    WHERE aen.en_idhistoricocontrato = ahc.hc_id '+
    '      AND hc_idempresa = em_id '+
    '      AND gr_idhistoricocontrato(+) = hc_id '+
    '      AND gr_tiporeclamo = tr_id(+) '+
    '      AND aen.en_motivo = ''0.01'' '+
    '      AND hc_vigenciahasta >= TO_DATE('+SqlValue(edPeriodoDesde.Periodo.Valor)+', ''YYYYMM'') '+
    '      AND hc_vigenciahasta <= LAST_DAY(TO_DATE('+SqlValue(edPeriodoHasta.Periodo.Valor)+', ''YYYYMM'')) '+sWhere+
    ' UNION ALL '+
    ' SELECT   ahc.hc_id, NVL(ahc.hc_totempleadosactual, ahc.hc_totempleados) hc_totempleadosactual, em_cuit, em_nombre, '+
    '          ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, '+
    '          DECODE((SELECT COUNT(*) '+
    '             FROM afi.aes_establecimiento '+
    '            WHERE es_contrato = ahc.hc_contrato '+
    '              AND es_fechabaja IS NULL), '+
    '          0, '''', '+
    '          (((SELECT COUNT(*) '+
    '               FROM hys.hge_gestionrelevestab '+
    '              WHERE ge_presentorelev = ''S'' '+
    '                AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT COUNT(*) '+
    '                                                             FROM afi.aes_establecimiento '+
    '                                                            WHERE es_contrato = ahc.hc_contrato '+
    '                                                              AND es_fechabaja IS NULL)) '+
    '           * 100)) porpresent, '+
    '          gr_fechadenunciasrt, gr_fechasegdenuncia, gr_tiporeclamo, tr_descripcion, gr_fechareclamo, gr_id, '+
    '          DECODE(gr_estadoreclamo, ''P'', ''Pendiente'', ''R'', ''Reclamado'', ''V'', ''Vencido'') AS estado, hc_vigenciahasta vigencia '+
    '     FROM hys.htr_tiporeclamo, hys.hgr_gestionrelevamiento, afi.aem_empresa, afi.aen_endoso aen, ahc_historicocontrato ahc '+
    '    WHERE aen.en_idhistoricocontrato = ahc.hc_id '+
    '      AND hc_idempresa = em_id '+
    '      AND gr_idhistoricocontrato(+) = hc_id '+
    '      AND gr_tiporeclamo = tr_id(+) '+
    '      AND aen.en_motivo = ''11'' '+
    '      AND hc_vigenciahasta >= TO_DATE('+SqlValue(edPeriodoDesde.Periodo.Valor)+', ''YYYYMM'') '+
    '      AND hc_vigenciahasta <= LAST_DAY(TO_DATE('+SqlValue(edPeriodoHasta.Periodo.Valor)+', ''YYYYMM'')) '+sWhere+
    ' ORDER BY hc_contrato ';


  sdqConsulta.SQL.Text := sSelect;

  inherited;
  tbRefrescarEstablecimientoClick(nil);
end;



procedure TfrmGestionRelevamientosExpuestos.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('hc_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('hc_id').AsString, sdqConsulta.GetBookmark)
    else
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.FieldByName('hc_id').AsString));
    Column.Grid.Refresh;
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  SelectedListEstablecimiento.Free;
  inherited;
end;

procedure TfrmGestionRelevamientosExpuestos.GridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('hc_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.tbDesSeleccionarTodoClick(
  Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(SelectedList.Objects[i]);
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmGestionRelevamientosExpuestos.tbSeleccionarTodoClick(
  Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('hc_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('hc_id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmGestionRelevamientosExpuestos.tbLimpiarClick(
  Sender: TObject);
begin
  fraEstablecimientoFiltro.Clear;
  fraEmpresaFiltro.Clear;
  cmbReclamo.Clear;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  edFechaReclamoDesde.Clear;
  edFechaReclamoHasta.Clear;
  inherited;
end;

procedure TfrmGestionRelevamientosExpuestos.mnuVentanillaClick(
  Sender: TObject);
begin
  ProcesarReclamo(VENTANILLARECLAMO); //Ventanilla
end;

procedure TfrmGestionRelevamientosExpuestos.ProcesarReclamo(tipoGestion : Integer);
var
  i : Integer;
  contrato : Integer;
  falla : Integer;
begin
  falla := 0;
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  BeginTrans(True);
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if ExisteSql(
        ' SELECT DISTINCT 1 '+
        '   FROM hys.hge_gestionrelevestab '+
        '  WHERE ge_idhistoricocontrato = '+SqlValue(SelectedList.Strings[i])) then
      begin
        falla := falla +1;
      end
      else
      begin
        CargarGestionRelev(strtoint(SelectedList.Strings[i]),tipoGestion);
        if tipoGestion = MAILRECLAMO then //Mail
        begin
          contrato := ValorSql( 'SELECT hc_contrato FROM afi.ahc_historicocontrato '+
                                ' WHERE hc_id = '+SqlValue(SelectedList.Strings[i]));
          if ValorSql(
            ' SELECT co_direlectronica '+
            '   FROM afi.aco_contrato '+
            '  WHERE co_contrato = '+SqlValue(contrato)) <> '' then
          begin
            EjecutarStoreSTEx('art.intraweb.do_notificargestionrelev(:usuario,:contrato,:idgestionrelev,:esreenvio);',
              [Sesion.UserID,contrato,
              ValorSqlInteger(' SELECT gr_id '+
                '   FROM afi.ahc_historicocontrato, hys.hgr_gestionrelevamiento '+
                '  WHERE hc_id = gr_idhistoricocontrato '+
                '    AND hc_id = '+SqlValue(SelectedList.Strings[i])+
                '    AND gr_fechabaja IS NULL '),'N']);
          end
          else
            MsgBox('No tiene mail el contrato.', MB_ICONEXCLAMATION);
        end
        else if tipoGestion = FAXRECLAMO then //Fax
        begin
          with TrptReclamoNominaEmpresa.Create(Self) do
          try
            Load(SelectedList.Strings[i]);
          finally
            Free;
          end;
        end;
      end;
    end;
    if falla > 0 then
      MsgBox('Algunos registros no se modificaron por tener definida Presentación de relevamiento.',MB_ICONEXCLAMATION);
    CommitTrans(true);
    SelectedList.Clear;
    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al cambiar el Estado.');
    end;
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.CargarGestionRelev(idhistcontrato : Integer; tipoGestion : Integer;
          estado : String= '');
var
  idgestionrelev : Integer;
begin
  idgestionrelev := ValorSqlInteger(' SELECT gr_id '+
    '   FROM afi.ahc_historicocontrato, hys.hgr_gestionrelevamiento '+
    '  WHERE hc_id = gr_idhistoricocontrato '+
    '    AND hc_id = '+SqlValue(idhistcontrato)+
    '    AND gr_fechabaja IS NULL ');
  if idgestionrelev = 0 then
  begin
    idgestionrelev := GetSecNextVal('hys.seq_hgr_relev_id');

    EjecutarSqlST(
      ' INSERT INTO hys.hgr_gestionrelevamiento( '+
      '        gr_id, gr_idhistoricocontrato, gr_tiporeclamo,'+
      '        gr_fechareclamo, gr_usualta, gr_fechaalta, gr_estadoreclamo ) '+
      ' VALUES ('+SqlValue(idgestionrelev)+','+SqlValue(idhistcontrato)+','+
                SqlInt(tipoGestion,True)+
                IIF(tipogestion = 0,'',',SYSDATE')+
                ','+SqlValue(Sesion.UserID)+',SYSDATE,'+SqlValue(estado)+')');
  end
  else
  begin
    EjecutarSqlST(
      ' UPDATE hys.hgr_gestionrelevamiento '+
      '    SET gr_tiporeclamo = '+SqlInt(tipoGestion,True) +','+
      '        gr_estadoreclamo = '+SqlValue(estado)+','+
      IIF(tipogestion = 0,'',' gr_fechareclamo = sysdate,')+
      '        gr_fechamodif = sysdate, '+
      '        gr_usumodif = '+ SqlValue(Sesion.UserID)+
      '  WHERE gr_id = '+SqlValue(idgestionrelev));
  end;
end;


procedure TfrmGestionRelevamientosExpuestos.mnuMailClick(Sender: TObject);
begin
  ProcesarReclamo(MAILRECLAMO); //Mail
end;

procedure TfrmGestionRelevamientosExpuestos.mnuFaxClick(Sender: TObject);
begin
  ProcesarReclamo(FAXRECLAMO); //Fax
end;

procedure TfrmGestionRelevamientosExpuestos.mnuCartaClick(Sender: TObject);
begin
    ProcesarReclamo(CARTARECLAMO); //Carta
end;

procedure TfrmGestionRelevamientosExpuestos.tbOcultarGridEstablecimientoClick(
  Sender: TObject);
begin
  if tbOcultarGridEstablecimiento.Down then
  begin
    Splitter.Visible := false;
    dbgEstablecimiento.Visible := false;
    tbOcultarGridEstablecimiento.ImageIndex := 11;
    sdqDatosEstablecimiento.Close;
  end
  else begin
    Splitter.Visible := true;
    dbgEstablecimiento.Visible := true;
    tbEstablecimientos.Top := Grid.Top + 1;
    dbgEstablecimiento.Top := tbEstablecimientos.Top + 1;
    Splitter.Top := dbgEstablecimiento.Top - 1;
    tbOcultarGridEstablecimiento.ImageIndex := 10;
    if sdqConsulta.Active then
      sdqConsultaAfterScroll(Grid.DataSource.DataSet);
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.sdqConsultaAfterScroll(
  DataSet: TDataSet);
begin
  if (sdqConsulta.FieldbyName('hc_contrato').AsString <> FContratoAnterior) and (dbgEstablecimiento.Visible) and not(sdqconsulta.IsEmpty) then
  begin
    sdqDatosEstablecimiento.close;
    sdqDatosEstablecimiento.ParamByName('contrato').Value := DataSet.fieldbyname('hc_contrato').AsInteger;
    sdqDatosEstablecimiento.ParamByName('estableci').AsString := fraEstablecimientoFiltro.edCodigo.Text;
    sdqDatosEstablecimiento.ParamByName('fecha').AsDate := DataSet.fieldbyname('vigencia').AsDateTime;
    sdqDatosEstablecimiento.Open;
  end;
  FContratoAnterior := sdqConsulta.FieldbyName('hc_contrato').AsString;
  SelectedListEstablecimiento.Clear;
end;


procedure TfrmGestionRelevamientosExpuestos.tbRefrescarEstablecimientoClick(
  Sender: TObject);
begin
  inherited;
  if (dbgEstablecimiento.Visible) and not(sdqconsulta.IsEmpty) then
  begin
    sdqDatosEstablecimiento.close;
    sdqDatosEstablecimiento.ParamByName('contrato').Value := sdqconsulta.fieldbyname('hc_contrato').AsInteger;
    sdqDatosEstablecimiento.ParamByName('estableci').AsString := fraEstablecimientoFiltro.edCodigo.Text;
    sdqDatosEstablecimiento.ParamByName('fecha').AsDate := sdqconsulta.fieldbyname('vigencia').AsDateTime;
    sdqDatosEstablecimiento.Open;
  end
end;

procedure TfrmGestionRelevamientosExpuestos.tbPresentacionClick(
  Sender: TObject);
begin
  Verificar(sdqDatosEstablecimiento.FieldByName('es_id').IsNull,dbgEstablecimiento,'Debe Seleccionar un registro.');
  Verificar(SelectedListEstablecimiento.Count = 0, dbgEstablecimiento, 'No hay nada seleccionado.');
  ClearDefinirPresentacion;
  cbPresentoRelevClick(nil);
  if (not sdqDatosEstablecimiento.FieldByName('ge_id').IsNull) and (SelectedListEstablecimiento.Count = 1) then
    LoadDefinirPresentacion;
  rgModoNotif.ItemIndex := ValorSqlInteger(
    ' SELECT gr_tiporeclamo '+
    '   FROM hys.hgr_gestionrelevamiento '+
    '  WHERE gr_idhistoricocontrato = '+
    SqlValue(sdqConsulta.FieldByName('hc_id').AsString),0) -1 ;
  fpDefinirPresentacion.ShowModal;
end;

procedure TfrmGestionRelevamientosExpuestos.LoadDefinirPresentacion;
var
  FModoNotificacion : Integer;
begin
  cbPresentoRelev.Checked := sdqDatosEstablecimiento.FieldByName('GE_PRESENTORELEV').AsString = 'S';
  cbPresentoRelevClick(nil);

  fraEstadoPresentacion.Codigo := sdqDatosEstablecimiento.FieldByName('GE_IDESTADO').AsString;
  fraEstadoPresentacionOnChange(nil);
  fraCausa.Codigo := sdqDatosEstablecimiento.FieldByName('GE_IDCAUSA').AsString;
  fraCausaOnChange(nil);
  if ValorSql(
      ' SELECT co_direlectronica '+
      '   FROM afi.aco_contrato '+
      '  WHERE co_contrato = '+
      SqlValue(sdqConsulta.FieldByName('hc_contrato').AsInteger)) = '' then
    rgModoNotif.Items.Strings[2] := 'Mail - Sin Mail'
  else
    rgModoNotif.Items.Strings[2] := 'Mail - Con Mail';
  if sdqConsulta.FieldByName('gr_tiporeclamo').IsNull then
    FModoNotificacion := sdqConsulta.FieldByName('gr_tiporeclamo').AsInteger
  else
    FModoNotificacion := 0;

  rgModoNotif.ItemIndex := FModoNotificacion -1;

  cbNotifPreventor.Checked := (sdqDatosEstablecimiento.FieldByName('GE_NOTIFICARALPREV').AsString = 'S');
  cbNotifPreventorClick(nil);
  if not sdqDatosEstablecimiento.FieldByName('ge_idprevnotificacion').IsNull then
    fraPreventorNotif.Value := sdqDatosEstablecimiento.FieldByName('ge_idprevnotificacion').AsInteger;
end;

procedure TfrmGestionRelevamientosExpuestos.ClearDefinirPresentacion;
begin
  cbPresentoRelev.Checked := False;
  fraEstadoPresentacion.Clear;
  fraEstadoPresentacion.Enabled := True;
  fraCausa.Clear;
  fraCausa.Enabled := True;
  rgModoNotif.Enabled := True;
  cbNotifPreventor.Checked := False;
  cbNotifPreventorClick(nil);
  fraPreventorNotif.Clear;
  rgModoNotif.ItemIndex := -1;

end;

{
function TfrmGestionRelevamientosExpuestos.tipoModoNotif : String;
var
  texto : String;
begin
  if FModoNotificacion = MAILRECLAMO THEN
    texto := 'Email'
  else if FModoNotificacion = FAXRECLAMO THEN
    texto := 'Fax'
  else if FModoNotificacion = CARTARECLAMO THEN
    texto := 'Carta'
  else if FModoNotificacion = VENTANILLARECLAMO THEN
    texto := 'Ventanilla'
  else
    texto := '';

  Result:= 'Modo Notificación ' +texto;

end;
}
procedure TfrmGestionRelevamientosExpuestos.ValidarPresentacion;
begin
  if fraEstadoPresentacion.Enabled then
    Verificar(not fraEstadoPresentacion.IsSelected, fraEstadoPresentacion,'Debe Seleccionar un estado.');
  if fraCausa.Enabled then
    Verificar(not fraCausa.IsSelected, fraCausa,'Debe Seleccionar una causa.');
  if rgModoNotif.Enabled then
    Verificar(rgModoNotif.ItemIndex = -1, rgModoNotif,'Debe Seleccionar un Modo de Notificación');
  if rgModoNotif.Enabled and (rgModoNotif.ItemIndex = 2) then
    Verificar(ValorSql(
      ' SELECT co_direlectronica '+
      '   FROM afi.aco_contrato '+
      '  WHERE co_contrato = '+SqlValue(sdqConsulta.FieldByName('hc_contrato').AsInteger))= '',rgModoNotif,
      'No tiene mail la empresa');
end;

procedure TfrmGestionRelevamientosExpuestos.fraEstadoPresentacionOnChange(
  Sender: TObject);
begin
  fraCausa.ExtraCondition := 'AND ca_idestado = '+SqlValue(fraEstadoPresentacion.Codigo);
  fraCausa.Clear;
end;

procedure TfrmGestionRelevamientosExpuestos.fraCausaOnChange(
  Sender: TObject);
begin
  rgModoNotif.Enabled := ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hca_causa '+
    '  WHERE ca_notifempresa = ''S'' '+
    '    AND ca_id = '+SqlValue(fraCausa.Codigo));
  cbNotifPreventor.Checked := ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hca_causa '+
    '  WHERE ca_notifprev = ''S'' '+
    '    AND ca_id = '+SqlValue(fraCausa.Codigo));
  if not rgModoNotif.Enabled then
  begin
    rgModoNotif.ItemIndex := -1;
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.btnAceptarPresentacionClick(
  Sender: TObject);
begin
  ValidarPresentacion;
  GuardarPresentacion;
  fpDefinirPresentacion.ModalResult := mrOk;
  sdqDatosEstablecimiento.Refresh;
  inherited;
end;

procedure TfrmGestionRelevamientosExpuestos.GuardarPresentacion;
var
  iIdCodigo, i : Integer;
begin
  BeginTrans(True);
  try
    for i:=0 to SelectedListEstablecimiento.Count-1 do
    begin
      dbgEstablecimiento.DataSource.DataSet.GotoBookmark(SelectedListEstablecimiento.Objects[i]);
      Sql.Clear;
      Sql.TableName := 'HYS.HGE_GESTIONRELEVESTAB';
      Sql.Fields.Add('GE_IDESTADO', fraEstadoPresentacion.Codigo);
      Sql.Fields.Add('GE_IDCAUSA', fraCausa.Codigo);
      Sql.Fields.Add('GE_FECHANOTIFPREVENTOR', exNull);
      if cbNotifPreventor.Checked then
        Sql.Fields.Add('GE_NOTIFICARALPREV', 'S')
      else
        Sql.Fields.Add('GE_NOTIFICARALPREV', 'N');
      Sql.Fields.AddInteger('GE_IDPREVNOTIFICACION',fraPreventorNotif.Value,True);
      if cbPresentoRelev.Checked then
        Sql.Fields.Add('GE_PRESENTORELEV', 'S')
      else
        Sql.Fields.Add('GE_PRESENTORELEV', 'N');
      Sql.Fields.Add('GE_IDESTAB', sdqDatosEstablecimiento.FieldByName('ES_ID').AsInteger);
      Sql.Fields.Add('GE_IDHISTORICOCONTRATO', sdqConsulta.FieldByName('HC_ID').AsInteger);

      If sdqDatosEstablecimiento.FieldByName('GE_ID').IsNull then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HGE_ID');
        Sql.Fields.Add('GE_USUALTA', Sesion.UserID );
        Sql.Fields.Add('GE_FECHAALTA', exDateTime );
      end
      else
      begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqDatosEstablecimiento.FieldByName('GE_ID').AsInteger;
        Sql.Fields.Add('GE_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('GE_FECHAMODIF', exDateTime );
        Sql.Fields.Add('GE_USUBAJA', exNull );
        Sql.Fields.Add('GE_FECHABAJA', exNull );
      end;
      Sql.PrimaryKey.Add('GE_ID', iIdCodigo);
      EjecutarSQLST(Sql.Sql);
    end;
    if rgModoNotif.Enabled or cbNotifPreventor.Checked then
    begin
      Sql.Clear;
      Sql.TableName := 'HYS.HGR_GESTIONRELEVAMIENTO';
      Sql.Fields.AddInteger('GR_TIPORECLAMO', rgModoNotif.ItemIndex+1,True);
      Sql.Fields.Add('GR_ESTADORECLAMO', 'P');
      If sdqConsulta.FieldByName('GR_ID').IsNull then
      begin
        Sql.Fields.Add('GR_IDHISTORICOCONTRATO', sdqConsulta.FieldByName('HC_ID').AsInteger);
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HGR_RELEV_ID');
        Sql.Fields.Add('GR_USUALTA', Sesion.UserID );
        Sql.Fields.Add('GR_FECHAALTA', exDateTime );
      end
      else
      begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqConsulta.FieldByName('GR_ID').AsInteger;
        Sql.Fields.Add('GR_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('GR_FECHAMODIF', exDateTime );
        Sql.Fields.Add('GR_USUBAJA', exNull );
        Sql.Fields.Add('GR_FECHABAJA', exNull );
      end;
      Sql.PrimaryKey.Add('GR_ID', iIdCodigo);
      EjecutarSQLST(Sql.Sql);
    end;
    CommitTrans(True);
  except
    on E: Exception do begin
       Rollback(true);
       ErrorMsg(E, 'Error al guardar.');
    end;
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Sql.Free;
  inherited;
end;

procedure TfrmGestionRelevamientosExpuestos.tbReclamoPresentacionClick(
  Sender: TObject);
var
  i : Integer;
  contrato : Integer;
  tipoGestion : Integer;
  falla : Integer;
begin
  falla := 0;
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  BeginTrans(True);
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      DBGrid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if not ExisteSql(
        ' SELECT DISTINCT 1 '+
        '   FROM hys.hge_gestionrelevestab '+
        '  WHERE ge_idhistoricocontrato = '+SqlValue(SelectedList.Strings[i])) then
      begin
        falla := falla +1;
      end
      else
      begin
        if ValorSql(
          ' SELECT gr_estadoreclamo '+
          '   FROM hys.hgr_gestionrelevamiento '+
          '  WHERE gr_idhistoricocontrato ='+SqlValue(SelectedList.Strings[i]) ) = 'P' then
        begin
          tipoGestion := sdqConsulta.FieldByName('GR_TIPORECLAMO').AsInteger;
          if tipoGestion = MAILRECLAMO then //Mail
          begin
            contrato := ValorSql( 'SELECT hc_contrato FROM afi.ahc_historicocontrato '+
                                  ' WHERE hc_id = '+SqlValue(SelectedList.Strings[i]));
            if ValorSql(
              ' SELECT co_direlectronica '+
              '   FROM afi.aco_contrato '+
              '  WHERE co_contrato = '+SqlValue(contrato)) <> '' then
            begin

            end
            else
              MsgBox('No tiene mail el contrato.', MB_ICONEXCLAMATION);
          end
          else if tipoGestion = FAXRECLAMO then //Fax
          begin

          end;
          EjecutarSqlST(
            ' UPDATE hys.hgr_gestionrelevamiento '+
            '    SET gr_estadoreclamo = ''R'', '+
            '        gr_fechareclamo = sysdate'+
            '  WHERE gr_idhistoricocontrato = '+SqlValue(SelectedList.Strings[i])+
            '    AND gr_fechabaja is null');
        end;
      end;
    end;
    if falla > 0 then
      MsgBox('Algunos registros no se modificaron por no tener definida Presentación de relevamiento.',MB_ICONEXCLAMATION);
    CommitTrans(true);
    SelectedList.Clear;
    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error Reclamo Presentacion.');
    end;
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.dbgEstablecimientoDblClick(
  Sender: TObject);
begin
  tbPresentacionClick(nil);
end;

procedure TfrmGestionRelevamientosExpuestos.cbPresentoRelevClick(
  Sender: TObject);
begin
  if not cbPresentoRelev.Checked then
  begin
    fraEstadoPresentacion.Clear;
    fraCausa.Clear;
    rgModoNotif.ItemIndex := -1;
    fraEstadoPresentacion.Enabled := False;
    fraCausa.Enabled := False;
    rgModoNotif.Enabled := False;
  end
  else
  begin
    fraEstadoPresentacion.Enabled := True;
    fraCausa.Enabled := True;
    rgModoNotif.Enabled := True;
  end;

end;

procedure TfrmGestionRelevamientosExpuestos.cbNotifPreventorClick(
  Sender: TObject);
begin
  inherited;
  if cbNotifPreventor.Checked then
  begin
    vclExtra.LockControls(fraPreventorNotif,False);
    fraPreventorNotif.Codigo := ValorSql(
      ' SELECT art.hys.get_preventor_estab('+SqlValue(sdqConsulta.FieldByName('em_cuit').AsString)+','+
                             SqlValue(sdqDatosEstablecimiento.FieldByName('es_nroestableci').AsString)+')'+
      '   FROM dual');
  end
  else
  begin
    fraPreventorNotif.Clear;
    vclExtra.LockControls(fraPreventorNotif,True);
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.mnuNingunoClick(
  Sender: TObject);
begin
  ProcesarReclamo(NINGUNRECLAMO);
end;

procedure TfrmGestionRelevamientosExpuestos.dbgEstablecimientoCellClick(
  Column: TColumn);
begin
  inherited;
  if sdqDatosEstablecimiento.Active and not sdqDatosEstablecimiento.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedListEstablecimiento.IndexOf(sdqDatosEstablecimiento.FieldByName('es_id').AsString) = -1 then
      SelectedListEstablecimiento.AddObject(sdqDatosEstablecimiento.FieldByName('es_id').AsString, sdqDatosEstablecimiento.GetBookmark)
    else
      SelectedListEstablecimiento.Delete(SelectedListEstablecimiento.IndexOf(sdqDatosEstablecimiento.FieldByName('es_id').AsString));
    Column.Grid.Refresh;
  end;
end;


procedure TfrmGestionRelevamientosExpuestos.dbgEstablecimientoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    dbgEstablecimiento.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedListEstablecimiento.IndexOf(sdqDatosEstablecimiento.FieldByName('es_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dbgEstablecimiento.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmGestionRelevamientosExpuestos.dbgEstablecimientoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    dbgEstablecimientoCellClick(dbgEstablecimiento.ColumnByField['SELECTED']);

end;

procedure TfrmGestionRelevamientosExpuestos.dbgEstablecimientoGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;
  if not sdqDatosEstablecimiento.FieldByName('EP_DESCRIPCION').IsNull then
    AFont.Color := clGreen;
  if not sdqDatosEstablecimiento.FieldByName('existerelev').IsNull then
    Background := clSkyBlue;
end;

procedure TfrmGestionRelevamientosExpuestos.tbExportarClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
    Exit;

  ExportDialog.DataSet := sdqConsulta;
  ExportDialog.Fields.Assign(Grid.Columns);
  if not (ExportDialog.Fields.ItemByName['SELECTED'] = nil) then
    ExportDialog.Fields.Delete(ExportDialog.Fields.ItemByName['SELECTED'].Index);

  inherited;
end;

end.
