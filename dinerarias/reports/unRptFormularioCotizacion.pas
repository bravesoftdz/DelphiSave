unit unRptFormularioCotizacion;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptFormularioCotizacion = class(TQuickRep)
    TitleBand1: TQRBand;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    qrlSolCotizacion: TQRLabel;
    qrlFechaEmision: TQRLabel;
    qrlResponsable: TQRLabel;
    qrlFechaILPPD: TQRLabel;
    qrlPorcILPPD: TQRLabel;
    qrlDatosAseg: TQRLabel;
    qrlNombre: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlFechaNac: TQRLabel;
    qrlCuilCuit: TQRLabel;
    qrlSexo: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlLey1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlTexto2: TQRLabel;
    qrlTexto3: TQRLabel;
    qrlP1: TQRLabel;
    qrlFirma1: TQRLabel;
    qrlTitAsegurado: TQRLabel;
    QRShape3: TQRShape;
    qrlSiniestro: TQRLabel;
    qrlTexto4: TQRLabel;
    qrlP2: TQRLabel;
    qrlFirma2: TQRLabel;
    qrlLugarYFecha: TQRLabel;
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
    qrlFecha_ILPPD: TQRLabel;
    qrlPorc_ILPPD: TQRLabel;
    QRMemo1: TQRMemo;
    qrlEdadEstimada: TQRLabel;
    qrlFechaEstimada: TQRLabel;
    QRDBEdadEstimada: TQRDBText;
    QRDBFechaEstimada: TQRDBText;
    qrlLey2: TQRLabel;
    qrlDeclaracion: TQRLabel;
    qriLogo: TQRImage;
  private

  public
    procedure Preparar(iIdEvento, iSiniestro, iOrden, iRecaida :Integer;
                       bEsFechaAnterior: Boolean; dMonto: Double);
  end;

implementation

uses unPrincipal, AnsiSql, unDmPrincipal, uncomunes, unVisualizador;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TrptFormularioCotizacion.Preparar(iIdEvento, iSiniestro, iOrden, iRecaida :Integer;
                                            bEsFechaAnterior: Boolean; dMonto: Double);
var
  sSql, sEvento: String;
  dPorcentaje: Double;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  if Is_SiniestroDeGobernacion(iIdExped) then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB');
    qrlNomResponsable.Caption := ART_NOMBRE + ' ' + ART_ADMIN;
    QRMemo1.Lines.Clear;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART');
    qrlNomResponsable.Caption := ART_NOMBRE;
  end;

  if bEsFechaAnterior then
  begin
    qrlLey1.Caption             := '';
    qrlLey1.SendToBack;
    qrlLey2.BringToFront;
    qrlDatosAseg.Caption        := 'DATOS DEL ASEGURABLE';
    qrlTitAsegurado.Caption     := 'PARA SER COMPLETADO POR EL ASEGURABLE';
    QRMemo1.Lines.Clear;
  end
  else begin
    qrlEdadEstimada.Caption     := '';
    qrlFechaEstimada.Caption    := '';
    QRDBEdadEstimada.Caption    := '';
    QRDBFechaEstimada.Caption   := '';
    qrlLey2.Caption             := '';
    qrlLey2.SendToBack;
    qrlLey1.BringToFront;
    qrlDeclaracion.Caption      := '';
    qrlDatosAseg.Caption        := 'DATOS DEL ASEGURADO';
    qrlTitAsegurado.Caption     := 'PARA SER COMPLETADO POR EL ASEGURADO';    
  end;

  sdqDatos.Close;
  sdqDatos.ParamByName('pSiniestro').AsInteger := iSiniestro;
  sdqDatos.ParamByName('pOrden').AsInteger     := iOrden;
  sdqDatos.ParamByName('pRecaida').AsInteger   := iRecaida;
  sdqDatos.Open;

  sSql := 'SELECT ev_codigo, ev_porcincapacidad ' +
           ' FROM sev_eventosdetramite ' +
          ' WHERE ev_idevento = :IdEv ';
  with GetQueryEx(sSql, [iIdEvento]) do
  try
    sEvento     := FieldByName('ev_codigo').AsString;
    dPorcentaje := FieldByName('ev_porcincapacidad').AsFloat;
  finally
    Free;
  end;

  sSql := 'SELECT liq.get_fechaedadincapacidad(' + SqlInt(iSiniestro) + ', ' + SqlInt(iOrden) + ', ' +
                                                   SqlValue(sEvento) + ', ' +  SqlNumber(dPorcentaje) + ') ' +
           ' FROM DUAL';

  qrlFecha_ILPPD.Caption     := ValorSql(sSql);
  qrlPorc_ILPPD.Caption      := FloatToStr(dPorcentaje);
  qrdbMonto_Cotizado.Caption := '$ ' + Trim(Format('%12.2f', [dMonto]));

  try
    Visualizar(Self, GetValores('', ''), [oMailNotAllowed, oForceShowModal, oAlwaysShowDialog]);
  finally
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

