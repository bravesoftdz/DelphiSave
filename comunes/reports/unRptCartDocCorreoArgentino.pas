unit unRptCartDocCorreoArgentino;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unRptCartDocCorreoArgentinoHeader, ArtQReports, Qrctrls, QRTansparentImage,
  QuickRpt, ExtCtrls;

type
  TrptCartDocCorreoArgentino = class(TrptCartDocCorreoArgentinoHeader)
    qrbDetail: TQRBand;
    qrrTexto: TQRRichText;
  private
  public
  end;

var
  rptCartDocCorreoArgentino: TrptCartDocCorreoArgentino;

implementation

{$R *.DFM}

end.
