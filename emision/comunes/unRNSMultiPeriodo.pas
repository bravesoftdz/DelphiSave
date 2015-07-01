unit unRNSMultiPeriodo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, ArtQReports, DB, SDEngine;

type
  TqrRNSMultiPeriodo = class(TQuickRep)
    bPrincipal: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    imgLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qrRazonSocial: TQRLabel;
    qrCuit: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRBand1: TQRBand;
    QRShape9: TQRShape;
    QRLabel22: TQRLabel;
    s: TQRShape;
    QRLabel23: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    DetailBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    sdqDatos: TSDQuery;
    sdqDatosNota: TSDQuery;
    qrPeriodo: TQRDBText;
    qrRemuneracion: TQRDBText;
    qrEmpleados: TQRDBText;
    QRShape1: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    qrTelefono: TQRLabel;
    qrFax: TQRLabel;
    qrEmail: TQRLabel;
  private

  public
    procedure Preparar(Contrato: Integer; ConTope: Boolean);
  end;

var
  qrRNSMultiPeriodo: TqrRNSMultiPeriodo;

implementation

{$R *.DFM}
uses
  unSesion, General, unDmPrincipal, AnsiSql, StrFuncs, unVisualizador;

procedure TqrRNSMultiPeriodo.Preparar(Contrato : Integer; ConTope : Boolean);
begin
  try
    imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  except
    // Si no existe no muestro nada..
  end;

  with sdqDatos do
  begin
    Close;
    ParamByName('contrato').AsInteger := Contrato;
    if ConTope then
    begin
      ParamByName('idgestionable').AsInteger := 18;
    end
    else
      ParamByName('idgestionable').AsInteger := 17;
    Open;
  end;

  with sdqDatosNota do
  begin
    ParamByName('contrato').AsInteger := Contrato;
    Open;
    if not Eof then
    begin
      qrRazonSocial.Caption := qrRazonSocial.Caption +  '   ' + fieldbyname('em_nombre').AsString;
      qrCuit.Caption := qrCuit.Caption + '   ' + fieldbyname('em_cuit').AsString;
    end;
    Close;
  end;

  self.Prepare;
  Visualizar(Self, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
end;


end.
