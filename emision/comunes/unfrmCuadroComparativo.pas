unit unfrmCuadroComparativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, PeriodoPicker, PatternEdit,
  IntEdit, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Mask, ToolEdit, CurrEdit, unPrincipal;

type
  TfrmCuadroComparativo = class(TForm)
    gbCuadroCuota: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label31: TLabel;
    lblProcesarInfo: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edDevengadoActual: TCurrencyEdit;
    edPagadoActual: TCurrencyEdit;
    edDiferenciaActual: TCurrencyEdit;
    edDevengadoCalculado: TCurrencyEdit;
    fraClase1: TfraStaticCTB_TABLAS;
    edAjusteActual: TCurrencyEdit;
    edAjusteCalculado: TCurrencyEdit;
    gbCuadroTrabajadores: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edCantEmpleadosNomimaPrev: TIntEdit;
    edRemuneracionNominaPrev: TCurrencyEdit;
    edPeriodoNomina: TPeriodoPicker;
    edTarifaVigCuadro: TEdit;
    edCantEmpleadosContrato: TIntEdit;
    edRemuneracionContrato: TCurrencyEdit;
    gbCuadroPeriodo: TGroupBox;
    Label20: TLabel;
    tbPeriodo1: TToolBar;
    tbAnterior1: TToolButton;
    edPeriodoCuadro: TPeriodoPicker;
    tbSiguiente1: TToolButton;
    Label1: TLabel;
    edCantEmpleadosNomimaAct: TIntEdit;
    edRemuneracionNominaAct: TCurrencyEdit;
    edDifDevengado: TCurrencyEdit;
    Label2: TLabel;
    procedure tbAnterior1Click(Sender: TObject);
    procedure tbSiguiente1Click(Sender: TObject);
    procedure edPeriodoCuadroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FContrato: Integer;
    function Get_PeriodoBusqueda(Contrato: Integer; Periodo: string; TipoBusqueda: char): string;
    procedure Do_CargarCuadroComparativo(Contrato: Integer; Periodo: String);
    procedure ClearControlsCuadro;
  public
  end;

  procedure CargarCuadroComparativo(Contrato: Integer; Periodo: String);

implementation

uses
  unDmPrincipal, AnsiSql, General, CustomDlgs, unART, unComunes, Numeros, VCLExtra;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure CargarCuadroComparativo(Contrato: Integer; Periodo: String);
begin
  with TfrmCuadroComparativo.Create(nil) do
    try
      edPeriodoCuadro.Periodo.Valor := Periodo;
      FContrato := Contrato;

      Do_CargarCuadroComparativo(Contrato, Periodo);

      ShowModal;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCuadroComparativo.Do_CargarCuadroComparativo(Contrato: Integer; Periodo: String);
var
  sSql: string;
  Color: TColor;
  iContrato: Integer;
begin
  if Periodo = '' then
    ClearControlsCuadro
  else
    begin
      //Busco el contrato que le corresponde al periodo
      sSql := ' SELECT RC_CONTRATO' +
              '   FROM ZRC_RESUMENCOBRANZA' +
              '  WHERE RC_CONTRATO = :Contrato' +
              '    AND RC_PERIODO = :Periodo';
      iContrato := ValorSqlIntegerEx( sSql, [Contrato, Periodo] );

      if iContrato = 0 then
      begin
        InfoHint(edPeriodoCuadro, 'El período no pertenece al contrato.');
        ClearControlsCuadro;
        Abort;
      end;

      //Carga los valores correspondientes al periodo
      sSql := 'SELECT RC_DEVENGADOCUOTA DEVENGADO, ' +
              '       RC_PAGOCUOTA+RC_RECUPEROCUOTA PAGADO, ' +
              '       RC_CLASE, COBRANZA.GET_TOTALAJUSTESREDONDEO(RC_CONTRATO, RC_PERIODO) AJUSTES, ' +
              '       RC_EMPLEADOS, RC_MASASALARIAL ' +
              '  FROM ZRC_RESUMENCOBRANZA' +
              ' WHERE RC_CONTRATO = :Contrato' +
              '   AND RC_PERIODO = :Periodo';

      with GetQueryEx( sSql, [iContrato, Periodo] ) do
        try
          edDevengadoActual.Value        := FieldByName('DEVENGADO').AsFloat;
          edPagadoActual.Value           := FieldByName('PAGADO').AsFloat;
          edDiferenciaActual.Value       := edDevengadoActual.Value - edPagadoActual.Value;
          fraClase1.Value                := FieldByName('RC_CLASE').AsString;
          edAjusteActual.Value           := FieldByName('AJUSTES').AsFloat;
          edCantEmpleadosNomimaAct.Value := FieldByName('RC_EMPLEADOS').AsInteger;
          edRemuneracionNominaAct.Value  := FieldByName('RC_MASASALARIAL').AsFloat;
        finally
          Free;
        end;

      sSql := 'SELECT EMI.EMISION.GET_DEVENGADOPREVISTO(CO_CONTRATO, :Periodo) CUOTA, ' +
              '       EMI.EMISION.GET_IMPORTEAJUSTEPREVISTO(CO_CONTRATO, :Periodo) AJUSTEPREV, ' +
              '       EMI.UTILES.GET_ULTIMADECLARACION(CO_CONTRATO, :Periodo) ULTIMANOMINA, ' +
              '       EMI.UTILES.GET_EMPLEADOS(CO_CONTRATO, :Periodo) EMPLEADOS,' +
              '       EMI.UTILES.GET_MASA(CO_CONTRATO, :Periodo) MASASALARIAL, ' +
              '       AFILIACION.GET_TARIFAVIGENTETEXTO(CO_CONTRATO, :Periodo) TARIFA, ' +
              '       CO_TOTEMPLEADOS TOTEMPLEADOS, CO_MASATOTAL MASATOTAL ' +
              '  FROM ACO_CONTRATO ' +
              ' WHERE CO_CONTRATO = :Contrato';

      with GetQueryEx( sSql, [Periodo, Periodo, Periodo, Periodo, Periodo, Periodo, iContrato] ) do
        try
          edDevengadoCalculado.Value      := FieldByName('CUOTA').AsFloat;
          edAjusteCalculado.Value         := FieldByName('AJUSTEPREV').AsFloat;
          edPeriodoNomina.Periodo.Valor   := FieldByName('ULTIMANOMINA').AsString;
          edTarifaVigCuadro.Text          := FieldByName('TARIFA').AsString;
          edCantEmpleadosNomimaPrev.Value := FieldByName('EMPLEADOS').AsInteger;
          edRemuneracionNominaPrev.Value  := FieldByName('MASASALARIAL').AsFloat;
          edCantEmpleadosContrato.Value   := FieldByName('TOTEMPLEADOS').AsInteger;
          edRemuneracionContrato.Value    := FieldByName('MASATOTAL').AsFloat;
        finally
          Free;
        end;

      sSql := 'SELECT 1 ' +
              '  FROM ZMO_MOVIMIENTO, ZCM_CODIGOMOVIMIENTO ' +
              ' WHERE MO_CONTRATO=:Contrato' +
              '   AND MO_PERIODO=:Periodo' +
              '   AND MO_SITUAC<>''2'' ' +
              '   AND MO_IDCODIGOMOVIMIENTO=CM_ID' +
              '   AND ''''||CM_CODIGO IN (''100'') ' +
              ' UNION ' +
              'SELECT 1 ' +
              '  FROM EMI.IRP_RESUMENPERIODO ' +
              ' WHERE RP_CONTRATO=:Contrato' +
              '   AND RP_PERIODO=:Periodo' +
              '   AND RP_ESTADO=''P''';

      lblProcesarInfo.Visible := ExisteSqlEx( sSql, [iContrato, Periodo, iContrato, Periodo] );

      edDifDevengado.Value := edDevengadoActual.Value - edDevengadoCalculado.Value;

      if (edDifDevengado.Value > 0) then
        edDifDevengado.Font.Color := clGreen
      else begin
        if (edDifDevengado.Value < 0) then
          edDifDevengado.Font.Color := clRed
        else
          edDifDevengado.Font.Color := clBlack;
      end;

      if CompareFloat(edDevengadoActual.Value, edDevengadoCalculado.Value) <> 0 then
        Color := clRed
      else
        Color := clBlack;

      edDevengadoActual.Font.Color := Color;
      edDevengadoCalculado.Font.Color := Color;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCuadroComparativo.ClearControlsCuadro;
begin
  edDevengadoActual.Clear;
  edPagadoActual.Clear;
  edDiferenciaActual.Clear;
  edDevengadoCalculado.Clear;
  edDifDevengado.Clear;
  edAjusteActual.Clear;
  edAjusteCalculado.Clear;
  edCantEmpleadosNomimaAct.Clear;
  edRemuneracionNominaAct.Clear;
  edCantEmpleadosNomimaPrev.Clear;
  edRemuneracionNominaPrev.Clear;
  edPeriodoNomina.Clear;
  edTarifaVigCuadro.Clear;
  edCantEmpleadosContrato.Clear;
  edRemuneracionContrato.Clear;
  fraClase1.Clear;
  lblProcesarInfo.Visible := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCuadroComparativo.tbAnterior1Click(Sender: TObject);
begin
  edPeriodoCuadro.Periodo.Valor := Get_PeriodoBusqueda(FContrato, edPeriodoCuadro.Periodo.Valor, 'A');
  Do_CargarCuadroComparativo(FContrato, edPeriodoCuadro.Periodo.Valor);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCuadroComparativo.tbSiguiente1Click(Sender: TObject);
begin
  edPeriodoCuadro.Periodo.Valor := Get_PeriodoBusqueda(FContrato, edPeriodoCuadro.Periodo.Valor, 'S');
  Do_CargarCuadroComparativo(FContrato, edPeriodoCuadro.Periodo.Valor);
end;
{-------------------------------------------------------------------------------}
procedure TfrmCuadroComparativo.edPeriodoCuadroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Do_CargarCuadroComparativo(FContrato, edPeriodoCuadro.Periodo.Valor);
end;
{-------------------------------------------------------------------------------}
function TfrmCuadroComparativo.Get_PeriodoBusqueda(Contrato: Integer; Periodo: string; TipoBusqueda: char): string;
var
  sSql, sFuncion, sOperador: string;
  iContrato: Integer;
begin
  if TipoBusqueda = 'A' then
    begin
      sFuncion  := 'MAX';
      sOperador := '<';
    end
  else
    begin
      sFuncion  := 'MIN';
      sOperador := '>';
    end;

  sSql := ' SELECT RC_CONTRATO ' +
          '   FROM ZRC_RESUMENCOBRANZA ' +
          '  WHERE RC_PERIODO = :Periodo' +
          '    AND RC_CONTRATO = :Contrato';
  iContrato := ValorSqlIntegerEx(sSql, [Periodo, Contrato]);

  sSql := 'SELECT ' + sFuncion + '(RC_PERIODO)' +
          ' FROM ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA, ZCM_CODIGOMOVIMIENTO' +
          ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID' +
          '   AND MO_CONTRATO = RC_CONTRATO' +
          '   AND RC_PERIODO = MO_PERIODO' +
          '   AND RC_CONTRATO = :Contrato' +
          '   AND RC_PERIODO ' + sOperador + ' :Periodo';

  Result := ValorSQLEx(sSQL, [iContrato, Periodo]);

  if Result = '' then
    Result := Periodo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCuadroComparativo.FormCreate(Sender: TObject);
begin
  fraClase1.Clave := 'CODEV';

  VCLExtra.LockControls( gbCuadroCuota, True );
  VCLExtra.LockControls( gbCuadroTrabajadores, True );
  VCLExtra.LockControls( gbCuadroPeriodo, False );
end;
{-------------------------------------------------------------------------------}
end.
