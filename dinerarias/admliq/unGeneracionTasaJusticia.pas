unit unGeneracionTasaJusticia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, StdCtrls, Buttons, ToolEdit, DateComboBox, ExtCtrls,
  Mask, CurrEdit, Math ;

type
  TfrmGeneracionTasaJusticia = class(TForm)
    btnCancelarInt: TBitBtn;
    btnAceptarInt: TBitBtn;
    FormStorage: TFormStorage;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    edSumaFija: TCurrencyEdit;
    edTasaJusticia: TCurrencyEdit;
    edCapital: TCurrencyEdit;
    rbPorcentajeTJ: TRadioButton;
    rbSumaFijaTJ: TRadioButton;
    procedure btnAceptarIntClick(Sender: TObject);
    procedure rbPorcentajeTJClick(Sender: TObject);
    procedure edSumaFijaChange(Sender: TObject);
  private
    FCapital: Double;
    procedure SetCapital(const Value: Double);
  public
    property Capital: Double      Read FCapital       Write SetCapital;
  end;

var
  frmGeneracionTasaJusticia: TfrmGeneracionTasaJusticia;

implementation

uses General, CustomDlgs, unDmPrincipal, DateTimeFuncs, unComunes,
     unClassLiquidacion, VCLExtra, DB;
{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmGeneracionTasaJusticia.SetCapital(const Value: Double);
begin
  if (FCapital <> Value) then
  begin
    FCapital            := Value;
    edCapital.Value     := FCapital;
    rbPorcentajeTJClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionTasaJusticia.btnAceptarIntClick(Sender: TObject);
begin
  Verificar(not(rbSumaFijaTJ.Checked) and not(rbPorcentajeTJ.Checked), Nil,
            'Debe seleccionar el tipo de tasa.');
  Verificar(rbSumaFijaTJ.Checked and (edSumaFija.Value = 0), edSumaFija, 'Debe ingresar la suma.');
  Verificar(rbSumaFijaTJ.Checked and (edSumaFija.Value > Capital), edSumaFija,
            'La suma no puede ser mayor que el importe de la liquidación.');
  Verificar(edTasaJusticia.Value = 0, edTasaJusticia, 'La tasa calculada es 0');
  ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionTasaJusticia.rbPorcentajeTJClick(Sender: TObject);
begin
  edSumaFija.Clear;
  LockControl(edSumaFija, rbPorcentajeTJ.Checked);
  edTasaJusticia.Value := IIF(rbSumaFijaTJ.Checked, 0,
                              Capital * TasaJusticia);
end;
{-------------------------------------------------------------------------------}
procedure TfrmGeneracionTasaJusticia.edSumaFijaChange(Sender: TObject);
begin
  edTasaJusticia.Value := edSumaFija.Value;
end;
{-------------------------------------------------------------------------------}
end.
