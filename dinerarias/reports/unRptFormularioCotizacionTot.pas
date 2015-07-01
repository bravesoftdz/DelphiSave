unit unRptFormularioCotizacionTot;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptFormularioCotizacionTot = class(TQuickRep)
    TitleBand1: TQRBand;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    qrlSolCotizacion: TQRLabel;
    qrlFechaEmision: TQRLabel;
    qrlResponsable: TQRLabel;
    qrlDatosAseg: TQRLabel;
    qrlNombre: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlFechaNac: TQRLabel;
    qrlCuilCuit: TQRLabel;
    qrlSexo: TQRLabel;
    qrlDocumento: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlTexto2: TQRLabel;
    qrlTexto3: TQRLabel;
    qrlP1: TQRLabel;
    qrlFirma1: TQRLabel;
    QRShape3: TQRShape;
    qrlSiniestro: TQRLabel;
    qrlNomResponsable: TQRLabel;
    qrdbFechaEmision: TQRDBText;
    qrdbNombre: TQRDBText;
    qrdbDomicilio: TQRDBText;
    qrdbFechaNac: TQRDBText;
    qrdbCuilCuit: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbDocumento: TQRDBText;
    qrdbSiniestro: TQRDBText;
    qrdbMonto_Cotizado: TQRLabel;
    qrlLey2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlGranSi: TQRLabel;
    qrlGranNo: TQRLabel;
    qriLogo: TQRImage;
    QRBand1: TQRBand;
    qrlTitAsegurado: TQRLabel;
    qrlTexto4: TQRLabel;
    qrlBeneficiario: TQRLabel;
    qrlFirma2: TQRLabel;
    qrlP2: TQRLabel;
    qrlLugarYFecha: TQRLabel;
    qriLogo2: TQRImage;
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
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape4: TQRShape;
  private

  public
    procedure Preparar(iIdEvento, iIdexpediente :Integer; bEsFechaAnterior: Boolean; dMonto: Double);
  end;

implementation

uses unPrincipal, AnsiSql, unDmPrincipal, uncomunes, unVisualizador, General;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TrptFormularioCotizacionTot.Preparar(iIdEvento, iIdexpediente :Integer;
                                               bEsFechaAnterior: Boolean; dMonto: Double);
var
  sGran: String;
begin
  if Is_SiniestroDeGobernacion(iIdexpediente) then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB');
    qriLogo2.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB');
    qrlNomResponsable.Caption := ART_NOMBRE + ' ' + ART_ADMIN;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART');
    qriLogo2.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART');
    qrlNomResponsable.Caption := ART_NOMBRE;
  end;

  if bEsFechaAnterior then
  begin
    qrlDatosAseg.Caption        := 'DATOS DEL ASEGURABLE';
    qrlTitAsegurado.Caption     := 'PARA SER COMPLETADO POR EL ASEGURABLE';
  end
  else begin
    qrlDatosAseg.Caption        := 'DATOS DEL ASEGURADO';
    qrlTitAsegurado.Caption     := 'PARA SER COMPLETADO POR EL ASEGURADO';
  end;

  sdqDatos.Close;
  sdqDatos.ParamByName('idexped').AsInteger := iIdExpediente;
  sdqDatos.Open;

  sGran := ValorSqlEx('SELECT ev_graninc' +
                       ' FROM sev_eventosdetramite ' +
                      ' WHERE ev_idevento = :IdEv ', [iIdEvento]);
  qrlGranSi.Caption := IIF(sGran = 'S', 'X', '');
  qrlGranNo.Caption := IIF(sGran = 'N', 'X', '');

  QRLabel19.Caption := '';
  QRLabel20.Caption := '';
  QRLabel13.Caption := '';
  QRLabel14.Caption := '';
  QRLabel27.Caption := '';
  QRLabel28.Caption := '';

  qrdbMonto_Cotizado.Caption := '$ ' + Trim(Format('%12.2f', [dMonto]));

  try
    Visualizar(Self, GetValores('', ''), [oMailNotAllowed, oForceShowModal, oAlwaysShowDialog]);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
end.

