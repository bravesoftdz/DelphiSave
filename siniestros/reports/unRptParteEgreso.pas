unit unRptParteEgreso;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine, QrAngLbl, CUIT;

type
  TrptParteEgreso = class(TQuickRep)
    qrHeader: TQRBand;
    qrTitle: TQRBand;
    sdqReporte: TSDQuery;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    qrbEmpresa: TQRChildBand;
    qrbTrabajador: TQRChildBand;
    QRLabel19: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText25: TQRDBText;
    qrbPrestador: TQRChildBand;
    QRLabel78: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText80: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText51: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText59: TQRDBText;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    qrlART: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRShape6: TQRShape;
    QRDBText34: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel112: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText21: TQRDBText;
    qrlDatosEmpDep: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel57: TQRLabel;
    QRShape8: TQRShape;
    QRDBText48: TQRDBText;
    QRLabel59: TQRLabel;
    QRShape9: TQRShape;
    QRDBText49: TQRDBText;
    QRLabel63: TQRLabel;
    QRShape10: TQRShape;
    QRDBText50: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape3: TQRShape;
    QRDBText28: TQRDBText;
    QRDBText62: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel107: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel110: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel80: TQRLabel;
    qrdbt_Diagnostico: TQRDBText;
    QRLabel53: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape1: TQRShape;
    QRLabel67: TQRLabel;
    QRShape4: TQRShape;
    QRDBText47: TQRDBText;
    QRLabel58: TQRLabel;
    QRShape11: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRShape15: TQRShape;
    QRLabel71: TQRLabel;
    QRShape32: TQRShape;
    QRLabel72: TQRLabel;
    QRShape33: TQRShape;
    QRLabel73: TQRLabel;
    QRShape34: TQRShape;
    QRLabel75: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRShape35: TQRShape;
    QRLabel85: TQRLabel;
    QRShape36: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel86: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel108: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel100: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel113: TQRLabel;
    QRShape45: TQRShape;
    QRLabel114: TQRLabel;
    QRShape46: TQRShape;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRShape47: TQRShape;
    QRLabel117: TQRLabel;
    QRShape48: TQRShape;
    QRDBText27: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRShape49: TQRShape;
    QRLabel120: TQRLabel;
    QRShape50: TQRShape;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRShape7: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel91: TQRLabel;
    QRShape39: TQRShape;
    QRLabel92: TQRLabel;
    QRShape40: TQRShape;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRShape41: TQRShape;
    QRLabel96: TQRLabel;
    QRShape42: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRShape43: TQRShape;
    QRLabel99: TQRLabel;
    QRShape44: TQRShape;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText46: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    qrMemoNotaAlPie1: TQRMemo;
    qrMemoNotaAlPie2: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    qrlFecFinTratamiento: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText54: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText56: TQRDBText;
    qrlDiagnostico_raya: TQRLabel;
    QRShape13: TQRShape;
    QRMemo1: TQRMemo;
  private
    procedure Do_AsignarSQL_sdqReporte(IdExpediente, iIdPrest:Integer);
    function Get_FechaFinDeTratamiento(IdExpediente: Integer; var bCancelar: boolean): TDateTime;
  public
    procedure Imprimir(ASiniestroCompleto: String; IdExpediente, ASiniestro: integer; iIdPrestConsultorio: integer = 0);
  end;

implementation

uses
  unVisualizador, unDmPrincipal, unComunes, AnsiSql, unSeleccionarFechaFinTrat;

{$R *.DFM}

{ TrptParteEgreso }

procedure TrptParteEgreso.Do_AsignarSQL_sdqReporte(IdExpediente, iIdPrest:Integer);   // TK 63718
var sSql: string;
begin
  sdqReporte.Close;
  sSql :=
     ' SELECT /* Expediente */ ' +
        ' art.utiles.get_fechaformatolargo(art.actualdate) AS hoy, tg_descripcion AS gravedad, ' +
        ' pe_fechabajamedica, ex_cuit, ex_cuil, ' +
        ' art.utiles.armar_cuit(ex_cuit) CUIT, ' +
        ' art.utiles.armar_cuit(ex_cuil) CUIL, ' +
        ' decode(pe_idexpediente, NULL, '''', ''X'') as existe_parteegreso, ' +
        ' decode(ex_tipo, 1, ''X'', '''') as ex_tipo_1, ' +
        ' decode(ex_tipo, 2, ''X'', '''') as ex_tipo_2, ' +
        ' decode(ex_tipo, 3, ''X'', '''') as ex_tipo_3, ' +
        ' decode(ex_intercurrencia, ''S'', ''X'', '''') as ex_intercurrencia, ' +

        ' TO_CHAR(NVL(ex_fechamanifestacion, ex_fechaaccidente), ''DD'') as fechaacc_dia, ' +
        ' TO_CHAR(NVL(ex_fechamanifestacion, ex_fechaaccidente), ''MM'') as fechaacc_mes, ' +
        ' TO_CHAR(NVL(ex_fechamanifestacion, ex_fechaaccidente), ''YYYY'') as fechaacc_ano, ' +
        ' ex_horaaccidente as fechaacc_hora, ' +

        ' NVL(ex_fechamanifestacion, ex_fechaaccidente) FechaAcc, ' +

        ' TO_CHAR(pe_fechareconsulta, ''DD'') as fechaproxconsulta_dia, ' +
        ' TO_CHAR(pe_fechareconsulta, ''MM'') as fechaproxconsulta_mes, ' +
        ' TO_CHAR(pe_fechareconsulta, ''YYYY'') as fechaproxconsulta_ano, ' +

        ' pe_fechareconsulta, ' +

        ' TO_CHAR(pe_fechaaltamedica, ''DD'') as pe_fechaaltamedica_dia, ' +
        ' TO_CHAR(pe_fechaaltamedica, ''MM'') as pe_fechaaltamedica_mes, ' +
        ' TO_CHAR(pe_fechaaltamedica, ''YYYY'') as pe_fechaaltamedica_ano, ' +

        ' pe_fechaaltamedica, ' +

        ' TO_CHAR(NVL(ex_bajamedica, ex_fecharecaida), ''DD'') as pe_fechabajamedica_dia, ' +
        ' TO_CHAR(NVL(ex_bajamedica, ex_fecharecaida), ''MM'') as pe_fechabajamedica_mes, ' +
        ' TO_CHAR(NVL(ex_bajamedica, ex_fecharecaida), ''YYYY'') as pe_fechabajamedica_ano, ' +

        ' NVL(ex_bajamedica, ex_fecharecaida) as pe_fechabajamedica, ' +

        ' TO_CHAR(pe_fechareinicio, ''DD'') as pe_fechareinicio_dia, ' +
        ' TO_CHAR(pe_fechareinicio, ''MM'') as pe_fechareinicio_mes, ' +
        ' TO_CHAR(pe_fechareinicio, ''YYYY'') as pe_fechareinicio_ano, ' +

        ' pe_fechareinicio, ' +

        ' decode(pe_fechareinicio, NULL, '' '', ''X'') as regresatrabajo_si, ' +
        ' decode(pe_idexpediente, NULL, '' '', decode(pe_fechareinicio, NULL, ''X'', '' '')) AS regresatrabajo_no, ' +

        ' decode(pe_idtipodeegreso, 9, ''X'', '' '') as por_derivacion, ' +
        ' decode(pe_idtipodeegreso, 7, ''X'', '' '') as negativa_injustificada, ' +

        ' decode(pe_idtipodeegreso, 3, '' '',  decode(pe_idexpediente, NULL, '''', ''X'')) FinTratamiento, ' +    // por ticket 65311: si es abandono de tratamiento, el tilde de Fin de tratamiento queda en blanco, sino sigue como estaba antes

        ' decode(pe_idtipodeegreso, 2, decode(pe_automatico, ''N'', ''X'', '' ''), '' '') as ceseilt_altamedica, ' +
        ' decode(pe_idtipodeegreso, 2, decode(pe_automatico, ''S'', ''X'', '' ''), '' '') as ceseilt_rechazo, ' +
        ' art.utiles.iif_compara(''IN'', NVL(pe_idtipodeegreso, -1), ''(4,5,6)'', ''X'', '''') as ceseilt_defuncion, ' +

        ' decode(ex_recaida, 0, '''', ''X'') as reagravamiento, ' +
        ' decode(ex_recaida, 0, to_date(NULL), ex_fecharecaida) as fecha_reagravamiento, ' +
        ' decode(ex_recaida, 0, to_date(NULL), ex_bajamedica) as fecha_atencionreagravamiento, ' +
        ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +

        ' /*art.amebpba.calcdiashabiles(NVL(pe_fechaaltamedica, ART.ACTUALDATE), 15) as fecha_citacion_art, */ ' +
        ' ''  /  /  '' fecha_citacion_art, ' +

        ' /* Empresa */ ' +
        ' art.utiles.armar_domicilio(mp_calle_post, mp_numero_post, mp_piso_post, ' +
                                   ' mp_departamento_post) empresa_domicilio, ' +
        ' mp_nombre empresa_nombre, mp_telefonos empresa_telefonos, mp_fax_post as empresa_fax, ' +
        ' mp_localidad_post empresa_localidad, mp_cpostal_post empresa_cpostal, ' +
        ' cpv_cmp.pv_descripcion empresa_provincia, co_direlectronica, ' +
        ' co_contrato, ac_codigo as ciiu, ' +

        ' /* Trabajador */ ' +
        ' art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, ' +
                                   ' tj_departamento) trabajador_domicilio, ' +

        ' tj_calle, tj_numero, tj_piso, tj_departamento, ' +
        ' tj_nombre, ' +

        ' (Select ''DDN ('' || tt_area || '') - '' || tt_numero ' +
           ' From art.ATT_TELEFONOTRABAJADOR ' +
          ' where tt_idtrabajador = tj_id ' +
            ' and tt_idtipotelefono = 2 ' +
            ' and rownum = 1) TelFijo, ' +

        ' (Select tt_area || '' - '' || tt_numero ' +
           ' From art.ATT_TELEFONOTRABAJADOR ' +
          ' where tt_idtrabajador = tj_id ' +
            ' and tt_idtipotelefono = 3 ' +
            ' and rownum = 1) Celular, ' +

        ' tj_localidad, tj_cpostal, ' +
        ' cpv_ctj.pv_descripcion trabajador_provincia, tj_fnacimiento, ' +

        ' (SELECT tb_descripcion ' +
           ' FROM art.ctb_tablas ' +
          ' WHERE tb_clave = ''SEXOS'' ' +
           '  AND tb_codigo = tj_sexo) as sexo, ' +

        ' decode(tj_sexo, ''M'', ''X'', '''') as sexo_M, ' +
        ' decode(tj_sexo, ''F'', ''X'', '''') as sexo_F, ' +

        ' (SELECT tb_descripcion ' +
           ' FROM art.ctb_tablas ' +
          ' WHERE tb_clave = ''ESTAD'' ' +
           '  AND tb_codigo = tj_estadocivil) as estado_civil, ' +

        ' NVL((SELECT na_descripcion ' +
               ' FROM cna_nacionalidad ' +
              ' WHERE na_id = tj_idnacionalidad), tj_otranacionalidad) as nacionalidad, ' +

        ' /* Prestador */ ' +
        ' cpr.ca_calle ca_calle, cpr.ca_numero ca_numero, nvl(cpr.ca_piso, null) ca_piso, nvl(cpr.ca_departamento, null) ca_departamento, ' +
        ' cpr.ca_descripcion prestador_nombre, cpr.ca_telefono prestador_telefono, ' +
        ' art.utiles.armar_cuit(cpr.ca_clave) as prestador_cuit, cpr.ca_localidad as prestador_localidad, ' +
        ' cpv_cmp.pv_descripcion prestador_provincia, ca_fax as prestador_fax, ' +
        ' ca_codpostal, ca_direlectronica, ' +

        ' /* Partes */ ' +
        ' LPAD('' '', 64, '' '') || ''Diagnóstico: '' || pe_diagnostico || ''. Tratamiento: '' || pe_trataminstitucion || '' '' || pe_tratamubicacion as pe_diagnostico, ' +
        ' LPAD('' '', 54, '' '') || pe_observaciones as pe_observaciones, ' +

        ' NVL(pe_diagnostico, pi_diagnostico) Diagnostico, ' +
        ' DECODE(pe_tratamiento, ''S'', ''X'', ''N'', '' '') Tratamiento_si, ' +
        ' DECODE(pe_tratamiento, ''N'', ''X'', ''S'', '' '') Tratamiento_no, ' +

        ' DECODE(pe_idtipotratamiento, ''2'', ''X'', '' '') Odontologico, ' +
        ' DECODE(pe_idtipotratamiento, ''7'', ''X'', '' '') Psicologico, ' +

        ' DECODE(pe_contpa_odontol, ''S'', ''X'', '' '') pe_contpa_odontol, ' +
        ' DECODE(pe_contpa_dermat, ''S'', ''X'', '' '') pe_contpa_dermat, ' +
        ' DECODE(pe_contpa_psicol, ''S'', ''X'', '' '') pe_contpa_psicol, ' +

        ' DECODE(pe_presupincapacidad, ''?'', '' '', DECODE(pe_presupincapacidad, ''S'', ''X'', ''N'', '' '', '' '')) presupincap_si, ' +
        ' DECODE(pe_presupincapacidad, ''?'', '' '', DECODE(pe_presupincapacidad, ''S'', '' '', ''N'', ''X'', '' '')) presupincap_no, ' +

        ' DECODE(PE_PRESTAC_MANTENIM, ''?'', '' '', DECODE(PE_PRESTAC_MANTENIM, ''S'', ''X'', ''N'', '' '', '' '')) prestacMantenim_si, ' +
        ' DECODE(PE_PRESTAC_MANTENIM, ''?'', '' '', DECODE(PE_PRESTAC_MANTENIM, ''S'', '' '', ''N'', ''X'', '' '')) prestacMantenim_no, ' +

        ' DECODE(pe_recalificacion, ''S'', ''X'', ''N'', '' '', '' '') as recalificacion_si, ' +
        ' DECODE(pe_recalificacion, ''S'', '' '', ''N'', ''X'', '' '') as recalificacion_no, ' +

        ' pe_fecharecepcion, pe_historiaclinica, ' +

        ' DECODE(pe_obrasocial, ''S'', ''Obra Social'', ''N'', ''-'', ''No se especifica'') derivado_obra_social, ' +
        ' NVL(DE_INICIOINASISTENCIALABORAL, ex_bajamedica) FecInicioInasistenciaLaboral, ' +
        ' NVL(PI_EPMANIFESTACION, ex_bajamedica) FecPrimeraAtencionMedica, ' +
        ' NVL(ex_brevedescripcion, sa_descripcion) DescrMotivoConsulta, ' +
        ' art.inca.get_comisiontrabajador(ex_cuil) comi_traba ' +

    ' FROM art.sex_expedientes sex, art.cpr_prestador cpr, cmp_empresas, ' +
        ' cac_actividad, aco_contrato, ctj_trabajador, ' +
        ' cpv_provincias cpv_cpr, cpv_provincias cpv_cmp, cpv_provincias cpv_ctj, ' +
        ' SIN.stg_tipogravedad, SIN.spe_partedeegreso, SIN.sde_denuncia, SIN.SPI_PARTEDEINGRESO, SIN.SSA_SOLICITUDASISTENCIA ' +
    ' WHERE ex_id = ' + SqlInt(idExpediente) +
      ' AND cpv_cmp.pv_codigo(+) = mp_provincia_post ' +
      ' AND cpv_ctj.pv_codigo(+) = tj_provincia ' +
      ' AND cpv_cpr.pv_codigo(+) = ca_provincia ' ;

  if (iIdPrest > 0) then                              // TK 63718
    sSql := sSql + ' AND cpr.ROWID = (SELECT ROWID ' +                 // TK 63992 (saque el outer join)
                                         ' FROM cpr_prestador ' +
                                        ' WHERE ca_identificador = ' + SqlInt(iIdPrest) + ') '
  else
    sSql := sSql + ' AND cpr.ROWID(+) = art.SIN.get_prestadorid(ex_siniestro, ex_orden, ex_recaida) ';

  sSql := sSql +
    ' AND tg_codigo(+) = ex_gravedad ' +
    ' AND mp_cuit = ex_cuit ' +
    ' AND tj_cuil = ex_cuil ' +
    ' AND pe_idexpediente(+) = ex_id ' +
    ' AND de_idexpediente(+) = ex_id ' +
    ' AND pi_idexpediente(+) = ex_id ' +
    ' AND sa_idexpediente(+) = ex_id ' +
    ' AND co_contrato = art.afiliacion.get_contratovigente(ex_cuit, ex_fechaaccidente) ' +
    ' AND co_idactividad = ac_id ';

  sdqReporte.SQL.Text := sSql;
end;

function TrptParteEgreso.Get_FechaFinDeTratamiento(IdExpediente: Integer; var bCancelar: boolean): TDateTime;
var frmSeleccionarFechaFinTrat: TfrmSeleccionarFechaFinTrat;
begin
  frmSeleccionarFechaFinTrat := TfrmSeleccionarFechaFinTrat.Create(self);
  Try
    with frmSeleccionarFechaFinTrat do
    begin
      Visible := False;
      Result  := GetFechaTrat(IdExpediente, bCancelar);
    end;
  Finally
    frmSeleccionarFechaFinTrat.Free;
  End;
end;

procedure TrptParteEgreso.Imprimir(ASiniestroCompleto: String; IdExpediente, ASiniestro: integer; iIdPrestConsultorio: integer = 0);  // TK 63718: Ultimo parametro solo cuando se genera el parte desde consultorio.
var dFechaFinTratamiento: TDateTime;
    bCancelar: boolean;
begin
 // sdqReporte.Params[0].AsInteger := IdExpediente;
  bCancelar := False;
  Do_AsignarSQL_sdqReporte(IdExpediente, iIdPrestConsultorio);   // TK 63718

  OpenQuery(sdqReporte);

  if Is_SiniestroDeGobernacion(IdExpediente) then
  begin
    qrlART.Caption         := 'Autoseguro de la Gobernación de la Pcia. de Bs.As.';
    qrlART.Font.Size       := 14;
    qrlART.Alignment       := taCenter;
    qrlART.Top             := 22;
    qrlDatosEmpDep.Caption := 'DATOS DE LA DEPENDENCIA';
  end
  else begin
    qrlART.Caption         := 'Provincia ART S.A.';
    qrlART.Font.Size       := 18;
    qrlART.Alignment       := taLeftJustify;
    qrlART.Top             := 44;
    qrlDatosEmpDep.Caption := 'DATOS DEL EMPLEADOR';
  end;

  qrMemoNotaAlPie1.Lines.Add('ALTA MÉDICA: Sr. Trabajador en caso de discrepancia con el alta médica otorgada, usted puede presentarse dentro de los 5 (cinco) días hábiles ante la Comisión Médica sita en ' +
                              sdqReporte.FieldByName('COMI_TRABA').AsString + ', concurriendo personalmente a fin de someterse a evaluación médica.');
  qrMemoNotaAlPie1.Lines.Add('Los datos de contacto de Provincia ART son: 0800-333-1278 en el horario de 09 a 18 hs. ');

  qrMemoNotaAlPie2.Lines.Add('FIN DE TRATAMIENTO: Sr. Trabajador en caso de discrepancia con esta decisión, usted puede concurrir a la Comisión Médica sita en ' + sdqReporte.FieldByName('COMI_TRABA').AsString + '. ');
  qrMemoNotaAlPie2.Lines.Add('Los datos de contacto de Provincia ART son:  0800-333-1278 en el horario de 09 a 18 hs. ');

  dFechaFinTratamiento := Get_FechaFinDeTratamiento(IdExpediente, bCancelar);

  qrdbt_Diagnostico.Visible := (iIdPrestConsultorio = 0);   // a pedido de Marisa barrios por mail a cristian; solo se muestra el diagnostico, si vengo del parte de egreso, si estoy desde consultorio queda en blanco
  qrdbt_Diagnostico.Enabled := (iIdPrestConsultorio = 0);
  qrlDiagnostico_raya.Visible := (not qrdbt_Diagnostico.visible);
  qrlDiagnostico_raya.Enabled := (not qrdbt_Diagnostico.visible);

  if dFechaFinTratamiento > 0 then
    qrlFecFinTratamiento.Caption := DateToStr(dFechaFinTratamiento)
  else 
    qrlFecFinTratamiento.Caption := ' ';

  if not bCancelar then
    Visualizar(Self, GetValores(' - ' + ASiniestroCompleto, '', 0, ASiniestro),
                [oAutoFirma, oForceDB, oForceShowModal, oAlwaysShowDialog]);

end;

end.
