unit unRptCuotasNoPagadas;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   03-03-2003
 ULTIMA MODIFICACION: 03-03-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, unART, Db, SDEngine;

type
  TfrmRptCuotasNoPagadas = class(TForm)
    qrCuotasNoPagadas: TQuickRep;
    QRBand2: TQRBand;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    qrlblUsuario2: TQRLabel;
    QRBand5: TQRBand;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel24: TQRLabel;
    lblEntidad: TQRDBText;
    lblVendedor: TQRDBText;
    lblCodEntidad: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel18: TQRDBText;
    QRLabel19: TQRDBText;
    QRLabel20: TQRDBText;
    QRLabel22: TQRDBText;
    QRLabel21: TQRDBText;
    QRLabel23: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel26: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    lblCodVendedor: TQRDBText;
    QRLabel25: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel15: TQRDBText;
    QRLabel16: TQRDBText;
    QRLabel17: TQRDBText;
    QRBand1: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    procedure ConvertirACurrency(sender: TObject; var Value: String);
    procedure ConvertirADosDecimales(sender: TObject; var Value: String);
  private
    { Private declarations }
    FEntidadVendedor : TTableId;
  public
    function Prepare : boolean;
    property EntidadVendedor  : TTableId read FEntidadVendedor  write FEntidadVendedor;
  end;

implementation
Uses unDmPrincipal, unPrincipal, AnsiSql, unSesion;
{$R *.DFM}

function TfrmRptCuotasNoPagadas.Prepare : boolean;
var
  sSql : string;
begin
  try
    sSql := 'SELECT EN_ID, EN_CODBANCO, VE_VENDEDOR, EN_NOMBRE, VE_NOMBRE, ' +
            'co_contrato "Contrato", em_cuit "CUIT", em_nombre "Razón Social", rc_periodo "Período", rc_devengadocuota ' +
            '"Devengado", rc_pagocuota+rc_recuperocuota "Pagado", rc_devengadocuota-rc_pagocuota-rc_recuperocuota "Saldo", vc_porccomision "Porcentaje de Comisión", ' +
            'round((rc_devengadocuota-rc_pagocuota-rc_recuperocuota)*vc_porccomision/100,2) "Comisión Estimada"  ' +
            ' FROM xev_entidadVendedor, xve_vendedor, xen_Entidad, zrc_resumencobranza, aem_empresa, aco_contrato, avc_vendedorcontrato ' +
            '  WHERE vc_contrato = co_contrato  ' +
            '  AND co_idempresa = em_id ' +
            '  AND co_contrato = rc_contrato  ' +
            '  AND vc_VigenciaDesde <= rc_Periodo  ' +
            '  AND (vc_VigenciaHasta IS NULL OR vc_VigenciaHasta >= rc_Periodo)  ' +
            '  AND rc_devengadocuota > rc_pagocuota' +
            '  AND vc_identidadvend = ev_id ' +
            '  AND ev_idvendedor = ve_id ' +
            '  AND ev_identidad = en_id ' +
            '  AND vc_identidadvend = ' + SqlValue(EntidadVendedor) + ' ' +
            'ORDER BY co_contrato';

    OpenQuery( sdqConsulta, sSql, True );
    qrlblUsuario2.Caption := Sesion.UserID;
    result := not sdqConsulta.Eof ;
  except
    result := False;
  end;
end;

procedure TfrmRptCuotasNoPagadas.ConvertirACurrency(sender: TObject; var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffCurrency, 2);
end;

procedure TfrmRptCuotasNoPagadas.ConvertirADosDecimales(sender: TObject; var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffNumber, 2);
end;

end.
