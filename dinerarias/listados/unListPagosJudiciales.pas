unit unListPagosJudiciales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, SinEdit, StdCtrls, Mask, ToolEdit, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, AnsiSql,
  Buttons, FormPanel, unFraCodigoDescripcion, unfraCtbTablas, PatternEdit,
  VCLExtra, DBCtrls, unSiniestros, General, unDmPrincipal, unfraDelegacion,
  CustomDlgs, unFraDomicilio, IntEdit, unSesion, ShellAPI, unfraFirmantes,
  RxToolEdit, RxPlacemnt;

type
  TfrmListPagosJudiciales = class(TfrmCustomConsulta)
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbFechaDelCaso: TGroupBox;
    Label1: TLabel;
    dcCasoDesde: TDateComboBox;
    dcCasoHasta: TDateComboBox;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbConDecision: TGroupBox;
    rbConDecision: TRadioButton;
    rbSinDecision: TRadioButton;
    rbDecisionTodos: TRadioButton;
    GroupBox1: TGroupBox;
    chkVencidos: TCheckBox;
    dsIdJuicios: TDataSource;
    sdqIdJuicios: TSDQuery;
    ScrollBox5: TScrollBox;
    fpModificar: TFormPanel;
    Label80: TLabel;
    Label75: TLabel;
    Label81: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    btnAceptarModif: TBitBtn;
    btnCancelarModif: TBitBtn;
    gbPagoJudicial: TGroupBox;
    rbSiCorresponde: TRadioButton;
    rbNoCorresponde: TRadioButton;
    fraMetodoPago: TfraCtbTablas;
    fraBanco: TfraCodigoDescripcion;
    edEnvioFondos: TEdit;
    btnEnvioFondos: TBitBtn;
    edChequeNombre: TEdit;
    btnRecibosA: TBitBtn;
    edRecibosA: TMemo;
    edObservaciones: TMemo;
    btnCBU: TBitBtn;
    gbJuicios: TGroupBox;
    cmbIdJuicios: TArtComboBox;
    fpEnvioFondos: TFormPanel;
    gbEnvioFondos: TGroupBox;
    Label83: TLabel;
    rbBancoFondos: TRadioButton;
    rbDelegacionFondos: TRadioButton;
    rbCentralFondos: TRadioButton;
    fraDelegacionFondos: TfraDelegacion;
    fraBancoFondos: TfraCodigoDescripcion;
    fraSucursalFondos: TfraCodigoDescripcion;
    rbNingunoFondos: TRadioButton;
    btnCancelarFondos: TBitBtn;
    btnAceptarFondos: TBitBtn;
    fpDomicilioRecibos: TFormPanel;
    btnCancelarDomRecibo: TBitBtn;
    btnAceptarDomRecibo: TBitBtn;
    pnlDomicilio: TPanel;
    fraDomicilioRecibos: TfraDomicilio;
    rbDomicilio_Recibos: TRadioButton;                                            
    Panel1: TPanel;
    MemoOtroRecibos: TMemo;
    rbOtro_Recibos: TRadioButton;
    fpCBU: TFormPanel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edCBU1: TIntEdit;
    edJuzgado: TEdit;
    edSecretaria: TEdit;
    edExpediente: TEdit;
    edFuero: TEdit;
    edCaratula: TEdit;
    edCBU2: TPatternEdit;
    btnAceptarCBU: TBitBtn;
    btnCancelarCBU: TBitBtn;
    Bevel2: TBevel;
    ToolBar1: TToolBar;
    tbLimpiarCBU: TToolButton;
    fpMotivoBaja: TFormPanel;
    Label3: TLabel;
    btnAceptarMotBaja: TBitBtn;
    btnCancelarMotBaja: TBitBtn;
    fraMotivoBaja: TfraCodigoDescripcion;
    ToolButton2: TToolButton;
    rbSinDecisionModif: TRadioButton;
    tbCartaDocTrab: TToolButton;
    tbSalir2: TToolButton;
    GroupBox2: TGroupBox;
    rbSiBajas: TRadioButton;
    rbNoBajas: TRadioButton;
    rbTodosBajas: TRadioButton;
    Label6: TLabel;
    edArchivoAsociado: TEdit;
    tbSeleccionArchivoAsociar: TSpeedButton;
    Bevel3: TBevel;
    OpenDialog_AsocArch: TOpenDialog;
    ToolBar2: TToolBar;
    tbLimpiarArchivo: TToolButton;
    tbSalir3: TToolButton;
    ToolButton1: TToolButton;
    tbVerArchivoAsociadoCBU: TToolButton;
    GroupBox3: TGroupBox;
    edJuicio: TIntEdit;
    tbAprobar: TToolButton;
    tbSalir4: TToolButton;
    GroupBox4: TGroupBox;
    fraEstado: TfraCodigoDescripcion;
    GroupBox5: TGroupBox;
    rbSiLiquid: TRadioButton;
    rbNoLiquid: TRadioButton;
    rbTodosLiquid: TRadioButton;
    fpFirmanteCartaDoc: TFormPanel;
    Label2: TLabel;
    btnAceptarFirmante: TBitBtn;
    BitBtn2: TBitBtn;
    fraFirmantes: TfraFirmantes;
    fraDelegacionPJ: TfraDelegacion;
    lbDelegacion: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbSiCorrespondeClick(Sender: TObject);
    procedure rbNoCorrespondeClick(Sender: TObject);
    procedure fpModificarBeforeShow(Sender: TObject);
    procedure fraBancoOnChange(Sender: TObject);
    procedure fraMetodoPagoOnChange(Sender: TObject);
    procedure btnEnvioFondosClick(Sender: TObject);
    procedure fraBancoFondosOnChange(Sender: TObject);
    procedure btnAceptarFondosClick(Sender: TObject);
    procedure rbNingunoFondosClick(Sender: TObject);
    procedure rbBancoFondosClick(Sender: TObject);
    procedure rbDelegacionFondosClick(Sender: TObject);
    procedure rbCentralFondosClick(Sender: TObject);
    procedure fpEnvioFondosBeforeShow(Sender: TObject);
    procedure btnRecibosAClick(Sender: TObject);
    procedure btnAceptarDomReciboClick(Sender: TObject);
    procedure rbDomicilio_RecibosClick(Sender: TObject);
    procedure rbOtro_RecibosClick(Sender: TObject);
    procedure btnCBUClick(Sender: TObject);
    procedure btnAceptarCBUClick(Sender: TObject);
    procedure btnLimpiarCBUClick(Sender: TObject);
    procedure fpCBUBeforeShow(Sender: TObject);
    procedure btnAceptarModifClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarMotBajaClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpMotivoBajaBeforeShow(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure rbSinDecisionModifClick(Sender: TObject);
    procedure tbSeleccionArchivoAsociarClick(Sender: TObject);
    procedure tbLimpiarArchivoClick(Sender: TObject);
    procedure tbSalir3Click(Sender: TObject);
    procedure tbVerArchivoAsociadoCBUClick(Sender: TObject);
    procedure tbSalir4Click(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure tbCartaDocTrabClick(Sender: TObject);
    procedure fpFirmanteCartaDocBeforeShow(Sender: TObject);
    procedure btnAceptarFirmanteClick(Sender: TObject);
    procedure fpDomicilioRecibosBeforeShow(Sender: TObject);
  private
    { Private declarations }

    procedure Do_HabilitarCampos;
    procedure SetChequeANombre;
    procedure Do_LlenarComboJuicios(iSiniestro, iOrden: integer);
    procedure SetEnvioFondos;
    procedure DoHabilitarFondos;
    procedure Do_GuardarPagosJudiciales;
    procedure Do_GuardarDatosCBU;
    procedure Do_LimpiarFpModificar;
    procedure Do_CargarDatosfpModificar(iIdExpediente, iIdEventoInca: integer);
    procedure Do_CompletarCBUEnEnvioDeFondos;
    procedure Do_ObtenerDatosEnvioFondos(var sEnvioFondos, sTipoEnvioFondos: string; var iIdEnvioFondos: integer);
    function Do_CargarCBUJudiciales: boolean;
    procedure Do_CargarCBUdesdeLegales;
    function ExisteCBU_enTabla: boolean;
    procedure Do_GuardarEnvioFondos;
    procedure Do_GuardarDomicilioRecibos;
    procedure Do_GuardarArchivoCBUEnServidor;
    function Get_ActivarDevolverALegales:boolean;
    procedure Do_CargarPantallaCBU;
  public
    { Public declarations }
  end;

const DIR_ARCHIVOCBU = '\\ntintraweb\Storage_Data\Legales\CBU Pagos de Dinerarias\';  // TK 28452

var
  frmListPagosJudiciales: TfrmListPagosJudiciales;

implementation

uses unComunes;

{$R *.dfm}

procedure TfrmListPagosJudiciales.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin

  Verificar((edSiniestro.IsEmpty and dcCasoDesde.IsEmpty and dcCasoHasta.IsEmpty and fraEstado.IsEmpty and
             edJuicio.IsEmpty and fraEmpresa.IsEmpty), gbFechaDelCaso, 'Debe completar alguno de estos filtros para refrescar.' );

  sSql := ' SELECT art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida, ''D'') juicio, ' +
                 ' art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida, ''D'', ''E'') estudiojuridico, ' +
                 ' art.SIN.get_listamediacionesexp(ex_id) nromediacion, ' +
                 ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, art.utiles.armar_cuit(ex_cuit) cuit, ' +
                 ' em_nombre empresa, art.utiles.armar_cuit(ex_cuil) cuil, tj_nombre trabajador, ' +
                 ' art.liq.get_importeliquidadoilp(ex_siniestro, ex_orden, ex_recaida, ''S'') importeilp, ev_porcincapacidad porcilp, ' +
                 ' ev_fecharecepcion frecepdictamen, ev_fechaalta fcargadictamen, ' +
                 ' DECODE(pj_decisionlegales, NULL, ''Sin decisión'', ''Con decisión'') decisionlegales, cobro.tb_descripcion formapago, ' +
                 ' ba_nombre banco, pj_enviofondos enviofondos, pj_recibos recibosa, pj_chequenombre chequeanombre, ' +
                 ' pj_observaciones observaciones, mj_descripcion motivobaja, ' +
                 ' TO_DATE(art.amebpba.calcdiashabiles(pj_fechaalta, 7), ''dd/mm/yyyy'') vencimientolegales, ' +
                 ' DECODE(cj_cbu1, NULL, NULL, cj_cbu1 || ''-'' || cj_cbu2) cbu, ep_descripcion estado, ' +
                 ' pj_usuaprobacion, pj_faprobacion, ' +
                 ' pj_fdevolegales, pj_usudevolegales, pj_fvencimiento fvencidoautomatico, ce_fechacheque, ce_ordenpago, ce_numero, ' +
                 ' ce_monto, ce_debitado, sitch.tb_descripcion ubicacioncheque, pj_fechabaja, pj_decisionlegales, pj_estado, ' +
                 ' ep_bloquealegales, ep_bloqueadinerarias, pj_id, ep_codigo, pj_ideventoinca, ex_id, ex_siniestro, ex_orden, ex_recaida, ' +
                 ' pj_numerojuicio JUICIO_PAGO, cj_path_archivo, pj_tipoenviofondos, pj_idenviofondos, ex_fechaaccidente, ex_gravedad, ' +
                 ' pj_delegacion, el_nombre delegacion ' +

            ' FROM SIN.spj_pagosjudiciales, SIN.smj_motivosbajapagosjudiciales, art.sex_expedientes, art.sev_eventosdetramite, ' +
                 ' ctj_trabajador, aem_empresa, art.ctb_tablas cobro, zba_banco, SIN.scj_cbujudiciales, SIN.sep_estadospagosjudiciales, ' +
                 ' art.sle_liquiempsin, rce_chequeemitido, art.ctb_tablas sitch, art.del_delegacion ' +
           ' WHERE pj_idmotivobaja = mj_id(+) ' +
             ' AND pj_idexpediente = ex_id ' +
             ' AND pj_ideventoinca = ev_idevento ' +
             ' AND ex_idtrabajador = tj_id ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND pj_estado = ep_codigo ' +
             ' AND pj_id = le_idpagojudicial(+) ' +
             ' AND le_idchequeemitido = ce_id(+) ' +
             ' AND ce_situacion = sitch.tb_codigo(+) ' +
             ' AND sitch.tb_clave(+) = ''SITCH'' ' +
             ' AND cobro.tb_clave(+) = ''COBRO'' ' +
             ' AND pj_metodopago = cobro.tb_codigo(+) ' +
             ' AND pj_idbanco = ba_id(+) ' +
             ' AND pj_idexpediente = cj_idexpediente(+) ' +
             ' AND pj_numerojuicio = cj_numerojuicio(+) ' +
             ' AND el_id(+) = pj_delegacion ' +
             ' AND cj_fechabaja(+) IS NULL ';


  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida);

  if not(dcCasoDesde.IsEmpty) then
    sSql := sSql + ' AND pj_fechaalta >= ' + SqlDate(dcCasoDesde.Date);

  if not(dcCasoHasta.IsEmpty) then
    sSql := sSql + ' AND pj_fechaalta <= ' + SqlDate(dcCasoHasta.Date);

  if rbConDecision.Checked then
    sSql := sSql + ' AND pj_decisionlegales IS NOT NULL '
  else if rbSinDecision.Checked then
    sSql := sSql + ' AND pj_decisionlegales IS NULL ';

  if chkVencidos.Checked then
    sSql := sSql + ' AND pj_estado = ''V'' ';

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if rbSiBajas.Checked then
    sSql := sSql + ' AND pj_fechabaja IS NOT NULL '
  else if rbNoBajas.Checked then
    sSql := sSql + ' AND pj_fechabaja IS NULL ';

  if not(edJuicio.IsEmpty) then
    sSql := sSql + ' AND pj_numerojuicio = ' + SqlValue(edJuicio.Text);

  if not fraEstado.IsEmpty then
    sSql := sSql + ' AND pj_estado = ' + SqlValue(fraEstado.Codigo);

  if rbSiLiquid.Checked then
    sSql := sSql + ' AND pj_estado = ''L'' '
  else if rbNoLiquid.Checked then
    sSql := sSql + ' AND pj_estado <> ''L'' ';


  sdqConsulta.SQL.Text  := sSql + SortDialog.OrderBy;
  inherited;
  tbPropiedades.Enabled := Get_ActivarDevolverALegales;
end;

procedure TfrmListPagosJudiciales.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSiniestro.Clear;
  dcCasoDesde.Clear;
  dcCasoHasta.Clear;
  rbDecisionTodos.Checked := True;
  chkVencidos.Checked     := False;
  fraEmpresa.Clear;
  tbPropiedades.Enabled   := False;
  rbNoBajas.Checked       := True;
  rbNoLiquid.Checked      := True;
  fraEstado.Clear;
end;

procedure TfrmListPagosJudiciales.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('PJ_FECHABAJA').IsNull, tbModificar, 'No se puede modificar el registro ya que se encuentra dado de baja.');
  Verificar((sdqConsulta.FieldByName('EP_BLOQUEALEGALES').AsString = 'S'), tbModificar, 'No se puede modificar el registro, debido a que su estado no lo permite.');  // en los estados Aprobado, Vencido, Liquidado y Baja, el EP_BLOQUEALEGALES es = 'S'

  BeginTrans;
  Try
    if fpModificar.ShowModal = mrOk then
    begin
      Do_GuardarPagosJudiciales;

      CommitTrans;
      tbRefrescarClick(Self);
    end
    else
       Rollback;
  except
    on E:Exception do
    begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
    end;
  end;

end;

procedure TfrmListPagosJudiciales.FormCreate(Sender: TObject);
begin
  inherited;
  fraMetodoPago.Clave          := 'COBRO';
  fraMetodoPago.ShowBajas      := False;
 // fraMetodoPago.ExtraCondition := ' AND tb_codigo in (''CH'', ''DA'', ''PE'') ';
  fraMetodoPago.ExtraCondition := ' AND tb_codigo in (''CH'', ''PE'') ';       // Se saco la opción "DA" (Débito Automático) por nuevas instrucciones de Gastón Lopez. (según mail 29/08/2013).

  with fraBanco do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'') OR (ba_pagoelectronico = ''S'') )  ';
    OnChange       := fraBancoOnChange;
  end;

  with fraBancoFondos do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRE';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraFields    := ', BA_TIENESUCURSALES ';
    if not(Seguridad.Claves.IsActive('VerTodosBancos')) then
      ExtraCondition := 'AND BA_DATANET IN (''S'', ''s'')';
    OnChange       := fraBancoFondosOnChange;
  end;

  with fraSucursalFondos do
  begin
    TableName      := 'ZSB_SUCURSALBANCO';
    FieldID        := 'SB_ID';
    FieldCodigo    := 'SB_CODIGO';
    FieldDesc      := 'SB_NOMBRE';
    FieldBaja      := 'SB_FECHABAJA';
    ExtraCondition := ' AND 1 = 2 ';
  end;

  with fraMotivoBaja do
  begin
    TableName      := 'SIN.SMJ_MOTIVOSBAJAPAGOSJUDICIALES';
    FieldID        := 'MJ_ID';
    FieldDesc      := 'MJ_DESCRIPCION';
    FieldCodigo    := 'MJ_CODIGO';
    FieldBaja      := 'MJ_FECHABAJA';
  end;

  with fraEstado do
  begin
    TableName      := 'SIN.SEP_ESTADOSPAGOSJUDICIALES';
    FieldID        := 'EP_ID';
    FieldDesc      := 'EP_DESCRIPCION';
    FieldCodigo    := 'EP_CODIGO';
    FieldBaja      := 'EP_FECHABAJA';
  end;

 // fraFirmantes.Area   := AREA_MED;            // ver en que area y modulo son los firmantes!!!
 //  fraFirmantes.Modulo := MODULO_ABANDONO;

  {$IFDEF DINERARIAS}
     tbEliminar.Visible     := False;
     tbModificar.Visible    := False;
     tbPropiedades.Visible  := True;
     tbPropiedades.Enabled  := Seguridad.Activar(tbPropiedades);  // boton de Devolver a Legales
     tbCartaDocTrab.Visible := True;
     tbCartaDocTrab.Enabled := Seguridad.Activar(tbCartaDocTrab);
     tbAprobar.Visible      := False;
  {$ELSE}
     tbEliminar.Visible     := True;
     tbEliminar.Enabled     := Seguridad.Activar(tbEliminar);
     tbModificar.Visible    := True;
     tbModificar.Enabled    := Seguridad.Activar(tbModificar);
     tbPropiedades.Visible  := False;  // boton de Devolver a Legales
     tbCartaDocTrab.Visible := False;
     tbAprobar.Visible      := True;
     tbAprobar.Enabled      := Seguridad.Activar(tbAprobar);
  {$ENDIF}

  fraDelegacionFondos.OnLine := False;
  fraMetodoPago.OnChange     := fraMetodoPagoOnChange;
  rbNoBajas.Checked          := True;
  rbNoLiquid.Checked         := True;
end;


procedure TfrmListPagosJudiciales.Do_LlenarComboJuicios(iSiniestro, iOrden: integer);
begin
  cmbIdJuicios.Clear;
  sdqIdJuicios.Close;
  sdqIdJuicios.SQL.Text := 'SELECT jt_numerocarpeta JUICIO ' +
                            ' FROM legales.lsj_siniestrosjuicioentramite lsj, legales.ljt_juicioentramite ljt, ' +
                                 ' legales.lod_origendemanda lod, legales.lbo_abogado ' +
                           ' WHERE lsj.sj_idorigendemanda = lod.od_id ' +
                             ' AND lod.od_idjuicioentramite = ljt.jt_id ' +
                             ' AND bo_id = jt_idabogado ' +
                             ' AND lsj.sj_siniestro = ' + SqlInt(iSiniestro) +
                             ' AND lsj.sj_orden =  ' + SqlInt(iOrden) +
                             ' AND lsj.sj_fechabaja IS NULL ' +
                             ' AND jt_idestado <> 3 ';
  sdqIdJuicios.Open;
  sdqIdJuicios.First;
  cmbIdJuicios.Text    := sdqIdJuicios.FieldByName('JUICIO').AsString;
  cmbIdJuicios.Enabled := (sdqIdJuicios.RecordCount > 1);
end;

procedure TfrmListPagosJudiciales.rbSiCorrespondeClick(Sender: TObject);
begin
  Do_HabilitarCampos;
end;

procedure TfrmListPagosJudiciales.rbNoCorrespondeClick(Sender: TObject);
begin
  Do_HabilitarCampos;
end;

procedure TfrmListPagosJudiciales.rbSinDecisionModifClick(Sender: TObject);
begin
  Do_HabilitarCampos;
end;

procedure TfrmListPagosJudiciales.Do_HabilitarCampos;
begin
  LockControls([fraMetodoPago, fraBanco, edChequeNombre, edObservaciones, cmbIdJuicios, fraDelegacionPJ], (rbNoCorresponde.Checked or rbSinDecisionModif.Checked));
  LockControl(fraBanco, (fraMetodoPago.Codigo <> 'CH') or (rbNoCorresponde.Checked or rbSinDecisionModif.Checked));

  if rbSiCorresponde.Checked then
  begin
    btnEnvioFondos.Enabled := true;
    btnRecibosA.Enabled    := true;
    btnCBU.Enabled         := ((fraMetodoPago.Codigo <> '') and (fraMetodoPago.Codigo <> 'CH'));
  end
  else if (rbNoCorresponde.Checked or rbSinDecisionModif.Checked) then
  begin
    btnEnvioFondos.Enabled := false;
    btnRecibosA.Enabled    := false;
    btnCBU.Enabled         := false;
  end;
end;

procedure TfrmListPagosJudiciales.fpModificarBeforeShow(Sender: TObject);
begin
  // limpio la pantalla y luego la cargo
 // iCodigoFondos := 0;
  Do_LimpiarFpModificar;
  rbSinDecisionModif.Checked := true;
  Do_HabilitarCampos;

  Do_CargarDatosfpModificar(sdqConsulta.FieldByName('EX_ID').AsInteger, sdqConsulta.FieldByName('PJ_IDEVENTOINCA').AsInteger);
end;

procedure TfrmListPagosJudiciales.fraBancoOnChange(Sender: TObject);
begin
  SetChequeANombre;
end;

procedure TfrmListPagosJudiciales.fraMetodoPagoOnChange(Sender: TObject);
var
  bHabil :Boolean;
begin
  btnCBU.Enabled         := (fraMetodoPago.Codigo <> 'CH');
  btnEnvioFondos.Enabled := (fraMetodoPago.Codigo = 'CH');

  if not btnEnvioFondos.Enabled then
    edEnvioFondos.Clear;

  bHabil := AreIn(fraMetodoPago.Codigo, ['GI', 'TR', 'DC', 'CH'{, 'DA'}]);  // Agrego el 'DA' Por ticket 52355 (lo dejo comentado)
  LockControl(fraBanco, not bHabil);
  fraBanco.Clear;

{  if (fraMetodoPago.Codigo = 'DA') then   // por TK 52355     // lo dejo comentado por si algún día se habilita nuevamente la opcion DA en dicho combo...
    fraBanco.Value := BANCO_PATAGONIA;     }

  SetEnvioFondos;
  SetChequeANombre;
end;

procedure TfrmListPagosJudiciales.SetChequeANombre;
var sNombre: string;
begin
  if (fraMetodoPago.Codigo <> '') and (fraBanco.ID <> '') and (ValorSql('SELECT art.dinerarias.is_chequealtrabajador(' + SqlValue(fraMetodoPago.Codigo) + ',' + SqlValue(fraBanco.ID) + ') from dual ') = 'S') then
    sNombre := Get_NombreTrabajador(sdqConsulta.FieldByName('ex_siniestro').AsInteger, sdqConsulta.FieldByName('ex_orden').AsInteger, sdqConsulta.FieldByName('ex_recaida').AsInteger)
  else if AreIn(fraMetodoPago.Codigo, ['DC', 'TR']) then
    sNombre := IIF(fraBanco.IsSelected, fraBanco.Descripcion, '');

  edChequeNombre.Text  := sNombre;
//  oILP.ANombreDe       := sNombre;
//  oILP.IdBanco         := fraBanco.Value;
end;

procedure TfrmListPagosJudiciales.SetEnvioFondos;
//var sEnvio, sNombre :String;
begin
 { sNombreTrab      := Get_NombreTrabajador(sdqConsulta.FieldByName('ex_siniestro').AsInteger, sdqConsulta.FieldByName('ex_orden').AsInteger, sdqConsulta.FieldByName('ex_recaida').AsInteger);

  btnEnvio.Enabled := AreIn(fraMetodoPago.Codigo, ['TR', 'EF', 'CH', 'DC']);
  sEnvio           := IIF((fraMetodoPago.Codigo = 'DC'), GetCuenta('TA', sNombreTrab, 0, '', StrToInt(oILP.CodigoConcepto)), '');

  edEnvio.Text     := sEnvio;      }

 // AQUI IRA LA FUNCION QUE VA A HACER CRISTIAN... (VER APUNTE)

end;

procedure TfrmListPagosJudiciales.btnEnvioFondosClick(Sender: TObject);
begin
  Verificar(fraMetodoPago.Codigo = '', fraMetodoPago, 'Primero debe seleccionar la forma de pago.');
  if (fpEnvioFondos.ShowModal = mrOk) then
  begin
    if rbBancoFondos.Checked then
      edEnvioFondos.text := fraBancoFondos.Descripcion +
                            IIF(not(fraSucursalFondos.IsEmpty), ' - SUCURSAL ' +
                            fraSucursalFondos.Descripcion + ' (' + fraSucursalFondos.Codigo + ')', '')
    else if rbDelegacionFondos.Checked then
    begin
      edEnvioFondos.Text := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
      edRecibosA.Text    := 'DELEGACION ' + fraDelegacionFondos.Descripcion;
    end
    else if rbCentralFondos.Checked then
    begin
      edEnvioFondos.Text := 'CASA CENTRAL';
      edRecibosA.Text    := 'CASA CENTRAL';
    end
    else begin
      edEnvioFondos.Text := '';
      edRecibosA.Text    := '';
    end;

    Do_GuardarEnvioFondos;

  end;
end;

procedure TfrmListPagosJudiciales.Do_GuardarEnvioFondos;
var sEnvioFondos, sTipoEnvioFondos, sSql: string;
    iIdEnvioFondos: integer;
begin
   Do_ObtenerDatosEnvioFondos(sEnvioFondos, sTipoEnvioFondos, iIdEnvioFondos);

  sSql := ' UPDATE SIN.spj_pagosjudiciales ' +
             ' SET pj_enviofondos = '     + SqlValue(sEnvioFondos)     + ', ' +
                 ' pj_tipoenviofondos = ' + SqlValue(sTipoEnvioFondos) + ', ' +
                 ' pj_idenviofondos = '   + SqlInt(iIdEnvioFondos) +
           ' WHERE pj_idexpediente = '    + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) +
             ' and pj_ideventoinca = '    + SqlInt(sdqConsulta.FieldByName('PJ_IDEVENTOINCA').AsInteger);

  EjecutarSqlST(sSql);

end;

procedure TfrmListPagosJudiciales.fraBancoFondosOnChange(Sender: TObject);
begin
  fraSucursalFondos.Clear;
  LockControl(fraSucursalFondos, fraBancoFondos.IsEmpty or
                                (fraBancoFondos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'N'));
  if fraBancoFondos.IsSelected then
    fraSucursalFondos.ExtraCondition := ' AND sb_idbanco = ' + SqlInt(fraBancoFondos.Value)
  else
    fraSucursalFondos.ExtraCondition := ' AND 1 = 2 ';
end;

procedure TfrmListPagosJudiciales.btnAceptarFondosClick(Sender: TObject);
begin
  Verificar((AreIn(fraMetodoPago.Codigo, ['EF', 'CH']) and rbBancoFondos.Checked),
            gbEnvioFondos, 'La forma de pago seleccionada (' + fraMetodoPago.Codigo + ') no corresponde con ésta opción.');
  Verificar(not(fraBancoFondos.IsEmpty) and not(fraBanco.IsEmpty) and
            (fraBancoFondos.Value <> fraBanco.Value), fraBancoFondos,
            'El banco seleccionado no corresponde con el seleccionado anteriormente.');

  Verificar(rbBancoFondos.Checked and fraBancoFondos.IsEmpty, fraBancoFondos,
            'Debe seleccionar el banco.');
  Verificar(rbBancoFondos.Checked and fraSucursalFondos.IsEmpty and not(fraSucursalFondos.Locked),
            fraSucursalFondos, 'Debe seleccionar la sucursal.');
  Verificar(rbDelegacionFondos.Checked and fraDelegacionFondos.IsEmpty, fraDelegacionFondos,
            'Debe seleccionar la delegación.');

  fpEnvioFondos.ModalResult := mrOk;
end;

procedure TfrmListPagosJudiciales.rbNingunoFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmListPagosJudiciales.rbBancoFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmListPagosJudiciales.rbDelegacionFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmListPagosJudiciales.rbCentralFondosClick(Sender: TObject);
begin
  DoHabilitarFondos;
end;

procedure TfrmListPagosJudiciales.DoHabilitarFondos;
begin
  LockControl(fraBancoFondos, rbDelegacionFondos.Checked or rbCentralFondos.Checked or rbNingunoFondos.Checked);
  LockControl(fraSucursalFondos, True);
  LockControl(fraDelegacionFondos, rbBancoFondos.Checked or rbCentralFondos.Checked or rbNingunoFondos.Checked);
  fraBancoFondos.Clear;
  fraSucursalFondos.Clear;
  fraDelegacionFondos.Clear;
end;

procedure TfrmListPagosJudiciales.fpEnvioFondosBeforeShow(Sender: TObject);
var sTipoFondos: string;
    iCodigoFondos: integer;
begin
  rbNingunoFondos.Checked := True;
  sTipoFondos   := sdqConsulta.FieldByName('pj_tipoenviofondos').AsString;
  iCodigoFondos := sdqConsulta.FieldByName('pj_idenviofondos').AsInteger;

  if (sTipoFondos = 'D') then
  begin
    rbDelegacionFondos.Checked  := True;
    fraDelegacionFondos.Value   := iCodigoFondos;
  end
  else if (sTipoFondos = 'C') then
    rbCentralFondos.Checked := True
  else if (sTipoFondos <> '') then
  begin
    rbBancoFondos.Checked       := True;
    fraBancoFondos.Codigo       := sTipoFondos;
    fraBancoFondosOnChange(Nil); //no se porqué no hace el OnChange solo...
    if (iCodigoFondos > 0) then
      fraSucursalFondos.Value   := iCodigoFondos;
  end;

end;

procedure TfrmListPagosJudiciales.btnRecibosAClick(Sender: TObject);
var sRecibos: string;
begin
  if fpDomicilioRecibos.ShowModal = mrOk then
  begin
    if rbDomicilio_Recibos.Checked then
      sRecibos := fraDomicilioRecibos.Calle + ' ' +
                  IIF(fraDomicilioRecibos.Numero <> '', fraDomicilioRecibos.Numero, '') +
                  IIF(fraDomicilioRecibos.Piso <> '', ' Piso ' + fraDomicilioRecibos.Piso, '') +
                  IIF(fraDomicilioRecibos.Departamento <> '', ' Dpto.' + fraDomicilioRecibos.Departamento, '') +
                  IIF(fraDomicilioRecibos.Localidad <> '', ' Loc.' + fraDomicilioRecibos.Localidad, '')
    else
      sRecibos := MemoOtroRecibos.Lines.Text;

    edRecibosA.Lines.Text := sRecibos;

    Do_GuardarDomicilioRecibos;
  end;
end;

procedure TfrmListPagosJudiciales.Do_GuardarDomicilioRecibos;
var sSql: string;
begin
  sSql := ' UPDATE SIN.spj_pagosjudiciales ' +
             ' SET pj_tiporecibos = '     + IIF(rbDomicilio_Recibos.Checked, '''D''', '''O''') + ', ' +
                 ' pj_rotro = '           + SqlValue(MemoOtroRecibos.Lines.Text)       + ', ' +
                 ' pj_rcalle = '          + SqlValue(fraDomicilioRecibos.Calle)        + ', ' +
                 ' pj_rlocalidad = '      + SqlValue(fraDomicilioRecibos.Localidad)    + ', ' +
                 ' pj_rprovincia = '''    + IntToStr(fraDomicilioRecibos.Prov)         + ''', ' +
                 ' pj_rnumero = '         + SqlValue(fraDomicilioRecibos.Numero)       + ', ' +
                 ' pj_rpiso = '           + SqlValue(fraDomicilioRecibos.Piso)         + ', ' +
                 ' pj_rcpostal = '        + SqlValue(fraDomicilioRecibos.CodigoPostal) + ', ' +
                 ' pj_rdepartamento = '   + SqlValue(fraDomicilioRecibos.Departamento) +
           ' WHERE pj_idexpediente = '    + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) +
             ' and pj_ideventoinca = '    + SqlInt(sdqConsulta.FieldByName('PJ_IDEVENTOINCA').AsInteger);

  EjecutarSqlST(sSql);
end;

procedure TfrmListPagosJudiciales.btnAceptarDomReciboClick(Sender: TObject);
begin
  Verificar(rbDomicilio_Recibos.Checked and
           ((fraDomicilioRecibos.IsEmpty) or
            (fraDomicilioRecibos.Calle = '') or
            (fraDomicilioRecibos.CodigoPostal = '')),
            fraDomicilioRecibos, 'Debe completar el Domicilio para el envío de Recibos.');
  fpDomicilioRecibos.ModalResult := mrOk
end;

procedure TfrmListPagosJudiciales.rbDomicilio_RecibosClick(Sender: TObject);
begin
  LockControl(fraDomicilioRecibos, False);
  LockControl(MemoOtroRecibos, True);
  MemoOtroRecibos.Clear;
end;

procedure TfrmListPagosJudiciales.rbOtro_RecibosClick(Sender: TObject);
begin
  LockControl(MemoOtroRecibos, False);
  LockControl(fraDomicilioRecibos, True);
  fraDomicilioRecibos.Clear;
end;

procedure TfrmListPagosJudiciales.btnCBUClick(Sender: TObject);
begin
  if (fpCBU.ShowModal = mrOk) then
    Do_GuardarDatosCBU;
end;

procedure TfrmListPagosJudiciales.btnAceptarCBUClick(Sender: TObject);
begin
//  Verificar(edNroOficio.Text = '',edNroOficio, 'Debe completarse el Nro. de Oficio.');      // se saco este campo (Nro Oficio) por nuevas instrucciones de Gastón Lopez. (según mail 29/08/2013).
  Verificar(edJuzgado.Text = '',edJuzgado, 'Debe completarse el Juzgado.');
  Verificar(edSecretaria.Text = '',edSecretaria, 'Debe completarse la Secretaria.');
  Verificar(edExpediente.Text = '',edExpediente, 'Debe completarse el Expediente.');
  Verificar(edFuero.Text = '',edFuero, 'Debe completarse el Fuero.');
  Verificar(edCaratula.Text = '',edCaratula, 'Debe completarse la caratula.');
  Verificar((edCBU1.Text = '') or (edCBU2.Text = ''),edCBU1, 'Debe completarse el CBU.');
  Verificar(ValorSql('SELECT art.utiles.iscbuvalido('+SqlValue(edCBU1.Text)+', '+SqlValue(edCBU2.Text)+
                     ') FROM DUAL')= 'N', edCBU1, 'El CBU no es valido.');

  if (edArchivoAsociado.Text <> '') then
    Do_GuardarArchivoCBUEnServidor;

  fpCBU.ModalResult := mrOk;

  Do_CompletarCBUEnEnvioDeFondos;
end;

procedure TfrmListPagosJudiciales.btnLimpiarCBUClick(Sender: TObject);
begin
 // edNroOficio.Clear;          // se saco este campo (Nro Oficio) por nuevas instrucciones de Gastón Lopez. (según mail 29/08/2013).
  edJuzgado.Clear;
  edSecretaria.Clear;
  edExpediente.Clear;
  edFuero.Clear;
  edCaratula.Clear;
  edCBU1.Clear;
  edCBU2.Clear;
  edArchivoAsociado.Clear;
end;

procedure TfrmListPagosJudiciales.fpCBUBeforeShow(Sender: TObject);
begin
  // Me fijo primero si el CBU ya esta guardado en la nueva tabla SIN.scj_cbujudiciales, si esta lo saco de ahi, y sino desde las tablas de legales.
  Do_CargarPantallaCBU;
end;

function TfrmListPagosJudiciales.Do_CargarCBUJudiciales: boolean;    // Carga los datos del CBU desde la tabla nueva SIN.scj_cbujudiciales
var sSql: string;
begin
  Result := False;
  sSql   := 'SELECT cj_numerooficio, cj_juzgado, cj_secretaria, cj_expediente, cj_fuero, cj_caratula, cj_cbu1, cj_cbu2, cj_path_archivo ' +
             ' FROM SIN.scj_cbujudiciales ' +
            ' WHERE cj_idexpediente = :idexped ' +
              ' AND cj_numerojuicio = :juicio ' +
              ' AND cj_idpago = :idpagoJud ';

  with GetQueryEx(sSql, [sdqConsulta.FieldByName('EX_ID').AsInteger, cmbIdJuicios.Text, SdqConsulta.FieldByName('PJ_ID').AsInteger]) do
  try
    if (RecordCount > 0) then
    begin
    //  edNroOficio.Text       := FieldByName('cj_numerooficio').AsString;     // se saco este campo (Nro Oficio) por nuevas instrucciones de Gastón Lopez. (según mail 29/08/2013).
      edJuzgado.Text         := FieldByName('cj_juzgado').AsString;
      edSecretaria.Text      := FieldByName('cj_secretaria').AsString;
      edExpediente.Text      := FieldByName('cj_expediente').AsString;
      edFuero.Text           := FieldByName('cj_fuero').AsString;
      edCaratula.Text        := FieldByName('cj_caratula').AsString;
      edCBU1.Text            := FieldByName('cj_cbu1').AsString;
      edCBU2.Text            := FieldByName('cj_cbu2').AsString;
      edArchivoAsociado.Text := FieldByName('cj_path_archivo').AsString;
      Result := True;
    end
  finally
    Free;
  end;
end;

procedure TfrmListPagosJudiciales.Do_CargarCBUdesdeLegales;
var sSql: string;
begin
  sSql := ' SELECT jz_descripcion AS juzgado, sc_descripcion AS secretaria, jt_nroexpediente || ''/'' || jt_anioexpediente AS nroexpediente, ' +
                 ' fu_descripcion AS fuero, jt_demandante || '' C/ '' || jt_demandado || '' '' || jt_caratula AS caratula ' +
            ' FROM legales.ljt_juicioentramite, art.sex_expedientes, legales.lsj_siniestrosjuicioentramite, legales.lod_origendemanda, ' +
                 ' legales.ljz_juzgado, legales.lsc_secretaria, legales.lfu_fuero ' +
           ' WHERE sj_idorigendemanda = od_id ' +
             ' AND od_idjuicioentramite = jt_id ' +
             ' AND jt_idestado <> 3 ' +
             ' AND jt_idfuero = fu_id ' +
             ' AND jt_idjuzgado = jz_id ' +
             ' AND jt_idsecretaria = sc_id ' +
             ' AND sj_fechabaja IS NULL ' +
             ' AND od_fechabaja IS NULL ' +
             ' AND jt_fechabaja IS NULL ' +
             ' AND sj_idsiniestro = :idexpediente ' +
             ' AND jt_numerocarpeta = :juicio ';

  with GetQueryEx(sSql, [sdqConsulta.FieldByName('EX_ID').AsInteger, cmbIdJuicios.Text]) do
  try
    edJuzgado.Text    := FieldByName('juzgado').AsString;
    edSecretaria.Text := FieldByName('secretaria').AsString;
    edExpediente.Text := FieldByName('nroexpediente').AsString;
    edFuero.Text      := FieldByName('fuero').AsString;
    edCaratula.Text   := FieldByName('caratula').AsString;
  finally
    Free;
  end;
end;



procedure TfrmListPagosJudiciales.btnAceptarModifClick(Sender: TObject);
begin
  if rbSiCorresponde.Checked then
  begin
    Verificar(fraDelegacionPJ.Codigo = '', fraDelegacionPJ, 'Debe seleccionar la delegación.'); 
    Verificar(fraMetodoPago.Codigo = '', fraMetodoPago, 'Debe seleccionar la forma de pago.');
    Verificar(btnCBU.Enabled and (edCBU1.Text = ''), btnCBU, 'Debe completar los datos del CBU');  // controlo solo el edCBU1 para saber si se entro a la pantalla, ya que una vez ingresado a ella, se valida en el Aceptar del fpCBU.
    Verificar(((fraMetodoPago.Codigo = 'CH') and (fraBanco.Codigo = '')), fraBanco, 'Para esta forma de pago debe seleccionar el banco.');

    Verificar(not(fraBancoFondos.IsEmpty) and not(fraBanco.IsEmpty) and
            (fraBancoFondos.Value <> fraBanco.Value), fraBanco,
            'El banco seleccionado no corresponde con el seleccionado anteriormente.');

  end;
  fpModificar.ModalResult := mrOk;
end;

procedure TfrmListPagosJudiciales.Do_GuardarPagosJudiciales;
var sEnvioFondos, sTipoEnvioFondos, sSql, sDecision, sSqlEstado: string;
    iIdEnvioFondos: integer;
begin
  Do_ObtenerDatosEnvioFondos(sEnvioFondos, sTipoEnvioFondos, iIdEnvioFondos);

  sSqlEstado := '';

  if rbSinDecisionModif.Checked then
    sDecision := 'NULL'
  else if rbSiCorresponde.Checked then
    sDecision := '''S'''
  else
    sDecision := '''N''';

  if (rbSiCorresponde.Checked or rbNoCorresponde.Checked) then   // Si se toma una decisión, entonces se cambia el estado a 'D'
    sSqlEstado := ' pj_estado = ''D'', ';


  sSql := ' UPDATE SIN.spj_pagosjudiciales ' +
             ' SET pj_decisionlegales = ' + sDecision + ', ' +
                 ' pj_metodopago = '      + SqlValue(fraMetodoPago.Codigo)  + ', ' +
                 ' pj_idbanco = '         + IIF((fraBanco.Value = 0), ' null ', SqlInt(fraBanco.Value)) + ', ' +

                 ' pj_enviofondos = '     + SqlValue(sEnvioFondos)          + ', ' +
                 ' pj_tipoenviofondos = ' + SqlValue(sTipoEnvioFondos)      + ', ' +
                 ' pj_idenviofondos = '   + SqlInt(iIdEnvioFondos)          + ', ' +      // Lo guarda nuevamente porque en el caso de CBU que no pasa por la pantalla de EnvioFondos, puede no guardarlo.

                 sSqlEstado +
                 
                 ' pj_chequenombre = '    + SqlValue(edChequeNombre.Text)   + ', ' +
                 ' pj_recibos = '         + SqlValue(edRecibosA.Text)       + ', ' +
                 ' pj_observaciones = '   + SqlValue(edObservaciones.Text)  + ', ' +
                 ' pj_usumodif = '        + SqlValue(Sesion.UserID)         + ', ' +
                 ' pj_fechamodif = art.actualdate, ' +
                 ' pj_delegacion = '      + SqlValue(fraDelegacionPJ.Codigo)  + ', ' +
                 ' pj_numerojuicio = '    + cmbIdJuicios.Text + ' ' +

               {  ' pj_tiporecibos = '     + IIF(rbDomicilio_Recibos.Checked, '''D''', '''O''') + ', ' +     // Lo comento porque lo guardo cuando le dan Aceptar en la pantalla de Domicilio Recibos
                 ' pj_rotro = '           + SqlValue(MemoOtroRecibos.Lines.Text)    + ', ' +
                 ' pj_rcalle = '          + SqlValue(fraDomicilioRecibos.Calle)     + ', ' +
                 ' pj_rlocalidad = '      + SqlValue(fraDomicilioRecibos.Localidad) + ', ' +
                 ' pj_rprovincia = '''    + IntToStr(fraDomicilioRecibos.Prov)      + ''', ' +
                 ' pj_rnumero = '         + SqlValue(fraDomicilioRecibos.Numero)    + ', ' +
                 ' pj_rpiso = '           + SqlValue(fraDomicilioRecibos.Piso)      + ', ' +
                 ' pj_rdepartamento = '   + SqlValue(fraDomicilioRecibos.Departamento) +   }

           ' WHERE pj_idexpediente = '    + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) +
             ' and pj_ideventoinca = '    + SqlInt(sdqConsulta.FieldByName('PJ_IDEVENTOINCA').AsInteger);

  EjecutarSqlST(sSql);
end;

procedure TfrmListPagosJudiciales.Do_GuardarDatosCBU;
var sSql, sArchivoDestino: string;
begin
  if (edArchivoAsociado.Text <> '') then
    sArchivoDestino := DIR_ARCHIVOCBU + ExtractFileName(edArchivoAsociado.Text)
  else
    sArchivoDestino := '';

  if ExisteCBU_enTabla then
    // Modifica
    sSql := 'UPDATE SIN.scj_cbujudiciales ' +
              ' SET ' + // cj_numerooficio = ' + SqlValue(edNroOficio.Text)       + ', ' +    // se saco este campo (Nro Oficio) por nuevas instrucciones de Gastón Lopez. (según mail 29/08/2013).
                  ' cj_juzgado = '      + SqlValue(edJuzgado.Text)         + ', ' +
                  ' cj_secretaria = '   + SqlValue(edSecretaria.Text)      + ', ' +
                  ' cj_expediente = '   + SqlValue(edExpediente.Text)      + ', ' +
                  ' cj_fuero = '        + SqlValue(edFuero.Text)           + ', ' +
                  ' cj_caratula = '     + SqlValue(edCaratula.Text)        + ', ' +
                  ' cj_cbu1 = '         + SqlValue(edCBU1.Text)            + ', ' +
                  ' cj_cbu2 = '         + SqlValue(edCBU2.Text)            + ', ' +
                  ' cj_path_archivo = ' + SqlValue(sArchivoDestino)        + ', ' +
                  ' cj_fechamodif = art.actualdate, ' +
                  ' cj_usumodif = '     + SqlValue(Sesion.UserID) +
            ' WHERE cj_idexpediente = ' + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) +
              ' AND cj_numerojuicio = ' + cmbIdJuicios.Text +
              ' AND cj_idpago = '       + SqlValue(SdqConsulta.FieldByName('PJ_ID').AsInteger)

  else  // Inserta
    sSql := 'INSERT INTO SIN.scj_cbujudiciales ' +
            ' (cj_idexpediente, cj_numerojuicio, ' + {cj_numerooficio, }
             ' cj_juzgado, cj_secretaria, cj_expediente, cj_fuero, cj_caratula, ' +
             ' cj_cbu1, cj_cbu2, cj_path_archivo, cj_usualta, cj_fechaalta, cj_idpago) ' +
            ' VALUES ' +
            '( ' + SqlInt(sdqConsulta.FieldByName('EX_ID').AsInteger) + ', ' +
                   cmbIdJuicios.Text                + ', ' +
                 //  SqlValue(edNroOficio.Text)       + ', ' +     // se saco este campo (Nro Oficio) por nuevas instrucciones de Gastón Lopez. (según mail 29/08/2013).
                   SqlValue(edJuzgado.Text)         + ', ' +
                   SqlValue(edSecretaria.Text)      + ', ' +
                   SqlValue(edExpediente.Text)      + ', ' +
                   SqlValue(edFuero.Text)           + ', ' +
                   SqlValue(edCaratula.Text)        + ', ' +
                   SqlValue(edCBU1.Text)            + ', ' +
                   SqlValue(edCBU2.Text)            + ', ' +
                   SqlValue(sArchivoDestino)        + ', ' +
                   SqlValue(Sesion.UserID)          + ', ' +
                   ' art.actualdate, ' +
                   SqlValue(SdqConsulta.FieldByName('PJ_ID').AsInteger) + ') ';


   EjecutarSqlST(sSql);
end;

function TfrmListPagosJudiciales.ExisteCBU_enTabla: boolean;
begin
  Result := ExisteSqlEx('SELECT 1 FROM SIN.scj_cbujudiciales ' +
                        ' WHERE cj_idexpediente = :idexped ' +
                          ' AND cj_numerojuicio = :juicio ' +
                          ' AND cj_idpago = :idpagojud ', [sdqConsulta.FieldByName('EX_ID').AsInteger, cmbIdJuicios.Text, SdqConsulta.FieldByName('PJ_ID').AsInteger]);
end;


procedure TfrmListPagosJudiciales.Do_LimpiarFpModificar;
begin
  fraMetodoPago.Clear;
  fraBanco.Clear;
  edEnvioFondos.Clear;
  edChequeNombre.Clear;
  edRecibosA.Clear;
  edObservaciones.Clear;
  fraDelegacionPJ.Clear;
end;

procedure TfrmListPagosJudiciales.Do_CargarDatosfpModificar(iIdExpediente, iIdEventoInca: integer);
var sSql: string;
begin
  sSql := ' SELECT pj_decisionlegales, pj_numerojuicio, pj_metodopago, pj_idbanco, pj_enviofondos, ' +
                 ' pj_tipoenviofondos, pj_idenviofondos, pj_chequenombre, pj_recibos, pj_observaciones, pj_delegacion ' +
            ' FROM SIN.spj_pagosjudiciales, SIN.scj_cbujudiciales ' +
           ' WHERE pj_id = cj_idpago(+) ' +
             ' AND pj_idexpediente = :idexped ' +
             ' AND pj_ideventoinca = :ideventoinca ';

  with GetQueryEx(sSql, [iIdExpediente, iIdEventoInca]) do
  try
    if (FieldByName('pj_decisionlegales').IsNull) then
      rbSinDecisionModif.Checked := True
    else if (FieldByName('pj_decisionlegales').AsString = 'S') then
      rbSiCorresponde.Checked := True
    else
      rbNoCorresponde.Checked := True;

    if FieldByName('pj_numerojuicio').IsNull then
      Do_LlenarComboJuicios(sdqConsulta.FieldByName('EX_SINIESTRO').AsInteger, sdqConsulta.FieldByName('EX_ORDEN').AsInteger)
    else
      cmbIdJuicios.Text := FieldByName('pj_numerojuicio').AsString;

    fraMetodoPago.Codigo    := FieldByName('pj_metodopago').AsString;
    btnCBU.Enabled          := ((rbSiCorresponde.Checked) and (fraMetodoPago.Codigo <> 'CH'));
    fraBanco.Value          := FieldByName('pj_idbanco').AsInteger;
    fraDelegacionPJ.Codigo    := FieldByName('pj_delegacion').AsString;
    edEnvioFondos.Text      := FieldByName('pj_enviofondos').AsString;
    // Frame fpEnvioFondos
    fraBancoFondos.Codigo   := FieldByName('pj_tipoenviofondos').AsString;
    fraSucursalFondos.Value := FieldByName('pj_idenviofondos').AsInteger;
    // --------------------
    edChequeNombre.Text     := FieldByName('pj_chequenombre').AsString;
    edRecibosA.Text         := FieldByName('pj_recibos').AsString;
    edObservaciones.Text    := FieldByName('pj_observaciones').AsString;

    Do_CargarPantallaCBU;

  finally
    Free;
  end;
end;

procedure TfrmListPagosJudiciales.Do_CompletarCBUEnEnvioDeFondos;
begin
  edEnvioFondos.Text := 'CBU: ' + edCBU1.Text + ' - ' + edCBU2.Text;
end;

procedure TfrmListPagosJudiciales.tbEliminarClick(Sender: TObject);
var sSql:string;
begin
  Verificar(not sdqConsulta.FieldByName('PJ_FECHABAJA').IsNull, nil, 'El registro seleccionado ya se encuentra dado de baja');
  Verificar((sdqConsulta.FieldByName('EP_BLOQUEALEGALES').AsString = 'S'), tbEliminar, 'No se puede dar de baja el registro, debido a que su estado no lo permite.');  // en los estados Aprobado, Vencido, Liquidado y Baja, el EP_BLOQUEALEGALES es = 'S'

  if fpMotivoBaja.ShowModal = mrOk then
  begin
    Try
      BeginTrans;

      sSql := ' UPDATE SIN.spj_pagosjudiciales ' +
                 ' SET pj_idmotivobaja = :idmotbaja, ' +
                     ' pj_usubaja = :usubaja, ' +
                     ' pj_fechabaja = art.actualdate ' +
               ' WHERE pj_id = :id ';

      EjecutarSqlSTEx(sSql, [fraMotivoBaja.ID, Sesion.UserID, sdqConsulta.FieldByName('PJ_ID').AsInteger]);
      CommitTrans;
      tbRefrescarClick(Self);
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar dar de baja el registro.');
        Rollback;
      end;
    end;
  end;

end;

procedure TfrmListPagosJudiciales.btnAceptarMotBajaClick(Sender: TObject);
begin
  Verificar(fraMotivoBaja.Codigo = '', fraMotivoBaja, 'Debe completar el motivo de baja');
  if MsgAsk('¿Esta seguro que desea dar de baja este registro?') then
    fpMotivoBaja.ModalResult := mrOk;
end;

procedure TfrmListPagosJudiciales.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqconsulta.FieldByName('pj_fechabaja').IsNull then
     AFont.Color := clRed;
  if (sdqConsulta.FieldByName('pj_estado').AsString = 'V') then
     AFont.Color := clGreen;
end;

procedure TfrmListPagosJudiciales.fpMotivoBajaBeforeShow(Sender: TObject);
begin
  fraMotivoBaja.Clear;
end;

procedure TfrmListPagosJudiciales.tbImprimirClick(Sender: TObject);
begin
  Queryprint.Title.Text    := 'Listado de Pagos Judiciales';
  Queryprint.Print;
  inherited;
end;

// boton para Devolver a Legales: pone en NULL la decisión sin borrar lo demas.
procedure TfrmListPagosJudiciales.tbPropiedadesClick(Sender: TObject);
var sSql: string;
begin
  if MsgAsk('¿Esta seguro que desea devolver este registro a Legales?') then
  begin
    Try
      BeginTrans;
      sSql := 'UPDATE SIN.spj_pagosjudiciales ' +
                ' SET pj_decisionlegales = null, ' +
                    ' pj_estado = ''P'', ' +  // Devolver a Legales, deja en estado Pendiente (este en estado Aprobado o Vencido)
                    ' pj_usudevolegales = ' + SqlValue(Sesion.UserID) + ', ' +
                    ' pj_fdevolegales = art.actualdate ' +
              ' WHERE pj_id = :id ';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('PJ_ID').AsInteger]);
      CommitTrans;
      tbRefrescarClick(Self);
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;
end;

procedure TfrmListPagosJudiciales.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  tbPropiedades.Enabled := Get_ActivarDevolverALegales;
end;

procedure TfrmListPagosJudiciales.Do_ObtenerDatosEnvioFondos(var sEnvioFondos, sTipoEnvioFondos: string; var iIdEnvioFondos: integer);
begin
  if rbBancoFondos.Checked then
  begin
    sTipoEnvioFondos := fraBancoFondos.Codigo;
    iIdEnvioFondos   := fraSucursalFondos.Value;
    sEnvioFondos     := fraBancoFondos.Descripcion +
                           IIF(not(fraSucursalFondos.IsEmpty), ' - SUCURSAL ' +
                           fraSucursalFondos.Descripcion + ' (' + fraSucursalFondos.Codigo + ')', '');
  end
  else if rbDelegacionFondos.Checked then
  begin
    sTipoEnvioFondos := 'D';
    iIdEnvioFondos   := fraDelegacionFondos.Value;
    sEnvioFondos     := 'DELEGACION ' + fraDelegacionFondos.Descripcion;

  end
  else if rbCentralFondos.Checked then
  begin
    sTipoEnvioFondos := 'C';
    iIdEnvioFondos   := 0;
    sEnvioFondos     := 'CASA CENTRAL';
  end
  else begin
    sTipoEnvioFondos := '';
    iIdEnvioFondos   := 0;
    sEnvioFondos     := edEnvioFondos.Text;
  end;

end;

procedure TfrmListPagosJudiciales.tbSeleccionArchivoAsociarClick(Sender: TObject);
begin
  if OpenDialog_AsocArch.Execute then
    edArchivoAsociado.Text := OpenDialog_AsocArch.FileName;
end;

procedure TfrmListPagosJudiciales.tbLimpiarArchivoClick(Sender: TObject);
begin
  edArchivoAsociado.Clear;
end;

procedure TfrmListPagosJudiciales.tbSalir3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmListPagosJudiciales.tbVerArchivoAsociadoCBUClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('cj_path_archivo').IsNull, tbVerArchivoAsociadoCBU, 'Este registro no tiene asociado un archivo de CBU');
  ShellExecute(Application.Handle, nil, PChar(sdqConsulta.FieldByName('cj_path_archivo').asString), '', '', SW_SHOWNORMAL);
end;

procedure TfrmListPagosJudiciales.Do_GuardarArchivoCBUEnServidor;
var sArchivoOrigen, sArchivoDestino: string;
    bCopiar: boolean;
begin
  bCopiar         := True;   // debe estar inicializado en True si o si
  sArchivoOrigen  := edArchivoAsociado.Text;
  sArchivoDestino := DIR_ARCHIVOCBU + ExtractFileName(edArchivoAsociado.Text);

  if (sArchivoOrigen <> sArchivoDestino) then  // me fijo que el archivo de origen no sea igual al de destino, ya que eso significa que no estoy modificando dicho archivo.
  begin
    if FileExists(PAnsiChar(sArchivoDestino)) then    // Si el archivo ya existe en el directorio, lo borra para luego ser reemplazado.
      if MsgAsk('Ya existe un archivo con el mismo nombre en el directorio. ¿Desea reemplazarlo?') then
      begin
        DeleteFile(PAnsiChar(sArchivoDestino));
        bCopiar := True;
      end
      else
        bCopiar := False;

    if bCopiar then
      if not CopyFile(PChar(sArchivoOrigen), PChar(sArchivoDestino), true) then
        raise Exception.Create('El archivo ' + sArchivoOrigen +  'no pudo ser copiado al directorio '
                               + DIR_ARCHIVOCBU + ' indicado en el parámetro ')
  end;
end;

procedure TfrmListPagosJudiciales.tbSalir4Click(Sender: TObject);
begin
  Close;
end;

function TfrmListPagosJudiciales.Get_ActivarDevolverALegales: boolean;  // es el boton tbPropiedades
begin
  Result := tbPropiedades.Visible and Seguridad.Activar(tbPropiedades) and (sdqConsulta.FieldByName('pj_fechabaja').IsNull) and (sdqConsulta.FieldByName('ep_bloqueadinerarias').AsString = 'N');
end;

procedure TfrmListPagosJudiciales.tbAprobarClick(Sender: TObject);
var sSql: string;
begin
  Verificar((not sdqConsulta.FieldByName('pj_fechabaja').IsNull), tbAprobar, 'No se puede aprobar un registro dado de baja.');
  Verificar((sdqConsulta.FieldByName('EP_CODIGO').AsString <> 'D'), tbAprobar, 'No se puede aprobar este registro, debido a que su estado no lo permite.');   

  if MsgAsk('¿Esta seguro que desea aprobar este registro?') then
  begin
    Try
      BeginTrans;
      sSql := 'UPDATE SIN.spj_pagosjudiciales ' +
                ' SET pj_estado = ''A'', ' +
                    ' pj_usuaprobacion = ' + SqlValue(Sesion.UserID) + ', ' +
                    ' pj_faprobacion = art.actualdate ' +
              ' WHERE pj_id = :id ';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('PJ_ID').AsInteger]);
      CommitTrans;
      tbRefrescarClick(Self);
      msgbox('El registro se ha aprobado con éxito');
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar guardar los datos.');
        Rollback;
      end;
    end;
  end;

end;

procedure TfrmListPagosJudiciales.tbCartaDocTrabClick(Sender: TObject);
{var sCodigoCarta, sSql, sFirmante: string;
    iIdFormato, iDestinatario, idCarta: integer;     }     // lo comento hasta tanto se implemente
begin
 {
  Verificar((sdqConsulta.FieldByName('pj_estado').AsString <> 'L'), tbCartaDocTrab, 'No se puede insertar la carta: El estado debe ser Liquidado.');

  if fpFirmanteCartaDoc.ShowModal = mrOk then
  begin
    Try
      BeginTrans;

      if Is_SiniPostDecreto1694(sdqConsulta.FieldByName('EX_FECHAACCIDENTE').AsDateTime) then
      begin
        if (sdqConsulta.FieldByName('EX_GRAVEDAD').AsString = '5') then
          sCodigoCarta := 'PJMP'
        else
          sCodigoCarta := 'PJP';
      end
      else
      begin
        if (sdqConsulta.FieldByName('EX_GRAVEDAD').AsString = '5') then
          sCodigoCarta := 'PJMA'
        else
          sCodigoCarta := 'PJA';
      end;

      sSql := ' SELECT tc_id, tc_destinatario ' +
                ' FROM ctc_textocarta ' +
               ' WHERE tc_codigo = :codcarta ';
      with GetQueryEx(sSql, [sCodigoCarta]) do
      try
        iIdFormato    := FieldByName('TC_ID').AsInteger;
        iDestinatario := FieldByName('TC_DESTINATARIO').AsInteger;
      finally
        Free;
      end;

      sFirmante := fraFirmantes.edCodigo.Text;

  {    idCarta := DoInsertarCarta(iIdFormato,
                                 sdqConsulta.FieldByName('EX_SINIESTRO').AsInteger,
                                 sdqConsulta.FieldByName('EX_ORDEN').AsInteger,
                                 sdqConsulta.FieldByName('EX_RECAIDA').AsInteger,
                                 sFirmante,
                                 AREA_MED, False, ART_EMPTY_ID, tdTrabajador,    // <--- ATENCION !!! poner el area que corresponde en "AREA_MED"
                                 '', 0, 0, 0, 0, 0, '', 0, 0, iNroEvento);



      CommitTrans;
      MsgBox('La carta fue ingresada correctamente.');
    except
      on E:Exception do
      begin
        ErrorMsg(E, 'Error al insertar la carta documento.');
        Rollback;
      end;
    end;
  end;

  }

end;

procedure TfrmListPagosJudiciales.fpFirmanteCartaDocBeforeShow(Sender: TObject);
begin
  fraFirmantes.edCodigo.Clear;
  fraFirmantes.cmbDescripcion.Clear;
end;

procedure TfrmListPagosJudiciales.btnAceptarFirmanteClick(Sender: TObject);
begin
  Verificar(fraFirmantes.edCodigo.text = '', fraFirmantes, 'Debe completar el firmante');
  fpFirmanteCartaDoc.ModalResult := mrOk;
end;

procedure TfrmListPagosJudiciales.Do_CargarPantallaCBU;
begin
  btnLimpiarCBUClick(Self);
  if not Do_CargarCBUJudiciales then
    Do_CargarCBUdesdeLegales;
end;

procedure TfrmListPagosJudiciales.fpDomicilioRecibosBeforeShow(Sender: TObject);
var sSql: string;
begin
  sSql := ' SELECT pj_tiporecibos, pj_rotro, pj_rcpostal, pj_rcalle, pj_rlocalidad, pj_rprovincia, pj_rnumero, pj_rpiso, pj_rdepartamento, pj_delegacion ' +
            ' FROM SIN.spj_pagosjudiciales, SIN.scj_cbujudiciales ' +
           ' WHERE pj_id = cj_idpago(+) ' +
             ' AND pj_idexpediente = :idexped ' +
             ' AND pj_ideventoinca = :ideventoinca ';

  with GetQueryEx(sSql, [sdqConsulta.FieldByName('EX_ID').AsInteger, sdqConsulta.FieldByName('PJ_IDEVENTOINCA').AsInteger]) do
  try
    if not FieldByName('pj_rotro').IsNull then
    begin
      rbOtro_Recibos.Checked     := True;
      MemoOtroRecibos.Lines.text := FieldByName('pj_rotro').AsString;
    end
    else begin
      rbDomicilio_Recibos.Checked := True;
      fraDomicilioRecibos.Cargar(FieldByName('pj_rcalle').AsString, FieldByName('pj_rcpostal').AsString, FieldByName('pj_rlocalidad').AsString,
                                 FieldByName('pj_rnumero').AsString, FieldByName('pj_rpiso').AsString, FieldByName('pj_rdepartamento').AsString,
                                 FieldByName('pj_rprovincia').AsString, '');
    end;

  finally
    Free;
  end;

end;

end.
