unit unQRCartaAFIP;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptCartaAFIP = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrbDetail: TQRBand;
    qrbPageFooter: TQRBand;
    QRMemo1: TQRMemo;
    qrlFecha: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemoSup: TQRMemo;
    qrbSummary: TQRBand;
    QRMemoInf: TQRMemo;
    QRMemo5: TQRMemo;
    sdqConsulta: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    qrbColumnHeader: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qriLogo: TQRImage;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure Do_ActualizarFechasImpresion(Contrato: Integer; HayPositivos: Boolean);
    function Get_Sql(Contrato: integer; HayPositivos, EsReimpresion: Boolean; GrupoImpresion: String): String;
    function Get_TextoSup(HayPositivos: Boolean): String;
    function Get_TextoInf(HayPositivos: Boolean): String;
  public
    function Preparar(Contrato: integer; HayPositivos, EsReimpresion: Boolean; GrupoImpresion: String): Boolean;
  end;

var
  rptCartaAFIP: TrptCartaAFIP;

implementation

{$R *.DFM}

uses
  unART, Dialogs, DateTimeFuncs, unDmPrincipal, unVisualizador, AnsiSql, General, unSesion,
  unCobranzas;

function TrptCartaAFIP.Preparar(Contrato: integer; HayPositivos, EsReimpresion: Boolean; GrupoImpresion: String): Boolean;
begin
  Result := False;

  qrlFecha.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo;
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  with sdqConsulta do
  begin
    SQL.Text := Get_Sql(Contrato, HayPositivos, EsReimpresion, GrupoImpresion);
    Open;

    if not IsEmpty then
    begin
      QRMemoSup.Lines.Text := Get_TextoSup(HayPositivos);
      QRMemoInf.Lines.Text := Get_TextoInf(HayPositivos);

      rptCartaAFIP.PrinterSetup;
      rptCartaAFIP.Print;

      BeginTrans;
      try
      Do_ActualizarFechasImpresion(Contrato, HayPositivos);

        First;
        while not Eof do
          begin
            Do_RedevengarConciliar(Contrato, FieldByName('RA_PERIODO').AsString, Sesion.UserID, True, False);
            Next;
          end;

        CommitTrans;
      except
        on E: Exception do
          begin
            RollBack;
            raise Exception.Create(E.Message + CRLF + 'Error al actualizar f. impresión/regenerar devengados.');
          end;
      end;

      Result := True;
    end
    else
      MessageDlg('No existen datos para la selección.', mtInformation, [mbOK], 0);
  end;
end;

procedure TrptCartaAFIP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    TFloatField(FieldByName('RA_IMPORTE')).Currency := True;
    FieldByName('RA_CUITINCORRECTO').EditMask       := EMSK_CUIT;
    FieldByName('EM_CUIT').EditMask                 := EMSK_CUIT;
  end;
end;

procedure TrptCartaAFIP.Do_ActualizarFechasImpresion(Contrato: Integer; HayPositivos: Boolean);
var
  sSql: String;
begin
  sSql := 'UPDATE ZRA_RECLAMOAFIP ' +
          '   SET RA_FECHAIMPRESION = ACTUALDATE, ' +
          '       RA_GRUPOIMPRESION = :MomentoActual ' +
          ' WHERE RA_CONTRATO = :Contrato ' +
          '   AND RA_FECHABAJA IS NULL ' +
          '   AND RA_FECHAIMPRESION IS NULL ';
  if HayPositivos then
    sSql := sSql + '   AND RA_IMPORTE>=0'
  else
    sSql := sSql + '   AND RA_IMPORTE<0';

  EjecutarSqlSTEx(sSql, [FormatDateTime('yyyymmddhhnnss', DBDateTime), Contrato]);
end;

function TrptCartaAFIP.Get_Sql(Contrato: integer; HayPositivos, EsReimpresion: Boolean; GrupoImpresion: String): String;
var
  sSql: String;
begin
  sSql := 'SELECT RA_ID, CO_CONTRATOPRINCIPAL RA_CONTRATO, RA_PERIODO, RA_FECHAPAGO, RA_CUITINCORRECTO, ' +
                 'RA_IMPUESTOINCORRECTO, RA_IMPUESTOCORRECTO, RA_PERIODOINCORRECTO, EM_CUIT, EM_NOMBRE, ';

  if HayPositivos then
    sSql := sSql + 'RA_IMPORTE '
  else
    sSql := sSql + '-RA_IMPORTE RA_IMPORTE ';

  sSql := sSql +  'FROM AEM_EMPRESA, ACO_CONTRATO_EXT, ZRA_RECLAMOAFIP ' +
                 'WHERE RA_CONTRATO = ' + SqlValue(Contrato) + ' ' +
                   'AND RA_CONTRATO = CO_CONTRATO ' +
                   'AND CO_IDEMPRESA = EM_ID ' +
                   'AND RA_FECHABAJA IS NULL ' +
                   iif(EsReimpresion, 'AND RA_GRUPOIMPRESION = ' + SqlValue(GrupoImpresion), 'AND RA_FECHAIMPRESION IS NULL') + ' ';

  if HayPositivos then
    sSql := sSql + 'AND RA_IMPORTE>0'
  else
    sSql := sSql + 'AND RA_IMPORTE<0';

  Result := sSql;
end;

function TrptCartaAFIP.Get_TextoSup(HayPositivos: Boolean): String;
var
  sTexto: String;
begin
  if HayPositivos then
    sTexto := 'De nuestra consideración:' + CRLF + CRLF +
              'Me dirijo a usted atento a la situación planteada con transferencias realizadas por nuestros clientes ' +
              'que corresponden al pago de las cuotas emergentes de la vigencia de la ley de Riesgos del Trabajo y que ' +
              'no se reflejan en los registros por ustedes suministrados al día de la fecha.' + CRLF +
              'En tales casos se ha podido constatar con documentación suministrada por el cliente, que los pagos ' +
              'se han realizado.' + CRLF +
              'Se detallan los mismos a continuación:'
  else
    sTexto := 'De nuestra consideración:' + CRLF + CRLF +
              'Me dirijo a usted atento a la situación planteada con transferencias realizadas por nuestros clientes que no ' +
              'corresponden al pago de las cuotas emergentes de la vigencia de la ley de Riesgos del Trabajo y que se reflejan ' +
              'en los registros por ustedes suministrados al día de la fecha. ' + CRLF +
              'En tales casos se ha podido constatar con documentación suministrada por el cliente, que el mismo ha solicitado la ' +
              'reafectación según el siguiente detalle:';

  Result := sTexto;
end;

function TrptCartaAFIP.Get_TextoInf(HayPositivos: Boolean): String;
var
  sTexto: String;
begin
  sTexto := 'Se adjuntan, fotocopias de los comprobantes suministrados por los clientes.'+ CRLF +
            'Por lo expuesto, solicito de su amable intervención a los efectos de regularizar la situación planteada';

  if HayPositivos then
    sTexto := sTexto + ' y recibir las transferencias';

  sTexto := sTexto + '.' + CRLF + CRLF + CRLF +
                     'Sin otro particular, saludo a usted atentamente.';

  Result := sTexto;
end;

end.

