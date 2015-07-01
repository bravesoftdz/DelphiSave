unit unConsultaGestiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unFraCodigoDescripcion, unfraCodigoDescripcionExt,
  ComboEditor, CheckCombo, ToolEdit, DateComboBox, StdCtrls, Mask,
  PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, JvgGroupBox, JvExComCtrls, JvComCtrls, JvExExtCtrls,
  JvSplitter, JvNetscapeSplitter, unSesion, unfrmObservacion, FormPanel,
  unComunesGestion, Printers, unComunes, FolderDialog, unfraUsuarios;

type

  TModoForm = (mfGestionPendiente, mfConsulta);

  TfrmConsultaGestiones = class(TfrmCustomConsulta)
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    sdqDetalleDDJJ: TSDQuery;
    dsDetalleDDJJ: TDataSource;
    sdqDetalleNotas: TSDQuery;
    dsDetalleNotas: TDataSource;
    sdqDetalleCuiles: TSDQuery;
    dsDetalleCuiles: TDataSource;
    gbDetalle: TJvgGroupBox;
    pcDetalleLote: TJvPageControl;
    tbDDJJ: TTabSheet;
    dbgDetalleDDJJ: TArtDBGrid;
    tbNotas: TTabSheet;
    dbgDetalleNotas: TArtDBGrid;
    tbCuiles: TTabSheet;
    dbgDetalleCuiles: TArtDBGrid;
    JvNetscapeSplitter2: TJvNetscapeSplitter;
    gbFiltro: TJvgGroupBox;
    Panel1: TPanel;
    Label3: TLabel;
    lblAgendada: TLabel;
    Panel3: TPanel;
    pnColorAgendada: TPanel;
    tbObservacion: TToolButton;
    tbGestionMasiva: TToolButton;
    fpOpcionesImpresion: TFormPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    edCantCopias: TIntEdit;
    cmbImpresoras: TComboBox;
    folderDialog: TFolderDialog;
    tbCambiarGestorEmi: TToolButton;
    fpCambiarGestorEmi: TFormPanel;
    btnAceptarCambioGestor: TButton;
    btnCancelarCambioGestor: TButton;
    fraUsuarioCambioGestor: TfraUsuario;
    lblUsuario: TLabel;
    lblSector: TLabel;
    fraSector: TfraCodigoDescripcionExt;
    tbReplicar: TToolButton;
    lblNroLote: TLabel;
    edNroLoteDesde: TIntEdit;
    Label1: TLabel;
    edNroLoteHasta: TIntEdit;
    lblFechaDesdeFiltro: TLabel;
    edFechaDesde: TDateComboBox;
    lblFechaHastaFIltro: TLabel;
    edFechaHasta: TDateComboBox;
    lblEstado: TLabel;
    cmbEstado: TCheckCombo;
    chkExcluirBajas: TCheckBox;
    edNroGestion: TIntEdit;
    lblNroGestion: TLabel;
    fraUsuarioAsignado: TfraCodigoDescripcionExt;
    lbUsuAsignado: TLabel;
    lblGestionable: TLabel;
    fraGestionable: TfraCodigoDescripcion;
    fraSalida: TfraCodigoDescripcionExt;
    Label2: TLabel;
    fraEmpresa: TfraEmpresa;
    gbEmpresas: TGroupBox;
    chkEmpresasBaja: TCheckBox;
    chkEmpresasVIP: TCheckBox;
    chkRestoEmpresas: TCheckBox;
    lblCuit: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure gbFiltroCollapsed(Sender: TObject);
    procedure gbFiltroExpanded(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure dbgDetalleNotasDblClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbObservacionClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbGestionMasivaClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure btnAceptarCambioGestorClick(Sender: TObject);
    procedure fraSectorChange(Sender: TObject);
    procedure tbCambiarGestorEmiClick(Sender: TObject);
    procedure tbReplicarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure chkRestoEmpresasClick(Sender: TObject);
    procedure chkEmpresasNoRestoClick(Sender: TObject);
  private
    FModoForm: TModoForm;
    FInfoExtraSalida: TInfoExtraSalida;
    procedure ArmarConsulta;
    procedure setModoForm(const Value: TModoForm);
    procedure VerNota;
    procedure CambiarGestor;
    procedure CambiarSalida(aSalida:integer; aMailNotificacion: String);
    function ExisteGestionPendiente: boolean;
    procedure MostrarOpcionesNotificacion;
    procedure CargarImpresoras;
  public
    property ModoForm: TModoForm read FModoForm write setModoForm;
  end;

var
  frmConsultaGestiones: TfrmConsultaGestiones;

implementation

uses
  unDmPrincipal, AnsiSql, General, unGestionar, unConstEmision, unGestionEnTramite, unfrmABMNotas,
  CustomDlgs, unFuncionesEmision;

{$R *.dfm}

{ TfrmGestionesPendientes }

procedure TfrmConsultaGestiones.ArmarConsulta;
var
  sSql, sInEstado: String;
  i: integer;
begin
  sSql  := ' SELECT lo_numerolote, se_usuario, se_nombre, ds_contrato, em_cuit, em_nombre, dg_periodo, dg_id, dg_idgestionable, dg_idestadogestion, ' +
           '        ige.ge_descripcion, eg_descripcion, dg_observacion, dg_fechavencimiento, dg_fechagestion, dg_usuariogestion, dg_fechaagendado, rg_descripcion, ' +
           '        mn_descripcion salida, dg_salidagestion, dg_mailnotificacion, dg_numerogestion, ct_contacto, eg_tipo, lo_id, mn_codigo tipocontacto,  ' +
           '        dg_fechabaja, dg_usubaja, lo_descripcion, age.ge_descripcion holding, as_nombre asesor, ec_nombre ejecutivo, ' +
           '        DECODE(em_suss, 1, ''SUSS'', 2, ''No SUSS'', 3, ''Mixto'') AS condicion, art.afiliacion.is_empresavip(co_contrato) EmpresaVip, ' +
           '        art.afiliacion.check_cobertura(co_contrato,sysdate) Cobertura ' +
           ' FROM aec_ejecutivocuenta, emi.ias_asesoremision, afi.age_grupoeconomico age, afi.act_contacto, afi.aem_empresa, afi.aco_contrato, comunes.cmn_modonotificacion, ' +
           '      emi.ieg_estadogestion, emi.ige_gestionable ige, emi.irg_resultadogestion, emi.idg_detallesubloteengestion, ' +
           '      emi.ids_detallesublote, art.use_usuarios, emi.isl_sublote, emi.ilo_lote ' +
           ' WHERE sl_idlote = lo_id ' +
           '   AND se_id = sl_idusuariogestion ' +
           '   AND ds_idsublote = sl_id ' +
           '   AND ds_contrato = co_contrato ' +
           '   AND em_id = co_idempresa ' +
           '   AND dg_iddetallesublote = ds_id ' +
           '   AND rg_id(+) = dg_idresultadogestion ' +
           '   AND ige.ge_id = dg_idgestionable ' +
           '   AND eg_id = dg_idestadogestion ' +
           '   AND mn_id = dg_salidagestion ' +
           '   AND em_idgrupoeconomico = age.ge_id(+) ' +
           '   AND dg_idcontacto = ct_id(+) ' +
           '   AND co_idasesoremision = as_id(+) ' +
           '   AND co_idejecutivo = ec_id(+) ' +
           '   AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO);

  if chkExcluirBajas.Checked then
    sSql := sSql + '   AND sl_fechabaja is null ' +
                   '   AND ds_fechabaja is null ' +
                   '   AND dg_fechabaja is null ';

  if not edNroGestion.IsEmpty then
    sSql := sSql + ' and dg_numerogestion = ' + SqlValue(edNroGestion.Value)
  else begin
    sInEstado := '';
    if (cmbEstado.CheckedCount > 0) then
    begin
      for i:=0 to cmbEstado.Items.Count-1 do
      begin
          if cmbEstado.Checked[i] then
          begin
            if (sInEstado <> '') then
              sInEstado := sInEstado + ', ';
            sInEstado := sInEstado + inttostr(integer(cmbEstado.Items.Objects[i]));
          end;
      end;
      if (sInEstado <> '') then
        sSql := sSql + ' AND dg_idestadogestion IN (' + sInEstado + ') ';
    end;

    if fraGestionable.IsSelected then
      sSql := sSql + ' and dg_idgestionable = ' + SqlValue(fraGestionable.Value);

    if fraEmpresa.IsSelected then
      sSql := sSql + ' and ds_contrato = ' + SqlValue(fraEmpresa.Contrato);

    (*
      sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                     '             FROM emi.isl_subaccionlote, emi.ids_detallesublote ' +
                     '             WHERE sl_idlote = lo_id ' +
                     '             AND sl_id = ds_idsublote ' +
                     '             AND ds_contrato = ' + SqlValue(fraEmpresa.Contrato) +
                     '             )';
  *)
    if fraUsuarioAsignado.IsSelected then
      sSql := sSql + ' and sl_idusuariogestion = ' + SqlValue(fraUsuarioAsignado.Value);

    if fraSalida.IsSelected then
      sSql := sSql + ' and dg_salidagestion = ' + SqlValue(fraSalida.Value);

    if not edNroLoteDesde.IsEmpty then
    begin
       if not edNroLoteHasta.IsEmpty then
       begin
         sSql := sSql + ' and LO_NUMEROLOTE between '
                 + SqlValue(edNroLoteDesde.Value) + 'and '
                 + SqlValue(edNroLoteHasta.Value);
       end else
       begin
         sSql := sSql + ' and LO_NUMEROLOTE >= ' + SqlValue(edNroLoteDesde.Value);
       end;
    end
    else begin
      if not edNroLoteHasta.IsEmpty then
        sSql := sSql + ' and LO_NUMEROLOTE <= ' + SqlValue(edNroLoteHasta.Value);
    end;

    if edFechaDesde.Date > 0  then
    begin
       if edFechaHasta.Date > 0  then
       begin
         sSql := sSql + ' and trunc(LO_FECHAALTA) between '
                 + SqlDate(edFechaDesde.Date) + 'and '
                 + SqlDate(edFechaHasta.Date);
       end else
       begin
         sSql := sSql + ' and trunc(LO_FECHAALTA) >= ' + SqlDate(edFechaDesde.Date);
       end;
    end
    else begin
      if edFechaHasta.Date > 0  then
        sSql := sSql + ' and trunc(LO_FECHAALTA) <= ' + SqlDate(edFechaHasta.Date);
    end;
  end;

  if chkEmpresasBaja.Checked then
    sSql := sSql + ' and art.afiliacion.check_cobertura(co_contrato,sysdate) <> ' + SqlValue(1);

  if chkEmpresasVIP.Checked then
    sSql := sSql + ' and art.afiliacion.is_empresavip(co_contrato) = ' + SqlValue('S');

  if chkRestoEmpresas.Checked then
    sSql := sSql + ' and art.afiliacion.is_empresavip(co_contrato) <> ' + SqlValue('S') +
                   ' and art.afiliacion.check_cobertura(co_contrato,sysdate) = ' + SqlValue(1);


  if SortDialog.OrderBy <> '' then
    sSql := sSql +  ' ' + SortDialog.OrderBy
  else
    sSql := sSql + ' ORDER BY ds_contrato ';

  sdqConsulta.SQL.Text := sSql;
end;

procedure TfrmConsultaGestiones.tbRefrescarClick(Sender: TObject);
begin
  ArmarConsulta;
  inherited;
end;

procedure TfrmConsultaGestiones.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := true;
  fraEmpresa.UltContrato := true;

  with fraUsuarioAsignado do
  begin
    TableName   := 'ART.USE_USUARIOS';
    FieldID     := 'SE_ID';
    FieldCodigo := 'SE_USUARIO';
    FieldDesc   := 'SE_NOMBRE';
    FieldBaja   := 'SE_FECHABAJA';
    ExtraCondition := ' AND SE_USUARIOGENERICO = ''N''';
    ShowBajas   := false;
  end;

  with fraUsuarioCambioGestor do
  begin
    Sector := 'EMI';
    UsuariosGenericos := false;
    ShowBajas := false;
  end;

 with fraSector do
  begin
    TableName   := 'ART.USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas   := false;
    ExtraCondition := ' AND SC_MOSTRAR = ''S''';
    OnChange    := fraSectorChange;
    Codigo := 'EMI';
  end;

  cmbEstado.Clear;
  with GetQuery('SELECT EG_ID, EG_DESCRIPCION FROM EMI.IEG_ESTADOGESTION') do
  try
   while not Eof do
   begin
    cmbEstado.Items.AddObject(FieldbyName('EG_DESCRIPCION').AsString, TObject(FieldbyName('EG_ID').AsInteger));
    Next;
   end;
  finally
    Free;
  end;

  with fraSalida do
  begin
    TableName   := 'COMUNES.CMN_MODONOTIFICACION';
    FieldID     := 'MN_ID';
    FieldCodigo := 'MN_ID';
    FieldDesc   := 'MN_DESCRIPCION';
  end;

  with fraGestionable do
  begin
    TableName := 'emi.ige_gestionable';
    FieldID := 'ge_id';
    FieldCodigo := 'ge_id';
    FieldDesc := 'ge_descripcion';
    FieldBaja := 'ge_fechabaja';
    ShowBajas := true;
  end;

  tbNotas.TabVisible := false;
  tbDDJJ.TabVisible := false;
  tbCuiles.TabVisible := false;

  tbDDJJ.Visible := false;
  tbNotas.Visible := false;
  tbCuiles.Visible := false;
  tbPropiedades.Enabled := false;

  gbDetalle.Collapsed := true;

  tbObservacion.Left := tbSalir.Left;
  tbGestionMasiva.Left := tbPropiedades.Left;
  tbCambiarGestorEmi.Left := tbGestionMasiva.Left;
  tbReplicar.Left := tbSalir.Left;



  CargarImpresoras;
end;

procedure TfrmConsultaGestiones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tbNuevo.Enabled := Seguridad.Activar(tbNuevo) and not sdqConsulta.IsEmpty;
  tbGestionMasiva.Enabled := Seguridad.Activar(tbGestionMasiva) and not sdqConsulta.IsEmpty;
  tbReplicar.Enabled := Seguridad.Activar(tbReplicar) and not sdqConsulta.IsEmpty;
  tbCambiarGestorEmi.Enabled := Seguridad.Activar(tbCambiarGestorEmi) and not sdqConsulta.IsEmpty;
end;

procedure TfrmConsultaGestiones.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  tbNuevo.Enabled := false;
  tbGestionMasiva.Enabled := false;
  tbReplicar.Enabled := false;
  tbCambiarGestorEmi.Enabled := false;
end;

procedure TfrmConsultaGestiones.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  edNroLoteDesde.Clear;
  edNroLoteHasta.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  fraUsuarioAsignado.Clear;
  cmbEstado.Clear;
  fraSalida.Clear;
  fraGestionable.Clear;
  edNroGestion.Clear;
  chkEmpresasBaja.Checked := false;
  chkEmpresasVIP.Checked := false;
  chkRestoEmpresas.Checked := false;
end;

procedure TfrmConsultaGestiones.setModoForm(const Value: TModoForm);
var
  i: integer;
begin
  FModoForm := Value;
  if FModoForm = mfGestionPendiente then
  begin
    tbGestionMasiva.Visible := true;
    tbReplicar.Enabled := Seguridad.Activar(tbReplicar) and true;
    tbCambiarGestorEmi.Enabled := Seguridad.Activar(tbCambiarGestorEmi) and true;
    fraUsuarioAsignado.Codigo := Sesion.LoginName;
    for i:=0 to cmbEstado.Items.Count-1 do
      cmbEstado.Checked[i] := integer(cmbEstado.Items.Objects[i]) = GESTION_PENDIENTE;
  end
  else begin
    tbGestionMasiva.Visible := false;
    tbReplicar.Enabled := false;
    tbCambiarGestorEmi.Enabled := false;
  end;
end;

procedure TfrmConsultaGestiones.tbModificarClick(Sender: TObject);
begin
  inherited;
  with TfrmGestionar.Create(self) do
  try
    Contrato := sdqConsulta.fieldbyname('ds_contrato').AsInteger;
    RefrescarFormularios;
    ShowModal;
    sdqConsulta.Refresh;
  finally
    free;
  end;
end;

procedure TfrmConsultaGestiones.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  sdqDetalleDDJJ.Close;
  sdqDetalleNotas.Close;
  sdqDetalleCuiles.Close;
  sdqDetalleDDJJ.ParamByName('iddetalle').AsInteger := DataSet.FieldByName('DG_ID').AsInteger;
  sdqDetalleDDJJ.Open;
  if sdqDetalleDDJJ.IsEmpty then
  begin
    sdqDetalleNotas.ParamByName('iddetalle').AsInteger := DataSet.FieldByName('DG_ID').AsInteger;
    sdqDetalleNotas.Open;
    if sdqDetalleNotas.IsEmpty then
    begin
      sdqDetalleCuiles.ParamByName('iddetalle').AsInteger := DataSet.FieldByName('DG_ID').AsInteger;
      sdqDetalleCuiles.Open;
      if sdqDetalleCuiles.IsEmpty then
      begin
        tbDDJJ.Visible := false;
        tbNotas.Visible := false;
        tbCuiles.Visible := false;
        tbPropiedades.Enabled := false;
        gbDetalle.Collapsed := true;
      end
      else begin
        tbDDJJ.Visible := false;
        tbNotas.Visible := false;
        tbCuiles.Visible := true;
        tbPropiedades.Enabled := false;
        gbDetalle.Collapsed := false;
      end;
    end
    else begin
      tbDDJJ.Visible := false;
      tbNotas.Visible := true;
      tbPropiedades.Enabled := true;
      tbCuiles.Visible := false;
      gbDetalle.Collapsed := false;
    end;
  end
  else begin
    tbDDJJ.Visible := true;
    tbNotas.Visible := false;
    tbPropiedades.Enabled := false;
    tbCuiles.Visible := false;
    gbDetalle.Collapsed := false;
  end;
  tbObservacion.Enabled := not sdqConsulta.FieldByName('dg_observacion').IsNull;
end;

procedure TfrmConsultaGestiones.gbFiltroCollapsed(Sender: TObject);
begin
  inherited;
  tbMostrarFiltros.Down := not tbMostrarFiltros.Down;
  tbMostrarFiltros.Click;
end;

procedure TfrmConsultaGestiones.gbFiltroExpanded(Sender: TObject);
begin
  inherited;
  tbMostrarFiltros.Down := not tbMostrarFiltros.Down;
  tbMostrarFiltros.Click;
end;

procedure TfrmConsultaGestiones.tbNuevoClick(Sender: TObject);
begin
  inherited;
  if ExisteGestionPendiente then
    with TfrmGestionEnTramite.Create(self) do
    try
      CargarFormulario(sdqConsulta.FieldbyName('ds_contrato').AsInteger);
      if ShowModal = mrOk then
        sdqConsulta.Refresh;
    finally
      free;
    end
  else
    Verificar(true, tbNuevo, 'No hay nada que gestionar.');
end;

procedure TfrmConsultaGestiones.dbgDetalleNotasDblClick(Sender: TObject);
begin
  inherited;
  VerNota;
end;

procedure TfrmConsultaGestiones.VerNota;
begin
  TfrmABMNotas.VerNota(sdqDetalleNotas.FieldByName('no_id').AsInteger);
end;

procedure TfrmConsultaGestiones.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  if tbNotas.Visible then
    VerNota;
end;

procedure TfrmConsultaGestiones.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (sdqConsulta.FieldByName('dg_idestadogestion').AsInteger = GESTION_FINALIZADA) then
  begin
    Background := $00E1FFFF;
    if Highlight then
      Background := clTeal;
  end;

  if (sdqConsulta.FieldByName('dg_idestadogestion').AsInteger = GESTION_AGENDADA) then
  begin
    Background := pnColorAgendada.Color;
    if Highlight then
      Background := clTeal;
  end;

  if (sdqConsulta.FieldByName('EmpresaVip').AsString = 'S') then
    AFont.Color := clPurple;

  if (not (sdqConsulta.FieldByName('dg_fechabaja').IsNull)) or (sdqConsulta.FieldByName('Cobertura').AsInteger <> 1) then
    AFont.Color := clRed;

end;

procedure TfrmConsultaGestiones.tbObservacionClick(Sender: TObject);
begin
  inherited;
  with TfrmObservacion.Create(self) do
  try
    Observacion := sdqConsulta.FieldByName('dg_observacion').AsString;
    ShowModal;
  finally
    free;
  end;

end;

procedure TfrmConsultaGestiones.GridDblClick(Sender: TObject);
begin
  if tbNuevo.Visible then
  begin
    if tbNuevo.Enabled then tbNuevo.Click;
  end
  else begin
    if tbModificar.Enabled then tbModificar.Click;
  end;
end;

function TfrmConsultaGestiones.ExisteGestionPendiente: boolean;
begin
  Result := ExisteSql( ' SELECT 1 ' +
                       ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
                       '      art.use_usuarios, emi.isl_sublote, emi.ilo_lote ' +
                       ' WHERE sl_idlote = lo_id ' +
                       '   AND se_id = sl_idusuariogestion ' +
                       '   AND ds_idsublote = sl_id ' +
                       '   AND dg_iddetallesublote = ds_id ' +
                       '   AND ge_id = dg_idgestionable ' +
                       '   AND sl_fechabaja is null ' +
                       '   AND ds_fechabaja is null ' +
                       '   AND dg_fechabaja is null ' +
                       '   AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
                       '   AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
                       '   AND ds_contrato = ' + SqlValue(sdqConsulta.fieldbyname('ds_contrato').AsInteger));
end;

procedure TfrmConsultaGestiones.tbGestionMasivaClick(Sender: TObject);
var
  ContratoAnt: integer;
  IdGestionableAnt: integer;
  SalidaGestionAnt: integer;
  MailNotificacionAnt: String;
  sObservacion: String;
  NroGestion, IdEvento: integer;
  tmpSortFields: TSortFields;
  bGenerarEventoMasivo: Boolean;
begin
  if SortDialog.OrderBy <> '' then
  begin
    tmpSortFields := TSortFields.Create(self);
    tmpSortFields.Assign(SortDialog.SortFields);
    SortDialog.SortFields.Clear;
    tbRefrescarClick(Sender);
  end;

  IdGestionableAnt := 0;
  SalidaGestionAnt := 0;
  MailNotificacionAnt := '';
  NroGestion := 0;
  tmpSortFields := nil;
  bGenerarEventoMasivo := True;

  with TfrmObservacion.Create(self) do
  try
    Validar := false;
    if (ShowModal = mrOk) then
      sObservacion := Observacion;
  finally
    free;
  end;

  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  self.FormStyle := fsNormal;

  try
    ContratoAnt := 0;
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      if (sdqConsulta.fieldbyname('dg_idestadogestion').AsInteger = GESTION_PENDIENTE) then
      begin
        MostrarOpcionesNotificacion;
        if (sdqConsulta.fieldbyname('tipocontacto').AsString = TIPO_CONTACTO_MAIL) and
           (((sdqConsulta.fieldbyname('dg_mailnotificacion').AsString = 'C') and (get_mailcontrato(sdqConsulta.fieldbyname('ds_contrato').AsInteger)= '')) or
            ((sdqConsulta.fieldbyname('dg_mailnotificacion').AsString = 'E') and (not ExisteMailContacto(sdqConsulta.fieldbyname('ds_contrato').AsInteger))) or
            ((sdqConsulta.fieldbyname('dg_mailnotificacion').AsString = 'A') and (get_mailcontrato(sdqConsulta.fieldbyname('ds_contrato').AsInteger)= '') and (not ExisteMailContacto(sdqConsulta.fieldbyname('ds_contrato').AsInteger))))
        then
        //Nada
        else begin
          if (ContratoAnt <> sdqConsulta.fieldbyname('ds_contrato').AsInteger) then
          begin
            if ContratoAnt <> 0 then
            begin
              ProcesarSalidaGestion(ContratoAnt,
                                    NroGestion,
                                    IdGestionableAnt,
                                    SalidaGestionAnt,
                                    MailNotificacionAnt,
                                    FInfoExtraSalida,
                                    0,
                                    bGenerarEventoMasivo,
                                    IdEvento);
              BeginTrans;
              CommitTrans;
            end;

            ContratoAnt := sdqConsulta.fieldbyname('ds_contrato').AsInteger;
            IdGestionableAnt := sdqConsulta.fieldbyname('dg_idgestionable').AsInteger;
            SalidaGestionAnt := sdqConsulta.fieldbyname('dg_salidagestion').AsInteger;
            MailNotificacionAnt := sdqConsulta.fieldbyname('dg_mailnotificacion').AsString;
            NroGestion := 0;
          end;

          NroGestion := RegistrarResultadoGestion(NroGestion,
                                                  sdqConsulta.fieldbyname('dg_id').AsInteger, 2, GESTION_FINALIZADA,
                                                  sdqConsulta.fieldbyname('dg_salidagestion').AsInteger,
                                                  sdqConsulta.fieldbyname('dg_mailnotificacion').AsString,
                                                  0, sObservacion);
          end;
        end;
      sdqConsulta.Next;
    end;
    if ContratoAnt <> 0 then
    begin
      ProcesarSalidaGestion(ContratoAnt,
                            NroGestion,
                            IdGestionableAnt,
                            SalidaGestionAnt,
                            MailNotificacionAnt,
                            FInfoExtraSalida,
                            0,
                            bGenerarEventoMasivo,
                            IdEvento);
      BeginTrans;
      CommitTrans;
    end;

  finally
    sdqConsulta.EnableControls;
    self.FormStyle := fsMDIChild;
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
  end;

  if Assigned(tmpSortFields) then
  begin
    SortDialog.SortFields.Assign(tmpSortFields);
    tmpSortFields.Free;
  end;
  folderDialog.Tag := 0;
  fpOpcionesImpresion.Tag := 0;
  tbRefrescarClick(Sender);
end;

procedure TfrmConsultaGestiones.MostrarOpcionesNotificacion;
var
  tiposalida: string;
begin
  tiposalida := get_tipocontacto(sdqConsulta.fieldbyname('dg_salidagestion').AsInteger);

  if (fpOpcionesImpresion.Tag = 0) and
     ((tiposalida = TIPO_CONTACTO_FAX) or
     (tiposalida = TIPO_CONTACTO_CORREO) or
     (tiposalida = TIPO_CONTACTO_FAX) or
     (tiposalida = TIPO_CONTACTO_PERSONAL)) then
  begin
    if fpOpcionesImpresion.ShowModal <> mrOk then
      Abort;
  end
  else begin
    if (sdqConsulta.fieldbyname('dg_salidagestion').AsInteger = CONTACTO_VENTANILLA) and (folderDialog.Tag = 0) and folderDialog.Execute then
    begin
      FInfoExtraSalida.PathPdf := folderDialog.Directory;
      folderDialog.Tag := 1;
      FInfoExtraSalida.SoloUnPdf := MsgAsk('¿Desea generar un solo archivo para todas las gestiones?');
    end;
  end;
end;

procedure TfrmConsultaGestiones.btnAceptarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.Tag := 1;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  FInfoExtraSalida.Copias := edCantCopias.Value;
  if rbPreview.Checked then
    FInfoExtraSalida.SalidaReporte := srPreview
  else
    FInfoExtraSalida.SalidaReporte := srPrint;
  fpOpcionesImpresion.ModalResult := mrOk;
end;


procedure TfrmConsultaGestiones.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmConsultaGestiones.FSFormShow(Sender: TObject);
begin
  inherited;
(*
  if FModoForm = mfGestionPendiente then
    tbGestionMasiva.Visible := true
  else
    tbGestionMasiva.Visible := false;
  *)
end;

procedure TfrmConsultaGestiones.CambiarGestor;
var
  idSubLote : Integer;
begin
  idSubLote := ValorSqlInteger( ' SELECT SL_ID '+
                         '   FROM emi.isl_sublote '+
                         '  WHERE sl_idlote = '+SqlValue(sdqConsulta.fieldbyname('lo_id').AsInteger)+
                         '    AND sl_idusuariogestion = '+SqlValue(fraUsuarioCambioGestor.ID));

  if idSubLote = 0 then
  begin
    idSubLote := GetSecNextVal('emi.seq_isl_idsublote');
    EjecutarSql(
      ' INSERT INTO emi.isl_sublote '+
      '             (sl_id, sl_idlote, sl_idusuariogestion, sl_fechaalta, sl_usualta) '+
      '      VALUES ('+ SqlValue(idSubLote)+', '+SqlValue(sdqConsulta.fieldbyname('lo_id').AsInteger)+','+
                     SqlValue(fraUsuarioCambioGestor.ID) + ', SYSDATE,'+SqlValue(Sesion.LoginName)+')');

  end;


  EjecutarSql( ' UPDATE emi.ids_detallesublote ' +
               ' SET ds_idsublote = ' + SqlValue(idSubLote) + ', ' +
               '     ds_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
               '     ds_fechamodif = sysdate ' +
               ' WHERE ds_id in ( ' +
               '                  SELECT ds_id ' +
               '                  FROM emi.idg_detallesubloteengestion, emi.ids_detallesublote ids, ' +
               '                       emi.isl_sublote, emi.ilo_lote ' +
               '                  WHERE sl_idlote = lo_id ' +
               '                    AND ids.ds_idsublote = sl_id ' +
               '                    AND dg_iddetallesublote = ids.ds_id ' +
               '                    AND sl_fechabaja is null ' +
               '                    AND ids.ds_fechabaja is null ' +
               '                    AND dg_fechabaja is null ' +
               '                    AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
               '                    AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
               '                    AND dg_idgestionable = ' + SqlValue(sdqConsulta.fieldbyname('dg_idgestionable').AsInteger) +
                                    iif(sdqConsulta.fieldbyname('dg_periodo').IsNull, '', ' AND dg_periodo = ' + SqlValue(sdqConsulta.fieldbyname('dg_periodo').AsString)) +
               '                    AND ids.ds_contrato = ' + SqlValue(sdqConsulta.fieldbyname('ds_contrato').AsInteger) + ')');

 { EjecutarSql( ' UPDATE emi.isl_sublote ' +
               ' SET sl_idusuariogestion = ' + SqlValue(fraUsuarioCambioGestor.ID) + ', ' +
               '     sl_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
               '     sl_fechamodif = sysdate ' +
               ' WHERE sl_id in ( ' +
               '                  SELECT sl_id ' +
               '                  FROM emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
               '                       emi.isl_sublote, emi.ilo_lote ' +
               '                  WHERE sl_idlote = lo_id ' +
               '                    AND ds_idsublote = sl_id ' +
               '                    AND dg_iddetallesublote = ds_id ' +
               '                    AND sl_fechabaja is null ' +
               '                    AND ds_fechabaja is null ' +
               '                    AND dg_fechabaja is null ' +
               '                    AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
               '                    AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
               '                    AND dg_idgestionable = ' + SqlValue(sdqConsulta.fieldbyname('dg_idgestionable').AsInteger) +
               '                    AND ds_contrato = ' + SqlValue(sdqConsulta.fieldbyname('ds_contrato').AsInteger) + ')');}
end;

procedure TfrmConsultaGestiones.btnAceptarCambioGestorClick(
  Sender: TObject);
begin
  Verificar(not fraUsuarioCambioGestor.IsSelected, fraUsuarioCambioGestor, 'Debe selecccionar un usuario.');
  CambiarGestor;
  CambiarSalida(CONTACTO_TELEFONICO, '');
  fpCambiarGestorEmi.ModalResult := mrOk;
  sdqConsulta.Refresh;
end;

procedure TfrmConsultaGestiones.fraSectorChange(Sender: TObject);
begin
  fraUsuarioCambioGestor.Sector := fraSector.Codigo;
end;

procedure TfrmConsultaGestiones.tbCambiarGestorEmiClick(Sender: TObject);
begin
  if sdqConsulta.Active and  not sdqConsulta.IsEmpty then
    fpCambiarGestorEmi.ShowModal;
end;

procedure TfrmConsultaGestiones.tbReplicarClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (sdqConsulta.fieldbyname('eg_tipo').AsString = TIPO_GESTION_FINALIZADA) then
  begin
    do_replicarlotegestion(sdqConsulta.fieldbyname('lo_id').AsInteger,
                           sdqConsulta.fieldbyname('dg_idgestionable').AsInteger,
                           sdqConsulta.fieldbyname('ds_contrato').AsInteger,
                           sdqConsulta.fieldbyname('DG_USUARIOGESTION').AsString);
    sdqConsulta.Refresh;
  end;
  MsgBox('El lote fue replicado con éxito', MB_ICONINFORMATION, tbReplicar.Hint);
end;

procedure TfrmConsultaGestiones.CambiarSalida(aSalida: integer;
  aMailNotificacion: String);
begin
  EjecutarSql( ' UPDATE emi.idg_detallesubloteengestion ' +
               ' SET dg_salidagestion = ' + SqlValue(aSalida) + ', ' +
               '     dg_mailnotificacion = ' + SqlValue(aMailNotificacion) + ', ' +
               '     dg_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
               '     dg_fechamodif = sysdate ' +
               ' WHERE dg_id in ( ' +
               '                  SELECT dg_id ' +
               '                  FROM emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
               '                       emi.isl_sublote, emi.ilo_lote ' +
               '                  WHERE sl_idlote = lo_id ' +
               '                    AND ds_idsublote = sl_id ' +
               '                    AND dg_iddetallesublote = ds_id ' +
               '                    AND sl_fechabaja is null ' +
               '                    AND ds_fechabaja is null ' +
               '                    AND dg_fechabaja is null ' +
               '                    AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
               '                    AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
               '                    AND dg_idgestionable = ' + SqlValue(sdqConsulta.fieldbyname('dg_idgestionable').AsInteger) +
               '                    AND ds_contrato = ' + SqlValue(sdqConsulta.fieldbyname('ds_contrato').AsInteger) + ')');
end;

procedure TfrmConsultaGestiones.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and
    (sdqConsulta.FieldByName('dg_fechabaja').IsNull) and (MsgBox('¿ Desea dar de baja el registro seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSql(
      ' UPDATE emi.idg_detallesubloteengestion '+
      '    SET dg_fechabaja = SYSDATE, '+
      '        dg_usubaja = '+SqlValue(Sesion.LoginName)+
      '  WHERE dg_id = '+SqlValue(sdqConsulta.FieldByName('dg_id').AsInteger));
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsultaGestiones.chkRestoEmpresasClick(Sender: TObject);
begin
  if chkRestoEmpresas.Checked then
  begin
    chkEmpresasVIP.Checked := false;
    chkEmpresasBaja.Checked := false;
  end;
end;

procedure TfrmConsultaGestiones.chkEmpresasNoRestoClick(Sender: TObject);
begin
  if chkEmpresasVIP.Checked or chkEmpresasBaja.Checked then
    chkRestoEmpresas.Checked := false;
end;

end.
