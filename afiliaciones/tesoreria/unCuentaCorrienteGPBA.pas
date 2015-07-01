unit unCuentaCorrienteGPBA;

interface
         
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox;

type
  TfrmCuentaCorrienteGPBA = class(TfrmCustomGridABM)
    gbFecha: TGroupBox;
    edFecha: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    Label1: TLabel;
    edDetalleCarga: TEdit;
    pnlArriba: TPanel;
    lbSaldoInicial: TLabel;
    pnlTotales: TPanel;
    lbSaldoFinal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    function GetDefaultFecha: TDateTime;
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure LoadControls; override;
  end;

var
  frmCuentaCorrienteGPBA: TfrmCuentaCorrienteGPBA;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, StrFuncs, General,
  DateTimeFuncs;

{$R *.dfm}

function TfrmCuentaCorrienteGPBA.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maModificacion then
    begin
       Sql.PrimaryKey.Add('GE_ID',           sdqConsulta.FieldByName('ID').AsInteger);
       Sql.Fields.Add('GE_DETALLE',          Trim(edDetalleCarga.Text));

       Sql.SqlType := stUpdate;
    end;

  Result := inherited DoABM;
end;

procedure TfrmCuentaCorrienteGPBA.LoadControls;
begin
  edDetalleCarga.Text := sdqConsulta.FieldByName('DETALLE').AsString;
end;

function TfrmCuentaCorrienteGPBA.Validar: Boolean;
begin
  Verificar(IsEmptyString(edDetalleCarga.Text), edDetalleCarga, 'El detalle es obligatorio.');

  Result := True;
end;

procedure TfrmCuentaCorrienteGPBA.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'OGE_GPBACUENTACORRIENTE';

  ShowActived := False;
  tbLimpiarClick(nil);
end;

procedure TfrmCuentaCorrienteGPBA.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
   Verificar(edFecha.IsEmpty, edFecha, 'La fecha es obligatoria.');

  sSql := 'SELECT CONT.GET_SALDOCTACTEGPBA(:Fecha, ''I'') FROM DUAL';
  lbSaldoInicial.Caption := 'Saldo Inicial: ' + ToStr(ValorSqlExtendedEx(sSql, [TDateTimeEx.Create(edFecha.Date)]), 2, False, False, '$');

  sSql := 'SELECT CONT.GET_SALDOCTACTEGPBA(NULL, ''F'') FROM DUAL';
  lbSaldoFinal.Caption   := 'Saldo Final: ' + ToStr(ValorSqlExtended(sSql), 2, False, False, '$');

  sWhere := '';

  sSql := 'SELECT GE_FECHA FECHA, GC_DESCRIPCION CONCEPTO, DECODE(GC_SIGNO, -1, GE_IMPORTE, 0) DEBITO, ' +
                 'DECODE(GC_SIGNO, 1, GE_IMPORTE, 0) CREDITO, GE_DETALLE DETALLE, GE_ID ID ' +
            'FROM OGC_GPBACONCEPTO, OGE_GPBACUENTACORRIENTE ' +
           'WHERE GC_ID = GE_IDCONCEPTO ' +
             'AND GE_FECHABAJA IS NULL';

  if not edFecha.IsEmpty then
    sWhere := sWhere + ' AND GE_FECHA >= ' + SqlValue(edFecha.Date);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

function TfrmCuentaCorrienteGPBA.GetDefaultFecha: TDateTime;
var
  sSql: String;
begin
  sSql := 'SELECT ADD_MONTHS(ACTUALDATE, -1) FROM DUAL';

  Result := ValorSqlDateTime(sSql);
end;

procedure TfrmCuentaCorrienteGPBA.tbLimpiarClick(Sender: TObject);
begin
  edFecha.Date := GetDefaultFecha();

  lbSaldoInicial.Caption := '';
  lbSaldoFinal.Caption   := '';

  inherited;
end;

procedure TfrmCuentaCorrienteGPBA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('DEBITO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEBITO')).Currency := True;

  if sdqConsulta.FieldByName('CREDITO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('CREDITO')).Currency := True;
end;

end.
 