unit unControlImputacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, PeriodoPicker, Mask, ToolEdit, DateComboBox, PatternEdit, IntEdit, CardinalEdit, unFraCodigoDescripcion,
  unFraCodDesc, RxToolEdit, RxPlacemnt;

type
  TfrmControlImputacion = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    cmbCB_FECHAAPROBADODesde: TDateComboBox;
    cmbCB_FECHAAPROBADOHasta: TDateComboBox;
    Label4: TLabel;
    gbPeriodo: TGroupBox;
    edMO_PERIODODesde: TPeriodoPicker;
    Label3: TLabel;
    edMO_PERIODOHasta: TPeriodoPicker;
    gbCheque: TGroupBox;
    gbBoleta: TGroupBox;
    edBD_NUMERO: TIntEdit;
    gbEmpresa: TGroupBox;
    fraMO_CONTRATO: TfraEmpresa;
    Label1: TLabel;
    gbBanco: TGroupBox;
    fraVA_IDBANCO: TfraCodDesc;
    GroupBox1: TGroupBox;
    edplandepago: TIntEdit;
    edVA_NROCHEQUE: TPatternEdit;
    gbFechaDistrib: TGroupBox;
    Label2: TLabel;
    edMO_FECHADISTDesde: TDateComboBox;
    edMO_FECHADISTHasta: TDateComboBox;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    ShortCutControl1: TShortCutControl;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure edplandepagoExit(Sender: TObject);
    procedure QueryPrintReportBegin(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
  private
    procedure CalcTotales;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;    
  end;

var
  frmControlImputacion: TfrmControlImputacion;

const
  MAXCOLS = 1;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('PAGOS', 'DEVENGADOS');

  SQL_BASE =
    'SELECT ZMO.MO_CONTRATOPRINCIPAL CONTRATO, ZMO.MO_PERIODO PERIODO, CM_CODIGO, CM_DESCRIPCION,' +
          ' DECODE(CM_OPERACION, ''E'', MO_IMPORTE, 0) DEVENGADOS,' +
          ' DECODE(CM_OPERACION, ''C'', MO_IMPORTE, ''R'', MO_IMPORTE, 0) PAGOS, MO_FECHARECEPCION F_RECEPCION,' +
          ' MO_FECHADIST F_DIST, MO_FECHARECA F_RECAUDACION,' +
          ' DECODE(MO_CODIGORECEPCION, ''1'', ''DGI'', ''2'', ''MANUAL'', ''4'', ''AUTOMÁTICO'', ''5'', ''AUTOMÁTICO'') TIPO_RECEP,' +
          ' ZBA.BA_NOMBRE BANCO, ZCBCHEQUE.CB_NUMERO CUENTA, MO_CODTIPOREGIMEN CODREG,' +
          ' DECODE(TV_CODIGO, ''EFE'', TV_DESCRIPCION, VA_NROCHEQUE) VALOR, TB_DESCRIPCION ESTADO_VALOR,' +
          ' COBRANZA.GET_PLANPAGO(ZMO.MO_IDVALOR, ZMO.MO_CONTRATO, ZMO.MO_IDPLANVALOR) PLANPAGO, BD_NUMERO BOLETA,' +
          ' ZMO.MO_USUALTA, TRUNC (ZMO.MO_FECHAALTA) FECHAALTA, TRUNC(CB_FECHAAPROBADO) F_CONCILIADO,' +
          ' CB_USUAPROBADO USU_CONCILIADO, RC_PERIODONOMINA DDJJ, EM_NOMBRE RAZONSOCIAL' +
     ' FROM AEM_EMPRESA, ACO_CONTRATO_EXT, OTV_TIPOVALOR, RBD_BOLETADEPOSITO, ZCB_CUENTABANCARIA ZCBCHEQUE,' +
          ' XCP_CIERREPAGO, ZMO_MOVIMIENTO ZMO, ZRC_RESUMENCOBRANZA_EXT, ZCM_CODIGOMOVIMIENTO, CTB_TABLAS, ZBA_BANCO ZBA,' +
          ' ZVA_VALOR, OMB_MOVIMIENTOBANCO, OCB_CONCILIACIONBANCARIA' +
    ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID' +
      ' AND MO_CONTRATO = RC_CONTRATO' +
      ' AND RC_PERIODO = MO_PERIODO' +
      ' AND VA_ESTADO = TB_CODIGO' +
      ' AND '''' || TB_CLAVE = ''ESVAL''' +
      ' AND MO_IDVALOR = VA_ID' +
      ' AND VA_IDBANCO = ZBA.BA_ID(+)' +
      ' AND MO_IDCIERREPAGO = CP_ID(+)' +
      ' AND VA_IDBOLETADEP = BD_ID' +
      ' AND BD_IDCUENTABANCARIA = ZCBCHEQUE.CB_ID' +
      ' AND VA_IDTIPOVALOR = TV_ID' +
      ' AND MB_IDCOMP(+) = BD_ID' +
      ' AND MB_TIPOCOMP(+) = ''2''' +
      ' AND MB_ID = CB_IDMOVIMIENTO(+)' +
      ' AND CM_OPERACION IN (''C'', ''R'', ''E'')' +
      ' AND RC_CONTRATO = CO_CONTRATO' +
      ' AND CO_IDEMPRESA = EM_ID';

implementation

uses
  unFiltros, DbFuncs, CustomDlgs, Numeros, General, StrFuncs, SQLFuncs, AnsiSQL, unDmPrincipal;

var
  TotalConsulta: Array of Extended;

{$R *.DFM}

procedure TfrmControlImputacion.RefreshData;
var
  sSQL: String;
begin
  edplandepagoExit(nil);
  sSQL := SQL_BASE;
  if not edplandepago.IsEmpty then
    AddCondition(sSQL, ' COBRANZA.GET_PLANPAGO(ZMO.MO_IDVALOR, ZMO.MO_CONTRATOPRINCIPAL, ZMO.MO_IDPLANVALOR ) = ' + SQLValue(edplandepago.Value));

  sdqConsulta.SQL.Text := sSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmControlImputacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('DEVENGADOS')).Currency := True;
  TFloatField(DataSet.FieldByName('PAGOS')).Currency      := True;
end;

procedure TfrmControlImputacion.tbPropiedadesClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbPropiedades.Down;
end;

procedure TfrmControlImputacion.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbPropiedades.Down;
      if tbPropiedades.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;

  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

procedure TfrmControlImputacion.ClearData;
begin
  inherited;

  fraMO_CONTRATO.Clear;
  edVA_NROCHEQUE.Clear;
  edplandepago.Clear;
  edBD_NUMERO.Clear;
  fraVA_IDBANCO.Clear;
  edMO_PERIODODesde.Clear;
  edMO_PERIODOHasta.Clear;
  cmbCB_FECHAAPROBADODesde.Clear;
  cmbCB_FECHAAPROBADOHasta.Clear;
  edMO_FECHADISTDesde.Clear;
  edMO_FECHADISTHasta.Clear;
  edTotalRegistros.Clear;
  
  fraMO_CONTRATO.mskCUIT.SetFocus
end;

procedure TfrmControlImputacion.FormCreate(Sender: TObject);
begin
  inherited;

  with fraMO_CONTRATO do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  SetLength(TotalConsulta,  MAXCOLS  + 1);
end;

procedure TfrmControlImputacion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]));
end;

procedure TfrmControlImputacion.edplandepagoExit(Sender: TObject);
begin
  inherited;

  if not edplandepago.IsEmpty then
    fraMO_CONTRATO.Contrato := ValorSQLIntegerEx('SELECT PP_CONTRATO' +
                                                  ' FROM ZPP_PLANPAGO' +
                                                 ' WHERE PP_ID = :Id', [edplandepago.Value]);
end;

procedure TfrmControlImputacion.QueryPrintReportBegin(Sender: TObject);
var
  AField: TPrintField;
begin
  AField := QueryPrint.FieldByName['PAGOS'];
  if Assigned(AField) then
  begin
    QueryPrint.Fields[0].TotalType := ttCustom;
    AField.TotalType   := ttAutoSum;
    AField.FormatFloat := '$ #,##0.00';
  end;

  AField := QueryPrint.FieldByName['DEVENGADOS'];
  if Assigned(AField) then
  begin
    AField.TotalType   := ttAutoSum;
    AField.FormatFloat := '$ #,##0.00';
  end;

  inherited;
end;

procedure TfrmControlImputacion.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.Index = 0 then
    Value := 'Total:';

  inherited;
end;

end.
