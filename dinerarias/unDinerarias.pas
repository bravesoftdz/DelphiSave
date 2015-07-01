unit unDinerarias;

interface

uses
  unArt, SysUtils, AnsiSql, SqlFuncs, Controls, SDEngine, DB, Forms;

  procedure DoImprimirMortal(iSiniestro, iOrden, iRecaida, iNLiq, iConcepto,
                             iTipoImpresion, iGrupoFamiliar :Integer; bRepLegal: Boolean);
  procedure ImprimirLiqPU(iSiniestro, iOrden, iRecaida, iNLiq: Integer;
                          bRepLegal:Boolean; iTipoImpresion:Integer);
  procedure ImprimirLiqANT(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar, iTipoImpresion: Integer);
  procedure ImprimirLiqINTCAPAFJP(iSiniestro, iOrden, iRecaida, iNLiq, iTipoImpresion: Integer);
  procedure ImprimirLiqINTCAPREP(iSiniestro, iOrden, iRecaida, iNLiq,
                                 iGrupoFamiliar, iTipoImpresion: Integer; bRepLegal: boolean);
  function DoGenerarOPAutomatica(iSiniestro, iOrden, iRecaida: Integer;
                                  sMetodo, sNumLiq, sTipoAcreed, sDniCuit, sLetraFac, sSituFac,
                                  sNumFac, sFormaPago, sSecMutual, sPagoJud, sDeleg, sCai,
                                  sEnvio, sDesde, sAcre, sTipoInt, sTipoTasaJus: String;
                                  dFechaLiq, dFechaFac, dFechaDesde, dFechaHasta: TDate;
                                  iSecPrestador, iIdBanco: Integer; dImpor, dImpCH, dIVA,
                                  dIngBruto, dRenta, dSellados, dOtros, dTasaOrig,
                                  dTasaFin: Double; bAutomatica, bImpCheque, bIntereses,
                                  bTasaJusticia, bCompDanios, bUpdatearCompDanios: Boolean;
                                  bSolicitaDirCDO: boolean = false): boolean;
  function GetMontoIndemnizacion(iSiniestro, iOrden, iRecaida, iIdTipo: Integer;
                                 sCodEvento, sGrado, sCaracter: String; dPorcInca: Double;
                                 Concepto: String = ''; iLiqIndemn: Integer = 1): Double;
  function GetConceptosBloqueados(iIdExpediente: Integer): String;
  function DoGenerarTempRemunDatEcon(Siniestro, Orden: Integer; Cuit: String; FAccid: TDateTime; bConTrans: boolean = true): Boolean;
  function DoGenerarTempRemunPostDecre(iSiniestro, iOrden: Integer; FAccid: TDateTime;
                                       FDesde: TDateTime = 0; sSigno: String = ''; bConTransaccion: boolean = True): Integer;
  function GetDiasPorMes(dFechaAccidente: TDate; sTipo, sCaracter: String): Double;
  function GetNombreCortoBanco(iIdBanco: Integer): String;
  function GetNombreBanco(iIdBanco: Integer): String;
  function GetTopeAmpo(sPeriodo, sOpcion: String): Double;

  procedure Do_UpdatearLiquidacionesCompDanios(iSiniestro, iOrden, iRecaida, iNumLiqui: integer);    // Por plan compensación por daños
  function Get_FechaLeyCompDanios: TDateTime;                                                        // Por plan compensación por daños
  function EsChequeANombreTrabajador(sMetodoPago, sIdBanco: string): boolean;   // TK 47963
  procedure DoEvaluarCartelSiniestroConAnioILT(iSiniestro, iOrden, iRecaida: Integer); // TK 46933

implementation

uses unDmPrincipal, unRptPagoAdic, unRptLiqReciboPagoUnico, unrptliq53,
  unrptliq53b, unrptliq8, unrptliq8b, unrptliq8Rep, unrptliq8repb, General,
  unClassLiquidacion, CustomDlgs, unComunes, unSiniestros, unSesion,
  unGeneracionOPagos, Classes, periodo, unDireccionCDO;


procedure DoImprimirMortal(iSiniestro, iOrden, iRecaida, iNLiq, iConcepto,
                           iTipoImpresion, iGrupoFamiliar :Integer; bRepLegal: Boolean);
var
  sSql: String;
begin
  case iConcepto of
    55: ImprimirLiqPU(iSiniestro, iOrden, iRecaida, iNLiq, bRepLegal, iTipoImpresion);
    53: ImprimirLiqANT(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar, iTipoImpresion);
     8: if ValorSqlIntegerEx('SELECT art.liq.is_afjpreparto(:Sin, :Ord) ' +
                              ' FROM DUAL', [iSiniestro, iOrden]) <> 1 then
          ImprimirLiqINTCAPAFJP(iSiniestro, iOrden, iRecaida, iNLiq, iTipoImpresion)
        else
          ImprimirLiqINTCAPREP(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar, iTipoImpresion, bRepLegal);
  end;

  sSql := 'UPDATE sle_liquiempsin ' +
            ' SET le_femision = actualdate ' +
          ' WHERE le_femision IS NULL ' +
            ' AND le_siniestro = :Sin ' +
            ' AND le_orden = :Ord ' +
            ' AND le_recaida = :Reca ' +
            ' AND le_numliqui = :Nro ';
  if InTransaction then
    EjecutarSqlSTEx(sSql, [iSiniestro, iOrden, iRecaida, iNLiq])
  else
    EjecutarSqlEx(sSql, [iSiniestro, iOrden, iRecaida, iNLiq]);
end;

procedure ImprimirLiqPU(iSiniestro, iOrden, iRecaida, iNLiq: Integer;
                        bRepLegal:Boolean; iTipoImpresion:Integer);
begin
  if iTipoImpresion in [0, 2] then  // liquidación, ambos
    with TqrPagoAdic.Create (nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq);
    finally
      free;
    end;

  if iTipoImpresion in [1, 2] then  // recibo, ambos
    with TfrmRptReciboPagoUnico.Create(nil) do
    try
      DoImprimir(bRepLegal, iSiniestro, iOrden, iRecaida, iNLiq);
    finally
      free;
    end;
end;

procedure ImprimirLiqANT(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar,
                         iTipoImpresion: Integer);
begin
  if iTipoImpresion in [0, 2] then  // liquidación, ambos
    with TRpt531.Create(Nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar);
    finally
      Free;
    end;

  if iTipoImpresion in [1, 2] then  // recibo, ambos
    with TRpt532.Create(Nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar);
    finally
      Free;
    end;
end;

procedure ImprimirLiqINTCAPAFJP(iSiniestro, iOrden, iRecaida, iNLiq, iTipoImpresion:Integer);
begin
  if iTipoImpresion in [0, 2] then  // liquidación, ambos
    with TRpt81.Create(Nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq);
    finally
      Free;
    end;

  if iTipoImpresion in [1, 2] then  // recibo, ambos
    with TRpt82.Create(Nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq);
    finally
      Free;
    end;
end;

procedure ImprimirLiqINTCAPREP(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar, iTipoImpresion:Integer; bRepLegal: boolean);
begin
  if iTipoImpresion in [0, 2] then  // liquidación, ambos
    with TRpt8Rep.Create(Nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar);
    finally
      Free;
    end;

  if iTipoImpresion in [1, 2] then  // recibo, ambos
    with TRpt8Rep2.Create(Nil) do
    try
      DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq, bRepLegal);
    finally
      Free;
    end;
end;

function DoGenerarOPAutomatica(iSiniestro, iOrden, iRecaida: Integer;
                                sMetodo, sNumLiq, sTipoAcreed, sDniCuit, sLetraFac, sSituFac,
                                sNumFac, sFormaPago, sSecMutual, sPagoJud, sDeleg, sCai,
                                sEnvio, sDesde, sAcre, sTipoInt, sTipoTasaJus: String;
                                dFechaLiq, dFechaFac, dFechaDesde, dFechaHasta: TDate;
                                iSecPrestador, iIdBanco: Integer; dImpor, dImpCH, dIVA,
                                dIngBruto, dRenta, dSellados, dOtros, dTasaOrig,
                                dTasaFin: Double; bAutomatica, bImpCheque, bIntereses,
                                bTasaJusticia, bCompDanios, bUpdatearCompDanios: Boolean; bSolicitaDirCDO: boolean = false): boolean;
var
  sSql, sObserv, sCuenta, sCampo :String;
  iNumPago, iConcepto, iIDExpediente :Integer;
begin
  Result := true;
  iConcepto := IIF(bTasaJusticia, CONCEPTO_TASA_JUSTICIA_CAMFED,
                   IIF(bIntereses, CONCEPTO_INTERESES_DIN,
                       IIF(bCompDanios, CONCEPTO_COMPENSACIONDANIOS,     // Por plan compensacion por daños
                           IIF(bAutomatica, CONCEPTO_COMISIONES_DIN, CONCEPTO_COMISIONES_OTROS))));

  sCuenta   := ValorSqlEx('SELECT cp_ctapago ' +
                           ' FROM scp_conpago ' +
                          ' WHERE cp_conpago = :Concepto', [iConcepto]);

  iIDExpediente := ValorSqlEx('select ex_id from sex_expedientes where ex_siniestro = :sin and ex_orden = :ord ' +
                              '   and ex_recaida = :rec', [iSiniestro, iOrden, iRecaida]);

  Application.ProcessMessages; //porque sino el msgask no funciona...
  if bImpCheque or bIntereses or bTasaJusticia or  bCompDanios or
    ((sMetodo = 'CH') and not(bAutomatica) and MsgAsk('¿Desea generar la liquidación correspondiente al Impuesto al Cheque?')) or
    ((sMetodo = 'DC') and MsgAsk('¿Desea generar la liquidación correspondiente a la Comisión del Banco?')) then
  begin
    iNumpago := GetProxPagoSPR(iSiniestro, iOrden, iRecaida);
    sObserv  := IIF(bImpCheque, 'Reintegro de comisiones bancarias',
                                'Corresponde a liquidación nº ' + sNumLiq + ' de ' + sDesde);

    sSql := 'INSERT INTO spr_pagoexpesin ' +
        '(pr_siniestro, pr_orden, pr_recaida, pr_numpago, pr_fechapago, pr_conpago, pr_femision, ' +
        ' pr_acreedor, pr_cuitcuil, pr_letrafac, pr_situfac, pr_numfac, pr_fechafac, pr_imporpago, ' +
        ' pr_importeconretencion, pr_formapago, pr_ctagasto, pr_comentario, pr_usualta, pr_fechalta, ' +
        ' pr_estado, pr_prestadorsecuencia, pr_prestadormutual, pr_pagojudicial, pr_delegacion, ' +
        ' pr_cai, pr_metodopago, pr_enviofondos, pr_idbanco, pr_impcheque, pr_iva, pr_ingresobruto, ' +
        ' pr_renta, pr_sellados, pr_otros, pr_tipotasa, pr_fechadesde, pr_fechahasta, ' +
        ' pr_tasaoriginal, pr_tasafinal, pr_tipotasajusticia) VALUES ( ' +
          SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' + SqlInt(iRecaida) + ',' +
          SqlInt(iNumPago) + ',' + SqlDate(dFechaLiq) + ',' +  SqlValue(iConcepto) + ', Null, ' +
          SqlString(sTipoAcreed, True, True) + ',' + SqlString(sDniCuit, True, True) + ',' +
          SqlString(sLetraFac, True, True) + ',' + SqlString(sSituFac, True, True) + ',' +
          SqlString(sNumFac, True, True) + ',' + SqlDate(dFechaFac) + ',' +
          SqlNumber(dImpor, True) + ',' + SqlNumber(0) + ',' + SqlString(sFormaPago, True, True) + ',' +
          SqlString(sCuenta, True, True) + ',' + SqlString(sObserv, True, True) + ',' +
          SqlValue(Sesion.UserID) + ', ActualDate, ''C'', ' + SqlInt(iSecPrestador, False) + ',' +
          SqlString(sSecMutual, True, True) + ',' + SqlString(sPagoJud, True, True) + ',' +
          SqlString(sDeleg, True, True) + ',' +  SqlString(sCai, True, True) + ',' +
          SqlString(sMetodo, True, True) + ',' + SqlString(sEnvio, True, True) + ',' +
          SqlInt(iIdBanco, True) + ',' + SqlNumber(dImpCH, True)  + ',' +
          SqlNumber(dIVA, True) + ',' + SqlNumber(dIngBruto, True) + ',' + SqlNumber(dRenta, True) + ',' +
          SqlNumber(dSellados, True) + ',' + SqlNumber(dOtros, True) + ',' +
          SqlString(sTipoInt, True, True) + ',' + SqlDate(dFechaDesde) + ',' +
          SqlDate(dFechaHasta) + ',' + SqlNumber(dTasaOrig, True) + ',' +
          SqlNumber(dTasaFin, True) + ',' + SqlString(sTipoTasaJus, True, True) + ')';
      EjecutarSqlST(sSql);

      if bAutomatica then
      begin
        sCampo := IIF(bTasaJusticia, 'le_numtasajusticia', IIF(bIntereses, 'le_numintereses',
                  IIF(bImpCheque, 'le_numpagocheque', IIF(bCompDanios, 'le_numliqui_compdanios', 'le_numpagocomi'))));
        sSql   := 'UPDATE sle_liquiempsin ' +
                    ' SET ' + sCampo + ' = :Num ' +
                ' WHERE le_siniestro = :Sin ' +
                  ' AND le_orden = :Ord ' +
                  ' AND le_recaida = :Reca ' +
                  ' AND le_numliqui = :Liq ';
        EjecutarSqlSTEx(sSql, [iNumPago, iSiniestro, iOrden, iRecaida, StrToInt(sNumLiq)]);

        if bCompDanios and bUpdatearCompDanios then                                      // Por Plan Compensación por Daños.
          Do_UpdatearLiquidacionesCompDanios(iSiniestro, iOrden, iRecaida, iNumPago);    // Updatea las demas liquidaciones de compensacion por daños que pasan la validación.

      end;

      if bSolicitaDirCDO then
      begin
        with TfrmDireccionCDO.Create(nil) do
        try
          Result := Mostrar(iIDExpediente, iNumPago, 'OP');
        finally
          Free;
        end;
      end
      else
      begin
        ssql := ' INSERT INTO SIN.scp_casospuestadisp(cp_idexpediente, cp_numliqui, cp_usualta, cp_fechaalta, cp_tablaliqui) ' +
                ' VALUES (art.siniestro.get_idexpediente(:sin, :ord, :rec), :numliq, ' +
                        ' :usu, TRUNC(SYSDATE), ''SPR'') ';

        EjecutarSqlSTEx(ssql, [iSiniestro, iOrden, iRecaida, iNumPago, Sesion.UserID]);
      end;

      Application.ProcessMessages;
      if (Result = true) and MsgAsk('Alta efectuada correctamente, ¿Desea imprimir la liquidación ahora?') then
        with TfrmGeneracionOPagos.Create(Nil) do
        try
          Siniestro   := iSiniestro;
          Orden       := iOrden;
          Recaida     := iRecaida;
          NumLiq      := iNumpago;
          Estado      := 'C';
          Cuit        := sDniCuit;
          Empresa     := sAcre;
          DoCargarDatos;
          ShowModal;
        finally
          Free;
        end;
    end;
end;

function GetMontoIndemnizacion(iSiniestro, iOrden, iRecaida, iIdTipo: Integer;
                               sCodEvento, sGrado, sCaracter: String; dPorcInca: Double;
                               Concepto: String = ''; iLiqIndemn: Integer = 1): Double;
var
  sConcepto: String;
begin
  if Concepto = '' then
    sConcepto := IIF(sGrado = 'T', CONCEPTO_TOTALDEF, CONCEPTO_PARCIALDEF_INDEM)
  else
    sConcepto := Concepto;

  with TSDStoredProc.Create(nil) do
  try
    DatabaseName   := 'dbPrincipal';
    StoredProcName := 'art.liq.get_montoformulailp';
    Params.CreateParam(ftInteger, 'siniestro', ptInput);
    Params.CreateParam(ftInteger, 'orden', ptInput);
    Params.CreateParam(ftInteger, 'recaida', ptInput);
    Params.CreateParam(ftInteger, 'tipo', ptInput);
    Params.CreateParam(ftFloat, 'porcinca', ptInput);
    Params.CreateParam(ftInteger, 'liqindemn', ptInput);
    Params.CreateParam(ftString, 'concepto', ptInput);
    Params.CreateParam(ftString, 'gradocar', ptInput);
    Params.CreateParam(ftString, 'codevento', ptInput);
    Params.CreateParam(ftDate, 'desde', ptInput);
    Params.CreateParam(ftDate, 'hasta', ptInput);
    Params.CreateParam(ftFloat, 'monto', ptOutput);
    Params.CreateParam(ftFloat, 'plusampo', ptOutput);
    Params.CreateParam(ftString, 'formula', ptOutput);
    Params.CreateParam(ftFloat, 'ibd', ptOutput);
    Params.CreateParam(ftFloat, 'ibdnorem', ptOutput);
    Params.CreateParam(ftInteger, 'idibd', ptOutput);
    Params.CreateParam(ftFloat, 'montonorem', ptOutput);

    ParamByName('siniestro').Value  := iSiniestro;
    ParamByName('orden').Value      := iOrden;
    ParamByName('recaida').Value    := iRecaida;
    ParamByName('tipo').Value       := iIdTipo;
    ParamByName('porcinca').Value   := dPorcInca;
    ParamByName('liqindemn').Value  := iLiqIndemn;
    ParamByName('concepto').Value   := sConcepto;
    ParamByName('gradocar').Value   := sGrado + sCaracter;
    ParamByName('codevento').Value  := sCodEvento;

    try
      ExecProc;
    except
    end;

    Result := ParamByName('monto').AsFloat;
  finally
    Free;
  end;
end;

function GetConceptosBloqueados(iIdExpediente: Integer): String;
begin
  Result := ValorSqlEx('SELECT art.dinerarias.get_conceptosbloqueados(:IdEpxd) ' +
                        ' FROM dual', [iIdExpediente]);
end;

function DoGenerarTempRemunDatEcon(Siniestro, Orden: Integer; Cuit: String; FAccid: TDateTime; bConTrans: boolean = true): Boolean;
var
  sPer, sPerFechaAccid, sSql: String;
  bEmpresaTopeada: Boolean;
  i: Integer;
begin
  Result := False;

  if bConTrans then
    BeginTrans;

  try
    sPerFechaAccid  := GetPeriodo(FAccid, fpAnioMes);
    bEmpresaTopeada := Is_EmpresaConTopeAMPO(Cuit, sPerFechaAccid);

    sSql := 'DELETE FROM tre_remuneracion ' +
             'WHERE re_usuario = :Usuario';
    EjecutarSqlSTEx(sSql, [Sesion.UserID]);

    sPer := sPerFechaAccid;
    for i := 12 downto 0 do
    begin
      sSql := 'INSERT INTO tre_remuneracion (re_id, re_usuario, re_periodo) ' +
                   'VALUES(:seq, :usuario, :periodo)';
      EjecutarSqlSTEx(sSql, [GetSecNextVal('SEQ_TRE_ID'), Sesion.UserID, sPer]);

      sPer := AddPeriodo(sPer, -1)
    end;

    EjecutarSqlSTEx(sSql, [GetSecNextVal('SEQ_TRE_ID'), Sesion.UserID, 'SAC 01']);
    EjecutarSqlSTEx(sSql, [GetSecNextVal('SEQ_TRE_ID'), Sesion.UserID, 'SAC 02']);

    sSql := 'UPDATE tre_remuneracion ' +
               'SET (re_diasper, re_impomes, re_impoampo, re_impoafip, re_diasafip, ' +
                   ' re_importesac, re_fechapres) = ' +
                   '(SELECT DECODE(SUBSTR(re_periodo, 1, 3), ''SAC'', 0, NVL(rs_diasper, 0)), ' +
                            'NVL(rs_impomes, 0), ' +
                            Iif(bEmpresaTopeada, 'DECODE(SUBSTR(re_periodo, 1, 3), ''SAC'', LIQ.GET_TOPEAMPO(re_periodo)/2, liq.get_topeampo(re_periodo))', '99999') + ', ' +
                            'nr_remimss, nr_laborables, nr_sac, nr_fecre ' +
                     ' FROM sers_recisalasin, sex_expedientes, znr_nomrec ' +
                     'WHERE ex_siniestro = :siniestro ' +
                       'AND ex_orden = :orden ' +
                       'AND ex_recaida = 0 ' +
                       'AND rs_siniestro(+) = ex_siniestro ' +
                       'AND rs_orden(+) = ex_orden ' +
                       'AND rs_persala(+) = re_periodo ' +
                       'AND nr_cuit(+) = ex_cuit ' +
                       'AND nr_cuil(+) = ex_cuil ' +
                       'AND nr_period(+) = re_periodo) ' +
             'WHERE re_usuario = :usuario';
    EjecutarSqlSTEx(sSql, [Siniestro, Orden, Sesion.UserID]);

    sSql := 'UPDATE tre_remuneracion ' +
               'SET re_impoampotopeado = LEAST(re_impomes, re_impoampo) ' +
             'WHERE re_usuario = :usuario';
    EjecutarSqlSTEx(sSql, [Sesion.UserID]);
    if bConTrans then
      CommitTrans;

    Result := True;
  except
    on E: Exception do
      begin
        if bConTrans then RollBack;
        ErrorMsg(E, 'Error al generar grilla remuneraciones.');
      end;
  end;
end;

function DoGenerarTempRemunPostDecre(iSiniestro, iOrden: Integer; FAccid: TDateTime;
                                     FDesde: TDateTime = 0; sSigno: String = ''; bConTransaccion: boolean = True): Integer;
var
  sSql, sTipo, sPer, sPer2: String;
  iIdRem, i: Integer;
begin
  Result := 0;
  iIdRem := 0;
  if bConTransaccion then BeginTrans;
  try
    sSql := 'DELETE FROM tmp.tmd_remudetallepostdecreto ' +
             'WHERE md_usuario = :usuario';
    EjecutarSqlSTEx(sSql, [Sesion.UserID]);

    if (sSigno <> '') then //estoy buscando uno anterior o posterior...
    begin
      sSql   := 'SELECT ' + IIF(sSigno = '>', 'MIN', 'MAX') + '(rm_id) ' +
                 ' FROM sin.srm_remumaestropostdecreto ' +
                ' WHERE rm_siniestro = :sin ' +
                  ' AND rm_orden = :ord ' +
                  ' AND rm_vigenciadesde ' + sSigno + ' NVL(' + SqlDate(FDesde) + ', ActualDate) ' +
                  ' AND rm_fechabaja IS NULL ';
      iIdRem := ValorSqlIntegerEx(sSql, [iSiniestro, iOrden]);
    end;

    if (iIdRem = 0) then
    begin
      sSql   := 'SELECT rm_id ' +
                 ' FROM sin.srm_remumaestropostdecreto ' +
                ' WHERE rm_siniestro = :sin ' +
                  ' AND rm_orden = :ord ' +
                  ' AND rm_vigenciahasta IS NULL ' +
                  ' AND rm_fechabaja IS NULL ';
      iIdRem := ValorSqlIntegerEx(sSql, [iSiniestro, iOrden]);
    end;

    if (iIdRem > 0) then
    begin
      sSql := ' INSERT INTO tmp.tmd_remudetallepostdecreto ' +
              ' SELECT rd_id, rd_tiporemu, rd_dias, rd_periodo, rd_monto, ' + SqlValue(Sesion.UserID) + ',' +
                     ' rd_montonoremun ' + 
                ' FROM sin.srd_remudetallepostdecreto ' +
               ' WHERE rd_idremu = ' + SqlInt(iIdRem) +
                 ' AND rd_fechabaja IS NULL ';
      EjecutarSqlST(sSql);
    end
    else begin

      for i := 0 to 4 do //inserto las remuneraciones fijas..que en realidad ahora son el resumen de las variables...
      begin
        sTipo := IIF(i=0, 'F', IIF(i=1, 'S', IIF(i=2, 'N', IIF(i=3, 'R', 'E'))));
        sSql  := 'INSERT INTO tmp.tmd_remudetallepostdecreto ' +
               '(md_dias, md_tiporemu, md_usuario) VALUES (' +
               ' 30, ' + SqlValue(sTipo) + ',' + SqlValue(Sesion.UserID) + ')';
        EjecutarSqlST(sSql);
      end;

      // Periodo del mes de la Fecha de Accidente
      sPer2 := AddPeriodo(GetPeriodo(FAccid, fpAnioMes), 0);  // a verrrr!!!!  Por Plan Fech Acc en Datos Econ.
      sSql  := 'INSERT INTO tmp.tmd_remudetallepostdecreto ' +
                 '(md_tiporemu, md_periodo, md_usuario) VALUES (' +
                 ' ''V'', ' +  SqlValue(sPer2) + ',' + SqlValue(Sesion.UserID) + ')';
      EjecutarSqlST(sSql);
      // ***************

      sPer := AddPeriodo(GetPeriodo(FAccid, fpAnioMes), -1);
      for i := 0 to 5 do //ahora inserto las variables...
      begin
        sSql  := 'INSERT INTO tmp.tmd_remudetallepostdecreto ' +
                 '(md_tiporemu, md_periodo, md_usuario) VALUES (' +
                 ' ''V'', ' +  SqlValue(sPer) + ',' + SqlValue(Sesion.UserID) + ')';
        EjecutarSqlST(sSql);
        sPer := AddPeriodo(sPer, -1);
      end;
    end;
    if bConTransaccion then CommitTrans;
    Result := iIdRem;
  except
    on E: Exception do
    begin
      if bConTransaccion then RollBack;
      ErrorMsg(E, 'Error al generar las remuneraciones post decreto.');
    end;
  end;
end;

function GetDiasPorMes(dFechaAccidente: TDate; sTipo, sCaracter: String): Double;
begin
  if (sTipo <> 'I') or (sCaracter = 'P') then
    Result := IIF(dFechaAccidente >= StrToDate(FECHA_DECRETO_1694_09), DiasXMesPD, DiasXMes)
  else
    Result := DiasXMes;
end;

function GetNombreCortoBanco(iIdBanco: Integer): String;
begin
  Result := ValorSqlEx('SELECT ba_nombrecorto ' +
                        ' FROM zba_banco ' +
                       ' WHERE ba_id = :id', [iIdBanco]);
end;

function GetNombreBanco(iIdBanco: Integer): String;
begin
  Result := ValorSqlEx('SELECT ba_nombre ' +
                        ' FROM zba_banco ' +
                       ' WHERE ba_id = :id', [iIdBanco]);
end;

function GetTopeAmpo(sPeriodo, sOpcion: String): Double;
begin
  Result := ValorSqlExtendedEx('SELECT art.siniestro.get_montoampo(:per, :opcion) ' +
                                ' FROM dual', [sPeriodo, sOpcion]);
end;

procedure Do_UpdatearLiquidacionesCompDanios(iSiniestro, iOrden, iRecaida, iNumLiqui: integer);    // Por Plan Compensación por Daños
var sSql: string;
begin
  sSql := ' UPDATE art.sle_liquiempsin D ' +
             ' SET D.LE_NUMLIQUI_COMPDANIOS = :numLiqui ' +
           ' WHERE D.le_siniestro = :sini ' +
             ' AND D.le_orden = :orden ' +
             ' AND D.le_recaida = :reca ' +
             ' AND D.le_numliqui in ( SELECT A.LE_NUMLIQUI ' +
                                      ' FROM art.sle_liquiempsin A, art.sex_expedientes, scp_conpago ' +
                                      ' WHERE A.le_siniestro = D.le_siniestro ' +
                                        ' AND A.le_orden = D.le_orden ' +
                                        ' AND A.le_recaida = D.le_recaida ' +
                                        ' AND A.le_tipoliqui = ''I'' ' +
                                        ' AND NVL(A.le_estado,'' '') NOT IN (''A'',''X'') ' +
                                        ' AND A.le_siniestro = ex_siniestro ' +
                                        ' AND A.le_orden = ex_orden ' +
                                        ' AND A.le_recaida = ex_recaida ' +
                                        ' AND A.le_conpago = cp_conpago ' +
                                        ' AND ex_fechaaccidente >= ' + SqlDate(Get_FechaLeyCompDanios) + 
                                        ' AND ex_tipo <> ''2'' ' +
                                        ' AND LE_NUMLIQUI_COMPDANIOS is null ' +
                                        ' AND CP_PERMITE_COMPDANIOS = ''S'' ) ';

  EjecutarSqlSTEx(sSql, [iNumLiqui, iSiniestro, iOrden, iRecaida]);
end;

function Get_FechaLeyCompDanios: TDateTime;
begin
  Result := ValorSqlDateTime('SELECT dinerarias.get_fechadesdecompdanios from dual');
end;

function EsChequeANombreTrabajador(sMetodoPago, sIdBanco: string): boolean;   // TK 47963  // 04/06/2013 no se va a usar por ahora porque se hizo otra funcion en la base llamada: is_chequealtrabajador.
begin
  Result := AreIn(sMetodoPago, ['EF', 'CH']) or ((sMetodoPago = 'TR') and AreIn(sIdBanco, [IntToStr(BANCO_PROVINCIA), IntToStr(BANCO_PATAGONIA)]));
end;


procedure DoEvaluarCartelSiniestroConAnioILT(iSiniestro, iOrden, iRecaida: Integer); // TK 46933
var sSql, sSqlCasos, sMensaje, sSiniestros: string;
begin
  sMensaje    := 'Para  este  trabajador se  posee  uno  o  mas  Siniestros ' + #13#10 +
                 'anteriores con ILT para el año anterior a la contingencia. ' + #13#10 + #13#10 +
                 'Siniestro/s N°: ' + #13#10;
  sSiniestros := '';

  // Veo si existe al menos un caso con las condiciones dadas
  sSql := ' SELECT A.ex_cuil cuil, A.ex_fecharecaida FechaRecaida, A.ex_fechaaccidente FechaAccidente ' +
            ' FROM art.sex_expedientes A ' +
           ' WHERE A.ex_siniestro = :sini ' +
             ' AND A.ex_orden = :orden ' +
             ' AND A.ex_recaida = :recaida ' +
             ' AND exists (SELECT 1 FROM art.sex_expedientes B ' +
                          ' WHERE B.ex_cuil = A.ex_cuil ' +
                            ' AND ((B.ex_siniestro <> A.ex_siniestro) or (B.ex_recaida <> A.ex_recaida)) ' +  // no pongo que las fechas de accidente sean distintas sino no me toma el siniestro de la recaida anterior
                            ' AND nvl(B.ex_fecharecaida, B.ex_fechaaccidente) < nvl(A.ex_fecharecaida, A.ex_fechaaccidente) ' +
                            ' AND (nvl(B.ex_altamedica, art.actualdate) - B.ex_fechaaccidente) > 1 ' +
                            ' AND art.siniestro.getbajamedica(B.ex_id) > (art.actualdate - 365) ) ';

  // si existe al menos un caso, saco los siniestros que lo cumplen para enviar el mensaje
  with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida]) do
  try
    if not Eof then
    begin
      sSqlCasos := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro ' +
                    ' FROM art.sex_expedientes ' +
                   ' WHERE ex_cuil = ' + SqlValue(FieldByName('CUIL').AsString) +
                     ' AND ((ex_siniestro <> ' + SqlInt(iSiniestro) + ') or (ex_recaida <> ' + SqlInt(iRecaida) + ')) ' +
                     ' AND nvl(ex_fecharecaida, ex_fechaaccidente) < nvl( ' + SqlDateTime(FieldByName('FECHARECAIDA').AsDateTime) + ', ' + SqlDateTime(FieldByName('FECHAACCIDENTE').AsDateTime) + ') ' +
                     ' AND (nvl(ex_altamedica,art.actualdate) - ex_fechaaccidente) > 1 ' +
                     ' AND art.siniestro.getbajamedica(ex_id) > (art.actualdate - 365) ';

      with GetQuery(sSqlCasos) do
      try
        while not Eof do
        begin
          sSiniestros := sSiniestros + #13#10 + FieldByName('SINIESTRO').AsString;
          Next;
        end;

        if (sSiniestros <> '') then
          MsgBox(sMensaje + sSiniestros);
      finally
        Free;
      end;

    end;
  finally
    Free;
  end;

end;



end.
