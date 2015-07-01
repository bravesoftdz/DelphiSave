unit unHistoricoTipoEstabPreventor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, PatternEdit, unArtFrame,
  ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  FormPanel, DB, SDEngine, ToolEdit, DateComboBox;

type
  TfrmHistoricoAsignaciones = class(TForm)
    cbAbogados: TCoolBar;
    tbrHistoricoTipoEstab: TToolBar;
    tbSalirHistorico: TToolButton;
    dbGridHistoricoAsignaciones: TDBGrid;
    dsHistoricoAsignaciones: TDataSource;
    sdqHistoricoAsignaciones: TSDQuery;
    procedure tbSalirHistoricoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure MostrarHistorico(Cuit: string; Estableci: integer);
  end;


implementation

uses unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, unSesion;

{$R *.dfm}

{--------------------------------------------------------------------------------}
{ TfrmHistoricoEstado }

class procedure TfrmHistoricoAsignaciones.MostrarHistorico(Cuit: string; Estableci: integer);
begin
  with TFrmHistoricoAsignaciones.Create(nil) do
  try
    sdqHistoricoAsignaciones.ParamByName('cuit').AsString := Cuit;
    sdqHistoricoAsignaciones.ParamByName('estableci').AsInteger := Estableci;
    sdqHistoricoAsignaciones.Open;
    Showmodal;
  finally
    Free;
  end;
end;

procedure TfrmHistoricoAsignaciones.tbSalirHistoricoClick(
  Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
