unit unLegales;

interface

uses
  unArt;

const
  CONPAGO_RECEXTR = 112;	    // RECURSO EXTRAORDINARIO
  CONPAGO_EMBARGO = 109;	    // EMBARGO

procedure DoInsertarAplicacionRecExtraordinario(Importe: Double; IdJuicio: TTableId; EsCancelacion: Boolean = False);
procedure DoInsertarAplicacionEmbargo(Importe: Double; IdEmbargo: TTableId; EsCancelacion: Boolean = False);
function  IsConceptoDuplicado (numero, idpago, idconpago : Integer; Modo : String):String; //numero(juicio,mediacion, sumario) modo (JD: demandada, JA: Actora, ME: Mediacion , SU: sumario)

function Do_ConvertirPreacuerdoRec(IDPlanPago: TTableId; bConTrans: Boolean; Usuario, Tipo: String): Boolean;
function ActualizarEstadoPlanPagoRec(IDPlanPago: TTableId; Usuario: String): Boolean;
function Do_ActualizarEstPlanPagoRec(IdPlanPago: TTableId; EstadoPlan: String; bConTrans: Boolean): Boolean;
procedure Get_TipoEstadoPlanRec(IdPlanPago: TTableId; var TipoPlan, EstadoPlan: String);
function Get_IdRecuperoSiniestro(Siniestro, Orden: Integer): TTableId;

implementation

uses
  unDmPrincipal, unSesion, AnsiSql, SysUtils, CustomDlgs, Classes;

procedure DoInsertarAplicacionRecExtraordinario(Importe: Double; IdJuicio: TTableId; EsCancelacion: Boolean = False);
var
  sSql: String;
  iTipo: Integer;
begin
  if Importe >= 0 then
    sSql :=
      'SELECT MIN(tr_id)' +
       ' FROM ltr_tipoaplicacionrecext' +
      ' WHERE tr_fechabaja IS NULL' +
        ' AND tr_generarecurso = ''S'''
  else
    sSql :=
      'SELECT MIN(tr_id)' +
       ' FROM ltr_tipoaplicacionrecext' +
      ' WHERE tr_fechabaja IS NULL' +
        ' AND tr_generapago = ''S''';

  iTipo := ValorSqlInteger(sSql);

  if EsCancelacion then
    Importe := -Importe;

  sSql :=
    'INSERT INTO lar_aplicacionrecursoext' +
               ' (ar_id, ar_idjuicio, ar_idtipoaplicacion, ar_importe, ar_usualta, ar_fechaalta)' +
        ' VALUES (seq_lar_id.NEXTVAL, :idjuicio, :tipo, :importe, :usuario, SYSDATE)';
  EjecutarSqlSTEx(sSql, [IdJuicio, iTipo, Importe, Sesion.UserID]);
end;

procedure DoInsertarAplicacionEmbargo(Importe: Double; IdEmbargo: TTableId; EsCancelacion: Boolean = False);
var
  sSql: String;
  iTipo: Integer;
begin
  sSql :=
    'SELECT MIN(ta_id)' +
     ' FROM lta_tipoaplicacionembargo' +
    ' WHERE ta_fechabaja IS NULL' +
      ' AND ta_generapago = ''S''';
  iTipo := ValorSqlInteger(sSql);

  if EsCancelacion then
    Importe := -Importe;

  sSql :=
    'INSERT INTO lae_aplicacionembargo ' +
      '(ae_id, ae_idembargo, ae_idtipoaplicacion, ae_importe, ae_usualta, ae_fechaalta) ' +
      'VALUES (seq_lae_id.NEXTVAL, :idembargo, :tipo, :importe, :usuario, SYSDATE)';
  EjecutarSqlSTEx(sSql, [IdEmbargo, iTipo, -Importe, Sesion.UserID]);
end;

function  IsConceptoDuplicado (numero, idpago, idconpago : Integer; Modo : String):String;
begin
  if Modo = 'JD' then
  begin
    if ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lpl_pagolegal '+
      '  WHERE pl_idjuicioentramite = '+SqlValue(numero)+
//      '    AND jt_estadomediacion = ''J'' '+
      '    AND pl_conpago = '+SqlValue(idconpago)+
      '    AND pl_id <> '+ SqlValue(idpago)+
      '    AND pl_estado IN (''C'',''E'')') then
      Result := 'S'
    else
      Result := 'N';
  end
  else if Modo = 'JA' then
  begin
    if ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lpl_pagolegal'+
      '  WHERE pl_idjuicioentramite = '+SqlValue(numero)+
//      '    AND jt_estadomediacion = ''A'' '+
      '    AND pl_conpago = '+SqlValue(idconpago)+
      '    AND pl_id <> '+ SqlValue(idpago)+
      '    AND pl_estado IN (''C'',''E'') ') then
      Result := 'S'
    else
      Result := 'N';
  end
  else if Modo = 'ME' then
  begin
    if ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lpm_pagomediacion '+
      '  WHERE pm_idmediacion = '+SqlValue(numero)+
      '    AND pm_conpago = '+SqlValue(idconpago)+
      '    AND pm_id <> '+ SqlValue(idpago)+
      '    AND pm_estado IN (''C'',''E'') ') then
      Result := 'S'
    else
      Result := 'N';
  end
  else if Modo = 'SU' then
  begin
    if ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lps_pagosumario '+
      '  WHERE ps_idsumario = '+SqlValue(numero)+
      '    AND ps_conpago = '+SqlValue(idconpago)+
      '    AND ps_id <> '+ SqlValue(idpago)+
      '    AND ps_estado IN (''C'',''E'') ') then
      Result := 'S'
    else
      Result := 'N';
  end;
end;

function Do_ConvertirPreacuerdoRec(IDPlanPago: TTableId; bConTrans: Boolean; Usuario, Tipo: String): Boolean;
var
  sEstado: String;
begin
  if Tipo = 'P' then         // plan
    sEstado := '02';

  if bConTrans then
    BeginTrans;

  try
    Do_ActualizarEstPlanPagoRec(IDPlanPago, sEstado, False);
    ActualizarEstadoPlanPagoRec(IDPlanPago, Usuario);

    if bConTrans then
      CommitTrans;

    Result := True;
  except
    on E: Exception do
      begin
        if bConTrans then
          RollBack;
        ErrorMsg(E, 'Error al convertir el preacuerdo.');

        Result := False;
      end;
  end;
end;

function ActualizarEstadoPlanPagoRec(IDPlanPago: TTableId; Usuario: String): Boolean;
var
  PlanPendienteImputacion: Boolean;
  sEstadoActual: String;
  sEstadoNuevo: String;
  sTipo: String;
  TotalCuotas: Currency;
  TotalValores: Currency;
begin
  Get_TipoEstadoPlanRec(IdPlanPago, sTipo, sEstadoActual);

  if sTipo <> 'A' then  // no es preacuerdo
    begin
      TotalValores := ValorSqlExtended('SELECT SUM(XV_IMPORTE) ' +
                                         'FROM LEGALES.LXV_RECUPEROVALOR ' +
                                        'WHERE XV_IDCUOTA IN (SELECT XC_ID ' +
                                                               'FROM LEGALES.LXC_RECUPEROCUOTA ' +
                                                              'WHERE XC_IDPLANPAGO = ' + SqlValue(IDPlanPago) + ')');

      TotalCuotas := ValorSqlExtended('SELECT SUM(XC_IMPORTE) ' +
                                      '  FROM LEGALES.LXC_RECUPEROCUOTA ' +
                                      ' WHERE XC_IDPLANPAGO = ' + SqlValue(IDPlanPago));

      PlanPendienteImputacion := ((TotalValores = TotalCuotas) and (TotalValores <> 0));

      if (sEstadoActual = '02') or (sEstadoActual = '03') then
        begin
          if PlanPendienteImputacion then
            sEstadoNuevo := '03'
          else
            begin
              if TotalValores <> 0 then
                sEstadoNuevo := '02'
              else
                sEstadoNuevo := '01';   // de Plan Pendiente de imputación pasa a Preacuerdo
            end;
        end;

      if sEstadoActual = sEstadoNuevo then
        Result := True
      else
        Result := Do_ActualizarEstPlanPagoRec(IdPlanPago, sEstadoNuevo, False);
    end
  else
    Result := True;
end;

function Do_ActualizarEstPlanPagoRec(IdPlanPago: TTableId; EstadoPlan: String; bConTrans: Boolean): Boolean;
var
  sSql: String;
begin
  if bConTrans then
    BeginTrans;

  try
    sSql := 'LEGALES.DO_ACTUALIZARESTPLANPAGO(' + SqlValue(IdPlanPago) + ', ' + SqlValue(EstadoPlan) + ', ' +
                                                  SqlValue(Sesion.UserId) + ');';
    EjecutarStoreST(sSql);

    if bConTrans then
      CommitTrans;

    Result := True;
  except
    on E: Exception do
      begin
        if bConTrans then
          RollBack;

        ErrorMsg(E, 'Error al actualizar el estado del plan.');
        Result := False;
      end;
  end;
end;

procedure Get_TipoEstadoPlanRec(IdPlanPago: TTableId; var TipoPlan, EstadoPlan: String);
var
  SqlResults: TStringList;
begin
  SqlResults := ValoresColSQL('SELECT TB_ESPECIAL2, XP_ESTADO ' +
                                'FROM CTB_TABLAS, LXP_RECUPEROPLAN ' +
                               'WHERE XP_ID = ' + SqlValue(IDPlanPago) + ' ' +
                                 'AND ''ESPLR'' = TB_CLAVE(+) ' +
                                 'AND XP_ESTADO = TB_CODIGO(+)');

  TipoPlan   := SqlResults[0];
  EstadoPlan := SqlResults[1];
end;

function Get_IdRecuperoSiniestro(Siniestro, Orden: Integer): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT RS_ID ' +
            'FROM LRS_RECUPEROSINIESTROS ' +
           'WHERE RS_SINIESTRO = :Siniestro ' +
             'AND RS_ORDEN = :Orden';

  Result := ValorSqlIntegerEx(sSql, [Siniestro, Orden], ART_EMPTY_ID);
end;

end.

