unit unUsuariosExcepcionRevision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario;

type
  TfrmUsuariosExcepcionRevision = class(TfrmCustomGridABM)
    Label1: TLabel;
    fraUsuario: TfraUsuarios;
    Label2: TLabel;
    Label3: TLabel;
    chkExcepcion: TCheckBox;
    chkRevision: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmUsuariosExcepcionRevision: TfrmUsuariosExcepcionRevision;

implementation

uses
  SqlFuncs, AnsiSql, unSesion, General, CustomDlgs, unDmPrincipal;

{$R *.dfm}

function TfrmUsuariosExcepcionRevision.DoABM: Boolean;
var
  iId: Integer;
begin
  Sql.Clear;
  Sql.TableName := 'afi.apr_permisorevision';

  if ModoABM = maAlta then
  begin
    iId := -1;
    Sql.SqlType := stInsert;
    Sql.Fields.Add('pr_fechaalta', SQL_DATETIME, False);
    Sql.Fields.Add('pr_usualta',   Sesion.UserID);
  end
  else
  begin
    iId := sdqConsulta.FieldByName('pr_id').AsInteger;
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('pr_fechamodif', SQL_DATETIME, False);
    Sql.Fields.Add('pr_usumodif',   Sesion.UserID);
  end;

  Sql.PrimaryKey.Add('pr_id',    iId);
  Sql.Fields.Add('pr_usuario',   fraUsuario.sdqDatos.FieldByName('SE_ID').AsInteger, True);
  Sql.Fields.Add('pr_revision',  String(IIF(chkRevision.Checked, 'T', 'F')));
  Sql.Fields.Add('pr_excepcion', String(IIF(chkExcepcion.Checked, 'T', 'F')));

  Result := inherited DoABM;
end;

function TfrmUsuariosExcepcionRevision.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'El campo Usuario es obligatorio.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.apr_permisorevision' +
    ' WHERE pr_usuario = :usuario';
  if ModoABM = maModificacion then
    sSql := sSql + ' AND pr_id <> ' + SqlValue(sdqConsulta.FieldByName('pr_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [fraUsuario.sdqDatos.FieldByName('se_id').AsInteger]), fraUsuario.edCodigo, 'Ya existen datos para ese usuario.');

  Result := True;
end;


procedure TfrmUsuariosExcepcionRevision.ClearControls;
begin
  fraUsuario.Clear;
  chkExcepcion.Checked := False;
  chkRevision.Checked := False;
end;

procedure TfrmUsuariosExcepcionRevision.LoadControls;
begin
  with sdqConsulta do
  begin
    fraUsuario.Value     := FieldByName('se_usuario').AsString;
    chkExcepcion.Checked := (FieldByName('pr_excepcion').AsString = 'T');
    chkRevision.Checked  := (FieldByName('pr_revision').AsString = 'T');
  end;
end;

procedure TfrmUsuariosExcepcionRevision.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT apr.*, DECODE(pr_excepcion, ''T'', ''SI'', ''NO'') permisoexcepcion,' +
          ' DECODE(pr_revision, ''T'', ''SI'', ''NO'') permisorevision, se_nombre, se_usuario' +
     ' FROM afi.apr_permisorevision apr, use_usuarios' +
    ' WHERE pr_usuario = se_id';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;

procedure TfrmUsuariosExcepcionRevision.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := True;
end;

end.
