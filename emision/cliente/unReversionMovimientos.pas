unit unReversionMovimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, StdCtrls,
  unFraStaticCodigoDescripcion, PeriodoPicker, Menus;

type
  TComportamientoForm = (cfCobranzas, cfEmision);

  TfrmReversionMovimientos = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    Label3: TLabel;
    fraContrato: TfraEmpresa;
    gbMovimiento: TGroupBox;
    fraCodigoMovimiento: TfraStaticCodigoDescripcion;
    gbPeriodos: TGroupBox;
    ppPeriodoDesde: TPeriodoPicker;
    lbRSocial: TLabel;
    Label1: TLabel;
    ppPeriodoHasta: TPeriodoPicker;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbRevertir: TToolButton;
    pmnuMarcar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbRevertirClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure QueryPrintReportBegin(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField;
      var Value: String);
  private
    FContrato: Integer;
    FComportamiento: TComportamientoForm;
    procedure CalcTotales;
    procedure SetContrato(const Value: Integer);
    procedure SetComportamiento(const Value: TComportamientoForm);
  public
    property Contrato: Integer                   read FContrato       write SetContrato;
    property Comportamiento: TComportamientoForm read FComportamiento write SetComportamiento;
  end;

  function Get_TipoCodigoMovim(Comportam: TComportamientoForm): String;

var
  frmReversionMovimientos: TfrmReversionMovimientos;
  TotalConsulta : array of extended;

const
  MAXCOLS = 0;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('IMPORTE');

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, SqlFuncs, General, DbFuncs, Periodo, Strfuncs,
  unArt, unSesion;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraContrato.Clear;
  fraCodigoMovimiento.Clear;
  ppPeriodoDesde.Clear;
  ppPeriodoHasta.Clear;

  fraContrato.mskCUIT.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  Verificar( fraContrato.IsEmpty, fraContrato.edContrato, 'Debe seleccionar un contrato');
  Verificar( fraCodigoMovimiento.IsEmpty, fraCodigoMovimiento.edCodigo, 'Debe seleccionar un código de movimiento');


  sSqlWhere := ' AND A.MO_CONTRATO=' + SqlValue( fraContrato.Contrato ) +
               ' AND A.MO_IDCODIGOMOVIMIENTO=' + SqlValue( fraCodigoMovimiento.Value ) +
               ' ' + SqlBetween( 'AND A.MO_PERIODO', ppPeriodoDesde.Periodo.Valor, ppPeriodoHasta.Periodo.Valor );

  sSql := 'SELECT A.MO_CONTRATO CONTRATO, A.MO_PERIODO PERIODO, A.MO_IDCODIGOMOVIMIENTO IDCODIGOMOVIMIENTO, ' +
                 'A.MO_IMPORTE IMPORTE, A.MO_FECHADIST FECHADIST, A.MO_FECHARECA FECHARECA ' +
            'FROM ZMO_MOVIMIENTO A ' +
           'WHERE 1=1 ' +
           sSqlWhere + ' ' +
             'AND EXISTS (SELECT 1 ' +
                           'FROM ZMO_MOVIMIENTO B ' +
                          'WHERE A.MO_CONTRATO=B.MO_CONTRATO ' +
                            'AND A.MO_PERIODO=B.MO_PERIODO ' +
                            'AND A.MO_IDCODIGOMOVIMIENTO=B.MO_IDCODIGOMOVIMIENTO ' +
                       'GROUP BY B.MO_CONTRATO, B.MO_PERIODO, B.MO_IDCODIGOMOVIMIENTO ' +
                         'HAVING SUM(B.MO_IMPORTE)<>0) ';

  sdqConsulta.SQL.Text := sSql + NVL( SortDialog.OrderBy, 'ORDER BY A.MO_PERIODO' );

  inherited;
  CalcTotales;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.FormCreate(Sender: TObject);
begin
  inherited;

  fraContrato.ShowBajas := True;

  SetLength( TotalConsulta,  MAXCOLS  + 1 );
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName( 'IMPORTE' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'IMPORTE' ) ).Currency := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.tbTotalesRegGrillaClick(Sender: TObject);
begin
  CalcTotales;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.CalcTotales;
begin
(*
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbTotalesRegGrilla.Down;
      if tbTotalesRegGrilla.Down and sdqConsulta.Active then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
*)
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.tbRevertirClick(Sender: TObject);
var
  iContrato, i: Integer;
  dImporte: Currency;
  sPeriodo, sSql: String;
  IdCodigoMovimiento: TTableId;
  Sql: TSql;
  fReca: TDateTime;
begin
  Verificar( Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla' );

  iContrato          := sdqConsulta.FieldByName( 'CONTRATO' ).AsInteger;
  IdCodigoMovimiento := sdqConsulta.FieldByName( 'IDCODIGOMOVIMIENTO' ).AsInteger;

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[i]) );
      sPeriodo := sdqConsulta.FieldByName( 'PERIODO' ).AsString;

      sSql := 'SELECT 1 ' +
                'FROM IMM_MOVIMIENTOMANUAL ' +
               'WHERE MM_CONTRATO=' + SqlValue( iContrato ) + ' ' +
                 'AND MM_IDCODIGOMOVIMIENTO=' + SqlValue( IdCodigoMovimiento ) + ' ' +
                 'AND MM_PERIODO=' + SqlValue( sPeriodo ) + ' ' +
                 'AND MM_FECHAAPROBADO IS NULL';

      Verificar( ExisteSql( sSql ), Grid, 'Para el periodo ' + sPeriodo + ' existen movimientos pendientes de aprobar' );
    end;


  if MsgBox( '¿Confirma la reversión de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO ) = IDYES then
    begin
      BeginTrans;
      try
        Sql := TSql.Create();
        try
          for i := 0 to Grid.SelectedRows.Count - 1 do
            begin
              sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[i]) );

              sPeriodo := sdqConsulta.FieldByName( 'PERIODO' ).AsString;
              dImporte := sdqConsulta.FieldByName( 'IMPORTE' ).AsFloat;
              fReca    := sdqConsulta.FieldByName( 'FECHARECA' ).AsDateTime;

              with Sql do
                begin
                  Clear;
                  TableName := 'IMM_MOVIMIENTOMANUAL';

                  PrimaryKey.Add( 'MM_ID',              'SEQ_IMM_ID.NEXTVAL', False );
                  Fields.Add( 'MM_CONTRATO',            iContrato );
                  Fields.Add( 'MM_PERIODO',             sPeriodo );
                  Fields.Add( 'MM_IDCODIGOMOVIMIENTO',  IdCodigoMovimiento );
                  Fields.Add( 'MM_IMPORTE',             -dImporte );
                  Fields.Add( 'MM_FECHARECA',           fReca );
                  Fields.Add( 'MM_FECHAALTA',           exDateTime );
                  Fields.Add( 'MM_USUALTA',             Sesion.UserID );

                  SqlType := stInsert;

                  EjecutarSqlST( sql );
                end;
            end;

            CommitTrans;
            MsgBox( 'Los movimientos se han revertido correctamente', MB_OK );

            tbRefrescarClick( nil );
        finally
          Sql.Free;
        end;
      except
        on E: Exception do
          begin
            RollBack;

            Raise Exception.Create( E.Message + CRLF + 'Error al revertir los movimientos' );
          end;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.SetContrato(const Value: Integer);
begin
  if FContrato <> Value then
    fraContrato.Contrato := Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
end;
{------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.SetComportamiento(const Value: TComportamientoForm);
begin
  FComportamiento := Value;

  with fraCodigoMovimiento do
    begin
      TableName      := 'ZCM_CODIGOMOVIMIENTO';
      FieldId        := 'CM_ID';
      FieldCodigo    := 'CM_CODIGO';
      FieldDesc      := 'CM_DESCRIPCION';
      ShowBajas      := True;
      ExtraCondition := ' AND CM_PERFIL IN ' + Get_TipoCodigoMovim(FComportamiento) + iif(FComportamiento = cfEmision, ' AND CM_MANUAL = ''S''', '');
//      ExtraCondition := ' AND CM_PERFIL IN ' + Get_TipoCodigoMovim(FComportamiento);
    end;
end;
{------------------------------------------------------------------------------}
function Get_TipoCodigoMovim(Comportam: TComportamientoForm): String;
var
  sTipoCodigoMovim: String;
begin
  sTipoCodigoMovim := '';

  case Comportam of
    cfCobranzas:
      sTipoCodigoMovim := '''C'', ''A''';
    cfEmision:
      sTipoCodigoMovim := '''E'', ''A''';
    else
      sTipoCodigoMovim := '';
  end;

  Result := '(' + sTipoCodigoMovim + ')';
end;
{-------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.SubTitle.Lines.Text := 'Contrato: ' + IntToStr(fraContrato.Contrato);

  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.QueryPrintReportBegin(Sender: TObject);
var
  AField: TPrintField;
begin
  AField := QueryPrint.FieldByName['IMPORTE'];
  if Assigned(AField) then
    begin
      QueryPrint.Fields[0].TotalType := ttCustom;
      AField.TotalType   := ttAutoSum;
      AField.FormatFloat := '$ #,##0.00';
    end;

  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmReversionMovimientos.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.Index = 0 then
    Value := 'Total:';

  inherited;
end;
{-------------------------------------------------------------------------------}
end.

