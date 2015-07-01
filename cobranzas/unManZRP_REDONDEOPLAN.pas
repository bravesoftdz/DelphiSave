unit unManZRP_REDONDEOPLAN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit;

type
  TfrmManZRP_REDONDEOPLAN = class(TfrmCustomGridABM)
    rgRP_SECTOR: TRadioGroup;
    chkSoloActivos: TCheckBox;
    ToolButton1: TToolButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edRP_PORCREDONDEO: TCurrencyEdit;
    edRP_PORCREDONDEOCUOTA: TCurrencyEdit;
    edRP_PORCREDONDEOREEMPLVALORES: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManZRP_REDONDEOPLAN: TfrmManZRP_REDONDEOPLAN;

implementation

uses
  General, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion;

{$R *.DFM}

procedure TfrmManZRP_REDONDEOPLAN.ClearControls;
begin
  rgRP_SECTOR.ItemIndex := -1;
  edRP_PORCREDONDEO.Clear;
  edRP_PORCREDONDEOCUOTA.Clear;
  edRP_PORCREDONDEOREEMPLVALORES.Clear;
end;

function TfrmManZRP_REDONDEOPLAN.DoABM: Boolean;
var
  sSector: String;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('RP_ID',    sdqConsulta.FieldByName('RP_ID').AsInteger);
    Sql.Fields.Add('RP_FECHABAJA', exDate);
    Sql.Fields.Add('RP_USUBAJA',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else if ModoABM = maAlta then
  begin
    Sql.PrimaryKey.AddExpression('RP_ID', 'SEQ_ZRP_ID.NEXTVAL');
    Sql.Fields.Add('RP_FECHAALTA',        exDate);
    Sql.Fields.Add('RP_USUALTA',          Sesion.UserID);

    case rgRP_SECTOR.ItemIndex of
      0:  sSector := 'COB';
      1:  sSector := 'LEGAL';
    else
      sSector := '';
    end;

    Sql.Fields.Add('RP_SECTOR',                    sSector);
    Sql.Fields.Add('RP_PORCREDONDEO',              edRP_PORCREDONDEO.Value);
    Sql.Fields.Add('RP_PORCREDONDEOCUOTA',         edRP_PORCREDONDEOCUOTA.Value);
    Sql.Fields.Add('RP_PORCREDONDEOREEMPLVALORES', edRP_PORCREDONDEOREEMPLVALORES.Value);

    Sql.SqlType := stInsert;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManZRP_REDONDEOPLAN.LoadControls;
var
  iItem: Integer;
begin
  if sdqConsulta.FieldByName('RP_SECTOR').AsString = 'COB' then
    iItem := 0
  else if sdqConsulta.FieldByName('RP_SECTOR').AsString ='LEGAL' then
    iItem := 1
  else
    iItem := -1;

  rgRP_SECTOR.ItemIndex := iItem;

  edRP_PORCREDONDEO.Value              := sdqConsulta.FieldByName('RP_PORCREDONDEO').AsFloat;
  edRP_PORCREDONDEOCUOTA.Value         := sdqConsulta.FieldByName('RP_PORCREDONDEOCUOTA').AsFloat;
  edRP_PORCREDONDEOREEMPLVALORES.Value := sdqConsulta.FieldByName('RP_PORCREDONDEOREEMPLVALORES').AsFloat;
end;

function TfrmManZRP_REDONDEOPLAN.Validar: Boolean;
var
  sSector: String;
  sSql: String;
begin
  Verificar(rgRP_SECTOR.ItemIndex = -1, rgRP_SECTOR, 'Debe indicar el sector.');
  Verificar(edRP_PORCREDONDEO.Value < 0, edRP_PORCREDONDEO, 'El porcentaje de redondeo total del plan debe ser mayor o igual a 0.');
  Verificar(edRP_PORCREDONDEO.Value > 100, edRP_PORCREDONDEO, 'El porcentaje de redondeo total del plan debe ser menor o igual a 100.');
  Verificar(edRP_PORCREDONDEOCUOTA.Value < 0, edRP_PORCREDONDEOCUOTA, 'El porcentaje de redondeo de la cuota del plan debe ser mayor o igual a 0.');
  // Verificar( edRP_PORCREDONDEOCUOTA.Value > 100, edRP_PORCREDONDEOCUOTA, 'El porcentaje de redondeo de la cuota del plan debe ser menor o igual a 100' );
  Verificar(edRP_PORCREDONDEOREEMPLVALORES.Value < 0, edRP_PORCREDONDEOREEMPLVALORES, 'El porcentaje de redondeo del reemplazo de valores debe ser mayor o igual a 0.');
  Verificar(edRP_PORCREDONDEOREEMPLVALORES.Value > 100, edRP_PORCREDONDEOREEMPLVALORES, 'El porcentaje de redondeo del reemplazo de valores debe ser menor o igual a 100.');

  case rgRP_SECTOR.ItemIndex of
    0:  sSector := 'COB';
    1:  sSector := 'LEGAL';
  else
    sSector := '';
  end;

  sSql :=
    'SELECT 1' +
     ' FROM ZRP_REDONDEOPLAN' +
    ' WHERE RP_FECHABAJA IS NULL' +
      ' AND RP_SECTOR = :p1';
  Verificar(ExisteSqlEx(sSql, [sSector]), rgRP_SECTOR, 'Para el sector indicador ya existe un porcentaje activo.');

  Result := True;
end;

procedure TfrmManZRP_REDONDEOPLAN.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'ZRP_REDONDEOPLAN';
  FieldBaja     := 'RP_FECHABAJA';

  tbRefrescarClick(nil);
end;

procedure TfrmManZRP_REDONDEOPLAN.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('RP_PORCREDONDEO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RP_PORCREDONDEO')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('RP_PORCREDONDEOCUOTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RP_PORCREDONDEOCUOTA')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('RP_PORCREDONDEOREEMPLVALORES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RP_PORCREDONDEOREEMPLVALORES')).DisplayFormat := '% 0.00;-% 0.00';
end;

procedure TfrmManZRP_REDONDEOPLAN.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';

  sSql :=
    'SELECT *' +
     ' FROM ZRP_REDONDEOPLAN' +
    ' WHERE 1 = 1';

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND RP_FECHABAJA IS NULL ';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

end.
