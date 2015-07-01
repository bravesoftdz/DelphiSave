unit unLiquidacionesExigibles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmLiquidacionesExigibles = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    procedure CalcTotales;
  public
  end;

const
  MAXCOLS = 7;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('SALDOINICIAL', 'LIQUIDACIONES', 'RETOS', 'RETIB', 'RETGCIAS', 'RETIVA', 'CHEQUES', 'SALDOFINAL');

var
  frmLiquidacionesExigibles: TfrmLiquidacionesExigibles;
  TotalConsulta: array of extended;

implementation

uses
  CustomDlgs, AnsiSql, Strfuncs, DbFuncs, General;

{$R *.dfm}

procedure TfrmLiquidacionesExigibles.tbRefrescarClick(Sender: TObject);
var
  sSqlDatos, sSql, sSql1, sSql2, sWhere1, sWhere2: String;
begin
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe ingresar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe ingresar la fecha hasta.');

  sSql := 'SELECT CUIT, NOMBRE, COMISION.GET_SILIQSNOEXIGIBLES(CUIT, :Desde) SALDOINICIAL, ROUND(SUM(LIQUIDACION), 2) LIQUIDACIONES, ' +
                 'ROUND(SUM(OBRASOCIAL), 2) RETOS, ROUND(SUM(INGBRUTOS), 2) RETIB, ROUND(SUM(GANANCIAS), 2) RETGCIAS, ' +
                 'ROUND(SUM(RETIVA), 2) RETIVA, ROUND(SUM(CHEQUE), 2) CHEQUES, ' +
                 'COMISION.GET_SILIQSNOEXIGIBLES(CUIT, :Desde) + ROUND(SUM(LIQUIDACION), 2) ' +
                 '-(ROUND(SUM(OBRASOCIAL), 2) + ROUND(SUM(INGBRUTOS), 2) + ROUND(SUM(GANANCIAS), 2) + ROUND(SUM(RETIVA), 2) ' +
                 '+ ROUND(SUM(CHEQUE), 2)) SALDOFINAL ' +
            'FROM ';

  sSql1 := 'SELECT VE_CUIT CUIT, VE_NOMBRE NOMBRE, (LC_COMISION + LC_IVA) * LF_MONTO /(LC_COMISION + LC_IVA) LIQUIDACION, ' +
                  'LC_OBRASOCIAL * LF_MONTO /(LC_COMISION + LC_IVA) OBRASOCIAL, ' +
                  'LC_INGBRUTOS * LF_MONTO /(LC_COMISION + LC_IVA) INGBRUTOS, ' +
                  'LC_GANANCIAS * LF_MONTO /(LC_COMISION + LC_IVA) GANANCIAS, LC_RETIVA * LF_MONTO/(LC_COMISION + LC_IVA) RETIVA, 0 CHEQUE ' +
             'FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA, XLF_LIQFACTURA, XLC_LIQCOMISION ' +
            'WHERE EV_ID = FC_IDENTIDADVEND ' +
              'AND VE_ID = EV_IDVENDEDOR ' +
              'AND FC_ID = LF_IDFACTURA ' +
              'AND LC_ID = LF_IDLIQCOMISION ' +
              'AND LF_FECHABAJA IS NULL ';

  sSql2 := 'SELECT VE_CUIT CUIT, VE_NOMBRE NOMBRE, 0 LIQUIDACION, -LC_OBRASOCIAL * LF_MONTO /(LC_COMISION + LC_IVA) OBRASOCIAL, ' +
                  '-LC_INGBRUTOS * LF_MONTO /(LC_COMISION + LC_IVA) INGBRUTOS, ' +
                  '-LC_GANANCIAS * LF_MONTO /(LC_COMISION + LC_IVA) GANANCIAS, ' +
                  '-LC_RETIVA * LF_MONTO /(LC_COMISION + LC_IVA) RETIVA, ' +
                  '(LC_COMISION + LC_IVA) * LF_MONTO /(LC_COMISION + LC_IVA) CHEQUE ' +
             'FROM RCE_CHEQUEEMITIDO, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA, XLF_LIQFACTURA, XLC_LIQCOMISION ' +
            'WHERE EV_ID = FC_IDENTIDADVEND ' +
              'AND VE_ID = EV_IDVENDEDOR ' +
              'AND FC_ID = LF_IDFACTURA ' +
              'AND LC_ID = LF_IDLIQCOMISION ' +
              'AND CE_ID = FC_IDCHEQUEEMITIDO ' +
              'AND LF_FECHABAJA IS NULL ';

  sWhere1 := SqlBetweenDateTime(' AND FC_FECHAAPROBADO ', edFechaDesde.Date, edFechaHasta.Date);
  sWhere2 := SqlBetweenDateTime(' AND CE_FECHACHEQUE ', edFechaDesde.Date, edFechaHasta.Date);

  sSqlDatos := sSql1 + sWhere1 +
               ' UNION ALL ' +
               sSql2 + sWhere2;

  sdqConsulta.SQL.Text := sSql + '(' + sSqlDatos + ')' +
                          ' GROUP BY CUIT, NOMBRE ' + SortDialog.OrderBy ;
  sdqConsulta.ParamByName('Desde').AsDateTime := edFechaDesde.Date;

  inherited;

  CalcTotales;
end;

procedure TfrmLiquidacionesExigibles.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName( 'SALDOINICIAL' ) is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
     TFloatField( sdqConsulta.FieldByName( 'SALDOINICIAL' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'LIQUIDACIONES' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'LIQUIDACIONES' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'RETOS' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'RETOS' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'RETIB' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'RETIB' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'RETGCIAS' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'RETGCIAS' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'RETIVA' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'RETIVA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'CHEQUES' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'CHEQUES' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'SALDOFINAL' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'SALDOFINAL' ) ).Currency := True;
end;

procedure TfrmLiquidacionesExigibles.CalcTotales;
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
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmLiquidacionesExigibles.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmLiquidacionesExigibles.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmLiquidacionesExigibles.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmLiquidacionesExigibles.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

end.

