unit unFraToolbarRTF;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, RXSpin, RxCombos, ComCtrls,
  ToolWin, ImgList, RxRichEd, Vcl.Mask;

type
  TfraToolbarRTF = class(TFrame)
    ToolbarImages: TImageList;
    tBarRTF: TToolBar;
    tbNuevo: TToolButton;
    tbAbrir: TToolButton;
    tbGuardar: TToolButton;
    ToolButton5: TToolButton;
    tbCortar: TToolButton;
    tbCopiar: TToolButton;
    tbPegar: TToolButton;
    tbDesHacer: TToolButton;
    ToolButton10: TToolButton;
    cmbFuente: TFontComboBox;
    ToolButton11: TToolButton;
    edTamFuente: TRxSpinEdit;
    ToolButton2: TToolButton;
    tbNegrita: TToolButton;
    tbItalica: TToolButton;
    tbSubrayado: TToolButton;
    ToolButton16: TToolButton;
    tbAlinearIzquierda: TToolButton;
    tbAlinearCentro: TToolButton;
    tbAlinearDerecha: TToolButton;
    tbAlinearJustificar: TToolButton;
    ToolButton20: TToolButton;
    tbNumeros: TToolButton;
    tbPuntos: TToolButton;
    dlgAbrir: TOpenDialog;
    dlgGuardar: TSaveDialog;
    PrintDialog: TPrintDialog;
    tbImprimir: TToolButton;
    ToolButton3: TToolButton;
    procedure tbNuevoClick(Sender: TObject);
    procedure tbAbrirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbCortarClick(Sender: TObject);
    procedure tbCopiarClick(Sender: TObject);
    procedure tbPegarClick(Sender: TObject);
    procedure tbDesHacerClick(Sender: TObject);
    procedure cmbFuenteChange(Sender: TObject);
    procedure edTamFuenteChange(Sender: TObject);
    procedure tbNegritaClick(Sender: TObject);
    procedure tbItalicaClick(Sender: TObject);
    procedure tbSubrayadoClick(Sender: TObject);
    procedure tbAlinearClick(Sender: TObject);
    procedure tbNumerosClick(Sender: TObject);
    procedure tbPuntosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
  private
    FEdit: TRxRichEdit;
    FOldSelectionChange: TNotifyEvent;

    function CurrText: TRxTextAttributes;

    procedure EditSelectionChange(Sender: TObject);
    procedure SetEdit(const Value: TRxRichEdit);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Edit: TRxRichEdit read FEdit write SetEdit;
  end;

implementation

uses
  General, unSesion, Printers;

{$R *.DFM}

procedure TfraToolbarRTF.SetEdit(const Value: TRxRichEdit);
begin
  if FEdit <> Value then
  begin
    if Assigned(FEdit) then
      FEdit.OnSelectionChange := FOldSelectionChange;

    FEdit := Value;
    if Assigned(FEdit) then
    begin
      tBarRTF.Enabled         := True;
      FOldSelectionChange     := FEdit.OnSelectionChange;
      FEdit.OnSelectionChange := EditSelectionChange;
    end
    else
      tBarRTF.Enabled := False;
  end;
end;

function TfraToolbarRTF.CurrText: TRxTextAttributes;
begin
  Result := FEdit.SelAttributes;
end;

procedure TfraToolbarRTF.tbNuevoClick(Sender: TObject);
begin
  FEdit.Lines.Clear;
end;

procedure TfraToolbarRTF.tbAbrirClick(Sender: TObject);
begin
  if dlgAbrir.Execute then
    FEdit.Lines.LoadFromFile(dlgAbrir.FileName);
end;

procedure TfraToolbarRTF.tbGuardarClick(Sender: TObject);
begin
  if dlgGuardar.Execute then
    FEdit.Lines.SaveToFile(dlgGuardar.FileName);
end;

procedure TfraToolbarRTF.tbCortarClick(Sender: TObject);
begin
  FEdit.CutToClipboard;
end;

procedure TfraToolbarRTF.tbCopiarClick(Sender: TObject);
begin
  FEdit.CopyToClipboard;
end;

procedure TfraToolbarRTF.tbPegarClick(Sender: TObject);
begin
  FEdit.PasteFromClipboard;
end;

procedure TfraToolbarRTF.tbDesHacerClick(Sender: TObject);
begin
  if FEdit.HandleAllocated then
    SendMessage(FEdit.Handle, EM_UNDO, 0, 0);
end;

procedure TfraToolbarRTF.cmbFuenteChange(Sender: TObject);
begin
  CurrText.Name := cmbFuente.FontName;
end;

procedure TfraToolbarRTF.edTamFuenteChange(Sender: TObject);
begin
  CurrText.Size := Trunc(edTamFuente.Value);
end;

procedure TfraToolbarRTF.tbNegritaClick(Sender: TObject);
begin
  if tbNegrita.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TfraToolbarRTF.tbItalicaClick(Sender: TObject);
begin
  if tbItalica.Down then
     CurrText.Style := CurrText.Style + [fsItalic]
  else
     CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TfraToolbarRTF.tbSubrayadoClick(Sender: TObject);
begin
  if tbSubrayado.Down then
     CurrText.Style := CurrText.Style + [fsUnderLine]
  else
     CurrText.Style := CurrText.Style - [fsUnderLine];
end;

procedure TfraToolbarRTF.tbAlinearClick(Sender: TObject);
begin
  FEdit.Paragraph.Alignment := TParaAlignment(TControl(Sender).Tag);
end;

procedure TfraToolbarRTF.tbNumerosClick(Sender: TObject);
begin
  FEdit.Paragraph.Numbering := IIF(tbNumeros.Down, nsArabicNumbers, nsNone);
  tbPuntos.Down := False;
end;

procedure TfraToolbarRTF.tbPuntosClick(Sender: TObject);
begin
  FEdit.Paragraph.Numbering := IIF(tbPuntos.Down,nsBullet, nsNone);
  tbNumeros.Down := False;
end;

procedure TfraToolbarRTF.tbImprimirClick(Sender: TObject);
var
  Rc: TRect;
begin
  if PrintDialog.Execute then
  begin
    Rc.Top    := 440;
    Rc.Left   := 140;
    Rc.Bottom := Printer.PageHeight;
    Rc.Right  := Printer.PageWidth - 140;
    FEdit.PageRect := Rc;
    FEdit.Print(Application.Name + ' ' + Sesion.Usuario);
  end;
end;

procedure TfraToolbarRTF.EditSelectionChange(Sender: TObject);
begin
  tbNegrita.Down      := fsBold      in FEdit.SelAttributes.Style;
  tbItalica.Down      := fsItalic    in FEdit.SelAttributes.Style;
  tbSubrayado.Down    := fsUnderline in FEdit.SelAttributes.Style;
  edTamFuente.Value   := FEdit.SelAttributes.Size;
  cmbFuente.FontName  := FEdit.SelAttributes.Name;
  edTamFuente.Value   := FEdit.SelAttributes.Size;

  tbPuntos.Down       := (FEdit.Paragraph.Numbering = nsBullet);
  tbNumeros.Down      := (FEdit.Paragraph.Numbering = nsArabicNumbers);

  case FEdit.Paragraph.Alignment of
    paLeftJustify:    tbAlinearIzquierda.Down  := True;
    paRightJustify:   tbAlinearDerecha.Down    := True;
    paCenter:         tbAlinearCentro.Down     := True;
    paJustify:        tbAlinearJustificar.Down := True;
  end;

  if Assigned(FOldSelectionChange) then
     FOldSelectionChange(Sender);
end;

constructor TfraToolbarRTF.Create(AOwner: TComponent);
begin
  inherited;
  tBarRTF.Enabled := False;
end;

end.
