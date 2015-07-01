unit unHistoricoPrevAccidente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmHistoricoPrevAccidente = class(TfrmCustomConsulta)
  private
    FIdGestion : Integer;
    procedure tbRefrescarClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarHistorico(idGestion: Integer);
  end;

var
  frmHistoricoPrevAccidente: TfrmHistoricoPrevAccidente;

implementation

{$R *.dfm}
procedure TfrmHistoricoPrevAccidente.MostrarHistorico(idGestion: Integer);
begin
  FidGestion := idGestion;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoPrevAccidente.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName('idgestion').AsInteger := FidGestion;
  inherited;
end;

end.
