unit unRptCuadradaBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Db, SDEngine, Qrctrls;

type
  TfrmRptCuadrada = class(TForm)
    sdqConsulta: TSDQuery;
    qrpCuadrada: TQuickRep;
    QRBDatosAnexos: TQRBand;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRBand3: TQRBand;
    QRLabel27: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    lblTitulo: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRShape1: TQRShape;
    qriLogo: TQRImage;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
  public
  end;

var
  frmRptCuadrada: TfrmRptCuadrada;

implementation

uses
  unDmPrincipal;

{$R *.DFM}

procedure TfrmRptCuadrada.FormCreate(Sender: TObject);
begin
  // toma el bmp del Logo que es un recurso y lo incorpora al picture
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TfrmRptCuadrada.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if Odd (DataSet.RecNo) then
    QRShape1.Brush.Color := $00DBD8C4
  else
    QRShape1.Brush.Color := clWhite
end;

end.

