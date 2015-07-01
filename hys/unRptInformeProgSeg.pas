unit unRptInformeProgSeg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TrptInformeProgSeg = class(TForm)
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
    lbEmpresa: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    lbFormualario: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    lbContrato: TQRLabel;
    lbObra: TQRLabel;
    lbResolucion: TQRLabel;
    lblfirmaprofart: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    lbRecepcion: TQRLabel;
    logo: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load (Empresa, Contrato, Obra, Resolucion, Recepcion,Preventor : string);
  end;

var
  rptInformeProgSeg: TrptInformeProgSeg;

implementation

{$R *.dfm}

procedure TrptInformeProgSeg.Load(Empresa, Contrato, Obra, Resolucion, Recepcion, Preventor : string);
begin
  lbEmpresa.Caption := Empresa;
  lbContrato.Caption := Contrato;
  lbObra.Caption := Obra;
  lbResolucion.Caption := Resolucion;
  lbRecepcion.Caption := Recepcion+ ' NOT';
end;

end.
