unit unConstLegales;

interface

uses SysUtils, ansisql, unDmPrincipal, General, SDEngine, Forms, JvTFManager;

function GetParam(const Clave : string) : variant;
procedure GuardarInfoBloqueo(IdRegistro: integer; Modulo: string; usuario: string);
function GetInfoBloqueo(IdRegistro: integer; Modulo: string): string;
function EliminarInfoBloqueo(dmConnection: TdmPrincipal; IdRegistro: integer; Modulo: string; Usuario: string = ''): string;
function Is_SectorLegal: Boolean;

const
 NOPERMITIREXPEDIENTE = FALSE;
 NOPERMITIRINSTANCIAS = FALSE;
 PERMITIREXPEDIENTE = TRUE;
 PERMITIRINSTANCIAS = TRUE;
 FIJASENTENCIA     = TRUE;
 NOFIJASENTENCIA    = FALSE;

 MEDIACIONPRIVADA = '1';
 MEDIACIONCIVIL = '2';
 MEDIACIONLABORAL = '3';

 NIVELNORMAL = 1;
 NIVELINTERMEDIO = 2;
 NIVELALTO = 3;
 NIVELSUPERIOR = 4;

 CODIGO_ART_PROVINCIA = 51;

 DIRECTORIOARCHIVOSJUICIOS   = 'DIRECTORIOARCHIVOS';
 DIRECTORIOARCHIVOSSUMARIOS  = 'DIRECTORIOARCHIVOSSUMARIOS';
 DIRECTORIOARCHIVOSMEDIACION = 'DIRECTORIOARCHIVOSMEDIACION';
 DIRECTORIOARCHIVOSABOGADO   = 'DIRECTORIOARCHIVOSABOGADO';
 DIRECTORIOARCHIVOSOFICIOS   = 'DIRECTORIOARCHIVOSOFICIOS';
 DIRECTORIOARCHIVOEVENTOSCYQ = 'DIRECTORIOARCHIVOEVENTOSCYQ';
 DIRECTORIOARCHIVOSRECUPEROS = 'DIRECTORIOARCHIVOSRECUPEROS';
 DIRECTORIOARCHIVOSGD        = 'DIRECTORIOARCHIVOSGD';
 DIRECTORIOARCHIVOSPERICIA   = 'DIRECTORIOARCHIVOSPERICIA';

 TEXTOIMPGESDEUDASUP  = '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fnil MS Sans '+
                               'Serif;}{\f1\fnil\fcharset0 Neo Sans;}} \viewkind4\uc1\pard\ltrpar\f0\fs16\par '+
                               '\pard\ltrpar\qr\f1 [FECHA]\par '+
                               '\pard\ltrpar ASEGURADORA DE RIESGOS DEL TRABAJO\par '+
                               'LEY DE RIESGOS DEL TRABAJO N\''b024557\par '+
                               '\b CERTIFICADO DE DEUDA CON CARACTER DE TITULO EJECUTIVO\par \par'+
                               '"PROVINCIA ASEGURADORA DE RIESGOS DEL TRABAJO SOCIEDAD ANONIMA"\b0 '+
                               ',\b  \b0 en uso de las facultades otorgadas por la ley 24.557, en los Arts. 23, inc.3) '+
                               'y 46, apartado 3), CERTIFICA que \b [RAZON SOCIAL]\b0  con \b CUIT\b0  \b [CUIT]\b0  '+
                               'domiciliado en la calle \b [CALLE]\b0  de la localidad de \b [LOCALIDAD]\b0  de la \b '+
                               'PROVINCIA DE\b0  \b [PROVINCIA] (C.P. [CODPOSTAL]\b0 ), adeuda a esta Aseguradora de '+
                               'Riesgos del Trabajo la cantidad de \b PESOS [MONTO]\b0 , suma consolidada de acuerdo a '+
                               'registros obrantes al d\''eda de la fecha en virtud del Contrato de Afiliaci\''f3n N\''b0 '+
                               '\b [CONTRATO]\b0  conforme a la siguiente liquidaci\''f3n: \par \b0\f0\par}';
 TEXTOIMPGESDEUDAINF =  '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fnil MS Sans '+
                               'Serif;}{\f1\fnil\fcharset0 Neo Sans;}} \viewkind4\uc1\pard\ltrpar\f0\fs16\par '+
                               '\pard\ltrpar\f1  '+
                               'Se deja constancia que el presente Certificado de Deuda ha sido conformado al '+
                               '[FECHADEUDA] y en aplicaci\''f3n de lo dispuesto en la normativa vigente (Resoluci\''f3n '+
                               '39/1996 de la SRT, Resoluciones 39/93 SIP, 459/96 y 1253/1998 del ME y OSP de la Naci\''f3n; Res. '+
                               'ME y FP. 841/2010, Decreto 507/93, Ley 11863, Arts. 42 y 55); art\''edculo 23 ley 24.557, '+
                               'ley26773y ccs, y Art. 9 del Decreto 334/1996 y Resoluci\''f3n General D.G.I. N\''ba4180/96.\par '+
                               'En Buenos Aires, a los [FECHAFIN], se expide el presente \b Certificado de '+
                               'Deuda con car\''e1cter de TITULO EJECUTIVO.\par \b0\f0\par}';


implementation

uses
  unSesion;

function GetParam(const Clave : string) : variant;
begin
    Result := ValorSql('select pa_valor from legales.lpa_parametro where pa_clave =  ' + SqlValue(Clave), '');
    if Result = '' then raise Exception.Create('El parámetro ' + Clave + ' no está definido.');
end;

procedure GuardarInfoBloqueo(IdRegistro: integer; Modulo: string; usuario: string);
var
  dmNewConnection: TdmPrincipal;
begin
    try
        try
          Application.CreateForm(TdmPrincipal, dmNewConnection);
          dmNewConnection.BeginTrans;
          EliminarInfoBloqueo(dmNewConnection, IdRegistro, Modulo);
          dmNewConnection.EjecutarSqlSt('INSERT INTO legales.lbr_bloqueoregistro VALUES (' + SqlValue(IdRegistro) + ',' +
                        SqlValue(Modulo) + ', ' + SqlValue(usuario) + ', SYSDATE)');
          dmNewConnection.CommitTrans;
        except
          on E:Exception do begin
            dmNewConnection.Rollback;
            raise Exception.Create('No se pudo actualizar la tabla de bloqueos. ' + #13#10 + E.Message);
          end;
        end;
    finally
      dmNewConnection.Free;
    end;
end;

function GetInfoBloqueo(IdRegistro: Integer; Modulo: String): String;
begin
	try
  	Result := ValorSql('SELECT br_usuario FROM legales.lbr_bloqueoregistro WHERE br_idregistro = ' + SqlValue(IdRegistro) +
                  		   ' AND br_modulo = ' + SqlValue(Modulo));
  except
  	on E:Exception do
    	raise Exception.Create('No se pudo consultar la tabla de bloqueos. ' + #13#10 + E.Message);
  end;
end;

function EliminarInfoBloqueo(dmConnection: TdmPrincipal; IdRegistro: integer; Modulo: string; Usuario:string = ''): string;
begin
      dmConnection.EjecutarSqlSt('DELETE FROM legales.lbr_bloqueoregistro WHERE br_idregistro = ' + SqlValue(IdRegistro) +
                    ' AND br_modulo = ' + SqlValue(Modulo) + iif((Usuario<>''), (' AND br_usuario = ' + SqlValue(Usuario)), ''));
end;

function Is_SectorLegal: Boolean;
begin
  Result := (Sesion.Sector = 'LEGAL');
end;

end.
