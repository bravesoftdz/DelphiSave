unit unRptAvisoFaltaSeguro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnRptMoldeCarta, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls;

type
  TqrAvisoFaltaSeguro = class(TqrMoldeCarta)
    QRDBText1: TQRDBText;
    qrbDetalle: TQRBand;
    qrmTexto: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
  public
    function Preparar(IDPrestador: integer): boolean;
  end;

implementation

uses
  unVisualizador, unDmPrincipal, DateTimeFuncs;

const
  POLIZA_VENCIDA: String =

  'Por la presente le comunicamos que en los registros de Provincia ART ' +
  'consta que su póliza número %s extendida por %s ha vencido el día %s. ' +
  'Le rogamos que a la mayor brevedad posible nos remita ' +
  'copia de la nueva póliza contratada o la notificación fehaciente de la renovación ' +
  'de la póliza anteriomente mencionada. Lo podrá entregar personalmente ' +
  'en las oficinas de Provincia ART o vía fax al telefóno (011)4338-4700 interno 4792. ' +
  'PUEDE VISITAR NUESTRA PAGINA WEB WWW.PROVINCIART.COM.AR ' +
  'PARA LOCALIZAR LA OFICINA MÁS CERCANA A SU DOMICILIO.';

  SIN_POLIZA: String =

  'Por la presente le comunicamos que en la base datos de Provincia ART ' +
  'no consta el registro de su póliza de mala praxis. ' +
  'Le rogamos que a la mayor brevedad posible nos remita ' +
  'copia de la misma. Lo podrá entregar personalmente ' +
  'en las oficinas de Provincia ART o vía fax al telefóno (011)4338-4700 interno 4792. ' +
  'PUEDE VISITAR NUESTRA PAGINA WEB WWW.PROVINCIART.COM.AR ' +
  'PARA LOCALIZAR LA OFICINA MÁS CERCANA A SU DOMICILIO.';

  CUOTA_VENCIDA: String =

  'Por la presente le comunicamos que en los registros de Provincia ART ' +
  'no consta el pago de la cuota nro. %d con fecha %s de su póliza número %s ' +
  'extendida por %s. Le rogamos que a la mayor brevedad posible nos remita ' +
  'copia del comprobante de pago correspondiente. Lo podrá entregar personalmente ' +
  'en las oficinas de Provincia ART o vía fax al telefóno (011)4338-4700 interno 4792. ' +
  'PUEDE VISITAR NUESTRA PAGINA WEB WWW.PROVINCIART.COM.AR ' +
  'PARA LOCALIZAR LA OFICINA MÁS CERCANA A SU DOMICILIO.';

{$R *.DFM}

{ TqrAvisoFaltaSeguro }

function TqrAvisoFaltaSeguro.Preparar(IDPrestador: integer): boolean;
var
  sTexto, sCompaniaSeguro, sVigenciaHasta, sVencimiento: string;
begin
  with sdqDatos do
  begin
    ParamByName('IDPrestador').AsInteger := IDPrestador;
    Open;

    if not IsEmpty then
    begin
      sVigenciaHasta  := FormatDateTime('dddd d "de" mmmm "de" yyyy', FieldByName('SM_VIGENCIAHASTA').AsDateTime);
      sVencimiento    := FormatDateTime('dddd d "de" mmmm "de" yyyy', FieldByName('VENCIMIENTO').AsDateTime);
      sCompaniaSeguro := ValorSQLEx('SELECT CS_NOMBRE FROM MCS_COMPANIASEGURO WHERE CS_ID = :ID', [FieldByName('SM_IDCOMPANIA').AsInteger]);

      case FieldByName('Mensaje').AsInteger of
        2: sTexto := Format(POLIZA_VENCIDA,
                            [FieldByName('SM_NUMEROPOLIZA').AsString,
                             sCompaniaSeguro,
                             sVigenciaHasta]);

        3: sTexto := SIN_POLIZA;

        4: sTexto := Format(CUOTA_VENCIDA,
                            [ValorSQLIntegerEx('SELECT MIN(SP_NUMEROCUOTA) FROM MSP_SEGUROPAGO WHERE SP_FECHAVENCIMIENTO = :FECHA', [TDateTimeEx.Create(FieldByName('VENCIMIENTO').AsDateTime)]),
                             sVencimiento,
                             FieldByName('SM_NUMEROPOLIZA').AsString,
                             sCompaniaSeguro ]);
      end;

      qrmTexto.Lines.Clear;
      qrmTexto.Lines.Text := sTexto;
      Result := True;
    end else
    begin
      Close;
      Result := False;
    end;
  end;
end;

end.
