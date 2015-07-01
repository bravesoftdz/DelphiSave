unit unRptSolicitudAuditoria;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSolicitudAuditoria = class(TQuickRep)
    bHeader: TQRBand;
    bDetalle: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    sdqDatos: TSDQuery;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    memoObservaciones: TQRMemo;
    QRLabel21: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText13: TQRDBText;
    lbFirmante: TQRLabel;
    lbFecha: TQRLabel;
    qrdbReingreso: TQRDBText;
    lblReingreso: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText14: TQRDBText;
    qrlTurno: TQRLabel;
    qrdbTurno: TQRDBText;
    qrdbHoraT: TQRDBText;
    qrlHoraTurno: TQRLabel;
    qriLogo: TQRImage;
    qrlLeyenda: TQRLabel;
  private
  public
    procedure Preparar(const aSolicitudId: Integer);
  end;

var
  rptSolicitudAuditoria: TrptSolicitudAuditoria;

implementation

uses
  unParteEvolutivo, AnsiSql, unDmPrincipal, unComunes;

{$R *.DFM}

procedure TrptSolicitudAuditoria.Preparar(const aSolicitudId: Integer);
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
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
        qrlLeyenda.Caption   := ART_ASEG;
        qrlLeyenda.Alignment := taCenter;
      end;

    finally
      Free;
    end;

    Open;

    if sdqDatos.FieldByName('pv_turno').IsNull then
    begin
      qrlTurno.Width      := 0;
      qrdbTurno.Width     := 0;
      qrlHoraTurno.Width  := 0;
      qrdbHoraT.Width     := 0;
    end;

    memoObservaciones.Lines.Text := FieldByName('PV_OBSERVACIONES').AsString;
    if (sdqDatos.ParamByName('Recaida').AsInteger > 0) then
      lblReingreso.Width := 98
    else
      lblReingreso.Width := 0;

  end;

  sSql := 'SELECT se_nombre, su_fechaalta' +
           ' FROM ssu_seguimientoauditoria, use_usuarios' +
          ' WHERE su_usualta = se_usuario' +
            ' AND su_id = :IdSol';

  with GetQueryEx(sSql, [aSolicitudId]) do
  try
    lbFirmante.Caption  := FieldByName('SE_NOMBRE').AsString;
    lbFecha.Caption     := FormatDateTime('dd/mm/yyyy', FieldByName('SU_FECHAALTA').AsDateTime);
  finally
    Free;
  end;
end;

end.
