Esto no se usa mas!
(ptavasci)

La nueva ruta es:

  unFraVistaTIFF in '..\comunes\frames\new\unFraVistaTIFF.pas' {fraVistaTIFF: TFrame},

unit unFraVistaTIFF;

interface             

uses
  {$IFDEF VER180}
  rxToolEdit,
  rxCurrEdit,
  rxPlacemnt,
  {$ELSE}
  ToolEdit,
  CurrEdit,
  Placemnt,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, PatternEdit, IntEdit, StdCtrls, Mask,
  ComCtrls, ToolWin, ExtCtrls, JvExForms, JvScrollBox, DB,
  LibGfl, SDEngine, ExtDlgs, JvExControls, JvComponent, JvXPCore,
  JvXPButtons, JvExExtCtrls, JvSpecialImage, JvExComCtrls, JvComCtrls,
  JvExStdCtrls, JvCombobox, JvImage, ImgList, AdvGlowButton, JvButton,
  JvCtrls, GraphicUtils;

type
  TfraVistaTIFF = class(TArtFrame)
    sbScrollBox: TJvScrollBox;
    CoolBar: TCoolBar;
    tbToolBar: TToolBar;
    tbZoomDec: TToolButton;
    edZoom: TCurrencyEdit;
    tbZoomInc: TToolButton;
    ToolButton10: TToolButton;
    tbPageFirst: TToolButton;
    tbPagePrior: TToolButton;
    edPage: TIntEdit;
    edPageCount: TIntEdit;
    tbPageNext: TToolButton;
    tbPageLast: TToolButton;
    ToolButton1: TToolButton;
    tbAbrirImagen: TToolButton;
    tbGuardarImagen: TToolButton;
    sdqPaginas: TSDQuery;
    pnlImgStatus: TPanel;
    OpenPictureDialog: TOpenPictureDialog;
    sd: TSaveDialog;
    tbImprimir: TToolButton;
    tbVisor: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edWidth: TIntEdit;
    edHeight: TIntEdit;
    Label3: TLabel;
    trckbContraste: TJvTrackBar;
    FormStorage: TFormStorage;
    cmbAjuste: TJvComboBox;
    imgVista: TJvImage;
    btnOriginal: TAdvGlowButton;
    btnRotateRight: TAdvGlowButton;
    btnRotateLeft: TAdvGlowButton;
    imglIconos: TImageList;
    btnDcha: TJvImgBtn;
    btnIzq: TJvImgBtn;
    btnAbajo: TJvImgBtn;
    btnArriba: TJvImgBtn;
    imgVistaCopia: TJvImage;
    Label4: TLabel;
    trckbBrillo: TJvTrackBar;
    procedure tbAbrirImagenClick(Sender: TObject);
    procedure edZoomKeyPress(Sender: TObject; var Key: Char);
    procedure tbZoomDecClick(Sender: TObject);
    procedure tbZoomIncClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbVisorClick(Sender: TObject);
    procedure sbScrollBoxMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure sbScrollBoxMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure cmbAjusteChange(Sender: TObject);
    procedure edWidthChange(Sender: TObject);
    procedure edHeightChange(Sender: TObject);
    procedure btnOriginalClick(Sender: TObject);
    procedure Desplazamiento(Sender: TObject);
    procedure ContrasteBrillo(Sender: TObject);
    procedure Rotacion(Sender: TObject);
    procedure edZoomChange(Sender: TObject);
  private
    IniP, IniPos : TPoint;
    Rotated, Pressed : Boolean;
    FIDFormulario: integer;
    FMultiPage: boolean;
    FID: integer;
    Ratio: Extended;
    FNroOrden: string;
    FImage: string;
    procedure SetZoom(Value: integer);
    function GetZoom: integer;
    function  GetPage: integer;
    procedure SetPage(const Value: integer);
    function  GetPageCount: integer;
    procedure SetPageCount(const Value: integer);
    procedure SetImage(const Value: string);
    function GetImageHeight: integer;
    function GetImageWidth: integer;
    procedure ActualizarDatosImagen;
    procedure ActualizarRatioImagen;
  public
    procedure WriteStatusText(AText : String);
    function  GetTextoStatus: String;
    procedure ImprimirImagen;
    procedure Clear; override;
    constructor Create(AOwner: TComponent); override;

    property Page: integer         read GetPage        write SetPage;
    property PageCount: integer    read GetPageCount   write SetPageCount;
    property MultiPage: boolean    read FMultiPage     write FMultiPage;
    property Zoom: integer         read GetZoom        write SetZoom;
    property ID: integer           read FID            write FID;
    property IDFormulario: integer read FIDFormulario  write FIDFormulario;
    property NroOrden: string      read FNroOrden      write FNroOrden;
    property Image: string         read FImage         write SetImage;
    property ImageHeight: integer  read GetImageHeight;
    property ImageWidth: integer   read GetImageWidth;
  published
    procedure imgVistaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgVistaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgVistaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbGuardarImagenClick(Sender: TObject);
  end;

implementation

uses
  unDmPrincipal, FSForm, unImageFunctions, Math, AnsiSQL, unSesion, ShellAPI,
  unDebug;

{$R *.dfm}

function TfraVistaTIFF.GetImageHeight: integer;
begin
{
  if MultiPage then
    Result := Round(GetFileInfo(Image, Page - 1).Height * GetFileInfo(Image, Page - 1).Xdpi / 100)
  else
}
///    Result := Round(GetFileInfo(Image, -1).Height * GetFileInfo(Image, -1).Xdpi / 100);
  if Rotated then
    Result := Round(GetFileInfo(Image, -1).Width * GetFileInfo(Image, -1).Ydpi / 100)
  else
    Result := Round(GetFileInfo(Image, -1).Height * GetFileInfo(Image, -1).Xdpi / 100)
end;

function TfraVistaTIFF.GetImageWidth: integer;
begin
{
  if MultiPage then
    Result := Round(GetFileInfo(Image, Page - 1).Width * GetFileInfo(Image, Page - 1).Ydpi / 100)
  else
}
////    Result := Round(GetFileInfo(Image, -1).Width * GetFileInfo(Image, -1).Ydpi / 100);
  if Rotated then
    Result := Round(GetFileInfo(Image, -1).Height * GetFileInfo(Image, -1).Xdpi / 100)
  else
    Result := Round(GetFileInfo(Image, -1).Width * GetFileInfo(Image, -1).Ydpi / 100);
end;

function TfraVistaTIFF.GetPage: integer;
begin
  Result := edPage.Value;
end;

function TfraVistaTIFF.GetPageCount: integer;
begin
  Result := edPageCount.Value;
end;

function TfraVistaTIFF.GetTextoStatus: String;
begin
  if Owner is TFSForm then
    Result := TFSForm(Owner).StatusBar.SimpleText
  else
    Result := '';
end;

procedure TfraVistaTIFF.SetImage(const Value: string);
begin
  FImage := Value;
  if FileExists(FImage) then
  begin
    sbScrollBox.HorzScrollBar.Position := 0;
    sbScrollBox.VertScrollBar.Position := 0;

    trckbContraste.Position := 0;
    trckbBrillo.Position    := 0;

    imgVista.Top  := 0;
    imgVista.Left := 0;

    LoadTiffIntoImageControl(FImage, imgVista);
    LoadTiffIntoImageControl(FImage, imgVistaCopia);
    imgVistaCopia.Picture := ActualizarImagen(imgVistaCopia).Picture;
    Rotated := False;

    imgVista.AutoSize := True;
    imgVista.Stretch  := False;

    ActualizarRatioImagen;
    cmbAjusteChange(nil);

    tbPageFirst.Enabled := Page > 1;
    tbPagePrior.Enabled := Page > 1;

    tbPageNext.Enabled  := Page < PageCount;
    tbPageLast.Enabled  := Page < PageCount;
    tbVisor.Enabled     := True;
    tbGuardarImagen.Enabled := True;
    tbImprimir.Enabled := True;
  end else
  begin
    tbVisor.Enabled := False;
    tbGuardarImagen.Enabled := False;
    tbImprimir.Enabled := False;
    Application.ProcessMessages;
    Clear;
    Invalidate;
    Application.ProcessMessages;
  end;
end;

procedure TfraVistaTIFF.SetPage(const Value: integer);
begin
  edPage.Value := Value;
  tbPageFirst.Enabled := Page > 1;
  tbPagePrior.Enabled := Page > 1;
  tbPageNext.Enabled  := Page < PageCount;
  tbPageLast.Enabled  := Page < PageCount;
end;

procedure TfraVistaTIFF.SetPageCount(const Value: integer);
begin
  edPageCount.Value := Value;
  Zoom := Zoom;
end;

procedure TfraVistaTIFF.WriteStatusText(AText: String);
begin
  if Owner is TFSForm then
    TFSForm(Owner).WriteStatusText(AText);
end;

procedure TfraVistaTIFF.tbGuardarImagenClick(Sender: TObject);
begin
  if sd.Execute then
//    CopyFile(PAnsiChar(Image), PAnsiChar(sd.FileName), True);
    imgVista.Picture.SaveToFile(PAnsiChar(sd.FileName));
end;

procedure TfraVistaTIFF.imgVistaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  P : TPoint;
begin
  if Pressed then
  with TImage(Sender) do
  begin
    P := ClientToScreen (Point(X, Y));
    if (IniPos.X + P.X - IniP.X) <= 0 then
      if (Left + Width) >= TScrollBox(Owner).Width - 20 then
        Left := IniPos.X + P.X - IniP.X
      else
        Left := TScrollBox(Owner).Width - Width - 20
    else
      Left := 0;

    if (IniPos.Y + P.Y - IniP.Y) <= 0 then
      if (Top + Height) >= TScrollBox(Owner).Height - 20 then
        Top := IniPos.Y + P.Y - IniP.Y
      else
        Top := TScrollBox(Owner).Height - Height - 20
    else
      Top := 0;
  end;
end;

procedure TfraVistaTIFF.imgVistaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with TImage(Sender) do
  begin
    IniP   := ClientToScreen (Point(X, Y));
    IniPos := Point (Left, Top);
  end;

  Pressed := True;
end;

procedure TfraVistaTIFF.imgVistaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Pressed := False;
end;

procedure TfraVistaTIFF.tbAbrirImagenClick(Sender: TObject);
begin
  inherited;
{
    if sdqConsulta.FieldByName('FE_MULTIPAGINAS').AsString = 'N' then
      WinExec(PChar('sview.exe "' + sdqPaginas.FieldByName('FE_ARCHIVOIMAGEN').AsString + '"'), SW_SHOW)
    else //multipaginas
      WinExec(PChar('sview.exe "' + sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString + '"'), SW_SHOW);
}

  if OpenPictureDialog.Execute then
    Image := OpenPictureDialog.FileName;
end;

procedure TfraVistaTIFF.edZoomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Zoom := Round(edZoom.Value);
end;

procedure TfraVistaTIFF.tbZoomDecClick(Sender: TObject);
begin
  Zoom := Zoom - 1;
end;

procedure TfraVistaTIFF.tbZoomIncClick(Sender: TObject);
begin
  Zoom := Zoom + 1;
end;

procedure TfraVistaTIFF.ActualizarDatosImagen;
begin
  edWidth.Value  := imgVista.Width;
  edHeight.Value := imgVista.Height;
end;

procedure TfraVistaTIFF.ActualizarRatioImagen;
begin
  if ImageWidth > 0 then
    Ratio := ImageHeight / ImageWidth
  else
    Ratio := 0;
end;

procedure TfraVistaTIFF.SetZoom(Value: integer);
begin
  imgVista.AutoSize := False;
  imgVista.Stretch  := True;

  imgVista.Width  := Round(ImageWidth * Value / 100);
  imgVista.Height := Round(ImageHeight * Value / 100);

  ActualizarDatosImagen;

  edZoom.Value := Value;
end;

function TfraVistaTIFF.GetZoom: integer;
begin
  Result := Round(edZoom.Value);
end;

procedure TfraVistaTIFF.tbImprimirClick(Sender: TObject);
var
  sEncabezado: string;
begin
  if ID <> 0 then
    try
      unDebug.AddToLog('Iniciando la impresión de la imagen ' + NroOrden, ltInfo);

      sEncabezado := Format('SERIAL=%d FORM=%d N=%s Pag=%d/%d  -   F. Impr.: %s',
                            [ID, IDFormulario, NroOrden, edPage.Value, PageCount,
                             FormatDateTime('dd/mm/yyyy hh:nn', DBDateTime)]);

      try
        unDebug.AddToLog('Imprimiendo la imagen ' + NroOrden, ltInfo);
        PrintImage(imgVista, 100, sEncabezado, GetFileInfo(Image, 2).Xdpi, GetFileInfo(Image, 2).Ydpi);
      finally
      end;
      WriteStatusText('Marcando Imagen Impresa...');
      unDebug.AddToLog('Registrando la impresión de la imagen ' + NroOrden, ltInfo);
      EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                     'SET FE_USUIMPRESION = ' + SqlValue(Sesion.UserID) + ', ' +
                         'FE_FECHAIMPRESION = SYSDATE ' +
                   'WHERE FE_ID = ' + SqlValue(ID));
    except
      on E: Exception do
      begin
        WriteStatusText('Marcando Imagen como Errónea...');
        unDebug.AddToLog('Error en la impresión de la imagen ' + NroOrden, ltError);
        EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                       'SET FE_ERRORDESCRIPCION = SUBSTR(' + SqlValue(E.Message + #13#10 + GetTextoStatus) + ', 1, 255), ' +
                           'FE_ERRORFECHA = SYSDATE ' +
                     'WHERE FE_ID = ' + SqlValue(ID));
      end;
    end
  else
    PrintImage(imgVista, 100, '', GetFileInfo(Image, 2).Xdpi, GetFileInfo(Image, 2).Ydpi);
end;

procedure TfraVistaTIFF.tbVisorClick(Sender: TObject);
begin
  WinExec(PChar('SVIEW.EXE ' + FImage), SW_SHOW);
end;

procedure TfraVistaTIFF.sbScrollBoxMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  Zoom := Zoom + 1;
end;

procedure TfraVistaTIFF.sbScrollBoxMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  Zoom := Zoom - 1;
end;

procedure TfraVistaTIFF.cmbAjusteChange(Sender: TObject);
begin
  inherited;
  case cmbAjuste.ItemIndex of
    0: begin
         if ImageHeight > ImageWidth then
           SetZoom(Round(sbScrollBox.Height / ImageHeight * 100) - 1)
         else
           SetZoom(Round(sbScrollBox.Width / ImageWidth * 100) - 1);
       end;
    1: SetZoom(Round(sbScrollBox.Height / ImageHeight * 100) - 1);
    2: SetZoom(Round(sbScrollBox.Width / ImageWidth * 100) - 1);
    3: SetZoom(Zoom);
  end;
end;

procedure TfraVistaTIFF.ImprimirImagen;
begin
  if tbImprimir.Enabled then
    tbImprimirClick(nil);
end;

procedure TfraVistaTIFF.edWidthChange(Sender: TObject);
begin
  inherited;
  imgVista.Width := edWidth.Value;
end;

procedure TfraVistaTIFF.edHeightChange(Sender: TObject);
begin
  inherited;
  imgVista.Height := edHeight.Value;
end;

procedure TfraVistaTIFF.btnOriginalClick(Sender: TObject);
begin
  inherited;

  Image := FImage;
end;

procedure TfraVistaTIFF.Desplazamiento(Sender: TObject);
var
  iIncremento: Integer;
begin
  inherited;

  iIncremento := 3;

  if Sender = btnArriba then
    imgVista.Top := imgVista.Top + iIncremento
  else if Sender = btnAbajo then
    imgVista.Top := imgVista.Top - iIncremento
  else if Sender = btnIzq then
    imgVista.Left := imgVista.Left + iIncremento
  else if Sender = btnDcha then
    imgVista.Left := imgVista.Left - iIncremento;

  SetFocus;
end;

procedure TfraVistaTIFF.Clear;
begin
  imgVista.Width   := 0;
  imgVista.Height  := 0;
  imgVista.Picture := nil;

  imgVistaCopia.Width   := 0;
  imgVistaCopia.Height  := 0;
  imgVistaCopia.Picture := nil;

  application.ProcessMessages;
  imgVista.Refresh;
end;

procedure TfraVistaTIFF.ContrasteBrillo(Sender: TObject);
var
  Aux: TPicture;
begin
  inherited;

  Aux := imgVistaCopia.Picture;
  try
    imgVista.Picture := AdjustContrastAndBrightness2(imgVistaCopia, trckbContraste.Position, trckbBrillo.Position).Picture;
    imgVista.Refresh;
  finally
    imgVistaCopia.Picture := Aux;
  end;
end;

constructor TfraVistaTIFF.Create(AOwner: TComponent);
begin
  inherited;
  cmbAjuste.ItemIndex := 2;
  Rotated := False;
end;

procedure TfraVistaTIFF.Rotacion(Sender: TObject);
var
  iZoom: Integer;
  OrientRot: TOrientationRotation;
begin
  inherited;

  if Sender = btnRotateLeft then
    OrientRot := orLeft
  else
    OrientRot := orRight;

  iZoom  := Zoom;
  imgVista.Picture      := RotateBitmapFixed(imgVista, OrientRot).Picture;
  imgVistaCopia.Picture := RotateBitmapFixed(imgVistaCopia, OrientRot).Picture;

  Rotated := not Rotated;
  ActualizarRatioImagen;

  Zoom := iZoom;
  cmbAjusteChange(nil);
  ActualizarDatosImagen;
end;

procedure TfraVistaTIFF.edZoomChange(Sender: TObject);
begin
  inherited;

  tbZoomDec.Enabled := edZoom.Value > 10;
  tbZoomInc.Enabled := edZoom.Value < 400;
end;

end.

