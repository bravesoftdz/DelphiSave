unit unManLiquidadoresxCUIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  StdCtrls, Mask, PatternEdit, IntEdit, unArtFrame, unfraUsuarios,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManLiquidadoresxCUIT = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraUsuarioFiltro: TfraUsuario;
    GroupBox2: TGroupBox;
    rbTermFiltro: TRadioButton;
    edTermFiltro: TIntEdit;
    rbCuitFiltro: TRadioButton;
    fraEmpresaFiltro: TfraEmpresa;
    Label1: TLabel;
    fraUsuarioABM: TfraUsuario;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    rbTermABM: TRadioButton;
    edTermABM: TIntEdit;
    rbCUITABM: TRadioButton;
    fraEmpresaABM: TfraEmpresa;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure rbTermFiltroClick(Sender: TObject);
    procedure rbCuitFiltroClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure rbTermABMClick(Sender: TObject);
    procedure rbCUITABMClick(Sender: TObject);
  private
    procedure DoFiltroEmpresa;
    procedure DoFiltroEmpresaABM;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmManLiquidadoresxCUIT: TfrmManLiquidadoresxCUIT;

implementation

uses AnsiSql, CustomDlgs, SqlFuncs, unCustomConsulta, General, VCLExtra,
  unSesion, unDmPrincipal;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.FormCreate(Sender: TObject);
begin
  inherited;
  DoFiltroEmpresa;
  fraUsuarioFiltro.Sector             := 'PRESDIN';
  fraUsuarioFiltro.UsuariosGenericos  := False;
  fraUsuarioABM.Sector                := 'PRESDIN';
  fraUsuarioABM.UsuariosGenericos     := False;
  fraUsuarioABM.ShowBajas             := False;
  Sql.TableName                       := 'sin.sle_liquidadoresxempresa';
  FieldBaja                           := 'le_fechabaja';
  fraEmpresaABM.ShowBajas := true;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.rbTermFiltroClick(Sender: TObject);
begin
  DoFiltroEmpresa;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.rbCuitFiltroClick(Sender: TObject);
begin
  DoFiltroEmpresa;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.DoFiltroEmpresa;
begin
  LockControl(edTermFiltro, not rbTermFiltro.Checked);
  LockControl(fraEmpresaFiltro, not rbCuitFiltro.Checked);
  fraEmpresaFiltro.Clear;
  edTermFiltro.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.tbLimpiarClick(Sender: TObject);
begin
  fraUsuarioFiltro.Limpiar;
  rbTermFiltro.Checked := True;
  DoFiltroEmpresa;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.ClearControls;
begin
  fraUsuarioABM.Limpiar;
  rbTermABM.Checked := True;
  DoFiltroEmpresaABM;
end;
{-------------------------------------------------------------------------------}
function TfrmManLiquidadoresxCUIT.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add( 'le_id', sdqConsulta.FieldByName('le_id').AsInteger);
     Sql.Fields.Add('le_fechabaja', exDate);
     Sql.Fields.Add('le_usubaja', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddExpression('le_id', 'sin.seq_slesug_id.nextval');
       Sql.Fields.Add('le_fechaalta', exDate);
       Sql.Fields.Add('le_usualta', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('le_id', sdqConsulta.FieldByName('le_id').AsInteger);
       Sql.Fields.Add('le_fechamodif', exDate);
       Sql.Fields.Add('le_usumodif', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;
     Sql.Fields.Add('le_liquidador', fraUsuarioABM.UserID);
     Sql.Fields.Add('le_tipo', String(IIF(rbTermABM.Checked, 'T', 'C')));
     if rbTermABM.Checked then
     begin
       Sql.Fields.Add('le_terminacion', edTermABM.Value);
       Sql.Fields.Add('le_cuit', '');
     end
     else begin
       Sql.Fields.Add('le_terminacion', '');
       Sql.Fields.Add('le_cuit', fraEmpresaABM.CUIT);
     end;
  end;

  Result := inherited DoABM;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.LoadControls;
begin
  fraUsuarioABM.Cargar(sdqConsulta.FieldByName('le_liquidador').AsString);
  if (sdqConsulta.FieldByName('le_tipo').AsString = 'T') then
  begin
    rbTermABM.Checked   := True;
    edTermABM.Value     := sdqConsulta.FieldByName('le_terminacion').AsInteger;
  end
  else begin
    rbCUITABM.Checked   := True;
    fraEmpresaABM.CUIT  := sdqConsulta.FieldByName('le_cuit').AsString;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.RefreshData;
var
  sSql: String;
begin
  sSql := 'SELECT le_id, le_liquidador, le_tipo, le_terminacion, le_cuit, ' +
                ' art.utiles.armar_cuit(le_cuit) cuit, em_nombre, se_nombre, ' +
                ' le_fechabaja, DECODE(le_tipo, ''T'', ''Terminacion'', ''CUIT'') tipo ' +
           ' FROM sin.sle_liquidadoresxempresa, use_usuarios, aem_empresa ' +
          ' WHERE le_liquidador = se_usuario ' +
            ' AND le_cuit = em_cuit(+) ';

  if fraUsuarioFiltro.IsSelected then
    sSql := sSql + ' AND le_liquidador = ' + SqlValue(fraUsuarioFiltro.UserID);

  if rbTermFiltro.Checked and (edTermFiltro.Text <> '') then
    sSql := sSql + ' AND le_terminacion = ' + SqlInt(edTermFiltro.Value);

  if rbCuitFiltro.Checked and fraEmpresaFiltro.IsSelected then
    sSql := sSql + ' AND le_cuit = ' + SqlValue(fraEmpresaFiltro.CUIT);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited RefreshData;
end;
{-------------------------------------------------------------------------------}
function TfrmManLiquidadoresxCUIT.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraUsuarioABM.IsEmpty, fraUsuarioABM, 'Debe seleccionar el usuario.');
  Verificar(rbTermABM.Checked and (edTermABM.Text = ''), edTermABM, 'Debe ingresar la terminación.');
  Verificar(rbCUITABM.Checked and fraEmpresaABM.IsEmpty, fraEmpresaABM, 'Debe ingresar la empresa.');
  sSql := 'SELECT 1 FROM sin.sle_liquidadoresxempresa ' +
          ' WHERE le_fechabaja IS NULL ';
  if (ModoABM = maAlta) then
  begin
    if rbTermABM.Checked then
    begin
      sSql := sSql + ' AND le_terminacion = :term ';
      Verificar(ExisteSqlEx(sSql, [edTermABM.Value]), edTermABM, 'Ya existe un registro con la misma terminación.');
    end
    else if rbCUITABM.Checked then
    begin
      sSql := sSql + ' AND le_cuit = :cuit ';
      Verificar(ExisteSqlEx(sSql, [fraEmpresaABM.CUIT]), fraEmpresaABM, 'Ya existe un registro con el mismo CUIT.');
    end;
  end
  else if (ModoABM = maModificacion) then
  begin
    sSql := sSql + ' AND le_liquidador <> :usu ' +
                   ' AND le_id <> :id ';
    if rbTermABM.Checked then
    begin
      sSql := sSql + ' AND le_terminacion = :term ';
      Verificar(ExisteSqlEx(sSql, [fraUsuarioABM.UserID, sdqConsulta.FieldByName('le_id').AsInteger, edTermABM.Value]),
                edTermABM, 'Ya existe un registro con la misma terminación.');
    end
    else if rbCUITABM.Checked then
    begin
      sSql := sSql + ' AND le_cuit = :cuit ';
      Verificar(ExisteSqlEx(sSql, [fraUsuarioABM.UserID, sdqConsulta.FieldByName('le_id').AsInteger, fraEmpresaABM.CUIT]),
                fraEmpresaABM, 'Ya existe un registro con el mismo CUIT.');
    end;
  end;
  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.DoFiltroEmpresaABM;
begin
  LockControl(edTermABM, not rbTermABM.Checked);
  LockControl(fraEmpresaABM, not rbCUITABM.Checked);
  fraEmpresaABM.Clear;
  edTermABM.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.rbTermABMClick(Sender: TObject);
begin
  inherited;
  DoFiltroEmpresaABM;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManLiquidadoresxCUIT.rbCUITABMClick(Sender: TObject);
begin
  inherited;
  DoFiltroEmpresaABM;
end;
{-------------------------------------------------------------------------------}
end.
