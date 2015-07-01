unit unRptCartDocRowing;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unRptCartDocRowingHeader, ArtQReports, Qrctrls, QRTansparentImage,
  QuickRpt, ExtCtrls;

type
  TrptCartDocRowing = class(TrptCartDocRowingHeader)
    qrbDetail: TQRBand;
    qrrTexto: TQRRichText;
  private
  public
  end;

var
  rptCartDocRowing: TrptCartDocRowing;

implementation

{$R *.DFM}

end.
