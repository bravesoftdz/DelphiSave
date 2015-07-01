{***** -------------------------------------------------------------------- ******
       LISTADO SUBDIARIO DE COBRANZA (Nº 2 en la Tabla CLI_LIBROS) Part.
       CONST NroListado = 2;
}
unit unRptSubDiarioCobranzas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSubDiarioCobranzas = class(TQuickRep)
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrbDatalle: TQRBand;
    qrdAfiliado: TQRDBText;
    qrdEstado: TQRDBText;
    qrdPeriodo: TQRDBText;
    qrdCUIT: TQRDBText;
    qrdRazonSocial: TQRDBText;
    qrdPrima: TQRDBText;
    qrdBonicacion: TQRDBText;
    qrdTassa: TQRDBText;
    qrdServicioSoc: TQRDBText;
    qrdDsxPremio: TQRDBText;
    qrdFDO_Reserva: TQRDBText;
    qrdHipoacusia: TQRDBText;
    qrdInteres: TQRDBText;
    qrdComision: TQRDBText;
    qrdCodProductor: TQRDBText;
    qrdCodOrganizador: TQRDBText;
    qrdJurisdiccion: TQRDBText;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    SummaryBand1: TQRBand;
    qreTotalPrima: TQRExpr;
    qreTotalBonificacion: TQRExpr;
    qreTotalTasa: TQRExpr;
    qreTotalServSoc: TQRExpr;
    qrePremio: TQRExpr;
    qreTotalReser: TQRExpr;
    qreTotalHipo: TQRExpr;
    qreTotalInteres: TQRExpr;
    qreTotalComision: TQRExpr;
    qrlTotalesdelMes: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    sdqAFIP: TSDQuery;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrlTotalComisionesProd: TQRLabel;
    qrlTotalComisionesInstit: TQRLabel;
    qrlImpTotalComisionesInstit: TQRLabel;
    qrlImpTotalComisionesProd: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
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
     Constructor Create (TOwner:TComponent); override;
     Function GetPeriodo() :String;
  end;

var
  rptSubDiarioCobranzas: TrptSubDiarioCobranzas;

CONST NroListado = 2;

implementation

uses unDmPrincipal,General,strfuncs, unConcBanc;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioCobranzas.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio:= N_Folio + 1;
  Value:=inttostr(N_Folio);
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptSubDiarioCobranzas.Create(TOwner: TComponent);
var
  nNroPeriodoFolio : TNroPeriodoFolio;
  //dFedis : TDateTime;
  sSql: String;
  SqlResults: TStringList;
begin
  inherited;
  nNroPeriodoFolio   := GetNroFolio( NroListado, tbPart );
  iPeriodoaInsertar  := nNroPeriodoFolio.PeriodoUpd;
  sPeriodo           := nNroPeriodoFolio.NombrePeriodo;
  N_Folio_Inicio     := nNroPeriodoFolio.NumeroFolioInicio;
  N_Folio            := nNroPeriodoFolio.NumeroFolio;
  //dFedis             := nNroPeriodoFolio.Fedis;
  OpenQuery( sdqAFIP );

  sSql := 'SELECT SUM(DECODE(TIPO_VEND, ''P'', COMISION, 0)), ' +
                 'SUM(DECODE(TIPO_VEND, ''I'', COMISION, 0)) ' +
            'FROM DSCVER.DIS_COBRADO_RESUMEN';
  SqlResults := ValoresColSQL( sSql );

  qrlImpTotalComisionesProd.Caption   := Get_AjusteDecimales(SqlResults[0]);
  qrlImpTotalComisionesInstit.Caption := Get_AjusteDecimales(SqlResults[1]);

//  sdqReporte.ParamByName('FEDIS').AsDateTime := dFedis;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioCobranzas.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar>0 then
    ejecutarsql('update cli_libros set Li_Ultpagina=' + inttostr(N_Folio) + ' where Li_codigo = '+ IntToStr( NroListado ) +' and Li_Periodo=' + inttostr(iPeriodoaInsertar) )
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioCobranzas.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value:=sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioCobranzas.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio:=N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptSubDiarioCobranzas.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


