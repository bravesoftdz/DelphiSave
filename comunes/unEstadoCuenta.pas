unit unEstadoCuenta;

interface

function Get_MaxFechaConcQuiebra(Cuit: String): TDateTime;
procedure Generar_SQLIntereses(Cuit: String; Contrato: Integer; FechaInteresHasta: TDateTime; InteresPerConcQuiebra: Boolean; var SqlTasaInteresFinal, sSqlInteresPositivo, SqlVencimientoCuota: String);

implementation

uses
  unDmPrincipal, AnsiSql, SysUtils, DateTimeFuncs;

{----------------------------------------------------------------------------------------------------------------------}
function Get_MaxFechaConcQuiebra(Cuit: String): TDateTime;
var
  sSql: String;
  MaxFecha: String;
begin
  sSql := 'COBRANZA.GET_MAXFECHACONCQUIEBRA(:sCuit)';
  MaxFecha := ObtenerValorEx(sSql, [Cuit]);

  if MaxFecha = '' then
    Result := 0
  else
    Result := StrToDate(MaxFecha);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure Generar_SQLIntereses(Cuit: String; Contrato: Integer; FechaInteresHasta: TDateTime; InteresPerConcQuiebra: Boolean; var SqlTasaInteresFinal, sSqlInteresPositivo, SqlVencimientoCuota: String);
var
  SqlTasaInteresHasta, SqlTasaInteresCQ: String;
  FechaQuiebra, FechaInteresHastaCQ: TDateTime;
begin
  FechaQuiebra := Get_MaxFechaConcQuiebra(Cuit);

  // Obtengo la fecha de vencimiento de la cuota a la que pertenece el periodo
  SqlVencimientoCuota := 'DEUDA.GET_VENCIMIENTOCUOTA( SUBSTR(' + SqlValue(Cuit) + ', 11, 1), RC_PERIODO)';

  if (FechaInteresHasta = 0) or ((FechaInteresHasta <= FechaQuiebra) and (not InteresPerConcQuiebra)) then
    SqlTasaInteresFinal := '0 TASAINTERES, '
  else
  begin
    // Obtengo la tasa de interes hasta la fecha de interés hasta
    SqlTasaInteresHasta := 'DEUDA.GET_TASAACUMULADA(' + SqlVencimientoCuota + ' + 1, ' + SqlValue(FechaInteresHasta) + ')';

    if FechaQuiebra = 0 then
      SqlTasaInteresFinal := SqlTasaInteresHasta + ' TASAINTERES, '
    else
      begin   // en concurso/quiebra
        if InteresPerConcQuiebra then
          begin
            FechaInteresHastaCQ := MinDate(FechaQuiebra, FechaInteresHasta);
            SqlTasaInteresCQ    := 'DEUDA.GET_TASAACUMULADA(' + SqlVencimientoCuota + ' + 1, ' + SqlValue(FechaInteresHastaCQ) + ')';
          end
        else
          // La tasa de interes se aplica si el periodo no esta en concurso o quiebra
          SqlTasaInteresCQ := '0';

        SqlTasaInteresFinal := 'TO_NUMBER(UTILES.IIF_COMPARA(''>'', TO_CHAR(' + SqlValue( FechaQuiebra ) + ',''YYYYMM''), RC_PERIODO, ' + SqlTasaInteresCQ + ', ' + SqlTasaInteresHasta + ' )) TASAINTERES, ';
      end;
  end;

  //Si el importe reclamado es <> 0 entonces la tasa de interes es cero
  sSqlInteresPositivo := 'DECODE(IMPORTERECLAMOAFIP, 0, TASAINTERES, GREATEST(TASAINTERES, 0))';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

