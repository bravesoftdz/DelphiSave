unit unRptNotaDenunciaRiegoInvalido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, SDEngine;

type
  TrptNotaDenunciaRiesgoInvalido = class(TForm)
    sdqReporte: TSDQuery;
    rptEventos: TQuickRep;
    qrbTitulo: TQRBand;
    qrParteSuperior: TQRRichText;
    qriLogo: TQRImage;
    qrbDetalle: TQRBand;
    QRShape1: TQRShape;
    qrdNroEvento: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    SummaryBand1: TQRBand;
    qrParteInferior: TQRRichText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    qcbValoresYPeriodos: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    sdqReporteDESCRIPCION: TStringField;
    sdqReporteIR_CUIT: TStringField;
    sdqReporteIR_ESTABLECI: TFloatField;
    sdqReporteES_NOMBRE: TStringField;
    sdqReporteEM_CUIT: TStringField;
    sdqReporteEM_NOMBRE: TStringField;
  private

    { Private declarations }
  public
     procedure Load(sCUIT : String);
    { Public declarations }
  end;

var
  rptNotaDenunciaRiesgoInvalido: TrptNotaDenunciaRiesgoInvalido;


const
  sCabecera = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fnil\fprq2\fcharset0 Neo Sans;}{\f1\fswiss\fcharset0 Arial;}} '+
              '{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\qr\f0\fs18 Ciudad Aut\''f3noma de Buenos Aires, :FECHA.\par '+
              '\pard\par '+
              '\par '+
              'Estimado cliente:\par '+
              '\par '+
              'Ref.: \b\fs20 No corresponden ESSOP con actividad declarada y el formulario presentado est\''e1 incorrectamente confeccionado seg\''fan los datos consignados en el formulario de Resoluci\''f3n SRT 37/2010.\b0\fs18\par '+
              '\par '+
              '\pard\qj En relaci\''f3n a la Resoluci\''f3n SRT 37/2010, que establece los ex\''e1menes de salud,  le informamos que es responsabilidad '+
              'de la empresa suministrar a la ART la informaci\''f3n pertinente a la n\''f3mina de trabajadores expuestos a cada uno de los agentes de riesgo, para todos los establecimientos declarados por Ud.\par '+
              '\par '+
              'As\''ed mismo ante la incorrecta confecci\''f3n o no correspondencia de alg\''fan dato consignado en dicho '+
              'formulario ser\''e1 necesaria la rectificaci\''f3n o ratificaci\''f3n de la informaci\''f3n declarada, en este \''faltimo caso le solicitamos env\''ede la documentaci\''f3n respaldatoria que lo acredite.\par '+
              '\par '+
              'Le informamos que el formulario que Ud. ha presentado presenta inconsistencia en los siguientes puntos:\par '+
              '\pard\fi-360\li720\qj -\tab\i No corresponde ESSOP con actividad declarada por empresa.\par '+
              '\i0 -\tab\i Formulario inv\''e1lido (corresponde a datos de firma, incongruencias entre empleados y ESSOP, faltan datos de la empresa)\par '+
              '\pard\qj\ul\i0 A saber:\par '+
              '\pard\ulnone\f1\fs20\par '+
              '} ';

  sPiePagina = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fnil\fprq2\fcharset0 Neo Sans;}{\f1\froman\fcharset0 Neo Sans medium;}{\f2\fswiss\fcharset0 Arial;}} '+
               '{\colortbl ;\red0\green0\blue255;} '+
               '{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\qj\f0\fs18 Le solicitamos remitan la documentaci\''f3n a la mayor brevedad '+
               'posible, ya que la no presentaci\''f3n, o presentaci\''f3n incorrecta, de dicho informaci\''f3n tendr\''e1 que ser informada ante la Superintendencia de Riesgo de Trabajo.\par '+
               '\par '+
               'Tenga en cuenta que en caso de \b no\b0  tener personal expuesto, solamente deben presentar el formulario \f1 Exposici\''f3n '+
               'a Riesgos Qu\''edmicos, F\''edsicos y/o Biol\''f3gicos\f0  cruzado y completo en su encabezado y firmado por el '+
               'responsable.-\par '+
               '\pard En caso de contar con personal expuesto, deben completar el formulario \f1 Exposici\''f3n a '+
               'Riesgos Qu\''edmicos, F\''edsicos y/o Biol\''f3gicos \f0 tal como se inform\''f3 anteriormente pero indicando la cantidad de '+
               'personal expuesto por ESOP, y en el formulario \f1 N\''f3mina de Personal Expuesto\f0  indicar los datos de los trabajadores y sus '+
               'correspondientes c\''f3digos de ESOP. Este ultimo enviarlo v\''eda E-Mail a '+
               '{\field{\*\fldinst{HYPERLINK "mailto:prevenci\''f3n@provart.com.ar" }}{\fldrslt{\cf1\ul prevenci\''f3n@provart.com.ar}}}\cf0\ulnone\f0\fs18 , '+
               'indicando en el asunto "Resoluci\''f3n SRT 37/10 N\''f3mina de Personal Expuesto".\par '+
               '\pard\sa120\qj\par '+
               '\pard Usted puede descargar ambos formularios en nuestro sitio '+
               'web: http://www.provinciart.com.ar/modules/varios/descargables/ProvinciaART_Nomina_personal_expuesto.xls y \lang2058 http://www.provinciart.com.ar/modules/varios/descargables/Provincia_ART_Form_Exp_a_riesgos.pdf .\par '+
               '\pard\sa120\qj\lang11274  \par '+
               '\pard\qj Para conocer  sus establecimientos Activos ingrese en nuestra p\''e1gina en la secci\''f3n \ldblquote '+
               'Acceso Exclusivo\rdblquote  ingresando su CUIT y su N\''ba de Contrato.\par '+
               '\par '+
               'Le solicitamos tenga a bien regularizar su situaci\''f3n y remitir los originales de los formularios solicitados a '+
               'PROVINCIA ART- Gerencia Prevenci\''f3n: Carlos Pellegrini 91 \endash  2\''ba Piso- Ciudad Aut\''f3noma de Buenos '+
               'Aires- C.P. 1009. Se dar\''e1 por cumplida la presentaci\''f3n de este formulario cuando el mismo sea recibido en esta '+
               'ART.\par '+
               '\pard\sa120\qj\par '+
               'Ante cualquier duda o consulta comun\''edquese con el sector por tel\''e9fono al (011)5166-4500 int. 4510 o por mail a prevencion@provart.com.ar\par '+
               '\pard\par '+
               'Saluda atentamente, \par '+
               '\par '+
               '\par '+
               '\par '+
               '\b Ing. Guido Dragani\par '+
               'Gerencia de Prevenci\''f3n\par '+
               'PROVINCIA ART\par '+
               '\b0\f2\fs20\par '+
               '}';

implementation

{$R *.dfm}

uses
  unVisualizador, ArchFuncs, unDmPrincipal, StrFuncs, unExportPDF, ansiSql;

procedure TrptNotaDenunciaRiesgoInvalido.Load(sCUIT : String);
var
  Path : String;
  valorContrato, pathDestino : String;
  iContrato : Integer;
  sCabeceraReplace : String;
  AStream, APieStream: TStringStream;
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  sdqReporte.ParamByName('cuit').AsString := sCUIT;
  sdqReporte.Open;
  sCabeceraReplace := sCabecera;
  ReplaceString(sCabeceraReplace,':FECHA',ValorSql('SELECT TO_CHAR(SYSDATE, ''DD'') '+
                                                   '       || '' de '' || INITCAP(TO_CHAR(SYSDATE, ''MONTH'')) '+
                                                   '       || '' de '' || TO_CHAR(SYSDATE, ''YYYY'') FROM DUAL '));
  AStream := TStringStream.Create(sCabeceraReplace);
  APieStream := TStringStream.Create(sPiePagina);
  qrParteSuperior.Lines.LoadFromStream(AStream);
  qrParteInferior.Lines.LoadFromStream(APieStream);
  rptEventos.Prepare;
  iContrato := ValorSql('SELECT art.get_vultcontrato('+SqlValue(sCUIT)+') FROM dual ');

  Path := TempPath+sCuit+'_NotaDenunciaRiesgoInvalido.qrp';
  rptEventos.QRPrinter.Save(Path);
  sdqReporte.close;

  pathDestino := ValorSql(
    ' SELECT pa_valor '+
    '   FROM hys.hpa_parametro '+
    '  WHERE pa_clave = ''CARPETASERVICIO'' ');

  valorContrato := LPad(copy(IntToStr(icontrato),Length(IntToStr(icontrato))-2,3),'0',3);
  pathDestino := IncludeTrailingBackslash(pathDestino)+valorContrato+'\';
  ForceDirectories(pathDestino);
  if not FileToPDFSvr(Path,pathDestino) then
    raise Exception.Create('Error al generar el PDF');

end;


end.
