{***** -------------------------------------------------------------------- ******
       LISTADO SUBDIARIO DE AMORTIZACION (Nº 4 en la Tabla CLI_LIBROS) Part.
       CONST NroListado = 4;
}
unit unRptSubDiarioAmortizacion;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSubDiarioAmortizacion = class(TQuickRep)
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
    qreHipoacusia: TQRExpr;
    qreTotalReserva: TQRExpr;
    qreTotalComision: TQRExpr;
    qrlTotalesdelMes: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel22: TQRLabel;
    qrlTotalComisionesProd: TQRLabel;
    qrlTotalComisionesInstit: TQRLabel;
    qrlImpTotalComisionesProd: TQRLabel;
    qrlImpTotalComisionesInstit: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel14: TQRLabel;
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
  rptSubDiarioAmortizacion: TrptSubDiarioAmortizacion;

CONST NroListado = 4;

implementation

uses unDmPrincipal, General, strfuncs, unConcBanc;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioAmortizacion.FolioPrint(sender: TObject; var Value: String);
begin
  N_Folio := N_Folio + 1;
  Value   := IntToStr(N_Folio);
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptSubDiarioAmortizacion.Create(TOwner: TComponent);
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

  sSql := 'SELECT SUM(DECODE(TIPO_VEND, ''P'', COMISION, 0)), ' +
                 'SUM(DECODE(TIPO_VEND, ''I'', COMISION, 0)) ' +
            'FROM DSCVER.DIS_AMORTIZA_RESUMEN';
  SqlResults := ValoresColSQL( sSql );

  qrlImpTotalComisionesProd.Caption   := Get_AjusteDecimales(SqlResults[0]);
  qrlImpTotalComisionesInstit.Caption := Get_AjusteDecimales(SqlResults[1]);

  sdqReporte.Sql.Text:=
    'SELECT AD_CONTRATO AFILIADO, ' +
         'AD_ESTABLECIMIENTOS EST, ' +
         'TO_CHAR(TO_DATE(AD_PERIODO,''YYYYMM''),''MM/YYYY'') PERIODO, ' +
         'AD_CUIT CUIT, ' +
         'AD_NOMBRE RAZON_SOCIAL, ' +
         'AD_EMPLEADOS TRABAJADORES, ' +
         'AD_MASASALARIAL MASA, ' +
         'AD_PRIMA PRIMA, ' +
         '0 BONIFIC, ' +
         'AD_SSN TASA_SSN, ' +
         'AD_OBRASOCIAL SERVS_SOC, ' +
         '0 D_EMIS, ' +
         '0 R_ADMIN, ' +
         'AD_CUOTA DSXPREMIO, ' +
         'AD_SRT FDO_RES, ' +
         'AD_FONDO HIPOACUSIA, ' +
         'AD_COMISION COMISION, ' +
         'AD_ENTIDAD PRODUCTOR, ' +
         'AD_VENDEDOR ORGANIZADOR, ' +
         'PV_DESCRIPCION JURISDICCION ' +
      'FROM CPV_PROVINCIAS, OAD_AMORTIZACIONDETALLE ' +
     'WHERE PV_CODIGO = AD_PROVINCIA ' +
     'ORDER BY AFILIADO, AD_PERIODO';

//  sdqReporte.ParamByName('FEDIS').AsDateTime := dFedis;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioAmortizacion.QuickRepAfterPrint(Sender: TObject);
begin
  if iPeriodoaInsertar > 0 then
    ejecutarsql('update cli_libros set Li_Ultpagina=' + inttostr(N_Folio) + ' where Li_codigo = '+ IntToStr( NroListado ) +' and Li_Periodo=' + inttostr(iPeriodoaInsertar) )
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioAmortizacion.PeriodoPrint(sender: TObject;  var Value: String);
begin
  Value := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptSubDiarioAmortizacion.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean );
begin
  N_Folio := N_Folio_Inicio;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptSubDiarioAmortizacion.GetPeriodo: String;
begin
  Result := sPeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
