unit unRptInformeGenAMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptInformeGenAMP = class(TForm)
    qrInformeGenAMP: TQuickRep;
    TitleBand1: TQRBand;
    QRBand2: TQRBand;
    qryConsulta: TSDQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses unPrincipal;

{$R *.DFM}

end.


