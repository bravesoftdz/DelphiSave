{-----------------------------------------------------------------------------
 Unit Name: UnRptLiquidacionAprobadasOtrosConceptos
 Author:    RACastro
 Date:      15-Ago-2006
 Purpose:   Listado de liquidaciones aprobadas como Otros Conceptos
            dentro de un período
 History:
-----------------------------------------------------------------------------}
unit UnRptLiquidacionAprobadasOtrosConceptos;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, unEspera,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase;

type
  TTipoListadoAprobOC = (tlAprobOC_Juicio, tlAprobOC_Mediacion);

  TRptLiquidacionAprobadasOtrosConceptos = class(TQuickRep)
    sdqLiquidacion: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrbDetalle: TQRBand;
    fbLiquidaciones: TQRBand;
    qrlLiquidadoPor: TQRLabel;
    QRSysData1: TQRSysData;
    qrlUsuario: TQRLabel;
    qrlFechaAprobacion: TQRLabel;
    grpAcreedor: TQRGroup;
    grpFactura: TQRGroup;
    gftFactura: TQRBand;
    gftAcreedor: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    grpBeneficiario: TQRGroup;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    gftBeneficiario: TQRBand;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel14: TQRLabel;
    qrlTitCarpeta: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand1: TQRBand;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
  private
  public
    procedure VistaPrevia(AFechaDesde, AFechaHasta: TDate; ACopias : Integer; TipoListado: TTipoListadoAprobOC);
  end;


implementation

uses
  AnsiSql, unDmPrincipal, Dialogs, unSesion, unDmFinancials, CUIT;

{$R *.DFM}
{-----------------------------------------------------------------------------
  Procedure: VistaPrevia
  Author:    RACastro
  Date:      15-Ago-2006
  Arguments: AFechaDesde, AFechaHasta: TDate; ACopias : Integer
  Result:    None
  Purpose:   Inicializa y ejecuta la vista previa del reporte
-----------------------------------------------------------------------------}
procedure TRptLiquidacionAprobadasOtrosConceptos.VistaPrevia(AFechaDesde, AFechaHasta: TDate; ACopias : Integer; TipoListado: TTipoListadoAprobOC);
var
  sSql: String;
begin
  try
    qrlUsuario.Caption := Sesion.LoginName;
    if AFechaDesde = AFechaHasta then
      qrlFechaAprobacion.Caption := 'con fecha de aprobación ' +
                                    DateToStr (AFechaDesde)
    else
      qrlFechaAprobacion.Caption := 'con fecha de aprobación del ' +
                                    DateToStr (AFechaDesde) + ' al ' +
                                    DateToStr (AFechaHasta);

    with sdqLiquidacion do
    begin
      Close;
      Sql.Clear;

      case TipoListado of
        tlAprobOC_Juicio:
          begin
            qrlTitCarpeta.Caption := 'Carpeta';

            sSql := 'SELECT   lpl.pl_chequenombre beneficiario, ' +
                    '         lpl.pl_paguesea proveedor, ' +
                    '         lpl.pl_letrafactura ' +
                    '         || ''-'' ' +
                    '         || lpl.pl_situacionfactura ' +
                    '         || ''-'' ' +
                    '         || lpl.pl_numerofactura nrofactura, ' +
                    '         ''A-'' ' +
                    '         || trim(TO_CHAR(lpl.pl_idbeneficiariopago, ''0000'')) ' +
                    '         || ''-'' ' +
                    '         || trim(TO_CHAR(lpl.pl_idjuicioentramite, ''000000'')) ' +
                    '         || trim(TO_CHAR(lpl.pl_numpago, ''00'')) factura_fnl, ' +
                    (*
                    No hay forma de relacionar 1 a 1 juicio con siniestro
                    '         DECODE ' +
                    '           (irj.ir_aplicacion, ' +
                    '            ''C'', (SELECT NVL2 (sjt2.sj_siniestro, ' +
                    '                                  TO_CHAR (sjt2.sj_siniestro) ' +
                    '                               || ''-'' ' +
                    '                               || TO_CHAR (sjt2.sj_orden) ' +
                    '                               || ''-'' ' +
                    '                               || TO_CHAR (sjt2.sj_recaida), ' +
                    '                               NULL ' +
                    '                              ) ' +
                    '                    FROM legales.lir_importesreguladosjuicio irj2, ' +
                    '                         legales.lrt_reclamojuicioentramite rjt2, ' +
                    '                         legales.lod_origendemanda od2, ' +
                    '                         legales.lsj_siniestrosjuicioentramite sjt2 ' +
                    '                   WHERE rjt2.rt_id(+) = irj2.ir_idreclamojuicioentramite ' +
                    '                     AND od2.od_id(+) = rjt2.rt_idorigendemanda ' +
                    '                     AND sjt2.sj_idorigendemanda(+) = od2.od_id ' +
                    '                     AND sjt2.sj_fechabaja IS NULL ' +
                    '                     AND (NOT irj2.ir_idreclamojuicioentramite IS NULL) ' +
                    '                     AND irj2.ir_id = irj.ir_id), ' +
                    '            NULL ' +
                    '           ) siniestro, ' +
                    *)
                    '         jt.jt_numerocarpeta carpeta, ' +
                    '         scp.cp_denpago ' +
                    '         || NVL2(irj.ir_detalle, '': '', '''') ' +
                    '         || irj.ir_detalle concepto, ' +
                    '         lpl.pl_fechaemision fechaliquidacion, ' +
                    '         lpl.pl_importepago importesinretencion, ' +
                    '         lpl.pl_importeconretencion importeconretencion, ' +
                    '         NVL(lpl.pl_importeconretencion, 0) + NVL (lpl.pl_importepago, 0) importefactura ' +
                    '    FROM legales.lpl_pagolegal lpl, ' +
                    '         legales.lbp_beneficiariopago lbp, ' +
                    '         art.scp_conpago scp, ' +
                    '         legales.lir_importesreguladosjuicio irj, ' +
                    '         legales.ljt_juicioentramite jt ' +
                    '   WHERE lbp.bp_id(+) = lpl.pl_idbeneficiariopago ' +
                    '     AND lpl.pl_conpago = scp.cp_conpago ' +
                    '     AND lpl.pl_estado = ''E'' ' +
                    '     AND lpl.pl_fechaaprobado >= :fechadesde ' +
                    '     AND lpl.pl_fechaaprobado < CAST (:fechahasta AS DATE) + 1 ' +
                    '     AND irj.ir_nropago(+) = lpl.pl_id ' +
                    '     AND jt.jt_id = lpl.pl_idjuicioentramite ' +
                    'ORDER BY proveedor, nrofactura ';
          end;

        tlAprobOC_Mediacion:
          begin
            qrlTitCarpeta.Caption := 'Folio';

            sSql := 'SELECT   lpm.pm_chequenombre beneficiario, ' +
                    '         lpm.pm_paguesea proveedor, ' +
                    '         lpm.pm_letrafactura ' +
                    '         || ''-'' ' +
                    '         || lpm.pm_situacionfactura ' +
                    '         || ''-'' ' +
                    '         || lpm.pm_numerofactura nrofactura, ' +
                    '         ''A-'' ' +
                    '         || trim(TO_CHAR(lpm.pm_idbeneficiariopago, ''0000'')) ' +
                    '         || ''-'' ' +
                    '         || trim(TO_CHAR(lpm.pm_idmediacion, ''000000'')) ' +
                    '         || trim(TO_CHAR(lpm.pm_numpago, ''00'')) factura_fnl, ' +
                    '         me.me_numerofolio carpeta, ' +
                    '         scp.cp_denpago ' +
                    '         || NVL2(lim.im_detalle, '': '', '''') ' +
                    '         || lim.im_detalle concepto, ' +
                    '         lpm.pm_fechaemision fechaliquidacion, ' +
                    '         lpm.pm_importepago importesinretencion, ' +
                    '         lpm.pm_importeconretencion importeconretencion, ' +
                    '         NVL(lpm.pm_importeconretencion, 0) + NVL (lpm.pm_importepago, 0) importefactura ' +
                    '    FROM legales.lpm_pagomediacion lpm, ' +
                    '         legales.lbp_beneficiariopago lbp, ' +
                    '         art.scp_conpago scp, ' +
                    '         legales.lim_importemediacion lim, ' +
                    '         legales.lme_mediacion me ' +
                    '   WHERE lpm.pm_idbeneficiariopago = lbp.bp_id(+) ' +
                    '     AND lpm.pm_conpago = scp.cp_conpago ' +
                    '     AND lpm.pm_estado = ''E'' ' +
                    '     AND lpm.pm_fechaaprobado >= :fechadesde ' +
                    '     AND lpm.pm_fechaaprobado < CAST (:fechahasta AS DATE) + 1 ' +
                    '     AND lim.im_nropago(+) = lpm.pm_id ' +
                    '     AND me.me_id = lpm.pm_idmediacion ' +
                    'ORDER BY proveedor, nrofactura ';
          end;
      end;

      Sql.Text := sSql;

      ParamByName('fechadesde').AsDate := AFechaDesde;
      ParamByName('fechahasta').AsDate := AFechaHasta;
      Open;
    end;

    Self.PrinterSettings.Copies := ACopias;
    Self.PreviewModal;
  finally
    sdqLiquidacion.Close;
  end;
end;

end.


