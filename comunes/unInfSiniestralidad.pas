unit unInfSiniestralidad;

interface

uses
  Windows, SysUtils, unComunes, SDEngine, Variants, Excel2000;

type
  TTipoInforme       = (tiCuadroOMSCIE10, tiEvolMensTrabCubiertosSini, tiInformeGralSini, tiIndVariosGravesMortales, tiIndVariosIncapacidades, tiAnalisisCliente, tiNinguno);
  TTipoActualizacion = (taMensual, taEnLinea);
  TTipoSeleccion     = (tsEmpresa, tsCIIU, tsHolding, tsTodos);
  TTipoSeleccionCant = (tcCantSiniestros, tcCantDiasCaidos);
  TTipoCuadro        = (tcValoresAbs, tcImportanciaRelat, tcAmbos);
  TTipoAccidente     = (taInItinere, taLugarTrab, taEnfProfesional, taTodos);

function PuedeGenerarInformeSiniestral: Boolean;
function Get_FechaActualizacion(TipoActualizacion: TTipoActualizacion): String;
function DoCopiarArchivo(const TipoInforme: TTipoInforme): String;
function DoMostrarArchivo(const TipoInforme: TTipoInforme; const AFileName: String; const nContrato: Integer; const Actividad, Holding: string): Boolean;

function Generar_CuadroInformacionCuentaYSiniestral(TipoInforme: TTipoInforme; GenerarTodosContratos: Boolean; Contrato: Integer; SelRangoPeriodos: Boolean; SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook; VerValidaciones: Boolean = true): Boolean;
function Generar_CuadroCie10(Cuit, Actividad, Holding: String; SoloAltaLaboral: Boolean; TipoSeleccion: TTipoSeleccion; TipoAccidente: TTipoAccidente; TipoCuadro: TTipoCuadro; TipoSeleccionCant: TTipoSeleccionCant; TipoActualizacion: TTipoActualizacion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook; VerValidaciones: Boolean = true): Boolean;
function Generar_CuadroEvolTrabajSiniestros(Contrato: Integer; Actividad, Holding: String; TipoSeleccion: TTipoSeleccion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean; overload;
function Generar_CuadroEvolTrabajSiniestros(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; GenerarTodosContratos: Boolean; Contrato: Integer; Actividad, Holding: String; SelRangoPeriodos: Boolean; FechaActualizacion, SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean; overload;
function Generar_CuadroInformeSiniestralidad(Contrato: Integer; Actividad, Holding: String; TipoSeleccion: TTipoSeleccion; TipoActualizacion: TTipoActualizacion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook; LCID_1: LCID; VerValidaciones: Boolean = true): Boolean; overload;
function Generar_CuadroInformeSiniestralidad(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; GenerarTodosContratos: Boolean; Contrato: Integer; Actividad, Holding: String; SelRangoPeriodos: Boolean; TipoActualizacion: TTipoActualizacion; FechaActualizacion, SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook; LCID_1: LCID; VerValidaciones: Boolean = true): Boolean; overload;
function Generar_CuadroIndicesVarios(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding: String; TipoSeleccion: TTipoSeleccion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean; overload;
function Generar_CuadroIndicesVarios(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; GenerarTodosContratos: Boolean; Contrato: Integer; Actividad, Holding: String; SelRangoPeriodos: Boolean; FechaActualizacion, SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean; overload;

implementation

uses
  AnsiSql, unDmPrincipal, unSesion, General, Classes, ArchFuncs, unArchivoVisor,
  unMoldeEnvioMail, unSeleccionDestinatarios, unExcel, Periodo, Numeros,
  StrFuncs, CustomDlgs, unArt, StrUtils;

const
  INF_CIE_XLS         = 'INF_CIE';
  INF_TRAB_XLS        = 'INF_TRAB';
  INF_SIN2_XLS        = 'INF_SIN2';
  INF_GRMR_XLS        = 'INF_GRMR';
  INF_INCA_XLS        = 'INF_INCA';
  ANALISISCLIENTE_XLS = 'ANALISISCLIENTE';

  PosSolapaAC_InformacionCuentaYSiniestral = 1;
  PosSolapaAC_InformeSiniestralidad        = 2;
  PosSolapaAC_InformeSiniestralidad_Datos  = 3;
  PosSolapaAC_EvolucionMensual             = 4;
  PosSolapaAC_IndicesVarios_GravMort       = 5;

procedure Obtener_PeriodoDesdeHasta(CUIT, Actividad, Holding, PerDesde, PerHasta: String; RangoPeriodos: Boolean; var PeriodoDesde, PeriodoHasta: string);
var
  sSql: String;
  qry: TSDQuery;
begin
  if (CUIT <> '') or (Actividad <> '') or (Holding <> '') then
  begin
    sSql := 'SELECT MIN(MP_PERIODO) PERDESDE, MAX(MP_PERIODO) PERHASTA '
            + 'FROM ART.TMP_CUADROSSINIESTRALIDAD TMP ';

    if CUIT <> '' then
      {por cuit}
      sSql := sSql + 'WHERE TMP.MP_CUIT = ' + SqlValue(CUIT) + ' '
    else if (Actividad <> '') or (Holding <> '') then
    begin
      {por CIIU/Holding}
      sSql := sSql + ', AGE_GRUPOECONOMICO AGE, CAC_ACTIVIDAD CAC, ACO_CONTRATO ACO, AEM_EMPRESA AEM ' +
                     'WHERE ACO.CO_IDEMPRESA = AEM.EM_ID ' +
                       'AND ACO.CO_IDACTIVIDAD = CAC.AC_ID ' +
                       'AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) ' +
                       'AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) ';
      if Actividad <> '' then
        {por CIIU}
        sSql := sSql + 'AND CAC.AC_CODIGO LIKE ' + SqlValue(Actividad + '%') + ' '
      else
        {por holding}
        sSql := sSql + 'AND AGE.GE_CODIGO = ' + SqlValue(Holding) + ' ';

      sSql := sSql + 'AND TMP.MP_CUIT = AEM.EM_CUIT '
    end;

    sSql := sSql
        + 'AND MP_USUARIO = ''A'' '
        + 'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(MP_CUIT, ' + SqlValue(Sesion.UserId) + ') = ''S'' '
        + iif(RangoPeriodos, 'AND MP_PERIODO BETWEEN ' + SqlValue(PerDesde)
                                             + ' AND ' + SqlValue(PerHasta), '');

    qry := GetQuery(sSql);
    try
      if qry.IsEmpty then
      begin
        PeriodoDesde := '';
        PeriodoHasta := '';
      end
      else begin
        PeriodoDesde := qry.FieldByName('PERDESDE').AsString;
        PeriodoHasta := qry.FieldByName('PERHASTA').AsString;
      end;
    finally
      FreeAndNil(qry);
    end;
  end else
  begin
    PeriodoDesde := '';
    PeriodoHasta := '';
  end;
end;

function PuedeGenerarInformeSiniestral: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT ART.SIN.GENINFORMESSINIESTRALIDAD FROM DUAL';

  Result := (ValorSql(sSql) = 'S');
end;

function Get_FechaActualizacion(TipoActualizacion: TTipoActualizacion): String;
begin
  case TipoActualizacion of
    taMensual: Result := Get_DescripcionCTBTablas('FSINI', 'FECHA');
    taEnLinea: Result := FormatDateTime('dd/mm/yyyy', DBDate);
  end;
end;

function Obtener_Columna(Cod: Integer): string;
begin
  if (Cod >= 1) and (Cod <= 20) then
    Result := chr(64 + Cod)
  else
    Result := ' ';
end;

function Obtener_Fila(Cod: Integer):Integer;
begin
  case Cod of
     1:       Result := 1;
     2:       Result := 2;
     3:       Result := 3;
     4:       Result := 4;
     7:       Result := 5;
     8:       Result := 6;
     9:       Result := 7;
     10:      Result := 8;
     11:      Result := 9;
     12:      Result := 10;
     14:      Result := 11;
     15:      Result := 12;
     16:      Result := 13;
     17:      Result := 14;
     18:      Result := 15;
     20:      Result := 16;
     90:      Result := 17;
     91:      Result := 18;
     92:      Result := 19;
     93:      Result := 20;
     94:      Result := 21;
     95, 99:  Result := 22;
  else
    Result := 0;
  end;
end;
                    
function Obtener_MaxColumna: integer;
begin
  Result := ValorSqlInteger('SELECT ART.SIN.GET_MAXCOLUMNACIE10 FROM DUAL');
end;

function Obtener_MaxFila: integer;
begin
  Result := ValorSqlInteger('SELECT ART.SIN.GET_MAXFILACIE10 FROM DUAL');
end;

function GetTipoInformeTexto(const TipoInforme: TTipoInforme): String;
var
  sTipoInformeTexto: string;
begin
  case TipoInforme of
    tiCuadroOMSCIE10            : sTipoInformeTexto := 'Cuadro de OMS-CIE10';
    tiEvolMensTrabCubiertosSini : sTipoInformeTexto := 'Evolución Mensual de Trabajadores Cubiertos y Siniestros';
    tiInformeGralSini           : sTipoInformeTexto := 'Informe General de Siniestros';
    tiIndVariosGravesMortales   : sTipoInformeTexto := 'Indices Varios-Graves y Mortales';
    tiIndVariosIncapacidades    : sTipoInformeTexto := 'Indices Varios-Incapacidades';
    tiAnalisisCliente           : sTipoInformeTexto := 'Análisis del Cliente';
  end;

  Result := sTipoInformeTexto;
end;

function DoCopiarArchivo(const TipoInforme: TTipoInforme): String;
var
  sNomArchivoOrig, sTipoInformeTexto, sNomArchivoDest, sNomArchivo: String;
begin
  sTipoInformeTexto := GetTipoInformeTexto(TipoInforme);

  case TipoInforme of
    tiCuadroOMSCIE10:           sNomArchivo := INF_CIE_XLS;
    tiEvolMensTrabCubiertosSini:sNomArchivo := INF_TRAB_XLS;
    tiInformeGralSini:          sNomArchivo := INF_SIN2_XLS;
    tiIndVariosGravesMortales:  sNomArchivo := INF_GRMR_XLS;
    tiIndVariosIncapacidades:   sNomArchivo := INF_INCA_XLS;
    tiAnalisisCliente:          sNomArchivo := ANALISISCLIENTE_XLS;
  end;
  sNomArchivo := sNomArchivo + '.XLS';

  sNomArchivoOrig := Get_PathReportes + sNomArchivo;
  if not FileExists(sNomArchivoOrig) then
    raise Exception.Create(Format('No se encontró el template para %s en ' + sNomArchivoOrig, [sTipoInformeTexto]));
                     
  sNomArchivoDest := TempPath + sNomArchivo;

  DeleteFile(sNomArchivoDest);
  if CopyFileExt(sNomArchivoOrig, sNomArchivoDest, False) then
    Result := sNomArchivoDest
  else
    raise Exception.Create('No se ha podido copiar el archivo en su disco local.');
end;

function DoMostrarArchivo(const TipoInforme: TTipoInforme; const AFileName:String; const nContrato: Integer; const Actividad, Holding: string): Boolean;
var
  sTipoInformeTexto, sSeleccionInformeTexto: string;
begin
  sTipoInformeTexto := GetTipoInformeTexto(TipoInforme);

  if nContrato > 0 then
    sSeleccionInformeTexto := ' - Contrato: ' + IntToStr(nContrato)
  else if Actividad <> '' then
    sSeleccionInformeTexto := ' - CIIU: ' + Actividad
  else if Holding <> '' then
    sSeleccionInformeTexto := ' - Holding: ' + Holding
  else
    sSeleccionInformeTexto := ' - Todos ';

  Result := AbrirArchivoVisorMail(AFileName, '', sTipoInformeTexto + sSeleccionInformeTexto,
                                  [oAlwaysShowDialog, oAutoFirma], 'Se adjunta archivo.', nContrato, 2500, -1,
                                  [tdContactoContrato, tdVendedor], True);
end;

function GetDescrTipoSeleccion(const TipoSeleccion: TTipoSeleccion; RazonSocial, Actividad, Holding: String; SelRangoPeriodos: Boolean; SelPerDesde, SelPerHasta: String): String;
var
  sSeleccion: String;
begin
  case TipoSeleccion of
    tsEmpresa:
      sSeleccion := 'Empresa: ' + RazonSocial;
    tsCIIU:
      sSeleccion := 'CIIU: ' + Actividad;
    tsHolding:
      sSeleccion := 'Holding: ' + Holding;
    tsTodos:
      sSeleccion := 'Todas las empresas';
  end;

  if SelRangoPeriodos then
    sSeleccion := sSeleccion + ' / Periodos: ' + FormatPeriodo(SelPerDesde) + ' - ' + FormatPeriodo(SelPerHasta);

  Result := sSeleccion;
end;

function Obtener_CodTipoAccidente(TipoAccidente: TTipoAccidente): String;
begin
  case TipoAccidente of
    taLugarTrab:      Result := '1';
    taInItinere:      Result := '2';
    taEnfProfesional: Result := '3';
    else
      Result := '';
  end;
end;

procedure Generar_PlanillaExcelCie10(EsCuadroRelativo: Boolean; Total: Integer; Seleccion, DescrSeleccion, FechaActualizacion: String; WorkBk: _WorkBook);
const
  Collnic = 'C';
  Fillnic = 6;
var
  Hoja: _Worksheet;
  Valor, Factor: Double;
  sSQL: string;
  celda, RangeValue: string;
  col: char;
  Fil, DespFil, DespCol: integer;
begin
  Factor  := 1;
  DespCol := Ord(Collnic) - 65;
  DespFil := Fillnic -1;

  Hoja      := ExclSetWorkSheet(WorkBk, 1);
  Hoja.Name := 'Cuadro';

  ExclSetFooter(Hoja, tfLeft, Sesion.Usuario);

  ExclSetCellValue(Hoja, 'SubTitulo', Seleccion);
  ExclSetCellValue(Hoja, 'Fecha', ' F. de Ultima Actualización: ' + FechaActualizacion + ' - F. de Impresión: ' + DateToStr(DBDate()));

  if EsCuadroRelativo then
  begin
    Factor := 100 / Total;
    ExclSetCellValue(Hoja, 'Tipo', DescrSeleccion + ' - Importancia Relativa (%)');
  end else
    ExclSetCellValue(Hoja, 'Tipo', DescrSeleccion + ' - Valores Absolutos');

  sSQL :=
      'SELECT CTB_FILA.TB_ESPECIAL1 FILA, CTB_COLUMNA.TB_ESPECIAL1 COLUMNA, MP_CANTIDAD '
     +'  FROM TMP_CUADROCIE10, CTB_TABLAS CTB_FILA, CTB_TABLAS CTB_COLUMNA'
     +' WHERE MP_USUARIO = ' + SqlValue(Sesion.UserID)
     +'   AND CTB_FILA.TB_CLAVE (+) = ''NACIE'' '
     +'   AND TO_NUMBER(CTB_FILA.TB_CODIGO (+)) = MP_FILA '
     +'   AND CTB_COLUMNA.TB_CLAVE (+) = ''ZOCIE'' '
     +'   AND TO_NUMBER(CTB_COLUMNA.TB_CODIGO (+)) = MP_COLUMNA '
     +' ORDER BY MP_FILA, MP_COLUMNA ';

    with GetQuery(sSQL) do
    begin
      try
        while not Eof do
        begin
          Col := chr(Byte((DespCol + 64 + Nvl(FieldByName('Columna').AsInteger, -64))));
          Fil := DespFil + Nvl(FieldByName('Fila').AsInteger, 0);

          if (fil >= Fillnic) and (Ord(col) >= Ord(Collnic)) then
          begin
            celda := Col + IntToStr(Fil);
            if EsCuadroRelativo then
            begin
              Valor := StrToFloat(FormatFloat('0.000', FieldByName('MP_CANTIDAD').AsInteger * Factor));
              ExclSetCellValue(Hoja, Celda, ExclGetCellValue(Hoja, Celda) + Valor);
            end else
            begin
              RangeValue := ExclGetCellValue(Hoja, Celda) + FieldByName('MP_CANTIDAD').AsInteger;
              ExclSetCellValue(Hoja, Celda, RangeValue);
            end;
          end;

          Next;
        end;
      finally
        Free;
      end;
    end;
end;

function Generar_CuadroCie10(Cuit, Actividad, Holding: String; SoloAltaLaboral: Boolean; TipoSeleccion: TTipoSeleccion; TipoAccidente: TTipoAccidente; TipoCuadro: TTipoCuadro; TipoSeleccionCant: TTipoSeleccionCant; TipoActualizacion: TTipoActualizacion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook; VerValidaciones: Boolean): Boolean;
var
  sSQL, sSQLFrom, sSQLWhere, sSeleccion, sRazonSocial, sDescrSeleccion: string;
  bRangoPeriodos: Boolean;
  nTotal: integer;
begin
  bRangoPeriodos := (PerDesde <> '');
  Do_LimpiarTablaTemporal('TMP_CUADROCIE10', 'MP_USUARIO', Sesion.UserID);

  sSQLWhere := ' WHERE 1 = 1 ';

  case TipoActualizacion of
    taMensual:
      begin  {actualización mensual}
        sSQL :=
              'INSERT INTO ART.TMP_CUADROCIE10 (MP_USUARIO, MP_FILA, MP_COLUMNA, MP_CANTIDAD) '
             +'  SELECT ' + SqlValue(Sesion.UserID) + ','
             +'           TMP.MP_FILA, TMP.MP_COLUMNA,'
             +            iif(TipoSeleccionCant = tcCantSiniestros,
                              {cantidad de siniestros}
                              ' NVL(SUM(TMP.MP_CANTIDAD_SINIESTROS), 0) ',
                              {cantidad de días caídos}
                              ' NVL(SUM(TMP.MP_CANTIDAD_DIASCAIDOS), 0) ')
             +'    FROM   TMP_CUADROSSINIESTRALIDADCIE10 TMP ';

        if (TipoSeleccion = tsCIIU) or (TipoSeleccion = tsHolding) then
        begin
          {por CIIU / Holding}
          sSQLFrom := ', AGE_GRUPOECONOMICO AGE '
                     +', CAC_ACTIVIDAD CAC '
                     +', ACO_CONTRATO ACO '
                     +', AEM_EMPRESA AEM';

          sSQLWhere := sSQLWhere
             +' AND TMP.MP_USUARIO = ''A'' '
             +' AND TMP.MP_CUIT = AEM.EM_CUIT '
             +' AND ACO.CO_IDEMPRESA = AEM.EM_ID '
             +' AND ACO.CO_IDACTIVIDAD = CAC.AC_ID '
             +' AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) '
             +' AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) '
             +' AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(TMP.MP_CUIT, ' + SqlValue(Sesion.UserID)+') = ''S'' ';
        end;

        case TipoSeleccion of
          tsEmpresa:
            sSQLWhere := sSQLWhere + ' AND TMP.MP_CUIT = ' + SqlValue(Cuit);
          tsCIIU:
            sSQLWhere := sSQLWhere + ' AND CAC.AC_CODIGO LIKE ' + SqlValue(Actividad + '%');
          tsHolding:
            sSQLWhere := sSQLWhere + ' AND AGE.GE_CODIGO = ' + SqlValue(Holding);
        end;

        if TipoAccidente <> taTodos then
          sSQLWhere := sSQLWhere + ' AND TMP.MP_TIPOACCIDENTE = ' + SqlValue(Obtener_CodTipoAccidente(TipoAccidente));

        if SoloAltaLaboral then
          sSQLWhere := sSQLWhere + ' AND TMP.MP_ALTAMEDICA = ''S'' ';

        sSQLWhere := sSQLWhere + ' GROUP BY TMP.MP_FILA, TMP.MP_COLUMNA';

        sSQL := sSQL + sSQLFrom + sSQLWhere;
        EjecutarSql(sSQL);
      end;
    taEnLinea:
      begin
        sSQL :=
            'INSERT INTO ART.TMP_CUADROCIE10 (MP_USUARIO, MP_FILA, MP_COLUMNA, MP_CANTIDAD)'
           +'   SELECT ' + SqlValue(Sesion.UserID) + ', '
           +'              NVL(DG_FILA, ' + SqlValue(Obtener_MaxFila) + '), '
           +'              NVL(DG_COLUMNA, ' + SqlValue(Obtener_MaxColumna) + ') ';

        case TipoSeleccionCant of
          tcCantSiniestros:
            sSQL := sSQL + ', COUNT(*) ';
          tcCantDiasCaidos:
            sSQL := sSQL + ', NVL(SUM(ART.SIN.GET_CANTDIASCAIDOS(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA)), 0)';
        end;

        sSQLFrom := ' FROM SEX_EXPEDIENTES, CDG_DIAGNOSTICO ';

        if (TipoSeleccion = tsCIIU) or (TipoSeleccion = tsHolding) then
        begin
          sSQLFrom := sSQLFrom +
               ', AGE_GRUPOECONOMICO AGE '
              +', CAC_ACTIVIDAD CAC '
              +', ACO_CONTRATO ACO '
              +', AEM_EMPRESA AEM';

          sSQLWhere := sSQLWhere
             +' AND EX_CUIT = AEM.EM_CUIT '
             +' AND ACO.CO_IDEMPRESA = AEM.EM_ID '
             +' AND ACO.CO_IDACTIVIDAD = CAC.AC_ID '
             +' AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) '
             +' AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) '
             +' AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(EM_CUIT, ' + SqlValue(Sesion.UserID)+') = ''S'' ';
        end;

        sSQLWhere := sSQLWhere + ' AND EX_DIAGNOSTICOOMS = DG_CODIGO (+)';

        case TipoSeleccion of
          tsEmpresa:
            sSQLWhere := sSQLWhere + ' AND EX_CUIT = ' + SqlValue(Cuit);
          tsCIIU:
            sSQLWhere := sSQLWhere + ' AND CAC.AC_CODIGO LIKE ' + SqlValue(Actividad + '%');
          tsHolding:
            sSQLWhere := sSQLWhere + ' AND AGE.GE_CODIGO = ' + SqlValue(Holding);
        end;

        if TipoAccidente <> taTodos then
          sSQLWhere := sSQLWhere + ' AND ART.UTILES.IIF_CHAR(ex_Tipo, '''', ''1'', ex_Tipo) = ' + SqlValue(Obtener_CodTipoAccidente(TipoAccidente));

        if SoloAltaLaboral then
          sSQLWhere := sSQLWhere + ' AND EX_ALTAMEDICA IS NOT NULL';

        sSQLWhere := sSQLWhere + ' AND NVL(EX_CAUSAFIN, ''00'') NOT IN (''02'', ''95'', ''99'')';

        if TipoSeleccionCant = tcCantSiniestros then
          sSQLWhere := sSQLWhere + ' AND EX_RECAIDA = 0 '; {cuento sólo los siniestros}

        sSQLWhere := sSQLWhere + ' AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(ex_Cuit, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

        if bRangoPeriodos Then
          sSQLWhere := sSQLWhere
              +' AND TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'') BETWEEN ' + SqlValue(PerDesde) + ' AND ' + SqlValue(PerHasta);

        sSQLWhere := sSQLWhere
            +' GROUP BY NVL(DG_FILA, ' + SqlValue(Obtener_MaxFila) + '),'
            +'              NVL(DG_COLUMNA, ' + SqlValue(Obtener_MaxColumna) + ')';

        sSQL := sSQL + sSQLFrom + sSQLWhere;
        EjecutarSql(sSQL);
      end;
  end;

  if TipoSeleccion = tsEmpresa then
    sRazonSocial := ValorSqlEx('SELECT EM_NOMBRE FROM AEM_EMPRESA WHERE EM_CUIT = :CUIT', [Cuit]);

  sSeleccion := GetDescrTipoSeleccion(TipoSeleccion, sRazonSocial, Actividad, Holding, False, '', '');

  case TipoAccidente of
    taInItinere:
      sSeleccion := sSeleccion + ' / Tipo Acc.: In itinere';
    taLugarTrab:
      sSeleccion := sSeleccion + ' / Tipo Acc.: Lugar de trabajo';
    taEnfProfesional:
      sSeleccion := sSeleccion + ' / Tipo Acc.: Enfermedad profesional';
    taTodos:
      sSeleccion := sSeleccion + ' / Tipo Acc.: Todos';
  end;

  if SoloAltaLaboral then
    sSeleccion := sSeleccion + ' / Sólo con alta laboral';

  if bRangoPeriodos then
    sSeleccion := sSeleccion + ' / Periodos: ' + FormatPeriodo(PerDesde) + ' - ' + FormatPeriodo(PerHasta);

  case TipoSeleccionCant of
    tcCantSiniestros: sDescrSeleccion := 'Cantidad de Siniestros';
    tcCantDiasCaidos: sDescrSeleccion := 'Cantidad de Días Caídos';
  end;

  if TipoCuadro = tcImportanciaRelat then
  begin
    {importancia relativa, ambos}
    sSQL := 'SELECT SUM(MP_CANTIDAD) '
          + '  FROM ART.TMP_CUADROCIE10 '
          + ' WHERE MP_USUARIO = ' + SqlValue(Sesion.UserID);
    nTotal := ValorSqlInteger(sSQL);

    if VerValidaciones then
      Verificar(nTotal = 0, nil, 'No se han encontrado datos en el reporte.')
    else
      if nTotal = 0 then Abort;
  end else
    nTotal := 0;

  case TipoCuadro of
    tcValoresAbs:
      Generar_PlanillaExcelCie10(False, 0, sSeleccion, sDescrSeleccion, FechaActualizacion, WorkBk);
    tcImportanciaRelat:
      Generar_PlanillaExcelCie10(True, nTotal, sSeleccion, sDescrSeleccion, FechaActualizacion, WorkBk);
  end;

  Result := True;
end;

function Generar_CuadroEvolTrabajSiniestros(Contrato: Integer; Actividad, Holding: String; TipoSeleccion: TTipoSeleccion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean;
var
  bSelRangoPeriodos: Boolean;
begin
  bSelRangoPeriodos := (PerDesde <> '');
  Result := Generar_CuadroEvolTrabajSiniestros(tiEvolMensTrabCubiertosSini, TipoSeleccion, True, Contrato, Actividad, Holding, bSelRangoPeriodos, FechaActualizacion, PerDesde, PerHasta, PerDesde, PerHasta, WorkBk);
end;

function Generar_CuadroIndicesVarios(TipoInforme: TTipoInforme; Contrato: Integer; Actividad, Holding: String; TipoSeleccion: TTipoSeleccion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean;
var
  bSelRangoPeriodos: Boolean;
begin
  bSelRangoPeriodos := (PerDesde <> '');
  Result := Generar_CuadroIndicesVarios(TipoInforme, TipoSeleccion, True, Contrato, Actividad, Holding, bSelRangoPeriodos, FechaActualizacion, PerDesde, PerHasta, PerDesde, PerHasta, WorkBk);
end;

function Generar_CuadroInformeSiniestralidad(Contrato: Integer; Actividad, Holding: String; TipoSeleccion: TTipoSeleccion; TipoActualizacion: TTipoActualizacion; FechaActualizacion, PerDesde, PerHasta: String; WorkBk: _WorkBook; LCID_1: LCID; VerValidaciones: Boolean): Boolean;
var
  bSelRangoPeriodos: Boolean;
begin
  bSelRangoPeriodos := (PerDesde <> '');
  Result := Generar_CuadroInformeSiniestralidad(tiInformeGralSini, TipoSeleccion, True, Contrato, Actividad, Holding, bSelRangoPeriodos, TipoActualizacion, FechaActualizacion, PerDesde, PerHasta, PerDesde, PerHasta, WorkBk, LCID_1, VerValidaciones);
end;

function Obtener_CantRegistrosCuadroEvolTrabSin: Integer;
var
  sSql: String;
begin
  sSql := 'SELECT COUNT(*) ' +
            'FROM TMP_CUADROEVOLTRABAJSIN ' +
           'WHERE MP_USUARIO = :UserId';
  Result := ValorSqlIntegerEx(sSql, [Sesion.UserId]);
end;            

procedure Obtener_PeriodoDesdeHasta_CuentaYSiniestral(CUIT, PerDesde, PerHasta: String; RangoPeriodos: Boolean; var PeriodoDesde, PeriodoHasta: String);
var
  sMaxPeriodoHasta, sMinPeriodoDesde, sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT MIN(PN_AÑO), MAX(PN_AÑO) ' +
            'FROM CPN_PONDERACION_AÑOS ' +
           'WHERE PN_FECHABAJA IS NULL';
  SqlResults := ValoresColSql(sSql);
  try
    if SqlResults[0] = '' then
      begin
        PeriodoDesde := '999912';
        PeriodoHasta := '999912';
      end
    else
      begin
        sMinPeriodoDesde := EncodePeriodo(StrToInt(SqlResults[0]), 1);
        sMaxPeriodoHasta := EncodePeriodo(StrToInt(SqlResults[1]), 12);

        if RangoPeriodos then
          begin
            PerDesde := IntToStr(Max(StrToInt(sMinPeriodoDesde), StrToInt(PerDesde)));
            PerHasta := IntToStr(Min(StrToInt(sMaxPeriodoHasta), StrToInt(PerHasta)));
          end
        else
          begin
            PerDesde := sMinPeriodoDesde;
            PerHasta := sMaxPeriodoHasta;
          end;

        if PerDesde > PerHasta then
          begin
            PeriodoDesde := '999912';
            PeriodoHasta := '999912';
          end
        else
          Obtener_PeriodoDesdeHasta(CUIT, '', '', PerDesde, PerHasta, True, PeriodoDesde, PeriodoHasta);
      end;
  finally
    SqlResults.Free;
  end;
end;

// informe general de siniestros
function Generar_CuadroInformeSiniestralidad(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; GenerarTodosContratos: Boolean; Contrato: Integer; Actividad, Holding: String; SelRangoPeriodos: Boolean; TipoActualizacion: TTipoActualizacion; FechaActualizacion, SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook; LCID_1: LCID; VerValidaciones: Boolean): Boolean;
var
  Hoja: _WorkSheet;
  Datos: _WorkSheet;
  sChart: OleVariant;
  sSeries: OleVariant;
  rRange: OleVariant;
  bAnalisisCliente, bRangoPeriodos: Boolean;
  CUIT, RazonSocial, sPeriodoAct, sPrimerPeriodo, sPos, Cell1, Cell2, Cell, sSql, sUltFila: String;
  sTitulo, sHoja, sDatos: String;
  SqlResults: TStringList;
  iFilInic, Gravedad, Tipo, i: Integer;
  iPosSolapaAC_InformeSiniestralidad, iPosSolapaAC_InformeSiniestralidad_Datos: Integer;
  snp2: TSDQuery;
begin
  bAnalisisCliente := (TipoInforme = tiAnalisisCliente);

  if bAnalisisCliente then
    begin
      iPosSolapaAC_InformeSiniestralidad       := PosSolapaAC_InformeSiniestralidad;
      iPosSolapaAC_InformeSiniestralidad_Datos := PosSolapaAC_InformeSiniestralidad_Datos;
      sHoja  := 'Informe de Siniestralidad';
      sDatos := 'Informe de Siniestralidad-Datos';
    end
  else
    begin
      iPosSolapaAC_InformeSiniestralidad       := 1;
      iPosSolapaAC_InformeSiniestralidad_Datos := 2;
      sHoja  := 'Informe';
      sDatos := 'Datos';
    end;

  Hoja      := ExclSetWorkSheet(WorkBk, iPosSolapaAC_InformeSiniestralidad);
  Hoja.Name := sHoja;

  Datos      := ExclSetWorkSheet(WorkBk, iPosSolapaAC_InformeSiniestralidad_Datos);
  Datos.Name := sDatos;

  if TipoSeleccion = tsEmpresa then
    Get_CuitNombreEmpresa(Contrato, CUIT, RazonSocial);
  bRangoPeriodos := (PerDesde <> '');

  Do_LimpiarTablaTemporal('TMP_INFORMESINIESTRALIDAD', 'MP_USUARIO', Sesion.UserId);

  case TipoActualizacion of
    taMensual:
      begin
        sSql := 'INSERT INTO TMP_INFORMESINIESTRALIDAD ' +
                     '(MP_USUARIO, MP_SINIESTRO, MP_ORDEN, MP_GRAVEDAD, MP_DIAGNOSTICOOMS, ' +
                      'MP_TIPO, MP_DIASDEBAJA) ' +
                  'SELECT :UserID, TMP.MP_SINIESTRO, TMP.MP_ORDEN, TMP.MP_GRAVEDAD, TMP.MP_DIAGNOSTICOOMS, ' +
                         'TMP.MP_TIPO, TMP.MP_DIASDEBAJA ' +
                    'FROM TMP_CUADROSSINIESTRALIDADGLSIN TMP, AGE_GRUPOECONOMICO AGE, CAC_ACTIVIDAD CAC, ACO_CONTRATO ACO, AEM_EMPRESA AEM ' +
                   'WHERE TMP.MP_USUARIO = ''A'' ' +
                     'AND TMP.MP_CUIT = AEM.EM_CUIT ' +
                     'AND ACO.CO_IDEMPRESA = AEM.EM_ID ' +
                     'AND ACO.CO_IDACTIVIDAD = CAC.AC_ID ' +
                     'AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) ' +
                     'AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) ' +
                     'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(TMP.MP_CUIT, :UserID) = ''S'' ' +
                   Iif(bRangoPeriodos, 'AND TMP.MP_PRIMERPERIODOACCIDENTE BETWEEN ' + SqlValue(PerDesde) + ' AND ' + SqlValue(PerHasta), '');
      end;
    taEnLinea:
      begin
        sSql := 'INSERT INTO TMP_INFORMESINIESTRALIDAD ' +
                     '(MP_USUARIO, MP_SINIESTRO, MP_ORDEN, MP_TIPO, MP_GRAVEDAD, MP_DIAGNOSTICOOMS, ' +
                      'MP_DIASDEBAJA) ' +
                  'SELECT :UserID, EX_SINIESTRO, EX_ORDEN, ' +
                         'ART.UTILES.IIF_CHAR(EX_TIPO, '''', ''1'', EX_TIPO), ' +
                         'NVL(LTRIM(EX_GRAVEDAD), ''1''), EX_DIAGNOSTICOOMS, ' +
                         'NVL(ART.SIN.GET_CANTDIASCAIDOSTOTALES(EX_SINIESTRO, EX_ORDEN), 0) ' +
                    'FROM SEX_EXPEDIENTES, AGE_GRUPOECONOMICO AGE, CAC_ACTIVIDAD CAC, ACO_CONTRATO ACO, AEM_EMPRESA AEM ' +
                   'WHERE NVL(EX_CAUSAFIN, ''00'') NOT IN (''02'', ''95'', ''99'') ' +
                     'AND EX_RECAIDA = 0 ' +
                     'AND EX_CUIT = AEM.EM_CUIT ' +
                     'AND ACO.CO_IDEMPRESA = AEM.EM_ID ' +
                     'AND ACO.CO_IDACTIVIDAD = CAC.AC_ID ' +
                     'AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) ' +
                     'AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) ' +
                     'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(EX_CUIT, :UserID) = ''S'' ' +
                Iif(bRangoPeriodos, ' AND TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'') BETWEEN ' + SqlValue(PerDesde) + ' AND ' + SqlValue(PerHasta), '');
      end;
  end;

  case TipoSeleccion of
    tsEmpresa:
      sSql := sSql + 'AND AEM.EM_CUIT = ' + SqlValue(CUIT);
    tsCIIU:
      sSql := sSql + 'AND CAC.AC_CODIGO LIKE ' + SqlValue(Actividad + '%');
    tsHolding:
      sSql := sSql + 'AND AGE.GE_CODIGO = ' + SqlValue(Holding);
  end;
  EjecutarSqlEx(sSql, [Sesion.UserId, Sesion.UserId]);

  case TipoSeleccion of
    tsEmpresa:
      begin
        sSql := 'SELECT UTILES.ARMAR_CUIT(EM_CUIT), CO_VIGENCIADESDE ' +
                  'FROM AEM_EMPRESA, ACO_CONTRATO ' +
                 'WHERE CO_CONTRATO = ' + SqlValue(Contrato) + ' ' +
                   'AND CO_IDEMPRESA = EM_ID ' +
                   'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(EM_CUIT, ' + SqlValue(Sesion.UserId) + ') = ''S''';
        SqlResults := ValoresColSql(sSql);
        try
          ExclSetFooter(Hoja, tfLeft, Sesion.Usuario);

          if bAnalisisCliente then
            Cell := 'B2'
          else
            Cell := 'B1';
          ExclSetCellValue(Hoja, Cell, RazonSocial);

          if bAnalisisCliente then
            Cell := 'B3'
          else
            Cell := 'B2';
          ExclSetCellValue(Hoja, Cell, SqlResults[0]);

          if bAnalisisCliente then
            Cell := 'B4'
          else
            Cell := 'B3';
          ExclSetCellValue(Hoja, Cell, Iif(GenerarTodosContratos and bAnalisisCliente, '', IntToStr(Contrato)));

          if bAnalisisCliente then
            Cell := 'B5'
          else
            Cell := 'B4';
          ExclSetCellValue(Hoja, Cell, Iif(GenerarTodosContratos and bAnalisisCliente, '', SqlResults[1]));
        finally
          SqlResults.Free;
        end;
      end;
    tsCIIU:
      begin
        if not bAnalisisCliente then
          begin
            sSql := 'SELECT AC_DESCRIPCION ' +
                      'FROM CAC_ACTIVIDAD ' +
                      'WHERE AC_CODIGO = ' + SqlValue(Actividad);
            ExclSetCellValue(Hoja, 'A1', 'Actividad:');
            ExclSetCellValue(Hoja, 'B1', ValorSql(sSql));
            ExclSetCellValue(Hoja, 'A2', 'CIIU:');
            ExclSetCellValue(Hoja, 'B2', Actividad);
            ExclSetCellValue(Hoja, 'A3', 'Cant. Empresas:');

            sSql := 'SELECT COUNT(*) ' +
                      'FROM CAC_ACTIVIDAD, ACO_CONTRATO, AEM_EMPRESA ' +
                     'WHERE CO_IDEMPRESA = EM_ID ' +
                       'AND CO_IDACTIVIDAD = AC_ID ' +
                       'AND CO_CONTRATO = GET_VULTCONTRATO(EM_CUIT) ' +
                       'AND AC_CODIGO LIKE ' + SqlValue(Actividad + '%');
            ExclSetCellValue(Hoja, 'B3', ValorSql(sSql));
            ExclSetCellValue(Hoja, 'A4', '');
          end;
      end;
    tsHolding:
      begin
        if not bAnalisisCliente then
          begin
            sSql := 'SELECT GE_DESCRIPCION ' +
                      'FROM AGE_GRUPOECONOMICO ' +
                      'WHERE GE_CODIGO = ' + SqlValue(Holding);
            ExclSetCellValue(Hoja, 'A1', 'Holding:');
            ExclSetCellValue(Hoja, 'B1', ValorSql(sSql));
            ExclSetCellValue(Hoja, 'A2', 'Código:');
            ExclSetCellValue(Hoja, 'B2', Holding);
            ExclSetCellValue(Hoja, 'A3', 'Cant. Empresas:');

            sSql := 'SELECT COUNT(*) ' +
                      'FROM AGE_GRUPOECONOMICO, ACO_CONTRATO, AEM_EMPRESA ' +
                     'WHERE CO_IDEMPRESA = EM_ID ' +
                       'AND CO_CONTRATO = GET_VULTCONTRATO(EM_CUIT) ' +
                       'AND EM_IDGRUPOECONOMICO = GE_ID ' +
                       'AND GE_CODIGO = ' + SqlValue(Holding);
            ExclSetCellValue(Hoja, 'B3', ValorSql(sSql));
            ExclSetCellValue(Hoja, 'A4', '');
          end;
      end;
  end;

  if bAnalisisCliente then
    Cell := 'E3'
  else
    Cell := 'F2';
  ExclSetCellValue(Hoja, Cell, 'F. de Impresión: ' + DateToStr(DBDate()));

  if bAnalisisCliente then
    Cell := 'E4'
  else
    Cell := 'F3';
  ExclSetCellValue(Hoja, Cell, 'F. de Actualización: ' + FechaActualizacion);
  if SelRangoPeriodos then
    begin
      if bAnalisisCliente then
        Cell := 'E5'
      else
        Cell := 'F4';
      ExclSetCellValue(Hoja, Cell, 'Periodos: ' + FormatPeriodo(SelPerDesde) + ' - ' + FormatPeriodo(SelPerHasta));
    end;

  if bAnalisisCliente then
    iFilInic := 15
  else
    iFilInic := 14;

  // a) Por Tipo de Gravedad
  sSql := 'SELECT MP_GRAVEDAD, MP_TIPO, COUNT(*) CANTIDAD ' +
            'FROM TMP_INFORMESINIESTRALIDAD ' +
           'WHERE MP_USUARIO = :UserId ' +
           'GROUP BY MP_GRAVEDAD, MP_TIPO';
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      while not Eof do
        begin
          Cell := 'C' + IntToStr(iFilInic + (FieldByName('MP_GRAVEDAD').AsInteger - 1) * 3 + (FieldByName('MP_TIPO').AsInteger - 1));
          ExclSetCellValue(Datos, Cell, IntToStr(FieldByName('CANTIDAD').AsInteger));

          Next;
        end;
    finally
      Free;
    end;

  // b) Días de Baja
  sSql := 'SELECT MP_GRAVEDAD, MP_TIPO, COUNT(*) CANTIDAD, SUM(MP_DIASDEBAJA) DIASDEBAJA ' +
            'FROM TMP_INFORMESINIESTRALIDAD ' +
           'WHERE MP_USUARIO = :UserId ' +
             'AND MP_DIASDEBAJA IS NOT NULL ' +
           'GROUP BY MP_GRAVEDAD, MP_TIPO';
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      while not Eof do
        begin
          sPos := IntToStr(iFilInic + (FieldByName('MP_GRAVEDAD').AsInteger - 1) * 3 + (FieldByName('MP_TIPO').AsInteger - 1));

          Cell := 'D' + sPos;
          ExclSetCellValue(Datos, Cell, FieldByName('CANTIDAD').AsString);

          Cell := 'E' + sPos;
          ExclSetCellValue(Datos, Cell, FieldByName('DIASDEBAJA').AsString);

          Next;
        end;
    finally
      Free;
    end;

  // Recupera el rango de periodos con accidentes para utilizarlo como referencia en la evolucion mensual
  case TipoActualizacion of
    taMensual:
      sSql := 'SELECT MIN(TMP.MP_PRIMERPERIODOACCIDENTE) PRIMERPERIODO, MAX(TMP.MP_PRIMERPERIODOACCIDENTE) ULTIMOPERIODO ' +
                'FROM TMP_CUADROSSINIESTRALIDADGLSIN TMP, AGE_GRUPOECONOMICO AGE, CAC_ACTIVIDAD CAC, ACO_CONTRATO ACO, AEM_EMPRESA AEM ' +
               'WHERE TMP.MP_USUARIO = ''A'' ' +
                 'AND TMP.MP_CUIT = AEM.EM_CUIT ' +
                 'AND ACO.CO_IDEMPRESA = AEM.EM_ID ' +
                 'AND ACO.CO_IDACTIVIDAD = CAC.AC_ID ' +
                 'AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) ' +
                 'AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) ' +
                 'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(TMP.MP_CUIT, :UserId) = ''S'' ' +
                Iif(bRangoPeriodos, 'AND TMP.MP_PRIMERPERIODOACCIDENTE BETWEEN ' + SqlValue(PerDesde) + ' AND ' + SqlValue(PerHasta), '');
    taEnLinea:
      sSql := 'SELECT TO_CHAR(MIN(EX_FECHAACCIDENTE), ''YYYYMM'') PRIMERPERIODO, TO_CHAR(MAX(EX_FECHAACCIDENTE), ''YYYYMM'') ULTIMOPERIODO ' +
                'FROM SEX_EXPEDIENTES, AGE_GRUPOECONOMICO AGE, CAC_ACTIVIDAD CAC, ACO_CONTRATO ACO, AEM_EMPRESA AEM ' +
               'WHERE EX_CUIT = AEM.EM_CUIT ' +
                 'AND ACO.CO_IDEMPRESA = AEM.EM_ID ' +
                 'AND ACO.CO_IDACTIVIDAD = CAC.AC_ID ' +
                 'AND AEM.EM_IDGRUPOECONOMICO = AGE.GE_ID(+) ' +
                 'AND ACO.CO_CONTRATO = GET_VULTCONTRATO(AEM.EM_CUIT) ' +
                 'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(EX_CUIT, :UserID) = ''S'' ' +
                 'AND NVL(EX_CAUSAFIN, ''00'') NOT IN (''02'', ''95'', ''99'') ' +
                Iif(bRangoPeriodos, ' AND TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'') BETWEEN ' + SqlValue(PerDesde) + ' AND ' + SqlValue(PerHasta), '');
  end;

  case TipoSeleccion of
    tsEmpresa:
      sSql := sSql + 'AND AEM.EM_CUIT = ' + SqlValue(CUIT);
    tsCIIU:
      sSql := sSql + 'AND CAC.AC_CODIGO LIKE ' + SqlValue(Actividad + '%');
    tsHolding:
      sSql := sSql + 'AND AGE.GE_CODIGO = ' + SqlValue(Holding);
  end;

  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      if VerValidaciones then
        Verificar(FieldByName('PRIMERPERIODO').IsNull, nil, 'No se ha podido generar el reporte porque no se han encontrado periodos a procesar.')
      else
        if FieldByName('PRIMERPERIODO').IsNull then Abort;

      if bAnalisisCliente then
        iFilInic := 35
      else
        iFilInic := 34;

      i := 0;
      sPrimerPeriodo := FieldByName('PRIMERPERIODO').AsString;
      sPeriodoAct    := AddPeriodo(sPrimerPeriodo, i);

      while sPeriodoAct <= FieldByName('ULTIMOPERIODO').AsString do
        begin
          Cell := 'A' + IntToStr(iFilInic + i);
          ExclSetCellValue(Datos, Cell, '''' + StrMid(sPeriodoAct, 5) + '/' + StrMid(sPeriodoAct, 3, 2));

          Inc(i);
          sPeriodoAct := AddPeriodo(sPrimerPeriodo, i)
        end;

      sUltFila := StrMid(Cell, 2);
    finally
      Free;
    end;

  // c) Principales Patologías
  for Gravedad := 1 to 4 do
    begin
      // Datos globales
      sSql := 'SELECT MP_DIAGNOSTICOOMS, DG_DESCRIPCION, COUNT(*) CANTIDAD ' +
                'FROM TMP_INFORMESINIESTRALIDAD, CDG_DIAGNOSTICO ' +
               'WHERE MP_USUARIO = :UserId ' +
                 'AND MP_GRAVEDAD = :Gravedad ' +
                 'AND MP_DIAGNOSTICOOMS = DG_CODIGO(+) ' +
                 'AND MP_DIAGNOSTICOOMS IS NOT NULL ' +
               'GROUP BY MP_DIAGNOSTICOOMS, DG_DESCRIPCION ' +
               'ORDER BY COUNT(*) DESC';
      with GetQueryEx(sSql, [Sesion.UserId, Gravedad]) do
        try
          i := 0;
          while not Eof and (i < 5) do
            begin
              sPos := IntToStr(4 + (Gravedad - 1));

              Cell := Chr(Ord('G') + i * 2) + sPos;
              ExclSetCellValue(Datos, Cell, FieldByName('MP_DIAGNOSTICOOMS').AsString + ' - ' + FieldByName('DG_DESCRIPCION').AsString);

              Cell := Chr(Ord('H') + i * 2) + sPos;
              ExclSetCellValue(Datos, Cell, FieldByName('CANTIDAD').AsString);

              // Para cada patología analiza la evolucion mensual
              sSql := 'SELECT TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'') PERIODO, COUNT(*) CANTIDAD ' +
                        'FROM TMP_INFORMESINIESTRALIDAD, SEX_EXPEDIENTES ' +
                       'WHERE EX_SINIESTRO = MP_SINIESTRO ' +
                         'AND EX_ORDEN = MP_ORDEN ' +
                         'AND EX_RECAIDA = 0 ' +
                         'AND MP_USUARIO = :UserId ' +
                         'AND MP_GRAVEDAD = :Gravedad ' +
                         'AND MP_DIAGNOSTICOOMS = :DiagnosticoOMS ' +
                       'GROUP BY TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'')';
              snp2 := GetQueryEx(sSql, [Sesion.UserId, Gravedad, FieldByName('MP_DIAGNOSTICOOMS').AsString]);
              try
                while not snp2.Eof do
                  begin
                    Cell := Chr(Ord('B') + (Gravedad - 1) * 5 + i) + IntToStr(34 + PeriodosContarCantidad(sPrimerPeriodo, snp2.FieldByName('PERIODO').AsString) - 1);
                    ExclSetCellValue(Datos, Cell, snp2.FieldByName('CANTIDAD').AsString);

                    snp2.Next;
                  end;
              finally
                snp2.Free;
              end;

              Inc(i);
              Next;
            end;
        finally
          Free;
        end;

      for Tipo := 1 to 3 do
        begin
          // Datos por Tipo
          sSql := 'SELECT MP_DIAGNOSTICOOMS, DG_DESCRIPCION, COUNT(*) CANTIDAD ' +
                    'FROM TMP_INFORMESINIESTRALIDAD, CDG_DIAGNOSTICO ' +
                   'WHERE MP_USUARIO = :UserId ' +
                     'AND MP_GRAVEDAD = :Gravedad ' +
                     'AND MP_TIPO = :Tipo ' +
                     'AND MP_DIAGNOSTICOOMS = DG_CODIGO(+) ' +
                     'AND MP_DIAGNOSTICOOMS IS NOT NULL ' +
                   'GROUP BY MP_DIAGNOSTICOOMS, DG_DESCRIPCION ' +
                   'ORDER BY COUNT(*) DESC';
          snp2 := GetQueryEx(sSql, [Sesion.UserId, Gravedad, Tipo]);
          try
            i := 0;
            while not snp2.Eof and (i < 5) do
              begin
                sPos := IntToStr(14 + (Gravedad - 1) * 3 + (Tipo - 1));

                Cell := Chr(Ord('G') + i * 2) + sPos;
                ExclSetCellValue(Datos, Cell, snp2.FieldByName('MP_DIAGNOSTICOOMS').AsString + ' - ' + snp2.FieldByName('DG_DESCRIPCION').AsString);

                Cell := Chr(Ord('H') + i * 2) + sPos;
                ExclSetCellValue(Datos, Cell, snp2.FieldByName('CANTIDAD').AsString);

                Inc(i);
                snp2.Next;
              end;
          finally
            snp2.Free;
          end;
        end;  // Tipo
    end;      // Gravedad

  // c) Principales Patologías - Recuento de casos sin clasificar
  sSql := 'SELECT MP_GRAVEDAD, MP_TIPO, COUNT(*) CANTIDAD ' +
            'FROM TMP_INFORMESINIESTRALIDAD ' +
           'WHERE MP_USUARIO = :UserId ' +
             'AND MP_DIAGNOSTICOOMS IS NULL ' +
           'GROUP BY MP_GRAVEDAD, MP_TIPO';
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      while not Eof do
        begin
          Cell := 'Q' + IntToStr(14 + (FieldByName('MP_GRAVEDAD').AsInteger - 1) * 3 + (FieldByName('MP_TIPO').AsInteger - 1));
          ExclSetCellValue(Datos, Cell, FieldByName('CANTIDAD').AsString);

          Next;
        end;
    finally
      Free;
    end;

  // c) Principales Patologías - Sin gravedad (agregado 29.12.08)
  // Datos globales
  if bAnalisisCliente then
    begin
      sSql := 'SELECT MP_DIAGNOSTICOOMS, DG_DESCRIPCION, COUNT(*) CANTIDAD ' +
                'FROM TMP_INFORMESINIESTRALIDAD, CDG_DIAGNOSTICO ' +
               'WHERE MP_USUARIO = :UserId ' +
                 'AND MP_DIAGNOSTICOOMS = DG_CODIGO(+) ' +
                 'AND MP_DIAGNOSTICOOMS IS NOT NULL ' +
               'GROUP BY MP_DIAGNOSTICOOMS, DG_DESCRIPCION ' +
               'ORDER BY COUNT(*) DESC';
      with GetQueryEx(sSql, [Sesion.UserId]) do
        try
          i := 0;
          while not Eof and (i < 5) do
            begin
              sPos := '9';

              Cell := Chr(Ord('G') + i * 2) + sPos;
              ExclSetCellValue(Datos, Cell, FieldByName('MP_DIAGNOSTICOOMS').AsString + ' - ' + FieldByName('DG_DESCRIPCION').AsString);

              Cell := Chr(Ord('H') + i * 2) + sPos;
              ExclSetCellValue(Datos, Cell, FieldByName('CANTIDAD').AsString);

              // Para cada patología analiza la evolucion mensual
              sSql := 'SELECT TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'') PERIODO, COUNT(*) CANTIDAD ' +
                        'FROM TMP_INFORMESINIESTRALIDAD, SEX_EXPEDIENTES ' +
                       'WHERE EX_SINIESTRO = MP_SINIESTRO ' +
                         'AND EX_ORDEN = MP_ORDEN ' +
                         'AND EX_RECAIDA = 0 ' +
                         'AND MP_USUARIO = :UserId ' +
                         'AND MP_DIAGNOSTICOOMS = :DiagnosticoOMS ' +
                       'GROUP BY TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'')';
              snp2 := GetQueryEx(sSql, [Sesion.UserId, FieldByName('MP_DIAGNOSTICOOMS').AsString]);
              try
                while not snp2.Eof do
                  begin
                    Cell := Chr(Ord('V') + i) + IntToStr(34 + PeriodosContarCantidad(sPrimerPeriodo, snp2.FieldByName('PERIODO').AsString) - 1);
                    ExclSetCellValue(Datos, Cell, snp2.FieldByName('CANTIDAD').AsString);

                    snp2.Next;
                  end;
              finally
                snp2.Free;
              end;

              Inc(i);
              Next;
            end;
        finally
          Free;
        end;
    end;

  if bAnalisisCliente then
    begin
      // Principales Patologías - Sin gravedad (agregado 29.12.08 que reemplaza los 2 for anidados anteriores para no tener 5 graficos por cada una de las 4 gravedades, sino 5 graficos en total)
      for i := 0 to 4 do
        begin
          sChart  := ExclGetChart(Hoja, 5 + i, LCID_1);
          sSeries := ExclGetChartSerie(sChart, 1);

          Cell   := Chr(Ord('G') + i * 2) + '9';
          rRange := ExclGetRange(Datos, Cell, Cell);
          sSeries.Name := rRange;

          if sUltFila = '34' then  // 05/07/13 - cuando se llama a ExclSetXValuesSerie o a ExclSetValuesSerie, se termina llamando a ExclInternalSetValuesSerie, y cuando hace por ej. esta asignación:
            sUltFila := '35';      // Serie.XValues := rRange, donde rRange hace referencia a un rango de una sola celda, entonces extrañamente da error (ole error 800A03EC). Por eso, esta solución de compromiso

          Cell1  := 'A34';
          Cell2  := 'A' + sUltFila;
          ExclSetXValuesSerie(Datos, sSeries, Cell1, Cell2);

          sPos   := Chr(Ord('V') + i);
          Cell1  := spos + '34';
          Cell2  := spos + sUltFila;
          ExclSetValuesSerie(Datos, sSeries, Cell1, Cell2);
        end;
    end
  else
    begin
      for Gravedad := 1 to 4 do
        for i := 0 to 4 do
          begin
            sChart  := ExclGetChart(Hoja, 5 + (Gravedad - 1) * 5 + i, LCID_1);
            sSeries := ExclGetChartSerie(sChart, 1);

            Cell   := Chr(Ord('G') + i * 2) + IntToStr(4 + (Gravedad - 1));
            rRange :=  ExclGetRange(Datos, Cell, Cell);
            sSeries.Name := rRange;

            if sUltFila = '34' then  // 05/07/13 - cuando se llama a ExclSetXValuesSerie o a ExclSetValuesSerie, se termina llamando a ExclInternalSetValuesSerie, y cuando hace por ej. esta asignación:
              sUltFila := '35';      // Serie.XValues := rRange, donde rRange hace referencia a un rango de una sola celda, entonces extrañamente da error (ole error 800A03EC). Por eso, esta solución de compromiso

            Cell1  := 'A34';
            Cell2  := 'A' + sUltFila;
            ExclSetXValuesSerie(Datos, sSeries, Cell1, Cell2);

            sPos   := Chr(Ord('B') + (Gravedad - 1) * 5 + i);
            Cell1  := spos + '34';
            Cell2  := spos + sUltFila;
            ExclSetValuesSerie(Datos, sSeries, Cell1, Cell2);
          end;
    end;

  Result := True;
end;

// evoluc. mens. de trabajad. cubiertos y siniestros
function Generar_CuadroEvolTrabajSiniestros(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; GenerarTodosContratos: Boolean; Contrato: Integer; Actividad, Holding: String; SelRangoPeriodos: Boolean; FechaActualizacion, SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean;
var
  Hoja: _WorkSheet;
  bRangoPeriodos: Boolean;
  CUIT, RazonSocial, sPosFil, Col, Cell, sSql, sSeleccion, sPerDesde, sPerHasta: String;
  iPos, iFil, iTopeInsercion, iTotFilas: Integer;
  iPosSolapa_EvolucionMensual: Integer;
const
  ColInic = 'A';
  FilInic = 5;
begin
  if TipoInforme = tiAnalisisCliente then
    iPosSolapa_EvolucionMensual := PosSolapaAC_EvolucionMensual
  else
    iPosSolapa_EvolucionMensual := 1;

  Hoja      := ExclSetWorkSheet(WorkBk, iPosSolapa_EvolucionMensual);
  Hoja.Name := 'Evolucion Mensual';

  if TipoSeleccion = tsEmpresa then
    Get_CuitNombreEmpresa(Contrato, CUIT, RazonSocial);

  bRangoPeriodos := (PerDesde <> '');
  Obtener_PeriodoDesdeHasta(CUIT, Actividad, Holding, PerDesde, PerHasta, bRangoPeriodos, sPerDesde, sPerHasta);

  sSeleccion := GetDescrTipoSeleccion(TipoSeleccion, RazonSocial, Actividad, Holding, SelRangoPeriodos, SelPerDesde, SelPerHasta);

  case TipoSeleccion of
    tsEmpresa:
      begin
        sSql := 'ART.SIN.GENERARTEMP_INCIDENCIAEMPRESA(''N'', :Cuit, :UserId, :PerDesde, :PerHasta);';
        EjecutarStoreEx(sSql, [CUIT, Sesion.UserId, sPerDesde, sPerHasta]);
      end;
    tsCIIU:
      begin
        sSql := 'ART.SIN.GENERARTEMP_INCIDENCIAACTIV(''N'', :Actividad, :UserId, :PerDesde, :PerHasta);';
        EjecutarStoreEx(sSql, [Actividad, Sesion.UserId, sPerDesde, sPerHasta]);
      end;
    tsHolding:   // este proceso no existe
      begin
        sSql := 'ART.SIN.GENERARTEMP_INCIDENCIAHOLDING(''N'', :Holding, :UserId, :PerDesde, :PerHasta);';
        EjecutarStoreEx(sSql, [Holding, Sesion.UserId, sPerDesde, sPerHasta]);
      end;
    tsTodos:
      begin
        sSql := 'ART.SIN.GENERARTEMP_INCIDENCIAEMPRESA(''N'', NULL, :UserId, :PerDesde, :PerHasta);';
        EjecutarStoreEx(sSql, [Sesion.UserId, sPerDesde, sPerHasta]);
      end;
  end;

  if TipoInforme = tiAnalisisCliente then
    ExclSetFooter(Hoja, tfLeft, Sesion.Usuario)
  else
    ExclSetFooter(Hoja, tfLeft, CRLF + Sesion.Usuario, '', 7);

  ExclSetCellValue(Hoja, 'SubTitulo', sSeleccion);
  ExclSetCellValue(Hoja, 'Fecha', DateToStr(DBDate()));
  ExclSetCellValue(Hoja, 'FechaActualizacion', 'F. de Actualización: ' + FechaActualizacion);

  iFil := FilInic;

  iTotFilas      := Obtener_CantRegistrosCuadroEvolTrabSin();
  iTopeInsercion := iTotFilas + FilInic - 2;

  sSql := 'SELECT NVL(MP_CANTTRABAJADORES, 0) CANTTRABAJADORES, NVL(MP_SINIESTROS_LT, 0) SINIESTROS_LT, ' +
                 'NVL(MP_SINIESTROS_II, 0) SINIESTROS_II, NVL(MP_SINIESTROS_EP, 0) SINIESTROS_EP, ' +
                 'NVL(MP_SINIESTROS_TOTAL, 0) SINIESTROS_TOTAL, NVL(MP_PORCINCIDENCIA_LT, 0) PORCINCIDENCIA_LT, ' +
                 'NVL(MP_PORCINCIDENCIA_II, 0) PORCINCIDENCIA_II, NVL(MP_PORCINCIDENCIA_EP, 0) PORCINCIDENCIA_EP, ' +
                 'NVL(MP_PORCINCIDENCIA_TOTAL, 0) PORCINCIDENCIA_TOTAL, ART.UTILES.ARMAR_PERIODO(MP_PERIODO) PERIODO ' +
            'FROM TMP_CUADROEVOLTRABAJSIN ' +
           'WHERE MP_USUARIO = :UserId ' +
           'ORDER BY MP_PERIODO';
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      while not Eof do
        begin
          sPosFil := IntToStr(iFil);

          if (iFil >= FilInic + 1) and (iFil <= iTopeInsercion) then
            begin
              Cell := sPosFil + ':' + sPosFil;
              ExclInsertRow(Hoja, Cell);
            end;

          iPos := Ord(ColInic);

          // Período
          Col  := Chr(iPos + 0);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PERIODO').AsString);

          // Cant. de trabajadores
          Col  := Chr(iPos + 1);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('CANTTRABAJADORES').AsInteger);

          // Siniestros Lug. de Trabajo
          Col  := Chr(iPos + 2);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_LT').AsInteger);

          // Siniestros In Itinere
          Col  := Chr(iPos + 3);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_II').AsInteger);

          // Siniestros Enf. Profesional
          Col  := Chr(iPos + 4);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_EP').AsInteger);

          // Siniestros Total
          Col  := Chr(iPos + 5);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_TOTAL').AsInteger);

          // Porc. Incidencia Lug. de Trabajo
          Col  := Chr(iPos + 6);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_LT').AsFloat);

          // Porc. Incidencia In Itinere
          Col  := Chr(iPos + 7);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_II').AsFloat);

          // Porc. Incidencia Enf. Profesional
          Col  := Chr(iPos + 8);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_EP').AsFloat);

          // Porc. Incidencia Total
          Col  := Chr(iPos + 9);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_TOTAL').AsFloat);

          inc(iFil);

          Next;
        end;
    finally
      Free;
    end;

  Result := True;
end;

function Generar_CuadroIndicesVarios_GravMort(TipoInforme: TTipoInforme; FechaActualizacion, Seleccion: String; WorkBk: _WorkBook): Boolean;
var
  Hoja: _WorkSheet;
  sPosFil, Col, Cell, sSql: String;
  iPos, iFil, iTopeInsercion, iTotFilas: Integer;
  iPosSolapaAC_IndicesVarios_GravMort: Integer;
const
  ColInic = 'A';
  FilInic = 5;
begin
  if TipoInforme = tiAnalisisCliente then
    iPosSolapaAC_IndicesVarios_GravMort := PosSolapaAC_IndicesVarios_GravMort
  else
    iPosSolapaAC_IndicesVarios_GravMort := 1;

  Hoja      := ExclSetWorkSheet(WorkBk, iPosSolapaAC_IndicesVarios_GravMort);
  Hoja.Name := 'Graves y Mortales';

  ExclSetFooter(Hoja, tfLeft, Sesion.Usuario);

  ExclSetCellValue(Hoja, 'SubTitulo', Seleccion);
  ExclSetCellValue(Hoja, 'Fecha', DateToStr(DBDate()));
  ExclSetCellValue(Hoja, 'FechaActualizacion', 'F. de Actualización: ' + FechaActualizacion);

  iFil := FilInic;

  iTotFilas      := Obtener_CantRegistrosCuadroEvolTrabSin();
  iTopeInsercion := iTotFilas + FilInic - 2;

  sSql := 'SELECT NVL(MP_CANTTRABAJADORES, 0) CANTTRABAJADORES, NVL(MP_SINIESTROS_GRAVES, 0) SINIESTROS_GRAVES, ' +
                 'NVL(MP_SINIESTROS_MORTALES, 0) SINIESTROS_MORTALES, NVL(MP_PORCINCIDENCIA_GRAVES, 0) PORCINCIDENCIA_GRAVES, ' +
                 'NVL(MP_PORCINCIDENCIA_MORTALES, 0) PORCINCIDENCIA_MORTALES, ART.UTILES.ARMAR_PERIODO(MP_PERIODO) PERIODO ' +
            'FROM TMP_CUADROEVOLTRABAJSIN ' +
           'WHERE MP_USUARIO = :UserId ' +
           'ORDER BY MP_PERIODO';
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      while not Eof do
        begin
          sPosFil := IntToStr(iFil);

          if (iFil >= FilInic + 1) and (iFil <= iTopeInsercion) then
            begin
              Cell := sPosFil + ':' + sPosFil;
              ExclInsertRow(Hoja, Cell);
            end;

          iPos := Ord(ColInic);

          // Período
          Col  := Chr(iPos + 0);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PERIODO').AsString);

          // Cant. de trabajadores
          Col  := Chr(iPos + 1);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('CANTTRABAJADORES').AsInteger);

          // Siniestros Graves
          Col  := Chr(iPos + 2);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_GRAVES').AsInteger);

          // Siniestros Mortales
          Col  := Chr(iPos + 3);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_MORTALES').AsInteger);

          // Porc. Incidencia Graves
          Col  := Chr(iPos + 4);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_GRAVES').AsFloat);

          // Porc. Incidencia Mortales
          Col  := Chr(iPos + 5);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_MORTALES').AsFloat);

          inc(iFil);

          Next;
        end;
    finally
      Free;
    end;

  Result := True;
end;

function Generar_CuadroIndicesVarios_Incapacidades(FechaActualizacion, Seleccion: String; WorkBk: _WorkBook): Boolean;
var
  Hoja: _WorkSheet;
  sPosFil, Col, Cell, sSql: String;
  iPos, iFil, iTopeInsercion, iTotFilas: Integer;
  iPosSolapaAC_IndicesVarios_Incapacidades: Integer;
  dPorcIncapSin: Double;
const
  ColInic = 'A';
  FilInic = 5;
begin
  iPosSolapaAC_IndicesVarios_Incapacidades := 1;

  Hoja      := ExclSetWorkSheet(WorkBk, iPosSolapaAC_IndicesVarios_Incapacidades);
  Hoja.Name := 'Incapacidades';

  ExclSetFooter(Hoja, tfLeft, CRLF + Sesion.Usuario, '', 7);

  ExclSetCellValue(Hoja, 'SubTitulo', Seleccion);
  ExclSetCellValue(Hoja, 'Fecha', DateToStr(DBDate()));
  ExclSetCellValue(Hoja, 'FechaActualizacion', 'F. de Actualización: ' + FechaActualizacion);

  iFil := FilInic;

  iTotFilas      := Obtener_CantRegistrosCuadroEvolTrabSin();
  iTopeInsercion := iTotFilas + FilInic - 2;

  sSql := 'SELECT NVL(MP_CANTTRABAJADORES, 0) CANTTRABAJADORES, NVL(MP_INC_CANTIDAD, 0) INCAPACIDADES, ' +
                 'NVL(MP_INCPAGADAS_CANTIDAD, 0) INCAPACIDADES_PAGADASCANT, ' +
                 'NVL(MP_INCPAGADAS_IMPORTE, 0) INCAPACIDADES_PAGADASIMP, ' +
                 'NVL(MP_INCRESERVADAS_CANTIDAD, 0) INCAPACIDADES_RESERVADASCANT, ' +
                 'NVL(MP_INCRESERVADAS_IMPORTE, 0) INCAPACIDADES_RESERVADASIMP, ' +
                 'NVL(MP_SINIESTROS_TOTAL, 0) SINIESTROS_TOTAL, ' +
                 'NVL(MP_PORCINCIDENCIA_INC, 0) PORCINCIDENCIA_INCAPACIDADES, ' +
                 'ART.UTILES.ARMAR_PERIODO(MP_PERIODO) PERIODO ' +
            'FROM TMP_CUADROEVOLTRABAJSIN ' +
           'WHERE MP_USUARIO = :UserId ' +
           'ORDER BY MP_PERIODO';
  with GetQueryEx(sSql, [Sesion.UserId]) do
    try
      while not Eof do
        begin
          sPosFil := IntToStr(iFil);

          if (iFil >= FilInic + 1) and (iFil <= iTopeInsercion) then
            begin
              Cell := sPosFil + ':' + sPosFil;
              ExclInsertRow(Hoja, Cell);
            end;

          iPos := Ord(ColInic);

          // Período
          Col  := Chr(iPos + 0);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PERIODO').AsString);

          // Cant. de trabajadores
          Col  := Chr(iPos + 1);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('CANTTRABAJADORES').AsInteger);

          // Cant. de incapacidades
          Col  := Chr(iPos + 2);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('INCAPACIDADES').AsInteger);

          // Cant. de incapacidades pagadas
          Col  := Chr(iPos + 3);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('INCAPACIDADES_PAGADASCANT').AsInteger);

          // Importe de incapacidades pagadas
          Col  := Chr(iPos + 4);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('INCAPACIDADES_PAGADASIMP').AsFloat);

          // Cant. de incapacidades reservadas
          Col  := Chr(iPos + 5);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('INCAPACIDADES_RESERVADASCANT').AsInteger);

          // Importe de incapacidades reservadas
          Col  := Chr(iPos + 6);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('INCAPACIDADES_RESERVADASIMP').AsFloat);

          // Cant. de siniestros
          Col  := Chr(iPos + 7);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_TOTAL').AsInteger);

          // Porc. Incidencia Incapacidades
          Col  := Chr(iPos + 8);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('PORCINCIDENCIA_INCAPACIDADES').AsFloat);

          // Porc. Incapacidades respecto a los Siniestros
          Col  := Chr(iPos + 9);
          Cell := Col + sPosFil;
          if FieldByName('SINIESTROS_TOTAL').AsInteger = 0 then
            dPorcIncapSin := 0
          else
            dPorcIncapSin := FieldByName('INCAPACIDADES').AsInteger / FieldByName('SINIESTROS_TOTAL').AsInteger * 100;
          ExclSetCellValue(Hoja, Cell, dPorcIncapSin);

          inc(iFil);

          Next;
        end;
    finally
      Free;
    end;

  Result := True;
end;

function Generar_CuadroIndicesVarios(TipoInforme: TTipoInforme; TipoSeleccion: TTipoSeleccion; GenerarTodosContratos: Boolean; Contrato: Integer; Actividad, Holding: String; SelRangoPeriodos: Boolean; FechaActualizacion, SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook): Boolean;
var
  sSeleccion, CUIT, RazonSocial, sSql, sProceso, sParametros: String;
  sPerDesde, sPerHasta: String;
  bRangoPeriodos, bGravMort: Boolean;
begin
  bGravMort := (TipoInforme in [tiIndVariosGravesMortales, tiAnalisisCliente]);

  if TipoSeleccion = tsEmpresa then
    Get_CuitNombreEmpresa(Contrato, CUIT, RazonSocial);

  bRangoPeriodos := (PerDesde <> '');
  Obtener_PeriodoDesdeHasta(CUIT, Actividad, Holding, PerDesde, PerHasta, bRangoPeriodos, sPerDesde, sPerHasta);

  case TipoSeleccion of
    tsEmpresa:
      begin
        if bGravMort then
          sProceso := 'ART.SIN.GENERARTEMP_GRAVMORTEMPRESA'
        else
          sProceso := 'ART.SIN.GENERARTEMP_INCAPACEMPRESA';

        sParametros := '(:Cuit, :UserId, :PerDesde, :PerHasta);';

        sSql := sProceso + sParametros;
        EjecutarStoreEx(sSql, [CUIT, Sesion.UserId, sPerDesde, sPerHasta]);
      end;
    tsCIIU:
      begin
        if bGravMort then
          sProceso := 'ART.SIN.GENERARTEMP_GRAVMORTACTIV'
        else
          sProceso := 'ART.SIN.GENERARTEMP_INCAPACACTIV';

        sParametros := '(:Actividad, :UserId, :PerDesde, :PerHasta);';

        sSql := sProceso + sParametros;
        EjecutarStoreEx(sSql, [Actividad, Sesion.UserId, sPerDesde, sPerHasta]);
      end;
    tsHolding:   // estos 2 procesos no existen
      begin
        if bGravMort then
          sProceso := 'ART.SIN.GENERARTEMP_GRAVMORTHOLDING'
        else
          sProceso := 'ART.SIN.GENERARTEMP_INCAPACHOLDING';

        sParametros := '(:Holding, :UserId, :PerDesde, :PerHasta);';

        sSql := sProceso + sParametros;
        EjecutarStoreEx(sSql, [Holding, Sesion.UserId, sPerDesde, sPerHasta]);
      end;
    tsTodos:
      begin
        if bGravMort then
          sProceso := 'ART.SIN.GENERARTEMP_GRAVMORTEMPRESA'
        else
          sProceso := 'ART.SIN.GENERARTEMP_INCAPACEMPRESA';

        sParametros := '(NULL, :UserId, :PerDesde, :PerHasta);';

        sSql := sProceso + sParametros;
        EjecutarStoreEx(sSql, [Sesion.UserId, sPerDesde, sPerHasta]);
      end;
  end;

  sSeleccion := GetDescrTipoSeleccion(TipoSeleccion, RazonSocial, Actividad, Holding, SelRangoPeriodos, SelPerDesde, SelPerHasta);

  if bGravMort then
    Result := Generar_CuadroIndicesVarios_GravMort(TipoInforme, FechaActualizacion, sSeleccion, WorkBk)
  else
    Result := Generar_CuadroIndicesVarios_Incapacidades(FechaActualizacion, sSeleccion, WorkBk);
end;

function Generar_CuadroInformacionCuentaYSiniestral(TipoInforme: TTipoInforme; GenerarTodosContratos: Boolean; Contrato: Integer; SelRangoPeriodos: Boolean; SelPerDesde, SelPerHasta, PerDesde, PerHasta: String; WorkBk: _WorkBook; VerValidaciones: Boolean): Boolean;
var
  Hoja: _WorkSheet;
  sPerDesde, sPerHasta, sSqlFW, Cell, Cell2, Col, sPosFil, sSql: String;
  CUIT, RazonSocial, sUltPerHasta, sPerDesdeAnio, sPerHastaAnio: String;
  iFilDatosSiniestral, iTopeInsercion, iTotFilas, iTrabajadores, iFil, iPos: Integer;
  iAnio, iAnioHasta, iAnioDesde, iDummy: Word;
  dSumaFija,  dMasaSalarial, dPrimaAnualTotal, dPrimaAnualPersona, dSalarioPromedio: Currency;
  dFactorPonderacionAnio, dPorcMasa: Double;
  bHuboInsercion, bFilaInsertada, bRangoPeriodos: Boolean;
  iPosSolapaAC_InformacionCuentaYSiniestral: Integer;
const
  ColDatosEmpresa    = 'G';
  FilDatosEmpresa    = 6;
  ColDatosCuenta     = 'A';
  FilDatosCuenta     = 20;
  ColDatosSiniestral = 'A';
  FilDatosSiniestral = 26;
begin
  Result := False;

  if TipoInforme = tiAnalisisCliente then
    iPosSolapaAC_InformacionCuentaYSiniestral := PosSolapaAC_InformacionCuentaYSiniestral
  else
    iPosSolapaAC_InformacionCuentaYSiniestral := 1;  // este caso no se da, solo es para Análisis del Cliente

  Hoja      := ExclSetWorkSheet(WorkBk, iPosSolapaAC_InformacionCuentaYSiniestral);
  Hoja.Name := 'Informacion Cuenta y Siniestral';

  Get_CuitNombreEmpresa(Contrato, CUIT, RazonSocial);
  bRangoPeriodos := (PerDesde <> '');

  Obtener_PeriodoDesdeHasta_CuentaYSiniestral(CUIT, PerDesde, PerHasta, bRangoPeriodos, sPerDesde, sPerHasta);
  if VerValidaciones then
    Verificar(sPerHasta = '999912', nil, 'No se ha podido generar el reporte porque hay problemas con los años de ponderación actualmente definidos.')
  else
    if sPerHasta = '999912' then Abort;

  sSql := 'ART.SIN.GENERARTEMPORAL_GRAVMORT(''N'', :Cuit, '''', :UserId);';
  EjecutarStoreEx(sSql, [CUIT, Sesion.UserId]);

  sUltPerHasta := NVL(PerHasta, GetPeriodo(DBDate, fpAnioMes));
  // Datos de la Empresa
  sSql := 'SELECT UTILES.ARMAR_CUIT(EM_CUIT) CUIT, AC_CODIGO || '' '' ||AC_DESCRIPCION ACTIVIDAD, ' +
                 'EMI.UTILES.GET_EMPLEADOS(CO_CONTRATO, :Hasta) EMPLEADOS, ' +
                 'EMI.UTILES.GET_MASA(CO_CONTRATO, :Hasta) MASASALARIAL,  CO_VIGENCIADESDE VIGENCIADESDE, ' +
                 'AFILIACION.GET_SUMA_FIJA(CO_CONTRATO, :Hasta) SUMAFIJA, ' +
                 'AFILIACION.GET_PORCMASA(CO_CONTRATO, :Hasta)/100 PORCMASA, ' +
                 'CO_DIASFRANQUICIA DIASFRANQUICIA ' +
            'FROM CAC_ACTIVIDAD, AEM_EMPRESA, ACO_CONTRATO ' +
           'WHERE CO_CONTRATO = :Contrato ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND CO_IDACTIVIDAD = AC_ID ' +
             'AND ART.SIN.INCLUIREMPRESA_INFSINIESTRAL(EM_CUIT, :UserId) = ''S''';
  with GetQueryEx(sSql, [sUltPerHasta, sUltPerHasta, sUltPerHasta, sUltPerHasta, Contrato, Sesion.UserId]) do
    try
      if Eof then
        begin
          InfoHint(nil, 'No se han encontrado datos de la empresa', False, 'Información', blnError, 10);
          Exit
        end
      else
        begin
          ExclSetFooter(Hoja, tfLeft, Sesion.Usuario);

          DecodePeriodo(sPerDesde, iAnioDesde, iDummy);
          DecodePeriodo(sPerHasta, iAnioHasta, iDummy);

          ExclSetCellValue(Hoja, 'CONTRATO', 'Contrato Vigente: ' + IntToStr(Contrato));
          ExclSetCellValue(Hoja, 'FECHAIMPRESION', DBDate());

          iTrabajadores := FieldByName('EMPLEADOS').AsInteger;
          dMasaSalarial := FieldByName('MASASALARIAL').AsFloat;

          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa),   FieldByName('CUIT').AsString);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+1), RazonSocial);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+2), FieldByName('ACTIVIDAD').AsString);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+3), iTrabajadores);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+4), dMasaSalarial);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+6), FieldByName('VIGENCIADESDE').AsDateTime);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+7), FieldByName('SUMAFIJA').AsFloat);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+8), FieldByName('PORCMASA').AsFloat);
          ExclSetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+9), FieldByName('DIASFRANQUICIA').AsInteger);
        end;
    finally
      Free;
    end;


  // Datos de la Cuenta
  dSalarioPromedio := ExclGetCellValue(Hoja, ColDatosEmpresa + IntToStr(FilDatosEmpresa+5));

  iFil := FilDatosCuenta;

  sSqlFW := 'FROM AHT_HISTORICOTARIFARIO ' +
           'WHERE HT_ID IN (SELECT MAX(HT_ID) ' +
                             'FROM AHT_HISTORICOTARIFARIO, AEM_EMPRESA, ACO_CONTRATO, AEN_ENDOSO ' +
                            'WHERE HT_CONTRATO = CO_CONTRATO ' +
                              'AND EN_IDHISTORICOTARIFA = HT_ID ' +
                              'AND CO_IDEMPRESA = EM_ID ' +
                              'AND EM_CUIT = :Cuit ' +
                              Iif(bRangoPeriodos, 'AND TO_CHAR(HT_VIGENCIATARIFA, ''YYYYMM'') BETWEEN ' + SqlValue(PerDesde) + ' AND ' + SqlValue(PerHasta), '') + ' ' +
                            'GROUP BY TO_CHAR(HT_VIGENCIATARIFA, ''YYYYMM'')) ' +
           'ORDER BY HT_VIGENCIATARIFA';

  sSql := 'SELECT COUNT(*) ' +
          sSqlFW;

  iTotFilas      := ValorSqlIntegerEx(sSql, [CUIT]);
  iTopeInsercion := iTotFilas + FilDatosCuenta - 2;
  bHuboInsercion := False;

  sSql := 'SELECT DISTINCT HT_VIGENCIATARIFA VIGENCIATARIFA, HT_SUMAFIJA SUMAFIJA, HT_PORCMASA/100 PORCMASA ' +
          sSqlFW;
  with GetQueryEx(sSql, [CUIT]) do
    try
      while not Eof do
        begin
          sPosFil := IntToStr(iFil);

          if (iFil >= FilDatosCuenta + 1) and (iFil <= iTopeInsercion) then
            begin
              Cell := sPosFil + ':' + sPosFil;
              ExclInsertRow(Hoja, Cell);
              bFilaInsertada := True;
              bHuboInsercion := True;
            end
          else
            bFilaInsertada := False;

          iPos := Ord(ColDatosCuenta);

          // Vigencia
          Col  := Chr(iPos + 0);
          Cell := Col + sPosFil;
          ExclSetCellValue(Hoja, Cell, FieldByName('VIGENCIATARIFA').AsDateTime);

          // Suma Fija
          Col  := Chr(iPos + 1);
          Cell := Col + sPosFil;
          dSumaFija := FieldByName('SUMAFIJA').AsFloat;
          ExclSetCellValue(Hoja, Cell, dSumaFija);
          if bFilaInsertada then
            begin
              Col   := Chr(iPos + 3);
              Cell2 := Col + sPosFil;
              ExclMergeCells(Hoja, Cell, Cell2);
            end;

          // Porc. Masa
          Col  := Chr(iPos + 4);
          Cell := Col + sPosFil;
          dPorcMasa := FieldByName('PORCMASA').AsFloat;
          ExclSetCellValue(Hoja, Cell, dPorcMasa);
          if bFilaInsertada then
            begin
              Col   := Chr(iPos + 5);
              Cell2 := Col + sPosFil;
              ExclMergeCells(Hoja, Cell, Cell2);
            end;

          // Prima Anual por Persona
          Col  := Chr(iPos + 6);
          Cell := Col + sPosFil;
          dPrimaAnualPersona := (dSalarioPromedio * dPorcMasa) + dSumaFija;
          ExclSetCellValue(Hoja, Cell, dPrimaAnualPersona);
          if bFilaInsertada then
            begin
              Col   := Chr(iPos + 7);
              Cell2 := Col + sPosFil;
              ExclMergeCells(Hoja, Cell, Cell2);
            end;

          // Prima Anual Total
          Col  := Chr(iPos + 8);
          Cell := Col + sPosFil;
          dPrimaAnualTotal := (dMasaSalarial * 13 * dPorcMasa) + (iTrabajadores * 12 * dSumaFija);
          ExclSetCellValue(Hoja, Cell, dPrimaAnualTotal);
          if bFilaInsertada then
            begin
              Col   := Chr(iPos + 9);
              Cell2 := Col + sPosFil;
              ExclMergeCells(Hoja, Cell, Cell2);
            end;

          // Resto de la fila
          if bFilaInsertada then
            begin
              Col  := Chr(iPos + 10);
              Cell := Col + sPosFil;

              Col   := Chr(iPos + 12);
              Cell2 := Col + sPosFil;
              ExclMergeCells(Hoja, Cell, Cell2);
            end;

          inc(iFil);

          Next;
        end;
    finally
      Free;
    end;

  if sPerHasta <> '999912' then
    begin
      // Información Siniestral
      if bHuboInsercion then
        iFilDatosSiniestral := FilDatosSiniestral + (iTopeInsercion - FilDatosCuenta)
      else
        iFilDatosSiniestral := FilDatosSiniestral;

      iFil := iFilDatosSiniestral;

      iTotFilas      := iAnioHasta - iAnioDesde + 1;
      iTopeInsercion := iTotFilas + iFilDatosSiniestral - 2;

      for iAnio := iAnioDesde to iAnioHasta do
        begin
          sPerDesdeAnio := EncodePeriodo(iAnio, 1);
          sPerHastaAnio := EncodePeriodo(iAnio, 12);

          dFactorPonderacionAnio := Get_PorcPonderacionAnio(iAnioDesde, iAnioHasta, iAnio) / 100;

          sSql := 'SELECT PERIODOS_TOTAL, TRABAJADORES_TOTAL, ' +
                         'DECODE(TRABAJADORES_TOTAL, 0, 0, ROUND(SALARIOS_TOTAL/TRABAJADORES_TOTAL, 2)) SALARIOPROMEDIO_TOTAL, ' +
                         'SINIESTROS_TOTAL, RECAIDAS_TOTAL, RECHAZOS_TOTAL, MORTALES_TOTAL ' +
                   'FROM ' +
                     '(SELECT COUNT(*) PERIODOS_TOTAL, ' +
                             'NVL(SUM(NVL(MP_CANTTRABAJADORES, 0)), 0) TRABAJADORES_TOTAL, ' +
                             'NVL(SUM(NVL(MP_TOTSALARIOS, 0)), 0) SALARIOS_TOTAL, ' +
                             'NVL(SUM(NVL(MP_SINIESTROS_TOTAL, 0)), 0) SINIESTROS_TOTAL, ' +
                             'NVL(SUM(NVL(MP_RECAIDAS_TOTAL, 0)), 0) RECAIDAS_TOTAL, ' +
                             'NVL(SUM(NVL(MP_RECHAZOS_TOTAL, 0)), 0) RECHAZOS_TOTAL, ' +
                             'NVL(SUM(NVL(MP_SINIESTROS_MORTALES, 0)), 0) MORTALES_TOTAL ' +
                        'FROM TMP_CUADROEVOLTRABAJSIN ' +
                       'WHERE MP_USUARIO = :UserId ' +
                         'AND MP_PERIODO BETWEEN :PerDesde AND :PerHasta)';
          with GetQueryEx(sSql, [Sesion.UserId, sPerDesdeAnio, sPerHastaAnio]) do
            try
              while not Eof do
                begin
                  sPosFil := IntToStr(iFil);

                  if (iFil >= iFilDatosSiniestral + 1) and (iFil <= iTopeInsercion) then
                    begin
                      Cell := sPosFil + ':' + sPosFil;
                      ExclInsertRow(Hoja, Cell);
                      bFilaInsertada := True;
                    end
                  else
                    bFilaInsertada := False;

                  iPos := Ord(ColDatosSiniestral);

                  // Año
                  Col  := Chr(iPos + 0);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, iAnio);

                  // Periodos Cubiertos
                  Col  := Chr(iPos + 1);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('PERIODOS_TOTAL').AsInteger);
                  if bFilaInsertada then
                    begin
                      Col   := Chr(iPos + 2);
                      Cell2 := Col + sPosFil;
                      ExclMergeCells(Hoja, Cell, Cell2);
                    end;

                  // Empleados
                  Col  := Chr(iPos + 3);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('TRABAJADORES_TOTAL').AsInteger);
                  if bFilaInsertada then
                    begin
                      Col   := Chr(iPos + 5);
                      Cell2 := Col + sPosFil;
                      ExclMergeCells(Hoja, Cell, Cell2);
                    end;

                  // Salario
                  Col  := Chr(iPos + 6);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('SALARIOPROMEDIO_TOTAL').AsCurrency);

                  // Siniestros
                  Col  := Chr(iPos + 7);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('SINIESTROS_TOTAL').AsInteger);
                  if bFilaInsertada then
                    begin
                      Col   := Chr(iPos + 8);
                      Cell2 := Col + sPosFil;
                      ExclMergeCells(Hoja, Cell, Cell2);
                    end;

                  // Recaidas
                  Col  := Chr(iPos + 9);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('RECAIDAS_TOTAL').AsInteger);
                  if bFilaInsertada then
                    begin
                      Col   := Chr(iPos + 10);
                      Cell2 := Col + sPosFil;
                      ExclMergeCells(Hoja, Cell, Cell2);
                    end;

                  // Rechazos
                  Col  := Chr(iPos + 11);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('RECHAZOS_TOTAL').AsInteger);

                  // Mortales
                  Col  := Chr(iPos + 12);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, FieldByName('MORTALES_TOTAL').AsInteger);

                  // Factor ponderación del año (solo a los efectos del cálculo del promedio ponderado)
                  // esta columna debe estar oculta...
                  Col  := Chr(iPos + 13);
                  Cell := Col + sPosFil;
                  ExclSetCellValue(Hoja, Cell, dFactorPonderacionAnio);

                  inc(iFil);

                  Next;
                end;
            finally
              Free;
            end;
        end;
    end;

  Result := True;
end;

end.
