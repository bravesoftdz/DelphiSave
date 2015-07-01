unit unFFEPEnvios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, SinEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unfraCtbTablas,
  ansisql, sqlfuncs, unImpoExpoWizard, PatternEdit, IntEdit, FormPanel,
  vclextra, undmprincipal, customdlgs;

type
  TfrmFFEPEnvios = class(TfrmCustomConsulta)
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbFechaEnvio: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbFechaEnvioDesde: TDateComboBox;
    cbFechaEnvioHasta: TDateComboBox;
    gbCodigoAprobacion: TGroupBox;
    edCodigoAp: TEdit;
    gbCodError: TGroupBox;
    sdqConsultaSINIESTRO: TFloatField;
    sdqConsultaORDEN: TFloatField;
    sdqConsultaRECAIDA: TFloatField;
    sdqConsultaCOD_ART: TStringField;
    sdqConsultaNRO_SRT: TStringField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaNRO_EXPTE: TStringField;
    sdqConsultaCOD_PAGO: TStringField;
    sdqConsultaTIPO_PRES: TStringField;
    sdqConsultaFECHA_PAGO: TStringField;
    sdqConsultaPERIODO: TStringField;
    sdqConsultaMONTO: TStringField;
    sdqConsultaMONTO_FFEP: TStringField;
    sdqConsultaOPERACION: TStringField;
    sdqConsultaCODIGO_SRT: TStringField;
    sdqConsultaMOTIVO: TStringField;
    sdqConsultaOBSERVACION: TStringField;
    sdqConsultaSENTENCIA: TStringField;
    sdqConsultaEXPTE_JUD: TStringField;
    sdqConsultaTIPO_SEN: TStringField;
    sdqConsultaIMP_FFEP: TStringField;
    sdqConsultaCIE10_1: TStringField;
    sdqConsultaCIE10_2: TStringField;
    sdqConsultaCIE10_3: TStringField;
    sdqConsultaENFERMEDAD_HIPOACUSIA: TStringField;
    sdqConsultaCARACTER: TStringField;
    sdqConsultaVINCULO_LABORAL: TStringField;
    sdqConsultaOPINION_PREVIA: TStringField;
    sdqConsultaOPINION: TStringField;
    sdqConsultaPORCENTAJE: TStringField;
    sdqConsultaREVISION_MDICA: TStringField;
    sdqConsultaESTUDIOS_COMP: TStringField;
    sdqConsultaINFORME_PERITO: TStringField;
    sdqConsultaREFERENCIA_BAREMO: TStringField;
    sdqConsultaAPLICACION_BAREMO: TStringField;
    sdqConsultaFEC_ENVIO: TDateTimeField;
    sdqConsultaCODIGO_ERROR: TStringField;
    sdqConsultaDESC_ERROR: TStringField;
    fraCodError: TfraCtbTablas;
    tbRespuesta: TToolButton;
    fpBaja: TFormPanel;
    BevelAbm: TBevel;
    lblPeriodo: TLabel;
    lblObservacion: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    mObservacion: TMemo;
    lblMotivo: TLabel;
    mskPeriodo: TMaskEdit;
    fraMotivo: TfraCtbTablas;
    tbProcMens: TToolButton;
    rgEstado: TRadioGroup;
    tbEnvJuicio: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRespuestaClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FraMotivoChange(Sender: TObject);
    procedure tbProcMensClick(Sender: TObject);
    procedure tbEnvJuicioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFFEPEnvios: TfrmFFEPEnvios;

implementation

{$R *.dfm}

procedure TfrmFFEPEnvios.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := ' SELECT distinct (rl_siniestro) Siniestro, rl_orden Orden, rl_recaida Recaida, ' +
                 ' lf_codigo_art Cod_ART, lf_nrosiniestro Nro_SRT, lf_cuil Cuil, ' +
                 ' lf_nro_expediente Nro_Expte, lf_cod_pago Cod_Pago, lf_tipo_pres Tipo_pres, ' +
                 ' lf_fecha_pago Fecha_Pago, lf_periodo Periodo, lf_monto Monto, lf_monto_ffep Monto_Ffep, ' +
                 ' lf_tipo_operacion Operacion, lf_codigo_aprobacion codigo_srt, lf_motivo_operacion Motivo, ' +
                 ' lf_observacion Observacion, lf_sentencia Sentencia, lf_exp_jud Expte_Jud, lf_tipo_sen Tipo_Sen, ' +
                 ' lf_imp_feep Imp_Ffep, lf_cie10_1 Cie10_1,lf_cie10_2 Cie10_2, lf_cie10_3 Cie10_3, ' +
                 ' lf_enf_hipo Enfermedad_Hipoacusia, lf_caracter Caracter, lf_vinculo Vinculo_Laboral, ' +
                 ' lf_opinion Opinion_Previa, lf_desc_opinion Opinion, lf_porcentaje Porcentaje, ' +
                 ' lf_revision Revision_Médica, lf_estudios Estudios_Comp, lf_perito Informe_Perito, ' +
                 ' lf_ref_baremo Referencia_Baremo, lf_apl_baremo Aplicacion_Baremo, ' +
                 ' lf_fenvio Fec_Envio, lf_cod_error Codigo_Error, tb_descripcion Desc_Error ' +
            ' FROM srt.srl_relacion_pago_fondo, ' +
                 ' srt.slf_log_envio_ffep, ' +
                 ' art.ctb_tablas ' +
           ' WHERE lf_id = rl_idfondo ' +
             ' AND tb_clave (+) = ''ERSRT'' ' +
             ' AND tb_codigo (+) = ltrim(lf_cod_error) ';

  if not edSiniestro.IsEmpty then
  begin
    ssql := ssql + ' AND rl_siniestro = ' + sqlint(edSiniestro.Siniestro);
    ssql := ssql + ' AND rl_orden = ' + sqlint(edSiniestro.Orden);
    ssql := ssql + ' AND rl_recaida = ' + sqlint(edSiniestro.Recaida);
  end;

  if not cbFechaEnvioDesde.IsEmpty then
    ssql := ssql + ' AND Lf_fenvio >= ' + sqldate(cbFechaEnvioDesde.Date);

  if not cbFechaEnvioHasta.IsEmpty then
    ssql := ssql + ' AND Lf_fenvio <= ' + sqldate(cbFechaEnvioHasta.Date);

  if edCodigoAp.Text <> '' then
    ssql := ssql + ' AND Lf_codigo_aprobacion = ' + sqlvalue(edCodigoAp.Text);

  if not fraCodError.IsEmpty then
    ssql := ssql + ' AND ltrim(Lf_cod_error) = ' + sqlvalue(fraCodError.ID);

  case rgEstado.ItemIndex of
    1: ssql := ssql + ' AND Lf_cod_error IS NULL';
    2: ssql := ssql + ' AND Lf_cod_error IS NOT NULL';
  end;
  
  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmFFEPEnvios.FormCreate(Sender: TObject);
begin
  inherited;
  with fraCodError do
  begin
    Clave := 'ERSRT';
    ShowBajas := true;
    ExtraCondition := ' and tb_codigo > ''0'' ';
  end;
  with fraMotivo do
  begin
    Clave := 'BAFEP';
    ShowBajas := true;
    ExtraCondition := ' and tb_codigo > ''0'' ';
  end;
  fraMotivo.OnChange := FraMotivoChange;
  tbRespuesta.Left := 190;
  tbProcMens.Left := 186;
  tbEnvJuicio.Left := 180;
end;

procedure TfrmFFEPEnvios.FraMotivoChange(Sender: TObject);
begin
  if fraMotivo.Especial1 = 'S' then
    vclextra.LockControls(mObservacion, false)
  else
    vclextra.LockControls(mObservacion, true);

end;

procedure TfrmFFEPEnvios.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraCodError.Clear;
  edSiniestro.Clear;
  cbFechaEnvioDesde.Clear;
  cbFechaEnvioHasta.Clear;
  edCodigoAp.Clear;
  rgEstado.ItemIndex := 0;
end;

procedure TfrmFFEPEnvios.tbRespuestaClick(Sender: TObject);
begin
  ImpoExpoWizard('SRTFR');
end;

procedure TfrmFFEPEnvios.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    mskPeriodo.Clear;
    fraMotivo.Clear;
    mObservacion.Clear;
    fpBaja.ShowModal;
  end;
end;

procedure TfrmFFEPEnvios.btnAceptarClick(Sender: TObject);
var i: integer;
begin
  Verificar(mskPeriodo.Text = '', mskPeriodo, 'Debe completar el período');
  Verificar(fraMotivo.IsEmpty, fraMotivo, 'Debe seleccionar un motivo');
  Verificar((framotivo.Especial1 = 'S') and (mObservacion.Lines.Text = ''), mObservacion, 'Debe completar la observación');
  if (msgBox('¿Está seguro que desea dar de baja el/los registro(s) seleccionado(s)?', MB_YESNO) = IDYES) then
  begin
    for i := 0 to grid.SelectedRows.Count - 1 do
    begin
      grid.GotoSelection(i);
      if sdqConsulta.FieldByName('codigo_srt').AsString <> '' then
        try
          EjecutarSqlEx(' BEGIN ' +
                        ' ART.SRT.do_baja_pago_ffep(:nroSRT, :periodo, :motivo, :observ); ' +
                        ' END; ', [sdqConsulta.FieldByName('codigo_srt').AsString, mskPeriodo.Text, fraMotivo.Codigo, mObservacion.Lines.Text]);
        except
          ShowMessage('No se pudo realizar la baja');
        end;
    end;
  end;
  fpBaja.ModalResult := mrOK;
end;

procedure TfrmFFEPEnvios.tbProcMensClick(Sender: TObject);
begin
  ImpoExpoWizard('SRT_F');
end;

procedure TfrmFFEPEnvios.tbEnvJuicioClick(Sender: TObject);
begin
  ImpoExpoWizard('SRT_J');
end;

end.
