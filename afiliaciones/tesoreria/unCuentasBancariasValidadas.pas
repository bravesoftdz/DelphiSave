unit unCuentasBancariasValidadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Mask, ToolEdit, DateComboBox, StdCtrls, CheckCombo,
  DBCheckCombo, FormPanel, PatternEdit, ComboEditor, RxToolEdit, RxPlacemnt,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmCuentasBancariasValidadas = class(TfrmCustomConsulta)
    gbTipoAcreedor: TGroupBox;
    dbcTipoAcreedores: TDBCheckCombo;
    gbFechaAlta: TGroupBox;
    Label5: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    sdqTipoAcreedores: TSDQuery;
    dsTipoAcreedores: TDataSource;
    gbFechaAprobado: TGroupBox;
    Label1: TLabel;
    edFechaAprobadoDesde: TDateComboBox;
    edFechaAprobadoHasta: TDateComboBox;
    gbCuitCuil: TGroupBox;
    fraCuentaPago: TfraCodigoDescripcion;
    procedure tbRefrescarClick(Sender: TObject); reintroduce;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
  protected
  public
  end;

var
  frmCuentasBancariasValidadas: TfrmCuentasBancariasValidadas;
  
implementation

uses
  unPrincipal, AnsiSql, unArt, unDmPrincipal, CustomDlgs, strFuncs;

{$R *.DFM}

procedure TfrmCuentasBancariasValidadas.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSqlWhere := '';
                     
  if dbcTipoAcreedores.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CP_TIPOACREEDOR ' + dbcTipoAcreedores.InSql;

  sSqlWhere := sSqlWhere + SqlBetweenDateTime(' AND CP_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date) +
               SqlBetweenDateTime(' AND CP_FECHAAPROBADO', edFechaAprobadoDesde.Date, edFechaAprobadoHasta.Date);

  if fraCuentaPago.IsSelected then
    sSqlWhere := sSqlWhere + 'AND CP_CUITCUIL = ' + SqlValue(fraCuentaPago.Codigo);

  sSql := 'SELECT CP_TIPOACREEDOR, CP_DESCRIPCION DESCR_ACREEDOR, CP_CUITCUIL, TRUNC(CP_FECHAALTA) FECHAALTA, CP_ID, ' +
                 'CP_NOMBRE NOMBRE_ACREEDOR, CP_BANCO, CP_SUCURSAL, CP_NROCUENTA, CP_CBU1 || ''-'' || CP_CBU2 CBU, ' +
                 'TRUNC(CP_FECHAAPROBADO) FECHAAPROBADO ' +
            'FROM V_CCP_CUENTAPAGO ' +
           'WHERE CP_FECHAAPROBADO IS NOT NULL ' +
             'AND CP_FECHABAJA IS NULL ' + sSqlWhere;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmCuentasBancariasValidadas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  sdqConsulta.FieldByName('CP_CUITCUIL').EditMask := EMSK_CUIT;  // para ponerle los guiones al CUIT
end;

procedure TfrmCuentasBancariasValidadas.FormCreate(Sender: TObject);
begin
  inherited;

  with fraCuentaPago do
    begin
      ShowBajas      := True;
      TableName      := 'ART.V_CCP_CUENTAPAGO';
      FieldID        := 'CP_ID';
      FieldCodigo    := 'CP_CUITCUIL';
      FieldDesc      := 'CP_NOMBRE';
      FieldBaja      := 'CP_FECHABAJA';
      ExtraCondition := ' AND CP_FECHAAPROBADO IS NOT NULL';
    end;

  OpenQuery(sdqTipoAcreedores);
end;

procedure TfrmCuentasBancariasValidadas.tbLimpiarClick(Sender: TObject);
begin
  dbcTipoAcreedores.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  edFechaAprobadoDesde.Clear;
  edFechaAprobadoHasta.Clear;
  fraCuentaPago.Clear;

  inherited;
end;

end.

