unit unBaseAdministracionCartas;
            
interface

uses
{$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unfraCtbTablas, Mask, StdCtrls, IntEdit,
  ComboEditor, CheckCombo, DBCheckCombo, ToolEdit, DateComboBox, unFraUsuario, unArtDbFrame, unFraEmpresa, Menus,
  FormPanel, unFraDomicilio, unArt, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, PatternEdit, CardinalEdit,
  unFraDomicilioTrab, unArtDBAwareFrame, unFraCodigoDescripcion,
  unfraFirmante, unFraSDA_DETALLEARCHIVO, unConstantArchivo, RxToolEdit,
  RxPlacemnt;

type
  TfrmBaseAdministracionCartas = class(TfrmCustomConsulta)
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirCartasDocumento: TMenuItem;
    tbRecepcion: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    fpRecepcionCartaDoc: TFormPanel;
    BevelAbm: TBevel;
    btnRecepcionAceptar: TButton;
    btnCancelar: TButton;
    edFechaRecepcion: TDateComboBox;
    lbFRecepcion: TLabel;
    rgRecepOk: TRadioGroup;
    lbCodRecepcion: TLabel;
    fpReemplazar: TFormPanel;
    Bevel1: TBevel;
    btnDatosNuevos: TButton;
    Button1: TButton;
    tbReemplazo: TToolButton;
    gbDatosCartaDoc: TGroupBox;
    gbDatosActuales: TGroupBox;
    btnMismosDatos: TButton;
    sdqCCA_CARTA: TSDQuery;
    sdusdqCCA_CARTA: TSDUpdateSQL;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    gbNroCarta: TGroupBox;
    edNroCarta: TIntEdit;
    gbNroCartaDoc: TGroupBox;
    Label1: TLabel;
    edNroCartaDocDesde: TMaskEdit;
    edNroCartaDocHasta: TMaskEdit;
    gbDelegacion: TGroupBox;
    gbCorreoImpresion: TGroupBox;
    gbCodigoNoRecepcion: TGroupBox;
    cmbCodigosNoRecepcion: TCheckCombo;
    gbModulo: TGroupBox;
    gbCodigoTexto: TGroupBox;
    gbCodigoFirmante: TGroupBox;
    gbUsuarioImpresion: TGroupBox;
    tsFiltros1: TTabSheet;
    rgRecepcionOK: TRadioGroup;
    gbFormulario: TGroupBox;
    gbFechaImpresion: TGroupBox;
    Label2: TLabel;
    edFechaImpresionDesde: TDateComboBox;
    edFechaImpresionHasta: TDateComboBox;
    gbFechaReimpresion: TGroupBox;
    Label4: TLabel;
    edFechaReImpresionDesde: TDateComboBox;
    edFechaReImpresionHasta: TDateComboBox;
    gbFechaRecepcion: TGroupBox;
    Label3: TLabel;
    edFechaRecepcionDesde: TDateComboBox;
    edFechaRecepcionHasta: TDateComboBox;
    gbPendientes: TGroupBox;
    chkPendienteImpresion: TCheckBox;
    chkPendienteRecepcion: TCheckBox;
    chkPendienteReemplazo: TCheckBox;
    gbFechaAlta: TGroupBox;
    Label5: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    gbUsuarioAlta: TGroupBox;
    fraCorreo: TfraStaticCTB_TABLAS;
    fraCodFirmante: TfraStaticCodigoDescripcion;
    fraCodTexto: TfraStaticCodigoDescripcion;
    fraDomicilioDatosCartaDoc: TfraDomicilioTrab;
    fraDomicilioDatosActuales: TfraDomicilioTrab;
    tbRecepcionMasiva: TToolButton;
    fpOpcionesImpresion: TFormPanel;
    Bevel2: TBevel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    edCantCopias: TIntEdit;
    Label7: TLabel;
    btnParar: TButton;
    Label8: TLabel;
    cmbImpresoras: TComboBox;
    BarProgreso: TProgressBar;
    mnuMarcarTodos: TMenuItem;
    mnuDesMarcarTodos: TMenuItem;
    rgEstado: TRadioGroup;
    GroupBox2: TGroupBox;
    cmbCodigosRecepcion: TCheckCombo;
    gbTrackTrace: TGroupBox;
    edTrackTrace: TEdit;
    tbTrackTrace: TToolButton;
    fpTrackTrace: TFormPanel;
    bvlTrackTrace: TBevel;
    Label11: TLabel;
    btnTrackTraceAceptar: TButton;
    btnTrackTraceCancelar: TButton;
    edTrackTraceModif: TEdit;
    dsUsuImpresion: TDataSource;
    sdqUsuImpresion: TSDQuery;
    cmbUsuImpresion: TDBCheckCombo;
    cmbUsuAlta: TDBCheckCombo;
    dsUsuAlta: TDataSource;
    sdqUsuAlta: TSDQuery;
    Label13: TLabel;
    edNroCartaRec: TMaskEdit;
    fraCodRecepcion: TfraCtbTablas;
    btnRecepcionSiguiente: TButton;
    gbUsuarioReimpresion: TGroupBox;
    cmbUsuReimpresion: TDBCheckCombo;
    sdqUsuReimpresion: TSDQuery;
    dsUsuReimpresion: TDataSource;
    gbArea: TGroupBox;
    fraArea: TfraStaticCodigoDescripcion;
    lblObsRecepcion: TLabel;
    edObsRecepcion: TEdit;
    chkPendienteAval: TCheckBox;
    mnuAvalarFirmaDigital: TMenuItem;
    N1: TMenuItem;
    chkAvaladas: TCheckBox;
    chkVentanilla: TCheckBox;
    dsDelegacion: TDataSource;
    sdqDelegacion: TSDQuery;
    cmbDelegacion: TDBCheckCombo;
    cmbModulo: TDBCheckCombo;
    sdqModulo: TSDQuery;
    dsModulo: TDataSource;
    fpFirmanteIncapacidades: TFormPanel;
    btnAceptarFirmanteIncap: TButton;
    fraFirmanteIncap: TfraFirmante;
    bvFirmante: TBevel;
    lblFirmante: TLabel;
    lblCarta: TLabel;
    fpDigitalizar: TFormPanel;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    btnDigAceptar: TButton;
    BevelDestinoPapel: TBevel;
    chkPendEnvioVentanilla: TCheckBox;
    rbVentanilla: TRadioButton;
    gbCartaConNroLote: TGroupBox;
    rbCartaNroLote_Si: TRadioButton;
    rbCartaNroLote_No: TRadioButton;
    rbCartaNroLote_Todas: TRadioButton;
    chkPendienteRemito: TCheckBox;
    pnlBottomCartas: TPanel;
    Panel2: TPanel;
    edCantCartas: TCardinalEdit;
    Panel1: TPanel;
    edTotalCartas: TCardinalEdit;
    pnlRemito: TPanel;
    ToolBarRemito: TToolBar;
    tbRemito: TToolButton;
    tbGenerarRemito: TToolButton;
    tbLimpiarRemito: TToolButton;
    fpGenerarRemito: TFormPanel;
    Bevel3: TBevel;
    Label6: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    btnAceptarRemito: TButton;
    btnCancelarRemito: TButton;
    edPorFuera: TIntEdit;
    edObsRemito: TMemo;
    fraCuentaUsuario: TfraCodigoDescripcion;
    pnlTotales: TPanel;
    ToolBarTotales: TToolBar;
    tbCalcularTotal: TToolButton;
    ShortCutControlHijo: TShortCutControl;
    lbRemito: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirCartasDocumentoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRecepcionClick(Sender: TObject);
    procedure btnRecepcionAceptarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rgRecepOkClick(Sender: TObject);
    procedure tbReemplazoClick(Sender: TObject);
    procedure btnDatosNuevosClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesMarcarTodosClick(Sender: TObject);
    procedure tbRecepcionMasivaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbTrackTraceClick(Sender: TObject);
    procedure btnTrackTraceAceptarClick(Sender: TObject);
    procedure fpTrackTraceEnter(Sender: TObject);
    procedure fpRecepcionCartaDocShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mnuAvalarFirmaDigitalClick(Sender: TObject);
    procedure cmbModuloChange(Sender: TObject); virtual;
    procedure btnAceptarFirmanteIncapClick(Sender: TObject);
    procedure fpFirmanteIncapacidadesBeforeShow(Sender: TObject);
    procedure btnDigAceptarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure tbGenerarRemitoClick(Sender: TObject);
    procedure tbRemitoClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure btnAceptarRemitoClick(Sender: TObject);
    procedure tbLimpiarRemitoClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
  private
    bRefrescarRec: Boolean;
    FArea: String;
    ModoForm: String;
    FEnviarPorVentanilla: Boolean;
    FSeleccionarCarpetaVE: Boolean;
    FCarpetaDestinoVE: String;
    FComunicacionVE: String;
    FTipoComunicacionVE: TTableId;

    function GetRecepcionOk(rg_RecepcOk: TRadioGroup): String;
    function GetRecepcionOk_Busqueda(rg_RecepcionOk: TRadioGroup): String;
    function IsDatosValidosRecepcion(IdCarta: Integer): Boolean;
    function IsDatosValidosTrackTrace: Boolean;
    function IsRegistroRecepcionCartaDocValido(IdCarta: Integer): Boolean;
    function IsRegistroReemplazoValido(IdCarta: TTableId): Boolean;
    function IsRegistrosBajaCartaDocValidos(var ListaIDs: String): Boolean;
    function IsUsuarioAreaCarta(IdCarta: Integer): Boolean;
    function ValidarGridTrackTrace: Boolean;
    function IsCartaDeIncapacidades(sIdTextoCarta:string): Boolean;     // TK 45302

    procedure CalcularFilas;
    procedure ClearDatosFormPanel;
    procedure DoEliminarCartasDoc(ListaIDs: String);
    procedure DoHabilitarCodigoNoRecepcion;
    procedure DoHabilitarIngresoCodigoRecepcion(rgRecepcOk: TRadioGroup);
    procedure DoInicializarfpReemplazar(IdCarta: TTableId);
    procedure DoRecepcionModoAlta(bLimpiarNro: Boolean);
    procedure fraCorreoOnChange(Sender: TObject);
    procedure LoadDatosFormPanel;
    procedure RecepcionCarta;
    procedure SetArea(const Value: String);
    procedure SetFraCodRecepcion(Cod: String);
    procedure Do_UpdatearFirmanteCarta(iIdCarta: integer; sIdFirmante:string);
    procedure SetEnviarPorVentanilla(const Value: Boolean);  // TK 45302
  protected
    PararImpresion: Boolean;

    function IsRegistroModificacionValido: Boolean; virtual;
    function GetSql: String; virtual;
    function GetWhere: String; virtual;

    procedure DoCargarDatosActuales(IdEndoso: TTableId); virtual;
    procedure DoCargarDatosCartaDoc(IdEndoso: TTableId); virtual;
    procedure fraAreaOnChange(Sender: TObject); virtual;
    procedure InicializarComponentes; virtual;
    procedure NuevaCarta(Sender: TObject); virtual; abstract;
    procedure CargarImpresoras;
    procedure AceptarImpresion;
    function ContinuarImpresion: Boolean;

    function IsRegistrosImpresionCartaDocValidos: Boolean;
    procedure ValidacionesAdicRegistrosImpresionCartaDoc; virtual;

    function IsRegistrosEnvioVentElectronicaValidos: Boolean; virtual;
    procedure ValidacionesAdicRegistrosEnvioVentElectronica; virtual;
  public
    procedure MostrarCarta(IdCarta: Integer); virtual; abstract;

    property Area: String                     read FArea                    write SetArea;
    property EnviarPorVentanilla: Boolean     read FEnviarPorVentanilla     write SetEnviarPorVentanilla;
    property SeleccionarCarpetaVE: Boolean    read FSeleccionarCarpetaVE    write FSeleccionarCarpetaVE;
    property CarpetaDestinoVE: String         read FCarpetaDestinoVE        write FCarpetaDestinoVE;
    property TipoComunicacionVE: TTableId     read FTipoComunicacionVE      write FTipoComunicacionVE;
    property ComunicacionVE: String           read FComunicacionVE          write FComunicacionVE;
  end;

implementation

uses
  unPrincipal, AnsiSql, VCLExtra, unDmPrincipal, CustomDlgs, SqlFuncs, General, DBFuncs, unCustomDataModule,
  unrptCartaDocumento, unRptCartaDocHeader, unComunes, unImpoExpoWizard, unSesion,
  Printers, strFuncs {$IFDEF RED_PRES} ,unUtilsArchivo, unArchivo {$ENDIF}, unSeleccionarCarpetaSRT, unRptRemitoCartas;

const
  AREA_INCAP_CARTAS = '55';

{$R *.DFM}

procedure TfrmBaseAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;
  with Seguridad.Claves.Add do
    Name := 'BajaCarta';

  {$IFDEF RED_PRES}
  IMG_FILTROS_SHOW             := 17;
  IMG_FILTROS_HIDE             := 18;
  {$ENDIF}

  InicializarComponentes;

  EnviarPorVentanilla  := False;
  SeleccionarCarpetaVE := False;
  CarpetaDestinoVE     := '';
  TipoComunicacionVE   := ART_EMPTY_ID;
  ComunicacionVE       := '';

  with fraCuentaUsuario do
  begin
    TableName   := 'ccu_cuentausuario';
    FieldCodigo := 'cu_usuario';
    FieldID     := 'cu_id';
    FieldDesc   := 'cu_cuenta';
    FieldBaja   := 'cu_fechabaja';
    ShowBajas   := False;
    OrderBy     := 'cu_usuario';
  end;

  tbSalir2.Left        := 1200;
end;

procedure TfrmBaseAdministracionCartas.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text := GetSql + SortDialog.OrderBy;
  inherited;
  CalcularFilas;
end;

procedure TfrmBaseAdministracionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  pcFiltros.ActivePageIndex := 1;
  edNroCarta.Clear;
  edNroCartaDocDesde.Text := '3779';
  edNroCartaDocHasta.Text := '3779';
  fraCorreo.Clear;
  cmbCodigosRecepcion.Clear;
  cmbCodigosNoRecepcion.Clear;
  //fraModulo.Clear;
  cmbModulo.Clear;
  fraArea.Clear;
  rgRecepcionOK.ItemIndex := 2;  // Todos
  rgEstado.ItemIndex      := 0;  // Activas
  fraCodTexto.Clear;
  fraCodFirmante.Clear;
  cmbUsuImpresion.Clear;
  cmbUsuReimpresion.Clear;
  edFechaImpresionDesde.Clear;
  edFechaImpresionHasta.Clear;
  chkPendienteImpresion.Checked  := False;
  chkPendienteRecepcion.Checked  := False;
  chkPendienteRemito.Checked     := False;
  chkPendienteReemplazo.Checked  := False;
  chkPendienteAval.Checked       := False;
  chkAvaladas.Checked            := False;
  chkVentanilla.Checked          := False;
  chkPendEnvioVentanilla.Checked := False;
  tbRemito.Down                  := False;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;
  edFechaReImpresionDesde.Clear;
  edFechaReImpresionHasta.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  cmbDelegacion.Clear;
  cmbUsuAlta.Clear;
  edTrackTrace.Clear;
  DoHabilitarCodigoNoRecepcion;
  cmbModuloChange(nil);
  fraAreaOnChange(nil);
  pcFiltros.ActivePageIndex := 0;
  rbCartaNroLote_Todas.Checked  := true;     // TK 55834
  if tbCalcularTotal.Down then
  begin
    tbCalcularTotal.Down := False;
    tbCalcularTotalClick(nil);
  end;
  inherited;

end;

procedure TfrmBaseAdministracionCartas.fraCorreoOnChange(Sender: TObject);
var
  ID: TCadena;
  sSql : string;
begin
  cmbCodigosRecepcion.Items.Clear;
  cmbCodigosNoRecepcion.Items.Clear;

  sSql :=
    'SELECT CODRE.TB_CODIGO CODIGO, CODRE.TB_DESCRIPCION DESCRIPCION, SUBSTR(CODRE.TB_ESPECIAL2, 2, 1) TIPORECEPCION' +
     ' FROM CTB_TABLAS CODRE, CTB_TABLAS CORRE' +
    ' WHERE CODRE.TB_CLAVE = ''CODRE''' +
      ' AND CODRE.TB_CODIGO <> ''0''' +
      ' AND CODRE.TB_ESPECIAL1 = CORRE.TB_ESPECIAL2' +
      ' AND CORRE.TB_CLAVE(+) = ''CORRE''' +
      ' AND CORRE.TB_CODIGO(+) = ' + SqlValue(fraCorreo.edCodigo.Text) + 
 ' ORDER BY CODRE.TB_DESCRIPCION ';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      ID := TCadena.Create;
      ID.Cadena := FieldByName('CODIGO').AsString;

      if FieldByName('TIPORECEPCION').AsString = 'S' then
        cmbCodigosRecepcion.Items.AddObject(ID.Cadena + ' - ' + FieldByName('DESCRIPCION').AsString, ID)
      else
        cmbCodigosNoRecepcion.Items.AddObject(ID.Cadena + ' - ' + FieldByName('DESCRIPCION').AsString, ID);
      Next;
    end;

    DoHabilitarCodigoNoRecepcion;
  finally
    Close;
    Free;
  end;
end;

{ Habilita o deshabilita el ingreso de los códigos de recepción }
procedure TfrmBaseAdministracionCartas.DoHabilitarCodigoNoRecepcion;
var
  bDesHabilitar: Boolean;
begin
  bDesHabilitar := not fraCorreo.IsSelected;
  LockControl(cmbCodigosRecepcion, bDesHabilitar);
  LockControl(cmbCodigosNoRecepcion, bDesHabilitar);

  if bDesHabilitar then
  begin
    cmbCodigosRecepcion.Clear;
    cmbCodigosNoRecepcion.Clear;
  end;
end;

procedure TfrmBaseAdministracionCartas.tbImprimirClick(Sender: TObject);
begin
 tbImprimir.CheckMenuDropdown;
end;

procedure TfrmBaseAdministracionCartas.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults
end;

{ Impresión de las cartas documento seleccionadas }
procedure TfrmBaseAdministracionCartas.mnuImprimirCartasDocumentoClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla')
  else
    if IsRegistrosImpresionCartaDocValidos() then
    begin
      btnParar.Enabled     := False;
      BarProgreso.Position := 0;
      CargarImpresoras;
      fpOpcionesImpresion.ShowModal;
    end;
end;

{ Determina si las cartas documento seleccionadas en la grilla a imprimir son o no válidas }
function TfrmBaseAdministracionCartas.IsRegistrosImpresionCartaDocValidos: Boolean;
var
  i: Integer;
begin
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

    Verificar(not sdqConsulta.FieldByName('CA_FECHABAJA').IsNull, Grid, 'Alguna de las cartas documento ya se encuentra dada de baja.');

    ValidacionesAdicRegistrosImpresionCartaDoc;
  end;

  Result := True;
end;

{ Baja de las cartas documento seleccionadas }
procedure TfrmBaseAdministracionCartas.tbEliminarClick(Sender: TObject);
var
  ListaIDs: String;
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else
  begin
    if Grid.SelectedRows.Count = 1 then
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistrosBajaCartaDocValidos(ListaIDs) then
      if MsgBox('¿Usted está seguro que quiere dar de baja las cartas documento seleccionadas?', MB_YESNO + MB_ICONQUESTION) = IDYES then
        DoEliminarCartasDoc(ListaIDs)
      else              // TK 45302
        RollBackUpdates;
  end;
end;

{ Determina si las cartas documento seleccionadas en la grilla a dar de baja son o no válidas }
function TfrmBaseAdministracionCartas.IsRegistrosBajaCartaDocValidos(var ListaIDs: String): Boolean;
var
  bSalir: Boolean;
  i: Integer;
  sMensaje: String;
  {$IFDEF RED_PRES} sSql: String; {$ENDIF}
begin
  bSalir   := False;
  ListaIDs := '(';
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
    // no debe estar dada de baja
    if not sdqConsulta.FieldByName('ca_fechabaja').IsNull then
    begin
      sMensaje := 'Alguna de las cartas documento ya se encuentra dada de baja.';
      bSalir   := True;
    end
    // no debe tener fecha de recepción
    else if not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull then
    begin
      sMensaje := 'Alguna de las cartas documento ya se encuentra recepcionada.';
      bSalir   := True;
    end
    else if IsCartaDeIncapacidades(sdqConsulta.FieldByName('CA_IDTEXTOCARTA').AsString) then // TK 45302: Si la carta es del área Incapacidades, entonces debe elegir nuevo firmante
    begin
      if (fpFirmanteIncapacidades.ShowModal = mrOk) then
         // Se guarda el Firmante en la carta  ca_id
        Do_UpdatearFirmanteCarta(sdqConsulta.FieldByName('CA_ID').AsInteger, fraFirmanteIncap.edCodigo.Text);

    end
    else
    begin
      {$IFDEF RED_PRES}
      sSql := 'SELECT 1 ' +
               ' FROM art.sex_expedientes, art.mgp_gtrabajo, art.mug_usuariogrupotrabajo ' +
              ' WHERE ug_grupo = gp_codigo ' +
                ' AND ex_gtrabajo = gp_codigo ' +
                ' AND ex_id = :IdCarta ' +
                ' AND ug_usuario = :Usuario ' +
                ' AND ug_fechabaja IS NULL ' +
                ' AND ug_tipousuario IN(''01'', ''02'') ';  // Referente - Supervisor

      if not(Seguridad.Claves.IsActive('BajaCarta')) and
         not(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ca_idexpediente').AsInteger, Sesion.UserId])) then
      begin
        sMensaje := 'Usted no es referente ni supervisor del grupo de trabajo de alguna de las cartas.';
        bSalir   := True;
      end;
      {$ENDIF}
    end;

    if bSalir then
    begin
      InvalidMsg(Grid, sMensaje);
      Result := False;
      Exit;
    end;
    ListaIDs := ListaIDs +  sdqConsulta.FieldByName('CA_ID').AsString + ', ';
  end;
  ListaIDs := Copy(ListaIDs, 1, Length(ListaIDs) - 2) + ')';
  Result := True;
end;

// Da de baja las cartas documento seleccionadas de la tabla de cartas documento
procedure TfrmBaseAdministracionCartas.DoEliminarCartasDoc(ListaIDs: String);
var
  sSql: String;
begin
  try
    sSql := 'UPDATE CCA_CARTA ' +
               'SET CA_USUBAJA='+ SqlValue(frmPrincipal.DBLogin.UserId) + ', ' +
                   'CA_FECHABAJA='+ SqlValue(DBDateTime) + ' ' +
             'WHERE CA_ID IN ' + ListaIDs;

    EjecutarSql(sSql);
    MsgBox('Las cartas documento se dieron de baja correctamente', MB_OK + MB_ICONINFORMATION);
    sdqConsulta.Refresh;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al dar de baja las cartas documento.');
  end;
end;

{ Recepción de la carta documento seleccionada }
procedure TfrmBaseAdministracionCartas.tbRecepcionClick(Sender: TObject);
begin
  RecepcionCarta;
end;

{ Determina si la carta doc. seleccionada en la grilla para ser recepcionada es o no válida }
function TfrmBaseAdministracionCartas.IsRegistroRecepcionCartaDocValido(IdCarta: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT ca_fechabaja, ca_fechaimpresion ' +
           ' FROM cca_carta ' +
          ' WHERE ca_id = :NroCarta ';
  with GetQueryEx(sSql, [IdCarta]) do
  try
    // la carta no debe estar dada de baja
    Verificar(not FieldByName('ca_fechabaja').IsNull, nil, 'La carta documento se encuentra dada de baja');
    // la carta debe estar impresa
    Verificar(FieldByName('ca_fechaimpresion').IsNull, nil, 'La carta documento aún no ha sido impresa');
  finally
    Free;
  end;
  Result := True;
end;

procedure TfrmBaseAdministracionCartas.btnRecepcionAceptarClick(Sender: TObject);
var
  iIdCarta: Integer;
  sRecepOk: String;
  sSql: String;
  {$IFDEF RED_PRES}
    iSiniestro, iOrden: integer;
    sSqlCarta, sCodDigitaliz: string;
  {$ENDIF}
begin
  sSql      := 'SELECT ca_id ' +
                ' FROM cca_carta ' +
               ' WHERE ca_nrocartadoc = :NroCarta ';
  iIdCarta  := ValorSqlIntegerEx(sSql, [Get_NroCarta(edNroCartaRec.Text)]);

  Verificar(iIdCarta = 0, edNroCartaRec, 'La carta documento no existe.');

  if IsDatosValidosRecepcion(iIdCarta) then
  try
    // actualizo los datos de la recepción en la tabla de cartas doc.
    BeginTrans;
    with TSql.Create('CCA_CARTA') do
    try
      sRecepOk := GetRecepcionOk(rgRecepOk);

      PrimaryKey.Add('CA_ID',             iIdCarta);
      Fields.Add('CA_RECEPCIONOK',        sRecepOk);
      Fields.Add('CA_CODRECEPCION',       fraCodRecepcion.edCodigo.Text);
      Fields.Add('CA_FECHARECEPCION',     edFechaRecepcion.Date);
      Fields.Add('CA_USURECEPCION',       Sesion.UserID);
      Fields.Add('CA_OBSERVRECEPCION',    edObsRecepcion.Text);

      SqlType := stUpdate;
      EjecutarSqlST(Sql);
    finally
      Free;
    end;


    {$IFDEF RED_PRES}
    // TK 52799
    if (sRecepOk = 'S') then
      sCodDigitaliz := CODDOC_ACUSECARTADOC
    else
      sCodDigitaliz := CODDOC_DEVOLCARTADOC;

    if (fpDigitalizar.ShowModal = mrOk) and (fraSDA_DETALLEARCHIVO.Opcion <> OPCION_DESTINO_SINPAPEL) then
    begin
      sSqlCarta := 'SELECT ex_siniestro, ex_orden ' +
                    ' FROM art.sex_expedientes ' +
                   ' WHERE ex_id = :idexped';
      with GetQueryEx(sSqlCarta, [sdqConsulta.FieldByName('ca_idexpediente').AsInteger]) do
      try
        iSiniestro := FieldByName('EX_SINIESTRO').AsInteger;
        iOrden     := FieldByName('EX_ORDEN').AsInteger;
      finally
        Free;
      end;

     DoAltaDocumentoCarpeta(ID_CARPETA_CD_SIN, GetIdDocumentoArchivo(ID_CARPETA_CD_SIN, sCodDigitaliz), GetClaveArmada(2, IntToStr(iSiniestro), IntToStr(iOrden), '', ''),
                                                                     False, False, False, 0, sdqConsulta.FieldByName('CA_NROCARTADOC').AsString, fraSDA_DETALLEARCHIVO.Opcion, fraSDA_DETALLEARCHIVO.Hojas);
    end;
   {$ENDIF}

    MsgBox('La carta documento se recepcionó correctamente.' , MB_OK + MB_ICONINFORMATION);

    if (Sender = btnRecepcionAceptar) then
      fpRecepcionCartaDoc.ModalResult := mrOk
    else
    begin
      edObsRecepcion.Clear;
      edNroCartaRec.Clear;
      edNroCartaRec.SetFocus;
      bRefrescarRec := True;
    end;

    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al recepcionar la carta documento');
    end;
  end;
end;

{ Determina si los datos ingresados de la recepción de la carta doc. son o no válidos }
function TfrmBaseAdministracionCartas.IsDatosValidosRecepcion(IdCarta :Integer): Boolean;
var
  dFechaImp :TDate;
  IdEstCta, IdArea: TTableId;
begin
  // debe seleccionar si recepción OK
  Verificar(rgRecepOk.ItemIndex = -1, rgRecepOk, 'El campo recepción OK es obligatorio.');
  // debe ingresar la fecha de recepción
  Verificar(edFechaRecepcion.IsEmpty, edFechaRecepcion, 'La fecha de recepción es obligatoria.');
  // la fecha de recepción debe ser mayor o igual a la de impresión
  dFechaImp := ValorSqlDateTimeEx('SELECT TRUNC(ca_fechaimpresion) FROM cca_carta ' +
                                  ' WHERE ca_id = :Id', [IdCarta]);
  Verificar(edFechaRecepcion.Date < dFechaImp,
            edFechaRecepcion, 'La fecha de recepción no puede ser menor a la fecha de impresión: ' + DateToStr(dFechaImp));
  // si la recepción no fue OK, debe ingresar el código de recepción
  Verificar((rgRecepOk.ItemIndex = 1) and not fraCodRecepcion.IsSelected, rgRecepOk,
            'El código de recepción es obligatorio, si Recepción OK = No');

  IdEstCta  := ValorSqlIntegerEx('SELECT utiles.get_idareatexto(:area, :modulo)' +
                                  ' FROM dual', [Area, MODULO_ESTCTACARTAC]);
  IdArea    := ValorSqlIntegerEx('SELECT ca_idareatexto FROM cca_carta ' +
                                 ' WHERE ca_id = :Id', [IdCarta]);
  Verificar(ExisteSqlEx('SELECT 1 FROM agc_gestorcuenta ' +
                        ' WHERE gc_usuario = :Usuario', [Sesion.UserID]) and
           (IdArea <> IdEstCta), Grid, 'Solo puede cargar acuse de recibo para cartas comerciales.');
  Result := True;
end;

procedure TfrmBaseAdministracionCartas.GridGetCellParams(Sender: TObject;  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  // así lo muestra con letras en rojo
  if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
    AFont.Color :=  clRed;
end;

procedure TfrmBaseAdministracionCartas.rgRecepOkClick(Sender: TObject);
begin
  inherited;
  DoHabilitarIngresoCodigoRecepcion( rgRecepOk );
end;

{ Habilita o deshabilita el ingreso del código de recepción }
procedure TfrmBaseAdministracionCartas.DoHabilitarIngresoCodigoRecepcion(rgRecepcOk: TRadioGroup);
begin
  fraCodRecepcion.Clear;
  fraCodRecepcion.ExtraCondition := 'AND SUBSTR(TB_ESPECIAL2, 2, 1) = ' + SqlValue(GetRecepcionOk(rgRecepOk));
end;

{ Devuelve S/N según lo seleccionado en el radio group del código de recepción del form panel }
function TfrmBaseAdministracionCartas.GetRecepcionOk(rg_RecepcOk: TRadioGroup): String;
var
  sRecepOk: String;
begin
  case rg_RecepcOk.ItemIndex of
    0:  sRecepOk := 'S';   // si
    1:  sRecepOk := 'N';   // no
  else
    sRecepOk := '';
  end;

  Result := sRecepOk;
end;

{ Reemplazo de la carta documento seleccionada }
procedure TfrmBaseAdministracionCartas.tbReemplazoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Solo debe seleccionar una fila de la grilla.');

  sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[0]));

  if IsRegistroReemplazoValido(sdqConsulta.FieldByName('ca_id').AsInteger) then
  begin
    DoInicializarfpReemplazar(sdqConsulta.FieldByName('ca_id').AsInteger);
    if fpReemplazar.ShowModal = mrOk then sdqConsulta.Refresh;
  end;
end;

{ Inicializa el form panel de reemplazo de cartas documento }
procedure TfrmBaseAdministracionCartas.DoInicializarfpReemplazar(IdCarta: TTableId);
var
  sSql: String;
begin
  sSql := 'SELECT ca_idendoso, ca_idformulario ' +
           ' FROM cca_carta ' +
          ' WHERE ca_id = :IdCarta ';
  with GetQueryEx(sSql, [IdCarta]) do
  try
    btnDatosNuevos.Enabled := not FieldByName('ca_idendoso').IsNull;
    sSql := 'SELECT NVL(afiliacion.get_ultendoso(' + SqlValue(FieldByName('ca_idformulario').AsInteger) + '),0) FROM DUAL';
    DoCargarDatosCartaDoc(ValorSqlInteger(sSql));
    DoCargarDatosActuales(FieldByName('ca_idendoso').AsInteger);
  finally
    Free;
  end;
end;

{ Determina si la carta doc. seleccionada en la grilla para ser reemplazada es o no válida }
function TfrmBaseAdministracionCartas.IsRegistroReemplazoValido(IdCarta: TTableId): Boolean;
var
  sSql: String;
begin
  Result  := False;
  sSql    := 'SELECT ca_fechabaja, ca_idcartaareemplazar, ca_fecharecepcion, ca_recepcionok, ca_manual ' +
              ' FROM cca_carta ' +
             ' WHERE ca_id = :IdCarta ';

  with GetQueryEx(sSql, [IdCarta]) do
  try
    if not IsEmpty then
    begin
      // la carta doc. no debe estar dada de baja
      Verificar(not FieldByName('ca_fechabaja').IsNull, Grid, 'La carta documento seleccionada se encuentra dada de baja.');
      // la carta doc. no debe haber sido reemplazada
      Verificar(not FieldByName('ca_idcartaareemplazar').IsNull, Grid, 'La carta documento seleccionada ya ha sido reemplazada.');
      // la carta doc. no debe haber sido recepcionada
      Verificar(FieldByName('ca_fecharecepcion').IsNull, Grid, 'La carta documento seleccionada todavía no ha sido recepcionada.');
      // la carta doc. no debe hacer sido recepcionada bien
      Verificar(FieldByName('ca_recepcionok').AsString = 'S', Grid, 'La carta documento seleccionada ha sido recepcionada correctamente.');
      // la carta doc. no debe hacer sido generado manualmente
      Verificar(FieldByName('ca_manual').AsString = 'S', Grid, 'La carta documento seleccionada se generó en forma manual.');

      Result := True;
    end;
  finally
    Free;
  end;
end;

procedure TfrmBaseAdministracionCartas.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

{ Carga los datos de la empresa y del domicilio de la carta doc. para su reemplazo }
procedure TfrmBaseAdministracionCartas.DoCargarDatosCartaDoc(IdEndoso: TTableId);
var
  sSql: String;
begin
  // datos del domicilio
  sSql := 'SELECT hd_calle calle, hd_localidad localidad, hd_cpostal cpostal, hd_provincia provincia, hd_numero numero, ' +
                ' hd_piso piso, hd_departamento departamento, hd_cpostala cpostala ' +
           ' FROM ahd_historicodomicilio, aen_endoso ' +
          ' WHERE en_idhistoricodomicilio = hd_id ' +
            ' AND en_id = :IdEndoso ';
  with GetQueryEx(sSql, [IdEndoso]) do
  try
    if not IsEmpty then
      with fraDomicilioDatosCartaDoc do
      begin
        Calle        := FieldByName('calle').AsString;
        Localidad    := FieldByName('localidad').AsString;
        CodigoPostal := FieldByName('cpostal').AsString;
        Provincia    := ValorSql('SELECT pv_descripcion ' +
                                  ' FROM cpv_provincias ' +
                                 ' WHERE pv_codigo = ' + FieldByName('provincia').AsString);
        Numero       := FieldByName('numero').AsString;
        Piso         := FieldByName('piso').AsString;
        Departamento := FieldByName('departamento').AsString;
        CPA          := FieldByName('cpostala').AsString;
      end;
  finally
    Free;
  end;
end;

{ Carga los datos de la empresa y del domicilio de la carta doc. para su reemplazo }
procedure TfrmBaseAdministracionCartas.DoCargarDatosActuales(IdEndoso: TTableId);
var
  sSql: String;
begin
  // datos del domicilio
  sSql := 'SELECT hd_calle calle, hd_localidad localidad, hd_cpostal cpostal, hd_provincia provincia, hd_numero numero, ' +
                ' hd_piso piso, hd_departamento departamento, hd_cpostala cpostala ' +
           ' FROM ahd_historicodomicilio, aen_endoso ' +
          ' WHERE en_id = :IdEndoso ' +
            ' AND en_idhistoricodomicilio = hd_id';
  with GetQueryEx(sSql, [IdEndoso]) do
  try
    if not IsEmpty then
      with fraDomicilioDatosActuales do
      begin
        Calle        := FieldByName('calle').AsString;
        Localidad    := FieldByName('localidad').AsString;
        CodigoPostal := FieldByName('cpostal').AsString;
        Provincia    := ValorSql('SELECT pv_descripcion ' +
                                  ' FROM cpv_provincias ' +
                                 ' WHERE pv_codigo = ' + FieldByName('provincia').AsString);
        Numero       := FieldByName('numero').AsString;
        Piso         := FieldByName('piso').AsString;
        Departamento := FieldByName('departamento').AsString;
        CPA          := FieldByName('cpostala').AsString;
      end;
  finally
    Free;
  end;
end;

procedure TfrmBaseAdministracionCartas.btnDatosNuevosClick(Sender: TObject);
var
  IdEndoso: Variant;
  TextoCarta: TStringList;
  iNroCartaDoc: Integer;
  TipoModulo: TTipoModulo;
  NroCartaDoc, sSql: String;
begin
  try
    BeginTrans;

    TipoModulo := taNone;

    sdqCCA_CARTA.Close;
    sdqCCA_CARTA.ParamByName( 'pCA_ID' ).AsInteger := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;
    sdqCCA_CARTA.Open;

    TextoCarta := TStringList.Create;
    try
      if sdqCCA_CARTA.IsEmpty then
        Raise Exception.Create( 'No se encontraron datos de la carta documento.' );

      if Sender = btnDatosNuevos then  // con datos nuevos
      begin
        sSql := 'SELECT NVL(ART.AFILIACION.GET_ULTENDOSO(CA_IDFORMULARIO), ART.AFILIACION.GET_ULTIDENDOSO(EN_CONTRATO)) ' +
                  'FROM AEN_ENDOSO, CCA_CARTA ' +
                 'WHERE CA_IDENDOSO=EN_ID ' +
                   'AND CA_ID=' + SqlValue(sdqConsulta.FieldByName( 'CA_ID' ).AsInteger);

        IdEndoso := ValorSql( sSql );
        if IdEndoso = '' then
          IdEndoso := Null;
      end
      else                             // con los mismos datos
        IdEndoso := sdqCCA_CARTA.FieldByName( 'CA_IDENDOSO' ).Value;
      FieldToTString( sdqCCA_CARTA.FieldByName( 'CA_TEXTOFINAL' ), TextoCarta );

      TipoModulo := GetTipoModulo(sdqCCA_CARTA.FieldByName('AT_AREA').AsString);

      sdqCCA_CARTA.Insert; { ------------------------------- ------------------------------- }
      sdqCCA_CARTA.FieldByName( 'CA_IDENDOSO' ).Value   := IdEndoso;
      sdqCCA_CARTA.FieldByName( 'CA_ID' ).AsInteger     := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;
      sdqCCA_CARTA.FieldByName( 'CA_USUALTA' ).AsString := frmPrincipal.DBLogin.UserId;

      if TipoModulo <> taNone then
        begin
          iNroCartaDoc := GetNroCartaDocReducido(TipoModulo);
          NroCartaDoc  := GetNroCartaDocCompleto(iNroCartaDoc, TipoModulo);
          sdqCCA_CARTA.FieldByName( 'NROCARTADOC' ).AsString := NroCartaDoc;
        end;

      TStringToField( TextoCarta, sdqCCA_CARTA.FieldByName( 'CA_TEXTOFINAL' ) );

      sdqCCA_CARTA.Post ;
      sdqCCA_CARTA.ApplyUpdates ;
      sdqCCA_CARTA.Close;
    finally
      TextoCarta.Free;
    end;

    // doy de baja la carta documento anterior
    with TSql.Create( 'CCA_CARTA' ) do
      try
        PrimaryKey.Add( 'CA_ID',      sdqConsulta.FieldByName( 'CA_ID' ).AsInteger );
        Fields.Add( 'CA_FECHABAJA',   exDateTime );
        Fields.Add( 'CA_USUBAJA',     frmPrincipal.DBLogin.UserId );

        SqlType := stUpdate;

        EjecutarSqlST( Sql );
      finally
        Free;
      end;

    if TipoModulo = taCobranzas then
      begin
        sSql := 'UPDATE ZCS_CONTRATOSELECCIONADOPLAN ' +
                   'SET CS_IDCARTARESCISION=(SELECT CA_ID ' +
                                              'FROM CCA_CARTA ' +
                                             'WHERE CA_NROCARTADOC=:NroCartaNueva) '+
                 'WHERE CS_IDCARTARESCISION=:CaIdOriginal';
         EjecutarSqlSTEx( sSql, [NroCartaDoc, sdqConsulta.FieldByName( 'CA_ID' ).AsInteger] );

        sSql := 'UPDATE ZCS_CONTRATOSELECCIONADOPLAN ' +
                   'SET CS_IDCARTAINTIMACION=(SELECT CA_ID ' +
                                              'FROM CCA_CARTA ' +
                                             'WHERE CA_NROCARTADOC=:NroCartaNueva) '+
                 'WHERE CS_IDCARTAINTIMACION=:CaIdOriginal';
         EjecutarSqlSTEx( sSql, [NroCartaDoc, sdqConsulta.FieldByName( 'CA_ID' ).AsInteger] );

        sSql := 'UPDATE ZCS_CONTRATOSELECCIONADOPLAN ' +
                   'SET CS_IDCARTAANULRESCISION=(SELECT CA_ID ' +
                                                  'FROM CCA_CARTA ' +
                                                 'WHERE CA_NROCARTADOC=:NroCartaNueva) '+
                 'WHERE CS_IDCARTAANULRESCISION=:CaIdOriginal';
         EjecutarSqlSTEx( sSql, [NroCartaDoc, sdqConsulta.FieldByName( 'CA_ID' ).AsInteger] );
      end;

    CommitTrans;
    MsgBox( 'La carta documento se reemplazó correctamente', MB_OK + MB_ICONINFORMATION );
    fpReemplazar.ModalResult := mrOk;
  except
    on E:Exception do
      begin
        RollBack;
        Raise Exception.Create ( E.Message + CRLF + 'Error al reemplazar la carta documento' );
      end;
  end;
end;

procedure TfrmBaseAdministracionCartas.tbModificarClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla')
  else begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[0]));
    if IsRegistroModificacionValido then
      NuevaCarta(Sender);
  end;
end;

{ Determina si la carta doc. seleccionada en la grilla para ser modificada es o no válida }
function TfrmBaseAdministracionCartas.IsRegistroModificacionValido: Boolean;
begin
  Result := False;
  // la carta no debe estar dada de baja
  if not sdqConsulta.FieldByName('ca_fechabaja').IsNull then
    InvalidMsg(Grid, 'La carta documento se encuentra dada de baja')
  // la carta no debe estar recepcionada
  else if not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull then
    InvalidMsg(Grid, 'La carta documento ya ha sido recepcionada')
  else if not IsUsuarioAreaCarta(sdqConsulta.FieldByName('ca_id').AsInteger) then
    InvalidMsg(Grid, 'El area de la carta seleccionada no corresponde con su perfil.')
  else
    Result := True;
end;

procedure TfrmBaseAdministracionCartas.fraAreaOnChange(Sender: TObject);
var sSql: String;
begin
  sSql := 'SELECT AT_ID AS ID, ' +
                ' AT_ID AS CODIGO, AT_DESCRIPCION AS DESCRIPCION, ' +
                ' AT_ID || '' - '' || AT_DESCRIPCION AS DESCRI, ' +
                ' AT_FECHABAJA AS BAJA ' +
           ' FROM CAT_AREATEXTO ';

  if fraArea.IsSelected then
    sSql := sSql + ' WHERE AT_AREA = ' + SqlValue(fraArea.Value)
  else
    sSql := sSql + ' WHERE AT_AREA IN (' + Area + ')';

  ssql := ssql + ' ORDER BY descripcion ';

  //fraModulo.Sql := sSql;
  sdqModulo.Close;
  sdqModulo.SQL.Text := ssql;
  sdqModulo.Open;
end;

{ Devuelve S/N según lo seleccionado en el radio group del código de recepción }
function TfrmBaseAdministracionCartas.GetRecepcionOk_Busqueda(rg_RecepcionOk: TRadioGroup): String;
var
  sRecepOk: String;
begin
  case rg_RecepcionOk.ItemIndex of
    0:  sRecepOk := 'S'; // si
    1:  sRecepOk := 'N'; // no
    3:  sRecepOk := 'A'; //sin acuse
  else
    sRecepOk := '';
  end;

  Result := sRecepOk;
end;

procedure TfrmBaseAdministracionCartas.RecepcionCarta;
begin
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Solo debe seleccionar una fila de la grilla.');
  edFechaRecepcion.MaxDate := DBDateTime;

  if Grid.SelectedRows.Count = 0 then
    DoRecepcionModoAlta(True)
  else begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[0]));
    if IsRegistroRecepcionCartaDocValido(sdqConsulta.FieldByName('ca_id').AsInteger) then
    begin
      edNroCartaRec.Text := StringReplace(sdqConsulta.FieldByName('nrocartadoc').AsString, '-', '', [rfReplaceAll, rfIgnoreCase]);
      edNroCartaRec.Tag  := sdqConsulta.FieldByName('ca_id').AsInteger;
      SetFraCodRecepcion(sdqConsulta.FieldbyName('correo').AsString);
      DoHabilitarIngresoCodigoRecepcion(rgRecepOk);
      if not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull then
      begin
        if MsgBox('La carta documento ya ha sido recepcionada.' + #13#10 + 'Desea modificarla?', MB_YESNO + MB_ICONINFORMATION ) = IDYES then
        begin
          ModoForm := 'modif';
          LoadDatosFormPanel;
          if (fpRecepcionCartaDoc.ShowModal = mrOk) and sdqConsulta.Active then
            sdqConsulta.Refresh;
        end;
      end
      else
        DoRecepcionModoAlta(False);
    end;
  end;
end;

procedure TfrmBaseAdministracionCartas.LoadDatosFormPanel;
begin
  if sdqConsulta.FieldByName('CA_RECEPCIONOK').AsString = 'S' then
    rgRecepOk.ItemIndex := 0
  else
    rgRecepOk.ItemIndex := 1;

  fraCodRecepcion.Value := sdqConsulta.FieldByName('CA_CODRECEPCION').AsString;
  edFechaRecepcion.Date := sdqConsulta.FieldByName('CA_FECHARECEPCION').AsDateTime;
  edObsRecepcion.Text   := sdqConsulta.FieldByName('CA_OBSERVRECEPCION').AsString;
end;

procedure TfrmBaseAdministracionCartas.ClearDatosFormPanel;
begin
  rgRecepOk.ItemIndex := -1;
  fraCodRecepcion.Clear;
  edFechaRecepcion.Clear;
  edObsRecepcion.Clear;
end;

procedure TfrmBaseAdministracionCartas.CalcularFilas;
begin
  edCantCartas.Value := grid.SelectedRows.Count;
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotalCartas.Value := sdqConsulta.RecordCount
  else
    edTotalCartas.Value := 0; 
end;

procedure TfrmBaseAdministracionCartas.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmBaseAdministracionCartas.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmBaseAdministracionCartas.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilas;
end;

procedure TfrmBaseAdministracionCartas.mnuDesMarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcularFilas;
end;

function TfrmBaseAdministracionCartas.GetSql: string;
begin
  result := 'SELECT * FROM CRC_RECEPCIONCARTADOC, CCA_CARTA WHERE CA_IDRECEPCIONCARTADOC=RC_ID(+) ' + GetWhere;
end;

function TfrmBaseAdministracionCartas.GetWhere: string;
var
   sSqlWhere, sRecepcionOK, sSqlNroLote: String;
   iloop: integer;
begin
  sSqlWhere := SqlBetween( ' AND CA_NROCARTADOC', Get_NroCarta( edNroCartaDocDesde.Text ), Get_NroCarta( edNroCartaDocHasta.Text ) ) +
               SqlBetweenDateTime( ' AND CA_FECHAIMPRESION', edFechaImpresionDesde.Date, edFechaImpresionHasta.Date ) +
               SqlBetweenDateTime( ' AND CA_FECHAREIMPRESION', edFechaReImpresionDesde.Date, edFechaReImpresionHasta.Date ) +
               SqlBetween( ' AND CA_FECHARECEPCION', edFechaRecepcionDesde.Date, edFechaRecepcionHasta.Date ) +
               SqlBetweenDateTime( ' AND CA_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date );

  if not edNroCarta.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_ID=' + SqlValue( edNroCarta.Value );

  if not fraCorreo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(CA_CORREOREIMPRESION, CA_CORREO) =' + SqlValue( fraCorreo.edCodigo.Text );

  sRecepcionOK := GetRecepcionOk_Busqueda( rgRecepcionOk );
  if sRecepcionOK <> '' then
    if sRecepcionOK = 'A' then
      sSqlWhere := sSqlWhere + ' AND CA_USURECEPCION IS NULL '
    else
      sSqlWhere := sSqlWhere + ' AND CA_USURECEPCION IS NOT NULL ' +
                               ' AND CA_RECEPCIONOK = ' + SqlValue(sRecepcionOK);

  case rgEstado.ItemIndex of
    0: sSqlWhere := sSqlWhere + ' AND CA_FECHABAJA IS NULL';
    1: sSqlWhere := sSqlWhere + ' AND CA_FECHABAJA IS NOT NULL';
  end;

  if cmbCodigosRecepcion.Text <> '' then
  begin
    sSqlWhere := sSqlWhere + ' AND CA_CODRECEPCION IN (';
    for iloop := 0 to cmbCodigosRecepcion.Items.Count - 1 do
      if cmbCodigosRecepcion.Checked[iloop] then
        sSqlWhere := sSqlWhere + '''' + (cmbCodigosRecepcion.Items.Objects[iloop] as TCadena).Cadena + ''',';
    sSqlWhere := Copy(sSqlWhere, 1, Length(sSqlWhere) - 1) + ')';
  end;

  if cmbCodigosNoRecepcion.Text <> '' then
  begin
    sSqlWhere := sSqlWhere + ' AND CA_CODRECEPCION IN (';
    for iloop := 0 to cmbCodigosNoRecepcion.Items.Count - 1 do
      if cmbCodigosNoRecepcion.Checked[iloop] then
        sSqlWhere := sSqlWhere + '''' + (cmbCodigosNoRecepcion.Items.Objects[iloop] as TCadena).Cadena + ''',';
    sSqlWhere := Copy(sSqlWhere, 1, Length(sSqlWhere) - 1) + ')';
  end;

  //if not fraModulo.IsEmpty then
  if not cmbModulo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_IDAREATEXTO ' + cmbModulo.InSql;

  if not fraArea.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND AT_AREA = ' + SqlValue(fraArea.Value);


  if not fraCodTexto.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_IDTEXTOCARTA=' + SqlValue( fraCodTexto.Value );

  if not fraCodFirmante.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=' + SqlValue( fraCodFirmante.Value );

  if cmbUsuImpresion.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CA_USUIMPRESION ' + cmbUsuImpresion.InSql;

  if cmbUsuReimpresion.Text <> '' then                                             // Lu 25/08/2008
    sSqlWhere := sSqlWhere + ' AND CA_USUREIMPRESION ' + cmbUsuReimpresion.InSql;

  if cmbUsuAlta.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CA_USUALTA ' + cmbUsuAlta.InSql;

  if chkPendienteImpresion.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_FECHAIMPRESION IS NULL' +
                             ' AND CA_FECHABAJA IS NULL';

  if chkPendienteRecepcion.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_FECHARECEPCION IS NULL' +
                             ' AND CA_FECHAIMPRESION IS NOT NULL';

  if chkPendienteRemito.Checked then
    sSqlWhere := sSqlWhere + ' AND ca_incluirenremito = ''S'' ';

  if chkPendienteReemplazo.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_FECHABAJA IS NULL' +
                             ' AND CA_IDCARTAAREEMPLAZAR IS NULL' +
                             ' AND CA_RECEPCIONOK =''N''' +
                             ' AND CA_FECHARECEPCION IS NOT NULL' +
                             ' AND CA_MANUAL=''N''';

  if chkPendienteAval.Checked then
    sSqlWhere := sSqlWhere + ' AND ((CA_IDAVALDIGITAL IS NULL) OR ' +
                                  ' (CA_IDAVALDIGITAL <> NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)))' +
                              ' AND CA_FECHAALTA >= ' + SqlDate(StrToDate(FECHA_AVAL));

  if chkAvaladas.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_IDAVALDIGITAL IS NOT NULL ' +
                             ' AND CA_IDAVALDIGITAL = NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA) ' +
                             ' AND CA_FECHAALTA >= ' + SqlDate(StrToDate(FECHA_AVAL));

  if chkVentanilla.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_VENTANILLA = ''S''';

  if chkPendEnvioVentanilla.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_VENTANILLA = ''P''';

  if (cmbDelegacion.Text <> '') then
    sSqlWhere := sSqlWhere + ' AND CA_IDDELEGACION ' + cmbDelegacion.InSql;

  if Trim(edTrackTrace.Text) <> '' then
    sSqlWhere := sSqlWhere + ' AND RC_CODIGOBARRAS_CD = ' + SqlValue(Trim(edTrackTrace.Text));

  sSqlNroLote :=  ' (SELECT 1 ' +                                                            // Ticket 55834
                     ' FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RTD_TIPODOCUMENTO ' +
                    ' WHERE DA_FECHABAJA IS NULL ' +
                      ' AND DA_IDTIPODOCUMENTO = TD_ID ' +
                      ' AND DA_CODIGODOCUMENTO = CA_NROCARTADOC ' +
                      ' AND TD_CODIGO = ' + SqlValue(CODDOC_CARTADOC) + ' ' +
                      ' AND DA_LOTE IS NOT NULL) ';

  if rbCartaNroLote_Si.Checked then                                    // Ticket 55834
    sSqlWhere := sSqlWhere + ' AND EXISTS ' + sSqlNroLote;

  if rbCartaNroLote_No.Checked then
    sSqlWhere := sSqlWhere + ' AND NOT EXISTS ' + sSqlNroLote;

  Result := sSqlWhere;
end;

procedure TfrmBaseAdministracionCartas.InicializarComponentes;
begin
  sdqUsuImpresion.Open;
  sdqUsuAlta.Open;
  sdqModulo.Open;

  with fraCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := True;
    OnChange  := fraCorreoOnChange;
  end;
  DoHabilitarCodigoNoRecepcion;

  with fraCodTexto do
  begin
    TableName   := 'CTC_TEXTOCARTA';
    FieldID     := 'TC_ID';
    FieldCodigo := 'TC_CODIGO';  // Lu 02/07
    FieldDesc   := 'TC_NOMBRE';
    FieldBaja   := 'TC_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraCodFirmante do
  begin
    TableName   := 'CFI_FIRMA';
    FieldID     := 'FI_ID';
    FieldCodigo := 'FI_ID';
    FieldDesc   := 'FI_FIRMANTE';
    FieldBaja   := 'FI_FECHABAJA';
    ShowBajas   := True;
  end;

  cmbModuloChange(nil);

  fraDomicilioDatosCartaDoc.Locked := True;
  fraDomicilioDatosActuales.Locked := True;

  edNroCartaDocDesde.Text := '3779';
  edNroCartaDocHasta.Text := '3779';

  BarProgreso.Position := 0;
  pcFiltros.ActivePageIndex := 1;
end;

procedure TfrmBaseAdministracionCartas.tbRecepcionMasivaClick(Sender: TObject);
begin
//  ImpoExpoWizard('RECCA');
end;

procedure TfrmBaseAdministracionCartas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName( 'PORCVARIABLE' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PORCVARIABLE' ) ).DisplayFormat := '% #,##0.000';

  if sdqConsulta.FieldByName( 'SUMAFIJA' ) is TFloatField then
     TFloatField( sdqConsulta.FieldByName( 'SUMAFIJA' ) ).Currency := True;

  pnlRemito.Visible := Assigned(Dataset.FindField('ca_incluirenremito'));
end;

procedure TfrmBaseAdministracionCartas.SetArea(const Value: string);
begin
  if FArea <> Value then
    begin
      FArea := Value;

      sdqModulo.SQL.Text := DoInsertarCadena(' AND at_area IN (' + FArea + ') ', sdqModulo.SQL.Text, 'order');

      sdqModulo.Close;
      StringReplace(sdqModulo.SQL.Text, 'AND at_area IN (20, 30, 80, 35, 90)', ' at_area = ' + FArea, [rfIgnoreCase]);
      sdqModulo.Open;

      with fraArea do            // Lu 02/09/2008
      begin
        TableName      := 'CTB_TABLAS';
        FieldID        := 'TB_CODIGO';
        FieldCodigo    := 'TB_CODIGO';
        FieldDesc      := 'TB_DESCRIPCION';
        FieldBaja      := 'TB_FECHABAJA';
        ExtraCondition := 'AND TB_CLAVE = ''AREA'' AND TB_CODIGO IN (' + FArea + ')';
        OrderBy        := 'TB_CODIGO';
        ShowBajas      := True;

        OnChange       := fraAreaOnChange;
      end;
    end;
end;

procedure TfrmBaseAdministracionCartas.ValidacionesAdicRegistrosEnvioVentElectronica;
begin
// Para que no de un WARNING (no hay validaciones genéricas, es por módulo)
end;

procedure TfrmBaseAdministracionCartas.ValidacionesAdicRegistrosImpresionCartaDoc;
begin
// Para que no de un WARNING (no hay validaciones genéricas, es por módulo)
end;

function TfrmBaseAdministracionCartas.ValidarGridTrackTrace: Boolean;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    InvalidMsg ( Grid, 'Debe seleccionar una fila de la grilla.' )
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg( Grid, 'Solo debe seleccionar una fila de la grilla.' )
  else
    Result := True;
end;

procedure TfrmBaseAdministracionCartas.tbTrackTraceClick(Sender: TObject);
begin
  if ValidarGridTrackTrace() then
    if fpTrackTrace.ShowModal = mrOk Then
      sdqConsulta.Refresh;
end;

function TfrmBaseAdministracionCartas.IsDatosValidosTrackTrace: Boolean;
begin
  Result := False;

  if Trim( edTrackTraceModif.Text ) = '' then
    InvalidMsg( edTrackTraceModif, 'Debe ingresar el valor de Track && Trace.' )
  else
    Result := True;
end;

procedure TfrmBaseAdministracionCartas.btnTrackTraceAceptarClick(Sender: TObject);
var
  bInsertar: Boolean;
  IdCRC: TTableId;
begin
  sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[0]) );

  if IsDatosValidosTrackTrace() then
    begin
      bInsertar := sdqConsulta.FieldByName( 'CA_IDRECEPCIONCARTADOC' ).IsNull;

      BeginTrans;
      try
        with TSql.Create( 'CRC_RECEPCIONCARTADOC' ) do
          try
            if bInsertar then
              begin
                SqlType := stInsert;
                IdCRC   := GetSecNextVal( 'SEQ_CRC_ID' );
              end
            else
              begin
                SqlType := stUpdate;
                IdCRC   := sdqConsulta.FieldByName( 'CA_IDRECEPCIONCARTADOC' ).AsInteger;
              end;

            PrimaryKey.Add( 'RC_ID',            IdCRC  );
            Fields.Add( 'RC_CODIGOBARRAS_CD',   Trim( edTrackTraceModif.Text ));

            EjecutarSqlST( Sql );
          finally
            Free;
          end;

        if bInsertar then
          with TSql.Create( 'CCA_CARTA' ) do
            try
              PrimaryKey.Add( 'CA_ID',               sdqConsulta.FieldByName( 'CA_ID' ).AsInteger );
              Fields.Add( 'CA_IDRECEPCIONCARTADOC',  IdCRC );

              SqlType := stUpdate;

              EjecutarSqlST( Sql );
            finally
              Free;
            end;

        CommitTrans;
        MsgBox( 'Track & Trace se modificó correctamente.' , MB_OK + MB_ICONINFORMATION );
        fpTrackTrace.ModalResult := mrOk;
      except
        on E:Exception do
          begin
            RollBack;
            Raise Exception.Create ( E.Message + CRLF + 'Error al actualizar Track & Trace' );
          end;
      end;
    end;
end;

procedure TfrmBaseAdministracionCartas.fpTrackTraceEnter(Sender: TObject);
begin
  edTrackTraceModif.Text := sdqConsulta.FieldByName('TRACKYTRACE').AsString;
end;

procedure TfrmBaseAdministracionCartas.DoRecepcionModoAlta(bLimpiarNro :Boolean);
begin
  ModoForm := 'alta';
  ClearDatosFormPanel;
  if bLimpiarNro then
    edNroCartaRec.Clear;
  if (fpRecepcionCartaDoc.ShowModal = mrOk) and sdqConsulta.Active then
    sdqConsulta.Refresh;
end;

procedure TfrmBaseAdministracionCartas.SetFraCodRecepcion(Cod:String);
begin
  with fraCodRecepcion do
  begin
    Clave       := 'CODRE';
    Especial1   := ValorSql('SELECT tb_especial2 ' +
                             ' FROM ctb_tablas ' +
                            ' WHERE tb_clave = ''CORRE'' ' +
                            '   AND tb_codigo = ' + SqlValue(Cod));
    ShowBajas   := False;
  end;
end;

procedure TfrmBaseAdministracionCartas.fpRecepcionCartaDocShow(Sender: TObject);
begin
  bRefrescarRec := False;
  if edNroCartaRec.CanFocus then edNroCartaRec.SetFocus;
end;

procedure TfrmBaseAdministracionCartas.btnCancelarClick(Sender: TObject);
begin
  if bRefrescarRec then
    fpRecepcionCartaDoc.ModalResult := mrOk;
end;

function TfrmBaseAdministracionCartas.IsUsuarioAreaCarta(IdCarta: Integer): Boolean;
var
  sSql: String;
begin
  sSql := ' SELECT 1 ' +
            ' FROM cat_areatexto, cau_areausuario, cta_textoarea, ' +
                 ' ctc_textocarta, cca_carta ' +
           ' WHERE at_id = au_idareatexto ' +
             ' AND at_id = ta_idareatexto ' +
             ' AND ta_idtextocarta = tc_id ' +
             ' AND au_usuario = :usuario ' +
             ' AND au_fechabaja IS NULL ' +
             ' AND tc_id = ca_idtextocarta ' +
             ' AND at_id = ca_idareatexto ' + 
             ' AND ca_id = :id ';
  Result := ExisteSqlEx(sSql, [Sesion.UserID, IdCarta]);
end;

procedure TfrmBaseAdministracionCartas.mnuAvalarFirmaDigitalClick(Sender: TObject);
var
  i, iCantAval, iSinPermiso, iAvaladas: Integer;
  sMensaje: String;
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else if MsgAsk('¿Confirma que desea avalar la firma digital de la/s carta/s seleccionada/s?') then
  try
    iCantAval     := 0;
    iSinPermiso   := 0;
    iAvaladas     := 0;
    BeginTrans;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    try
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
      if (sdqConsulta.FieldByName('ca_idavaldigital').AsInteger =
          sdqConsulta.FieldByName('codigofirma').AsInteger) then
        Inc(iAvaladas)
      else if (GetFirmaDigital(sdqConsulta.FieldByName('at_area').AsString,
                               sdqConsulta.FieldByName('at_modulo').AsString, Sesion.UserID,
                               sdqConsulta.FieldByName('codigofirma').AsInteger) = 0) then
        Inc(iSinPermiso)
      else begin
        EjecutarSqlSTEx('UPDATE cca_carta ' +
                          ' SET ca_idavaldigital = :idfirma, ' +
                              ' ca_usuavalmanual = :usu, ' +
                              ' ca_fechavalmanual = ActualDate ' +
                        ' WHERE ca_id = :id', [GetFirmaDigital(sdqConsulta.FieldByName('at_area').AsString,
                                                               sdqConsulta.FieldByName('at_modulo').AsString,
                                                               Sesion.UserID),
                                               Sesion.UserID, sdqConsulta.FieldByName('ca_id').AsInteger]);
        Inc(iCantAval);
      end;
    except
      on E:Exception do
      begin
        Rollback(True);
        ErrorMsg(E, 'Error al intentar marcar el aval de la carta ' + sdqConsulta.FieldByName('ca_id').AsString);
      end;
    end;

    if (iCantAval = 0) then
      sMensaje := 'Atención: ninguna de las cartas seleccionadas ha sido avalada.' + #13
    else if (iAvaladas > 0) or (iSinPermiso > 0) then
      sMensaje := 'Atención: al menos una de las cartas seleccionadas NO ha sido avalada.' + #13
    else
      sMensaje := 'Todas las cartas seleccionadas han sido avaladas correctamente.' + #13;

    if (iAvaladas > 0) then
      sMensaje := IIF(sMensaje <> '', sMensaje + #13, sMensaje) +
                  '- Cartas que ya se encontraban avaladas: ' + IntToStr(iAvaladas);
    if (iSinPermiso > 0) then
      sMensaje := IIF(sMensaje <> '', sMensaje + #13, sMensaje) +
                  '- Cartas sobre las cuales no se posee firmante para avalar: ' + IntToStr(iSinPermiso);

    sMensaje := IIF(sMensaje <> '', sMensaje + #13, sMensaje) +
                IIF(iCantAval > 0, '- Cantidad de cartas avaladas correctamente: ' + IntToStr(iCantAval), '');

    MsgBox(sMensaje, MB_ICONINFORMATION);
    CommitTrans;
  finally
    Grid.UnSelectAll;
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmBaseAdministracionCartas.cmbModuloChange(Sender: TObject);
begin
  if not cmbModulo.IsEmpty then
  begin
    fraCodTexto.Sql    := 'SELECT TC_ID AS ' + CD_ALIAS_ID + ', ' +
                                 'TC_CODIGO AS ' + CD_ALIAS_CODIGO + ', ' +   // Lu 02/07
                                 'TC_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                                 'TC_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                            'FROM CTC_TEXTOCARTA, CTA_TEXTOAREA ' +
                           'WHERE TC_ID=TA_IDTEXTOCARTA ' +
                             'AND TA_IDAREATEXTO ' + cmbModulo.InSql;

    fraCodFirmante.Sql := 'SELECT FI_ID AS ' + CD_ALIAS_ID + ', ' +
                                 'FI_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                 'FI_FIRMANTE AS ' + CD_ALIAS_DESC + ', ' +
                                 'FI_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                            'FROM CFI_FIRMA, CFA_FIRMANTEAREA ' +
                           'WHERE FI_ID=FA_IDFIRMANTE ' +
                             'AND FA_IDAREATEXTO ' + cmbModulo.InSql;
  end
  else begin
    fraCodTexto.Sql    := 'SELECT DISTINCT TC_ID AS ' + CD_ALIAS_ID + ', ' +
                                 'TC_CODIGO AS ' + CD_ALIAS_CODIGO + ', ' +    // Lu 02/07
                                 'TC_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                                 'TC_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                            'FROM CTC_TEXTOCARTA, CAT_AREATEXTO, CTA_TEXTOAREA ' +
                           'WHERE TC_ID=TA_IDTEXTOCARTA ' +
                             'AND AT_ID=TA_IDAREATEXTO ' +
                             'AND AT_AREA IN (' + SqlValue(Area) + ')';

    fraCodFirmante.Sql := 'SELECT DISTINCT FI_ID AS ' + CD_ALIAS_ID + ', ' +
                                 'FI_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                 'FI_FIRMANTE AS ' + CD_ALIAS_DESC + ', ' +
                                 'FI_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                            'FROM CFI_FIRMA, CFA_FIRMANTEAREA, CAT_AREATEXTO ' +
                           'WHERE FI_ID=FA_IDFIRMANTE ' +
                             'AND AT_ID=FA_IDAREATEXTO ' +
                             'AND AT_AREA IN (' + SqlValue(Area) + ')';
  end;

end;

function TfrmBaseAdministracionCartas.IsCartaDeIncapacidades(sIdTextoCarta: string): Boolean;  // TK 45302
begin
  Result := (ValorSqlEx('SELECT TA_IDAREATEXTO FROM CTA_TEXTOAREA WHERE TA_IDTEXTOCARTA = :TextoCarta', [sIdTextoCarta]) = AREA_INCAP_CARTAS);
end;

procedure TfrmBaseAdministracionCartas.btnAceptarFirmanteIncapClick(Sender: TObject);
begin
  fpFirmanteIncapacidades.ModalResult := mrOk;
end;

procedure TfrmBaseAdministracionCartas.fpFirmanteIncapacidadesBeforeShow(Sender: TObject);
begin
  fraFirmanteIncap.edCodigo.text       := sdqConsulta.FieldByName('CA_IDFIRMA').AsString;
  fraFirmanteIncap.cmbDescripcion.Text := sdqConsulta.FieldByName('FI_FIRMANTE').AsString;
  lblCarta.Caption := sdqConsulta.FieldByName('nrocartadoc').AsString + ' Cod.Carta ' + sdqConsulta.FieldByName('TC_CODIGO').AsString;
end;

procedure TfrmBaseAdministracionCartas.Do_UpdatearFirmanteCarta(iIdCarta: integer; sIdFirmante: string);
begin
  EjecutarSqlSTEx('UPDATE CCA_CARTA ' +
                    ' SET ca_idfirma = :idfirma ' +
                  ' WHERE ca_id = :idCarta', [sIdFirmante, iIdCarta]);
end;

procedure TfrmBaseAdministracionCartas.btnDigAceptarClick(Sender: TObject);
begin
  if fraSDA_DETALLEARCHIVO.Validate then     // TK 52799
    fpDigitalizar.ModalResult := mrOk;
end;

procedure TfrmBaseAdministracionCartas.SetEnviarPorVentanilla(const Value: Boolean);
begin
  FEnviarPorVentanilla           := Value;
  rbVentanilla.Visible           := Value;
  chkPendEnvioVentanilla.Visible := Value;
end;

procedure TfrmBaseAdministracionCartas.btnPararClick(Sender: TObject);
begin
  PararImpresion   := True;
  btnParar.Enabled := False;
end;

procedure TfrmBaseAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
begin
  AceptarImpresion;
end;

procedure TfrmBaseAdministracionCartas.AceptarImpresion;
begin
  CarpetaDestinoVE   := '';
  TipoComunicacionVE := ART_EMPTY_ID;
  ComunicacionVE     := '';

  if rbVentanilla.Checked then
    begin
      if IsRegistrosEnvioVentElectronicaValidos() then
        begin
          with TfrmSeleccionarCarpetaSrt.Create(Self) do
            try
              Caption              := 'Ventanilla Electrónica';
              chkEnviarSrt.Checked := True;

              VCLExtra.LockControls([chkEnviarSrt]);
              VCLExtra.LockControls([btnSeleccionarCarpeta], not SeleccionarCarpetaVE);

              // en cada sistema deberá setearse esto cuando implemente la Ventanilla Electrónica (tabla SRT.SES_ESERVICIOSSECTOR)
              if FArea = AREA_COB then
                IdsSector := '5'              // Contratos - Cobranzas
              else if FArea = AREA_MLB then
                IdsSector := ''
              else if FArea = AREA_EMI then
                IdsSector := ''
              else if FArea = AREA_LEG then
                IdsSector := ''
              else if InStr(FArea, AREA_DIN) > 0 then
                IdsSector := '';

              if ShowModal = mrOk then
                begin
                  CarpetaDestinoVE   := CarpetaDestino;
                  TipoComunicacionVE := TipoComunicacion;
                  ComunicacionVE     := Comunicacion;
                end;
            finally
              Free;
            end
        end;
    end;
end;

function TfrmBaseAdministracionCartas.ContinuarImpresion: Boolean;
begin
  Result := (not rbVentanilla.Checked or (TipoComunicacionVE <> ART_EMPTY_ID));
end;

function TfrmBaseAdministracionCartas.IsRegistrosEnvioVentElectronicaValidos: Boolean;
var
  i: Integer;
  sArea, sModulo: String;
begin
  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        // todas las cartas de la misma area y módulo
        if i = 0 then
          begin
            sArea   := sdqConsulta.FieldByName('AT_AREA').AsString;
            sModulo := sdqConsulta.FieldByName('AT_MODULO').AsString;
          end
        else
          begin
            Verificar(sArea <> sdqConsulta.FieldByName('AT_AREA').AsString, Grid, 'Todas las cartas seleccionadas deben corresponder al mismo area.');
            Verificar(sModulo <> sdqConsulta.FieldByName('AT_MODULO').AsString, Grid, 'Todas las cartas seleccionadas deben corresponder al mismo módulo.');
          end;

        ValidacionesAdicRegistrosEnvioVentElectronica;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;

procedure TfrmBaseAdministracionCartas.tbGenerarRemitoClick(Sender: TObject);
begin
  Verificar(edFechaImpresionDesde.IsEmpty and edFechaImpresionHasta.IsEmpty and
            edFechaReImpresionDesde.IsEmpty and edFechaReImpresionHasta.IsEmpty and
            edFechaRecepcionDesde.IsEmpty and edFechaRecepcionHasta.IsEmpty and
            edFechaAltaDesde.IsEmpty and edFechaAltaHasta.IsEmpty, nil,
            'Debe seleccionar un rango de fechas para generar el remito.');
  Verificar((cmbUsuAlta.Text = '') and (cmbUsuImpresion.Text = ''), nil,
             'Debe seleccionar Usuario de alta o de impresión para generar el remito.');  // TK 7715

  fraCuentaUsuario.Codigo := Sesion.UserID;
  edPorFuera.Clear;
  edObsRemito.Clear;
  fpGenerarRemito.ShowModal;
end;

procedure TfrmBaseAdministracionCartas.tbRemitoClick(Sender: TObject);
var
  sSql :String;
  bCambio :Boolean;
begin
  bCambio := not tbRemito.Down;
  if (Grid.SelectedRows.Count = 0) or (Grid.SelectedRows.Count > 1) then
    InvalidHint(Grid, 'Debe seleccionar una fila de la grilla.')
  else if (sdqConsulta.FieldByName('ca_ventanilla').AsString = 'S') then
    InvalidHint(Grid, 'La carta ha sido generada para subir a Ventanilla Electrónica')
  else if not(sdqConsulta.FieldByName('ca_fechabaja').IsNull) then
    InvalidHint(Grid, 'La carta se encuentra dada de baja.')
  else if not(sdqConsulta.FieldByName('ca_idremito').IsNull) and
          not(sdqConsulta.FieldByName('ca_idremitoreimpresion').IsNull) then
    InvalidHint(Grid, 'La carta ya está incluida en un remito, no es posible cambiar su estado.')
  else if sdqConsulta.FieldByName('fechaimpresion').IsNull then
    InvalidHint(Grid, 'La carta aún no se encuentra impresa.')
  else if tbRemito.Down and not(sdqConsulta.FieldByName('ca_idremito').IsNull) and
          sdqConsulta.FieldByName('ca_idremitoreimpresion').IsNull and
          sdqConsulta.FieldByName('fechareimpresion').IsNull then
    InvalidHint(Grid, 'La carta aún no se encuentra re-impresa.')
  else begin
    if (tbRemito.Down and MsgAsk('¿Confirma incluir en el próximo remito a la carta seleccionada?')) or
       (not(tbRemito.Down) and MsgAsk('¿Confirma excluir del próximo remito a la carta seleccionada?')) then
    try
      sSql := 'UPDATE cca_carta ' +
                ' SET ca_incluirenremito = ' + SqlString(IIF(tbRemito.Down, 'S', 'N'), True)  +
              ' WHERE ca_id = ' + SqlInt(sdqConsulta.FieldByName('ca_id').AsInteger);
      EjecutarSql(sSql);
      bCambio := tbRemito.Down;
    finally
      Grid.UnSelectAll;
      sdqConsulta.Refresh;
    end;
  end;
  tbRemito.Down := bCambio;
end;

procedure TfrmBaseAdministracionCartas.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
    tbRemito.Down := Assigned(FindField('ca_incluirenremito')) and (FieldByName('ca_incluirenremito').AsString = 'S');
end;

procedure TfrmBaseAdministracionCartas.btnAceptarRemitoClick(Sender: TObject);
  procedure DoInsertarRemito(iCant, iRemito :Integer; bInsertado :Boolean);
  var
    sSql :String;
  begin
    if (iCant = 1) and not(bInsertado) then
    begin
      sSql := 'INSERT INTO crc_remitoscartas ' +
              '(rc_id, rc_idcuenta, rc_fechaalta, rc_usualta) VALUES ( ' +
              SqlInt(iRemito) + ',' + SqlInt(fraCuentaUsuario.ID) + ',' +
              'ActualDate, ' + SqlValue(Sesion.UserID) + ')';
      EjecutarSqlST(sSql);
    end;
  end;
var
  i, iCant, iRemito, iTotal :Integer;
  sSql, sCampo :String;
  bInsertado :Boolean;
begin
  Verificar(fraCuentaUsuario.IsEmpty, fraCuentaUsuario, 'Debe seleccionar una cuenta para el remito.');
  try
    iRemito := ValorSqlInteger('SELECT NVL(MAX(rc_id), 0) + 1  ' +
                                ' FROM crc_remitoscartas ');
    BeginTrans(True);
    Cursor := crSQLWait;
    Grid.SelectAll;
    iCant       := 0;
    bInsertado  := False;
    if (edPorFuera.Value > 0) then
    begin
      DoInsertarRemito(1, iRemito, False);
      bInsertado := True;
    end;

    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
      if sdqConsulta.FieldByName('ca_fechabaja').IsNull and
         (sdqConsulta.FieldByName('ca_idremito').IsNull or
          sdqConsulta.FieldByName('ca_idremitoreimpresion').IsNull) and
         (sdqConsulta.FieldByName('ca_incluirenremito').AsString = 'S') then
      begin
        Inc(iCant);
        DoInsertarRemito(iCant, iRemito, bInsertado);
        sCampo := IIF(sdqConsulta.FieldByName('ca_idremito').IsNull,
                      ' ca_idremito = ', ' ca_idremitoreimpresion = ');
        sSql := ' UPDATE cca_carta ' +
                   ' SET ca_incluirenremito = ''N'', ' +
                         sCampo + SqlInt(iRemito) + ',' +
                       ' ca_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' ca_fechamodif = actualdate ' +
                 ' WHERE ca_id = ' + SqlInt(sdqConsulta.FieldByName('ca_id').AsInteger);
        EjecutarSqlST(sSql);
      end;
    end;
    Grid.UnselectAll;
    Cursor := crDefault;                                  
    if (iCant = 0) and not(bInsertado) then
    begin
      Rollback(True);
      MsgBox('Atención: ninguna de las cartas está disponible para el próximo remito', MB_ICONINFORMATION);
    end
    else begin
      iTotal  := iCant + edPorFuera.Value;
      sSql    := 'UPDATE crc_remitoscartas ' +
                   ' SET rc_cantcartas = ' + SqlInt(iTotal) + ',' +
                       ' rc_cantfuera = ' + SqlInt(edPorFuera.Value) + ',' +
                       ' rc_observaciones = ' + SqlValue(edObsRemito.Lines.Text) +
                 ' WHERE rc_id = ' + SqlInt(iRemito);
      EjecutarSqlST(sSql);
      CommitTrans(True);
      DoImprimirRemito(iRemito);
      MsgBox('Se ha generado correctamente el remito número ' + IntToStr(iRemito) + ' con ' + IntToStr(iTotal) + ' cartas.', MB_ICONINFORMATION);
      sdqConsulta.Refresh;
    end;
    fpGenerarRemito.ModalResult := mrOk;
  except
    on E:Exception do
    begin
      Grid.UnselectAll;
      Cursor := crDefault;
      ErrorMsg(E, 'Error al intentar generar el remito');
      Rollback(True);
    end;
  end;
end;

procedure TfrmBaseAdministracionCartas.tbLimpiarRemitoClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmBaseAdministracionCartas.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

end.

