unit unRptSolicitud;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TRptSolicitud = class(TQuickRep)
    sdqReporte: TSDQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrdNroFormulario: TQRDBText;
    QRLabel2: TQRLabel;
    qrdFecha: TQRDBText;
    QRLabel3: TQRLabel;
    qrdOrigen: TQRDBText;
    qrlfRecepcion: TQRLabel;
    qrdFReceptcion: TQRDBText;
    qrlEntidad: TQRLabel;
    qrdEntidad: TQRDBText;
    qrlVendedor: TQRLabel;
    qrdVendedor: TQRDBText;
    qrlRazonSocial: TQRLabel;
    qrdRazonSocial: TQRDBText;
    qrlFormaJuridica: TQRLabel;
    qrdFormaJuridica: TQRDBText;
    qrlCUIT: TQRLabel;
    qrdCUIT: TQRDBText;
    qrlMotivoAlta: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    qrdARTAnt: TQRDBText;
    qrlFinicioAct: TQRLabel;
    qrdFIniAct: TQRDBText;
    qrlSector: TQRLabel;
    qrdSector: TQRDBText;
    qrdSUSS: TQRDBText;
    qrlSUSS: TQRLabel;
    qrlHolding: TQRLabel;
    qrdHolding: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    qrEmpleados: TQRDBText;
    QRShape1: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText26: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRShape4: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRShape5: TQRShape;
    QRLabel53: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText47: TQRDBText;
    QRShape6: TQRShape;
    QRDBText48: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    procedure qrEmpleadosPrint(Sender: TObject; var Value: String);
  private
  public
  end;

var
  RptSolicitud: TRptSolicitud;

implementation

uses
  StrFuncs;

{$R *.DFM}

procedure TRptSolicitud.qrEmpleadosPrint(Sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := IntToStr(Round(StrToFloatDef(Value, 0)));    //Trunca los decimales
end;

end.
