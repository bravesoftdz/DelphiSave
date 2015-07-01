unit unQRSolicitudAfiliacion;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrSolicitudAfiliacion = class(TQuickRep)
    b1: TQRBand;
    qrImgProv: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    lbNumeroSolicitud1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel30: TQRLabel;
    QRShape19: TQRShape;
    QRLabel31: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRShape23: TQRShape;
    QRLabel34: TQRLabel;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRShape25: TQRShape;
    QRLabel36: TQRLabel;
    QRShape26: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape27: TQRShape;
    QRLabel39: TQRLabel;
    QRShape28: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape29: TQRShape;
    QRLabel46: TQRLabel;
    QRShape30: TQRShape;
    QRLabel47: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape33: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape34: TQRShape;
    QRLabel53: TQRLabel;
    QRShape35: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape36: TQRShape;
    QRLabel56: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape42: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape43: TQRShape;
    QRLabel63: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape54: TQRShape;
    QRLabel74: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRShape57: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape58: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape59: TQRShape;
    QRLabel82: TQRLabel;
    QRShape62: TQRShape;
    QRLabel83: TQRLabel;
    QRShape63: TQRShape;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRShape64: TQRShape;
    QRLabel88: TQRLabel;
    QRShape65: TQRShape;
    QRLabel89: TQRLabel;
    QRShape66: TQRShape;
    QRLabel90: TQRLabel;
    QRShape67: TQRShape;
    QRLabel91: TQRLabel;
    QRShape68: TQRShape;
    QRLabel92: TQRLabel;
    QRShape69: TQRShape;
    QRLabel93: TQRLabel;
    QRShape70: TQRShape;
    QRLabel94: TQRLabel;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    shNivel1: TQRShape;
    shNivel2: TQRShape;
    shNivel3: TQRShape;
    shNivel4: TQRShape;
    QRLabel98: TQRLabel;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRImage1: TQRImage;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRImage2: TQRImage;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    memoCondicionesGenerales: TQRMemo;
    QRLabel130: TQRDBText;
    sdqDatos: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    sdspGetValorCarta: TSDStoredProc;
    QRLabel97: TQRLabel;
    lbSumaFija: TQRLabel;
    lbPorcVariable: TQRLabel;
    lbCuotaInicial: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    lbNumeroSolicitud2: TQRLabel;
    lbNumeroSolicitud3: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel6: TQRLabel;
    QRShape82: TQRShape;
    QRLabel101: TQRLabel;
    QRShape83: TQRShape;
    QRLabel104: TQRLabel;
    QRShape84: TQRShape;
    QRLabel111: TQRLabel;
    QRShape85: TQRShape;
    QRLabel112: TQRLabel;
    QRShape86: TQRShape;
    QRLabel113: TQRLabel;
    QRShape87: TQRShape;
    QRLabel114: TQRLabel;
    QRShape88: TQRShape;
    QRLabel115: TQRLabel;
    QRShape89: TQRShape;
    QRLabel116: TQRLabel;
    QRShape90: TQRShape;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    lbEntregaRelevamientoSi: TQRLabel;
    lbEntregaRelevamientoNo: TQRLabel;
    lbSuscribeClausulasNo: TQRLabel;
    lbSuscribeClausulasSi: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    lbAlta: TQRLabel;
    lbTraspaso: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    dbtArtAnterior: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel45: TQRLabel;
    QRShape74: TQRShape;
    QRLabel122: TQRLabel;
    QRShape60: TQRShape;
    lbOtrasActividades: TQRLabel;
    procedure QRDBText35Print(Sender: TObject; var Value: String);
    procedure QRDBText1Print(Sender: TObject; var Value: String);
  private
    function SetNumeroSolicitud(const aCuit, aNumeroFormulario: String): String;
  public
    procedure Preparar(const aOrigen: Integer; const aIdSolicitud: Integer; const aNombreArchivo: String);
  end;

const
  QUERY_REVISION_Y_AFILIACION =
    'SELECT cac1.ac_codigo, cac1.ac_descripcion, TO_CHAR(sa_fechaafiliacion, ''yyyy'') anosuscripcion, ar_nombre,' +
          ' cargo.tb_descripcion cargo, cargo2.tb_descripcion cargo2, cac2.ac_codigo codigoactividad2,' +
          ' cac3.ac_codigo codigoactividad3, NVL(sa_condicionanteafip, ''Empleador'') condicionanteafip,' +
          ' NVL(fo_cuit, uw_cuitsuscripcion) cuitsuscripcion,' +
          ' DECODE(NVL(sr_canttrabajadores, 0), 0, sa_totempleados, sr_canttrabajadores) * sr_costofinalcotizado cuotamensual,' +
          ' TO_CHAR(sa_fechaafiliacion, ''dd'') diasuscripcion, NVL(sa_mail_legal, sr_email) email,' +
          ' (SELECT en_codbanco' +
             ' FROM xen_entidad' +
            ' WHERE NVL(ev_identidad, uw_identidad) = en_id) entidad,' +
          ' NVL(sa_establecimientos, sr_establecimientos) establecimientos,' +
          ' TO_CHAR(sa_fechaafiliacion + 30, ''DD/MON/YYYY'') fecha,' +
          ' fo_formulario, fjuri.tb_descripcion formajuridica,' +
          ' TO_CHAR(NVL(sa_masatotal, sr_masasalarial), ''$9,999,999,990.00'') masasalarial,' +
          ' art.utiles.nombredemes(TO_NUMBER(TO_CHAR(sa_fechaafiliacion, ''mm''))) messuscripcion,' +
          ' NVL(sa_nombre_vendedor, ve_nombre) nombrecomercializador, NVL(sa_periodo, sr_periodo) periodo,' +
          ' pv_descripcion, NVL(sa_nombre, em_nombre) sc_razonsocial, sa_calle, sa_cargo_titular,' +
          ' sa_clausulasadicionales, sa_contacto, sa_cpostal, sa_departamento, sa_direlectronica_cont,' +
          ' sa_documento_titular, sa_fechaafiliacion,' +
          ' TO_CHAR(sa_fechavigenciadesde, ''DD/MON/YYYY'') sa_fechavigenciadesde,' +
          ' TO_CHAR(sa_fechavigenciahasta, ''DD/MON/YYYY'') sa_fechavigenciahasta, sa_feinicactiv, sa_id, sa_localidad,' +
          ' sa_lugarsuscripcion, sa_motivoalta, sa_nivel, sa_numero, sa_observaciones, sa_piso, sa_presentorgrl,' +
          ' sa_provincia, sa_telefonos_cont, sa_titular, sr_idcanal sc_canal,' +
          ' NVL(sa_totempleados, sr_canttrabajadores) sc_canttrabajador, sr_cuit sc_cuit, sr_identidad sc_identidad,' +
          ' sr_idsucursal sc_idsucursal, sr_idvendedor sc_idvendedor, sr_nrosolicitud sc_nrosolicitud,' +
          ' sr_statussrt sc_statussrt, sr_costofijocotizado, sr_porcentajevariablecotizado,' +
          ' CASE' +
            ' WHEN (SELECT en_codbanco' +
                    ' FROM xen_entidad' +
                   ' WHERE NVL(ev_identidad, uw_identidad) = en_id) IN(400, 9003) THEN ''('' || su_codsucursal || '') '' || su_descripcion' +
            ' ELSE su_descripcion' +
          ' END su_descripcion,' +
          ' NVL(art.afi.get_telefonos(''ATS_TELEFONOSOLICITUD'', sa_id, ''L''), sr_telefono) telefono,' +
          ' sa_nombre_vendedor vendedor, ve_vendedor' +
     ' FROM asr_solicitudreafiliacion, asa_solicitudafiliacion, afo_formulario, aem_empresa, cac_actividad cac1,' +
          ' cac_actividad cac2, cac_actividad cac3, xev_entidadvendedor, xve_vendedor, asu_sucursal, cpv_provincias,' +
          ' ctb_tablas cargo, afi.auw_usuarioweb, ctb_tablas fjuri, ctb_tablas cargo2, aar_art, aca_canal' +
    ' WHERE sr_idformulario = sa_idformulario(+)' +
      ' AND sr_idformulario = fo_id(+)' +
      ' AND sr_cuit = em_cuit' +
      ' AND NVL(sa_idactividad, sr_idactividad1) = cac1.ac_id' +
      ' AND NVL(sa_idactividad2, sr_idactividad2) = cac2.ac_id' +
      ' AND NVL(sa_idactividad3, sr_idactividad3) = cac3.ac_id' +
      ' AND sa_identidadvendedor = ev_id(+)' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND sa_idsucursal = su_id(+)' +
      ' AND sa_provincia = pv_codigo(+)' +
      ' AND sa_cargo_titular = cargo.tb_codigo(+)' +
      ' AND cargo.tb_clave(+) = ''CARGO''' +
      ' AND cargo.tb_especial2(+) = ''SOLO_FIRMANTE''' +
		  ' AND cargo.tb_fechabaja(+) IS NULL' +
      ' AND sa_formaj = fjuri.tb_codigo(+)' +
      ' AND fjuri.tb_clave(+) = ''FJURI''' +
		  ' AND fjuri.tb_fechabaja(+) IS NULL' +
      ' AND sa_cargo = cargo2.tb_codigo(+)' +
      ' AND cargo2.tb_clave(+) = ''CARGO''' +
		  ' AND cargo2.tb_fechabaja(+) IS NULL' +
      ' AND sr_usualta = uw_usuario(+)' +
      ' AND sr_idartanterior = ar_id(+)' +
      ' AND sr_idcanal = ca_id(+)' +
      ' AND sr_id = :ID';
  QUERY_SOLICITUD_Y_AFILIACION =
    'SELECT cac1.ac_codigo, cac1.ac_descripcion, TO_CHAR(sa_fechaafiliacion, ''yyyy'') anosuscripcion, ar_nombre, ' +
          ' cargo.tb_descripcion cargo, cargo2.tb_descripcion cargo2, cac2.ac_codigo codigoactividad2,' +
          ' cac3.ac_codigo codigoactividad3, NVL(sa_condicionanteafip, ''Empleador'') condicionanteafip,' +
          ' NVL(fo_cuit, uw_cuitsuscripcion) cuitsuscripcion,' +
          ' TO_CHAR(sa_fechaafiliacion, ''dd'') diasuscripcion, NVL(sa_mail_legal, sc_mail) email,' +
          ' (SELECT en_codbanco' +
             ' FROM xen_entidad' +
            ' WHERE NVL(ev_identidad, uw_identidad) = en_id) entidad,' +
          ' NVL(sa_establecimientos, sc_establecimientos) establecimientos,' +
          ' TO_CHAR(sa_fechaafiliacion + 30, ''DD/MON/YYYY'') fecha,' +
          ' fo_formulario, fjuri.tb_descripcion formajuridica,' +
          ' TO_CHAR(NVL(sa_masatotal, sc_masasalarial), ''$9,999,999,990.00'') masasalarial,' +
          ' art.utiles.nombredemes(TO_NUMBER(TO_CHAR(sa_fechaafiliacion, ''mm''))) messuscripcion,' +
          ' NVL(sa_nombre_vendedor, ve_nombre) nombrecomercializador, NVL(sa_periodo, sc_periodo) periodo,' +
          ' pv_descripcion, NVL(sa_nombre, NVL(co_razonsocial, sc_razonsocial)) sc_razonsocial, sa_calle,' +
          ' sa_cargo_titular, sa_clausulasadicionales, sa_contacto, sa_cpostal, sa_departamento,' +
          ' sa_direlectronica_cont, sa_documento_titular, sa_fechaafiliacion,' +
          ' TO_CHAR(sa_fechavigenciadesde, ''DD/MON/YYYY'') sa_fechavigenciadesde,' +
          ' TO_CHAR(sa_fechavigenciahasta, ''DD/MON/YYYY'') sa_fechavigenciahasta, sa_feinicactiv, sa_id, sa_localidad,' +
          ' sa_lugarsuscripcion, sa_motivoalta, sa_nivel, sa_numero, sa_observaciones, sa_piso, sa_presentorgrl,' +
          ' sa_provincia, sa_telefonos_cont, sa_titular, sc_canal,' +
          ' NVL(sa_totempleados, sc_canttrabajador) sc_canttrabajador, sc_cuit, sc_identidad, sc_idsucursal,' +
          ' sc_idvendedor, sc_nrosolicitud, sc_statussrt,' +
          ' CASE' +
            ' WHEN (SELECT en_codbanco' +
                    ' FROM xen_entidad' +
                   ' WHERE NVL(ev_identidad, uw_identidad) = en_id) IN(400, 9003) THEN ''('' || su_codsucursal || '') '' || su_descripcion' +
            ' ELSE su_descripcion' +
          ' END su_descripcion,' +
          ' NVL(art.afi.get_telefonos(''ATS_TELEFONOSOLICITUD'', sa_id, ''L''), sc_telefono) telefono,' +
          ' sa_nombre_vendedor vendedor, ve_vendedor' +
     ' FROM asc_solicitudcotizacion, asa_solicitudafiliacion, aco_cotizacion, afo_formulario, cac_actividad cac1,' +
          ' cac_actividad cac2, cac_actividad cac3, xev_entidadvendedor, xve_vendedor, asu_sucursal, cpv_provincias,' +
          ' ctb_tablas cargo, afi.auw_usuarioweb, ctb_tablas fjuri, ctb_tablas cargo2, aar_art, aca_canal' +
    ' WHERE sc_idformulario = sa_idformulario(+)' +
      ' AND sc_idformulario = fo_id (+)' +
      ' AND sc_idcotizacion = co_id(+)' +
      ' AND NVL(sa_idactividad, NVL(co_idactividad, sc_idactividad)) = cac1.ac_id' +
      ' AND NVL(sa_idactividad2, sc_idactividad2) = cac2.ac_id' +
      ' AND NVL(sa_idactividad3, sc_idactividad3) = cac3.ac_id' +
      ' AND sa_identidadvendedor = ev_id(+)' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND sa_idsucursal = su_id(+)' +
      ' AND sa_provincia = pv_codigo(+)' +
      ' AND sa_cargo_titular = cargo.tb_codigo(+)' +
      ' AND cargo.tb_clave(+) = ''CARGO''' +
      ' AND cargo.tb_especial2(+) = ''SOLO_FIRMANTE''' +
		  ' AND cargo.tb_fechabaja(+) IS NULL' +
      ' AND sa_formaj = fjuri.tb_codigo(+)' +
      ' AND fjuri.tb_clave(+) = ''FJURI''' +
		  ' AND fjuri.tb_fechabaja(+) IS NULL' +
      ' AND sa_cargo = cargo2.tb_codigo(+)' +
      ' AND cargo2.tb_clave(+) = ''CARGO''' +
		  ' AND cargo2.tb_fechabaja(+) IS NULL' +
      ' AND sc_usuariosolicitud = uw_usuario(+)' +
      ' AND sc_idartanterior = ar_id(+)' +
      ' AND sc_canal = ca_id(+)' +
      ' AND sc_id = :ID';
  QUERY_SOLICITUD_Y_AFILIACION_TEMP =
    'SELECT cac1.ac_descripcion,' +
                   ' TO_CHAR(mp_fechaafiliacion, ''yyyy'') anosuscripcion,' +
                   ' ar_nombre,' +
                   ' cargo.tb_descripcion cargo,' +
                   ' cargo2.tb_descripcion cargo2,' +
                   ' cac1.ac_codigo ac_codigo,' +
                   ' cac2.ac_codigo codigoactividad2,' +
                   ' cac3.ac_codigo codigoactividad3,' +
                   ' NVL(mp_condicionanteafip, ''Empleador'') condicionanteafip,' +
                   ' NVL(fo_cuit, uw_cuitsuscripcion) cuitsuscripcion,' +
                   ' TO_CHAR(mp_fechaafiliacion, ''dd'') diasuscripcion,' +
                   ' mp_mail_legal email,' +
                   ' (SELECT en_codbanco' +
                   '      FROM xen_entidad' +
                   '     WHERE NVL(ev_identidad, uw_identidad) = en_id) entidad,' +
                   ' NVL(mp_establecimientos, sc_establecimientos) establecimientos,' +
                   ' TO_CHAR(sc_fechavigencia + CASE WHEN ca_tipo = ''B'' THEN 60 ELSE 30 END, ''DD/MON/YYYY'') fecha,' +
                   ' fo_formulario,' +
                   ' fjuri.tb_descripcion formajuridica,' +
                   ' TO_CHAR(NVL(mp_masatotal, sc_masasalarial), ''$9,999,999,990.00'') masasalarial,' +
                   ' art.utiles.nombredemes(TO_NUMBER(TO_CHAR(mp_fechaafiliacion, ''mm''))) messuscripcion,' +
                   ' NVL(mp_nombre_vendedor, ve_nombre) nombrecomercializador,' +
                   ' NVL(mp_periodo, sc_periodo) periodo,' +
                   ' pv_descripcion,' +
                   ' NVL(mp_nombre, NVL(co_razonsocial, sc_razonsocial)) sc_razonsocial,' +
                   ' mp_calle sa_calle,' +
                   ' mp_cargo_titular sa_cargo_titular,' +
                   ' mp_clausulasadicionales sa_clausulasadicionales,' +
                   ' mp_contacto sa_contacto,' +
                   ' mp_cpostal sa_cpostal,' +
                   ' mp_departamento sa_departamento,' +
                   ' mp_direlectronica_cont sa_direlectronica_cont,' +
                   ' mp_documento_titular sa_documento_titular,' +
                   ' mp_fechaafiliacion sa_fechaafiliacion,' +
                   ' TO_CHAR(mp_fechavigenciadesde, ''DD/MON/YYYY'') sa_fechavigenciadesde,' +
                   ' TO_CHAR(mp_fechavigenciahasta, ''DD/MON/YYYY'') sa_fechavigenciahasta,' +
                   ' mp_feinicactiv sa_feinicactiv,' +
                   ' mp_id sa_id,' +
                   ' mp_localidad sa_localidad,' +
                   ' mp_lugarsuscripcion sa_lugarsuscripcion,' +
                   ' mp_motivoalta sa_motivoalta,' +
                   ' mp_nivel sa_nivel,' +
                   ' mp_numero sa_numero,' +
                   ' mp_observaciones sa_observaciones,' +
                   ' mp_piso sa_piso,' +
                   ' mp_presentorgrl sa_presentorgrl,' +
                   ' mp_provincia sa_provincia,' +
                   ' art.afi.get_telefonos(''ATS_TELEFONOSOLICITUD'', mp_id, ''X'') sa_telefonos_cont,' +
                   ' mp_titular sa_titular,' +
                   ' sc_canal,' +
                   ' NVL(mp_totempleados, sc_canttrabajador) sc_canttrabajador,' +
                   ' sc_cuit,' +
                   ' sc_identidad,' +
                   ' sc_idsucursal,' +
                   ' sc_idvendedor,' +
                   ' sc_nrosolicitud,' +
                   ' sc_statussrt,' +
                   ' CASE' +
                   '     WHEN (SELECT en_codbanco' +
                   '                     FROM xen_entidad' +
                   '                  WHERE NVL(ev_identidad, uw_identidad) = en_id) IN (400, 9003)' +
                   '     THEN DECODE(su_codsucursal, NULL, NULL, ''('' || su_codsucursal || '') '') || su_descripcion' +
                   '     ELSE su_descripcion' +
                   ' END su_descripcion,' +
                   ' mp_nombre_vendedor vendedor,' +
                   ' ve_vendedor,' +
                   ' art.afi.get_telefonos(''TMP_TELEFONOSOLICITUD'', mp_id, ''L'') telefono,' +
                   ' art.afi.get_telefonos(''TMP_TELEFONOSOLICITUD'', mp_id, ''P'') telpostal,' +
                   ' art.afi.get_telefonos(''TMP_TELEFONOSOLICITUD'', mp_id, ''X'') telx' +
         ' FROM asc_solicitudcotizacion, tmp.tmp_solicitudafiliacion, aco_cotizacion, afo_formulario, cac_actividad cac1,' +
                   ' cac_actividad cac2, cac_actividad cac3, xev_entidadvendedor, xve_vendedor, asu_sucursal, cpv_provincias,' +
                   ' ctb_tablas cargo, afi.auw_usuarioweb, ctb_tablas fjuri, ctb_tablas cargo2, aar_art, aca_canal' +
       ' WHERE sc_idformulario = mp_idformulario(+)' +
           ' AND sc_idformulario = fo_id (+)' +
           ' AND sc_idcotizacion = co_id(+)' +
           ' AND mp_idactividad = cac1.ac_id' +
           ' AND mp_idactividad2 = cac2.ac_id(+)' +
           ' AND mp_idactividad3 = cac3.ac_id(+)' +
           ' AND mp_identidadvendedor = ev_id(+)' +
           ' AND ev_idvendedor = ve_id(+)' +
           ' AND mp_idsucursal = su_id(+)' +
           ' AND mp_provincia = pv_codigo(+)' +
           ' AND mp_cargo_titular = cargo.tb_codigo(+)' +
           ' AND cargo.tb_clave(+) = ''CARGO''' +
           ' AND cargo.tb_especial2(+) = ''SOLO_FIRMANTE''' +
           ' AND cargo.tb_fechabaja(+) IS NULL' +
           ' AND mp_formaj = fjuri.tb_codigo(+)' +
           ' AND fjuri.tb_clave(+) = ''FJURI''' +
           ' AND fjuri.tb_fechabaja(+) IS NULL' +
           ' AND mp_cargo = cargo2.tb_codigo(+)' +
           ' AND cargo2.tb_clave(+) = ''CARGO''' +
           ' AND cargo2.tb_fechabaja(+) IS NULL' +
           ' AND sc_usuariosolicitud = uw_usuario(+)' +
           ' AND sc_idartanterior = ar_id(+)' +
           ' AND sc_canal = ca_id(+)' +
           ' AND sc_id = :id';

  QUERY_REVISION_Y_AFILIACION_TEMP =
    'SELECT cac1.ac_codigo, cac1.ac_descripcion, TO_CHAR(mp_fechaafiliacion, ''yyyy'') anosuscripcion, ar_nombre,' +
          ' cargo.tb_descripcion cargo, cargo2.tb_descripcion cargo2, cac2.ac_codigo codigoactividad2,' +
          ' cac3.ac_codigo codigoactividad3, NVL(mp_condicionanteafip, ''Empleador'') condicionanteafip,' +
          ' NVL(fo_cuit, uw_cuitsuscripcion) cuitsuscripcion,' +
          ' DECODE(NVL(sr_canttrabajadores, 0), 0, mp_totempleados, sr_canttrabajadores) * sr_costofinalcotizado cuotamensual,' +
          ' TO_CHAR(mp_fechaafiliacion, ''dd'') diasuscripcion, NVL(mp_mail_legal, sr_email) email,' +
          ' (SELECT en_codbanco' +
             ' FROM xen_entidad' +
            ' WHERE NVL(ev_identidad, uw_identidad) = en_id) entidad,' +
          ' NVL(mp_establecimientos, sr_establecimientos) establecimientos,' +
          ' TO_CHAR(mp_fechaafiliacion + 30, ''DD/MON/YYYY'') fecha,' +
          ' fo_formulario, fjuri.tb_descripcion formajuridica,' +
          ' TO_CHAR(NVL(mp_masatotal, sr_masasalarial), ''$9,999,999,990.00'') masasalarial,' +
          ' art.utiles.nombredemes(TO_NUMBER(TO_CHAR(mp_fechaafiliacion, ''mm''))) messuscripcion,' +
          ' NVL(mp_nombre_vendedor, ve_nombre) nombrecomercializador, NVL(mp_periodo, sr_periodo) periodo,' +
          ' pv_descripcion, NVL(mp_nombre, em_nombre) sc_razonsocial, mp_calle sa_calle, mp_cargo_titular mp_cargo_titular,' +
          ' mp_clausulasadicionales sa_clausulasadicionales, mp_contacto sa_contacto, mp_cpostal sa_cpostal, mp_departamento sa_departamento, mp_direlectronica_cont sa_direlectronica_cont,' +
          ' mp_documento_titular sa_documento_titular, mp_fechaafiliacion sa_fechaafiliacion,' +
          ' TO_CHAR(mp_fechavigenciadesde, ''DD/MON/YYYY'') sa_fechavigenciadesde,' +
          ' TO_CHAR(mp_fechavigenciahasta, ''DD/MON/YYYY'') sa_fechavigenciahasta, mp_feinicactiv sa_feinicactiv, mp_id, mp_localidad sa_localidad,' +
          ' mp_lugarsuscripcion sa_lugarsuscripcion, mp_motivoalta sa_motivoalta, mp_nivel sa_nivel, mp_numero sa_numero, mp_observaciones sa_observaciones, mp_piso sa_piso, mp_presentorgrl sa_presentorgrl,' +
          ' mp_provincia sa_provincia, mp_telefonos_cont sa_telefonos_cont, mp_titular sa_titular, sr_idcanal sc_canal,' +
          ' mp_totempleados sc_canttrabajador, sr_cuit sc_cuit, sr_identidad sc_identidad,' +
          ' sr_idsucursal sc_idsucursal, sr_idvendedor sc_idvendedor, sr_nrosolicitud sc_nrosolicitud,' +
          ' sr_statussrt sc_statussrt, sr_costofijocotizado, sr_porcentajevariablecotizado,' +
          ' CASE' +
            ' WHEN (SELECT en_codbanco' +
                    ' FROM xen_entidad' +
                   ' WHERE NVL(ev_identidad, uw_identidad) = en_id) IN(400, 9003) THEN ''('' || su_codsucursal || '') '' || su_descripcion' +
            ' ELSE su_descripcion' +
          ' END su_descripcion,' +
          ' mp_nombre_vendedor vendedor, ve_vendedor,' +
          ' art.afi.get_telefonos(''TMP_TELEFONOSOLICITUD'', mp_id, ''L'') telefono,' +
          ' art.afi.get_telefonos(''TMP_TELEFONOSOLICITUD'', mp_id, ''P'') telpostal,' +
          ' art.afi.get_telefonos(''TMP_TELEFONOSOLICITUD'', mp_id, ''X'') telx' +
     ' FROM asr_solicitudreafiliacion, tmp.tmp_solicitudafiliacion, afo_formulario, aem_empresa, cac_actividad cac1,' +
          ' cac_actividad cac2, cac_actividad cac3, xev_entidadvendedor, xve_vendedor, asu_sucursal, cpv_provincias,' +
          ' ctb_tablas cargo, afi.auw_usuarioweb, ctb_tablas fjuri, ctb_tablas cargo2, aar_art, aca_canal' +
    ' WHERE sr_idformulario = mp_idformulario(+)' +
      ' AND sr_idformulario = fo_id(+)' +
      ' AND sr_cuit = em_cuit' +
      ' AND mp_idactividad = cac1.ac_id' +
      ' AND mp_idactividad2 = cac2.ac_id(+)' +
      ' AND mp_idactividad3 = cac3.ac_id(+)' +
      ' AND mp_identidadvendedor = ev_id(+)' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND mp_idsucursal = su_id(+)' +
      ' AND mp_provincia = pv_codigo(+)' +
      ' AND mp_cargo_titular = cargo.tb_codigo(+)' +
      ' AND cargo.tb_clave(+) = ''CARGO''' +
      ' AND cargo.tb_especial2(+) = ''SOLO_FIRMANTE''' +
		  ' AND cargo.tb_fechabaja(+) IS NULL' +
      ' AND mp_formaj = fjuri.tb_codigo(+)' +
      ' AND fjuri.tb_clave(+) = ''FJURI''' +
		  ' AND fjuri.tb_fechabaja(+) IS NULL' +
      ' AND mp_cargo = cargo2.tb_codigo(+)' +
      ' AND cargo2.tb_clave(+) = ''CARGO''' +
		  ' AND cargo2.tb_fechabaja(+) IS NULL' +
      ' AND sr_usualta = uw_usuario(+)' +
      ' AND sr_idartanterior = ar_id(+)' +
      ' AND sr_idcanal = ca_id(+)' +
      ' AND sr_id = :ID';

var
  qrSolicitudAfiliacion: TqrSolicitudAfiliacion;

implementation

uses
  {$IFNDEF SERVICE}unVisualizador,{$ENDIF} CUIT, unExportPDF, Strfuncs, General;

{$R *.DFM}

function TqrSolicitudAfiliacion.SetNumeroSolicitud(const aCuit, aNumeroFormulario: String): String;
begin
  Result := 'Nº 00051-' + Format('%s-%s', [aCuit, aNumeroFormulario]);
end;

procedure TqrSolicitudAfiliacion.Preparar(const aOrigen: Integer; const aIdSolicitud: Integer;
                                          const aNombreArchivo: String);
begin
  with sdqDatos do
  begin
    Close;

    if aOrigen = 6 then
      Sql.Text := QUERY_SOLICITUD_Y_AFILIACION;
    if aOrigen = 7 then
      Sql.Text := QUERY_REVISION_Y_AFILIACION;
    if aOrigen = 8 then
      Sql.Text := QUERY_SOLICITUD_Y_AFILIACION_TEMP;
    if aOrigen = 9 then
      Sql.Text := QUERY_REVISION_Y_AFILIACION_TEMP;

    ParamByName('id').AsInteger := aIdSolicitud;
    Open;
  end;

  if (aOrigen = 6) or (aOrigen = 8) then
    with sdspGetValorCarta do
    begin
      ParamByName('nnro_solicitud').AsInteger := sdqDatos.FieldByName('sc_nrosolicitud').AsInteger;

      ExecProc;

      lbCuotaInicial.Caption := FormatFloat('$ #,##0.00', ParamByName('ncosto_mensual').AsFloat);
      lbPorcVariable.Caption := FormatFloat('% ##0.000', ParamByName('nvariable').AsFloat);
      lbSumaFija.Caption 	   := FormatFloat('$ #,##0.00', ParamByName('nsuma_fija').AsFloat - 0.6);
    end;

  if (aOrigen = 7) or (aOrigen = 9) then
    with sdqDatos do
    begin
      lbCuotaInicial.Caption := FormatFloat('$ #,##0.00', FieldByName('cuotamensual').AsFloat);
      lbPorcVariable.Caption := FormatFloat('% ##0.000', FieldByName('sr_porcentajevariablecotizado').AsFloat);
      lbSumaFija.Caption 	   := FormatFloat('$ #,##0.00', IIF(FieldByName('sr_costofijocotizado').AsFloat = 0, 0, FieldByName('sr_costofijocotizado').AsFloat - 0.6));
    end;

  with sdqDatos do
  begin
    lbOtrasActividades.Caption := FieldByName('codigoactividad2').AsString;
    if FieldByName('codigoactividad3').AsString <> '' then
      if lbOtrasActividades.Caption = '' then
        lbOtrasActividades.Caption := FieldByName('codigoactividad3').AsString
      else
        lbOtrasActividades.Caption := ', ' + FieldByName('codigoactividad3').AsString;

    lbEntregaRelevamientoSi.Enabled := (FieldByName('sa_presentorgrl').AsString = 'T');
    lbEntregaRelevamientoNo.Enabled := (FieldByName('sa_presentorgrl').AsString = 'F');
    lbSuscribeClausulasSi.Enabled := (FieldByName('sa_clausulasadicionales').AsString = 'S');
    lbSuscribeClausulasNo.Enabled := Not(lbSuscribeClausulasSi.Enabled);

    lbAlta.Enabled := (FieldByName('sa_motivoalta').AsString = '03') or (FieldByName('sa_motivoalta').AsString = '04') or (FieldByName('sa_motivoalta').AsString = '05');
    lbTraspaso.Enabled := not lbAlta.Enabled;
    dbtArtAnterior.Enabled := lbTraspaso.Enabled;

    lbNumeroSolicitud1.Caption := SetNumeroSolicitud(FieldByName('cuitsuscripcion').AsString, FieldByName('fo_formulario').AsString);
    lbNumeroSolicitud2.Caption := lbNumeroSolicitud1.Caption;
    lbNumeroSolicitud3.Caption := lbNumeroSolicitud1.Caption;

    case StrToIntDef(FieldByName('sa_nivel').AsString, 0) of
      1:  shNivel1.Brush.Color := StringToColor('$00C48700');
      2:  shNivel2.Brush.Color := StringToColor('$00C48700');
      3:  shNivel3.Brush.Color := StringToColor('$00C48700');
      4:  shNivel4.Brush.Color := StringToColor('$00C48700');
    end;
  end;

  if aNombreArchivo > '' then
    FileToPDFSvr(Self, ExtractFilePath(aNombreArchivo), aNombreArchivo, False)
  else
{$IFNDEF SERVICE}
    Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oSinNotaAlPie, oForceDB, oForceShowModal,
                                    oExportDOCNotAllowed, oExportXLSNotAllowed], True, '', '', True);
{$ENDIF}
end;

procedure TqrSolicitudAfiliacion.QRDBText35Print(Sender: TObject; var Value: String);
begin
  if Value <> '' then
    Value := Format('%s/%s', [Copy(Value, 1, 4), Copy(Value, 5, 2)]);
end;

procedure TqrSolicitudAfiliacion.QRDBText1Print(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

end.
