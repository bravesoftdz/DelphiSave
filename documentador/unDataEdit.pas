unit unDataEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Db, SDEngine,
  ShortCutControl;

type
  TfrmDataEdit = class(TForm)
    sdqConsulta: TSDQuery;
    sduConsulta: TSDUpdateSQL;
    dsConsulta: TDataSource;
    Tbar_BarraDeHerramientas: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbSalir: TToolButton;
    Grid: TRxDBGrid;
    tbCommit: TToolButton;
    ToolButton6: TToolButton;
    tbRollback: TToolButton;
    ShortCutControl: TShortCutControl;
    procedure tbCommitClick(Sender: TObject);
    procedure tbRollbackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent; ASchema, ATableName: string); reintroduce; 
  end;

var
  frmDataEdit: TfrmDataEdit;

implementation

uses AnsiSql, SqlFuncs;

{$R *.DFM}

{ TfrmDataEdit }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfrmDataEdit.Create(AOwner: TComponent; ASchema, ATableName: string); 
var
  Sql: TSql;
  i: integer;
begin
  inherited Create(AOwner);
  Caption := 'Editor de Datos [' + ASchema + '.' + ATableName + ']';

  sdqConsulta.Close;
  sdqConsulta.SQL.Text := 'SELECT * FROM "' + ASchema + '"."' + ATableName + '"';
  sdqConsulta.Open;

  Sql := TSql.Create('"' + ASchema + '"."' + ATableName + '"');
  try
    Sql.SelectOptions := [soPrimaryKeyAsField];
    for i := 0 to sdqConsulta.Fields.Count - 1 do
      Sql.Fields.Add('"' + sdqConsulta.Fields[i].FieldName + '"',
        ':' + sdqConsulta.Fields[i].FieldName, false);

    sdqConsulta.Close;

    sduConsulta.InsertSQL.Text := Sql.InsertSql; {El insert va sin ROWID}

    Sql.PrimaryKey.Add('ROWID', ':ROWID', false);
    sdqConsulta.SQL.Text := Sql.SelectSql;
    sduConsulta.ModifySQL.Text := Sql.UpdateSql;
    sduConsulta.DeleteSQL.Text := Sql.DeleteSql;

    sdqConsulta.Open;
    Grid.Columns[0].Visible := false;
    for i := 0 to Grid.Columns.Count - 1 do
      if (Grid.Columns.Items[i].Width > 200) then
        Grid.Columns.Items[i].Width := 200;
  finally
    Sql.Free;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDataEdit.tbCommitClick(Sender: TObject);
begin
  sdqConsulta.ApplyUpdates;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDataEdit.tbRollbackClick(Sender: TObject);
begin
  sdqConsulta.CancelUpdates;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDataEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDataEdit.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Refresh;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDataEdit.tbSalirClick(Sender: TObject);
begin
  Close;
end;

{----------------------------------------------------------------------------------------------------------------------}
end.
