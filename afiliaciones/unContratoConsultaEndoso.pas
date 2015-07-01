unit unContratoConsultaEndoso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, ToolEdit, ArtComboBox, DateComboBox, Mask, StdCtrls, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtDbFrame, unFraEmpresa, Menus, unART,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, FormPanel, unArtDBAwareFrame, PatternEdit, ComboEditor,
  CheckCombo;

type
  TfrmContratoConsultaEndoso = class(TfrmCustomConsulta)
    pmImpresion: TPopupMenu;
    mnuImpresora: TMenuItem;
    mnuMail: TMenuItem;
    mnuFax: TMenuItem;
    GroupBox1: TGroupBox;
    edEN_VIGENCIAENDOSO_DESDE: TDateComboBox;
    Label1: TLabel;
    edEN_VIGENCIAENDOSO_HASTA: TDateComboBox;
    GroupBox2: TGroupBox;
    fraMotivoEndoso: TfraStaticCTB_TABLAS;
    mnuGrilla: TMenuItem;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    edEN_FECHAALTA_DESDE: TDateComboBox;
    edEN_FECHAALTA_HASTA: TDateComboBox;
    GroupBox4: TGroupBox;
    lbCUIT: TLabel;
    fraEmpresa: TfraEmpresa;
    tbTarifa: TToolButton;
    GroupBox5: TGroupBox;
    cmbHC_ESTADO: TCheckCombo;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    chkTarifa: TCheckBox;
    cmbHC_IDACTIVIDAD: TCheckCombo;
    tbVerTarifas: TToolButton;
    tbImprimirUltimaRenovacion: TToolButton;
    mnuRenovacionAutomatica: TPopupMenu;
    mnuImprimirRenovacionAutomatica: TMenuItem;
    mnuMailRenovacionAutomatica: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuImpresoraClick(Sender: TObject);
    procedure mnuMailClick(Sender: TObject);
    procedure mnuFaxClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure tbTarifaClick(Sender: TObject);
    procedure tbVerTarifasClick(Sender: TObject);
    procedure mnuImprimirRenovacionAutomaticaClick(Sender: TObject);
    procedure mnuMailRenovacionAutomaticaClick(Sender: TObject);
    procedure tbImprimirUltimaRenovacionClick(Sender: TObject);
  private
    procedure CargaActividad;
    procedure CargarEstado;
  public
    procedure CargarDatos(IdContrato: TTableID);
  end;

var
  frmContratoConsultaEndoso: TfrmContratoConsultaEndoso;

implementation

uses
  CUIT, CustomDlgs, unDmPrincipal, AnsiSQL, unModificaContrato, General, Printers, ShellApi, SpoolFuncs, VCLExtra,
  unImprimeContrato, unCuadroTarifarioContrato, unComunes, unPrincipal, unAfiliaciones;

{$R *.DFM}

procedure TfrmContratoConsultaEndoso.FormCreate(Sender: TObject);
begin
  inherited;

  fraMotivoEndoso.Clave := 'MOTEN';
  fraEmpresa.ShowBajas := TRUE;
  frmPrincipal.mnuConsultaEndosos.Enabled := False;

  tbVerTarifas.Left := 77;
  tbTarifa.Left     := 77;

  CargaActividad;
  CargarEstado;

  tbSalir.Left :=  31;
  ToolButton11.Left := 31;
  tbMaxRegistros.Left := 31;
  tbMostrarFiltros.Left := 31;
  ToolButton8.Left := 31;
  tbEnviarMail.Left := 31;
  tbExportar.Left := 31;
  tbImprimirUltimaRenovacion.Left := 31;
  tbImprimir.Left := 31;
  ToolButton6.Left  := 31;
  tbMostrarOcultarColumnas.Left := 31;
  tbOrdenar.Left := 31;
  tbLimpiar.Left := 31;
  ToolButton3.Left := 31;
  tbPropiedades.Left := 31;
  ToolButton4.Left := 31;
  tbEliminar.Left := 31;
  tbModificar.Left := 31;
  tbNuevo.Left := 20;
end;

procedure TfrmContratoConsultaEndoso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuConsultaEndosos.Enabled := True;
  Action := caFree;
  frmContratoConsultaEndoso := nil;

  inherited;
end;

procedure TfrmContratoConsultaEndoso.CargarDatos(IdContrato: TTableID);
begin
  fraEmpresa.Contrato := IdContrato;
  LockControl(fraEmpresa, true);
  tbRefrescarClick(nil);
end;

procedure TfrmContratoConsultaEndoso.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresa.Clear;
  edEN_VIGENCIAENDOSO_DESDE.Clear;
  edEN_VIGENCIAENDOSO_HASTA.Clear;
  fraMotivoEndoso.Clear;
  LockControl(fraEmpresa, False);
end;

procedure TfrmContratoConsultaEndoso.tbModificarClick(Sender: TObject);
begin
  inherited;

  if not sdqConsulta.IsEmpty then
  begin
    if not Assigned(frmModificacionContrato) then
      frmModificacionContrato := TfrmModificacionContrato.Create(frmPrincipal);
    frmModificacionContrato.DoCargarDatos(sdqConsulta.FieldByName('en_id').AsInteger, ART_EMPTY_ID, fsConsultar);
    frmModificacionContrato.Show;
  end;
end;

procedure TfrmContratoConsultaEndoso.tbRefrescarClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT aen.en_id, ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, aen.en_endoso, aen.en_movimiento,' +
          ' aen.en_vigenciaendoso, ahm.hm_cuit, ahm.hm_nombre, aen.en_usualta, aen.en_fechaalta, ahc.hc_estado,' +
          ' ahc.hc_fechaafiliacion, ahc.hc_fechabaja, moten.tb_descripcion motivo_endoso, est.tb_descripcion estado_endoso,' +
          ' moten.tb_especial1 tipoendoso, afiliacion.get_descrespuestasrt(en_codobservacionsrt, ''O'') observacionsrt,' +
          ' afiliacion.get_descrespuestasrt(en_codrechazosrt, ''E'') rechazosrt, cac.ac_codigo || ''-'' || cac.ac_descripcion actividad,' +
          ' aht.ht_alicuotapesos, aht.ht_porcmasa' +
     ' FROM afi.aen_endoso aen, ahc_historicocontrato ahc, aht_historicotarifario aht, ahm_historicoempresa ahm,' +
          ' ahd_historicodomicilio ahd, ctb_tablas moten, ctb_tablas est, cac_actividad cac' +
    ' WHERE aen.en_idhistoricocontrato = ahc.hc_id' +
      ' AND aen.en_idhistoricotarifa = aht.ht_id' +
      ' AND aen.en_idhistoricoempresa = ahm.hm_id' +
      ' AND aen.en_idhistoricodomicilio = ahd.hd_id' +
      ' AND aen.en_motivo = moten.tb_codigo' +
      ' AND moten.tb_clave = ''MOTEN''' +
      ' AND est.tb_clave = ''AFEST''' +
      ' AND est.tb_codigo = ahc.hc_estado' +
      ' AND cac.ac_id = hc_idactividad' +
  IIF(not fraEmpresa.edContrato.IsEmpty, ' AND ahc.hc_contrato = ' + SqlValue(fraEmpresa.edContrato.Value), '') +
  //               IIF(fraEmpresa.mskCUIT.Text <> '', ' AND ahm.hm_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text), '') +
  //               IIF(fraEmpresa.cmbRSocial.Text <> '', ' AND ahm.hm_nombre = ' + SqlValue(fraEmpresa.cmbRSocial.Text), '') +
  IIF(not edEN_VIGENCIAENDOSO_DESDE.IsEmpty, ' AND aen.en_vigenciaendoso >= ' + SqlDate(edEN_VIGENCIAENDOSO_DESDE.Date), '') +
  IIF(not edEN_VIGENCIAENDOSO_HASTA.IsEmpty, ' AND aen.en_vigenciaendoso <= ' + SqlDate(edEN_VIGENCIAENDOSO_HASTA.Date), '') +
  IIF(not edEN_FECHAALTA_DESDE.IsEmpty, ' AND aen.en_fechaalta >= ' + SqlDate(edEN_FECHAALTA_DESDE.Date), '') +
  IIF(not edEN_FECHAALTA_HASTA.IsEmpty, ' AND aen.en_fechaalta <= ' + SqlDate(edEN_FECHAALTA_HASTA.Date), '') +
  IIF(not fraMotivoEndoso.IsEmpty, ' AND moten.tb_codigo = ' + SqlValue(fraMotivoEndoso.Value), '') +
  IIF(chkTarifa.Checked, ' AND ((en_endoso = 0 AND en_movimiento = 0) OR (moten.tb_especial1 = ''1''))', '');

  if cmbHC_ESTADO.Text <> '' then
  begin
    sWhere := ' AND ahc.hc_estado IN (';
    for iLoop := 0 to cmbHC_ESTADO.Items.Count - 1 do
      if cmbHC_ESTADO.Checked[iLoop] then
        sWhere := sWhere + (cmbHC_ESTADO.Items.Objects[iLoop] as TCadena).Cadena + ',';
    sWhere := Copy(sWhere, 1, Length(sWhere) - 1) + ')';
  end;
  sSql := sSql + sWhere;

  if cmbHC_IDACTIVIDAD.Text <> '' then
  begin
    sWhere := ' AND cac.ac_relacion IN (';
    for iLoop := 0 to  cmbHC_IDACTIVIDAD.Items.count - 1 do
      if cmbHC_IDACTIVIDAD.Checked[iLoop] then
        sWhere := sWhere + (cmbHC_IDACTIVIDAD.Items.Objects[iLoop] as TCadena).Cadena + ',';
    sWhere := Copy(sWhere, 0, Length(sWhere) - 1) + ')';
  end;
  sSql := sSql + sWhere;

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;

  tbVerTarifasClick(nil);
  
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
    tbModificar.Enabled := False;
  end
  else
    tbModificar.Enabled := True;
end;

procedure TfrmContratoConsultaEndoso.mnuImpresoraClick(Sender: TObject);
var
  iloop: Integer;
begin
  if Grid.SelectedRows.Count < 1 then
    raise Exception.Create('Debe elegir un registro.');

  frmImprimeContrato.Free;
  frmImprimeContrato := TfrmImprimeContrato.Create(nil);

  frmImprimeContrato.Clear;
  for iloop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(pointer(Grid.SelectedRows.Items[iloop]));

    frmImprimeContrato.Endosos.Add(sdqConsulta.FieldByName('en_id').AsString);
    frmImprimeContrato.TipoEndosos.Add(sdqConsulta.FieldByName('tipoendoso').AsString);
    frmImprimeContrato.Contratos.Add(sdqConsulta.FieldByName('hc_contrato').AsString);
  end;
  Grid.UnSelectAll;

  frmImprimeContrato.Visible := False;
  frmImprimeContrato.ShowModal;
end;

procedure TfrmContratoConsultaEndoso.mnuMailClick(Sender: TObject);
begin
  //
end;

procedure TfrmContratoConsultaEndoso.mnuFaxClick(Sender: TObject);
begin
  //  inherited;
end;

procedure TfrmContratoConsultaEndoso.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown
end;

procedure TfrmContratoConsultaEndoso.mnuGrillaClick(Sender: TObject);
begin
  inherited tbImprimirClick(Sender);
end;

procedure TfrmContratoConsultaEndoso.tbTarifaClick(Sender: TObject);
var
  aContrato: TTableId;
  frm: TfrmContratoTarifa;
  oldCursor: TCursor;
begin
  OldCursor     := Screen.Cursor;
  screen.cursor := crHourGlass;
  frm := TfrmContratoTarifa.Create(Self);
  try
    aContrato := sdqConsulta.FieldByName('hc_contrato').AsInteger;
    frm.DoCargarDatos(aContrato);
    frm.tbNuevo.Enabled := False;
    frm.ShowModal;

    // Vuelve a cargar el contrato
    if Assigned(frmModificacionContrato) and (frmModificacionContrato.Contrato = aContrato) then
      frmModificacionContrato.DoCargarDatos(ART_EMPTY_ID, aContrato, fsConsultar);
  finally
    frm.Free;
    screen.Cursor := OldCursor;
  end;
end;

procedure TfrmContratoConsultaEndoso.CargaActividad;
var
  aId: TCadena;
  sSql: String;
begin
  sSql :=
    'SELECT DISTINCT a.ac_relacion relacion, b.ac_descripcion descripcion' +
              ' FROM cac_actividad a, cac_actividad b' +
             ' WHERE LENGTH(a.ac_relacion) = 6' +
               ' AND a.ac_relacion = b.ac_codigo' +
          ' ORDER BY relacion, descripcion';
  with GetQuery(sSql) do
  try
    cmbHC_IDACTIVIDAD.Clear;

    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('relacion').AsString;
      cmbHC_IDACTIVIDAD.Items.AddObject(FieldByName('relacion').AsString + ' - ' + FieldByName('descripcion').AsString, aId);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoConsultaEndoso.CargarEstado;
var
  aId: TCadena;
  sSql: String;
begin
  sSql :=
    'SELECT tb_codigo, tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''AFEST''' +
      ' AND tb_codigo <> 0';
  with GetQuery(sSql) do
  try
    cmbHC_ESTADO.Items.Clear;

    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('tb_codigo').AsString;
      cmbHC_ESTADO.Items.AddObject(aId.Cadena + ' - ' + FieldByName('tb_descripcion').AsString, aId);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoConsultaEndoso.tbVerTarifasClick(Sender: TObject);
begin
  Grid.ColumnByField['ht_porcmasa'].Visible      := tbVerTarifas.Down;
  Grid.ColumnByField['ht_alicuotapesos'].Visible := tbVerTarifas.Down;
end;

procedure TfrmContratoConsultaEndoso.mnuImprimirRenovacionAutomaticaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;
  ImprimirUltimaRenovacionAutomatica(sdqConsulta.FieldByName('hc_contrato').AsInteger);
end;

procedure TfrmContratoConsultaEndoso.mnuMailRenovacionAutomaticaClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No hay datos seleccionados.');
    Abort;
  end;
  ImprimirUltimaRenovacionAutomatica(sdqConsulta.FieldByName('hc_contrato').AsInteger, True);
end;

procedure TfrmContratoConsultaEndoso.tbImprimirUltimaRenovacionClick(Sender: TObject);
begin
  tbImprimirUltimaRenovacion.CheckMenuDropdown
end;

end.
