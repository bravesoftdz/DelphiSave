unit unDetallePagosFondoGarantia;

interface                

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArt, unCustomGridABM, StdCtrls, FormPanel, Mask,
  ToolEdit, CurrEdit, RxToolEdit, RxCurrEdit, RxPlacemnt, PeriodoPicker;

type
  TfrmDetallePagosFondoGarantia = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    Label10: TLabel;
    edDP_IMPORTE: TCurrencyEdit;
    edDP_PERIODO: TPeriodoPicker;
    Label1: TLabel;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    FIdDetallePago: TTableId;
    FHuboModificaciones: Boolean;
    procedure SetIdDetallePago(const Value: TTableId);
    procedure CalcTotales;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
    property IdDetallePago: TTableId       read FIdDetallePago       write SetIdDetallePago;
    property HuboModificaciones: Boolean   read FHuboModificaciones  write FHuboModificaciones;
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('IMPORTE');

var
  frmDetallePagosFondoGarantia: TfrmDetallePagosFondoGarantia;
  TotalConsulta: Array of Extended;

implementation

uses
  AnsiSql, DbFuncs, Strfuncs, CustomDlgs, General, SqlFuncs, unDmPrincipal;

{$R *.dfm}

procedure TfrmDetallePagosFondoGarantia.ClearData;
begin
  inherited;
end;

procedure TfrmDetallePagosFondoGarantia.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT PF_ID NRO_PAGO, CO_CONTRATOPRINCIPAL CONTRATO, EM_NOMBRE NOMBRE, EM_CUIT CUIT, ' +
                 'DP_PERIODO PERIODO, DP_IMPORTE IMPORTE, DP_DIAS DIAS, DP_ID IDZPD, ' +
                 'ART.AFILIACION.GET_CODREGIMEN(CO_IDTIPOREGIMEN_ORIG) CODREG ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO_EXT, ZDP_DETALLEPAGOFONDOGTIA, ZPF_PAGOFONDOGARANTIA ' +
           'WHERE PF_ID = DP_IDPAGO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CO_CONTRATO = DP_CONTRATO ' +
             'AND PF_ID = ' + SqlValue(FIdDetallePago);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmDetallePagosFondoGarantia.SetIdDetallePago(const Value: TTableId);
begin
  if FIdDetallePago <> Value then
    begin
      FIdDetallePago := Value;
      RefreshData;
    end;
end;

procedure TfrmDetallePagosFondoGarantia.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmDetallePagosFondoGarantia.CalcTotales;
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

procedure TfrmDetallePagosFondoGarantia.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmDetallePagosFondoGarantia.FormCreate(Sender: TObject);
begin
  inherited;

  FHuboModificaciones := False;

  SetLength(TotalConsulta, MAXCOLS + 1);
  Sql.TableName := 'ZDP_DETALLEPAGOFONDOGTIA';
end;

procedure TfrmDetallePagosFondoGarantia.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

function TfrmDetallePagosFondoGarantia.DoABM: Boolean;
var
  sSql: String;
begin
  BeginTrans;
  try
    with Sql do
      begin
        Clear;

        PrimaryKey.Add('DP_ID',   sdqConsulta.FieldByName('IDZPD').AsInteger);
        Fields.Add('DP_PERIODO',  edDP_PERIODO.Periodo.Valor);
        Fields.Add('DP_IMPORTE',  edDP_IMPORTE.Value);

        SqlType := stUpdate;
      end;

    Result := inherited DoABM;

    sSql := 'UPDATE ZPF_PAGOFONDOGARANTIA ' +
               'SET PF_IMPORTE = (SELECT NVL(SUM(DP_IMPORTE), 0) ' +
                                   'FROM ZDP_DETALLEPAGOFONDOGTIA ' +
                                  'WHERE DP_IDPAGO = :Id) ' +
             'WHERE PF_ID = :Id';
    EjecutarSqlSTEx(sSql, [FIdDetallePago, FIdDetallePago]);

    FHuboModificaciones := True;
    CommitTrans;
  except
    on E:Exception do
    begin
      Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmDetallePagosFondoGarantia.LoadControls;
begin
  edDP_IMPORTE.Value         := sdqConsulta.FieldByName('IMPORTE').AsFloat;
  edDP_PERIODO.Periodo.Valor := sdqConsulta.FieldByName('PERIODO').AsString;
end;

function TfrmDetallePagosFondoGarantia.Validar: Boolean;
begin
  Verificar(IsEmptyString(edDP_PERIODO.Periodo.Valor), edDP_PERIODO, 'Debe indicar el periodo.');

  Result := True;
end;

end.
