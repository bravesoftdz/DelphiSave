unit unReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, Provider,
  DBClient;


type
  TrptReport = class(TQuickRep)
    qrbTitle: TQRBand;
    sdqPrintPDF: TSDQuery;
    qriLogo: TQRImage;
    qrRichText: TQRRichText;
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  rptReport: TrptReport;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptReport.QuickRepAfterPrint(Sender: TObject);
begin
  sdqPrintPDF.Close;
end;

procedure TrptReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sdqPrintPDF.Open;
end;

end.
