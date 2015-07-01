unit GeneracionCotizacionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, GenCotiz_TLB, StdVcl, Login, artDbLogin;

type
  TGeneracionCotizacion = class(TActiveForm, IGeneracionCotizacion)
  private
    { Private declarations }
    FEvents: IGeneracionCotizacionEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure PrepararCotizacion(const IdCotizacion, Path: WideString); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, unQRCartaSolicitud, unDmPrincipal;

{$R *.DFM}

{ TGeneracionCotizacion }

procedure TGeneracionCotizacion.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_GeneracionCotizacionPage); }
end;

procedure TGeneracionCotizacion.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IGeneracionCotizacionEvents;
end;

procedure TGeneracionCotizacion.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TGeneracionCotizacion.Get_Active: WordBool;
begin
  Result := Active;
end;

function TGeneracionCotizacion.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TGeneracionCotizacion.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TGeneracionCotizacion.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TGeneracionCotizacion.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TGeneracionCotizacion.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TGeneracionCotizacion.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TGeneracionCotizacion.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TGeneracionCotizacion.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TGeneracionCotizacion.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TGeneracionCotizacion.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TGeneracionCotizacion.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TGeneracionCotizacion.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TGeneracionCotizacion.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TGeneracionCotizacion.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TGeneracionCotizacion.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TGeneracionCotizacion.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TGeneracionCotizacion.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TGeneracionCotizacion._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TGeneracionCotizacion.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TGeneracionCotizacion.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TGeneracionCotizacion.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TGeneracionCotizacion.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TGeneracionCotizacion.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TGeneracionCotizacion.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TGeneracionCotizacion.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TGeneracionCotizacion.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TGeneracionCotizacion.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TGeneracionCotizacion.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TGeneracionCotizacion.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TGeneracionCotizacion.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TGeneracionCotizacion.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TGeneracionCotizacion.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TGeneracionCotizacion.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TGeneracionCotizacion.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TGeneracionCotizacion.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TGeneracionCotizacion.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TGeneracionCotizacion.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TGeneracionCotizacion.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TGeneracionCotizacion.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TGeneracionCotizacion.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TGeneracionCotizacion.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TGeneracionCotizacion.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


procedure TGeneracionCotizacion.PrepararCotizacion(const IdCotizacion, Path: WideString);
begin
  dmPrincipal := TdmPrincipal.Create(nil);
  with TQrCartaSolicitud.Create(Self) do
  try
    Preparar(IdCotizacion, Path);
  finally
    Free;
    dmPrincipal.free;
  end;
end;


initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TGeneracionCotizacion,
    Class_GeneracionCotizacion,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);

end.
