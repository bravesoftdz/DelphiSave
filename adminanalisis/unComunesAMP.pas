unit unComunesAMP;

interface

uses
  SysUtils, unSesion, unDmPrincipal, AnsiSql, General, Classes;

procedure NotificarEmpresaPeriodicos(aLote: integer; aContrato: integer; aIdEstab: integer; aTipoEnvio: integer);
procedure AgregarObservacion(aidlote: integer; aidestab: integer; aObs: String; aidObs: integer);

implementation

uses
  unRptInformeAsigLoteEmpresa;

procedure NotificarEmpresaPeriodicos(aLote: integer; aContrato: integer; aIdEstab: integer; aTipoEnvio: integer);
var
  rptInformeAsigLoteEmpresa: TrptInformeAsigLoteEmpresa;
  bNotifico: boolean;
  observacionAux : TStrings;
  idcodigo : Integer;
begin
  bNotifico := false;
  //Carta o Fax
  if (aTipoEnvio = 1) or (aTipoEnvio = 2) then
  begin
    rptInformeAsigLoteEmpresa := TrptInformeAsigLoteEmpresa.Create(nil);
    try
      with rptInformeAsigLoteEmpresa do
      begin
        FIDLoteRpt   := aLote;
        // imprimir
        rptInformeAsigLoteEmpresa.qrInformeAsigLoteEmpresa.Preview;
        bNotifico := true;
      end;
    finally
      rptInformeAsigLoteEmpresa.Free;
    end;
  end
  else //Mail
    if (aTipoEnvio = 0) then
    begin
      if ExisteSqlEx('SELECT 1 ' +
                     'FROM afi.aco_contrato ' +
                     'WHERE co_direlectronica IS NOT NULL ' +
                     'AND co_contrato = :contrato ', [aContrato]) then
      begin
        EjecutarStoreEx('art.intraweb.do_notificarasiglote(:usuario,:contrato,:idlote,:esreenvio);',
                          [Sesion.UserID, aContrato,
                           aLote, 'N']);
        bNotifico := true;
      end;
    end;

  if bNotifico then
  begin
    observacionAux := TStringList.Create;
    observacionAux.Text := '';
    observacionAux.Add('Se informa a la empresa la asignación del lote vía ' +
             Decode(IntToStr(aTipoEnvio), ['0', '1', '2', '3'], ['Email', 'Fax', 'Carta', 'Ventanilla']));
    EjecutarSql('UPDATE hys.hle_loteestudio ' +
                '   SET le_fechanotifasig = TRUNC(SYSDATE), ' +
                '       le_usunotifasig  = ' + SqlValue (Sesion.LoginName) + ', ' +
                '       le_tiponotifasig = ' + SqlValue( Decode(IntToStr(aTipoEnvio), ['0', '1', '2', '3'], ['M', 'F', 'C', 'V'])) +
                ' WHERE le_fechanotifasig IS NULL' +
                '   AND le_id = ' + SqlValue (aLote));
    idcodigo := GetSecNextVal('hys.seq_hos_id');
    EjecutarSqlEx ('INSERT INTO hys.hos_observacionessublote ' +
                   '            (os_id, os_idlote, os_idestableci, os_fecha, ' +
                   '             os_fechaalta, os_usualta, os_idtipoobservacion) ' +
                   '     VALUES (:idcodigo, :idlote, :idestableci, art.actualdate, ' +
                   '             SYSDATE, :usuario, :idtipoobservacion) ',
                   [idcodigo,
                    aLote,
                    aIdEstab,
                    Sesion.LoginName, 18]);
    SaveBlob('SELECT os_observacion ' +
             '  FROM hys.hos_observacionessublote ' +
             ' WHERE os_id = ' + SqlValue(idcodigo),
             'UPDATE hys.hos_observacionessublote' +
             '   SET os_observacion = :os_observacion ' +
             ' WHERE os_id = ' + SqlValue(idcodigo),
             'os_observacion', observacionAux
             );
    observacionAux.Free;
  end;
end;

procedure AgregarObservacion(aidlote: integer; aidestab: integer; aObs: String; aidObs: integer);
var
  observacionAux : TStrings;
  idcodigo : Integer;
begin
  idcodigo := GetSecNextVal('hys.seq_hos_id');
  EjecutarSqlStEx ('INSERT INTO hys.hos_observacionessublote ' +
                 '            (os_id, os_idlote, os_idestableci, os_fecha, ' +
                 '             os_fechaalta, os_usualta, os_idtipoobservacion) ' +
                 '     VALUES (:idcodigo, :idlote, :idestableci, art.actualdate, ' +
                 '             SYSDATE, :usuario, :idtipoobservacion) ',
                 [idcodigo,aidlote, aidestab, Sesion.LoginName, aidObs]);
  observacionAux := TStringList.Create;
  observacionAux.Text := '';
  observacionAux.Add(aObs);
  SaveBlob('SELECT os_observacion ' +
           '  FROM hys.hos_observacionessublote ' +
           ' WHERE os_id = ' + SqlValue(idcodigo),
           'UPDATE hys.hos_observacionessublote' +
           '   SET os_observacion = :os_observacion ' +
           ' WHERE os_id = ' + SqlValue(idcodigo),
           'os_observacion',observacionAux
          );
  observacionAux.Free;
end;

end.
