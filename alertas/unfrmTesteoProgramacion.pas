unit unfrmTesteoProgramacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmTesteoProgramacion = class(TForm)
    lbTesteo: TListBox;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbEjecutar: TToolButton;
    ToolButton2: TToolButton;
    tbSalir: TToolButton;
    tbDetener: TToolButton;
    tTesteo: TTimer;
    tbLimpiar: TToolButton;
    procedure tbSalirClick(Sender: TObject);
    procedure tTesteoTimer(Sender: TObject);
    procedure tbEjecutarClick(Sender: TObject);
    procedure tbDetenerClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    FTipoProgramacion: string;
    FValor: integer;
    FTipoFrecuencia: string;
    FFrecuencia, FDesde, FHasta: integer;
    FUnidadFrecuencia: string;
    FProximaEjecucion  : TDateTime;
    procedure Testear;
  public
    { Public declarations }
    procedure TestearProgramacion(TipoProgramacion: string; Valor: integer;
								      						TipoFrecuencia: string; Frecuencia, Desde, Hasta: integer;
                                  UnidadFrecuencia : string = 'M');
  end;

var
  frmTesteoProgramacion: TfrmTesteoProgramacion;

implementation

uses UnAlertas, unPrincipal;

{$R *.dfm}

{ TfrmTesteoProgramacion }

procedure TfrmTesteoProgramacion.TestearProgramacion(
  TipoProgramacion: string; Valor: integer; TipoFrecuencia: string;
  Frecuencia, Desde, Hasta: integer; UnidadFrecuencia: string);
begin
     FTipoProgramacion := TipoProgramacion;
     FValor := Valor;
     FTipoFrecuencia := TipoProgramacion;
     FFrecuencia := Frecuencia;
     FDesde := Desde;
     FHasta := Hasta;
     FUnidadFrecuencia := UnidadFrecuencia;
     ShowModal;
end;

procedure TfrmTesteoProgramacion.tbSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTesteoProgramacion.Testear;
var
 Intervalo : integer;

begin
 Intervalo :=  TPrograma.CalcularIntervalo(FTipoProgramacion, FValor,
                     FTipoFrecuencia, FFrecuencia, FDesde, FHasta, FUnidadFrecuencia);
 FProximaEjecucion := (Intervalo / 1000 / 60 / 60 / 24) + FProximaEjecucion;
 lbTesteo.Items.Add(DateTimeToStr(FProximaEjecucion));
end;


procedure TfrmTesteoProgramacion.tTesteoTimer(Sender: TObject);
begin
  Testear;
end;

procedure TfrmTesteoProgramacion.tbEjecutarClick(Sender: TObject);
begin
  tTesteo.Enabled := true;
end;

procedure TfrmTesteoProgramacion.tbDetenerClick(Sender: TObject);
begin
  tTesteo.Enabled := false;
end;

procedure TfrmTesteoProgramacion.tbLimpiarClick(Sender: TObject);
begin
  FProximaEjecucion  := Now;
  lbTesteo.Items.Clear;
end;

end.
