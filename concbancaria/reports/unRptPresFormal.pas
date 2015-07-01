unit unRptPresFormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Db, SDEngine, Qrctrls;

type
  TfrmRptPresFormal = class(TForm)
    qrpSaldos: TQuickRep;
    QRBDatos: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    sdqANEXOS: TSDQuery;
    QRLDebitoNoCont: TQRLabel;
    QRComposite: TQRCompositeReport;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLFechaConciliacion: TQRLabel;
    QRLNroCuenta: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLImpANEXO_I: TQRLabel;
    QRLImpANEXO_II: TQRLabel;
    QRLImpANEXO_III: TQRLabel;
    QRLImpTotalEmiNoEmNoTeso: TQRLabel;
    QRLabel2: TQRLabel;
    QRLImpANEXO_IV: TQRLabel;
    QRShape1: TQRShape;
    QRShape7: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape2: TQRShape;
    qrpANEXOS: TQuickRep;
    QRBDatosAnexos: TQRBand;
    QRDBExtracto: TQRDBText;
    QRGroupANEXOS: TQRGroup;
    QRDBClering: TQRDBText;
    QRDBTipo: TQRDBText;
    QRDBCheque: TQRDBText;
    QRDBop: TQRDBText;
    QRDBDetalle: TQRDBText;
    QRDBImporte: TQRDBText;
    QRBTotalxAnexo: TQRBand;
    QRLabel17: TQRLabel;
    QRShapeLinea: TQRShape;
    QRExprImporte: TQRExpr;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel16: TQRLabel;
    QRLFechaConciliacionANEXO: TQRLabel;
    QRLNroCuentaANEXO: TQRLabel;
    QRDB_ANEXO: TQRDBText;
    QRLFechaExtracto: TQRLabel;
    QRLExtracto: TQRLabel;
    QRLTipo: TQRLabel;
    QRLClearing: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText2: TQRDBText;
    QRLImpSaldoContable: TQRLabel;
    QRLImpSaldoCierre: TQRLabel;
    QRLImpControl: TQRLabel;
    QRLabel28: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel29: TQRLabel;
    QRDBTFechaEntrega: TQRDBText;
    QRLFechaEntrega: TQRLabel;
    QRLContable: TQRLabel;
    QRLEntrega: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel18: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel19: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel12: TQRLabel;
    QRLImpTotalEmiNoEmTeso: TQRLabel;
    qriLogo: TQRImage;
    qriLogoAnexo: TQRImage;
    QRLabel15: TQRLabel;
    QRLImpTotalEmiNoEmi: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure QRCompositeAddReports(Sender: TObject);
    procedure QRBTotalxAnexoAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBDatosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRExprImportePrint(sender: TObject; var Value: String);
    procedure QRDBImportePrint(sender: TObject; var Value: String);
    procedure QRLImpSaldoContablePrint(sender: TObject; var Value: String);
    procedure QRLImpANEXO_IPrint(sender: TObject; var Value: String);
    procedure QRLImpANEXO_IIPrint(sender: TObject; var Value: String);
    procedure QRLImpANEXO_IIIPrint(sender: TObject; var Value: String);
    procedure QRLImpANEXO_IVPrint(sender: TObject; var Value: String);
    procedure QRLImpSaldoCierrePrint(sender: TObject; var Value: String);
    procedure QRLImpControlPrint(sender: TObject; var Value: String);
    procedure QRLImpTotalEmiNoEmNoTesoPrint(sender: TObject; var Value: String);
    procedure QRLImpTotalEmiNoEmiPrint(sender: TObject; var Value: String);
  private
  public
  end;

var
  frmRptPresFormal: TfrmRptPresFormal;

implementation

uses
  unDmPrincipal, StrFuncs;

{$R *.DFM}

procedure TfrmRptPresFormal.FormCreate(Sender: TObject);
begin
  // toma el bmp del Logo que es un recurso y lo incorpora al picture
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO');
  qriLogoAnexo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TfrmRptPresFormal.QRCompositeAddReports(Sender: TObject);
begin
  QRComposite.Reports.Add( qrpSaldos );
  QRComposite.Reports.Add( qrpAnexos );
end;

procedure TfrmRptPresFormal.QRBTotalxAnexoAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  qrpAnexos.EndPage;
end;

procedure TfrmRptPresFormal.QRBDatosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  qrpSaldos.EndPage;
end;

procedure TfrmRptPresFormal.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  { Si los Anexos son I o II tiene que mostrar como titulo
   Fecha Extracto
   y los Anexos III o IV tienen que mostar como titulo
         Fecha
   Contable Entrega }
  if (Pos( 'ANEXO III', sdqANEXOS.FieldByName('ANEXO').asString ) > 0) OR (Pos( 'ANEXO IV', sdqANEXOS.FieldByName('ANEXO').asString ) > 0)then begin
    QRLFechaExtracto.Enabled := False;
    QRLExtracto.Enabled      := False;
    QRLFechaEntrega.Enabled  := True;
    QRLEntrega.Enabled       := True;
    QRLContable.Enabled      := True;
  end else begin
    QRLFechaExtracto.Enabled := True;
    QRLExtracto.Enabled      := True;
    QRLFechaEntrega.Enabled  := False;
    QRLEntrega.Enabled       := False;
    QRLContable.Enabled      := False;
  end;
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRExprImportePrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRDBImportePrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpSaldoContablePrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpANEXO_IPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpANEXO_IIPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpANEXO_IIIPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpANEXO_IVPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpSaldoCierrePrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpControlPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpTotalEmiNoEmNoTesoPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptPresFormal.QRLImpTotalEmiNoEmiPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;
{---------------------------------------------------------------------------------------------------------------------}
end.

