unit unRptCitacionPresidencia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, General, undmprincipal,
  unSesion, unVisualizador;

type
  TqrCitacionPresidencia = class(TQuickRep)
    QRBand1: TQRBand;
    qrlLugarYFecha: TQRLabel;
    qriLogoART: TQRImage;
    QRMemo1: TQRMemo;
    QRMText: TQRMemo;
    qrmFirma: TQRMemo;
    procedure Imprimir(idevento: integer; firmante: string);
    function LugarImpresion :String;
  private

  public

  end;

var
  qrCitacionPresidencia: TqrCitacionPresidencia;

implementation


{$R *.DFM}


procedure TqrCitacionPresidencia.Imprimir(idevento: integer; firmante: string);
var ssql: string;
begin
  ssql := ' SELECT ev_fecha, ev_hora, ui_descripcion, ' +
                 ' art.utiles.armar_siniestro (ev_siniestro, ev_orden, ev_recaida) siniestro' +
            ' FROM art.sev_eventosdetramite, SIN.sui_ubicacionincapacidad ' +
           ' WHERE ev_evento > 0 AND ev_codubic = ui_codigo AND ui_fechabaja IS NULL ' +
             ' AND ev_idevento = :idevento ';

  qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_COLOR');
  qrlLugarYFecha.Caption := LugarImpresion + ', ' + DateFormat(Date, 'd ''de'' MMMM ''de'' yyyy');
  with GetQueryEx(ssql, [idevento]) do
  begin
    QRMText.Lines.Text := StringReplace(QRMText.Lines.Text, 'FEC_CITA', fieldbyname('ev_fecha').AsString, []);
    QRMText.Lines.Text := StringReplace(QRMText.Lines.Text, 'HORA_CITA', fieldbyname('ev_hora').AsString, []);
    QRMText.Lines.Text := StringReplace(QRMText.Lines.Text, 'LUG_CITA', fieldbyname('ui_descripcion').AsString, []);
    QRMText.Lines.Text := StringReplace(QRMText.Lines.Text, 'SINIESTRO', fieldbyname('siniestro').AsString, []);
  end;

  sSql := ' SELECT FI_FIRMANTE, FI_MATRICULA ' +
            ' FROM COMUNES.CFI_FIRMA ' +
           ' WHERE FI_ID = :idfirmante ';
  with GetQueryEx(ssql, [firmante]) do
  begin
    qrmFirma.Lines.Clear;
    qrmFirma.Lines.Add(fieldbyname('fi_firmante').AsString);
    qrmFirma.Lines.Add(fieldbyname('fi_matricula').AsString);
  end;
  Visualizar(self, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;

function TqrCitacionPresidencia.LugarImpresion :String;
begin
  Result := ValorSqlEx('SELECT IIF_CHAR(lg_localidad, :V1, INITCAP(:V2), INITCAP(lg_localidad))' +
                          ' FROM dlg_delegaciones, usc_sectores, use_usuarios' +
                         ' WHERE se_sector = sc_codigo' +
                           ' AND lg_codigo = sc_delegacion' +
                           ' AND se_usuario = :Usuario', ['CAPITAL FEDERAL', 'BUENOS AIRES', Sesion.UserID]);
end;

end.

