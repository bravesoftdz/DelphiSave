unit unRptImpuestosVencimientos;
                         
interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;
         
type
  TqrImpuestosVencimientos = class(TQuickRep)
    sdqDatos: TSDQuery;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    qriLogo: TQRImage;
    QRSysData1: TQRSysData;
    QRBand1: TQRBand;
    qrlUsuario: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrlLun: TQRLabel;
    qrlMar: TQRLabel;
    qrlMie: TQRLabel;
    qrlJue: TQRLabel;
    qrlVie: TQRLabel;
    qrlSab: TQRLabel;
    qrlDom: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrbGroupFooter: TQRBand;
    qreTotLun: TQRExpr;
    QRLabel4: TQRLabel;
    qreTotMie: TQRExpr;
    qreTotMar: TQRExpr;
    qreTotJue: TQRExpr;
    qreTotVie: TQRExpr;
    qreTotSab: TQRExpr;
    qreTotDom: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr1: TQRExpr;
    qrlFecha: TQRLabel;
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirVencimientosImpuestos(FVencimiento: TDateTime);

var
  qrImpuestosVencimientos: TqrImpuestosVencimientos;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, General, Numeros,
  unVisualizador, unSesion, DateTimeFuncs, unArt;

{$R *.DFM}

procedure DoImprimirVencimientosImpuestos(FVencimiento: TDateTime);
var
  rpt: TqrImpuestosVencimientos;
  i: Integer;
  dPrimDomingo: TDateTime;
  sFecha: String;
begin
  rpt := TqrImpuestosVencimientos.Create(nil);

  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      sdqDatos.ParamByName('FVencimiento').AsDateTime := FVencimiento;
      OpenQuery(sdqDatos);

      if sdqDatos.Eof then
        MsgBox('Vencimientos: no se han encontrado registros.', MB_OK + MB_ICONERROR)
      else
        begin
          dPrimDomingo     := FirstDayOfWeek(FVencimiento);
          qrlFecha.Caption := 'SEMANA DEL: ' + DateToStr(dPrimDomingo+1) + ' AL ' + DateToStr(dPrimDomingo+7);

          for i := 1 to 7 do
            begin
              sFecha := DateToStr(dPrimDomingo + i);

              case i of
                1: qrlLun.Caption := 'Lunes' + CRLF + sFecha;
                2: qrlMar.Caption := 'Martes' + CRLF + sFecha;
                3: qrlMie.Caption := 'Miércoles' + CRLF + sFecha;
                4: qrlJue.Caption := 'Jueves' + CRLF + sFecha;
                5: qrlVie.Caption := 'Viernes' + CRLF + sFecha;
                6: qrlSab.Caption := 'Sábado' + CRLF + sFecha;
                7: qrlDom.Caption := 'Domingo' + CRLF + sFecha;
              end;
            end;

          Visualizar(rpt, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
        end;
    finally
      Free;
    end;
end;

procedure TqrImpuestosVencimientos.qrlUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

procedure TqrImpuestosVencimientos.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
