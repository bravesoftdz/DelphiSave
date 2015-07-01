{***** ----------------------------------------------------------------------- ******
       LISTADO Recupero de Siniestros y Reaseguro (Nº 7 en la Tabla CLI_LIBROS) Real
       CONST NroListado = 7;
}
unit unRptRegSiniestroRecupReaseg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptRegSiniestroRecupReaseg = class(TQuickRep)
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotalesdelMes: TQRLabel;
    qrdCuenta: TQRDBText;
    sdqReporte: TSDQuery;
    qrdPago: TQRDBText;
    qrdConceptoPago: TQRDBText;
    qrdImporte: TQRDBText;
    qrdMontoSiniestro: TQRDBText;
    qrdFechaOcurr: TQRDBText;
    qrdSubPrestador: TQRDBText;
    qrdPrestador: TQRDBText;
    qrdProvincia: TQRDBText;
    qrdCC: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlCta: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    N_Folio_Inicio:Cardinal;
    N_Folio:Cardinal;
    iPeriodoaInsertar:Integer;
    sPeriodo:String;
  public
    constructor Create(TOwner:TComponent); override;
    function GetPeriodo() :String;
  end;

var
  rptRegSiniestroRecupReaseg: TrptRegSiniestroRecupReaseg;

const
  NroListado = 7;

implementation

uses unDmPrincipal, General, StrFuncs, unConcBanc, unDmFinancials;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TrptRegSiniestroRecupReaseg.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio:= N_Folio + 1;
  Value:=inttostr(N_Folio);
end;
{------------------------------------------------------------------------------}
constructor TrptRegSiniestroRecupReaseg.Create(TOwner: TComponent);
var
  nNroPeriodoFolio : TNroPeriodoFolio;
begin
  inherited;
  nNroPeriodoFolio   := GetNroFolio( NroListado, tbFinancials );
  iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
  sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
  N_Folio_Inicio     := nNroPeriodoFolio.NumeroFolioInicio;
  N_Folio            := nNroPeriodoFolio.NumeroFolio;
end;
{------------------------------------------------------------------------------}
procedure TrptRegSiniestroRecupReaseg.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar > 0 then
    dmFinancials.EjecutarSql('UPDATE CLI_LIBROS ' +
                                'SET LI_ULTPAGINA=' + IntToStr(N_Folio) +
                             ' WHERE LI_CODIGO = '+ IntToStr(NroListado) +
                               ' AND LI_PERIODO = ' + IntToStr(iPeriodoaInsertar) );
end;
procedure TrptRegSiniestroRecupReaseg.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value:=sPeriodo;
end;
{------------------------------------------------------------------------------}
procedure TrptRegSiniestroRecupReaseg.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio:=N_Folio_Inicio;
end;
{------------------------------------------------------------------------------}
function TrptRegSiniestroRecupReaseg.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{------------------------------------------------------------------------------}
end.
