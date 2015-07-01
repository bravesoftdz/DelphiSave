unit unSiniestros;

interface

uses
  unArt, SysUtils, DateTimeEditors, AnsiSql, SqlFuncs, unTercerizadoras;

const
  { Tipos de Accidentes en Siniestros }
  TA_LUGARDETRABAJO = '1'; {Lugar De Trabajo}
  TA_INITINERE = '2';      {In Itinere}
  TA_ENFERMEDAD = '3';     {Enfermedad Profesional}
  COD_DIGITALIZA_DNI       = 'P31';  // TK 19977
  COD_DIGITALIZA_RECSUELDO = 'P49';  // TK 19977
  COD_DIGITALIZA_PME       = 'PME';  // TK 29564 (Parte Medico de Egreso)
  COD_DIGITALIZA_PMI       = 'PMI';  // TK 29564 (Parte Medico de Ingreso)
  COD_DIGITALIZA_PRQ       = 'PRQ';  // TK 29564 (Protocolo Quirúrgico)

  { Estados de los siniestros }
  SIEST_SUSPPLAZOS = '02';

type
  TTimeEditorMsk = class(TTimeEditor)
  public
    property EditMask;
  end;


function GetMensajeEstadoEmpresa(ASiniestro, AOrden, ARecaida: Integer): String;
function GetMensajeEstadoEmpresaConContrato(sContrato:TTableID): String;  // TK 46381
function GetMinFechaLiquidacionILT(Siniestro, Orden, Recaida: Integer): TDateTime;
function HasRecaidasAnterioresRechazadas(ASiniestro, AOrden, ARecaida: Integer): Boolean;
function IsTrabajadorDeclarado(ASiniestro, AOrden, ARecaida: Integer): Boolean;
function TieneMultiplesOrdenes(ASiniestro, AOrden: Integer): Boolean;
function TieneMultiplesRecaidas(ASiniestro, AOrden, ARecaida: Integer): Boolean;
function GetFechaInicioILT(iSiniestro, iOrden: Integer; iRecaida: Integer = 0): TDateTime;
function Es_FranquiciaCeroEspecial(iSiniestro, iOrden, iRecaida: integer): boolean;
function Siniestro_EsDentroAnioILT(iSiniestro, iOrden: Integer): Boolean;
function ValidarSiniestroUsuarioTerce(iSiniestro, iOrden, iRecaida: Integer): Boolean; // Por plan Tercerizadoras (Ioma)


procedure DecodeIdSiniestro(const AIdSiniestro: TTableId; var ASiniestro, AOrden, ARecaida: Integer);

{Inserta un nuevo registro en la tabla de evolución de estados del siniestro
 (SES_ESTADOSSINIESTROS)}
procedure InsertarReg_EstadoSiniestro (const Siniestro, Orden, Recaida: Integer;
                                       const CodEstado, Observaciones, CodCausaFin: String;
                                       const dFechaFin: TDateTime;
                                       const SiniestroTr, OrdenTr, RecaidaTr: Integer;
                                       const ConTrans: Boolean);

{Actualiza el histórico con los cambios de oms-cie10 por hipoacusia}
procedure Actualizar_Historico_FondoHipoacusia(const Siniestro, Orden, Recaida: Integer;
                                               const OMSCIE10: string; const ConTrans: Boolean);

function Get_IdExpediente(const Siniestro, Orden, Recaida: Integer): Integer;
function Get_TipoAccidenteRecaidaAnterior(const Siniestro, Orden, Recaida: Integer): String;

procedure Grabar_RegAuditLog(const Opcion, Accion, Observacion: String; const ConTrans: Boolean);

procedure Grabar_RegAuditLog_Completo(const Siniestro, Orden, Recaida: Integer; const Opcion, Accion: String;
                                      const ParteNro: Integer; const CIE10, Gravedad, Tipo, PRecupero, PRechazo, SPlazo,
                                      PIncapacidad: String; const ConTrans: Boolean);

{Dado un nro. de siniestro + orden + recaida, actualiza el campo EX_GTRABAJO en
 la tabla SEX_EXPEDIENTES, correpondiente al grupo de trabajo}
procedure Actualizar_GrupoDeTrabajo (const IdExpediente: Integer; ConTrans: Boolean);

procedure GrabarHistoricoSector(const IdExpediente: Integer; ConTrans: Boolean);

procedure Obtener_Proximos_Datos(const nTipoSiniestro: Integer; const dFecha: TDateTime;
                                 var dFechaAcc, dFechaRec: TDateTime; var nSiniestro, nOrden, nRecaida: TTableID;
                                 const CUIT: String);

{Devuelve para el siniestro la mínima fecha hasta de liquidación de ILT}
function Obtener_MinFechaLiquidacionILT(IdExpediente: Integer): TDateTime;

{Devuelve para el siniestro la máxima fecha hasta de liquidación de ILT}
function Obtener_MaxFechaLiquidacionILT(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;

{ Devuelve verdadero si tiene algun Parte de Egreso con Control Post-Alta }
function Is_PEgresoControlPostAlta(ASiniestro, AOrden: TTableID): Boolean;

{ Devuelve verdadero si tiene algun siniestro con grupo de trabajo PAT-CRON }
function Is_SiniestroPatologiaCronica(ASiniestro, AOrden: TTableID): Boolean;

{ Devuelve verdadero si tiene alguna Recaídas anteriores sin fecha de alta médica}
function Is_RecaidasSinAlta(ASiniestro, AOrden: TTableID): Boolean;

function  Obtener_MaxSiniestro(const CUIT: String; const Fecha: TDateTime): TTableID;

function  Calcular_Dias(const dFecha1, dFecha2: TDateTime; const AMaximo: Integer): Integer;

function  GetAnioFromDenunciaSRT(ANroDenuncia: String): Integer;

function  GetNumeroFromDenunciaSRT(ANroDenuncia: String): Integer;

function Is_RelacionLaboralActual_o_Historica(ACUIT, ACUIL: String): Boolean;

function Is_ExisteSiniestro(ACUIT, ACUIL: String; AFecha: TDateTime; IdExpediente: TTableID = 0): Boolean;

function Is_TrabajadorCorrecto(aCuil: String): Boolean;

function Get_FechaAltaRecalificacion(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;

function Get_MinFechaRecaida_x_Recaida(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;

function Get_MaxFechaAltaMedica_x_Recaida(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;

function Get_FechaInculpable(AIdExpediente: TTableID): TDateTime;

function Is_SiniestroCerrado_x_ErroDeCarga(IdExpediente: TTableID): Boolean;

{ Evalúa el contenido del n° de denuncia SRT }
function Is_DenunciaSRT_Valida(ATexto: String): Boolean;

{ Emprolija el formato del campo n° de denuncia SRT }
function Get_DenunciaSRT(ATexto: String): String;

{ determina si hubo cambios en la tabla de evolución de estados del siniestro (ses_EstadosSiniestros) }
function CambiosReg_EstadoSiniestro(Siniestro, Orden, Recaida: Integer; CodEstado, Observaciones, CodCausaFin: String; FechaFin: TDateTime): Boolean;

function Is_EmpresaConTopeAMPO(CUIT, Periodo: String): Boolean;

function Get_TopeAmpo(Periodo: String): Currency;

function Get_TopeIBDSiniestro(Siniestro, Orden, Recaida: Integer): Currency;

function Get_DescripcionOSocial(OSocial: String): String;
function Get_DescripcionJubilacion(AFJP: String): String;

function Get_SiniestroPosibleRecupero(Cuil: String; IdSiniestro: TTableId = 0; Destinatario: String = ''): String;
procedure MsgSiniestroPosibleRecupero(Cuil: String; IdSiniestro: TTableId = 0; Destinatario: String = '');

function GetProxPagoSPR(iSiniestro, iOrden, iRecaida: Integer) :Integer;

function Is_SiniestroMixto(iIdExpediente: Integer): Boolean;       // TK 18603
function Is_SinPMEAbandonoMixto(iIdExpediente: Integer): Boolean;  // TK 18603

function Get_ExisteSiniestro(iSiniestro, iOrden, iRecaida: Integer; bTercerizado: Boolean): String;

function Is_UsuarioSML(sIdUsuario: String): Boolean;                       // Por Plan SML
function Is_SiniestroSML(iIdExpediente: Integer): Boolean;                 // Por Plan SML
function Validar_SML(sIdUsuario: String; iIdExpediente: Integer): Boolean; // Por Plan SML

procedure Do_CopiarFechaBajaMedica(iID, iIdExpediente: integer; dFechaBajaMedica, dFechaRecepcion, dFechaAltaMedica: TDateTime);    // TK 43664
function Validar_CopiarFechaBajaMedica(dFechaBajaMedica, dFechaAltaMedica: TDateTime; iIdExpediente: integer): boolean;

function Get_NombreTrabajador(Siniestro, Orden, Recaida: Integer): String;

function SiniTieneRecaidas(iSiniestro:integer):boolean;   // por ticket 61569
function GetIsExtensionILT(iIdExped:integer):Boolean;  // Plan Extensión de ILT
function ExisteRelaLugarTrabajo(iIdTrabajador: integer): Boolean; // Por ticket 64558

implementation

uses
  unDmPrincipal, unComunes, unSesion, General, DateUtils, DateTimeFuncs, CUIT, periodo, CustomDlgs, Windows, StrFuncs;

procedure DecodeIdSiniestro(const AIdSiniestro: TTableId; var ASiniestro, AOrden, ARecaida: Integer);
begin
  with GetQueryEx('SELECT ex_siniestro, ex_orden, ex_recaida' +
                   ' FROM sex_expedientes' +
                  ' WHERE ex_id = :id', [AIdSiniestro]) do
  try
    if IsEmpty then
    begin
      ASiniestro := ART_EMPTY_ID;
      AOrden     := ART_EMPTY_ID;
      ARecaida   := ART_EMPTY_ID;
    end
    else
    begin
      ASiniestro := Fields[0].AsInteger;
      AOrden     := Fields[1].AsInteger;
      ARecaida   := Fields[2].AsInteger;
    end;
  finally
    Free;
  end;
end;

function IsTrabajadorDeclarado(ASiniestro, AOrden, ARecaida: Integer): Boolean;
var
  sPeriodo: String;
  sSql: String;
  sSuss: String;
begin
  sSql :=
    'SELECT ex_cuit, ex_cuil,' +
          ' art.afiliacion.get_sussvigente(afiliacion.get_contratovigente(ex_cuit, TO_CHAR(ex_fechaaccidente, ''YYYYMM'')),' +
                                         ' TO_CHAR(ex_fechaaccidente, ''YYYYMM'')) suss,' +
          ' TO_CHAR(ex_fechaaccidente, ''YYYYMM'') periodo, art.nomina.get_ultperiodonomina ultperiodonomina' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_recaida = :recaida';

  with GetQueryEx(sSql, [ASiniestro, AOrden, ARecaida]) do
  try
    if not IsEmpty then
    begin
      sSuss    := FieldByName('suss').AsString;
      sPeriodo := FieldByName('periodo').AsString;

      if (sSuss = '1') and (sPeriodo <= FieldByName('ultperiodonomina').AsString) then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM znr_nomrec' +
          ' WHERE nr_cuit = :cuit' +
            ' AND nr_cuil = :cuil' +
            ' AND nr_period = :period';
        Result := ExisteSqlEx(sSQL, [FieldByName('ex_cuit').AsString,
                                     FieldByName('ex_cuil').AsString,
                                     FieldByName('periodo').AsString]);
      end
      else
        Result := True;
      end
    else
      Result := False;
  finally
    Free;
  end;
end;

function GetMensajeEstadoEmpresa(ASiniestro, AOrden, ARecaida: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT art.afiliacion.msg_cobertura(ex_cuit, ex_fechaaccidente)' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_recaida = :recaida';
  Result := Trim(ValorSqlEx(sSql, [ASiniestro, AOrden, ARecaida]));
end;

function GetMensajeEstadoEmpresaConContrato(sContrato:TTableID): String;  // TK 46381
var sSql: String;
begin
  sSql   := ' SELECT art.afiliacion.msg_cobertura_periodo(' + SqlValue(sContrato) +') FROM DUAL';
  Result := Trim(ValorSql(sSql));
end;

function HasRecaidasAnterioresRechazadas(ASiniestro, AOrden, ARecaida: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_recaida < :recaida' +
      ' AND ex_causafin = :causafin' +
      ' AND ex_estado = :estado';
  Result := ExisteSqlEx(sSql, [ASiniestro, AOrden, ARecaida, '02', '03'])
end;

function GetMinFechaLiquidacionILT(Siniestro, Orden, Recaida: Integer): TDateTime;
var
  dMinFechaDesdeLiquidacionILT: TDateTime;
  dMinFechaLiq: TDateTime;
  iDiasFranquicia: Integer;
  sSql: String;
begin
  {
  Devuelve para el siniestro la mímina fecha desde de liquidación de ILT, menos
  los días de franquicia correspondientes
  }

  if Recaida = 0 then
  begin
    sSql :=
      'SELECT art.afiliacion.get_franquicia(afiliacion.get_contratovigente(ex_cuit, TO_CHAR(ex_fechaaccidente, ''YYYYMM'')),' +
                                          ' ex_fechaaccidente)' +
       ' FROM sex_expedientes' +
      ' WHERE ex_siniestro = :siniestro' +
        ' AND ex_orden = :orden' +
        ' AND ex_recaida = :recaida';
    iDiasFranquicia := ValorSqlEx(sSql, [Siniestro, Orden, Recaida]);
  end
  else
    iDiasFranquicia := 0;

  sSql :=
    'SELECT MIN(le_fechades)' +
     ' FROM sle_liquiempsin' +
    ' WHERE le_siniestro = :siniestro' +
      ' AND le_orden = :orden' +
      ' AND le_recaida = :recaida' +
      ' AND le_conpago IN(:v4, :v5)' +
      ' AND le_imporperi > 0' +
      ' AND NVL(le_estado, '' '') NOT IN(''A'', ''X'')';
  dMinFechaLiq := ValorSqlDateTimeEx(sSql, [Siniestro, Orden, Recaida, CONCEPTO_ILT_REINTEGRO, CONCEPTO_ILT_PAGODIRECTO]);

  if dMinFechaLiq = 0 then
    dMinFechaDesdeLiquidacionILT := 0
  else
    dMinFechaDesdeLiquidacionILT := dMinFechaLiq - iDiasFranquicia;

  Result := dMinFechaDesdeLiquidacionILT;
end;

procedure GrabarHistoricoSector(const IdExpediente: Integer; ConTrans: Boolean);
begin
  if ConTrans then
    EjecutarStoreEx('art.siniestro.do_grabarhistoricosector(:v1, :v2, :v3);', [IdExpediente, Sesion.Sector, Sesion.UserID])
  else
    EjecutarStoreSTEx('art.siniestro.do_grabarhistoricosector(:v1, :v2, :v3);', [IdExpediente, Sesion.Sector, Sesion.UserID])
{
  with TSQL.Create('SRE_REASIGNACION') do
  try
    Fields.Add('RE_SINIESTRO' , Siniestro);
    Fields.Add('RE_ORDEN'     , Orden);
    Fields.Add('RE_RECAIDA'   , Recaida);
    Fields.Add('RE_SECTOR'    , Sesion.Sector);
    Fields.Add('RE_USUALTA'   , Sesion.UserID);
    Fields.Add('RE_FECHAALTA' , exDateTime);

    if ConTrans then
      EjecutarSQL(InsertSql)
    else
      EjecutarSQLST(InsertSql);
  finally
    Free;
  end;
}
end;

procedure Actualizar_GrupoDeTrabajo(const IdExpediente: Integer; ConTrans: Boolean);
{
var
  sSQL, sValorCampo: string;
}  
begin
  if ConTrans then
    EjecutarStoreEx('art.siniestro.set_gtrabajo(:v1);', [IdExpediente])
  else
    EjecutarStoreSTEx('art.siniestro.set_gtrabajo(:v1);', [IdExpediente]);
{
  sSQL := 'SELECT ART.AMEBPBA.GET_GTRABAJO (:SINIESTRO, :ORDEN, :RECAIDA) FROM DUAL';
  sValorCampo := ValorSQLEx(sSQL, [Siniestro, Orden, Recaida]);

  with TSQL.Create('SEX_EXPEDIENTES') do
  try
    Fields.Add('EX_GTRABAJO'      , sValorCampo);
    PrimaryKey.Add('EX_SINIESTRO' , Siniestro);
    PrimaryKey.Add('EX_ORDEN'     , Orden);
    PrimaryKey.Add('EX_RECAIDA'   , Recaida);

    if ConTrans then
      EjecutarSQL(UpdateSql)
    else
      EjecutarSQLST(UpdateSql);
  finally
    Free;
  end;
}  
end;

procedure InsertarReg_EstadoSiniestro (const Siniestro, Orden, Recaida: Integer;
                                       const CodEstado, Observaciones, CodCausaFin: String;
                                       const dFechaFin: TDateTime;
                                       const SiniestroTr, OrdenTr, RecaidaTr: Integer;
                                       const ConTrans: Boolean);
{var
  Dim Fields As String, Values As String
  Dim SQL As String
}
begin
  with TSql.Create('ses_estadossiniestros') do
  try
    Fields.Add('es_siniestro'    , Siniestro);
    Fields.Add('es_orden'        , Orden);
    Fields.Add('es_recaida'      , Recaida);
    Fields.Add('es_estado'       , CodEstado);
    Fields.Add('es_observaciones', Observaciones);
    Fields.Add('es_causafin'     , CodCausaFin);

    Fields.AddDate('es_fechafin',  dFechaFin, True);

    Fields.Add('es_usualta',       Sesion.UserID);
    Fields.Add('es_fechaalta',     exDate);

    Fields.Add('es_siniestrotras', SiniestroTr, True);
    Fields.Add('es_ordentras',     OrdenTr, True);
    Fields.Add('es_recaidatras',   RecaidaTr, True);

    if ConTrans then
      EjecutarSql(InsertSql)
    else
      EjecutarSqlST(InsertSql);
  finally
    Free;
  end;
end;

procedure Actualizar_Historico_FondoHipoacusia(const Siniestro, Orden, Recaida: Integer;
                                               const OMSCIE10: String; const ConTrans: Boolean);
var
  sSql: String;
begin
  sSql := 'art.SIN.act_historico_fondo_siniestros(:siniestro, :orden, :recaida, :dx);';

  if ConTrans then
    EjecutarStoreEx(sSql, [Siniestro, Orden, Recaida, OMSCIE10])
  else
    EjecutarStoreSTEx(sSql, [Siniestro, Orden, Recaida, OMSCIE10]);
end;

function Get_IdExpediente(const Siniestro, Orden, Recaida: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT ex_id' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_recaida = :recaida';
  Result := ValorSqlIntegerEx(sSql, [Siniestro, Orden, Recaida]);
end;

function Get_TipoAccidenteRecaidaAnterior(const Siniestro, Orden, Recaida: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT   ex_tipo' +
       ' FROM sex_expedientes' +
      ' WHERE ex_siniestro = :siniestro' +
        ' AND ex_orden = :orden' +
        ' AND ex_recaida <= :recaida' +
        ' AND ex_tipo IS NOT NULL' +
        ' AND ex_tipo <> '' ''' +
        ' AND NVL(ex_causafin, '' '') NOT IN(''95'', ''99'')' +
   ' ORDER BY ex_recaida DESC';
  Result := ValorSqlEx(sSql, [Siniestro, Orden, Recaida - 1]);
end;

procedure Grabar_RegAuditLog_Completo(const Siniestro, Orden, Recaida: Integer;
                                      const Opcion, Accion: String; const ParteNro: Integer; const CIE10, Gravedad, Tipo,
                                      PRecupero, PRechazo, SPlazo, PIncapacidad: String; const ConTrans: Boolean);
var
  nIdExpediente: TTableID;
  sModulo: String;
  sSql: String;
begin
  sModulo := UpperCase(ChangeFileExt(GetAppInfo('OriginalFilename'), ''));
  nIdExpediente := Get_IdExpediente(Siniestro, Orden, Recaida);

  sSql :=
    'art.siniestro.do_regauditlog_completo(:p_idexpediente, :p_modulo, :p_opcion, :p_accion, :p_usuario, :p_partenro,' +
                                         ' :p_cie10, :p_gravedad, :p_tipo, :p_precupero, :p_prechazo, :p_splazo,' +
                                         ' :p_pincapacidad);';

  if ConTrans then
    EjecutarStoreEx(sSql, [nIdExpediente, sModulo, Opcion, Accion, Sesion.UserID, ParteNro, CIE10, Gravedad, Tipo,
                           PRecupero, PRechazo, SPlazo, PIncapacidad])
  else
    EjecutarStoreSTEx(sSql, [nIdExpediente, sModulo, Opcion, Accion, Sesion.UserID, ParteNro, CIE10, Gravedad, Tipo,
                             PRecupero, PRechazo, SPlazo, PIncapacidad]);
end;

{Calcula los próximos valores (fecha accid., fecha rec., nro. sin/ord/rec) para el nuevo siniestro}

procedure Obtener_Proximos_Datos(const nTipoSiniestro: Integer; const dFecha: TDateTime;
                                 var dFechaAcc, dFechaRec: TDateTime;
                                 var nSiniestro, nOrden, nRecaida: TTableID;
                                 const CUIT: String);
var
  nMaxSiniestro: Integer;
  nMaxRecaida: Integer;
  nMaxOrden: Integer;
  sSql: String;
begin
  case nTipoSiniestro of
    0:
    begin // Siniestro
      nMaxSiniestro := Obtener_MaxSiniestro(CUIT, dFecha) + 1;
      dFechaAcc     := dFecha;
      dFechaRec     := 0;
      nSiniestro    := nMaxSiniestro;
      nOrden        := 1;
      nRecaida      := 0;
    end;
    1:
    begin // Siniestro múltiple
      sSql :=
        'SELECT MAX(ex_orden)' +
         ' FROM sex_expedientes' +
        ' WHERE ex_siniestro = :siniestro';
      nMaxOrden := ValorSqlEx(sSql, [nSiniestro]) + 1;

      dFechaAcc  := dFecha;
      dFechaRec  := 0;
      nSiniestro := nSiniestro;
      nOrden     := nMaxOrden;
      nRecaida   := 0;
    end;
    2:
    begin  // Recaida
      sSql :=
        'SELECT MAX(ex_recaida)' +
         ' FROM sex_expedientes' +
        ' WHERE ex_siniestro = :siniestro' +
          ' AND ex_orden = :orden';
      nMaxRecaida := ValorSqlEx(sSql, [nSiniestro, nOrden]) + 1;

      //Mantiene la fecha del accidente
      sSql :=
        'SELECT ex_fechaaccidente' +
         ' FROM sex_expedientes' +
        ' WHERE ex_siniestro = :siniestro' +
          ' AND ex_orden = :orden' +
          ' AND ex_recaida = 0';
      dFechaAcc := ValorSqlDateTimeEx(sSql, [nSiniestro, nOrden]);

      dFechaRec  := dFecha;
      nSiniestro := nSiniestro;
      nOrden     := nOrden;
      nRecaida   := nMaxRecaida;
    end;
  end;
end;

function Obtener_MinFechaLiquidacionILT(IdExpediente: Integer): TDateTime;
begin
  Result := ValorSqlDateTimeEx('SELECT dinerarias.get_minfechaliquidacionilt(:id) FROM DUAL', [IdExpediente]);
end;

function Obtener_MaxFechaLiquidacionILT(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;
begin
  Result := ValorSqlDateTimeEx('SELECT dinerarias.get_maxfechahastaliqilt(:SIN, :ord, :rec) FROM DUAL', [ASiniestro, AOrden, ARecaida]);
end;

function Obtener_MaxSiniestro(const CUIT: String; const Fecha: TDateTime): TTableID;
var
  sComp: String;
begin
  if CUIT = EmptyStr then
    Result := ValorSqlInteger('SELECT MAX(ex_siniestro) FROM sex_expedientes')
  else
  begin
    if ValorSqlEx('SELECT art.siniestro.is_nroexpediente(:cuit, :fecha) FROM DUAL', [CUIT, TDateTimeEx.Create(Fecha)]) = 'N' then
      sComp := '<'
    else
      sComp := '>';

    Result := ValorSqlInteger('SELECT NVL(MAX(ex_siniestro), 5000000) FROM sex_expedientes WHERE ex_siniestro' + sComp + ' 5000000');
  end;
end;

function Calcular_Dias(const dFecha1, dFecha2: TDateTime; const AMaximo: Integer): Integer;
var
  nDiferencia: Integer;
begin
  if (dFecha1 > 0) and (dFecha2 > 0) then
  begin
    if dFecha2 >= dFecha1 then
    begin
      nDiferencia := Round(dFecha2) - Round(dFecha1) + 1;

      if nDiferencia <= AMaximo then
        Result := nDiferencia
      else
        Result := 0;
    end
    else
      Result := 0;
  end
  else
    Result := 0;
end;

function Is_PEgresoControlPostAlta(ASiniestro, AOrden: TTableID): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM SIN.spe_partedeegreso, sex_expedientes EXP, SIN.stt_tipotratamiento' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_id = pe_idexpediente' +
      ' AND pe_idtipotratamiento = tt_id' +
      ' AND tt_postalta = ''S''' +
      ' AND ex_recaida = (SELECT MAX(ex_recaida)' +
                          ' FROM sex_expedientes ult' +
                         ' WHERE ult.ex_siniestro = EXP.ex_siniestro' +
                           ' AND ult.ex_orden = EXP.ex_orden' +
                           ' AND NVL(ult.ex_causafin, '' '') NOT IN(''02'', ''95'', ''99''))';
  Result := ExisteSqlEx(sSql, [ASiniestro, AOrden]);
end;

function Is_SiniestroPatologiaCronica(ASiniestro, AOrden: TTableID): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes, mgp_gtrabajo' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_gtrabajo = gp_codigo' +
      ' AND gp_nombre = :nombre';
  Result := ExisteSqlEx(sSql, [ASiniestro, AOrden, 'PAT-CRON']);
end;

function Is_RecaidasSinAlta(ASiniestro, AOrden: TTableID): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND NVL(ex_causafin, '' '') NOT IN(''02'', ''95'', ''99'')' +
      ' AND ex_altamedica IS NULL';
  Result := ExisteSqlEx(sSql, [ASiniestro, AOrden]);
end;

function GetAnioFromDenunciaSRT(ANroDenuncia: String): Integer;
begin
  ANroDenuncia := StringReplace(ANroDenuncia, ' ', '', [rfReplaceAll]);
  ANroDenuncia := StringReplace(ANroDenuncia, '_', '', [rfReplaceAll]);

  Result := StrToIntDef(Copy(ANroDenuncia, Pos('/', ANroDenuncia) + 1, MaxInt), 0);
  if (Result > 0) and ((Result < YearOf(ART_MINFECHA)) or (Result > YearOf(DBDate))) then
    Result := -1;
end;

function GetNumeroFromDenunciaSRT(ANroDenuncia: String): Integer;
begin
  ANroDenuncia := StringReplace(ANroDenuncia, ' ', '', [rfReplaceAll]);
  ANroDenuncia := StringReplace(ANroDenuncia, '_', '', [rfReplaceAll]);
  Result := StrToIntDef(Copy(ANroDenuncia, 0, Pos('/', ANroDenuncia) - 1), 0);
end;

function TieneMultiplesOrdenes(ASiniestro, AOrden: Integer): Boolean;
begin
  Result := (AOrden > 1) or ExisteSqlEx('SELECT 1' +
                                         ' FROM sex_expedientes' +
                                        ' WHERE ex_siniestro = :siniestro' +
                                          ' AND ex_orden > 1', [ASiniestro]);
end;

function TieneMultiplesRecaidas(ASiniestro, AOrden, ARecaida: Integer): Boolean;
begin
  Result := (ARecaida > 0) or ExisteSqlEx('SELECT 1' +
                                           ' FROM sex_expedientes' +
                                          ' WHERE ex_siniestro = :siniestro' +
                                            ' AND ex_orden = :orden' +
                                            ' AND ex_recaida > 0', [ASiniestro, AOrden]);
end;

function Is_RelacionLaboralActual_o_Historica(ACUIT, ACUIL: String): Boolean;
begin
  Result := ExisteSqlEx('SELECT 1' +
                         ' FROM crl_relacionlaboral, ctj_trabajador, aem_empresa' +
                        ' WHERE rl_idtrabajador = tj_id' +
                          ' AND rl_id = art.get_vidcrlultcontratotrab(em_cuit, tj_cuil)' +
                          ' AND em_cuit = :cuit' +
                          ' AND tj_cuil = :cuil' +
                       ' UNION ' +
                       ' SELECT 1' +
                         ' FROM chl_historicolaboral, ctj_trabajador, aco_contrato, aem_empresa' +
                        ' WHERE hl_idtrabajador = tj_id' +
                          ' AND hl_contrato = co_contrato' +
                          ' AND co_idempresa = em_id' +
                          ' AND em_cuit = :cuit' +
                          ' AND tj_cuil = :cuil', [ACUIT, ACUIL, ACUIT, ACUIL]);
end;

function Is_ExisteSiniestro(ACUIT, ACUIL: String; AFecha: TDateTime; IdExpediente: TTableID = 0): Boolean;
var
  sSql: String;
begin
  // Válido que el Cuit, Nro. de doc. del trabajador y f. de accidente no existan
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_cuit = :cuit' +
      ' AND SUBSTR(ex_cuil, 3, 8) = :documento' +
      ' AND ex_fechaaccidente = :fechaaccidente' +
      ' AND NVL(ex_causafin, ''0'') NOT IN(''95'', ''99'')' +
      ' AND ex_recaida = 0' +
      ' AND ex_id <> :id' +
      ' AND NVL(ex_diagnosticooms, '' '') <> ''H83.3''';    // por ticket
  Result := ExisteSqlEx(sSql, [ACUIT, GetDNI(ACUIL), TDateTimeEx.Create(AFecha), IdExpediente])
end;

function Is_TrabajadorCorrecto(aCuil: String): Boolean;
var
  sSql: String;
begin
  Result := True;

  if Copy(aCuil, 1, 2) = '96' then
  begin
    sSql :=
      'SELECT tj_cuil' +
       ' FROM ctj_trabajador' +
      ' WHERE tj_documento = :documento';
    with GetQueryEx(sSQL, [GetDNI(aCuil)]) do
      while not Eof do
      begin
        if Copy(FieldByName('tj_cuil').AsString, 1, 2) <> '96' then
        begin
          Result := False;
          Exit;
        end;

        Next;
      end;
  end;
end;

function Get_FechaAltaRecalificacion(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;
var
  sSql: String;
begin
  sSql :=
    'SELECT er_fecha' +
     ' FROM art.ser_evemedrecalif' +
    ' WHERE er_siniestro = :siniestro' +
      ' AND er_orden = :orden' +
      ' AND er_reca_evo = :reca_evo' +
      ' AND er_codigo IN(''093'', ''095'')' +
      ' AND er_evento > 0';
  Result := ValorSqlDateTimeEx(sSql, [ASiniestro, AOrden, ARecaida]);
end;

function Get_MinFechaRecaida_x_Recaida(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;
var
  sSql: String;
begin
  sSql :=
    'SELECT NVL(MIN(ex_fecharecaida), art.actualdate)' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_recaida >=(:recaida + 1)' +
      ' AND NVL(ex_causafin, '' '') NOT IN(''95'', ''99'')' +
      ' AND ex_intercurrencia <> ''S''';
  Result := ValorSqlDateTimeEx(sSql, [ASiniestro, AOrden, ARecaida]);
end;

function Get_MaxFechaAltaMedica_x_Recaida(ASiniestro, AOrden, ARecaida: TTableID): TDateTime;
var
  sSql: String;
begin
  sSql :=
    'SELECT MAX(pe_fechaaltalaboral)' +
     ' FROM sex_expedientes, SIN.spe_partedeegreso' +
    ' WHERE ex_siniestro = :siniestro' +
      ' AND ex_orden = :orden' +
      ' AND ex_id = pe_idexpediente(+)' +
      ' AND ex_recaida <=(:recaida - 1)' +
      ' AND NVL(ex_causafin, '' '') NOT IN(''95'', ''99'')';
  Result := ValorSqlDateTimeEx(sSql, [ASiniestro, AOrden, ARecaida]);
end;

function Get_FechaInculpable(AIdExpediente: TTableID): TDateTime;
begin
  Result := ValorSqlDateTimeEx('SELECT art.inca.get_fechainculpable(:idex) FROM DUAL', [AIdExpediente]);
end;

function Is_SiniestroCerrado_x_ErroDeCarga(IdExpediente: TTableID): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_id = :id' +
      ' AND NVL(ex_causafin, '' '') IN(''95'', ''99'')';
  Result := ExisteSqlEx(sSql, [IdExpediente]);
end;

function Is_DenunciaSRT_Valida(ATexto: String): boolean;
begin
  Result := (GetAnioFromDenunciaSRT(ATexto) > 0) and (GetNumeroFromDenunciaSRT(ATexto) > 0);
end;

function Get_DenunciaSRT(ATexto: String): String;
begin
  Result := IntToStr(GetNumeroFromDenunciaSRT(ATexto)) + '/' + IntToStr(GetAnioFromDenunciaSRT(ATexto));
end;

function CambiosReg_EstadoSiniestro(Siniestro, Orden, Recaida: Integer; CodEstado, Observaciones, CodCausaFin: String;
                                    FechaFin: TDateTime): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT a.es_estado, a.es_observaciones, a.es_causafin, a.es_fechafin' +
     ' FROM ses_estadossiniestros a' +
    ' WHERE a.es_siniestro = :siniestro' +
      ' AND a.es_orden = :orden' +
      ' AND a.es_recaida = :recaida' +
      ' AND a.es_fechaalta = (SELECT MAX(b.es_fechaalta)' +
                              ' FROM ses_estadossiniestros b' +
                             ' WHERE b.es_siniestro = a.es_siniestro' +
                               ' AND b.es_orden = a.es_orden' +
                               ' AND b.es_recaida = a.es_recaida)';
  with GetQueryEx(sSql, [Siniestro, Orden, Recaida]) do
  try
    if IsEmpty then
      Result := True
    else
      Result := ((CodEstado <> FieldByName('es_estado').AsString) or
                 (Observaciones <> FieldByName('es_observaciones').AsString) or
                 (CodCausaFin <> FieldByName('es_causafin').AsString) or
                 (FechaFin <> FieldByName('es_fechafin').AsDateTime));
  finally
    Free;
  end;
end;

procedure Grabar_RegAuditLog(const Opcion, Accion, Observacion: String; const ConTrans: Boolean);
var
  sModulo: String;
  sSql: String;
begin
  sModulo := UpperCase(ChangeFileExt(GetAppInfo('OriginalFilename'), ''));
  sSql    := 'art.siniestro.do_regauditlog(:p_modulo, :p_opcion, :p_accion, :p_observaciones, :p_usuario);';

  if ConTrans then
    EjecutarStoreEx(sSql, [sModulo, Opcion, Accion, Observacion, Sesion.UserID])
  else
    EjecutarStoreSTEx(sSql, [sModulo, Opcion, Accion, Observacion, Sesion.UserID])
end;

function Is_EmpresaConTopeAMPO(CUIT, Periodo: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM sae_empresas_sin_topeampo' +
    ' WHERE ae_cuit = :cuit' +
      ' AND ae_periododesde <= :periodo' +
      ' AND NVL(ae_periodohasta, TO_CHAR(actualdate, ''YYYYMM'')) >= :periodo';
  Result := not ExisteSqlEx(sSql, [CUIT, Periodo, Periodo]);
end;

function Get_TopeAmpo(Periodo: String): Currency;
begin
  Result := ValorSqlExtendedEx('SELECT liq.get_topeampo(:speriodo) FROM DUAL', [Periodo])
end;

function Get_TopeIBDSiniestro(Siniestro, Orden, Recaida: Integer): Currency;
begin
  Result := ValorSqlExtendedEx('SELECT liq.get_topeibdsiniestro(:siniestro, :orden, :recaida) FROM DUAL', [Siniestro, Orden, Recaida])
end;

function Get_DescripcionOSocial(OSocial: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT os_descripcion' +
     ' FROM cos_osocial' +
    ' WHERE os_codigo = :codigo';
  Result := ValorSqlEx(sSql, [OSocial]);
end;

function Get_DescripcionJubilacion(AFJP: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT ju_nombre' +
     ' FROM sju_jubilacion' +
    ' WHERE ju_codigo = :codigo';
  Result := ValorSqlEx(sSql, [AFJP]);
end;

function Get_SiniestroPosibleRecupero(Cuil: String; IdSiniestro: TTableId = 0; Destinatario: String = ''): String;
begin
  Result := ValorSqlEx('SELECT siniestro.get_posiblerecupero(:cuil, :idsiniestro, :destinatario) FROM DUAL', [Cuil, IdSiniestro, Destinatario])
end;

procedure MsgSiniestroPosibleRecupero(Cuil: String; IdSiniestro: TTableId = 0; Destinatario: String = '');
var
  sSinPosibleRecupero: String;
begin
  if Cuil <> '' then
  begin
    sSinPosibleRecupero := Get_SiniestroPosibleRecupero(Cuil, 0, Destinatario);
    if sSinPosibleRecupero <> '' then
      MsgBox('Número de CUIL marcado como posible recupero en siniestro Nº ' + sSinPosibleRecupero + '.', MB_ICONINFORMATION);
  end;
end;

function GetProxPagoSPR(iSiniestro, iOrden, iRecaida: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT NVL(MAX(pr_numpago), 0)' +
     ' FROM spr_pagoexpesin' +
    ' WHERE pr_siniestro = :siniestro' +
      ' AND pr_orden = :orden' +
      ' AND pr_recaida = :recaida';
  Result := ValorSqlIntegerEx(sSql, [iSiniestro, iOrden, iRecaida]);

  Result := IIF((Result < 999), Result + 1, -1);
end;

// devuelve si el siniestro es mixto (ex_sinmixserol = S, o ex_sinmixodont = S
function Is_SiniestroMixto(iIdExpediente: Integer): Boolean;    // TK 18603
var
  sSql: String;
begin
  sSql :=
    'SELECT DECODE(ex_sinmixserol, ''S'', ''S'', DECODE(ex_sinmixodont, ''S'', ''S'', ''N'')) sinimixto' +
     ' FROM art.sex_expedientes' +
    ' WHERE ex_id = :id';
  Result := (ValorSqlEx(sSql, [iIdExpediente]) = 'S');
end;

function Is_SinPMEAbandonoMixto(iIdExpediente: Integer): Boolean;  // TK 18603
var
  sSql: String;
begin
  sSql :=
    'SELECT NVL(pe_abandonomixto, ''N'')' +
     ' FROM sin.spe_partedeegreso' +
    ' WHERE pe_idexpediente = :idexpediente';
  Result := (ValorSqlEx(sSql, [iIdExpediente]) = 'S');
end;

function Get_ExisteSiniestro(iSiniestro, iOrden, iRecaida: Integer; bTercerizado: Boolean): String;
var
  sSql: String;
begin
  Result := '';

  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :sin' +
      ' AND ex_orden = :ord' +
      ' AND ex_recaida = :reca';
  if bTercerizado then
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S''';

  if not ExisteSqlEx(sSql, [iSiniestro, iOrden, iRecaida]) then
  begin
    if bTercerizado then
      Result := 'El siniestro seleccionado no existe o bien usted no tiene permiso para visualizarlo.'
    else
      Result := 'El siniestro seleccionado no existe.';
  end;
end;

function Is_UsuarioSML(sIdUsuario: String): Boolean;        // Por Plan SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_usuariosml(:usuario) FROM DUAL', [sIdusuario]) = 'S');
end;

function Is_SiniestroSML(iIdExpediente: Integer): Boolean;  // Por Plan SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_siniestrosml(:idexp) FROM DUAL', [iIdExpediente]) = 'S');
end;

function Validar_SML(sIdUsuario: String; iIdExpediente: Integer): Boolean; // Por Plan SML
begin
  Result := True;
  if Is_UsuarioSML(sIdUsuario) and (not Is_SiniestroSML(iIdExpediente)) then
    Result := False;
end;

procedure Do_CopiarFechaBajaMedica(iID, iIdExpediente: integer; dFechaBajaMedica, dFechaRecepcion, dFechaAltaMedica: TDateTime);   // TK 43664
var sSQL: string;
begin
  if Validar_CopiarFechaBajaMedica(dFechaBajaMedica, dFechaAltaMedica, iIdExpediente) then
  begin
    sSQL := ' UPDATE SIN.SSA_SOLICITUDASISTENCIA ' +
               ' SET SA_FECHABAJAMEDICA = ' + SqlDate(dFechaRecepcion) +
             ' WHERE SA_ID = :id ';

    EjecutarSQLEx(sSQL, [iID]);
  end;
end;

function Validar_CopiarFechaBajaMedica(dFechaBajaMedica, dFechaAltaMedica: TDateTime; iIdExpediente: integer): boolean;
var dFecha: TDateTime;
begin
  Result := True;
  if (dFechaBajaMedica > 0) or (dFechaAltaMedica > 0) then
    Result := False
  else begin
    dFecha := Obtener_MinFechaLiquidacionILT(iIdExpediente);
    if (dFecha > 0) and (dFechaBajaMedica > dFecha) then
      Result := False;
  end;
end;

function GetFechaInicioILT(iSiniestro, iOrden: Integer; iRecaida: Integer = 0): TDateTime;
var
  sSql: String;
  fFechaAccidente, fComienzoVig: TDateTime;
begin
  sSql := 'SELECT art.siniestro.getbajamedica(ex_id) bajamedica, ex_fechaaccidente ' +
            'FROM sex_expedientes ' +
           'WHERE ex_siniestro = :siniestro ' +
             'AND ex_orden = :orden ' +
             'AND ex_recaida = 0';    // se cambio a recaida 0 fija como estaba antes por ticket de Cuppari

  with GetQueryEx(sSql, [iSiniestro, iOrden]) do
    try
      if Eof then
        fComienzoVig := 0
      else
        begin
          fComienzoVig    := FieldByName('bajamedica').AsDateTime;
          fFechaAccidente := FieldByName('ex_fechaaccidente').AsDateTime;

          if (fComienzoVig = fFechaAccidente) then
          begin
            if Es_FranquiciaCeroEspecial(iSiniestro, iOrden, iRecaida) then    // TK 57024
              fComienzoVig := FieldByName('ex_fechaaccidente').AsDateTime
            else
              fComienzoVig := FieldByName('ex_fechaaccidente').AsDateTime + 1;
          end;

        end;
    finally
      Free;
    end;

  Result := fComienzoVig;
end;

function Es_FranquiciaCeroEspecial(iSiniestro, iOrden, iRecaida: integer): boolean;
var sSql: string;
    iContratoVigente: integer;
begin
  iContratoVigente := ValorSqlIntegerEx('SELECT afiliacion.get_contratovigente(ex_cuit, to_char(ex_fechaaccidente, ''yyyymm'')) contratovigente' +
                                         ' FROM art.sex_expedientes ' +
                                        ' WHERE ex_siniestro = :sini ' +
                                          ' AND ex_orden = :orden ' +
                                          ' AND ex_recaida = :reca ', [iSiniestro, iOrden, iRecaida]);

  sSql := 'SELECT co_franqceroespecial FROM afi.aco_contrato ' +
          ' WHERE co_contrato = ' + SqlInt(iContratoVigente);

  Result := (ValorSql(sSql) = 'S');

end;


function Siniestro_EsDentroAnioILT(iSiniestro, iOrden: Integer): Boolean;
var dComienzoVig, dFinalVig: TDateTime;
begin
  dComienzoVig := GetFechaInicioILT(iSiniestro, iOrden);  // primer dia de la vigencia
  dFinalVig    := AddYears(dComienzoVig, 1) - 1;                    // ultimo dia de la vigencia
  Result := (DBDate >= dComienzoVig) and (DBDate <= dFinalVig);
end;

function Get_NombreTrabajador(Siniestro, Orden, Recaida: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT TRIM(TJ_NOMBRE) ' +
            'FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES ' +
           'WHERE EX_IDTRABAJADOR = TJ_ID ' +
             'AND EX_SINIESTRO = :Siniestro ' +
             'AND EX_ORDEN = :Orden ' +
             'AND EX_RECAIDA = :Recaida';

  Result := ValorSqlEx(sSql, [Siniestro, Orden, Recaida]);
end;

function ValidarSiniestroUsuarioTerce(iSiniestro, iOrden, iRecaida: Integer): Boolean; // Por plan Tercerizadoras (Ioma)
begin
  Result := True;

  if EsUsuarioDeTercerizadora then
    if (ValorSqlEx('select art.siniestro.is_usuariotercerizadora(:idemp , :usuario) from dual',
                   [Get_IdEmpresaPorSiniestro(iSiniestro, iOrden, iRecaida), Sesion.UserID]) = 'N') then
      Result := False;
end;

function SiniTieneRecaidas(iSiniestro:integer):boolean;   // por ticket 61569
var sSql:string;
begin
  sSql := 'SELECT count(*) cant ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_siniestro = :siniestro ';
  Result := (ValorSqlIntegerEx(sSql, [iSiniestro]) > 1);
end;


function GetIsExtensionILT(iIdExped:integer):Boolean;  // Plan Extensión de ILT
var sSql :String;
begin
  sSql   := 'SELECT inca.is_extensionilt(:pIdExped) FROM dual';
  Result := (ValorSqlEx(sSql, [iIdExped]) = 'S');
end;

function ExisteRelaLugarTrabajo(iIdTrabajador: integer): Boolean; // Por ticket 64558
var sSql: string;
begin
  //Cambio pedido por la dupla Amarillo/Grossi tk 69288
  sSql := ' SELECT 1 ' +
          '   FROM crl_relacionlaboral, afi.atr_tiporegimen ' +
          '  WHERE rl_idtiporegimen = tr_id ' +
          ' AND tr_codigo = ''PCP'' ' +
          ' AND rl_idtrabajador = :idtrab';

  with GetQueryEx(sSql, [iIdTrabajador]) do
  try
    Result := not Eof;
  finally
    Free;
  end;
end;

end.
