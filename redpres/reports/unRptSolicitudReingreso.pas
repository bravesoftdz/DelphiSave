unit unRptSolicitudReingreso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  Data.DB, SDEngine, unComunes, unDmPrincipal, AnsiSql, unVisualizador;

type
  TfrmRptSolicitudReingreso = class(TForm)
    qrSolicitudReingreso: TQuickRep;
    qrHeader: TQRBand;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    qrlART: TQRLabel;
    qrTitle: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    qrbTrabajador: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText79: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel30: TQRLabel;
    QRShape12: TQRShape;
    QRDBText80: TQRDBText;
    QRDBText25: TQRDBText;
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
    qrbEmpresa: TQRChildBand;
    QRLabel50: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText51: TQRDBText;
    qrlDatosEmpDep: TQRLabel;
    qrbPrestador: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText52: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape14: TQRShape;
    QRDBText59: TQRDBText;
    QRDBText53: TQRDBText;
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
    QRLabel110: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel24: TQRLabel;
    QRShape4: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape18: TQRShape;
    qrMemoNotaAlPie1: TQRMemo;
    sdqReporte: TSDQuery;
    QRDBText6: TQRDBText;
    QRMemo2: TQRMemo;
    QRLabel34: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
  private
    { Private declarations }
     procedure Do_AsignarSQL_sdqReporte(IdExpediente, iIdCC, iIdPrest:Integer);
  public
    { Public declarations }
    procedure Imprimir(IdExpediente, iIdCC: integer; ASiniestroCompleto:String; ASiniestro: integer; iIdPrestConsultorio: integer = 0);
  end;

var
  frmRptSolicitudReingreso: TfrmRptSolicitudReingreso;

implementation

{$R *.dfm}

{ TfrmRptSolicitudReingreso }

procedure TfrmRptSolicitudReingreso.Imprimir(IdExpediente, iIdCC: integer; ASiniestroCompleto:String; ASiniestro: integer; iIdPrestConsultorio: integer = 0);
begin
  Do_AsignarSQL_sdqReporte(IdExpediente, iIdCC, iIdPrestConsultorio);

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

  qrMemoNotaAlPie1.Lines.Add('Sr. Trabajador en caso de discrepancia con esta decisión, Ud. puede concurrir a la Comisión Médica sita en ' +
                              sdqReporte.FieldByName('COMI_TRABA').AsString + ', concurriendo personalmente a fin de someterse a evaluación médica.');
  qrMemoNotaAlPie1.Lines.Add('Los datos de contacto de Provincia ART son: 0800-333-1278 en el horario de 09 a 18 hs. ');

  Visualizar(qrSolicitudReingreso, GetValores(' - ' + ASiniestroCompleto, '', 0, ASiniestro),
            [oAutoFirma, oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;

procedure TfrmRptSolicitudReingreso.Do_AsignarSQL_sdqReporte(IdExpediente, iIdCC, iIdPrest: Integer);
var sSql: string;
begin
  sdqReporte.Close;
  sSql := ' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' art.utiles.armar_cuit(ex_cuit) CUIT, ' +
                 ' art.utiles.armar_cuit(ex_cuil) CUIL, ' +
                 ' decode(ex_tipo, 1, ''X'', '''') as ex_tipo_1, ' +
                 ' decode(ex_tipo, 2, ''X'', '''') as ex_tipo_2, ' +
                 ' decode(ex_tipo, 3, ''X'', '''') as ex_tipo_3, ' +
                 ' decode(ex_intercurrencia, ''S'', ''X'', '''') as ex_intercurrencia, ' +
                 ' NVL(ex_fechamanifestacion, ex_fechaaccidente) FechaAcc, ' +
                 ' ex_horaaccidente as fechaacc_hora, ' +

                 ' /* Empresa */ ' +
                 ' art.utiles.armar_domicilio(mp_calle_post, mp_numero_post, mp_piso_post, mp_departamento_post) empresa_domicilio, ' +
                 ' mp_nombre empresa_nombre, mp_telefonos empresa_telefonos, mp_fax_post as empresa_fax, mp_localidad_post empresa_localidad, ' +
                 ' mp_cpostal_post empresa_cpostal, cpv_cmp.pv_descripcion empresa_provincia, co_direlectronica, co_contrato, ac_codigo as ciiu, ' +
                 ' /* Trabajador */ ' +
                 ' art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) trabajador_domicilio, tj_nombre, ' +
                 ' art.trabajador.get_telefono(tj_id, 5) Telefono, tj_localidad, tj_cpostal, cpv_ctj.pv_descripcion trabajador_provincia, tj_fnacimiento, ' +
                 ' tj_calle, tj_numero, tj_piso, tj_departamento, ' +

                 ' decode(tj_sexo, ''M'', ''X'', '''') as sexo_M, ' +
                 ' decode(tj_sexo, ''F'', ''X'', '''') as sexo_F, ' +
                 ' (Select tt_area || '' - '' || tt_numero ' +
                    ' From art.ATT_TELEFONOTRABAJADOR ' +
                   ' where tt_idtrabajador = tj_id ' +
                     ' and tt_idtipotelefono = 3 ' +
                     ' and rownum = 1) Celular, ' +
                 ' (Select ''DDN ('' || tt_area || '') - '' || tt_numero ' +
                    ' From art.ATT_TELEFONOTRABAJADOR ' +
                   ' where tt_idtrabajador = tj_id ' +
                     ' and tt_idtipotelefono = 2 ' +
                     ' and rownum = 1) TelFijo, ' +
                 ' /* Prestador */ ' +
                 ' cpr.ca_calle ca_calle, cpr.ca_numero ca_numero, nvl(cpr.ca_piso, null) ca_piso, nvl(cpr.ca_departamento, null) ca_departamento, ' +
                 ' utiles.armar_domicilio(cpr.ca_calle, cpr.ca_numero, cpr.ca_piso, cpr.ca_departamento) prestador_domicilio, ' +
                 ' cpr.ca_descripcion prestador_nombre, cpr.ca_telefono prestador_telefono, ' +
                 ' cpr.ca_clave as prestador_cuit, cpr.ca_localidad as prestador_localidad, ' +
                 ' cpv_cmp.pv_descripcion prestador_provincia, ca_fax as prestador_fax, ca_codpostal, ca_direlectronica, ' +
                 ' art.inca.get_comisiontrabajador(ex_cuil) comi_traba, ' +
                 ' NVL(DE_INICIOINASISTENCIALABORAL, ex_bajamedica) FecInicioInasistenciaLaboral, ' +
                 ' NVL(PI_EPMANIFESTACION, ex_bajamedica) FecPrimeraAtencionMedica, ' +
                 ' decode(CC_ACEPTARREINGRESO, ''S'', ''X'', '''') as AceptaRein_Si, ' +
                 ' decode(CC_ACEPTARREINGRESO, ''N'', ''X'', '''') as AceptaRein_No, ' +
                 ' CC_MOTIVONOACEPTAREING, cc_fecha, ex_altamedica ' +

            ' FROM art.sex_expedientes sex, art.cpr_prestador cpr, cmp_empresas, ' +
                 ' cac_actividad, aco_contrato, ctj_trabajador, ' +
                 ' cpv_provincias cpv_cpr, cpv_provincias cpv_cmp, cpv_provincias cpv_ctj, ' +
                 ' SIN.stg_tipogravedad, SIN.spe_partedeegreso, SIN.sde_denuncia, SIN.SPI_PARTEDEINGRESO, SIN.SSA_SOLICITUDASISTENCIA, ' +
                 ' art.mcc_citacionconsultorio ' +
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
         ' AND co_idactividad = ac_id ' +
         ' AND cc_idexpediente = ex_id ' +  // no pongo outer join porque seguro este reporte viene de Consultorio
         ' AND cc_id = ' + SqlInt(iIdCC);

  if (iIdPrest > 0) then                              // TK 63718
    sSql := sSql + ' AND cpr.ROWID = (SELECT ROWID ' +                 // TK 63992 (saque el outer join)
                                         ' FROM cpr_prestador ' +
                                        ' WHERE ca_identificador = ' + SqlInt(iIdPrest) + ') '
  else
    sSql := sSql + ' AND cpr.ROWID(+) = art.SIN.get_prestadorid(ex_siniestro, ex_orden, ex_recaida) ';

  sdqReporte.SQL.Text := sSql;

end;

end.
