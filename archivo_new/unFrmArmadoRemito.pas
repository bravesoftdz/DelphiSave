{-----------------------------------------------------------------------------
 Unit Name: unFrmArmadoRemito
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Armado de Remito conteniendo lotes entregados por los usuarios.
            Este módulo está destinado a usuarios del sector documentación
            ya que es parte del circuito de administración.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unFrmArmadoRemito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, ExtCtrls, unFraFiltroArchivo, PatternEdit,
  IntEdit, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unFraCodigoDescripcion, unFraUsuario, ComCtrls, JvExComCtrls, JvComCtrls,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, GroupCheckBox, ComboEditor,
  CheckCombo, DBCheckCombo, ActnList, unSesion, FormPanel,
  unArtDBAwareFrame, Menus, CardinalEdit, unArt,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unfraCtbTablas,
  RxToolEdit, RxPlacemnt;

type
  TFrmArmadoRemito = class(TfrmCustomConsulta)
    DSQUsuario: TSDQuery;
    DSUsuario: TDataSource;
    gbOpcionesBusqueda: TGroupBox;
    rgEstado: TRadioGroup;
    ChkGrp: TCheckGroup;
    gbBusquedaGeneral: TGroupBox;
    lblUsuario: TLabel;
    lblFechaMovimientoDesde: TLabel;
    lblNroLote: TLabel;
    lblHastaNroLote: TLabel;
    lblSector: TLabel;
    edFechaMovimientoDesde: TDateComboBox;
    edFechaMovimientoHasta: TDateComboBox;
    edLoteDesde: TIntEdit;
    edLoteHasta: TIntEdit;
    fraSectoresBusqueda: TfraCodigoDescripcion;
    cmbUsuarios: TDBCheckCombo;
    fraFiltroArchivoBusqueda: TfraCodigoDescripcion;
    lblArchivo: TLabel;
    fpCreacionRemito: TFormPanel;
    BevelAbm1: TBevel;
    Label4: TLabel;
    btnGenerarLote: TButton;
    btnCancelarGeneracionLote: TButton;
    edNumeroLote: TPatternEdit;
    lvLotesSeleccionados: TListView;
    Label1: TLabel;
    tbAdministracionLotes: TToolBar;
    tbAgregarLote: TToolButton;
    tbEliminarLote: TToolButton;
    Label2: TLabel;
    Label5: TLabel;
    ShortCutControl1: TShortCutControl;
    Label6: TLabel;
    fraTipoArchivo: TfraCodigoDescripcion;
    Label7: TLabel;
    Label8: TLabel;
    edFechaRemitoDesde: TDateComboBox;
    Label9: TLabel;
    edFechaRemitoHasta: TDateComboBox;
    Label10: TLabel;
    edRemitoDesde: TIntEdit;
    Label11: TLabel;
    edRemitoHasta: TIntEdit;
    Label12: TLabel;
    edCantLotes: TIntEdit;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbEnviarMails: TToolButton;
    pmnuImpresion: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirRemito: TMenuItem;
    pmnuExportar: TPopupMenu;
    pmnuExpRemitoLotes: TMenuItem;
    pmnuExpDetRemitoLotes: TMenuItem;
    ExportDialogDetRemLotes: TExportDialog;
    sdqConsultaDetRemitoLotes: TSDQuery;
    Label13: TLabel;
    fraSector: TfraCodigoDescripcion;
    Label14: TLabel;
    edObservaciones: TMemo;
    btnGuardarLote: TButton;
    Label15: TLabel;
    edFechaCajaDesde: TDateComboBox;
    Label16: TLabel;
    edFechaCajaHasta: TDateComboBox;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    mnuGenerarRemito: TMenuItem;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    rgCD: TRadioGroup;
    edCajaDesde: TPatternEdit;
    tbEliminarLoteCaja: TToolButton;
    fpEliminarLoteCaja: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarEliminarLoteCaja: TButton;
    btnCancelarEliminarLoteCaja: TButton;
    fraUsuarioElimLoteCaja: TfraUsuarios;
    Label3: TLabel;
    Label17: TLabel;
    edCantCajas: TIntEdit;
    Label18: TLabel;
    edNroCD: TIntEdit;
    fraNumeroCajaAux: TfraCtbTablas;
    rgAdministradora: TRadioGroup;
    pmnuMails: TPopupMenu;
    mnuEnviarMailRemito: TMenuItem;
    mnuEnviarMailLotesPendDigitalizacion: TMenuItem;
    Label19: TLabel;
    edRemitoAntDesde: TIntEdit;
    Label20: TLabel;
    edRemitoAntHasta: TIntEdit;
    tbEliminarCajaRemito: TToolButton;
    ToolButton2: TToolButton;
    edNumeroCaja: TEdit;
    rgTipoBulto: TRadioGroup;
    Label21: TLabel;
    edCantSobres: TIntEdit;
    Label22: TLabel;
    edCantBultos: TIntEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarLoteClick(Sender: TObject);
    procedure edNumeroLoteKeyPress(Sender: TObject; var Key: Char);
    procedure tbAgregarLoteClick(Sender: TObject);
    procedure btnGenerarLoteClick(Sender: TObject);
    procedure fpCreacionRemitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirRemitoClick(Sender: TObject);
    procedure edNumeroCajaKeyPress(Sender: TObject; var Key: Char);
    procedure tbExportarClick(Sender: TObject);
    procedure pmnuExpDetRemitoLotesClick(Sender: TObject);
    procedure edNumeroLoteExit(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure mnuGenerarRemitoClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbEliminarLoteCajaClick(Sender: TObject);
    procedure btnAceptarEliminarLoteCajaClick(Sender: TObject);
    procedure fpEliminarLoteCajaEnter(Sender: TObject);
    procedure edLoteDesdeExit(Sender: TObject);
    procedure pmnuExpRemitoLotesClick(Sender: TObject);
    procedure tbEnviarMailsClick(Sender: TObject);
    procedure mnuEnviarMailRemitoClick(Sender: TObject);
    procedure mnuEnviarMailLotesPendDigitalizacionClick(Sender: TObject);
    procedure tbEliminarCajaRemitoClick(Sender: TObject);
    procedure edNumeroCajaExit(Sender: TObject);
    procedure edNumeroCajaChange(Sender: TObject);
    procedure fraNumeroCajaAuxChange(Sender: TObject);
  protected
    procedure RefreshData; override;
    procedure ClearData; override;
  private
    FSqlBase : string;
    pbHuboCambios: Boolean;
    procedure CrearNuevoRemito;
    procedure LimpiarRemito;
    procedure VerificarAltaGrilla(AIdLote: Integer; ACaja, ACodTipoBulto: String);
    procedure VerificarLote(AIdLote: Integer; ACaja, ACodTipoBulto: String; EsAlta: Boolean; var OpcionDestino: String);
    procedure AgregarLote(ANumeroLote, ACaja, ACodCaja, AObservaciones: String; IndTipoBulto: Integer);
    function  InsertarRemito(AObservaciones: string): Integer;
    procedure IncluirLoteARemito(AIdRemito: Integer);
    procedure IncorporarRemitoALote(IdRemito, Secuencia, IdLote: Integer);
    procedure ImprimirRemito(AIdRemito: Integer; Preview: Boolean = False; eMail: String = '');
    function GenerarRemito(GuardaryGenerar: Boolean): Boolean;
    procedure ActualizarCantLotes;
    procedure EnviarRemitoPorMail(IdRemito: Integer);
    function VerificarImpresionRemito: Boolean;
    procedure CargarDatosLote(NroLote: String);
    function GenerarRemitoGrilla: Boolean;
    function VerificarDestinosGrilla: Boolean;
    procedure CalcularFilasSel;
    procedure InicializarContadores;
    procedure ActualizarCantCajas;
    procedure ActualizarCantSobres;
    procedure ActualizarCantBultos(TipoBulto: String; edCant: TIntEdit);
    procedure ActualizarCant;
    procedure DoValidarYCargarLotesSeleccionados;
    procedure DoEnviarMailLotesPendDigitalizacion;
    function VerificarBorradoCajasRemito: Boolean;
    procedure DoBorrarCajasRemito;
    procedure DoProcesarNroCaja(Caja: String);
    function GetCodTipoBultoGrilla(Pos: Integer): String;
    function GetCodTipoBultoRadioGroup(Indice: Integer): String;
    function GetCodTipoBulto(Descripcion: String): String;
    procedure DoLimpiarTipoBulto;
  public
    class procedure DoMostrarRemito(Remito: TTableId);
  end;

var
  FrmArmadoRemito: TFrmArmadoRemito;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs,  unArchivo, 
  unConstantArchivo, strFuncs, unUtilsArchivo, unComunesMail, ArchFuncs,
  unQrDetalleRemito, VCLExtra, SendKey, General, unEspera, unComunes,
  DataToXLS;

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.FormCreate(Sender: TObject);
begin
  with fraSectoresBusqueda do
  begin
    TableName   := 'USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraSector do
  begin
    TableName   := 'USC_SECTORES';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_CODIGO';
    FieldDesc   := 'SC_DESCRIPCION';
    FieldBaja   := 'SC_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraFiltroArchivoBusqueda do
  begin
    TableName   := 'RTA_TIPOARCHIVO';
    FieldID     := 'TA_ID';
    FieldCodigo := 'TA_CODIGO';
    FieldDesc   := 'TA_DESCRIPCION';
    FieldBaja   := 'TA_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraTipoArchivo do
  begin
    TableName   := 'RTA_TIPOARCHIVO';
    FieldID     := 'TA_ID';
    FieldCodigo := 'TA_CODIGO';
    FieldDesc   := 'TA_DESCRIPCION';
    FieldBaja   := 'TA_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraNumeroCajaAux do
  begin
    Clave     := 'CRAGA';
    ShowBajas := False;
    OnChange  := fraNumeroCajaAuxChange;
  end;

  DSQUsuario.Open;

  VALOR_PARAMETRO_PREVISIMPRESIONREMITO :=
        StrToBoolDef(get_ParametrobyId(PARAMETRO_PREVISIMPRESIONREMITO),
                                       VALOR_PARAMETRO_PREVISIMPRESIONREMITO);

  FSqlBase := 'SELECT LO_ID, LO_IDREMITO, LO_OBSERVAC_REMITO, ' +
                     'DECODE (LO_OPCIONDESTINO, ' +
                             '''D'', ''DIGITALIZACIÓN'', ' +
                             '''G'', ''GUARDA'', ' +
                             '''A'', ''ARCHIVO ART'', ' +
                             '''S'', ''Sin Papel'', ' +
                             '''U'', ''DIGIT. POR USUARIO'' ' +
                             ') LO_OPCIONDESTINO, ' +
                     'DECODE (LO_TIPOUBICACION, ' +
                             '''U'', ''USUARIO'', ' +
                             '''G'', ''ADMINISTRADORA'' ' +
                             ') TIPOUBICACIONLOTE, ' +
                     'TA_DESCRIPCION, LO_OPCIONDESTINO LO_IDOPCIONDESTINO, TRUNC(LO_FECHAALTA) LO_FECHAALTA, ' +
                     'TRUNC(RE_FECHAALTA) RE_FECHAALTA, RE_USUALTA, LO_UBICACION, ' +
                     'RE_OBSERVACIONES, LO_CAJA CAJA, LO_FECHAALTA_CAJA, RE_ID, ' +
                     'ARCHIVO.GET_NROCD_LOTE(LO_ID) NROCD, RE_FECHABAJA, ' +
                     'ARCHIVO.GET_DIASDEVOLUC_ADMINISTRADORA(LO_ID) DIASDEVOLADMIN, ' +
                     'LO_ESTADO CODESTADO, LO_IDREMITOANT, LO_CAJAANT CAJAANT, ' +
                     '(CASE WHEN LO_TIPOBULTO = ''C'' THEN ''Caja'' ' +
                           'WHEN LO_TIPOBULTO = ''S'' THEN ''Sobre'' ' +
                      'ELSE NULL END) TIPOBULTO, LO_TIPOBULTO ' +
                'FROM USE_USUARIOS, RLO_LOTE, RRE_REMITO, RTA_TIPOARCHIVO ' +
               'WHERE LO_IDREMITO = RE_ID(+) ' +
                 'AND LO_TIPO = TA_ID ' +
                 'AND LO_FECHABAJA IS NULL ' +
                 'AND LO_USUALTA = SE_USUARIO(+) ';

  VCLExtra.LockControls([fraTipoArchivo, fraSector, edCantLotes, edCantCajas, edCantSobres, edCantBultos]);
  tbEliminarLoteCaja.Left := 100;

  Self.Width := Self.Width + 1;   // sinó, hay un problema con los botones de la toolbar, que cambian su funcionalidad al no estar maximizada la pantalla...

  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ClearData;
begin
  fraSectoresBusqueda.Clear;
  fraFiltroArchivoBusqueda.Clear;
  cmbUsuarios.Clear;
  edFechaMovimientoDesde.Clear;
  edFechaMovimientoHasta.Clear;
  edLoteDesde.Clear;
  edLoteHasta.Clear;
  edCajaDesde.Clear;
  edFechaRemitoDesde.Clear;
  edFechaRemitoHasta.Clear;
  edRemitoDesde.Clear;
  edRemitoHasta.Clear;
  edRemitoAntDesde.Clear;
  edRemitoAntHasta.Clear;
  edFechaCajaDesde.Clear;
  edFechaCajaHasta.Clear;
  edNroCD.Clear;
  ChkGrp.Clear(False);
  rgEstado.ItemIndex         := 0;  // Sin Remito - Sin Caja Asignada
  rgCD.ItemIndex             := 2;  // Todos
  rgAdministradora.ItemIndex := 2;  // Todos

  InicializarContadores;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.RefreshData;
var
  sSql: string;
  StrDestino : string;
begin
  DoPerderFoco(Grid, Grid);

  Verificar((not edNroCD.IsEmpty or (rgCD.ItemIndex = 0)) and IsEmptyString(edCajaDesde.Text) and edFechaMovimientoDesde.IsEmpty and edFechaMovimientoHasta.IsEmpty, nil, 'Si busca por Nro. de CD o Con CD, entonces debe indicar el Nro. de Caja o el rango de fechas desde-hasta de carga del lote.');
  Verificar(((rgAdministradora.ItemIndex = 0) or (rgAdministradora.ItemIndex = 1)) and ((rgEstado.ItemIndex <> 2) and (rgEstado.ItemIndex <> 3)), nil, 'Si busca por Lotes Pendientes de Digitalización o Digitalizados por la Administradora, entonces el Estado del Lote debe ser Remitos Emitidos o Todos.');

  sdqConsulta.Close;
  sSql := FSqlBase;

  sSql :=  sSql + SqlBetweenDateTime(' AND LO_FECHAALTA ', edFechaMovimientoDesde.Date, edFechaMovimientoHasta.Date) +
                  SqlBetween(' AND LO_ID ', edLoteDesde.Value, edLoteHasta.Value) +
                  SqlBetweenDateTime(' AND RE_FECHAALTA ', edFechaRemitoDesde.Date, edFechaRemitoHasta.Date) +
                  SqlBetweenDateTime(' AND LO_FECHAALTA_CAJA ', edFechaCajaDesde.Date, edFechaCajaHasta.Date) +
                  SqlBetween(' AND RE_ID ', edRemitoDesde.Value, edRemitoHasta.Value) +
                  SqlBetween(' AND LO_IDREMITOANT ', edRemitoAntDesde.Value, edRemitoAntHasta.Value);

  if not IsEmptyString(edCajaDesde.Text) then   // búsqueda solo por el nro. de la caja (sin su descripción)
    sSql :=  sSql + ' AND LO_CAJA LIKE ' + SqlValue(Trim(edCajaDesde.Text) + '%') +   // esta condición es necesaria pero no suficiente
                    ' AND SUBSTR(LO_CAJA, 1, DECODE(INSTR(LO_CAJA, '' ''), 0, 100, INSTR(LO_CAJA, '' '')-1)) = ' + SqlValue(Trim(edCajaDesde.Text));  // me quedo solo con el nro. de la caja

  if not edNroCD.IsEmpty then
    sSql := sSql + ' AND ARCHIVO.GET_NROCD_LOTE(LO_ID) = ' + SqlValue(edNroCD.Value);

  if fraSectoresBusqueda.IsSelected then                        
    sSql := sSql + ' AND SE_SECTOR = ' + SqlValue(fraSectoresBusqueda.Codigo);

  if cmbUsuarios.Text  <> '' then
    sSql := sSql + ' AND (LO_USUALTA ' + cmbUsuarios.InSql + ')';

  StrDestino:= ' AND LO_OPCIONDESTINO IN ( ';
        if ChkGrp.Checked[0] then StrDestino:= StrDestino + '''A'',';
        if ChkGrp.Checked[1] then StrDestino:= StrDestino + SqlValue(OPCION_DESTINO_DIGITALIZACION) + ',';
        if ChkGrp.Checked[2] then StrDestino:= StrDestino + SqlValue(OPCION_DESTINO_GUARDA) + ',';
        if ChkGrp.Checked[3] then StrDestino:= StrDestino + SqlValue(OPCION_DESTINO_DIGITUSUARIO) + ',';
        SetLength(StrDestino, Length(StrDestino)-1);
  StrDestino:= StrDestino + ')';

  if Pos('()', StrDestino) > 0 then
    StrDestino:= '';

  sSql := sSql + StrDestino;

  case rgEstado.ItemIndex of
    0: sSql := sSql + ' AND LO_IDREMITO IS NULL' +
                      ' AND LO_CAJA IS NULL';
    1: sSql := sSql + ' AND LO_IDREMITO IS NULL' +
                      ' AND LO_CAJA IS NOT NULL';
    2: sSql := sSql + ' AND LO_IDREMITO IS NOT NULL';
  end;

  case rgCD.ItemIndex of
    0: sSql := sSql + ' AND ARCHIVO.GET_NROCD_LOTE(LO_ID) IS NOT NULL'; // Con CD
    1: sSql := sSql + ' AND ARCHIVO.GET_NROCD_LOTE(LO_ID) IS NULL';     // Sin CD
  end;

  if fraFiltroArchivoBusqueda.IsSelected then
    sSql := sSql + ' AND LO_TIPO = ' + SqlValue(fraFiltroArchivoBusqueda.Value);

  if (rgAdministradora.ItemIndex = 0) or (rgAdministradora.ItemIndex = 1) then
    begin
      sSql := sSql + ' AND LO_FECHAALTAEXTRAVIADO IS NULL' +
                     ' AND LO_ESTADO = ' + SqlValue(ESTADOLOTE_ADMINISTRADORA);

      if rgAdministradora.ItemIndex = 0 then
        sSql := sSql + ' AND NOT EXISTS (SELECT 1' +
                                         ' FROM RRA_REPOSITORIOARCHIVO' +
                                        ' WHERE RA_FECHABAJA IS NULL' +
                                          ' AND RA_LOTE = LO_ID)'
      else
        sSql := sSql + ' AND EXISTS (SELECT 1' +
                                     ' FROM RRA_REPOSITORIOARCHIVO' +
                                    ' WHERE RA_FECHABAJA IS NULL' +
                                      ' AND RA_LOTE = LO_ID)';
    end;

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ImprimirRemito(AIdRemito: Integer; Preview: Boolean = False; eMail: String = '');
begin
  with TQrDetalleRemito.Create(self) do
    try
      ImprimirRemito(AIdRemito, Preview or VALOR_PARAMETRO_PREVISIMPRESIONREMITO, eMail);
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbNuevoClick(Sender: TObject);
begin
  inherited;

  CrearNuevoRemito;        
  if pbHuboCambios then
    Refreshdata;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbAgregarLoteClick(Sender: TObject);
begin
  DoPerderFoco(edNumeroLote, edObservaciones);

  Verificar(IsEmptyString(edNumeroCaja.Text), edNumeroCaja, 'Debe seleccionar un número de etiqueta.');
  Verificar(Length(Trim(Trim(edNumeroCaja.Text) + ' ' + Trim(fraNumeroCajaAux.cmbDescripcion.Text))) > 100, edNumeroCaja, 'Puede ingresar como máximo 100 caracteres para el nro. completo de etiqueta.');
  Verificar(IsEmptyString(edNumeroLote.Text), edNumeroLote, 'Debe seleccionar un número de lote a incluir.');
  Verificar(rgTipoBulto.ItemIndex = -1, rgTipoBulto, 'Debe indicar el tipo de bulto.');

  AgregarLote(edNumeroLote.Text, Trim(Trim(edNumeroCaja.Text) + ' ' + Trim(fraNumeroCajaAux.cmbDescripcion.Text)), fraNumeroCajaAux.Codigo, edObservaciones.Lines.Text, rgTipoBulto.ItemIndex);

  edNumeroLote.Text := '';
  edObservaciones.Clear;
  edNumeroLote.SetFocus;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbEliminarLoteClick(Sender: TObject);
begin
  if Assigned(lvLotesSeleccionados.Selected) then
    begin
      lvLotesSeleccionados.DeleteSelected;
      ActualizarCant();
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.edNumeroLoteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
    tbAgregarLote.Click;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.btnGenerarLoteClick(Sender: TObject);
var
  bGuardaryGenerar: Boolean;
begin
  bGuardaryGenerar := (Sender = btnGenerarLote);

  if GenerarRemito(bGuardaryGenerar) then
    begin
      LimpiarRemito;
      pbHuboCambios := True;
      edNumeroCaja.SetFocus;
    end;
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.GenerarRemito(GuardaryGenerar: Boolean): Boolean;
var
 IdRemito : integer;
begin
  Result := False;

  Verificar(lvLotesSeleccionados.Items.Count = 0, lvLotesSeleccionados,  'Debe seleccionar al menos un lote para poder generar el remito.');

  BeginTrans(True);
  try
    if GuardaryGenerar then
      IdRemito := InsertarRemito('')
    else
      IdRemito := ART_EMPTY_ID;

    IncluirLoteARemito(IdRemito);

    if GuardaryGenerar then
      ImprimirRemito(IdRemito);

    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    MessageDlg('Error al generar el remito.', mtError, [mbOK], 0);
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.LimpiarRemito;
begin
  edNumeroCaja.Clear;
  fraNumeroCajaAux.Clear;
  edNumeroLote.Clear;
  edObservaciones.Clear;
  fraTipoArchivo.Clear;
  fraSector.Clear;
  lvLotesSeleccionados.Clear;
  rgTipoBulto.ItemIndex := -1;
  edCantLotes.Value     := 0;
  edCantCajas.Value     := 0;
  edCantSobres.Value    := 0;
  edCantBultos.Value    := 0;

  pbHuboCambios := False;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.CrearNuevoRemito;
begin
  LimpiarRemito;
  fpCreacionRemito.ShowModal;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.VerificarLote(AIdLote: Integer; ACaja, ACodTipoBulto: String; EsAlta: Boolean; var OpcionDestino: String);
var
  sSql: String;
begin
  Verificar(not Is_ExisteLote(AIdLote), TControl(Iif(EsAlta, edNumeroLote, nil)), 'No se encuentra el lote o el mismo se encuentra dado de baja.');

  sSql := 'SELECT LO_OPCIONDESTINO ' +
            'FROM RLO_LOTE ' +
           'WHERE NVL(LO_IDREMITO, 0) = 0 ' +    // esto lo hago así porque el remito 0 es el de la carga inicial,
             'AND LO_ID = :Id';                  // que contiene los lotes existentes antes de poner en producción el
  opciondestino := ValorSqlEx(sSql, [AIdLote]);  // tema de los remitos, ver tk 016810. Así permito que éstos se puedan
                                                 // asignar a otros remitos
  Verificar(opciondestino = '', TControl(Iif(EsAlta, edNumeroLote, nil)), 'El número de lote ya se ha incluido en un remito.');

  if EsAlta then
    begin
      sSql := 'SELECT 1 ' +
                'FROM RLO_LOTE ' +
               'WHERE LO_CAJA IS NOT NULL ' +
                 'AND NVL(LO_IDREMITO, 1) <> 0 ' +
                 'AND LO_ID = :Id ' +
                 'AND LO_FECHABAJA IS NULL';
      Verificar(ExisteSqlEx(sSql, [AIdLote]), TControl(Iif(EsAlta, edNumeroLote, nil)), 'El número de lote ya se ha incluido en alguna caja.');

      sSql := 'SELECT 1 ' +
                'FROM RLO_LOTE ' +
               'WHERE LO_CAJA IS NOT NULL ' +
                 'AND NVL(LO_IDREMITO, 1) <> 0 ' +
                 'AND LO_CAJA = :Caja ' +
                 'AND LO_FECHABAJA IS NULL ' +
                 'AND LO_TIPOBULTO <> :CodTipoBulto';
      Verificar(ExisteSqlEx(sSql, [ACaja, ACodTipoBulto]), TControl(Iif(EsAlta, rgTipoBulto, nil)), 'El tipo de bulto debe ser el mismo para todos los lotes pertenecientes al mismo bulto.');
    end;

  sSql := 'SELECT 1 ' +
            'FROM RRE_REMITO, RLO_LOTE ' +
           'WHERE LO_CAJA = :Caja ' +
             'AND LO_FECHABAJA IS NULL ' +
             'AND LO_IDREMITO = RE_ID ' +
             'AND RE_FECHABAJA IS NULL';
  Verificar(ExisteSqlEx(sSql, [ACaja]), TControl(Iif(EsAlta, edNumeroCaja, nil)), 'El número completo de etiqueta ya existe en algún remito.');
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.VerificarAltaGrilla(AIdLote: Integer; ACaja, ACodTipoBulto: String);
var
  opciondestino: String;
  i: integer;
begin
  VerificarLote(AIdLote, ACaja, ACodTipoBulto, True, opciondestino);

  for i := 0 to lvLotesSeleccionados.Items.Count - 1 do
    begin
      Verificar(lvLotesSeleccionados.Items[i].SubItems[0] = IntToStr(AIdLote), edNumeroLote,  'El número de lote ya fue incluido.');

      if lvLotesSeleccionados.Items[i].Caption = ACaja then
        Verificar(GetCodTipoBultoGrilla(i) <> ACodTipoBulto, rgTipoBulto, 'El tipo de bulto debe ser el mismo para todos los lotes pertenecientes al mismo bulto.');
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.AgregarLote(ANumeroLote, ACaja, ACodCaja, AObservaciones: String; IndTipoBulto: Integer);
var
 item: TListItem;
 iLote: Integer;
 sCodTipoArchLote, sCodTipoArchCaja, sSql: String;
begin
  iLote := StrToIntDef(ANumeroLote, 0);

  VerificarAltaGrilla(iLote, ACaja, GetCodTipoBultoRadioGroup(IndTipoBulto));
  Verificar(Get_EstadoLote(iLote) <> ESTADOLOTE_DITALIZGUARDA, edNumeroLote, 'El lote debe encontrarse en estado: En Digitalización y Guarda.');
  Verificar(Is_LoteLiquidaciones(iLote) and (InStr(ACaja, CAJALIQUIDACIONES) = 0), fraNumeroCajaAux, 'Si el lote es de liquidaciones, debe seleccionar una etiqueta de este tipo.');
  Verificar(not Is_LoteLiquidaciones(iLote) and (InStr(ACaja, CAJALIQUIDACIONES) > 0), edNumeroLote, 'Si la etiqueta es de Liquidaciones, entonces el lote debe ser de este tipo.');

  if not IsEmptyString(ACodCaja) then
    begin
      sCodTipoArchCaja := Get_CTBEspecial1('CRAGA', ACodCaja);
      sCodTipoArchLote := Get_CodigoTipoArchivoLote(iLote);

      Verificar(sCodTipoArchLote <> sCodTipoArchCaja, edNumeroLote, 'El tipo de archivo del lote no corresponde al tipo de archivo de la caja ingresada.');
    end;

  sSql := FSqlBase + ' AND LO_ID = ' + SqlValue(iLote);
  sSql := StringReplace(sSql, 'ARCHIVO.GET_NROCD_LOTE(LO_ID)', 'NULL', [rfReplaceAll]);
  sSql := StringReplace(sSql, 'ARCHIVO.GET_DIASDEVOLUC_ADMINISTRADORA(LO_ID)', 'NULL', [rfReplaceAll]);

  with GetQuery(sSql) do
    try
      if RecordCount > 0 then
        begin
          item := lvLotesSeleccionados.Items.Insert(0);
          item.Caption := ACaja;
          item.SubItems.Add(FieldByName('LO_ID').AsString);
          item.SubItems.Add(FieldByName('TA_DESCRIPCION').AsString);
          item.SubItems.Add(FieldByName('LO_OPCIONDESTINO').AsString);
          item.SubItems.Add(FieldByName('LO_IDOPCIONDESTINO').AsString);
          item.SubItems.Add(rgTipoBulto.Items[IndTipoBulto]);
          item.SubItems.Add(AObservaciones);

          ActualizarCant();
        end;
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.InsertarRemito(AObservaciones : string): Integer;
var
  IdRemito : Integer;
  sSql : string;
begin
  IdRemito := GetSecNextVal('SEQ_RRE_ID');

  sSql := 'INSERT INTO ARCHIVO.RRE_REMITO(RE_ID, RE_FECHAALTA, RE_USUALTA, RE_OBSERVACIONES) ' +
                      'VALUES (:re_id, SYSDATE, :UsuAlta, :re_observaciones)';
  EjecutarSqlSTEx(sSql, [IdRemito, Sesion.UserId, AObservaciones]);

  Result := IdRemito;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.IncorporarRemitoALote(IdRemito, Secuencia, IdLote: Integer);
var
 sSql: String;
begin
  sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
             'SET LO_IDREMITO = :lo_idremito, ' +
                 'LO_SEQ_REMITO = :lo_seq_remito, ' +
                 'LO_TIPOUBICACION = :lo_tipoubicacion, ' +
                 'LO_UBICACION = NULL ' +
           'WHERE LO_ID = :lo_id';
  EjecutarSqlSTEx(sSql, [IdRemito, Secuencia, TIPOUBICACION_GUARDA, IdLote]);

  DoModificarEstadoLote(IdLote, ESTADOLOTE_ADMINISTRADORA, False);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.IncluirLoteARemito(AIdRemito: Integer);
var
 i: Integer;
 sTipoBulto, sObserv, sCaja, sSql: String;
 Id: TTableId;
 bGuardarRemito: Boolean;
begin
  bGuardarRemito := (AIdRemito <> ART_EMPTY_ID);

  for i := 0 to lvLotesSeleccionados.Items.Count - 1 do
    begin
      sCaja      := lvLotesSeleccionados.Items[i].Caption;
      sTipoBulto := GetCodTipoBultoGrilla(i);  // Asumo que la primera letra de la descripción es el código del LO_TIPOBULTO
      sObserv    := lvLotesSeleccionados.Items[i].SubItems[5];
      Id         := StrToInt(lvLotesSeleccionados.Items[i].SubItems[0]);

      sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
                 'SET LO_CAJA = :lo_caja, ' +
                     'LO_OBSERVAC_REMITO = :lo_observac_remito, ' +
                     'LO_USUALTA_CAJA = :lo_usualta_caja, ' +
                     'LO_FECHAALTA_CAJA = ACTUALDATE, ' +
                     'LO_TIPOUBICACION = :lo_tipoubicacion, ' +
                     'LO_UBICACION = :lo_ubicacion, ' +
                     'LO_TIPOBULTO = :lo_tipobulto, ' +
                     'LO_IDREMITO = :lo_idremito, ' +
                     'LO_SEQ_REMITO = :lo_seq_remito ' +
             'WHERE LO_ID = :lo_id';

      if bGuardarRemito then
        EjecutarSqlSTEx(sSql, [sCaja, sObserv, Sesion.UserId, TIPOUBICACION_GUARDA, '', sTipoBulto, AIdRemito, i, Id])
      else
        EjecutarSqlSTEx(sSql, [sCaja, sObserv, Sesion.UserId, TIPOUBICACION_USUARIO, Sesion.UserId, sTipoBulto, '', '', Id]);

      if bGuardarRemito then
        DoModificarEstadoLote(Id, ESTADOLOTE_ADMINISTRADORA, False);
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.fpCreacionRemitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (UpperCase(Char(Key)) = 'A') then
    tbAgregarLote.Click
  else if (ssCtrl in Shift) and (UpperCase(Char(Key)) = 'D') then
    tbEliminarLote.Click
  else
    inherited;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ActualizarCantLotes;
begin
  edCantLotes.Value := lvLotesSeleccionados.Items.Count;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.EnviarRemitoPorMail(IdRemito: Integer);
begin
  VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION :=
      get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);

  ImprimirRemito(IdRemito, True, VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuEnviarMailRemitoClick(Sender: TObject);
begin
  if VerificarImpresionRemito() then
    EnviarRemitoPorMail(sdqConsulta.FieldByName('RE_ID').AsInteger);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuImprimirRemitoClick(Sender: TObject);
begin
  if VerificarImpresionRemito() then
    ImprimirRemito(sdqConsulta.FieldByName('RE_ID').AsInteger);
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.VerificarImpresionRemito: boolean;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Seleccione solo un registro en la grilla que contenga el remito que quiere imprimir.');
  Verificar(sdqConsulta.FieldByName('RE_ID').IsNull, Grid, 'El remito no ha sido generado.');

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.edNumeroCajaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
    SendKeys(Chr(VK_TAB), Self.Handle);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.pmnuExpDetRemitoLotesClick(Sender: TObject);
var
  sSql: String;
begin
  tbExportar.Enabled := False;
  try
    sSql :=  'SELECT DISTINCT TA_DESCRIPCION DESCRARCHIVO, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) CLAVE, DA_HOJAS HOJAS, ' +
                    'TD_DESCRIPCION DESCRDOCUMENTO, DA_FECHALTA FALTA, DA_LOTE LOTE, DA_SEQ_LOTE SEQ_LOTE ' +
               'FROM RLO_LOTE, RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RTD_TIPODOCUMENTO, RAR_ARCHIVO, RDA_DETALLEARCHIVO ' +
              'WHERE AR_TIPO = TA_ID ' +
                'AND TA_FORMULARIO = TC_CLAVE ' +
                'AND DA_IDARCHIVO = AR_ID ' +
                'AND DA_IDTIPODOCUMENTO = TD_ID ' +
                'AND DA_FECHABAJA IS NULL ' +
                'AND DA_LOTE = LO_ID ' +
                'AND LO_FECHABAJA IS NULL ' +
                'AND LO_ID IN (SELECT LO_ID ' +
                                'FROM (' + sdqConsulta.Sql.Text + '))';

    OpenQuery(sdqConsultaDetRemitoLotes, sSql);
    if sdqConsultaDetRemitoLotes.IsEmpty then
      MsgBox('No se han encontrado datos en el detalle para exportar.', MB_ICONERROR)
    else
      ExportDialogDetRemLotes.Execute;
  finally
    tbExportar.Enabled := True;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.CargarDatosLote(NroLote: String);
var
  sSector, sSql: String;
  TipoArchivo: TTableId;
  SqlResults: TStringList;
  bLimpiar: Boolean;
begin
  TipoArchivo := 0;
  
  if IsEmptyString(NroLote) then
    bLimpiar := True
  else
    begin
      sSql := 'SELECT LO_TIPO, SE_SECTOR ' +
                'FROM USE_USUARIOS, RLO_LOTE ' +
               'WHERE LO_ID = ' + SqlValue(StrToInt(NroLote)) + ' ' +
                 'AND LO_FECHABAJA IS NULL ' +
                 'AND LO_USUALTA = SE_USUARIO';
      SqlResults := ValoresColSql(sSql);
      try
        if IsEmptyString(SqlResults[0]) then
          bLimpiar := True
        else
          begin
            bLimpiar    := False;
            TipoArchivo := StrToInt(SqlResults[0]);
            sSector     := SqlResults[1];
          end;
      finally
        SqlResults.Free;
      end;
    end;

  if bLimpiar then
    begin
      fraTipoArchivo.Clear;
      fraSector.Clear;
    end
  else
    begin
      fraTipoArchivo.Value := TipoArchivo;
      fraSector.Codigo     := sSector;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.edNumeroLoteExit(Sender: TObject);
begin
  CargarDatosLote(edNumeroLote.Text);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.GenerarRemitoGrilla: Boolean;
var
  i: Integer;
  IdRemito, Lote: TTableId;
begin
  Result := False;

  BeginTrans;
  try
    IdRemito := InsertarRemito('');

    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        Lote  := sdqConsulta.FieldByName('LO_ID').AsInteger;
        IncorporarRemitoALote(IdRemito, i, Lote);
      end;

    CommitTrans;

    ImprimirRemito(IdRemito);
    Result := True;
  except
    on E: exception do
      begin
        Rollback;
        MessageDlg('Se produjo un error al intentar generar el remito.' + E.Message, mtError, [mbOK], 0);
      end;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.VerificarDestinosGrilla: Boolean;
var
 i: Integer;
 sCodTipoBulto, sCaja, sOpcionDestino: String;
 Lote: TTableId;
begin
  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        sCaja         := sdqConsulta.FieldByName('CAJA').AsString;
        Lote          := sdqConsulta.FieldByName('LO_ID').AsInteger;
        sCodTipoBulto := sdqConsulta.FieldByName('LO_TIPOBULTO').AsString;

        Verificar(IsEmptyString(sCaja), nil, 'El número de caja no se encuentra asignado.');

        VerificarLote(Lote, sCaja, sCodTipoBulto, False, sOpcionDestino);

        (*if (sdqConsulta.FieldByName('LO_IDOPCIONDESTINO').AsString <> anteriordest) then
          begin
            inc(v);
            anteriordest := sdqConsulta.FieldByName('LO_IDOPCIONDESTINO').AsString;
          end;*)
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuGenerarRemitoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro para poder generar el remito.');

  if VerificarDestinosGrilla() then
    if GenerarRemitoGrilla then
      RefreshData;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.CalcularFilasSel;
begin
  edCantSelecc.Value := Grid.SelectedRows.Count;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.InicializarContadores;
begin
  edCantSelecc.Value := 0;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.GridCellClick(Column: TColumn);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  IdRemito: TTableId;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar un registro.');
  Verificar(Grid.SelectedRows.Count > 1 , Grid, 'Debe seleccionar solo un registro (aquel que contenga el remito a eliminar).');
  Verificar(sdqConsulta.FieldByName('RE_ID').IsNull, Grid, 'Debe seleccionar un remito.');
  Verificar(not sdqConsulta.FieldByName('RE_FECHABAJA').IsNull, Grid, 'El remito ya se encuentra dado de baja.');

  if MsgBox('¿Confirma la baja del remito seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        IdRemito := sdqConsulta.FieldByName('RE_ID').AsInteger;

        sSql := 'UPDATE ARCHIVO.RRE_REMITO ' +
                   'SET RE_FECHABAJA = ART.ACTUALDATE, ' +
                       'RE_USUBAJA = :User ' +
                 'WHERE RE_ID = :Id';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, IdRemito]);

        ssql := 'SELECT LO_ID IDLOTE ' +
                 'FROM RLO_LOTE ' +
                'WHERE LO_IDREMITO = :Id';
        with GetQueryEx(sSql, [IdRemito]) do
          try
            while not Eof do
              begin
                DoModificarEstadoLote(FieldByName('IDLOTE').AsInteger, ESTADOLOTE_DITALIZGUARDA, False);

                Next;
              end;
          finally
            Free
          end;

        sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
                   'SET LO_IDREMITO = NULL, ' +
                       'LO_SEQ_REMITO = NULL ' +
                 'WHERE LO_IDREMITO = :Id';
        EjecutarSqlSTEx(sSql, [IdRemito]);

        CommitTrans;

        MsgBox('Remito eliminado correctamente.', MB_ICONINFORMATION);
        RefreshData;
      except
        on E:Exception do
          begin
            Rollback;
            Raise Exception.Create(E.Message + CRLF + 'Error al eliminar el remito.');
          end;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbEliminarLoteCajaClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar un registro.');
  Verificar(Grid.SelectedRows.Count > 1 , Grid, 'Debe seleccionar solo un registro (aquel que contenga el lote a eliminar de la caja).');
  Verificar(sdqConsulta.FieldByName('CAJA').IsNull, Grid, 'El lote no ha sido asignado a ninguna caja.');
  Verificar(not sdqConsulta.FieldByName('RE_ID').IsNull, Grid, 'El remito ya se encuentra generado.');

  if fpEliminarLoteCaja.ShowModal = mrOk then
    RefreshData;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.btnAceptarEliminarLoteCajaClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraUsuarioElimLoteCaja.IsEmpty, fraUsuarioElimLoteCaja.edCodigo, 'Debe ingresar el usuario al que se le re-asigna el lote.');

  sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
             'SET LO_CAJA = NULL, ' +
                 'LO_OBSERVAC_REMITO = NULL, ' +
                 'LO_USUALTA_CAJA = NULL, ' +
                 'LO_FECHAALTA_CAJA = NULL, ' +
                 'LO_TIPOBULTO = ''C'', ' +
                 'LO_TIPOUBICACION = :lo_tipoubicacion, ' +
                 'LO_UBICACION = :lo_ubicacion ' +
         'WHERE LO_ID = :lo_id';
  EjecutarSqlEx(sSql, [TIPOUBICACION_USUARIO, fraUsuarioElimLoteCaja.Value, sdqConsulta.FieldByName('LO_ID').AsInteger]);

  MsgBox('Lote eliminado correctamente de la caja.', MB_ICONINFORMATION);
  fpEliminarLoteCaja.ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.fpEliminarLoteCajaEnter(Sender: TObject);
begin
  fraUsuarioElimLoteCaja.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ActualizarCantCajas;
begin
  ActualizarCantBultos('C', edCantCajas);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ActualizarCantSobres;
begin
  ActualizarCantBultos('S', edCantSobres);
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ActualizarCantBultos(TipoBulto: String; edCant: TIntEdit);
var
  tslCajas: TStringList;
  i: Integer;
begin
  tslCajas := TStringList.Create;
  with tslCajas do
    try
      Duplicates := dupIgnore;
      Sorted     := True;

      for i := 0 to lvLotesSeleccionados.Items.Count - 1 do
        if GetCodTipoBultoGrilla(i) = TipoBulto then
          Add(lvLotesSeleccionados.Items[i].Caption);

      edCant.Value       := tslCajas.Count;
      edCantBultos.Value := edCantCajas.Value + edCantSobres.Value;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.ActualizarCant;
begin
  ActualizarCantLotes();

  ActualizarCantCajas();
  ActualizarCantSobres();
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.edLoteDesdeExit(Sender: TObject);
begin
  if not edLoteDesde.IsEmpty and edLoteHasta.IsEmpty then
    edLoteHasta.Value := edLoteDesde.Value;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.pmnuExpRemitoLotesClick(Sender: TObject);
begin
  inherited tbExportarClick(nil);
end;
{------------------------------------------------------------------------------}
class procedure TFrmArmadoRemito.DoMostrarRemito(Remito: TTableId);
begin
  Abrir(TFrmArmadoRemito, FrmArmadoRemito, tmvMDIChild, nil);

  with FrmArmadoRemito do
    begin
      rgEstado.ItemIndex    := 3;  // Todos
      edRemitoDesde.Value   := Remito;
      edRemitoHasta.Value   := Remito;

      RefreshData;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbEnviarMailsClick(Sender: TObject);
begin
  tbEnviarMails.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.mnuEnviarMailLotesPendDigitalizacionClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');
  Verificar(rgAdministradora.ItemIndex <> 0, nil, 'Debe haber filtrado por Lotes en Administradora Pendientes de Digitalización.');

  DoEnviarMailLotesPendDigitalizacion;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.DoValidarYCargarLotesSeleccionados;
var
  i: Integer;
  sSql: String;
begin
  Do_LimpiarTablaTemporal('TLS_LOTESELECCIONADO', 'LS_USUARIO', Sesion.Userid);

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      Verificar(sdqConsulta.FieldByName('DIASDEVOLADMIN').AsInteger > 0, nil, 'Alguno de los lotes seleccionados no se encuentra pendiente de digitalización.');
      Verificar(sdqConsulta.FieldByName('CODESTADO').AsString <> ESTADOLOTE_ADMINISTRADORA, nil, 'Alguno de los lotes seleccionados no se encuentra en la Administradora.');

      sSql := 'INSERT INTO TLS_LOTESELECCIONADO(LS_USUARIO, LS_LOTE) ' +
                 'VALUES(:UserId, :Lote)';
      EjecutarSqlEx(sSql, [Sesion.Userid, sdqConsulta.FieldByName('LO_ID').AsInteger]);
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.DoEnviarMailLotesPendDigitalizacion;
var
  sAsunto, sCuerpo, sSql, sTempFile: string;
  qryLotes: TSDQuery;
begin
  if MsgBox('¿Confirma el envío de mails por los lotes pendientes de digitalización a la Administradora?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      IniciarEspera('Preparando lotes...');
      try
        DoValidarYCargarLotesSeleccionados;

        IniciarEspera('Enviando correo...');
        try
          sSql := 'SELECT LO_ID "Lote", LO_CAJA "Nro. Caja", TA_DESCRIPCION "Archivo", ' +
                         'LO_IDREMITO "Remito", TRUNC(RE_FECHAALTA) "F. Gen. Remito" ' +
                    'FROM RRE_REMITO, RTA_TIPOARCHIVO, RLO_LOTE, TLS_LOTESELECCIONADO ' +
                   'WHERE LS_USUARIO = :UserId ' +
                     'AND LS_LOTE = LO_ID ' +
                     'AND LO_TIPO = TA_ID ' +
                     'AND LO_IDREMITO = RE_ID(+) ' +
                   'ORDER BY LO_ID';
      
          qryLotes := GetQueryEx(sSql, [Sesion.UserId]);
          try
            if not qryLotes.Eof then
              begin
                VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION :=
                    get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);

                VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
                    get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

                sTempFile := GetTempFromFileName('LotesPendientesDigitaliz.xls');
                sAsunto   := 'Lotes en Administradora Pendientes de Digitalización';
                sCuerpo   := 'Solicitamos a Ustedes, el envío de un CD nuevo, que incluya los lotes ' +
                             'pendientes de digitalizar correspondientes a cada sector.' + CRLF +
                             'Se adjunta archivo con detalle de los mismos.';

                with TDataToXLS.Create(nil) do
                  try
                    Title.Text := sAsunto;
                    DataSet := qryLotes;
                    SaveToFile(sTempFile);
                  finally
                    Free;
                  end;

                SendByMailServer(VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION,
                   Sesion.UserId, sAsunto, sTempFile,
                   sCuerpo, False, False, False, Sesion.UserId, True);

               SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                  Sesion.UserId, sAsunto, sTempFile,
                  sCuerpo, False, True, False, Sesion.UserId, True);

                MsgBox('Mails enviados correctamente.', MB_ICONINFORMATION);
              end;
          finally
            qryLotes.free;
          end;
        finally
          DetenerEspera;
        end;
      finally
        DetenerEspera;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.DoBorrarCajasRemito;
var
  i: Integer;
  sSql: String;
begin
  sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
             'SET LO_TIPOUBICACION = :UbicUsu, ' +
                 'LO_UBICACION = :Ubicacion, ' +
                 'LO_IDREMITO = NULL, ' +
                 'LO_SEQ_REMITO = NULL, ' +
                 'LO_CAJA = NULL, ' +
                 'LO_OBSERVAC_REMITO = NULL, ' +
                 'LO_USUALTA_CAJA = NULL, ' +
                 'LO_FECHAALTA_CAJA = NULL, ' +
                 'LO_TIPOBULTO = ''C'', ' +
                 'LO_ESTADO = :Estado, ' +
                 'LO_USU_ESTADO = :UserId, ' +
                 'LO_FECHA_ESTADO = SYSDATE, ' +
                 'LO_IDREMITOANT = LO_IDREMITO, ' +
                 'LO_CAJAANT = LO_CAJA ' +
           'WHERE LO_CAJA = :Caja ' +
             'AND LO_FECHABAJA IS NULL';

  BeginTrans;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        EjecutarSqlSTEx(sSql, [TIPOUBICACION_USUARIO, Sesion.UserId, ESTADOLOTE_DITALIZGUARDA, Sesion.UserId, sdqConsulta.FieldByName('CAJA').AsString]);
      end;

    CommitTrans;

    MsgBox('Cajas eliminadas correctamente.', MB_ICONINFORMATION);
    RefreshData;
  except
    on E: exception do
      begin
        Rollback;
        MessageDlg('Se produjo un error al intentar eliminar una caja del remito.' + E.Message, mtError, [mbOK], 0);
      end;
  end;
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.VerificarBorradoCajasRemito: Boolean;
var
 i: Integer;
begin
  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        Verificar(sdqConsulta.FieldByName('CAJA').IsNull, nil, 'Algunos de los registros seleccionados no tiene una caja asignada.');
        Verificar(sdqConsulta.FieldByName('RE_ID').IsNull, nil, 'Algunas de las cajas seleccionadas no tiene un remito generado.');
        Verificar(not sdqConsulta.FieldByName('RE_FECHABAJA').IsNull, Grid, 'Algunas de las cajas seleccionadas tiene el remito que se encuentra dado de baja.');
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.tbEliminarCajaRemitoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro.');

  if VerificarBorradoCajasRemito() then
    if MsgBox('¿Confirma la eliminación de las cajas de los remitos seleccionados?', MB_ICONQUESTION + MB_YESNO) = IDYES then
      DoBorrarCajasRemito();
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.DoProcesarNroCaja(Caja: String);
var
  iNroCaja, iPosSep: Integer;
  sCodTipoArchCaja: String;
begin
  Caja := Trim(Caja);

  if not IsEmptyString(Caja) then
    begin
      iPosSep := Instr(Caja, ' ');

      if iPosSep > 0 then
        begin
          iNroCaja         := StrToIntDef(StrLeft(Caja, iPosSep - 1), 0);
          sCodTipoArchCaja := Trim(StrMid(Caja, iPosSep + 1));
        end
      else
        begin
          iNroCaja         := StrToIntDef(Caja, 0);
          sCodTipoArchCaja := '';
        end;

      if iNroCaja = 0 then
        edNumeroCaja.Clear
      else
        begin
          edNumeroCaja.Text := IntToStr(iNroCaja);

          if not IsEmptyString(sCodTipoArchCaja) then
            begin
              fraNumeroCajaAux.Codigo := sCodTipoArchCaja;

              if fraNumeroCajaAux.IsSelected then
                edNumeroLote.SetFocus;
            end;
        end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.DoLimpiarTipoBulto;
begin
  rgTipoBulto.ItemIndex := -1;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.edNumeroCajaChange(Sender: TObject);
begin
  DoLimpiarTipoBulto;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.fraNumeroCajaAuxChange(Sender: TObject);
begin
  DoLimpiarTipoBulto;
end;
{------------------------------------------------------------------------------}
procedure TFrmArmadoRemito.edNumeroCajaExit(Sender: TObject);
begin
  DoProcesarNroCaja(edNumeroCaja.Text);
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.GetCodTipoBultoGrilla(Pos: Integer): String;
begin
  Result := GetCodTipoBulto(lvLotesSeleccionados.Items[Pos].SubItems[4]);
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.GetCodTipoBultoRadioGroup(Indice: Integer): String;
begin
  Result := GetCodTipoBulto(rgTipoBulto.Items[Indice]);
end;
{------------------------------------------------------------------------------}
function TFrmArmadoRemito.GetCodTipoBulto(Descripcion: String): String;
begin
  Result := StrLeft(Descripcion, 1);       // Asumo que la primera letra de la descripción es el código del LO_TIPOBULTO
end;
{------------------------------------------------------------------------------}
end.


