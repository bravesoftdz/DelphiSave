{***** --------------------------------------------------------------- ******
       LISTADO REGISTRO DE COBRANZAS-FFEP (Nº 10 en la Tabla CLI_LIBROS) Part
       CONST NroListado = 10;
}
unit unRptCobranzasFFEP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptCobranzasFFEP = class(TQuickRep)
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand1: TQRBand;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
  rptCobranzasFFEP: TrptCobranzasFFEP;

CONST NroListado = 10;

implementation

uses
  unDmPrincipal, General, StrFuncs, unConcBanc, unArt;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCobranzasFFEP.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio := N_Folio + 1;
  Value   := IntToStr(N_Folio);

  qrlProvinciaART.Caption := UPPERCase(TXT_EMP_NOMBRE_LARGO);
  qrlCuit.Caption         := 'CUIT: ' + TXT_EMP_CUITCONFORMATO;
  qrlSedeLegal.Caption    := 'Sede legal: ' + TXT_EMP_DOMICILIO_LEGAL2;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptCobranzasFFEP.Create(TOwner: TComponent);
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
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCobranzasFFEP.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar>0 then
    EjecutarSql('UPDATE CLI_LIBROS SET LI_ULTPAGINA=' + inttostr(N_Folio) + ' WHERE LI_CODIGO = '+ IntToStr( NroListado ) +' AND LI_PERIODO = ' + IntToStr(iPeriodoaInsertar) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCobranzasFFEP.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCobranzasFFEP.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio := N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptCobranzasFFEP.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCobranzasFFEP.qrdbImportePrint(sender: TObject; var Value: String);
begin
  qrdbImporte.Caption := Get_AjusteDecimales(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCobranzasFFEP.qreTotImportePrint(sender: TObject; var Value: String);
begin
  qreTotImporte.Caption := Get_AjusteDecimales(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

