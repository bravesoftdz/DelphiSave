unit unSeguimientoInvestigacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unFraCodigoDescripcion, unFraEmpresa, StdCtrls,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraTrabajador,
  unFraTrabajadorSiniestro_D5, unFraTrabajadorSinGrave, ToolEdit, Mask,
  PatternEdit, ComboEditor, CheckCombo;

type
  TfrmSeguimientoInvestigacion = class(TfrmCustomConsulta)
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaEX_ID: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaEM_CUIT: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaTJ_CUIL: TStringField;
    sdqConsultaTJ_NOMBRE: TStringField;
    sdqConsultaDG_NRODENUNCIASRT: TStringField;
    sdqConsultaGA_ID: TFloatField;
    sdqConsultaID_PREV: TFloatField;
    sdqConsultaPREV: TStringField;
    sdqConsultaGA_IDPREVENTOR: TFloatField;
    sdqConsultaID_COR: TFloatField;
    sdqConsultaCOR: TStringField;
    sdqConsultaVERIFICACION1: TStringField;
    sdqConsultaVERIFICACION2: TStringField;
    sdqConsultaMAXIMO: TFloatField;
    sdqConsultaMINIMO: TFloatField;
    fraTrabajadorSinGraveFiltro: TfraTrabajadorSinGrave;
    lbCUITFiltro: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    fraPreventorFiltro: TfraCodigoDescripcion;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    Label11: TLabel;
    Label12: TLabel;
    sdqConsultaVERIFICACION3: TStringField;
    lbEstadoFiltro: TLabel;
    cmbEstado: TCheckCombo;
    edFechaDenunciaFiltroHasta: TDateEdit;
    Label1: TLabel;
    edFechaDenunciaFiltroDesde: TDateEdit;
    Label2: TLabel;
    lbFecha: TLabel;
    cbVerifFaltantes: TCheckBox;
    cbGrave: TCheckBox;
    cbPRAM: TCheckBox;
    sdqConsultaVENCIDA: TFloatField;
    Panel1: TPanel;
    Label40: TLabel;
    pnlVencidas: TPanel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaCalcFields(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeguimientoInvestigacion: TfrmSeguimientoInvestigacion;

implementation
uses
  VCLExtra, unDmPrincipal, unSesion, SQLFuncs, CustomDlgs, StrFuncs, SqlOracle,
  DateUtils, General;

{$R *.dfm}

procedure TfrmSeguimientoInvestigacion.FormCreate(Sender: TObject);
begin
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

  inherited;
end;

procedure TfrmSeguimientoInvestigacion.sdqConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if (FieldByName('maximo').AsInteger >= 1) and
       (FieldByName('minimo').AsInteger >= 1) then
      FieldByName('VERIFICACION1').AsString := 'S'
    else if (FieldByName('maximo').AsInteger >= 1) then
      FieldByName('VERIFICACION1').AsString := 'N'
    else
      FieldByName('VERIFICACION1').AsString := '';

    if (FieldByName('maximo').AsInteger >= 2) and
       (FieldByName('minimo').AsInteger >= 2) then
      FieldByName('VERIFICACION2').AsString := 'S'
    else if (FieldByName('maximo').AsInteger >= 2) and
            (FieldByName('minimo').AsInteger < 2) then
    begin
      FieldByName('VERIFICACION2').AsString := 'N';
    end
    else
      FieldByName('VERIFICACION2').AsString := '';

    FieldByName('VERIFICACION3').AsString := 'S';

    if (FieldByName('maximo').AsInteger >= 3) and
       (FieldByName('minimo').AsInteger >= 3) then
      FieldByName('VERIFICACION3').AsString := 'S'
    else if (FieldByName('maximo').AsInteger >= 3) and
            (FieldByName('minimo').AsInteger < 3) then
    begin
      FieldByName('VERIFICACION3').AsString := 'N';

    end
    else
      FieldByName('VERIFICACION3').AsString := '';
  end;
end;

procedure TfrmSeguimientoInvestigacion.tbRefrescarClick(Sender: TObject);
var
  sIn, sSQL : string;
  i : Integer;
begin
  sSQL :=
    ' SELECT art.utiles.armar_siniestro (ex_siniestro, '+
    '                                    ex_orden, '+
    '                                    ex_recaida '+
    '                                   ) siniestro, '+
    '        ex_id, ex_recaida, co_contrato, em_cuit, em_nombre, tj_cuil, tj_nombre, '+
    '        dg_nrodenunciasrt, ga_id, prev.it_id id_prev, prev.it_nombre prev, '+
    '        ga_idpreventor, cor.it_id id_cor, cor.it_nombre cor, '+
    '        (SELECT COUNT(*) ' +
    '           FROM hys.pmc_medidacorrectiva ' +
    '         WHERE NOT EXISTS(SELECT 1 ' +
    '                    FROM hys.psv_seguimientovisita ' +
    '                   WHERE mc_id = sv_idmedidacorrectiva ' +
    '                     AND sv_fechabaja IS NULL) ' +
    '         AND mc_fechabaja IS NULL ' +
    '         AND mc_idaccidenteestablecimiento = ae_id ' +
    '         AND mc_fechaverificacion < art.actualdate) vencida, ' +
    '        (SELECT   NVL (MAX (COUNT (sv_idmedidacorrectiva)), 0) '+
    '             FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '            WHERE mc_idaccidenteestablecimiento = ae_id AND mc_id = sv_idmedidacorrectiva(+) '+
    '              AND sv_fechabaja IS NULL AND mc_fechabaja IS NULL '+
    '         GROUP BY sv_idmedidacorrectiva) maximo, '+
    '        (SELECT   NVL (MIN (COUNT (sv_idmedidacorrectiva)), 0) '+
    '             FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '            WHERE mc_idaccidenteestablecimiento = ae_id AND mc_id = sv_idmedidacorrectiva(+) '+
    '              AND sv_fechabaja IS NULL AND mc_fechabaja IS NULL '+
    '         GROUP BY sv_idmedidacorrectiva) minimo '+
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
    '    AND co_estado = 1 '+
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
    sSQL := sSQL + ' AND co_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
  if not fraTrabajadorSinGraveFiltro.IsEmpty then
    sSQL := sSQL + ' AND tj_cuil = '+SqlValue(fraTrabajadorSinGraveFiltro.CUIL)+
              'AND dg_nrodenunciasrt ='+ SqlValue(fraTrabajadorSinGraveFiltro.IdDenunciaSRT);
  if not fraPreventorFiltro.IsEmpty then
    sSQL := sSQL + ' AND prev.it_id = '+SqlValue(fraPreventorFiltro.Codigo);
  if not fraCoordinadorFiltro.IsEmpty then
    sSQL := sSQL + ' AND cor.it_id = '+SqlValue(fraCoordinadorFiltro.Codigo);
  if cbVerifFaltantes.Checked then
    sSQL := sSQL +
    ' AND (SELECT   NVL (MAX (COUNT (sv_idmedidacorrectiva)), 0) '+
    '          FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '         WHERE mc_idaccidenteestablecimiento = ae_id '+
    '           AND mc_id = sv_idmedidacorrectiva(+) '+
    '           AND sv_fechabaja IS NULL '+
    '           AND mc_fechabaja IS NULL '+
    '      GROUP BY sv_idmedidacorrectiva) <> '+
    '        (SELECT   NVL (MIN (COUNT (sv_idmedidacorrectiva)), 0) '+
    '             FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '            WHERE mc_idaccidenteestablecimiento = ae_id '+
    '              AND mc_id = sv_idmedidacorrectiva(+) '+
    '              AND sv_fechabaja IS NULL '+
    '              AND mc_fechabaja IS NULL '+
    '         GROUP BY sv_idmedidacorrectiva) '+
    ' AND NOT (    (SELECT   NVL (MAX (COUNT (sv_idmedidacorrectiva)), 0) '+
    '                   FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '                  WHERE mc_idaccidenteestablecimiento = ae_id '+
    '                    AND mc_id = sv_idmedidacorrectiva(+) '+
    '                    AND sv_fechabaja IS NULL '+
    '                    AND mc_fechabaja IS NULL '+
    '               GROUP BY sv_idmedidacorrectiva) >= 3 '+
    '          AND (SELECT   NVL (MIN (COUNT (sv_idmedidacorrectiva)), 0) '+
    '                   FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '                  WHERE mc_idaccidenteestablecimiento = ae_id '+
    '                    AND mc_id = sv_idmedidacorrectiva(+) '+
    '                    AND sv_fechabaja IS NULL '+
    '                    AND mc_fechabaja IS NULL '+
    '               GROUP BY sv_idmedidacorrectiva) >= 3 '+
    '         ) '+
    ' AND (SELECT   NVL (MAX (COUNT (sv_idmedidacorrectiva)), 0) '+
    '          FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovisita '+
    '         WHERE mc_idaccidenteestablecimiento = ae_id '+
    '           AND mc_id = sv_idmedidacorrectiva(+) '+
    '           AND sv_fechabaja IS NULL '+
    '           AND mc_fechabaja IS NULL '+
    '      GROUP BY sv_idmedidacorrectiva) <> 0 ';
  sdqConsulta.SQL.Text := sSQL;
  inherited;
end;

procedure TfrmSeguimientoInvestigacion.tbLimpiarClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
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

procedure TfrmSeguimientoInvestigacion.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (sdqConsulta.Active) and (sdqConsulta.FieldByName('Vencida').AsInteger > 0) then
      Background := pnlVencidas.Color;
end;

end.
