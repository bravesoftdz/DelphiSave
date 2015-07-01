{-----------------------------------------------------------------------------
 Unit Name: UnRptLiquidacion
 Author:    RACastro
 Date:      23-May-2006
 Purpose:   Genera liquidación por conceptos legales
 History:
-----------------------------------------------------------------------------}
unit UnRptLiquidacion;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase;

type
  TRptLiquidacion = class(TQuickRep)
    sdqLiquidacion: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrbCabecera: TQRBand;
    QRLDetalleJuicio: TQRLabel;
    QRLCaratula: TQRLabel;
    qrdbCaratula: TQRDBText;
    qrdbJurisdiccion: TQRDBText;
    QRLJurisdiccion: TQRLabel;
    QRLFuero: TQRLabel;
    qrdbFuero: TQRDBText;
    QRLJuzgado: TQRLabel;
    qrdbJuzgado: TQRDBText;
    QRLSecretaria: TQRLabel;
    qrdbSecretaria: TQRDBText;
    qrdbIdJuicioEnTramite: TQRDBText;
    fbLiquidaciones: TQRBand;
    cbConcepto: TQRChildBand;
    qrdbFactura: TQRDBText;
    qrlFactura: TQRLabel;
    qrdbConceptoPago: TQRDBText;
    qrlConcepto: TQRLabel;
    qrlImportes: TQRLabel;
    qrlConRetencion: TQRLabel;
    qrlSinRetencion: TQRLabel;
    qrdbImporteSinRetencion: TQRDBText;
    qrdbImporteConRetencion: TQRDBText;
    qrsLineaVertical1: TQRShape;
    qrsCuadroTitulos: TQRShape;
    qrsLineaVertical3: TQRShape;
    cbObservaciones: TQRChildBand;
    qrlObservaciones: TQRLabel;
    qrdbObservaciones: TQRDBText;
    qrlLiquidacionNumero: TQRLabel;
    qrlFechaEmision: TQRLabel;
    qrdbFechaEmision: TQRDBText;
    qrsLineaHorizontal1: TQRShape;
    qrlTotal: TQRLabel;
    qrdbTotal: TQRDBText;
    qrdbNroLiquidacion: TQRDBText;
    qrlPagueseA: TQRLabel;
    qrlChequesANombreDe: TQRLabel;
    qrdbPagueseA: TQRDBText;
    qrdbChequeANombreDe: TQRDBText;
    NroLiq: TQRExpr;
    bcNroLiq: TQRExpr;
    qrlLiquidadoPor: TQRLabel;
    qrdbLiquidadoPor: TQRDBText;
    QRDBText1: TQRDBText;
  private
  public
    procedure VistaPrevia(AIdPagoLegal, ACopias : Integer);
  end;


implementation

uses
  AnsiSql, unDmPrincipal, Dialogs;

{$R *.DFM}
procedure TRptLiquidacion.VistaPrevia(AIdPagoLegal, ACopias: Integer);
begin
  try
    sdqLiquidacion.ParamByName('IDPAGOLEGAL').AsInteger := AIdPagoLegal;
    sdqLiquidacion.Open;
    self.PrinterSettings.Copies := ACopias;
    self.PreviewModal;
  finally
    sdqLiquidacion.Close;
  end;
end;

end.
