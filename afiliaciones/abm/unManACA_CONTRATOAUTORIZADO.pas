unit unManACA_CONTRATOAUTORIZADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, PatternEdit, IntEdit;

type
  TfrmManACA_CONTRATOAUTORIZADO = class(TfrmCustomGridABM)
    edRazonSocial: TEdit;
    Label1: TLabel;
    Label9: TLabel;
    edEM_CUIT: TMaskEdit;
    edCO_CONTRATO: TIntEdit;
    Label2: TLabel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edEM_CUITChange(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure edCO_CONTRATOChange(Sender: TObject);
  private
  public
  protected
    procedure LoadSQLString;

    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmManACA_CONTRATOAUTORIZADO: TfrmManACA_CONTRATOAUTORIZADO;

implementation

uses
  unPrincipal, SqlFuncs, CustomDlgs, unDMPrincipal;

{$R *.dfm}

procedure TfrmManACA_CONTRATOAUTORIZADO.LoadSQLString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT ca_id, ca_cuit, ca_usualta, ca_fechaalta, ca_usumodif, ca_fechamodif, ca_usubaja, ca_fechabaja, em_nombre' +
     ' FROM aca_cuitautorizado' +
' LEFT JOIN aem_empresa on em_cuit = ca_cuit';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.tbRefrescarClick(Sender: TObject);
begin
  LoadSQLString;
  inherited;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'aca_cuitautorizado';
  FieldBaja     := 'ca_fechabaja';
  
  LoadSQLString;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.LoadControls;
begin
  with sdqConsulta do
  begin
    edEM_CUIT.Text     := FieldByName('ca_cuit').AsString;
    edRazonSocial.Text := FieldByName('em_nombre').AsString;
  end;
end;

function TfrmManACA_CONTRATOAUTORIZADO.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('ca_id',    sdqConsulta.FieldByName('ca_id').AsInteger);
    Sql.Fields.Add('ca_fechabaja', exDateTime);
    Sql.Fields.Add('ca_usubaja',   frmPrincipal.DBLogin.UserID);
  end
  else
  begin
    Validar;

    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.Fields.Add('ca_fechaalta', exDateTime);
      Sql.Fields.Add('ca_usualta',   frmPrincipal.DBLogin.UserID);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('ca_id',     sdqConsulta.FieldByName('ca_id').AsInteger);
      Sql.Fields.Add('ca_fechamodif', exDateTime);
      Sql.Fields.Add('ca_usumodif',   frmPrincipal.DBLogin.UserID);
    end;

    Sql.Fields.Add('ca_cuit', edEM_CUIT.Text, True);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.ClearControls;
begin
//
end;

function TfrmManACA_CONTRATOAUTORIZADO.Validar: Boolean;
var
  sSql: String;
begin
  Verificar((edEM_CUIT.Text = ''), edEM_CUIT, 'Debe indicar la C.U.I.T.');

  sSql :=
    'SELECT 1' +
     ' FROM aca_cuitautorizado' +
    ' WHERE ca_cuit = :cuit';

  if ModoABM = maAlta then
    Verificar(ExisteSqlEx(sSql, [edEM_CUIT.Text]), btnCancelar, 'No es posible ingresar datos ya ingresados.');

  if ModoABM = maModificacion then
  begin
    sSql := sSql + ' AND ca_id <> :id';
    Verificar(ExisteSqlEx(sSql, [edEM_CUIT.Text, sdqConsulta.FieldByName('ca_id').AsInteger]), btnCancelar, 'No es posible modificar datos ya ingresados.')
  end;

  sSql :=
  	'SELECT 1' +
     ' FROM aem_empresa' +
    ' WHERE em_cuit = :cuit';
  Verificar(not ExisteSqlEx(sSql, [edEM_CUIT.Text]), btnCancelar, 'No se encuenta la C.U.I.T.');

  Result := True;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.edEM_CUITChange(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT em_nombre, em_cuit, co_contrato' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE em_id = co_idempresa' +
      ' AND em_cuit = :cuit';
  with GetQueryEx(sSql, [edEM_CUIT.Text]) do
  try
    if not Eof then
    begin
      edRazonSocial.Text := FieldByName('em_nombre').AsString;
      if not edCO_CONTRATO.Focused then
        edCO_CONTRATO.Value := FieldByName('co_contrato').AsInteger;
    end
    else
    begin
      edRazonSocial.Clear;
      if not edCO_CONTRATO.Focused then
        edCO_CONTRATO.Clear;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.tbNuevoClick(Sender: TObject);
begin
  edEM_CUIT.Clear;
  edRazonSocial.Clear;

  inherited;
end;

procedure TfrmManACA_CONTRATOAUTORIZADO.edCO_CONTRATOChange(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT em_nombre, em_cuit' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE em_id = co_idempresa' +
      ' AND co_contrato = :contrato';
  with GetQueryEx(sSql, [edCO_CONTRATO.Text]) do
  try
    if not Eof then
    begin
      edRazonSocial.Text := FieldByName('em_nombre').AsString;
      if not edEM_CUIT.Focused then
        edEM_CUIT.Text := FieldByName('em_cuit').AsString;
    end
    else
    begin
      edRazonSocial.Clear;
      if not edEM_CUIT.Focused then
        edEM_CUIT.Clear;
    end;
  finally
    Free;
  end;
end;

end.
