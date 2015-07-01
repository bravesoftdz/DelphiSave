unit unRptCompensacionesDepositar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.ImgList, XPMenu,
  RxPlacemnt, unArt, Data.DB, SDEngine, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  TRptCompensacionesDepositar = class(TfrmCustomForm)
    sdqDatos: TSDQuery;
    rpt: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlLote: TQRLabel;
    QRLabel1: TQRLabel;
    imgLogo: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRShape12: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    qrdbDeudaConsolidada: TQRExpr;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRShape3: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
    class function Preparar(IdCompensacion: TTableId): Boolean;
  end;

var
  RptCompensacionesDepositar: TRptCompensacionesDepositar;

implementation

{$R *.dfm}

uses
  unVisualizador, unDmPrincipal, AnsiSql, General, CustomDlgs, StrFuncs, unSesion;

procedure TRptCompensacionesDepositar.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

class function TRptCompensacionesDepositar.Preparar(IdCompensacion: TTableId): Boolean;
var
  frm: TRptCompensacionesDepositar;
begin
  frm := TRptCompensacionesDepositar.Create(nil);

  with frm do
    try
      imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrlLote.Caption    := 'LOTE Nº ' + IntToStr(IdCompensacion);
      qrlUsuario.Caption := Sesion.Usuario;

      sdqDatos.ParamByName('IdConpensacion').AsInteger := IdCompensacion;
      OpenQuery(sdqDatos);

      Result := not sdqDatos.Eof;

      if Result then
        Visualizar(rpt, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    finally
      Free;
    end;
end;

end.

