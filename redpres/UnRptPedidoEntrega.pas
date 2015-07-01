unit UnRptPedidoEntrega;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptPedidoEntrega = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrlTitulo: TQRLabel;
    QRLabel2: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlPrestDireccion: TQRLabel;
    qrlPrestCPLocalidad: TQRLabel;
    qrlPrestProvincia: TQRLabel;
    qrlPrestTelefono: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    qrmDescripciones: TQRMemo;
    qrlPaciente: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlabMarca: TQRLabel;
    qrlabOrigen: TQRLabel;
    qrlFecCirEnt: TQRLabel;
    qrlMarca: TQRLabel;
    qrlOrigen: TQRLabel;
    qrlTurno: TQRLabel;
    QRLabel19: TQRLabel;
    qrlImpoApro: TQRLabel;
    qrlEntregarEn: TQRLabel;
    qrlentregar: TQRLabel;
    qrlMaterialDe: TQRLabel;
    QRLabel4: TQRLabel;
    qrlImpoAproLetras: TQRLabel;
    qrlCaracter: TQRLabel;
    qrlabHora: TQRLabel;
    qrlHora: TQRLabel;
    qrlDescPrestacion: TQRLabel;
    QRLabel5: TQRLabel;
    qrlNumAuto: TQRLabel;
    QRLabel6: TQRLabel;
    qrlNroPedido: TQRLabel;
    qrlAprobo: TQRLabel;
    qrlFirmaUsuario: TQRLabel;
    QRLabel7: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlUsuarioApro: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    qrmPrestSolicitante: TQRMemo;
    qrlPrestFax: TQRLabel;
    qrlPrestAudPosterior: TQRLabel;
    qrlMatPrestacion: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel14: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    sdqConsulta: TSDQuery;
    qrlabGTrabajo: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    qrlabDelegacion: TQRLabel;
    qrsShape: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlLocalidad: TQRLabel;
    qrlTelefono: TQRLabel;
    qrmDireccion: TQRMemo;
    qrlRelaciones: TQRMemo;
    qrlPrestaciones: TQRLabel;
    qrlAnulado: TQRLabel;
    qrlPrestMail: TQRLabel;
    qrlDirEntrega: TQRLabel;
    qrlTelAut: TQRLabel;
    qrlRecibe: TQRLabel;
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  end;

var
  rptPedidoEntrega: TrptPedidoEntrega;

implementation

uses
  unPrincipal;

{$R *.DFM}

{--------------------------------------------------------------------------------------------------------------}
procedure TrptPedidoEntrega.QuickRepAfterPrint(Sender: TObject);
begin
  sdqConsulta.Close;
end;
{--------------------------------------------------------------------------------------------------------------}
procedure TrptPedidoEntrega.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  sdqConsulta.Open;
end;
{--------------------------------------------------------------------------------------------------------------}
end.
