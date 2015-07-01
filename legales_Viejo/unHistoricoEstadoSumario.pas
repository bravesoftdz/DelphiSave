unit unHistoricoEstadoSumario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmHistoricoEstadoSumario = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    FidSumario : Integer;
  public
    { Public declarations }
    procedure MostrarHistorico(idSumario : Integer);
  end;

var
  frmHistoricoEstadoSumario: TfrmHistoricoEstadoSumario;

implementation

{$R *.dfm}

{ TfrmHistoricoEstadoSumario }

procedure TfrmHistoricoEstadoSumario.MostrarHistorico(
  idSumario: Integer);
begin
  FidSumario := idSumario;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoEstadoSumario.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName('idsumario').AsInteger := FidSumario;
  inherited;
end;

end.
