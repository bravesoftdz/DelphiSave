unit unSegRemisionFondos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  FormPanel, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraTrabajador,
  unFraTrabajadorSiniestro, Vcl.Mask, RxToolEdit, DateComboBox, unFraEmpresa,
  unFraCodigoDescripcion, unfraCtbTablas;

type
  TfrmSegRemisionFondos = class(TfrmCustomConsulta)
    sdqConsultaIDCASO: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaNUMLIQ: TFloatField;
    sdqConsultaFACCID: TDateTimeField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaTRABAJADOR: TStringField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaEMPRESA: TStringField;
    sdqConsultaCONPAGO: TStringField;
    sdqConsultaJUICIO: TStringField;
    sdqConsultaMONTO: TFloatField;
    sdqConsultaLIQUIDADOR: TStringField;
    sdqConsultaFAPROBACION: TDateTimeField;
    sdqConsultaUSUAPROBACION: TStringField;
    sdqConsultaFORMAPAGO: TStringField;
    sdqConsultaBANCO: TStringField;
    sdqConsultaCHEQUENOMBRE: TStringField;
    sdqConsultaOPAGO: TFloatField;
    sdqConsultaNROCHEQUE: TFloatField;
    sdqConsultaFECHACHEQUE: TDateTimeField;
    sdqConsultaBENEFCHEQUE: TStringField;
    sdqConsultaFECHADEBITADO: TDateTimeField;
    sdqConsultaFECHASITUACION: TDateTimeField;
    sdqConsultaSITPAGO: TStringField;
    sdqConsultaFRESPBANCO: TDateTimeField;
    sdqConsultaRESPUESTABANCO: TStringField;
    sdqConsultaANTERIORESSINCOBRAR: TStringField;
    fpHistorialEstados: TFormPanel;
    Bevel1: TBevel;
    Button1: TButton;
    GridHistoricoEstados: TArtDBGrid;
    sdqHistorialEstados: TSDQuery;
    dsHistorialEstados: TDataSource;
    sdqHistorialEstadosESTADOCHEQUE: TStringField;
    sdqHistorialEstadosFECHAESTADO: TDateTimeField;
    sdqHistorialEstadosSITUACION: TStringField;
    sdqHistorialEstadosFECHASIT: TDateTimeField;
    sdqHistorialEstadosUSUARIOSIT: TStringField;
    sdqHistorialEstadosFECHADEBITADO: TDateTimeField;
    fpAccionesRealizadas: TFormPanel;
    Bevel2: TBevel;
    Button2: TButton;
    GridAccionesRealizadas: TArtDBGrid;
    sdqAccionesRealizadas: TSDQuery;
    dsAccionesRealizadas: TDataSource;
    sdqAccionesRealizadasFECHAACCION: TDateTimeField;
    sdqAccionesRealizadasUSUARIOACCION: TStringField;
    sdqAccionesRealizadasACCION: TStringField;
    sdqAccionesRealizadasAR_OBSERVACION: TStringField;
    tbHistorialEstados: TToolButton;
    tbAccionesRealizadas: TToolButton;
    sdqConsultaCE_ID: TFloatField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dcDesdeCheque: TDateComboBox;
    dcHastaCheque: TDateComboBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dcDesdeAprobLiq: TDateComboBox;
    dcHastaAprobLiq: TDateComboBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    dcDesdeRespBco: TDateComboBox;
    dcHastaRespBco: TDateComboBox;
    GroupBox4: TGroupBox;
    fraTrabajadorSiniestro: TfraTrabajadorSiniestro;
    rgConAccion: TRadioGroup;
    rgVerBajas: TRadioGroup;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    dcDesdeAccid: TDateComboBox;
    dcHastaAccid: TDateComboBox;
    gbConceptoPago: TGroupBox;
    fraConceptoPago: TfraCodigoDescripcion;
    gbMetodoPago: TGroupBox;
    gbSituacionPago: TGroupBox;
    fraSituacionPago: TfraCodigoDescripcion;
    GroupBox8: TGroupBox;
    Label5: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    sdqConsultaRF_FECHABAJA: TDateTimeField;
    fraMetodoPago: TfraCtbTablas;
    fpRealizarAccion: TFormPanel;
    Bevel3: TBevel;
    Label6: TLabel;
    btnAceptarRealizarAccion: TButton;
    Button3: TButton;
    fraAccion: TfraCodigoDescripcion;
    Label7: TLabel;
    mObservaciones: TMemo;
    tbRealizarAccion: TToolButton;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbHistorialEstadosClick(Sender: TObject);
    procedure tbAccionesRealizadasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
    procedure tbRealizarAccionClick(Sender: TObject);
    procedure btnAceptarRealizarAccionClick(Sender: TObject);
    procedure fpRealizarAccionShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSegRemisionFondos: TfrmSegRemisionFondos;

implementation

{$R *.dfm}

uses CustomDlgs, unDmPrincipal, unSesion;

procedure TfrmSegRemisionFondos.btnAceptarRealizarAccionClick(Sender: TObject);
var ssql: string;
begin
  Verificar(fraAccion.IsEmpty, fraAccion, 'Debe seleccionar una acción');

  ssql := ' insert into din.dar_accionesrealizadasrf(ar_idcaso, ar_idaccion, ar_observacion, ar_fechaalta, ar_usualta) ' +
          '                                 values(:idcaso, :idaccion, :observ, trunc(sysdate), :usu)';
  EjecutarSqlEx(ssql, [sdqConsulta.FieldByName('idcaso').AsInteger, fraAccion.Codigo, mObservaciones.Text, Sesion.UserID]);
  fpRealizarAccion.ModalResult := mrOk;
end;

procedure TfrmSegRemisionFondos.FormCreate(Sender: TObject);
begin
  inherited;
  with fraConceptoPago do
  begin
    TableName := 'art.scp_conpago';
    FieldID := 'CP_CONPAGO';
    FieldCodigo := 'CP_CONPAGO';
    FieldDesc := 'CP_DENPAGO';
    FieldBaja := 'CP_FBAJA'
  end;

  fraMetodoPago.Clave := 'COBRO';

  with fraSituacionPago do
  begin
    TableName := 'art.ctb_tablas';
    FieldID := 'tb_codigo';
    FieldCodigo := 'tb_codigo';
    FieldDesc := 'tb_descripcion';
    FieldBaja := 'tb_fechabaja';
    Sql := 'SELECT tb_codigo AS id, tb_codigo AS codigo, tb_descripcion AS descripcion, tb_fechabaja AS baja' +
           '  FROM ctb_tablas' +
           ' WHERE tb_clave = ''SITCH''' +
           '   AND tb_fechabaja IS NULL' +
           '   AND tb_codigo <> ''0''';
  end;


  with fraAccion do
  begin
    TableName := 'din.dac_accionescasosrf';
    FieldID := 'ac_id';
    FieldCodigo := 'ac_codigo';
    FieldDesc := 'ac_descripcion';
    FieldBaja := 'ac_fechabaja'
  end;

  tbRealizarAccion.Left := 190;
  tbAccionesRealizadas.Left := tbRealizarAccion.Left + 5;
  tbHistorialEstados.Left := tbAccionesRealizadas.Left + 5;

end;

procedure TfrmSegRemisionFondos.fpRealizarAccionShow(Sender: TObject);
begin
  fraAccion.Clear;
  mObservaciones.Clear;

end;

procedure TfrmSegRemisionFondos.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqConsulta.FieldByName('rf_fechabaja').IsNull) then
    AFont.Color := clRed;

end;

procedure TfrmSegRemisionFondos.tbAccionesRealizadasClick(Sender: TObject);
begin
  with sdqAccionesRealizadas do
  begin
    Close;
    ParamByName('idcaso').AsInteger := sdqConsulta.FieldByName('idcaso').AsInteger;
    Open;
  end;

  fpAccionesRealizadas.ShowModal;

end;

procedure TfrmSegRemisionFondos.tbHistorialEstadosClick(Sender: TObject);
begin
  with sdqHistorialEstados do
  begin
    Close;
    ParamByName('idchequeemitido').AsInteger := sdqConsulta.FieldByName('ce_id').AsInteger;
    Open;
  end;

  fpHistorialEstados.ShowModal;

end;

procedure TfrmSegRemisionFondos.tbLimpiarClick(Sender: TObject);
begin
  dcDesdeCheque.Clear;
  dcHastaCheque.Clear;
  dcDesdeAprobLiq.Clear;
  dcHastaAprobLiq.Clear;
  dcDesdeAccid.Clear;
  dcHastaAccid.Clear;
  dcDesdeRespBco.Clear;
  dcHastaRespBco.Clear;
  fraEmpresaFiltro.Clear;
  fraTrabajadorSiniestro.Clear;
  fraConceptoPago.Clear;
  fraSituacionPago.Clear;
  fraMetodoPago.Clear;
  rgVerBajas.ItemIndex := 1;
  rgConAccion.ItemIndex := 2;

end;

procedure TfrmSegRemisionFondos.tbRealizarAccionClick(Sender: TObject);
begin
  fpRealizarAccion.ShowModal;

end;

procedure TfrmSegRemisionFondos.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin
  ssql := 'SELECT rf_id idcaso, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, le_numliqui' +
          '       numliq, ex_fechaaccidente faccid, art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre trabajador,' +
          '       art.utiles.armar_cuit(em_cuit) cuit, em_nombre empresa, cp_denpago conpago,' +
          '       art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio, le_imporperi monto, le_usualta' +
          '       liquidador, le_faprobado faprobacion, le_aprobado usuaprobacion, mp.tb_descripcion formapago, ba.ba_nombre' +
          '       banco, le_chequenombre chequenombre, ce_ordenpago opago, ce_numero nrocheque, ce_fechacheque fechacheque,' +
          '       ce_beneficiario benefcheque, ce_fechadebitado fechadebitado, ce_fechasituacion fechasituacion,' +
          '       sit.tb_descripcion sitpago, ce_fecharespuestabapro frespbanco, sit.tb_descripcion respuestabanco, NVL((SELECT' +
          '                                                                                                                     ''S''' +
          '                                                                                                                FROM rce_chequeemitido b' +
          '                                                                                                               WHERE b.ce_idtrabajador = a.ce_idtrabajador' +
          '                                                                                                                 AND b.ce_id < a.ce_id' +
          '                                                                                                                 AND b.ce_estado = ''01''' +
          '                                                                                                                 AND b.ce_fechadebitado IS NULL' +
          '                                                                                                                 AND ROWNUM = 1), ''N'') anterioressincobrar, ' +
          '       ce_id, rf_fechabaja ' +
          '  FROM din.drf_casosremisionfondos, art.sle_liquiempsin, art.sex_expedientes, rce_chequeemitido a,' +
          '       ctj_trabajador, aem_empresa, art.ctb_tablas mp, zba_banco ba, art.ctb_tablas sit, art.scp_conpago,' +
          '       art.ctb_tablas res' +
          ' WHERE rf_idliquidacion = le_id' +
          '   AND le_idexpediente = ex_id' +
          '   AND ex_idtrabajador = tj_id' +
          '   AND ex_cuit = em_cuit' +
          '   AND mp.tb_clave = ''COBRO''' +
          '   AND mp.tb_codigo = le_metodopago' +
          '   AND le_idbanco = ba.ba_id(+)' +
          '   AND le_idchequeemitido = ce_id' +
          '   AND sit.tb_clave(+) = ''SITCH''' +
          '   AND sit.tb_codigo(+) = ce_situacion' +
          '   AND le_conpago = cp_conpago' +
          '   AND res.tb_clave(+) = ''TRABP''' +
          '   AND res.tb_codigo(+) = ce_respuestabapro' +
          '   AND cp_tipo IN(''P'', ''I'', ''M'')';

  if not dcDesdeCheque.IsEmpty then
    ssql := ssql + ' AND TRUNC(ce_fechacheque) >= ' + dcDesdeCheque.SqlText;

  if not dcHastaCheque.IsEmpty then
    ssql := ssql + ' AND TRUNC(ce_fechacheque) <= ' + dcHastaCheque.SqlText;

  if not dcDesdeAprobLiq.IsEmpty then
    ssql := ssql + ' AND TRUNC(le_faprobado) >= ' + dcDesdeAprobLiq.SqlText;

  if not dcHastaAprobLiq.IsEmpty then
    ssql := ssql + ' AND TRUNC(le_faprobado) <= ' + dcHastaAprobLiq.SqlText;

  if not dcDesdeAccid.IsEmpty then
    ssql := ssql + ' AND TRUNC(ex_fechaaccidente) >= ' + dcDesdeAccid.SqlText;

  if not dcHastaAccid.IsEmpty then
    ssql := ssql + ' AND TRUNC(ex_fechaaccidente) <= ' + dcHastaAccid.SqlText;

  if not dcDesdeRespBco.IsEmpty then
    ssql := ssql + ' AND TRUNC(ce_fecharespuestabapro) >= ' + dcDesdeRespBco.SqlText;

  if not dcHastaRespBco.IsEmpty then
    ssql := ssql + ' AND TRUNC(ce_fecharespuestabapro) <= ' + dcHastaRespBco.SqlText;

  if not fraEmpresaFiltro.IsEmpty then
    ssql := ssql + ' AND EM_ID = ' + IntToStr(fraEmpresaFiltro.ID);

  if not fraTrabajadorSiniestro.IsEmpty then
    ssql := ssql + ' AND TJ_ID = ' + IntToStr(fraTrabajadorSiniestro.IdTrabajador);

  if not fraConceptoPago.IsEmpty then
    ssql := ssql + ' AND cp_conpago = ' + fraConceptoPago.Codigo;

  if not fraSituacionPago.IsEmpty then
    ssql := ssql + ' AND ce_situacion = ' + fraSituacionPago.Codigo;

  if not fraMetodoPago.IsEmpty then
    ssql := ssql + ' AND le_metodopago = ' + QuotedStr(fraMetodoPago.Codigo);

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND RF_FECHABAJA IS NOT NULL ';
    1: ssql := ssql + ' AND RF_FECHABAJA IS NULL';
  end;

  case rgConAccion.ItemIndex of
    0: ssql := ssql + ' AND art.dinerarias.is_tieneaccionremisionfondos(rf_id) = ''S'' ';
    1: ssql := ssql + ' AND art.dinerarias.is_tieneaccionremisionfondos(rf_id) = ''N'' ';
  end;


  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

end.
