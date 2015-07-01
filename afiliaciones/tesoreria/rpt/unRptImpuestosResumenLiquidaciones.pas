unit unRptImpuestosResumenLiquidaciones;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrImpuestosResumenLiquidaciones = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qriLogo: TQRImage;
    QRBand1: TQRBand;
    qrlUsuario: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    qrbGroupFooter: TQRBand;
    sdqDatos: TSDQuery;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    qrlFecha: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirResLiquidacionesImpuestos(FAprobado: TDateTime);

var
  qrImpuestosResumenLiquidaciones: TqrImpuestosResumenLiquidaciones;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, General, Numeros,
  unVisualizador, unSesion;

{$R *.DFM}

procedure DoImprimirResLiquidacionesImpuestos(FAprobado: TDateTime);
var
  rpt: TqrImpuestosResumenLiquidaciones;
begin
  rpt := TqrImpuestosResumenLiquidaciones.Create(nil);

  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
      qrlFecha.Caption := 'LIQUIDACIONES APROBADAS EL: ' + DateToStr(FAprobado);

      sdqDatos.ParamByName('FAprobado').AsDateTime := FAprobado;
      OpenQuery(sdqDatos);

      if sdqDatos.Eof then
        MsgBox('Resumen de Liquidaciones: no se han encontrado registros.', MB_OK + MB_ICONERROR)
      else
        Visualizar(rpt, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    finally
      Free;
    end;
end;

procedure TqrImpuestosResumenLiquidaciones.qrlUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

procedure TqrImpuestosResumenLiquidaciones.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.

