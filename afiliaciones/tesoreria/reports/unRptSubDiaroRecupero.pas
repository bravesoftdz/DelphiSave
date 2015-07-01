{***** ------------------------------------------------------------------------------- ******
       LISTADO SUBDIARIO RECUPERO de DEUDORES por PREMIO (Nº 5 en la Tabla CLI_LIBROS) Part
       CONST NroListado = 5;
}
unit unRptSubDiaroRecupero;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSubDiaroRecupero = class(TQuickRep)
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
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
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
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel34: TQRLabel;
    Folio: TQRLabel;
    Periodo: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    qrlTotalesdelMes: TQRLabel;
    sdqReporte: TSDQuery;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText27: TQRDBText;
    sdqAFIP: TSDQuery;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    qrlTotalComisionesProd: TQRLabel;
    qrlTotalComisionesInstit: TQRLabel;
    qrlImpTotalComisionesProd: TQRLabel;
    qrlImpTotalComisionesInstit: TQRLabel;
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
  rptSubDiaroRecupero: TrptSubDiaroRecupero;

CONST NroListado = 5;

implementation

uses unDmPrincipal, General, StrFuncs, unConcBanc;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiaroRecupero.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio:= N_Folio + 1;
  Value:=inttostr(N_Folio);
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptSubDiaroRecupero.Create(TOwner: TComponent);
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
            'FROM DSCVER.DIS_RECUPERO_RESUMEN';
  SqlResults := ValoresColSQL( sSql );

  qrlImpTotalComisionesProd.Caption   := Get_AjusteDecimales(SqlResults[0]);
  qrlImpTotalComisionesInstit.Caption := Get_AjusteDecimales(SqlResults[1]);

  // sdqReporte.ParamByName('FEDIS').AsDateTime := dFedis;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiaroRecupero.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar>0 then
    ejecutarsql('update cli_libros set Li_Ultpagina=' + inttostr(N_Folio) + ' where Li_codigo = '+ IntToStr( NroListado ) + ' and Li_Periodo=' + inttostr(iPeriodoaInsertar) )
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiaroRecupero.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value:=sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiaroRecupero.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio:=N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptSubDiaroRecupero.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
