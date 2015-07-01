unit unManTarComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit, DateComboBox,
  unArtFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, JvExControls, JvComponent,
  JvSpecialProgress, Excel2000, OleServer, Variants;

type
  TfrmManTarComercial = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    edTC_SUMAFIJA: TCurrencyEdit;
    edTC_PORCMASA: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    fraTC_IDACTIVIDAD: TfraStaticActividad;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    edTC_FECHADESDE: TDateComboBox;
    Label10: TLabel;
    edTC_FECHAHASTA: TDateComboBox;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    fraActividad: TfraStaticActividad;
    GroupBox8: TGroupBox;
    Label12: TLabel;
    edVigenciaDesde: TDateComboBox;
    edVigenciaHasta: TDateComboBox;
    Label8: TLabel;
    fpImportar: TFormPanel;
    Label4: TLabel;
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
  frmManTarComercial: TfrmManTarComercial;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion;

{$R *.DFM}

procedure TfrmManTarComercial.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT TC_ID, TC_IDACTIVIDAD, AC_DESCRIPCION, AC_CODIGO,' +
                ' TC_FECHADESDE, TC_FECHAHASTA, TC_SUMAFIJA, TC_PORCMASA,' +
                ' TC_USUALTA, TC_FECHAALTA, TC_USUMODIF, TC_FECHAMODIF, TC_USUBAJA, TC_FECHABAJA' +
           ' FROM ATC_TARIFACOMERCIAL, CAC_ACTIVIDAD' +
          ' WHERE AC_ID = TC_IDACTIVIDAD';

  if fraActividad.IsSelected then
    sWhere := sWhere + ' AND AC_ID = ' + SqlValue(fraActividad.Value);

  if not edVigenciaDesde.IsEmpty then
    sWhere := sWhere + ' AND TC_FECHADESDE >= ' + SqlValue(edVigenciaDesde.Date);

  if not edVigenciaHasta.IsEmpty then
    sWhere := sWhere + ' AND TC_FECHAHASTA <= ' + SqlValue(edVigenciaHasta.Date);
  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;
  
  inherited;
end;

procedure TfrmManTarComercial.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  
  TFloatField(sdqConsulta.FieldByName('TC_SUMAFIJA')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('TC_PORCMASA')).DisplayFormat := '% 0.000;-% 0.000';
end;

procedure TfrmManTarComercial.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;

  tbImportar.Left := 239;  
end;

procedure TfrmManTarComercial.ClearControls;
begin
  fraTC_IDACTIVIDAD.Clear;
  edTC_SUMAFIJA.Clear;
  edTC_PORCMASA.Clear;
  edTC_FECHADESDE.Clear;
  edTC_FECHAHASTA.Clear;
  VCLExtra.LockControls(edTC_FECHADESDE, False);
end;

function TfrmManTarComercial.DoABM: Boolean;
var
  fID: String;
begin
  BeginTrans;
  Sql.Clear;
  Sql.TableName := 'ATC_TARIFACOMERCIAL';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    fID  := sdqConsulta.FieldByName('TC_ID').AsString;
    Sql.Fields.Add('TC_USUBAJA', Sesion.UserID);
    Sql.Fields.Add('TC_FECHABAJA', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      fID := ValorSql('SELECT SEQ_ATC_ID.NEXTVAL FROM DUAL', '0');
      Sql.Fields.Add('TC_USUALTA', Sesion.UserID);
      Sql.Fields.Add('TC_FECHAALTA', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      fID := sdqConsulta.FieldByName('TC_ID').AsString;
      Sql.Fields.Add('TC_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('TC_FECHAMODIF', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('TC_IDACTIVIDAD', fraTC_IDACTIVIDAD.Value, False);
    Sql.Fields.Add('TC_SUMAFIJA', edTC_SUMAFIJA.Value, dtNumber);
    Sql.Fields.Add('TC_PORCMASA', edTC_PORCMASA.Value, dtNumber);
    Sql.Fields.Add('TC_FECHADESDE', edTC_FECHADESDE.Date);
    Sql.Fields.Add('TC_FECHAHASTA', edTC_FECHAHASTA.Date);
  end;

  Sql.PrimaryKey.Add('TC_ID', fID, False);

  try
    EjecutarSqlSt(Sql.Sql);
    result := True;
    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmManTarComercial.LoadControls;
begin
  fraTC_IDACTIVIDAD.Value := sdqConsulta.FieldByName('TC_IDACTIVIDAD').AsInteger;
  edTC_SUMAFIJA.Value     := sdqConsulta.FieldByName('TC_SUMAFIJA').AsFloat;
  edTC_PORCMASA.Value     := sdqConsulta.FieldByName('TC_PORCMASA').AsFloat;
  edTC_FECHADESDE.Date    := sdqConsulta.FieldByName('TC_FECHADESDE').AsDateTime;
  edTC_FECHAHASTA.Date    := sdqConsulta.FieldByName('TC_FECHAHASTA').AsDateTime;

  VCLExtra.LockControls(edTC_FECHADESDE, True);
end;

procedure TfrmManTarComercial.ProcesarExcel;
var
  iLCid: Integer;
  iLoop: Integer;
  iRow: Integer;
  sColumnas: Array[Ord('A')..Ord('G')] of String;
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
      for iLoop := Ord('A') to Ord('G') do
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
          sSql := 'UPDATE ATC_TARIFACOMERCIAL' +
                    ' SET TC_SUMAFIJA = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('D')], 0)) + ',' +
                        ' TC_PORCMASA = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('E')], 0)) + ',' +
                        ' TC_FECHADESDE = ' + SqlDate(StrToDateDef(sColumnas[Ord('F')], 0)) + ',' +
                        ' TC_FECHAHASTA = ' + SqlDate(StrToDateDef(sColumnas[Ord('G')], 0)) + ',' +
                        ' TC_USUMODIF = ' + SqlValue(Sesion.UserId) + ', ' +
                        ' TC_FECHAMODIF = SYSDATE' +
                  ' WHERE TC_ID = ' + SqlInteger(sColumnas[Ord('A')]);

          EjecutarSql(sSql);
        except
          on E: Exception do
            MsgBox(E.Message);
        end;

        Inc(iRow);
        progress.StepIt;
        if (iRow mod 20) = 0 then
          Forms.Application.ProcessMessages;

        for iLoop := Ord('A') to Ord('G') do
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

function TfrmManTarComercial.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iLoop: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColumnas: Array[Ord('A')..Ord('G')] of String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
      for iLoop := Ord('A') to Ord('G') do
        sColumnas[iLoop] := Range[Chr(iLoop) + IntToStr(iLineNumber), Chr(iLoop) + IntToStr(iLineNumber)].Value2;

    if IsEmptyLine(sColumnas) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmManTarComercial.IsEmptyLine(const aColumnas: Array of String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  for iLoop := Ord('A') to Ord('G') do
    if Trim(aColumnas[iLoop - Ord('A')]) <> '' then
      Exit;

  Result := True;
end;

function TfrmManTarComercial.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraTC_IDACTIVIDAD.IsEmpty, fraTC_IDACTIVIDAD, 'El CIIU es un campo obligatorio.');
  Verificar(edTC_SUMAFIJA.Value <= 0, edTC_SUMAFIJA, 'La suma fija debe ser superior a cero.');
  Verificar(edTC_PORCMASA.Value <= 0, edTC_PORCMASA, 'El porcentaje variable debe ser superior a cero.');
  Verificar(edTC_FECHADESDE.IsEmpty, edTC_FECHADESDE, 'La fecha de inicio de vigencia es un campo obligatorio.');

  sSql := 'SELECT 1 ' +
          '  FROM ATC_TARIFACOMERCIAL ' +
          ' WHERE TC_IDACTIVIDAD = ' + SqlValue ( fraTC_IDACTIVIDAD.Value ) +
          '   AND (TC_FECHAHASTA IS NULL OR ((TC_FECHADESDE <= ' + SqlValue( edTC_FECHADESDE.Date ) + ') AND ' +
          '                                  (TC_FECHAHASTA >= ' + SqlValue( edTC_FECHADESDE.Date ) + ' )))' +
          '   AND TC_FECHABAJA IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND TC_ID <> ' + sdqConsulta.FieldByName('TC_ID').AsString;
  Verificar(ExisteSql(sSql), edTC_FECHADESDE, 'Ya existe un período que comprende la fecha de inicio de vigencia.');
  Result := True;
end;

procedure TfrmManTarComercial.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  
  fraActividad.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

procedure TfrmManTarComercial.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('TC_FECHABAJA').AsString <> '' then
    Afont.Color := clRed;
end;

procedure TfrmManTarComercial.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('TC_FECHABAJA').AsString <> '' then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManTarComercial.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('TC_FECHABAJA').AsString <> '' then
    raise Exception.Create('El registro ha sido dado de baja.');
    
  inherited;
end;

procedure TfrmManTarComercial.tbImportarClick(Sender: TObject);
begin
  fpImportar.ShowModal;
end;

procedure TfrmManTarComercial.fpImportarBeforeShow(Sender: TObject);
begin
  edArchivo.Clear;
end;

procedure TfrmManTarComercial.tbAgregarExcelClick(Sender: TObject);
begin
  OpenDialog.Title := 'Archivos de Mantenimiento de Costo Siniestral';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfrmManTarComercial.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo debe ser:' + #13 + #10 +
             '* Extensión: .XLS' + #13 + #10 +
             '* Encabezado: SI' + #13 + #10 +
             '* Las columnas A, B y C son solo de referencia y NO se importaran' + #13 + #10 +
             '* Columnas:' + #13 + #10 +
             '           A) Código' + #13 + #10 +
             '           B) CIIU' + #13 + #10 +
             '           C) Actividad' + #13 + #10 +
             '           D) Duma Fija' + #13 + #10 +
             '           E) Porc. Variable' + #13 + #10 +
             '           F) Fecha Desde' + #13 + #10 +
             '           G) Fecha Hasta'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmManTarComercial.btnProcesarClick(Sender: TObject);
begin
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el Archivo a procesar.');

  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Verificando archivo...';
  fpProcesar.ShowModal;
end;

procedure TfrmManTarComercial.btnCancelar2Click(Sender: TObject);
begin
  fpImportar.Close;
end;

procedure TfrmManTarComercial.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

procedure TfrmManTarComercial.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmManTarComercial.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  ProcesarExcel;

  fpImportar.Close;
  tbRefrescarClick(nil);
end;

end.
