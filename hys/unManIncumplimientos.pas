unit unManIncumplimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch;

type
  TfrmManIncumplimientos = class(TfrmCustomGridABM)
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
  frmManIncumplimientos: TfrmManIncumplimientos;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{-----------------------------------------------------------------------------}
procedure TfrmManIncumplimientos.ClearControls;
begin
  edDESCRIPCION.Clear;
end;
{-----------------------------------------------------------------------------}
function TfrmManIncumplimientos.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('CN_ID', sdqConsulta.FieldByName('CN_ID').AsString);
    Sql.Fields.Add('CN_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('CN_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('CN_ID', GetSecNextVal('hys.seq_pcn_id'));
      Sql.Fields.Add('CN_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CN_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('CN_ID', sdqConsulta.FieldByName('CN_ID').AsString);
      Sql.Fields.Add('CN_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CN_FECHAMODIF', exDateTime);
      Sql.Fields.Add('CN_USUBAJA', exNull);
      Sql.Fields.Add('CN_FECHABAJA', exNull);
    end;

    Sql.Fields.Add('CN_DESCRIPCION', edDESCRIPCION.Text);
  end;
  Result := inherited DoABM;
end;
{-----------------------------------------------------------------------------}
procedure TfrmManIncumplimientos.LoadControls;
begin
  edDESCRIPCION.Text := sdqConsulta.FieldByName('CN_DESCRIPCION').AsString;
end;
{-----------------------------------------------------------------------------}
function TfrmManIncumplimientos.Validar: Boolean;
begin
  Result := False;

  if IsEmptyString(edDESCRIPCION.Text) Then
    InvalidMsg(edDESCRIPCION, 'Debe ingresar la Descripción del Sector')
  else
    Result := True;
end;
{-----------------------------------------------------------------------------}
procedure TfrmManIncumplimientos.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.pcn_canincumplimientos';
  FieldBaja := 'CN_FECHABAJA';
end;

end.
