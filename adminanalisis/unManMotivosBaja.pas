{-----------------------------------------------------------------------------
 Unit Name: unManMotivosBaja
 Author:    racastro
 Date:      01-Ago-2007
 Purpose:   Mantenimiento de Motivos de Baja de trabajadores en
            lotes de estudios
 History:
-----------------------------------------------------------------------------}

unit unManMotivosBaja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, DBTables, Mask, PatternEdit, DBIncrementalSearch;

type
  TfrmManMotivosBaja = class(TfrmCustomGridABM)
    Label1: TLabel;
    edCodigo: TPatternEdit;
    edDescripcion: TEdit;
    Label2: TLabel;
    dbiBusqueda: TDBIncrementalSearch;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

var
  frmManMotivosBaja: TfrmManMotivosBaja;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, AnsiSql, SqlFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosBaja.ClearControls;
begin
  edCodigo.Clear;
  edDescripcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivosBaja.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('mb_id', sdqConsulta.FieldByName('mb_id').AsString);
    Sql.Fields.Add('mb_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('mb_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('mb_id', GetSecNextVal('hys.seq_hmb_id'));
      Sql.Fields.Add('mb_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('mb_fechaalta', exDateTime);
    end
    else
    begin
      Sql.PrimaryKey.Add('mb_id', sdqConsulta.FieldByName('mb_id').AsString);
      Sql.Fields.Add('mb_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('mb_fecha_modif', exDateTime);
      Sql.Fields.Add('mb_usubaja', exNull);
      Sql.Fields.Add('mb_fechabaja', exNull);
    end;

    Sql.Fields.Add('mb_descripcion', edDescripcion.Text);
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosBaja.LoadControls;
begin
  edCodigo.Text      := sdqConsulta.FieldByName('mb_id').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('mb_descripcion').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManMotivosBaja.Validar: Boolean;
begin
  Result := False;
  if IsEmptyString(edDescripcion.Text) Then
    InvalidMsg(edDescripcion, 'Debe ingresar la Descripción del Motivo')
  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosBaja.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'hys.hmb_motivobaja';
  FieldBaja := 'mb_fechabaja';
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManMotivosBaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inherited
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
