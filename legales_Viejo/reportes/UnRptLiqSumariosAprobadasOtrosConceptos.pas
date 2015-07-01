unit UnRptLiqSumariosAprobadasOtrosConceptos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unEspera,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtDatabase;

type
  TRptLiqSumariosAprobadasOtrosConceptos = class(TQuickRep)
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
    QRLabel7: TQRLabel;
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
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
  private
  public
    procedure VistaPrevia(AFechaDesde,
                          AFechaHasta: TDate;
                          ACopias : Integer);
  end;


implementation

uses
  AnsiSql, unDmPrincipal, Dialogs, unSesion, unDmFinancials, CUIT;

{$R *.DFM}
procedure TRptLiqSumariosAprobadasOtrosConceptos.VistaPrevia(AFechaDesde,
                                                             AFechaHasta: TDate;
                                                             ACopias : Integer);
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
      SQL.Clear;
      SQL.Text := 'SELECT   ps_idsumario, ps_chequenombre beneficiario, ' +
                  '         ps_paguesea proveedor, ar_nombre art, ' +
                  '            ps_letrafactura ' +
                  '         || ''-'' ' +
                  '         || ps_situacionfactura ' +
                  '         || ''-'' ' +
                  '         || ps_numerofactura AS nrofactura, ' +
                  '            ''A-'' ' +
                  '         || trim(TO_CHAR (ps_idbeneficiariopago, ''0000'')) ' +
                  '         || ''-'' ' +
                  '         || trim(TO_CHAR (ps_idsumario, ''000000'')) ' +
                  '         || trim(TO_CHAR (ps_numpago, ''00'')) factura_fnl, ' +
                  '         su_numerosumario, ' +
                  '            cp_denpago ' +
                  '         || NVL2 (is_detalle, '': '', '''') ' +
                  '         || is_detalle concepto, ' +
                  '         ps_fechaemision fechaliquidacion, ' +
                  '         ps_importepago importesinretencion, ' +
                  '         ps_importeconretencion importeconretencion, ' +
                  '           NVL (ps_importeconretencion, 0) ' +
                  '         + NVL (ps_importepago, 0) importefactura ' +
                  '    FROM legales.lps_pagosumario, ' +
                  '         legales.lbp_beneficiariopago, ' +
                  '         art.scp_conpago, ' +
                  '         legales.lis_importesentenciasumario, ' +
                  '         legales.lsu_sumario, ' +
                  '         afi.aar_art ' +
                  '   WHERE (bp_id(+) = ps_idbeneficiariopago) ' +
                  '     AND (ps_conpago = cp_conpago) ' +
                  '     AND (ps_estado = ''E'') ' +
                  '     AND (ps_fechaaprobado >= :fechadesde) ' +
                  '     AND (ps_fechaaprobado < CAST (:fechahasta AS DATE) + 1) ' +
                  '     AND (is_nropago(+) = ps_id) ' +
                  '     AND (su_id = ps_idsumario) ' +
                  '     AND (ar_id = su_idart) ' +
                  'ORDER BY proveedor, nrofactura ';

      ParamByName('fechadesde').AsDate := AFechaDesde;
      ParamByName('fechahasta').AsDate := AFechaHasta;
      Open;
    end;

    self.PrinterSettings.Copies := ACopias;
    self.PreviewModal;
  finally
    sdqLiquidacion.Close;
  end;
end;

end.


