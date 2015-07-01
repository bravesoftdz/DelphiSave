unit unPrincipal;

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Menus, ToolWin, ComCtrls, StdCtrls, ImgList, artSeguridad, artDbLogin,
  Placemnt, Login, ExtCtrls, RxGIF, FormPanel;

  Procedure MostrarEstado (Const Parrafo : String);

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mnuSalir: TMenuItem;
    sbEstado: TStatusBar;
    mnuVentana: TMenuItem;
    mnuMaximizar: TMenuItem;
    mnuRestaurar: TMenuItem;
    mnuMinimizar: TMenuItem;
    sep1: TMenuItem;
    mnuCascada: TMenuItem;
    mnuMosaicoHorizontal: TMenuItem;
    mnuMosaicoVertical: TMenuItem;
    mnuOrganizarIconos: TMenuItem;
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    ilSingleImages: TImageList;
    ilColor: TImageList;
    ilByN: TImageList;
    mnuConciliacion: TMenuItem;
    mnuConcImpArch: TMenuItem;
    mnuConcManual: TMenuItem;
    Contable1: TMenuItem;
    mnuImpresindeLibros: TMenuItem;
    mnuLibroDiario: TMenuItem;
    mnuSubDiarioEmision: TMenuItem;
    mnuSubDiarioCobranza: TMenuItem;
    mnuSubDiarioAmortizacion: TMenuItem;
    mnuSubDiaroRecupero: TMenuItem;
    mnuRegDenunciasSini: TMenuItem;
    mnuRegSiniestroRecupReaseg: TMenuItem;
    mnuGenerrarTABLAS: TMenuItem;
    FormPanel: TFormPanel;
    lbPROCESO: TLabel;
    Animate: TAnimate;
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuMaximizarClick(Sender: TObject);
    procedure mnuRestaurarClick(Sender: TObject);
    procedure mnuMinimizarClick(Sender: TObject);
    procedure mnuCascadaClick(Sender: TObject);
    procedure mnuMosaicoHorizontalClick(Sender: TObject);
    procedure mnuMosaicoVerticalClick(Sender: TObject);
    procedure mnuOrganizarIconosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLoginLogin(Sender: TObject);
    procedure mnuConcImpArchClick(Sender: TObject);
    procedure mnuConcManualClick(Sender: TObject);
    procedure mnuSubDiarioEmisionClick(Sender: TObject);
    procedure mnuSubDiarioCobranzaClick(Sender: TObject);
    procedure mnuLibroDiarioClick(Sender: TObject);
    procedure mnuSubDiarioAmortizacionClick(Sender: TObject);
    procedure mnuSubDiaroRecuperoClick(Sender: TObject);
    procedure mnuRegDenunciasSiniClick(Sender: TObject);
    procedure mnuRegSiniestroRecupReasegClick(Sender: TObject);
    procedure mnuGenerrarTABLASClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
  public

  end;

var
  frmPrincipal : TfrmPrincipal;
  iIndex       : Integer;
  sNombreQRP   : String;
  sPediodoRPT  : String;

implementation

uses unDmPrincipal, unImportacion, unConsConciliacion, General,
     unRptConciliarGastos, unRptSubDiarioEmision, unRptSubDiarioCobranzas,
     unRptSubDiarioAmortizacion, unRptSubDiaroRecupero,
     unRptRegDenunciasSini, unRptRegSiniestroRecupReaseg, unRptLibroDiario,
     Printers, unConcBanc, unLibroDiario, unRegDenunciasSini, unGeneracionTABLAS,
     unControlCarga_CuentasBancarias;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
Procedure MostrarEstado (Const Parrafo : String);
begin
     frmPrincipal.sbEstado.SimpleText := Parrafo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMaximizarClick(Sender: TObject);
begin
     WindowState := wsMaximized;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuRestaurarClick(Sender: TObject);
begin
     WindowState := wsNormal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMinimizarClick(Sender: TObject);
begin
     WindowState := wsMinimized;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuCascadaClick(Sender: TObject);
begin
     Cascade;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
     TileMode  := tbHorizontal;
     Tile;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
     TileMode  := tbVertical;
     Tile;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
     ArrangeIcons ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     //Setea los Formatos de la Configuración Regional para la Aplicación
     Application.UpdateFormatSettings := False;
     CurrencyString    := '$';
     DecimalSeparator  := ',';
     ThousandSeparator := '.';
     DateSeparator     := '/';
     TimeSeparator     := ':';
     ShortTimeFormat   := 'H:mm:ss';
     LongTimeFormat    := 'H:mm:ss';
     ShortDateFormat   := 'dd/mm/yyyy';
     Animate.ResName   := 'CLOCK';

     Caption := Application.Title + ' - ' + DBLogin.Usuario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
     Seguridad.Ejecutar ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuConcImpArchClick(Sender: TObject);
begin
   TfrmImportacion.Create( Self );
   mnuConcImpArch.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuConcManualClick(Sender: TObject);
begin
  TfrmConsConciliacion.Create( Self );
  mnuConcManual.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------
SUBDIARIO DE EMISION  (NroListado = 1)
}
procedure TfrmPrincipal.mnuSubDiarioEmisionClick(Sender: TObject);
Var  rptSubDiarioEmision : TrptSubDiarioEmision;
begin
  rptSubDiarioEmision := TrptSubDiarioEmision.Create( Self );
  try
      Animate.Active := True;
      FormPanel.ShowOnTop;
      Application.ProcessMessages;
    rptSubDiarioEmision.sdqReporte.Open;
      FormPanel.Close ;
      Animate.Active := False;
    if rptSubDiarioEmision.sdqReporte.IsEmpty  then
       MsgBox('No se encontraron datos para la selección actual')
    else begin
         sPediodoRPT := rptSubDiarioEmision.GetPeriodo;
         sNombreQRP := 'SubDiarioEmision';
         SetNombrePDF( sNombreQRP, sPediodoRPT );
         iIndex := GetPrinterPDF( );
         if iIndex = -1 then begin
            MsgBox('No se encontro la Impresora PDF');
            Abort;
         end;
         rptSubDiarioEmision.PrinterSettings.PrinterIndex := iIndex;
         rptSubDiarioEmision.Print;
    end;
  finally
    rptSubDiarioEmision.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------
SUBDIARIO DE COBRANZA (NroListado = 2)
}
procedure TfrmPrincipal.mnuSubDiarioCobranzaClick(Sender: TObject);
Var  rptSubDiarioCobranzas : TrptSubDiarioCobranzas;
begin
  rptSubDiarioCobranzas := TrptSubDiarioCobranzas.Create( Self );
  try
      Animate.Active := True;
      FormPanel.ShowOnTop;
      Application.ProcessMessages;
    rptSubDiarioCobranzas.sdqReporte.Open;
      FormPanel.Close ;
      Animate.Active := False;
    if rptSubDiarioCobranzas.sdqReporte.IsEmpty  then
       MsgBox('No se encontraron datos para la selección actual')
    else begin
         sPediodoRPT := rptSubDiarioCobranzas.GetPeriodo;
         sNombreQRP := 'SubDiarioCobranza';
         SetNombrePDF( sNombreQRP, sPediodoRPT );
         iIndex := GetPrinterPDF( );
         if iIndex = -1 then begin
            MsgBox('No se encontro la Impresora PDF');
            Abort;
         end;
         rptSubDiarioCobranzas.PrinterSettings.PrinterIndex := iIndex;
         rptSubDiarioCobranzas.Print;
    end;
  finally
    rptSubDiarioCobranzas.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------
LIBRO DIARIO (NroListado = 3)
}
procedure TfrmPrincipal.mnuLibroDiarioClick(Sender: TObject);
begin
     // Es necesario ingresar el Periodo cerrado contablemente.
     frmLibroDiario := TfrmLibroDiario.Create( Self );
     frmLibroDiario.ShowModal;
end;

{----------------------------------------------------------------------------------------------------------------------
SUBDIARIO DE AMORTIZACIONES       (NroListado = 4)
}
procedure TfrmPrincipal.mnuSubDiarioAmortizacionClick(Sender: TObject);
begin
  rptSubDiarioAmortizacion := TrptSubDiarioAmortizacion.Create( Self );
  try
    Animate.Active := True;
    FormPanel.ShowOnTop;
    Application.ProcessMessages;
    rptSubDiarioAmortizacion.sdqReporte.Open;
    FormPanel.Close ;
    Animate.Active := False;
    if rptSubDiarioAmortizacion.sdqReporte.IsEmpty  then
       MsgBox('No se encontraron datos para la selección actual')
    else begin
         sPediodoRPT := rptSubDiarioAmortizacion.GetPeriodo;
         sNombreQRP := 'SubDiarioAmortizacion';
         SetNombrePDF( sNombreQRP, sPediodoRPT );
         iIndex := GetPrinterPDF( );
         if iIndex = -1 then begin
            MsgBox('No se encontro la Impresora PDF');
            Abort;
         end;
         rptSubDiarioAmortizacion.PrinterSettings.PrinterIndex := iIndex;
         rptSubDiarioAmortizacion.Print;
    end;
  finally
    rptSubDiarioAmortizacion.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------
SUBDIARIO DE RECUPERO de DEUDORES por PREMIOS  (NroListado = 5)
}
procedure TfrmPrincipal.mnuSubDiaroRecuperoClick(Sender: TObject);
begin
  rptSubDiaroRecupero := TrptSubDiaroRecupero.Create( Self );
  try
      Animate.Active := True;
      FormPanel.ShowOnTop;
      Application.ProcessMessages;
      rptSubDiaroRecupero.sdqReporte.Open;
      FormPanel.Close ;
      Animate.Active := False;
//Solo para imprimir el 1. rptSubDiaroRecupero.PreviewModal;
    if rptSubDiaroRecupero.sdqReporte.IsEmpty  then
       MsgBox('No se encontraron datos para la selección actual')
    else begin
         sPediodoRPT := rptSubDiaroRecupero.GetPeriodo;
         sNombreQRP := 'SubDiarioRecupero';
         SetNombrePDF( sNombreQRP, sPediodoRPT );
         iIndex := GetPrinterPDF( );
         if iIndex = -1 then begin
            MsgBox('No se encontro la Impresora PDF');
            Abort;
         end;
         rptSubDiaroRecupero.PrinterSettings.PrinterIndex := iIndex;
         rptSubDiaroRecupero.Print;
    end;
  finally
    rptSubDiaroRecupero.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------
REGISTRO DE DENUNCIAS DE SINIESTROS  (NroListado = 6)
}
procedure TfrmPrincipal.mnuRegDenunciasSiniClick(Sender: TObject);
begin
     // Solicita una fecha desde - hasta.
     frmRegDenunciasSini := TfrmRegDenunciasSini.Create( Self );
     frmRegDenunciasSini.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------
REGISTRO DE SINIESTRO RECUPEROS Y REASEGUROS ( NroListado = 7 )
}
procedure TfrmPrincipal.mnuRegSiniestroRecupReasegClick(Sender: TObject);
begin
  rptRegSiniestroRecupReaseg := TrptRegSiniestroRecupReaseg.Create( Self );
  try
      Animate.Active := True;
      FormPanel.ShowOnTop;
      Application.ProcessMessages;
    rptRegSiniestroRecupReaseg.sdqReporte.Open;
      FormPanel.Close ;
      Animate.Active := False;
    if rptRegSiniestroRecupReaseg.sdqReporte.IsEmpty  then
       MsgBox('No se encontraron datos para la selección actual')
    else begin
         sPediodoRPT := rptRegSiniestroRecupReaseg.GetPeriodo;
         sNombreQRP := 'SiniestrosRecReAseg';
         SetNombrePDF( sNombreQRP, sPediodoRPT );
         iIndex := GetPrinterPDF( );
         if iIndex = -1 then begin
            MsgBox('No se encontro la Impresora PDF');
            Abort;
         end;
         rptRegSiniestroRecupReaseg.PrinterSettings.PrinterIndex := iIndex;
         rptRegSiniestroRecupReaseg.Print;
    end;
  finally
    rptRegSiniestroRecupReaseg.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuGenerrarTABLASClick(Sender: TObject);
begin
     frmGeneracionTABLAS := TfrmGeneracionTABLAS.Create( Self );
     frmGeneracionTABLAS.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormClick(Sender: TObject);
begin
  if frmPrincipal.DBLogin.perfil='COMPUTOS' then  // hasta que se sepa en dónde va esta opción...
    with TfrmControlCarga_CuentasBancarias.Create( Self ) do
      FormStyle := fsMDIChild;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
