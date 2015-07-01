unit UnFrmHistoricoReservasSumarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, PatternEdit, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  FormPanel, DB, SDEngine, unDmLegales,
  ToolEdit, DateComboBox;

type
  TfrmHistoricoReservasSumarios = class(TForm)
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
    FIdSumario : Integer;
    { Private declarations }
  public
    { Public declarations }
    class procedure MostrarHistorico(AIdSumario: integer);
  end;


implementation

uses unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, unConstLegales, unSesion;

{$R *.dfm}



{--------------------------------------------------------------------------------}

{ TfrmHistoricoReservas }

class procedure TfrmHistoricoReservasSumarios.MostrarHistorico(
  AIdSumario: integer);
begin
  with TfrmHistoricoReservasSumarios.Create(nil) do
  try
    FIdSumario := AIdSumario;
    sdqHistoricoReservas.ParamByName('IDSUMARIO').AsInteger := FIdSumario;
    sdqHistoricoReservas.Open;
    Showmodal;
  finally
    Free;
  end;
end;

procedure TfrmHistoricoReservasSumarios.tbSalirAbogadosAsignadosClick(
  Sender: TObject);
begin
  Close;
end;

end.
