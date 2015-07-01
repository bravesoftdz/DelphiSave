unit unImportFromSRT;

interface

uses
  Controls, SysUtils;

type
  TStatusSrt = record
    ArtAnterior: Integer;
    CodigoProvincia: String;
    Error: Boolean;
    MsgError: String;
    Status: String;
end;

function ObtenerStatusSrt(const aCuit: String; const aIdSolicitud: Integer): TStatusSrt;

implementation

uses
  unImportCryptoSrt, unDmPrincipal;

function ObtenerStatusSrt(const aCuit: String; const aIdSolicitud: Integer): TStatusSrt;
var
  aVig: TCuilSRT;
  dFecha: TDate;
  dFechaReg: TDate;
  iLoop: Integer;
  sOperacion: String;
  sSql: String;
begin
  Result.ArtAnterior := -1;
  Result.CodigoProvincia := '';
  Result.Error := False;
  Result.MsgError := '';
  Result.Status := '-1';

  try
    aVig := ConsultarVigencia(aCuit);
    Result.MsgError := aVig.Error;
    dFecha := StrToDate('01/01/1950');

    if (aVig.Error = '') or (aVig.ErrorCodigo = 'CC01') then
    begin
      Result.CodigoProvincia := aVig.DataCuil.ProvinciaID;

      if Length(aVig.Historial) = 0 then
        Result.Status := '1'    // Nueva al régimen..
      else
      begin
        for iLoop := 0 to Length(aVig.Historial) - 1 do
        begin
          dFechaReg := StrToDate(Copy(aVig.Historial[iLoop].FechaOperacionDesde, 1, 10));

          if dFechaReg > dFecha then
          begin
            sOperacion := aVig.Historial[iLoop].OperacionHasta;
            if sOperacion = '' then
              Result.Status := '2';   // Afiliación vigente..
            if (sOperacion = 'Ceseactiv.') or (sOperacion = 'Cese activ.') then
              Result.Status := '3';
            if (sOperacion = 'Sintrabaj.') or (sOperacion = 'Sin trabaj.') then
              Result.Status := '4';
            if (sOperacion = 'Rescisión') or (sOperacion = 'Rescision')  then
            begin
              if aVig.Historial[iLoop].Regularizacion = 'PAGO DE LA DEUDA' then
                Result.Status := '5';
              if aVig.Historial[iLoop].Regularizacion = 'POR EL TRANSCURSO DE UN AÑO' then
                Result.Status := '7';
              if aVig.Historial[iLoop].Regularizacion = 'CONTRATO EXTINGUIDO' then
                Result.Status := '6';
              if aVig.Historial[iLoop].Regularizacion = '' then
                Result.Status := '6';
            end;
            dFecha := StrToDateTime(aVig.Historial[iLoop].FechaOperacionDesde);

            sSql :=
              'SELECT ar_id' +
              ' FROM afi.aar_art' +
              ' WHERE ar_codigosrt = :codigosrt';
            Result.ArtAnterior := ValorSqlIntegerEx(sSql, [aVig.Historial[iLoop].Aseguradora]);
          end;
        end;
      end;
    end
    else
    begin
      Result.ArtAnterior := -1;
      Result.Error := True;
      Result.Status := '-1';
    end;

    if (Result.Status <> '-1') then
    begin
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_fecha_ctrl_srt = SYSDATE' +
        ' WHERE sc_id = :id';
      EjecutarSqlEx(sSql, [aIdSolicitud])
    end;
  except
    on E: Exception do
    begin
      Result.ArtAnterior := -1;
      Result.CodigoProvincia := '';
      Result.Error := True;
      Result.Status := '-1';
    end;
  end;
end;

end.
