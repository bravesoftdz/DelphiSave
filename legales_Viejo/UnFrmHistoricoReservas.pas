unit UnFrmHistoricoReservas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Mask,
  PatternEdit, unArtFrame, unFraCodigoDescripcion, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, FormPanel, DB, SDEngine,
  unfraJuzgados, unfraCodigoDescripcionExt,  unDmLegales, unfraAbogadosLegales, ToolEdit, DateComboBox;

type
  TfrmHistoricoReservas = class(TForm)
    cbAbogados: TCoolBar;
    tbrAbogados: TToolBar;
    tbImprimirAsignacionAbogados: TToolButton;
    tbSeparador3: TToolButton;
    tbSalirAbogadosAsignados: TToolButton;
    dbGridAbogadosJuicio: TDBGrid;
    dsReservasEnTramite: TDataSource;
    sdqHistoricoReservas: TSDQuery;
    procedure tbSalirAbogadosAsignadosClick(Sender: TObject);
  private
    FIdJuicioEnTramite: Integer;
  public
    class procedure MostrarHistorico(AIdJuicioEnTramite: Integer);
  end;

implementation

uses
	unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, unConstLegales, unSesion;

{$R *.dfm}

{ TfrmHistoricoReservas }

class procedure TfrmHistoricoReservas.MostrarHistorico(AIdJuicioEnTramite: Integer);
begin
  with TfrmHistoricoReservas.Create(nil) do
  try
    FIdJuicioEnTramite := AIdJuicioEnTramite;
    sdqHistoricoReservas.ParamByName('IDJUICIOENTRAMITE').AsInteger := FIdJuicioEnTramite;
    sdqHistoricoReservas.Open;
    Showmodal;
  finally
    Free;
  end;
end;

procedure TfrmHistoricoReservas.tbSalirAbogadosAsignadosClick(Sender: TObject);
begin
  Close;
end;

end.
