unit unfraUsuarios;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine, unARTFrame, RxToolEdit;

type
  TfraUsuario = class(TArtFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosSE_USUARIO: TStringField;
    sdqDatosSE_NOMBRE: TStringField;
    sdqDatosSE_FECHABAJA: TDateTimeField;
    sdqDatosSE_SECTOR: TStringField;
    sdqDatosSE_PERFIL: TStringField;
    sdqDatosSE_MAIL: TStringField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    FShowBajas: Boolean;
    FSql: String;
    FSector: String;
    FSectores: String;
    FUsuariosGenericos: Boolean;
{   FOnChange: TNotifyEvent;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);}
    function  GetSql: String;
    procedure SetSector(const Value: String);
    procedure SetSectores(const Value: String);
    function  GetUserID: String;
    function  GetNombre: String;
    function  GetSector: String;
    function GetUserMail: String;
    function GetID: integer;
  public
    procedure AfterConstruction; override;
    procedure Clear; override;
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String ; OnlyValids : Boolean = False; DoEvents : Boolean = False );
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1);
    function  IsBaja: Boolean;
    function  IsSelected : Boolean ;
    function  IsEmpty : Boolean ;
    constructor Create(AOwner: TComponent); override;
  published
    property  ShowBajas  : Boolean      read FShowBajas   write FShowBajas;
//    Property OnChange   : TNotifyEvent read FOnChange    write FOnChange;
//    Property Modified   : Boolean      read GetModified  write SetModified;
//    Property ReadOnly   : Boolean      read GetReadOnly  write SetReadOnly;
    property Sql               : String       read GetSql       write FSql;
    property Sector            : String       read GetSector    write SetSector;
    property Sectores          : String       read FSectores    write SetSectores;
    property UserID            : String       read GetUserID;
    property Nombre            : String       read GetNombre;
    property UserMail          : String       read GetUserMail;
    property ID                : Integer      read GetID;
    property UsuariosGenericos : Boolean      read FUsuariosGenericos write FUsuariosGenericos;
  end;

implementation
{$R *.DFM}

uses
  unDmPrincipal, General, AnsiSql;

const
  BaseSql = 'SELECT SE_USUARIO, SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABAJA, ' +
                    {$IFDEF ORACLE}
                    'SE_MAIL ' +
                    {$ELSE}
                    ''''' as SE_MAIL ' +
                    {$ENDIF}
              'FROM USE_USUARIOS WHERE 1=1 ';
  OrderBy = ' ORDER BY SE_NOMBRE';

procedure TfraUsuario.Cargar(ACodigo: String ; OnlyValids : Boolean = False ; DoEvents : Boolean = False );
var
  sSql : String;
begin
  sSql := GetSql + ' AND SE_USUARIO = ''' + ACodigo + '''' ;

  if OnlyValids then
    sSql := sSql + IIF(FShowBajas, '', ' AND SE_FECHABAJA IS NULL');

  if OpenQuery(sdqDatos, sSql, True) then
  begin
    cmbDescripcion.Text := sdqDatosSE_NOMBRE.AsString;
    cmbDescripcionCloseUp(nil);
  end;

  if DoEvents and Assigned(FOnChange) Then
    FOnChange(Self);
end;

procedure TfraUsuario.DoLostFocus;
begin
  if edCodigo.Focused or cmbDescripcion.Focused then
  begin
    cmbDescripcion.SetFocus ;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfraUsuario.Limpiar;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
  sdqDatos.Close;
end;

procedure TfraUsuario.SetColors(AColor: TColor; ABackGround : TColor = -1);
begin
  edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;

  if ABackGround <> -1 then
  begin
    edCodigo.Color       := ABackGround;
    cmbDescripcion.Color := ABackGround;
  end;
end;

procedure TfraUsuario.cmbDescripcionCloseUp(Sender: TObject);
begin
  if cmbDescripcion.Text = '' then
    Limpiar
  else begin
    edCodigo.Text       := sdqDatosSE_USUARIO.AsString ;
    cmbDescripcion.Text := sdqDatosSE_NOMBRE.AsString ;

    if sdqDatosSE_FECHABAJA.IsNull then
       SetColors(clWindowText)
    else
       SetColors(clRed);

    if Assigned(Sender) then
    begin
      if Assigned(FOnChange) then
        OnChange( Self );

      if (edCodigo.Text <> '') then
        DoLostFocus;
    end;
  end;
end;

procedure TfraUsuario.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  sSql: string;
begin
  if Key = #13 then
    if edCodigo.Text = '' then
      Limpiar
    else begin
      sSql := GetSql +
              ' AND SE_USUARIO = ''' + edCodigo.Text + '''' +
              IIF(FShowBajas,'', ' AND SE_FECHABAJA IS NULL');
      if OpenQuery(sdqDatos, sSql, True) then
      begin
        cmbDescripcion.Text := sdqDatosSE_NOMBRE.AsString;
        cmbDescripcionCloseUp(Sender);
      end;
    end;
end;

procedure TfraUsuario.cmbDescripcionDropDown(Sender: TObject);
var
  sSql : String;
begin
  if (sdqDatos.Active and (sdqDatosSE_NOMBRE.AsString = cmbDescripcion.Text)) then
    sSql := GetSql +
            IIF(FShowBajas,'', ' AND SE_FECHABAJA IS NULL') +
            OrderBy
  else
    sSql := GetSql +
            ' AND ' + SQL_UPPER + '(SE_NOMBRE) LIKE ' + SQL_UPPER + '(''' + cmbDescripcion.Text + '%'')' +
            IIF(FShowBajas,'', ' AND SE_FECHABAJA IS NULL') +
            OrderBy;

  OpenQuery(sdqDatos, sSql, True);
  if edCodigo.Text <> '' then
    sdqDatos.Locate( 'SE_USUARIO', edCodigo.Text, []);
end;

procedure TfraUsuario.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatosSE_FECHABAJA.IsNull then
    AFont.Color := clRed;
end;

procedure TfraUsuario.FrameExit(Sender: TObject);
begin
  if (edCodigo.Text <> '') then begin
    if (not sdqDatos.Active) or (edCodigo.Text <> sdqDatosSE_USUARIO.AsString) then
      Cargar(edCodigo.Text, True, True)
    else
      cmbDescripcion.Text := sdqDatosSE_NOMBRE.AsString;
  end else
    cmbDescripcion.Text := '';
end;

function TfraUsuario.GetSql: String;
begin
  if FSql = '' then
  begin
    Result := BaseSql;

    if (FSector <> '') then
      Result := Result + ' AND SE_SECTOR = ''' + FSector + ''' '
    else if (FSectores <> '') then
      Result := Result + ' AND SE_SECTOR IN ' + FSectores + ' ';

    if not UsuariosGenericos then
      Result := Result + ' AND SE_USUARIOGENERICO = ''N'' ';
  end else
    Result := FSql;
end;

{
function TfraUsuario.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;

procedure TfraUsuario.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;

function TfraUsuario.GetReadOnly: Boolean;
begin
    Result := edCodigo.ReadOnly and cmbDescripcion.ReadOnly ;
end;

procedure TfraUsuario.SetReadOnly(const Value: Boolean);
begin
    edCodigo.ReadOnly        := Value;
    cmbDescripcion.ReadOnly  := Value;
end;
}

function TfraUsuario.IsSelected: Boolean;
begin
  Result := sdqDatos.Active and
            (edCodigo.Text       =  sdqDatosSE_USUARIO.AsString) and
            (cmbDescripcion.Text =  sdqDatosSE_NOMBRE.AsString);
end;

procedure TfraUsuario.SetSector(const Value: String);
begin
  if FSector <> Value then begin
     FSector := Value;
     if sdqDatosSE_SECTOR.AsString <> Value then
        Limpiar;
  end;
end;

procedure TfraUsuario.SetSectores(const Value: String);
begin
  if FSectores <> Value then
  begin
     FSectores := Value;
     Limpiar;
  end;
end;

function TfraUsuario.IsEmpty: Boolean;
begin
  Result := not IsSelected;
end;

function TfraUsuario.GetUserID: String;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := sdqDatos.FieldByName('SE_USUARIO').AsString
  else
    Result := edCodigo.Text;
end;

function TfraUsuario.GetNombre: String;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := sdqDatos.FieldByName('SE_NOMBRE').AsString
  else
    Result := cmbDescripcion.Text;
end;

function TfraUsuario.GetSector: String;
begin
  if FSector > '' then
    Result := FSector
  else
    if sdqDatos.Active and not sdqDatos.IsEmpty then
      Result := sdqDatos.FieldByName('SE_SECTOR').AsString
    else
      Result := '';
end;

function TfraUsuario.GetUserMail: String;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := sdqDatos.FieldByName('SE_MAIL').AsString
  else
    Result := '';
end;

function TfraUsuario.IsBaja: Boolean;
begin
  Result := not sdqDatosSE_FECHABAJA.IsNull;
end;

function TfraUsuario.GetID: integer;
begin
{$IFDEF ORACLE}
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := ValorSQLEx('select se_id from use_usuarios where se_usuario = :v1', [sdqDatos.FieldByName('SE_USUARIO').AsString])
  else
{$ENDIF}
    Result := 0;
end;

constructor TfraUsuario.Create(AOwner: TComponent);
begin
  inherited;
  FUsuariosGenericos := True;
end;

procedure TfraUsuario.AfterConstruction;
begin
  inherited;
  cmbDescripcion.DataSource := dsDatos;
end;

procedure TfraUsuario.Clear;
begin
  Limpiar;
end;

end.
