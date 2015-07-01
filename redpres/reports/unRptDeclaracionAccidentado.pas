unit unRptDeclaracionAccidentado;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptDeclaracionAccidentado = class(TQuickRep)
    bHeader: TQRBand;
    bDetalle: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    sdqDatos: TSDQuery;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText13: TQRDBText;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
  private
  public
    procedure Preparar(const aSolicitudId: Integer);
  end;

var
  rptDeclaracionAccidentado: TrptDeclaracionAccidentado;

implementation

uses
  unParteEvolutivo, AnsiSql, unDmPrincipal, unComunes;

{$R *.DFM}

procedure TrptDeclaracionAccidentado.Preparar(const aSolicitudId: Integer);
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
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
      else
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    finally
      Free;
    end;

    Open;

  end;

end;

end.
