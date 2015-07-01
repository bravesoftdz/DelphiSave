unit unAutorizacionesEAS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, ANSISql, CUIT,
  unArtDBAwareFrame, unArtDbFrame, unFraCodigoDescripcion, unFraEmpresa,
  PeriodoPicker, ExComboBox, JvgGroupBox, Mask, PatternEdit, ComboEditor,
  CheckCombo;

type
  TfrmAutorizacionesEAS = class(TfrmCustomGridABM)
    ToolButton1: TToolButton;
    lblEmpresa: TLabel;
    rgAccion: TRadioGroup;
    lblMotivo: TLabel;
    tbRechazaTodo: TToolButton;
    tbAceptaTodo: TToolButton;
    RxDBGrid1: TRxDBGrid;
    sdqEstablecimientos: TSDQuery;
    dsEstablecimientos: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblEstado: TLabel;
    JvgGroupBox1: TJvgGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    ppPeriodoDesde: TPeriodoPicker;
    ppPeriodoHasta: TPeriodoPicker;
    chkSoloPendientes: TCheckBox;
    ecbMotivo: TExComboBox;
    rgMovimientos: TRadioGroup;
    Label7: TLabel;
    ppkUltimoPeriodo: TPeriodoPicker;
    lbCategoriaRiesgo: TLabel;
    cmbCategoriaRiesgo: TCheckCombo;
    cmbSector: TCheckCombo;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbAceptaTodoClick(Sender: TObject);
    procedure tbRechazaTodoClick(Sender: TObject);
    procedure ProcesarMovimiento(pIDRanking: integer);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ShortCutControlShortCuts9ShortCutPress(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  private
    { Private declarations }
    FUltimoPeriodo: String;
    FEnMonitoreo: Boolean;
  public
    { Public declarations }
  end;

var
  frmAutorizacionesEAS: TfrmAutorizacionesEAS;

implementation

uses unPrincipal, unDmPrincipal, unSesion, CustomDlgs, SqlFuncs, Strfuncs;

{$R *.dfm}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAutorizacionesEAS.ClearControls;
begin
  lblEmpresa.Caption := '';
  rgAccion.ItemIndex := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmAutorizacionesEAS.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.PrimaryKey.Add ('ae_id', sdqConsulta.FieldByName('ae_id').AsInteger);

  case rgAccion.ItemIndex of
    0: Sql.Fields.Add ('ae_estadoautorizacion', 'R');
    1: Sql.Fields.Add ('ae_estadoautorizacion', 'A');
  end;
  Sql.Fields.Add ('ae_usuarioautorizacion', Sesion.LoginName);
  Sql.Fields.Add ('ae_fechaautorizacion', DBDate);

  Result := inherited DoABM;

  if rgAccion.ItemIndex > 0 then
    ProcesarMovimiento(rgAccion.ItemIndex);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAutorizacionesEAS.LoadControls;
begin
  lblEmpresa.Caption := 'CUIT: ' + PonerGuiones (sdqConsulta.FieldByName('em_cuit').AsString) + ' - ' +
                        sdqConsulta.FieldByName('empresa').AsString;
  lblMotivo.Caption := 'Motivo Autorización: ' + sdqConsulta.FieldByName('motivo').AsString;

  FEnMonitoreo := ValorSqlInteger ('select art.hys.get_rankingempresa (' +
                                   SqlInteger(sdqConsulta.FieldByName('em_id').AsInteger) +
                                   ', art.actualdate) from dual') = 2;

  if FEnMonitoreo then
    lblEstado.Caption := 'Empresa en Monitoreo'
  else
    if (sdqConsulta.FieldByName('ae_motivoingreso').AsString = 'B') then
      lblEstado.Caption := 'Empresa dada de baja'
    else
      if sdqConsulta.FieldByName('ae_tipomov').AsString = 'I' then
        lblEstado.Caption := 'Empresa a ingresar como EAS'
      else
        lblEstado.Caption := 'Empresa a egresar como EAS';

  rgAccion.Items.Clear;
  rgAccion.Items.Add('Descartar');
  rgAccion.Items.Add('Aceptar');
  if (sdqConsulta.FieldByName('ae_motivoingreso').AsString <> 'B') and (not FEnMonitoreo) then
    rgAccion.Items.Add('Pasar a Monitoreo');

  rgAccion.Columns := rgAccion.Items.Count;
  rgAccion.ItemIndex := 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmAutorizacionesEAS.Validar: Boolean;
begin
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmAutorizacionesEAS.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'HYS.hae_autorizacioneseas';
  CheckPK := True;

  FUltimoPeriodo := ValorSQL ('SELECT MAX (ae_periodo) FROM hys.hae_autorizacioneseas');
  ppkUltimoPeriodo.Periodo.Valor := FUltimoPeriodo;
  ppPeriodoDesde.Periodo.Valor := FUltimoPeriodo;
  ppPeriodoHasta.Periodo.Valor := FUltimoPeriodo;

  with GetQuery('SELECT * FROM hys.hca_categoriariesgo') do
  try
    while not Eof do
    begin
      cmbCategoriaRiesgo.Items.AddObject(fieldbyname('CA_DESCRIPCION').AsString, TObject(fieldbyname('CA_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;
  with GetQuery('SELECT * FROM art.ctb_tablas WHERE tb_clave = ''SECT'' and tb_codigo <> 0') do
  try
    while not Eof do
    begin
      cmbSector.Items.AddObject(fieldbyname('TB_DESCRIPCION').AsString, TObject(fieldbyname('TB_CODIGO').AsInteger));
      if fieldbyname('TB_CODIGO').AsInteger <> 1 then
        cmbSector.Checked[fieldbyname('TB_CODIGO').AsInteger-1] := True;
      Next;
    end;
  finally
    free;
  end;

end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmAutorizacionesEAS.tbRefrescarClick(Sender: TObject);
var
  sIn: String;
  i : Integer;
begin
  sdqEstablecimientos.Close;

  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT ae_periodo, ae_id, em_id, ae_estadoautorizacion, ae_tipomov, cp1.cp_id, em_cuit, ' +
                      '       art.afiliacion.get_contratovigente (em_cuit, art.actualdate) contrato, ' +
                      '       em_nombre empresa, cp_tipo, cp1.cp_ciiuviejo, cp1.cp_capitas, ae_motivoingreso, ' +
                      '       (SELECT ci_siniestralidadmedia ' +
                      '          FROM hys.hci_ciiusiniestralidad ' +
                      '         WHERE ci_ciiu = ' +
                      '                               (SUBSTR (cp1.cp_ciiuviejo, 1, 6) ' +
                      '                               )) incid_media, ' +
                      '       ae_siniestralidad, ' +
                      '       (SELECT cp2.cp_incidencia ' +
                      '          FROM hys.hcp_carteraprevencion cp2 ' +
                      '         WHERE cp2.cp_fecha = ADD_MONTHS (cp1.cp_fecha, -1) ' +
                      '           AND cp2.cp_idempresa = cp1.cp_idempresa) incid_1, ' +
                      '       (SELECT cp2.cp_incidencia ' +
                      '          FROM hys.hcp_carteraprevencion cp2 ' +
                      '         WHERE cp2.cp_fecha = ADD_MONTHS (cp1.cp_fecha, -2) ' +
                      '           AND cp2.cp_idempresa = cp1.cp_idempresa) incid_2, ' +
                      '       DECODE (ae_estadoautorizacion, ' +
                      '               ''P'', ''Pendiente'', ' +
                      '               ''A'', ''Aprobada'', ' +
                      '               ''R'', ''Rechazada'' ' +
                      '              ) estado, ' +
                      '       DECODE (ae_motivoingreso, ' +
                      '               ''T'', ''Traspaso como ET/EP'', ' +
                      '               ''S'', ''Supera la media'', ' +
                      '               ''C'', ''Incidencia creciente'', ' +
                      '               ''F'', ''Falta de datos de cotización'', ' +
                      '               ''R'', ''NO supera la media'', ' +
                      '               ''B'', ''Baja de empresa'' ' +
                      '              ) motivo, ' +
                      '       ae_usuarioautorizacion, ae_fechaautorizacion ' +
                      '  FROM hys.hae_autorizacioneseas, ' +
                      '       afi.aem_empresa, ' +
                      '       hys.hcp_carteraprevencion cp1 ' +
                      ' WHERE em_id = ae_idempresa ' +
                      '   AND TO_CHAR (cp1.cp_fecha, ''YYYYMM'') = ae_periodo ' +
                      '   AND cp1.cp_idempresa = ae_idempresa ' +
                      '   AND ae_periodo >= ' + SqlValue(ppPeriodoDesde.Periodo.Valor) +
                      '   AND ae_periodo <= ' + SqlValue(ppPeriodoHasta.Periodo.Valor));

  case rgMovimientos.ItemIndex of
    1: sdqConsulta.SQL.Add('   AND ae_tipomov = ''I''');
    2: sdqConsulta.SQL.Add('   AND ae_tipomov = ''E''');
  end;

  if chkSoloPendientes.Checked then
    sdqConsulta.SQL.Add('   AND ae_estadoautorizacion = ''P''');

  if ecbMotivo.ItemIndex > 0 then
    sdqConsulta.SQL.Add('   AND ae_motivoingreso = ' + SqlValue(ecbMotivo.Value));

  sIn := '';
  if cmbSector.Text <> '' then
  begin
    sIn := '';
    for i:=0 to cmbSector.Items.Count-1 do
      if cmbSector.Checked[i] then
      begin
        if (sIn <> '') then sIn := sIn + ', ';
        sIn := sIn + SqlValue(integer(cmbSector.Items.Objects[i]));
      end;
  end;

  if sIn <> '' then
    sdqConsulta.SQL.Add('   AND em_sector + 0 in (' + sIn  + ')');



  sIn := '';
    if cmbCategoriaRiesgo.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbCategoriaRiesgo.Items.Count-1 do
        if cmbCategoriaRiesgo.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbCategoriaRiesgo.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sdqConsulta.SQL.Add(' AND EXISTS ( '+
         'SELECT 1 '+
         '  FROM comunes.cac_actividad cac, '+
         '       afi.aes_establecimiento aes, '+
         '       hys.hca_categoriariesgo, '+
         '       afi.aco_contrato aco '+
         ' WHERE cac.ac_id = aes.es_idactividad '+
         '   AND em_id = aco.co_idempresa '+
         '   AND cac.ac_idcategoriariesgo = ca_id(+) '+
         '   AND aco.co_contrato = aes.es_contrato '+
         '   AND aco.co_estado = 1 '+
         '   AND aco.co_contrato = art.afiliacion.get_ultcontrato (em_cuit) '+
         '   AND aes.es_fechabaja IS NULL '+
         '   AND ca_id in (' + sIn  + '))');

  inherited;

  if not sdqConsulta.IsEmpty then
    sdqEstablecimientos.Open
end;

procedure TfrmAutorizacionesEAS.tbModificarClick(Sender: TObject);
begin
  VerificarMultiple(['Autorizando movimiento EAS',
                     Grid,
                     sdqConsulta.FieldByName('ae_periodo').AsString = FUltimoperiodo,
                     'No puede autorizarse movimiento de período distinto al último procesado.'
                    ]);

  if sdqConsulta.FieldByName('ae_estadoautorizacion').AsString = 'P' then
    inherited;
end;

procedure TfrmAutorizacionesEAS.tbAceptaTodoClick(Sender: TObject);
var
  i : integer;
begin
  inherited;

  if Grid.SelectedRows.Count > 0 then
    with Grid.DataSource.DataSet do
      for i := 0 to Grid.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if sdqConsulta.FieldByName('ae_estadoautorizacion').AsString = 'P' then
        begin
          FEnMonitoreo := ValorSqlInteger ('select art.hys.get_rankingempresa (' +
                                           SqlInteger(sdqConsulta.FieldByName('em_id').AsInteger) +
                                           ', art.actualdate) from dual') = 2;

          EjecutarSqlST('UPDATE HYS.hae_autorizacioneseas ' +
                        '   SET ae_estadoautorizacion = ''A'', ' +
                        '       ae_usuarioautorizacion = ' + SqlValue (Sesion.LoginName) + ', ' +
                        '       ae_fechaautorizacion = SYSDATE ' +
                        ' WHERE ae_id = ' + SqlInt (sdqConsulta.FieldByName('ae_id').AsInteger) +
                        '   AND ae_periodo = ' + SqlValue(sdqConsulta.FieldByName('ae_periodo').AsString));

          ProcesarMovimiento (1)
        end
      end;

  tbRefrescarClick(Sender);
end;

procedure TfrmAutorizacionesEAS.tbRechazaTodoClick(Sender: TObject);
var
  i: integer;
begin
  inherited;

  if Grid.SelectedRows.Count > 0 then
    with Grid.DataSource.DataSet do
    begin
      for i := 0 to Grid.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if sdqConsulta.FieldByName('ae_estadoautorizacion').AsString = 'P' then
          EjecutarSqlST('UPDATE HYS.hae_autorizacioneseas ' +
                        '   SET ae_estadoautorizacion = ''R''' +
                        '       ae_usuarioautorizacion = ' + SqlValue (Sesion.LoginName) +
                        '       ae_fechaautorizacion = SYSDATE ' +
                        ' WHERE ae_id = ' + SqlInt (sdqConsulta.FieldByName('ae_id').AsInteger) +
                        '   AND ae_periodo = ' + SqlValue(sdqConsulta.FieldByName('ae_periodo').AsString));
      end
    end;

  tbRefrescarClick(Sender);
end;


procedure TfrmAutorizacionesEAS.ProcesarMovimiento (pIDRanking: integer);
begin
  BeginTrans;

  if sdqConsulta.FieldByName('ae_tipomov').AsString = 'I' then
  begin
    // Ingresos

    // Si la empresa tiene ranking distinto al solicitado, registro el cambio
    if ValorSqlInteger ('select art.hys.get_rankingempresa (' +
                        SqlInteger(sdqConsulta.FieldByName('em_id').AsInteger) +
                        ', art.actualdate) from dual') <> rgAccion.ItemIndex then
    begin
      // Caduco el ranking actual
      EjecutarSqlST('UPDATE HYS.hre_rankingempresa ' +
                    '   SET re_vigenciahasta = art.actualdate, ' +
                    '       re_usuautorizacion = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       re_fechaautorizacion = SYSDATE, ' +
                    '       re_fechamodif = sysdate, ' +
                    '       re_usumodif = ' + SqlValue(Sesion.LoginName) +
                    ' WHERE re_idempresa = ' + SqlInt (sdqConsulta.FieldByName('em_id').AsInteger) +
                    '   AND (re_vigenciadesde <= TRUNC (SYSDATE)) ' +
                    '   AND ((re_vigenciahasta > TRUNC (SYSDATE)) OR (re_vigenciahasta IS NULL)) ' +
                    '   AND re_fechabaja IS NULL ');

      // Pongo en el ranking solicitado
      EjecutarSqlST('INSERT INTO HYS.hre_rankingempresa ( ' +
                    '             re_id, re_idranking, re_idempresa, re_vigenciadesde, '+
                    '             re_vigenciahasta, re_fechaautorizacion, re_usuautorizacion, '+
                    '             re_fechabaja, re_usubaja, re_motivobaja, re_motivoalta, '+
                    '             re_idmotivomoveasingreso, re_idmotivomoveasegreso, '+
                    '             re_fechaalta, re_usualta, re_fechamodif, re_usumodif )'+
                    '     VALUES (HYS.seq_hre_id.NEXTVAL, ' +
                                  SqlInteger (pIDRanking) + ', ' +
                                  SqlInt (sdqConsulta.FieldByName('em_id').AsInteger) + ', ' +
                    '             art.actualdate, NULL, SYSDATE, ' +
                                  SqlValue(Sesion.LoginName) + ', ' +
                    '             NULL, NULL, NULL, NULL, NULL, NULL, sysdate,'+SqlValue(Sesion.LoginName)+', '+
                    '             NULL, NULL) ')
    end;
  end
  else begin
    // Egresos

    // Egreso por baja
    if sdqConsulta.FieldByName('ae_motivoingreso').AsString = 'B' then
      EjecutarSqlST('UPDATE HYS.hre_rankingempresa ' +
                    '   SET re_fechabaja = SYSDATE, ' +
                    '       re_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       re_motivobaja = ' + SqlValue (sdqConsulta.FieldByName('motivo').AsString) +
                    ' WHERE re_idempresa = ' + SqlInt (sdqConsulta.FieldByName('em_id').AsInteger) +
                    '   AND (re_vigenciadesde <= TRUNC (SYSDATE)) ' +
                    '   AND ((re_vigenciahasta > TRUNC (SYSDATE)) OR (re_vigenciahasta IS NULL)) ' +
                    '   AND re_fechabaja IS NULL ')
    else
    begin
      // Egreso por otras razones
      EjecutarSqlST('UPDATE HYS.hre_rankingempresa ' +
                    '   SET re_vigenciahasta = art.actualdate, ' +
                    '       re_usuautorizacion = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       re_fechaautorizacion = SYSDATE, ' +
                    '       re_fechamodif = sysdate, ' +
                    '       re_usumodif = ' + SqlValue(Sesion.LoginName) +
                    ' WHERE re_idempresa = ' + SqlInt (sdqConsulta.FieldByName('em_id').AsInteger) +
                    '   AND (re_vigenciadesde <= TRUNC (SYSDATE)) ' +
                    '   AND ((re_vigenciahasta > TRUNC (SYSDATE)) OR (re_vigenciahasta IS NULL)) ' +
                    '   AND re_fechabaja IS NULL ');

      // Pongo en monitoreo
      if pIDRanking = 2 then
        EjecutarSqlST('INSERT INTO HYS.hre_rankingempresa( ' +
                      '             re_id, re_idranking, re_idempresa, re_vigenciadesde, '+
                      '             re_vigenciahasta, re_fechaautorizacion, re_usuautorizacion, '+
                      '             re_fechabaja, re_usubaja, re_motivobaja, re_motivoalta, '+
                      '             re_idmotivomoveasingreso, re_idmotivomoveasegreso, '+
                      '             re_fechaalta, re_usualta, re_fechamodif, re_usumodif )'+
                      '     VALUES (HYS.seq_hre_id.NEXTVAL, ' +
                                    SqlInteger (pIDRanking) + ', ' +
                                    SqlInt (sdqConsulta.FieldByName('em_id').AsInteger) + ', ' +
                      '             art.actualdate, NULL, SYSDATE, ' +
                                    SqlValue(Sesion.LoginName) + ', ' +
                      '             NULL, NULL, NULL, NULL, NULL, NULL, sysdate, '+SqlValue(Sesion.LoginName)+', '+
                    '               NULL, NULL) ')
    end;
  end;


  EjecutarStoreST(' art.hys.do_actualizartipoempresaprev(' + SqlValue(sdqConsulta.FieldByName('em_id').AsInteger) + ');');
  EjecutarStoreST(' hys.do_actualizarestadoempresa(' + SqlValue(sdqConsulta.FieldByName('em_id').AsInteger) + ');');

  CommitTrans;
end;

procedure TfrmAutorizacionesEAS.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('ae_estadoautorizacion').AsString = 'R' then
    AFont.Color := clRed
  else
    if sdqConsulta.FieldByName('ae_estadoautorizacion').AsString = 'A' then
      AFont.Color := clBlue
end;

procedure TfrmAutorizacionesEAS.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  chkSoloPendientes.Checked := true;
  rgMovimientos.ItemIndex := 0;
  ppPeriodoDesde.Periodo.Valor := FUltimoPeriodo;
  ppPeriodoHasta.Periodo.Valor := FormatDateTime ('YYYYMM', Date);
end;

procedure TfrmAutorizacionesEAS.ShortCutControlShortCuts9ShortCutPress(
  Sender: TObject);
begin
  JvgGroupBox1.Collapsed := not JvgGroupBox1.Collapsed
end;

end.



