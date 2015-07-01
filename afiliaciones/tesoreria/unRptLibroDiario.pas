unit unRptLibroDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, Qrctrls, QuickRpt, ExtCtrls;

type
  TfrmRptLibroDiario = class(TForm)
    rptLibroDiario: TQuickRep;
    QRBand2: TQRBand;
    QRLabel17: TQRLabel;
    sumaDebito: TQRExpr;
    SumaCredito: TQRExpr;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrlProvinciaART: TQRLabel;
    QRComposite: TQRCompositeReport;
    rptPlanCta: TQuickRep;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrGupoCta: TQRGroup;
    QRExpr3: TQRExpr;
    sdqPlanCta: TSDQuery;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRBand5: TQRBand;
    QRLabel30: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRCompositeAddReports(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rptLibroDiarioAfterPrint(Sender: TObject);
    procedure rptLibroDiarioBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rptPlanCtaAfterPrint(Sender: TObject);
    procedure QRLabel30Print(sender: TObject; var Value: String);
  private
     N_Folio_Inicio:Cardinal;
     N_Folio:Cardinal;
     iPeriodoaInsertar:Integer;
     sPeriodo:String;
  public
     function GetPeriodo() :String;
  end;
{
var
   frmRptLibroDiario: TfrmRptLibroDiario;
}
CONST NroListado = 3;

implementation

uses unDmPrincipal, General, strfuncs, unConcBanc, unDmFinancials;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.FolioPrint(sender: TObject; var Value: String);
begin
     N_Folio   := N_Folio + 1;
     Value     := inttostr(N_Folio);
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmRptLibroDiario.PeriodoPrint(sender: TObject;  var Value: String);
begin
     Value:=sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.QRDBText7Print(sender: TObject; var Value: String);
begin
     Value := FormatFloat( '#,##0.00', StrToFloat( Nvl(Value, '0') ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.QRDBText8Print(sender: TObject; var Value: String);
begin
     Value := FormatFloat( '#,##0.00', StrToFloat( Nvl(Value, '0') ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.QRCompositeAddReports(Sender: TObject);
begin
     QRComposite.Reports.Add( rptLibroDiario );
     QRComposite.Reports.Add( rptPlanCta );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.FormCreate(Sender: TObject);
var
    nNroPeriodoFolio : TNroPeriodoFolio;
begin
    nNroPeriodoFolio   := GetNroFolio( NroListado, tbFinancials );
    iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
    sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
    N_Folio_Inicio     := nNroPeriodoFolio.NumeroFolioInicio;
    N_Folio            := nNroPeriodoFolio.NumeroFolio;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.rptLibroDiarioAfterPrint(Sender: TObject);
begin
//   if iPeriodoaInsertar > 0 then
//      dmFinancials.EjecutarSql('update cli_libros set Li_Ultpagina=' + inttostr(N_Folio) + ' where Li_codigo = '+ IntToStr( NroListado ) +' and Li_Periodo = '+ inttostr(iPeriodoaInsertar) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.rptLibroDiarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     N_Folio:= N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRptLibroDiario.GetPeriodo: String;
begin
     Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.rptPlanCtaAfterPrint(Sender: TObject);
begin
   if iPeriodoaInsertar > 0 then
      dmFinancials.EjecutarSql('update cli_libros set Li_Ultpagina=' + inttostr(N_Folio) + ' where Li_codigo = '+ IntToStr( NroListado ) +' and Li_Periodo = '+ inttostr(iPeriodoaInsertar) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptLibroDiario.QRLabel30Print(sender: TObject; var Value: String);
begin
   if iPeriodoaInsertar > 0 then
      dmFinancials.EjecutarSql('update cli_libros set Li_Ultpagina=' + inttostr(N_Folio) + ' where Li_codigo = '+ IntToStr( NroListado ) +' and Li_Periodo = '+ inttostr(iPeriodoaInsertar) );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
