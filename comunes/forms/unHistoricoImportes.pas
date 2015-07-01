unit unHistoricoImportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmHistoricoImportes = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    FidMediacion : Integer;
  public
    { Public declarations }
    procedure MostrarHistorico(idMediacion : Integer);
  end;

var
  frmHistoricoImportes: TfrmHistoricoImportes;

implementation

{$R *.dfm}

procedure TfrmHistoricoImportes.MostrarHistorico(idMediacion: Integer);
begin
  FidMediacion := idMediacion;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoImportes.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName('idmediacion').AsInteger := FidMediacion;
  inherited;
end;

end.
 