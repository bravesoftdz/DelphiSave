unit unRptDomiciliosIncompletos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrDireccionesFaltantes = class(TQuickRep)
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    dsHistSiniestral: TDataSource;
    sdqDatos: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel34: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRDBText5: TQRDBText;
  private

  public

  end;

var
  qrDireccionesFaltantes: TqrDireccionesFaltantes;

implementation

{$R *.DFM}

end.
