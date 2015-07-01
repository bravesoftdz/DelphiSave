unit unManEquipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, PatternEdit, IntEdit,
  unArtFrame, unfraUsuarios, JvExControls, JvComponent, JvXPCore,
  JvXPCheckCtrls, CheckLst, ARTCheckListBox, AdvGroupBox, AdvOfficeButtons,
  JvExExtCtrls, JvNavigationPane, RxPlacemnt, RxToolEdit, DateComboBox;

type
  TfrmManEquipos = class(TfrmCustomGridABM)
    sdqConsultaEQ_ID: TFloatField;
    sdqConsultaEQ_DESCRIPCION: TStringField;
    sdqConsultaEQ_IP: TStringField;
    sdqConsultaEQ_ENCENDIDO: TStringField;
    sdqConsultaEQ_SERVIDOR: TStringField;
    sdqConsultaEQ_OBSERVACIONES: TStringField;
    ShortCutControlHijo: TShortCutControl;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaTIPO: TFloatField;
    sdqConsultaEQ_COMMENT: TStringField;
    sdqConsultaEQ_LASTLOGON: TStringField;
    sdqConsultaEQ_MEMORIA: TFloatField;
    sdqConsultaEQ_CPU: TStringField;
    sdqConsultaEQ_SYSOP: TStringField;
    sdqConsultaEQ_SYSOP_VER: TStringField;
    sdqConsultaEQ_SYSOP_SERVICEPACK: TStringField;
    sdqConsultaEQ_SYSOP_BUILD: TStringField;
    sdqConsultaEQ_SCREEN_WIDTH: TFloatField;
    sdqConsultaEQ_SCREEN_HEIGHT: TFloatField;
    sdqConsultaEQ_SCREEN_BITSPERPIXEL: TStringField;
    sdqConsultaEQ_SCREEN_HZ: TFloatField;
    sdqConsultaEQ_USUALTA: TStringField;
    sdqConsultaEQ_FECHAALTA: TDateTimeField;
    sdqConsultaEQ_USUMODIF: TStringField;
    sdqConsultaEQ_FECHAMODIF: TDateTimeField;
    sdqConsultaEQ_USUBAJA: TStringField;
    sdqConsultaEQ_FECHABAJA: TDateTimeField;
    sdqConsultaSE_USUARIO: TStringField;
    sdqDiscos: TSDQuery;
    dsDiscos: TDataSource;
    sdqDiscosED_UNIDAD: TStringField;
    sdqDiscosED_ETIQUETA: TStringField;
    sdqDiscosED_ESPACIOTOTAL: TStringField;
    sdqDiscosED_ESPACIOOCUPADO: TStringField;
    sdqDiscosED_ESPACIOLIBRE: TStringField;
    sdqDiscosED_ESPACIOLIBRE_MB: TFloatField;
    sdqDiscosED_ESPACIOTOTAL_MB: TFloatField;
    sdqDiscosPORC_LIBRE: TFloatField;
    sdqConsultaPROBLEMA_DE_DISCO: TStringField;
    sdqConsultaNUM_SYSOP: TFloatField;
    sdqConsultaVERSION: TFloatField;
    sdqConsultaRESOLUCION: TFloatField;
    sdqConsultaHZ: TFloatField;
    sdqConsultaBITS: TFloatField;
    sdqConsultaPROGRAMAS: TFloatField;
    pcPaginas: TPageControl;
    tsGeneral: TTabSheet;
    tsSoftwareInstalado: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edEQ_DESCRIPCION2: TEdit;
    mskEQ_IP: TMaskEdit;
    chkEQ_ENCENDIDO: TCheckBox;
    chkEQ_SERVIDOR: TCheckBox;
    edEQ_OBSERVACIONES: TMemo;
    edEQ_ID: TIntEdit;
    edEQ_COMMENT: TEdit;
    edEQ_LASTLOGON: TEdit;
    edEQ_MEMORIA: TIntEdit;
    edEQ_CPU: TEdit;
    edEQ_SYSOP: TEdit;
    edEQ_SYSOP_VER: TEdit;
    edEQ_SYSOP_BUILD: TEdit;
    edEQ_SCREEN_WIDTH: TIntEdit;
    edEQ_SCREEN_HEIGHT: TIntEdit;
    edEQ_SCREEN_HZ: TIntEdit;
    edEQ_SCREEN_BITSPERPIXEL: TIntEdit;
    dbgDiscos: TRxDBGrid;
    dbgSoftwareInstalado: TArtDBGrid;
    sdqSoftwareInstalado: TSDQuery;
    dsSoftwareInstalado: TDataSource;
    pnlBottom: TPanel;
    sdqConsultaCANT_PROGRAMAS: TStringField;
    JvOutlookSplitterr: TJvOutlookSplitter;
    pcFiltros: TPageControl;
    tsPrincipal: TTabSheet;
    tsSoftware: TTabSheet;
    tsSesionOracle: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edEQ_DESCRIPCION: TEdit;
    fraSE_USUARIO: TfraUsuario;
    cmbTIPO: TComboBox;
    edEQ_MEMORIADesde: TIntEdit;
    edEQ_MEMORIAHasta: TIntEdit;
    chkBajas: TJvXPCheckbox;
    chkProblemaDeDisco: TJvXPCheckbox;
    cmbRESOLUCION: TComboBox;
    cmbBITS: TComboBox;
    cmbHZ: TComboBox;
    cmbNUM_SYSOP: TComboBox;
    cmbVERSION: TComboBox;
    rgEquiposPorUsuario: TAdvOfficeRadioGroup;
    clbProgramas: TARTCheckListBox;
    rbTodos: TRadioButton;
    rbAlMenosUno: TRadioButton;
    rbNoInstalado: TRadioButton;
    pnlParameter: TPanel;
    rbTodosParam: TRadioButton;
    rbAlMenosUnParam: TRadioButton;
    rbTodosMenosParam: TRadioButton;
    clbParametros: TARTCheckListBox;
    Panel1: TPanel;
    clbValores: TARTCheckListBox;
    Label26: TLabel;
    rbTodoValor: TRadioButton;
    rbAlMenosUnValor: TRadioButton;
    rbNingunValor: TRadioButton;
    Label27: TLabel;
    edEQ_COMMENT_FULL_LIKE: TEdit;
    tsParametros: TTabSheet;
    dbgParametrosOracle: TArtDBGrid;
    sdqParametrosOracle: TSDQuery;
    dsParametrosOracle: TDataSource;
    edEQ_FECHAMODIFHasta: TDateComboBox;
    Label28: TLabel;
    edEQ_FECHAMODIFDesde: TDateComboBox;
    Label29: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqDiscosAfterOpen(DataSet: TDataSet);
    procedure dbgDiscosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqSoftwareInstaladoAfterOpen(DataSet: TDataSet);
    procedure fpAbmShow(Sender: TObject);
    procedure tsSesionOracleResize(Sender: TObject);
    procedure sdqParametrosOracleAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  public
    procedure RefreshData; override;

    procedure ClearData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
    function  DoABM: Boolean; override;
  end;

var
  frmManEquipos: TfrmManEquipos;

implementation

uses
  unFiltros, CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal, General, unArt,
  VCLExtra, Strfuncs, unGrids, Math, unSesion;

{$R *.dfm}

{ TfrmManEquipos }

procedure TfrmManEquipos.ClearControls;
begin
  edEQ_ID.Value := ValorSQLInteger('SELECT MAX(EQ_ID) + 1 FROM COMPUTOS.CEQ_EQUIPO');
  edEQ_DESCRIPCION2.Clear;
  mskEQ_IP.Clear;
  edEQ_OBSERVACIONES.Clear;
  chkEQ_SERVIDOR.Checked := False;

  edEQ_COMMENT.Clear;
  edEQ_LASTLOGON.Clear;
  edEQ_MEMORIA.Clear;
  edEQ_CPU.Clear;
  edEQ_SYSOP.Clear;
  edEQ_SYSOP_VER.Clear;
  edEQ_SYSOP_BUILD.Clear;
  edEQ_SCREEN_WIDTH.Clear;
  edEQ_SCREEN_HEIGHT.Clear;
  edEQ_SCREEN_HZ.Clear;
  edEQ_SCREEN_BITSPERPIXEL.Clear;

  sdqDiscos.Close;
  sdqSoftwareInstalado.Close;

  VCLExtra.LockControls([edEQ_ID, chkEQ_ENCENDIDO, edEQ_COMMENT, edEQ_LASTLOGON, edEQ_MEMORIA,
                         edEQ_CPU, edEQ_SYSOP, edEQ_SYSOP_VER, edEQ_SYSOP_BUILD,
                         edEQ_SCREEN_WIDTH, edEQ_SCREEN_HEIGHT, edEQ_SCREEN_HZ, edEQ_SCREEN_BITSPERPIXEL], True);
end;

procedure TfrmManEquipos.ClearData;
begin
  cmbTIPO.ItemIndex := -1;
  cmbNUM_SYSOP.ItemIndex := -1;
  cmbVERSION.ItemIndex := -1;
  cmbHZ.ItemIndex := -1;
  cmbBITS.ItemIndex := -1;
  cmbRESOLUCION.ItemIndex := -1;
  chkProblemaDeDisco.Checked := False;
  rgEquiposPorUsuario.ItemIndex := 0;
  chkBajas.Checked := True;
  pnlBottom.Caption := '';
  ClearComponentData(pnlFiltros);
end;

function TfrmManEquipos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'COMPUTOS.CEQ_EQUIPO';

  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('EQ_ID', sdqConsulta.FieldByName('EQ_ID').AsInteger, False);
      Sql.Fields.Add('EQ_FECHABAJA', exDateTime);
      Sql.Fields.Add('EQ_USUBAJA', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end else
    begin
      if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Add('EQ_ID', ValorSQLInteger('SELECT MAX(EQ_ID) + 1 FROM COMPUTOS.CEQ_EQUIPO'), False);
          Sql.Fields.Add('EQ_FECHAALTA', exDateTime);
          Sql.Fields.Add('EQ_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
        end
      else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.AddInteger('EQ_ID', edEQ_ID.Value, False);
          Sql.Fields.Add('EQ_FECHAMODIF', exDateTime);
          Sql.Fields.Add('EQ_USUMODIF', Sesion.UserID);
          Sql.Fields.Add('EQ_FECHABAJA', exNull);
          Sql.Fields.Add('EQ_USUBAJA', exNull);
          Sql.SqlType := stUpdate;
        end;

      Sql.Fields.Add('EQ_IP', StringReplace(mskEQ_IP.Text, ' ', '', [rfReplaceAll]));
      Sql.Fields.Add('EQ_DESCRIPCION', UpperCase(edEQ_DESCRIPCION2.Text));
      Sql.Fields.Add('EQ_OBSERVACIONES', UpperCase(edEQ_OBSERVACIONES.Lines.Text));      
      Sql.Fields.AddString('EQ_SERVIDOR', VarToStr(IIF(chkEQ_SERVIDOR.Checked, 'S', 'N')));
      Sql.Fields.AddString('EQ_ENCENDIDO', VarToStr(IIF(chkEQ_ENCENDIDO.Checked, 'S', 'N')));
    end;

    Result := inherited DoABM;
  except
    on E:Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el sector.');
  end;
end;

procedure TfrmManEquipos.LoadControls;
begin
  edEQ_ID.Value := sdqConsultaEQ_ID.AsInteger;
  edEQ_DESCRIPCION2.Text := sdqConsultaEQ_DESCRIPCION.AsString;
  mskEQ_IP.Text := sdqConsultaEQ_IP.AsString;
  edEQ_OBSERVACIONES.Lines.Text := sdqConsultaEQ_OBSERVACIONES.AsString;
  chkEQ_SERVIDOR.Checked := sdqConsultaEQ_SERVIDOR.AsString = 'S';
  chkEQ_ENCENDIDO.Checked := sdqConsultaEQ_ENCENDIDO.AsString = 'S';

  edEQ_COMMENT.Text := sdqConsultaEQ_COMMENT.AsString;
  edEQ_LASTLOGON.Text := sdqConsultaEQ_LASTLOGON.AsString;
  edEQ_MEMORIA.Value := sdqConsultaEQ_MEMORIA.AsInteger;
  edEQ_CPU.Text := sdqConsultaEQ_CPU.AsString;
  edEQ_SYSOP.Text := sdqConsultaEQ_SYSOP.AsString;
  edEQ_SYSOP_VER.Text := sdqConsultaEQ_SYSOP_VER.AsString;
  edEQ_SYSOP_BUILD.Text := sdqConsultaEQ_SYSOP_BUILD.AsString;
  edEQ_SCREEN_WIDTH.Value := sdqConsultaEQ_SCREEN_WIDTH.AsInteger;
  edEQ_SCREEN_HEIGHT.Value := sdqConsultaEQ_SCREEN_HEIGHT.AsInteger;
  edEQ_SCREEN_HZ.Value := sdqConsultaEQ_SCREEN_HZ.AsInteger;
  edEQ_SCREEN_BITSPERPIXEL.Text := sdqConsultaEQ_SCREEN_BITSPERPIXEL.AsString;

  OpenQueryEx(sdqDiscos, [sdqConsultaEQ_ID.AsInteger]);
  OpenQueryEx(sdqSoftwareInstalado, [sdqConsultaEQ_ID.AsInteger]);
  OpenQueryEx(sdqParametrosOracle, [sdqConsultaEQ_ID.AsInteger]);

  VCLExtra.LockControls([edEQ_ID, edEQ_DESCRIPCION2, chkEQ_ENCENDIDO, edEQ_COMMENT, edEQ_LASTLOGON, edEQ_MEMORIA,
                         edEQ_CPU, edEQ_SYSOP, edEQ_SYSOP_VER, edEQ_SYSOP_BUILD,
                         edEQ_SCREEN_WIDTH, edEQ_SCREEN_HEIGHT, edEQ_SCREEN_HZ, edEQ_SCREEN_BITSPERPIXEL], True);
end;

procedure TfrmManEquipos.RefreshData;
var
  sSQL: String;
  i: Integer;
begin
  clbProgramas.Enabled := False;
  clbParametros.Enabled := False;
  clbValores.Enabled := False;
  sSQL := FSQL + DoFiltro(pnlFiltros);
  clbProgramas.Enabled := True;
  clbParametros.Enabled := True;
  clbValores.Enabled := True;

  if chkProblemaDeDisco.Checked then
    sSQL := sSQL + ' AND PROBLEMA_DE_DISCO = ' + SQLValue(vSI);

  if chkBajas.Checked then
    sSQL := sSQL + ' AND EQ_FECHABAJA IS NULL ';

  case rgEquiposPorUsuario.ItemIndex of
    1: sSQL := sSQL + ' AND SE_NOMBRE IS NULL ';
    2: sSQL := sSQL + ' AND SE_NOMBRE IS NOT NULL ';
  end;

  if clbProgramas.CheckCount > 0 then
  begin
    if rbTodos.Checked then
      for i := 0 to clbProgramas.CheckCount - 1 do
        sSQL := sSQL + ' AND EXISTS(SELECT 1 FROM COMPUTOS.CEP_EQUIPO_PROGRAMA, COMPUTOS.CER_PROGRAMAS WHERE ep_id = eq_id AND er_id = ep_idprograma AND TRIM(er_descripcion) = ' + SQLValue(clbProgramas.CheckedItems[i]) + ') '
    else if rbAlMenosUno.Checked then
      sSQL := sSQL + ' AND EXISTS(SELECT 1 FROM COMPUTOS.CEP_EQUIPO_PROGRAMA WHERE ep_id = eq_id ' + clbProgramas.InSQL_IntegerValues('EP_IDPROGRAMA', False) + ') '
    else 
      sSQL := sSQL + ' AND NOT EXISTS(SELECT 1 FROM COMPUTOS.CEP_EQUIPO_PROGRAMA WHERE ep_id = eq_id ' + clbProgramas.InSQL_IntegerValues('EP_IDPROGRAMA', False) + ') ';
  end;

  if clbParametros.CheckCount > 0 then
  begin
    if rbTodosParam.Checked then
      for i := 0 to clbParametros.CheckCount - 1 do
        sSQL := sSQL + ' AND EXISTS(SELECT 1 FROM COMPUTOS.CPA_PARAMETROSESION WHERE pa_idequipo = eq_id AND pa_parametro = ' + SQLValue(clbParametros.CheckedItems[i]) + ') '
    else if rbAlMenosUnParam.Checked then
      sSQL := sSQL + ' AND EXISTS(SELECT 1 FROM COMPUTOS.CPA_PARAMETROSESION WHERE pa_idequipo = eq_id ' + clbParametros.InSQL_StringValues('PA_PARAMETRO', False) + ') '
    else
      sSQL := sSQL + ' AND NOT EXISTS(SELECT 1 FROM COMPUTOS.CPA_PARAMETROSESION WHERE pa_idequipo = eq_id ' + clbParametros.InSQL_StringValues('PA_PARAMETRO', False) + ') ';
  end;

  if clbValores.CheckCount > 0 then
  begin
    if rbTodoValor.Checked then
      for i := 0 to clbValores.CheckCount - 1 do
        sSQL := sSQL + ' AND EXISTS(SELECT 1 FROM COMPUTOS.CPA_PARAMETROSESION WHERE pa_idequipo = eq_id AND pa_parametro = ' + SQLValue(Copy(clbValores.CheckedItems[i], 0, Pos('(', clbValores.CheckedItems[i]) - 1)) + ' AND pa_valor = ' + SQLValue(clbValores.CheckedValues[i]) + ') '
    else if rbAlMenosUnValor.Checked then
      sSQL := sSQL + ' AND EXISTS(SELECT 1 FROM COMPUTOS.CPA_PARAMETROSESION WHERE pa_idequipo = eq_id ' + clbValores.InSQL_StringValues('PA_VALOR', False) + ') '
    else
      sSQL := sSQL + ' AND NOT EXISTS(SELECT 1 FROM COMPUTOS.CPA_PARAMETROSESION WHERE pa_idequipo = eq_id ' + clbValores.InSQL_StringValues('PA_VALOR', False) + ') ';
  end;
  
  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManEquipos.Validar: Boolean;
var
  bDuplicado: Boolean;
begin
  Verificar(edEQ_ID.IsEmpty, edEQ_ID, 'Debe indicar un código para el actual equipo.');
  Verificar(IsEmptyString(edEQ_DESCRIPCION2.Text), edEQ_DESCRIPCION2, 'Debe indicar una descripción para el equipo.');
  bDuplicado := ExisteSQLEx('SELECT 1 FROM COMPUTOS.CEQ_EQUIPO WHERE EQ_DESCRIPCION = :DESCRIPCION AND EQ_ID <> :ID AND EQ_FECHABAJA IS NULL', [edEQ_DESCRIPCION2.Text, edEQ_ID.Value]);
  Verificar(bDuplicado, edEQ_DESCRIPCION2, 'Ya existe otro equipo con la misma descripción.');

  Result := True;
end;

procedure TfrmManEquipos.FormCreate(Sender: TObject);
begin
  pcFiltros.ActivePageIndex := tsPrincipal.PageIndex;
  inherited;
  VCLExtra.LockControls(chkEQ_ENCENDIDO, True);
  FSQL := sdqConsulta.SQL.Text;
  FieldBaja := 'EQ_FECHABAJA';
  cmbNUM_SYSOP.Items := ValoresSql('SELECT DISTINCT eq_sysop FROM computos.ceq_equipo ORDER BY 1');
  cmbVERSION.Items := ValoresSql('SELECT DISTINCT eq_sysop_ver FROM computos.ceq_equipo ORDER BY 1');
  cmbHZ.Items := ValoresSql('SELECT DISTINCT eq_screen_hz FROM computos.ceq_equipo ORDER BY 1');
  cmbBITS.Items := ValoresSql('SELECT DISTINCT eq_screen_bitsperpixel FROM computos.ceq_equipo ORDER BY 1');
  cmbRESOLUCION.Items := ValoresSql('SELECT DISTINCT eq_screen_width || '' x '' || eq_screen_height FROM computos.ceq_equipo ORDER BY 1');
end;

procedure TfrmManEquipos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlBottom.Caption := 'Equipos encontrados: ' + IntToStr(sdqConsulta.RecordCount);
  DynColWidthsByData(DBGrid);
  if WindowState = wsNormal then
    Width := Min(Screen.Width, Max(Width, GetColumnWidths(DBGrid, True)));
end;

procedure TfrmManEquipos.sdqDiscosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgDiscos);
  dbgDiscos.Width := GetColumnWidths(dbgDiscos, True) - dbgDiscos.Columns.Count;  
end;

procedure TfrmManEquipos.sdqParametrosOracleAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(dbgParametrosOracle, 100, False);
  sdqParametrosOracle.First;
end;

procedure TfrmManEquipos.dbgDiscosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  if sdqDiscosPORC_LIBRE.AsInteger > 90 then
    AFont.Color := clNavy
  else if sdqDiscosPORC_LIBRE.AsInteger > 50 then
    AFont.Color := clTeal
  else if sdqDiscosPORC_LIBRE.AsInteger < 5 then
    AFont.Color := clRed
  else if sdqDiscosPORC_LIBRE.AsInteger < 10 then
    AFont.Color := clMaroon
  else
    AFont.Color := clBlack
end;

procedure TfrmManEquipos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if AreIn(Field.FullName, ['PROBLEMA_DE_DISCO', 'CANT_PROGRAMAS']) then
  begin
    if (Field.Value = vSI) then
      AFont.Color := clMaroon
    else
      AFont.Color := clTeal;
  end else
    AFont.Color := clBlack;
  inherited;
end;

procedure TfrmManEquipos.sdqSoftwareInstaladoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(dbgSoftwareInstalado, 100, False);
  sdqSoftwareInstalado.First;
end;

procedure TfrmManEquipos.fpAbmShow(Sender: TObject);
begin
  inherited;
  pcPaginas.ActivePageIndex := 0;
end;

procedure TfrmManEquipos.tsSesionOracleResize(Sender: TObject);
begin
  pnlParameter.Width := Round(tsSesionOracle.Width/2);
end;

end.
