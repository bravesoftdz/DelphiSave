unit unManUsosProductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch;

type
  TfrmManUsosProductos = class(TfrmCustomGridABM)
    edDESCRIPCION: TEdit;
    Label2: TLabel;
    dbiBusqueda: TDBIncrementalSearch;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManUsosProductos: TfrmManUsosProductos;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{-----------------------------------------------------------------------------}
procedure TfrmManUsosProductos.ClearControls;
begin
  edDESCRIPCION.Clear;
end;
{-----------------------------------------------------------------------------}
function TfrmManUsosProductos.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('CU_ID', sdqConsulta.FieldByName('CU_ID').AsString);
    Sql.Fields.Add('CU_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('CU_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('CU_ID', GetSecNextVal('hys.seq_pcu_id'));
      Sql.Fields.Add('CU_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CU_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('CU_ID', sdqConsulta.FieldByName('CU_ID').AsString);
      Sql.Fields.Add('CU_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CU_FECHAMODIF', exDateTime);
      Sql.Fields.Add('CU_USUBAJA', exNull);
      Sql.Fields.Add('CU_FECHABAJA', exNull);
    end;

    Sql.Fields.Add('CU_DESCRIPCION', edDESCRIPCION.Text);
  end;
  Result := inherited DoABM;
end;
{-----------------------------------------------------------------------------}
procedure TfrmManUsosProductos.LoadControls;
begin
  edDESCRIPCION.Text := sdqConsulta.FieldByName('CU_DESCRIPCION').AsString;
end;
{-----------------------------------------------------------------------------}
function TfrmManUsosProductos.Validar: Boolean;
begin
  Result := False;

  if IsEmptyString(edDESCRIPCION.Text) Then
    InvalidMsg(edDESCRIPCION, 'Debe ingresar la Descripción del Uso')
  else
    Result := True;
end;
{-----------------------------------------------------------------------------}
procedure TfrmManUsosProductos.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.pcu_canusoproducto';
  FieldBaja := 'CU_FECHABAJA';
end;

end.
