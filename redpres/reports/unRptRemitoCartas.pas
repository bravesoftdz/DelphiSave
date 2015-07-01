unit unRptRemitoCartas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrRemitoCartas = class(TQuickRep)
    QRBand1: TQRBand;
    lbNumeroRemito: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    sdqRemito: TSDQuery;
    dsRemito: TDataSource;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    qrlNroRemito: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    qrlCantCartas: TQRLabel;
    QRLabel7: TQRLabel;
    qrlCantFuera: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCuenta: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    qriLogo: TQRImage;
    QRBand6: TQRBand;
    QRSysData6: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
  private

  public

  end;

  procedure DoImprimirRemito(IdRemito :Integer);

var
  qrRemitoCartas: TqrRemitoCartas;

implementation

uses unDmPrincipal;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure DoImprimirRemito(IdRemito :Integer);
var
  sSql :String;
begin
  with TqrRemitoCartas.Create(Application) do
  try
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    qrlNroRemito.Caption  := IntToStr(IdRemito);
    sSql := 'SELECT rc_cantcartas - NVL(rc_cantfuera,0), NVL(rc_cantfuera,0), cu_cuenta ' +
             ' FROM crc_remitoscartas, ccu_cuentausuario ' +
            ' WHERE rc_idcuenta = cu_id ' +
              ' AND rc_id = :IdRem ';
    with GetQueryEx(sSql, [IdRemito]) do
    try
      qrlCantCartas.Caption := Fields[0].AsString;
      qrlCantFuera.Caption  := Fields[1].AsString;
      qrlCuenta.Caption     := Fields[2].AsString;
    finally
      Free;
    end;
    sdqRemito.ParamByName('IdRemito').AsInteger := IdRemito;
    OpenQuery(sdqRemito);
    PrinterSettings.Copies := 2;
    Print;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
end.
