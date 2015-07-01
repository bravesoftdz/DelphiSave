unit unRptNotasBanco_Carta;

interface

uses
	Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine,
  unArt;

type
  TRptNotasBanco_Carta = class(TQuickRep)
    sdqDatos: TSDQuery;
    TitleBand1: TQRBand;
    qrlFecha: TQRLabel;
    QRLabel1: TQRLabel;
    qrlBanco: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCtaCte: TQRLabel;
    qrTexto: TQRMemo;
  private
  public
  end;

  procedure DoImprimirNotasBanco_Carta(IdExtractoBco: TTableId);

var
  RptNotasBanco_Carta: TRptNotasBanco_Carta;

implementation

uses
  unVisualizador, Periodo, unDmPrincipal, StrFuncs;

{$R *.DFM}

procedure DoImprimirNotasBanco_Carta(IdExtractoBco: TTableId);
var
  rpt: TRptNotasBanco_Carta;
  sCad: String;
begin
  rpt := TRptNotasBanco_Carta.Create(nil);

  with rpt do
  try
  	sdqDatos.ParamByName('IdExtractoBanco').AsInteger := IdExtractoBco;
    OpenQuery(sdqDatos);

    qrlFecha.Caption  := 'Buenos Aires, ' + sdqDatos.FieldByName('FECHAACTUAL').AsString;

    qrlBanco.Caption  := sdqDatos.FieldByName('BANCO').AsString;
    qrlCtaCte.Caption := 'Ref.: Cta. Cte. ' + sdqDatos.FieldByName('CB_NUMERO').AsString;

    sCad := 'De nuestra consideración:' + CRLF + CRLF +
             Replicate(20) + 'Por la presente nos dirigimos a Ustedes a los efectos de solicitarles tengan a bien entregarnos una copia de la carta ' +
            'del embargo aplicado sobre nuestra cta. nº ' + sdqDatos.FieldByName('CB_NUMERO').AsString + ', el día ' + sdqDatos.FieldByName('EB_FECHAMOVIMIENTO').AsString + ' por el importe de $' + sdqDatos.FieldByName('EB_IMPORTE').AsString + '. ' +
            'La misma debe contener los datos que se detallan a continuación: ' + CRLF +
             Replicate(5) + '- Nº de oficio' + CRLF +
             Replicate(5) + '- Autos Principales' + CRLF +
             Replicate(5) + '- Juzgado' + CRLF +
             Replicate(5) + '- Fuero' + CRLF +
             Replicate(5) + '- Secretaría' + CRLF +
             Replicate(5) + '- Jurisdicción' + CRLF + CRLF +
            'Asimismo autorizamos a ustedes a debitar de nuestra cuenta las comisiones correspondientes.' + CRLF + CRLF + CRLF +
            'Agradeciendo su atención quedamos al aguardo de vuestra respuesta.';

		qrTexto.Lines.Text := sCad;

    Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal]);
  finally
  	Free;
  end;
end;

end.
