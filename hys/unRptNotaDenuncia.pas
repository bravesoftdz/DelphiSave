unit unRptNotaDenuncia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TrptNotaDenuncia = class(TForm)
    rptEventos: TQuickRep;
    qrbTitulo: TQRBand;
    qrbDetalle: TQRBand;
    QRShape11: TQRShape;
    qrdNroEvento: TQRDBText;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    qrParteSuperior: TQRRichText;
    QRGroup2: TQRGroup;
    qriLogo: TQRImage;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrParteInferior: TQRRichText;
    sdqReporte: TSDQuery;
    sdqReporteOB_DESCRIPCION: TStringField;
    sdqReporteRL_CONTRATO: TFloatField;
    sdqReporteRL_ESTABLECI: TFloatField;
    sdqReporteES_NOMBRE: TStringField;
    sdqReporteEM_CUIT: TStringField;
    sdqReporteEM_NOMBRE: TStringField;
    QRDBText10: TQRDBText;
    qcbValoresYPeriodos: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load(Contrato : Integer);
  end;

var
  rptNotaDenuncia: TrptNotaDenuncia;

const
  sCabecera = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\fswiss\fcharset0 '+
              'Arial;}}{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\qr\f0\fs20 Ciudad Aut\''f3noma de Buenos '+
              'Aires,:FECHA.\par\pard\par\par '+
              'Ref.: \b Inconsistencia en Formulario de Relevamiento de Riesgos Laborales Res. SRT 463/09 \par \b0\par '+
              'Estimado cliente:\par\par \pard\sa120 En relaci\''f3n a la Resoluci\''f3n SRT 463/09 cumplimos en '+
              'recordarle que al momento de su afiliaci\''f3n o de renovaci\''f3n de contrato Ud. debe entregar un '+
              'Formulario de Relevamiento de Riesgos Laborales por cada uno de los establecimientos activos de su empresa, '+
              'siempre y cuando a\''fan no lo haya presentado, utilizando el formulario que corresponda de acuerdo a la actividad '+
              'del establecimiento, independientemente de la cantidad de c\''e1pitas, tal como se expresa en la Res SRT '+
              '741/2010 modificatoria de la Res 463/2009 en el Anexo VI Art. 1 Inc. c: :"El R.G.R.L debe ser completado '+
              'para cada establecimiento del empleador, independientemente de la cantidad de trabajadores, caracter\''edsticas '+
              'o riesgos higi\''e9nicos presentes..."\par Ante la incorrecta presentaci\''f3n o confecci\''f3n del '+
              'formulario, ser\''e1 necesaria la reelaboraci\''f3n del mismo para ser nuevamente remitido a Provincia '+
              'ART, y para su posterior validaci\''f3n.\par Le informamos que posee formularios incorrectamente confeccionados '+
              'y por lo tanto deber\''e1 renviar la documentaci\''f3n correctamente confeccionada.\par '+
              'En el cuadro a continuaci\''f3n, podr\''e1 observar el detalle de los establecimientos y el '+
              'detalle de las inconsistencias que posee en cada uno de ellos.\par \ul A saber:\par\pard\ulnone\f1\par}';

  sPiePagina = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\fswiss\fcharset0 '+
               'Arial;}} {\colortbl ;\red0\green0\blue255;} {\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\sa120\'+
               'f0\fs20 Usted puede acceder a descargar el formulario RGRL en nuestro sitio web con su CUIT '+
               'y n\''famero de contrato en: http://www.provinciart.com.ar/modules/formulario_establecimientos/login.php y '+
               'all\''ed mismo encontrar\''e1 un instructivo para completarlo y tambi\''e9n podr\''e1 consultar el '+
               'Formulario de Rectificaci\''f3n de Datos y Establecimientos para verificar cu\''e1les son sus establecimientos '+
               'activos. Recuerde que en el caso de las Obras Civiles, s\''f3lo deber\''e1 presentarlo cuando la misma se '+
               'extienda por m\''e1s de un a\''f1o desde la fecha de afiliaci\''f3n o renovaci\''f3n de contrato.\par '+
               'Deber\''e1n remitirse los originales de los formularios a PROVINCIA ART- Gerencia Prevenci\''f3n: '+
               'Carlos Pellegrini 91 \endash  2\''ba Piso- Ciudad Aut\''f3noma de Buenos Aires- C.P. 1009, \b con el '+
               'correspondiente nivel de firmas\b0 .\par '+
               'Ante cualquier duda o consulta puede comunicarse con Atenci\''f3n al Cliente al tel\''e9fono 0800-333-1278 '+
               'o por mail a info@provart.com.ar\par '+
               '\par \par Ing. Guido Dragani\par Gerencia Prevenci\''f3n\par \f1\par} ';

implementation

uses
  unVisualizador, ArchFuncs, unDmPrincipal, StrFuncs, unExportPDF, ansiSql;
  
{$R *.dfm}

procedure TrptNotaDenuncia.Load(Contrato : Integer);
var
  Path : String;
  valorContrato, pathDestino, sCuit: String;
  sCabeceraReplace : String;
  AStream, APieStream: TStringStream;
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  sdqReporte.ParamByName('contrato').AsInteger := Contrato;
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
  sCuit := ValorSql(' SELECT em_cuit '+
                    '   FROM afi.aem_empresa, afi.aco_contrato '+
                    '  WHERE co_idempresa = em_id '+
                    '    AND co_contrato = '+SqlValue(Contrato));

  Path := TempPath+sCuit+'_NotaDenuncia.qrp';
  rptEventos.QRPrinter.Save(Path);
  sdqReporte.close;

  pathDestino := ValorSql(
    ' SELECT pa_valor '+
    '   FROM hys.hpa_parametro '+
    '  WHERE pa_clave = ''CARPETAREPORTES'' ');

  valorContrato := LPad(copy(IntToStr(contrato),Length(IntToStr(contrato))-2,3),'0',3);
  pathDestino := IncludeTrailingBackslash(pathDestino)+valorContrato+'\';
  ForceDirectories(pathDestino);
  if not FileToPDFSvr(Path,pathDestino) then
    raise Exception.Create('Error al generar el PDF');

end;

end.
