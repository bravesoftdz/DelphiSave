unit unRPTJudicial;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TRptJudicial = class(TQuickRep)
    QRBand1: TQRBand;
    sdqReporte: TSDQuery;
  private

  public

  end;

var
  RptJudicial: TRptJudicial;

implementation

{$R *.DFM}

end.
