unit unRptParteMedicoIngreso;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ArtQReports,
  Db, SDEngine, ArtDatabase;

type
  TrptParteMedicoIngreso = class(TQuickRep)
    sdqDatos: TSDQuery;
    qrbFormulario: TQRBand;
    QRShape11: TQRShape;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRMemo;
    QRShape6: TQRShape;
    qrdbTS_REAGRAVAMIENTO: TQRDBText;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    qrdbTS_ACCIDENTE: TQRDBText;
    QRMemo1: TQRMemo;
    QRShape10: TQRShape;
    QRMemo2: TQRMemo;
    qrdbTS_INITINERE: TQRDBText;
    QRShape12: TQRShape;
    QRMemo3: TQRMemo;
    QRShape13: TQRShape;
    qrdbTS_ENFPROF: TQRDBText;
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
    qrdbIW_FECHASIN: TQRDBText;
    QRShape20: TQRShape;
    QRLabel10: TQRLabel;
    QRShape26: TQRShape;
    QRLabel14: TQRLabel;
    QRShape27: TQRShape;
    qrdbCA_CLAVE: TQRDBText;
    QRShape28: TQRShape;
    QRLabel15: TQRLabel;
    QRShape29: TQRShape;
    qrdbCA_DESCRIPCION: TQRDBText;
    QRShape30: TQRShape;
    QRLabel16: TQRLabel;
    QRShape37: TQRShape;
    QRLabel20: TQRLabel;
    QRShape38: TQRShape;
    qrdbTD_CUIL: TQRDBText;
    QRShape39: TQRShape;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    qrdbJW_NOMBRE: TQRDBText;
    QRShape31: TQRShape;
    QRLabel17: TQRLabel;
    QRShape32: TQRShape;
    qrdbTD_DNI: TQRDBText;
    QRShape33: TQRShape;
    QRLabel18: TQRLabel;
    QRShape34: TQRShape;
    qrdbTD_LC: TQRDBText;
    QRShape35: TQRShape;
    QRLabel19: TQRLabel;
    QRShape36: TQRShape;
    qrdbTD_LE: TQRDBText;
    QRShape41: TQRShape;
    QRLabel22: TQRLabel;
    QRShape42: TQRShape;
    qrdbTD_CI: TQRDBText;
    QRShape43: TQRShape;
    QRLabel23: TQRLabel;
    QRShape44: TQRShape;
    qrdbTD_PAS: TQRDBText;
    QRShape45: TQRShape;
    QRLabel24: TQRLabel;
    QRShape46: TQRShape;
    qrdbJW_DOCUMENTO: TQRDBText;
    QRShape47: TQRShape;
    QRLabel25: TQRLabel;
    QRShape48: TQRShape;
    qrdbSEXO: TQRDBText;
    QRShape49: TQRShape;
    QRLabel26: TQRLabel;
    QRShape50: TQRShape;
    qrdbESTCIVILDESCRIPCION: TQRDBText;
    QRShape51: TQRShape;
    QRLabel27: TQRLabel;
    QRShape52: TQRShape;
    qrdbJW_FEC_NACIMIENTO: TQRDBText;
    QRShape53: TQRShape;
    QRLabel28: TQRLabel;
    QRShape54: TQRShape;
    qrdbJW_NACIONALIDAD: TQRDBText;
    QRShape57: TQRShape;
    QRLabel31: TQRLabel;
    QRShape58: TQRShape;
    QRLabel32: TQRLabel;
    QRShape59: TQRShape;
    qrdbJW_NUMERO: TQRDBText;
    QRShape60: TQRShape;
    QRLabel33: TQRLabel;
    QRShape61: TQRShape;
    qrdbJW_CALLE: TQRDBText;
    QRShape62: TQRShape;
    QRLabel34: TQRLabel;
    QRShape63: TQRShape;
    qrdbJW_PISO: TQRDBText;
    QRShape64: TQRShape;
    QRLabel35: TQRLabel;
    QRShape65: TQRShape;
    qrdbJW_DEPARTAMENTO: TQRDBText;
    QRShape66: TQRShape;
    QRLabel36: TQRLabel;
    QRShape67: TQRShape;
    qrdbJW_CODPOSTAL: TQRDBText;
    QRShape68: TQRShape;
    QRLabel37: TQRLabel;
    QRShape69: TQRShape;
    qrdbJW_LOCALIDAD: TQRDBText;
    QRShape72: TQRShape;
    QRLabel39: TQRLabel;
    QRShape73: TQRShape;
    qrdbPROVINCIATRAB: TQRDBText;
    qrdbIW_TRANSACCION: TQRDBText;
    QRLabel2: TQRLabel;
    qrdbSINIESTRO: TQRDBText;
    QRShape128: TQRShape;
    QRLabel71: TQRLabel;
    QRShape130: TQRShape;
    QRLabel72: TQRLabel;
    QRShape131: TQRShape;
    qrdbEW_FORMA: TQRDBText;
    QRShape129: TQRShape;
    QRShape132: TQRShape;
    QRLabel73: TQRLabel;
    QRShape133: TQRShape;
    qrdbEW_AGENTE: TQRDBText;
    QRShape134: TQRShape;
    QRLabel74: TQRLabel;
    QRShape135: TQRShape;
    qrdbEW_ZONA: TQRDBText;
    QRShape136: TQRShape;
    QRLabel75: TQRLabel;
    QRShape137: TQRShape;
    qrdbEW_NATURALEZA: TQRDBText;
    QRShape3: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    qrdbCA_LOCALIDAD: TQRDBText;
    QRLabel11: TQRLabel;
    qrdbCA_CODPOSTAL: TQRDBText;
    QRLabel12: TQRLabel;
    qrdbCA_DEPARTAMENTO: TQRDBText;
    QRLabel13: TQRLabel;
    qrdbCA_PISOCALLE: TQRDBText;
    QRLabel106: TQRLabel;
    qrdbCA_NUMERO: TQRDBText;
    QRLabel107: TQRLabel;
    QRShape193: TQRShape;
    QRLabel108: TQRLabel;
    QRShape194: TQRShape;
    qrdbCA_CALLE: TQRDBText;
    QRLabel109: TQRLabel;
    QRShape195: TQRShape;
    qrdbPROVINCIAPREST: TQRDBText;
    QRShape196: TQRShape;
    QRLabel110: TQRLabel;
    QRShape197: TQRShape;
    qrdbCA_TELEFONO: TQRDBText;
    QRShape55: TQRShape;
    QRLabel29: TQRLabel;
    QRShape71: TQRShape;
    QRLabel38: TQRLabel;
    QRShape74: TQRShape;
    qrdbIW_LUGAROCURRENCIA: TQRDBText;
    QRShape56: TQRShape;
    QRLabel30: TQRLabel;
    QRShape70: TQRShape;
    QRDBText1: TQRDBText;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    qrdbIW_LUGARLOCALIDAD: TQRDBText;
    QRLabel40: TQRLabel;
    qrdbIW_LUGARCPOSTAL: TQRDBText;
    QRLabel41: TQRLabel;
    qrdbIW_LUGARDEPTO: TQRDBText;
    QRLabel42: TQRLabel;
    qrdbIW_LUGARPISO: TQRDBText;
    QRLabel43: TQRLabel;
    QRShape86: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape87: TQRShape;
    qrdbPROVINCIAOCURRENCIA: TQRDBText;
    QRShape88: TQRShape;
    qrdbIW_LUGARNRO: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape89: TQRShape;
    qrdbIW_LUGARCALLE: TQRDBText;
    QRShape90: TQRShape;
    QRLabel48: TQRLabel;
    QRShape91: TQRShape;
    QRLabel49: TQRLabel;
    QRShape92: TQRShape;
    QRLabel50: TQRLabel;
    QRShape93: TQRShape;
    qrdbIW_EPMANIFESTACION: TQRDBText;
    QRShape94: TQRShape;
    QRLabel51: TQRLabel;
    QRShape95: TQRShape;
    qrdbIW_AGENTERIESGO: TQRDBText;
    QRShape96: TQRShape;
    QRLabel52: TQRLabel;
    QRShape97: TQRShape;
    qrdbIW_EPEXPUESTODESDE: TQRDBText;
    QRShape98: TQRShape;
    QRLabel53: TQRLabel;
    QRShape99: TQRShape;
    qrdbIW_FECORIGINAL: TQRDBText;
    QRShape101: TQRShape;
    QRLabel54: TQRLabel;
    QRShape100: TQRShape;
    QRLabel55: TQRLabel;
    QRShape102: TQRShape;
    qrdbIW_FECHASIN2: TQRDBText;
    QRShape103: TQRShape;
    QRLabel56: TQRLabel;
    QRShape104: TQRShape;
    QRDBText15: TQRDBText;
    QRShape105: TQRShape;
    QRLabel57: TQRLabel;
    QRShape106: TQRShape;
    QRDBText16: TQRDBText;
    QRShape107: TQRShape;
    QRLabel58: TQRLabel;
    QRShape108: TQRShape;
    QRDBText17: TQRDBText;
    QRShape109: TQRShape;
    QRLabel59: TQRLabel;
    QRShape110: TQRShape;
    QRDBText18: TQRDBText;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape114: TQRShape;
    QRLabel63: TQRLabel;
    QRShape116: TQRShape;
    QRDBText19: TQRDBText;
    QRShape115: TQRShape;
    QRLabel64: TQRLabel;
    QRShape117: TQRShape;
    QRDBText20: TQRDBText;
    QRShape118: TQRShape;
    QRLabel65: TQRLabel;
    QRShape119: TQRShape;
    QRDBText21: TQRDBText;
    QRShape120: TQRShape;
    QRLabel66: TQRLabel;
    QRShape121: TQRShape;
    QRDBText22: TQRDBText;
    QRShape122: TQRShape;
    QRLabel67: TQRLabel;
    QRShape123: TQRShape;
    QRDBText23: TQRDBText;
    QRShape124: TQRShape;
    QRLabel68: TQRLabel;
    QRShape125: TQRShape;
    QRDBText24: TQRDBText;
    QRShape126: TQRShape;
    QRLabel69: TQRLabel;
    QRShape127: TQRShape;
    QRLabel70: TQRLabel;
    QRShape138: TQRShape;
    QRDBText25: TQRDBText;
    QRShape139: TQRShape;
    QRLabel76: TQRLabel;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRLabel77: TQRLabel;
    QRShape142: TQRShape;
    QRDBText27: TQRDBText;
    QRShape143: TQRShape;
    QRLabel78: TQRLabel;
    QRShape144: TQRShape;
    QRDBText28: TQRDBText;
    QRShape198: TQRShape;
    QRLabel79: TQRLabel;
    QRShape199: TQRShape;
    QRDBText29: TQRDBText;
    QRShape145: TQRShape;
    QRLabel80: TQRLabel;
    QRShape146: TQRShape;
    QRDBText30: TQRDBText;
    QRShape147: TQRShape;
    QRLabel81: TQRLabel;
    QRShape149: TQRShape;
    QRLabel82: TQRLabel;
    QRShape148: TQRShape;
    QRDBText31: TQRDBText;
    QRShape150: TQRShape;
    QRLabel83: TQRLabel;
    QRShape151: TQRShape;
    QRDBText32: TQRDBText;
    QRShape152: TQRShape;
    QRLabel84: TQRLabel;
    QRShape153: TQRShape;
    QRLabel85: TQRLabel;
    QRShape154: TQRShape;
    QRShape159: TQRShape;
    QRLabel88: TQRLabel;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRLabel89: TQRLabel;
    QRShape162: TQRShape;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRShape155: TQRShape;
    QRLabel86: TQRLabel;
    QRShape156: TQRShape;
    QRDBText36: TQRDBText;
    QRShape157: TQRShape;
    QRLabel87: TQRLabel;
    QRShape158: TQRShape;
    QRDBText37: TQRDBText;
    QRShape163: TQRShape;
    QRLabel90: TQRLabel;
    QRShape164: TQRShape;
    QRDBText38: TQRDBText;
    QRShape165: TQRShape;
    QRLabel91: TQRLabel;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRLabel92: TQRLabel;
    QRShape168: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRLabel93: TQRLabel;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRLabel94: TQRLabel;
    QRShape173: TQRShape;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRShape174: TQRShape;
    QRLabel95: TQRLabel;
    QRShape175: TQRShape;
    QRDBText42: TQRDBText;
    QRLabel96: TQRLabel;
    QRShape176: TQRShape;
    QRLabel97: TQRLabel;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    QRLabel98: TQRLabel;
    QRShape180: TQRShape;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel100: TQRLabel;
    QRShape185: TQRShape;
    QRLabel102: TQRLabel;
    QRShape186: TQRShape;
    QRDBText46: TQRDBText;
    QRShape187: TQRShape;
    QRLabel103: TQRLabel;
    QRShape200: TQRShape;
    QRDBText47: TQRDBText;
    QRShape181: TQRShape;
    QRLabel99: TQRLabel;
    QRShape182: TQRShape;
    QRDBText43: TQRDBText;
    QRShape183: TQRShape;
    QRLabel101: TQRLabel;
    QRShape184: TQRShape;
    QRDBText48: TQRDBText;
    QRShape201: TQRShape;
    QRLabel104: TQRLabel;
    QRShape202: TQRShape;
    QRLabel105: TQRLabel;
    QRShape203: TQRShape;
    QRDBText49: TQRDBText;
    QRShape204: TQRShape;
    QRLabel111: TQRLabel;
    QRShape205: TQRShape;
    QRDBText50: TQRDBText;
    QRShape206: TQRShape;
    QRLabel112: TQRLabel;
    QRShape207: TQRShape;
    QRLabel113: TQRLabel;
    QRShape208: TQRShape;
    QRDBText51: TQRDBText;
    QRShape209: TQRShape;
    QRLabel114: TQRLabel;
    QRShape210: TQRShape;
    QRDBText52: TQRDBText;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRDBText53: TQRDBText;
    QRShape211: TQRShape;
    QRLabel117: TQRLabel;
    QRShape212: TQRShape;
    QRDBText2: TQRDBText;
    QRShape213: TQRShape;
    QRLabel118: TQRLabel;
    QRShape214: TQRShape;
    QRLabel119: TQRLabel;
    QRShape215: TQRShape;
    QRLabel121: TQRLabel;
    QRShape216: TQRShape;
    qrdbIW_CUIT: TQRDBText;
    QRShape217: TQRShape;
    qrdbMP_NOMBRE: TQRDBText;
    qrdbIW_DIAGNOSTICO: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
  private
  public
  end;

{ Crea e imprime el reporte TrptDenuncia }
procedure ImprimirParteMedicoIngreso(IdTransaccion: Integer);

implementation

uses unDmPrincipal;

{$R *.DFM}


procedure ImprimirParteMedicoIngreso(IdTransaccion: Integer);
begin
  with TrptParteMedicoIngreso.Create(Application) do
    try
      sdqDatos.ParamByName('pTransaccion').AsInteger := IdTransaccion;
      OpenQuery(sdqDatos);
      Print;
    finally
      Free;
    end;
end;

{
SELECT IW_TRANSACCION A2,ART.UTILES.ARMAR_SINIESTRO(LT_SINIESTRO,LT_ORDEN,LT_RECAIDA) A1,
       DECODE(IW_TIPOSINIESTRO,4,'X') B1,DECODE(IW_TIPOSINIESTRO,1,'X') B2,
       DECODE(IW_TIPOSINIESTRO,2,'X') B3,DECODE(IW_TIPOSINIESTRO,3,'X') B4,
       DECODE(IW_MULTIPLE,0,'X') C1,DECODE(IW_MULTIPLE,1,'X') C2,IW_FECHASIN,CA_CLAVE,
       CA_DESCRIPCION,CA_CALLE,CA_NUMERO,CA_PISOCALLE D1,CA_DEPARTAMENTO D2,
       '('||CA_CODPOSTAL||')' D3,CA_LOCALIDAD,CA_PROVINCIA D4,CA_TELEFONO,
       DECODE(JW_TIPODOC,1,'X') E1,DECODE(JW_TIPODOC,2,'X') E2,DECODE(JW_TIPODOC,4,'X') E3,
       DECODE(JW_TIPODOC,3,'X') E4,DECODE(JW_TIPODOC,5,'X') E5,DECODE(JW_TIPODOC,6,'X') E6,
       JW_DOCUMENTO,JW_TELEFONO,JW_NOMBRE,DECODE(JW_SEXO,'F','Femenino','M', 'Masculino') SEXO,
       JW_FEC_NACIMIENTO,JW_NACIONALIDAD,JW_ESTCIVIL,JW_CALLE,JW_NUMERO,JW_PISO F1,
       JW_DEPARTAMENTO F2,'('||JW_CODPOSTAL||')' F3,JW_LOCALIDAD,JW_PROVINCIA,IW_CUIT,
       MP_NOMBRE,IW_LUGAROCURRENCIA,IW_LUGARTELEFONO,IW_LUGARCALLE,IW_LUGARNRO G1,IW_LUGARPISO G2,
       IW_LUGARDEPTO G3,'('||IW_LUGARCPOSTAL||')' G4,IW_LUGARLOCALIDAD,IW_LUGARPROVINCIA,
       IW_EPMANIFESTACION H,IW_AGENTERIESGO,IW_EPEXPUESTODESDE,IW_FECORIGINAL,IW_DIAGNOSTICO,
       IW_FECHASIN,IW_HORASIN,IW_CIE10,IW_OBSERVACION,IW_FECHABAJA,
       DECODE(IW_INCAPACIDAD,'1','X') I1,DECODE(IW_INCAPACIDAD,'0','X') I2,IW_PORCENTAJE I3,
       DECODE(IW_RECALIFICACION,'1','X') J1,DECODE(IW_RECALIFICACION,'0','X') J2,
       DECODE(IW_COINCIDE_DIAG,'1','X') K1,DECODE(IW_COINCIDE_DIAG,'0','X') K2,IW_FORMA,
       IW_ZONA,IW_NATURALEZA,IW_AGENTE,DECODE(IW_GRAVEDAD,1,'X') L1,DECODE(IW_GRAVEDAD,2,'X') L2,
       DECODE(IW_GRAVEDAD,3,'X') L3,DECODE(IW_GRAVEDAD,4,'X') L4,DECODE(IW_GRAVEDAD,5,'X') L5,
       DECODE(IW_ENDOMICILIO,1,'X') M1,DECODE(IW_ENDOMICILIO,0,'X') M2,IW_TRATAMIENTOLUGAR,
       ART.IIF_NULL(IW_FECHAINTERNACION,'X',NULL) N1,ART.IIF_NULL(IW_FECHAINTERNACION,NULL,'X') N2,
       IW_FECHAINTERNACION,DECODE(IW_LUGARINTERNACION,'1','X') O1,
       DECODE(IW_LUGARINTERNACION,'2','X') O2,DECODE(IW_LUGARINTERNACION,'3','X') O3,
       IW_TRATAMIENTOTIPO,ART.IIF_NULL(IW_FECHADERIVACION,'X',NULL) P1,
       ART.IIF_NULL(IW_FECHADERIVACION,NULL,'X') P2,IW_FECHADERIVACION,IW_OBSERVACIONDER,
       DECODE(IW_BAJAMEDICA,1,'X') Q1,IW_DIASBAJA,IW_RECONSULTA,DECODE(IW_BAJAMEDICA,0,'X') Q2,
       IW_FECHAEGRESO,IW_REINICIO,IW_MEDICO,IW_MATRICULA,DECODE(IW_JURISDICCION,0,'X') R1,
       DECODE(IW_JURISDICCION,1,'X') R2,IW_FECHAEMISION
 FROM   ART.CPR_PRESTADOR,ART.TMP_CTJW_TRABAJADOR, ART.CMP_EMPRESAS,ART.TMP_SPIW_PARTEINGRESO,
        ART.WLT_LOG_TRANSACCION_WEB
 WHERE  LT_TRANSACCION = IW_TRANSACCION
 AND    IW_CUIT = MP_CUIT
 AND    IW_EMPLEADO = JW_ID
 AND    IW_PRESTADORID = CA_IDENTIFICADOR
}

end.
