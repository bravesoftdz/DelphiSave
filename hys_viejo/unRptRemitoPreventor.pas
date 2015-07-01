unit unRptRemitoPreventor;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine,
  unDmPrincipal, unVisualizador, DateTimeFuncs;

type
  TRptRemitoPreventor = class(TForm)
    QrpRemitoPreventor: TQuickRep;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    sdqReporte: TSDQuery;
    qrbDetalle: TQRBand;
    medida: TQRDBText;
    nromedida: TQRDBText;
    item: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape49: TQRShape;
    QRShape27: TQRShape;
    QRShape26: TQRShape;
    QRShape25: TQRShape;
    QRShape18: TQRShape;
    QRShape16: TQRShape;
    QRShape11: TQRShape;
    QRShape33: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape8: TQRShape;
    QRShape58: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape39: TQRShape;
    QRShape38: TQRShape;
    logo: TQRImage;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLPreventor: TQRLabel;
    QRLFechaDesdeHasta: TQRLabel;
    QRLFechaImpresion: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLContrato: TQRLabel;
    QRLRazonSocial: TQRLabel;
    QRLNroEstab: TQRLabel;
    QRLFechaVisita: TQRLabel;
    QRLTipoEmpresa: TQRLabel;
    QRLTareasRealizadas: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    QRShape21: TQRShape;
    QRShape2: TQRShape;
    QRShape48: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
  private
  public
  procedure VistaPrevia(fechaDesde, fechaHasta: TDateTime; IdPreventor: integer; NombrePreventor: String);
  end;

var
  RptRemitoPreventor: TRptRemitoPreventor;

implementation

{$R *.DFM}

{ TTRptRemitoPreventor }

procedure TRptRemitoPreventor.VistaPrevia(fechaDesde, fechaHasta: TDateTime; IdPreventor: integer; NombrePreventor: String);
begin
  QRLPreventor.Caption := NombrePreventor;
  QRLFechaDesdeHasta.Caption := FormatDateTime('dd/mm/yyyy', fechaDesde) + ' a ' + FormatDateTime('dd/mm/yyyy', fechahasta);
  QRLFechaImpresion.Caption := FormatDateTime('dd/mm/yyyy hh:nn', DBDateTime);
  
  EjecutarSql('DELETE FROM hys.hrp_remitopreventor');
  EjecutarSqlEx(' INSERT INTO hys.hrp_remitopreventor ' +
                ' SELECT   it_nombre, vp_idpreventor, em_cuit, em_nombre, co_contrato, vp_idempresa, vp_establecimiento, es_nombre, vp_origen, ' +
                '        ta_id, ta_descripcion, ''S'' realizado, ' +
                '        NVL((SELECT DISTINCT ''N''  ' +
                '               FROM hys.hts_tareahys ' +
                '              WHERE ts_idproceso =  art.hys_plan.get_idproceso(''M'', trunc(vp_fechavisita, ''MM''), LAST_DAY(vp_fechavisita)) ' +
                '                AND ts_fechabaja IS NULL ' +
                '                AND ts_idtarea = tp_idtarea ' +
                '                AND ts_idempresa = vp_idempresa ' +
                '                AND ts_estableci = vp_establecimiento), ' +
                '            ''S'') adicional, te_codigo, trunc(vp_fechavisita) vp_fechavisita ' +
                '   FROM hys.hte_tipoempresaprev, art.pit_firmantes, afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa, hys.hvp_visitapreventor hvp, ' +
                '        hys.htp_tareapreventor HTP, hys.hta_tarea ' +
                '  WHERE tp_idtarea = ta_id ' +
                '    AND tp_idvisitapreventor = vp_id ' +
                '    AND tp_fechabaja IS NULL ' +
                '    AND it_id = vp_idpreventor ' +
                '    AND em_id = vp_idempresa ' +
                '    AND es_contrato = co_contrato ' +
                '    AND es_nroestableci = vp_establecimiento ' +
                '    AND co_contrato = art.get_vultcontrato(em_cuit) ' +
                '    AND co_idempresa = em_id ' +
                '    AND trunc(vp_fechavisita) BETWEEN :fechadesde AND :fechahasta ' +
                '    AND vp_idpreventor = :idpreventor ' +
                '    AND vp_origen = ''A'' ' +
                '    AND art.hys.get_tipo_empresa_prevencion(vp_idempresa) = te_id ' +
                ' UNION ' +
                ' SELECT   it_nombre, vp_idpreventor, em_cuit, em_nombre, co_contrato, vp_idempresa, vp_establecimiento, es_nombre, vp_origen, ' +
                '          ta_id, ta_descripcion, ''S'' realizado, ' +
                '          NVL((SELECT DISTINCT ''N'' ' +
                '                 FROM hys.hts_tareahys ' +
                '                WHERE ts_idproceso =  art.hys_plan.get_idproceso(''M'', trunc(vp_fechavisita, ''MM''), LAST_DAY(vp_fechavisita)) ' +
                '                  AND ts_fechabaja IS NULL ' +
                '                  AND ts_idtarea = tp_idtarea ' +
                '                  AND ts_idempresa = vp_idempresa ' +
                '                  AND ts_estableci = vp_establecimiento), ' +
                '              ''S'') adicional, te_codigo, trunc(vp_fechavisita) vp_fechavisita ' +
                '     FROM hys.hte_tipoempresaprev, art.pit_firmantes, afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa, hys.hvp_visitapreventor hvp, ' +
                '          hys.htp_tareapreventor HTP, hys.hta_tarea ' +
                '    WHERE tp_idtarea = ta_id ' +
                '      AND tp_idvisitapreventor = vp_id ' +
                '      AND tp_fechabaja IS NULL ' +
                '      AND it_id = vp_idpreventor ' +
                '      AND em_id = vp_idempresa ' +
                '      AND es_contrato = co_contrato ' +
                '      AND es_nroestableci = vp_establecimiento ' +
                '      AND co_contrato = art.get_vultcontrato(em_cuit) ' +
                '      AND co_idempresa = em_id ' +
                '      AND trunc(vp_fechavisita) BETWEEN :fechadesde AND :fechahasta ' +
                '      AND vp_idpreventor = :idpreventor ' +
                '      AND vp_origen = ''P'' ' +
                '      AND art.hys.get_tipo_empresa_prevencion(vp_idempresa) = te_id ' +
                '      AND NOT EXISTS(SELECT 1 ' +
                '                       FROM hys.htp_tareapreventor htp2, hys.hvp_visitapreventor hvp2 ' +
                '                      WHERE htp2.tp_idvisitapreventor = hvp2.vp_id ' +
                '                        AND hvp2.vp_idempresa = hvp.vp_idempresa ' +
                '                        AND hvp2.vp_establecimiento = hvp.vp_establecimiento ' +
                '                        AND htp2.tp_fechabaja IS NULL ' +
                '                        AND hvp2.vp_idpreventor = hvp.vp_idpreventor ' +
                '                        AND htp2.tp_idtarea = HTP.tp_idtarea ' +
                '                        AND hvp2.vp_fechavisita = TRUNC(hvp.vp_fechavisita) ' +
                '                        AND hvp2.vp_origen = ''A'') ' +
                ' UNION ' +
                ' SELECT DISTINCT it_nombre, ps_idpreventor, em_cuit, em_nombre, co_contrato, ts_idempresa, ts_estableci, es_nombre, ''X'', ' +
                '                 ta_id, ta_descripcion, ''N'' realizado, ''N'' adicional, te_codigo, trunc(vp_fechavisita) vp_fechavisita ' +
                '            FROM hys.hte_tipoempresaprev, art.pit_firmantes, afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa, hys.hps_planhys, ' +
                '                 hys.hts_tareahys, hys.hta_tarea, hys.htp_tareapreventor, hys.hvp_visitapreventor ' +
                '           WHERE ts_idvisitapreventor IS NULL ' +
                '             AND ts_idtarea = ta_id ' +
                '             AND em_id = ts_idempresa ' +
                '             AND es_contrato = co_contrato ' +
                '             AND es_nroestableci = ts_estableci ' +
                '             AND co_contrato = art.get_vultcontrato(em_cuit) ' +
                '             AND co_idempresa = em_id ' +
                '             AND it_id = ps_idpreventor ' +
                '             AND ts_idplan = ps_id ' +
                '             AND NOT EXISTS(SELECT 1 ' +
                '                              FROM hys.htp_tareapreventor, hys.hvp_visitapreventor ' +
                '                             WHERE tp_idtarea = ta_id ' +
                '                               AND tp_idvisitapreventor = vp_id ' +
                '                               AND vp_idempresa = ts_idempresa ' +
                '                               AND vp_establecimiento = ts_estableci ' +
                '                               AND tp_fechabaja IS NULL ' +
                '                               AND vp_idpreventor = ps_idpreventor ' +
                '                               AND ts_idtarea = tp_idtarea ' +
                '                               AND ts_idproceso =  art.hys_plan.get_idproceso(''M'', trunc(vp_fechavisita, ''MM''), LAST_DAY(vp_fechavisita))) ' +
                '             AND tp_idvisitapreventor = vp_id ' +
                '             AND vp_idempresa = ts_idempresa ' +
                '             AND vp_establecimiento = ts_estableci ' +
                '             AND tp_fechabaja IS NULL ' +
                '             AND vp_idpreventor = ps_idpreventor ' +
                '             AND ts_idproceso =  art.hys_plan.get_idproceso(''M'', trunc(vp_fechavisita, ''MM''), LAST_DAY(vp_fechavisita)) ' +
                '             AND art.hys.get_tipo_empresa_prevencion(vp_idempresa) = te_id ' +
                '             AND trunc(vp_fechavisita) BETWEEN :fechadesde AND :fechahasta ' +
                '             AND ps_idpreventor = :idpreventor ', [TDateTimeEx.Create(fechaDesde),
                                                                    TDateTimeEx.Create(fechaHasta),
                                                                    IdPreventor]);
  OpenQuery(sdqReporte);
  try
    Visualizar(QrpRemitoPreventor, GetValores, [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  finally
    sdqReporte.Close;
  end;
end;

end.
