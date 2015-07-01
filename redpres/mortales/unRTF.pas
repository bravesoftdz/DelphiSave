unit unRTF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ImgList, ToolWin, RXCombos, RXSpin, General,
  Buttons, Placemnt, RxRichEd, printers, QuickRpt, QRCtrls, Db, SDEngine;

type
  TfrmRTF = class(TForm)
    StandardToolBar: TToolBar;
    tbNuevo: TToolButton;
    tbAbrir: TToolButton;
    tbGuardar: TToolButton;
    ToolButton5: TToolButton;
    tbCortar: TToolButton;
    tbCopiar: TToolButton;
    tbPegar: TToolButton;
    tbDesHacer: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    tbNegrita: TToolButton;
    tbItalica: TToolButton;
    tbSubrayado: TToolButton;
    ToolButton16: TToolButton;
    tbAlinearIzquierda: TToolButton;
    tbAlinearCentro: TToolButton;
    tbAlinearDerecha: TToolButton;
    ToolButton20: TToolButton;
    tbPuntos: TToolButton;
    ToolbarImages: TImageList;
    cmbFuente: TFontComboBox;
    spnTamFuente: TRxSpinEdit;
    dlgAbrir: TOpenDialog;
    dlgGuardar: TSaveDialog;
    FormPlacement: TFormPlacement;
    redTexto: TRxRichEdit;
    tbAlinearJustificar: TToolButton;
    tbNumeros: TToolButton;
    PrintDialog: TPrintDialog;
    pnlBotones: TPanel;
    BtnImprimir: TBitBtn;
    BtnSalir: TBitBtn;
    BtnCorreo: TBitBtn;
    procedure tbNegritaClick(Sender: TObject);
    procedure tbItalicaClick(Sender: TObject);
    procedure tbSubrayadoClick(Sender: TObject);
    procedure redTextoSelectionChange(Sender: TObject);
    procedure cmbFuenteChange(Sender: TObject);
    procedure spnTamFuenteChange(Sender: TObject);
    procedure AlinearClick(Sender: TObject);
    procedure tbPuntosClick(Sender: TObject);
    procedure tbDesHacerClick(Sender: TObject);
    procedure tbPegarClick(Sender: TObject);
    procedure tbCopiarClick(Sender: TObject);
    procedure tbCortarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbAbrirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure tbNumerosClick(Sender: TObject);
    procedure BtnCorreoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCloseOnPrint: Boolean;
    FMargins: TRect;
    FReadOnly: Boolean;
    FCorreo: string;
    procedure SetReadOnly(const Value: Boolean);
  public
    iCantCopias: Integer;
    bEnvioMail: boolean;
    constructor Create(AOwner: TComponent); override;
    function CurrText: TRxTextAttributes;
  published
    Property CloseOnPrint    : Boolean read FCloseOnPrint    write FCloseOnPrint;
    property Margins         : TRect   read FMargins         write FMargins;
    property ReadOnly        : Boolean read FReadOnly        write SetReadOnly;
    property Correo          : string  read FCorreo          write FCorreo;
  end;

var
  frmRTF: TfrmRTF;


implementation

uses
  unPrincipal, ArchFuncs, unEnvioMail, unMoldeEnvioMail;

{$R *.DFM}
//----------------------------------------------------------------------------//
function TfrmRTF.CurrText: TRxTextAttributes;
begin
     Result := redTexto.SelAttributes;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbNegritaClick(Sender: TObject);
begin
  if tbNegrita.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbItalicaClick(Sender: TObject);
begin
  if tbItalica.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];

end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbSubrayadoClick(Sender: TObject);
begin
  if tbSubrayado.Down then
    CurrText.Style := CurrText.Style + [fsUnderLine]
  else
    CurrText.Style := CurrText.Style - [fsUnderLine];
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.cmbFuenteChange(Sender: TObject);
begin
    CurrText.Name :=  cmbFuente.FontName ;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.spnTamFuenteChange(Sender: TObject);
begin
    CurrText.Size := StrToInt( spnTamFuente.Text );
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.AlinearClick(Sender: TObject);
begin
  redTexto.Paragraph.Alignment := TParaAlignment(TControl(Sender).Tag);
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.redTextoSelectionChange(Sender: TObject);
begin
{En esta función se reubican los botones de la barra de herramientas segun
el texto donde se encuentra el cursor}
  if not FReadOnly then
  begin
    tbNegrita.Down      := fsBold      in redTexto.SelAttributes.Style;
    tbItalica.Down      := fsItalic    in redTexto.SelAttributes.Style;
    tbSubrayado.Down    := fsUnderline in redTexto.SelAttributes.Style;
    spnTamFuente.Text   := IntToStr(redTexto.SelAttributes.Size);
    cmbFuente.FontName  := redTexto.SelAttributes.Name ;
    spnTamFuente.Value  := redTexto.SelAttributes.Size ;

    tbPuntos.Down       := (redTexto.Paragraph.Numbering = nsBullet);
    tbNumeros.Down      := (redTexto.Paragraph.Numbering = nsArabicNumbers);

    case redTexto.Paragraph.Alignment of
      paLeftJustify:    tbAlinearIzquierda.Down  := True;
      paRightJustify:   tbAlinearDerecha.Down    := True;
      paCenter:         tbAlinearCentro.Down     := True;
      paJustify:        tbAlinearJustificar.Down := True;
    end;
  end;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbDesHacerClick(Sender: TObject);
begin
   if redTexto.HandleAllocated then
      SendMessage(redTexto.Handle, EM_UNDO, 0, 0);
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbPegarClick(Sender: TObject);
begin
  redTexto.PasteFromClipboard;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbCopiarClick(Sender: TObject);
begin
  redTexto.CopyToClipboard;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbCortarClick(Sender: TObject);
begin
   redTexto.CutToClipboard;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbNuevoClick(Sender: TObject);
begin
  redTexto.Lines.Clear;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbAbrirClick(Sender: TObject);
begin
  if dlgAbrir.Execute then
    redTexto.Lines.LoadFromFile( dlgAbrir.FileName );
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbGuardarClick(Sender: TObject);
  procedure GuardarArchivo;
  begin
     redTexto.Lines.SaveToFile(dlgGuardar.FileName);
  end;
begin

  if dlgGuardar.Execute then
    if not FileExists(dlgGuardar.FileName) then
       GuardarArchivo
    else
      if MsgBox('Desea sobreescribir el archivo ' + dlgGuardar.FileName ,
        MB_ICONQUESTION + MB_YESNO, 'Guardar Archivos') = IDYES	 then
          GuardarArchivo;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.BtnImprimirClick(Sender: TObject);
var
  auxRect: TRect;
begin
  with auxRect do
  begin
    Top    := FMargins.Top;
    Left   := FMargins.Left;
    Bottom := Printer.PageHeight - FMargins.Bottom ;
    Right  := Printer.PageWidth  - FMargins.Right;
  end;

  bEnvioMail := False;
  PrintDialog.Copies := iCantCopias;
  if PrintDialog.Execute then
  begin
    redTexto.PageRect := auxRect;
    redTexto.Print(Application.Name + ' ' + frmPrincipal.DBLogin.Usuario);
  end;

  if FCloseOnPrint Then
    ModalResult := mrOk;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbPuntosClick(Sender: TObject);
begin
  redTexto.Paragraph.Numbering := IIF(tbPuntos.Down,nsBullet, nsNone) ;
  tbNumeros.Down := False;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.tbNumerosClick(Sender: TObject);
begin
  redTexto.Paragraph.Numbering := IIF(tbNumeros.Down,nsArabicNumbers, nsNone);
  tbPuntos.Down := False;
end;
//----------------------------------------------------------------------------//
constructor TfrmRTF.Create(AOwner: TComponent);
begin
  inherited;

  with FMargins do begin
    Top    := 140;
    Left   := 140;
    Bottom := 0;
    Right  := 140;
  end;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.SetReadOnly(const Value: Boolean);
begin
  if FReadOnly <> Value then
  begin
    FReadOnly := Value;

    tbNuevo.Enabled             := not Value;
    tbAbrir.Enabled             := not Value;
    tbCortar.Enabled            := not Value;
    tbPegar.Enabled             := not Value;
    cmbFuente.Enabled           := not Value;
    spnTamFuente.ReadOnly       := Value;
    tbNegrita.Enabled           := not Value;
    tbItalica.Enabled           := not Value;
    tbSubrayado.Enabled         := not Value;
    tbAlinearIzquierda.Enabled  := not Value;
    tbAlinearCentro.Enabled     := not Value;
    tbAlinearDerecha.Enabled    := not Value;
    tbAlinearJustificar.Enabled := not Value;
    tbNumeros.Enabled           := not Value;
    tbPuntos.Enabled            := not Value;
  end;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.BtnCorreoClick(Sender: TObject);
var
  TextoRTF, NombreArchivo: string;
  str: TStringList;
  ResultadoEnvio: TResultadoEnvio;
begin

  NombreArchivo := TempPath + 'tmp_rtf.rtf';
  //Con formato...
  redTexto.Lines.SaveToFile(NombreArchivo);
  str := TStringList.Create;
  try
    str.LoadFromFile(NombreArchivo);
    TextoRTF := str.Text;
  finally
    str.Free;
  end;

  try
    //Esto sigue pinchando si le paso con texto enriquecido...
    //ExportarPDF(rptReport, NombreArchivo + '.pdf');
   // EnviarMailBD(Correo, Caption, [oAlwaysShowDialog, oBodyIsRTF], TextoRTF);

    ResultadoEnvio := EnviarMailBDWithResults(Correo, Caption, [oAlwaysShowDialog, oBodyIsRTF], TextoRTF);  // por TK 9927
    bEnvioMail     := ResultadoEnvio.EnvioOk;
    if bEnvioMail then
      ModalResult := mrOk
    else
      ModalResult := mrCancel;
  finally
    DeleteFile(NombreArchivo);
  end;
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.FormShow(Sender: TObject);
begin
  redTexto.SetSelection(0, 0, True);
end;
//----------------------------------------------------------------------------//
procedure TfrmRTF.FormCreate(Sender: TObject);
begin
  bEnvioMail := False;
end;
//----------------------------------------------------------------------------//
end.
