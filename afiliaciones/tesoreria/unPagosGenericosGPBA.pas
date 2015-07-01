unit unPagosGenericosGPBA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox;

type
  TfrmPagosGenericosGPBA = class(TfrmCustomGridABM)
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbSeleccion: TToolButton;
    ToolButton2: TToolButton;
    chkNoMostrarBajas: TCheckBox;
    gbFechaAprobado: TGroupBox;
    Label1: TLabel;
    edFechaAprobadoDesde: TDateComboBox;
    edFechaAprobadoHasta: TDateComboBox;
    gbFechaSeleccion: TGroupBox;
    Label2: TLabel;
    edFechaSeleccionDesde: TDateComboBox;
    edFechaSeleccionHasta: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSeleccionClick(Sender: TObject);
  private
  public
  protected
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmPagosGenericosGPBA: TfrmPagosGenericosGPBA;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, unSeleccionGBPA, General;

{$R *.dfm}

function TfrmPagosGenericosGPBA.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
    begin
       Sql.PrimaryKey.Add('GG_ID',               sdqConsulta.FieldByName('ID').AsInteger);
       Sql.Fields.Add('GG_FECHABAJA',            exDateTime);
       Sql.Fields.Add('GG_USUBAJA',              Sesion.UserID);

       Sql.SqlType := stUpdate;
    end;

  Result := inherited DoABM;
end;

function TfrmPagosGenericosGPBA.Validar: Boolean;
begin
  Result := True;
end;

procedure TfrmPagosGenericosGPBA.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'OGG_GPBAGENERICO';
  FieldBaja     := 'FECHA_BAJA';

  ShowActived := False;
end;

procedure TfrmPagosGenericosGPBA.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT VG_CONPAGO CONPAGO, TB_DESCRIPCION GRUPO_PAGO, ''PM Genéricos'' BASE_ORIGEN, SUBSTR(VO_ESTADO, 1, 1) ESTADO, ' +
                 'VO_FECHAFACTURA F_FACTURA, VO_FECHALTA F_CARGA, VO_FECHAPAGO F_APROBACION, VG_IMPFACTURADO COSTO, ' +
                 'CA_CLAVE CUIT_PRESTADOR, CA_DESCRIPCION NOMBRE_PRESTADOR, GG_ID ID, ' +
                 'VO_FACTURATIPO || ''-'' || VO_FACTURAESTABLE || ''-'' || VO_FACTURANRO NUMERO_FACTURA, VO_VOLANTE VOLANTE, ' +
                 'VG_NUMPAGO NUMPAGO, VO_USUAPRO USUAPRO, TRUNC(GG_FECHAALTA) FECHASELECCION, TRUNC(GG_FECHABAJA) FECHA_BAJA ' +
            'FROM CTB_TABLAS, SCP_CONPAGO, CPR_PRESTADOR, SVG_VOL_GENERICO, SVO_VOLANTES, OGG_GPBAGENERICO ' +
           'WHERE VG_VOLANTE = GG_VOLANTE ' +
             'AND VG_NUMPAGO = GG_NUMPAGO ' +
             'AND VO_VOLANTE = VG_VOLANTE ' +
             'AND VO_PRESTADOR = CA_IDENTIFICADOR ' +
             'AND VG_CONPAGO = CP_CONPAGO ' +
             'AND TB_CLAVE = ''GGPBA'' ' +
             'AND TB_CODIGO = CP_GRUPOGPBA';

  sWhere := SqlBetweenDateTime(' AND VO_FECHAPAGO ', edFechaAprobadoDesde.Date, edFechaAprobadoHasta.Date) +
            SqlBetweenDateTime(' AND GG_FECHAALTA ', edFechaSeleccionDesde.Date, edFechaSeleccionHasta.Date);

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND GG_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmPagosGenericosGPBA.tbLimpiarClick(Sender: TObject);
begin
  edFechaAprobadoDesde.Clear;
  edFechaAprobadoHasta.Clear;
  edFechaSeleccionDesde.Clear;
  edFechaSeleccionHasta.Clear;
  chkNoMostrarBajas.Checked := True;

  inherited;
end;

procedure TfrmPagosGenericosGPBA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('COSTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('COSTO')).Currency := True;
end;

procedure TfrmPagosGenericosGPBA.tbSeleccionClick(Sender: TObject);
begin
  Abrir(TfrmSeleccionGBPA, frmSeleccionGBPA, tmvModal, nil);
end;

end.
 