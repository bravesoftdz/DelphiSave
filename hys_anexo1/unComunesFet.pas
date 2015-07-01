unit unComunesFet;

interface

uses AnsiSql, unDmPrincipal, DateUtils, DB, unSesion, unConstFet, Classes, Controls, SDEngine,
  CustomDlgs;

type
  TModoABM = (mfNone, mfAlta, mfModif, mfBaja, mfEdit);

  procedure saveHepEstabPrev(FCuit : String; FEstableci : Integer);
  function GetCantRelev(FCUIT : STring; FEstableci :Integer; vigenciadesde, vigenciahasta : TDateTime) : Integer;
  function GetAnexo1(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetAnexo1Ficticio(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetAnexo2(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetTieneDenunciaGral(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetTieneDenuncia(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetTienePRS(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetTienePAL (FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
  function GetFechaUltVisita(FCuit : String; FEstableci : Integer) : TDateTime;
  function GetFechaUltRelev(FCuit : String; FEstableci : Integer) : TDateTime;
  function TipoUltRelev(FCuit : String; FEstableci : Integer) : String;
  function GetFechaUltCap(FCuit : String; FEstableci : Integer) : TDateTime;
  function GetPreventorUltVisita(FCuit : String; FEstableci : Integer) : String;
  function GetCantVisitas(FCUIT : STring; FEstableci :Integer; vigenciadesde, vigenciahasta : TDateTime) : Integer;
  function GetCantCapacit(FCUIT : STring; FEstableci :Integer; vigenciadesde, vigenciahasta : TDateTime) : Integer;
  procedure GuardarObservacion(aidCabecera, aIdObservacion: integer; aEstado, aInfoExtra, aVerificarinfo: String; aIdItem: integer = -1);
  procedure EliminarObservacion(aidCabecera, aIdObservacion: integer; aInfoExtra, aVerificarinfo: String);
  procedure ProcesarObservacion(aidCabecera, aIdObservacion: integer; aEstado, aInfoExtra, aVerificarinfo, aGeneraObs: String; aIdItem: integer);
  procedure ProcesarObservacionFormulario(aIdCabecera, aIdTipoFormulario: integer; aIdResolucion: integer);
  procedure ProcesarObservacionResponsable(aIdCabecera, aIdResolucion: integer; aOrigen: String);
  procedure ProcesarValidezRelev(aidCabecera: integer; aAutoCommit: boolean);
  procedure ProcesarObseravacionEstab(aidCabecera: integer; Contrato : Integer; Estableci : Integer);
  function GetItemResponsable(aCargo: String; aidResolucion: Integer):integer;
  function GetItemFormulario(aIdTipoFormulario, aidResolucion: Integer):integer;
  procedure ActualizarRelevamientos(aCuit : String; aEstableci : Integer);
  procedure DenunciaDatosIncompletos(aCuit : String; IdEstableci : Integer; aNroInforme : Integer; DatoFaltante :String; TipoInforme : String);
  procedure EliminarRelevamiento(CUIT: String; Estableci: Integer; aFechaRelev: TDateTime);
  procedure ActualizarAsignacionLote(
      IdCabeceraNomina: integer;
      fechaRelev: TDateTime;
      Cuit: String;
      Estableci: Integer;
      bAgregaCabecera: boolean = true;
      fechaRecepPrev: TDateTime = 0;
      fechaRecepCoord: TDateTime = 0;
      fechaImpo: TDateTime = 0;
      conSemestral: boolean = false;
      IdAsociado: integer = 0);
  procedure ActualizarUltRelevamiento (cuit: String; nroestableci: integer; fecharelev: TDateTime; tiporelev: String; baja: boolean = false);
  function GetGrupoDenuncia(aCUIT: String; aContrato, aEstableci: integer; aTipo: String): String;
  procedure DenunciaIncumplimiento(iditem : Integer; fechaincump : TDateTime; CUIT : String; Contrato, NroEstableci :integer);
  procedure ActualizarPlan(aIdVisita, aIdEmpresa, aEstableci: integer);
  procedure GuardarCargaPlan(idEmpresa, estableci: integer; fechavisita: TDate; idPreventor, kms, idmotivo: integer);
  procedure GuardarVisitaEnPlan(FCUIT : string; FEstableci: Integer; FTipo: String;FOperativo : String;
                                aFechaVisita: TDate; aMostrarMensaje: boolean; Componente : TControl);
  procedure ArmarConstanciaVisita( sCUIT : String; Estableci : Integer; sTipo, sOperativoOrig : String;
                                   cMedidas, cPRSPAPE, cPAL : Boolean; dFecha : TDateTime; pPath : String = '';PalVacio : Boolean = False);
  procedure ArmarConstanciaVisitaVacia( sCUIT : String; Estableci : Integer; sTipo, sOperativoOrig : String;
                                        cMedidas, cPRSPAPE, cPAL : Boolean; dFecha : TDateTime; pPath : String = '' );
  function ArmarPathRelev463(contrato : String; vigencia : String; estableci : Integer): String;
  function ArmarPathAvisoObra(contrato : String; estableci : Integer) : String;
  function GetVisitaCorrecta(aCuit: String; aEstableci: integer; aTipo: String;
  aOperativo: String; aRecomendacion: integer; aFecha: TDate; aVisita: String): String;
  procedure guardarSeguimientoAccidente (modoAlta : Boolean; pMC_ID : Integer; tipoAccidente : String; fecha : TDate; id : Integer = 0);
  procedure guardarSeguimientoEnfermedad (modoAlta : Boolean; pMC_ID : Integer; tipoEnfermedad : String; fecha : TDate; id : Integer = 0);

const
  enActivo = 1;
  enErroneo = 2;
  enComplementario = 3;
  enTerminado = 4;
  enInactivo = 5;


implementation

uses SysUtils, General, unPrincipal, StrFuncs, Variants, CUIT, unMoldeEnvioMail, unRptPal, unRptConstanciaVisitas;


procedure saveHepEstabPrev(FCuit : String; FEstableci : Integer);
var
  sSql,tipo, operativo, idoperativo, nro_resolucion : String;
  fechainicioobra, fechaextensionobra, fechafinobra,
  vigenciahasta, vigenciadesde : TDateTime;
  cantRelev: Integer;
  cancerigenos, difenilos, accidentemayores : String;
begin
  if ValorSql(
      ' SELECT ART.HYS.get_tipo_empresa('+SqlValue(FCuit)+', '+SqlValue(FEstableci)+','+
      '         SYSDATE) '+
      ' FROM DUAL') <> '' then
  begin
    tipo := ValorSql(
          ' SELECT hys.get_calc_tipo_estab_srt (em_id,'+ SqlValue(FEstableci)+')'+
          '   FROM afi.aem_empresa '+
          '  WHERE em_cuit = '+SqlValue(FCuit));
    if not ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hep_estabporpreventor '+
        '  WHERE ep_cuit = '+SqlValue(FCuit)+
        '    AND ep_estableci = '+SqlValue(FEstableci)) then
    begin
      EjecutarSqlST(
        ' INSERT INTO hys.hep_estabporpreventor '+
        '             (ep_idempresa, ep_cuit, ep_estableci, ep_tipo, '+
        '              ep_actividad, '+
        '              ep_fechaalta, ep_usualta '+
        '             ) '+
        '      SELECT em_id,'+SqlValue(FCuit)+', '+SqlValue(FEstableci)+', '+SqlValue(tipo)+', '+
        '             art.hys.getactividadestablecimiento ('+SqlValue(FCuit)+', '+SqlValue(FEstableci)+'), '+
        '             SYSDATE, '+SqlValue(frmPrincipal.DBLogin.UserID)+
        '        FROM afi.aem_empresa WHERE em_cuit = '+SqlValue(FCuit));
    end;
    operativo :=  ValorSql(
          ' SELECT hys.get_operativovigente_empresa ('+SqlValue(FCuit)+', SYSDATE)'+
          '   FROM DUAL');
    idoperativo := ValorSql(
          ' SELECT hys.get_idoperativovigente_empresa (em_id, SYSDATE) '+
          '   FROM afi.aem_empresa '+
          '  WHERE em_cuit = '+ SqlValue(FCuit));
    With GetQuery(
          ' SELECT vo_vigenciadesde, vo_vigenciahasta '+
          '   FROM hys.hvo_vigenciaoperativo, hys.hco_cuitoperativo'+
          '  WHERE vo_tipo = co_tipo AND vo_operativo = co_operativo '+
          '    AND co_id = '+ SqlValue(idoperativo)) do
    try
      vigenciadesde := Fields[0].AsDateTime;
      vigenciahasta := Fields[1].AsDateTime;
    finally
      Free;
    end;
    With GetQuery(
     ' SELECT max(ao_fechainicio), max(ao_fechaextension), max(ao_fechafindeobra) '+
     '   FROM art.pao_avisoobra '+
     '  WHERE ao_cuit = '+SqlValue(FCuit)+
     '    AND ao_fechabaja IS NULL '+
     '    AND ao_estableci = '+SqlValue(FEstableci)) do
    try
      fechainicioobra := Fields[0].AsDateTime;
      fechaextensionobra := Fields[1].AsDateTime;
      fechafinobra := Fields[2].AsDateTime;
    finally
      Free;
    end;

    nro_resolucion := ValorSql(
         ' SELECT ao_NRORESOLUCION '+
         '   FROM art.pao_avisoobra a'+
         '  WHERE ao_cuit = '+SqlValue(FCuit)+
         '    AND ao_estableci = '+SqlValue(FEstableci)+
         '    AND ao_fechabaja IS NULL'+
         '    AND ao_operativo = '+
         '        (SELECT MAX (b.ao_operativo) '+
         '           FROM art.pao_avisoobra b '+
         '          WHERE a.ao_cuit = b.ao_cuit '+
         '            AND b.ao_fechabaja IS NULL '+
         '            AND a.ao_estableci = b.ao_estableci)');

    cancerigenos := ValorSql(
        ' SELECT il_cumplimiento '+
        '   FROM hys.hil_itemsriesgolaboral, '+
        '        hys.hia_itemanexo, '+
        '        hys.hrl_relevriesgolaboral '+
        '  WHERE il_iditemanexo = ia_id '+
        '    AND ia_idtipoformanexo = 1 '+
        '    AND il_idrelevriesgolaboral = rl_id '+
        '    AND RL_CONTRATO = art.get_vultcontrato('+SqlValue(FCuit)+')'+
        '    AND rl_estableci = '+ SqlValue(FEstableci)+
        '    AND art.hys.get_ultidrelev463(rl_contrato, rl_estableci, null) = rl_id '+
        '    AND rl_fechabaja IS NULL '+
        '    AND il_fechabaja IS NULL '+
        '    AND ia_fechabaja IS NULL ');

    difenilos := ValorSql(
        ' SELECT il_cumplimiento '+
        '   FROM hys.hil_itemsriesgolaboral, '+
        '        hys.hia_itemanexo, '+
        '        hys.hrl_relevriesgolaboral '+
        '  WHERE il_iditemanexo = ia_id '+
        '    AND ia_idtipoformanexo = 2 '+
        '    AND il_idrelevriesgolaboral = rl_id '+
        '    AND RL_CONTRATO = art.get_vultcontrato('+SqlValue(FCuit)+')'+
        '    AND rl_estableci = '+ SqlValue(FEstableci)+
        '    AND art.hys.get_ultidrelev463(rl_contrato, rl_estableci, null) = rl_id '+
        '    AND rl_fechabaja IS NULL '+
        '    AND il_fechabaja IS NULL '+
        '    AND ia_fechabaja IS NULL ');

    accidentemayores := ValorSql(
        ' SELECT il_cumplimiento '+
        '   FROM hys.hil_itemsriesgolaboral, '+
        '        hys.hia_itemanexo, '+
        '        hys.hrl_relevriesgolaboral '+
        '  WHERE il_iditemanexo = ia_id '+
        '    AND ia_idtipoformanexo = 3 '+
        '    AND il_idrelevriesgolaboral = rl_id '+
        '    AND RL_CONTRATO = art.get_vultcontrato('+SqlValue(FCuit)+')'+
        '    AND rl_estableci = '+ SqlValue(FEstableci)+
        '    AND art.hys.get_ultidrelev463(rl_contrato, rl_estableci, null) = rl_id '+
        '    AND rl_fechabaja IS NULL '+
        '    AND il_fechabaja IS NULL '+
        '    AND ia_fechabaja IS NULL ');


    cantRelev := GetCantRelev(FCuit,FEstableci,vigenciadesde,vigenciahasta);

    sSql := ' UPDATE hys.hep_estabporpreventor '+
            '    SET ep_tipo = '+SqlValue(tipo)+','+
            '        ep_actividad = '+
            '             NVL (art.hys.getactividadestablecimiento ('+SqlValue(FCuit)+', '+SqlValue(FEstableci)+'),'+
            '                 ''D''),'+
            '        ep_fechamodif = SYSDATE, '+
            '        ep_usumodif = '+SqlValue(frmPrincipal.DBLogin.UserID)+','+
            '        ep_nroresolucion = '+SqlValue(nro_resolucion)+','+
            '        ep_anexo1 = '+ SqlValue(GetAnexo1(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_anexo1ficticio = '+SqlValue(GetAnexo1Ficticio(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_anexo2 = '+SqlValue(GetAnexo2(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_tienedenunciagral = '+SqlValue(GetTieneDenunciaGral(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_tienedenuncia = '+SqlValue(GetTieneDenuncia(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_tieneprs = '+SqlValue(GetTienePRS(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_tienepal = '+SqlValue(GetTienePal(FCuit,FEstableci,tipo,operativo))+','+
            '        ep_fechaultvisita = '+SqlDate(GetFechaUltVisita(FCuit,FEstableci))+','+
            '        ep_fechaultrelev = '+SqlDate(GetFechaUltRelev(FCuit,FEstableci))+','+
            '        ep_tiporelev = '+SqlValue(TipoUltRelev(FCuit,FEstableci))+','+
            '        ep_fechaultcap = '+SqlDate(GetFechaUltCap(FCuit,FEstableci))+','+
            '        ep_preventorultvisita = '+SqlValue(GetPreventorUltVisita(FCuit,FEstableci))+','+
            '        ep_fechainicioobra = '+SqlDate(fechainicioobra)+','+
            '        ep_fechaextensionobra = '+SqlDate(fechaextensionobra)+','+
            '        ep_fechafinobra = '+SqlDate(fechafinobra)+','+
            '        ep_idcooperativo = '+Sqlvalue(idoperativo)+','+
            '        ep_cancerigenos = '+SqlString(cancerigenos,True,True)+','+
            '        ep_difenilos = '+SqlString(difenilos,True,True)+','+
            '        ep_accmayores = '+SqlString(accidentemayores,True,True)+','+
            '        ep_cantvisitas = '+SqlValue(GetCantVisitas(FCuit,FEstableci,vigenciadesde,vigenciahasta))+','+
            '        ep_cantcapacit = '+SqlValue(GetCantCapacit(FCuit,FEstableci,vigenciadesde,vigenciahasta))+','+
            '        ep_cantrelev = '+SqlValue(cantRelev)+
            '  WHERE ep_cuit = '+SqlValue(FCuit)+' AND ep_estableci = '+SqlValue(FEstableci);
    EjecutarSqlST(sSql);
    EjecutarSqlST(
            ' DECLARE '+
            '   a           NUMBER; '+
            '   idempresa   NUMBER; '+
            ' BEGIN '+
            '    SELECT em_id '+
            '      INTO idempresa '+
            '      FROM afi.aem_empresa '+
            '     WHERE em_cuit = '+SqlValue(FCuit)+';'+
            '    a := art.hys.get_calc_tipo_empresa_prev (idempresa); '+
            '    art.hys.do_actualizartipoestabprev (idempresa, a,'+SqlValue(FEstableci)+');'+
            '    art.hys.do_actualizarestado (idempresa,'+SqlValue(FEstableci)+');'+
            ' END;');
(*
    idEmpresa := ValorSql(' SELECT em_id '+
      '   FROM afi.aem_empresa '+
      '  WHERE em_cuit = '+SqlValue(FCuit));
    EjecutarStoreST ('art.hys.do_actualizartipoempresaprev('+SqlValue(idEmpresa)+');');
    EjecutarStoreST ('art.hys.do_actualizarestadoempresa('+SqlValue(idEmpresa)+');');
*)    
  end;
end;

function GetCantRelev(FCUIT : STring; FEstableci :Integer; vigenciadesde, vigenciahasta : TDateTime) : Integer;
begin
  Result := ValorSqlInteger(
      ' SELECT (  (SELECT COUNT (DISTINCT cn_fecharelevamiento) '+
      '              FROM hys.hcn_cabeceranomina '+
      '             WHERE cn_cuit = '+SqlValue(FCUIT)+
      '               AND cn_estableci = '+SqlValue(FEstableci)+
      '               AND cn_idestado NOT IN (6) ' +
      '               AND cn_fecharelevamiento >= '+SqlDate(vigenciadesde)+
      '               AND cn_fecharelevamiento <= NVL ('+SqlDate(vigenciahasta)+', cn_fecharelevamiento))'+
      '         + (SELECT COUNT (DISTINCT sr_fecha) '+
      '              FROM art.psr_sinriesgo '+
      '             WHERE sr_cuit = '+SqlValue(FCUIT)+
      '               AND sr_estableci = '+SqlValue(FEstableci)+
      '               AND sr_fecha >= '+SqlDate(vigenciadesde)+
      '               AND sr_fecha <= NVL ('+SqlDate(vigenciahasta)+', sr_fecha))'+
      '        )'+
      '   FROM DUAL')
(*
  Result := ValorSqlInteger(
      ' SELECT (  (SELECT COUNT (DISTINCT rt_fecha) '+
      '              FROM art.prt_riestrab '+
      '             WHERE rt_cuit = '+SqlValue(FCUIT)+
      '               AND rt_estableci = '+SqlValue(FEstableci)+
      '               AND rt_fecha >= '+SqlDate(vigenciadesde)+
      '               AND rt_fecha <= NVL ('+SqlDate(vigenciahasta)+', rt_fecha))'+
      '         + (SELECT COUNT (DISTINCT sr_fecha) '+
      '              FROM art.psr_sinriesgo '+
      '             WHERE sr_cuit = '+SqlValue(FCUIT)+
      '               AND sr_estableci = '+SqlValue(FEstableci)+
      '               AND sr_fecha >= '+SqlDate(vigenciadesde)+
      '               AND sr_fecha <= NVL ('+SqlDate(vigenciahasta)+', sr_fecha))'+
      '        )'+
      '   FROM DUAL')
*)
end;

function GetAnexo1(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  if ((ValorSql('SELECT art.hys.get_tipo_empresa('+SqlValue(FCUIT)+',NULL) FROM dual')= 'ET')
  and (ValorSql('SELECT art.hys.get_tipo_estab_srt('+SqlValue(FCUIT)+','+SqlValue(FEstableci)+') FROM DUAL') = 'GB')) then
    Tipo := 'ET';


  sSql :=  ' SELECT 1 '+
           '   FROM art.pet_empresastestigo '+
           '  WHERE et_cuit = '+SqlValue(FCuit)+
           '    AND et_estableci = '+SqlValue(FEstableci)+
           '    AND et_tipo = '+SqlValue(Tipo)+
           '    AND et_operativo = '+SqlValue(Operativo)+
           '    AND NVL (et_item5, -1) <> 9999 '+
           '    AND NVL (et_item6, -1) <> 9999 '+
           '    AND et_fechabaja IS NULL';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;

function GetAnexo1Ficticio(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  if ((ValorSql('SELECT art.hys.get_tipo_empresa('+SqlValue(FCUIT)+',NULL) FROM dual')= 'ET')
    and (ValorSql('SELECT art.hys.get_tipo_estab_srt('+SqlValue(FCUIT)+','+SqlValue(FEstableci)+') FROM DUAL') = 'GB')) then
    Tipo := 'ET';
  sSql :=  ' SELECT 1 '+
           '   FROM art.pet_empresastestigo '+
           '  WHERE et_cuit = '+SqlValue(FCuit)+
           '    AND et_estableci = '+SqlValue(FEstableci)+
           '    AND et_tipo = '+SqlValue(Tipo)+
           '    AND et_operativo = '+SqlValue(Operativo)+
           '    AND NVL (et_item5, -1) = 9999 '+
           '    AND NVL (et_item6, -1) = 9999 '+
           '    AND et_fechabaja IS NULL';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;

function GetAnexo2(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  if ((ValorSql('SELECT art.hys.get_tipo_empresa('+SqlValue(FCUIT)+',NULL) FROM dual')= 'ET')
    and (ValorSql('SELECT art.hys.get_tipo_estab_srt('+SqlValue(FCUIT)+','+SqlValue(FEstableci)+') FROM DUAL') = 'GB')) then
    Tipo := 'ET';
    
  sSql :=  ' SELECT 1 '+
           '   FROM art.pan_anexo2 '+
           '  WHERE an_cuit = '+SqlValue(FCuit)+
           '    AND an_estableci = '+SqlValue(FEstableci)+
           '    AND an_tipo = '+SqlValue(Tipo)+
           '    AND an_operativo = '+SqlValue(Operativo)+
           '    AND ROWNUM = 1';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;

function GetTieneDenunciaGral(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  sSql :=  ' SELECT 1 '+
           '   FROM art.poe_obradendetalle '+
           '  WHERE oe_cuit = '+SqlValue(FCuit)+
           '    AND oe_estableci = '+SqlValue(FEstableci)+
           '    AND oe_tipo = '+SqlValue(Tipo)+
           '    AND oe_operativo = '+SqlValue(Operativo)+
           '    AND oe_fechabaja IS NULL '+
           '    AND oe_grupo IN (''TE'', ''PE'')'+
           '    AND ROWNUM = 1';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;

function GetTienePAL (FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  sSql :=  ' SELECT 1 '+
           '   FROM hys.hpa_pal '+
           '  WHERE pa_cuit = '+SqlValue(FCuit)+
           '    AND pa_estableci = '+SqlValue(FEstableci)+
           '    AND pa_tipo = '+SqlValue(Tipo)+
           '    AND pa_operativo = '+SqlValue(Operativo)+
           '    AND pa_fechabaja IS NULL '+
           '    AND pa_cumplimiento IS NOT NULL '+
           '    AND pa_seguimiento IS NOT NULL '+
           '    AND ROWNUM = 1';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;


function GetTieneDenuncia(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  sSql :=  ' SELECT 1 '+
           '   FROM art.poe_obradendetalle '+
           '  WHERE oe_cuit = '+SqlValue(FCuit)+
           '    AND oe_estableci = '+SqlValue(FEstableci)+
           '    AND oe_tipo = '+SqlValue(Tipo)+
           '    AND oe_operativo = '+SqlValue(Operativo)+
           '    AND oe_fechabaja IS NULL '+
           '    AND oe_grupo NOT IN (''TE'', ''PE'')'+
           '    AND ROWNUM = 1';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;

function GetTienePRS(FCuit :String; FEstableci :Integer; Tipo, Operativo : String) : String;
var
  sSql :string;
begin
  sSql :=  ' SELECT 1 '+
           '   FROM art.pre_recomendaciones '+
           '  WHERE re_cuit = '+SqlValue(FCuit)+
           '    AND re_estableci = '+SqlValue(FEstableci)+
           '    AND re_tipo = '+SqlValue(Tipo)+
           '    AND re_operativo = '+SqlValue(Operativo)+
           '    AND re_fechabaja IS NULL '+
           '    AND ROWNUM = 1';

  if ExisteSql(sSql)then
    Result := 'S'
  else
    Result := 'N';
end;

function GetFechaUltVisita(FCuit : String; FEstableci : Integer) : TDateTime;
var
  sSql : String;
begin
  sSql := 'SELECT MAX (rv_fecha) '+
          '   FROM art.prv_resvisitas '+
          '  WHERE rv_cuit = '+SqlValue(FCuit)+
          '    AND rv_estableci = '+SqlValue(FEstableci)+
          '    AND rv_fechabaja IS NULL '+
          '    AND rv_idvisitaasociada IS NULL';

  Result := ValorSqlDateTime(sSql);
end;

function GetFechaUltRelev(FCuit : String; FEstableci : Integer) : TDateTime;
var
  sSql : String;
begin
  sSql := ' SELECT MAX (fecha) '+
          '   FROM (SELECT cn_fecharelevamiento fecha '+
          '           FROM hys.hcn_cabeceranomina '+
          '          WHERE cn_cuit = '+ SqlValue(FCuit)+
          '            AND cn_estableci = '+ SqlValue(FEstableci)+
          '            AND cn_idestado NOT IN (6) ' +
          '          UNION ALL '+
          '         SELECT sr_fecha fecha '+
          '           FROM art.psr_sinriesgo '+
          '          WHERE sr_cuit = '+SqlValue(FCuit)+
          '            AND sr_estableci = '+SqlValue(FEstableci) +')';

  Result := ValorSqlDateTime(sSql);
end;

function TipoUltRelev(FCuit : String; FEstableci : Integer) : String;
var
  sSql : String;
  fechaUltRelev : TDateTime;
begin
  fechaUltRelev := GetFechaUltRelev(FCuit,FEstableci);
  sSql := ' SELECT  tipo '+
          '   FROM (SELECT ''E'' tipo '+
          '           FROM hys.hcn_cabeceranomina '+
          '          WHERE cn_cuit = '+ SqlValue(FCuit)+
          '            AND cn_estableci = '+ SqlValue(FEstableci)+
          '            AND cn_fecharelevamiento = '+SqlDate(fechaUltRelev)+
          '            AND cn_idestado NOT IN (6) ' +
          '          UNION ALL '+
          '         SELECT ''S'' tipo '+
          '           FROM art.psr_sinriesgo '+
          '          WHERE sr_cuit = '+SqlValue(FCuit)+
          '            AND sr_fecha = '+SqlDate(fechaUltRelev)+
          '            AND sr_estableci = '+SqlValue(FEstableci) +') WHERE ROWNUM = 1';

  Result := ValorSql(sSql);
end;


function GetFechaUltCap(FCuit : String; FEstableci : Integer) : TDateTime;
var
  sSql : String;
begin
  sSql := 'SELECT MAX (cm_fecha) '+
          '   FROM art.pcm_capacitemp '+
          '  WHERE cm_cuit = '+SqlValue(FCuit)+
          '    AND cm_estableci = '+SqlValue(FEstableci);

  Result := ValorSqlDateTime(sSql);
end;

function GetPreventorUltVisita(FCuit : String; FEstableci : Integer) : String;
var
  sSql : String;
begin
  sSql := ' SELECT MAX (it_id) '+
          '   FROM art.prv_resvisitas, art.pit_firmantes b '+
          '  WHERE rv_cuit = '+ SqlValue(FCuit)+
          '    AND rv_estableci = '+ SqlValue(FEstableci)+
          '    AND rv_fechabaja IS NULL '+
          '    AND rv_idvisitaasociada IS NULL '+
          '    AND it_codigo = rv_firmante '+
          '    AND rv_fecha = '+
          '           (SELECT MAX (a.rv_fecha) '+
          '              FROM art.prv_resvisitas a '+
          '             WHERE a.rv_cuit =  '+SqlValue(FCuit)+
          '               AND a.rv_estableci = '+ SqlValue(FEstableci)+
          '               AND a.rv_fechabaja IS NULL '+
          '               AND a.rv_idvisitaasociada IS NULL)';

  Result := ValorSql(sSql);
end;

function GetCantVisitas(FCUIT : STring; FEstableci :Integer; vigenciadesde, vigenciahasta : TDateTime) : Integer;
var
  sSql : String;
begin
  sSql := ' SELECT COUNT (*) '+
          '   FROM art.prv_resvisitas '+
          '  WHERE rv_fechabaja IS NULL '+
          '    AND rv_idvisitaasociada IS NULL '+
          '    AND rv_cuit = '+ SqlValue(FCUIT)+
          '    AND rv_estableci = '+ SqlValue(FEstableci)+
          '    AND rv_fecha >= '+ SqlDate(vigenciadesde)+
          '    AND rv_fecha <= NVL ( '+SqlDate(vigenciahasta)+', rv_fecha)';

  Result := ValorSqlInteger(sSql);
end;

function GetCantCapacit(FCUIT : STring; FEstableci :Integer; vigenciadesde, vigenciahasta : TDateTime) : Integer;
var
  sSql : String;
begin
  sSql := ' SELECT COUNT (*) '+
          '   FROM art.pcm_capacitemp '+
          '  WHERE cm_fechabaja IS NULL '+
          '    AND cm_cuit = '+ SqlValue(FCUIT)+
          '    AND cm_estableci = '+ SqlValue(FEstableci)+
          '    AND cm_fecha >= '+ SqlDate(vigenciadesde)+
          '    AND cm_fecha <= NVL ( '+SqlDate(vigenciahasta)+', cm_fecha)';

  Result := ValorSqlInteger(sSql);
end;

procedure GuardarObservacion(aidCabecera, aIdObservacion: integer; aEstado, aInfoExtra, aVerificarinfo: String; aIdItem: integer);
begin
  if aIdItem > 0 then
    EjecutarStoreSTEx('hys.do_actualizarobservacion(:idrelev, :idobs, :estado, :extrainfo, :verificarinfo, :aIdItem);', [aidCabecera, aIdObservacion, aEstado, aInfoExtra, aVerificarinfo, aIdItem])
  else
    EjecutarStoreSTEx('hys.do_actualizarobservacion(:idrelev, :idobs, :estado, :extrainfo, :verificarinfo, NULL);', [aidCabecera, aIdObservacion, aEstado, aInfoExtra, aVerificarinfo]);
end;

procedure EliminarObservacion(aidCabecera, aIdObservacion: integer; aInfoExtra, aVerificarinfo: String);
var
  aSql: String;
begin
  aSql := 'DELETE FROM hys.hro_relevobservacion WHERE ro_estado = ''P'' AND ro_idrelevriesgolaboral = :idrelev and ro_idobservacion = :idobs ';
  if aVerificarinfo = 'S' then
    aSql := aSql + ' AND ro_infoextra = ' + SqlValue(aInfoExtra);
  EjecutarSqlSTEx(aSql, [aidCabecera, aIdObservacion]);

  aSql := 'UPDATE hys.hro_relevobservacion SET RO_FECHABAJA = SYSDATE, RO_USUBAJA = :usubaja WHERE ro_estado = ''A'' AND ro_idrelevriesgolaboral = :idrelev and ro_idobservacion = :idobs ';
  if aVerificarinfo = 'S' then
    aSql := aSql + ' AND ro_infoextra = ' + SqlValue(aInfoExtra);
  EjecutarSqlSTEx(aSql, [Sesion.LoginName, aidCabecera, aIdObservacion]);
end;


procedure ProcesarObservacion(aidCabecera, aIdObservacion: integer; aEstado, aInfoExtra, aVerificarinfo, aGeneraObs: String; aIdItem: integer);
begin
  EliminarObservacion(aidCabecera, aIdObservacion, aInfoExtra, aVerificarinfo);

  if aGeneraObs = 'S' then
    GuardarObservacion(aidCabecera, aIdObservacion, aEstado, aInfoExtra, aVerificarinfo, aIdItem);
end;

procedure ProcesarObservacionFormulario(aIdCabecera, aIdTipoFormulario: integer; aIdResolucion: integer);
var
  IdObsFalta, IdObsIncompleto, IdInconsistNO, IdInconsistSI, CantSi, CantNo, IdItem: integer;
  sCumplimiento, sFormValido: String;
begin
  case aIdTipoFormulario of
    FORMULARIO_TIPO_A:
    begin
      IdObsFalta := OBSERVACION_FALTA_ANEXO_A;
      IdObsIncompleto := OBSERVACION_ANEXO_A_INCOMPLETO;
      IdInconsistNO := OBSERVACION_ANEXO_A_NO;
      IdInconsistSI := OBSERVACION_ANEXO_A_SI;
    end;
    FORMULARIO_TIPO_B: begin
      IdObsFalta := OBSERVACION_FALTA_ANEXO_B;
      IdObsIncompleto := OBSERVACION_ANEXO_B_INCOMPLETO;
      IdInconsistNO := OBSERVACION_ANEXO_B_NO;
      IdInconsistSI := OBSERVACION_ANEXO_B_SI;
    end;
    FORMULARIO_TIPO_C: begin
      IdObsFalta := OBSERVACION_FALTA_ANEXO_C;
      IdObsIncompleto := OBSERVACION_ANEXO_C_INCOMPLETO;
      IdInconsistNO := OBSERVACION_ANEXO_C_NO;
      IdInconsistSI := OBSERVACION_ANEXO_C_SI;
    end;
    else
      raise Exception.Create('Formulario inválido.');
  end;

  sFormValido := ValorSqlEx('SELECT fr_valido FROM hys.hfr_formulariorelev WHERE fr_fechabaja is null AND fr_idtipoanexo = :idtipoanexo AND fr_idrelevriesgolaboral = :id', [aIdTipoFormulario, aIdCabecera]);
  IdItem := GetItemFormulario(aIdTipoFormulario, aIdResolucion);


  if sFormValido = 'S' then
      //Elimina la Obs de incompleto
      EliminarObservacion(aIdCabecera, IdObsIncompleto, '', 'N')
  else begin
    if sFormValido = 'N' then
      //Guarda la Observacion por anexo incompleto
      GuardarObservacion(aIdCabecera, IdObsIncompleto, 'P', '', 'N', IdItem);
  end;

  sCumplimiento := ValorSqlEx(' SELECT il_cumplimiento ' +
                              ' FROM hys.hil_itemsriesgolaboral, hys.hia_itemanexo ' +
                              ' WHERE il_iditemanexo = ia_id ' +
                              ' AND il_idrelevriesgolaboral = :idrelev ' +
                              ' AND ia_idtipoformanexo = :idform ', [aIdCabecera, aIdTipoFormulario]);

  with GetQueryEx(' SELECT NVL(SUM(DECODE(if_cumplimiento, ''S'', 1, 0)), 0) cantsi, NVL(SUM(DECODE(if_cumplimiento, ''N'', 1, 0)), 0) cantno ' +
                  ' FROM hys.hif_itemsformulariorelev, hys.hfr_formulariorelev ' +
                  ' WHERE fr_fechabaja IS NULL ' +
                  '   AND fr_idtipoanexo = :idtipoanexo ' +
                  '   AND if_idformulariorelev = fr_id ' +
                  '   AND fr_idrelevriesgolaboral = :idrelev ', [aIdTipoFormulario, aIdCabecera]) do
  try
    CantSi := fieldbyName('cantsi').AsInteger;
    CantNo := fieldbyName('cantno').AsInteger;
  finally
    free;
  end;

  //Elimina la Observacion de no existencia de este anexo
  EliminarObservacion(aIdCabecera, IdObsFalta, '', 'N');
  //Guarda la Observacion por no existencia de este anexo
  if (sCumplimiento = 'S') and (CantNo = 0) and (CantSi = 0) then
    GuardarObservacion(aIdCabecera, IdObsFalta, 'P', '', 'N', IdItem);

  //Elimina la Observacion por incosistencias entre el relev y este formulario (SI en el relev y NO en el form)
  EliminarObservacion(aIdCabecera, IdInconsistNO, '', 'N');

  //Guarda la Observacion por incosistencias entre el relev y este formulario (SI en el relev y NO en el form)
  if (sCumplimiento = 'S') and (CantNo > 0) and (CantSi = 0) then
      GuardarObservacion(aIdCabecera, IdInconsistNO, 'P', '', 'N', IdItem);

  //Elimina la Observacion por incosistencias entre el relev y este formulario (NO o NO APLICA en el relev y SI en el form
  EliminarObservacion(aIdCabecera, IdInconsistSI, '', 'N');

  //Guarda la Observacion por incosistencias entre el relev y este formulario (NO o NO APLICA en el relev y SI en el form
  if ((sCumplimiento = 'N') or (sCumplimiento = 'X')) and (CantSi > 0) then
    GuardarObservacion(aIdCabecera, IdInconsistSI, 'P', '', 'N', IdItem);
end;


procedure ProcesarObservacionResponsable(aIdCabecera, aIdResolucion: integer; aOrigen: String);
var
  sCumplimiento: String;
begin
  //busco el responsable del relev
  with GetQueryEx(' SELECT rr_id, rr_valido, rr_cuitcuil ' +
                  ' FROM hys.hrr_responsablerelev ' +
                  ' WHERE rr_idrelevriesgolaboral = :idrelev ' +
                  '   AND rr_fechabaja IS NULL ' +
                  '   AND rr_responsableform = ''S''' +
                  ' ORDER BY rr_responsableform DESC ', [aIdCabecera]) do
  try
    if FieldByName('rr_id').IsNull then
    begin
      //Elimina la Observacion por responsable invalido
      EliminarObservacion(aIdCabecera, OBSERVACION_RESPONSABLE_DATOS_INVAL, '', 'N');
      //Guarda la Observacion por falta de responsable
      GuardarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE, 'P', '', 'N');
    end
    else begin
      //Elimina la Observacion por falta de responsable
      EliminarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE, '', 'N');
      if (FieldByName('rr_valido').AsString = 'S') then
      begin
        //Elimina la Observacion por responsable invalido
        EliminarObservacion(aIdCabecera, OBSERVACION_RESPONSABLE_DATOS_INVAL, '', 'N');
      end
      else begin
        //Guarda la Observacion por responsable invalido
        GuardarObservacion(aIdCabecera, OBSERVACION_RESPONSABLE_DATOS_INVAL, 'P', 'Cuit/Cuil inválido: "' + iif(FieldByName('rr_cuitcuil').IsNull, 'No Especificado',  FieldByName('rr_cuitcuil').AsString) + '"', 'N');
      end;
    end;
  finally
    free;
  end;

  //Verifico si hay que validar el representante de HYS
  sCumplimiento := ValorSqlEx(' SELECT il_cumplimiento ' +
                              ' FROM hys.hil_itemsriesgolaboral, hys.hia_itemanexo ' +
                              ' WHERE il_iditemanexo = ia_id ' +
                              ' AND il_idrelevriesgolaboral = :idrelev ' +
                              ' AND ia_cargorepresentante = :idCargo ', [aIdCabecera, 'H']);

  with GetQueryEx(' SELECT rr_id, rr_valido, rr_cuitcuil ' +
                  ' FROM hys.hrr_responsablerelev ' +
                  ' WHERE rr_idrelevriesgolaboral = :idrelev ' +
                  '   AND rr_fechabaja IS NULL ' +
                  '   AND rr_cargo = ''H''', [aIdCabecera]) do
  try
    if FieldByName('rr_id').IsNull then
    begin
      //Elimina la Observacion por responsable de HYS invalido
      EliminarObservacion(aIdCabecera, OBSERVACION_RESP_HYS_DATOS_INVAL, '', 'N');

      if sCumplimiento = 'S' then
        //Guarda la Observacion por falta de responsable de HYS
        //GuardarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE_HYS, 'P', '', 'N', GetItemResponsable('H', aIdResolucion))
      else
        EliminarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE_HYS, '', 'N');
    end
    else begin
      //Elimina la Observacion por responsable de HYS invalido
      EliminarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE_HYS, '', 'N');
      if (FieldByName('rr_valido').AsString = 'S') then
      begin
        //Elimina la Observacion por responsable de HYS invalido
        EliminarObservacion(aIdCabecera, OBSERVACION_RESP_HYS_DATOS_INVAL, '', 'N');
      end
      else begin
        if sCumplimiento = 'S' then
          //Guarda la Observacion por falta de responsable de HYS
          //GuardarObservacion(aIdCabecera, OBSERVACION_RESP_HYS_DATOS_INVAL, 'P', 'Cuit/Cuil inválido: "' + iif(FieldByName('rr_cuitcuil').IsNull, 'No Especificado',  FieldByName('rr_cuitcuil').AsString) + '"', 'N', GetItemResponsable('H', aIdResolucion));
      end;
    end;
  finally
    free;
  end;

  //Si es origen Web no se validan los responsables de HYS ni de ML
  if (aOrigen = 'W') then Exit;

  //Verifico si hay que validar el representante de ML
  sCumplimiento := ValorSqlEx(' SELECT il_cumplimiento ' +
                              ' FROM hys.hil_itemsriesgolaboral, hys.hia_itemanexo ' +
                              ' WHERE il_iditemanexo = ia_id ' +
                              ' AND il_idrelevriesgolaboral = :idrelev ' +
                              ' AND ia_cargorepresentante = :idCargo ', [aIdCabecera, 'M']);

  with GetQueryEx(' SELECT rr_id, rr_valido, rr_cuitcuil ' +
                  ' FROM hys.hrr_responsablerelev ' +
                  ' WHERE rr_idrelevriesgolaboral = :idrelev ' +
                  '   AND rr_fechabaja IS NULL ' +
                  '   AND rr_cargo = ''M''', [aIdCabecera]) do
  try
    if FieldByName('rr_id').IsNull then
    begin
      //Elimina la Observacion por responsable de ML invalido
      EliminarObservacion(aIdCabecera, OBSERVACION_RESP_ML_DATOS_INVAL, '', 'N');

      if sCumplimiento = 'S' then
        //Guarda la Observacion por falta de responsable de ML
        //GuardarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE_ML, 'P', '', 'N', GetItemResponsable('M', aIdResolucion))
      else
        EliminarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE_ML, '', 'N');
    end
    else begin
      //Elimina la Observacion por responsable de ML invalido
      EliminarObservacion(aIdCabecera, OBSERVACION_FALTA_RESPONSABLE_ML, '', 'N');
      if (FieldByName('rr_valido').AsString = 'S') then
      begin
        //Elimina la Observacion por responsable de ML invalido
        EliminarObservacion(aIdCabecera, OBSERVACION_RESP_ML_DATOS_INVAL, '', 'N');
      end
      else begin
        if sCumplimiento = 'S' then
          //Guarda la Observacion por falta de responsable de ML
          //GuardarObservacion(aIdCabecera, OBSERVACION_RESP_ML_DATOS_INVAL, 'P', 'Cuit/Cuil inválido: "' + iif(FieldByName('rr_cuitcuil').IsNull, 'No Especificado',  FieldByName('rr_cuitcuil').AsString) + '"', 'N', GetItemResponsable('M', aIdResolucion));
      end;
    end;
  finally
    free;
  end;
end;

procedure ProcesarValidezRelev(aidCabecera: integer; aAutoCommit: boolean);
var
  cantObsInvalid: integer;
  sSql: String;
begin

  cantObsInvalid := ValorSqlIntegerEx(' SELECT COUNT(*) ' +
                                      ' FROM hys.hob_observacion, hys.hro_relevobservacion ' +
                                      ' WHERE ro_idobservacion = ob_id  ' +
                                      '   AND ro_fechabaja is null  ' +
                                      '   AND ob_fechabaja is null  ' +
                                      '   AND ob_tipo = :tipo ' +
                                      '   AND ro_idrelevriesgolaboral = :idrelev', ['I' , aidCabecera]);

  sSql := ' UPDATE hys.hrl_relevriesgolaboral '+
          '    SET rl_valido = ' + SqlValue(String(iif(cantObsInvalid = 0, 'S', 'N'))) + ', ' +
          '        rl_fechamodif = sysdate,  ' +
          '        rl_usumodif = ' + SqlValue(Sesion.LoginName) +
          '  WHERE rl_id = '+ SqlValue(aidCabecera);

  if aAutoCommit then
    EjecutarSql(sSql)
  else
    EjecutarSqlST(sSql);
end;

procedure ProcesarObseravacionEstab(aidCabecera: integer; Contrato : Integer; Estableci : Integer);
begin
  if ExisteSql(' SELECT 1 '+
        '   FROM afi.aes_establecimiento '+
        '  WHERE es_contrato = '+SqlValue(Contrato)+
        '    AND es_nroestableci = '+SqlValue(Estableci)+
        '    AND es_sindatos = ''S'' ') then
    GuardarObservacion(aIdCabecera, OBSERVACION_AUSENCIA_DATO_EMPLEADOS_ESTAB, 'P', '', 'N')
  else
    EliminarObservacion(aIdCabecera, OBSERVACION_AUSENCIA_DATO_EMPLEADOS_ESTAB, '', 'N');
end;

function GetItemResponsable(aCargo: String; aidResolucion: Integer):integer;
begin
  result := ValorSqlIntegerEx(' SELECT ia_id ' +
                              '  FROM hys.hta_titulosanexo, hys.hia_itemanexo ' +
                              ' WHERE ia_cargorepresentante = :cargo ' +
                              '   AND ta_id = ia_idtituloanexo ' +
                              '   AND ta_idresolucionanexo = :idres ' +
                              '   AND ta_fechabaja IS NULL ' +
                              '   AND ia_fechabaja IS NULL ', [aCargo, aidResolucion]);
end;


function GetItemFormulario(aIdTipoFormulario, aidResolucion: Integer): integer;
begin
  result := ValorSqlIntegerEx(' SELECT ia_id ' +
                              '  FROM hys.hta_titulosanexo, hys.hia_itemanexo ' +
                              ' WHERE ia_idtipoformanexo = :idtipoform ' +
                              '   AND ta_id = ia_idtituloanexo ' +
                              '   AND ta_idresolucionanexo = :idres ' +
                              '   AND ta_fechabaja IS NULL ' +
                              '   AND ia_fechabaja IS NULL ', [aIdTipoFormulario, aidResolucion]);
end;

procedure DenunciaDatosIncompletos(aCuit : String;IdEstableci : Integer; aNroInforme : Integer; DatoFaltante :String; TipoInforme : String);
var
  FCuerpoMail : String;
  FDireccionMail : String;
  FNroEstableci : Integer;
begin
  FNroEstableci := ValorSql('SELECT es_nroestableci '+
                                      '  FROM afi.aes_establecimiento '+
                                      ' WHERE es_id = '+SqlValue(idestableci));
  FCuerpoMail :=
    'La siguiente empresa tiene datos incompletos en el informe abajo expuesto, '+
    'por favor tome las acciones pertinentes en estos casos. '+ #13#10 +
    'CUIT: ' + PonerGuiones(aCuit) + #13#10 +
    'Nº Establecimiento: ' + IntToStr(FNroEstableci) + #13#10 +
    'Establecimiento : ' + ValorSql('SELECT es_nombre '+
                                    '  FROM afi.aes_establecimiento '+
                                    ' WHERE es_id = '+SqlValue(idestableci)) + #13#10 +
    'Nro. Informe: ' + IntToStr(aNroInforme)+ #13#10 +
    'Tipo Informe: ' + TipoInforme+ #13#10 +
    'Dato Faltante: '+ DatoFaltante;
  if ((aCuit = '') or (IdEstableci = 0)) then
  begin
    FDireccionMail := ValorSql(
      ' SELECT art.varios.get_direccionesenviomail(''HYS_REF'') '+
      '   FROM dual ');
  end
  else
  begin
    FDireccionMail :=
    ValorSql ( ' SELECT NVL2(cor.it_email, cor.it_email || '','' || prev.it_email, prev.it_email) '+
               '   FROM art.pit_firmantes cor, art.pit_firmantes prev '+
               '  WHERE prev.it_idsupervisor = cor.it_id(+) '+
               '    AND prev.it_codigo = art.hys.get_preventor_estab(' + SqlValue(aCuit) + ', ' +
                                                                  SqlValue(FNroEstableci) + ', ' +
                                                                  'SYSDATE)')
  end;

  EnviarMailBD(FDireccionMail, 'Denuncia Datos Incompletos',
               [], FCuerpoMail, nil, 0, tcDefault, False);
end;

procedure EliminarRelevamiento(CUIT: String; Estableci: Integer; aFechaRelev: TDateTime);
var
  idCabecera: integer;
//  fecharelev: TDateTime;
  ultrelev: TDateTime;
  IDEmpresa: integer;
begin
  IDEmpresa := ValorSqlIntegerEx('SELECT EM_ID FROM AFI.AEM_EMPRESA WHERE EM_CUIT = :CUIT', [Cuit]);
  ultrelev := ValorSqlDateTimeEx( 'SELECT MAX(fecha) ' +
                                  '  FROM (SELECT cn_fecharelevamiento fecha ' +
                                  '          FROM hys.hcn_cabeceranomina ' +
                                  '         WHERE cn_cuit = :cuit ' +
                                  '           AND cn_estableci = :estab ' +
                                  '           AND cn_idestado <> 6 ' +
                                  '           AND cn_fecharelevamiento <> ' + SqlValue(aFechaRelev) +
                                  '        UNION ALL ' +
                                  '        SELECT sr_fecha fecha ' +
                                  '          FROM art.psr_sinriesgo ' +
                                  '         WHERE sr_cuit = :cuit ' +
                                  '           AND sr_fecha <> ' + SqlValue(aFechaRelev) +
                                  '           AND sr_estableci = :estab) a ',[CUIT, Estableci]);
  if (not (ultrelev > aFechaRelev)) or (ultrelev = 0) then
  begin
    if ExisteSql(' SELECT 1 '+
                 '   FROM PSR_SINRIESGO ' +
                 '  WHERE SR_CUIT = ' + SqlValue(CUIT) +
                 '    AND SR_ESTABLECI = ' + SqlValue(Estableci) +
                 '    AND SR_FECHA = ' + SqlDate(ultrelev)) or (ultrelev = 0) then
    begin
      EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
              '   SET al_idcabrelevamientoactivo = NULL, ' +
              '       al_usumodif = :pusuario, ' +
              '       al_fechamodif = SYSDATE ' +
              ' WHERE al_idempresa = :pidempresa ' +
              '   AND al_nroestableci = :pnroestableci ',
              [Sesion.UserID, IDEmpresa, Estableci]);
      if (ultrelev <> 0) then
        ActualizarUltRelevamiento (CUIT, Estableci, ultrelev, 'S', true)
      else
        ActualizarUltRelevamiento (CUIT, Estableci, ultrelev, '', true)
    end
    else begin
      EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina ' +
                    ' SET cn_idestado = 1 ' +
                    ' WHERE cn_cuit = ' + SqlValue(CUIT) +
                    ' AND cn_estableci = ' + SqlValue(Estableci) +
                    ' AND cn_fecharelevamiento = ' + SqlValue(ultrelev)
                    );

      idCabecera :=  ValorSqlInteger(' SELECT cn_id ' +
                                     ' FROM hys.hcn_cabeceranomina ' +
                                     ' WHERE cn_cuit = ' + SqlValue(CUIT) +
                                      ' AND cn_estableci = ' + SqlValue(Estableci) +
                                     ' AND cn_idestado <> 6 ' +
                                     ' AND cn_fecharelevamiento = ' + SqlValue(ultrelev));

      EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
              '   SET al_idcabrelevamientoactivo = :idrelev, ' +
              '       al_usumodif = :pusuario, ' +
              '       al_fechamodif = SYSDATE ' +
              ' WHERE al_idempresa = :pidempresa ' +
              '   AND al_nroestableci = :pnroestableci ',
              [idCabecera, Sesion.UserID, IDEmpresa, Estableci]);
      ActualizarUltRelevamiento (CUIT, Estableci, ultrelev, 'E', true);
    end;
  end;
end;

procedure ActualizarRelevamientos(aCuit : String; aEstableci : Integer);
var
  sSql: String;
  vigenciadesde, vigenciahasta: TDateTime;
  idoperativo: integer;
begin
  idoperativo := ValorSqlInteger(
        ' SELECT nvl(hys.get_idoperativovigente_empresa (em_id, SYSDATE),0) '+
        '   FROM afi.aem_empresa '+
        '  WHERE em_cuit = '+ SqlValue(aCuit));

  with GetQuery(
        ' SELECT vo_vigenciadesde, vo_vigenciahasta '+
        '   FROM hys.hvo_vigenciaoperativo, hys.hco_cuitoperativo'+
        '  WHERE vo_tipo = co_tipo AND vo_operativo = co_operativo '+
        '    AND co_id = '+ SqlValue(idoperativo)) do
  try
    vigenciadesde := Fields[0].AsDateTime;
    vigenciahasta := Fields[1].AsDateTime;
  finally
    Free;
  end;

  sSql := ' UPDATE hys.hep_estabporpreventor '+
          '    SET ep_fechaultrelev = '+SqlDate(GetFechaUltRelev(aCuit,aEstableci))+','+
          '        ep_tiporelev = '+SqlValue(TipoUltRelev(aCuit,aEstableci))+','+
          '        ep_cantrelev = '+ SqlValue(GetCantRelev(aCuit, aEstableci, vigenciadesde, vigenciahasta)) +
          '  WHERE ep_cuit = '+ SqlValue(aCuit)+' AND ep_estableci = '+SqlValue(aEstableci);
  EjecutarSqlST(sSql);
end;

procedure ActualizarAsignacionLote(IdCabeceraNomina: integer;
  fechaRelev: TDateTime; Cuit: String; Estableci: Integer; bAgregaCabecera: boolean = true;
  fechaRecepPrev: TDateTime = 0; fechaRecepCoord: TDateTime = 0; fechaImpo: TDateTime = 0; conSemestral: boolean = false;
  IdAsociado: integer = 0);
  procedure Actualiza(FIDEmpresa, Estableci, IdCabeceraNomina: integer; bActualizaOperativo: boolean = true; bActualizaProxFecha: boolean = true);
  begin
    if ExisteSqlEx('SELECT 1 ' +
                   '  FROM hys.hal_asignacionlote ' +
                   ' WHERE al_idempresa = :pidempresa ' +
                   '   AND al_nroestableci = :pnroestableci ',
                   [FIDEmpresa, Estableci]) then
      EjecutarSqlSTEx ('UPDATE hys.hal_asignacionlote ' +
                      '   SET al_idcabrelevamientoactivo = :idcabrelevamientoactivo, ' +
      iif(bActualizaProxFecha, ' al_fechaproxoperacion = art.actualdate, ', '') +
      iif(bActualizaOperativo, ' al_tipoproxoperacion = ''A'', ', '') +
                      '       al_usumodif = :pusuario, ' +
                      '       al_fechamodif = SYSDATE ' +
                      ' WHERE al_idempresa = :pidempresa ' +
                      '   AND al_nroestableci = :pnroestableci ',
                      [IdCabeceraNomina, Sesion.UserID, FIDEmpresa, Estableci])
    else
      EjecutarSqlSTEx ('INSERT INTO hys.hal_asignacionlote ' +
                      '            (al_idempresa, al_nroestableci, al_idcabrelevamientoactivo, ' +
                      '             al_idultsubloteasignado, al_idultsubloteauditado, ' +
                      iif(bActualizaProxFecha, ' al_fechaproxoperacion, ', '') +
                      iif(bActualizaOperativo, ' al_tipoproxoperacion, ', '') +
                      '             al_secuencia, ' +
                      '             al_usualta, al_fechaalta) ' +
                      '     VALUES (:pidempresa, :pnroestableci, :idcabrelevamientoactivo, ' +
                      '             NULL, NULL, ' +
                      iif(bActualizaProxFecha, ' art.actualdate, ', '') +
                      iif(bActualizaOperativo, ' ''A'', ', '') +
                      '             0, ' +
                      '             :pusuario, SYSDATE) ',
                      [FIDEmpresa, Estableci, IdCabeceraNomina, Sesion.UserID]);
  end;
var
//  IDCabeceraActiva,
  EstadoNomina: integer;
  FIdEmpresa : Integer;
//  ExisteActivo, ExisteActivoPrevio: boolean;
  ultrelev: TDatetime;
  fechaproxoper: TDatetime;
begin
//  IDCabeceraActiva := IdCabeceraNomina;
  FIdEmpresa := ValorSql('SELECT EM_ID FROM afi.aem_empresa WHERE em_cuit = '+SqlValue(Cuit));
  ultrelev := ValorSqlDateTimeEx( 'SELECT MAX(fecha) ' +
                                        '  FROM (SELECT cn_fecharelevamiento fecha ' +
                                        '          FROM hys.hcn_cabeceranomina ' +
                                        '         WHERE cn_cuit = :cuit ' +
                                        '           AND cn_estableci = :estab ' +
                                        '           AND cn_idestado <> 6 ' +
                                        '           AND cn_fecharelevamiento <> ' + SqlValue(fechaRecepPrev) +
                                        '        UNION ALL ' +
                                        '        SELECT sr_fecha fecha ' +
                                        '          FROM art.psr_sinriesgo ' +
                                        '         WHERE sr_cuit = :cuit ' +
                                        '           AND sr_estableci = :estab ' +
                                        '           AND sr_fecha <> ' + SqlValue(fechaRecepPrev) + ') a ',[CUIT, Estableci]);

  if ultrelev < fechaRelev then
    EstadoNomina := enActivo
  else
    EstadoNomina := enTerminado;

  if bAgregaCabecera then
    begin
      if (fechaRelev > fechaRecepPrev) and not (fechaRecepPrev = 0) then
        Raise Exception.Create('La Fecha de Relevamiento debe ser menor que la de Recepción Preventor.')
      else if (fechaRecepPrev > fechaRecepCoord) and not (fechaRecepCoord = 0) then
        Raise Exception.Create('La Fecha de Recepción Preventor debe ser menor que la de Recepción Coordinador.')
      else if (fechaRecepCoord  > fechaImpo) and not (fechaImpo = 0) then
        Raise Exception.Create('La Fecha de Recepción Coordinador debe ser menor que la de Importación.');

      EjecutarSqlST(
        ' INSERT INTO hys.hcn_cabeceranomina '  +
        '             ( cn_id, cn_cuit, '       +
        '               cn_estableci, '         +
        '               cn_usualta, '           +
        '               cn_fechaalta, '         +
        '               cn_fecharelevamiento, ' +
        '               cn_idestado, '          +
        '               cn_fecharecepcionprev, '+
        '               cn_fecharecepcioncor, ' +
        '               cn_fechaimportacion, '   +
        '               cn_consemestral, ' +
        '               cn_idrelevasociado ' +
        '             ) '+
        '   VALUES (' + SqlValue(IdCabeceraNomina) + ', '
                      + SqlValue(Cuit) + ', '
                      + SqlValue(Estableci) + ', '
                      + SqlValue(Sesion.UserID)
                      + ', SYSDATE, '
                      + SqlValue(FechaRelev)    + ', '
                      + SqlValue(EstadoNomina)  + ', '
                      + SqlValue(fechaRecepPrev)    + ', '
                      + SqlValue(fechaRecepCoord)    + ', '
                      + SqlValue(fechaImpo) + ', '
                      + SqlValue(conSemestral) + ', '
                      + SqlInteger(IdAsociado, true) + ')'
        );

    end
    else begin
      EjecutarSqlST(' UPDATE hys.hcn_cabeceranomina ' +
                    ' SET cn_idestado = ' + SqlValue(EstadoNomina) +
                    ' WHERE cn_id = ' + SqlValue(IdCabeceraNomina));
      FechaRelev := ValorSqlDateTime('SELECT cn_fecharelevamiento FROM hys.hcn_cabeceranomina where cn_id = ' + SqlValue(IdCabeceraNomina));
    end;

    case EstadoNomina of
      enErroneo: MsgBox('La nómina ingresada no se utilizará para los estudios por estar fuera de término.');
      enActivo : begin
        //Si es primer relevamiento o es el primero con expuestos
        if (ultrelev = 0) or
            not ExisteSqlEx(' SELECT 1 ' +
                            ' FROM hys.hcn_cabeceranomina ' +
                            ' WHERE cn_cuit = :cuit ' +
                            ' AND cn_estableci = :estab ' +
                            ' AND cn_idestado <> 6 ',[CUIT, Estableci]) then
          Actualiza(FIdEmpresa, Estableci, IdCabeceraNomina)
        else begin
            //Existe Relev anterior y es sin expuestos
            if (ultrelev <> 0) and
                ExisteSqlEx(' SELECT 1 ' +
                            ' FROM art.psr_sinriesgo ' +
                            ' WHERE sr_cuit = :cuit ' +
                            ' AND sr_estableci = :estab ' +
                            ' AND sr_fecha = ' + SqlValue(ultrelev),[CUIT, Estableci]) then
            begin
              fechaproxoper := ValorSqlDateTimeEx('SELECT al_fechaproxoperacion ' +
                                                  '  FROM hys.hal_asignacionlote ' +
                                                  ' WHERE al_idempresa = :pidempresa ' +
                                                  '   AND al_nroestableci = :pnroestableci ',
                                                   [FIDEmpresa, Estableci]);
              //Solo actualizo la fecha de proxima operacion
              if (MonthsBetween(fechaproxoper, DBDate) > 5) and (MonthsBetween(fechaproxoper, DBDate) < 10) then
                Actualiza(FIdEmpresa, Estableci, IdCabeceraNomina, false)
              //Actualizo el tipo de operacion y la fecha de proxima operacion
              else begin
                if (MonthsBetween(fechaproxoper, DBDate) >= 10) then
                  Actualiza(FIdEmpresa, Estableci, IdCabeceraNomina)
                else
                  Actualiza(FIdEmpresa, Estableci, IdCabeceraNomina, False, False);
              end;
            end
            else
              Actualiza(FIdEmpresa, Estableci, IdCabeceraNomina, false, false);
        end;
        ActualizarUltRelevamiento (Cuit, Estableci, FechaRelev, 'E');
    end;
  end;
end;

procedure ActualizarUltRelevamiento (cuit: String; nroestableci: integer; fecharelev: TDateTime; tiporelev: String; baja: boolean = false);
begin
  if ExisteSqlEx ('SELECT 1 ' +
                  '  FROM hys.hur_ultimorelevamiento ' +
                  ' WHERE ur_cuit = :cuit ' +
                  '   AND ur_estableci = :nroestableci ',
                  [cuit, nroestableci]) then
    EjecutarSqlSTEx('UPDATE hys.hur_ultimorelevamiento ' +
                    '  SET ur_fecharelev = ' + SqlDate(fecharelev) + ', ' +
                    '      ur_fechaaltarelev = SYSDATE, ' +
                    '      ur_tiporelevamiento = :tiporelev ' +
                    'WHERE ur_cuit = :cuit ' +
                    '  AND ur_estableci = :nroestableci ' +
                   iif (baja, '', '  AND ur_fecharelev < ' + SqlDate(fecharelev)),
                    [tiporelev, cuit, nroestableci])
  else
    EjecutarSqlSTEx('INSERT INTO hys.hur_ultimorelevamiento ' +
                    '            (ur_cuit, ur_estableci, ur_fecharelev, ' +
                    '             ur_fechaaltarelev, ur_tiporelevamiento) ' +
                    '     VALUES (:cuit, :nroestableci, ' + SqlDate(fecharelev) + ', ' +
                    '             SYSDATE, :tiporelev)',
                    [cuit, nroestableci, tiporelev]);

end;

function GetGrupoDenuncia(aCUIT: String; aContrato, aEstableci: integer; aTipo: String): String;
var
 sGrupo: String;
begin
  if aTipo = 'CO' then sGrupo := 'CO';

  if sGrupo = '' then
    sGrupo := ValorSql ('SELECT DECODE (' + SqlValue(aTipo) + ', ' +
                        '               ''ET'', ''TC'', ' +
                        '               ''GB'', ''BC'', ' +
                        '               ''CO'', ''CO'', ' +
                        '               ''EP'', ''PI'', ' +
                        '               NULL ' +
                        '              ) ' +
                        '  FROM afi.aes_establecimiento ' +
                        ' WHERE es_nroestableci = ' + SqlValue(aEstableci) +
                        '   AND es_contrato = ' + SqlValue(aContrato) +
                        '   AND es_eventual = ''S'''
                       );

  if sGrupo = '' then
    sGrupo := ValorSql ('SELECT DISTINCT dp_grupo ' +
                        '           FROM hys.hga_grupoporactividad, hys.atc_actividadciiu ' +
                        '          WHERE dp_tipo = ' + SqlValue(aTipo) +
                        '            AND dp_actividad = tc_actividad ' +
                        '            AND dp_fechabaja IS NULL ' +
                        '            AND ROWNUM = 1 ' +
                        '            AND tc_primerdigitociiu = ' +
                        '                   (SELECT SUBSTR ' +
                        '                              (NVL ((SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                        '                                      FROM afi.aes_establecimiento, ' +
                        '                                           comunes.cac_actividad ' +
                        '                                      WHERE es_nroestableci = ' + SqlValue(aEstableci) +
                        '                                        AND es_contrato = ' + SqlValue(aContrato) +
                        '                                        AND ac_id = es_idactividad), ' +
                        '                                    (SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                        '                                       FROM afi.aco_contrato, ' +
                        '                                            afi.aem_empresa, ' +
                        '                                            comunes.cac_actividad ' +
                        '                                      WHERE co_contrato = ' + SqlValue(aContrato) +
                        '                                        AND em_id = co_idempresa ' +
                        '                                        AND em_cuit = ' + SqlValue(aCUIT) +
                        '                                        AND ac_id = co_idactividad) ' +
                        '                                   ), ' +
                        '                               1, ' +
                        '                               1 ' +
                        '                              ) actividad ' +
                        '                      FROM DUAL)'
                       );


  if (sGrupo = '') and (aTipo = 'EP') then
    sGrupo := 'PI';

  result := sGrupo;
end;



procedure DenunciaIncumplimiento(iditem : Integer; fechaincump : TDateTime; CUIT : String; Contrato, NroEstableci :integer);
var
  tipoEmpresa,sSql, Operativo, ObservacionDenuncia, sGrupo : String;
  IdObraDenuncia, NroRecomendacion, IdVisita : Integer;
begin
  tipoEmpresa := ValorSql(' SELECT art.hys.get_tipo_estab_srt('+SqlValue(CUIT)+','+SqlValue(NroEstableci)+','+SqlValue(fechaincump)+') FROM DUAL ', 'GB');
  sGrupo := GetGrupoDenuncia(Cuit, Contrato, NroEstableci, tipoEmpresa);

  sSql :=
    ' SELECT ri_rubro ' +
    '   FROM hys.hri_relevitemdenuncia '+
    '  WHERE ri_iditem463 = '+SqlValue(iditem)+
//    '    AND ri_tipoempresa = '+SqlValue(tipoEmpresa)+
    '    AND ri_fechabaja IS NULL ';

  with GetQuery(sSql) do
  try
    if not Eof then
      if not ExisteSql(
        '  SELECT 1 '+
        '    FROM art.pod_obradenuncia, art.pdd_detalledenuncia '+
        '   WHERE dd_idpodobradenuncia = od_id '+
        '     AND od_cuit = '+SqlValue(CUIT)+
        '     AND od_estableci = '+SqlValue(NroEstableci)+
        '     AND od_fecha = '+SqlValue(fechaincump)+
        '     AND dd_grupo = '+SqlValue(sGrupo)+
        '     AND dd_rubro = '+SqlValue(FieldByName('ri_rubro').AsString)
        )then
      begin
        Operativo := ValorSql(' SELECT art.hys.get_operativovigente_empresa('+SqlValue(CUIT)+','+SqlValue(fechaincump)+
                              ')  FROM DUAL ');
        IdObraDenuncia := ValorSqlInteger(' SELECT od_id '+
          '   FROM art.pod_obradenuncia '+
          '  WHERE od_cuit = '+SqlValue(CUIT)+
          '    AND od_estableci = '+SqlValue(NroEstableci)+
          '    AND od_fecha = '+SqlValue(fechaincump)+
          '    AND od_tipo = '+SqlValue(tipoEmpresa)+
          '    AND od_operativo = '+SqlValue(Operativo));

        IdVisita :=ValorSqlInteger(
        ' SELECT prv.rv_id '+
        '   FROM hys.hvm_visitamotivo, art.prv_resvisitas prv'+
        '  WHERE rv_id = vm_idvisita '+
        '    AND rv_cuit = '+SqlValue(CUIT)+
        '    AND rv_estableci = '+SqlValue(NroEstableci)+
        '    AND rv_fecha >= art.actualdate - 365 '+
        '    AND vm_idmotivo in (63, 64) '+
        '    AND vm_fechabaja IS NULL '+
        '    AND rv_fechabaja IS NULL '+
        '    AND rv_fecha = (SELECT MAX(rv_fecha) '+
        '                      FROM hys.hvm_visitamotivo, art.prv_resvisitas a '+
        '                     WHERE rv_id = vm_idvisita '+
        '                       AND a.rv_cuit = prv.rv_cuit '+
        '                       AND a.rv_estableci = prv.rv_estableci '+
        '                       AND rv_fecha >= art.actualdate - 365 '+
        '                       AND vm_idmotivo in (63, 64) '+
        '                       AND vm_fechabaja IS NULL '+
        '                       AND rv_fechabaja IS NULL) ');

        if IdObraDenuncia = 0 then
        begin
          IdObraDenuncia := GetSecNextVal('art.seq_pod_id');

          observacionDenuncia := ValorSql(
            ' SELECT rv_descripcion '+
            '   FROM art.prv_resvisitas '+
            '  WHERE rv_id = '+SqlValue(IdVisita));


          EjecutarSqlST(
            ' INSERT INTO pod_obradenuncia '+
            '             (od_cuit, od_estableci, od_fecha, od_tipo, od_observaciones1, '+
            '              od_observaciones2, od_usualta, od_fechaalta, '+
            '              od_tipo_visita, od_operativo, od_idvisita, od_id) '+
            '      VALUES ('+SqlValue(CUIT)+','+ SqlValue(NroEstableci)+','+
            SqlValue(fechaincump)+','+ SqlValue(tipoEmpresa)+','+SqlValue(ObservacionDenuncia)+', NULL,'+SqlValue(Sesion.UserID)+', SYSDATE, ''U'', '+
            SqlValue(Operativo)+','+SqlValue(IdVisita)+','+SqlValue(IdObraDenuncia)+')');
        end;

        NroRecomendacion := IncSql(
          ' SELECT NVL (MAX (dd_nrorecomendacion), 0) '+
          '   FROM art.pdd_detalledenuncia, pod_obradenuncia '+
          '  WHERE od_cuit = '+SqlValue(CUIT)+
          '    AND od_estableci = '+SqlValue(NroEstableci)+
          '    AND od_id = dd_idpodobradenuncia');

        EjecutarSqlST(
          ' INSERT INTO art.pdd_detalledenuncia '+
          '             (dd_id, dd_grupo, dd_rubro, dd_usualta, dd_fechaalta, dd_tipo, '+
          '              dd_operativo, dd_idvisita, dd_observaciones, '+
          '              dd_idpodobradenuncia, dd_nrorecomendacion, dd_tipodenuncia) '+
          '      VALUES (art.seq_pdd_id.NEXTVAL,'+ SqlValue(sGrupo)+','+
           SqlValue(FieldByName('ri_rubro').AsString)+','+ SqlValue(Sesion.UserID)+', SYSDATE, '+
           SqlValue(tipoEmpresa)+','+ SqlValue(Operativo)+', ' + SqlValue(IdVisita) + ', ''Eval.Verosimilitud Res.463'','+SqlValue(IdObraDenuncia)+
          ','+SqlValue(NroRecomendacion)+', ''A'')');

      end;
  finally
    Free;
  end;
end;

procedure ActualizarPlan(aIdVisita, aIdEmpresa, aEstableci: integer); var
  canttareas: integer;
  cantrealizadas: integer;
  estado: string;
begin

  with GetQueryEx('SELECT distinct ts_idplan FROM hys.hts_tareahys WHERE ts_idvisitapreventor = :idvisita AND ts_fechabaja IS NULL ', [aIdVisita]) do
  try
    while not Eof do
    begin
      EjecutarSqlSTEx(' UPDATE hys.hps_planhys ' +
                      ' SET ps_estado = ''N''' +
                      ' WHERE ps_id = :id ', [FieldByName('ts_idplan').AsInteger]);
      Next;
    end;
  finally
    free;
  end;

  EjecutarSqlSTEx(' UPDATE hys.hts_tareahys ' +
                  ' SET ts_idvisitapreventor = null, ' +
                  '     ts_cumplimiento = null ' +
                  ' WHERE ts_idvisitapreventor = :id ', [aIdVisita]);

  EjecutarStoreSTEx('art.hys_plan.do_actualizarplan(:aidvisita, :idempresa, :estableci);', [aIdVisita, aIdEmpresa, aEstableci]);

  (*El cumplimiento se establece por trigger*)

  with GetQueryEx('SELECT distinct ts_idplan FROM hys.hts_tareahys WHERE ts_idvisitapreventor = :idvisita AND ts_fechabaja IS NULL ', [aIdVisita]) do
  try
    while not Eof do
    begin

      canttareas := ValorSqlIntegerEx(' SELECT COUNT(*) ' +
                                      '   FROM hys.hts_tareahys ' +
                                      '  WHERE ts_idplan = :idvisitaplan ' +
                                      '    AND ts_fechabaja IS NULL', [FieldByName('ts_idplan').AsInteger]);

      cantrealizadas := ValorSqlIntegerEx(' SELECT COUNT(*) ' +
                                          '   FROM hys.hts_tareahys ' +
                                          '  WHERE ts_idplan = :idvisitaplan ' +
                                          '    AND ts_idvisitapreventor IS NOT NULL ' +
                                          '    AND ts_fechabaja IS NULL', [FieldByName('ts_idplan').AsInteger]);

      if canttareas = cantrealizadas then
        estado := 'T'
      else
        estado := 'P';

      EjecutarSqlSTEx(' UPDATE hys.hps_planhys ' +
                      ' SET ps_estado = :estado ' +
                      ' WHERE ps_id = :id ', [estado, FieldByName('ts_idplan').AsInteger]);

      Next;
    end;
  finally
    free;
  end;
end;

procedure GuardarCargaPlan(idEmpresa, estableci: integer; fechavisita: TDate; idPreventor, kms, idmotivo: integer);
var
  idVisita: integer;
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'hys_plan.do_guardarvisitaact';

    Params.CreateParam(ftInteger, 'idempresa', ptInput);
    ParamByName('idempresa').Value := idEmpresa;

    Params.CreateParam(ftInteger, 'estableci', ptInput);
    ParamByName('estableci').Value := estableci;

    Params.CreateParam(ftDateTime, 'fechavisita', ptInput);
    ParamByName('fechavisita').Value := fechavisita;

    Params.CreateParam(ftInteger, 'idpreventor', ptInput);
    ParamByName('idpreventor').Value := idpreventor;

    Params.CreateParam(ftInteger, 'kms', ptInput);
    ParamByName('kms').Value := kms;

    Params.CreateParam(ftInteger, 'idmotivo', ptInput);
    ParamByName('idmotivo').Value := idmotivo;

    Params.CreateParam(ftinteger, 'idVisita', ptOutput);
    ExecProc;

    idVisita := ParamByName('idVisita').Value;
  finally
    Free;
  end;

  if (idVisita > 0) then
    ActualizarPlan(idVisita, idEmpresa, estableci);
end;

procedure GuardarVisitaEnPlan(FCUIT : string; FEstableci: Integer; FTipo: String;FOperativo : String;
                              aFechaVisita: TDate; aMostrarMensaje: boolean; Componente : TControl);
var
  nExiste: integer;
begin
  nExiste := ValorSqlInteger( 'SELECT CASE WHEN pv_fechabaja IS null THEN 0 ELSE 1 END ' +
                              '  FROM hys.hpv_planvisitas ' +
                              ' WHERE pv_cuit = ' + SqlValue(FCUIT) +
                              '   AND pv_estableci = ' + SqlValue(FEstableci) +
                              '   AND pv_tipo = ' + SqlValue(FTipo) +
                              '   AND pv_operativo = ' + SqlValue(FOperativo) +
                              '   AND pv_fecha = ' + SqlValue(aFechaVisita), -1);

  if nExiste = 1 then
    EjecutarSqlST('UPDATE hys.hpv_planvisitas ' +
                  'SET pv_usubaja = null, ' +
                  ' pv_fechabaja = null, ' +
                  ' pv_fechamodif = sysdate, ' +
                  ' pv_usumodif = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE pv_cuit = ' + SqlValue(FCUIT) +
                  '   AND pv_estableci = ' + SqlValue(FEstableci) +
                  '   AND pv_tipo = ' + SqlValue(FTipo) +
                  '   AND pv_operativo = ' + SqlValue(FOperativo) +
                  '   AND pv_fecha = ' + SqlValue(aFechaVisita))

  else begin
    if nExiste = -1 then
      EjecutarSqlSTEx('INSERT INTO hys.hpv_planvisitas (pv_cuit, pv_estableci, pv_fecha, pv_fechaalta, pv_usualta, ' +
                      '       pv_operativo, pv_tipo, pv_id) ' +
                      'VALUES(:cuit, :estab, ' + SqlValue(aFechaVisita) +  ', sysdate, :usualta, ' +
                      '       :operativo, :tipo, hys.seq_hpv_planvisitas.nextval)',
                      [FCUIT, FEstableci, Sesion.LoginName, FOperativo, FTipo])
    else begin
      if aMostrarMensaje then
        Verificar(true, Componente, 'La fecha de visita ya existe.');
    end;
  end;
end;

procedure ArmarConstanciaVisita( sCUIT : String; Estableci : Integer; sTipo, sOperativoOrig : String; cMedidas, cPRSPAPE, cPAL : Boolean; dFecha : TDateTime; pPath : String = ''; PalVacio : Boolean = False );
var
  sCondicionExtra,
  sConsulta, sConsultaMedidas, sConsultaRecomendaciones,
  sCIIU, sSql, sEstabDesc, sDomicilioEstab, sLocalidadEstab,
  sOperativo, sContrato, sRazonSocial, sCPA, sProvinciaEstab, sActividad : String;
  i, cantVistas, cantCopias : Integer;
begin
  if (cMedidas or cPRSPAPE or cPal) then
  begin
    cantCopias := 0;
    sCondicionExtra := '';
    sConsulta := '';
    sContrato := ValorSql('SELECT art.get_vultcontrato ('+SqlValue(sCUIT)+') FROM dual');

    if (cMedidas) then
    begin
      sOperativo := ValorSql ('SELECT co_operativo ' +
                              '  FROM hys.hco_cuitoperativo hco1 ' +
                              ' WHERE co_operativo = ' +
                              '         (SELECT MAX(hco2.co_operativo) ' +
                              '            FROM hys.hco_cuitoperativo hco2 ' +
                              '           WHERE co_operativo <> ' +
                              '                   (SELECT co_operativo ' +
                              '                      FROM hys.hco_cuitoperativo hco3 ' +
                              '                     WHERE co_id = art.hys.get_idoperativovigente_empresa(co_idempresa, SYSDATE) ' +
                              '                       AND hco2.co_idempresa = hco3.co_idempresa ' +
                              '                       AND co_tipo = ''GB'') ' +
                              '             AND hco1.co_idempresa = hco2.co_idempresa) ' +
                              '   AND hco1.co_tipo IN(''ET'', ''EP'') ' +
                              '   AND co_cuit = ' + SqlValue( sCUIT));

      if sOperativo <> '' then
        sCondicionExtra := '   AND dd_operativo > ' + SqlValue(sOperativo)
    end;

    if AreIn(sTipo, ['ET', 'EP']) then
      sCondicionExtra := '    AND dd_tipo = ' + SqlValue(sTipo);

    if cMedidas then
    begin
      sSql := 'SELECT d.dd_nrorecomendacion nromedida, d.dd_rubro item, ' +
                  '       SUBSTR(d.dd_observaciones, 1, 300) medida ' +
                  '  FROM art.pdd_detalledenuncia d, art.pod_obradenuncia ' +
                  ' WHERE od_id = dd_idpodobradenuncia ' +
                  '   and dd_operativo = art.hys.get_operativovigente_empresa(od_cuit) '+
                  '   AND od_cuit = ' + SqlValue(sCUIT) +
                  '   AND od_estableci = ' + SqlValue(Estableci) +
                      sCondicionExtra +
                  '   AND dd_grupo NOT IN(''TE'',''PE'', ''CG'', ''BG'', ''PG'') ' +
                  '   AND dd_observaciones IS NOT NULL ' +
                  '   AND d.dd_nrorecomendacion IS NOT NULL ' +
                  '   AND d.dd_fechabaja IS NULL ' +
                  '   AND dd_rubro not in (500, 600) ' +
                  '   AND dd_fechaalta > TO_DATE(''20/07/2010'', ''DD/MM/YYYY'') ' +
                 // '   AND (   NOT(    dd_grupo = ''BI'' '+
                 // '               AND dd_rubro = 20) '+
                 // '        OR dd_grupo <> ''BI'') '+
                  '   AND NOT EXISTS(SELECT 1 ' +
                  '                    FROM art.ppv_planmvisitas ppv ' +
                  '                   WHERE pv_iddenuncia = dd_id ' +
                  '                     AND pv_tipovisita = ''C'' ' +
                  '                     AND pv_fechabaja IS NULL ' +
                  '                     AND pv_fecha = (SELECT MAX(pv_fecha) ' +
                  '                                       FROM art.ppv_planmvisitas ppv2 ' +
                  '                                      WHERE ppv2.pv_fechabaja IS NULL ' +
                  '                                        AND ppv2.pv_iddenuncia = dd_id ' +
                  '                                        AND ppv2.pv_fechabaja IS NULL)) ';


      if AreIn(sTipo, ['ET', 'EP']) then
        sConsultaMedidas := sSql
      else
        sConsulta:= sSql;
    end;
    if cPRSPAPE then
    begin
      if cMedidas then
        sConsulta:= sConsulta + 'UNION ALL ';

      sSql := 'SELECT re_recomendacion nromedida, NULL item, ' +
              '       SUBSTR(TRIM(NVL(re_descripcion1, '''') ' +
              '                   || '' '' ' +
              '                   || NVL(re_descripcion2, '''')), 1, 130) medida' +
              '  FROM art.pre_recomendaciones ' +
              ' WHERE re_fechabaja IS NULL ' +
              '   AND re_cuit = ' + SqlValue(sCUIT) +
              '   AND re_estableci = ' + SqlValue(Estableci) +
              '   AND re_tipo = ' + SqlValue(sTipo) +
              '   AND re_operativo = ' + SqlValue(sOperativoOrig) +
              '   AND re_cumplimiento <= ' + SqlDate(dFecha);

      if AreIn(sTipo, ['ET', 'EP']) then
        sConsultaRecomendaciones := sSql
      else
        sConsulta:=sConsulta+ sSql;
    end;
    sRazonSocial := ValorSql('SELECT em_nombre FROM afi.aem_empresa WHERE em_cuit = '+SqlValue(sCUIT));

    with GetQuery('SELECT art.afi.armar_domicilio(es_calle, es_numero, es_piso, '+
                  '       es_departamento, es_localidad) domicilio, es_localidad,es_nombre,'+
                  '       es_cpostala, (SELECT pv_descripcion FROM art.cpv_provincias '+
                  '       WHERE pv_codigo = es_provincia) provincia, '+
                  '       (SELECT st_actividad FROM cst_estableci, cpv_provincias '+
                  '       WHERE pv_codigo(+) = st_provincia AND st_cuit = '+SqlValue(sCUIT)+
                  '       AND st_clave = '+SqlValue(Estableci)+') actividad '+
                  '  FROM afi.aes_establecimiento '+
                  ' WHERE es_contrato = '+ SqlValue(sContrato)+
                  '   AND es_nroestableci = '+SqlValue(Estableci)) do
    try
      sDomicilioEstab := FieldByName('domicilio').AsString;
      sLocalidadEstab := FieldByName('es_localidad').AsString;
      sEstabDesc      := FieldByName('es_nombre').AsString;
      sCPA            := FieldByName('es_cpostala').AsString;
      sProvinciaEstab := FieldByName('provincia').AsString;
      sActividad      := FieldByName('actividad').AsString;
    finally
      Free;
    end;

    sCIIU := ValorSql('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                      '  FROM comunes.cac_actividad ' +
                      ' WHERE ac_codigo = ' + SqlValue(sActividad));
    // CIIU de la Empresa si no existe para el Estab.
    sCIIU := iif (sCIIU = '',
                  ValorSQL ('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                            '  FROM afi.aco_contrato, comunes.cac_actividad ' +
                            ' WHERE co_contrato = ' + SqlValue(sContrato) +
                            '   AND co_idactividad = ac_id '),
                  sCIIU);

    if cPAL then
      with TrptPal.Create(nil) do
      try
        if pPath = '' then
        begin
          VistaPrevia(sCUIT, sContrato, IntToStr(Estableci), sOperativoOrig,
                      sTipo, sRazonSocial,
                      sEstabDesc,
                      sContrato + ' - ' + IntToStr(Estableci),
                      sCIIU,
                      sDomicilioEstab,
                      sLocalidadEstab,
                      sCPA,
                      sProvinciaEstab,
                      ValorSQL ('SELECT DECODE(st_telefonos, ' +
                                '              NULL, mp_telefonos, ' +
                                '              ''S/D'', mp_telefonos, ' +
                                '              st_telefonos) ' +
                                '  FROM cmp_empresas, cst_estableci ' +
                                ' WHERE mp_cuit = st_cuit ' +
                                '   AND st_cuit = ' + SqlValue(sCUIT) +
                                '   AND st_clave = ' + IntToStr(Estableci) ),
                      ValorSQL ('SELECT dc_mail ' +
                                '  FROM afi.adc_domiciliocontrato ' +
                                ' WHERE ROWNUM = 1 ' +
                                '   AND dc_contrato = ' + SqlValue(sContrato)),
                      dFecha,'',PalVacio);
        end
        else
          ExportPdf(sCUIT, sContrato, IntToStr(Estableci), sOperativoOrig,
                      sTipo, sRazonSocial,
                      sEstabDesc,
                      sContrato + ' - ' + IntToStr(Estableci),
                      sCIIU,
                      sDomicilioEstab,
                      sLocalidadEstab,
                      sCPA,
                      sProvinciaEstab,
                      ValorSQL ('SELECT DECODE(st_telefonos, ' +
                                '              NULL, mp_telefonos, ' +
                                '              ''S/D'', mp_telefonos, ' +
                                '              st_telefonos) ' +
                                '  FROM cmp_empresas, cst_estableci ' +
                                ' WHERE mp_cuit = st_cuit ' +
                                '   AND st_cuit = ' + SqlValue(sCUIT) +
                                '   AND st_clave = ' + IntToStr(Estableci) ),
                      ValorSQL ('SELECT dc_mail ' +
                                '  FROM afi.adc_domiciliocontrato ' +
                                ' WHERE ROWNUM = 1 ' +
                                '   AND dc_contrato = ' + SqlValue(sContrato)),
                      dFecha,pPath, PalVacio);
      finally
        Free;
      end;

    // CIIU del Establecimiento

    if not AreIn(sTipo, ['ET', 'EP']) then
    begin
      sSql:=sConsulta;
      cantVistas := 1;
    end
    else
      cantVistas := 2;
    for i := 1 to cantVistas do
    begin
      if AreIn(sTipo, ['ET', 'EP']) and (i = 1) then
      begin
        sSql := sConsultaMedidas;
        cantCopias := 1;
      end
      else if AreIn(sTipo, ['ET', 'EP']) and (i = 2)then
      begin
        sSql := sConsultaRecomendaciones;
        cantCopias := 2;
      end
      else if AreIn(sTipo, ['GB', 'CO']) then
        cantCopias := 2;

      if not (sSql = '') then
      begin
        with TrptConstanciaVisitas.Create(nil) do
        try
          PRSPAPE :=  cPRSPAPE;
          Fecha := dFecha;
          Operativo := sOperativoOrig;
          Tipo := sTipo;
          NroEstablecimiento := IntToStr(Estableci);

          PrinterSettings.Copies := cantCopias;
          if pPath = '' then
          begin
            VistaPrevia(sSql,
                        sCUIT,
                        sRazonSocial,
                        sEstabDesc,
                        sContrato + ' - ' + IntToStr(Estableci),
                        sCIIU,
                        sDomicilioEstab,
                        sLocalidadEstab,
                        sCPA,
                        sProvinciaEstab,
                        ValorSQL ('SELECT DECODE(st_telefonos, ' +
                                  '              NULL, mp_telefonos, ' +
                                  '              ''S/D'', mp_telefonos, ' +
                                  '              st_telefonos) ' +
                                  '  FROM cmp_empresas, cst_estableci ' +
                                  ' WHERE mp_cuit = st_cuit ' +
                                  '   AND st_cuit = ' + SqlValue(sCUIT) +
                                  '   AND st_clave = ' + IntToStr(Estableci)),
                        ValorSQL ('SELECT dc_mail ' +
                                  '  FROM afi.adc_domiciliocontrato ' +
                                  ' WHERE ROWNUM = 1 ' +
                                  '   AND dc_contrato = ' + SqlValue(sContrato)),
                        ValorSQL ('SELECT DECODE(art.hys.get_tipo_empresa(' + SqlValue(sCUIT) + ', NULL, SYSDATE), ' +
                                  '              ''GB'', (SELECT ep_actividad ' +
                                  '                         FROM hys.hep_estabporpreventor ' +
                                  '                        WHERE ep_cuit = ' + SqlValue(sCUIT) +
                                  '                          AND ep_estableci = ' + IntToStr(Estableci) + '), ' +
                                  '              ''EP'', ''P'', ' +
                                  '              ''ET'', ''T'', ' +
                                  '              ''O'') ' +
                                  '  FROM DUAL '));
          end
          else
          begin
            ExportPDF(sSql,
                        sCUIT,
                        sRazonSocial,
                        sEstabDesc,
                        sContrato + ' - ' + IntToStr(Estableci),
                        sCIIU,
                        sDomicilioEstab,
                        sLocalidadEstab,
                        sCPA,
                        sProvinciaEstab,
                        ValorSQL ('SELECT DECODE(st_telefonos, ' +
                                  '              NULL, mp_telefonos, ' +
                                  '              ''S/D'', mp_telefonos, ' +
                                  '              st_telefonos) ' +
                                  '  FROM cmp_empresas, cst_estableci ' +
                                  ' WHERE mp_cuit = st_cuit ' +
                                  '   AND st_cuit = ' + SqlValue(sCUIT) +
                                  '   AND st_clave = ' + IntToStr(Estableci)),
                        ValorSQL ('SELECT dc_mail ' +
                                  '  FROM afi.adc_domiciliocontrato ' +
                                  ' WHERE ROWNUM = 1 ' +
                                  '   AND dc_contrato = ' + SqlValue(sContrato)),
                        ValorSQL ('SELECT DECODE(art.hys.get_tipo_empresa(' + SqlValue(sCUIT) + ', NULL, SYSDATE), ' +
                                  '              ''GB'', (SELECT ep_actividad ' +
                                  '                         FROM hys.hep_estabporpreventor ' +
                                  '                        WHERE ep_cuit = ' + SqlValue(sCUIT) +
                                  '                          AND ep_estableci = ' + IntToStr(Estableci) + '), ' +
                                  '              ''EP'', ''P'', ' +
                                  '              ''ET'', ''T'', ' +
                                  '              ''O'') ' +
                                  '  FROM DUAL '),pPath);
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure ArmarConstanciaVisitaVacia( sCUIT : String; Estableci : Integer; sTipo, sOperativoOrig : String; cMedidas, cPRSPAPE, cPAL : Boolean; dFecha : TDateTime; pPath : String = '' );
var
  sCIIU, sSql, sEstabDesc, sDomicilioEstab, sLocalidadEstab,
  sContrato, sRazonSocial, sCPA, sProvinciaEstab, sActividad : String;
begin
  sSql := 'select null nromedida, null item, null medida from dual where 1 = 2';
  sContrato := ValorSql('SELECT art.get_vultcontrato ('+SqlValue(sCUIT)+') FROM dual');
  sRazonSocial := ValorSql('SELECT em_nombre FROM afi.aem_empresa WHERE em_cuit = '+SqlValue(sCUIT));

  sCIIU := ValorSql('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                      '  FROM comunes.cac_actividad ' +
                      ' WHERE ac_codigo = ' + SqlValue(sActividad));
    // CIIU de la Empresa si no existe para el Estab.
    sCIIU := iif (sCIIU = '',
                  ValorSQL ('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                            '  FROM afi.aco_contrato, comunes.cac_actividad ' +
                            ' WHERE co_contrato = ' + SqlValue(sContrato) +
                            '   AND co_idactividad = ac_id '),
                  sCIIU);

  with GetQuery('SELECT art.afi.armar_domicilio(es_calle, es_numero, es_piso, '+
                  '       es_departamento, es_localidad) domicilio, es_localidad,es_nombre,'+
                  '       es_cpostala, (SELECT pv_descripcion FROM art.cpv_provincias '+
                  '       WHERE pv_codigo = es_provincia) provincia, '+
                  '       (SELECT st_actividad FROM cst_estableci, cpv_provincias '+
                  '       WHERE pv_codigo(+) = st_provincia AND st_cuit = '+SqlValue(sCUIT)+
                  '       AND st_clave = '+SqlValue(Estableci)+') actividad '+
                  '  FROM afi.aes_establecimiento '+
                  ' WHERE es_contrato = '+ SqlValue(sContrato)+
                  '   AND es_nroestableci = '+SqlValue(Estableci)) do
    try
      sDomicilioEstab := FieldByName('domicilio').AsString;
      sLocalidadEstab := FieldByName('es_localidad').AsString;
      sEstabDesc      := FieldByName('es_nombre').AsString;
      sCPA            := FieldByName('es_cpostala').AsString;
      sProvinciaEstab := FieldByName('provincia').AsString;
      sActividad      := FieldByName('actividad').AsString;
    finally
      Free;
    end;


  with TrptConstanciaVisitas.Create(nil) do
    try
      VistaPrevia(sSql,
                  sCUIT,
                  sRazonSocial,
                  sEstabDesc,
                  sContrato + ' - ' + IntToStr(Estableci),
                  sCIIU,
                  sDomicilioEstab,
                  sLocalidadEstab,
                  sCPA,
                  sProvinciaEstab,
                  ValorSQL ('SELECT DECODE(st_telefonos, ' +
                            '              NULL, mp_telefonos, ' +
                            '              ''S/D'', mp_telefonos, ' +
                            '              st_telefonos) ' +
                            '  FROM cmp_empresas, cst_estableci ' +
                            ' WHERE mp_cuit = st_cuit ' +
                            '   AND st_cuit = ' + SqlValue(sCUIT) +
                            '   AND st_clave = ' + IntToStr(Estableci)),
                  ValorSQL ('SELECT dc_mail ' +
                            '  FROM afi.adc_domiciliocontrato ' +
                            ' WHERE ROWNUM = 1 ' +
                            '   AND dc_contrato = ' + SqlValue(sContrato)),
                  ValorSQL ('SELECT DECODE(art.hys.get_tipo_empresa(' + SqlValue(sCUIT) + ', NULL, SYSDATE), ' +
                            '              ''GB'', (SELECT ep_actividad ' +
                            '                         FROM hys.hep_estabporpreventor ' +
                            '                        WHERE ep_cuit = ' + SqlValue(sCUIT) +
                            '                          AND ep_estableci = ' + IntToStr(Estableci) + '), ' +
                            '              ''EP'', ''P'', ' +
                            '              ''ET'', ''T'', ' +
                            '              ''O'') ' +
                            '  FROM DUAL '),pPath);
  finally
    Free;
  end;
end;

function ArmarPathRelev463(contrato : String; vigencia : String; estableci : Integer) : String;
var
  pathDestino : String;
  valorContrato : String;
  idestableci : String;
begin
  {$IFDEF SERVICE}
    pathDestino := 'Resolucion463\';
  {$ELSE}
    pathDestino := ValorSql(
    ' SELECT pa_valor '+
    '   FROM hys.hpa_parametro '+
    '  WHERE pa_clave = ''CARPETAREPORTES'' ');
  {$ENDIF}
  valorContrato := LPad(copy(contrato,Length(contrato)-2,3),'0',3);
  pathDestino := IncludeTrailingBackslash(pathDestino)+valorContrato+'\';
  idestableci := ValorSql(
    ' SELECT SUBSTR (es_id, LENGTH (es_id)) '+
    '   FROM afi.aes_establecimiento '+
    '  WHERE es_contrato = '+SqlValue(contrato)+
    '    AND es_nroestableci = '+SqlValue(estableci));
  pathDestino := pathDestino+idestableci+'\';
  {$IFNDEF SERVICE}
  ForceDirectories(pathDestino);
  {$ENDIF}
  Result := pathDestino;
end;

function ArmarPathAvisoObra(contrato : String; estableci : Integer) : String;
var
  pathDestino : String;
  valorContrato : String;
  idestableci : String;
begin
  pathDestino := ValorSql(
  ' SELECT pa_valor '+
  '   FROM hys.hpa_parametro '+
  '  WHERE pa_clave = ''CARPETAAVISOOBRA'' ');
  valorContrato := LPad(copy(contrato,Length(contrato)-2,3),'0',3);
  pathDestino := IncludeTrailingBackslash(pathDestino)+valorContrato+'\';
  idestableci := ValorSql(
    ' SELECT SUBSTR (es_id, LENGTH (es_id)) '+
    '   FROM afi.aes_establecimiento '+
    '  WHERE es_contrato = '+SqlValue(contrato)+
    '    AND es_nroestableci = '+SqlValue(estableci));
  pathDestino := pathDestino+idestableci+'\';
  Result := pathDestino;
end;

function GetVisitaCorrecta(aCuit: String; aEstableci: integer; aTipo: String;
  aOperativo: String; aRecomendacion: integer; aFecha: TDate; aVisita: String): String;
var
  ResultVisitaAnt: String;
begin
   ResultVisitaAnt := ValorSql( 'SELECT rv_tipo_visita ' +
                                'FROM art.prv_recvisitas ' +
                                'WHERE rv_cuit = ' + SqlValue(aCuit) +
                                'and rv_estableci = ' + SqlValue(aEstableci) +
                                'and rv_tipo = ' + SqlValue(aTipo) +
                                'and rv_operativo = ' + SqlValue(aOperativo) +
                                'and rv_recomendacion = ' + SqlValue(aRecomendacion) +
                                'and rv_fechabaja is null  ' +
                                'and rv_fecha = (SELECT MAX(rv_fecha)  ' +
                                                'FROM art.prv_recvisitas  ' +
                                                'WHERE rv_cuit = ' + SqlValue(aCuit) +
                                                'and rv_estableci = ' + SqlValue(aEstableci) +
                                                'and rv_tipo = ' + SqlValue(aTipo) +
                                                'and rv_operativo = ' + SqlValue(aOperativo) +
                                                'and rv_recomendacion = ' + SqlValue(aRecomendacion) +
                                                'and rv_fecha <> ' + SqlDate(aFecha) +
                                                'and rv_fechabaja is null)');


     if (aTipo = 'ET') then
     begin
       if (aVisita = 'C') then
       begin
         //SI VIENE UN CUMPLIMIENTO Y LA VISITA ANTERIOR ES UN SEGUIMIENTO, UN CUMPLIMIENTO O NO EXISTE
         //DE INSERTA UN SEGUIMIENTO
         //SINO SIGNINICA QUE EL ANTERIOR ES UN INCUMPLIMIENTO Y SE INSERTA EL CUMPLIMIENTO
         if (ResultVisitaAnt = 'S') or (ResultVisitaAnt = 'C') or (ResultVisitaAnt = '') then Result := 'S'
         else Result := 'C';
       //SI VIENE UN INCUMPLIMIENTO SE INSERTA DIRECTAMENTE
       end
       else Result := aVisita;
     end
     else
       if (aTipo = 'EP') then
       begin
         if (aVisita = 'C') then
         begin
            //SI VIENE UN CUMPLIMIENTO Y LA VISITA ANTERIOR ES UN INCUMPLIMIENTO O NO EXISTE,
            //  SE INSERTA UN CUMPLIMIENTO
            //SINO SIGNINICA QUE EL ANTERIOR ES UN INCUMPLIMIENTO o CUMPLIMIENTO TARDIO
            //  y SE INSERTA EL CUMPLIMIENTO TARDIO
             if (ResultVisitaAnt = 'V') or (ResultVisitaAnt = 'T') or (ResultVisitaAnt = '') then Result := 'V'
             else Result := 'T';
          //SI VIENE UN INCUMPLIMIENTO SE INSERTA DIRECTAMENTE
         end
         else Result := aVisita;
       end
       //SINO ES PyME ni TESTIGO,  DEJO LO QUE VIENE
       else Result := aVisita;
end;

procedure guardarSeguimientoAccidente (modoAlta : Boolean; pMC_ID : Integer; tipoAccidente : String; fecha : TDate; id : Integer = 0);
begin
  if modoAlta then
  begin
    EjecutarSQL(' INSERT INTO HYS.PSV_SEGUIMIENTOVISITA(SV_ID, SV_IDMEDIDACORRECTIVA, SV_TIPO, SV_FECHA, SV_USUALTA, SV_FECHAALTA) '+
                '      VALUES('+sqlvalue(GetSecNextVal('HYS.SEQ_PSV_ID'))+','+ SqlValue(pMC_ID)+','+SqlValue(tipoAccidente)+','+SqlDate(fecha)+','+
                              SqlValue(Sesion.UserID)+', SYSDATE)' );
  end
  else
  begin
    EjecutarSQL(' UPDATE HYS.PSV_SEGUIMIENTOVISITA '+
                '    SET SV_TIPO = '+SqlValue(tipoAccidente)  +','+
                '        SV_FECHA = '+SqlDate(fecha)+','+
                '        SV_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                '        SV_FECHAMODIF = sysdate'+
                '  WHERE SV_ID = '+SqlValue(id));
  end;
end;

procedure guardarSeguimientoEnfermedad (modoAlta : Boolean; pMC_ID : Integer; tipoEnfermedad : String; fecha : TDate; id : Integer = 0);
begin
  if modoAlta then
  begin
    EjecutarSQL(' INSERT INTO HYS.PSV_SEGUIMIENTOVISITAENF(SV_ID, SV_IDMEDIDACORRECTIVA, SV_TIPO, SV_FECHA, SV_USUALTA, SV_FECHAALTA) '+
                '      VALUES('+sqlvalue(GetSecNextVal('HYS.SEQ_PSV_ID'))+','+ SqlValue(pMC_ID)+','+SqlValue(tipoEnfermedad)+','+SqlDate(fecha)+','+
                              SqlValue(Sesion.UserID)+', SYSDATE)' );
  end
  else
  begin
    EjecutarSQL(' UPDATE HYS.PSV_SEGUIMIENTOVISITAENF '+
                '    SET SV_TIPO = '+SqlValue(tipoEnfermedad)  +','+
                '        SV_FECHA = '+SqlDate(fecha)+','+
                '        SV_USUMODIF = '+SqlValue(Sesion.UserID)+', '+
                '        SV_FECHAMODIF = sysdate'+
                '  WHERE SV_ID = '+SqlValue(id));
  end;
end;

end.
