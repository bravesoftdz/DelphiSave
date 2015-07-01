unit unQRAnexoPCP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Qrctrls, QuickRpt, ExtCtrls, Db, SDEngine,
  QRPrntr, qrcb_run;
type
  TQRAnexoPCP = class(TQuickRep)
    QRBand1: TQRBand;
    qrLogoImage: TQRImage;
    sdqQuery: TSDQuery;
    ChildAnexoPCP: TQRChildBand;
    QRShape10: TQRShape;
    lbTituloDatosEmpleador: TQRLabel;
    QRShape23: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    lbDomicilioConstituido: TQRLabel;
    lbCalle: TQRLabel;
    lbFechaInicioActividad: TQRLabel;
    lbLocalidad: TQRLabel;
    lbCIIU: TQRLabel;
    lbCuit: TQRLabel;
    lbNombre: TQRLabel;
    QRShape32: TQRShape;
    lbEmail: TQRLabel;
    QRShape33: TQRShape;
    lbDomicilioProvincia: TQRLabel;
    QRShape34: TQRShape;
    lbCPA: TQRLabel;
    lbNro: TQRLabel;
    lbPiso: TQRLabel;
    lbDepto: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    lbTelefono: TQRLabel;
    QRShape39: TQRShape;
    lbTituloLugarDeTrabajo: TQRLabel;
    lbLugarDeTrabajo: TQRLabel;
    lbLugarDeTrabajo2: TQRLabel;
    lbNroPCP: TQRLabel;
    lbPiso1: TQRLabel;
    lbDeptoPCP: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    lbCallePCP: TQRLabel;
    lbLocalidadPCP: TQRLabel;
    lbCantTrabPCP: TQRLabel;
    lbProvinciaPCP: TQRLabel;
    lbCodigoPostal1PCP: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    lbNroPCP2: TQRLabel;
    lbPiso2: TQRLabel;
    lbDeptoPCP2: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    lbTelefono2PCP: TQRLabel;
    QRShape57: TQRShape;
    lbTelefonoPCP: TQRLabel;
    QRShape58: TQRShape;
    lbTituloRiesgos: TQRLabel;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    lbDescripcionTareas: TQRLabel;
    lbRiesgoElectrico: TQRLabel;
    lbPoseeRiesgoInstalacionElectrica: TQRLabel;
    lbRiesgoIncendioSi: TQRLabel;
    lbElectricoNo: TQRLabel;
    lbRiesgoIncendioNo: TQRLabel;
    lbRiesgoIncendio: TQRLabel;
    lbRiesgoIncendio2: TQRLabel;
    lbIndiqueRiesgoIncendio: TQRLabel;
    lbExtintorPortatilCo2: TQRLabel;
    lbExtintorTriclase: TQRLabel;
    lbExtintorAgua: TQRLabel;
    QRShape61: TQRShape;
    lbIncendioOtros: TQRLabel;
    lbElectricoSi: TQRLabel;
    chkRiesgoElectricoSi: TQRCheckBox;
    lbRiesgoQuimico: TQRLabel;
    lbInsecticidas: TQRLabel;
    lbAcidoMuriatico: TQRLabel;
    lbAmoniaco: TQRLabel;
    lbLavandina: TQRLabel;
    lbIndicaInstalacionesEdilicias: TQRLabel;
    lbDesengrasantes: TQRLabel;
    lbSodaCaustica: TQRLabel;
    lbDetergentes: TQRLabel;
    lbDesinfectantes: TQRLabel;
    lbRaticidas: TQRLabel;
    lbBencina: TQRLabel;
    lbCallePCP2: TQRLabel;
    lbLocalidadPCP2: TQRLabel;
    lbCantTrab2PCP: TQRLabel;
    lbProvincia2PCP: TQRLabel;
    lbCodigoPostal2PCP: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    lbInstalacionesEdilicias: TQRLabel;
    lbRopa: TQRLabel;
    lbBarandas: TQRLabel;
    lbTareasInteriores: TQRLabel;
    lbTareasExteriores: TQRLabel;
    lbEscaleras: TQRLabel;
    lbRopaDeTrabajo: TQRLabel;
    lbElementos: TQRLabel;
    chkRiesgoElectricoNo: TQRCheckBox;
    chkIncendioSi: TQRCheckBox;
    chkIncendioNo: TQRCheckBox;
    chkExtintorPortatilCO2: TQRCheckBox;
    chkExtintorTriclase: TQRCheckBox;
    chkExtintorAgua: TQRCheckBox;
    chkInsecticidasSi: TQRCheckBox;
    chkInsecticidasNo: TQRCheckBox;
    chkBencinaSi: TQRCheckBox;
    chkBencinaNo: TQRCheckBox;
    chkRaticidasSi: TQRCheckBox;
    chkRaticidasNo: TQRCheckBox;
    chkDesinfectantesSi: TQRCheckBox;
    chkDesinfectantesNo: TQRCheckBox;
    chkDetergentesSi: TQRCheckBox;
    chkDetergentesNo: TQRCheckBox;
    chkSodaCausticaSi: TQRCheckBox;
    chkSodaCausticaNo: TQRCheckBox;
    chkDesengrasantesSi: TQRCheckBox;
    chkDesengrasantesNo: TQRCheckBox;
    chkLavandinaSi: TQRCheckBox;
    chkLavandinaNo: TQRCheckBox;
    chkAmoniacoSi: TQRCheckBox;
    chkAmoniacoNo: TQRCheckBox;
    chkAcidoMuriaticoSi: TQRCheckBox;
    chkAcidoMuriaticoNo: TQRCheckBox;
    chkBarandasNo: TQRCheckBox;
    chkBarandasSi: TQRCheckBox;
    chkTareasInterioresSi: TQRCheckBox;
    chkTareasInterioresNo: TQRCheckBox;
    chkTareasExterioresSi: TQRCheckBox;
    chkTareasExterioresNo: TQRCheckBox;
    chkEscalerasSi: TQRCheckBox;
    chkEscalerasNo: TQRCheckBox;
    chkRopaDeTrabajoSi: TQRCheckBox;
    chkRopaDeTrabajoNo: TQRCheckBox;
    chkElementosSi: TQRCheckBox;
    chkElementosNo: TQRCheckBox;
    lbInsecticidasSi: TQRLabel;
    lbBencinaSi: TQRLabel;
    lbRaticidasSi: TQRLabel;
    lbDesinfectantesSi: TQRLabel;
    lbDetergentesSi: TQRLabel;
    lbSodaCausticaSi: TQRLabel;
    lbDesengrasantesSi: TQRLabel;
    lbLavandinaSi: TQRLabel;
    lbAmoniacoSi: TQRLabel;
    lbAcidoMuriaticoSi: TQRLabel;
    lbBarandasSi: TQRLabel;
    lbTareasInterioresSi: TQRLabel;
    lbTareasExterioresSi: TQRLabel;
    lbEscalerasSi: TQRLabel;
    lbRopaDeTrabajoSi: TQRLabel;
    lbElementosSi: TQRLabel;
    lbInsecticidasNo: TQRLabel;
    lbBencinaNo: TQRLabel;
    lbRaticidasNo: TQRLabel;
    lbDesinfectantesNo: TQRLabel;
    lbDetergentesNo: TQRLabel;
    lbSodaCausticaNo: TQRLabel;
    lbDesengrasantesNo: TQRLabel;
    lbLavandinaNo: TQRLabel;
    lbAmoniacoNo: TQRLabel;
    lbAcidoMuriaticoNo: TQRLabel;
    lbBarandasNo: TQRLabel;
    lbTareasInterioresNo: TQRLabel;
    lbTareasExterioresNo: TQRLabel;
    lbEscalerasNo: TQRLabel;
    lbRopaDeTrabajoNo: TQRLabel;
    lbElementosNo: TQRLabel;
    QRShape184: TQRShape;
    lbInsecticidasCualesPregunta: TQRLabel;
    QRShape185: TQRShape;
    lbRaticidasCualesPregunta: TQRLabel;
    QRShape186: TQRShape;
    lbTareasInterioresPreguntaCuales: TQRLabel;
    QRShape187: TQRShape;
    lbTareasExterioresPreguntaCuales: TQRLabel;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    lbElementosPreguntaCuales: TQRLabel;
    lbRopaDeTrabajoPreguntaCuales: TQRLabel;
    lbQuimicosOtros: TQRLabel;
    qrLogo: TQRImage;
    lbTitulo1: TQRLabel;
    lbTitulo2: TQRLabel;
    lbTitulo3: TQRLabel;
    lbContrato: TQRLabel;
    dbNombre: TQRDBText;
    dbCuit: TQRDBText;
    dbCIIU: TQRDBText;
    dbInicioactividad: TQRDBText;
    dbcalle: TQRDBText;
    dbNumero: TQRDBText;
    dbPiso: TQRDBText;
    dbDepartamento: TQRDBText;
    dbLocalidad: TQRDBText;
    dbProvincia: TQRDBText;
    dbCPA: TQRDBText;
    dbEmail: TQRDBText;
    dbTelefonos: TQRDBText;
    lbCallePCPdb: TQRLabel;
    lbCallePCP2db: TQRLabel;
    lbNrodb: TQRLabel;
    lbNro2db: TQRLabel;
    lbPisodb: TQRLabel;
    lbPiso2db: TQRLabel;
    lbDeptodb: TQRLabel;
    lbDepto2db: TQRLabel;
    lbLocalidaddb: TQRLabel;
    lbLocalidad2db: TQRLabel;
    lbProvinciadb: TQRLabel;
    lbProvincia2db: TQRLabel;
    lbTelefonoPCP2db: TQRLabel;
    lbTelefonoPCPdb: TQRLabel;
    lbCPAPCP: TQRLabel;
    lbCPA2PCP: TQRLabel;
    lbDescripcionTareasdb: TQRLabel;
    lbCualIncendioOtros: TQRLabel;
    lbInsecticidasCuales: TQRLabel;
    lbRaticidasCuales: TQRLabel;
    lbTareasInterioresCuales: TQRLabel;
    lbTareasExterioresCuales: TQRLabel;
    lbRopaDeTrabajoCuales: TQRLabel;
    lbElementosCuales: TQRLabel;
    lbOtrosQuimicos: TQRLabel;
    lbCantidadTrab: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LeftTrimOnPrint(Sender: TObject; var Value: String);
  private
    FContrato: Integer;
    procedure CargarDatosRiesgoPCP(const aIdFormulario : Integer);
    procedure CargarLugaresDeTrabajo(const aIdFormulario : Integer);

  public
    procedure Preparar(aCantCopias: Integer; aImprimir: Boolean = False; const aNombreArchivo: String = '');

    property aContrato: Integer read FContrato write FContrato;
  end;

var
  QRAnexoPCP: TQRAnexoPCP;

implementation

uses
  unDmPrincipal, unPrincipal, General, unArt, unExportPDF, AnsiSql;

const
  SQLANEXOA: String =
         'SELECT co_contrato, em_nombre, em_cuit, ac_codigo ||'' ''|| ac_descripcion ciiu, em_feinicactiv, ' +
         '       dc_calle, dc_numero, dc_piso, dc_departamento, dc_localidad, pv_descripcion, dc_cpostal, dc_mail, ' +
         '       dc_telefonos, co_idformulario ' +
         '  FROM aco_contrato' +
         '  LEFT JOIN aem_empresa ON co_idempresa = em_id' +
         '  LEFT JOIN cac_actividad ON co_idactividad = ac_id' +
         '  LEFT JOIN adc_domiciliocontrato ON co_contrato = dc_contrato AND dc_tipo = ''L''' +
         '  LEFT JOIN cpv_provincias ON dc_provincia = pv_codigo' +
         ' WHERE co_contrato = ';

{$R *.DFM}

procedure TQRAnexoPCP.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  try
    qrLogoImage.Picture.Bitmap.LoadFromResourceName(HInstance, RES_EMP_LOGO_BN);
  except
    //
  end;
end;

procedure TQRAnexoPCP.CargarDatosRiesgoPCP(const aIdFormulario: Integer);
var
  sSql : String;
  sdqCargaDatos: TSDQuery;
begin
  sdqCargaDatos := TSDQuery.Create(Self);
  try
    sSql :=
        ' SELECT sa_id, rp_id, NVL(sa_nombre, em_nombre) nombre , fo_id, rp_descripcion, rp_electrico, rp_incendio, rp_extintor, rp_extintor_cual, ' +
        '        rp_insecticida, rp_insecticida_cual, rp_bencina, rp_raticida, rp_raticida_cual, rp_desinfectantes, rp_detergentes, ' +
        '        rp_sodacaustica, rp_desengrasante, rp_hipocloritodesodio, rp_amoniaco, rp_acidomuriatico, rp_otroriesgoquimico, ' +
        '        rp_proteccionbalcones, rp_interioraltura, rp_interioraltura_cual, rp_exterioraltura, rp_exterioraltura_cual, ' +
        '        rp_escalerabaranda, rp_indumentaria, rp_indumentaria_cual, rp_proteccionpersonal, rp_proteccionpersonal_cual, co_contrato, ' +
        '        fo_formulario ' +
        '  FROM afo_formulario ' +
        '   LEFT JOIN afi.asa_solicitudafiliacion on fo_id = sa_idformulario ' +
        '   LEFT JOIN afi.arp_riesgo_pcp ON fo_id = rp_idformulario ' +
        '   LEFT JOIN afi.aco_contrato ON fo_id = co_idformulario ' +
        '   LEFT JOIN aem_empresa ON co_idempresa = em_id ' +
        '  WHERE fo_id = :formulario';
     sdqCargaDatos.DataBaseName := 'dbPrincipal';
     OpenQueryEx(sdqCargaDatos, [aIdFormulario], sSql, True);
     lbDescripcionTareasdb.Caption   := sdqCargaDatos.FieldByName('rp_descripcion').AsString;

     chkRiesgoElectricoSi.Checked    := sdqCargaDatos.FieldByName('rp_electrico').AsString = 'S';
     chkRiesgoElectricoNo.Checked    := not (sdqCargaDatos.FieldByName('rp_electrico').AsString = 'S');

     chkIncendioSi.Checked           := sdqCargaDatos.FieldByName('rp_incendio').AsString = 'S';
     chkIncendioNo.Checked           := not (sdqCargaDatos.FieldByName('rp_incendio').AsString = 'S');

     chkExtintorPortatilCO2.Checked  := sdqCargaDatos.FieldByName('rp_extintor').AsInteger = 1;
     chkExtintorTriclase.Checked     := sdqCargaDatos.FieldByName('rp_extintor').AsInteger = 2;
     chkExtintorAgua.Checked         := sdqCargaDatos.FieldByName('rp_extintor').AsInteger = 3;
     lbCualIncendioOtros.Caption     := sdqCargaDatos.FieldByName('rp_extintor_cual').AsString;

     chkInsecticidasSi.Checked       := sdqCargaDatos.FieldByName('rp_insecticida').AsString = 'S';
     chkInsecticidasNo.Checked       := not (sdqCargaDatos.FieldByName('rp_insecticida').AsString = 'S');
     lbInsecticidasCuales.Caption    := sdqCargaDatos.FieldByName('rp_insecticida_cual').AsString;

     chkBencinaSi.Checked            := sdqCargaDatos.FieldByName('rp_bencina').AsString = 'S';
     chkBencinaNo.Checked            := not (sdqCargaDatos.FieldByName('rp_bencina').AsString = 'S');

     chkRaticidasSi.Checked          := sdqCargaDatos.FieldByName('rp_raticida').AsString = 'S';
     chkRaticidasNo.Checked          := not (sdqCargaDatos.FieldByName('rp_raticida').AsString = 'S');
     lbRaticidasCuales.Caption       := sdqCargaDatos.FieldByName('rp_raticida_cual').AsString;

     chkDesinfectantesSi.Checked     := sdqCargaDatos.FieldByName('rp_desinfectantes').AsString = 'S';
     chkDesinfectantesNo.Checked     := not (sdqCargaDatos.FieldByName('rp_desinfectantes').AsString = 'S');

     chkDetergentesSi.Checked        := sdqCargaDatos.FieldByName('rp_detergentes').AsString = 'S';
     chkDetergentesNo.Checked        := not (sdqCargaDatos.FieldByName('rp_detergentes').AsString = 'S');

     chkSodaCausticaSi.Checked       := sdqCargaDatos.FieldByName('rp_sodacaustica').AsString = 'S';
     chkSodaCausticaNo.Checked       := not (sdqCargaDatos.FieldByName('rp_sodacaustica').AsString = 'S');

     chkDesengrasantesSi.Checked     := sdqCargaDatos.FieldByName('rp_desengrasante').AsString = 'S';
     chkDesengrasantesNo.Checked     := not (sdqCargaDatos.FieldByName('rp_desengrasante').AsString = 'S');

     chkLavandinaSi.Checked          := sdqCargaDatos.FieldByName('rp_hipocloritodesodio').AsString = 'S';
     chkLavandinaNo.Checked          := not (sdqCargaDatos.FieldByName('rp_hipocloritodesodio').AsString = 'S');

     chkAmoniacoSi.Checked           := sdqCargaDatos.FieldByName('rp_amoniaco').AsString = 'S';
     chkAmoniacoNo.Checked           := not (sdqCargaDatos.FieldByName('rp_amoniaco').AsString = 'S');

     chkAcidoMuriaticoSi.Checked     := sdqCargaDatos.FieldByName('rp_acidomuriatico').AsString = 'S';
     chkAcidoMuriaticoNo.Checked     := not (sdqCargaDatos.FieldByName('rp_acidomuriatico').AsString = 'S');

     lbOtrosQuimicos.Caption         := sdqCargaDatos.FieldByName('rp_otroriesgoquimico').AsString;

     chkBarandasSi.Checked           := sdqCargaDatos.FieldByName('rp_proteccionbalcones').AsString = 'S';
     chkBarandasNo.Checked           := not (sdqCargaDatos.FieldByName('rp_proteccionbalcones').AsString = 'S');

     chkTareasInterioresSi.Checked     := sdqCargaDatos.FieldByName('rp_interioraltura').AsString = 'S';
     chkTareasInterioresNo.Checked     := not (sdqCargaDatos.FieldByName('rp_interioraltura').AsString = 'S');
     lbTareasInterioresCuales.Caption  := sdqCargaDatos.FieldByName('rp_interioraltura_cual').AsString;

     chkTareasExterioresSi.Checked     := sdqCargaDatos.FieldByName('rp_exterioraltura').AsString = 'S';
     chkTareasExterioresNo.Checked     := not (sdqCargaDatos.FieldByName('rp_exterioraltura').AsString = 'S');
     lbTareasExterioresCuales.Caption  := sdqCargaDatos.FieldByName('rp_exterioraltura_cual').AsString;

     chkEscalerasSi.Checked            := sdqCargaDatos.FieldByName('rp_escalerabaranda').AsString = 'S';
     chkEscalerasNo.Checked            := not (sdqCargaDatos.FieldByName('rp_escalerabaranda').AsString = 'S');

     chkRopaDeTrabajoSi.Checked        := sdqCargaDatos.FieldByName('rp_indumentaria').AsString = 'S';
     chkRopaDeTrabajoNo.Checked        := not (sdqCargaDatos.FieldByName('rp_indumentaria').AsString = 'S');
     lbRopaDeTrabajoCuales.Caption     := sdqCargaDatos.FieldByName('rp_indumentaria_cual').AsString;

     chkElementosSi.Checked            := sdqCargaDatos.FieldByName('rp_proteccionpersonal').AsString = 'S';
     chkElementosNo.Checked            := not (sdqCargaDatos.FieldByName('rp_proteccionpersonal').AsString = 'S');
     lbElementosCuales.Caption         := sdqCargaDatos.FieldByName('rp_proteccionpersonal_cual').AsString;

  finally
    sdqCargaDatos.Free;
  end;
end;

procedure TQRAnexoPCP.CargarLugaresDeTrabajo(const aIdFormulario: Integer);
var
  sSql : String;
  sdqCargaDatos: TSDQuery;
begin
  lbCallePCPdb.Caption     := '';
  lbNrodb.Caption          := '';
  lbPisodb.Caption         := '';
  lbDeptodb.Caption        := '';
  lbLocalidaddb.Caption    := '';
  lbProvinciadb.Caption    := '';
  lbTelefonoPCPdb.Caption  := '';
  lbCPAPCP.Caption         := '';

  lbCallePCP2db.Caption    := '';
  lbNro2db.Caption         := '';
  lbPiso2db.Caption        := '';
  lbDepto2db.Caption       := '';
  lbLocalidad2db.Caption   := '';
  lbProvincia2db.Caption   := '';
  lbTelefonoPCP2db.Caption := '';
  lbCPA2PCP.Caption        := '';

  sdqCargaDatos := TSDQuery.Create(Self);
  try
    sSql :=
        ' SELECT lt_id, lt_nrolugartrabajo, lt_idsolicitud, lt_idformulario, lt_contrato, lt_calle, ' +
        '        lt_numero, lt_piso, lt_departamento, lt_localidad, lt_cpostal, lt_provincia, ' +
        '        lt_codareatelefonos, lt_codareafax, lt_fax, lt_domicilio, lt_usualta, ' +
        '        lt_codareatelefonos ||'' ''||  lt_telefonos tel,' +
        '        pv_descripcion, lt_telefonos ' +
        '   FROM afi.alt_lugartrabajo_pcp, cpv_provincias' +
        '  WHERE lt_provincia = pv_codigo(+) ' +
        '    AND lt_idformulario = :formulario' +
        '    AND lt_fechabaja IS NULL ' +
        '    ORDER BY lt_numero ASC' ;

    sdqCargaDatos.DataBaseName := 'dbPrincipal';
    OpenQueryEx(sdqCargaDatos, [aIdFormulario], sSql, True);
    lbCallePCPdb.Caption    := sdqCargaDatos.FieldByName('lt_calle').AsString;
    lbNrodb.Caption         := sdqCargaDatos.FieldByName('lt_numero').AsString;
    lbPisodb.Caption        := sdqCargaDatos.FieldByName('lt_piso').AsString;
    lbDeptodb.Caption       := sdqCargaDatos.FieldByName('lt_departamento').AsString;
    lbLocalidaddb.Caption   := sdqCargaDatos.FieldByName('lt_localidad').AsString;
    lbProvinciadb.Caption   := sdqCargaDatos.FieldByName('pv_descripcion').AsString;
    lbTelefonoPCPdb.Caption := sdqCargaDatos.FieldByName('tel').AsString;
    lbCPAPCP.Caption        := sdqCargaDatos.FieldByName('lt_cpostal').AsString;
    sdqCargaDatos.Next;
    if not sdqCargaDatos.eof then
      begin
        lbCallePCP2db.Caption    := sdqCargaDatos.FieldByName('lt_calle').AsString;
        lbNro2db.Caption         := sdqCargaDatos.FieldByName('lt_numero').AsString;
        lbPiso2db.Caption        := sdqCargaDatos.FieldByName('lt_piso').AsString;
        lbDepto2db.Caption       := sdqCargaDatos.FieldByName('lt_departamento').AsString;
        lbLocalidad2db.Caption   := sdqCargaDatos.FieldByName('lt_localidad').AsString;
        lbProvincia2db.Caption   := sdqCargaDatos.FieldByName('pv_descripcion').AsString;
        lbTelefonoPCP2db.Caption := sdqCargaDatos.FieldByName('tel').AsString;
        lbCPA2PCP.Caption        := sdqCargaDatos.FieldByName('lt_cpostal').AsString;
      end;
  finally
    sdqCargaDatos.Free;
  end;

  sSQL := 'SELECT sum(ap_canttrabajador)  ' +
          '  FROM afi.aap_alicuotas_pcp  ' +
          '       LEFT JOIN afi.app_parametro_pcp ON ap_idparametro_pcp = pp_id  ' +
          ' WHERE ap_idformulario = :formulario ';

  lbCantidadTrab.Caption := ValorSqlEx(sSql, [aIdFormulario], '');

end;

procedure TQRAnexoPCP.LeftTrimOnPrint(Sender: TObject; var Value: String);
begin
  inherited;

  Value := Trim(Value);
end;

procedure TQRAnexoPCP.Preparar(aCantCopias: Integer; aImprimir: Boolean = False; const aNombreArchivo: String = '');
begin
  qrLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');


  OpenQuery(sdqQuery, SQLANEXOA + SqlValue(aContrato), True);
  lbContrato.Caption := 'Nº ' + sdqQuery.FieldByName('co_contrato').AsString;
  lbNombre.Caption := lbNombre.Caption +' '+ sdqQuery.FieldByName('em_nombre').AsString;
  CargarLugaresDeTrabajo(sdqQuery.FieldByName('co_idformulario').AsInteger);
  CargarDatosRiesgoPCP(sdqQuery.FieldByName('co_idformulario').AsInteger);

  PrinterSettings.Copies := aCantCopias;

  // Agregado para que salga bien la carga de impresión masiva de contratos en la impresora LaserJet 4050 de Afiliaciones..
  if (IsWinXP) or (IsWindows7) then
  begin
    PrinterSettings.UseCustomBinCode := False;
    PrinterSettings.OutputBin := LexmarkAfiliacionesBin1;
    PrinterSettings.PaperSize := Letter;
  end;

  if aNombreArchivo <> '' then
    FileToPDFSvr(QRAnexoPCP, ExtractFileDir(aNombreArchivo), aNombreArchivo, True)
  else if aImprimir then
    Print
  else
    Preview;
end;

end.
