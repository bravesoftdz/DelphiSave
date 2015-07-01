unit unRptAvisoObraRechazado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ArtQReports, unDmPrincipal;

type
  TrptAvisoObraRechazado = class(TForm)
    qrResolucion: TQuickRep;
    QRBand1: TQRBand;
    logo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRMemo1: TQRMemo;
    qrlRazonSocial: TQRLabel;
    qrlContrato: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlCIUU: TQRLabel;
    qrlMotivo: TQRLabel;
    QRBand3: TQRBand;
    QRBand2: TQRBand;
    qriFirma: TQRImage;
    QRLabel7: TQRLabel;
    QRMemo2: TQRMemo;
    qrlFirmante: TArtQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load(pCuit : String; pEstableci : Integer);
  end;

var
  rptAvisoObraRechazado: TrptAvisoObraRechazado;

implementation

uses DateUtils, AnsiSql, DB, SDEngine, unVisualizador, unExportPdf, ArchFuncs, unVisorPDF,
     unMoldeEnvioMail;

{$R *.dfm}

procedure TrptAvisoObraRechazado.Load(pCuit : String; pEstableci : Integer);
var
  PathQrp : String;
  sDirecciones : String;
begin
  with GetQuery(
    ' SELECT em_nombre, co_contrato, em_cuit, ac_codigo, ac_descripcion, '+
    '        DECODE(rb_nocorrespondepresentacion, ''S'', ''No corresponde presentación'') rb_nocorrespondepresentacion, '+
    '        DECODE(rb_incompleto, ''S'', ''Incompleto'') rb_incompleto, '+
    '        DECODE(rb_faltanfirmas, ''S'', ''Faltan Firmas'') rb_faltanfirmas, '+
    '        DECODE(rb_contratoinactivo, ''S'', ''Contrato Inactivo'') rb_contratoinactivo '+
    '   FROM hys.hrb_rechazoavisoobra a, afi.aem_empresa, afi.aco_contrato, cac_actividad '+
    '  WHERE rb_cuit = '+SqlValue(pCuit)+
    '    AND rb_estableci = '+SqlValue(pEstableci)+
    '    AND rb_cuit = em_cuit '+
    '    AND co_contrato = art.get_vultcontrato(em_cuit) '+
    '    AND co_idempresa = em_id '+
    '    AND co_idactividad = ac_id ') do
  try
    qrlRazonSocial.Caption := FieldByName('em_nombre').AsString;
    qrlCUIT.Caption        := FieldByName('em_cuit').AsString;
    qrlContrato.Caption    := FieldByName('co_contrato').AsString;
    qrlCIUU.Caption        := FieldByName('ac_codigo').AsString +' - '+ FieldByName('ac_descripcion').AsString;
    qrlMotivo.Caption      := '';
    if FieldByName('rb_nocorrespondepresentacion').AsString <> '' then
      qrlMotivo.Caption := FieldByName('rb_nocorrespondepresentacion').AsString;

    if FieldByName('rb_incompleto').AsString <> '' then
    begin
      if qrlMotivo.Caption <> '' then
        qrlMotivo.Caption := qrlMotivo.Caption + ' - '+ FieldByName('rb_incompleto').AsString
      else
        qrlMotivo.Caption := FieldByName('rb_incompleto').AsString;
    end;

    if FieldByName('rb_faltanfirmas').AsString <> '' then
    begin
      if qrlMotivo.Caption <> '' then
        qrlMotivo.Caption := qrlMotivo.Caption + ' - '+ FieldByName('rb_faltanfirmas').AsString
      else
        qrlMotivo.Caption := FieldByName('rb_faltanfirmas').AsString;
    end;

    if FieldByName('rb_contratoinactivo').AsString <> '' then
    begin
      if qrlMotivo.Caption <> '' then
        qrlMotivo.Caption := qrlMotivo.Caption + ' - '+ FieldByName('rb_contratoinactivo').AsString
      else
        qrlMotivo.Caption := FieldByName('rb_contratoinactivo').AsString;
    end;
  finally
    free;
  end;
  with GetQuery(
    ' SELECT fi_firma, fi_firmante, fi_margeninferior '+
    '   FROM art.ctb_tablas, comunes.cfi_firma '+
    '  WHERE tb_clave = ''FIRMA'' AND tb_especial1 = fi_id AND tb_codigo = ''02'' ')do
  begin
    qrlFirmante.Caption := '';
    if not FieldByName('FI_FIRMA').IsNull then
      qriFirma.Picture.Assign(FieldByName('FI_FIRMA'));
    qrlFirmante.Left := qriFirma.Left + (qriFirma.Width div 2);
    qrlFirmante.Caption := FieldByName('FI_FIRMANTE').AsString;
  end;
  qrResolucion.Prepare;
  PathQrp := TempPath+'rechazoavisoobra.qrp';
  qrResolucion.QRPrinter.Save(PathQrp);
  qrResolucion.QRPrinter.Free;
  if not FileToPDFSvr(pathQrp,TempPath) then
    raise Exception.Create('Error al generar el PDF');
  sDirecciones := ValorSql('SELECT co_direlectronica '+
                           '  FROM afi.aco_contrato, afi.aem_empresa '+
                           ' WHERE co_idempresa = em_id '+
                           '   AND co_contrato = art.get_vultcontrato(em_cuit) '+
                           '   AND em_cuit = '+SqlValue(pCuit));//+', construccion@provart.com.ar';

  EnviarMailBD(sDirecciones, 'Nota de Aviso de Obra Rechazado',[oAutoFirma],'',
               GetAttachments(ChangeFileExt(pathQrp, '.pdf'),0), 0,tcDefault );
end;

end.
