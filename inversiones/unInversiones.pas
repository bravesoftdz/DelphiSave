unit unInversiones;

interface

uses
  unArt;

function Get_IdDefaultCuentaBancaria: TTableId;
function Get_IdDefaultPlazoLiquidacion(IdInstrumento: TTableId): TTableId;
function Is_ExisteCodCajaValores(IdInstrumento: TTableId; CodCajaValores: String; Version: Integer): Boolean;
function Get_PathServidorArchInversiones: String;
procedure Do_ImprimirArchivoServidorInversiones(NombreArchivoOrig, NombreArchivoDest: String; UsarVisorPDF: Boolean = False);
function Get_NombreArchivoServidorInversiones(IdArchivo: TTableId; dir: String): String;
function Is_ExisteArchivoInstrumentoAnalisis(IdInstrumento: TTableId; var NombreArchivo: String): Boolean;
function Get_NombreArchivoEnvioInstrumentoAnalisis(IdArchivo: TTableId): String;
procedure Do_ImprimirArchivoInstrumentoAnalisis(NombreArchivo: String);
procedure Do_ConfirmarOperacion(Id: TTableId; Tipo: String);
function Get_CotizacionInstrumento(IdInstrumento: TTableId; Fecha: TDateTime): Double;

const
  DIR_INSTRANALISIS: String = 'Inversiones\InstrAnalisis';

implementation

uses
  unDmPrincipal, StrFuncs, SysUtils, ArchFuncs, unVisorPDF, ShellAPI, Forms, Windows,
  CustomDlgs, DateUtils, unTesoreria, unSesion, DateTimeFuncs;

function Get_IdDefaultCuentaBancaria: TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT CB_ID ' +
            'FROM ZBA_BANCO, ZCB_CUENTABANCARIA ' +
           'WHERE BA_ID = CB_IDBANCO ' +
             'AND CB_INVERSIONES = ''D'' ' +
             'AND CB_FECHABAJA IS NULL';

  Result := ValorSqlInteger(sSql);
end;

function Get_IdDefaultPlazoLiquidacion(IdInstrumento: TTableId): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT IN_PLAZOLIQUIDACION ' +
            'FROM NIN_INSTRUMENTO ' +
           'WHERE IN_ID = :IdInstrumento';

  Result := ValorSqlIntegerEx(sSql, [IdInstrumento]);
end;

function Is_ExisteCodCajaValores(IdInstrumento: TTableId; CodCajaValores: String; Version: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM NIN_INSTRUMENTO ' +
           'WHERE IN_FECHABAJA IS NULL ' +
             'AND IN_CODCAJAVALORES = :CodCajaVal ' +
             'AND IN_VERSION = :Version ' +
             'AND IN_ID <> :Id';

  Result := ExisteSqlEx(sSql, [CodCajaValores, Version, IdInstrumento]);
end;

function Get_PathServidorArchInversiones: String;
var
  sPath: String;
begin
  if Is_ConectadoProduccion then
    sPath := Get_CTBEspecial1('PATHS', '013')
  else
    sPath := TempPath;

  Result := sPath;
end;

procedure Do_ImprimirArchivoServidorInversiones(NombreArchivoOrig, NombreArchivoDest: String; UsarVisorPDF: Boolean = False);
var
  sId, sNombreArchivoDest: String;
begin
  sId := StrMid(NombreArchivoOrig, length(NombreArchivoOrig)-11, 8);
  sNombreArchivoDest := TempPath + NombreArchivoDest + '_' + sId + '.pdf';

  if CopyFileExt(NombreArchivoOrig, sNombreArchivoDest, False) then
    begin
      if UsarVisorPDF then
        AbrirPDF(sNombreArchivoDest)
      else
        ShellExecute(Application.Handle, nil, PChar(sNombreArchivoDest), '', '', SW_SHOWNORMAL);
    end
  else
    MsgBox('No se ha podido copiar el archivo en su disco local.', MB_OK + MB_ICONINFORMATION);
end;

function Get_NombreArchivoServidorInversiones(IdArchivo: TTableId; dir: String): String;
var
  dHoy: TDateTime;
  sNombreArchivo: String;
begin
  dHoy := DBDate;

  sNombreArchivo := IncludeTrailingPathDelimiter(Get_PathServidorArchTesoreria) + Dir + '\' +
                    IntToStr(YearOf(dHoy)) + '\' + LPad(IntToStr(MonthOf(dHoy)), '0', 2) + '\' +
                    LPad(IntToStr(DayOf(dHoy)), '0', 2) + '\' + LPad( IdArchivo, '0', 8 ) + '.pdf';

  ForceDirectories(ExtractFilePath(sNombreArchivo));

  Result := sNombreArchivo;
end;

function Is_ExisteArchivoInstrumentoAnalisis(IdInstrumento: TTableId; var NombreArchivo: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT IA_NOMBREARCHIVO ' +
            'FROM NIA_INSTRUMENTOENANALISIS ' +
           'WHERE IA_ID = :IdPlan';
  NombreArchivo := ValorSqlEx(sSql, [IdInstrumento]);

  Result := (Trim(NombreArchivo) <> '');
end;

function Get_NombreArchivoEnvioInstrumentoAnalisis(IdArchivo: TTableId): String;
begin
  Result := Get_NombreArchivoServidorInversiones(IdArchivo, DIR_INSTRANALISIS);
end;

procedure Do_ImprimirArchivoInstrumentoAnalisis(NombreArchivo: String);
begin
  Do_ImprimirArchivoServidorInversiones(NombreArchivo, 'InstrAnalisis', True);
end;

procedure Do_ConfirmarOperacion(Id: TTableId; Tipo: String);
var
  sSql: String;
  bEsPlazoFijo, bEsOperacion: Boolean;
begin
  bEsOperacion := (Tipo = 'O');
  bEsPlazoFijo := (Tipo = 'P');

  if bEsOperacion or bEsPlazoFijo then    // Operaciones - Plazos Fijoas
    sSql := 'UPDATE NOI_OPERACIONINSTRUMENTO ' +
               'SET OI_CONTABILIZADO = ''N'', ' +
                   'OI_FECHAMODIF = SYSDATE, ' +
                   'OI_USUMODIF = :User ' +
             'WHERE OI_ID = :Id'
  else                    // Resultados
    sSql := 'UPDATE NCU_CUPON ' +
               'SET CU_CONTABILIZADO = ''N'', ' +
                   'CU_FECHAMODIF = SYSDATE, ' +
                   'CU_USUMODIF = :User ' +
             'WHERE CU_ID = :Id';

  EjecutarSqlSTEx(sSql, [Sesion.UserId, Id]);

  if bEsOperacion or bEsPlazoFijo then
    sSql := 'INVERSION.DO_OPERACIONCOSTO(:IdOperacion, :Usuario);'
  else
    sSql := 'INVERSION.DO_COBROCUPONCOSTO(:IdCupon, :Usuario);';

  EjecutarStoreSTEx(sSql, [Id, Sesion.UserId]);
end;

function Get_CotizacionInstrumento(IdInstrumento: TTableId; Fecha: TDateTime): Double;
var
  sSql: String;
begin
  sSql := 'SELECT ART.INVERSION.GET_COTIZACIONINSTRUMENTO(:IdInstrumento, :Fecha) ' +
            'FROM DUAL';

  Result := ValorSqlExtendedEx(sSql, [IdInstrumento, TDateTimeEx.Create(Fecha)]);
end;

end.

