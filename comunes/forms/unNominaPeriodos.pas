unit unNominaPeriodos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  PeriodoPicker, StdCtrls, Mask, PatternEdit, CardinalEdit;

type
  TfrmNominaPeriodos = class(TfrmCustomConsulta)
    edPeriodo: TPeriodoPicker;
    tbAnterior: TToolButton;
    tbSiguiente: TToolButton;
    ToolButton1: TToolButton;
    pnlOrigen: TPanel;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    pnlBottom: TPanel;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure edPeriodoExit(Sender: TObject);
    procedure FSFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    fCUIT: string;
    fPeriodo: string;
    procedure SetPeriodo(const Value: string);
    procedure SetCUIT(const Value: string);
    procedure CalcTotales;
  public
    function Get_PeriodoBusqueda(CUIT, Periodo: string; TipoBusqueda: char): string;
    procedure Actualizar;

    property CUIT: string    read fCUIT    write SetCUIT;
    property Periodo: string read fPeriodo write SetPeriodo;
  end;

var
  frmNominaPeriodos: TfrmNominaPeriodos;

implementation

uses
  unDmPrincipal, CustomDlgs, Periodo, unPrincipal, unCobranzas, VCLExtra, Math,
  unGrids;

const CAPTION_BASE = 'Nómina por períodos - ';

{$R *.DFM}

procedure TfrmNominaPeriodos.Actualizar;
begin
  tbRefrescarClick(nil);
end;

function TfrmNominaPeriodos.Get_PeriodoBusqueda(CUIT, Periodo: string; TipoBusqueda: char): string;
var
  sSql, sFuncion, sOperador: string;
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

  sSql := 'SELECT ' + sFuncion + '(NR_PERIOD)' +
           ' FROM ZNR_NOMREC' +
          ' WHERE NR_CUIT = :CUIT' +
            ' AND NR_PERIOD ' + sOperador + ' :PERIODO';

  Result := ValorSQLEx(sSQL, [CUIT, Periodo]);

  if Result = '' then
    Result := Periodo;
end;

procedure TfrmNominaPeriodos.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT NR_CUIL, TJ_NOMBRE, NR_REMIMSS' +
           ' FROM CTJ_TRABAJADOR, ZNR_NOMREC' +
          ' WHERE TJ_CUIL = NR_CUIL' +
            ' AND NR_CUIT = :CUIT' +
            ' AND NR_PERIOD = :PERIODO' +
            ' AND NR_RECEP IS NOT NULL';

  with sdqConsulta do
  begin
    Params.Clear;
    SQL.Text := sSql + SortDialog.OrderBy;
    Prepare;
    SetParamValues([fCUIT, fPeriodo], Params);
  end;

  inherited;

  CalcTotales;

  if sdqConsulta.IsEmpty then
    InvalidHint(edPeriodo, 'No existen datos para esta selección.');
end;

procedure TfrmNominaPeriodos.SetPeriodo(const Value: string);
begin
  fPeriodo := Value;
  edPeriodo.Periodo.Valor := fPeriodo;
  Actualizar;
end;

procedure TfrmNominaPeriodos.tbAnteriorClick(Sender: TObject);
begin
  Periodo := Get_PeriodoBusqueda(CUIT, Periodo, 'A');
end;

procedure TfrmNominaPeriodos.tbSiguienteClick(Sender: TObject);
begin
  Periodo := Get_PeriodoBusqueda(CUIT, Periodo, 'S');
end;

procedure TfrmNominaPeriodos.edPeriodoExit(Sender: TObject);
begin
  Periodo := edPeriodo.Periodo.Valor;
end;

procedure TfrmNominaPeriodos.SetCUIT(const Value: string);
begin
  fCUIT := Value;
  Caption := CAPTION_BASE + ValorSQLEx('SELECT EM_NOMBRE FROM AEM_EMPRESA WHERE EM_CUIT = :CUIT', [fCUIT]);
end;

procedure TfrmNominaPeriodos.FSFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_SUBTRACT :
      if ssCtrl in Shift then
        tbAnterior.Click;
    VK_ADD :
      if ssCtrl in Shift then
        tbSiguiente.Click;
  end;

  inherited;
end;

procedure TfrmNominaPeriodos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  pnlOrigen.Caption := ValorSQLEx('SELECT DECODE(RN_RECEPC, ' + ZMO_RECEPCION_DGI + ', ''AFIP'', ' +
                                                                ZMO_RECEPCION_MANUAL + ', ''Manual'', ' +
                                                                ZMO_RECEPCION_MIXTA + ', ''Diskette'', ' +
                                                                ZMO_RECEPCION_AUTOMATICA + ', ''Mixto'')' +
                                   ' FROM ZRN_RESNOM' +
                                  ' WHERE RN_CUIT = :CUIT' +
                                    ' AND RN_PERIOD = :PERIODO', [CUIT, Periodo]);

  //pnlTotalRegistros.Left := 350;

  if sdqConsulta.FieldByName( 'NR_REMIMSS' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqConsulta.FieldByName( 'NR_REMIMSS' ) ).Currency := True;

  DynColWidthsByData(Grid);
  Grid.ColumnByField['TJ_NOMBRE'].Width := Max(Grid.ColumnByField['TJ_NOMBRE'].Width, 300);
  Width := Min(Screen.Width, GetColumnWidths(Grid, True));  
end;

procedure TfrmNominaPeriodos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;

procedure TfrmNominaPeriodos.CalcTotales;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

end.

