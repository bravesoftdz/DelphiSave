unit unSeguimientoProcesos;

interface
                      
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmSeguimientoProcesos = class(TfrmCustomConsulta)
    gbFechaAlta: TGroupBox;
    Label5: TLabel;
    edFechaInicioDesde: TDateComboBox;
    edFechaInicioHasta: TDateComboBox;
    chkProcesosNoFinalizados: TCheckBox;
    chkAutoRefrescar: TCheckBox;
    tmrAutoRefrescar: TTimer;
    gbProceso: TGroupBox;
    edProceso: TEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure chkAutoRefrescarClick(Sender: TObject);
    procedure tmrAutoRefrescarTimer(Sender: TObject);
  private
    FSector: String;
  public
    property Sector: String read FSector write FSector;
  end;

var
  frmSeguimientoProcesos: TfrmSeguimientoProcesos;

implementation

uses
  AnsiSql, StrFuncs;

{$R *.DFM}

procedure TfrmSeguimientoProcesos.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sSqlWhere: String;
begin
  sSql :=
    'SELECT TC_PROCESO, TC_REGISTROS, TC_CHECKPOINT, TC_FECHAINICIO FINICIO, TC_FECHAPROCESO FPROCESO,' +
          ' TC_FECHAFIN FFIN,' +
          ' DECODE(TC_FECHAINICIO, NVL(TC_FECHAFIN, TC_FECHAPROCESO), 0, ROUND(TC_REGISTROS / ((NVL(TC_FECHAFIN, TC_FECHAPROCESO) - TC_FECHAINICIO) * 24 * 60), 2)) REGXMINUTO' +
     ' FROM CTC_TABLACONTROL' +
    ' WHERE 1 = 1';

  sSqlWhere := SqlBetween(' AND TRUNC(NVL(TC_FECHAINICIO, TC_FECHAFIN))', edFechaInicioDesde.Date, edFechaInicioHasta.Date);

  if not IsEmptyString(Sector) then
    sSqlWhere := sSqlWhere + ' AND TC_SECTOR = ' + SqlValue(Sector);

  if not IsEmptyString(edProceso.Text) then
    sSqlWhere := sSqlWhere + ' AND UPPER(TC_PROCESO) LIKE ' + SqlValue('%' + Trim(edProceso.Text) + '%');

  if chkProcesosNoFinalizados.Checked then
    sSqlWhere := sSqlWhere + ' AND TC_FECHAFIN IS NULL';

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmSeguimientoProcesos.tbLimpiarClick(Sender: TObject);
begin
  edFechaInicioDesde.Clear;
  edFechaInicioHasta.Clear;
  edProceso.Clear;
  
  inherited;
end;

procedure TfrmSeguimientoProcesos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('REGXMINUTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('REGXMINUTO')).DisplayFormat := '0.00';
end;

procedure TfrmSeguimientoProcesos.chkAutoRefrescarClick(Sender: TObject);
begin
  tmrAutoRefrescar.Enabled := chkAutoRefrescar.Checked;
end;

procedure TfrmSeguimientoProcesos.tmrAutoRefrescarTimer(Sender: TObject);
begin
  tbRefrescarClick(nil);
end;

end.
