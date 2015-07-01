unit unRptNotificacionRechazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, unArt;

type
  TfrmNotificacionRechazo = class(TForm)
    rptNotificacionRechazo: TQuickRep;
    DetailBand1: TQRBand;
    qrlNumero: TQRLabel;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    qrlLugarFecha: TQRLabel;
    QRLabel10: TQRLabel;
    qrdbFECHA_VAL: TQRDBText;
    QRLabel12: TQRLabel;
    qrdbMRECH: TQRDBText;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    sdqDatos: TSDQuery;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRLabel15: TQRLabel;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    qrdbVA_NROCHEQUE: TQRDBText;
    QRLabel9: TQRLabel;
    qrdbBANCO: TQRDBText;
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
  public
    procedure ImprimirNoticacionRechazo(ZVAId: TTableID);
  end;

implementation

{$R *.dfm}

uses
  CustomDlgs, unComunes, unDmPrincipal, unVisualizador;

procedure TfrmNotificacionRechazo.ImprimirNoticacionRechazo(ZVAId: TTableID);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

  rptNotificacionRechazo.ReportTitle := 'Notificación de Rechazo';

  sdqDatos.ParamByName('ID').AsInteger := ZVAId;
  OpenQuery(sdqDatos);

  if sdqDatos.IsEmpty then
    begin
      MsgBox('No se han encontrado los datos.', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end
  else
    begin
      qrlLugarFecha.Caption := 'Buenos Aires, ' + sdqDatos.FieldByName('FECHA_RECHAZO').AsString;

      Visualizar(rptNotificacionRechazo, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);
    end;
end;

procedure TfrmNotificacionRechazo.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  if sdqDatos.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqDatos.FieldByName('IMPORTE')).Currency := True;
end;

end.

