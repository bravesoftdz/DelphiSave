unit unComunesEmisionCliente;

interface
uses
  sysUtils;

  const FA_ID               = 'FA_ID';
  const FA_CONTRATO         = 'FA_CONTRATO';
  const FA_VIGENCIADESDE    = 'FA_VIGENCIADESDE';
  const FA_INICIOACTIVIDAD  = 'FA_INICIOACTIVIDAD';
  const FA_EMPLEADOS        = 'FA_EMPLEADOS';
  const FA_MASA             = 'FA_MASA';
  const FA_SUSS             = 'FA_SUSS';
  const FA_SUSSDESCRIP      = 'FA_SUSSDESCRIP';
  const FA_SECTOR           = 'FA_SECTOR';
  const FA_SECTORDESCRIP    = 'FA_SECTORDESCRIP';
  const FA_FECHAALTA        = 'FA_FECHAALTA';
  const FA_USUALTA          = 'FA_USUALTA';
  const FA_FECHAMODIF       = 'FA_FECHAMODIF';
  const FA_USUMODIF         = 'FA_USUMODIF';
  const FA_FECHABAJA        = 'FA_FECHABAJA';
  const FA_USUBAJA          = 'FA_USUBAJA';
  const FA_INICIOEMPLEADOR  = 'FA_INICIOEMPLEADOR';
  const CO_VIGENCIADESDE    = 'CO_VIGENCIADESDE';
  const CO_TOTEMPLEADOS     = 'CO_TOTEMPLEADOS';
  const CO_MASATOTAL        = 'CO_MASATOTAL';
  const CO_FECHAINSCRIPCION = 'CO_FECHAINSCRIPCION';

  const EM_CUIT             = 'EM_CUIT';
  const EM_NOMBRE           = 'EM_NOMBRE';
  const EM_FEINICACTIV      = 'EM_FEINICACTIV';
  const EM_SUSS             = 'EM_SUSS';
  const EM_SECTOR           = 'EM_SECTOR';

  const DIF_SUSS            = 'DIF_SUSS';
  const DIF_SECTOR          = 'DIF_SECTOR';
  const DIF_TOPEMASA        = 'DIF_TOPEMASA';
  const SUSS_EMP_DESC       = 'SUSS_EMP_DESC';
  const SECT_EMP_DESC       = 'SECT_EMP_DESC';
  const AFILIA_MASADESC     = 'AFILIA_MASADESC';
  const MASAEMISION         = 'MASAEMISION';
  const EMISON_MASADESC     = 'EMISON_MASADESC';
  const TOPEMASA            = 'TOPEMASA';
  
  const TBL_FORMULARIOAFI   = 'EMI.IFA_FORMULARIOAFI';
  const EMI_SEQ_IFA_ID      = 'EMI.SEQ_IFA_ID';

  const ERROR_TITULO        = 'Error de verificación.';
  const ERROR_VERIFICACION  = 'El dato ingresado difiere contra los datos del sistema.';

  const SQL_EXISTE_DATO =   'SELECT count(a.co_contrato)  '+
                                '  FROM   aco_contrato a,     '+
                                '         aem_empresa b       '+
                                'WHERE  a.co_contrato = %u AND %s = %s ' +
                                '   AND a.co_idempresa = b.em_id ';

  const SQL_DATO_SIS    =   'SELECT %s '
                           +'  FROM   aco_contrato a,               '
                           +'         aem_empresa b                 '
                           +'WHERE  a.co_contrato = %u              '
                           +'   AND a.co_idempresa = b.em_id        ';

  const PREFLBE     = 'lbE';
  const separa      = #9;
  const LF          = #10#13;
  const MAIL_ENCA   = 'CUIT: %s' + LF + 'Contrato: %u'  + LF + 'Razón Social: %s' + LF+LF;
  const MAIL_DIF    = 'Dato Afiliación: %s' + separa + '->' + separa + 'Dato Emisión: %s' + LF+LF;
  const SQL_STORE_ENVIA_MAIL =  'art.varios.do_insertartablamails(' +
                                  ' ''AvisosAutomaticos'', %s, ' +
                                  ' ''Aviso de Diferencias Carga F. Afiliación'', %s, '+
                                  ' NULL, NULL, NULL); ';
  const DLG_ENVIAR = 'Existen anomalías en los datos ingresados (%s). ¿Desea enviar mail comunicándolo?';
  const SQL_FUNC_TOPEPERIODO = 'SELECT emi.utiles.get_topemaximosituacionrevista(' +
                                  '%u, ''01'' , ' +
                                  'art.utiles.periodo_anterior(%s), ''N'', ''D'') AS MAXIMO FROM DUAL';
  const MAIL_CODDIF = 'CCNFA_DIF';
  const MAIL_CODPER = 'CCNFA_PER';
  const DATO_DEL_SISTEMA = 'Dato Sistema: ';
  const MAYOR_VIGENCIA = 'Mayor a la Vigencia del Contrato';
implementation


end.
