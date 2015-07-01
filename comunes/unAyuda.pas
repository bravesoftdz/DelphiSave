unit unAyuda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls,
  AdvToolBar, AdvToolBarStylers;

type
  TfrmAyuda = class(TForm)
    AdvToolBarPager: TAdvToolBarPager;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvPage: TAdvPage;
    edMemo: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FAyuda: integer;
    procedure AcomodarRichEdit;
  public
    {Los nros de ayuda se estipulan entre el 001 y el 999}
    property Ayuda: integer read FAyuda write FAyuda;
    {Los archivos de ayuda deberán llamarse AyudaXXX.rft}
  end;

  function  RE_GetLastVisibleLine(RichEdit: TRichEdit): Integer;
  procedure MostrarAyuda(sCaption: string; nAyuda: integer); overload;
  procedure MostrarAyuda(sCaption: string; sAyuda: string); overload;
  procedure MostrarAyuda(sCaption: string; sAyuda: string; bAyudaPersonalizada: Boolean); overload;

implementation

uses
  StrFuncs;

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

procedure MostrarAyuda(sCaption: string; sAyuda: string; bAyudaPersonalizada: Boolean); overload;
var
  frmAyuda: TfrmAyuda;
begin
  frmAyuda := TfrmAyuda.Create(Application);

  with frmAyuda do
  begin
    Caption := sCaption;
    AdvToolBarPager.Caption.Caption := sCaption;
    Show;

    edMemo.Lines.Clear;
    edMemo.Update;
    edMemo.Lines.Text := sAyuda;

    AcomodarRichEdit;
  end;
end;

procedure MostrarAyuda(sCaption: string; sAyuda: string); overload;
var
  frmAyuda: TfrmAyuda;
  Archivo: string;
begin
  frmAyuda := TfrmAyuda.Create(Application);

  with frmAyuda do
  begin
    Caption := sCaption;
    AdvToolBarPager.Caption.Caption := sCaption;
    Show;

    Archivo := ExtractFilePath(Application.ExeName) + '\Ayudas\' + sAyuda;

    edMemo.Lines.Clear;
    edMemo.Update;

    if FileExists(Archivo) then
      edMemo.Lines.LoadFromFile(Archivo)
    else
      edMemo.Lines.Add('No se encontró el archivo de ayuda solicitado.');

    AcomodarRichEdit;
  end;
end;

procedure MostrarAyuda(sCaption: string; nAyuda: integer);
var
  frmAyuda: TfrmAyuda;
begin
  frmAyuda := TfrmAyuda.Create(Application);

  with frmAyuda do
  begin
    Caption := sCaption;
    AdvToolBarPager.Caption.Caption := sCaption;
    Show;

    Height := AdvToolBarPager.Height;
    Width  := 350;
    edMemo.Lines.Clear;
    edMemo.Update;
    edMemo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Ayudas\' + LPad(nAyuda, '0', 3) + '.rtf');

    AcomodarRichEdit;
  end;
end;

procedure TfrmAyuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAyuda.AcomodarRichEdit;
var
  Bajando: boolean;
  i: Integer;
begin
  edMemo.Update;
  Bajando := False;

  while edMemo.Lines.Strings[edMemo.Lines.Count - 1] = '' do
    edMemo.Lines.Delete(edMemo.Lines.Count - 1);

  edMemo.Update;

  while ( (AdvToolBarPager.Height < (Screen.Height div 2))
  and     (RE_GetLastVisibleLine(edMemo) < edMemo.Lines.Count - 1) ) do
  begin
    AdvToolBarPager.Height := AdvToolBarPager.Height + 2;
    if Bajando then
    begin
      Top := Top - 2;
      Bajando := False;
    end
    else
      Bajando := True;

    edMemo.Update;
    if AdvToolBarPager.Height = (Screen.Height div 2) then
    begin
      edMemo.ScrollBars := ssVertical;
      edMemo.Enabled := True;
      Break;
    end
  end;

  for i := 0 to 10 do
    AdvToolBarPager.Height := AdvToolBarPager.Height + 2;

  edMemo.Update;
  Hide;
  Show;
  edMemo.Enabled := True;
end;

procedure TfrmAyuda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

end.
