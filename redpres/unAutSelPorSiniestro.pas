unit unAutSelPorSiniestro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ImgList, ComCtrls, ToolWin,
  ExtCtrls, Grids, DBGrids, Menus, Placemnt, Db, SDEngine, General, RXDBCtrl, Buttons, Mask, ToolEdit, ArtComboBox,
  unFraTrabajadorSIN, AnsiSql, SinEdit, QueryPrint, QueryToFile, SortDlg, artSeguridad, ShortCutControl, IntEdit,
  unfraPrestador, FormPanel, ExportDialog, PatternEdit, unfraNomenclador, ArtDBGrid, unArtFrame, unFraCodigoDescripcion,
  unFraCodDesc, DateComboBox, CurrEdit, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unCustomForm, XPMenu, unfraCtbTablas, unfraDelegacion, Variants, unArtDbFrame,
  unFraGrupoTrabajo, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TDatosAuditoria = record
    Estado: String[1];
    Diagnostico: String[10];
    Gravedad: String[10];
    Porcentaje: Double;
    Fecha: TDate;
    MotivoRechazo: String[2];
    Observaciones: String[250];
    Justificacion: String[250];      // TK 34489
  end;

  TfrmAutSelPorSiniestro = class(TfrmCustomForm)
    pnlHerramientas: TPanel;
    lbSiniestro: TLabel;
    pmnuOrden: TPopupMenu;
    mnuOrdenEstado: TMenuItem;
    mnuOrdenFSolicitud: TMenuItem;
    mnuOrdenPrestador: TMenuItem;
    FormPlacement: TFormPlacement;
    sdqBusqueda: TSDQuery;
    dsBusqueda: TDataSource;
    dbgBusqueda: TARTDBGrid;
    mnuOrdenGTrabajo: TMenuItem;
    Label1: TLabel;
    btnBusqSiniestro: TSpeedButton;
    dsGTrabajo: TDataSource;
    mnuOrdenPrestacion: TMenuItem;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    SinEdit: TSinEdit;
    Autorizacin1: TMenuItem;
    QueryPrint: TQueryPrint;
    SortDialog: TSortDialog;
    Seguridad: TSeguridad;
    ShortCutControl: TShortCutControl;
    fpCambPrestador: TFormPanel;
    GroupBox1: TGroupBox;
    fraPrestadorCamb: TfraPrestador;
    btnCamPrestCancelar: TButton;
    btnCamPrestAceptar: TButton;
    ExportDialog: TExportDialog;
    fpCambGTrabajo: TFormPanel;
    Label2: TLabel;
    Bevel1: TBevel;
    btnCambGTrabAceptar: TButton;
    btnCambGTrabCancelar: TButton;
    pmnuCambios: TPopupMenu;
    mnuCambiarPrestador: TMenuItem;
    mnuCambiarGTrabajo: TMenuItem;
    PrintDialog: TPrintDialog;
    TimerConfidencial: TTimer;
    lbPrestacion: TLabel;
    fraNomencladorCamb: TfraNomenclador;
    fpDatosAnulacion: TFormPanel;
    Bevel2: TBevel;
    Label12: TLabel;
    btnAceptarAnulacion: TButton;
    btnCancelarAnulacion: TButton;
    edObservacionesAnulacion: TMemo;
    fpAuditoria: TFormPanel;
    Label3: TLabel;
    btnRechazarAuditoria: TButton;
    edObservacionesAuditoria: TMemo;
    btnCancelarAuditoria: TButton;
    btnAceptarAuditoria: TButton;
    Label7: TLabel;
    fpAnular: TFormPanel;
    Bevel3: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    btnAnuAceptar: TButton;
    btnAnuCancelar: TButton;
    edObservacionesAnu: TMemo;
    fraMotivoRechazo: TfraCtbTablas;
    gbEstimacion: TGroupBox;
    fraCIE10: TfraCodDesc;
    Label4: TLabel;
    cmbFECHA: TDateComboBox;
    edPorcentaje: TCurrencyEdit;
    Label6: TLabel;
    Label5: TLabel;
    fraDelegacionFiltro: TfraDelegacion;
    Label14: TLabel;
    pMenuViajar: TPopupMenu;
    mnuViajarParte: TMenuItem;
    mnuViajarAgenda: TMenuItem;
    fraGravedadCIE10: TfraCtbTablas;
    Label11: TLabel;
    gbPrestacion: TGroupBox;
    fraPrestadorAud: TfraPrestador;
    fraNomencladorAud: TfraNomenclador;
    lblPrestacionAud: TLabel;
    edSinAudit: TSinEdit;
    Label13: TLabel;
    fraMotivoAnulacion: TfraCodigoDescripcion;
    mnuViajarCalendario: TMenuItem;
    fraGrupoTrabajoSIN: TfraGrupoTrabajo;
    Panel1: TPanel;
    rbMedico: TRadioButton;
    RadioButton1: TRadioButton;
    CoolBar1: TCoolBar;
    tbarBotones: TToolBar;
    tbDetalle: TToolButton;
    tbAnular: TToolButton;
    ToolButton2: TToolButton;
    tbCambios: TToolButton;
    ToolButton4: TToolButton;
    tbLimpiar: TToolButton;
    tbRefrescar: TToolButton;
    tbOrden: TToolButton;
    ToolButton3: TToolButton;
    tbImprimir: TToolButton;
    tbGuardar: TToolButton;
    tbSep2: TToolButton;
    tbViajar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    tbPresupuestos: TToolButton;
    tbPresupuestoOrtopediaOK: TToolButton;
    tbAuditar: TToolButton;
    tbHistorial: TToolButton;
    ToolButton7: TToolButton;
    tbSalir: TToolButton;
    Label15: TLabel;
    edDetalleAud: TMemo;
    mnuCambiarKilometraje: TMenuItem;
    fpKilometrajeExcedente: TFormPanel;
    Label16: TLabel;
    Bevel4: TBevel;
    btnAgregarKmExcedente: TButton;
    btnCancelarKmExcedente: TButton;
    edKilometrajeExcedente: TCurrencyEdit;
    ceImporteMulta: TCurrencyEdit;
    lblImporteMulta: TLabel;
    fraGrupoTrabajoAUT: TfraGrupoTrabajo;
    Label8: TLabel;
    fraGrupoTrabajoCambio: TfraGrupoTrabajo;
    fpJustificaMultiplesPrestac: TFormPanel;
    Bevel5: TBevel;
    btnAceptarJustifica: TButton;
    MemoJustificacion: TMemo;
    tbSIC: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure tbBuscSiniestroClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure mnuOrdenClick(Sender: TObject);
    procedure tbDetalleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbAnularClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure dbgBusquedaGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbCambiosClick(Sender: TObject);
    procedure mnuCambiarPrestadorClick(Sender: TObject);
    procedure mnuCambiarGTrabajoClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure fraTrabajadorSINdbcTrabNombreCloseUp(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure tbPresupuestosClick(Sender: TObject);
    procedure TimerConfidencialTimer(Sender: TObject);
    procedure OnPrestadorChange(Sender: TObject);
    procedure fpCambPrestadorEnter(Sender: TObject);
    procedure btnCamPrestAceptarClick(Sender: TObject);
    procedure btnAceptarAnulacionClick(Sender: TObject);
    procedure btnCancelarAnulacionClick(Sender: TObject);
    procedure fpDatosAnulacionEnter(Sender: TObject);
    procedure tbAuditarClick(Sender: TObject);
    procedure SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
    procedure SeguridadBeforeExecute(Sender: TObject);
    procedure sdqBusquedaAfterScroll(DataSet: TDataSet);
    procedure sdqBusquedaAfterClose(DataSet: TDataSet);
    procedure tbPresupuestoOrtopediaOKClick(Sender: TObject);
    procedure AceptarRechazarAuditoria(Sender: TObject);
    procedure fpAuditoriaBeforeShow(Sender: TObject);
    procedure btnCancelarAuditoriaClick(Sender: TObject);
    procedure btnAnuAceptarClick(Sender: TObject);
    procedure btnAnuCancelarClick(Sender: TObject);
    procedure fpAnularBeforeShow(Sender: TObject);
    procedure mnuViajarParteClick(Sender: TObject);
    procedure mnuViajarAgendaClick(Sender: TObject);
    procedure tbHistorialClick(Sender: TObject);
    procedure fpAuditoriaEnter(Sender: TObject);
    procedure mnuViajarCalendarioClick(Sender: TObject);
    procedure mnuCambiarKilometrajeClick(Sender: TObject);
    procedure fraMotivoAnulacion_onChange(Sender: TObject);
    procedure btnAceptarJustificaClick(Sender: TObject);
    procedure fpJustificaMultiplesPrestacBeforeShow(Sender: TObject);
    procedure pMenuViajarPopup(Sender: TObject);
    procedure tbSICClick(Sender: TObject);
  private
    bAllowAuditoria: Boolean;
    DatosAuditoria: TDatosAuditoria;
    iLenAU_OBSERVACIONES: Integer;
    PrestoacionAudObligatoria: Boolean;
    PrestoacionObligatoria: Boolean;

    function GetImportePrestacion: Double;
    function HayRegistroActivo: Boolean;
    function PrestacionExigeMod(sCodPres: String): Boolean;
    function Es_TipoPrestacionPermitida_Auditar: Boolean;   // Plan - SML
    procedure GenerarPresupuesto;
    procedure EnviarMailPresupuesto(iIdPresup: integer);

    procedure AnularAutorizacion;
    procedure Internal_RefreshAndRelocate;
    function TieneDX(AIdAuto: Integer): Boolean;
    procedure Do_EvaluarModifMaterial;  // TK 19542
  public
  end;

const
  TIPOPREST_PROTESIS = '129100';  // TK 19542

var
  frmAutSelPorSiniestro: TfrmAutSelPorSiniestro;

implementation

uses
  unCostosxSiniestro, unBusqSini, unAutAprob, unDmPrincipal, unPrincipal, Registros,
  CustomDlgs, unParteEvolutivo, unPresupuestos, unConfidencial, unSesion, unRedPres,
  unAgendaProtocolo, Strfuncs, unCalendarioPrestacional, uncomunes, unMoldeEnvioMail,
  unTercerizadoras, unSiniestros, unfraSubPrestacion, unRptRegRehabNuevo, unrptFKTNuevo,
  unrptFonoaudNuevo, unrptMatOrtNuevo, UnRptPedidoEntregaNuevo, UnRptInvestAdmNuevo,
  unRptTrasladosPlataforma, UnRepTraslados, unRptNotaAprobacion, sqlfuncs, archfuncs, unRptSolicitudPresupuesto,
  unGIS, VCLExtra, unAgendaVistaExpediente;

var
  BaseSql: String =
    'SELECT au_siniestro, au_orden, au_recaida, au_numauto, au_fechasoli, au_nropedido, au_subapro,' +
          ' au_identifprestador, au_identifapro, au_presapro, ca_descripcion prestador, ca_fechabaja,' +
          ' pr_codigo, pr_descripcion prestacion, au_trabajo, a.gp_nombre grupo_t, nvl(au_cantapro, au_cantidad) cantidad,' +
          ' iif_char(au_estado, ''P'', au_observaciones, ' +
          ' iif_char(au_estado, ''T'', au_observaciones, au_detalle)) observaciones, fi_firmante, au_usuapro,' +
          ' au_fechapro, au_estado, e.tb_descripcion estado, nvl(au_impoapro, au_importe ) importe, pr_formulario,' +
          ' ex_cuit, ex_diagnosticooms, ex_gravedadcie10, au_diagnosticooms, au_accionauditoria, au_porcincapacidad,' +
          ' inca.get_incaauto(ex_siniestro, ex_orden, ex_recaida) as ultima_estimacion, au_observaciones,' +
          ' au_fechaauditoria, au_fechahabilitacion, au_fechaimpresion, au_fechamail, au_cantrealizadas,' +
          ' au_estadoverificacion, au_motivorechazo, au_motivoanulacion, au_pres_nomenclador, au_pres_capitulo,' +
          ' au_pres_codigo, pr_codigo, au_id, au_idstock,  nvl(mt_descripcion, m.tb_descripcion) motivoanul, ' +
          ' siniestro.get_usuariogestor(ex_id) usugestor, au_pressol, au_idexpediente, ' +
          ' au_detalle, au_kmviaje, au_kmexcedente, au_kmbase, ((au_kmviaje + au_kmbase) * %s) + NVL(au_kmexcedente, 0) as kilometraje, ' +
          ' au_usuauditoria, au_usuanulacion, au_fechaanulacion, ' +
          ' ca_direlectronica, art.utiles.armar_siniestro(au_siniestro, au_orden, au_recaida) Siniestro, ' +
          ' tj_nombre, tj_documento, au_fechaenvioanul, pr_presupuestos, nvl(au_presapro, au_pressol) prest, ' +
          ' s.gp_codigo codgruposin, s.gp_nombre nombregruposin, au_justificaMultPrestaciones, pr_notificaprestadorpend, ' +
          ' ex_gtrabajo, au_detalleapro, pr_presupautomatico ' +
     ' FROM art.ctb_tablas e, cfi_firma, art.cpr_prestador, mpr_prestaciones, ' +
          ' mgp_gtrabajo a, art.sex_expedientes, art.sau_autorizaciones, art.ctb_tablas m, ' +
          ' smt_motanultraslados, ctj_trabajador, art.mgp_gtrabajo s ' +
    ' WHERE au_identifprestador = ca_identificador(+)' +
      ' AND iif_char(au_estado, ''P'', au_pressol, nvl(au_presapro, au_pressol)) = pr_codigo(+)' +
      ' AND au_trabajo = a.gp_codigo(+)' +
      ' AND e.tb_clave(+) = ''MUAUT''' +
      ' AND e.tb_codigo(+) = au_estado' +

      ' AND ex_id = au_idexpediente ' +      // optimizando por ticket 44992

     { ' AND ex_siniestro = au_siniestro' +
      ' AND ex_orden = au_orden' +
      ' AND ex_recaida = au_recaida' +   }  // optimizando por ticket 44992

      ' AND au_aval = fi_id(+)' +
      ' AND m.tb_clave(+) = ''MOTAN''' +
      ' AND m.tb_codigo(+) = au_motivoanulacion' +
      ' AND mt_codigo(+) = au_motivoanulacion' +
      ' AND tj_id = ex_idtrabajador ' +
      ' AND ex_gtrabajo = s.gp_codigo ' ;
    //  ' AND s.gp_fbaja is null ';  // optimizando por ticket 44992

{$R *.DFM}

procedure TfrmAutSelPorSiniestro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetRegFromValue(Self, 'Orden', IntToStr(tbOrden.Tag));
  inherited;
  frmAutSelPorSiniestro := nil;
end;

procedure TfrmAutSelPorSiniestro.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAutSelPorSiniestro.tbSICClick(Sender: TObject);
begin
  Verificar(not HayRegistroActivo, SinEdit, 'Debe seleccionar un siniestro para acceder al SIC desde aquí.');
  DoMostrarEventosAgendaExpediente(fraTrabajadorSIN.IdExpediente);
end;

procedure TfrmAutSelPorSiniestro.tbBuscSiniestroClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    dlgBusqSini.Siniestro := SinEdit.Siniestro;
    dlgBusqSini.Orden     := SinEdit.Orden;
    dlgBusqSini.Recaida   := SinEdit.Recaida;
    dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraTrabajadorSIN.mskTrabCUIL.Text;
    dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraTrabajadorSIN.dbcTrabNombre.Text;
    //-----------------------------------------------------
    if (dlgBusqSini.ShowModal = mrOk) then
    begin
      with dlgBusqSini do
        SinEdit.SetValues(Siniestro, Orden, Recaida);
      //-----------------------------------------------------
      fraTrabajadorSIN.mskTrabCUIL.Text   := dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text;
      fraTrabajadorSIN.dbcTrabNombre.Text := dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text;
      fraTrabajadorSIN.SetColors( clWindowText ); // Siempre va a ser negro porque no deja cargar Causafin 99 y 95
      //-----------------------------------------------------
      tbRefrescarClick(nil);
      SinEditSelect(nil);
    end;
  finally
    dlgBusqSini.Free;
  end;
end;

procedure TfrmAutSelPorSiniestro.tbRefrescarClick(Sender: TObject);
var
  Sql: String;
begin
  //------[ Arma la Consulta Sql ]----------------------------------------------//
  Sql := BaseSql;
  if SinEdit.Siniestro > 0 then
    Sql := Sql + ' AND au_siniestro = ' + SinEdit.SiniestroSql +
                 ' AND au_orden = ' + SinEdit.OrdenSql +
                 ' AND au_recaida = ' + SinEdit.RecaidaSql;

  if fraGrupoTrabajoSIN.IsSelected or fraGrupoTrabajoAUT.IsSelected then
  begin
    if fraGrupoTrabajoAUT.IsSelected then
      Sql := Sql + ' AND au_trabajo = ' + SqlValue(fraGrupoTrabajoAUT.Codigo) +
                   ' AND au_estado IN (''P'', ''T'')';

    if fraGrupoTrabajoSIN.IsSelected then
      Sql := Sql + ' AND NVL(s.gp_codigo, '' '') = ' + SqlValue(fraGrupoTrabajoSIN.Codigo) +
                   ' AND au_estado IN (''P'', ''T'')';

    if fraGrupoTrabajoSIN.cmbGestor.Text <> '' then
      Sql := Sql + ' AND ex_gestor = ' + SqlValue(fraGrupoTrabajoSIN.cmbGestor.Text);  // puse el ex_gestor ya que es mas rapido e igualmente se accede a la sex_expedientes (Optimizando por ticket 44992).

    if rbMedico.Checked then
      Sql := Sql + ' AND au_fechaauditoria IS NULL ' +
                   ' AND art.siniestro.get_autorizacionexigeaudit(au_id) = ''S'' '
    else
      Sql := Sql + ' AND ((au_fechaauditoria IS NOT NULL) ' +
                     ' OR (art.siniestro.get_autorizacionexigeaudit(au_id) = ''N'')) ';
  end;

  if not fraDelegacionFiltro.IsEmpty then
    Sql := Sql + ' AND ex_delegacion = ' + SqlValue(fraDelegacionFiltro.Value);  // puse el SqlValue ya que ex_delegacion es Varchar2 (Optimizando por ticket 44992).

  if (fraTrabajadorSIN.mskTrabCUIL.Text <> '') and (SinEdit.Siniestro = 0) then
    Sql := Sql + ' AND ex_cuil = ''' + fraTrabajadorSIN.mskTrabCUIL.Text + ''''
  else if SinEdit.Siniestro > 0 then
  begin
    fraTrabajadorSIN.OnChange := nil;
    fraTrabajadorSIN.Cargar(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
    fraTrabajadorSIN.OnChange := tbRefrescarClick;
  end;

  if EsUsuarioDeTercerizadora then               // por Plan Ioma - Tercerizadoras
    Sql := Sql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

  if Is_UsuarioSML(Sesion.UserID) then   // Plan - SML
    Sql := Sql + ' AND art.siniestro.get_siniestrosml(ex_id) = ''S'' ';

  //------[ Ejecuta la Consulta ]-----------------------------------------------//
  if Sql <> BaseSql then
  begin
    Sql := Sql + ' ORDER BY '  + Switch(tbOrden.Tag, ['AU_ESTADO', 'AU_FECHASOLI', 'AU_IDENTIFPRESTADOR',
                                                      'AU_TRABAJO', 'AU_PRESSOL', 'AU_NUMAUTO']);
    OpenQuery(sdqBusqueda, Sql);
    MostrarEstado('Cantidad de autorizaciones: ' + IntToStr(sdqBusqueda.RecordCount));
    if SinEdit.Siniestro > 0 then
      HabilitarTituloConfidencial(Self, TimerConfidencial, sdqBusqueda.FieldByName('EX_CUIT').AsString);  { by NWK, 27/03/03 }
  end;
end;

procedure TfrmAutSelPorSiniestro.SinEditSelect(Sender: TObject);
var
  sSql, sMens: String;
begin
  sMens := Get_ExisteSiniestro(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida,
                               fraTrabajadorSIN.Tercerizadoras);
  if (sMens <> '') then
  begin
    InfoHint(SinEdit, sMens);
    tbLimpiarClick(nil);
  end
  else if (not Validar_SML(Sesion.UserID, Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)))    // Plan - SML
       or (not ValidarSiniestroUsuarioTerce(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then               // por plan Ioma - Tercerizadoras
  begin
    InfoHint(SinEdit, 'Usted no posee permisos para visualizar este siniestro.');
    tbLimpiarClick(nil);
  end
  else begin
    sSql := 'SELECT ex_causafin ' +
             ' FROM sex_expedientes ' +
            ' WHERE ex_siniestro = :sin ' +
              ' AND ex_orden = :ord ' +
              ' AND ex_recaida = :reca';
    if AreIn(ValorSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]),  ['99', '95']) then
    begin
      InfoHint(SinEdit, 'El siniestro seleccionado ha sido cerrado por error de carga.');
      tbLimpiarClick(nil);
    end
    else
      tbRefrescarClick(nil);
  end;
end;

procedure TfrmAutSelPorSiniestro.mnuOrdenClick(Sender: TObject);
begin
  if Sender is TMenuItem then
    tbOrden.Tag := TMenuItem(Sender).Tag;
  tbRefrescarClick(nil);
end;

function TfrmAutSelPorSiniestro.TieneDX(AIdAuto: Integer): Boolean;
begin
  Result := ExisteSQLEx('SELECT 1 ' +
                          'FROM art.sex_expedientes, art.sau_autorizaciones, art.cdg_diagnostico ' +
                         'WHERE au_id = :pidauto ' +
                           'AND au_siniestro = ex_siniestro ' +
                           'AND au_orden = ex_orden ' +
                           'AND au_recaida = ex_recaida ' +
                           'AND ex_diagnosticooms = dg_codigo ', [AIdAuto]);
end;

procedure TfrmAutSelPorSiniestro.tbDetalleClick(Sender: TObject);
var
  frmAutAprob: TfrmAutAprob;
begin
  if not sdqBusqueda.IsEmpty then
  begin
    Verificar(not TieneDX(sdqBusqueda.FieldByName('AU_ID').AsInteger), nil,
              'El siniestro aún no tiene diagnóstico, debe completarlo para acceder a la aprobación de esta autorización.');

    try
      try
        frmAutAprob := TfrmAutAprob.Create(Self);
      except
        on E: Exception do
        begin
          frmAutAprob.Free;
          frmAutAprob := TfrmAutAprob.Create(nil);
        end;
      end;
      frmAutAprob.IsOrtopedia := (sdqBusqueda.FieldByName('PR_FORMULARIO').AsString = 'P');
      frmAutAprob.CargarAutorizacion(sdqBusqueda.FieldByName('AU_ID').AsInteger);
      if frmAutAprob.ShowModal = mrOk then
        Internal_RefreshAndRelocate;

    finally
      freeandnil(frmAutAprob);
    end;
  end;
end;

procedure TfrmAutSelPorSiniestro.FormCreate(Sender: TObject);
begin
  inherited;
  BaseSQL := Format(BaseSQL, [StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', [])]);
  iLenAU_OBSERVACIONES := ValorSqlInteger('SELECT DATA_LENGTH' +
                                           ' FROM SYS.ALL_TAB_COLUMNS ' +
                                          ' WHERE OWNER = ''ART''' +
                                            ' AND TABLE_NAME = ''SAU_AUTORIZACIONES''' +
                                            ' AND COLUMN_NAME = ''AU_OBSERVACIONES''', 250);
  tbOrden.Tag := StrToInt(GetRegFromValue(Self, 'Orden','0'));
  edObservacionesAuditoria.Lines.Clear;
  fraMotivoRechazo.Limpiar;
  fraMotivoRechazo.Clave           := 'MOTR';
  fraMotivoRechazo.ShowBajas       := False;
  fraGravedadCIE10.Clave           := 'GRAVC';
  fraGravedadCIE10.ShowBajas       := False;
  fraNomencladorAud.ShowPresup     := True;
  fraNomencladorAud.ShowConsumidos := True;
  fraNomencladorAud.ShowAbonos     := False;
  fraTrabajadorSIN.Tercerizadoras  := EsUsuarioDeTercerizadora;
  fraMotivoAnulacion.OnChange      := fraMotivoAnulacion_onChange;
  fraGrupoTrabajoAUT.VerGestor     := False;
  fraGrupoTrabajoCambio.VerGestor  := False;
  VCLExtra.LockControls(ceImporteMulta, true);
end;

procedure TfrmAutSelPorSiniestro.fraMotivoAnulacion_onChange(Sender: TObject);
begin
  if (fraMotivoAnulacion.Value = '15') then
    VCLExtra.LockControls(ceImporteMulta, false)
  else
    VCLExtra.LockControls(ceImporteMulta, true);
end;

procedure TfrmAutSelPorSiniestro.tbLimpiarClick(Sender: TObject);
begin
  SinEdit.Clear;
  fraGrupoTrabajoSIN.Clear;
  fraGrupoTrabajoAUT.Clear;
  sdqBusqueda.Close;
  fraTrabajadorSIN.Limpiar;
  rbMedico.Checked := True;
  fraDelegacionFiltro.Clear;
  HabilitarTituloConfidencial(Self, TimerConfidencial, '');
  MostrarEstado('');
  SinEdit.SetFocus;
end;

procedure TfrmAutSelPorSiniestro.tbAnularClick(Sender: TObject);
begin
  AnularAutorizacion;
end;

procedure TfrmAutSelPorSiniestro.AnularAutorizacion;
var
  iIdAuto, iNumAutoDeriv, iNumAuto, iOrden, iRecaida, iSiniestro, IdStock: Integer;
  sEstado: Char;
  sEstadoAct, sObservaciones, sSql, cValidaAnulacion: string;
  FKT: TrptFKTNuevo;
  Fonoaud: TrptFonoaudNuevo;
  RegRehab: TrptRegRehabNuevo;
  MatOrt: TrptMatOrtNuevo;
  PedidoEntrega: TrptPedidoEntregaNuevo;
  InvestAdmin: TrptInvestAdminNueva;
  TrasPlataforma: TrptTrasladosPlataforma;
  Traslados: TrptTraslados;
  NotaAprobacion: TrptNotaAprobacion;
  tieneTraslados: boolean;
begin
  if sdqBusqueda.RecordCount > 0 then
  begin

    iSiniestro   := sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger;
    iOrden       := sdqBusqueda.FieldByName('AU_ORDEN').AsInteger;
    iRecaida     := sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger;
    iNumAuto     := sdqBusqueda.FieldByName('AU_NUMAUTO').AsInteger;
    iIdAuto      := sdqBusqueda.FieldByName('AU_ID').AsInteger;
    sEstadoAct   := sdqBusqueda.FieldByName('AU_ESTADO').AsString;
    iNumAutoDeriv := 0;
    IdStock      := sdqbusqueda.FieldByName('au_idstock').AsInteger;

    verificar(not esUsuarioRecaAutoReca(iIdAuto), tbAnular, 'Usted no puede realizar esta acción debido a que no pertenece al sector Recalificación');

    tieneTraslados := ExisteSqlEx('SELECT au_tdesde ' +
                                   ' FROM sau_autorizaciones ' +
                                  ' WHERE au_siniestro = :sin ' +
                                    ' AND au_orden = :ord ' +
                                    ' AND au_recaida = :rec ' +
                                    ' AND au_numauto = :auto', [iSiniestro, iOrden, iRecaida, iNumAuto]);

    {Si se anula un aprobado que depende de un derivado, al primero se le cambia de
     estado a: "Derivado Anulado", au_estado:"V", aquí tomo el au_numautoderiv. by Lu 23/01/2001}
    if AreIn(sEstadoAct,  ['A', 'E']) then
      iNumAutoDeriv := ValorSqlInteger('SELECT au_numautoderiv' +              // estaba mal, lo arregle (Lu 17/09/2010)
                                        ' FROM sau_autorizaciones' +
                                       ' WHERE au_id = ' + SqlInt(iIdAuto));

    cValidaAnulacion:= valorsqlEX('SELECT pr_validaanulacion ' +
                                  'FROM art.sau_autorizaciones, mpr_prestaciones ' +
                                  'WHERE NVL(au_presapro, au_pressol) = pr_codigo ' +
                                  ' AND au_siniestro = :sin ' +
                                  ' AND au_orden = :ord ' +
                                  ' AND au_recaida = :rec ' +
                                  ' AND au_numauto = :naut', [iSiniestro, iOrden, iRecaida ,iNumAuto]);

    verificar((cValidaAnulacion = 'S') and (Seguridad.Claves.IsActive('ANULAR_SECTORINSUMOS') = false), tbAnular,
              'Esta autorización solo puede ser anulada por usuarios del sector Insumos');


    if Seguridad.Claves.IsActive('ANULAR_NO_APROBADAS') and AreIn(sEstadoAct, ['T', 'P']) then
      sEstado := 'N'
    else if Seguridad.Claves.IsActive('ANULAR_APROBADAS') and AreIn(sEstadoAct, ['A', 'E']) then
      sEstado := 'U'
    else
    begin
      MsgBox('La opción no está Habilitada para el Usuario o la Autorizacion seleccionada no se encuentra en el Estado Correcto.', MB_ICONEXCLAMATION);
      Exit;
    end;       

    if not AreIn(sEstadoAct, ['T', 'P']) then
    begin
      btnAceptarAnulacion.OnClick        := btnAceptarAnulacionClick;
      btnAceptarAnulacion.ModalResult    := mrNone;
      edObservacionesAnulacion.MaxLength := iLenAU_OBSERVACIONES;
      edObservacionesAnulacion.ReadOnly  := False;
    end;

    sObservaciones := '';
    if fpAnular.ShowModal = mrOk then
      sObservaciones := Trim(edObservacionesAnu.Lines.Text)
    else
      Exit;

    try
      BeginTrans;
      //------------------------------------------------------------------------------------------
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_estado = ' + SqlValue(sEstado) + ',' +
              ' au_impoapro = 0,' +
                IIF(sObservaciones = '', '', ' au_observaciones = ' + SqlValue(sObservaciones) + ',') +
              ' au_fechamodif = trunc(sysdate),' +
              ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
              ' au_motivoanulacion = ' + SqlValue(fraMotivoAnulacion.Codigo) + ',' +
              ' au_fechaanulacion = trunc(sysdate), ' +              // TK 21531
              ' au_usuanulacion = ' + SqlValue(Sesion.UserID) + ',' +
              ' au_importemulta = ' + sqlvalue(ceImporteMulta.Value) +
        ' WHERE au_id = ' + SqlInt(iIdAuto);
      EjecutarSqlST(sSql);
      //------------------------------------------------------------------------------------------
      if (iNumAutoDeriv > 0) then
      begin
        sSql :=
          'UPDATE sau_autorizaciones' +
            ' SET au_estado = ''V'',' +
                  IIF(sObservaciones = '', '', ' AU_OBSERVACIONES = ' + SqlValue(sObservaciones) + ',') +
                ' au_fechamodif = actualdate,' +
                ' au_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                ' au_fechaanulacion = trunc(sysdate), ' +             // TK 21531
                ' au_usuanulacion = ' + SqlValue(Sesion.UserID) + ',' +
                ' au_importemulta = ' + sqlvalue(ceImporteMulta.Value) +
          ' WHERE au_siniestro = ' + SqlInt(iSiniestro) +
            ' AND au_orden = ' + SqlInt(iOrden) +
            ' AND au_recaida = ' + SqlInt(iRecaida) +
            ' AND au_numauto = ' + SqlInt(iNumAutoDeriv);             // estaba mal, lo arregle (Lu 17/09/2010)
        EjecutarSqlST(sSql);
      end;
      //------------------------------------------------------------------------------------------

      {Cuando estado = "En Tramite" y do_fecharecepcion es nula, hay que updatearla en la sdo_documutual. by Lu 11/07/01}
      if (sEstadoAct = 'T') then
      begin
        {Update de fechaRecepcion}
        sSql := 'UPDATE sdo_documutual ' +
                   ' SET do_fecharecepcion = Actualdate ' +
                 ' WHERE do_siniestro = ' + SqlInt(iSiniestro) +
                   ' AND do_orden = ' + SqlInt(iOrden) +
                   ' AND do_recaida = ' + SqlInt(iRecaida) +
                   ' AND do_numero = ' + SqlInt(iNumAuto) +
                   ' AND do_fecharecepcion IS NULL ';
         EjecutarSqlST(sSql);
         {Update de fechaImpresion}
         sSql := 'UPDATE sdo_documutual ' +
                   ' SET do_fechaimpresion = Actualdate ' + // Hago dos querys porque si pusiera este update arriba, me tomaria las dos condiciones con un 'and' y puedo llegar a pisar datos.
                  'WHERE do_siniestro = ' + SqlInt(iSiniestro) +
                   ' AND do_orden = ' + SqlInt(iOrden) +
                   ' AND do_recaida = ' + SqlInt(iRecaida) +
                   ' AND do_numero = ' + SqlInt(iNumAuto) +
                   ' AND do_fechaimpresion IS NULL ';
         EjecutarSqlST(sSql);
       end;

       if (sdqBusqueda.FieldByName('AU_IDSTOCK').AsInteger > 0) then
       begin
         sSql := 'UPDATE amed.mms_movim_stock ' +
                   ' SET ms_fechabaja = actualdate, ' +
                       ' ms_usubaja = ' + SqlValue(Sesion.UserID) +
                 ' WHERE ms_idstock = ' + SqlInt(sdqBusqueda.FieldByName('AU_IDSTOCK').AsInteger) +
                   ' AND ms_idautorizacion = ' + SqlInt(iIdAuto);
         EjecutarSqlST(sSql);
       end;

       CommitTrans;
       tbRefrescarClick(Nil);
     except
       on E:Exception do
       begin
         if InTransaction then Rollback;
         ErrorMsg(E);
       end;
     end;
     sdqBusqueda.Locate('au_id', iIdAuto, []);
     if not ((sEstadoAct = 'P') and (sdqBusqueda.FieldByName('PR_NOTIFICAPRESTADORPEND').AsString = 'N')) and      // TK 38563 Pregunto primero que no se cumpla esto, ya que si no se cumple, no hace la pregunta.
        msgask('Autorización anulada. Desea enviar el aviso al prestador?') = true then
       with sdqBusqueda.FieldByName('PR_FORMULARIO') do
       begin
         if AsString = 'F' then
         begin
           FKT := TrptFKTNuevo.Create(nil);
           try
             FKT.Imprimir(iIdAuto);
           except
             FKT.Free;
           end;

           RegRehab := TrptRegRehabNuevo.Create(nil);
           try
             RegRehab.Imprimir(iIdAuto);
           finally
             FKT.Free;
             RegRehab.Free;
           end;
         end
         else if (AsString = 'P') and (IdStock > 0) then
         begin
           MatOrt := TrptMatOrtNuevo.create(nil);
           try
             MatOrt.Imprimir(iIdAuto);
           finally
             MatOrt.Free;
           end;
         end
         else if (AsString = 'P') then // Pedido de Entrega
         begin
           PedidoEntrega := TrptPedidoEntregaNuevo.Create(nil);
           try
             PedidoEntrega.Imprimir(iIdAuto);
           finally
             PedidoEntrega.Free;
           end;
         end
         else if AsString = 'N' then  // Fonoaudiología
         begin
           Fonoaud := TrptFonoaudNuevo.Create(nil);
           try
             Fonoaud.Imprimir(iIdAuto);
           finally
             Fonoaud.Free;
           end;
         end
         else if AsString = 'I' then  // Investigaciones Administrativas
         begin
           InvestAdmin := TrptInvestAdminNueva.Create(nil);
           try
             InvestAdmin.Imprimir(iIdAuto);
           finally
             InvestAdmin.Free;
           end;
         end
         else if (AsString = 'T') and (tieneTraslados) and (EsPlataforma10(iif(sdqBusqueda.fieldbyname('au_presapro').AsString = '', sdqBusqueda.fieldbyname('au_pressol').AsString, sdqBusqueda.fieldbyname('au_presapro').AsString),
                 iif(sdqBusqueda.fieldbyname('au_identifapro').AsString = '', sdqBusqueda.fieldbyname('au_identifprestador').AsString, sdqBusqueda.fieldbyname('au_identifapro').AsString))) then
         begin
           TrasPlataforma := TrptTrasladosPlataforma.Create(nil);
           try
             TrasPlataforma.Imprimir(iIdAuto);
           finally
             TrasPlataforma.Free;
           end;
         end
         else if (AsString = 'T') and (tieneTraslados) then
         begin
           Traslados := TrptTraslados.create(nil);
           try
             Traslados.Imprimir(iIdAuto);
           finally
             Traslados.Free;
           end;
         end
         else
         begin
           NotaAprobacion := TrptNotaAprobacion.Create(nil);
           try
             NotaAprobacion.Imprimir(iIdAuto);
           finally
             NotaAprobacion.Free;
           end;
         end;
       end;
  end;
end;


{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbImprimirClick(Sender: TObject);
begin
   if PrintDialog.Execute then
   begin
      with QueryPrint.SubTitle.Lines do
      begin
        Clear;
        Add('Filtros:');
        if SinEdit.Siniestro > 0 then
            Add('    Siniestro ' + SinEdit.SiniestroS + ' - ' + SinEdit.OrdenS + ' - ' + SinEdit.RecaidaS);
        if fraGrupoTrabajoSIN.edCodigo.Text <> '' then
            Add('    G. Trabajo Sin. ' + fraGrupoTrabajoSIN.cmbDescripcion.Text);
        if fraGrupoTrabajoSIN.cmbGestor.Text <> '' then
            Add('    Usuario Gestor ' + fraGrupoTrabajoSIN.cmbGestor.Text);
        if fraTrabajadorSIN.mskTrabCUIL.Text <> '' then
            Add('    Trabajador ' + fraTrabajadorSIN.dbcTrabNombre.Text);
      end;
      QueryPrint.Footer.Text := Sesion.Usuario;
      QueryPrint.Print;
   end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.dbgBusquedaGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if (Field.FieldName = 'PRESTADOR') and (not sdqBusqueda.FieldByName('CA_FECHABAJA').IsNull) then
      AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbGuardarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbCambiosClick(Sender: TObject);
begin
  tbCambios.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.Internal_RefreshAndRelocate;
var
  A :Variant;
begin
  A := VarArrayCreate([0, 4], varVariant);
  A[0] := sdqBusqueda.FieldByName('AU_SINIESTRO').AsString;
  A[1] := sdqBusqueda.FieldByName('AU_ORDEN').AsString;
  A[2] := sdqBusqueda.FieldByName('AU_RECAIDA').AsString;
  A[3] := sdqBusqueda.FieldByName('AU_NUMAUTO').AsString;
  sdqBusqueda.Close;
  sdqBusqueda.Open;
  sdqBusqueda.Locate('AU_SINIESTRO;AU_ORDEN;AU_RECAIDA;AU_NUMAUTO', A,[]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.mnuCambiarPrestadorClick(Sender: TObject);
var
  Sql, sDerivada : String;
begin
  if sdqBusqueda.IsEmpty then
    MsgBox('Debe seleccionar datos para poder cambiar el prestador.', MB_ICONEXCLAMATION)
  else if not AreIn(sdqBusqueda.FieldByName('AU_ESTADO').AsString, ['A', 'E']) then
    MsgBox('Solo se puede cambiar el prestador de las autorizaciones en estado "Aprobada" o "Sin Evolución"', MB_ICONEXCLAMATION)
  else begin
    fraPrestadorCamb.Cargar(sdqBusqueda.FieldByName('AU_IDENTIFAPRO').AsInteger);

    if fpCambPrestador.ShowModal = mrOk then
    begin
      if (fraPrestadorCamb.IDPrestador <> sdqBusqueda.FieldByName('AU_IDENTIFAPRO').AsInteger) then
      begin
        try
          BeginTrans;
          //----------------------------------------------------------------------------------------
          Sql := 'UPDATE SAU_AUTORIZACIONES ' +
                    'SET AU_IDENTIFPRESTADOR = ' + SqlValue(fraPrestadorCamb.IDPrestador) + ', ' +
                        'AU_IDENTIFAPRO = ' + SqlValue(fraPrestadorCamb.IDPrestador) + ', ' +
                        'AU_PRES_NOMENCLADOR = ''' + fraNomencladorCamb.Nomenclador + ''', ' +
                        'AU_PRES_CAPITULO = ''' + fraNomencladorCamb.Capitulo + ''', ' +
                        'AU_PRES_CODIGO = ''' + fraNomencladorCamb.Codigo + ''', ' +
                        'AU_IMPOAPRO = ' + SqlNumber(GetImportePrestacion()) + ' ' +
                 ' WHERE AU_SINIESTRO = ' + sdqBusqueda.FieldByName('AU_SINIESTRO').AsString +
                   ' AND AU_RECAIDA = ' + sdqBusqueda.FieldByName('AU_RECAIDA').AsString +
                   ' AND AU_ORDEN = ' + sdqBusqueda.FieldByName('AU_ORDEN').AsString  +
                   ' AND AU_NUMAUTO = ' + sdqBusqueda.FieldByName('AU_NUMAUTO').AsString;
          EjecutarSqlST(Sql);
          //----------------------------------------------------------------------------------------
          Sql := 'SELECT AU_NUMAUTO ' +
                  ' FROM SAU_AUTORIZACIONES ' +
                 ' WHERE AU_SINIESTRO = ' + sdqBusqueda.FieldByName('AU_SINIESTRO').AsString +
                   ' AND AU_ORDEN = ' + sdqBusqueda.FieldByName('AU_ORDEN').AsString  +
                   ' AND AU_RECAIDA = ' + sdqBusqueda.FieldByName('AU_RECAIDA').AsString +
                   ' AND AU_NUMAUTO < ' + sdqBusqueda.FieldByName('AU_NUMAUTO').AsString +
                   ' AND AU_ESTADO = ''D'' ' +
                   ' AND AU_IDENTIFAPRO = ' + sdqBusqueda.FieldByName('AU_IDENTIFAPRO').AsString +
                   ' AND AU_PRESAPRO =  ''' + sdqBusqueda.FieldByName('AU_PRESAPRO').AsString + '''' +
                   ' AND AU_FECHAPRO =  ' + SqlDate(sdqBusqueda.FieldByName('AU_FECHAPRO').AsDateTime) +
                   ' AND AU_USUAPRO  = ''' + sdqBusqueda.FieldByName('AU_USUAPRO').AsString + '''';
          sDerivada := ValorSql(Sql);
          //----------------------------------------------------------------------------------------
          if (sDerivada <> '') then begin
             Sql := 'UPDATE SAU_AUTORIZACIONES ' +
                      ' SET AU_IDENTIFAPRO = ' + SqlValue(fraPrestadorCamb.IDPrestador) + ', ' +
                           'AU_PRES_NOMENCLADOR = ''' + fraNomencladorCamb.Nomenclador + ''', ' +
                           'AU_PRES_CAPITULO = ''' + fraNomencladorCamb.Capitulo + ''', ' +
                           'AU_PRES_CODIGO = ''' + fraNomencladorCamb.Codigo + ''' ' +
                    ' WHERE AU_SINIESTRO = ' + sdqBusqueda.FieldByName('AU_SINIESTRO').AsString +
                      ' AND AU_ORDEN = ' + sdqBusqueda.FieldByName('AU_ORDEN').AsString  +
                      ' AND AU_RECAIDA = ' + sdqBusqueda.FieldByName('AU_RECAIDA').AsString +
                      ' AND AU_NUMAUTO = ' + sDerivada;
             EjecutarSqlST(Sql);
          end;
          //----------------------------------------------------------------------------------------
          Sql := 'INSERT INTO SIART_AUDITLOG (MODULO, USUARIO, FECHA, OPCION, ACCION, OBS) ' +
                 ' VALUES (''REDPRES'' ,  ''' + Sesion.LoginName + ''', SYSDATE, ' +
                           '''APROBACION AUTORIZACIONES'', ''MODIFICACION'', ''"CAMB-PRESTADOR";"' +
                           sdqBusqueda.FieldByName('AU_SINIESTRO').AsString + '/' +
                           sdqBusqueda.FieldByName('AU_ORDEN').AsString + '/' +
                           sdqBusqueda.FieldByName('AU_RECAIDA').AsString + '/' +
                           sdqBusqueda.FieldByName('AU_NUMAUTO').AsString + '";"' +
                           sdqBusqueda.FieldByName('AU_IDENTIFAPRO').AsString + '"'')';
          EjecutarSqlST(Sql);
          //----------------------------------------------------------------------------------------
          CommitTrans;
          //----------------------------------------------------------------------------------------
          Internal_RefreshAndRelocate;
        except
          on E: Exception do
          begin
            if InTransaction then Rollback;
            ErrorMsg(E);
          end;
        end;
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.mnuCambiarGTrabajoClick(Sender: TObject);
var
  Sql :String;
begin
   if sdqBusqueda.IsEmpty then
      MsgBox('Debe seleccionar datos para poder cambiar el grupo de trabajo.', MB_ICONEXCLAMATION)
   else if not AreIn(sdqBusqueda.FieldByName('au_estado').AsString, ['P', 'T']) then
      MsgBox('Solo se puede cambiar grupos de trabajo de las autorizaciones en estado "Pendientes" o "En trámite"', MB_ICONEXCLAMATION)
   else begin
      fraGrupoTrabajoCambio.Codigo := sdqBusqueda.FieldByName('au_trabajo').AsString;
      if (fpCambGTrabajo.ShowModal = mrOk) and
         (fraGrupoTrabajoCambio.Codigo <> sdqBusqueda.FieldByName('au_trabajo').AsString) then
      begin
         Sql := ' UPDATE sau_autorizaciones ' +
                   ' SET au_trabajo = ' + SqlValue(fraGrupoTrabajoCambio.Codigo) +
                 ' WHERE au_siniestro = ' + SqlInt(sdqBusqueda.FieldByName('au_siniestro').AsInteger) +
                   ' AND au_orden = ' + SqlInt(sdqBusqueda.FieldByName('au_orden').AsInteger)  +
                   ' AND au_recaida = ' + SqlInt(sdqBusqueda.FieldByName('au_recaida').AsInteger) +
                   ' AND au_numauto = ' + SqlInt(sdqBusqueda.FieldByName('au_numauto').AsInteger);
         EjecutarSql(Sql);
         Internal_RefreshAndRelocate;
      end;
   end;
end;
{-------[Viaja de Autorizaciones a Parte Evolutivo]-----------------------------}
procedure TfrmAutSelPorSiniestro.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.fraTrabajadorSINdbcTrabNombreCloseUp(Sender: TObject);
begin
  fraTrabajadorSIN.dbcTrabNombreCloseUp(Sender);
  With fraTrabajadorSIN do
         SinEdit.SetValues(sdqTrabajadorEX_SINIESTRO.AsInteger,
                           sdqTrabajadorEX_ORDEN.AsInteger,
                           sdqTrabajadorEX_RECAIDA.AsInteger);
  tbRefrescarClick(Nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.ToolButton5Click(Sender: TObject);
var
   TmpFrm:TfrmCostosxSiniestro;
begin
  if frmprincipal.mnuCostosporSiniestro.enabled then
  begin
     if Sinedit.Siniestro >0 then
     begin
       TmpFrm:=TfrmCostosxSiniestro.Create(self);
       TmpFrm.edSOR.Siniestro:=Sinedit.Siniestro;
       TmpFrm.edSOR.Orden:=Sinedit.Orden;
       TmpFrm.edSOR.Recaida:=Sinedit.Recaida;
       TmpFrm.tbRefrescar.Click;
     end;
  end else self.close;
end;
{------------------------------------------------------------------------------}
{ by NWK, 05/03/03 }
procedure TfrmAutSelPorSiniestro.tbPresupuestosClick(Sender: TObject);
begin
  Verificar(sdqBusqueda.IsEmpty, dbgBusqueda, 'No se han cargado registros en la grilla.');
  Verificar((sdqBusqueda.FieldByName('PR_PRESUPUESTOS').AsString <> 'S'), nil,        // por Plan de Reca
            'El registro seleccionado no corresponde a una prestación de Presupuestos.');
  Verificar((sdqBusqueda.FieldByName('AU_ESTADO').AsString = 'P') and
            sdqBusqueda.FieldByName('AU_FECHAHABILITACION').IsNull and
            not Seguridad.Claves.IsActive('PRESUPUESTOS_NO_HABILITADOS'), nil,
            'La información sobre los presupuestos todavía no se encuentra disponible.');

  with TfrmPresupuestos.Create(Self) do
  try
    Siniestro    := sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger;
    Orden        := sdqBusqueda.FieldByName('AU_ORDEN').AsInteger;
    Recaida      := sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger;
    Autorizacion := sdqBusqueda.FieldByName('AU_NUMAUTO').AsInteger;
    ShowModal;
  finally
    free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.TimerConfidencialTimer(Sender: TObject);
begin
  Caption := GetTituloPantallaConfidencial(Caption, False);
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.fpCambPrestadorEnter(Sender: TObject);
begin
  PrestoacionObligatoria     := False;
  fraPrestadorCamb.OnChange  := OnPrestadorChange;
  fraNomencladorCamb.Limpiar;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.OnPrestadorChange(Sender: TObject);
var
  Sql: String;
begin
  fraNomencladorCamb.Prestador := fraPrestadorCamb.Value;
  Sql := 'SELECT 1 ' +
          ' FROM svp_valorprestador ' +
         ' WHERE vp_prestador=' + SqlValue(fraPrestadorCamb.Value) +
           ' AND (vp_vigenciahasta IS NULL OR actualdate<=vp_vigenciahasta) ' +
           ' AND vp_nomenclador = ''1'' ' +
           ' AND vp_capitulo NOT IN (''PP'', ''AB'') ' +
           ' AND vp_fechabaja IS NULL ';
  if ExisteSql(Sql) then
  begin
   lbPrestacion.Font.Color := clRed;
   PrestoacionObligatoria  := True;
  end
  else begin
   lbPrestacion.Font.Color := clWindowText;
   PrestoacionObligatoria  := False;
  end;
  fraNomencladorCamb.Limpiar;
end;
{------------------------------------------------------------------------------}
function TfrmAutSelPorSiniestro.GetImportePrestacion: Double;
var
  rCantidad, rImporte: Double;
  sSql :String;
begin
  if fraPrestadorCamb.IsEmpty then
  begin
    rImporte := 0
  end else
  begin
    with sdqBusqueda do
    begin
      rCantidad := FieldByName('CANTIDAD').AsFloat;
      sSql      := 'SELECT NVL(art.amebpba.get_val_prestacion(' + SqlValue(fraPrestadorCamb.IDPrestador) + ',' +
                                                                  SqlValue(fraNomencladorCamb.Nomenclador) + ',' +
                                                                  SqlValue(fraNomencladorCamb.Capitulo) + ',' +
                                                                  SqlValue(fraNomencladorCamb.Codigo) + ',' +
                                                                  SqlInt(FieldByName('au_siniestro').AsInteger) + ',' +
                                                                  SqlInt(FieldByName('au_orden').AsInteger) + ',' +
                                                                  SqlInt(FieldByName('au_recaida').AsInteger) + ', art.actualdate, ' +
                                                                  SqlInt(FieldByName('au_id').AsInteger) + ' , NULL, ' +
                                                                  SqlNumber(FieldByName('kilometraje').AsFloat, True) + '), 0) FROM dual ';
    end;

    rImporte  := ValorSql(sSql);
    if rCantidad > 1 then
      rImporte := rImporte * rCantidad;
  end;
  
  Result := rImporte
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.btnCamPrestAceptarClick(Sender: TObject);
begin
  if (fraPrestadorCamb.IDPrestador = 0) then
    MsgBox('No se puede cambiar el prestador', MB_ICONEXCLAMATION)
  else if (PrestoacionObligatoria) and (fraNomencladorCamb.Codigo = '') then
    InvalidMsg(fraNomencladorCamb, 'La Prestación es obligatoria.')
  else if ValorSQLEx('SELECT ART.AMEBPBA.IS_AUTOENLIMITE(:Siniestro, :Orden, :Recaida, :NroAuto, :PrestaApro, :Letra)' +
                      ' FROM DUAL', [sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger,
                                     sdqBusqueda.FieldByName('AU_ORDEN').AsInteger,
                                     sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger,
                                     sdqBusqueda.FieldByName('AU_NUMAUTO').AsInteger,
                                     fraPrestadorCamb.IDPrestador, 'T']) = 'N' then
    InvalidMsg(btnCamPrestAceptar, 'La autorización excede el límite diario para el prestador seleccionado.')
  else
    fpCambPrestador.ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.btnAceptarAnulacionClick(Sender: TObject);
begin
  fpDatosAnulacion.ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.btnCancelarAnulacionClick(Sender: TObject);
begin
  fpDatosAnulacion.ModalResult := mrCancel;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.fpDatosAnulacionEnter(Sender: TObject);
begin
  edObservacionesAnulacion.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbAuditarClick(Sender: TObject);
var
  sSql, sAux :string;
  bEsEstimable, bEsTraslado, pPermisoAuditoriaTrasladosSML, pPermisoAuditoriaSML :Boolean;
  iSiniestro, iOrden, iRecaida :Integer;
  dValor :Double;
begin
  Verificar(not(sdqBusqueda.FieldByName('au_fechaauditoria').IsNull) and
           (sdqBusqueda.FieldByName('au_estadoverificacion').IsNull), nil, 'La autorización ya ha sido auditada.');

//  verificar((sdqBusqueda.FieldByName('prest').AsString = '129100') and
//              (Seguridad.Claves.IsActive('AuditoriaProtesis') = false), tbAuditar, 'No tiene permisos para auditar esta prestación');  // por TK 54578: comento esto y pongo el parametro correctamente a ver que pasa

  verificar((sdqBusqueda.FieldByName('pr_presupautomatico').AsString = 'S') and
              (Seguridad.Claves.IsActive('AuditoriaProtesis') = false), tbAuditar, 'No tiene permisos para auditar esta prestación');    // por TK 54578


  iSiniestro := sdqBusqueda.FieldByName('au_siniestro').AsInteger;
  iOrden     := sdqBusqueda.FieldByName('au_orden').AsInteger;
  iRecaida   := sdqBusqueda.FieldByName('au_recaida').AsInteger;

  bEsTraslado     := (ValorSqlEx('SELECT pr_formulario FROM art.mpr_prestaciones WHERE pr_codigo = :CodPrest', [sdqBusqueda.fieldbyname('AU_PRESSOL').AsString]) = 'T');
  pPermisoAuditoriaTrasladosSML := Seguridad.Claves.IsActive('AuditoriaTrasladosSML');
  pPermisoAuditoriaSML          := Seguridad.Claves.IsActive('AuditoriaSML');  // TK 37842

  if Is_SiniestroSML(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida))
     and not Is_UsuarioSML(Sesion.UserID)
     and not Es_UsuarioSupervisor(Sesion.UserID)
     and not esSiniestroMixto(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida) then
  begin
    Verificar( not (Es_TipoPrestacionPermitida_Auditar or (bEsTraslado and pPermisoAuditoriaTrasladosSML) or pPermisoAuditoriaSML),
               tbAuditar, 'Usted no posee permiso para auditar este tipo de autorización en este siniestro.');
  end;

{  Verificar(Is_SiniestroSML(Get_IdExpediente(iSiniestro, iOrden, iRecaida))
            and not Is_UsuarioSML(Sesion.UserID)
            and not Es_UsuarioSupervisor(Sesion.UserID)
            and not Es_TipoPrestacionPermitida_Auditar
            , nil,
            'Usted no posee permiso para auditar este tipo de autorización en este siniestro.');

  Verificar(Is_SiniestroSML(Get_IdExpediente(iSiniestro, iOrden, iRecaida))
            and bEsTraslado and not pPermisoUsuario, nil,
            'Usted no posee permiso para auditar este tipo de autorización (Traslados) en este siniestro.');   }

  bEsEstimable := (ValorSql('SELECT inca.is_sini_estimable( ' +
                                    SqlInt(iSiniestro) + ',' +
                                    SqlInt(iOrden) + ',' +
                                    SqlInt(iRecaida) +       // cambiado por TK 28478
                               ') FROM dual') = 'S');
  gbEstimacion.Enabled := bEsEstimable;     // cambiado por TK 28478

  edSinAudit.SetValues(iSiniestro, iOrden, iRecaida);

  fraPrestadorAud.Cargar(sdqBusqueda.FieldByName('au_identifprestador').AsInteger);
  with fraNomencladorAud do
  begin
    Prestador       := fraPrestadorAud.IDPrestador;
    Siniestro       := edSinAudit.SiniestroClass;
    FechaSolicitud  := sdqBusqueda.FieldByName('au_fechasoli').AsDateTime;
    Vigencia        := sdqBusqueda.FieldByName('au_fechasoli').AsDateTime;
    Cargar(sdqBusqueda.FieldByName('au_pres_nomenclador').AsString,
           sdqBusqueda.FieldByName('au_pres_capitulo').AsString,
           sdqBusqueda.FieldByName('au_pres_codigo').AsString);
  end;
  edDetalleAud.Lines.Text := sdqBusqueda.FieldByName('au_detalle').AsString;

  if fpAuditoria.ShowModal = mrOk then
  begin

    if (DatosAuditoria.Estado = 'A') then
    with sdqBusqueda do
    begin
      sSql   := 'SELECT NVL(art.amebpba.get_val_prestacion(' + SqlValue(fraPrestadorAud.IDPrestador) + ',' +
                                                               SqlValue(fraNomencladorAud.Nomenclador) + ',' +
                                                               SqlValue(fraNomencladorAud.Capitulo) + ',' +
                                                               SqlValue(fraNomencladorAud.Codigo) + ',' +
                                                               SqlInt(iSiniestro) + ',' + SqlInt(iOrden) + ',' +
                                                               SqlInt(iRecaida) + ', art.actualdate, ' +
                                                               SqlInt(FieldByName('au_id').AsInteger) + ' , NULL, ' +
                                                               SqlNumber(FieldByName('kilometraje').AsFloat, True) + '), 0) FROM dual ';
      dValor := ValorSqlExtended(sSql) * IIF(FieldByName('cantidad').AsInteger > 1,
                                             FieldByName('cantidad').AsInteger, 1);
      sAux   := ', au_pres_nomenclador = ' + SqlValue(fraNomencladorAud.Nomenclador) + ',' +
                 ' au_pres_capitulo = ' + SqlValue(fraNomencladorAud.Capitulo) + ',' +
                 ' au_pres_codigo = ' + SqlValue(fraNomencladorAud.Codigo) + ',' +
                 ' au_importe = ' + SqlNumber(dValor) + ',' +
                 ' au_detalleapro = ' + SqlValue(edDetalleAud.Lines.Text);
    end
    else sAux := '';

    try
      BeginTrans;
      if bEsEstimable then       // cambiado por TK 28478
      begin
        sSql := 'UPDATE sau_autorizaciones ' +
                  ' SET au_fechaauditoria = sysdate, ' +
                      ' au_usuauditoria = :UsuAuditoria, ' +
                      ' au_accionauditoria = :Accion, ' +
                      ' au_diagnosticooms = :Diagnostico, ' +
                      ' au_gravedadcie10 = :Gravedad, ' +
                      ' au_porcincapacidad = :Porcentaje, ' +
                      ' au_motivorechazo = :Rechazo, ' +
                      ' au_justificaMultPrestaciones = :Justifica, ' +    // TK 34489
                      ' au_observaciones = SUBSTR(:Observaciones, 1, ' + SqlValue(iLenAU_OBSERVACIONES) + ') ' +
         sAux + ' WHERE au_siniestro = :Siniestro ' +
                  ' AND au_orden = :Orden ' +
                  ' AND au_recaida = :Recaida ' +
                  ' AND au_numauto = :NumAuto';

        EjecutarSqlSTEx(sSql, [Sesion.UserId, DatosAuditoria.Estado, DatosAuditoria.Diagnostico,
                               DatosAuditoria.Gravedad, DatosAuditoria.Porcentaje,
                               DatosAuditoria.MotivoRechazo,
                               DatosAuditoria.Justificacion,      // TK 34489
                               DatosAuditoria.Observaciones,
                               iSiniestro, iOrden, iRecaida,
                               sdqBusqueda.FieldByName('AU_NUMAUTO').AsInteger]);

        //camarillo, 13/06/07, esto reemplaza a los llamados a SINIESTRO.DO_GENERAREVENTOINCAPACIDAD
        sSql := 'inca.do_generarestimacionaut(' + SqlInt(iSiniestro) + ',' +
                                                  SqlInt(iOrden) + ',' +
                                                  SqlNumber(DatosAuditoria.Porcentaje) + ',' +
                                                  SqlValue(Sesion.UserID) + ',' +
                                                  SqlValue(DatosAuditoria.Diagnostico) + ', ''A'');';
        EjecutarStoreST(sSql);

        Actualizar_EX_DiagnosticoOMS(iSiniestro, iOrden, iRecaida, False);
      end
      else begin
        sSql := 'UPDATE sau_autorizaciones ' +
                  ' SET au_fechaauditoria = SYSDATE, ' +
                      ' au_usuauditoria = :UsuAuditoria, ' +
                      ' au_accionauditoria = :Accion, ' +
                      ' au_motivorechazo = :Rechazo, ' +
                      ' au_justificaMultPrestaciones = :Justifica, ' +    // TK 34489
                      ' au_observaciones = SUBSTR(au_observaciones || '' - '' || :Observaciones, 1, ' + SqlValue(iLenAU_OBSERVACIONES) + ') ' +
        sAux + ' WHERE au_siniestro = :Siniestro ' +
                  ' AND au_orden = :Orden ' +
                  ' AND au_recaida = :Recaida ' +
                  ' AND au_numauto = :NumAuto';

        EjecutarSqlSTEx(sSql, [Sesion.UserId, DatosAuditoria.Estado,
                               DatosAuditoria.MotivoRechazo,
                               DatosAuditoria.Justificacion,     // TK 34489
                               DatosAuditoria.Observaciones,
                               iSiniestro, iOrden, iRecaida,
                               sdqBusqueda.FieldByName('au_numauto').AsInteger]);
      end;
      CommitTrans;
      sdqBusqueda.Refresh;
    except
      on E:Exception do
      begin
        Rollback(True);
        ErrorMsg(E);
      end;
    end;
    if (sdqBusqueda.FieldByName('pr_presupautomatico').AsString = 'S') and Seguridad.Claves.IsActive('AuditoriaProtesis') then        // TK 54578: agrego lo de la seguridad a ver que pasa...
      GenerarPresupuesto;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
begin
  if Component = tbAuditar then bAllowAuditoria := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.SeguridadBeforeExecute(Sender: TObject);
begin
  bAllowAuditoria := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.sdqBusquedaAfterScroll(DataSet: TDataSet);
begin
  tbAuditar.Enabled := bAllowAuditoria and AreIn(sdqBusqueda.FieldByName('AU_ESTADO').AsString, ['P', 'T']);
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.sdqBusquedaAfterClose(DataSet: TDataSet);
begin
  tbAuditar.Enabled := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbPresupuestoOrtopediaOKClick(Sender: TObject);
var
  sSql: string;
begin
  Verificar(sdqBusqueda.IsEmpty, dbgBusqueda, 'No se han cargado registros en la grilla.');
  Verificar(sdqBusqueda.FieldByName('AU_ESTADO').AsString <> 'P', nil,
            'Solo se pueden habilitar los presupuestos de las autorizaciones pendientes.');
  Verificar((sdqBusqueda.FieldByName('PR_FORMULARIO').AsString <> 'P'), nil,
            'El registro seleccionado no corresponde a una prestación de tipo Ortopedia.');
  with sdqBusqueda do
    if MsgAsk(Format('¿Desea habilitar el presupuesto para el siniestro %d/%d/%d para su posterior asignación?',
              [FieldByName('AU_SINIESTRO').AsInteger,
               FieldByName('AU_ORDEN').AsInteger,
               FieldByName('AU_RECAIDA').AsInteger])) then
    begin
      sSql := 'UPDATE sau_autorizaciones ' +
                ' SET au_fechahabilitacion = SYSDATE, ' +
                    ' au_usuhabilitacion = :USUARIO ' +
               'WHERE au_fechahabilitacion IS NULL' +
                ' AND au_siniestro = :Siniestro ' +
                ' AND au_orden = :Orden ' +
                ' AND au_recaida = :Recaida ' +
                ' AND au_numauto = :NumAuto';
      EjecutarSQLEx(sSql, [Sesion.UserID,
                           FieldByName('AU_SINIESTRO').AsInteger,
                           FieldByName('AU_ORDEN').AsInteger,
                           FieldByName('AU_RECAIDA').AsInteger,
                           FieldByName('AU_NUMAUTO').AsInteger]);
      tbRefrescarClick(nil);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.AceptarRechazarAuditoria(Sender: TObject);
var bJustificar: boolean;
begin
  if gbEstimacion.Enabled then
  begin
    Verificar(fraCIE10.IsEmpty, fraCIE10, 'Debe ingresar el diagnóstico.');
    Verificar(fraGravedadCIE10.IsEmpty, fraGravedadCIE10, 'Debe ingresar la gravedad.');
    Verificar(edPorcentaje.Value < 0, edPorcentaje, 'Debe ingresar el porcentaje de incapacidad.');
  end;
  Verificar((Sender = btnAceptarAuditoria) and PrestoacionAudObligatoria and
            (fraNomencladorAud.IdNomenclador = 0) and PrestacionExigeMod(sdqBusqueda.FieldByName('PR_CODIGO').AsString),
            fraNomencladorAud, 'Debe seleccionar Nomenclador.');

  if (Sender = btnAceptarAuditoria) and
      not(ConfirmaCantidad(sdqBusqueda.FieldByName('au_pressol').AsString,
                           sdqBusqueda.FieldByName('au_idexpediente').AsInteger, False, bJustificar)) then  // ticket 34489 (el bJustificar solo aca se usa, en el Auditar)
     Exit;

  if bJustificar and (fpJustificaMultiplesPrestac.ShowModal = mrOk) then   // ticket 34489: si entra aca, tiene que justificar si o si, ya que con la funcion ConfirmaCantidad, ya hizo la pregunta de "si desea continuar.."
    DatosAuditoria.Justificacion := MemoJustificacion.Lines.Text
  else
    DatosAuditoria.Justificacion := '';

  DatosAuditoria.MotivoRechazo := '';
  DatosAuditoria.Observaciones := Trim(edObservacionesAuditoria.Text);
  if (Sender = btnAceptarAuditoria) then
  begin
    DatosAuditoria.Estado := 'A';
    Do_EvaluarModifMaterial; // TK 19542
  end
  else if (Sender = btnRechazarAuditoria) then
  begin
    Verificar(fraMotivoRechazo.IsEmpty, fraMotivoRechazo, 'Para rechazar debe ingresar un Motivo.');
    DatosAuditoria.Estado := 'R';
    DatosAuditoria.MotivoRechazo := fraMotivoRechazo.Codigo;
    DatosAuditoria.Observaciones := fraMotivoRechazo.cmbDescripcion.Text + ' - ' +  DatosAuditoria.Observaciones;
  end;
  DatosAuditoria.Diagnostico := fraCIE10.Codigo;
  DatosAuditoria.Gravedad    := fraGravedadCIE10.Codigo;
  DatosAuditoria.Porcentaje  := edPorcentaje.Value;
  DatosAuditoria.Fecha       := cmbFECHA.Date;
  fpAuditoria.ModalResult    := mrOk;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.fpAuditoriaBeforeShow(Sender: TObject);
var
  sPorcent :String;
begin
  inherited;
  fraCIE10.Codigo         := sdqBusqueda.FieldByName('EX_DIAGNOSTICOOMS').AsString;
  fraGravedadCIE10.Codigo := sdqBusqueda.FieldByName('EX_GRAVEDADCIE10').AsString;
  if sdqBusqueda.FieldByName('ULTIMA_ESTIMACION').IsNull then
  begin
    cmbFECHA.Clear;
    edPorcentaje.Clear;
  end else begin
    cmbFECHA.Date      := StrToDate(Copy(sdqBusqueda.FieldByName('ULTIMA_ESTIMACION').AsString, 1, 10));
    sPorcent := Copy(sdqBusqueda.FieldByName('ULTIMA_ESTIMACION').AsString, 11, 17);
    if (sPorcent <> '') then
      edPorcentaje.Value := StrToFloat(StringReplace(sPorcent, '.', ',', []))
    else
      edPorcentaje.Clear;
  end;
  edObservacionesAuditoria.Text := sdqBusqueda.FieldByName('OBSERVACIONES').AsString;
  fraMotivoRechazo.Value        := sdqBusqueda.FieldByName('AU_MOTIVORECHAZO').AsString;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.btnCancelarAuditoriaClick(Sender: TObject);
begin
  fpAuditoria.ModalResult := mrCancel;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.btnAnuAceptarClick(Sender: TObject);
var ssql: string;
begin
  Verificar(fraMotivoAnulacion.IsEmpty, fraMotivoAnulacion, 'Debe ingresar un motivo de anulación');
  if (sdqBusqueda.FieldByName('PR_FORMULARIO').AsString = 'T') and (fraMotivoAnulacion.sdqDatos.FieldByName('MT_ANULAPASADOS').AsString = 'N') then         //T=traslado
  begin
    ssql := ' SELECT tr_fecha ' +
             '  FROM art.str_traslados ' +
             ' WHERE tr_fecha IS NOT NULL ' +
               ' AND tr_fechaanulacion IS NULL ' +
               ' AND tr_siniestro = :sin ' +
               ' AND tr_orden = :ord ' +
               ' AND tr_recaida = :rec ' +
               ' AND tr_numauto = :auto ' +
               ' AND tr_fecha < art.actualdate ';
    
    verificar(ExisteSqlEx(ssql, [sdqBusqueda.FieldByName('au_siniestro').asstring, sdqBusqueda.FieldByName('au_orden').asstring, sdqBusqueda.FieldByName('au_recaida').asstring, sdqBusqueda.FieldByName('au_numauto').asstring]), fraMotivoAnulacion, 'No se puede anular con motivo ''' + fraMotivoAnulacion.Descripcion + ''' un traslado con fecha de turno ya pasada');
  end;
  Verificar(length(edObservacionesAnu.Lines.Text) < 5, edObservacionesAnu, 'La observación debe contener al menos 5 caracteres');
  verificar((ceImporteMulta.Value = 0) and (fraMotivoAnulacion.Value = '15'), ceImporteMulta, 'El importe de multa es obligatorio');
  fpAnular.ModalResult := mrOk;

end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.btnAnuCancelarClick(Sender: TObject);
begin
  fpAnular.ModalResult := mrCancel;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.fpAnularBeforeShow(Sender: TObject);
begin
  edObservacionesAnu.Clear;
  ceImporteMulta.Clear;
  with fraMotivoAnulacion do
  begin
    Clear;
    ShowBajas := False;
    if (sdqBusqueda.FieldByName('pr_formulario').AsString = 'T') then
    begin
      TableName       := 'SMT_MOTANULTRASLADOS';
      FieldID         := 'MT_ID';
      FieldCodigo     := 'MT_CODIGO';
      FieldDesc       := 'MT_DESCRIPCION';
      FieldBaja       := 'MT_FECHABAJA';
      ExtraCondition  := ' AND MT_AEREO = ''N''';
      ExtraFields     := ', MT_PERMITELIQUIDAR, MT_ANULAPASADOS ';
      if (nvl(sdqBusqueda.FieldByName('au_presapro').AsString, sdqBusqueda.FieldByName('au_pressol').AsString) = '449700') or
            (nvl(sdqBusqueda.FieldByName('au_presapro').AsString, sdqBusqueda.FieldByName('au_pressol').AsString) = '449600') then
        ExtraCondition  := 'AND MT_AEREO = ''S''';
    end
    else begin
      TableName       := 'CTB_TABLAS';
      FieldID         := 'TB_CODIGO';
      FieldCodigo     := 'TB_CODIGO';
      FieldDesc       := 'TB_DESCRIPCION';
      FieldBaja       := 'TB_FECHABAJA';
      ExtraCondition  := ' AND TB_CLAVE = ''MOTAN'' AND TB_CODIGO <> ''0'' ';
      ExtraFields     := '';
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.mnuViajarParteClick(Sender: TObject);
begin
  if not(HayRegistroActivo) then Exit;
  with frmParteEvolutivo do
  begin
    if not(Assigned(frmParteEvolutivo)) then
    begin
      frmParteEvolutivo := TfrmParteEvolutivo.Create(frmPrincipal);
      FormStyle         := fsMDIChild;
    end;
    if not(Self.SinEdit.IsEmpty) then
      SinEdit.SetValues(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida)
    else
      SinEdit.SetValues(Self.sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger,
                        Self.sdqBusqueda.FieldByName('AU_ORDEN').AsInteger,
                        Self.sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger);
    CargarPartes;
    Show;
  end;
  Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.mnuViajarAgendaClick(Sender: TObject);
begin
  if not(HayRegistroActivo) then exit;

  with frmAgenda do
    if not(Assigned(frmAgenda)) then
    begin
      frmAgenda := TfrmAgenda.Create(frmPrincipal);
      MenuItem  := frmPrincipal.mnuAgenda;
      FormStyle := fsMDIChild;
      if not(Self.SinEdit.IsEmpty) then
        edSiniestro.SetValues(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida)
      else
        edSiniestro.SetValues(Self.sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger,
                              Self.sdqBusqueda.FieldByName('AU_ORDEN').AsInteger,
                              Self.sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger);
      tbRefrescarClick(Nil);
      Show;
    end;
  Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.tbHistorialClick(Sender: TObject);
begin
  if not(HayRegistroActivo) then exit;
  if not(SinEdit.IsEmpty) then
    frmPrincipal.ShowHistorias(Self.SinEdit.Siniestro,Self.SinEdit.Orden,Self.SinEdit.Recaida)
  else
    frmPrincipal.ShowHistorias(Self.sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger,
                               Self.sdqBusqueda.FieldByName('AU_ORDEN').AsInteger,
                               Self.sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger);
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.fpAuditoriaEnter(Sender: TObject);
var
  Sql: String;
begin
  PrestoacionAudObligatoria   := False;
  fraNomencladorAud.Prestador := fraPrestadorAud.Value;
  Sql := 'SELECT 1 ' +
          ' FROM svp_valorprestador ' +
         ' WHERE vp_prestador=' + SqlValue(fraPrestadorAud.Value) +
           ' AND (vp_vigenciahasta IS NULL OR actualdate<=vp_vigenciahasta) ' +
           ' AND vp_nomenclador = ''1'' ' +
           ' AND vp_capitulo NOT IN (''PP'', ''AB'') ' +
           ' AND vp_fechabaja IS NULL ';
  if ExisteSql(Sql) then
  begin
   lblPrestacionAud.Font.Color  := clRed;
   PrestoacionAudObligatoria    := True;
  end
  else begin
   lblPrestacionAud.Font.Color  := clWindowText;
   PrestoacionAudObligatoria    := False;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmAutSelPorSiniestro.PrestacionExigeMod(sCodPres :String) :Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT pr_exigemodulador ' +
           ' FROM mpr_prestaciones ' +
          ' WHERE pr_codigo = ' + SqlValue(sCodPres);
  Result := (ValorSql(sSql) = 'S');
end;
{------------------------------------------------------------------------------}
function TfrmAutSelPorSiniestro.HayRegistroActivo :Boolean;
begin
  Result := not(SinEdit.IsEmpty) and sdqBusqueda.Active;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.mnuViajarCalendarioClick(Sender: TObject);
begin
  if not(HayRegistroActivo) then exit;

  with frmCalendarioPrestacional do
  begin
    if not(Assigned(frmCalendarioPrestacional)) then
    begin
      frmCalendarioPrestacional := TfrmCalendarioPrestacional.Create(Self);
      FormStyle                 := fsMDIChild;
    end;
    if not(Self.SinEdit.IsEmpty) then
      IdExpediente := Get_IdExpediente(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida)
    else
      IdExpediente := Get_IdExpediente(Self.sdqBusqueda.FieldByName('AU_SINIESTRO').AsInteger,
                                       Self.sdqBusqueda.FieldByName('AU_ORDEN').AsInteger,
                                       Self.sdqBusqueda.FieldByName('AU_RECAIDA').AsInteger);
    Show;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.mnuCambiarKilometrajeClick(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  if sdqBusqueda.IsEmpty then
    MsgBox('Debe seleccionar datos para poder agregar kilometraje excedente.', MB_ICONEXCLAMATION)
  else if not AreIn(sdqBusqueda.FieldByName('AU_ESTADO').AsString, ['A']) then
    MsgBox('Sólo se puede agregar kilometraje excedente a las autorizaciones en estado "Aprobada"', MB_ICONEXCLAMATION)
  else if not AreIn(sdqBusqueda.FieldByName('AU_PRES_CAPITULO').AsString, ['MT']) then
    MsgBox('Sólo se puede agregar kilometraje excedente a las autorizaciones cuya prestación pertenezca al módulo de traslados "MT"', MB_ICONEXCLAMATION)
  else begin
    edKilometrajeExcedente.Value := sdqBusqueda.FieldByName('AU_KMEXCEDENTE').AsFloat;
    if (fpKilometrajeExcedente.ShowModal = mrOk) and
       (edKilometrajeExcedente.Value <> sdqBusqueda.FieldByName('AU_KMEXCEDENTE').AsFloat) then
    begin
      sSQL := ' UPDATE sau_autorizaciones ' +
                 ' SET au_kmexcedente = ' + SQLValue(edKilometrajeExcedente.Value) + ', ' +
                     ' au_impoapro = au_cantapro * art.amebpba.get_val_prestacion(au_identifapro, au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, ' +
                                                                                 'au_siniestro, au_orden, au_recaida, sysdate, au_id, null,  ' +
                                                                                 '((NVL(au_kmviaje, 0) + NVL(au_kmbase, 0)) * ' + StringReplace(FloatToStr(PORC_DESVIO_GIS), ',', '.', []) + ') + NVL(' + SQLValue(edKilometrajeExcedente.Value) + ', 0)) ' +
               ' WHERE au_siniestro = ' + sdqBusqueda.FieldByName('au_siniestro').AsString +
                 ' AND au_orden = ' + sdqBusqueda.FieldByName('au_orden').AsString  +
                 ' AND au_recaida = ' + sdqBusqueda.FieldByName('au_recaida').AsString +
                 ' AND au_numauto = ' + sdqBusqueda.FieldByName('au_numauto').AsString;
      EjecutarSql(sSQL);
      Internal_RefreshAndRelocate;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAutSelPorSiniestro.Do_EvaluarModifMaterial;    // TK 19542
var sDirSML, sDirElectronica, sTextoEnvio: string;
begin
  // si la prestación es PROTESIS y cambia el detalle (materiales) => envía un mail al prestador
  if (sdqBusqueda.FieldByName('pr_codigo').AsString = TIPOPREST_PROTESIS)
     and (Trim(edDetalleAud.Lines.Text) <> Trim(sdqBusqueda.FieldByName('au_detalle').AsString)) then
  begin
    sDirElectronica := sdqBusqueda.FieldByName('ca_direlectronica').AsString;
    if Is_SiniestroSML(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then    // por TK 37960
    begin
      sDirSML := Get_DireccionesEnvioMail('SML_MAT');
      if (sDirSML <> '') then
        sDirElectronica := sDirElectronica + ',' + sDirSML;
    end;

    sTextoEnvio := 'Sres. ' + sdqBusqueda.FieldByName('prestador').AsString + #13 + #10 + #13 + #10 +
                   'Por medio de la presente, les informamos que se ha modificado el material correspondiente a su solicitud médica, ' +
                   'por la siguiente descripción: ' + #13 + #10 + #13 + #10 +
                    edDetalleAud.Lines.Text + #13 + #10 + #13 + #10 +
                   'Correspondiente al Siniestro: ' + sdqBusqueda.FieldByName('siniestro').AsString + #13 + #10 +
                   'Paciente: ' + sdqBusqueda.FieldByName('tj_nombre').AsString + ' - ' +
                   'Nro.Documento: ' + sdqBusqueda.FieldByName('tj_documento').AsString + #13 + #10 + #13 + #10;

    if (sdqBusqueda.FieldByName('pr_presupautomatico').AsString <> 'S') then   // por TK 54602, si es presupuesto automatico, no pone la firma del Dr. Aimetta. Para el resto de los casos sí.
      sTextoEnvio := sTextoEnvio + 'Dr. Roberto Aimetta ' + #13 + #10 +
                                   'Tel. 43384700 interno 4503';

    if (sDirElectronica <> '') then
      unMoldeEnvioMail.EnviarMailBD(sDirElectronica, 'Provincia A.R.T. - Modificación de Material', [oAlwaysShowDialog],
                                    sTextoEnvio, nil, 0, tcDefault, False);

  end;
end;

procedure TfrmAutSelPorSiniestro.btnAceptarJustificaClick(Sender: TObject);
begin
  Verificar(Trim(MemoJustificacion.Lines.Text) = '', MemoJustificacion, 'Debe completar la Justificación');
  fpJustificaMultiplesPrestac.ModalResult := mrOk;
end;

procedure TfrmAutSelPorSiniestro.fpJustificaMultiplesPrestacBeforeShow(Sender: TObject);
begin
  MemoJustificacion.Lines.Clear;
end;

function TfrmAutSelPorSiniestro.Es_TipoPrestacionPermitida_Auditar: Boolean;  // Plan - SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_tipoprestacionnosml(:tipoprest,''U'') FROM dual',
             [sdqBusqueda.fieldbyname('AU_PRESSOL').AsString]) = 'S');
end;

procedure TfrmAutSelPorSiniestro.GenerarPresupuesto;
var IdPresupuesto, i: integer; ssql: string; presupuestos: TStringList;
begin
  presupuestos := TStringList.Create;
  ssql := 'SELECT pg_idprestador ' +
           ' FROM SIN.spg_prestadoresxgrupo ' +
          ' WHERE pg_codgrupo = :gtrab AND pg_fechabaja IS NULL ';
  with GetQueryEx(ssql, [sdqBusqueda.FieldByName('ex_gtrabajo').AsString]) do
  begin
    if not Eof then
    begin

      try
        BeginTrans;
        while not Eof do
        begin
          // doy de alta los datos del presupuesto solicitado
          with TSql.Create('MPA_PRESUPUESTOAUTORIZACION') do
          try
            IdPresupuesto := GetSecNextVal('SEQ_MPA_ID');
            PrimaryKey.Add('PA_ID',       IdPresupuesto);
            Fields.Add('PA_PRESTADOR',    FieldByName('pg_idprestador').AsInteger);
            Fields.Add('PA_MATERIALSOLI', sdqBusqueda.FieldByName('au_detalleapro').AsString);
            Fields.Add('PA_TIPO',         1);    //compra
            Fields.Add('PA_USUALTA',      Sesion.UserId);
            Fields.Add('PA_FECHAALTA',    exDateTime);
            SqlType := stInsert;
            EjecutarSqlST(Sql);
            presupuestos.Add(inttostr(IdPresupuesto));
          finally
            Free;
          end;
          // creo la relación entre la ortopedia y el presupuesto
          with TSql.Create('MSP_SINIESTROPRESUP') do
          try
            PrimaryKey.Add('SP_NROPEDIDO',  GetSecNextVal('SEQ_MSP_ID'));
            Fields.Add('SP_SINIESTRO',      sdqBusqueda.FieldByName('au_siniestro').AsInteger);
            Fields.Add('SP_ORDEN',          sdqBusqueda.FieldByName('au_orden').AsInteger);
            Fields.Add('SP_RECAIDA',        sdqBusqueda.FieldByName('au_recaida').AsInteger);
            Fields.Add('SP_AUTOORIGINAL',   sdqBusqueda.FieldByName('au_numauto').AsInteger);
            Fields.Add('SP_PRESUPUESTO',    SqlInt(IdPresupuesto));
            Fields.Add('SP_INICIORECUPERO', exDateTime);
            Fields.Add('SP_USUALTA',        Sesion.UserId);
            Fields.Add('SP_FECHAALTA',      exDateTime);
            SqlType := stInsert;
            EjecutarSqlST(Sql);
          finally
            Free;
          end;
          Next;
        end;

        CommitTrans;
        MsgBox('El Presupuesto solicitado se cargó correctamente.', MB_OK + MB_ICONINFORMATION);
        for i := 0 to presupuestos.Count - 1 do
          EnviarMailPresupuesto(strtoint(presupuestos[i]));
        
      except
        on E: Exception do
        begin
          if InTransaction then
            RollBack;
          raise Exception.Create(E.Message + #13 + 'Error al cargar el Presupuesto.');
        end;
      end;
    end;
  end;
end;

procedure TfrmAutSelPorSiniestro.EnviarMailPresupuesto(iIdPresup: integer);
begin
  with TqrpSolicitudPresupuesto.Create(Self) do
  try
    try
      ImprimirSolicitudPresupuesto(iIdPresup,
                                   sdqBusqueda.FieldByName('au_siniestro').AsInteger, sdqBusqueda.FieldByName('au_orden').AsInteger,
                                   sdqBusqueda.FieldByName('au_recaida').AsInteger, sdqBusqueda.FieldByName('au_numauto').AsInteger,
                                   TempPath + 'ProvART_' + IntToStr(iIdPresup) + '.pdf', '', False);
    except
      on E: Exception do
        raise Exception.Create(E.Message + #13 + 'Error al enviar la solicitud de presupuesto por mail.');
    end;
  finally
    Free;
  end;
end;

procedure TfrmAutSelPorSiniestro.pMenuViajarPopup(Sender: TObject);
begin
  mnuViajarParte.Enabled  := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuParteEvolutivoCarga);
  mnuViajarAgenda.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuAgenda);
 // mnuViajarCalendario.Enabled := frmPrincipal.Seguridad.Activar();  // esta pantalla de Calendario no sale del ppal, hay una desde unAutCarga y otra desde Parte Evolutivo (con viajar).
end;

end.
