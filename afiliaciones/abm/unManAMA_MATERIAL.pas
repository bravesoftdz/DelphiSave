unit unManAMA_MATERIAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit, CustomDlgs;

type
  TfrmManAMA_MATERIAL = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    edCodigo: TIntEdit;
    Label1: TLabel;
    Label2: TLabel;
    chkEntregable: TCheckBox;
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
  frmManAMA_MATERIAL: TfrmManAMA_MATERIAL;

implementation

uses unPrincipal, unDmPrincipal, SQLFuncs, General;

{$R *.dfm}

{ TfrmManAMA_MATERIAL }

procedure TfrmManAMA_MATERIAL.ClearControls;
begin
  inherited;
  edCodigo.Clear;
  edDescripcion.Clear;
  chkEntregable.Checked := False;
end;

function TfrmManAMA_MATERIAL.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.ama_material';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ma_id',    sdqConsulta.FieldByName('ma_id').AsInteger);
    Sql.Fields.Add('ma_fechabaja', exDateTime);
    Sql.Fields.Add('ma_usubaja',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('ma_fechaalta',        exDateTime);
      Sql.Fields.Add('ma_usualta',          frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stInsert;
    end
    else
    begin { maModificacion }
      Sql.PrimaryKey.Add('ma_id',     sdqConsulta.FieldByName('ma_id').AsInteger);
      Sql.Fields.Add('ma_fechamodif', exDateTime);
      Sql.Fields.Add('ma_usumodif',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end;
    Sql.Fields.Add('ma_codigo', edCodigo.Value);
    Sql.Fields.Add('ma_descripcion',   edDescripcion.Text);
    Sql.Fields.Add('ma_entregable', String(IIF(chkEntregable.Checked, 'S', 'N')));
  end;

  Result := inherited DoABM;
end;

procedure TfrmManAMA_MATERIAL.LoadControls;
begin
  inherited;
  with sdqConsulta do
  begin
    edCodigo.Text         := FieldByName('ma_codigo').AsString;
    edDescripcion.Text    := FieldByName('ma_descripcion').AsString;
    chkEntregable.Checked := FieldByName('ma_entregable').AsString = 'S';
  end
end;

procedure TfrmManAMA_MATERIAL.LoadSqlString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT ma_id, ma_codigo, ma_descripcion, ma_fechaalta, ma_usualta, ma_fechamodif, ma_usumodif, ma_fechabaja, ma_usubaja,' +
    '       ma_entregable' +
     ' FROM afi.ama_material';
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

procedure TfrmManAMA_MATERIAL.RefreshData;
begin
  LoadSqlString;
  inherited;
end;

function TfrmManAMA_MATERIAL.Validar: Boolean;
var
  sSql : String;
begin
  Verificar(Trim(edCodigo.Text) = '', edCodigo, 'El Código del material es obligatorio');
  Verificar(Trim(edDescripcion.Text) = '', edDescripcion, 'La Descripción del material es obligatoria');
  sSql := 'SELECT 1' +
          '  FROM afi.ama_material' +
          ' WHERE ma_codigo =:codigo' +
          '  AND ma_fechabaja IS NULL';
  if ModoABM = maAlta then
    Verificar(ExisteSqlEx(sSql, [edCodigo.Value]), edCodigo, 'Este código de material ya está definido')
  else
    Verificar(ExisteSqlEx(sSql + ' AND ma_id <> :id', [edCodigo.Value, sdqConsulta.FieldByName('ma_id').AsInteger]),
                          edCodigo, 'Este código de material ya está definido');
  Result := True;
end;

procedure TfrmManAMA_MATERIAL.FormCreate(Sender: TObject);
begin
  LoadSqlString;
  inherited;
  Sql.TableName := 'afi.ama_material';
  FieldBaja := 'ma_fechabaja';
end;

procedure TfrmManAMA_MATERIAL.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('ma_fechabaja').IsNull, tbModificar, 'Este material esta dado de baja');
  inherited;
end;

procedure TfrmManAMA_MATERIAL.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('ma_fechabaja').IsNull, tbModificar, 'Este material esta dado de baja');
  inherited;
end;

end.
