unit unRPT_OP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine;

type
  TunQrp_OP = class(TForm)
    qrpOrdenPago: TQuickRep;
    qrbTitulo: TQRBand;
    sdqOrdenPago: TSDQuery;
    qrdOP: TQRDBText;
    QRBDetail: TQRBand;
    qrlCheque: TQRLabel;
    qrlFecha: TQRLabel;
    qrlDescripcion: TQRLabel;
    qrlImporteAplicado: TQRLabel;
    qrdNroCheque: TQRDBText;
    qrdFecha: TQRDBText;
    qrdDescripcion: TQRDBText;
    qrdImporteApli: TQRDBText;
    qrlMedioPago: TQRLabel;
    qrlBanco: TQRLabel;
    qrlCta: TQRLabel;
    qrlFechaVto: TQRLabel;
    qrlImportePago: TQRLabel;
    qrdMedioPago: TQRDBText;
    qrdBanco: TQRDBText;
    qrdNroCuenta: TQRDBText;
    qrdFechaVto: TQRDBText;
    qrdMontoPago: TQRDBText;
    qrlOrdenPago: TQRLabel;
    QRDBText1: TQRDBText;
    QRBSubTotal: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    qrlConfecciono: TQRLabel;
    qrlRecibio: TQRLabel;
    qrlFirmaCheque: TQRLabel;
    qrlEntrego: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    qrlRecibido: TQRLabel;
    qrlFechaRecibido: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape9: TQRShape;
    qrlFechaEmision: TQRLabel;
    qrdFechaEmision: TQRDBText;
    QRShape10: TQRShape;
    sdqProveedor: TSDQuery;
    qrdProveedor: TQRDBText;
    qrdDomicilioUno: TQRDBText;
    qrdDomicilioDos: TQRDBText;
    qrdCodigoPostal: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlCuitART: TQRLabel;
    QRShape12: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlIBART: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    qrlCodBarras: TQRLabel;
    qriLogo: TQRImage;
    qrmTexto: TQRMemo;
    qrlNumeroCodBarras: TQRLabel;
    qrlCodBarrasST: TQRLabel;
    qrlNumeroCodBarrasST: TQRLabel;
    qrlInfoAdic1CodBarrasST: TQRLabel;
    qrlInfoAdic2CodBarrasST: TQRLabel;
    procedure qrlCuitARTPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrlIBARTPrint(sender: TObject; var Value: String);
    procedure qrlCodBarrasPrint(sender: TObject; var Value: String);
    procedure qrpOrdenPagoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  end;

var
  unQrp_OP: TunQrp_OP;

implementation

uses
  strFuncs, Numeros, unDmFinancials, unArt, unDmPrincipal, AnsiSql, unSesion, Cuit,
  unArchivo, unConstantArchivo, unUtilsArchivo, unTesoreria;

{$R *.DFM}

procedure TunQrp_OP.qrlCuitARTPrint(sender: TObject; var Value: String);
begin
  Value := PonerGuiones(cNroCuitART);
end;

procedure TunQrp_OP.FormCreate(Sender: TObject);
begin
  dmFinancials.Conectar;

  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  qrlConfecciono.Caption := Sesion.Usuario;
end;

procedure TunQrp_OP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmFinancials.Desconectar;
end;

procedure TunQrp_OP.qrlIBARTPrint(sender: TObject; var Value: String);
begin
  Value := 'C.M.' + cNroIngresosBrutosART;
end;

procedure TunQrp_OP.qrpOrdenPagoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  IdSecTrazabilidad: TTableId;
begin
  IdSecTrazabilidad := GetPrimeraSecTrazabilidad(ID_CARPETA_TESORERIA, CODDOC_OPAGOTESO, sdqOrdenPago.ParamByName('nOP').AsString);

  if IdSecTrazabilidad = ART_EMPTY_ID then
    IdSecTrazabilidad := Get_SecuenciaTrazOP(sdqOrdenPago.ParamByName('nOP').AsInteger);

  DoCargarCodBarrasSecTrazabililidad(IdSecTrazabilidad, qrlCodBarrasST, qrlNumeroCodBarrasST, qrlInfoAdic1CodBarrasST, qrlInfoAdic2CodBarrasST, alDerecha, False, True);
end;

procedure TunQrp_OP.qrlCodBarrasPrint(sender: TObject; var Value: String);
var
  sCodBarras: String;
begin
  sCodBarras := GetCodBarrasClave(CODDOC_OPAGOTESO, sdqOrdenPago.ParamByName('nOP').AsString);

  Value := '*' + sCodBarras + '*';
  qrlNumeroCodBarras.Caption := sCodBarras;
end;

end.

