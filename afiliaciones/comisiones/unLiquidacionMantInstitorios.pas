unit unLiquidacionMantInstitorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtDbFrame, unFraEmpresa, StdCtrls,
  unFraStaticCodigoDescripcion, unfraSucursal, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraVendedores,
  unfraVendedoresCUIT, Mask, PatternEdit, IntEdit;

type
  TfrmLiquidacionMantInstitorios = class(TfrmCustomConsulta)
    gbVendedor: TGroupBox;
    fraVendedorCUITFiltro: TfraVendedoresCUIT;
    gbSucursal: TGroupBox;
    fraSucursalFiltro: TfraSucursal;
    gbEmpresa: TGroupBox;
    lbRSocial: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    gbLiquidacion: TGroupBox;
    edLiquidacionFiltro: TIntEdit;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
  public
  end;

var
  frmLiquidacionMantInstitorios: TfrmLiquidacionMantInstitorios;

implementation

uses
  AnsiSql;

{$R *.dfm}

procedure TfrmLiquidacionMantInstitorios.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: string;
begin
  sWhere := '';

  sSql := 'SELECT VE_VENDEDOR CODIGO_VENDEDOR, VE_CUIT CUIT_VENDEDOR, VE_NOMBRE NOMBRE_VENDEDOR, ' +
                 'SU_CODSUCURSAL CODIGO_SUCURSAL, SU_DESCRIPCION NOMBRE_SUCURSAL, CO_CONTRATO CONTRATO, ' +
                 'EM_CUIT CUIT_EMPRESA, EM_NOMBRE NOMBRE_EMPRESA, MI_PERIODO PERIODO, MI_COBRADO COBRADO, ' +
                 'MI_COBRADONETO COBRADO_NETO, MI_PORCCOMISION PORCENTAJE, MI_COMISION MONTO_LIQUIDADO, ' +
                 'MI_IDLIQCOMISION LIQUIDACION ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO, XVE_VENDEDOR, ASU_SUCURSAL, XVS_VENDEDORSUCURSAL, ' +
                 'XMI_MANTENIMIENTOINSTITORIO ' +
           'WHERE VS_ID = MI_IDVENDSUCURSAL ' +
             'AND VE_ID = VS_IDVENDEDOR ' +
             'AND SU_ID = VS_IDSUCURSAL ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CO_CONTRATO = MI_CONTRATO';

  if fraVendedorCUITFiltro.IsSelected then
    sWhere := sWhere + ' AND VE_ID = ' + SqlValue(fraVendedorCUITFiltro.Value);

  if fraSucursalFiltro.IsSelected then
    sWhere := sWhere + ' AND SU_ID = ' + SqlValue(fraSucursalFiltro.Value);

  if fraEmpresaFiltro.IsSelected then
    sWhere := sWhere + ' AND MI_CONTRATO = ' + SQLValue(fraEmpresaFiltro.Contrato);

  if not edLiquidacionFiltro.IsEmpty then
    sWhere := sWhere + ' AND MI_IDLIQCOMISION = ' + SQLValue(edLiquidacionFiltro.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;;
  inherited;
end;

procedure TfrmLiquidacionMantInstitorios.FormCreate(Sender: TObject);
begin
  inherited;

  fraVendedorCUITFiltro.ShowBajas := True;
  fraEmpresaFiltro.ShowBajas      := True;

  with fraSucursalFiltro do
    begin
      ShowBajas      := True;
      ExtraCondition := ' AND SU_IDENTIDAD = 9003';
    end;  
end;

procedure TfrmLiquidacionMantInstitorios.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraVendedorCUITFiltro.Clear;
  fraSucursalFiltro.Clear;
  fraEmpresaFiltro.Clear;
  edLiquidacionFiltro.Clear;
end;

procedure TfrmLiquidacionMantInstitorios.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('COBRADO') is TFloatField Then
     TFloatField(sdqConsulta.FieldByName('COBRADO')).Currency := True;

  if sdqConsulta.FieldByName('COBRADO_NETO') is TFloatField Then
     TFloatField(sdqConsulta.FieldByName('COBRADO_NETO')).Currency := True;

  if sdqConsulta.FieldByName('MONTO_LIQUIDADO') is TFloatField Then
     TFloatField(sdqConsulta.FieldByName('MONTO_LIQUIDADO')).Currency := True;

  if sdqConsulta.FieldByName('PORCENTAJE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCENTAJE')).DisplayFormat := '% 0.00;-% 0.00';
end;

end.
