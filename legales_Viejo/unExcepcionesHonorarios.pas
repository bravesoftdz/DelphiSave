unit unExcepcionesHonorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, StdCtrls, unArtDbFrame, unFraEmpresa,
  PeriodoPicker, RxPlacemnt;

type
  TfrmExcepcionesHonorarios = class(TfrmCustomConsulta)
    gbEstudio: TGroupBox;
    fraEstudio: TfraStaticCodigoDescripcion;
    gbEmpresa: TGroupBox;
    Label19: TLabel;
    fraEmpresa: TfraEmpresa;
    gbPeriodo: TGroupBox;
    lblPerDesde: TLabel;
    edPeriodoDesde: TPeriodoPicker;
    lblPerHasta: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbIncluirHonorarios: TToolButton;
    ToolButton2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbIncluirHonorariosClick(Sender: TObject);
  private
    procedure CalcTotales;
  public
  protected
    procedure RefreshData; override;
  end;

var
  frmExcepcionesHonorarios: TfrmExcepcionesHonorarios;

implementation

uses
  unDmPrincipal, AnsiSql, General, CustomDlgs, Strfuncs, DbFuncs, unFraCodigoDescripcion,
  unArt, unPrincipal, unSesion, SqlFuncs;

var
  Totales :array of extended;

Const
  MAXCOLS = 0;

  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('IMPORTE');


{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.RefreshData;
var
  sSql, sWhere: String;
begin
  Verificar((edPeriodoDesde.Text <> '') and (edPeriodoHasta.Text <> '') and (edPeriodoDesde.Text > edPeriodoHasta.Text), edPeriodoHasta, 'El Periodo Hasta no puede ser menor al Periodo Desde');

  sWhere := '';

  sSql := 'SELECT GC_ID ESTUDIO, GC_NOMBRE NOMBRE_ESTUDIO, CO_CONTRATO CONTRATO, EM_NOMBRE NOMBRE_EMPRESA, ' +
                 'EM_CUIT CUIT, CM_DESCRIPCION CONCEPTO, MO_PERIODO PERIODO, MO_ID IDMOVIM, ' +
                 'CTBCODREC.TB_DESCRIPCION TIPO, ' +
                 'MO_IMPORTE IMPORTE, MO_FECHARECA FECHA_RECAUDACION, BA_NOMBRE BANCO, CB_NUMERO CUENTA ' +
            'FROM CTB_TABLAS CTBCODREC, ZBA_BANCO, ZCB_CUENTABANCARIA, RRM_REMESA, AGC_GESTORCUENTA, ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO, ' +
                 'AEM_EMPRESA, ACO_CONTRATO ' +
           'WHERE CM_ID = MO_IDCODIGOMOVIMIENTO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND GC_ID = CO_IDESTUDIO ' +
             'AND CTBCODREC.TB_CLAVE (+) = ''RECPC'' ' +
             'AND CTBCODREC.TB_CODIGO (+) = MO_CODIGORECEPCION ' +
             'AND MO_CONTRATOPRINCIPAL = CO_CONTRATO ' +
             'AND RM_ID (+) = MO_IDREMESA ' +
             'AND CB_ID (+) = RM_IDCUENTABANCARIA ' +
             'AND BA_ID (+) = CB_IDBANCO ' +
             'AND CM_OPERACION = ''R'' ' +
             'AND CM_CONCEPTO = ''C'' ' +
             'AND MO_IDVALOR IS NULL ' +
             'AND MO_IDCIERREHONORARIO IS NULL ' +
             'AND NOT EXISTS (SELECT 1 ' +
                               'FROM LEH_EXCEPCIONHONORARIO ' +
                              'WHERE EH_IDMOVIM = MO_ID) '; 

  if fraEstudio.IsSelected then
    sWhere := sWhere + ' AND GC_ID = ' + SqlValue(fraEstudio.Value);

  if fraEmpresa.IsSelected then
    sWhere := sWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

  if edPeriodoDesde.Text <> '' then
    sWhere := sWhere + ' AND MO_PERIODO >= ' + SqlValue(edPeriodoDesde.Text);
  if edPeriodoHasta.Text <> '' then
    sWhere := sWhere + ' AND MO_PERIODO <= ' + SqlValue(edPeriodoHasta.Text);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;

  CalcTotales;
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  SetLength(Totales, MAXCOLS + 1);

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ',' +
          ' GC_ID ' + CD_ALIAS_CODIGO + ',' +
          ' GC_NOMBRE ' + CD_ALIAS_DESC + ',' +
          ' GC_FECHABAJA ' + CD_ALIAS_BAJA +
     ' FROM AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO IS NULL' +
      ' AND GC_ESTUDIO = ''S''';

  with fraEstudio do
    begin
      Sql := sSql;
      ShowBajas := True;
    end;

  fraEmpresa.ShowBajas := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEstudio.Clear;
  fraEmpresa.Clear;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;

  fraEstudio.edCodigo.SetFocus;
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, Totales);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(Totales[iPos]), '$');
end;
{-------------------------------------------------------------------------------}
procedure TfrmExcepcionesHonorarios.tbIncluirHonorariosClick(Sender: TObject);
var
  i: integer;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro.');

  BeginTrans;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

        sSql := 'INSERT INTO LEH_EXCEPCIONHONORARIO(EH_ID, EH_IDGESTOR, EH_IDMOVIM, EH_USUALTA, EH_FECHAALTA) ' +
                   'VALUES(SEQ_LEH_ID.NEXTVAL, :IdGestor, :IdMovin, :Usuario, SYSDATE)';

        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ESTUDIO').AsInteger, sdqConsulta.FieldByName('IDMOVIM').AsInteger,
                               Sesion.UserId]);
      end;

    CommitTrans;
    MsgBox('Honorarios incluidos correctamente.', MB_OK+MB_ICONINFORMATION);
  except
    on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;  
  end;
end;
{-------------------------------------------------------------------------------}
end.

