unit unListHistoricoVolante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, PatternEdit, ComboEditor, CheckCombo, DBCheckCombo,
  StdCtrls, Mask, ToolEdit, DateComboBox, CheckPanel;

type
  TfrmListHistoricoVolante = class(TfrmCustomConsulta)
    pnlFecha: TCheckPanel;
    Label1: TLabel;
    deFechaDesde: TDateComboBox;
    deFechaHasta: TDateComboBox;
    pnlEstado: TCheckPanel;
    cmbEstados: TDBCheckCombo;
    dsEstados: TDataSource;
    sdqEstados: TSDQuery;
    procedure pnlFechaChange(Sender: TObject);
    procedure pnlEstadoChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
  public
  end;

var
  frmListHistoricoVolante: TfrmListHistoricoVolante;

implementation

{$R *.dfm}

procedure TfrmListHistoricoVolante.pnlFechaChange(Sender: TObject);
begin
  if not pnlFecha.Checked then
  begin
    deFechaDesde.Clear;
    deFechaHasta.Clear;
  end;
end;

procedure TfrmListHistoricoVolante.pnlEstadoChange(Sender: TObject);
begin
  if not pnlEstado.Checked then
    cmbEstados.Clear;
end;

procedure TfrmListHistoricoVolante.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  pnlFecha.Checked  := False;
  pnlEstado.Checked := False;
end;

procedure TfrmListHistoricoVolante.FormCreate(Sender: TObject);
begin
  inherited;
  sdqEstados.Open;
end;

procedure TfrmListHistoricoVolante.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT hv_volante, tb_descripcion, hv_fechaalta, hv_usualta, ca_descripcion, ca_identificador,' +
          ' art.amebpba.get_estadoprevio_vol(hv_volante,hv_id) anterior' +
     ' FROM ctb_tablas, svo_volantes, cpr_prestador, shv_historicovolante' +
    ' WHERE hv_volante = vo_volante' +
      ' AND vo_prestador = ca_identificador' +
      ' AND hv_estado = tb_codigo' +
      ' AND tb_clave = ''MUVOL''';

  if pnlFecha.Checked then
    if (deFechaDesde.Date <> 0) and (deFechaHasta.Date <> 0) then
      sSql := sSql +
        ' AND hv_fechaalta BETWEEN ' + deFechaDesde.SqlText +
        ' AND ' + deFechaHasta.SqlText
    else if (deFechaDesde.Date <> 0) then
      sSql := sSql + ' AND hv_fechaalta > ' + deFechaDesde.SqlText
    else if (deFechaHasta.Date <> 0) then
      sSql := sSql + ' AND hv_fechaalta < ' + deFechaHasta.SqlText;

  if pnlEstado.Checked and (cmbEstados.Text <> '') then
    sSql := sSql + ' AND hv_estado ' +  cmbEstados.InSql;

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

end.
