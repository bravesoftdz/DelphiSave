unit unRptRemitoValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, SDEngine, QRCtrls, unArt;

type
  TfrmRptRemitoValores = class(TForm)
    rptRemitoValores: TQuickRep;
    sdqDatos: TSDQuery;
    DetailBand1: TQRBand;
    qrlNumero: TQRLabel;
    qriLogo: TQRImage;
    qrlDireccionART: TQRLabel;
    qrlTelefonoART: TQRLabel;
    qrlFaxART: TQRLabel;
    qrlWebART: TQRLabel;
    qrlPciaART: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    qrdbCUIT: TQRDBText;
    qrdbCONTRATO: TQRDBText;
    qrdbRAZON_SOCIAL: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrdbFECHA_ACC: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrdbBANCO: TQRDBText;
    qrdbVA_NROCHEQUE: TQRDBText;
    qrdbIMPORTE: TQRDBText;
    qrdbFECHA_VAL: TQRDBText;
    QRLabel12: TQRLabel;
    qrdbMRECH: TQRDBText;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel18: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape14: TQRShape;
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
  public
    procedure ImprimirRemitoValores(ARuvId: TTableID);
  end;

implementation

{$R *.dfm}

uses
  CustomDlgs, unComunes, unDmPrincipal, unVisualizador;

procedure TfrmRptRemitoValores.ImprimirRemitoValores(ARuvId: TTableID);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

  rptRemitoValores.ReportTitle := 'Remito de Valores';

  qrlDireccionART.Caption := ART_DOMICILIO2 + ' (' + ART_CPOSTALA + ')';
  qrlPciaART.Caption      := ART_LOCALIDAD2;
  qrlTelefonoART.Caption  := TXT_EMP_TEL;
  qrlFaxART.Caption       := TXT_EMP_FAX;
  qrlWebART.Caption       := ART_PAGWEB;

  sdqDatos.ParamByName('ID').AsInteger := ARuvId;
  OpenQuery(sdqDatos);

  if sdqDatos.IsEmpty then
    begin
      MsgBox('No se han encontrado los datos.', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end
  else
    Visualizar(rptRemitoValores, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);
end;

procedure TfrmRptRemitoValores.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  if sdqDatos.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqDatos.FieldByName('IMPORTE')).Currency := True;
end;

end.

