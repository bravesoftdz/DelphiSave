unit unUsuariosSolicitudPermisoRevisionLegales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Mask, PatternEdit, IntEdit, unFraUsuario;

type
  TfrmUsuariosSolicitudPermisoRevisionLegales = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraUsuario: TfraUsuarios;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmUsuariosSolicitudPermisoRevisionLegales: TfrmUsuariosSolicitudPermisoRevisionLegales;

implementation

uses
  unSesion, SqlFuncs, CustomDlgs, AnsiSql, unDmPrincipal;

{$R *.dfm}

function TfrmUsuariosSolicitudPermisoRevisionLegales.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.aul_usuariosrevisionlegales';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('ul_id',    sdqConsulta.FieldByName('ul_id').AsInteger, False);
    Sql.Fields.Add('ul_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('ul_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('ul_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('ul_usualta',   Sesion.UserID);
      Sql.Fields.Add('ul_usuario',   fraUsuario.Codigo);
    end
    else
    begin
      Sql.PrimaryKey.Add('ul_id',     sdqConsulta.FieldByName('ul_id').AsInteger, False);
      Sql.Fields.Add('ul_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('ul_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('ul_fechabaja', exNull);
    Sql.Fields.Add('ul_usubaja',   exNull);
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosSolicitudPermisoRevisionLegales.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'El campo Usuario es obligatorio.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.aul_usuariosrevisionlegales' +
    ' WHERE ul_usuario = :usuario' +
      ' AND ul_fechabaja IS NULL';
  Verificar(ExisteSqlEx(sSql, [fraUsuario.Value]), fraUsuario.edCodigo, 'Ese usuario ya se encuentra habilitado.');

  Result := True;
end;


procedure TfrmUsuariosSolicitudPermisoRevisionLegales.ClearControls;
begin
  fraUsuario.Clear;
end;

procedure TfrmUsuariosSolicitudPermisoRevisionLegales.LoadControls;
begin
  fraUsuario.Value := sdqConsulta.FieldByName('ul_usuario').AsString;
end;


procedure TfrmUsuariosSolicitudPermisoRevisionLegales.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ul_fechabaja';

  fraUsuario.ExtraCondition := 'AND se_sector IN (''LEGAL'', ''COB'', ''TECNICO'') ';
//  fraUsuario.Sector := 'LEGAL';
end;

end.
