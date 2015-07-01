unit unAuditoriaILT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, Vcl.StdCtrls,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, SinEdit, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.ExtCtrls, FormPanel, Vcl.Grids,
  Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin,
  RxToolEdit, unfraUsuarios, Vcl.Mask, DateComboBox, unFraEmpresa, unArtDbFrame,
  unFraTrabajador, unFraTrabajadorSiniestro,
  customdlgs, undmprincipal, unSesion, sqlfuncs, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo;

type
  TfrmAuditoriaILT = class(TfrmCustomGridABM)
    edSiniestro: TSinEdit;
    fraMotivoAuditoria: TfraCodigoDescripcion;
    mObservaciones: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ShortCutControl1: TShortCutControl;
    GroupBox1: TGroupBox;
    fraTrabajadorSiniestro: TfraTrabajadorSiniestro;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    dcDesdeCarga: TDateComboBox;
    dcHastaCarga: TDateComboBox;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    dcDesdeResolucion: TDateComboBox;
    dcHastaResolucion: TDateComboBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    dcDesdePedido: TDateComboBox;
    dcHastaPedido: TDateComboBox;
    gbUsuCarga: TGroupBox;
    fraUsuario: TfraUsuario;
    gbMotivos: TGroupBox;
    sdqMotAudit: TSDQuery;
    dsMotAudit: TDataSource;
    gbEstado: TGroupBox;
    fraEstado: TfraCodigoDescripcion;
    rgVerBajas: TRadioGroup;
    cbMotAudit: TDBCheckCombo;
    tbResolucionMedica: TToolButton;
    fpResolucionMedica: TFormPanel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    btnRealizarAccionAceptar: TButton;
    Button2: TButton;
    fraEstadoRealizarAccion: TfraCodigoDescripcion;
    mObsRealizarAccion: TMemo;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaEX_CUIL: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEX_CUIT: TStringField;
    sdqConsultaEP_DESCRIPCION: TStringField;
    sdqConsultaMA_DESCRIPCION: TStringField;
    sdqConsultaFECHAMOTIVO: TDateTimeField;
    sdqConsultaPA_OBSERVACIONDIN: TStringField;
    sdqConsultaPA_OBSERVACIONAMED: TStringField;
    sdqConsultaPA_USUALTA: TStringField;
    sdqConsultaPA_FECHAALTA: TDateTimeField;
    sdqConsultaPA_FECHABAJA: TDateTimeField;
    sdqConsultaMA_CODIGO: TStringField;
    sdqConsultaPA_ID: TFloatField;
    sdqConsultaEX_FECHAACCIDENTE: TDateTimeField;
    sdqConsultaEX_BAJAMEDICA: TDateTimeField;
    sdqConsultaEX_ALTAMEDICA: TDateTimeField;
    sdqConsultaTIPOEGRESO: TStringField;
    sdqConsultaFECHA_RESOLUCION: TDateTimeField;
    sdqConsultaDIAS_ENTRE_CARGA_Y_RESOLUCION: TFloatField;
    sdqConsultaTIPOSINIESTRO: TStringField;
    sdqConsultaSECTOR: TStringField;
    GroupBox6: TGroupBox;
    fraSector: TfraCodigoDescripcion;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbResolucionMedicaClick(Sender: TObject);
    procedure btnRealizarAccionAceptarClick(Sender: TObject);
    procedure fpResolucionMedicaShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditoriaILT: TfrmAuditoriaILT;

implementation

{$R *.dfm}

uses AnsiSql, VCLExtra;

procedure TfrmAuditoriaILT.FormCreate(Sender: TObject);
begin
  inherited;

  with framotivoauditoria do
  begin
    TableName := 'din.dma_motivoauditoria';
    FieldID := 'MA_ID';
    FieldCodigo := 'MA_CODIGO';
    FieldDesc := 'MA_DESCRIPCION';
    FieldBaja := 'MA_FECHABAJA';
  end;

  fraUsuario.UsuariosGenericos := false;

  with fraEstado do
  begin
    TableName := 'din.dep_estadopedidoauditoria';
    FieldID := 'EP_ID';
    FieldCodigo := 'EP_CODIGO';
    FieldDesc := 'EP_DESCRIPCION';
    FieldBaja := 'EP_FECHABAJA';
  end;

  with fraEstadoRealizarAccion do
  begin
    TableName := 'din.dep_estadopedidoauditoria';
    FieldID := 'EP_ID';
    FieldCodigo := 'EP_CODIGO';
    FieldDesc := 'EP_DESCRIPCION';
    FieldBaja := 'EP_FECHABAJA';
    ExtraCondition := ' AND ep_id <> 1 ';
  end;

  with fraSector do
  begin
    TableName := 'din.dsa_sectoresauditoriailt';
    FieldID := 'SA_ID';
    FieldCodigo := 'SA_CODIGO';
    FieldDesc := 'SA_DESCRIPCION';
    //FieldBaja := 'EP_FECHABAJA';
  end;

  FieldBaja := 'pa_fechabaja';

  fraEmpresaFiltro.ShowBajas := True;
  fraUsuario.Sector := 'PRESDIN';

  tbResolucionMedica.Left := 105;

  if Application.Title = 'Siniestros' then
  begin
    tbResolucionMedica.Visible := True;
    tbNuevo.Visible := False;
    tbModificar.Visible := False;
  end;

end;

procedure TfrmAuditoriaILT.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
    vclextra.LockControls([edSiniestro])
  else
    vclextra.LockControls([edSiniestro], False);

end;

procedure TfrmAuditoriaILT.fpResolucionMedicaShow(Sender: TObject);
begin
  fraEstadoRealizarAccion.Clear;
  mObsRealizarAccion.Clear;
end;

procedure TfrmAuditoriaILT.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  dcDesdeCarga.Clear;
  dcHastaCarga.Clear;
  dcDesdePedido.Clear;
  dcHastaPedido.Clear;
  dcDesdeResolucion.Clear;
  dcHastaResolucion.Clear;
  fraEmpresaFiltro.Clear;
  fraTrabajadorSiniestro.Clear;
  cbMotAudit.Clear;
  fraUsuario.Clear;
  fraEstado.Clear;
  fraSector.Clear;
  rgVerBajas.ItemIndex := 1;
end;

procedure TfrmAuditoriaILT.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('fecha_resolucion').AsString = '' then
    inherited
  else
    InfoHint(tbModificar, 'Ya no se puede modificar este registro');

end;

procedure TfrmAuditoriaILT.tbResolucionMedicaClick(Sender: TObject);
begin
  fpResolucionMedica.ShowModal;

end;

procedure TfrmAuditoriaILT.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_siniestro, ex_orden,' +
          '       ex_recaida, tj_nombre, ex_cuil, em_nombre, ex_cuit, ta_descripcion ' +
          '       tiposiniestro, ep_descripcion, ma_descripcion, pa_fechamodif fechamotivo, pa_observaciondin,' +
          '       pa_observacionamed, pa_usualta, pa_fechaalta, pa_fechabaja, ma_codigo, pa_id, ex_fechaaccidente,' +
          '       ex_bajamedica, ex_altamedica, te_descripcion tipoegreso, NVL(pa_fechabaja, pa_fecharesolucion) fecha_resolucion, ' +
          '       NVL(pa_fechabaja, pa_fecharesolucion) - pa_fechaalta dias_entre_carga_y_resolucion, ' +
          '       sa_descripcion sector ' +
          '  FROM din.dpa_pedidoauditoria, din.dma_motivoauditoria, din.dep_estadopedidoauditoria, art.sex_expedientes,' +
          '       comunes.ctj_trabajador, afi.aem_empresa, SIN.spe_partedeegreso, SIN.ste_tipoegreso, sin.sta_tipoaccidente, ' +
          '       din.dsa_sectoresauditoriailt ' +
          ' WHERE pa_idexpediente = ex_id' +
          '   AND pa_idmotivo = ma_id' +
          '   AND pa_idestado = ep_id' +
          '   AND ex_idtrabajador = tj_id' +
          '   AND ex_cuit = em_cuit' +
          '   AND sa_id = art.dinerarias.Get_SectorAuditILT(ex_id, ma_id) ' +
          '   AND ex_id = pe_idexpediente(+)' +
          '   AND pe_idtipodeegreso = te_id(+) ' +
          '   AND ex_tipo = ta_codigo(+) ';

  if not dcDesdeCarga.IsEmpty then
    ssql := ssql + ' AND TRUNC(pa_fechaalta) >= ' + dcDesdeCarga.SqlText;

  if not dcHastaCarga.IsEmpty then
    ssql := ssql + ' AND TRUNC(pa_fechaalta) <= ' + dcHastaCarga.SqlText;

  {if not dcDesdePedido.IsEmpty then
    ssql := ssql + ' AND TRUNC(le_faprobado) >= ' + dcDesdeAprobLiq.SqlText;

  if not dcHastaPedido.IsEmpty then
    ssql := ssql + ' AND TRUNC(le_faprobado) <= ' + dcHastaAprobLiq.SqlText;}

  if not dcDesdeResolucion.IsEmpty then
    ssql := ssql + ' AND NVL(pa_fechabaja, pa_fecharesolucion) >= ' + dcDesdeResolucion.SqlText;

  if not dcHastaResolucion.IsEmpty then
    ssql := ssql + ' AND NVL(pa_fechabaja, pa_fecharesolucion) <= ' + dcHastaResolucion.SqlText;

  if not fraEmpresaFiltro.IsEmpty then
    ssql := ssql + ' AND EM_ID = ' + IntToStr(fraEmpresaFiltro.ID);

  if not fraTrabajadorSiniestro.IsEmpty then
    ssql := ssql + ' AND TJ_ID = ' + IntToStr(fraTrabajadorSiniestro.IdTrabajador);

  if cbMotAudit.Text <> '' then
    ssql := ssql + ' AND MA_ID ' + cbMotAudit.InSql;

  if not fraUsuario.IsEmpty then
    ssql := ssql + ' AND PA_USUALTA = ' + QuotedStr(fraUsuario.edCodigo.Text);

  if not fraEstado.IsEmpty then
    ssql := ssql + ' AND EP_ID = ' + fraEstado.ID;

  if not fraSector.IsEmpty then
    ssql := ssql + ' AND SA_ID = ' + fraSector.ID;

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND pa_fechabaja IS NOT NULL ';
    1: ssql := ssql + ' AND pa_fechabaja IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

function TfrmAuditoriaILT.Validar : Boolean;
begin
  Verificar(edSiniestro.IsEmpty, edSiniestro, 'Debe completar este campo');
  Verificar(not ExisteSqlEx('select 1 from sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = :rec and nvl(ex_causafin, '' '') not in (''99'', ''95'', ''02'')', [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]), edSiniestro, 'Siniestro inexistente, cerrado o rechazado');
  Verificar((ModoABM = maAlta) and (ExisteSqlEx('SELECT 1 FROM din.dpa_pedidoauditoria' +
                                                ' WHERE pa_idexpediente = art.siniestro.get_idexpediente(:sin, :ord, :rec) ' +
                                                '   AND pa_idestado = 1 /*Pendiente*/ ' +
                                                '   AND pa_fechabaja IS NULL', [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida])),
                                    edSiniestro, 'Existe una auditoría pendiente para ese siniestro');
  Verificar(fraMotivoAuditoria.IsEmpty, fraMotivoAuditoria, 'Debe completar este campo');

  Validar := True;
end;

procedure TfrmAuditoriaILT.btnRealizarAccionAceptarClick(Sender: TObject);
begin
  Verificar(fraEstadoRealizarAccion.IsEmpty, fraEstadoRealizarAccion, 'Debe completar este campo');

  with Sql do
  begin
    Clear;
    TableName := 'DIN.DPA_PEDIDOAUDITORIA';
    SqlType := stUpdate;
    PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsInteger, False);
    Fields.Add('PA_USUMODIF', Sesion.UserID);
    Fields.Add('PA_FECHAMODIF', exDate);
    Fields.Add('PA_IDESTADO', fraEstadoRealizarAccion.ID);
    Fields.Add('PA_OBSERVACIONAMED', mObsRealizarAccion.Text);
    Fields.Add('PA_FECHARESOLUCION', exDate);

    inherited DoABM;
  end;

  fpResolucionMedica.ModalResult := mrOk;
  tbRefrescarClick(nil);
end;

procedure TfrmAuditoriaILT.ClearControls;
begin
  edSiniestro.Clear;
  fraMotivoAuditoria.Clear;
  mObservaciones.Clear;
end;


function TfrmAuditoriaILT.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'DIN.DPA_PEDIDOAUDITORIA';
    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        PrimaryKey.Add('PA_ID', 'DIN.SEQ_DPA_ID.NEXTVAL', False);
        Fields.Add('PA_USUALTA', Sesion.UserID);
        Fields.Add('PA_FECHAALTA', exDate);
        Fields.Add('PA_IDEXPEDIENTE', ValorSqlIntegerEx('select art.siniestro.get_idexpediente(:sin, :ord, :rec) from dual', [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]));
        Fields.Add('PA_IDMOTIVO', fraMotivoAuditoria.ID);
        Fields.Add('PA_IDESTADO', 1);
        Fields.Add('PA_OBSERVACIONDIN', mObservaciones.Text);
      end;
      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsInteger, False);
        Fields.Add('PA_USUMODIF', Sesion.UserID);
        Fields.Add('PA_FECHAMODIF', exDate);
        Fields.Add('PA_IDMOTIVO', fraMotivoAuditoria.ID);
        Fields.Add('PA_OBSERVACIONDIN', mObservaciones.Text);
        Fields.Add('PA_USUBAJA', '');
        Fields.Add('PA_FECHABAJA', '');
      end;
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('PA_ID', sdqConsulta.FieldByName('PA_ID').AsInteger, False);
        Fields.Add('PA_USUBAJA', Sesion.UserID);
        Fields.Add('PA_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;

procedure TfrmAuditoriaILT.LoadControls;
begin
  edSiniestro.SetValues(sdqConsulta.FieldByName('ex_siniestro').AsInteger, sdqConsulta.FieldByName('ex_orden').AsInteger,
                        sdqConsulta.FieldByName('ex_recaida').AsInteger);
  fraMotivoAuditoria.Value := sdqConsulta.FieldByName('ma_codigo').AsInteger;
  mObservaciones.Lines.Text := sdqConsulta.FieldByName('pa_observaciondin').AsString;
end;

end.
