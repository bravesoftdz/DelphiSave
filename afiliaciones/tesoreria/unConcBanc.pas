unit unConcBanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Db, SDEngine, Filectrl, unExportPDF;

type
  TTipoBase = (tbPart, tbFinancials);
  TNroPeriodoFolio = record
    PeriodoUpd       : Cardinal;
    NumeroFolio      : Cardinal;
    NumeroFolioInicio: Cardinal;
    NombrePeriodo    : String;
    Fedis            : TDateTime
  end;

  function GetNroFolio(nNroListado: Cardinal; TipoBase: TTipoBase): TNroPeriodoFolio;
  function SetNombrePDF(sNombrePDF: String; sPeriodoPDF: String): Boolean;
  function GetPrinterPDF: Integer;
  procedure PrepararCLI_LIBROS(iListado: Integer; sPeriodo: String);

implementation

uses
  unDmPrincipal, unDmFinancials, General, StrFuncs, IniFiles, Printers, unRptControl,
  Dialogs, unSesion, ArchFuncs;

function GetNroFolio(nNroListado: Cardinal; TipoBase: TTipoBase): TNroPeriodoFolio;
var
  dFedis  : TDateTime;
  Query   : TSDQuery;
  sULT_PAG: String;
begin
  Result.NombrePeriodo     := '';
  Result.PeriodoUpd        := 0;
  Result.NumeroFolioInicio := 0;
  Result.NumeroFolio       := 0;
  Result.Fedis             := 0;

  Query := TSDQuery.Create(nil);
  try
    if TipoBase = tbPart then
      Query.DatabaseName := dmPrincipal.sdbPrincipal.DatabaseName
    else
      Query.DatabaseName := dmFinancials.sdbPrincipal.DatabaseName;

    Query.SQL.Text :=
    	'SELECT LI_PERIODO,LI_ULTPAGINA' +
       ' FROM CLI_LIBROS' +
      ' WHERE LI_CODIGO = :p1' +
      	' AND LI_ACTUAL = ''S''';
    OpenQueryEx(Query, [nNroListado]);
    if not Query.IsEmpty then
    begin
      dFedis := strtodate('01/' + StrRight(Query.FieldByName('LI_PERIODO').Value, 2) + '/' + StrLeft(Query.FieldByName('LI_PERIODO').Value, 4));
      Result.Fedis         := dFedis;
      Result.NombrePeriodo := DateFormat(dFedis,'MMMM yyyy');

      if Query.FieldByName('LI_ULTPAGINA').Value = 0 then
        Result.PeriodoUpd := Query.FieldByName('LI_PERIODO').Value;
    end;
  finally
    Query.Free;
  end;

  if TipoBase = tbPart then
  begin
    sULT_PAG := ValorSqlEx('SELECT NVL(CL.LI_ULTPAGINA, 0) as ULT_PAG' +
                            ' FROM CLI_LIBROS CL' +
                           ' WHERE CL.LI_CODIGO = :p1' +
                         	 	 ' AND CL.LI_ACTUAL IS NULL' +
                          	 ' AND CL.LI_PERIODO = (SELECT MAX(CLI.LI_PERIODO)' +
                                                 		' FROM CLI_LIBROS CLI' +
                                                 	 ' WHERE CLI.LI_CODIGO = :p2' +
                                                 		 ' AND CLI.LI_ACTUAL IS NULL' +
                                                 		 ' AND CLI.LI_PERIODO <= (SELECT C.LI_PERIODO' +
                                                                           		' FROM CLI_LIBROS C' +
                                                                           	 ' WHERE C.LI_CODIGO = :p3' +
                                                                           		 ' AND C.LI_ACTUAL IS NOT NULL))',
                           [nNroListado, nNroListado, nNroListado]);
  end
  else
  begin
    sULT_PAG := dmFinancials.ValorSqlEx('SELECT NVL(CL.LI_ULTPAGINA, 0) as ULT_PAG' +
                                         ' FROM CLI_LIBROS CL' +
                                        ' WHERE CL.LI_CODIGO = :p1' +
                                       		' AND CL.LI_ACTUAL IS NULL' +
                                       		' AND CL.LI_PERIODO = (SELECT MAX(CLI.LI_PERIODO)' +
                                                                 ' FROM CLI_LIBROS CLI' +
                                                                ' WHERE CLI.LI_CODIGO = :p2' +
                                                                	' AND CLI.LI_ACTUAL IS NULL' +
                                                                	' AND CLI.LI_PERIODO <= (SELECT C.LI_PERIODO' +
                                                                                           ' FROM CLI_LIBROS C' +
                                                                                          ' WHERE C.LI_CODIGO = :p3' +
                                                                                          	' AND C.LI_ACTUAL IS NOT NULL))',
                                        [nNroListado, nNroListado, nNroListado]);
  end;

  if sULT_PAG <> '' then
  begin
    Result.NumeroFolioInicio := StrToInt(sULT_PAG);
    Result.NumeroFolio       := StrToInt(sULT_PAG);
  end
  else
  begin
    Result.NumeroFolioInicio := 0;
    Result.NumeroFolio       := 0;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------
   Setea el Nombre del archivo .PDF para ser creado desde la impresion del Acrobat, porque
   una vez impreso, dicho drive se encarga de borrarlo de PDFWritr.INI
}
function SetNombrePDF(sNombrePDF: String; sPeriodoPDF: String): Boolean;
var
  fIniFile: TIniFile;
  iIndex: Integer;  
  sPathDoc: String;
begin
  fIniFile := nil;
  sPathDoc := GetMyDocuments + 'Libros\'+ sNombrePDF + '\';

  if not DirectoryExists(sPathDoc) then
    if not ForceDirectories(sPathDoc) then
      MessageDlg('No se pudo crear el directorio ' + sPathDoc, mtError, [mbOK], 0);

  try
    fIniFile := TIniFile.Create(IncludeTrailingPathDelimiter(TempPath) + 'ImpresoraPDF.ini');
    fIniFile.WriteString('Impresora PDF', 'PDFFileName', sPathDoc + 'Control ' + sPeriodoPDF + '.PDF');
    iIndex := GetPrinterPDF;
    if iIndex = -1 then
    begin
      MsgBox('No se encontro la Impresora PDF.');
      Abort;
    end;

    rptControl := TrptControl.Create(nil);

    if sNombrePDF = 'DenunciaSiniestro' then
      rptControl.qrlTitulo.Caption := 'Título: REGISTRO DE DENUNCIAS DE SINIESTROS'
    else if sNombrePDF = 'LibroDiario' then
      rptControl.qrlTitulo.Caption := 'Título: DIARIO'
    else if sNombrePDF = 'SubDiarioEmision' then
      rptControl.qrlTitulo.Caption := 'Título: SUBDIARIO DE EMISION'
    else if sNombrePDF = 'SubDiarioSiniestro' then
      rptControl.qrlTitulo.Caption := 'Título: SUBDIARIO SINIESTRO'
    else if sNombrePDF = 'SiniestrosRecReAseg' then
      rptControl.qrlTitulo.Caption := 'Título: REGISTRO DE SINIESTROS, RECUPEROS Y REASEGUROS'
    else if sNombrePDF = 'SubDiarioAmortizacion' then
      rptControl.qrlTitulo.Caption := 'Título: SUBDIARIO DE AMORTIZACION DE DEUDORES POR PREMIOS'
    else if sNombrePDF = 'SubDiarioCobranza' then
      rptControl.qrlTitulo.Caption := 'Título: SUBDIARIO DE COBRANZAS'
    else if sNombrePDF = 'SubDiarioRecupero' then
      rptControl.qrlTitulo.Caption := 'Título: SUBDIARIO DE RECUPERO DE DEUDORES POR PREMIOS'
    else if sNombrePDF = 'LibroAfiliaciones' then
      rptControl.qrlTitulo.Caption := 'Título: REGISTRO DE AFILIACIONES'
    else if sNombrePDF = 'DenunciaSiniestroFFEP' then
      rptControl.qrlTitulo.Caption := 'Título: REGISTRO DE DENUNCIAS DE SINIESTROS - FFEP'
    else if sNombrePDF = 'CobranzasFFEP' then
      rptControl.qrlTitulo.Caption := 'Título: REGISTRO DE COBRANZAS - FFEP'
    else if sNombrePDF = 'SiniestrosPagadosFFEP' then
      rptControl.qrlTitulo.Caption := 'Título: REGISTRO DE SINIESTROS PAGADOS - FFEP'
    else if sNombrePDF = 'SubDiarioIVACompras' then
      rptControl.qrlTitulo.Caption := 'Título: SUBDIARIO IVA COMPRAS';

    rptControl.qrlPeriodo.Caption := 'Periodo: ' + sPeriodoPDF;
    rptControl.qrlArchivo.Caption := 'Archivo: ' + sNombrePDF + ' ' + sPeriodoPDF;
    rptControl.PrinterSettings.PrinterIndex := iIndex;
    rptControl.Print;
  finally
    fIniFile.Free;
  end;

  try
    fIniFile := TIniFile.Create(IncludeTrailingPathDelimiter(TempPath) + 'ImpresoraPDF.ini');
    fIniFile.WriteString('Impresora PDF', 'PDFFileName', sPathDoc + sNombrePDF + ' ' + sPeriodoPDF + '.PDF');
  finally
    fIniFile.Free;
  end;
  Result := True;
end;

procedure PrepararCLI_LIBROS(iListado: Integer; sPeriodo: String);
begin
  EjecutarSQLEx('UPDATE CLI_LIBROS' +
                  ' SET LI_ACTUAL = NULL' +
                ' WHERE LI_CODIGO = :Nro' +
                  ' AND LI_ACTUAL = :Valor', [iListado, 'S']);

  if not ExisteSQLEx('SELECT 1 FROM CLI_LIBROS WHERE LI_CODIGO = :Nro AND LI_PERIODO = :Periodo', [iListado, sPeriodo]) then
    EjecutarSQLEx('INSERT INTO CLI_LIBROS (LI_CODIGO, LI_PERIODO, LI_ULTPAGINA, LI_ACTUAL, LI_USUALTA, LI_FECHAALTA)' +
                  							 ' VALUES (:Nro, :Periodo, :UltimaPagina, :Actual, :Usuario, SYSDATE)',
    							[iListado, sPeriodo, 0, 'S', Sesion.UserID])
  else
    EjecutarSQLEx('UPDATE CLI_LIBROS' +
                    ' SET LI_ACTUAL = :Actual' +
                  ' WHERE LI_CODIGO = :Nro' +
                    ' AND LI_PERIODO = :Periodo', ['S', iListado, sPeriodo]);
end;

function GetPrinterPDF: Integer;
begin
  Result := unExportPDF.GetPrinterPDF();
end;

end.
