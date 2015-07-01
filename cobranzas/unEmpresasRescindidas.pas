unit unEmpresasRescindidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox, RxToolEdit, RxPlacemnt;

type
  TfrmEmpresasRescindidas = class(TfrmCustomConsulta)
    gbFechaBaja: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edFBajaDesde: TDateComboBox;
    edFBajaHasta: TDateComboBox;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    ShortCutControl1: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  public
  end;

  function Get_SqlEmpresasRescidadas: String;
  function Get_SqlEmpresasRescidadasListaContratos(ListaContratos: String): String;

var
  frmEmpresasRescindidas: TfrmEmpresasRescindidas;

implementation

uses
  AnsiSql;

{$R *.DFM}

procedure TfrmEmpresasRescindidas.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sSqlWhere: String;
begin
  sSql := Get_SqlEmpresasRescidadas;

  sSqlWhere := SqlBetween(' AND RS_FECHA_BAJA', edFBajaDesde.Date, edFBajaHasta.Date);

  if not fraEmpresa.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND RS_CONTRATO = ' + SqlValue(fraEmpresa.edContrato.Value);

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmEmpresasRescindidas.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;
end;

procedure TfrmEmpresasRescindidas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresa.Clear;
  edFBajaDesde.Clear;
  edFBajaHasta.Clear;

  fraEmpresa.mskCUIT.SetFocus;
end;

procedure TfrmEmpresasRescindidas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('ILT_COMPENSABLE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('ILT_COMPENSABLE')).Currency := True;

  if sdqConsulta.FieldByName('DEUDATOTEXIGIBLE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDATOTEXIGIBLE')).Currency := True;

  if sdqConsulta.FieldByName('MONTO_ULT_PLAN') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO_ULT_PLAN')).Currency := True;

  if sdqConsulta.FieldByName('VALORES_SIN_IMPUTAR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VALORES_SIN_IMPUTAR')).Currency := True;

  if sdqConsulta.FieldByName('PAGOS_POSTERIORES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PAGOS_POSTERIORES')).Currency := True;

  if sdqConsulta.FieldByName('MONTOREFINANCIADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOREFINANCIADO')).Currency := True;

  if sdqConsulta.FieldByName('MONTOREFINANCIADOPENDIENTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOREFINANCIADOPENDIENTE')).Currency := True;

  if sdqConsulta.FieldByName('RECLAMOAFIP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RECLAMOAFIP')).Currency := True;

  if sdqConsulta.FieldByName('DEUDATOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDATOTAL')).Currency := True;

  if sdqConsulta.FieldByName('DEUDACONSOLIDADA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDACONSOLIDADA')).Currency := True;

  if sdqConsulta.FieldByName('TOTDEVENGADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTDEVENGADO')).Currency := True;
end;

function Get_SqlEmpresasRescidadas: String;
var
  sSql: String;
begin
  sSql :=
  	'SELECT RS_CUIT CUIT, RS_NOMBRE RSOCIAL, RS_CONTRATO CONTRATO, RS_IDGESTORCUENTA IDGESTORCUENTA,' +
    			' RS_NOM_GESTOR NOMBREGESTOR, RS_FECHA_BAJA FECHABAJA, CTBSECTOR.TB_DESCRIPCION DESCR_SECTOR,' +
          ' RS_CALLE CALLE, RS_NUMERO NUMERO, RS_PISO PISO, RS_DEPARTAMENTO DEPARTAMENTO, RS_CPOSTAL CPOSTAL,' +
          ' RS_LOCALIDAD LOCALIDAD, RS_PROVINCIA PROVINCIA, RS_FECHA_CONCURSO FECHA_CONCURSO,' +
          ' RS_ULT_MES_CONCURSO ULT_MES_CONCURSO, RS_FECHA_QUIEBRA FECHA_QUIEBRA, RS_ULT_MES_QUIEBRA ULT_MES_QUIEBRA,' +
          ' RS_CANT_PERIODOS CANT_PERIODOS, RS_INTIMACION INTIMACION, RS_RESCISION RESCISION, RS_VIG_DESDE VIG_DESDE,' +
          ' RS_VIG_HASTA VIG_HASTA, RS_ULT_IDPLANPAGO ULT_IDPLANPAGO, RS_FECHA_ULT_PLAN FECHA_ULT_PLAN,' +
          ' RS_FECHA_ULT_IMPUTACION FECHA_ULT_IMPUTACION, RS_CONTRATO_REAF1 CONTRATO_REAF1,' +
          ' RS_VIG_DESDE_REAF1 VIG_DESDE_REAF1, RS_VIG_HASTA_REAF1 VIG_HASTA_REAF1, RS_ESTADO_REAF1 ESTADO_REAF1,' +
          ' CTBEST1.TB_DESCRIPCION DESCR_EST1, RS_CONTRATO_REAF2 CONTRATO_REAF2, RS_VIG_DESDE_REAF2 VIG_DESDE_REAF2,' +
          ' RS_VIG_HASTA_REAF2 VIG_HASTA_REAF2, RS_ESTADO_REAF2 ESTADO_REAF2, CTBEST2.TB_DESCRIPCION DESCR_EST2,' +
          ' RS_CONTRATO_REAF3 CONTRATO_REAF3, RS_VIG_DESDE_REAF3 VIG_DESDE_REAF3, RS_VIG_HASTA_REAF3 VIG_HASTA_REAF3,' +
          ' RS_ESTADO_REAF3 ESTADO_REAF3, CTBEST3.TB_DESCRIPCION DESCR_EST3, RS_ESTUDIO ESTUDIO,' +
          ' NVL(DC_ILTCOMPENSABLE, 0) ILT_COMPENSABLE,' +
          ' NVL(DC_DEUDACUOTA, 0) + NVL(DC_DEUDACUOTADIFERENCIA, 0) DEUDATOTEXIGIBLE,' +
          ' NVL(RS_MONTO_ULT_PLAN, 0) MONTO_ULT_PLAN, NVL(RS_VALORES_SIN_IMPUTAR, 0) VALORES_SIN_IMPUTAR,' +
          ' NVL(RS_PAGOS_POSTERIORES, 0) PAGOS_POSTERIORES, NVL(DC_PERIODOSCUOTA, 0) CANTPERIODOSCUOTA,' +
          ' NVL(DC_MONTOREFINANCIADO, 0) MONTOREFINANCIADO,' +
          ' NVL(DC_MONTOREFINANCIADOPEND, 0) MONTOREFINANCIADOPENDIENTE, NVL(DC_RECLAMOAFIP, 0) RECLAMOAFIP,' +
          ' NVL(DC_DEUDATOTAL, 0) DEUDATOTAL, DEUDA.GET_DEUDATOTALCONSOLIDADA(RS_CONTRATO) DEUDACONSOLIDADA,' +
          ' RS_TOTAL799, RS_DEVENGADOS_POSTERIORES TOTDEVENGADO, TRUNC(RS_FENVIOSRT) FENVIOSRT' +
     ' FROM CTB_TABLAS CTBEST1, CTB_TABLAS CTBEST2, CTB_TABLAS CTBEST3, CTB_TABLAS CTBSECTOR, AEM_EMPRESA,' +
     			' TDC_DEUDACOBRANZA, ZRS_RESCINDIDA' +
    ' WHERE CTBEST1.TB_CLAVE(+) = ''AFEST''' +
      ' AND CTBEST1.TB_CODIGO(+) = RS_ESTADO_REAF1' +
      ' AND CTBEST2.TB_CLAVE(+) = ''AFEST''' +
      ' AND CTBEST2.TB_CODIGO(+) = RS_ESTADO_REAF2' +
      ' AND CTBEST3.TB_CLAVE(+) = ''AFEST''' +
      ' AND CTBEST3.TB_CODIGO(+) = RS_ESTADO_REAF3' +
      ' AND CTBSECTOR.TB_CLAVE = ''SECT''' +
      ' AND CTBSECTOR.TB_CODIGO = EM_SECTOR' +
      ' AND RS_CONTRATO = DC_CONTRATO(+)' +
      ' AND DC_USUARIO(+) = ''SISTEMAS''' +
      ' AND RS_CUIT = EM_CUIT ' +
      ' AND NVL(DC_DEUDATOTAL, 0) >= ART.DEUDA.GET_MINIMODEUDA_RESCINDIDAS()';

  Result := sSql;
end;

function Get_SqlEmpresasRescidadasListaContratos(ListaContratos: String): String;
var
  sSql: String;
begin
  sSql := Get_SqlEmpresasRescidadas() +
          ' AND RS_CONTRATO IN (' + ListaContratos + ')';

  Result := sSql;
end;

end.
