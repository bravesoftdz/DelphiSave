unit unManInformeComercial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, StdCtrls,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManInformeComercial = class(TfrmCustomGridABM)
    edUser: TEdit;
    edPass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure LoadSQLString;
  private
  public
  end;

var
  frmManInformeComercial: TfrmManInformeComercial;

implementation

uses
  unPrincipal, SqlFuncs, CustomDlgs, unDMPrincipal;

{$R *.dfm}

function TfrmManInformeComercial.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('op_id',    sdqConsulta.FieldByName('op_id').AsInteger);
    Sql.Fields.Add('op_fechabaja', exDateTime);
    Sql.Fields.Add('op_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    Validar;
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.PrimaryKey.AddExpression('op_id', 'PEP.SEQ_POP_ID.NEXTVAL');
      Sql.Fields.Add('op_fechaalta',        exDateTime);
      Sql.Fields.Add('op_usualta',          frmPrincipal.DBLogin.UserID);
    end
    else
    begin { maModificacion }
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('op_id',     sdqConsulta.FieldByName('op_id').AsInteger);
      Sql.Fields.Add('op_fechamodif', exDateTime);
      Sql.Fields.Add('op_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('op_usuario', edUser.Text);
    Sql.Fields.Add('op_pass',    edPass.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManInformeComercial.LoadControls;
begin
   edUser.Text := sdqConsulta.FieldByName('op_usuario').AsString;
   edPass.Text := sdqConsulta.FieldByName('op_pass').AsString;
end;

procedure TfrmManInformeComercial.LoadSQLString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT op_id, op_usuario, op_pass, op_usualta, op_fechaalta, op_usumodif, op_fechamodif, op_usubaja,' +
          ' op_fechabaja, op_fechalogin, op_usulogin' +
     ' FROM pep.pop_opcionesinformes';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

function TfrmManInformeComercial.Validar: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM pep.pop_opcionesinformes' +
    ' WHERE op_usuario = :usuario' +
      ' AND op_fechabaja IS NULL';

  if ModoABM = maModificacion then
    sSql := sSql + ' AND op_id <> '+ sdqConsulta.FieldByName('op_id').AsString;

  Verificar(ExisteSqlEx(sSql, [edUser.Text]), edUser, 'No es posible ingresar datos ya ingresados.');
  Result := True;
end;

procedure TfrmManInformeComercial.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'pep.pop_opcionesinformes';
  FieldBaja     := 'op_fechabaja';
  LoadSQLString;
end;

procedure TfrmManInformeComercial.tbRefrescarClick(Sender: TObject);
begin
  LoadSQLString;
  inherited;
end;

procedure TfrmManInformeComercial.ClearControls;
begin
  edUser.Clear;
  edPass.Clear;
  inherited;
end;

end.
