unit UnListSiniSinAltaMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, unfraPrestador, Mask, ToolEdit,
  DateComboBox, ExtCtrls, ComCtrls, ToolWin, unFraEmpresa, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Db,
  SDEngine, QueryToFile, ExportDialog, SortDlg, ShortCutControl, Qrctrls, QuickRpt, Placemnt, unFraCIE10, unArtFrame,
  unArtDbFrame, unArtDBAwareFrame, Menus, unFraCodigoDescripcion,
  unFraGrupoTrabajo, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unfraDelegacion;

type
  TfrmListSiniSinAltaMed = class(TForm)
    dbgDatos: TArtDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdOrden: TSortDialog;
    ExportDialog: TExportDialog;
    ShortCutControl: TShortCutControl;
    CoolBar: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton3: TToolButton;
    tbVPrevia: TToolButton;
    tbImprimir: TToolButton;
    ToolButton1: TToolButton;
    tbExportar: TToolButton;
    ToolButton6: TToolButton;
    tbOcultarMostrar: TToolButton;
    ToolButton4: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    ScrollBox: TScrollBox;
    qrpReporte: TQuickRep;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    qrdbIdentif: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrdbCuit: TQRDBText;
    qrdbDescrip: TQRDBText;
    qrdbLocalidad: TQRDBText;
    qrdbProvincia: TQRDBText;
    qrdbTelefono: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrlTitulo: TQRLabel;
    qrmCriterios: TQRMemo;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    lbSumSini: TQRLabel;
    lbSumDCaidos: TQRLabel;
    QRBand4: TQRBand;
    qrlTotDCaidos: TQRLabel;
    FormPlacement: TFormPlacement;
    QRLabel28: TQRLabel;
    QRDBText3: TQRDBText;
    qrlTotSini: TQRLabel;
    qrlUsuario: TQRLabel;
    lblTotDCaidos: TLabel;
    lblTotSini: TLabel;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    tbPedidoPE: TToolButton;
    QRLabel27: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel24: TQRLabel;
    PrintDialog: TPrintDialog;
    tbSolicitarAuditoria: TToolButton;
    ToolButton5: TToolButton;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    tsFiltros1: TTabSheet;
    GroupBox1: TGroupBox;
    fraPrestador: TfraPrestador;
    GroupBox2: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    dcSinDesde: TDateComboBox;
    dcSinHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    dcCargaDesde: TDateComboBox;
    dcCargaHasta: TDateComboBox;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    dcEEPPHasta: TDateComboBox;
    dcEEPPDesde: TDateComboBox;
    GroupBox7: TGroupBox;
    Label4: TLabel;
    dcGestAudHasta: TDateComboBox;
    dcGestAudDesde: TDateComboBox;
    Panel2: TPanel;
    chkComMed: TCheckBox;
    chkSRT: TCheckBox;
    chkReqSRT: TCheckBox;
    chkEstimable: TCheckBox;
    gbTipoAccidente: TGroupBox;
    fraTipoAccidente: TfraStaticCTB_TABLAS;
    gbDelegacion: TGroupBox;
    fraDelegacion: TfraDelegacion;
    gbGrupoTrabajo: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    GroupBox6: TGroupBox;
    cmbEstado: TComboBox;
    gbCie10: TGroupBox;
    fraCIE10: TfraCIE10;
    Label7: TLabel;
    cmbVencim: TComboBox;
    chkGSueldos: TCheckBox;
    qriLogo: TQRImage;
    GroupBox8: TGroupBox;
    Label5: TLabel;
    dcTurnoDesde: TDateComboBox;
    dcTurnoHasta: TDateComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOcultarMostrarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure dbgDatosPaintFooter(Sender: TObject; Column: String;var Value: String; var CellColor, FontColor: TColor;
                                  var AlignFooter: TAlingFooter);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbVPreviaClick(Sender: TObject);
    procedure qrpReporteBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure lbSumSiniPrint(Sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure lbSumDCaidosPrint(Sender: TObject; var Value: String);
    procedure dbgDatosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                    Highlight: Boolean);
    procedure tbPedidoPEClick(Sender: TObject);
    procedure dbgDatosCellClick(Column: TColumn);
    procedure dbgDatosContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure dbgDatosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
                                     State: TGridDrawState);
    procedure dbgDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbSolicitarAuditoriaClick(Sender: TObject);
  private
    FRegistrosSeleccionados: TStringList;

    SqlWhere: String;
    SumDiasCaidos: String;
  public
  end;

implementation

uses
  CUIT, General, unDmPrincipal, AnsiSql, CustomDlgs, unArt, DbFuncs, unSesion, unTercerizadoras, SqlFuncs,
  Strfuncs, unComunes, unPrincipal, unSiniestros;

{$R *.DFM}

procedure TfrmListSiniSinAltaMed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuListSiniSinAltaMed.Enabled := True;
end;

procedure TfrmListSiniSinAltaMed.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListSiniSinAltaMed.tbLimpiarClick(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  
  fraPrestador.Limpiar;
  fraEmpresa.Clear;
  dcSinDesde.ClearDate;
  dcSinHasta.ClearDate;
  dcCargaDesde.ClearDate;
  dcCargaHasta.ClearDate;
  dcEEPPDesde.ClearDate;
  dcEEPPHasta.ClearDate;
  dcGestAudDesde.ClearDate;
  dcGestAudHasta.ClearDate;
  dcTurnoDesde.ClearDate;
  dcTurnoHasta.ClearDate;
  fraGrupoTrabajo.Clear;
  cmbEstado.ItemIndex := 3;  // Todos
  fraDelegacion.Clear;
  sdqDatos.Close;
  fraPrestador.CuitFocus;
  lblTotSini.Caption    := ' ';
  lblTotDCaidos.Caption := ' ';
  chkSRT.Checked        := False;
  chkReqSRT.Checked     := False;
  chkEstimable.Checked  := False;
  chkGSueldos.Checked   := False;
  fraTipoAccidente.Clear;
  fraCIE10.Limpiar;
end;

procedure TfrmListSiniSinAltaMed.tbOcultarMostrarClick(Sender: TObject);
begin
  if tbOcultarMostrar.Down then
  begin
    pcFiltros.Visible           := False;
    tbOcultarMostrar.Hint       := 'Mostrar Filtros';
    tbOcultarMostrar.ImageIndex := 17;
  end
  else
  begin
    pcFiltros.Visible           := True;
    tbOcultarMostrar.Hint       := 'Ocultar Filtros';
    tbOcultarMostrar.ImageIndex := 18;
  end;
end;

procedure TfrmListSiniSinAltaMed.tbRefrescarClick(Sender: TObject);
var
  SqlAdd, Estado, FechaMaxCIE10, Sql, variable_vencimiento : String;
begin
  Estado := '';
  FechaMaxCIE10 := '';
  FRegistrosSeleccionados.Clear;

  qrmCriterios.Lines.Text := '';

  Verificar(((dcCargaDesde.Date > 0) and (dcCargaHasta.Date = 0)) or
            ((dcCargaDesde.Date = 0) and (dcCargaHasta.Date > 0)), dbgDatos,
            'Debe completar la fecha de carga del siniestro.');
  Verificar(((dcSinDesde.Date > 0) and (dcSinHasta.Date = 0)) or
            ((dcSinDesde.Date = 0) and (dcSinHasta.Date > 0)), dbgDatos,
            'Debe completar la fecha del siniestro.');
  Verificar(((dcEEPPDesde.Date > 0) and (dcEEPPHasta.Date = 0)) or
            ((dcEEPPDesde.Date = 0) and (dcEEPPHasta.Date > 0)), dbgDatos,
            'Debe completar la fecha de posible enfermedad profesional.');
  Verificar(((dcTurnoDesde.Date > 0) and (dcTurnoHasta.Date = 0)) or
            ((dcTurnoDesde.Date = 0) and (dcTurnoHasta.Date > 0)), dbgDatos,
            'Debe completar la fecha de turno de derivación.');

  FechaMaxCIE10 := ValorSql('Select to_char(max(cc_fecha)) From ccc_costoporcie10');
  sdqDatos.Close;
  if cmbVencim.text = 'por CIE10' then
    variable_vencimiento := '''1'''
  else
    variable_vencimiento := '''0''';

   Sql :=
    'SELECT null checkbox, ex_siniestro, ex_orden, ex_recaida,' +
          ' ex_siniestro || ''-'' || ex_orden || ''-'' || ex_recaida SINORDREC,' +
          ' nvl(ex_fecharecaida, ex_fechaaccidente) fecha, ex_cuit, em_nombre mp_nombre, ex_cuil, tj_nombre, ex_bajamedica,' +
          ' ex_diagnosticooms, ex_diagnostico, sa_evolutivo,  ex_fechaalta, ex_prestador, ca_clave, ca_descripcion,' +
          ' ca_localidad, ca_codarea || '' '' || ca_telefono ca_telefono, pv_descripcion,' +
          ' DECODE(' + variable_vencimiento + ', ''1'', sa_estado, sa_estadog) SA_ESTADO,' +
          ' DECODE(' + variable_vencimiento + ', ''1'', est.tb_descripcion, estg.tb_descripcion) Estado,' +
          ' TO_NUMBER(DECODE(ex_gtrabajo, ''27'',' +
          ' art.utiles.IIF_CHAR(ex_altamedica, null, actualdate -' +
          ' (NVL(ex_bajamedica, NVL(ex_fecharecaida, ex_fechaaccidente))), 0), actualdate -' +
          ' (NVL(ex_bajamedica, DECODE(ex_tipo, ''3'', NVL(ex_fecharecepcion, NVL(ex_fecharecaida, ex_fechaaccidente)), NVL(ex_fecharecaida, ex_fechaaccidente)))))) DIASCAIDOS,' +
          ' sa_fechacontrol, tipoacc.tb_descripcion TipoAccidente,' +
          ' art.utiles.IIF_CHAR(ex_tipo, '''', ''1'', ex_tipo) tipo, ex_tipo,' +
          ' art.varios.get_nombredelegacion(ex_delegacion) DELEGACION,' +
          ' art.amebpba.get_nombregtrabajo(ex_gtrabajo) GTRABAJO, ex_gtrabajo, siniestro.get_usuariogestor(ex_id) USUGESTOR, ex_delegacion COD_DELEGACION, ' +
          ' DECODE(ex_gravedadcie10, ''2'', dg_diasmoderado, ''3'', dg_diasgrave, dg_diasleve) DiasporCie10,' +
          ' nvl(sa_proximocontrol, '''') PROX_CONTROL, NULL Categoria,' +
          ' inca.is_sini_estimable(ex_siniestro, ex_orden, ex_recaida) Estimable,' +
          ' art.amebpba.get_dictamen_continua(ex_siniestro, ex_orden, 2) FecContinua,' +
          ' art.amebpba.get_fcontrol(ex_siniestro, ex_orden, ex_recaida) FecMaxControl,' +
          ' substr(art.amebpba.Get_IncaEstimada(sa_siniestro, sa_orden, sa_recaida), 1, 10) FecEsti,' +
          ' substr(art.amebpba.Get_IncaEstimada(sa_siniestro, sa_orden, sa_recaida), 11, 20) UsuEsti,' +
          ' to_number(substr(art.amebpba.Get_IncaEstimada(sa_siniestro, sa_orden, sa_recaida), 31, 6)) PorcEsti,' +
          ' decode(ex_gravedad, ''1'', ''Leve'', ''2'', ''Moderado S/Inter'', ''3'', ''Moderado C/Inter'', ''4'', ''Grave'', ''5'', ''Mortal'', null) Gravedad,' +
          ' ex_posibleeepp, ex_usuposibleeepp, ex_fechaposibleeepp, ex_id, dg_id, ex_fechaGestAud, ' +   // Lu WF 7781
          ' art.trabajador.get_isgrandessueldos(ex_cuil, ex_contrato) gransueldo, ' +
          ' ca_provincia, siniestro.get_fechaturno(ex_id, ''D'') turnoderivacion, ' +
          ' art.siniestro.get_descripcionCIE10(ex_id) descCIE10, ' +
          ' c.st_idexpediente, a.st_idexpediente, art.varios.get_regionsanitaria(ca_codpostal, ca_localidad) RegSanitPrest, ' +   // TK 44256
          ' art.iif_null (ART.SINIESTRO.GET_SINIESTROTOPEADO(ex_id, null, ''C''), ''N'', ''S'') topeado_CIE10, c.st_fechatope1 FTope1_CIE10, c.st_fechatope2 FTope2_CIE10, ' +
          ' art.iif_null (ART.SINIESTRO.GET_SINIESTROTOPEADO(ex_id, null, ''A''), ''N'', ''S'') topeado_Aut, a.st_fechatope1 FTope1_Aut, a.st_fechatope2 FTope2_Aut, ' +
          ' art.inca.is_extensionILT(ex_id) ExtensionILT ' +

    ' FROM art.ctb_tablas tipoacc, art.ctb_tablas est, art.ctb_tablas estg, aem_empresa, art.cdg_diagnostico, art.cpv_provincias,' +
         ' art.cpr_prestador, ctj_trabajador, art.sex_expedientes, art.ssa_siniestrossinalta, sin.sst_siniestrostopeados C, sin.sst_siniestrostopeados A ';    // TK 44256 (agregue la tabla art.mgp_gtrabajo)

  SqlWhere :=
    ' WHERE sa_siniestro = ex_siniestro' +
      ' AND sa_orden = ex_orden' +
      ' AND sa_recaida = ex_recaida' +
      ' AND ex_idtrabajador = tj_id' +
      ' AND ex_cuit = em_cuit' +
      ' AND ex_prestador = ca_identificador(+)' +
      ' AND ca_provincia = pv_codigo(+)' +
      ' AND tipoacc.tb_clave (+) = ''STIPO''' +
      ' AND tipoacc.tb_codigo (+) = art.utiles.IIF_CHAR(ex_tipo, '''', ''1'', ex_tipo)' +
      ' AND EST.tb_clave (+) = ''ESTSA''' +
      ' AND EST.tb_codigo (+) = sa_estado' +
      ' AND ESTG.tb_clave (+) = ''ESTSA''' +
      ' AND ESTG.tb_codigo (+) = sa_estadog' +
      ' AND dg_codigo (+) = ex_diagnosticooms' +

      ' AND c.st_idexpediente(+) = ex_id ' +      // por Plan Tope de Siniestros por CIE-10
      ' AND c.st_fechabaja(+) IS NULL ' +
      ' AND c.st_tipotopeo(+) = ''C'' ' +

      ' AND a.st_idexpediente(+) = ex_id ' +      // por Plan Tope de Siniestros por Autorizacion
      ' AND a.st_fechabaja(+) IS NULL ' +
      ' AND a.st_tipotopeo(+) = ''A'' ';


  if EsUsuarioDeTercerizadora then           // por Plan Ioma - Tercerizadoras
    SqlWhere := SqlWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if fraPrestador.IDPrestador <> 0 then
  begin
    SqlWhere := SqlWhere + ' and Ex_Prestador = ' + SqlValue(fraPrestador.IDPrestador);
    qrmCriterios.Lines.Text := 'Prestador: ' + fraPrestador.RazonSocial + #13;
  end;

  if fraEmpresa.IsSelected then
  begin
    SqlWhere := SqlWhere + ' and Ex_cuit = ' + SQLValue(fraEmpresa.CUIT) + ' ';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Empresa: ' + fraEmpresa.cmbRSocial.Text + #13;
  end;
  
  if Trim(cmbEstado.Text) <> '' then
  begin
    if cmbEstado.ItemIndex = 0 then
      Estado := 'A'
    else if cmbEstado.ItemIndex = 1 then
      Estado := 'N'
    else if cmbEstado.ItemIndex = 2 then
      Estado := 'V'
    else
      Estado := 'T';

    if Estado <> 'T' then
      if variable_vencimiento = '''1''' then
        SqlWhere := SqlWhere + ' and sa_estado = ''' + Estado + ''''
      else
        SqlWhere := SqlWhere + ' and sa_estadog = ''' + Estado + '''';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Estado: ' + cmbEstado.Text;
  end;

  if (dcSinDesde.Date > 0) and (dcSinHasta.Date > 0) then
  begin
    SqlWhere := SqlWhere + ' and Nvl(ex_fecharecaida, ex_fechaaccidente) between ' + dcSinDesde.SqlText;
    SqlWhere := SqlWhere + ' and ' + dcSinHasta.SqlText;
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Fecha del siniestro desde: ' +
                               dcSinDesde.Text + ' al ' + dcSinHasta.Text + #13;
  end;

  if (dcCargaDesde.Date > 0) and (dcCargaHasta.Date > 0) then
  begin
    SqlWhere := SqlWhere + ' and Ex_Fechaalta between ' + dcCargaDesde.SqlText;
    SqlWhere := SqlWhere + ' and ' + dcCargaHasta.SqlText;
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Fecha de carga siniestro desde: ' +
                               dcCargaDesde.Text + ' al ' + dcCargaHasta.Text + #13;
  end;

  if (dcEEPPDesde.Date > 0) and (dcEEPPHasta.Date > 0) then
  begin
    SqlWhere := SqlWhere + ' and ex_fechaposibleeepp between ' + dcEEPPDesde.SqlText;
    SqlWhere := SqlWhere + ' and ' + dcEEPPHasta.SqlText;
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Fecha de posible enfermedad profesional desde: ' +
                               dcEEPPDesde.Text + ' al ' + dcEEPPHasta.Text + #13;
  end;

  if (dcGestAudDesde.Date > 0) and (dcGestAudHasta.Date > 0) then
  begin
    SqlWhere := SqlWhere + ' and ex_fechaGestAud between ' + dcGestAudDesde.SqlText +
                           ' and ' + dcGestAudHasta.SqlText;
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Fecha de gestionado por Auditoría desde: ' +
                               dcGestAudDesde.Text + ' al ' + dcGestAudHasta.Text + #13;
  end;

  if (dcTurnoDesde.Date > 0) and (dcTurnoHasta.Date > 0) then
  begin
    SqlWhere := SqlWhere + ' and siniestro.get_fechaturno(ex_id, ''D'') between ' + dcTurnoDesde.SqlText;
    SqlWhere := SqlWhere + ' and ' + dcTurnoHasta.SqlText;
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Fecha de turno de derivación desde: ' +
                               dcTurnoDesde.Text + ' al ' + dcTurnoHasta.Text + #13;
  end;

  if fraGrupoTrabajo.cmbDescripcion.Text <> '' then
  begin
    SqlAdd := ' and nvl(ex_gtrabajo, '''') = ' + SqlString(fraGrupoTrabajo.ID, True);
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Grupo de trabajo: ' + fraGrupoTrabajo.cmbDescripcion.Text + #13;
  end;

  if fraGrupoTrabajo.cmbGestor.Text <> '' then
  begin
     SqlWhere := SqlWhere + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
     qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Usuario gestor: ' + fraGrupoTrabajo.cmbGestor.Text + #13;
  end;

  if not fraDelegacion.IsEmpty then
  begin
    SqlWhere := SqlWhere + ' and art.AMEBPBA.Get_Delegacion(ex_siniestro, ex_orden, ex_recaida) = ' + SqlString(fraDelegacion.Codigo, True);
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Delegación: ' + fraDelegacion.Descripcion + #13;
  end;

  if not fraTipoAccidente.IsEmpty then
  begin
    SqlWhere := SqlWhere + IIF(fraTipoAccidente.Codigo = '1', ' and ((EX_TIPO is null) or (EX_TIPO = ''1'') ) ', ' and ex_tipo = ' + SqlValue(fraTipoAccidente.Codigo));
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Tipo de Accidente: ' + fraTipoAccidente.Descripcion + #13;
  end;

  if chkComMed.Checked then
  begin
    SqlWhere := SqlWhere + ' AND art.inca.is_dictamencommed(ex_siniestro, ex_orden) = ''S'' ';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Con Comisión Médica ';
  end;

  if chkSRT.Checked then
  begin
    SqlWhere := SqlWhere +
      ' AND Exists (SELECT 1' +
                    ' FROM SDG_DENUNCIASGRAVES' +
                   ' WHERE DG_SINIESTRO = EX_SINIESTRO' +
                     ' AND DG_ORDEN = EX_ORDEN)';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Denuncias Graves';
  end;

  if chkReqSRT.Checked then
  begin
    SqlWhere := SqlWhere + ' AND (art.amebpba.is_requerimientosrt(ex_siniestro, ex_orden, ex_recaida) = ''S'')';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Req. SRT';
  end;

  if chkEstimable.Checked then
  begin
    SqlWhere := SqlWhere + ' AND (inca.is_sini_estimable(ex_siniestro, ex_orden, ex_recaida) = ''S'')';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Estimable';
  end;

  if chkGSueldos.Checked then
  begin
    SqlWhere := SqlWhere + ' AND art.trabajador.get_isgrandessueldos(ex_cuil, ex_contrato) = ''S'' ';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Grandes sueldos';
  end;

  if fracie10.edCodigo.Text <> '' then
    SqlWhere := SqlWhere + ' AND NVL(EX_DIAGNOSTICOOMS,'' '')=''' + fracie10.edCodigo.Text + ''''  ;

  if Is_UsuarioSML(Sesion.UserID) then   // Plan - SML
  begin
    SqlWhere := SqlWhere + ' AND art.siniestro.get_siniestrosml(ex_id) = ''S'' ';
    qrmCriterios.Lines.Text := qrmCriterios.Lines.Text +  'Siniestros de SML';
  end;

  if qrmCriterios.Lines.Text = '' then
    qrmCriterios.Lines.Text := 'Todos los Siniestros Sin Alta Médica';

  Sql := Sql + SqlWhere + SqlAdd + sdOrden.OrderBy;    // Aca se arma el Query

  if not fraempresa.IsEmpty then
    LogAuditoria('LSS', fraempresa.CUIT);

  qrmCriterios.Lines.Text := qrmCriterios.Lines.Text + 'Vencimiento: ' + cmbVencim.Text;
  OpenQuery(sdqDatos, Sql);

  SumDiasCaidos := FloatToStr(SumField(sdqDatos, 'DIASCAIDOS'));
  if SumDiasCaidos <> '' then
    lblTotDCaidos.Caption := 'Total Días Caídos: ' + SumDiasCaidos
  else
    lblTotDCaidos.Caption := ' ';

  if IntToStr(sdqDatos.RecordCount) <> '' then
    lblTotSini.Caption := 'Registros encontrados: ' + IntToStr(sdqDatos.RecordCount)
  else
    lblTotSini.Caption := ' ';

end;

procedure TfrmListSiniSinAltaMed.tbExportarClick(Sender: TObject);
begin
  if not sdqDatos.IsEmpty then
    ExportDialog.Execute;
end;

procedure TfrmListSiniSinAltaMed.dbgDatosPaintFooter(Sender: TObject;Column: String; var Value: String; var CellColor,
                                                     FontColor: TColor;var AlignFooter: TAlingFooter);
begin
  if Column = 'SINORDREC' then
  begin
    Value := IntToStr(sdqDatos.RecordCount);
    if Value <> '' then
      lblTotSini.Caption := 'Registros encontrados: ' + Value
    else
      lblTotSini.Caption := ' ';
   end;

  if Column = 'DIASCAIDOS' then
  begin
    Value := SumDiasCaidos;
    if Value <> '' then
      lblTotDCaidos.Caption := 'Total Días Caídos: ' + Value
    else
      lblTotDCaidos.Caption := ' ';
  end;
end;

procedure TfrmListSiniSinAltaMed.tbOrdenarClick(Sender: TObject);
begin
  sdOrden.Execute;
end;

procedure TfrmListSiniSinAltaMed.tbVPreviaClick(Sender: TObject);
begin
  if not sdqDatos.IsEmpty then
  begin
    qrlTitulo.Caption := 'Listado de Siniestros sin Alta Médica';
    qrpReporte.Preview;
  end;
end;

procedure TfrmListSiniSinAltaMed.qrpReporteBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
  qrlUsuario.Caption    := Sesion.Usuario;
  qrlTotSini.Caption    := lblTotSini.Caption;
  qrlTotDCaidos.Caption := lblTotDCaidos.Caption;
end;

procedure TfrmListSiniSinAltaMed.tbImprimirClick(Sender: TObject);
begin
  if PrintDialog.Execute then
  try
    tbImprimir.Enabled := False;
    if not sdqDatos.IsEmpty then
    begin
      qrlTitulo.Caption := 'Listado de Siniestros sin Alta Médica';
      qrpReporte.Print;
    end;
  finally
    tbImprimir.Enabled := True;
  end;
end;

{------[Para hacer la sumatoria de siniestros por prestador, en el reporte.]-----------------------------------------------------}
procedure TfrmListSiniSinAltaMed.lbSumSiniPrint(Sender: TObject; var Value: String);
var
  sSql: String;
begin
  sSql := '';

  if sdqDatos.FieldByName('EX_PRESTADOR').AsString <> '' then
    sSql := ' AND ex_prestador = ' + sdqDatos.FieldByName('EX_PRESTADOR').AsString
  else
    sSql := ' AND ex_prestador IS NULL ';

  if fraGrupoTrabajo.cmbDescripcion.Text <> '' then
    sSql := sSql + ' and ex_gtrabajo = ' + SqlString(fraGrupoTrabajo.ID, True);

  Value := ValorSql('SELECT COUNT(*) SiniPOrPrestador' +
                     ' FROM ctb_tablas tipoacc, ctb_tablas est, ctb_tablas estg, aem_empresa, cdg_diagnostico,' +
                          ' cpv_provincias, cpr_prestador, ctj_trabajador, sex_expedientes, ssa_siniestrossinalta, ' +
                          ' sin.sst_siniestrostopeados a,  sin.sst_siniestrostopeados c ' +
                    SqlWhere + sSql);
end;

{------[Para hacer la sumatoria de dias caidos por prestador, en el reporte.]----------------------------------------------------}
procedure TfrmListSiniSinAltaMed.lbSumDCaidosPrint(Sender: TObject; var Value: String);
var
  sSql: String;
begin
  sSql := '';

  if sdqDatos.FieldByName('EX_PRESTADOR').AsString <> '' then
    sSql := ' AND ex_prestador = ' + sdqDatos.FieldByName('EX_PRESTADOR').AsString
  else
    sSql := ' AND ex_prestador IS NULL ';

  if fraGrupoTrabajo.cmbDescripcion.Text <> '' then
    sSql := sSql + ' and ex_gtrabajo = ' + SqlString(fraGrupoTrabajo.ID, True);

  Value := ValorSql('SELECT SUM(actualdate -(NVL(ex_fecharecaida, ex_fechaaccidente))) sumaDIASCAIDOS' +
                     ' FROM ctb_tablas tipoacc, ctb_tablas est, ctb_tablas estg, aem_empresa, cdg_diagnostico,' +
                          ' cpv_provincias, cpr_prestador, ctj_trabajador, sex_expedientes, ssa_siniestrossinalta, sin.sst_siniestrostopeados a,  sin.sst_siniestrostopeados c ' +
                    SqlWhere + sSql);
end;

procedure TfrmListSiniSinAltaMed.FormCreate(Sender: TObject);
begin
  FRegistrosSeleccionados := TStringList.Create;
  pcFiltros.ActivePage    := tsFiltros0;
  SqlWhere := '';
  SumDiasCaidos := '';
  fraPrestador.ShowBajas := True;
  lblTotSini.Caption := ' ';
  lblTotDCaidos.Caption := ' ';
  cmbvencim.ItemIndex := 0;
  fraEmpresa.Tercerizadoras := EsUsuarioDeTercerizadora;
  fraTipoAccidente.Clave    := 'STIPO';
  fraTipoAccidente.OrderBy  := 'TB_CODIGO';
  cmbEstado.ItemIndex       := 3; // Todos
end;

{----[Para que cambie el color de la fila cuando esta seleccionado "Todos" los estados y el estado es "V" (vencidos)]------------}
procedure TfrmListSiniSinAltaMed.dbgDatosGetCellParams(Sender: TObject;Field: TField; AFont: TFont;
                                                       var Background: TColor; Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqDatos.FieldByName('ex_id').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen

  if cmbEstado.Text = 'Todos' then
  begin
    if (sdqDatos.FieldByName('SA_ESTADO').AsString = 'V') then
      if Highlight then
        Background := clMaroon
      else
        Background := clMenu;
  end;
end;

procedure TfrmListSiniSinAltaMed.tbPedidoPEClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqDatos.Active then
  try
    BeginTrans;
    sdqDatos.First;
    while not sdqDatos.Eof do
    begin
      sSql :=
        'DELETE FROM SDO_DOCUMUTUAL' +
             ' WHERE DO_SINIESTRO = ' + SqlInt(sdqDatos.FieldByName('EX_SINIESTRO').AsInteger) +
               ' AND DO_ORDEN = ' + SqlInt(sdqDatos.FieldByName('EX_ORDEN').AsInteger) +
               ' AND DO_RECAIDA = ' + SqlInt(sdqDatos.FieldByName('EX_RECAIDA').AsInteger) +
               ' AND DO_DOCUMENTO = ''019''' +
               ' AND DO_FECHAIMPRESION IS NOT NULL' +
               ' AND EXISTS (SELECT 1' +
                             ' FROM CPR_PRESTADOR, SEX_EXPEDIENTES, SSA_SINIESTROSSINALTA, CDG_DIAGNOSTICO' +
                            ' WHERE DO_SINIESTRO = SA_SINIESTRO' +
                              ' AND DO_ORDEN = SA_ORDEN' +
                              ' AND DO_RECAIDA = SA_RECAIDA' +
                              ' AND DG_CODIGO = EX_DIAGNOSTICOOMS' +
                              ' AND (SA_FECHACONTROL <= (ACTUALDATE - DG_DIAS_EVOL) OR SA_FECHACONTROL IS NULL)' +
                              ' AND SA_ESTADO = ''V''' +
                              ' AND DO_PRESTADOR <> EX_PRESTADOR' +
                              ' AND EX_SINIESTRO = SA_SINIESTRO' +
                              ' AND EX_ORDEN = SA_ORDEN' +
                              ' AND EX_RECAIDA = SA_RECAIDA' +
                              ' AND EX_PRESTADOR = CA_IDENTIFICADOR' +
                              ' AND CA_CLAVE <> ''' + TXT_EMP_CUIT + ''')';
      EjecutarSqlST(sSql);

      {-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }

      sSql :=
        'INSERT INTO SDO_DOCUMUTUAL(DO_SINIESTRO, DO_ORDEN, DO_RECAIDA, DO_NUMERO, DO_MODULO, DO_DOCUMENTO,' +
                                  ' DO_FECHAALTA, DO_FECHAIMPRESION, DO_FECHARECEPCION, DO_OBSERVACIONES, DO_FIRMA,' +
                                  ' DO_DESTINATARIO, DO_PRESTADOR, DO_USUALTA, DO_CONTRATO)' +
                           ' SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, 0, ''E'', ''019'', ACTUALDATE, NULL, NULL,' +
                                  ' NULL, NULL, ''P'', EX_PRESTADOR, ' + SqlString(Sesion.UserId, True) +
                                 ', NULL' +
                             ' FROM CPR_PRESTADOR, SEX_EXPEDIENTES, CDG_DIAGNOSTICO, SSA_SINIESTROSSINALTA' +
                            ' WHERE DG_CODIGO = EX_DIAGNOSTICOOMS' +
                              ' AND (SA_FECHACONTROL <= (ACTUALDATE - DG_DIAS_EVOL) OR SA_FECHACONTROL IS NULL)' +
                              ' AND SA_ESTADO = ''V''' +
                              ' AND NOT EXISTS (SELECT 1' +
                                                ' FROM SDO_DOCUMUTUAL B' +
                                               ' WHERE B.DO_SINIESTRO = SA_SINIESTRO' +
                                                 ' AND B.DO_ORDEN = SA_ORDEN' +
                                                 ' AND B.DO_RECAIDA = SA_RECAIDA' +
                                                 ' AND B.DO_DOCUMENTO = ''019'')' +
                              ' AND EX_SINIESTRO = SA_SINIESTRO' +
                              ' AND EX_ORDEN = SA_ORDEN' +
                              ' AND EX_RECAIDA = SA_RECAIDA' +
                              ' AND EX_PRESTADOR = CA_IDENTIFICADOR' +
                              ' AND CA_CLAVE <> ''' + TXT_EMP_CUIT + '''' +
                              ' AND SA_SINIESTRO = ' + SqlInt(sdqDatos.FieldByName('EX_SINIESTRO').AsInteger) +
                              ' AND SA_ORDEN = ' + SqlInt(sdqDatos.FieldByName('EX_ORDEN').AsInteger) +
                              ' AND SA_RECAIDA = ' + SqlInt(sdqDatos.FieldByName('EX_RECAIDA').AsInteger);
        EjecutarSqlST( sSql );

        {-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }

        sdqDatos.Next;
    end;
    CommitTrans;
  except
    on E: Exception do
    begin
      ErrorMsg(E);
      Rollback;
    end;
  end;
end;

procedure TfrmListSiniSinAltaMed.dbgDatosCellClick(Column: TColumn);
begin
  if (sdqDatos.Active) and (not sdqDatos.IsEmpty) and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqDatos.FieldByName('ex_id').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqDatos.FieldByName('ex_id').AsString))
    else
      FRegistrosSeleccionados.Add(sdqDatos.FieldByName('ex_id').AsString);
    dbgDatos.Repaint;
  end;
end;

procedure TfrmListSiniSinAltaMed.dbgDatosContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Item: TMenuItem;
  MenuGrilla: TPopUpMenu;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if (sdqDatos.Active) and (not sdqDatos.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(dbgDatos.ClientToScreen(MousePos).X , dbgDatos.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmListSiniSinAltaMed.dbgDatosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                        Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    dbgDatos.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqDatos.FieldByName('ex_id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dbgDatos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmListSiniSinAltaMed.dbgDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    dbgDatosCellClick(dbgDatos.ColumnByField['CHECKBOX']);
end;

procedure TfrmListSiniSinAltaMed.btnDesmarcarTodos(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  dbgDatos.Repaint;
end;

procedure TfrmListSiniSinAltaMed.btnMarcarTodos(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqDatos.AfterScroll;
  sdqDatos.AfterScroll := nil;
  APointer := sdqDatos.GetBookmark;

  FRegistrosSeleccionados.Clear;

  with sdqDatos do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(FieldByName('ex_id').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
  end;
end;

procedure TfrmListSiniSinAltaMed.FormDestroy(Sender: TObject);
begin
  FRegistrosSeleccionados.Free;
end;

procedure TfrmListSiniSinAltaMed.tbSolicitarAuditoriaClick(Sender: TObject);
var
  aLista: TStringList;
  aMetodo: TDataSetNotifyEvent;
  aPointer: TBookMark;
  sSqlInsert: String;
begin
  Verificar((FRegistrosSeleccionados.Count = 0), dbgDatos, 'No ha seleccionado ningún registro.');

  aLista := TStringList.Create;
  aMetodo := sdqDatos.AfterScroll;
  sdqDatos.AfterScroll := nil;
  aPointer := sdqDatos.GetBookmark;

  with sdqDatos do
  try
    DisableControls;
    First;

    BeginTrans;
    while not Eof do
    begin
      if FRegistrosSeleccionados.IndexOf(FieldByName('ex_id').AsString) > -1 then
      begin
        sSqlInsert :=
          'DECLARE' +
            ' idprestador number;' +
         ' BEGIN' +
            ' idprestador := ' + SqlValue(FieldByName('ex_prestador').AsInteger) + ';' +
            ' art.siniestro.do_generarevolutivo(NULL, :idexpediente, idprestador, :diagnostico, :iddg, 1, ACTUALDATE,' +
                                              ' ACTUALDATE, NULL,' +
                                              ' ''SE SOLICITA AUDITORÍA PARA ACTUALIZACIÓN DEL CASO.'', NULL, NULL,' +
                                              ' NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''O'', :usuario,' +
                                              ' ''REDPRES'', ''S'');' +
         ' END;';

        EjecutarSqlSTEx(sSqlInsert, [FieldByName('ex_id').AsInteger, FieldByName('ex_diagnostico').AsString,
                                     FieldByName('dg_id').AsInteger, Sesion.UserID]);
      end;

      Next;
    end;
    CommitTrans;

    MsgBox('La operación se llevó a cabo de manera exitosa.');
  finally
    aLista.Free;
    AfterScroll := aMetodo;
    GotoBookmark(APointer);
    EnableControls;
  end;
end;

end.
