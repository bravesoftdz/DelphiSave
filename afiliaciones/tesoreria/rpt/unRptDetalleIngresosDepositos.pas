unit unRptDetalleIngresosDepositos;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, DateTimeFuncs, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,
  unQRLabelEx, Db, SDEngine, ArtQReports;

type
  TqrDetalleIngresosDepositos = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRBColumnHeaderBand: TQRBand;
    qrbDetailBand: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRLabelEx1: TQRLabelEx;
    QRLabelEx2: TQRLabelEx;
    QRLabelEx3: TQRLabelEx;
    QRLabelEx4: TQRLabelEx;
    QRLabelEx5: TQRLabelEx;
    QRLabelEx7: TQRLabelEx;
    QRLabelEx8: TQRLabelEx;
    QRLabelEx9: TQRLabelEx;
    qrlIngresosCash: TQRLabelEx;
    qrlIngresosADepositar: TQRLabelEx;
    qrlDepositos: TQRLabelEx;
    qrlSaldoFinal: TQRLabelEx;
    sdqDatos: TSDQuery;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabelEx10: TQRLabelEx;
    QRLabelEx11: TQRLabelEx;
    QRLabelEx12: TQRLabelEx;
    QRLabelEx13: TQRLabelEx;
    QRLabelEx14: TQRLabelEx;
    qrlSaldoAnterior: TArtQRDBText;
    QRLabelEx26: TQRLabelEx;
    ArtQRDBText1: TArtQRDBText;
    ArtQRDBText2: TArtQRDBText;
    ArtQRDBText3: TArtQRDBText;
    qrlTitulo: TQRSysData;
    qrbSummaryBand: TQRBand;
    ChildBand6: TQRChildBand;
    QRLabelEx16: TQRLabelEx;
    QRLabelEx17: TQRLabelEx;
    QRLabelEx18: TQRLabelEx;
    QRLabelEx19: TQRLabelEx;
    QRLabelEx20: TQRLabelEx;
    QRLabelEx21: TQRLabelEx;
    QRLabelEx22: TQRLabelEx;
    QRLabelEx24: TQRLabelEx;
    ArtQRDBText5: TArtQRDBText;
    ArtQRDBText6: TArtQRDBText;
    ArtQRDBText7: TArtQRDBText;
    ArtQRDBText8: TArtQRDBText;
    ArtQRDBText9: TArtQRDBText;
    QRLabelEx37: TQRLabelEx;
    QRLabelEx38: TQRLabelEx;
    QRLabelEx39: TQRLabelEx;
    QRLabelEx40: TQRLabelEx;
    QRLabelEx41: TQRLabelEx;
    ArtQRDBText11: TArtQRDBText;
    ArtQRDBText12: TArtQRDBText;
    ArtQRDBText13: TArtQRDBText;
    ArtQRDBText14: TArtQRDBText;
    ArtQRDBText15: TArtQRDBText;
    QRLabelEx42: TQRLabelEx;
    QRLabelEx43: TQRLabelEx;
    QRLabelEx44: TQRLabelEx;
    QRLabelEx45: TQRLabelEx;
    QRLabelEx46: TQRLabelEx;
    QRLabel4: TQRLabel;
    sdqDepositos: TSDQuery;
    PageFooterBand1: TQRBand;
    QRLabelEx27: TQRLabelEx;
    QRLabelEx28: TQRLabelEx;
    QRLabelEx29: TQRLabelEx;
    QRLabelEx30: TQRLabelEx;
    QRLabelEx31: TQRLabelEx;
    QRLabelEx32: TQRLabelEx;
    QRLabelEx33: TQRLabelEx;
    QRLabelEx34: TQRLabelEx;
    QRLabelEx35: TQRLabelEx;
    QRLabelEx36: TQRLabelEx;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabelEx47: TQRLabelEx;
    QRLabelEx48: TQRLabelEx;
    qrlSaldo1: TQRLabel;
    qrlSaldo2: TQRLabel;
    qrlSaldo3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    ArtQRDBText16: TArtQRDBText;
    qrbTotales: TQRBand;
    qrbGrupo: TQRGroup;
    QRLabelEx6: TQRLabelEx;
    QRLabelEx15: TQRLabelEx;
    QRLabelEx23: TQRLabelEx;
    QRLabelEx25: TQRLabelEx;
    ArtQRDBText4: TQRExpr;
    ArtQRDBText17: TQRExpr;
    ArtQRDBText18: TQRExpr;
    ArtQRDBText19: TQRExpr;
    ArtQRDBText10: TQRLabel;
    ArtQRDBText20: TQRLabel;
    QRShape2: TQRShape;
    QRLabelEx49: TQRLabelEx;
    QRLabelEx50: TQRLabelEx;
    QRLabelEx51: TQRLabelEx;
    QRLabelEx52: TQRLabelEx;
    ArtQRDBText21: TArtQRDBText;
    QRLabel8: TQRLabel;
    ArtQRDBText22: TArtQRDBText;
    ArtQRDBText23: TArtQRDBText;
    ArtQRDBText24: TArtQRDBText;
    QRLabel9: TQRLabel;
    lbRetencionesIngresadasAlDia: TQRLabel;
    QRLabelEx53: TQRLabelEx;
    ArtQRDBText25: TArtQRDBText;
    QRLabelEx54: TQRLabelEx;
    ArtQRDBText26: TArtQRDBText;
    QRLabelEx55: TQRLabelEx;
    QRLabel10: TQRLabel;
    QRLabelEx56: TQRLabelEx;
    QRLabelEx57: TQRLabelEx;
    ArtQRDBText27: TArtQRDBText;
    qriLogo: TQRImage;
    QRLabel11: TQRLabel;
    qrlOtrosIngresos: TQRLabel;
    QRLabelEx58: TQRLabelEx;
    procedure qrlSaldo1Print(sender: TObject; var Value: String);
    procedure qrlSaldo2Print(sender: TObject; var Value: String);
    procedure qrlSaldo3Print(sender: TObject; var Value: String);
    procedure ArtQRDBText10Print(sender: TObject; var Value: String);
    procedure FormateoMoneda(sender: TObject; var Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Imprimir(ADate: TDateTime);
  end;

implementation

uses
  unVisualizador, unDmPrincipal, unART, unEspera, StrFuncs, Numeros, AnsiSql;

{$R *.DFM}

constructor TqrDetalleIngresosDepositos.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;

procedure TqrDetalleIngresosDepositos.Imprimir(ADate: TDateTime);
var
  dRes: Extended;
begin
  sdqDatos.ParamByName('pFECHA').AsDateTime := ADate;
  OpenQuery(sdqDatos);
  ReportTitle := Format(ReportTitle, [FormatDateTime('dd/mm/yyyy', ADate)]);

  sdqDepositos.ParamByName('pFECHA').AsDateTime := ADate;
  OpenQuery(sdqDepositos);

  dRes :=ValorSqlExtended(
    'SELECT NVL(SUM(VA_IMPORTE), 0) ' +
      'FROM OTV_TIPOVALOR, ZVA_VALOR ' +
     'WHERE TV_ID = VA_IDTIPOVALOR ' +
       'AND TV_CODIGO = ''RET'' ' +
       'AND TRUNC(VA_FECHAALTA) = ' + SqlValue(ADate));
  lbRetencionesIngresadasAlDia.Caption := Get_AjusteDecimales(FloatToStr(dRes), '$', 2);

  dRes :=ValorSqlExtended(
    'SELECT NVL(SUM(VA_IMPORTE), 0) ' +
      'FROM OTV_TIPOVALOR, ZVA_VALOR ' +
     'WHERE TV_ID = VA_IDTIPOVALOR ' +
       'AND TV_CODIGO = ''PFJ'' ' +
       'AND TRUNC(VA_FECHAALTA) = ' + SqlValue(ADate));
  qrlOtrosIngresos.Caption := Get_AjusteDecimales(FloatToStr(dRes), '$', 2);

  Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB]);
end;

procedure TqrDetalleIngresosDepositos.qrlSaldo1Print(sender: TObject; var Value: String);
var
  dRes: Extended;
begin
  dRes := sdqDatos.FieldByName('SALDO_INICIAL_CAJA').AsFloat +
          sdqDatos.FieldByName('INGRESOS_CASH').AsFloat +
          sdqDatos.FieldByName('INGRESOS_ADEPOSITAR').AsFloat -
          sdqDatos.FieldByName('DEPOSITOS').AsFloat -
          sdqDatos.FieldByName('REEMPLAZOS').AsFloat;
  Value := Get_AjusteDecimales(FloatToStr(dRes), '$', 2);
end;

procedure TqrDetalleIngresosDepositos.qrlSaldo2Print(sender: TObject; var Value: String);
var
  dRes: Extended;
begin
  dRes := sdqDatos.FieldByName('SALDO_INICIAL_VALORES_A_DEP').AsFloat +
          sdqDatos.FieldByName('INGRESOS_ADEPOSITAR').AsFloat -
          sdqDatos.FieldByName('EGRESO_VALORES_A_DEPOSITAR').AsFloat -
          sdqDatos.FieldByName('REEMPLAZO_VALORES_A_DEPOSITAR').AsFloat;
  Value := Get_AjusteDecimales(FloatToStr(dRes), '$', 2);
end;

procedure TqrDetalleIngresosDepositos.qrlSaldo3Print(sender: TObject; var Value: String);
var
  dRes: Extended;
begin                
  dRes := sdqDatos.FieldByName('SALDO_INICIAL_DOCUMENTOS').AsFloat +
          sdqDatos.FieldByName('DOCUMENTOS_INGRESADOS').AsFloat -
          sdqDatos.FieldByName('DOCUMENTOS_COBRADOS').AsFloat;
  Value := Get_AjusteDecimales(FloatToStr(dRes), '$', 2);
end;

procedure TqrDetalleIngresosDepositos.ArtQRDBText10Print(sender: TObject; var Value: String);
var
  dRes: Extended;
begin
  dRes := (sdqDatos.FieldByName('SALDO_INICIAL_CAJA').AsFloat +
           sdqDatos.FieldByName('INGRESOS_CASH').AsFloat +
           sdqDatos.FieldByName('INGRESOS_ADEPOSITAR').AsFloat -
           sdqDatos.FieldByName('DEPOSITOS').AsFloat -
           sdqDatos.FieldByName('REEMPLAZOS').AsFloat)
          -
         (sdqDatos.FieldByName('SALDO_INICIAL_VALORES_A_DEP').AsFloat +
          sdqDatos.FieldByName('INGRESOS_ADEPOSITAR').AsFloat -
          sdqDatos.FieldByName('EGRESO_VALORES_A_DEPOSITAR').AsFloat -
          sdqDatos.FieldByName('REEMPLAZO_VALORES_A_DEPOSITAR').AsFloat);
  Value := Get_AjusteDecimales(FloatToStr(dRes), '$', 2);
end;

procedure TqrDetalleIngresosDepositos.FormateoMoneda(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$', 2);
end;

end.

