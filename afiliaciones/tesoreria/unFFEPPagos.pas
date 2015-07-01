unit unFFEPPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unFraCodigoDescripcion, StdCtrls, Mask, ToolEdit,
  DateComboBox, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  SinEdit, DateTimeEditors, PatternEdit, sqlfuncs, ansisql;

type
  TfrmFFEPPagos = class(TfrmCustomConsulta)
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbEmpresa: TGroupBox;
    fraEmpresa1: TfraEmpresa;
    gbFechaMarca: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbFechaMarcaDesde: TDateComboBox;
    cbFechaMarcaHasta: TDateComboBox;
    gbFechaDesmarca: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbFechaDesmarcaDesde: TDateComboBox;
    cbFechaDesmarcaHasta: TDateComboBox;
    gbConceptoPago: TGroupBox;
    fraConceptoPago: TfraCodigoDescripcion;
    gbPeriodoImp: TGroupBox;
    mskPeriodo: TMaskEdit;
    gbFechaEnvio: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cbFechaEnvioDesde: TDateComboBox;
    cbFechaEnvioHasta: TDateComboBox;
    gbCodigoOperacion: TGroupBox;
    edCodigoOp: TEdit;
    rgTipoOperacion: TRadioGroup;
    sdqConsultaSINIESTRO: TFloatField;
    sdqConsultaORDEN: TFloatField;
    sdqConsultaRECAIDA: TFloatField;
    sdqConsultaLIQUIDACION: TFloatField;
    sdqConsultaVOLANTE: TFloatField;
    sdqConsultaFECHA_PAGO: TDateTimeField;
    sdqConsultaPERIODO: TStringField;
    sdqConsultaCONTRATO: TFloatField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaASEGURADO: TStringField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaTRABAJADOR: TStringField;
    sdqConsultaCONPAGO: TFloatField;
    sdqConsultaDENPAGO: TStringField;
    sdqConsultaIMPORTE_LIQ: TFloatField;
    sdqConsultaIMPORTE_FFEP: TFloatField;
    sdqConsultaCODIGO_SRT: TStringField;
    sdqConsultaFEC_ENVIO: TDateTimeField;
    sdqConsultaOPERACION: TStringField;
    sdqConsultaLIQUI_LEGAL: TFloatField;
    sdqConsultaJUICIO: TFloatField;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    function IsBaja: Boolean;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFFEPPagos: TfrmFFEPPagos;

implementation

{$R *.dfm}

procedure TfrmFFEPPagos.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := ' SELECT rl_siniestro siniestro, rl_orden orden, rl_recaida recaida, ' +
                 ' rl_numliqui liquidacion, NULL volante, trunc(le_faprobado) fecha_pago, ' +
                 ' lf_periodo periodo, ex_contrato contrato, ex_cuit cuit, ' +
                 ' em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador, ' +
                 ' le_conpago conpago, cp_denpago denpago, le_imporperi importe_liq, ' +
                 ' lf_factor_hipo * le_imporperi importe_ffep, ' +
                 ' lf_codigo_aprobacion codigo_srt, lf_fenvio fec_envio, ' +
                 ' lf_tipo_operacion operacion, null liqui_legal, null juicio ' +
            ' FROM art.sle_liquiempsin, ' +
                 ' aem_empresa, ' +
                 ' ctj_trabajador, ' +
                 ' art.sex_expedientes, ' +
                 ' srt.srl_relacion_pago_fondo, ' +
                 ' srt.slf_log_envio_ffep, ' +
                 ' art.scp_conpago ' +
           ' WHERE lf_cod_error IS NULL ' +
             ' AND lf_id = rl_idfondo ' +
             ' AND rl_numliqui IS NOT NULL ' +
             ' AND tj_cuil = ex_cuil ' +
             ' AND em_cuit = ex_cuit ' +
             ' AND rl_siniestro = le_siniestro ' +
             ' AND rl_orden = le_orden ' +
             ' AND rl_recaida = le_recaida ' +
             ' AND rl_numliqui = le_numliqui ' +
             ' AND le_siniestro = ex_siniestro ' +
             ' AND le_orden = ex_orden ' +
             ' AND le_recaida = ex_recaida ' +
             ' AND cp_conpago = le_conpago ' +
       ' UNION ALL ' +
          ' SELECT rl_siniestro siniestro, rl_orden orden, rl_recaida recaida, ' +
                 ' NULL liquidacion, iv_volante volante, trunc(vo_fechapago) fecha_pago, ' +
                 ' lf_periodo periodo, ex_contrato contrato, ex_cuit cuit, ' +
                 ' em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador, ' +
                 ' iv_conpago conpago, cp_denpago denpago, iv_impfacturado importe_liq, ' +
                 ' iv_impfacturado importe_ffep, lf_codigo_aprobacion codigo_srt, ' +
                 ' lf_fenvio fec_envio, lf_tipo_operacion operacion, null liqui_legal, null juicio ' +
            ' FROM art.siv_itemvolante, ' +
                 ' art.svo_volantes, ' +
                 ' aem_empresa, ' +
                 ' ctj_trabajador, ' +
                 ' art.sex_expedientes, ' +
                 ' srt.srl_relacion_pago_fondo, ' +
                 ' srt.slf_log_envio_ffep, ' +
                 ' art.scp_conpago ' +
           ' WHERE lf_cod_error IS NULL ' +
             ' AND lf_id = rl_idfondo ' +
             ' AND rl_numpago IS NOT NULL ' +
             ' AND tj_cuil = ex_cuil ' +
             ' AND em_cuit = ex_cuit ' +
             ' AND rl_siniestro = iv_siniestro ' +
             ' AND rl_orden = iv_orden ' +
             ' AND rl_recaida = iv_recaida ' +
             ' AND rl_numpago = iv_numpago ' +
             ' AND iv_siniestro = ex_siniestro ' +
             ' AND iv_orden = ex_orden ' +
             ' AND iv_recaida = ex_recaida ' +
             ' AND cp_conpago = iv_conpago ' +
             ' AND iv_volante = vo_volante ' +
       ' UNION ALL ' +
          ' SELECT rl_siniestro siniestro, rl_orden orden, rl_recaida recaida, ' +
                 ' rl_numotro liquidacion, NULL volante, trunc(pr_faprobado) fecha_pago, ' +
                 ' lf_periodo periodo, ex_contrato contrato, ex_cuit cuit, ' +
                 ' em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador, ' +
                 ' pr_conpago conpago, cp_denpago denpago, pr_imporpago importe_liq, ' +
                 ' pr_imporpago importe_ffep, lf_codigo_aprobacion codigo_srt, ' +
                 ' lf_fenvio fec_envio, lf_tipo_operacion operacion, null liqui_legal, null juicio ' +
            ' FROM art.spr_pagoexpesin, ' +
                 ' aem_empresa, ' +
                 ' ctj_trabajador, ' +
                 ' art.sex_expedientes, ' +
                 ' srt.srl_relacion_pago_fondo, ' +
                 ' srt.slf_log_envio_ffep, ' +
                 ' art.scp_conpago ' +
           ' WHERE lf_cod_error IS NULL ' +
             ' AND lf_id = rl_idfondo ' +
             ' AND rl_numotro IS NOT NULL ' +
             ' AND tj_cuil = ex_cuil ' +
             ' AND em_cuit = ex_cuit ' +
             ' AND rl_siniestro = pr_siniestro ' +
             ' AND rl_orden = pr_orden ' +
             ' AND rl_recaida = pr_recaida ' +
             ' AND rl_numotro = pr_numpago ' +
             ' AND pr_siniestro = ex_siniestro ' +
             ' AND pr_orden = ex_orden ' +
             ' AND pr_recaida = ex_recaida ' +
             ' AND cp_conpago = pr_conpago ' +
       ' UNION ALL ' +
          ' SELECT rl_siniestro siniestro, rl_orden orden, rl_recaida recaida, ' +
                 ' NULL liquidacion, NULL volante, ' +
                 ' trunc(pl_fechaaprobado) fecha_pago, ' +
                 ' lf_periodo periodo, ex_contrato contrato, ex_cuit cuit, ' +
                 ' em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador, ' +
                 ' pl_conpago conpago, cp_denpago denpago, ' +
                 ' pl_importepago importe_liq, ' +
                 ' NVL(rl_montoffep, pl_importepago) importe_ffep, ' +
                 ' lf_codigo_aprobacion codigo_srt, ' +
                 ' lf_fenvio fec_envio, lf_tipo_operacion operacion, ' +
                 ' pl_numpago liqui_legal, jt_numerocarpeta juicio ' +
            ' FROM legales.lpl_pagolegal, ' +
                 ' aem_empresa, ' +
                 ' ctj_trabajador, ' +
                 ' art.sex_expedientes, ' +
                 ' srt.srl_relacion_pago_fondo, ' +
                 ' srt.slf_log_envio_ffep, ' +
                 ' art.scp_conpago, ' +
                 ' legales.ljt_juicioentramite jt, ' +
                 ' legales.lod_origendemanda od, ' +
                 ' legales.lsj_siniestrosjuicioentramite sj ' +
           ' WHERE lf_cod_error IS NULL ' +
             ' AND lf_id = rl_idfondo ' +
             ' AND rl_idlegal IS NOT NULL ' +
             ' AND tj_cuil = ex_cuil ' +
             ' AND em_cuit = ex_cuit ' +
             ' AND rl_idlegal = pl_id ' +
             ' AND rl_siniestro = ex_siniestro ' +
             ' AND rl_orden = ex_orden ' +
             ' AND rl_recaida = ex_recaida ' +
             ' AND cp_conpago = pl_conpago ' +
             ' AND jt.jt_id = od.od_idjuicioentramite ' +
             ' AND od.od_id = sj.sj_idorigendemanda ' +
             ' AND pl_idjuicioentramite = od.od_idjuicioentramite ';


  if not fraEmpresa1.IsEmpty then
    addcondition_UNION(sSql, 'ex_contrato = ' + sqlint(fraEmpresa1.Contrato));
  if not cbFechaMarcaDesde.IsEmpty then
    addcondition_UNION(sSql, 'nl_fechamarca >= ' + sqldate(cbFechaMarcaDesde.Date));
  if not cbFechaMarcaHasta.IsEmpty then
    addcondition_UNION(sSql, 'nl_fechamarca <= ' + sqldate(cbFechaMarcaHasta.date));
  if not cbFechaDesmarcaDesde.IsEmpty then
    addcondition_UNION(sSql, 'nl_fechadesmarca >= ' + sqldate(cbFechaDesmarcaDesde.date));
  if not cbFechaDesmarcaHasta.IsEmpty then
    addcondition_UNION(sSql, 'nl_fechadesmarca <= ' + sqldate(cbFechaDesmarcaHasta.date));
  if not cbFechaEnvioDesde.IsEmpty then
    addcondition_UNION(sSql, 'Lf_fenvio >= ' + sqldate(cbFechaEnvioDesde.date));
  if not cbFechaEnvioHasta.IsEmpty then
    addcondition_UNION(sSql, 'Lf_fenvio <= ' + sqldate(cbFechaEnvioHasta.date));
  case rgTipoOperacion.ItemIndex of
    1: addcondition_UNION(sSql, 'lf_tipo_operacion = ''A''');
    2: addcondition_UNION(sSql, 'lf_tipo_operacion = ''B''');
  end;
  if not edSiniestro.IsEmpty then
  begin
    addcondition_UNION(sSql, 'ex_siniestro = ' + sqlint(edSiniestro.Siniestro));
    addcondition_UNION(sSql, 'ex_orden = ' + sqlint(edSiniestro.Orden));
    addcondition_UNION(sSql, 'ex_recaida = ' + sqlint(edSiniestro.Recaida));
  end;
  if mskPeriodo.Text <> '' then
    addcondition_UNION(sSql, 'Lf_periodo = ' + sqlvalue(mskPeriodo.Text));
  if not fraConceptoPago.IsEmpty then
  begin
    insert(' and Le_conpago = ' + sqlint(fraConceptoPago.ID) + ' ', sSql, pos('UNION', sSql) - 1);
    insert(' and cp_conpago = ' + sqlint(fraConceptoPago.ID) + ' ', sSql, length(sSql));
  end;
  if edCodigoOp.Text <> '' then
    addcondition_UNION(sSql, 'Lf_codigo_aprobacion = ' + sqlvalue(edCodigoOp.Text));
  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;
  //grid.Columns.Items[18].Visible := false;

end;

procedure TfrmFFEPPagos.FormCreate(Sender: TObject);
begin
  inherited;
  fraConceptoPago.TableName := 'art.scp_conpago';
  fraConceptoPago.FieldID       := 'cp_conpago';
  fraConceptoPago.FieldCodigo   := 'cp_conpago';
  fraConceptoPago.FieldDesc     := 'cp_denpago';
  fraConceptoPago.ExtraCondition := ' and cp_cod_pago_ffep is not null ';
  fraEmpresa1.ShowBajas := true;

end;

procedure TfrmFFEPPagos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa1.clear;
  cbFechaMarcaDesde.Clear;
  cbFechaMarcaHasta.clear;
  cbFechaDesmarcaDesde.Clear;
  cbFechaDesmarcaHasta.Clear;
  cbFechaEnvioDesde.Clear;
  cbFechaEnvioHasta.clear;
  rgTipoOperacion.ItemIndex := 0;
  edSiniestro.Clear;
  fraConceptoPago.Clear;
  edCodigoOp.Clear;
  mskPeriodo.Clear;
end;

function TfrmFFEPPagos.IsBaja: Boolean;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and Assigned(sdqConsulta.FindField('lf_tipo_operacion')) then
    Result := sdqConsulta.FieldByName('lf_tipo_operacion').asstring = 'B'
  else
    Result := False;
end;

procedure TfrmFFEPPagos.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if IsBaja then
    AFont.Color := clRed;
     
end;

procedure TfrmFFEPPagos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName( 'importe_liq' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'importe_liq' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'importe_ffep' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'importe_ffep' ) ).Currency := True;


end;

end.
