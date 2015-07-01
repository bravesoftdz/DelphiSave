unit unTraspasos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unFraCodigoDescripcion, ToolEdit,
  DateComboBox, CheckCombo, DBCheckCombo, Mask, unfraVendedores, unfraCtbTablas, unFraEntidades, Menus, PatternEdit,
  ComboEditor, IntEdit, FormPanel, unArtDBAwareFrame, CardinalEdit, Buttons, Excel2000, OleServer, Variants,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraUsuario, unfraUsuarios, AdvEdit, AdvEdBtn, AdvDirectoryEdit,
  unFraCodDesc, RxToolEdit, RxPlacemnt;

type
  TRecord = record
    CodigoEvento: String;
    Deuda: String;
    Errores: String;
    Fecha: String;
    NumeroFormulario: String;
    Periodo: String;
  end;

type
  TCuerpoArt = record
    CuerpoMail: String;
    idArt: Integer;
    sEmailArt: String;
    sNombreArt: String;
end;

type
   TfrmTraspasos = class(TfrmCustomConsulta)
    lbCUIT: TLabel;
    edSA_CUIT: TMaskEdit;
    edFO_FORMULARIO: TEdit;
    lbNFormulario: TLabel;
    lbRazonSocial: TLabel;
    edSA_NOMBRE: TArtComboBox;
    lbEstado: TLabel;
    edSA_ESTADO: TDBCheckCombo;
    lbFAfiliacionDesde: TLabel;
    edSA_FECHAAFILIACION_DESDE: TDateComboBox;
    lbFAfiliacionHasta: TLabel;
    edSA_FECHAAFILIACION_HASTA: TDateComboBox;
    lbFCargaDesde: TLabel;
    edSA_FECHAALTA_DESDE: TDateComboBox;
    lbFCargaHasta: TLabel;
    edSA_FECHAALTA_HASTA: TDateComboBox;
    lbEntidad: TLabel;
    fraEntidad: TfraEntidades; // TfraCodigoDescripcion;
    lbVendedor: TLabel;
    lbARTAnterior: TLabel;
    edSA_ARTANTERIOR: TDBCheckCombo;
    gbEventos: TGroupBox;
    lbFEventoDesde: TLabel;
    lbFEventoHasta: TLabel;
    edTI_FECHAIMPRESITUACION_DESDE: TDateComboBox;
    edTI_FECHAIMPRESITUACION_HASTA: TDateComboBox;
    lbEventos: TLabel;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    sdqBuscoNombre: TSDQuery;
    dsBuscoNombre: TDataSource;
    sdqARTAnt: TSDQuery;
    dsARTAnt: TDataSource;
    cbUltimoEvento: TCheckBox;
    fraEventos: TfraCtbTablas;
    fraVendedor: TfraVendedores;
    mnuImprimir: TPopupMenu;
    mnuGrilla: TMenuItem;
    mnuCarta: TMenuItem;
    GroupBox1: TGroupBox;
    chkPendientesImpresion: TRadioButton;
    cbVerSolicitudesEnTramite: TRadioButton;
    Label1: TLabel;
    edSA_NROINTERNO: TIntEdit;
    rbVerTodas: TRadioButton;
    chkEventosActivos: TCheckBox;
    fpFechaEnvio: TFormPanel;
    Label2: TLabel;
    cmbFechaEnvio: TDateComboBox;
    Bevel1: TBevel;
    btnAcepatar: TButton;
    btnCancelar: TButton;
    fpOpcionesImpresion: TFormPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    edCantCopias: TIntEdit;
    btnParar: TButton;
    cmbImpresoras: TComboBox;
    BarProgreso: TProgressBar;
    ToolButton1: TToolButton;
    tbCalcularTotal: TToolButton;
    Label3: TLabel;
    edTotal: TCardinalEdit;
    tbCargaMasivaAutomatica: TToolButton;
    fpCargaMasivaAutomatica: TFormPanel;
    Label4: TLabel;
    btnComenzar: TButton;
    edArchivo: TFilenameEdit;
    status: TStatusBar;
    ExcelApp: TExcelApplication;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    btnVerFormato: TBitBtn;
    btnCancelar2: TButton;
    lbVerErrores: TLabel;
    fpErrores: TFormPanel;
    memoErrores: TMemo;
    tbCargaMasivaEvento: TToolButton;
    fpCargaMasivaEvento: TFormPanel;
    fraCodigoUltimoEvento: TfraStaticCTB_TABLAS;
    Label5: TLabel;
    Label6: TLabel;
    edCodigoNuevoEvento: TEdit;
    btnComenzar2: TButton;
    btnCancelar3: TButton;
    status2: TStatusBar;
    Label9: TLabel;
    edFecha: TDateComboBox;
    sdqFaltante: TSDQuery;
    dsFaltante: TDataSource;
    Label13: TLabel;
    fraUsuarioRevision: TfraUsuarios;
    Label14: TLabel;
    edSA_FECHAREVISION_DESDE: TDateComboBox;
    edSA_FECHAREVISION_HASTA: TDateComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cboxRevision: TComboBox;
    Label12: TLabel;
    pnlRef: TPanel;
    pnlRojo: TPanel;
    Shape1: TShape;
    Panel2: TPanel;
    Shape2: TShape;
    Panel3: TPanel;
    Shape3: TShape;
    Panel5: TPanel;
    Shape5: TShape;
    Panel6: TPanel;
    Shape6: TShape;
    ToolButton2: TToolButton;
    tbReferencias: TToolButton;
    fraEjecutivoEntidad: TfraStaticCodigoDescripcion;
    Label15: TLabel;
    edDocFaltante: TCheckCombo;
    gbDirectorio: TGroupBox;
    mnuCartaMail: TMenuItem;
    tbCorreoElectronico: TToolButton;
    gbOpcionesEmail: TGroupBox;
    chkEnviarEmail: TCheckBox;
    edDirectorio: TAdvDirectoryEdit;
    fraUsuarioFirmante: TfraUsuarios;
    chkMostrarPreview: TCheckBox;
    GroupBox2: TGroupBox;
    cboxExpress: TComboBox;
    fraOrganizador: TfraCodDesc;
    Label16: TLabel;
    fraUsuarioAsignadoCarga: TfraUsuarios;
    Label17: TLabel;
    edSA_FECHARECEPCIONSECTORAFIDesde: TDateComboBox;
    Label18: TLabel;
    edSA_FECHARECEPCIONSECTORAFIHasta: TDateComboBox;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure onEntidadChange( Sender : TObject );
    procedure edSA_NOMBREDropDown(Sender: TObject);
    procedure edSA_CUITExit(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure edSA_NOMBRECloseUp(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure edFO_FORMULARIOExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure chkPendientesImpresionClick(Sender: TObject);
    procedure cbVerSolicitudesEnTramiteClick(Sender: TObject);
    procedure mnuCartaClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAcepatarClick(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnPararClick(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure edSA_CUITKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure tbCargaMasivaAutomaticaClick(Sender: TObject);
    procedure btnComenzarClick(Sender: TObject);
    procedure btnVerFormatoClick(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure lbVerErroresClick(Sender: TObject);
    procedure fpErroresKeyPress(Sender: TObject; var Key: Char);
    procedure fpCargaMasivaAutomaticaShow(Sender: TObject);
    procedure btnComenzar2Click(Sender: TObject);
    procedure CambiaCodigoUltimoEvento(Sender: TObject);
    procedure fpCargaMasivaEventoShow(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure tbCargaMasivaEventoClick(Sender: TObject);
    procedure tbReferenciasClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    {procedure mnuCartaMailClick(Sender: TObject);}
    procedure chkEnviarEmailClick(Sender: TObject);
    procedure tbCorreoElectronicoClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
  private
    FCancelarProceso: Boolean;
    FImprimeAutomatico: Boolean;
    FListaArt: TStringList;
    FPararImpresion: Boolean;
    FReImpresion: Boolean;
    FRegistros: Array of TRecord;

    function GetCountLineasExcel: Integer;
    function GetCuerpoMail: String;
    function IsEmptyLine(const aValor1, aValor2, aValor3, aValor4, aValor5: String): Boolean;
    function ReemplazarValoresCuerpoMail(const aIdCarta: Integer; aCuerpoMail: String): TCuerpoArt;

    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure CalcularFilas;
    procedure CargarImpresoras;
    procedure ConfigurarOpcionesImpresion(const aImprimir: Boolean);
    procedure DoGenerarCarta;
    procedure EnviarMail(const aIdCarta: Integer);
    procedure FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure GuardarEmail(const aCuerpoMail, aCodigoArt: String);
    procedure MostrarOpcionesImpresion(Sender: TObject);
  public
  end;

var
  frmTraspasos: TfrmTraspasos;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, StrFuncs, CustomDlgs, General, unCargaSolicitud,
  unModificaTraspasoIngresos, CUIT, unAfiGeneracionCartas, unART, unAfiliaciones, unCustomDataModule, Printers,
  unAfiCartasDoc, unEventosTraspasoIngreso, VCLExtra, unEnvioMail, unMoldeEnvioMail, unSeleccionDestinatarios,
  unElementosEnviados;

{$R *.DFM}

procedure TfrmTraspasos.FormCreate(Sender: TObject);
begin
  inherited;

  CoolBar.Height := 30;
  pnlRef.Visible := False;

  FListaArt := TStringList.Create;

  fraCodigoUltimoEvento.Clave          := 'EVTIN';
  fraCodigoUltimoEvento.ExtraCondition := ' AND tb_codigo IN (''001'', ''20'') ';
  fraCodigoUltimoEvento.OnChange       := CambiaCodigoUltimoEvento;

  with fraEjecutivoEntidad do
  begin
    TableName   := 'aec_ejecutivocuenta';
    FieldID     := 'ec_id';
    FieldCodigo := 'ec_id';
    FieldDesc   := 'ec_nombre';
    FieldBaja   := 'ec_fechabaja';
    ShowBajas   := False;
  end;

  fraUsuarioFirmante.ExtraCondition := 'AND se_usuario IN (''ASUAREZ'', ''CFIORELLI'')';


  fraEntidad.OnChange       := onEntidadChange;
  fraEntidad.ExtraCondition := ' AND en_entramite = ''N'' ';

  fraEventos.Clave         := 'EVTIN';
  fraEventos.CaseSensitive := False;

  tbCargaMasivaEvento.Left     := 109;
  tbCargaMasivaAutomatica.Left := 109;

  fraUsuarioAsignadoCarga.ExtraCondition := 'AND se_usuario IN (''AGONZALEZ'', ''LMAZZEI'', ''FPELLEGRINI'', ''FPINAR'', ''ELSILVA'', ''RBURGOS'')';
  fraUsuarioAsignadoCarga.ShowBajas := False;  //Cambiado segun ticket 62035

  fraUsuarioRevision.ExtraCondition := 'AND se_usuario IN (SELECT se_usuario ' +
                                                                '   FROM use_usuarios ' +
                                                                '  WHERE se_sector IN (''AFI'', ''ATCLI'', ''AFINOM'') ' +
                                                                '  AND se_fechabaja IS NULL) ';
  fraUsuarioRevision.ShowBajas := False;


  OpenQuery(sdqEstado);
  OpenQuery(sdqARTAnt);
  OpenQuery(sdqBuscoNombre);
end;

procedure TfrmTraspasos.onEntidadChange(Sender: TObject);
begin
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmTraspasos.edSA_CUITExit(Sender: TObject);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  inherited;

  // Si CUIT vacío o ya seleccionado, abortar
  if (edSA_CUIT.Text = '') or (edSA_CUIT.Text = sdqBuscoNombre.FieldByName('sa_cuit').AsString) then
    Exit;

  // Si CUIT incorrecto, avisar y abortar
  Verificar((not CUIT.IsCuit(edSA_CUIT.Text)), edSA_CUIT, 'La C.U.I.T. ingresada es errónea.');

  sSql :=
    'SELECT   sa_nombre, fo_formulario' +
       ' FROM asa_solicitudafiliacion, afo_formulario' +
      ' WHERE sa_idformulario = fo_id' +
        ' AND sa_cuit = :v1' +
   ' ORDER BY sa_idformulario DESC';
  aQuery := GetQueryEx(sSql, [edSA_CUIT.Text]);
  try
    if not aQuery.IsEmpty then
    begin
      edFO_FORMULARIO.Text := aQuery.FieldByName('fo_formulario').AsString;
      edSA_NOMBRE.Text     := aQuery.FieldByName('sa_nombre').AsString;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmTraspasos.edFO_FORMULARIOExit(Sender: TObject);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  inherited;

  sSql :=
    'SELECT sa_cuit, sa_nombre' +
     ' FROM asa_solicitudafiliacion, afo_formulario' +
    ' WHERE sa_idformulario = fo_id' +
      ' AND fo_formulario = :p1';
  aQuery := GetQueryEx(sSql, [edFO_FORMULARIO.Text]);
  try
    if not aQuery.IsEmpty then
    begin
      edSA_CUIT.Text   := aQuery.FieldByName('sa_cuit').asString;
      edSA_NOMBRE.Text := aQuery.FieldByName('sa_nombre').AsString;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmTraspasos.edSA_NOMBREDropDown(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  sdqBuscoNombre.Close;

  sSql :=
    'SELECT sa_id, sa_cuit, sa_nombre, fo_formulario' +
     ' FROM xen_entidad, xve_vendedor, ctb_tablas t1, ctb_tablas t2, ctb_tablas t3, afo_formulario,' +
          ' asa_solicitudafiliacion, xev_entidadvendedor' +
    ' WHERE t1.tb_fechabaja IS NULL' +
      ' AND t2.tb_fechabaja IS NULL' +
      ' AND t3.tb_fechabaja IS NULL' +
      ' AND sa_identidadvendedor = ev_id(+)' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND ev_identidad = en_id(+)' +
      ' AND t1.tb_clave = ''ORSOL''' +
      ' AND t1.tb_codigo = sa_origen' +
      ' AND fo_id = sa_idformulario' +
      ' AND t2.tb_clave = ''ESSOL''' +
      ' AND t2.tb_codigo = sa_estado' +
      ' AND t3.tb_clave(+) = ''MOTIA''' +
      ' AND t3.tb_codigo(+) = sa_motivoalta';

  if not ((sdqBuscoNombre.Active and
          (sdqBuscoNombre.FieldByName('sa_nombre').AsString = edSA_NOMBRE.Text) or (edSA_NOMBRE.Text = ''))) then
    sSql := sSql + ' AND sa_nombre LIKE ' +  SQL_QUOTE + edSA_NOMBRE.Text + SQL_WILLCARD + SQL_QUOTE;
  OpenQuery(sdqBuscoNombre, sSql, True);
end;

procedure TfrmTraspasos.edSA_NOMBRECloseUp(Sender: TObject);
begin
  inherited;

  if edSA_NOMBRE.Text = '' then
  begin
    edSA_CUIT.Text := '';
    edFO_FORMULARIO.Text := '';
  end
  else
  begin
    edSA_CUIT.Text := sdqBuscoNombre.FieldByName('sa_cuit').AsString;
    edFO_FORMULARIO.Text := sdqBuscoNombre.FieldByName('fo_formulario').AsString;
  end;
end;

procedure TfrmTraspasos.tbRefrescarClick(Sender: TObject);
var
  iLoop: Integer;
  sDocFaltante: String;
  sSql: String;
  sUnion: String;
  sWhere: String;
begin
  // Armo el string para filtrar por documentacion faltante
  for iLoop := 0 to edDocFaltante.Items.Count -1 do
  begin
   if edDocFaltante.Checked[iLoop] then
     sDocFaltante := sDocFaltante + '%' + edDocFaltante.Items.Strings[iLoop]
  end;
  if sDocFaltante <> '' then
    sDocFaltante := sDocFaltante + '%';


  sSql :=
    'SELECT ti_id, sa_nrointerno, sa_id, sa_cuit, sa_nombre, sa_estado || ''-'' || t3.tb_descripcion estado,' +
          ' sa_fechaafiliacion, t1.tb_descripcion motivo_alta, ar_nombre art_anterior, fo_formulario,' +
          ' sa_idartanterior, sa_idactividad, sa_nivel, sa_sumafija, sa_alicuotapesos, sa_porcmasa, sa_alicuotaporc,' +
          ' sa_masatotal, sa_totempleados, en_id, en_nombre entidad, ve_vendedor, ve_nombre vendedor,' +
          ' ''N'' solo_lectura, ti_fecha, ti_codigo, ev.tb_descripcion evento, ev.tb_especial1 idtextocarta, ti_deuda,' +
          ' ti_idformulario, ti_idcarta, cca.ca_nrocartadoc, ht_nombre tc_nombre, correo.tb_descripcion correo,' +
          ' cca.ca_observaciones, NVL(cca.ca_usureimpresion, cca.ca_usuimpresion) uimpresion,' +
          ' NVL(cca.ca_fechareimpresion, cca.ca_fechaimpresion) fimpresion, cca.ca_recepcionok, cca.ca_fecharecepcion,' +
          ' codre.tb_descripcion tipo_recepcion, aca.ca_codigo codigocanal, aca.ca_descripcion canal, sa_calle_post,' +
          ' sa_numero_post, sa_piso_post, sa_departamento_post, sa_cpostal_post, sa_cpostala_post, sa_localidad_post,' +
          ' pv_descripcion, DECODE(sa_presentorgrl, ''T'', ''SI'', ''NO'') fgrl,' +
          ' DECODE(INSTR(NVL(sa_dnifirmado, ''''), ''T''),' +
                 ' 0, DECODE(INSTR(NVL(sa_dnifirmado, ''''), ''V''), 0, ''NO'', ''V''),' +
                 ' DECODE(INSTR(NVL(sa_dnifirmado, ''''), ''V''), 0, ''A'', ''C'')) dnipoder,' +
          ' en_codbanco, el_nombre, su_descripcion, orsol.tb_descripcion orsol,' +
          ' DECODE(afiliacion.falta_doc_solicitud(sa_id),'''',''OK'', afiliacion.falta_doc_solicitud(sa_id)) faltarenglon, ' +
          ' sa_usurevision, sa_fecharevision, ' +
          ' sa_hojaslegajos, t1.tb_descripcion motivoalta, ec_nombre, sa_motivoalta, ac_descripcion, ac_codigo,' +
          ' DECODE(sa_recepcionexpress,''S'', ''Sí'', ''No'') express,' +
          ' sa_usumodif, sa_usuarioasignadocarga,' +
          ' (SELECT express.ae_usuario' +
              ' FROM afi.aae_audit_recepcion_express express' +
             ' WHERE express.ae_id = (SELECT MIN(m_express.ae_id)' +
                                      ' FROM afi.aae_audit_recepcion_express m_express' +
                                     ' WHERE m_express.ae_idformulario = sa_idformulario)) as usuario_express, observacion_express,' +
          ' (SELECT     en_nombre' +
          '     FROM xgo_granorganizador, xen_entidad' +
          '    WHERE go_identorganizador = en_id' +
          '      AND go_fechabaja IS NULL' +
          '      AND go_fechaaprobado IS NOT NULL' +
          '      AND LEVEL = 1' +
          '    START WITH go_identidad = ev_identidad' +
          '    CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador'  +
     ' FROM ctb_tablas t1, aar_art, ctb_tablas t3, ctb_tablas ev, xen_entidad, xve_vendedor, asa_solicitudafiliacion,' +
          ' afo_formulario, ati_traspasoingreso, xev_entidadvendedor, cca_carta cca, comunes.cht_historicotextocarta,' +
          ' ctb_tablas codre, ctb_tablas correo, ctb_tablas orsol, aca_canal aca, cpv_provincias, del_delegacion,' +
          ' asu_sucursal, aec_ejecutivocuenta, cac_actividad' +
    ' WHERE fo_id = ti_idformulario' +
      ' AND sa_idformulario = fo_id' +
      ' AND sa_identidadvendedor = ev_id(+)' +
      ' AND ev_idvendedor = ve_id(+)' +
      ' AND ev_identidad = en_id(+)' +
      ' AND t1.tb_clave(+) = ''MOTIA''' +
      ' AND t1.tb_codigo(+) = sa_motivoalta' +
      ' AND sa_idartanterior = ar_id(+)' +
      ' AND t3.tb_clave = ''ESSOL''' +
      ' AND t3.tb_codigo = sa_estado' +
      ' AND sa_idformulario = ti_idformulario(+)' +
      ' AND ev.tb_clave(+) = ''EVTIN''' +
      ' AND ti_codigo = ev.tb_codigo(+)' +
      ' AND SUBSTR(t3.tb_especial1, 8, 1) = ''S''' +
      ' AND ti_idcarta = cca.ca_id(+)' +
      ' AND cca.ca_idhistoricotextocarta = ht_id(+)' +
      ' AND correo.tb_clave(+) = ''CORRE''' +
      ' AND NVL(cca.ca_correoreimpresion, cca.ca_correo) = correo.tb_codigo(+)' +
      ' AND orsol.tb_clave(+) = ''ORSOL''' +
      ' AND sa_origen = orsol.tb_codigo(+)' +
      ' AND codre.tb_clave(+) = ''CODRE''' +
      ' AND cca.ca_codrecepcion = codre.tb_codigo(+)' +
      ' AND en_idcanal = aca.ca_id(+)' +
      ' AND sa_provincia_post = pv_codigo(+)' +
      ' AND ve_iddelegacion = el_id(+)' +
      ' AND sa_idsucursal = su_id(+)' +
      ' AND en_idejecutivo = ec_id(+)' +
      ' AND (sa_fecharecepcionsectorafi IS NOT NULL OR sa_fecharecepcionfaxemail IS NOT NULL)' +
      ' AND sa_idactividad = ac_id(+)';

  // FILTROS
  sWhere := '';

  if not(edSA_FECHAREVISION_DESDE.IsEmpty) then
  begin
    if not edSA_FECHAREVISION_HASTA.IsEmpty then
    begin
      sWhere := sWhere + ' AND sa_fecharevision >= ' + SqlDate(edSA_FECHAREVISION_DESDE.Date);
      sWhere := sWhere + ' AND sa_fecharevision <= ' + SqlDate(edSA_FECHAREVISION_HASTA.Date);
    end
    else
      sWhere := sWhere + ' AND sa_fecharevision >= ' + SqlDate(edSA_FECHAREVISION_DESDE.Date);
  end
  else
    if not edSA_FECHAREVISION_HASTA.IsEmpty then
      sWhere := sWhere + ' AND sa_fecharevision <= ' + SqlDate(edSA_FECHAREVISION_HASTA.Date);

  if not(edSA_FECHARECEPCIONSECTORAFIDesde.IsEmpty) then
  begin
    if not edSA_FECHARECEPCIONSECTORAFIHasta.IsEmpty then
    begin
      sWhere := sWhere + ' AND sa_fecharecepcionsectorafi >= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIDesde.Date);
                           //   ' OR sa_fecharecepcionfaxemail >= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIDesde.Date) + ')';

      sWhere := sWhere + ' AND sa_fecharecepcionsectorafi <= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIHasta.Date)
                            //  ' OR sa_fecharecepcionfaxemail >= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIHasta.Date) + ')';
    end
    else
      sWhere := sWhere + ' AND sa_fecharecepcionsectorafi >= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIDesde.Date)
                            //  ' OR sa_fecharecepcionfaxemail >= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIDesde.Date) + ')';
  end
  else
    if not edSA_FECHARECEPCIONSECTORAFIHasta.IsEmpty then
      sWhere := sWhere + ' AND sa_fecharecepcionsectorafi <= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIHasta.Date);
                        // ' OR sa_fecharecepcionfaxemail >= ' + SqlDate(edSA_FECHARECEPCIONSECTORAFIHasta.Date) + ')';


  if (cboxRevision.ItemIndex <> -1) and (cboxRevision.ItemIndex <> 2) then
    if cboxRevision.ItemIndex = 0 then //Si
      sWhere := sWhere + ' AND sa_usurevision IS NOT NULL'
    else                               //NO
      sWhere := sWhere + ' AND sa_usurevision IS NULL';

  if Not(fraUsuarioRevision.IsEmpty) then
    sWhere := sWhere + ' AND sa_usurevision =' + SqlValue(fraUsuarioRevision.Codigo);

  if Not(fraUsuarioAsignadoCarga.IsEmpty) then
    sWhere := sWhere + ' AND sa_usuarioasignadocarga =' + SqlValue(fraUsuarioAsignadoCarga.Codigo);

  if sDocFaltante <> '' then
    sWhere := sWhere + ' AND art.afiliacion.falta_doc_solicitud(sa_id) LIKE ''' + sDocFaltante + '''';


  // AND SA_ESTADO IN (:ESTADO)
  if edSA_ESTADO.Text <> '' then
    sWhere := sWhere + ' AND sa_estado ' +  edSA_ESTADO.InSql;

  // AND SA_ARANTERIOR IN (:ART)
  if edSA_ARTANTERIOR.Text <> '' then
    sWhere := sWhere + ' AND sa_idartanterior ' +  edSA_ARTANTERIOR.InSql;

  // AND SA_FECHAAFILIACION >=:DAFIL AND SA_FECHAAFILIACION <= :HAFIL
  if not edSA_FECHAAFILIACION_DESDE.IsEmpty then
    sWhere := sWhere + ' AND sa_fechaafiliacion >= ' + SqlDate(edSA_FECHAAFILIACION_DESDE.Date);
  if not edSA_FECHAAFILIACION_HASTA.IsEmpty then
    sWhere := sWhere + ' AND sa_fechaafiliacion <= ' + SqlDate(edSA_FECHAAFILIACION_HASTA.Date);

  // AND SA_FECHAALTA >=:DALTA AND SA_FECHAALTA <= :HALTA
  if not edSA_FECHAALTA_DESDE.IsEmpty then
    sWhere := sWhere + ' AND sa_fechaalta >= ' + SqlDate(edSA_FECHAALTA_DESDE.Date);
  if not edSA_FECHAALTA_HASTA.IsEmpty then
    sWhere := sWhere + ' AND sa_fechaalta <= ' + SqlDate(edSA_FECHAALTA_HASTA.Date);

  // AND SA_IDVENDEDOR = VE_ID AND VE_IDENTIDAD = :ENTIDAD
  if not fraEntidad.IsEmpty then
    sWhere := sWhere + ' AND sa_identidadvendedor = ev_id' +
                       ' AND ev_identidad = ' + SqlValue(fraEntidad.Value) +
                       ' AND en_entramite = ''N'' ';

  // AND SA_IDVENDEDOR = VE_ID AND VE_VENDEDOR = :VENDEDOR
  if not fraVendedor.IsEmpty then
    sWhere := sWhere + ' AND sa_identidadvendedor = ev_id' +
                       ' AND ev_idvendedor = ' + SqlValue(fraVendedor.Value);

  if not fraEjecutivoEntidad.IsEmpty then
    sWhere := sWhere + ' AND ec_id =' + SqlValue(fraEjecutivoEntidad.Codigo);
                       
  //MANEJA LOS EVENTOS
  if cbUltimoEvento.Checked then
  begin
    if fraEventos.IsEmpty then
    begin
      sWhere := sWhere + ' AND ti_id = (SELECT MAX(ti_id)' +
                                        ' FROM ati_traspasoingreso ati' +
                                       ' WHERE ati.ti_idformulario = ati_traspasoingreso.ti_idformulario';
      if not edTI_FECHAIMPRESITUACION_DESDE.IsEmpty then
        sWhere := sWhere + ' AND ti_fecha >= ' + SqlDate( edTI_FECHAIMPRESITUACION_DESDE.Date);
      if not edTI_FECHAIMPRESITUACION_HASTA.IsEmpty then
        sWhere := sWhere + ' AND ti_fecha <= ' + SqlDate( edTI_FECHAIMPRESITUACION_HASTA.Date);
      sWhere := sWhere + ' )';
    end
    else
    begin
      sWhere := sWhere + ' AND ti_id = (SELECT MAX(ti_id) ' +
                                        ' FROM ati_traspasoingreso ati' +
                                       ' WHERE ati.ti_idformulario = ati_traspasoingreso.ti_idformulario)' +
                         ' AND ti_codigo = ' + SqlValue(fraEventos.Value);
      if not edTI_FECHAIMPRESITUACION_DESDE.IsEmpty then
        sWhere := sWhere + ' AND ti_fecha >= ' + SqlDate( edTI_FECHAIMPRESITUACION_DESDE.Date);
      if not edTI_FECHAIMPRESITUACION_HASTA.IsEmpty then
        sWhere := sWhere + ' AND ti_fecha <= ' + SqlDate( edTI_FECHAIMPRESITUACION_HASTA.Date);
    end;
  end
  else
  begin
    if not fraEventos.IsEmpty then
      sWhere := sWhere + ' AND ti_codigo = ' + SqlValue(fraEventos.Value);
    if not edTI_FECHAIMPRESITUACION_DESDE.IsEmpty then
      sWhere := sWhere + ' AND ti_fecha >= ' + SqlDate( edTI_FECHAIMPRESITUACION_DESDE.Date);
    if not edTI_FECHAIMPRESITUACION_HASTA.IsEmpty then
      sWhere := sWhere + ' AND ti_fecha <= ' + SqlDate( edTI_FECHAIMPRESITUACION_HASTA.Date);
  end;

  // AND FO_ID = TI_IDFORMULARIO
  if edFO_FORMULARIO.Text <> '' then
    sWhere := sWhere + ' AND fo_formulario = ' + SqlString(edFO_FORMULARIO.Text, True);
  if chkPendientesImpresion.Checked then
    sWhere := sWhere + ' AND ca_fechaimpresion IS NULL ';
  if not edSA_NROINTERNO.IsEmpty then
    sWhere := sWhere + ' AND sa_nrointerno = ' + SqlValue(edSA_NROINTERNO.Value);

  if chkEventosActivos.Checked then
    sWhere := sWhere + ' AND ti_fechabaja IS NULL';

  if (cboxExpress.ItemIndex <> -1) and (cboxExpress.ItemIndex <> 2) then
    if cboxExpress.ItemIndex = 0 then //Si
      sWhere := sWhere + ' AND sa_recepcionexpress = ''S'''
    else                               //NO
      sWhere := sWhere + ' AND sa_recepcionexpress <> ''S''';

  if not fraOrganizador.IsEmpty then
    sWhere := sWhere + ' AND ev_identidad IN ( SELECT go_identidad' +
                                              ' FROM xgo_granorganizador' +
                                             ' WHERE go_fechabaja IS NULL' +
                                               ' AND go_fechaaprobado IS NOT NULL' +
                                               ' AND LEVEL = 1' +
                                        ' START WITH go_identorganizador = ' + SqlValue(fraOrganizador.Value) +
                                  ' CONNECT BY NOCYCLE PRIOR go_identidad = go_identorganizador)';

  // UNION
  sUnion := ' ';
  if cbVerSolicitudesEnTramite.Checked then
  begin
    sUnion := sUnion +
      ' UNION ALL ' +
      'SELECT ti_id, sa_nrointerno, sa_id, sa_cuit, sa_nombre, sa_estado || ''-'' || t3.tb_descripcion estado,' +
            ' sa_fechaafiliacion, t1.tb_descripcion motivo_alta, ar_nombre art_anterior, fo_formulario,' +
            ' sa_idartanterior, sa_idactividad, sa_nivel, sa_sumafija, sa_alicuotapesos, sa_porcmasa, sa_alicuotaporc,' +
            ' sa_masatotal, sa_totempleados, en_id, en_nombre entidad, ve_vendedor, ve_nombre vendedor,' +
            ' ''S'' solo_lectura, ti_fecha, ti_codigo, ev.tb_descripcion evento, ev.tb_especial1 idtextocarta,' +
            ' ti_deuda, ti_idformulario, ti_idcarta, cca.ca_nrocartadoc, ht_nombre tc_nombre,' +
            ' correo.tb_descripcion correo, cca.ca_observaciones,' +
            ' NVL(cca.ca_usureimpresion, cca.ca_usuimpresion) uimpresion,' +
            ' NVL(cca.ca_fechareimpresion, cca.ca_fechaimpresion) fimpresion, cca.ca_recepcionok,' +
            ' cca.ca_fecharecepcion, codre.tb_descripcion tipo_recepcion, aca.ca_codigo codigocanal,' +
            ' aca.ca_descripcion canal, sa_calle_post, sa_numero_post, sa_piso_post, sa_departamento_post,' +
            ' sa_cpostal_post, sa_cpostala_post, sa_localidad_post, pv_descripcion,' +
            ' DECODE(sa_presentorgrl, ''T'', ''SI'', ''NO'') fgrl,' +
            ' DECODE(INSTR(NVL(sa_dnifirmado, ''''), ''T''),' +
                   ' 0, DECODE(INSTR(NVL(sa_dnifirmado, ''''), ''V''), 0, ''NO'', ''V''),' +
                   ' DECODE(INSTR(NVL(sa_dnifirmado, ''''), ''V''), 0, ''A'', ''C'')) dnipoder,' +
            ' en_codbanco, el_nombre, su_descripcion, orsol.tb_descripcion orsol,' +
            ' DECODE(afiliacion.falta_doc_solicitud(sa_id),'''',''OK'', afiliacion.falta_doc_solicitud(sa_id)) faltarenglon, ' +
            ' sa_usurevision, sa_fecharevision, ' +
            ' sa_hojaslegajos, t1.tb_descripcion motivoalta, ec_nombre, sa_motivoalta, ' +
            ' ac_descripcion, ac_codigo, ' +
            ' DECODE(sa_recepcionexpress,''S'', ''Sí'', ''No'') express,'+
            ' sa_usumodif, sa_usuarioasignadocarga,' +
            ' (SELECT express.ae_usuario' +
            '    FROM afi.aae_audit_recepcion_express express' +
            '   WHERE express.ae_id = (SELECT MIN(m_express.ae_id)' +
                                      ' FROM afi.aae_audit_recepcion_express m_express' +
                                     ' WHERE m_express.ae_idformulario = sa_idformulario)) as usuario_express, observacion_express, ' +
          ' (SELECT     en_nombre' +
          '     FROM xgo_granorganizador, xen_entidad' +
          '    WHERE go_identorganizador = en_id' +
          '      AND go_fechabaja IS NULL' +
          '      AND go_fechaaprobado IS NOT NULL' +
          '      AND LEVEL = 1' +
          '    START WITH go_identidad = ev_identidad' +
          '    CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador' +
       ' FROM ctb_tablas t1, aar_art, ctb_tablas t3, ctb_tablas ev, xen_entidad, xve_vendedor,' +
            ' asa_solicitudafiliacion, afo_formulario, ati_traspasoingreso, xev_entidadvendedor, cca_carta cca,' +
            ' comunes.cht_historicotextocarta, ctb_tablas codre, ctb_tablas correo, ctb_tablas orsol, aca_canal aca,' +
            ' cpv_provincias, del_delegacion, asu_sucursal, aec_ejecutivocuenta, cac_actividad' +
      ' WHERE fo_id = ti_idformulario' +
        ' AND sa_idformulario = fo_id' +
        ' AND sa_identidadvendedor = ev_id(+)' +
        ' AND ev_idvendedor = ve_id(+)' +
        ' AND ev_identidad = en_id(+)' +
        ' AND t1.tb_clave(+) = ''MOTIA''' +
        ' AND t1.tb_codigo(+) = sa_motivoalta' +
        ' AND sa_idartanterior = ar_id(+)' +
        ' AND t3.tb_clave = ''ESSOL''' +
        ' AND t3.tb_codigo = sa_estado' +
        ' AND sa_idformulario = ti_idformulario(+)' +
        ' AND ev.tb_clave(+) = ''EVTIN''' +
        ' AND ti_codigo = ev.tb_codigo(+)' +
        ' AND SUBSTR(t3.tb_especial1, 8, 1) <> ''S''' +
        ' AND ti_idcarta = cca.ca_id(+)' +
        ' AND cca.ca_idhistoricotextocarta = ht_id(+)' +
        ' AND correo.tb_clave(+) = ''CORRE''' +
        ' AND NVL(cca.ca_correoreimpresion, cca.ca_correo) = correo.tb_codigo(+)' +
        ' AND orsol.tb_clave(+) = ''ORSOL''' +
        ' AND sa_origen = orsol.tb_codigo(+)' +
        ' AND codre.tb_clave(+) = ''CODRE''' +
        ' AND cca.ca_codrecepcion = codre.tb_codigo(+)' +
        ' AND en_idcanal = aca.ca_id(+)' +
        ' AND sa_provincia_post = pv_codigo(+)' +
        ' AND ve_iddelegacion = el_id(+)' +
        ' AND sa_idsucursal = su_id(+)' +
        ' AND en_idejecutivo = ec_id(+)' +
        ' AND sa_idactividad = ac_id(+)' +
        ' AND (sa_fecharecepcionsectorafi IS NOT NULL OR sa_fecharecepcionfaxemail IS NOT NULL)';

    sUnion := sUnion + sWhere;
  end;

  sdqConsulta.SQL.Text := sSql + sWhere + sUnion + SortDialog.OrderBy;

  tbNuevo.Enabled := False;

  inherited;

  CalcularFilas;

  if sdqConsulta.IsEmpty then
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención')
  else
  begin
    tbNuevo.Enabled := True;
    tbModificar.Enabled := (sdqConsulta.FieldByName('solo_lectura').AsString = 'N');
    VCLExtra.LockControls(gbDirectorio, (fraEventos.Codigo <> '002'));
    if fraEventos.Codigo <> '002' then
      edDirectorio.Clear;
  end;
end;

procedure TfrmTraspasos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSA_CUIT.Clear;
  edSA_NOMBRE.Clear;
  edFO_FORMULARIO.Clear;
  edSA_NROINTERNO.Clear;
  edSA_ESTADO.Clear;
  edSA_ARTANTERIOR.Clear;
  edSA_FECHAAFILIACION_DESDE.Clear;
  edSA_FECHAAFILIACION_HASTA.Clear;
  edSA_FECHAALTA_DESDE.Clear;
  edSA_FECHAALTA_HASTA.Clear;
  fraEntidad.Clear;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraVendedor.Clear;
  fraEjecutivoEntidad.Clear;
  rbVerTodas.Checked := True;
  edTI_FECHAIMPRESITUACION_DESDE.Clear;
  edTI_FECHAIMPRESITUACION_HASTA.Clear;
  cbUltimoEvento.Checked := true;
  fraEventos.Clear;
  edDirectorio.Clear;
  fraOrganizador.Clear;
  fraUsuarioAsignadoCarga.Clear;
  edSA_FECHARECEPCIONSECTORAFIDesde.Clear;
  edSA_FECHARECEPCIONSECTORAFIHasta.Clear;
end;

procedure TfrmTraspasos.tbNuevoClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    frmCargaSolicitudes.Free;
    frmCargaSolicitudes := TfrmCargaSolicitudes.Create(frmPrincipal);
    frmCargaSolicitudes.Mostrar(False);
    frmCargaSolicitudes.DoCargaDatosSolicitud(sdqConsulta.FieldByName('sa_id').AsInteger);
  end;
end;

procedure TfrmTraspasos.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    frmModificaTraspasoIngresos.Free;
    frmModificaTraspasoIngresos := TfrmModificaTraspasoIngresos.Create(frmPrincipal);
    frmModificaTraspasoIngresos.DoCargaDatos(sdqConsulta.FieldByName('sa_id').AsInteger);
  end;
end;

procedure TfrmTraspasos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmTraspasos.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  tbModificar.Enabled := sdqConsulta.FieldByName('solo_lectura').AsString = 'N';
end;

procedure TfrmTraspasos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FListaArt.Free;

  inherited;
end;

procedure TfrmTraspasos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with sdqConsulta do
    if (Active) and (not Eof) then
    begin
      FieldByName('sa_sumafija').OnGetText  := FormateaTexto;
      FieldByName('sa_masatotal').OnGetText := FormateaTexto;
      FieldByName('sa_porcmasa').OnGetText  := FormateaTexto;
      FieldByName('ti_deuda').OnGetText     := FormateaTexto;
    end;
end;

procedure TfrmTraspasos.FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  try
    if ((Sender.FieldName = 'sa_sumafija') or (Sender.FieldName = 'ti_deuda') or (Sender.FieldName = 'sa_masatotal')) then
      Text := CurrToStrF(StrToCurr(Sender.AsString), ffCurrency, 2)
    else if (Sender.FieldName = 'sa_porcmasa') then
      Text := CurrToStrF(StrToCurr(Sender.AsString), ffNumber, 3)
    else
      Text := Sender.AsString;
  except
    Text := Sender.AsString;
  end;
end;

procedure TfrmTraspasos.chkPendientesImpresionClick(Sender: TObject);
begin
  if cbVerSolicitudesEnTramite.Checked then
    cbVerSolicitudesEnTramite.Checked := False;
end;

procedure TfrmTraspasos.cbVerSolicitudesEnTramiteClick(Sender: TObject);
begin
  if chkPendientesImpresion.Checked then
    chkPendientesImpresion.Checked := False;
end;

procedure TfrmTraspasos.mnuCartaClick(Sender: TObject);
var
  aResults: TStringList;
  iCantRegistros: Integer;
  iLoop: Integer;
  sCodPrevio: String;
  sSql: String;
begin
  if Sender = mnuCartaMail then
  begin
    Verificar(edDirectorio.Color <> clWindow , fraEventos, 'Seleccione solo tipos de eventos 002 para esta funcionalidad');
    Verificar(edDirectorio.Text = '', edDirectorio, 'Por favor, seleccione un directorio para guardar los e-mails generados para eventos 002');
  end;

  iCantRegistros := Grid.SelectedRows.Count;
  if iCantRegistros = 0 then
    raise Exception.Create('Debe elegir al menos un registro.');
  FReimpresion := False;

  //Chequeo si se debe re-imprimir o generar un nuevo registro
  for iLoop := 0 to iCantRegistros - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));
    if iLoop = 0 then
      FReimpresion := (sdqConsulta.FieldByName('ti_idcarta').AsString <> '')
    else
      if FReimpresion <> (sdqConsulta.FieldByName('ti_idcarta').AsString <> '') then
        raise Exception.Create('No se pueden elegir registros para reimprimir junto con aquellos que no tienen carta.');
  end;

  if FReimpresion then
  begin
    FPararImpresion := False;
    MostrarOpcionesImpresion(Sender);
  end
  else
  begin
    //Chequeo que todas las cartas correspondan al mismo codigo
    sCodPrevio := '';
    for iLoop := 0 to iCantRegistros - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));
      if sCodPrevio = '' then
        sCodPrevio  := sdqConsulta.FieldByName('ti_codigo').AsString
      else if sCodPrevio <> sdqConsulta.FieldByName('ti_codigo').AsString then
        raise Exception.Create('Las cartas que se generan deben poseer el mismo evento.');
    end;

    //Se fija si este evento tiene asociadas cartas documento o no
    sSql :=
      'SELECT tc_id, tc_rpt' +
       ' FROM ctb_tablas, ctc_textocarta' +
      ' WHERE tc_id = tb_especial1' +
        ' AND tb_clave = ''EVTIN''' +
        ' AND tb_codigo = ' + SqlValue(sCodPrevio);
    aResults := ValoresColSql(sSql);
    try
      Verificar((aResults[0] = ''), nil, 'Este evento no tiene asociado un texto para la carta.');

      //Imprime automatico si tiene TC_RPT <> NULL
      FImprimeAutomatico := not (aResults[1] = '');
    finally
      aResults.Free;
    end;

    //Si tiene que imprimir automaticamente genera el vector con las ARTs
    if FImprimeAutomatico then
    begin
      FListaArt.Clear;
      for iLoop := 0 to iCantRegistros - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

        // Se agrega la info a la matriz con IDs y ARTs
        FListaArt.Add(sdqConsulta.FieldByName('sa_idartanterior').AsString + '=' + sdqConsulta.FieldByName('ti_id').AsString);
      end;
    end;

    //Muestra el cuadro de opciones de impresion
    MostrarOpcionesImpresion(Sender);
  end;
end;

procedure TfrmTraspasos.mnuGrillaClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmTraspasos.btnCancelarClick(Sender: TObject);
begin
  fpFechaEnvio.ModalResult := mrCancel;
end;

procedure TfrmTraspasos.btnAcepatarClick(Sender: TObject);
begin
  if cmbFechaEnvio.IsEmpty then
    raise Exception.Create('La fecha de envío es obligatoria.');

  fpFechaEnvio.ModalResult := mrOk;
end;

procedure TfrmTraspasos.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla: TPopUpMenu;
  Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
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
      Item.Caption := '(Consulta sin datos...)';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmTraspasos.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmTraspasos.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmTraspasos.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmTraspasos.btnPararClick(Sender: TObject);
begin
  FPararImpresion  := True;
  btnParar.Enabled := False;
end;

procedure TfrmTraspasos.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmTraspasos.btnAceptarImpresionClick(Sender: TObject);
var
  aIdCarta: TTableId;
  aListaIds: TStringList;
  iLoop: Integer;
  iCantRegistros: Integer;
  iOldImpresora: Integer;
begin
  iOldImpresora := Printer.PrinterIndex;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  btnParar.Enabled := True;
  if chkEnviarEmail.Checked then
    Verificar(fraUsuarioFirmante.IsEmpty, fraUsuarioFirmante, 'Debe elegir un firmante para el e-Mail');

  try
    if FReimpresion then
    begin
      aListaIds := TStringList.Create;
      try
        iCantRegistros := Grid.SelectedRows.Count;
        aListaIds.Duplicates := dupIgnore;
        aListaIds.Sorted := True;
        for iLoop := 0 to iCantRegistros - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          aListaIds.Add(sdqConsulta.FieldByName('ti_idcarta').AsString);
        end;
        for iLoop := 0 to aListaIds.Count - 1 do
        begin
          if FPararImpresion then
            raise Exception.Create('Ha decidido cancelar la impresión.');

          aIdCarta := StrToInt(aListaIds[iLoop]);
          with TAfiCartasDoc.Create do
          try
            if not chkMostrarPreview.Visible then //si vienen del boton carta imprimo segun el radiobutton
              MostrarCartaDocumento(aIdCarta, tmBeginEnd, rbImprimir.Checked, edCantCopias.Value)
            else //sino veo si esta tildado el mostrar preview.
              if chkMostrarPreview.Checked then
                 MostrarCartaDocumento(aIdCarta, tmBeginEnd, False, edCantCopias.Value);
            if chkEnviarEmail.Checked then
              EnviarMail(aIdCarta);
          finally
            Free;
          end;

          BarProgreso.Position := Round((iLoop + 1) / iCantRegistros * 100);
          Application.ProcessMessages;
        end;
      finally
        aListaIDs.Free;
      end;
    end
    else
      DoGenerarCarta;

    Grid.UnSelectAll;
    sdqConsulta.Refresh;
  finally
    Printer.PrinterIndex := iOldImpresora;
    btnParar.Enabled := False;
  end;

  fpOpcionesImpresion.ModalResult := mrOk;
end;

procedure TfrmTraspasos.DoGenerarCarta;
var
  bCargarValores: Boolean;
  iCantRegistros: Integer;
  iLoop: Integer;
  sARTPrevia: String;
  sCodPrevio: String;
  sInSql: String;

  function GetListaText(aItemIndex: Integer): String;
  var
    iPos: Integer;
  begin
    Result := FListaArt[aItemIndex];
    iPos   := AnsiPos('=', Result);
    if iPos > 0 then
      Result := Copy(Result, iPos + 1, MaxInt);
  end;

begin
  bCargarValores := True;

  if FImprimeAutomatico then
  begin
    { Se supone que AList.Count nunca va a ser cero }
    sARTPrevia := '';
    sInSql    := GetListaText(0) + ',';
    sCodPrevio := sdqConsulta.FieldByName('ti_codigo').AsString;

    with TFrmAfiGeneracionCartas.Create(Self) do
    try
      for iLoop := 0 to FListaArt.Count - 1 do
      begin
        if FPararImpresion then
          raise Exception.Create('Ha decidido cancelar la impresión.');

        if (FListaArt.Names[iLoop] <> sARTPrevia) and (iLoop <> 0) then
        begin
          SetLength(sInSql, Length(sInSql) - 1);
          if chkMostrarPreview.Visible then
          begin
            ExecuteIngreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, False, edCantCopias.Value);
            if chkEnviarEmail.Checked then
              EnviarMail(IdCarta);
          end
          else
            ExecuteIngreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, rbImprimir.Checked, edCantCopias.Value);
          sInSql := '';
        end;

        sARTPrevia := FListaArt.Names[iLoop];
        if iLoop <> 0 then
          sInSql := sInSql + GetListaText(iLoop) + ',';

        BarProgreso.Position := Round((iLoop + 1) / FListaArt.Count * 100);
        Application.ProcessMessages;
      end;

      //Toma el que quedó libre
      SetLength(sInSql, Length(sInSql) - 1);
      if chkMostrarPreview.Visible then
      begin
        ExecuteIngreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, False, edCantCopias.Value);
        if chkEnviarEmail.Checked then
          EnviarMail(IdCarta);
      end
      else
        ExecuteIngreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, rbImprimir.Checked, edCantCopias.Value);

      BarProgreso.Position := 100;
      Application.ProcessMessages;
    finally
      Free;
    end;
  end
  else
  begin
    with TFrmAfiGeneracionCartas.Create(Self) do
    try
      iCantRegistros := Grid.SelectedRows.Count;
      for iLoop := 0 to iCantRegistros - 1 do
      begin
        if FPararImpresion then
          raise Exception.Create('Ha decidido cancelar la impresión.');

        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
        sInSql     := sdqConsulta.FieldByName('ti_id').AsString;
        sCodPrevio := sdqConsulta.FieldByName('ti_codigo').AsString;
        ExecuteIngreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, rbImprimir.Checked, edCantCopias.Value);

        BarProgreso.Position := Round((iLoop + 1) / iCantRegistros * 100);
        Application.ProcessMessages;
      end;

      BarProgreso.Position := 100;
      Application.ProcessMessages;
    finally
      Free;
    end;
  end;
end;

procedure TfrmTraspasos.MostrarOpcionesImpresion(Sender: TObject);
begin
  CargarImpresoras;
  ConfigurarOpcionesImpresion(mnuCartaMail <> Sender);
  fpOpcionesImpresion.ShowModal;
end;

procedure TfrmTraspasos.tbPropiedadesClick(Sender: TObject);
begin
  with TfrmEventosTraspasoIngreso.Create(Self) do
  try
    CargaMasiva := True;
    DoCargarDatos(0, fsAgregar);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmTraspasos.edSA_CUITKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    edSA_CUITExit(Sender);
end;

procedure TfrmTraspasos.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

procedure TfrmTraspasos.CalcularFilas;
begin
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotal.Value := sdqConsulta.RecordCount
  else
    edTotal.Value := 0;
end;

procedure TfrmTraspasos.tbCargaMasivaAutomaticaClick(Sender: TObject);
begin
  fpCargaMasivaAutomatica.ShowModal;
end;

procedure TfrmTraspasos.btnComenzarClick(Sender: TObject);
  procedure InsertarError(var aError: Boolean; const aNroLinea: Integer; const aMsgError: String);
  begin
    FRegistros[Length(FRegistros) - 1].Errores := FRegistros[Length(FRegistros) - 1].Errores + Format('Linea %d: %s', [aNroLinea, aMsgError]);
    aError := True;
    status.Tag := status.Tag + 1;
  end;

var
  bError: Boolean;
  iIdFormulario: Integer;
  iLCid: Integer;
  iLoop: Integer;
  iRow: Integer;
  iTotalLineas: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
  sColD: String;
  sColE: String;
  sSql: String;
begin
  Verificar(not FileExists(edArchivo.FileName), edArchivo, 'No se puede acceder al archivo especificado.');

  bError := False;
  FCancelarProceso := False;

  SetLength(FRegistros, 0);

  btnCancelar2.Visible := True;
  btnComenzar.Visible := False;
  lbVerErrores.Visible := False;
  status.Panels[0].Text := 'Verificando archivo...';
  status.Panels[1].Text := '';
  status.Tag := 0;
  status.Update;

  iLCid := GetUserDefaultLCID;
  try
    try
      ExcelApp.Workbooks.Open(edArchivo.FileName, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
      ExcelApp.Visible[0] := False;
      ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
      ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
      ExcelWS.Activate;

      with ExcelWS do
      begin
        iRow := 2;
        sColA := Range['A2', 'A2'].Value2;
        sColB := Range['B2', 'B2'].Value2;
        sColC := Range['C2', 'C2'].Value;
        sColD := Range['D2', 'D2'].Value2;
        sColE := Range['E2', 'E2'].Value2;
        iTotalLineas := GetCountLineasExcel;

        while not IsEmptyLine(sColA, sColB, sColC, sColD, sColE) do
        begin
          if FCancelarProceso then
            Break;

          status.Panels[0].Text := Format('Verificando linea %d de %d...', [iRow, iTotalLineas]);
          status.Panels[1].Text := Format('Se encontraron %d errores.', [status.Tag]);
          status.Update;

          SetLength(FRegistros, Length(FRegistros) + 1);
          FRegistros[Length(FRegistros) - 1].CodigoEvento     := sColB;
          FRegistros[Length(FRegistros) - 1].Deuda            := sColE;
          FRegistros[Length(FRegistros) - 1].Errores          := '';
          FRegistros[Length(FRegistros) - 1].Fecha            := sColC;
          FRegistros[Length(FRegistros) - 1].NumeroFormulario := sColA;
          FRegistros[Length(FRegistros) - 1].Periodo          := sColD;

          // ***  VERIFICO QUE LA FECHA SEA VÁLIDA..  ***
          try
            StrToDate(FRegistros[Length(FRegistros) - 1].Fecha);
          except
            InsertarError(bError, iRow, 'El formato de la Fecha es inválido.');
          end;

          // ***  VERIFICO QUE EL PERÍODO SEA VÁLIDO..  ***
          try
            if FRegistros[Length(FRegistros) - 1].Periodo <> '' then
              StrToDate('01/' + FRegistros[Length(FRegistros) - 1].Periodo);
          except
            InsertarError(bError, iRow, 'El formato del Período es inválido.');
          end;

          // ***  VERIFICO QUE LA DEUDA SEA UN NÚMERO VÁLIDO..  ***
          try
            if FRegistros[Length(FRegistros) - 1].Deuda <> '' then
              if StrToFloat(FRegistros[Length(FRegistros) - 1].Deuda) < 0 then
                InsertarError(bError, iRow, 'La Deuda no puede ser inferior a cero (0).');
          except
            InsertarError(bError, iRow, 'El formato de la columna Deuda es inválido.');
          end;

          // ***  VERIFICO QUE EL EVENTO ANTERIOR PARA ESTE Nº FORMULARIO SEA EL 002..  ***
          sSql := 'SELECT art.afiliacion.is_ultimoevento002(:numeroformulario) FROM DUAL';
          if ValorSqlEx(sSql, [FRegistros[Length(FRegistros) - 1].NumeroFormulario]) = 'NO' then
            InsertarError(bError, iRow, 'El evento previo de este Nº de Formulario no es 002.');

          // ***  VERIFICO QUE EL CÓDIGO DEL EVENTO SEA 099 o 20..  ***
          if (FRegistros[Length(FRegistros) - 1].CodigoEvento <> '099') and (FRegistros[Length(FRegistros) - 1].CodigoEvento <> '20') then
            InsertarError(bError, iRow, 'El código del evento debe ser "099" o "20".');

          // ***  PARA EL EVENTO 099 LAS COLUMNAS D Y E TIENEN QUE ESTAR EN BLANCO..  ***
          if FRegistros[Length(FRegistros) - 1].CodigoEvento = '099' then
            if (FRegistros[Length(FRegistros) - 1].Periodo <> '') or (FRegistros[Length(FRegistros) - 1].Deuda <> '') then
              InsertarError(bError, iRow, 'Para el evento "099" las columnas D y E tienen que estar en blanco.');

          // ***  PARA EL EVENTO 20 LAS COLUMNAS D Y E TIENEN QUE TENER DATOS..  ***
          if FRegistros[Length(FRegistros) - 1].CodigoEvento = '20' then
            if (FRegistros[Length(FRegistros) - 1].Periodo = '') or (StrToFloatDef(FRegistros[Length(FRegistros) - 1].Deuda, 0) <= 0) then
              InsertarError(bError, iRow, 'Para el evento "20" las columnas D y E tienen que tener un valor.');

          Inc(iRow);
          if (iRow mod 20) = 0 then
            Forms.Application.ProcessMessages;

          sColA := Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2;
          sColB := Range['B' + IntToStr(iRow), 'B' + IntToStr(iRow)].Value2;
          sColC := Range['C' + IntToStr(iRow), 'C' + IntToStr(iRow)].Value;
          sColD := Range['D' + IntToStr(iRow), 'D' + IntToStr(iRow)].Value2;
          sColE := Range['E' + IntToStr(iRow), 'E' + IntToStr(iRow)].Value2;
        end;
      end;

      if FCancelarProceso then
      begin
        status.Panels[0].Text := 'Proceso cancelado por el usuario.';
        status.Update;
      end
      else if bError then
      begin
        btnCancelar2.Visible := False;
        btnComenzar.Visible := True;
        lbVerErrores.Visible := True;
        if not MsgAsk('Se han encontrado errores en el archivo.' + #10#13 + '¿ Desea iniciar la carga masiva solo para los registros válidos ?') then
          FCancelarProceso := True;
      end
      else
      begin
        status.Panels[0].Text := 'Verificación exitosa...';
        status.Update;
      end;

      if not FCancelarProceso then
      begin
        status.Panels[1].Text := '';
        status.Update;

        Application.CreateForm(TfrmEventosTraspasoIngreso, frmEventosTraspasoIngreso);
        try
          BeginTrans;
          try
            for iLoop := 0 to Length(FRegistros) - 1 do
            begin
              status.Panels[0].Text := Format('Procesando linea %d de %d...', [iLoop + 1, Length(FRegistros)]);
              status.Update;

              if Trim(FRegistros[iLoop].Errores) = '' then
              begin
                sSql :=
                  'SELECT MAX(fo_id)' +
                   ' FROM afo_formulario' +
                  ' WHERE fo_formulario = :formulario';
                iIdFormulario := ValorSqlIntegerEx(sSql, [FRegistros[iLoop].NumeroFormulario]);

                frmEventosTraspasoIngreso.DoAgregarDatos(iIdFormulario,
                                                         StrToFloatDef(FRegistros[iLoop].Deuda, 0),
                                                         FRegistros[iLoop].CodigoEvento,
                                                         '',
                                                         FRegistros[iLoop].Periodo,
                                                         StrToDateTime(FRegistros[iLoop].Fecha),
                                                         False,
                                                         False);
              end;
            end;
            CommitTrans;
            MsgBox('El proceso finalizó exitosamente.');
          except
            Rollback;
          end;
        finally
          FreeAndNil(frmEventosTraspasoIngreso);
        end;
      end;

      if (not FCancelarProceso) and (not bError) then
        fpCargaMasivaAutomatica.ModalResult := mrOk;
    except
      fpCargaMasivaAutomatica.ModalResult := mrCancel;
    end;
  finally
    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Visible[0] := True;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
  end;
end;

procedure TfrmTraspasos.btnVerFormatoClick(Sender: TObject);
begin
  MessageDlg(
    'El Formato del archivo es:' + #13#10 +
    '* Extensión: .XLS' + #13#10 +
    '* Encabezado: Debe ingresarse encabezado' + #13#10 +
    '* Columnas:' + #13 + #10 +
    '           A) Nº Formulario' + #13#10 +
    '           B) Código del Evento' + #13#10 +
    '           C) Fecha (dd/mm/aaaa)' + #13#10 +
    '           D) Período (mm/aaaa)' + #13#10 +
    '           E) Deuda',
    mtInformation, [mbOK], 0);
end;

function TfrmTraspasos.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
  sColD: String;
  sColE: String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
    begin
      sColA := Range['A' + IntToStr(iLineNumber), 'A' + IntToStr(iLineNumber)].Value2;
      sColB := Range['B' + IntToStr(iLineNumber), 'B' + IntToStr(iLineNumber)].Value;
      sColC := Range['C' + IntToStr(iLineNumber), 'C' + IntToStr(iLineNumber)].Value;
      sColD := Range['D' + IntToStr(iLineNumber), 'D' + IntToStr(iLineNumber)].Value2;
      sColE := Range['E' + IntToStr(iLineNumber), 'E' + IntToStr(iLineNumber)].Value2;
    end;

    if IsEmptyLine(sColA, sColB, sColC, sColD, sColE) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

procedure TfrmTraspasos.btnCancelar2Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

function TfrmTraspasos.IsEmptyLine(const aValor1, aValor2, aValor3, aValor4, aValor5: String): Boolean;
begin
  Result := (aValor1 = '') and (aValor2 = '') and (aValor3 = '') and (aValor4 = '') and (aValor5 = '');
end;

procedure TfrmTraspasos.lbVerErroresClick(Sender: TObject);
var
  iLoop: Integer;
begin
  with fpErrores do
  begin
    Height := 240;
    Width := 480;

    memoErrores.Clear;
    for iLoop := 0 to Length(FRegistros) - 1 do
      memoErrores.Lines.Add(FRegistros[iLoop].Errores);

    ShowModal;
  end;
end;

procedure TfrmTraspasos.fpErroresKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpErrores.Close;
end;

procedure TfrmTraspasos.fpCargaMasivaAutomaticaShow(Sender: TObject);
begin
  btnCancelar2.Hide;
  edArchivo.Clear;
  lbVerErrores.Hide;
  status.Panels[0].Text := '';
  status.Panels[1].Text := '';
  status.Update;
end;

procedure TfrmTraspasos.btnComenzar2Click(Sender: TObject);
var
  iLoop: Integer;
  iTotalRegistros: Integer;
begin
  status2.SimpleText := '';

  Verificar(sdqConsulta.IsEmpty, Grid, 'No hay datos para procesar.');
  Verificar(edFecha.IsEmpty, edFecha, 'Debe ingresar la Fecha.');
  Verificar(fraCodigoUltimoEvento.IsEmpty, fraCodigoUltimoEvento.edCodigo, 'Debe seleccionar el Código del Último Evento.');


  FCancelarProceso := False;

  btnCancelar3.Visible := True;
  btnComenzar2.Visible := False;
       {Cambios pedidos por user, por rechazo tk 31172, confirmado por EVILA
       Quiere procesar solo lo que ve en la grilla.
       Se supone que él, "juega" con los filtros y de esa manera elije cuales
       Cambiado aQuery por datos de sdqConsulta}


  {sSql :=
    'SELECT ti_idformulario' +
     ' FROM ati_traspasoingreso a' +
    ' WHERE ti_codigo = :codigo' +
      ' AND ti_id = (SELECT MAX(ti_id)' +
                     ' FROM ati_traspasoingreso b' +
                    ' WHERE a.ti_idformulario = b.ti_idformulario)';

  aQuery := GetQueryEx(sSql, [fraCodigoUltimoEvento.Codigo]); }

  sdqConsulta.First;

  Application.CreateForm(TfrmEventosTraspasoIngreso, frmEventosTraspasoIngreso);
  try
    BeginTrans;
    try
      iTotalRegistros := 1;
      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        status2.SimpleText := Format('Procesando %d de %d...', [iTotalRegistros, Grid.SelectedRows.Count]);
        status2.Update;
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
        frmEventosTraspasoIngreso.DoAgregarDatos(sdqConsulta.FieldByName('ti_idformulario').AsInteger,
                                                 0,
                                                 Copy(edCodigoNuevoEvento.Text, 1, Pos('-', edCodigoNuevoEvento.Text) - 1),
                                                 '',
                                                 '',
                                                 edFecha.Date,
                                                 False,
                                                 False);
        Inc(iTotalRegistros);
        if (iTotalRegistros mod 5) = 0 then
          Forms.Application.ProcessMessages;
      end;

      CommitTrans;
      MsgBox('El proceso finalizó exitosamente.');

      if not FCancelarProceso then
        fpCargaMasivaEvento.ModalResult := mrOk;
    except
      Rollback;
      fpCargaMasivaEvento.ModalResult := mrCancel;
    end;
  finally
    FreeAndNil(frmEventosTraspasoIngreso);
    Grid.UnselectAll;
    sdqConsulta.Refresh; //por si el usuario cree que no funciono al seguir viendo los registros.
  end;
end;

procedure TfrmTraspasos.CambiaCodigoUltimoEvento(Sender: TObject);
  function GetValor(const aCodigoEvento: String): String;
  var
    sSql: String;
  begin
    sSql :=
      'SELECT tb_codigo || ''-'' || tb_descripcion' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''EVTIN''' +
        ' AND tb_codigo = :codigo';
    Result := ValorSqlEx(sSql, [aCodigoEvento]);
  end;

begin
  if fraCodigoUltimoEvento.Codigo = '001' then
    edCodigoNuevoEvento.Text := GetValor('002')
  else if fraCodigoUltimoEvento.Codigo = '20' then
    edCodigoNuevoEvento.Text := GetValor('099')
  else
    edCodigoNuevoEvento.Text := '';
end;

procedure TfrmTraspasos.fpCargaMasivaEventoShow(Sender: TObject);
begin
  btnComenzar2.Show;
  btnCancelar3.Hide;
  edFecha.Clear;
  fraCodigoUltimoEvento.Clear;
  edCodigoNuevoEvento.Clear;
  status.SimpleText := '';
  status.Update;
  status2.SimpleText := 'Registros seleccionados: ' + IntToStr(Grid.SelectedRows.Count);
  status2.Update;
  fraCodigoUltimoEvento.Value := fraEventos.Value;
  CambiaCodigoUltimoEvento(Nil);
end;

procedure TfrmTraspasos.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmTraspasos.tbCargaMasivaEventoClick(Sender: TObject);
begin
  Verificar(((fraEventos.Value <> '001') and (fraEventos.Value <> '20')),fraEventos, 'Seleccionar como filtro "001" o "20".');
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'Seleccione al menos un registro.');
  fpCargaMasivaEvento.ShowModal;
end;

procedure TfrmTraspasos.tbReferenciasClick(Sender: TObject);
begin
  if pnlRef.Visible then
  begin
    CoolBar.Height := 30;
    pnlRef.Visible := False;
  end
  else
  begin
    CoolBar.Height := 56;
    pnlRef.Visible := True;
  end;
end;

procedure TfrmTraspasos.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //Faltante de carga ROJO
  if ((sdqConsulta.FieldByName('faltarenglon').AsString <> 'OK') and (sdqConsulta.FieldByName('sa_usurevision').IsNull)) then
    Grid.Canvas.Font.Color := clRed
  else if sdqConsulta.FieldByName('faltarenglon').AsString <> 'OK' then   //Solicitud con documentacion faltante VIOLETA
    Grid.Canvas.Font.Color := clPurple
  else if (sdqConsulta.FieldByName('sa_motivoalta').AsString = '02') and sdqConsulta.FieldByName('SA_USUREVISION').IsNull then    //Solicitud sin Revision NARANJA
    Grid.Canvas.Font.Color := $00719FFF
  else if sdqConsulta.FieldByName('sa_hojaslegajos').AsInteger = 0 then   //Sin Cantidad de Hojas AZUL
    Grid.Canvas.Font.Color := clBlue;

  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmTraspasos.EnviarMail(const aIdCarta: Integer);
var
  sSql : String;
  Resultado: TResultadoEnvio;
  Mail: TCuerpoArt;
begin
  Mail := ReemplazarValoresCuerpoMail(aIdCarta, GetCuerpoMail);

  if Mail.sEmailArt = '' then
  begin
   MsgBox('La ART seleccionada (' + Mail.sNombreArt + '), no cuenta con un e-mail válido para realizar el envio.', MB_ICONEXCLAMATION + MB_OK)
  end
  else
  begin
    BeginTrans;
    try
      Mail.sEmailArt := StringReplace(Mail.sEmailArt, ';', ',', [rfReplaceAll]); //a la funcion de enviar email de abajo no le gustan los ;

      Resultado := EnviarMailBDWithResultsWithDirOrigen(Mail.sEmailArt, 'Solicitud Traspaso - Provincia ART', [oDeleteAttach, oDisableBody],
                                         Mail.CuerpoMail, nil, 0, tcDefault ,False ,False, 2500, -1, [tdContactoContrato], '', True, 'traspasos@provart.com.ar', 2);

      if Resultado.EnvioOk then
      begin
       sSql :=
          'UPDATE ati_traspasoingreso' +
            ' SET ti_idemail = :idemail' +
          ' WHERE ti_idcarta = :idcarta';
        EjecutarSqlSTEx(sSql, [Resultado.MensajeId, aIdCarta]);

        GuardarEmail(Mail.CuerpoMail, IntToStr(Mail.idArt));
      end;
      CommitTrans;
    except
      on E: Exception do
        begin
          ErrorMsg(E, 'Error al vincular e-mail.');
          Rollback;
        end;
    end;
  end;
end;

procedure TfrmTraspasos.chkEnviarEmailClick(Sender: TObject);
begin
  fraUsuarioFirmante.Enabled := chkEnviarEmail.Checked;
  if not chkEnviarEmail.Checked then
    fraUsuarioFirmante.Clear;
end;

procedure TfrmTraspasos.tbCorreoElectronicoClick(Sender: TObject);
var
  sLista: String;
  sSql: String;
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'No hay registros seleccionados');

  sLista := '';
  sSql :=
    'SELECT DISTINCT ti_idemail' +
              ' FROM ati_traspasoingreso' +
             ' WHERE ti_id = :id' +
               ' AND ti_idemail IS NOT NULL';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('ti_id').AsInteger]) do
    while not eof do
    begin
      sLista := sLista + FieldByName('ti_idemail').AsString + ',';
      Next;
    end;

  sSql := 'SELECT DISTINCT ee_id' +
              ' FROM comunes.cee_emailaenviar' +
            ' WHERE ee_tiporegistroasociado = ''AFO''' +
             ' AND ee_idregistroasociado = :idform';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('ti_idformulario').AsInteger]) do
    while not eof do
    begin
      sLista := sLista + FieldByName('ee_id').AsString + ',';
      Next;
    end;

  if sLista <> '' then
  begin
    SetLength(sLista,Length(sLista)-1);
    with TfrmElementosEnviados.Create(Self) do
    begin
      FormStyle := fsNormal;
      CheckOrigen := False;
      Visible := False;
      cmbEE_FECHAMENSAJEDesde.Clear;
      fraEE_DIRECCIONORIGEN.Clear;
      ExtraCondition := 'ee_id IN (' + sLista +' )';
      RefreshData;
      ShowModal;
    end;
  end
  else
    InvalidMsg(Grid, 'No se encontraron e-mails.', 'Sin Datos');
end;

procedure TfrmTraspasos.ConfigurarOpcionesImpresion(const aImprimir: Boolean);
begin
  BarProgreso.Position := 0;

  btnParar.Enabled := False;
  chkEnviarEmail.Checked := False;
  fraUsuarioFirmante.Enabled := False;
  chkMostrarPreview.Checked := False;

  rbPreview.Visible := aImprimir;
  rbImprimir.Visible := aImprimir;
  chkMostrarPreview.Visible := not aImprimir;
  chkEnviarEMail.Visible := not aImprimir;
  gbOpcionesEmail.Visible := not aImprimir;
  Label8.Visible := aImprimir;
  Label7.Visible := aImprimir;
  cmbImpresoras.Visible := aImprimir;
  edCantCopias.Visible := aImprimir;
  if aImprimir then
  begin
    BarProgreso.Top := 96;
    fpOpcionesImpresion.Height := 150;
  end
  else
  begin
    chkEnviarEmail.Top := chkMostrarPreview.Top + 18;
    gbOpcionesEmail.Top := chkEnviarEmail.Top + 18;
    BarProgreso.Top := gbOpcionesEmail.Top + gbOpcionesEmail.Height + 2;
    fpOpcionesImpresion.Height := 150;
  end;
end;

function TfrmTraspasos.GetCuerpoMail: String;
begin
  Result :=
    '<html>' +
    '<head>' +
    '<style type="text/css">' +
    'body {font-family: Verdana; margin-left: 0px; margin-right: 0px; margin-top: 10px; margin-bottom:5px;}' +
    '#Header {width: 595px;}' +
    '#ContenMail {font-size: 7.5pt; color: #444444; padding-left: 40px; background-color: #f7f7f7; padding-right: 40px;}' +
    '#vinieta {color: #01A4E7; font-weight: bold; font-size: 8pt;}' +
    '.ColDetI, .ColDetC, .ColDetD  {border-left: solid #A4A4A4; border-left-width: 1px; border-right: solid #A4A4A4; border-right-width: 1px;' +
    ' border-bottom: dotted #A4A4A4; border-bottom-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; font-size: 8pt;	color: #807F84;}' +
    '.ColDetI {text-align: left;}' +
    '.ColDetD {text-align: center;}' +
    '.ColTotalI, .ColTotalC, .ColTotalD  {background-color: #807F84;	height: 15px; border: solid #A4A4A4; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; color: #FFFFFF; font-size: 8pt;}' +
    '.ColTotalI  {text-align: left; font-weight: bold;}' +
    '.ColTotalD  {text-align: center; font-weight: bold;}' +
    '.ColTitI, .ColTitD {background-color: #807F84; height: 20px; border: solid #A4A4A4; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; color: #FFFFFF; font-size: 8pt; font-weight: bold;}' +
    '.ColTitI {text-align: left;}' +
    '.ColTitD {text-align: center;}' +
    '.Width500 {width: 500px; border-collapse: collapse;	border-spacing: 0;}' +
    '</style>' +
    '</head>' +
    '<body link="#0068C3" vlink="#0068C3" alink="#0068C3">' +
    '<center>' +
    '<table id="header" cellspacing="0" cellpadding="0">' +
    '	<tr><td><img src="http://www.provinciart.com.ar/IntraWEB/Images/mails/apps/modules/afiliaciones/traspaso/header.jpg"></td></tr>' +
    '	<tr>' +
    '		<td id="ContenMail">' +
    '			<p>&nbsp;</p>' +
    '			<p>Buenos Aires, {{FECHACARTA}}<br><b>{{ART}}</b><br>{{DIRECCIONART}}<br>{{CP}} {{CPA}} {{LOCALIDAD}}</p>' +
    '			<p><b>De nuestra mayor consideración:</b></p>' +
    '			<p>Con motivo de haber recibido solicitudes de traspaso de empresas afiliadas a esta Aseguradora, solicitamos tengan' +
            ' a bien emitir el correspondiente comprobante de "Situación de Pago de Cuotas" y copia del plan de mejoramiento de los contratos que se detallan a continuación:</p>' +
    '		</td>' +
    '	</tr>' +
    '	<tr>' +
    '		<td id="ContenMail" align="center"><br>' +
    '			<table class="Width500" cellpadding="0" cellspacing="0">' +
    '				<tr><td class="CS40 GrisClaro" colspan="2"></td></tr>' +
    '		       	<tr><td class="ColTitI">RAZÓN SOCIAL</td><td class="ColTitD">CUIT</td></tr>' +
    '				{{DETAIL}}' +
    '				<tr><td colspan="2" class="CSDet2"></td></tr>' +
    '				<tr><td class="ColTotalI">TOTAL DE EMPRESAS</td><td class="ColTotalD">{{TOTAL}}</td></tr>' +
    '				<tr><td class="PieTabla" colspan="2">&nbsp;</td></tr>' +
    '			</table>' +
    '		</td>' +
    '	</tr>' +
    '	<tr>' +
    '		<td id="ContenMail">' +
    '			<p>Asimismo, les informamos que dicho comprobante deberá ser remitido hasta el día 20 (veinte) del corriente (o el primer día' +
            ' hábil siguiente si ese día fuese feriado), caso contrario procederemos a la presentación del alta ante la Superintendencia de Riesgos del Trabajo.</p>' +
    '			<p>Ponemos a vuestra disposición los formularios de Relevamiento General de Riesgos Laborales presentados por los empleadores' +
            ' que solicitan el traspaso, sobre los cuales puede realizar consultas u obtener copias en nuestras oficinas (Carlos Pellegrini 91, 4º piso, CABA) de lunes a viernes en el horario de 10 a 17.30 hs.</p>' +
    '			<p>"Esta Aseguradora se hace responsable de los daños y perjuicios que pudiere ocasionar cualquier error en la información contenida en la presente ".</p>' +
    '			<p>Agradeciendo la atención dispensada a la presente, saludamos a Ustedes muy atentamente.</p><p></p><p></p>' +
    '		</td>' +
    '	</tr>' +                                                                                                                                   {asuarez-invisible.png}
    ' <tr><td id="ContenMail"><img align="right" src="http://www.provinciart.com.ar/IntraWEB/Images/mails/apps/modules/afiliaciones/traspaso/{{URLFIRMA}}"></td></tr>' +
    '	<tr><td id="ContenMail" align="right"><b>{{FIRMANTE}}</b><p></p></td></tr>' +
    '	<tr><td><img src="http://www.provinciart.com.ar/IntraWEB/Images/mails/apps/modules/afiliaciones/traspaso/pie.jpg"></td></tr>' +
    '</table>' +
    '</center>' +
    '</body>' +
    '</html>';
end;

function TfrmTraspasos.ReemplazarValoresCuerpoMail(const aIdCarta: Integer; aCuerpoMail: String): TCuerpoArt;
var
  iIdArt: Integer;
  sCuerpoMail: String;
  sDetalle: String;
  sFecha: String;
  sNumRows: String;
  sSql: String;
begin
  sCuerpoMail := aCuerpoMail;

  sSql :=
    'SELECT ROWNUM, sa_nombre, sa_cuit, sa_idartanterior, ca_fechaalta' +
     ' FROM (SELECT sa_nombre, sa_cuit, sa_idartanterior, ca_fechaalta' +
             ' FROM ati_traspasoingreso, asa_solicitudafiliacion, cca_carta' +
            ' WHERE ti_idformulario = sa_idformulario' +
              ' AND ti_idcarta = ca_id' +
              ' AND ti_idcarta = :idcarta' +
         ' ORDER BY sa_nombre)';
  with GetQueryEx(sSql, [aIdCarta]) do
  try
    while not Eof do
    begin
      sDetalle := sDetalle + '<tr><td class="ColDetI">' + FieldByName('sa_nombre').AsString +'</td>'
                           + '<td class="ColDetD">' + FieldByName('sa_cuit').AsString +' </td></tr>';
      Next;
    end;

    sNumRows := IntToStr(RecordCount);
    iIdArt := FieldByName('sa_idartanterior').AsInteger;
    sFecha := FormatDateTime('dd ''de'' mmmm ''de'' yyyy', FieldByName('ca_fechaalta').AsDateTime);
  finally
    Free;
  end;

  sSql :=
    'SELECT ar_id, ar_nombre nombre, utiles.armar_domicilio(ar_calle, ar_numero, ar_piso, ar_departamento) domicilio,' +
          ' ar_cpostal cpostal, ar_cpostala cpostala, ar_localidad localidad, pv_descripcion provincia, ar_email' +
     ' FROM aar_art, cpv_provincias' +
    ' WHERE pv_codigo(+) = ar_provincia' +
      ' AND ar_id = :id';

  with GetQueryEx(sSql, [iIdArt]) do
  try
    if not Eof then
    begin
      sCuerpoMail  := StringReplace(sCuerpoMail, '{{ART}}', FieldByName('nombre').AsString, [rfReplaceAll, rfIgnoreCase]);
      sCuerpoMail  := StringReplace(sCuerpoMail, '{{DIRECCIONART}}', FieldByName('domicilio').AsString, [rfReplaceAll, rfIgnoreCase]);
      sCuerpoMail  := StringReplace(sCuerpoMail, '{{CP}}', FieldByName('cpostal').AsString, [rfReplaceAll, rfIgnoreCase]);
      sCuerpoMail  := StringReplace(sCuerpoMail, '{{CPA}}', FieldByName('cpostala').AsString, [rfReplaceAll, rfIgnoreCase]);
      sCuerpoMail  := StringReplace(sCuerpoMail, '{{LOCALIDAD}}',FieldByName('localidad').AsString + ', ' + FieldByName('provincia').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result.idArt := FieldByName('ar_id').AsInteger;
      Result.sEmailArt := FieldByName('ar_email').AsString;
      Result.sNombreArt:= FieldByName('nombre').AsString;
    end;
  finally
    Free;
  end;

  sCuerpoMail  := StringReplace(sCuerpoMail, '{{URLFIRMA}}', fraUsuarioFirmante.edCodigo.Text + '.png', [rfReplaceAll, rfIgnoreCase]);
  sCuerpoMail  := StringReplace(sCuerpoMail, '{{FIRMANTE}}', fraUsuarioFirmante.cmbDescripcion.Text, [rfReplaceAll, rfIgnoreCase]);
  sCuerpoMail  := StringReplace(sCuerpoMail, '{{DETAIL}}', sDetalle, [rfReplaceAll, rfIgnoreCase]);
  sCuerpoMail  := StringReplace(sCuerpoMail, '{{TOTAL}}', sNumRows, [rfReplaceAll, rfIgnoreCase]);
  sCuerpoMail  := StringReplace(sCuerpoMail, '{{FECHACARTA}}', sFecha, [rfReplaceAll, rfIgnoreCase]);
  Result.CuerpoMail := sCuerpoMail;
end;

procedure TfrmTraspasos.GuardarEmail(const aCuerpoMail, aCodigoArt: String);
var
  sFecha: String;
  sNombreArchivo: String;
  Stream: TMemoryStream;
begin
  DateTimeToString(sFecha, 'dd-mm-yy', DBDate);
  sNombreArchivo := edDirectorio.Text + '\' + aCodigoArt + '_' + sFecha +'.htm';
  Stream := TMemoryStream.Create;
  try
    Stream.WriteBuffer(Pointer(aCuerpoMail)^, Length(aCuerpoMail));
    Stream.Position := 0;
    if not FileExists(sNombreArchivo) or MsgAsk('¿ Realmente desea sobreescribir el archivo de e-Mail ?') then
      Stream.SaveToFile(sNombreArchivo);
  finally
    Stream.Free;
  end;
end;

procedure TfrmTraspasos.FSFormShow(Sender: TObject);
begin
  inherited;
  CoolBar.Height := 30;
  pnlRef.Visible := False;
end;

end.

