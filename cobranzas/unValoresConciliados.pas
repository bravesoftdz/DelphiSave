unit unValoresConciliados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, PatternEdit, unArtDbFrame, unFraEmpresa;

type
  TfrmValoresConciliados = class(TfrmCustomConsulta)
    gbFechaConciliado: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edFConciliadoDesde: TDateComboBox;
    edFConciliadoHasta: TDateComboBox;
    gbConcepto: TGroupBox;
    fraConcepto: TfraStaticCodigoDescripcion;
    gbTipoValor: TGroupBox;
    fraTipoValor: TfraStaticCodigoDescripcion;
    gbCheque: TGroupBox;
    edNroCheque: TPatternEdit;
    gbEmpresa: TGroupBox;
    fraEmpresaValor: TfraEmpresa;
    gbEstudio: TGroupBox;
    fraEstudio: TfraStaticCodigoDescripcion;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    ToolButton2: TToolButton;
    tbSumatoria: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
                              var AlignFooter: TAlingFooter);
  private
    procedure CalcTotales;
  public
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE');

var
  frmValoresConciliados: TfrmValoresConciliados;
  TotalConsulta: Array of Extended;

implementation

uses
  AnsiSql, unFraCodigoDescripcion, DbFuncs, CustomDlgs, Strfuncs, General;

{$R *.DFM}

procedure TfrmValoresConciliados.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSql :=
    'SELECT ZBA.BA_NOMBRE BANCO, ZCB.CB_NUMERO CUENTA, RBD.BD_NUMERO BOLETA_DEPOSITO, RBD.BD_FECHA FECHA_DEPOSITO,' +
          ' OTV.TV_DESCRIPCION TIPO, ZVA.VA_NROCHEQUE CHEQUE, ZVA.VA_VENCIMIENTO VENCIMIENTO, ZVA.VA_IMPORTE IMPORTE,' +
          ' OCV.CV_DESCRIPCION CONCEPTO, VA_IDCONTRATO CONTRATO, TESORERIA.GET_EMISORVALOR(VA_ID) EMISOR,' +
          ' USE.SE_NOMBRE USU_CONCILIADO, TRUNC(OCB.CB_FECHAAPROBADO) FECHA_CONCILIADO' +
     ' FROM ZBA_BANCO ZBA, ZCB_CUENTABANCARIA ZCB, RBD_BOLETADEPOSITO RBD, OCV_CONCEPTOVALOR OCV, OTV_TIPOVALOR OTV,' +
          ' ZVA_VALOR ZVA, USE_USUARIOS USE, OMB_MOVIMIENTOBANCO OMB, OCB_CONCILIACIONBANCARIA OCB' +
    ' WHERE ZCB.CB_ID = RBD.BD_IDCUENTABANCARIA' +
      ' AND ZBA.BA_ID = ZCB.CB_IDBANCO' +
      ' AND RBD.BD_ID = OMB.MB_IDCOMP' +
      ' AND OMB.MB_ID = OCB.CB_IDMOVIMIENTO' +
      ' AND RBD.BD_ID = ZVA.VA_IDBOLETADEP' +
      ' AND OTV.TV_ID = ZVA.VA_IDTIPOVALOR' +
      ' AND OCV.CV_ID = ZVA.VA_IDCONCEPTOVALOR' +
      ' AND OCB.CB_USUAPROBADO = USE.SE_USUARIO ' +
      ' AND OMB.MB_TIPOCOMP = ''2'' ';

  sSqlWhere := SqlBetweenDateTime(' AND CB_FECHAAPROBADO', edFConciliadoDesde.Date, edFConciliadoHasta.Date);

  if fraConcepto.IsSelected then
    sSqlWhere := sSqlWhere + ' AND CV_ID = ' + SqlValue(fraConcepto.Value);

  if fraTipoValor.IsSelected then
    sSqlWhere := sSqlWhere + ' AND TV_ID = ' + SqlValue(fraTipoValor.Value);

  if Trim(edNroCheque.Text) <> '' then
    sSqlWhere := sSqlWhere + ' AND VA_NROCHEQUE = ' + SqlValue(Trim(edNroCheque.Text));

  if fraEmpresaValor.IsSelected then
    sSqlWhere := sSqlWhere + ' AND VA_IDCONTRATO = ' + SqlValue(fraEmpresaValor.Contrato);

  if fraEstudio.IsSelected then
    sSqlWhere := sSqlWhere + ' AND VA_IDGESTORCUENTA = ' + SqlValue(fraEstudio.Value);

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;
  inherited;

  CalcTotales;
end;

procedure TfrmValoresConciliados.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  with fraConcepto do
  begin
    TableName   := 'OCV_CONCEPTOVALOR';
    FieldID     := 'CV_ID';
    FieldCodigo := 'CV_ID';
    FieldDesc   := 'CV_DESCRIPCION';
    FieldBaja   := 'CV_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraTipoValor do
  begin
    TableName      := 'OTV_TIPOVALOR';
    FieldID        := 'TV_ID';
    FieldCodigo    := 'TV_ID';
    FieldDesc      := 'TV_DESCRIPCION';
    FieldBaja      := 'TV_FECHABAJA';
    ExtraCondition := ' AND TV_BOLETADEPOSITO = ''S''';
    ShowBajas      := True;
  end;

  fraEmpresaValor.ShowBajas := True;

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', GC_NOMBRE ' + CD_ALIAS_DESC + ',' +
          ' GC_FECHABAJA ' + CD_ALIAS_BAJA +
     ' FROM AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO IS NULL' +
      ' AND GC_ESTUDIO = ''S'' ';

  with fraEstudio do
  begin
    Sql       := sSql;
    ShowBajas := True;
  end;

  SetLength(TotalConsulta,  MAXCOLS + 1);
    
  inherited;
end;

procedure TfrmValoresConciliados.tbLimpiarClick(Sender: TObject);
begin
  fraConcepto.Clear;
  fraTipoValor.Clear;
  edNroCheque.Clear;
  edFConciliadoDesde.Clear;
  edFConciliadoHasta.Clear;
  fraEmpresaValor.Clear;
  fraEstudio.Clear;

  fraConcepto.edCodigo.Setfocus;

  inherited;
end;

procedure TfrmValoresConciliados.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;

  inherited;
end;

procedure TfrmValoresConciliados.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmValoresConciliados.CalcTotales;
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
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmValoresConciliados.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;
  
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]));
end;

end.
