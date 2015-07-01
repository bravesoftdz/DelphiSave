unit unUsuariosVisualizacionPrestacionesEspeciales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask,
  PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraUsuario, unFraCodDesc, unFraEntidades, unFraStaticCodigoDescripcion, unFraCanal;

type
  TfrmUsuariosVisualizacionPrestacionesEspeciales = class(TfrmCustomGridABM)
    sdqConsultaCampos: TSDQuery;
    dsConsultaCampos: TDataSource;
    rgTipo: TRadioGroup;
    gbPorEntidad: TGroupBox;
    fraCanal: TfraCanal;
    fraEntidad: TfraEntidades;
    Label2: TLabel;
    Label3: TLabel;
    gbPorUsuario: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    fraUsuarioArt: TfraCodDesc;
    fraUsuarioWeb: TfraCodDesc;
    rbArt: TRadioButton;
    rbWeb: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure rbArtClick(Sender: TObject);
    procedure rbWebClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure CambiaCanal(Sender: TObject);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

var
  frmUsuariosVisualizacionPrestacionesEspeciales: TfrmUsuariosVisualizacionPrestacionesEspeciales;

implementation

uses
  unfraUsuarios, AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, unPropiedadesFrame, VCLExtra, General;

{$R *.dfm}

function TfrmUsuariosVisualizacionPrestacionesEspeciales.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'afi.ape_prestacionesespeciales';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('pe_id',    sdqConsulta.FieldByName('pe_id').AsInteger, False);
    Sql.Fields.Add('pe_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('pe_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('pe_id',    exNull);
      Sql.Fields.Add('pe_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('pe_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('pe_id',     sdqConsulta.FieldByName('pe_id').AsInteger, False);
      Sql.Fields.Add('pe_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('pe_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('pe_fechabaja',    exNull);
    Sql.Fields.Add('pe_identidad',    fraEntidad.Value, True);
    Sql.Fields.Add('pe_usubaja',      exNull);

    if rbArt.Checked then
    begin
      Sql.Fields.Add('pe_tipousuario', 'S', True);
      Sql.Fields.Add('pe_usuario',     fraUsuarioArt.Codigo, True);
    end;

    if rbWeb.Checked then
    begin
      Sql.Fields.Add('pe_tipousuario', 'W', True);
      Sql.Fields.Add('pe_usuario',     fraUsuarioWeb.Codigo, True);
    end;
  end;

  Result := inherited DoABM;
end;

function TfrmUsuariosVisualizacionPrestacionesEspeciales.Validar: Boolean;
var
  sSql: String;
begin
  Verificar((rgTipo.ItemIndex = -1), rgTipo, 'Debe indicar el Tipo.');

  Verificar((rgTipo.ItemIndex = 0) and (fraCanal.IsEmpty), fraCanal.edCodigo, 'Debe seleccionar el canal.');
  Verificar((rgTipo.ItemIndex = 0) and (fraEntidad.IsEmpty), fraEntidad.edCodigo, 'Debe seleccionar la entidad.');

  Verificar((rgTipo.ItemIndex = 1) and (not rbArt.Checked) and (not rbWeb.Checked), nil, 'Debe indicar el origen.');
  Verificar((rgTipo.ItemIndex = 1) and (rbArt.Checked) and (fraUsuarioArt.IsEmpty), fraUsuarioArt.edCodigo, 'Debe seleccionar el usuario de la ART.');
  Verificar((rgTipo.ItemIndex = 1) and (rbWeb.Checked) and (fraUsuarioWeb.IsEmpty), fraUsuarioWeb.edCodigo, 'Debe seleccionar el usuario de la WEB.');


  sSql :=
    'SELECT 1' +
     ' FROM afi.ape_prestacionesespeciales' +
    ' WHERE 1 = 1';

  if ModoABM = maModificacion then
    sSql := sSql + ' AND pe_id <> ' + SqlValue(sdqConsulta.FieldByName('pe_id').AsInteger);

  if rgTipo.ItemIndex = 0 then
    sSql := sSql + ' AND pe_identidad = ' + SqlValue(fraEntidad.Value)
  else
  begin
    if rbArt.Checked then
      sSql := sSql + ' AND pe_usuario = ' + SqlValue(fraUsuarioArt.Codigo);

    if rbWeb.Checked then
      sSql := sSql + ' AND pe_usuario = ' + SqlValue(fraUsuarioWeb.Codigo);
  end;

  Verificar(ExisteSql(sSql), nil, 'El usuario o la entidad ya existe.');

  Result := True;
end;


procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.ClearControls;
begin
  rgTipo.ItemIndex := -1;

  fraCanal.Clear;
  fraEntidad.Clear;

  rbArt.Checked := False;
  rbWeb.Checked := False;
  fraUsuarioArt.Clear;
  fraUsuarioWeb.Clear;

  VCLExtra.LockControls([gbPorEntidad, gbPorUsuario]);
end;

procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.LoadControls;
begin
  with sdqConsulta do
  begin
    rgTipo.ItemIndex := IIF(FieldByName('pe_identidad').IsNull, 1, 0);
    fraCanal.Value   := FieldByName('idcanal').AsInteger;
    fraEntidad.Value := FieldByName('pe_identidad').AsInteger;
    rbArt.Checked    := (FieldByName('pe_tipousuario').AsString = 'S');
    rbWeb.Checked    := (FieldByName('pe_tipousuario').AsString = 'W');

    if rbArt.Checked then
      fraUsuarioArt.Codigo := FieldByName('pe_usuario').AsString;

    if rbWeb.Checked then
      fraUsuarioWeb.Codigo := FieldByName('pe_usuario').AsString;
  end;
end;

procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT ape.*, ca_id idcanal, ca_descripcion canal, en_nombre entidad, DECODE(pe_tipousuario, ''S'', pe_usuario, NULL) usuariosuscripciones,' +
          ' DECODE(pe_tipousuario, ''W'', pe_usuario, NULL) usuarioweb' +
     ' FROM afi.ape_prestacionesespeciales ape, xen_entidad, aca_canal' +
    ' WHERE pe_identidad = en_id(+)' +
      ' AND en_idcanal = ca_id(+)';

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.FormCreate(Sender: TObject);
begin
  inherited;

  fraCanal.OnChange := CambiaCanal;

  FieldBaja := 'pe_fechabaja';
end;

procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.rbArtClick(Sender: TObject);
begin
  fraUsuarioArt.Show;
  fraUsuarioWeb.Hide;

  fraUsuarioWeb.Clear;

  if fraUsuarioArt.CanFocus then
    fraUsuarioArt.SetFocus;
end;

procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.rbWebClick(Sender: TObject);
begin
  fraUsuarioWeb.Show;
  fraUsuarioArt.Hide;

  fraUsuarioArt.Clear;

  if fraUsuarioWeb.CanFocus then
    fraUsuarioWeb.SetFocus;
end;

procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.rgTipoClick(Sender: TObject);
begin
  if rgTipo.ItemIndex = 0 then
  begin
    rbArt.Checked := False;
    rbWeb.Checked := False;
    fraUsuarioArt.Clear;
    fraUsuarioWeb.Clear;

    VCLExtra.LockControls([gbPorEntidad], False);
    VCLExtra.LockControls([gbPorUsuario]);

    if fraCanal.edCodigo.CanFocus then
      fraCanal.edCodigo.SetFocus;
  end
  else
  begin
    fraCanal.Clear;
    fraEntidad.Clear;
    
    VCLExtra.LockControls([gbPorEntidad]);
    VCLExtra.LockControls([gbPorUsuario], False);
  end;
end;

procedure TfrmUsuariosVisualizacionPrestacionesEspeciales.CambiaCanal(Sender: TObject);
begin
  if fraCanal.IsSelected then
    fraEntidad.Canal := fraCanal.Value
  else
    fraEntidad.Clear;
end;

end.
