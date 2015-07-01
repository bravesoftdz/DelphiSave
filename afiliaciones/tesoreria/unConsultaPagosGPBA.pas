unit unConsultaPagosGPBA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox;
            
type
  TfrmConsultaPagosGPBA = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    tbCargarTabla: TToolButton;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbCargarTablaClick(Sender: TObject);
  private
  public
  protected
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 3;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('LIQUIDADO', 'CONTRIBUCIONES', 'APORTES', 'COSTO');

var
  frmConsultaPagosGPBA: TfrmConsultaPagosGPBA;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, StrFuncs, unPrincipal,
  DateTimeFuncs, unImpoExpoWizard;

{$R *.dfm}

procedure TfrmConsultaPagosGPBA.RefreshData;
var
  sSql: String;
begin
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe indicar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe indicar la fecha hasta.');

  sSql := '/* SINIESTROS DEL PERIODO */ ' +
          'SELECT GP_SINIESTRO SINIESTRO, GP_ORDEN ORDEN, GP_RECAIDA RECAIDA, GP_USUAPROBADO USUAPROBADO, GP_FECHAAPROBADO FECHAAPROBADO, GP_JUICIOS JUICIOS, GP_CIE10 CIE10, ' +
                 'GP_DESCCIE10 DESCCIE10, GP_CUIL CUIL, GP_TRABAJADOR TRABAJADOR, GP_CUIT CUIT, GP_ORGANISMO ORGANISMO, GP_FECHAACCIDENTE FECHAACCIDENTE, GP_FECHADENUNCIA FECHADENUNCIA, ' +
                 'GP_CONPAGO CONPAGO, GP_GRUPOPAGO GRUPOPAGO, GP_BASEORIGEN BASEORIGEN, GP_ESTADO ESTADO, GP_FECHAFACTURA FECHAFACTURA, GP_FECHACARGA FECHACARGA, GP_FECHADESDE FECHADESDE, ' +
                 'GP_FECHAHASTA FECHAHASTA, GP_FORMULA FORMULA, GP_LIQUIDADO LIQUIDADO, GP_CONTRIBUCIONES CONTRIBUCIONES, GP_APORTES APORTES, GP_COSTO COSTO, GP_CUITPRESTADOR CUITPRESTADOR, ' +
                 'GP_NOMBREPRESTADOR NOMBREPRESTADOR, GP_LIQUIDACION LIQUIDACION, GP_VOLANTE VOLANTE, GP_FACTURA FACTURA, GP_TIPOACREEDOR TIPOACREEDOR, GP_ORDENPAGO ORDENPAGO, GP_CHEQUE CHEQUE, ' +
                 'GP_FECHACHEQUE FECHACHEQUE, GP_FECHADEBITADO FECHADEBITADO, GP_FECHAEXIGIBLE FECHAEXIGIBLE ' +
            'FROM V_OGP_GPBAPAGO, ACTUARIAL.SSG_STOCK_SINIESTROS_GBA ' +
           'WHERE GP_SINIESTRO = SG_SINIESTRO ' +
             'AND GP_ORDEN = SG_ORDEN ' +
             'AND GP_RECAIDA = SG_RECAIDA ' +
             'AND NVL(SG_FECHABAJA, SYSDATE) > GP_FECHAAPROBADO ' +
             'AND GP_FECHAAPROBADO BETWEEN ' + SqlValue(edFechaDesde.Date) + ' AND ' + SqlValue(edFechaHasta.Date) + ' ' +
           'UNION ALL ' +
          '/* BAJAS */ ' +
          'SELECT GP_SINIESTRO, GP_ORDEN, GP_RECAIDA, GP_USUAPROBADO, GP_FECHAAPROBADO, GP_JUICIOS, GP_CIE10, ' +
                 'GP_DESCCIE10, GP_CUIL, GP_TRABAJADOR, GP_CUIT, GP_ORGANISMO, GP_FECHAACCIDENTE, GP_FECHADENUNCIA, ' +
                 'GP_CONPAGO, GP_GRUPOPAGO, GP_BASEORIGEN, GP_ESTADO, GP_FECHAFACTURA, GP_FECHACARGA, GP_FECHADESDE, ' +
                 'GP_FECHAHASTA, GP_FORMULA, GP_LIQUIDADO, GP_CONTRIBUCIONES, GP_APORTES, -GP_COSTO, GP_CUITPRESTADOR, ' +
                 'GP_NOMBREPRESTADOR, GP_LIQUIDACION, GP_VOLANTE, GP_FACTURA, GP_TIPOACREEDOR, GP_ORDENPAGO, GP_CHEQUE, ' +
                 'GP_FECHACHEQUE, GP_FECHADEBITADO, GP_FECHAEXIGIBLE ' +
            'FROM V_OGP_GPBAPAGO, ACTUARIAL.SSG_STOCK_SINIESTROS_GBA ' +
           'WHERE GP_SINIESTRO = SG_SINIESTRO ' +
             'AND GP_ORDEN = SG_ORDEN ' +
             'AND GP_RECAIDA = SG_RECAIDA ' +
             'AND NVL(SG_FECHABAJA, SYSDATE) > GP_FECHAAPROBADO ' +
             'AND SG_FECHABAJA BETWEEN ' + SqlValue(edFechaDesde.Date) + ' AND ' + SqlValue(edFechaHasta.Date) + ' ' +
           'UNION ALL ' +
          '/* ALTA DE SINIESTROS ANTERIORES */ ' +
          'SELECT GP_SINIESTRO, GP_ORDEN, GP_RECAIDA, GP_USUAPROBADO, GP_FECHAAPROBADO, GP_JUICIOS, GP_CIE10, ' +
                 'GP_DESCCIE10, GP_CUIL, GP_TRABAJADOR, GP_CUIT, GP_ORGANISMO, GP_FECHAACCIDENTE, GP_FECHADENUNCIA, ' +
                 'GP_CONPAGO, GP_GRUPOPAGO, GP_BASEORIGEN, GP_ESTADO, GP_FECHAFACTURA, GP_FECHACARGA, GP_FECHADESDE, ' +
                 'GP_FECHAHASTA, GP_FORMULA, GP_LIQUIDADO, GP_CONTRIBUCIONES, GP_APORTES, GP_COSTO, GP_CUITPRESTADOR, ' +
                 'GP_NOMBREPRESTADOR, GP_LIQUIDACION, GP_VOLANTE, GP_FACTURA, GP_TIPOACREEDOR, GP_ORDENPAGO, GP_CHEQUE, ' +
                 'GP_FECHACHEQUE, GP_FECHADEBITADO, GP_FECHAEXIGIBLE ' +
            'FROM V_OGP_GPBAPAGO, ACTUARIAL.SSG_STOCK_SINIESTROS_GBA ' +
           'WHERE GP_SINIESTRO = SG_SINIESTRO ' +
             'AND GP_ORDEN = SG_ORDEN ' +
             'AND GP_RECAIDA = SG_RECAIDA ' +
             'AND NVL(SG_FECHABAJA, SYSDATE) > GP_FECHAAPROBADO ' +
             'AND SG_SITUACION <> ''P'' ' +
             'AND SG_FECHALTA BETWEEN ' + SqlValue(edFechaDesde.Date) + ' AND ' + SqlValue(edFechaHasta.Date) + ' ' +
             'AND GP_FECHAAPROBADO < ' + SqlValue(edFechaDesde.Date);

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmConsultaPagosGPBA.tbLimpiarClick(Sender: TObject);
begin
  edFechaDesde.Clear;
  edFechaHasta.Clear;

  inherited;
end;

procedure TfrmConsultaPagosGPBA.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmConsultaPagosGPBA.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmConsultaPagosGPBA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('LIQUIDADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('LIQUIDADO')).Currency := True;

  if sdqConsulta.FieldByName('CONTRIBUCIONES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('CONTRIBUCIONES')).Currency := True;

  if sdqConsulta.FieldByName('APORTES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('APORTES')).Currency := True;

  if sdqConsulta.FieldByName('COSTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('COSTO')).Currency := True;
end;

procedure TfrmConsultaPagosGPBA.tbSumatoriaClick(Sender: TObject);
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

procedure TfrmConsultaPagosGPBA.tbCargarTablaClick(Sender: TObject);
begin
  ImpoExpoWizard('GPBA');
end;

end.

