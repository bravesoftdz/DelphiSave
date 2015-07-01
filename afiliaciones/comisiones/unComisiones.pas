unit unComisiones;

interface

uses
  unArt;

function DoLiquidar(aId: TTableId; aTipoLiq: String; aConTrans: Boolean): Boolean;
function Get_Ejecutivo(aIdEntidad: TTableId): String;
function Get_IdVendedor(aCuit: String): TTableId;
function Get_PorcComisionVendedor(aIdEntidad: TTableId): Double;
function Get_PorcComisionVendedorPub(aIdEntidad: TTableId): Double;
procedure Do_InsertarComisionGranOrgnizador(IdAVC: TTableId; ConTrans: Boolean);
function Get_Organizador(aIdEntidad: TTableId): String;

implementation

uses
  unDmPrincipal, CustomDlgs, unSesion;

function Get_PorcComisionVendedor(aIdEntidad: TTableId): Double;
var
  sSql: String;
begin
  sSql :=
    'SELECT en_porccomisionvend' +
     ' FROM xen_entidad' +
    ' WHERE en_id = :id';
  Result := ValorSqlExtendedEx(sSql, [aIdEntidad]);
end;

function Get_PorcComisionVendedorPub(aIdEntidad: TTableId): Double;
var
  sSql: String;
begin
  sSql :=
    'SELECT en_porccomisionvendpub' +
     ' FROM xen_entidad' +
    ' WHERE en_id = :id';
  Result := ValorSqlExtendedEx(sSql, [aIdEntidad]);
end;

function DoLiquidar(aId: TTableId; aTipoLiq: String; aConTrans: Boolean): Boolean;
var
  bLiquidar: Boolean;
  sSql: String;
begin
  sSql :=
    'SELECT comision.is_liquidable(:id, :tipoliq)' +
     ' FROM DUAL';

  if ValorSqlEx(sSql, [aId, aTipoLiq]) = 'N' then
  begin
    bLiquidar := False;
    MsgBox('Ya existe una liquidación para el vendedor con esta fecha de cierre.');
  end
  else
  begin
    sSql := 'comision.do_liquidacion(:id, :tipoliq, :usuario);';
    if aConTrans then
      EjecutarStoreEx(sSql, [aId, aTipoLiq, Sesion.UserID])
    else
      EjecutarStoreSTEx(sSql, [aId, aTipoLiq, Sesion.UserID]);

    bLiquidar := True;
  end;

  Result := bLiquidar;
end;

function Get_Ejecutivo(aIdEntidad: TTableId): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT ec_usuario' +
     ' FROM aec_ejecutivocuenta, xen_entidad' +
    ' WHERE en_idejecutivo = ec_id' +
      ' AND en_id = :id';
  Result := ValorSqlEx(sSql, [aIdEntidad]);
end;

function Get_IdVendedor(aCuit: String): TTableId;
var
  sSql: String;
begin
  sSql :=
    'SELECT MAX(ve_id)' +
     ' FROM xve_vendedor' +
    ' WHERE ve_fechabaja IS NULL' +
      ' AND ve_cuit = :cuit';
  Result := ValorSqlIntegerEx(sSql, [aCuit]);
end;

procedure Do_InsertarComisionGranOrgnizador(IdAVC: TTableId; ConTrans: Boolean);
var
  sSql: String;
begin
  sSql := 'ART.COMISION.DO_INSERTARCOMISGRANORGNIZADOR(:IdAVC);';

  if ConTrans then
    EjecutarStoreEx(sSql, [IdAVC])
  else
    EjecutarStoreSTEx(sSql, [IdAVC]);
end;

function Get_Organizador(aIdEntidad: TTableId): String;
var
  sSql: String;
begin
  sSql := 'ART.COMISION.GET_NOMBREORGANIZADOR(:IdEntidad)';

  Result := ObtenerValorEx(sSql, [aIdEntidad]);
end;

end.

