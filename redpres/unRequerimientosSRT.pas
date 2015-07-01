unit unRequerimientosSRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, Mask, ToolEdit, DateComboBox, unfraUsuarios, SinEdit, FormPanel,
  unArtFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unFraTrabajadorSIN, unArtDBAwareFrame, Buttons, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo;

type
  TfrmRequerimientosSRT = class(TfrmCustomConsulta)
    gbFechaRequerimiento: TGroupBox;
    Label2: TLabel;
    edFechaRequermientoDesde: TDateComboBox;
    edFechaRequermientoHasta: TDateComboBox;
    gbFechaVencimiento: TGroupBox;
    Label1: TLabel;
    edFechaVencimientoDesde: TDateComboBox;
    edFechaVencimientoHasta: TDateComboBox;
    gbEntregadoA: TGroupBox;
    fraUsuarioEntregadoA: TfraUsuario;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbNroSRT: TGroupBox;
    edNroSRT: TEdit;
    fpDialogModifRequerimiento: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarModifRequerimiento: TButton;
    btnCancelarModifRequerimiento: TButton;
    edReciboSRT: TEdit;
    lbReciboSRT: TLabel;
    edFechaPresentacion: TDateComboBox;
    lbFechaPresentacion: TLabel;
    lbFechaProrroga: TLabel;
    edFechaProrroga: TDateComboBox;
    edObservaciones: TMemo;
    lbObservaciones: TLabel;
    fpDialogAltaRequerimiento: TFormPanel;
    Bevel1: TBevel;
    btnAceptarAltaRequerimiento: TButton;
    btnCancelarAltaRequerimiento: TButton;
    lbDetalle: TLabel;
    edDetalleAlta: TMemo;
    lbFechaRequerimiento: TLabel;
    edFechaRequerimientoAlta: TDateComboBox;
    lbFechaVencimiento: TLabel;
    edFechaVencimientoAlta: TDateComboBox;
    edNroSRTAlta: TEdit;
    lbNroSRTAlta: TLabel;
    fraUsuarioEntregadoAAlta: TfraUsuario;
    lbUsuarioEntregadoAAlta: TLabel;
    lbFirmaSRT: TLabel;
    edFirmaSRTAlta: TEdit;
    lbReciboART: TLabel;
    edReciboARTAlta: TEdit;
    fraStaticCTBMotivoAlta: TfraStaticCTB_TABLAS;
    lbMotivo: TLabel;
    lbObservacionesAlta: TLabel;
    edObservacionesAlta: TMemo;
    SinEditAlta: TSinEdit;
    lbSiniestro: TLabel;
    fraTrabajadorSINAlta: TfraTrabajadorSIN;
    lbEntregadoA2: TLabel;
    fraUsuarioEntregadoAMod: TfraUsuario;
    gbMotivo: TGroupBox;
    fraStaticCTBMotivo: TfraStaticCTB_TABLAS;
    fpImagenSRT: TFormPanel;
    tbImagenSRT: TToolButton;
    ScrollBox1: TScrollBox;
    imgSRT: TImage;
    Panel1: TPanel;
    btnCerrarRegion: TBitBtn;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    gbPresentado: TGroupBox;
    rbSi: TRadioButton;
    rbNo: TRadioButton;
    rbTodos: TRadioButton;
    gbFechaSin: TGroupBox;
    Label3: TLabel;
    edFechaSinDesde: TDateComboBox;
    edFechaSinHasta: TDateComboBox;
    gbDelegacion: TGroupBox;
    cmbDelegacion: TDBCheckCombo;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    tbCantidad: TToolButton;
    ToolButton2: TToolButton;
    pnlTotal: TPanel;
    gbEntregadoM: TGroupBox;
    rbEnTerminoM: TRadioButton;
    rbVencidoM: TRadioButton;
    fraMotivoMod: TfraStaticCTB_TABLAS;
    Label4: TLabel;
    gbEntregado: TGroupBox;
    rbEnTermino: TRadioButton;
    rbVencido: TRadioButton;
    rbTodosEnt: TRadioButton;
    rbNoEntregado: TRadioButton;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    sdqGtrabajo: TSDQuery;
    dsGtrabajo: TDataSource;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edFechaRequermientoDesdeExit(Sender: TObject);
    procedure edFechaVencimientoDesdeExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarModifRequerimientoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpDialogAltaRequerimientoEnter(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarAltaRequerimientoClick(Sender: TObject);
    procedure fraTrabajadorSINAltaOnChange(Sender: TObject);
    procedure SinEditAltaExit(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure tbImagenSRTClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure edFechaSinDesdeExit(Sender: TObject);
    procedure tbCantidadClick(Sender: TObject);
    procedure cmbGtrabajoCloseUp(Sender: TObject; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DoHabilitarCamposModifRequerimiento(bFechaBajaNula, bFechaPresentacionNula, bReciboSRTNulo: Boolean);
    function IsDatosValidosModifRequerimiento(): Boolean;
    function IsDatosValidosAltaRequerimiento(): Boolean;
    function IsSiniestroValido(Siniestro, Orden, Recaida: Integer): Boolean;
    function GetMinFechaRequermiento(Recaida: Integer; FechaAccidente, FechaRecaida: TDateTime): TDateTime;
  public
  end;

var
  frmRequerimientosSRT: TfrmRequerimientosSRT;

implementation

uses unPrincipal, AnsiSql, SqlFuncs, CustomDlgs, unDmPrincipal, unArt, VCLExtra,
     ArtFuncs, General, unImageFunctions, unSesion;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.FormCreate(Sender: TObject);
begin
  inherited;

  ToolBar.Images    := frmPrincipal.imgGenBW;
  ToolBar.HotImages := frmPrincipal.imgGenColor;

  tbRefrescar.ImageIndex              := 4;
  tbNuevo.ImageIndex                  := 23;
  tbModificar.ImageIndex              := 24;
  tbEliminar.ImageIndex               := 25;
  tbPropiedades.ImageIndex            := 15;
  tbLimpiar.ImageIndex                := 3;
  tbOrdenar.ImageIndex                := 5;
  tbMostrarOcultarColumnas.ImageIndex := 14;
  tbImprimir.ImageIndex               := 7;
  tbExportar.ImageIndex               := 1;
  tbMostrarFiltros.ImageIndex         := 17;
  tbMaxRegistros.ImageIndex           := 19;
  tbSalir.ImageIndex                  := 42;

  IMG_FILTROS_SHOW := 17;
  IMG_FILTROS_HIDE := 18;

  fraUsuarioEntregadoA.ShowBajas     := True;
  fraUsuarioEntregadoAAlta.ShowBajas := False;
  fraStaticCTBMotivoAlta.Clave       := 'MOSRT';
  fraStaticCTBMotivoAlta.ShowBajas   := False;
  fraTrabajadorSINAlta.OnChange      := fraTrabajadorSINAltaOnChange;
  fraStaticCTBMotivo.Clave           := 'MOSRT';
  fraStaticCTBMotivo.ShowBajas       := True;
  fraMotivoMod.Clave                 := 'MOSRT';
  fraMotivoMod.ShowBajas             := False;

  sdqDelegacion.Open;
  sdqGTrabajo.Open;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.edFechaRequermientoDesdeExit(Sender: TObject);
begin
  inherited;
  if edFechaRequermientoHasta.IsEmpty then
    edFechaRequermientoHasta.Date := edFechaRequermientoDesde.Date;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.edFechaVencimientoDesdeExit(Sender: TObject);
begin
  inherited;
  if edFechaVencimientoHasta.IsEmpty then
    edFechaVencimientoHasta.Date := edFechaVencimientoDesde.Date;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaRequermientoDesde.Clear;
  edFechaRequermientoHasta.Clear;
  edFechaVencimientoDesde.Clear;
  edFechaVencimientoHasta.Clear;
  edFechaSinDesde.Clear;
  edFechaSinHasta.Clear;
  fraUsuarioEntregadoA.Limpiar;
  edSiniestro.Siniestro   := 0;
  edNroSRT.Clear;
  rbTodos.Checked         := True;
  rbTodosEnt.Checked      := True;
  fraStaticCTBMotivo.Clear;
  cmbGtrabajo.Clear;
  cmbGestor.Clear;
  cmbDelegacion.Clear;
  tbCantidad.Down := False;
  tbCantidadClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSqlWhere := SqlBetween( ' AND RS_FECREQUE', edFechaRequermientoDesde.Date, edFechaRequermientoHasta.Date ) +
               SqlBetween( ' AND NVL(RS_FECPRORROGA, RS_FECVENCE)', edFechaVencimientoDesde.Date, edFechaVencimientoHasta.Date ) +
               SqlBetween( ' AND EX_FECHAACCIDENTE', edFechaSinDesde.Date, edFechaSinHasta.Date );

  if fraUsuarioEntregadoA.IsSelected then
    sSqlWhere := sSqlWhere + ' AND RS_ENTREGADO=' + SqlValue(fraUsuarioEntregadoA.edCodigo.Text);

  if not edSiniestro.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND RS_SINIESTRO=' + SqlValue(edSiniestro.Siniestro);

  if Trim(edNroSRT.Text) <> '' then
    sSqlWhere := sSqlWhere + ' AND RS_NROSRT=' + SqlValue(edNroSRT.Text);

  if rbSi.Checked then
    sSqlWhere := sSqlWhere + ' AND NVL(RS_FECPRESENTACION, RS_FECHABAJA) IS NOT NULL'
  else if rbNo.Checked then
    sSqlWhere := sSqlWhere + ' AND NVL(RS_FECPRESENTACION, RS_FECHABAJA) IS NULL';

  if fraStaticCTBMotivo.IsSelected then
    sSqlWhere := sSqlWhere + ' AND RS_MOTIVO=' + SqlValue(fraStaticCTBMotivo.edCodigo.Text);

  if (cmbDelegacion.Text <> '') then
    sSqlWhere := sSqlWhere + ' AND EX_DELEGACION ' + cmbDelegacion.InSql;

  if (cmbGtrabajo.Text <> '') then
    sSqlWhere := sSqlWhere + ' AND EX_GTRABAJO ' + cmbGtrabajo.InSql;

  if (cmbGestor.Text <> '') then
    sSqlWhere := sSqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text);

  if rbEnTermino.Checked then
    sSqlWhere := sSqlWhere + ' AND RS_ENTERMINO = ''S'' '
  else if rbVencido.Checked then
    sSqlWhere := sSqlWhere + ' AND RS_ENTERMINO = ''N'' ';

  sSql := 'SELECT rs_id, to_char(rs_id) id, utiles.armar_siniestro(rs_siniestro, rs_orden, rs_recaida) siniestro, ' +
                ' tj_nombre, rs_detalle, rs_fecreque, rs_fecvence, rs_nrosrt, rs_firmasrt, tb_descripcion descrmotivo, ' +
                ' se_nombre, rs_reciboart, rs_observaciones, rs_recibosrt, rs_fecpresentacion, rs_fecprorroga, ' +
                ' rs_fechabaja, rs_entregado, rs_idwf, rs_imgsrt, rs_imgart, ex_fechaaccidente fechasin, ' +
                ' lg_nombre delegacion, rs_entermino, rs_motivo, ' +
                ' siniestro.get_usuariogestor(ex_id) usugestor, gp_nombre ' +
           ' FROM sex_expedientes, ctj_trabajadores, use_usuarios, ' +
                ' ctb_tablas, dlg_delegaciones, mgp_gtrabajo, mrs_requerimientosrt '+
          ' WHERE rs_siniestro = ex_siniestro(+) ' +
            ' AND rs_orden = ex_orden(+) ' +
            ' AND rs_recaida = ex_recaida(+) ' +
            ' AND ex_gtrabajo = gp_codigo(+) ' +
            ' AND ex_delegacion = lg_codigo(+) ' +
            ' AND ex_cuil = tj_cuil(+) ' +
            ' AND rs_entregado = se_usuario(+) ' +
            ' AND tb_clave(+) = ''MOSRT'' ' +
            ' AND tb_codigo(+) = rs_motivo ' + sSqlWhere;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  tbCantidadClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  if not sdqConsulta.FieldByName('RS_FECHABAJA').IsNull then
    InvalidMsg(Grid, 'El requerimiento ya se encuentra dado de baja')
  else begin
    if MsgBox('¿Usted está seguro que quiere dar de baja el requerimiento seleccionado?', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      try
        sSql := 'UPDATE mrs_requerimientosrt ' +
                  ' SET rs_usubaja = ' + SqlValue(Sesion.UserId) + ', ' +
                      ' rs_fechabaja = ' + SqlValue(DBDate) +
                ' WHERE rs_id = ' + SqlInt(sdqConsulta.FieldByName('RS_ID').AsInteger);
        EjecutarSql(sSql);
        sdqConsulta.Refresh;
      except
        on E: Exception do
          Raise Exception.Create(E.Message + CRLF + 'Error al dar de baja el requermiento de la SRT');
      end;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  // así lo muestra con letras en rojo
  if not sdqConsulta.FieldByName('RS_FECHABAJA').IsNull then
    AFont.Color :=  clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.btnAceptarModifRequerimientoClick(Sender: TObject);
begin
  if IsDatosValidosModifRequerimiento() then
  try
    // actualizo los datos del requerimiento a la SRT
    with TSql.Create('MRS_REQUERIMIENTOSRT') do
    try
      PrimaryKey.Add('RS_ID',             sdqConsulta.FieldByName('RS_ID').AsInteger);
      Fields.Add('RS_ENTREGADO',          fraUsuarioEntregadoAMod.edCodigo.Text);
      Fields.Add('RS_FECPRORROGA',        edFechaProrroga.Date);
      Fields.Add('RS_RECIBOSRT',          edReciboSRT.Text);
      Fields.Add('RS_FECPRESENTACION',    edFechaPresentacion.Date);
      Fields.Add('RS_OBSERVACIONES',      edObservaciones.Text);
      Fields.Add('RS_ENTERMINO',          String(IIF(rbEnTerminoM.Checked, 'S', IIF(rbVencidoM.Checked,'N', ''))));
      Fields.Add('RS_MOTIVO',             fraMotivoMod.Codigo);
      Fields.Add('RS_FECHAMODIF',         SQL_ACTUALDATE, False);
      Fields.Add('RS_USUMODIF',           Sesion.UserId);

      SqlType := stUpdate;
      EjecutarSql(Sql);
    finally
      Free;
    end;

    MsgBox('El requerimiento se modificó correctamente' , MB_OK + MB_ICONINFORMATION);
    fpDialogModifRequerimiento.ModalResult := mrOk;
  except
    On E: Exception do
      Raise Exception.Create(E.Message + CRLF + 'Error al modificar el requerimiento');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbModificarClick(Sender: TObject);
begin
  inherited;
  DoHabilitarCamposModifRequerimiento(sdqConsulta.FieldByName('RS_FECHABAJA').IsNull,
                                      sdqConsulta.FieldByName('RS_FECPRESENTACION').IsNull,
                                      sdqConsulta.FieldByName('RS_RECIBOSRT').IsNull);
  fraUsuarioEntregadoAMod.Cargar(sdqConsulta.FieldByName('RS_ENTREGADO').AsString);
  fraMotivoMod.Codigo      := sdqConsulta.FieldByName('RS_MOTIVO').AsString;
  edFechaProrroga.Date     := sdqConsulta.FieldByName('RS_FECPRORROGA').AsDateTime;
  edReciboSRT.Text         := sdqConsulta.FieldByName('RS_RECIBOSRT').AsString;
  edFechaPresentacion.Date := sdqConsulta.FieldByName('RS_FECPRESENTACION').AsDateTime;
  edObservaciones.Text     := sdqConsulta.FieldByName('RS_OBSERVACIONES').AsString;
  if (sdqConsulta.FieldByName('RS_ENTERMINO').AsString = 'N') then
    rbVencidoM.Checked := True
  else if (sdqConsulta.FieldByName('RS_ENTERMINO').AsString = 'S') then
    rbEnTerminoM.Checked := True
  else
    rbNoEntregado.Checked := True;

  if fpDialogModifRequerimiento.ShowModal = mrOk then
    sdqConsulta.Refresh;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.DoHabilitarCamposModifRequerimiento(bFechaBajaNula, bFechaPresentacionNula, bReciboSRTNulo: Boolean);
var
  bHabilitarSoloObservaciones, bHabilitarReciboSRT: Boolean;
begin
  bHabilitarSoloObservaciones := not (bFechaBajaNula and bFechaPresentacionNula);
  LockControls([fraUsuarioEntregadoAMod, edFechaProrroga, edFechaPresentacion,
                rbEnTerminoM, rbVencidoM, rbNoEntregado, fraMotivoMod], bHabilitarSoloObservaciones);
  bHabilitarReciboSRT := (bFechaBajaNula and not bFechaPresentacionNula and bReciboSRTNulo) or
                         (bFechaBajaNula and bFechaPresentacionNula);
  LockControl(edReciboSRT, not bHabilitarReciboSRT);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRequerimientosSRT.IsDatosValidosModifRequerimiento: Boolean;
begin
  Result := False;

  // valido fecha de prórroga
  if not edFechaProrroga.IsEmpty and (edFechaProrroga.Date < sdqConsulta.FieldByName('RS_FECVENCE').AsDateTime) then
    InvalidMsg(edFechaProrroga, 'La fecha de prórroga no puede ser menor a la fecha de vencimiento: ' + sdqConsulta.FieldByName('RS_FECVENCE').AsString)

  // valido fecha de presentación
  else if not edFechaPresentacion.IsEmpty and (edFechaPresentacion.Date < sdqConsulta.FieldByName('RS_FECREQUE').AsDateTime) then
    InvalidMsg(edFechaPresentacion, 'La fecha de presentación no puede ser menor a la fecha de requerimiento: ' + sdqConsulta.FieldByName('RS_FECREQUE').AsString)

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.fpDialogAltaRequerimientoEnter(Sender: TObject);
begin
  inherited;
  SinEditAlta.Clear;
  fraTrabajadorSINAlta.Limpiar;
  edDetalleAlta.Clear;
  edFechaRequerimientoAlta.Clear;
  edFechaVencimientoAlta.Clear;
  edNroSRTAlta.Clear;
  fraUsuarioEntregadoAAlta.Limpiar;
  edFirmaSRTAlta.Clear;
  edReciboARTAlta.Clear;
  fraStaticCTBMotivoAlta.Clear;
  edObservacionesAlta.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbNuevoClick(Sender: TObject);
begin
  inherited;
  if (fpDialogAltaRequerimiento.ShowModal = mrOk) and sdqConsulta.Active then
    sdqConsulta.Refresh;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.btnAceptarAltaRequerimientoClick(Sender: TObject);
begin
  if IsDatosValidosAltaRequerimiento() then
  try
    // inserto los datos del requerimiento a la SRT
    with TSql.Create('MRS_REQUERIMIENTOSRT') do
      try
        PrimaryKey.Add('RS_ID',             GetSecNextVal('SEQ_MRS_ID'));
        if not SinEditAlta.IsEmpty then
        begin
          Fields.Add('RS_SINIESTRO',          SinEditAlta.Siniestro);
          Fields.Add('RS_ORDEN',              SinEditAlta.Orden);
          Fields.Add('RS_RECAIDA',            SinEditAlta.Recaida);
        end;
        Fields.Add('RS_DETALLE',            edDetalleAlta.Text);
        Fields.Add('RS_FECREQUE',           edFechaRequerimientoAlta.Date);
        Fields.Add('RS_FECVENCE',           edFechaVencimientoAlta.Date);
        Fields.Add('RS_NROSRT',             edNroSRTAlta.Text);
        Fields.Add('RS_ENTREGADO',          fraUsuarioEntregadoAAlta.edCodigo.Text);
        Fields.Add('RS_RECIBOART',          edReciboARTAlta.Text);
        Fields.Add('RS_FIRMASRT',           edFirmaSRTAlta.Text);
        Fields.Add('RS_MOTIVO',             fraStaticCTBMotivoAlta.edCodigo.Text);
        Fields.Add('RS_OBSERVACIONES',      edObservacionesAlta.Text);
        Fields.Add('RS_FECHAALTA',          SQL_ACTUALDATE, False);
        Fields.Add('RS_USUALTA',            Sesion.UserId);

        SqlType := stInsert;
        EjecutarSql(Sql);
      finally
        Free;
      end;

      MsgBox('El requerimiento se grabó correctamente' , MB_OK + MB_ICONINFORMATION);
      fpDialogAltaRequerimiento.ModalResult := mrOk;
  except
    On E: Exception do
      Raise Exception.Create(E.Message + CRLF + 'Error al grabar el requerimiento');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRequerimientosSRT.IsDatosValidosAltaRequerimiento: Boolean;
var
  MinFechaRequermiento: TDateTime;
begin
  Result := False;

  // valido siniestro
  if not SinEditAlta.IsEmpty and not IsSiniestroValido(SinEditAlta.Siniestro, SinEditAlta.Orden, SinEditAlta.Recaida) then
    exit;

  // siniestro o detalle obligatorios
  if SinEditAlta.IsEmpty and (Trim(edDetalleAlta.Text) = '') then
  begin
    InvalidMsg (SinEditAlta, 'Debe cargar el siniestro o el detalle');
    exit;
  end;

  // valido fecha de requerimiento
  if edFechaRequerimientoAlta.IsEmpty then
  begin
    InvalidMsg(edFechaRequerimientoAlta, 'La fecha de requerimiento es obligatoria');
    exit;
  end;

  if not SinEditAlta.IsEmpty then
  begin
    MinFechaRequermiento := GetMinFechaRequermiento(SinEditAlta.Recaida,
                                                    fraTrabajadorSINAlta.sdqTrabajador.FieldByName('EX_FECHAACCIDENTE').AsDateTime,
                                                    fraTrabajadorSINAlta.sdqTrabajador.FieldByName('EX_FECHARECAIDA').AsDateTime);
    if edFechaRequerimientoAlta.Date < MinFechaRequermiento then
    begin
      InvalidMsg(edFechaRequerimientoAlta, 'La fecha de requerimiento no puede ser menor a la fecha de accidente/recaida del trabajador: ' + DateTimeToStr(MinFechaRequermiento));
      exit;
    end;
  end;

  if edFechaRequerimientoAlta.Date > DBDate then
    InvalidMsg(edFechaRequerimientoAlta, 'La fecha de requerimiento no puede ser mayor a la fecha actual')

  // valido fecha de vencimiento
  else if edFechaVencimientoAlta.IsEmpty then
    InvalidMsg(edFechaVencimientoAlta, 'La fecha de vencimiento es obligatoria')

  else if edFechaVencimientoAlta.Date < edFechaRequerimientoAlta.Date then
    InvalidMsg(edFechaVencimientoAlta, 'La fecha de vencimiento no puede ser menor a la fecha de requerimiento')

  // valido nro. SRT
  else if Trim(edNroSRTAlta.Text) = '' then
    InvalidMsg(edNroSRTAlta, 'El nro. de SRT es obligatorio')

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.fraTrabajadorSINAltaOnChange(Sender: TObject);
begin
  with fraTrabajadorSINAlta do
    if sdqTrabajador.Active then
      SinEditAlta.SetValues(sdqTrabajador.FieldByName('EX_SINIESTRO').AsInteger,
                            sdqTrabajador.FieldByName('EX_ORDEN').AsInteger,
                            sdqTrabajador.FieldByName('EX_RECAIDA').AsInteger);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.SinEditAltaExit(Sender: TObject);
var
  bSiniestroValido: Boolean;
begin
  inherited;

  if SinEditAlta.IsEmpty then
    bSiniestroValido := False
  else
    bSiniestroValido := IsSiniestroValido(SinEditAlta.Siniestro, SinEditAlta.Orden, SinEditAlta.Recaida);

  fraTrabajadorSINAlta.Cargar(SinEditAlta.Siniestro, SinEditAlta.Orden, SinEditAlta.Recaida);

  if bSiniestroValido then
    edFechaRequerimientoAlta.MinDate := GetMinFechaRequermiento(SinEditAlta.Recaida,
                                                                fraTrabajadorSINAlta.sdqTrabajador.FieldByName('EX_FECHAACCIDENTE').AsDateTime,
                                                                fraTrabajadorSINAlta.sdqTrabajador.FieldByName('EX_FECHARECAIDA').AsDateTime)
  else
    edFechaRequerimientoAlta.MinDate := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if not sdqConsulta.FieldByName('RS_FECHABAJA').IsNull then
    AFont.Style := [fsStrikeOut];
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRequerimientosSRT.IsSiniestroValido(Siniestro, Orden, Recaida: Integer): Boolean;
var
  SiniestroValido: Boolean;
  sSql: String;
begin
  if not IsDbSiniestro(Siniestro, Orden, Recaida) then
  begin
    InvalidMsg(SinEditAlta, 'El siniestro no existe');
    SiniestroValido := False;
  end
  else begin
    sSql := 'SELECT 1 ' +
             ' FROM sex_expedientes ' +
            ' WHERE ex_siniestro = ' + SqlInt(Siniestro) +
              ' AND ex_orden = ' + SqlInt(Orden) +
              ' AND ex_recaida = ' + SqlInt(Recaida) +
              ' AND NVL(ex_causafin, ''0'') IN (''95'', ''99'')';
    if ExisteSql(sSql) then
    begin
      InvalidMsg (SinEditAlta, 'El siniestro se encuentra cerrado por error de carga');
      SiniestroValido := False;
    end
    else
      SiniestroValido := True;
  end;
  Result := SiniestroValido;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRequerimientosSRT.GetMinFechaRequermiento(Recaida: Integer; FechaAccidente, FechaRecaida: TDateTime): TDateTime;
begin
  if Recaida = 0 then
    Result := FechaAccidente
  else
    Result := FechaRecaida;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbImagenSRTClick(Sender: TObject);
begin
  if not(sdqConsulta.FieldByName('RS_IMGSRT').IsNull) and
     FileExists(sdqConsulta.FieldByName('RS_IMGSRT').AsString) then
  begin
    if (UpperCase(ExtractFileExt(sdqConsulta.FieldByName('RS_IMGSRT').AsString)) = '.TIF') then
      LoadTiffIntoImageControl(sdqConsulta.FieldByName('RS_IMGSRT').AsString, imgSRT)
    else
      imgSRT.Picture.LoadFromFile(sdqConsulta.FieldByName('RS_IMGSRT').AsString);
    fpImagenSRT.ShowModal;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbSalirClick(Sender: TObject);
begin
  if not(sdqConsulta.FieldByName('RS_IMGART').IsNull) and
     FileExists(sdqConsulta.FieldByName('RS_IMGART').AsString) then
  begin
    if (UpperCase(ExtractFileExt(sdqConsulta.FieldByName('RS_IMGART').AsString)) = '.TIF') then
      LoadTiffIntoImageControl(sdqConsulta.FieldByName('RS_IMGART').AsString, imgSRT)
    else
      imgSRT.Picture.LoadFromFile(sdqConsulta.FieldByName('RS_IMGART').AsString);
    fpImagenSRT.ShowModal;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.edFechaSinDesdeExit(Sender: TObject);
begin
  inherited;
  if edFechaSinHasta.IsEmpty then
    edFechaSinHasta.Date := edFechaSinDesde.Date;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.tbCantidadClick(Sender: TObject);
begin
  if tbCantidad.Down and sdqConsulta.Active then
    pnlTotal.Caption := 'Cantidad de registros: ' + IntToStr(sdqConsulta.RecordCount)
  else
    pnlTotal.Caption := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.cmbGtrabajoCloseUp(Sender: TObject;var Cancel: Boolean);
var
  sSql :String;
begin
  if Trim(cmbGTrabajo.Text) <> '' then  // Lu 04/04/2008 pongo este if para que ejecute lo siguiente solo si se ingreso algo en el combo.
  begin
    cmbGestor.Clear;
    sSql := 'SELECT ug_id, ug_usuario ' +
             ' FROM mgp_gtrabajo, mug_usuariogrupotrabajo, ctb_tablas ' +
            ' WHERE ug_fechabaja IS NULL ' +
              ' AND ug_tipousuario = tb_codigo ' +
              ' AND tb_clave = ''TUSU'' ' +
              ' AND tb_especial1 = ''S'' ' +
              ' AND gp_codigo = ug_grupo ' +
              ' AND gp_gestionado = ''S'' ' +
              ' AND gp_codigo ' + cmbGtrabajo.InSql;
    sdqGestor.Close;
    sdqGestor.SQL.Text := sSql;
    sdqGestor.Open;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRequerimientosSRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.


