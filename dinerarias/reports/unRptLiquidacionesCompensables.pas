unit unRptLiquidacionesCompensables;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptLiquidacionesCompensables = class(TQuickRep)
    sdqDatos: TSDQuery;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qriLogo: TQRImage;
    qrbDetalle: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    qrImpresoPor: TQRLabel;
    qrbGroupFooter: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    qrdbSiniestro: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrFechaHOY: TQRSysData;
    qrlFiltros: TQRLabel;
    procedure qrImpresoPorPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
  public
  end;

  procedure GenerarListLiquidacionesCompensables(Sql, Filtros: String);

var
  rptLiquidacionesCompensables: TrptLiquidacionesCompensables;

implementation
{$R *.DFM}

uses
  unSesion, unDmPrincipal, unVisualizador, StrFuncs;

procedure GenerarListLiquidacionesCompensables(Sql, Filtros: String);
var
  rpt: TrptLiquidacionesCompensables;
begin
  rpt := TrptLiquidacionesCompensables.Create(nil);
  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
      qrlFiltros.Caption := Filtros;
      
      OpenQuery(sdqDatos, Sql);

      Visualizar(rpt, GetValores('Listado de Liquidaciones Compensables'),
                 [oForceDB, oForceShowModal, oAlwaysShowDialog, oAutoFirma]);
    finally
      Free;
    end;
end;

procedure TrptLiquidacionesCompensables.qrImpresoPorPrint(sender: TObject; var Value: String);
begin
  Value := 'Impreso por ' + Sesion.Usuario;
end;

procedure TrptLiquidacionesCompensables.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

end.
