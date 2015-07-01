unit unAdmVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, PeriodoPicker, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, CustomDlgs, AnsiSql,
  unDmPrincipal, General, unArtDbFrame, unFraEmpresa, Mask, PatternEdit,
  ComboEditor, CheckCombo, VCLExtra, unMoldeEnvioMail, FormPanel,
  unSesion;

type
  TfrmAdmVencidos = class(TfrmCustomConsulta)
    Label1: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label2: TLabel;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    chkSinPreventor: TCheckBox;
    cbNoTercerizado: TCheckBox;
    cbTercerizado: TCheckBox;
    Label4: TLabel;
    edMes: TPeriodoPicker;
    Label3: TLabel;
    edMesHasta: TPeriodoPicker;
    tbSumatoria: TToolButton;
    fraEmpresaFiltro: TfraEmpresa;
    Label19: TLabel;
    Label14: TLabel;
    edEstablecimiento: TPatternEdit;
    cmbTipoMedicion: TCheckCombo;
    lblTipoMedicion: TLabel;
    fpObservaciones: TFormPanel;
    BevelAbm: TBevel;
    lbObservacion: TLabel;
    lbObservacionLibre: TLabel;
    btnAceptarObservacion: TButton;
    btnCancelarObservacion: TButton;
    fraObservacion: TfraCodigoDescripcion;
    edObservacionLibre: TMemo;
    procedure edMesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAceptarObservacionClick(Sender: TObject);
  private
    procedure OnEmpresaChangeFiltro(Sender: TObject);
    function ArmarFiltroEstab(Establecimientos: string): string;
    procedure ActualizarObservacion(IdObservacion: integer; Observacion: String);
  public
    procedure RefreshData; override;
  end;

var
  frmAdmVencidos: TfrmAdmVencidos;

implementation

{$R *.dfm}

procedure TfrmAdmVencidos.edMesChange(Sender: TObject);
begin
  edMes.Tag := 1;
end;

procedure TfrmAdmVencidos.FormCreate(Sender: TObject);
begin
  inherited;
  edMes.Tag := 1;
  tbSalir.Left := tbSalir.Left + 100;
  fraEmpresaFiltro.OnChange := OnEmpresaChangeFiltro;
  fraEmpresaFiltro.ShowBajas := true;
  fraEmpresaFiltro.UltContrato := true;
  VCLExtra.LockControl(edEstablecimiento, true);
  tbLimpiarClick(Sender);

  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraFields := ExtraFields + ', IT_EMAIL ';
 end;

  with fraCoordinadorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraCondition := ' AND IT_IDROLPREVENTOR >= 5 ';
 end;

  with fraObservacion do
  begin
    TableName := 'HYS.HOH_OBSERVACIONHYS';
    FieldDesc := 'OH_OBSERVACION';
    FieldID := 'OH_ID';
    FieldCodigo := 'OH_ID';
    FieldBaja := 'OH_FECHABAJA';
    ExtraCondition := ' AND OH_MODULO = ''AV'' ';
    ShowBajas := true;
 end;

end;

procedure TfrmAdmVencidos.RefreshData;
var
  sWhere: String;
  sSql: String;
  sIn: String;
  i: integer;
begin
  Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
  Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');

  sWhere := '';

  if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
  begin
    if (cbTercerizado.Checked) then
      sWhere := sWhere + ' AND it_tercerizado = 1' ;

    if (cbNoTercerizado.Checked) then
      sWhere := sWhere + ' AND it_tercerizado = 0';
  end;

  if fraPreventorFiltro.IsSelected then
    sWhere := sWhere + ' AND it_id = '+SqlValue(fraPreventorFiltro.Value);

  if fraCoordinadorFiltro.IsSelected then
    sWhere := sWhere + ' AND it_idsupervisor = '+SqlValue(fraCoordinadorFiltro.Value);

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' and ip_cuit = ' + SqlValue(fraEmpresaFiltro.CUIT);

  if edEstablecimiento.Text <> '' then
    sWhere := sWhere + ' and ip_estableci in (' + ArmarFiltroEstab(edEstablecimiento.Text)  + ')';


  if cmbTipoMedicion.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbTipoMedicion.Items.Count-1 do
      if cmbTipoMedicion.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(cmbTipoMedicion.Items[i]);
      end;
    sWhere := sWhere + ' and ip_medicion in (' + sIn + ') ';
  end;

  if edMes.Tag = 1 then
  begin
    //EjecutarStore('art.hys.do_procesargradocumplimiento(TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') , LAST_DAY(TO_DATE('+ SqlValue(edMesHasta.Text)+', ''YYYYMM'')));');
    EjecutarStore('art.hys.do_procesargradoincumplimiento(TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') , LAST_DAY(TO_DATE('+ SqlValue(edMesHasta.Text)+', ''YYYYMM'')));');
  end;

  sSql :=
    ' SELECT tb_descripcion "Sector", it_nombre "Preventor", art.hys.get_nombre_preventor_coord(ip_itcodigo) "Coordinador Actual", ' +
    '        ip_cuit "Cuit", em_nombre "Empresa", ip_estableci "Nro.Estab.", ip_medicion "Medición", ip_recomendacion "Recomendación", ' +
    '        ip_fechadesde "Fecha Desde", ip_fechahasta "Fecha Hasta", ip_visitafallida "Visita Fallida", ip_siniestro "Siniestro", ' +
    '        ip_denunciastr "Desnuncia SRT", art.hys.get_tipo_estab_srt(ip_cuit, ip_estableci, ip_fechadesde) "Tipo Estab.SRT(Tarea)", ' +
    '        art.hys.get_tipo_estab_prev(ip_cuit, ip_estableci) "Tipo Estab.Prev.Actual", ' +
    '        art.hys.get_operativovigente_empresa(ip_cuit, ip_fechadesde) "Operativo(Tarea)", ' +
    '        Trunc((SELECT MIN(rv_fecha) ' +
    '          FROM art.prv_resvisitas ' +
    '         WHERE rv_fechabaja IS NULL ' +
    '           AND rv_idvisitaasociada IS NULL ' +
    '           AND em_cuit = rv_cuit ' +
    '           AND ip_estableci = rv_estableci ' +
    '           AND rv_fecha BETWEEN ip_fechadesde AND ip_fechahasta)) AS "F.Visita en Período", ' +
    '        art.hys.get_nombre_preventor_estab(ip_cuit, ip_estableci, ip_fechadesde) "Preventor(Tarea)", ' +
    '        art.hys.get_nombre_preventor_estab(ip_cuit, ip_estableci) "Preventor Actual", ' +
    '        oh_observacion "Observación", vo_observacion "Observación Libre" ' +
    '  FROM hys.hoh_observacionhys, hys.hvo_vencimientoobservacion, hys.hip_incumplimientosplan hip, afi.aem_empresa, art.ctb_tablas, art.pit_firmantes ' +
    ' WHERE em_cuit = ip_cuit ' +
    '   AND tb_clave = ''SECT'' ' +
    '   AND tb_codigo = em_sector ' +
    '   AND ip_cuit = vo_cuit(+) ' +
    '   AND ip_estableci = vo_estableci(+) ' +
    '   AND ip_medicion = vo_tipomedicion(+) ' +
    '   AND ip_fechadesde = vo_fechadesde(+) ' +
    '   AND ip_fechahasta = vo_fechahasta(+) ' +
    '   AND vo_idobservacion = oh_id(+) ' +
    '   AND oh_modulo(+) = ''AV'' ' +
    iif(chkSinPreventor.Checked,' AND it_codigo(+) = ip_itcodigo ', '  AND it_codigo = ip_itcodigo AND it_fechabaja IS NULL ')+
    sWhere;
  sdqConsulta.SQL.Text := sSql;
  edMes.Tag := 0;
  inherited;
end;

procedure TfrmAdmVencidos.tbSumatoriaClick(Sender: TObject);
begin
  inherited;
  if not sdqConsulta.IsEmpty then
    ShowMessage('Registros: ' + IntToStr(sdqConsulta.RecordCount));
end;

procedure TfrmAdmVencidos.OnEmpresaChangeFiltro(
  Sender: TObject);
begin
  VCLExtra.LockControl(edEstablecimiento, not fraEmpresaFiltro.IsSelected);
end;

function TfrmAdmVencidos.ArmarFiltroEstab(
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



procedure TfrmAdmVencidos.tbLimpiarClick(Sender: TObject);
var
  i: integer;
begin
  fraEmpresaFiltro.Clear;
  edEstablecimiento.Clear;
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  chkSinPreventor.Checked := false;
  cbNoTercerizado.Checked := false;
  cbTercerizado.Checked := false;
  edMes.Periodo.SetPeriodoActual;
  edMesHasta.Periodo.SetPeriodoActual;
  for i:=0 to cmbTipoMedicion.Items.Count-1 do
    cmbTipoMedicion.Checked[i] := Odd(i);
  inherited;
end;

procedure TfrmAdmVencidos.tbEnviarMailClick(Sender: TObject);
var
  sEmail: String;
begin
  if tbExportar.Enabled then
  begin
    inherited;
    tbExportar.Click;
    if ExportDialog.OutputFile <> '' then
    begin
      if fraPreventorFiltro.IsSelected then
        sEmail := fraPreventorFiltro.sdqDatos.fieldbyname('it_email').AsString
      else
        sEmail := '';
      EnviarMailBD(sEmail, 'Tareas Vencidas',
                  [oAlwaysShowDialog, oAutoFirma, oBodyIsRTF], '', GetAttachments(ExportDialog.OutputFile, 0));
    end;
  end;
end;

procedure TfrmAdmVencidos.tbPropiedadesClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro.');
    fraObservacion.Clear;
    edObservacionLibre.Clear;
    if fpObservaciones.ShowModal = mrOk then
      for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
        ActualizarObservacion(fraObservacion.Value, edObservacionLibre.Text);
      end;
  end;
end;

procedure TfrmAdmVencidos.ActualizarObservacion(IdObservacion: integer;
  Observacion: String);
begin
  if ExisteSqlEx(' SELECT 1 ' +
                 ' FROM hys.hvo_vencimientoobservacion ' +
                 ' WHERE vo_cuit = :cuit ' +
                 ' AND vo_estableci = :estab ' +
                 ' AND vo_tipomedicion = :med ' +
                 ' AND vo_fechadesde = '  + SqlValue(sdqConsulta.FieldByName('Fecha Desde').AsDateTime) +
                 ' AND vo_fechahasta = '  + SqlValue(sdqConsulta.FieldByName('Fecha Hasta').AsDateTime),
                  [sdqConsulta.FieldByName('Cuit').AsString,
                   sdqConsulta.FieldByName('Nro.Estab.').AsInteger,
                   sdqConsulta.FieldByName('Medición').AsString]
                 ) then
    EjecutarSqlEx(' UPDATE hys.hvo_vencimientoobservacion ' +
                  ' SET vo_idobservacion = :id, ' +
                  '     vo_observacion = :obs, ' +
                  '     vo_fechamodif = sysdate, ' +
                  '     vo_usumodif = :usu ' +
                  ' WHERE vo_cuit = :cuit ' +
                  ' AND vo_estableci = :estab ' +
                  ' AND vo_tipomedicion = :med ' +
                  ' AND vo_fechadesde = '  + SqlValue(sdqConsulta.FieldByName('Fecha Desde').AsDateTime) +
                  ' AND vo_fechahasta = '  + SqlValue(sdqConsulta.FieldByName('Fecha Hasta').AsDateTime),
                  [IdObservacion,
                   Observacion,
                   Sesion.LoginName,
                   sdqConsulta.FieldByName('Cuit').AsString,
                   sdqConsulta.FieldByName('Nro.Estab.').AsInteger,
                   sdqConsulta.FieldByName('Medición').AsString]
                 )
  else
    EjecutarSqlEx(' INSERT INTO hys.hvo_vencimientoobservacion(vo_cuit, vo_estableci, vo_fechadesde, vo_fechahasta, ' +
                  '                                            vo_tipomedicion, vo_idobservacion, vo_observacion, vo_fechaalta, ' +
                  '                                            vo_usualta) ' +
                  ' VALUES(:cuit, :estableci, ' + SqlValue(sdqConsulta.FieldByName('Fecha Desde').AsDateTime) + ', ' +
                            SqlValue(sdqConsulta.FieldByName('Fecha Hasta').AsDateTime) + ', :tipomed, :idobs, :obs, sysdate, :usu)',
                  [sdqConsulta.FieldByName('Cuit').AsString,
                   sdqConsulta.FieldByName('Nro.Estab.').AsInteger,
                   sdqConsulta.FieldByName('Medición').AsString,
                   IdObservacion,
                   Observacion,
                   Sesion.LoginName]
                 );
  sdqConsulta.Refresh;
end;

procedure TfrmAdmVencidos.btnAceptarObservacionClick(Sender: TObject);
begin
  inherited;
  Verificar(not fraObservacion.IsSelected, fraObservacion, 'Debe seleccionar una observación.');
  fpObservaciones.ModalResult := mrOk;
end;

end.
