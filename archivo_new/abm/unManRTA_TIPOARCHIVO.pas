unit unManRTA_TIPOARCHIVO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, PatternEdit, DBIncrementalSearch, ExComboBox,
  unArtFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmManRTA_TIPOARCHIVO = class(TfrmCustomGridABM)
    Label1: TLabel;
    edTA_CODIGO: TEdit;
    dbiBusqueda: TDBIncrementalSearch;
    Label2: TLabel;
    edTA_DESCRIPCION: TEdit;
    edTA_TABLA: TPatternEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    chkCreaCarpNumerada: TCheckBox;
    fraTipoClave: TfraCodigoDescripcion;
    chkTA_TIENEREPOSITORIO: TCheckBox;
    Label6: TLabel;
    edTA_DESCRIPCIONREDUCIDA: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
  private
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

implementation

uses
  unPrincipal, CustomDlgs, SqlFuncs, unDmPrincipal, General, VCLExtra;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRTA_TIPOARCHIVO.ClearControls;
begin
  edTA_CODIGO.Clear;
  edTA_DESCRIPCION.Clear;
  edTA_DESCRIPCIONREDUCIDA.Clear;
  edTA_TABLA.Clear;
  fraTipoClave.Clear;
  chkTA_TIENEREPOSITORIO.Checked := False;

  VCLExtra.LockControl(edTA_CODIGO, False);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRTA_TIPOARCHIVO.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    Sql.PrimaryKey.Add('TA_ID',           sdqConsulta.FieldByName('TA_ID').AsInteger);
    Sql.Fields.Add('TA_USUBAJA',          frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('TA_FECHABAJA',        exDateTime);
    Sql.SqlType := stUpdate;
  end
  else begin
    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add('TA_ID',             IncSql('SELECT MAX(TA_ID) FROM RTA_TIPOARCHIVO'));
      Sql.Fields.Add('TA_USUALTA',            frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('TA_FECHAALTA',          exDateTime);
    end
    else begin
      Sql.PrimaryKey.Add('TA_ID',             sdqConsulta.FieldByName('TA_ID').AsInteger);
      Sql.Fields.Add('TA_USUMODIF',           frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('TA_FECHAMODIF',         exDateTime);
      Sql.Fields.Add('TA_USUBAJA',            exNull);
      Sql.Fields.Add('TA_FECHABAJA',          exNull);
    end;

    Sql.Fields.Add('TA_CODIGO',               Trim(edTA_CODIGO.Text));
    Sql.Fields.Add('TA_DESCRIPCION',          Trim(edTA_DESCRIPCION.Text));
    Sql.Fields.Add('TA_DESCRIPCIONREDUCIDA',  Trim(edTA_DESCRIPCIONREDUCIDA.Text));
    Sql.Fields.Add('TA_TABLA',                edTA_TABLA.Text);
    Sql.Fields.Add('TA_FORMULARIO',           fraTipoClave.Codigo);
    Sql.Fields.Add('TA_CREACARPETA',          String(Iif(chkCreaCarpNumerada.Checked, 'S', 'N')));
    Sql.Fields.Add('TA_TIENEREPOSITORIO',     String(Iif(chkTA_TIENEREPOSITORIO.Checked, 'S', 'N')));
  end;
  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRTA_TIPOARCHIVO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuManTipoArchivos.Enabled := True;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRTA_TIPOARCHIVO.LoadControls;
begin
  edTA_CODIGO.Text               := sdqConsulta.FieldByName('TA_CODIGO').AsString;
  edTA_DESCRIPCION.Text          := sdqConsulta.FieldByName('TA_DESCRIPCION').AsString;
  edTA_DESCRIPCIONREDUCIDA.Text  := sdqConsulta.FieldByName('TA_DESCRIPCIONREDUCIDA').AsString;
  edTA_TABLA.Text                := sdqConsulta.FieldByName('TA_TABLA').AsString;
  fraTipoClave.Codigo            := sdqConsulta.FieldByName('TA_FORMULARIO').AsString;
  chkCreaCarpNumerada.Checked    := sdqConsulta.FieldByName('TA_CREACARPETA').AsString = 'S';
  chkTA_TIENEREPOSITORIO.Checked := sdqConsulta.FieldByName('TA_TIENEREPOSITORIO').AsString = 'S';

  VCLExtra.LockControl(edTA_CODIGO);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmManRTA_TIPOARCHIVO.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql := 'SELECT 1 ' +
            'FROM RTA_TIPOARCHIVO ' +
           'WHERE TA_CODIGO = :Codigo';

  if edTA_CODIGO.Text = '' then
    InvalidMsg(edTA_CODIGO, 'Debe ingresar el código del tipo de archivo.')

  else if (ModoABM = maAlta) and ExisteSqlEx(sSql, [Trim(edTA_CODIGO.Text)]) then
    InvalidMsg(edTA_CODIGO, 'El código del tipo de archivo ya existe.')

  else if edTA_DESCRIPCION.Text = '' then
    InvalidMsg(edTA_DESCRIPCION, 'Debe ingresar la descripción del tipo de archivo.')

  else if edTA_DESCRIPCIONREDUCIDA.Text = '' then
    InvalidMsg(edTA_DESCRIPCIONREDUCIDA, 'Debe ingresar la descripción reducida del tipo de archivo.')

  else if fraTipoClave.IsEmpty then
    InvalidMsg(fraTipoClave.edCodigo, 'Debe seleccionar un formulario.')

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRTA_TIPOARCHIVO.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja     := 'TA_FECHABAJA';
  Sql.TableName := 'RTA_TIPOARCHIVO';

  with fraTipoClave do
  begin
    TableName   := 'RTC_TIPOCLAVE';
    FieldID     := 'TC_ID';
    FieldCodigo := 'TC_CLAVE';
    FieldDesc   := 'TC_DESCRIPCION';
    ShowBajas   := false;    
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRTA_TIPOARCHIVO.fpAbmEnter(Sender: TObject);
begin
  if ModoABM = maAlta then
   edTA_CODIGO.SetFocus
  else
   edTA_DESCRIPCION.SetFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
