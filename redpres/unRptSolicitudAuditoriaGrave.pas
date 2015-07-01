unit unRptSolicitudAuditoriaGrave;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSolicitudAuditoriaGrave = class(TQuickRep)
    bHeader: TQRBand;
    QRImage1: TQRImage;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lbDoctor: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    bDetalle: TQRBand;
    bFooter: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    sdqDatos: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    lblReingreso: TQRLabel;
    qrdbReingreso: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText10: TQRDBText;
    qriLogo: TQRImage;
    qrlLeyenda: TQRLabel;
    qrdbHoraT: TQRDBText;
    qrlHoraTurno: TQRLabel;
    qrdbTurno: TQRDBText;
    qrlTurno: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
  public
    procedure Preparar(const aSolicitudId: Integer);
  end;

var
  rptSolicitudAuditoriaGrave: TrptSolicitudAuditoriaGrave;

implementation

uses
  AnsiSql, unDmPrincipal, unComunes;

{$R *.DFM}

procedure TrptSolicitudAuditoriaGrave.Preparar(const aSolicitudId: Integer);
var
  sSql: String;
  iSiniestro, iIdExpediente: integer;
begin
  with sdqDatos do
  begin
    Close;
    sSql := 'SELECT su_siniestro, su_orden, su_recaida, su_nroparte, su_idexpediente ' +
             ' FROM ssu_seguimientoauditoria' +
            ' WHERE su_id = :IdSol ';

    with GetQueryEx(sSql, [aSolicitudId]) do
    try
      iSiniestro    := FieldByName('su_siniestro').AsInteger;
      iIdExpediente := FieldByName('su_idexpediente').AsInteger;

      sdqDatos.ParamByName('Siniestro').AsInteger   := iSiniestro;
      sdqDatos.ParamByName('Orden').AsInteger       := FieldByName('su_orden').AsInteger;
      sdqDatos.ParamByName('Recaida').AsInteger     := FieldByName('su_recaida').AsInteger;
      sdqDatos.ParamByName('NroParte').AsInteger    := FieldByName('su_nroparte').AsInteger;

      if Is_SiniestroDeGobernacion(iIdExpediente) then
      begin
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
        qrlLeyenda.Caption := '';
      end
      else begin
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
        qrlLeyenda.Caption   := ART_ASEG;
        qrlLeyenda.Alignment := taCenter;
      end;

    finally
      Free;
    end;

    if (sdqDatos.ParamByName('Recaida').AsInteger > 0) then
      lblReingreso.Width := 98
    else
      lblReingreso.Width := 0;

    Open;

    if sdqDatos.FieldByName('pv_turno').IsNull then
    begin
      qrlTurno.Width      := 0;
      qrdbTurno.Width     := 0;
      qrlHoraTurno.Width  := 0;
      qrdbHoraT.Width     := 0;
    end;
  end;
end;

procedure TrptSolicitudAuditoriaGrave.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  lbDoctor.Caption := 'ENTREGADO EN MANO AL DR. ' + sdqDatos.FieldByName('DOCTOR').AsString;
end;

end.
