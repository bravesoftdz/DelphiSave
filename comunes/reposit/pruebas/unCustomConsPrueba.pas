unit unCustomConsPrueba;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, StdCtrls, IntEdit, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, Grids, DBGrids, RXDBCtrl, CusomizableGrid, ComCtrls, ToolWin,
  ExtCtrls;

type
  TfrmConsPrueba = class(TfrmCustomConsulta)
    edDesde: TIntEdit;
    edHasta: TIntEdit;
    Label1: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPrueba: TfrmConsPrueba;

implementation

{$R *.DFM}

procedure TfrmConsPrueba.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Sql.Text := 'SELECT * FROM SVO_VOLANTES ' +
                          'WHERE VO_VOLANTE BETWEEN ' + edDesde.TextSql + ' AND ' + edHasta.TextSql;
  inherited;
end;

procedure TfrmConsPrueba.tbLimpiarClick(Sender: TObject);
begin
  edDesde.Text := '';
  edHasta.Text := '';
  inherited;
end;

end.
