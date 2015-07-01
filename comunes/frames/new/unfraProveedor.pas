unit unfraProveedor;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ArtComboBox, StdCtrls, Mask, Db, SDEngine, IntEdit, PatternEdit,
  unArt, unArtFrame, unArtDbFrame, RxToolEdit;

type
  TfraProveedor = class(TArtDbFrame)
    lbCUIT: TLabel;
    mskCUIT: TMaskEdit;
    lbIdentif: TLabel;
    lbRSocial: TLabel;
    cmbDescripcion: TArtComboBox;
    edIdentificador: TIntEdit;
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure edIdentificadorKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    function GetCUIT: string;
    function GetIdentificador: integer;
    function GetRazonSocial: string;
  protected
    procedure ShowList;

    function  GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    function  GetSql: string; override;
    function  GetSqlOrderBy: string; override;
    function  GetSqlWhere: string; override;
    function  IsBaja: Boolean; override;

    procedure LoadValues( DoChanges : boolean = False); override;
    procedure SetEditorsValues; virtual;
    procedure Internal_SetIdentificador(AIdentificador: Integer; DoChanges : Boolean = False);
    procedure Internal_SetCuit(ACuit: string; DoChanges : Boolean = False);
    procedure Internal_SetSecuencia(ASecuencia: Integer; DoChanges : Boolean = False);
    procedure SetLocked(const Value: Boolean); override;
  public
    procedure   Clear; override;
    constructor Create(AOwner: TComponent); override;
  published
    property Value;
    property CUIT: string read GetCUIT;
    property RazonSocial: string read GetRazonSocial;
    property Identificador: integer read GetIdentificador;
    property IdProveedor: integer read GetIdentificador;
  end;

implementation

uses
  unDmPrincipal, General, AnsiSql, SqlFuncs, CustomDlgs, VCLExtra;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfraProveedor.mskCUITKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    Internal_SetCuit(mskCUIT.Text, True);
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.cmbDescripcionDropDown(Sender: TObject);
var
  sSql: String;
begin
  sSql := GetSql +
          GetSqlWhere + GetSqlOrderBy;

  AddCondition(sSql, ' PP_DESCRIPCION LIKE ' + SQL_QUOTE + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE);
  OpenQuery(sdqDatos, sSql, True);

  if mskCUIT.Text <> '' Then
    sdqDatos.Locate('CUIT', mskCUIT.Text, []);
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.edIdentificadorKeyPress(Sender: TObject; var Key: Char);
begin
  if (not edIdentificador.ReadOnly) and (Key = #13) then
    Internal_SetIdentificador(edIdentificador.Value, True);
end;
{--[ Se cargan los valores para todos los Controles ]------------------------------------------------------------------}
procedure TfraProveedor.cmbDescripcionCloseUp(Sender: TObject);
begin
  if cmbDescripcion.Text = '' Then
    Clear
  else
    LoadValues( True );
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.ShowList;
begin
  case sdqDatos.RecordCount of
    0: InfoHint(edIdentificador, 'No se encontró el proveedor.');
    1: LoadValues(True);
  else
    cmbDescripcion.DoDropDown( False );
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.FrameExit(Sender: TObject);
begin
  if not ReadOnly Then
  begin
    if (edIdentificador.Text = '') Then
      Clear

    else if (edIdentificador.Text <> '') and ((not sdqDatos.Active) or (edIdentificador.Text <> sdqDatos.FieldByName('ID').AsString)) Then
      Internal_SetIdentificador( edIdentificador.Value, True )

    else
      LoadValues( False );
  end;
end;
{------------------------------------------------------------------------------}
constructor TfraProveedor.Create(AOwner: TComponent);
begin
  inherited;
  FShowBajas := False;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja Then
    AFont.Color := clRed;
end;
{------------------------------------------------------------------------------}
function TfraProveedor.GetValue: TTableID;
begin
  FrameExit( nil ); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName('ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.SetValue(const Value: TTableID);
begin
  Internal_SetIdentificador(Value, False);
end;
{------------------------------------------------------------------------------}
function TfraProveedor.GetSql: String;
begin
  if FSql = '' then
  begin
    Result := 'SELECT PP_CUIT CUIT, PP_IDUSADO ID, PP_DESCRIPCION RSOCIAL, ' +
                     'PP_FECHABAJA FECHABAJA ' +
                'FROM ART.APP_PRESTADORPROVEEDOR' + GetDBLink() + ' ' +
               'WHERE PP_TIPO = 1  ';
  end else
    Result := FSql;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.Clear;
begin
  inherited;

  mskCUIT.Clear;
  edIdentificador.Clear;
  cmbDescripcion.Clear;
end;
{------------------------------------------------------------------------------}
function TfraProveedor.GetSqlOrderBy: string;
begin
  Result := ' ORDER BY RSOCIAL, CUIT, ID';
end;
{------------------------------------------------------------------------------}
function TfraProveedor.GetSqlWhere: string;
begin
  if ShowBajas then
    Result := ''
  else
    Result := ' AND PP_FECHABAJA IS NULL ';
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.Internal_SetIdentificador(AIdentificador: Integer; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere;

  AddCondition(sSql, ' PP_IDUSADO = ' + SqlValue(AIdentificador));

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( DoChanges ); { No hace un ShowList porque se supone que no hay mas de un registro con el mismo Identificador};
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.Internal_SetCuit(ACuit: string; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere + GetSqlOrderBy;

  AddCondition(sSql, ' PP_CUIT = ' + SqlValue(ACuit));
  if OpenQuery(sdqDatos, sSql, True) Then
    ShowList;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.Internal_SetSecuencia(ASecuencia: Integer; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere + GetSqlOrderBy;

  AddCondition(sSql, ' PP_IDUSADO = ' + SqlValue(ASecuencia));
  if OpenQuery(sdqDatos, sSql, True) Then
    ShowList;
end;
{------------------------------------------------------------------------------}
function TfraProveedor.IsBaja: Boolean;
begin
  Result := not sdqDatos.FieldByName('FECHABAJA').IsNull;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.LoadValues(DoChanges: boolean);
begin
  SetEditorsValues;
  if IsBaja then
  begin
    Font.Color := clRed;
    if not Locked and DoChanges then
      InfoHint(cmbDescripcion, 'Tenga en cuenta que el proveedor está dado de baja.', False, 'Información', blnInfo, 1, False);
  end
  else
    Font.Color := clWindowText;

  if DoChanges then
  begin
    Change;

    if (mskCUIT.Text > '') then {Se cargaron los datos}
      DoLostFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.SetEditorsValues;
begin
  mskCUIT.Text         := sdqDatos.FieldByName('CUIT').AsString ;
  edIdentificador.Text := sdqDatos.FieldByName('ID').AsString ;
  cmbDescripcion.Text  := sdqDatos.FieldByName('RSOCIAL').AsString ;
end;
{------------------------------------------------------------------------------}

function TfraProveedor.GetCUIT: string;
begin
  if sdqDatos.Active then
    Result := mskCUIT.Text
  else
    Result := EmptyStr;
end;
{------------------------------------------------------------------------------}
procedure TfraProveedor.SetLocked(const Value: Boolean);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
function TfraProveedor.GetIdentificador: integer;
begin
  if sdqDatos.Active then
    Result := edIdentificador.Value
  else
    Result := ART_EMPTY_ID;
end;
{------------------------------------------------------------------------------}
function TfraProveedor.GetRazonSocial: string;
begin
  Result := cmbDescripcion.Text;
end;
{------------------------------------------------------------------------------}
end.

