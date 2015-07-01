unit unDetalleRemesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArt, RxPlacemnt;

type
  TfrmDetalleRemesa = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    FIdRemesa: TTableId;
    procedure SetIdRemesa(const Value: TTableId);
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
  public
    property IdRemesa: TTableId    read FIdRemesa    write SetIdRemesa;
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('IMPORTE');

var
  frmDetalleRemesa: TfrmDetalleRemesa;
  TotalConsulta : array of extended;

implementation

uses
  CustomDlgs, General, AnsiSQL, SqlFuncs, DbFuncs, Strfuncs;

{$R *.dfm}

procedure TfrmDetalleRemesa.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT EM_CUIT CUIT, EM_NOMBRE NOMBRE, CO_CONTRATO CONTRATO, MO_PERIODO PERIODO, CM_CODIGO CODIGO, ' +
                 'CM_DESCRIPCION DESCRIPCION, MO_FECHARECA FECHA_RECAUDACION, MO_IMPORTE IMPORTE ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO, ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO ' +
           'WHERE CM_ID = MO_IDCODIGOMOVIMIENTO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CO_CONTRATO = MO_CONTRATOPRINCIPAL ' +
             'AND MO_IDREMESA = ' + SqlValue(IdRemesa);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmDetalleRemesa.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmDetalleRemesa.SetIdRemesa(const Value: TTableId);
begin
  FIdRemesa := Value;
  RefreshData;
end;

procedure TfrmDetalleRemesa.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active Then
      begin
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
      end;
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmDetalleRemesa.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS+1);
end;

procedure TfrmDetalleRemesa.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmDetalleRemesa.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

end.

