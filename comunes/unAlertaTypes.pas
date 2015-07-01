unit unAlertaTypes;

interface

uses unImpoExpoTypes;


const
  PROCESSREFRESH   : integer = 0;
  VeinticuatroEnMS : integer = 24 * 1000 * 60 * 60;

	TA_IE = 'IE';
	TA_FD = 'FD';


  TEA_DATASETBEFORE    = 'S';  { START  - Antes de Procesar el Dataset }
  TEA_DATASETAFTER     = 'E';  { END    - Después de Procesar el Dataset }
  TEA_RECORDBEFORE     = 'B';  { BEFORE - Antes de Procesar el Dataset }
  TEA_RECORDAFTER      = 'A';  { AFTER  - Después de Procesar el Dataset }

  PARAMETROSFIJOS : array[0..11] of string = (PARAM_USER, PARAM_WINUSER, PARAM_WINPC, PARAM_STARTTIME,
                                              PARAM_ACTIONMODE, PARAM_PROCESS, PARAM_OUTPUT_PATH, PARAM_FILENAME,
                                              PARAM_EV_RECNUMBER, PARAM_EV_RECPROC, PARAM_EV_ERRRORCOUNT,
                                              PARAM_HTML_CSS);

  TEA_MOMENTOS : array[0..2] of String = (TEA_DATASETBEFORE, TEA_RECORDAFTER, TEA_DATASETAFTER);
  TTipoAccion : array[0..1] of string  = (TA_IE, TA_FD);


	TTipoUnidadFrecuencia : array[0..2] of String = ('H', 'M', 'S');

  TF_UNICA = 'U';
  TF_REITERADA = 'R';

  TTipoFrecuencia : array[0..1] of string = (TF_UNICA, TF_REITERADA);

const

  MENSAJEERROR =       'Error al procesar el alerta %s.' + #13#10  + 'El proceso produjo el siguiente mensaje de error: ' +  #13#10 +
                       ' %s '  + #13#10 +
                       'Enviando mensaje notificando a %s.';

  MENSAJEDESACTIVADO = 'Se le informa que el servicio se a reiniciado y el alerta %s, ' +
                       'la cual se encuentra usted como propietario se encuentra desactivada. Si esto es incorrecto, actívela.';


  MENSAJERRORRELOAD =  'El alerta %s, la cual se encuentra usted como propietario, produjo un error inesperado.' + #13#10 +
                       'Para que esta situación se corrija deberá reiniciarse el servicio.';
(*
  MENSAJEERROR =  '{\rtf1\ansi\ansicpg1252\deff0\deflang3082\deflangfe3082\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}{\f1\froman\fprq2\fcharset0 Times New Roman;}}' +
                      '{\*\generator Msftedit 5.41.15.1507;}\viewkind4\uc1\pard\f0\fs18 Error al procesar el alerta \b %s\b0 . El proceso produjo el siguiente mensaje de error: \par ' +
                      '\b\par' +
                      ' %s \b0\par' +
                      '\par' +
                      'Enviando mensaje notificando a \b %s\b0 .\f1\par}';

  MENSAJEDESACTIVADO = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}{\f1\fswiss\fcharset0 Arial;}}' +
                       '{\*\generator Msftedit 5.41.15.1507;}\viewkind4\uc1\pard\lang3082\f0\fs20 Se le informa que el servicio se a reiniciado y el alerta %s, ' +
                       'la cual se encuentra usted como propietario se encuentra desactivada. Si esto es incorrecto, act\''edvela.\par' +
                       '\lang11274\f1\par}';

  MENSAJERRORRELOAD =  '{\rtf1\ansi\ansicpg1252\deff0\deflang3082\deflangfe3082\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
                       '{\*\generator Msftedit 5.41.15.1507;}\viewkind4\uc1\pard\f0\fs18 El alerta %s, la cual se encuentra usted como propietario, produjo un error inesperado.' +
                       '  Para que esta situaci\''f3n se corrija deber\''e1 reiniciarse el servicio.\par}';
*)
type
  TMomentoAccion  = (mDatasetBefore,  mDatasetAfter,   mRecordBefore,   mRecordAfter);



implementation

end.
