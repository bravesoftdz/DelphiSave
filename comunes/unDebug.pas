unit unDebug;

{$IFDEF DEBUG}
  {$DEFINE DEBUG_ACTIVE}
{$ELSE}
  {$IFNDEF PAQUETE}
    {$DEFINE DEBUG_ACTIVE}
  {$ENDIF}
{$ENDIF}

interface

uses
  {$IFDEF VER150}
  Placemnt,
  {$ELSE}
  rxPlacemnt,
  {$ENDIF}

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ImgList, ActnList, Menus, XPMenu,
  ComCtrls, RxNotify, RxMenus, RXCtrls, ExtCtrls, JvExControls, JvComponent, JvXPCore, JvXPButtons, StdCtrls,
  JvExExtCtrls, JvSplitter, Grids, DBGrids, DB;

const
  CANTIDAD_TECLAS = 3;
  strTrue  = 'True';
  strFalse = 'False';

type
  TLogType = (ltError, ltWarning, ltHint, ltInfo, ltSQL);

  TfrmDebug = class(TForm)
    mnuVisualizadorMain: TMainMenu;
    mnuDebug: TMenuItem;
    mnuConfigurarImpresora: TMenuItem;
    mnuImprimir: TMenuItem;
    N4: TMenuItem;
    mnuCerrar: TMenuItem;
    ActionList: TActionList;
    acFirst: TAction;
    acPrior: TAction;
    acNext: TAction;
    acLast: TAction;
    acPrinterSetup: TAction;
    acPrint: TAction;
    acExit: TAction;
    ImageList: TImageList;
    HotImageList: TImageList;
    DisabledImageList: TImageList;
    XPMenu: TXPMenu;
    FormStorage: TFormStorage;
    N1: TMenuItem;
    mnuNivel3: TMenuItem;
    mnuNivel2: TMenuItem;
    mnuNivel1: TMenuItem;
    mnuNivel4: TMenuItem;
    mnuNivel5: TMenuItem;
    FolderMonitor: TRxFolderMonitor;
    mnuPopup: TPopupMenu;
    mnuEliminar: TMenuItem;
    mnuEliminarTodo: TMenuItem;
    imgPopup: TImageList;
    mnuCopiarAlPortapapeles: TMenuItem;
    mnuVerMsg: TMenuItem;
    pnlBottom: TPanel;
    N2: TMenuItem;
    mnuActivacion: TMenuItem;
    pgPaginas: TPageControl;
    tsInfo: TTabSheet;
    tsConsultas: TTabSheet;
    splDivisor: TJvSplitter;
    lvVisualizador: TListView;
    edTexto: TMemo;
    pnlDerecha: TPanel;
    lbExe: TLabel;
    Calendario: TMonthCalendar;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    CheckListBox: TRxCheckListBox;
    Panel1: TPanel;
    btnAbrirExe: TJvXPButton;
    lbConsultas: TListBox;
    dbgGrid: TDBGrid;
    dsAcceso: TDataSource;
    mnuNoVisible: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acExitExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acPrinterSetupExecute(Sender: TObject);
    procedure UpdateRegistrySettings(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FolderMonitorChange(Sender: TObject);
    procedure mnuEliminarClick(Sender: TObject);
    procedure mnuEliminarTodoClick(Sender: TObject);
    procedure CheckListBoxClickCheck(Sender: TObject);
    procedure mnuCopiarAlPortapapelesClick(Sender: TObject);
    procedure btnAbrirExeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbConsultasClick(Sender: TObject);
    procedure mnuVerMsgClick(Sender: TObject);
    procedure lvVisualizadorChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure mnuActivacionClick(Sender: TObject);
    procedure mnuDebugClick(Sender: TObject);
    procedure mnuNoVisibleClick(Sender: TObject);
  private
    procedure CargarDatos;
  end;

  TDebugger = class
  private
    FActiveForm: TCustomForm;
    Indice: ShortInt;
    Teclas: Array [0..CANTIDAD_TECLAS - 1] of Byte;
  protected
    function ComparaVectoresByte(v1, v2: Array of Byte): Boolean;
  public
    constructor Create;
    destructor  Destroy; override;

    procedure   HandleException(Sender: TObject; E: Exception);
    procedure   HandleShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure   OpenDebug;
  end;

function GetNombreArchivoLOG(dFecha: TDateTime): String;
function LogHabilitado(TipoMensaje: TLogType): Boolean;

procedure AddToLog(sMensaje: String; TipoMensaje: TLogType);
procedure ActivarLog;
procedure OpenDebug;

implementation

uses
  Registry, IniFiles, ArchFuncs, General, Clipbrd, StrFuncs, unDmPrincipal,
  VCLExtra, unDebGrid;

const
  MensajesMemoria: Array[0..4] of String = ('Sistema sin recursos',
                                            'Out of system resources',
                                            'El lienzo no permite dibujar',
                                            'Canvas does not allow drawing',
                                            'El parámetro no es correcto');
{$R *.DFM}

var
  ADebugFileName: String;
{$IFDEF DEBUG_ACTIVE}
  objDebugger: TDebugger;
{$ENDIF}  
  frmDebug: TfrmDebug;
  RegFile: TRegIniFile;
  IniFileReader, IniFileWriter: TIniFile;
  DISPARA_DEBUG: Array [0..CANTIDAD_TECLAS - 1] of Byte;

procedure AddToLog(sMensaje: String; TipoMensaje: TLogType);
var
  sTipoMensaje: String;
begin
  if LogHabilitado(TipoMensaje) then
  begin
    case TipoMensaje of
      ltError   : sTipoMensaje := 'Errores';
      ltWarning : sTipoMensaje := 'Advertencias';
      ltHint    : sTipoMensaje := 'Sugerencias';
      ltInfo    : sTipoMensaje := 'Información';
      ltSQL     : sTipoMensaje := 'Consultas SQL';
    end;

    sMensaje := StringReplace(sMensaje, #10, ' ', [rfReplaceAll]);
    sMensaje := StringReplace(sMensaje, #13, ' ', [rfReplaceAll]);

    IniFileWriter.WriteString(sTipoMensaje, FormatDateTime('hh:mm:ss:zzz', Now), sMensaje);
  end;
end;

function GetNombreArchivoLOG(dFecha: TDateTime): String;
var
  sDirectorio: String;
begin
  sDirectorio := TempPath + '/Logs/';
  ForceDirectories(sDirectorio);
  Result := sDirectorio + ChangeFileExt(ExtractFileName(ChangeFileExt(ADebugFileName, '')) + FormatDateTime(' yyyy-mm-dd', dFecha), '.log')
end;

procedure SetDebugFileName(AFileName: String);
begin
  ADebugFileName := AFileName;
  RegFile := TRegIniFile.Create('SOFTWARE\' + ChangeFileExt(ExtractFileName(ADebugFileName), ''));

  if Assigned(frmDebug) then
  begin
    frmDebug.lbExe.Caption := ExtractFileName(ADebugFileName);
    frmDebug.CalendarioClick(nil);
  end;
end;

procedure ActivarLog;
var
  i: Integer;
begin
  dmPrincipal.Debug := True;

  for i := 1 to 5 do
    RegFile.WriteString('TfrmDebug', 'mnuNivel' + IntToStr(i) + '_Checked', strTrue);
end;

procedure DesactivarLog;
var
  i: Integer;
begin
  for i := 1 to 5 do
    RegFile.WriteString('TfrmDebug', 'mnuNivel' + IntToStr(i) + '_Checked', strFalse);
end;

procedure OpenDebug;
begin
{$IFDEF DEBUG_ACTIVE}
  objDebugger.OpenDebug;
{$ENDIF}
end;

function LogHabilitado(TipoMensaje: TLogType): Boolean;
var
  nMenu: Byte;
begin
  nMenu := 0;

  case TipoMensaje of
    ltError   : nMenu := 1;
    ltWarning : nMenu := 2;
    ltHint    : nMenu := 3;
    ltInfo    : nMenu := 4;
    ltSQL     : nMenu := 5;
  end;

  // 1 - Errores
  // 2 - Advertencias
  // 3 - Sugerencias
  // 4 - Información
  // 5 - Consultas SQL

  if Assigned(RegFile) then
    Result := RegFile.ReadString('TfrmDebug', 'mnuNivel' + IntToStr(nMenu) + '_Checked', strFalse) = strTrue
  else
    Result := False;
end;

{ TDebugger }

function TDebugger.ComparaVectoresByte(v1, v2: Array of Byte): Boolean;
var
  Pos1, Pos2, nCoincidencias: Byte;
  lCoincidencias: TList;
begin
  Result := False;
  nCoincidencias := 0;
  lCoincidencias := TList.Create;
  if Length(v1) <> Length(v2) then
    Exit;

  for Pos1 := 0 to CANTIDAD_TECLAS - 1 do
    for Pos2 := Low(v1) to High(v1) do
    begin
      if (v1[Pos2] = v2[Pos1]) and not(lCoincidencias.IndexOf(Pointer(v2[Pos1])) <> -1) then
      begin
        Inc(nCoincidencias);
        lCoincidencias.Add(Pointer(v2[Pos1]));
      end;
    end;

  if nCoincidencias = CANTIDAD_TECLAS then
    Result := True;
end;

constructor TDebugger.Create;
begin
  inherited;
  Indice := -1;
  DISPARA_DEBUG[0] := 16  {Left Shift};
  DISPARA_DEBUG[1] := 17  {Left Ctrl};
  DISPARA_DEBUG[2] := 123 {F12};

  DeleteFile(GetNombreArchivoLOG(Now));
end;

destructor TDebugger.Destroy;
begin
  inherited;
end;

procedure TDebugger.HandleException(Sender: TObject; E: Exception);
begin
  AddToLog(E.Message, TLogType(ltError));

  if AreIn(E.Message, MensajesMemoria, -1, True) then
    E.Message := 'Error de sistema - ' + Application.Title +
                 IIF(E.Message = '', '', #13#13#10 + E.Message + '.') + #13#10 +
                 'Cierre una o mas ventanas o aplicaciones para poder continuar.';

  if not (E.ClassType = EInvalidOperation) then
    MessageDlg(E.Message, mtError, [mbOK], 0);
  inherited;
end;

procedure TDebugger.HandleShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  Indice := (Indice + 1) mod CANTIDAD_TECLAS;
  Teclas[Indice] := Msg.CharCode;
  if ComparaVectoresByte(Teclas, DISPARA_DEBUG) then
  begin
    Teclas[0] := 0;
    Teclas[1] := 0;
    Teclas[2] := 0;
    OpenDebug;
  end;
end;

procedure TDebugger.OpenDebug;
begin
  FActiveForm := Screen.ActiveForm;
  if not Assigned(frmDebug) or not (frmDebug is TForm) then
  begin
    frmDebug := TfrmDebug.Create(Application.Mainform);
    if Assigned(Screen.ActiveForm) then //and (Screen.ActiveForm.FormStyle <> fsMDIChild) then
      frmDebug.ShowModal
//    else
//      frmDebug.FormStyle := fsNormal;
  end
  else
  try
    if Assigned(frmDebug) then
      frmDebug.BringToFront;
  except
  	frmDebug := TfrmDebug.Create(Application.Mainform);
    if Assigned(Screen.ActiveForm) then //and (Screen.ActiveForm.FormStyle <> fsMDIChild) then
      frmDebug.ShowModal
//    else
//      frmDebug.FormStyle := fsNormal;
  end;
end;

procedure TfrmDebug.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FolderMonitor.Active := False;
  Action := caFree;
end;

procedure TfrmDebug.CargarDatos;
var
  NuevoItem: TListItem;
  nSeccion, nIdentificador: integer;
  tslSecciones, tslIdentificadores: TStringList;
  sValor: String;
  {$IFDEF DEBUG_ACTIVE}
  i: Integer;
  {$ENDIF}
begin
  lbConsultas.Items.Clear;
  {$IFDEF DEBUG_ACTIVE}
  if Assigned(objDebugger.FActiveForm) then
  with objDebugger.FActiveForm do
  try
    for i := 0 to ComponentCount - 1 do
      if Components[i].InheritsFrom(TDataSet) then
        lbConsultas.Items.add((TDataSet(Components[i]).Name));
  except
  end;
  {$ENDIF}

  lvVisualizador.Items.Clear;
  tslSecciones := TStringList.Create;
  tslIdentificadores := TStringList.Create;

  try
    IniFileReader.ReadSections(tslSecciones);

    for nSeccion := 0 to tslSecciones.Count - 1 do
    begin
      IniFileReader.ReadSection(tslSecciones[nSeccion], tslIdentificadores);

      if not CheckListBox.Checked[CheckListBox.Items.IndexOf(tslSecciones[nSeccion])] then
        Continue;

      for nIdentificador := 0 to tslIdentificadores.Count - 1 do
      begin
        sValor := IniFileReader.ReadString(tslSecciones[nSeccion], tslIdentificadores[nIdentificador], '');

        NuevoItem := lvVisualizador.Items.Add;
        NuevoItem.Caption := tslIdentificadores[nIdentificador];
        NuevoItem.SubItems.Add(tslSecciones[nSeccion]);
        NuevoItem.SubItems.Add(sValor);
        NuevoItem.ImageIndex := CheckListBox.Items.IndexOf(tslSecciones[nSeccion]);
      end;
    end;
  finally
    tslSecciones.Free;
    tslIdentificadores.Free;
  end;
end;

procedure TfrmDebug.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDebug.acPrintExecute(Sender: TObject);
begin
//
end;

procedure TfrmDebug.acPrinterSetupExecute(Sender: TObject);
begin
//
end;

procedure TfrmDebug.UpdateRegistrySettings(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  RegFile.WriteString('TfrmDebug', (Sender as TMenuItem).Name + '_Checked', iif((Sender as TMenuItem).Checked, strTrue, strFalse));
end;

procedure TfrmDebug.FormActivate(Sender: TObject);
begin
  CargarDatos;
end;

procedure TfrmDebug.CalendarioClick(Sender: TObject);
begin
  if Assigned(IniFileReader) then
    IniFileReader.Free;
  IniFileReader := TIniFile.Create(GetNombreArchivoLOG(Calendario.Date));
  CargarDatos;
end;

procedure TfrmDebug.FormCreate(Sender: TObject);
begin
  FolderMonitor.FolderName := ExtractFilePath(GetNombreArchivoLOG(Now));
  FolderMonitor.Active := True;
  Calendario.Date := Now;
  pgPaginas.ActivePageIndex := 0;
end;

procedure TfrmDebug.FolderMonitorChange(Sender: TObject);
begin
  CargarDatos;
end;

procedure TfrmDebug.mnuEliminarClick(Sender: TObject);
begin
  IniFileReader.DeleteKey(lvVisualizador.Selected.SubItems[0], lvVisualizador.Selected.Caption);
  CargarDatos;
end;

procedure TfrmDebug.mnuEliminarTodoClick(Sender: TObject);
begin
  DeleteFile(IniFileReader.FileName);
  CargarDatos;
end;

procedure TfrmDebug.CheckListBoxClickCheck(Sender: TObject);
begin
  CargarDatos;
end;

procedure TfrmDebug.mnuCopiarAlPortapapelesClick(Sender: TObject);
begin
  Clipboard.AsText := lvVisualizador.Selected.SubItems[1];
end;

procedure TfrmDebug.btnAbrirExeClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  try
    Filter := 'Archivos ejecutables (*.exe) | *.exe';
    if Execute then
      SetDebugFileName(FileName);
  finally
    Free;
  end;
end;

procedure TfrmDebug.FormShow(Sender: TObject);
begin
  frmDebug := Self;
  SetDebugFileName(GetAppInfo('OriginalFilename'));
end;

procedure TfrmDebug.lbConsultasClick(Sender: TObject);
begin
  {$IFDEF DEBUG_ACTIVE}
  if lbConsultas.ItemIndex > -1 then
    if Assigned(objDebugger.FActiveForm.FindComponent(lbConsultas.Items[lbConsultas.ItemIndex])) then
    begin
      dsAcceso.Dataset := TDataSet(objDebugger.FActiveForm.FindComponent(lbConsultas.Items[lbConsultas.ItemIndex]));
      if Assigned(dbgGrid.DataSource) and Assigned(dbgGrid.DataSource.DataSet) and dbgGrid.DataSource.DataSet.Active then
        VCLExtra.DynColWidthsByData(dbgGrid);
    end;
  {$ENDIF}
end;

procedure TfrmDebug.mnuVerMsgClick(Sender: TObject);
begin
  ShowMessage(lvVisualizador.Selected.SubItems[1]);
end;

procedure TfrmDebug.lvVisualizadorChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  if Change = ctState then
    edTexto.Lines.Text := Item.SubItems[1];
end;

procedure TfrmDebug.mnuActivacionClick(Sender: TObject);
begin
  if (Sender as TMenuItem).Caption = '&Activar' then
    ActivarLog
  else
    DesactivarLog;
end;

procedure TfrmDebug.mnuDebugClick(Sender: TObject);
var
  i: Integer;
  mnuModelo: TMenuItem;
begin
  for i := 1 to 5 do
  begin
    mnuModelo := TMenuItem(FindComponent('mnuNivel' + IntToStr(i)));
    mnuModelo.Checked := RegFile.ReadString('TfrmDebug', mnuModelo.Name + '_Checked', strFalse) = strTrue;
  end;

  if LogHabilitado(ltError) and LogHabilitado(ltWarning) and
     LogHabilitado(ltHint) and LogHabilitado(ltInfo) and
     LogHabilitado(ltSQL) then
    mnuActivacion.Caption := 'Desactivar'
  else
    mnuActivacion.Caption := 'Activar';
end;

procedure TfrmDebug.mnuNoVisibleClick(Sender: TObject);
begin
  TDebGrid.show(nil);
end;

{$IFDEF DEBUG_ACTIVE}
initialization
  objDebugger := TDebugger.Create;
  Application.OnShortCut  := objDebugger.HandleShortCut;
  Application.OnException := objDebugger.HandleException;
  SetDebugFileName(GetAppInfo('OriginalFilename'));
  IniFileReader := TIniFile.Create(GetNombreArchivoLOG(Now));
  IniFileWriter := TIniFile.Create(GetNombreArchivoLOG(Now));
finalization
  if Assigned(IniFileReader) then
    IniFileReader.Free;
  objDebugger.Free;
{$ENDIF}
end.

