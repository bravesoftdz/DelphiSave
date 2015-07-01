unit unRptRevisionMedica;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrRevisionMedica = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel61: TQRLabel;
    qrlNombreTrab: TQRLabel;
    QRLabel64: TQRLabel;
    qrlCuilTrab: TQRLabel;
    qrlDomicilioTrab: TQRLabel;
    qrlLocalidadTrab: TQRLabel;
    qrlTelTrab: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlNroSiniestro: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel6: TQRLabel;
    qrlFechaAccid: TQRLabel;
    qrlFechaAlta: TQRLabel;
    QRLabel18: TQRLabel;
    DetailBand1: TQRBand;
    dsRevMedica: TDataSource;
    sdqRevMedica: TSDQuery;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    qriLogoART: TQRImage;
    QRLabel1: TQRLabel;
    qrlTelCel: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qrlCP: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    qrlTipo: TQRLabel;
    qrlGrado: TQRLabel;
    qrlCaracter: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
  private

  public

  end;

var
  qrRevisionMedica: TqrRevisionMedica;

implementation

{$R *.DFM}

end.
