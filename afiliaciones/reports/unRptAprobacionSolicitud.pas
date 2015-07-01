unit unRptAprobacionSolicitud;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptAprobacionSolicitud = class(TQuickRep)
    sdqConsulta: TSDQuery;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRDBText;
    QRLabel9: TQRDBText;
    QRLabel10: TQRDBText;
    QRLabel11: TQRDBText;
    QRLabel12: TQRDBText;
    QRLabel13: TQRDBText;
    qrlblFecha: TQRLabel;
    qrlblUsuImpresion: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel16: TQRLabel;
  private
  public
    function PrepararReporte(aListaId: String): Boolean;
  end;

implementation

uses
  unPrincipal, unDmPrincipal;

{$R *.DFM}

function TrptAprobacionSolicitud.PrepararReporte(aListaId: String): Boolean;
var
  sSql: String;
begin
//06-07-2012
//Cambio co_fecharecepcion por co_fecharecepcionsectorafi segun GGROSSI tk 39611

  sSql :=
    'SELECT   em_cuit, em_nombre, fo_formulario, co_contrato, co_fechaafiliacion, co_fecharecepcionsectorafi,' +
            ' art.afiliacion.falta_doc_contrato(co_contrato) faltante, co_usurevision, co_fecharevision' +
       ' FROM aem_empresa, afo_formulario, aco_contrato' +
      ' WHERE co_idformulario = fo_id' +
        ' AND co_idempresa = em_id' +
        ' AND fo_id IN(' + aListaId + ')' +
   ' ORDER BY co_contrato ASC';
  OpenQuery(sdqConsulta, sSql, True);

  qrlblFecha.Caption := 'Contratos Generados el ' + DateToStr(DBDate);
  qrlblUsuImpresion.Caption := frmPrincipal.DBLogin.Usuario;
  Result := not sdqConsulta.Eof;
end;

end.
