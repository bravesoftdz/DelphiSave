unit unDetallePagosExcesoPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArt, RxPlacemnt;

type
  TfrmDetallePagosExcesoPagos = class(TfrmCustomConsulta)
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    FIdDetallePago: TTableId;
    procedure SetIdDetallePago(const Value: TTableId);
    procedure CalcTotales;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  public
    property IdDetallePago: TTableId       read FIdDetallePago      write SetIdDetallePago;
  end;

const
  MAXCOLS = 4;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('DE_EMITIDO', 'DE_PAGADO', 'DE_RECLAMOAFIP', 'DE_AJUSTESALDOACREEDOR', 'DE_DEVOLUCION');

var
  frmDetallePagosExcesoPagos: TfrmDetallePagosExcesoPagos;
  TotalConsulta: Array of Extended;

implementation

uses
  AnsiSql, DbFuncs, Strfuncs, CustomDlgs, General;

{$R *.dfm}

procedure TfrmDetallePagosExcesoPagos.ClearData;
begin
  inherited;
end;

procedure TfrmDetallePagosExcesoPagos.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT DE_PERIODO, DE_EMITIDO, DE_PAGADO, DE_RECLAMOAFIP, DE_AJUSTESALDOACREEDOR, DE_DEVOLUCION, ' +
                 'ART.AFILIACION.GET_CODREGIMENCONTRATO(PE_CONTRATO) CODREG ' +
            'FROM ZPE_DEVOLUCIONPAGOEXCESO, ZDE_DETALLEDEVOLPAGOEXCESO ' +
           'WHERE DE_IDDEVOLPAGOEXCESO = ' + SqlValue(FIdDetallePago) + ' ' +
             'AND DE_IDDEVOLPAGOEXCESO = PE_ID';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmDetallePagosExcesoPagos.SetIdDetallePago(const Value: TTableId);
begin
  if FIdDetallePago <> Value then
    begin
      FIdDetallePago := Value;
      RefreshData;
    end;
end;

procedure TfrmDetallePagosExcesoPagos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('DE_EMITIDO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DE_EMITIDO')).Currency := True;

  if sdqConsulta.FieldByName('DE_PAGADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DE_PAGADO')).Currency := True;

  if sdqConsulta.FieldByName('DE_RECLAMOAFIP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DE_RECLAMOAFIP')).Currency := True;

  if sdqConsulta.FieldByName('DE_AJUSTESALDOACREEDOR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DE_AJUSTESALDOACREEDOR')).Currency := True;

  if sdqConsulta.FieldByName('DE_DEVOLUCION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DE_DEVOLUCION')).Currency := True;
end;

procedure TfrmDetallePagosExcesoPagos.CalcTotales;
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
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmDetallePagosExcesoPagos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmDetallePagosExcesoPagos.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmDetallePagosExcesoPagos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

end.

