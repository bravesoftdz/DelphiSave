unit unArtFrame;

{********************************************************}
{                                                        }
{    ArtFrame Unit                                       }
{    Es la clase base en la cual se heredarán todos los  }
{    frames de los sistemas ART. Contiene un juego       }
{    reducido de propiedades, que son compatibles con    }
{    cualquier tipo de frame                             }
{                                                        }
{    Autor: Federico Firenze                             }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Graphics, Controls;

type
  TArtFrame = class(TFrame)
  private
    FAutoExit: Boolean;
    FDisableControls: Boolean;
    FForeColor: TColor;
    FLocked: Boolean;
    FOnCreate: TNotifyEvent;
    FReadOnly: Boolean;
    FTabStop: Boolean;
    FChanging: Boolean;

    function GetFormPadre: TForm;

    procedure SetDisableControls(const Value: Boolean);
  protected
    FOnChange: TNotifyEvent;

    function GetModified: Boolean; virtual;

    procedure Change; virtual;
    procedure FocusLast; virtual;
    procedure SetControlForeColor(AControl: TControl; Value: TColor); virtual;
    procedure SetControlReadOnly(AControl: TControl; Value: Boolean); virtual;
    procedure SetForeColor(const Value: TColor); virtual;
    procedure SetLocked(const Value: Boolean); virtual;
    procedure SetModified(const Value: Boolean); virtual;
    procedure SetReadOnly(const Value: Boolean); virtual;
    procedure SetTabStop(const Value: Boolean); virtual;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; virtual; abstract;
    procedure DoLostFocus;
  published
    property AutoExit       : Boolean      read FAutoExit        write FAutoExit          default True;
    property Changing       : Boolean      read FChanging;
    property DisableControls: Boolean      read FDisableControls write SetDisableControls default False; // Cuando se pone ReadoOnly True deshabilita los controles que no soportan readonly
    property ForeColor      : TColor       read FForeColor       write SetForeColor       default clWindow;
    property FormPadre      : TForm        read GetFormPadre;
    property Locked         : Boolean      read FLocked          write SetLocked;
    property Modified       : Boolean      read GetModified      write SetModified;
    property ReadOnly       : Boolean      read FReadOnly        write SetReadOnly        default False;
    property TabStop        : Boolean      read FTabStop         write SetTabStop         default True;
    property OnChange       : TNotifyEvent read FOnChange        write FOnChange;
    property OnCreate       : TNotifyEvent read FOnCreate        write FOnCreate;
  end;


implementation

{$R *.DFM}

uses
  unRtti, StdCtrls, ComCtrls, General, VCLExtra;

const
  PROP_MODIFIED = 'Modified';
  PROP_READONLY = 'ReadOnly';
  PROP_TABSTOP  = 'TabStop';
  PROP_ENABLED  = 'Enabled';
  PROP_VISIBLE  = 'Visible';

type
  TColorControl = class(TWinControl) // Se utiliza para publicar la propiedad Color para todos los TWincontrol´s
  public
    property Color;
  end;

{----------------------------------------------------------------------------------------------------------------------}
{ TArtFrame }
{----------------------------------------------------------------------------------------------------------------------}
constructor TArtFrame.Create(AOwner: TComponent);
begin
  inherited;
  FForeColor       := clWindow;
  FDisableControls := False;
  FChanging        := False;
  FAutoExit        := True;
  FTabStop         := True;

  if Assigned(FOnCreate) then
    FOnCreate(Self);
end;

procedure TArtFrame.SetControlForeColor(AControl: TControl; Value: TColor);
var
  i: Integer;
begin
  if IsIn(AControl, [TCustomEdit, TCustomComboBox, TCustomListBox, TCustomTreeView, TCustomListView, TDateTimePicker, TCustomHotKey]) then
    TColorControl(AControl).Color := Value;

  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      SetControlForeColor(TWinControl(AControl).Controls[i], Value);
end;

procedure TArtFrame.SetForeColor(const Value: TColor);
begin
  if (FForeColor <> Value) then
  begin
    FForeColor := Value;
    SetControlForeColor(Self, Value);
  end;
end;

procedure TArtFrame.SetReadOnly(const Value: Boolean);
var
  i: Integer;
begin
  FReadOnly := Value; // No pregunta por si desactivaron algun comp. a mano
  for i := 0 to ComponentCount - 1 do
    SetControlReadOnly(TControl(Components[i]), Value);
end;

procedure TArtFrame.SetControlReadOnly(AControl: TControl; Value: Boolean);
begin
  if ExistsProperty(AControl, PROP_READONLY) then
    SetPropByName(AControl, PROP_READONLY, Value)
  else if FDisableControls then
    if ExistsProperty(AControl, PROP_ENABLED) and ExistsProperty(AControl, PROP_VISIBLE) then
      AControl.Enabled := not Value;
end;

procedure TArtFrame.SetDisableControls(const Value: Boolean);
begin
  if FDisableControls <> Value then
  begin
    FDisableControls := Value;
    if not (csLoading in ComponentState) then
      SetReadOnly(FReadOnly); // Para que retorne todo a la normalidad
  end;
end;

procedure TArtFrame.FocusLast;
var
  Control: TWinControl;
  Form: TCustomForm;
begin
  Form := GetParentForm(Self);
  if Form <> nil then
  begin
    Control := nil;
    repeat
      Control := FindNextControl(Control, False, True, False);
    until (Control = nil) or Control.Visible;

    if Control <> nil then
       Form.ActiveControl := Control;
  end;
end;

procedure TArtFrame.DoLostFocus;
var
  bBool: Boolean;
begin
  if FAutoExit then
  begin
    bBool      := AutoScroll;
    AutoScroll := False;
    try
      FocusLast;
      PostMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    finally
      AutoScroll := bBool;
    end;
  end;
end;

function TArtFrame.GetModified: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TWinControl) and (SendMessage(TWinControl(Components[i]).Handle, EM_GETMODIFY, 0, 0) <> 0) then
    begin
      Result := True;
      Break;
    end;
end;

procedure TArtFrame.SetModified(const Value: Boolean);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TWinControl then
      SendMessage(TWinControl(Components[i]).Handle , EM_SETMODIFY, Byte(Value), 0);
end;

procedure TArtFrame.SetLocked(const Value: Boolean);
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

procedure TArtFrame.SetTabStop(const Value: Boolean);
var
  i: Integer;
begin
  if FTabStop <> Value then
  begin
    FTabStop := Value;
    for i := 0 to ComponentCount - 1 do
      if ExistsProperty(TControl(Components[i]), PROP_TABSTOP) then
        SetPropByName(TControl(Components[i]), PROP_TABSTOP, Value);
  end;
end;

procedure TArtFrame.Change;
begin
  if not FChanging then
  begin
    FChanging := True;
    try
      if Assigned(FOnChange) then
        FOnChange(Self);
    finally
      FChanging := False;
    end;
  end;
end;

function TArtFrame.GetFormPadre: TForm;
var
  Aux: TComponent;
begin
  Aux := Self.Owner;

  while not Aux.InheritsFrom(TForm) do
    Aux := Aux.Owner;

  Result := TForm(Aux);
end;

end.
