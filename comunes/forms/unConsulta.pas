unit unConsulta;

interface

uses
  unCustomConsulta, FieldHider, ShortCutControl, Dialogs, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Controls,
  ComCtrls, ToolWin, Classes, ExtCtrls;

type
  TfrmConsulta = class(TfrmCustomConsulta)
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  protected
    function FiltersChanged : Boolean; override;
  public
    procedure RefreshData; override;
    procedure PrintResults; override;
  end;

implementation

uses unPrincipal, unDmPrincipal;

{$R *.DFM}
{------------------------------------------------------------------------------}
{ TfrmConsulta }
{------------------------------------------------------------------------------}
function TfrmConsulta.FiltersChanged: Boolean;
begin
  Result := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsulta.PrintResults;
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsulta.RefreshData;
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmConsulta.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
end;
{------------------------------------------------------------------------------}
end.
