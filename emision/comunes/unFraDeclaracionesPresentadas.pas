unit unFraDeclaracionesPresentadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  unPresentacion;

type
  TfraDeclaracionesPresentadas = class(TFrame)
    dbgPresentaciones: TArtDBGrid;
    dsPresentaciones: TDataSource;
  private
    { Private declarations }
    FPresentacion : TPresentacion;
  public
    { Public declarations }
    procedure MostrarDeclaraciones(ACUIT : String); overload;
    procedure MostrarDeclaraciones(AContrato : integer); overload;
    procedure MostrarDeclaraciones(ACUIT : String; APeriodo : String); overload;
    procedure MostrarDeclaraciones(AContrato : integer; APeriodo : String); overload;

  end;

implementation

uses unDmPrincipal, unDmEmision;

{$R *.dfm}

{ TfraDeclaracionesPresentadas }
{-------------------------------------------------------------------------------}
procedure TfraDeclaracionesPresentadas.MostrarDeclaraciones(ACUIT: String);
begin
  FPresentacion := TPresentacion.Create(ACuit);
  dsPresentaciones.DataSet := FPresentacion.Presentacion;
end;
{-------------------------------------------------------------------------------}
procedure TfraDeclaracionesPresentadas.MostrarDeclaraciones(AContrato: integer);
begin
  FPresentacion := TPresentacion.Create(AContrato);
  dsPresentaciones.DataSet := FPresentacion.Presentacion;
end;
{-------------------------------------------------------------------------------}
procedure TfraDeclaracionesPresentadas.MostrarDeclaraciones(ACUIT,
  APeriodo: String);
begin
  FPresentacion := TPresentacion.Create(ACuit, APeriodo);
  dsPresentaciones.DataSet := FPresentacion.Presentacion;
end;
{-------------------------------------------------------------------------------}
procedure TfraDeclaracionesPresentadas.MostrarDeclaraciones(
  AContrato: integer; APeriodo: String);
begin
  FPresentacion := TPresentacion.Create(AContrato,APeriodo);
  dsPresentaciones.DataSet := FPresentacion.Presentacion;
end;
{-------------------------------------------------------------------------------}
end.
