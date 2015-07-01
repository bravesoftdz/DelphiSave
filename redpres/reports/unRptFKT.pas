unit unRptFKT;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptFKT = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrmDireccion: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlPaciente: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlDiagnostico: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRBand2: TQRBand;
    qrlFirmante: TQRLabel;
    qrlCaracter: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    sdqSesion: TSDQuery;
    dsSesion: TDataSource;
    QRShape41: TQRShape;
    QRDBText1: TQRDBText;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel23: TQRLabel;
    QRMemo2: TQRMemo;
    qrlLocalidadCP: TQRLabel;
    QRLabel14: TQRLabel;
    qrlDomicilio: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel13: TQRLabel;
    qrlProvincia: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    qrlTelefono: TQRLabel;
    QRLabel17: TQRLabel;
    qrlNroAutorizacion: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel18: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlDocumento: TQRLabel;
    QRLabel19: TQRLabel;
    qrlDomicilioPaciente: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    QRLabel20: TQRLabel;
    qrlFax: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrlTelPaciente: TQRLabel;
    QRLabel24: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel25: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape5: TQRShape;
    qrlRelaciones: TQRMemo;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    qrmemoTipoPrestacion: TQRMemo;
    qrlAnulado: TQRLabel;
    sdqFKT: TSDQuery;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  end;

var
  rptFKT: TrptFKT;

implementation

uses unPrincipal, undmprincipal, ansisql, general, cuit;

{$R *.DFM}

procedure TrptFKT.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  iCant :Integer;
begin
  //esto no es muy lindo pero para no complicarme poniendo otras bandas....
  if qrlRelaciones.Lines.Count > 3 then
  begin
    iCant := ((qrlRelaciones.Lines.Count - 3) * 17);
    QRBand1.Height  := QRBand1.Height + iCant;
    QRLabel9.Top    := QRLabel9.Top + iCant;
    QRLabel10.Top   := QRLabel10.Top + iCant;
    QRLabel11.Top   := QRLabel11.Top + iCant;
    QRLabel12.Top   := QRLabel12.Top + iCant;
    QRLabel27.Top   := QRLabel27.Top + iCant;
    QRLabel28.Top   := QRLabel28.Top + iCant;
  end;
end;


{-------------------------------------------------------------------------------}
end.
