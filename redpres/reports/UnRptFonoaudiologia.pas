unit UnRptFonoaudiologia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptFonoaudiologia = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrmDireccion: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    qrlProvincia: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlLocalidadCP: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlDiagnostico: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlPaciente: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    qrlFirmante: TQRLabel;
    qrlCaracter: TQRLabel;
    QRMemo1: TQRMemo;
    sdqSesion: TSDQuery;
    dsSesion: TDataSource;
    QRBand3: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    qrlTelefono: TQRLabel;
    QRLabel18: TQRLabel;
    qrlNroAutorizacion: TQRLabel;
    QRLabel19: TQRLabel;
    qrlUsuario: TQRLabel;
    QRLabel20: TQRLabel;
    qrlDocumento: TQRLabel;
    QRLabel16: TQRLabel;
    qrlDomicilioPaciente: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    qrlFax: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    qrlTelPaciente: TQRLabel;
    QRLabel24: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel25: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    QRLabel26: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape7: TQRShape;
    qrlGTrabajo: TQRLabel;
    QRLabel30: TQRLabel;
    qrlRelaciones: TQRMemo;
    QRLabel33: TQRLabel;
    QRLabel31: TQRLabel;
    qrmemoTipoPrestacion: TQRMemo;
    qrlAnulado: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  end;

var
  rptFonoaudiologia: TrptFonoaudiologia;

implementation

{$R *.DFM}

procedure TrptFonoaudiologia.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  iCant :Integer;
begin
  //esto no es muy lindo pero para no complicarme poniendo otras bandas....total casi nunca va a pasar...
  if qrlRelaciones.Lines.Count > 3 then
  begin
    iCant := ((qrlRelaciones.Lines.Count - 3) * 17);
    QRBand1.Height  := QRBand1.Height + iCant;
    QRLabel9.Top    := QRLabel9.Top + iCant;
    QRLabel10.Top   := QRLabel10.Top + iCant;
    QRLabel11.Top   := QRLabel11.Top + iCant;
    QRLabel12.Top   := QRLabel12.Top + iCant;
  end;
end;
{-------------------------------------------------------------------------------}
end.
