unit unRptPersonalExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptPersonalExtra = class(TForm)
    qrPersonalExtra: TQuickRep;
    TitleBand1: TQRBand;
    QRBand2: TQRBand;
    qryConsulta: TSDQuery;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    Estab: TQRLabel;
    QRLabel3: TQRLabel;
    Lote: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    procedure qrPersonalExtraBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDLoteRpt: Integer;
    FIDEstableciRpt: Integer;
  end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptPersonalExtra.qrPersonalExtraBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('pidlote').Value     := FIDLoteRpt;
  qryConsulta.ParamByName('pidestableci').Value:= FIDEstableciRpt;

  qryConsulta.Open;
end;

end.



