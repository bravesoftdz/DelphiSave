unit unMovimientosVistaPrevia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  PeriodoPicker, StdCtrls;

type
  TfrmMovimientosVistaPrevia = class(TfrmCustomConsulta)
    edPeriodo: TPeriodoPicker;
    tbAnterior: TToolButton;
    tbSiguiente: TToolButton;
    ToolButton7: TToolButton;
    tbSumatoria: TToolButton;
    Label1: TLabel;
    ColorDialog: TColorDialog;
    pnlRefSinAprobar: TPanel;
    ToolButton1: TToolButton;
    procedure FSFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pnlRefSinAprobarClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure edPeriodoExit(Sender: TObject);
  private
    fContrato: integer;
    fPeriodo: string;
    TotalConsulta : array of extended;
    procedure Actualizar;
    procedure SetContrato(const Value: integer);
    procedure SetPeriodo(const Value: string);
    procedure CalcTotales;
    function  Get_PeriodoBusqueda(Contrato: integer; Periodo: string; TipoBusqueda: char): string;
  public
    property Contrato : integer read fContrato write SetContrato;
    property Periodo  : string  read fPeriodo  write SetPeriodo;
  end;

var
  frmMovimientosVistaPrevia: TfrmMovimientosVistaPrevia;

implementation

uses
  unDmPrincipal, CustomDlgs, DbFuncs, General, StrFuncs, unPrincipal,
  unDmEmision;

const
  CAPTION_BASE = 'Movimientos | Estado de Cuenta [Empresa: %s - Contrato: %d]';
  CAMPOS_SUMA : array [0..1] of string = ('MT_COBRADO', 'MT_DEVENGADO');
  MAXCOLS = 1;

{$R *.DFM}

procedure TfrmMovimientosVistaPrevia.Actualizar;
begin
  tbRefrescarClick(nil);
end;

procedure TfrmMovimientosVistaPrevia.FSFormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TfrmMovimientosVistaPrevia.SetContrato(const Value: integer);
var
  cNombreEmpresa: string;
begin
  fContrato := Value;
  cNombreEmpresa := ValorSQLEx('SELECT EM_NOMBRE FROM AEM_EMPRESA, ACO_CONTRATO WHERE CO_IDEMPRESA = EM_ID AND CO_CONTRATO = :CONTRATO', [Value]);
  Caption := Format(CAPTION_BASE, [cNombreEmpresa, Value]);
end;

procedure TfrmMovimientosVistaPrevia.SetPeriodo(const Value: string);
begin
  fPeriodo := Value;
  edPeriodo.Periodo.Valor := fPeriodo;
  if fContrato > 0 then
    Actualizar;
end;

procedure TfrmMovimientosVistaPrevia.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT *' +
           ' FROM V_ZMT_MOVIMIENTOSTOTALES' +
          ' WHERE MT_CONTRATO = :CONTRATO' +
            ' AND MT_PERIODO  = :PERIODO';

  with sdqConsulta do
  begin
    Params.Clear;
    SQL.Text := sSql + SortDialog.OrderBy;
    Prepare;
    SetParamValues([fContrato, fPeriodo], Params);
  end;

  inherited;

  if sdqConsulta.IsEmpty then
    InvalidHint(edPeriodo, 'No existen datos para esta selección.');
end;

procedure TfrmMovimientosVistaPrevia.sdqConsultaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    if FieldByName('MT_COBRADO') is TFloatField then
      TFloatField(FieldByName('MT_COBRADO')).Currency := True;
    if FieldByName('MT_DEVENGADO') is TFloatField then
      TFloatField(FieldByName('MT_DEVENGADO')).Currency := True;
  end; 
end;

procedure TfrmMovimientosVistaPrevia.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmMovimientosVistaPrevia.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmMovimientosVistaPrevia.GridPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := '$ ' + ToStr( TotalConsulta[iPos] );
end;

procedure TfrmMovimientosVistaPrevia.FormCreate(Sender: TObject);
begin
  inherited;
  SetLength( TotalConsulta, MAXCOLS+1 );
end;

procedure TfrmMovimientosVistaPrevia.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Assigned(Field) then
    Exit;

  if ( UpperCase( Field.FieldName ) = 'MT_PERIODO_FORMATEADO' ) then begin
    Background  := clBtnFace;
    AFont.Color := clWindowText;
  end else begin
    if ( sdqConsulta.FieldByName( 'MT_MARCA_APROBADO_PENDIENTE' ).AsString = 'P' ) then
    begin
      Background  := pnlRefSinAprobar.Color;
      AFont.Color := pnlRefSinAprobar.Font.Color;
    end else begin
      Background  := clWhite;
      AFont.Color := clWindowText;
    end;
  end;
end;

procedure TfrmMovimientosVistaPrevia.pnlRefSinAprobarClick(
  Sender: TObject);
begin
  if ColorDialog.Execute then
  begin
    pnlRefSinAprobar.Color := ColorDialog.Color;
    Grid.Repaint;
  end;
end;

procedure TfrmMovimientosVistaPrevia.tbSiguienteClick(Sender: TObject);
begin
  Periodo := Get_PeriodoBusqueda(Contrato, Periodo, 'S');
end;

procedure TfrmMovimientosVistaPrevia.tbAnteriorClick(Sender: TObject);
begin
  Periodo := Get_PeriodoBusqueda(Contrato, Periodo, 'A');
end;

function TfrmMovimientosVistaPrevia.Get_PeriodoBusqueda(Contrato: integer; Periodo: string; TipoBusqueda: char): string;
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

  sSql := 'SELECT ' + sFuncion + '(MT_PERIODO)' +
           ' FROM V_ZMT_MOVIMIENTOSTOTALES' +
          ' WHERE MT_CONTRATO = :CONTRATO' +
            ' AND MT_PERIODO ' + sOperador + ' :PERIODO';

  Result := ValorSQLEx(sSQL, [Contrato, Periodo]);

  if Result = '' then
    Result := Periodo;
end;

procedure TfrmMovimientosVistaPrevia.edPeriodoExit(Sender: TObject);
begin
  fPeriodo := edPeriodo.Periodo.Valor;
end;

end.
