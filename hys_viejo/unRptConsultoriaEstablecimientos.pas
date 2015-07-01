unit unRptConsultoriaEstablecimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TrptConsultoriaEstablecimiento = class(TForm)
    qrHoja1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRLabel7: TQRLabel;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    qrHoja2: TQuickRep;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRShape12: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel12: TQRLabel;
    qrHoja3: TQuickRep;
    QRBand5: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRShape17: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape20: TQRShape;
    QRLabel18: TQRLabel;
    qrHoja4: TQuickRep;
    QRBand7: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand8: TQRBand;
    QRLabel19: TQRLabel;
    QRShape23: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape24: TQRShape;
    QRShape2: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape10: TQRShape;
    QRShape31: TQRShape;
    QRShape15: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape21: TQRShape;
    qrHoja5: TQuickRep;
    QRBand9: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand10: TQRBand;
    QRLabel22: TQRLabel;
    QRShape35: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel26: TQRLabel;
    QRShape39: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape38: TQRShape;
    QRShape34: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    qrHoja6: TQuickRep;
    QRBand11: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRDBText24: TQRDBText;
    QRBand12: TQRBand;
    QRLabel28: TQRLabel;
    QRShape47: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    qrHoja7: TQuickRep;
    QRBand13: TQRBand;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape50: TQRShape;
    QRDBText27: TQRDBText;
    QRBand14: TQRBand;
    QRLabel33: TQRLabel;
    QRShape52: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape53: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    qrHoja8: TQuickRep;
    QRBand15: TQRBand;
    QRBand16: TQRBand;
    QRLabel42: TQRLabel;
    QRShape67: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape68: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape73: TQRShape;
    QRLabel50: TQRLabel;
    QRShape74: TQRShape;
    QRLabel51: TQRLabel;
    QRShape75: TQRShape;
    QRLabel52: TQRLabel;
    QRShape76: TQRShape;
    QRLabel53: TQRLabel;
    QRShape77: TQRShape;
    QRLabel54: TQRLabel;
    QRShape78: TQRShape;
    QRLabel55: TQRLabel;
    QRShape79: TQRShape;
    QRLabel56: TQRLabel;
    QRShape80: TQRShape;
    QRLabel57: TQRLabel;
    QRShape51: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    qrHoja9: TQuickRep;
    QRBand17: TQRBand;
    QRShape66: TQRShape;
    QRShape72: TQRShape;
    QRShape82: TQRShape;
    QRDBText32: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText39: TQRDBText;
    QRBand18: TQRBand;
    QRLabel49: TQRLabel;
    QRShape84: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape85: TQRShape;
    QRLabel62: TQRLabel;
    QRShape87: TQRShape;
    CompositeReport: TQRCompositeReport;
    sdqAnalisisExposicion: TSDQuery;
    sdqRiesgosRelevadosHistorico: TSDQuery;
    QRDBText40: TQRDBText;
    sdqCaracterizacionRelev: TSDQuery;
    QRLabel60: TQRLabel;
    sdqRiesgosNoRepiten: TSDQuery;
    sdqRiesgosPuestos: TSDQuery;
    sdqGestionAsignacion: TSDQuery;
    sdqGestionRealizacionExamenes: TSDQuery;
    sdqResultadosMedicos: TSDQuery;
    sdqEstudiosEnfermedades: TSDQuery;
    procedure CompositeReportAddReports(Sender: TObject);
  private

    { Private declarations }
  public
    procedure Load(idempresa, iEstableci: Integer);
    { Public declarations }
  end;

var
  rptConsultoriaEstablecimiento: TrptConsultoriaEstablecimiento;

implementation

uses
  unVisualizador, ArchFuncs, unExportPDF;

{$R *.dfm}

procedure TrptConsultoriaEstablecimiento.Load(idEmpresa,iEstableci : Integer);
var
  Path : String;
begin

  sdqAnalisisExposicion.ParamByName('idempresa').AsInteger := idempresa;
  sdqAnalisisExposicion.ParamByName('estableci').AsInteger := iEstableci;
  sdqRiesgosRelevadosHistorico.ParamByName('idempresa').AsInteger := idempresa;
  sdqRiesgosRelevadosHistorico.ParamByName('estableci').AsInteger := iEstableci;
  sdqCaracterizacionRelev.ParamByName('idempresa').AsInteger := idempresa;
  sdqCaracterizacionRelev.ParamByName('estableci').AsInteger := iEstableci;
  sdqRiesgosNoRepiten.ParamByName('idempresa').AsInteger := idempresa;
  sdqRiesgosNoRepiten.ParamByName('estableci').AsInteger := iEstableci;
  sdqRiesgosPuestos.ParamByName('idempresa').AsInteger := idempresa;
  sdqRiesgosPuestos.ParamByName('estableci').AsInteger := iEstableci;
  sdqGestionAsignacion.ParamByName('idempresa').AsInteger := idempresa;
  sdqGestionAsignacion.ParamByName('estableci').AsInteger := iEstableci;
  sdqGestionRealizacionExamenes.ParamByName('idempresa').AsInteger := idempresa;
  sdqGestionRealizacionExamenes.ParamByName('estableci').AsInteger := iEstableci;
  sdqResultadosMedicos.ParamByName('idempresa').AsInteger := idempresa;
  sdqResultadosMedicos.ParamByName('estableci').AsInteger := iEstableci;
  sdqEstudiosEnfermedades.ParamByName('idempresa').AsInteger := idempresa;
  sdqEstudiosEnfermedades.ParamByName('estableci').AsInteger := iEstableci;

  sdqAnalisisExposicion.Open;
  sdqRiesgosRelevadosHistorico.Open;
  sdqCaracterizacionRelev.Open;
  sdqRiesgosNoRepiten.Open;
  sdqRiesgosPuestos.Open;
  sdqGestionAsignacion.Open;
  sdqGestionRealizacionExamenes.Open;
  sdqResultadosMedicos.Open;
  sdqEstudiosEnfermedades.Open;


  CompositeReport.Prepare;

  Path := TempPath+IntToStr(idempresa)+'_'+IntToStr(iEstableci)+'_archivoconsultoria.qrp';
  CompositeReport.QRPrinter.Save(Path);

  CompositeReport.QRPrinter.Free;

  if not FileToPDFSvr(path,TempPath+IntToStr(idempresa)+'_'+IntToStr(iEstableci)+'_archivoconsultoria.pdf') then
    raise Exception.Create('Error al generar el PDF');

  sdqAnalisisExposicion.Close;
  sdqRiesgosRelevadosHistorico.Close;
  sdqCaracterizacionRelev.Close;
  sdqRiesgosNoRepiten.Close;
  sdqRiesgosPuestos.Close;
  sdqGestionAsignacion.Close;
  sdqGestionRealizacionExamenes.Close;
  sdqResultadosMedicos.Close;
  sdqEstudiosEnfermedades.Close;

end;

procedure TrptConsultoriaEstablecimiento.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add(qrHoja1);
  CompositeReport.Reports.Add(qrHoja2);
  CompositeReport.Reports.Add(qrHoja3);
  CompositeReport.Reports.Add(qrHoja4);
  CompositeReport.Reports.Add(qrHoja5);
  CompositeReport.Reports.Add(qrHoja6);
  CompositeReport.Reports.Add(qrHoja7);
  CompositeReport.Reports.Add(qrHoja8);
  CompositeReport.Reports.Add(qrHoja9);
end;


end.
