{***** --------------------------------------------------------------- ******
       LISTADO SUBDIARIO DE IVA COMPRAS (Nº 12 en la Tabla CLI_LIBROS) Financials
       CONST NroListado = 12;
}
unit unRptSubDiarioIVACompras;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSubDiarioIVACompras = class(TQuickRep)
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr11: TQRExpr;
    QRDBText21: TQRDBText;
    QRLabel33: TQRLabel;
    qrlTotalesdelMes: TQRLabel;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FormatoCampo2(sender: TObject; var Value: String);
  private
     N_Folio_Inicio:Cardinal;
     N_Folio:Cardinal;
     iPeriodoaInsertar:Integer;
     sPeriodo:String;
  public
     Constructor Create (TOwner:TComponent); override;
     Function GetPeriodo() :String;
  end;

var
  rptSubDiarioIVACompras: TrptSubDiarioIVACompras;

CONST NroListado = 12;

implementation

uses
  General, StrFuncs, unConcBanc, unDmFinancials, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioIVACompras.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio := N_Folio + 1;
  Value   := inttostr(N_Folio);
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptSubDiarioIVACompras.Create(TOwner: TComponent);
var
  nNroPeriodoFolio: TNroPeriodoFolio;
begin
  inherited;
  nNroPeriodoFolio   := GetNroFolio( NroListado, tbFinancials );
  iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
  sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
  N_Folio_Inicio     := nNroPeriodoFolio.NumeroFolioInicio;
  N_Folio            := nNroPeriodoFolio.NumeroFolio;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioIVACompras.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar > 0 then
    dmFinancials.EjecutarSql('UPDATE CLI_LIBROS SET LI_ULTPAGINA = ' + inttostr(N_Folio) + ' WHERE LI_CODIGO = '+ SqlValue(IntToStr( NroListado )) +' and LI_PERIODO = '+ SqlValue(inttostr( iPeriodoaInsertar)) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioIVACompras.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioIVACompras.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio := N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptSubDiarioIVACompras.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioIVACompras.FormatoCampo2(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


