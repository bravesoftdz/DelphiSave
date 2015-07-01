unit unManRAU_ARCHIVOUSUARIO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, StdCtrls, ExComboBox, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion,
  unFraUsuario, unfraSectores, unArtDBAwareFrame;

type
  TfrmManRAU_ARCHIVOUSUARIO = class(TfrmCustomGridABM)
    fraUsuario: TfraUsuarios;
    Label1: TLabel;
    fraTipoArchivo: TfraCodigoDescripcion;
    Label2: TLabel;
    gbBusqueda: TGroupBox;
    lbTipoArchivo: TLabel;
    lblUsuarioBusqueda: TLabel;
    fraUsuarioBusqueda: TfraUsuarios;
    fraTipoArchivoBusqueda: TfraCodigoDescripcion;
    lblSectorBusqueda: TLabel;
    fraSectoresBusqueda: TfraSectores;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbNuevoClick(Sender: TObject);
    procedure cmbAU_IDTIPOARCHIVOChange(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    function VerificarNoExiste(IdTipoArchivo: integer; Usuario: string): boolean;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  public
  end;

implementation

uses
  unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.ClearData;
begin
  fraTipoArchivoBusqueda.Clear;
  fraUsuarioBusqueda.Clear;
  fraSectoresBusqueda.edCodigo.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.ClearControls;
begin
  fraUsuario.Clear;
  fraTipoArchivo.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRAU_ARCHIVOUSUARIO.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maAlta Then
  begin
    Sql.PrimaryKey.Add('AU_ID',               GetSecNextVal('seq_rau_id'));
    Sql.Fields.Add('AU_IDTIPOARCHIVO',        fraTipoArchivo.Value);
    Sql.Fields.Add('AU_USUARIO',              fraUsuario.Value);
    Sql.Fields.Add('AU_USUALTA',              frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('AU_FECHAALTA',            exDateTime);
  end
  else begin
    Sql.PrimaryKey.Add('AU_ID',               sdqConsulta.FieldByName('AU_ID').AsInteger);
    if ModoABM = maBaja Then
    begin
      Sql.Fields.Add('AU_USUBAJA',            frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('AU_FECHABAJA',          exDateTime);
    end else
    begin
      Sql.PrimaryKey.Add('AU_IDTIPOARCHIVO',  sdqConsulta.FieldByName('AU_IDTIPOARCHIVO').AsInteger);
      Sql.PrimaryKey.Add('AU_USUARIO',        sdqConsulta.FieldByName('AU_USUARIO').AsString);
      Sql.Fields.Add('AU_USUBAJA',            exNull);
      Sql.Fields.Add('AU_FECHABAJA',          exNull);
    end;
    Sql.SqlType := stUpdate;
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja     := 'AU_FECHABAJA';
  Sql.TableName := 'RAU_TIPOARCHIVOUSUARIO';

  with fraTipoArchivoBusqueda do
  begin
    TableName   := 'RTA_TIPOARCHIVO';
    FieldID     := 'TA_ID';
    FieldCodigo := 'TA_CODIGO';
    FieldDesc   := 'TA_DESCRIPCION';
    ShowBajas   := True;          
  end;

  with fraTipoArchivo do
  begin
    TableName   := 'RTA_TIPOARCHIVO';
    FieldID     := 'TA_ID';
    FieldCodigo := 'TA_CODIGO';
    FieldDesc   := 'TA_DESCRIPCION';
    ShowBajas   := True;
  end;

  AutoLock := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.LoadControls;
begin
  fraTipoArchivo.Value := sdqConsulta.FieldByName('AU_IDTIPOARCHIVO').AsInteger;
  fraUsuario.Value     := sdqConsulta.FieldByName('AU_USUARIO').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRAU_ARCHIVOUSUARIO.Validar: Boolean;
begin
  VerificarMultiple(['Validando Carga de Usuarios',
      fraTipoArchivo, fraTipoArchivo.IsSelected, 'Debe Seleccionar un Tipo de Carpeta',
      fraUsuario, fraUsuario.IsSelected, 'Debe Seleccionar un Usuario',
      fraUsuario, VerificarNoExiste(fraTipoArchivo.Value, fraUsuario.Codigo), 'La relación ya se encuentra cargada']);

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuManAdministradores.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.RefreshData;
var
  sSql: string;
begin
  sSql := ' SELECT USE.se_nombre, rta.ta_descripcion, rau.*   ' +
          ' FROM archivo.rau_tipoarchivousuario rau,          ' +
          '      use_usuarios USE,                            ' +
          '      archivo.rta_tipoarchivo rta                  ' +
          ' WHERE (    (USE.se_usuario = rau.au_usuario)      ' +
          '        AND (rta.ta_id = rau.au_idtipoarchivo))';

  if fraUsuarioBusqueda.IsSelected then
   sSql := sSql + ' and (rau.au_usuario = ' + SqlValue(fraUsuarioBusqueda.Codigo) + ') ';
  if fraTipoArchivoBusqueda.IsSelected then
   sSql := sSql + ' and (rau.au_idtipoarchivo = ' + SqlValue(fraTipoArchivoBusqueda.Value) + ') ';
  if fraSectoresBusqueda.edCodigo.Text <> '' then
   sSql := sSql+ ' and (SE_SECTOR = ' + SqlValue(fraSectoresBusqueda.edCodigo.Text) + ') ';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.tbNuevoClick(Sender: TObject);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.cmbAU_IDTIPOARCHIVOChange(Sender: TObject);
begin
  RefreshData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRAU_ARCHIVOUSUARIO.tbModificarClick(Sender: TObject);
begin
  if IsBaja and (MsgBox('¿Desea reestablecer el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) Then
  begin
    ModoABM := maModificacion;
    DoABM;
    sdqConsulta.Refresh;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRAU_ARCHIVOUSUARIO.VerificarNoExiste(IdTipoArchivo : integer; Usuario : string) : boolean;
begin
    Result := ValorSql('select count(*) from archivo.rau_tipoarchivousuario ' +
                       ' where au_idtipoarchivo = ' + SqlValue(IdTipoArchivo) +
                       '   and au_usuario = ' + SqlValue(Usuario)             +
                       '   and au_fechabaja is null ', '0') = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
