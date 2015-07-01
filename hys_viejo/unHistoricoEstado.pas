unit unHistoricoEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls;

type
  TfrmHistoricoEstado = class(TfrmCustomConsulta)
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    FidGestion : Integer;
  public
    { Public declarations }
    procedure MostrarHistorico(idGestion : Integer);
  end;

var
  frmHistoricoEstado: TfrmHistoricoEstado;

implementation

{$R *.dfm}

{ TfrmHistoricoEstado }

procedure TfrmHistoricoEstado.MostrarHistorico(idGestion: Integer);
begin
  FidGestion := idGestion;
  tbRefrescarClick(nil);
end;

procedure TfrmHistoricoEstado.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName('idgestion').AsInteger := FidGestion;
  inherited;
end;

end.
