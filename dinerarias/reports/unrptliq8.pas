unit unrptliq8;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,unDmprincipal;

type
  TRpt81 = class(TQuickRep)
    dsConsulta1: TDataSource;
    sdqConsulta1: TSDQuery;
    dsConsulta3: TDataSource;
    sdqConsulta3: TSDQuery;
    dsConsulta4: TDataSource;
    sdqConsulta4: TSDQuery;
    SDQHeader: TSDQuery;
    DSHeader: TDataSource;
    QRBCabecera: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbContrato: TQRDBText;
    QRDBText8: TQRDBText;
    qrdbCuit: TQRDBText;
    qrlCuit: TQRLabel;
    qrlEmpDep: TQRLabel;
    qrlContrato: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRBTitulos1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRFooter1: TQRBand;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRBTitulos3: TQRBand;
    QRShape14: TQRShape;
    QRLabel28: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape19: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape20: TQRShape;
    DSDetail: TDataSource;
    SDQDetail: TSDQuery;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    DSCountConsulta3: TDataSource;
    SDQCountConsulta3: TSDQuery;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRFooter3: TQRBand;
    QRLabel45: TQRLabel;
    QRShape13: TQRShape;
    QRLabel33: TQRLabel;
    LblBDiaria: TQRLabel;
    QRLabel34: TQRLabel;
    LblBMensual: TQRLabel;
    QRShape18: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText15: TQRDBText;
    TotDias: TQRLabel;
    TotEmpresa: TQRLabel;
    TotDGI: TQRLabel;
    TotMOPRE: TQRLabel;
    QRShape6: TQRShape;
    QRLabel22: TQRLabel;
    QRShape7: TQRShape;
    QRDBText25: TQRDBText;
    QRShape8: TQRShape;
    qriLogo: TQRImage;
    qrsHijos: TQRShape;
    QRShape28: TQRShape;
    QRLabel11: TQRLabel;
    QRShape30: TQRShape;
    QRShape9: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText28: TQRDBText;
    qrlUsuario: TQRLabel;
    QRShape10: TQRShape;
    QRShape27: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape11: TQRShape;
    QRDBText22: TQRDBText;
    qrlConcepto: TQRLabel;
    QRShape35: TQRShape;
    QRShape32: TQRShape;
    QRShape36: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText23: TQRDBText;
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBTitulos1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sdqConsulta1AfterScroll(DataSet: TDataSet);
    procedure SDQHeaderAfterScroll(DataSet: TDataSet);
  private
    TotalDias, TotalImpoAmpo, TotalRemimss, TotalImpoMes, TotalRemun: Double;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq: Integer);
  end;

var
  Rpt81: TRpt81;

implementation

uses
  AnsiSql, uncomunes, General;

{$R *.DFM}

procedure TRpt81.QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalRemun := TotalRemun + sdqConsulta3.fieldbyname('le_imporperi').asfloat;
end;

procedure TRpt81.QRFooter1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var
  ImpB:double;
begin
  ImpB := ValorSQL('SELECT cb_ibasediaria FROM secb_cbaseexpsin ' +
                   ' WHERE cb_siniestro = ' + SqlValue(SDQHeader.ParamByName('pSiniestro').AsInteger) +
                     ' AND cb_orden=' + SqlValue(SDQHeader.ParamByName('pOrden').AsInteger));
  TotMOPRE.Caption    := format('%8.2f', [TotalImpoAmpo]);
  TotEmpresa.Caption  := format('%8.2f', [TotalImpoMes]);
  TotDGI.Caption      := format('%8.2f', [TotalRemimss]);
  TotDias.Caption     := floattostr(TotalDias);
  LblBDiaria.Caption  := format('%8.2f', [ImpB]);
  LblBMensual.Caption := format('%8.2f', [ImpB * 30.4]);
end;

procedure TRpt81.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalDias     := TotalDias + sdqConsulta1.fieldbyname('RS_DIASPER').AsFloat;
  TotalImpoAmpo := TotalImpoAmpo + sdqConsulta1.fieldbyname('RS_IMPOAMPO').AsFloat;
  TotalImpoMes  := TotalImpoMes + sdqConsulta1.fieldbyname('RS_IMPOMES').AsFloat;
  TotalRemimss  := TotalRemimss + sdqConsulta1.fieldbyname('NR_REMIMSS').AsFloat;
end;

procedure TRpt81.QRBTitulos1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  TotalRemun    := 0;
  TotalDias     := 0;
  TotalImpoAmpo := 0;
  TotalImpoMes  := 0;
  TotalRemimss  := 0;
end;

constructor TRpt81.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TRpt81.sdqConsulta1AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta1.FieldByName('rs_impoampo') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('rs_impoampo')).Currency := True;

  if sdqConsulta1.FieldByName('rs_impomes') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('rs_impomes')).Currency := True;

  if sdqConsulta1.FieldByName('nr_remimss') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('nr_remimss')).Currency := True;
end;

procedure TRpt81.SDQHeaderAfterScroll(DataSet: TDataSet);
begin
  if sdqHeader.FieldByName('le_imporperi') is TFloatField then
    TFloatField(sdqHeader.FieldByName('le_imporperi')).Currency := True;
end;

procedure TRpt81.DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq: Integer);
var
  bEsSinGobernacion :Boolean;
  sSql, sCuit, sCuil: String;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    qrlEmpDep.Caption   := 'DEPENDENCIA GPBA';
    qrlCuit.Width       := 0;
    qrdbCuit.Width      := 0;
    qrlContrato.Width   := 0;
    qrdbContrato.Width  := 0;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    qrlEmpDep.Caption   := 'EMPRESA';
  end;

  sSql := 'SELECT ex_cuit, ex_cuil ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = :Sin ' +
            ' AND ex_orden = :Ord ' +
            ' AND ex_recaida = :Reca ';
  with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida]) do
  try
    sCuit := FieldByName('ex_cuit').AsString;
    sCuil := FieldByName('ex_cuil').AsString;
  finally
    Free;
  end;

  sdqConsulta1.ParamByName('pSiniestro').Value      := iSiniestro;
  sdqConsulta1.ParamByName('pOrden').Value          := iOrden;
  sdqConsulta1.ParamByName('pCuit').Value           := sCuit;
  sdqConsulta1.ParamByName('pCuil').Value           := sCuil;
  sdqConsulta1.Open;

  sdqConsulta3.ParamByName('pSiniestro').Value      := iSiniestro;
  sdqConsulta3.ParamByName('pOrden').Value          := iOrden;
  sdqConsulta3.ParamByName('pNumliqui').Value       := iNLiq;
  sdqConsulta3.Open;

  sdqCountConsulta3.ParamByName('pSiniestro').Value := iSiniestro;
  sdqCountConsulta3.ParamByName('pOrden').Value     := iOrden;
  sdqCountConsulta3.ParamByName('pNumliqui').Value  := iNLiq;
  sdqCountConsulta3.Open;

  sdqConsulta4.ParamByName('pSiniestro').Value      := iSiniestro;
  sdqConsulta4.ParamByName('pOrden').Value          := iOrden;
  sdqConsulta4.Open;

  sdqHeader.ParamByName('pSiniestro').Value         := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value             := iOrden;
  sdqHeader.ParamByName('pRecaida').Value           := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value              := iNLiq;
  sdqHeader.Open;

  sdqDetail.ParamByName('pSiniestro').Value         := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value             := iOrden;
  sdqDetail.ParamByName('pRecaida').Value           := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value              := iNLiq;
  sdqDetail.Open;

  qrlUsuario.Caption := IIF(SDQHeader.FieldByName('le_usualta').AsString = 'AUTOMATICO',
                            SDQHeader.FieldByName('le_usualta').AsString,
                            ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                        ' WHERE se_usuario = :Usu', [SDQHeader.FieldByName('le_usualta').AsString]));

  Print;
end;

end.
