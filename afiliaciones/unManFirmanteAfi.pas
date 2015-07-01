unit unManFirmanteAfi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraCodigoDescripcion;

type
  TfrmManFirmanteAfi = class(TfrmCustomGridABM)
    edFirmante: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;

    procedure LoadSQLString;
  public
  end;

var
  frmManFirmanteAfi: TfrmManFirmanteAfi;

implementation

uses
  unPrincipal, SqlFuncs, CustomDlgs, unDMPrincipal;

{$R *.DFM}

procedure TfrmManFirmanteAfi.ClearControls;
begin
//
end;

function TfrmManFirmanteAfi.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('cf_id',    sdqConsulta.FieldByName('cf_id').AsInteger);
    Sql.Fields.Add('cf_fechabaja', exDateTime);
    Sql.Fields.Add('cf_usubaja',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    Validar;
    if ModoABM = maAlta then
    begin
     // Sql.PrimaryKey.AddExpression('cf_id', 'ART.SEQ_ADF_DOCUMENTACIONFALTA.NEXTVAL');
      Sql.Fields.Add('cf_fechaalta', exDateTime);
      Sql.Fields.Add('cf_usualta',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stInsert;
    end
    else
    begin { maModificacion }
      Sql.PrimaryKey.Add('cf_id',     sdqConsulta.FieldByName('cf_id').AsInteger);
      Sql.Fields.Add('cf_fechamodif', exDateTime);
      Sql.Fields.Add('cf_usumodif',   frmPrincipal.DBLogin.UserID);
      Sql.SqlType := stUpdate;
    end;

    Sql.Fields.Add('cf_caracter', edFirmante.Text);
  end;

  Result := inherited DoABM;
end;

procedure TfrmManFirmanteAfi.LoadControls;
begin
 edFirmante.Text := sdqConsulta.FieldByName('cf_caracter').AsString
end;

function TfrmManFirmanteAfi.Validar: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM acf_caracterfirma' +
    ' WHERE cf_caracter = :caracter' +
      ' AND cf_fechabaja IS NULL';
  Verificar(ExisteSqlEx(sSql, [edFirmante.Text]), edFirmante, 'No es posible ingresar datos ya ingresados.');
  
  Result := True;
end;

procedure TfrmManFirmanteAfi.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'acf_caracterfirma';
  FieldBaja     := 'cf_fechabaja';
  
  LoadSQLString;
end;

procedure TfrmManFirmanteAfi.LoadSQLString;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT cf_id, cf_caracter, cf_usualta, cf_fechaalta, cf_usumodif, cf_fechamodif, cf_usubaja, cf_fechabaja' +
     ' FROM acf_caracterfirma';
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
end;

procedure TfrmManFirmanteAfi.tbRefrescarClick(Sender: TObject);
begin
  LoadSQLString;
  inherited;
end;
procedure TfrmManFirmanteAfi.tbNuevoClick(Sender: TObject);
begin
  edFirmante.Clear;
  inherited;
end;

procedure TfrmManFirmanteAfi.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cf_fechabaja').IsNull, tbEliminar, 'Este registro ya está dado de baja.');
  inherited;
end;

procedure TfrmManFirmanteAfi.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cf_fechabaja').IsNull, tbModificar, 'Este registro está dado de baja.');
  inherited;
end;

end.
