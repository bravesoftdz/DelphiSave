unit unListCargaDiaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, SinEdit, unArtFrame, unFraCodigoDescripcion, unfraDelegacion,
  Mask, ToolEdit, DateComboBox, CheckLst, unFraCodDesc, JvExCheckLst,
  JvCheckListBox, RXCtrls, ARTCheckListBox, DBCtrls, JvExExtCtrls,
  JvSplitter, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, FormPanel, unfraCtbTablas, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, unArtDbFrame, unFraEmpresa;

type
  TfrmListCargaDiaria = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    Label8: TLabel;
    cmbCD_FCARGADesde: TDateComboBox;
    cmbCD_FCARGAHasta: TDateComboBox;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    GroupBox1: TGroupBox;
    clbDocumentos: TARTCheckListBox;
    edEvolucion: TDBMemo;
    pnlEvolucion: TPanel;
    Separador: TJvSplitter;
    ToolButton1: TToolButton;
    lblCantidadPartes: TLabel;
    tbDesmarcar: TToolButton;
    tbSalir2: TToolButton;
    fpCie10: TFormPanel;
    fraCIE10: TfraCodigoDescripcion;
    lbCIE10: TLabel;
    Label2: TLabel;
    BevelAbm: TBevel;
    btnAceptarCIE10: TButton;
    btnCancelarCIE10: TButton;
    fraGravedadCIE10: TfraCtbTablas;
    tbCambiarCIE10: TToolButton;
    ToolButton7: TToolButton;
    tbValidarCIE10: TToolButton;
    gbGrupoTrabajo: TGroupBox;
    cmbGtrabajo: TDBCheckCombo;
    dsGtrabajo: TDataSource;
    sdqGtrabajo: TSDQuery;
    dsDelegacion: TDataSource;
    sdqDelegacion: TSDQuery;
    gbDelegacion: TGroupBox;
    cmbDelegacion: TDBCheckCombo;
    rgValidado: TRadioGroup;
    tbInvalidarCIE10: TToolButton;
    tbTotalesRegGrilla: TToolButton;
    gbGestor: TGroupBox;
    cmbGestor: TArtComboBox;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbVarios: TGroupBox;
    chkConexia: TCheckBox;
    chkImportados: TCheckBox;
    chkRevisar: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure tbDesmarcarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbCambiarCIE10Click(Sender: TObject);
    procedure tbValidarCIE10Click(Sender: TObject);
    procedure btnAceptarCIE10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbInvalidarCIE10Click(Sender: TObject);
    procedure cmbGtrabajoChange(Sender: TObject);
  private
    procedure CalcTotales;
    procedure DoFiltrarUsuarios;
  end;

var
  frmListCargaDiaria: TfrmListCargaDiaria;

const
  SQL_BASE = 'SELECT UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) as SINIESTRO_COMPLETO, ' +
                    'EX_SINIESTRO SINIESTRO, EX_ORDEN ORDEN, EX_RECAIDA RECAIDA, NVL(EX_FECHAACCIDENTE, ' +
                    'EX_FECHARECAIDA) F_ACCI,TJ_NOMBRE TRABAJADOR, CD_FCONTROL F_CONTROL, TB_DESCRIPCION ' +
                    'DOCU, CA_DESCRIPCION PRESTADOR, CD_DIAGNOSTICO DIAGNOSTICO, CD_OBSERVACIONES EVOLUCION, ' +
                    'CD_TRATAMIENTO, CD_FCARGA, CD_REVISARPARTE, CD_NROPARTE, ' +
	                  'CD_DIAGNOSTICOOMS CIE10_PARTE, DG_DESCRIPCION, CD_GRAVEDADCIE10 GRAV_CIE10, ' +
                    'ART.VARIOS.GET_DESCRIPCIONTABLA(''CTB'', CD_GRAVEDADCIE10, ''GRAVC'') DESCGRAVEDAD, ' +
                    'CD_CIE10REVISADO CIE10_VALIDO, EX_DIAGNOSTICOOMS CI10_ACTUAL, ' +
                    'ART.VARIOS.GET_DESCRIPCIONTABLA(''CTB'', EX_CAUSAFIN, ''CATER'') ESTADO, ' +
   	                'ART.VARIOS.GET_DESCRIPCIONTABLA(''CTB'', EX_TIPO, ''STIPO'') TIPO, ' +
	                  'ART.VARIOS.GET_DESCRIPCIONTABLA(''CTB'', EX_GRAVEDAD, ''SGRAV'') GRAVEDAD, ' +
	                  'EX_BREVEDESCRIPCION BREVE_DESCRIPCION, TB_CODIGO DOC, CD_FRECEPCION F_RECEPCION, ' +
                    'LG_NOMBRE DELEGACION, GP_NOMBRE G_TRABAJO, CD_USUALTA, siniestro.get_usuariogestor(ex_id) USUGESTOR, ' +
                    'EM_CUIT, EM_NOMBRE ' +
               'FROM ART.CTB_TABLAS,ART.CPR_PRESTADOR, CTJ_TRABAJADOR, ' +
                    'ART.SEX_EXPEDIENTES, V_SCD_CARGADIARIA, CDG_DIAGNOSTICO, ' +
                    'DLG_DELEGACIONES, MGP_GTRABAJO, aem_empresa, aco_contrato ' +
              'WHERE EX_SINIESTRO = CD_SINIESTRO ' +
                'AND EX_ORDEN = CD_ORDEN ' +
                'AND EX_RECAIDA = CD_RECAIDA ' +
                'AND EX_CUIL = TJ_CUIL ' +
                'AND CD_PRESTADOR = CA_IDENTIFICADOR(+) ' +
                'AND TB_CLAVE = ''DOCAR'' ' +
                'AND TB_CODIGO = CD_DOCUMENTO ' +
                'AND DG_CODIGO(+) = CD_DIAGNOSTICOOMS ' +
                'AND NVL(EX_DELEGACION, '''') = LG_CODIGO ' +
                'AND NVL(EX_GTRABAJO, '''') = GP_CODIGO ' +
                'AND EX_CONTRATO = CO_CONTRATO ' +
                'AND CO_IDEMPRESA = EM_ID';

implementation

{$R *.DFM}

uses
  unFiltros, unSesion, CustomDlgs, unDmPrincipal, AnsiSql, unPrincipal, unTercerizadoras;

procedure TfrmListCargaDiaria.tbRefrescarClick(Sender: TObject);
var
  sSQL: string;
begin
  Verificar(cmbCD_FCARGADesde.IsEmpty and cmbCD_FCARGAHasta.IsEmpty, gbFecha, 'Debe indicar al menos una fecha.');

  sSQL := SQL_BASE;

  if not edSiniestro.IsEmpty then
    sSQL := sSQL + ' AND cd_siniestro = ' + edSiniestro.SiniestroSQL +
                   ' AND cd_orden = ' + edSiniestro.OrdenSQL +
                   ' AND cd_recaida = ' + edSiniestro.RecaidaSQL;

  if (cmbDelegacion.Text <> '') then
    sSQL := sSQL + ' AND ex_delegacion ' + cmbDelegacion.InSql;


  if (cmbGtrabajo.Text <> '') then
    sSQL := sSQL + ' AND ex_gtrabajo ' + cmbGtrabajo.InSql;

  if (cmbGtrabajo.Text <> '') and (cmbGestor.Text <> '') then
     sSQL := sSQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(cmbGestor.Text)
  else if (cmbGestor.Text <> '') then
     sSQL := sSQL + ' AND cd_usualta = ' + SqlValue(cmbGestor.Text);

  if chkRevisar.Checked then
    sSQL := sSQL + ' AND cd_revisarparte = ''S'' ';

  if chkImportados.Checked then //filtro de los partes importados por el servicio de mail
    sSQL := sSQL + ' AND cd_usualta = ''SERVMAIL'' ';

  if chkConexia.Checked then //filtro de los partes cargados por conexia
    sSQL := sSQL + ' AND cd_usualta = ''CONEXIA'' ';

  case rgValidado.ItemIndex of
    0: sSQL := sSQL + ' AND cd_cie10revisado = ''S'' ';
    1: sSQL := sSQL + ' AND cd_cie10revisado = ''N'' ';
  end;

  if EsUsuarioDeTercerizadora then
    sSQL := sSQL + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_contrato = ' + sqlint(fraEmpresa.edContrato.Text);

  sSQL := sSQL + clbDocumentos.InSQL_StringValues('CD_DOCUMENTO') + DoFiltro(gbFecha);

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited;
  
  CalcTotales;
end;

procedure TfrmListCargaDiaria.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSiniestro.Clear;
  cmbCD_FCARGADesde.Clear;
  cmbCD_FCARGAHasta.Clear;
  clbDocumentos.ClearChecks;
  chkRevisar.Checked    := False;
  chkImportados.Checked := False;
  chkConexia.Checked    := False;
  cmbGtrabajo.Clear;
  cmbGestor.Clear;
  cmbDelegacion.Clear;
  rgValidado.ItemIndex := 2;
  fraEmpresa.Clear;
end;

procedure TfrmListCargaDiaria.CalcTotales;
begin
  if tbTotalesRegGrilla.Down Then begin
    Screen.Cursor := crSQLWait;
    if sdqConsulta.RecordCount > 0 then
      lblCantidadPartes.Caption := ' Cantidad de Partes Cargados: ' + IntToStr(sdqConsulta.RecordCount)
    else
      lblCantidadPartes.Caption := ' Cantidad de Partes Cargados: 0 ';
    Screen.Cursor := crDefault;
  end;
  lblCantidadPartes.Visible := tbTotalesRegGrilla.Down;
end;

procedure TfrmListCargaDiaria.tbTotalesRegGrillaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmListCargaDiaria.tbDesmarcarClick(Sender: TObject);
var Sql :String;
begin
  if sdqConsulta.FieldByName('CD_REVISARPARTE').AsString = 'S' then
  begin
    Sql := 'UPDATE spv_parteevolutivo ' +
             ' SET pv_arevisar = ''N'' ' +
           ' WHERE pv_siniestro = ' + sdqConsulta.FieldByName('SINIESTRO').AsString +
             ' AND pv_orden = ' + sdqConsulta.FieldByName('ORDEN').AsString +
             ' AND pv_recaida = ' + sdqConsulta.FieldByName('RECAIDA').AsString +
             ' AND pv_nroparte = ' + sdqConsulta.FieldByName('CD_NROPARTE').AsString;
    EjecutarSql(Sql);
    tbRefrescarClick(Sender);
  end;
end;

procedure TfrmListCargaDiaria.FormCreate(Sender: TObject);
begin
  inherited;
  with fraCIE10 do
  begin
    TableName   := 'CDG_DIAGNOSTICO';
    FieldID     := 'DG_CODIGO';
    FieldCodigo := 'DG_CODIGO';
    FieldDesc   := 'DG_DESCRIPCION';
    FieldBaja   := 'DG_FECHABAJA';
    ShowBajas   := False;
  end;
  with fraGravedadCIE10 do
  begin
    Clave     := 'GRAVC';
    OrderBy   := 'TB_CODIGO';
    ShowBajas := False;
  end;

  // Lu: por si se borran los DataSources
  cmbGtrabajo.DataSource := dsGtrabajo;
  cmbGestor.DataSource   := dsGestor;

  sdqGtrabajo.Open;
  sdqDelegacion.Open;
  DoFiltrarUsuarios;
end;

procedure TfrmListCargaDiaria.tbCambiarCIE10Click(Sender: TObject);
begin
  if sdqConsulta.Active and
     not(sdqConsulta.Eof) and
     not(sdqConsulta.FieldByName('CIE10_VALIDO').AsString = 'S') then
  begin
    fraCIE10.Codigo         := sdqConsulta.FieldByName('CIE10_PARTE').AsString;
    fraGravedadCIE10.Codigo := sdqConsulta.FieldByName('GRAV_CIE10').AsString;
    fpCie10.ShowModal;
  end;
end;

procedure TfrmListCargaDiaria.tbValidarCIE10Click(Sender: TObject);
var
  sSql :String;
begin
  if sdqConsulta.Active and
     not(sdqConsulta.Eof) and
     not(sdqConsulta.FieldByName('CIE10_PARTE').IsNull) and
     not(sdqConsulta.FieldByName('GRAV_CIE10').IsNull) and
     not(sdqConsulta.FieldByName('CIE10_VALIDO').AsString = 'S') then
  begin
    try
      sSql := 'art.siniestro.do_revisioncie10(' +
                    SqlInt(sdqConsulta.FieldByName('SINIESTRO').AsInteger) + ',' +
                    SqlInt(sdqConsulta.FieldByName('ORDEN').AsInteger) + ',' +
                    SqlInt(sdqConsulta.FieldByName('RECAIDA').AsInteger) + ',' +
                    SqlValue(sdqConsulta.FieldByName('DOC').AsString) + ',' +
                    SqlValue(frmPrincipal.DBLogin.LoginName) + ', ''S'' );';
      EjecutarStore(sSql);
      MsgBox('CIE10 validado con éxito.', MB_ICONINFORMATION);
      sdqConsulta.Refresh;
    except
      on E: Exception do begin
        ErrorMsg( E, 'Informe a mantenimiento de este error.');
        Close;
      end;
    end;
  end;
end;

procedure TfrmListCargaDiaria.btnAceptarCIE10Click(Sender: TObject);
var
  sSql :String;
begin
  Verificar(fraCIE10.IsEmpty,fraCIE10,'Debe ingresar CIE10.');
  Verificar(fraGravedadCIE10.IsEmpty,fraGravedadCIE10,'Debe ingresar Gravedad.');
  try
    sSql := 'art.siniestro.do_acturevicie10(' +
                SqlInt(sdqConsulta.FieldByName('SINIESTRO').AsInteger) + ',' +
                SqlInt(sdqConsulta.FieldByName('ORDEN').AsInteger) + ',' +
                SqlInt(sdqConsulta.FieldByName('RECAIDA').AsInteger) + ',' +
                SqlValue(fraCIE10.Codigo) + ',' +
                SqlValue(fraGravedadCIE10.Codigo) + ',' +
                SqlValue(sdqConsulta.FieldByName('DOC').AsString) + ',' +
                SqlValue(frmPrincipal.DBLogin.LoginName) + ' , ''S'' );';
    EjecutarStore(sSql);
    MsgBox('CIE10 validado con éxito.', MB_ICONINFORMATION);
    sdqConsulta.Refresh;
    fpCie10.ModalResult := MrOk;
  except
    on E: Exception do begin
      ErrorMsg( E, 'Informe a mantenimiento de este error.');
      Close;
    end;
  end;
end;

procedure TfrmListCargaDiaria.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  sdqGtrabajo.Close;
  sdqDelegacion.Close;
  Action := caFree;
end;

procedure TfrmListCargaDiaria.tbInvalidarCIE10Click(Sender: TObject);
var
  sSql :String;
begin
  if sdqConsulta.Active and
     not(sdqConsulta.Eof) and
     not(sdqConsulta.FieldByName('CIE10_PARTE').IsNull) and
     not(sdqConsulta.FieldByName('GRAV_CIE10').IsNull) and
    (sdqConsulta.FieldByName('CIE10_VALIDO').AsString = 'S') and
    (MessageDlg('¿Confirma quitar la validación del CIE10?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
  begin
    try
      sSql := 'art.siniestro.do_revisioncie10(' +
                    SqlInt(sdqConsulta.FieldByName('SINIESTRO').AsInteger) + ',' +
                    SqlInt(sdqConsulta.FieldByName('ORDEN').AsInteger) + ',' +
                    SqlInt(sdqConsulta.FieldByName('RECAIDA').AsInteger) + ',' +
                    SqlValue(sdqConsulta.FieldByName('DOC').AsString) + ',' +
                    SqlValue(frmPrincipal.DBLogin.LoginName) + ', ''N'' );';
      EjecutarStore(sSql);
      MsgBox('Marca de validación quitada con éxito.', MB_ICONINFORMATION);
      sdqConsulta.Refresh;
    except
      on E: Exception do
      begin
        ErrorMsg( E, 'Informe a mantenimiento de este error.');
        Close;
      end;
    end;
  end;
end;

procedure TfrmListCargaDiaria.cmbGtrabajoChange(Sender: TObject);
begin
  DoFiltrarUsuarios;
end;

procedure TfrmListCargaDiaria.DoFiltrarUsuarios;
var
  sSql :String;
begin
  if Trim(cmbGTrabajo.Text) <> '' then  // Lu 04/04/2008 pongo este if para que ejecute lo siguiente solo si se ingreso algo en el combo.
    sSql := 'SELECT ug_id ID, ug_usuario DESCRIPCION ' +
             ' FROM mgp_gtrabajo, mug_usuariogrupotrabajo, ctb_tablas ' +
            ' WHERE ug_fechabaja IS NULL ' +
              ' AND ug_tipousuario = tb_codigo ' +
              ' AND tb_clave = ''TUSU'' ' +
              ' AND tb_especial1 = ''S'' ' +
              ' AND gp_codigo = ug_grupo ' +
              ' AND gp_gestionado = ''S'' ' +
              ' AND gp_codigo ' + cmbGtrabajo.InSql +
         ' ORDER BY ug_usuario '
  else
    sSql := 'SELECT se_id ID, se_usuario DESCRIPCION ' +
             ' FROM use_usuarios ' +
            ' WHERE se_fechabaja IS NULL ' +
              ' AND se_usuariogenerico = ''N'' ' +
         ' ORDER BY se_usuario';

  cmbGestor.Clear;
  sdqGestor.Close;
  sdqGestor.SQL.Text := sSql;
  sdqGestor.Open;
end;

end.
