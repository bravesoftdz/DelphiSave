unit unScanUtility;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, OleCtrls,
  TwainControlXTrial_TLB, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  StdCtrls, FileCtrl, AcroPDFLib_TLB, ExtCtrls, JvgGroupBox, JvExExtCtrls,
  JvNetscapeSplitter, AdvGlowButton, RxNotify, unArtFrame,
  unFraDigitalizacion, JvgTransparentMemo, FormPanel, IntEdit, Mask,
  PatternEdit;

type
  TfrmScannerUtility = class(TfrmCustomForm)
    Twain: TTwain;
    AcroPDF: TAcroPDF;
    gbFiltros: TJvgGroupBox;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    btnStartScaning: TAdvGlowButton;
    RxFolderMonitor: TRxFolderMonitor;
    pnlArchivos: TPanel;
    FileListBox: TFileListBox;
    pnlClave: TPanel;
    fraDigitalizacion: TfraDigitalizacion;
    Label1: TLabel;
    lbClave: TLabel;
    AdvGlowButton2: TAdvGlowButton;
    edClaveActual: TJvgTransparentMemo;
    frmScan: TFormPanel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FileListBoxChange(Sender: TObject);
    procedure RxFolderMonitorChange(Sender: TObject);
    procedure fraDigitalizacionChange(Sender: TObject);
    procedure btnStartScaningClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure TwainAcquire(Sender: TObject);
    procedure TwainFinish(Sender: TObject);
  end;

var
  frmScannerUtility: TfrmScannerUtility;

implementation

uses ArchFuncs, CustomDlgs, Numeros, StrFuncs;

var
  i: integer; 

{$R *.dfm}

procedure TfrmScannerUtility.FormCreate(Sender: TObject);
begin
  inherited;
  ForceDirectories(IncludeTrailingPathDelimiter(TempPath) + 'Scanner');
  FileListBox.Directory := IncludeTrailingPathDelimiter(TempPath) + 'Scanner';
  RxFolderMonitor.FolderName := FileListBox.Directory;
  RxFolderMonitor.Active := True;
  fraDigitalizacion.OnChange := fraDigitalizacionChange;
end;

procedure TfrmScannerUtility.FileListBoxChange(Sender: TObject);
begin
  inherited;
  if FileExists(FileListBox.FileName) then
    AcroPDF.LoadFile(FileListBox.FileName)
  else
    AcroPDF.LoadFile('');

  AcroPDF.setShowToolbar(False);
end;

procedure TfrmScannerUtility.RxFolderMonitorChange(Sender: TObject);
begin
  inherited;
  FileListBoxChange(Sender);
end;

procedure TfrmScannerUtility.fraDigitalizacionChange(Sender: TObject);
begin
  edClaveActual.Lines.Text := fraDigitalizacion.Clave;
end;

procedure TfrmScannerUtility.btnStartScaningClick(Sender: TObject);
begin
  inherited;
  Verificar(Twain.DeviceCount = 0, btnStartScaning, 'No se ha detectado que Ud. tenga un scanner instalado en su PC.');
  Verificar((Twain.CurrentDevice = -1) and not (Twain.SelectDevice), btnStartScaning, 'No se ha detectado que Ud. tenga un scanner conectado en su PC.');

  Twain.PixelType := ptBW;
  Twain.Resolution := 200;
  frmScan.ShowOnTop;
  Twain.Acquire;
  Twain.AddToPDF(0);
end;

procedure TfrmScannerUtility.AdvGlowButton2Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmScannerUtility.TwainAcquire(Sender: TObject);
begin
  inherited;
  Inc(i);
  Twain.WritePDF(IncludeTrailingPathDelimiter(TempPath) + 'Scanner' + '\' + LPad(i, '0', 4) + '.pdf');
  Twain.ClearPDF;
end;

procedure TfrmScannerUtility.TwainFinish(Sender: TObject);
begin
  inherited;
  frmScan.Close;
end;

end.
