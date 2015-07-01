unit unRptDetallePagosFondoGarantia;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, QuickRpt, QRCtrls, DB, SDEngine, unArt;

type
  TqrDetallePagosFondoGarantia = class(TQuickRep)
    sdqDatos: TSDQuery;
    PageHeaderBand1: TQRBand;
    imgLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRLabel9: TQRLabel;
    QRShape12: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText7: TQRDBText;
    QRShape16: TQRShape;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    qrdbDeudaConsolidada: TQRExpr;
    qrlCuenta: TQRLabel;
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
  private
  public
    class procedure Preparar(IdDetallePago: TTableId);
  end;

var
  qrDetallePagosFondoGarantia: TqrDetallePagosFondoGarantia;

implementation

uses
  unVisualizador, unDmPrincipal, AnsiSql, General, CustomDlgs, StrFuncs, unSesion;

{$R *.DFM}

class procedure TqrDetallePagosFondoGarantia.Preparar(IdDetallePago: TTableId);
var
  rpt: TqrDetallePagosFondoGarantia;
begin
  rpt := TqrDetallePagosFondoGarantia.Create(nil);

  with rpt do
    try
      imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
      qrlCuenta.Caption := 'Depositar en cuenta 2820/76 Fondo Garantía S.R.T. - Banco Nación';

      sdqDatos.ParamByName('IdZPF').AsInteger := IdDetallePago;
      OpenQuery(sdqDatos);

      if sdqDatos.Eof then
        MsgBox('No se han encontrado registros.', MB_OK + MB_ICONERROR)
      else
        Visualizar(rpt, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    finally
      Free;
    end;
end;

procedure TqrDetallePagosFondoGarantia.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TqrDetallePagosFondoGarantia.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

end.

