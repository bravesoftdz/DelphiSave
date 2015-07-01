unit unManTarifario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit, DateComboBox,
  unArtFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, JvExControls, JvComponent,
  JvSpecialProgress, Excel2000, OleServer, Variants;

type
  TfrmManTarifario = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    edTS_TARIFA1: TCurrencyEdit;
    edTS_PORCE1: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edTS_TARIFA2: TCurrencyEdit;
    edTS_PORCE2: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edTS_TARIFA3: TCurrencyEdit;
    edTS_PORCE3: TCurrencyEdit;
    GroupBox4: TGroupBox;
    fraTS_IDACTIVIDAD: TfraStaticActividad;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    edTS_FECHADESDE: TDateComboBox;
    Label10: TLabel;
    edTS_FECHAHASTA: TDateComboBox;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    fraActividad: TfraStaticActividad;
    GroupBox8: TGroupBox;
    Label12: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    Label8: TLabel;
    fpImportar: TFormPanel;
    Label9: TLabel;
    edArchivo: TEdit;
    ToolBar1: TToolBar;
    tbAgregarExcel: TToolButton;
    tbVerFormato: TToolButton;
    btnProcesar: TButton;
    btnCancelar2: TButton;
    fpProcesar: TFormPanel;
    progress: TJvSpecialProgress;
    lbAccion: TLabel;
    btnCancelar3: TButton;
    tbImportar: TToolButton;
    t1: TTimer;
    OpenDialog: TOpenDialog;
    ExcelApp: TExcelApplication;
    ExcelWS: TExcelWorksheet;
    ExcelWB: TExcelWorkbook;
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbImportarClick(Sender: TObject);
    procedure fpImportarBeforeShow(Sender: TObject);
    procedure tbAgregarExcelClick(Sender: TObject);
    procedure tbVerFormatoClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure fpProcesarShow(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure t1Timer(Sender: TObject);
  private
    procedure Verificar(Condicion: boolean; AControl: TWinControl; AText: string);
  protected
    FCancelarProceso: Boolean;

    function DoABM: Boolean; override;
    function GetCountLineasExcel: Integer;
    function IsEmptyLine(const aColumnas: Array of String): Boolean;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure ProcesarExcel;
  end;

var
  frmManTarifario: TfrmManTarifario;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion;

{$R *.DFM}

procedure TfrmManTarifario.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT ts_id, ts_idactividad, ac_descripcion, ac_codigo, ts_fechadesde, ts_fechahasta, ts_tarifa1, ts_porce1,' +
          ' ts_tarifa2, ts_porce2, ts_tarifa3, ts_porce3, ts_fechabaja' +
     ' FROM ats_tarifassn, cac_actividad' +
    ' WHERE ac_id = ts_idactividad';
  sWhere := '';

  if fraActividad.IsSelected then
    sWhere := sWhere + ' AND ac_id = ' + SqlValue( fraActividad.Value);

  if not edVigenciaDesde.IsEmpty then
    sWhere := sWhere + ' AND ts_fechadesde >= ' + SqlValue(edVigenciaDesde.Date);

  if not edVigenciaHasta.IsEmpty then
    sWhere := sWhere + ' AND ts_fechahasta <= ' + SqlValue(edVigenciaHasta.Date);
  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;
  
  inherited;
end;

procedure TfrmManTarifario.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  
  TFloatField( sdqConsulta.FieldByName('ts_tarifa1')).Currency := True;
  TFloatField( sdqConsulta.FieldByName('ts_tarifa2')).Currency := True;
  TFloatField( sdqConsulta.FieldByName('ts_tarifa3')).Currency := True;
  TFloatField( sdqConsulta.FieldByName('ts_porce1')).DisplayFormat := '% 0.000;-% 0.000';
  TFloatField( sdqConsulta.FieldByName('ts_porce2')).DisplayFormat := '% 0.000;-% 0.000';
  TFloatField( sdqConsulta.FieldByName('ts_porce3')).DisplayFormat := '% 0.000;-% 0.000';
end;

procedure TfrmManTarifario.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;

  tbImportar.Left := 239;
end;

procedure TfrmManTarifario.ClearControls;
begin
  fraTS_IDACTIVIDAD.Clear;
  edTS_TARIFA1.Clear;
  edTS_PORCE1.Clear;
  edTS_TARIFA2.Clear;
  edTS_PORCE2.Clear;
  edTS_TARIFA3.Clear;
  edTS_PORCE3.Clear;
  edTS_FECHADESDE.Clear;
  edTS_FECHAHASTA.Clear;
  VCLExtra.LockControls(edTS_FECHADESDE, False);
end;

function TfrmManTarifario.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := 0;
  
  BeginTrans;
  Sql.Clear;
  Sql.TableName := 'ats_tarifassn';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId  := sdqConsulta.FieldByName('ts_id').AsInteger;

    Sql.Fields.Add('ts_usubaja', Sesion.UserID);
    Sql.Fields.Add('ts_fechabaja', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := ValorSqlInteger('SELECT seq_ats_id.NEXTVAL FROM DUAL');

      Sql.Fields.Add('ts_usualta', Sesion.UserID);
      Sql.Fields.Add('ts_fechaalta', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId := sdqConsulta.FieldByName('ts_id').AsInteger;

      Sql.Fields.Add('ts_usumodif', Sesion.UserID);
      Sql.Fields.Add('ts_fechamodif', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('ts_idactividad', fraTS_IDACTIVIDAD.Value, False);
    Sql.Fields.Add('ts_tarifa1',     edTS_TARIFA1.Value, dtNumber);
    Sql.Fields.Add('ts_porce1',      edTS_PORCE1.Value, dtNumber);
    Sql.Fields.Add('ts_tarifa2',     edTS_TARIFA2.Value, dtNumber);
    Sql.Fields.Add('ts_porce2',      edTS_PORCE2.Value, dtNumber);
    Sql.Fields.Add('ts_tarifa3',     edTS_TARIFA3.Value, dtNumber);
    Sql.Fields.Add('ts_porce3',      edTS_PORCE3.Value, dtNumber);
    Sql.Fields.Add('ts_fechadesde',  edTS_FECHADESDE.Date);
    Sql.Fields.Add('ts_fechahasta',  edTS_FECHAHASTA.Date);
  end;

  Sql.PrimaryKey.Add('ts_id', iId, False);

  try
    EjecutarSqlSt(Sql.Sql);
    CommitTrans;
    Result := True;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManTarifario.LoadControls;
begin
  with sdqConsulta do
  begin
    fraTS_IDACTIVIDAD.Value := FieldByName('ts_idactividad').AsInteger;
    edTS_TARIFA1.Value      := FieldByName('ts_tarifa1').AsFloat;
    edTS_PORCE1.Value       := FieldByName('ts_porce1').AsFloat;
    edTS_TARIFA2.Value      := FieldByName('ts_tarifa2').AsFloat;
    edTS_PORCE2.Value       := FieldByName('ts_porce2').AsFloat;
    edTS_TARIFA3.Value      := FieldByName('ts_tarifa3').AsFloat;
    edTS_PORCE3.Value       := FieldByName('ts_porce3').AsFloat;
    edTS_FECHADESDE.Date    := FieldByName('ts_fechadesde').AsDateTime;
    edTS_FECHAHASTA.Date    := FieldByName('ts_fechahasta').AsDateTime;
  end;

  VCLExtra.LockControls(edTS_FECHADESDE, True);
end;

procedure TfrmManTarifario.ProcesarExcel;
var
  iLCid: Integer;
  iLoop: Integer;
  iRow: Integer;
  sColumnas: Array[Ord('A')..Ord('K')] of String;
  sSql: String;
begin
  iLCid := GetUserDefaultLCID;
  try
    ExcelApp.Workbooks.Open(edArchivo.Text, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
    ExcelApp.Visible[0] := False;
    ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
    ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
    ExcelWS.Activate;
    with ExcelWS do
    begin
      iRow := 2;
      for iLoop := Ord('A') to Ord('K') do
        sColumnas[iLoop] := Range[Chr(iLoop) + IntToStr(iRow), Chr(iLoop) + IntToStr(iRow)].Value;

      lbAccion.Caption := 'Procesando archivo...';
      progress.Maximum := GetCountLineasExcel;
      progress.Minimum := 0;
      progress.Position := 0;

      while not IsEmptyLine(sColumnas) do
      begin
        if FCancelarProceso then
          Break;

        try
          sSql := 'UPDATE ats_tarifassn' +
                    ' SET ts_tarifa1 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('D')], 0)) + ',' +
                        ' ts_porce1 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('E')], 0)) + ',' +
                        ' ts_tarifa2 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('F')], 0)) + ',' +
                        ' ts_porce2 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('G')], 0)) + ',' +
                        ' ts_tarifa3 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('H')], 0)) + ',' +
                        ' ts_porce3 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('I')], 0)) + ',' +
                        ' ts_fechadesde = ' + SqlDate(StrToDateDef(sColumnas[Ord('J')], 0)) + ',' +
                        ' ts_fechahasta = ' + SqlDate(StrToDateDef(sColumnas[Ord('K')], 0)) + ',' +
                        ' ts_usumodif = ' + SqlValue(Sesion.UserId) + ',' +
                        ' ts_fechamodif = SYSDATE' +
                  ' WHERE ts_id = ' + SqlInteger(sColumnas[Ord('A')]);

          EjecutarSql(sSql);
        except
          on E: Exception do
            MsgBox(E.Message);
        end;

        Inc(iRow);
        progress.StepIt;
        if (iRow mod 20) = 0 then
          Forms.Application.ProcessMessages;

        for iLoop := Ord('A') to Ord('K') do
        try
          sColumnas[iLoop] := Range[Chr(iLoop) + IntToStr(iRow), Chr(iLoop) + IntToStr(iRow)].Value;
        except
          on E: Exception do
            MsgBox(Format('Fila %d, columna %s: %s', [iRow, Chr(iLoop), E.Message]));
        end;
      end;
    end;

    MsgBox('El proceso ha finalizado.');
    fpProcesar.ModalResult := mrOk;
  except
    fpProcesar.ModalResult := mrCancel;
  end;

  ExcelWS.Disconnect;
  ExcelWB.Disconnect;
  ExcelApp.Visible[0] := True;
  ExcelApp.Quit;
  ExcelApp.Disconnect;
end;

function TfrmManTarifario.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iLoop: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColumnas: Array[Ord('A')..Ord('K')] of String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
      for iLoop := Ord('A') to Ord('K') do
        sColumnas[iLoop] := Range[Chr(iLoop) + IntToStr(iLineNumber), Chr(iLoop) + IntToStr(iLineNumber)].Value2;

    if IsEmptyLine(sColumnas) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmManTarifario.IsEmptyLine(const aColumnas: Array of String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  for iLoop := Ord('A') to Ord('K') do
    if Trim(aColumnas[iLoop - Ord('A')]) <> '' then
      Exit;

  Result := True;
end;

function TfrmManTarifario.Validar: Boolean;
var
  sSql: String;
begin
  result := True;
  Verificar(fraTS_IDACTIVIDAD.IsEmpty, fraTS_IDACTIVIDAD.edCodigo, 'El CIIU es un campo obligatorio.');
  Verificar(edTS_TARIFA1.Value <= 0, edTS_TARIFA1, 'La suma fija del nivel 1 debe ser superior a cero.');
  Verificar(edTS_TARIFA2.Value <= 0, edTS_TARIFA2, 'La suma fija del nivel 2 debe ser superior a cero.');
  Verificar(edTS_TARIFA3.Value <= 0, edTS_TARIFA3, 'La suma fija del nivel 3 debe ser superior a cero.');
  Verificar(edTS_PORCE1.Value <= 0, edTS_PORCE1, 'El porcentaje variable del nivel 1 debe ser superior a cero.');
  Verificar(edTS_PORCE2.Value <= 0, edTS_PORCE2, 'El porcentaje variable del nivel 2 debe ser superior a cero.');
  Verificar(edTS_PORCE3.Value <= 0, edTS_PORCE3, 'El porcentaje variable del nivel 3 debe ser superior a cero.');
  Verificar(edTS_FECHADESDE.IsEmpty, edTS_FECHADESDE, 'La fecha de inicio de vigencia es un campo obligatorio.');

  sSql :=
    'SELECT 1' +
     ' FROM ats_tarifassn' +
    ' WHERE ts_idactividad = ' + SqlValue(fraTS_IDACTIVIDAD.Value) +
      ' AND (ts_fechahasta IS NULL OR ((ts_fechadesde <= ' + SqlValue( edTS_FECHADESDE.Date ) + ')' +
      ' AND (ts_fechahasta >= ' + SqlValue( edTS_FECHADESDE.Date ) + ')))' +
      ' AND ts_fechabaja IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND ts_id <> ' + sdqConsulta.FieldByName('ts_id').AsString;
  Verificar(ExisteSql(sSql), edTS_FECHADESDE, 'Ya existe un período que comprende la fecha de inicio de vigencia.');
end;

procedure TfrmManTarifario.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  
  fraActividad.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

procedure TfrmManTarifario.Verificar(Condicion: Boolean; AControl: TWinControl; AText: String);
begin
  if Condicion then
  begin
    if AText <> '' then
      InvalidMsg(AControl, AText);
    Abort;
  end;
end;

procedure TfrmManTarifario.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                             Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('ts_fechabaja').AsString <> '' then
    Afont.Color := clRed;
end;

procedure TfrmManTarifario.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ts_fechabaja').AsString <> '' then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManTarifario.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('ts_fechabaja').AsString <> '' then
    raise Exception.Create('El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmManTarifario.tbImportarClick(Sender: TObject);
begin
  fpImportar.ShowModal;
end;

procedure TfrmManTarifario.fpImportarBeforeShow(Sender: TObject);
begin
  edArchivo.Clear;
end;

procedure TfrmManTarifario.tbAgregarExcelClick(Sender: TObject);
begin
  OpenDialog.Title := 'Archivos de Mantenimiento de Costo Siniestral';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfrmManTarifario.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo debe ser:' + #13 + #10 +
             '* Extensión: .XLS' + #13 + #10 +
             '* Encabezado: SI' + #13 + #10 +
             '* Las columnas A, B y C son solo de referencia y NO se importaran' + #13 + #10 +
             '* Columnas:' + #13 + #10 +
             '           A) Código' + #13 + #10 +
             '           B) CIIU' + #13 + #10 +
             '           C) Actividad' + #13 + #10 +
             '           D) Suma Fija Nivel 1' + #13 + #10 +
             '           E) Porc. Nivel 1' + #13 + #10 +
             '           F) Suma Fija Nivel 2' + #13 + #10 +
             '           G) Porc. Nivel 2' + #13 + #10 +
             '           H) Suma Fija Nivel 3' + #13 + #10 +
             '           I) Porc. Nivel 3' + #13 + #10 +
             '           J) Fecha Desde' + #13 + #10 +
             '           K) Fecha Hasta'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmManTarifario.btnProcesarClick(Sender: TObject);
begin
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el Archivo a procesar.');

  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Verificando archivo...';
  fpProcesar.ShowModal;
end;

procedure TfrmManTarifario.btnCancelar2Click(Sender: TObject);
begin
  fpImportar.Close;
end;

procedure TfrmManTarifario.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

procedure TfrmManTarifario.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmManTarifario.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  ProcesarExcel;

  fpImportar.Close;
  tbRefrescarClick(nil);
end;

end.
