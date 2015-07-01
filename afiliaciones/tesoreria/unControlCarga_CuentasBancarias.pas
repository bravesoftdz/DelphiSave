unit unControlCarga_CuentasBancarias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox, StdCtrls, CheckCombo,
  DBCheckCombo, FormPanel, PatternEdit, ComboEditor;

type
  TfrmControlCarga_CuentasBancarias = class(TfrmCustomConsulta)
    gbTipoAcreedor: TGroupBox;
    dbcTipoAcreedores: TDBCheckCombo;
    gbFechaAlta: TGroupBox;
    Label5: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    fpBusqueda: TFormPanel;
    lbCuitCuilBusqueda: TLabel;
    edCUITCUILBusqueda: TMaskEdit;
    cmdBuscar: TButton;
    tbSalir2: TToolButton;
    tbBuscar: TToolButton;
    ToolButton1: TToolButton;
    sdqTipoAcreedores: TSDQuery;
    dsTipoAcreedores: TDataSource;
    cmdCerrar: TButton;
    procedure tbRefrescarClick(Sender: TObject); reintroduce;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure fpBusquedaEnter(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    procedure EnableButtons(AEnabled: Boolean = True); override;
  public
  end;

implementation

uses
  unPrincipal, AnsiSql, unArt, unDmPrincipal, CustomDlgs, Cuit, strFuncs, unAltaModifCCP_CUENTAPAGO, unBajaCCP_CUENTAPAGO;

{$R *.DFM}

procedure TfrmControlCarga_CuentasBancarias.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSqlWhere := '';

  if dbcTipoAcreedores.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CP_TIPOACREEDOR ' + dbcTipoAcreedores.InSql;

  sSqlWhere := sSqlWhere + SqlBetweenDateTime(' AND CP_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date);

  sSql :=
    'SELECT CP_TIPOACREEDOR, CP_DESCRIPCION DESCR_ACREEDOR, CP_CUITCUIL, TRUNC(CP_FECHAALTA) FECHAALTA, CP_ID, ' +
           'CP_NOMBRE NOMBRE_ACREEDOR, CP_USUALTA USUALTA ' +
      'FROM V_CCP_CUENTAPAGO ' +
     'WHERE CP_FECHAAPROBADO IS NULL ' + sSqlWhere;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmControlCarga_CuentasBancarias.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  sdqConsulta.FieldByName('CP_CUITCUIL').EditMask := EMSK_CUIT;  // para ponerle los guiones al CUIT
end;

procedure TfrmControlCarga_CuentasBancarias.FormCreate(Sender: TObject);
begin
  inherited;

  OpenQuery(sdqTipoAcreedores);
end;

procedure TfrmControlCarga_CuentasBancarias.tbLimpiarClick(Sender: TObject);
begin
  dbcTipoAcreedores.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;

  inherited;
end;

procedure TfrmControlCarga_CuentasBancarias.cmdBuscarClick(Sender: TObject);
var
  bEncontrado: Boolean;
begin
  if sdqConsulta.Active then
  begin
    bEncontrado := sdqConsulta.Locate('CP_CUITCUIL', edCUITCUILBusqueda.Text, [loCaseInsensitive, loPartialKey]);

    if bEncontrado then
    begin
      Grid.SelectedRows.CurrentRowSelected := True;
      cmdCerrar.SetFocus;
    end
    else
      MsgBox('No se ha encontrado el dato en la grilla.');
  end
  else
    MsgBox('No hay registros cargados en la grilla.');
end;

procedure TfrmControlCarga_CuentasBancarias.fpBusquedaEnter(Sender: TObject);
begin
  edCUITCUILBusqueda.Clear;
end;

procedure TfrmControlCarga_CuentasBancarias.tbBuscarClick(Sender: TObject);
begin
  inherited;

  fpBusqueda.ShowModal;
end;

procedure TfrmControlCarga_CuentasBancarias.tbNuevoClick(Sender: TObject);
begin
  with TfrmAltaModifCCP_CUENTAPAGO.Create(Self) do
  try
    if Execute(ART_EMPTY_ID, '', ART_EMPTY_ID, '') then
      if sdqConsulta.Active then
        sdqConsulta.Refresh;
  finally
    Free;
  end;
end;

procedure TfrmControlCarga_CuentasBancarias.tbModificarClick(Sender: TObject);
begin
  with TfrmAltaModifCCP_CUENTAPAGO.Create(Self) do
  try   
    if Execute(sdqConsulta.FieldByName('CP_ID').AsInteger, sdqConsulta.FieldByName('CP_TIPOACREEDOR').AsString, ART_EMPTY_ID, '') then
      sdqConsulta.Refresh;
  finally
    Free;
  end;
end;

procedure TfrmControlCarga_CuentasBancarias.tbEliminarClick(Sender: TObject);
begin
  with TfrmBajaCCP_CUENTAPAGO.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmControlCarga_CuentasBancarias.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbEliminar.Enabled := True;
end;

end.
