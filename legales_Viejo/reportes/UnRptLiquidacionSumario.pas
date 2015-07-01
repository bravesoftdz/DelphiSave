unit UnRptLiquidacionSumario;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase;

type
  TRptLiquidacionSumario = class(TQuickRep)
    sdqLiquidacion: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrbCabecera: TQRBand;
    QRLDetalleJuicio: TQRLabel;
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
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
  private
  public
    procedure VistaPrevia(AIdPagoSumario, ACopias : Integer);
  end;

implementation

uses
  AnsiSql, unDmPrincipal, Dialogs;

{$R *.DFM}
procedure TRptLiquidacionSumario.VistaPrevia(AIdPagoSumario, ACopias: Integer);
begin
  try
    sdqLiquidacion.ParamByName('idpagosumario').AsInteger := AIdPagoSumario;
    sdqLiquidacion.Open;

    QRMemo1.Lines.Clear;
    if (sdqLiquidacion.FieldByName('is_aplicacion').AsString = 'M') or
       (Pos ('MULTA POR SENTENCIA', sdqLiquidacion.FieldByName('cuentapago').AsString) <> 0) then
    begin
      QRMemo1.Lines.Add('Estos fondos deben ser imputados a la cuenta corriente Nº2820/76 SRT 7500/852 FONDO DE GARANTÍA LEY 24.557 CUENTA RECAUDADORA del banco de la Nación Argentina Sucursal Plaza de Mayo.');
      QRMemo1.Lines.Add('Retira Legales.');
    end;
    QRMemo1.Lines.Add(sdqLiquidacion.FieldByName('ps_comentario').AsString);

    self.PrinterSettings.Copies := ACopias;
    self.PreviewModal;
  finally
    sdqLiquidacion.Close;
  end;
end;


end.
