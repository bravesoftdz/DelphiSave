unit unRptSiniestralidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls,
  TeeProcs, TeEngine, Chart, DbChart, QRTEE, Series;

type
  TqrSiniestralidad = class(TqrMoldeCarta)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    sdqDatosPERIODO: TStringField;
    sdqDatosCANTIDAD_INITINERE: TFloatField;
    sdqDatosDIAS_CAIDOS_INITINERE: TFloatField;
    sdqDatosLEVES_INITINERE: TFloatField;
    sdqDatosGRAVE_INITINERE: TFloatField;
    sdqDatosMORTAL_INITINERE: TFloatField;
    sdqDatosSINGRAVEDAD_INITINERE: TFloatField;
    sdqDatosCANTIDAD_INSITU: TFloatField;
    sdqDatosDIAS_CAIDOS_INSITU: TFloatField;
    sdqDatosLEVES_INSITU: TFloatField;
    sdqDatosGRAVE_INSITU: TFloatField;
    sdqDatosMORTAL_INSITU: TFloatField;
    sdqDatosSINGRAVEDAD_INSITU: TFloatField;
    sdqDatosCANTIDAD_TOTAL: TFloatField;
    sdqDatosDIAS_CAIDOS_TOTAL: TFloatField;
    sdqDatosEMPLEADOS: TFloatField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr4: TQRExpr;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrbEvolucionInItinere: TQRChildBand;
    QRDBChart1: TQRDBChart;
    QRChartEvolucion: TQRChart;
    Series1: TBarSeries;
    sdqDatosPERIODO_NUM: TFloatField;
    QRChartEvolucionDiasCaidos: TQRChart;
    QRDBChart2: TQRDBChart;
    BarSeries1: TBarSeries;
    qrbSiniestrosPorEstablecimiento: TQRChildBand;
    QRChartSiniestrosEstablecimientos: TQRChart;
    QRDBChart3: TQRDBChart;
    BarSeries2: TBarSeries;
    sdqIncidenciasDotacion: TSDQuery;
    sdqIncidenciasDotacionCANTIDAD_INITINERE: TFloatField;
    sdqIncidenciasDotacionDIAS_CAIDOS_INITINERE: TFloatField;
    sdqIncidenciasDotacionLEVES_INITINERE: TFloatField;
    sdqIncidenciasDotacionGRAVE_INITINERE: TFloatField;
    sdqIncidenciasDotacionMORTAL_INITINERE: TFloatField;
    sdqIncidenciasDotacionSINGRAVEDAD_INITINERE: TFloatField;
    sdqIncidenciasDotacionCANTIDAD_INSITU: TFloatField;
    sdqIncidenciasDotacionDIAS_CAIDOS_INSITU: TFloatField;
    sdqIncidenciasDotacionLEVES_INSITU: TFloatField;
    sdqIncidenciasDotacionGRAVE_INSITU: TFloatField;
    sdqIncidenciasDotacionMORTAL_INSITU: TFloatField;
    sdqIncidenciasDotacionSINGRAVEDAD_INSITU: TFloatField;
    sdqIncidenciasDotacionCANTIDAD_TOTAL: TFloatField;
    sdqIncidenciasDotacionDIAS_CAIDOS_TOTAL: TFloatField;
    sdqIncidenciasDotacionEMPLEADOS: TFloatField;
    sdqIncidenciasDotacionID: TFloatField;
    qrbCorteControl: TQRGroup;
    Series3: TBarSeries;
    Series4: TBarSeries;
    qrbDiasPerdidos: TQRChildBand;
    QRChartDiasPerdidos: TQRChart;
    QRDBChart4: TQRDBChart;
    BarSeries6: TBarSeries;
    BarSeries7: TBarSeries;
    BarSeries8: TBarSeries;
    qrbIncidenciaDotacionDias: TQRChildBand;
    QRChartIncidenciaDotacionDias: TQRChart;
    QRDBChart5: TQRDBChart;
    BarSeries12: TBarSeries;
    BarSeries13: TBarSeries;
    BarSeries14: TBarSeries;
    QRDBText14: TQRDBText;
    sdqIncidenciasDotacionINCIDENCIA_INITINERE_SINI: TFloatField;
    sdqIncidenciasDotacionINCIDENCIA_INITINERE_DIAS: TFloatField;
    sdqIncidenciasDotacionINCIDENCIA_INSITU_SINI: TFloatField;
    sdqIncidenciasDotacionINCIDENCIA_INSITU_DIAS: TFloatField;
    sdqIncidenciasDotacionINCIDENCIA_TOTAL_SINI: TFloatField;
    sdqIncidenciasDotacionINCIDENCIA_TOTAL_DIAS: TFloatField;
    qrbIncidenciaDotacionSiniestros: TQRChildBand;
    QRChartIncidenciaDotacionSini: TQRChart;
    QRDBChart6: TQRDBChart;
    BarSeries9: TBarSeries;
    BarSeries10: TBarSeries;
    BarSeries11: TBarSeries;
    qrlTitFAcciDesde: TQRLabel;
    qrlFacciDesde: TQRLabel;
    qrlFacciHasta: TQRLabel;
    qrlTitFAcciHasta: TQRLabel;
    qrbSep1: TQRChildBand;
    qrbLesion: TQRChildBand;
    qrbEvolucionSiniestros: TQRChildBand;
    qrbEvolucion: TQRChildBand;
    QRChart1: TQRChart;
    QRDBChart7: TQRDBChart;
    BarSeries3: TBarSeries;
    QRChart2: TQRChart;
    QRDBChart8: TQRDBChart;
    BarSeries4: TBarSeries;
    qrbEvolucionInSitu: TQRChildBand;
    QRChart3: TQRChart;
    QRDBChart9: TQRDBChart;
    BarSeries5: TBarSeries;
    QRChart4: TQRChart;
    QRDBChart10: TQRDBChart;
    BarSeries15: TBarSeries;
    qrlCorteControl: TQRLabel;
    sdqDatosTIPO: TStringField;
    sdqDatosCORTE_CONTROL: TStringField;
    qrbEncabezadoGrilla: TQRGroup;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape10: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrbPieGrilla: TQRBand;
    qrbPieCorteControl: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRDBText15: TQRDBText;
    sdqIncidenciasDotacionCLAVE: TStringField;
    sdqDatosREGION: TStringField;
    sdqDatosGERENTE: TStringField;
    sdqDatosESTABLECIMIENTO: TStringField;
    sdqEvolucion: TSDQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    qrbCantidadTotalSiniestros: TQRChildBand;
    QRChartCantidadSiniestros: TQRChart;
    QRDBChart12: TQRDBChart;
    BarSeries17: TBarSeries;
    BarSeries18: TBarSeries;
    BarSeries19: TBarSeries;
    sdqEvolucionINCIDENCIA: TFloatField;
    qrlEmpresa: TQRLabel;
    sdqDatosCONTRATO: TFloatField;
    sdqEvolucionINCIDENCIA_DIAS: TFloatField;
    QRDBText16: TQRDBText;
    QRLabel2: TQRLabel;
    QRChartEvolucionSiniestros: TQRChart;
    QRDBChart13: TQRDBChart;
    qrbEvolucionIncidenciaSiniestros: TQRChildBand;
    QRChartEvolucionIncidencia: TQRChart;
    QRDBChart11: TQRDBChart;
    qrbEvolucionDias: TQRChildBand;
    QRChartEvolucionDias: TQRChart;
    QRDBChart16: TQRDBChart;
    sdqLesion: TSDQuery;
    sdqLesionTIPO: TStringField;
    sdqLesionCORTE_CONTROL: TStringField;
    sdqLesionREGION: TStringField;
    sdqLesionGERENTE: TStringField;
    sdqLesionESTABLECIMIENTO: TStringField;
    sdqLesionCONTRATO: TFloatField;
    sdqLesionLN_DESCRIPCION: TStringField;
    sdqLesionCANTIDAD: TFloatField;
    QRChartLesion: TQRChart;
    QRDBChart14: TQRDBChart;
    BarSeries23: TPieSeries;
    qrbAccidente: TQRChildBand;
    QRChartAccidente: TQRChart;
    QRDBChart15: TQRDBChart;
    PieSeries1: TPieSeries;
    sdqAccidente: TSDQuery;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    sdqAccidenteLF_DESCRIPCION: TStringField;
    QRLabel3: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    sdqEvolucionINCIDENCIA_II: TFloatField;
    sdqEvolucionINCIDENCIA_IS: TFloatField;
    Series5: TBarSeries;
    Series2: TBarSeries;
    BarSeries16: TBarSeries;
    BarSeries20: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    BarSeries25: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    procedure CargoConsultaEstablecimientos(sender: TObject; var Value: string);
    procedure EstablecimientoNoMuestraGrafico(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbCorteControlBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure AjustoDecimales(sender: TObject; var Value: string);
    procedure sdqEvolucionCalcFields(DataSet: TDataSet);
  private
    procedure ManageAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
  public
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;    
    procedure Imprimir(iContrato: Integer; {sGerente, sRegion: String; }dDesde, dHasta: TDate);
  end;

var
  qrSiniestralidad: TqrSiniestralidad;

implementation

uses unDmPrincipal, General, Strfuncs, unArt, Math, Numeros;

{$R *.dfm}

{ TqrSiniestralidad }

constructor TqrSiniestralidad.Create(AOwner: TComponent);
begin
  inherited;
  with qriLogoART do
  begin
    Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_COLOR');
    AutoSize := False;
    Stretch := True;
    Height := 65;
    Width := 164;
    Left := Self.Width - qriLogoART.Width - 48;
  end;
  ShowLogoGBP := False;
  QRChartIncidenciaDotacionSini.Chart.OnGetAxisLabel := ManageAxisLabel;
  QRChartDiasPerdidos.Chart.OnGetAxisLabel := ManageAxisLabel;
  QRChartCantidadSiniestros.Chart.OnGetAxisLabel := ManageAxisLabel;
end;

procedure TqrSiniestralidad.ManageAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
begin
  LabelText := StringReplace(LabelText, ' ', #13, [rfReplaceAll]);
end;

destructor TqrSiniestralidad.Destroy;
begin
  inherited;
end;

procedure TqrSiniestralidad.CargoConsultaEstablecimientos(sender: TObject; var Value: string);
var
  sAgrupado: String;
begin
  Value := Get_AjusteDecimales(Value);

  with sdqIncidenciasDotacion do
  begin
    Close;
    ParamByName('region').AsString := sdqDatos.FieldByName('region').AsString;
    ParamByName('gerente').AsString := sdqDatos.FieldByName('gerente').AsString;   
    ParamByName('contrato').AsInteger := sdqDatos.FieldByName('contrato').AsInteger;
    ParamByName('establecimiento').AsString := sdqDatos.FieldByName('establecimiento').AsString;
    Open;

    if sdqDatos.FieldByName('region').IsNull and sdqDatos.FieldByName('gerente').IsNull and sdqDatos.FieldByName('establecimiento').IsNull then
      sAgrupado := 'agrupado por Región'
    else if sdqDatos.FieldByName('gerente').IsNull and sdqDatos.FieldByName('establecimiento').IsNull then
      sAgrupado := 'agrupado por Gerente'
    else if sdqDatos.FieldByName('region').IsNull and sdqDatos.FieldByName('establecimiento').IsNull then
      sAgrupado := 'agrupado por Establecimiento';

    with QRChartIncidenciaDotacionSini.Chart.Title.Text do
    begin
      Text := 'Incidencia de la dotación' + CRLF + 'con respecto a la cantidad de siniestros';
      Text := Text + sAgrupado;
    end;

    with QRChartCantidadSiniestros.Chart.Title.Text do
    begin
      Text := 'Cantidad de Siniestros';
      Text := Text + sAgrupado;
    end;

    with QRChartDiasPerdidos.Chart.Title.Text do
    begin
      Text := 'Días perdidos';
      Text := Text + sAgrupado;
    end;

    with QRChartSiniestrosEstablecimientos.Chart.Title.Text do
    begin
      Text := 'Incidencia de la dotación' + CRLF + 'con respecto a los días perdidos';
      Text := Text + sAgrupado;
    end;
  end;

  with sdqEvolucion do
  begin
    Close;
    ParamByName('region').AsString := sdqDatos.FieldByName('region').AsString;
    ParamByName('gerente').AsString := sdqDatos.FieldByName('gerente').AsString;
    ParamByName('establecimiento').AsString := sdqDatos.FieldByName('establecimiento').AsString;
    Open;
  end;

  with sdqLesion do
  begin
    Close;
    ParamByName('region').AsString := sdqDatos.FieldByName('region').AsString;
    ParamByName('gerente').AsString := sdqDatos.FieldByName('gerente').AsString;
    ParamByName('establecimiento').AsString := sdqDatos.FieldByName('establecimiento').AsString;
    Open;
  end;

  with sdqAccidente do
  begin
    Close;
    ParamByName('region').AsString := sdqDatos.FieldByName('region').AsString;
    ParamByName('gerente').AsString := sdqDatos.FieldByName('gerente').AsString;
    ParamByName('establecimiento').AsString := sdqDatos.FieldByName('establecimiento').AsString;
    Open;
  end;
end;

procedure TqrSiniestralidad.Imprimir(iContrato: Integer; {sGerente, sRegion: String; }dDesde, dHasta: TDate);
begin
  qrlFacciDesde.Enabled     := (dDesde > 0);
  qrlTitFAcciDesde.Enabled  := (dDesde > 0);
  qrlFacciDesde.Caption     := DateToStr(dDesde);
  qrlFacciHasta.Enabled     := (dHasta > 0);
  qrlTitFAcciHasta.Enabled  := (dHasta > 0);
  qrlFacciHasta.Caption     := DateToStr(dHasta);
{
  qrlRegion.Enabled         := not IsEmptyString(sRegion);
  sdqDatos.ParamByName('gerente').AsString            := sGerente;
  sdqDatos.ParamByName('region').AsString             := sRegion;
}
  with sdqDatos do
  begin
    ParamByName('fdesde').AsDate := NvlDT(dDesde, StrToDate('01/02/2010'));
    ParamByName('fhasta').AsDate := NvlDT(dHasta, DBDate + 1);
    ParamByName('contrato').AsInteger := iContrato;
  end;

  with sdqIncidenciasDotacion do
  begin
    ParamByName('fdesde').AsDate := NvlDT(dDesde, StrToDate('01/02/2010'));
    ParamByName('fhasta').AsDate := NvlDT(dHasta, DBDate + 1);
    ParamByName('contrato').AsInteger := iContrato;
  end;

  with sdqEvolucion do
  begin
    ParamByName('fdesde').AsDate := NvlDT(dDesde, StrToDate('01/02/2010'));
    ParamByName('fhasta').AsDate := NvlDT(dHasta, DBDate + 1);
    ParamByName('contrato').AsInteger := iContrato;
  end;

  with sdqLesion do
  begin
    ParamByName('fdesde').AsDate := NvlDT(dDesde, StrToDate('01/02/2010'));
    ParamByName('fhasta').AsDate := NvlDT(dHasta, DBDate + 1);
    ParamByName('contrato').AsInteger := iContrato;
  end;

  with sdqAccidente do
  begin
    ParamByName('fdesde').AsDate := NvlDT(dDesde, StrToDate('01/02/2010'));
    ParamByName('fhasta').AsDate := NvlDT(dHasta, DBDate + 1);
    ParamByName('contrato').AsInteger := iContrato;
  end;
  
  sdqDatos.Open;
  sdqIncidenciasDotacion.Open;

  qrlEmpresa.Caption := ValorSQLEx('SELECT em_nombre FROM aco_contrato, aem_empresa WHERE em_id = co_idempresa AND co_contrato = :contrato', [sdqDatos.FieldByName('contrato').AsInteger]);
  qrSiniestralidad.Preview;
end;

procedure TqrSiniestralidad.EstablecimientoNoMuestraGrafico(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := sdqDatos.FieldByName('establecimiento').IsNull;
end;

procedure TqrSiniestralidad.qrbCorteControlBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if sdqDatos.FieldByName('establecimiento').IsNull then
    NewPage;
end;

procedure TqrSiniestralidad.AjustoDecimales(sender: TObject; var Value: string);
begin
  inherited;
  Value := Get_AjusteDecimales(Value);
end;

procedure TqrSiniestralidad.sdqEvolucionCalcFields(DataSet: TDataSet);
begin                                                              
  inherited;
  if DataSet.FieldByName('EMPLEADOS').AsInteger > 0 then
  begin
    DataSet.FieldByName('INCIDENCIA').AsFloat := RoundNumber(DataSet.FieldByName('CANTIDAD_TOTAL').AsInteger / DataSet.FieldByName('EMPLEADOS').AsInteger * 100, 2);
    DataSet.FieldByName('INCIDENCIA_II').AsFloat := RoundNumber(DataSet.FieldByName('CANTIDAD_INITINERE').AsInteger / DataSet.FieldByName('EMPLEADOS').AsInteger * 100, 2);
    DataSet.FieldByName('INCIDENCIA_IS').AsFloat := RoundNumber(DataSet.FieldByName('CANTIDAD_INSITU').AsInteger / DataSet.FieldByName('EMPLEADOS').AsInteger * 100, 2);
    DataSet.FieldByName('INCIDENCIA_DIAS').AsFloat := RoundNumber(DataSet.FieldByName('DIAS_CAIDOS_TOTAL').AsInteger / DataSet.FieldByName('EMPLEADOS').AsInteger, 2);
  end;
end;

end.
