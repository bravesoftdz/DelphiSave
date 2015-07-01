unit unQrResumenControlStockCajas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrResumenControlStockCajas = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qriLogo: TQRImage;
    qrlLoteEnvioDocumentacion: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    sdqConsulta: TSDQuery;
    DetailBand1: TQRBand;
    qrNumeroItem: TQRDBText;
    QRDBText1: TQRDBText;
    qrlLabelOpcionDestino: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    qrsLineaFirma: TQRShape;
    QRShape1: TQRShape;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qreCantErrTotal: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape2: TQRShape;
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

  procedure ImprimirResumen(ASql: String);

var
  qrResumenControlStockCajas: TqrResumenControlStockCajas;

implementation

uses
  unDmPrincipal, unVisualizador;

{$R *.DFM}
          
constructor TqrResumenControlStockCajas.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;

procedure ImprimirResumen(ASql: String);
var
  sSql: String;
  rpt: TqrResumenControlStockCajas;
begin
  rpt := TqrResumenControlStockCajas.Create(nil);
  with rpt do
    try
      sSql := 'SELECT TIPOARCHIVO, COUNT(*) CANTCAJAS, ' +
                     'SUM(DECODE(FUERATERMINO, ''S'', 1, 0)) CANTFUERATERMINO, ' +
                     'SUM(DECODE(FUERATERMINO, ''N'', 1, 0)) CANTENTERMINO, ' +
                     'NVL(TO_CHAR(MIN(CASE WHEN FUERATERMINO = ''S'' THEN FECHAENVIO ELSE NULL END), ''DD/MM/YYYY''), ''---'') PRIMERAFECHAFUERATERMINO ' +
                'FROM (' + ASql + ') ' +
               'GROUP BY TIPOARCHIVO ' +
               'ORDER BY TIPOARCHIVO';

      OpenQuery(sdqConsulta, sSql);

      Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
    finally
      Free;
    end;
end;

end.
