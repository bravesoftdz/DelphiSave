unit unTesoreria;

interface

uses
  unArt;

const
  cctRecibos             : Integer = 6000;      // clave de la tabla cct_Contadores para los nros. de recibo
  cctRecibosBolDeposito  : Integer = 6001;      // clave de la tabla cct_Contadores para los nros. de recibo de las boletas de depósito
  CodBanco_Patagonia     : String  = '034';     // código del BANCO PATAGONIA S.A. en zba_Banco
  CodBanco_PciaBsAs      : String  = '014';     // código del BANCO DE LA PROVINCIA DE BUENOS AIRES en zba_Banco
  CodBanco_NacionArg     : String  = '011';     // código del BANCO DE LA NACION ARGENTINA en zba_Banco
  CodBanco_SantanderRio  : String  = '072';     // código del BANCO SANTANDER RIO S.A. en zba_Banco

  MP_PAGOELECTRONICO     : String = 'Pago Electronico';
  MP_CHEQUE              : String = 'Cheque';
  MP_DEBITOAUTOMATICO    : String = 'Debito Automatico';
  MP_TRANSFERENCIA       : String = 'Transferencia';

  DIR_LIQIMPUESTO: String = 'Impuestos\Liquid';

  procedure DoEjecutarInterfaceAsientos(Tipo: String; Fecha: TDateTime; IdTipoInstrumento: TTableId = ART_EMPTY_ID; ConTrans: Boolean = False);
  procedure DoInsertarSobreLiquidacionILTP(IdCheque: TTableId);
  procedure DoInsertarSobreLiquidacionOtrosConceptos(IdCheque: TTableId);
  procedure DoProcesarGirosYTransferencias(IdCheque, IdTransferencia: TTableId; CodSituacionGT: String);
  function Is_BancoProvincia(IdBanco: TTableId): Boolean;
  function Is_BancoNacion(IdBanco: TTableId): Boolean;
  function Is_BancoPatagonia(IdBanco: TTableId): Boolean;
  function Is_ExisteNroOperGT(NroOperacion: String): Boolean;
  function Get_NombreBancoCompleto(Banco: String): String;
  procedure DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco: String; NroTransferencia: Integer; Tipo: String);
  function Get_ClaveCarpetaTransferenciaBancaria(CodBanco: String; NroTransferencia: Integer; var Abreviatura: String): String;
  function Get_CodBarrasCarpetaTransferenciaBancaria(CodBanco: String; NroTransferencia: Integer): String;
  procedure Do_ImprimirArchivoLiquidacionImpuesto(NombreArchivo: String);
  procedure Do_ImprimirArchivoServidorTesoreria(NombreArchivoOrig, NombreArchivoDest: String; UsarVisor: Boolean = False);
  function Get_NombreArchivoServidorTesoreria(IdArchivo: TTableId; Dir, Extension: String): String;
  function Get_NombreArchivoLiquidacionImpuesto(IdArchivo: TTableId; Extension: String): String;
  function Get_PathServidorArchTesoreria: String;
  function Is_ExisteArchivoLiquidacionImpuesto(IdLiqImpuesto: TTableId; var NombreArchivo: String): Boolean;
  function Is_ExisteOrdenPago(OrdenPago: Integer): Boolean;
  function Get_SecuenciaTrazOP(OrdenPago: Integer): TTableId;
  function Get_PeriodoContableActivoImpuestos: String;

implementation

uses
  unPrincipal, unDmFinancials, DateTimeFuncs, unSesion, unEsperaSimple, SqlFuncs, DBSql,
  AnsiSql, unDmPrincipal, General, StrFuncs, SysUtils, unUtilsArchivo,
  CustomDlgs, unConstantArchivo, unArchivo, Windows, ArchFuncs, Forms, ShellAPI,
  DateUtils, unArchivoVisor;

procedure DoEjecutarInterfaceAsientos(Tipo: String; Fecha: TDateTime; IdTipoInstrumento: TTableId = ART_EMPTY_ID; ConTrans: Boolean = False);
var
  sSql: String;
begin
  IniciarEspera;
  try
    with dmFinancials do
    begin
      Conectar;
      try
        sSql := 'ART_TESORERIA.DO_INTERFACEASIENTOS(:sTipo, :fFecha, :sUsuario, :IdTipoInstrumento);';

        if ConTrans then
          dmFinancials.EjecutarStoreSTEx(sSql, [Tipo, TDateTimeEx.Create(Fecha), Sesion.UserId, IdTipoInstrumento])
        else
          dmFinancials.EjecutarStoreEx(sSql, [Tipo, TDateTimeEx.Create(Fecha), Sesion.UserId, IdTipoInstrumento]);
      finally
        Desconectar;
      end;
    end;
  finally
    DetenerEspera;
  end;
end;

procedure DoInsertarSobreLiquidacionILTP(IdCheque: TTableId);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM SLE_LIQUIEMPSIN ' +
           'WHERE LE_IDCHEQUEEMITIDO = :IdCheque';
  if ExisteSqlEx(sSql, [IdCheque]) then
    begin
      sSql := 'INSERT INTO RSO_SOBRE(SO_ID, SO_IDCHEQUEEMITIDO, SO_CALLE, SO_NUMERO, SO_PISO, ' +
                                    'SO_DEPARTAMENTO, SO_LOCALIDAD, SO_CPOSTAL, SO_PROVINCIA, ' +
                                    'SO_FECHAALTA, SO_USUALTA, SO_IDTRABAJADOR) ' +
                   'SELECT SEQ_RSO_ID.NEXTVAL, LE_IDCHEQUEEMITIDO, TJ_CALLE, TJ_NUMERO, TJ_PISO, ' +
                          'TJ_DEPARTAMENTO, TJ_LOCALIDAD, TJ_CPOSTAL, TJ_PROVINCIA , ' +
                          'SYSDATE, :User, TJ_ID ' +
                     'FROM ( ' +
                       'SELECT DISTINCT LE_IDCHEQUEEMITIDO, TJ_CALLE, TJ_NUMERO, TJ_PISO, ' +
                              'TJ_DEPARTAMENTO, TJ_LOCALIDAD, TJ_CPOSTAL, TJ_PROVINCIA , TJ_ID ' +
                         'FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES, SLE_LIQUIEMPSIN ' +
                        'WHERE LE_SINIESTRO = EX_SINIESTRO ' +
                          'AND LE_ORDEN = EX_ORDEN ' +
                          'AND LE_RECAIDA = EX_RECAIDA ' +
                          'AND LE_IDCHEQUEEMITIDO = :IdCheque ' +
                          'AND EX_CUIL = TJ_CUIL)';
      EjecutarSqlSTEx(sSql, [Sesion.UserId, IdCheque]);
    end;
end;

procedure DoInsertarSobreLiquidacionOtrosConceptos(IdCheque: TTableId);
// lo hice por las dudas, no se está usando...
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM SPR_PAGOEXPESIN ' +
           'WHERE PR_IDCHEQUEEMITIDO = :IdCheque';
  if ExisteSqlEx(sSql, [IdCheque]) then
    begin
      sSql := 'INSERT INTO RSO_SOBRE(SO_ID, SO_IDCHEQUEEMITIDO, SO_CALLE, SO_NUMERO, SO_PISO, ' +
                                    'SO_DEPARTAMENTO, SO_LOCALIDAD, SO_CPOSTAL, SO_PROVINCIA, ' +
                                    'SO_FECHAALTA, SO_USUALTA, SO_IDTRABAJADOR) ' +
                   'SELECT SEQ_RSO_ID.NEXTVAL, PR_IDCHEQUEEMITIDO, TJ_CALLE, TJ_NUMERO, TJ_PISO, ' +
                          'TJ_DEPARTAMENTO, TJ_LOCALIDAD, TJ_CPOSTAL, TJ_PROVINCIA , ' +
                          'SYSDATE, :User, TJ_ID ' +
                     'FROM ( ' +
                       'SELECT DISTINCT PR_IDCHEQUEEMITIDO, TJ_CALLE, TJ_NUMERO, TJ_PISO, ' +
                              'TJ_DEPARTAMENTO, TJ_LOCALIDAD, TJ_CPOSTAL, TJ_PROVINCIA , TJ_ID ' +
                         'FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES, SPR_PAGOEXPESIN ' +
                        'WHERE PR_SINIESTRO = EX_SINIESTRO ' +
                          'AND PR_ORDEN = EX_ORDEN ' +
                          'AND PR_RECAIDA = EX_RECAIDA ' +
                          'AND PR_IDCHEQUEEMITIDO = :IdCheque ' +
                          'AND EX_CUIL = TJ_CUIL)';
      EjecutarSqlSTEx(sSql, [Sesion.UserId, IdCheque]);
    end;
end;

procedure DoProcesarGirosYTransferencias(IdCheque, IdTransferencia: TTableId; CodSituacionGT: String);
var
  Sql: TSql;
begin
   Sql := TDBSql.Create('RCE_CHEQUEEMITIDO');
   try
     Sql.SqlType := stUpdate;

     Sql.PrimaryKey.Add('CE_ID',            IdCheque);
     Sql.Fields.Add('CE_SITUACION',         CodSituacionGT);
     Sql.Fields.Add('CE_FECHASITUACION',    exDate);
     Sql.Fields.Add('CE_USUSITUACION',      Sesion.UserId);
     if IdTransferencia <> ART_EMPTY_ID then
       Sql.Fields.Add('CE_IDTRANSFERENCIA', IdTransferencia);

     EjecutarSqlST(Sql.Sql);

     DoInsertarSobreLiquidacionILTP(IdCheque);
   finally
     Sql.Free;
   end;
end;

function Is_BancoProvincia(IdBanco: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT TESORERIA.IS_BANCOPROVINCIA(:Id) FROM DUAL';

  Result := (ValorSqlEx(sSql, [IdBanco]) = 'S');
end;

function Is_BancoNacion(IdBanco: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT TESORERIA.IS_BANCONACION(:Id) FROM DUAL';

  Result := (ValorSqlEx(sSql, [IdBanco]) = 'S');
end;

function Is_BancoPatagonia(IdBanco: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT TESORERIA.IS_BANCOPATAGONIA(:Id) FROM DUAL';

  Result := (ValorSqlEx(sSql, [IdBanco]) = 'S');
end;

function Is_ExisteNroOperGT(NroOperacion: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RCE_CHEQUEEMITIDO' + GetDBLink() + ' ' +
           'WHERE CE_GIRO = :Id';

  Result := ExisteSqlEx(sSql, [NroOperacion]);
end;

function Get_NombreBancoCompleto(Banco: String): String;
begin
  Result := Iif(InStr(UpperCase(Banco), 'BANCO ') > 0, '', 'Banco ') + Banco;
end;

function Get_ClaveCarpetaTransferenciaBancaria(CodBanco: String; NroTransferencia: Integer; var Abreviatura: String): String;
var
  sClave, sSql: String;
begin
  sClave := '';

  sSql := 'SELECT BA_ABREVIATURA ' +
            'FROM ZBA_BANCO ' +
           'WHERE BA_CODIGO = :Cod';
  Abreviatura := Trim(ValorSqlEx(sSql, [CodBanco]));

  if not IsEmptyString(Abreviatura) and (NroTransferencia > 0) then
    sClave := Abreviatura + Trim(IntToStr(NroTransferencia));

  Result := sClave;
end;                     

procedure DoAltaDocumentoCarpetaTransferenciaBancaria(CodBanco: String; NroTransferencia: Integer; Tipo: String);
var
  sAbreviatura, sClave: String;
  IdTipoDocumento: TTableId;
begin
  sClave := Get_ClaveCarpetaTransferenciaBancaria(CodBanco, NroTransferencia, sAbreviatura);
  Verificar(IsEmptyString(sClave), nil, 'No se puede insertar el documento en el AGA pues no existe un código de abreviatura del banco.');

  IdTipoDocumento := Get_IdTipoDocumentoTransfBancaria(sAbreviatura, Tipo);
  Verificar(IdTipoDocumento = ART_EMPTY_ID, nil, 'No se ha podido determinar el código de documento a insertar.');

  DoAltaDocumentoCarpeta(ID_CARPETA_TRBANC, IdTipoDocumento, sClave, True, True);
end;

function Get_CodBarrasCarpetaTransferenciaBancaria(CodBanco: String; NroTransferencia: Integer): String;
var
  sClave, sAbreviatura: String;
begin
  sClave := Get_ClaveCarpetaTransferenciaBancaria(CodBanco, NroTransferencia, sAbreviatura);

  Result := GetCodBarrasClave('', sClave);
end;

procedure Do_ImprimirArchivoLiquidacionImpuesto(NombreArchivo: String);
begin
  Do_ImprimirArchivoServidorTesoreria(NombreArchivo, 'LiqImpuesto', False);
end;

procedure Do_ImprimirArchivoServidorTesoreria(NombreArchivoOrig, NombreArchivoDest: String; UsarVisor: Boolean = False);
var
  sFileExtension, sNombreArchivoDest: String;
begin
  sFileExtension     := LowerCase(ExtractFileExt(NombreArchivoOrig));
  sNombreArchivoDest := TempPath + NombreArchivoDest + sFileExtension;

  if CopyFileExt(NombreArchivoOrig, sNombreArchivoDest, False) then
    begin
      if UsarVisor then
        AbrirArchivoVisor(sNombreArchivoDest, False)
      else
        ShellExecute(Application.Handle, nil, PChar(sNombreArchivoDest), '', '', SW_SHOWNORMAL);
    end
  else
    MsgBox('No se ha podido copiar el archivo en su disco local.', MB_OK + MB_ICONINFORMATION);
end;

function Get_NombreArchivoServidorTesoreria(IdArchivo: TTableId; Dir, Extension: String): String;
var
  dHoy: TDateTime;
  sNombreArchivo: String;
begin
  dHoy := DBDate;

  sNombreArchivo := IncludeTrailingPathDelimiter(Get_PathServidorArchTesoreria) + Dir + '\' +
                    IntToStr(YearOf(dHoy)) + '\' + LPad(IntToStr(MonthOf(dHoy)), '0', 2) + '\' +
                    LPad(IntToStr(DayOf(dHoy)), '0', 2) + '\' + LPad(IdArchivo, '0', 8) + Iif(IsEmptyString(Extension), '', '.' + Extension);

  ForceDirectories(ExtractFilePath(sNombreArchivo));

  Result := sNombreArchivo;
end;

function Get_NombreArchivoLiquidacionImpuesto(IdArchivo: TTableId; Extension: String): String;
begin
  Result := Get_NombreArchivoServidorTesoreria(IdArchivo, DIR_LIQIMPUESTO, Extension);
end;

function Get_PathServidorArchTesoreria: String;
var
  sPath: String;
begin
  if Is_ConectadoProduccion then
    sPath := Get_CTBEspecial1('PATHS', '012')
  else
    sPath := TempPath;

  Result := sPath;
end;

function Is_ExisteArchivoLiquidacionImpuesto(IdLiqImpuesto: TTableId; var NombreArchivo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT IL_NOMBREARCHIVO ' +
            'FROM CONT.OIL_IMPLIQUIDACION ' +
           'WHERE IL_ID = :IdLiq';
  NombreArchivo := ValorSqlEx(sSql, [IdLiqImpuesto]);

  Result := not IsEmptyString(NombreArchivo);
end;

function Is_ExisteOrdenPago(OrdenPago: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RCE_CHEQUEEMITIDO ' +
           'WHERE CE_ORDENPAGO = :OP';

  Result := ExisteSqlEx(sSql, [OrdenPago]);
end;

function Get_SecuenciaTrazOP(OrdenPago: Integer): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT CE_SECUENCIATRAZABIL ' +
            'FROM RCE_CHEQUEEMITIDO ' +
           'WHERE CE_ORDENPAGO = :OP';

  Result := ValorSqlIntegerEx(sSql, [OrdenPago], ART_EMPTY_ID);

  if Result = ART_EMPTY_ID then
    Result := GetIdSecTrazabilidad(ID_CARPETA_TESORERIA);
end;

function Get_PeriodoContableActivoImpuestos: String;
var
  sSql: String;
begin
  sSql := 'SELECT MAX(IP_PERIODO) ' +
            'FROM CONT.OIP_IMPPERIODO ' +
           'WHERE IP_FECHABAJA IS NULL ' +
             'AND IP_ESTADO = ''A''';

  Result := ValorSql(sSql);
end;

end.

