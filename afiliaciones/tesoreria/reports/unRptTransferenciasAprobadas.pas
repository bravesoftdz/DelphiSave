unit unRptTransferenciasAprobadas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrTransferenciasAprobadas = class(TQuickRep)
    sdqReporte: TSDQuery;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlAprobo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirTransfAprobadas(Fecha: TDateTime);

var
  qrTransferenciasAprobadas: TqrTransferenciasAprobadas;

implementation

{$R *.DFM}

uses
  unVisualizador, unDmPrincipal, StrFuncs, General, unSesion, DateTimeFuncs;

procedure DoImprimirTransfAprobadas(Fecha: TDateTime);
var
  rpt: TqrTransferenciasAprobadas;
begin
  rpt := TqrTransferenciasAprobadas.Create( nil );

  with rpt do
    try
      OpenQueryEx(sdqReporte, [TDateTimeEx.Create(Fecha)]);

      if sdqReporte.Eof then
        MsgBox('No se han encontrado transferencias', MB_OK + MB_ICONERROR)
      else
        begin
          qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
          qrlAprobo.Caption := Sesion.Usuario;

          Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
        end;
    finally
      Free;
    end;
end;

procedure TqrTransferenciasAprobadas.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
