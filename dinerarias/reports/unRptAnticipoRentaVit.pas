unit unRptAnticipoRentaVit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Db, SDEngine, Qrctrls;

type
  TfrmRptAnticipoRentaVit = class(TForm)
    QuickRep1: TQuickRep;
    DSDetail: TDataSource;
    SDQDetail: TSDQuery;
    DSHeader: TDataSource;
    SDQHeader: TSDQuery;
    dsConsulta4: TDataSource;
    sdqConsulta4: TSDQuery;
    dsConsulta3: TDataSource;
    sdqConsulta3: TSDQuery;
    dsConsulta2: TDataSource;
    sdqConsulta2: TSDQuery;
    dsConsulta1: TDataSource;
    sdqConsulta1: TSDQuery;
    QRBCabecera: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel11: TQRLabel;
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
    qriLogo: TQRImage;
    QRLabel22: TQRLabel;
    QRBTitulos1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRFooter1: TQRBand;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    TotDias: TQRLabel;
    TotDGI: TQRLabel;
    TotMOPRE: TQRLabel;
    QRBTitulos2: TQRBand;
    QRShape12: TQRShape;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText16: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRDBText15: TQRDBText;
    QRFooter2: TQRBand;
    QRShape13: TQRShape;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape18: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    lblTotalRemun: TQRLabel;
    LblBDiaria: TQRLabel;
    LblBMensual: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRShape34: TQRShape;
    QRDBText25: TQRDBText;
    QRBTitulos3: TQRBand;
    QRShape14: TQRShape;
    QRLabel28: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRSubDetail3: TQRSubDetail;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape20: TQRShape;
    QRShape19: TQRShape;
    QRBand1: TQRBand;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    QRSubDetail4: TQRSubDetail;
    QRDBText22: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape36: TQRShape;
    qrlConcepto: TQRLabel;
    QRBand2: TQRBand;
    QRShape37: TQRShape;
    QRDBText34: TQRDBText;
    QRShape31: TQRShape;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText26: TQRDBText;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    LblDNI: TQRLabel;
    QRSubDetail5: TQRSubDetail;
    QRFooter3: TQRBand;
    QRShape17: TQRShape;
    QRShape24: TQRShape;
    procedure QRBTitulos2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooter2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlPeriodoPrint(Sender: TObject; var Value: String);
    procedure sdqConsulta3AfterScroll(DataSet: TDataSet);
    procedure sdqConsulta1AfterScroll(DataSet: TDataSet);
    procedure SDQHeaderAfterScroll(DataSet: TDataSet);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    DTotdias: Double;
    DTotDGI: Double;
    DTotMOPRE: Double;
//    TotalAntic: Double;
    TotalRemun: Double;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  DateUtil, AnsiSql, unDMPrincipal, unComunes;

{$R *.DFM}

procedure TfrmRptAnticipoRentaVit.QRBTitulos2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  TotalRemun:=0;
  DTotDGI:=0;
  DTotDias:=0;
  DTotMOPRE:=0;
end;

procedure TfrmRptAnticipoRentaVit.QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalRemun := TotalRemun + sdqConsulta3.FieldByName('Imporperi').AsFloat;
end;

procedure TfrmRptAnticipoRentaVit.QRFooter2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  ImpB: Double;
begin
  lblTotalRemun.Caption := Format('%8.2f', [TotalRemun]);
  ImpB := ValorSql('select CB_IBASEDIARIA' +
                    ' from secb_cbaseexpsin' +
                   ' where cb_siniestro = ' + SqlValue(SDQHeader.FieldByName('ex_siniestro').AsInteger) +
                     ' and cb_orden = ' + SqlValue(SDQHeader.FieldByName('ex_orden').AsInteger));
  LblBDiaria.Caption := Format('%8.2f', [ImpB]);
  LblBMensual.Caption := Format('%8.2f', [ImpB * 30.4]);
end;

procedure TfrmRptAnticipoRentaVit.QRSubDetail1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  DTotdias := DTotdias + sdqconsulta1.FieldByName('RS_DIASPER').AsFloat;
  DTotDGI := DTotDGI + sdqconsulta1.FieldByName('RS_IMPOAMPO').AsFloat;
  DTotMOPRE := DTotMOPRE + sdqconsulta1.FieldByName('RS_IMPOMES').AsFloat;
end;

procedure TfrmRptAnticipoRentaVit.QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Totdias.Caption := FloatToStr(DTotdias);
  TotDGI.Caption := Format('%8.2f', [DTotDGI]);
  TotMOPRE.Caption := Format('%8.2f', [DTotMOPRE]);
end;

procedure TfrmRptAnticipoRentaVit.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  LblDNI.Caption := ValorSql('select EB_DOCUMENTO' +
                              ' from seb_beneficiarios' +
                             ' where eb_siniestro = ' + sdqheader.FieldByName('Le_siniestro').AsString +
                               ' and EB_REPLEGAL = ''S''' +
                               ' and EB_GRUPOFAMILIAR = ' + SDQDETAIL.FieldByName('EB_GRUPOFAMILIAR').AsString);
end;

constructor TfrmRptAnticipoRentaVit.Create(AOwner: TComponent);
begin
  inherited;
end;

{ by NWK, 13/03/03 }
procedure TfrmRptAnticipoRentaVit.qrlPeriodoPrint(Sender: TObject; var Value: String);
var
  iAnios: Word;
  iDias: Word;
  iMeses: Word;
  sMesesTexto: String;
begin
  DateDiff(sdqHeader.FieldByName('LE_FECHADES').AsDateTime, sdqHeader.FieldByName('LE_FECHAHAS').AsDateTime + 1, iDias,
           iMeses, iAnios);

  sMesesTexto := '';

  if iAnios = 1 then
    sMesesTexto := sMesesTexto + IntToStr(iAnios) + ' Año '
  else if iAnios > 1 then
    sMesesTexto := sMesesTexto + IntToStr(iAnios) + ' Años ';

  if iMeses = 1 then
    sMesesTexto := sMesesTexto + IntToStr(iMeses) + ' Mes '
  else if iMeses > 1 then
    sMesesTexto := sMesesTexto + IntToStr(iMeses) + ' Meses ';

  if iDias = 1 then
    sMesesTexto := sMesesTexto + IntToStr(iDias) + ' Día'
  else if iDias > 1 then
    sMesesTexto := sMesesTexto + IntToStr(iDias) + ' Días';

  Value := sMesesTexto;
end;

procedure TfrmRptAnticipoRentaVit.sdqConsulta3AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta3.FieldByName('IMPORPERI') is TFloatField then
    TFloatField(sdqConsulta3.FieldByName('IMPORPERI')).Currency := True;
end;

procedure TfrmRptAnticipoRentaVit.sdqConsulta1AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta1.FieldByName('RS_IMPOAMPO') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('RS_IMPOAMPO')).Currency := True;

  if sdqConsulta1.FieldByName('RS_IMPOMES') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('RS_IMPOMES')).Currency := True;
end;

procedure TfrmRptAnticipoRentaVit.SDQHeaderAfterScroll(DataSet: TDataSet);
begin
  if sdqHeader.FieldByName('LE_IMPORPERI') is TFloatField then
    TFloatField(sdqHeader.FieldByName('LE_IMPORPERI')).Currency := True;
end;

procedure TfrmRptAnticipoRentaVit.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  bEsSinGobernacion :Boolean;
  iIdExped: integer;
begin
  inherited;
  iIdExped := Get_IdExpediente(SDQHeader.FieldByName('ex_siniestro').AsInteger, SDQHeader.FieldByName('ex_orden').AsInteger, SDQHeader.FieldByName('ex_recaida').AsInteger);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    qrlEmpDep.Caption := 'DEPENDENCIA GPBA';
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    qrlEmpDep.Caption := 'EMPRESA';
  end;
end;

end.
