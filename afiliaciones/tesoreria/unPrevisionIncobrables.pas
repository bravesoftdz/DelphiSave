unit unPrevisionIncobrables;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion, unFraActividad,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit, DateComboBox, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, PeriodoPicker, Menus;

type
  TfrmPrevisionIncobrables = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    fraActividad: TfraActividad;
    GroupBox3: TGroupBox;
    fraSector: TfraStaticCTB_TABLAS;
    GroupBox4: TGroupBox;
    fraEstado: TfraStaticCTB_TABLAS;
    GroupBox5: TGroupBox;
    fraMotivoBaja: TfraStaticCTB_TABLAS;
    GroupBox6: TGroupBox;
    dcbFechaBajaDesde: TDateComboBox;
    Label2: TLabel;
    dcbFechaBajaHasta: TDateComboBox;
    GroupBox7: TGroupBox;
    checkConcurso: TCheckBox;
    Label1: TLabel;
    cbSaldoTotal: TComboBox;
    GroupBox8: TGroupBox;
    ppPeriodo: TPeriodoPicker;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbImprimir2: TToolButton;
    tbTotalesRegGrilla: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimir2Click(Sender: TObject);
  private
  public
  protected
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 6;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('SALDO_TOTAL', 'SALDO_SUJ_PREV', 'SALDO_NO_SUJ_PREV', 'TASASSN',
                                               'COMISION', 'PREVISION', 'COMISION_SUJ_PREV');

var
  frmPrevisionIncobrables: TfrmPrevisionIncobrables;
  TotalConsulta: Array of Extended;

implementation

uses
  AnsiSql, unPrincipal, CustomDlgs, DbFuncs, General, unPrevIncobrabilidad;

{$R *.DFM}

function TfrmPrevisionIncobrables.Validar: Boolean;
begin
  Result := False;
end;


procedure TfrmPrevisionIncobrables.ClearControls;
begin
  ppPeriodo.Clear;
  fraEmpresa.Clear;
  fraActividad.Clear;
  fraSector.Clear;
  fraEstado.Clear;
  checkConcurso.Checked := False;
  cbSaldoTotal.ItemIndex := 0;
  fraMotivoBaja.Clear;
  dcbFechaBajaDesde.Clear;
  dcbFechaBajaHasta.Clear;
end;

procedure TfrmPrevisionIncobrables.LoadControls;
begin
  Exit;
end;

procedure TfrmPrevisionIncobrables.RefreshData;
var
  sSql: String;
begin
  Verificar(ppPeriodo.Periodo.IsNull, ppPeriodo, 'Debe ingresar un período.');

  sSql := 'SELECT CUIT, NOMBRE, CONTRATO, ACTIVIDAD, SECTOR, ESTADO, FECHA_BAJA, MOT_BAJA, CONCURSO, QUIEBRA, SALDO_TOTAL, SALDO_SUJ_PREV, ' +
                 'SALDO_TOTAL - SALDO_SUJ_PREV SALDO_NO_SUJ_PREV, CODESTADO, CODMOTIVOBAJA, ' +
                 'ROUND(SALDO_SUJ_PREV -(SALDO_SUJ_PREV /(1 + TASA / 100)),2) TASASSN, COMISION, COMISION_SUJ_PREV, ' +
                 'NVL(FIJO_PREV,ROUND((SALDO_SUJ_PREV /(1 + TASA / 100)) - COMISION_SUJ_PREV,2)) PREVISION ' +
            'FROM (SELECT EM_CUIT CUIT, EM_NOMBRE NOMBRE, CO_CONTRATO CONTRATO, AC_CODIGO ACTIVIDAD, EM_SECTOR SECTOR, ' +
                         'EST.TB_DESCRIPCION ESTADO, CO_FECHABAJA FECHA_BAJA, BAJA.TB_DESCRIPCION MOT_BAJA, EM_FECHACONCURSO CONCURSO, ' +
                         'EM_FECHAQUIEBRA QUIEBRA, CO_ESTADO CODESTADO, CO_MOTIVOBAJA CODMOTIVOBAJA, ' +
                         'PD_SALDO SALDO_TOTAL, PD_SALDOSUJETO SALDO_SUJ_PREV, PD_COMISION COMISION, ' +
                         'PD_COMISIONSUJETA COMISION_SUJ_PREV, PD_MONTOFIJO FIJO_PREV, CONT.GET_TASASSN TASA ' +
                    'FROM CTB_TABLAS BAJA, CTB_TABLAS EST, CAC_ACTIVIDAD, AEM_EMPRESA, ACO_CONTRATO, OPD_PREVISIONINCOBDETALLE ' +
                   'WHERE EM_ID = CO_IDEMPRESA ' +
                     'AND AC_ID = CO_IDACTIVIDAD ' +
                     'AND EST.TB_CODIGO = CO_ESTADO ' +
                     'AND EST.TB_CLAVE = ''AFEST'' ' +
                     'AND BAJA.TB_CODIGO(+) = CO_MOTIVOBAJA ' +
                     'AND BAJA.TB_CLAVE(+) = ''MOTIB'' ' +
                     'AND CO_CONTRATO = AFILIACION.GET_ULTCONTRATO(EM_CUIT) ' +
                     'AND EM_CUIT = PD_CUIT ' +
                     'AND PD_PERIODO = ' + SqlValue(ppPeriodo.Periodo.Valor) + ')'  +
          ' WHERE (1 = 1)';

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND CUIT = ' + SqlValue(fraEmpresa.CUIT);

  if not fraActividad.IsEmpty then
    sSql := sSql + ' AND ACTIVIDAD = ' + SqlValue(fraActividad.Codigo);

  if not fraSector.IsEmpty then
    sSql := sSql + ' AND SECTOR = ' + SqlValue(fraSector.Value);

  if not fraEstado.IsEmpty then
    sSql := sSql + ' AND CODESTADO = ' + SqlValue(fraEstado.Value);

  if checkConcurso.Checked then
    sSql := sSql + ' AND (CONCURSO is not NULL or QUIEBRA is not NULL)';

  if cbSaldoTotal.ItemIndex > 0 then
    sSql := sSql + ' AND SALDO_TOTAL ' + cbSaldoTotal.Text;

  if not fraMotivoBaja.IsEmpty then
    sSql := sSql + ' AND CODMOTIVOBAJA = ' + SqlValue(fraMotivoBaja.Value);

  if (not dcbFechaBajaDesde.IsEmpty) and (not dcbFechaBajaHasta.IsEmpty) then
    sSql := sSql + ' AND TRUNC(FECHA_BAJA) between ' + SqlValue(dcbFechaBajaDesde.Date) + ' AND ' + SqlValue(dcbFechaBajaHasta.Date)
  else if not dcbFechaBajaDesde.IsEmpty then
    sSql := sSql + ' AND TRUNC(FECHA_BAJA) >= ' + SqlValue(dcbFechaBajaDesde.Date)
  else  if not dcbFechaBajaHasta.IsEmpty then
    sSql := sSql + ' AND TRUNC(FECHA_BAJA) <= ' + SqlValue(dcbFechaBajaHasta.Date);

  sdqConsulta.Sql.Text := sSql + ' ' + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPrevisionIncobrables.FormCreate(Sender: TObject);
begin
  inherited;

  ClearControls;

  ShowActived := False;

  fraEmpresa.ShowBajas := True;
  fraSector.Clave := 'SECT';
  fraEstado.Clave := 'AFEST';
  fraMotivoBaja.Clave := 'MOTIB';

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmPrevisionIncobrables.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  ClearControls;
end;

procedure TfrmPrevisionIncobrables.tbTotalesRegGrillaClick(Sender: TObject);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbTotalesRegGrilla.Down;
      if tbTotalesRegGrilla.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmPrevisionIncobrables.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                   FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := '$ ' + FloatToStr(TotalConsulta[iPos]);
end;

procedure TfrmPrevisionIncobrables.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  iLoop: Integer;
begin
  inherited;

  for iLoop := 0 to MAXCOLS do
    if sdqConsulta.FieldByName(CAMPOS_SUMA[iLoop]) is TFloatField then
      TFloatField(sdqConsulta.FieldByName(CAMPOS_SUMA[iLoop])).Currency := True;
end;

procedure TfrmPrevisionIncobrables.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmPrevisionIncobrables.tbImprimir2Click(Sender: TObject);
begin
  with TfrmPrevIncobrabilidad.Create(nil) do
  try
    ShowModal;
  finally
    free;
  end;
end;

end.
