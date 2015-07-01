unit unContabilidadGeneral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons,
  ExtCtrls;

type
  TfrmContabilidadGeneral = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnSi: TBitBtn;
    btnNo: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ceCobranzaCuota: TCurrencyEdit;
    ceAmortizacionCuota: TCurrencyEdit;
    ceRecuperoCuota: TCurrencyEdit;
    ceEmisionCuota: TCurrencyEdit;
    GroupBox2: TGroupBox;
    edPeriodo: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ceCobranzaFondo: TCurrencyEdit;
    ceAmortizacionFondo: TCurrencyEdit;
    ceRecuperoFondo: TCurrencyEdit;
    ceEmisionFondo: TCurrencyEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ceCobranzaInteres: TCurrencyEdit;
    ceAmortizacionInteres: TCurrencyEdit;
    ceRecuperoInteres: TCurrencyEdit;
    ceEmisionInteres: TCurrencyEdit;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ceCobranzaGastos: TCurrencyEdit;
    ceAmortizacionGastos: TCurrencyEdit;
    ceRecuperoGastos: TCurrencyEdit;
    ceEmisionGastos: TCurrencyEdit;
    GroupBox6: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ceCobranzaComision: TCurrencyEdit;
    ceAmortizacionComision: TCurrencyEdit;
    ceRecuperoComision: TCurrencyEdit;
    ceEmisionComision: TCurrencyEdit;
    procedure btnNoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSiClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure Clear;
    procedure MostrarData;
  public
  end;

var
  frmContabilidadGeneral: TfrmContabilidadGeneral;

implementation

uses
  unDmPrincipal, unPrincipal, unSesion;

{$R *.DFM}

procedure TfrmContabilidadGeneral.Clear;
begin
  edPeriodo.Clear;

  ceEmisionCuota.Clear;
  ceCobranzaCuota.Clear;
  ceAmortizacionCuota.Clear;
  ceRecuperoCuota.Clear;

  ceEmisionFondo.Clear;
  ceCobranzaFondo.Clear;
  ceAmortizacionFondo.Clear;
  ceRecuperoFondo.Clear;

  ceEmisionInteres.Clear;
  ceCobranzaInteres.Clear;
  ceAmortizacionInteres.Clear;
  ceRecuperoInteres.Clear;

  ceEmisionGastos.Clear;
  ceCobranzaGastos.Clear;
  ceAmortizacionGastos.Clear;
  ceRecuperoGastos.Clear;

  ceEmisionComision.Clear;
  ceCobranzaComision.Clear;
  ceAmortizacionComision.Clear;
  ceRecuperoComision.Clear;
end;

procedure TfrmContabilidadGeneral.MostrarData;
var
  sSql: String;
begin
  // Muestro los resultados..
  edPeriodo.Text := ValorSql('SELECT LI_PERIODO FROM CLI_LIBROS WHERE LI_CODIGO = ''1'' AND LI_ACTUAL = ''S''');

  // Emisión..
  sSql :=
    'SELECT NVL(SUM(ER_CUOTA),0) CUOTA, NVL(SUM(ER_FONDO),0) FONDO, NVL(SUM(ER_INTERES),0) INTERES, ' +
           'NVL(SUM(ER_REINTEGROGASTOS),0) GASTOS, NVL(SUM(ER_COMISION+ER_IVACOMISION),0) COMISIONES ' +
      'FROM OER_EMISIONRESUMEN';

  with GetQuery(sSql) do
  try
    ceEmisionCuota.Value    := FieldByName('CUOTA').AsFloat;
    ceEmisionFondo.Value    := FieldByName('FONDO').AsFloat;
    ceEmisionInteres.Value  := FieldByName('INTERES').AsFloat;
    ceEmisionGastos.Value   := FieldByName('GASTOS').AsFloat;
    ceEmisionComision.Value := FieldByName('COMISIONES').AsFloat;
  finally
    Free;
  end;

  // Cobranza..
  sSql :=
    'SELECT NVL(SUM(CR_CUOTA),0) CUOTA, NVL(SUM(CR_FONDO),0) FONDO, NVL(SUM(CR_INTERES),0) INTERES, ' +
           'NVL(SUM(CR_REINTEGROGASTOS),0) GASTOS, NVL(SUM(CR_COMISION+CR_IVACOMISION),0) COMISIONES ' +
      'FROM OCR_COBRANZARESUMEN';

  with GetQuery(sSql) do
  try
    ceCobranzaCuota.Value    := FieldByName('CUOTA').AsFloat;
    ceCobranzaFondo.Value    := FieldByName('FONDO').AsFloat;
    ceCobranzaInteres.Value  := FieldByName('INTERES').AsFloat;
    ceCobranzaGastos.Value   := FieldByName('GASTOS').AsFloat;
    ceCobranzaComision.Value := FieldByName('COMISIONES').AsFloat;
  finally
    Free;
  end;

  // Amortización..
  sSql :=
    'SELECT NVL(SUM(AR_CUOTA),0) CUOTA, NVL(SUM(AR_FONDO),0) FONDO, NVL(SUM(AR_INTERES),0) INTERES, ' +
           'NVL(SUM(AR_REINTEGROGASTOS),0) GASTOS, NVL(SUM(AR_COMISION+AR_IVACOMISION),0) COMISIONES ' +
     'FROM OAR_AMORTIZACIONRESUMEN';

  with GetQuery(sSql) do
  try
    ceAmortizacionCuota.Value    := FieldByName('CUOTA').AsFloat;
    ceAmortizacionFondo.Value    := FieldByName('FONDO').AsFloat;
    ceAmortizacionInteres.Value  := FieldByName('INTERES').AsFloat;
    ceAmortizacionGastos.Value   := FieldByName('GASTOS').AsFloat;
    ceAmortizacionComision.Value := FieldByName('COMISIONES').AsFloat;
  finally
    Free;
  end;

  // Recupero..
  sSql :=
    'SELECT NVL(SUM(RR_CUOTA),0) CUOTA, NVL(SUM(RR_FONDO),0) FONDO, NVL(SUM(RR_INTERES),0) INTERES, ' +
           'NVL(SUM(RR_REINTEGROGASTOS),0) GASTOS, NVL(SUM(RR_COMISION+RR_IVACOMISION),0) COMISIONES ' +
      'FROM ORR_RECUPERORESUMEN';

  with GetQuery(sSql) do
  try
    ceRecuperoCuota.Value    := FieldByName('CUOTA').AsFloat;
    ceRecuperoFondo.Value    := FieldByName('FONDO').AsFloat;
    ceRecuperoInteres.Value  := FieldByName('INTERES').AsFloat;
    ceRecuperoGastos.Value   := FieldByName('GASTOS').AsFloat;
    ceRecuperoComision.Value := FieldByName('COMISIONES').AsFloat;
  finally
    Free;
  end;
end;

procedure TfrmContabilidadGeneral.btnNoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContabilidadGeneral.FormCreate(Sender: TObject);
begin
  Clear;
  MostrarData;
end;

procedure TfrmContabilidadGeneral.btnSiClick(Sender: TObject);
var
  sSql: String;
begin
  // Calculo los asientos..
  sSql := Format(
    'Begin ' +
    'Cont.Do_InterfaceAsientos(''%s'', ''%s''); ' +
    'End;',
    [
      edPeriodo.Text,
      Sesion.UserID
    ]);

  EjecutarSql(sSql);
  MessageDlg('Los asientos han sido generados exitosamente.', mtCustom, [mbOK], 0);
  Close;
end;

procedure TfrmContabilidadGeneral.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
