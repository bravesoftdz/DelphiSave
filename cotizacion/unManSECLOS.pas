unit unManSECLOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, PatternEdit, IntEdit, unSesion, Mask, AnsiSQL, CUIT, unArt, unDmPrincipal, BaseGrid, AdvGrid,
  Excel2000, OleServer, Buttons, ToolEdit, Variants, StrFuncs;

type
  TLineaExcelArray = Array['A'..'C'] of String;
  TValidationArray = Array['A'..'C'] of String;

type
  TfrmManSECLOS = class(TfrmCustomGridABM)
    Label1: TLabel;
    edSE_CUIT: TMaskEdit;
    edSE_ANIO: TIntEdit;
    Label2: TLabel;
    edSE_CANTIDAD: TIntEdit;
    Label3: TLabel;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    ExcelApp: TExcelApplication;
    fpProcesar: TFormPanel;
    btnGuardar: TButton;
    tbImportar: TToolButton;
    edFilename: TFilenameEdit;
    btnVerFormato: TBitBtn;
    btnProcesar: TButton;
    stEstado: TStatusBar;
    GridProceso: TAdvStringGrid;
    Label4: TLabel;
    edFiltroCUIL: TMaskEdit;
    edFiltroAnio: TIntEdit;
    edFiltroCantidad: TIntEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tbImportarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure fpProcesarShow(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure btnVerFormatoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  private
    function GetSECLORepetido(const aCuit: String; aAnio: Integer): TTableId;
    function GetUltimaLinea: Integer;
    function IsEmptyLine(const aValores: TValidationArray): Boolean;

    procedure ClearProcesar;
    procedure DoProcesarSECLORepetido(const aId: Integer; const aCuit: String; const aCantidad: Integer);
    procedure InsertarSECLO(const aCuit: String; const aAnio, aCantidad: Integer);
    procedure ProcesarGrilla;
    procedure ProcesarXLS(const aFileName: String);
    procedure UpdateSECLO(const aId: TTableId; const aCantidad: Integer; const aSumar: Boolean);
  end;

var
  frmManSECLOS: TfrmManSECLOS;

implementation

uses
  SqlFuncs, CustomDlgs, unEspera;

{$R *.DFM}

procedure TfrmManSECLOS.ClearControls;
begin
  edSE_CUIT.Clear;
  edSE_ANIO.Clear;
  edSE_CANTIDAD.Clear;
end;

function TfrmManSECLOS.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'ase_seclos';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    Sql.PrimaryKey.Add('se_id',        sdqConsulta.FieldByName('se_id').AsInteger, False);
    Sql.Fields.AddString('se_usubaja', Sesion.UserID);
    Sql.Fields.Add('se_fechabaja',     SQL_DATETIME, False);
  end
  else
  begin
    Sql.Fields.AddString('se_cuit',      edSE_CUIT.Text);
    Sql.Fields.AddInteger('se_anio',     edSE_ANIO.Value);
    Sql.Fields.AddInteger('se_cantidad', edSE_CANTIDAD.Value);
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      Sql.Fields.AddString('se_usualta', Sesion.UserID);
      Sql.Fields.Add('se_fechaalta',     SQL_DATETIME, False);
    end
    else
    begin
      Sql.SqlType := stUpdate;
      Sql.PrimaryKey.Add('se_id',         sdqConsulta.FieldByName('se_id').AsInteger, False);
      Sql.Fields.AddString('se_usumodif', Sesion.UserID);
      Sql.Fields.Add('se_fechamodif',     SQL_DATETIME, False);
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManSECLOS.LoadControls;
begin
  with sdqConsulta do
  begin
    edSE_CUIT.Text      := FieldByName('se_cuit').AsString;
    edSE_ANIO.Value     := FieldByName('se_anio').AsInteger;
    edSE_CANTIDAD.Value := FieldByName('se_cantidad').AsInteger;
  end;
end;

procedure TfrmManSECLOS.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT se_id, se_cuit, se_anio, se_cantidad, se_usualta, se_fechaalta, se_usumodif, se_fechamodif, se_usubaja, se_fechabaja' +
     ' FROM ase_seclos' +
    ' WHERE se_fechabaja IS NULL';

  if edFiltroCuil.Text <> '' then
     sSql := sSql + ' AND se_cuit = ' + SqlValue(edFiltroCuil.Text);
  if edFiltroAnio.Text <> '' then
    sSql := sSql + ' AND se_anio = ' + SqlValue(edFiltroAnio.Value);
  if edFiltroCantidad.Text <> '' then
    sSql := sSql + ' AND se_cantidad = ' + SqlValue(edFiltroCantidad.Value);

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;
end;

function TfrmManSECLOS.Validar: Boolean;
var
  aIdSecloRepetido: TTableId;
begin

  if (ModoABM = maAlta) or (ModoABM = maModificacion) then
  begin
    Verificar(not IsCuit(edSE_CUIT.Text), edSE_CUIT, 'La C.U.I.T. ingresada no es válida.');
    Verificar((edSE_ANIO.Value < 1950) or (edSE_ANIO.Value > 2100), edSE_ANIO, 'El año ingresado no es válido.');
  end;

  aIdSecloRepetido := GetSECLORepetido(edSE_CUIT.Text, edSE_ANIO.Value);
  if (ModoABM = maAlta) and (aIdSecloRepetido <> 0) then
  begin
    BeginTrans;
    DoProcesarSECLORepetido(aIdSecloRepetido, edSE_CUIT.Text, edSE_Cantidad.Value);
    Result := False;
    fpAbm.Close;
    sdqConsulta.Refresh;
    CommitTrans;
  end
  else
    Result := True;
end;

procedure TfrmManSECLOS.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  
  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfrmManSECLOS.FormCreate(Sender: TObject);
begin
  inherited;
  
  FieldBaja := 'se_fechabaja';
  tbImportar.Left  := 31;
  tbEliminar.Left  := 31;
  tbModificar.Left := 31;
  tbNuevo.Left     := 30;
end;

function TfrmManSECLOS.GetSECLORepetido(const aCuit: String; aAnio: Integer): TTableId;
begin
  Result := ValorSqlIntegerEx('SELECT se_id' +
                               ' FROM ase_seclos' +
                              ' WHERE se_cuit = :cuit' +
                                ' AND se_anio = :ann' +
                                ' AND se_fechabaja IS NULL', [aCuit, aAnio], 0)
end;

procedure TfrmManSECLOS.UpdateSECLO(const aId: TTableId; const aCantidad: Integer; const aSumar: Boolean);
var
  sSql: String;
  sSuma: String;
begin
  sSuma := '';
  if aSumar then
    sSuma := '+ se_cantidad ';

  sSql :=
    'UPDATE ase_seclos' +
      ' SET se_usumodif = :usuario ,' +
          ' se_fechamodif = SYSDATE,' +
          ' se_cantidad = :cant ' + sSuma +
    ' WHERE se_id = :id';
  EjecutarSqlSTEx(sSql, [Sesion.UserID ,aCantidad, aId]);
end;

procedure TfrmManSECLOS.tbImportarClick(Sender: TObject);
begin
  fpProcesar.ShowModal;
end;

procedure TfrmManSECLOS.btnGuardarClick(Sender: TObject);
begin
  IniciarEspera('Guardando información...');
  try
    Application.ProcessMessages;
    ProcesarGrilla;
    fpProcesar.Close;
    MessageBox(0, 'Actualización completa.', 'Guardar datos de archivo Excel', MB_ICONINFORMATION or MB_OK);
  finally
    DetenerEspera;
  end;
end;

procedure TfrmManSECLOS.btnProcesarClick(Sender: TObject);
begin
  edFilename.Text := Trim(StrReplace(edFilename.Text, '"', ''));

  Verificar(edFilename.Text = '', edFilename, 'Seleccione un archivo excel por favor.');
  ClearProcesar;
  IniciarEspera('Recuperando información...');
  try
    Application.ProcessMessages;
    GridProceso.Clear;
    if (UpperCase(ExtractFileExt(edFilename.Text)) = '.XLS') or (UpperCase(ExtractFileExt(edFilename.Text)) = '.XLSX') then
      ProcesarXLS(edFilename.Text);
  finally
    DetenerEspera;
  end;
end;

procedure TfrmManSECLOS.ProcesarXLS(const aFileName: String);
var
  aCols: TLineaExcelArray;
  iLCid: Integer;
  iLoop: Integer;
  iLoop2: Integer;
  iRow: Integer;
  iUltimaLinea: Integer;
  sEstado : String;
  iErrores : Integer;
  iSecloRepetido : Integer;
begin
  iLCid := GetUserDefaultLCID;
  iErrores := 0;
  try
    try
      ExcelApp.Workbooks.Open(AFileName, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
      ExcelApp.Visible[0] := False;
      ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
      ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
      ExcelWS.Activate;

      for iLoop := Ord('A') to Ord('C') do
        aCols[Chr(iLoop)] := ExcelWS.Range[Chr(iLoop) + '2', Chr(iLoop) + '2'].Value;

      iRow := 2;
      iUltimaLinea := GetUltimaLinea;

      //Result.Errores := 0;
      //Result.Total := iUltimaLinea;
      if (iUltimaLinea < 1) then
        raise Exception.Create('El archivo no posee registros.');

      GridProceso.RowCount := iUltimaLinea;

      GridProceso.Cells[0, 0] := 'CUIT';
      GridProceso.Cells[1, 0] := 'Año';
      GridProceso.Cells[2, 0] := 'Cantidad';
      GridProceso.Cells[3, 0] := 'Estado';

      for iLoop := 2 to iUltimaLinea do
      begin
        // CUIT..
        aCols['A'] := SacarGuiones(aCols['A']);

        GridProceso.Cells[0, iLoop -1] := aCols['A'];
        GridProceso.Cells[1, iLoop -1] := aCols['B'];
        GridProceso.Cells[2, iLoop -1] := aCols['C'];
        sEstado := '';
        if Not IsCuit(aCols['A']) then
          sEstado := 'CUIT Inválido -';


        if StrToInt(aCols['B']) < 1950 then
          sEstado := sEstado + 'Año menor a 1950 -';
        if StrToInt(aCols['B']) > 2100 then
          sEstado := sEstado + 'Año mayor a 2100 -';
        if StrToInt(aCols['C']) < 0 then
          sEstado := sEstado + 'Cantidad menor a 0 -';
        iSecloRepetido := GetSECLORepetido(aCols['A'], StrToInt(aCols['B']));

        if (iSecloRepetido > 0) and (sEstado = '') then
        begin
          sEstado := sEstado + 'La cantidad para esta C.U.I.T. y año se actualizará.';
          GridProceso.Cells[4, iLoop -1] := IntToStr(iSecloRepetido);
        end;
        if (sEstado <> '') and (GridProceso.Cells[4, iLoop -1] = '') then //que no tenga erroes y que tampoco ya este insertado en la base
        begin
          Inc(iErrores); //contar y agregar al panel
          stEstado.Panels[2].Text := 'Errores: '+ IntToStr(iErrores);
        end;

        GridProceso.Cells[3, iLoop -1] := sEstado;

        Inc(iRow);
        for iLoop2 := Ord('A') to Ord('C') do
          aCols[Chr(iLoop2)] := ExcelWS.Range[Chr(iLoop2) + IntToStr(iRow), Chr(iLoop2) + IntToStr(iRow)].Value2;
      end;
      MessageBox(0, 'Lectura Finalizada. Presione "Guardar" para aplicar los cambios.', 'Lectura de archivo Excel', MB_ICONINFORMATION or MB_OK);
      btnGuardar.Enabled := True;


    except
      on E:Exception do
        raise Exception.Create('Se produjo el siguiente error: '+ E.Message);
    end;
  finally
    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
  end;
end;

function TfrmManSECLOS.GetUltimaLinea: Integer;
const
  MAX_BLANCOS = 10;
var
  aCols: TValidationArray;
  bIsEndOfFile: Boolean;
  iLoop: Integer;
  iLoop2: Integer;
begin
  Result := 2;

  stEstado.Panels[0].Text := 'Contando lineas';

  with ExcelWS do
  begin
    bIsEndOfFile := False;

    for iLoop := Ord('A') to Ord('C') do
      aCols[Chr(iLoop)] := Range[Chr(iLoop) + '2', Chr(iLoop) + '2'].Value2;

    while not bIsEndOfFile do
    begin
      // Si leí mas lineas que el máximo establecido para que sea EOF..
      if Result > MAX_BLANCOS then
      begin
        bIsEndOfFile := True;

        for iLoop := Result downto (Result - MAX_BLANCOS + 1) do
        begin
          for iLoop2 := Ord('A') to Ord('C') do
            aCols[Chr(iLoop2)] := Range[Chr(iLoop2) + IntToStr(iLoop), Chr(iLoop2) + IntToStr(iLoop)].Value2;

          if not IsEmptyLine(aCols) then
          begin
            bIsEndOfFile := False;
            Break;
          end;
        end;
      end;

      if not bIsEndOfFile then
      begin
        Inc(Result);
        stEstado.Panels[0].Text := 'Contando: ' + IntToStr(Result -11);

        for iLoop := Ord('A') to Ord('C') do
        try
          aCols[Chr(iLoop)] := Range[Chr(iLoop) + IntToStr(Result), Chr(iLoop) + IntToStr(Result)].Value2
        except
          ShowMessage('Error en el registro ' + IntToStr(Result) + ' Columna ' + Chr(iLoop));
        end;
      end;
    end;
  end;

  stEstado.Panels[1].Text := 'Total: ' + IntToStr(Result - 11);
  Result := Result - MAX_BLANCOS;
end;

function TfrmManSECLOS.IsEmptyLine(const aValores: TValidationArray): Boolean;
var
  iLoop: Integer;
begin
  Result := True;

  for iLoop := Ord('A') to Ord('C') do
    if aValores[Chr(iLoop)] <> '' then
    begin
      Result := False;
      Break;
    end;
end;

procedure TfrmManSECLOS.ProcesarGrilla;
var
  iLoop: Integer;
begin
  BeginTrans;
  try
    for iLoop := 1 to GridProceso.RowCount - 1 do
      if (GridProceso.Cells[3, iLoop] = '') or (GridProceso.Cells[3, iLoop] = 'La cantidad para este CUIT y año se actualizará') then //errores , dejar pasar los repetidos
      begin
        if GridProceso.Cells[4, iLoop] <> '' then  //id ya esta en la base
        begin
          UpdateSECLO(StrToInt(GridProceso.Cells[4, iLoop]), StrToInt(GridProceso.Cells[2, iLoop]), False);
          //DoProcesarSECLORepetido(aIdSecloRepetido, GridProceso.Cells[0, iLoop], StrToInt(GridProceso.Cells[2, iLoop]));
        end
        else
        begin
          InsertarSECLO(GridProceso.Cells[0, iLoop], StrToInt(GridProceso.Cells[1, iLoop]), StrToInt(GridProceso.Cells[2, iLoop]));
        end;
      end;

    CommitTrans;
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create('Se produjo el siguiente error: '+ E.Message);
    end;
  end;
end;

procedure TfrmManSECLOS.InsertarSECLO(const aCuit: String; const aAnio, aCantidad: Integer);
var
  sSql : String;
begin
  sSql :=
    'INSERT INTO ase_seclos' +
               ' (se_cuit, se_anio, se_cantidad, se_usualta, se_fechaalta)' +
        ' VALUES (:cuit, :anio, :cant, :usuario, SYSDATE)';
  EjecutarSqlSTEx(sSql, [aCuit, aAnio, aCantidad, Sesion.UserID]);
end;

procedure TfrmManSECLOS.DoProcesarSECLORepetido(const aId: Integer; const aCuit: String; const aCantidad: Integer);
var
  sMensaje: String;
begin
  sMensaje := Format('La C.U.I.T. %s y el año %d ya estan cargados, ¿ Desea reemplazar la cantidad seclos ?', [edSE_CUIT.Text, edSE_ANIO.Value]);

  UpdateSECLO(aId, aCantidad, (not MessageDlg(sMensaje, mtWarning, [mbYes, mbNo], 0) in [mrYes]));
end;

procedure TfrmManSECLOS.fpProcesarShow(Sender: TObject);
begin
  inherited;

  ClearProcesar;
  edFileName.Clear;
end;

procedure TfrmManSECLOS.FSFormShow(Sender: TObject);
begin
  inherited;
  GridProceso.ColWidths[4] := 0;
end;

procedure TfrmManSECLOS.btnVerFormatoClick(Sender: TObject);
begin
  inherited;

  MessageDlg('El Formato del archivo es:' + #13#10 +
             '* Extensión: .XLS' + #13#10 +
             '* Encabezado: Debe ingresarse encabezado' + #13#10 +
             '* Columnas:' + #13 + #10 +
             '           A) CUIT' + #13#10 +
             '           B) AÑO' + #13#10 +
             '           C) CANTIDAD' + #13#10, mtInformation, [mbOK], 0);
end;

procedure TfrmManSECLOS.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFiltroCuil.Clear;
  edFiltroAnio.Clear;
  edFiltroCantidad.Clear;
end;

procedure TfrmManSECLOS.ClearProcesar;
begin
  GridProceso.Clear;
  stEstado.Panels[0].Text := '';
  stEstado.Panels[1].Text := '';
  stEstado.Panels[2].Text := '';
  GridProceso.Cells[0, 0] := 'CUIT';
  GridProceso.Cells[1, 0] := 'Año';
  GridProceso.Cells[2, 0] := 'Cantidad';
  GridProceso.Cells[3, 0] := 'Estado';
end;

end.
