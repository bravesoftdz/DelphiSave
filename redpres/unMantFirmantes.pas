unit unMantFirmantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, SDEngine,
  Placemnt, ComCtrls, ToolWin, ImgList, SortDlg;

type
  TfrmMantFirmantes = class(TForm)
    ToolBar1: TToolBar;
    tbtnAgregar: TToolButton;
    tbtnModificar: TToolButton;
    tbtnEliminar: TToolButton;
    ToolButton6: TToolButton;
    tbtnPreview: TToolButton;
    tbtnPrint: TToolButton;
    ToolButton7: TToolButton;
    tbtnExit: TToolButton;
    FormPlacement: TFormPlacement;
    sdqFirmantes: TSDQuery;
    dsFirmantes: TDataSource;
    RxdbPrestaciones: TRxDBGrid;
    ScrollBox1: TScrollBox;
    qrFirmantes: TQuickRep;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    tbRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton3: TToolButton;
    SortDialog: TSortDialog;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    PrintDialog: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbtnAgregarClick(Sender: TObject);
    procedure tbtnModificarClick(Sender: TObject);
    procedure tbtnPreviewClick(Sender: TObject);
    procedure tbtnPrintClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbOrdenarClick(Sender: TObject);
    procedure RxdbPrestacionesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbtnEliminarClick(Sender: TObject);
    procedure qrFirmantesBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
  public
  end;

var
  frmMantFirmantes: TfrmMantFirmantes;

implementation

uses unPrincipal, unABMFirmantes;

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  sdqFirmantes.Close;
  frmPrincipal.mnuFirmantes.Enabled := True;
  Action := caFree;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbtnExitClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.FormCreate(Sender: TObject);
begin
  sdqFirmantes.Open;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbtnAgregarClick(Sender: TObject);
var
  frmABMFirmantes :TfrmABMFirmantes;
begin
  frmABMFirmantes := TfrmABMFirmantes.Create( Self );
  Try
    with frmABMFirmantes do
    begin
      Caption           := 'Agregar Firmantes';
      btnAceptar.Tag    := TToolButton( sender ).Tag;
      ShowModal;
    end;
    sdqFirmantes.Refresh;
  finally
    frmABMFirmantes.Free;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbtnModificarClick(Sender: TObject);
var
  frmABMFirmantes :TfrmABMFirmantes;
begin
   frmABMFirmantes := TfrmABMFirmantes.Create(Self);
   try
     with frmABMFirmantes do
     begin
         Caption           := 'Modificar Firmantes';
         edCodigo.Enabled  := False;
         edUsuario.Enabled := False;
         if sdqFirmantes.FieldByName('df_fbaja').IsNull then
             btnAceptar.Tag       := 2   // Modifico los Firmantes Activos
         else begin
             btnAceptar.Tag       := 3;   // Modifico los Firmantes dados de baja (osea los vuelvo a dar de alta)
             edTipoNroDoc.Enabled := False;
             edCaracter.Enabled   := False;
         end;

         edCodigo.Text     := sdqFirmantes.FieldByName('df_CodFirma').AsString;
         edUsuario.Text    := sdqFirmantes.FieldByName('df_Usuario').AsString;
         edTipoNroDoc.Text := sdqFirmantes.FieldByName('df_TipoNroDoc').AsString;
         edCaracter.Text   := sdqFirmantes.FieldByName('df_Caracter').AsString;
         if sdqFirmantes.FieldByName('si_Mutual').AsString = 'S' then
            checkEspecial.Checked := True
         else checkEspecial.Checked := False;

         ShowModal;
     end;
     sdqFirmantes.Refresh;
   finally
     frmABMFirmantes.Free;
   end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbtnEliminarClick(Sender: TObject);
var
  frmABMFirmantes :TfrmABMFirmantes;
begin
  frmABMFirmantes := TfrmABMFirmantes.Create( Self );
  Try
    with frmABMFirmantes do
    begin
       Caption := 'Eliminar Firmantes';
       btnAceptar.Tag := 4;

       edCodigo.Text     := sdqFirmantes.FieldByName('df_CodFirma').AsString;
       edUsuario.Text    := sdqFirmantes.FieldByName('df_Usuario').AsString;
       edTipoNroDoc.Text := sdqFirmantes.FieldByName('df_TipoNroDoc').AsString;
       edCaracter.Text   := sdqFirmantes.FieldByName('df_Caracter').AsString;

       If sdqFirmantes.FieldByName('si_Mutual').AsString = 'S' Then
            checkEspecial.Checked := True
       else checkEspecial.Checked := False;

       edCodigo.Enabled      := False;
       edUsuario.Enabled     := False;
       edTipoNroDoc.Enabled  := False;
       edCaracter.Enabled    := False;
       checkEspecial.Enabled := False;
       ShowModal;
    end;
       sdqFirmantes.Refresh;
  finally
    frmABMFirmantes.Free;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbtnPreviewClick(Sender: TObject);
begin
  qrFirmantes.PreviewModal;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbtnPrintClick(Sender: TObject);
begin
  if PrintDialog.Execute then qrFirmantes.Print;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbRefrescarClick(Sender: TObject);
var
  Sql : String;
begin
   sdqFirmantes.Close;
   Sql := ' Select df_codfirma, df_usuario, df_TipoNroDoc, df_Caracter, ' +
          ' SubStr(df_Especial,6,1) Si_Mutual, df_fBaja ' +
          ' From cdf_FirmasCartasDoc ' + SortDialog.OrderBy ;
   sdqFirmantes.SQL.Text := Sql ;
   sdqFirmantes.Open;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
   if Key = 116 Then tbRefrescarClick(Nil);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.RxdbPrestacionesGetCellParams(Sender: TObject;Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqFirmantes.FieldByName('DF_FBAJA').IsNull then
      AFont.Color := clRed;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantFirmantes.qrFirmantesBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_PART');
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.
