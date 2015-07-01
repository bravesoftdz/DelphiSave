unit unRptConsultoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, DB, SDEngine, ExtCtrls;

type
  TrptConsultoria = class(TForm)
    qrHoja1: TQuickRep;
    qrbTitle: TQRBand;
    CompositeReport: TQRCompositeReport;
    sdqPerfilEmpresa: TSDQuery;
    qrTextoComienzo: TQRRichText;
    qrHoja2: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrHoja3: TQuickRep;
    qrbDetalle: TQRBand;
    qrdNroEvento: TQRDBText;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape6: TQRShape;
    QRLabel14: TQRLabel;
    QRShape7: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrHoja4: TQuickRep;
    QRBand3: TQRBand;
    QRDBText9: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRShape12: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape13: TQRShape;
    QRLabel20: TQRLabel;
    QRShape15: TQRShape;
    QRLabel16: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrHoja5: TQuickRep;
    QRBand5: TQRBand;
    QRDBText15: TQRDBText;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand6: TQRBand;
    QRShape28: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape29: TQRShape;
    QRLabel26: TQRLabel;
    QRShape30: TQRShape;
    QRLabel27: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrHoja6: TQuickRep;
    QRBand7: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qrHoja14: TQuickRep;
    QRBand8: TQRBand;
    QRDBText29: TQRDBText;
    QRShape36: TQRShape;
    QRDBText30: TQRDBText;
    QRShape38: TQRShape;
    QRDBText32: TQRDBText;
    QRBand9: TQRBand;
    QRShape41: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape42: TQRShape;
    QRLabel42: TQRLabel;
    QRShape44: TQRShape;
    qrHoja15: TQuickRep;
    QRBand10: TQRBand;
    qrDesarrolloPorEstab: TQRRichText;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape45: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape43: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel63: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRLabel55: TQRLabel;
    qrHoja16: TQuickRep;
    QRBand11: TQRBand;
    QRDBText33: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    sdqApoderadoEmpresa: TSDQuery;
    sdqResHyS: TSDQuery;
    sdqResML: TSDQuery;
    sdqSerHyS: TSDQuery;
    sdqSerML: TSDQuery;
    qrHoja7: TQuickRep;
    QRBand14: TQRBand;
    QRShape69: TQRShape;
    QRDBText37: TQRDBText;
    QRShape70: TQRShape;
    QRDBText39: TQRDBText;
    QRBand15: TQRBand;
    QRLabel7: TQRLabel;
    qrHoja8: TQuickRep;
    QRBand12: TQRBand;
    QRShape71: TQRShape;
    QRDBText22: TQRDBText;
    QRShape72: TQRShape;
    QRDBText36: TQRDBText;
    QRBand13: TQRBand;
    QRLabel57: TQRLabel;
    qrHoja9: TQuickRep;
    QRBand16: TQRBand;
    QRShape73: TQRShape;
    QRDBText38: TQRDBText;
    QRShape74: TQRShape;
    QRDBText40: TQRDBText;
    QRBand17: TQRBand;
    QRLabel59: TQRLabel;
    qrHoja10: TQuickRep;
    QRBand18: TQRBand;
    QRShape75: TQRShape;
    QRDBText23: TQRDBText;
    QRShape76: TQRShape;
    QRDBText24: TQRDBText;
    QRBand19: TQRBand;
    QRLabel61: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText26: TQRDBText;
    sdqCaracterizacionActivdad: TSDQuery;
    sdqCaracterizacionProvincia: TSDQuery;
    sdqCaracterizacionCOGB: TSDQuery;
    sdqPorcentajeSexo: TSDQuery;
    qrHoja11: TQuickRep;
    QRBand20: TQRBand;
    QRShape77: TQRShape;
    QRDBText28: TQRDBText;
    QRShape78: TQRShape;
    QRDBText41: TQRDBText;
    QRBand21: TQRBand;
    QRLabel38: TQRLabel;
    sdqPorcentajeAntiguedad: TSDQuery;
    qrHoja12: TQuickRep;
    QRBand22: TQRBand;
    QRShape79: TQRShape;
    QRDBText42: TQRDBText;
    QRShape80: TQRShape;
    QRDBText43: TQRDBText;
    QRBand23: TQRBand;
    QRLabel65: TQRLabel;
    sdqPorcentajeDistribucionEdad: TSDQuery;
    qrHoja13: TQuickRep;
    QRBand24: TQRBand;
    QRShape81: TQRShape;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRBand25: TQRBand;
    QRLabel66: TQRLabel;
    sdqPorcentajePuestoTarea: TSDQuery;
    sdqEjecutivoGestor: TSDQuery;
    sdqPreventoresEstab: TSDQuery;
    sdqRARS: TSDQuery;
    QRDBText46: TQRDBText;
    QRShape1: TQRShape;
    QRShape8: TQRShape;
    QRShape21: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel67: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    procedure CompositeReportAddReports(Sender: TObject);
  private

    { Private declarations }
  public
    procedure Load(idempresa: Integer);
    { Public declarations }
  end;

var
  rptConsultoria: TrptConsultoria;

const
  sTextoComienzo = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}'+
                    '{\f1\fnil\fprq2\fcharset2 Wingdings;}{\f2\fswiss\fcharset0 Arial;}}{\colortbl ;\red0\green0\blue0;}'+
                    '{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\cf1\b\f0\fs20 INFORME/CRITERIOS RELEVADOS\par'+
                    '\pard\sa200\sl276\slmult1\cf0\b0\par '+
                    'El presente informe pretende poner de manifiesto el estado de situaci\''f3n de la empresa bajo an\''e1lisis. '+
                    'Existen para ello dos caracter\''edsticas a evaluar:\par '+
                    '\b Estado de cumplimiento de las obligaciones del empleador\par '+
                    '\b0 Se refiere a las obligaciones referidas la entrega de documentaci\''f3n, normalizaci\''f3n estado de cumplimiento '+
                    'de las condiciones de seguridad e higiene y de presentaci\''f3n de personal para la realizaci\''f3n de los ex\''e1menes peri\''f3dicos.\par '+
                    '\b Estado de cumplimiento de las obligaciones de la ART\par'+
                    '\b0 Se refiere a las obligaciones de la ART en cuanto a la realizaci\''f3n de las tareas de seguridad e '+
                    'higiene correspondiente a cada empresa, a los plazos para llevarlas a cabo y a la gesti\''f3n comercial.\par'+
                    '\pard\fi-360\li720\sa200\sl276\slmult1\f1\''a7\tab\f0 Gesti\''f3n Comercial: se refiere al cumplimiento en '+
                    'tiempo y forma de:\par '+
                    'A.\tab Visitas seg\''fan periodicidad establecida para la empresa por la ART. La misma es superadora de la fijada por la normativa vigente.\par '+
                    'B.\tab Capacitaciones diferenciales en la empresa de modo de alcanzar un % de cobertura adecuado y consensuado con la empresa.\par '+
                    'C.\tab Disponibilidad de los RAR mediante el asesoramiento personalizado del cliente.\par '+
                    'D.\tab Realizaci\''f3n de los ex\''e1menes peri\''f3dicos con las premisas de calidad de atenci\''f3n '+
                    'adecuadas.\par '+
                    '\pard\li720\sa200\sl276\slmult1\par '+
                    '\pard\fi-360\li720\sa200\sl276\slmult1\f1\''a7\tab\f0 Normativa: se refiere al cumplimiento en tiempo '+
                    'y forma de:\par '+
                    'A.\tab Visitas seg\''fan periodicidad establecida por la normativo (RES SRT 463/09)\par '+
                    'B.\tab Cumplimiento de las tareas definidas por la normativa\par '+
                    'C.\tab Cumplimiento en t\''e9rmino de las tareas\par '+
                    'D.\tab Capacitaciones en todos los establecimientos sobre riesgos espec\''edficos.\par '+
                    '\pard\sa200\sl276\slmult1 Al finalizar cada an\''e1lisis se dejaran sugerencias para mejorar '+
                    'la eficiencia de la gesti\''f3n. Toda la informaci\''f3n aqu\''ed brindada podr\''e1 ser obtenida '+
                    'del empleador entendiendo que la misma es de su conocimiento. En caso contrario se referenciaran otras '+
                    'fuentes.\par '+
                    '\pard\cf1 Ex\''e1menes M\''e9dicos Peri\''f3dicos\par '+
                    '\par '+
                    'Tienen por objetivo la detecci\''f3n precoz de afecciones producidas por aquellos agentes de riesgo '+
                    'determinados por el Decreto n\''ba 658/96 y el 1167/03 a los cuales el trabajador se encuentre expuesto '+
                    'con motivo de sus tareas, con el fin de evitar el desarrollo de enfermedades profesionales, debiendo '+
                    'efectuarse con las frecuencias determinadas por el riesgo, sea semestral o anual.\par '+
                    '\par '+
                    'Breve detalle de las etapas\par '+
                    '\par '+
                    '\pard\fi-360\li720 1.\tab Anualmente \endash  m\''e1s precisamente por un per\''edodo no '+
                    'mayor a un a\''f1o - los empleadores deber\''e1n confeccionar la N\''f3mina de Trabajadores Expuestos a '+
                    'Agentes \cf0 de Riesgos (NTEAR) de cada establecimiento por medio de un especialista en Higiene y Seguridad '+
                    'en el trabajo \par '+
                    '\pard\par '+
                    '\pard\li708 La NTEAR es confeccionada en base a la informaci\''f3n suministrada por la empresa por medio de '+
                    'los empleados que designe, con la suficiente capacidad y autoridad como para que los datos all\''ed volcados sean '+
                    'confiables y reales. \par '+
                    '\pard\par '+
                    '\pard\li708 De la correcta confecci\''f3n de la NTEAR, depender\''e1 una adecuada vigilancia de la salud de los trabajadores. \par '+
                    '\pard\par '+
                    '\pard\fi-360\li720 2.\tab S\''f3lo se har\''e1n EMP a los trabajadores considerados expuestos a alg\''fan agente de riesgo '+
                    'causante de enfermedad profesional en los t\''e9rminos del Decreto 658/96 y sus modificatorias, que se encuentre en '+
                    'la n\''f3mina declarada por la empresa al momento del relevamiento de la informaci\''f3n y que cumplan los requisitos de '+
                    'antig\''fcedad en el puesto y de ingreso a la empresa. \par'+
                    '\pard\li720\par '+
                    '\pard\fi-360\li720 3.\tab La ART cuenta con 45 d\''edas desde la recepci\''f3n de la n\''f3mina para asignar un prestador, '+
                    'a partir de dicho momento el cliente dispondr\''e1 de 90 d\''edas dentro de los cuales acordar\''e1 una fecha para asistir '+
                    'a realizarse los ex\''e1menes.\par '+
                    '\pard\par '+
                    '\par '+
                    '\pard\fi-360\li720 4.\tab La falta de presentaci\''f3n en tiempo y forma de la NTEAR implicar\''e1 la notificaci\''f3n a la SRT. \par '+
                    '\pard\cf1\par '+
                    'Normativa aplicable \par '+
                    '\par '+
                    'La Rep\''fablica Argentina tiene una vasta tradici\''f3n legal en materia de Higiene y Seguridad. Desde 1972 se aplica la Ley 19.587 en '+
                    'todo el pa\''eds. Fue reglamentada siete a\''f1os m\''e1s tarde mediante el decreto 351/79 con casi 230 art\''edculos que abarcan los riesgos '+
                    'principalmente industriales. Para considerar la especificidad de otras actividades, fueron promulg\''e1ndose otros reglamentos como: \par '+
                    'Decreto 658/96 Listado de enfermedades profesionales. \par '+
                    'Decreto 1167/03 Modificaci\''f3n del decreto 658/96. Inclusi\''f3n de hantavirus y trypasoma crucis. \par '+
                    'Decreto 1338/96 Modificaci\''f3n ley 19.587. Servicios de Higiene y Seguridad y de Medicina del Trabajo. \par '+
                    'Res. SRT 37/10 Ex\''e1menes de Salud Ocupacional. \par '+
                    'Res. SRT 463/09 Nuevo contrato de afiliaci\''f3n. Relevamiento General de Riesgos Laborales (RGRL). \par '+
                    'Res. SRT 301/11 Denuncias de incumplimientos por problemas en las NTEAR \par '+
                    'Disp. G P y C N\''b01 5/05 Codificaci\''f3n de los agentes de riesgos de enfermedad profesional.\cf0\f2\par '+
                    '}';

sDesarrolloPorEstab = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}{\f1\fswiss\fcharset0 Arial;}} '+
                       '{\colortbl ;\red0\green0\blue0;} '+
                       '{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\cf1\f0\fs20 EX\''c1MENES M\''c9DICOS PERI\''d3DICOS\par '+
                       '\par '+
                       '\b DESARROLLO POR ESTABLECIMIENTO\par '+
                       '\b0\par '+
                       'ESTAD\''cdSITCA GENERAL\par '+
                       'VARIABLES\par '+
                       '\pard\fi-360\li720 A.\tab CANTIDAD DE ESTABLECIMIENTOS  DE LA EMPRESA\par '+
                       'B.\tab CANTIDAD DE PUESTO/TAREA \par '+
                       'C.\tab CANTIDAD DE ESTABLECIMIENTOS RELEVADOS\par '+
                       'D.\tab CANTIDAD DE ESTABLECIMIENTOS RELEVADOS CON PERSONAL EXPUESTO\par '+
                       'E.\tab CANTIDAD DE ESTABLECIMIENTOS RELEVADOS SIN PERSONAL EXPUESTO\par '+
                       'F.\tab CANTIDAD DE ESTABLECIMIENTOS SIN RELEVAR\par '+
                       'G.\tab CANTIDAD DE PERSONAL EXPUESTO\par '+
                       'H.\tab CANTIDAD DE PERSONAL DEL ES\tab TABLECIMIENTO\par '+
                       'I.\tab CANTIDAD DE PERSONAL TOTAL\par '+
                       'J.\tab CANTIDAD DE PERSONAL ASIGNADO\par '+
                       'K.\tab CANTIDAD DE PERSONAL CON TODOS LOS EX\''c1MENES REALIZADOS\par '+
                       'L.\tab CANTIDAD DE PERSONAL SIN EX\''c1MENES REALIZADOS (ASIGNADOS SIN REALIZAR= AUSENTES)\par '+
                       'M.\tab CANTIDAD DE PERSONAL CON REALIZACI\''d3N PARCIAL DE EX\''c1MENES\par '+
                       'N.\tab LOTE/FECHA DE RAR/FECHA DE ASIGNACI\''d3N DE PRESTADOR/FECHA DE REALIZACI\''d3N\par '+
                       '\pard\par '+
                       'RELACIONES\par '+
                       '\cf0\f1\par '+
                       '}';


implementation

uses
  unVisualizador, ArchFuncs, unExportPDF;

{$R *.dfm}

procedure TrptConsultoria.Load(idempresa : Integer);
var
  aStreamComienzo : TStringStream;
  Path : String;
begin
  aStreamComienzo := TStringStream.Create(sTextoComienzo);
  qrTextoComienzo.Lines.LoadFromStream(aStreamComienzo);
  aStreamComienzo := TStringStream.Create(sDesarrolloPorEstab);
  qrDesarrolloPorEstab.Lines.LoadFromStream(aStreamComienzo);

  sdqPerfilEmpresa.ParamByName('idempresa').AsInteger := idempresa;
  sdqApoderadoEmpresa.ParamByName('idempresa').AsInteger := idempresa;
  sdqResHyS.ParamByName('idempresa').AsInteger := idempresa;
  sdqResML.ParamByName('idempresa').AsInteger := idempresa;
  sdqSerHyS.ParamByName('idempresa').AsInteger := idempresa;
  sdqSerML.ParamByName('idempresa').AsInteger := idempresa;
  sdqCaracterizacionActivdad.ParamByName('idempresa').AsInteger := idempresa;
  sdqCaracterizacionProvincia.ParamByName('idempresa').AsInteger := idempresa;
  sdqCaracterizacionCOGB.ParamByName('idempresa').AsInteger := idempresa;
  sdqPorcentajeSexo.ParamByName('idempresa').AsInteger := idempresa;
  sdqPorcentajeAntiguedad.ParamByName('idempresa').AsInteger := idempresa;
  sdqPorcentajeDistribucionEdad.ParamByName('idempresa').AsInteger := idempresa;
  sdqPorcentajePuestoTarea.ParamByName('idempresa').AsInteger := idempresa;
  sdqEjecutivoGestor.ParamByName('idempresa').AsInteger := idempresa;
  sdqPreventoresEstab.ParamByName('idempresa').AsInteger := idempresa;
  sdqRARS.ParamByName('idempresa').AsInteger := idempresa;

  sdqPerfilEmpresa.Open;
  sdqApoderadoEmpresa.Open;
  sdqResHyS.Open;
  sdqResML.Open;
  sdqSerHyS.Open;
  sdqSerML.Open;
  sdqCaracterizacionActivdad.Open;
  sdqCaracterizacionProvincia.Open;
  sdqCaracterizacionCOGB.Open;
  sdqPorcentajeSexo.Open;
  sdqPorcentajeAntiguedad.Open;
  sdqPorcentajeDistribucionEdad.Open;
  sdqPorcentajePuestoTarea.Open;
  sdqEjecutivoGestor.Open;
  sdqPreventoresEstab.Open;
  sdqRARS.Open;

  CompositeReport.Prepare;

  Path := TempPath+IntToStr(idempresa)+'_archivoconsultoria.qrp';
//  Visualizar(Path, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB]);
  CompositeReport.QRPrinter.Free;

  if not FileToPDFSvr(path,TempPath+IntToStr(idempresa)+'_archivoconsultoria.pdf') then
    raise Exception.Create('Error al generar el PDF');

  sdqPerfilEmpresa.Close;
  sdqApoderadoEmpresa.Close;
  sdqResHyS.Close;
  sdqResML.Close;
  sdqSerHyS.Close;
  sdqSerML.Close;
  sdqCaracterizacionActivdad.Close;
  sdqCaracterizacionProvincia.Close;
  sdqCaracterizacionCOGB.Close;
  sdqPorcentajeSexo.Close;
  sdqPorcentajeAntiguedad.Close;
  sdqPorcentajeDistribucionEdad.Close;
  sdqPorcentajePuestoTarea.Close;
  sdqEjecutivoGestor.Close;
  sdqPreventoresEstab.Close;
  sdqRARS.Close;
end;

procedure TrptConsultoria.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add(qrHoja1);
  CompositeReport.Reports.Add(qrHoja2);
  CompositeReport.Reports.Add(qrHoja3);
  CompositeReport.Reports.Add(qrHoja4);
  CompositeReport.Reports.Add(qrHoja5);
  CompositeReport.Reports.Add(qrHoja6);
  CompositeReport.Reports.Add(qrHoja7);
  CompositeReport.Reports.Add(qrHoja8);
  CompositeReport.Reports.Add(qrHoja9);
  CompositeReport.Reports.Add(qrHoja10);
  CompositeReport.Reports.Add(qrHoja11);
  CompositeReport.Reports.Add(qrHoja12);
  CompositeReport.Reports.Add(qrHoja13);
  CompositeReport.Reports.Add(qrHoja14);
  CompositeReport.Reports.Add(qrHoja15);
  CompositeReport.Reports.Add(qrHoja16);
end;

end.
