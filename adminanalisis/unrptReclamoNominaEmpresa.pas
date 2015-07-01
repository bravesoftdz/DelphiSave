unit unrptReclamoNominaEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, unVisualizador;

type
  TrptReclamoNominaEmpresa = class(TForm)
    qrInformeAEmpresa: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRTitulo: TQRLabel;
    memTexto: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRImage2: TQRImage;
    qrLogo: TQRImage;
  private
    { Private declarations }
  public
    procedure Load(idHistContrato: String);
    { Public declarations }
  end;

var
  rptReclamoNominaEmpresa: TrptReclamoNominaEmpresa;

implementation

uses
  unDmPrincipal, AnsiSql;

{$R *.dfm}

procedure TrptReclamoNominaEmpresa.Load(idHistContrato : String);
begin
  QRTitulo.Caption := 'At. Sres. '+ValorSql(
    ' SELECT em_nombre || '' - '' || hc_contrato '+
    '   FROM afi.aem_empresa, afi.ahc_historicocontrato '+
    '  WHERE hc_id = '+ SqlValue(idHistContrato));
  qrLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );

  qrInformeAEmpresa.Prepare;
  qrInformeAEmpresa.Preview;
end;

end.
