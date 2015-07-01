unit unRptNotaBase;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrNotaBase = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogo: TQRImage;
    qrMemoCuerpo: TQRMemo;
    qrlLugarYFecha: TQRLabel;
    qrlFirmPciaART: TQRLabel;
    qrlTitulo: TQRLabel;
    qrlFirmante: TQRLabel;
    qrlLabDamnificado: TQRLabel;
    qrlDamnificado: TQRLabel;
    qrlLabExpediente: TQRLabel;
    qrlExpediente: TQRLabel;
    qrlLabSiniestro: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlSubtitulo: TQRLabel;
    qrlPresente: TQRLabel;
    qrlSinMas: TQRLabel;
    qrlFirmDepto: TQRLabel;
    QRLabel1: TQRLabel;
  private

  public
    procedure ImprimirNotaBase(iSiniestro:Integer;
                                   iOrden:Integer;
                                 iRecaida:Integer;
                                  sCuerpo: String;
                             sLugarYFecha: String = '';
                                  sTitulo: String = '';
                               sSubtitulo: String = '';
                             sDamnificado: String = '';
                              sExpediente: String = '';
                               sSinOrdRec: String = '';
                                sFirmante: String = '';
                               sFirmDepto: String = '';
                               iCantCopias: Integer = 1);
  end;

var
  qrNotaBase: TqrNotaBase;

implementation

uses unComunes;

{$R *.DFM}

{ TqrNotaBase }

procedure TqrNotaBase.ImprimirNotaBase(iSiniestro:Integer;
                                           iOrden:Integer;
                                         iRecaida:Integer;
                                          sCuerpo: String;
                                     sLugarYFecha: String = '';
                                          sTitulo: String = '';
                                       sSubtitulo: String = '';
                                     sDamnificado: String = '';
                                      sExpediente: String = '';
                                       sSinOrdRec: String = '';
                                        sFirmante: String = '';
                                       sFirmDepto: String = '';
                                       iCantCopias: Integer = 1);
var iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  if Is_SiniestroDeGobernacion(iIdExped) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  qrlLugarYFecha.Caption            := sLugarYFecha;
  qrlTitulo.Caption                 := sTitulo;
  qrlSubtitulo.Caption              := sSubtitulo;
  qrlDamnificado.Caption            := sDamnificado;
  qrlExpediente.Caption             := sExpediente;
  qrlSiniestro.Caption              := sSinOrdRec;
  qrMemoCuerpo.Lines.Text           := sCuerpo;
  qrlFirmante.Caption               := sFirmante;
  qrlFirmDepto.Caption              := sFirmDepto;
  PrinterSettings.Copies            := iCantCopias;
  print;
end;

end.
