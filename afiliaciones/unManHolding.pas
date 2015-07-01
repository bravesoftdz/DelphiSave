unit unManHolding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManHolding = class(TfrmCustomGridABM)
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    edHolding: TEdit;
    chkTemporal: TCheckBox;
    chkVerTemporales: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure chkVerTemporalesClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmManHolding: TfrmManHolding;

implementation

uses
  unPrincipal, SqlFuncs, CustomDlgs, unDMPrincipal;

{$R *.DFM}

procedure TfrmManHolding.ClearControls;
begin
  edCodigo.Clear;
  edHolding.Clear;
end;

function TfrmManHolding.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ge_id',    sdqConsulta.FieldByName('ge_id').AsInteger);
    Sql.Fields.Add('ge_fechabaja', exDateTime);
    Sql.Fields.Add('ge_usubaja',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddExpression('ge_id', 'AFI.SEQ_AGE_ID.NEXTVAL');
      Sql.Fields.Add('ge_fechaalta',        exDateTime);
      Sql.Fields.Add('ge_usualta',          frmPrincipal.DBLogin.UserID);
      ShowMessage('El Holding pasará a estado temporal mientras no tenga empresas asociadas.');
      Sql.SqlType := stInsert;
    end
    else
    begin { maModificacion }
      Sql.PrimaryKey.Add('ge_id',     sdqConsulta.FieldByName('ge_id').AsInteger);
      Sql.Fields.Add('ge_fechamodif', exDateTime);
      Sql.Fields.Add('ge_usumodif',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end;

    if chkTemporal.Checked then
      Sql.Fields.Add('ge_temporal',         'T')
    else
      sql.Fields.AddString('ge_temporal', '', True);

    Sql.Fields.Add('ge_codigo',      edCodigo.Text);
    Sql.Fields.Add('ge_descripcion', edHolding.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManHolding.LoadControls;
begin
  edCodigo.Text       := sdqConsulta.FieldByName('ge_codigo').AsString;
  edHolding.Text      := sdqConsulta.FieldByName('ge_descripcion').AsString;
  chkTemporal.Checked := (sdqConsulta.FieldByName('ge_temporal').AsString = 'T');
end;

function TfrmManHolding.Validar: Boolean;
var
  sSql: String;
begin
  Verificar((Trim(edCodigo.Text) = ''), edCodigo, 'El código es obligatorio.');
  Verificar((Trim(edHolding.Text) = ''), edHolding, 'El holding es obligatorio.');

  if ModoABM = maModificacion then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM age_grupoeconomico' +
      ' WHERE ge_codigo = :codigo' +
        ' AND ge_id <> :id';
    Verificar(ExisteSQLEx(sSql, [edCodigo.Text,sdqConsulta.FieldByName('ge_id').AsInteger]), btnCancelar, 'El Código no puede ser igual al de otro registro.');

    sSql :=
      'SELECT 1' +
       ' FROM age_grupoeconomico' +
      ' WHERE ge_codigo = :codigo' +
        ' AND ge_descripcion = :descripcion' +
        ' AND ge_id <> :id';
    Verificar(ExisteSQLEx(sSql, [edCodigo.Text, edHolding.Text, sdqConsulta.FieldByName('ge_id').AsInteger]), btnCancelar, 'No es posible ingresar datos ya ingresados.');
  end
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM age_grupoeconomico' +
      ' WHERE ge_codigo = :codigo' +
        ' AND ge_descripcion = :descripcion';
    Verificar(ExisteSQLEx(sSql, [edCodigo.Text, edHolding.Text]), btnCancelar, 'No es posible ingresar datos ya ingresados.');

    sSql :=
      'SELECT 1' +
       ' FROM age_grupoeconomico' +
      ' WHERE ge_codigo = :codigo';
    Verificar(ExisteSQLEx(sSql, [edCodigo.Text]), btnCancelar, 'El Código no puede ser igual al de otro registro.');
  end;

  Result := True;
end;

procedure TfrmManHolding.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuHolding.Enabled := True;
end;

procedure TfrmManHolding.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'age_grupoeconomico';
  FieldBaja     := 'ge_fechabaja';

  sdqConsulta.SQL.Text :=
    'SELECT ge_id, ge_codigo, ge_descripcion, ge_usualta, ge_fechaalta, ge_usumodif, ge_fechamodif, ge_usubaja,' +
          ' ge_fechabaja, ge_incluiranalisisemision, ge_campaniaart, ge_temporal,' +
          ' DECODE(ge_temporal, ''T'', ''Sí'', ''No'') temp' +
     ' FROM age_grupoeconomico';
  {$IFDEF AFILIACIONES}
  if not chkVerTemporales.Checked then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' WHERE ge_temporal IS NULL';
  {$ENDIF}
  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text +  ' ORDER BY ge_descripcion';
end;

procedure TfrmManHolding.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('ge_fechabaja').IsNull, tbEliminar, 'Este registro ya está dado de baja.');
  inherited;
end;

procedure TfrmManHolding.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('ge_fechabaja').IsNull, tbModificar, 'Este registro está dado de baja.');
  inherited;
end;

procedure TfrmManHolding.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
    'SELECT ge_id, ge_codigo, ge_descripcion, ge_usualta, ge_fechaalta, ge_usumodif, ge_fechamodif, ge_usubaja,' +
          ' ge_fechabaja, ge_incluiranalisisemision, ge_campaniaart, ge_temporal,' +
          ' DECODE(ge_temporal, ''T'', ''Sí'', ''No'') temp' +
     ' FROM age_grupoeconomico';
  {$IFDEF AFILIACIONES}
  if not chkVerTemporales.Checked then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' WHERE ge_temporal IS NULL';
  {$ENDIF}
  sdqConsulta.SQL.Text :=  sdqConsulta.SQL.Text +  ' ORDER BY ge_descripcion';
  inherited;
end;

procedure TfrmManHolding.chkVerTemporalesClick(Sender: TObject);
begin
  tbRefrescarClick(nil);
end;

end.
