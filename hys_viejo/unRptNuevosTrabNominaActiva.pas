unit unRptNuevosTrabNominaActiva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, SDEngine, unDMPrincipal, AnsiSql,
  General, QRTansparentImage;

type
  TrptNuevosTrabNominaActiva = class(TForm)
    qrListaTrabajadores: TQuickRep;
    TitleBand1: TQRBand;
    QRBand2: TQRBand;
    qryConsulta: TSDQuery;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    Estab: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    procedure qrListaTrabajadoresBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDCabecera: Integer;
  end;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptNuevosTrabNominaActiva.qrListaTrabajadoresBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qryConsulta.ParamByName('pcabecera').Value := FIDCabecera;
  qryConsulta.Open;
end;

end.



