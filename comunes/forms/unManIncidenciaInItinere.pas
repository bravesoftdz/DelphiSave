unit unManIncidenciaInItinere;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit, DateComboBox, unArtFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, PatternEdit, IntEdit, JvExControls, JvComponent,
  JvSpecialProgress, Excel2000, OleServer, Variants;

type
  TfrmManIncidenciaInItinere = class(TfrmCustomGridABM)
    GroupBox7: TGroupBox;
    Label11: TLabel;
    fraCiiuBusqueda: TfraStaticActividad;
    GroupBox8: TGroupBox;
    Label12: TLabel;
    edFechaDesdeBusqueda: TDateComboBox;
    edFechaHastaBusqueda: TDateComboBox;
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
    Label2: TLabel;
    edLeves: TCurrencyEdit;
    ExcelWB: TExcelWorkbook;
    ExcelWorkbook1: TExcelWorkbook;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    Label6: TLabel;
    edFechaHasta: TDateComboBox;
    Label4: TLabel;
    edGraves: TCurrencyEdit;
    Label5: TLabel;
    edTotales: TCurrencyEdit;
    Label7: TLabel;
    edMortales: TCurrencyEdit;
    fraCiiu: TfraStaticActividad;
    Label3: TLabel;
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
    procedure RefreshData; override;
  end;

var
  frmManIncidenciaInItinere: TfrmManIncidenciaInItinere;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion, DateTimeFuncs;

{$R *.DFM}

procedure TfrmManIncidenciaInItinere.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('ii_graves')).DisplayFormat   := '% 0.00;-% 0.00';
  TFloatField(sdqConsulta.FieldByName('ii_leves')).DisplayFormat    := '% 0.00;-% 0.00';
  TFloatField(sdqConsulta.FieldByName('ii_mortales')).DisplayFormat := '% 0.00;-% 0.00';
  TFloatField(sdqConsulta.FieldByName('ii_totales')).DisplayFormat  := '% 0.00;-% 0.00';
end;

procedure TfrmManIncidenciaInItinere.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;

  tbImportar.Left := 239;  
end;

procedure TfrmManIncidenciaInItinere.ClearControls;
begin
  fraCiiu.Clear;
  edLeves.Clear;
  edGraves.Clear;
  edTotales.Clear;
  edMortales.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

procedure TfrmManIncidenciaInItinere.ProcesarExcel;
var
  iLCid: Integer;
  iLoop: Integer;
  iRow: Integer;
  sColumnas: Array[Ord('A')..Ord('I')] of String;
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
      for iLoop := Ord('A') to Ord('I') do
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
          sSql :=
            'SELECT 1' +
             ' FROM afi.aii_incidenciainitinere' +
            ' WHERE ii_id = :id';
          if ExisteSqlEx(sSql, [SqlInteger(sColumnas[Ord('A')])]) then
          begin
            sSql :=
              'UPDATE afi.aii_incidenciainitinere' +
                ' SET ii_leves = :leves,' +
                    ' ii_graves = :graves,' +
                    ' ii_totales = :totales,' +
                    ' ii_mortales = :mortales,' +
                    ' ii_fechadesde = :fechadesde,' +
                    ' ii_fechahasta = :fechahasta,' +
                    ' ii_fechamodif = SYSDATE,' +
                    ' ii_usumodif = :usumodif' +
              ' WHERE ii_id = :id';
            EjecutarSqlEx(sSql, [SqlNumber(StrToFloatDef(sColumnas[Ord('D')], 0)),
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('E')], 0)),
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('F')], 0)),
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('G')], 0)),
                                 TDateTimeEx.Create(StrToDateDef(sColumnas[Ord('H')], 0)),
                                 TDateTimeEx.Create(StrToDateDef(sColumnas[Ord('I')], 0)),
                                 Sesion.UserID,
                                 SqlNumber(StrToIntDef(sColumnas[Ord('A')], 0))]);
          end
          else
          begin
            sSql :=
              'INSERT INTO afi.aii_incidenciainitinere' +
                         ' (ii_idactividad, ii_leves, ii_graves, ii_totales, ii_mortales, ii_fechadesde, ii_fechahasta, ii_usualta,' +
                          ' ii_fechaalta)' +
                  ' VALUES ((SELECT ac_id' +
                             ' FROM cac_actividad' +
                            ' WHERE ac_codigo = :codigo' +
                              ' AND ac_fechabaja IS NULL' +
                              ' AND ROWNUM = 1), :leves, :graves, :totales, :mortales, :fechadesde, :fechahasta, :usualta,' +
                           ' SYSDATE)';
            EjecutarSqlEx(sSql, [sColumnas[Ord('B')],
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('D')], 0)),
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('E')], 0)),
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('F')], 0)),
                                 SqlNumber(StrToFloatDef(sColumnas[Ord('G')], 0)),
                                 TDateTimeEx.Create(StrToDateDef(sColumnas[Ord('H')], 0)),
                                 TDateTimeEx.Create(StrToDateDef(sColumnas[Ord('I')], 0)),
                                 Sesion.UserID]);
          end;
        except
          on E: Exception do
            MsgBox(E.Message);
        end;

        Inc(iRow);
        progress.StepIt;
        if (iRow mod 20) = 0 then
          Forms.Application.ProcessMessages;

        for iLoop := Ord('A') to Ord('I') do
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


function TfrmManIncidenciaInItinere.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := -1;

  Sql.Clear;
  Sql.TableName := 'afi.aii_incidenciainitinere';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId := sdqConsulta.FieldByName('ii_id').AsInteger;

    Sql.Fields.Add('ii_usubaja',   Sesion.UserID);
    Sql.Fields.Add('ii_fechabaja', SQL_DATETIME, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := 0;

      Sql.Fields.Add('ii_usualta',   Sesion.UserID);
      Sql.Fields.Add('ii_fechaalta', SQL_DATETIME, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId  := sdqConsulta.FieldByName('ii_id').AsInteger;

      Sql.Fields.Add('ii_usumodif',   Sesion.UserID);
      Sql.Fields.Add('ii_fechamodif', SQL_DATETIME, False);
    end;

    Sql.Fields.Add('ii_idactividad', fraCiiu.Value, False);
    Sql.Fields.Add('ii_leves',       edLeves.Value, dtNumber);
    Sql.Fields.Add('ii_graves',      edGraves.Value, dtNumber);
    Sql.Fields.Add('ii_totales',     edTotales.Value, dtNumber);
    Sql.Fields.Add('ii_mortales',    edMortales.Value, dtNumber);
    Sql.Fields.Add('ii_fechadesde',  edFechaDesde.Date);
    Sql.Fields.Add('ii_fechahasta',  edFechaHasta.Date);
  end;

  Sql.PrimaryKey.Add('ii_id', iId, True);

  try
    EjecutarSql(Sql.Sql);

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

procedure TfrmManIncidenciaInItinere.LoadControls;
begin
  with sdqConsulta do
  begin
    fraCiiu.Value     := FieldByName('ii_idactividad').AsInteger;
    edLeves.Value     := FieldByName('ii_leves').AsFloat;
    edGraves.Value    := FieldByName('ii_graves').AsFloat;
    edTotales.Value   := FieldByName('ii_totales').AsFloat;
    edMortales.Value  := FieldByName('ii_mortales').AsFloat;
    edFechaDesde.Date := FieldByName('ii_fechadesde').AsDateTime;
    edFechaHasta.Date := FieldByName('ii_fechahasta').AsDateTime;
  end;
end;

function TfrmManIncidenciaInItinere.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iLoop: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColumnas: Array[Ord('A')..Ord('I')] of String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
      for iLoop := Ord('A') to Ord('I') do
        sColumnas[iLoop] := Range[Chr(iLoop) + IntToStr(iLineNumber), Chr(iLoop) + IntToStr(iLineNumber)].Value2;

    if IsEmptyLine(sColumnas) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmManIncidenciaInItinere.IsEmptyLine(const aColumnas: Array of String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  for iLoop := Ord('A') to Ord('I') do
    if Trim(aColumnas[iLoop - Ord('A')]) <> '' then
      Exit;

  Result := True;
end;

function TfrmManIncidenciaInItinere.Validar: Boolean;
var
  sSql: string;
begin
  Verificar(fraCiiu.IsEmpty, fraCiiu, 'Debe seleccionar el C.I.I.U.');
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe ingresar la Fecha Desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe ingresar la Fecha Hasta.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.aii_incidenciainitinere' +
    ' WHERE ii_idactividad = :idactividad' +
      ' AND (   ii_fechahasta IS NULL' +
           ' OR (    (ii_fechadesde <= :fechadesde)' +
               ' AND (ii_fechahasta >= :fechahasta)))' +
      ' AND ii_fechabaja IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND ii_id <> ' + SqlValue(sdqConsulta.FieldByName('ii_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [fraCiiu.Value, TDateTimeEx.Create(edFechaDesde.Date), TDateTimeEx.Create(edFechaDesde.Date)]), edFechaDesde, 'Ya existe un período que comprende la fecha de inicio de vigencia.');

  Result := True;
end;

procedure TfrmManIncidenciaInItinere.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraCiiuBusqueda.Clear;
  edFechaDesdeBusqueda.Clear;
  edFechaHastaBusqueda.Clear;
end;

procedure TfrmManIncidenciaInItinere.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                       var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if not sdqConsulta.FieldByName('ii_fechabaja').IsNull then
    Afont.Color := clRed;
end;

procedure TfrmManIncidenciaInItinere.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ii_fechabaja').IsNull then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManIncidenciaInItinere.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('ii_fechabaja').IsNull then
    raise Exception.Create('El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmManIncidenciaInItinere.tbImportarClick(Sender: TObject);
begin
  fpImportar.ShowModal;
end;

procedure TfrmManIncidenciaInItinere.fpImportarBeforeShow(Sender: TObject);
begin
  edArchivo.Clear;
end;

procedure TfrmManIncidenciaInItinere.tbAgregarExcelClick(Sender: TObject);
begin
  OpenDialog.Title := 'Archivos de Incidencia de In Itinere';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfrmManIncidenciaInItinere.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo debe ser:' + #13 + #10 +
             '* Extensión: .XLS' + #13 + #10 +
             '* Encabezado: SI' + #13 + #10 +
             '* Las columnas A, B y C son solo de referencia y NO se importaran' + #13 + #10 +
             '* Columnas:' + #13 + #10 +
             '           A) Código' + #13 + #10 +
             '           B) CIIU' + #13 + #10 +
             '           C) Actividad' + #13 + #10 +
             '           D) Leves' + #13 + #10 +
             '           E) Graves' + #13 + #10 +
             '           F) Totales' + #13 + #10 +
             '           G) Mortales' + #13 + #10 +
             '           H) Fecha Desde' + #13 + #10 +
             '           I) Fecha Hasta'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmManIncidenciaInItinere.btnProcesarClick(Sender: TObject);
begin
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el Archivo a procesar.');

  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Verificando archivo...';
  fpProcesar.ShowModal;
end;

procedure TfrmManIncidenciaInItinere.btnCancelar2Click(Sender: TObject);
begin
  fpImportar.Close;
end;

procedure TfrmManIncidenciaInItinere.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

procedure TfrmManIncidenciaInItinere.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmManIncidenciaInItinere.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  ProcesarExcel;

  fpImportar.Close;
  tbRefrescarClick(nil);
end;

procedure TfrmManIncidenciaInItinere.RefreshData;
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT aii.*, ac_codigo, ac_descripcion' +
     ' FROM afi.aii_incidenciainitinere aii, cac_actividad' +
    ' WHERE ii_idactividad = ac_id';

  if fraCiiuBusqueda.IsSelected then
    sWhere := sWhere + ' AND ac_id = ' + SqlValue(fraCiiuBusqueda.Value);

  if not edFechaDesdeBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ii_fechadesde >= ' + SqlValue(edFechaDesdeBusqueda.Date);

  if not edFechaHastaBusqueda.IsEmpty then
    sWhere := sWhere + ' AND ii_fechahasta <= ' + SqlValue(edFechaHastaBusqueda.Date);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

end.
