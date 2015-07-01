unit unRptInfCodInca;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrInfCodInca = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    qrlTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape1: TQRShape;
    dsCodInca: TDataSource;
    sdqCodInca: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
  private

  public

  end;

var
  qrInfCodInca: TqrInfCodInca;

implementation

{$R *.DFM}


end.
