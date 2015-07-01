unit unEmbargos;

interface

uses             
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, Mask, PatternEdit, IntEdit, unFraCodigoDescripcion, ComboEditor,
  CheckCombo, DBCheckCombo;

type
  TfrmEmbargos = class(TfrmCustomGridABM)
    lbBanco: TLabel;
    lbCuenta: TLabel;
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    fraBanco: TfraStaticCodigoDescripcion;
    Label22: TLabel;
    edCarpeta: TIntEdit;
    Label1: TLabel;
    edDemandante: TEdit;
    edDemandado: TEdit;
    label2: TLabel;
    label3: TLabel;
    edCaratula: TEdit;
    lbJurisdiccion: TLabel;
    fraJurisdiccion: TfraCodigoDescripcion;
    Label18: TLabel;
    fraFuero: TfraCodigoDescripcion;
    Label19: TLabel;
    fraJuzgado: TfraCodigoDescripcion;
    Label20: TLabel;
    fraSecretaria: TfraCodigoDescripcion;
    checkSoloActivos: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    dcbEstado: TDBCheckCombo;
    dcbMotivoRegularizado: TDBCheckCombo;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    sdqMotivosRegularizado: TSDQuery;
    dsMotivosRegularizado: TDataSource;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    tbSaldoEmbargos: TToolButton;
    ToolButton1: TToolButton;
    tbLevantamiento: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSaldoEmbargosClick(Sender: TObject);
    procedure tbLevantamientoClick(Sender: TObject);
  private
    procedure OnfraBancoChange(Sender: TObject);
    procedure OnfraCuentaBancariaChange(Sender: TObject);
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
    procedure CalcTotales;
  protected
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 4;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE', 'APLICADO', 'SALDO', 'INTERESES', 'MONTOEMBARGADO');

var
  frmEmbargos: TfrmEmbargos;
  TotalConsulta: Array of Extended;

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, CustomDlgs, unSesion, General, SqlFuncs, unAltaEmbargos,
  DbFuncs,unSaldoEmbargos;

function TfrmEmbargos.DoABM: Boolean;
begin
  Sql.Clear;

  if ModoABM = maBaja Then
  begin
    Sql.SqlType := stUpdate;

    Sql.PrimaryKey.Add('EM_ID',    sdqConsulta.FieldByName('EM_ID').AsInteger);
    Sql.Fields.Add('EM_USUBAJA',   Sesion.UserId);
    Sql.Fields.Add('EM_FECHABAJA', exDateTime);
  end;

  Result := inherited DoABM;
end;


procedure TfrmEmbargos.CalcTotales;
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

procedure TfrmEmbargos.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql :=
  	'SELECT JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DEMANDADO DEMANDADO,' +
    			' NVL(JT_CARATULA, EM_CARATULA) CARATULA, JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO,' +
          ' JZ_DESCRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETARIA, BA_NOMBRE BANCO,' +
          ' CB_NUMERO CUENTA, EM_IMPORTE IMPORTE, EM_FECHA FECHA, EM_OFICIO OFICIO, EE_DESCRIPCION ESTADO,' +
          ' EM_REPETIDO REPETIDO, EM_FECHAREGULARIZADO FECHA_REGULARIZADO, RE_DESCRIPCION MOTIVO_REGULARIZADO,' +
          ' EM_OBSERVACIONES OBSERVACIONES, EM_ID, TRUNC(EM_FECHABAJA) FECHABAJA,' +
          ' LEGALES.GET_MONTOAPLICADOEMBARGO(EM_ID) APLICADO, EM_IDESTADO IDESTADO, EM_TIPO TIPO, ' +
          ' EM_IMPORTE - LEGALES.GET_MONTOAPLICADOEMBARGO(EM_ID) + LEGALES.GET_INTERESESEMBARGO(EM_ID) SALDO,' +
          ' LEGALES.GET_INTERESESEMBARGO(EM_ID) INTERESES, EM_MONTOEMBARGADO MONTOEMBARGADO,' +
          ' DECODE(JT_ESTADOMEDIACION, ''A'', ''P. Actora'', ''J'', ''P. Demandada'', '''') TIPOJUICIO,' +
          ' DECODE(JT_GPBA, ''1'', ''SI'', ''NO'') GPBA, DECODE(JT_GPBAMALAPRAXIS, ''S'', ''SI'', ''NO'') MALA_PRAXIS' +
     ' FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICIOENTRAMITE, LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO,' +
     			' LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LSC_SECRETARIA, LRE_REGULARIZACIONEMBARGO,' +
          ' LEE_ESTADOEMBARGO, LEM_EMBARGO' +
    ' WHERE EE_ID    = EM_IDESTADO' +
    	' AND CB_ID(+) = EM_IDCUENTABANCARIA' +
      ' AND BA_ID(+) = CB_IDBANCO' +
      ' AND RE_ID(+) = EM_IDREGULARIZADO' +
      ' AND JT_ID(+) = EM_IDJUICIO' +
      ' AND IN_ID    = JZ_IDINSTANCIA' +
      ' AND JU_ID    = NVL(JT_IDJURISDICCION,EM_IDJURISDICCION)' +
      ' AND FU_ID    = NVL(JT_IDFUERO,EM_IDFUERO)' +
      ' AND JZ_ID    = NVL(JT_IDJUZGADO,EM_IDJUZGADO)' +
      ' AND SC_ID    = NVL(JT_IDSECRETARIA,EM_IDSECRETARIA)';

  sWhere := ' ';

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

	if checkSoloActivos.Checked then
		sWhere := sWhere + ' AND EM_FECHABAJA IS NULL';

  if dcbEstado.Text <> '' then
    sWhere := sWhere + ' AND EM_IDESTADO ' + dcbEstado.InSql;

  if dcbMotivoRegularizado.Text <> '' then
    sWhere := sWhere + ' AND EM_IDREGULARIZADO ' + dcbMotivoRegularizado.InSql;

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmEmbargos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
	TFloatField(sdqConsulta.FieldByName('Aplicado')).Currency       := True;
	TFloatField(sdqConsulta.FieldByName('Importe')).Currency 	      := True;
  TFloatField(sdqConsulta.FieldByName('Saldo')).Currency 		      := True;
  TFloatField(sdqConsulta.FieldByName('Intereses')).Currency      := True;
	TFloatField(sdqConsulta.FieldByName('montoembargado')).Currency := True;
end;

procedure TfrmEmbargos.FormCreate(Sender: TObject);
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

  tbSumatoria.Left := 108;

  sdqEstados.Open;
  sdqMotivosRegularizado.Open;

  ShowActived   := False;

  Sql.TableName := 'LEM_EMBARGO';
  FieldBaja     := 'FECHABAJA';

  SetLength(TotalConsulta,  MAXCOLS  + 1);
end;

procedure TfrmEmbargos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraBanco.Clear;
  fraCuentaBancaria.Clear;
  edCarpeta.Clear;
  edDemandante.Clear;
  edDemandado.Clear;
  edCaratula.Clear;
  checkSoloActivos.Checked :=  True;
  dcbEstado.Clear;
  dcbMotivoRegularizado.Clear;
  fraJurisdiccion.Clear;
  fraFuero.Clear;
  fraJuzgado.Clear;
  fraSecretaria.Clear;
  fraCuentaBancaria.ExtraCondition := '';
  fraFuero.ExtraCondition          := 'AND 1=2';;
  fraJuzgado.ExtraCondition        := 'AND 1=2';;
  fraSecretaria.ExtraCondition     := 'AND 1=2';;
end;

procedure TfrmEmbargos.OnfraBancoChange(Sender: TObject);
begin
  if fraBanco.IsSelected then
    fraCuentaBancaria.ExtraCondition := fraCuentaBancaria.ExtraCondition + ' AND CB_IDBANCO = ' + SqlValue(fraBanco.Value)
end;

procedure TfrmEmbargos.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBanco.IsSelected and fraCuentaBancaria.IsSelected then
    fraBanco.Value := StrToInt(fraCuentaBancaria.cmbDescripcion.Cells[4, fraCuentaBancaria.cmbDescripcion.Row]);
end;

procedure TfrmEmbargos.ChangeJurisdiccion(Sender: TObject);
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

procedure TfrmEmbargos.ChangeFuero(Sender: TObject);
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

procedure TfrmEmbargos.ChangeJuzgado(Sender: TObject);
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

procedure TfrmEmbargos.tbNuevoClick(Sender: TObject);
begin
  with TfrmAltaEmbargos.Create(Self) do
  try
    EsConcilBancaria := False;

    if ShowModal = mrOk then
      RefreshData;
  finally
    Free;
  end;
end;

procedure TfrmEmbargos.tbSumatoriaClick(Sender: TObject);
begin
	CalcTotales;
end;

procedure TfrmEmbargos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
																			 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := FormatFloat('$ #,##0.00', TotalConsulta[iPos]);
end;

procedure TfrmEmbargos.tbSaldoEmbargosClick(Sender: TObject);
begin
  Abrir(TfrmSaldoEmbargos, frmSaldoEmbargos, tmvModal, nil);
end;

procedure TfrmEmbargos.tbLevantamientoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(sdqConsulta.FieldByName('IMPORTE').AsFloat <> 0, nil, 'El importe retenido debe ser 0.');
  Verificar(sdqConsulta.FieldByName('IDESTADO').AsInteger <> 3, nil, 'El embargo debe estar Activo.');

  if MsgBox('¿Está seguro de efectuar el Levantamiento del embargo?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    begin
      sSql := 'UPDATE LEM_EMBARGO ' +
                 'SET EM_IDESTADO = 4, ' +
                     'EM_FECHAREGULARIZADO = ACTUALDATE, ' +
                     'EM_IDREGULARIZADO = 4, ' +
                     'EM_USUMODIF = :User, ' +
                     'EM_FECHAMODIF = SYSDATE ' +
               'WHERE EM_ID = :IdEmbargo';
      EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('EM_ID').AsInteger]);

      MsgBox('Levantamiento del embargo efectuado correctamente.', MB_ICONINFORMATION);

      RefreshData;
    end;
end;

end.


