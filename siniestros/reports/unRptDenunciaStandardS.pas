unit unRptDenunciaStandardS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrDenunciaStandardS = class(TQuickRep)
    sdqDatos: TSDQuery;
    qrbFormulario: TQRBand;
    QRShape172: TQRShape;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRShape3: TQRShape;
    QRShape154: TQRShape;
    QRShape129: TQRShape;
    QRShape128: TQRShape;
    QRShape69: TQRShape;
    QRShape67: TQRShape;
    QRShape66: TQRShape;
    QRShape65: TQRShape;
    QRShape63: TQRShape;
    QRShape59: TQRShape;
    QRShape62: TQRShape;
    QRShape58: TQRShape;
    QRShape64: TQRShape;
    qrdbTJ_LOCALIDAD: TQRDBText;
    QRLabel37: TQRLabel;
    qrdbJW_PISO: TQRDBText;
    QRLabel34: TQRLabel;
    qrdbTJ_NUMERO: TQRDBText;
    QRLabel32: TQRLabel;
    QRShape11: TQRShape;
    QRShape9: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel7: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    qrdbSINMULT_SI: TQRDBText;
    QRShape18: TQRShape;
    qrdbSINMULT_NO: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrdbEW_FECHASIN: TQRDBText;
    QRShape20: TQRShape;
    QRLabel10: TQRLabel;
    QRShape24: TQRShape;
    QRLabel13: TQRLabel;
    QRShape25: TQRShape;
    qrdbMP_CONTRATO: TQRDBText;
    QRShape26: TQRShape;
    QRLabel14: TQRLabel;
    QRShape27: TQRShape;
    qrdbEW_CUIT: TQRDBText;
    QRShape28: TQRShape;
    QRLabel15: TQRLabel;
    QRShape29: TQRShape;
    qrdbMP_NOMBRE: TQRDBText;
    QRShape30: TQRShape;
    QRLabel16: TQRLabel;
    QRShape37: TQRShape;
    QRLabel20: TQRLabel;
    QRShape38: TQRShape;
    qrdbTJ_DOCUMENTO: TQRDBText;
    QRShape39: TQRShape;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    qrdbJW_NOMBRE: TQRDBText;
    QRShape31: TQRShape;
    QRLabel17: TQRLabel;
    QRShape32: TQRShape;
    qrdbTJ_CUIL: TQRDBText;
    QRShape53: TQRShape;
    QRLabel28: TQRLabel;
    QRShape54: TQRShape;
    qrdbJW_NACIONALIDAD: TQRDBText;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel31: TQRLabel;
    QRShape60: TQRShape;
    QRLabel33: TQRLabel;
    QRShape61: TQRShape;
    qrdbJW_CALLE: TQRDBText;
    QRLabel39: TQRLabel;
    QRShape73: TQRShape;
    qrdbPROVINCIATRAB: TQRDBText;
    QRShape74: TQRShape;
    QRLabel40: TQRLabel;
    QRShape75: TQRShape;
    qrdbJW_TELEFONO: TQRDBText;
    QRShape78: TQRShape;
    QRLabel42: TQRLabel;
    QRShape79: TQRShape;
    qrdbJW_PUESTO: TQRDBText;
    QRShape86: TQRShape;
    QRLabel46: TQRLabel;
    QRShape87: TQRShape;
    qrdbHORARIO_HABITUAL: TQRDBText;
    QRShape91: TQRShape;
    QRLabel49: TQRLabel;
    QRShape92: TQRShape;
    qrdbES_DOMICILIO: TQRDBText;
    QRShape97: TQRShape;
    QRLabel52: TQRLabel;
    QRShape98: TQRShape;
    qrdbEW_EPMANIFESTACION: TQRDBText;
    QRShape93: TQRShape;
    QRLabel50: TQRLabel;
    QRShape103: TQRShape;
    qrdbLUGAR_ACCIENTE: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape127: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRShape134: TQRShape;
    QRLabel74: TQRLabel;
    QRShape135: TQRShape;
    qrdbDE_IDLESIONZONA2: TQRDBText;
    QRShape136: TQRShape;
    QRLabel75: TQRLabel;
    QRShape137: TQRShape;
    qrdbDE_IDLESIONNATURALEZA2: TQRDBText;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    qrdbGRAVEDAD_LEVE: TQRDBText;
    QRShape141: TQRShape;
    QRShape142: TQRShape;
    qrdbGRAVEDAD_GRAVE: TQRDBText;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    qrdbGRAVEDAD_MORTAL: TQRDBText;
    QRShape153: TQRShape;
    qrdbACCIDTRANSITO_SI: TQRDBText;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    qrdbDE_OBSERVACIONES: TQRDBText;
    QRShape157: TQRShape;
    QRLabel87: TQRLabel;
    QRShape159: TQRShape;
    QRLabel89: TQRLabel;
    QRShape160: TQRShape;
    qrdbDE_PRESTADOR_NOMBRE: TQRDBText;
    QRShape161: TQRShape;
    QRLabel90: TQRLabel;
    QRShape162: TQRShape;
    qrdbPRESTADOR_DOMICILIO: TQRDBText;
    QRShape163: TQRShape;
    QRLabel91: TQRLabel;
    QRShape164: TQRShape;
    qrdbDE_PRESTADOR_TELEFONOS: TQRDBText;
    QRLabel96: TQRLabel;
    QRShape174: TQRShape;
    QRLabel98: TQRLabel;
    QRShape175: TQRShape;
    qrdbDE_ITINERE_COMISARIA: TQRDBText;
    QRShape176: TQRShape;
    QRLabel99: TQRLabel;
    QRShape177: TQRShape;
    qrdbDENUNCIA_DOMICILIO: TQRDBText;
    QRShape178: TQRShape;
    QRLabel100: TQRLabel;
    QRShape179: TQRShape;
    qrdbDE_ITINERE_COM_TELEFONOS: TQRDBText;
    QRShape181: TQRShape;
    QRLabel102: TQRLabel;
    QRShape182: TQRShape;
    qrdbDE_ITINERE_TESTIGO1_NOMBRE: TQRDBText;
    QRShape183: TQRShape;
    QRLabel103: TQRLabel;
    QRShape184: TQRShape;
    qrdbDE_ITINERE_TESTIGO1_DOMICILIO: TQRDBText;
    QRShape185: TQRShape;
    QRLabel104: TQRLabel;
    QRShape186: TQRShape;
    qrdbDE_ITINERE_TESTIGO1_TELEFONOS: TQRDBText;
    QRShape173: TQRShape;
    QRLabel97: TQRLabel;
    QRShape180: TQRShape;
    QRShape187: TQRShape;
    QRLabel101: TQRLabel;
    QRLabel105: TQRLabel;
    qrdbPOLIDENUN_SI: TQRDBText;
    qrdbPOLIDENUN_NO: TQRDBText;
    QRShape188: TQRShape;
    QRLabel106: TQRLabel;
    QRShape189: TQRShape;
    qrdbDE_ITINERE_TESTIGO2_NOMBRE: TQRDBText;
    QRShape190: TQRShape;
    QRLabel107: TQRLabel;
    QRShape191: TQRShape;
    qrdbDE_ITINERE_TESTIGO2_DOMICILIO: TQRDBText;
    QRShape192: TQRShape;
    QRLabel108: TQRLabel;
    QRShape193: TQRShape;
    qrdbDE_ITINERE_TESTIGO2_TELEFONOS: TQRDBText;
    QRShape194: TQRShape;
    QRLabel109: TQRLabel;
    QRShape195: TQRShape;
    qrdbDE_ITINERE_TERCERO_RESP_NOMBRE: TQRDBText;
    QRShape196: TQRShape;
    QRLabel110: TQRLabel;
    QRShape197: TQRShape;
    qrdbDE_ITINERE_TERCERO_RESP_DOM: TQRDBText;
    QRShape198: TQRShape;
    QRLabel111: TQRLabel;
    QRShape199: TQRShape;
    qrdbDE_ITINERE_TERCERO_RESP_TEL: TQRDBText;
    QRShape202: TQRShape;
    QRLabel113: TQRLabel;
    QRShape203: TQRShape;
    QRShape204: TQRShape;
    QRLabel114: TQRLabel;
    QRShape205: TQRShape;
    qrdbEW_FECHARECEPCION: TQRDBText;
    QRShape206: TQRShape;
    QRLabel115: TQRLabel;
    QRShape207: TQRShape;
    qrdbDE_DESCRIPCION: TQRDBText;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel36: TQRLabel;
    qrdbJW_CODPOSTAL: TQRDBText;
    QRLabel35: TQRLabel;
    qrdbJW_DEPARTAMENTO: TQRDBText;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    qrdbSEXO: TQRDBText;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel27: TQRLabel;
    qrdbJW_FEC_NACIMIENTO: TQRDBText;
    QRLabel38: TQRLabel;
    qrdbJW_FEC_INGRESO: TQRDBText;
    QRShape36: TQRShape;
    QRShape41: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QRShape33: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape42: TQRShape;
    QRLabel22: TQRLabel;
    QRShape47: TQRShape;
    QRDBText5: TQRDBText;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape50: TQRShape;
    QRLabel24: TQRLabel;
    QRShape51: TQRShape;
    QRLabel26: TQRLabel;
    QRShape52: TQRShape;
    QRDBText7: TQRDBText;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape80: TQRShape;
    V: TQRShape;
    QRLabel41: TQRLabel;
    QRDBText10: TQRDBText;
    qriLogo: TQRImage;
    QRShape81: TQRShape;
    QRLabel4: TQRLabel;
    QRShape19: TQRShape;
    QRLabel11: TQRLabel;
    QRShape21: TQRShape;
    QRDBText11: TQRDBText;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel43: TQRLabel;
    QRShape85: TQRShape;
    QRLabel45: TQRLabel;
    QRShape88: TQRShape;
    QRDBText14: TQRDBText;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRLabel48: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape96: TQRShape;
    QRLabel51: TQRLabel;
    QRShape99: TQRShape;
    QRDBText17: TQRDBText;
    QRShape100: TQRShape;
    QRLabel53: TQRLabel;
    QRShape101: TQRShape;
    QRDBText18: TQRDBText;
    QRShape102: TQRShape;
    QRLabel54: TQRLabel;
    QRShape104: TQRShape;
    QRDBText19: TQRDBText;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRDBText20: TQRDBText;
    QRLabel55: TQRLabel;
    QRShape107: TQRShape;
    QRDBText21: TQRDBText;
    QRShape108: TQRShape;
    QRLabel56: TQRLabel;
    QRShape109: TQRShape;
    QRLabel57: TQRLabel;
    QRShape110: TQRShape;
    QRDBText22: TQRDBText;
    QRShape111: TQRShape;
    QRLabel58: TQRLabel;
    QRShape112: TQRShape;
    QRDBText23: TQRDBText;
    QRShape113: TQRShape;
    QRLabel59: TQRLabel;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRLabel60: TQRLabel;
    QRShape116: TQRShape;
    QRLabel61: TQRLabel;
    QRShape117: TQRShape;
    QRDBText25: TQRDBText;
    QRShape118: TQRShape;
    QRLabel62: TQRLabel;
    QRShape119: TQRShape;
    QRDBText26: TQRDBText;
    QRShape120: TQRShape;
    QRLabel63: TQRLabel;
    QRShape122: TQRShape;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape121: TQRShape;
    QRShape123: TQRShape;
    QRLabel64: TQRLabel;
    QRDBText28: TQRDBText;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRLabel65: TQRLabel;
    QRDBText29: TQRDBText;
    QRShape126: TQRShape;
    QRShape130: TQRShape;
    QRDBText30: TQRDBText;
    QRLabel66: TQRLabel;
    QRShape131: TQRShape;
    QRLabel67: TQRLabel;
    QRShape132: TQRShape;
    QRDBText31: TQRDBText;
    QRShape133: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRDBText32: TQRDBText;
    QRLabel68: TQRLabel;
    QRShape82: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    qrdbTS_ACCIDENTE: TQRDBText;
    qrdbTS_INITINERE: TQRDBText;
    qrdbTS_ENFPROF: TQRDBText;
    qrdbSINIESTRO: TQRDBText;
  private
  public
    procedure Imprimir(ASiniestroCompleto: String; IdExpediente, ASiniestro: integer);
  end;

var
  qrDenunciaStandardS: TqrDenunciaStandardS;

implementation

uses unComunes, unVisualizador, unDmPrincipal;

{$R *.DFM}

procedure TqrDenunciaStandardS.Imprimir(ASiniestroCompleto: String; IdExpediente, ASiniestro: integer);
var
  sSql :string;
begin
  sSql := ' SELECT ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO,EX_ORDEN,EX_RECAIDA) SINIESTRO, ' +
                 ' DECODE(EX_TIPO,1,''X'') ACCIDENTE, ' +
                 ' DECODE(EX_TIPO,2,''X'') INITINERE, ' +
                 ' DECODE(EX_TIPO,3,''X'') ENFPROF, ' +
                 ' DECODE(EX_SINIESTROMULTIPLE,''S'',''X'') SINMULT_SI, ' +
                 ' DECODE(EX_SINIESTROMULTIPLE,''N'',''X'') SINMULT_NO, ' +
                 ' EX_FECHAACCIDENTE FECHASIN, EM_NOMBRE, EM_CUIT, EX_CONTRATO CONTRATO, ' +
                 ' TJ_NOMBRE, TJ_CUIL, TJ_DOCUMENTO, IIF_CHAR(TJ_SEXO,''F'',''Femenino'', ''Masculino'') SEXO, ' +
                 ' TJ_FNACIMIENTO, NA_DESCRIPCION NACIONALIDAD,  RL_SUELDO REMUNERACION, ' +
                 ' DE_ANTIGUEDADPUESTO FECHAINGRESO, DE_INICIOINASISTENCIALABORAL, ' +
                 ' PUEST.CI_DESCRIPCION PUESTO, TAREAACC.CI_DESCRIPCION TAREAACCIDENTE, TAREAANT.CI_DESCRIPCION TAREAANTERIOR, RL_CIUO, ' +
                 ' DE_ANIOSPUESTO ANTIGUEDADANIOS, DE_MESESPUESTO ANTIGUEDADMESES, ' +
                 ' TJ_CALLE, TJ_NUMERO, TJ_PISO, TJ_DEPARTAMENTO, TJ_CPOSTAL, TJ_LOCALIDAD, ' +
                 ' PROVTRAB.PV_DESCRIPCION PROVINCIATRAB, art.trabajador.get_telefono(tj_id, 5) Telefono, ' +
                 ' ''De '' || DE_HORJORNADA1DESDE || '' Hs a '' || DE_HORJORNADA1HASTA || '' Hs'' HORARIO_JORNADA1, ' +
                 ' ''De '' || DE_HORJORNADA2DESDE || '' Hs a '' || DE_HORJORNADA2HASTA || '' Hs'' HORARIO_JORNADA2, ' +
                 ' DE_EPMANIFESTACION, ES_DOMICILIO,  ' +
                 ' DECODE(DE_SUBTIPO,''1'',''En el trabajo'') || ' +
                 ' DECODE(DE_SUBTIPO,''2'',''En otro centro o lugar de trabajo'') || ' +
                 ' DECODE(DE_SUBTIPO,''3'',''Al ir o al volver del trabajo'') ||  ' +
                 ' DECODE(DE_SUBTIPO,''4'',''Desplazamiento en día laboral'') LUGAR_ACCIDENTE, ' +
                 ' DE_DESCRIPCION, ' +

                 ' ZONA1.LZ_DESCRIPCION LESZONA1, ZONA2.LZ_DESCRIPCION LESZONA2, ZONA3.LZ_DESCRIPCION LESZONA3, ' +

                 ' NAT1.LN_DESCRIPCION LESNAT1, NAT2.LN_DESCRIPCION LESNAT2, NAT3.LN_DESCRIPCION LESNAT3, ' +
                 ' DIAG1.DG_DESCRIPCION DIAGNOSTICO1, DIAG2.DG_DESCRIPCION DIAGNOSTICO2, DIAG3.DG_DESCRIPCION DIAGNOSTICO3, ' +
                 ' DE_IDLESIONFORMA, ' +
                 ' IIF_CHAR(DE_ACCIDENTETRANSITO, ''N'', ''NO'', ''SI'') ACCIDTRANSITO, ' +
                 ' DECODE(DE_IDGRAVEDAD,1,''X'',2,''X'',3,''X'') GRAVEDAD_LEVE, ' +
                 ' DECODE(DE_IDGRAVEDAD,4,''X'') GRAVEDAD_GRAVE, ' +
                 ' DECODE(DE_IDGRAVEDAD,5,''X'') GRAVEDAD_MORTAL, ' +
                 ' DECODE(DE_ACCIDENTETRANSITO,''S'',''X'') ACCTRANSITO_SI, ' +
                 ' DECODE(DE_ACCIDENTETRANSITO,''N'',''X'') ACCTRANSITO_NO, ' +
                 ' IIF_CHAR(DE_INTERNACION, ''N'', ''NO'', ''SI'') INTERNADO, ' +
                 ' DE_OBSERVACIONES, DE_PRESTADOR_NOMBRE, ' +
                 ' ART.UTILES.armar_domicilio(DE_PRESTADOR_CALLE,DE_PRESTADOR_NUMERO,DE_PRESTADOR_PISO,DE_PRESTADOR_DEPARTAMENTO,DE_PRESTADOR_LOCALIDAD) ' +
                 '  ||'' ''|| DE_PRESTADOR_CPOSTAL PRESTADOR_DOMICILIO, ' +
                 ' DE_PRESTADOR_TELEFONOS,  ' +
                 ' DECODE(DE_ITINERE_DENUNCIAPOLICIAL,''S'',''X'') POLIDENUN_SI, ' +
                 ' DECODE(DE_ITINERE_DENUNCIAPOLICIAL,''N'',''X'') POLIDENUN_NO, DE_ITINERE_COMISARIA, ' +
                 ' ART.UTILES.armar_domicilio(DE_ITINERE_COM_CALLE,DE_ITINERE_COM_NUMERO,DE_ITINERE_COM_PISO,DE_ITINERE_COM_DEPARTAMENTO,DE_ITINERE_COM_LOCALIDAD) ' +
                 '  ||'' ''|| DE_ITINERE_COM_CPOSTAL DENUNCIA_DOMICILIO, ' +
                 ' DE_ITINERE_NRODENUNCIA, DE_ITINERE_TESTIGO1_NOMBRE, DE_ITINERE_TESTIGO1_DOMICILIO, ' +
                 ' DE_ITINERE_TESTIGO1_TELEFONOS, DE_ITINERE_TESTIGO2_NOMBRE, DE_ITINERE_TESTIGO2_DOMICILIO, DE_ITINERE_TESTIGO2_TELEFONOS, ' +
                 ' DE_ITINERE_TERCERO_RESP_NOMBRE, DE_ITINERE_TERCERO_RESP_DOM, DE_ITINERE_TERCERO_RESP_TEL, DE_FECHARECEPCION, ' +
                 ' LESACC.LA_DESCRIPCION AGENTE_CAUSANTE, ' +
                 ' DECODE(DE_QUIENDENUNCIA,''1'',''Sin datos'') || ' +
                 ' DECODE(DE_QUIENDENUNCIA,''2'',''Denunciado por el Trabajador'') || ' +
                 ' DECODE(DE_QUIENDENUNCIA,''3'',''No denunciado por el Trabajador'') QUIEN_DENUNCIA,  ' +
                 ' GCIE10.TC_DESCRIPCION GRAVEDADCIE10, LF_DESCRIPCION LESIONFORMA, ' +

                 ' LES_EP.LA_DESCRIPCION AGENTE_CAUSANTE_EP, EP_DIAGNOSTICO, DCIE10_EP.DG_DESCRIPCION DIAG_CIE10_EP, ' +
                 ' LM_DESCRIPCION AGENTEMATERIAL_EP, ZONA_EP.LZ_DESCRIPCION LESZONA_EP, ' +
                 ' EP_TIEMPOEXPOSICION, EP_FECHADIAGNOSTICO, MODDET_EP.MD_DESCRIPCION MODODETECCION_EP, ' +
                 ' DE_FECHACARGA,  ' +
                 ' CA_DESCRIPCION NOMBREPRESTADOR, CA_DOMICILIO, CA_TELEFONO, PROVPREST.PV_DESCRIPCION PROVINCIAPREST ' +

            ' FROM SIN.SDE_DENUNCIA, AEM_EMPRESA, ART.SEX_EXPEDIENTES,  CTJ_TRABAJADOR, ' +
                 ' CNA_NACIONALIDAD, CRL_RELACIONLABORAL, ART.CPV_PROVINCIAS PROVTRAB,  ' +
                 ' CRE_RELACIONESTABLECIMIENTO, AES_ESTABLECIMIENTO, CCI_CIUO PUEST, CCI_CIUO TAREAACC, CCI_CIUO TAREAANT, ' +
                 ' SLA_LESIONAGENTE LESACC, CDG_DIAGNOSTICO DIAG1, CDG_DIAGNOSTICO DIAG2, CDG_DIAGNOSTICO DIAG3, ' +
                 ' SIN.SLN_LESIONNATURALEZA NAT1, SIN.SLN_LESIONNATURALEZA NAT2, SIN.SLN_LESIONNATURALEZA NAT3, ' +
                 ' SIN.SLZ_LESIONZONA ZONA1, SIN.SLZ_LESIONZONA ZONA2, SIN.SLZ_LESIONZONA ZONA3, ' +
                 ' SIN.STC_TIPOGRAVEDAD_CIE10 GCIE10, SIN.SLF_LESIONFORMA, SIN.SEP_ENFERMEDADPROFESIONAL, SLA_LESIONAGENTE LES_EP, ' +
                 ' CDG_DIAGNOSTICO DCIE10_EP, SIN.SLM_LESIONAGENTEMATERIAL, SIN.SLZ_LESIONZONA ZONA_EP, ' +
                 ' SIN.SMD_MODODETECCION MODDET_EP, CPR_PRESTADOR, ART.CPV_PROVINCIAS PROVPREST ' +

           ' WHERE DE_IDEXPEDIENTE = EX_ID ' +
             ' AND EM_CUIT = EX_CUIT ' +
             ' AND NA_ID(+) = TJ_IDNACIONALIDAD ' +
             ' AND TJ_ID = EX_IDTRABAJADOR ' +
             ' AND RL_IDTRABAJADOR(+) = EX_IDTRABAJADOR ' +
             ' AND PROVTRAB.PV_CODIGO(+) = TJ_PROVINCIA ' +
             ' AND RE_IDRELACIONLABORAL(+) = RL_ID ' +
             ' AND ES_ID(+) = RE_IDESTABLECIMIENTO ' +
             ' AND PUEST.CI_ID(+) = DE_TAREAHABITUAL ' +
             ' AND TAREAACC.CI_ID(+) = DE_TAREAACCIDENTE ' +
             ' AND TAREAANT.CI_ID(+) = DE_TAREAANTERIOR ' +
             ' AND LESACC.LA_ID(+) = DE_IDLESIONAGENTE ' +
             ' AND DIAG1.DG_ID(+) = DE_IDDIAGNOSTICO ' +
             ' AND DIAG2.DG_ID(+) = DE_IDDIAGNOSTICO2 ' +
             ' AND DIAG3.DG_ID(+) = DE_IDDIAGNOSTICO3 ' +
             ' AND NAT1.LN_ID(+) = DE_IDLESIONNATURALEZA ' +
             ' AND NAT2.LN_ID(+) = DE_IDLESIONNATURALEZA2 ' +
             ' AND NAT3.LN_ID(+) = DE_IDLESIONNATURALEZA3 ' +
             ' AND ZONA1.LZ_ID(+) = DE_IDLESIONZONA ' +
             ' AND ZONA2.LZ_ID(+) = DE_IDLESIONZONA2 ' +
             ' AND ZONA3.LZ_ID(+) = DE_IDLESIONZONA3 ' +
             ' AND GCIE10.TC_ID(+) = DE_IDGRAVEDAD_CIE10 ' +
             ' AND LF_ID(+) = DE_IDLESIONFORMA ' +
             ' AND LES_EP.LA_ID(+) = EP_IDLESIONAGENTE ' +
             ' AND DCIE10_EP.DG_ID(+) = EP_IDDIAGNOSTICO ' +
             ' AND LM_ID(+) = EP_IDLESIONAGENTEMATERIAL ' +
             ' AND ZONA_EP.LZ_ID(+) = EP_IDLESIONZONA ' +
             ' AND CA_IDENTIFICADOR(+) = DE_IDPRESTADOR ' +
             ' AND PROVPREST.PV_CODIGO(+) = CA_IDENTIFICADOR ' +
             ' AND PROVPREST.PV_CODIGO(+) = CA_PROVINCIA ' +
             ' AND EP_IDEXPEDIENTE(+) = EX_ID ' +
             ' AND MODDET_EP.MD_ID(+) = EP_MODODETECCION ' +
             ' AND EX_ID = :IdExp ';

  sdqDatos.SQL.Text := sSql;
  sdqDatos.ParamByName('IdExp').AsInteger := IdExpediente;
  OpenQuery(sdqDatos);

  if Is_SiniestroDeGobernacion(IdExpediente) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_2009_BYN_CHICO');

  Visualizar(Self, GetValores(' - ' + ASiniestroCompleto, '', 0, ASiniestro),
             [oAutoFirma, oForceDB, oForceShowModal, oAlwaysShowDialog], true, '', '', true);  // TK 
end;

end.
