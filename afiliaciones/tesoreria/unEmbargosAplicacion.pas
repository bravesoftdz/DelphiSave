unit unEmbargosAplicacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unFraCodigoDescripcion, StdCtrls, Mask, PatternEdit,
  IntEdit, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  ToolEdit, DateComboBox;

type
  TfrmEmbargosAplicacion = class(TfrmCustomConsulta)
    lbBanco: TLabel;
    lbCuenta: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    label2: TLabel;
    label3: TLabel;
    lbJurisdiccion: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    fraBanco: TfraStaticCodigoDescripcion;
    edCarpeta: TIntEdit;
    edDemandante: TEdit;
    edDemandado: TEdit;
    edCaratula: TEdit;
    fraJurisdiccion: TfraCodigoDescripcion;
    fraFuero: TfraCodigoDescripcion;
    fraJuzgado: TfraCodigoDescripcion;
    fraSecretaria: TfraCodigoDescripcion;
    edFechaAplDesde: TDateComboBox;
    Label4: TLabel;
    edFechaAplHasta: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    fraTipoAplicacion: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    procedure OnfraBancoChange(Sender: TObject);
    procedure OnfraCuentaBancariaChange(Sender: TObject);
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
   procedure CalcTotales;
  public
  end;

const
  MAXCOLS = 2;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE', 'IMPORTEAPLICADO', 'MONTOEMBARGADO');

var
  frmEmbargosAplicacion: TfrmEmbargosAplicacion;
  TotalConsulta: Array of Extended;

implementation

uses
  CustomDlgs, AnsiSql, General, DbFuncs, unDmPrincipal, unSesion, SqlFuncs,
  StrFuncs;

{$R *.dfm}

procedure TfrmEmbargosAplicacion.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraBanco.Clear;
  fraCuentaBancaria.Clear;
  edCarpeta.Clear;
  edDemandante.Clear;
  edDemandado.Clear;
  edCaratula.Clear;
  fraJurisdiccion.Clear;
  fraFuero.Clear;
  fraJuzgado.Clear;
  fraSecretaria.Clear;
  edFechaAplDesde.Clear;
  edFechaAplHasta.Clear;
  fraTipoAplicacion.Clear;
  fraCuentaBancaria.ExtraCondition := '';
  fraFuero.ExtraCondition          := 'AND 1=2';;
  fraJuzgado.ExtraCondition        := 'AND 1=2';;
  fraSecretaria.ExtraCondition     := 'AND 1=2';;
end;

procedure TfrmEmbargosAplicacion.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DEMANDADO DEMANDADO, NVL(JT_CARATULA, EM_CARATULA) CARATULA, ' +
                 'JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DESCRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA, ' +
                 'SC_DESCRIPCION SECRETARIA, BA_NOMBRE BANCO, CB_NUMERO CUENTA, EM_IMPORTE IMPORTE, EM_FECHA FECHA, EM_OFICIO OFICIO, ' +
                 'EE_DESCRIPCION ESTADO, EM_REPETIDO REPETIDO, EM_OBSERVACIONES OBSERVACIONES, EM_ID, EM_MONTOEMBARGADO MONTOEMBARGADO, ' +
                 'TA_DESCRIPCION TIPO_APLICACION, AE_IMPORTE IMPORTEAPLICADO, TRUNC(AE_FECHAALTA) FECHA_APLICACION ' +
            'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICIOENTRAMITE, LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO, ' +
                 'LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LSC_SECRETARIA, LEE_ESTADOEMBARGO, ' +
                 'LAE_APLICACIONEMBARGO, LTA_TIPOAPLICACIONEMBARGO, LEM_EMBARGO ' +
           'WHERE EE_ID = EM_IDESTADO ' +
             'AND CB_ID(+) = EM_IDCUENTABANCARIA ' +
             'AND BA_ID(+) = CB_IDBANCO ' +
             'AND EM_ID = AE_IDEMBARGO ' +
             'AND TA_ID = AE_IDTIPOAPLICACION ' +
             'AND JT_ID(+) = EM_IDJUICIO ' +
             'AND IN_ID = JZ_IDINSTANCIA ' +
             'AND JU_ID = NVL(JT_IDJURISDICCION, EM_IDJURISDICCION) ' +
             'AND FU_ID = NVL(JT_IDFUERO, EM_IDFUERO) ' +
             'AND JZ_ID = NVL(JT_IDJUZGADO, EM_IDJUZGADO) ' +
             'AND SC_ID = NVL(JT_IDSECRETARIA, EM_IDSECRETARIA) ' +
             'AND EM_FECHABAJA IS NULL ' +
             'AND AE_FECHABAJA IS NULL ';

  sWhere := SqlBetweenDateTime(' AND AE_FECHAALTA ', edFechaAplDesde.Date, edFechaAplHasta.Date);

  if fraBanco.IsSelected then
    sWhere := sWhere + ' AND BA_ID = ' + SqlValue(fraBanco.Value);

  if fraCuentaBancaria.IsSelected then
    sWhere := sWhere + ' AND CB_ID = ' + SqlValue(fraCuentaBancaria.Value);

  if not edCarpeta.IsEmpty then
    sWhere := sWhere + ' AND JT_NUMEROCARPETA = ' + SqlValue(edCarpeta.Value);

  if fraJurisdiccion.IsSelected then
    sWhere := sWhere + ' AND JU_ID = ' + SqlValue(fraJurisdiccion.Value);

  if fraFuero.IsSelected then
    sWhere := sWhere + ' AND FU_ID = ' + SqlValue(fraFuero.Value);

  if fraJuzgado.IsSelected then
    sWhere := sWhere + ' AND JZ_ID = ' + SqlValue(fraJuzgado.Value);

  if fraSecretaria.IsSelected then
    sWhere := sWhere + ' AND SC_ID = ' + SqlValue(fraSecretaria.Value);

  if Trim(edDemandante.Text) <> ''  then
    sWhere := sWhere + ' AND JT_DEMANDANTE LIKE ' + SqlValue(Trim(edDemandante.Text) + '%');

  if Trim(edDemandado.Text) <> ''  then
    sWhere := sWhere + ' AND JT_DEMANDADO LIKE ' + SqlValue(Trim(edDemandado.Text) + '%');

  if Trim(edCaratula.Text) <> ''  then
    sWhere := sWhere + ' AND JT_CARATULA LIKE ' + SqlValue(Trim(edCaratula.Text) + '%');

  if fraTipoAplicacion.IsSelected then
    sWhere := sWhere + ' AND TA_ID = ' + SqlValue(fraTipoAplicacion.Value);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  CalcTotales;
end;

procedure TfrmEmbargosAplicacion.FormCreate(Sender: TObject);
begin
  inherited;

  with fraBanco do
  begin
    ShowBajas   := True;
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    OnChange    := OnfraBancoChange;

    ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
  end;

  with fraCuentaBancaria do
  begin
    ShowBajas   := True;
    TableName   := 'ZCB_CUENTABANCARIA';
    FieldID     := 'CB_ID';
    FieldCodigo := 'CB_ID';
    FieldDesc   := 'CB_NUMERO';
    FieldBaja   := 'CB_FECHABAJA';
    DynamicCols := True;
    ExtraFields := ', CB_IDBANCO "ID Banco"';
    VisibleExtraFields[0] := False;
    OnChange    := OnfraCuentaBancariaChange;
  end;

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

  with fraTipoAplicacion do
  begin
    ShowBajas   	 := True;
    TableName   	 := 'LEGALES.LTA_TIPOAPLICACIONEMBARGO';
    FieldID     	 := 'TA_ID';
    FieldCodigo 	 := 'TA_CODIGO';
    FieldDesc   	 := 'TA_DESCRIPCION';
    FieldBaja   	 := 'TA_FECHABAJA';
  end;

  SetLength(TotalConsulta,  MAXCOLS  + 1);
end;

procedure TfrmEmbargosAplicacion.OnfraBancoChange(Sender: TObject);
begin
  if fraBanco.IsSelected then
    fraCuentaBancaria.ExtraCondition := fraCuentaBancaria.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBanco.Value)
end;

procedure TfrmEmbargosAplicacion.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBanco.IsSelected and fraCuentaBancaria.IsSelected then
    fraBanco.Value := StrToInt(fraCuentaBancaria.cmbDescripcion.Cells[4, fraCuentaBancaria.cmbDescripcion.Row]);
end;

procedure TfrmEmbargosAplicacion.ChangeJurisdiccion(Sender: TObject);
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

procedure TfrmEmbargosAplicacion.ChangeFuero(Sender: TObject);
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

procedure TfrmEmbargosAplicacion.ChangeJuzgado(Sender: TObject);
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

procedure TfrmEmbargosAplicacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
	TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency         := True;
	TFloatField(sdqConsulta.FieldByName('IMPORTEAPLICADO')).Currency := True;
	TFloatField(sdqConsulta.FieldByName('MONTOEMBARGADO')).Currency  := True;
end;

procedure TfrmEmbargosAplicacion.tbSumatoriaClick(Sender: TObject);
begin
	CalcTotales;
end;

procedure TfrmEmbargosAplicacion.CalcTotales;
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

procedure TfrmEmbargosAplicacion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

end.
