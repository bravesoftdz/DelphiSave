unit unManParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, RxToolEdit, DateComboBox, Vcl.Mask, RxCurrEdit;

type
  TfrmManParametros = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label8: TLabel;
    edMinGestionAltaModif: TCurrencyEdit;
    Label15: TLabel;
    edFechaAltaModif: TDateComboBox;
    Label1: TLabel;
    edGastosIntimacAltaModif: TCurrencyEdit;
    Label2: TLabel;
    edGastosBancAltaModif: TCurrencyEdit;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    Label3: TLabel;
    edMinDeudaNomAltaModif: TCurrencyEdit;
    Label4: TLabel;
    edMinDevengaIntAltaModif: TCurrencyEdit;
    Label5: TLabel;
    edMinRescindidasAltaModif: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
		procedure RefreshData; override;
  end;

var
  frmManParametros: TfrmManParametros;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, unSesion, SqlFuncs, CustomDlgs, General,
  DateTimeFuncs;

{$R *.dfm}

procedure TfrmManParametros.ClearControls;
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT NVL(PZ_MINIMOGESTION, 0), NVL(PZ_GASTOSINTIMACION, 0), NVL(PZ_GASTOSBANCARIOS, 0), ' +
                 'NVL(PZ_MINIMODEUDANOMINAL_PLANES, 0), NVL(PZ_MINIMODEVENGADO_INT, 0), ' +
                 'NVL(PZ_MINIMODEUDA_RESCINDIDAS, 0) ' +
            'FROM ZPZ_PARAMETROCOBRANZA ' +
           'WHERE PZ_FECHA = (SELECT MAX(PZ_FECHA) ' +
                               'FROM ZPZ_PARAMETROCOBRANZA ' +
                              'WHERE PZ_FECHA <= ACTUALDATE ' +
                                'AND PZ_FECHABAJA IS NULL) ' +
             'AND PZ_FECHABAJA IS NULL';

  SqlResults := ValoresColSql(sSql);
  try
    edMinGestionAltaModif.Value     := StrToFloat(SqlResults[0]);
    edGastosIntimacAltaModif.Value  := StrToFloat(SqlResults[1]);
    edGastosBancAltaModif.Value     := StrToFloat(SqlResults[2]);
    edMinDeudaNomAltaModif.Value    := StrToFloat(SqlResults[3]);
    edMinDevengaIntAltaModif.Value  := StrToFloat(SqlResults[4]);
    edMinRescindidasAltaModif.Value := StrToFloat(SqlResults[5]);
  finally
    SqlResults.Free;
  end;

  edFechaAltaModif.Clear;
end;

function TfrmManParametros.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('PZ_ID',                      sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('PZ_FECHABAJA',                   exDateTime);
          Fields.Add('PZ_USUBAJA',                     Sesion.UserID);

          SqlType := stUpdate;
        end
      else if ModoABM = maAlta then
        begin
          Fields.Add('PZ_FECHA',                       edFechaAltaModif.Date);
          Fields.Add('PZ_MINIMOGESTION',               edMinGestionAltaModif.Value);
          Fields.Add('PZ_GASTOSINTIMACION',            edGastosIntimacAltaModif.Value);
          Fields.Add('PZ_GASTOSBANCARIOS',             edGastosBancAltaModif.Value);
          Fields.Add('PZ_MINIMODEUDANOMINAL_PLANES',   edMinDeudaNomAltaModif.Value);
          Fields.Add('PZ_MINIMODEVENGADO_INT',         edMinDevengaIntAltaModif.Value);
          Fields.Add('PZ_MINIMODEUDA_RESCINDIDAS',     edMinRescindidasAltaModif.Value);
          Fields.Add('PZ_FECHAALTA',                   exDateTime);
          Fields.Add('PZ_USUALTA',                     Sesion.UserID);

          SqlType := stInsert;
        end;
    end;

   Result := inherited DoABM;
end;

procedure TfrmManParametros.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'ZPZ_PARAMETROCOBRANZA';
  FieldBaja     := 'FECHABAJA';
end;

procedure TfrmManParametros.LoadControls;
begin
  inherited;
end;

procedure TfrmManParametros.RefreshData;
var
  sWhere, sSql: String;
begin
  sWhere := '';

  sSql := 'SELECT PZ_FECHA FECHA, PZ_MINIMOGESTION MINIMOGESTION, PZ_GASTOSINTIMACION GASTOSINTIMACION, ' +
                 'PZ_GASTOSBANCARIOS GASTOSBANCARIOS, PZ_MINIMODEUDANOMINAL_PLANES MINIMODEUDANOMINAL_PLANES, ' +
                 'PZ_MINIMODEVENGADO_INT MINIMODEVENGADO_INT, PZ_MINIMODEUDA_RESCINDIDAS MINIMODEUDA_RESCINDIDAS, ' +
                 'PZ_FECHABAJA FECHABAJA, PZ_ID ID ' +
            'FROM ZPZ_PARAMETROCOBRANZA ' +
           'WHERE 1 = 1';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND PZ_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + NVL(SortDialog.OrderBy, ' ORDER BY PZ_FECHA');
  inherited;
end;

procedure TfrmManParametros.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('MINIMOGESTION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MINIMOGESTION')).Currency := True;

  if sdqConsulta.FieldByName('GASTOSINTIMACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('GASTOSINTIMACION')).Currency := True;

  if sdqConsulta.FieldByName('GASTOSBANCARIOS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('GASTOSBANCARIOS')).Currency := True;

  if sdqConsulta.FieldByName('MINIMODEUDANOMINAL_PLANES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MINIMODEUDANOMINAL_PLANES')).Currency := True;

  if sdqConsulta.FieldByName('MINIMODEVENGADO_INT') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MINIMODEVENGADO_INT')).Currency := True;

  if sdqConsulta.FieldByName('MINIMODEUDA_RESCINDIDAS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MINIMODEUDA_RESCINDIDAS')).Currency := True;
end;

procedure TfrmManParametros.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkNoMostrarBajas.Checked := True;
end;

function TfrmManParametros.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(edFechaAltaModif.IsEmpty, edFechaAltaModif, 'Debe indicar la vigencia.');

  sSql := 'SELECT 1 ' +
            'FROM ZPZ_PARAMETROCOBRANZA ' +
           'WHERE PZ_FECHA = :Fecha ' +
             'AND PZ_FECHABAJA IS NULL';
  Verificar(ExisteSqlEx(sSql, [TDateTimeEx.Create(edFechaAltaModif.Date)]), edFechaAltaModif, 'La vigencia ya existe.');

  Verificar(edMinGestionAltaModif.Value <= 0, edMinGestionAltaModif, 'El importe mínimo de gestión debe ser mayor o igual a 0.');
  Verificar(edGastosIntimacAltaModif.Value <= 0, edGastosIntimacAltaModif, 'Los gastos de intimación deben ser mayor o igual a 0.');
  Verificar(edGastosBancAltaModif.Value <= 0, edGastosBancAltaModif, 'Los gastos bancarios deben ser mayor o igual a 0.');
  Verificar(edMinDeudaNomAltaModif.Value <= 0, edMinDeudaNomAltaModif, 'El importe mínimo de deuda nominal de planes de pago debe ser mayor o igual a 0.');
  Verificar(edMinDevengaIntAltaModif.Value <= 0, edMinDevengaIntAltaModif, 'El importe mínimo de devengado de intereses debe ser mayor o igual a 0.');
  Verificar(edMinRescindidasAltaModif.Value <= 0, edMinRescindidasAltaModif, 'El importe mínimo de deuda de empresas rescindidas debe ser mayor o igual a 0.');

  Result := True;
end;

end.

