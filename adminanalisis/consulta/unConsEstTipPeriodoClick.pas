unit unConsEstTipPeriodoClick;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, ComboEditor, CheckCombo, DBCheckCombo, PeriodoPicker;

type
  TfrmConsEstTipPeriodoClick = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    edPeriodoDesde: TPeriodoPicker;
    Label1: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    GroupBox2: TGroupBox;
    cmbTipos: TDBCheckCombo;
    sdqTipos: TSDQuery;
    dsTipos: TDataSource;
    procedure tbRefrescarClick(Sender: TObject);
  private
  public
  end;

var
  frmConsEstTipPeriodoClick: TfrmConsEstTipPeriodoClick;

implementation

uses unPrincipal, AnsiSql, SqlFuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsEstTipPeriodoClick.tbRefrescarClick(Sender: TObject);
Var sSql,
    sCond : String;
begin
{
SELECT TO_CHAR(ET_FECHALTA, 'YYYY/MM') PERIODO, ET_TIPO, COUNT(DISTINCT ET_CUIL)
FROM AET_ESTRAB
GROUP BY TO_CHAR(ET_FECHALTA, 'YYYY/MM'), ET_TIPO
ORDER BY PERIODO, ET_TIPO
}

  sSql := 'SELECT TO_CHAR(ET_FECHA, ''MM/YYYY'') PERIODO, ET_TIPO, COUNT(DISTINCT ET_CUIT) ' +
            'FROM AET_ESTRAB ' +
           'GROUP BY TO_CHAR(ET_FECHA, ''MM/YYYY''), ET_TIPO ' +
           SortDialog.OrderBy;

  sCond := SqlBetween( 'TO_CHAR(ET_FECHA, ''MM/YYYY'')', edPeriodoDesde.Text, edPeriodoHasta.Text);
  if sCond <> '' Then
     AddCondition( sSql, sCond );

  if cmbTipos.Text <> '' Then
     AddCondition( sSql, 'ET_TIPO ' + cmbTipos.InSql );

  sdqConsulta.SQL.Text := sSql;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
