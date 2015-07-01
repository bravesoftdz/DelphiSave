unit unReservasRecExtraordinarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  PeriodoPicker, Vcl.StdCtrls;

type
  TfrmReservasRecExtraordinarios = class(TfrmCustomConsulta)
    gbPeriodo: TGroupBox;
    edPeriodo: TPeriodoPicker;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CalcTotales;
  public
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

var
  frmReservasRecExtraordinarios: TfrmReservasRecExtraordinarios;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 2;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('RECURSO', 'DEDUCCIONES', 'RESERVA');

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, StrFuncs, unPrincipal,
  unImpoExpoWizard;

{$R *.dfm}

procedure TfrmReservasRecExtraordinarios.CalcTotales;
var
	PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmReservasRecExtraordinarios.ClearData;
begin
  inherited;

  edPeriodo.Clear;
  edPeriodo.SetFocus;
end;

procedure TfrmReservasRecExtraordinarios.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS  + 1);
end;

procedure TfrmReservasRecExtraordinarios.GridPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmReservasRecExtraordinarios.RefreshData;
var
  sWhere, sSql: String;
begin
  Verificar(edPeriodo.Periodo.IsNull, edPeriodo, 'Debe ingresar un periodo.');

  sSql := 'SELECT RR_PERIODO PERIODO, RR_CARPETA NRO_CARPETA, RR_IMPORTERECURSO RECURSO, ' +
                 'RR_DEDUCCIONES DEDUCCIONES, RR_RESERVA RESERVA ' +
            'FROM CONT.ORR_RESERVARECURSOEXT ' +
           'WHERE 1 = 1';

  sWhere := ' AND RR_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmReservasRecExtraordinarios.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  iLoop: Integer;
begin
  inherited;

  for iLoop := 0 to MAXCOLS do
    if sdqConsulta.FieldByName(CAMPOS_SUMA[iLoop]) is TFloatField then
      TFloatField(sdqConsulta.FieldByName(CAMPOS_SUMA[iLoop])).Currency := True;
end;

procedure TfrmReservasRecExtraordinarios.tbNuevoClick(Sender: TObject);
begin
  ImpoExpoWizard('CCRRE');
end;

procedure TfrmReservasRecExtraordinarios.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

end.

