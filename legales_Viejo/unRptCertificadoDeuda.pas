unit unRptCertificadoDeuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, DB, SDEngine, QuickRpt, ExtCtrls, StdCtrls,RxRichEd, ComCtrls;

type
  TrptCertificadoDeuda = class(TForm)
    rptEventos: TQuickRep;
    qrbTitulo: TQRBand;
    qrbDetalle: TQRBand;
    SummaryBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    qrTotalesShape: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    sdqEvento: TSDQuery;
    qrdNroEvento: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrTotalSaldoConsolidado: TQRLabel;
    qrTotalInteres: TQRLabel;
    qrTotalSaldoNominal: TQRLabel;
    auxRichEdit: TRichEdit;
    qrParteInferior: TQRRichText;
    auxRichEditInferior: TRichEdit;
    qrLineaFinalShape: TQRShape;
    qrParteSuperior: TQRRichText;
  private
    FPath : String;
    procedure GuardarEvento;
    { Private declarations }
  public
    { Public declarations }
    FNroOrden : Integer;
    procedure Load(sCuit,sPerDesde,sPerHasta : String; dFechaInteres : TDate; iContrato : Integer;
                   textosuperior, textoinferior : TRxRichEdit; sTotalSaldoNominal, sTotalInteres,sTotalSaldoCons : String; iTipoPagina : Integer );
  end;

var
  rptCertificadoDeuda: TrptCertificadoDeuda;

implementation

{$R *.dfm}
uses
  ArchFuncs, unExportPDF, unVisorPDF, unConstLegales, unDirUtils, unDmPrincipal, AnsiSql, unSesion, CustomDlgs, QRPrntr;

{ TrptCertificadoDeuda }

procedure TrptCertificadoDeuda.Load(sCuit, sPerDesde, sPerHasta: String;
          dFechaInteres: TDate; iContrato: Integer; textosuperior, textoinferior : TRxRichEdit;
          sTotalSaldoNominal, sTotalInteres,sTotalSaldoCons : String; iTipoPagina : Integer);
var
  AStreamSup, AStreamInf : TMemoryStream;
begin
  sdqEvento.ParamByName('CUIT').AsString       := sCuit;
  sdqEvento.ParamByName('PERDESDE').AsString   := sPerDesde;
  sdqEvento.ParamByName('PERHASTA').AsString   := sPerHasta;
  sdqEvento.ParamByName('CONTRATO').AsInteger  := iContrato;
  sdqEvento.ParamByName('FECHAINTERES').AsDate := dFechaInteres;
  sdqEvento.Open;
  if iTipoPagina = 0 then //Legal
  begin
    rptEventos.Page.PaperSize := Legal;
    qrTotalesShape.Width := 326;
  end
  else if iTipoPagina = 1 then
  begin
    rptEventos.Page.PaperSize := A4;
    //qrLineaFinalShape.Width := 304;
    qrTotalesShape.Width := 305;
  end;

  qrTotalSaldoNominal.Caption := sTotalSaldoNominal;
  qrTotalInteres.Caption := sTotalInteres;
  qrTotalSaldoConsolidado.Caption := sTotalSaldoCons;
  AStreamSup := TMemoryStream.Create;
  AStreamInf := TMemoryStream.Create;
  try
    textosuperior.Lines.SaveToStream(AStreamSup);
    AStreamSup.Position := 0;
    auxRichEdit.Lines.LoadFromStream(AStreamSup);
    qrParteSuperior.ParentRichEdit := auxRichEdit;
    textoinferior.Lines.SaveToStream(AStreamInf);
    AStreamInf.Position := 0;
    auxRichEditInferior.Lines.LoadFromStream(AStreamInf);
    qrParteInferior.ParentRichEdit := auxRichEditInferior;
  finally
    AStreamSup.Free;
    AStreamInf.Free;
  end;
  rptEventos.Prepare;
  FPath := TempPath+'Certificadodeuda'+IntToStr(iContrato)+'.qrp';
  rptEventos.PrinterSettings.Duplex := True;
  rptEventos.QRPrinter.Save(FPath);
  rptEventos.QRPrinter.Free;
  GuardarEvento;
  AbrirPDF(ChangeFileExt(FPath, '.pdf'));

end;


procedure TrptCertificadoDeuda.GuardarEvento;
var
  sDirectorio, sDirectorioDest, sArchivoOrigen, sNombreArchivoDestino : STring;
  sArchivoDestino : String;
  iIDEventoGD, iNroEvento : Integer;

begin
  if not FileToPDFSvr(FPath,TempPath) then
    raise Exception.Create('Error al generar el PDF');

  sDirectorio := GetParam(DIRECTORIOARCHIVOSGD);
  if DirectoryExists(sDirectorio) then
  begin
    sDirectorioDest := IncludeTrailingBackslash(sDirectorio) +  IncludeTrailingBackslash(IntToStr(FNroOrden));
    CreateDirectoryIfNotExist(sDirectorioDest);

    sArchivoOrigen := ChangeFileExt(FPath, '.pdf');
    sNombreArchivoDestino := IntToStr(GetSecNextVal('LEGALES.SEQ_LEG_ID'));
    sArchivoDestino := sDirectorioDest + sNombreArchivoDestino + ExtractFileExt(sArchivoOrigen);

    if Not FileExists(PAnsiChar(sArchivoDestino)) then
    begin
      if not CopyFileExt(sArchivoOrigen, sArchivoDestino, true) then
        raise Exception.Create('El archivo ' + sArchivoOrigen +  'no pudo ser copiado al directorio ' + sDirectorio +
                         ' indicado en el parámetro ');
    end
    else raise Exception.Create('Un archivo con el mismo nombre ya existe en el directorio.');
  end
  else raise Exception.Create('El directorio indicado en el parámetro no existe. (' + sDirectorio + ')');

  iIDEventoGD := GetSecNextVal('ART.SEQ_LGE_ID');
  iNroEvento := ValorSql('SELECT IIF_Compara( ''<='', NVL(Max( GE_NROEVENTO ), 0), 0, 1, NVL(Max( GE_NROEVENTO ), 0)+1 ) FROM LGE_EVENTOSGDEUDA WHERE GE_NROORDEN = ' + IntToStr( FNroOrden ) );
  EjecutarSqlST('INSERT INTO LGE_EVENTOSGDEUDA(GE_ID,GE_NROORDEN,GE_NROEVENTO,GE_USUALTA, GE_FECHAALTA, GE_CODIGO, GE_FECHA, GE_OBSERVACIONES)'+
                ' VALUES('+sqlvalue(iIDEventoGD)+','+SqlValue(FNroOrden)+','+SqlValue(iNroEvento)+','+
                SqlValue(Sesion.UserID)+',sysdate,''022'',art.actualdate, ''Certificado de deuda con caracter de titulo ejecutivo'')');

  EjecutarSqlST('INSERT INTO legales.leg_eventoarchivogd ' +
                ' (eg_id, eg_descripcion, eg_patharchivo, ' +
                '  eg_ideventogd, eg_usualta, eg_fechaalta) ' +
                'VALUES (' + SqlValue(sNombreArchivoDestino) + ',  ' +
                             SqlValue(ExtractFileName(sArchivoOrigen)) + ', ' +
                             SqlValue(sArchivoDestino) + ', ' +
                             SqlValue(iIDEventoGD) + ',' +
                             SqlValue(Sesion.LoginName) + ', SYSDATE)');
  MsgBox('La operación se realizó con exito', MB_ICONEXCLAMATION, 'Atención');
end;

end.
