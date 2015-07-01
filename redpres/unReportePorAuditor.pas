unit unReportePorAuditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RxToolEdit, DateComboBox, unArtFrame, unfraUsuarios,
  unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmReportePorAuditor = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    Label1: TLabel;
    dcFecDesde: TDateComboBox;
    dcFecHasta: TDateComboBox;
    gbUsuario: TGroupBox;
    fraUsuario: TfraUsuario;
    gbConPago: TGroupBox;
    fraConPago: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    sdqConsultaUSUARIOAUD: TStringField;
    sdqConsultaMESPAGO: TStringField;
    sdqConsultaAUDITADO: TStringField;
    sdqConsultaDEBITADO: TStringField;
    sdqConsultaDebAud: TStringField;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportePorAuditor: TfrmReportePorAuditor;

implementation

{$R *.dfm}

uses CustomDlgs, unSesion, VCLExtra;

procedure TfrmReportePorAuditor.FormCreate(Sender: TObject);
begin
  inherited;
  fraUsuario.Sector := 'AUDILIQ';
  fraUsuario.ShowBajas := False;
  fraUsuario.Cargar(Sesion.UserID);
  fraUsuario.UsuariosGenericos := False;
  vclextra.LockControls(fraUsuario, not Seguridad.Claves.IsActive('CambiarUsuario'));

  with fraConPago do
  begin
    TableName := 'scp_conpago';
    FieldID := 'cp_conpago';
    FieldCodigo := 'cp_conpago';
    FieldDesc := 'cp_denpago';
    ExtraCondition := ' AND cp_indicadoramf = ''S'' ';
  end;
end;

procedure TfrmReportePorAuditor.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName('AUDITADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('AUDITADO')).Currency := True;

  if sdqConsulta.FieldByName('DEBITADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEBITADO')).Currency := True;

end;

procedure TfrmReportePorAuditor.tbImprimirClick(Sender: TObject);
var cTotalAuditado, cTotalDebitado: currency;
begin
  cTotalAuditado := 0;
  cTotalDebitado := 0;

  sdqConsulta.First;
  while not sdqConsulta.Eof do
  begin
    cTotalAuditado := cTotalAuditado + sdqConsulta.FieldByName('AUDITADO').AsCurrency;
    cTotalDebitado := cTotalDebitado + sdqConsulta.FieldByName('DEBITADO').AsCurrency;
    sdqConsulta.Next;
  end;

  QueryPrint.Footer.Text := 'Total auditado: $' + CurrToStr(cTotalAuditado) + '  -  Total debitado $' + CurrToStr(cTotalDebitado);

  inherited;

end;

procedure TfrmReportePorAuditor.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  dcFecDesde.Clear;
  dcFecHasta.Clear;
  fraUsuario.Clear;
  fraConPago.Clear;
end;

procedure TfrmReportePorAuditor.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  Verificar((dcFecDesde.IsEmpty) or (dcFecHasta.IsEmpty), gbFecha, 'Debe especificar un rango de fechas');

  ssql := 'SELECT usuarioaud, mespago, NVL(SUBSTR(ROUND(TRUNC(auditado), -3), 1, LENGTH(TRUNC(auditado)) - 3), ''0'') auditado,' +
          '       NVL(SUBSTR(ROUND(TRUNC(debitado), -3), 1, LENGTH(TRUNC(debitado)) - 3), ''0'') debitado, ROUND((debitado * 100) /' +
          '       auditado, 1) || ''%'' "% Deb/Aud"' +
          '  FROM (SELECT usuarioaud, TO_CHAR(vo_fechapago, ''MM-YYYY'') mespago, SUM(iv_impfacturado) auditado,' +
          '               SUM(DECODE(iv_motivodebito, ''06'',(iv_impfacturado - iv_imppagconret), 0)) debitado' +
          '          FROM (SELECT hv_usualta usuarioaud, vo_fechapago, vo_volante, iv_impfacturado, iv_imppagconret,' +
          '                       iv_numvolante, iv_motivodebito' +
          '                  FROM art.svo_volantes a, art.siv_itemvolante b, art.cpr_prestador c, art.mtp_tipoprestador d, art.scp_conpago' +
          '                       e, art.shv_historicovolante f' +
          '                 WHERE cp_conpago = iv_conpago' +
          '                   AND vo_volante = iv_volante' +
          '                   AND ca_identificador = vo_prestador' +
          '                   AND tp_codigo = ca_especialidad' +
          '                   AND vo_volante = hv_volante' +
          '                   AND hv_id = (SELECT MIN(hv_id)' +
          '                                  FROM art.shv_historicovolante g, art.use_usuarios' +
          '                                 WHERE hv_usualta = se_usuario' +
          '                                   AND se_sector = ''AUDILIQ''' +
          '                                   AND g.hv_volante = vo_volante' +
          '                                   AND g.hv_estado IN(''P'', ''PV'')' +
          '                                   AND g.hv_fechaalta >= vo_fecharecepaudit)' +
                          '   AND iv_estado IN(''A1'', ''A2'', ''A3'', ''A4'', ''A5'', ''A6'', ''A7'', ''A'')' +
                          '   AND iv_auditado = ''S''' +
                          '   AND vo_estado IN(''E'', ''EG'', ''EM'')' +
                          '   AND cp_indicadoramf = ''S''' +
                          '   AND tp_indicadoramf = ''S''' +
                          '   AND iv_impfacturado > 0' +
                          '   AND VO_FECHAPAGO BETWEEN ' + dcFecDesde.SqlText + ' AND ' + dcFecHasta.SqlText;

  if not fraConPago.IsEmpty then
    ssql := ssql + ' AND IV_CONPAGO = ' + fraConPago.Codigo;

  if not fraUsuario.IsEmpty then
    ssql := ssql + ' AND hv_usualta = ' + QuotedStr(fraUsuario.UserID);

  ssql := ssql +
          ') WHERE 1 = 1' +
          ' GROUP BY USUARIOAUD, TO_CHAR(VO_FECHAPAGO, ''MM-YYYY''))';

  sdqConsulta.SQL.Text := ssql;
  inherited;

end;

end.
