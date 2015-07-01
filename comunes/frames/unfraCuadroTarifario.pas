unit unfraCuadroTarifario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, StdCtrls, PatternEdit,
  unFraCodigoDescripcion, Db, SDEngine, Mask, ToolEdit, CurrEdit, IntEdit, unArt, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unfraStaticActividad, unArtDBAwareFrame, RxToolEdit,
  RxCurrEdit;

type
  TfraCuadroTarifario = class(TArtFrame)
    lbCIIU: TLabel;
    lbNivel: TLabel;
    edNIVEL: TPatternEdit;
    lbPROCENTAJE_MASA_SALARIAL: TLabel;
    lbDESC_MASA_SALARIAL: TLabel;
    lbDESC_HyS: TLabel;
    lbMASA_SALARIAL: TLabel;
    lb_Tarifa: TLabel;
    lbSumaFija: TLabel;
    edALICUOTAPESOS: TCurrencyEdit;
    edSUMAFIJATARIFA: TCurrencyEdit;
    lbTarifa: TLabel;
    lbCantEmpleados: TLabel;
    lbMasaSalarial: TLabel;
    edMASATOTAL: TCurrencyEdit;
    edALICUOTAPORC: TCurrencyEdit;
    edPORCDESCVOLUMEN: TCurrencyEdit;
    edPORCDESCNIVEL: TCurrencyEdit;
    edPORCMASATARIFA: TCurrencyEdit;
    edTOTEMPLEADOS: TCurrencyEdit;
    fraTIPOTARIFA: TfraStaticCTB_TABLAS;
    fraCIIU: TfraStaticActividad;
    procedure edALICUOTAPESOSExit(Sender: TObject);
    procedure edALICUOTAPORCChange(Sender: TObject);
    procedure edPORCDESCVOLUMENExit(Sender: TObject);
    procedure edPORCDESCNIVELExit(Sender: TObject);
    procedure edALICUOTAPORCExit(Sender: TObject);
    procedure edMASATOTALExit(Sender: TObject);
  private
    FFechaAfiliacion: TDateTime;
    FPorcMasa: Extended;
    FSumaFija: Extended;

    function GetActividad: TTableId;

    procedure SetActividad(const Value: TTableId);
    procedure SetFechaAfiliacion(const Value: TDateTime);
  protected
    procedure DoCalculo;
  public
    constructor Create(AOwner: TComponent); override;

    function isValid(const aValidarTipoTarifa: Boolean = True): Boolean;

    procedure Actualizar;
    procedure Clear; {By Fede} override; {By Fede}
    procedure Deshabilitar;
    procedure Habilitar;
  published
    property Actividad      : TTableId  read GetActividad     write SetActividad;
    property FechaAfiliacion: TDateTime read FFechaAfiliacion write SetFechaAfiliacion;
    property PorcMasa       : Extended  read FPorcMasa        write FPorcMasa;
    property SumaFija       : Extended  read FSumaFija        write FSumaFija;
  end;

var
  fraCuadroTarifario: TfraCuadroTarifario;

implementation

uses
  unDmPrincipal, CustomDlgs, unPrincipal, AnsiSQL, unAfiliaciones;

{$R *.DFM}

{ TfraCuadroTarifario }

constructor TfraCuadroTarifario.Create(AOwner: TComponent);
begin
  inherited;

  fraTIPOTARIFA.Clave := 'TARIF';
  fraTIPOTARIFA.Value := ValorSQL('SELECT tb_codigo FROM ctb_tablas WHERE tb_clave = ''TARIF'' AND tb_especial1 = ''D''');

  fPorcMasa := 0;
  fSumaFija := 0;
end;

procedure TfraCuadroTarifario.DoCalculo;
var
  Tarifa: recTarifa;
begin
  Tarifa.FinalPesos         := edALICUOTAPESOS.Value;
  Tarifa.FinalPorc          := edALICUOTAPORC.Value;

  Tarifa.SubTotal3Pesos     := edALICUOTAPESOS.Value;
  Tarifa.SubTotal3Porc      := edALICUOTAPORC.Value;

  Tarifa.RebajaVolumenVal   := edPORCDESCVOLUMEN.Value;
  Tarifa.RebajaHSVal        := edPORCDESCNIVEL.Value;
  Tarifa.RebajaEspSFijoVal  := 0;
  Tarifa.RecargoEspSFijoVal := 0;
  Tarifa.RebajaSinSFijoVal  := 0;
  Tarifa.RecargoSinSFijoVal := 0;
  Tarifa.RCSMF              := 0;
  Tarifa.RBSMF              := 0;
  Tarifa.RebajaSinVarVal    := 0;
  Tarifa.RecargoSinVarVal   := 0;
  Tarifa.RebajaEspVal       := 0;
  Tarifa.RecargoEspVal      := 0;

  if SetTarifaInv(Tarifa, 0.6, 3) then
  begin
    if edALICUOTAPESOS.Value = 0 then
    begin
      //Muestra los resultados en la planilla
      edSUMAFIJATARIFA.Value := 0;
      edPORCMASATARIFA.Value := Tarifa.PorcMasaTarifa;
      fSumaFija              := Tarifa.SubTotal3Pesos;
      fPorcMasa              := Tarifa.SubTotal3Porc;
    end
    else if edALICUOTAPESOS.Value < 0.6 then
    begin
      MessageDlg('La suma fija debe ser cero o mayor a 0.6', mtError, [mbOK], 0);
      edSUMAFIJATARIFA.Value := 0;
      edALICUOTAPESOS.Value  := 0;
      fSumaFija              := 0;
      fPorcMasa              := Tarifa.SubTotal3Porc;
      edPORCMASATARIFA.Value := Tarifa.PorcMasaTarifa;
    end
    else
    begin
      //Muestra los resultados en la planilla
      edSUMAFIJATARIFA.Value := Tarifa.SumaFijaTarifa;
      edPORCMASATARIFA.Value := Tarifa.PorcMasaTarifa;
      fSumaFija              := Tarifa.SubTotal3Pesos;
      fPorcMasa              := Tarifa.SubTotal3Porc;
    end;
  end
  else
    MessageDlg('Los datos ingresados son incompatibles.', mtError, [mbOK], 0);
end;

function TfraCuadroTarifario.GetActividad: TTableId;
begin
  Result := fraCIIU.Value;
end;

function TfraCuadroTarifario.isValid(const aValidarTipoTarifa: Boolean = True): Boolean;
begin
  Verificar(fraCIIU.IsEmpty, fraCIIU.edCodigo, 'El código de actividad es obligatorio.');
  Verificar((edNIVEL.Text = ''), edNIVEL, 'El nivel debe estar entre 1 y 4.'); //0 es para Personal de Casas Domesticas
  Verificar((edALICUOTAPORC.Value < 0) or (edALICUOTAPORC.Value > 100), edALICUOTAPORC, 'El porcentaje sobre la masa debe estar entre 0 y 100.');
  Verificar((edPORCDESCVOLUMEN.Value < 0) or (edPORCDESCVOLUMEN.value > 100), edPORCDESCVOLUMEN, 'El porcentaje de descuento por volumen debe estar entre 0 y 100.');
  Verificar((edPORCDESCNIVEL.Value < 0) or (edPORCDESCNIVEL.Value > 100), edPORCDESCNIVEL, 'El porcentaje de descuento por cumplimiento de normas debe estar entre 0 y 100.');
  Verificar((edALICUOTAPESOS.Value < 0), edALICUOTAPESOS, 'La suma fija debe ser mayor igual a 0 (cero).');
  Verificar(aValidarTipoTarifa and fraTIPOTARIFA.IsEmpty, fraTIPOTARIFA.edCodigo, 'El tipo de tarifa es obligatorio.');
  Verificar((edTOTEMPLEADOS.Value < 0), edTOTEMPLEADOS, 'El total de empleados debe ser mayor o igual a cero.');
  Verificar((edMASATOTAL.Value < 0), edMASATOTAL, 'La masa salarial debe ser mayor o igual a cero.');

  Result := True;
end;

procedure TfraCuadroTarifario.SetActividad(const Value: TTableId);
begin
  if Value <> fraCIIU.Value then
    fraCIIU.Value := Value;
end;

procedure TfraCuadroTarifario.SetFechaAfiliacion(const Value: TDateTime);
begin
  if FFechaAfiliacion <> Value then
  begin
    FFechaAfiliacion := Value;
    DoCalculo;
  end;
end;

procedure TfraCuadroTarifario.edALICUOTAPESOSExit(Sender: TObject);
begin
  if edALICUOTAPESOS.Value > 999999.99 then
    InvalidMsg(edALICUOTAPESOS, 'El importe no puede superar los 999.999,99.')
  else
    DoCalculo;
end;

procedure TfraCuadroTarifario.edALICUOTAPORCChange(Sender: TObject);
begin
  DoCalculo;
end;

procedure TfraCuadroTarifario.edPORCDESCVOLUMENExit(Sender: TObject);
begin
  if edPORCDESCVOLUMEN.Value > 999.99 then
    InvalidMsg(edPORCDESCVOLUMEN, 'El importe no puede superar los 999,99.')
  else
    DoCalculo;
end;

procedure TfraCuadroTarifario.edPORCDESCNIVELExit(Sender: TObject);
begin
  if edPORCDESCNIVEL.Value > 999.99 then
    InvalidMsg(edPORCDESCNIVEL, 'El importe no puede superar los 999,99.')
  else
    DoCalculo;
end;

procedure TfraCuadroTarifario.Clear;
begin
  fraCIIU.Clear;
  edNIVEL.Clear;
  edALICUOTAPORC.Clear;
  edPORCMASATARIFA.Clear;
  fraTIPOTARIFA.Clear;
  edPORCDESCVOLUMEN.Clear;
  edPORCDESCNIVEL.Clear;
  edALICUOTAPESOS.Clear;
  edSUMAFIJATARIFA.Clear;
  fraTIPOTARIFA.Clear;
  edTOTEMPLEADOS.Clear;
  edMASATOTAL.Clear;

  Habilitar;
end;

procedure TfraCuadroTarifario.edALICUOTAPORCExit(Sender: TObject);
begin
  if edALICUOTAPORC.Value > 999.999 then
    InvalidMsg(edALICUOTAPORC, 'El importe no puede superar los 999999.');
end;

procedure TfraCuadroTarifario.edMASATOTALExit(Sender: TObject);
begin
  if edMASATOTAL.Value > 9999999999.99 then
    InvalidMsg(edMASATOTAL, 'El importe no puede superar los 9.999.999.999,99.');
end;

procedure TfraCuadroTarifario.Deshabilitar;
begin
  fraCIIU.Enabled           := False;
  fraCIIU.ForeColor         := clBtnFace;

  fraTIPOTARIFA.Enabled     := False;
  fraTIPOTARIFA.ForeColor   := clBtnFace;

  edNIVEL.Enabled           := False;
  edNIVEL.Color             := clBtnFace;

  edALICUOTAPORC.Enabled    := False;
  edALICUOTAPORC.Color      := clBtnFace;

  edPORCDESCVOLUMEN.Enabled := False;
  edPORCDESCVOLUMEN.Color   := clBtnFace;

  edPORCDESCNIVEL.Enabled   := False;
  edPORCDESCNIVEL.Color     := clBtnFace;

  edALICUOTAPESOS.Enabled   := False;
  edALICUOTAPESOS.Color     := clBtnFace;

  edTOTEMPLEADOS.Enabled    := False;
  edTOTEMPLEADOS.Color      := clBtnFace;

  edMASATOTAL.Enabled       := False;
  edMASATOTAL.Color         := clBtnFace;
end;

procedure TfraCuadroTarifario.Habilitar;
begin
  fraCIIU.Enabled           := True;
  fraCIIU.ForeColor         := clWindow;

  fraTIPOTARIFA.Enabled     := True;
  fraTIPOTARIFA.ForeColor   := clWindow;

  edNIVEL.Enabled           := True;
  edNIVEL.Color             := clWindow;

  edALICUOTAPORC.Enabled    := True;
  edALICUOTAPORC.Color      := clWindow;

  edPORCDESCVOLUMEN.Enabled := True;
  edPORCDESCVOLUMEN.Color   := clWindow;

  edPORCDESCNIVEL.Enabled   := True;
  edPORCDESCNIVEL.Color     := clWindow;

  edALICUOTAPESOS.Enabled   := True;
  edALICUOTAPESOS.Color     := clWindow;

  edTOTEMPLEADOS.Enabled    := True;
  edTOTEMPLEADOS.Color      := clWindow;

  edMASATOTAL.Enabled       := True;
  edMASATOTAL.Color         := clWindow;
end;

procedure TfraCuadroTarifario.Actualizar;
begin
  DoCalculo;
end;

end.
