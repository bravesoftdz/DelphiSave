unit unFraOPV_PROVEEDOR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtDbFrame, PatternEdit, IntEdit, ToolEdit, ArtComboBox, StdCtrls,
  Mask, Db, SDEngine, unArt, Cuit;

type
  TfraOPV_PROVEEDOR = class(TArtDbFrame)
    mskCUIT: TMaskEdit;
    lbRSocial: TLabel;
    cmbRSocial: TArtComboBox;
    lbNumero: TLabel;
    edNumero: TIntEdit;
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure mskCUITNumeroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRSocialCloseUp(Sender: TObject);
    procedure cmbRSocialDropDown(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FMinLength: Integer;
    FFieldCUIT: String;
    FFieldNumero: String;
    FFieldId: String;
    FFieldBaja: String;
    FFieldNombre: String;
  protected
    function GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    function GetSql: String; override;
    function GetSqlOrderBy: String; override;
    function GetSqlWhere  : String; override;

    procedure Internal_SetCUIT(Value: TCuit);
    procedure Internal_SetNumero(Value: Integer);

    function ClearOnExit : boolean; virtual;
    function CancelExitLoad : boolean; virtual; {Se usa antes del exists, para si se hereda este frame y se agregan controles, chequee los datos }

    procedure LoadValues(DoChanges : boolean = False); override;
  public
    function IsBaja : Boolean; override;
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
  published
    property MinLength  : Integer      read FMinLength    write FMinLength     default 2;
    property Value;

    property FieldId       : string       read FFieldId       write FFieldId;
    property FieldCUIT     : string       read FFieldCUIT     write FFieldCUIT;
    property FieldNumero   : string       read FFieldNumero   write FFieldNumero;
    property FieldNombre   : string       read FFieldNombre   write FFieldNombre;
    property FieldBaja     : string       read FFieldBaja     write FFieldBaja;
  end;

implementation

uses
  unDmPrincipal, AnsiSql, SqlFuncs, Numeros, CustomDlgs;

const
  { Nombres por default de los campos }
  EMP_FIELD_ID      : string = 'PV_ID';
  EMP_FIELD_NUMERO  : string = 'PV_NUMERO';
  EMP_FIELD_CUIT    : string = 'PV_CUIT';
  EMP_FIELD_NOMBRE  : string = 'PV_NOMBRE';
  EMP_FIELD_BAJA    : string = 'NULL';

  { Alias de los campos }
  EMP_ALIAS_ID      : string = 'ID';
  EMP_ALIAS_CUIT    : string = 'CUIT';
  EMP_ALIAS_NUMERO  : string = 'NUMERO';
  EMP_ALIAS_NOMBRE  : string = 'NOMBRE';
  EMP_ALIAS_BAJA    : string = 'FECHA_BAJA';


{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.mskCUITKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edNumero.ReadOnly) Then
    Internal_SetCUIT(mskCUIT.Text);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.mskCUITNumeroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbRSocial.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edNumero.ReadOnly) then
    Internal_SetNumero(edNumero.Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.cmbRSocialCloseUp(Sender: TObject);
begin
  if cmbRSocial.Text = '' Then
    Clear
  else
    LoadValues( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.cmbRSocialDropDown(Sender: TObject);
var
  sSql : String;
begin
  if (Length(Trim(cmbRSocial.Text)) < FMinLength) Then
  begin
    Clear;
    MsgBoxFmt( SMinLength, [LowerCase(NumLetras(FMinLength))], MB_ICONEXCLAMATION );
    cmbRSocial.SetFocus;
  end else begin
    sSql := GetSql +
            ' AND ' + FieldNombre + ' LIKE ' + SQL_QUOTE + cmbRSocial.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
            GetSqlWhere +
            GetSqlOrderBy;

    OpenQuery(sdqDatos, sSql, True);

    if mskCUIT.Text <> '' Then
      sdqDatos.Locate( EMP_ALIAS_CUIT, mskCUIT.Text, [])

    else if edNumero.Value > 0 Then
      sdqDatos.Locate( EMP_ALIAS_NUMERO, edNumero.Value, []);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.CancelExitLoad: boolean;
begin
  Result := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.ClearOnExit: boolean;
begin
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.GetSql: String;
begin
  if FSql <> '' Then
    Result := inherited GetSql
  else
    Result := 'SELECT ' + SqlAlias(FieldId,       EMP_ALIAS_ID)       + ', ' +
                          SqlAlias(FieldCuit,     EMP_ALIAS_CUIT)     + ', ' +
                          SqlAlias(FieldNombre,   EMP_ALIAS_NOMBRE)   + ', ' +
                          SqlAlias(FieldNumero, EMP_ALIAS_NUMERO) + ', ' +
                          SqlAlias(FieldBaja,     EMP_ALIAS_BAJA)     + ' '  +
                'FROM V_OPV_PROVEEDOR ' +
               'WHERE 1=1 ';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.GetSqlOrderBy: String;
begin
   Result := ' ORDER BY ' + SqlSimpleAlias(EMP_ALIAS_NOMBRE) + ', ' + SqlSimpleAlias(EMP_ALIAS_NUMERO);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.GetSqlWhere: String;
begin
  if FShowBajas Then
    Result := ''
  else
    Result := ' AND ' + FFieldBaja + ' IS NULL ';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.GetValue: TTableID;
begin
  FrameExit( Nil ); // Valida que todo este completo
  if sdqDatos.Active Then
    Result := sdqDatos.FieldByName( EMP_ALIAS_ID ).AsInteger
  else
    Result := ART_EMPTY_ID;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.LoadValues(DoChanges: boolean);
begin
  mskCuit.Text    := sdqDatos.FieldByName( EMP_ALIAS_CUIT ).AsString ;
  cmbRSocial.Text := sdqDatos.FieldByName( EMP_ALIAS_NOMBRE ).AsString ;
  edNumero.Text   := sdqDatos.FieldByName( EMP_ALIAS_NUMERO ).AsString ;

  if IsBaja Then
    Font.Color := clRed
  else
    Font.Color := clWindowText;

  if DoChanges Then begin
    if Assigned(FOnChange) Then
      FOnChange( Self );

    if (mskCuit.Text <> '') Then {Se se cragaron los datos}
      DoLostFocus;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.SetValue(const Value: TTableID);
var
  sSql: string;
begin
  sSql := GetSql +
          GetSqlWhere +
          ' AND ' + FFieldID + ' = ' + SqlInt( Value );

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.Clear;
begin
  mskCuit.Clear;
  cmbRSocial.Clear;
  edNumero.Clear;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraOPV_PROVEEDOR.Create(AOwner: TComponent);
begin
  inherited;
  FMinLength   := 2;

  FFieldID     := EMP_FIELD_ID;
  FFieldCUIT   := EMP_FIELD_CUIT;
  FFieldNumero := EMP_FIELD_NUMERO;
  FFieldNombre := EMP_FIELD_NOMBRE;
  FFieldBaja   := EMP_FIELD_BAJA;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraOPV_PROVEEDOR.IsBaja: Boolean;
begin
  Result := not sdqDatos.FieldByName( EMP_ALIAS_BAJA ).IsNull;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.FrameExit(Sender: TObject);
var
  bQueryActive,
  bAutoExit : Boolean;
begin
  bAutoExit := AutoExit;
  AutoExit  := False;
  if not ReadOnly Then
    try
      if (mskCUIT.Text = '') and (edNumero.Text = '') and ClearOnExit Then begin
        bQueryActive := sdqDatos.Active;
        Clear;
        if bQueryActive and Assigned(FOnChange) Then
          FOnChange( Self );
      end else begin
        if (mskCUIT.Text <> '') and ((not sdqDatos.Active) or (mskCUIT.Text <> sdqDatos.FieldByName( EMP_ALIAS_CUIT ).AsString)) Then
          Internal_SetCuit(mskCUIT.Text)
        else if (edNumero.Text <> '') and ((not sdqDatos.Active) or (edNumero.Text <> sdqDatos.FieldByName( EMP_ALIAS_NUMERO ).AsString)) Then
          Internal_SetNumero(edNumero.Value)
        else if not CancelExitLoad Then
          LoadValues( False );
      end;
    finally
      AutoExit := bAutoExit;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.Internal_SetCUIT(Value: TCuit);
var
  sSql: String;
begin
  sSql := GetSql +
         GetSqlWhere +
         ' AND ' + FFieldCUIT + ' = ' + SqlValue(Value);

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraOPV_PROVEEDOR.Internal_SetNumero(Value: Integer);
var
  sSql : String;
begin
  sSql := GetSql +
          GetSqlWhere +
          ' AND ' + FFieldNumero + ' = ' + SqlInt(Value);

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
