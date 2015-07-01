unit unRptSolicitudAsistencia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSolicitudAsistencia = class(TQuickRep)
    sdqDatos: TSDQuery;
    qrbFormulario: TQRBand;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape194: TQRShape;
    QRShape193: TQRShape;
    QRLabel108: TQRLabel;
    qrdbCA_CALLE: TQRDBText;
    QRShape20: TQRShape;
    QRLabel10: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    qrdbCA_LOCALIDAD: TQRDBText;
    QRLabel11: TQRLabel;
    qrdbCA_CODPOSTAL: TQRDBText;
    QRLabel12: TQRLabel;
    qrdbCA_DEPARTAMENTO: TQRDBText;
    QRLabel13: TQRLabel;
    qrdbCA_PISOCALLE: TQRDBText;
    QRLabel106: TQRLabel;
    qrdbCA_NUMERO: TQRDBText;
    QRLabel107: TQRLabel;
    QRLabel109: TQRLabel;
    QRShape195: TQRShape;
    qrdbPROVINCIAPREST: TQRDBText;
    QRShape196: TQRShape;
    QRLabel110: TQRLabel;
    QRShape197: TQRShape;
    qrdbCA_TELEFONO: TQRDBText;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRShape69: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape30: TQRShape;
    QRLabel16: TQRLabel;
    QRShape37: TQRShape;
    QRLabel20: TQRLabel;
    QRShape38: TQRShape;
    qrdbTD_CUIL: TQRDBText;
    QRShape39: TQRShape;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    qrdbJW_NOMBRE: TQRDBText;
    QRShape31: TQRShape;
    QRLabel17: TQRLabel;
    QRShape32: TQRShape;
    qrdbTD_DNI: TQRDBText;
    QRShape33: TQRShape;
    QRLabel18: TQRLabel;
    QRShape34: TQRShape;
    qrdbTD_LC: TQRDBText;
    QRShape35: TQRShape;
    QRLabel19: TQRLabel;
    QRShape36: TQRShape;
    qrdbTD_LE: TQRDBText;
    QRShape41: TQRShape;
    QRLabel22: TQRLabel;
    QRShape42: TQRShape;
    qrdbTD_CI: TQRDBText;
    QRShape43: TQRShape;
    QRLabel23: TQRLabel;
    QRShape44: TQRShape;
    qrdbTD_PAS: TQRDBText;
    QRShape45: TQRShape;
    QRLabel24: TQRLabel;
    QRShape46: TQRShape;
    qrdbJW_DOCUMENTO: TQRDBText;
    QRShape51: TQRShape;
    QRLabel27: TQRLabel;
    QRShape52: TQRShape;
    qrdbJW_FEC_NACIMIENTO: TQRDBText;
    QRLabel39: TQRLabel;
    QRShape73: TQRShape;
    qrdbPROVINCIATRAB: TQRDBText;
    qrdbJW_NUMERO: TQRDBText;
    QRLabel33: TQRLabel;
    QRShape61: TQRShape;
    qrdbJW_CALLE: TQRDBText;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel14: TQRLabel;
    qrdbCA_CLAVE: TQRDBText;
    qrdbCA_DESCRIPCION: TQRDBText;
    QRLabel15: TQRLabel;
    qrdbJW_TELEFONO: TQRDBText;
    QRShape215: TQRShape;
    QRLabel121: TQRLabel;
    QRShape217: TQRShape;
    qrdbMP_NOMBRE: TQRDBText;
    QRLabel67: TQRLabel;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape115: TQRShape;
    QRLabel68: TQRLabel;
    QRShape116: TQRShape;
    QRDBText1: TQRDBText;
    QRShape117: TQRShape;
    QRLabel69: TQRLabel;
    QRShape118: TQRShape;
    QRDBText2: TQRDBText;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape17: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape18: TQRShape;
    QRShape47: TQRShape;
    QRLabel38: TQRLabel;
    QRShape48: TQRShape;
    QRDBText10: TQRDBText;
    QRShape49: TQRShape;
    QRLabel40: TQRLabel;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel35: TQRLabel;
    QRShape56: TQRShape;
    QRDBText11: TQRDBText;
    QRShape57: TQRShape;
    QRLabel36: TQRLabel;
    QRShape58: TQRShape;
    QRDBText12: TQRDBText;
    QRShape59: TQRShape;
    QRLabel43: TQRLabel;
    QRShape62: TQRShape;
    QRDBText13: TQRDBText;
    QRShape63: TQRShape;
    QRLabel44: TQRLabel;
    QRShape64: TQRShape;
    QRDBText14: TQRDBText;
    QRLabel45: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRLabel46: TQRLabel;
    QRShape67: TQRShape;
    QRDBText15: TQRDBText;
    QRShape70: TQRShape;
    QRLabel47: TQRLabel;
    QRShape71: TQRShape;
    QRDBText16: TQRDBText;
    QRShape74: TQRShape;
    QRLabel48: TQRLabel;
    QRShape75: TQRShape;
    QRDBText17: TQRDBText;
    QRShape76: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape12: TQRShape;
    QRShape60: TQRShape;
    QRDBText18: TQRDBText;
    dsDatos: TDataSource;
    QRShape77: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape78: TQRShape;
  private

  public

  end;

  { Crea e imprime el reporte TRptSolicitudAsistencia }
  procedure ImprimirSolicitudAsistencia(IdTransaccion: Integer; iIdExpediente: Integer = 0);

implementation

uses unDmPrincipal, unComunes;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure ImprimirSolicitudAsistencia(IdTransaccion: Integer; iIdExpediente: Integer = 0);
begin
  with TrptSolicitudAsistencia.Create(Application) do
    try
      if Is_SiniestroDeGobernacion(iIdExpediente) then
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
      else
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

      sdqDatos.ParamByName('pTransaccion').AsInteger := IdTransaccion;
      OpenQuery(sdqDatos);
      Print;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
end.

