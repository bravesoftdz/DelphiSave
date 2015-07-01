unit UnRptEventosRecupero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, SDEngine, ExtCtrls;

type
  TfrmRptEventosRecupero = class(TForm)
    rptEventosRecupero: TQuickRep;
    sdqReporteDET: TSDQuery;
    qrbTitulo: TQRBand;
    qrbDetalle: TQRBand;
    sdqReporteCAB: TSDQuery;
    qrdSiniestro: TQRDBText;
    qrdOrden: TQRDBText;
    qrdCuit: TQRDBText;
    qrdEmpresa: TQRDBText;
    qrdCuil: TQRDBText;
    qrdTrabajador: TQRDBText;
    qrdFechaAccidente: TQRDBText;
    qrdTipoAccidente: TQRDBText;
    qrdAccidenteTransito: TQRDBText;
    qrdCaudaFin: TQRDBText;
    qrdILT: TQRDBText;
    qrdILP: TQRDBText;
    qrdMortales: TQRDBText;
    qrdOtros: TQRDBText;
    qrdPrestMedicos: TQRDBText;
    qrdDescripcion: TQRDBText;
    qrdNroEvento: TQRDBText;
    qrdCodigo: TQRDBText;
    qrdDecripcionEvento: TQRDBText;
    qrdFechaEvento: TQRDBText;
    qrdObservaciones: TQRDBText;
    qrlSiniestro: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
  private
  public
  end;

var
  frmRptEventosRecupero: TfrmRptEventosRecupero;

implementation

{$R *.DFM}

end.


