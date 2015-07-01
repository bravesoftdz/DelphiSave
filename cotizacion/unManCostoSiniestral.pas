unit unManCostoSiniestral;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   15-12-2003
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox, unArtFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, CurrEdit, PatternEdit, IntEdit, unArtDBAwareFrame, JvExControls,
  JvComponent, JvSpecialProgress, OleServer, Excel2000, Variants;

type
  TfrmManCostoSiniestral = class(TfrmCustomGridABM)
    GroupBox7: TGroupBox;
    Label11: TLabel;
    fraActividad: TfraStaticActividad;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    fraDT_IDACTIVIDAD: TfraStaticActividad;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edDT_CONCIE10: TCurrencyEdit;
    Label6: TLabel;
    edDT_SINCIE10: TCurrencyEdit;
    edDT_FRECUENCIA: TCurrencyEdit;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    edDT_CANTEMPRESA: TIntEdit;
    edDT_CANTEMPRESACONSTRO: TIntEdit;
    GroupBox3: TGroupBox;
    edDT_COSTOMEDICO: TCurrencyEdit;
    Label1: TLabel;
    edDT_PRIMAPROMMERCADO: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    edPorcSalario: TCurrencyEdit;
    Label10: TLabel;
    edSalarioPromedio: TCurrencyEdit;
    tbImportar: TToolButton;
    fpImportar: TFormPanel;
    Label17: TLabel;
    edArchivo: TEdit;
    ToolBar2: TToolBar;
    tbAgregarExcel: TToolButton;
    tbVerFormato: TToolButton;
    btnProcesar: TButton;
    btnCancelar2: TButton;
    fpProcesar: TFormPanel;
    progress: TJvSpecialProgress;
    lbAccion: TLabel;
    btnCancelar3: TButton;
    OpenDialog: TOpenDialog;
    t1: TTimer;
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
    procedure tbVerFormatoClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure fpImportarBeforeShow(Sender: TObject);
    procedure tbAgregarExcelClick(Sender: TObject);
    procedure fpProcesarShow(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
  protected
    FCancelarProceso: Boolean;
    
    function DoABM: Boolean; override;
    function GetCountLineasExcel: Integer;
    function IsEmptyLine(const aColumnas: Array of String): Boolean;
    function StrToFloatDef(const aNumber: String; const aDefault: Extended): Extended;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure ProcesarExcel;
  public
  end;

var
  frmManCostoSiniestral: TfrmManCostoSiniestral;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion;

{$R *.DFM}

procedure TfrmManCostoSiniestral.ClearControls;
begin
  fraDT_IDACTIVIDAD.Clear;
  edDT_COSTOMEDICO.Clear;
  edDT_PRIMAPROMMERCADO.Clear;
  edDT_CONCIE10.Clear;
  edDT_SINCIE10.Clear;
  edDT_FRECUENCIA.Clear;
  edDT_CANTEMPRESA.Clear;
  edDT_CANTEMPRESACONSTRO.Clear;
end;

function TfrmManCostoSiniestral.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := 0;

  Sql.Clear;
  Sql.TableName := 'adt_datotarifador';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId  := sdqConsulta.FieldByName('dt_id').AsInteger;
    Sql.Fields.Add('dt_usubaja', Sesion.UserID);
    Sql.Fields.Add('dt_fechabaja', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := ValorSqlInteger('SELECT seq_adt_id.NEXTVAL FROM DUAL', 0);
      Sql.Fields.Add('dt_usualta', Sesion.UserID);
      Sql.Fields.Add('dt_fechaalta', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId := sdqConsulta.FieldByName('dt_id').AsInteger;
      Sql.Fields.Add('dt_usumodif', Sesion.UserID);
      Sql.Fields.Add('dt_fechamodif', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('dt_idactividad',        fraDT_IDACTIVIDAD.Value, False);
    Sql.Fields.Add('dt_costomedico',        edDT_COSTOMEDICO.Value, dtNumber);
    Sql.Fields.Add('dt_primaprommercado',   edDT_PRIMAPROMMERCADO.Value, dtNumber);
    Sql.Fields.Add('dt_porcsalario',        edPorcSalario.Value, dtNumber);
    Sql.Fields.Add('dt_salariopromedio',    edSalarioPromedio.Value, dtNumber);
    Sql.Fields.Add('dt_concie10',           edDT_CONCIE10.Value, dtNumber);
    Sql.Fields.Add('dt_sincie10',           edDT_SINCIE10.Value, dtNumber);
    Sql.Fields.Add('dt_frecuencia',         edDT_FRECUENCIA.Value, dtNumber);
    Sql.Fields.Add('dt_cantempresa',        edDT_CANTEMPRESA.Value, False);
    Sql.Fields.Add('dt_cantempresaconstro', edDT_CANTEMPRESACONSTRO.Value, False);
  end;

  Sql.PrimaryKey.Add('dt_id', iId, False);

  try
    EjecutarSql(Sql.Sql);
    Result := True;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TfrmManCostoSiniestral.LoadControls;
begin
  fraDT_IDACTIVIDAD.Value       := sdqConsulta.FieldByName('dt_idactividad').AsInteger;
  edDT_COSTOMEDICO.Value        := sdqConsulta.FieldByName('dt_costomedico').AsFloat;
  edDT_PRIMAPROMMERCADO.Value   := sdqConsulta.FieldByName('dt_primaprommercado').AsFloat;
  edPorcSalario.Value           := sdqConsulta.FieldByName('dt_porcsalario').AsFloat;
  edSalarioPromedio.Value       := sdqConsulta.FieldByName('dt_salariopromedio').AsFloat;
  edDT_CONCIE10.Value           := sdqConsulta.FieldByName('dt_concie10').AsFloat;
  edDT_SINCIE10.Value           := sdqConsulta.FieldByName('dt_sincie10').AsFloat;
  edDT_FRECUENCIA.Value         := sdqConsulta.FieldByName('dt_frecuencia').AsFloat;
  edDT_CANTEMPRESA.Value        := sdqConsulta.FieldByName('dt_cantempresa').AsInteger;
  edDT_CANTEMPRESACONSTRO.Value := sdqConsulta.FieldByName('dt_cantempresaconstro').AsInteger;
end;

function TfrmManCostoSiniestral.Validar: Boolean;
var
  sSql: String;
begin
  Result := True;
  
  Verificar(fraDT_IDACTIVIDAD.IsEmpty, fraDT_IDACTIVIDAD.edCodigo, 'El CIIU es un campo obligatorio.');
  Verificar((edDT_CANTEMPRESA.Value <= 0), edDT_CANTEMPRESA, 'La cantidad de empresas debe ser superior a cero.');
  Verificar((edDT_CANTEMPRESACONSTRO.Value <= 0), edDT_CANTEMPRESACONSTRO, 'La cantidad de empresas con siniestro debe ser superior a cero.');
  Verificar((edDT_CANTEMPRESACONSTRO.Value > edDT_CANTEMPRESA.Value), edDT_CANTEMPRESACONSTRO, 'La cantidad de empresas con siniestro debe ser inferior a la cantidad total de empresas.');

  sSql :=
    'SELECT 1' +
     ' FROM adt_datotarifador' +
    ' WHERE dt_idactividad = :idactividad' +
      ' AND dt_fechabaja IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND dt_id <> ' + SqlValue(sdqConsulta.FieldByName('dt_id').AsInteger);
  Verificar(ExisteSqlEx(sSql, [fraDT_IDACTIVIDAD.Value]), fraDT_IDACTIVIDAD.edCodigo, 'Ya existe un registro que corresponde a este CIIU.');
end;

procedure TfrmManCostoSiniestral.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT dt_id, dt_idactividad, ac_descripcion, ac_codigo, dt_costomedico, dt_cantempresa, dt_cantempresaconstro,' +
          ' dt_sincie10, dt_concie10, dt_frecuencia, dt_primaprommercado, dt_porcsalario, dt_salariopromedio,' +
          ' dt_fechabaja' +
     ' FROM adt_datotarifador, cac_actividad' +
    ' WHERE ac_id = dt_idactividad';
  sWhere := '';
  if fraActividad.IsSelected then
    sWhere := sWhere + ' AND ac_id = ' + SqlValue(fraActividad.Value);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManCostoSiniestral.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('dt_costomedico')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('dt_sincie10')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('dt_concie10')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('dt_primaprommercado')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('dt_porcsalario')).DisplayFormat := '% 0.000;-% 0.000';
  TFloatField(sdqConsulta.FieldByName('dt_salariopromedio')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('dt_frecuencia')).DisplayFormat := '% 0.000;-% 0.000';
end;

procedure TfrmManCostoSiniestral.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;
  tbImportar.Left := 239;
end;

procedure TfrmManCostoSiniestral.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraActividad.Clear;
end;

procedure TfrmManCostoSiniestral.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('dt_fechabaja').AsString <> '' then
    AFont.Color := clRed;
end;

procedure TfrmManCostoSiniestral.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('dt_fechabaja').AsString <> '' then
    raise Exception.Create('El registro ya ha sido dado de baja.');

  inherited;
end;

procedure TfrmManCostoSiniestral.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('dt_fechabaja').AsString <> '' then
    raise Exception.Create('El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmManCostoSiniestral.tbImportarClick(Sender: TObject);
begin
  fpImportar.ShowModal;
end;

procedure TfrmManCostoSiniestral.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo debe ser:' + #13 + #10 +
             '* Extensión: .XLS' + #13 + #10 +
             '* Encabezado: SI' + #13 + #10 +
             '* Las columnas A, B y C son solo de referencia y NO se importaran' + #13 + #10 +
             '* Columnas:' + #13 + #10 +
             '           A) Código' + #13 + #10 +
             '           B) CIIU' + #13 + #10 +
             '           C) Actividad' + #13 + #10 +
             '           D) Total Emp.' + #13 + #10 +
             '           E) Emp. C/Siniestro' + #13 + #10 +
             '           F) Costo Médico' + #13 + #10 +
             '           G) Prima Mercado' + #13 + #10 +
             '           H) Prima como % Salario' + #13 + #10 +
             '           I) Salario Promedio' + #13 + #10 +
             '           J) Frecuencia' + #13 + #10 +
             '           K) Sin cie-10' + #13 + #10 +
             '           L) Con cie-10'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmManCostoSiniestral.btnProcesarClick(Sender: TObject);
begin
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el Archivo a procesar.');

  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Verificando archivo...';
  fpProcesar.ShowModal;
end;

procedure TfrmManCostoSiniestral.fpImportarBeforeShow(Sender: TObject);
begin
  edArchivo.Clear;
end;

procedure TfrmManCostoSiniestral.tbAgregarExcelClick(Sender: TObject);
begin
  OpenDialog.Title := 'Archivos de Mantenimiento de Costo Siniestral';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfrmManCostoSiniestral.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

procedure TfrmManCostoSiniestral.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmManCostoSiniestral.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  ProcesarExcel;

  fpImportar.Close;
  tbRefrescarClick(nil);
end;

procedure TfrmManCostoSiniestral.ProcesarExcel;
var
  iLCid: Integer;
  iLoop: Integer;
  iRow: Integer;
  sColumnas: Array[Ord('A')..Ord('L')] of String;
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
      for iLoop := Ord('A') to Ord('L') do
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
            'UPDATE adt_datotarifador' +
              ' SET dt_costomedico = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('F')], 0)) + ',' +
                  ' dt_cantempresa = ' + SqlInteger(StrToIntDef(sColumnas[Ord('D')], 0)) + ',' +
                  ' dt_cantempresaconstro = ' + SqlInteger(StrToIntDef(sColumnas[Ord('E')], 0)) + ',' +
                  ' dt_sincie10 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('K')], 0)) + ',' +
                  ' dt_concie10 = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('L')], 0)) + ',' +
                  ' dt_frecuencia = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('J')], 0)) + ',' +
                  ' dt_primaprommercado = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('G')], 0)) + ',' +
                  ' dt_usumodif = ' + SqlValue(Sesion.UserId) + ',' +
                  ' dt_fechamodif = SYSDATE,' +
                  ' dt_porcsalario = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('H')], 0)) + ',' +
                  ' dt_salariopromedio = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('I')], 0)) +
            ' WHERE dt_id = ' + SqlInteger(sColumnas[Ord('A')]);

          EjecutarSql(sSql);
        except
          on E: Exception do
            MsgBox(E.Message);
        end;

        Inc(iRow);
        progress.StepIt;
        if (iRow mod 20) = 0 then
          Forms.Application.ProcessMessages;

        for iLoop := Ord('A') to Ord('L') do
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

function TfrmManCostoSiniestral.IsEmptyLine(const aColumnas: Array of String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  for iLoop := Ord('A') to Ord('L') do
    if Trim(aColumnas[iLoop - Ord('A')]) <> '' then
      Exit;

  Result := True;
end;

function TfrmManCostoSiniestral.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iLoop: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColumnas: Array[Ord('A')..Ord('L')] of String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
      for iLoop := Ord('A') to Ord('L') do
        sColumnas[iLoop] := Range[Chr(iLoop) + IntToStr(iLineNumber), Chr(iLoop) + IntToStr(iLineNumber)].Value2;

    if IsEmptyLine(sColumnas) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

procedure TfrmManCostoSiniestral.btnCancelar2Click(Sender: TObject);
begin
  fpImportar.Close;
end;

function TfrmManCostoSiniestral.StrToFloatDef(const aNumber: String; const aDefault: Extended): Extended;
begin
  try
    try
      Result := StrToFloat(aNumber);
    except
      try
        Result := StrToFloat(StringReplace(aNumber, '.', ',', [rfReplaceAll]));
      except
        Result := StrToFloat(StringReplace(aNumber, ',', '.', [rfReplaceAll]));
      end;
    end;
  except
    Result := aDefault;
  end;
end;

end.
