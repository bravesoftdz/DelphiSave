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
  SDEngine, ExtDlgs, JvExControls, JvComponent, JvXPCore,
  JvXPButtons, JvExExtCtrls, JvExComCtrls, JvComCtrls,
  JvExStdCtrls, JvCombobox, JvImage, ImgList, AdvGlowButton, JvButton,
  JvCtrls, GraphicUtils, Menus, DBTables, FormPanel, Spin, JvBalloonHint,
  JvComponentBase, RxPlacemnt, RxToolEdit, RxCurrEdit;

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
    pmnuGuardar: TPopupMenu;
    mnuGuardarImagenOriginal: TMenuItem;
    mnuGuardarImagenModificada: TMenuItem;
    pnlStatus: TPanel;
    pnlLeft: TPanel;
    CoolBarLeft: TCoolBar;
    tbToolBarLeft: TToolBar;
    tbRowFirst: TToolButton;
    tbRowPrior: TToolButton;
    tbRowNext: TToolButton;
    tbRowLast: TToolButton;
    imgIconsColor: TImageList;
    imgIconsByN: TImageList;
    tbMaxMinimizar: TToolButton;
    LabelMagnifiation: TLabel;
    SpinEditMagnification: TSpinEdit;
    LabelX: TLabel;
    SpinEditMagnifierRadius: TSpinEdit;
    LabelRadius: TLabel;
    JvBalloonHint1: TJvBalloonHint;
    ilByN: TImageList;
    ilColor: TImageList;
    tbMail: TToolButton;
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
    procedure GuardarImagen(Sender: TObject);
    procedure tbGuardarImagenClick(Sender: TObject);
    procedure MoverEnDataSource(Sender: TObject);
    procedure tbMaxMinimizarClick(Sender: TObject);
    procedure fMaxClose(Sender: TObject; var Action: TCloseAction);
    procedure tbMailClick(Sender: TObject);
  private
    fMax: TForm;
    fMaxl, fMaxt, fMaxw, fMaxh: Integer;
    IniP, IniPos : TPoint;
    MagnifierShowing, Maximized, Rotated, Pressed : Boolean;
    FIDFormulario: integer;
    FExisteImagen, FMultiPage: boolean;
    FID: integer;
    Ratio: Extended;
    FNroOrden: string;
    FImage: string;
    FEncabezado, FMensaje: String;
    FPanelAuxVisible: Boolean;
    FDataSource: TDataSource;
    BackupBitmap: TBitmap;
    dsAfterOpen, dsAfterClose: TDataSetNotifyEvent;
    FNombreGuardarImg: String;
    FDataSourceUsarRecordCount: Boolean;
    pbMoviendoEnDataSource: Boolean;
    FDoProcessMessages: Boolean;
    procedure SetZoom(Value: integer);
    function GetZoom: integer;
    function GetPage: integer;
    procedure SetPage(const Value: integer);
    function GetPageCount: integer;
    procedure SetPageCount(const Value: integer);
    procedure SetImage(const Value: string);
    function GetImageHeight: integer;
    function GetImageWidth: integer;
    procedure ActualizarDatosImagen;
    procedure ActualizarRatioImagen;
    procedure SetMensaje(const Value: String);
    procedure SetPanelAuxiliarVisible(const Value: Boolean);
    procedure HabilitarToolButtonsPage;
    procedure DeshabilitarToolButtonsLeft;
    procedure DeshabilitarToolButtonsLeftAO(Sender: TDataset);
    procedure DeshabilitarToolButtonsLeftAC(Sender: TDataset);
    procedure SetDataSource(const Value: TDataSource);
    procedure ShowMagnifier(const X,Y: Integer);
    procedure GetCoordinates(X, Y: Integer; var xActual, yActual: Integer);
  public
    procedure WriteStatusText(AText : String);
    function GetTextoStatus: String;
    function ImagenConError: Boolean;
    procedure ImprimirImagen(Encabezado: String = '');
    procedure DoGuardarImagen(NombreArchDest: String; EsImagenOriginal: Boolean);
    procedure Clear; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MarcarImpresion;

    property Page: integer                        read GetPage                      write SetPage;
    property PageCount: integer                   read GetPageCount                 write SetPageCount;
    property MultiPage: boolean                   read FMultiPage                   write FMultiPage;
    property Zoom: integer                        read GetZoom                      write SetZoom;
    property ID: integer                          read FID                          write FID;
    property IDFormulario: integer                read FIDFormulario                write FIDFormulario;
    property NroOrden: string                     read FNroOrden                    write FNroOrden;
    property Image: string                        read FImage                       write SetImage;
    property ImageHeight: integer                 read GetImageHeight;
    property ImageWidth: integer                  read GetImageWidth;
    property Mensaje: String                      read FMensaje                     write SetMensaje;
    property PanelAuxVisible: Boolean             read FPanelAuxVisible             write SetPanelAuxiliarVisible     default False;
    property DataSource: TDataSource              read FDataSource                  write SetDataSource;
    property NombreGuardarImg: String             read FNombreGuardarImg            write FNombreGuardarImg;
    property DataSourceUsarRecordCount: Boolean   read FDataSourceUsarRecordCount   write FDataSourceUsarRecordCount  default True;
    property DoProcessMessages: Boolean           read FDoProcessMessages           write FDoProcessMessages          default True;
  published
    procedure imgVistaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgVistaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgVistaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  end;

implementation

uses
  unDmPrincipal, FSForm, unImageFunctions, Math, AnsiSQL, unSesion, ShellAPI,
  unDebug, StrFuncs, General, unMoldeEnvioMail, ArchFuncs, CustomDlgs;

{$R *.dfm}

function TfraVistaTIFF.GetImageHeight: integer;
begin
{
  if MultiPage then
    Result := Round(GetFileInfo(Image, Page - 1).Height * GetFileInfo(Image, Page - 1).Xdpi / 100)
  else
}
///    Result := Round(GetFileInfo(Image, -1).Height * GetFileInfo(Image, -1).Xdpi / 100);
  if (Image = '') or not FExisteImagen then
    Result := 0
  else if Rotated then
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
  if (Image = '') or not FExisteImagen then
    Result := 0
  else if Rotated then
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

procedure TfraVistaTIFF.HabilitarToolButtonsPage;
begin
  tbPageFirst.Enabled := Page > 1;
  tbPagePrior.Enabled := Page > 1;
  tbPageNext.Enabled  := Page < PageCount;
  tbPageLast.Enabled  := Page < PageCount;
end;

procedure TfraVistaTIFF.DeshabilitarToolButtonsLeft;
begin
  tbRowFirst.Enabled := False;
  tbRowPrior.Enabled := False;
  tbRowNext.Enabled  := False;
  tbRowLast.Enabled  := False;
end;

procedure TfraVistaTIFF.SetImage(const Value: string);
begin
  FImage := Value;
  FExisteImagen := FileExists(FImage);

  if FExisteImagen then
  begin
    sbScrollBox.HorzScrollBar.Position := 0;
    sbScrollBox.VertScrollBar.Position := 0;

    trckbContraste.Position := 0;
    trckbBrillo.Position    := 0;

    imgVista.Top  := 0;
    imgVista.Left := 0;

    LoadTiffIntoImageControl(FImage, imgVista);
    LoadTiffIntoImageControl(FImage, imgVistaCopia);
    imgVista.Picture      := ActualizarImagen(imgVista).Picture;
    imgVistaCopia.Picture := ActualizarImagen(imgVistaCopia).Picture;
    Rotated := False;

    imgVista.AutoSize := True;
    imgVista.Stretch  := False;

    ActualizarRatioImagen;
    cmbAjusteChange(nil);

    HabilitarToolButtonsPage;

    tbVisor.Enabled         := True;
    tbGuardarImagen.Enabled := True;
    tbImprimir.Enabled      := True;
  end else
  begin
    tbVisor.Enabled         := False;
    tbGuardarImagen.Enabled := False;
    tbImprimir.Enabled      := False;

    if DoProcessMessages then
      Application.ProcessMessages;

    Clear;
    Invalidate;

    if DoProcessMessages then
      Application.ProcessMessages;
  end;
end;

procedure TfraVistaTIFF.SetPage(const Value: integer);
begin
  edPage.Value := Value;
  HabilitarToolButtonsPage;
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

procedure TfraVistaTIFF.imgVistaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  if SpinEditMagnification.Value > 1 then
    begin
      if MagnifierShowing then
        ShowMagnifier(X, Y);
    end
  else
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
end;

procedure TfraVistaTIFF.imgVistaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    begin
      if SpinEditMagnification.Value > 1 then
        begin
          MagnifierShowing := True;
          Screen.Cursor    := crCross;
          BackupBitmap     := TBitmap.Create;
          BackupBitmap.Assign(imgVista.Picture.Bitmap);
          ShowMagnifier(X,Y);
        end
      else
        begin
          with TImage(Sender) do
          begin
            IniP   := ClientToScreen (Point(X, Y));
            IniPos := Point (Left, Top);
          end;

          Pressed := True;
        end;
    end;
end;

procedure TfraVistaTIFF.imgVistaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    begin
      if SpinEditMagnification.Value > 1 then
        begin
          MagnifierShowing := False;
          Screen.Cursor    := crDefault;
          imgVista.Picture.Bitmap := BackupBitmap;
          if Assigned(BackupBitmap) then
            BackupBitmap.Free;
        end
      else
        Pressed := False;
    end;
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
  if tbZoomDec.Enabled then
    Zoom := Zoom - 1;
end;

procedure TfraVistaTIFF.tbZoomIncClick(Sender: TObject);
begin
  if tbZoomInc.Enabled then
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
  if DoProcessMessages then
    Application.ProcessMessages;
end;

function TfraVistaTIFF.GetZoom: integer;
begin
  Result := Round(edZoom.Value);
end;

procedure TfraVistaTIFF.MarcarImpresion;
begin
  EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                 'SET FE_USUIMPRESION = ' + SqlValue(Sesion.UserID) + ', ' +
                     'FE_FECHAIMPRESION = SYSDATE ' +
               'WHERE FE_ID = ' + SqlValue(ID));
end;

procedure TfraVistaTIFF.tbImprimirClick(Sender: TObject);
var
  sEncabezado: String;
  iAuxdpi, iXdpi, iYdpi: Integer;
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
      MarcarImpresion;
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
    begin
      iXdpi := GetFileInfo(Image, 2).Xdpi;
      iYdpi := GetFileInfo(Image, 2).Ydpi;

      if Rotated then
        begin
          iAuxdpi := iXdpi;
          iXdpi   := iYdpi;
          iYdpi   := iAuxdpi;
        end;

      PrintImage(imgVista, 100, FEncabezado, iXdpi, iYdpi);
    end
end;

procedure TfraVistaTIFF.tbVisorClick(Sender: TObject);
var
  sFileNama: AnsiString;
begin
  sFileNama := 'SVIEW.EXE ' + FImage;
  WinExec(PAnsiChar(sFileNama), SW_SHOW);
end;

procedure TfraVistaTIFF.sbScrollBoxMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  tbZoomInc.Click;
end;

procedure TfraVistaTIFF.sbScrollBoxMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  tbZoomDec.Click;
end;

procedure TfraVistaTIFF.cmbAjusteChange(Sender: TObject);
begin
  inherited;
  if (ImageHeight > 0) and (ImageWidth > 0) then
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

procedure TfraVistaTIFF.ImprimirImagen(Encabezado: String = '');
begin
  FEncabezado := Encabezado;

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
  imgVista.Hint    := '';

  imgVistaCopia.Width   := 0;
  imgVistaCopia.Height  := 0;
  imgVistaCopia.Picture := nil;

  FNombreGuardarImg := '';

  if DoProcessMessages then
    Application.ProcessMessages;

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
  PanelAuxVisible            := False;
  cmbAjuste.ItemIndex        := 2;
  Rotated                    := False;
  Mensaje                    := '';
  Maximized                  := False;
  FExisteImagen              := False;
  FNombreGuardarImg          := '';
  FDataSourceUsarRecordCount := True;
  FDoProcessMessages         := True;
  pbMoviendoEnDataSource     := False;

  fMax := TForm.Create(nil);
  with fMax do
    begin
      GetDesktopDimentions(fMaxl, fMaxt, fMaxw, fMaxh);

      Icon        := Application.Icon;
      Caption     := 'Visor de Imágenes';
      WindowState := wsNormal;
      BorderIcons := [biSystemMenu];
      BorderStyle := bsSingle;
      OnClose     := fMaxClose;
    end;

  DeshabilitarToolButtonsLeft;    
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

procedure TfraVistaTIFF.DoGuardarImagen(NombreArchDest: String; EsImagenOriginal: Boolean);
begin
  NombreArchDest := ChangeFileExt(NombreArchDest, '.TIF');

  if EsImagenOriginal then
    {$IFDEF VER150}
    CopyFile(PAnsiChar(Image), PAnsiChar(NombreArchDest), True)
    {$ELSE}
    CopyFileW(PWideChar(Image), PWideChar(NombreArchDest), True)
    {$ENDIF}
  else
    SaveBitmapToFile2(NombreArchDest, imgVista.Picture.Bitmap);
end;

procedure TfraVistaTIFF.GuardarImagen(Sender: TObject);
var
  bImagenOriginal: Boolean;
begin
  bImagenOriginal := (Sender = mnuGuardarImagenOriginal);

  with sd do
    begin
      Filename   := NombreGuardarImg;
      DefaultExt := '*.tif';
      Filter     := 'Archivo de imágenes TIFF|*.tif';

      if Execute then
        DoGuardarImagen(FileName, bImagenOriginal);
    end;
end;

procedure TfraVistaTIFF.tbGuardarImagenClick(Sender: TObject);
begin
  tbGuardarImagen.CheckMenuDropdown;
end;

function TfraVistaTIFF.ImagenConError: Boolean;
begin
  Result := InStr(UpperCase(FMensaje), 'ERROR') > 0;
end;

procedure TfraVistaTIFF.SetMensaje(const Value: String);
begin
  if Value <> FMensaje then
    with pnlStatus do
      begin
        FMensaje          := Value;
        Visible           := not IsEmptyString(Value);
        pnlImgStatus.Top  := 0;

        if Visible then
          begin
            if ImagenConError then
              Font.Color := clRed
            else
              Font.Color := clWindowText;
          end
        else
          Font.Color := clWindowText;

        Caption := Iif(Visible, '  ', '') + FMensaje;
      end;
end;

procedure TfraVistaTIFF.SetPanelAuxiliarVisible(const Value: Boolean);
begin
  if FPanelAuxVisible <> Value then
    begin
      FPanelAuxVisible := Value;
      pnlLeft.Visible  := Value;
    end;
end;

procedure TfraVistaTIFF.MoverEnDataSource(Sender: TObject);
var
  iRecNo: Integer;
  EventAfterScroll: TDataSetNotifyEvent;
begin
  if not pbMoviendoEnDataSource and Assigned(FDataSource) and Assigned(FDataSource.Dataset) then
    with FDataSource.Dataset do
      begin
        if Active and not IsEmpty then
          begin
            if Sender = tbRowFirst then
              First
            else if Sender = tbRowPrior then
              Prior
            else if Sender = tbRowNext then
              Next
            else if Sender = tbRowLast then
              Last;

            tbRowFirst.Enabled := RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
            tbRowPrior.Enabled := RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};

            if FDataSourceUsarRecordCount then
              begin
                tbRowNext.Enabled  := RecNo {$IFDEF VER150}+ 1{$ENDIF} < RecordCount;
                tbRowLast.Enabled  := RecNo {$IFDEF VER150}+ 1{$ENDIF} < RecordCount;
              end
            else
              begin
                pbMoviendoEnDataSource := True;
                iRecNo := RecNo;
                DisableControls;
                EventAfterScroll := AfterScroll;
                AfterScroll := nil;
                Next;
                try
                  tbRowNext.Enabled  := not Eof;
                  tbRowLast.Enabled  := not Eof;
                finally
                  if RecNo <> iRecNo then
                    Prior;
                  EnableControls;
                  AfterScroll := EventAfterScroll;
                  pbMoviendoEnDataSource := False;
                end;
              end;
          end
        else
          DeshabilitarToolButtonsLeft;
      end;
end;

procedure TfraVistaTIFF.DeshabilitarToolButtonsLeftAO(Sender: TDataset);
begin
  DeshabilitarToolButtonsLeft;

  if Assigned(dsAfterOpen) then
    dsAfterOpen(Sender);
end;

procedure TfraVistaTIFF.DeshabilitarToolButtonsLeftAC(Sender: TDataset);
begin
  DeshabilitarToolButtonsLeft;

  if Assigned(dsAfterClose) then
    dsAfterClose(Sender);
end;

procedure TfraVistaTIFF.SetDataSource(const Value: TDataSource);
begin
  if Assigned(FDataSource) and Assigned(FDataSource.DataSet) then
    begin
      FDataSource.DataSet.AfterOpen  := dsAfterOpen;
      FDataSource.DataSet.AfterClose := dsAfterClose;
    end;  

  FDataSource := Value;

  with FDataSource.DataSet do
    begin
      if Assigned(AfterOpen) then
        dsAfterOpen := AfterOpen
      else
        dsAfterOpen := nil;
      AfterOpen := DeshabilitarToolButtonsLeftAO;

      if Assigned(AfterClose) then
        dsAfterClose := AfterClose
      else
        dsAfterClose := nil;
      AfterClose := DeshabilitarToolButtonsLeftAC;
    end;

  MoverEnDataSource(nil);
end;

procedure TfraVistaTIFF.tbMaxMinimizarClick(Sender: TObject);
var
  AuxParent: TWinControl;
begin
  if Maximized then
    fMax.Close
  else
    begin
      Maximized                 := True;
      tbMaxMinimizar.ImageIndex := 58;
      tbMaxMinimizar.Hint       := 'Minimizar';

      with fMax do
        begin
          Left   := fMaxl;
          Top    := fMaxt;
          Height := fMaxh;
          Width  := fMaxw;

          AuxParent   := Self.Parent;
          Self.Parent := fMax;
          cmbAjusteChange(nil);
          try
            ShowModal;
          finally
            Self.Parent := AuxParent;
            cmbAjusteChange(nil);
          end;
        end;
    end;
end;

destructor TfraVistaTIFF.Destroy;
begin
  inherited;
  fMax.Free;
end;

procedure TfraVistaTIFF.fMaxClose(Sender: TObject; var Action: TCloseAction);
begin
  Maximized                 := False;
  tbMaxMinimizar.ImageIndex := 57;
  tbMaxMinimizar.Hint       := 'Maximizar';
  inherited;
end;

procedure TfraVistaTIFF.GetCoordinates(X, Y: Integer; var xActual, yActual: Integer);
begin
  if imgVista.Stretch then
    begin
      xActual := MulDiv(X, imgVista.Picture.Bitmap.Width,  imgVista.Width);
      yActual := MulDiv(Y, imgVista.Picture.Bitmap.Height, imgVista.Height);
    end
  else
    begin
      xActual := X;
      yActual := Y;
    end;
end;

procedure TfraVistaTIFF.ShowMagnifier(const X,Y: Integer);
var
  AreaRadius: Integer;
  Magnification: Integer;
  ModifiedBitmap: TBitmap;
  xActual: Integer;
  yActual: Integer;
begin
  GetCoordinates(X, Y, xActual, yActual);
  Magnification := SpinEditMagnification.Value;
  AreaRadius := Round(SpinEditMagnifierRadius.Value / Magnification);
  if AreaRadius < 2 then
    begin
      AreaRadius := 2;
      SpinEditMagnifierRadius.Value := AreaRadius * Magnification
    end;

  ModifiedBitmap := TBitmap.Create;
  try
    with ModifiedBitmap do
      begin
        Assign(BackupBitmap);

        Canvas.CopyMode := cmSrcCopy;
        Canvas.CopyRect(Rect(xActual - AreaRadius * Magnification,
                             yActual - AreaRadius * Magnification,
                             xActual + AreaRadius * Magnification,
                             yActual + AreaRadius * Magnification),
                        BackupBitmap.Canvas,
                        Rect(xActual - AreaRadius,
                             yActual - AreaRadius,
                             xActual + AreaRadius,
                             yActual + AreaRadius) );
      end;

    imgVista.Picture.Bitmap := ModifiedBitmap;
  finally
    ModifiedBitmap.Free
  end;
end;

procedure TfraVistaTIFF.tbMailClick(Sender: TObject);
var
  sFileName: String;
begin
  inherited;
  sFileName := TempPath + ExtractFileName(Image);
  DeleteFile(sFileName);

  {$IFDEF VER150}
  CopyFile(PAnsiChar(Image), PAnsiChar(sFileName), True);
  {$ELSE}
  CopyFileW(PWideChar(Image), PWideChar(sFileName), True);
  {$ENDIF}

  if EnviarMailBD('', 'Enviando imagen del Servidor de Fax', [oAlwaysShowDialog, oShowDialogIfEmpty, oAutoFirma, oDeleteAttach], 'Se adjunta la imagen recibida por fax.', GetAttachments(sFileName, 0)) then
    if (ID <> 0) and MsgAsk('¿Desea marcar la imagen enviada como impresa?') then
      MarcarImpresion;
end;

end.

