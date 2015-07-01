unit unHistoricoEstadosMediacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmHistoricoEstadoMediacion = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    FidMediacion : Integer;
  public
    { Public declarations }
    procedure MostrarHistorico(idMediacion : Integer);
  end;

var
  frmHistoricoEstadoMediacion: TfrmHistoricoEstadoMediacion;

implementation

{$R *.dfm}

procedure TfrmHistoricoEstadoMediacion.MostrarHistorico(
  idMediacion: Integer);
begin
  FidMediacion := idMediacion;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoEstadoMediacion.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName('idmediacion').AsInteger := FidMediacion;
  inherited;
end;

end.
