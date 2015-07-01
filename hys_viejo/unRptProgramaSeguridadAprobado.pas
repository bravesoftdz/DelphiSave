unit unRptProgramaSeguridadAprobado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ArtQReports, QRCtrls, QuickRpt, ExtCtrls;

type
  TrptProgramaSeguridadAprobado = class(TForm)
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
  rptProgramaSeguridadAprobado: TrptProgramaSeguridadAprobado;

implementation

uses unDmPrincipal, AnsiSql, DB, Math, unVisualizador, ArchFuncs, unExportPdf, unMoldeEnvioMail;

{$R *.dfm}

procedure TrptProgramaSeguridadAprobado.Load(pCuit : String; pEstableci : Integer; pOperativo : String);
var
  PathQrp : String;
  sDirecciones : String;
  //iIdPS : Integer;
begin
  with GetQuery(
    ' SELECT ps_id, em_nombre, co_contrato, em_cuit, ac_codigo, ac_descripcion, '+
    '        art.armar_domicilio(es_calle, es_numero, es_piso, es_departamento) domicilio, es_localidad, '+
    '        (SELECT ao_fechainicio FROM art.pao_avisoobra WHERE ao_cuit = em_cuit AND ao_estableci = ps_establecimiento '+
    '         AND ao_fechabaja IS NULL AND ao_operativo = '+SqlValue(pOperativo)+') fechainicio,'+
    '        (SELECT NVL(ao_fechaextension, ao_fechafindeobra) FROM art.pao_avisoobra WHERE ao_cuit = em_cuit AND ao_estableci = ps_establecimiento '+
    '         AND ao_fechabaja IS NULL AND ao_operativo = '+SqlValue(pOperativo)+') fechafin '+
    '   FROM hys.hps_programaseguridad, afi.aem_empresa, afi.aco_contrato, cac_actividad, afi.aes_establecimiento '+
    '  WHERE ps_cuit = '+ SqlValue(pCuit)+
    '    AND ps_establecimiento = '+SqlValue(pEstableci)+
    '    AND ps_cuit = em_cuit '+
    '    AND co_contrato = art.get_vultcontrato(em_cuit) '+
    '    AND co_idempresa = em_id '+
    '    AND co_idactividad = ac_id '+
    '    AND co_contrato = es_contrato '+
    '    AND es_nroestableci = ps_establecimiento ') do
  try
    qrlRazonSocial.Caption := FieldByName('em_nombre').AsString;
    qrlCUIT.Caption        := FieldByName('em_cuit').AsString;
    qrlContrato.Caption    := FieldByName('co_contrato').AsString;
    qrlCIUU.Caption        := FieldByName('ac_codigo').AsString + FieldByName('ac_descripcion').AsString;
    //iIdPS                  := FieldByName('ps_id').AsInteger;
    qrEncabezado.Lines.Text:= 'De nuestra consideración: '+#13+
                              '       Con referencia a vuestra consulta sobre la condición en la que se encuentra la documentación '+
                              ' para la dirección de '+FieldByName('domicilio').AsString + ' - '+
                              FieldByName('es_localidad').AsString +', con fecha de inicio en '+
                              FieldByName('fechainicio').AsString+' y fecha de fin '+FieldByName('fechafin').AsString +
                              ', por ud. entregada, le informamos que la misma se encuentra (APROBADO)';

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
  PathQrp := TempPath+'programaseguridadaprobado.qrp';
  qrResolucion.QRPrinter.Save(PathQrp);
  qrResolucion.QRPrinter.Free;
  if not FileToPDFSvr(pathQrp,TempPath) then
    raise Exception.Create('Error al generar el PDF');
  sDirecciones := ValorSql('SELECT co_direlectronica '+
                           '  FROM afi.aco_contrato, afi.aem_empresa '+
                           ' WHERE co_idempresa = em_id '+
                           '   AND co_contrato = art.get_vultcontrato(em_cuit) '+
                           '   AND em_cuit = '+SqlValue(pCuit)); //+', construccion@provart.com.ar'
  EnviarMailBD(sDirecciones, 'Nota de Programa de Seguridad Aprobado',[oAutoFirma],'',
               GetAttachments(ChangeFileExt(pathQrp, '.pdf'),0), 0,tcDefault );
end;


end.
