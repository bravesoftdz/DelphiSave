unit unFrmDeclaracionesPresentadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, DB, SDEngine,
  unFraDeclaracionesPresentadas, ComCtrls, ToolWin;

type
  TfrmDeclaracionesPresentadas = class(TForm)
    fraDeclaracionesPresentadasEmpresa: TfraDeclaracionesPresentadas;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbSalir: TToolButton;
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarDeclaraciones(ACUIT : String); overload;
    procedure MostrarDeclaraciones(AContrato : integer); overload;
  end;

var
  frmDeclaracionesPresentadas: TfrmDeclaracionesPresentadas;

implementation

uses unDmPrincipal, unDmEmision;

{$R *.dfm}

{ TfrmDeclaracionesPresentadas }

procedure TfrmDeclaracionesPresentadas.MostrarDeclaraciones(ACUIT: String);
begin
  fraDeclaracionesPresentadasEmpresa.MostrarDeclaraciones(ACUIT);
  ShowModal;
end;

procedure TfrmDeclaracionesPresentadas.MostrarDeclaraciones(AContrato: integer);
begin
  fraDeclaracionesPresentadasEmpresa.MostrarDeclaraciones(AContrato);
  ShowModal;
end;

procedure TfrmDeclaracionesPresentadas.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDeclaracionesPresentadas.tbRefrescarClick(Sender: TObject);
begin
  fraDeclaracionesPresentadasEmpresa.Refresh;
end;

end.
