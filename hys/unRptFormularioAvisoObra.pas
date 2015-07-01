unit unRptFormularioAvisoObra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, qrcb_run;

type
  TrptFormularioAvisodeObra = class(TForm)  
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    edRazonSocial: TQRLabel;
    edDomicilioLegal: TQRLabel;
    edCUIT: TQRLabel;
    edProvincia: TQRLabel;
    edTelefono: TQRLabel;
    edCIIU: TQRLabel;
    edLocalidad: TQRLabel;
    edCPA: TQRLabel;
    QRBand1: TQRBand;
    logo: TQRImage;
    edFechaTitulo: TQRLabel;
    PageFooterBand2: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel4: TQRLabel;
    edContrato: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel5: TQRLabel;
    edMail: TQRLabel;
    edActividad: TQRLabel;
    lbactividad: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    edCalle: TQRLabel;
    edLocalidadObra: TQRLabel;
    edCPAObra: TQRLabel;
    edProvinciaObra: TQRLabel;
    edDescripcionObra1: TQRLabel;
    QRLabel37: TQRLabel;
    edNroObra: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    edRespHigySeg1: TQRLabel;
    QRShape12: TQRShape;
    QRLabel55: TQRLabel;
    QRShape13: TQRShape;
    edComitente: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel59: TQRLabel;
    edContratistaPrincipal: TQRLabel;
    QRShape14: TQRShape;
    QRLabel67: TQRLabel;
    QRShape16: TQRShape;
    edFechaInicioTrabajo: TQRLabel;
    QRLabel69: TQRLabel;
    d: TQRShape;
    edFechaEstimadaFinalizacion: TQRLabel;
    QRShape3: TQRShape;
    QRLabel29: TQRLabel;
    QRShape24: TQRShape;
    QRLabel70: TQRLabel;
    edSuperficieaConstruir: TQRLabel;
    QRLabel72: TQRLabel;
    edNumeroPlantas: TQRLabel;
    cbCaminos: TQRCheckBox;
    cbCalles: TQRCheckBox;
    cbAvisodeObra: TQRCheckBox;
    cbSuspension: TQRCheckBox;
    cbExtension: TQRCheckBox;
    cbSuspensionDefinitiva: TQRCheckBox;
    cbPuentes: TQRCheckBox;
    cbObrasHidraulicas: TQRCheckBox;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel39: TQRLabel;
    cbTuneles: TQRCheckBox;
    cbAeropuertos: TQRCheckBox;
    cbAlcantarillas: TQRCheckBox;
    cbPuertos: TQRCheckBox;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    cbObrasFerroviarias: TQRCheckBox;
    cbAutopista: TQRCheckBox;
    cbOtros: TQRCheckBox;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRLabel48: TQRLabel;
    cbViviendasUnifamiliares: TQRCheckBox;
    cbEdificiosPisosMultiples: TQRCheckBox;
    cbEdificiosComerciales: TQRCheckBox;
    lbEdificiosPisosMultiples: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    cbEdificiosOficinas: TQRCheckBox;
    cbObrasUrbanizacion: TQRCheckBox;
    cbOtrasEdificacionesUrbanas: TQRCheckBox;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    cbHospitales: TQRCheckBox;
    cbEscuelas: TQRCheckBox;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel52: TQRLabel;
    cbDestileriaRefineriasPetroquimicas: TQRCheckBox;
    cbDemasMontajesIndustriales: TQRCheckBox;
    cbObrasMineria: TQRCheckBox;
    QRLabel62: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    cbIndustriaManufactureraUrbana: TQRCheckBox;
    cbGeneracionElectrica: TQRCheckBox;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    cbTransmisionElectricaBajoVoltaje: TQRCheckBox;
    cbOtrasObrasRedes: TQRCheckBox;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    cbComunicaciones: TQRCheckBox;
    cbTransmisionElectricaAltoVoltaje: TQRCheckBox;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    cbEstaciones: TQRCheckBox;
    QRLabel86: TQRLabel;
    cbTuberias: TQRCheckBox;
    QRLabel84: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel79: TQRLabel;
    cbExcavacionesSubterraneas: TQRCheckBox;
    cbReparacionesRefacciones: TQRCheckBox;
    cbInstalacionesElectromecanicas: TQRCheckBox;
    QRLabel85: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    cbInstalacionesHidraulicas: TQRCheckBox;
    cbOtrasObrasNoEspecificadas: TQRCheckBox;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    cbInstalacionesAireAcondicionado: TQRCheckBox;
    QRLabel91: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel92: TQRLabel;
    cbExcavacionSubsuelos: TQRCheckBox;
    cbExcavacionSubmuraciones: TQRCheckBox;
    cbDemolicionTotal: TQRCheckBox;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    cbExcavacion503: TQRCheckBox;
    cbDemolicionParcial: TQRCheckBox;
    cbSilletasAndamios: TQRCheckBox;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    cbAltaMediaTension: TQRCheckBox;
    cbMas1000oMas4m: TQRCheckBox;
    cbIzaje: TQRCheckBox;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;                                                                 
    cbHormigonArmado: TQRCheckBox;
    cbInstalacionesVarias: TQRCheckBox;
    cbObrasDetallar: TQRCheckBox;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel96: TQRLabel;
    edExcSubmuracionesInicio: TQRLabel;
    QRLabel98: TQRLabel;
    edExcSubmuracionesHasta: TQRLabel;
    QRLabel109: TQRLabel;
    edExcSubsuelosInicio: TQRLabel;
    QRLabel111: TQRLabel;
    edExcSubsuelosHasta: TQRLabel;
    QRLabel117: TQRLabel;
    edDemTotalInicio: TQRLabel;
    QRLabel119: TQRLabel;
    edDemTotalHasta: TQRLabel;
    QRLabel121: TQRLabel;
    edExc503Inicio: TQRLabel;
    QRLabel123: TQRLabel;
    edExc503Hasta: TQRLabel;
    QRLabel113: TQRLabel;
    edDemParcialInicio: TQRLabel;
    QRLabel115: TQRLabel;
    edDemParcialHasta: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    cbTareasElectricidad: TQRCheckBox;
    cbAscensoresMontacargas: TQRCheckBox;
    cbTrabajosPinturas: TQRCheckBox;
    cbEstructurasMetallicas: TQRCheckBox;
    cbMontajesElectromecanicos: TQRCheckBox;
    cbTrabajosAlbanileria: TQRCheckBox;
    QRShape29: TQRShape;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    edFechaextension: TQRLabel;
    edfechaSuspension: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    edFechaSuspensionDefinitiva: TQRLabel;
    edFechaReinicia: TQRLabel;
    QRShape30: TQRShape;
    QRMemo2: TQRMemo;
    QRShape32: TQRShape;
    QRMemo3: TQRMemo;
    s: TQRShape;
    QRLabel139: TQRLabel;
    QRShape33: TQRShape;
    edEstado: TQRLabel;
    edCanEmpAdm: TQRLabel;
    edProd: TQRLabel;
    edSubcontratista: TQRLabel;
    QRShape31: TQRShape;
    QRShape34: TQRShape;
    edFechaSello: TQRLabel;
    QRLabel11: TQRLabel;
    QRMemo4: TQRMemo;
    edDescripcionObra2: TQRLabel;
    cbOtrasObrasDuctos: TQRCheckBox;
    edDetalleExc503: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    FidAvisoOWeb : Integer;
    FPath         : String;
    procedure CargarAvisoDeObra(idavisoObra: Integer);
    procedure Exportar(idavisoObra : Integer; sPath : String = '');

  end;
var
  rptFormularioAvisodeObra: TrptFormularioAvisodeObra;

implementation

uses unVisualizador, unDmPrincipal, AnsiSql, ArchFuncs, unExportPDF, General,
  SDEngine;

{$R *.dfm}

procedure TrptFormularioAvisodeObra.Exportar(idavisoObra : Integer; sPath : String = '');
begin
  FPath := sPath;
  CargarAvisoDeObra(idavisoObra);
end;

procedure TrptFormularioAvisodeObra.CargarAvisoDeObra(idavisoObra : Integer);
var
  sSql : String;
  path : String;
  sEstableci : String;
  sArquitectura : String;
begin
  Logo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );

  sSql := 'SELECT GREATEST (ao_fecharecepcion, nvl((SELECT MAX (aw_fechaalta) FROM hys.haw_avisoobraweb WHERE  '+
          IIF(FidAvisoOWeb > 0,' aw_id = '+sqlvalue(FidAvisoOWeb), ' aw_idavisoobra = ao_id AND aw_estado = ''T''') +'),ao_fecharecepcion)) ao_fecharecepcion, '+
          '       em_nombre, em_cuit, co_contrato, art.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilioempresa, '+
          '       dc_localidad, (SELECT pv_descripcion '+
          '                        FROM art.cpv_provincias '+
          '                       WHERE pv_codigo = dc_provincia) provempresa, dc_cpostala, co_direlectronica, substr(dc_telefonos,0,19) dc_telefonos, ac_codigo, '+
          '       substr(ac_descripcion,0,57) ac_descripcion, es_calle, es_numero || es_piso || es_departamento numeroestab, es_localidad, '+
          '       (SELECT pv_descripcion '+
          '          FROM art.cpv_provincias '+
          '         WHERE pv_codigo = es_provincia) provestab, es_cpostala, substr(ao_observaciones,0,96)ao_observaciones1, substr(ao_observaciones,96,128) ao_observaciones2,'+
          '       (SELECT SUBSTR (   ct_contacto || '' '' || ''Tel. ('' || ct_codareatelefonos || '') '' || ct_telefonos, 0, 96) '+
          '         FROM act_contacto WHERE ct_id = ao_contacto) responsable1, '+
          '       NVL2(ao_cuitcomitente, ao_cuitcomitente || '' - '', '''') || AO_RAZONSOCIALCOMITENTE comitente, '+
          '       NVL2(ao_cuitcontratista, ao_cuitcontratista || '' - '', '''') || AO_RAZONSOCIALcontratista contratista, '+
          '       NVL2(ao_cuitsubcontratista, ao_cuitsubcontratista || '' - '', '''') || AO_RAZONSOCIALsubcontratista subcontratista,'+
          '       ao_fechainicio, ao_fechafindeobra, ao_superficie, ao_plantas, ao_ingenieriacivil, ao_arquitectura, '+
          '       ao_montajeindustial, ao_ductos, ao_redes, ao_otras, ao_submuraciones, ao_subsuelos, ao_fechaexcavacion, '+
          '       ao_fechaexcavacionhasta, ao_total, ao_parcial, ao_fechademolicion, ao_fechademolicionhasta, ao_excavacion503, '+
          '       ao_fechadesdeexcavacion503, ao_fechahastaexcavacion503, ao_detalleexcavacion503, ao_actividad, ao_fechaextension, '+
          '       ao_fechasuspension, ao_fechareinicio, '+
          '       to_char(GREATEST (ao_fechaalta, '+IIF(FidAvisoOWeb > 0,'art.actualdate', ' nvl((SELECT MAX (aw_fechamodif) FROM hys.haw_avisoobraweb WHERE '+
          '       aw_idavisoobra = ao_id AND aw_estado = ''T'' ),ao_fechaalta)')+  ') ,''DD MON YYYY'') ao_fechaalta,AO_TIPOFORMULARIO,  '+
          '       DECODE(ao_tipoformulario, ''AO'', ''RECIBIDO'', ''S'', ''SUSPENDIDO'', ''E'', ''EXTENDIDO'', ''SD'', ''SUSPENDIDO DEFINITIVO'', '''') tipoformulario, ao_Estableci'+
          '  FROM afi.adc_domiciliocontrato, art.pao_avisoobra a, afi.aco_contrato, afi.aem_empresa, comunes.cac_actividad,'+
          '       afi.aes_establecimiento'+
          ' WHERE ao_cuit = em_cuit'+
          '   AND ao_id = '+SqlValue(idavisoObra)+
          '   AND co_contrato = dc_contrato '+
          '   AND co_idempresa = em_id '+
          '   AND co_contrato = art.get_vultcontrato(ao_cuit) '+
          '   AND dc_tipo = ''L''  '+
          '   AND co_idactividad = ac_id  '+
          '   AND es_nroestableci = ao_estableci '+
          '   AND es_contrato = co_contrato';

  with GetQuery(sSql) do
  begin
    sEstableci                     := fieldbyname('ao_Estableci').AsString;
    cbAvisodeObra.Checked          := fieldbyname('AO_TIPOFORMULARIO').AsString = 'AO';
    cbExtension.Checked            := fieldbyname('AO_TIPOFORMULARIO').AsString = 'E';
    cbSuspension.Checked           := fieldbyname('AO_TIPOFORMULARIO').AsString = 'S';
    cbSuspensionDefinitiva.Checked := fieldbyname('AO_TIPOFORMULARIO').AsString = 'SD';
    edFechaTitulo.Caption := 'Fecha '+fieldbyname('ao_fecharecepcion').AsString;
    edRazonSocial.Caption := fieldbyname('em_nombre').AsString;
    edCUIT.Caption := fieldbyname('em_cuit').AsString;
    edContrato.Caption := fieldbyname('co_contrato').AsString;
    edDomicilioLegal.Caption := fieldbyname('domicilioempresa').AsString;
    edLocalidad.Caption := fieldbyname('dc_localidad').AsString;
    edProvincia.Caption := fieldbyname('provempresa').AsString;
    edCPA.Caption := fieldbyname('dc_cpostala').AsString;
    edMail.Caption := fieldbyname('co_direlectronica').AsString;
    edTelefono.Caption := fieldbyname('dc_telefonos').AsString;
    edCIIU.Caption := fieldbyname('ac_codigo').AsString;
    edActividad.Caption := fieldbyname('ac_descripcion').AsString;
    edCanEmpAdm.Caption := '';
    edProd.Caption := '';

    edCalle.Caption := fieldbyname('es_calle').AsString;
    edNroObra.Caption := fieldbyname('numeroestab').AsString;
    edLocalidadObra.Caption := fieldbyname('es_localidad').AsString;
    edProvinciaObra.Caption := fieldbyname('provestab').AsString;
    edCPAObra.Caption := fieldbyname('es_cpostala').AsString;
    edDescripcionObra1.Caption := fieldbyname('ao_observaciones1').AsString;
    edDescripcionObra2.Caption := fieldbyname('ao_observaciones2').AsString;
    edRespHigySeg1.Caption := fieldbyname('responsable1').AsString;
    edComitente.Caption := fieldbyname('comitente').AsString;
    edContratistaPrincipal.Caption := fieldbyname('contratista').AsString;
    edSubcontratista.Caption := fieldbyname('subcontratista').AsString;
    edFechaInicioTrabajo.Caption := fieldbyname('ao_fechainicio').AsString;
    edFechaEstimadaFinalizacion.Caption := fieldbyname('ao_fechafindeobra').AsString;

    edSuperficieaConstruir.Caption := fieldbyname('ao_superficie').AsString;
    edNumeroPlantas.Caption := fieldbyname('ao_plantas').AsString;
    //Ingenieria civil
    cbCaminos.Checked           := FieldByName('ao_ingenieriacivil').AsString[1] = 'S';
    cbCalles.Checked            := FieldByName('ao_ingenieriacivil').AsString[2] = 'S';
    cbAutopista.Checked         := FieldByName('ao_ingenieriacivil').AsString[3] = 'S';
    cbPuentes.Checked           := FieldByName('ao_ingenieriacivil').AsString[4] = 'S';
    cbTuneles.Checked           := FieldByName('ao_ingenieriacivil').AsString[5] = 'S';
    cbObrasFerroviarias.Checked := FieldByName('ao_ingenieriacivil').AsString[6] = 'S';
    cbObrasHidraulicas.Checked  := FieldByName('ao_ingenieriacivil').AsString[7] = 'S';
    cbAlcantarillas.Checked     := FieldByName('ao_ingenieriacivil').AsString[8] = 'S';
    cbPuertos.Checked           := FieldByName('ao_ingenieriacivil').AsString[9] = 'S';
    cbAeropuertos.Checked       := FieldByName('ao_ingenieriacivil').AsString[10] = 'S';
    cbOtros.Checked             := FieldByName('ao_ingenieriacivil').AsString[11] = 'S';
    //Arquitectura
    cbViviendasUnifamiliares.Checked    := FieldByName('ao_arquitectura').AsString[1] = 'S';
    cbEdificiosPisosMultiples.Checked   := FieldByName('ao_arquitectura').AsString[2] = 'S';
    cbObrasUrbanizacion.Checked         := FieldByName('ao_arquitectura').AsString[3] = 'S';
    cbEdificiosComerciales.Checked      := FieldByName('ao_arquitectura').AsString[4] = 'S';
    cbEdificiosOficinas.Checked         := FieldByName('ao_arquitectura').AsString[5] = 'S';
    cbEscuelas.Checked                  := FieldByName('ao_arquitectura').AsString[6] = 'S';
    cbHospitales.Checked                := FieldByName('ao_arquitectura').AsString[7] = 'S';
    cbOtrasEdificacionesUrbanas.Checked := FieldByName('ao_arquitectura').AsString[8] = 'S';
    //Montaje Industrial
    sArquitectura := FieldByName('ao_montajeindustial').AsString;
    cbDestileriaRefineriasPetroquimicas.Checked := FieldByName('ao_montajeindustial').AsString[1] = 'S';
    cbGeneracionElectrica.Checked               := FieldByName('ao_montajeindustial').AsString[2] = 'S';
    cbObrasMineria.Checked                      := FieldByName('ao_montajeindustial').AsString[3] = 'S';
    cbIndustriaManufactureraUrbana.Checked      := FieldByName('ao_montajeindustial').AsString[4] = 'S';
    cbDemasMontajesIndustriales.Checked         := FieldByName('ao_montajeindustial').AsString[5] = 'S';
    //Obras de ductos
    cbTuberias.Checked         := FieldByName('ao_ductos').AsString[1] = 'S';
    cbEstaciones.Checked       := FieldByName('ao_ductos').AsString[2] = 'S';
    cbOtrasObrasDuctos.Checked := FieldByName('ao_ductos').AsString[3] = 'S';
    //Obras de Redes
    cbTransmisionElectricaAltoVoltaje.Checked := FieldByName('ao_redes').AsString[1] = 'S';
    cbTransmisionElectricaBajoVoltaje.Checked := FieldByName('ao_redes').AsString[2] = 'S';
    cbComunicaciones.Checked                  := FieldByName('ao_redes').AsString[3] = 'S';
    cbOtrasObrasRedes.Checked                 := FieldByName('ao_redes').AsString[4] = 'S';
    //Otras Construcciones
    cbExcavacionesSubterraneas.Checked       := FieldByName('ao_otras').AsString[1] = 'S';
    cbInstalacionesHidraulicas.Checked       := FieldByName('ao_otras').AsString[2] = 'S';
    cbInstalacionesElectromecanicas.Checked  := FieldByName('ao_otras').AsString[3] = 'S';
    cbInstalacionesAireAcondicionado.Checked := FieldByName('ao_otras').AsString[4] = 'S';
    cbReparacionesRefacciones.Checked        := FieldByName('ao_otras').AsString[5] = 'S';
    cbOtrasObrasNoEspecificadas.Checked      := FieldByName('ao_otras').AsString[6] = 'S';
    //Excavacion
    edExcSubmuracionesInicio.Caption := '';
    edExcSubmuracionesHasta.Caption  := '';
    edExcSubsuelosInicio.Caption := '';
    edExcSubsuelosHasta.Caption  := '';
    if FieldByName('ao_submuraciones').AsString = 'S' then
    begin
      cbExcavacionSubmuraciones.Checked := True;
      edExcSubmuracionesInicio.Caption := FieldByName('ao_fechaexcavacion').AsString;
      edExcSubmuracionesHasta.Caption  := FieldByName('ao_fechaexcavacionhasta').AsString;
    end;
    if FieldByName('ao_subsuelos').AsString = 'S' then
    begin
      cbExcavacionSubsuelos.Checked := True;
      edExcSubsuelosInicio.Caption := FieldByName('ao_fechaexcavacion').AsString;
      edExcSubsuelosHasta.Caption  := FieldByName('ao_fechaexcavacionhasta').AsString;
    end;
    //Demolicion
    edDemTotalInicio.Caption := '';
    edDemTotalHasta.Caption  := '';
    edDemParcialInicio.Caption := '';
    edDemParcialHasta.Caption  := '';
    if FieldByName('ao_total').AsString = 'S' then
    begin
      cbDemolicionTotal.Checked := True;
      edDemTotalInicio.Caption := FieldByName('ao_fechademolicion').AsString;
      edDemTotalHasta.Caption  := FieldByName('ao_fechademolicionhasta').AsString;
    end;
    if FieldByName('ao_parcial').AsString = 'S' then
    begin
      cbDemolicionParcial.Checked := True;
      edDemParcialInicio.Caption := FieldByName('ao_fechademolicion').AsString;
      edDemParcialHasta.Caption  := FieldByName('ao_fechademolicionhasta').AsString;
    end;
    cbExcavacion503.Checked := FieldByName('AO_EXCAVACION503').AsString = 'S';
    edExc503Inicio.Caption  := FieldByName('ao_fechadesdeexcavacion503').AsString;
    edExc503Hasta.Caption   := FieldByName('ao_fechahastaexcavacion503').AsString;
    edDetalleExc503.Caption := FieldByName('ao_detalleexcavacion503').AsString;
    //Actividad
    cbTrabajosAlbanileria.Checked       := FieldByName('ao_actividad').AsString[3] = 'S';
    cbHormigonArmado.Checked            := FieldByName('ao_actividad').AsString[4] = 'S';
    cbMontajesElectromecanicos.Checked  := FieldByName('ao_actividad').AsString[5] = 'S';
    cbInstalacionesVarias.Checked       := FieldByName('ao_actividad').AsString[6] = 'S';
    cbEstructurasMetallicas.Checked     := FieldByName('ao_actividad').AsString[7] = 'S';
    cbTareasElectricidad.Checked        := FieldByName('ao_actividad').AsString[8] = 'S';
    cbAscensoresMontacargas.Checked     := FieldByName('ao_actividad').AsString[9] = 'S';
    cbTrabajosPinturas.Checked          := FieldByName('ao_actividad').AsString[10] = 'S';
    cbMas1000oMas4m.Checked             := FieldByName('ao_actividad').AsString[11] = 'S';
    cbSilletasAndamios.Checked          := FieldByName('ao_actividad').AsString[12] = 'S';
    cbIzaje.Checked                     := FieldByName('ao_actividad').AsString[13] = 'S';
    cbAltaMediaTension.Checked          := FieldByName('ao_actividad').AsString[14] = 'S';
    //
    edFechaextension.Caption            := FieldByName('ao_fechaextension').AsString;
    edFechaSuspensionDefinitiva.Caption := FieldByName('ao_fechasuspension').AsString;
    edfechaSuspension.Caption           := FieldByName('ao_fechasuspension').AsString;
    edFechaReinicia.Caption             := FieldByName('ao_fechareinicio').AsString;
    edFechaSello.Caption                := FieldByName('ao_fechaalta').AsString;
    edEstado.Caption                    := FieldByName('tipoformulario').AsString;
  end;
  if FPath = '' then
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  else
  begin
    qrResolucion.Prepare;
    Path := TempPath+'AO'+edContrato.Caption+'_'+sEstableci+'.qrp';
    qrResolucion.QRPrinter.Save(path);
    qrResolucion.QRPrinter.Free;
    if not FileToPDFSvr(path,FPath) then
      raise Exception.Create('Error al generar el PDF');
    FPath := FPath+ChangeFileExt(ExtractFileName(path), '.pdf');
  end;

end;

end.
