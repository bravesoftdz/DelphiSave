{***** --------------------------------------------------------------- ******
       LISTADO REGISTRO DE SINIESTROS PAGADOS (Nº 11 en la Tabla CLI_LIBROS) Part
       CONST NroListado = 11;
}       
unit unRptPagosFFEP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;
                 
type
  TrptPagosFFEP = class(TQuickRep)
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrdbImporte: TQRDBText;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    SummaryBand1: TQRBand;
    qreTotImporte: TQRExpr;
    qrlTotalesdelMes: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrlProvinciaART: TQRLabel;
    qrlCuit: TQRLabel;
    qrlSedeLegal: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrdbImportePrint(sender: TObject; var Value: String);
    procedure qreTotImportePrint(sender: TObject; var Value: String);
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
  rptPagosFFEP: TrptPagosFFEP;

CONST NroListado = 11;

implementation

uses
  unDmPrincipal, General, StrFuncs, unConcBanc, unArt;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPagosFFEP.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio := N_Folio + 1;
  Value   := IntToStr(N_Folio);
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptPagosFFEP.Create(TOwner: TComponent);
var
  nNroPeriodoFolio : TNroPeriodoFolio;
begin
  inherited;
  nNroPeriodoFolio   := GetNroFolio( NroListado, tbPart );
  iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
  sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
  N_Folio_Inicio     := 0;  // por wf 5716
  // N_Folio            := nNroPeriodoFolio.NumeroFolio;

  qrlProvinciaART.Caption := UPPERCase(TXT_EMP_NOMBRE_LARGO);
  qrlCuit.Caption         := 'CUIT: ' + TXT_EMP_CUITCONFORMATO;
  qrlSedeLegal.Caption    := 'Sede legal: ' + TXT_EMP_DOMICILIO_LEGAL2;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPagosFFEP.QuickRepAfterPrint(Sender: TObject);
begin
  // if iPeriodoaInsertar > 0 then
  //  EjecutarSql('UPDATE CLI_LIBROS SET LI_ULTPAGINA=' + inttostr(N_Folio) + ' WHERE LI_CODIGO = '+ IntToStr( NroListado ) + ' AND LI_PERIODO = ' + IntToStr(iPeriodoaInsertar) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPagosFFEP.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPagosFFEP.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio := N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptPagosFFEP.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPagosFFEP.qrdbImportePrint(sender: TObject; var Value: String);
begin
  qrdbImporte.Caption := Get_AjusteDecimales(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPagosFFEP.qreTotImportePrint(sender: TObject; var Value: String);
begin
  qreTotImporte.Caption := Get_AjusteDecimales(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

