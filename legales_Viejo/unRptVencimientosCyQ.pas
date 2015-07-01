unit unRptVencimientosCyQ;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptVencimiento = class(TQuickRep)
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    QRBand1: TQRBand;
    qrbDetalle: TQRBand;
    qrdNombre: TQRDBText;
    qrdNroOrden: TQRDBText;
    qrdCuit: TQRDBText;
    qrdContrato: TQRDBText;
    qrdNroPago: TQRDBText;
    qrdFechaPago: TQRDBText;
    qrdFechaVto: TQRDBText;
    qrdMonto: TQRDBText;
    qrlTitulo: TQRLabel;
    qrlNroOrden: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
  private

  public

  end;

var
  rptVencimiento: TrptVencimiento;

implementation

{$R *.DFM}

end.
