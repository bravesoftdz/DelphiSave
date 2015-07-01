unit unRptTrasladosMediosDeTransporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls;

type
  TqrTrasladosMediosDeTransporte = class(TqrMoldeCarta)
    qrbDetail: TQRBand;
    qrbFooterHorario: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    qrbHeaderVehiculo: TQRGroup;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    sdqDatosCT_FECHAHORA: TDateTimeField;
    sdqDatosCT_FECHA: TDateTimeField;
    sdqDatosPRESTADOR_PRESTACION: TStringField;
    sdqDatosPRESTADOR_TRASLADO: TStringField;
    sdqDatosPRESTADOR_TRASLADO_ID: TFloatField;
    sdqDatosTJ_NOMBRE: TStringField;
    sdqDatosDT_DESCRIPCION: TStringField;
    sdqDatosDOMICILIO: TStringField;
    sdqDatosCANT_ASIENTOS: TFloatField;
    QRDBText7: TQRDBText;
    qrbHeaderHorario: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    sdqDatosDOMICILIO_PRESTADOR_PRESTACION: TStringField;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    sdqDatosSINIESTRO: TStringField;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    sdqDatosNUMAUTO: TFloatField;
    sdqDatosTELEFONO: TStringField;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  qrTrasladosMediosDeTransporte: TqrTrasladosMediosDeTransporte;

implementation

{$R *.dfm}

{ TqrTrasladosMediosDeTransporte }

constructor TqrTrasladosMediosDeTransporte.Create(AOwner: TComponent);
begin
  inherited;
end;

end.
