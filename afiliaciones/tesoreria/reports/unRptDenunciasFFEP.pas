{***** --------------------------------------------------------------- ******
       LISTADO DE SINIESTROS-FFEP (Nº 9 en la Tabla CLI_LIBROS) * Part *
       CONST NroListado = 9;
}
unit unRptDenunciasFFEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, ImgList, XPMenu,
  Placemnt;

type
  TfrmRptDenunciasFFEP = class(TfrmCustomForm)
    rptDenunciasFFEP: TQuickRep;
    qrbDetalles: TQRBand;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlFolio: TQRLabel;
    qrlSedeLegal: TQRLabel;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    sdqReporte: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    qrlCuit: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure rptDenunciasFFEPAfterPrint(Sender: TObject);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure rptDenunciasFFEPBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
     N_Folio_Inicio:Cardinal;
     N_Folio:Cardinal;
     iPeriodoaInsertar:Integer;
     sPeriodo:string;
  public
     constructor Create(TOwner:TComponent); override;
     function GetPeriodo(): String;
  end;

var
  frmRptDenunciasFFEP: TfrmRptDenunciasFFEP;

const
  NroListado = 9;

implementation

uses
  unConcBanc, unDmPrincipal, unArt;

{$R *.DFM}
{------------------------------------------------------------------------------}
constructor TfrmRptDenunciasFFEP.Create(TOwner: TComponent);
var
  nNroPeriodoFolio : TNroPeriodoFolio;
begin
  inherited;
  nNroPeriodoFolio   := GetNroFolio( NroListado, tbPart );
  iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
  sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
  N_Folio_Inicio     := nNroPeriodoFolio.NumeroFolioInicio;
  N_Folio            := nNroPeriodoFolio.NumeroFolio;

  qrlProvinciaART.Caption := UPPERCase(TXT_EMP_NOMBRE_LARGO);
  qrlCuit.Caption         := 'CUIT: ' + TXT_EMP_CUITCONFORMATO;
  qrlSedeLegal.Caption    := 'Sede legal: ' + TXT_EMP_DOMICILIO_LEGAL2;
end;
{------------------------------------------------------------------------------}
procedure TfrmRptDenunciasFFEP.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio := N_Folio + 1;
  Value   := IntToStr(N_Folio);
end;
{------------------------------------------------------------------------------}
procedure TfrmRptDenunciasFFEP.rptDenunciasFFEPAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar > 0 then
    EjecutarSQL('UPDATE CLI_LIBROS SET LI_ULTPAGINA=' + IntToStr(N_Folio) + ' WHERE LI_CODIGO = '+ IntToStr( NroListado ) +' AND LI_PERIODO = ' + IntToStr(iPeriodoaInsertar) );
end;
{------------------------------------------------------------------------------}
procedure TfrmRptDenunciasFFEP.PeriodoPrint(sender: TObject; var Value: String);
begin
  Value := sPeriodo;
end;
{------------------------------------------------------------------------------}
function TfrmRptDenunciasFFEP.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{------------------------------------------------------------------------------}
procedure TfrmRptDenunciasFFEP.rptDenunciasFFEPBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  N_Folio := N_Folio_Inicio;
end;
{------------------------------------------------------------------------------}
end.

