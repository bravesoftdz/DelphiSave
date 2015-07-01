unit unSeguimientoAccidente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion,
  unFraTrabajador, unFraTrabajadorSiniestro_D5, unFraTrabajadorSinGrave,
  Mask, ToolEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  ExComboBox, PatternEdit, ComboEditor, CheckCombo;

type
  TfrmSeguimientoAccidente = class(TfrmCustomGridABM)
    pcFiltros: TPageControl;
    tbGeneral: TTabSheet;
    lbCUITFiltro: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    fraTrabajadorSinGraveFiltro: TfraTrabajadorSinGrave;
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    fraTrabajadorSinGrave: TfraTrabajadorSinGrave;
    lbEvalRiesgo: TLabel;
    cmbEvalRiesgo: TExComboBox;
    cmbFirmaTrab: TExComboBox;
    Label2: TLabel;
    cmbDDJJ: TExComboBox;
    Label3: TLabel;
    cmbFirmaEmpleador: TExComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cmbFirmaHYS: TExComboBox;
    Label6: TLabel;
    cmbVerif6m: TExComboBox;
    Label7: TLabel;
    cmbFechaFirmaPreventor: TExComboBox;
    Label8: TLabel;
    cmbCVSistema: TExComboBox;
    fraPreventor: TfraCodigoDescripcion;
    fraCoordinador: TfraCodigoDescripcion;
    Label9: TLabel;
    Label10: TLabel;
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edFechaVerif12M: TDateEdit;
    cmbEstado: TCheckCombo;
    lbEstadoFiltro: TLabel;
    lbFecha: TLabel;
    Label14: TLabel;
    edFechaDenunciaFiltroDesde: TDateEdit;
    Label15: TLabel;
    edFechaDenunciaFiltroHasta: TDateEdit;
    cbPRAM: TCheckBox;
    cbGrave: TCheckBox;
    edObservaciones: TMemo;
    Label16: TLabel;
    edFechaVerif6m: TDateEdit;
    Label17: TLabel;
    cmbArbolDeCausas: TExComboBox;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmSeguimientoAccidente: TfrmSeguimientoAccidente;

implementation

{$R *.dfm}
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, SqlOracle,
  unCustomConsulta, DateUtils, General;

procedure TfrmSeguimientoAccidente.ClearControls;
begin
  fraEmpresa.Clear;
  fraTrabajadorSinGrave.Clear;
  cmbEvalRiesgo.Value := '';
  cmbFirmaTrab.Value := '';
  cmbDDJJ.Value := '';
  cmbFirmaEmpleador.Value := '';
  cmbFirmaHYS.Value := '';
  cmbVerif6m.Value := '';
  cmbFechaFirmaPreventor.Value := '';
  cmbCVSistema.Value := '';
  cmbArbolDeCausas.Value := '';
  fraPreventor.Clear;
  fraCoordinador.Clear;
  edFechaVerif12M.Clear;
  edObservaciones.Clear;
end;

function TfrmSeguimientoAccidente.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    Sql.Clear;
    Sql.SqlType := stUpdate;
    Sql.Fields.Add('GA_EVALRIESGO', cmbEvalRiesgo.Value);
    Sql.Fields.Add('GA_FIRMATRAB', cmbFirmaTrab.Value);
    Sql.Fields.Add('GA_DDJJ', cmbDDJJ.Value);
    Sql.Fields.Add('GA_FIRMAEMPLEADOR', cmbFirmaEmpleador.Value);
    Sql.Fields.Add('GA_FIRMAHYS', cmbFirmaHYS.Value);
    Sql.Fields.Add('GA_VERIF6M', cmbVerif6m.Value);
    Sql.Fields.Add('GA_FECHAFIRMAPREVENTOR', cmbFechaFirmaPreventor.Value);
    Sql.Fields.Add('GA_COINCIDECVSISTEMA', cmbCVSistema.Value);
    Sql.Fields.Add('GA_VERIF12M', edFechaVerif12M.Date);
    Sql.Fields.Add('GA_FECHAVERIF6M', edFechaVerif6m.Date);
    Sql.Fields.Add('GA_OBSERVACIONESSEGACC',edObservaciones.Text);
    Sql.Fields.Add('GA_ARBOLDECAUSAS',cmbArbolDeCausas.Value);
    iIdCodigo := sdqConsulta.FieldByName('GA_ID').AsInteger;
    Sql.Fields.Add('GA_USUMODIF', Sesion.UserID);
    Sql.Fields.Add('GA_FECHAMODIF', exDateTime );
    Sql.Fields.Add('GA_USUBAJA', exNull );
    Sql.Fields.Add('GA_FECHABAJA', exNull );
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

procedure TfrmSeguimientoAccidente.FormCreate(Sender: TObject);
begin
  inherited;
  vclextra.LockControls([fraEmpresa,fraTrabajadorSinGrave,fraPreventor,fraCoordinador],True);
  with fraPreventor do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraCoordinador do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraCoordinadorFiltro do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraEmpresa do
  begin
    ShowBajas := True;
  end;
  with fraEmpresaFiltro do
  begin
    ShowBajas := True;
  end;
  with fraPreventorFiltro do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with GetQuery('SELECT * FROM hys.heg_estadogestionaccidente') do
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
  Sql.TableName := 'HYS.HGA_GESTIONACCIDENTE';
end;

procedure TfrmSeguimientoAccidente.LoadControls;
begin
  inherited;
  ClearControls;
  fraEmpresa.Contrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  fraTrabajadorSinGrave.IdSiniestro :=  sdqConsulta.FieldByName('ex_id').AsInteger;
  cmbEvalRiesgo.Value := sdqconsulta.FieldByName('GA_EVALRIESGO').AsString;
  cmbFirmaTrab.Value := sdqconsulta.FieldByName('GA_FIRMATRAB').AsString;
  cmbDDJJ.Value := sdqconsulta.FieldByName('GA_DDJJ').AsString;
  cmbFirmaEmpleador.Value := sdqconsulta.FieldByName('GA_FIRMAEMPLEADOR').AsString;
  cmbFirmaHYS.Value := sdqconsulta.FieldByName('GA_FIRMAHYS').AsString;
  cmbVerif6m.Value := sdqconsulta.FieldByName('GA_VERIF6M').AsString;
  cmbFechaFirmaPreventor.Value := sdqconsulta.FieldByName('GA_FECHAFIRMAPREVENTOR').AsString;
  cmbCVSistema.Value := sdqconsulta.FieldByName('GA_COINCIDECVSISTEMA').AsString;
  edFechaVerif12M.Date := sdqconsulta.FieldByName('GA_VERIF12M').AsDateTime;
  edFechaVerif6m.Date := sdqconsulta.FieldByName('GA_FECHAVERIF6M').AsDateTime;
  fraPreventor.Codigo := sdqconsulta.FieldByName('GA_IDPREVENTOR').AsString;
  fraCoordinador.Codigo := sdqconsulta.FieldByName('ID_COR').AsString;
  edObservaciones.Text := sdqConsulta.FieldByName('GA_OBSERVACIONESSEGACC').AsString;
  cmbArbolDeCausas.Value := sdqConsulta.FieldByName('GA_ARBOLDECAUSAS').AsString;
  if edFechaVerif12M.Date = 0 then
  begin
    edFechaVerif12M.Date := ValorSqlDateTime(' SELECT ADD_MONTHS ('+
                            SqlValue(sdqConsulta.FieldByName('DG_FECHARECEPCION').AsDateTime)+
                                    ', 12) FROM DUAL ');
  end;
  if edFechaVerif6M.Date = 0 then
  begin
    edFechaVerif6M.Date := ValorSqlDateTime(' SELECT ADD_MONTHS ('+
                            SqlValue(sdqConsulta.FieldByName('DG_FECHARECEPCION').AsDateTime)+
                                    ', 6) FROM DUAL ');
  end;
end;

function TfrmSeguimientoAccidente.Validar: Boolean;
begin
  Result := True;
  //Verificar()
end;


procedure TfrmSeguimientoAccidente.tbRefrescarClick(Sender: TObject);
var
  sIn,sSQL : string;
  i : Integer;
begin

  sSQL :=
    ' SELECT art.utiles.armar_siniestro (ex_siniestro, '+
    '                                    ex_orden, '+
    '                                    ex_recaida '+
    '                                   ) siniestro,ex_fecharecepcion, '+
    '        ex_id, ex_recaida, co_contrato, em_cuit, em_nombre, tj_cuil, tj_nombre, '+
    '        dg_nrodenunciasrt, ga_id, '+
    '        NVL (ex_fecharecaida, ex_fechaaccidente) fechaaccidente, dg_fechaalta, '+
    '        dg_fecharecepcion, ta_descripcion, tg_descripcion, prev.it_id id_prev, '+
    '        prev.it_nombre prev, eg_descripcion, ud_calle, ud_numero, '+
    '        ga_fechavencinv, ae_fecha, ud_piso, ud_departamento, ud_cpostal, '+
    '        ud_cpostala, ud_localidad, ud_provincia, '+
    '        provaccid.pv_descripcion AS provinciaaccidente, '+
    '        DECODE (dg_idgravedad, '+
    '                5, dg_fecharecepcion + 3, '+
    '                dg_fecharecepcion + 20 '+
    '               ) fechavencimiento, '+
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
    '        art.hys.get_codactividadrevdos(ac_id, ac_revision) ac_relacion, ac_descripcion, '+
    '        ca_descripcion || ''-'' || ca_clave AS prestador, ex_brevedescripcion, '+
    '        ex_observaciones, de_descripcion, de_observaciones, dg_observaciones, '+
    '        dg_descripcion, sa_descripcion, sa_observaciones, ga_calle, ga_numero, '+
    '        ga_piso, ga_departamento, ga_cpostal, ga_cpostala, ga_localidad, '+
    '        ga_provincia, provinvest.pv_descripcion AS provinciainvestigacion, '+
    '        ga_idestado, ga_idaccidenteestab, ga_observaciones, '+
    '        ga_idpreventor, dg_idgravedad, ae_fechaexport, ga_fechaasigprev, '+
    '        ga_fechacierre, ga_idestablecimiento, cor.it_id id_cor, '+
    '        cor.it_nombre cor, ga_evalriesgo, ga_firmatrab, ga_ddjj, '+
    '        ga_firmaempleador, ga_firmahys, ga_verif6m, ga_fechafirmapreventor, '+
    '        ga_coincidecvsistema, ga_fechaverif6m, ga_verif12m,ga_observacionessegacc, ga_arboldecausas '+
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
    '        art.pit_firmantes prev, '+
    '        art.pit_firmantes cor, '+
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
    '    AND prev.it_idsupervisor = cor.it_id(+) '+
    '    AND ex_cuil = tj_cuil '+
    '    AND sex.ex_tipo = ta_id '+
    '    AND sex.ex_gravedad = tg_id '+
    '    AND co_idactividad = ac_id '+
    '    AND ga_idestado = eg_id '+
    '    AND dg_nrodenunciasrt IS NOT NULL '+
    '    AND ga_idaccidenteestab = ae_id(+) '+
    '    AND ga_idpreventor = prev.it_id(+) '+
    '    AND ex_id = sa_idexpediente(+) '+
    '    AND ex_id = de_idexpediente(+) '+
    '    AND ex_id = ud_idexpediente(+) '+
    '    AND ud_provincia = provaccid.pv_codigo(+) '+
    '    AND dc_provincia = provdomic.pv_codigo(+) '+
    '    AND ga_provincia = provinvest.pv_codigo(+) '+
    '    AND ca_identificador(+) = dg_idprestador ';

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
  if not fraEmpresaFiltro.IsEmpty then
    sSQL := sSQL + ' AND em_cuit = '+ SqlValue(fraEmpresaFiltro.mskCUIT.Text);
  if not fraTrabajadorSinGraveFiltro.IsEmpty then
    sSQL := sSQL + ' AND tj_cuil = '+SqlValue(fraTrabajadorSinGraveFiltro.CUIL)+
              'AND dg_nrodenunciasrt ='+ SqlValue(fraTrabajadorSinGraveFiltro.IdDenunciaSRT);
  if not fraPreventorFiltro.IsEmpty then
    sSQL := sSQL + ' AND prev.it_id = '+SqlValue(fraPreventorFiltro.Codigo);
  if not fraCoordinadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND cor.it_id = '+SqlValue(fraCoordinadorFiltro.Codigo);
  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmSeguimientoAccidente.tbLimpiarClick(Sender: TObject);
var
  i : Integer;
begin
  fraEmpresaFiltro.Clear;
  fraTrabajadorSinGraveFiltro.Clear;
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  edFechaDenunciaFiltroDesde.Clear;
  edFechaDenunciaFiltroHasta.Clear;
  cbPRAM.Checked := False;
  cbGrave.Checked := False;
  for i:=0 to cmbEstado.Items.Count-1 do
    if cmbEstado.Items.Strings[i] <> 'CERRADO'then
    begin
      cmbEstado.Checked[i] := True;
    end;
end;

end.
