unit unTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls,
  AdvToolBar, AdvToolBarStylers, AdvPanel, AdvGlowButton;

type
  TfrmTexto = class(TForm)
    AdvToolBarPager: TAdvToolBarPager;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvPage: TAdvPage;
    edMemo: TRichEdit;
    pnlBotones: TAdvPanel;
    btnAceptar: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AcomodarRichEdit;
  end;

  function  RE_GetLastVisibleLine(RichEdit: TRichEdit): Integer;
  function MostrarTexto(ACaption: string; var ATexto: string; AEditable: Boolean = False): Boolean;

implementation

uses
  StrFuncs, VCLExtra, CustomDlgs, General;

{$R *.DFM}

function RE_GetLastVisibleLine(RichEdit: TRichEdit): Integer;
const
  EM_EXLINEFROMCHAR = WM_USER + 54;
var
  r: TRect;
  i: Integer;
begin
  {
   The EM_GETRECT message retrieves the formatting rectangle
   of an edit control.
  }
  RichEdit.Perform(EM_GETRECT, 0, Longint(@r));
  r.Left := r.Left + 1;
  r.Top  := r.Bottom - 2;
  {
    The EM_CHARFROMPOS message retrieves information about the character
    closest to a specified point in the client area of an edit control
  }
  i := RichEdit.Perform(EM_CHARFROMPOS, 0, Integer(@r.topleft));
  {
    The EM_EXLINEFROMCHAR message determines which
    line contains the specified character in a rich edit control
  }
  Result := RichEdit.Perform(EM_EXLINEFROMCHAR, 0, i);
end;

function MostrarTexto(ACaption: string; var ATexto: string; AEditable: Boolean): Boolean;
var
  frmTexto: TfrmTexto;
begin
  frmTexto := TfrmTexto.Create(Application);
  with frmTexto do
  begin
    Caption := ACaption;
    AdvToolBarPager.Caption.Caption := ACaption;
    edMemo.Lines.Text := ATexto;
    VCLExtra.LockControls([edmemo], not AEditable);
    AcomodarRichEdit;
    btnAceptar.Visible := AEditable;
    btnCancelar.Caption := iif(AEditable, '&Cancelar', '&Cerrar');
    if ShowModal = mrOk then
    begin
      ATexto := edMemo.Lines.Text;
      Result := True;
    end
    else
      Result := False;
  end;
end;

procedure TfrmTexto.btnAceptarClick(Sender: TObject);
begin
  Verificar(IsemptyString(edMemo.Lines.Text), edMemo, 'Debe completar el texto.');
  ModalResult := mrOk;
end;

procedure TfrmTexto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTexto.AcomodarRichEdit;
var
  Bajando: boolean;
  i: Integer;
begin
  edMemo.Update;
  Bajando := False;

  while (edMemo.Lines.Count > 0) and (edMemo.Lines.Strings[edMemo.Lines.Count - 1] = '') do
    edMemo.Lines.Delete(edMemo.Lines.Count - 1);

  edMemo.Update;

  while ( (AdvToolBarPager.Height < (Screen.Height div 2))
  and     (RE_GetLastVisibleLine(edMemo) < edMemo.Lines.Count - 1) ) do
  begin
    AdvToolBarPager.Height := AdvToolBarPager.Height + 2;
    Height := Height + 2;

    if Bajando then
    begin
      Top := Top - 2;
      Bajando := False;
    end
    else
      Bajando := True;

    edMemo.Update;
    if AdvToolBarPager.Height >= (Screen.Height div 2) then
    begin
      edMemo.ScrollBars := ssVertical;
      edMemo.Enabled := True;
      Break;
    end
  end;

  for i := 0 to 10 do
  begin
    AdvToolBarPager.Height := AdvToolBarPager.Height + 2;
    Height := Height + 2;
  end;

  edMemo.Update;
  edMemo.Enabled := True;
end;

procedure TfrmTexto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TfrmTexto.FormShow(Sender: TObject);
begin
  if not edMemo.ReadOnly then
    edMemo.SetFocus;
end;

end.
