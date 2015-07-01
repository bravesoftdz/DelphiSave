unit unDocumentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  PatternEdit, IntEdit, ComboEditor, CheckCombo, DBCheckCombo, unfraSectores, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraUsuario, unfraCtbTablas, unFraCodDesc, Menus, RxToolEdit, RxPlacemnt,
  unArt, CardinalEdit, RxCurrEdit, OptionGroup, unDmPrincipal, unArtDbFrame,
  unFraEmpresa, SinEdit;

type
  TfrmDocumentacion = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    edFechaDesde: TDateComboBox;
    Label1: TLabel;
    edFechaHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    edCodigoDesde: TIntEdit;
    Label6: TLabel;
    edCodigoHasta: TIntEdit;
    GroupBox3: TGroupBox;
    edRemitenteBusqueda: TEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label2: TLabel;
    edFechaRecepcionDesde: TDateComboBox;
    edFechaRecepcionHasta: TDateComboBox;
    GroupBox8: TGroupBox;
    Label3: TLabel;
    edRemitoDesde: TIntEdit;
    edRemitoHasta: TIntEdit;
    edCodigo: TIntEdit;
    Label4: TLabel;
    edFecha: TDateComboBox;
    Label5: TLabel;
    Label7: TLabel;
    edRemitente: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edObservaciones: TEdit;
    edCuil: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    edNombre: TEdit;
    fraUsuarioDestinoBusqueda: TfraUsuarios;
    fraUsuarioRecepcionBusqueda: TfraUsuarios;
    fraUsuarioDestino: TfraUsuarios;
    fraTipoDocumento: TfraCtbTablas;
    popupImprimir: TPopupMenu;
    mnuResultados: TMenuItem;
    mnuRemito: TMenuItem;
    Label17: TLabel;
    edNumeroDocumento: TIntEdit;
    btnContinuar: TButton;
    pmnuGrid: TPopupMenu;
    mnuSeleccionarTodo: TMenuItem;
    mnuLimpiarSeleccion: TMenuItem;
    mnuInvertirSeleccion: TMenuItem;
    mnuRemitosMasivos: TMenuItem;
    GroupBox11: TGroupBox;
    fraTipoDocumentoBusqueda: TfraCtbTablas;
    tbDerivacion: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    fpDerivacion: TFormPanel;
    Bevel2: TBevel;
    Label20: TLabel;
    btnAceptarDerivacion: TButton;
    btnCancelarDerivacion: TButton;
    fraUsuarioDerivacion: TfraUsuarios;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    ToolButton7: TToolButton;
    tbBuscarCodigoBarras: TToolButton;
    gbSecTrazabilidad: TGroupBox;
    edSecTrazabilidad: TCurrencyEdit;
    N1: TMenuItem;
    mnuImprimirEtiquetas: TMenuItem;
    N2: TMenuItem;
    ogEstado: TOptionGroup;
    pnlBajas: TPanel;
    chkNoBajas: TCheckBox;
    chkImprimirEtiqueta: TCheckBox;
    GroupBox9: TGroupBox;
    chkSoloSectorLog: TCheckBox;
    fpRemitosMasivos: TFormPanel;
    Bevel1: TBevel;
    btnrAceptarRemitosMasivos: TButton;
    btnCancelarRemitosMasivos: TButton;
    ogRemitosMasivos: TOptionGroup;
    tbAnularRemito: TToolButton;
    ToolButton10: TToolButton;
    tbAnularRecepcion: TToolButton;
    tbHistorico: TToolButton;
    ToolButton12: TToolButton;
    fraSectorDestino: TfraCodigoDescripcion;
    fraSectorDestinoBusqueda: TfraCodigoDescripcion;
    fpUsuConectado: TFormPanel;
    Bevel3: TBevel;
    Label14: TLabel;
    btnAceptarUsuConectado: TButton;
    btnCancelarUsuConectado: TButton;
    fraUsuConectado: TfraUsuarios;
    tConexion: TTimer;
    fpListDocPendRecepcion: TFormPanel;
    Bevel4: TBevel;
    btnAceptarDocPendRecepcion: TButton;
    btnCancelarDocPendRecepcion: TButton;
    GroupBox10: TGroupBox;
    Label15: TLabel;
    edFRemDesde: TDateComboBox;
    edFRemHasta: TDateComboBox;
    GroupBox12: TGroupBox;
    fraSectorDestinoRem: TfraCodigoDescripcion;
    mnuRemitosNoRecepc: TMenuItem;
    fraEmpresa: TfraEmpresa;
    Label16: TLabel;
    edSiniestro: TSinEdit;
    Label18: TLabel;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuResultadosClick(Sender: TObject);
    procedure mnuRemitoClick(Sender: TObject);
    procedure CambiaUsuario(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure mnuSeleccionarTodoClick(Sender: TObject);
    procedure mnuLimpiarSeleccionClick(Sender: TObject);
    procedure mnuInvertirSeleccionClick(Sender: TObject);
    procedure mnuRemitosMasivosClick(Sender: TObject);
    procedure tbDerivacionClick(Sender: TObject);
    procedure btnAceptarDerivacionClick(Sender: TObject);
    procedure fpDerivacionEnter(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbExportarClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure edRemitoDesdeExit(Sender: TObject);
    procedure tbBuscarCodigoBarrasClick(Sender: TObject);
    procedure mnuImprimirEtiquetasClick(Sender: TObject);
    procedure edRemitoHastaExit(Sender: TObject);
    procedure btnrAceptarRemitosMasivosClick(Sender: TObject);
    procedure fpRemitosMasivosShow(Sender: TObject);
    procedure fraSectorDestinoOnChange(Sender: TObject);
    procedure fraTipoDocumentoOnChange(Sender: TObject);
    procedure tbAnularRemitoClick(Sender: TObject);
    procedure tbAnularRecepcionClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure btnAceptarUsuConectadoClick(Sender: TObject);
    procedure fpUsuConectadoEnter(Sender: TObject);
    procedure tConexionTimer(Sender: TObject);
    procedure mnuRemitosNoRecepcClick(Sender: TObject);
    procedure btnAceptarDocPendRecepcionClick(Sender: TObject);
    procedure fpListDocPendRecepcionEnter(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
  private
    tslCheckeados: TStringList;
    psEtiq_InfoAdic1: String;
    pbIsSectorMEntradas, pbIsAdministrador, pbIsSubAdministrador, pbIsSectorCargaAutomaticaCodigo: Boolean;
    pbRefrescar: Boolean;
    psUsuOriginal: String;
    procedure DoHabilitarCampos(Habilitar :Boolean);
    procedure ImprimirRemitosMasivos(NumeroRemito: Integer);
    function IsSubAdministrador: Boolean;
    function IsSectorCargaAutomaticaCodigo: Boolean;
    function GetProxIdRemito: TTableId;
    function GetProxSecuenciaIncap: TTableId;
    procedure CalcularFilasSel;
    procedure InicializarContadores;
    procedure DoImprimirRemito(Remito: Integer; ConPreview: Boolean);
    function ValidarRecepcionar: boolean;
    procedure DoGenerarRemitosMasivos(SoloGenerar: Boolean);
    function ValidarImpresionRemito(var Remito: Integer): Boolean;
    function ValidarAnularRecepcionar: Boolean;
    procedure DoInicializarDatos;
  protected
  	function DoABM: Boolean; override;
  	function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
  	procedure RefreshData; override;
    procedure EnableButtons(AEnabled: Boolean); override;
    procedure DoMarcarFila; override;
  public
  end;

const
  SMCampoFila      = 'FILA';
  SMCampoCheckBox  = 'CHECKBOX';

var
  frmDocumentacion: TfrmDocumentacion;

implementation

uses
	unCustomConsulta, AnsiSql, General, CustomDlgs, DateTimeFuncs, SqlFuncs,
  unSesion, unVisualizador, unPrincipal, unPropiedadesFrame, VCLExtra, unRemitoDocumentacion,
  Cuit, StrFuncs, unAfiliaciones, unComunes, unGrids, unUtilsArchivo, unQrEtiquetasDocCarpetas,
  unHistoricoDocumentacion, unLstRemitosnoRecepcionados, unSiniestros, unConstantArchivo;

const
  cTIPODOC_IFFI = '15';     // TK 25970

{$R *.dfm}

function TfrmDocumentacion.DoABM: Boolean;
var
  iId: integer;
  IdSecAGA: TTableId;
begin
  IdSecAGA := ART_EMPTY_ID;

  with Sql do
    begin
      Clear;
      TableName := 'CDR_DOCUMENTACIONRECIBIDA';

      if ModoABM = maBaja then
        begin
          SqlType := stUpdate;
          iId     := sdqConsulta.FieldByName('DR_ID').AsInteger;

          Fields.Add('DR_USUBAJA', 	              Sesion.UserID);
          Fields.Add('DR_FECHABAJA',              SQL_ACTUALDATE, False);
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              SqlType  := stInsert;
              iId      := edCodigo.Value;
              IdSecAGA := GetIdSecTrazabilidad();

              Fields.Add('DR_SECUENCIATRAZABIL',  IdSecAGA);
              Fields.Add('DR_USUALTA', 	          Sesion.UserID);
              Fields.Add('DR_FECHAALTA',          SQL_DATETIME, False);
            end
          else
            begin
              SqlType := stUpdate;
              iId     := sdqConsulta.FieldByName('DR_ID').AsInteger;

              Fields.Add('DR_USUMODIF', 	        Sesion.UserID);
              Fields.Add('DR_FECHAMODIF',         SQL_DATETIME, False);
            end;

          Fields.Add('DR_FECHA', 		 		 	        edFecha.Date);
          Fields.Add('DR_REMITENTE', 		 	        edRemitente.Text);
          Fields.Add('DR_USUDESTINO', 	 	        fraUsuarioDestino.Value);
          Fields.Add('DR_SECTORDESTINO', 	        fraSectorDestino.Codigo);
          Fields.Add('DR_TIPODOCUMENTO', 	        fraTipoDocumento.Value);
          Fields.Add('DR_NUMERODOCUMENTO',        edNumeroDocumento.Value, True);
          Fields.Add('DR_OBSERVACIONES', 	        edObservaciones.Text);
          Fields.Add('DR_CUIL', 				 	        edCuil.Text);
          Fields.Add('DR_NOMBRE', 			 	        edNombre.Text);
          Fields.Add('DR_CONTRATO',               fraEmpresa.Contrato, True);
          Fields.Add('DR_IDEXPEDIENTE',           Get_IdExpediente(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida), True);
        end;

      PrimaryKey.Add('DR_ID',                     iId, False);
    end;

  Result := inherited DoABM;

  if Result and (ModoABM = maAlta) and chkImprimirEtiqueta.Checked then
    DoImprimirEtiquetaSecuenciaTrazabilidad(IdSecAGA, 1, True, psEtiq_InfoAdic1, DateToStr(DBDate()));

  DoHabilitarCampos(True);
end;

function TfrmDocumentacion.Validar: Boolean;
var
  sSql: String;
begin
	if ModoABM = maAlta then
    begin
      Verificar(edCodigo.IsEmpty, edCodigo, 'El código es obligatorio.');

      sSql := 'SELECT 1 FROM CDR_DOCUMENTACIONRECIBIDA WHERE DR_ID = :id';
      Verificar(ExisteSqlEx(sSql, [edCodigo.Value]), edCodigo, 'El código debe ser único.');
    end;

  Verificar(edFecha.IsEmpty, edFecha, 'La fecha es obligatoria.');
  Verificar(edFecha.Date > DBDate(), edFecha, 'La fecha no puede ser mayor a la fecha actual.');
  Verificar(edFecha.Date < CalcDiasHabiles(DBDate(), -2), edFecha, 'La fecha no puede ser anterior a 2 días hábiles de la fecha actual.');
  Verificar(fraTipoDocumento.IsEmpty, fraTipoDocumento.edCodigo, 'El tipo de documento es obligatorio.');
  Verificar(IsEmptyString(edRemitente.Text), edRemitente, 'El remitente es obligatorio.');
  Verificar(fraSectorDestino.IsEmpty, fraSectorDestino.edCodigo, 'El sector de destino es obligatorio.');
	Verificar((fraTipoDocumento.Value = '06') and ((fraSectorDestino.Codigo <> 'INCAP') and (fraSectorDestino.Codigo <> 'ENFPROF')), fraSectorDestino.edCodigo, 'Si el tipo de documento es dictamen el sector debe ser INCAP ó ENFPROF.');
  Verificar(not edSiniestro.IsEmpty and (Get_IdExpediente(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida) = 0), edSiniestro, 'El siniestro no existe.');
  Verificar((fraTipoDocumento.Codigo = cTIPODOC_IFFI) and edNumeroDocumento.IsEmpty, edNumeroDocumento, 'El nro. de documento es obligatorio para este tipo de documentación.');    // TK 25970
  Verificar((fraTipoDocumento.Especial1 = 'S') and IsEmptyString(edCuil.Text), edCuil, 'El CUIL es obligatorio.');
  Verificar(not IsEmptyString(edCuil.Text) and not IsCuil(edCuil.Text), edCuil, 'El número de CUIL es inválido.');
  Verificar((fraTipoDocumento.Especial1 = 'S') and IsEmptyString(edNombre.Text), edNombre, 'El nombre es obligatorio.');

  // bExisteTrabajador := ExisteCuil(edCuil.Text);
  // Verificar((fraTipoDocumento.Especial2 = 'S') and not bExisteTrabajador, edCuil, 'El trabajador debe existir.');  // no se usa...había solo N en tb_especial2

	Result := True;
end;

procedure TfrmDocumentacion.CambiaUsuario(Sender: TObject);
var
  sSectorUsuDest: String;
begin
  if fraUsuarioDestino.IsSelected then
    begin
      sSectorUsuDest := Get_SectorUsuario(fraUsuarioDestino.Value);

      if fraSectorDestino.Locked and fraSectorDestino.IsSelected and (sSectorUsuDest <> fraSectorDestino.Codigo) then
        begin
          InfoHint(fraUsuarioDestino.edCodigo, 'El usuario ' + fraUsuarioDestino.Descripcion + ' no pertenece al sector destino.');
          fraUsuarioDestino.Clear
        end
      else if not fraSectorDestino.Locked then
        fraSectorDestino.Codigo := sSectorUsuDest;
    end;
end;

procedure TfrmDocumentacion.ClearControls;
begin
	edCodigo.Clear;
  edFecha.Clear;
  edRemitente.Clear;
  fraUsuarioDestino.Clear;
  fraSectorDestino.Clear;
  fraTipoDocumento.Clear;
  edNumeroDocumento.Clear;
  edObservaciones.Clear;
  edCuil.Clear;
  edNombre.Clear;
  fraEmpresa.Clear;
  edSiniestro.Clear;

  DoHabilitarCampos(True);

  if pbIsSubAdministrador then
    begin
      fraSectorDestino.Codigo := 'INCAP';
      VCLExtra.LockControls(fraSectorDestino);
    end;
end;

procedure TfrmDocumentacion.ClearData;
begin
  if pbIsAdministrador or pbIsSubAdministrador then
    begin
    	edFechaDesde.Date  := DBDate() - 60;
      ogEstado.ItemIndex := 3;   // Todos
    end
  else
    begin
    	edFechaDesde.Date  := DBDate() - 10;
      ogEstado.ItemIndex := 1;   // Pendiente Recepción Usuarios
    end;

  edFechaHasta.Clear;
  edCodigoDesde.Clear;
  edCodigoHasta.Clear;
  edRemitenteBusqueda.Clear;
  fraUsuarioDestinoBusqueda.Clear;
  fraSectorDestinoBusqueda.Clear;
  fraUsuarioRecepcionBusqueda.Clear;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;
  edRemitoDesde.Clear;
  edRemitoHasta.Clear;
  fraTipoDocumentoBusqueda.Clear;
  edSecTrazabilidad.Clear;
  tslCheckeados.Clear;
  chkNoBajas.Checked := True;

  if chkSoloSectorLog.Enabled then
    chkSoloSectorLog.Checked := False;

  InicializarContadores;

	inherited;
end;

procedure TfrmDocumentacion.LoadControls;
var
  bHabilitar: Boolean;
begin
  inherited;
  with sdqConsulta do
    begin
      edCodigo.Value 					:= FieldByName('DR_ID').AsInteger;
      edFecha.Date 						:= FieldByName('DR_FECHA').AsDateTime;
      edRemitente.Text 				:= FieldByName('DR_REMITENTE').AsString;
      fraUsuarioDestino.Value := FieldByName('DR_USUDESTINO').AsString;
      fraSectorDestino.Codigo := FieldByName('DR_SECTORDESTINO').AsString;
      fraTipoDocumento.Value 	:= FieldByName('DR_TIPODOCUMENTO').AsString;
      edNumeroDocumento.Text  := FieldByName('DR_NUMERODOCUMENTO').AsString;
      edObservaciones.Text 		:= FieldByName('DR_OBSERVACIONES').AsString;
      edCuil.Text 						:= FieldByName('DR_CUIL').AsString;
      edNombre.Text 					:= FieldByName('DR_NOMBRE').AsString;
      fraEmpresa.Contrato     := FieldByName('DR_CONTRATO').AsInteger;

      if FieldByName('EX_SINIESTRO').IsNull then
        edSiniestro.Clear
      else
        edSiniestro.SetValues(FieldByName('EX_SINIESTRO').AsInteger, FieldByName('EX_ORDEN').AsInteger, FieldByName('EX_RECAIDA').AsInteger);
    end;

  bHabilitar := sdqConsulta.FieldByName('DR_REMITO').IsNull;
  DoHabilitarCampos(bHabilitar);

  VCLExtra.LockControls([fraSectorDestino], pbIsSubAdministrador or not bHabilitar);
end;

procedure TfrmDocumentacion.RefreshData;
var
	sSql, sWhere: String;
begin
  sSql := 'SELECT 0 ' + SMCampoCheckBox + ', DR_ID, DR_FECHA, DR_REMITENTE, USE_DEST.SE_NOMBRE USE_DEST,' +
                ' USC_DEST.SC_DESCRIPCION, TB_DESCRIPCION DESCRTIPODOCUMENTO, DR_OBSERVACIONES, USE_REC.SE_NOMBRE USE_REC,' +
                ' DR_FECHARECEPCION, DR_REMITO, DR_FECHAREMITO, DR_CUIL, DR_NOMBRE, DR_FECHABAJA,' +
                ' DR_NUMERODOCUMENTO, DR_USUDESTINO, DR_SECTORDESTINO, DR_TIPODOCUMENTO, USE_DER.SE_NOMBRE USE_DER,' +
                ' TRUNC(DR_FECHADERIVACION) FECHADERIVACION, DR_DERIVADOA, DR_USURECEPCION,' +
                ' DR_SECUENCIATRAZABIL SECUENCIATRAZABIL, USE_ALTA.SE_NOMBRE USUALTADOC, TRUNC(DR_FECHAALTA) FECHAALTADOC,' +
                ' DR_CONTRATO, EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINICOMPLETO, ' +
                ' ART.UTILES.ARMAR_CUIT(DR_CUIL) CUIL' +
           ' FROM SEX_EXPEDIENTES, USE_USUARIOS USE_ALTA, USE_USUARIOS USE_DER, USE_USUARIOS USE_REC, CTB_TABLAS, ' +
                ' USC_SECTORES USC_DEST, USE_USUARIOS USE_DEST, ' +
                ' CDR_DOCUMENTACIONRECIBIDA' +
          ' WHERE DR_USUDESTINO = USE_DEST.SE_USUARIO(+)' +
            ' AND DR_SECTORDESTINO = USC_DEST.SC_CODIGO' +
            ' AND DR_DERIVADOA = USE_DER.SE_USUARIO(+)' +
            ' AND DR_TIPODOCUMENTO = TB_CODIGO' +
            ' AND TB_CLAVE = ''TDOCR''' +
            ' AND DR_USURECEPCION = USE_REC.SE_USUARIO(+) ' +
            ' AND DR_USUALTA = USE_ALTA.SE_USUARIO ' +
            ' AND DR_IDEXPEDIENTE = EX_ID(+)';

  sWhere := SqlBetweenDateTime(' AND DR_FECHA ', edFechaDesde.Date, edFechaHasta.Date) +
            SqlBetweenDateTime(' AND DR_FECHARECEPCION ', edFechaRecepcionDesde.Date, edFechaRecepcionHasta.Date) +
            SqlBetween(' AND DR_ID ', edCodigoDesde.Value, edCodigoHasta.Value) +
            SqlBetween(' AND DR_REMITO ', edRemitoDesde.Value, edRemitoHasta.Value);

  if edRemitenteBusqueda.Text <> '' then
  	sWhere := sWhere + ' AND DR_REMITENTE LIKE ' + SqlValue(edRemitenteBusqueda.Text + '%');

  if not fraUsuarioDestinoBusqueda.IsEmpty then
    sWhere := sWhere + ' AND DR_USUDESTINO = ' + SqlValue(fraUsuarioDestinoBusqueda.Value);

  if not fraSectorDestinoBusqueda.IsEmpty then
    sWhere := sWhere + ' AND DR_SECTORDESTINO = ' + SqlValue(fraSectorDestinoBusqueda.Codigo);

  if not fraUsuarioRecepcionBusqueda.IsEmpty then
  	sWhere := sWhere + ' AND DR_USURECEPCION = ' + SqlValue(fraUsuarioRecepcionBusqueda.Value);

  if not fraTipoDocumentoBusqueda.IsEmpty then
    sWhere := sWhere + ' AND DR_TIPODOCUMENTO = ' + SqlValue(fraTipoDocumentoBusqueda.Value);

  if edSecTrazabilidad.Value > 0 then
    sWhere := sWhere + ' AND DR_SECUENCIATRAZABIL = ' + SqlValue(edSecTrazabilidad.Value);

  case ogEstado.ItemIndex of
    0: sWhere := sWhere + ' AND DR_REMITO IS NULL AND USE_ALTA.SE_SECTOR = ' + SqlValue(Sesion.Sector);
    1: sWhere := sWhere + ' AND DR_REMITO IS NOT NULL AND DR_FECHARECEPCION IS NULL';
    2: sWhere := sWhere + ' AND DR_FECHARECEPCION IS NOT NULL';
  end;

  if chkSoloSectorLog.Checked then
    sWhere := sWhere + ' AND ' + SqlValue(Sesion.Sector) + ' IN (DR_SECTORDESTINO, USE_DER.SE_SECTOR)'
  else
    begin
      if pbIsAdministrador or pbIsSubAdministrador then   // siempre va a entrar por aca...
        sWhere := sWhere + ' AND (' + SqlValue(Sesion.Sector) + ' IN (DR_SECTORDESTINO, USE_DER.SE_SECTOR) OR USE_ALTA.SE_SECTOR = ' + SqlValue(Sesion.Sector) + ')';
    end;

  if chkNoBajas.Checked then
    sWhere := sWhere + ' AND DR_FECHABAJA IS NULL';

	sSql := 'SELECT DISTINCT ROWNUM ' + SMCampoFila + ', A.* ' +
            'FROM (' + sSql + sWhere + ') A ';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

	inherited;
  InicializarContadores;
end;

procedure TfrmDocumentacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DoSMsdqConsultaAfterOpen(Grid, SMCampoCheckBox);
end;

procedure TfrmDocumentacion.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  tslCheckeados.Clear;
end;

procedure TfrmDocumentacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslCheckeados.Free;

  if not Is_ConectadoProduccion() then
    Sesion.CambiarUsuario(psUsuOriginal);
end;

procedure TfrmDocumentacion.DoInicializarDatos;
var
  bExistePrinterEtiquetas: Boolean;
begin
  pbIsAdministrador               := IsAdministradorDocumentacionMEntradas();
  pbIsSubAdministrador            := IsSubAdministrador();
  pbIsSectorCargaAutomaticaCodigo := IsSectorCargaAutomaticaCodigo();
  pbIsSectorMEntradas             := (Sesion.Sector = SECTOR_MENTRADAS);
  bExistePrinterEtiquetas         := ExistePrinterEtiquetas();

  tbNuevo.Enabled              := (pbIsAdministrador or pbIsSubAdministrador) and Seguridad.Activar(tbNuevo);
  tbAnularRemito.Enabled       := (pbIsAdministrador or pbIsSubAdministrador) and Seguridad.Activar(tbAnularRemito);
  tbHistorico.Enabled          := pbIsAdministrador and Seguridad.Activar(tbHistorico);
  mnuRemitosMasivos.Enabled    := pbIsSectorMEntradas and Seguridad.Activar(mnuRemitosMasivos);
  mnuImprimirEtiquetas.Enabled := pbIsAdministrador and bExistePrinterEtiquetas and Seguridad.Activar(mnuImprimirEtiquetas);
  mnuRemitosNoRecepc.Enabled   := pbIsAdministrador and Seguridad.Activar(mnuRemitosNoRecepc);

  VCLExtra.LockControls([chkImprimirEtiqueta], not bExistePrinterEtiquetas or not pbIsAdministrador);

  VCLExtra.LockControls([chkSoloSectorLog], not (pbIsAdministrador or pbIsSubAdministrador));
  chkSoloSectorLog.Checked := not chkSoloSectorLog.Enabled;

  if pbIsSectorMEntradas then
    psEtiq_InfoAdic1 := 'Mesa de Entradas'
  else
    psEtiq_InfoAdic1 := '';

  ClearData;
end;

procedure TfrmDocumentacion.FormCreate(Sender: TObject);
begin
  inherited;

  {$IFDEF LEGALES}
  tbDerivacion.ImageIndex := 26;
  {$ELSE}
  tbDerivacion.ImageIndex := 22;
  {$ENDIF}

  ShowActived := False;
  FieldBaja   := 'DR_FECHABAJA';

  tslCheckeados := TStringList.Create;

  with fraTipoDocumentoBusqueda do
    begin
      Clave              := 'TDOCR';
      ShowBajas          := True;
      CaseSensitive      := False;
      FullLikeComparison := True;
    end;

  with fraUsuarioRecepcionBusqueda do
    begin
      CaseSensitive      := False;
      FullLikeComparison := True;
      MostrarGenericos   := True;
    end;

  with fraUsuarioDestinoBusqueda do
    begin
      CaseSensitive      := False;
      FullLikeComparison := True;
      MostrarGenericos   := True;
    end;

  with fraUsuarioDerivacion do
    begin
      CaseSensitive      := False;
      FullLikeComparison := True;
      MostrarGenericos   := True;
    end;

  with fraTipoDocumento do
    begin
      Clave              := 'TDOCR';
      ShowBajas          := False;
      CaseSensitive      := False;
      FullLikeComparison := True;
      ExtraFields        := ExtraFields + ', TB_MODULO USUASOCIADO ';
      OnChange           := fraTipoDocumentoOnChange;
    end;

  with fraUsuarioDestino do
    begin
      ShowBajas          := False;
      CaseSensitive      := False;
      FullLikeComparison := True;
      MostrarGenericos   := True;
      OnChange           := CambiaUsuario;
    end;

  with fraSectorDestino do
    begin
      TableName          := 'USC_SECTORES';
      FieldID            := 'SC_ID';
      FieldCodigo        := 'SC_CODIGO';
      FieldDesc          := 'SC_DESCRIPCION';
      FieldBaja          := 'SC_FECHABAJA';
      ShowBajas          := False;
      CaseSensitive      := False;
      FullLikeComparison := True;
      OnChange           := fraSectorDestinoOnChange;
    end;

  fraEmpresa.ShowBajas := True;

  with fraSectorDestinoBusqueda do
    begin
      TableName          := 'USC_SECTORES';
      FieldID            := 'SC_ID';
      FieldCodigo        := 'SC_CODIGO';
      FieldDesc          := 'SC_DESCRIPCION';
      FieldBaja          := 'SC_FECHABAJA';
      ShowBajas          := True;
      CaseSensitive      := False;
      FullLikeComparison := True;
    end;

  with fraSectorDestinoRem do
    begin
      TableName          := 'USC_SECTORES';
      FieldID            := 'SC_ID';
      FieldCodigo        := 'SC_CODIGO';
      FieldDesc          := 'SC_DESCRIPCION';
      FieldBaja          := 'SC_FECHABAJA';
      ShowBajas          := True;
      CaseSensitive      := False;
      FullLikeComparison := True;
    end;

  DoInicializarDatos;
end;

procedure TfrmDocumentacion.mnuResultadosClick(Sender: TObject);
begin
  sdqConsulta.DisableControls;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);

  try
    DBPrint.SetGridColumns(DBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);

    inherited tbImprimirClick(nil);
  finally
    sdqConsulta.EnableControls;
    SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
  end;

	inherited tbImprimirClick(nil);
end;

function TfrmDocumentacion.ValidarImpresionRemito(var Remito: Integer): Boolean;
var
	iRemitos: TStringList;
  bEsAlta, bVariosSectores: Boolean;
  sPrimSector: String;
  iCantSel: Integer;
begin
	iRemitos            := TStringList.Create;
  iRemitos.Duplicates := dupIgnore;
  iRemitos.Sorted     := True;
  bVariosSectores     := False;
  sPrimSector         := '';

  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un registro.');

  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        iCantSel := 0;
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                if sPrimSector = '' then
                  sPrimSector := FieldByName('DR_SECTORDESTINO').AsString
                else if sPrimSector <> FieldByName('DR_SECTORDESTINO').AsString then
                  bVariosSectores := True;

                iRemitos.Add(IntToStr(FieldByName('DR_REMITO').AsInteger));

                Verificar(not FieldByName('DR_FECHABAJA').IsNull, nil, 'Alguno de los documentos seleccionados se encuentra dado de baja.');

                inc(iCantSel);
                if iCantSel = tslCheckeados.Count then
                  Break;
              end;

            Next;
          end;
      end;

    Verificar((iRemitos.Count > 1), Grid, 'No puede seleccionar documentación de distintos remitos ni mezclar documentos con y sin remito.');

    Remito  := StrToInt(iRemitos[0]);
    bEsAlta := (Remito = 0);

    Verificar(bEsAlta and not (pbIsAdministrador or pbIsSubAdministrador), nil, 'No tiene permiso para generar nuevos remitos, solo para reimprimir existentes.');
    Verificar(bEsAlta and bVariosSectores, nil, 'No puede elegir documentos de distintos sectores de destino.');

    Result := True;
  finally
    sdqConsulta.EnableControls;
    iRemitos.Free;
  end;
end;

procedure TfrmDocumentacion.mnuRemitoClick(Sender: TObject);
var
  sSql: String;
  iCantSel, iNumeroRemito, iRemito: Integer;
  bEsAlta: Boolean;
begin
  if ValidarImpresionRemito(iRemito) then
    begin
      bEsAlta := (iRemito = 0);

      if bEsAlta then
        begin
          if MsgBox('¿Confirma la generación del remito?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
            begin
              iNumeroRemito := GetProxIdRemito();
              sSql :=
                'UPDATE CDR_DOCUMENTACIONRECIBIDA' +
                  ' SET DR_REMITO = :Remito,' +
                      ' DR_FECHAREMITO = ACTUALDATE' +
                ' WHERE DR_ID = :id';

              BeginTrans;
              try
                sdqConsulta.DisableControls;
                try
                  with sdqConsulta do
                    begin
                      iCantSel := 0;
                      First;
                      while not Eof do
                        begin
                          if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                            begin
                              if FieldByName('DR_REMITO').IsNull then
                                EjecutarSqlSTEx(sSql, [iNumeroRemito, FieldByName('DR_ID').AsInteger]);

                              inc(iCantSel);
                              if iCantSel = tslCheckeados.Count then
                                Break;
                            end;

                          Next;
                        end;
                    end;

                  RefreshData;
                  CommitTrans;

                  DoImprimirRemito(iNumeroRemito, True);
                finally
                  sdqConsulta.EnableControls;
                end;
              except
                on E: exception do
                  begin
                    Rollback;
                    MessageDlg('Se produjo un error al intentar generar/reimprimir el remito.' + E.Message, mtError, [mbOK], 0);
                  end;
              end;
            end;
        end
      else     // Reimpresión
        DoImprimirRemito(iRemito, True);

      mnuLimpiarSeleccion.Click;
    end;
end;

procedure TfrmDocumentacion.tbImprimirClick(Sender: TObject);
begin
	tbImprimir.CheckMenuDropdown;
end;

procedure TfrmDocumentacion.fpAbmEnter(Sender: TObject);
begin
  pbRefrescar := False;
end;

procedure TfrmDocumentacion.fpAbmShow(Sender: TObject);
var
  bEsAlta: Boolean;
begin
	inherited;
  bEsAlta := (ModoABM = maAlta);

	VCLExtra.LockControl(edCodigo, not (bEsAlta and not pbIsSectorCargaAutomaticaCodigo));  // TK 56765 (lo del sector INCAP)

  if pbIsSectorCargaAutomaticaCodigo then  // TK 56765
    edCodigo.Text := IntToStr(GetProxSecuenciaIncap());

  if bEsAlta then
    begin
  		edFecha.Date := DBDate;
      chkImprimirEtiqueta.Checked := chkImprimirEtiqueta.Enabled;
    end
  else
    chkImprimirEtiqueta.Checked := False;
end;

procedure TfrmDocumentacion.btnContinuarClick(Sender: TObject);
begin
	if Validar and DoABM then
    begin
      pbRefrescar := True;

      ModoABM := maAlta;
      edCodigo.Clear;

      if pbIsSectorCargaAutomaticaCodigo then  // TK 56765
        edCodigo.Text := IntToStr(GetProxSecuenciaIncap());

      VCLExtra.LockControl(edCodigo, pbIsSectorCargaAutomaticaCodigo);

      edFecha.Date := DBDate();
      fraUsuarioDestino.Clear;
      edNumeroDocumento.Clear;
      edObservaciones.Clear;
      edCuil.Clear;
      edNombre.Clear;
      fraEmpresa.Clear;
      edSiniestro.Clear;

      if not edFecha.ReadOnly then
        edFecha.SetFocus;
    end;
end;

procedure TfrmDocumentacion.btnrAceptarRemitosMasivosClick(Sender: TObject);
begin
  DoGenerarRemitosMasivos((ogRemitosMasivos.ItemIndex = 1));
end;

procedure TfrmDocumentacion.tbEliminarClick(Sender: TObject);
begin
  Verificar(tslCheckeados.Count >= 1, Grid, 'No debe seleccionar ningún registro ya que se utiliza aquel donde se encuentra actualmente posicionado.');
	Verificar(not sdqConsulta.FieldByName('DR_REMITO').IsNull, Grid, 'El documento tiene remito asignado.');

  inherited;
end;

procedure TfrmDocumentacion.tbExportarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  inherited;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
end;

procedure TfrmDocumentacion.tbHistoricoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');
  Verificar(tslCheckeados.Count >= 1, Grid, 'No debe seleccionar ningún registro ya que se utiliza aquel donde se encuentra actualmente posicionado.');

  with TfrmHistoricoDocumentacion.Create(nil) do
    try
      IdDocRecibida := Self.sdqConsulta.FieldByName('DR_ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmDocumentacion.tbModificarClick(Sender: TObject);
begin
  Verificar(tslCheckeados.Count >= 1, Grid, 'No debe seleccionar ningún registro ya que se utiliza aquel donde se encuentra actualmente posicionado.');
  Verificar(not sdqConsulta.FieldByName('DR_FECHABAJA').IsNull, Grid, 'El documento se encuentra dado de baja.');
  Verificar(not sdqConsulta.FieldByName('DR_REMITO').IsNull and not Seguridad.Claves.IsActive('ModificarDocumento'), Grid, 'El documento tiene remito asignado.');

  inherited;
  if pbRefrescar then
    RefreshData;
end;

procedure TfrmDocumentacion.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  inherited;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
end;

procedure TfrmDocumentacion.tbNuevoClick(Sender: TObject);
begin
  inherited;
  if pbRefrescar then
    RefreshData;
end;

procedure TfrmDocumentacion.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  CalcularFilasSel;
end;

procedure TfrmDocumentacion.mnuSeleccionarTodoClick(Sender: TObject);
begin
  DoSMMarcarTodos(tslCheckeados, sdqConsulta, SMCampoFila);
  CalcularFilasSel;
end;

procedure TfrmDocumentacion.mnuLimpiarSeleccionClick(Sender: TObject);
begin
  DoSMDesmarcarTodos(tslCheckeados, Grid);
  InicializarContadores;
end;

procedure TfrmDocumentacion.mnuInvertirSeleccionClick(Sender: TObject);
begin
	DoSMInvertirSeleccion(tslCheckeados, Grid, SMCampoFila);
  CalcularFilasSel;
end;

procedure TfrmDocumentacion.ImprimirRemitosMasivos(NumeroRemito: Integer);
begin
  DoImprimirRemito(NumeroRemito, False);
end;

procedure TfrmDocumentacion.DoGenerarRemitosMasivos(SoloGenerar: Boolean);
var
	iNumeroRemito: Integer;
  bSinRegistros: Boolean;
	sSql, sSqlUpd: String;
begin
  // Remitos masivos solo lo va a usar el sector mesa de entradas para sus docs. que dieron de alta.
  // Pero para los docs. que dan de alta desde Incapac. y Legales, se va a generar remito con su recepción al mismo tiempo,
  // pero no se va a imprimir el remito.
  sdqConsulta.DisableControls;
  try
    bSinRegistros := True;

    sSql := 'SELECT DISTINCT DR_SECTORDESTINO' +
             ' FROM USE_USUARIOS USE_ALTA, CDR_DOCUMENTACIONRECIBIDA' +
            ' WHERE DR_REMITO IS NULL' +
              ' AND DR_FECHABAJA IS NULL' +
              ' AND DR_SECTORDESTINO IS NOT NULL' +
              ' AND (DR_SECTORDESTINO NOT IN (''COME'', ''HYS'')' +
                    'OR DR_USUDESTINO IS NULL)' +  // COME Comercial - HYS Prevención
              ' AND DR_USUALTA = USE_ALTA.SE_USUARIO' +
              ' AND USE_ALTA.SE_SECTOR NOT IN (''INCAP'', ''LEGAL'')' +
              ' AND USE_ALTA.SE_SECTOR IN (' + SqlValue(SECTOR_MENTRADAS) + ')';

    with GetQuery(sSql) do
      try
        if not IsEmpty then
          begin
            bSinRegistros := False;

            sSqlUpd := 'UPDATE CDR_DOCUMENTACIONRECIBIDA' +
                         ' SET DR_REMITO = :remito,' +
                             ' DR_FECHAREMITO = ACTUALDATE' +
                       ' WHERE DR_SECTORDESTINO = :sector' +
                         ' AND DR_REMITO IS NULL' +
                         ' AND DR_FECHABAJA IS NULL' +
                         ' AND EXISTS (SELECT 1' +
                                       ' FROM USE_USUARIOS USE_ALTA' +
                                      ' WHERE DR_USUALTA = USE_ALTA.SE_USUARIO' +
                                        ' AND USE_ALTA.SE_SECTOR NOT IN (''INCAP'', ''LEGAL'')' +
                                        ' AND USE_ALTA.SE_SECTOR IN (' + SqlValue(SECTOR_MENTRADAS) + '))';

            while not Eof do
              begin
                iNumeroRemito := GetProxIdRemito();
                EjecutarSqlEx(sSqlUpd, [iNumeroRemito, FieldByName('DR_SECTORDESTINO').AsString]);

                if not SoloGenerar then
                  ImprimirRemitosMasivos(iNumeroRemito);

                Next;
              end;
          end;
      finally
        Free;
      end;


    sSql := 'SELECT DISTINCT DR_SECTORDESTINO' +
             ' FROM USE_USUARIOS USE_ALTA, CDR_DOCUMENTACIONRECIBIDA' +
            ' WHERE DR_REMITO IS NULL' +
              ' AND DR_FECHABAJA IS NULL' +
              ' AND DR_SECTORDESTINO IS NOT NULL' +
              ' AND DR_USUALTA = USE_ALTA.SE_USUARIO' +
              ' AND USE_ALTA.SE_SECTOR IN (''INCAP'', ''LEGAL'')';   // para estos dos sectores que dan de alta documentos, genero, pero no imprimo el remito, ya que manejan solo documentos en forma digital, no en papel

    with GetQuery(sSql) do
      try
        if not IsEmpty then
          begin
            bSinRegistros := False;

            sSqlUpd := 'UPDATE CDR_DOCUMENTACIONRECIBIDA' +
                         ' SET DR_REMITO = :remito,' +
                             ' DR_FECHAREMITO = ACTUALDATE,' +
                             ' DR_FECHARECEPCION = ACTUALDATE,' +    // y hago la recepción en forma automática
                             ' DR_USURECEPCION = :UsuRecepcion' +
                       ' WHERE DR_SECTORDESTINO = :sector' +
                         ' AND DR_REMITO IS NULL' +
                         ' AND DR_FECHABAJA IS NULL' +
                         ' AND EXISTS (SELECT 1' +
                                       ' FROM USE_USUARIOS USE_ALTA' +
                                      ' WHERE DR_USUALTA = USE_ALTA.SE_USUARIO' +
                                        ' AND USE_ALTA.SE_SECTOR IN (''INCAP'', ''LEGAL''))';

            while not Eof do
              begin
                iNumeroRemito := GetProxIdRemito();
                EjecutarSqlEx(sSqlUpd, [iNumeroRemito, Sesion.UserId, FieldByName('DR_SECTORDESTINO').AsString]);

                Next;
              end;
          end;
      finally
        Free;
      end;


    sSql := 'SELECT DISTINCT DR_USUDESTINO' +
             ' FROM USE_USUARIOS USE_ALTA, CDR_DOCUMENTACIONRECIBIDA' +
            ' WHERE DR_REMITO IS NULL' +
              ' AND DR_FECHABAJA IS NULL' +
              ' AND DR_SECTORDESTINO IN (''COME'', ''HYS'')' +  // COME COMERCIAL - HYS PREVENCIÓN
              ' AND DR_USUDESTINO IS NOT NULL' +
              ' AND DR_USUALTA = USE_ALTA.SE_USUARIO' +
              ' AND USE_ALTA.SE_SECTOR IN (' + SqlValue(SECTOR_MENTRADAS) + ')';

    with GetQuery(sSql) do
      try
        if not IsEmpty then
          begin
            bSinRegistros := False;

            sSqlUpd := 'UPDATE CDR_DOCUMENTACIONRECIBIDA' +
                         ' SET DR_REMITO = :remito,' +
                             ' DR_FECHAREMITO = ACTUALDATE' +
                       ' WHERE DR_USUDESTINO = :usuario' +
                         ' AND DR_REMITO IS NULL' +
                         ' AND DR_FECHABAJA IS NULL' +
                         ' AND DR_SECTORDESTINO IN (''COME'', ''HYS'')' +  // COME COMERCIAL - HYS PREVENCIÓN
                         ' AND EXISTS (SELECT 1' +
                                       ' FROM USE_USUARIOS USE_ALTA' +
                                      ' WHERE DR_USUALTA = USE_ALTA.SE_USUARIO' +
                                        ' AND USE_ALTA.SE_SECTOR IN (' + SqlValue(SECTOR_MENTRADAS) + '))';

            while not Eof do
              begin
                iNumeroRemito := GetProxIdRemito();
                EjecutarSqlEx(sSqlUpd, [iNumeroRemito, FieldByName('DR_USUDESTINO').AsString]);

                if not SoloGenerar then
                  ImprimirRemitosMasivos(iNumeroRemito);

                Next;
              end;
          end;
      finally
        Free;
      end;

    if bSinRegistros then
      MsgBox('No hay registros para generar.')
    else
      begin
        MsgBox('Los remitos se han generado correctamente.');
        RefreshData;
      end;

    fpRemitosMasivos.Close;
	finally
  	sdqConsulta.EnableControls;
  end;
end;

procedure TfrmDocumentacion.mnuRemitosMasivosClick(Sender: TObject);
begin
  Verificar(tslCheckeados.Count >= 1, Grid, 'No debe seleccionar ningún registro de la grilla.');

  fpRemitosMasivos.ShowModal;
end;

procedure TfrmDocumentacion.mnuRemitosNoRecepcClick(Sender: TObject);
begin
  fpListDocPendRecepcion.ShowModal;
end;

procedure TfrmDocumentacion.tbDerivacionClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(tslCheckeados.Count >= 1, Grid, 'No debe seleccionar ningún registro ya que se utiliza aquel donde se encuentra actualmente posicionado.');
  Verificar(not sdqConsulta.FieldByName('DR_FECHABAJA').IsNull, Grid, 'El documento se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('DR_REMITO').IsNull, nil, 'El documento no tiene remito generado.');

  if fpDerivacion.ShowModal = mrOk then
    RefreshData;
end;

procedure TfrmDocumentacion.DoHabilitarCampos(Habilitar :Boolean);
begin
  VCLExtra.LockControls([edFecha, edRemitente, fraUsuarioDestino, fraSectorDestino,
                         edNumeroDocumento, edNumeroDocumento], not Habilitar);
end;

procedure TfrmDocumentacion.btnAceptarDerivacionClick(Sender: TObject);
begin
  Verificar(fraUsuarioDerivacion.IsEmpty, fraUsuarioDerivacion, 'Debe indicar el usuario de derivación.');

  if MsgBox('¿Está seguro de querer derivar este documento?', MB_OK + MB_ICONINFORMATION + MB_YESNO ) = IDYES then
    begin
      try
        with TSql.Create do
          try
            TableName := 'CDR_DOCUMENTACIONRECIBIDA';

            SqlType := stUpdate;

            PrimaryKey.Add('DR_ID',           sdqConsulta.FieldByName('DR_ID').AsInteger, False);
            Fields.Add('DR_FECHADERIVACION',  SQL_DATETIME, False);
            Fields.Add('DR_DERIVADOA', 	 	    fraUsuarioDerivacion.Value);
            Fields.Add('DR_FECHARECEPCION',   exNull);
            Fields.Add('DR_USURECEPCION', 	  exNull);
            //Fields.Add('DR_REMITO', 	 	      exNull);
            //Fields.Add('DR_FECHAREMITO', 	 	  exNull);

            EjecutarSql(Sql);
          finally
            Free;
          end;

        MsgBox('Derivación grabada correctamente.', MB_OK + MB_ICONINFORMATION);
        fpDerivacion.ModalResult := mrOk;
      except
        On E: Exception do
          Raise Exception.Create (E.Message + CRLF + 'Error al grabar la derivación.');
      end;
    end;
end;

procedure TfrmDocumentacion.fpDerivacionEnter(Sender: TObject);
begin
  fraUsuarioDerivacion.Clear;
end;

procedure TfrmDocumentacion.fpListDocPendRecepcionEnter(Sender: TObject);
begin
  edFRemDesde.Clear;
  edFRemHasta.Clear;
  fraSectorDestinoRem.Clear;
end;

procedure TfrmDocumentacion.fpRemitosMasivosShow(Sender: TObject);
begin
  ogRemitosMasivos.ItemIndex := 0;   // Generar e Imprimir
end;

procedure TfrmDocumentacion.fraSectorDestinoOnChange(Sender: TObject);
begin
  fraUsuarioDestino.Clear;
end;

procedure TfrmDocumentacion.fraTipoDocumentoOnChange(Sender: TObject);
var
  sUsuario, sSector: String;
begin
  if fraTipoDocumento.IsSelected then
    begin
      sUsuario := fraTipoDocumento.sdqDatos.FieldByName('USUASOCIADO').AsString;
      sSector  := fraTipoDocumento.Especial2;

      if not IsEmptyString(sUsuario) and (fraUsuarioDestino.Codigo <> sUsuario) then
        begin
          fraUsuarioDestino.Codigo := sUsuario;
          CambiaUsuario(nil);
        end
      else if not IsEmptyString(sSector) and (fraSectorDestino.Codigo <> sSector) and not fraSectorDestino.Locked then
        begin
          fraSectorDestino.Codigo := sSector;
          fraSectorDestinoOnChange(nil);
        end;
    end;
end;

function TfrmDocumentacion.IsSubAdministrador: Boolean;
begin
  Result := (AreIn(Sesion.Sector, ['INCAP', 'LEGAL']));
end;

function TfrmDocumentacion.IsSectorCargaAutomaticaCodigo: Boolean;
begin
  Result := True;   // (Sesion.Sector = 'INCAP');
end;

function TfrmDocumentacion.GetProxIdRemito: TTableId;
begin
  Result := ValorSqlInteger('SELECT NVL(MAX(DR_REMITO), 0) + 1 FROM CDR_DOCUMENTACIONRECIBIDA');
end;

function TfrmDocumentacion.GetProxSecuenciaIncap: TTableId;
begin
  Result := GetSecNextVal('COMUNES.SEQ_CDR_INCAP_ID');
end;

procedure TfrmDocumentacion.GridCellClick(Column: TColumn);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = SMCampoCheckBox) then
  begin
    DoSMMarcarDesmarcarFila(tslCheckeados, Grid, SMCampoFila);
    CalcularFilasSel;
  end;
end;

procedure TfrmDocumentacion.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(Grid, tslCheckeados, SMCampoFila, Rect);
end;

procedure TfrmDocumentacion.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if IsBaja() then
    AFont.Color := clRed;

  DoSMGridGetCellProps(tslCheckeados, sdqConsulta, SMCampoFila, Background);
end;

procedure TfrmDocumentacion.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  DoSMGridKeyDown(Key, Grid, SMCampoCheckBox);
end;

procedure TfrmDocumentacion.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;
end;

procedure TfrmDocumentacion.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbModificar.Enabled := tbModificar.Enabled and (pbIsAdministrador or pbIsSubAdministrador) and Seguridad.Activar(tbModificar);
  tbEliminar.Enabled  := tbEliminar.Enabled and (pbIsAdministrador or pbIsSubAdministrador) and Seguridad.Activar(tbEliminar);
end;

procedure TfrmDocumentacion.CalcularFilasSel;
begin
  edCantSelecc.Value := tslCheckeados.Count;
  Grid.Repaint;
end;

procedure TfrmDocumentacion.DoMarcarFila;
begin
  if not IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
    begin
      DoSMMarcarFila(tslCheckeados, Grid, SMCampoFila);
      CalcularFilasSel;
    end;
end;

procedure TfrmDocumentacion.edRemitoDesdeExit(Sender: TObject);
begin
  if not edRemitoDesde.IsEmpty then
    begin
      edRemitoDesde.Value := StrToInt(edRemitoDesde.Text);

      if edRemitoHasta.IsEmpty then
        edRemitoHasta.Value := edRemitoDesde.Value;
    end;
end;

procedure TfrmDocumentacion.edRemitoHastaExit(Sender: TObject);
begin
  if not edRemitoHasta.IsEmpty then
    edRemitoHasta.Value := StrToInt(edRemitoHasta.Text);
end;

procedure TfrmDocumentacion.InicializarContadores;
begin
  edCantSelecc.Value := 0;
  Grid.Repaint;
end;

procedure TfrmDocumentacion.tbBuscarCodigoBarrasClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');

  DoBuscarCampoCodigoBarras('SECUENCIATRAZABIL', '', True, True);
end;

procedure TfrmDocumentacion.mnuImprimirEtiquetasClick(Sender: TObject);
begin
  DoImprimirEtiqueta(sdqConsulta, tslCheckeados, SMCampoFila, '', '', 'SECUENCIATRAZABIL', '', '', False, True, psEtiq_InfoAdic1, DateToStr(DBDate()));
end;

procedure TfrmDocumentacion.DoImprimirRemito(Remito: Integer; ConPreview: Boolean);
begin
  with TfrmRemitoDocumentacion.Create(self) do
    try
      DoImprimirRemito(Remito, ConPreview, '');
    finally
      free;
    end;
end;

function TfrmDocumentacion.ValidarRecepcionar: Boolean;
var
  iCantSel: Integer;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un documento.');

  with sdqConsulta do
    begin
      DisableControls;
      try
        iCantSel := 0;
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                Verificar(not FieldByName('DR_FECHABAJA').IsNull, nil, 'Alguno de los documentos seleccionados se encuentra dado de baja.');
                // Verificar(not FieldByName('DR_FECHARECEPCION').IsNull and FieldByName('DR_DERIVADOA').IsNull, nil, 'Alguno de los documentos seleccionados ya ha sido recepcionado.');   // si derivan documentos puede haber múltiples recepciones
                Verificar(not FieldByName('DR_FECHARECEPCION').IsNull, nil, 'Alguno de los documentos seleccionados ya ha sido recepcionado.');
                Verificar(FieldByName('DR_REMITO').IsNull, nil, 'Alguno de los documentos seleccionados no tiene remito generado.');

                inc(iCantSel);
                if iCantSel = tslCheckeados.Count then
                  Break;
              end;

            Next;
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TfrmDocumentacion.tbPropiedadesClick(Sender: TObject);
var
  sSql: String;
  iCantSel: Integer;
begin
  if ValidarRecepcionar() then
    begin
      if MsgBox('¿Confirma la recepción de los documentos seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
        begin
          BeginTrans;
          try
            with sdqConsulta do
              begin
                sSql := 'UPDATE CDR_DOCUMENTACIONRECIBIDA' +
                          ' SET DR_FECHARECEPCION = ACTUALDATE,' +
                              ' DR_USURECEPCION = :UsuRecepcion' +
                        ' WHERE DR_ID = :Id';

                DisableControls;
                try
                  First;
                  iCantSel := 0;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        begin
                          EjecutarSqlSTEx(sSql, [Sesion.UserID, FieldByName('DR_ID').AsInteger]);

                          inc(iCantSel);
                          if iCantSel = tslCheckeados.Count then
                            Break;
                        end;

                      Next;
                    end;
                finally
                  EnableControls;
                end;
              end;

            CommitTrans;
            MsgBox('Documentos recepcionados correctamente.', MB_ICONINFORMATION);

            RefreshData;
            mnuLimpiarSeleccion.Click;
          except
            on E : exception do
              begin
                Rollback;
                MessageDlg('Se produjo un error al intentar recepcionar los documentos.' + E.Message, mtError, [mbOK], 0);
              end;
          end;
        end;
    end;
end;

procedure TfrmDocumentacion.tbAnularRemitoClick(Sender: TObject);
var
  sSql: String;
  iRemito: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');
  Verificar(tslCheckeados.Count >= 1, Grid, 'No debe seleccionar ningún registro ya que se utiliza aquel donde se encuentra actualmente posicionado.');
  Verificar(not sdqConsulta.FieldByName('DR_FECHABAJA').IsNull, Grid, 'El documento se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('DR_REMITO').IsNull, Grid, 'El documento no tiene remito asignado.');

  iRemito := sdqConsulta.FieldByName('DR_REMITO').AsInteger;

  sSql := 'SELECT 1 ' +
            'FROM CDR_DOCUMENTACIONRECIBIDA ' +
           'WHERE DR_FECHABAJA IS NULL ' +
             'AND DR_FECHARECEPCION IS NOT NULL ' +
             'AND DR_REMITO = :Remito';
  Verificar(ExisteSqlEx(sSQl, [iRemito]), Grid, 'El remito tiene documentos recepcionados.');

  if MsgBox('¿Confirma la anulación del remito?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      sSql := 'UPDATE CDR_DOCUMENTACIONRECIBIDA ' +
                 'SET DR_REMITO = NULL, ' +
                     'DR_FECHAREMITO = NULL ' +
               'WHERE DR_REMITO = :Remito';
      EjecutarSqlEx(sSql, [iRemito]);

      MsgBox('Remito anulado correctamente.', MB_ICONINFORMATION);
      RefreshData;
    end;
end;

function TfrmDocumentacion.ValidarAnularRecepcionar: Boolean;
var
  iCantSel: Integer;
  dFechaRecepMax: TDateTime;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un documento.');

  dFechaRecepMax := CalcDiasHabiles(DBDate(), -3);

  with sdqConsulta do
    begin
      DisableControls;
      try
        iCantSel := 0;
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                Verificar(not FieldByName('DR_FECHABAJA').IsNull, nil, 'Alguno de los documentos seleccionados se encuentra dado de baja.');
                Verificar(FieldByName('DR_FECHARECEPCION').IsNull, nil, 'Alguno de los documentos seleccionados no ha sido recepcionado.');
                Verificar(FieldByName('DR_USURECEPCION').AsString <> Sesion.UserId, nil, 'Alguno de los documentos seleccionados no ha sido recepcionado por usted.');
                Verificar(dFechaRecepMax > FieldByName('DR_FECHARECEPCION').AsDateTime, edFecha, 'Alguno de los documentos seleccionados ha sido recepcionado hace más de 3 días hábiles de la fecha actual.');

                inc(iCantSel);
                if iCantSel = tslCheckeados.Count then
                  Break;
              end;

            Next;
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TfrmDocumentacion.tbAnularRecepcionClick(Sender: TObject);
var
  sSql: String;
  iCantSel: Integer;
begin
  if ValidarAnularRecepcionar() then
    begin
      if MsgBox('¿Confirma la anulación de la recepción de los documentos seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
        begin
          BeginTrans;
          try
            with sdqConsulta do
              begin
                sSql := 'UPDATE CDR_DOCUMENTACIONRECIBIDA ' +
                           'SET DR_FECHARECEPCION = NULL, ' +
                               'DR_USURECEPCION = NULL, ' +
                               'DR_USUMODIF = :Usuario, ' +
                               'DR_FECHAMODIF = SYSDATE ' +
                        'WHERE DR_ID = :Id';

                DisableControls;
                try
                  First;
                  iCantSel := 0;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        begin
                          EjecutarSqlSTEx(sSql, [Sesion.UserID, FieldByName('DR_ID').AsInteger]);

                          inc(iCantSel);
                          if iCantSel = tslCheckeados.Count then
                            Break;
                        end;

                      Next;
                    end;
                finally
                  EnableControls;
                end;
              end;

            CommitTrans;
            MsgBox('Documentos recepcionados han sido anulados correctamente.', MB_ICONINFORMATION);

            RefreshData;
            mnuLimpiarSeleccion.Click;
          except
            on E : exception do
              begin
                Rollback;
                MessageDlg('Se produjo un error al intentar anular la recepción de los documentos.' + E.Message, mtError, [mbOK], 0);
              end;
          end;
        end;
    end;
end;

{------------------------------------------------------------------------------}
procedure TfrmDocumentacion.tConexionTimer(Sender: TObject);
begin
  tConexion.Enabled := False;

  if not Is_ConectadoProduccion() and (fpUsuConectado.ShowModal = mrCancel) then
    Close;
end;

procedure TfrmDocumentacion.btnAceptarDocPendRecepcionClick(Sender: TObject);
begin
  Verificar(edFRemDesde.IsEmpty, edFRemDesde, 'Debe ingresar la fecha de remito desde.');

  with TfrmLstRemitosnoRecepcionados.Create(nil) do
    try
      DoImprimirRemitosNoRecepcionados(edFRemDesde.Date, edFRemHasta.Date, fraSectorDestinoRem.Codigo, pbIsAdministrador and pbIsSectorMEntradas);
    finally
      Free
    end;
end;

procedure TfrmDocumentacion.btnAceptarUsuConectadoClick(Sender: TObject);
begin
  Verificar(fraUsuConectado.IsEmpty, fraUsuConectado, 'Debe indicar como quien se va a conectar.');

  psUsuOriginal := Sesion.UserId;
  if psUsuOriginal <> fraUsuConectado.Codigo then
    begin
      Sesion.CambiarUsuario(fraUsuConectado.Codigo);
      Caption := Caption + ' - Conectado como... ' + Sesion.Usuario;

      DoInicializarDatos;
    end;

  fpUsuConectado.ModalResult := mrOk;
end;

procedure TfrmDocumentacion.fpUsuConectadoEnter(Sender: TObject);
begin
  fraUsuConectado.Codigo := Sesion.UserId;
end;
{------------------------------------------------------------------------------}
end.

