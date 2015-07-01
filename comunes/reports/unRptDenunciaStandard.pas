unit unRptDenunciaStandard;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptDenunciaStandard = class(TQuickRep)
    sdqDatos: TSDQuery;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand4: TQRBand;
    QRShape19: TQRShape;
    qrsTipoSini: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape9: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape10: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel44: TQRLabel;
    qrdbTrabSexo: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape11: TQRShape;
    QRLabel50: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText44: TQRDBText;
    QRShape12: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape14: TQRShape;
    qrlTipoAccTrab: TQRLabel;
    qrlTipoInItinere: TQRLabel;
    QRLabel68: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText52: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel78: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel82: TQRLabel;
    QRBand5: TQRBand;
    QRLabel74: TQRLabel;
    QRDBText57: TQRDBText;
    QRShape15: TQRShape;
    QRLabel76: TQRLabel;
    QRShape16: TQRShape;
    QRLabel77: TQRLabel;
    QRShape17: TQRShape;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRShape18: TQRShape;
    qrlTipoEP: TQRLabel;
    qriLogo: TQRImage;
    qrlObservaciones: TQRLabel;
    qrlInternadoDesde: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FIdExpediente: Integer;
    FNroParte: Integer;
  public
    property IdExpediente: Integer read FIdExpediente write FIdExpediente;
    property NroParte: Integer read FNroParte write FNroParte default 0;
  end;

var
  rptDenunciaStandard: TrptDenunciaStandard;

implementation

uses unComunes, unDmPrincipal;

{$R *.DFM}

{---------------------------------------------------------------------------------}
procedure TrptDenunciaStandard.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if sdqDatos.FieldByName('EX_TIPO').AsString = '1' then
   begin
    qrsTipoSini.left            := 226;
    qrlTipoAccTrab.Font.Color   := clBlack;
    qrlTipoInItinere.Font.Color := clWhite;
    qrlTipoEP.Font.Color        := clWhite;
   end else if sdqDatos.FieldByName('EX_TIPO').AsString = '2' then
   begin
    qrsTipoSini.left            := 395;
    qrlTipoAccTrab.Font.Color   := clWhite;
    qrlTipoInItinere.Font.Color := clBlack;
    qrlTipoEP.Font.Color        := clWhite;
   end else if sdqDatos.FieldByName('EX_TIPO').AsString = '3' then
   begin
    qrsTipoSini.left            := 564;
    qrlTipoAccTrab.Font.Color   := clWhite;
    qrlTipoInItinere.Font.Color := clWhite;
    qrlTipoEP.Font.Color        := clBlack;
   end;
end;
{---------------------------------------------------------------------------------}
procedure TrptDenunciaStandard.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  sSql, sSqlParte: String;
  iNroparte: integer;
begin

  sSql := ' SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' ex_siniestro, tj_nombre, ex_cuil, tj_fnacimiento, tj_sexo, ' +
                 ' art.trabajador.get_telefono(tj_id, 5) Telefono, ' +
                 ' tj_cpostal, tj_localidad, ' +
                 ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) dom_traba, ' +
                 ' b.pv_descripcion prov_traba, ex_cuit, em_nombre, ca_descripcion presta, ' +
                 ' ca_clave cuitpresta, ca_domicilio, ca_codarea || '' '' || ca_telefono ca_telefono, ca_codpostal, ca_localidad, ' +
                 ' c.pv_descripcion prov_presta, ex_tipo, ' +
                 ' utiles.armar_domicilio(ub_calle, ub_numero, ub_piso, ub_departamento) dom_denu, ' +
                 ' ub_telefonos, ub_cpostal, ub_localidad, d.pv_descripcion prov_denun, ex_brevedescripcion, ' +
                 ' nvl(ex_fecharecaida, ex_fechaaccidente) oportunidad, ex_horaaccidente, ' +
                 ' ex_diagnostico DIAGNOSTICO, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI:SS'') FECHA ' +
            ' FROM sex_expedientes, ctj_trabajador, cpv_provincias b, cpv_provincias c, ' +
                 ' cpv_provincias d, aem_empresa, cpr_prestador, sub_ubicaciones ' +
           ' WHERE tj_id = ex_idtrabajador ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND ca_identificador = ex_prestador ' +
             ' AND ex_id = ub_idexpediente(+) ' +
             ' AND tj_provincia = b.pv_codigo(+) ' +
             ' AND ca_provincia = c.pv_codigo(+) ' +
             ' AND ub_provincia = d.pv_codigo(+) ' +
             ' AND ex_id = :IdExpediente ';

  iNroparte := FNroParte;
  if (FNroParte = 0) then        // esto es que si se viene de pantalla de siniestros toma el maximo parte, sino si viene de parteEvolutivo toma el seleccionado.
    iNroparte := ValorSqlIntegerEx('SELECT MAX(pv_nroparte) FROM spv_parteevolutivo ' +
                                   ' WHERE pv_idexpediente = :idExpe ', [FIdExpediente]);


  sSqlParte := ' SELECT pv_observaciones, pv_sitiointernacion uco_uti, pv_internadodesde ' +
                 ' FROM spv_parteevolutivo ' +
                ' WHERE pv_idexpediente = :idExp ' +
                  ' AND pv_nroparte = :NroParte ';
  with GetQueryEx(sSqlParte, [FIdExpediente, iNroparte]) do
    try
      qrlObservaciones.Caption  := FieldByName('PV_OBSERVACIONES').AsString;
      qrlInternadoDesde.Caption := FieldByName('PV_INTERNADODESDE').AsString;
    finally
      Free;
    end;

  sdqDatos.Close;
  sdqDatos.SQL.Text                              := sSql;
  sdqDatos.ParamByName('IdExpediente').AsInteger := FIdExpediente;
  sdqDatos.Open;

  if Is_SiniestroDeGobernacion(FIdExpediente) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');

end;
{---------------------------------------------------------------------------------}
end.
