unit unLiquidacionesNoExigibles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmLiquidacionesNoExigibles = class(TfrmCustomConsulta)
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
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('SALDOINICIAL', 'LIQUIDACIONES', 'RETOS', 'RETIB', 'RETGCIAS', 'RETIVA', 'FACTURAS', 'SALDOFINAL');

var
  frmLiquidacionesNoExigibles: TfrmLiquidacionesNoExigibles;
  TotalConsulta: array of extended;

implementation

uses
  CustomDlgs, AnsiSql, Strfuncs, DbFuncs, General;

{$R *.dfm}

procedure TfrmLiquidacionesNoExigibles.tbRefrescarClick(Sender: TObject);
var
  sSqlDatos, sSql, sSql1, sSql2, sSql3, sSql4, sSql5: String;
  sWhere1, sWhere2, sWhere3, sWhere4, sWhere5: String;
begin
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe ingresar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe ingresar la fecha hasta.');

  sSql := 'SELECT CUIT, NOMBRE, COMISION.GET_SILIQSNOEXIGIBLES(CUIT, :Desde) SALDOINICIAL, ' +
                 'ROUND(SUM(LIQUIDACION), 2) LIQUIDACIONES, ROUND(SUM(OBRASOCIAL), 2) RETOS, ROUND(SUM(INGBRUTOS),2) RETIB, ' +
                 'ROUND(SUM(GANANCIAS), 2) RETGCIAS, ROUND(SUM(RETIVA), 2) RETIVA, ROUND(SUM(FACTURA), 2) FACTURAS, ' +
                 'COMISION.GET_SILIQSNOEXIGIBLES(CUIT, :Desde) + ROUND(SUM(LIQUIDACION), 2) - ' +
                 '(ROUND(SUM(OBRASOCIAL), 2) + ROUND(SUM(INGBRUTOS),2) + ROUND(SUM(GANANCIAS), 2) + ' +
                 'ROUND(SUM(RETIVA), 2) + ROUND(SUM(FACTURA), 2)) SALDOFINAL ' +
            'FROM ';

  sSql1 := 'SELECT EN_CUIT CUIT, EN_NOMBRE NOMBRE, LC_COMISION + LC_IVA LIQUIDACION, LC_OBRASOCIAL OBRASOCIAL, ' +
                  'LC_INGBRUTOS INGBRUTOS, LC_GANANCIAS GANANCIAS, LC_RETIVA RETIVA, 0 FACTURA ' +
             'FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
            'WHERE EN_ID = LC_IDENTIDAD ' +
              'AND LC_COMISION <> 0 ';

  sSql2 := 'SELECT VE_CUIT CUIT, VE_NOMBRE NOMBRE, LC_COMISION + LC_IVA LIQUIDACION, LC_OBRASOCIAL OBRASOCIAL, ' +
                  'LC_INGBRUTOS INGBRUTOS, LC_GANANCIAS GANANCIAS, LC_RETIVA RETIVA, 0 FACTURA ' +
             'FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
            'WHERE EV_ID = LC_IDENTIDADVENDEDOR ' +
              'AND EN_ID = EV_IDENTIDAD ' +
              'AND VE_ID = EV_IDVENDEDOR ' +
              'AND LC_COMISION <> 0 ';

  sSql3 := 'SELECT EN_CUIT CUIT, EN_NOMBRE NOMBRE, -(LC_COMISION + LC_IVA) LIQUIDACION, -LC_OBRASOCIAL OBRASOCIAL, ' +
                  '-LC_INGBRUTOS INGBRUTOS, -LC_GANANCIAS GANANCIAS, -LC_RETIVA RETIVA, 0 FACTURA ' +
             'FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
            'WHERE EN_ID = LC_IDENTIDAD ' +
              'AND LC_ESTADO = ''C'' ' +
              'AND LC_COMISION <> 0 ';

  sSql4 := 'SELECT VE_CUIT CUIT, VE_NOMBRE NOMBRE, -(LC_COMISION + LC_IVA) LIQUIDACION, -LC_OBRASOCIAL OBRASOCIAL, ' +
                  '-LC_INGBRUTOS INGBRUTOS, -LC_GANANCIAS GANANCIAS, -LC_RETIVA RETIVA, 0 FACTURA ' +
             'FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
            'WHERE EV_ID = LC_IDENTIDADVENDEDOR ' +
              'AND VE_ID = EV_IDVENDEDOR ' +
              'AND LC_ESTADO = ''C'' ' +
              'AND LC_COMISION <> 0 ';

  sSql5 := 'SELECT VE_CUIT CUIT, VE_NOMBRE NOMBRE, 0 LIQUIDACION, -LC_OBRASOCIAL * LF_MONTO /(LC_COMISION + LC_IVA) OBRASOCIAL, ' +
                  '-LC_INGBRUTOS * LF_MONTO /(LC_COMISION + LC_IVA) INGBRUTOS, ' +
                  '-LC_GANANCIAS * LF_MONTO /(LC_COMISION + LC_IVA) GANANCIAS, ' +
                  '-LC_RETIVA * LF_MONTO /(LC_COMISION + LC_IVA) RETIVA, ' +
                  '(LC_COMISION + LC_IVA) * LF_MONTO /(LC_COMISION + LC_IVA) FACTURA ' +
             'FROM XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTURA, XLF_LIQFACTURA, XLC_LIQCOMISION ' +
            'WHERE EV_ID = FC_IDENTIDADVEND ' +
              'AND VE_ID = EV_IDVENDEDOR ' +
              'AND FC_ID = LF_IDFACTURA ' +
              'AND LC_ID = LF_IDLIQCOMISION ' +
              'AND LF_FECHABAJA IS NULL ';

  sWhere1 := SqlBetweenDateTime(' AND LC_FECHACONTABLE ', edFechaDesde.Date, edFechaHasta.Date);
  sWhere2 := SqlBetweenDateTime(' AND LC_FECHACONTABLE ', edFechaDesde.Date, edFechaHasta.Date);
  sWhere3 := SqlBetweenDateTime(' AND LC_FECHAMODIF ', edFechaDesde.Date, edFechaHasta.Date);
  sWhere4 := SqlBetweenDateTime(' AND LC_FECHAMODIF ', edFechaDesde.Date, edFechaHasta.Date);
  sWhere5 := SqlBetweenDateTime(' AND FC_FECHAAPROBADO ', edFechaDesde.Date, edFechaHasta.Date);

  sSqlDatos := sSql1 + sWhere1 +
               ' UNION ALL ' +
               sSql2 + sWhere2 +
               ' UNION ALL ' +
               sSql3 + sWhere3 +
               ' UNION ALL ' +
               sSql4 + sWhere4 +
               ' UNION ALL ' +
               sSql5 + sWhere5;

  sdqConsulta.SQL.Text := sSql + '(' + sSqlDatos + ')' +
                          ' GROUP BY CUIT, NOMBRE ' + SortDialog.OrderBy ;
  sdqConsulta.ParamByName('Desde').AsDateTime := edFechaDesde.Date;

  inherited;

  CalcTotales;
end;

procedure TfrmLiquidacionesNoExigibles.sdqConsultaAfterOpen(DataSet: TDataSet);
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

  if sdqConsulta.FieldByName( 'FACTURAS' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'FACTURAS' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'SALDOFINAL' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'SALDOFINAL' ) ).Currency := True;
end;

procedure TfrmLiquidacionesNoExigibles.CalcTotales;
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

procedure TfrmLiquidacionesNoExigibles.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmLiquidacionesNoExigibles.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmLiquidacionesNoExigibles.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmLiquidacionesNoExigibles.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

end.

