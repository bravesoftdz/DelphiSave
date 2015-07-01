unit unCuentaCorriente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraVendedores,
  unfraVendedoresCUIT, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraEntidadCUIT, Mask, ToolEdit, DateComboBox,
  CurrEdit, Menus;

type
  TfrmCuentaCorriente = class(TfrmCustomGridABM)
    GBEntidad: TGroupBox;
    fraEntidad: TfraEntidadCUIT;
    GBVendedor: TGroupBox;
    fraVendedor: TfraVendedoresCUIT;
    GroupBox1: TGroupBox;
    edFecha: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edCC_DETALLE: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edSaldoInicial: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    edSaldoFinal: TCurrencyEdit;
    pmImpirmir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirReporte: TMenuItem;
    mnuImprimirDetPagos: TMenuItem;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraEntidadExit(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FSFormShow(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirReporteClick(Sender: TObject);
    procedure mnuImprimirDetPagosClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    procedure DoCargarDefaultFecha;
    procedure DoCargarSaldos(Tipo: String);
    procedure CalcTotales;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

const
  MAXCOLS = 1;
  CAMPOS_SUMA : Array [0..MAXCOLS] of String = ('DEBITO', 'CREDITO');

var
  frmCuentaCorriente: TfrmCuentaCorriente;
  TotalConsulta: array of extended;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, unArt, StrFuncs, DateTimeFuncs,
  unRptCuentaCorriente, unRPTComisionesConsulta, QuickRpt, DbFuncs, General,
  unSesion, unComisiones;

function TfrmCuentaCorriente.DoABM: Boolean;
var
  fId: TTableId;
begin
  with Sql do
    begin
      Clear;
      TableName := 'XCC_CUENTACORRIENTE';

      SqlType := stUpdate;

      fId := sdqConsulta.FieldByName('ID').AsInteger;
      PrimaryKey.Add('CC_ID', fId, False);

      Fields.Add('CC_DETALLE', Trim(edCC_DETALLE.Text));

      Result := inherited DOABM;
    end;
end;

procedure TfrmCuentaCorriente.LoadControls;
begin
  edCC_DETALLE.Text := sdqConsulta.FieldByName('DETALLE').AsString;
end;

procedure TfrmCuentaCorriente.RefreshData;
var
  sEjecutivo, sSql: String;
  idEntidad: TTableId;
begin
  Verificar(fraEntidad.IsEmpty and fraVendedor.IsEmpty, fraEntidad, 'Debe ingresar una entidad o un vendedor.');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe ingresar una fecha.');

  if Sesion.Sector = 'COME' then   // Comercial
    begin
      if fraEntidad.IsEmpty then
        idEntidad := fraVendedor.Entidad
      else
        idEntidad := StrToInt(fraEntidad.ID);

      sEjecutivo := Get_Ejecutivo(idEntidad);
      Verificar(not Sesion.DependeDe(sEjecutivo), nil, 'Solo el ejecutivo asignado o su responsable pueden modificar este registro.');
    end;

  DoCargarSaldos('I');
  DoCargarSaldos('F');

  // si se agrega algun campo al SELECT entonces agregarlo también en mnuImprimirReporteClick
  sSql := 'SELECT CC_FECHA FECHA, CC_CONCEPTO CONCEPTO, CC_TIPOCOMPROBANTE TIPO_COMPROBANTE, ' +
                 'CC_NROCOMPROBANTE NRO_COMPROBANTE, CC_DEBITO DEBITO, CC_CREDITO CREDITO, CC_DETALLE DETALLE, ' +
                 'CC_ID ID, CC_ESLIQUIDACION ESLIQUIDACION ' +
            'FROM V_XCC_CUENTACORRIENTE ' +
           'WHERE 1 = 1 ';

  if fraEntidad.IsSelected and fraVendedor.IsSelected then
    sSql := sSql + ' AND CC_IDENTVEND = ' + SqlValue(fraVendedor.EntidadVendedor)
  else if fraVendedor.IsSelected and fraEntidad.IsEmpty then
    sSql := sSql + ' AND CC_IDVENDEDOR = ' + SqlValue(fraVendedor.Value)
  else if fraEntidad.IsSelected then
    sSql := sSql + ' AND CC_IDENTIDAD = ' + SqlValue(fraEntidad.Value);

  if not edFecha.IsEmpty then
    sSql := sSql + ' AND CC_FECHA >= ' + SqlValue(edFecha.Date);

  sdqConsulta.SQL.Text := sSql + ' ORDER BY FECHA';

  inherited;
  CalcTotales;
end;

function TfrmCuentaCorriente.Validar: Boolean;
begin
  Verificar(IsEmptyString(edCC_DETALLE.Text), edCC_DETALLE, 'Debe ingresar el detalle.');

  Result := True;
end;

procedure TfrmCuentaCorriente.tbLimpiarClick(Sender: TObject);
begin
  edSaldoInicial.Clear;
  edSaldoFinal.Clear;

  fraEntidad.Clear;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraVendedor.Clear;
  DoCargarDefaultFecha;

  inherited;
end;

procedure TfrmCuentaCorriente.FormCreate(Sender: TObject);
begin
  fraEntidad.ShowBajas  := True;
  fraVendedor.ShowBajas := True;

  DoCargarDefaultFecha;

  SetLength(TotalConsulta, MAXCOLS + 1);

  inherited;
end;

procedure TfrmCuentaCorriente.fraEntidadExit(Sender: TObject);
begin
  inherited;
  fraEntidad.FrameExit(Sender);
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmCuentaCorriente.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('DEBITO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEBITO')).Currency := True;

  if sdqConsulta.FieldByName('CREDITO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('CREDITO')).Currency := True;
end;

procedure TfrmCuentaCorriente.DoCargarDefaultFecha;
begin
  edFecha.Date := ValorSqlDateTime('SELECT ADD_MONTHS(ACTUALDATE, -1) FROM DUAL');
end;

procedure TfrmCuentaCorriente.DoCargarSaldos(Tipo: String);
var
  sSql: String;
  dValor: Currency;
  fFecha: TDateTimeEx;
  Id: TTableId;
begin
  if fraEntidad.IsSelected and fraVendedor.IsSelected then
    begin
      sSql := 'SELECT COMISION.GET_SALDOCTACTE(:Fecha, :Tipo, NULL, NULL, :EntVend) ' +
                'FROM DUAL';
      Id   := fraVendedor.EntidadVendedor;
    end
  else if fraVendedor.IsSelected and fraEntidad.IsEmpty then
    begin
      sSql := 'SELECT COMISION.GET_SALDOCTACTE(:Fecha, :Tipo, NULL, :Vend) ' +
                'FROM DUAL';
      Id   := fraVendedor.Value;
    end
  else // fraEntidad.IsSelected
    begin
      sSql := 'SELECT COMISION.GET_SALDOCTACTE(:Fecha, :Tipo, :Ent) ' +
                'FROM DUAL';
      Id   := fraEntidad.Value;
    end;

  if Tipo = 'I' then
    fFecha := TDateTimeEx.Create(edFecha.Date)
  else
    fFecha := TDateTimeEx.Create(0);

  dValor := ValorSqlExtendedEx(sSql, [fFecha, Tipo, Id]);

  if Tipo = 'I' then
    edSaldoInicial.Value := dValor
  else
    edSaldoFinal.Value := dValor;
end;

procedure TfrmCuentaCorriente.FSFormShow(Sender: TObject);
begin
  ShowActived := False;
end;

procedure TfrmCuentaCorriente.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmCuentaCorriente.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmCuentaCorriente.mnuImprimirReporteClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla');

  sSql := 'SELECT ' + SqlValue(edFecha.Date) + ' FECHA, ''Saldo Inicial'' CONCEPTO, NULL TIPO_COMPROBANTE, NULL NRO_COMPROBANTE, ' +
                 'DECODE(SIGN(SALDO), -1, -SALDO, 0) DEBITO, DECODE(SIGN(SALDO), 1, SALDO, 0) CREDITO, NULL DETALLE, 0 ID, NULL ESLIQUIDACION ' +
            'FROM (SELECT COMISION.GET_SALDOCTACTE(' + SqlValue(edFecha.Date) + ', ''I'', ' + SqlValue(fraEntidad.Value) + ', ' + SqlValue(fraVendedor.Value) + ', ' + SqlValue(fraVendedor.EntidadVendedor) + ') SALDO FROM DUAL) ' +
           'UNION ALL ' +
          sdqConsulta.SQL.Text;

  DoGenerarReporteCuentaCorriente(sSql, fraEntidad.Descripcion, fraVendedor.Descripcion, fraVendedor.Value, edFecha.Date, edSaldoFinal.Value);
end;

procedure TfrmCuentaCorriente.mnuImprimirDetPagosClick(Sender: TObject);
var
  rep: TQuickRep;
begin
  Verificar(sdqConsulta.FieldByName('ESLIQUIDACION').AsString <> 'S', nil, 'El comprobante debe ser una liquidación.');

  with TfrmRPTComisionesConsulta.Create (Self) do
    try
      Liquidacion  := sdqConsulta.FieldByName('NRO_COMPROBANTE').AsString;
      NombreReport := 'qrPagosPorVendedor';
      OrdenReport  := toCodigo;
      SaltoPagina  := False;

      if Prepare then
        begin
          rep := TQuickRep(FindComponent(NombreReport));
          rep.PreviewModal;
        end
      else
        InvalidMsg(nil, 'No se encuentran registros.');
    finally
      Free;
    end;
end;

procedure TfrmCuentaCorriente.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmCuentaCorriente.CalcTotales;
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

procedure TfrmCuentaCorriente.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
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

