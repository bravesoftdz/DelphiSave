unit unRptEstadoResultados;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptEstadoResultados = class(TQuickRep)
    sdqDatosEstado: TSDQuery;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    procedure FormatoCampo2(sender: TObject; var Value: String);
  private
  public

  end;

  procedure DoImprimirEstadoResultados(SqlFiltro: String);

var
  rptEstadoResultados: TrptEstadoResultados;

implementation

uses
  unVisualizador, unDmPrincipal, StrFuncs;

{$R *.DFM}

procedure DoImprimirEstadoResultados(SqlFiltro: String);
var
  rpt: TrptEstadoResultados;
  sSql: String;
begin
  rpt := TrptEstadoResultados.Create( nil );

  with rpt do
    try
      sSql := 'SELECT SUM(RC_DIR_PRIMA) PRIMA_DIRECTA, ' +
                     'SUM(RC_DIR_PRIMA_RE) PRIMA_DIRECTA_REASEGURO, ' +
                     'SUM(RC_DIR_SINPAGADOS) SINIESTROS_PAGADOS, ' +
                     'SUM(RC_DIR_SINPAGADOS_RE) REASEGURO_SINIESTROS_PAGADOS, ' +
                     'SUM(RC_DIR_RVAILT) RESERVA_ILT, ' +
                     'SUM(RC_DIR_RVAILT_RE) REASEGURO_RESERVA_ILT, ' +
                     'SUM(RC_DIR_RVAPESP) RES_PRESTACIONES_EN_ESPECIE, ' +
                     'SUM(RC_DIR_RVAPESP_RE) REASEGURO_RES_PRESTAC_ESPECIE, ' +
                     'SUM(RC_DIR_SPL) SINIESTROS_PROCESO_LIQUIDACION, ' +
                     'SUM(RC_DIR_SPL_RE) REASEGURO_SIN_PROCESO_LIQUIDAC, ' +
                     'SUM(RC_DIR_IBNER) IBNER, ' +
                     'SUM(RC_DIR_IBNER_RE) REASEGURO_IBNER, ' +
                     'SUM(RC_DIR_IBNR) IBNR, ' +
                     'SUM(RC_DIR_IBNR_RE) REASEGURO_IBNR, ' +
                     'SUM(RC_DIR_GSPROD) GASTOS_PRODUCCION_DIRECTOS, ' +
                     'SUM(RC_IND_PRIMA) PRIMAS_INDIRECTAS, ' +
                     'SUM(RC_IND_RVARDONEG) RESERVA_POR_RESULTADO_NEGATIVO, ' +
                     'SUM(RC_IND_RVADESVSIN) RESERVA_DESV_SINIESTROS, ' +
                     'SUM(RC_IND_SINPAGADOS) SINIESTROS_PAGADOS_INDIRECTOS, ' +
                     'SUM(RC_IND_SPL) SIN_PROCESO_LIQUIDAC_INDIRECT, ' +
                     'SUM(RC_IND_IBNER) IBNER_INDIRECTOS, ' +
                     'SUM(RC_IND_IBNR) IBNR_INDIRECTOS, ' +
                     'SUM(RC_IND_PROVSINNOREP) PROVIS_SIN_NO_SUFIC_REPORTADOS, ' +
                     'SUM(RC_IND_RVAEVCATASTR) RESERVA_EVENTOS_CATASTROFICOS, ' +
                     'SUM(RC_IND_GSPROD) GASTOS_PRODUCCION_INDIRECTOS, ' +
                     'SUM(RC_IND_SUELDOS) SUELDOS_Y_CARGAS_SOCIALES, ' +
                     'SUM(RC_IND_HONDIR) HONORARIOS_DIRECTORES_SINDICOS, ' +
                     'SUM(RC_IND_HONPROF) HONORARIOS_PROFESIONALES, ' +
                     'SUM(RC_IND_PUBLICIDAD) PUBLICIDAD_Y_PROPAGANDA, ' +
                     'SUM(RC_IND_ITC) IMPUESTOS_TASAS_CONTRIBUCIONES, ' +
                     'SUM(RC_IND_OTROSGSEXPL) OTROS_GASTOS_EXPLOTACION, ' +
                     'SUM(RC_IND_RECGSGPBA) RECUPERO_GASTOS_GPBA, ' +
                     'SUM(RC_IND_OTROSINGRESOS) OTROS_INGRESOS, ' +
                     'SUM(RC_IND_HYS) HYS_Y_PREVENCION, ' +
                     'SUM(RC_IND_OTROSEGRESOS) OTROS_EGRESOS, ' +
                     'SUM(RC_AMORTIZACION) AMORTIZACION, ' +
                     'SUM(RC_RECUPERO) RECUPERO, ' +
                     'SUM(RC_INTSCOBRADOS) INTERESES_COBRADOS, ' +
                     'SUM(RC_PREVINCOBR) PREVIS_INCOBR_DEUDORES_PREMIO, ' +
                     'SUM(RC_DIR_PRIMA + RC_DIR_PRIMA_RE - RC_DIR_SINPAGADOS - RC_DIR_SINPAGADOS_RE - ' +
                         'RC_DIR_RVAILT - RC_DIR_RVAILT_RE - RC_DIR_RVAPESP - RC_DIR_RVAPESP_RE - ' +
                         'RC_DIR_SPL - RC_DIR_SPL_RE - RC_DIR_IBNER - RC_DIR_IBNER_RE - RC_DIR_IBNR - ' +
                         'RC_DIR_IBNR_RE - RC_DIR_GSPROD) TOT_PRIMAPURA, ' +
                     'SUM(RC_DIR_PRIMA + RC_DIR_PRIMA_RE - RC_DIR_SINPAGADOS - RC_DIR_SINPAGADOS_RE - ' +
                         'RC_DIR_RVAILT - RC_DIR_RVAILT_RE - RC_DIR_RVAPESP - RC_DIR_RVAPESP_RE - ' +
                         'RC_DIR_SPL - RC_DIR_SPL_RE - RC_DIR_IBNER - RC_DIR_IBNER_RE - RC_DIR_IBNR - ' +
                         'RC_DIR_IBNR_RE - RC_DIR_GSPROD + RC_IND_PRIMA - RC_IND_RVARDONEG - RC_IND_RVADESVSIN - ' +
                         'RC_IND_SINPAGADOS - RC_IND_SPL - RC_IND_IBNR - RC_IND_IBNR - RC_IND_PROVSINNOREP - ' +
                         'RC_IND_RVAEVCATASTR - RC_IND_GSPROD - RC_IND_SUELDOS - RC_IND_HONDIR - RC_IND_HONPROF - ' +
                         'RC_IND_PUBLICIDAD - RC_IND_ITC - RC_IND_OTROSGSEXPL + RC_IND_RECGSGPBA + RC_IND_OTROSINGRESOS - ' +
                         'RC_IND_HYS - RC_IND_OTROSEGRESOS) TOT_RESULTADOTECNICO ' +
                'FROM AEM_EMPRESA, ACO_CONTRATO, ORC_RESULTADOCONTRATO ' +
               'WHERE RC_CONTRATO = CO_CONTRATO ' +
                 'AND EM_ID = CO_IDEMPRESA ' +
                SqlFiltro;

      OpenQuery(sdqDatosEstado, sSql);

      Visualizar(rpt, GetValores('Estado de Resultados'), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);
    finally
      free;
    end;
end;

procedure TrptEstadoResultados.FormatoCampo2(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
