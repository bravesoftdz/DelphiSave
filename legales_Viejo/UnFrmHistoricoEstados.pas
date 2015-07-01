unit UnFrmHistoricoEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, PatternEdit, unArtFrame,
  unFraCodigoDescripcion, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  FormPanel, DB, SDEngine, unfraJuzgados, unfraCodigoDescripcionExt,  unDmLegales,
  unfraAbogadosLegales, ToolEdit, DateComboBox;

type
  TfrmHistoricoEstados = class(TForm)
    cbAbogados: TCoolBar;
    tbrAbogados: TToolBar;
    tbImprimirAsignacionAbogados: TToolButton;
    tbSeparador3: TToolButton;
    tbSalirAbogadosAsignados: TToolButton;
    dbGridAbogadosJuicio: TDBGrid;
    dsAbogadosJuicioEnTramite: TDataSource;
    sdqHistoricoEstados: TSDQuery;
    procedure tbSalirAbogadosAsignadosClick(Sender: TObject);
  private
    FIdJuicioEnTramite : Integer;
    { Private declarations }
  public
    { Public declarations }
    class procedure MostrarHistorico(AIdJuicioEnTramite: integer);
  end;


implementation

uses unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, unConstLegales, unSesion;

{$R *.dfm}

{--------------------------------------------------------------------------------}
{ TfrmHistoricoEstado }

class procedure TfrmHistoricoEstados.MostrarHistorico(
  AIdJuicioEnTramite: integer);
begin
  with TfrmHistoricoEstados.Create(nil) do
  try
    FIdJuicioEnTramite := AIdJuicioEnTramite;
    sdqHistoricoEstados.ParamByName('idJuicioentramite').AsInteger := FIdJuicioEnTramite;
    sdqHistoricoEstados.Open;
    Showmodal;
  finally
    Free;
  end;
end;

procedure TfrmHistoricoEstados.tbSalirAbogadosAsignadosClick(
  Sender: TObject);
begin
  Close;
end;

end.
