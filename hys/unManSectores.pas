unit unManSectores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch;

type
  TfrmManSectores = class(TfrmCustomGridABM)
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
  frmManSectores: TfrmManSectores;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{-----------------------------------------------------------------------------}
procedure TfrmManSectores.ClearControls;
begin
  edDESCRIPCION.Clear;
end;
{-----------------------------------------------------------------------------}
function TfrmManSectores.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('CE_ID', sdqConsulta.FieldByName('CE_ID').AsString);
    Sql.Fields.Add('CE_USUBAJA', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('CE_FECHABAJA', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('CE_ID', GetSecNextVal('hys.seq_pce_id'));
      Sql.Fields.Add('CE_USUALTA', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CE_FECHAALTA', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('CE_ID', sdqConsulta.FieldByName('CE_ID').AsString);
      Sql.Fields.Add('CE_USUMODIF', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('CE_FECHAMODIF', exDateTime);
      Sql.Fields.Add('CE_USUBAJA', exNull);
      Sql.Fields.Add('CE_FECHABAJA', exNull);
    end;

    Sql.Fields.Add('CE_DESCRIPCION', edDESCRIPCION.Text);
  end;
  Result := inherited DoABM;
end;
{-----------------------------------------------------------------------------}
procedure TfrmManSectores.LoadControls;
begin
  edDESCRIPCION.Text := sdqConsulta.FieldByName('CE_DESCRIPCION').AsString;
end;
{-----------------------------------------------------------------------------}
function TfrmManSectores.Validar: Boolean;
begin
  Result := False;

  if IsEmptyString(edDESCRIPCION.Text) Then
    InvalidMsg(edDESCRIPCION, 'Debe ingresar la Descripción del Sector')
  else
    Result := True;
end;
{-----------------------------------------------------------------------------}
procedure TfrmManSectores.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.pce_cansector';
  FieldBaja := 'CE_FECHABAJA';
end;

end.
