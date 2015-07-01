{***** --------------------------------------------------------------- ******
       LISTADO DENUNCIA DE SINIESTROS (Nº 6 en la Tabla CLI_LIBROS) * Part *
       CONST NroListado = 6;
}
unit unRptRegDenunciasSini;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptRegDenunciasSini = class(TQuickRep)
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    sdqReporte: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
     N_Folio_Inicio:Cardinal;
     N_Folio:Cardinal;
     iPeriodoaInsertar:Integer;
     sPeriodo:string;
  public
     constructor Create(TOwner:TComponent); override;
     function GetPeriodo(): string;
  end;

var
  rptRegDenunciasSini: TrptRegDenunciasSini;

const
  NroListado = 6;

implementation

uses
  unDmPrincipal, General, StrFuncs, unConcBanc;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TrptRegDenunciasSini.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio:= N_Folio + 1;
  Value:=inttostr(N_Folio);
end;
{------------------------------------------------------------------------------}
constructor TrptRegDenunciasSini.Create(TOwner: TComponent);
var
  nNroPeriodoFolio : TNroPeriodoFolio;
begin
  inherited;
  nNroPeriodoFolio   := GetNroFolio( NroListado, tbPart );
  iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
  sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
  N_Folio_Inicio     := nNroPeriodoFolio.NumeroFolioInicio;
  N_Folio            := nNroPeriodoFolio.NumeroFolio;
end;
{------------------------------------------------------------------------------}
procedure TrptRegDenunciasSini.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar>0 then
    EjecutarSQL('UPDATE CLI_LIBROS SET LI_ULTPAGINA = ' + IntToStr(N_Folio) + ' WHERE LI_CODIGO = '+ IntToStr( NroListado ) +' AND LI_PERIODO = ' + IntToStr(iPeriodoaInsertar) );
end;
{------------------------------------------------------------------------------}
procedure TrptRegDenunciasSini.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value:=sPeriodo;
end;
{------------------------------------------------------------------------------}
procedure TrptRegDenunciasSini.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio:=N_Folio_Inicio;
end;
{------------------------------------------------------------------------------}
function TrptRegDenunciasSini.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{------------------------------------------------------------------------------}
end.
