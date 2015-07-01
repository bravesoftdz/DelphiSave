unit unListSiniestrosConEmbargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, SinEdit, StdCtrls, Mask, ToolEdit,
  DateComboBox, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmListSiniestrosConEmbargo = class(TfrmCustomConsulta)
    gbTipoEmbargo: TGroupBox;
    rbTipoTodos: TRadioButton;
    rbTipoSumaFija: TRadioButton;
    rbTipoPorcentaje: TRadioButton;
    gbFechaEmbargo: TGroupBox;
    Label1: TLabel;
    dcEmbDesde: TDateComboBox;
    dcEmbHasta: TDateComboBox;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    gbActivos: TGroupBox;
    rbActivoTodos: TRadioButton;
    rbActivoNo: TRadioButton;
    rbActivoSi: TRadioButton;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
      var AText: String; var AFont: TFont; var ABackground: TColor;
      var AAlignment: TAlignment);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListSiniestrosConEmbargo: TfrmListSiniestrosConEmbargo;

implementation

uses AnsiSql;

{$R *.dfm}

procedure TfrmListSiniestrosConEmbargo.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' art.utiles.armar_cuit(ex_cuil) cuil, art.utiles.armar_cuit(ex_cuit) cuit, ' +
                ' em_nombre empresa, tj_nombre trabajador, ce_tipo, ce_porcentaje, ce_sumafija, ' +
                ' DECODE(ce_tipo, ''P'', ''Porcentaje'', ''S'', ''Suma fija'') tipo, ' +
                ' ce_formapago, ce_enviofondos, ce_chequenombre, ce_recibos, ' +
                ' ce_fechaalta, ce_fechabaja, ba_nombrecorto ' +
           ' FROM sin.sce_siniestrosconembargo, art.sex_expedientes, aem_empresa, ' +
                ' ctj_trabajador, zba_banco ' +
          ' WHERE ce_idexpediente = ex_id ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND ex_idtrabajador = tj_id ' +
            ' AND ce_idbanco = ba_id(+)' ;

  if rbTipoPorcentaje.Checked then
    sSql := sSql + ' AND ce_tipo = ''P'' '
  else if rbTipoSumaFija.Checked then
    sSql := sSql + ' AND ce_tipo = ''S'' ';

  if not(dcEmbDesde.IsEmpty) then
    sSql := sSql + ' AND ce_fechaalta >= ' + SqlDate(dcEmbDesde.Date);

  if not(dcEmbHasta.IsEmpty) then
    sSql := sSql + ' AND ce_fechaalta <= ' + SqlDate(dcEmbHasta.Date);

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida);

  if rbActivoSi.Checked then
    sSql := sSql + ' AND ce_fechabaja IS NULL ' +
                   ' AND ((ce_tipo = ''P'') OR ((ce_tipo = ''S'') AND (ce_sumafija > 0))) '
  else if rbActivoNo.Checked then
    sSql := sSql + ' AND ((ce_fechabaja IS NOT NULL) ' +
                    ' OR ((ce_tipo = ''S'') AND (ce_sumafija = 0))) ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConEmbargo.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  rbTipoTodos.Checked := True;
  rbActivoSi.Checked  := True;
  dcEmbDesde.Clear;
  dcEmbHasta.Clear;
  edSiniestro.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConEmbargo.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not(sdqconsulta.FieldByName('ce_fechabaja').IsNull) or
    ((sdqConsulta.FieldByName('ce_tipo').AsString = 'S') and
     (sdqConsulta.FieldByName('ce_sumafija').AsCurrency = 0)) then
     AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListSiniestrosConEmbargo.QueryPrintGetCellParams(
  Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
  var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if sdqconsulta.FieldByName('ce_fechabaja').IsNull and
    ((sdqConsulta.FieldByName('ce_tipo').AsString = 'P') or
     ((sdqConsulta.FieldByName('ce_tipo').AsString = 'S') and
      (sdqConsulta.FieldByName('ce_sumafija').AsCurrency > 0))) then
    AFont.Color := ClBlack
  else
    AFont.Color := ClSilver;
end;
{-------------------------------------------------------------------------------}
end.
