{-----------------------------------------------------------------------------
 Unit Name: unManMotivosRechazo
 Author:    racastro
 Date:      01-Ago-2007
 Purpose:   Mantenimiento de Motivos de Rechazo de lotes de estudios
 History:
-----------------------------------------------------------------------------}

unit unManMotivosRechazo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch,
  General;

type
  TfrmManMotivosRechazo = class(TfrmCustomGridABM)
    edDescripcion: TEdit;
    Label2: TLabel;
    dbiBusqueda: TDBIncrementalSearch;
    cbCartaDoc: TCheckBox;
    cbRegeneraLote: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    FTipo: String
  end;

var
  frmManMotivosRechazo: TfrmManMotivosRechazo;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosRechazo.ClearControls;
begin
  edDescripcion.Clear;
  cbCartaDoc.Checked := false;
  cbRegeneraLote.Checked := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivosRechazo.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('mr_id', sdqConsulta.FieldByName('mr_id').AsString);
    Sql.Fields.Add('mr_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('mr_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('mr_id', GetSecNextVal('hys.seq_hmr_id'));
      Sql.Fields.Add('mr_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('mr_fechaalta', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('mr_id', sdqConsulta.FieldByName('mr_id').AsString);
      Sql.Fields.Add('mr_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('mr_fechamodif', exDateTime);
      Sql.Fields.Add('mr_usubaja', exNull);
      Sql.Fields.Add('mr_fechabaja', exNull);
    end;

    Sql.Fields.Add('mr_descripcion', edDescripcion.Text);
    Sql.Fields.Add('mr_tiporechazo', FTipo);
    Sql.Fields.Add('mr_cartadocumento', String(iif (cbCartaDoc.Checked, 'S', 'N')));
    Sql.Fields.Add('mr_regeneralote', String(iif (cbRegeneraLote.Checked, 'S', 'N')));
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosRechazo.LoadControls;
begin
  edDescripcion.Text    := sdqConsulta.FieldByName('mr_descripcion').AsString;
  cbCartaDoc.Checked    := sdqConsulta.FieldByName('mr_cartadocumento').AsString = 'S';
  cbRegeneraLote.Checked:= sdqConsulta.FieldByName('mr_regeneralote').AsString = 'S';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivosRechazo.Validar: Boolean;
begin
  Result := False;
  if IsEmptyString(edDescripcion.Text) Then
    InvalidMsg(edDescripcion, 'Debe ingresar la Descripción del Motivo')
  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosRechazo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hmr_motivorechazo';
  FieldBaja := 'mr_fechabaja';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosRechazo.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.ParamByName ('tipo').Value := FTipo;
  inherited;
end;

end.
