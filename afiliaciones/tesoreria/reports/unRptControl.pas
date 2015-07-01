unit unRptControl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TrptControl = class(TQuickRep)
    QRBand1: TQRBand;
    qrlProvinciaART: TQRLabel;
    qrlSedeLegal: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrlArchivo: TQRLabel;
    qrlTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
  public
  end;

var
  rptControl: TrptControl;

implementation

uses
  unDmPrincipal, General, strfuncs, unArt;

{$R *.DFM}

procedure TrptControl.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qrlProvinciaART.Caption := UPPERCase(TXT_EMP_NOMBRE_LARGO);
  qrlSedeLegal.Caption    := 'Sede legal: ' + TXT_EMP_DOMICILIO_LEGAL2;
end;

end.
