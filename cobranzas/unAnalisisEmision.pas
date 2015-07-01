unit unAnalisisEmision;

interface

uses     
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit,
  PeriodoPicker, ExtCtrls, OleServer, Variants, unCustomForm, Excel2000,
  DateComboBox, DB, QueryToFile, ExportDialog, SDEngine;

type
  TfrmAnalisisEmision = class(TfrmCustomForm)
    gbDatos: TGroupBox;
    gbDestino: TGroupBox;
    edPeriodo: TPeriodoPicker;
    Label1: TLabel;
    chkEmision: TCheckBox;
    chkExtremos: TCheckBox;
    chkExtremosDesvio: TCheckBox;
    Label2: TLabel;
    edDesvio: TCurrencyEdit;
    btnGenerar: TButton;
    btnSalir: TButton;
    rbPlanilla: TRadioButton;
    rbPlanillaImpresion: TRadioButton;
    edFilename: TFilenameEdit;
    ExcelApplication: TExcelApplication;
    Bevel1: TBevel;
    Label6: TLabel;
    edFDistrDesde: TDateComboBox;
    Label15: TLabel;
    edFDistrHasta: TDateComboBox;
    Label3: TLabel;
    ExportDialog: TExportDialog;
    sdqConsulta: TSDQuery;
    sdqConsultaDE_CUIT: TStringField;
    sdqConsultaDE_CONTRATO: TFloatField;
    sdqConsultaDE_NOMBRE: TStringField;
    sdqConsultaDE_EMPLEADOSACTUAL: TFloatField;
    sdqConsultaDE_MASAACTUAL: TFloatField;
    sdqConsultaDE_EMPLEADOSANTERIOR: TFloatField;
    sdqConsultaDE_MASAANTERIOR: TFloatField;
    sdqConsultaDE_EMISIONNETAACTUAL: TFloatField;
    sdqConsultaDE_EMISIONNETAANTERIOR: TFloatField;
    sdqConsultaDE_DEVENGADOCUOTAACTUAL: TFloatField;
    sdqConsultaDE_DEVENGADOFONDOACTUAL: TFloatField;
    sdqConsultaDE_DEVENGADOCUOTAANTERIOR: TFloatField;
    sdqConsultaDE_DEVENGADOFONDOANTERIOR: TFloatField;
    sdqConsultaDE_PERIODOACTUAL: TStringField;
    sdqConsultaDE_PERIODOANTERIOR: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
  private
    filInic: Integer;
    fMaxRows: Integer;
    LCID_1: LCID;
  public
  end;

var
  frmAnalisisEmision: TfrmAnalisisEmision;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, StrFuncs, DateTimeFuncs, CustomDlgs, Periodo,
  IniFiles, unExcel;

{$R *.DFM}

procedure TfrmAnalisisEmision.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmAnalisisEmision.FormCreate(Sender: TObject);
begin
  inherited;
  edFilename.FileName := 'Emi' + edPeriodo.Text + '.xls';
  LCID_1 := LOCALE_USER_DEFAULT;
end;

procedure TfrmAnalisisEmision.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnalisisEmision.btnGenerarClick(Sender: TObject);
var
  Celda: String;
  Columna: String;
  Fil: Integer;
  Fila: Integer;
  NomArchivo: String;
  Periodo: String;
  Query: TSDQuery;
  sSql: String;
  bTablaDesvio: Boolean;
  WorkBk: _WorkBook;
  WorkSheet: _WorkSheet;

  function Periodos_ContarCantidad(Periodo1, Periodo2: String): Integer;
  var
    Fecha1: TDateTime;
    Fecha2: TDateTime;
  begin
    Fecha1 := StrToDate('01/' + FormatPeriodo(Periodo1));
    Fecha2 := StrToDate('01/' + FormatPeriodo(Periodo2));

    Result := MonthsBetween(Fecha1, Fecha2);
  end;
begin
  bTablaDesvio := chkExtremos.Checked or chkExtremosDesvio.Checked;

  Verificar(chkEmision.Checked and (edPeriodo.Periodo.Valor = ''), edPeriodo, 'Debe ingresar el período.');
  Verificar(not chkEmision.Checked and (edPeriodo.Periodo.Valor <> ''), edPeriodo, 'No debe ingresar el período, no se utiliza.');

  if bTablaDesvio then
    begin
      Verificar(edFDistrDesde.IsEmpty, edFDistrDesde, 'Debe ingresar la fecha de distribución desde.');
      Verificar(edFDistrHasta.IsEmpty, edFDistrHasta, 'Debe ingresar la fecha de distribución hasta.');
    end;

  Verificar(chkExtremosDesvio.Checked and (edDesvio.Value <= 0), edDesvio, 'El importe del desvío debe ser mayor a 0.');
  Verificar(Trim(edFileName.Text) = '', edFileName, 'Debe ingresar el lugar en donde guardar la planilla Excel.');
  Verificar(UCase(StrRight(edFileName.FileName, 4)) <> '.XLS', edFileName, 'El archivo debe tener la extensión de una planilla Excel.');

  Periodo      := edPeriodo.Periodo.Valor;
  // PeriodoBarra := FormatPeriodo(Periodo);
  fMaxRows     := 50;
  filInic      := 7;

  /////////////////////////////////////
  //  INICIA LA EXPORTACION A EXCEL  //
  /////////////////////////////////////

  NomArchivo := Get_PathReportes + 'DEVENGADO.XLS';

  if not FileExists(NomArchivo) then
    raise Exception.Create('No se encontró el template para los devengados en ' + NomArchivo);

  WorkBk := ExclOpen(ExcelApplication, NomArchivo, LCID_1);
  try
    if bTablaDesvio then
    begin                
      {$IFDEF ESSISTEMANUEVOEMI}
      sSql := 'EMI.EMISION.DO_GENERARTABLADESVIO(:FDistrDesde, :edFDistrHasta);';
      EjecutarStoreEx(sSql, [TDateTimeEx.Create(edFDistrDesde.Date), TDateTimeEx.Create(edFDistrHasta.Date)]);
      {$ELSE}
      sSql := 'EMISION.DO_GENERARTABLADESVIO(:Periodo);';
      EjecutarStoreEx(sSql, [Periodo]);
      {$ENDIF}
    end;


    if chkExtremos.Checked then
    begin
      WorkSheet := ExclSetWorkSheet(WorkBk, 4);
      WorkSheet.Name := 'Análisis de Casos Extremos';

    {
       ------------------------------------------------------------------------------------------
        Carga e imprime la información en la hoja "Empresas de mayor diferencia" de la planilla
       ------------------------------------------------------------------------------------------
    }
      //////////////////////////////////
      //  Desvio porcentual positivo  //
      //////////////////////////////////
      sSql :=
        'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL,' +
              ' DE_MASAACTUAL MASAACTUAL, DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR,' +
              ' DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR, DE_PERIODOACTUAL PERIODOACTUAL' +
         ' FROM TDE_DESVIOEMISION' +
     ' ORDER BY ((DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) - (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR)) DESC';

      Query := GetQuery(sSql);
      try
        Fila := 0;
        while not Query.Eof and (Fila < fMaxRows) do
        begin
          Inc(Fila);

          ExclSetCellValue(WorkSheet, 'A' + IntToStr(Fila + 6), Query.FieldByName('em_cuit').AsString);
          ExclSetCellValue(WorkSheet, 'B' + IntToStr(Fila + 6), Query.FieldByName('co_Contrato').AsInteger);
          ExclSetCellValue(WorkSheet, 'C' + IntToStr(Fila + 6), Query.FieldByName('em_Nombre').AsString);
          ExclSetCellValue(WorkSheet, 'D' + IntToStr(Fila + 6), Query.FieldByName('PeriodoActual').AsString);
          ExclSetCellValue(WorkSheet, 'E' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'F' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosActual').AsInteger);
          ExclSetCellValue(WorkSheet, 'G' + IntToStr(Fila + 6), Query.FieldByName('MasaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'H' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'I' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          ExclSetCellValue(WorkSheet, 'J' + IntToStr(Fila + 6), Query.FieldByName('MasaAnterior').AsFloat);

          //Continua con el query
          Query.Next;
        end;

        // ExclSetCellValue('J1', PeriodoBarra);
      finally
        Query.Free;
      end;

      //////////////////////////////////
      //  Desvio porcentual negativo  //
      //////////////////////////////////
      sSql :=
        'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL,' +
              ' DE_MASAACTUAL MASAACTUAL, DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR,' +
              ' DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR, DE_PERIODOACTUAL PERIODOACTUAL' +
         ' FROM TDE_DESVIOEMISION' +
     ' ORDER BY ((DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) -' +
              ' (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR)) / (DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) ASC';

      Query := GetQuery(sSql);
      try
        Fila := 0;
        while not Query.Eof and (Fila < fMaxRows) do
        begin
          Inc(Fila);

          ExclSetCellValue(WorkSheet, 'M' + IntToStr(Fila + 6), Query.FieldByName('em_cuit').AsString);
          ExclSetCellValue(WorkSheet, 'N' + IntToStr(Fila + 6), Query.FieldByName('co_Contrato').AsInteger);
          ExclSetCellValue(WorkSheet, 'O' + IntToStr(Fila + 6), Query.FieldByName('em_Nombre').AsString);
          ExclSetCellValue(WorkSheet, 'P' + IntToStr(Fila + 6), Query.FieldByName('PeriodoActual').AsString);
          ExclSetCellValue(WorkSheet, 'Q' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'R' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosActual').AsInteger);
          ExclSetCellValue(WorkSheet, 'S' + IntToStr(Fila + 6), Query.FieldByName('MasaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'T' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'U' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          ExclSetCellValue(WorkSheet, 'V' + IntToStr(Fila + 6), Query.FieldByName('MasaAnterior').AsFloat);

          //Continua con el query

          Query.Next;
        end;

      finally
        Query.Free;
      end;

      ////////////////////////////////
      //  Desvio absoluto positivo  //
      ////////////////////////////////
      sSql :=
        'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL,' +
              ' DE_MASAACTUAL MASAACTUAL, DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR,' +
              ' DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR, DE_PERIODOACTUAL PERIODOACTUAL' +
         ' FROM TDE_DESVIOEMISION' +
     ' ORDER BY ((DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) -' +
              ' (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR)) / (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR) DESC';

      Query := GetQuery(sSql);
      try
        Fila := 0;
        while not Query.Eof and (Fila < fMaxRows) do
        begin
          Inc(Fila);

          ExclSetCellValue(WorkSheet, 'Y' + IntToStr(Fila + 6), Query.FieldByName('em_cuit').AsString);
          ExclSetCellValue(WorkSheet, 'Z' + IntToStr(Fila + 6), Query.FieldByName('co_Contrato').AsInteger);
          ExclSetCellValue(WorkSheet, 'AA' + IntToStr(Fila + 6), Query.FieldByName('em_Nombre').AsString);
          ExclSetCellValue(WorkSheet, 'AB' + IntToStr(Fila + 6), Query.FieldByName('PeriodoActual').AsString);
          ExclSetCellValue(WorkSheet, 'AC' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'AD' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosActual').AsInteger);
          ExclSetCellValue(WorkSheet, 'AE' + IntToStr(Fila + 6), Query.FieldByName('MasaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'AF' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'AG' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          ExclSetCellValue(WorkSheet, 'AH' + IntToStr(Fila + 6), Query.FieldByName('MasaAnterior').AsFloat);

          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;

      ////////////////////////////////
      //  Desvio absoluto negativo  //
      ////////////////////////////////
      sSql :=
        'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL,' +
              ' DE_MASAACTUAL MASAACTUAL, DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR,' +
              ' DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR, DE_PERIODOACTUAL PERIODOACTUAL' +
         ' FROM TDE_DESVIOEMISION' +
     ' ORDER BY ((DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) - (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR)) ASC';

      Query := GetQuery(sSql);
      try
        Fila := 0;
        while not Query.Eof and (Fila < fMaxRows) do
        begin
          Inc(Fila);

          ExclSetCellValue(WorkSheet, 'AK' + IntToStr(Fila + 6), Query.FieldByName('em_cuit').AsString);
          ExclSetCellValue(WorkSheet, 'AL' + IntToStr(Fila + 6), Query.FieldByName('co_Contrato').AsInteger);
          ExclSetCellValue(WorkSheet, 'AM' + IntToStr(Fila + 6), Query.FieldByName('em_Nombre').AsString);
          ExclSetCellValue(WorkSheet, 'AN' + IntToStr(Fila + 6), Query.FieldByName('PeriodoActual').AsString);
          ExclSetCellValue(WorkSheet, 'AO' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'AP' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosActual').AsInteger);
          ExclSetCellValue(WorkSheet, 'AQ' + IntToStr(Fila + 6), Query.FieldByName('MasaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'AR' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'AS' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          ExclSetCellValue(WorkSheet, 'AT' + IntToStr(Fila + 6), Query.FieldByName('MasaAnterior').AsFloat);

          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;

      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        ExclWorkSheetPrint(WorkSheet, LCID_1);

      WorkSheet := nil;
    end;


    if chkExtremosDesvio.Checked then
    begin
      WorkSheet := ExclSetWorkSheet(WorkBk, 5);
      WorkSheet.Name := 'An. Casos Extremos-Desvío Absol';

    {
       ------------------------------------------------------------------------------------------
        Carga e imprime la información en la hoja "Empresas de desvío absoluto hasta" de la planilla
       ------------------------------------------------------------------------------------------
    }
      ////////////////////
      //  Desvio hasta  //
      ////////////////////
      // ExclSetCellValue('J1', PeriodoBarra);
      ExclSetCellValue(WorkSheet, 'A4', 'Empresas con desvío absoluto desde ' + ToStr(edDesvio.Value) + '$');

      sSql :=
        'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL,' +
              ' DE_MASAACTUAL MASAACTUAL, DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR,' +
              ' DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR, DE_PERIODOACTUAL PERIODOACTUAL' +
         ' FROM TDE_DESVIOEMISION' +
        ' WHERE ABS((DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) -' +
              ' (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR))>= :p1' +
     ' ORDER BY (ABS((DE_DEVENGADOCUOTAACTUAL + DE_DEVENGADOFONDOACTUAL) - (DE_DEVENGADOCUOTAANTERIOR + DE_DEVENGADOFONDOANTERIOR))) ASC';

      Query := GetQueryEx(sSql, [edDesvio.Value]);
      try
        Fila := 0;
        Fil  := FilInic;
        while not Query.Eof do
        begin
          if Fil >= (FilInic + 1) then
          begin
            Celda := IntToStr(Fil) + ':' + IntToStr(Fil);
            //inserto una fila vacía y desplazo el resto hacia abajo
            ExclInsertRow(WorkSheet, Celda);
          end;

          Inc(Fila);

          ExclSetCellValue(WorkSheet, 'A' + IntToStr(Fila + 6), Query.FieldByName('em_cuit').AsString);
          ExclSetCellValue(WorkSheet, 'B' + IntToStr(Fila + 6), Query.FieldByName('co_Contrato').AsInteger);
          ExclSetCellValue(WorkSheet, 'C' + IntToStr(Fila + 6), Query.FieldByName('em_Nombre').AsString);
          ExclSetCellValue(WorkSheet, 'D' + IntToStr(Fila + 6), Query.FieldByName('PeriodoActual').AsString);
          ExclSetCellValue(WorkSheet, 'E' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'F' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosActual').AsInteger);
          ExclSetCellValue(WorkSheet, 'G' + IntToStr(Fila + 6), Query.FieldByName('MasaActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'H' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'I' + IntToStr(Fila + 6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          ExclSetCellValue(WorkSheet, 'J' + IntToStr(Fila + 6), Query.FieldByName('MasaAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'K' + IntToStr(Fila + 6), Query.FieldByName('EmisionNetaActual').AsFloat - Query.FieldByName('EmisionNetaAnterior').AsFloat);

          Inc(Fil);

          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;

      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        ExclWorkSheetPrint(WorkSheet, LCID_1);

      WorkSheet := nil;
    end;


    if chkEmision.Checked then
    begin
      {
       ------------------------------------------------------------------------------
        Carga e imprime la información en la hoja "Desvío de Emisión" de la planilla
       ------------------------------------------------------------------------------
      }
      WorkSheet := ExclSetWorkSheet(WorkBk, 1);
      WorkSheet.Name := 'Análisis de Emisión';

      sSql :=
        'SELECT *' +
         ' FROM zre_ResumenEmision3Meses ' +
        ' WHERE (re_Mes>Periodo_Anterior(:p1, 3)' +
          ' AND re_Mes <= ' + SqlValue(Periodo) + ')' +
           ' OR (re_Mes=Periodo_Anterior(:p2, 12))';
      Query := GetQueryEx(sSql, [Periodo, Periodo]);
      try
        while not Query.Eof do
        begin
          case Periodos_ContarCantidad(Query.FieldByName('re_Periodo').AsString, Query.FieldByName('re_Mes').AsString) of
            2:  Columna := 'B';
            3:  Columna := 'C';
            4:  Columna := 'D';
            5:  Columna := 'E';
          else
            Columna := 'F';
          end;

          case Periodos_ContarCantidad(Query.FieldByName('re_Periodo').AsString, Periodo) of
            1:  Fila := 8;
            2:  Fila := 10;
            3:  Fila := 12;
          else
            Fila := 14;
          end;
          ExclSetCellValue(WorkSheet, Columna+IntToStr(Fila), Query.FieldByName('re_Emision').AsFloat);
          ExclSetCellValue(WorkSheet, Columna+IntToStr(Fila+13), Query.FieldByName('re_Anulacion').AsFloat);

          //Continua con el query
          Query.Next;
        end;

        // ExclSetCellValue('G1', PeriodoBarra);
      finally
        Query.Free;
      end;

      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        ExclWorkSheetPrint(WorkSheet, LCID_1);

      WorkSheet := nil;
      {
       ------------------------------------------------------------------------------
        Carga e imprime la información en la hoja "Desvío de Emisión" de la planilla
       ------------------------------------------------------------------------------
      }
      WorkSheet := ExclSetWorkSheet(WorkBk, 2);
      WorkSheet.Name := 'Análisis de Emisión (2)';

      sSql :=
        'SELECT *' +
         ' FROM zre_ResumenEmisionComparado' +
        ' WHERE re_Mes = ' + SqlValue(Periodo);
      Query := GetQuery(sSql);
      try
        while not Query.Eof do
        begin
          ExclSetCellValue(WorkSheet, 'B8', Query.FieldByName('re_NuevoCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'C8', Query.FieldByName('re_NuevoEmisonActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'C9', Query.FieldByName('re_MayorCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'D9', Query.FieldByName('re_MayorEmisionActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'E9', Query.FieldByName('re_MayorEmisionAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'B10', Query.FieldByName('re_SimilarCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'C10', Query.FieldByName('re_SimilarEmisionActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'D10', Query.FieldByName('re_SimilarCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'E10', Query.FieldByName('re_SimilarEmisionAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'B11', Query.FieldByName('re_MenorCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'C11', Query.FieldByName('re_MenorEmisionActual').AsFloat);
          ExclSetCellValue(WorkSheet, 'D11', Query.FieldByName('re_MenorCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'E11', Query.FieldByName('re_MenorEmisionAnterior').AsFloat);
          ExclSetCellValue(WorkSheet, 'D12', Query.FieldByName('re_FaltaCantidad').AsFloat);
          ExclSetCellValue(WorkSheet, 'E12', Query.FieldByName('re_FaltaEmisionAnterior').AsFloat);

          //Continua con el query
          Query.Next;
        end;

        // ExclSetCellValue('F1', PeriodoBarra);
      finally
        Query.Free;
      end;

      sSql :=
        'SELECT NVL(RC_CLASE, 0) RC_CLASE, SUM(MO_IMPORTE) IMPORTE, COUNT(DISTINCT MO_CONTRATO) EMPRESAS' +
         ' FROM ZRC_RESUMENCOBRANZA, ZMO_MOVIMIENTO' +
        ' WHERE RC_CONTRATO = MO_CONTRATO' +
          ' AND MO_PERIODO = RC_PERIODO' +
          ' AND RC_PERIODO = PERIODO_ANTERIOR(:p1)' +
          ' AND MO_PERFECHADIST = :p2' +
          ' AND MO_IDCODIGOMOVIMIENTO IN (SELECT CM_ID' +
                                          ' FROM ZCM_CODIGOMOVIMIENTO' +
                                         ' WHERE CM_OPERACION = ''E''' +
                                           ' AND CM_CONCEPTO = ''C'')' +
     ' GROUP BY RC_CLASE';

      Query := GetQueryEx(sSql, [Periodo, Periodo]);
      try
        while not Query.Eof do
        begin
          ExclSetCellValue(WorkSheet, 'B' + IntToStr(Query.FieldByName('rc_Clase').AsInteger+20), Query.FieldByName('Empresas').AsFloat);
          ExclSetCellValue(WorkSheet, 'C' + IntToStr(Query.FieldByName('rc_Clase').AsInteger+20), Query.FieldByName('Importe').AsFloat);

          //Continua con el query
          Query.Next;
        end;
      finally
        Query.Free;
      end;

      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        ExclWorkSheetPrint(WorkSheet, LCID_1);

      WorkSheet := nil;
    end;

    if bTablaDesvio then
      with ExportDialog do
        begin
          OpenQuery(sdqConsulta);

          ExportFileType := etExcelFile;
          OutputFile     := StringReplace(edFileName.FileName, '.xls', '_TablaCompleta.xls', [rfIgnoreCase]);
          SaveToFile;
        end;

    MessageDlg('La operación se completó con éxito.', mtInformation, [mbOK], 0);
  finally
    ExclClose(ExcelApplication, WorkBk, edFileName.FileName, LCID_1);
//    ExcelApplication.Destroy
  end;
end;

end.

