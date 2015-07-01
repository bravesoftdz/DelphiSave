unit unManTarComercial2006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit,
  CurrEdit, DateComboBox, unArtFrame, unFraStaticCodigoDescripcion, unfraStaticActividad, unArtDBAwareFrame, PatternEdit, IntEdit, JvExControls, JvComponent,
  JvSpecialProgress, Excel2000, OleServer, Variants;

type
  TfrmManTarComercial2006 = class(TfrmCustomGridABM)
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
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edTrabajadoresDesde: TIntEdit;
    edTrabajadoresHasta: TIntEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edMinimo: TCurrencyEdit;
    edMaximo: TCurrencyEdit;
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
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edMinimo2: TCurrencyEdit;
    edMaximo2: TCurrencyEdit;
    GroupBox9: TGroupBox;
    Label15: TLabel;
    edFactor: TCurrencyEdit;
    Label16: TLabel;
    edFrecuencia: TCurrencyEdit;
    tbCiiuRev4: TToolButton;
    fpCiiuRev4: TFormPanel;
    GroupBox10: TGroupBox;
    Label17: TLabel;
    fraCiiu: TfraStaticActividad;
    Label18: TLabel;
    btnAceptar2: TButton;
    btnCancelar4: TButton;
    Bevel1: TBevel;
    edCiiuRev4: TIntEdit;
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
    procedure btnCancelar4Click(Sender: TObject);
    procedure tbCiiuRev4Click(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure fpCiiuRev4BeforeShow(Sender: TObject);
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
  frmManTarComercial2006: TfrmManTarComercial2006;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, VCLExtra, SqlFuncs, CustomDlgs, unSesion;

{$R *.DFM}

procedure TfrmManTarComercial2006.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: string;
begin
  sSql :=
    'SELECT tc_id, tc_idactividad, ac_descripcion, ac_codigo, tc_fechadesde, tc_fechahasta, tc_sumafija, tc_porcmasa, tc_usualta, tc_fechaalta, tc_usumodif,' +
          ' tc_fechamodif, tc_usubaja, tc_fechabaja, tc_trab_desde, tc_trab_hasta, tc_minimo, tc_minimo2, tc_maximo, tc_maximo2, tc_factor, tc_frecuencia' +
     ' FROM afi.atc_tarifacomercial2006, cac_actividad' +
    ' WHERE ac_id = tc_idactividad';

  if fraActividad.IsSelected then
    sWhere := sWhere + ' AND ac_id = ' + SqlValue(fraActividad.Value);

  if not edVigenciaDesde.IsEmpty then
    sWhere := sWhere + ' AND tc_fechadesde >= ' + SqlValue(edVigenciaDesde.Date);

  if not edVigenciaHasta.IsEmpty then
    sWhere := sWhere + ' AND tc_fechahasta <= ' + SqlValue(edVigenciaHasta.Date);
    
  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManTarComercial2006.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('tc_sumafija')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('tc_porcmasa')).DisplayFormat := '% 0.000;-% 0.000';
end;

procedure TfrmManTarComercial2006.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;

  tbImportar.Left := 239;
  tbCiiuRev4.Left := 239;
end;

procedure TfrmManTarComercial2006.ClearControls;
begin
  fraTC_IDACTIVIDAD.Clear;
  edTC_SUMAFIJA.Clear;
  edTC_PORCMASA.Clear;
  edTC_FECHADESDE.Clear;
  edTC_FECHAHASTA.Clear;
  edTrabajadoresDesde.Clear;
  edTrabajadoresHasta.Clear;
  edMinimo.Clear;
  edMaximo.Clear;
  edMinimo2.Clear;
  edMaximo2.Clear;
  edFactor.Clear;
  edFrecuencia.Clear;

  VCLExtra.LockControls(edTC_FECHADESDE, False);
end;

procedure TfrmManTarComercial2006.ProcesarExcel;
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
          sSql := 'UPDATE AFI.ATC_TARIFACOMERCIAL2006' +
                    ' SET TC_SUMAFIJA = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('D')], 0)) + ',' +
                        ' TC_PORCMASA = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('E')], 0)) + ',' +
                        ' TC_FECHADESDE = ' + SqlDate(StrToDateDef(sColumnas[Ord('F')], 0)) + ',' +
                        ' TC_FECHAHASTA = ' + SqlDate(StrToDateDef(sColumnas[Ord('G')], 0)) + ',' +
                        ' TC_TRAB_DESDE = ' + SqlInteger(StrToIntDef(sColumnas[Ord('H')], 0)) + ',' +
                        ' TC_TRAB_HASTA = ' + SqlInteger(StrToIntDef(sColumnas[Ord('I')], 0)) + ',' +
                        ' TC_MINIMO = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('J')], 0)) + ',' +
                        ' TC_MAXIMO = ' + SqlNumber(StrToFloatDef(sColumnas[Ord('K')], 0)) + ',' +
                        ' TC_USUMODIF = ' + SqlValue(Sesion.UserId) + ',' +
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


function TfrmManTarComercial2006.DoABM: Boolean;
var
  fID: String;
begin
  BeginTrans;
  Sql.Clear;
  Sql.TableName := 'AFI.ATC_TARIFACOMERCIAL2006';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    fID := sdqConsulta.FieldByName('TC_ID').AsString;
    Sql.Fields.Add('TC_USUBAJA',   Sesion.UserID);
    Sql.Fields.Add('TC_FECHABAJA', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      fID  := ValorSql('SELECT SEQ_ATC_ID.NEXTVAL FROM DUAL', '0');
      Sql.Fields.Add('TC_USUALTA',   Sesion.UserID);
      Sql.Fields.Add('TC_FECHAALTA', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      fID  := sdqConsulta.FieldByName('TC_ID').AsString;
      Sql.Fields.Add('TC_USUMODIF',   Sesion.UserID);
      Sql.Fields.Add('TC_FECHAMODIF', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('TC_IDACTIVIDAD', fraTC_IDACTIVIDAD.Value, False);
    Sql.Fields.Add('TC_SUMAFIJA',    edTC_SUMAFIJA.Value, dtNumber);
    Sql.Fields.Add('TC_PORCMASA',    edTC_PORCMASA.Value, dtNumber);
    Sql.Fields.Add('TC_FECHADESDE',  edTC_FECHADESDE.Date);
    Sql.Fields.Add('TC_FECHAHASTA',  edTC_FECHAHASTA.Date);
    Sql.Fields.Add('TC_TRAB_DESDE',  edTrabajadoresDesde.Value);
    Sql.Fields.Add('TC_TRAB_HASTA',  edTrabajadoresHasta.Value);
    Sql.Fields.Add('TC_MINIMO',      edMinimo.Value);
    Sql.Fields.Add('TC_MAXIMO',      edMaximo.Value);
    Sql.Fields.Add('TC_MINIMO2',     edMinimo2.Value);
    Sql.Fields.Add('TC_MAXIMO2',     edMaximo2.Value);
    Sql.Fields.Add('TC_FACTOR',      edFactor.Value);
    Sql.Fields.Add('TC_FRECUENCIA',  edFrecuencia.Value);
  end;

  Sql.PrimaryKey.Add('TC_ID', fID, False);

  try
    EjecutarSqlSt( Sql.Sql );
    result := True;
    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      RollBack;
      Raise Exception.Create( E.Message );
    end;
  end;
end;

procedure TfrmManTarComercial2006.LoadControls;
begin
  with sdqConsulta do
  begin
    fraTC_IDACTIVIDAD.Value   := FieldByName('TC_IDACTIVIDAD').AsInteger;
    edTC_SUMAFIJA.Value       := FieldByName('TC_SUMAFIJA').AsFloat;
    edTC_PORCMASA.Value       := FieldByName('TC_PORCMASA').AsFloat;
    edTC_FECHADESDE.Date      := FieldByName('TC_FECHADESDE').AsDateTime;
    edTC_FECHAHASTA.Date      := FieldByName('TC_FECHAHASTA').AsDateTime;
    edTrabajadoresDesde.Value := FieldByName('TC_TRAB_DESDE').AsInteger;
    edTrabajadoresHasta.Value := FieldByName('TC_TRAB_HASTA').AsInteger;
    edMinimo.Value            := FieldByName('TC_MINIMO').AsFloat;
    edMaximo.Value            := FieldByName('TC_MAXIMO').AsFloat;
    edMinimo2.Value           := FieldByName('TC_MINIMO2').AsFloat;
    edMaximo2.Value           := FieldByName('TC_MAXIMO2').AsFloat;
    edFactor.Value            := FieldByName('TC_FACTOR').AsFloat;
    edFrecuencia.Value        := FieldByName('TC_FRECUENCIA').AsFloat;
  end;

  VCLExtra.LockControls(edTC_FECHADESDE, True);
end;

function TfrmManTarComercial2006.GetCountLineasExcel: Integer;
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

function TfrmManTarComercial2006.IsEmptyLine(const aColumnas: Array of String): Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  for iLoop := Ord('A') to Ord('K') do
    if Trim(aColumnas[iLoop - Ord('A')]) <> '' then
      Exit;

  Result := True;
end;

function TfrmManTarComercial2006.Validar: Boolean;
var
  sSql: string;
begin
  Verificar(fraTC_IDACTIVIDAD.IsEmpty, fraTC_IDACTIVIDAD, 'El CIIU es un campo obligatorio.');
//  Verificar(edTC_SUMAFIJA.Value <= 0, edTC_SUMAFIJA, 'La suma fija debe ser superior a cero.');
//  Verificar(edTC_PORCMASA.Value <= 0, edTC_PORCMASA, 'El porcentaje variable debe ser superior a cero.');
  Verificar(edTC_FECHADESDE.IsEmpty, edTC_FECHADESDE, 'La fecha de inicio de vigencia es un campo obligatorio.');

  sSql := 'SELECT 1 ' +
          '  FROM AFI.ATC_TARIFACOMERCIAL2006 ' +
          ' WHERE TC_IDACTIVIDAD = ' + SqlValue (fraTC_IDACTIVIDAD.Value) +
          '   AND (TC_FECHAHASTA IS NULL OR ((TC_FECHADESDE <= ' + SqlValue(edTC_FECHADESDE.Date) + ') AND ' +
          '                                  (TC_FECHAHASTA >= ' + SqlValue(edTC_FECHADESDE.Date) + ' )))' +
          '   AND TC_FECHABAJA IS NULL';
  if modoABM <> maAlta then
    sSql := sSql + ' AND TC_ID <> ' + sdqConsulta.FieldByName('TC_ID').AsString;
  Verificar(ExisteSql(sSql), edTC_FECHADESDE, 'Ya existe un período que comprende la fecha de inicio de vigencia.');
  Result := True;
end;

procedure TfrmManTarComercial2006.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraActividad.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
end;

procedure TfrmManTarComercial2006.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('TC_FECHABAJA').AsString <> '' then
    Afont.Color := clRed;
end;

procedure TfrmManTarComercial2006.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('TC_FECHABAJA').AsString <> '' then
    raise Exception.Create( 'El registro ya ha sido dado de baja');
  inherited;
end;

procedure TfrmManTarComercial2006.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('TC_FECHABAJA').AsString <> '' then
    raise Exception.Create( 'El registro ha sido dado de baja');
  inherited;
end;

procedure TfrmManTarComercial2006.tbImportarClick(Sender: TObject);
begin
  fpImportar.ShowModal;
end;

procedure TfrmManTarComercial2006.fpImportarBeforeShow(Sender: TObject);
begin
  edArchivo.Clear;
end;

procedure TfrmManTarComercial2006.tbAgregarExcelClick(Sender: TObject);
begin
  OpenDialog.Title := 'Archivos de Mantenimiento de Costo Siniestral';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

procedure TfrmManTarComercial2006.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo debe ser:' + #13 + #10 +
             '* Extensión: .XLS' + #13 + #10 +
             '* Encabezado: SI' + #13 + #10 +
             '* Las columnas A, B y C son solo de referencia y NO se importaran' + #13 + #10 +
             '* Columnas:' + #13 + #10 +
             '           A) Código' + #13 + #10 +
             '           B) CIIU' + #13 + #10 +
             '           C) Actividad' + #13 + #10 +
             '           D) Suma Fija' + #13 + #10 +
             '           E) Porc. Variable' + #13 + #10 +
             '           F) Fecha Desde' + #13 + #10 +
             '           G) Fecha Hasta' + #13 + #10 +
             '           H) Trabajador Desde' + #13 + #10 +
             '           I) Trabajador Hasta' + #13 + #10 +
             '           J) Mínimo' + #13 + #10 +
             '           K) Máximo'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmManTarComercial2006.btnProcesarClick(Sender: TObject);
begin
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el Archivo a procesar.');

  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Verificando archivo...';
  fpProcesar.ShowModal;
end;

procedure TfrmManTarComercial2006.btnCancelar2Click(Sender: TObject);
begin
  fpImportar.Close;
end;

procedure TfrmManTarComercial2006.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

procedure TfrmManTarComercial2006.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmManTarComercial2006.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  ProcesarExcel;

  fpImportar.Close;
  tbRefrescarClick(nil);
end;

procedure TfrmManTarComercial2006.btnCancelar4Click(Sender: TObject);
begin
  fpCiiuRev4.Close;
end;

procedure TfrmManTarComercial2006.tbCiiuRev4Click(Sender: TObject);
begin
  fpCiiuRev4.ShowModal;
end;

procedure TfrmManTarComercial2006.btnAceptar2Click(Sender: TObject);
var
  iIdCiiuRev4: Integer;
  sSql: String;
begin
  Verificar(fraCiiu.IsEmpty, fraCiiu.edCodigo, 'Debe seleccionar el CIIU.');
  Verificar(edCiiuRev4.IsEmpty, edCiiuRev4, 'Debe seleccionar el CIIU Rev4.');

  sSql :=
    'SELECT 1' +
     ' FROM cac_actividad' +
    ' WHERE ac_codigo = :codigo';
  Verificar(ExisteSqlEx(sSql, [edCiiuRev4.Text]), edCiiuRev4, 'El CIIU Rev4 ya existe en la tabla.');


  BeginTrans;
  try
    // Inserto en la cac_actividad..
    sSql :=
      'INSERT INTO cac_actividad' +
                 ' (ac_autocotiza, ac_codigo, ac_cotizable, ac_descripcion, ac_descripcionok, ac_excluido, ac_fechaalta, ac_financiera,' +
                  ' ac_id, ac_idcategoriariesgo, ac_idtiporiesgo, ac_porgen, ac_relacion, ac_revision, ac_rural, ac_usualta)' +
       ' SELECT ac_autocotiza, :codigonuevo, ac_cotizable, ac_descripcion, ac_descripcionok, ac_excluido, SYSDATE, ac_financiera,' +
              ' (SELECT MAX(ac_id) + 1' +
                 ' FROM cac_actividad), ac_idcategoriariesgo, ac_idtiporiesgo, ac_porgen, :relacion, 4, ac_rural, :usualta' +
         ' FROM cac_actividad' +
        ' WHERE ac_codigo = :codigoviejo';
    EjecutarSqlSTEx(sSql, [edCiiuRev4.Text, fraCiiu.Codigo, Sesion.UserID, fraCiiu.Codigo]);

    // Traigo el id del registro insertado..
    sSql :=
      'SELECT ac_id' +
       ' FROM cac_actividad' +
      ' WHERE ac_codigo = :codigo';
    iIdCiiuRev4 := ValorSqlIntegerEx(sSql, [edCiiuRev4.Text]);


    // Inserto en la afi.atc_tarifacomercial2006..
    sSql :=
      'INSERT INTO afi.atc_tarifacomercial2006' +
                 ' (tc_factor, tc_fechaalta, tc_fechadesde, tc_fechahasta, tc_frecuencia, tc_id, tc_idactividad, tc_maximo, tc_minimo,' +
                  ' tc_maximo2, tc_minimo2, tc_porcmasa, tc_sumafija, tc_trab_desde, tc_trab_hasta, tc_usualta)' +
       ' SELECT tc_factor, SYSDATE, tc_fechadesde, tc_fechahasta, tc_frecuencia, seq_atc_id.NEXTVAL, :idactividadnueva, tc_maximo,' +
              ' tc_minimo, tc_maximo2, tc_minimo2, tc_porcmasa, tc_sumafija, tc_trab_desde, tc_trab_hasta, :usualta' +
         ' FROM afi.atc_tarifacomercial2006' +
        ' WHERE tc_fechabaja IS NULL' +
          ' AND tc_fechahasta = TO_DATE(''31/12/2999'', ''dd/mm/yyyy'')' +
          ' AND tc_idactividad = :idactividadvieja';
    EjecutarSqlSTEx(sSql, [iIdCiiuRev4, Sesion.UserID, fraCiiu.Value]);

    // Inserto en la ats_tarifassn..
    sSql :=
      'INSERT INTO ats_tarifassn' +
                 ' (ts_fechaalta, ts_fechadesde, ts_fechahasta, ts_id, ts_idactividad, ts_porce1, ts_porce2, ts_porce3, ts_porce4,' +
                  ' ts_tarifa1, ts_tarifa2, ts_tarifa3, ts_tarifa4, ts_usualta)' +
       ' SELECT SYSDATE, ts_fechadesde, ts_fechahasta, seq_ats_id.NEXTVAL, :idactividadnuevo, ts_porce1, ts_porce2, ts_porce3,' +
              ' ts_porce4, ts_tarifa1, ts_tarifa2, ts_tarifa3, ts_tarifa4, :usualta' +
         ' FROM ats_tarifassn' +
        ' WHERE ts_idactividad = :idactividadviejo' +
          ' AND ts_fechahasta IS NULL';
    EjecutarSqlSTEx(sSql, [iIdCiiuRev4, Sesion.UserID, fraCiiu.Value]);

    // Inserto en la cpa_parametrosactividad..
    sSql :=
      'INSERT INTO cpa_parametrosactividad' +
                 ' (pa_id, pa_idactividad, pa_especiesfrecvalorcartera, pa_especiesespvalorcartera, pa_iltfrecvalorcartera,' +
                  ' pa_iltespvalorcartera, pa_iltprestvalorcartera, pa_incap050frecvalorcartera, pa_incap050espvalorcartera,' +
                  ' pa_incap050iltvalorcartera, pa_incap050incapvalorcartera, pa_incap5066frecvalorcartera,' +
                  ' pa_incap5066espvalorcartera, pa_incap5066iltvalorcartera, pa_incap5066incapvalorcartera,' +
                  ' pa_incap66100frecvalorcartera, pa_incap66100espvalorcartera, pa_incap66100iltvalorcartera,' +
                  ' pa_incap66100incapvalorcartera, pa_muertefrecvalorcartera, pa_muerteespvalorcartera, pa_muerteiltvalorcartera,' +
                  ' pa_muerteincapvalorcartera, pa_juiciosfrecvalorcartera, pa_fechadesde, pa_fechahasta, pa_usualta, pa_fechaalta)' +
       ' SELECT seq_cpa_param_id.NEXTVAL, :idactividadnuevo, pa_especiesfrecvalorcartera, pa_especiesespvalorcartera,' +
              ' pa_iltfrecvalorcartera, pa_iltespvalorcartera, pa_iltprestvalorcartera, pa_incap050frecvalorcartera,' +
              ' pa_incap050espvalorcartera, pa_incap050iltvalorcartera, pa_incap050incapvalorcartera, pa_incap5066frecvalorcartera,' +
              ' pa_incap5066espvalorcartera, pa_incap5066iltvalorcartera, pa_incap5066incapvalorcartera, pa_incap66100frecvalorcartera,' +
              ' pa_incap66100espvalorcartera, pa_incap66100iltvalorcartera, pa_incap66100incapvalorcartera, pa_muertefrecvalorcartera,' +
              ' pa_muerteespvalorcartera, pa_muerteiltvalorcartera, pa_muerteincapvalorcartera, pa_juiciosfrecvalorcartera,' +
              ' pa_fechadesde, pa_fechahasta, :usualta, SYSDATE' +
         ' FROM cpa_parametrosactividad' +
        ' WHERE pa_fechahasta = TO_DATE(''31/12/2999'', ''dd/mm/yyyy'')' +
          ' AND pa_idactividad = :idactividadviejo';
    EjecutarSqlSTEx(sSql, [iIdCiiuRev4, Sesion.UserID, fraCiiu.Value]);

    // Inserto en la hys.hee_estimacionestab..
    sSql :=
      'INSERT INTO hys.hee_estimacionestab' +
                 ' (ee_cantestab, ee_capitasdesde, ee_capitashasta, ee_ciiu, ee_fechaalta, ee_id, ee_usualta)' +
       ' SELECT ee_cantestab, ee_capitasdesde, ee_capitashasta, :ciiunuevo, SYSDATE, hys.seq_hee_estimacion_id.NEXTVAL, :usualta' +
         ' FROM hys.hee_estimacionestab' +
        ' WHERE ee_fechabaja IS NULL' +
          ' AND ee_ciiu = :ciiuviejo';
    EjecutarSqlSTEx(sSql, [edCiiuRev4.Text, Sesion.UserID, fraCiiu.Codigo]);

    // Inserto en la hys.hch_cotizacionhys..
    sSql :=
      'INSERT INTO hys.hch_cotizacionhys' +
                 ' (ch_costo, ch_fechaalta, ch_id, ch_idactividad, ch_idestudio, ch_porcentaje, ch_usualta)' +
       ' SELECT ch_costo, sysdate, HYS.SEQ_HCH_ID.nextval, :idactividadnueva, ch_idestudio, ch_porcentaje, :usualta' +
         ' FROM hys.hch_cotizacionhys' +
        ' WHERE ch_fechabaja IS NULL' +
          ' AND ch_idactividad = :idactividadvieja';
    EjecutarSqlSTEx(sSql, [iIdCiiuRev4, Sesion.UserID, fraCiiu.Value]);

    // Inserto en la adt_datotarifador..
    sSql :=
      'INSERT INTO adt_datotarifador' +
                 ' (dt_cantempresa, dt_cantempresaconstro, dt_concie10, dt_costomedico, dt_fechaalta, dt_frecuencia, dt_id, dt_idactividad, dt_porcsalario, dt_primaprommercado, dt_salariopromedio, dt_sincie10, dt_usualta)' +
       ' SELECT dt_cantempresa, dt_cantempresaconstro, dt_concie10, dt_costomedico, sysdate, dt_frecuencia, seq_adt_id.NEXTVAL, :idactividadnueva, dt_porcsalario, dt_primaprommercado, dt_salariopromedio, dt_sincie10, :usualta' +
         ' FROM adt_datotarifador' +
        ' WHERE dt_fechabaja IS NULL' +
          ' AND dt_idactividad = :idactividadvieja';
    EjecutarSqlSTEx(sSql, [iIdCiiuRev4, Sesion.UserID, fraCiiu.Value]);

    // Inserto en la afi.acu_ciiususpendidoauto..
    sSql :=
      'INSERT INTO afi.acu_ciiususpendidoauto' +
                 ' (cu_capitas, cu_fechaalta, cu_fechadesde, cu_fechahasta, cu_idactividad, cu_observaciones, cu_usualta)' +
       ' SELECT cu_capitas, SYSDATE, cu_fechadesde, cu_fechahasta, :idactividadnueva, cu_observaciones, :usualta' +
         ' FROM afi.acu_ciiususpendidoauto' +
        ' WHERE cu_fechabaja IS NULL' +
          ' AND cu_idactividad = :idactividadvieja';
    EjecutarSqlSTEx(sSql, [iIdCiiuRev4, Sesion.UserID, fraCiiu.Value]);

    CommitTrans;

    // Recargo el combo de la búsqueda..
    fraActividad.Refresh;

    MsgBox('El cambio fue realizado correctamente.');
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;


  fpCiiuRev4.Close;
end;

procedure TfrmManTarComercial2006.fpCiiuRev4BeforeShow(Sender: TObject);
begin
  fraCiiu.Clear;
  edCiiuRev4.Clear;
end;

end.
