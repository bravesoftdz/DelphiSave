unit unRptAudiometria;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptAudiometria = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    sdqConsulta: TSDQuery;
    qrdbEstudio: TQRDBText;
  private

  public

  end;

var
  rptAudiometria: TrptAudiometria;

implementation

{$R *.DFM}

end.
