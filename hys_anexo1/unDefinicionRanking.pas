unit unDefinicionRanking;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, StdCtrls, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unArtFrame, unFraCodigoDescripcion, Mask, ToolEdit,
  DateComboBox, ExtCtrls, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ANSISql;
type
  TfrmDefRanking = class(TfrmCustomGridABM)
    fraRanking: TfraCodigoDescripcion;
    Label2: TLabel;
    Label1: TLabel;
    fraEmpresa: TfraEmpresa;
    Label3: TLabel;
    dcbDesde: TDateComboBox;
    chkBajas: TCheckBox;
    Label4: TLabel;
    dcbFiltroDesde: TDateComboBox;
    lblMotivo: TLabel;
    edObsMotivo: TEdit;
    Label6: TLabel;
    dcbFiltroHasta: TDateComboBox;
    Label7: TLabel;
    dcbHasta: TDateComboBox;
    RxDBGrid1: TRxDBGrid;
    dsEstablecimientos: TDataSource;
    sdqEstablecimientos: TSDQuery;
    Splitter1: TSplitter;
    lblObservacion: TLabel;
    fraMotivo: TfraCodigoDescripcion;
    fraEmpresaFiltro: TfraEmpresa;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    fraRankingFiltro: TfraCodigoDescripcion;
    lblRanking: TLabel;
    chkCaducadas: TCheckBox;
    edFechaAltaHasta: TDateComboBox;
    Label12: TLabel;
    Label13: TLabel;
    edFechaAltaDesde: TDateComboBox;
    fraUsuariosCargados: TfraCodigoDescripcion;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    { Private declarations }
  public
    { Public declarations }
    FEgreso: boolean;
    FPeriodo : string;
    FDBDate : TDateTime;
  end;

var
  frmDefRanking: TfrmDefRanking;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs, VCLExtra;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDefRanking.ClearControls;
begin
  VCLExtra.LockControls([dcbDesde], False);
  fraEmpresa.Clear;
  fraRanking.Clear;
  fraMotivo.Clear;
  dcbDesde.Clear;
  dcbHasta.Clear;
  edObsMotivo.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmDefRanking.DoABM: Boolean;
begin
  BeginTrans(true);
  try
    Sql.Clear;

    if ModoABM = maAlta Then
    begin
      Sql.PrimaryKey.Add ('RE_ID', GetSecNextVal('HYS.SEQ_HRE_ID'));
      Sql.Fields.Add ('RE_FECHAALTA', exDateTime);
      Sql.Fields.Add ('RE_USUALTA', Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add ('RE_ID', sdqConsulta.FieldByName('RE_ID').AsInteger);
      Sql.Fields.Add ('RE_FECHAMODIF', exDateTime);
      Sql.Fields.Add ('RE_USUMODIF', Sesion.UserID);
    end;

    Sql.Fields.Add ('RE_IDRANKING', fraRanking.Value);
    Sql.Fields.Add ('RE_IDEMPRESA', fraEmpresa.Value);
    Sql.Fields.Add ('RE_VIGENCIADESDE', dcbDesde.Date);
    if dcbHasta.IsEmpty then
      Sql.Fields.Add ('RE_VIGENCIAHASTA', '')
    else
      Sql.Fields.Add ('RE_VIGENCIAHASTA', dcbHasta.Date);

    if FEgreso Then
    begin
      if fraMotivo.IsSelected then
        Sql.Fields.Add ('re_idmotivomoveasegreso', fraMotivo.Value);
      Sql.Fields.Add ('RE_MOTIVOBAJA', edObsMotivo.Text);
    end
    else begin
      if fraMotivo.IsSelected then
        Sql.Fields.Add ('re_idmotivomoveasingreso', fraMotivo.Value);
      Sql.Fields.Add ('RE_MOTIVOALTA', edObsMotivo.Text);
      Sql.Fields.Add ('re_idmotivomoveasegreso', '');
      Sql.Fields.Add ('RE_MOTIVOBAJA', '');
    end;

    Result := inherited DoABM;

    EjecutarStoreST(' art.hys.do_actualizartipoempresaprev(' + SqlValue(fraEmpresa.Value) + ');');
    EjecutarStoreST(' hys.do_actualizarestadoempresa(' + SqlValue(fraEmpresa.Value) + ');');

    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback(true);
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDefRanking.LoadControls;
begin
  VCLExtra.LockControls([dcbDesde], True);
  fraEmpresa.Value  := sdqConsulta.FieldByName('EM_ID').AsInteger;
  fraRanking.Codigo := sdqConsulta.FieldByName('RE_IDRANKING').AsString;
  dcbDesde.Date     := sdqConsulta.FieldByName('RE_VIGENCIADESDE').AsDateTime;
  dcbHasta.Date     := sdqConsulta.FieldByName('RE_VIGENCIAHASTA').AsDateTime;
  if FEgreso then
  begin
    fraMotivo.Value   := sdqConsulta.FieldByName('RE_IDMOTIVOMOVEASEGRESO').AsInteger;
    edObsMotivo.Text  := sdqConsulta.FieldByName('RE_MOTIVOBAJA').AsString
  end
  else begin
    fraMotivo.Value   := sdqConsulta.FieldByName('RE_IDMOTIVOMOVEASINGRESO').AsInteger;
    edObsMotivo.Text  := sdqConsulta.FieldByName('RE_MOTIVOALTA').AsString
  end;

  fraEmpresa.Enabled := not FEgreso;
  fraRanking.Enabled := not FEgreso;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmDefRanking.Validar: Boolean;
begin
  Result := True;

  VerificarMultiple (['Guardando Ranking de la Empresa',
                      fraEmpresa, fraEmpresa.IsSelected, 'Debe especificar la empresa.',
                      fraEmpresa, not fraEmpresa.IsBaja, 'La empresa esta dada de baja.',
                      fraRanking, fraRanking.IsSelected, 'Debe especificar el ranking.',
                      dcbDesde, not dcbDesde.IsEmpty, 'Debe indicarse la fecha inicial de vigencia',
                      dcbHasta, (not FEgreso) or (FEgreso and (not dcbHasta.IsEmpty)), 'Debe indicarse la fecha final de vigencia',
                      fraRanking, not ((ModoABM = maAlta) and
                                       ExisteSql ('SELECT 1 ' +
                                                  '  FROM HYS.hre_rankingempresa ' +
                                                  ' WHERE RE_VIGENCIAHASTA IS NULL ' +
                                                  '   AND RE_IDEMPRESA = ' + SqlInteger (fraEmpresa.Value))), 'La empresa ya existe con vigencia activa'
                     ]);
  if ModoABM = maAlta Then
    Verificar(dcbDesde.Date < date, dcbDesde, 'La Fecha no puede ser menor que hoy.');
  if (not dcbHasta.IsEmpty)then
    Verificar(dcbHasta.Date < date, dcbHasta, 'La Fecha no puede ser menor que hoy.');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmDefRanking.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'HYS.hre_rankingempresa';
  CheckPK := True;

  fraEmpresa.ShowBajas := true;
  fraEmpresa.ExtraCondition := '     AND co_contrato = '+
                               ' (SELECT MAX (b.co_contrato) '+
                               '    FROM aco_contrato b '+
                               '   WHERE b.co_idempresa = em_id '+
                               '     AND NOT EXISTS (SELECT 1 '+
                               '    FROM art.abc_bajadecontrato '+
                               '   WHERE b.co_contrato = bc_contrato)) ';

  //' and art.afiliacion.Get_ContratoVigente(' + fraEmpresa.FieldCUIT + ', SYSDATE) = ' + fraEmpresa.FieldContrato ;

  with fraRanking do
  begin
      TableName := 'HYS.HRK_RANKING';
      FieldDesc := 'RK_DESCRIPCION';
      FieldID := 'RK_ID';
      FieldCodigo := 'RK_ID';
      FieldBaja := 'RK_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraRankingFiltro do
  begin
      TableName := 'HYS.HRK_RANKING';
      FieldDesc := 'RK_DESCRIPCION';
      FieldID := 'RK_ID';
      FieldCodigo := 'RK_ID';
      FieldBaja := 'RK_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraMotivo do
  begin
      TableName := 'HYS.HMV_MOTIVOMOVEAS';
      FieldDesc := 'MV_DESCRIPCION';
      FieldID := 'MV_ID';
      FieldCodigo := 'MV_ID';
      FieldBaja := 'MV_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraUsuariosCargados do
  begin
      TableName := 'ART.USE_USUARIOS';
      FieldDesc := 'SE_NOMBRE';
      FieldID := 'SE_ID';
      FieldCodigo := 'SE_USUARIO';
      FieldBaja := 'SE_FECHABAJA';
      ExtraCondition := ' AND se_usuariogenerico = ''N'' AND se_sector = ''HYS'' ';
      CaseSensitive := false;
      ShowBajas := true;

  end;

  FEgreso := False;
  FPeriodo:= ValorSql('SELECT TO_CHAR(MAX (cp_fecha), ''YYYYMM'') FROM hys.hcp_carteraprevencion');
  FDBDate := DBDate;

//  tbRefrescarClick(Sender);
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmDefRanking.tbNuevoClick(Sender: TObject);
begin
  lblMotivo.Caption := 'Motivo de ingreso:';
  fraMotivo.ExtraCondition := ' AND MV_TIPO = ''I''';

  inherited;
end;

procedure TfrmDefRanking.tbRefrescarClick(Sender: TObject);
begin
  sdqEstablecimientos.Close;

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT re_id, em_id, em_cuit, ' +
                      '       art.afiliacion.get_contratovigente (em_cuit, art.actualdate) contrato, ' +
                      '       em_nombre, ' +
                      '       (SELECT cp.cp_tipo ' +
                      '          FROM hys.hcp_carteraprevencion cp ' +
                      '         WHERE TO_CHAR (cp.cp_fecha, ''YYYYMM'') = ' + SqlValue (FPeriodo) +
                      '           AND cp.cp_idempresa = em_id) cp_tipo, ' +
                      '       (SELECT cp.cp_ciiuviejo ' +
                      '          FROM hys.hcp_carteraprevencion cp ' +
                      '         WHERE TO_CHAR (cp.cp_fecha, ''YYYYMM'') = ' + SqlValue (FPeriodo) +
                      '           AND cp.cp_idempresa = em_id) cp_ciiuviejo, ' +
                      '       (SELECT cp.cp_capitas ' +
                      '          FROM hys.hcp_carteraprevencion cp ' +
                      '         WHERE TO_CHAR (cp.cp_fecha, ''YYYYMM'') = ' + SqlValue (FPeriodo) +
                      '           AND cp.cp_idempresa = em_id) cp_capitas, ' +
                      '       (SELECT ci_siniestralidadmedia ' +
                      '          FROM hys.hci_ciiusiniestralidad ' +
                      '         WHERE ci_ciiu = ' +
                      '                 (SUBSTR ((SELECT cp.cp_ciiuviejo ' +
                      '                             FROM hys.hcp_carteraprevencion cp ' +
                      '                            WHERE TO_CHAR (cp.cp_fecha, ''YYYYMM'') = ' + SqlValue (FPeriodo) +
                      '                              AND cp.cp_idempresa = em_id), ' +
                      '                          1, ' +
                      '                          6 ' +
                      '                         ) ' +
                      '                 )) incid_media, ' +
                      '       ' + SqlValue (FPeriodo) + ' ultperiodo, ' +
                      '       (SELECT cp.cp_incidencia ' +
                      '          FROM hys.hcp_carteraprevencion cp ' +
                      '         WHERE TO_CHAR (cp.cp_fecha, ''YYYYMM'') = ' + SqlValue (FPeriodo) +
                      '           AND cp.cp_idempresa = em_id) incidencia, ' +
                      '       (SELECT cp.cp_incidencia ' +
                      '          FROM hys.hcp_carteraprevencion cp ' +
                      '         WHERE TO_CHAR (ADD_MONTHS (cp.cp_fecha, 1), ''YYYYMM'') = ' +
                      '                                                             ' + SqlValue (FPeriodo) +
                      '           AND cp.cp_idempresa = em_id) incid_1, ' +
                      '       (SELECT cp.cp_incidencia ' +
                      '          FROM hys.hcp_carteraprevencion cp ' +
                      '         WHERE TO_CHAR (ADD_MONTHS (cp.cp_fecha, 2), ''YYYYMM'') = ' +
                      '                                                             ' + SqlValue (FPeriodo) +
                      '           AND cp.cp_idempresa = em_id) incid_2, ' +
                      '       re_idranking, rk_descripcion, re_vigenciadesde, re_vigenciahasta, ' +
                      '       re_motivobaja, re_motivoalta, re_fechabaja, re_fechaalta, '+
                      '       re_usualta, re_fechamodif, re_usumodif, ' +
                      '       me.mv_descripcion motivoingreso, me.mv_descripcion motivoegreso, ' +
                      '       re_fechaautorizacion, re_usuautorizacion, ' +
                      '       re_idmotivomoveasingreso, re_idmotivomoveasegreso ' +
                      '  FROM afi.aem_empresa, ' +
                      '       hys.hre_rankingempresa, ' +
                      '       hys.hrk_ranking, ' +
                      '       hys.hmv_motivomoveas mi, ' +
                      '       hys.hmv_motivomoveas me ' +
                      ' WHERE em_id = re_idempresa ' +
                      '   AND rk_id = re_idranking ' +
                      '   AND mi.mv_id(+) = re_idmotivomoveasingreso ' +
                      '   AND me.mv_id(+) = re_idmotivomoveasegreso ');

  if not dcbFiltroDesde.IsEmpty then
    sdqConsulta.SQL.Add('   AND re_vigenciadesde >= ' + SqlDate(dcbFiltroDesde.Date));

  if not dcbFiltroHasta.IsEmpty then
    sdqConsulta.SQL.Add('   AND re_vigenciahasta <= ' + SqlDate(dcbFiltroHasta.Date));

  if not chkBajas.Checked then
    sdqConsulta.SQL.Add('   AND re_fechabaja IS NULL ');

  if fraEmpresaFiltro.IsSelected then
    sdqConsulta.SQL.Add('   AND em_cuit = ' + SqlValue (fraEmpresaFiltro.CUIT));

  if fraRankingFiltro.IsSelected then
    sdqConsulta.SQL.Add('   AND re_idranking = ' + SqlValue (fraRankingFiltro.Value));

  if fraUsuariosCargados.IsSelected then
    sdqConsulta.SQL.Add('   AND re_usualta = ' + SqlValue (fraUsuariosCargados.Codigo));

  if not edFechaAltaDesde.IsEmpty then
    sdqConsulta.SQL.Add('   AND trunc(re_fechaalta) >= ' + SqlDate(edFechaAltaDesde.Date));

  if not edFechaAltaHasta.IsEmpty then
    sdqConsulta.SQL.Add('   AND trunc(re_fechaalta) <= ' + SqlDate(edFechaAltaHasta.Date));

  if not chkCaducadas.Checked then
    sdqConsulta.SQL.Add('   AND (re_vigenciadesde <= art.actualdate) ' +
                        '   AND ((re_vigenciahasta > art.actualdate) OR ' +
                        '        (re_vigenciahasta IS NULL))');
  inherited;

  if not sdqConsulta.IsEmpty then
    sdqEstablecimientos.Open;
end;

procedure TfrmDefRanking.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('re_fechabaja').AsString <> '' then
    AFont.Color := clRed
  else begin
    if not ((sdqConsulta.FieldByName('re_vigenciadesde').AsDateTime <= FDBDate) and
            ((sdqConsulta.FieldByName('re_vigenciahasta').AsDateTime > FDBDate) or
              sdqConsulta.FieldByName('re_vigenciahasta').IsNull)) then
      AFont.Color := clTeal
    else
      if sdqConsulta.FieldByName('re_idranking').AsInteger = 2 then
        AFont.Color := clBlue;
  end;

  inherited;
end;

procedure TfrmDefRanking.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaFiltro.Clear;
  fraRankingFiltro.Clear;
  dcbFiltroDesde.Clear;
  dcbFiltroHasta.Clear;
  chkBajas.Checked := False;
end;

procedure TfrmDefRanking.tbEliminarClick(Sender: TObject);
begin
  FEgreso := True;
  lblMotivo.Caption := 'Motivo de egreso:';

  fraMotivo.ExtraCondition := ' AND MV_TIPO = ''E''';

  fraEmpresaFiltro.ShowBajas := true;
  fraEmpresaFiltro.ExtraCondition := '     AND co_contrato = '+
                                     ' (SELECT MAX (b.co_contrato) '+
                                     '    FROM aco_contrato b '+
                                     '   WHERE b.co_idempresa = em_id '+
                                     '     AND NOT EXISTS (SELECT 1 '+
                                     '    FROM art.abc_bajadecontrato '+
                                     '   WHERE b.co_contrato = bc_contrato)) ';
  tbModificarClick(Sender);

  lblMotivo.Caption := 'Motivo de ingreso:';
  FEgreso := False;
end;

end.


