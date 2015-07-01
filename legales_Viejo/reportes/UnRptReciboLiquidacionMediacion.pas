unit UnRptReciboLiquidacionMediacion;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase;

type
  TRptReciboLiquidacionMediacion = class(TQuickRep)
    sdqLiquidacion: TSDQuery;
    qrbTitulo: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    qrdbTotal: TQRDBText;
    QRDBText2: TQRDBText;
    qrl: TQRLabel;
    qrlCantidadEnLetras: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    qrlLiquidacionNumero: TQRLabel;
    QRLDetalleJuicio: TQRLabel;
    QRLCaratula: TQRLabel;
    QRLJurisdiccion: TQRLabel;
    qrdbJurisdiccion: TQRDBText;
    qrdbCaratula: TQRDBText;
    qrdbIdJuicioEnTramite: TQRDBText;
    qrdbNroLiquidacion: TQRDBText;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    qrlTitulo: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData1: TQRSysData;
    qrlChequesANombreDe: TQRLabel;
    qrdbChequeANombreDe: TQRDBText;
    QRDBText1: TQRDBText;
    qriLogo: TQRImage;
    procedure qrlCantidadEnLetrasPrint(sender: TObject; var Value: String);
  private
  public
    procedure VistaPrevia(AIdPago, ACopias : Integer);
  end;


implementation

uses
  AnsiSql, unDmPrincipal, Numeros;

{$R *.DFM}

procedure TRptReciboLiquidacionMediacion.VistaPrevia(AIdPago, ACopias: Integer);
begin
  try
    qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );
    sdqLiquidacion.ParamByName('IdPago').AsInteger := AIdPago;

    sdqLiquidacion.Open;
    self.PrinterSettings.Copies := ACopias;
    self.PreviewModal;
  finally
    sdqLiquidacion.Close;
  end;
end;

procedure TRptReciboLiquidacionMediacion.qrlCantidadEnLetrasPrint(sender: TObject; var Value: String);
begin
    Value := NumLetras(sdqLiquidacion.fieldbyname('total').AsCurrency, 2, true);
end;

end.
