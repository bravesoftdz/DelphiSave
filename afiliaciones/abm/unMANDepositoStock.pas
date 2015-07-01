unit unMANDepositoStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, CustomDlgs, Mask, PatternEdit,
  IntEdit;

type
  TfrmManDepositoStock = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSqlString;
  public
    { Public declarations }
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmManDepositoStock: TfrmManDepositoStock;

implementation

uses unPrincipal, unDmPrincipal, SQLFuncs;

{$R *.dfm}

procedure TfrmManDepositoStock.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
end;

function TfrmManDepositoStock.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.ade_deposito';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('de_id',    sdqConsulta.FieldByName('de_id').AsInteger);
    Sql.Fields.Add('de_fechabaja', exDateTime);
    Sql.Fields.Add('de_usubaja',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('de_fechaalta',        exDateTime);
      Sql.Fields.Add('de_usualta',          frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stInsert;
    end
    else
    begin { maModificacion }
      Sql.PrimaryKey.Add('de_id',     sdqConsulta.FieldByName('de_id').AsInteger);
      Sql.Fields.Add('de_fechamodif', exDateTime);
      Sql.Fields.Add('de_usumodif',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end;
    Sql.Fields.Add('de_codigo', edCodigo.Value);
    Sql.Fields.Add('de_descripcion',   edDescripcion.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManDepositoStock.FormCreate(Sender: TObject);
begin
  LoadSqlString;
  inherited;
  Sql.TableName := 'afi.ade_deposito';
  FieldBaja := 'de_fechabaja';
end;

procedure TfrmManDepositoStock.LoadControls;
begin
  edCodigo.Text := sdqConsulta.FieldByName('de_codigo').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('de_descripcion').AsString;
end;

procedure TfrmManDepositoStock.LoadSqlString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT de_id, de_codigo, de_descripcion, de_fechaalta, de_usualta, de_fechamodif, de_usumodif, de_fechabaja, de_usubaja' +
     ' FROM afi.ade_deposito';
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

procedure TfrmManDepositoStock.RefreshData;
begin
  LoadSqlString;
  inherited;
end;

function TfrmManDepositoStock.Validar: Boolean;
var
  sSql : String;
begin
  Verificar(Trim(edCodigo.Text) = '', edCodigo, 'El Código del depósito es obligatorio');
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'La Descripción del depósito es obligatoria');
  sSql := 'SELECT 1' +
          '  FROM afi.ade_deposito' +
          ' WHERE de_codigo =:codigo'+
          '  AND de_fechabaja IS NULL';
  if ModoABM = maAlta then
    Verificar(ExisteSqlEx(sSql, [edCodigo.Value]), edCodigo, 'Este código ya está definido')
  else
    Verificar(ExisteSqlEx(sSql + ' AND de_id <> :id', [edCodigo.Value, sdqConsulta.FieldByName('de_id').AsInteger]),
                          edCodigo, 'Este código ya está definido');
  Result := True;
end;

procedure TfrmManDepositoStock.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('de_fechabaja').IsNull, tbModificar, 'Este depósito esta dado de baja');
  inherited;
end;

procedure TfrmManDepositoStock.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('de_fechabaja').IsNull, tbModificar, 'Este depósito esta dado de baja');
  inherited;
end;

end.
