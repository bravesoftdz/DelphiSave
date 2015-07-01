unit unRptParteIngreso;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrParteIngreso = class(TQuickRep)
    Detail: TQRBand;
    sdqDatos: TSDQuery;
    QRDBText36: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape1: TQRShape;
    QRLabel60: TQRLabel;
    QRShape2: TQRShape;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText54: TQRDBText;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    qrlART: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel78: TQRLabel;
    QRDBText80: TQRDBText;
    QRLabel79: TQRLabel;
    qrlDatosEmpDep: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText59: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape14: TQRShape;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel80: TQRLabel;
    QRDBText63: TQRDBText;
    QRLabel81: TQRLabel;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel107: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel110: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText70: TQRDBText;
    QRLabel87: TQRLabel;
    qrdbt_Diagnostico: TQRDBText;
    QRLabel88: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel89: TQRLabel;
    qrlDiagnostico_raya: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
  private

  public
    procedure Imprimir(iIdExpediente:integer);
  end;

var
  qrParteIngreso: TqrParteIngreso;

implementation

uses unDmPrincipal, unComunes, unVisualizador, AnsiSql;

{$R *.DFM}

{ TqrParteIngreso }

procedure TqrParteIngreso.Imprimir(iIdExpediente:integer);    // TK 16664
var
  sSql :string;
begin
  sSql := ' SELECT PI_ID, PI_IDEXPEDIENTE, PI_IDPRESTADOR, PI_EPMANIFESTACION, PI_EPEXPUESTODESDE, ' +
                 ' PI_DIAGNOSTICO, PI_PRESUPINCAPACIDAD, PI_OBSERVACIONES, PI_TRATAMUBICACION, ' +
                 ' PI_INTERNINSTITUCION, PI_INTERNUBICACION, PI_FECHABAJAMEDICA, PI_DIASBAJAPREVISTOS, ' +
                 ' PI_FECHARECONSULTA, PI_HISTORIACLINICA, PI_MEDICO, PI_FECHARECEPCION, PI_USUALTA, ' +
                 ' PI_FECHAALTA, PI_USUMODIF, PI_FECHAMODIF, NVL(PI_PROTESIS, ''N'') as PI_PROTESIS, ' +
                 ' PI_FECHACARGA, SE_SECTOR, PI_TRATAMINSTITUCION, EX_FECHAALTA, EX_FECHAACCIDENTE, ' +
                 ' EX_TIPO, EX_FECHARECEPCION, NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) as FACCREC, ' +
                 ' PI_PORCENTAJEINCAPACIDAD, PI_COINCIDE_MECANISMO_ACC, PI_RECALIFICACION, ' +
                 ' NULL AS DA_OPCION, TO_NUMBER(NULL) AS DA_HOJAS, PI_FECHABAJAPRESTADOR, ' +
                 ' ''N'' as GENERAR_EVOLUTIVO, PI_IDLESIONAGENTEMATERIAL, ' +

                 ' decode(tj_sexo, ''M'', ''X'', '''') as sexo_M, ' +
                 ' decode(tj_sexo, ''F'', ''X'', '''') as sexo_F, ' +
                 ' decode(ex_tipo, 1, ''X'', '''') as ex_tipo_1, ' +
                 ' decode(ex_tipo, 2, ''X'', '''') as ex_tipo_2, ' +
                 ' decode(ex_tipo, 3, ''X'', '''') as ex_tipo_3, ' +
                 ' decode(ex_intercurrencia, ''S'', ''X'', '''') as ex_intercurrencia, ' +
                 ' NVL(ex_fechamanifestacion, ex_fechaaccidente) FechaAcc, ' +
                 ' ex_horaaccidente as fechaacc_hora, ' +

                 ' TA_DESCRIPCION TIPOACCIDENTE, TC_DESCRIPCION GRAVEDAD_CIE10, DG_DESCRIPCION CIE10, ' +
                 ' LF_DESCRIPCION FORMA, LA_DESCRIPCION AGENTE_CAUSANTE, LZ_DESCRIPCION ZONA, ' +
                 ' LN_DESCRIPCION NATURALEZA, LM_DESCRIPCION AGENTE_MATERIAL, TG_DESCRIPCION GRAVEDAD, ' +
                 ' MC_DESCRIPCION MOTIVONOCARGA, art.utiles.armar_siniestro(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINIESTRO,' +
                 ' CA_DESCRIPCION PRESTADOR_NOMBRE, CA_DOMICILIO PRESTADOR_DOMICILIO, ' +
                 ' CA_LOCALIDAD PRESTADOR_LOCALIDAD, CA_CODPOSTAL PRESTADOR_CPOSTAL, ' +
                 ' tj_nombre NOMBRE_TRAB, utiles.armar_cuit(tj_cuil) CUIL_TRAB, tj_telefono TEL_TRAB, ' +                // TK 62997
                 ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) DOMIC_TRAB, ' +
                 ' tj_calle, tj_numero, tj_piso, tj_departamento, ' +
                 ' tj_localidad, tj_cpostal, pv_descripcion trabajador_provincia, ' +
                 ' CA_IDENTIFICADOR, EX_DIAGNOSTICO, EX_FECHAMANIFESTACION, EX_MECANISMOACCID, EX_PRESUPINCAPACIDAD, tj_fnacimiento, ' +
                 ' mp_nombre empresa_nombre, art.utiles.armar_cuit(ex_cuit) CUIT, ' +
                 ' art.utiles.armar_cuit(ca_clave) as prestador_cuit, ' +
                 ' ca_calle, ca_numero, nvl(ca_piso, null) ca_piso, nvl(ca_departamento, null) ca_departamento,  ' +

                 ' pv_descripcion prestador_provincia, ca_fax as prestador_fax, ' +
                 ' ca_codpostal, ca_direlectronica, ca_telefono prestador_telefono, ' +
                 ' NVL(DE_INICIOINASISTENCIALABORAL, ex_bajamedica) FecInicioInasistenciaLaboral, ' +
                 ' NVL(PI_EPMANIFESTACION, ex_bajamedica) FecPrimeraAtencionMedica, ' +
                 ' NVL(ex_brevedescripcion, sa_descripcion) DescrMotivoConsulta, ' +

                 ' (Select ''DDN ('' || tt_area || '') - '' || tt_numero ' +
                    ' From art.ATT_TELEFONOTRABAJADOR ' +
                   ' where tt_idtrabajador = tj_id ' +
                     ' and tt_idtipotelefono = 2 ' +
                     ' and rownum = 1) TelFijo, ' +

                 ' (Select tt_area || '' - '' || tt_numero ' +
                    ' From art.ATT_TELEFONOTRABAJADOR ' +
                   ' where tt_idtrabajador = tj_id ' +
                     ' and tt_idtipotelefono = 3 ' +
                     ' and rownum = 1) Celular ' +

            ' FROM art.USE_USUARIOS, art.SEX_EXPEDIENTES, SIN.SPI_PARTEDEINGRESO, SIN.STA_TIPOACCIDENTE, ' +
                 ' SIN.STC_TIPOGRAVEDAD_CIE10, ART.CDG_DIAGNOSTICO, SLF_LESIONFORMA, SLA_LESIONAGENTE, ' +
                 ' SLZ_LESIONZONA, SLN_LESIONNATURALEZA, SIN.SLM_LESIONAGENTEMATERIAL, STG_TIPOGRAVEDAD, ' +
                 ' SIN.SMC_MOTIVONOCARGA, ART.CPR_PRESTADOR, CTJ_TRABAJADOR, cpv_provincias, cmp_empresas, ' +
                 ' SIN.sde_denuncia, SIN.SSA_SOLICITUDASISTENCIA ' +

           ' WHERE EX_ID = ' + SqlInt(iIdExpediente) +
             ' AND EX_ID = PI_IDEXPEDIENTE(+) ' +
             ' AND SE_USUARIO (+) = PI_USUALTA ' +
             ' AND EX_TIPO = TA_CODIGO(+) ' +
             ' AND EX_GRAVEDADCIE10 = TC_ID(+) ' +
             ' AND EX_IDDIAGNOSTICO = DG_ID(+) ' +
             ' AND EX_IDFORMA = LF_ID(+) ' +
             ' AND EX_IDAGENTE = LA_ID(+) ' +
             ' AND EX_IDZONA = LZ_ID(+) ' +
             ' AND EX_IDNATURALEZA = LN_ID(+) ' +
             ' AND EX_IDAGENTEMATERIAL = LM_ID(+) ' +
             ' AND EX_GRAVEDAD = TG_ID(+) ' +
             ' AND PI_IDMOTIVONOCARGA = MC_ID(+) ' +
             ' AND EX_PRESTADOR = CA_IDENTIFICADOR ' +
             ' AND pv_codigo(+) = tj_provincia ' +
             ' AND mp_cuit = ex_cuit ' +
             ' AND tj_cuil = ex_cuil ' +
             ' AND de_idexpediente(+) = ex_id ' +
             ' AND sa_idexpediente(+) = ex_id ' +
             ' AND ex_idtrabajador = tj_id ';             // TK 62997

  sdqDatos.SQL.Text := sSql;
  OpenQuery(sdqDatos);

  Visualizar(Self, GetValores(),[oAutoFirma, oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;

end.
