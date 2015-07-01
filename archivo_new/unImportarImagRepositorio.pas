unit unImportarImagRepositorio;

interface
                        
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, JvExExtCtrls, JvSplitter,
  JvExComCtrls, JvProgressBar, Mask, PatternEdit, IntEdit, unArtFrame,
  unFraFiltroArchivo, unArt, ComboEditor, CheckCombo, DBCheckCombo, Menus,
  unFraVistaTIFF, unArtDBAwareFrame, unFraCodigoDescripcion, FolderDialog,
  ImgList, RxPlacemnt, RxColors, unArmadoSQL;

type
  TfrmImportarImagRepositorio = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    gbErrores: TGroupBox;
    edErrores: TMemo;
    gbWarnings: TGroupBox;
    edWarnings: TMemo;
    tbCargarArchivo: TToolButton;
    jvpgProgreso: TJvProgressBar;
    gbResumen: TGroupBox;
    Label1: TLabel;
    edCantReg: TIntEdit;
    Label2: TLabel;
    edCantWarnings: TIntEdit;
    Label3: TLabel;
    edCantErrores: TIntEdit;
    fraFiltroArchivoImpo: TfraFiltroArchivo;
    gbFiltroErrores: TGroupBox;
    cmbErrores: TDBCheckCombo;
    sdqErrores: TSDQuery;
    dsErrores: TDataSource;
    gbFiltroWarnings: TGroupBox;
    cmbWarnings: TDBCheckCombo;
    sdqWarnings: TSDQuery;
    dsWarnings: TDataSource;
    rgVerRegistros: TRadioGroup;
    tbImportar: TToolButton;
    lbImportar: TLabel;
    pnlColores: TPanel;
    Label4: TLabel;
    shpOK: TShape;
    shpError: TShape;
    label10: TLabel;
    shpWarning: TShape;
    label11: TLabel;
    shpErrWarn: TShape;
    label12: TLabel;
    tbVerImagen: TToolButton;
    ToolButton7: TToolButton;
    tmrImagenes: TTimer;
    fpImagen: TFormPanel;
    fraVistaTIFFImg: TfraVistaTIFF;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lblCodigoDocumento: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    fraTipoDocumentoEdic: TfraCodigoDescripcion;
    edLoteEdic: TIntEdit;
    edObservacionesEdic: TMemo;
    edDocumentoEdic: TPatternEdit;
    edHojaEdic: TIntEdit;
    edLegajoEdic: TIntEdit;
    edNroOperGT: TPatternEdit;
    chkAgregarObservEdic: TCheckBox;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    Label8: TLabel;
    edRemitoEdic: TIntEdit;
    tbRevalidar: TToolButton;
    chkOrigenProblART: TCheckBox;
    tbReCargarDatos: TToolButton;
    ToolButton10: TToolButton;
    fpReCargarDatos: TFormPanel;
    Bevel1: TBevel;
    btnAceptarReCargarDatos: TButton;
    btnCancelarReCargarDatos: TButton;
    sdqDatosReCarga: TSDQuery;
    dsDatosReCarga: TDataSource;
    dbgDatosReCarga: TArtDBGrid;
    Label16: TLabel;
    fdDialog: TFolderDialog;
    tbAltaSegErroresUsuarios: TToolButton;
    ToolButton13: TToolButton;
    tbRevalidarParcial: TToolButton;
    ToolButton1: TToolButton;
    tbRevalidarRegistro: TToolButton;
    ToolButton9: TToolButton;
    gbSecuencia: TGroupBox;
    edSecDesde: TIntEdit;
    lblHastaNroLote: TLabel;
    edSecHasta: TIntEdit;
    chkSoloNoModif: TCheckBox;
    tbPrepararLote: TToolButton;
    GroupBox1: TGroupBox;
    cmbLotes: TDBCheckCombo;
    sdqLotes: TSDQuery;
    dsLotes: TDataSource;
    tbPrepararRemito: TToolButton;
    tbDocsArchivo: TToolButton;
    ToolButton12: TToolButton;
    tbConsultaCarpetas: TToolButton;
    chkValidacionReducida: TCheckBox;
    tbCartasDoc: TToolButton;
    ilColorRepos: TImageList;
    ilByNRepos: TImageList;
    tbRepos: TToolBar;
    tbMaximizarImagen: TToolButton;
    Label17: TLabel;
    edCantRegGrilla: TIntEdit;
    pmnuExportar: TPopupMenu;
    mnuExportarGrilla: TMenuItem;
    mnuExportarCajaExpo: TMenuItem;
    tbValidarCargaCD: TToolButton;
    pmnuPreparaLote: TPopupMenu;
    pmnuPreparaLotePorLote: TMenuItem;
    pmnuPreparaLotePorSecTrazabil: TMenuItem;
    lblSecTrazabilidad: TLabel;
    edSecuenciaTrazEdic: TIntEdit;
    pmnuEliminar: TPopupMenu;
    pmnuBajaRegistros: TMenuItem;
    pmnuLimpiarCampos: TMenuItem;
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbImprimirClick(Sender: TObject);
    procedure sdqConsultaEWGetTextOrig(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure sdqConsultaEWGetTextSN(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbCargarArchivoClick(Sender: TObject);
    procedure cmbChange(Sender: TObject);
    procedure tbImportarClick(Sender: TObject);
    procedure Exportar(Sender: TObject);
    procedure tbVerImagenClick(Sender: TObject);
    procedure tmrImagenesTimer(Sender: TObject);
    procedure fpImagenShow(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure fraTipoArchivoEdicPropiedadesChange(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbRevalidarClick(Sender: TObject);
    procedure chkOrigenProblARTClick(Sender: TObject);
    procedure tbReCargarDatosClick(Sender: TObject);
    procedure fpReCargarDatosEnter(Sender: TObject);
    procedure btnAceptarReCargarDatosClick(Sender: TObject);
    procedure tbAltaSegErroresUsuariosClick(Sender: TObject);
    procedure tbRevalidarParcialClick(Sender: TObject);
    procedure tbRevalidarRegistroClick(Sender: TObject);
    procedure edSecDesdeExit(Sender: TObject);
    procedure tbPrepararRemitoClick(Sender: TObject);
    procedure tbDocsArchivoClick(Sender: TObject);
    procedure tbConsultaCarpetasClick(Sender: TObject);
    procedure tbCartasDocClick(Sender: TObject);
    procedure tbMaximizarImagenClick(Sender: TObject);
    procedure fraVistaTIFFImgtbMaxMinimizarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure mnuExportarGrillaClick(Sender: TObject);
    procedure mnuExportarCajaExpoClick(Sender: TObject);
    procedure tbValidarCargaCDClick(Sender: TObject);
    procedure pmnuPreparaLotePorLoteClick(Sender: TObject);
    procedure tbPrepararLoteClick(Sender: TObject);
    procedure pmnuPreparaLotePorSecTrazabilClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pmnuBajaRegistrosClick(Sender: TObject);
    procedure pmnuLimpiarCamposClick(Sender: TObject);
  private
    pbExisteNroMedioReposit, pbImportacionOK, pbIsPrinting, pbCargarImagenes: Boolean;
    pbOrigenProblARTModif: Boolean;
    pTipoArchivoSeleccionado: TTableId;
    psPathArchivoImportacion: String;
    fraFiltroArchivoEdic: TFraFiltroArchivo;
    procedure CalcTotales;
    procedure DoValidarRegistro(ValidarImagen: Boolean; PathArchivoImportacion: String; qry: TSDQuery; ExisteNroMedioReposit: Boolean; var Warnings, Errores: Integer);
    function DoValidarArchivoWarning: Boolean;
    procedure DoValidarArchivoError;
    procedure DoCargarCodigoError(IdRepositorio: TTableId; Codigo: String; var Warnings, Errores: Integer);
    procedure DoArmarErrores(IdRepositorio: TTableId);
    procedure DoCargarComboFiltroLote(Where: String);
    procedure DoCargarCombosFiltros;
    function IsArchivoValido(CantReg, Warnings, Errores: Integer): Boolean;
    function IsPermitirImportar(CantReg, Warnings, Errores: Integer): Boolean;
    procedure DoMigrar(PathArchivoImportacion: String; qry: TSDQuery; ExisteNroMedioReposit: Boolean);
    function Get_PathArchivoImportacion: String;
    function DoCopiarArchivo(IdTipoArchivo: TTableId; NroMedio: Integer; PathArchivoImportacion, PathArchivo, Archivo: String; var CarpetaOrig, CarpetaDest: String): Boolean;
    procedure DoBorrarNroMedio(NroMedio: Integer; IdTipoArchivo: TTableId);
    procedure ResetearTimer;
    procedure MostrarImagen(PathImagen: String);
    procedure DoLimpiarInfoResumen(LimpiarCantRegGrilla: Boolean = False);
    procedure DoLimpiarDatosEdicion;
    function DoValidarDatosModificacionSeleccionados(var TipoArchivoSeleccionado: TTableId): Boolean;  protected
    function DoValidarDatosModificacionIngresados: Boolean;
    procedure DoGuardarDatosModificacionIngresados;
    procedure DoValidarArchivoCompleto(ValidarImagen, PreguntarExisteCD: Boolean);
    procedure DoActualizarDatosRevalidacion(LimpiarInfoResumen: Boolean);
    procedure DoGenerarEroresUsuarios;
    function GetCodigoProblemaART(IdImpoRepositorioArchivo: TTableId): String;
    procedure DoReCargarDatos(NroMedio: Integer; Usuario: String);
    procedure DoInsertarDatosTemporal(NroMedio: Integer; Usuario: String);
    function GetListaCodigosProblemaART(IdImpoRepositorioArchivo: TTableId): String;
    procedure DoSetearDatosArchivoEntrada;
    procedure DoRevalidarArchivo(ValidarImagen: Boolean);
    procedure DoRevalidarRegActual(ValidarImagen: Boolean; var Warnings, Errores: Integer);
    procedure DoLimpiarCombosWarningError;
    procedure DoAnalizarValidacion(var Continuar, ValidarImagen: Boolean);
    procedure RefreshData; override;
    function IsValidarCodigo(Codigo: String; Validar: Boolean): Boolean;
    function GetObservacionesErrorUsuario(Clave, Documento: String): String;
    procedure DoMostrarImagen;
    function IsArchivoConSecTrazabilidad: Boolean;
    procedure DoEliminarRegistros;
    procedure DoLimpiarCamposRegistros;
    function IsValidarEliminar: Boolean;
    function GetDatosSql: aDatosSql;
    function Is_ExisteNroMedioEnTemporal(NroMedio: Integer; var Usuarios: String): Boolean;
  public
  end;

  THackDBGrid = Class(TArtDBGrid);

const
  CAMPOOK          = 'OK';
  CAMPOWARNING     = 'WARNING';
  CAMPOERROR       = 'ERROR';
  CAMPOPROCESADO   = 'PROCESADO';
  MAXCOLS          = 5;
  CAMPOS_SUMA      : Array [0..MAXCOLS] of String = (CAMPOOK, CAMPOWARNING, CAMPOERROR, 'CANTWARNINGS', 'CANTERRORES', CAMPOPROCESADO);
  MAXCOLS_OPT      = 5;
  CAMPOS_OPT       : Array [0..MAXCOLS_OPT, 0..1] of String = (('IR_LEGAJO', 'Legajo'), ('IR_NRODOCUMENTO', 'Nro. Carta Doc.'), ('IR_HOJA', 'Nro. Hoja'), ('IR_NROOPERACION_GT', 'Nro. Oper. Giro/Transf.'), ('IR_OBSERVACIONES', 'Observaciones'), ('IR_SECUENCIATRAZABIL', 'Sec. Trazabilidad'));
  FONTNAMETILDE    : String  = 'Wingdings';
  FONTSIZETILDE    : Integer = 12;
  COLOR_OK         = clHtmPink3;
  COLOR_OK_TEXTO   = clGreen;
  COLOR_WARNING    = clRxDarkYellow;
  COLOR_ERROR      = TColor($6C6CFF);
  COLOR_ERRWARN    = TColor($73B9FF);
  CANTREGACT       = 100;
  OBSERRORESUSU    = 'Generado desde Importación de Imágenes al Repositorio';

  MINLOTEREMOBLIG  = 100000;
  MAXREGISTROSARCH = 10000;
  MAXPORCWARNINGS  = 20;

var
  frmImportarImagRepositorio: TfrmImportarImagRepositorio;
  TotalConsulta: Array of Extended;

implementation

{$R *.dfm}

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unSesion, unComunes, DbFuncs, General,
  StrFuncs, unImpoExpoWizard, unImageFunctions, unUtilsArchivo, unComunesArchivo,
  unArchivo, unDigitalizacion, ArchFuncs, unTesoreria, unConstantArchivo, SqlFuncs,
  VCLExtra, unSeguimientoErroresUsuarios, unFrmArmadoLote, unFrmArmadoRemito,
  unManRAD_ARCHIVODOCUMENTO, unFrmConsultaCarpetas, unConsultaCartasDoc;

procedure TfrmImportarImagRepositorio.RefreshData;
var
  sError, sWarn, sWhere, sWhereLote, sSql: String;
  bConError, bConWarn: Boolean;
begin
  if pbImportacionOK then
    begin
      edWarnings.Clear;
      edErrores.Clear;

      bConError := False;
      bConWarn  := False;

      sSql := 'SELECT IR_CODARCHIVO CODARCHIVO, IR_CLAVE CLAVE, IR_CODDOCUMENTO CODDOCUMENTO, ' +
                     'IR_NROMEDIO NROMEDIO, IR_LOTE LOTE, IR_REMITO REMITO, IR_CAJAADMIN CAJAADMIN, ' +
                     'IR_PATHARCHIVO PATHARCHIVO, IR_ARCHIVO ARCHIVO, IR_OBSERVACIONES OBSERVACIONES, ' +
                     '(CASE WHEN IR_ERRORES IS NULL AND IR_WARNINGS IS NULL THEN 1 ELSE 0 END) ' + CAMPOOK + ', ' +
                     'DECODE(IR_ERRORES, NULL, 0, 1) ' + CAMPOERROR + ', ' +
                     'DECODE(IR_WARNINGS, NULL, 0, 1) ' + CAMPOWARNING + ', IR_ERRORES ERRORES, ' +
                     'IR_WARNINGS WARNINGS, IR_CANTERRORES CANTERRORES, IR_CANTWARNINGS CANTWARNINGS, IR_ID IRID, ' +
                     'IR_NRODOCUMENTO NRODOCUMENTO, IR_HOJA HOJA, IR_LEGAJO LEGAJO, ' +
                     'IR_NROOPERACION_GT NROOPERACION_GT, TA_ID TIPOARCHIVO, IR_PROBLEMAART PROBLEMAART, ' +
                     'TB_DESCRIPCION DESCRPROBLEMAART, DECODE(IR_PROCESADO, ''S'', 1, 0) ' + CAMPOPROCESADO + ', ' +
                     'IR_SECUENCIA SECUENCIA, ARCHIVO.GET_LISTACODDOCCLAVELOTE(IR_CLAVE, IR_LOTE) CODDOCS_CLAVELOTE, ' +
                     'IR_VALIDACIONREDUCIDA VALIDACIONREDUCIDA, IR_SECUENCIATRAZABIL SECUENCIATRAZABIL ' +
                'FROM CTB_TABLAS, ARCHIVO.RTA_TIPOARCHIVO, TIR_IMPOREPOSITORIOARCHIVO ' +
               'WHERE IR_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
                 'AND IR_CODARCHIVO = TA_CODIGO(+) ' +
                 'AND TB_CLAVE(+) = ''REAGA'' ' +
                 'AND TB_CODIGO(+) = IR_CODPROBLEMAART';

      sWhereLote := '';
      sWhere     := SqlBetween(' AND IR_SECUENCIA ', edSecDesde.Value, edSecHasta.Value);

      case rgVerRegistros.ItemIndex of
        0: begin
             bConError := True;
             bConWarn  := False;
           end;

        1: begin
             bConError := False;
             bConWarn  := True;
           end;

        3: begin
             bConError := True;
             bConWarn  := True;
           end;

        2: sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                             'FROM TIE_IMPOREPOSARCH_ERROR ' +
                                            'WHERE IR_ID = IE_IDIMPOREPOSITORIOARCHIVO)';
      end;

      case rgVerRegistros.ItemIndex of
        0, 1, 3: begin
                   sError := ' AND' + Iif(bConError, '', ' NOT') + ' EXISTS (SELECT 1 ' +
                                                                              'FROM TIE_IMPOREPOSARCH_ERROR ' +
                                                                             'WHERE IR_ID = IE_IDIMPOREPOSITORIOARCHIVO ' +
                                                                               'AND SUBSTR(IE_CODERROR, 1, 1) = ''E'')';

                   sWarn := ' AND' + Iif(bConWarn, '', ' NOT') + ' EXISTS (SELECT 1 ' +
                                                                              'FROM TIE_IMPOREPOSARCH_ERROR ' +
                                                                             'WHERE IR_ID = IE_IDIMPOREPOSITORIOARCHIVO ' +
                                                                               'AND SUBSTR(IE_CODERROR, 1, 1) = ''W'')';

                   sWhere := sWhere + sError + sWarn;
                 end;
      end;

      if InStr(cmbWarnings.InSql, '-9999') = 0 then
        if cmbWarnings.Text <> '' then
          sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                            'FROM TIE_IMPOREPOSARCH_ERROR ' +
                                           'WHERE IR_ID = IE_IDIMPOREPOSITORIOARCHIVO ' +
                                             'AND IE_CODERROR ' + cmbWarnings.InSql + ' ' +
                                             'AND SUBSTR(IE_CODERROR, 1, 1) = ''W'')';

      if InStr(cmbErrores.InSql, '-9999') = 0 then
        if cmbErrores.Text <> '' then
          sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                            'FROM TIE_IMPOREPOSARCH_ERROR ' +
                                           'WHERE IR_ID = IE_IDIMPOREPOSITORIOARCHIVO ' +
                                             'AND IE_CODERROR ' + cmbErrores.InSql + ' ' +
                                             'AND SUBSTR(IE_CODERROR, 1, 1) = ''E'')';

      if InStr(cmbLotes.InSql, '-9999') = 0 then
        if cmbLotes.Text <> '' then
          sWhereLote := ' AND IR_LOTE ' + cmbLotes.InSql;

      if chkSoloNoModif.Checked then
        sWhere := sWhere + ' AND IR_PROCESADO = ''N''';

      sdqConsulta.Sql.Text := sSql + sWhere + sWhereLote + NVL(SortDialog.OrderBy, ' ORDER BY IR_SECUENCIA');
      inherited;

      DoCargarComboFiltroLote(sWhere);
        
      CalcTotales;
    end;
end;

procedure TfrmImportarImagRepositorio.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        begin
          SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
          edCantRegGrilla.Value := sdqConsulta.RecordCount;
        end
      else
        edCantRegGrilla.Value := 0; 
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmImportarImagRepositorio.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmImportarImagRepositorio.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
end;

procedure TfrmImportarImagRepositorio.FormCreate(Sender: TObject);
var
  i: Integer;
  sCampo: String;
begin
  inherited;
  ShowActived := False;

  pbIsPrinting            := False;
  pbImportacionOK         := False;
  pbExisteNroMedioReposit := False;
  pbCargarImagenes        := False;

  SetLength(TotalConsulta, MAXCOLS + 1);

  fraFiltroArchivoEdic := TFraFiltroArchivo.Create(Self);
  with fraFiltroArchivoEdic do
    begin
      Parent   := fpAbm;
      Align    := alNone;
      TabOrder := 0;
      Left     := 28;
      Top      := 28;
      Width    := 514;
      Height   := 102;
      fraTipoArchivo.Propiedades.ExtraCondition :=
        fraTipoArchivo.Propiedades.ExtraCondition + ' AND TA_TIENEREPOSITORIO = ''S'' ';
      fraTipoArchivo.Propiedades.OnChange := fraTipoArchivoEdicPropiedadesChange;
    end;

  with fraTipoDocumentoEdic do
    begin
      TableName   := 'RTD_TIPODOCUMENTO';
      FieldID     := 'TD_ID';
      FieldCodigo := 'TD_CODIGO';
      FieldDesc   := 'TD_DESCRIPCION';
      FieldBaja   := 'TD_FECHABAJA';
      ShowBajas   := False;
    end;

  fraTipoArchivoEdicPropiedadesChange(nil);

  with fraVistaTiffImg do
    begin
      DataSource                := dsConsulta;
      PanelAuxVisible           := True;
      DataSourceUsarRecordCount := False;
    end;

  for i := 1 to 3 do
    begin
      case i of
        1: sCampo := CAMPOOK;
        2: sCampo := CAMPOWARNING;
        3: sCampo := CAMPOERROR;
      end;

      Grid.ColumnByField[sCampo].Font.Charset := SYMBOL_CHARSET;
      Grid.ColumnByField[sCampo].Font.Name    := FONTNAMETILDE;
      Grid.ColumnByField[sCampo].Font.Size    := FONTSIZETILDE;
    end;

  with Grid.ColumnByField[CAMPOPROCESADO].Font do
    begin
      Charset := SYMBOL_CHARSET;
      Name    := FONTNAMETILDE;
      Size    := FONTSIZETILDE;
    end;

  edCantWarnings.Color  := COLOR_WARNING;
  edCantErrores.Color   := COLOR_ERROR;
  edWarnings.Font.Color := COLOR_WARNING;
  edErrores.Font.Color  := COLOR_ERROR;

  shpOK.Brush.Color      := COLOR_OK;
  shpError.Brush.Color   := COLOR_ERROR;
  shpWarning.Brush.Color := COLOR_WARNING;
  shpErrWarn.Brush.Color := COLOR_ERRWARN;

  VCLExtra.LockControl(chkOrigenProblART, GetPerfilGuardaYDigitalizacion());
  VCLExtra.LockControl(chkValidacionReducida, not (Seguridad.Claves.IsActive('SuperValidador') and GetPerfilAdministrador()));
end;

procedure TfrmImportarImagRepositorio.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  i: Integer;
  sCampo: String;
begin
  VCLExtra.DynColWidthsByData(Grid, 200, True, False, [fsBold]);
  inherited;

  with DataSet do
    begin
      if not IsEmpty then
        for i := 1 to 3 do
          begin
            case i of
              1: sCampo := CAMPOOK;
              2: sCampo := CAMPOWARNING;
              3: sCampo := CAMPOERROR;
            end;

            if Assigned(FieldByName(sCampo))then
              if pbIsPrinting then
                begin
                  Grid.ColumnByField[sCampo].Font.Charset := Grid.ColumnByField['CLAVE'].Font.Charset;
                  Grid.ColumnByField[sCampo].Font.Name    := Grid.ColumnByField['CLAVE'].Font.Name;
                  Grid.ColumnByField[sCampo].Font.Size    := Grid.ColumnByField['CLAVE'].Font.Size;
                  FieldByName(sCampo).OnGetText := sdqConsultaEWGetTextSN;
                end
              else
                begin
                  Grid.ColumnByField[sCampo].Font.Charset := SYMBOL_CHARSET;
                  Grid.ColumnByField[sCampo].Font.Name    := FONTNAMETILDE;
                  Grid.ColumnByField[sCampo].Font.Size    := FONTSIZETILDE;
                  FieldByName(sCampo).OnGetText := sdqConsultaEWGetTextOrig;
                end;
          end;

        if Assigned(FieldByName(CAMPOPROCESADO))then
          with Grid.ColumnByField[CAMPOPROCESADO].Font do
            if pbIsPrinting then
              begin
                Charset := Grid.ColumnByField['CLAVE'].Font.Charset;
                Name    := Grid.ColumnByField['CLAVE'].Font.Name;
                Size    := Grid.ColumnByField['CLAVE'].Font.Size;
                FieldByName(CAMPOPROCESADO).OnGetText := sdqConsultaEWGetTextSN;
              end
            else
              begin
                Charset := SYMBOL_CHARSET;
                Name    := FONTNAMETILDE;
                Size    := FONTSIZETILDE;
                FieldByName(CAMPOPROCESADO).OnGetText := sdqConsultaEWGetTextOrig;
              end;
    end;
end;

procedure TfrmImportarImagRepositorio.tbImprimirClick(Sender: TObject);
begin
  sdqConsulta.DisableControls;
  pbIsPrinting := True;
  RefreshData;

  try
    inherited tbImprimirClick(nil);
  finally
    sdqConsulta.EnableControls;
    pbIsPrinting := False;
    RefreshData;
  end;
end;

procedure TfrmImportarImagRepositorio.sdqConsultaEWGetTextOrig(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := vSi
  else
    Text := '';
end;

procedure TfrmImportarImagRepositorio.sdqConsultaEWGetTextSN(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := 'S'
  else
    Text := '';
end;

procedure TfrmImportarImagRepositorio.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if sdqConsulta.RecordCount > 1 then
    begin
      with THackDBGrid(Grid) do
        if DataLink.ActiveRecord = Row - 1 then
          begin
            Canvas.Brush.Color := clSkyBlue;
            Canvas.Font.Style  := Canvas.Font.Style + [fsBold];
          end;

      Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Grid.Canvas.DrawFocusRect(Rect);
    end
  else
    inherited;
end;

procedure TfrmImportarImagRepositorio.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  bError, bWarning: Boolean;
begin
  inherited;

  if Field.FieldName <> 'CODDOCS_CLAVELOTE' then
    begin
      bError   := (sdqConsulta.FieldByName(CAMPOERROR).AsInteger = 1);
      bWarning := (sdqConsulta.FieldByName(CAMPOWARNING).AsInteger = 1);

      if bError and not bWarning then
        Background := COLOR_ERROR
      else if bWarning and not bError then
        Background := COLOR_WARNING
      else if bError and bWarning then
        Background := COLOR_ERRWARN
      else
        Background := COLOR_OK;

      (*if Highlight then
        AFont.Color := clBlack
      else
        AFont.Color := clNavy;*)
    end;
end;

procedure TfrmImportarImagRepositorio.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edErrores.Lines.Text  := sdqConsulta.FieldByName('ERRORES').AsString;
  edWarnings.Lines.Text := sdqConsulta.FieldByName('WARNINGS').AsString;
  ResetearTimer;
end;

procedure TfrmImportarImagRepositorio.DoLimpiarInfoResumen(LimpiarCantRegGrilla: Boolean = False);
begin
  edCantReg.Value      := 0;
  edCantWarnings.Value := 0;
  edCantErrores.Value  := 0;
  lbImportar.Caption   := '';

  if LimpiarCantRegGrilla then
    edCantRegGrilla.Value  := 0;

  tbRevalidar.Enabled         := False;
  tbRevalidarParcial.Enabled  := False;
  tbRevalidarRegistro.Enabled := False;
end;

procedure TfrmImportarImagRepositorio.DoLimpiarCombosWarningError;
begin
  sdqWarnings.Sql.Text := 'SELECT ''-9999'' COD, ''[ Todos ]'' DESCR ' +
                            'FROM DUAL ' +
                           'WHERE 1 = 2';
  sdqWarnings.Open;

  sdqErrores.Sql.Text := sdqWarnings.Sql.Text;
  sdqErrores.Open;

  sdqLotes.Sql.Text := 'SELECT ''-9999'' LOTE, ''[ Todos ]'' DESCRLOTE ' +
                         'FROM DUAL ' +
                        'WHERE 1 = 2';
  sdqLotes.Open;
end;

procedure TfrmImportarImagRepositorio.tbLimpiarClick(Sender: TObject);
begin
  if MsgBox('Se borrarán todos los datos en pantalla. ¿Confirma la acción?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      inherited;

      pbImportacionOK         := False;
      pbExisteNroMedioReposit := False;

      edErrores.Clear;
      edWarnings.Clear;
      rgVerRegistros.ItemIndex   := 4;  // Todos
      tbImportar.Enabled         := False;
      lbImportar.Visible         := False;
      chkSoloNoModif.Checked     := False;
      cmbWarnings.Clear;
      cmbErrores.Clear;
      cmbLotes.Clear;
      edSecDesde.Clear;
      edSecHasta.Clear;

      DoLimpiarInfoResumen(True);
      DoLimpiarCombosWarningError;
    end;
end;

function TfrmImportarImagRepositorio.Is_ExisteNroMedioEnTemporal(NroMedio: Integer; var Usuarios: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT LISTAGG(USUARIO, '', '') WITHIN GROUP (ORDER BY USUARIO) USUARIOS ' +
            'FROM (SELECT DISTINCT IR_USUARIO USUARIO ' +
                    'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
                   'WHERE IR_USUARIO <> :Usuario ' +
                     'AND IR_NROMEDIO = :NroMedio)';
  Usuarios := ValorSqlEx(sSql, [Sesion.UserId, NroMedio]);

  Result := not IsEmptyString(Usuarios);
end;

procedure TfrmImportarImagRepositorio.DoValidarArchivoCompleto(ValidarImagen, PreguntarExisteCD: Boolean);
var
  sUsuarios, sMensaje, sSql: String;
  iNroMedio, i, iWarnings, iErrores: Integer;
  qry: TSDQuery;
  TipoArchivo: TTableId;
  bArchivoValido, bArchivoOK, bValidarImagen, bAdministrador, bValidarArchivoWarning, bImportar: Boolean;

  function GetMensaje(NroMedio: Integer; TipoArchivoCD, TipoArchivoRepositorio: TTableId): String;
  var
    sMens: String;
  begin
    sMens := 'El CD (nro. ' + Trim(IntToStr(NroMedio)) + ') ya existe en el repositorio.';

    if (NroMedio >= MINROMEDIO) and (TipoArchivoCD <> TipoArchivoRepositorio) then
      sMens := sMens + ' Además, el tipo de archivo del CD (' + Get_DescripcionTipoArchivo(TipoArchivoCD) + ') ' +
                       'no coincide con el tipo de archivo del repositorio (' + Get_DescripcionTipoArchivo(TipoArchivoRepositorio) + ').';

    Result := sMens;
  end;
begin
  DoLimpiarInfoResumen(True);
  DoLimpiarCombosWarningError;
  sdqConsulta.Close;

  pbImportacionOK         := False;
  pbExisteNroMedioReposit := False;

  DoValidarArchivoError();
  bValidarArchivoWarning := DoValidarArchivoWarning();

  jvpgProgreso.Visible := True;
  try
    // estos campos deben llamarse igual que los campos en el RefreshData
    sSql := 'SELECT IR_ID IRID, IR_CODARCHIVO CODARCHIVO, IR_CLAVE CLAVE, IR_CODDOCUMENTO CODDOCUMENTO, ' +
                   'IR_NROMEDIO NROMEDIO, IR_LOTE LOTE, IR_REMITO REMITO, IR_CAJAADMIN CAJAADMIN, ' +
                   'IR_PATHARCHIVO PATHARCHIVO, IR_ARCHIVO ARCHIVO, IR_NRODOCUMENTO NRODOCUMENTO, ' +
                   'IR_HOJA HOJA, IR_LEGAJO LEGAJO, IR_NROOPERACION_GT NROOPERACION_GT, ' +
                   'IR_VALIDACIONREDUCIDA VALIDACIONREDUCIDA, IR_SECUENCIATRAZABIL SECUENCIATRAZABIL, ' +
                   'TA_ID TIPOARCHIVO ' +
              'FROM ARCHIVO.RTA_TIPOARCHIVO, TIR_IMPOREPOSITORIOARCHIVO ' +
             'WHERE IR_USUARIO = :Usuario ' +
               'AND IR_CODARCHIVO = TA_CODIGO(+)';
    qry := GetQueryEx(sSql, [Sesion.UserId]);

    with qry do
      try
        if not Eof then
          begin
            iNroMedio               := FieldByName('NROMEDIO').AsInteger;
            pbExisteNroMedioReposit := Is_ExisteNroMedioEnRepositorio(iNroMedio, TipoArchivo);
            if pbExisteNroMedioReposit then
              begin
                sMensaje := GetMensaje(iNroMedio, FieldByName('TIPOARCHIVO').AsInteger, TipoArchivo);

                if PreguntarExisteCD then
                  begin
                    if MsgBox(sMensaje + ' ¿Desea continuar?', MB_ICONINFORMATION+MB_YESNO) = ID_NO then
                      Exit;
                  end
                else
                  MsgBox(sMensaje, MB_ICONINFORMATION);
              end;

            if not pbExisteNroMedioReposit and Is_ExisteNroMedioEnTemporal(iNroMedio, sUsuarios) then
              if MsgBox('El CD (nro. ' + Trim(IntToStr(iNroMedio)) + ') ha sido o está siendo procesado en forma temporal por alguno de los siguientes usuarios: ' + sUsuarios + '.' + CRLF + '¿Desea continuar?', MB_ICONINFORMATION+MB_YESNO) = ID_NO then
                Exit;

            psPathArchivoImportacion := Get_PathArchivoImportacion();

            i         := 0;
            iWarnings := 0;
            iErrores  := 0;

            bAdministrador := GetPerfilAdministrador();
            bValidarImagen := bAdministrador and ValidarImagen;

            with jvpgProgreso do
              begin
                Min := 1;
                Max := RecordCount;
              end;

            while not Eof do
              begin
                Inc(i);
                jvpgProgreso.Position := i;

                DoValidarRegistro(bValidarImagen, psPathArchivoImportacion, qry, pbExisteNroMedioReposit, iWarnings, iErrores);

                edCantReg.Value      := i;
                edCantWarnings.Value := iWarnings;
                edCantErrores.Value  := iErrores;

                if ((i-1) Mod CANTREGACT) = 0 then
                  Application.ProcessMessages;

                Next;
              end;

            bArchivoOK         := bValidarArchivoWarning and IsArchivoValido(edCantReg.Value, iWarnings, iErrores);
            bArchivoValido     := bValidarArchivoWarning and IsPermitirImportar(edCantReg.Value, iWarnings, iErrores);
            bImportar          := bArchivoValido and bValidarImagen and bAdministrador;

            tbImportar.Enabled := Seguridad.Activar(tbImportar) and bImportar;
            with lbImportar do
              begin
                Caption    := '*** ARCHIVO ' + Iif(bArchivoOK, 'VALIDO', 'INVALIDO') + ' ***';
                Font.Color := TColor(Iif(bArchivoOK, COLOR_OK_TEXTO, COLOR_ERROR));
                Visible    := True;
              end;

            if not bArchivoOK and tbImportar.Enabled then
              MsgBox('A pesar de que el archivo se encuentra INVALIDO, se ha habilitado el botón para Importar al Repositorio.', MB_ICONINFORMATION);

            if bArchivoValido and not bValidarImagen and bAdministrador then
              begin
                MsgBox('No se ha habilitado el botón para Importar al Repositorio ya que no ha verificado las imágenes del archivo.', MB_ICONINFORMATION);
                tbRevalidar.Enabled := True;
              end;

            Application.ProcessMessages;
          end;
      finally
        Free;
      end;

    pbImportacionOK := True;
    DoCargarCombosFiltros;
    RefreshData;
  finally
    jvpgProgreso.Visible := False;
  end;
end;

procedure TfrmImportarImagRepositorio.DoSetearDatosArchivoEntrada;
var
  sUsaPatch, sSql: String;
  i: Integer;
begin
  Application.ProcessMessages;
  jvpgProgreso.Visible := True;
  try
    sSql := 'SELECT IR_ID IRID, IR_CODARCHIVO CODARCHIVO ' +
              'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
             'WHERE IR_USUARIO = :Usuario ' +
          'ORDER BY IR_ID';

    with GetQueryEx(sSql, [Sesion.UserId]) do
      try
        if not Eof then
          begin
            with jvpgProgreso do
              begin
                Min := 1;
                Max := RecordCount;
              end;

            i := 0;

            while not Eof do
              begin
                inc(i);
                jvpgProgreso.Position := i;

                if i = 1 then
                  begin
                    if Is_ArchivoPatch(FieldByName('CODARCHIVO').AsString) then
                      sUsaPatch := 'S'
                    else
                      sUsaPatch := 'N';
                  end;

                sSql := 'UPDATE TIR_IMPOREPOSITORIOARCHIVO ' +
                           'SET IR_SECUENCIA = :Secuencia, ' +
                               'IR_SECUENCIATRAZABIL = (CASE WHEN (IR_CODDOCUMENTO = :CodDocLote AND IR_SECUENCIATRAZABIL < :MinNroSecTraz) ' +                            // esto es porque el scanner lee el código de barras con el nro. de lote,
                                                              'OR (:UsaPatch = ''S'' AND ARCHIVO.IS_EXISTESECTRAZABIL(IR_SECUENCIATRAZABIL, ''N'') = ''N'') THEN NULL ' +  // o porque para los tipos de arch. que usan patch, cuando encuentra un doc. dentro del bloque del patch que viene también con un cód. de barras, entonces hay problemas porque lo toma como nuevo patch
                                                       'ELSE IR_SECUENCIATRAZABIL ' +
                                                       'END) ' +
                         'WHERE IR_ID = :Id';
                EjecutarSqlEx(sSql, [i, CODDOC_LOTE, MINSECUENCIATRAZABIL, sUsaPatch, FieldByName('IRID').AsInteger]);

                if ((i-1) Mod CANTREGACT) = 0 then
                  Application.ProcessMessages;

                Next;
              end;
          end;
      finally
        Free;
      end;
  finally
    jvpgProgreso.Visible := False;
  end;
end;

procedure TfrmImportarImagRepositorio.DoAnalizarValidacion(var Continuar, ValidarImagen: Boolean);
var
  bAdministrador: Boolean;
  iResp: Integer;
begin
  bAdministrador := GetPerfilAdministrador();

  if bAdministrador then
    begin
       iResp := MsgBox('Se procederá a validar el archivo completo. ¿Desea verificar las imágenes del mismo?' + CRLF + 'Si elige NO, entonces el botón para Importar al Repositorio no se habilitará.', MB_ICONQUESTION+MB_YESNOCANCEL);

       Continuar     := (iResp <> ID_CANCEL);
       ValidarImagen := (iResp = ID_YES);
    end
  else
    begin
       Continuar     := (MsgBox('¿Confirma la validación del archivo completo?', MB_ICONQUESTION+MB_YESNO) = ID_YES);
       ValidarImagen := False;
    end;
end;

procedure TfrmImportarImagRepositorio.tbCargarArchivoClick(Sender: TObject);
var
  bContinuar, bValidarImagen: Boolean;
begin
  psPathArchivoImportacion := '';

  if ImpoExpoWizard('REAGA') then
    begin
      DoAnalizarValidacion(bContinuar, bValidarImagen);

      if bContinuar then
        begin
          DoSetearDatosArchivoEntrada;
          DoValidarArchivoCompleto(bValidarImagen, True);
        end;  
    end;
end;

procedure TfrmImportarImagRepositorio.DoValidarArchivoError;
var
  sSql: String;
  iCantReg: Integer;
begin
  sSql := 'SELECT COUNT(*) ' +
            'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
           'WHERE IR_USUARIO = :Usuario';
  iCantReg := ValorSqlIntegerEx(sSql, [Sesion.UserId]);

  Verificar(iCantReg > MAXREGISTROSARCH, Grid, 'El archivo contiene ' + IntToStr(iCantReg) + ' registros. Se ha superado el límite máximo de ' + IntToStr(MAXREGISTROSARCH) + ' registros.');
end;

function TfrmImportarImagRepositorio.DoValidarArchivoWarning: Boolean;
var
  sSql: String;
  iCantTiposArchivo, iCantNroMedio: Integer;
  bOk: Boolean;
begin
  bOk := True;

  sSql := 'SELECT COUNT(DISTINCT IR_NROMEDIO) ' +
            'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
           'WHERE IR_USUARIO = :Usuario';
  iCantNroMedio := ValorSqlIntegerEx(sSql, [Sesion.UserId]);

  if iCantNroMedio > 1 then
    begin
      MsgBox('Se han encontrado ' + IntToStr(iCantNroMedio) + ' CD''s distintos en todo el archivo.', MB_ICONERROR, 'Cargar Archivo');
      bOk := False;
    end;

  sSql := 'SELECT COUNT(DISTINCT IR_CODARCHIVO) ' +
            'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
           'WHERE IR_USUARIO = :Usuario';
  iCantTiposArchivo := ValorSqlIntegerEx(sSql, [Sesion.UserId]);

  if iCantTiposArchivo > 1 then
    begin
      MsgBox('Se han encontrado ' + IntToStr(iCantTiposArchivo) + ' tipos de archivo distintos en todo el archivo.', MB_ICONERROR, 'Cargar Archivo');
      bOk := False;
    end;

  Result := bOk;
end;

procedure TfrmImportarImagRepositorio.DoValidarRegistro(ValidarImagen: Boolean; PathArchivoImportacion: String; qry: TSDQuery; ExisteNroMedioReposit: Boolean; var Warnings, Errores: Integer);
var
  sArchivo, sPathArchivo, sCodDocumento, sClave, sCodArchivo, sPathImagen: String;
  sClaveCarpetaVirtual, sNroOperGT, sNroCartaDoc: String;
  iLegajo, iNroHoja, iCajaAdmin, iRemito, iLote, iNroMedio: Integer;
  IdTipoDocumento, Id, IdTipoArchivo: TTableId;
  bCodDocumentoOK, bClaveOK, bRemitoObligatorio, bExisteImagen, bImagenOk: Boolean;
  bNroCartaDocNula, bValidacReducida, bValidarTodosCodigos, bEsDocumentoPapelLote: Boolean;
  bPermitirCDocBajas, bExisteClave, bLoteNulo, bNroOperGTNula, bLegajoNulo: Boolean;
  bSecTrazNula: Boolean;
  iSecuenciaTraz: Integer;
begin
  with qry do
    begin
      Id               := FieldByName('IRID').AsInteger;
      sCodArchivo      := FieldByName('CODARCHIVO').AsString;
      sClave           := FieldByName('CLAVE').AsString;
      sCodDocumento    := FieldByName('CODDOCUMENTO').AsString;
      iNroMedio        := FieldByName('NROMEDIO').AsInteger;
      iLote            := FieldByName('LOTE').AsInteger;
      iRemito          := FieldByName('REMITO').AsInteger;
      iCajaAdmin       := FieldByName('CAJAADMIN').AsInteger;
      sPathArchivo     := FieldByName('PATHARCHIVO').AsString;
      sArchivo         := FieldByName('ARCHIVO').AsString;
      sNroCartaDoc     := FieldByName('NRODOCUMENTO').AsString;
      iNroHoja         := FieldByName('HOJA').AsInteger;
      iLegajo          := FieldByName('LEGAJO').AsInteger;
      sNroOperGT       := FieldByName('NROOPERACION_GT').AsString;
      iSecuenciaTraz   := FieldByName('SECUENCIATRAZABIL').AsInteger;
      bValidacReducida := (FieldByName('VALIDACIONREDUCIDA').AsString = 'S');
    end;

  bValidarTodosCodigos := not bValidacReducida;

  if IsEmptyString(sCodArchivo) then
    DoCargarCodigoError(Id, 'E001', Warnings, Errores)
  else
    begin
      IdTipoArchivo := Get_IdTipoArchivoCodigo(sCodArchivo);

      if (IdTipoArchivo = ART_EMPTY_ID) then
        DoCargarCodigoError(Id, 'E002', Warnings, Errores)
      else if not Is_TieneRepositorio(sCodArchivo) then
        DoCargarCodigoError(Id, 'E013', Warnings, Errores)

      else
        begin           
          fraFiltroArchivoImpo.Clear;
          fraFiltroArchivoImpo.Tipo := IdTipoArchivo;

          bEsDocumentoPapelLote := (sCodDocumento = CODDOC_LOTE);
          if bEsDocumentoPapelLote then
            sClaveCarpetaVirtual := Get_ClaveCarpetaVirtual(IdTipoArchivo);

          bClaveOK           := False;
          bPermitirCDocBajas := (IdTipoArchivo = ID_CARPETA_CD) and IsCartaDocCobranzas(sClave);
          bExisteClave       := IsExisteClave(fraFiltroArchivoImpo, IdTipoArchivo, sClave, bPermitirCDocBajas);   // lo hago acá porque esta rutina carga el fraFiltroArchivo con la clave de la carpeta
          
          if IsEmptyString(sClave) then
            DoCargarCodigoError(Id, 'E003', Warnings, Errores)
          else if bEsDocumentoPapelLote and (sClave <> sClaveCarpetaVirtual) and IsValidarCodigo('E032', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E032', Warnings, Errores)
          else if not bEsDocumentoPapelLote and not bExisteClave and IsValidarCodigo('E004', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E004', Warnings, Errores)
          else if not bEsDocumentoPapelLote and (GetIdArchivo(IdTipoArchivo, sClave) = ART_EMPTY_ID) then
            DoCargarCodigoError(Id, 'W001', Warnings, Errores)
          else
            bClaveOK := True;

          bCodDocumentoOK := False;
          if IsEmptyString(sCodDocumento) then
            DoCargarCodigoError(Id, 'E005', Warnings, Errores)
          else
            begin
              IdTipoDocumento := GetIdDocumentoArchivo(IdTipoArchivo, sCodDocumento);
              if (IdTipoDocumento = ART_EMPTY_ID) then
                DoCargarCodigoError(Id, 'E006', Warnings, Errores)
              else
                bCodDocumentoOK := True;
            end;

          if (iNroMedio = 0) and IsValidarCodigo('E007', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E007', Warnings, Errores)
          else if not ExisteNroMedioReposit and (iNroMedio < MINROMEDIO) then      // esto tiene que ser así porque, antes de la migración, el nro. de CD se repetía para distintos tipos de archivo.
            DoCargarCodigoError(Id, 'E014', Warnings, Errores);

          bLoteNulo := (iLote = 0);

          if bLoteNulo and IsValidarCodigo('E015', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E015', Warnings, Errores)
          else if not bLoteNulo and not Is_ExisteLote(iLote) and IsValidarCodigo('E016', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E016', Warnings, Errores)
          else if not bLoteNulo and not ExisteNroMedioReposit and Is_ExisteLoteEnRepositorio(iLote) and IsValidarCodigo('E022', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E022', Warnings, Errores)
          else if not bLoteNulo and not Is_ExisteLoteEnTipoArchivo(iLote, IdTipoArchivo) and IsValidarCodigo('E023', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E023', Warnings, Errores)
          else if not bLoteNulo and bClaveOK and not bEsDocumentoPapelLote and not Is_ExisteClaveArchivoCodDoc_EnLote(IdTipoArchivo, sClave, iLote) then
            DoCargarCodigoError(Id, 'W002', Warnings, Errores)
          else if not bLoteNulo and bClaveOK and bCodDocumentoOK and not bEsDocumentoPapelLote and not Is_ExisteClaveArchivoCodDoc_EnLote(IdTipoArchivo, sClave, iLote, sCodDocumento) then
            DoCargarCodigoError(Id, 'W003', Warnings, Errores);

          bRemitoObligatorio := (iLote >= MINLOTEREMOBLIG);
          if bRemitoObligatorio and (iRemito = 0) and IsValidarCodigo('E017', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E017', Warnings, Errores)
          else if bRemitoObligatorio and not Is_ExisteRemito(iRemito) and IsValidarCodigo('E018', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E018', Warnings, Errores)
          else if bRemitoObligatorio and not Is_ExisteLoteEnRemito(iLote, iRemito) and IsValidarCodigo('E019', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E019', Warnings, Errores);

          if (iCajaAdmin = 0) and IsValidarCodigo('E020', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E020', Warnings, Errores)
          else if (iCajaAdmin < 0) and IsValidarCodigo('E021', bValidarTodosCodigos) then
            DoCargarCodigoError(Id, 'E021', Warnings, Errores);

          if not bEsDocumentoPapelLote then
            begin
              if fraFiltroArchivoImpo.IsTipoCartaDocumento() then
                begin
                  bNroCartaDocNula   := IsEmptyString(sNroCartaDoc);
                  bPermitirCDocBajas := Is_PermitirCartasDocBajas(IdTipoArchivo);

                  if bNroCartaDocNula and IsValidarCodigo('E024', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E024', Warnings, Errores)
                  else if not bNroCartaDocNula and not fraFiltroArchivoImpo.IsCartaDocumentoValida(sNroCartaDoc, nil, False, bPermitirCDocBajas) and IsValidarCodigo('E025', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E025', Warnings, Errores);
                end;

              if fraFiltroArchivoImpo.IsTipoArchivoExtractosBancarios() then
                begin
                  if (iNroHoja = 0) and IsValidarCodigo('E026', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E026', Warnings, Errores)
                  else if (iNroHoja < 0) then
                    DoCargarCodigoError(Id, 'E027', Warnings, Errores);
                end;

              if fraFiltroArchivoImpo.IsTipoArchivoCuentasPagarViaticos() then
                begin
                  bLegajoNulo := (iLegajo = 0);

                  if bLegajoNulo and IsValidarCodigo('E028', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E028', Warnings, Errores)
                  else if not bLegajoNulo and not Is_ExisteLegajo(iLegajo) and IsValidarCodigo('E029', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E029', Warnings, Errores);
                end;

              if fraFiltroArchivoImpo.IsTipoArchivoCajaGirosTransferencias() then
                begin
                  bNroOperGTNula := IsEmptyString(sNroOperGT);

                  if bNroOperGTNula and IsValidarCodigo('E030', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E030', Warnings, Errores)
                  else if not bNroOperGTNula and not Is_ExisteNroOperGT(sNroOperGT) and IsValidarCodigo('E031', bValidarTodosCodigos) then
                    DoCargarCodigoError(Id, 'E031', Warnings, Errores);
                end;

            end;

          bSecTrazNula := (iSecuenciaTraz = 0);

          if not bSecTrazNula then
            begin
              if iSecuenciaTraz <= 0 then
                DoCargarCodigoError(Id, 'E033', Warnings, Errores);
            end;

          if IsUsarSecuenciaTrazabilidad(IdTipoArchivo) then
            begin
             if not bEsDocumentoPapelLote and bSecTrazNula and IsValidarCodigo('E034', bValidarTodosCodigos) then
               DoCargarCodigoError(Id, 'E034', Warnings, Errores)
             else if not bSecTrazNula then
               begin
                 if not Is_ExisteSecTrazabil(iSecuenciaTraz) and IsValidarCodigo('E035', bValidarTodosCodigos) then
                   DoCargarCodigoError(Id, 'E035', Warnings, Errores)
                 else if not bEsDocumentoPapelLote then
                   begin
                     if not Is_ExisteSecTrazabilTipoArchivoDetalleArchivo(iSecuenciaTraz, IdTipoArchivo) then
                       DoCargarCodigoError(Id, 'W007', Warnings, Errores);

                     if not Is_ExisteSecTrazabilClaveDetalleArchivo(iSecuenciaTraz, sClave) then
                       DoCargarCodigoError(Id, 'W005', Warnings, Errores);

                     if not Is_ExisteSecTrazabilCodDocumentoDetalleArchivo(iSecuenciaTraz, sCodDocumento) then
                       DoCargarCodigoError(Id, 'W006', Warnings, Errores);

                     if not bLoteNulo and not Is_ExisteSecTrazabilLote(iLote, iSecuenciaTraz) then
                       DoCargarCodigoError(Id, 'W004', Warnings, Errores);
                   end;
               end;
            end;

          if IsEmptyString(sPathArchivo) then
            DoCargarCodigoError(Id, 'E008', Warnings, Errores);

          if IsEmptyString(sArchivo) then
            DoCargarCodigoError(Id, 'E009', Warnings, Errores);

          if ValidarImagen then   // el problema es que estando conectado desde el Portal de Aplicaciones, tarda mucho en
            begin                 // verificar si existe un archivo en la pc local de quien ejecuta remotamente el sistema
              sPathImagen   := IncludeTrailingPathDelimiter(PathArchivoImportacion + RemoveFirstBar(sPathArchivo)) + sArchivo;
              bExisteImagen := FileExists(sPathImagen);
            end
          else
            bExisteImagen := True;

          if not bExisteImagen then
            DoCargarCodigoError(Id, 'E010', Warnings, Errores);

          if (UpperCase(ExtractFileExt(sArchivo)) <> '.TIF') then
            DoCargarCodigoError(Id, 'E011', Warnings, Errores);

          if ValidarImagen and bExisteImagen then
            begin
              bImagenOk := IsImagenValidaRepositorio(sPathImagen);

              if not bImagenOk then
                DoCargarCodigoError(Id, 'E012', Warnings, Errores);
            end;
        end;
    end;

  DoArmarErrores(Id);
end;

procedure TfrmImportarImagRepositorio.DoCargarCodigoError(IdRepositorio: TTableId; Codigo: String; var Warnings, Errores: Integer);
var
  sSql: String;
begin
  sSql := 'INSERT INTO TIE_IMPOREPOSARCH_ERROR(IE_IDIMPOREPOSITORIOARCHIVO, IE_CODERROR) ' +
               'VALUES(:IdRepositorio, :CodError)';
  EjecutarSqlEx(sSql, [IdRepositorio, Codigo]);

  if StrLeft(Codigo, 1) = 'E' then
    Inc(Errores)
  else
    Inc(Warnings);
end;

procedure TfrmImportarImagRepositorio.DoArmarErrores(IdRepositorio: TTableId);
var
  sSql: String;
  iError, iWarning: Integer;
  sDescrError, sError, sWarning: String;
begin
  iError   := 0;
  iWarning := 0;
  sError   := '';
  sWarning := '';

  sSql := 'SELECT TB_CODIGO COD_ERRWARNING, TB_DESCRIPCION DESCR_ERRWARNING ' +
            'FROM CTB_TABLAS, TIE_IMPOREPOSARCH_ERROR ' +
           'WHERE IE_IDIMPOREPOSITORIOARCHIVO = :IdRepositorio ' +
             'AND TB_CLAVE = ''REAGA'' ' +
             'AND TB_CODIGO = IE_CODERROR ' +
        'ORDER BY TB_CODIGO';

  with GetQueryEx(sSql, [IdRepositorio]) do
    try
      while not Eof do
        begin
          sDescrError := '. ' + FieldByName('DESCR_ERRWARNING').AsString + CRLF;

          if StrLeft(FieldByName('COD_ERRWARNING').AsString, 1) = 'E' then
            begin
              Inc(iError);
              sError := sError + LPad(iError, '0', 3) + sDescrError;
            end
          else
            begin
              Inc(iWarning);
              sWarning := sWarning + LPad(iWarning, '0', 3) + sDescrError;
            end;

          Next;
        end;
    finally
      Free;
    end;

  if not IsEmptyString(sError) then
    sError := CutRight(sError, Length(CRLF));

  if not IsEmptyString(sWarning) then
    sWarning := CutRight(sWarning, Length(CRLF));

  sSql := 'UPDATE TIR_IMPOREPOSITORIOARCHIVO ' +
             'SET IR_ERRORES = :Errores, ' +
                 'IR_CANTERRORES = :CantErrores, ' +
                 'IR_WARNINGS = :Warnings, ' +
                 'IR_CANTWARNINGS = :CantWarnings ' +
           'WHERE IR_ID = :Id';
  EjecutarSqlEx(sSql, [sError, iError, sWarning, iWarning, IdRepositorio]);
end;

procedure TfrmImportarImagRepositorio.DoCargarComboFiltroLote(Where: String);
var
  sSqlLotes: String;
begin
  sSqlLotes := 'SELECT DISTINCT IR_LOTE LOTE, TRIM(TO_CHAR(IR_LOTE)) || DECODE(LO_ID, NULL, NULL, '' ('' || LO_USUALTA || '' - '' || TO_CHAR(TRUNC(LO_FECHAALTA), ''DD/MM/YYYY'') || '')'') DESCRLOTE ' +
                 'FROM ARCHIVO.RLO_LOTE, TIR_IMPOREPOSITORIOARCHIVO ' +
                'WHERE IR_LOTE = LO_ID(+) ' +
                  'AND IR_LOTE IS NOT NULL ' +
                  'AND IR_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
                  Where + ' ' +
                'UNION ALL ' +
               'SELECT -9999 LOTE, ''[ Todos ]'' DESCRLOTE ' +
                 'FROM DUAL ' +
                'ORDER BY LOTE';

  sdqLotes.Sql.Text := sSqlLotes;
end;

procedure TfrmImportarImagRepositorio.DoCargarCombosFiltros;
var
  sSqlWarnings, sSqlErrores: String;
begin
  sSqlWarnings := 'SELECT DISTINCT TB_CODIGO COD, TB_DESCRIPCION DESCR ' +
                    'FROM CTB_TABLAS, TIR_IMPOREPOSITORIOARCHIVO, TIE_IMPOREPOSARCH_ERROR ' +
                   'WHERE IR_USUARIO = ' + SqlValue(Sesion.UserID) + ' ' +
                     'AND IR_ID = IE_IDIMPOREPOSITORIOARCHIVO ' +
                     'AND TB_CLAVE = ''REAGA'' ' +
                     'AND TB_CODIGO = IE_CODERROR ' +
                     'AND SUBSTR(TB_CODIGO, 1, 1) = ''W'' ' +
                   'UNION ALL ' +
                  'SELECT ''-9999'' COD, ''[ Todos ]'' DESCR ' +
                    'FROM DUAL ' +
                   'ORDER BY DESCR';

  sSqlErrores := 'SELECT DISTINCT TB_CODIGO COD, TB_DESCRIPCION DESCR ' +
                   'FROM CTB_TABLAS, TIR_IMPOREPOSITORIOARCHIVO, TIE_IMPOREPOSARCH_ERROR ' +
                  'WHERE IR_USUARIO = ' + SqlValue(Sesion.UserID) + ' ' +
                    'AND IR_ID = IE_IDIMPOREPOSITORIOARCHIVO ' +
                    'AND TB_CLAVE = ''REAGA'' ' +
                    'AND TB_CODIGO = IE_CODERROR ' +
                    'AND SUBSTR(TB_CODIGO, 1, 1) = ''E'' ' +
                  'UNION ALL ' +
                 'SELECT ''-9999'' COD, ''[ Todos ]'' DESCR ' +
                   'FROM DUAL ' +
                  'ORDER BY DESCR';

  sdqWarnings.Sql.Text := sSqlWarnings;
  sdqErrores.Sql.Text  := sSqlErrores;
end;

procedure TfrmImportarImagRepositorio.cmbChange(Sender: TObject);
begin
  if pbImportacionOK then
    RefreshData;
end;

function TfrmImportarImagRepositorio.IsArchivoValido(CantReg, Warnings, Errores: Integer): Boolean;
begin
  Result := ((Errores = 0) and (Trunc(Warnings/CantReg*100) <= MAXPORCWARNINGS));
end;

function TfrmImportarImagRepositorio.IsPermitirImportar(CantReg, Warnings, Errores: Integer): Boolean;
begin
  Result := (Errores = 0);
end;

procedure TfrmImportarImagRepositorio.tbImportarClick(Sender: TObject);
var
  sPregunta, sSql: String;
  qry: TSDQuery;
  iNroMedio, iCantReg, i: Integer;
  bContinuar: Boolean;
  TipoArchivo: TTableId;
begin
  sSql := 'SELECT DISTINCT IR_NROMEDIO ' +
            'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
           'WHERE IR_USUARIO = :Usuario';
  iNroMedio := ValorSqlIntegerEx(sSql, [Sesion.UserId]);

  // lo vuelvo a calcular por las dudas que en el mismo momento alguien ya haya subido ese mismo CD
  pbExisteNroMedioReposit := Is_ExisteNroMedioEnRepositorio(iNroMedio, TipoArchivo);

  if pbExisteNroMedioReposit then
    sPregunta := 'El CD ya existe en el repositorio. ¿Desea sobreescribir los datos existentes?'
  else
    sPregunta := '¿Confirma la importación de las imágenes al repositorio?';

  bContinuar := (MsgBox(sPregunta, MB_ICONQUESTION+MB_YESNO) = idYes);

  if bContinuar then
    begin
      jvpgProgreso.Visible := True;
      iCantReg             := edCantReg.Value;
      try
        sSql := 'SELECT IR_CODARCHIVO, IR_CLAVE, IR_CODDOCUMENTO, IR_NROMEDIO, IR_LOTE, ' +
                       'IR_CAJAADMIN, IR_PATHARCHIVO, IR_ARCHIVO, IR_OBSERVACIONES, ' +
                       'IR_NRODOCUMENTO, IR_HOJA, IR_LEGAJO, IR_NROOPERACION_GT, ' +
                       'IR_SECUENCIATRAZABIL, TA_ID ' +
                  'FROM RTA_TIPOARCHIVO, TIR_IMPOREPOSITORIOARCHIVO ' +
                 'WHERE IR_USUARIO = :Usuario ' +
                   'AND IR_CODARCHIVO = TA_CODIGO ' +
                 'ORDER BY IR_ID';
        qry := GetQueryEx(sSql, [Sesion.UserId]);

        with qry do
          try
            if not Eof then
              begin
                i := 0;

                with jvpgProgreso do
                  begin
                    Min := 1;
                    Max := edCantReg.Value + Iif(pbExisteNroMedioReposit, 1, 0);
                  end;

                BeginTrans;
                try
                  if pbExisteNroMedioReposit then
                    begin
                      Inc(i);
                      jvpgProgreso.Position := i;

                      DoBorrarNroMedio(FieldByName('IR_NROMEDIO').AsInteger, FieldByName('TA_ID').AsInteger);
                    end;

                  while not Eof do
                    begin
                      Inc(i);
                      jvpgProgreso.Position := i;

                      DoMigrar(psPathArchivoImportacion, qry, pbExisteNroMedioReposit);

                      edCantReg.Value := i - Iif(pbExisteNroMedioReposit, 1, 0);

                      if ((i-1) Mod CANTREGACT) = 0 then
                        Application.ProcessMessages;

                      Next;
                    end;

                  CommitTrans;
                except
                  on E : exception do
                  begin
                    Rollback(True);
                    Raise Exception.Create('Error al importar al repositorio.' + CRLF + E.Message);
                  end;
                end;

                Application.ProcessMessages;
                tbImportar.Enabled := False;
                MsgBox('La importación se realizó con éxito.' + CRLF + 'Cantidad de imágenes importadas:' +
                        CRLF +  '          ' + IntToStr(qry.RecordCount), MB_ICONEXCLAMATION);
              end;
          finally
            Free;
          end;
      finally
        jvpgProgreso.Visible := False;
        edCantReg.Value      := iCantReg;
      end;
    end;

  if (MsgBox('¿Confirma el traspaso de los problemas originados en la ART al Seguimiento de Errores de Usuarios?', MB_ICONQUESTION+MB_YESNO) = idYes) then
    DoGenerarEroresUsuarios;
end;

procedure TfrmImportarImagRepositorio.DoMigrar(PathArchivoImportacion: String; qry: TSDQuery; ExisteNroMedioReposit: Boolean);
var
  sNroCartaDoc, sArchivo, sPathArchivo, sCodDocumento, sClave: String;
  sNroOperGT, sCarpetaOrig, sCarpetaDest, sObservaciones: String;
  iSecuenciaTraz, iLegajo, iNroHoja, iCajaAdmin, iLote, iNroMedio: Integer;
  IdTipoDocumento, IdTipoArchivo: TTableId;
  bEsDocumentoPapelLote, bCopiaOK: Boolean;
begin
  with qry do
    begin
      IdTipoArchivo   := FieldByName('TA_ID').AsInteger;
      sClave          := FieldByName('IR_CLAVE').AsString;
      sCodDocumento   := FieldByName('IR_CODDOCUMENTO').AsString;
      iNroMedio       := FieldByName('IR_NROMEDIO').AsInteger;
      iLote           := FieldByName('IR_LOTE').AsInteger;
      iCajaAdmin      := FieldByName('IR_CAJAADMIN').AsInteger;
      sPathArchivo    := FieldByName('IR_PATHARCHIVO').AsString;
      sArchivo        := FieldByName('IR_ARCHIVO').AsString;
      sObservaciones  := FieldByName('IR_OBSERVACIONES').AsString;
      iSecuenciaTraz  := FieldByName('IR_SECUENCIATRAZABIL').AsInteger;
      sClave          := Do_TransformarClave(IdTipoArchivo, sClave);

      IdTipoDocumento := GetIdDocumentoArchivo(IdTipoArchivo, sCodDocumento);

      bEsDocumentoPapelLote := (sCodDocumento = CODDOC_LOTE);

      if bEsDocumentoPapelLote then
        begin
          sNroCartaDoc := '';
          iNroHoja     := 0;
          iLegajo      := 0;
          sNroOperGT   := '';
        end
      else
        begin
          if CartaDocumento(IdTipoArchivo) then
            sNroCartaDoc := sClave
          else if TipoCartaDocumento(IdTipoArchivo) then
            sNroCartaDoc := FieldByName('IR_NRODOCUMENTO').AsString
          else
            sNroCartaDoc := '';

          if TipoArchivoExtractosBancarios(IdTipoArchivo) then
            iNroHoja := FieldByName('IR_HOJA').AsInteger
          else
             iNroHoja := 0;

          if TipoArchivoCuentasPagarViaticos(IdTipoArchivo) then
            iLegajo := FieldByName('IR_LEGAJO').AsInteger
          else
            iLegajo := 0;
        end;

      if TipoArchivoCajaGirosTransferencias(IdTipoArchivo) then
        sNroOperGT := FieldByName('IR_NROOPERACION_GT').AsString
      else
        sNroOperGT := '';

      bCopiaOK := DoCopiarArchivo(IdTipoArchivo, iNroMedio, PathArchivoImportacion, sPathArchivo, sArchivo, sCarpetaOrig, sCarpetaDest);
      if bCopiaOK then
        DoInsertRepositorioArchivo(dcImportacionArchivo, IdTipoArchivo, sClave,
                                   IdTipoDocumento, sCarpetaDest, sArchivo, False,
                                   iNroMedio, iLote, 0, sObservaciones, '',
                                   0, '', iCajaAdmin, sNroCartaDoc, iNroHoja, iLegajo,
                                   sNroOperGT, '', 0, '', iSecuenciaTraz)
      else
        raise Exception.Create('No se pudo copiar el archivo: ' + sArchivo + ' desde la carpeta: ' + sCarpetaOrig + ' a la carpeta ' + sCarpetaDest);
    end;
end;

function TfrmImportarImagRepositorio.Get_PathArchivoImportacion: String;
begin
  Result := ObtenerValor('ART.ARCHIVO.Get_PathArchivoImportacion');
end;

function TfrmImportarImagRepositorio.DoCopiarArchivo(IdTipoArchivo: TTableId; NroMedio: Integer; PathArchivoImportacion, PathArchivo, Archivo: String; var CarpetaOrig, CarpetaDest: String): Boolean;
begin
  PathArchivo    := RemoveFirstBar(PathArchivo);
  CarpetaOrig    := IncludeTrailingPathDelimiter(PathArchivoImportacion + PathArchivo);
  CarpetaDest    := IncludeTrailingPathDelimiter(Get_CarpetaDestinoImportacionArchivo(IdTipoArchivo, NroMedio) + PathArchivo);
  ForceDirectories(CarpetaDest);

  Result := CopyFileExt(CarpetaOrig+Archivo, CarpetaDest+Archivo, False);
end;

procedure TfrmImportarImagRepositorio.DoBorrarNroMedio(NroMedio: Integer; IdTipoArchivo: TTableId);
var
  sPathImagen, sSql: String;
  bEnProduccion, bContinuar, bHayImagenes: Boolean;
begin
  bEnProduccion := Is_ConectadoProduccion();

  sSql := 'SELECT RA_PATHARCHIVO PATHARCHIVO, RA_ARCHIVO ARCHIVO ' +
            'FROM RAR_ARCHIVO, RRA_REPOSITORIOARCHIVO ' +
           'WHERE RA_NROMEDIO = :NroMedio ' +
             Iif(NroMedio < MINROMEDIO, 'AND AR_TIPO = ' + SqlValue(IdTipoArchivo) + ' ', '') +  // esto es para los CD's anteriores a la migración, que tenían numeración independiente por cada tipo de archivo
             'AND RA_FECHABAJA IS NULL ' +
             'AND RA_IDARCHIVO = AR_ID ' +
           'ORDER BY RA_ID';
  with GetQueryEx(sSql, [NroMedio]) do
    try
      if Eof then
        bContinuar := (MsgBox('No se han encontrado imágenes en el repositorio para el CD ' + IntToStr(NroMedio) + ' - Tipo de Archivo: ' + Get_DescripcionTipoArchivo(IdTipoArchivo) + '. ¿Continúa de todas formas?', MB_ICONQUESTION+MB_YESNO ) = ID_YES)
      else
        bContinuar := True;

      bHayImagenes := not Eof;

      if bContinuar and bHayImagenes and bEnProduccion then
        while not Eof do
          begin
            sPathImagen := IncludeTrailingPathDelimiter(FieldByName('PATHARCHIVO').AsString) + FieldByName('ARCHIVO').AsString;

            if FileExists(sPathImagen) then
              begin
                if not DeleteReadOnlyFile(sPathImagen) then
                  raise Exception.Create('No se pudo borrar el archivo: ' + sPathImagen + '.');
              end;

            Next;
          end;
    finally
      Free;
    end;

  if bContinuar and bHayImagenes then
    begin
      sSql := 'UPDATE RRA_REPOSITORIOARCHIVO ' +
                 'SET RA_FECHABAJA = SYSDATE, ' +
                     'RA_USUBAJA = :User ' +
               'WHERE RA_NROMEDIO = :NroMedio ' +
                 'AND RA_FECHABAJA IS NULL ';
       if NroMedio < MINROMEDIO then
         sSql := sSql + 'AND EXISTS (SELECT 1 ' +
                                      'FROM RAR_ARCHIVO ' +
                                     'WHERE RA_IDARCHIVO = AR_ID ' +
                                       'AND AR_TIPO = ' + SqlValue(IdTipoArchivo) + ')';
      EjecutarSqlSTEx(sSql, [Sesion.UserId, NroMedio]);
    end;  
end;

procedure TfrmImportarImagRepositorio.Exportar(Sender: TObject);
var
  bVisibleOK, bVisibleWarning, bVisibleError: Boolean;
begin
  with Grid do
    begin
      bVisibleOK      := ColumnByField[CAMPOOK].Visible;
      bVisibleWarning := ColumnByField[CAMPOWARNING].Visible;
      bVisibleError   := ColumnByField[CAMPOERROR].Visible;

      try
        ColumnByField[CAMPOOK].Visible      := False;
        ColumnByField[CAMPOWARNING].Visible := False;
        ColumnByField[CAMPOERROR].Visible   := False;

        inherited tbExportarClick(nil)
      finally
        ColumnByField[CAMPOOK].Visible      := bVisibleOK;
        ColumnByField[CAMPOWARNING].Visible := bVisibleWarning;
        ColumnByField[CAMPOERROR].Visible   := bVisibleError;
      end;
    end;
end;

procedure TfrmImportarImagRepositorio.tbVerImagenClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');

  pbCargarImagenes := True;
  try
    ResetearTimer;
    fpImagen.ShowModal;
  finally
    pbCargarImagenes := False;
  end;
end;

procedure TfrmImportarImagRepositorio.ResetearTimer;
begin
  if pbCargarImagenes then
    begin
      tmrImagenes.Enabled   := False;
      fraVistaTIFFImg.Image := '';
      tmrImagenes.Enabled   := True;
      fraVistaTIFFImg.MoverEnDataSource(nil);
    end;
end;

procedure TfrmImportarImagRepositorio.tmrImagenesTimer(Sender: TObject);
begin
  tmrImagenes.Enabled := False;
  if pbCargarImagenes then
    DoMostrarImagen;
end;

procedure TfrmImportarImagRepositorio.DoMostrarImagen();
var
  sPathImagen, sPathArchivo, sArchivo: String;
begin
  if fpImagen.Visible then
    with sdqConsulta, fraVistaTIFFImg do
      begin
        Image  := '';

        sPathArchivo := FieldByName('PATHARCHIVO').AsString;
        sArchivo     := FieldByName('ARCHIVO').AsString;
        sPathImagen  := IncludeTrailingPathDelimiter(psPathArchivoImportacion + RemoveFirstBar(sPathArchivo)) + sArchivo;

        MostrarImagen(sPathImagen);
      end;
end;

procedure TfrmImportarImagRepositorio.fpImagenShow(Sender: TObject);
begin
  DoMostrarImagen;
end;

procedure TfrmImportarImagRepositorio.MostrarImagen(PathImagen: String);
begin
  with fraVistaTIFFImg do
    try
      if PathImagen <> Image then
        begin
          Mensaje := '';

          try
            PageCount := 1;
            Page      := 1;
            Image     := PathImagen;
          except
            InfoHint(imgVista, 'Ocurrió un error al intentar cargar la imagen: ' + PathImagen + '.');
          end;

          if not FileExists(Image) then
            begin
              Clear;
              Mensaje := 'Error: La imagen no se encuentra.';
            end;
        end;
    except
      Mensaje := 'Error al leer la imagen.';
    end;
end;

procedure TfrmImportarImagRepositorio.fraTipoArchivoEdicPropiedadesChange(Sender: TObject);
begin
  with fraTipoDocumentoEdic do
    begin
      Clear;

      if fraFiltroArchivoEdic.IsSelected then
        ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                         'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                        'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraFiltroArchivoEdic.Tipo) + ' ' +
                                          'AND AD_FECHABAJA IS NULL ' +
                                          'AND AD_IDTIPODOCUMENTO = TD_ID) '
      else
        ExtraCondition := ' AND 1 = 2';
    end;

  fraFiltroArchivoEdic.OnArchivoChange(Sender);
end;

procedure TfrmImportarImagRepositorio.DoLimpiarDatosEdicion;
begin
  fraFiltroArchivoEdic.Clear;
  fraTipoDocumentoEdic.Clear;
  edLoteEdic.Clear;
  edRemitoEdic.Clear;
  edHojaEdic.Clear;
  edLegajoEdic.Clear;
  edDocumentoEdic.Clear;
  edNroOperGT.Clear;
  edSecuenciaTrazEdic.Clear;
  edObservacionesEdic.Clear;
  chkAgregarObservEdic.Checked  := True;
  chkOrigenProblART.Checked     := False;
  chkValidacionReducida.Checked := False;
  fraTipoArchivoEdicPropiedadesChange(nil);

  pbOrigenProblARTModif := False;
end;

procedure TfrmImportarImagRepositorio.fpAbmEnter(Sender: TObject);
begin
  DoLimpiarDatosEdicion;

  fraFiltroArchivoEdic.Tipo := pTipoArchivoSeleccionado;
  fraTipoArchivoEdicPropiedadesChange(nil);
end;

procedure TfrmImportarImagRepositorio.FSFormDestroy(Sender: TObject);
begin
  inherited;
  fraFiltroArchivoEdic.Free;
end;

procedure TfrmImportarImagRepositorio.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmImportarImagRepositorio.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
end;

function TfrmImportarImagRepositorio.DoValidarDatosModificacionSeleccionados(var TipoArchivoSeleccionado: TTableId): Boolean;
var
  APointer: TBookMark;
  i: Integer;
  sProblemaART: String;
  bDistintoProblART: Boolean;
begin
  bDistintoProblART := False;

  APointer := sdqConsulta.GetBookmark;
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        TipoArchivoSeleccionado := ART_EMPTY_ID;
        sProblemaART            := '';

        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            if TipoArchivoSeleccionado = ART_EMPTY_ID then
              begin
                TipoArchivoSeleccionado := FieldByName('TIPOARCHIVO').AsInteger;
                sProblemaART            := FieldByName('PROBLEMAART').AsString;
              end
            else
              begin
                Verificar(TipoArchivoSeleccionado <> FieldByName('TIPOARCHIVO').AsInteger, nil, 'Todos los registros seleccionados deben ser del mismo tipo de archivo.');

                if sProblemaART <> FieldByName('PROBLEMAART').AsString then
                  bDistintoProblART := True;
              end
          end;

        if bDistintoProblART then
          MsgBox('Ha seleccionado registros con problemas originados y no originados en la ART. Todos serán modificados a un mismo tipo de problema.', MB_ICONINFORMATION);
      end;
  finally
    sdqConsulta.GotoBookmark(APointer);
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;

procedure TfrmImportarImagRepositorio.DoActualizarDatosRevalidacion(LimpiarInfoResumen: Boolean);
begin
  if LimpiarInfoResumen then
    DoLimpiarInfoResumen;

  tbRevalidar.Enabled         := Seguridad.Activar(tbRevalidar);
  tbRevalidarParcial.Enabled  := Seguridad.Activar(tbRevalidarParcial);
  tbRevalidarRegistro.Enabled := Seguridad.Activar(tbRevalidarRegistro);
  tbImportar.Enabled          := False;

   with lbImportar do
     begin
       Caption    := '*** ARCHIVO SIN VALIDAR ***';
       Font.Color := TColor(COLOR_ERROR);
       Visible    := True;
     end;
end;

procedure TfrmImportarImagRepositorio.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  if DoValidarDatosModificacionSeleccionados(pTipoArchivoSeleccionado) then
    begin
      lblSecTrazabilidad.Visible  := IsUsarSecuenciaTrazabilidad(pTipoArchivoSeleccionado);
      edSecuenciaTrazEdic.Visible := lblSecTrazabilidad.Visible;

      sdqConsulta.DisableControls;
      try
        fpAbm.Caption := CAPTION_MODIFIC;
        if fpAbm.ShowModal = mrOk then
          begin
            Grid.UnselectAll;
            sdqConsulta.Refresh;
            DoActualizarDatosRevalidacion(True);
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;

procedure TfrmImportarImagRepositorio.tbEliminarClick(Sender: TObject);
begin
  tbEliminar.CheckMenuDropdown;
end;

procedure TfrmImportarImagRepositorio.btnAceptarClick(Sender: TObject);
begin
  if DoValidarDatosModificacionIngresados() then
    DoGuardarDatosModificacionIngresados;
end;

function TfrmImportarImagRepositorio.DoValidarDatosModificacionIngresados: Boolean;
var
  i: Integer;
begin
  Verificar(fraFiltroArchivoEdic.IsCompleted and not fraFiltroArchivoEdic.Exists, fraFiltroArchivoEdic, 'La clave indicada no existe.');
  Verificar(fraFiltroArchivoEdic.IsSelected and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado) and not fraTipoDocumentoEdic.IsSelected, fraTipoDocumentoEdic, 'Si modifica el tipo de archivo, entonces debe indicar un nuevo código de documento.');

  Verificar(not edLoteEdic.IsEmpty and not Is_ExisteLote(edLoteEdic.Value), edLoteEdic, 'El lote no existe.');

  Verificar(not edRemitoEdic.IsEmpty and not Is_ExisteRemito(edRemitoEdic.Value), edRemitoEdic, 'El remito no existe.');

  Verificar(not edHojaEdic.IsEmpty and ((fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoExtractosBancarios) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoExtractosBancarios(pTipoArchivoSeleccionado))), edHojaEdic, 'El nro. de hoja es solo para los Extractos Bancarios.');
  Verificar(not edHojaEdic.IsEmpty and (edHojaEdic.Value <= 0), edHojaEdic, 'El nro. de hoja debe ser mayor a 0.');
  Verificar(edHojaEdic.IsEmpty and fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoArchivoExtractosBancarios and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado), edHojaEdic, 'Debe indicar el nro. de hoja.');

  Verificar(not edLegajoEdic.IsEmpty and ((fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCuentasPagarViaticos) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCuentasPagarViaticos(pTipoArchivoSeleccionado))), edLegajoEdic, 'El nro. de legajo es solo para Cuentas a Pagar (Viáticos).');
  Verificar(not edLegajoEdic.IsEmpty and (edLegajoEdic.Value <= 0), edLegajoEdic, 'El nro. de legajo debe ser mayor a 0.');
  Verificar(not edLegajoEdic.IsEmpty and not Is_ExisteLegajo(edLegajoEdic.Value), edLegajoEdic, 'El nro. de legajo no existe.');
  Verificar(edLegajoEdic.IsEmpty and fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoArchivoCuentasPagarViaticos and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado), edLegajoEdic, 'Debe indicar el nro. de legajo.');

  Verificar(not IsEmptyString(edNroOperGT.Text) and ((fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCajaGirosTransferencias) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCajaGirosTransferencias(pTipoArchivoSeleccionado))), edNroOperGT, 'El nro. de operación de giro/transferencia es solo para las Cajas de Giros y Transferencias.');
  Verificar(IsEmptyString(edNroOperGT.Text) and fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoArchivoCajaGirosTransferencias and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado), edNroOperGT, 'Debe indicar el nro. de operación de giro/transferencia.');
  Verificar(not IsEmptyString(edNroOperGT.Text) and not Is_ExisteNroOperGT(edNroOperGT.Text), edNroOperGT, 'El nro. de operación de giro/transferencia no existe.');

  Verificar(IsUsarSecuenciaTrazabilidad(fraFiltroArchivoEdic.Tipo) and not edSecuenciaTrazEdic.IsEmpty and not Is_ExisteSecTrazabil(edSecuenciaTrazEdic.Value), edSecuenciaTrazEdic, 'El nro. de secuencia de trazabilidad no existe.');

  (*Verificar(not pbOrigenProblARTModif and not fraFiltroArchivoEdic.IsCompleted and not fraTipoDocumentoEdic.IsSelected and
            edLoteEdic.IsEmpty and edRemitoEdic.IsEmpty and IsEmptyString(edDocumentoEdic.Text) and
            edHojaEdic.IsEmpty and edLegajoEdic.IsEmpty and IsEmptyString(edNroOperGT.Text) and
            IsEmptyString(edObservacionesEdic.Lines.Text), nil, 'Debe indicar al menos un dato a modificar.');*)

  with sdqConsulta do
    begin
      DisableControls;
      try
        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            Verificar((FieldByName('CANTERRORES').AsInteger = 0) and (FieldByName('CANTWARNINGS').AsInteger = 0) and (FieldByName('PROBLEMAART').AsString = 'N') and chkOrigenProblART.Checked, nil, 'Alguno de los registros seleccionados no tiene errores ni warnings, y no puede asignarle un problema originado en la ART.');
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TfrmImportarImagRepositorio.DoGuardarDatosModificacionIngresados;
var
  sSqlTIR: TSql;
  sCodProblemaART, sObservacAct, sObservacNue: String;
  i: Integer;
  bSinCodProblemaART: Boolean;
begin
  sdqConsulta.DisableControls;
  try
    if MsgBox('¿Confirma la modificación de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
      begin
        sSqlTIR := TSql.Create('TIR_IMPOREPOSITORIOARCHIVO');
        try
          BeginTrans;
          try
            with sdqConsulta do
              begin
                bSinCodProblemaART := False;

                for i := 0 to Grid.SelectedRows.Count - 1 do
                  begin
                    GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                    with sSqlTIR do
                      begin
                        Clear;
                        SqlType := stUpdate;

                        PrimaryKey.Add('IR_ID',               FieldByName('IRID').AsInteger);

                        if fraFiltroArchivoEdic.IsSelected then
                          Fields.Add('IR_CODARCHIVO',         fraFiltroArchivoEdic.Codigo);

                        if fraFiltroArchivoEdic.IsCompleted then
                          Fields.Add('IR_CLAVE',              fraFiltroArchivoEdic.Clave);

                        if fraTipoDocumentoEdic.IsSelected then
                          Fields.Add('IR_CODDOCUMENTO',       fraTipoDocumentoEdic.Codigo);

                        if not edLoteEdic.IsEmpty then
                          Fields.Add('IR_LOTE',               edLoteEdic.Value);

                        if not edRemitoEdic.IsEmpty then
                          Fields.Add('IR_REMITO',             edRemitoEdic.Value);

                        if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCartaDocumento()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCartaDocumento(pTipoArchivoSeleccionado)) then
                          Fields.Add('IR_NRODOCUMENTO',       exNull)
                        else if not IsEmptyString(edDocumentoEdic.Text) then
                          Fields.Add('IR_NRODOCUMENTO',       Trim(edDocumentoEdic.Text));

                        if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoExtractosBancarios()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoExtractosBancarios(pTipoArchivoSeleccionado)) then
                          Fields.Add('IR_HOJA',               exNull)
                        else if not edHojaEdic.IsEmpty then
                          Fields.Add('IR_HOJA',               edHojaEdic.Value);

                        if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCuentasPagarViaticos()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCuentasPagarViaticos(pTipoArchivoSeleccionado)) then
                          Fields.Add('IR_LEGAJO',             exNull)
                        else if not edLegajoEdic.IsEmpty then
                          Fields.Add('IR_LEGAJO',             edLegajoEdic.Value);

                        if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCajaGirosTransferencias()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCajaGirosTransferencias(pTipoArchivoSeleccionado)) then
                          Fields.Add('IR_NROOPERACION_GT',    exNull)
                        else if not IsEmptyString(edNroOperGT.Text) then
                          Fields.Add('IR_NROOPERACION_GT',    edNroOperGT.Text);

                        sObservacNue := Trim(edObservacionesEdic.Lines.Text);
                        if not IsEmptyString(sObservacNue) then
                          begin
                            if chkAgregarObservEdic.Checked and not FieldByName('OBSERVACIONES').IsNull then
                              begin
                                sObservacAct := Trim(FieldByName('OBSERVACIONES').AsString);

                                if StrRight(sObservacAct, 1) <> '.' then
                                  sObservacAct := sObservacAct + '.';

                                sObservacNue := sObservacAct + ' ' + CRLF + sObservacNue;
                              end;

                            Fields.Add('IR_OBSERVACIONES',    StrLeft(sObservacNue, edObservacionesEdic.MaxLength));
                          end;

                        Fields.Add('IR_PROBLEMAART',          chkOrigenProblART.Checked);
                        Fields.Add('IR_VALIDACIONREDUCIDA',   chkValidacionReducida.Checked);

                        if chkOrigenProblART.Checked then
                          begin
                            sCodProblemaART := GetCodigoProblemaART(FieldByName('IRID').AsInteger);

                            if IsEmptyString(sCodProblemaART) then
                              bSinCodProblemaART := True;

                            Fields.Add('IR_CODPROBLEMAART',   Trim(sCodProblemaART));
                          end
                        else
                          Fields.Add('IR_CODPROBLEMAART',     exNull);

                        if not edSecuenciaTrazEdic.IsEmpty then
                          Fields.Add('IR_SECUENCIATRAZABIL',  edSecuenciaTrazEdic.Value);

                        Fields.Add('IR_PROCESADO',            'S');

                        EjecutarSqlST(Sql);
                      end;
                  end;
              end;

             CommitTrans;
             MsgBox('Registros modificados correctamente.' + Iif(bSinCodProblemaART, CRLF + CRLF + 'ATENCION: No se ha podido determinar un código de problema (único) originado en la ART para alguno de los registros modificados.', ''), MB_ICONINFORMATION);

             fpAbm.Close;
             fpAbm.ModalResult := mrOk;
          except
            on E:Exception do
              begin
                Rollback;
                Raise Exception.Create(E.Message + CRLF + 'Error al modificar los datos de la importación.');
              end;
          end;
        finally
          sSqlTIR.Free;
        end;
     end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmImportarImagRepositorio.DoRevalidarArchivo(ValidarImagen: Boolean);
var
  sSql: String;
begin
  sSql := 'DELETE FROM TMP.TIE_IMPOREPOSARCH_ERROR ' +
           'WHERE EXISTS (SELECT 1 ' +
                           'FROM TMP.TIR_IMPOREPOSITORIOARCHIVO ' +
                          'WHERE IR_USUARIO = :User ' +
                            'AND IR_ID = IE_IDIMPOREPOSITORIOARCHIVO)';
  EjecutarSqlEx(sSql, [Sesion.UserId]);

  DoValidarArchivoCompleto(ValidarImagen, False);
end;

procedure TfrmImportarImagRepositorio.tbRevalidarClick(Sender: TObject);
var
  bContinuar, bValidarImagen: Boolean;
begin
  DoAnalizarValidacion(bContinuar, bValidarImagen);

  if bContinuar then
    DoRevalidarArchivo(bValidarImagen);
end;

procedure TfrmImportarImagRepositorio.chkOrigenProblARTClick(Sender: TObject);
begin
  pbOrigenProblARTModif := True;
end;

function TfrmImportarImagRepositorio.GetObservacionesErrorUsuario(Clave, Documento: String): String;
begin
  Result := OBSERRORESUSU + ' (Clave Carpeta: ' + Clave + ' - Cód. Doc.: ' + Documento + ')'
end;

procedure TfrmImportarImagRepositorio.DoGenerarEroresUsuarios;
var
  sCodErrorOrig, sObserv, sSql, sCodErrorUsu, sUsuarioErr: String;
  qry, qry2: TSDQuery;
  iLote: TTableId;
  aSql: TSql;
  iResp, iNroMedio: Integer;
  bErroresLote, bErroresUsu, bBajaNroMedio, bContinuar: Boolean;
begin
  sSql := 'SELECT DISTINCT IR_CLAVE CLAVE, IR_CODDOCUMENTO CODDOCUMENTO, IR_LOTE LOTE, ' +
                 'IR_NROMEDIO NROMEDIO, IR_CODPROBLEMAART CODPROBLEMAART ' +
            'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
           'WHERE IR_USUARIO = :Usuario ' +
             'AND IR_PROBLEMAART = ''S'' ' +
             'AND IR_LOTE IS NOT NULL ' +
           'ORDER BY IR_LOTE';
  qry := GetQueryEx(sSql, [Sesion.UserId]);

  try
    bErroresUsu  := not qry.Eof;

    sSql := 'SELECT AR_CLAVE CLAVE, TD_CODIGO CODDOCUMENTO, DA_LOTE LOTE, DA_SEQ_LOTE SEQ_LOTE, ' +
                   '(SELECT MAX(IR_NROMEDIO) FROM TIR_IMPOREPOSITORIOARCHIVO WHERE IR_USUARIO = ' + SqlValue(Sesion.UserId) + ') NROMEDIO ' +
              'FROM ARCHIVO.RAR_ARCHIVO, ARCHIVO.RTD_TIPODOCUMENTO, ARCHIVO.RDA_DETALLEARCHIVO ' +
             'WHERE DA_IDARCHIVO = AR_ID ' +
               'AND DA_FECHABAJA IS NULL ' +
               'AND DA_IDTIPODOCUMENTO = TD_ID ' +
               'AND DA_LOTE IN (SELECT DISTINCT IR_LOTE ' +
                                 'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
                                'WHERE IR_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
                                  'AND IR_LOTE IS NOT NULL) ' +
               'AND (NOT EXISTS (SELECT 1 ' +
                                 'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
                                'WHERE IR_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
                                  'AND IR_LOTE = DA_LOTE ' +
                                  'AND IR_CLAVE = AR_CLAVE ' +
                                  'AND IR_CODDOCUMENTO = TD_CODIGO) ' +
              Iif(IsArchivoConSecTrazabilidad(),
                    'OR (ART.ARCHIVO.IS_ISUSARSECUENCIATRAZABILIDAD(AR_TIPO) = ''S'' ' +
                        'AND ART.ARCHIVO.IS_ARCHIVOPATCH(AR_TIPO) = ''N'' ' +
                        'AND NOT EXISTS (SELECT 1 ' +
                                          'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
                                         'WHERE IR_USUARIO = ' + SqlValue(Sesion.UserId) + ' ' +
                                           'AND IR_SECUENCIATRAZABIL = DA_SECUENCIATRAZABIL)) ', '') +
                   ') ' +
             'ORDER BY DA_LOTE';
    qry2 := GetQuery(sSql);
    try
      bErroresLote := not qry2.Eof;

      if not bErroresUsu and not bErroresLote then
        MsgBox('No se han encontrado registros a traspasar al Seguimiento de Errores de Usuarios.', MB_ICONINFORMATION)
      else
        begin
          bBajaNroMedio := False;

          if bErroresUsu then
            iNroMedio := qry.FieldByName('NROMEDIO').AsInteger
          else
            iNroMedio := qry2.FieldByName('NROMEDIO').AsInteger;

          if Is_ExisteNroMedioEnSegErroresUsuario(iNroMedio) then
            begin
              iResp := MsgBox('Este CD ya ha sido traspasado al Seguimiento de Errores de Usuarios. ¿Desea dar de baja los registros existentes y traspasarlo nuevamente? En caso de elegir NO se agregarán los registros a los ya existentes.', MB_ICONQUESTION+MB_YESNOCANCEL);

              if (iResp = ID_YES) or (iResp = ID_NO) then
                begin
                  bContinuar    := True;
                  bBajaNroMedio := (iResp = ID_YES);
                end
              else
                bContinuar := False;
            end
          else
            bContinuar := True;

          if bContinuar then
            begin
              aSql := TSql.Create('REU_ERRORUSUARIO');
              try
                BeginTrans;
                try
                  if bBajaNroMedio then
                    Do_EliminarNroMedioSegErroresUsuario(iNroMedio);

(* *** Errores de los usuarios detectados en la CajaExpo *** *)
                  while not qry.Eof do
                    begin
                      iLote         := qry.FieldByName('LOTE').AsInteger;
                      sUsuarioErr   := Get_UsuarioAltaLote(iLote);
                      sCodErrorOrig := qry.FieldByName('CODPROBLEMAART').AsString;
                      sCodErrorUsu  := Get_CTBEspecial1('REAGA', sCodErrorOrig);

                      if Is_ExisteCodigoCTBTablas('EUAGA', sCodErrorUsu) then
                        with aSql do
                          begin
                            Clear;

                            sObserv := GetObservacionesErrorUsuario(qry.FieldByName('CLAVE').AsString, qry.FieldByName('CODDOCUMENTO').AsString);

                            PrimaryKey.AddExpression('EU_ID',  'SEQ_REU_ID.NEXTVAL');
                            Fields.Add('EU_FECHAALTA',         exDateTime);
                            Fields.Add('EU_USUALTA',           Sesion.UserID);
                            Fields.Add('EU_USUARIO',           sUsuarioErr);
                            Fields.Add('EU_CODERROR',          sCodErrorUsu);
                            Fields.Add('EU_LOTE',              iLote);
                            Fields.Add('EU_NROMEDIO',          iNroMedio);
                            Fields.Add('EU_CANTERRORES',       1);
                            Fields.Add('EU_OBSERVACIONES',     sObserv);
                            Fields.Add('EU_CODERROR_ORIGINAL', sCodErrorOrig);

                            SqlType := stInsert;
                            EjecutarSqlST(Sql);
                          end;

                      qry.Next;
                    end;

(* *** Errores de los usuarios por documentos del lote que no existen en la CajaExpo *** *)
                  if bErroresLote then
                    begin
                      sCodErrorUsu := CODERROR_SEGUSU_DOCLOTEINEXISTENTE;
                      if Is_ExisteCodigoCTBTablas('EUAGA', sCodErrorUsu) then
                        while not qry2.Eof do
                          begin
                            iLote       := qry2.FieldByName('LOTE').AsInteger;
                            sUsuarioErr := Get_UsuarioAltaLote(iLote);

                            with aSql do
                              begin
                                Clear;

                                sObserv := GetObservacionesErrorUsuario(qry2.FieldByName('CLAVE').AsString, qry2.FieldByName('CODDOCUMENTO').AsString);

                                PrimaryKey.AddExpression('EU_ID',  'SEQ_REU_ID.NEXTVAL');
                                Fields.Add('EU_FECHAALTA',         exDateTime);
                                Fields.Add('EU_USUALTA',           Sesion.UserID);
                                Fields.Add('EU_USUARIO',           sUsuarioErr);
                                Fields.Add('EU_CODERROR',          sCodErrorUsu);
                                Fields.Add('EU_LOTE',              iLote);
                                Fields.Add('EU_SEQ_LOTE',          qry2.FieldByName('SEQ_LOTE').AsInteger);
                                Fields.Add('EU_NROMEDIO',          iNroMedio);
                                Fields.Add('EU_CANTERRORES',       1);
                                Fields.Add('EU_OBSERVACIONES',     sObserv);

                                SqlType := stInsert;
                                EjecutarSqlST(Sql);
                              end;

                            qry2.Next;
                          end;
                    end;

                  CommitTrans;
                  MsgBox('Registros traspasados correctamente al Seguimiento de Errores de Usuarios.', MB_ICONINFORMATION);
                except
                  on E:Exception do
                    begin
                      Rollback;
                      Raise Exception.Create(E.Message + CRLF + 'Error al traspasar registros al seguimiento de errores de usuarios.');
                    end;
                end;
              finally
                aSql.Free;
              end;
            end;
        end;
    finally
      qry2.Free;
    end;
  finally
    qry.Free;
  end;
end;

function TfrmImportarImagRepositorio.GetCodigoProblemaART(IdImpoRepositorioArchivo: TTableId): String;
var
  sCodigo, sSql: String;
  qry: TSDQuery;
begin
  sCodigo := '';

  sSql := 'SELECT IE_CODERROR CODERROR ' +
            'FROM CTB_TABLAS B, CTB_TABLAS A, TMP.TIE_IMPOREPOSARCH_ERROR ' +
           'WHERE IE_IDIMPOREPOSITORIOARCHIVO = :Id ' +
             'AND A.TB_CLAVE = ''REAGA'' ' +
             'AND A.TB_CODIGO = IE_CODERROR ' +
             'AND B.TB_CLAVE = ''EUAGA'' ' +
             'AND B.TB_CODIGO = A.TB_ESPECIAL1 ' +
             'AND B.TB_FECHABAJA IS NULL';
  qry := GetQueryEx(sSql, [IdImpoRepositorioArchivo]);

  with qry do
    try
      if RecordCount = 1 then
        sCodigo := FieldByName('CODERROR').AsString;
    finally
      Free;
    end;

  Result := sCodigo;  
end;

procedure TfrmImportarImagRepositorio.tbReCargarDatosClick(Sender: TObject);
begin
  if fpReCargarDatos.ShowModal = mrOk then
    if MsgBox('Tenga en cuenta que perderá los datos de su trabajo con el último CD, ya que serán reemplazados por el CD seleccionado. ¿Desea continuar?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
      DoReCargarDatos(sdqDatosReCarga.FieldByName('NROMEDIO').AsInteger, sdqDatosReCarga.FieldByName('USUARIO').AsString);
end;

procedure TfrmImportarImagRepositorio.DoInsertarDatosTemporal(NroMedio: Integer; Usuario: String);
var
  sSql: String;
begin
  sSql := 'INSERT INTO TIR_IMPOREPOSITORIOARCHIVO ' +
            '(IR_ID, IR_USUARIO, IR_CODARCHIVO, IR_CLAVE, IR_CODDOCUMENTO, ' +
             'IR_NROMEDIO, IR_LOTE, IR_REMITO, IR_CAJAADMIN, IR_PATHARCHIVO, ' +
             'IR_ARCHIVO, IR_OBSERVACIONES, IR_NRODOCUMENTO, IR_HOJA, ' +
             'IR_LEGAJO, IR_NROOPERACION_GT, IR_PROBLEMAART, IR_CODPROBLEMAART, ' +
             'IR_VALIDACIONREDUCIDA, IR_SECUENCIATRAZABIL) ' +
             'SELECT TMP.SEQ_TIR_ID.NEXTVAL, :User, IR_CODARCHIVO, IR_CLAVE, IR_CODDOCUMENTO, ' +
                    'IR_NROMEDIO, IR_LOTE, IR_REMITO, IR_CAJAADMIN, IR_PATHARCHIVO, ' +
                    'IR_ARCHIVO, IR_OBSERVACIONES, IR_NRODOCUMENTO, IR_HOJA, ' +
                    'IR_LEGAJO, IR_NROOPERACION_GT, IR_PROBLEMAART, IR_CODPROBLEMAART, ' +
                    'IR_VALIDACIONREDUCIDA, IR_SECUENCIATRAZABIL ' +
               'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
              'WHERE IR_USUARIO = :Usuario ' +
                'AND IR_NROMEDIO = :NroMedio';
  EjecutarSqlEx(sSql, [Sesion.UserID, Usuario, NroMedio]);
end;

procedure TfrmImportarImagRepositorio.DoReCargarDatos(NroMedio: Integer; Usuario: String);
var
  bCargar: Boolean;
  sSql, sUbicImagenes: String;
begin
  bCargar := (Usuario <> Sesion.UserId);

  if bCargar then
    begin
      Do_LimpiarTablaTemporal('TIR_IMPOREPOSITORIOARCHIVO', 'IR_USUARIO', Sesion.UserId);
      DoInsertarDatosTemporal(NroMedio, Usuario);
    end;

  sUbicImagenes := IncludeTrailingPathDelimiter(fdDialog.Directory);

  sSql := 'ART.ARCHIVO.v_patharchimportacion := :UbicImagenes;';
  EjecutarStoreEx(sSql, [sUbicImagenes]);

  DoRevalidarArchivo(True);
end;

procedure TfrmImportarImagRepositorio.fpReCargarDatosEnter(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT IR_USUARIO USUARIO, MAX(IR_NROMEDIO) NROMEDIO, COUNT(*) CANTIDAD ' +
            'FROM USE_USUARIOS, TMP.TIR_IMPOREPOSITORIOARCHIVO A ' +
           'WHERE IR_USUARIO = SE_USUARIO ' +
             'AND SE_SECTOR = :Sector ' +
             'AND SE_FECHABAJA IS NULL ' +
           'GROUP BY IR_USUARIO ' +
          'HAVING COUNT(DISTINCT IR_NROMEDIO) = 1';
  OpenQueryEx(sdqDatosReCarga, [Sesion.Sector], sSql);
end;

procedure TfrmImportarImagRepositorio.btnAceptarReCargarDatosClick(Sender: TObject);
begin
  Verificar(sdqDatosReCarga.IsEmpty, dbgDatosReCarga, 'No hay registros en la grilla.');

  if fdDialog.Execute then
    fpReCargarDatos.ModalResult := mrOk;
end;

procedure TfrmImportarImagRepositorio.tbAltaSegErroresUsuariosClick(Sender: TObject);
var
  iLote: TTableId;
  sObserv, sListaCod, sUsuarioErr: String;
  iNroMedio: Integer;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');

      sListaCod := GetListaCodigosProblemaART(FieldByName('IRID').AsInteger);
      Verificar(IsEmptyString(sListaCod), nil, 'No se ha podido determinar al menos un código de error del Seguimiento de Errores de Usuarios a partir de los errores/warnings del registro seleccionado.');

      iLote       := FieldByName('LOTE').AsInteger;
      sUsuarioErr := Get_UsuarioAltaLote(iLote);
      iNroMedio   := FieldByName('NROMEDIO').AsInteger;
      sObserv     := GetObservacionesErrorUsuario(FieldByName('CLAVE').AsString, FieldByName('CODDOCUMENTO').AsString);

      TfrmSeguimientoErroresUsuarios.DoAltaSeguimientoErroresUsuarios(sListaCod, sUsuarioErr, sObserv, iLote, iNroMedio);
    end;
end;

function TfrmImportarImagRepositorio.GetListaCodigosProblemaART(IdImpoRepositorioArchivo: TTableId): String;
var
  sLista, sSql: String;
  qry: TSDQuery;
begin
  sLista := '';

  sSql := 'SELECT B.TB_CODIGO CODERROR_SEGERRUSU ' +
            'FROM CTB_TABLAS B, CTB_TABLAS A, TMP.TIE_IMPOREPOSARCH_ERROR ' +
           'WHERE IE_IDIMPOREPOSITORIOARCHIVO = :Id ' +
             'AND A.TB_CLAVE = ''REAGA'' ' +
             'AND A.TB_CODIGO = IE_CODERROR ' +
             'AND B.TB_CLAVE = ''EUAGA'' ' +
             'AND B.TB_CODIGO = A.TB_ESPECIAL1 ' +
             'AND B.TB_FECHABAJA IS NULL';
  qry := GetQueryEx(sSql, [IdImpoRepositorioArchivo]);

  with qry do
    try
      while not Eof do
        begin
          sLista := sLista + SqlValue(FieldByName('CODERROR_SEGERRUSU').AsString) + ',';

          Next;
        end;

      sLista := CutRight(sLista, 1);
    finally
      Free;
    end;

  Result := sLista;
end;

procedure TfrmImportarImagRepositorio.DoRevalidarRegActual(ValidarImagen: Boolean; var Warnings, Errores: Integer);
var
  sSql: String;
begin
  sSql := 'DELETE FROM TMP.TIE_IMPOREPOSARCH_ERROR ' +
                'WHERE IE_IDIMPOREPOSITORIOARCHIVO = :Id';
  EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('IRID').AsInteger]);

  DoValidarRegistro(ValidarImagen, psPathArchivoImportacion, sdqConsulta, pbExisteNroMedioReposit, Warnings, Errores);
end;

procedure TfrmImportarImagRepositorio.tbRevalidarParcialClick(Sender: TObject);
var
  i, iWarnings, iErrores: Integer;
  bValidarImagen: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');

  if MsgBox('¿Confirma la revalidación de los registros actuales de la grilla?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      pbImportacionOK := False;

      jvpgProgreso.Visible := True;
      try
        with sdqConsulta do
          begin
            First;

            if not Eof then
              begin
                i := 0;
                bValidarImagen := False;

                with jvpgProgreso do
                  begin
                    Min := 1;
                    Max := RecordCount;
                  end;

                while not Eof do
                  begin
                    Inc(i);
                    jvpgProgreso.Position := i;

                    DoRevalidarRegActual(bValidarImagen, iWarnings, iErrores);

                    if ((i-1) Mod CANTREGACT) = 0 then
                      Application.ProcessMessages;

                    Next;
                  end;

                DoActualizarDatosRevalidacion(False);
                tbImportar.Enabled := False;
                Application.ProcessMessages;
              end;
          end;

        pbImportacionOK := True;
        RefreshData;
      finally
        jvpgProgreso.Visible := False;
      end;
    end;
end;

procedure TfrmImportarImagRepositorio.tbRevalidarRegistroClick(Sender: TObject);
var
  iWarnings, iErrores: Integer;
  bValidarImagen: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Solo puede seleccionar un registro en la grilla.');

  bValidarImagen := False;

  iWarnings := 0;
  iErrores  := 0;

  if MsgBox('¿Confirma la revalidación del registro actualmente seleccionado?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      DoRevalidarRegActual(bValidarImagen, iWarnings, iErrores);

      DoActualizarDatosRevalidacion(False);
      tbImportar.Enabled := False;

      sdqConsulta.Refresh;
      sdqConsultaAfterScroll(nil);
    end;
end;

procedure TfrmImportarImagRepositorio.edSecDesdeExit(Sender: TObject);
begin
  if not edSecDesde.IsEmpty and edSecHasta.IsEmpty then
    edSecHasta.Value := edSecDesde.Value;
end;

procedure TfrmImportarImagRepositorio.tbPrepararRemitoClick(Sender: TObject);
var
  iRemito: TTableId;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');
      Verificar(FieldByName('REMITO').IsNull, Grid, 'Debe seleccionar un registro con nro. de remito.');

      iRemito := FieldByName('REMITO').AsInteger;

      TFrmArmadoRemito.DoMostrarRemito(iRemito);
    end;
end;

procedure TfrmImportarImagRepositorio.tbDocsArchivoClick(Sender: TObject);
var
  sCodTipoArchivo: String;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');
      Verificar(FieldByName('CODARCHIVO').IsNull, Grid, 'Debe seleccionar un registro con código de archivo.');

      sCodTipoArchivo := FieldByName('CODARCHIVO').AsString;

      TfrmManRAD_ARCHIVODOCUMENTO.DoMostrarDocsArchivo(sCodTipoArchivo);
    end;
end;

procedure TfrmImportarImagRepositorio.tbConsultaCarpetasClick(Sender: TObject);
var
  sClave: String;
  iTipoArchivo: TTableId;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');
      Verificar(FieldByName('CODARCHIVO').IsNull, Grid, 'Debe seleccionar un registro con código de archivo.');
      Verificar(FieldByName('CLAVE').IsNull, Grid, 'Debe seleccionar un registro con clave.');

      iTipoArchivo := FieldByName('TIPOARCHIVO').AsInteger;
      sClave       := FieldByName('CLAVE').AsString;

      TFrmConsultaCarpetas.DoMostrarCarpeta(iTipoArchivo, sClave);
    end;
end;

function TfrmImportarImagRepositorio.IsValidarCodigo(Codigo: String; Validar: Boolean): Boolean;
begin
  Result := Validar or (Get_CTBEspecial2('REAGA', Codigo) = 'S');   // TB_ESPECIAL2 = 'S' significa que ese código se debe validar siempre
end;

procedure TfrmImportarImagRepositorio.tbCartasDocClick(Sender: TObject);
var
  sNroCartaDoc: String;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');
      Verificar(FieldByName('NRODOCUMENTO').IsNull, Grid, 'Debe seleccionar un registro con número de carta documento.');

      sNroCartaDoc := FieldByName('NRODOCUMENTO').AsString;

      TfrmConsultaCartasDoc.DoMostrarCartaDocumento(sNroCartaDoc);
    end;
end;

procedure TfrmImportarImagRepositorio.tbMaximizarImagenClick(Sender: TObject);
var
  iTop: Integer;
begin
  pbCargarImagenes := True;
  iTop := fpImagen.Top;
  try
    ResetearTimer;
    fpImagen.Top     := Screen.Height + 1; 
    fpImagen.Visible := True;
    fraVistaTIFFImgtbMaxMinimizarClick(nil);
  finally
    pbCargarImagenes := False;
    fpImagen.Visible := False;
    fpImagen.Top     := iTop;
  end;
end;

procedure TfrmImportarImagRepositorio.fraVistaTIFFImgtbMaxMinimizarClick(Sender: TObject);
begin
  inherited;
  fraVistaTIFFImg.tbMaxMinimizarClick(Sender);
end;

procedure TfrmImportarImagRepositorio.tbPropiedadesClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  with sdqConsulta do
    begin
      DisableControls;
      try
        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            Verificar(FieldByName('CODDOCS_CLAVELOTE').IsNull, nil, 'Alguno de los registros seleccionados no tiene cód. de documento del sistema.');
            Verificar(InStr(FieldByName('CODDOCS_CLAVELOTE').AsString, '/') > 0, nil, 'Alguno de los registros seleccionados no tiene un único cód. de documento del sistema.');
          end;
      finally
        EnableControls;
      end;
    end;

  sdqConsulta.DisableControls;
  try
    if MsgBox('¿Confirma el traspaso de los códigos de documento del sistema seleccionados a los códigos de documento del archivo?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
      begin
        BeginTrans;
        try
          with sdqConsulta do
            begin
              for i := 0 to Grid.SelectedRows.Count - 1 do
                begin
                  GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                  sSql := 'UPDATE TIR_IMPOREPOSITORIOARCHIVO ' +
                             'SET IR_CODDOCUMENTO = :CodDocSistema ' +
                           'WHERE IR_ID = :Id';
                  EjecutarSqlSTEx(sSql, [FieldByName('CODDOCS_CLAVELOTE').AsString, FieldByName('IRID').AsInteger]);
                end;
            end;

          CommitTrans;
          MsgBox('Códigos de documento traspasados correctamente.', MB_ICONINFORMATION);

          Grid.UnselectAll;
          sdqConsulta.Refresh;
          DoActualizarDatosRevalidacion(True);
        except
          on E:Exception do
            begin
              Rollback;
              Raise Exception.Create(E.Message + CRLF + 'Error al traspasar los códigos de documento.');
            end;
        end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmImportarImagRepositorio.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;
end;

procedure TfrmImportarImagRepositorio.mnuExportarGrillaClick(Sender: TObject);
begin
  inherited tbExportarClick(nil);
end;

procedure TfrmImportarImagRepositorio.mnuExportarCajaExpoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');

  ImpoExpoWizard('EXAGA')
end;

procedure TfrmImportarImagRepositorio.tbValidarCargaCDClick(Sender: TObject);
var
  iNroMedio: Integer;
  sSql: String;
begin
  CommitTrans(True);

  while True do
    begin
      iNroMedio := InputBoxInteger('Validación de Carga del CD', 'Nro. CD', 0, MINROMEDIO);

      if iNroMedio <= 0 then
        Break;

      sSql := 'SELECT 1 ' +
                'FROM RRA_REPOSITORIOARCHIVO ' +
               'WHERE RA_NROMEDIO = :NroMedio ' +
                 'AND RA_FECHABAJA IS NULL';

      if ExisteSqlEx(sSql, [iNroMedio]) then
        MsgBox('El CD ha sido cargado.', MB_ICONINFORMATION)
      else
        MsgBox('Atención: El CD NO ha sido cargado.', MB_ICONERROR);
    end;
end;

procedure TfrmImportarImagRepositorio.pmnuBajaRegistrosClick(Sender: TObject);
begin
  DoEliminarRegistros;
end;

procedure TfrmImportarImagRepositorio.pmnuLimpiarCamposClick(Sender: TObject);
begin
  DoLimpiarCamposRegistros;
end;

procedure TfrmImportarImagRepositorio.pmnuPreparaLotePorLoteClick(Sender: TObject);
var
  iLote: TTableId;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');
      Verificar(FieldByName('LOTE').IsNull, Grid, 'Debe seleccionar un registro con nro. de lote.');

      iLote := FieldByName('LOTE').AsInteger;

      TFrmArmadoLote.DoMostrarLote(iLote);
    end;
end;

procedure TfrmImportarImagRepositorio.tbPrepararLoteClick(Sender: TObject);
begin
  tbPrepararLote.CheckMenuDropdown;
end;

procedure TfrmImportarImagRepositorio.pmnuPreparaLotePorSecTrazabilClick(Sender: TObject);
var
  iSecuenciaTraz: Integer;
begin
  with sdqConsulta do
    begin
      Verificar(not Active or IsEmpty, Grid, 'La grilla está vacía.');
      Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar solo un registro en la grilla.');
      Verificar(FieldByName('SECUENCIATRAZABIL').IsNull, Grid, 'Debe seleccionar un registro con nro. de secuencia de trazabilidad');

      iSecuenciaTraz := FieldByName('SECUENCIATRAZABIL').AsInteger;

      TFrmArmadoLote.DoMostrarSecTrazabilidad(iSecuenciaTraz);
    end;
end;

function TfrmImportarImagRepositorio.IsArchivoConSecTrazabilidad: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM TIR_IMPOREPOSITORIOARCHIVO ' +
           'WHERE IR_USUARIO = :Usuario ' +
             'AND IR_SECUENCIATRAZABIL > 0';

  Result := ExisteSqlEx(sSql, [Sesion.UserId]);
end;

function TfrmImportarImagRepositorio.IsValidarEliminar: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  Result := True;
end;

procedure TfrmImportarImagRepositorio.DoEliminarRegistros;
var
  sSql: String;
  i: Integer;
begin
  if IsValidarEliminar() then
    begin
      sdqConsulta.DisableControls;
      try
        if MsgBox('¿Confirma la baja de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
          begin
            BeginTrans;
            try
              with sdqConsulta do
                begin
                  for i := 0 to Grid.SelectedRows.Count - 1 do
                    begin
                      GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                      sSql := 'DELETE FROM TIR_IMPOREPOSITORIOARCHIVO  ' +
                               'WHERE IR_ID = :Id';
                      EjecutarSqlSTEx(sSql, [FieldByName('IRID').AsInteger]);
                    end;
                end;

              CommitTrans;
              MsgBox('Registros dados de baja correctamente.', MB_ICONINFORMATION);

              Grid.UnselectAll;
              sdqConsulta.Refresh;
              DoActualizarDatosRevalidacion(True);
              CalcTotales;
            except
              on E:Exception do
                begin
                  Rollback;
                  Raise Exception.Create(E.Message + CRLF + 'Error al dar de baja los registros.');
                end;
            end;
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;

function TfrmImportarImagRepositorio.GetDatosSql: aDatosSql;
var
  i: Integer;
begin
  SetLength(Result, MAXCOLS_OPT + 1);

  for i := 0 to MAXCOLS_OPT do
    begin
      Result[i] := TDatosSql.Create;
      with Result[i] do
        begin
          NombreCampo      := CAMPOS_OPT[i, 0];
          DescripcionCampo := CAMPOS_OPT[i, 1];
        end;
    end;
end;

procedure TfrmImportarImagRepositorio.DoLimpiarCamposRegistros;
var
  sSqlUpd, sSql: String;
  i: Integer;
  DatosSql: aDatosSql;
begin
  if IsValidarEliminar() then
    begin
      DatosSql := GetDatosSql();
      try
        sSqlUpd  := GetSqlArmado(tsUpdateNull, 'TIR_IMPOREPOSITORIOARCHIVO', DatosSql);

        if not IsEmptyString(sSqlUpd) then
          begin
            sdqConsulta.DisableControls;
            try
              if MsgBox('¿Confirma limpiar los campos indicados de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
                begin
                  BeginTrans;
                  try
                    with sdqConsulta do
                      begin
                        for i := 0 to Grid.SelectedRows.Count - 1 do
                          begin
                            GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                            sSql := sSqlUpd +
                                    'WHERE IR_ID = :Id';
                            EjecutarSqlSTEx(sSql, [FieldByName('IRID').AsInteger]);
                          end;
                      end;

                    CommitTrans;
                    MsgBox('Campos limpiados correctamente.', MB_ICONINFORMATION);

                    Grid.UnselectAll;
                    sdqConsulta.Refresh;
                    DoActualizarDatosRevalidacion(True);
                    CalcTotales;
                  except
                    on E:Exception do
                      begin
                        Rollback;
                        Raise Exception.Create(E.Message + CRLF + 'Error al limpiar los campos.');
                      end;
                  end;
                end;
            finally
              sdqConsulta.EnableControls;
            end;
          end;
      finally
        for i := 0 to MAXCOLS_OPT do
          DatosSql[i].Free;
      end;
    end;
end;

end.

