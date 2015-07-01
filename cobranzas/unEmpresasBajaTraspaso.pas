unit unEmpresasBajaTraspaso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmEmpresasBajaTraspaso = class(TfrmCustomConsulta)
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

  function Get_SqlEmpresasBajaTraspaso: String;
  function Get_SqlEmpresasBajaTraspasoListaContratos(ListaContratos: String): String;

var
  frmEmpresasBajaTraspaso: TfrmEmpresasBajaTraspaso;

implementation

uses
  AnsiSql;

{$R *.DFM}

procedure TfrmEmpresasBajaTraspaso.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sSqlWhere: String;
begin
  sSql := Get_SqlEmpresasBajaTraspaso;

  sSqlWhere := SqlBetween(' AND BT_FECHA_BAJA', edFBajaDesde.Date, edFBajaHasta.Date);

  if not fraEmpresa.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND BT_CONTRATO = ' + SqlValue(fraEmpresa.edContrato.Value);

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmEmpresasBajaTraspaso.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;
end;

procedure TfrmEmpresasBajaTraspaso.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresa.Clear;
  edFBajaDesde.Clear;
  edFBajaHasta.Clear;

  fraEmpresa.mskCUIT.SetFocus;
end;

procedure TfrmEmpresasBajaTraspaso.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('ILT_COMPENSABLE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('ILT_COMPENSABLE')).Currency := True;

  if sdqConsulta.FieldByName('DEUDATOTEXIGIBLE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDATOTEXIGIBLE')).Currency := True;

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

  if sdqConsulta.FieldByName('BT_TOTAL799') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('BT_TOTAL799')).Currency := True;
end;

function Get_SqlEmpresasBajaTraspaso: String;
var
  sSql: String;
begin

  sSql :=
  	'SELECT BT_CUIT CUIT, BT_NOMBRE RSOCIAL, BT_CONTRATO CONTRATO,' +
    			' BT_FECHA_BAJA FECHABAJA, CTBSECTOR.TB_DESCRIPCION DESCR_SECTOR,' +
          ' BT_CALLE CALLE, BT_NUMERO NUMERO, BT_PISO PISO, BT_DEPARTAMENTO DEPARTAMENTO, BT_CPOSTAL CPOSTAL,' +
          ' BT_LOCALIDAD LOCALIDAD, BT_PROVINCIA PROVINCIA, BT_FECHA_CONCURSO FECHA_CONCURSO,' +
          ' BT_ULT_MES_CONCURSO ULT_MES_CONCURSO, BT_FECHA_QUIEBRA FECHA_QUIEBRA, BT_ULT_MES_QUIEBRA ULT_MES_QUIEBRA,' +
          ' BT_VIG_DESDE VIG_DESDE, BT_ESTUDIO ESTUDIO, NVL(DC_ILTCOMPENSABLE, 0) ILT_COMPENSABLE,' +
          ' NVL(DC_DEUDACUOTA, 0) + NVL(DC_DEUDACUOTADIFERENCIA, 0) DEUDATOTEXIGIBLE,' +
          ' NVL(DC_PERIODOSCUOTA, 0) CANTPERIODOSCUOTA, NVL(DC_MONTOREFINANCIADO, 0) MONTOREFINANCIADO,' +
          ' NVL(DC_MONTOREFINANCIADOPEND, 0) MONTOREFINANCIADOPENDIENTE, NVL(DC_RECLAMOAFIP, 0) RECLAMOAFIP,' +
          ' NVL(DC_DEUDATOTAL, 0) DEUDATOTAL, DEUDA.GET_DEUDATOTALCONSOLIDADA(BT_CONTRATO) DEUDACONSOLIDADA,' +
          ' BT_TOTAL799, CTBMBAJA.TB_DESCRIPCION CTBMBAJADESCR, BT_TELEFONOS TELEFONO,' +
          ' GREATEST(NVL(DC_ULTPERDEUDADIF, DC_ULTPERDEUDACOMPL), NVL(DC_ULTPERDEUDACOMPL, DC_ULTPERDEUDADIF)) ULTPERDEUDOR' +
     ' FROM CTB_TABLAS CTBMBAJA, CTB_TABLAS CTBSECTOR, AEM_EMPRESA, TDC_DEUDACOBRANZA, ZBT_BAJATRASPASO' +
    ' WHERE CTBSECTOR.TB_CLAVE = ''SECT''' +
      ' AND CTBSECTOR.TB_CODIGO = EM_SECTOR' +
      ' AND CTBMBAJA.TB_CODIGO(+) = BT_MOTIVOBAJA' +
      ' AND CTBMBAJA.TB_CLAVE(+) = ''MOTIB''' +
      ' AND BT_CONTRATO = DC_CONTRATO(+)' +
      ' AND DC_USUARIO(+) = ''SISTEMAS''' +
      ' AND BT_CUIT = EM_CUIT';

  Result := sSql;
end;

function Get_SqlEmpresasBajaTraspasoListaContratos(ListaContratos: String): String;
var
  sSql: String;
begin
  sSql := Get_SqlEmpresasBajaTraspaso() +
          ' AND BT_CONTRATO IN (' + ListaContratos + ')';

  Result := sSql;
end;

end.
