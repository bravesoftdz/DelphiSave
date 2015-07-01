unit unSistemas;

interface

const
  SECTOR_AUDITORIA = 6015;
  SECTOR_DESARROLLO = 23032;
  SECTOR_SEGINFO = 89125;

function GetIdSistemaTicket(AUsuario: String = ''): Integer;

implementation

uses
  unDmPrincipal, Strfuncs, unSesion, AnsiSql,
  {$IFDEF TICKETS}unSeleccionSistemaTickets,{$ENDIF}
  CustomDlgs;

function GetIdSistemaTicket(AUsuario: String): Integer;
var
  sSQL: String;
begin
  if IsEmptyString(AUsuario) then
    AUsuario := Sesion.UserID;

  sSQL := 'SELECT DISTINCT ts_idsistematicket ' +
            'FROM computos.cts_ticketsector, computos.cse_sector sector, art.use_usuarios users ' +
           'WHERE users.se_usuario = :usuario ' +
             'AND art.agenda_pkg.is_sectordependiente(sector.se_id, users.se_idsector) = :si ' +
             'AND art.agenda_pkg.is_sectordependiente(ts_idsector, sector.se_id) = :si';

  with GetQueryEx(sSQL, [AUsuario, 'S']) do
  try
    if not IsEmpty then
    begin
      if RecordCount = 1 then
        Result := Fields[0].AsInteger
      {$IFDEF TICKETS}
      else
        Result := TfrmSeleccionSistemaTickets.Seleccionar(AUsuario)
      {$ELSE}
      else
        Result := -1;
      {$ENDIF}
    end else
    begin
      Result := -1;
      MsgBox('Usted no está habilitado para usar ningún sistema de tickets.');
    end;
  finally
    Free;
  end;
end;

end.
