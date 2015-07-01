{***** --------------------------------------------------------------- ******
       LISTADO AFILIACIONES (Nº 8 en la Tabla CLI_LIBROS) * Part *
       CONST NroListado = 8;
}
unit unRptAfiliaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, ImgList, XPMenu,
  Placemnt;

type
  TfrmRptLibroAfiliaciones = class(TfrmCustomForm)
    rptLibroAfiliaciones: TQuickRep;
    qrbDetalles: TQRBand;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    sdqReporte: TSDQuery;
    qrgAltasBajas: TQRGroup;
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
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    procedure FolioPrint(sender: TObject; var Value: String);
    procedure rptLibroAfiliacionesAfterPrint(Sender: TObject);
    procedure PeriodoPrint(sender: TObject; var Value: String);
    procedure sdqReporteAfterOpen(DataSet: TDataSet);
    procedure rptLibroAfiliacionesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     N_Folio_Inicio:Cardinal;
     N_Folio:Cardinal;
     iPeriodoaInsertar:Integer;
     sPeriodo:string;
  public
     constructor Create(TOwner:TComponent); override;
     function GetPeriodo(): String;
  end;

const
  NroListado = 8;

implementation

uses
  unConcBanc, unDmPrincipal;
  
{$R *.DFM}
{------------------------------------------------------------------------------}
constructor TfrmRptLibroAfiliaciones.Create(TOwner: TComponent);
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
procedure TfrmRptLibroAfiliaciones.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio:= N_Folio + 1;
  Value:=inttostr(N_Folio);
end;
{------------------------------------------------------------------------------}
procedure TfrmRptLibroAfiliaciones.rptLibroAfiliacionesAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar > 0 then
    EjecutarSQL('UPDATE CLI_LIBROS SET LI_ULTPAGINA=' + IntToStr(N_Folio) + ' WHERE LI_CODIGO = '+ IntToStr( NroListado ) +' AND LI_PERIODO = ' + IntToStr(iPeriodoaInsertar) );
end;
{------------------------------------------------------------------------------}
procedure TfrmRptLibroAfiliaciones.PeriodoPrint(sender: TObject; var Value: String);
begin
  Value := sPeriodo;
end;
{------------------------------------------------------------------------------}
function TfrmRptLibroAfiliaciones.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{------------------------------------------------------------------------------}
procedure TfrmRptLibroAfiliaciones.sdqReporteAfterOpen(DataSet: TDataSet);
begin
  with sdqReporte do
  begin
    TFloatField(FieldByName('PRIMATOTAL')).Currency := True;
    TFloatField(FieldByName('CO_MASATOTAL')).Currency := True;
    TFloatField(FieldByName('TC_SUMAFIJA')).Currency := True;
    TFloatField(FieldByName('TC_PORCMASA')).DisplayFormat := '% 0.00';
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmRptLibroAfiliaciones.rptLibroAfiliacionesBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  N_Folio:=N_Folio_Inicio;
end;
{------------------------------------------------------------------------------}
end.
