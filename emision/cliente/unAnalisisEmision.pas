unit unAnalisisEmision;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, PeriodoPicker, ExtCtrls, OleServer, Variants,
  unCustomForm, Excel2000;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
  private
    LCID_1: LCID;
    fMaxRows: integer;
    filInic: integer;
  public
  end;

var
  frmAnalisisEmision: TfrmAnalisisEmision;

implementation

Uses
  unPrincipal, unDmPrincipal, AnsiSql, StrFuncs, SDEngine, DateTimeFuncs,
  CustomDlgs, Periodo, IniFiles;

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
  WorkBk                : _WorkBook;
  WorkSheet             : _WorkSheet;
  Query                 : TSDQuery;
  Fila, Fil             : integer;
  Columna, Celda        : string;
  Periodo, PeriodoBarra : string;
  sSql                  : string;
  NomArchivo            : string;
  function Periodos_ContarCantidad(Periodo1, Periodo2: string): integer;
  var
    Fecha1, Fecha2: TDateTime;
  begin
    Fecha1   := StrToDate('01/' + FormatPeriodo(Periodo1));
    Fecha2   := StrToDate('01/' + FormatPeriodo(Periodo2));

    Result := MonthsBetween(Fecha1, Fecha2);
  end;

  procedure SetCellValue(Celda: string; Valor: Variant);
  begin
    WorkSheet.Range [Celda, Celda].Value2 := Valor
  end;
begin
  Verificar(edPeriodo.Periodo.Valor = '', edPeriodo, 'Debe ingresar el periodo.');
  Verificar(chkExtremosDesvio.Checked and (edDesvio.Value <= 0), edDesvio, 'El importe del desvío debe ser mayor a 0.');
  Verificar(rbPlanilla.Checked And (Trim(edFileName.Text) = ''), edFileName, 'Debe ingresar el lugar en donde guardar la planilla Excel.');

  Periodo      := edPeriodo.Periodo.Valor;
  PeriodoBarra := FormatPeriodo(Periodo);
  fMaxRows     := 50;
  filInic      := 7;

  /////////////
  // INICIA LA EXPORTACION A EXCEL
  /////////////
  try
    NomArchivo := Get_PathReportes + 'DEVENGADO.XLS';

    if not FileExists(NomArchivo) then
      Raise Exception.Create('No se encontró el template para los devengados en ' + NomArchivo);

    WorkBk := ExcelApplication.Workbooks.Open(NomArchivo, Null, Null,
                                              Null, Null, Null,
                                              Null, Null, Null,
                                              Null, Null, Null,
                                              Null, LCID_1);

    if chkExtremos.Checked or chkExtremosDesvio.Checked then
      begin
        sSql := 'EMI.EMISION.DO_GENERARTABLADESVIO(:Periodo);';
        EjecutarStoreEx(sSql, [Periodo]);
      end;

    if chkExtremos.Checked then
    begin
      WorkSheet := WorkBk.WorkSheets.Get_Item(4) as _WorkSheet;
      WorkSheet.Name := 'Análisis de Casos Extremos';

{
   ------------------------------------------------------------------------------------------
    Carga e imprime la información en la hoja "Empresas de mayor diferencia" de la planilla
   ------------------------------------------------------------------------------------------
}
  ///////////////////////////////
  // Desvio porcentual positivo
  ///////////////////////////////
      sSql := 'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL, DE_MASAACTUAL MASAACTUAL, ' +
                     'DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR, DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR ' +
                'FROM TDE_DESVIOEMISION ' +
            'ORDER BY ((DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL)-(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR)) DESC';

      Query := GetQuery( sSql );
      try
        Fila := 0;
        While Not Query.Eof And (Fila < fMaxRows) do
        begin
          inc(Fila);
          SetCellValue('A' + IntToStr(Fila+6), Query.FieldByName('em_cuit').AsString);
          SetCellValue('B' + IntToStr(Fila+6), Query.FieldByName('co_Contrato').AsInteger);
          SetCellValue('C' + IntToStr(Fila+6), Query.FieldByName('em_Nombre').AsString);
          SetCellValue('D' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaActual').AsFloat);
          SetCellValue('E' + IntToStr(Fila+6), Query.FieldByName('EmpleadosActual').AsInteger);
          SetCellValue('F' + IntToStr(Fila+6), Query.FieldByName('MasaActual').AsFloat);
          SetCellValue('G' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          SetCellValue('H' + IntToStr(Fila+6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          SetCellValue('I' + IntToStr(Fila+6), Query.FieldByName('MasaAnterior').AsFloat);
          //Continua con el query
          Query.Next;
        end;

        SetCellValue('J1', PeriodoBarra);
      finally
        Query.Free;
      end;

  ///////////////////////////////
  // Desvio porcentual negativo
  ///////////////////////////////
      sSql := 'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL, DE_MASAACTUAL MASAACTUAL, ' +
                     'DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR, DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR ' +
                'FROM TDE_DESVIOEMISION ' +
            'ORDER BY ((DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL)-' +
                     '(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR))/(DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL) ASC';

      Query := GetQuery( sSql );
      try
        Fila := 0;
        While Not Query.Eof And (Fila < fMaxRows) do
        begin
          inc(Fila);
          SetCellValue('L' + IntToStr(Fila+6), Query.FieldByName('em_cuit').AsString);
          SetCellValue('M' + IntToStr(Fila+6), Query.FieldByName('co_Contrato').AsInteger);
          SetCellValue('N' + IntToStr(Fila+6), Query.FieldByName('em_Nombre').AsString);
          SetCellValue('O' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaActual').AsFloat);
          SetCellValue('P' + IntToStr(Fila+6), Query.FieldByName('EmpleadosActual').AsInteger);
          SetCellValue('Q' + IntToStr(Fila+6), Query.FieldByName('MasaActual').AsFloat);
          SetCellValue('R' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          SetCellValue('S' + IntToStr(Fila+6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          SetCellValue('T' + IntToStr(Fila+6), Query.FieldByName('MasaAnterior').AsFloat);
          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;

  ///////////////////////////////
  // Desvio absoluto positivo
  ///////////////////////////////
      sSql := 'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL, DE_MASAACTUAL MASAACTUAL, ' +
                     'DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR, DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR ' +
                'FROM TDE_DESVIOEMISION ' +
            'ORDER BY ((DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL)-' +
                     '(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR))/(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR) DESC';

      Query := GetQuery( sSql );
      try
        Fila := 0;
        While Not Query.Eof And (Fila < fMaxRows) do
        begin
          inc(Fila);
          SetCellValue('W' + IntToStr(Fila+6), Query.FieldByName('em_cuit').AsString);
          SetCellValue('X' + IntToStr(Fila+6), Query.FieldByName('co_Contrato').AsInteger);
          SetCellValue('Y' + IntToStr(Fila+6), Query.FieldByName('em_Nombre').AsString);
          SetCellValue('Z' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaActual').AsFloat);
          SetCellValue('AA' + IntToStr(Fila+6), Query.FieldByName('EmpleadosActual').AsInteger);
          SetCellValue('AB' + IntToStr(Fila+6), Query.FieldByName('MasaActual').AsFloat);
          SetCellValue('AC' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          SetCellValue('AD' + IntToStr(Fila+6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          SetCellValue('AE' + IntToStr(Fila+6), Query.FieldByName('MasaAnterior').AsFloat);
          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;

  ///////////////////////////////
  // Desvio absoluto negativo
  ///////////////////////////////
      sSql := 'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL, DE_MASAACTUAL MASAACTUAL, ' +
                     'DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR, DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR ' +
                'FROM TDE_DESVIOEMISION ' +
            'ORDER BY ((DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL)-(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR)) ASC';

      Query := GetQuery( sSql );
      try
        Fila := 0;
        While Not Query.Eof And (Fila < fMaxRows) do
        begin
          inc(Fila);
          SetCellValue('AH' + IntToStr(Fila+6), Query.FieldByName('em_cuit').AsString);
          SetCellValue('AI' + IntToStr(Fila+6), Query.FieldByName('co_Contrato').AsInteger);
          SetCellValue('AJ' + IntToStr(Fila+6), Query.FieldByName('em_Nombre').AsString);
          SetCellValue('AK' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaActual').AsFloat);
          SetCellValue('AL' + IntToStr(Fila+6), Query.FieldByName('EmpleadosActual').AsInteger);
          SetCellValue('AM' + IntToStr(Fila+6), Query.FieldByName('MasaActual').AsFloat);
          SetCellValue('AN' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          SetCellValue('AO' + IntToStr(Fila+6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          SetCellValue('AP' + IntToStr(Fila+6), Query.FieldByName('MasaAnterior').AsFloat);
          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;
      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        WorkSheet.PrintOut(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                           EmptyParam, EmptyParam, LCID_1);
      WorkSheet := nil;
    end;

    if chkExtremosDesvio.Checked then
    begin
      WorkSheet := WorkBk.WorkSheets.Get_Item(5) as _WorkSheet;
      WorkSheet.Name := 'An. Casos Extremos-Desvío Absol';

{
   ------------------------------------------------------------------------------------------
    Carga e imprime la información en la hoja "Empresas de desvío absoluto hasta" de la planilla
   ------------------------------------------------------------------------------------------
}
  ///////////////////////////////
  // Desvio hasta
  ///////////////////////////////
      SetCellValue('J1', PeriodoBarra);
      SetCellValue('A4', 'Empresas con desvío absoluto desde ' + ToStr(edDesvio.Value) + '$');

      sSql := 'SELECT DE_CUIT EM_CUIT, DE_CONTRATO CO_CONTRATO, DE_NOMBRE EM_NOMBRE, DE_EMPLEADOSACTUAL EMPLEADOSACTUAL, DE_MASAACTUAL MASAACTUAL, ' +
                     'DE_EMPLEADOSANTERIOR EMPLEADOSANTERIOR, DE_MASAANTERIOR MASAANTERIOR, DE_EMISIONNETAACTUAL EMISIONNETAACTUAL, DE_EMISIONNETAANTERIOR EMISIONNETAANTERIOR ' +
                'FROM TDE_DESVIOEMISION ' +
               'WHERE ABS((DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL)-(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR))>= ' + SqlValue(edDesvio.Value) + ' ' +
            'ORDER BY (ABS((DE_DEVENGADOCUOTAACTUAL+DE_DEVENGADOFONDOACTUAL)-(DE_DEVENGADOCUOTAANTERIOR+DE_DEVENGADOFONDOANTERIOR))) ASC';

      Query := GetQuery( sSql );
      try
        Fila := 0;
        Fil  := FilInic;
        While Not Query.Eof do
        begin
          if Fil >= (FilInic + 1) Then
          begin
            Celda := IntToStr(Fil) + ':' + IntToStr(Fil);
            //inserto una fila vacía y desplazo el resto hacia abajo
            WorkSheet.Rows.Range[Celda, Celda].Insert(-4121);
          end;

          inc(Fila);
          SetCellValue('A' + IntToStr(Fila+6), Query.FieldByName('em_cuit').AsString);
          SetCellValue('B' + IntToStr(Fila+6), Query.FieldByName('co_Contrato').AsInteger);
          SetCellValue('C' + IntToStr(Fila+6), Query.FieldByName('em_Nombre').AsString);
          SetCellValue('D' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaActual').AsFloat);
          SetCellValue('E' + IntToStr(Fila+6), Query.FieldByName('EmpleadosActual').AsInteger);
          SetCellValue('F' + IntToStr(Fila+6), Query.FieldByName('MasaActual').AsFloat);
          SetCellValue('G' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaAnterior').AsFloat);
          SetCellValue('H' + IntToStr(Fila+6), Query.FieldByName('EmpleadosAnterior').AsInteger);
          SetCellValue('I' + IntToStr(Fila+6), Query.FieldByName('MasaAnterior').AsFloat);
          SetCellValue('J' + IntToStr(Fila+6), Query.FieldByName('EmisionNetaActual').AsFloat-Query.FieldByName('EmisionNetaAnterior').AsFloat);

          inc(Fil);
          //Continua con el query
          Query.Next;
        end;

      finally
        Query.Free;
      end;

      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        WorkSheet.PrintOut(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                           EmptyParam, EmptyParam, LCID_1);
      WorkSheet := nil;
    end;


    if chkEmision.Checked then
    begin
  {
   ------------------------------------------------------------------------------
    Carga e imprime la información en la hoja "Desvío de Emisión" de la planilla
   ------------------------------------------------------------------------------
  }
      WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;
      WorkSheet.Name := 'Análisis de Emisión';

      sSql := 'SELECT *' +
              '  FROM zre_ResumenEmision3Meses ' +
              ' WHERE (re_Mes>Periodo_Anterior(' + SqlValue(Periodo) + ',3)' +
              '   AND re_Mes <= ' + SqlValue(Periodo) + ') ' +
              '    OR (re_Mes=Periodo_Anterior(' + SqlValue(Periodo) + ',12)) ';
      Query := GetQuery( sSql );
      try
        while not Query.Eof do
        begin
          Case Periodos_ContarCantidad(Query.FieldByName('re_Periodo').AsString, Query.FieldByName('re_Mes').AsString) of
            2:    Columna := 'B';
            3:    Columna := 'C';
            4:    Columna := 'D';
            5:    Columna := 'E';
            Else  Columna := 'F';
          end;

          Case Periodos_ContarCantidad(Query.FieldByName('re_Periodo').AsString, Periodo) of
            1:    Fila := 8;
            2:    Fila := 10;
            3:    Fila := 12;
            Else  Fila := 14;
          End;
          SetCellValue(Columna+IntToStr(Fila), Query.FieldByName('re_Emision').AsFloat);
          SetCellValue(Columna+IntToStr(Fila+13), Query.FieldByName('re_Anulacion').AsFloat);

          //Continua con el query
          Query.Next;
        end;

        SetCellValue('G1', PeriodoBarra);
      finally
        Query.Free;
      end;
      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        WorkSheet.PrintOut(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                           EmptyParam, EmptyParam, LCID_1);
      WorkSheet := nil;
  {
   ------------------------------------------------------------------------------
    Carga e imprime la información en la hoja "Desvío de Emisión" de la planilla
   ------------------------------------------------------------------------------
  }
      WorkSheet := WorkBk.WorkSheets.Get_Item(2) as _WorkSheet;
      WorkSheet.Name := 'Análisis de Emisión (2)';

      sSql := 'SELECT *' +
              '  FROM zre_ResumenEmisionComparado ' +
              ' WHERE re_Mes = ' + SqlValue(Periodo);
      Query := GetQuery( sSql );
      try
        while not Query.Eof do
        begin
          SetCellValue('B8', Query.FieldByName('re_NuevoCantidad').AsFloat);
          SetCellValue('C8', Query.FieldByName('re_NuevoEmisonActual').AsFloat);
          SetCellValue('C9', Query.FieldByName('re_MayorCantidad').AsFloat);
          SetCellValue('D9', Query.FieldByName('re_MayorEmisionActual').AsFloat);
          SetCellValue('E9', Query.FieldByName('re_MayorEmisionAnterior').AsFloat);
          SetCellValue('B10', Query.FieldByName('re_SimilarCantidad').AsFloat);
          SetCellValue('C10', Query.FieldByName('re_SimilarEmisionActual').AsFloat);
          SetCellValue('D10', Query.FieldByName('re_SimilarCantidad').AsFloat);
          SetCellValue('E10', Query.FieldByName('re_SimilarEmisionAnterior').AsFloat);
          SetCellValue('B11', Query.FieldByName('re_MenorCantidad').AsFloat);
          SetCellValue('C11', Query.FieldByName('re_MenorEmisionActual').AsFloat);
          SetCellValue('D11', Query.FieldByName('re_MenorCantidad').AsFloat);
          SetCellValue('E11', Query.FieldByName('re_MenorEmisionAnterior').AsFloat);
          SetCellValue('D12', Query.FieldByName('re_FaltaCantidad').AsFloat);
          SetCellValue('E12', Query.FieldByName('re_FaltaEmisionAnterior').AsFloat);

          //Continua con el query
          Query.Next;
        end;

        SetCellValue('F1', PeriodoBarra);
      finally
        Query.Free;
      end;

      sSql := 'SELECT NVL(RC_CLASE, 0) RC_CLASE, SUM(MO_IMPORTE) IMPORTE, COUNT(DISTINCT MO_CONTRATO) EMPRESAS' +
              '  FROM ZRC_RESUMENCOBRANZA, ZMO_MOVIMIENTO' +
              ' WHERE RC_CONTRATO=MO_CONTRATO' +
              '   AND MO_PERIODO=RC_PERIODO' +
              '   AND RC_PERIODO=PERIODO_ANTERIOR(' + SqlValue(Periodo) + ')' +
              '   AND MO_PERFECHADIST=' + SqlValue(Periodo) +
              '   AND MO_IDCODIGOMOVIMIENTO IN (SELECT CM_ID' +
              '                                   FROM ZCM_CODIGOMOVIMIENTO' +
              '                                  WHERE CM_OPERACION=''E''' +
              '                                    AND CM_CONCEPTO=''C'')' +
              //'   AND RC_CONTRATO = 84336 ' +
              ' GROUP BY RC_CLASE';

      Query := GetQuery( sSql );
      try
        while not Query.Eof do
        begin
          SetCellValue('B' + IntToStr(Query.FieldByName('rc_Clase').AsInteger+20), Query.FieldByName('Empresas').AsFloat);
          SetCellValue('C' + IntToStr(Query.FieldByName('rc_Clase').AsInteger+20), Query.FieldByName('Importe').AsFloat);

          //Continua con el query
          Query.Next;
        end;
      finally
        Query.Free;
      end;

      //Imprime si corresponde
      if rbPlanillaImpresion.Checked then
        WorkSheet.PrintOut(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                           EmptyParam, EmptyParam, LCID_1);
      WorkSheet := nil;
    end;


    ////////////////////////////////////
    //TERMINA CON EL ARCHIVO
    ////////////////////////////////////
    WorkBk.Close(True, edFileName.FileName, EmptyParam, LCID_1);
    MessageDlg('La operación se completó con éxito.', mtInformation, [mbOK], 0);
  finally
    WorkBk := nil;
    ExcelApplication.DisplayAlerts[LCID_1] := False;
    ExcelApplication.Quit;
    ExcelApplication.Disconnect;
  end;
end;

end.
