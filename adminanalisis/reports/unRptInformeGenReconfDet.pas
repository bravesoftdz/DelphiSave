unit unRptInformeGenReconfDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptInformeGenReconfDet = class(TForm)
    qrInformeGenReconf: TQuickRep;
    ftEmpresa: TQRBand;
    TitleBand1: TQRBand;
    grEmpresa: TQRGroup;
    QRBand2: TQRBand;
    qryConsulta: TSDQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText15: TQRDBText;
    grEmpleado: TQRGroup;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText22: TQRDBText;
    ftEmpleado: TQRBand;
    QRDBText27: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText29: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses unPrincipal;

{$R *.DFM}

end.


