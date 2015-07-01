unit unArchivo;

interface

uses
  DB, DBGrids, QueryPrint, unArt;

const
  { Campos de las Etiquetas }
  FET_CODIGO      = 'CODIGO';
  FET_DESCRIPCION = 'DESCRIPCION';
  FET_SUPERIOR    = 'TEXTO_SUPERIOR';
  FET_INFERIOR    = 'TEXTO_INFERIOR';

function IsAcuseCartaDocumento(Codigo: String): Boolean;
function GetSubClave(Clave: String; Posicion: Integer): String;
procedure GetSubClaves(Clave: String; var SubClave1, SubClave2, SubClave3, SubClave4: String);
procedure DoMostrarMensajesAdvertenciaCarpeta(Tipo: Integer; Clave: String);
function IsOrdenPagoAnulada(OP: Integer): Boolean;
procedure DoMostrarAnulacionCarpeta(Tipo: Integer; Clave: String);
procedure DoMostrarReemplazosCarpeta(Tipo: Integer; Clave: String);
function GetCantCamposBusquedaTipoArchivo(Tipo: Integer): Integer;
function GetClaveArmada(CantCampos:Integer; Subclave1, Subclave2, Subclave3, Subclave4: String): String;
function GetCodBarrasClave(CodDocumento: String; SubClave1: String; SubClave2: String = ''; SubClave3: String = ''; SubClave4: String = ''): String;
procedure DoArmarIdArchivos(TipoArchivo: TTableId; Clave: String; var IdArchivos: String);
function IsCarpetaAnulada(TipoArchivo: TTableId; Clave: String): Boolean;

implementation

uses
  General, unDmPrincipal, unConstantArchivo, AnsiSql, StrFuncs, CustomDlgs,
  SysUtils, Classes, Windows, unComunesArchivo;

function IsAcuseCartaDocumento(Codigo: String): Boolean;
begin
  Result := (AreIn(Codigo, [CODDOC_ACUSECARTADOC, CODDOC_DEVOLCARTADOC, CODDOC_ACUSECARTACOM, CODDOC_REIMPACUSECARTADOC, CODDOC_REIMPDEVOLCARTADOC]));    // Acuse Carta Documento / Devolución Carta Documento / Acuses de Cartas Comerciales / Reimpresión de Acuse Carta Documento / Reimpresión de Devolución de Carta Documento
end;

function GetSubClave(Clave: String; Posicion: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT ARCHIVO.GETSUBCLAVE(:Clave, :Pos) ' +
            'FROM DUAL';

  Result := Trim(ValorSqlEx(sSql, [Clave, Posicion]));
end;

procedure GetSubClaves(Clave: String; var SubClave1, SubClave2, SubClave3, SubClave4: String);
begin
  SubClave1 := GetSubClave(Clave, 1);
  SubClave2 := GetSubClave(Clave, 2);
  SubClave3 := GetSubClave(Clave, 3);
  SubClave4 := GetSubClave(Clave, 4);
end;

procedure DoMostrarMensajesAdvertenciaCarpeta(Tipo: Integer; Clave: String);
begin
  DoMostrarReemplazosCarpeta(Tipo, Clave);
  DoMostrarAnulacionCarpeta(Tipo, Clave);
end;

function IsOrdenPagoAnulada(OP: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT ART.TESORERIA.is_op_anulada(:nOP) ' +
            'FROM DUAL';

  Result := (ValorSqlEx(sSql, [OP]) = 'S');
end;

procedure DoMostrarAnulacionCarpeta(Tipo: Integer; Clave: String);
var
  sMensAnulacion: String;
begin
  if Tipo = ID_CARPETA_TESORERIA then
    begin
      sMensAnulacion := 'La orden de pago se encuentra anulada.';

      if IsOrdenPagoAnulada(StrToInt(Clave)) then
        MsgBox(sMensAnulacion, MB_ICONINFORMATION);
    end;
end;

procedure DoMostrarReemplazosCarpeta(Tipo: Integer; Clave: String);
var
  sMensReemplazos, sReemplazadasPor, sReemplazantesDe, sSql: String;
  SqlResults: TStringList;
  bReemplazantesDe, bReemplazadasPor: Boolean;
  iSiniestro, iOrden: Integer;
begin
  if (Tipo = ID_CARPETA_TESORERIA) or (Tipo = ID_CARPETA_SINIESTRO) then
    begin
      if Tipo = ID_CARPETA_TESORERIA then
        begin
          sReemplazantesDe := 'ART.TESORERIA.get_lista_op_reemplazantesde(' + SqlValue(StrToInt(Clave)) + ')';
          sReemplazadasPor := 'ART.TESORERIA.get_lista_op_reemplazadaspor(' + SqlValue(StrToInt(Clave)) + ')';
        end
      else
        begin
          iSiniestro := StrToInt(GetSubClave(Clave, 1));
          iOrden     := StrToInt(GetSubClave(Clave, 2));
          sReemplazantesDe := 'ART.SINIESTRO.get_lista_sin_reemplazantesde(' + SqlValue(iSiniestro) + ', ' + SqlValue(iOrden) + ')';
          sReemplazadasPor := 'ART.SINIESTRO.get_lista_sin_reemplazadospor(' + SqlValue(iSiniestro) + ', ' + SqlValue(iOrden) + ')';
        end;

      sSql := 'SELECT ' + sReemplazantesDe + ', ' + sReemplazadasPor + ' ' +
                'FROM DUAL';
      SqlResults := ValoresColSql(sSql);
      try
         sReemplazantesDe := SqlResults[0];
         bReemplazantesDe := not IsEmptyString(sReemplazantesDe);

         sReemplazadasPor := SqlResults[1];
         bReemplazadasPor := not IsEmptyString(sReemplazadasPor);

         if bReemplazantesDe or bReemplazadasPor then
           begin
             sMensReemplazos := 'Existe posible Documentación Complementaria a la indicada.' + CRLF +
                                 Iif(bReemplazantesDe, '  Carpetas Reemplazantes de la ingresada: ' + sReemplazantesDe + '.' + CRLF, '') +
                                 Iif(bReemplazadasPor, '  Carpetas Reemplazadas por la ingresada: ' + sReemplazadasPor + '.' + CRLF, '');
             MsgBox(sMensReemplazos, MB_ICONINFORMATION);
           end;
      finally
        SqlResults.Free;
      end;
    end;
end;

function GetCantCamposBusquedaTipoArchivo(Tipo: Integer): Integer;
var
  sSql: String;
begin
  sSql := 'ART.ARCHIVO.GET_CANTCAMPOSBUSQUEDATIPOARCH(:Tipo)';

  Result := ObtenerValorEx(sSql, [Tipo]);
end;

function GetClaveArmada(CantCampos:Integer; Subclave1, Subclave2, Subclave3, Subclave4: String): String;
var
  sCad: String;
begin
  sCad := '';

  case CantCampos of
    1: sCad := Trim(Subclave1);
    2: sCad := Trim(Subclave1) + '|' + Trim(Subclave2);
    3: sCad := Trim(Subclave1) + '|' + Trim(Subclave2) + '|' + Trim(Subclave3);
    4: sCad := Trim(Subclave1) + '|' + Trim(Subclave2) + '|' + Trim(Subclave3) + '|' + Trim(Subclave4);
  end;

  Result := sCad;
end;

function GetCodBarrasClave(CodDocumento: String; SubClave1: String; SubClave2: String = ''; SubClave3: String = ''; SubClave4: String = ''): String;
var
  sSql: String;
begin
  sSql := 'SELECT ARCHIVO.GET_CODBARRASCLAVE(:CodDocumento, :SubClave1, :SubClave2, :SubClave3, :SubClave4) ' +
            'FROM DUAL';

  Result := ValorSqlEx(sSql, [CodDocumento, SubClave1, SubClave2, SubClave3, SubClave4]);
end;

procedure DoArmarIdArchivos(TipoArchivo: TTableId; Clave: String; var IdArchivos: String);
var
  IdArchivo: TTableId;
begin
  IdArchivo := GetIdArchivo(TipoArchivo, Clave);
  if IdArchivo <> ART_EMPTY_ID then
    IdArchivos := IdArchivos + IntToStr(IdArchivo) + ', ';
end;

function IsCarpetaAnulada(TipoArchivo: TTableId; Clave: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO ' +
           'WHERE AR_TIPO = :Tipo ' +
             'AND AR_CLAVE = :Clave ' +
             'AND AR_TIPOUBICACION = :TipoUbic ' +
             'AND AR_UBICACION = :Ubic';

  Result := ExisteSqlEx(sSql, [TipoArchivo, Clave, TIPOUBICACION_LUGAR, UBIC_ANULADA]);
end;

end.

