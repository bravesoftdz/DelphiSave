unit unControlEnfermedades;

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
  unCustomGridABM, unFraTrabajadorSiniestro, SinEdit,
  unFraStaticCodigoDescripcion, unFraStaticCodDesc, unFraCDG_DIAGNOSTICO, 
  unFraPAE_ACCIDENTEESTABLECIMIENTO, Numeros;
                                                      type
  TfrmControlEnfermedades = class(TfrmTableroControl)
    cbGPBA: TCheckBox;
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
    sdqConsultaGA_ID: TFloatField;
    sdqConsultaGA_IDEXPEDIENTE: TFloatField;
    sdqConsultaFECHAACCIDENTE: TDateTimeField;
    sdqConsultaTA_DESCRIPCION: TStringField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaEG_DESCRIPCION: TStringField;
    sdqConsultaUD_CALLE: TStringField;
    sdqConsultaUD_NUMERO: TStringField;
    sdqConsultaGA_FECHAVENCINV: TDateTimeField;
    sdqConsultaUD_PISO: TStringField;
    sdqConsultaUD_DEPARTAMENTO: TStringField;
    sdqConsultaUD_CPOSTAL: TStringField;
    sdqConsultaUD_CPOSTALA: TStringField;
    sdqConsultaUD_LOCALIDAD: TStringField;
    sdqConsultaUD_PROVINCIA: TStringField;
    sdqConsultaFECHAINVESTIGACION: TDateTimeField;
    sdqConsultaPROVINCIAACCIDENTE: TStringField;
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
    sdqConsultaEX_BREVEDESCRIPCION: TStringField;
    sdqConsultaEX_OBSERVACIONES: TStringField;
    sdqConsultaDE_DESCRIPCION: TStringField;
    sdqConsultaDE_OBSERVACIONES: TStringField;
    sdqConsultaSA_DESCRIPCION: TStringField;
    sdqConsultaSA_OBSERVACIONES: TStringField;
    sdqConsultaGA_CALLE: TStringField;
    sdqConsultaGA_NUMERO: TStringField;
    sdqConsultaGA_PISO: TStringField;
    sdqConsultaGA_DEPARTAMENTO: TStringField;
    sdqConsultaGA_PRAM: TStringField;
    sdqConsultaGA_CPOSTAL: TStringField;
    sdqConsultaGA_CPOSTALA: TStringField;
    sdqConsultaGA_LOCALIDAD: TStringField;
    sdqConsultaGA_PROVINCIA: TStringField;
    sdqConsultaPROVINCIAINVESTIGACION: TStringField;
    sdqConsultaGA_IDESTADO: TFloatField;
    sdqConsultaGA_IDACCIDENTEESTAB: TFloatField;
    sdqConsultaGA_OBSERVACIONES: TStringField;
    sdqConsultaGA_IDPREVENTOR: TFloatField;
    sdqConsultaGA_FECHAASIGPREV: TDateTimeField;
    sdqConsultaGA_FECHACIERRE: TDateTimeField;
    sdqConsultaGA_IDESTABLECIMIENTO: TFloatField;
    sdqConsultaFECHA_ASIGNACION: TDateTimeField;
    sdqConsultaSELECTED: TStringField;
    sdqConsultaEX_FECHARECAIDA: TDateTimeField;
    sdqConsultaEX_FECHAACCIDENTE: TDateTimeField;
    sdqConsultafecha_rechazo: TDateTimeField;
    sdqConsultafecha_aceptacion: TDateTimeField;
    sdqConsultatipo_siniestro: TStringField;
    lbFechaVencimiento: TLabel;
    edFechaVencimientoFiltro: TDateEdit;
    ShortCutControl1: TShortCutControl;
    edFechaVencimientoFiltroHasta: TDateEdit;
    Label6: TLabel;
    Label11: TLabel;
    edSiniestroFiltro: TSinEdit;
    sdqConsultaEX_DIAGNOSTICOOMS: TStringField;
    Label12: TLabel;
    fraCIE10: TfraCDG_DIAGNOSTICO;
    cbPRAMinv: TCheckBox;
    sdqConsultaDESCIE10: TStringField;
    sdqConsultaES_NROESTABLECI: TFloatField;
    sdqConsultaES_NOMBRE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean;override;
  end;

var
  frmControlEnfermedades: TfrmControlEnfermedades;

implementation

uses SqlOracle, unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, General,
  vclExtra;
{$R *.dfm}

procedure TfrmControlEnfermedades.FormCreate(Sender: TObject);
begin
  inherited;
  VclExtra.LockControls([fraCIE10],True);
  with fraEstado do
  begin
    TableName := 'hys.heg_estadogestionaccidente';
    FieldDesc := 'EG_DESCRIPCION';
    FieldID := 'EG_ID';
    FieldCodigo := 'EG_ID';
    FieldBaja := 'EG_FECHABAJA';
    ExtraCondition := ' AND EG_TIPOESTADO like ''%E%'' ';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with GetQuery('SELECT * FROM hys.heg_estadogestionaccidente where EG_TIPOESTADO like ''%E%'' ') do
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

procedure TfrmControlEnfermedades.tbLimpiarClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  fraEmpresaFiltro.Clear;
  edFechaAccidenteFiltro.Clear;
  edFechaVencimientoFiltro.Clear;
  edFechaVencimientoFiltroHasta.Clear;
  cbVencidos.Checked := False;
  cbGPBA.Checked := False;
  for i:=0 to cmbEstado.Items.Count-1 do
    if cmbEstado.Items.Strings[i] <> 'CERRADO'then
    begin
      cmbEstado.Checked[i] := True;
    end;
end;

procedure TfrmControlEnfermedades.LoadControls;
begin
  inherited;
  ClearControls;
  FFrmEventosAccidentes.Load(sdqConsulta.FieldByName('GA_ID').AsInteger);
  PageControl.ActivePageIndex := 0;
  ScrollBox.VertScrollBar.Position := 0;
  ScrollBox1.VertScrollBar.Position := 0;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  fraTrabajadorABM.IdSiniestro :=  sdqConsulta.FieldByName('ex_id').AsInteger;
  fraCIE10.Codigo := sdqConsulta.FieldByName('EX_DIAGNOSTICOOMS').AsString;
  edFechaAccidente.Date := sdqConsulta.FieldByName('fechaaccidente').AsDateTime;
  FIdExpediente := sdqConsulta.FieldByName('GA_IDEXPEDIENTE').AsInteger;
  FId := sdqConsulta.FieldByName('GA_ID').AsInteger;

  with fraDomicilioAccidente do
  begin
    Calle        := sdqConsulta.FieldByName('UD_CALLE').AsString;
    Numero       := IIF(sdqConsulta.FieldByName('UD_NUMERO').IsNull, '0', sdqConsulta.FieldByName('UD_NUMERO').AsString);
    Piso         := sdqConsulta.FieldByName('UD_PISO').AsString;
    Departamento := sdqConsulta.FieldByName('UD_DEPARTAMENTO').AsString;
    CodigoPostal := sdqConsulta.FieldByName('UD_CPOSTAL').AsString;
    CPA          := sdqConsulta.FieldByName('UD_CPOSTALA').AsString;
    Localidad    := sdqConsulta.FieldByName('UD_LOCALIDAD').AsString;
    Prov         := StrToIntDef(sdqConsulta.FieldByName('UD_PROVINCIA').AsString, -1);
    Provincia    := sdqConsulta.FieldByName('provinciaaccidente').AsString;
  end;
  edTelefonoAccidente.Text := sdqConsulta.FieldByName('telaccidente').AsString;
  with fraDomicilioEmpresa do
  begin
    Calle        := sdqConsulta.FieldByName('dc_calle').AsString;
    Numero       := IIF(sdqConsulta.FieldByName('dc_numero').IsNull, '0', sdqConsulta.FieldByName('dc_numero').AsString);
    Piso         := sdqConsulta.FieldByName('dc_piso').AsString;
    Departamento := sdqConsulta.FieldByName('dc_departamento').AsString;
    CodigoPostal := sdqConsulta.FieldByName('dc_cpostal').AsString;
    CPA          := sdqConsulta.FieldByName('dc_cpostala').AsString;
    Localidad    := sdqConsulta.FieldByName('dc_localidad').AsString;
    Prov         := StrToIntDef(sdqConsulta.FieldByName('dc_provincia').AsString, -1);
    Provincia    := sdqConsulta.FieldByName('provinciaemp').AsString;
  end;
  edTelefonoEmpresa.Text := sdqConsulta.FieldByName('telaccidente').AsString;
  edCIIU.Text := sdqConsulta.FieldByName('ac_relacion').AsString;
  edCiiuDescripcion.Text := sdqConsulta.FieldByName('ac_descripcion').AsString;
  edBreveDescripcion.text := sdqConsulta.FieldByName('ex_brevedescripcion').AsString;
  edObservacionesExpediente.Text := sdqConsulta.FieldByName('ex_observaciones').AsString;
  edDescripcionDenuncia.Text := sdqConsulta.FieldByName('de_descripcion').AsString;
  edObservacionDenuncia.Text := sdqConsulta.FieldByName('de_observaciones').AsString;
  edDescripcionOtros.Text := sdqConsulta.FieldByName('sa_descripcion').AsString;
  edObservacionOtros.Text := sdqConsulta.FieldByName('sa_observaciones').AsString;
  fraEstablecimientoTrabajador.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  fraEstablecimientoTrabajador.Value := sdqConsulta.FieldByName('GA_IDESTABLECIMIENTO').AsInteger;
  fraEstado.Codigo := sdqConsulta.FieldByName('ga_idestado').AsString;
    with GetQuery(
      ' SELECT es_calle, es_numero, es_piso, es_departamento, es_cpostala, '+
      '        es_localidad, es_cpostal, es_provincia, pv_descripcion '+
      '   FROM aes_establecimiento, art.cpv_provincias '+
      '  WHERE es_id = '+SqlValue(sdqConsulta.FieldByName('GA_IDESTABLECIMIENTO').AsInteger)+' AND es_provincia = pv_codigo')do
    begin
      fraDomicilioEstablecimiento.Calle        := FieldByName('es_calle').AsString;
      fraDomicilioEstablecimiento.Numero       := IIF(FieldByName('es_numero').IsNull, '0', FieldByName('es_numero').AsString);
      fraDomicilioEstablecimiento.Piso         := FieldByName('es_piso').AsString;
      fraDomicilioEstablecimiento.Departamento := FieldByName('es_departamento').AsString;
      fraDomicilioEstablecimiento.CodigoPostal := FieldByName('es_cpostal').AsString;
      fraDomicilioEstablecimiento.CPA          := FieldByName('es_cpostala').AsString;
      fraDomicilioEstablecimiento.Localidad    := FieldByName('es_localidad').AsString;
      fraDomicilioEstablecimiento.Prov         := StrToIntDef(FieldByName('es_provincia').AsString, -1);
      fraDomicilioEstablecimiento.Provincia    := FieldByName('pv_descripcion').AsString;
    end;


  //if fraDomicilioAccidente.IsEmpty then
  //begin
    //vclextra.LockControl(fraDomicilioAccidenteInvestigado,False);
    with fraDomicilioAccidenteInvestigado do
    begin
      Calle        := sdqConsulta.FieldByName('GA_CALLE').AsString;
      Numero       := IIF(sdqConsulta.FieldByName('GA_NUMERO').IsNull, '0', sdqConsulta.FieldByName('GA_NUMERO').AsString);
      Piso         := sdqConsulta.FieldByName('GA_PISO').AsString;
      Departamento := sdqConsulta.FieldByName('GA_DEPARTAMENTO').AsString;
      CodigoPostal := sdqConsulta.FieldByName('GA_CPOSTAL').AsString;
      CPA          := sdqConsulta.FieldByName('GA_CPOSTALA').AsString;
      Localidad    := sdqConsulta.FieldByName('GA_LOCALIDAD').AsString;
      Prov         := StrToIntDef(sdqConsulta.FieldByName('GA_PROVINCIA').AsString, -1);
      Provincia    := sdqConsulta.FieldByName('provinciainvestigacion').AsString;
    end;
    if fraDomicilioAccidenteInvestigado.IsEmpty then
    with fraDomicilioAccidenteInvestigado do
    begin
      Calle        := sdqConsulta.FieldByName('UD_CALLE').AsString;
      Numero       := IIF(sdqConsulta.FieldByName('UD_NUMERO').IsNull, '0', sdqConsulta.FieldByName('UD_NUMERO').AsString);
      Piso         := sdqConsulta.FieldByName('UD_PISO').AsString;
      Departamento := sdqConsulta.FieldByName('UD_DEPARTAMENTO').AsString;
      CodigoPostal := sdqConsulta.FieldByName('UD_CPOSTAL').AsString;
      CPA          := sdqConsulta.FieldByName('UD_CPOSTALA').AsString;
      Localidad    := sdqConsulta.FieldByName('UD_LOCALIDAD').AsString;
      Prov         := StrToIntDef(sdqConsulta.FieldByName('UD_PROVINCIA').AsString, -1);
      Provincia    := sdqConsulta.FieldByName('provinciaaccidente').AsString;
    end;
  //end
  //else
  //  vclextra.LockControl(fraDomicilioAccidenteInvestigado,True);

  edObservaciones.Text := sdqConsulta.FieldByName('ga_observaciones').AsString;
  fraPreventorAsignado.Codigo := sdqConsulta.FieldByName('GA_IDPREVENTOR').AsString;
  edFechaAsiganicion.Date := sdqConsulta.FieldByName('FECHA_ASIGNACION').AsDateTime;
  edFechaInvestigacion.Date := sdqConsulta.FieldByName('fechainvestigacion').AsDateTime;
  edFechaCierre.Date := sdqConsulta.FieldByName('GA_FECHACIERRE').AsDateTime;
  edFechaVencimientoInvestigacion.Date := sdqConsulta.FieldByName('ga_fechavencinv').AsDateTime;
  fraEstablecimientoTrabajador.Modified:= False;
  fraDomicilioAccidenteInvestigado.Modified := False;
  cbPRAMinv.Checked := sdqConsulta.FieldByName('GA_PRAM').AsString = 'S';
end;

procedure TfrmControlEnfermedades.tbRefrescarClick(Sender: TObject);
var
  sSQL : string;
  sIn : String;
  i : Integer;
begin
    sSQL :=
      ' SELECT art.utiles.armar_siniestro (ex_siniestro, '+
      '                                    ex_orden, '+
      '                                    ex_recaida '+
      '                                   ) siniestro, '+
      '        ex_id, ex_recaida, ex_siniestro, ex_orden, co_contrato, em_cuit, '+
      '        em_nombre, tj_cuil, tj_nombre, ga_id, ga_idexpediente, '+
      '        NVL (ex_fecharecaida, ex_fechaaccidente) fechaaccidente, '+
      '        ta_descripcion, it_nombre, eg_descripcion, ud_calle, ud_numero,ex_diagnosticooms, '+
      '        ga_fechavencinv, ud_piso, ud_departamento, ud_cpostal, ud_cpostala, '+
      '        ud_localidad, ud_provincia,ex_fecharecaida, ex_fechaaccidente, '+
      '        (SELECT max(ee_fecha) '+
      '           FROM hys.pee_enfermedadestablecimiento '+
      '          WHERE ee_idexpediente = ex_id AND ee_fechabaja IS NULL '+
      '        ) AS fechainvestigacion, '+
      '        provaccid.pv_descripcion AS provinciaaccidente, '+
      '        art.utiles.armar_telefono (ud_codareatelefonos, '+
      '                                   NULL, '+
      '                                   ud_telefonos '+
      '                                  ) AS telaccidente, '+
      '        dc_calle, dc_numero, dc_piso, dc_departamento, dc_cpostal, dc_cpostala, '+
      '        dc_localidad, dc_provincia, provdomic.pv_descripcion AS provinciaemp, '+
      '        art.utiles.armar_telefono (dc_codareatelefonos, '+
      '                                   NULL, '+
      '                                   dc_telefonos '+
      '                                  ) AS teldomicilio, '+
      '        art.hys.get_codactividadrevdos(ac_id, ac_revision) ac_relacion, ac_descripcion, ex_brevedescripcion, ex_observaciones, '+
      '        de_descripcion, de_observaciones, sa_descripcion, sa_observaciones, '+
      '        ga_calle, ga_numero, ga_piso, ga_departamento, ga_pram, ga_cpostal, '+
      '        ga_cpostala, ga_localidad, ga_provincia, '+
      '        provinvest.pv_descripcion AS provinciainvestigacion, ga_idestado, '+
      '        ga_idaccidenteestab, ga_observaciones, ga_idpreventor, '+
      '        ga_fechaasigprev, ga_fechacierre, ga_idestablecimiento, '+

               // Fecha de reversión de rechazo. Se obtiene de ses_estadossiniestros
               // tomando la 1ra. fecha posterior al último rechazo (estado 03)
      '        (SELECT MIN(es_fechaalta) ' +
      '           FROM art.ses_estadossiniestros ses1 ' +
      '          WHERE es_idexpediente = ex_id ' +
      '            AND es_fechaalta > ' +
      '                   (SELECT MAX (ses2.es_fechaalta) ' +
      '                      FROM art.ses_estadossiniestros ses2 ' +
      '                     WHERE ses2.es_idexpediente = ses1.es_idexpediente ' +
      '                       AND ses2.es_estado = ''03'')) fecha_rechazo, ' +

               // Fecha de aceptación. Se obtiene en base a ex_rechazomed si el
               // valor del campo NO es R
      '        DECODE (ex_rechazomed, ' +
      '                ''R'', TO_DATE (NULL), ' +
      '                NVL (ex_frechazomed, ex_frechazosin) ' +
      '               ) fecha_aceptacion, ' +

      '        tb_descripcion tipo_siniestro, ' +
      '        (SELECT TRUNC (hpp1.hp_fechaalta) ' +
      '           FROM hys.hhp_historicopreventorasignado hpp1 ' +
      '          WHERE hpp1.hp_idgestionaccidente = ga_id ' +
      '            AND hpp1.hp_fechaalta = (SELECT MAX (hpp2.hp_fechaalta) ' +
      '                                       FROM hys.hhp_historicopreventorasignado hpp2 ' +
      '                                      WHERE hpp2.hp_idgestionaccidente = ga_id)) fecha_asignacion, ' +
      '        dg_descripcion descie10, ' + 
      '        es_nroestableci, ' +
      '        es_nombre ' +
      '   FROM afi.age_grupoeconomico age, ' +
      '        afi.aes_establecimiento, ' +
      '        art.cdg_diagnostico, ' + 
      '        art.ctb_tablas, ' +
      '        art.cpv_provincias provdomic, '+
      '        art.cpv_provincias provaccid, '+
      '        art.cpv_provincias provinvest, '+
      '        aco_contrato aco, '+
      '        afi.adc_domiciliocontrato, '+
      '        aem_empresa aem, '+
      '        comunes.cac_actividad, '+
      '        comunes.ctj_trabajador, '+
      '        art.sex_expedientes sex, '+
      '        SIN.sta_tipoaccidente, '+
      '        SIN.ssa_solicitudasistencia, '+
      '        SIN.sde_denuncia, '+
      '        SIN.sud_ubicaciondenuncia, '+
      '        art.pit_firmantes, '+
      '        hys.heg_estadogestionaccidente, '+
      '        hys.hga_gestionaccidente '+
      '  WHERE age.ge_id(+) = em_idgrupoeconomico ' +
      '    AND tb_clave(+) = ''STIPO'' ' +
      '    AND tb_codigo(+) = ex_tipo ' +
      '    AND ga_idexpediente = ex_id '+
      '    AND dc_contrato = co_contrato '+
      '    AND dc_tipo = ''P'' '+
      '    AND ex_cuit = em_cuit '+
      '    AND em_cuit <> ' + QuotedStr('30584620389') +
      iif(cbGPBA.Checked,
          '    AND aco.co_estado IN (1, 13) ',
          '    AND aco.co_estado = 1 ') +
      '    AND aco.co_idempresa = em_id '+
      '    AND ex_cuil = tj_cuil '+
      '    AND sex.ex_tipo = to_char(ta_id) '+
      '    AND co_idactividad = ac_id '+
      '    AND ga_idestado = eg_id '+
      '    AND ga_idpreventor = it_id(+) '+
      '    AND ex_id = sa_idexpediente(+) '+
      '    AND ex_id = de_idexpediente(+) '+
      '    AND ex_id = ud_idexpediente(+) '+
      '    AND ud_provincia = provaccid.pv_codigo(+) '+
      '    AND dc_provincia = provdomic.pv_codigo(+) '+
      '    AND ga_tipogestion LIKE ''%E%'' '+
      '    AND ga_idestablecimiento = es_id(+) ' +
      '    AND dg_codigo = ex_diagnosticooms ' +
      '    AND ga_fechabaja IS NULL '+
      '    AND ga_provincia = provinvest.pv_codigo(+) ';

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
    sSQL := sSQL + ' AND ga_idestado NOT IN (4,5) AND ga_fechavencinv < ART.ACTUALDATE '+
      ' AND (SELECT ee_fecha '+
      '           FROM hys.pee_enfermedadestablecimiento '+
      '          WHERE ee_idexpediente = ex_id AND ee_fechabaja IS NULL '+
      '        ) IS NULL '+
      '   AND GA_FECHAVENCINV IS NOT NULL ' ;

  if not edSiniestroFiltro.IsEmpty then
    sSQL := sSQL + ' AND ex_siniestro = '+SqlValue(edSiniestroFiltro.Siniestro)+
                   ' AND ex_orden = '+SqlValue(edSiniestroFiltro.Orden);

  sSQL := sSQL +  iif(cbGPBA.Checked, ' AND ge_codigo = ''GBA'' ', ' AND NVL(ge_codigo, '' '') <> ''GBA''');

  if (edFechaAccidenteFiltro.Date <> 0) then
    sSQL := sSQL + ' AND nvl(ex_fecharecaida, ex_fechaaccidente) = '+SqlDate(edFechaAccidenteFiltro.Date);

  if not fraPreventorFiltro.IsEmpty then
    sSQL := sSQL + ' AND it_id = '+SqlValue(fraPreventorFiltro.Codigo);

  if (edFechaVencimientoFiltro.Date <> 0) then
    sSQL := sSQL + ' AND GA_FECHAVENCINV >= '+SqlDate(edFechaVencimientoFiltro.Date);
  if (edFechaVencimientoFiltroHasta.Date <> 0) then
    sSQL := sSQL + ' AND GA_FECHAVENCINV <= '+SqlDate(edFechaVencimientoFiltroHasta.Date);

  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmControlEnfermedades.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (sdqConsulta.FieldByName('GA_IDACCIDENTEESTAB').IsNull) and
     (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime >= FFechaHoy ) and
     (sdqConsulta.FieldByName('fechainvestigacion').IsNull) and
     (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime <> 0) then
    AFont.Color := lbColor2.Font.Color;       // Sin Investigacion
  if (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger <> 4) and
     (sdqConsulta.FieldByName('GA_IDESTADO').AsInteger <> 5) and
    (sdqConsulta.FieldByName('GA_FECHAVENCINV').AsDateTime < FFechaHoy )and
    (sdqConsulta.FieldByName('fechainvestigacion').IsNull )and
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

function TfrmControlEnfermedades.DoABM: Boolean;
var
  iIdCodigo : Integer;
  FechaVencimiento : TDate;
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
      if edFechaVencimientoInvestigacion.Date = 0 then
      begin

        FechaVencimiento := ValorSqlDateTime(
          '  SELECT MIN(es_fechaalta) ' +
          '    FROM art.ses_estadossiniestros ses1 ' +
          '   WHERE es_idexpediente = ' +SqlValue(sdqConsulta.FieldByName('ex_id').AsInteger)+
          '     AND es_fechaalta > ' +
          '         (SELECT MAX (ses2.es_fechaalta) ' +
          '            FROM art.ses_estadossiniestros ses2 ' +
          '           WHERE ses2.es_idexpediente = ses1.es_idexpediente ' +
          '             AND ses2.es_estado = ''03'') ') + 7;
        Sql.Fields.Add('GA_FECHAVENCINV', FechaVencimiento);

      end
      else
        Sql.Fields.Add('GA_FECHAVENCINV', edFechaVencimientoInvestigacion.Date);
      Sql.Fields.Add('GA_IDESTABLECIMIENTO', fraEstablecimientoTrabajador.Value);
      Sql.Fields.Add('GA_OBSERVACIONES', edObservaciones.Text);
      if (fraPreventorAsignado.Codigo <> sdqConsulta.FieldByName('GA_IDPREVENTOR').AsString ) then
        Sql.Fields.Add('GA_FECHAASIGPREV', exDate);
      Sql.Fields.Add('GA_IDPREVENTOR', fraPreventorAsignado.Codigo);
      Sql.Fields.Add('GA_FECHACIERRE', edFechaCierre.Date);
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

function TfrmControlEnfermedades.Validar: Boolean;
var
  existeFecha : Boolean;
begin
  result := Inherited Validar;
  existeFecha := ExisteSql (
    ' SELECT DISTINCT 1'+
    '   FROM art.prv_resvisitas, hys.hvm_visitamotivo, afi.aes_establecimiento '+
    '  WHERE rv_cuit = '+SqlValue(sdqConsulta.FieldByName('em_cuit').AsString)+
    '    AND rv_estableci = es_nroestableci '+
    '    AND es_id = '+SqlValue(fraEstablecimientoTrabajador.Value)+
    '    AND es_contrato = '+SqlValue(sdqConsulta.FieldByName('co_contrato').AsString)+
    '    AND vm_idvisita = rv_id '+
    '    AND rv_fecha >= NVL ('+SqlValue(sdqConsulta.FieldByName('ex_fecharecaida').AsDateTime)+', '+
                                SqlValue(sdqConsulta.FieldByName('ex_fechaaccidente').AsDateTime)+') '+
    '    AND vm_idmotivo = 22 ');

  Verificar((fraEstado.Codigo = '3') and not (existeFecha) and not
      ExisteSql( ' SELECT 1 '+
                 '   FROM hys.hie_invergonomia '+
                 '  WHERE ie_idexpediente = '+SqlValue(sdqConsulta.FieldByName('ga_idexpediente').AsString)+
                 '    AND ie_aprobado IS NOT NULL ')
  ,fraEstado,'Debe tener Investigación.');

  Verificar(not IsNumber(fraDomicilioEstablecimiento.Numero) and (fraDomicilioEstablecimiento.Numero <> 'S/N'),fraDomicilioEstablecimiento,'El número del domicilio del lugar donde se ha contraido la enfermedad debe ser un dato numérico. Cero(0) o un número válido.')
end;

end.
