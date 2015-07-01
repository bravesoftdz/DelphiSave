unit unRptInformeParteEvol;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine, unVisualizador;

type
  TrptInformeParteEvol = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qriLogoART: TQRImage;
    qrbTitle: TQRBand;
    qrlFecha: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlFirmante: TQRLabel;
    qrbPageFooter: TQRBand;
    qriLogoGBP: TQRImage;
    sdqHeader: TSDQuery;
    qrmDatosART: TQRMemo;
    qrlPaciente: TQRLabel;
    qrlDNI: TQRLabel;
    qrlFechaAccidente: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlDiagnostico: TQRLabel;
    qrlPrestador: TQRLabel;
    qrmResumenHistClinica: TQRMemo;
    qrlCaptionAval: TQRLabel;
    qrlAvalMedico: TQRLabel;
  private

  public
      function  Ejecutar(Siniestro:integer = 0): TResultados; virtual;
  end;

var
  rptInformeParteEvol: TrptInformeParteEvol;

implementation

uses unPrincipal;

{$R *.DFM}

{ TrptInformeParteEvol }



{ TrptInformeParteEvol }

function TrptInformeParteEvol.Ejecutar(Siniestro:integer = 0): TResultados;
begin
  Visualizar(Self, GetValores('Informe de Parte Evolutivo - Siniestro ' + IntToStr(Siniestro) , '', 0, Siniestro), [oAlwaysShowDialog,oForceDB,oForceShowModal]);
end;

end.
