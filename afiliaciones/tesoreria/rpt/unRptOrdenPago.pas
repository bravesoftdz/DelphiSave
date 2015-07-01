unit unRptOrdenPago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine;

type
  TTipoReporte = (trPreviewOP, trPrintOP, trPdfOP);

  TRptOrdenPago = class(TForm)
    qrpOrdenPago: TQuickRep;
    qrbTitulo: TQRBand;
    sdqOrdenPago: TSDQuery;
    qrdOP: TQRDBText;
    QRBDetail: TQRBand;
    qrlCheque: TQRLabel;
    qrlFecha: TQRLabel;
    qrlDescripcion: TQRLabel;
    qrlImporteAplicado: TQRLabel;
    qrdImporteApli: TQRDBText;
    qrlOrdenPago: TQRLabel;
    QRBSubTotal: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    qrlRecibio: TQRLabel;
    qrlFirmaCheque: TQRLabel;
    qrlEntrego: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    qrlRecibido: TQRLabel;
    qrlFechaRecibido: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    qrlFechaEmision: TQRLabel;
    qrdFechaEmision: TQRDBText;
    sdqEncabezado: TSDQuery;
    qrdProveedor: TQRDBText;
    qrdDomicilioUno: TQRDBText;
    qrdDomicilioDos: TQRDBText;
    qrdCodigoPostal: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlCuitART: TQRLabel;
    QRShape12: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlIBART: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    qrlCodBarras: TQRLabel;
    qriLogo: TQRImage;
    qrmTexto: TQRMemo;
    qrlNumeroCodBarras: TQRLabel;
    QRLabel19: TQRLabel;
    qrdNroCheque: TQRDBText;
    qrdFecha: TQRDBText;
    QRDBText3: TQRDBText;
    qrdDescripcion: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape8: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrlCodBarrasST: TQRLabel;
    qrlNumeroCodBarrasST: TQRLabel;
    qrlInfoAdic1CodBarrasST: TQRLabel;
    qrlInfoAdic2CodBarrasST: TQRLabel;
    procedure qrlCuitARTPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrlIBARTPrint(sender: TObject; var Value: String);
    procedure qrlCodBarrasPrint(sender: TObject; var Value: String);
    procedure FormatMonto(Sender: TObject; var Value: String);
    procedure qrpOrdenPagoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  end;

  function DoImprimirOP(OP: Integer; TipoReporte: TTipoReporte; var PathDestinoPDF: String): Boolean;

implementation

uses
  StrFuncs, unDmFinancials, unArt, unDmPrincipal, Cuit,
  unArchivo, unConstantArchivo, ArchFuncs, unExportPDF
  {$IFDEF SERVICE}, unEnvioND{$ELSE}, unVisualizador{$ENDIF},
  unUtilsArchivo, unTesoreria;

{$R *.DFM}

function DoImprimirOP(OP: Integer; TipoReporte: TTipoReporte; var PathDestinoPDF: String): Boolean;
var
  RptOrdenPago: TRptOrdenPago;
  bOk: Boolean;
begin
  bOk            := False;
  PathDestinoPDF := '';

  RptOrdenPago := TRptOrdenPago.Create(nil);
  with RptOrdenPago do
    try
      sdqOrdenPago.Close;
      sdqOrdenPago.ParamByName('OP').asInteger := OP;
      sdqOrdenPago.Open;

      sdqEncabezado.Close;
      sdqEncabezado.ParamByName('OP').asInteger := OP;
      sdqEncabezado.Open;

      case TipoReporte of
        {$IFNDEF SERVICE}
        trPreviewOP:
          begin
            Visualizar(qrpOrdenPago, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal], True, '', '', True);
            bOK := True;
          end;
        {$ENDIF}
        trPrintOP:
          begin
            qrpOrdenPago.Print;
            bOK := True;
          end;
        trPdfOP:
          begin
            PathDestinoPDF := TempPath + 'OP_' + LPad(OP, '0', 9) + '.pdf';
            bOk := FileToPDFSvr(qrpOrdenPago, ExtractFileDir(PathDestinoPDF), PathDestinoPDF, False);
            {$IFDEF SERVICE}
            if not bOk then
              EnvioND.LogMessage('[Envío de Ordenes de Pago] Error en la conversión pdf de la orden de pago (OP: ' + IntToStr(OP) + ').', EVENTLOG_ERROR_TYPE, 0, 0);
            {$ENDIF}
          end;
      end;
    finally
      Free;
    end;

  Result := bOk;
end;

procedure TRptOrdenPago.qrlCuitARTPrint(sender: TObject; var Value: String);
begin
  Value := PonerGuiones(cNroCuitART);
end;

procedure TRptOrdenPago.FormCreate(Sender: TObject);
begin
  dmFinancials.Conectar;

  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TRptOrdenPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmFinancials.Desconectar;
end;

procedure TRptOrdenPago.qrlIBARTPrint(sender: TObject; var Value: String);
begin
  Value := 'C.M.' + cNroIngresosBrutosART;
end;

procedure TRptOrdenPago.qrpOrdenPagoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  IdSecTrazabilidad: TTableId;
begin
  IdSecTrazabilidad := GetPrimeraSecTrazabilidad(ID_CARPETA_TESORERIA, CODDOC_OPAGOTESO, sdqOrdenPago.ParamByName('OP').AsString);

  if IdSecTrazabilidad = ART_EMPTY_ID then
    IdSecTrazabilidad := Get_SecuenciaTrazOP(sdqOrdenPago.ParamByName('OP').AsInteger);

  DoCargarCodBarrasSecTrazabililidad(IdSecTrazabilidad, qrlCodBarrasST, qrlNumeroCodBarrasST, qrlInfoAdic1CodBarrasST, qrlInfoAdic2CodBarrasST, alDerecha, False, True);
end;

procedure TRptOrdenPago.qrlCodBarrasPrint(sender: TObject; var Value: String);
var
  sCodBarras: String;
begin
  sCodBarras := GetCodBarrasClave(CODDOC_OPAGOTESO, sdqOrdenPago.ParamByName('OP').asString);

  Value := '*' + sCodBarras + '*';
  qrlNumeroCodBarras.Caption := sCodBarras;
end;

procedure TRptOrdenPago.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.

