{$DEFINE VISUALIZADOR}

unit unVisualizador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ExtCtrls, QRPrntr,
  ImgList, Menus, XPMenu, ActnList, Placemnt, QuickRpt, StdCtrls, artSeguridad, QRExport;

type
  TOpcionVisualizador = (oAlwaysShowDialog, oShowDialogIfEmpty, oAutoFirma, oSinNotaAlPie, oForceDB, oMailNotAllowed,
                         oForceShowModal, oExportPDFNotAllowed, oExportDOCNotAllowed, oExportXLSNotAllowed,
                         oFaxNotAllowed, oPrintNotAllowed, oEmailFijo, oEmailHTML, oSinTransaccion, oAgruparReportes);
  TOpcionesVisualizador = set of TOpcionVisualizador;

  TProcedureParameter = procedure of object;

  TValores = record
    Contrato: Integer;
    Correo: String;
    ExtraTitle: String;
    Formulario: Integer;
    MailBody: String;
    ReportClass: String;
    Siniestro: Integer;
  end;

  TValoresFax = record
    Clave: String;
    IdDest: integer;
    RazonSocial: String;
    Sector: String;
    Telefono: String;
    TipoDoc: String;
    TipoDest: String;
  end;

  TListado = record
    Opciones: TOpcionesVisualizador;
    Report: TQuickRep;
    Valores: TValores;
    ValoresFax: TValoresFax;
  end;

  TResultado = (rImpresora, rMail, rExportaPDF, rFax);
  TResultados = set of TResultado;

  TfrmVisualizador = class(TForm)
    qrPreview: TQRPreview;
    pnl: TPanel;
    tbToolBar: TToolBar;
    tbZoom: TTrackBar;
    tbFirst: TToolButton;
    tbPrior: TToolButton;
    tbNext: TToolButton;
    tbLast: TToolButton;
    tbSave: TToolButton;
    tbPrinterSetup: TToolButton;
    tbPrint: TToolButton;
    tbSeparator1: TToolButton;
    tbSeparator2: TToolButton;
    tbSeparator3: TToolButton;
    tbExit: TToolButton;
    ImageList: TImageList;
    HotImageList: TImageList;
    DisabledImageList: TImageList;
    ActionList: TActionList;
    XPMenu: TXPMenu;
    FormStorage: TFormStorage;
    acFirst: TAction;
    acPrior: TAction;
    acNext: TAction;
    acLast: TAction;
    acSave: TAction;
    acExportPDF: TAction;
    acPrinterSetup: TAction;
    acPrint: TAction;
    acExit: TAction;
    BarraProgreso: TProgressBar;
    acOpen: TAction;
    mnuPopupMenu: TPopupMenu;
    mnuVisualizadorExportarPopUp: TMenuItem;
    mnuVisualizadorPDFPopUp: TMenuItem;
    mnuVisualizadorVisualizarPopUp: TMenuItem;
    mnuVisualizadorAbrirPopUp: TMenuItem;
    mnuVisualizadorN3: TMenuItem;
    mnuVisualizadorConfigurarImpresoraPopUp: TMenuItem;
    mnuVisualizadorImprimirPopUp: TMenuItem;
    mnuVisualizadorN4: TMenuItem;
    mnuVisualizadorCerrarPopUp: TMenuItem;
    tbOpen: TToolButton;
    mnuVisualizadorGuardarPopUp: TMenuItem;
    acFirstPopUp: TMenuItem;
    acPriorPopUp: TMenuItem;
    acNextPopUp: TMenuItem;
    acLastPopUp: TMenuItem;
    N1: TMenuItem;
    BarraEstado: TStatusBar;
    mnuVisualizadorMain: TMainMenu;
    mnuVisualizador: TMenuItem;
    mnuExportar: TMenuItem;
    mnuPDF: TMenuItem;
    mnuVisualizacion: TMenuItem;
    mnuGuardar: TMenuItem;
    mnuAbrir: TMenuItem;
    N2: TMenuItem;
    mnuUltimo: TMenuItem;
    mnuSiguiente: TMenuItem;
    mnuAnterior: TMenuItem;
    mnuPrimero: TMenuItem;
    N3: TMenuItem;
    mnuConfigurarImpresora: TMenuItem;
    mnuImprimir: TMenuItem;
    N4: TMenuItem;
    mnuCerrar: TMenuItem;
    cmbZoom: TComboBox;
    Label2: TLabel;
    lbEspaciador: TPanel;
    lbProgreso: TPanel;
    mnuPopupMenuButtons: TPopupMenu;
    mnuPrinterSetupToolBarPopUp: TMenuItem;
    mnuPrintToolbarPopUp: TMenuItem;
    MenuItem14: TMenuItem;
    mnuCloseReportToolbarPopUp: TMenuItem;
    tbToolBar2: TToolBar;
    tbListado1: TToolButton;
    tbListado2: TToolButton;
    tbListado3: TToolButton;
    tbListado4: TToolButton;
    tbListado5: TToolButton;
    tbListado6: TToolButton;
    tbListado7: TToolButton;
    tbListado8: TToolButton;
    mnuReportes: TMenuItem;
    mnuSubReporte1: TMenuItem;
    mnuSubReporte2: TMenuItem;
    mnuSubReporte7: TMenuItem;
    mnuSubReporte6: TMenuItem;
    mnuSubReporte5: TMenuItem;
    mnuSubReporte4: TMenuItem;
    mnuSubReporte3: TMenuItem;
    mnuSubReporte8: TMenuItem;
    acSendMail: TAction;
    mnuEnviarCorreoElectronicoPopUp: TMenuItem;
    mnuEnviarCorreoElectronico: TMenuItem;
    tbSendMail: TToolButton;
    Seguridad: TSeguridad;
    SaveDialog: TSaveDialog;
    acExportWord: TAction;
    mnuDocumentoDeWordPopUp: TMenuItem;
    mnuDocumentoDeWord: TMenuItem;
    acExportXLS: TAction;
    mnuPlanillaDeCalculoPopUp: TMenuItem;
    mnuPlanillaDeCalculo: TMenuItem;
    tbSendFax: TToolButton;
    acSendFax: TAction;
    mnuEnviarFaxPopUp: TMenuItem;
    mnuEnviarFax: TMenuItem;
    Panel1: TPanel;
    TimerZoom: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbZoomChange(Sender: TObject);
    procedure acPrinterSetupExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExportPDFExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure qrPreviewProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormResize(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure qrPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CambiarListado(Sender: TObject);
    procedure cmbZoomChange(Sender: TObject);
    procedure cmbZoomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuCloseReportToolbarPopUpClick(Sender: TObject);
    procedure tbListadoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure acFirstExecute(Sender: TObject);
    procedure acPriorExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure acSendMailExecute(Sender: TObject);
    procedure acExportWordExecute(Sender: TObject);
    procedure acExportExcelExecute(Sender: TObject);
    procedure acSendFaxExecute(Sender: TObject);
    procedure acExportXLSExecute(Sender: TObject);
    procedure TimerZoomTimer(Sender: TObject);
  private
    FAfterSendEmailEvent: String;
    FBeforeSendEmailEvent: String;
    FbtnDesplegado: TToolButton;
    FCanPrint, FCanSendMail: Boolean;
    FListados: Array of TListado;
    FSelected: Byte;
    FUsarServidorPdf: Boolean;
    Resultado: TResultados;

    function  GetListado(Indice: Integer): TListado;

    procedure AgregarListado(const QuickRep: TQuickRep; Valores: TValores; ValoresFax: TValoresFax; Opciones: TOpcionesVisualizador);
    procedure EjecutarEvento(aObjeto: TObject; aMetodo: String);
    procedure OnPreview(Sender: TObject);
    procedure QuitarListado(const QuickRep: TQuickRep);
    procedure SetListado(Indice: Integer; Value: TListado);
    procedure SetSelected(const Value: Byte);
    procedure SetUsuarioActivo(const Value: String);
    procedure UpdateInfo;
  public
    class function ObtenerTotalListados: Byte;

    function ShowModal: TResultados; reintroduce;

    property Listados[Indice: Integer]: TListado read GetListado write SetListado;
    property Selected: Byte read FSelected write SetSelected;
    property UsuarioActivo: string write SetUsuarioActivo;
  end;

  function GetValores(ExtraTitle: String = ''; Correo: String = ''; Contrato: Integer = 0; Siniestro: Integer = 0;
                      MailBody: String = ''): TValores;
  function GetValoresFax(Sector, Clave, TipoDoc, TipoDest, Telefono, RazonSocial: String; IdDest: Integer): TValoresFax;

  function Visualizar(const QuickRep: TQuickRep; Valores: TValores; Opciones: TOpcionesVisualizador = [];
                      Nuevo: Boolean = True; aAfterSendEmailEvent: String = ''; aBeforeSendEmailEvent: String = '';
                      const aUsarServidorPdf: Boolean = False): TResultados; overload;
  function Visualizar(const QuickRep: TQuickRep; Valores: TValores; ValoresFax: TValoresFax;
                      Opciones: TOpcionesVisualizador = []; Nuevo: Boolean = True; aAfterSendEmailEvent: String = '';
                      aBeforeSendEmailEvent: String = ''; const aUsarServidorPdf: Boolean = False): TResultados; overload;
  function VisualizadorReady: Boolean;

implementation

uses
  unExportPDF, Printers, CustomDlgs, Numeros, unSesion, ArchFuncs, IARTMail, unEnvioMail, General, unRTTI, unDmPrincipal,
  WinSpool, SpoolFuncs, unFaxFuncs, IniFiles, unMoldeEnvioMail, unSeleccionDestinatarios;

const
  BOTONES = 'tbListado';
  CAPTION_BASE = 'Visualizador - [%s]';
  MAX_LISTADOS = 8;
  MAX_ZOOM = 150;
  MENUES = 'mnuSubReporte';
  MIN_ZOOM = 50;
  USUARIO_ACTIVO_BASE = 'Usuario activo: %s.';

var
  frmVisualizador: TfrmVisualizador;
  nTotalListados: Byte;

{$R *.DFM}

function GetValores(ExtraTitle: String = ''; Correo: String = ''; Contrato: Integer = 0; Siniestro: Integer = 0;
                    MailBody: String = ''): TValores;
begin
  Result.ExtraTitle := ExtraTitle;
  Result.Correo     := Correo;
  Result.Contrato   := Contrato;
  Result.Siniestro  := Siniestro;
  Result.MailBody   := MailBody;
end;

function GetValoresFax(Sector, Clave, TipoDoc, TipoDest, Telefono, RazonSocial: String; IdDest: integer): TValoresFax;
begin
  Result.Sector      := Sector;
  Result.Clave       := Clave;
  Result.TipoDoc     := TipoDoc;
  Result.TipoDest    := TipoDest;
  Result.Telefono    := Telefono;
  Result.RazonSocial := RazonSocial;
  Result.IdDest      := IdDest;
end;

function Visualizar(const QuickRep: TQuickRep; Valores: TValores; Opciones: TOpcionesVisualizador = [];
                    Nuevo: Boolean = True; aAfterSendEmailEvent: String = '';
                    aBeforeSendEmailEvent: String = ''; const aUsarServidorPdf: Boolean = False): TResultados;
var
  ValoresFax: TValoresFax;
begin
  Result := Visualizar(QuickRep, Valores, ValoresFax, Opciones, Nuevo, aAfterSendEmailEvent, aBeforeSendEmailEvent,
                       aUsarServidorPdf);
end;

function Visualizar(const QuickRep: TQuickRep; Valores: TValores; ValoresFax: TValoresFax;
                    Opciones: TOpcionesVisualizador = []; Nuevo: Boolean = True;
                    aAfterSendEmailEvent: String = ''; aBeforeSendEmailEvent: String = '';
                    const aUsarServidorPdf: Boolean = False): TResultados;
begin
  Result := [];

{$IFDEF VISUALIZADOR}
  if not Assigned(QuickRep) then
    Abort;

  if (nTotalListados = MAX_LISTADOS) and Nuevo then
  begin
    InfoHint(nil, 'Sólo se permiten previsualizar hasta ' + IntToStr(MAX_LISTADOS) + ' listados a la vez.');
    Abort;
  end;

  if nTotalListados = 0 then
  begin
//    FreeAndNil(frmVisualizador);
    frmVisualizador := TfrmVisualizador.Create(Screen.ActiveForm);
    if ((Screen.ActiveForm.FormStyle = fsMDIChild) or (Screen.ActiveForm.FormStyle = fsMDIForm)) and not (oForceShowModal in Opciones) then
      frmVisualizador.FormStyle := fsMDIChild;
  end
  else
  if Nuevo then
    InfoHint(frmVisualizador.tbToolBar2, 'Se ha generado más de un listado.');


  with frmVisualizador do
  try
    FAfterSendEmailEvent  := aAfterSendEmailEvent;
    FBeforeSendEmailEvent := aBeforeSendEmailEvent;
    FCanPrint             := (not (oPrintNotAllowed in Opciones)) and Seguridad.Activar(acPrint);
    FCanSendMail          := (not (oMailNotAllowed in Opciones)) and Seguridad.Activar(acSendMail);
    FUsarServidorPdf      := aUsarServidorPdf;

    acExportPDF.Enabled  := (not (oExportPDFNotAllowed in Opciones)) and Seguridad.Activar(acExportPDF);
    acExportWord.Enabled := (not (oExportDOCNotAllowed in Opciones)) and Seguridad.Activar(acExportWord);
    acExportXLS.Enabled  := (not (oExportXLSNotAllowed in Opciones)) and Seguridad.Activar(acExportXLS);
    acSendFax.Enabled    := (not (oFaxNotAllowed in Opciones)) and Seguridad.Activar(acSendFax);
    acSendMail.Enabled   := (not (oMailNotAllowed in Opciones)) and Seguridad.Activar(acSendMail);

    if Nuevo then
    begin
      QuickRep.ReportTitle := QuickRep.ReportTitle + Valores.ExtraTitle;
      Valores.ExtraTitle := '';
      Valores.ReportClass := QuickRep.ClassName;
      AgregarListado(QuickRep, Valores, ValoresFax, Opciones);
    end
    else
    begin
      QuickRep.OnPreview := OnPreview;
      {$IFDEF VER130}
      QuickRep.Available := True;
      {$ENDIF}
      QuickRep.PreviewModeless;
      show;
      BringToFront;
      Application.ProcessMessages;
      exit;
    end;

    try
      repeat
      until VisualizadorReady;

      try
        if not Assigned(QuickRep.DataSet) then
          qrPreviewProgressUpdate(nil, 100);

        QuickRep.OnPreview := OnPreview;
        {$IFDEF VER130}
        QuickRep.Available := True;
        {$ENDIF}
        if FormStyle <> fsMDIChild then
          Show;

        QuickRep.PreviewModeless;

        if FormStyle <> fsMDIChild then
          Hide;

        Sleep(250);
        frmVisualizador.Cursor := crArrow;

        Application.ProcessMessages;
        Caption := Format(CAPTION_BASE, [QuickRep.ReportTitle]);
      except
        QuitarListado(QuickRep);
        acExit.Execute;
      end;

      BringToFront;
      if not (Screen.ActiveForm.FormStyle = fsMDIChild) or (oForceShowModal in Opciones) then
      begin
        frmVisualizador.FormStyle := fsnormal;
        frmVisualizador.hide;
        Result := frmVisualizador.ShowModal;
        Application.ProcessMessages;
      end;

    except
      acExit.Execute;
    end;
  except
    QuitarListado(QuickRep);
    acExit.Execute;
  end;
{$ELSE}
  try
    QuickRep.Visible := False;
    QuickRep.PrevFormStyle := fsNormal;
    QuickRep.PreviewInitialState := wsNormal;
    QuickRep.Preview;
  finally
    QuickRep.Free;
  end;
{$ENDIF}
end;

procedure TfrmVisualizador.AgregarListado(const QuickRep: TQuickRep; Valores: TValores; ValoresFax: TValoresFax;
                                          Opciones: TOpcionesVisualizador);
  procedure MarcarBoton(nIndice, nTiempo: Integer; cTitulo: String);
  begin
    Application.ProcessMessages;
    TToolButton(FindComponent(BOTONES + IntToStr(nIndice))).Caption := cTitulo;
    tbToolBar2.Update;
    Application.ProcessMessages;
    Sleep(nTiempo);
    Application.ProcessMessages;
  end;

var
  cTitulo: String;
  i: Byte;
  tslMail: TStringList;
begin
  Inc(nTotalListados);
  if Length(FListados) < nTotalListados then
    SetLength(FListados, nTotalListados);

  for i := 0 to nTotalListados - 1 do
    if not Assigned(FListados[i].Report) then
      Break;

  tslMail := TStringList.Create;
  tslMail.CommaText := StringReplace(Valores.Correo, ';', ',', [rfReplaceAll]);

  FSelected := i + 1;
  FListados[Selected - 1].Report         := QuickRep;
  FListados[Selected - 1].Valores        := Valores;
  FListados[Selected - 1].Valores.Correo := tslMail.CommaText;
  FListados[Selected - 1].ValoresFax     := ValoresFax;
  FListados[Selected - 1].Opciones       := Opciones;
  FListados[Selected - 1].Valores.Formulario := QuickRep.IDReport; //ValorSqlEx('SELECT QR_ID FROM CQR_QUICKREPORTS WHERE QR_CLASSNAME = :V1', [QuickRep.ClassName]);

  with FListados[Selected - 1].Report.ValoresART do
  begin
    Contrato  := Valores.Contrato;
    Siniestro := Valores.Siniestro;
  end;

  tslMail.Free;

  if (FormStyle = fsMDIChild) and (not Assigned(Listados[i + 1].Report.Parent) or not Listados[i + 1].Report.Parent.InheritsFrom(TForm)) then
    QuickRep.Name := QuickRep.Name + IntToStr(Selected);

  with TToolButton(FindComponent(BOTONES + IntToStr(Selected))) do
  begin
    Caption := Listados[Selected].Report.ReportTitle;
    Enabled := True;
    Visible := True;
    Down := True;
  end;

  for i := 1 to MAX_LISTADOS do
  begin
    if TToolButton(FindComponent(BOTONES + IntToStr(i))).Visible and (i <> Selected) then
    begin
      cTitulo := TToolButton(FindComponent(BOTONES + IntToStr(i))).Caption;
      MarcarBoton(i, 500, '');
      MarcarBoton(i, 500, cTitulo);
      MarcarBoton(i, 500, '');
      MarcarBoton(i, 500, cTitulo);
    end;
  end;

  with TMenuItem(FindComponent(MENUES + IntToStr(Selected))) do
  begin
    Caption := Listados[Selected].Report.ReportTitle;
    Enabled := True;
    Visible := True;
    Checked := True;
  end;
end;

procedure TfrmVisualizador.QuitarListado(const QuickRep: TQuickRep);
var
  i: Byte;
begin
  Dec(nTotalListados);

  for i := 0 to nTotalListados do
    if FListados[i].Report = QuickRep then
      Break;

  FSelected := i + 1;
  try
    if FormStyle = fsMDIChild then
      if not Assigned(Listados[i].Report.Parent) or not Listados[i].Report.Parent.InheritsFrom(TForm) then
        Listados[Selected].Report.Free;
  except
    //
  end;

//  No puedo achicar el largo del vector porque los listados no cambian de posición.
//  SetLength(FListados, nTotalListados);

  with TToolButton(FindComponent(BOTONES + IntToStr(Selected))) do
  begin
    Enabled := False;
    Visible := False;
    Down := False;
  end;

  with TMenuItem(FindComponent(MENUES + IntToStr(Selected))) do
  begin
    Caption := '';
    Enabled := False;
    Visible := False;
  end;

  if nTotalListados = 0 then
    acExit.Execute
  else
  begin
    if Selected > 1 then
      Selected := Selected - 1
    else
      Selected := Selected + 1;
  end;

  TToolButton(FindComponent(BOTONES + IntToStr(Selected))).Down := True;
end;

procedure TfrmVisualizador.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Byte;
begin
  if WindowState = wsMaximized then
    WindowState := wsNormal;

  Action := caFree;
  frmVisualizador := nil;

  for i := nTotalListados downto 1 do
  try
    if FormStyle = fsMDIChild then
      if not Assigned(Listados[i].Report.Parent) or not Listados[i].Report.Parent.InheritsFrom(TForm) then
        Listados[i].Report.Free;
  except
    //
  end;

  nTotalListados := 0;
end;

procedure TfrmVisualizador.tbZoomChange(Sender: TObject);
begin
  if qrPreview.Zoom <> tbZoom.Position then
    qrPreview.Zoom := tbZoom.Position;

  if cmbZoom.Text <> IntToStr(tbZoom.Position) then
    cmbZoom.Text := IntToStr(tbZoom.Position);
end;

procedure TfrmVisualizador.acPrinterSetupExecute(Sender: TObject);
begin
  Verificar(Printer.Printers.Count = 0, qrPreview, 'No posee impresoras instaladas.');
  qrPreview.QRPrinter.PrintSetup;

  SetDefaultPrinter(Printers.Printer.PrinterIndex);
//  qrPreview.QRPrinter.PrintSetup;
end;

procedure TfrmVisualizador.acExitExecute(Sender: TObject);
begin
//  if FormStyle = fsMDIChild then
    Close;
//  else
//    ModalResult := mrNone;
end;

procedure TfrmVisualizador.acPrintExecute(Sender: TObject);
begin
  Verificar(Printer.Printers.Count = 0, qrPreview, 'No posee impresoras instaladas.');

  if (qrPreview.QRPrinter.Master = nil) or (qrPreview.QRPrinter.Master is TQRCompositeWinControl) then
    qrPreview.QRPrinter.Print
  else
    if TCustomQuickRep(qrPreview.QRPrinter.Master).QRPrinter.Status <> mpBusy then
      qrPreview.QRPrinter.Print;

  Resultado := Resultado + [rImpresora];
end;

procedure TfrmVisualizador.acExportPDFExecute(Sender: TObject);
var
  sNombreArchivo: String;
begin
  with TSaveDialog.Create(Self) do
  try
    Title      := 'Exportación del Reporte';
    DefaultExt := 'pdf';
    Filter     := 'Portable Document Format (*.pdf)|*.pdf';
    Options    := [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware,
                   ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoDereferenceLinks,
                   ofEnableIncludeNotify];
    if Execute then
    begin
      sNombreArchivo := FileName;
      sNombreArchivo := IncludeTrailingPathDelimiter(ExtractFilePath(FileName)) + ChangeFileExt(ExtractFileName(FileName), '.' + DefaultExt);

      if FileExists(sNombreArchivo) then
      begin
        if MsgAsk(Format('¿Desea reemplazar el archivo %s?', [sNombreArchivo])) then
        begin
          DeleteFile(sNombreArchivo);

          {$IFNDEF MSACCESS}
          if FUsarServidorPdf then
            FileToPDFSvr(Listados[Selected].Report, '', sNombreArchivo)
          else
          {$ENDIF}
            ExportarPDF(Listados[Selected].Report, sNombreArchivo);

          Resultado := Resultado + [rExportaPDF];
        end;
      end
      else
      begin
        {$IFNDEF MSACCESS}
        if FUsarServidorPdf then
          FileToPDFSvr(Listados[Selected].Report, '', sNombreArchivo)
        else
        {$ENDIF}
          ExportarPDF(Listados[Selected].Report, sNombreArchivo);

        Resultado := Resultado + [rExportaPDF];
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmVisualizador.acSaveExecute(Sender: TObject);
begin
  with TSaveDialog.Create(Self) do
  try
    Title      := 'Guardar Reporte';
    DefaultExt := 'qrp';
    Filter     := 'Quick Report File (*.qrp)|*.qrp';
    Options    := [ofReadOnly, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware, ofNoReadOnlyReturn,
                   ofNoTestFileCreate, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableIncludeNotify];
    if Execute then
      if FileExists(FileName) then
      begin
        if MsgAsk(Format('¿ Desea reemplazar el archivo %s ?', [FileName])) then
        begin
          DeleteFile(FileName);
          qrPreview.QRPrinter.Save(FileName);
        end;
      end
      else
        qrPreview.QRPrinter.Save(FileName);
  finally
    Free;
  end;
end;

procedure TfrmVisualizador.SetListado(Indice: Integer; Value: TListado);
begin
  FListados[Indice] := Value;
  FListados[Indice].Report.OnPreview := OnPreview;
end;

procedure TfrmVisualizador.OnPreview(Sender: TObject);
begin
  qrPreview.QRPrinter := Listados[Selected].Report.QRPrinter;
  FormResize(Sender);
end;

procedure TfrmVisualizador.qrPreviewProgressUpdate(Sender: TObject; Progress: Integer);
begin
  BarraProgreso.Position := Progress;
  BarraProgreso.Visible  := (Progress <> 100) or (Assigned(Listados[Selected].Report.DataSet) and (not Listados[Selected].Report.DataSet.Active));
  lbProgreso.Visible  := (Progress <> 100) or (Assigned(Listados[Selected].Report.DataSet) and (not Listados[Selected].Report.DataSet.Active));

  if not lbProgreso.Visible then
  begin
    BarraProgreso.Width := 0;
    lbProgreso.Width := 0;
  end
  else
  begin
    BarraProgreso.Width := 160;
    lbProgreso.Width := 78;
  end;

  BarraProgreso.Update;
end;

procedure TfrmVisualizador.UpdateInfo;
begin
  lbEspaciador.Left := tbZoom.Left - 1;
  tbZoom.Position := qrPreview.Zoom;
  BarraEstado.Panels[0].Text := IntToStr(BarraProgreso.Position) + ' %';
  if Assigned(QRPreview.QRPrinter) then
    BarraEstado.Panels[1].Text := 'Página ' + IntToStr(QRPreview.PageNumber) + ' de ' +
                                  IntToStr(QRPreview.QRPrinter.PageCount);

  if (BarraProgreso.Position = 0) or (BarraProgreso.Position = 100) then
  begin
    BarraProgreso.Visible := False;
    lbProgreso.Visible := False;
    BarraEstado.Panels[0].Text := '';
    tbToolBar2.Enabled := True;
    TimerZoom.Enabled := True;
  end;

  frmVisualizador.Cursor := crArrow;
  Application.ProcessMessages;
end;

procedure TfrmVisualizador.FormResize(Sender: TObject);
begin
  qrPreview.UpdateZoom;
  tbZoom.Position := qrPreview.Zoom;
end;

procedure TfrmVisualizador.acOpenExecute(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  try
    Title      := 'Abrir Reporte';
    DefaultExt := 'qrp';
    Filter     := 'Quick Report File (*.qrp)|*.qrp';
    Options    := [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware,
                   ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoDereferenceLinks,
                   ofEnableIncludeNotify];
    if Execute then
      if FileExists(FileName) then
      begin
        QRPrinter.Load(Filename);
        QRPreview.PageNumber := 1;
        QRPreview.PreviewImage.PageNumber := 1;
        UpdateInfo;
      end
      else
        ShowMessage('El archivo seleccionado no existe.');
  finally
    Free;
  end;
end;

procedure TfrmVisualizador.qrPreviewPageAvailable(Sender: TObject; PageNum: Integer);
begin
  UpdateInfo;

  if (qrPrinter.Status = mpFinished) or (qrPrinter.Status = mpReady) then
  begin
    acPrinterSetup.Enabled := True;
    acPrint.Enabled        := FCanPrint;
    acSendMail.Enabled     := FCanSendMail;
  end
  else begin
    acPrinterSetup.Enabled := False;
    acPrint.Enabled        := False;
  end;
  UpdateInfo;
end;

procedure TfrmVisualizador.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Next:
      if Shift = [ssCtrl] then
        tbLast.Click
      else
        tbNext.Click;
    VK_Prior:
      if Shift = [ssCtrl] then
        tbFirst.Click
      else
        tbPrior.Click;
    VK_Home: tbFirst.Click;
    VK_End: tbLast.Click;
    VK_Escape: acExit.Execute;
  end;
end;

class function TfrmVisualizador.ObtenerTotalListados: byte;
begin
  Result := nTotalListados;
end;

procedure TfrmVisualizador.FormCreate(Sender: TObject);
begin
  nTotalListados := 0;
  UsuarioActivo := Sesion.Usuario;
end;

function TfrmVisualizador.GetListado(Indice: Integer): TListado;
begin
  Result := FListados[Indice - 1];
end;

procedure TfrmVisualizador.CambiarListado(Sender: TObject);
begin
  tbToolBar2.Enabled := False;

  Selected := (Sender as TComponent).Tag;
end;

procedure TfrmVisualizador.SetSelected(const Value: Byte);
var
  QuickRep: TQuickRep;
begin
  if Selected <> Value then
  begin
    if Assigned(Listados[Selected].Report) and Assigned(Listados[Selected].Report.QRPrinter) then
    try
      qrPreview.qrPrinter.Cancel;
      Listados[Selected].Report.QRPrinter.Free;
      Listados[Selected].Report.QRPrinter := nil;
    except
      QuitarListado(Listados[Selected].Report);
    end;

    if Assigned(TMenuItem(FindComponent(MENUES + IntToStr(Selected)))) then
      TMenuItem(FindComponent(MENUES + IntToStr(Selected))).Checked := False;

    FSelected := Value;

    if Assigned(TMenuItem(FindComponent(MENUES + IntToStr(Selected)))) then
      TMenuItem(FindComponent(MENUES + IntToStr(Selected))).Checked := True;

    if Assigned(TToolButton(FindComponent(BOTONES + IntToStr(Selected)))) then
      TToolButton(FindComponent(BOTONES + IntToStr(Selected))).Down := True;

    QuickRep := Listados[Selected].Report;
    QuickRep.OnPreview := OnPreview;
    QuickRep.QRPrinter := qrPreview.QRPrinter;
    Visualizar(QuickRep, Listados[Selected].Valores, Listados[Selected].ValoresFax, Listados[Selected].Opciones, False,
               FAfterSendEmailEvent, FBeforeSendEmailEvent);
  end;

  UpdateInfo;
end;

procedure TfrmVisualizador.cmbZoomChange(Sender: TObject);
begin
  if not IsNumber(cmbZoom.Text) then
    cmbZoom.Text := IntToStr(MIN_ZOOM);

  if tbZoom.Position <> StrToInt(cmbZoom.Text) then
    tbZoom.Position := StrToInt(cmbZoom.Text);
end;

procedure TfrmVisualizador.cmbZoomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not(Key in [48..57, 96..105, VK_LEFT, VK_UP, VK_DOWN, VK_RIGHT, VK_HOME, VK_END, VK_DELETE, VK_CLEAR, VK_RETURN, VK_SHIFT]) then
  begin
    InvalidHint(cmbZoom, 'Carácter inválido.');
    Key := 0;
  end
  else
  begin
    if StrToInt(Trim(cmbZoom.Text)) < MIN_ZOOM then
      cmbZoom.Text := IntToStr(MIN_ZOOM);
    if StrToInt(Trim(cmbZoom.Text)) > MAX_ZOOM then
      cmbZoom.Text := IntToStr(MAX_ZOOM);
  end;
end;

procedure TfrmVisualizador.SetUsuarioActivo(const Value: String);
begin
  BarraEstado.Panels[2].Text := Format(USUARIO_ACTIVO_BASE, [Value]);
end;

procedure TfrmVisualizador.mnuCloseReportToolbarPopUpClick(Sender: TObject);
begin
  QuitarListado(Listados[FbtnDesplegado.Tag].Report);
end;

procedure TfrmVisualizador.tbListadoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    FbtnDesplegado := TToolButton(Sender)
  else
    FbtnDesplegado := nil;
end;

function VisualizadorReady: boolean;
begin
  Result :=((not Assigned(frmVisualizador)) or
            (not Assigned(frmVisualizador.qrPreview.qrPrinter)) or
            ((frmVisualizador.qrPreview.qrPrinter.Status = mpFinished) or
             (frmVisualizador.qrPreview.qrPrinter.Status = mpReady)));
end;

procedure TfrmVisualizador.acFirstExecute(Sender: TObject);
begin
  qrPreview.PageNumber := 1;
  UpdateInfo;
end;

procedure TfrmVisualizador.acPriorExecute(Sender: TObject);
begin
  qrPreview.PageNumber := qrPreview.PageNumber - 1;
  UpdateInfo;
end;

procedure TfrmVisualizador.acNextExecute(Sender: TObject);
begin
  qrPreview.PageNumber := qrPreview.PageNumber + 1;
  UpdateInfo;
end;

procedure TfrmVisualizador.acLastExecute(Sender: TObject);
begin
  qrPreview.PageNumber := qrPreview.QRPrinter.PageCount;
  UpdateInfo;
end;

function SwitchVisualizadorToARTMail(Opciones: TOpcionesVisualizador): TOpcionesARTMail;
begin
  Result := [];

  if oAlwaysShowDialog in Opciones then
    Include(Result, TOpcionARTMail(oAlwaysShowDialog));
  if oShowDialogIfEmpty in Opciones then
    Include(Result, TOpcionARTMail(oShowDialogIfEmpty));
  if oForceDB in Opciones then
    Include(Result, TOpcionARTMail(oForceDB));

  Include(Result, TOpcionARTMail(oDeleteAttach));
end;

function SwitchVisualizadorToEnvioMail(Opciones: TOpcionesVisualizador): TOpcionesEnvioMail;
begin
  Result := [];

  if oAlwaysShowDialog in Opciones then
    Include(Result, unEnvioMail.TOpcionEnvioMail(oAlwaysShowDialog));
  if oShowDialogIfEmpty in Opciones then
    Include(Result, unEnvioMail.TOpcionEnvioMail(oShowDialogIfEmpty));
  if oAutoFirma in Opciones then
    Include(Result, unEnvioMail.TOpcionEnvioMail(oAutoFirma));
  if (oSinNotaAlPie in Opciones) or (oEmailHTML in Opciones) then
    Include(Result, unEnvioMail.TOpcionEnvioMail(oSinNotaAlPie));
  if oEmailFijo in Opciones then
  begin
    Include(Result, unEnvioMail.TOpcionEnvioMail(oDisableBody));
    Include(Result, unEnvioMail.TOpcionEnvioMail(oDisableAdjuntos));
  end;

  Include(Result, unEnvioMail.TOpcionEnvioMail(oDeleteAttach));
end;

procedure TfrmVisualizador.acSendMailExecute(Sender: TObject);
var
  aResultado: TResultadoEnvio;
  sNombreArchivo: String; i, posic: byte; Adjuntos: TArrayOfAttach;
begin
  if oAgruparReportes in Listados[Selected].Opciones then       //DGASTAL 15/08/2011
  begin
    for i := 1 to nTotalListados do
    begin
      sNombreArchivo := TempPath + StringReplace(StringReplace(
                                   StringReplace(Listados[i].Report.ReportTitle, ' ', '_', [rfReplaceAll]),
                                                                                 '/', '_', [rfReplaceAll]),
                                                                                 ':', '_', [rfReplaceAll]);
      sNombreArchivo := StringReplace(sNombreArchivo, '|', '', [rfReplaceAll]);
      sNombreArchivo := StringReplace(sNombreArchivo, '"', '', [rfReplaceAll]);

      EjecutarEvento(Listados[Selected].Report, FBeforeSendEmailEvent);
      try
        {$IFNDEF MSACCESS}
        if FUsarServidorPdf then
          FileToPDFSvr(Listados[i].Report, '', sNombreArchivo + '.pdf')
        else
        {$ENDIF}
          ExportarPDF(Listados[i].Report, sNombreArchivo + '.pdf');
      except on E: Exception do
        begin
          MsgBox('Ocurrió un error durante la exportación a pdf del archivo a adjuntar.' +#13 + E.Message);
        end;
      end;

      Posic := Length(Adjuntos)+1;
      SetLength(Adjuntos, Posic);
      Adjuntos[Posic-1] := GetAttach(sNombreArchivo + '.pdf', Listados[i].Report.IDReport);
    end;

    if oForceDB in Listados[Selected].Opciones then
      aResultado := EnviarMailBDWithResults(Listados[Selected].Valores.Correo,
                                            'Provincia ART - ' + Listados[1].Report.ReportTitle,
                                            SwitchVisualizadorToEnvioMail(Listados[1].Opciones),
                                            NVL(Listados[1].Valores.MailBody, 'Provincia ART'),
                                            Adjuntos,
                                            Listados[1].Report.ValoresART.Contrato,
                                            tcDefault,
                                            not(oSinTransaccion in Listados[1].Opciones),
                                            False,
                                            2500,
                                            -1,
                                            {$IFNDEF SERVICE}
                                            [tdContactoContrato],
                                            {$ENDIF}
                                            '',
                                            (oEmailHTML in Listados[1].Opciones))
    else
      aResultado := EnviarMailWithResults(Listados[Selected].Valores.Correo,
                                          'Provincia ART - ' + Listados[Selected].Report.ReportTitle, Sesion.UserID,
                                          SwitchVisualizadorToARTMail(Listados[Selected].Opciones),
                                          NVL(Listados[Selected].Valores.MailBody, 'Provincia ART'),
                                          [sNombreArchivo + '.pdf']);

    if aResultado.EnvioOk then
    begin
      Resultado := Resultado + [rMail];

      with Listados[Selected].Report.ValoresART do
      begin
        DireccionesEmailEnviado := aResultado.EMailsDestino.CommaText;
      end;

      EjecutarEvento(Listados[Selected].Report, FAfterSendEmailEvent);
    end;

  end
  else       //no agrupar reportes
  begin

    sNombreArchivo := TempPath + StringReplace(
                                   StringReplace(
                                     StringReplace(Listados[Selected].Report.ReportTitle, ' ', '_', [rfReplaceAll]),
                                                                                          '/', '_', [rfReplaceAll]),
                                                                                          ':', '_', [rfReplaceAll]);
    sNombreArchivo := StringReplace(sNombreArchivo, '|', '', [rfReplaceAll]);
    sNombreArchivo := StringReplace(sNombreArchivo, '"', '', [rfReplaceAll]);

    EjecutarEvento(Listados[Selected].Report, FBeforeSendEmailEvent);

    try
      {$IFNDEF MSACCESS}
      if FUsarServidorPdf then
        FileToPDFSvr(Listados[Selected].Report, '', sNombreArchivo + '.pdf')
      else
      {$ENDIF}
        ExportarPDF(Listados[Selected].Report, sNombreArchivo + '.pdf');
    except on E: Exception do
      begin
        MsgBox('Ocurrió un error durante la exportación a pdf del archivo a adjuntar.' +#13 + E.Message);
      end;
    end;

    if oForceDB in Listados[Selected].Opciones then
      aResultado := EnviarMailBDWithResults(Listados[Selected].Valores.Correo,
                                            'Provincia ART - ' + Listados[Selected].Report.ReportTitle,
                                            SwitchVisualizadorToEnvioMail(Listados[Selected].Opciones),
                                            NVL(Listados[Selected].Valores.MailBody, 'Provincia ART'),
                                            GetAttachments(sNombreArchivo + '.pdf',
                                            Listados[Selected].Report.IDReport),
                                            Listados[Selected].Report.ValoresART.Contrato,
                                            tcDefault,
                                            not(oSinTransaccion in Listados[Selected].Opciones),
                                            False,
                                            2500,
                                            -1,
                                            {$IFNDEF SERVICE}
                                            [tdContactoContrato],
                                            {$ENDIF}
                                            '',
                                            (oEmailHTML in Listados[Selected].Opciones))
    else
      aResultado := EnviarMailWithResults(Listados[Selected].Valores.Correo,
                                          'Provincia ART - ' + Listados[Selected].Report.ReportTitle, Sesion.UserID,
                                          SwitchVisualizadorToARTMail(Listados[Selected].Opciones),
                                          NVL(Listados[Selected].Valores.MailBody, 'Provincia ART'),
                                          [sNombreArchivo + '.pdf']);

    if aResultado.EnvioOk then
    begin
      Resultado := Resultado + [rMail];

      with Listados[Selected].Report.ValoresART do
      begin
        DireccionesEmailEnviado := aResultado.EMailsDestino.CommaText;
      end;

      EjecutarEvento(Listados[Selected].Report, FAfterSendEmailEvent);
    end;

  end;
end;

function TfrmVisualizador.ShowModal: TResultados;
begin
  inherited ShowModal;
  Result := Resultado;
end;
{$WARNINGS OFF}
procedure TfrmVisualizador.acExportWordExecute(Sender: TObject);
var
  AFilter: TQRExportFilter;
  sFileName: string;
begin
  with SaveDialog do
  try
    Title      := 'Exportación del Reporte';
    DefaultExt := 'doc';
    Filter     := 'Documento de Word (*.doc)|*.doc';
    Options    := [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware,
                   ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoDereferenceLinks,
                   ofEnableIncludeNotify];
    if Execute then
      if FileExists(FileName) then
      begin
        if MsgAsk(Format('¿ Desea reemplazar el archivo %s ?', [SaveDialog.FileName])) then
        begin
          DeleteFile(SaveDialog.FileName);
          sFileName := ExtractFileName(ChangeFileExt(SaveDialog.FileName, '')) + '.' + SaveDialog.DefaultExt;
          AFilter := TQRRTFExportFilter.Create(sFileName);
          Listados[Selected].Report.ExportToFilter(AFilter);
          Resultado := Resultado + [rExportaPDF];
        end;
      end
      else
      begin
        sFileName := ExtractFileName(ChangeFileExt(SaveDialog.FileName, '')) + '.' + SaveDialog.DefaultExt;
        AFilter := TQRRTFExportFilter.Create(sFileName);
        Listados[Selected].Report.ExportToFilter(AFilter);
        Resultado := Resultado + [rExportaPDF];
      end;
  finally
    AFilter.Free;
  end;
end;

procedure TfrmVisualizador.acExportExcelExecute(Sender: TObject);
var
  AFilter: TQRExportFilter;
  sFileName: String;
begin
  with SaveDialog do
  try
    Title      := 'Exportación del Reporte';
    DefaultExt := 'xls';
    Filter     := 'Documento de Excel (*.xls)|*.xls';
    Options    := [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware,
                   ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoDereferenceLinks,
                   ofEnableIncludeNotify];
    if Execute then
      if FileExists(FileName) then
      begin
        if MsgAsk(Format('¿ Desea reemplazar el archivo %s ?', [SaveDialog.FileName])) then
        begin
          DeleteFile(SaveDialog.FileName);
          sFileName := ExtractFileName(ChangeFileExt(SaveDialog.FileName, '')) + '.' + SaveDialog.DefaultExt;
          AFilter := TQRAsciiExportFilter.Create(sFileName);
          Listados[Selected].Report.ExportToFilter(AFilter);
          Resultado := Resultado + [rExportaPDF];
        end;
      end
      else
      begin
        sFileName := ExtractFileName(ChangeFileExt(SaveDialog.FileName, '')) + '.' + SaveDialog.DefaultExt;
        AFilter := TQRAsciiExportFilter.Create(sFileName);
        Listados[Selected].Report.ExportToFilter(AFilter);
        Resultado := Resultado + [rExportaPDF];
      end;
  finally
    AFilter.Free;
  end;
end;
{$WARNINGS ON}
procedure TfrmVisualizador.acSendFaxExecute(Sender: TObject);
const
  ASeccion = 'Fax';
var
  iIndex: integer;
begin
  iIndex := GetPrinterFAX();
  Verificar((iIndex = -1), nil, 'No se encontró la impresora virtual que envía fax en su PC. Consulte con soporte técnico.');
  Listados[Selected].Report.PrinterSettings.PrinterIndex := iIndex;

  with TIniFile.Create('C:\WINDOWS\TEMP\FaxSaliente.ini') do
//  with TIniFile.Create(TempPath + 'FaxSaliente.ini') do
  try
    WriteString(ASeccion, 'Usuario', Sesion.UserID);
    WriteString(ASeccion, 'Sector', Listados[Selected].ValoresFax.Sector);
    WriteString(ASeccion, 'Clave', Listados[Selected].ValoresFax.Clave);
    WriteString(ASeccion, 'TipoDocumento', Listados[Selected].ValoresFax.TipoDoc); //IntToStr(Listados[Selected].Report.IDReport));
    WriteString(ASeccion, 'TipoDestinatario', Listados[Selected].ValoresFax.TipoDest);
    WriteInteger(ASeccion, 'IDDestinatario', Listados[Selected].ValoresFax.IdDest);
    WriteString(ASeccion, 'Telefono', Listados[Selected].ValoresFax.Telefono);
    WriteString(ASeccion, 'Destinatario', Listados[Selected].ValoresFax.RazonSocial);
    WriteString(ASeccion, 'Destino', '9,,');
    WriteString(ASeccion, 'Aviso', 'True');
  finally
    Free;
  end;
  acPrint.Execute;
  Resultado := Resultado + [rFax];
end;

procedure TfrmVisualizador.acExportXLSExecute(Sender: TObject);
var
  AFilter: TQRExportFilter;
  sFileName: String;
begin
  AFilter := nil;

  with SaveDialog do
  try
    Title      := 'Exportación del Reporte';
    DefaultExt := 'xls';
    Filter     := 'Documento de Excel (*.xls)|*.xls';
    Options    := [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware,
                   ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoDereferenceLinks,
                   ofEnableIncludeNotify];
    if Execute then
      if FileExists(FileName) then
      begin
        if MsgAsk(Format('¿ Desea reemplazar el archivo %s ?', [SaveDialog.FileName])) then
        begin
          DeleteFile(SaveDialog.FileName);
          sFileName := ExtractFileName(ChangeFileExt(SaveDialog.FileName, '')) + '.' + SaveDialog.DefaultExt;
          AFilter := TQRXLSFilter.Create(sFileName);
          Listados[Selected].Report.ExportToFilter(AFilter);
          Resultado := Resultado + [rExportaPDF];
        end;
      end
      else
      begin
        sFileName := ExtractFileName(ChangeFileExt(SaveDialog.FileName, '')) + '.' + SaveDialog.DefaultExt;
        AFilter := TQRXLSFilter.Create(sFileName);
        Listados[Selected].Report.ExportToFilter(AFilter);
        Resultado := Resultado + [rExportaPDF];
      end;
  finally
    AFilter.Free;
  end;
end;

procedure TfrmVisualizador.EjecutarEvento(aObjeto: TObject; aMetodo: String);
var
  aExec: TProcedureParameter;
  aRoutine: TMethod;
begin
  aRoutine.Data := Pointer(aObjeto);
  if aMetodo <> '' then
  begin
    aRoutine.Code := Listados[Selected].Report.MethodAddress(aMetodo);
    if not Assigned(aRoutine.Code) then
      Exit;

    aExec := TProcedureParameter(aRoutine);
    aExec;
  end;
  
end;

procedure TfrmVisualizador.TimerZoomTimer(Sender: TObject);
begin
  TimerZoom.Enabled := False;
  qrPreview.Zoom := 100;
end;

end.
