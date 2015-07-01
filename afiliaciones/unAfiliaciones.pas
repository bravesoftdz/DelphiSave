{$IFDEF AFILIACIONES}
  {$DEFINE REPORTES_AFI}
{$ENDIF}
{$IFDEF COMERCIAL}
  {$DEFINE REPORTES_AFI}
{$ENDIF}

unit unAfiliaciones;

{ Unit que contiene los tipos y funciones comunes al subsistema de afiliaciones }

interface

uses
  unArt, Classes, unDmPrincipal, unCustomDataModule, Forms, Graphics, Controls;

type
  TTiposEmpresa = (teNormal, teDeudora, teNone);  // tipos de empresas

  //Record utilizado para calcular la tarifa
  RecTarifa = record
    SumaFijaTarifa      : Currency;
    PorcMasaTarifa      : Currency;
    RebajaVolumenVal    : Currency;
    RebajaVolumenPorc   : Currency;
    RebajaHSVal         : Currency;
    RebajaHSPorc        : Currency;
    SubTotalPesos       : Currency;
    SubTotalPorc        : Currency;
    RecargoSinVarVal    : Currency;
    RecargoSinVarPorc   : Currency;
    RecargoSinSFijoVal  : Currency;
    RecargoSinSFijoPesos: Currency;
    RCSMF               : Currency;
    RebajaSinVarVal     : Currency;
    RebajaSinVarPorc    : Currency;
    RebajaSinSFijoVal   : Currency;
    RebajaSinSFijoPesos : Currency;
    RBSMF               : Currency;
    RecargoEspVal       : Currency;
    RecargoEspPorc      : Currency;
    RecargoEspSFijoVal  : Currency;
    RecargoEspSFijoPesos: Currency;
    RebajaEspVal        : Currency;
    RebajaEspPorc       : Currency;
    RebajaEspSFijoVal   : Currency;
    RebajaEspSFijoPesos : Currency;
    SubTotal2Pesos      : Currency;
    SubTotal2Porc       : Currency;
    AporteSRTPesos      : Currency;
    AporteSRTPorc       : Currency;
    SubTotal3Pesos      : Currency;
    SubTotal3Porc       : Currency;
    FinalPesos          : Currency;
    FinalPorc           : Currency;
    AporteSRT           : Currency;
    AporteFondo         : Currency;
  end;

const
  cTRABAJADOR_MUERTO: Integer = 23;         // paquete AFILIACION., constante

  IDTIPOREG_RG: Integer  = 1;      // Régimen General
  IDTIPOREG_PCP: Integer = 2;      // Régimen Personal Casas Particulares
  IDTIPOREG_MIX: Integer = 3;      // Régimen Mixto

function ExisteCuil(aCuil: String): Boolean;
function ExisteDNI(aDni: String): Boolean;
function GetIdFormularioSolicitudAfiliacionPorCuit(aCuit: String): TTableId;
function GetIdTrabajadorPorCuil(aCuilTrabajador: String): TTableId;
function GetIdTextoCartaBienvenida: Integer;
function GetNroFormularioPorIdFormulario(aId: TTableId): String;
function IsAutoAsegurada(aCuil: String): Boolean;
function IsCuilExistenteEnEmpresa(aCuil: String): Boolean;
function IsDocumentoExistenteEnEmpresa(aDocumento: String): Boolean;

//rutinas para unCuadroTarifario y unCuadroTarifarioContrato
function ActualizarEstadoSolicitud(aIdSolicitud: Integer): String;
function SetTarifaInv(var aTarifa: RecTarifa; aFondo, aAporteSSN: Currency): Boolean;

procedure TarifaComercial(aIdActividad: Integer; aFecha: String; var aTarComercial, aPorcComercial: Currency);
procedure TarifaSSN(aNivel: String; aIdActividad: Integer; aFecha: String; var aTarSSN: Currency; var aPorcSSN: Currency);

//rutinas para las Carta Documento
function DoEndosoGrabar(aNroContrato: Integer; aVigenciaEndoso: TDateTime; aMotivoEndoso, aEsEnvioSRT, aEsEnvioCarta, aEsEndosoAutomatico, aUsuario: String; aConTransaccion: Boolean): TTableId;
function Get_IdEndosoGenerado(aNroContrato: Integer; aVigenciaEndoso: TDateTime; aMotivoEndoso, aUsuario: String): TTableId;
function GetEmailContacto(aContrato: Integer): TStringList;
function GetIdRelacionLaboral(aIdTrabajador: TTableId; aContrato: Integer): TTableId;
function GetFechaVigenciaHasta(const aIdSolicitud: Integer; const aFechavigenciaDesde: TDate): TDate;

procedure BorrarTrabajador(const aIdLaboral: Integer; const aFechaBaja: TDateTime; const aUsuario: String; const aFechaRecepcion: TDateTime = 0; const aMotivoBaja: String = '');
procedure Do_Devengado_ActualizarExtVig(aUsuario: String; aContrato: Integer; aDesconciliarPer: Boolean; aConTransaccion: Boolean);
procedure GetTarifaFromEndoso(aIdEndoso: Integer; var aTarifa: RecTarifa; aEsTemporal: Boolean = False);

function Do_ImprimirCartaAnexo(const aContrato, aTextoCartaId, aFirmante: Integer; const aCorreo: String; const aImprimir: Boolean = True): Integer;
function Get_CuilValido(aDocumento, aSexo: String; var aCuil: String): Boolean;
function Get_NombreARTFutura(aContrato: Integer): String;
function Get_Trf_Hipoacusia(aFecha: TDateTime): Double;
function Get_Trf_PorcAporteSSN(aFecha: TDateTime): Double;
function Get_VigenciaTarifaMinima(aContrato: Integer): TDateTime;
function Get_TipoRegimen(const aContrato: Integer): Integer;
function Is_GrabarCuilValido(aDocumento, aSexo: String; var aCuil: String): Boolean;
function Is_CUILIndeterminado(aCuil: String): Boolean;
function Is_DDJJEmptyUltPeriodo(aContrato: Integer): Boolean;
function Is_EmpresaPagoSUSS(aContrato: Integer): Boolean;
function Is_FechaIngresoAltaRelacionLaboralOk(const aFechaIngreso: TDate; const aCuil: String; const aContrato: Integer): Boolean;
function Is_FechaIngresoVigenciaDesdeIngresoTrabajadorOk(const aFechaIngreso: TDate; const aContrato: TTableId): Boolean;

procedure Do_ImprimirCartaBienvenida(const aContrato, aCartaId, aFirmante, aCantidadCopias: Integer; const aCorreo: String; const aNombreArchivo: String = '');
{$IFDEF REPORTES_AFI}
procedure ImprimirUltimaRenovacionAutomatica(const aContrato: TTableId; const IsMail: Boolean = False);
{$ENDIF}

function Get_TrabajadorCarta(NroCartaDoc: String): String;
function Get_EmpresaCarta(NroCartaDoc: String): String;
function Get_CodRegimenContratoAfi(Contrato: Integer): String;
function Get_DescrRegimenContratoAfi(Contrato: Integer): String;

implementation

uses
  {$IFDEF REPORTES_AFI}
  unImprimeContrato,
  {$ENDIF}
  SDEngine, AnsiSql, SqlFuncs, Sysutils, StrFuncs, Cuit, Numeros, Printers, unComunes, General, unSesion, DateTimeFuncs, unPrincipal, unRptCartaDocHeader,
  unRptCartaDocumento, ArchFuncs, DateUtils;

{ Arma el nro. de la carta documento del area de afiliaciones: 3779aannnnnn }
{$HINTS OFF}
function ActualizarEstadoSolicitud(aIdSolicitud: Integer): String;
var
  bMultiActividad: Boolean;
  bMontoComercial: Boolean;
  bMontoSSN: Boolean;
  bReafiliacion: Boolean;
  bRescisionSRT: Boolean;
  Estado: String;
  Fecha: String;
  aIdActividad: Integer;
  Nivel: String;
  PorcComercial: Currency;
  Porcentaje: Currency;
  PorcSSN: Currency;
  sdqDatos: TSDQuery;
  sdqAux: TSDQuery;
  sSql: String;
  SumaFija: Currency;
  TarComercial: Currency;
  TarSSN: Currency;
begin
  sdqDatos := GetQuery('SELECT 1 FROM DUAL');
  sdqAux   := GetQuery('SELECT 1 FROM DUAL');
  try
    bMontoComercial := False;
    bMontoSSN       := False;

    sSql :=
      'SELECT sa_idactividad, sa_nivel, sa_idactividad2, sa_idactividad3, sa_idformulario, sa_cuit, sa_idartanterior, sa_alicuotapesos, sa_alicuotaporc,' +
            ' sa_fechaafiliacion, sa_estado, sa_usualta, sa_fechaalta' +
       ' FROM asa_solicitudafiliacion' +
      ' WHERE sa_id = :id';
    OpenQueryEx(sdqDatos, [aIdSolicitud], sSql, True);

    //if sdqDatos.FieldByName('sa_estado').AsString < '3.1' then
    begin
      //Rescision? Esto quiere decir que si alguna vez no pagó sus cuentas, no puede ser aprobado directamente
      //ENTRO POR EL ID DE FORMULARIO
      sSql :=
        'SELECT 1' +
         ' FROM ais_informacionsrt' +
        ' WHERE is_operacion = 2' +
          ' AND is_idformulario = :idformulario';
      bRescisionSRT := ExisteSqlEx(sSql, [sdqDatos.FieldByName('sa_idformulario').AsInteger]);

      //REAFILIACION
      sSql :=
        'SELECT 1' +
         ' FROM aem_empresa, aco_contrato, afo_formulario' +
        ' WHERE co_idempresa = em_id' +
          ' AND (   fo_id = :id' +
               ' OR em_cuit = :cuit)' +
          ' AND co_idformulario = fo_id' +
          ' AND co_fechabaja < actualdate';
      bReafiliacion := ExisteSqlEx(sSql, [sdqDatos.FieldByName('sa_idformulario').AsInteger, sdqDatos.FieldByName('sa_cuit').AsString]);

      //MULTIAFILIACION
      bMultiActividad := (sdqDatos.FieldByName('sa_idactividad2').AsString <> '') or (sdqDatos.FieldByName('sa_idactividad3').AsString <> '');

      //MONTO POR ENCIMA DEL TARIFARIO DE LA SSN
      //SumaFija   := sdqDatos.FieldByName('sa_sumafijatarifa').AsCurrency;
      //Porcentaje := sdqDatos.FieldByName('sa_porcmasatarifa').AsCurrency;
      SumaFija   := sdqDatos.FieldByName('sa_alicuotapesos').AsCurrency;
      Porcentaje := sdqDatos.FieldByName('sa_alicuotaporc').AsCurrency;

      if (SumaFija = 0) and (Porcentaje = 0) then
      begin
        bMontoSSN       := True;
        bMontoComercial := True;
      end
      else
      begin
        Nivel        := sdqDatos.FieldByName('sa_nivel').AsString;
        aIdActividad := sdqDatos.FieldByName('sa_idactividad').AsInteger;
        Fecha        := sdqDatos.FieldByName('sa_fechaafiliacion').AsString;

        //BUSCO LOS DATOS DEL TARIFARIO DE LA SSN
        TarifaSSN(Nivel, aIdActividad, Fecha, TarSSN, PorcSSN);

        ///BUSCO LOS DATOS DEL TARIFARIO COMERCIAL
        TarifaComercial(aIdActividad, Fecha, TarComercial, PorcComercial);

        if SumaFija <> 0 then
        begin
          TarSSN := (TarSSN * 1.15 + 0.6);  //Tarifa de la SSN = ValorDB + 15% + 0.6

          //chequea para ver si la tarifa en pesos esta fuera de rango
          if (SumaFija < (TarComercial * 0.95)) or (SumaFija > (TarComercial * 1.2)) then //entre el TarSSN-5% y TarSSN+20%
            bMontoComercial := True;
          if (SumaFija > (TarSSN)) then
            bMontoSSN       := True;
        end;

        if (Porcentaje <> 0) then
        begin
          //chequea para ver si el porcentaje esta fuera de rango
          if (Porcentaje < (PorcComercial * 0.95)) or (Porcentaje > (PorcComercial * 1.2)) then //entre el 5% y el 20%
            bMontoComercial := True;
          if (Porcentaje > (PorcSSN)) then
            bMontoSSN       := True;
        end;
      end;

      Estado := sdqDatos.FieldByName('sa_estado').AsString;

      // Si posee una ART anterior entonces el estado es 7.0
      if (Estado = '3.1') and (sdqDatos.FieldByName('sa_idartanterior').AsString <> '') then
        Estado := '7.0'
      else if (Estado = '7.0') and (sdqDatos.FieldByName('sa_idartanterior').AsString = '') then
        Estado := '3.1';

      //No necesito un BeginTrans porque la rutina superior ya lo esta tomando...
      sSql :=
        'UPDATE asa_solicitudafiliacion' +
          ' SET sa_estado = :estado,' +
              ' sa_idformulario = :idformulario,' +
              ' sa_usumodif = :usumodif,' +
              ' sa_fechamodif = SYSDATE' +
        ' WHERE sa_id = :id';
      EjecutarSqlSTEx(sSql, [Estado,
                             sdqDatos.FieldByName('sa_idformulario').AsString,
                             Sesion.UserId{sdqDatos.FieldByName('sa_usualta').AsString},
                             {TDateTimeEx.Create(sdqDatos.FieldByName('sa_fechaalta').AsDateTime),}
                             aIdSolicitud]);
    end;
  finally
    // Libera los controles
    sdqDatos.Free;
    sdqAux.Free;
  end;
end;
{$HINTS ON}

procedure TarifaSSN(aNivel: String; aIdActividad: Integer; aFecha: String; var aTarSSN: Currency; var aPorcSSN: Currency);
var
  sSql: String;
begin
  sSql :=
    'SELECT   ts_tarifa1, ts_porce1, ts_tarifa2, ts_porce2, ts_tarifa3, ts_porce3' +
       ' FROM ats_tarifassn' +
      ' WHERE ts_idactividad = :idactividad' +
        ' AND ts_fechadesde <= TO_DATE(:fechadesde, ''dd/mm/yyyy'')' +
        ' AND NVL(ts_fechahasta, TO_DATE(''01/01/2999'', ''dd/mm/yyyy'')) >= TO_DATE(:fechahasta, ''dd/mm/yyyy'')' +
        ' AND ts_fechabaja IS NULL' +
   ' ORDER BY ts_fechadesde DESC';
  with GetQueryEx(sSql, [aIdActividad, aFecha, aFecha], [qoUniDirectional]) do
  try
    if aNivel = '1' then
    begin
      aTarSSN  := FieldByName('ts_tarifa1').AsCurrency;
      aPorcSSN := FieldByName('ts_porce1').AsCurrency;
    end
    else if aNivel = '2' then
    begin
      aTarSSN  := FieldByName('ts_tarifa2').AsCurrency;
      aPorcSSN := FieldByName('ts_porce2').AsCurrency;
    end
    else if aNivel = '3' then
    begin
      aTarSSN  := FieldByName('ts_tarifa3').AsCurrency;
      aPorcSSN := FieldByName('ts_porce3').AsCurrency;
    end
    else
    begin
      aTarSSN  := FieldByName('ts_tarifa3').AsCurrency;
      aPorcSSN := FieldByName('ts_porce3').AsCurrency;
    end;
  finally
    Free;
  end;
end;

procedure TarifaComercial(aIdActividad: Integer; aFecha: String; var aTarComercial, aPorcComercial: Currency);
var
  sSql: String;
begin
  sSql :=
    'SELECT   tc_sumafija, tc_porcmasa' +
       ' FROM atc_tarifacomercial' +
      ' WHERE tc_idactividad = :idactividad' +
        ' AND tc_fechadesde <= TO_DATE(:fechadesde, ''dd/mm/yyyy'')' +
        ' AND NVL(tc_fechahasta, TO_DATE(''01/01/2999'', ''dd/mm/yyyy'')) >= TO_DATE(:fechahasta, ''dd/mm/yyyy'')' +
   ' ORDER BY tc_fechadesde DESC';
  with GetQueryEx(sSql, [aIdActividad, aFecha, aFecha], [qoUniDirectional]) do
  try
    aTarComercial  := FieldByName('tc_sumafija').AsCurrency;
    aPorcComercial := FieldByName('tc_porcmasa').AsCurrency;
  finally
    Free;
  end;
end;

{ Dado el Cuil del trabajador, devuelve su Id de la tabla de trabajadores }
function GetIdTrabajadorPorCuil(aCuilTrabajador: String): TTableId;
var
  sSql: String;
begin
  sSql :=
    'SELECT tj_id' +
     ' FROM ctj_trabajador' +
    ' WHERE tj_cuil = :cuil';
  Result := ValorSqlIntegerEx(sSql, [SacarGuiones(aCuilTrabajador)]);
end;

{ Determina si el Cuil ya existe como Cuit en la tabla de empresas }
function IsCuilExistenteEnEmpresa(aCuil: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM aem_empresa' +
    ' WHERE em_cuit = :cuit';
  Result := ExisteSqlEx(sSql, [SacarGuiones(aCuil)]);
end;

{ Determina si el documento del trabajador ya existe como Cuit en la tabla de empresas }
function IsDocumentoExistenteEnEmpresa(aDocumento: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM aem_empresa' +
    ' WHERE SUBSTR(em_cuit, 3, 8) = :cuit';
  Result := ExisteSqlEx(sSql, [aDocumento]);
end;

{ Determina si el Cuil ya existe}
function ExisteCuil(aCuil: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM ctj_trabajador' +
    ' WHERE tj_cuil = :cuil';
  Result := ExisteSqlEx(sSql, [SacarGuiones(aCuil)]);
end;

{ Determina si el DNI ya existe}
function ExisteDNI(aDni: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM ctj_trabajador' +
    ' WHERE tj_documento = :documento';
  Result := ExisteSqlEx(sSql, [SacarGuiones(Trim(aDni))]);
end;

{ Dado el Cuit de una afiliación provisoria, devuelve el Id del formulario }
function GetIdFormularioSolicitudAfiliacionPorCuit(aCuit: String): TTableId;
var
  sSql: String;
begin
  sSql :=
    'SELECT sa_idformulario' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_cuit = :cuit';
  Result := ValorSqlIntegerEx(sSql, [SacarGuiones(aCuit)]);
end;

function GetIdTextoCartaBienvenida: Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT tc_id' +
     ' FROM ctc_textocarta, ctb_tablas' +
    ' WHERE tc_codigo = tb_codigo' +
      ' AND tb_clave = ''CBIEN''' +
      ' AND tb_codigo <> 0';
  Result := ValorSql(sSql);
end;

{ Dado el Id de un formulario, devuelve el nro. del formulario }
function GetNroFormularioPorIdFormulario(aId: TTableId): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT fo_formulario' +
     ' FROM afo_formulario' +
    ' WHERE fo_id = :id';
  Result := ValorSqlEx(sSql, [aId]);
end;

function SetTarifaInv(var aTarifa: RecTarifa; aFondo, aAporteSSN: Currency): Boolean;
var
  cEspSfijo: Currency; //especial
  cEspSvariable: Currency;  //especial variable
  cSinMontoFijo: Currency;  //siniestralidad monto fijo
  cSinSfijo: Currency; //siniestralidad fijo
  cSinSvariable: Currency; //siniestralidad variable
begin
  try
    Result := True;

    /////////////////////////
    //  Calculos en pesos  //
    /////////////////////////
    aTarifa.AporteSRT      := aAporteSSN;
    aTarifa.AporteFondo    := aFondo;

//    aTarifa.SubTotal3Pesos := aTarifa.FinalPesos - aFondo;
    aTarifa.AporteSRTPesos := RoundNumber(aTarifa.SubTotal3Pesos * aAporteSSN / (100 + aAporteSSN), 2);
    aTarifa.SubTotal2Pesos := RoundNumber(aTarifa.SubTotal3Pesos * 100 / (100 + aAporteSSN), 2);

    cEspSfijo := -aTarifa.RebajaEspSFijoVal;
    cEspSfijo := cEspSfijo + aTarifa.RecargoEspSFijoVal;
    cSinSfijo := -aTarifa.RebajaSinSFijoVal;
    cSinSfijo := cSinSfijo + aTarifa.RecargoSinSFijoVal;
    cSinMontoFijo := -aTarifa.RCSMF;
    cSinMontoFijo := cSinMontoFijo + aTarifa.RBSMF;

    aTarifa.SubTotalPesos := aTarifa.SubTotal2Pesos * 100 / (cEspSfijo + cSinSfijo + cSinMontoFijo + 100);
    aTarifa.SumaFijaTarifa := aTarifa.SubTotalPesos;

    // Termino de llenar el record
    aTarifa.RebajaEspSFijoPesos  := -RoundNumber(aTarifa.RebajaEspSFijoVal * aTarifa.SubTotalPesos / 100, 4);
    aTarifa.RecargoEspSFijoPesos := RoundNumber(aTarifa.RecargoEspSFijoVal * aTarifa.SubTotalPesos / 100, 4);
    aTarifa.RebajaSinSFijoPesos  := -RoundNumber(aTarifa.RebajaSinSFijoVal * aTarifa.SubTotalPesos / 100, 4);
    aTarifa.RecargoSinSFijoPesos := RoundNumber(aTarifa.RecargoSinSFijoVal * aTarifa.SubTotalPesos / 100, 4);

    //////////////////////////////
    //  Calculo en porcentajes  //
    //////////////////////////////
//    aTarifa.SubTotal3Porc := aTarifa.FinalPorc;
    aTarifa.AporteSRTPorc := RoundNumber(aTarifa.SubTotal3Porc * aAporteSSN / (100 + aAporteSSN), 4);
    aTarifa.SubTotal2Porc := aTarifa.SubTotal3Porc - aTarifa.AporteSRTPorc;

    cSinSvariable := -aTarifa.RebajaSinVarVal ;
    cSinSvariable := cSinSvariable + aTarifa.RecargoSinVarVal;
    cEspSvariable := -aTarifa.RebajaEspVal;
    cEspSvariable := cEspSvariable + aTarifa.RecargoEspVal;
    aTarifa.SubTotalPorc   := aTarifa.SubTotal2Porc * 100 / (cSinSvariable + cEspSvariable + 100);
    aTarifa.PorcMasaTarifa := aTarifa.SubTotalPorc * 100 / (-aTarifa.RebajaHSVal - aTarifa.RebajaVolumenVal + 100);

    //Ahora que estan terminados los calculos, termino de llenar el record
    aTarifa.RebajaEspPorc     := -RoundNumber(aTarifa.RebajaEspVal * aTarifa.SubTotalPorc / 100, 4);
    aTarifa.RecargoEspPorc    := RoundNumber(aTarifa.RecargoEspVal * aTarifa.SubTotalPorc / 100, 4);
    aTarifa.RebajaSinVarPorc  := -RoundNumber(aTarifa.RebajaSinVarVal * aTarifa.SubTotalPorc / 100, 4);
    aTarifa.RecargoSinVarPorc := RoundNumber(aTarifa.RecargoSinVarVal * aTarifa.SubTotalPorc / 100, 4);
    aTarifa.RebajaHSPorc      := RoundNumber(aTarifa.RebajaHSVal * aTarifa.PorcMasaTarifa / 100, 4);
    aTarifa.RebajaVolumenPorc := RoundNumber(aTarifa.RebajaVolumenVal * aTarifa.PorcMasaTarifa / 100, 4);
  except
    Result := False;
  end;
end;

procedure BorrarTrabajador(const aIdLaboral: Integer; const aFechaBaja: TDateTime; const aUsuario: String; const aFechaRecepcion: TDateTime = 0; const aMotivoBaja: String = '');
var
  sSql: String;
begin
  if (aIdLaboral <> 0) then
  begin
    if aFechaRecepcion <> 0 then
    begin
      sSql :=
        'UPDATE crl_relacionlaboral' +
          ' SET rl_fecharecepcion = :fecharecepcion' +
        ' WHERE rl_id = :id';
      EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(aFechaRecepcion), aIdLaboral]);
    end;

    sSql := 'nomina.borrar_trabajadorcontrato(:idlaboral, :fechabaja, :usuario, :motivobaja);';
    EjecutarStoreSTEx(sSql, [aIdLaboral, TDateTimeEx.Create(aFechaBaja), aUsuario, aMotivoBaja]);
  end;
end;

// Genera un endoso en la tabla aen_Endoso
function DoEndosoGrabar(aNroContrato: Integer; aVigenciaEndoso: TDateTime; aMotivoEndoso, aEsEnvioSRT, aEsEnvioCarta, aEsEndosoAutomatico, aUsuario: String; aConTransaccion: Boolean): TTableId;
var
  sSql: String;
begin
  sSql := 'afiliacion.dogeneraraltaendoso(:contrato, :vigenciaendoso, :motivoendoso, :enviosrt, :enviocarta, :endosoautomatico, :usuario);';

  if aConTransaccion then
    EjecutarStoreEx(sSql, [aNroContrato, TDateTimeEx.Create(aVigenciaEndoso), aMotivoEndoso, aEsEnvioSRT, aEsEnvioCarta, aEsEndosoAutomatico, aUsuario])
  else
    EjecutarStoreSTEx(sSql, [aNroContrato, TDateTimeEx.Create(aVigenciaEndoso), aMotivoEndoso, aEsEnvioSRT, aEsEnvioCarta, aEsEndosoAutomatico, aUsuario]);

  Result := Get_IdEndosoGenerado(aNroContrato, aVigenciaEndoso, aMotivoEndoso, aUsuario);
end;

// Devuelve el último id del endoso generado, para los datos dados
function Get_IdEndosoGenerado(aNroContrato: Integer; aVigenciaEndoso: TDateTime; aMotivoEndoso, aUsuario: String): TTableId;
var
  sSql: String;
begin
  sSql :=
    'SELECT NVL(MAX(en_id), 0)' +
     ' FROM aen_endoso' +
    ' WHERE en_contrato = :contrato' +
      ' AND en_motivo = :motivo' +
      ' AND en_vigenciaendoso = :vigenciaendoso' +
      ' AND en_usualta = :usualta';
  Result := ValorSqlEx(sSql, [aNroContrato, aMotivoEndoso, TDateTimeEx.Create(aVigenciaEndoso), aUsuario]);
end;

procedure GetTarifaFromEndoso(aIdEndoso: Integer; var aTarifa: RecTarifa; aEsTemporal: Boolean = False);
var
  AporteSSN: Double;
  HipoAcusia: Double;
  PreFijo: String;
  sSql: String;
  Vigencia: TDateTime;

  procedure Cargar(aValorCampo: Currency; var Valor1, Valor2: Currency);
  begin
    if aValorCampo > 0 then
    begin
      Valor1 := aValorCampo;
      Valor2 := 0;
    end
    else
    begin
      Valor1 := 0;
      Valor2 := -aValorCampo;
    end;
  end;

begin
  if aEsTemporal then
  begin
    sSql :=
      'SELECT et_alicuotapesos, et_porcmasa, et_porcdescvolumen, et_porcdescnivel, et_recargosin, et_recargosin_sobrefijo, et_recargosin_montofijo, et_recargoesp,' +
            ' et_recargoesp_sobrefijo, et_vigenciatarifa, et_sumafija, et_porcmasa' +
       ' FROM tet_endosotarifa' +
      ' WHERE et_id = :id';
    PreFijo := 'et';
  end
  else
  begin
    sSql :=
      'SELECT ht_alicuotapesos, ht_porcmasa, ht_porcdescvolumen, ht_porcdescnivel, ht_recargosin, ht_recargosin_sobrefijo, ht_recargosin_montofijo, ht_recargoesp,' +
            ' ht_recargoesp_sobrefijo, ht_vigenciatarifa, ht_sumafija, ht_porcmasa' +
       ' FROM aht_historicotarifario, aen_endoso' +
      ' WHERE en_idhistoricotarifa = ht_id' +
        ' AND en_id = :id';
    PreFijo := 'ht';
  end;
  with GetQueryEx(sSql, [aIdEndoso]) do
  try
    Cargar(FieldByName(PreFijo + '_recargosin').AsCurrency,           aTarifa.RecargoSinVarVal,   aTarifa.RebajaSinVarVal);
    Cargar(FieldByName(PreFijo + '_recargosin_sobrefijo').AsCurrency, aTarifa.RecargoSinSFijoVal, aTarifa.RebajaSinSFijoVal);
    Cargar(FieldByName(PreFijo + '_recargosin_montofijo').AsCurrency, aTarifa.RCSMF,              aTarifa.RBSMF);
    Cargar(FieldByName(PreFijo + '_recargoesp').AsCurrency,           aTarifa.RecargoEspVal,      aTarifa.RebajaEspVal);
    Cargar(FieldByName(PreFijo + '_recargoesp_sobrefijo').AsCurrency, aTarifa.RecargoEspSFijoVal, aTarifa.RebajaEspSFijoVal);

    aTarifa.SubTotal3Pesos   := FieldByName(PreFijo + '_sumafija').AsCurrency;
    aTarifa.SubTotal3Porc    := FieldByName(PreFijo + '_porcmasa').AsCurrency;
    aTarifa.FinalPesos       := FieldByName(PreFijo + '_alicuotapesos').AsCurrency;
    aTarifa.FinalPorc        := FieldByName(PreFijo + '_porcmasa').AsCurrency;
    aTarifa.RebajaVolumenVal := FieldByName(PreFijo + '_porcdescvolumen').AsCurrency;
    aTarifa.RebajaHSVal      := FieldByName(PreFijo + '_porcdescnivel').AsCurrency;

    Vigencia := FieldByName(PreFijo + '_vigenciatarifa').AsDateTime;

    AporteSSN  := Get_Trf_PorcAporteSSN(Vigencia);
    HipoAcusia := Get_Trf_Hipoacusia(Vigencia);

    // Obtengo el record actualizado
    if not SetTarifaInv(aTarifa, HipoAcusia, AporteSSN) then
      raise Exception.Create('Se produjo un error al recuperar la tarifa.');
  finally
    Free;
  end;
end;

function GetEmailContacto(aContrato: Integer): TStringList;
var
  sSql: String;
begin
  Result := TStringList.Create;

  sSql :=
    'SELECT ct_direlectronica' +
     ' FROM aco_contrato, aem_empresa, act_contacto' +
    ' WHERE co_idempresa = em_id' +
      ' AND em_id = ct_idempresa' +
      ' AND ct_fechabaja IS NULL' +
      ' AND ct_direlectronica IS NOT NULL' +
      ' AND co_contrato = :co_contrato';
  with GetQueryEx(sSql, [aContrato]) do
  try
    while not Eof do
    begin
      Result.Add(FieldByName('ct_direlectronica').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

// Redevenga los periodos necesarios luego de extender la vigencia de un contrato
procedure Do_Devengado_ActualizarExtVig(aUsuario: String; aContrato: Integer; aDesconciliarPer: Boolean; aConTransaccion: Boolean);
var
  sSql: String;
begin
  sSql := 'cobranza.devengado_actualizarextvig(:usuario, :contrato, :desconciliar);';

  if aConTransaccion then
    EjecutarStoreEx(sSql, [aUsuario, aContrato, String(IIF(aDesconciliarPer, 'S', 'N'))])
  else
    EjecutarStoreSTEx(sSql, [aUsuario, aContrato, String(IIF(aDesconciliarPer, 'S', 'N'))]);
end;

function GetIdRelacionLaboral(aIdTrabajador: TTableId; aContrato: Integer): TTableId;
var
  sSql: String;
begin
  sSql :=
    'SELECT rl_id' +
     ' FROM crl_relacionlaboral' +
    ' WHERE rl_idtrabajador = :idtrabajador' +
      ' AND rl_contrato = :contrato';
  Result := ValorSqlIntegerEx(sSql, [aIdTrabajador, aContrato], ART_EMPTY_ID);
end;

function GetFechaVigenciaHasta(const aIdSolicitud: Integer; const aFechavigenciaDesde: TDate): TDate;
var
  bGetUltimoDiaMes: Boolean;
  dFecha: TDate;
  sSql: String;
  sStatusSrt: String;
begin
  sSql :=
    'SELECT sr_statussrt statussrt' +
     ' FROM asr_solicitudreafiliacion, asa_solicitudafiliacion' +
    ' WHERE sr_id = sa_idrevisionprecio(+)' +
      ' AND sa_id = :id' +
' UNION ALL' +
   ' SELECT sc_statussrt' +
     ' FROM asc_solicitudcotizacion, asa_solicitudafiliacion' +
    ' WHERE sc_id = sa_idsolicitudcotizacion(+)' +
      ' AND sa_id = :id';
  sStatusSrt := ValorSqlEx(sSql, [aIdSolicitud], '2');

  if sStatusSrt = '2' then
    bGetUltimoDiaMes := True
  else
    bGetUltimoDiaMes := (StrToInt(FormatDateTime('dd', IncDay(aFechaVigenciaDesde))) > 1);

  dFecha := IncYear(aFechaVigenciaDesde);
  dFecha := IncDay(dFecha, -1);

  if bGetUltimoDiaMes then
    dFecha := EncodeDate(YearOf(dFecha), MonthOf(dFecha), DaysInMonth(dFecha));

  Result := dFecha;
end;

function Get_Trf_Hipoacusia(aFecha: TDateTime): Double;
var
  sSql: String;
begin
  if aFecha >= EncodeDate(1997, 8, 1) then
  begin
    sSql :=
      'SELECT tb_especial1' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''PARAM''' +
        ' AND tb_codigo = ''HIPOACUSIA''';
    Result := ValorSqlExtended(sSql, 0);
  end
  else
    Result := 0;
end;

function Get_Trf_PorcAporteSSN(aFecha: TDateTime): Double;
begin
  if aFecha > EncodeDate(1998, 7, 1) then
    Result := 3
  else
    Result := 0;
end;

function Get_VigenciaTarifaMinima(aContrato: Integer): TDateTime;
var
  sSql: String;
begin
  sSql :=
    'SELECT GREATEST(ADD_MONTHS(tc_vigenciatarifa, 12), co_vigenciadesde)' +
     ' FROM atc_tarifariocontrato, aco_contrato' +
    ' WHERE tc_contrato = co_contrato' +
      ' AND co_contrato = :contrato';
  Result := ValorSqlDateTimeEx(sSql, [aContrato]);
end;

function Get_TipoRegimen(const aContrato: Integer): Integer;
var
  sSql : String;
begin
  sSql :=
    'SELECT co_idtiporegimen ' +
    '   FROM aco_contrato ' +
    ' WHERE co_contrato = :contrato';
  Result :=  ValorSqlIntegerEx(sSql, [aContrato], 1);
end;

function IsAutoAsegurada(aCuil: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT afiliacion.is_autoasegurada(:cuit) FROM DUAL';
  Result := (ValorSqlEx(sSql, [aCuil]) = 'S');
end;

procedure Do_ImprimirCartaBienvenida(const aContrato, aCartaId, aFirmante, aCantidadCopias: Integer; const aCorreo: String; const aNombreArchivo: String = '');
var
  iCartaId: Integer;
  aSalida: TSalidaReport;
  aSql: TSql;
begin
  aSql := TSql.Create('cca_carta');
  with aSql do
  try
    try
      BeginTrans;

      SqlType := stInsert;
      iCartaId := GetSecNextVal('SEQ_CCA_ID');

      PrimaryKey.Add('ca_id',       iCartaId);
      Fields.Add('ca_idendoso',     ValorSqlIntegerEx('SELECT afiliacion.get_ultidendoso(:contrato) FROM DUAL', [aContrato]), True);
      Fields.Add('ca_idformulario', ValorSqlIntegerEx('SELECT co_idformulario FROM aco_contrato WHERE co_contrato = :contrato', [aContrato]));
      Fields.Add('ca_iddelegacion', frmPrincipal.DBLogin.Delegacion);
      Fields.Add('ca_usualta',      frmPrincipal.DBLogin.UserID);
      Fields.Add('ca_fechaalta',    ExDateTime);
      Fields.Add('ca_manual',       'S');
      Fields.Add('ca_idareatexto',  TEXTO_BIENVENIDA);
      Fields.Add('ca_idtextocarta', aCartaId);
      Fields.Add('ca_correo',       aCorreo);
      Fields.Add('ca_idfirma',      aFirmante);
      Fields.Add('ca_tiposalida',   SALIDA_CARTACOMERCIAL);

      EjecutarSqlST(Sql);

      if aNombreArchivo <> '' then
        aSalida := srPdf
      else
        aSalida := srPrint;

      DoImprimirCarta(iCartaId, taAfiliaciones, aSalida, tmNone, aCantidadCopias, False, True, True, True, False, False, False, False, False, False, False, False,
                      False, '', False, False, aNombreArchivo);

      CommitTrans;
    except
      on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar la carta documento.');
      end;
    end;
  finally
    aSql.Free;
  end;
end;

function Do_ImprimirCartaAnexo(const aContrato, aTextoCartaId, aFirmante: Integer; const aCorreo: String; const aImprimir: Boolean = True): Integer;
var
  aSql: TSql;
  sSql: String;
begin
  Result := 0;

  aSql := TSql.Create('cca_carta');
  with aSql do
  try
    try
      BeginTrans;

      SqlType := stInsert;
      Result := GetSecNextVal('SEQ_CCA_ID');
      PrimaryKey.Add('ca_id',       Result);
      Fields.Add('ca_idendoso',     ValorSqlIntegerEx('SELECT afiliacion.get_ultidendoso(:contrato) FROM DUAL', [aContrato]), True);
      Fields.Add('ca_idformulario', ValorSqlIntegerEx('SELECT co_idformulario FROM aco_contrato WHERE co_contrato = :contrato', [aContrato]));
      Fields.Add('ca_iddelegacion', frmPrincipal.DBLogin.Delegacion);
      Fields.Add('ca_usualta',      frmPrincipal.DBLogin.UserID);
      Fields.Add('ca_fechaalta',    ExDateTime);
      Fields.Add('ca_manual',       'S');

      sSql :=
        'SELECT ta_idareatexto' +
         ' FROM cta_textoarea' +
        ' WHERE ta_fechabaja IS NULL' +
          ' AND ta_idtextocarta = :idtextocarta';
      Fields.Add('ca_idareatexto',  ValorSqlIntegerEx(sSql, [aTextoCartaId]));

      Fields.Add('ca_idtextocarta', aTextoCartaId);
      Fields.Add('ca_correo',       aCorreo);
      Fields.Add('ca_idfirma',      aFirmante);
      Fields.Add('ca_tiposalida',   SALIDA_CARTACOMERCIAL);

      EjecutarSqlST(Sql);

      if aImprimir then
      begin
        DoImprimirCarta(Result, taAfiliaciones, srPrint, tmNone, 1, False, True, True, True, False);
        DoImprimirCarta(Result, taAfiliaciones, srPrint, tmNone, 1, False, True, True, True, False);
      end;

      CommitTrans;
    except
      on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + CRLF + 'Error al grabar la carta documento.');
      end;
    end;
  finally
    aSql.Free;
  end;
end;

function Get_CuilValido(aDocumento, aSexo: String; var aCuil: String): Boolean;
var
  sSql: String;
begin
  aCuil := '';

  if (not IsEmptyString(aDocumento)) and (IsNumber(aDocumento)) and (AreIn(aSexo, ['F', 'M'])) then
  begin
    sSql := 'SELECT art.get_cuilvalido(:dni, :sexo, :opcion) FROM DUAL';
    aCuil := ValorSqlEx(sSql, [LPad(aDocumento, '0', 8), aSexo, 1]);
  end;

  Result := not IsEmptyString(aCuil);
end;

function Is_GrabarCuilValido(aDocumento, aSexo: String; var aCuil: String): Boolean;
var
  bCuilVacio: Boolean;
  bExisteCuil: Boolean;
  bGrabar: Boolean;
  sCuilNuevo: String;
begin
  aCuil := '';

  if Get_CuilValido(aDocumento, aSexo, sCuilNuevo) then
  begin
    bExisteCuil := ExisteCuil(sCuilNuevo);
    bCuilVacio  := IsEmptyString(sCuilNuevo);

    bGrabar := (not bExisteCuil) and (not bCuilVacio);

    if not bCuilVacio then
      aCuil := sCuilNuevo;
  end
  else
    bGrabar := False;

  Result := bGrabar;
end;

function Is_CUILIndeterminado(aCuil: String): Boolean;
begin
  Result := ((StrLeft(aCuil, 2) = '96') and (StrRight(aCuil, 1) = '*'));
end;

function Is_DDJJEmptyUltPeriodo(aContrato: Integer): Boolean;
var
  sSql : String;
begin
  {sSql := 'SELECT 1' +
             ' FROM emi.idj_ddjj' +
            ' WHERE dj_empleados = 0' +
             ' AND dj_periodo = (SELECT MAX(dj_periodo)' +
                                  '  FROM emi.idj_ddjj' +
                                  ' WHERE dj_contrato =:contrato)' +
             ' AND dj_contrato = :contrato'; }

  //Query provisto por PMarrone via email miércoles 04/12/2013 01:56 p.m.           
  sSql :=
    'SELECT 1' +
     ' FROM emi.idj_ddjj' +
    ' WHERE dj_id = emi.utiles.get_ultimaiddeclaracion(:contrato, TO_CHAR(SYSDATE, ''YYYYMM''))' +
      ' AND dj_empleados = 0';

  Result := ExisteSQLEx(sSql, [aContrato]);
end;

function Is_EmpresaPagoSUSS(aContrato: Integer): Boolean;
var
  sSql : String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM aco_contrato JOIN aem_empresa ON co_idempresa = em_id' +
    ' WHERE em_suss = 1' +
      ' AND co_contrato = :contrato';
  Result := ExisteSQLEx(sSql, [aContrato]);
end;

function Is_FechaIngresoAltaRelacionLaboralOk(const aFechaIngreso: TDate; const aCuil: String; const aContrato: Integer): Boolean;
var
  bExiste: Boolean;
  dFechaAlta: TDate;
  sSql: String;
begin
  //veo si existe y tiene una relacion laboral
  sSql :=
    'SELECT 1' +
     ' FROM crl_relacionlaboral' +
    ' WHERE rl_idtrabajador = (SELECT tj_id FROM ctj_trabajador WHERE tj_cuil = :cuil)' +
      ' AND rl_contrato = :contrato';
  bExiste := ExisteSQLEx(sSql, [aCuil, aContrato]);
  
  if bExiste then
  begin
    sSql :=
      'SELECT rl_fechaalta' +
       ' FROM crl_relacionlaboral' +
      ' WHERE rl_idtrabajador = (SELECT tj_id FROM ctj_trabajador WHERE tj_cuil = :cuil)' +
        ' AND rl_contrato = :contrato';
    dFechaAlta := ValorSqlDateTimeEx(sSql, [aCuil, aContrato]);
    
    Result := not ((AddMonths(dFechaAlta, 2) < aFechaIngreso) or (AddMonths(dFechaAlta, -2) > aFechaIngreso));
  end
  else
    Result := True;
end;

function Is_FechaIngresoVigenciaDesdeIngresoTrabajadorOk(const aFechaIngreso: TDate; const aContrato: TTableId): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT co_vigenciadesde' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato =:contrato';

  Result := ValorSqlDateTimeEx(sSql, [aContrato]) < aFechaIngreso;
end;

function Get_NombreARTFutura(aContrato: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT ar_nombre' +
     ' FROM ate_traspasoegreso ate, aar_art' +
    ' WHERE ate.te_contrato = :contrato' +
      ' AND ate.te_fechabaja IS NULL' +
      ' AND ar_id = ate.te_idartfutura' +
      ' AND EXISTS(SELECT   MAX(te.te_fecha)' +
                     ' FROM ate_traspasoegreso te' +
                    ' WHERE te.te_contrato = ate.te_contrato' +
                 ' GROUP BY te.te_contrato' +
                   ' HAVING ROUND(SYSDATE - MAX(te.te_fecha), 0) < 60)';
  Result := ValorSqlEx(sSql , [aContrato]);
end;

{$IFDEF REPORTES_AFI}
procedure ImprimirUltimaRenovacionAutomatica(const aContrato: TTableId; const IsMail: Boolean = False);
var
  sEndoso: String;
  sSql: String;
begin
  sEndoso := '';
  sSql :=
    'SELECT 1' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato' +
      ' AND co_estado = ''1''';
  if not ExisteSqlEx(sSql, [aContrato]) then
  begin
    MsgBox('El contrato no se encuentra Activo.');
    Abort;
  end;

  sSql :=
    'SELECT MAX(en_id)' +
     ' FROM aen_endoso' +
    ' WHERE en_contrato = :contrato' +
      ' AND en_motivo = ''11''';
  sEndoso := ValorSqlEx(sSql, [aContrato]);
  if sEndoso = '' then
  begin
    MsgBox('El contrato no tiene endoso de Renovación automática.');
    Abort;
  end;

  with TfrmImprimeContrato.Create(nil) do
  begin
    Clear;

    Endosos.Add(sEndoso);
    TipoEndosos.Add('11');
    Contratos.Add(IdToStr(aContrato));
    Visible := False;
    chkEndoso.Checked := True;
    chkImprimirMembrete.Checked := True;
    if IsMail then
      btnEnviarPorEmailClick(nil)
    else
      Preparar(False);
    Free;
  end;
end;
{$ENDIF}

function Get_TrabajadorCarta(NroCartaDoc: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT ca_nombre_trabajador' +
     ' FROM archivo.vca_carta_all' +
    ' WHERE ca_nrocartadoc = :nrocarta';
  Result := ValorSqlEx(sSql, [NroCartaDoc]);
end;

function Get_EmpresaCarta(NroCartaDoc: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT ca_razon_social' +
     ' FROM archivo.vca_carta_all' +
    ' WHERE ca_nrocartadoc = :nrocarta';

  Result := ValorSqlEx(sSql, [NroCartaDoc]);
end;

function Get_CodRegimenContratoAfi(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql := 'ART.AFILIACION.GET_CODREGIMENCONTRATOAFI(:Contrato)';

  Result := ObtenerValorEx(sSql, [Contrato]);
end;

function Get_DescrRegimenContratoAfi(Contrato: Integer): String;
var
  sSql: String;
begin
  sSql := 'ART.AFILIACION.GET_DESCRREGIMENCONTRATOAFI(:Contrato)';

  Result := ObtenerValorEx(sSql, [Contrato]);
end;

end.

