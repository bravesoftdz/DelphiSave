unit unfraSectores;

{
ALTER TABLE ART.USC_SECTORES ADD
(
   SC_FECHAALTA               DATE,
   SC_USUALTA                 VARCHAR2(20),
   SC_FECHABAJA               DATE,
   SC_USUBAJA                 VARCHAR2(20)
)
}
interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Mask, ArtComboBox, StdCtrls,
  PatternEdit, unART, RxToolEdit;

type
  TfraSectores = class(TFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosSC_CODIGO: TStringField;
    sdqDatosSC_DESCRIPCION: TStringField;
    sdqDatosSC_DELEGACION: TStringField;
    sdqDatosSC_FECHABAJA: TDateTimeField;
    sdqDatosSC_ID: TFloatField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
    																			Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FShowBajas: Boolean;
    FOnChange: TNotifyEvent;
    FDelegacion: String;
    FLocked: Boolean;
    FReadOnly: Boolean;
    FForeColor: TColor;
    FDisableControls: Boolean;
    function  GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    procedure SetDelegacion(const Value: String);
    function  SqlWhere : String;
    function  GetCodigo: String;
    function  GetValue: TTableID;
    procedure SetLocked(const Value: Boolean);
    procedure SetReadOnly(const Value: Boolean);
    procedure SetForeColor(const Value: TColor);
    procedure SetControlForeColor(AControl: TControl; Value: TColor);
    procedure SetControlReadOnly(AControl: TControl; Value: Boolean);
    procedure SetDisableControls(const Value: Boolean);
    function GetDescripcion: String;
  public
    constructor Create(AOwner: TComponent); override;
    
    function IsEmpty: Boolean;
    function IsSelected: Boolean;

    procedure Cargar(ACodigo: String; OnlyValids: Boolean = False);
    procedure Clear;
    procedure DoLostFocus;
    procedure Limpiar;
    procedure SetColors(AColor: TColor);
  published
    property Codigo          : String       read GetCodigo;
    property Delegacion      : String       read FDelegacion  write SetDelegacion;
    property Descripcion     : String       read GetDescripcion;
    property DisableControls : Boolean      read FDisableControls  write SetDisableControls  default False; // Cuando se pone ReadoOnly True deshabilita los controles que no soportan readonly
    property ForeColor       : TColor       read FForeColor   write SetForeColor default clWindow;
    property Locked          : Boolean      read FLocked      write SetLocked;
    property Modified        : Boolean      read GetModified  write SetModified;
    property OnChange        : TNotifyEvent read FOnChange    write FOnChange;
    property ReadOnly        : Boolean      read FReadOnly    write SetReadOnly default False;
    property ShowBajas       : Boolean      read FShowBajas   write FShowBajas  default False ;
    property Value           : TTableID     read GetValue;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unRtti, ComCtrls, General, VCLExtra;

const
  BaseSql = 'SELECT SC_ID, SC_CODIGO, SC_DESCRIPCION, SC_DELEGACION, SC_FECHABAJA FROM USC_SECTORES ';
  OrderBy = ' ORDER BY SC_DESCRIPCION';

  PROP_MODIFIED = 'Modified';
  PROP_READONLY = 'ReadOnly';
  PROP_TABSTOP  = 'TabStop';

type
  TColorControl = class(TWinControl) // Se utiliza para publicar la propiedad Color para todos los TWincontrol´s
  public
    property Color;
  end;

{------------------------------------------------------------------------------}
{ TfraSectores }
{------------------------------------------------------------------------------}
procedure TfraSectores.Cargar(ACodigo: String; OnlyValids: Boolean = False);
var
	Sql: String;
begin
	Sql := BaseSql + ' WHERE SC_CODIGO = ''' + ACodigo + '''' + IIF(OnlyValids, SqlWhere, '');

  if OpenQuery(sdqDatos, Sql, True) then
  	cmbDescripcionCloseUp(nil);
end;

procedure TfraSectores.DoLostFocus;
begin
	if edCodigo.Focused or cmbDescripcion.Focused then
  begin // Self.Focused
  	cmbDescripcion.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfraSectores.GetModified: Boolean;
begin
	Result := edCodigo.Modified or cmbDescripcion.Modified;
end;

procedure TfraSectores.Limpiar;
begin
	edCodigo.Text       := '';
  cmbDescripcion.Text := '';

	sdqDatos.Close;
end;

procedure TfraSectores.SetColors(AColor: TColor);
begin
	edCodigo.Font.Color       := AColor;
  cmbDescripcion.Font.Color := AColor;
end;

procedure TfraSectores.SetModified(const Value: Boolean);
begin
	edCodigo.Modified       := Value;
  cmbDescripcion.Modified := Value;
end;

procedure TfraSectores.cmbDescripcionCloseUp(Sender: TObject);
begin
	edCodigo.Text       := sdqDatosSC_CODIGO.AsString;
  cmbDescripcion.Text := sdqDatosSC_DESCRIPCION.AsString;
  if sdqDatosSC_FECHABAJA.IsNull then
  	SetColors(clWindowText)
  else
  	SetColors(clRed);

  if Assigned(Sender) then
  begin
  	if Assigned(FOnChange) then
    	OnChange(Self);

    if (edCodigo.Text <> '') then
    	DoLostFocus;
  end;
end;

procedure TfraSectores.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
	Sql: String;
begin
	if Key = #13 then
  begin
  	Sql := BaseSql + ' WHERE SC_CODIGO = ''' + edCodigo.Text + '''' + SqlWhere;
    if OpenQuery(sdqDatos, Sql, True) then
    	cmbDescripcionCloseUp(Sender);
  end;
end;

procedure TfraSectores.cmbDescripcionDropDown(Sender: TObject);
var
	Sql: String;
begin
	if (sdqDatos.Active and (sdqDatosSC_DESCRIPCION.AsString = cmbDescripcion.Text)) then
  	Sql := BaseSql + 'WHERE 1=1 ' + SqlWhere + OrderBy
  else
  	Sql := BaseSql + ' WHERE UPPER(SC_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' + SqlWhere + OrderBy;

  OpenQuery(sdqDatos, Sql, True);
end;

procedure TfraSectores.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
																									 Highlight: Boolean);
begin
	if not sdqDatosSC_FECHABAJA.IsNull then
  	AFont.Color := clRed;
end;

procedure TfraSectores.FrameExit(Sender: TObject);
begin
	if (edCodigo.Text <> '') then
  begin
  	if (edCodigo.Text <> sdqDatosSC_CODIGO.AsString) then
    	Cargar(edCodigo.Text, True)
    else
    	cmbDescripcion.Text := sdqDatosSC_DESCRIPCION.AsString;
  end
  else
  	cmbDescripcion.Text := '';
end;

procedure TfraSectores.SetDelegacion(const Value: String);
begin
	if FDelegacion <> Value then
  begin
  	FDelegacion := Value;
    if sdqDatos.Active and (sdqDatosSC_DELEGACION.AsString <> Value) then
    	Limpiar;
  end;
end;

function TfraSectores.SqlWhere: String;
begin
	Result := IIF(FDelegacion = '', '', ' AND SC_DELEGACION = ''' + FDelegacion + '''' ) +
  					IIF(FShowBajas      , '', ' AND SC_FECHABAJA IS NULL');
end;

constructor TfraSectores.Create(AOwner: TComponent);
begin
  inherited;
  FShowBajas := False;
end;

procedure TfraSectores.Clear;
begin
  Limpiar;
end;

function TfraSectores.GetCodigo: String;
begin
	if IsSelected then
    Result := edCodigo.Text
  else
    Result := '';
end;

function TfraSectores.IsSelected: Boolean;
begin
  Result := not IsEmpty;
end;

function TfraSectores.IsEmpty: Boolean;
begin
  FrameExit(nil);
  Result := not(sdqDatos.Active and not sdqDatos.IsEmpty);
end;

function TfraSectores.GetValue: TTableID;
begin
  if IsSelected then
    Result := sdqDatos.FieldByName('SC_ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraSectores.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not edCodigo.ReadOnly) and (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DoDropDown ;
end;

procedure TfraSectores.SetLocked(const Value: Boolean);
begin
  if FLocked <> Value then
  begin
    FLocked := Value;

    ReadOnly := FLocked;
    TabStop  := not FLocked;

    if FLocked then
      ForeColor := LOCK_COLOR
    else
      ForeColor := clWindow;
  end;
end;

procedure TfraSectores.SetReadOnly(const Value: Boolean);
var
	i: Integer;
begin
  FReadOnly := Value; // No pregunta por si desactivaron algun comp. a mano
  for i := 0 to ComponentCount - 1 do
  	SetControlReadOnly(TControl(Components[i]), Value);
end;

procedure TfraSectores.SetForeColor(const Value: TColor);
begin
  if (FForeColor <> Value) then
  begin
  	FForeColor := Value;
    SetControlForeColor(Self, Value);
  end;
end;

procedure TfraSectores.SetControlForeColor(AControl: TControl; Value: TColor);
var
  i: Integer;
begin
  if IsIn(AControl, [TCustomEdit, TCustomComboBox, TCustomListBox, TCustomTreeView, TCustomListView, TDateTimePicker,
  									 TCustomHotKey]) then
  	TColorControl(AControl).Color := Value;

  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      SetControlForeColor(TWinControl(AControl).Controls[i], Value);
end;

procedure TfraSectores.SetControlReadOnly(AControl: TControl; Value: Boolean);
begin
  if ExistsProperty(AControl, PROP_READONLY) then
    SetPropByName(AControl, PROP_READONLY, Value)
  else if FDisableControls then
    AControl.Enabled := not Value;
end;

procedure TfraSectores.SetDisableControls(const Value: Boolean);
begin
  if FDisableControls <> Value then
  begin
    FDisableControls := Value;
    if not (csLoading in ComponentState) then
      SetReadOnly( FReadOnly ); // Para que retorne todo a la normalidad
  end;
end;

function TfraSectores.GetDescripcion: String;
begin
  if IsSelected then
    Result := cmbDescripcion.Text
  else
    Result := '';
end;

end.
