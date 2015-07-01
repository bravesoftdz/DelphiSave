unit unRptPagoAdic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Db, SDEngine, QRCtrls;

type
  TqrPagoAdic = class(TQuickRep)
    SDQHeader: TSDQuery;
    DSDetail: TDataSource;
    SDQDetail: TSDQuery;
    DSHeader: TDataSource;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlContrato: TQRLabel;
    qrlEmpDep: TQRLabel;
    qrlCuit: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrdbContrato: TQRDBText;
    QRDBText8: TQRDBText;
    qrdbCuit: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape14: TQRShape;
    qriLogo: TQRImage;
    QRSubDetail1: TQRSubDetail;
    QRShape6: TQRShape;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    SummaryBand1: TQRBand;
    QRShape10: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape12: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    qrlUsuario: TQRLabel;
    qrsHijos: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel3: TQRLabel;
    qrlBeneficiario: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    procedure SDQHeaderAfterScroll(DataSet: TDataSet);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq :Integer);
  end;

var
  qrPagoAdic: TqrPagoAdic;

implementation

uses
  unComunes, General, unDmPrincipal;

{$R *.DFM}

constructor TqrPagoAdic.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TqrPagoAdic.SDQHeaderAfterScroll(DataSet: TDataSet);
begin
  if sdqHeader.FieldByName('LE_IMPORPERI') is TFloatField then
    TFloatField(sdqHeader.FieldByName('LE_IMPORPERI')).Currency := True;
end;

procedure TqrPagoAdic.DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq :Integer);
var
  bEsSinGobernacion: Boolean;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden,iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    qrlEmpDep.Caption  := 'DEPENDENCIA GPBA';
    qrlCuit.Width      := 0;
    qrdbCuit.Width     := 0;
    qrlContrato.Width  := 0;
    qrdbContrato.Width := 0;
  end
  else
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    qrlEmpDep.Caption := 'EMPRESA';
  end;

  sdqHeader.ParamByName('pSiniestro').Value   := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value       := iOrden;
  sdqHeader.ParamByName('pRecaida').Value     := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value        := iNLiq;
  sdqHeader.Open;

  sdqDetail.ParamByName('pSiniestro').Value   := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value       := iOrden;
  sdqDetail.ParamByName('pRecaida').Value     := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value        := iNLiq;
  sdqDetail.Open;

  qrlBeneficiario.Caption := ValorSqlEx('SELECT liq.get_dninombrebeneficiario(:Sin, :Ord, :Rec, :Cod) ' +
                                         ' FROM dual', [iSiniestro, iOrden, iRecaida,
                                                        SDQDetail.FieldByName('eb_codigo').AsInteger]);

  qrlUsuario.Caption := IIF(SDQHeader.FieldByName('le_usualta').AsString = 'AUTOMATICO',
                            SDQHeader.FieldByName('le_usualta').AsString,
                            ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                        ' WHERE se_usuario = :Usu', [SDQHeader.FieldByName('le_usualta').AsString]));

  Print;
end;

end.
