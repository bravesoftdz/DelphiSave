unit unControlAccidente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unTableroControl, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, unFraEstablecimiento, StdCtrls, PatternEdit, unFraDomicilio,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, ComboEditor, CheckCombo, unFraCodigoDescripcion,
  unFraTrabajador, unFraTrabajadorSiniestro_D5, unFraTrabajadorSinGrave,
  Mask, ToolEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  unCustomGridABM, unFraTrabajadorSiniestro;

type
  TfrmControlAccidente = class(TfrmTableroControl)
    cbSinExportacion: TCheckBox;
    cbPRAM: TCheckBox;
    cbGrave: TCheckBox;
    cbPRAMinv: TCheckBox;
    lbFecha: TLabel;
    Label6: TLabel;
    edFechaDenunciaFiltroDesde: TDateEdit;
    Label11: TLabel;
    edFechaDenunciaFiltroHasta: TDateEdit;
    fraTrabajadorSinGraveFiltro: TfraTrabajadorSinGrave;
    edFechaDenuncia: TDateEdit;
    lbFechaDenuncia: TLabel;
    edFechadeVencimiento: TDateEdit;
    lbFechaDeVencimiento: TLabel;
    fraGravedad: TfraCodigoDescripcion;
    Label12: TLabel;
    lbPrestador: TLabel;
    edPrestador: TEdit;
    edDescripcionDenunciaGrave: TMemo;
    lbDescripcionDenunciagrave: TLabel;
    edObservacionDenunciaGrave: TMemo;
    lbObservacionDenunciaGrave: TLabel;
    ShortCutControl1: TShortCutControl;
    cbInvAccidenteRecibida: TCheckBox;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaEX_ID: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaTJ_CUIL: TStringField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaDG_NRODENUNCIASRT: TStringField;
    sdqConsultaGA_ID: TFloatField;
    sdqConsultaGA_IDEXPEDIENTE: TFloatField;
    sdqConsultaFECHAACCIDENTE: TDateTimeField;
    sdqConsultaDG_FECHAALTA: TDateTimeField;
    sdqConsultaDG_FECHARECEPCION: TDateTimeField;
    sdqConsultaTA_DESCRIPCION: TStringField;
    sdqConsultaTG_DESCRIPCION: TStringField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaEG_DESCRIPCION: TStringField;
    sdqConsultaUD_CALLE: TStringField;
    sdqConsultaUD_NUMERO: TStringField;
    sdqConsultaGA_FECHAVENCINV: TDateTimeField;
    sdqConsultaAE_FECHA: TDateTimeField;
    sdqConsultaAE_CPOSTAL: TStringField;
    sdqConsultaAE_CALLE: TStringField;
    sdqConsultaAE_LOCALIDAD: TStringField;
    sdqConsultaAE_PROVINCIA: TStringField;
    sdqConsultaAE_NUMERO: TStringField;
    sdqConsultaAE_PISO: TStringField;
    sdqConsultaAE_DEPARTAMENTO: TStringField;
    sdqConsultaAE_CPOSTALA: TStringField;
    sdqConsultaUD_PISO: TStringField;
    sdqConsultaUD_DEPARTAMENTO: TStringField;
    sdqConsultaUD_CPOSTAL: TStringField;
    sdqConsultaUD_CPOSTALA: TStringField;
    sdqConsultaUD_LOCALIDAD: TStringField;
    sdqConsultaUD_PROVINCIA: TStringField;
    sdqConsultaGA_PRAM: TStringField;
    sdqConsultaPROVINCIAACCIDENTE: TStringField;
    sdqConsultaFECHAVENCIMIENTO: TDateTimeField;
    sdqConsultaTELACCIDENTE: TStringField;
    sdqConsultaDC_CALLE: TStringField;
    sdqConsultaDC_NUMERO: TStringField;
    sdqConsultaDC_PISO: TStringField;
    sdqConsultaDC_DEPARTAMENTO: TStringField;
    sdqConsultaDC_CPOSTAL: TStringField;
    sdqConsultaDC_CPOSTALA: TStringField;
    sdqConsultaDC_LOCALIDAD: TStringField;
    sdqConsultaDC_PROVINCIA: TStringField;
    sdqConsultaPROVINCIAEMP: TStringField;
    sdqConsultaTELDOMICILIO: TStringField;
    sdqConsultaAC_RELACION: TStringField;
    sdqConsultaAC_DESCRIPCION: TStringField;
    sdqConsultaPRESTADOR: TStringField;
    sdqConsultaEX_BREVEDESCRIPCION: TStringField;
    sdqConsultaEX_OBSERVACIONES: TStringField;
    sdqConsultaDE_DESCRIPCION: TStringField;
    sdqConsultaDE_OBSERVACIONES: TStringField;
    sdqConsultaDG_OBSERVACIONES: TStringField;
    sdqConsultaDG_DESCRIPCION: TStringField;
    sdqConsultaSA_DESCRIPCION: TStringField;
    sdqConsultaSA_OBSERVACIONES: TStringField;
    sdqConsultaGA_CALLE: TStringField;
    sdqConsultaGA_NUMERO: TStringField;
    sdqConsultaGA_PISO: TStringField;
    sdqConsultaGA_DEPARTAMENTO: TStringField;
    sdqConsultaGA_CPOSTAL: TStringField;
    sdqConsultaGA_CPOSTALA: TStringField;
    sdqConsultaGA_LOCALIDAD: TStringField;
    sdqConsultaGA_PROVINCIA: TStringField;
    sdqConsultaPROVINCIAINVESTIGACION: TStringField;
    sdqConsultaGA_IDESTADO: TFloatField;
    sdqConsultaGA_IDACCIDENTEESTAB: TFloatField;
    sdqConsultaGA_OBSERVACIONES: TStringField;
    sdqConsultaTG_ID: TFloatField;
    sdqConsultaGA_IDPREVENTOR: TFloatField;
    sdqConsultaDG_IDGRAVEDAD: TFloatField;
    sdqConsultaAE_FECHAEXPORT: TDateTimeField;
    sdqConsultaGA_FECHAASIGPREV: TDateTimeField;
    sdqConsultaGA_FECHACIERRE: TDateTimeField;
    sdqConsultaGA_IDESTABLECIMIENTO: TFloatField;
    sdqConsultaFECHA_ASIGNACION: TDateTimeField;
    sdqConsultaSELECTED: TStringField;
    sdqConsultaGA_INVESTIGACIONRECIBIDA: TStringField;
    cbDistMas100km: TCheckBox;
    cbDistMenos100km: TCheckBox;
    Label13: TLabel;
    sdqConsultaGA_SUPERA100KM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);override;
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cbDistMas100kmClick(Sender: TObject);
    procedure cbDistMenos100kmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure LoadControls; override;
    procedure ClearControls;override;
    function Validar: Boolean; override;
    function DoABM: Boolean;override;
  end;

var
  frmControlAccidente: TfrmControlAccidente;

implementation

uses SqlOracle, unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, General, vclExtra,
  unCustomConsulta, uncomunes;

{$R *.dfm}

procedure TfrmControlAccidente.ClearControls;
begin
  inherited;
  edFechaDenuncia.Clear;
  edFechadeVencimiento.Clear;
  edPrestador.Clear;
  edDescripcionDenunciaGrave.Clear;
  edObservacionDenunciaGrave.Clear;
end;

procedure TfrmControlAccidente.tbRefrescarClick(Sender: TObject);
var
  sSQL : string;
  sIn : String;
  i : Integer;
begin
    sSQL :=
     '  SELECT art.utiles.armar_siniestro (ex_siniestro, '+
     '                                     ex_orden, '+
     '                                     ex_recaida '+
     '                                    ) siniestro, '+
     '         ex_id, ex_recaida, ex_siniestro, ex_orden, co_contrato, em_cuit, '+
     '         em_nombre, tj_cuil, tj_nombre, dg_nrodenunciasrt, ga_id, '+
     '         ga_idexpediente, '+
     '         NVL (ex_fecharecaida, ex_fechaaccidente) fechaaccidente, dg_fechaalta, '+
     '         dg_fecharecepcion, ta_descripcion, tg_descripcion, it_nombre, '+
     '         eg_descripcion, ud_calle, ud_numero, ga_fechavencinv, ae_fecha, '+
     '         ae_cpostal, ae_calle, ae_localidad, ae_provincia, ae_numero, ae_piso, '+
     '         ae_departamento, ae_cpostala, ud_piso, ud_departamento, ud_cpostal, '+
     '         ud_cpostala, ud_localidad, ud_provincia, '+
     '         provaccid.pv_descripcion AS provinciaaccidente, '+
     '         DECODE (dg_idgravedad, '+
     '                 5, dg_fecharecepcion + 3, '+
     '                 dg_fecharecepcion + 7 '+
     '                ) fechavencimiento, '+
     '         art.utiles.armar_telefono (ud_codareatelefonos, '+
     '                                    NULL, '+
     '                                    ud_telefonos '+
     '                                   ) AS telaccidente, '+
     '         dc_calle, dc_numero, dc_piso, dc_departamento, dc_cpostal, dc_cpostala, '+
     '         dc_localidad, dc_provincia, provdomic.pv_descripcion AS provinciaemp, '+
     '         art.utiles.armar_telefono (dc_codareatelefonos, '+
     '                                    NULL, '+
     '                                    dc_telefonos '+
     '                                   ) AS teldomicilio, '+
     '         art.hys.get_codactividadrevdos(ac_id, ac_revision) ac_relacion, ac_descripcion, '+
     '         ca_descripcion || ''-'' || ca_clave AS prestador, ex_brevedescripcion, '+
     '         ex_observaciones, de_descripcion, de_observaciones, dg_observaciones, '+
     '         dg_descripcion, sa_descripcion, sa_observaciones, '+
     '         ga_calle, ga_numero, ga_piso, ga_departamento,ga_pram , '+
     '         ga_cpostal, ga_cpostala, ga_localidad, ga_provincia, '+
     '         provinvest.pv_descripcion AS provinciainvestigacion, '+
     '         ga_idestado, ga_idaccidenteestab, ga_observaciones, tg_id, '+
     '         ga_idpreventor, dg_idgravedad, ae_fechaexport, ga_fechaasigprev, '+
     '         ga_fechacierre, ga_idestablecimiento, GA_INVESTIGACIONRECIBIDA, '+
     '         (SELECT TRUNC (hp_fechaalta) '+
     '            FROM hys.hhp_historicopreventorasignado '+
     '           WHERE ga_id = hp_idgestionaccidente '+
     '             AND hp_fechaalta = (SELECT MAX (hp_fechaalta) '+
     '                                   FROM hys.hhp_historicopreventorasignado '+
     '                                  WHERE ga_id = hp_idgestionaccidente)) '+
     '                                                               fecha_asignacion, GA_SUPERA100KM '+
     '   FROM art.cpv_provincias provdomic, '+
     '        art.cpv_provincias provaccid, '+
     '        art.cpv_provincias provinvest, '+
     '        aco_contrato aco, '+
     '        afi.adc_domiciliocontrato, '+
     '        aem_empresa, '+
     '        comunes.cac_actividad, '+
     '        comunes.ctj_trabajador, '+
     '        art.sex_expedientes sex, '+
     '        SIN.sta_tipoaccidente, '+
     '        SIN.ssa_solicitudasistencia, '+
     '        SIN.stg_tipogravedad, '+
     '        SIN.sde_denuncia, '+
     '        art.cpr_prestador, '+
     '        SIN.sdg_denunciagrave, '+
     '        SIN.sud_ubicaciondenuncia, '+
     '        art.pit_firmantes, '+
     '        pae_accidenteestablecimiento, '+
     '        hys.heg_estadogestionaccidente, '+
     '        hys.hga_gestionaccidente '+
     '  WHERE ga_idexpediente = dg_idexpediente '+
     '    AND dg_nroparte = 1 '+
     '    AND dc_contrato = co_contrato '+
     '    AND dc_tipo = ''P'' '+
     '    AND dg_idexpediente = ex_id '+
     '    AND ex_cuit = em_cuit '+
     '    AND aco.co_idempresa = em_id '+
     '    AND aco.co_contrato = '+
     '                art.afiliacion.get_contratovigente (ex_cuit, ex_fechaaccidente) '+
     '    AND ex_cuil = tj_cuil '+
     '    AND sex.ex_tipo = to_char(ta_id) '+
     '    AND dg_fechabaja IS NULL '+
     '    AND dg_idgravedad = tg_id '+
     '    AND co_idactividad = ac_id '+
     '    AND ga_idestado = eg_id '+
     '    AND dg_nrodenunciasrt IS NOT NULL '+
     '    AND ga_idaccidenteestab = ae_id(+) '+
     '    AND ga_idpreventor = it_id(+) '+
     '    AND ex_id = sa_idexpediente(+) '+
     '    AND ex_id = de_idexpediente(+) '+
     '    AND ex_id = ud_idexpediente(+) '+
     '    AND ud_provincia = provaccid.pv_codigo(+) '+
     '    AND dc_provincia = provdomic.pv_codigo(+) '+
     '    AND ga_provincia = provinvest.pv_codigo(+) '+
     '    AND GA_TIPOGESTION like ''%A%'' '+
     '    AND ca_identificador(+) = dg_idprestador ';
  if not fraEmpresaFiltro.IsEmpty then
    sSQL := sSQL + ' AND em_cuit = '+SqlValue(fraEmpresaFiltro.mskCUIT.Text);
  sIn := '';
  if cmbEstado.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbEstado.Items.Count-1 do
      if cmbEstado.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbEstado.Items.Objects[i]));
      end;
  end;
  if (sIn <> '') then
    sSQL := sSQL + '   AND ga_idestado + 0 in (' + sIn  + ')';
  if cbVencidos.Checked then
    sSQL := sSQL + ' AND GA_IDESTADO NOT IN (4,5) AND GA_FECHAVENCINV < ART.ACTUALDATE AND AE_FECHA IS NULL'+
    '   AND GA_FECHAVENCINV IS NOT NULL ';
  if cbSinExportacion.Checked then
    sSQL := sSQL + ' AND ga_idaccidenteestab IS NOT NULL AND GA_FECHAVENCINV < ART.ACTUALDATE+3 AND ae_fechaexport IS NULL';
  if not ((cbPRAM.Checked)and(cbGrave.Checked)) then
  begin
    if cbPRAM.Checked then
      sSQL := sSQL + ' AND dg_idgravedad = 5 ';
    if cbGrave.Checked then
      sSQL := sSQL + ' AND dg_idgravedad = 4 ';
  end;
  if (edFechaDenunciaFiltroDesde.Date <> 0) then
    sSQL := sSQL + ' AND dg_fecharecepcion >= '+SqlDate(edFechaDenunciaFiltroDesde.Date);
  if (edFechaDenunciaFiltroHasta.Date <> 0) then
    sSQL := sSQL + ' AND dg_fecharecepcion <= '+SqlDate(edFechaDenunciaFiltroHasta.Date);
  if (edFechaAccidenteFiltro.Date <> 0) then
    sSQL := sSQL + ' AND nvl(ex_fecharecaida, ex_fechaaccidente) = '+SqlDate(edFechaAccidenteFiltro.Date);
  if not fraTrabajadorSinGraveFiltro.IsEmpty then
    sSQL := sSQL + ' AND tj_cuil = '+SqlValue(fraTrabajadorSinGraveFiltro.CUIL)+
              'AND dg_nrodenunciasrt ='+ SqlValue(fraTrabajadorSinGraveFiltro.IdDenunciaSRT);
  if not fraPreventorFiltro.IsEmpty then
    sSQL := sSQL + ' AND it_id = '+SqlValue(fraPreventorFiltro.Codigo);
  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmControlAccidente.LoadControls;
begin
  inherited;
  ClearControls;
  FFrmEventosAccidentes.Load(sdqConsulta.FieldByName('GA_ID').AsInteger);
  PageControl.ActivePageIndex := 0;
  ScrollBox.VertScrollBar.Position := 0;
  ScrollBox1.VertScrollBar.Position := 0;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  fraGravedad.Codigo := sdqConsulta.FieldByName('tg_id').AsString;
  fraTrabajadorABM.IdSiniestro :=  sdqConsulta.FieldByName('ex_id').AsInteger;
  edFechaDenuncia.Date := sdqConsulta.FieldByName('dg_fecharecepcion').AsDateTime;
  edFechaAccidente.Date := sdqConsulta.FieldByName('fechaaccidente').AsDateTime;
  edFechadeVencimiento.Date := sdqConsulta.FieldByName('fechavencimiento').AsDateTime;
  FIdExpediente := sdqConsulta.FieldByName('GA_IDEXPEDIENTE').AsInteger;
  FId := sdqConsulta.FieldByName('GA_ID').AsInteger;
  fraDomicilioAccidente.Cargar(sdqConsulta.FieldByName('UD_CALLE').AsString,sdqConsulta.FieldByName('UD_CPOSTAL').AsString,
    sdqConsulta.FieldByName('UD_LOCALIDAD').AsString,sdqConsulta.FieldByName('UD_NUMERO').AsString,
    sdqConsulta.FieldByName('UD_PISO').AsString, sdqConsulta.FieldByName('UD_DEPARTAMENTO').AsString,
    sdqConsulta.FieldByName('UD_PROVINCIA').AsString, sdqConsulta.FieldByName('UD_CPOSTALA').AsString);
  edTelefonoAccidente.Text := sdqConsulta.FieldByName('telaccidente').AsString;
  fraDomicilioEmpresa.Cargar(sdqConsulta.FieldByName('dc_calle').AsString, sdqConsulta.FieldByName('dc_cpostal').AsString,
    sdqConsulta.FieldByName('dc_localidad').AsString,sdqConsulta.FieldByName('dc_numero').AsString, sdqConsulta.FieldByName('dc_piso').AsString,
    sdqConsulta.FieldByName('dc_departamento').AsString,sdqConsulta.FieldByName('dc_provincia').AsString,sdqConsulta.FieldByName('dc_cpostala').AsString);
  edTelefonoEmpresa.Text := sdqConsulta.FieldByName('telaccidente').AsString;
  edCIIU.Text := sdqConsulta.FieldByName('ac_relacion').AsString;
  edCiiuDescripcion.Text := sdqConsulta.FieldByName('ac_descripcion').AsString;
  edPrestador.Text :=  sdqConsulta.FieldByName('prestador').AsString;
  edBreveDescripcion.text := sdqConsulta.FieldByName('ex_brevedescripcion').AsString;
  edObservacionesExpediente.Text := sdqConsulta.FieldByName('ex_observaciones').AsString;
  edDescripcionDenuncia.Text := sdqConsulta.FieldByName('de_descripcion').AsString;
  edObservacionDenuncia.Text := sdqConsulta.FieldByName('de_observaciones').AsString;
  edDescripcionDenunciaGrave.Text := sdqConsulta.FieldByName('dg_descripcion').AsString;
  edObservacionDenunciaGrave.Text := sdqConsulta.FieldByName('dg_observaciones').AsString;
  edDescripcionOtros.Text := sdqConsulta.FieldByName('sa_descripcion').AsString;
  edObservacionOtros.Text := sdqConsulta.FieldByName('sa_observaciones').AsString;
  fraEstablecimientoTrabajador.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  fraEstablecimientoTrabajador.Value := sdqConsulta.FieldByName('GA_IDESTABLECIMIENTO').AsInteger;
  fraEstado.Codigo := sdqConsulta.FieldByName('ga_idestado').AsString;
  cbInvAccidenteRecibida.Checked := sdqConsulta.FieldByName('GA_INVESTIGACIONRECIBIDA').AsString = 'S';
  cbDistMas100km.Checked := sdqConsulta.FieldByName('GA_SUPERA100KM').AsString = 'S';
  cbDistMenos100km.Checked := sdqConsulta.FieldByName('GA_SUPERA100KM').AsString = 'N';
    with GetQuery(
      ' SELECT es_calle, es_numero, es_piso, es_departamento, es_cpostala, '+
      '        es_localidad, es_cpostal, es_provincia, pv_descripcion '+
      '   FROM aes_establecimiento, art.cpv_provincias '+
      '  WHERE es_id = '+SqlValue(sdqConsulta.FieldByName('GA_IDESTABLECIMIENTO').AsInteger)+' AND es_provincia = pv_codigo')do
    begin
      fraDomicilioEstablecimiento.Cargar(FieldByName('es_calle').AsString,FieldByName('es_cpostal').AsString,
        FieldByName('es_localidad').AsString, FieldByName('es_numero').AsString, FieldByName('es_piso').AsString,
        FieldByName('es_departamento').AsString, FieldByName('es_provincia').AsString, FieldByName('es_cpostala').AsString);
    end;
    fraDomicilioAccidenteInvestigado.Cargar(sdqConsulta.FieldByName('GA_CALLE').AsString, sdqConsulta.FieldByName('GA_CPOSTAL').AsString,
      sdqConsulta.FieldByName('GA_LOCALIDAD').AsString, sdqConsulta.FieldByName('GA_NUMERO').AsString,
      sdqConsulta.FieldByName('GA_PISO').AsString, sdqConsulta.FieldByName('GA_DEPARTAMENTO').AsString,
      sdqConsulta.FieldByName('GA_PROVINCIA').AsString, sdqConsulta.FieldByName('GA_CPOSTALA').AsString);
    if fraDomicilioAccidenteInvestigado.IsEmpty then
      fraDomicilioAccidenteInvestigado.Cargar(sdqConsulta.FieldByName('UD_CALLE').AsString,sdqConsulta.FieldByName('UD_CPOSTAL').AsString,
        sdqConsulta.FieldByName('UD_LOCALIDAD').AsString,sdqConsulta.FieldByName('UD_NUMERO').AsString,
        sdqConsulta.FieldByName('UD_PISO').AsString, sdqConsulta.FieldByName('UD_DEPARTAMENTO').AsString,
        sdqConsulta.FieldByName('UD_PROVINCIA').AsString, sdqConsulta.FieldByName('UD_CPOSTALA').AsString);

  edObservaciones.Text := sdqConsulta.FieldByName('ga_observaciones').AsString;
  fraPreventorAsignado.Codigo := sdqConsulta.FieldByName('GA_IDPREVENTOR').AsString;
  edFechaAsiganicion.Date := sdqConsulta.FieldByName('FECHA_ASIGNACION').AsDateTime;
  edFechaInvestigacion.Date := sdqConsulta.FieldByName('AE_FECHA').AsDateTime;
  edFechaCierre.Date := sdqConsulta.FieldByName('GA_FECHACIERRE').AsDateTime;
  if sdqConsulta.FieldByName('ga_fechavencinv').IsNull then
  begin
    if sdqConsulta.FieldByName('dg_idgravedad').AsInteger = 4 then
      edFechaVencimientoInvestigacion.Date := CalcDiasHabiles(sdqConsulta.FieldByName('dg_fecharecepcion').AsDateTime,20);
  end
  else
    edFechaVencimientoInvestigacion.Date := sdqConsulta.FieldByName('ga_fechavencinv').AsDateTime;

  if sdqConsulta.FieldByName('dg_idgravedad').AsInteger = 4 then
  begin
    vclExtra.lockControls([cbDistMas100km,cbDistMenos100km],true);
  end
  else
  begin
    vclExtra.lockControls([cbDistMas100km,cbDistMenos100km],false);
  end;

  if fraDomicilioAccidenteInvestigado.IsEmpty then
  begin
    fraDomicilioAccidenteInvestigado.Cargar(sdqConsulta.FieldByName('ae_calle').AsString,sdqConsulta.FieldByName('ae_cpostal').AsString,
      sdqConsulta.FieldByName('ae_localidad').AsString, sdqConsulta.FieldByName('ae_numero').AsString,sdqConsulta.FieldByName('ae_piso').AsString,
      sdqConsulta.FieldByName('ae_departamento').AsString,sdqConsulta.FieldByName('ae_provincia').AsString,
      sdqConsulta.FieldByName('ae_cpostala').AsString);
  end;
  cbPRAMinv.Checked := sdqConsulta.FieldByName('GA_PRAM').AsString = 'S';
  fraEstablecimientoTrabajador.Modified:= False;
  fraDomicilioAccidenteInvestigado.Modified := False;
end;

procedure TfrmControlAccidente.tbLimpiarClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  fraTrabajadorSinGraveFiltro.Clear;
  edFechaDenunciaFiltroDesde.Clear;
  edFechaDenunciaFiltroHasta.Clear;
  cbSinExportacion.Checked := False;
  cbPRAM.Checked := False;
  cbGrave.Checked := False;
  for i:=0 to cmbEstado.Items.Count-1 do
    if cmbEstado.Items.Strings[i] <> 'CERRADO'then
    begin
      cmbEstado.Checked[i] := True;
    end;
end;

procedure TfrmControlAccidente.FormCreate(Sender: TObject);
begin
  inherited;
  vclExtra.lockControls([edPrestador,edFechadeVencimiento,edFechaDenuncia,
                         edDescripcionDenunciaGrave, edObservacionDenunciaGrave,
                         fraGravedad],true);
  with fraEstado do
  begin
    TableName := 'hys.heg_estadogestionaccidente';
    FieldDesc := 'EG_DESCRIPCION';
    FieldID := 'EG_ID';
    FieldCodigo := 'EG_ID';
    FieldBaja := 'EG_FECHABAJA';
    ExtraCondition := ' AND EG_TIPOESTADO like ''%A%'' ';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraGravedad do
  begin
    TableName := 'SIN.stg_tipogravedad';
    FieldDesc := 'tg_descripcion';
    FieldID := 'tg_id';
    FieldCodigo := 'tg_id';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with GetQuery('SELECT * FROM hys.heg_estadogestionaccidente where EG_TIPOESTADO like ''%A%'' ') do
  try
    while not Eof do
    begin
      cmbEstado.Items.AddObject(fieldbyname('EG_DESCRIPCION').AsString, TObject(fieldbyname('EG_ID').AsInteger));
      if cmbEstado.Items.Strings[fieldbyname('EG_ID').AsInteger-1] <> 'CERRADO' then
        cmbEstado.Checked[fieldbyname('EG_ID').AsInteger-1] := True;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmControlAccidente.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (sdqConsulta.FieldByName('GA_IDACCIDENTEESTAB').IsNull) and
     (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime >= FFechaHoy ) and
     (sdqConsulta.FieldByName('AE_FECHA').IsNull) and
     (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime <> 0) then
    AFont.Color := lbColor2.Font.Color;       // Sin Investigacion
  if not(sdqConsulta.FieldByName('GA_IDACCIDENTEESTAB').IsNull) and
    (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime < (FFechaHoy+3) )and
    (sdqConsulta.FieldByName('ae_fechaexport').IsNull) and
    (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime <> 0) then
    AFont.Color := lbColor3.Font.Color;    //Sin Exportar SRT
  if (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger <> 4) and
    (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger <> 5) and
    (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime < FFechaHoy )and
    (sdqConsulta.FieldByName('ae_fecha').IsNull) and
    (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime <> 0)then
    AFont.Color := lbColor1.Font.Color;        //Vencido
  if (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger = 2 )then
    Background := pnlColor5.Color;       //Asignado al preventor
  if (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger = 4 )then
    Background := pnlColor4.Color;       //No Investigar
  if (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger = 3 )then
    Background := pnlColor6.Color;      //Investigado
  if (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger = 5 )then
    Background := pnlColor7.Color;  //Cerrado
end;

function TfrmControlAccidente.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
 // result := true;
  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('GA_ID').AsInteger;
      Sql.Fields.Add('GA_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('GA_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      if not((sdqConsulta.FieldByName('ga_idaccidenteestab').AsString = '' )and ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hga_gestionaccidente '+
      '  WHERE ga_id = '+ SqlValue(sdqConsulta.FieldByName('GA_ID').AsInteger)+
      '    AND ga_idaccidenteestab IS NOT NULL')) then
        Sql.Fields.Add('GA_IDESTADO', fraEstado.Codigo);
      Sql.Fields.Add('GA_FECHAVENCINV', edFechaVencimientoInvestigacion.Date);
      Sql.Fields.Add('GA_IDESTABLECIMIENTO', fraEstablecimientoTrabajador.Value);
      Sql.Fields.Add('GA_OBSERVACIONES', edObservaciones.Text);
      if (fraPreventorAsignado.Codigo <> sdqConsulta.FieldByName('GA_IDPREVENTOR').AsString ) then
        Sql.Fields.Add('GA_FECHAASIGPREV', exDate);
      Sql.Fields.Add('GA_IDPREVENTOR', fraPreventorAsignado.Codigo);
      Sql.Fields.Add('GA_FECHACIERRE', edFechaCierre.Date);
      if fraEstablecimientoTrabajador.Modified then
        EjecutarSqlST(
          ' UPDATE pae_accidenteestablecimiento '+
          '    SET AE_NROESTABLECIMIENTO =  '+SqlValue(fraEstablecimientoTrabajador.Codigo) +','+
          '        ae_usumodif = '+SqlValue(Sesion.UserID)+','+
          '        ae_fechamodif = SYSDATE '+
          '  WHERE ae_id = '+SqlValue(sdqConsulta.FieldByName('ga_idaccidenteestab').AsString));
      Sql.Fields.Add('GA_CALLE', fraDomicilioAccidenteInvestigado.Calle);
      Sql.Fields.Add('GA_NUMERO', fraDomicilioAccidenteInvestigado.Numero);
      Sql.Fields.Add('GA_PISO', fraDomicilioAccidenteInvestigado.Piso);
      Sql.Fields.Add('GA_DEPARTAMENTO', fraDomicilioAccidenteInvestigado.Departamento);
      Sql.Fields.Add('GA_CPOSTAL', fraDomicilioAccidenteInvestigado.CodigoPostal);
      Sql.Fields.Add('GA_CPOSTALA', fraDomicilioAccidenteInvestigado.CPA);
      Sql.Fields.Add('GA_LOCALIDAD', fraDomicilioAccidenteInvestigado.Localidad);
      Sql.Fields.Add('GA_PROVINCIA', fraDomicilioAccidenteInvestigado.Prov);
      if cbPRAMinv.Checked then
        Sql.Fields.Add('GA_PRAM', 'S')
      else
        Sql.Fields.Add('GA_PRAM', 'N');
      if cbInvAccidenteRecibida.Checked then
        Sql.Fields.Add('GA_INVESTIGACIONRECIBIDA', 'S')
      else
        Sql.Fields.Add('GA_INVESTIGACIONRECIBIDA', 'N');

      if cbDistMas100km.Checked then
        Sql.Fields.Add('GA_SUPERA100KM', 'S');
      if cbDistMenos100km.Checked then
        Sql.Fields.Add('GA_SUPERA100KM', 'N');

      if fraDomicilioAccidenteInvestigado.Modified then
        EjecutarSqlST(
          ' UPDATE pae_accidenteestablecimiento '+
          '    SET ae_calle = '+SqlValue(fraDomicilioAccidenteInvestigado.Calle)+','+
          '        ae_numero = '+SqlValue(fraDomicilioAccidenteInvestigado.Numero)+','+
          '        ae_piso = '+SqlValue(fraDomicilioAccidenteInvestigado.Piso)+','+
          '        ae_departamento = '+SqlValue(fraDomicilioAccidenteInvestigado.Departamento)+','+
          '        ae_localidad = '+SqlValue(fraDomicilioAccidenteInvestigado.Localidad)+','+
          '        ae_cpostal = '+SqlValue(fraDomicilioAccidenteInvestigado.CodigoPostal)+','+
          '        ae_cpostala = '+SqlValue(fraDomicilioAccidenteInvestigado.CPA)+','+
          '        ae_provincia = '+SqlValue(fraDomicilioAccidenteInvestigado.Prov)+','+
          '        ae_usumodif = '+SqlValue(Sesion.UserID)+','+
          '        ae_fechamodif = SYSDATE '+
          '  WHERE ae_id = '+SqlValue(sdqConsulta.FieldByName('ga_idaccidenteestab').AsString));
      Sql.SqlType := stUpdate;
      iIdCodigo := sdqConsulta.FieldByName('GA_ID').AsInteger;
      Sql.Fields.Add('GA_USUMODIF', Sesion.UserID);
      Sql.Fields.Add('GA_FECHAMODIF', exDateTime );
      Sql.Fields.Add('GA_USUBAJA', exNull );
      Sql.Fields.Add('GA_FECHABAJA', exNull );
    end;
    Sql.PrimaryKey.Add('GA_ID', iIdCodigo);
    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
  on E: Exception do
    begin
    ErrorMsg(E, '');
    Rollback(True);
    Result := False;
    end;
  end;
end;


function TfrmControlAccidente.Validar: Boolean;
begin
  result := Inherited Validar;
  Verificar((fraEstado.Codigo = '3') and sdqConsulta.FieldByName('GA_IDACCIDENTEESTAB').IsNull,fraEstado,'Debe tener Investigación.');
  Verificar(cbPRAMinv.Checked and not cbDistMas100km.Checked and not cbDistMenos100km.Checked, cbPRAMinv, 'Si es PRAM el siniestro se debe indicar la distancia para cargar la fecha de vencimiento.');
  //Verificar(not cbPRAMinv.Checked and( cbDistMas100km.Checked or cbDistMenos100km.Checked), cbPRAMinv, 'Si no es PRAM no se debe tildar ninguna de las distancias.');
end;

procedure TfrmControlAccidente.cbDistMas100kmClick(Sender: TObject);
begin
  if cbDistMas100km.Checked then
  begin
    cbDistMenos100km.Checked := False;
    if edFechaVencimientoInvestigacion.Date = 0 then
    begin
      edFechaVencimientoInvestigacion.Date :=  CalcDiasHabiles( sdqConsulta.FieldByName('dg_fecharecepcion').AsDateTime,7)
    end
    else
      if MsgBox('Esta acción cambia la fecha de vencimiento ¿Desea Continuar?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
      begin
        edFechaVencimientoInvestigacion.Date :=  CalcDiasHabiles( sdqConsulta.FieldByName('dg_fecharecepcion').AsDateTime,7)
      end;
  end
  else edFechaVencimientoInvestigacion.Date := 0;

end;

procedure TfrmControlAccidente.cbDistMenos100kmClick(Sender: TObject);
begin
  if cbDistMenos100km.Checked then
  begin
    cbDistMas100km.Checked := False;
    if edFechaVencimientoInvestigacion.Date = 0 then
    begin
      edFechaVencimientoInvestigacion.Date :=  CalcDiasHabiles( sdqConsulta.FieldByName('dg_fecharecepcion').AsDateTime,3)
    end
    else
      if MsgBox('Esta acción cambia la fecha de vencimiento ¿Desea Continuar?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
      begin
        edFechaVencimientoInvestigacion.Date :=  CalcDiasHabiles( sdqConsulta.FieldByName('dg_fecharecepcion').AsDateTime,3)
      end;
  end
  else edFechaVencimientoInvestigacion.Date := 0;
end;

end.
