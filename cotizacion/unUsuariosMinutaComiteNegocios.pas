unit unUsuariosMinutaComiteNegocios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unfraUsuarios, Mask, PatternEdit, IntEdit;

type
  TfrmUsuariosMinutaComiteNegocios = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraUsuario: TfraUsuarios;
    Label2: TLabel;
    edOrden: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmUsuariosMinutaComiteNegocios: TfrmUsuariosMinutaComiteNegocios;

implementation

uses
  unSesion, SqlFuncs, CustomDlgs, AnsiSql;

{$R *.dfm}

function TfrmUsuariosMinutaComiteNegocios.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'aur_usuariosreunioncomite';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ur_id',    sdqConsulta.FieldByName('ur_id').AsInteger, False);
    Sql.Fields.Add('ur_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ur_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('ur_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('ur_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.Fields.Add('ur_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('ur_usumodif',   Sesion.UserID);
    end;

    Sql.PrimaryKey.Add('ur_id',    fraUsuario.sdqDatos.FieldByName('se_id').AsInteger, False);
    Sql.Fields.Add('ur_orden',     edOrden.Value, True);
    Sql.Fields.Add('ur_fechabaja', exNull);
    Sql.Fields.Add('ur_usubaja',   exNull);
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosMinutaComiteNegocios.Validar: Boolean;
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'El campo Usuario es obligatorio.');

  Result := True;
end;


procedure TfrmUsuariosMinutaComiteNegocios.ClearControls;
begin
  fraUsuario.Clear;
  edOrden.Clear;
end;

procedure TfrmUsuariosMinutaComiteNegocios.LoadControls;
begin
  fraUsuario.Value := sdqConsulta.FieldByName('se_usuario').AsString;
  edOrden.Value    := sdqConsulta.FieldByName('ur_orden').AsInteger;
end;

procedure TfrmUsuariosMinutaComiteNegocios.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ur_fechabaja';

  fraUsuario.ExtraFields := ', se_id ';
end;

procedure TfrmUsuariosMinutaComiteNegocios.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;

  LockControl(fraUsuario, (ModoABM = maModificacion));
end;

end.
