unit unAgendaCargaConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, AdvToolBar,
  AdvToolBarStylers, AdvPanel, ExtCtrls, AdvGlowButton, AdvNavBar,
  StdCtrls, DBCtrls, DB, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, JvExExtCtrls, JvComponent, unFraTrabajador,
  unfraTrabajadorAGENDA, unFraCodigoDescripcion, unFraEstablecimiento,
  unfraEstablecimientoAGENDA, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, unfraEmpresaAGENDA, JvPanel, unfraCPR_PRESTADOR,
  unfraPrestadorAGENDA, ShortCutControl, JvNavigationPane, Mask, ToolEdit,
  DateComboBox, unfraUsuarios, PatternEdit, IntEdit, unFraCodDesc, unAgenda,
  ActnList, Menus, SortDlg, unInterfaces, JvExDBGrids, JvDBGrid,
  unfraDelegacion, unFraTrabajadorSiniestro, unfraTrabajadorSiniestroAGENDA,
  ComCtrls, ToolWin, AdvPageControl, unfraVendedores, unfraVendedoresCUIT,
  unfraVendedorAGENDA, unfraEntidadCUIT, unfraEntidadAGENDA,
  unFraStaticCodigoDescripcion, unFraCanal, AdvMenus, AdvGroupBox,
  AdvOfficeButtons, unfraSectores, unfraVistaEventos, artSeguridad, Login,
  artDbLogin, unFraActividad, CurrEdit, CheckLst, ARTCheckListBox,
  JvExStdCtrls, JvGroupBox, JvgGroupBox, unFraEmpresaAfi,
  unFraEmpresaSolicitud, unfraEmpresaSolicitudAGENDA, RxCurrEdit, RxToolEdit,
  JvExtComponent, RxPlacemnt;

type
  TfrmAgendaCargaConsulta = class(TfrmCustomForm, IModoABM)
    AdvNavBar: TAdvNavBar;
    AdvPanelStyler: TAdvPanelStyler;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBarPager: TAdvToolBarPager;
    btnConsultar: TAdvGlowButton;
    btnLimpiar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnOrdenar: TAdvGlowButton;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText7: TDBText;
    dsEstadisticas: TDataSource;
    edAE_CONTACTO_FULL_LIKE: TEdit;
    edAE_CORREOELECTRONICO_LIKE: TEdit;
    edAE_NUMEROTELEFONO_LIKE: TPatternEdit;
    fraAE_CONTRATO: TfraEmpresaAGENDA;
    fraAE_IDENTIDAD: TfraEntidadAGENDA;
    fraAE_IDPRESTADOR: TfraPrestadorAGENDA;
    fraAE_IDTRABAJADOR: TfraTrabajadorAGENDA;
    fraAE_IDVENDEDOR: TfraVendedorAGENDA;
    fraES_ID: TfraEstablecimientoAGENDA;
    fraEX_DELEGACION: TfraDelegacion;
    fraEX_GESTOR: TfraCodDesc;
    fraEX_GTRABAJO: TfraCodDesc;
    fraEX_ID: TfraTrabajadorSiniestroAGENDA;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    nbpEstadisticas: TAdvNavBarPanel;
    nbpNotas: TAdvNavBarPanel;
    pnlFiltrosAtCliente: TPanel;
    pnlAreaMedica: TPanel;
    pnlBottom: TAdvPanel;
    pnlLeftData: TPanel;
    pnlLeftToolbar: TPanel;
    pnlOtros: TPanel;
    pnlUsuariosFechas: TPanel;
    sdqEstadisticas: TSDQuery;
    sdqEstadisticasDIARIO: TFloatField;
    sdqEstadisticasMENSUAL: TFloatField;
    sdqEstadisticasSECTOR: TFloatField;
    sdqEstadisticasSECTOR_MES: TFloatField;
    sdqEstadisticasSEMANAL: TFloatField;
    ShortCutControl: TShortCutControl;
    tsAreaMedica: TAdvPage;
    tsEventos: TAdvPage;
    tsOtros: TAdvPage;
    tsUsuariosFechas: TAdvPage;
    AdvMenuStyler: TAdvMenuStyler;
    pnlFiltroNroEvento: TJvPanel;
    edAE_ID: TIntEdit;
    Label41: TLabel;
    lbEventos: TLabel;
    pnlAux: TPanel;
    pnlGral: TPanel;
    fraVistaEventos: TfraVistaEventos;
    Seguridad: TSeguridad;
    DBLogin: TDBLogin;
    tsDatosAdicionales: TAdvToolBarPager;
    tsPersonalInvolucrado: TAdvPage;
    tsOtrosFiltros: TAdvPage;
    pnlFiltrosDatos: TPanel;
    Label14: TLabel;
    Label42: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    fraAE_USUALTA: TfraUsuario;
    fraIDSECTORALTA: TfraCodDesc;
    fraIDJEFATURA: TfraCodDesc;
    fraIDGERENCIA: TfraCodDesc;
    edAE_FECHAALTAHasta: TDateComboBox;
    edAE_FECHAVENCIMIENTODesde: TDateComboBox;
    edAE_FECHAVENCIMIENTOHasta: TDateComboBox;
    edAE_FECHAHORAINICIODesde: TDateComboBox;
    edAE_FECHAHORAINICIOHasta: TDateComboBox;
    pnlFechaDesde: TPanel;
    Label4: TLabel;
    edAE_FECHAALTADesde: TDateComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    Label25: TLabel;
    fraTE_IDPROCESO: TfraCodDesc;
    fraMI_ID: TfraCodDesc;
    fraAE_IDTIPOEVENTO: TfraCodDesc;
    fraAE_IDTIPOEVENTO2: TfraCodDesc;
    fraRA_IDRESPUESTA: TfraCodDesc;
    Label18: TLabel;
    Label43: TLabel;
    edID: TIntEdit;
    ed_idtarea: TIntEdit;
    rgCallCenter: TAdvOfficeRadioGroup;
    rgTareas: TAdvOfficeRadioGroup;
    pnlFiltrosAdicionales: TPanel;
    Label17: TLabel;
    editAE_CONTACTO_FULL_LIKE: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edAE_FECHAMODIFDesde: TDateComboBox;
    edAE_FECHAMODIFHasta: TDateComboBox;
    edAE_FECHABAJADesde: TDateComboBox;
    edAE_FECHABAJAHasta: TDateComboBox;
    Label15: TLabel;
    Label16: TLabel;
    fraAE_USUMODIF: TfraUsuario;
    fraAE_USUBAJA: TfraUsuario;
    rgVer: TAdvOfficeRadioGroup;
    rgTareasEnCurso: TAdvOfficeRadioGroup;
    fraSECTORALTA: TfraSectores;
    Label28: TLabel;
    rgVerEventosOriginantes: TAdvOfficeRadioGroup;
    rgInsatisfaccion: TAdvOfficeRadioGroup;
    rgRellamadas: TAdvOfficeRadioGroup;
    pgInsatisfaccion: TAdvPage;
    pnlOtros2: TPanel;
    gbProspectos: TJvgGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lblActividad: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    medtAE_CUIT: TMaskEdit;
    edAE_RAZONSOCIAL_LIKE: TEdit;
    fraAE_CIIU: TfraActividad;
    edAE_CANTTRABAJADORESDesde: TIntEdit;
    edAE_CANTTRABAJADORESHasta: TIntEdit;
    edAE_MASASALARIALDesde: TCurrencyEdit;
    edAE_MASASALARIALHasta: TCurrencyEdit;
    AdvPage1: TAdvPage;
    Panel1: TPanel;
    Panel2: TPanel;
    lblEncuestaInsatisfaccion: TLabel;
    lblAntiguas: TLabel;
    clbOpcionesInicio: TARTCheckListBox;
    clbOpcionesFin: TARTCheckListBox;
    clbOpcionesViejasRespuestas: TARTCheckListBox;
    clbOpcionesViejasPreguntas: TARTCheckListBox;
    clbFiltroMotivosIngreso: TARTCheckListBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edFechaAltaTareaDesdeOrig: TDateComboBox;
    edFechaAltaTareaHastaOrig: TDateComboBox;
    Label37: TLabel;
    Label38: TLabel;
    edFechaAltaTareaDesdeGen: TDateComboBox;
    edFechaAltaTareaHastaGen: TDateComboBox;
    fraFiltroDelegacion: TfraDelegacion;
    Label39: TLabel;
    rgEmpresasVIP: TAdvOfficeRadioGroup;
    Panel3: TPanel;
    pnlCanal: TPanel;
    lbVendedor: TLabel;
    edAE_DATOFECHAHasta: TDateComboBox;
    edAE_DATOFECHADesde: TDateComboBox;
    Label40: TLabel;
    Label44: TLabel;
    fraIDFORMULARIO: TfraEmpresaSolicitudAGENDA;
    pnlGestorEjecutivo: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    fraCO_IDGESTOR: TfraCodDesc;
    fraCO_IDEJECUTIVO: TfraCodDesc;
    rgTipoCliente: TJvgGroupBox;
    clbTipoCliente: TARTCheckListBox;
    Label45: TLabel;
    fraUsuarioAltaTareaOriginante: TfraUsuario;
    Label46: TLabel;
    fraUsuarioAltaTareaGenerada: TfraUsuario;
    rgBajas: TAdvOfficeRadioGroup;
    fraEN_IDCANAL: TfraCodDesc;
    pnlLeft: TPanel;
    procedure acActualizarExecute(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnOrdenarClick(Sender: TObject);
    procedure ChequeoPanelBotones(Sender: TObject);
    procedure edAE_IDChange(Sender: TObject);
    procedure edIDChange(Sender: TObject);
    procedure ActualizoPorEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FiltroGestor(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fraEX_GTRABAJOPropiedadesChange(Sender: TObject);
    procedure fraIDSECTORALTAPropiedadesChange(Sender: TObject);
    procedure fraVistaEventosacEliminarEventoExecute(Sender: TObject);
    procedure fraVistaEventosacModificarEventoExecute(Sender: TObject);
    procedure fraVistaEventosacNuevoEventoExecute(Sender: TObject);
    procedure fraVistaEventosedEstadoTareaClick(Sender: TObject);
    procedure fraVistaEventosmnuExportarClick(Sender: TObject);
    procedure fraVistaEventossdqEventosAfterOpen(DataSet: TDataSet);
    procedure fraVistaEventossdqEventosAfterScroll(DataSet: TDataSet);
    procedure rgCallCenterClick(Sender: TObject);
    procedure sdqEstadisticasCalcFields(DataSet: TDataSet);
    procedure ControlFiltros(Sender: TObject);
  private
    FIdTabla: Integer;
    FModoABM: TModoABM;
    FRefreshing: Boolean;
    FSQL, FSqlComboMotivos: String;
    procedure ClearNotes;
    procedure SetModoABM(const Value: TModoABM);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  published
    property ModoABM: TModoABM read FModoABM write SetModoABM;
  end;

var
  frmAgendaCargaConsulta: TfrmAgendaCargaConsulta;

implementation

uses
  General, unDmPrincipal, unSesion, CustomDlgs, VCLExtra, Math, unArt, DateTimeFuncs, unFiltros,
  unGrids, unABMAgendaBaseEvento, unABMAgendaBase, DateUtils, AnsiSql, Strfuncs, Numeros,
  SqlFuncs;

{$R *.dfm}

procedure TfrmAgendaCargaConsulta.acActualizarExecute(Sender: TObject);
var
  sSQL: String;
  dHoy, dFechaAux: TDateTime;
begin
  dHoy := DBDate;
  FRefreshing := True;

  with fraVistaEventos do
  try
    if edAE_FECHAALTADesde.Date = dHoy - 180 then
    begin
      dFechaAux := edAE_FECHAALTADesde.Date;
      edAE_FECHAALTADesde.Clear;
    end else
      dFechaAux := 0;

    if edAE_ID.IsEmpty and ed_idtarea.IsEmpty then
      sSQL := FSQL + DoFiltro(pnlLeftData) + DoFiltro(pnlFiltrosDatos) + DoFiltro(pnlFiltrosAdicionales) +
                     DoFiltro(nbpNotas) + DoFiltro(tsEventos) + DoFiltro(tsAreaMedica) + DoFiltro(pnlOtros) +
                     DoFiltro(gbProspectos)
    else begin
      sSQL := FSQL + DoFiltro(pnlFiltroNroEvento);

      if not ed_idtarea.IsEmpty then
      begin
        sSQL := FSQL;
        AddCondition(sSQL, ' ID IN (SELECT at_idagendaevento ' +
                                    ' FROM agenda.aat_agendatarea ' +
                                   ' WHERE at_id = ' + SQLValue(ed_idtarea.Value) +
                               ' UNION ALL ' +
                                  ' SELECT at_ideventotarea ' +
                                    ' FROM agenda.aat_agendatarea ' +
                                   ' WHERE at_id = ' + SQLValue(ed_idtarea.Value) +
                               ' UNION ALL ' +
                                  ' SELECT ' + SQLValue(ed_idtarea.Value) +
                                    ' FROM dual) ');
      end;
    end;
    
    if dFechaAux > 0 then
      edAE_FECHAALTADesde.Date := dFechaAux;

    case rgTareas.ItemIndex of
      1: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tareas_pendientes = ''S'' ');
      2: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''N'' AND con_tareas = ''S'' AND tareas_pendientes = ''S'' AND tareas_pendientes_vencidas = ''N'' ');
      3: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''N'' AND con_tareas = ''S'' AND tareas_pendientes = ''S'' AND tareas_pendientes_vencidas = ''S'' ');
      4: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tareas_pendientes = ''N'' AND ae_estado IN( ' + SqlValue(ESTADO_EVENTO_TERMINADO) + ') ');
      5: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tareas_pendientes = ''N'' AND ae_estado IN( ' + SqlValue(ESTADO_EVENTO_TERMINADO) + ') AND tarea_gestionada_vencida = ''N'' ');
      6: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tareas_pendientes = ''N'' AND ae_estado IN( ' + SqlValue(ESTADO_EVENTO_TERMINADO) + ') AND tarea_gestionada_vencida = ''S'' ');
      7: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tareas_pendientes = ''N'' AND ae_estado NOT IN( ' + SqlValue(ESTADO_EVENTO_TERMINADO) + ',' + SqlValue(ESTADO_EVENTO_PENDIENTEAUTORIZACION) + ') ');
    end;

    case rgVer.ItemIndex of
      1: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''N'' AND ((con_tareas = ''N'') OR (((insatisfaccion = ''S'') AND (con_tareas = ''N'')) OR (con_tareas_queja = ''S''))) ');
      2: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''N'' AND insatisfaccion = ''N'' AND con_tareas = ''N'' AND con_tareas_queja = ''N'' ');
      3: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''N'' AND (((insatisfaccion = ''S'') AND (con_tareas = ''N'')) OR (con_tareas_queja = ''S'')) ');
      4: AddCondition(sSQL, ' tipo = ''EVENTO'' AND con_tareas = ''S'' AND con_tareas_queja = ''N'' ');
      5: AddCondition(sSQL, ' tipo = ''EVENTO'' AND con_tareas = ''S'' AND insatisfaccion = ''N'' AND con_tareas_queja = ''N'' AND NOT EXISTS (SELECT 1 FROM agenda.aat_agendatarea WHERE at_idagendaevento = ae_id AND at_insatisfaccion = ''S'') ');
      6: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''N'' AND con_tareas = ''S'' AND EXISTS (SELECT 1 FROM agenda.aat_agendatarea WHERE at_idagendaevento = ae_id AND at_insatisfaccion = ''S'') AND con_tareas_queja = ''N'' ');
      7: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''S'' ');
      8: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''S'' AND tarea_gestionada_vencida = ''N'' ');
      9: AddCondition(sSQL, ' tipo = ''EVENTO'' AND tarea_gestionada = ''S'' AND tarea_gestionada_vencida = ''S'' ');
     10: AddCondition(sSQL, ' tipo = ''TAREA'' ');
    end;

    case rgCallCenter.ItemIndex of
      1: AddCondition(sSQL, ' sectoralta = ''CALLCENT'' ');
      2: AddCondition(sSQL, ' sectoralta <> ''CALLCENT'' ');
    end;

    case rgInsatisfaccion.ItemIndex of
      1: AddCondition(sSQL, ' insatisfaccion = ''S'' ');
      2: AddCondition(sSQL, ' insatisfaccion = ''N'' ');
    end;

    case rgRellamadas.ItemIndex of
      1: AddCondition(sSQL, ' rellamadas = ''S'' ');
      2: AddCondition(sSQL, ' rellamadas = ''N'' ');
    end;

    case rgTareasEnCurso.ItemIndex of
      1: AddCondition(sSQL, ' tipo = ''TAREA'' ');
      2: AddCondition(sSQL, ' tipo = ''EVENTO'' ');
    end;

    case rgEmpresasVIP.ItemIndex of
      1: AddCondition(sSQL, ' art.afiliacion.is_empresavip(ae_contrato) = ''N'' ');
      2: AddCondition(sSQL, ' art.afiliacion.is_empresavip(ae_contrato) = ''S'' ');
    end;

    case rgVerEventosOriginantes.ItemIndex of
      1: AddCondition(sSQL, ' tipo = ''EVENTO'' AND ''S'' = CASE ' +
                                                             'WHEN con_tareas = ''S'' ' +
                                                              'AND tareas_pendientes = ''N'' ' +
                                                             'THEN ''N'' ' +
                                                             'ELSE ''S'' ' +
                                                            'END ');
    end;

    case rgBajas.ItemIndex of
      1: AddCondition(sSQL, ' AE_FECHABAJA IS NULL ');
    end;

    if fraFiltroDelegacion.IsSelected then
      AddCondition(sSQL, ' EXISTS (SELECT 1 FROM art.use_usuarios WHERE se_usuario = ae_usualta AND se_delegacion = ' + fraFiltroDelegacion.Codigo + ')');

    if edFechaAltaTareaDesdeOrig.Date + edFechaAltaTareaHastaOrig.Date > 0 then
      AddCondition(sSQL, ' (EXISTS (SELECT 1 FROM agenda.aat_agendatarea WHERE tipo = ''EVENTO'' AND at_ideventotarea = ae_id AND ' + SqlBetweenDateTime('at_fechaalta', edFechaAltaTareaDesdeOrig.Date, edFechaAltaTareaHastaOrig.Date, True) + ' UNION ALL SELECT 1 FROM agenda.aat_agendatarea WHERE tipo = ''TAREA'' AND at_id = id AND ' + SqlBetweenDateTime('at_fechaalta', edFechaAltaTareaDesdeOrig.Date, edFechaAltaTareaHastaOrig.Date, True) + '))');

    if fraUsuarioAltaTareaOriginante.IsSelected then
      AddCondition(sSQL, ' (EXISTS (SELECT 1 FROM agenda.aat_agendatarea WHERE tipo = ''EVENTO'' AND at_ideventotarea = ae_id AND at_usualta = ' + SqlString(fraUsuarioAltaTareaOriginante.UserID, True) + ' UNION ALL SELECT 1 FROM agenda.aat_agendatarea WHERE tipo = ''TAREA'' AND at_id = id AND at_usualta = ' + SqlString(fraUsuarioAltaTareaOriginante.UserID, True) + '))');

    if edFechaAltaTareaDesdeGen.Date + edFechaAltaTareaHastaGen.Date > 0 then
      AddCondition(sSQL, ' EXISTS (SELECT 1 FROM agenda.aat_agendatarea WHERE at_idagendaevento = ae_id AND ' + SqlBetweenDateTime('at_fechaalta', edFechaAltaTareaDesdeGen.Date, edFechaAltaTareaHastaGen.Date, True) + ')');

    if fraUsuarioAltaTareaGenerada.IsSelected then
      AddCondition(sSQL, ' EXISTS (SELECT 1 FROM agenda.aat_agendatarea WHERE at_idagendaevento = ae_id AND at_usualta = ' + SqlString(fraUsuarioAltaTareaGenerada.UserID, True) + ')');

    if clbFiltroMotivosIngreso.CheckedValues.Count > 0 then
      AddCondition(sSQL, ' 1=1 ' + clbFiltroMotivosIngreso.InSQL_IntegerValues('mi_id'));

    if clbOpcionesInicio.CheckCount > 0 then
      AddCondition(sSQL, ' EXISTS(SELECT 1 ' +
                                   'FROM agenda.ain_insatisfaccion, agenda.aid_insatisfacciondetalle ' +
                                  'WHERE in_id = id_idinsatisfaccion ' +
                                    'AND id_marca = ''S'' ' +
                                    'AND in_idagendaevento = ae_id ' + clbOpcionesInicio.InSQL_IntegerValues('id_idinsatisfaccionconf') + ')');

    if clbOpcionesFin.CheckCount > 0 then
      AddCondition(sSQL, ' EXISTS(SELECT 1 ' +
                                   'FROM agenda.ain_insatisfaccion, agenda.aid_insatisfacciondetalle ' +
                                  'WHERE in_id = id_idinsatisfaccion ' +
                                    'AND id_marca = ''S'' ' +
                                    'AND in_idagendaevento = ae_id ' + clbOpcionesFin.InSQL_IntegerValues('id_idinsatisfaccionconf') + ')');

    if clbOpcionesViejasPreguntas.CheckCount > 0 then
      AddCondition(sSQL, ' EXISTS(SELECT 1 ' +
                                   'FROM agenda.ain_insatisfaccion, agenda.aid_insatisfacciondetalle ' +
                                  'WHERE in_id = id_idinsatisfaccion ' +
                                    'AND id_marca = ''S'' ' +
                                    'AND in_idagendaevento = ae_id ' + clbOpcionesViejasPreguntas.InSQL_IntegerValues('id_idinsatisfaccionconf') + ')');

    if clbOpcionesViejasRespuestas.CheckCount > 0 then
      AddCondition(sSQL, ' EXISTS(SELECT 1 ' +
                                   'FROM agenda.ain_insatisfaccion, agenda.aid_insatisfacciondetalle ' +
                                  'WHERE in_id = id_idinsatisfaccion ' +
                                    'AND id_marca = ''S'' ' +
                                    'AND in_idagendaevento = ae_id ' + clbOpcionesViejasRespuestas.InSQL_IntegerValues('id_idinsatisfaccionconf') + ')');

    if (clbTipoCliente.CheckCount > 0) and (clbTipoCliente.CheckCount < clbTipoCliente.Count) then
      AddCondition(sSQL, ' EXISTS(SELECT 1 FROM aem_empresa, aco_contrato WHERE co_contrato = ae_contrato AND co_idempresa = em_id ' + clbTipoCliente.InSQL_StringValues('em_sector', False) + ')');

    Verificar(FSQL = sSQL, btnConsultar, 'Debe seleccionar al menos un filtro para poder ver los eventos cargados.');

    if edAE_ID.IsEmpty and ed_idtarea.IsEmpty and (dFechaAux > 0) then
      sSQL := sSQL + DoFiltro(pnlFechaDesde);
                      
    sSQL := sSQL + iif(SortDialog.OrderBy = '', ' ORDER BY AE_FECHAALTA DESC ', SortDialog.OrderBy);
    sdqEventos.Close;

    dFechaAux := Max(Min(Min(Min(NVL(edAE_FECHAALTADesde.Date, dHoy), NVL(edAE_FECHAHORAINICIODesde.Date, dHoy)), NVL(edAE_FECHAVENCIMIENTODesde.Date, dHoy)), NVL(edAE_FECHAMODIFDesde.Date, dHoy)),ART_MINFECHA);

    OpenQueryEx(sdqEventos, [Sesion.ID, TDateTimeEx.Create(dFechaAux)], sSQL);

    if FIdTabla <> ART_EMPTY_ID then
      try
        sdqEventos.Locate('AE_ID', FIdTabla, []);
      except
      end;
  finally
    FRefreshing := False;
    ModoABM := abmNone;     
  end;
end;

procedure TfrmAgendaCargaConsulta.btnLimpiarClick(Sender: TObject);
begin
  lbEventos.Caption := '';
  ClearComponentData(AdvToolBarPager);
  ClearComponentData(nbpNotas);
  rgTareas.ItemIndex := 0;
  rgCallCenter.ItemIndex := 0;
  rgRellamadas.ItemIndex := 0;
  rgInsatisfaccion.ItemIndex := 0;
  rgTareasEnCurso.ItemIndex := 0;        
  rgVer.ItemIndex := 0;
  fraVistaEventos.sdqEventos.Close;
  edAE_FECHAALTADesde.Date := DBDate - 180;
  clbOpcionesInicio.ClearChecks;
  clbOpcionesFin.ClearChecks;
  clbOpcionesViejasPreguntas.ClearChecks;
  clbOpcionesViejasRespuestas.ClearChecks;
  clbFiltroMotivosIngreso.ClearChecks;
  clbTipoCliente.CheckAll;
end;

procedure TfrmAgendaCargaConsulta.btnOrdenarClick(Sender: TObject);
begin
  inherited;
  fraVistaEventos.acOrdenarExecute(Sender);
end;

procedure TfrmAgendaCargaConsulta.ChequeoPanelBotones(Sender: TObject);
begin
  pnlLeftToolbar.Width := pnlLeftToolbar.Width + 1;
  pnlLeftToolbar.Width := pnlLeftToolbar.Width - 1;
end;

procedure TfrmAgendaCargaConsulta.FiltroGestor(Sender: TObject);
begin
  fraEX_GESTOR.Propiedades.ExtraCondition := ' AND EXISTS(SELECT 1 ' +
                                                           'FROM ART.MGP_GTRABAJO, ART.MUG_USUARIOGRUPOTRABAJO ' +
                                                          'WHERE GP_GESTIONADO = ''S'' ' +
                                                            'AND GP_CODIGO = UG_GRUPO ' +
                                                            'AND UG_USUARIO = SE_USUARIO ' +
                                                            'AND UG_USUBAJA IS NULL ' +
                                                            'AND GP_CODIGO = ' + SQLValue(fraEX_GTRABAJO.Codigo) + ')';
  fraEX_GESTOR.cmbDescripcionDropDown(Sender);
end;

procedure TfrmAgendaCargaConsulta.FormCreate(Sender: TObject);
begin
  FSqlComboMotivos := 'SELECT DISTINCT MI_DESCRIPCION, MI_ID ' +
                        'FROM AGENDA.AMI_MOTIVOINGRESO, AGENDA.ATI_TIPOEVENTOMOTIVOINGRESO ' +
                       'WHERE TI_IDMOTIVOINGRESO(+) = MI_ID ' +
                         'AND MI_FECHABAJA IS NULL ' +
                    'ORDER BY MI_DESCRIPCION';

  fraVistaEventos.GridEventos.Width := FormStorage.ReadInteger('GridEventos_Width', 478);
  fraVistaEventos.pnlDescripcionEvento.Height := FormStorage.ReadInteger('pnlDescripcionEvento_Height', 478);
  fraVistaEventos.pnlDescripcionTarea.Height := FormStorage.ReadInteger('pnlDescripcionTarea_Height', 478);

  lbEventos.Caption := '';
  pnlFiltroNroEvento.Transparent := True;
  fraFiltroDelegacion.OnLine := False;
  
  FRefreshing := False;
  ModoABM := abmNone;
  inherited;
  edAE_FECHAALTADesde.Date := DBDate - 180;
  clbTipoCliente.CheckAll;  
  FSQL := fraVistaEventos.sdqEventos.SQL.Text;
  AdvToolBarPager.ActivePageIndex := 0;
  tsDatosAdicionales.ActivePageIndex := 0;
  fraAE_CONTRATO.ShowBajas := True;
  fraAE_CONTRATO.FrameEstablecimiento := fraES_ID;
  fraAE_CONTRATO.FrameTrabajador := fraAE_IDTRABAJADOR;
  fraES_ID.ShowBajas := True;
  fraES_ID.fraEmpresa := fraAE_CONTRATO;
  fraAE_IDTRABAJADOR.ShowBajas := True;
//  fraAE_IDTRABAJADOR.FrameEmpresa := fraAE_CONTRATO; a propósito no lo engancho...
  fraAE_IDPRESTADOR.ShowBajas := True;
  fraIDFORMULARIO.ShowBajas := True;
  clbFiltroMotivosIngreso.SQL := FSqlComboMotivos;
  HideTitleBar;
  ClearNotes;

  if Sesion.Sector = 'CALLCENT' then
    nbpEstadisticas.TabVisible := False
  else
    OpenQueryEx(sdqEstadisticas, [Sesion.UserID]);
    
  Width := Width + 1;
  Application.ProcessMessages;
  Width := Width - 1;
{
  if Sesion.Sector <> 'CALLCENT' then
    fraAE_USUALTA.Cargar(Sesion.UserID);
}
  VCLExtra.LockControls([fraEX_GESTOR], True);
  fraAE_CONTRATO.cmbRSocial.DataSource := fraAE_CONTRATO.dsDatos;
  fraES_ID.cmbDescripcion.DataSource := fraES_ID.dsDatos;
  fraAE_IDTRABAJADOR.cmbNombre.DataSource := fraAE_IDTRABAJADOR.dsDatos;
  fraAE_IDPRESTADOR.cmbCA_DESCRIPCION.DataSource := fraAE_IDPRESTADOR.dsDatos;
  fraEX_ID.cmbNombre.DataSource := fraEX_ID.dsDatos;
end;

procedure TfrmAgendaCargaConsulta.fraEX_GTRABAJOPropiedadesChange(Sender: TObject);
begin
  VCLExtra.LockControls([fraEX_GESTOR], fraEX_GTRABAJO.IsEmpty);
end;

procedure TfrmAgendaCargaConsulta.sdqEstadisticasCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('SECTOR').AsInteger > 0 then
    DataSet.FieldByName('SECTOR_MES').AsFloat := RoundNumber(DataSet.FieldByName('MENSUAL').AsInteger / DataSet.FieldByName('SECTOR').AsInteger, 3) * 100
  else
    DataSet.FieldByName('SECTOR_MES').AsFloat := 0;
end;

procedure TfrmAgendaCargaConsulta.ClearNotes;
begin
  edAE_CONTACTO_FULL_LIKE.Clear;
  edAE_NUMEROTELEFONO_LIKE.Clear;
  edAE_CORREOELECTRONICO_LIKE.Clear;
end;

procedure TfrmAgendaCargaConsulta.SetModoABM(const Value: TModoABM);
begin
  FModoABM := Value;
  with fraVistaEventos do
  begin
    acNuevoEvento.Enabled := Value = abmNone;
    acModificarEvento.Enabled := (Value = abmNone) and (not sdqEventos.IsEmpty);
  end;
end;

procedure TfrmAgendaCargaConsulta.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not WS_CAPTION;
  WindowState := wsNormal; 
end;

procedure TfrmAgendaCargaConsulta.edAE_IDChange(Sender: TObject);
begin
  edID.Text := edAE_ID.Text;
end;

procedure TfrmAgendaCargaConsulta.edIDChange(Sender: TObject);
begin
  edAE_ID.Text := edID.Text;
end;

procedure TfrmAgendaCargaConsulta.ActualizoPorEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    fraVistaEventos.acActualizar.Execute;
end;

procedure TfrmAgendaCargaConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FormStorage.WriteInteger('ShowCmd', 1); // Nunca guardo otro WidnowState que no sea wsNormal
  FormStorage.WriteInteger('GridEventos_Width', fraVistaEventos.GridEventos.Width);
  FormStorage.WriteInteger('pnlDescripcionEvento_Height', fraVistaEventos.pnlDescripcionEvento.Height);
  FormStorage.WriteInteger('pnlDescripcionTarea_Height', fraVistaEventos.pnlDescripcionTarea.Height);    
end;

procedure TfrmAgendaCargaConsulta.fraIDSECTORALTAPropiedadesChange(Sender: TObject);
begin
  if rgCallCenter.ItemIndex = 1 then
    rgCallCenter.ItemIndex := 2;
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventosacEliminarEventoExecute(Sender: TObject);
begin
  inherited;
  fraVistaEventos.acEliminarEventoExecute(Sender);
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventosacModificarEventoExecute(Sender: TObject);
begin
  ModoABM := abmModificacion;
  try
    fraVistaEventos.acModificarEventoExecute(Sender);
  finally
    ModoABM := abmNone;
    ClearNotes;

    if Sesion.Sector <> 'CALLCENT' then
      OpenQueryEx(sdqEstadisticas, [Sesion.UserID]);
  end;
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventosacNuevoEventoExecute(Sender: TObject);
begin
  ModoABM := abmAlta;
  try
    Abrir(TfrmABMAgendaBaseEvento, frmABMAgendaBaseEvento, tmvNormal, nil);
    frmABMAgendaBaseEvento.RegisterNotes(edAE_CONTACTO_FULL_LIKE.Text, edAE_NUMEROTELEFONO_LIKE.Text, edAE_CORREOELECTRONICO_LIKE.Text);
    fraVistaEventos.acNuevoEventoExecute(Sender);
  finally
    ModoABM := abmNone;
    ClearNotes;             

    if Sesion.Sector <> 'CALLCENT' then
      OpenQueryEx(sdqEstadisticas, [Sesion.UserID]);
  end;
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventosedEstadoTareaClick(Sender: TObject);
begin
  ModoABM := abmModificacion;
  try
    fraVistaEventos.edEstadoTareaClick(Sender);
  finally
    ModoABM := abmNone;
  end;
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventosmnuExportarClick(Sender: TObject);
begin
 inherited;
  fraVistaEventos.mnuExportarClick(Sender);
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventossdqEventosAfterOpen(DataSet: TDataSet);
begin
  fraVistaEventos.sdqEventosAfterOpen(DataSet);
  with fraVistaEventos do
  begin
    lbEventos.Caption := 'Eventos (' + IntToStr(sdqEventos.RecordCount) + ')';

    if sdqEventos.RecordCount > 5000 then
      InfoHint(lbEventos, 'Tenga en cuenta que la consulta que acaba de ejecutar devolvió muchos eventos, considere utilizar mejores filtros para obtener resultados instantáneos.');

    if GridEventos.CanFocus then
      GridEventos.SetFocus;

    inherited;
  end;  
end;

procedure TfrmAgendaCargaConsulta.fraVistaEventossdqEventosAfterScroll(DataSet: TDataSet);
begin
  fraVistaEventos.sdqEventosAfterScroll(DataSet);

  if not FRefreshing then
    with fraVistaEventos do
    begin
      if sdqEventos.Active and not sdqEventos.IsEmpty then
        FIdTabla := sdqEventos.FieldByName('AE_ID').AsInteger
      else
        FIdTabla := ART_EMPTY_ID;
    end;
end;

procedure TfrmAgendaCargaConsulta.rgCallCenterClick(Sender: TObject);
begin
  if rgCallCenter.ItemIndex = 1 then
    fraIDSECTORALTA.Clear;
end;

procedure TfrmAgendaCargaConsulta.ControlFiltros(Sender: TObject);
begin
  with fraIDJEFATURA, fraIDJEFATURA.Propiedades do
  begin
    ExtraCondition := ' AND se_nivel = 3 ';

    if fraIDGERENCIA.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE = ' + SQLValue(fraIDGERENCIA.Codigo)
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT JEF.SE_IDSECTORPADRE ' +
                                                         ' FROM COMPUTOS.CSE_SECTOR JEF, ART.USE_USUARIOS USUARIOS, AGENDA.AAE_AGENDAEVENTO ' +
                                                        ' WHERE USUARIOS.SE_ID = AE_IDUSUARIO ' +
                                                          ' AND USUARIOS.SE_IDSECTOR = JEF.SE_ID) ';
  end;

  with fraIDSECTORALTA, fraIDSECTORALTA.Propiedades do
  begin
    ExtraCondition := ' AND se_nivel = 4 ';

    if fraIDJEFATURA.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE = ' + SQLValue(fraIDJEFATURA.Codigo)
    else if fraIDGERENCIA.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE IN (SELECT JEF.SE_ID ' +
                                                                     'FROM COMPUTOS.CSE_SECTOR JEF ' +
                                                                    'WHERE JEF.SE_IDSECTORPADRE = ' + SQLValue(fraIDGERENCIA.Codigo) + ') '
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT USUARIOS.SE_IDSECTOR ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS, AGENDA.AAE_AGENDAEVENTO ' +
                                                        ' WHERE USUARIOS.SE_ID = AE_IDUSUARIO) ';
  end;
(*
  with fraAE_USUALTA do
  begin
    ExtraCondition := ' AND ((se_fechabaja is null) or (se_fechabaja > art.actualdate - 365)) ' +
                      ' AND se_usuariogenerico = ''N'' ';

    if fraIDSECTORALTA.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTOR = ' + SQLValue(fraIDSECTORALTA.Codigo)
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT USUARIOS.SE_ID ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS, AGENDA.AAE_AGENDAEVENTO ' +
                                                        ' WHERE USUARIOS.SE_ID = AE_IDUSUARIO) ' +
                                         ' AND ((SE_IDSECTOR > 0) OR (SE_SECTOR = ''CALLCENT'')) ' +
                                         iif(rgCallCenter.ItemIndex = 1, ' AND SE_SECTOR = ''CALLCENT'' ', '');
  end;
*)  
end;

end.
