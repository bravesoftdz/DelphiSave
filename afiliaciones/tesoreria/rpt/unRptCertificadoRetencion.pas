unit unRptCertificadoRetencion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TTipoReporte = (trPreviewCR, trPrintCR, trPdfCR);
  TResReporte = (rrSinDatos, rrOk, rrError);

  TRptCertificadoRetencion = class(TForm)
    qrCertificadoRet: TQuickRep;
    qrbPageHeader: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qrbDetail: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qriLogo: TQRImage;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlIBART: TQRLabel;
    QRLabel16: TQRLabel;
    qrlCuitART: TQRLabel;
    sdqFirma: TSDQuery;
    sdqDatos: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel5: TQRLabel;
    qrlConfecciono: TQRLabel;
    QRShape1: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText12: TQRDBText;
    qriFirma: TQRImage;
    procedure qrlCuitARTPrint(sender: TObject; var Value: String);
    procedure qrlIBARTPrint(sender: TObject; var Value: String);
    procedure FormatMonto(Sender: TObject; var Value: String);
  private
  public
  end;

  function DoImprimirCertificadoRetencion(OP: Integer; TipoReporte: TTipoReporte; var PathDestinoPDF: String): TResReporte;

implementation

uses
  strFuncs, unArt, unDmPrincipal, Cuit, ArchFuncs, unExportPDF
  {$IFDEF SERVICE}, unEnvioND{$ELSE}, unVisualizador{$ENDIF};

{$R *.dfm}

function DoImprimirCertificadoRetencion(OP: Integer; TipoReporte: TTipoReporte; var PathDestinoPDF: String): TResReporte;
var
  RptCertificadoRetencion: TRptCertificadoRetencion;
  Res: TResReporte;
  fStream: TStream;
begin
  Res            := rrSinDatos;
  PathDestinoPDF := '';

  RptCertificadoRetencion := TRptCertificadoRetencion.Create(nil);
  with RptCertificadoRetencion do
    try
      sdqDatos.Close;
      sdqDatos.ParamByName('OP').AsInteger := OP;
      sdqDatos.Open;

      if not sdqDatos.IsEmpty then
        begin
          qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

          sdqFirma.Close;
          sdqFirma.ParamByName('Tesorero').AsString := USU_TESORERO;
          sdqFirma.Open;

          fStream := sdqFirma.CreateBlobStream(sdqFirma.FieldByName('FIRMA'), bmReadWrite);
          try
            qriFirma.Picture.Bitmap.LoadFromStream(fStream);
          finally
            fStream.Free;
          end;

          case TipoReporte of
            {$IFNDEF SERVICE}
            trPreviewCR:
              begin
                Visualizar(qrCertificadoRet, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal], True, '', '', True);
                Res := rrOk;
              end;
            {$ENDIF}
            trPrintCR:
              begin
                qrCertificadoRet.Print;
                Res := rrOk;
              end;
            trPdfCR:
              begin
                PathDestinoPDF := TempPath + 'CR_' + LPad(OP, '0', 9) + '.pdf';
                if FileToPDFSvr(qrCertificadoRet, ExtractFileDir(PathDestinoPDF), PathDestinoPDF, False) then
                  Res := rrOk
                else
                  begin
                    {$IFDEF SERVICE}EnvioND.LogMessage('[Envío de Ordenes de Pago] Error en la conversión pdf del cert. de retención (OP: ' + IntToStr(OP) + ').', EVENTLOG_ERROR_TYPE, 0, 0);{$ENDIF}
                    Res := rrError;
                  end;
              end;
          end;
        end;
    finally
      Free;
    end;

  Result := Res;
end;

procedure TRptCertificadoRetencion.qrlCuitARTPrint(sender: TObject; var Value: String);
begin
  Value := PonerGuiones(cNroCuitART);
end;

procedure TRptCertificadoRetencion.qrlIBARTPrint(sender: TObject; var Value: String);
begin
  Value := 'C.M.' + cNroIngresosBrutosART;
end;

procedure TRptCertificadoRetencion.FormatMonto(Sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.

