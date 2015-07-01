unit unRptHistSiniestral;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrHistSiniestral = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    qrlHSCuit: TQRLabel;
    qrlHSTrabajador: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel33: TQRLabel;
    qrlHSDomTrab: TQRLabel;
    qrlHSLocTrab: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    qrlRazSocDep: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    dsHistSiniestral: TDataSource;
    sdqHistSiniestral: TSDQuery;
    QRLabel6: TQRLabel;
    QRDBText20: TQRDBText;
  private

  public

  end;

var
  qrHistSiniestral: TqrHistSiniestral;

implementation

{$R *.DFM}

end.
