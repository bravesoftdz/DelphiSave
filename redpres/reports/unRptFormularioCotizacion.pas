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
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrdbMonto_CotizadoPrint(sender: TObject; var Value: String);
  private

  public
    EsFechaAnterior, EsSinGobernacion: Boolean;
    iIdEvento: Integer
  end;

implementation

uses unPrincipal, AnsiSql, unDmPrincipal, uncomunes;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TrptFormularioCotizacion.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  sSql, sEvento: String;
  dPorcentaje: Double;
begin
  if EsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART_GOB');
    qrlNomResponsable.Caption := ART_NOMBRE + ' ' + ART_ADMIN;
    QRMemo1.Lines.Clear;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance,'LOGO_PART');
    qrlNomResponsable.Caption := ART_NOMBRE;
  end;

  if EsFechaAnterior then
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

  sSql := 'SELECT liq.get_fechaedadincapacidad(' + SqlInt(sdqDatos.ParamByName('pSiniestro').AsInteger) + ', ' +
                                                   SqlInt(sdqDatos.ParamByName('pOrden').AsInteger) + ', ' +
                                                   SqlValue(sEvento) + ', ' +
                                                   SqlNumber(dPorcentaje) + ') ' +
           ' FROM DUAL';

  qrlFecha_ILPPD.Caption := ValorSql(sSql);
  qrlPorc_ILPPD.Caption  := FloatToStr(dPorcentaje);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptFormularioCotizacion.qrdbMonto_CotizadoPrint(sender: TObject; var Value: String);
begin
  Value := '$ ' + trim( format( '%12.2f', [sdqDatos.FieldByName('MONTO_COTIZADO').AsFloat] ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

