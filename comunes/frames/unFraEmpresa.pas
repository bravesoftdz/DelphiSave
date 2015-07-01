unit unFraEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, StdCtrls, EditNew, ToolEdit, RxLookup, Mask, IntEdit,
  unArtDbFrame, ArtComboBox, Cuit, PatternEdit, JvComponent, JvAppHotKey,
  ExtCtrls;

type
  TfraEmpresa = class(TArtDbFrame)
    lbCUIT: TLabel;
    mskCUIT: TMaskEdit;
    lbRSocial: TLabel;
    lbContrato: TLabel;
    sdqEmpresa: TSDQuery;
    dsEmpresa: TDataSource;
    edContrato: TIntEdit;
    cmbRSocial: TArtComboBox;
    TimerConfidencial: TTimer;
    procedure HotKeyMethod(Sender: TObject);
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRSocialCloseUp(Sender: TObject);
    procedure cmbRSocialDropDown(Sender: TObject);
    procedure edContratoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRSocialGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure TimerConfidencialTimer(Sender: TObject);
    procedure mskCUITChange(Sender: TObject);
  private
    FJvApplicationHotKey: TJvApplicationHotKey;
    FMinLength: Integer;
    FShowMessages, FConfidencialidad, FTercerizadoras: Boolean;
    FBalloonMessages: Boolean;
    function InternalCargar( ASql : String; ShowError : Boolean ) : Boolean;
    function GetContrato: integer;
    procedure SetContrato(const Value: integer);
    function GetFormPadre: TForm;
    function GetNombreEmpresa: string;
    function GetCUIT: TCuit;
    procedure SetCUIT(const Value: TCuit);
  protected
    function GetValue: TCuit; reintroduce;
    procedure SetValue(const Value: TCuit); reintroduce;
    function GetSql: string; override;
    function GetSqlOrderBy: string; override;
    function  GetSqlWhere  : string; override;
    function  IsBaja : Boolean; override;
    procedure LoadValues( DoChanges : boolean = False); override;
    function  GetIsEmpty: boolean; override;
  public
    procedure Limpiar; { Para Compatibilidad con Versiones Anteriores }
    procedure Clear; override;
    constructor Create(AOwner: TComponent); override;
    function Cargar( sCUIT : String; ShowError : Boolean = False) : Boolean; overload;// Retorna True si se encontro la empresa
    function Cargar( AContrato : Integer; ShowError : Boolean = False) : Boolean; overload;// Retorna True si se encontro la empresa
    {$IFDEF NOUSAR}
    procedure SetColors( AColor : TColor);
    {$ENDIF}
  published
    property Confidencialidad    : boolean   read FConfidencialidad write FConfidencialidad;
    property Contrato            : integer   read GetContrato       write SetContrato;
    property CUIT                : TCuit     read GetCUIT           write SetCUIT;       
    property FormPadre           : TForm     read GetFormPadre;
    property MinLength           : Integer   read FMinLength        write FMinLength default 4;
    property NombreEmpresa       : string    read GetNombreEmpresa;
    property Value               : TCuit     read GetValue          write SetValue;
    property ShowMessages        : Boolean   read FShowMessages     write FShowMessages;
    property BalloonMessages     : Boolean   read FBalloonMessages  write FBalloonMessages;
    property Tercerizadoras      : Boolean   read FTercerizadoras   write FTercerizadoras;
    property ShowBajas default True;
  end;

implementation

uses
  General, unDmPrincipal, Numeros, AnsiSql, CustomDlgs, unConfidencial,
  {$IFNDEF SERVICE}unVisualizadorDigitalizacion, {$ENDIF}unSesion, unTercerizadoras;

{$R *.DFM}

constructor TfraEmpresa.Create(AOwner: TComponent);
var
  AComponent: TComponent;
begin
  inherited;
  FMinLength := 4;
  ShowBajas  := True;
  FShowMessages := True;
  FBalloonMessages := False;
  FConfidencialidad := False;
  FTercerizadoras := False;

  AComponent := Owner;
  while not AComponent.InheritsFrom(TForm) do
    AComponent := AComponent.Owner;

  FJvApplicationHotKey := TJvApplicationHotKey.Create(AComponent);
  Hint := 'Presione Ctrl + Shift + F2 para ver la documentación digitalizada';
  ShowHint := True;

  with FJvApplicationHotKey do
  begin
    HotKey := 24689; {Ctrl + Shift + F2}
    Active := True;
    OnHotKey := HotKeyMethod;
  end;
end;

function TfraEmpresa.GetSql: String;
begin
  if FSql = '' then
    {$IFDEF MSACCESS}
    Result := ' SELECT mp_id, mp_cuit, mp_nombre, mp_contrato, mp_cobertura as estado ' + FExtraFields +
                ' FROM cmp_empresas WHERE 1=1 '
    {$ELSE}
    {$IFDEF SQLSERVER}
    Result := ' SELECT mp_id, mp_cuit, mp_nombre, mp_contrato, mp_cobertura as estado ' + FExtraFields +
                ' FROM cmp_empresas WHERE 1=1 '
    {$ELSE}
    Result := ' SELECT em_id as mp_id, em_cuit as mp_cuit, em_nombre as mp_nombre, co_contrato as mp_contrato, ' +
                    ' afiliacion.check_cobertura(co_contrato, ActualDate) as estado ' + FExtraFields +
               ' FROM aem_empresa, aco_contrato ' +
              ' WHERE em_id = co_idempresa AND 1=1 '
    {$ENDIF}
    {$ENDIF}
  else
    Result := FSql;

  {$IFNDEF MSACCESS}
  {$IFNDEF SQLSERVER}

  if ExisteSql('SELECT 1 FROM cae_accesoempresa WHERE ae_usuario = ' + SqlValue(Sesion.UserID)) then
    Result :=Result + ' AND EXISTS (SELECT 1 FROM cae_accesoempresa ' +
                                   ' WHERE ae_cuit = mp_cuit ' +
                                     ' AND ae_usuario = ' + SqlValue(Sesion.UserID) + ')';
  {$ENDIF}
  {$ENDIF}
end;

function TfraEmpresa.InternalCargar(ASql: String; ShowError : Boolean) : Boolean;
begin
  OpenQuery(sdqEmpresa, ASql + GetSqlOrderBy, True);
  if sdqEmpresa.IsEmpty then
  begin
    Limpiar;
    Result := False;
  end else
  begin
    LoadValues(ShowError);
    Result := True;
 end;
end;

function TfraEmpresa.Cargar(sCUIT : String; ShowError : Boolean = False) :Boolean; // Retorna True si se encontro la empresa
var
  Sql : String;
begin
  {$IFDEF MSACCESS}
  Sql    := GetSql + ' AND cmp_empresas.mp_cuit = ' + SqlValue(sCUIT);
  {$ELSE}
  Sql    := GetSql + ' AND em_cuit = ' + SqlValue(sCUIT);
  {$ENDIF}
  Result := InternalCargar(Sql, ShowError);
end;

function TfraEmpresa.Cargar(AContrato: Integer; ShowError: Boolean): Boolean;
var
  Sql : String;
begin
  {$IFDEF MSACCESS}
  Sql    := GetSql + ' AND cmp_empresas.mp_contrato = ' + SqlInt(AContrato);
  {$ELSE}
  Sql    := GetSql + ' AND co_contrato = ' + SqlInt(AContrato);
  {$ENDIF}
  Result := InternalCargar(Sql, ShowError);
end;

procedure TfraEmpresa.Limpiar;
begin
  Clear;
end;

procedure TfraEmpresa.mskCUITKeyPress(Sender: TObject; var Key: Char);
var
  sSql : String;
begin
  if (Key = #13) then
  begin
    sSql := GetSql +
           GetSqlWhere +
           {$IFDEF MSACCESS}
           ' AND cmp_empresas.mp_cuit = ' + SqlValue(mskCUIT.Text);
           {$ELSE}
           ' AND em_cuit = ' + SqlValue(mskCUIT.Text);
           {$ENDIF}

    if OpenQuery(sdqEmpresa, sSql + GetSqlOrderBy, True) then
      LoadValues(True);
  end;
end;

{$IFDEF NOUSAR}
procedure TfraEmpresa.SetColors(AColor: TColor);
begin
   mskCUIT.Font.Color    := AColor;
   cmbRSocial.Font.Color := AColor;
   edContrato.Font.Color := AColor;
end;
{$ENDIF}

procedure TfraEmpresa.cmbRSocialCloseUp(Sender: TObject);
begin
  LoadValues(Assigned(Sender)); { Para compatibilidad con vers. anteriores}
end;

procedure TfraEmpresa.cmbRSocialDropDown(Sender: TObject);
var sSql   : String;
    Largo : Integer;
begin
   Largo := Length(Trim(cmbRSocial.Text));
   If (Largo >= FMinLength) then
   begin
     sSql := GetSql +
             GetSqlWhere +
            {$IFDEF MSACCESS}
            IIF(Largo > 0, ' AND cmp_empresas.mp_nombre LIKE ''' + Trim(cmbRSocial.Text) + SQL_WILLCARD + '''', '');
            {$ELSE}
            IIF(Largo > 0, ' AND em_nombre LIKE ''' + Trim(cmbRSocial.Text) + SQL_WILLCARD + '''', '');
            {$ENDIF}
     OpenQuery(sdqEmpresa, sSql + GetSqlOrderBy, True);
   end else
     InfoHint(cmbRSocial, 'Debe ingresar como mínimo ' + LowerCase(NumLetras(FMinLength)) + ' caracteres.', True);
end;

procedure TfraEmpresa.edContratoKeyPress(Sender: TObject; var Key: Char);
var
  Sql : String;
begin
   if (Key = #13) then
   begin
     Sql := GetSql +
            GetSqlWhere +
            {$IFDEF MSACCESS}
            ' AND cmp_empresas.mp_contrato = ''' + edContrato.Text + '''';
            {$ELSE}
            ' AND co_contrato = ''' + edContrato.Text + '''';
            {$ENDIF}
     if not (Sql = sdqEmpresa.SQL.Text) then
     begin
        OpenQuery(sdqEmpresa, Sql + GetSqlOrderBy);
        LoadValues(True);
     end;
   end;
end;

procedure TfraEmpresa.cmbRSocialGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja then AFont.Color := clRed;
end;

procedure TfraEmpresa.FrameExit(Sender: TObject);
begin
  if (mskCUIT.Text = '') and (edContrato.Text = '') then
    cmbRSocial.Text := ''
  else begin
    if (mskCUIT.Text <> '') and ((not sdqEmpresa.Active) or (mskCUIT.Text <> sdqEmpresa.FieldByName('MP_CUIT').AsString)) then
      Cargar(mskCUIT.Text)
    else if (edContrato.Text <> '') and ((not sdqEmpresa.Active) or (edContrato.Text <> sdqEmpresa.FieldByName('MP_CONTRATO').AsString)) then
      Cargar(edContrato.Value)
    else begin
      mskCUIT.Text    := sdqEmpresa.FieldByName('MP_CUIT').AsString;
      cmbRSocial.Text := sdqEmpresa.FieldByName('MP_NOMBRE').AsString;
      edContrato.Text := sdqEmpresa.FieldByName('MP_CONTRATO').AsString;
    end;
  end;
end;

function TfraEmpresa.GetValue: TCuit;
begin
  FrameExit(Nil);
  Result := mskCUIT.Text;
end;

procedure TfraEmpresa.SetValue(const Value: TCuit);
begin
   Cargar(Value, False);
end;

procedure TfraEmpresa.Clear;
begin
  mskCUIT.Text    := '';
  cmbRSocial.Text := '';
  edContrato.Text := '';
  Self.Font.Color := clBlack;
end;

function TfraEmpresa.GetSqlWhere: string;
begin
   if not FShowBajas then
     Result := ' AND afiliacion.check_cobertura(em_cuit) = 1 '
   else
     Result := '';

   if Tercerizadoras then
     Result := Result + ' AND EXISTS (SELECT 1 ' +
                                      ' FROM amed.met_empresa_terce, amed.mut_usuario_tercerizadora ' +
                                     ' WHERE et_idempresa = em_id ' +
                                       ' AND ut_idtercerizadora = et_idtercerizadora ' +
                                       ' AND ut_usuario = ' + SQLValue(Sesion.UserID) + ') ';
end;

function TfraEmpresa.GetIsEmpty: boolean;
begin
  Result := Value = ''
end;

function TfraEmpresa.GetSqlOrderBy: string;
begin
           // order by estado, nombre
  Result := ' ORDER BY 5, 2 '; //el estado para que devuelva primero el 1 (activo)
end;

function TfraEmpresa.IsBaja: Boolean;
begin
  Result := sdqEmpresa.FieldByName('ESTADO').AsInteger <> 1;
end;

procedure TfraEmpresa.LoadValues(DoChanges: boolean);
var
  sMsg : String;
begin
  mskCUIT.Text    := sdqEmpresa.FieldByName('MP_CUIT').AsString;
  cmbRSocial.Text := sdqEmpresa.FieldByName('MP_NOMBRE').AsString;
  edContrato.Text := sdqEmpresa.FieldByName('MP_CONTRATO').AsString;

  case sdqEmpresa.FieldByName('ESTADO').AsInteger of
    2: sMsg := 'Estado de la Empresa: INACTIVA';
    3: sMsg := 'Estado de la Empresa: RESCINDIDA';
    4: sMsg := 'Estado de la Empresa: BAJA';
  end;

  if sMsg = '' then
    Font.Color := clBlack
  else begin
    Font.Color := clRed;
    if DoChanges and FShowMessages then
      if FBalloonMessages then
        InvalidMsg(cmbRSocial, sMsg, 'Atención')
      else
        MsgBox(sMsg, MB_ICONEXCLAMATION, 'Atención');
  end;

  if DoChanges then
    DoLostFocus;

  Change;
end;

function TfraEmpresa.GetContrato: integer;
begin
  Result := edContrato.Value;
end;

procedure TfraEmpresa.SetContrato(const Value: integer);
var Sql : String;
begin
  edContrato.Value := Value;

  Sql := GetSql +
         GetSqlWhere +
         {$IFDEF MSACCESS}
         ' AND cmp_empresas.mp_contrato = ''' + edContrato.Text + '''';
         {$ELSE}
         ' AND co_contrato = ''' + edContrato.Text + '''';
         {$ENDIF}
  if not (Sql = sdqEmpresa.SQL.Text) then
  begin
     OpenQuery(sdqEmpresa, Sql + GetSqlOrderBy);
     LoadValues(True);
  end;
end;

procedure TfraEmpresa.HotKeyMethod(Sender: TObject);
begin
{$IFNDEF SERVICE}
  Abrir(TfrmVisualizadorDigitalizacion, frmVisualizadorDigitalizacion, tmvMDIChild, nil);
  if not IsEmpty then
    frmVisualizadorDigitalizacion.LoadContrato(Contrato, 1);
{$ENDIF}    
end;

procedure TfraEmpresa.TimerConfidencialTimer(Sender: TObject);
begin
  inherited;
  if FConfidencialidad then
    FormPadre.Caption := GetTituloPantallaConfidencial(FormPadre.Caption, False);
end;

procedure TfraEmpresa.mskCUITChange(Sender: TObject);
begin
  inherited;
  if FConfidencialidad then
    HabilitarTituloConfidencial(FormPadre, TimerConfidencial, mskCUIT.Text);
end;

function TfraEmpresa.GetFormPadre: TForm;
var
  Aux: TWinControl;
begin
  Aux := Self.Parent;

  while not Aux.InheritsFrom(TForm) do
    Aux := Aux.Parent;

  Result := TForm(Aux);
end;

function TfraEmpresa.GetNombreEmpresa: string;
begin
  FrameExit( Nil ); // Valida que todo este completo
  if sdqDatos.Active Then
    Result := sdqEmpresa.FieldByName('MP_NOMBRE').AsString
  else
    Result := '';
end;

function TfraEmpresa.GetCUIT: TCuit;
begin
  FrameExit( Nil ); // Valida que todo este completo
  if sdqDatos.Active Then
    Result := sdqEmpresa.FieldByName('MP_CUIT').AsString
  else
    Result := '';
end;

procedure TfraEmpresa.SetCUIT(const Value: TCuit);
begin
  Cargar(Value);
end;

end.
