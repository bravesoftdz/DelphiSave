unit unListControversiaReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, StdCtrls, Mask, ToolEdit, DateComboBox,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, SinEdit;

type
  TfrmListControversiaReserva = class(TfrmCustomConsulta)
    gbConcepto: TGroupBox;
    rbTipoTodos: TRadioButton;
    rbTipoReserva: TRadioButton;
    rbTipoControversia: TRadioButton;
    gbFechaControversia: TGroupBox;
    Label1: TLabel;
    dcContDesde: TDateComboBox;
    dcContHasta: TDateComboBox;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    GroupBox1: TGroupBox;
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
  frmListControversiaReserva: TfrmListControversiaReserva;

implementation

uses Math, AnsiSql;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmListControversiaReserva.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT art.utiles.armar_siniestro(eb_siniestro, eb_orden, eb_recaida) siniestro, ' +
                ' eb_codigo, eb_grupofamiliar, eb_nombre, eb_documento, eb_porcentaje, ' +
                ' art.utiles.armar_cuit(ex_cuil) cuil, art.utiles.armar_cuit(ex_cuit) cuit, ' +
                ' em_nombre empresa, parentezco.tb_descripcion descrparentezco, ' +
                ' DECODE(eb_controversia, ''C'', ''Controversia'', ''R'', ''Reserva'') controversia, ' +
                ' eb_controversiadesde, eb_controversiahasta, eb_fechabaja ' +
           ' FROM art.seb_beneficiarios, art.sex_expedientes, aem_empresa, ' +
                ' art.ctb_tablas parentezco ' +
          ' WHERE eb_siniestro = ex_siniestro ' +
            ' AND eb_orden = ex_orden ' +
            ' AND eb_recaida = ex_recaida ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND eb_caracter = parentezco.tb_codigo(+) ' +
            ' AND parentezco.tb_clave(+) = ''PAREN'' ';

  if rbTipoTodos.Checked then
    sSql := sSql + ' AND eb_controversia IN (''C'', ''R'') '
  else if rbTipoControversia.Checked then
    sSql := sSql + ' AND eb_controversia = ''C'' '
  else if rbTipoReserva.Checked then
    sSql := sSql + ' AND eb_controversia = ''R'' ';

  if not(dcContDesde.IsEmpty) then
    sSql := sSql + ' AND eb_controversiadesde >= ' + SqlDate(dcContDesde.Date);

  if not(dcContHasta.IsEmpty) then
    sSql := sSql + ' AND eb_controversiadesde <= ' + SqlDate(dcContHasta.Date);

  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND eb_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND eb_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND eb_recaida = ' + SqlInt(edSiniestro.Recaida);

  if rbActivoSi.Checked then
    sSql := sSql + ' AND eb_fechabaja IS NULL '
  else if rbActivoNo.Checked then
    sSql := sSql + ' AND eb_fechabaja IS NOT NULL';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListControversiaReserva.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  rbTipoTodos.Checked := True;
  rbActivoSi.Checked  := True;
  dcContDesde.Clear;
  dcContHasta.Clear;
  edSiniestro.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListControversiaReserva.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqconsulta.FieldByName('eb_fechabaja').IsNull then
     AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListControversiaReserva.QueryPrintGetCellParams(
  Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
  var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if sdqconsulta.FieldByName('eb_fechabaja').IsNull then
    AFont.Color := ClBlack
  else
    AFont.Color := ClSilver;
end;
{-------------------------------------------------------------------------------}
end.
