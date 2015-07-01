unit unrptAnexo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, RxCalc, qrcb_run;

type
  TrptAnexo2 = class(TForm)
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    edRazonSocial: TQRLabel;
    edContrato: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabelNormativa: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    edCUIT: TQRLabel;
    QRLabel7: TQRLabel;
    edEstablecimiento: TQRLabel;
    QRLabel9: TQRLabel;
    edCP: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrLabelNormativaVig: TQRLabel;
    sdqEmpresa: TSDQuery;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    shPrimero: TQRShape;
    lbSi: TQRDBText;
    lbNo: TQRDBText;
    shSegundo: TQRShape;
    lbNoAplica: TQRDBText;
    shTercero: TQRShape;
    QRDBArticulos: TQRDBText;
    QRBand2: TQRBand;
    lbAnexo: TQRLabel;
    QRLabel16: TQRLabel;
    qrFirmaEP: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    edContratoEstablecimiento: TQRLabel;
    QRLabel19: TQRLabel;
    qrFirmaET: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrLabelPRS: TQRLabel;
    lbPRS: TQRDBText;
    shCuarto: TQRShape;
    logo: TQRImage;
    QRLblAmeritaPRS: TQRLabel;
    QRChkAmeritaPRS: TQRCheckBox;
    QRLblAmeritaPRSSI: TQRLabel;
    QRLblAmeritaPRSNO: TQRLabel;
    QRChkNoAmeritaPRS: TQRCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFirmaETBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FCUIT : String;
    FEstableci : Integer;
    FTipo : String;
    FOperativo : String;
    FTipoAnexo : String;
    FCantPages : Integer;
  public
    procedure Load(Cuit : String; Establecimiento :Integer; Tipo, Operativo, TipoAnexo :  String; pPath : String = '');
    procedure ExportPdf (Cuit : String; Establecimiento :Integer; Tipo, Operativo, TipoAnexo : String; pPath : String);
  end;

var
  rptAnexo2: TrptAnexo2;

implementation

{$R *.dfm}
uses unVisualizador, unDmPrincipal, AnsiSql, Types, ArchFuncs, unExportPDF,
  Math;

procedure TrptAnexo2.FormCreate(Sender: TObject);
begin
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqEmpresa.ParamByName('tipo').AsString := FTipo;
  sdqEmpresa.ParamByName('operativo').AsString := FOperativo;
  sdqEmpresa.ParamByName('tipoanexo').AsString := FTipoAnexo;

end;


procedure TrptAnexo2.Load(Cuit : String; Establecimiento :Integer; Tipo, Operativo, TipoAnexo :  String; pPath : String = '');
begin
  FCUIT := Cuit;
  FEstableci := Establecimiento;
  FTipo := Tipo;
  FOperativo := Operativo;
  FTipoAnexo := TipoAnexo;

  edRazonSocial.Caption := ValorSql(
                                    ' SELECT EM_NOMBRE '+
                                    '   FROM afi.aem_empresa '+
                                    '  WHERE em_cuit = '+SqlValue(FCUIT));
  edContrato.Caption := ValorSql(
                                    ' SELECT art.GET_VULTCONTRATO('+SqlValue(FCUIT)+')'+
                                    '   FROM dual ')  ;
  edCUIT.Caption := FCUIT;

  QRLblAmeritaPRS.Enabled := false;
  QRLblAmeritaPRSSI.Enabled := false;
  QRChkAmeritaPRS.Enabled := false;
  QRLblAmeritaPRSNO.Enabled := false;
  QRChkNoAmeritaPRS.Enabled := false;

  lbAnexo.Caption := '................................... AN2';
  if (TipoAnexo = 'A') or (TipoAnexo = 'E') then
    QRLabelNormativa.Caption := 'NORMATIVA VIGENTE  (DEC. 351/79)'
  else
  if (TipoAnexo = 'B') or (TipoAnexo = 'F') then
    QRLabelNormativa.Caption := 'NORMATIVA VIGENTE  (DEC. 911/96)'
  else
  if (TipoAnexo = 'C') or (TipoAnexo = 'G') then
    QRLabelNormativa.Caption := 'NORMATIVA VIGENTE  (DEC. 617/97)'
  else
  if (TipoAnexo = 'D') then
  begin
    QRLabelNormativa.Caption := 'NORMATIVA VIGENTE  (DEC. 351/79)';
    lbAnexo.Caption := '................................... AN2';
    qrFirmaEP.Enabled := True;
    qrFirmaET.Enabled := False;
    qrLabelPRS.Enabled := False;
    shCuarto.Enabled := False;
    lbPRS.Enabled := False;
    qrLabelNormativaVig.Left := qrLabelNormativaVig.Left -30;
    QRDBArticulos.Left := QRDBArticulos.Left -30;
  end else
    qrFirmaET.Enabled := True;

  edEstablecimiento.Caption := IntToStr(Establecimiento);
  edCP.Caption := ValorSql(         ' SELECT ES_CPOSTAL '+
                                    '   FROM afi.aes_establecimiento, afi.aem_empresa, afi.aco_contrato '+
                                    '  WHERE em_cuit = '+ SqlValue(FCUIT)+
                                    '    AND ES_NROESTABLECI = '+SqlValue(FEstableci)+
                                    '    AND co_contrato = art.get_vultcontrato (em_cuit) '+
                                    '    AND co_contrato = es_contrato '+
                                    '    AND co_idempresa = em_id ');
  edContratoEstablecimiento.Caption := edContrato.Caption + ' / ' + edEstablecimiento.Caption;
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqEmpresa.ParamByName('tipo').AsString := FTipo;
  sdqEmpresa.ParamByName('operativo').AsString := FOperativo;
  sdqEmpresa.ParamByName('tipoanexo').AsString := FTipoAnexo;
  sdqEmpresa.Open;
  qrResolucion.Prepare;
  FCantPages := qrResolucion.QRPrinter.PageCount;

  if pPath = '' then
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  else
  begin
    qrResolucion.Prepare;
    qrResolucion.QRPrinter.Title := pPath;
    qrResolucion.QRPrinter.Print;
    qrResolucion.QRPrinter.Free;
    qrResolucion.QRPrinter.Cleanup;
  end;


  sdqEmpresa.close;
end;



procedure TrptAnexo2.QRDBText2Print(sender: TObject; var Value: String);
begin
  inherited;
  QRDBText2.Caption := Value;
  //QRDBText2.a
  QRBand1.Height    :=  (QRDBText2.Height) + 10;


  shPrimero.Height  :=  QRDBText2.Height + 4;
  shSegundo.Height  :=  QRDBText2.Height + 4;
  shTercero.Height  :=  QRDBText2.Height + 4;
  shCuarto.Height  :=   QRDBText2.Height + 4;
end;

procedure TrptAnexo2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//var
  //nAltura: Integer;
begin
  {nAltura := Sender.BandFrameRect.Bottom - Sender.BandFrameRect.Top;
  shBarra1.Height := nAltura;
  shBarra2.Height := nAltura;
  shBarra3.Height := nAltura;
  shBarra4.Height := QRBand1.Height;
  shBarra5.Height := QRBand1.Height;}
end;

procedure TrptAnexo2.qrFirmaETBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrFirmaET.Enabled and qrFirmaET.Enabled and (FCantPages = qrResolucion.QRPrinter.PageNumber) then
  begin
    QRLblAmeritaPRS.Enabled := true;
    QRLblAmeritaPRSSI.Enabled := true;
    QRChkAmeritaPRS.Enabled := true;
    QRLblAmeritaPRSNO.Enabled := true;
    QRChkNoAmeritaPRS.Enabled := true;
    QRLblAmeritaPRS.Top := 2;
    QRLblAmeritaPRSSI.Top := 2;
    QRLblAmeritaPRSNO.Top := 2;
    QRChkAmeritaPRS.Top := 0;
    QRChkNoAmeritaPRS.Top := 0;
  end;
end;

procedure TrptAnexo2.ExportPdf(Cuit: String; Establecimiento: Integer;
  Tipo, Operativo, TipoAnexo, pPath: String);
begin
  Load(Cuit, Establecimiento, Tipo, Operativo, TipoAnexo, pPath);
end;

end.
