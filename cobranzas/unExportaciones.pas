unit unExportaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, ToolEdit, DateComboBox;

type
  TfrmExportaciones = class(TfrmCustomConsulta)
    gbFechaProceso: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    cmbFechaProcesoDesde: TDateComboBox;
    cmbFechaProcesoHasta: TDateComboBox;
    gbFechaPresentacion: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cmbFechaPresentDesde: TDateComboBox;
    cmbFechaPresentHasta: TDateComboBox;
    gbProceso: TGroupBox;
    fraStaticCTBProcesos: TfraStaticCTB_TABLAS;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
  private
  public
  end;

var
  frmExportaciones: TfrmExportaciones;

implementation

uses
  AnsiSql, CustomDlgs, unImpoExpoWizard;

{$R *.DFM}

procedure TfrmExportaciones.FormCreate(Sender: TObject);
begin
  inherited;

  fraStaticCTBProcesos.Clave := 'EXPOR';
end;

procedure TfrmExportaciones.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT TRUNC(CE_FEPROCESO) FEPROCESO, CE_FEPRESENT, CE_ARCHIVO, CE_USUARIO, CE_CANTREG, CE_PERIODO,' +
          ' TB_DESCRIPCION DESC_PROCESO' +
     ' FROM CTB_TABLAS, CCE_CONTROLENVIOS' +
    ' WHERE TB_CLAVE = ''EXPOR''' +
      ' AND TB_CODIGO = CE_IDPROCESO';

  sWhere := SqlBetweenDateTime(' AND CE_FEPROCESO', cmbFechaProcesoDesde.Date, cmbFechaProcesoHasta.Date) +
            SqlBetween(' AND CE_FEPRESENT', cmbFechaPresentDesde.Date, cmbFechaPresentHasta.Date);

  if fraStaticCTBProcesos.IsSelected then
    sWhere := sWhere + ' AND CE_IDPROCESO = ' + SqlValue(fraStaticCTBProcesos.Codigo);


  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmExportaciones.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraStaticCTBProcesos.Clear;
  cmbFechaProcesoDesde.Clear;
  cmbFechaProcesoHasta.Clear;
  cmbFechaPresentDesde.Clear;
  cmbFechaPresentHasta.Clear;
end;

procedure TfrmExportaciones.tbNuevoClick(Sender: TObject);
var
  bProcesoOK: Boolean;
  sCodProceso: String;
begin
  Verificar(fraStaticCTBProcesos.IsEmpty, fraStaticCTBProcesos, 'Debe seleccionar un proceso.');

  bProcesoOK  := False;
  sCodProceso := fraStaticCTBProcesos.Codigo;

  if sCodProceso = 'TR' then   // transferencias
    bProcesoOK := ImpoExpoWizard('TRANS');

  if bProcesoOK then
    tbRefrescarClick(nil);
end;

end.
