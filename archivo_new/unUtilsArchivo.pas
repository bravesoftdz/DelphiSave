{-----------------------------------------------------------------------------
 Unit Name: unUtilsArchivo
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Funciones utilidad para sistema archivo.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unUtilsArchivo;

interface

uses
  unSesion, unDmPrincipal, AnsiSql, SqlFuncs, unArchivo, unArt, unDigitalizacion,
  unConstantArchivo, Classes,{$IFNDEF SERVICE}unFraFiltroArchivo,{$ENDIF}unCustomConsulta, QRCtrls, SDEngine;

type
  TAlineacionControl   = (alNinguna, alIzquierda, alCentro, alDerecha);
  TAlineacionCodBarras = TAlineacionControl;

function GetTienePerfil: Boolean;
function DoInsertArchivo(ATipo : Integer; ATipoUbicacion : String;
                         AUbicacion : String; ACaja : Integer; AReceptor : String;
                         AEmisor : String; AClave : String; ConTrans : Boolean = True;
                         AObservaciones: String = ''): TTableId;
function get_ParametrobyId(AIdParametro : integer) : string;
function GetPerfilAdministrador: Boolean;
function GetPerfilGuardaYDigitalizacion: Boolean;
function DoInsertDetalleArchivo(var IdSecuenciaTraz: Integer; IdArchivo, IdTipoDocumento: TTableId; Numero: Integer;
                                OpcionDestino: String; Hojas: Integer; Observaciones,
                                CodigoDocumento, ClaveExtendida: String; FechaVisita: TDateTime;
                                NroAcuseCorreo: String; ConTrans: Boolean; Siniestro: Integer = 0;
                                Orden: Integer = 0; Recaida: Integer = 0; NroEstableci: String = '';
                                ImprimirEtiqueta: Boolean = False; CantEtiquetas: Integer = 0;
                                MostrarMensajeSecuenciaTraz: Boolean = False;
                                UsarValorEntradaSecuenciaTraz: Boolean = False;
                                TipoAlta: String = 'A'): TTableId;
procedure DoCambiarCarpetaDetalleArchivo(IdDetalleArchivo, IdArchivo: TTableId; Observaciones: String; ConTrans: Boolean);
function Get_IdTipoDocumentoSector(CodDoc, Sector: String): TTableId;
function Get_IdTipoDocumentoOPTesoreria: TTableId;
function Get_IdTipoDocumentoAnulacionOPTesoreria: TTableId;
function Get_IdTipoDocumentoAcuseCorreoTesoreria: TTableId;
function Get_IdTipoDocumentoOCCompras: TTableId;
function Get_IdTipoDocumentoLoteEnvioDocumentacion: TTableId;
function Get_NroFormulario(Siniestro, Orden, Recaida: Integer; CodDocumento: String; TipoArchivo: Integer = ID_CARPETA_SINIESTRO): Integer;
function Get_CodDocumento(Id: TTableId): String;
function Get_CodDescrDocumento(Id: TTableId): String;
function Get_TipoArchivo(Id: TTableId): TTableId;
function Get_TipoDetalleArchivo(Id: TTableId): TTableId;
function Get_TipoDetalleArchivoSecTraz(SecTrazabilidad: TTableId): TTableId;
function Get_ClaveArchivo(Id: TTableId): String;
function Get_ClaveDetalleArchivo(Id: TTableId): String;
procedure Do_Actualizar_Archivo_Sin(ConTrans: Boolean; idexpediente: TTableId; opcion: String; hojas: Integer; usuario, parte: String; numero: Integer; tipoalta: String = ''; danumero: Integer = 0; observaciones: String = '');
function Is_ExisteDocumentoSiniestro(Siniestro, Orden: Integer; CodDocumento: String): Boolean; overload;
function Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, Numero: Integer; CodDocumento: String): Boolean; overload;
function Is_ExisteDocumento(TipoArchivo: Integer; Clave, CodDocumento, NroCarta: String; var Lote: Integer): Boolean;
function Is_CarpetaExtraviada(TipoArchivo: Integer; Clave: String): Boolean;
function Is_TipoArchivoCaja(TipoArchivo: Integer): Boolean;
function Is_TipoArchivoRX(TipoArchivo: Integer): Boolean;
function TipoCartaDocumento(ATipoArchivo: Integer): Boolean;
function CartaDocumento(ATipoArchivo: Integer): Boolean;
function TipoArchivoCartaDocumento(ATipoArchivo: Integer): Boolean;
function TipoArchivoExtractosBancarios(ATipoArchivo: Integer): Boolean;
function TipoArchivoCuentasPagarViaticos(ATipoArchivo: Integer): Boolean;
function TipoArchivoCajaGirosTransferencias(ATipoArchivo: Integer): Boolean;
function TipoArchivoMedicinaLaboral(ATipoArchivo: Integer): Boolean;
procedure DoModificarEstadoLote(Lote: TTableId; Estado: String; ConTransaccion: Boolean);
procedure DoModificarRemitoEnvio(Lote, IdRemitoEnvio: TTableId; ConTransaccion: Boolean);
function DoInsertRemitoEnvioLote(ConTransaccion: Boolean = True): TTableId;
function Get_EstadoLote(Lote: TTableId): String;
procedure DoEnviarMailsReemplazo(Asunto, Cuerpo: String; ConTrans: Boolean = False);
function DoReemplazoCarpeta(ClaveVie, ClaveNue, AsuntoMail, CuerpoMail: String; TipoArchivo: Integer; ConTrans: Boolean = False): Boolean;
function Get_DescripcionClave(Tipo: TTableId; Clave: String): String;
function Get_DescripcionClaveDetalleArchivo(IdDetalleArchivo: TTableId): String;
function Get_DescripcionTipoArchivo(Tipo: TTableId): String;
function Get_UltIdDetalleArchivo(IdArchivo: TTableId; CodDocumento: String): TTableId;
procedure DoInsertDetalleArchivoLegajoContrato(Contrato, CantHojas: Integer; Observaciones: String; ImprimirEtiqueta: Boolean = False; CantEtiquetas: Integer = 0);
function Get_TablaTipoArchivo(Tipo: TTableId): String;
function DoInsertRepositorioArchivo(TipoDocumentoCarpeta: TDocumentoCarpeta; TipoArchivo: TTableId; Clave: String;
                                    IdTipoDocumento: TTableId; PathArchivo, Archivo: String; ConTrans: Boolean = True;
                                    NroMedio: Integer = 0; Lote: Integer = 0; SeqLote: Integer = 0;
                                    Observaciones: String = ''; CodDocumento: String = ''; FechaAlta: TDateTime = 0;
                                    ClaveNoMigrada: String = ''; CajaAdmin: Integer = 0; NroCartaDocumento: String = '';
                                    NroHoja: Integer = 0; Legajo: Integer = 0; NroOperacion_GT: String = '';
                                    Beneficiario_GT: String = ''; FechaOper_GT: TDateTime = 0; NroCheque_GT: String = '';
                                    SecuenciaTraz: Integer = ART_EMPTY_ID): TTableId;
procedure DoCopiarCarpetasRepositorioArchivo(TipoArchivo, IdRarVie, IdRarNue: TTableId);
function GetIdDocumentoArchivo(TipoArchivo: TTableId; CodDocumento: String): TTableId;
function Get_CodigoTipoArchivo(Tipo: TTableId): String;
function IsUtilizarTablasBank: Boolean;
function Get_IdArchivoTransformado(IdArchivo, IdDetalleArchivo: TTableId): TTableId;
{$IFNDEF SERVICE}
procedure DoCargarImagenesDigitalizadasAfi(Owner: TComponent; Contrato: Integer);
procedure DoCargarImagenesDigitalizadasSin(Owner: TComponent; Siniestro, Orden: Integer);
procedure DoCargarImagenesDigitalizadasPrest(Owner: TComponent; IdPrestador: Integer);
procedure DoCargarImagenesDigitalizadasHyS(Owner: TComponent; Contrato, NroEstablecimiento: Integer);
procedure DoCargarImagenesDigitalizadas(Owner: TComponent; TipoArchivo: TTableId; CantCampos: Integer; SubClave1, SubClave2, SubClave3, SubClave4: String);
function IsExisteClave(fraFiltroArch: TFraFiltroArchivo; TipoArchivo: TTableId; AClave: String; PermitirCartasDocBajas: Boolean = False): Boolean; overload;
function IsExisteClave(var fraFiltroArch: TFraFiltroArchivo; TipoArchivo: TTableId; AClave, SubClave1, SubClave2, SubClave3, SubClave4: String; PermitirCartasDocBajas: Boolean = False): Boolean; overload;
procedure DoBuscarCampoCodigoBarrasArchivo(frm: TfrmCustomConsulta; TipoArchivo: TTableId; CampoBusquedaClave, CampoBusquedaCartaDoc: String);
{$ENDIF}
function Get_IdTipoArchivoCodigo(Codigo: String): TTableId;
function Is_TieneRepositorio(Codigo: String): Boolean;
function Is_ExisteLote(Lote: TTableId): Boolean;
function Is_ExisteRemito(Remito: TTableId): Boolean;
function Is_ExisteLoteEnRemito(Lote, Remito: TTableId): Boolean;
function Do_TransformarClave(TipoArchivo: TTableId; Clave: String): String;
function Is_ExisteClaveArchivoCodDoc_EnLote(TipoArchivo: TTableId; Clave: String; Lote: TTableId; CodDocumento: String = ''): Boolean;
function Is_ExisteLoteEnRepositorio(Lote: TTableId): Boolean;
function Is_ExisteLoteEnTipoArchivo(Lote, TipoArchivo: TTableId): Boolean;
function Is_ExisteNroMedioEnRepositorio(NroMedio: Integer; var TipoArchivo: TTableId): Boolean;
function Get_ClaveCarpetaVirtual(TipoArchivo: TTableId): String;
function Get_UsuarioAltaLote(Lote: TTableId): String;
function Is_ExisteNroMedioEnSegErroresUsuario(NroMedio: Integer): Boolean;
procedure Do_EliminarNroMedioSegErroresUsuario(NroMedio: Integer);
function Is_CarpetaEnResguardo(TipoArchivo: Integer; Clave: String): Boolean;
function Get_IdTipoArchivoLote(Lote: TTableId): TTableId;
function Is_LoteSinDocumentos(Lote: TTableId): Boolean;
function Is_CarpetaSinDocumentos(TipoArchivo: Integer; Clave: String): Boolean;
function Is_PermitirCartasDocBajas(TipoArchivo: Integer): Boolean;
function Get_MensajeReclamoLotes(Usuario: String): String;
procedure DoVerificarReclamoLotesUsuario;
function Get_CantCuerposCarpeta(IdArchivo: TTableId): Integer;
function Get_IdTipoArchivoGuardaCarpetaFisica(TipoArchivo: TTableId; var Descripcion: String): TTableId;
procedure DoAltaDocumentoCarpeta(TipoArchivo, IdTipoDocumento: TTableId; Clave: String; VerificarExisteDoc: Boolean; ConTrans: Boolean = True; ImprimirEtiqueta: Boolean = False; CantEtiquetas: Integer = 0; CodigoDocumento: String = ''; OpcionDestino: String = OPCION_DESTINO_DIGITALIZACION; Hojas: Integer = 1);
function Get_IdTipoDocumentoTransfBancaria(CodAbreviaturaBanco, Tipo: String): TTableId;
function Get_TipoUbicacionArchivo(IdArchivo: TTableId): String;
function Is_LoteLiquidaciones(Lote: TTableId): Boolean;
function IsPerfilAdministrador: Boolean;
function IsPerfilAdministrador_GyD: Boolean;
procedure DoModificarEstadoCarpeta(IdArchivo: TTableId; Estado: String; ConTransaccion: Boolean; IdRemitoDevol: TTableId = ART_EMPTY_ID; Usuario: String = ''; ModificarFechaMov: Boolean = False);
function Get_EstadoCarpeta(IdArchivo: TTableId; var DescrEstado: String): String;
function Get_CodigoTipoArchivoLote(Lote: Integer): String;
function Is_CarpetaEstadoUsuario(TipoArchivo: Integer; Clave, Estado, Usuario: String): Boolean;
procedure DoRecepcionarCarpetaUsuario(IdArchivo: TTableId; Usuario: String);
function Get_CantDocumentosLote(TipoArchivo: Integer): Integer;
function IsImagenDigitalizadaPorUsuario(IdRepositorio: TTableId): Boolean;
function GetUltUsuarioCarpeta(IdArchivo: TTableId): String;
function Is_OcultarImagenRepositorio(TipoArchivo: TTableId): Boolean;
function Is_ArchivoSinMovimCarpetas(TipoArchivo: TTableId): Boolean;
function Is_ArchivoEtiquetasporPagina(TipoArchivo: TTableId): Boolean;

function Is_ExisteSecTrazabilLote(Lote: TTableId; SecTrazabilidad: Integer): Boolean;
function Is_ExisteSecTrazabilTipoArchivoDetalleArchivo(SecTrazabilidad: Integer; TipoArchivo: TTableId): Boolean;
function Is_ExisteSecTrazabilClaveDetalleArchivo(SecTrazabilidad: Integer; Clave: String): Boolean;
function Is_ExisteSecTrazabilCodDocumentoDetalleArchivo(SecTrazabilidad: Integer; CodDocumento: String): Boolean;
function Is_ExisteSecTrazabil(SecTrazabilidad: Integer; SoloActivas: Boolean = True): Boolean;
function Get_SecuenciaTrazabil(IdDetalleArchivo: TTableId): TTableId;
procedure DoCargarCodBarrasSecTrazabililidad(SecTrazabilidad: Integer; qrlBarras: TQRLabel; qrlNumero: TQRLabel = nil; qrlDetalle1: TQRLabel = nil; qrlDetalle2: TQRLabel = nil; Alineacion: TAlineacionCodBarras = alNinguna; TestearAnchoMaximo: Boolean = False; VerificarUsarCodBarras: Boolean = True);
procedure DoCargarCodBarrasSecTrazabililidad_DetArchivo(IdDetalleArchivo: TTableId; qrlBarras: TQRLabel; qrlNumero: TQRLabel = nil; qrlDetalle1: TQRLabel = nil; qrlDetalle2: TQRLabel = nil; Alineacion: TAlineacionCodBarras = alNinguna; TestearAnchoMaximo: Boolean = False; VerificarUsarCodBarras: Boolean = False);
procedure GetInfoAdicionalCodBarrasSecTrazabililidad(SecTrazabilidad, IdDetalleArchivo: Integer; var InfoAdicional1, InfoAdicional2: String);
procedure DoImprimirEtiqueta(Consulta: TSDQuery; tslCheckeados: TStringList; CampoFila, CampoHojas, CampoTipoArch, CampoSecTrazabil, CampoCodigoDoc, CampoClave: String; PreguntarCantHojas: Boolean = True; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = '');
function GetPrimeraSecTrazabilidad(TipoArchivo: TTableId; CodDocumento, SubClave1: String; SubClave2: String = ''; SubClave3: String = ''; SubClave4: String = ''): TTableId;
function GetIdSecTrazabilidad: TTableId; overload;
function GetIdSecTrazabilidad(TipoArchivo: TTableId; ValidarUsarSec: Boolean = True): TTableId; overload;
function Is_ArchivoPatch(CodTipoArchivo: String): Boolean;
function Get_MaximaSecTrazabil: Integer;
function Is_SecTrazabilValida(SecTrazabilidad: Integer; ValidarDocMesaEntrada: Boolean = False): Boolean;
function Is_TipoArchivoImprimeEtiquetasSinSecTrazabil(TipoArchivo: TTableId): Boolean;

function IsUsarSecuenciaTrazabilidad(TipoArchivo: TTableId): Boolean;

function IsAdministradorDocumentacionMEntradas: Boolean;

implementation

uses
  DateTimeFuncs, unSiniestros, SysUtils, General, unQrEtiquetasDocCarpetas, unMoldeEnvioMail,
  unComunesArchivo, CustomDlgs, StrFuncs, unComunes,{$IFNDEF SERVICE}unFrmDetalleArchivo,{$ENDIF}Numeros, Windows,
  DB, unGrids, Controls, Forms, Printers, System.UITypes;

function GetTienePerfil: Boolean;
var
 sSql : string;
begin
  sSql := 'SELECT COUNT(*) ' +
          '  FROM RTA_TIPOARCHIVO, RAU_TIPOARCHIVOUSUARIO                    ' +
          ' WHERE TA_FECHABAJA IS NULL AND AU_FECHABAJA IS NULL              ' +
          '   AND AU_IDTIPOARCHIVO = TA_ID                                   ' +
          '   AND AU_USUARIO = ' + SqlValue(Sesion.LoginName);

  Result := ValorSql(sSql, '0') >= 1;
end;

function DoInsertArchivo(ATipo : Integer; ATipoUbicacion : String;
                         AUbicacion : String; ACaja : Integer; AReceptor : String;
                         AEmisor : String; AClave : String; ConTrans : Boolean = True;
                         AObservaciones: String = ''): TTableId;
var
  sSql : String;
  Id: TTableId;
begin
  Id := GetSecNextVal('ARCHIVO.SEQ_RAR_ID');

  sSql := 'INSERT INTO ARCHIVO.RAR_ARCHIVO ' +
          ' (AR_ID, AR_TIPO, AR_TIPOUBICACION, AR_UBICACION, AR_CAJA, ' +
          '  AR_RECEPTOR, AR_EMISOR, AR_CLAVE, AR_USUALTA, AR_FECHAALTA, ' +
          '  AR_FECHAMOVIMIENTO, AR_SECTORUSUARIO, AR_OBSERVACIONES) ' +
          '    VALUES (:IdRar, :tipo, :tipoubicacion, :ubicacion, :caja, ' +
          '            :receptor, :emisor, :clave, :usuario, SYSDATE, SYSDATE, ' +
          '            ARCHIVO.Get_SectorUsuario(:ubicacion, :tipoubicacion), :observaciones)';

  if ConTrans then
    EjecutarSqlEx(sSql, [Id, ATipo, ATipoUbicacion, AUbicacion, ACaja,
                         AReceptor, AEmisor, AClave, Sesion.LoginName, AUbicacion, ATipoUbicacion, AObservaciones])
  else
    EjecutarSqlSTEx(sSql, [Id, ATipo, ATipoUbicacion, AUbicacion, ACaja,
                           AReceptor, AEmisor, AClave, Sesion.LoginName, AUbicacion, ATipoUbicacion, AObservaciones]);

  Result := Id;
end;

function get_ParametrobyId(AIdParametro : integer) : string;
begin
  result := ValorSqlEx('SELECT ART.ARCHIVO.GET_PARAMETROBYID(:idparametro) FROM DUAL', [AIdParametro], '');
end;

function GetPerfilAdministrador: Boolean;
begin
  result := (AreIn(Sesion.Sector, [SECTOR_DOCUMENTACION, 'COMPUTOS', 'AUDIT', 'AUDGRUP']) or AreIn(IntToStr(Sesion.IdSectorIntranet), [IntToStr(SECTOR_GCIA_AMINFINANZAS)]));  // Logística y Servicios Generales / Sistemas / Auditoría / Auditoría Grupo Banco Provincia / Gerencia de Administración y Finanzas
end;

function GetPerfilGuardaYDigitalizacion: Boolean;
begin
  result := AreIn(Sesion.Sector, SECTOR_GUARDAYDIGITALIZ);
end;

function DoInsertDetalleArchivo(var IdSecuenciaTraz: Integer; IdArchivo, IdTipoDocumento: TTableId; Numero: Integer;
                                OpcionDestino: String; Hojas: Integer; Observaciones,
                                CodigoDocumento, ClaveExtendida: String; FechaVisita: TDateTime;
                                NroAcuseCorreo: String; ConTrans: Boolean; Siniestro: Integer = 0;
                                Orden: Integer = 0; Recaida: Integer = 0; NroEstableci: String = '';
                                ImprimirEtiqueta: Boolean = False; CantEtiquetas: Integer = 0;
                                MostrarMensajeSecuenciaTraz: Boolean = False;
                                UsarValorEntradaSecuenciaTraz: Boolean = False;
                                TipoAlta: String = 'A'): TTableId;
var
  sSecuenciaTraz, sCoddocumento, sRecaida, sSql: String;
  TipoArchivo, IdDetalle: TTableId;
  iCantEtiquetas: Integer;
  bUsarSecTrazabilidad: Boolean;
begin
  IdDetalle   := GetSecNextVal('SEQ_RDA_ID');
  TipoArchivo := Get_TipoArchivo(IdArchivo);

  bUsarSecTrazabilidad := IsUsarSecuenciaTrazabilidad(TipoArchivo);

  if bUsarSecTrazabilidad then
    begin
      if not UsarValorEntradaSecuenciaTraz or (IdSecuenciaTraz = ART_EMPTY_ID) then
        IdSecuenciaTraz := GetIdSecTrazabilidad(ART_EMPTY_ID, False);
    end
  else
    IdSecuenciaTraz := ART_EMPTY_ID;

  sSecuenciaTraz := Iif(IdSecuenciaTraz = ART_EMPTY_ID, '', IntToStr(IdSecuenciaTraz));

  sSql := 'INSERT INTO ARCHIVO.RDA_DETALLEARCHIVO ' +
          '  (DA_ID, DA_IDARCHIVO, DA_IDTIPODOCUMENTO, DA_NUMERO, ' +
          '   DA_OPCIONDESTINO, DA_USUALTA, DA_FECHALTA, DA_HOJAS, ' +
          '   DA_OBSERVACIONES, DA_CODIGODOCUMENTO, DA_CLAVEEXTENDIDA, ' +
          '   DA_FECHAVISITA, DA_NROACUSECORREO, DA_RECAIDA, DA_NROESTABLECI, ' +
          '   DA_SECUENCIATRAZABIL, DA_TIPOALTA) ' +
          '  VALUES (:da_id, :da_idarchivo, :da_idtipodocumento, :da_numero, ' +
          '   :da_opciondestino, :da_usualta, SYSDATE, :da_hojas, ' +
          '   :da_observaciones, :da_codigodocumento, :da_claveextendida, ' +
          '   :da_fechavisita, :da_nroacusecorreo, :da_recaida, :da_nroestableci, ' +
          '   :da_secuenciatrazabil, :TipoAlta)';

  sCoddocumento := Get_CodDocumento(IdTipoDocumento);

  if (TipoArchivo = ID_CARPETA_SINIESTRO) or (TipoArchivo = ID_CARPETA_INCAPACID) then
    begin
      Numero   := Get_NroFormulario(Siniestro, Orden, Recaida, sCoddocumento, TipoArchivo);
      sRecaida := IntToStr(Recaida);
    end
  else
    sRecaida := '';

  if ConTrans then
    EjecutarSqlEx(sSql,
      [IdDetalle, IdArchivo, IdTipoDocumento, Numero, OpcionDestino, Sesion.UserId, Hojas, Observaciones,
       CodigoDocumento, ClaveExtendida, TDateTimeEx.Create(FechaVisita), NroAcuseCorreo, sRecaida, NroEstableci,
       sSecuenciaTraz, TipoAlta])
  else
    EjecutarSqlSTEx(sSql,
      [IdDetalle, IdArchivo, IdTipoDocumento, Numero, OpcionDestino, Sesion.UserId, Hojas, Observaciones,
       CodigoDocumento, ClaveExtendida, TDateTimeEx.Create(FechaVisita), NroAcuseCorreo, sRecaida, NroEstableci,
       sSecuenciaTraz, TipoAlta]);

  if ImprimirEtiqueta then
    begin
      if CantEtiquetas = 0 then
        iCantEtiquetas := Hojas
      else
        iCantEtiquetas := CantEtiquetas;

      if bUsarSecTrazabilidad then
        DoImprimirEtiquetaSecuenciaTrazabilidad(IdSecuenciaTraz, iCantEtiquetas)
      else
        DoImprimirEtiquetaDocCarpetaClave(sCoddocumento, Get_ClaveArchivo(IdArchivo), iCantEtiquetas);
    end;

  if bUsarSecTrazabilidad and MostrarMensajeSecuenciaTraz then
    MsgBox('Se ha generado el siguiente documento:' + CRLF + '  Tipo de Archivo: ' + Get_DescripcionTipoArchivo(TipoArchivo)
                                                    + CRLF + '  Clave: ' + Get_DescripcionClaveDetalleArchivo(IdDetalle)
                                                    + CRLF + '  Documento: ' + Get_CodDescrDocumento(IdTipoDocumento)
                                                    + CRLF + '  Sec. Trazabilidad: ' + Trim(IntToStr(IdSecuenciaTraz))
                                                    + CRLF + CRLF +
           'En caso de requerirlo, puede imprimir/reimprimir la etiqueta con la secuencia de trazabilidad desde la pantalla ' +
           'de Preparar Lote, del Administrador General de Archivo.', MB_ICONINFORMATION);

  Result := IdDetalle;
end;

procedure DoCambiarCarpetaDetalleArchivo(IdDetalleArchivo, IdArchivo: TTableId; Observaciones: String; ConTrans: Boolean);
var
  sSql: String;
begin
  sSql := 'UPDATE ARCHIVO.RDA_DETALLEARCHIVO ' +
             'SET DA_IDARCHIVO = :idarchivo, ' +
                 'DA_OBSERVACIONES = :observaciones, ' +
                 'DA_USUMODIF = :usumodif, ' +
                 'DA_FECHAMODIF = SYSDATE ' +
           'WHERE DA_ID = :id';

 if ConTrans then
   EjecutarSqlEx(sSql, [IdArchivo, Observaciones, Sesion.UserId, IdDetalleArchivo])
 else
   EjecutarSqlSTEx(sSql, [IdArchivo, Observaciones, Sesion.UserId, IdDetalleArchivo]);

  sSql := 'UPDATE ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
             'SET RA_IDARCHIVO = :idarchivo, ' +
                 'RA_USUMODIF = :usumodif, ' +
                 'RA_FECHAMODIF = SYSDATE ' +
           'WHERE RA_SECUENCIATRAZABIL IN (SELECT DA_SECUENCIATRAZABIL ' +
                                            'FROM ARCHIVO.RDA_DETALLEARCHIVO ' +
                                           'WHERE DA_ID = :id)';

 if ConTrans then
   EjecutarSqlEx(sSql, [IdArchivo, Sesion.UserId, IdDetalleArchivo])
 else
   EjecutarSqlSTEx(sSql, [IdArchivo, Sesion.UserId, IdDetalleArchivo]);
end;

function Get_IdTipoDocumentoSector(CodDoc, Sector: String): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT TD_ID ' +
            'FROM ARCHIVO.RTD_TIPODOCUMENTO ' +
           'WHERE TD_CODIGO =  ' + SqlValue(CodDoc) + ' ' +
             'AND TD_SECTOR ' + Iif(IsEmptyString(Sector), ' IS NULL', ' = ' + SqlValue(Sector));

  Result := ValorSqlInteger(sSql, ART_EMPTY_ID);
end;

function Get_IdTipoDocumentoOPTesoreria: TTableId;
begin
  // Ordenes de Pago - Tesoreria
  Result := Get_IdTipoDocumentoSector(CODDOC_OPAGOTESO, 'TESO');
end;

function Get_IdTipoDocumentoAnulacionOPTesoreria: TTableId;
begin
  // Anulación Ordenes de Pago - Tesoreria
  Result := Get_IdTipoDocumentoSector(CODDOC_ANULOPAGOTESO, 'TESO');
end;

function Get_IdTipoDocumentoAcuseCorreoTesoreria: TTableId;
begin
  // Acuses de Correo Firmado - Tesoreria
  Result := Get_IdTipoDocumentoSector(CODDOC_ACUSECORREOF, 'TESO');
end;

function Get_IdTipoDocumentoOCCompras: TTableId;
begin
  // Orden de Compra - Compras
  Result := Get_IdTipoDocumentoSector(CODDOC_ORDENCOMPRA, 'COMP');
end;

function Get_IdTipoDocumentoLoteEnvioDocumentacion: TTableId;
begin
  // Lote de Envío de Documentación
  Result := Get_IdTipoDocumentoSector(CODDOC_LOTE, '');
end;

function Get_NroFormulario(Siniestro, Orden, Recaida: Integer; CodDocumento: String; TipoArchivo: Integer = ID_CARPETA_SINIESTRO): Integer;
var
  sEsIncapacidad, sSql: String;
begin
  sEsIncapacidad := Iif(TipoArchivo = ID_CARPETA_INCAPACID, 'S', 'N');

  sSql := 'SELECT ART.SINIESTRO.GET_NROFORMU(:IdExpediente, :Documento, :EsIncapacidad) ' +
            'FROM DUAL';

  Result := ValorSqlIntegerEx(sSql, [Get_IdExpediente(Siniestro, Orden, Recaida), CodDocumento, sEsIncapacidad]);
end;

function Get_CodDocumento(Id: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT TD_CODIGO ' +
            'FROM ARCHIVO.RTD_TIPODOCUMENTO ' +
           'WHERE TD_ID = :Id';

  Result := ValorSqlEx(sSql, [Id]);
end;

function Get_CodDescrDocumento(Id: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT TRIM(TD_DESCRIPCION) || '' ('' || TRIM(TD_CODIGO) || '')'' ' +
            'FROM ARCHIVO.RTD_TIPODOCUMENTO ' +
           'WHERE TD_ID = :Id';

  Result := ValorSqlEx(sSql, [Id]);
end;

function Get_TipoArchivo(Id: TTableId): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT AR_TIPO ' +
            'FROM ARCHIVO.RAR_ARCHIVO ' +
           'WHERE AR_ID = :Id';

  Result := ValorSqlIntegerEx(sSql, [Id]);
end;

function Get_TipoDetalleArchivo(Id: TTableId): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT AR_TIPO ' +
            'FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RAR_ARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND DA_ID = :Id';

  Result := ValorSqlIntegerEx(sSql, [Id]);
end;

function Get_TipoDetalleArchivoSecTraz(SecTrazabilidad: TTableId): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT AR_TIPO ' +
            'FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RAR_ARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND DA_SECUENCIATRAZABIL = :SecTrazabil';

  Result := ValorSqlIntegerEx(sSql, [SecTrazabilidad]);
end;

function Get_ClaveArchivo(Id: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT AR_CLAVE ' +
            'FROM ARCHIVO.RAR_ARCHIVO ' +
           'WHERE AR_ID = :Id';

  Result := ValorSqlEx(sSql, [Id]);
end;

function Get_ClaveDetalleArchivo(Id: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT AR_CLAVE ' +
            'FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RAR_ARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND DA_ID = :Id';

  Result := ValorSqlEx(sSql, [Id]);
end;

procedure Do_Actualizar_Archivo_Sin(ConTrans: Boolean; idexpediente: TTableId; opcion: String; hojas: Integer; usuario, parte: String; numero: Integer; tipoalta: String = ''; danumero: Integer = 0; observaciones: String = '');
var
  sNumero, sSql: String;
begin
  sSql := 'ART.SINIESTRO.DO_ACTUALIZAR_ARCHIVO(:p_idexpediente, :p_opcion, :p_hojas, :p_usuario, :p_parte, :p_numero, :p_tipoalta, :p_danumero, :p_observaciones);';

  if numero = 0 then
    sNumero := ''
  else
    sNumero := IntToStr(numero);

  if ConTrans then
    EjecutarStoreEx(sSql, [idexpediente, opcion, hojas, usuario, parte, sNumero, tipoalta, danumero, observaciones])
  else
    EjecutarStoreSTEx(sSql, [idexpediente, opcion, hojas, usuario, parte, sNumero, tipoalta, danumero, observaciones]);
end;

function Is_ExisteDocumentoSiniestro(Siniestro, Orden: Integer; CodDocumento: String): Boolean;
var
  sSql: String;
begin
  sSql :=
      'SELECT 1 ' +
        'FROM RDA_DETALLEARCHIVO, RAD_TIPOARCHIVODOCUMENTO, RTD_TIPODOCUMENTO, RAR_ARCHIVO ' +
       'WHERE AR_TIPO IN (:ArchSiniestros, :ArchIncap) ' +
         'AND AR_CLAVE = LTRIM(TO_CHAR(:Siniestro)) || ''|'' || LTRIM(TO_CHAR(:Orden)) ' +
         'AND TD_CODIGO = :CodDocumento ' +
         'AND AD_IDTIPOARCHIVO = AR_TIPO ' +
         'AND AD_IDTIPODOCUMENTO = TD_ID ' +
         'AND DA_IDARCHIVO = AR_ID ' +
         'AND DA_IDTIPODOCUMENTO = TD_ID ' +
         'AND AD_FECHABAJA IS NULL ' +
         'AND TD_FECHABAJA IS NULL ' +
         'AND DA_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [ID_CARPETA_SINIESTRO, ID_CARPETA_INCAPACID, Siniestro, Orden, CodDocumento]);
end;

function Is_ExisteDocumentoSiniestro(Siniestro, Orden, Recaida, Numero: Integer; CodDocumento: String): Boolean;
var
  sSql: String;
begin
  sSql :=
      'SELECT 1 ' +
        'FROM RDA_DETALLEARCHIVO, RAD_TIPOARCHIVODOCUMENTO, RTD_TIPODOCUMENTO, RAR_ARCHIVO ' +
       'WHERE AR_TIPO IN (:ArchSiniestros, :ArchIncap) ' +
         'AND AR_CLAVE = LTRIM(TO_CHAR(:Siniestro)) || ''|'' || LTRIM(TO_CHAR(:Orden)) ' +
         'AND TD_CODIGO = :CodDocumento ' +
         'AND AD_IDTIPOARCHIVO = AR_TIPO ' +
         'AND AD_IDTIPODOCUMENTO = TD_ID ' +
         'AND DA_IDARCHIVO = AR_ID ' +
         'AND DA_IDTIPODOCUMENTO = TD_ID ' +
         'AND DA_RECAIDA = :Recaida ' +
         Iif(Numero = -1, '', 'AND DA_NUMERO = ' + SqlValue(Numero)) + ' ' +
         'AND AD_FECHABAJA IS NULL ' +
         'AND TD_FECHABAJA IS NULL ' +
         'AND DA_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [ID_CARPETA_SINIESTRO, ID_CARPETA_INCAPACID, Siniestro, Orden, CodDocumento, Recaida]);
end;

function Is_ExisteDocumento(TipoArchivo: Integer; Clave, CodDocumento, NroCarta: String; var Lote: Integer): Boolean;
var        
  sSql: String;
begin
  Lote := ART_EMPTY_ID;

  sSql :=
      'SELECT DA_LOTE ' +
        'FROM RDA_DETALLEARCHIVO, RAD_TIPOARCHIVODOCUMENTO, RTD_TIPODOCUMENTO, RAR_ARCHIVO ' +
       'WHERE AR_TIPO = :TipoArch ' +
         'AND AR_CLAVE = :Clave ' +
         'AND TD_CODIGO = :CodDocumento ' +
         'AND AD_IDTIPOARCHIVO = AR_TIPO ' +
         'AND DA_IDTIPODOCUMENTO = TD_ID ' +
         'AND AD_IDTIPODOCUMENTO = TD_ID ' +
         'AND DA_IDARCHIVO = AR_ID '+
         'AND AD_FECHABAJA IS NULL ' +
         'AND DA_FECHABAJA IS NULL ' +
         'AND TD_FECHABAJA IS NULL ' +
         Iif(TipoCartaDocumento(TipoArchivo), 'AND DA_CODIGODOCUMENTO = ' + SqlValue(NroCarta) + ' ', '') +
    'ORDER BY NVL(DA_LOTE, -9999) DESC';

  Lote := ValorSqlIntegerEx(sSql, [TipoArchivo, Clave, CodDocumento], -1);

  Result := (Lote <> -1);

  if Lote = -1 then
    Lote := 0;
end;

function Is_CarpetaExtraviada(TipoArchivo: Integer; Clave: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO ' +
           'WHERE AR_TIPOUBICACION = :TipoUbicacion ' +
             'AND AR_UBICACION = ' + SqlValue(UBIC_EXTRAVIADA) + ' ' +  // Carpeta Extraviada
             'AND AR_TIPO = :Tipo ' +
             'AND AR_CLAVE = :Clave';

  Result := ExisteSqlEx(sSql, [TIPOUBICACION_LUGAR, TipoArchivo, Clave])
end;

function Is_TipoArchivoCaja(TipoArchivo: Integer): Boolean;
begin
  Result := (TipoArchivo in [ID_CARPETA_CAJAS_JR, ID_CARPETA_CAJAS_GT, ID_CARPETA_CAJAS_IE,
                             ID_CARPETA_CAJAS_COB, ID_CARPETA_CAJAS_CPAG, ID_CARPETA_CAJAS_CPRAS,
                             ID_CARPETA_CAJAS_MENTR, ID_CARPETA_CAJAS_INV, ID_CARPETA_CAJAS_LIQ,
                             ID_CARPETA_CAJAS_CONT, ID_CARPETA_CAJAS_BMENS, ID_CARPETA_CAJAS_BTRIM,
                             ID_CARPETA_CAJAS_ECOB, ID_CARPETA_CAJAS_ASDIAR, ID_CARPETA_CAJAS_EXPER99,
                             ID_CARPETA_CAJAS_BFISARCH, ID_CARPETA_CAJAS_RRHH, ID_CARPETA_CAJAS_CONCACT,
                             ID_CARPETA_CAJAS_CONCPAS, ID_CARPETA_CAJAS_CONCIMP, ID_CARPETA_CAJAS_BCOSINT,
                             ID_CARPETA_CAJAS_TESO_G, ID_CARPETA_CAJAS_EXTRBANC]);
end;

function Is_TipoArchivoRX(TipoArchivo: Integer): Boolean;
begin
  Result := (TipoArchivo in [ID_CARPETA_ML_RX, ID_CARPETA_EXAMENPREOC_RX, ID_CARPETA_RADIOGRSIN]);
end;

function TipoCartaDocumento(ATipoArchivo: Integer): Boolean;
begin
  Result := ((ATipoArchivo = ID_CARPETA_CD_SIN) or (ATipoArchivo = ID_CARPETA_CD_AFI) or
             (ATipoArchivo = ID_CARPETA_CD_COB) or (ATipoArchivo = ID_CARPETA_CD_INCA) or
             (ATipoArchivo = ID_CARPETA_CD_HYS) or (ATipoArchivo = ID_CARPETA_CD_LEGSIN) or
             (ATipoArchivo = ID_CARPETA_CD_PRDINSIN) or (ATipoArchivo = ID_CARPETA_CD_LEGCONTR) or
             (ATipoArchivo = ID_CARPETA_CD_LEGJPD) or (ATipoArchivo = ID_CARPETA_CD_LEGJPA) or
             (ATipoArchivo = ID_CARPETA_CD_PRDINCON));
end;

function CartaDocumento(ATipoArchivo: Integer): Boolean;
begin
  Result := (Get_TablaTipoArchivo(ATipoArchivo) = 'VCD_CARTASDOC');
end;

function TipoArchivoCartaDocumento(ATipoArchivo: Integer): Boolean;
begin
  Result := (CartaDocumento(ATipoArchivo) or TipoCartaDocumento(ATipoArchivo));
end;

function TipoArchivoExtractosBancarios(ATipoArchivo: Integer): Boolean;
begin
  Result := (ATipoArchivo = ID_CARPETA_EXTRBANC);
end;

function TipoArchivoCuentasPagarViaticos(ATipoArchivo: Integer): Boolean;
begin
  Result := (ATipoArchivo = ID_CARPETA_CPAGARVIAT);
end;

function TipoArchivoCajaGirosTransferencias(ATipoArchivo: Integer): Boolean;
begin
  Result := (ATipoArchivo = ID_CARPETA_CAJAS_GT);
end;

function TipoArchivoMedicinaLaboral(ATipoArchivo: Integer): Boolean;
begin
  Result := ((ATipoArchivo = ID_CARPETA_ML_GRAL) or (ATipoArchivo = ID_CARPETA_ML_RX) or
             (ATipoArchivo = ID_CARPETA_ML_EGRESOS));
end;

procedure DoModificarEstadoLote(Lote: TTableId; Estado: String; ConTransaccion: Boolean);
var
  sSql: String;
begin
  sSql := 'UPDATE RLO_LOTE ' +
             'SET LO_ESTADO = :Estado, ' +
                 'LO_USU_ESTADO = :Usuario, ' +
                 'LO_FECHA_ESTADO = SYSDATE ' +
                 Iif(AreIn(Estado, [ESTADOLOTE_ENTRANSITO, ESTADOLOTE_MESAENTRADA, ESTADOLOTE_DITALIZGUARDA]),
                     ', LO_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) +
                     ', LO_UBICACION = ' + SqlValue(Sesion.UserID) + ' ',
                     '') +
           'WHERE LO_ID = :Id';

  if ConTransaccion then
    EjecutarSqlEx(sSql, [Estado, Sesion.UserID, Lote])
  else
    EjecutarSqlSTEx(sSql, [Estado, Sesion.UserID, Lote]);
end;

procedure DoModificarRemitoEnvio(Lote, IdRemitoEnvio: TTableId; ConTransaccion: Boolean);
var
  sSql: String;
begin
  sSql := 'UPDATE RLO_LOTE ' +
             'SET LO_IDREMITOENVIOLOTE = :IdRemito ' +
           'WHERE LO_ID = :Id';

  if ConTransaccion then
    EjecutarSqlEx(sSql, [IdRemitoEnvio, Lote])
  else
    EjecutarSqlSTEx(sSql, [IdRemitoEnvio, Lote]);
end;

function DoInsertRemitoEnvioLote(ConTransaccion: Boolean = True): TTableId;
var
  sSql: String;
  Id: TTableId;
begin
  Id := GetSecNextVal('ARCHIVO.SEQ_RRL_ID');

  sSql := 'INSERT INTO ARCHIVO.RRL_REMITOENVIOLOTE ' +
                     '(RL_ID, RL_USUALTA, RL_FECHAALTA) ' +
          'VALUES (:IdRrl, :Usuario, SYSDATE)';

  if ConTransaccion then
    EjecutarSqlEx(sSql, [Id, Sesion.UserId])
  else
    EjecutarSqlSTEx(sSql, [Id, Sesion.UserId]);

  Result := Id;
end;

function Get_EstadoLote(Lote: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT LO_ESTADO ' +
            'FROM RLO_LOTE ' +
           'WHERE LO_ID = :Id';

  Result := ValorSqlEx(sSql, [Lote]);
end;

procedure DoEnviarMailsReemplazo(Asunto, Cuerpo: String; ConTrans: Boolean = False);
begin
  VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION :=
      get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);

  EnviarMailBD(VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION, Asunto, [oAutoFirma], Cuerpo, nil,
               0, tcDefault, ConTrans);

  VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
      get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

  EnviarMailBD(VALOR_PARAMETRO_CORREO_DOCUMENTACION, Asunto, [oAutoFirma], Cuerpo, nil,
               0, tcDefault, ConTrans);
end;

function DoReemplazoCarpeta(ClaveVie, ClaveNue, AsuntoMail, CuerpoMail: String; TipoArchivo: Integer; ConTrans: Boolean = False): Boolean;
var
  sSubClaveNue1, sSubClaveNue2, sSubClaveNue3, sSubClaveNue4, sSql: String;
  sSubClaveVie1, sSubClaveVie2, sSubClaveVie3, sSubClaveVie4: String;
  sUsarSecTrazabil, sObservaciones: String;
  IdSecTrazabilidad, IdRarVie, IdRarNue: TTableId;
begin
  Result := False;

  sObservaciones := 'TIPO: ' + Trim(IntToStr(TipoArchivo)) + '-Clave Vieja: ' + ClaveVie + '-Clave Nueva: ' + ClaveNue;
  sSql := 'SELECT 1 ' +
            'FROM SIART_AUDITLOG ' +
           'WHERE OBS = :Observ ' +
             'AND MODULO = :Modulo';
  Verificar(ExisteSqlEx(sSql, [sObservaciones, 'AGA']), nil, 'Ese reemplazo ya ha sido realizado en otra oportunidad.');

  if ConTrans then
    BeginTrans(True);

  try
    GetSubClaves(ClaveNue, sSubClaveNue1, sSubClaveNue2, sSubClaveNue3, sSubClaveNue4);
    GetSubClaves(ClaveVie, sSubClaveVie1, sSubClaveVie2, sSubClaveVie3, sSubClaveVie4);

    if not VerificarClaveExiste(TipoArchivo, ClaveVie, IdRarVie) then
      IdRarVie := DoInsertArchivo(TipoArchivo, TIPOUBICACION_GUARDA,
                                  '', 0, '', '', ClaveVie, False);

    if not VerificarClaveExiste(TipoArchivo, ClaveNue, IdRarNue) then
      IdRarNue := DoInsertArchivo(TipoArchivo, TIPOUBICACION_GUARDA,
                                  '', 0, '', '', ClaveNue, False);

    sUsarSecTrazabil := Iif(IsUsarSecuenciaTrazabilidad(TipoArchivo), 'S', 'N');

    if TipoArchivo = ID_CARPETA_TESORERIA then
      IdSecTrazabilidad := GetPrimeraSecTrazabilidad(ID_CARPETA_TESORERIA, CODDOC_OPAGOTESO, ClaveVie)    // la OP original se genera con nuevo número de sec. de trazab., el resto de los documentos no
    else
      IdSecTrazabilidad := ART_EMPTY_ID;   // a todos los demás documentos del resto de los tipos de archivos se les copia la sec. de trazab. existente

    sSql := 'INSERT INTO RDA_DETALLEARCHIVO ' +
                   '(DA_ID, DA_IDARCHIVO, DA_IDTIPODOCUMENTO, DA_NUMERO, ' +
                    'DA_OPCIONDESTINO, DA_USUALTA, DA_FECHALTA, DA_HOJAS, ' +
                    'DA_OBSERVACIONES, DA_LOTE, DA_USUMODIF, DA_FECHAMODIF, ' +
                    'DA_SEQ_LOTE, DA_TIPOALTA, DA_USUBAJA, DA_FECHABAJA, ' +
                    'DA_CODIGODOCUMENTO, DA_FECHAVISITA, DA_SECUENCIATRAZABIL) ' +
             'SELECT SEQ_RDA_ID.NEXTVAL, :IdArchivoNue, DA_IDTIPODOCUMENTO, DA_NUMERO, ' +
                    'DA_OPCIONDESTINO, :User, SYSDATE, DA_HOJAS, ' +
                    'DA_OBSERVACIONES, NULL, NULL, NULL, ' +
                    'NULL, DA_TIPOALTA, DA_USUBAJA, DA_FECHABAJA, ' +
                    'DA_CODIGODOCUMENTO, DA_FECHAVISITA, ' +
                    '(CASE WHEN :UsarSecTrazabil = ''S'' AND DA_SECUENCIATRAZABIL = :SecTrazabil THEN ART.UTILES.GET_SEQNEXTVAL(''ARCHIVO.SEQ_RDA_SECTRAZABILIDAD'') ELSE DA_SECUENCIATRAZABIL END) ' +
               'FROM RDA_DETALLEARCHIVO ' +
              'WHERE DA_IDARCHIVO = :IdArchivoVie';
    EjecutarSqlSTEx(sSql, [IdRarNue, Sesion.UserID, sUsarSecTrazabil, IdSecTrazabilidad, IdRarVie]);

    if sUsarSecTrazabil = 'S' then
      begin
        sSql := 'UPDATE RDA_DETALLEARCHIVO ' +    // lo hago por las dudas, para asegurarme que no me quede ningún documento sin su secuencia de trazabilidad
                   'SET DA_SECUENCIATRAZABIL = ARCHIVO.SEQ_RDA_SECTRAZABILIDAD.NEXTVAL ' +
                 'WHERE DA_SECUENCIATRAZABIL IS NULL ' +
                   'AND DA_IDARCHIVO = :IdArchivoNue';
        EjecutarSqlSTEx(sSql, [IdRarNue]);
      end;

    DoCopiarCarpetasRepositorioArchivo(TipoArchivo, IdRarVie, IdRarNue);

    if IsEmptyString(AsuntoMail) then
      AsuntoMail := '[Documentación] Reemplazo de Carpetas de: ' + Get_DescripcionTipoArchivo(TipoArchivo);

    if IsEmptyString(CuerpoMail) then
      CuerpoMail := 'La carpeta ' + Get_DescripcionClave(TipoArchivo, ClaveVie) +
                    ' ha sido reemplazada por la carpeta ' + Get_DescripcionClave(TipoArchivo, ClaveNue) + '.';

    DoEnviarMailsReemplazo(AsuntoMail, CuerpoMail, ConTrans);

    DoInsertarRegAuditLog('CARPETAS DEL AGA', 'REEMPLAZO', sObservaciones, False, 'AGA');

    if ConTrans then
      CommitTrans(True);

    Result := True;
  except
    on E: Exception do
      begin
        if ConTrans then
          Rollback(True);
        ErrorMsg(E, 'Error al reemplazar las carpetas.');
      end;
  end;
end;

function Get_DescripcionClave(Tipo: TTableId; Clave: String): String;
var
  sSql: String;
begin
  sSql := 'SELECT ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO ' +
           'WHERE AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_TIPO = :Tipo ' +
             'AND AR_CLAVE = :Clave';

  Result := Trim(ValorSqlEx(sSql, [Tipo, Clave]));
end;

function Get_DescripcionClaveDetalleArchivo(IdDetalleArchivo: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) ' +
            'FROM RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
            ' AND AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND DA_ID = :DetalleArchivo';

  Result := Trim(ValorSqlEx(sSql, [IdDetalleArchivo]));
end;

function Get_DescripcionTipoArchivo(Tipo: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT TA_DESCRIPCION ' +
            'FROM RTA_TIPOARCHIVO ' +
           'WHERE TA_ID = :Tipo';

  Result := Trim(ValorSqlEx(sSql, [Tipo]));
end;

function Get_UltIdDetalleArchivo(IdArchivo: TTableId; CodDocumento: String): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT MAX(DA_ID) ' +
            'FROM ARCHIVO.RTD_TIPODOCUMENTO, ARCHIVO.RDA_DETALLEARCHIVO ' +
           'WHERE DA_IDTIPODOCUMENTO = TD_ID ' +
             'AND DA_IDARCHIVO = :IdArchivo ' +
             'AND TD_CODIGO = :CodDoc ' +
             'AND DA_FECHABAJA IS NULL';

  Result := ValorSqlIntegerEx(sSql, [IdArchivo, CodDocumento]);
end;

procedure DoInsertDetalleArchivoLegajoContrato(Contrato, CantHojas: Integer; Observaciones: String; ImprimirEtiqueta: Boolean = False; CantEtiquetas: Integer = 0);
var
  IdSecuenciaTraz: Integer;
  IdArchivo, IdTipoDocumento: TTableId;
begin
  if VerificarClaveExiste(ID_CARPETA_AFILIAC, Trim(IntToStr(Contrato)), IdArchivo) then
    begin
      IdTipoDocumento := Get_IdTipoDocumentoSector(CODDOC_LEGAJOCOMPLETO, 'AFI');

      DoInsertDetalleArchivo(IdSecuenciaTraz, IdArchivo, IdTipoDocumento, 0, OPCION_DESTINO_DIGITALIZACION, CantHojas, Observaciones, '', '',
                             0, '', True, 0, 0, 0, '', ImprimirEtiqueta, CantEtiquetas);
    end;
end;

function Get_TablaTipoArchivo(Tipo: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT TA_TABLA ' +
            'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
           'WHERE TA_ID = :Tipo';

  Result := ValorSqlEx(sSql, [Tipo]);
end;

function DoInsertRepositorioArchivo(TipoDocumentoCarpeta: TDocumentoCarpeta; TipoArchivo: TTableId; Clave: String;
                                    IdTipoDocumento: TTableId; PathArchivo, Archivo: String; ConTrans: Boolean = True;
                                    NroMedio: Integer = 0; Lote: Integer = 0; SeqLote: Integer = 0;
                                    Observaciones: String = ''; CodDocumento: String = ''; FechaAlta: TDateTime = 0;
                                    ClaveNoMigrada: String = ''; CajaAdmin: Integer = 0; NroCartaDocumento: String = '';
                                    NroHoja: Integer = 0; Legajo: Integer = 0; NroOperacion_GT: String = '';
                                    Beneficiario_GT: String = ''; FechaOper_GT: TDateTime = 0; NroCheque_GT: String = '';
                                    SecuenciaTraz: Integer = ART_EMPTY_ID): TTableId;
var
  sIdTipoDocumento, sObservaciones, sNroMedio, sLote, sSeqLote, sSql : String;
  sSecuenciaTraz, sLegajo, sNroHoja, sArchivo, sCajaAdmin: String;
  rarId, Id: TTableId;
begin
  if not VerificarClaveExiste(TipoArchivo, Clave, rarId) then
    rarId := DoInsertArchivo(TipoArchivo, TIPOUBICACION_GUARDA, '', 0, '', '', Clave, ConTrans);

  Id := GetSecNextVal('ARCHIVO.SEQ_RRA_ID');

  sNroMedio        := Iif(NroMedio = 0, '', IntToStr(NroMedio));
  sLote            := Iif(Lote = 0, '', IntToStr(Lote));
  sSeqLote         := Iif(SeqLote = 0, '', IntToStr(SeqLote));
  sArchivo         := UpperCase(Trim(Archivo));
  PathArchivo      := UpperCase(Trim(ExcludeTrailingPathDelimiter(PathArchivo)));
  sIdTipoDocumento := Iif(IdTipoDocumento = 0, '', IntToStr(IdTipoDocumento));
  sCajaAdmin       := Iif(CajaAdmin = 0, '', IntToStr(CajaAdmin));
  sNroHoja         := Iif(NroHoja = 0, '', IntToStr(NroHoja));
  sLegajo          := Iif(Legajo = 0, '', IntToStr(Legajo));
  sSecuenciaTraz   := Iif(SecuenciaTraz = ART_EMPTY_ID, '', IntToStr(SecuenciaTraz));

  sObservaciones := GetObservacionesDocumentoCarpeta(TipoDocumentoCarpeta);
  if not IsEmptyString(Observaciones) then
    sObservaciones := Observaciones + Iif(IsEmptyString(sObservaciones), '', ' - (' + sObservaciones + ')');

  sSql := 'INSERT INTO ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
           '(RA_ID, RA_IDARCHIVO, RA_IDTIPODOCUMENTO, RA_LOTE, RA_SEQ_LOTE, ' +
            'RA_NROMEDIO, RA_PATHARCHIVO, RA_ARCHIVO, RA_OBSERVACIONES, RA_USUALTA, ' +
            'RA_FECHAALTA, RA_CODDOCUMENTO, RA_CLAVENOMIGRADA, RA_CAJAADMIN, ' +
            'RA_NRODOCUMENTO, RA_HOJA, RA_LEGAJO, RA_NROOPERACION_GT, ' +
            'RA_BENEFICIARIO_GT, RA_FECHAOPER_GT, RA_NROCHEQUE_GT, ' +
            'RA_SECUENCIATRAZABIL) ' +
          'VALUES(:IdRRA, :idarchivo, :idtipodocumento, :lote, :seq_lote, ' +
                 ':nromedio, :patharchivo, :archivo, :observaciones, :usualta, ' +
                 ':fechaalta, :coddocumento, :clavenomigrada, :cajaadmin, ' +
                 ':nrodocumento, :hoja, :legajo, :nrooperacion_gt, ' +
                 ':beneficiario_gt, :fechaoper_gt, :nrocheque_gt, ' +
                 ':secuenciatrazabil)';

  FechaAlta := NvlDT(FechaAlta, DBDateTime());

  if ConTrans then
    EjecutarSqlEx(sSql, [Id, rarId, sIdTipoDocumento, sLote, sSeqLote, sNroMedio,
                         PathArchivo, sArchivo, sObservaciones, Sesion.UserId,
                         TDateTimeEx.Create(FechaAlta), Trim(CodDocumento), Trim(ClaveNoMigrada),
                         sCajaAdmin, NroCartaDocumento, sNroHoja, sLegajo, Trim(NroOperacion_GT),
                         Trim(Beneficiario_GT), TDateTimeEx.Create(FechaOper_GT), Trim(NroCheque_GT),
                         sSecuenciaTraz])
  else
    EjecutarSqlSTEx(sSql, [Id, rarId, sIdTipoDocumento, sLote, sSeqLote, sNroMedio,
                           PathArchivo, sArchivo, sObservaciones, Sesion.UserId,
                           TDateTimeEx.Create(FechaAlta), Trim(CodDocumento), Trim(ClaveNoMigrada),
                           sCajaAdmin, NroCartaDocumento, sNroHoja, sLegajo, Trim(NroOperacion_GT),
                           Trim(Beneficiario_GT), TDateTimeEx.Create(FechaOper_GT), Trim(NroCheque_GT),
                           sSecuenciaTraz]);

  Result := Id;
end;

procedure DoCopiarCarpetasRepositorioArchivo(TipoArchivo, IdRarVie, IdRarNue: TTableId);
var
  sSql: String;
begin
  sSql := 'INSERT INTO ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
            '(RA_ID, RA_IDARCHIVO, RA_IDTIPODOCUMENTO, RA_LOTE, RA_SEQ_LOTE, ' +
             'RA_PATHARCHIVO, RA_ARCHIVO, RA_OBSERVACIONES, RA_USUALTA, ' +
             'RA_FECHAALTA, RA_CODDOCUMENTO, RA_NRODOCUMENTO, RA_HOJA, RA_LEGAJO, ' +
             'RA_NROOPERACION_GT, RA_BENEFICIARIO_GT, RA_FECHAOPER_GT, RA_NROCHEQUE_GT, ' +
             'RA_SECUENCIATRAZABIL) ' +
          'SELECT ARCHIVO.SEQ_RRA_ID.NEXTVAL, :IdArchivoNue, RA_IDTIPODOCUMENTO, RA_LOTE, RA_SEQ_LOTE, ' +
                 'RA_PATHARCHIVO, RA_ARCHIVO, RA_OBSERVACIONES, :Usuario, ' +
                 'SYSDATE, RA_CODDOCUMENTO, RA_NRODOCUMENTO, RA_HOJA, RA_LEGAJO, ' +
                 'RA_NROOPERACION_GT, RA_BENEFICIARIO_GT, RA_FECHAOPER_GT, RA_NROCHEQUE_GT, ' +
                 'RA_SECUENCIATRAZABIL ' + 
            'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
           'WHERE RA_IDARCHIVO = :IdArchivoVie ' +
             'AND RA_FECHABAJA IS NULL';
  EjecutarSqlSTEx(sSql, [IdRarNue, Sesion.UserId, IdRarVie]);
end;

function GetIdDocumentoArchivo(TipoArchivo: TTableId; CodDocumento: String): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT TD_ID ' +
            'FROM RAD_TIPOARCHIVODOCUMENTO, RTD_TIPODOCUMENTO ' +
           'WHERE TD_CODIGO = :CodDocumento ' +
             'AND AD_IDTIPOARCHIVO = :TipoArchivo ' +
             'AND AD_IDTIPODOCUMENTO = TD_ID ' +
             'AND AD_FECHABAJA IS NULL ' +
             'AND TD_FECHABAJA IS NULL';

  Result := ValorSqlIntegerEx(sSql, [CodDocumento, TipoArchivo], ART_EMPTY_ID);
end;

function Get_CodigoTipoArchivo(Tipo: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT TA_CODIGO ' +
            'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
           'WHERE TA_ID = :Tipo';

  Result := ValorSqlEx(sSql, [Tipo]);
end;

{$IFNDEF SERVICE}
function IsExisteClave(fraFiltroArch: TFraFiltroArchivo; TipoArchivo: TTableId; AClave: String; PermitirCartasDocBajas: Boolean = False): Boolean;
var
  sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
begin
  GetSubClaves(AClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);
  Result := IsExisteClave(fraFiltroArch, TipoArchivo, AClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4, PermitirCartasDocBajas);
end;

function IsExisteClave(var fraFiltroArch: TFraFiltroArchivo; TipoArchivo: TTableId; AClave, SubClave1, SubClave2, SubClave3, SubClave4: String; PermitirCartasDocBajas: Boolean = False): Boolean;
var
  bExisteClave: Boolean;
  sSql: String;
begin
  if TipoArchivo = ID_CARPETA_EXAMENPREOC then
    begin
      sSql := 'SELECT 1 FROM ACO_CONTRATO WHERE CO_CONTRATO = :Contrato';
      if IsNumber(SubClave1) then
        bExisteClave := ExisteSqlEx(sSql, [StrToInt(SubClave1)])
      else
        bExisteClave := False;
    end
  else
    begin
      try
        with fraFiltroArch do
          begin
            DoCargarClaveArchivo(TipoArchivo, AClave);
            CartasDocPermiteBajas := PermitirCartasDocBajas;
          end;
      except
      end;

      bExisteClave := fraFiltroArch.Exists;
    end;

  Result := bExisteClave;
end;

procedure DoCargarImagenesDigitalizadasAfi(Owner: TComponent; Contrato: Integer);
var
  sIdArchivos, sClaveArmada: String;
begin
  sIdArchivos  := '';
  sClaveArmada := GetClaveArmada(1, IntToStr(Contrato), '', '', '');

  DoArmarIdArchivos(ID_CARPETA_AFILIAC, sClaveArmada, sIdArchivos);
  DoArmarIdArchivos(ID_CARPETA_CD_AFI, sClaveArmada, sIdArchivos);

  sIdArchivos := CutRight(sIdArchivos, 2);

  if not IsEmptyString(sIdArchivos) then
    TFrmDetalleArchivo.MostrarDetalleArchivos(Owner, sIdArchivos, True, 'Detalle de Carpeta: Contrato ' + sClaveArmada);
end;

procedure DoCargarImagenesDigitalizadasSin(Owner: TComponent; Siniestro, Orden: Integer);
var
  sIdArchivos, sClaveArmada: String;
begin
  sIdArchivos  := '';
  sClaveArmada := GetClaveArmada(2, IntToStr(Siniestro), IntToStr(Orden), '', '');

  DoArmarIdArchivos(ID_CARPETA_SINIESTRO, sClaveArmada, sIdArchivos);
  DoArmarIdArchivos(ID_CARPETA_PRESTDIN, sClaveArmada, sIdArchivos);
  DoArmarIdArchivos(ID_CARPETA_INCAPACID, sClaveArmada, sIdArchivos);
  DoArmarIdArchivos(ID_CARPETA_CD_SIN, sClaveArmada, sIdArchivos);
  DoArmarIdArchivos(ID_CARPETA_CD_PRDINSIN, sClaveArmada, sIdArchivos);
  DoArmarIdArchivos(ID_CARPETA_CD_INCA, sClaveArmada, sIdArchivos);

  sIdArchivos := CutRight(sIdArchivos, 2);

  if not IsEmptyString(sIdArchivos) then
    TFrmDetalleArchivo.MostrarDetalleArchivos(Owner, sIdArchivos, True, 'Detalle de Carpeta: Siniestro ' + StringReplace(sClaveArmada, '|', '/', [rfReplaceAll]));
end;

procedure DoCargarImagenesDigitalizadas(Owner: TComponent; TipoArchivo: TTableId; CantCampos: Integer; SubClave1, SubClave2, SubClave3, SubClave4: String);
var
  sClaveArmada: String;
  IdArchivo: TTableId;
begin
  sClaveArmada := GetClaveArmada(CantCampos, SubClave1, SubClave2, SubClave3, SubClave4);

  IdArchivo := GetIdArchivo(TipoArchivo, sClaveArmada);
  if IdArchivo <> ART_EMPTY_ID then
    TFrmDetalleArchivo.MostrarDetalleArchivo(Owner, IdArchivo, True);
end;

procedure DoCargarImagenesDigitalizadasPrest(Owner: TComponent; IdPrestador: Integer);
begin
  DoCargarImagenesDigitalizadas(Owner, ID_CARPETA_PREST, 1, IntToStr(IdPrestador), '', '', '');
end;

procedure DoCargarImagenesDigitalizadasHyS(Owner: TComponent; Contrato, NroEstablecimiento: Integer);
begin
  DoCargarImagenesDigitalizadas(Owner, ID_CARPETA_HYS, 2, IntToStr(Contrato), IntToStr(NroEstablecimiento), '', '');
end;

procedure DoBuscarCampoCodigoBarrasArchivo(frm: TfrmCustomConsulta; TipoArchivo: TTableId; CampoBusquedaClave, CampoBusquedaCartaDoc: String);
var
  sCampoBusqueda, sClave: String;
  bBusquedaPorCartaDoc: Boolean;
begin
  Verificar(not frm.DataSource.DataSet.Active or frm.DataSource.DataSet.IsEmpty, frm, 'La grilla está vacía.');

  with TfraFiltroArchivo.Create(nil) do
    try
      Visible := False;
      Tipo    := TipoArchivo;

      bBusquedaPorCartaDoc    := IsTipoCartaDocumento();
      CodigoBarrasPorCartaDoc := bBusquedaPorCartaDoc;
      CodigoBarrasOk          := True;

      while True do
        begin
          btnCargarCodigoBarrasClick(frm);

          if not CodigoBarrasOk then
            Break;

          if bBusquedaPorCartaDoc then
            sClave := ClaveCartaDoc
          else
            sClave := Clave;

          if (sClave <> '') and (sClave <> '|') then
            begin
              if bBusquedaPorCartaDoc and not IsEmptyString(CampoBusquedaCartaDoc) then
                sCampoBusqueda := CampoBusquedaCartaDoc
              else
                sCampoBusqueda := CampoBusquedaClave;

              frm.DoBuscarCampoCodigoBarras(sCampoBusqueda, sClave, True);
            end;

          ClearArchivo;
        end;
    finally
      Free;
    end;
end;
{$ENDIF}

function IsUtilizarTablasBank: Boolean;
begin
  Result := ValorSql('SELECT ARCHIVO.ISUTILIZARTABLASBANK FROM DUAL') = 'S';
end;

function Get_IdArchivoTransformado(IdArchivo, IdDetalleArchivo: TTableId): TTableId;
var
  sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
  Id: TTableId;
  iCantCampos: Integer;
  TipoArchivo: TTableId;
  bPorDetalleArchivo: Boolean;
begin
  bPorDetalleArchivo := (IdDetalleArchivo <> ART_EMPTY_ID);

  if bPorDetalleArchivo then
    TipoArchivo := Get_TipoDetalleArchivo(IdDetalleArchivo)
  else
    TipoArchivo := Get_TipoArchivo(IdArchivo);

  if TipoArchivo = ID_CARPETA_EXAMENPREOC then
    begin
      if bPorDetalleArchivo then
        sClave := Get_ClaveDetalleArchivo(IdDetalleArchivo)
      else
        sClave := Get_ClaveArchivo(IdArchivo);

      iCantCampos := GetCantCamposBusquedaTipoArchivo(TipoArchivo);
      GetSubClaves(sClave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

      sClave := GetClaveArmada(iCantCampos, sSubClave1, '-1', sSubClave3, sSubClave4);
      Id := GetIdArchivo(TipoArchivo, sClave);
    end
  else
    begin
      if bPorDetalleArchivo then
        Id := IdDetalleArchivo
      else
        Id := IdArchivo;
    end;

  Result := Id;
end;

function Get_IdTipoArchivoCodigo(Codigo: String): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT TA_ID ' +
            'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
           'WHERE TA_CODIGO = :Codigo ' +
             'AND TA_FECHABAJA IS NULL';

  Result := ValorSqlIntegerEx(sSql, [Codigo], ART_EMPTY_ID);
end;

function Is_TieneRepositorio(Codigo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
           'WHERE TA_CODIGO = :Codigo ' +
             'AND TA_FECHABAJA IS NULL ' +
             'AND TA_TIENEREPOSITORIO = ''S''';

  Result := ExisteSqlEx(sSql, [Codigo]);
end;

function Is_ExisteLote(Lote: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RLO_LOTE ' +
           'WHERE LO_ID = :Id ' +
             'AND LO_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [Lote]);
end;

function Is_ExisteRemito(Remito: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RRE_REMITO ' +
           'WHERE RE_ID = :Id ' +
             'AND RE_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [Remito]);
end;

function Is_ExisteLoteEnRemito(Lote, Remito: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RLO_LOTE ' +
           'WHERE LO_ID = :IdLote ' +
             'AND LO_FECHABAJA IS NULL ' +
             'AND LO_IDREMITO = :IdRemito';

  Result := ExisteSqlEx(sSql, [Lote, Remito]);
end;

function Do_TransformarClave(TipoArchivo: TTableId; Clave: String): String;
var
  iCantCampos: Integer;
  sSubClave1, sSubClave2, sSubClave3, sSubClave4: String;
begin
  // esta función está relacionada con function Is_ExisteClaveArchivoCodDoc_EnLote
  if TipoArchivo = ID_CARPETA_EXAMENPREOC then
    begin
      iCantCampos := GetCantCamposBusquedaTipoArchivo(TipoArchivo);
      GetSubClaves(Clave, sSubClave1, sSubClave2, sSubClave3, sSubClave4);

      sSubClave2 := '-1';  // no existe el nro. de CUIL en el repositorio

      Result := GetClaveArmada(iCantCampos, sSubClave1, sSubClave2, sSubClave3, sSubClave4);
    end
  else
    Result := Clave;
end;

function Is_ExisteClaveArchivoCodDoc_EnLote(TipoArchivo: TTableId; Clave: String; Lote: TTableId; CodDocumento: String = ''): Boolean;
var
  sSql: String;
begin
  sSql :=  'SELECT 1 ' +
             'FROM RTD_TIPODOCUMENTO, RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
            'WHERE DA_IDARCHIVO = AR_ID ' +
              'AND DA_IDTIPODOCUMENTO = TD_ID ' +
              'AND DA_FECHABAJA IS NULL ' +
              'AND DA_LOTE = :Lote ' +
              Iif(TipoArchivo = ID_CARPETA_EXAMENPREOC, 'AND ARCHIVO.GETCLAVEARMADA(2, ARCHIVO.GETSUBCLAVE(AR_CLAVE, 1), ' + SqlValue('-1') + ', NULL, NULL) = :Clave',
                                                        'AND AR_CLAVE = :Clave') + ' ' +
              'AND AR_TIPO = :TipoArchivo ' +
              Iif(IsEmptyString(CodDocumento), '', 'AND TD_CODIGO = ' + SqlValue(CodDocumento));

  Result := ExisteSqlEx(sSql, [Lote, Clave, TipoArchivo]);
end;

function Is_ExisteLoteEnRepositorio(Lote: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RRA_REPOSITORIOARCHIVO ' +
           'WHERE RA_LOTE = :Id ' +
             'AND RA_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [Lote]);
end;

function Is_ExisteLoteEnTipoArchivo(Lote, TipoArchivo: TTableId): Boolean;
var
  sSql: String;
begin
  (*sSql :=  'SELECT 1 ' +
             'FROM RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
            'WHERE DA_IDARCHIVO = AR_ID ' +
              'AND DA_FECHABAJA IS NULL ' +
              'AND DA_LOTE = :Lote ' +
              'AND AR_TIPO = :TipoArchivo';*)

  sSql :=  'SELECT 1 ' +
             'FROM RLO_LOTE ' +
            'WHERE LO_ID = :Lote ' +
              'AND LO_TIPO = :TipoArchivo';

  Result := ExisteSqlEx(sSql, [Lote, TipoArchivo]);
end;

function Is_ExisteNroMedioEnRepositorio(NroMedio: Integer; var TipoArchivo: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT AR_TIPO ' +
            'FROM RAR_ARCHIVO, RRA_REPOSITORIOARCHIVO ' +
           'WHERE RA_NROMEDIO = :NroMedio ' +
             'AND RA_FECHABAJA IS NULL ' +
             'AND RA_IDARCHIVO = AR_ID';
  TipoArchivo := ValorSqlIntegerEx(sSql, [NroMedio], ART_EMPTY_ID);

  Result := (TipoArchivo <> ART_EMPTY_ID);
end;

function Get_ClaveCarpetaVirtual(TipoArchivo: TTableId): String;
var
  iCantCampos: Integer;
begin
  iCantCampos := GetCantCamposBusquedaTipoArchivo(TipoArchivo);
  Result      := GetClaveArmada(iCantCampos, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL);
end;

function Get_UsuarioAltaLote(Lote: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT LO_USUALTA ' +
            'FROM RLO_LOTE ' +
           'WHERE LO_ID = :Id';

  Result := ValorSqlEx(sSql, [Lote]);
end;

function Is_ExisteNroMedioEnSegErroresUsuario(NroMedio: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM REU_ERRORUSUARIO ' +
           'WHERE EU_NROMEDIO = :NroMedio ' +
             'AND EU_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [NroMedio]);
end;

procedure Do_EliminarNroMedioSegErroresUsuario(NroMedio: Integer);
var
  sSql: String;
begin
  sSql := 'UPDATE REU_ERRORUSUARIO ' +
             'SET EU_FECHABAJA = SYSDATE, ' +
                 'EU_USUBAJA = :User ' +
           'WHERE EU_NROMEDIO = :NroMedio ' +
             'AND EU_FECHABAJA IS NULL';
  EjecutarSqlSTEx(sSql, [Sesion.UserId, NroMedio]);
end;

function Is_CarpetaEnResguardo(TipoArchivo: Integer; Clave: String): Boolean;
var
  sSql: String;
begin
  sSql := 'ART.ARCHIVO.IS_CARPETAENRESGUARDO(:TipoArchivo, :Clave)';

  Result := Iif(ObtenerValorEx(sSql, [TipoArchivo, Clave]) = 'S', True, False);
end;

function Get_IdTipoArchivoLote(Lote: TTableId): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT LO_TIPO ' +
            'FROM ARCHIVO.RLO_LOTE ' +
           'WHERE LO_ID = :Lote';

  Result := ValorSqlIntegerEx(sSql, [Lote], ART_EMPTY_ID);
end;

function Is_LoteSinDocumentos(Lote: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ARCHIVO.RLO_LOTE ' +
           'WHERE LO_ID = :Lote ' +
             'AND NOT EXISTS (SELECT 1 ' +
                               'FROM ARCHIVO.RDA_DETALLEARCHIVO ' +
                              'WHERE DA_LOTE = LO_ID ' +
                                'AND DA_FECHABAJA IS NULL)';

  Result := ExisteSqlEx(sSql, [Lote]);
end;

function Is_CarpetaSinDocumentos(TipoArchivo: Integer; Clave: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ARCHIVO.RAR_ARCHIVO ' +
           'WHERE AR_TIPO = :Tipo ' +
             'AND AR_CLAVE = :Clave ' +
             'AND (EXISTS (SELECT 1 ' +
                            'FROM ARCHIVO.RDA_DETALLEARCHIVO ' +
                           'WHERE DA_IDARCHIVO = AR_ID ' +
                             'AND DA_FECHABAJA IS NULL ' +
                             'AND DA_OPCIONDESTINO NOT IN (' + SqlValue(OPCION_DESTINO_SINPAPEL) + ')) ' +
               'OR EXISTS (SELECT 1 ' +
                            'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO ' +
                           'WHERE RA_IDARCHIVO = AR_ID ' +
                             'AND RA_FECHABAJA IS NULL))';

  Result := not ExisteSqlEx(sSql, [TipoArchivo, Clave]);
end;

function Is_PermitirCartasDocBajas(TipoArchivo: Integer): Boolean;
begin
  Result := (TipoArchivo = ID_CARPETA_CD_COB) or (TipoArchivo = ID_CARPETA_CD_INCA);  // relacionado con SQL de RefreshData en unFrmArmadoLote
end;

function Get_MensajeReclamoLotes(Usuario: String): String;
var
  sMensaje, sSql: String;
begin
  sMensaje := '';

  sSql := 'SELECT LO_ID LOTE, TRUNC(LO_FECHA_ESTADO) FESTADO, TB_DESCRIPCION ESTADO ' +
            'FROM CTB_TABLAS, ARCHIVO.RLO_LOTE ' +
           'WHERE LO_FECHABAJA IS NULL ' +
             'AND LO_FECHAALTAEXTRAVIADO IS NULL ' +
             'AND LO_ESTADO IN (:EstUsuario, :EstEnTransito) ' +
             'AND SYSDATE >= ART.AMEBPBA.CALCDIASHABILES(LO_FECHA_ESTADO, 4) ' +
             'AND LO_USUALTA = :UsuAlta ' +
             'AND TB_CLAVE = ''ESLOT'' ' +
             'AND TB_CODIGO = LO_ESTADO ' +
           'ORDER BY LO_FECHA_ESTADO, LO_ESTADO';

  with GetQueryEx(sSql, [ESTADOLOTE_USUARIO, ESTADOLOTE_ENTRANSITO, Usuario]) do
    try
      if not Eof then
        begin
          sMensaje := 'Le informamos que Usted generó los siguientes Lotes:' + CRLF;

          while not Eof do
            begin
              sMensaje := sMensaje + '  ' + FieldByName('LOTE').AsString + ' - ' + FieldByName('ESTADO').AsString + ' (' + FieldByName('FESTADO').AsString + ')' + CRLF;

              Next;
            end;

          sMensaje := sMensaje + CRLF + 'Dichos lotes aun no fueron remitidos al sector de Guarda y Digitalización.' + CRLF +
                                        'De estar el Lote en Poder del Usuario, no omita cambiar el estado a Tránsito para el envío.';
        end;
    finally
      Free;
    end;

  Result := sMensaje;
end;

procedure DoVerificarReclamoLotesUsuario;
var
  sMensaje: String;
begin
  sMensaje := Get_MensajeReclamoLotes(Sesion.UserId);

  if not IsEmptyString(sMensaje) then
    MsgBox(sMensaje, MB_ICONINFORMATION);
end;

function Get_CantCuerposCarpeta(IdArchivo: TTableId): Integer;
var
  sSql: String;
begin
  sSql := 'SELECT AR_CANTCUERPOS ' +
            'FROM ARCHIVO.RAR_ARCHIVO ' +
           'WHERE AR_ID = :Id';

  Result := ValorSqlIntegerEx(sSql, [IdArchivo], 1);
end;

function Get_IdTipoArchivoGuardaCarpetaFisica(TipoArchivo: TTableId; var Descripcion: String): TTableId;
var
  sTipoArchivo, sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT TA_ID, TA_DESCRIPCION ' +
            'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
           'WHERE TA_ID = (SELECT TA_IDTIPOARCHIVOCARPETAGUARDA ' +
                            'FROM ARCHIVO.RTA_TIPOARCHIVO ' +
                           'WHERE TA_ID = ' + SqlValue(TipoArchivo) + ')';

  SqlResults := ValoresColSql(sSql);
  try
    sTipoArchivo := SqlResults[0];
    if IsEmptyString(sTipoArchivo) then
      begin
        Descripcion := '';
        Result      := TipoArchivo;
      end
    else
      begin
        Descripcion := SqlResults[1];
        Result      := StrToInt(sTipoArchivo);
      end;
  finally
    SqlResults.Free;
  end;
end;

procedure DoAltaDocumentoCarpeta(TipoArchivo, IdTipoDocumento: TTableId; Clave: String; VerificarExisteDoc: Boolean; ConTrans: Boolean = True; ImprimirEtiqueta: Boolean = False; CantEtiquetas: Integer = 0; CodigoDocumento: String = ''; OpcionDestino: String = OPCION_DESTINO_DIGITALIZACION; Hojas: Integer = 1);
var
  IdSecuenciaTraz: Integer;
  IdRar: TTableId;
  iLote: Integer;
begin
  if ConTrans then
    BeginTrans(True);
  try
    if not VerificarClaveExiste(TipoArchivo, Clave, IdRar) then
      IdRar := DoInsertArchivo(TipoArchivo, TIPOUBICACION_GUARDA,
                               '', 0, '', Sesion.UserID, Clave, False);

    if not VerificarExisteDoc or not Is_ExisteDocumento(TipoArchivo, Clave, Get_CodDocumento(IdTipoDocumento), '', iLote) then
      DoInsertDetalleArchivo(IdSecuenciaTraz, IdRar, IdTipoDocumento, 0, OpcionDestino,
                             Hojas, '', CodigoDocumento, '', 0, '', False, 0, 0, 0, '', ImprimirEtiqueta, CantEtiquetas);

    if ConTrans then
      CommitTrans(True);
  except
    on E: Exception do
    begin
      if ConTrans then
        RollBack(True);

      raise Exception.Create(E.Message + CRLF + 'Error al insertar el documento en la carpeta');
    end;
  end;
end;

function Get_IdTipoDocumentoTransfBancaria(CodAbreviaturaBanco, Tipo: String): TTableId;
var
  sPrefijo, sCodDocumento: String;
begin
  if Tipo = 'T' then        // Tranferencia
    sPrefijo := 'TRB'
  else   // Tipo = 'D'      // Depósito en Cuenta
    sPrefijo := 'DEC';

  sCodDocumento := sPrefijo + CodAbreviaturaBanco;

  Result := Get_IdTipoDocumentoSector(sCodDocumento, 'TESO');
end;

function Get_TipoUbicacionArchivo(IdArchivo: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT AR_TIPOUBICACION ' +
            'FROM ARCHIVO.RAR_ARCHIVO ' +
           'WHERE AR_ID = :Id';

  Result := ValorSqlEx(sSql, [IdArchivo]);
end;

function Is_LoteLiquidaciones(Lote: TTableId): Boolean;
var
  sSql: String;
  iCantReg: Integer;
begin
  sSql := 'SELECT COUNT(DISTINCT TD_CODIGO) ' +
            'FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RTD_TIPODOCUMENTO ' +
           'WHERE DA_FECHABAJA IS NULL ' +
             'AND DA_IDTIPODOCUMENTO = TD_ID ' +
             'AND DA_LOTE = :Lote ' +
             'AND TD_CODIGO <> ' + SqlValue(CODDOC_LOTE) + ' ' +
             'AND TD_CODIGO IN (' + CODDOCS_LIQ + ')';

  iCantReg := ValorSqlIntegerEx(sSql, [Lote]);

  Result := (iCantReg >= 1);
end;

function IsPerfilAdministrador: Boolean;
begin
  Result := GetPerfilAdministrador();

  if not Result then
    InfoHint(nil, 'Usted no posee perfil de Administrador.');
end;

function IsPerfilAdministrador_GyD: Boolean;
begin
  Result := GetPerfilAdministrador() or GetPerfilGuardaYDigitalizacion();

  if not Result then
    InfoHint(nil, 'Usted no posee perfil de Administrador ni de Guarda y Digitalización.');
end;

procedure DoModificarEstadoCarpeta(IdArchivo: TTableId; Estado: String; ConTransaccion: Boolean; IdRemitoDevol: TTableId = ART_EMPTY_ID; Usuario: String = ''; ModificarFechaMov: Boolean = False);
var
  sUsuario, sSql: String;
  Id: TTableId;
begin
  Id := Iif(IdArchivo <> ART_EMPTY_ID, IdArchivo, IdRemitoDevol);

  sSql := 'UPDATE RAR_ARCHIVO ' +
             'SET AR_ESTADO = :Estado, ' +
                 'AR_USU_ESTADO = :Usuario, ' +
                 'AR_FECHA_ESTADO = SYSDATE ' +
                 Iif(ModificarFechaMov, ', AR_FECHAMOVIMIENTO = SYSDATE ', '') +
           'WHERE ' + Iif(IdArchivo <> ART_EMPTY_ID, 'AR_ID', 'AR_IDREMITODEVOL') + ' = :Id';

  sUsuario := NVL(Usuario, Sesion.UserID);

  if ConTransaccion then
    EjecutarSqlEx(sSql, [Estado, sUsuario, Id])
  else
    EjecutarSqlSTEx(sSql, [Estado, sUsuario, Id]);
end;

function Get_EstadoCarpeta(IdArchivo: TTableId; var DescrEstado: String): String;
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT TB_DESCRIPCION, AR_ESTADO ' +
            'FROM CTB_TABLAS, RAR_ARCHIVO ' +
           'WHERE AR_ID = ' + SqlValue(IdArchivo) + ' ' +
             'AND AR_ESTADO = TB_CODIGO(+) ' +
             'AND ''ESCAR'' = TB_CLAVE(+)';

  SqlResults := ValoresColSql(sSql);
  try
    DescrEstado := SqlResults[0];
    Result      := SqlResults[1];
  finally
    SqlResults.Free;
  end;
end;

function Get_CodigoTipoArchivoLote(Lote: Integer): String;
var
  sSql: String;
begin
  sSql := 'SELECT TA_CODIGO ' +
            'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RLO_LOTE ' +
           'WHERE LO_TIPO = TA_ID ' +
             'AND LO_ID = :Lote';

  Result := ValorSqlEx(sSql, [Lote]);
end;

function Is_CarpetaEstadoUsuario(TipoArchivo: Integer; Clave, Estado, Usuario: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO ' +
           'WHERE AR_ESTADO = :Estado ' +
             'AND AR_USU_ESTADO = :Usuario ' +
             'AND AR_CLAVE = :Clave ' +
             'AND AR_TIPO = :Tipo';

  Result := ExisteSqlEx(sSql, [Estado, Usuario, Clave, TipoArchivo]);
end;

procedure DoRecepcionarCarpetaUsuario(IdArchivo: TTableId; Usuario: String);
var
  sSql: String;
begin
  sSql := 'UPDATE RAR_ARCHIVO ' +
             'SET AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) + ', ' +
                 'AR_UBICACION = ' + SqlValue(Usuario) + ', ' +
                 'AR_FECHAMOVIMIENTO = SYSDATE' + ', ' +
                 'AR_RECEPTOR =  ' + SqlValue(Usuario) + ', ' +
                 'AR_EMISOR = ' + SqlValue(Sesion.UserId) + ', ' +
                 'AR_IDABOGADO = NULL, ' +
                 'AR_SECTORUSUARIO = ARCHIVO.GET_SECTORUSUARIO(' + SqlValue(Usuario) + ', ' + SqlValue(TIPOUBICACION_USUARIO) + '), ' +
                 'AR_CAJA = NULL, ' +
                 'AR_IDREMITODEVOL = NULL, ' +
                 'AR_SEQ_REMITODEVOL = NULL ' +
           'WHERE AR_ID = ' + SqlValue(IdArchivo);
  EjecutarSqlST(sSql);
end;

function Get_CantDocumentosLote(TipoArchivo: Integer): Integer;
var
  iCantDocumentosLote: Integer;
begin
  if (TipoArchivo in [ID_CARPETA_SINIESTRO, ID_CARPETA_INCAPACID, ID_CARPETA_TESORERIA,
                      ID_CARPETA_HYS, ID_CARPETA_ML_GRAL, ID_CARPETA_EMISNOTAS,
                      ID_CARPETA_EXTRBANC])
    or TipoArchivoCartaDocumento(TipoArchivo) then
    iCantDocumentosLote := StrToIntDef(get_ParametrobyId(PARAMETRO_CANTIDADDOCUMENTOSLOTE), VALOR_PARAMETRO_CANTIDADDOCUMENTOSLOTE)
  else if TipoArchivo in [ID_CARPETA_AFILIAC] then
    iCantDocumentosLote := VALOR_PARAMETRO_CANTIDADDOCUMENTOSLOTE2
  else
    iCantDocumentosLote := VALOR_PARAMETRO_CANTIDADDOCUMENTOSLOTE;     // Para el resto de los documentos se fija un máximo (reducido) de docs. por lote, por el tema del armado de remitos,
                                                                       // que no permite repartir un mismo lote en varias cajas, es decir, cada lote pertenece a una sola caja
  Result := iCantDocumentosLote;
end;

function IsImagenDigitalizadaPorUsuario(IdRepositorio: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RRA_REPOSITORIOARCHIVO ' +
           'WHERE RA_ID = :Id ' +
             'AND RA_OBSERVACIONES LIKE ''%'' || :Obs || ''%''';

  Result := ExisteSqlEx(sSql, [IdRepositorio, GetObservacionesDocumentoCarpeta(dcImagen)]);
end;

function GetUltUsuarioCarpeta(IdArchivo: TTableId): String;
var
  sSql: String;
begin
  sSql := 'SELECT HA_UBICACION ' +
            'FROM ARCHIVO.RHA_HISTORICOARCHIVO ' +
           'WHERE HA_ID = (SELECT MAX(HA_ID) ' +
                            'FROM ARCHIVO.RHA_HISTORICOARCHIVO, ART.USE_USUARIOS ' +
                           'WHERE HA_IDARCHIVO = :IdArchivo ' +
                             'AND HA_ESTADO = :EstadoPoderUsuario ' +
                             'AND HA_IDTIPOUBICACION = :TipoUbicUsuario ' +
                             'AND HA_UBICACION = SE_USUARIO)';

  Result := ValorSqlEx(sSql, [IdArchivo, ESTADOCARPETA_PODERUSUARIO, TIPOUBICACION_USUARIO]);
end;

function Is_OcultarImagenRepositorio(TipoArchivo: TTableId): Boolean;
begin
  Result := ((TipoArchivo = ID_CARPETA_LEGPERS_RRHH) and not AreIn(Sesion.Sector, ['RRHH']));
end;

function Is_ArchivoSinMovimCarpetas(TipoArchivo: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'ART.ARCHIVO.IS_ARCHIVOSINMOVIMCARPETAS(:TipoArchivo)';

  Result := (ObtenerValorEx(sSql, [TipoArchivo]) = 'S');
end;

function Is_ArchivoEtiquetasporPagina(TipoArchivo: TTableId): Boolean;
begin
  Result := (TipoArchivo in [ID_CARPETA_COMPRAS]);
end;

(* -------------------------------------------------------------------------- *)

function Is_ExisteSecTrazabilLote(Lote: TTableId; SecTrazabilidad: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RDA_DETALLEARCHIVO ' +
           'WHERE DA_LOTE = :Lote ' +
             'AND DA_SECUENCIATRAZABIL = :SecTrazabil ' +
             'AND DA_FECHABAJA IS NULL';

  Result := ExisteSqlEx(sSql, [Lote, SecTrazabilidad]);
end;

function Is_ExisteSecTrazabilTipoArchivoDetalleArchivo(SecTrazabilidad:Integer; TipoArchivo: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND DA_SECUENCIATRAZABIL = :SecTrazabil ' +
             'AND DA_FECHABAJA IS NULL ' +
             'AND AR_TIPO = :TipoArchivo';

  Result := ExisteSqlEx(sSql, [SecTrazabilidad, TipoArchivo]);
end;

function Is_ExisteSecTrazabilClaveDetalleArchivo(SecTrazabilidad: Integer; Clave: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND DA_SECUENCIATRAZABIL = :SecTrazabil ' +
             'AND DA_FECHABAJA IS NULL ' +
             'AND AR_CLAVE = :Clave';

  Result := ExisteSqlEx(sSql, [SecTrazabilidad, Clave]);
end;

function Is_ExisteSecTrazabilCodDocumentoDetalleArchivo(SecTrazabilidad: Integer; CodDocumento: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RTD_TIPODOCUMENTO, RDA_DETALLEARCHIVO ' +
           'WHERE DA_IDTIPODOCUMENTO = TD_ID ' +
             'AND DA_SECUENCIATRAZABIL = :SecTrazabil ' +
             'AND DA_FECHABAJA IS NULL ' +
             'AND TD_CODIGO = :Codigo';

  Result := ExisteSqlEx(sSql, [SecTrazabilidad, CodDocumento]);
end;

function Is_ExisteSecTrazabil(SecTrazabilidad: Integer; SoloActivas: Boolean = True): Boolean;
var
  sSoloActivas, sSql: String;
begin
  if SoloActivas then
    sSoloActivas := 'S'
  else
    sSoloActivas := 'N';

  sSql := 'ARCHIVO.IS_EXISTESECTRAZABIL(:SecTrazabilidad, :SoloActivas)';

  Result := (ObtenerValorEx(sSql, [SecTrazabilidad, sSoloActivas]) = 'S');
end;

function Get_SecuenciaTrazabil(IdDetalleArchivo: TTableId): TTableId;
var
  sSql: string;
begin
  sSql := 'SELECT DA_SECUENCIATRAZABIL ' +
            'FROM RDA_DETALLEARCHIVO ' +
           'WHERE DA_ID = :IdDetalleArchivo ' +
             'AND DA_FECHABAJA IS NULL';

  Result := ValorSqlIntegerEx(sSql, [IdDetalleArchivo], ART_EMPTY_ID);
end;

procedure DoCargarCodBarrasSecTrazabililidad(SecTrazabilidad: Integer; qrlBarras: TQRLabel; qrlNumero: TQRLabel = nil; qrlDetalle1: TQRLabel = nil; qrlDetalle2: TQRLabel = nil; Alineacion: TAlineacionCodBarras = alNinguna; TestearAnchoMaximo: Boolean = False; VerificarUsarCodBarras: Boolean = True);
(*
SecTrazabilidad: nro. de la secuencia de trazabilidad
qrlBarras: label del reporte donde se muestra el código de barras
qrlNumero: label del reporte donde se muestra el número que representa el código de barras
qrlDetalle1: label del reporte donde se muestra la primera linea de informacional asociada a la sec. de trazabilidad
qrlDetalle2: label del reporte donde se muestra la segunda linea de informacional asociada a la sec. de trazabilidad
Alineacion: alineación del label que contiene el código de barras dentro de la banda del reporte
TestearAnchoMaximo: para hacer pruebas con el ancho máximo que puede ocupar el código de barras y la información adicional
VerificarUsarCodBarras: controla que para el tipo de archivo esté habilitado el uso de secuencias de trazabilidad
*)
var
  sSql, sInfoAdicional1, sInfoAdicional2, sSecTrazabilidad: String;
  bHayNumero, bHabilitar: Boolean;
  iAncho, iLongInfoAdic1, iLongInfoAdic2, iIndexPrintAct, iBase: Integer;
  IdDetalleArch, TipoArchivo: TTableId;
begin
  TipoArchivo := Get_TipoDetalleArchivoSecTraz(SecTrazabilidad);

  if VerificarUsarCodBarras then
    bHabilitar := IsUsarSecuenciaTrazabilidad(TipoArchivo)
  else
    bHabilitar := True;

  qrlBarras.Enabled := bHabilitar;

  if Assigned(qrlNumero) then
    qrlNumero.Enabled := bHabilitar;

  if Assigned(qrlDetalle1) then
    qrlDetalle1.Enabled := bHabilitar;

  if Assigned(qrlDetalle2) then
    qrlDetalle2.Enabled := bHabilitar;

  if bHabilitar then
    begin
      iIndexPrintAct := Printer.PrinterIndex;

      if TestearAnchoMaximo then
        sSecTrazabilidad := '1234567890'
      else if SecTrazabilidad = ART_EMPTY_ID then
        sSecTrazabilidad := 'ERROR'
      else
        sSecTrazabilidad := Trim(IntToStr(SecTrazabilidad));

      with qrlBarras do
        begin
          with Font do
            begin
              Name  := '3 of 9 Barcode';
              Size  := 20;
              Style := [];
            end;

          Enabled   := True;
          Alignment := taCenter;
          AutoSize  := True;
          Height    := 18;
          Caption   := '*' + sSecTrazabilidad + '*';
          iBase     := Top + Height;

          case Alineacion of
            alIzquierda:
              Left := 1;
            alCentro:
              Left := (Parent.Width - Width) div 2;
            alDerecha:
              Left := Parent.Width - (Width + 1);
          end;
        end;

      bHayNumero := Assigned(qrlNumero);
      if bHayNumero then
        with qrlNumero do
          begin
            with Font do
              begin
                Name  := 'Arial';
                Size  := 8;
                Style := [];
              end;

            Enabled   := True;
            Alignment := qrlBarras.Alignment;
            AutoSize  := False;
            Height    := 10;
            Width     := qrlBarras.Width;
            Left      := qrlBarras.Left;
            Top       := iBase;
            Caption   := sSecTrazabilidad;
            iBase     := Top + Height;
          end;

      if bHayNumero and Assigned(qrlDetalle1) and Assigned(qrlDetalle2) then
        begin
          if TestearAnchoMaximo then
            begin
              sSql := 'SELECT DA_ID ' +
                        'FROM ARCHIVO.RAR_ARCHIVO RAR1, ARCHIVO.RDA_DETALLEARCHIVO ' +
                       'WHERE AR_TIPO = :Tipo ' +
                         'AND DA_IDARCHIVO = AR_ID ' +
                         'AND DA_FECHABAJA IS NULL ' +
                         'AND DA_LOTE IS NOT NULL ' +
                         'AND LENGTH(AR_CLAVE) = (SELECT MAX(LENGTH(AR_CLAVE)) ' +
                                                   'FROM ARCHIVO.RAR_ARCHIVO RAR2, ARCHIVO.RDA_DETALLEARCHIVO ' +
                                                  'WHERE RAR2.AR_TIPO = RAR1.AR_TIPO ' +
                                                    'AND DA_IDARCHIVO = RAR2.AR_ID ' +
                                                    'AND DA_FECHABAJA IS NULL ' +
                                                    'AND DA_LOTE IS NOT NULL)';
              IdDetalleArch   := ValorSqlIntegerEx(sSql, [TipoArchivo], ART_EMPTY_ID);
              SecTrazabilidad := ART_EMPTY_ID;
            end
          else
            IdDetalleArch := ART_EMPTY_ID;

          GetInfoAdicionalCodBarrasSecTrazabililidad(SecTrazabilidad, IdDetalleArch, sInfoAdicional1, sInfoAdicional2);

          with qrlDetalle1 do
            begin
              with Font do
                begin
                  Name  := qrlNumero.Font.Name;
                  Size  := qrlNumero.Font.Size;
                  Style := [];
                end;

              Enabled        := True;
              Alignment      := qrlBarras.Alignment;
              AutoSize       := False;
              Height         := qrlNumero.Height;
              Top            := iBase;
              Caption        := sInfoAdicional1;
              iLongInfoAdic1 := Round(Get_PrintermmPerFontx(iIndexPrintAct, Font.Name, Font.Size, Font.Style, Caption));
              iBase          := Top + Height;
            end;

          with qrlDetalle2 do
            begin
              with Font do
                begin
                  Name  := qrlDetalle1.Font.Name;
                  Size  := qrlDetalle1.Font.Size;
                  Style := [];
                end;

              Enabled        := True;
              Alignment      := qrlBarras.Alignment;
              AutoSize       := False;
              Height         := qrlDetalle1.Height;
              Top            := iBase;
              Caption        := sInfoAdicional2;
              iLongInfoAdic2 := Round(Get_PrintermmPerFontx(iIndexPrintAct, Font.Name, Font.Size, Font.Style, Caption));
            end;

          iAncho := Max(Trunc(qrlBarras.Size.Width), Max(iLongInfoAdic1, iLongInfoAdic2)) + 1;

          with qrlDetalle1 do
            begin
              Size.Width := iAncho;

              case Alineacion of
                alIzquierda:
                  Left := 1;
                alCentro:
                  Left := (Parent.Width - Width) div 2;
                alDerecha:
                  Left := Parent.Width - (Width + 1);
              end;
            end;

          with qrlDetalle2 do
            begin
              Size.Width := qrlDetalle1.Size.Width;
              Left       := qrlDetalle1.Left;
            end;
        end;
    end;
end;

procedure DoCargarCodBarrasSecTrazabililidad_DetArchivo(IdDetalleArchivo: TTableId; qrlBarras: TQRLabel; qrlNumero: TQRLabel = nil; qrlDetalle1: TQRLabel = nil; qrlDetalle2: TQRLabel = nil; Alineacion: TAlineacionCodBarras = alNinguna; TestearAnchoMaximo: Boolean = False; VerificarUsarCodBarras: Boolean = False);
begin
  DoCargarCodBarrasSecTrazabililidad(Get_SecuenciaTrazabil(IdDetalleArchivo), qrlBarras, qrlNumero, qrlDetalle1, qrlDetalle2, Alineacion, TestearAnchoMaximo, VerificarUsarCodBarras);
end;

procedure GetInfoAdicionalCodBarrasSecTrazabililidad(SecTrazabilidad, IdDetalleArchivo: Integer; var InfoAdicional1, InfoAdicional2: String);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT TRIM(AR_CLAVE) ADIC1, ' +
                 'TRIM(TA_CODIGO) || '' - '' || TRIM(TD_CODIGO) ADIC2 ' +
            'FROM RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO, RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND AR_TIPO = TA_ID ' +
             'AND DA_IDTIPODOCUMENTO = TD_ID ' +
             Iif(IdDetalleArchivo <> ART_EMPTY_ID, 'AND DA_ID = ' + SqlValue(IdDetalleArchivo), 'AND DA_SECUENCIATRAZABIL = ' + SqlValue(SecTrazabilidad));

  SqlResults := ValoresColSql(sSql);
  try
    InfoAdicional1 := SqlResults[0];
    InfoAdicional2 := SqlResults[1];
  finally
    SqlResults.Free;
  end;
end;

procedure DoImprimirEtiqueta(Consulta: TSDQuery; tslCheckeados: TStringList; CampoFila, CampoHojas, CampoTipoArch, CampoSecTrazabil, CampoCodigoDoc, CampoClave: String; PreguntarCantHojas: Boolean = True; ImprimirSoloSecTrazabilidad: Boolean = False; InfoAdicional1: String = ''; InfoAdicional2: String = '');
var
  APointer: TBookMark;
  bSoloUnaEtiqueta: Boolean;
  iCantEtiquetas: Integer;
  PrevCursor: TCursor;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un registro.');

  if MsgBox('¿Confirma la impresión de las etiquetas de los documentos seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      if PreguntarCantHojas then
        bSoloUnaEtiqueta := (MsgBox('¿Desea imprimir solo una etiqueta por documento?', MB_ICONQUESTION+MB_YESNO) = ID_YES)
      else
        bSoloUnaEtiqueta := True;

      with Consulta do
        begin
          PrevCursor    := Screen.Cursor;
          Screen.Cursor := crHourGlass;
          APointer      := GetBookmark;
          DisableControls;
          try
            First;
            while not Eof do
              begin
                if IsSMFilaSeleccionada(tslCheckeados, Consulta, CampoFila) then
                  begin
                    if bSoloUnaEtiqueta then
                      iCantEtiquetas := 1
                    else
                      begin
                        iCantEtiquetas := FieldByName(CampoHojas).AsInteger;
                        if iCantEtiquetas = 0 then
                          iCantEtiquetas := 1;
                      end;

                    if ImprimirSoloSecTrazabilidad or IsUsarSecuenciaTrazabilidad(FieldByName(CampoTipoArch).AsInteger) then
                      DoImprimirEtiquetaSecuenciaTrazabilidad(FieldByName(CampoSecTrazabil).AsInteger, iCantEtiquetas, ImprimirSoloSecTrazabilidad, InfoAdicional1, InfoAdicional2)
                    else
                      DoImprimirEtiquetaDocCarpetaClave(FieldByName(CampoCodigoDoc).AsString, FieldByName(CampoClave).AsString, iCantEtiquetas);
                  end;

                Next;
              end;
          finally
            GotoBookmark(APointer);
            EnableControls;
            Screen.Cursor := PrevCursor;
          end;
        end;
    end;
end;

function GetPrimeraSecTrazabilidad(TipoArchivo: TTableId; CodDocumento, SubClave1: String; SubClave2: String = ''; SubClave3: String = ''; SubClave4: String = ''): TTableId;
var
  sSql: String;
  iCantCampos: Integer;
begin
  iCantCampos := GetCantCamposBusquedaTipoArchivo(TipoArchivo);

  sSql := 'ART.ARCHIVO.GET_PRIMERASECTRAZABILIDAD(:TipoArchivo, :Clave, :CodDocumento)';
  Result := NVL(ObtenerValorEx(sSql, [TipoArchivo, GetClaveArmada(iCantCampos, SubClave1, SubClave2, SubClave3, SubClave4), CodDocumento]), ART_EMPTY_ID);
end;

function GetIdSecTrazabilidad: TTableId; overload;
begin
  Result := GetSecNextVal('ARCHIVO.SEQ_RDA_SECTRAZABILIDAD');
end;

function GetIdSecTrazabilidad(TipoArchivo: TTableId; ValidarUsarSec: Boolean = True): TTableId; overload;
var
  SecTrazabil: TTableId;
begin
  if not ValidarUsarSec or IsUsarSecuenciaTrazabilidad(TipoArchivo) then
    SecTrazabil := GetIdSecTrazabilidad()
  else
    SecTrazabil := ART_EMPTY_ID;

  Result := SecTrazabil;
end;

function Is_ArchivoPatch(CodTipoArchivo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT ART.ARCHIVO.IS_ARCHIVOPATCH(TA_ID) ' +
            'FROM RTA_TIPOARCHIVO ' +
           'WHERE TA_CODIGO = :CodArch';

  Result := (ValorSqlEx(sSql, [CodTipoArchivo]) = 'S');
end;

function Get_MaximaSecTrazabil: Integer;
var
  sSql: String;
begin
  sSql := 'SELECT MAX(DA_SECUENCIATRAZABIL) ' +
            'FROM RDA_DETALLEARCHIVO';

  Result := ValorSqlInteger(sSql);
end;

function Is_SecTrazabilValida(SecTrazabilidad: Integer; ValidarDocMesaEntrada: Boolean = False): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM CDR_DOCUMENTACIONRECIBIDA ' +
           'WHERE DR_SECUENCIATRAZABIL = :IdSecTraz';

  // tal vez hay que validar según parametro extra que la secuencia exista en la tabla CDR_DOCUMENTACIONRECIBIDA si agrego ahí la sec. de traz.
  Result := (SecTrazabilidad >= MINSECUENCIATRAZABIL) and (SecTrazabilidad <= Get_MaximaSecTrazabil()) and
            not Is_ExisteSecTrazabil(SecTrazabilidad, False) and (not ValidarDocMesaEntrada or ExisteSqlEx(sSql, [SecTrazabilidad]));
end;

function Is_TipoArchivoImprimeEtiquetasSinSecTrazabil(TipoArchivo: TTableId): Boolean;
begin
  Result := (TipoArchivo in [ID_CARPETA_HYS, ID_CARPETA_CONSTRUCC,
                             ID_CARPETA_PREVENCION, ID_CARPETA_ML_GRAL,
                             ID_CARPETA_ML_RX, ID_CARPETA_ML_NOTIFICAC]);
end;

function IsUsarSecuenciaTrazabilidad(TipoArchivo: TTableId): Boolean;
var
  sSql: String;
begin
(*
SELECT TB_ESPECIAL1
FROM ART.CTB_TABLAS
WHERE TB_CLAVE = 'SECTZ'
  AND TB_CODIGO = 'SECTZ'

UPDATE ART.ctb_tablas
SET TB_ESPECIAL1 = 'S'
WHERE TB_CLAVE = 'SECTZ'
  AND TB_CODIGO = 'SECTZ'
/
COMMIT
/

SELECT *
FROM ARCHIVO.RTA_TIPOARCHIVO
WHERE TA_USAR_SECTRAZABILIDAD = 'S'
ORDER BY 2

UPDATE ARCHIVO.RTA_TIPOARCHIVO
SET TA_USAR_SECTRAZABILIDAD = 'S'
WHERE TA_ID = 20
/
COMMIT
/
*)

  sSql := 'ART.ARCHIVO.IS_ISUSARSECUENCIATRAZABILIDAD(:TipoArchivo)';

  Result := (ObtenerValorEx(sSql, [TipoArchivo]) = 'S');
end;

(* -------------------------------------------------------------------------- *)

function IsAdministradorDocumentacionMEntradas: Boolean;
begin
  Result := (AreIn(Sesion.Sector, [SECTOR_MENTRADAS, 'COMPUTOS']));
end;

(* -------------------------------------------------------------------------- *)

end.

