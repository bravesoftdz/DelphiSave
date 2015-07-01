unit unRptEvalPrestacJuntaMed;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unComunes, unDmPrincipal, General,
  unMoldeEnvioMail, unExportPDF;

type
  TqrEvalPrestacJuntaMed = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    qrlCad6: TQRLabel;
    QRLabel2: TQRLabel;
    qrlFecha: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
  private

  public
    procedure ImprimirEvalPrestacJuntaMed(iSiniestro, iOrden, iRecaida: Integer; sTipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
  end;

var
  qrEvalPrestacJuntaMed: TqrEvalPrestacJuntaMed;

implementation

{$R *.DFM}

{ TqrEvalPrestacJuntaMed }

procedure TqrEvalPrestacJuntaMed.ImprimirEvalPrestacJuntaMed(iSiniestro, iOrden, iRecaida: Integer; sTipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var sFileName: string;
    iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  if Is_SiniestroDeGobernacion(iIdExped) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
  qrlFecha.Caption     := DateToStr(DBDate);
  qrlSiniestro.Caption := IntToStr(iSiniestro) + '/' + IntToStr(iOrden);

  if sTipoSalida = 'I' then //impresora
    Print
  else if sTipoSalida = 'M' then //mail
  begin
    sFileName := Get_NombreArchivoPDF('EvalPrestacJuntaMed', iSiniestro, iOrden, iRecaida, '');
    ExportarPDF(self, sFileName);
    Cuerpo.Add('Evaluación de Prestaciones en Junta Médica');
    AddAttach(sFileName, 0, vAdjuntos);
  end;
end;

end.
