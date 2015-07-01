unit unCompLstSiniestrosLiberar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, SDEngine, RxMemDS;

type
  TQRlibera = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    dsCompensa: TDataSource;
    qryCompensa: TSDQuery;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel14: TQRLabel;
    mdLiberar: TRxMemoryData;
    mdLiberarCUIT: TStringField;
    mdLiberarNOMBRE: TStringField;
    mdLiberarSINIESTRO: TStringField;
    mdLiberarFECHADES: TDateField;
    mdLiberarFECHAHAS: TDateField;
    mdLiberarIMPORTE: TFloatField;
    mdLiberarCUIL: TStringField;
    mdLiberarTRABAJA: TStringField;
    mdLiberarLIQUIDACION: TStringField;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qriLogo: TQRImage;
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRlibera: TQRlibera;

implementation

uses unPrincipal;

{$R *.DFM}

{------------------------------------------------------------------------------}
procedure TQRlibera.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := frmPrincipal.dbLogin.LoginName;
end;
{------------------------------------------------------------------------------}
procedure TQRlibera.FormCreate(Sender: TObject);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{------------------------------------------------------------------------------}
end.


