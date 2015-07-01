unit unRelevamientoRiesgosLaborales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, ExtCtrls, JvExExtCtrls,DBSql,
  JvNavigationPane, JvgGroupBox, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ToolPanels, ImgList, RXCtrls, Mask, ToolEdit, PatternEdit, unFraEmpresa,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unfraEstablecimientoDomic,
  ToolWin, ComboEditor, DBComboGrid, Buttons, unCustomForm, XPMenu, SqlFuncs,
  Placemnt, ShortCutControl, SDEngine, DB, Menus, unComunesFet, unConstFet,
  RXDBCtrl, ArtComboBox, ArtDBGrid, FormPanel, unFraCodigoDescripcion,
  SortDlg, ExComboBox, artSeguridad, unRptResolucion463, unRelevGestion463,
  unRptVisitasNo,unRptRes463Preventor, ArchFuncs, unVisorPDF, IntEdit,
  CheckLst, ARTCheckListBox, RxToolEdit, RxPlacemnt;

type
  THackControl = class(TControl);

  TDatoAnexo = class
  private
    FNumeroItem: Integer;
    FFechaRegularizacion: TDate;
    FFechaVerificacion: TDate;
    FObservacionDenuncia: String;
    FIdFormularioRequerido: integer;
    FCargoRepresentanteReq: String;
  public
    property NumeroItem: Integer read FNumeroItem write FNumeroItem;
    property FechaRegularizacion: TDate read FFechaRegularizacion write FFechaRegularizacion;
    property FechaVerificacion: TDate read FFechaVerificacion write FFechaVerificacion;
    property ObservacionDenuncia: String read FObservacionDenuncia write FObservacionDenuncia;
    property IdFormularioRequerido: Integer read FIdFormularioRequerido write FIdFormularioRequerido;
    property CargoRepresentanteReq: String read FCargoRepresentanteReq write FCargoRepresentanteReq;
  end;

  TfrmRelevamientosRiesgosLaborales = class(TfrmCustomForm)
    AdvToolPanelTab: TAdvToolPanelTab;
    AdvToolPanelAdjuntos: TAdvToolPanel;
    gbBottom: TJvgGroupBox;
    Splitter1: TJvOutlookSplitter;
    pnlCenter: TPanel;
    Panel1: TPanel;
    pnlLeft: TPanel;
    JvOutlookSplitter1: TJvOutlookSplitter;
    Splitter2: TJvOutlookSplitter;
    tsAnexos: TPageControl;
    ImageList: TImageList;
    Label1: TLabel;
    edFechaRegul: TDateEdit;
    lbFechaVerificacion: TLabel;
    edFechaVerificacion: TDateEdit;
    lbObservacionDen: TLabel;
    edObservacionDen: TMemo;
    pnCabecera: TPanel;
    lbFRecepcion: TLabel;
    edFechaRecepcion: TDateEdit;
    lbValido: TLabel;
    lbValidoSiNo: TLabel;
    lbVigencia: TLabel;
    edVigencia: TPatternEdit;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton1: TToolButton;
    tbNuevo: TToolButton;
    tbModificar: TToolButton;
    tbEliminar: TToolButton;
    ToolButton2: TToolButton;
    tbPropiedades: TToolButton;
    ToolButton3: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    ToolButton4: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviarMail: TToolButton;
    ToolButton5: TToolButton;
    tbMostrarFiltros: TToolButton;
    tbMaxRegistros: TToolButton;
    ToolButton6: TToolButton;
    tbSalir: TToolButton;
    pnFiltro: TPanel;
    Bevel1: TBevel;
    lblCUIT: TLabel;
    lbCPostalA: TLabel;
    Label4: TLabel;
    fraEstableciBusq: TfraEstablecimientoDomic;
    fraEmpresa: TfraEmpresa;
    edCPA: TEdit;
    edCiuu: TEdit;
    gbNavegador: TJvgGroupBox;
    btnNavSiguiente: TSpeedButton;
    btnNavUltimo: TSpeedButton;
    btnNavPrimero: TSpeedButton;
    btnNavAnterior: TSpeedButton;
    ShortCutControl1: TShortCutControl;
    panComandos: TPanel;
    btnGuardar: TButton;
    btnLimpiar: TButton;
    sdqConsultaCabecera: TSDQuery;
    sdqlistaitems: TSDQuery;
    tbResponsable: TToolButton;
    tbFormularios: TToolButton;
    pmnuForms: TPopupMenu;
    mnuAnexoCancerigenos: TMenuItem;
    mnuAnexoDifenilos: TMenuItem;
    mnuAnexoAccIndMayores: TMenuItem;
    tbGremialistas: TToolButton;
    tbRelevContratistas: TToolButton;
    sdqObservaciones: TSDQuery;
    dbgObservaciones: TArtDBGrid;
    dsObservaciones: TDataSource;
    tbAprobarCargaFinal: TToolButton;
    ToolButton8: TToolButton;
    lblCargaDefinitiva: TLabel;
    lblEstadoDefinitivo: TLabel;
    lblRelevValidosDefinitiva: TLabel;
    lblRelevInvalidosDefinitiva: TLabel;
    lblCantEstabDefinitiva: TLabel;
    lblUsuarioAprob: TLabel;
    lblFechaAprobacion: TLabel;
    lblCumplimientoDefinitivo: TLabel;
    tbNuevoObservacion: TToolButton;
    tbModificarObservacion: TToolButton;
    tbEliminarObservacion: TToolButton;
    ToolBarObservaciones: TToolBar;
    fpObservaciones: TFormPanel;
    BevelAbm: TBevel;
    lbObservacion: TLabel;
    btnAceptarObservacion: TButton;
    btnCancelarObservacion: TButton;
    fraObservacion: TfraCodigoDescripcion;
    edObservacionLibre: TMemo;
    lbObservacionLibre: TLabel;
    tbCargaRapida: TToolButton;
    Panel2: TPanel;
    Label7: TLabel;
    pnlColor5: TPanel;
    Label10: TLabel;
    pnlColor4: TPanel;
    Label9: TLabel;
    lbColor2: TLabel;
    pnlColor2: TPanel;
    lbColor1: TLabel;
    Label8: TLabel;
    pnlColor1: TPanel;
    Label11: TLabel;
    tbVisitas: TToolBar;
    tbSegAgregar: TToolButton;
    tbSegQuitar: TToolButton;
    ToolButton7: TToolButton;
    tbSegOrdenar: TToolButton;
    dbgSeguimiento: TArtDBGrid;
    fpSeguimiento: TFormPanel;
    Label12: TLabel;
    Bevel2: TBevel;
    Label13: TLabel;
    btnVisAceptar: TButton;
    btnVisCancelar: TButton;
    cmbSegTipo: TExComboBox;
    edSegFecha: TDateEdit;
    sdSeguimiento: TSortDialog;
    dsSeguimiento: TDataSource;
    sdqSeguimiento: TSDQuery;
    FormPlacement: TFormPlacement;
    tbEstablecimiento: TToolButton;
    btnSiguiente: TButton;
    lbSiguienteForm: TLabel;
    Seguridad: TSeguridad;
    tbImpresionResolucion: TToolButton;
    Label14: TLabel;
    tbGenerarPDF: TToolButton;
    sdqRelev: TSDQuery;
    tbAnexoItemsNo: TToolButton;
    tbCambioModo: TToolButton;
    tbImpresionPreventor: TToolButton;
    ToolButton9: TToolButton;
    tbCopiaEmpleador: TToolButton;
    fpCopiaPreventor: TFormPanel;
    Label15: TLabel;
    Bevel3: TBevel;
    btnFRecepAceptar: TButton;
    Button2: TButton;
    edFechaRecepcionPreventor: TDateEdit;
    tbCargaFueraDeTermino: TToolButton;
    tbCopiarFGRL: TToolButton;
    fpCopiaEstablecimiento: TFormPanel;
    Label3: TLabel;
    Bevel4: TBevel;
    btnAceptarEstabCopia: TButton;
    Button3: TButton;
    fraEstablecimientoCopia: TfraCodigoDescripcion;
    tbTodoNo: TToolButton;
    Image1: TImage;
    Label2: TLabel;
    Image2: TImage;
    Label5: TLabel;
    Image3: TImage;
    Label6: TLabel;
    lbCantEmpleados: TLabel;
    edES_EMPLEADOS: TIntEdit;
    cbSinPersonal: TCheckBox;
    cbSinDatos: TCheckBox;
    edProcedencia: TLabel;
    lbProcedencia: TLabel;
    edFechaFormulario: TDateEdit;
    Label16: TLabel;
    lblOrigen: TLabel;
    lblVersion: TLabel;
    tbCargarInvalido: TToolButton;
    tbNuevoObservacionMultiple: TToolButton;
    fpObservacionMultiple: TFormPanel;
    Bevel5: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    btnAceptarObsMultiple: TButton;
    btnCancelarObsMultiple: TButton;
    edObsLibreMultiple: TMemo;
    chkObservaciones: TARTCheckListBox;
    ToolButton10: TToolButton;
    tbModificarSinValidar: TToolButton;
    tbRecuperarDatosAnexo2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure lvAnexo2CustomDrawItem(Sender: TCustomListView;Item: TListItem;
              State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvAnexo2Click(Sender: TObject);
    procedure lvAnexo2KeyPress(Sender: TObject; var Key: Char);
    procedure edObservacionDenExit(Sender: TObject);
    procedure edObservacionDenKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEstableciBusqChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure EntrarContrato;
    procedure tbModificarClick(Sender: TObject);
    procedure lvAnexo2_AChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure tsAnexosChange(Sender: TObject);
    procedure edFechaRegulExit(Sender: TObject);
    procedure edFechaVerificacionExit(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnNavPrimeroClick(Sender: TObject);
    procedure btnNavAnteriorClick(Sender: TObject);
    procedure btnNavUltimoClick(Sender: TObject);
    procedure btnNavSiguienteClick(Sender: TObject);
    procedure mnuAnexoCancerigenosClick(Sender: TObject);
    procedure mnuAnexoDifenilosClick(Sender: TObject);
    procedure mnuAnexoAccIndMayoresClick(Sender: TObject);
    procedure tbGremialistasClick(Sender: TObject);
    procedure tbRelevContratistasClick(Sender: TObject);
    procedure tbResponsableClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure tbAprobarCargaFinalClick(Sender: TObject);
    procedure fraEstableciBusqExit(Sender: TObject);
    procedure tbNuevoObservacionClick(Sender: TObject);
    procedure tbModificarObservacionClick(Sender: TObject);
    procedure tbEliminarObservacionClick(Sender: TObject);
    procedure btnAceptarObservacionClick(Sender: TObject);
    procedure tbCargaRapidaClick(Sender: TObject);
    procedure dbgObservacionesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEstablecimientoClick(Sender: TObject);
    procedure tbSegAgregarClick(Sender: TObject);
    procedure btnVisAceptarClick(Sender: TObject);
    procedure lvAnexo2_ADataFind(Sender: TObject; Find: TItemFind;
      const FindString: String; const FindPosition: TPoint;
      FindData: Pointer; StartIndex: Integer; Direction: TSearchDirection;
      Wrap: Boolean; var Index: Integer);
    procedure btnSiguienteClick(Sender: TObject);
    procedure edFechaRecepcionExit(Sender: TObject);
    procedure fraEmpresamskCUITChange(Sender: TObject);
    procedure fraEstableciBusqedCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure ShortCutControl1ShortCuts9ShortCutPress(Sender: TObject);
    procedure ShortCutControl1ShortCuts10ShortCutPress(Sender: TObject);
    procedure ShortCutControl1ShortCuts11ShortCutPress(Sender: TObject);
    procedure tbSegQuitarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbImpresionResolucionClick(Sender: TObject);
    procedure tbGenerarPDFClick(Sender: TObject);
    procedure tbAnexoItemsNoClick(Sender: TObject);
    procedure tbCambioModoClick(Sender: TObject);
    procedure tbImpresionPreventorClick(Sender: TObject);
    procedure edProcedenciaDblClick(Sender: TObject);
    procedure tbCopiaEmpleadorClick(Sender: TObject);
    procedure btnFRecepAceptarClick(Sender: TObject);
    procedure tbCargaFueraDeTerminoClick(Sender: TObject);
    procedure edVigenciaExit(Sender: TObject);
    procedure tbCopiarFGRLClick(Sender: TObject);
    procedure btnAceptarEstabCopiaClick(Sender: TObject);
    procedure tbTodoNoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearParamsError(AQuery: TSDQuery);
    procedure tbCargarInvalidoClick(Sender: TObject);
    procedure tbNuevoObservacionMultipleClick(Sender: TObject);
    procedure btnAceptarObsMultipleClick(Sender: TObject);
    procedure btnCancelarObsMultipleClick(Sender: TObject);
    procedure tbModificarSinValidarClick(Sender: TObject);
    procedure tbRecuperarDatosAnexo2Click(Sender: TObject);
  private
    FCargaInvalido: boolean;
    FClickNuevo: boolean;
    FIdSolicitud: integer;
    FfechaVisitaVerificacion : TDate;
    FVersion: integer;
    ModoFueraDeTermino : Boolean;
    FidResolucionAnexo: integer;
    FOrigenFormulario: String;
    iResolucion : Integer;
    iCabecera : Integer;
    Sql: TCustomSql;
    FModoABM : TModoABM;
    ModoEmpleador : Boolean;
    FieldBajaObservacion: String;
    FieldManualObservacion : String;
    FieldValidaObservacion : String;
    ModoABMObservacion : TModoABM;
    FCantRelevValidos: Integer;
    FCantRelevInvalido : Integer;
    FFechaActual: Double;
    FComponenteBuscado: TComponent;
    Cancerigeno : String;
    Difenilos : String;
    AccMayores : String;
    FModificarSinRestriccion : Boolean;
    procedure mnuAnexos(Sender: TObject; TipoFormulario: Byte; MenuCaption: String);
    procedure AjustarColorValido(Reset: Boolean; EsValido: Boolean = False);
    procedure ChangeItemValue(AListView: TListView; AItem: TListItem);
    procedure CargarDatosResolucion(aidCabecera: integer);
    procedure DesbloquearContrato;
    procedure MoverRegistro(adireccion: integer);
    function Validar: boolean;
    procedure CargarObservaciones(aidCabecera: integer);
    procedure BloquearResponsables(habilitar: Boolean);
    procedure BorrarCampos;
    procedure CargarEstado(aContrato: integer; aVigencia: String);
    procedure ClearControlsObservacion;
    procedure LoadControlsObservaciones;
    procedure ObservacionesABM;
    procedure ObservacionesDoABM(aIdObservacion: integer; aTextoLibre: String);
    function IsBajaObservaciones: Boolean;
    function IsManualObservacion: Boolean;
    function IsValidaObservacion: Boolean;
    procedure CargarSeguimiento(aidCabecera: integer);
    procedure BuscarComponente(const Contenedor: TComponent; const ControlNombre :string);
    procedure ResetColorControl(Control: TControl);
    procedure CargarBusqueda;
    function get_calgulovigeniaFueraDeTermino(contrato : integer; fechadesde : TDateTime): String;
    procedure CargarRelevamientoWeb;
    procedure GuardarDatosAnexosWeb;

  public
    property ClickNuevo: boolean read FClickNuevo write FClickNuevo;

  end;

const
  LB_VALIDO_NO = 'NO';

var
  frmRelevamientosRiesgosLaborales: TfrmRelevamientosRiesgosLaborales;
  MSG_BAJA        : String = '¿ Desea dar de baja el registro seleccionado ?';

implementation

uses
  unDmPrincipal, ansiSql, VclExtra, CustomDlgs, unSesion, General, unEsperaSimple,
  unRelevTiposAnexos, unRelevGremialista, unRelevContratistas, unRelevResponsable,
  unRelevamientoCargaRapida, unContratoEstablecimiento, Math, unPrincipal,
  DateUtils, unExportPdf, unRptNotaDenuncia ;

const
  IMG_CATEGORIA  = 3;
  IMG_READONLY   = 4;
  FormAitem6     = 6;
  FormCitem5     = 397;
  FormCitem7     = 399;
  FormBitem10    = 171;
  MSG_SIG_ANEXOA = 'Siguiente : Planilla A de Cancerigenos';
  MSG_SIG_ANEXOB = 'Siguiente : Planilla B de Difenilos';
  MSG_SIG_ANEXOC = 'Siguiente : Planilla C de Acc. Mayores';
  MSG_SIG_GREMIALISTA = 'Siguiente : Gremialistas';
  MSG_SIG_CONTRATISTA = 'Siguiente : Contratistas';
  MSG_SIG_RESPONSABLE = 'Siguiente : Responsables';

{$R *.dfm}

{ajusta el color válido o no para establecimientos, label de SI o NO
si RESET => EsValido no necesario}
procedure TfrmRelevamientosRiesgosLaborales.AjustarColorValido(Reset: Boolean;
    EsValido: Boolean = False);
begin

  if Reset then begin
    ResetColorControl(fraEstableciBusq.edCodigo);
    ResetColorControl(fraEstableciBusq.cmbDescripcion);
  end else begin
    if EsValido then begin
      lbValidoSiNo.Caption := 'SI';
      lbValidoSiNo.Font.Color := clWindowText;
      lbValidoSiNo.Color := clBtnFace;
      fraEstableciBusq.edCodigo.Font.Color := clWindowText;
      fraEstableciBusq.edCodigo.Color := clWindow;
      fraEstableciBusq.cmbDescripcion.Font.Color := clWindowText;
      fraEstableciBusq.cmbDescripcion.Color := clWindow;
    end else begin
      lbValidoSiNo.Caption := 'NO';
      lbValidoSiNo.Font.Color := clMaroon;
      lbValidoSiNo.Color := clBtnFace;
      fraEstableciBusq.edCodigo.Font.Color := clMaroon;
      fraEstableciBusq.cmbDescripcion.Color := clWindow;
      fraEstableciBusq.cmbDescripcion.Font.Color := clMaroon;
      fraEstableciBusq.cmbDescripcion.Color := clWindow;
    end;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.FormCreate(Sender: TObject);
const
  pbColumnIndex = 2;
  pbMax = 100;
var
  i, idResolucion, idTitulo : integer;
  sSqlTitulo, sSqlItems : String;
  auxTabSheet:  TTabSheet;
  auxListView : TListView;
  li : TListItem;
begin
  inherited;
  FModificarSinRestriccion := false;
  FCargaInvalido := false;
  with fraEstablecimientoCopia do
  begin
    TableName   := 'afi.aes_establecimiento';
    FieldID     := 'es_ID';
    FieldCodigo := 'es_nroestableci';
    FieldDesc   := 'es_nombre';
    Showbajas   := False;
    IdType      := ctString;
    CodigoType  := ctString;
    FieldBaja   := 'es_fechabaja';
  end;
  FComponenteBuscado := nil;
  gbNavegador.Enabled := false;
  With fraEmpresa do
  begin
    OnChange   := OnEmpresaChange;
    ShowBajas  := True;
    ExtraFields := ExtraFields+', co_vigenciadesde, co_vigenciahasta, co_fechaafiliacion';
  end;
  fraEstableciBusq.ShowBajas := True;
  fraEstableciBusq.OnChange := OnEstableciBusqChange;
  for i:= tsAnexos.PageCount -1 downto 0 do
    tsAnexos.Pages[i].Free;
  i := 0;
  with GetQuery(
    ' SELECT ra_id, ra_titulo '+
    '   FROM hys.hra_resolucionanexo '+
    '  WHERE ra_fechabaja IS NULL')do
  try
    while not Eof do
    begin
      i := i + 1;
      idResolucion := fieldByName('ra_id').AsInteger;

      {
      Creo y configuro el tabsheet que se crea.
      Son todas las resoluciones.
      }
      auxTabSheet := TTabSheet.Create(tsAnexos);
      with auxTabSheet do
      begin
        Name := 'tabsheet_' + IntToStr(i);
        Parent := tsAnexos;
        PageControl := tsAnexos;
        Caption := fieldByName('ra_titulo').AsString;
        Tag := fieldByName('ra_id').AsInteger;
        PageIndex := tsAnexos.PageCount-1;
      end;

      {
      Creo y configuro el tabsheet que se crea.
      Son todas las resoluciones.
      }
      auxListView := TListView.Create(auxTabSheet);
      with auxListView do
      begin
        vclExtra.LockControls(auxListView, True);
        Name := 'listview_' + IntToStr(i);
        Align := alClient;
        with Columns.Add do
          Width := 50;
        with Columns.Add do
          AutoSize := true;

        TabStop := True;
        HideSelection := False;
        Color := clBtnFace;
        IconOptions.WrapText := False;
        ReadOnly := True;
        RowSelect := True;
        ShowColumnHeaders := False;
        SmallImages := ImageList;
        Parent := auxTabSheet;
        ViewStyle := vsReport;
        //OnClick := lvAnexo2Click;
        OnCustomDrawItem := lvAnexo2CustomDrawItem;
        OnKeyPress := lvAnexo2KeyPress;
        OnChange := lvAnexo2_AChange;
        OnDataFind := lvAnexo2_ADataFind;
      end;

      {
      Empìezo a cargar los item que van a adentro de las resoluciones
      }

      sSqlTitulo :=
        ' SELECT   ta_id, ta_idresolucionanexo, ta_nrotitulo, ta_descripcion '+
        '     FROM hys.hta_titulosanexo '+
        '    WHERE ta_idresolucionanexo = '+SqlValue(idResolucion)+
        '      AND ta_fechabaja IS NULL '+
        ' ORDER BY ta_nrotitulo ';

      with GetQuery(sSqlTitulo) do
      try
        while not Eof do
        begin
          With auxListView.Items.Add  do begin
            caption := FieldByName('ta_descripcion').AsString;
            ImageIndex := IMG_CATEGORIA;
          end;
          idTitulo := fieldByName('ta_id').AsInteger;
          sSqlItems :=
            '  SELECT   ia_id, ia_nrodescripcion, ia_descripcion, ia_normativa, ia_normativabis, ia_sololectura, ia_idtipoformanexo, ia_cargorepresentante '+
            '     FROM hys.hia_itemanexo a '+
            '    WHERE ia_idtituloanexo = '+ SqlValue(idTitulo)+
            '      AND ia_fechabaja IS NULL '+
            ' ORDER BY ia_nrodescripcion ';

          with GetQuery(sSqlItems) do
          try
            while not Eof do
            begin
              li := auxListView.Items.Add;
              li.Caption := FieldByName('ia_nrodescripcion').AsString;
              li.SubItems.Add( fieldByName('ia_descripcion').AsString);
              li.Data := TDatoAnexo.Create();
              TDatoAnexo(li.Data).NumeroItem := FieldByName('ia_id').AsInteger;
              if not FieldByName('ia_idtipoformanexo').IsNull then
                TDatoAnexo(li.Data).IdFormularioRequerido := FieldByName('ia_idtipoformanexo').AsInteger;
              if not FieldByName('ia_cargorepresentante').IsNull then
                TDatoAnexo(li.Data).CargoRepresentanteReq := FieldByName('ia_cargorepresentante').AsString;
              if FieldByName('IA_SOLOLECTURA').AsString = 'S' Then
                li.ImageIndex := IMG_READONLY
              else
                li.ImageIndex := -1;
              Next;
            end;
          finally
            Free;
          end;
          Next;
        end;
      finally
        free;
      end;
      Next;
    end;
  finally
    Free;
  end;

  with fraObservacion do
  begin
    TableName   := 'hys.hob_observacion';
    FieldID     := 'OB_ID';
    FieldCodigo := 'OB_ID';
    FieldDesc   := 'OB_DESCRIPCION';
    Showbajas   := true;
    IdType      := ctString;
    CodigoType  := ctString;
    FieldBaja   := 'ob_fechabaja';
    ExtraCondition := ' and OB_TIPOOPERACION in (''M'', ''B'') ';
  end;

  sdqObservaciones.ParamByName('idrelev').AsInteger := 0;
  sdqObservaciones.Open;
  sdqSeguimiento.ParamByName('idrelev').AsInteger := 0;
  sdqSeguimiento.ParamByName('iditem').AsInteger := 0;
  sdqSeguimiento.Open;
  btnLimpiarClick(nil);
  FieldBajaObservacion := 'ro_fechabaja';
  FieldManualObservacion := 'ob_tipooperacion';
  FieldValidaObservacion := 'ob_tipo';
  vclExtra.LockControls([edVigencia],True);
  BloquearResponsables(False);
  Sql := TDBSql.Create;
  Sql.TableName := 'HYS.hro_relevobservacion';
  tbSegAgregar.Enabled := False;
  tbSegQuitar.Enabled := False;
  tbSegOrdenar.Enabled := False;
  tbCopiaEmpleador.Enabled := False;
  tbCopiarFGRL.Enabled := False;
  tbTodoNo.Enabled := False;
  tbRecuperarDatosAnexo2.Enabled := False;
  ModoEmpleador := True;
  vclExtra.LockControls([edES_EMPLEADOS], True);
  cbSinPersonal.Enabled := False;
  cbSinDatos.Enabled := False;
  iResolucion := -1;
  FClickNuevo := false;
  tbSalir.Left := 900;
end;

procedure TfrmRelevamientosRiesgosLaborales.BloquearResponsables(habilitar : Boolean);
begin
  tbResponsable.Enabled := True;
  tbRelevContratistas.Enabled := True;
  tbGremialistas.Enabled := True;
  mnuAnexoCancerigenos.Enabled := True;
  mnuAnexoDifenilos.Enabled := True;
  mnuAnexoAccIndMayores.Enabled := True;
  tbNuevoObservacion.Enabled := habilitar;
  tbModificarObservacion.Enabled := habilitar;
  tbEliminarObservacion.Enabled := habilitar;
  dbgSeguimiento.Enabled := habilitar;
end;

procedure TfrmRelevamientosRiesgosLaborales.lvAnexo2CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
Var ARect : TRect;
begin
     if Item.ImageIndex = IMG_CATEGORIA Then begin
       ARect := Item.DisplayRect( drBounds );
       if Item.Selected Then
         Sender.Canvas.Brush.Color := clNavy
       else
         Sender.Canvas.Brush.Color := clBtnShadow;
       Sender.Canvas.Font.Color  := clWhite;
       Sender.Canvas.Font.Style  := [fsBold];
       Sender.Canvas.FillRect( ARect );
       Sender.Canvas.TextRect( ARect, ARect.Left + 2, ARect.Top + 2, Item.Caption );
       DefaultDraw := False;
     end else if Item.ImageIndex = IMG_READONLY Then
       Sender.Canvas.Font.Color  := clGray;
end;

procedure TfrmRelevamientosRiesgosLaborales.lvAnexo2Click(Sender: TObject);
begin
  if {Anexo2Enabled and} Assigned(Sender) and (Sender is TListView) then
    With Sender as TListView do
      if Assigned(Selected) and (not (Selected.ImageIndex in [IMG_READONLY, IMG_CATEGORIA])) then begin
        ChangeItemValue( Sender as TListView, Selected );
      end;
end;

procedure TfrmRelevamientosRiesgosLaborales.lvAnexo2KeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(Sender) and (Sender is TListView) then
    With Sender as TListView do
    begin
      if (Key in [#32, #13, #88, #86, #78, #120, #118, #110])
          and Assigned(Selected)
          and (not (Selected.ImageIndex in [IMG_READONLY, IMG_CATEGORIA]))
          and not (FModoABM in [mfNone])
          and not FCargaInvalido then
      begin
        If (Key in [#32, #13]) then
          ChangeItemValue( Sender as TListView, Selected )
        else if key in [#88, #120] then
          Selected.ImageIndex := 0
        else if key in [#86, #118] then
          Selected.ImageIndex := 1
        else if key in [#78, #110] then
          Selected.ImageIndex := 2;

        if iResolucion = -1 then
          iResolucion := tsAnexos.ActivePageIndex;
      end;
      if not(Key  in [#32,#13]) then
        key := #0;
    end;
end;

procedure TfrmRelevamientosRiesgosLaborales.ChangeItemValue(AListView : TListView; AItem: TListItem);
begin
  AItem.ImageIndex := AItem.ImageIndex + 1;
  if AItem.ImageIndex = IMG_CATEGORIA Then
    AItem.ImageIndex := -1;
  if iResolucion = -1 then
    iResolucion := tsAnexos.ActivePageIndex;
end;

procedure TfrmRelevamientosRiesgosLaborales.edObservacionDenExit(Sender: TObject);
var
  auxListView : TListView;
  iCantidadSaltos : Integer;
begin
  if not edObservacionDen.ReadOnly then
  begin
    auxListView := TListView(tsAnexos.Pages[tsAnexos.ActivePageIndex].FindChildControl('listview_'+IntToStr(tsAnexos.ActivePageIndex+1)));
    TDatoAnexo(auxListView.Items[auxListView.ItemIndex].Data).ObservacionDenuncia := edObservacionDen.Text;
  end;

  if (iResolucion <> -1) and (edObservacionDen.Text <> '') then
    iResolucion := tsAnexos.ActivePageIndex;

  if frmRelevamientosRiesgosLaborales.ActiveControl.Name = 'btnGuardar' then
  begin
    auxListView := TListView(tsAnexos.ActivePage.FindChildControl('listview_'+IntToStr(tsAnexos.ActivePageIndex+1)));
    if auxListView.Items[auxListView.ItemIndex + 1].Data <> nil then
      iCantidadSaltos := 1
    else
      iCantidadSaltos := 2;
    auxListView.Items[auxListView.ItemIndex + iCantidadSaltos].Focused := true;
    auxListView.SetFocus;
    auxListView.Items[auxListView.ItemIndex + iCantidadSaltos].Selected := true;

    if (auxListView.Selected.Position.Y > auxListView.Height - 30) then
      auxListView.Scroll(auxListView.Selected.Position.X, 40);
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.edObservacionDenKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if key = VK_TAB then
  begin
    if(TDateEdit(ListViewEx1.Selected.Data) <> TDateEdit(Form1.ActiveControl)) then
    begin

    end
    else begin
      if (Form1.ActiveControl is TDateEdit) and (Form1.ActiveControl.Name = 'Date_1') and (TDateEdit(ListViewEx1.Selected.Data) <> TDateEdit(Form1.ActiveControl)) then
      begin
        TDateEdit(ListViewEx1.Selected.Data).SetFocus;
    end;
    end;
  end;}
end;

procedure TfrmRelevamientosRiesgosLaborales.OnEmpresaChange(Sender: TObject);
begin
  fraEstableciBusq.CUIT := fraEmpresa.mskCUIT.Text ;
  OnEstableciBusqChange(Sender);
end;

procedure TfrmRelevamientosRiesgosLaborales.FormDestroy(Sender: TObject);
var
  i,j :integer;
  auxListView : TListView;
begin
  for i:= tsAnexos.PageCount -1 downto 0 do
  begin
    auxListView := TListView(tsAnexos.Pages[i].FindChildControl('listview_'+IntToStr(i+1)));
    for j := auxListView.Items.Count-1 downto 0 do
      if Assigned(auxListView.Items[j].Data) then
        TDatoAnexo(auxListView.Items[j].Data).Free;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.CargarBusqueda;
var
  sSql : String;
begin
  BorrarCampos;
  edCiuu.Clear;
  chkObservaciones.UncheckAll;
  if not fraEstableciBusq.IsSelected then Exit;
  tbAprobarCargaFinal.Enabled := true;
  edCPA.Text := fraEstableciBusq.CPostalA;
  edCiuu.Text := ValorSql('select substr(art.hys.get_codactividadrevdos(ac_id, ac_revision),1,6) from comunes.cac_actividad where ac_codigo = ' + SqlValue(fraEstableciBusq.Actividad));

  sSql := ' SELECT   rl_id '+
    '     FROM hys.hrl_relevriesgolaboral '+
    '    WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
    '      AND rl_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
    '      AND rl_fechabaja IS NULL ';
  if ModoEmpleador then
    sSql := sSql + ' AND rl_procedencia = ''E'' '
  else
    sSql := sSql + ' AND rl_procedencia = ''P'' ';

  sSql := sSql + ' ORDER BY rl_vigencia DESC, rl_id DESC ';

  sdqConsultaCabecera.SQL.Text := sSql;

  sdqConsultaCabecera.Open;
  sdqConsultaCabecera.First;
  CargarDatosResolucion(sdqConsultaCabecera.fieldbyname('rl_id').AsInteger);
end;

procedure TfrmRelevamientosRiesgosLaborales.OnEstableciBusqChange(Sender : TObject);
var
  sSql : String;
  idrelev : Integer;
begin
  sSql :=
    ' SELECT rl_id '+
    '   FROM hys.hrl_relevriesgolaboral hrl '+
    '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
    '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
    '    AND rl_vigencia = (SELECT MAX(rl_vigencia) '+
    '                         FROM hys.hrl_relevriesgolaboral a '+
    '                        WHERE a.rl_contrato = hrl.rl_contrato '+
    '                          AND a.rl_estableci = hrl.rl_estableci '+
    '                          AND a.rl_fechabaja IS NULL '+
    '                          AND a.rl_procedencia = ''E'') '+
    '    AND rl_fechabaja IS NULL '+
    '    AND rl_procedencia = ''P'' ';
  idrelev := ValorSqlInteger(sSql);
  //La logica es al revees porq despues se usa el cambio modoclick para q deje todo bien
  ModoEmpleador := idrelev <> 0;
  tbCambioModoClick(nil);
//  CargarBusqueda;
end;


procedure TfrmRelevamientosRiesgosLaborales.tbLimpiarClick(
  Sender: TObject);
begin
  inherited;
  if not fraEstableciBusq.IsEmpty then
    fraEstableciBusq.Limpiar(false)
  else begin
    fraEstableciBusq.Limpiar(true);
    fraEmpresa.Clear;
  end;
  edCiuu.Clear;
  btnSiguiente.Visible := False;
  lbSiguienteForm.Visible := False;
  BorrarCampos;
  AjustarColorValido(True);
  gbNavegador.Enabled := False;
  FOrigenFormulario := '';
  fraEstableciBusq.edCodigo.SetFocus;
  FIdSolicitud := 0;;
  FVersion := 0;
  chkObservaciones.UncheckAll;
end;

procedure TfrmRelevamientosRiesgosLaborales.BorrarCampos;
var
  i,j :integer;
  auxListView : TListView;
begin
  iResolucion := -1;
  lblEstadoDefinitivo.Tag := 0;
  FCantRelevValidos := -1;
  FCantRelevInvalido := 0;
  for i:= tsAnexos.PageCount -1 downto 0 do
  begin
    auxListView := TListView(tsAnexos.Pages[i].FindChildControl('listview_'+IntToStr(i+1)));
    for j := auxListView.Items.Count-1 downto 0 do
      if not (auxListView.Items[j].ImageIndex in [IMG_READONLY, IMG_CATEGORIA]) then
      begin
        auxListView.Items[j].ImageIndex := -1;
        TDatoAnexo(auxListView.Items[j].Data).FechaRegularizacion := 0;
        TDatoAnexo(auxListView.Items[j].Data).FechaVerificacion := 0;
        TDatoAnexo(auxListView.Items[j].Data).ObservacionDenuncia := '';
      end;
  end;
  AjustarColorValido(True);
  edFechaRecepcion.Clear;
  edFechaFormulario.Clear;
  edES_EMPLEADOS.Clear;
  cbSinPersonal.Checked := False;
  cbSinDatos.Checked := False;
  edVigencia.Clear;
  edFechaRegul.Clear;
  edFechaVerificacion.Clear;
  edObservacionDen.Clear;
  CargarEstado(fraEmpresa.Contrato, edVigencia.Text);
  sdqObservaciones.ParamByName('idrelev').AsInteger := 0;
  sdqObservaciones.Close;
  sdqObservaciones.Open;
  sdqObservaciones.Refresh;
  FOrigenFormulario := '';
  FVersion := 0;
  lblOrigen.Caption := 'Origen: -';
  lblVersion.Caption := 'Versión: -';
  chkObservaciones.UncheckAll;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbNuevoClick(Sender: TObject);
var
  i :integer;
  auxListView : TListView;
begin
  if ExisteSql('SELECT 1 '+
                      '  FROM art.pao_avisoobra '+
                      ' WHERE ao_cuit = '+SqlValue(fraEmpresa.CUIT)+
                      '   AND ao_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
                      '   AND AO_FECHABAJA IS NULL '+
                      '   AND MONTHS_BETWEEN(ao_fechafindeobra, ao_fechainicio) >= 12') then
    InvalidMsg(tbNuevo,'Tiene un aviso de obra mayor a 1 año cargado, solo va a poder cargar un formulario tipo B.','Informacion')
  else
    Verificar(ExisteSql('SELECT 1 '+
                      '  FROM art.pao_avisoobra '+
                      ' WHERE ao_cuit = '+SqlValue(fraEmpresa.CUIT)+
                      '   AND ao_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
                      '   AND AO_FECHABAJA IS NULL '+
                      '   AND MONTHS_BETWEEN(ao_fechafindeobra, ao_fechainicio) < 12'),tbNuevo,'No puede cargarse un RGRL tiene un aviso de obra menor a 1 año cargado.');
  FCargaInvalido := false;
  ModoFueraDeTermino := True;
  vclExtra.LockControls([edVigencia],false);
  tbCopiaEmpleador.Enabled := False;
  if FFechaActual = 0 then
  begin
    edFechaRecepcion.Clear;
    edFechaFormulario.Clear;
  end
  else
  begin
    edFechaRecepcion.Date := FFechaActual;
  end;

  FfechaVisitaVerificacion := ValorSqlDateTime(
            ' SELECT max(rv_fecha) '+
            '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
            '  WHERE rv_id = vm_idvisita '+
            '    AND rv_cuit = '+SqlValue(fraEmpresa.CUIT)+
            '    AND rv_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
            '    AND rv_fecha >= art.actualdate - 365 '+
            '    AND vm_idmotivo in (63) ' +
            '    AND vm_fechabaja IS NULL '+
            '    AND rv_fechabaja IS NULL ');

  EntrarContrato;

  DesbloquearContrato;
  if not (FModoABM = mfAlta) then
  begin
    for i:= tsAnexos.PageCount -1 downto 0 do
    begin
      auxListView := TListView(tsAnexos.Pages[i].FindChildControl('listview_'+IntToStr(i+1)));
      auxListView.Items[1].Selected := True;
      auxListView.Scroll(auxListView.Items[1].Position.X,auxListView.Items[1].Position.Y);
    end;
    iResolucion := -1;
  end;
  if ModoEmpleador then
  begin
    with GetQuery(
      ' SELECT es_empleados, es_sinpersonal, es_sindatos '+
      '   FROM afi.aes_establecimiento '+
      '  WHERE es_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND es_nroestableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)) do
    try
      edES_EMPLEADOS.Text := FieldByName('es_empleados').AsString;
      cbSinPersonal.Checked := FieldByName('es_sinpersonal').AsString = 'S';
      cbSinDatos.Checked := FieldByName('es_sindatos').AsString = 'S';
    finally
      Free;
    end;
    CargarRelevamientoWeb;
  end
  else
  begin
    with GetQuery(
      ' SELECT rl_cantempleados, rl_sinpersonal, rl_sindatos '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
      '    AND rl_procedencia = ''E'' ' ) do
    try
      edES_EMPLEADOS.Text := FieldByName('rl_cantempleados').AsString;
      cbSinPersonal.Checked := FieldByName('rl_sinpersonal').AsString = 'S';
      cbSinDatos.Checked := FieldByName('rl_sindatos').AsString = 'S';
    finally
      Free;
    end;
  end;

  FModoABM := mfAlta;
  edFechaRecepcion.SetFocus;
  tbCopiarFGRL.Enabled := True;
  tbTodoNo.Enabled := True;
  tbRecuperarDatosAnexo2.Enabled := True;
  tbCambioModo.Enabled := False;
  btnGuardar.Enabled := False;
end;



procedure TfrmRelevamientosRiesgosLaborales.EntrarContrato;
begin
  Verificar(not fraEmpresa.IsSelected, fraEmpresa,'Debe Seleccionar la Empresa.');
  Verificar(not fraEstableciBusq.IsSelected, fraEstableciBusq, 'Debe seleccionar el establecimiento.');
end;

procedure TfrmRelevamientosRiesgosLaborales.DesbloquearContrato;
begin
  vclExtra.LockControls([fraEmpresa, fraEstableciBusq], True);
  vclExtra.LockControls([edFechaFormulario,edFechaRecepcion,btnGuardar, btnLimpiar, tsAnexos], False);
  tbNuevoObservacionMultiple.Enabled := true;
  if ModoEmpleador then
  begin
    vclExtra.LockControls([edES_EMPLEADOS], False);
    cbSinPersonal.Enabled := True;
    cbSinDatos.Enabled := True;
  end;
  tbLimpiar.Enabled := false;
  FComponenteBuscado := nil;
  BuscarComponente(self, 'listview_' + IntToStr(tsAnexos.ActivePageIndex+1));
  if FComponenteBuscado is TListView then
  begin
    (FComponenteBuscado as TListView).ItemIndex := 1;
    (FComponenteBuscado as TControl).Parent.SetFocus;
    (FComponenteBuscado as TListView).SetFocus;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbModificarClick(
  Sender: TObject);
var
  sSql : String;
  sWhere : String;
begin
  btnGuardar.Enabled := True;
  vclExtra.LockControls([edVigencia],True);
  tbCopiaEmpleador.Enabled := False;
  EntrarContrato;
  sWhere :=
      '    AND rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
      '    AND rl_fechabaja IS NULL';
  if ModoEmpleador then
    sWhere := sWhere + '    AND rl_procedencia = ''E'' '
  else
    sWhere := sWhere + '    AND rl_procedencia = ''P'' ';

  sSql :=
      ' SELECT RL_FUERADETERMINO '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE 1 = 1 '+sWhere;

  FfechaVisitaVerificacion := ValorSqlDateTime(
            ' SELECT max(rv_fecha) '+
            '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
            '  WHERE rv_id = vm_idvisita '+
            '    AND rv_cuit = '+SqlValue(fraEmpresa.CUIT)+
            '    AND rv_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
            '    AND rv_fecha >= art.actualdate - 365 '+
            '    AND vm_idmotivo in (63) ' +
            '    AND vm_fechabaja IS NULL '+
            '    AND rv_fechabaja IS NULL ');

  Verificar(not ExisteSql(sSql),tsAnexos,'No existe un relevamiento para este contrato Establecimiento.');
  ModoFueraDeTermino := ValorSql(sSql) = 'S';
  DesbloquearContrato;
  sSql := 'select 1 from hys.hrl_relevriesgolaboral where 1= 1 '+sWhere+ 'and rl_fechaexport is not null ';
  vclExtra.LockControls([edFechaFormulario, edFechaRecepcion],ExisteSql(sSql));
  BloquearResponsables(True);
  gbNavegador.Enabled := True;
  FModoABM := mfModif;
  tbCambioModo.Enabled := False;
  tbTodoNo.Enabled := True;
  tbRecuperarDatosAnexo2.Enabled := True;
  edFechaRecepcion.SetFocus;
end;

procedure TfrmRelevamientosRiesgosLaborales.CargarDatosResolucion(aidCabecera: integer);
var
  i, x, y : Integer;
  idItemAnexo : Integer;
  auxListView : TListView;
begin

  FidResolucionAnexo := ValorSqlInteger(
    ' SELECT rl_idresolucionanexo '+
    ' FROM hys.hrl_relevriesgolaboral '+
    ' WHERE rl_id =  '+SqlValue(aidCabecera));

(*
  FidResolucionAnexo := ValorSqlInteger(
    ' SELECT DISTINCT ta_idresolucionanexo '+
    '            FROM hys.hta_titulosanexo, '+
    '                 hys.hia_itemanexo, '+
    '                 hys.hil_itemsriesgolaboral '+
    '           WHERE il_idrelevriesgolaboral =  '+SqlValue(aidCabecera)+
    '             AND ia_id = il_iditemanexo '+
    '             AND ta_id = ia_idtituloanexo');
*)

  if ModoEmpleador then
    edProcedencia.Caption := 'Empleador  '
  else
    edProcedencia.Caption := 'Preventor  ';
  if FidResolucionAnexo <> 0 then
  begin
    with GetQuery(
      ' SELECT * '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_id = '+SqlValue(aidCabecera) ) do
    try
      iCabecera := FieldByName('RL_ID').AsInteger;
      edFechaRecepcion.Date := FieldByName('RL_FECHARECEPCION').AsDateTime;
      edFechaFormulario.Date := FieldByName('RL_FECHAFORMULARIO').AsDateTime;
      FFechaActual := edFechaRecepcion.Date;
      FCargaInvalido := FieldByName('RL_CARGAINVALIDO').AsString = 'S';
      if ModoEmpleador then
      begin
        edES_EMPLEADOS.Text := FieldByName('rl_cantempleados').AsString;
        cbSinPersonal.Checked := FieldByName('rl_sinpersonal').AsString = 'S';
        cbSinDatos.Checked := FieldByName('rl_sindatos').AsString = 'S';
      end;
      AjustarColorValido(
          False,
          iif(FieldByName('RL_VALIDO').AsString = 'S', True, False)
      );
      edVigencia.Text := FieldByName('RL_VIGENCIA').AsString;
      if FieldByName('rl_origen').AsString = 'W' then
      begin
        lblOrigen.Caption := 'Origen: WEB';
        lblVersion.Caption := 'Versión: - ';
      end;
    finally
      Free;
    end;

    if not ModoEmpleador then
    begin
      with GetQuery(
        ' SELECT * '+
        '   FROM hys.hrl_relevriesgolaboral '+
        '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato) +
        '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
        '    AND rl_vigencia = '+ SqlValue(edVigencia.Text)+
        '    AND rl_procedencia = ''E'' ') do
      try
        edES_EMPLEADOS.Text := FieldByName('rl_cantempleados').AsString;
        cbSinPersonal.Checked := FieldByName('rl_sinpersonal').AsString = 'S';
        cbSinDatos.Checked := FieldByName('rl_sindatos').AsString = 'S';
      finally
        Free;
      end;
    end;


    for i := 0 to tsAnexos.PageCount-1 do
    begin
      if tsAnexos.Pages[i].Tag = FidResolucionAnexo then
        iResolucion := i;
    end;
    tsAnexos.ActivePageIndex := iResolucion;
    sdqlistaitems.SQL.Text :=
      '   SELECT * '+
      '     FROM hys.hil_itemsriesgolaboral, hys.hia_itemanexo '+
      '    WHERE il_idrelevriesgolaboral = '+SqlValue(aidCabecera)+
      '      and ia_id =  IL_IDITEMANEXO '+
      ' ORDER BY ia_nrodescripcion ';
    sdqlistaitems.Open;
    sdqlistaitems.First;
    auxListView := TListView(tsAnexos.Pages[iResolucion].FindChildControl('listview_'+IntToStr(iResolucion+1)));

    x := 0;
    while not sdqlistaitems.Eof do
    begin
      idItemAnexo := sdqlistaitems.fieldbyname('IL_IDITEMANEXO').AsInteger;
      y := x;
      while  y <= auxListView.Items.Count-1  do
      begin
        if Assigned(auxListView.Items[y].Data) then
          if (TDatoAnexo(auxListView.Items[y].Data).NumeroItem = idItemAnexo) and not(auxListView.Items[y].ImageIndex in [IMG_READONLY, IMG_CATEGORIA] )then
          begin
            x := y;
            auxListView.Items[y].ImageIndex := strtoint(decode( sdqlistaitems.fieldbyname('IL_CUMPLIMIENTO').AsString, ['','S','N','X'],['-1','0','1','2']));
            TDatoAnexo(auxListView.Items[y].Data).FechaRegularizacion := sdqlistaitems.fieldbyname('IL_FECHAREGULARIZACION').AsDateTime;
            TDatoAnexo(auxListView.Items[y].Data).FechaVerificacion := sdqlistaitems.fieldbyname('IL_FECHAVERIFICACION').AsDateTime;
            TDatoAnexo(auxListView.Items[y].Data).ObservacionDenuncia := sdqlistaitems.fieldbyname('IL_OBSERVACIONDENUNCIA').AsString;
            y := auxListView.Items.Count;
          end;
          y:= y + 1;
      end;
      sdqlistaitems.Next;
    end;
    sdqlistaitems.Close;
    CargarObservaciones(aidCabecera);
    CargarSeguimiento(aidCabecera);
    gbNavegador.Enabled := True;
//    if (edFechaFormulario.Date <> 0) and (edFechaFormulario.Date < fraEmpresa.sdqDatos.FieldByName('co_vigenciadesde').AsDateTime) then
//      InvalidMsg(edFechaFormulario, 'La fecha de formulario es anterior a la vigencia del contrato por tal motivo se informará la segunda a la SRT.');
  end else begin
    iCabecera := -1;
    AjustarColorValido(True);
  end;

end;

procedure TfrmRelevamientosRiesgosLaborales.lvAnexo2_AChange(
  Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  if (Sender is TListView) and tsAnexos.Enabled then
  begin
    if (item.ImageIndex in [IMG_READONLY, IMG_CATEGORIA]) then
    begin
      vclextra.LockControls([edFechaRegul, edFechaVerificacion, edObservacionDen],True);
      if iCabecera > 0 then
      begin
        tbSegAgregar.Enabled := False;
        tbSegQuitar.Enabled := False;
        tbSegOrdenar.Enabled := False;
      end;
      edFechaRegul.Date := 0;
      edFechaVerificacion.Date := 0;
      edObservacionDen.Text := '';
      sdqSeguimiento.ParamByName('iditem').AsInteger := 0;
      sdqSeguimiento.Refresh
    end
    else
    begin
      if Assigned(item.Data) then
      begin
        edFechaRegul.Date := TDatoAnexo(item.Data).FechaRegularizacion;
        edFechaVerificacion.Date := TDatoAnexo(item.Data).FechaVerificacion;
        edObservacionDen.Text := TDatoAnexo(item.Data).ObservacionDenuncia;
        if (iCabecera > 0) and (FModoABM = mfModif) then
        begin
          tbSegAgregar.Enabled := True;
          tbSegQuitar.Enabled := True;
          tbSegOrdenar.Enabled := True;
        end;
        vclextra.LockControls(
            [edFechaRegul, edFechaVerificacion, edObservacionDen],
            iif(FModoABM = mfNone, True, False)
        );
        sdqSeguimiento.ParamByName('iditem').AsInteger := TDatoAnexo(item.Data).NumeroItem;
        sdqSeguimiento.Refresh;
      end;
    end;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tsAnexosChange(
  Sender: TObject);
var
  auxListView : TListView;
begin
  if iResolucion > -1 Then
  begin
   tsAnexos.ActivePageIndex := iResolucion;
   InvalidMsg(tsAnexos, 'Ya se cargó Resolución.');
  end
  else
  begin
    if (tsAnexos.ActivePageIndex = 1) and
       not ExisteSql(
          ' SELECT 1 '+
          '    FROM afi.aes_establecimiento '+
          '   WHERE es_eventual = ''S'' '+
          '     AND es_contrato = '+SqlValue(fraEmpresa.Contrato)+
          '     AND es_nroestableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)) then
    begin
      tsAnexos.ActivePageIndex := 0;
      InvalidMsg(tsAnexos, 'El establecimiento debe ser eventual.');
    end
    else
    begin
      auxListView := TListView(tsAnexos.Pages[tsAnexos.ActivePageIndex].FindChildControl('listview_'+IntToStr(tsAnexos.ActivePageIndex+1)));
      auxListView.Items[1].Focused := true;
      auxListView.SetFocus;
      auxListView.Items[1].Selected := true;
    end
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.edFechaRegulExit(
  Sender: TObject);
var
  auxListView : TListView;
begin
  if not edFechaRegul.ReadOnly then
  begin
    if edFechaVerificacion.Date <> 0 then
      Verificar(edFechaVerificacion.Date < edFechaRegul.Date,edFechaVerificacion,'La fecha de Verificacion debe ser mayor o igual a la de Regularización');
    Verificar((edFechaRegul.Date <> 0) and (edFechaRegul.Date < edFechaFormulario.Date),edFechaRegul, 'La fecha de regulación debe ser mayor a la fecha de Formulario.' );
    if not ModoEmpleador and not FModificarSinRestriccion then
      Verificar((edFechaRegul.Date <> 0) and (edFechaRegul.Date > (FfechaVisitaVerificacion+365)),edFechaRegul, 'La fecha de regulación debe ser menor a la fecha de visita mas 1 año.' );
    auxListView := TListView(tsAnexos.Pages[tsAnexos.ActivePageIndex].FindChildControl('listview_'+IntToStr(tsAnexos.ActivePageIndex+1)));
    TDatoAnexo(auxListView.Items[auxListView.ItemIndex].Data).FechaRegularizacion := edFechaRegul.Date;
  end;
  if (iResolucion <> -1) and (edFechaRegul.Date <> 0) then
    iResolucion := tsAnexos.ActivePageIndex;
end;

procedure TfrmRelevamientosRiesgosLaborales.edFechaVerificacionExit(
  Sender: TObject);
var
  auxListView : TListView;
begin
  if not edFechaVerificacion.ReadOnly then
  begin
    if edFechaVerificacion.Date <> 0 then
      Verificar(edFechaVerificacion.Date < edFechaRegul.Date,edFechaVerificacion,'La fecha de Verificación dee ser mayor o igual a la de Regularización');
    if ModoEmpleador then
      Verificar((edFechaVerificacion.Date <> 0) and (edFechaVerificacion.Date < (fraEmpresa.sdqDatos.FieldByName('co_vigenciadesde').AsDateTime)),edFechaVerificacion, 'La fecha de verificación debe ser mayor a la vigencia desde del contrato.' )
    else
      if not FModificarSinRestriccion then
        Verificar((edFechaVerificacion.Date <> 0) and (edFechaVerificacion.Date > (FfechaVisitaVerificacion+365)),edFechaVerificacion, 'La fecha de verificación debe ser menor a la fecha de visita mas 1 año.' );
    auxListView := TListView(tsAnexos.Pages[tsAnexos.ActivePageIndex].FindChildControl('listview_'+IntToStr(tsAnexos.ActivePageIndex+1)));
    TDatoAnexo(auxListView.Items[auxListView.ItemIndex].Data).FechaVerificacion := edFechaVerificacion.Date;
  end;
  if (iResolucion <> -1) and (edFechaVerificacion.Date <> 0) then
    iResolucion := tsAnexos.ActivePageIndex;

end;

procedure TfrmRelevamientosRiesgosLaborales.btnGuardarClick(
  Sender: TObject);
var
  j, idcabecera, cantNo :Integer;
  iditemrelev : Integer;
  cumplimiento, itemsNo : String;
  auxListView : TListView;
  fecharegul : TDate;
  fechaverif : TDate;
  fechaContratoHasta : TDate;

  diasResta : Integer;
  observacion : String;
  GeneraObs : String;
  sSql : String;
  fueradeTermino : String;
  procedencia : String;
  requiereRelev : String;
  sinPersonal : String;
  sinDatos : String;
begin
  if not Validar then Exit;

  //Si no selecciono ningun item tomo la activa
  if iResolucion = -1 then
    iResolucion := tsAnexos.ActivePageIndex;

  FidResolucionAnexo := iResolucion + 1;
  cantNo := 0;
  requiereRelev := ValorSql('SELECT art.hys.get_requiererelev463 ('+ SqlValue(fraEmpresa.Contrato)+
                            ', '+SqlValue(fraEstableciBusq.edCodigo.Text)+') FROM dual ');
  BeginTrans(True);
  try
    auxListView := TListView(tsAnexos.Pages[iResolucion].FindChildControl('listview_'+IntToStr(iResolucion+1)));
    sSql :=
      ' UPDATE hys.hrl_relevriesgolaboral '+
      '    SET rl_requiererelev =  '+ SqlValue(requiereRelev)+
      '  WHERE rl_contrato = '+ SqlValue(fraEmpresa.Contrato)+
      '    AND rl_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text);
    if ModoEmpleador then
    begin
      sSql := sSql + ' AND rl_procedencia = ''E'' ';
      procedencia := 'E';
    end
    else
    begin
      sSql := sSql + ' AND rl_procedencia = ''P'' ';
      procedencia := 'P';
    end;

    EjecutarSqlST(sSql);
    if ModoFueraDeTermino then
      fueradeTermino := 'S'
    else
      fueradeTermino := 'N';

    if FModoABM = mfAlta then
    begin
      if not FCargaInvalido then
      begin
        btnSiguiente.Visible := True;
        lbSiguienteForm.Visible := True;
        lbSiguienteForm.Caption := MSG_SIG_ANEXOA;
      end;

      idCabecera := GetSecNextVal('HYS.SEQ_HRL_RELEV_ID');
      iCabecera := idCabecera;
      if ModoFueraDeTermino then
        fueradeTermino := 'S'
      else
        fueradeTermino := 'N';
      EjecutarSqlST(
        '  INSERT INTO hys.hrl_relevriesgolaboral '+
        '              (rl_id, rl_contrato, rl_estableci, rl_fecharecepcion, rl_valido, '+
        '               rl_vigencia, rl_usualta, rl_fechaalta, rl_idresolucionanexo, rl_procedencia, '+
        '               rl_fueradetermino, rl_fechaformulario, rl_origen, rl_cargainvalido '+
        '              ) '+
        '       VALUES ( '+SqlValue(idCabecera)+','+SqlValue(fraEmpresa.Contrato)+','+
        SqlValue(fraEstableciBusq.edCodigo.Text)+','+SqlValue(edFechaRecepcion.Date)+',''S'','+
        SqlValue(edVigencia.Text)+','+SqlValue(Sesion.UserID)+',SYSDATE,' + SqlInteger(FidResolucionAnexo)+
        ','+SqlValue(procedencia)+','+SqlValue(fueradeTermino)+','+SqlValue(edFechaFormulario.Date)+','+SqlValue(FOrigenFormulario)+
        ','+SqlValue(FCargaInvalido)+ ')');
    end
    else
    begin
      idCabecera := iCabecera;
      EjecutarSqlST(
        ' UPDATE hys.hrl_relevriesgolaboral '+
        '    SET rl_fecharecepcion = '+SqlValue(edFechaRecepcion.Date)+','+
        '        rl_fechaformulario = '+SqlValue(edFechaFormulario.Date)+','+
        '        rl_usumodif = '+SqlValue(Sesion.UserID)+','+
        '        rl_fueradetermino = '+Sqlvalue(fueradetermino)+','+
        '        rl_cargainvalido = ' +Sqlvalue(FCargaInvalido)+','+
        '        rl_fechamodif = SYSDATE '+
        '  WHERE rl_id = '+ SqlValue(idCabecera)
        )
    end;
    if cbSinPersonal.Checked then
      sinPersonal := 'S'
    else
      sinPersonal := 'N';

    if cbSinDatos.Checked then
      sinDatos := 'S'
    else
      sinDatos := 'N';

    EjecutarSqlST(
      ' UPDATE hys.hrl_relevriesgolaboral '+
      '    SET rl_cantempleados = '+SqlValue(edES_EMPLEADOS.Text)+','+
      '        rl_sinpersonal = '+SqlValue(sinPersonal)+','+
      '        rl_sindatos = '+SqlValue(sinDatos)+
      '  WHERE rl_id = '+SqlValue(idCabecera));

    if not FCargaInvalido then //Carga no Invalido
    begin
      for j := 0 to auxListView.Items.Count-1 do
        if not (auxListView.Items[j].ImageIndex in [IMG_READONLY, IMG_CATEGORIA]) then
        begin
          iditemrelev := TDatoAnexo(auxListView.Items[j].Data).NumeroItem;
          cumplimiento := decode( IntToStr(auxListView.Items[j].ImageIndex), ['0','1', '2'],['S','N','X']);
          fecharegul := TDatoAnexo(auxListView.Items[j].Data).FechaRegularizacion;
          fechaverif := TDatoAnexo(auxListView.Items[j].Data).FechaVerificacion;
          observacion := TDatoAnexo(auxListView.Items[j].Data).ObservacionDenuncia;

          if (fecharegul = 0) and (cumplimiento = 'N' )and
             ((iditemrelev = FormAitem6) or (iditemrelev = FormCitem5) or
              (iditemrelev = FormCitem7) or (iditemrelev = FormBitem10)) then
          begin
            fechaContratoHasta := ValorSqlDateTime(
              ' SELECT co_vigenciahasta '+
              '   FROM afi.aco_contrato '+
              '  WHERE co_contrato = '+ SqlValue(fraEmpresa.Contrato));
            diasResta := 0;
            if (fechaContratoHasta - DBDate) <= 60 then
            begin
              fechaContratoHasta := IncYear(fechaContratoHasta);
            end;
            if (iditemrelev = FormAitem6) or
               (iditemrelev = FormCitem5) then
            begin
              diasResta := 30;
            end;

            if (iditemrelev = FormCitem7) or
               (iditemrelev = FormBitem10) then
            begin
              diasResta := 90;
            end;
            fecharegul := fechaContratoHasta - diasResta;
          end;

          if (fecharegul <> 0) and(fecharegul < edFechaFormulario.Date) then
            raise Exception.Create('El item '+auxListView.Items[j].Caption+ ' tiene fecha de regularización menor al formulario.');

          if  (not ModoEmpleador) and (cumplimiento = 'N' ) and (fecharegul = 0) and (TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido = 0) then
            raise Exception.Create('El item '+auxListView.Items[j].Caption+ ' no tiene fecha de regularización.');

          if  (not ModoEmpleador) and (cumplimiento = 'N' ) and (fechaverif = 0) and (TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido = 0) then
            raise Exception.Create('El item '+auxListView.Items[j].Caption+ ' no tiene fecha de verificación.');

          if cumplimiento = 'N' then
          begin
            if cantNo <> 0 then
              itemsNo := itemsNo+#13#10+auxListView.Items[j].Caption
            else
              itemsNo := #13#10+ auxListView.Items[j].Caption;
            cantNo := cantNo + 1;
          end;

          if (cumplimiento = 'N') and not ModoEmpleador and not FModificarSinRestriccion then
          begin
            DenunciaIncumplimiento(iditemrelev,FfechaVisitaVerificacion,fraEmpresa.CUIT, fraEmpresa.Contrato, fraEstableciBusq.edCodigo.Value);
          end;

          if FModoABM = mfAlta then
          begin
            EjecutarSqlST(
              ' INSERT INTO hys.hil_itemsriesgolaboral '+
              '             (il_id, il_idrelevriesgolaboral, il_iditemanexo, il_cumplimiento, '+
              '              il_fecharegularizacion, il_fechaverificacion, '+
              '              il_observaciondenuncia, il_fechaalta, il_usualta '+
              '             ) '+
              '      VALUES ('+SqlValue(GetSecNextVal('HYS.SEQ_HIL_ID'))+','+SqlValue(idcabecera)+','+
                    SqlValue(iditemrelev)+','+SqlValue(cumplimiento)+','+ SqlDate(fecharegul)+','+
                    SqlDate(fechaverif)+','+SqlValue(observacion)+',SYSDATE,'+
                    SqlValue(Sesion.UserID)+')');
          end
          else
          begin
            EjecutarSqlST(
              ' UPDATE hys.hil_itemsriesgolaboral '+
              '    SET il_cumplimiento = '+SqlValue(cumplimiento)+','+
              '        il_fecharegularizacion = '+SqlDate(fecharegul)+','+
              '        il_fechaverificacion = '+SqlDate(fechaverif)+','+
              '        il_observaciondenuncia = '+SqlValue(observacion)+','+
              '        il_usumodif = '+SqlValue(Sesion.UserID)+','+
              '        il_fechamodif = SYSDATE '+
              '  WHERE il_idrelevriesgolaboral = '+ SqlValue(idCabecera)+
              '    AND il_iditemanexo = '+SqlValue(iditemrelev));
          end;

          if (TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido = 1) then
          begin
            if (cumplimiento = 'S') then
              Cancerigeno := 'S'
            else
              Cancerigeno := 'N';
            EjecutarSqlST(
              ' UPDATE HYS.HEP_ESTABPORPREVENTOR '+
              '    SET EP_CANCERIGENOS ='+SqlValue(Cancerigeno)+
              '  WHERE EP_CUIT = '+SqlValue(fraEmpresa.CUIT)+
              '    AND EP_ESTABLECI = '+SqlValue(fraEstableciBusq.edCodigo.Text));

          end;

          if (TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido = 2) then
          begin
            if (cumplimiento = 'S') then
              Difenilos := 'S'
            else
              Difenilos := 'N';

            EjecutarSqlST(
              ' UPDATE HYS.HEP_ESTABPORPREVENTOR '+
              '    SET EP_DIFENILOS ='+SqlValue(Difenilos)+
              '  WHERE EP_CUIT = '+SqlValue(fraEmpresa.CUIT)+
              '    AND EP_ESTABLECI = '+SqlValue(fraEstableciBusq.edCodigo.Text));
          end;

          if (TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido = 3) then
          begin
            if (cumplimiento = 'S') then
              AccMayores := 'S'
            else
              AccMayores := 'N';
            EjecutarSqlST(
              ' UPDATE HYS.HEP_ESTABPORPREVENTOR '+
              '    SET EP_ACCMAYORES ='+SqlValue(AccMayores)+
              '  WHERE EP_CUIT = '+SqlValue(fraEmpresa.CUIT)+
              '    AND EP_ESTABLECI = '+SqlValue(fraEstableciBusq.edCodigo.Text));
          end;
          if ModoEmpleador then
          begin
            if (cumplimiento = '') then GeneraObs := 'S' else GeneraObs := 'N';
            ProcesarObservacion(idCabecera, OBSERVACION_PUNTO_NO_CONTESTADO, 'P', 'Item: ' + auxListView.Items[j].Caption, 'S', GeneraObs, iditemrelev);

            if ((cumplimiento = 'N') and (fecharegul = 0)) and (TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido = 0) then GeneraObs := 'S' else GeneraObs := 'N';
            ProcesarObservacion(idCabecera, OBSERVACION_PUNTO_SIN_FECHA_REGULARIZACION, 'P', 'Item: ' + auxListView.Items[j].Caption, 'S', GeneraObs, iditemrelev);

            if TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido <> 0 then
              ProcesarObservacionFormulario(idcabecera, TDatoAnexo(auxListView.Items[j].Data).IdFormularioRequerido, FidResolucionAnexo);
          end;
        end;
    end;//Fin Carga no Invalido

    if ModoEmpleador then
    begin
      if not FCargaInvalido then
      begin
        GuardarDatosAnexosWeb;
        ProcesarObservacionResponsable(idcabecera, FidResolucionAnexo, FOrigenFormulario);
        if FIdSolicitud <> 0 then
          EjecutarSqlSTEx(' UPDATE hys.hsf_solicitudfgrl ' +
                          '   SET sf_fechapasaje = SYSDATE, ' +
                          '       sf_usupasaje = ' +  SqlValue(Sesion.UserID) +
                          ' WHERE sf_fechapasaje IS NULL AND sf_id = :idsolicitud', [FIdSolicitud]);

      end;
      ProcesarObseravacionEstab(idcabecera,fraEmpresa.Contrato,fraEstableciBusq.edCodigo.Value);
      //Las observaciones deben ser cargadas antes del llamado de esta funcion que es la que actualizar la hrl.
      ProcesarValidezRelev(idcabecera, false);
      EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga, NULL, NULL);', [fraEmpresa.Contrato, edVigencia.Text, 'R']);
    end;

    if FCargaInvalido then
      for j:=0 to chkObservaciones.CheckCount-1 do
        ObservacionesDoABM(StrToInt(chkObservaciones.CheckedValues[j]), edObsLibreMultiple.Text);

    CommitTrans(True);
    CargarDatosResolucion(idCabecera);
    BloquearResponsables(True);
    if (FModoABM = mfAlta) then
    begin
      FModoABM := mfModif;
      if not FCargaInvalido then
        MsgBox('La cantidad de items en NO son:'+IntToStr(cantNo)+' Y los item son:'+itemsNo , MB_ICONINFORMATION, 'Cantidades de NO');
    end;

  except
    on E: Exception do
    begin
      Rollback(True);
      ErrorMsg(E, 'Error al guardar relevamientos. ' + #13#10 + E.Message );
    end;
  end;
  if not edVigencia.ReadOnly then
    vclExtra.LockControls([edVigencia],True);
  tbCopiarFGRL.Enabled := False;
  tbTodoNo.Enabled := False;
  tbRecuperarDatosAnexo2.Enabled := False;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnNavPrimeroClick(
  Sender: TObject);
begin
  sdqConsultaCabecera.Last;
  CargarDatosResolucion(sdqConsultaCabecera.fieldbyname('rl_id').AsInteger);
end;

procedure TfrmRelevamientosRiesgosLaborales.btnNavAnteriorClick(
  Sender: TObject);
begin
  MoverRegistro(1);
end;

procedure TfrmRelevamientosRiesgosLaborales.btnNavUltimoClick(
  Sender: TObject);
begin
  sdqConsultaCabecera.First;
  CargarDatosResolucion(sdqConsultaCabecera.fieldbyname('rl_id').AsInteger);
end;

procedure TfrmRelevamientosRiesgosLaborales.MoverRegistro(adireccion: integer);
begin
  if not sdqConsultaCabecera.IsEmpty then
  begin
    if ((adireccion = -1) and not sdqConsultaCabecera.Eof) or
       ((adireccion =  1) and not sdqConsultaCabecera.Bof) or
       (adireccion = 0) then
      sdqConsultaCabecera.MoveBy(adireccion);
  end;
  CargarDatosResolucion(sdqConsultaCabecera.fieldbyname('rl_id').AsInteger);
end;

procedure TfrmRelevamientosRiesgosLaborales.btnNavSiguienteClick(
  Sender: TObject);
begin
  MoverRegistro(-1);
end;

procedure TfrmRelevamientosRiesgosLaborales.mnuAnexoCancerigenosClick(
  Sender: TObject);
begin
  inherited;
  mnuAnexos(Sender, FORMULARIO_TIPO_A, Self.mnuAnexoCancerigenos.Caption);
end;

procedure TfrmRelevamientosRiesgosLaborales.mnuAnexoDifenilosClick(
  Sender: TObject);
begin
  inherited;
  mnuAnexos(Sender, FORMULARIO_TIPO_B, Self.mnuAnexoDifenilos.Caption);
end;

procedure TfrmRelevamientosRiesgosLaborales.mnuAnexoAccIndMayoresClick(
  Sender: TObject);
begin
  inherited;
  mnuAnexos(Sender, FORMULARIO_TIPO_C, Self.mnuAnexoAccIndMayores.Caption);
end;

procedure TfrmRelevamientosRiesgosLaborales.mnuAnexos(Sender: TObject;
    TipoFormulario: Byte; MenuCaption: String);
begin
  with TfrmRelevTiposAnexos.Create(self) do
  try
    ModoABM := FModoABM;
    FModoEmpleador := ModoEmpleador;
    Cargar(fraEmpresa.Contrato, edVigencia.Text, TipoFormulario, FidResolucionAnexo, iCabecera);
    Caption := StringReplace(MenuCaption, '&', '', [rfReplaceAll]);
    if (((TipoFormulario = FORMULARIO_TIPO_A) and (Cancerigeno = 'N')) or
       ((TipoFormulario = FORMULARIO_TIPO_B) and (Difenilos = 'N'))   or
       ((TipoFormulario = FORMULARIO_TIPO_C) and (AccMayores = 'N'))) and
       btnSiguiente.Visible and ModoEmpleador and (FOrigenFormulario <> 'W')
    then
    begin
      tbTodosNoClick(nil);
      btnGuardarClick(nil);
    end
    else
      ShowModal;
  finally
    free;
    CargarObservaciones(iCabecera);
    CargarSeguimiento(iCabecera);
  end;
end;

function TfrmRelevamientosRiesgosLaborales.Validar: boolean;
begin
  if (edFechaFormulario.Date <> 0) and (edFechaFormulario.Date < IncDay(fraEmpresa.sdqDatos.FieldByName('co_fechaafiliacion').AsDateTime, -45)) then
  begin
    edFechaFormulario.Date := IncDay(fraEmpresa.sdqDatos.FieldByName('co_fechaafiliacion').AsDateTime, -45);
    InvalidMsg(edFechaFormulario, 'La fecha del formulario puede ser hasta 45 días antes de la fecha de suscripción, por ser anterior se modificará.', 'Cambio en Fecha de Notificación' , MB_ICONINFORMATION);
  end;

  Verificar(ExisteSql('SELECT 1 '+
                      '  FROM art.pao_avisoobra '+
                      ' WHERE ao_cuit = '+SqlValue(fraEmpresa.CUIT)+
                      '   AND ao_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
                      '   AND AO_FECHABAJA IS NULL '+
                      '   AND MONTHS_BETWEEN(ao_fechafindeobra, ao_fechainicio) < 12') and (FidResolucionAnexo <> 2),
            edFechaRecepcion,'No puede cargarse un RGRL que no sea tipo B y no tenga un aviso de obra mayor a 1 año cargado.');
  if not FModificarSinRestriccion then
  begin
    Verificar(edFechaRecepcion.Date = 0, edFechaRecepcion, 'Debe seleccionar la fecha de recepción.');
    Verificar(edFechaRecepcion.Date > DBDate, edFechaRecepcion, 'La fecha de recepción debe ser menor o igual al día de hoy.' );
    Verificar(edFechaFormulario.Date = 0 , edFechaFormulario, 'Debe seleccionar la fecha de Formulario.');
    Verificar(edFechaFormulario.Date > DBDate, edFechaFormulario, 'La fecha de Formulario debe ser menor o igual al día de hoy.' );
    Verificar(edFechaFormulario.Date > edFechaRecepcion.Date, edFechaFormulario, 'La fecha de Formulario debe ser menor o igual a la fecha de recepción.' );
  end;
  if FModoABM = mfAlta then
  Verificar(edFechaRecepcion.Date < ValorSql(
      'SELECT ADD_MONTHS(art.actualdate,-11) FROM dual'), edFechaRecepcion,'La Fecha no puede ser menor a 1 año');
  if ModoEmpleador then
  begin
    Verificar(((edES_EMPLEADOS.Value = 0) or edES_EMPLEADOS.IsEmpty ) and (not cbSinPersonal.Checked and not cbSinDatos.Checked),
              cbSinPersonal,'Debe indicar sin personal o sin datos.');
    Verificar((edES_EMPLEADOS.Value <> 0) and (cbSinPersonal.Checked or cbSinDatos.Checked),
              cbSinPersonal,'No puede tener empleados y ser sin personal o sin datos.');
  end
  else begin
    if not FModificarSinRestriccion then
      Verificar(not ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
        '  WHERE rv_id = vm_idvisita '+
        '    AND rv_cuit = '+SqlValue(fraEmpresa.CUIT)+
        '    AND rv_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
        '    AND rv_fecha >= art.actualdate - 365 '+
        '    AND vm_idmotivo in (63) '+
        '    AND vm_fechabaja IS NULL '+
        '    AND rv_fechabaja IS NULL '),tsAnexos,'Debe Existir Visita con Motivo "RES 463/2009 - Evaluación de verosimilitud"' );
  end;
  if ModoFueraDeTermino then
  begin
    Verificar(edVigencia.Text = '', edVigencia,'Debe Ingresar Vigencia');
  end;

  if FCargaInvalido then
  begin
    Verificar((chkObservaciones.CheckCount = 0) and
               not ExisteSqlEx('SELECT 1 FROM hys.hro_relevobservacion WHERE ro_fechabaja IS NULL AND ro_idrelevriesgolaboral = :id', [iCabecera]),
               dbgObservaciones, 'Si el formulario es inválido debe cargar una observación');
 end;
  result := true;
end;

procedure TfrmRelevamientosRiesgosLaborales.CargarObservaciones(
  aidCabecera: integer);
begin
  sdqObservaciones.ParamByName('idrelev').AsInteger := aidCabecera;
  sdqObservaciones.Refresh;
  AjustarColorValido(
      (FidResolucionAnexo = 0),
      iif(
          ValorSqlEx(
            'SELECT DECODE(rl_valido, ''S'', ''SI'', ''N'', ''NO'') ' +
            'FROM hys.hrl_relevriesgolaboral WHERE rl_id = :id',
            [aidCabecera]
          ) = 'SI', True, False
      )
  );

  CargarEstado(fraEmpresa.Contrato, edVigencia.Text);
end;

procedure TfrmRelevamientosRiesgosLaborales.CargarSeguimiento(
  aidCabecera: integer);
begin
  sdqSeguimiento.ParamByName('idrelev').AsInteger := aidCabecera;
  sdqSeguimiento.Refresh;
end;


procedure TfrmRelevamientosRiesgosLaborales.tbGremialistasClick(
  Sender: TObject);
begin
  with TfrmRelevGremialista.Create(self) do
  try
    Cargar(iCabecera);
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbRelevContratistasClick(
  Sender: TObject);
begin
  with TfrmRelevContratista.Create(self) do
  try
    Cargar(iCabecera);
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbResponsableClick(
  Sender: TObject);
begin
  with TfrmRelevResponsable.Create(self) do
  try
    FModoEmpleador := ModoEmpleador;
    Cargar(iCabecera, FidResolucionAnexo);
    Contrato := fraEmpresa.Contrato;
    Vigencia := edVigencia.Text;
    OrigenFormulario := self.FOrigenFormulario;
    ShowModal;
  finally
    Free;
    CargarObservaciones(IDCabecera);
    CargarSeguimiento(IDCabecera);
  end;
end;


procedure TfrmRelevamientosRiesgosLaborales.btnLimpiarClick(
  Sender: TObject);
begin
  inherited;
  FOrigenFormulario := '';
  FVersion := 0;
  vclExtra.LockControls([fraEmpresa, fraEstableciBusq],False);
  vclExtra.LockControls([btnGuardar, btnLimpiar], True);
  vclExtra.LockControls([edFechaFormulario, edFechaRecepcion, edFechaRegul, edFechaVerificacion,
                         edObservacionDen,edVigencia],True);
  tbNuevoObservacionMultiple.Enabled := false;

  vclExtra.LockControls([edES_EMPLEADOS], True);
  cbSinPersonal.Enabled := False;
  cbSinDatos.Enabled := False;
  tbSegAgregar.Enabled := False;
  tbSegQuitar.Enabled := False;
  tbSegOrdenar.Enabled := False;
  tbLimpiar.Enabled := true;
  BloquearResponsables(False);
  CargarBusqueda;
  btnSiguiente.Visible := False;
  tbCambioModo.Enabled := True;
  FModoABM := mfNone;
  tbCopiaEmpleador.Enabled := not ModoEmpleador;
  tbCopiarFGRL.Enabled := False;
  tbTodoNo.Enabled := False;
  tbRecuperarDatosAnexo2.Enabled := False;
  FModificarSinRestriccion := False;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbAprobarCargaFinalClick(
  Sender: TObject);
var
  bPermiteAprobar: boolean;
begin
  inherited;
  bPermiteAprobar := true;
  with GetQueryEx(' SELECT cr_cantestablecimientos, cr_cantrelevamientos, cr_cumplimiento ' +
                  ' FROM hys.hcr_cumplimientorelev ' +
                  ' WHERE cr_id = art.hys.get_idcumplimientorelev(:contrato, :vigencia, :tipocarga, sysdate)', [fraEmpresa.Contrato, edVigencia.Text, 'E']) do
  try
    if not Eof then
    begin
      if (FCantRelevValidos <> -1) and (fieldbyname('cr_cantrelevamientos').AsInteger <> (FCantRelevValidos+ FCantRelevInvalido)) then
      begin
        MsgBox('La cantidad de relevamientos cargados difieren de lo estimado. Una observación le será requerida.', MB_ICONINFORMATION, 'Aprobación');
        bPermiteAprobar := fpObservaciones.ShowModal = mrOk;
      end;
    end;
  finally
    Free;
  end;

  if bPermiteAprobar then
  begin
    try
      IniciarEspera;
      if lblEstadoDefinitivo.Tag = -1 then
        try
          if do_GenerarPlanilla(fraEmpresa.Contrato, edVigencia.Text) then
            CargarEstado(fraEmpresa.Contrato, edVigencia.Text);
        except
          on E: exception do begin
           ErrorMsg( E );
          end;
        end;
    finally
      DetenerEspera;
    end;
    if ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hrl_relevriesgolaboral a, hys.hob_observacion, hys.hro_relevobservacion, '+
      '        afi.aes_establecimiento, afi.aco_contrato, afi.aem_empresa '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_id = ro_idrelevriesgolaboral '+
      '    AND ro_idobservacion = ob_id '+
      '    AND ob_fechabaja IS NULL '+
      '    AND ro_fechabaja IS NULL '+
      '    AND rl_fechabaja IS NULL '+
      '    AND rl_cargainvalido = ''S'' '+
      '    AND es_contrato = rl_contrato '+
      '    AND es_nroestableci = rl_estableci '+
      '    AND rl_contrato = co_contrato '+
      '    AND co_idempresa = em_id ') then
    begin
      BeginTrans(True);
      try
        if ExisteSql(' SELECT 1 FROM hys.hne_notasdenunciaenvio '+
                     '  WHERE ne_contrato = '+ SqlValue(fraEmpresa.Contrato)+
                     '    AND ne_idtipodenuncia = 1 '+
                     '    AND ne_fechaenvio IS NULL ') then
          EjecutarSqlST(' UPDATE hys.hne_notasdenunciaenvio '+
                      '    SET ne_fechamodif = sysdate, '+
                      '        ne_usumodif = '+SqlValue(Sesion.UserID)+
                      '   WHERE ne_contrato = '+ SqlValue(fraEmpresa.Contrato)+
                      '    AND ne_idtipodenuncia = 1 '+
                      '    AND ne_fechaenvio IS NULL ')
        else
          EjecutarSqlST('INSERT INTO hys.hne_notasdenunciaenvio (ne_id, ne_contrato, ne_fechaalta, ne_usualta, ne_idtipodenuncia) '+
                        '     VALUES (hys.seq_hne_id.NEXTVAL, '+SqlValue(fraEmpresa.Contrato)+', SYSDATE, '+
                        SqlValue(Sesion.UserID)+',1)');

        with TrptNotaDenuncia.Create(Self) do
        try
          Load(fraEmpresa.Contrato);
        finally
          Free;
        end;
        CommitTrans(True);
      finally
        Rollback(True);
      end;
    end;

  end
  else
    MsgBox('La carga definitiva no fue aprobada.', MB_ICONINFORMATION, 'Aprobación');
end;

procedure TfrmRelevamientosRiesgosLaborales.fraEstableciBusqExit(
  Sender: TObject);
begin
  inherited;
  fraEstableciBusq.FrameExit(Sender);
  if fraEstableciBusq.IsEmpty then BorrarCampos;
  AjustarColorValido(
      (FidResolucionAnexo = 0),
      iif(
          ValorSqlEx(
            'SELECT DECODE(rl_valido, ''S'', ''SI'', ''N'', ''NO'') ' +
            'FROM hys.hrl_relevriesgolaboral WHERE rl_id = :id',
            [iCabecera]
          ) = 'SI', 1, 0
      )
  );
end;

procedure TfrmRelevamientosRiesgosLaborales.CargarEstado(aContrato: integer; aVigencia: String);
var
  aAprobAnt: Integer;
begin
  with GetQueryEx(' SELECT cr_cantestablecimientos, cr_cantrelevamientos, cr_cumplimiento, cr_fechaautorizacion, cr_usuautorizacion, ' +
                  '        cr_cantrelevinval, decode(cr_estado, ''A'', ''Aprobado'', ''P'', ''Cargando...'') estado ' +
                  ' FROM hys.hcr_cumplimientorelev hcr ' +
                  ' WHERE  cr_contrato = :contrato ' +
                  '   AND  cr_vigencia = (SELECT MAX(a.cr_vigencia) '+
                  '                         FROM hys.hcr_cumplimientorelev a '+
                  '                        WHERE hcr.cr_contrato = a.cr_contrato) AND ' +
                  '        cr_tipocarga = ''R'' AND ' +
                  '       (cr_vigenciadesde <= SYSDATE OR cr_vigenciadesde IS NULL)  AND ' +
                  '       (cr_vigenciahasta > SYSDATE  OR cr_vigenciahasta IS NULL) ' +
                  ' ORDER BY CR_ID desc', [aContrato]) do
  try
    if not Eof then
    begin
      aAprobAnt := lblEstadoDefinitivo.Tag;
      lblCargaDefinitiva.Caption :=  'Carga Definitiva:';
      lblEstadoDefinitivo.Caption := 'Estado: ' + fieldbyname('estado').AsString;
      lblEstadoDefinitivo.Tag := iif(fieldbyname('cr_fechaautorizacion').IsNull, -1, 1);
      lblRelevValidosDefinitiva.Caption := 'Relev. Válidos: ' + fieldbyname('cr_cantrelevamientos').AsString;
      FCantRelevValidos := fieldbyname('cr_cantrelevamientos').AsInteger;
      FCantRelevInvalido := fieldbyname('cr_cantrelevinval').AsInteger;
      lblRelevInvalidosDefinitiva.Caption := 'Relev. Inválidos: ' + fieldbyname('cr_cantrelevinval').AsString;
      lblCantEstabDefinitiva.Caption := 'Cant.Estab: ' + fieldbyname('cr_cantestablecimientos').AsString;
      lblCumplimientoDefinitivo.Caption := 'Cumplimiento: ' + fieldbyname('cr_cumplimiento').AsString;
      lblUsuarioAprob.Caption := 'Usuario Aprob: ' + fieldbyname('cr_usuautorizacion').AsString;
      if fieldbyname('cr_fechaautorizacion').IsNull then
        lblFechaAprobacion.Caption := 'Fecha Aprobación: '
      else
        lblFechaAprobacion.Caption := 'Fecha Aprobación: ' + FormatDateTime('dd/mm/yyyy  hh:nn:ss', fieldbyname('cr_fechaautorizacion').AsDateTime);
      if (aAprobAnt = 1) and (lblEstadoDefinitivo.Tag = -1) then
        InvalidHint(lblEstadoDefinitivo, 'Su modificación cambió el estado de Aprobado a Cargando.')
      else if (aAprobAnt <> 0) and (aAprobAnt <> 1) and (lblEstadoDefinitivo.Tag = 1) then
        InfoHint(lblEstadoDefinitivo, 'La carga ha sido aprobada con éxito.');
    end
    else begin
      lblCargaDefinitiva.Caption := 'Carga Definitiva:';
      lblEstadoDefinitivo.Caption := 'Estado: ';
      lblEstadoDefinitivo.Tag := 0;
      FCantRelevValidos := -1;
      FCantRelevInvalido := 0;
      lblRelevValidosDefinitiva.Caption := 'Relev. Válidos: ';
      lblRelevInvalidosDefinitiva.Caption := 'Relev. Inválidos: ';
      lblCantEstabDefinitiva.Caption := 'Cant.Estab: ';
      lblCumplimientoDefinitivo.Caption := 'Cumplimiento: ';
      lblUsuarioAprob.Caption := 'Usuario Aprob: ';
      lblFechaAprobacion.Caption := 'Fecha Aprobación: ';
    end;
  finally
    Free;
  end;

end;

procedure TfrmRelevamientosRiesgosLaborales.tbNuevoObservacionClick(
  Sender: TObject);
begin
  ModoABMObservacion := mfAlta;
  ClearControlsObservacion;
  fpObservaciones.ShowModal;
end;

procedure TfrmRelevamientosRiesgosLaborales.ClearControlsObservacion;
begin
  fraObservacion.Clear;
  edObservacionLibre.Clear;
end;

procedure TfrmRelevamientosRiesgosLaborales.LoadControlsObservaciones;
begin
  fraObservacion.Codigo := sdqObservaciones.fieldByName('ro_idobservacion').AsString;
  edObservacionLibre.Text := sdqObservaciones.fieldByName('RO_INFOEXTRA').AsString;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbModificarObservacionClick(
  Sender: TObject);
begin
  Verificar(not IsManualObservacion, dbgObservaciones,'Debe ser una observacion manual.');
  if sdqObservaciones.Active and (not sdqObservaciones.IsEmpty) and IsManualObservacion then
  begin
    ModoABMObservacion := mfModif;
    LoadControlsObservaciones;
    fpObservaciones.ShowModal;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbEliminarObservacionClick(
  Sender: TObject);
begin
  Verificar(not IsManualObservacion, dbgObservaciones,'Debe ser una observacion manual.');
  if sdqObservaciones.Active and IsManualObservacion and (not sdqObservaciones.IsEmpty) and (MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    ModoABMObservacion := mfBaja;
    ObservacionesDoABM(fraObservacion.Value, edObservacionLibre.Text);
    if sdqObservaciones.Active then
    begin
    	sdqObservaciones.Refresh;
    end;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.ObservacionesABM;
begin
  Validar;
  ObservacionesDoABM(fraObservacion.Value, edObservacionLibre.Text);
 	if sdqObservaciones.Active then
  begin
  	sdqObservaciones.Refresh;
  end;
  fpObservaciones.ModalResult := mrOk;
end;

procedure TfrmRelevamientosRiesgosLaborales.ObservacionesDoABM(aIdObservacion: integer; aTextoLibre: String);
var
  iIdCodigo : Integer;
begin
  if (ModoABMObservacion <> mfBaja) and not ExisteSqlEx('SELECT 1 FROM hys.hro_relevobservacion WHERE ro_idrelevriesgolaboral = :id AND ro_idobservacion = :idobs', [iCabecera, aIdObservacion]) then
    ModoABMObservacion := mfAlta;

  BeginTrans(True);
  try
    Sql.Clear;
    if ModoABMObservacion = mfBaja Then
    begin
      iIdCodigo:=sdqObservaciones.FieldByName('RO_ID').AsInteger;
      Sql.Fields.Add('RO_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('RO_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('RO_IDOBSERVACION', aIdObservacion);
      Sql.Fields.Add('RO_INFOEXTRA', aTextoLibre);
      Sql.Fields.Add('RO_ESTADO', 'A');
      if ModoABMObservacion = mfAlta Then
      begin
        Sql.SqlType := stInsert;
        iIdCodigo := GetSecNextVal('HYS.SEQ_HRO_ID');
        Sql.Fields.Add('RO_IDRELEVRIESGOLABORAL', iCabecera);
        Sql.Fields.Add('RO_USUALTA', Sesion.UserID );
        Sql.Fields.Add('RO_FECHAALTA', exDateTime );
      end else begin
        Sql.SqlType := stUpdate;
        iIdCodigo := sdqObservaciones.FieldByName('RO_ID').AsInteger;
        Sql.Fields.Add('RO_USUMODIF', Sesion.UserID);
        Sql.Fields.Add('RO_FECHAMODIF', exDateTime );
        Sql.Fields.Add('RO_USUBAJA', exNull );
        Sql.Fields.Add('RO_FECHABAJA', exNull );
      end;
    end;

    Sql.PrimaryKey.Add('RO_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    ProcesarValidezRelev(iCabecera, false);
    CommitTrans(True);
  except
    Rollback(True);
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnAceptarObservacionClick(
  Sender: TObject);
begin
  ObservacionesABM;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbCargaRapidaClick(
  Sender: TObject);
begin
  inherited;
  if not fraEmpresa.IsEmpty then
  begin
    with TfrmRelevamientoCargaRapida.Create(self) do
    try
      fraEmpresa.Contrato := self.fraEmpresa.Contrato;
      CargarRelevamientos(self.fraEmpresa.Contrato);
      fraEmpresaChange(nil);
      fraEmpresa.Locked := true;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.dbgObservacionesGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;
  if IsManualObservacion then
    Background := clSkyBlue
  else
    Background := clWhite;

  if IsValidaObservacion then
    AFont.Color := clGreen
  else
    AFont.Color := clMaroon;

  if IsBajaObservaciones then
    AFont.Color := clRed;
end;

function TfrmRelevamientosRiesgosLaborales.IsBajaObservaciones: Boolean;
begin
  Result := (FieldBajaObservacion <> '') and sdqObservaciones.Active and
            (not sdqObservaciones.FieldByName(FieldBajaObservacion).IsNull);
end;

function TfrmRelevamientosRiesgosLaborales.IsManualObservacion : Boolean;
begin
  Result := (FieldManualObservacion <> '') and sdqObservaciones.Active and
            ((sdqObservaciones.FieldByName(FieldManualObservacion).AsString = 'M')
              or ((sdqObservaciones.FieldByName(FieldManualObservacion).AsString = 'B') and FCargaInvalido));
end;

function TfrmRelevamientosRiesgosLaborales.IsValidaObservacion : Boolean;
begin
  Result := (FieldValidaObservacion <> '') and sdqObservaciones.Active and
            (sdqObservaciones.FieldByName(FieldValidaObservacion).AsString = 'V');
end;


procedure TfrmRelevamientosRiesgosLaborales.tbEstablecimientoClick(
  Sender: TObject);
begin
  with TfrmContratoEstablecimiento.Create(Self) do
  try
    Visible := false;
    SetAutoCommit(false);
    DoCargarDatos(fraEmpresa.Contrato);
    sdqDatos.First;
    if fraEstableciBusq.IsSelected then
      while not sdqDatos.Eof and (sdqDatos.FieldByName('es_nroestableci').AsString <> fraEstableciBusq.edCodigo.Text) do
        sdqDatos.Next;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbSegAgregarClick(
  Sender: TObject);
begin
  if fpSeguimiento.ShowModal = mrOk then
    sdqSeguimiento.Refresh;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnVisAceptarClick(
  Sender: TObject);
var
  iItem : Integer;
  auxListView : TListView;
  IdVisita : Integer;
begin
  Verificar(cmbSegTipo.ItemIndex = -1, cmbSegTipo, 'Debe Ingresar el Cumplimiento.');
  Verificar(edSegFecha.Date = 0, edSegFecha, 'Debe Ingresar la fecha de Seguimiento.');


  IdVisita := ValorSqlInteger('SELECT rv_id FROM art.prv_resvisitas ' +
                               ' WHERE rv_cuit = ' + SqlValue(fraEmpresa.CUIT) +
                               '   AND rv_estableci = ' + SqlValue(fraEstableciBusq.edCodigo.Text) +
                               '   AND rv_fecha = ' + SqlDate (edSegFecha.Date)+
                               '   AND rv_fechabaja IS NULL ');

  if IdVisita = 0 then
  begin
    InvalidMsg(edSegFecha, 'No existe una visita para la fecha indicada.');
    abort;
  end;

  auxListView := TListView(tsAnexos.Pages[iResolucion].FindChildControl('listview_'+IntToStr(iResolucion+1)));
  iItem := TDatoAnexo(auxListView.Items[auxListView.ItemIndex].Data).NumeroItem;

  Verificar(ExisteSql(
    'SELECT 1 ' +
    '  FROM hys.hrt_relevseguimiento ' +
    ' WHERE rt_fechabaja IS NULL ' +
    '   AND rt_idrelevriesgolaboral = ' + SqlValue(iCabecera)+
    '   AND rt_iditem = ' +sqlvalue(iItem)+
    '   AND rt_fechaseguimiento = '+SqlValue(edSegFecha.Date) ),edSegFecha, 'Ya existe seguimiento para esa fecha.');

  if (cmbSegTipo.Value = 'N') and not ModoEmpleador then
  begin
    DenunciaIncumplimiento(iItem,edSegFecha.Date,fraEmpresa.CUIT, fraEmpresa.Contrato, fraEstableciBusq.edCodigo.Value);
  end;

  EjecutarSql(
    ' INSERT INTO hys.hrt_relevseguimiento '+
    '             (rt_id, rt_idrelevriesgolaboral, rt_iditem, rt_fechaseguimiento, '+
    '              rt_cumple, rt_usualta, rt_fechaalta '+
    '             ) '+
    '      VALUES (hys.seq_hrt_relev_id.nextval, '+SqlValue(iCabecera)+','+
     SqlValue(iItem)+','+ SqlValue(edSegFecha.Date)+','+SqlValue(cmbSegTipo.Value)+','+
      SqlValue(Sesion.UserID)+', SYSDATE )');
  fpSeguimiento.ModalResult := mrOk;
end;

procedure TfrmRelevamientosRiesgosLaborales.lvAnexo2_ADataFind(
  Sender: TObject; Find: TItemFind; const FindString: String;
  const FindPosition: TPoint; FindData: Pointer; StartIndex: Integer;
  Direction: TSearchDirection; Wrap: Boolean; var Index: Integer);
begin
  inherited;
  //null;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnSiguienteClick(
  Sender: TObject);
begin
  if lbSiguienteForm.Caption = MSG_SIG_ANEXOA then
  begin
    mnuAnexoCancerigenosClick(nil);
    lbSiguienteForm.Caption := MSG_SIG_ANEXOB;
    If (Cancerigeno = 'N') then
      btnSiguienteClick(nil);
  end
  else if lbSiguienteForm.Caption = MSG_SIG_ANEXOB then
  begin
    mnuAnexoDifenilosClick(nil);
    lbSiguienteForm.Caption := MSG_SIG_ANEXOC;
    If (Difenilos = 'N') then
      btnSiguienteClick(nil);
  end
  else if lbSiguienteForm.Caption = MSG_SIG_ANEXOC then
  begin
    mnuAnexoAccIndMayoresClick(nil);
    lbSiguienteForm.Caption := MSG_SIG_GREMIALISTA;
    If (AccMayores = 'N') then
      btnSiguienteClick(nil);
  end
  else if lbSiguienteForm.Caption = MSG_SIG_GREMIALISTA then
  begin
    lbSiguienteForm.Caption := MSG_SIG_CONTRATISTA;
    if ModoEmpleador then
      tbGremialistasClick(nil)
    else
      btnSiguienteClick(nil);
  end
  else if lbSiguienteForm.Caption = MSG_SIG_CONTRATISTA then
  begin
    lbSiguienteForm.Caption := MSG_SIG_RESPONSABLE;
    if ModoEmpleador then
      tbRelevContratistasClick(nil)
    else
      btnSiguienteClick(nil);
  end
  else if lbSiguienteForm.Caption = MSG_SIG_RESPONSABLE then
  begin
    tbResponsableClick(nil);
    btnSiguiente.Visible := False;
    lbSiguienteForm.Visible := False;
    lbSiguienteForm.Caption := '';
  end
end;

procedure TfrmRelevamientosRiesgosLaborales.edFechaRecepcionExit(Sender:
    TObject);
begin
  inherited;
//  error := false;
  btnGuardar.Enabled := False;

  {if not ModoFueraDeTermino then
  begin
    if (edFechaRecepcion.Date <> 0) then
    begin
      sSql := 'SELECT to_char(art.hys.get_vigenciaactual463( '+SqlValue(fraEmpresa.Contrato)+', '+
                                SqlDate(edFechaRecepcion.Date)+'),''YYYY'') FROM DUAL';

      strVigencia := ValorSql(sSql);
      if strVigencia = '' then
      begin
        error := True;
        InvalidMsg(edFechaRecepcion, 'La fecha no esta dentro del rango.');
      end
      else
      begin
        if not ModoEmpleador then
        begin
          if not ExisteSql(
            ' SELECT 1 '+
            '   FROM hys.hrl_relevriesgolaboral '+
            '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
            '    AND rl_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
            '    AND rl_vigencia = '+SqlValue(strVigencia)+
            '    AND rl_procedencia = ''E'' '+
            '    AND rl_fechabaja IS NULL') then
          begin
            error := True;
            InvalidMsg(tsAnexos,'Debe Existir Anexo procedente del empleador.');
          end;
          sSql :=
            ' SELECT rl_valido '+
            '   FROM hys.hrl_relevriesgolaboral '+
            '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
            '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
            '    AND rl_vigencia = '+SqlValue(strVigencia)+
            '    AND rl_fechabaja IS NULL'+
            '    AND rl_procedencia = ''E'' ';
          if ValorSql(sSql)= 'N' then
          begin
            InvalidMsg(tbCopiaEmpleador, 'Debe ser valido el Relevamiento del empleador ');
          end;
          if not ExisteSql(
            ' SELECT DISTINCT 1 '+
            '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
            '  WHERE rv_id = vm_idvisita '+
            '    AND rv_cuit = '+SqlValue(fraEmpresa.CUIT)+
            '    AND rv_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
            '    AND rv_fecha >= art.actualdate - 365 '+
            '    AND vm_idmotivo in (63, 64) '+
            '    AND vm_fechabaja IS NULL '+
            '    AND rv_fechabaja IS NULL ') then
          begin
            error := True;
            InvalidMsg(tsAnexos,'Debe Existir Visita con Motivo "RES 463/2009 - Evaluación de verosimilitud" o "Verificación".' );
          end;
        end;
      end;
      if FModoABM = mfAlta then
      begin
        sSql :=
          ' SELECT 1 '+
          '   FROM hys.hrl_relevriesgolaboral '+
          '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
          '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
          '    AND rl_vigencia = '+SqlValue(strVigencia)+
          '    AND rl_fechabaja IS NULL';
        if ModoEmpleador then
          sSql := sSql + ' AND rl_procedencia = ''E'' '
        else
          sSql := sSql + ' AND rl_procedencia = ''P'' ';

        if ExisteSql(sSql) then
        begin
          error := True;
          InvalidMsg(tsAnexos,'Ya existe un relevamiento para esta vigencia.');
        end;
      end;
      if not error then
      begin
        edVigencia.Text := strVigencia;
        FFechaActual := edFechaRecepcion.Date;
        btnGuardar.Enabled := True;
      end
      else
        btnLimpiar.SetFocus();
    end;
  end;
  }
  if {ModoFueraDeTermino and} edVigencia.ReadOnly then
    btnGuardar.Enabled := True
  else {if ModoFueraDeTermino then}
  begin
    if FModoABM = mfAlta then
      edVigencia.Text := get_calgulovigeniaFueraDeTermino(fraEmpresa.Contrato,edFechaRecepcion.Date);
    edVigenciaExit(nil);
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.BuscarComponente(const Contenedor:
    TComponent; const ControlNombre: string);
var
  i: integer;
begin
  if Contenedor.Name = ControlNombre then begin
    FComponenteBuscado := Contenedor;
  end else begin
    if not Assigned(FComponenteBuscado) then begin
      for i := 0 to Contenedor.ComponentCount -1 do begin
        BuscarComponente(Contenedor.Components[i], ControlNombre);
      end;
    end;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.fraEmpresamskCUITChange(Sender:
    TObject);
begin
  inherited;
  fraEmpresa.mskCUITChange(Sender);
  FFechaActual := 0;
end;

procedure TfrmRelevamientosRiesgosLaborales.fraEstableciBusqedCodigoKeyPress(
    Sender: TObject; var Key: Char);
begin
  fraEstableciBusq.edCodigoKeyPress(Sender, Key);
  vclExtra.LockControls([tsAnexos], False);
end;

procedure TfrmRelevamientosRiesgosLaborales.ResetColorControl(Control: TControl);
begin
  lbValidoSiNo.Caption := LB_VALIDO_NO;
  lbValidoSiNo.Font.Color := clWindowText;
  lbValidoSiNo.Color := clBtnFace;
  THackControl(Control).Font.Color := clWindowText;
  THackControl(Control).Color := clWindow;
end;

procedure TfrmRelevamientosRiesgosLaborales.ShortCutControl1ShortCuts9ShortCutPress(
  Sender: TObject);
begin
  if mnuAnexoCancerigenos.Enabled then
    mnuAnexoCancerigenosClick(nil);
end;

procedure TfrmRelevamientosRiesgosLaborales.ShortCutControl1ShortCuts10ShortCutPress(
  Sender: TObject);
begin
  if mnuAnexoDifenilos.Enabled then
    mnuAnexoDifenilosClick(nil);

end;

procedure TfrmRelevamientosRiesgosLaborales.ShortCutControl1ShortCuts11ShortCutPress(
  Sender: TObject);
begin
  if mnuAnexoAccIndMayores.Enabled then
    mnuAnexoAccIndMayoresClick(nil);
end;

procedure TfrmRelevamientosRiesgosLaborales.tbSegQuitarClick(
  Sender: TObject);
var
  Sql : String;
begin
  Try
    Sql := 'UPDATE hys.hrt_relevseguimiento ' +
           '   SET rt_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
           '       rt_fechabaja = SYSDATE ' +
           ' WHERE rt_id = ' + SqlValue(sdqSeguimiento.FieldByName('rt_id').AsInteger) +
           ' AND rt_fechabaja IS NULL ';

    EjecutarSql(Sql);
    sdqSeguimiento.Refresh ;
  Except
    on E: Exception do ErrorMsg(E);
  end;

end;

procedure TfrmRelevamientosRiesgosLaborales.tbEliminarClick(
  Sender: TObject);
begin
  if iCabecera > 0 then
  begin
    EntrarContrato;
    if ModoEmpleador then
    begin
      Verificar(ExisteSql(
        'SELECT 1 '+
        '  FROM hys.hrl_relevriesgolaboral a, hys.hrl_relevriesgolaboral b '+
        ' WHERE a.rl_fechabaja IS NULL '+
        '   AND a.rl_contrato = b.rl_contrato '+
        '   AND a.rl_estableci = b.rl_estableci '+
        '   AND a.rl_vigencia = b.rl_vigencia '+
        '   AND a.rl_procedencia = ''P'' '+
        '   AND b.rl_id = '+SqlValue(iCabecera)),tbEliminar,'No puede existir un relevamiento preventor dado de alta para la misma vigencia.');
    end;

    if (MsgBox('¿Desea dar de baja el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
    begin
      BeginTrans;
      try
        EjecutarSqlST(
          ' UPDATE hys.hrl_relevriesgolaboral '+
          '    SET rl_usubaja = '+SqlValue(Sesion.UserID)+','+
          '        rl_fechabaja = SYSDATE '+
          '  WHERE rl_id = '+ SqlValue(iCabecera)
          );
        if ModoEmpleador then
          EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga, NULL, NULL);', [fraEmpresa.Contrato, edVigencia.Text, 'R']);
        CommitTrans;
        CargarEstado(fraEmpresa.Contrato, edVigencia.Text);
        CargarBusqueda;
      except
        on E: Exception do
        begin
          Rollback;
          ErrorMsg(E, 'Error al eliminar el relevamiento. ' + #13#10 + E.Message );
        end;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbImpresionResolucionClick(
  Sender: TObject);
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe Seleccionar una empresa');
  Verificar(fraEstableciBusq.IsEmpty, fraEstableciBusq, 'Debe Seleccionar un Establecimiento');
  with TrptResolucion463.Create(Self) do
  try
    Load(fraEmpresa.Contrato,StrToInt(fraEstableciBusq.edCodigo.Text),edVigencia.Text);
  finally
    Free;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbGenerarPDFClick(
  Sender: TObject);
//var
 // pathQrp, pathDestino : string;
//var
//  vigencia: string;
begin
//  EjecutarSql(' insert into hys.hfg_formulariogenerado values(1,124261,1,''P'','''',2,''JSEARA'',sysdate,null, null , null, null, ''N'' )');
EjecutarSql(' UPDATE hys.hfg_formulariogenerado SET fg_estado = ''P'', fg_idformulario = 2 where fg_id = 1');
{
 with GetQuery(
    ' SELECT rl_contrato, TO_CHAR(rl_fechavigencia, ''YYYY'') rl_vigencia, rl_fecharecepcion, rl_fechaalta ' +
    ' FROM hys.hrl_relevriesgolaboral ' +
    ' WHERE (   TO_CHAR(rl_fechavigencia, ''YYYY'') <> rl_vigencia ' +
    '    OR rl_fechavigencia IS NULL) ' +
    '   AND rl_fechabaja IS NULL ' +
    '   AND rl_procedencia = ''E'' ') do
  try
    while not Eof do
    begin

        if FieldByName('rl_vigencia').IsNull then
        begin
          vigencia := ValorSql(' SELECT to_char(art.hys.get_vigenciaactual463( '+SqlValue(FieldByName('rl_contrato').AsInteger)+', '+
                                      SqlDate(FieldByName('rl_fecharecepcion').AsDateTime)+'),''YYYY'') FROM DUAL');
          if vigencia = '' then
          begin
            vigencia := ValorSql(' SELECT to_char(art.hys.get_vigenciaactual463( '+SqlValue(FieldByName('rl_contrato').AsInteger)+', '+
                                        SqlDate(FieldByName('rl_fechaalta').AsDateTime)+'),''YYYY'') FROM DUAL');
            if vigencia = '' then
            begin
              vigencia := FormatDateTime('yyyy', FieldByName('rl_fechaalta').AsDateTime);
            end;
          end;

        end
        else
         vigencia := FieldByName('rl_vigencia').AsString;
        if vigencia <> '' then
          do_GenerarPlanilla_old(FieldByName('rl_contrato').AsInteger, vigencia);
      Next;
    end;
  finally
    Free;
  end;
  {
  sdqRelev.Open;
  with sdqRelev do
  try
    try
    BeginTrans(True);
    EjecutarSqlST(
      ' UPDATE hys.hil_itemsriesgolaboral '+
      '    SET il_fecharegularizacion = NULL '+
      '  WHERE il_iditemanexo IN (6, 397, 399, 171) '+
      '    AND il_cumplimiento <> ''N'' '+
      '    AND il_fecharegularizacion IS NOT NULL');
    while not Eof do
    begin
      with TrptResolucion463.Create(nil) do
      try
        Load(FieldByName('rl_contrato').AsInteger,
             FieldByName('rl_estableci').AsInteger,
             FieldByName('rl_vigencia').AsString);
        pathQrp := Path;
      finally
        Free;
      end;
      pathDestino := ArmarPath(FieldByName('rl_contrato').AsString,FieldByName('rl_vigencia').AsString,
                               FieldByName('rl_estableci').AsInteger);
      if not FileToPDFSvr(pathQrp,pathDestino) then
        raise Exception.Create('Error al generar el PDF');
      Next;
    end;
    CommitTrans(True);
    Except
      Rollback(True);
    end;
  finally
    Close;
  end;
  }
end;

procedure TfrmRelevamientosRiesgosLaborales.tbAnexoItemsNoClick(
  Sender: TObject);
var
  sCIIU : String;
begin
  Verificar(not fraEmpresa.IsSelected,fraEmpresa,'Debe seleccionar una empresa.');
  Verificar(not fraEstableciBusq.IsSelected,fraEstableciBusq,'Debe seleccionar un establecimiento.');
  // CIIU del Establecimiento
    sCIIU := ValorSql('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                      '  FROM comunes.cac_actividad ' +
                      ' WHERE ac_codigo = ' + SqlValue(fraEstableciBusq.Actividad));
    // CIIU de la Empresa si no existe para el Estab.
    sCIIU := iif (sCIIU = '',
                  ValorSQL ('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) ' +
                            '  FROM afi.aco_contrato, comunes.cac_actividad ' +
                            ' WHERE co_contrato = ' + SqlValue(fraEmpresa.edContrato.Text) +
                            '   AND co_idactividad = ac_id '),
                  sCIIU);
  with TrptVisitasNo.Create(Self) do
  try
    FModoEmpleador := ModoEmpleador;
    VistaPrevia(fraEmpresa.mskCUIT.Text, fraEstableciBusq.edCodigo.Text,
                fraEmpresa.cmbRSocial.Text,
                fraEstableciBusq.cmbDescripcion.Text,
                fraEmpresa.edContrato.Text,
                sCIIU,
                fraEstableciBusq.edDomicilio.Text,
                fraEstableciBusq.edLocalidad.Text,
                edCPA.Text,
                fraEstableciBusq.edProvincia.Text,
                ValorSQL ('SELECT DECODE(st_telefonos, ' +
                          '              NULL, mp_telefonos, ' +
                          '              ''S/D'', mp_telefonos, ' +
                          '              st_telefonos) ' +
                          '  FROM cmp_empresas, cst_estableci ' +
                          ' WHERE mp_cuit = st_cuit ' +
                          '   AND st_cuit = ' + SqlValue(fraEmpresa.mskCUIT.Text) +
                          '   AND st_clave = ' + fraEstableciBusq.edCodigo.TextSql),
                ValorSQL ('SELECT dc_mail ' +
                          '  FROM afi.adc_domiciliocontrato ' +
                          ' WHERE ROWNUM = 1 ' +
                          '   AND dc_contrato = ' + SqlValue(fraEmpresa.Contrato)));
  finally
    Free;
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbCambioModoClick(
  Sender: TObject);
begin
  ModoEmpleador := not ModoEmpleador;
  tbAprobarCargaFinal.Visible := ModoEmpleador;
  edFechaVerificacion.Visible := not ModoEmpleador;
  edObservacionDen.Visible := not ModoEmpleador;
  lbFechaVerificacion.Visible := not ModoEmpleador;
  lbObservacionDen.Visible := not ModoEmpleador;
  AdvToolPanelTab.Visible := not ModoEmpleador;

  lblCargaDefinitiva.Visible          := ModoEmpleador;
  lblEstadoDefinitivo.Visible         := ModoEmpleador;
  lblUsuarioAprob.Visible             := ModoEmpleador;
  lblFechaAprobacion.Visible          := ModoEmpleador;
  lblCumplimientoDefinitivo.Visible   := ModoEmpleador;
  lblRelevValidosDefinitiva.Visible   := ModoEmpleador;
  lblRelevInvalidosDefinitiva.Visible := ModoEmpleador;
  lblCantEstabDefinitiva.Visible      := ModoEmpleador;

  lbValidoSiNo.Visible                := ModoEmpleador;
  lbValido.Visible                    := ModoEmpleador;

  //tbGremialistas.Enabled              := ModoEmpleador;
  //tbRelevContratistas.Enabled         := ModoEmpleador;

  tbCopiaEmpleador.Enabled            := not ModoEmpleador;
  CargarBusqueda;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbImpresionPreventorClick(
  Sender: TObject);
var
  pathQrp : String;

begin
  with TrptRes463Preventor.Create(Self) do
  try
    Load(fraEmpresa.Contrato, StrToInt(fraEstableciBusq.edCodigo.Text),edVigencia.Text);
    pathQrp := Path;
  finally
    Free;
  end;
  if not FileToPDFSvr(pathQrp,TempPath) then
    raise Exception.Create('Error al generar el PDF');
  AbrirPDF( ChangeFileExt(pathQrp, '.pdf'));
end;

procedure TfrmRelevamientosRiesgosLaborales.edProcedenciaDblClick(
  Sender: TObject);
begin
  if tbCambioModo.Enabled then
    tbCambioModoClick(nil);
end;

procedure TfrmRelevamientosRiesgosLaborales.tbCopiaEmpleadorClick(
  Sender: TObject);
var
  idCabecera , idCabeceraEmpleador, idFormulario : Integer;
  sSQLAnexos, sSql, strVigencia : String;
begin
  idCabecera := 0;
  strVigencia := ValorSqlEx('SELECT hys.get_ultvigenciarelev463(:contrato, :estab, :procedencia) FROM DUAL', [fraEmpresa.Contrato, fraEstableciBusq.edCodigo.Text, 'E']);

  sSql :=
      ' SELECT rl_id '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
      '    AND rl_vigencia = '+SqlValue(strVigencia)+
      '    AND rl_fechabaja IS NULL'+
      '    AND rl_procedencia = ''E'' ';
    idCabeceraEmpleador := ValorSqlInteger(sSql);
    Verificar(idCabeceraEmpleador = 0,tsAnexos,'No existe relevamiento cargado por el empleador.');
    sSql :=
      ' SELECT rl_valido '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
      '    AND rl_vigencia = '+SqlValue(strVigencia)+
      '    AND rl_fechabaja IS NULL'+
      '    AND rl_procedencia = ''E'' ';
    Verificar(ValorSql(sSql)= 'N',tbCopiaEmpleador, 'Debe ser valido el Relevamiento del empleador ');
    Verificar(not ExisteSql(
        ' SELECT DISTINCT 1 '+
        '   FROM hys.hvm_visitamotivo, art.prv_resvisitas '+
        '  WHERE rv_id = vm_idvisita '+
        '    AND rv_cuit = '+SqlValue(fraEmpresa.CUIT)+
        '    AND rv_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
        '    AND rv_fecha >= art.actualdate - 365 '+
        '    AND vm_idmotivo in (63) '+
        '    AND vm_fechabaja IS NULL '+
        '    AND rv_fechabaja IS NULL '),tsAnexos,'Debe Existir Visita con Motivo "RES 463/2009 - Evaluación de verosimilitud" o "Verificación".' );


  edFechaRecepcionPreventor.Date := ValorSqlDateTime(
      ' SELECT rl_fecharecepcion '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_id = '+SqlValue(idCabeceraEmpleador));
  if fpCopiaPreventor.ShowModal = mrOK then
  begin
    sSql :=
      ' SELECT 1 '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
      '    AND rl_vigencia = '+SqlValue(strVigencia)+
      '    AND rl_fechabaja IS NULL'+
      '    AND rl_procedencia = ''P'' ';

    Verificar(ExisteSql(sSql),tsAnexos,'Existe relevamiento cargado por parte del preveentor.');
    BeginTrans(True);
    try
      idCabecera := GetSecNextVal('HYS.SEQ_HRL_RELEV_ID');
      iCabecera := idCabecera;
      EjecutarSqlST(
      '  INSERT INTO hys.hrl_relevriesgolaboral '+
      '              (rl_id, rl_contrato, rl_estableci, rl_fecharecepcion, rl_valido, '+
      '               rl_vigencia, rl_usualta, rl_fechaalta, rl_idresolucionanexo, rl_procedencia, '+
      '               rl_cantempleados, rl_sindatos, rl_sinpersonal,rl_fueradetermino,rl_fechaformulario '+
      '              ) '+
      '    SELECT '+SqlValue(idCabecera)+', rl_contrato, rl_estableci,'+SqlValue(edFechaRecepcionPreventor.Date)+
      ',  ''S'', rl_vigencia,'+SqlValue(Sesion.UserID)+',SYSDATE,rl_idresolucionanexo,''P'', ' +
      '   rl_cantempleados, rl_sindatos, rl_sinpersonal, ''S'', rl_fechaformulario  '+
      '      FROM hys.hrl_relevriesgolaboral '+
      '     WHERE rl_id = '+SqlValue(idCabeceraEmpleador)+
      '       AND rl_fechabaja is null ');

      EjecutarSqlST(
        ' INSERT INTO hys.hil_itemsriesgolaboral '+
        '             (il_id, il_idrelevriesgolaboral, il_iditemanexo, il_cumplimiento, '+
        '              il_fecharegularizacion, il_fechaverificacion, '+
        '              il_observaciondenuncia, il_fechaalta, il_usualta, il_fechamodif, '+
        '              il_usumodif, il_fechabaja, il_usubaja) '+
        '   SELECT HYS.SEQ_HIL_ID.NEXTVAL, '+SqlValue(idCabecera)+', il_iditemanexo, il_cumplimiento, '+
        '          il_fecharegularizacion, il_fechaverificacion, il_observaciondenuncia, '+
        '          il_fechaalta, il_usualta, il_fechamodif, il_usumodif, il_fechabaja, '+
        '          il_usubaja '+
        '     FROM hys.hil_itemsriesgolaboral '+
        '    WHERE il_idrelevriesgolaboral = '+SqlValue(idCabeceraEmpleador)  );
      sSQLAnexos :=
        ' SELECT fr_id, fr_valido, fr_fechaalta, fr_usualta, fr_fechamodif, fr_usumodif, '+
        '        fr_fechabaja, fr_usubaja, fr_idtipoanexo '+
        '   FROM hys.hfr_formulariorelev '+
        '  WHERE fr_idrelevriesgolaboral = '+SqlValue(idCabeceraEmpleador)+' AND fr_fechabaja IS NULL ';
      with GetQuery(sSQLAnexos) do
      try
        while not Eof do
        begin
          idFormulario := GetSecNextVal('HYS.SEQ_HFR_ID');
          EjecutarSqlST(
            '  INSERT INTO hys.hfr_formulariorelev( fr_id, fr_idrelevriesgolaboral, '+
            '         fr_valido, fr_fechaalta, fr_usualta, fr_idtipoanexo) '+
            '       VALUES ('+SqlValue(idFormulario)+','+SqlValue(idCabecera)+','+
            SqlValue(fieldbyname('fr_valido').AsString)+',sysdate,'+
            SqlValue(Sesion.UserID)+','+
            SqlValue(fieldbyname('fr_idtipoanexo').AsString)+')');
          EjecutarSqlST(
            '  INSERT INTO hys.hif_itemsformulariorelev '+
            '              (if_id, if_idformulariorelev, if_iditemtipoanexo, if_cumplimiento, '+
            '               if_fechaalta, if_usualta) '+
            '    SELECT hys.seq_hif_id.NEXTVAL, '+SqlValue(idFormulario)+', if_iditemtipoanexo, '+
            '           if_cumplimiento, sysdate,'+ SqlValue(Sesion.UserID)+
            '      FROM hys.hif_itemsformulariorelev '+
            '     WHERE if_idformulariorelev = '+SqlValue(FieldByName('fr_id').AsString)+' AND if_fechabaja IS NULL ');
          Next;
        end;
      finally
        Free;
      end;
      EjecutarSqlST(
        ' INSERT INTO hys.hrr_responsablerelev '+
        '             (rr_id, rr_idrelevriesgolaboral, rr_valido, rr_cargo, '+
        '              rr_idrepresentacion, rr_relacion, rr_cuitcuil, rr_nombre, '+
        '              rr_titulo, rr_matricula, rr_entidad, rr_responsableform, '+
        '              rr_fechaalta, rr_usualta) '+
        '  SELECT HYS.SEQ_HRR_RESPID.NEXTVAL, '+SqlValue(idCabecera)+', rr_valido, rr_cargo,'+
        '         rr_idrepresentacion, rr_relacion, rr_cuitcuil, rr_nombre, rr_titulo, '+
        '         rr_matricula, rr_entidad, rr_responsableform, SYSDATE,'+ SqlValue(Sesion.UserID)+
        '    FROM hys.hrr_responsablerelev '+
        '   WHERE rr_idrelevriesgolaboral = '+SqlValue(idCabeceraEmpleador)+
        '     AND rr_fechabaja IS NULL ');
      EjecutarSqlST(
        ' INSERT INTO hys.hrg_relevgremialista '+
        '             (rg_id, rg_idrelevriesgolaboral, rg_nrolegajo, rg_nombregremio, '+
        '             rg_fechaalta,rg_usualta) '+
        '   SELECT hys.seq_hrg_id.NEXTVAL, '+SqlValue(idCabecera)+', rg_nrolegajo, '+
        '          rg_nombregremio, SYSDATE,'+ SqlValue(Sesion.UserID)+
        '     FROM hys.hrg_relevgremialista '+
        '    WHERE rg_idrelevriesgolaboral = '+SqlValue(idCabeceraEmpleador)+
        '      AND rg_fechabaja IS NULL ');
      EjecutarSqlST(
        '  INSERT INTO hys.hrc_relevcontratista '+
        '              (rc_id, rc_idrelevriesgolaboral, rc_cuit, rc_fechaalta, rc_usualta) '+
        '    SELECT hys.seq_hrc_id.NEXTVAL,'+SqlValue(idCabecera)+', rc_cuit,'+
        '           SYSDATE, '+ SqlValue(Sesion.UserID)+
        '      FROM hys.hrc_relevcontratista '+
        '     WHERE rc_idrelevriesgolaboral = '+SqlValue(idCabeceraEmpleador)+
        '       AND rc_fechabaja IS NULL ');

      CommitTrans(True);
    except
      on E: Exception do
      begin
        Rollback(true);
        ErrorMsg(E, 'Error al duplicar el relevamiento. ' + #13#10 + E.Message );
      end;
    end;
    CargarDatosResolucion(idCabecera);
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnFRecepAceptarClick(
  Sender: TObject);
var
  sSql : String;
  strVigencia : String;
begin
  Verificar(edFechaRecepcionPreventor.Date = 0, edFechaRecepcionPreventor, 'Debe indicar la fecha de recepción.');
  if (edFechaRecepcionPreventor.Date <> 0) then
  begin
    //sSql := 'SELECT to_char(art.hys.get_vigenciaactual463( '+SqlValue(fraEmpresa.Contrato)+', '+
    //                       SqlDate(edFechaRecepcionPreventor.Date)+'),''YYYY'') FROM DUAL';
    sSql := ' SELECT MAX(rl_vigencia) '+
            '   FROM hys.hrl_relevriesgolaboral '+
            '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
            '    AND rl_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
            '    AND rl_fechabaja IS NULL'+
            '    AND rl_procedencia = ''E'' ';
    strVigencia := ValorSql(sSql);
    if strVigencia = '' then
    begin

      Verificar(true,edFechaRecepcionPreventor, 'No existe relev del Empleador.');
    end;
  end;
  fpCopiaPreventor.ModalResult := mrOk;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbCargaFueraDeTerminoClick(
  Sender: TObject);
begin
  tbNuevoClick(nil);
  ModoFueraDeTermino := True;
  vclExtra.LockControls([edVigencia],false);
end;

procedure TfrmRelevamientosRiesgosLaborales.edVigenciaExit(
  Sender: TObject);
var
  sSql : String;
  error : Boolean;
begin
  error := False;
  if ModoFueraDeTermino and not edVigencia.ReadOnly then
  begin
    sSql :=
        ' SELECT 1 '+
        '   FROM hys.hrl_relevriesgolaboral '+
        '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
        '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
        '    AND rl_vigencia = '+SqlValue(edVigencia.Text)+
        '    AND rl_fechabaja IS NULL';
      if ModoEmpleador then
        sSql := sSql + ' AND rl_procedencia = ''E'' '
      else
        sSql := sSql + ' AND rl_procedencia = ''P'' ';

      if ExisteSql(sSql) then
      begin
        error := True;
        InvalidMsg(tsAnexos,'Ya existe un relevamiento para esta vigencia.');
      end;
      if not error then
      begin
        FFechaActual := edFechaRecepcion.Date;
        btnGuardar.Enabled := True;
      end
      else
      begin
        btnGuardar.Enabled := false;
        btnLimpiar.SetFocus();
      end;
  end;
  if not ModoEmpleador and (FModoABM = mfAlta) then
  begin
    with GetQuery(
      ' SELECT * '+
      '   FROM hys.hrl_relevriesgolaboral '+
      '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato) +
      '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
      '    AND rl_vigencia = '+ SqlValue(edVigencia.Text)+
      '    AND rl_procedencia = ''E'' ') do
    try
      edES_EMPLEADOS.Text := FieldByName('rl_cantempleados').AsString;
      cbSinPersonal.Checked := FieldByName('rl_sinpersonal').AsString = 'S';
      cbSinDatos.Checked := FieldByName('rl_sindatos').AsString = 'S';
    finally
      Free;
    end;
  end;
end;

function TfrmRelevamientosRiesgosLaborales.get_calgulovigeniaFueraDeTermino (contrato : integer; fechadesde : TDateTime) : String;
//var
//  sSql : string;
//  q : TSDQuery;
begin
  { sSql := ' declare ' +
           '    idco number; '+
           '    val date; '+
           ' begin ' +
           '    val := :fechadesde; '+
           '   art.hys.get_vigenciaidactual463 ' +
           '     (:contrato, val, :fechahasta, idco); ' +
           '   :result := val; '+
           ' end; ';

    q := TSDQuery.Create(nil);
    try
      SetDatabaseToQuery(q);
      q.SQL.Text := sSql;
      q.Prepare;
      q.ParamByName('result').ParamType := ptOutput;
      q.ParamByName('result').DataType := ftDate;
      q.ParamByName('contrato').AsInteger := contrato;

      q.ParamByName('fechadesde').AsDate := EncodeDate(StrToInt(FormatDateTime('YYYY', fechadesde)),01,01)+30;
      q.ParamByName('fechahasta').AsDate := EncodeDate(StrToInt(FormatDateTime('YYYY', fechadesde)),12,31)-45;
      ClearParamsError(q);
      q.ExecSQL;
      IF q.ParamByName('result').AsDate <> 0 THEN
      result := FormatDateTime('YYYY',q.ParamByName('result').AsDate)
      ELSE Result := '';
    finally
      q.UnPrepare;
      q.Free;
    end;
    }

    result := ValorSql('SELECT art.hys.get_anionuevorelevriesglab('+SqlValue(fraEmpresa.Contrato)+','+
                        SqlValue(fraEstableciBusq.edCodigo.Text)+', ''R'') from dual ');
end;

procedure TfrmRelevamientosRiesgosLaborales.ClearParamsError(AQuery: TSDQuery);
var
  i: integer;
begin
  for i := AQuery.Params.Count -1 downto 0 do
    if (AQuery.Params[i].Name = '=') or (AQuery.Params[i].Name = '') then
      AQuery.Params.Delete(i);
end;

procedure TfrmRelevamientosRiesgosLaborales.tbCopiarFGRLClick(
  Sender: TObject);
begin
  fraEstablecimientoCopia.ExtraCondition :=
    ' AND ES_CONTRaTO = '+SqlValue(fraEmpresa.Contrato)+
    ' AND es_nroestableci <> '+SqlValue(fraEstableciBusq.edCodigo.Value)+
    ' AND es_nroestableci IN (SELECT rl_estableci '+
    '                           FROM hys.hrl_relevriesgolaboral '+
    '                          WHERE rl_contrato = es_contrato )' ;
  fpCopiaEstablecimiento.ShowModal;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnAceptarEstabCopiaClick(
  Sender: TObject);
var
  procedencia, tipoProcedencia: String;
  strVigencia, sSql, sSQLAnexos : String;
  cantempleados, idCabecera, idCabeceraACopiar : Integer;
  sindatos, sinpersonal : String;
  idFormulario : Integer;
begin
  Verificar(not fraEstablecimientoCopia.IsSelected, fraEstablecimientoCopia,'Debe Seleccionar Establecimiento.');
  idCabecera := 0;
//TKT 37817  If ModoEmpleador then
//  begin
    procedencia := ' AND rl_procedencia = ''E'' ';
    tipoProcedencia := 'E';
//  end
//  else
//  begin
//    procedencia := ' AND rl_procedencia = ''P'' ';
//    tipoProcedencia := 'P';
//  end;

  strVigencia := ValorSqlEx('SELECT hys.get_ultvigenciarelev463(:contrato, :estab, :procedencia) FROM DUAL', [fraEmpresa.Contrato, fraEstablecimientoCopia.Codigo, tipoProcedencia]);
  sSql :=
    ' SELECT rl_id '+
    '   FROM hys.hrl_relevriesgolaboral hrl '+
    '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
    '    AND rl_estableci = '+ SqlValue(fraEstablecimientoCopia.Codigo)+
    '    AND rl_vigencia = (SELECT MAX(rl_vigencia) '+
    '                         FROM hys.hrl_relevriesgolaboral a '+
    '                        WHERE a.rl_contrato = hrl.rl_contrato '+
    '                          AND a.rl_estableci = hrl.rl_estableci '+
    '                          AND a.rl_fechabaja IS NULL '+
    '                          AND a.rl_procedencia = hrl.rl_procedencia)'+
    '    AND rl_fechabaja IS NULL '+procedencia + 'ORDER BY rl_id DESC';
  idCabeceraACopiar := ValorSqlInteger(sSql);
  Verificar(idCabeceraACopiar = 0,fraEstablecimientoCopia,'No existe el relevamiento');
  sSql :=
    ' SELECT 1 '+
    '   FROM hys.hrl_relevriesgolaboral hrl'+
    '  WHERE rl_contrato = '+SqlValue(fraEmpresa.Contrato)+
    '    AND rl_estableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)+
    '    AND rl_vigencia = (SELECT MAX(rl_vigencia) '+
    '                         FROM hys.hrl_relevriesgolaboral a '+
    '                        WHERE a.rl_contrato = hrl.rl_contrato '+
    '                          AND a.rl_estableci = '+SqlValue(fraEstablecimientoCopia.Codigo)+
    '                          AND a.rl_fechabaja IS NULL '+
    '                          AND a.rl_procedencia = hrl.rl_procedencia)'+
    '    AND rl_fechabaja IS NULL'+ procedencia;

  Verificar(ExisteSql(sSql),tsAnexos,'Ya existe un relevamiento cargado de la empresa.');
  BeginTrans(True);
  try
    idCabecera := GetSecNextVal('HYS.SEQ_HRL_RELEV_ID');
    iCabecera := idCabecera;
    with GetQuery(
      ' SELECT es_empleados, es_sinpersonal, es_sindatos '+
      '   FROM afi.aes_establecimiento '+
      '  WHERE es_contrato = '+SqlValue(fraEmpresa.Contrato)+
      '    AND es_nroestableci = '+ SqlValue(fraEstableciBusq.edCodigo.Text)) do
    try
      cantempleados := FieldByName('es_empleados').AsInteger;
      sinpersonal := FieldByName('es_sinpersonal').AsString;
      sindatos := FieldByName('es_sindatos').AsString;
    finally
      Free;
    end;


    EjecutarSqlST(
      '  INSERT INTO hys.hrl_relevriesgolaboral '+
      '              (rl_id, rl_contrato, rl_estableci, rl_fecharecepcion, rl_valido, '+
      '               rl_vigencia, rl_usualta, rl_fechaalta, rl_idresolucionanexo, rl_procedencia, '+
      '               rl_cantempleados, rl_sindatos, rl_sinpersonal,rl_fechaformulario '+
      '              ) '+
      '    SELECT '+SqlValue(idCabecera)+', rl_contrato, '+SqlValue(fraEstableciBusq.edCodigo.Text)+',rl_fecharecepcion,'+
      '           rl_valido, rl_vigencia,'+SqlValue(Sesion.UserID)+',SYSDATE,rl_idresolucionanexo,' + SqlValue(tipoProcedencia)+','+
      SqlValue(cantempleados)+','+SqlValue(sindatos)+','+SqlValue(sinpersonal)+',rl_fechaformulario'+
      '      FROM hys.hrl_relevriesgolaboral '+
      '     WHERE rl_id = '+SqlValue(idCabeceraACopiar)+
      '       AND rl_fechabaja is null ');

    EjecutarSqlST(
      ' INSERT INTO hys.hil_itemsriesgolaboral '+
      '             (il_id, il_idrelevriesgolaboral, il_iditemanexo, il_cumplimiento, '+
      '              il_fecharegularizacion, il_fechaverificacion, '+
      '              il_observaciondenuncia, il_fechaalta, il_usualta, il_fechamodif, '+
      '              il_usumodif, il_fechabaja, il_usubaja) '+
      '   SELECT HYS.SEQ_HIL_ID.NEXTVAL, '+SqlValue(idCabecera)+', il_iditemanexo, il_cumplimiento, '+
      '          il_fecharegularizacion, il_fechaverificacion, il_observaciondenuncia, '+
      '          il_fechaalta, il_usualta, il_fechamodif, il_usumodif, il_fechabaja, '+
      '          il_usubaja '+
      '     FROM hys.hil_itemsriesgolaboral '+
      '    WHERE il_idrelevriesgolaboral = '+SqlValue(idCabeceraACopiar)  );
    sSQLAnexos :=
      ' SELECT fr_id, fr_valido, fr_fechaalta, fr_usualta, fr_fechamodif, fr_usumodif, '+
      '        fr_fechabaja, fr_usubaja, fr_idtipoanexo '+
      '   FROM hys.hfr_formulariorelev '+
      '  WHERE fr_idrelevriesgolaboral = '+SqlValue(idCabeceraACopiar)+' AND fr_fechabaja IS NULL ';
    with GetQuery(sSQLAnexos) do
    try
      while not Eof do
      begin
        idFormulario := GetSecNextVal('HYS.SEQ_HFR_ID');
        EjecutarSqlST(
          '  INSERT INTO hys.hfr_formulariorelev( fr_id, fr_idrelevriesgolaboral, '+
          '         fr_valido, fr_fechaalta, fr_usualta, fr_idtipoanexo) '+
          '       VALUES ('+SqlValue(idFormulario)+','+SqlValue(idCabecera)+','+
          SqlValue(fieldbyname('fr_valido').AsString)+',sysdate,'+
          SqlValue(Sesion.UserID)+','+
          SqlValue(fieldbyname('fr_idtipoanexo').AsString)+')');
        EjecutarSqlST(
          '  INSERT INTO hys.hif_itemsformulariorelev '+
          '              (if_id, if_idformulariorelev, if_iditemtipoanexo, if_cumplimiento, '+
          '               if_fechaalta, if_usualta) '+
          '    SELECT hys.seq_hif_id.NEXTVAL, '+SqlValue(idFormulario)+', if_iditemtipoanexo, '+
          '           if_cumplimiento, sysdate,'+ SqlValue(Sesion.UserID)+
          '      FROM hys.hif_itemsformulariorelev '+
          '     WHERE if_idformulariorelev = '+SqlValue(FieldByName('fr_id').AsString)+' AND if_fechabaja IS NULL ');
        Next;
      end;
    finally
      Free;
    end;
    EjecutarSqlST(
      ' INSERT INTO hys.hrr_responsablerelev '+
      '             (rr_id, rr_idrelevriesgolaboral, rr_valido, rr_cargo, '+
      '              rr_idrepresentacion, rr_relacion, rr_cuitcuil, rr_nombre, '+
      '              rr_titulo, rr_matricula, rr_entidad, rr_responsableform, '+
      '              rr_fechaalta, rr_usualta) '+
      '  SELECT HYS.SEQ_HRR_RESPID.NEXTVAL, '+SqlValue(idCabecera)+', rr_valido, rr_cargo,'+
      '         rr_idrepresentacion, rr_relacion, rr_cuitcuil, rr_nombre, rr_titulo, '+
      '         rr_matricula, rr_entidad, rr_responsableform, SYSDATE,'+ SqlValue(Sesion.UserID)+
      '    FROM hys.hrr_responsablerelev '+
      '   WHERE rr_idrelevriesgolaboral = '+SqlValue(idCabeceraACopiar)+
      '     AND rr_fechabaja IS NULL ');
    EjecutarSqlST(
      ' INSERT INTO hys.hrg_relevgremialista '+
      '             (rg_id, rg_idrelevriesgolaboral, rg_nrolegajo, rg_nombregremio, '+
      '             rg_fechaalta,rg_usualta) '+
      '   SELECT hys.seq_hrg_id.NEXTVAL, '+SqlValue(idCabecera)+', rg_nrolegajo, '+
      '          rg_nombregremio, SYSDATE,'+ SqlValue(Sesion.UserID)+
      '     FROM hys.hrg_relevgremialista '+
      '    WHERE rg_idrelevriesgolaboral = '+SqlValue(idCabeceraACopiar)+
      '      AND rg_fechabaja IS NULL ');
    EjecutarSqlST(
      '  INSERT INTO hys.hrc_relevcontratista '+
      '              (rc_id, rc_idrelevriesgolaboral, rc_cuit, rc_fechaalta, rc_usualta) '+
      '    SELECT hys.seq_hrc_id.NEXTVAL,'+SqlValue(idCabecera)+', rc_cuit,'+
      '           SYSDATE, '+ SqlValue(Sesion.UserID)+
      '      FROM hys.hrc_relevcontratista '+
      '     WHERE rc_idrelevriesgolaboral = '+SqlValue(idCabeceraACopiar)+
      '       AND rc_fechabaja IS NULL ');
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al copiar el relevamiento. ' + #13#10 + E.Message );
    end;
  end;
  CargarDatosResolucion(idCabecera);
  FModoABM := mfModif;
  btnGuardarClick(nil);
  fpCopiaEstablecimiento.ModalResult := mrOk;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbTodoNoClick(Sender: TObject);
var
  i, j : Integer;
  auxListView : TListView;
begin
  for i:= tsAnexos.PageCount -1 downto 0 do
  begin
    auxListView := TListView(tsAnexos.Pages[i].FindChildControl('listview_'+IntToStr(i+1)));
    for j := auxListView.Items.Count-1 downto 0 do
      if not (auxListView.Items[j].ImageIndex in [IMG_READONLY, IMG_CATEGORIA]) then
      begin
        auxListView.Items[j].ImageIndex := 2;
      end;
  end;

end;

procedure TfrmRelevamientosRiesgosLaborales.CargarRelevamientoWeb;
 var
  i, x, y: Integer;
  idItemAnexo : Integer;
  auxListView : TListView;
  fechasolicitud: TDate;
begin
  fechasolicitud := 0;

  with GetQuery(' SELECT sf_id, sf_version, sf_idresolucionanexo, sf_fechaalta, sf_empleados ' +
                '  FROM hys.hsf_solicitudfgrl ' +
                ' WHERE sf_id = (SELECT MAX(hsf.sf_id) ' +
                '                 FROM hys.hsf_solicitudfgrl hsf ' +
                '                WHERE hsf.sf_idestablecimiento = ' + SqlValue(fraEstableciBusq.IdEstablecimiento) +
                '                  AND hsf.sf_fechapasaje is null  ' +
                '                  AND hsf.sf_fechabaja is null)  '
               ) do
    try
      if not IsEmpty then
      begin
        FidResolucionAnexo := FieldbyName('sf_idresolucionanexo').AsInteger;
        FIdSolicitud := FieldbyName('sf_id').AsInteger;
        fechasolicitud := FieldbyName('sf_fechaalta').AsDateTime;
        FVersion := FieldbyName('sf_version').AsInteger;
        if not FieldbyName('sf_empleados').IsNull then
        begin
          edES_EMPLEADOS.Value := FieldbyName('sf_empleados').AsInteger;
          cbSinPersonal.Checked := (edES_EMPLEADOS.Value = 0);
          cbSinDatos.Checked := false;
        end;
      end
      else
        FidResolucionAnexo := -1;
  finally
    free;
  end;

  if (FidResolucionAnexo <> -1) and
     MsgAsk('Existe un formulario registrado el día ' +
             FormatDateTime('dd/mm/yyyy', fechasolicitud) +
             ' a través de la Web, versión ' + IntToStr(FVersion) + #13#10 +
             '¿Desea cargar el relevamiento con estos datos?') then
  begin
    FOrigenFormulario := 'W';
    edProcedencia.Caption := 'Empleador  ';
    lblOrigen.Caption := 'Origen: WEB';
    lblVersion.Caption := 'Versión: ' + IntToStr(FVersion);

    FFechaActual := 0;
    AjustarColorValido(False, True);

    for i := 0 to tsAnexos.PageCount-1 do
    begin
      if tsAnexos.Pages[i].Tag = FidResolucionAnexo then
        iResolucion := i;
    end;
    tsAnexos.ActivePageIndex := iResolucion;
    sdqlistaitems.SQL.Text :=
      '   SELECT * '+
      '     FROM hys.hst_solicituditemsfgrl, hys.hia_itemanexo, hys.hsf_solicitudfgrl '+
      '    WHERE sf_id = ' + SqlValue(FIdSolicitud) +
      '      and st_idsolicitudfgrl = sf_id ' +
      '      and ia_id = st_iditem ' +
      '    ORDER BY ia_nrodescripcion ';
    sdqlistaitems.Open;
    sdqlistaitems.First;
    auxListView := TListView(tsAnexos.Pages[iResolucion].FindChildControl('listview_'+IntToStr(iResolucion+1)));

    x := 0;
    while not sdqlistaitems.Eof do
    begin
      idItemAnexo := sdqlistaitems.fieldbyname('ST_IDITEM').AsInteger;
      y := x;
      while  y <= auxListView.Items.Count-1  do
      begin
        if Assigned(auxListView.Items[y].Data) then
          if TDatoAnexo(auxListView.Items[y].Data).NumeroItem = idItemAnexo then
          begin
            x := y;
            auxListView.Items[y].ImageIndex := strtoint(decode( sdqlistaitems.fieldbyname('ST_CUMPLIMIENTO').AsString, ['','S','N','X'],['-1','0','1','2']));
            TDatoAnexo(auxListView.Items[y].Data).FechaRegularizacion := sdqlistaitems.fieldbyname('ST_FECHAREGULARIZACION').AsDateTime;
            TDatoAnexo(auxListView.Items[y].Data).FechaVerificacion := 0;
            TDatoAnexo(auxListView.Items[y].Data).ObservacionDenuncia := '';
            y := auxListView.Items.Count;
          end;
          y:= y + 1;
      end;
      sdqlistaitems.Next;
    end;
    sdqlistaitems.Close;
    CargarSeguimiento(-1);
    gbNavegador.Enabled := True;
  end else begin
    iCabecera := -1;
    AjustarColorValido(True);
  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.GuardarDatosAnexosWeb;
var
  IdFormulario: integer;
begin
  if (FModoABM = mfAlta) and (FOrigenFormulario = 'W') then
  begin
    with GetQueryEx('SELECT sp_idtipoanexo ' +
                    'FROM hys.hsp_solicitudplanillafgrl ' +
                    'WHERE sp_idsolicitudfgrl = :idsolicitudfgrl ', [FIdSolicitud]) do
    try
      while not EOF do
      begin
        IdFormulario :=  GetSecNextVal('hys.seq_hfr_id');
        EjecutarSqlSTEx(' INSERT INTO hys.hfr_formulariorelev ' +
                        '             (fr_id, fr_idrelevriesgolaboral, fr_valido, fr_fechaalta, fr_usualta, fr_idtipoanexo) ' +
                        '  SELECT ' + SqlValue(IdFormulario) + ', ' + SqlValue(iCabecera) + ', ''S'', SYSDATE, ' + SqlValue(sesion.loginname) + ', sp_idtipoanexo ' +
                        '    FROM hys.hsp_solicitudplanillafgrl ' +
                        '   WHERE sp_idsolicitudfgrl = :idsolicitudfgrl ' +
                        '     AND sp_idtipoanexo = :idtipoanexo ', [FIdSolicitud, FieldByName('sp_idtipoanexo').AsInteger]);
        EjecutarSqlSTEx(' INSERT INTO hys.hif_itemsformulariorelev ' +
                        '            (if_id, if_idformulariorelev, if_iditemtipoanexo, if_cumplimiento, if_fechaalta, if_usualta) ' +
                        '  SELECT hys.seq_hif_id.NEXTVAL, ' + SqlValue(IdFormulario) + ', si_iditemtipoanexo, si_cumplimiento, SYSDATE, ' + SqlValue(Sesion.LoginName) +
                        '    FROM hys.hsp_solicitudplanillafgrl, hys.hsi_solicituditemsplanillafgrl ' +
                        '   WHERE sp_id = si_idsolicitudplanillafgrl ' +
                        '     AND sp_idsolicitudfgrl = :idsolicitudfgrl ' +
                        '     AND sp_idtipoanexo = :idtipoanexo ', [FIdSolicitud, FieldByName('sp_idtipoanexo').AsInteger]);
        Next;
      end;
    finally
      free;
    end;

    //Si no existen datos en esta tabla es porque proviene de una solicitud
    //Si no es una carga Web del cliente
    if not ExisteSqlEx('SELECT 1 ' +
                       '  FROM hys.hrw_responsablerelevweb ' +
                       ' WHERE rw_fechabaja IS NULL ' +
                       '  AND rw_idsolicitudfgrl = :idsolicitudfgrl', [FIdSolicitud]) then
        EjecutarSqlSTEx(' INSERT INTO hys.hrr_responsablerelev ' +
                        '            (rr_id, rr_idrelevriesgolaboral, rr_valido, rr_cargo, rr_idrepresentacion, rr_cuitcuil, rr_nombre, rr_responsableform, rr_fechaalta, rr_usualta) ' +
                        '  SELECT hys.seq_hrr_respid.NEXTVAL, ' +  SqlValue(icabecera) + ', ''S'', ''R'', 7, ' +
                        '         DECODE(ct_tipodocumento, ''CUIL'', ct_numerodocumento, ''DNI'', art.get_cuilvalido(LPAD(ct_numerodocumento, 8, ''0''), ct_sexo, 1), NULL), CT_CONTACTO, ''S'', SYSDATE, ' + SqlValue(Sesion.Loginname) +
                        '    FROM afi.act_contacto ' +
                        '   WHERE ct_id = (SELECT MAX(act.ct_id) ' + //tomo el ultimo para asegurarme que en la reafiliacion no tomo el del contrato viejo
                        '                    FROM afi.act_contacto act ' +
                        '                   WHERE ct_idempresa = :idempresa ' +
                        '                     AND ct_firmante = ''S'') ', [fraEmpresa.ID])
    else
        EjecutarSqlSTEx(' INSERT INTO hys.hrr_responsablerelev ' +
                        '            (rr_id, rr_idrelevriesgolaboral, rr_valido, rr_cargo, rr_idrepresentacion, rr_cuitcuil, rr_nombre, ' +
                        '             rr_titulo, rr_matricula, rr_entidad, rr_responsableform, rr_fechaalta, rr_usualta) ' +
                        '  SELECT hys.seq_hrr_respid.NEXTVAL, ' +  SqlValue(icabecera) + ', ''S'', rw_cargo, rw_idrepresentacion, ' +
                        '         rw_cuitcuil, rw_nombre, rw_titulo, rw_matricula, rw_entidad, decode(rw_cargo, ''R'', ''S'', ''N''), SYSDATE, ' + SqlValue(Sesion.Loginname) +
                        '    FROM hys.hrw_responsablerelevweb ' +
                        '   WHERE rw_fechabaja IS NULL ' +
                        '    AND rw_idsolicitudfgrl = :idsolicitudfgrl ', [FIdSolicitud]);

    EjecutarSqlSTEx(' INSERT INTO hys.hrc_relevcontratista(rc_id, rc_idrelevriesgolaboral, rc_cuit, rc_usualta, ' +
                    '      rc_fechaalta) ' +
                    ' SELECT  hys.seq_hrc_id.NEXTVAL, ' + SqlValue(iCabecera) + ', rw_cuit, ' + SqlValue(Sesion.Loginname) + ', SYSDATE ' +
                    '  FROM hys.hrw_relevcontratistaweb ' +
                    '  WHERE rw_fechabaja IS NULL ' +
                    '  AND rw_idsolicitudfgrl = :idsolicitudfgrl ', [FIdSolicitud]);

    EjecutarSqlSTEx(' INSERT INTO hys.hrg_relevgremialista(rg_id, rg_idrelevriesgolaboral, rg_nrolegajo, rg_nombregremio, ' +
                    '       rg_usualta, rg_fechaalta) ' +
                    ' SELECT hys.seq_hrg_id.NEXTVAL, ' + SqlValue(iCabecera) + ', rw_nrolegajo, rw_nombregremio, ' + SqlValue(Sesion.Loginname) + ', SYSDATE ' +
                    '  FROM hys.hrw_relevgremialistaweb ' +
                    '    WHERE rw_fechabaja IS NULL ' +
                    '  AND rw_idsolicitudfgrl = :idsolicitudfgrl ', [FIdSolicitud]);

  end;
end;

procedure TfrmRelevamientosRiesgosLaborales.FormShow(Sender: TObject);
begin
  inherited;
  if FClickNuevo then
    tbNuevo.Click;
  FClickNuevo := false;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbCargarInvalidoClick(Sender: TObject);
begin
  tbNuevoClick(Sender);
  btnSiguiente.Visible := false;
  FCargaInvalido := true;
end;

procedure TfrmRelevamientosRiesgosLaborales.tbNuevoObservacionMultipleClick(
  Sender: TObject);
begin
  chkObservaciones.UncheckAll;
  edObsLibreMultiple.Clear;
  fpObservacionMultiple.ShowModal;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnAceptarObsMultipleClick(
  Sender: TObject);
begin
  inherited;
  Verificar(chkObservaciones.CheckCount = 0, chkObservaciones, 'Debe seleccionar alguna observación.');
  fpObservacionMultiple.ModalResult := mrOk;
end;

procedure TfrmRelevamientosRiesgosLaborales.btnCancelarObsMultipleClick(
  Sender: TObject);
begin
  inherited;
  chkObservaciones.UncheckAll;
end;


procedure TfrmRelevamientosRiesgosLaborales.tbModificarSinValidarClick(
  Sender: TObject);
begin
  inherited;
  FModificarSinRestriccion := True;
  tbModificarClick(nil);
end;

procedure TfrmRelevamientosRiesgosLaborales.tbRecuperarDatosAnexo2Click(
  Sender: TObject);
var
  i, idItemAnexo, y : Integer;
  auxListView : TListView;
  fechaRecepcion : TDate;
  cargaAnexo : Boolean;
begin
  {for i:= tsAnexos.PageCount -1 downto 0 do
  begin
    auxListView := TListView(tsAnexos.Pages[i].FindChildControl('listview_'+IntToStr(i+1)));
    for j := auxListView.Items.Count-1 downto 0 do
      if not (auxListView.Items[j].ImageIndex in [IMG_READONLY, IMG_CATEGORIA]) then
      begin
        auxListView.Items[j].ImageIndex := 2;
      end;
  end;
  }

  auxListView := nil;
  tsAnexos.ActivePageIndex := iResolucion;
  sdqlistaitems.SQL.Text :=
         'SELECT AN_ANEXO, AN_CODIGO, AI_DESCRIPCION, AC_DESCRIPCION, AN_CUMPLIMIENTO, AI_SOLOLECTURA, AI_PAL ' +
           'FROM PAN_ANEXO2, PAI_ANEXO2ITEMS, PAC_CATEGORIAS ' +
          'WHERE AC_CODIGO = AI_CATEGORIA ' +
            'AND AI_ANEXO = AN_ANEXO ' +
            'AND AI_CODIGO = AN_CODIGO ' +
            'AND AN_CUIT = ''' + fraEmpresa.mskCUIT.Text + ''' ' +
            'AND AN_ESTABLECI = ' + fraEstableciBusq.edCodigo.TextSql + ' ' +
            'AND AN_TIPO = art.hys.get_tipo_estab_srt(' + SqlValue(fraEmpresa.CUIT) + ',' +
                                                                  SqlValue(fraEstableciBusq.edCodigo.text) + ')'+
            'AND AN_TIPO = ''ET'' '+
            'AND AN_OPERATIVO = art.hys.get_operativovigente_empresa(an_cuit) ' +
       {   'UNION ALL ' +
         'SELECT AI_ANEXO, AI_CODIGO, AI_DESCRIPCION, AC_DESCRIPCION, NULL, AI_SOLOLECTURA, AI_PAL ' +
           'FROM PAI_ANEXO2ITEMS, PAC_CATEGORIAS ' +
          'WHERE AC_CODIGO = AI_CATEGORIA ' +
            'AND AI_VIGENCIADESDE <= art.hys.get_operativovigente_empresa(''' + fraEmpresa.mskCUIT.Text + ''')' +
            'AND (AI_VIGENCIAHASTA > art.hys.get_operativovigente_empresa(''' + fraEmpresa.mskCUIT.Text + ''')' +
            '     OR AI_VIGENCIAHASTA IS NULL) ' +
            'AND NOT EXISTS (SELECT 1 ' +
                              'FROM PAN_ANEXO2 ' +
                             'WHERE AI_ANEXO = AN_ANEXO ' +
                               'AND AI_CODIGO = AN_CODIGO ' +
                               'AND AN_CUIT = ''' + fraEmpresa.mskCUIT.Text + ''' ' +
                               'AND AN_ESTABLECI = ' + fraEstableciBusq.edCodigo.TextSql + ' ' +
                               'AND AN_OPERATIVO = art.hys.get_operativovigente_empresa(''' + fraEmpresa.mskCUIT.Text + ''')'+ ') ' +}
         'ORDER BY 1, 2';
  sdqlistaitems.Open;
  sdqlistaitems.First;
  cargaAnexo := true;

  while cargaAnexo and not sdqlistaitems.Eof do
  begin
    if (not sdqlistaitems.FieldByName('AN_CUMPLIMIENTO').IsNull) and (sdqlistaitems.FieldByName('AN_CUMPLIMIENTO').AsString <> 'B') Then
    begin
      FidResolucionAnexo := strtoint(Decode(sdqlistaitems.FieldByName('AN_ANEXO').AsString, ['A', 'B', 'C', 'D', 'E', 'F', 'G'], ['0', '1', '2', '0', '0', '1', '2']));
      for i := 0 to tsAnexos.PageCount-1 do
      begin
        if tsAnexos.Pages[i].Tag = FidResolucionAnexo +1 then
         iResolucion := i;
      end;
      auxListView := TListView(tsAnexos.Pages[iResolucion].FindChildControl('listview_'+IntToStr(FidResolucionAnexo+1)));

      cargaAnexo := false;
    end;
    sdqlistaitems.Next;
  end;
  sdqlistaitems.First;

  if Assigned(auxListView) then
  begin
    while not sdqlistaitems.Eof do
    begin
      idItemAnexo := sdqlistaitems.fieldbyname('AN_CODIGO').AsInteger;
      y := 0;
      cargaAnexo := true;
      while  cargaanexo and (y <= auxListView.Items.Count-1)  do
      begin
        if Assigned(auxListView.Items[y].Data) then
          if (strtoint(auxListView.Items[y].caption) = idItemAnexo) and not(auxListView.Items[y].ImageIndex in [IMG_READONLY, IMG_CATEGORIA] )then
          begin
            auxListView.Items[y].ImageIndex := strtoint(decode( sdqlistaitems.fieldbyname('AN_CUMPLIMIENTO').AsString, ['','S','N','X','P'],['-1','0','1','2','1']));
            y := auxListView.Items.Count;
            cargaAnexo := false;
          end;
          y:= y + 1;
      end;
      sdqlistaitems.Next;
    end;
  end;

  fechaRecepcion := ValorSqlDateTime(
    ' SELECT ca_fecharecepcion '+
    '   FROM art.pca_cabeceraanexo2 '+
    '  WHERE ca_cuit = '+SqlValue(fraEmpresa.mskCUIT.Text)+
    '    AND ca_estableci = '+SqlValue(fraEstableciBusq.edCodigo.Text)+
    '    AND ca_operativo = art.hys.get_operativovigente_empresa(ca_cuit)');
  edES_EMPLEADOS.Text := ValorSql(' SELECT et_item4 '+
                                  '   FROM art.pet_empresastestigo '+
                                  '  WHERE et_cuit = '+ SqlValue(fraEmpresa.CUIT) +
                                  '    AND et_estableci = '+SqlValue(fraEstableciBusq.edCodigo.text)+
                                  '    AND et_tipo = ''ET'' '+
                                  '    AND et_operativo = art.hys.get_operativovigente_empresa(et_cuit)');
  edFechaRecepcion.Tag := trunc(fechaRecepcion);
  edFechaRecepcion.Date := fechaRecepcion;
  tsAnexos.ActivePageIndex := iResolucion;
end;

end.
