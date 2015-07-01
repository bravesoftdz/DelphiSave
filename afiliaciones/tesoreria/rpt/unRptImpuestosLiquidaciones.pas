unit unRptImpuestosLiquidaciones;

interface

uses                  
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrImpuestosLiquidaciones = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qriLogo: TQRImage;
    QRBand1: TQRBand;
    qrlUsuario: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    qrgGroupHeader: TQRGroup;
    qrbGroupFooter: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    sdqDatos: TSDQuery;
    ChildBand1: TQRChildBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
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
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape1: TQRShape;
    procedure qrlUsuarioPrint(sender: TObject; var Value: String);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirDetLiquidacionesImpuestos(FAprobado: TDateTime);

var
  qrImpuestosLiquidaciones: TqrImpuestosLiquidaciones;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unComunes, StrFuncs, General, Numeros,
  unVisualizador, unSesion;

{$R *.DFM}

procedure DoImprimirDetLiquidacionesImpuestos(FAprobado: TDateTime);
var
  rpt: TqrImpuestosLiquidaciones;
begin
  rpt := TqrImpuestosLiquidaciones.Create(nil);

  with rpt do
    try
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      sdqDatos.ParamByName('FAprobado').AsDateTime := FAprobado;
      OpenQuery(sdqDatos);

      if sdqDatos.Eof then
        MsgBox('Detalle de Liquidaciones: no se han encontrado registros.', MB_OK + MB_ICONERROR)
      else
        Visualizar(rpt, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    finally
      Free;
    end;
end;

procedure TqrImpuestosLiquidaciones.qrlUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

procedure TqrImpuestosLiquidaciones.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.

