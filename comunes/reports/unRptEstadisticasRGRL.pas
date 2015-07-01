unit unRptEstadisticasRGRL;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine,
  qrpctrls;

type
  TqrEstadisticasRGRL = class(TQuickRep)
    bPrincipal: TQRBand;
    imgLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    lbUsuario: TQRLabel;
    lbFechaDesde: TQRLabel;
    lbFechaHasta: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    sdqData: TSDQuery;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRShape3: TQRShape;
    QRPExpr1: TQRPExpr;
    sdqDataRF_CANT_ANEXO: TFloatField;
    sdqDataCO_VIGENCIAHASTA: TDateTimeField;
    sdqDataCUIT: TStringField;
    sdqDataEM_NOMBRE: TStringField;
    sdqDataRF_FECHA: TDateTimeField;
    sdqDataRF_RECTIFICA_DATOS: TStringField;
    sdqDataRF_USUALTA: TStringField;
    QRLabel7: TQRLabel;
  private
  public
    procedure Preparar(const aContrato: Integer; const aUsuario: String; const aFechaDesde, aFechaHasta: TDateTime);
  end;

var
  qrEstadisticasRGRL: TqrEstadisticasRGRL;

implementation

uses
  unVisualizador, unSesion, General, unDmPrincipal, AnsiSql;

{$R *.DFM}

procedure TqrEstadisticasRGRL.Preparar(const aContrato: Integer; const aUsuario: String; const aFechaDesde, aFechaHasta: TDateTime);
begin
  try
    imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  except
    // Si no existe no muestro nada..
  end;

  lbUsuario.Caption := IIF((aUsuario = ''), '  -', ValorSql('SELECT se_nombre FROM use_usuarios WHERE se_usuario = ' + SqlValue(aUsuario)));
  lbFechaDesde.Caption := IIF((aFechaDesde = 0), '  -', FormatDateTime('dd/mm/yyyy', aFechaDesde));
  lbFechaHasta.Caption := IIF((aFechaHasta > (DBDateTime + 100)), '  -', FormatDateTime('dd/mm/yyyy', aFechaHasta));

  with sdqData do
  begin
    Close;
    ParamByName('contrato').AsInteger     := aContrato;
    ParamByName('usualta').AsString      := aUsuario;
    ParamByName('fechadesde').AsDateTime := aFechaDesde;
    ParamByName('fechahasta').AsDateTime := aFechaHasta;
    Open;
  end;

  Visualizar(Self, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
end;

end.
