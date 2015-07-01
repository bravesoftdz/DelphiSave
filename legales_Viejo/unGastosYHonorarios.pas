unit unGastosYHonorarios;

interface
               
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArt, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Mask, ToolEdit, DateComboBox, CurrEdit,
  PatternEdit;

type
  TfrmGastosYHonorarios = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    Label2: TLabel;
    fraGC_CONCEPTO: TfraStaticCTB_TABLAS;
    Label7: TLabel;
    edGC_FECHA: TDateComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edGC_OBSERVACIONES: TMemo;
    edGC_IMPORTE: TCurrencyEdit;
    edGC_FACTURATIPO: TPatternEdit;
    edGC_FACTURANRO: TMaskEdit;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CompletarFactura(Sender: TObject);
  private
    FIdConcQuiebra: TTAbleId;
    procedure SetIdConcQuiebra(const Value: TTAbleId);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property IdConcQuiebra: TTAbleId     read FIdConcQuiebra       write SetIdConcQuiebra;
  end;

implementation

{$R *.dfm}

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs, StrFuncs, unDmPrincipal, Numeros,
  unComunes;

procedure TfrmGastosYHonorarios.ClearControls;
begin
  fraGC_CONCEPTO.Clear;
  edGC_FECHA.Clear;
  edGC_FACTURATIPO.Clear;
  edGC_FACTURANRO.Clear;
  edGC_IMPORTE.Clear;
  edGC_OBSERVACIONES.Clear;
end;

function TfrmGastosYHonorarios.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      TableName := 'LGC_GASTOCONCYQUIEBRA';

      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('GC_ID',      sdqConsulta.FieldByName('GCID').AsInteger);
          Fields.Add('GC_FECHABAJA',   exDateTime);
          Fields.Add('GC_USUBAJA',     Sesion.UserId);

          SqlType := stUpdate;
        end
      else if ModoABM = maAlta then
        begin
          PrimaryKey.AddExpression('GC_ID', 'SEQ_LGC_ID.NEXTVAL');
          Fields.Add('GC_FECHAALTA',        exDateTime);
          Fields.Add('GC_USUALTA',          Sesion.UserId);

          Fields.Add('GC_IDCONCYQUIEBRA',   FIdConcQuiebra);
          Fields.Add('GC_CONCEPTO',         fraGC_CONCEPTO.Codigo);
          Fields.Add('GC_FECHA',            edGC_FECHA.Date);
          Fields.Add('GC_FACTURA',          edGC_FACTURATIPO.Text + '-' + edGC_FACTURANRO.Text );
          Fields.Add('GC_IMPORTE',          edGC_IMPORTE.Value);
          Fields.Add('GC_OBSERVACIONES',    edGC_OBSERVACIONES.Lines.Text);

          SqlType := stInsert;
        end;
    end;

  Result := inherited DoABM;
end;

procedure TfrmGastosYHonorarios.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

function TfrmGastosYHonorarios.Validar: Boolean;
var
  sSql, sFConcurso, sFQuiebra: String;
  bEsMultiple, bEsCorresponsalia: Boolean;
  SqlResults, SqlResults2: TStringList;
  dImporteAnt, dTope: Currency;
begin
  Verificar(fraGC_CONCEPTO.IsEmpty, fraGC_CONCEPTO, 'El concepto es obligatorio.');
  Verificar(edGC_FECHA.IsEmpty, edGC_FECHA, 'La fecha es obligatoria.');
  Verificar(edGC_FECHA.Date > DBDate(), edGC_FECHA, 'La fecha no puede ser mayor a la actual.');
  Verificar(IsEmptyString(edGC_FACTURATIPO.Text), edGC_FACTURATIPO, 'El tipo de factura es obligatorio.');
  Verificar(edGC_FACTURANRO.Text = '    -        ', edGC_FACTURANRO, 'El número de la factura es obligatorio.');
  Verificar(edGC_IMPORTE.Value = 0, edGC_IMPORTE, 'El importe es obligatorio.');

  sSql := 'SELECT TB_ESPECIAL1 CORRESPONSALIA ' +
            'FROM CTB_TABLAS ' +
           'WHERE TB_CLAVE = ''JURIS'' ' +
             'AND TB_CODIGO = (SELECT CQ_JURISDICCION ' +
                                'FROM LCQ_CONCYQUIEBRA ' +
                               'WHERE CQ_NROORDEN = :IdCQuiebra)';
  bEsCorresponsalia := (ValorSqlEx(sSql, [FIdConcQuiebra]) = 'S');

  sSql := 'SELECT TB_ESPECIAL1 MULTIPLE, NVL(TB_ESPECIAL2, 0) TOPE ' +
            'FROM CTB_TABLAS ' +
           'WHERE TB_CLAVE = ''LCGCQ'' ' +
             'AND TB_CODIGO = ' + SqlValue(fraGC_CONCEPTO.Codigo);
  SqlResults := ValoresColSQL(sSql);

  try
    bEsMultiple := (SqlResults[0] = 'S');
    dTope       := StrToFloat(SqlResults[1]);
  finally
    SqlResults.Free;
  end;

  if not bEsMultiple then
    begin
      sSql := 'SELECT COUNT(*) CANTIDAD ' +
                'FROM LGC_GASTOCONCYQUIEBRA ' +
               'WHERE GC_CONCEPTO = :Concepto ' +
                 'AND GC_IDCONCYQUIEBRA = :IdCQuiebra ' +
                 'AND GC_FECHABAJA IS NULL';

      Verificar(ValorSqlIntegerEx(sSql, [fraGC_CONCEPTO.Codigo, FIdConcQuiebra]) > 0, fraGC_CONCEPTO, 'No es posible agregar un nuevo registro para este concepto.');
    end;

  sSql := 'SELECT NVL(SUM(GC_IMPORTE), 0) ANTERIOR ' +
            'FROM LGC_GASTOCONCYQUIEBRA ' +
           'WHERE GC_CONCEPTO = :Concepto ' +
             'AND GC_IDCONCYQUIEBRA = :IdCQuiebra ' +
             'AND GC_FECHABAJA IS NULL';
  dImporteAnt := ValorSqlExtendedEx(sSql, [fraGC_CONCEPTO.Codigo, FIdConcQuiebra]);

  if bEsCorresponsalia and ((fraGC_CONCEPTO.Codigo = '01') or (fraGC_CONCEPTO.Codigo = '02')) then
    dTope := RoundNumber(dTope / 2, 2);

  Verificar((dTope > 0) and (edGC_IMPORTE.Value + dImporteAnt > dTope), edGC_IMPORTE, 'El importe supera el tope (' + FloatToStr(dTope) + ') para este concepto.');

  Verificar(not bEsCorresponsalia and (fraGC_CONCEPTO.Codigo = '03'), fraGC_CONCEPTO, 'No se permiten gastos de corresponsalía por la jurisdicción del concurso/quiebra.');

  sSql := 'SELECT CQ_FECHACONCURSO, CQ_FECHAQUIEBRA ' +
            'FROM LCQ_CONCYQUIEBRA ' +
            'WHERE CQ_NROORDEN = ' + SqlValue(FIdConcQuiebra);
  SqlResults2 := ValoresColSQL(sSql);

  try
    sFConcurso := SqlResults2[0];
    sFQuiebra  := SqlResults2[1];
  finally
    SqlResults2.Free;
  end;

  Verificar((fraGC_CONCEPTO.Codigo = '01') and IsEmptyString(sFConcurso), fraGC_CONCEPTO, 'Esta operación no es posible si la fecha de concurso es nula.');
  Verificar((fraGC_CONCEPTO.Codigo = '02') and IsEmptyString(sFQuiebra), fraGC_CONCEPTO, 'Esta operación no es posible si la fecha de quiebra es nula.');

  Result := True;
end;

procedure TfrmGastosYHonorarios.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT TB_DESCRIPCION CONCEPTO, GC_FECHA FECHA, GC_FACTURA FACTURA, GC_IMPORTE IMPORTE, ' +
                 'GC_OBSERVACIONES OBSERVACIONES, TRUNC(GC_FECHABAJA) FECHABAJA, GC_ID GCID ' +
            'FROM CTB_TABLAS, LGC_GASTOCONCYQUIEBRA ' +
           'WHERE TB_CODIGO = GC_CONCEPTO ' +
             'AND TB_CLAVE = ''LCGCQ'' ' +
             'AND GC_IDCONCYQUIEBRA = ' + SqlValue(FIdConcQuiebra);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmGastosYHonorarios.SetIdConcQuiebra(const Value: TTAbleId);
begin
  FIdConcQuiebra := Value;

  tbRefrescarClick(Nil);
end;

procedure TfrmGastosYHonorarios.FormCreate(Sender: TObject);
begin
  inherited;

  with fraGC_CONCEPTO do
    begin
      Clave     := 'LCGCQ';
      ShowBajas := False;
    end;

  FieldBaja := 'FECHABAJA';
end;

procedure TfrmGastosYHonorarios.CompletarFactura(Sender: TObject);
begin
  TMaskEdit(Sender).Text := Get_NroFacturaCompleto(TMaskEdit(Sender).Text);
end;

procedure TfrmGastosYHonorarios.LoadControls;
begin
//  inherited;

end;

end.
