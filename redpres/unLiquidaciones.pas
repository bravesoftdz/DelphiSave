unit unLiquidaciones;

interface

{Obtiene el nuevo estado de la autorización en base a la cantidad consumida}
function Get_EstadoAutorizacion(iCantCons, iAntCantApro: Currency): String;

{Actualiza el estado y la cantidad consumida de la autorización}
procedure Do_ActualizarAutorizacion(iSiniestro, iOrden, iRecaida, iNumAuto: Integer; iCantCons: Currency; sEstado: String);

{Libero el posible debito de auditoria que se le pudo haber aplicado}
procedure Do_LiberarPosibleDebitoAuditoria(iVolante: Integer; iSiniestro: Integer = 0; iOrden: Integer = 0; iRecaida: Integer = 0; iSecuencia: Integer = 0);

implementation

uses
  unSesion, AnsiSql, unDmPrincipal, General;

function Get_EstadoAutorizacion(iCantCons, iAntCantApro: Currency): String;
var
  sEstado: String;
begin
  if iCantCons = 0 then
    sEstado := 'A'
  else if iCantCons >= iAntCantApro then
    sEstado := 'L'
  else
    sEstado := 'C';

  Result := sEstado;
end;

procedure Do_ActualizarAutorizacion(iSiniestro, iOrden, iRecaida, iNumAuto: Integer; iCantCons: Currency; sEstado: String);
var
  sSQL: String;
begin
  sSQL := ' UPDATE sau_autorizaciones ' +
             ' SET au_cantconsu = ' + SqlNumber(iCantCons) + ', ' +
                 ' au_estado = ' + SqlValue(sEstado) +
           ' WHERE au_siniestro = ' + SqlInt(iSiniestro) +
             ' AND au_orden = '     + SqlInt(iOrden) +
             ' AND au_recaida = '   + SqlInt(iRecaida) +
             ' AND au_numauto = '   + SqlInt(iNumAuto);
  EjecutarSqlST(sSQL);
end;

procedure Do_LiberarPosibleDebitoAuditoria(iVolante: Integer; iSiniestro: Integer = 0; iOrden: Integer = 0; iRecaida: Integer = 0; iSecuencia: Integer = 0);
var
  sSQL: String;
begin
  sSQL := 'UPDATE sin.sdv_debitosvolantes ' +
            ' SET dv_aplicado = ''N'', ' +
                ' dv_numpago = NULL, ' +
                ' dv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' dv_fechamodif = ART.ACTUALDATE ' +
          ' WHERE dv_volante = ' + SqlInt(iVolante) +
            ' AND dv_aplicado = ''S'' ' +
            ' AND dv_fechabaja IS NULL ' +
            iif(iSiniestro > 0,
            ' AND dv_siniestro = ' + SqlInt(iSiniestro) +
            ' AND dv_orden = ' + SqlInt(iOrden) +
            ' AND dv_recaida = ' + SqlInt(iRecaida),
            '') +
            iif((iSiniestro > 0) and (iSecuencia > 0),
            ' AND dv_numpago = ' + SqlInt(iSecuencia),
            '');
  EjecutarSqlST(sSQL);
end;

end.
