unit unSiniestrosNoAutorizados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RxToolEdit, DateComboBox, SinEdit, unFraTrabajador, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmSiniestrosNoAutorizados = class(TfrmCustomConsulta)
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaFEVENTO: TDateTimeField;
    sdqConsultaFACCIDENTE: TDateTimeField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaTRABAJADOR: TStringField;
    sdqConsultaCONTRATO: TFloatField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaEMPRESA: TStringField;
    sdqConsultaPORCINCA: TFloatField;
    sdqConsultaCOMISION: TStringField;
    sdqConsultaGRADO: TStringField;
    sdqConsultaCARACTER: TStringField;
    sdqConsultaFBAJA: TDateTimeField;
    ShortCutControl1: TShortCutControl;
    gbFechaAccidente: TGroupBox;
    Label1: TLabel;
    dcFechaAccDesde: TDateComboBox;
    dcFechaAccHasta: TDateComboBox;
    gbFechaEvento: TGroupBox;
    Label2: TLabel;
    dcFechaEventoDesde: TDateComboBox;
    dcFechaEventoHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    fraTrabajador: TfraTrabajador;
    GroupBox3: TGroupBox;
    edSiniestro: TSinEdit;
    rgVerBajas: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
      var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSiniestrosNoAutorizados: TfrmSiniestrosNoAutorizados;

implementation

{$R *.dfm}

uses unDmPrincipal, CustomDlgs;

procedure TfrmSiniestrosNoAutorizados.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('FBAJA').AsString <> '' then
    AFont.Color := clRed;

end;

procedure TfrmSiniestrosNoAutorizados.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  dcFechaAccDesde.Clear;
  dcFechaAccHasta.Clear;
  dcFechaEventoDesde.Clear;
  dcFechaEventoHasta.Clear;
  fraEmpresa.Clear;
  fraTrabajador.Clear;
  edSiniestro.Clear;
  rgVerBajas.ItemIndex := 1;
end;

procedure TfrmSiniestrosNoAutorizados.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  Verificar((dcFechaAccDesde.IsEmpty and dcFechaAccHasta.IsEmpty and dcFechaEventoDesde.IsEmpty and dcFechaEventoHasta.IsEmpty), pnlfiltros, 'Debe especificar un rango de fechas' );
  ssql := ' SELECT /*+RULE */ ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINIESTRO, EV_FECHA FEVENTO,' +
          '       EX_FECHAACCIDENTE FACCIDENTE, ART.UTILES.ARMAR_CUIT(TJ_CUIL) CUIL, TJ_NOMBRE TRABAJADOR, EX_CONTRATO' +
          '       CONTRATO, ART.UTILES.ARMAR_CUIT(EM_CUIT) CUIT, EM_NOMBRE EMPRESA, EV_PORCINCAPACIDAD PORCINCA, CM_DESCRIPCION' +
          '       COMISION, DECODE(EV_GRADO, ''P'', ''PARCIAL'', ''T'', ''TOTAL'', NULL) GRADO, DECODE(EV_CARACTER, ''P'', ''PROVISORIO'',' +
          '       ''D'', ''DEFINITIVO'', NULL) CARACTER, ART.INCA.GET_FBAJANOLIQUIDAR(EV_IDEVENTO, EV_IDEXPEDIENTE) FBAJA ' +
          '  FROM ART.SEV_EVENTOSDETRAMITE, ART.SEX_EXPEDIENTES, SIN.SEI_EVENTOINCAPACIDAD, SIN.SCM_COMISIONMEDICA,' +
          '       CTJ_TRABAJADOR, AEM_EMPRESA' +
          ' WHERE EV_IDEXPEDIENTE = EX_ID' +
          '   AND EV_CODIGO = EI_CODIGO' +
          '   AND EV_COMISION = CM_CODIGO(+)' +
          '   AND EX_IDTRABAJADOR = TJ_ID' +
          '   AND EX_CUIT = EM_CUIT' +
          '   AND EI_NOAUTORIZA = ''S''' +
          '   AND EV_EVENTO <> 0' +
          '   AND EV_FECHAALTA > TO_DATE(''01/05/2014'', ''DD/MM/YYYY'')';

  if not dcFechaAccDesde.IsEmpty then
    ssql := ssql + ' AND EX_FECHAACCIDENTE >= ' + dcFechaAccDesde.SqlText;

  if not dcFechaAccHasta.IsEmpty then
    ssql := ssql + ' AND EX_FECHAACCIDENTE <= ' + dcFechaAccHasta.SqlText;

  if not dcFechaEventoDesde.IsEmpty then
    ssql := ssql + ' AND EV_FECHA >= ' + dcFechaEventoDesde.SqlText;

  if not dcFechaEventoHasta.IsEmpty then
    ssql := ssql + ' AND EV_FECHA <= ' + dcFechaEventoHasta.SqlText;

  if not fraEmpresa.IsEmpty then
    ssql := ssql + ' AND EM_ID = ' + inttostr(fraEmpresa.ID);

  if not fraTrabajador.IsEmpty then
    ssql := ssql + ' AND TJ_ID = ' + inttostr(fraTrabajador.IdTrabajador);

  if not edSiniestro.IsEmpty then
  begin
    ssql := ssql + ' AND EX_SINIESTRO = ' + edSiniestro.SiniestroS;
    ssql := ssql + ' AND EX_ORDEN = ' + edSiniestro.OrdenS;
    ssql := ssql + ' AND EX_RECAIDA = ' + edSiniestro.RecaidaS;
  end;

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND art.inca.get_fbajanoliquidar(ev_idevento, ev_idexpediente) IS NOT NULL ';
    1: ssql := ssql + ' AND art.inca.get_fbajanoliquidar(ev_idevento, ev_idexpediente) IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;
  inherited;

end;

end.
