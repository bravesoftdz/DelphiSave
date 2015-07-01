unit unRptProgramaSeguridadRechazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ArtQReports, QRCtrls, QuickRpt, ExtCtrls;

type
  TrptProgramaSeguridadRechazo = class(TForm)
    qrResolucion: TQuickRep;
    QRBand1: TQRBand;
    logo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrEncabezado: TQRMemo;
    qrlRazonSocial: TQRLabel;
    qrlContrato: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlCIUU: TQRLabel;
    qrlMotivo: TQRLabel;
    QRBand2: TQRBand;
    qriFirma: TQRImage;
    qrlFirmante: TArtQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRMemo1: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load(pCuit : String; pEstableci : Integer; pOperativo : String);
  end;

var
  rptProgramaSeguridadRechazo: TrptProgramaSeguridadRechazo;

implementation

uses unDmPrincipal, AnsiSql, DB, Math, unVisualizador, ArchFuncs, unExportPdf, unMoldeEnvioMail;

{$R *.dfm}

procedure TrptProgramaSeguridadRechazo.Load(pCuit : String; pEstableci : Integer; pOperativo : String);
var
  PathQrp : String;
  sDirecciones : String;
  iIdRechPS : Integer;
begin
  with GetQuery(
    ' SELECT rq_id, em_nombre, co_contrato, em_cuit, ac_codigo, ac_descripcion, '+
    '        art.armar_domicilio(es_calle, es_numero, es_piso, es_departamento) domicilio, es_localidad, '+
    '        (SELECT ao_fechainicio FROM art.pao_avisoobra WHERE ao_cuit = em_cuit AND ao_estableci = rq_estableci '+
    '         AND ao_fechabaja IS NULL AND ao_operativo = '+SqlValue(pOperativo)+') fechainicio,'+
    '        (SELECT NVL(ao_fechaextension, ao_fechafindeobra) FROM art.pao_avisoobra WHERE ao_cuit = em_cuit AND ao_estableci = rq_estableci '+
    '         AND ao_fechabaja IS NULL AND ao_operativo = '+SqlValue(pOperativo)+') fechafin '+
    '   FROM hys.hrq_rechazops, afi.aem_empresa, afi.aco_contrato, cac_actividad, afi.aes_establecimiento '+
    '  WHERE rq_cuit = '+ SqlValue(pCuit)+
    '    AND rq_estableci = '+SqlValue(pEstableci)+
    '    AND rq_cuit = em_cuit '+
    '    AND co_contrato = art.get_vultcontrato(em_cuit) '+
    '    AND co_idempresa = em_id '+
    '    AND co_idactividad = ac_id '+
    '    AND co_contrato = es_contrato '+
    '    AND es_nroestableci = rq_estableci ') do
  try
    qrlRazonSocial.Caption := FieldByName('em_nombre').AsString;
    qrlCUIT.Caption        := FieldByName('em_cuit').AsString;
    qrlContrato.Caption    := FieldByName('co_contrato').AsString;
    qrlCIUU.Caption        := FieldByName('ac_codigo').AsString + FieldByName('ac_descripcion').AsString;
    iIdRechPS              := FieldByName('rq_id').AsInteger;
    qrEncabezado.Lines.Text:= 'De nuestra consideraci�n: '+#13+
                              '       Con referencia a vuestra consulta sobre la condici�n en la que se encuentra '+
                              'la documentaci�n para la direcci�n de '+FieldByName('domicilio').AsString + ' - '+
                              FieldByName('es_localidad').AsString +', con fecha de inicio en '+
                              FieldByName('fechainicio').AsString+' y fecha de fin '+FieldByName('fechafin').AsString +
                              ', por ud. entregada, le informamos que la misma se encuentra (EN SITUACION DE INCOMPLETITUD):';

  finally
    free;
  end;
  qrlMotivo.Caption := '';
  with GetQuery(' SELECT tb_descripcion '+
                '   FROM hys.hrm_rechazomotivops, art.ctb_tablas '+
                '  WHERE tb_clave = ''RECPS'' '+
                '    AND rm_codigomotivorechazo = tb_codigo '+
                '    AND rm_idrechazops = '+SqlValue(iIdRechPS)) do
  try
    while Eof do
    begin
      If qrlMotivo.Caption = '' then
        qrlMotivo.Caption := FieldByName('tb_descripcion').AsString
      else
        qrlMotivo.Caption := qrlMotivo.Caption +' - '+FieldByName('tb_descripcion').AsString;
      Next;
    end;
  finally
    Free;
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
  PathQrp := TempPath+'programaseguridadrechazo.qrp';
  qrResolucion.QRPrinter.Save(PathQrp);
  qrResolucion.QRPrinter.Free;
  if not FileToPDFSvr(pathQrp,TempPath) then
    raise Exception.Create('Error al generar el PDF');
  sDirecciones := ValorSql('SELECT co_direlectronica '+
                           '  FROM afi.aco_contrato, afi.aem_empresa '+
                           ' WHERE co_idempresa = em_id '+
                           '   AND co_contrato = art.get_vultcontrato(em_cuit) '+
                           '   AND em_cuit = '+SqlValue(pCuit));//+', construccion@provart.com.ar';
  EnviarMailBD(sDirecciones, 'Nota de Programa de Seguridad Rechazado',[oAutoFirma],'',
               GetAttachments(ChangeFileExt(pathQrp, '.pdf'),0), 0,tcDefault );

end;

end.
