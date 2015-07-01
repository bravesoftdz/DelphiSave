unit unRptPal;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, General,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine, ArtDatabase,
  AnsiSql, unDmPrincipal, Dialogs, ArtQReports;

type
  TrptPal = class(TForm)
    sdqReporte: TSDQuery;
    qrResolucion: TQuickRep;
    qrbTitulo: TQRBand;
    QRShape6: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    ciiu: TQRLabel;
    contrato: TQRLabel;
    cpa: TQRLabel;
    cuit: TQRLabel;
    denomestablecimiento: TQRLabel;
    domicilio: TQRLabel;
    email: TQRLabel;
    lblactividad: TQRLabel;
    lblcanttrab: TQRLabel;
    lblciiu: TQRLabel;
    lblcontrato: TQRLabel;
    lblcpa: TQRLabel;
    lblcuit: TQRLabel;
    lbldatosempresa: TQRLabel;
    lbldenomestablecimiento: TQRLabel;
    lbldomicilio: TQRLabel;
    lblemail: TQRLabel;
    lbllocalidad: TQRLabel;
    lblprovincia: TQRLabel;
    lblrazonsocial: TQRLabel;
    lbltelfax: TQRLabel;
    localidad: TQRLabel;
    logo: TQRImage;
    provincia: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    razonsocial: TQRLabel;
    telfax: TQRLabel;
    qrbPie: TQRBand;
    qrbHeader: TQRBand;
    lblconsideraciones: TQRLabel;
    qrbDetalle: TQRBand;
    medida: TQRDBText;
    nromedida: TQRDBText;
    QRShape18: TQRShape;
    QRShape49: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    item: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape20: TQRShape;
    QRLabel5: TQRLabel;
    lbFechaSeguimiento: TQRMemo;
    lblfechavisita: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape32: TQRShape;
    QRSysData1: TQRSysData;
    QRShape5: TQRShape;
    QRShape12: TQRShape;
    sdqFechaSeg: TSDQuery;
    QRShape11: TQRShape;
    QRShape16: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape33: TQRShape;
    QRShape40: TQRShape;
    QRShape17: TQRShape;
    QRShape35: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    ChildBand1: TQRChildBand;
    lblitem: TQRLabel;
    lblmedida: TQRLabel;
    lblnromedida: TQRLabel;
    QRShape48: TQRShape;
    QRShape21: TQRShape;
    QRShape19: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape24: TQRShape;
    QRShape34: TQRShape;
    ChildBandPieVerif: TQRChildBand;
    QRShape58: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape59: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape60: TQRShape;
    ChildBandPiePal: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape29: TQRShape;
    QRShape15: TQRShape;
    QRShape28: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel18: TQRLabel;
    QRShape41: TQRShape;
    QRLabel19: TQRLabel;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    procedure qrbPieBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbTituloBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
  private

  public
    procedure ExportPdf(pCuit, pNroContrato, pNroEstablecimiento,
                        pOperativo, pTipo, pRazonsocial, pDenomestablecimiento, pContrato,
                        pCiiu, pDomicilio, pLocalidad, pCpa, pProvincia, pTelfax,
                        pEmail: String; pFecha: TDateTime; pPath: String; ImprimirVacio : Boolean = False);
    procedure VistaPrevia(pCuit, pNroContrato, pNroEstablecimiento, pOperativo, pTipo, pRazonsocial,
                          pDenomestablecimiento, pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                          pProvincia, pTelfax, pEmail: String; pFecha :TDateTime; pPath : String = '';
                          ImprimirVacio : Boolean = False);
    { Public declarations }
  end;

var
  rptPal: TrptPal;

implementation

uses unVisualizador, DateTimeFuncs, Math, unArchivo, ArchFuncs, unExportPDF;

{$R *.dfm}


Const
  LpH1 = 8; // # líneas para la primer hoja
  LpH2 = 12; // # líneas a partir de la 2da. hoja


procedure TrptPal.VistaPrevia (pCuit, pNroContrato, pNroEstablecimiento, pOperativo, pTipo, pRazonsocial, pDenomestablecimiento,
                               pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                               pProvincia, pTelfax, pEmail: String; pFecha :TDateTime; pPath : String = ''; ImprimirVacio : Boolean = False);
var
  LineasNulas: Integer;
  primerRegistro : Boolean;
  sFechas : String;
  sWhere : String;
begin
  primerRegistro := True;
  Logo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  cuit.Caption := pCuit;
  razonsocial.Caption := pRazonsocial;
  denomestablecimiento.Caption := pDenomestablecimiento;
  contrato.Caption := pContrato;
  ciiu.Caption := pCiiu;
  domicilio.Caption := pDomicilio;
  localidad.Caption := pLocalidad;
  cpa.Caption := pCpa;
  provincia.Caption := pProvincia;
  telfax.Caption := pTelfax;
  email.Caption := pEmail;

  qrlNumero.Caption := GetCodBarrasClave('PAL', pNroContrato, pNroEstablecimiento);

  OpenQueryEx(sdqReporte, [pCuit, pNroEstablecimiento, pTipo, pOperativo, TDateTimeEx.Create(pFecha)]);
  If ImprimirVacio then
    sWhere := ' AND 1 = 2 '
  else
    sWhere := '';
  if not sdqReporte.FieldByName('CUMP').IsNull then
  begin
    ChildBandPieVerif.ParentBand := qrbPie;
    ChildBandPieVerif.Enabled := true;
    ChildBandPiePal.Enabled := false;
  end
  else begin
    ChildBandPiePal.ParentBand := qrbPie;
    ChildBandPiePal.Enabled := true;
    ChildBandPieVerif.Enabled := false;
  end;

  sdqFechaSeg.SQL.Append(sWhere);
  OpenQueryEx(sdqFechaSeg, [pCuit, pNroEstablecimiento, pTipo, pOperativo]);
 {
  with GetQuery(
    ' SELECT PA_CUMPLIMIENTO '+
    '   FROM hys.hpa_pal, art.pai_anexo2items '+
    '  WHERE pa_anexo = ai_anexo '+
    '    AND ai_codigo = pa_itemanexo '+
    '    AND pa_fechabaja IS NULL '+
    '    AND pa_cuit = '+ SqlValue(pCuit)+
    '    AND pa_estableci = '+SqlValue(pNroEstablecimiento)+
    '    AND pa_tipo = '+SqlValue(pTipo)+
    '    AND pa_operativo = '+SqlValue(pOperativo)+
    '    AND (pa_cumplimiento > '+ SqlValue(pFecha)+') '+
    'ORDER BY 1 ') do
  }
  with GetQuery(
    ' SELECT pv_fecha '+
    '   FROM hys.hpv_planvisitas '+
    '  WHERE pv_fechabaja IS NULL '+
    '    AND pv_cuit = '+ SqlValue(pCuit)+
    '    AND pv_estableci = '+SqlValue(pNroEstablecimiento)+
    '    AND pv_tipo = '+SqlValue(pTipo)+
    '    AND pv_operativo = '+SqlValue(pOperativo)+
    '    AND (pv_fecha > '+ SqlValue(pFecha)+') '+sWhere+
    'ORDER BY 1 ') do
  try
    while not Eof do
    begin
      if primerRegistro then
      begin
        sFechas := FieldByName('pv_fecha').AsString;
        primerRegistro := False;
      end
      else
        sFechas := sFechas +' - '+ FieldByName('pv_fecha').AsString;
      Next;
    end;
  finally
    Free;
  end;

  if ImprimirVacio then
  begin
    sdqReporte.Close;
    sdqReporte.SQL.Append(sWhere);
  end;

  //sdqReporte.Open;
  if sdqReporte.RecordCount = LpH1 then
    LineasNulas := 0
  else
    if sdqReporte.RecordCount < LpH1 then
      LineasNulas := (LpH1 + 1) - sdqReporte.RecordCount mod LpH1
    else
      if (sdqReporte.RecordCount - LpH1) mod LpH2 = 0 then
        LineasNulas := 0
      else
        LineasNulas := (LpH2 + 1) - (sdqReporte.RecordCount - LpH1) mod LpH2;

  sdqReporte.Close;
  sdqReporte.SQL.Append('UNION ALL ' +
                        'SELECT NULL item, NULL descitem, NULL cump, NULL seg ' +
                        '  FROM aco_contrato ' +
                        ' WHERE ROWNUM <  ' + SqlInt(LineasNulas)+
                        ' ORDER BY 1');

  OpenQueryEx(sdqReporte, [pCuit, pNroEstablecimiento, pTipo, pOperativo, TDateTimeEx.Create(pFecha)]);

  lbFechaSeguimiento.Lines.Clear;
  lbFechaSeguimiento.Lines.Add(sFechas);

  if pPath = '' then
    Visualizar(qrResolucion, GetValores('', '', StrToIntDef(pContrato, 0)), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  else
  begin
    qrResolucion.Prepare;
    qrResolucion.QRPrinter.Title := pPath;
    qrResolucion.QRPrinter.Print;
    qrResolucion.QRPrinter.Free;
    qrResolucion.QRPrinter.Cleanup;
  end;
end;

procedure TrptPal.ExportPdf (pCuit, pNroContrato, pNroEstablecimiento, pOperativo, pTipo, pRazonsocial, pDenomestablecimiento,
                             pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
                             pProvincia, pTelfax, pEmail: String; pFecha :TDateTime; pPath : String; ImprimirVacio : Boolean = False);
begin
  VistaPrevia (pCuit, pNroContrato, pNroEstablecimiento, pOperativo, pTipo, pRazonsocial, pDenomestablecimiento,
               pContrato, pCiiu, pDomicilio, pLocalidad, pCpa,
               pProvincia, pTelfax, pEmail, pFecha, pPath, ImprimirVacio);
end;

procedure TrptPal.qrbPieBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  {sólo considera un registro. qry con MAX}
  lbFechaSeguimiento.Lines.Add(sdqFechaSeg.FieldByName('fecha').AsString);
end;

procedure TrptPal.qrbHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrResolucion.qrPrinter.PageNumber < 2 then
    qrbHeader.Height := 170
  else
    qrbHeader.Height := 28
end;

procedure TrptPal.qrbTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrbTitulo.Height := 225;
end;

procedure TrptPal.qrlBarrasPrint(sender: TObject; var Value: String);
begin
  Value := '*' + qrlNumero.Caption + '*';
end;

end.
