unit unDmFinancials;

interface

uses
  {$IFDEF SERVICE}SvcMgr,  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomDataModule, Db, SDEngine, ArtDatabase, SQLFuncs, SDOra;

type
  TdmFinancials = class(TdmCustomDataModule)
  private
    function GetActive: boolean;
    procedure SetActive(const Value: Boolean);
  protected
    AConnectionsCount: integer;
    function OpenFinancials : Boolean;
    function ConfigureDataBase: Boolean; override;
  public
    function Conectar: Boolean;
    function Desconectar: Boolean;
    function ReconectarBD: Boolean;
    function VerificaConexion({$IFDEF SERVICE}AService: TService{$ENDIF}): Boolean;

    procedure EjecutarStore(ASql: StringSql);
    procedure EjecutarStoreEx(ASql: StringSql; AValues: array of TVarRec);
    procedure EjecutarStoreST(ASql: StringSql);
    procedure EjecutarStoreSTEx(ASql: StringSql; AValues: array of TVarRec);
  published
    property Active : Boolean read GetActive write SetActive;
  end;

var
  dmFinancials: TdmFinancials;

implementation

uses
  unDebug;
  
Const
  EJEC_STOREPROCEDURE = 'BEGIN'#13#10' %s '#13#10'END;';
  EJEC_FUNCTION = 'SELECT %s '#13#10'FROM DUAL';

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TdmFinancials }
{------------------------------------------------------------------------------}
function TdmFinancials.Conectar: Boolean;
begin
  Inc(AConnectionsCount);
  Result := OpenFinancials;
end;
{------------------------------------------------------------------------------}
function TdmFinancials.ConfigureDataBase: Boolean;
begin
  AConnectionsCount := 0;
  {$IFDEF FINANCIALS_AUTOCONNECT}
  Result := OpenFinancials;
  {$ELSE};
  Result := False;
  {$ENDIF};
end;
{------------------------------------------------------------------------------}
function TdmFinancials.Desconectar: Boolean;
begin
  Dec(AConnectionsCount);
  if AConnectionsCount = 0 then
  begin
    Active := False;
    Result := False;
  end else
    Result := True;
end;
{------------------------------------------------------------------------------}
function TdmFinancials.GetActive: Boolean;
begin
  Result := sdbPrincipal.Connected ;
end;
{------------------------------------------------------------------------------}
function TdmFinancials.OpenFinancials: Boolean;
begin
  Result := SetIniSettings( 'Financials', sdbPrincipal );
end;
{------------------------------------------------------------------------------}
procedure TdmFinancials.SetActive(const Value: Boolean);
begin
  if Value then begin
    if not GetActive then
      OpenFinancials;
  end else
    sdbPrincipal.Connected := False;
end;
{------------------------------------------------------------------------------}
procedure TdmFinancials.EjecutarStore( ASql : StringSql );
begin
  dmFinancials.EjecutarSql( Format(EJEC_STOREPROCEDURE, [ASql]) );
end;
{------------------------------------------------------------------------------}
procedure TdmFinancials.EjecutarStoreEx(ASql: StringSql; AValues: array of TVarRec);
begin
  dmFinancials.EjecutarSqlEx(Format(EJEC_STOREPROCEDURE, [ASql]), AValues);
end;
{------------------------------------------------------------------------------}
procedure TdmFinancials.EjecutarStoreST( ASql : StringSql );
begin
  dmFinancials.EjecutarSqlST(Format(EJEC_STOREPROCEDURE, [ASql]) );
end;
{------------------------------------------------------------------------------}
procedure TdmFinancials.EjecutarStoreSTEx(ASql: StringSql; AValues: array of TVarRec);
begin
  dmFinancials.EjecutarSqlSTEx(Format(EJEC_STOREPROCEDURE, [ASql]), AValues);
end;
{------------------------------------------------------------------------------}
function TdmFinancials.VerificaConexion({$IFDEF SERVICE}AService: TService{$ENDIF}): Boolean;
var
  bConectar, bExiste : Boolean;
begin
  Result    := True;
  bConectar := True;
  try
    try
      bConectar := not Active;

      if bConectar then
        dmFinancials.Conectar;

      bExiste := dmFinancials.ExisteSql('SELECT 1 FROM DUAL');
      if not bExiste then Result := False;
    finally
      if bConectar then
        dmFinancials.Desconectar;
    end;
  except
    on E: ESDOraError do
    begin
      {$IFDEF SERVICE}
      AService.LogMessage('Error al verificar la conexión: ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      {$ELSE}
      unDebug.AddToLog('Error al verificar la conexión: ' + E.Message, ltError);
      {$ENDIF}
      if   ReconectarBD
      then Result := True
      else Result := False;
    end;
  end;
end;
{------------------------------------------------------------------------------}
function TdmFinancials.ReconectarBD: Boolean;
begin
  Result := ConfigureDataBase;
end;
{------------------------------------------------------------------------------}
end.
