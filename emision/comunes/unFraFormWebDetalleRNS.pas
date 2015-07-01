unit unFraFormWebDetalleRNS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ComCtrls, ToolWin, CurrEdit,
  StdCtrls, ToolEdit, DateComboBox, Mask, PatternEdit, IntEdit, VCLExtra, CustomDlgs, Cuit,
  unDmPrincipal, SqlFuncs, DBSql, unSesion, Periodos, AnsiSql, SDEngine, unConstEmision,
  unFuncionesEmision, Strfuncs, General, QueryToFile, ExportDialog, unVisorPDF;

type
  TfraFormWebDetalleRNS = class(TFrame)
    gbDetalle: TGroupBox;
    dbgRegistros: TDBGrid;
    dsRegistros: TDataSource;
    tbComandosDetalleAdicDetalle: TToolBar;
    edNroTransaccion: TEdit;
    ExportDialog: TExportDialog;
    tbExport: TToolButton;
    lblSecuencia: TLabel;
    sdqRegistros: TSDQuery;
    tbPdf: TToolButton;
    procedure tbExportClick(Sender: TObject);
    procedure sdqRegistrosAfterOpen(DataSet: TDataSet);
    procedure tbPdfClick(Sender: TObject);
  private
  public
    procedure ActivarControles(aActive: boolean);
    procedure CargarFormulario(aIdNotaPeriodo: integer);
  end;

implementation

{$R *.dfm}

procedure TfraFormWebDetalleRNS.ActivarControles(aActive: boolean);
begin
  LockControls(self, not aActive);
  edNroTransaccion.ReadOnly := true;
  tbComandosDetalleAdicDetalle.Enabled := true;
  tbExport.Enabled := true;
end;

procedure TfraFormWebDetalleRNS.CargarFormulario(aIdNotaPeriodo: integer);
var
  aIdNota :integer;
begin
  aIdNota := ValorSqlInteger('SELECT NP_IDNOTA FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaPeriodo));

  OpenQuery(sdqRegistros, ' SELECT op_cuil, op_nombre, op_periodo, op_sueldobruto, op_cantdiastrabajador, op_transaccion, no_contrato, no_secuencia, ' +
                          '        op_presentismo, op_premios, op_antiguedad, op_bonus, op_viaticos, op_refrigerio, op_otrosconceptos, op_vacaciones, ' +
                          '        op_sac, op_horasextras, op_sueldo ' +
                          ' FROM emi.iop_organismopublico, emi.ino_nota, emi.inp_notacontratoperiodo ' +
                          ' WHERE np_idnota = ' + SqlValue(aIdNota) +
                          ' AND no_id = np_idnota ' +
                          ' AND no_transaccion = op_transaccion');

  edNroTransaccion.Text := sdqRegistros.fieldbyname('op_transaccion').AsString;
end;

procedure TfraFormWebDetalleRNS.sdqRegistrosAfterOpen(DataSet: TDataSet);
begin
  if DataSet.Fields.FindField('op_sueldobruto') is TFloatField then
    TFloatField(DataSet.FieldByName('op_sueldobruto')).Currency := True;
  if DataSet.Fields.FindField('op_presentismo') is TFloatField then
    TFloatField(DataSet.FieldByName('op_presentismo')).Currency := True;
  if DataSet.Fields.FindField('op_premios') is TFloatField then
    TFloatField(DataSet.FieldByName('op_premios')).Currency := True;
  if DataSet.Fields.FindField('op_antiguedad') is TFloatField then
    TFloatField(DataSet.FieldByName('op_antiguedad')).Currency := True;
  if DataSet.Fields.FindField('op_bonus') is TFloatField then
    TFloatField(DataSet.FieldByName('op_bonus')).Currency := True;
  if DataSet.Fields.FindField('op_viaticos') is TFloatField then
    TFloatField(DataSet.FieldByName('op_viaticos')).Currency := True;
  if DataSet.Fields.FindField('op_refrigerio') is TFloatField then
    TFloatField(DataSet.FieldByName('op_refrigerio')).Currency := True;
  if DataSet.Fields.FindField('op_otrosconceptos') is TFloatField then
    TFloatField(DataSet.FieldByName('op_otrosconceptos')).Currency := True;
  if DataSet.Fields.FindField('op_vacaciones') is TFloatField then
    TFloatField(DataSet.FieldByName('op_vacaciones')).Currency := True;
  if DataSet.Fields.FindField('op_sac') is TFloatField then
    TFloatField(DataSet.FieldByName('op_sac')).Currency := True;
  if DataSet.Fields.FindField('op_horasextras') is TFloatField then
    TFloatField(DataSet.FieldByName('op_horasextras')).Currency := True;
  if DataSet.Fields.FindField('op_sueldo') is TFloatField then
    TFloatField(DataSet.FieldByName('op_sueldo')).Currency := True;
end;

procedure TfraFormWebDetalleRNS.tbExportClick(Sender: TObject);
begin
  if not sdqRegistros.IsEmpty then
    ExportDialog.Execute;
end;

procedure TfraFormWebDetalleRNS.tbPdfClick(Sender: TObject);
var
  filepdf: String;
  cuit: string;
begin
  if not sdqRegistros.IsEmpty then
  begin
    cuit := ValorSqlEx('SELECT EM_CUIT FROM AFI.AEM_EMPRESA, AFI.ACO_CONTRATO WHERE CO_IDEMPRESA = EM_ID AND CO_CONTRATO = :contrato', [sdqRegistros.fieldbyname('no_contrato').AsInteger]);
    filepdf := IncludeTrailingBackslash(get_parametrobyclave('PATHOP')) +
               LPad(copy(sdqRegistros.fieldbyname('no_contrato').AsString,Length(sdqRegistros.fieldbyname('no_contrato').AsString)-2,3),'0',3) +
               '\' + sdqRegistros.fieldbyname('op_periodo').AsString + '\' +
               cuit + '_' + sdqRegistros.fieldbyname('no_contrato').AsString + '_' + sdqRegistros.fieldbyname('no_secuencia').AsString + '.pdf';
    Verificar(not FileExists(filepdf), tbPdf, 'El archivo no existe aún. La nota debe estar en un estado distinto a pendiente de autorización');
    AbrirPDF(filepdf);
  end;
end;

end.
