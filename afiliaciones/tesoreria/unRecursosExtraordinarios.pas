unit unRecursosExtraordinarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, Mask, PatternEdit, IntEdit, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, ToolEdit, DateComboBox,
  unCustomGridABM, FormPanel;

type
  TfrmRecursosExtraordinarios = class(TfrmCustomConsulta)
    lbJurisdiccion: TLabel;
    fraJurisdiccion: TfraCodigoDescripcion;
    Label19: TLabel;
    fraJuzgado: TfraCodigoDescripcion;
    Label18: TLabel;
    fraFuero: TfraCodigoDescripcion;
    Label20: TLabel;
    fraSecretaria: TfraCodigoDescripcion;
    Label1: TLabel;
    edDemandante: TEdit;
    label2: TLabel;
    edDemandado: TEdit;
    label3: TLabel;
    edCaratula: TEdit;
    Label22: TLabel;
    edCarpeta: TIntEdit;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    chkSoloRecConSaldo: TCheckBox;
    Label4: TLabel;
    edSaldoHasta: TDateComboBox;
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbNuevoClick(Sender: TObject);
  private
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
  public
  end;

var
  frmRecursosExtraordinarios: TfrmRecursosExtraordinarios;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 5;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('RECURSO_EXTRAORDINARIO', 'ASIGNACION_A_PAGO', 'REINTEGRO', 'GASTOS', 'INTERESES', 'SALDO');

implementation

uses
  unDmPrincipal, AnsiSql, CustomDlgs, General, SqlFuncs, DbFuncs, StrFuncs,
  unAltaRecursosExtraordinarios;

{$R *.dfm}

procedure TfrmRecursosExtraordinarios.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT CARPETA, DEMANDANTE, DEMANDADO, CARATULA, JURISDICCION, FUERO, JUZGADO, INSTANCIA, ' +
                 'SECRETARIA, RECURSO_EXTRAORDINARIO, ASIGNACION_A_PAGO, REINTEGRO, GASTOS, INTERESES, ' +
            	   'RECURSO_EXTRAORDINARIO+ASIGNACION_A_PAGO-REINTEGRO SALDO, ' +
                 'JU_ID, FU_ID, JZ_ID, SC_ID, HOLDING ' +
            'FROM ' +
              '(SELECT JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DEMANDADO DEMANDADO, JT_CARATULA CARATULA, ' +
                      'JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DESCRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETARIA, ' +
                      'LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, ''05'', ' + SqlValue(edSaldoHasta.Date) + ') RECURSO_EXTRAORDINARIO, ' +
                      'LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, ''04'', ' + SqlValue(edSaldoHasta.Date) + ') ASIGNACION_A_PAGO, ' +
                      'LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, ''01'', ' + SqlValue(edSaldoHasta.Date) + ') REINTEGRO, ' +
                      'LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, ''02'', ' + SqlValue(edSaldoHasta.Date) + ') GASTOS, ' +
                      'LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, ''03'', ' + SqlValue(edSaldoHasta.Date) + ') INTERESES, ' +
                      'JU_ID, FU_ID, JZ_ID, SC_ID, ' +
                      '(SELECT MAX(GE_DESCRIPCION) ' +
                         'FROM LEGALES.LOD_ORIGENDEMANDA, LEGALES.LSJ_SINIESTROSJUICIOENTRAMITE, ART.SEX_EXPEDIENTES, ' +
                              'AEM_EMPRESA, AGE_GRUPOECONOMICO ' +
                        'WHERE OD_IDJUICIOENTRAMITE = JT_ID ' +
                          'AND OD_ID = SJ_IDORIGENDEMANDA ' +
                          'AND SJ_IDSINIESTRO = EX_ID ' +
                          'AND EX_CUIT = EM_CUIT ' +
                          'AND EM_IDGRUPOECONOMICO = GE_ID ' +
                          'AND OD_FECHABAJA IS NULL ' +
                          'AND SJ_FECHABAJA IS NULL) HOLDING ' +
                 'FROM LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO, LEGALES.LSC_SECRETARIA, ' +
                      'LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LJT_JUICIOENTRAMITE ' +
                'WHERE LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, ''05'', ' + SqlValue(edSaldoHasta.Date) + ') > 0 ' +
                  'AND IN_ID = JZ_IDINSTANCIA ' +
                  'AND JU_ID = JT_IDJURISDICCION ' +
                  'AND FU_ID = JT_IDFUERO ' +
                  'AND JZ_ID = JT_IDJUZGADO ' +
                  'AND SC_ID = JT_IDSECRETARIA) ';

  sWhere := ' WHERE 1 = 1';

  if not edCarpeta.IsEmpty then
    sWhere := sWhere + ' AND CARPETA = ' + SqlValue(edCarpeta.Value);

  if fraJurisdiccion.IsSelected then
    sWhere := sWhere + ' AND JU_ID = ' + SqlValue(fraJurisdiccion.Value);

  if fraFuero.IsSelected then
    sWhere := sWhere + ' AND FU_ID = ' + SqlValue(fraFuero.Value);

  if fraJuzgado.IsSelected then
    sWhere := sWhere + ' AND JZ_ID = ' + SqlValue(fraJuzgado.Value);

  if fraSecretaria.IsSelected then
    sWhere := sWhere + ' AND SC_ID = ' + SqlValue(fraSecretaria.Value);

  if Trim(edDemandante.Text) <> ''  then
    sWhere := sWhere + ' AND DEMANDANTE LIKE ' + SqlValue(Trim(edDemandante.Text) + '%');

  if Trim(edDemandado.Text) <> ''  then
    sWhere := sWhere + ' AND DEMANDADO LIKE ' + SqlValue(Trim(edDemandado.Text) + '%');

  if Trim(edCaratula.Text) <> ''  then
    sWhere := sWhere + ' AND CARATULA LIKE ' + SqlValue(Trim(edCaratula.Text) + '%');

  if chkSoloRecConSaldo.Checked then
    sWhere := sWhere + ' AND RECURSO_EXTRAORDINARIO-ASIGNACION_A_PAGO-REINTEGRO <> 0';

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  CalcTotales;
end;

procedure TfrmRecursosExtraordinarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edCarpeta.Clear;
  edDemandante.Clear;
  edDemandado.Clear;
  edCaratula.Clear;
  fraJurisdiccion.Clear;
  fraFuero.Clear;
  fraJuzgado.Clear;
  fraSecretaria.Clear;
  edSaldoHasta.Clear;
  chkSoloRecConSaldo.Checked   := False;
  fraFuero.ExtraCondition      := 'AND 1=2';
  fraJuzgado.ExtraCondition    := 'AND 1=2';
  fraSecretaria.ExtraCondition := 'AND 1=2';
end;

procedure TfrmRecursosExtraordinarios.CalcTotales;
var
	PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmRecursosExtraordinarios.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('RECURSO_EXTRAORDINARIO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RECURSO_EXTRAORDINARIO')).Currency := True;

  if sdqConsulta.FieldByName('ASIGNACION_A_PAGO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ASIGNACION_A_PAGO')).Currency := True;

  if sdqConsulta.FieldByName('REINTEGRO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('REINTEGRO')).Currency := True;

  if sdqConsulta.FieldByName('GASTOS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('GASTOS')).Currency := True;

  if sdqConsulta.FieldByName('INTERESES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('INTERESES')).Currency := True;

  if sdqConsulta.FieldByName('SALDO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDO')).Currency := True;
end;

procedure TfrmRecursosExtraordinarios.FormCreate(Sender: TObject);
begin
  inherited;

  with fraFuero do
  begin
    ShowBajas   := True;
    TableName   := 'LEGALES.LFU_FUERO';
    FieldID     := 'FU_ID';
    FieldCodigo := 'FU_ID';
    FieldDesc   := 'FU_DESCRIPCION';
    FieldBaja   := 'FU_FECHABAJA';

    ExtraCondition := 'AND 1=2';
    OnChange := ChangeFuero;
  end;

  with fraJurisdiccion do
  begin
    ShowBajas   := True;
    TableName   := 'LEGALES.LJU_JURISDICCION';
    FieldID     := 'JU_ID';
    FieldCodigo := 'JU_ID';
    FieldDesc   := 'JU_DESCRIPCION';
    FieldBaja   := 'JU_FECHABAJA';

    OnChange := ChangeJurisdiccion;
  end;

  with fraJuzgado do
  begin
    ShowBajas   	 := True;
    TableName   	 := 'LEGALES.LJZ_JUZGADO';
    FieldID     	 := 'JZ_ID';
    FieldCodigo 	 := 'JZ_ID';
    FieldDesc   	 := 'JZ_DESCRIPCION';
    ExtraCondition := 'AND 1=2';
    FieldBaja   	 := 'JZ_FECHABAJA';

    OnChange := ChangeJuzgado;
  end;

  with fraSecretaria do
  begin
    ShowBajas   	 := True;
    TableName   	 := 'LEGALES.LSC_SECRETARIA';
    FieldID     	 := 'SC_ID';
    FieldCodigo 	 := 'SC_ID';
    FieldDesc   	 := 'SC_DESCRIPCION';
    ExtraCondition := 'AND 1=2';
    FieldBaja   	 := 'SC_FECHABAJA';
  end;

  SetLength(TotalConsulta,  MAXCOLS + 1);
end;

procedure TfrmRecursosExtraordinarios.ChangeJurisdiccion(Sender: TObject);
begin
  if fraJurisdiccion.IsSelected then
    with fraFuero do
    begin
      fraFuero.Codigo := '';
      TableName   	 := 'LEGALES.LFU_FUERO';
      FieldID     	 := 'FU_ID';
      FieldCodigo 	 := 'FU_ID';
      FieldDesc   	 := 'FU_DESCRIPCION';
      ExtraCondition := ' AND FU_ID IN (SELECT JZ_IDFUERO FROM LEGALES.LJZ_JUZGADO WHERE JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccion.Codigo))+ ')';
      OnChange 			 := ChangeFuero;
    end;

  if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
    with fraJuzgado do
    begin
      fraJuzgado.Codigo := '';
      TableName   	 		:= 'LEGALES.LJZ_JUZGADO';
      FieldID     	 		:= 'JZ_ID';
      FieldCodigo 	 		:= 'JZ_ID';
      FieldDesc   	 		:= 'JZ_DESCRIPCION';
      ExtraCondition 		:= ' AND JZ_IDJURISDICCION = ' + SqlValue(StrToInt(fraJurisdiccion.Codigo)) + ' AND JZ_IDFUERO = ' +  SqlValue(StrToInt(fraFuero.Codigo));
    end;
end;

procedure TfrmRecursosExtraordinarios.ChangeFuero(Sender: TObject);
begin
  if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
    with fraJuzgado do
    begin
      TableName   	 := 'LEGALES.LJZ_JUZGADO';
      FieldID     	 := 'JZ_ID';
      FieldCodigo 	 := 'JZ_ID';
      FieldDesc   	 := 'JZ_DESCRIPCION';
      ExtraCondition := 'AND JZ_IDJURISDICCION = ' + SqlValue(StrToInt(fraJurisdiccion.Codigo)) + ' AND JZ_IDFUERO = ' +  SqlValue(StrToInt(fraFuero.Codigo));
    end;
end;

procedure TfrmRecursosExtraordinarios.ChangeJuzgado(Sender: TObject);
begin
  if fraJuzgado.IsSelected then
    with fraSecretaria do
    begin
      TableName   	 := 'LEGALES.LSC_SECRETARIA';
      FieldID     	 := 'SC_ID';
      FieldCodigo 	 := 'SC_ID';
      FieldDesc   	 := 'SC_DESCRIPCION';
      ExtraCondition := 'AND SC_IDJUZGADO = ' + SqlValue(StrToInt(fraJuzgado.Codigo));
    end;
end;

procedure TfrmRecursosExtraordinarios.tbSumatoriaClick(Sender: TObject);
begin
	CalcTotales;
end;

procedure TfrmRecursosExtraordinarios.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmRecursosExtraordinarios.tbNuevoClick(Sender: TObject);
begin
  with TfrmAltaRecursosExtraordinarios.Create(Self) do
    try
      EsConcilBancaria := False;

      ShowModal;
    finally
      Free;
    end;
end;

end.

