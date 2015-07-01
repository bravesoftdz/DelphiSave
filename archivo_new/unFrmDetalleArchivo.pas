{-----------------------------------------------------------------------------
 Unit Name: unFrmDetalleArchivo
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Interfaz que permite mostrar el detalle del archivo, solicitud sobre
            el mismo, el contenido, y sus movimientos.
 History:   0.0 VersiUón Inicial
-----------------------------------------------------------------------------}

unit unFrmDetalleArchivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PatternEdit, IntEdit, StdCtrls, Mask, ToolEdit, CurrEdit,
  ComCtrls, ToolWin, AxCtrls, OleCtrls, ExtCtrls,
  JvgGroupBox, DB, SDEngine, DBOleCtl, JvExComCtrls, JvComCtrls, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, DateComboBox, JvExExtCtrls,
  JvNetscapeSplitter, unFraDetalleArchivo, ImgList, unArtFrame,
  unFraVistaTIFF, Placemnt, ShortCutControl, SortDlg, FormPanel, Menus,
  ComboEditor, CheckCombo, DBCheckCombo, FolderDialog, FieldHider,
  QueryToFile, ExportDialog, RxPlacemnt, unArt;

type
  tMoverCursor = (mcFirst, mcLast, mcNext, mcPrior);

  TFrmDetalleArchivo = class(TForm)
    pcDetalleArchivo: TJvPageControl;
    tsDetalleContenido: TTabSheet;
    tsDetalleDeMovimientos: TTabSheet;
    pnlVistaPrevia: TPanel;
    dbgDetalleMovimientosDocumentacion: TArtDBGrid;
    tsDetalleArchivo: TTabSheet;
    sdqContenido: TSDQuery;
    dsContenido: TDataSource;
    splitter: TJvNetscapeSplitter;
    pnlDetalleContenido: TPanel;
    dbgDetalleContenido: TArtDBGrid;
    sdqHistoricoArchivo: TSDQuery;
    dsHistoricoArchivo: TDataSource;
    fraDetalleArchivoDetalleCarpeta: TfraDetalleArchivo;
    pnlVistas: TPanel;
    btnVerImagenes: TButton;
    spCursorImagenes: TSDStoredProc;
    dsImagenes: TDataSource;
    chkVerTodas: TCheckBox;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbOrdenar: TToolButton;
    sep1: TToolButton;
    FormStorage: TFormStorage;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    dbgDetalleGD: TArtDBGrid;
    chkVistaGD: TCheckBox;
    SortDialogGD: TSortDialog;
    sdqImagenes: TSDQuery;
    tbEnviarMail: TToolButton;
    sep2: TToolButton;
    tbEnviarMailImagenesGD: TToolButton;
    fpSolicitudImagenes: TFormPanel;
    BevelAbm: TBevel;
    btnSolicImagenesAceptar: TButton;
    btnSolicImagenesCancelar: TButton;
    rgUrgencia: TRadioGroup;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tbImpresionMasivaGD: TToolButton;
    sdqDocumentos: TSDQuery;
    dsDocumentos: TDataSource;
    pnlFiltros: TPanel;
    Label1: TLabel;
    cmbDocumentos: TDBCheckCombo;
    Label2: TLabel;
    cmbLotes: TDBCheckCombo;
    sdqLotes: TSDQuery;
    dsLotes: TDataSource;
    tbLimpiar: TToolButton;
    tmrImagenes: TTimer;
    fraVistaTIFF: TfraVistaTIFF;
    tbGuardarMasivaGD: TToolButton;
    Label3: TLabel;
    cmbTiposArchivos: TDBCheckCombo;
    sdqTiposArchivos: TSDQuery;
    dsTiposArchivos: TDataSource;
    FieldHiderDetalleGD: TFieldHider;
    FieldHiderDetalleContenido: TFieldHider;
    tbMostrarOcultarColumnas: TToolButton;
    fdGuardar: TSaveDialog;
    tbExportar: TToolButton;
    ExportDialog: TExportDialog;
    ExportDialogGD: TExportDialog;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    pmnuEnviarMail: TPopupMenu;
    pmnuEnviarMailSolicImagenes: TMenuItem;
    pmnuEnviarMailSolicDocComplementaria: TMenuItem;
    ilByN2: TImageList;
    ilColor2: TImageList;
    chkInconsistencias: TCheckBox;
    tbDocOriginal: TToolButton;
    chkSoloInconsistenciasTraz: TCheckBox;
    mnuInvertirSeleccion: TMenuItem;
    tbImprimir: TToolButton;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    pnlNoMostrarDoc: TPanel;
    chkNoMostrarDoc: TCheckBox;
    pmnuGuardarMasivamente: TPopupMenu;
    pmnuGuardarMasArchivosInd: TMenuItem;
    pmnuGuardarMasArchivoMultitiff: TMenuItem;
    pmnuGuardarMasArchivoPdf: TMenuItem;
    mnuDocOriginal: TPopupMenu;
    mnuDocOriginalRetiro: TMenuItem;
    mnuDocOriginalDevolucion: TMenuItem;
    procedure btnVerImagenesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraVistaTIFFtbPageFirstClick(Sender: TObject);
    procedure fraVistaTIFFtbPagePriorClick(Sender: TObject);
    procedure fraVistaTIFFtbPageNextClick(Sender: TObject);
    procedure fraVistaTIFFtbPageLastClick(Sender: TObject);
    procedure dbgDetalleContenidoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure chkVerTodasClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure chkVistaGDClick(Sender: TObject);
    procedure ResetearTimer(DataSet: TDataSet);
    procedure tbEnviarMailImagenesGDClick(Sender: TObject);
    procedure fpSolicitudImagenesEnter(Sender: TObject);
    procedure btnSolicImagenesAceptarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbImpresionMasivaGDClick(Sender: TObject);
    procedure RefrescarFiltros(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tmrImagenesTimer(Sender: TObject);
    procedure fraVistaTIFFtbImprimirClick(Sender: TObject);
    procedure MoverEnBotonesVerticales(Sender: TObject);
    procedure dbgDetalleContenidoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDetalleContenidoCellClick(Column: TColumn);
    procedure sdqContenidoBeforeOpen(DataSet: TDataSet);
    procedure dbgDetalleContenidoGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure sdqContenidoAfterOpen(DataSet: TDataSet);
    procedure dbgDetalleContenidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgDetalleGDDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sdqImagenesBeforeOpen(DataSet: TDataSet);
    procedure dbgDetalleGDGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure sdqImagenesAfterOpen(DataSet: TDataSet);
    procedure dbgDetalleGDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure fraVistaTIFFmnuGuardarImagenOriginalClick(Sender: TObject);
    procedure tbGuardarMasivaGDClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure pmnuEnviarMailSolicImagenesClick(Sender: TObject);
    procedure pmnuEnviarMailSolicDocComplementariaClick(Sender: TObject);
    procedure dbgDetalleGDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbDocOriginalClick(Sender: TObject);
    procedure chkSoloInconsistenciasTrazClick(Sender: TObject);
    procedure mnuInvertirSeleccionClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure DoGuardarMasivamente(Sender: TObject);
    procedure mnuDocOriginalRetiroClick(Sender: TObject);
    procedure mnuDocOriginalDevolucionClick(Sender: TObject);
  private
    tslCheckeados: TStringList;
    pLote, pIdArchivo: Integer;
    pIdArchivos: String;
    FFileActual: Integer;
    psTipoConsulta: String;
    pbImprimiendo, pbDetalleImagenes, pbPreguntarMasImagenes, pbVerImagenes, pbCargarImagenes: Boolean;
    pbMostrarPanelBajas: Boolean;
    procedure OcultarColumnasGrillas(TipoConsulta: String);
    procedure CargarDetalleContenido(AIdArchivo, ALote: Integer; AIdArchivos, AWhereFiltrosAdicionales, AWhereFiltrosAdicionalesExt: String; VerificarPermisoAccesos: Boolean = False);
    procedure CargarDetalleMovimientos(AIdArchivo: Integer);
    function DoCargarImagenesArchivo(AIdArchivo, AIdDetalleArchivo, ALote: Integer; VistaMasiva: Boolean): Integer;
    procedure MostrarImagenesGD;
    procedure CargarImagenes(AIdArchivo, AIdDetalleArchivo, ALote: Integer; AIdArchivos: String);
    procedure CargarCombosFiltros(VistaGD: Boolean);
    procedure MostrarImagen(Mover: tMoverCursor);
    procedure MostrarImagenGD(PathImagen: String; TipoArchivo: TTableId);
    procedure CalcTotales;
    procedure MostrarGrillaImagenes;
    procedure MostrarControles;
    procedure RefrescarGrilla(VistaGD: Boolean);
    procedure FiltrarAdicionales;
    procedure LimpiarFiltros;
    procedure CerrarTodosQuerys;
    procedure CerrarQuerysFiltros;
    procedure CargarNombreGuardarImg(EsMasivo: Boolean = False; Indice: Integer = 0; DirDestino: String = ''; NombreArchivo: String = '');
    function TieneRestriccionesAccesoTipoArchivo(FiltroAdic: String): Boolean;
    procedure DoLimpiarTablaTempImagenes;
    procedure DoValidarMailSolicitudes;
    function DoValidarRetiroDocOriginal(var PrinPointer: TBookMark): Boolean;
    function DoValidarDevolucionDocOriginal(var PrinPointer: TBookMark): Boolean;
    function DoArmarCuerpoMail(DocOriginalComplementaria: Boolean): String;
    function GetTituloPantalla(AIdArchivo: Integer): String;
  public
    class procedure MostrarDetalleArchivo(AOwner: TComponent; AIdArchivo: Integer; VerImagenes: Boolean = False);
    class procedure MostrarDetalleArchivoLote(AOwner: TComponent; ALote: Integer; VerImagenes: Boolean = False);
    class procedure MostrarDetalleArchivos(AOwner: TComponent; AIdArchivos: String; VerImagenes: Boolean = False; ATitulo: String = ''; MostrarDetalleCarpeta: Boolean = False; AIdArchivoCarpeta: Integer = ART_EMPTY_ID);
    class procedure MostrarDetalleImagenes(AOwner: TComponent);
  end;

const
  SMCampoFila     = 'FILA';
  SMCampoCheckBox = 'CHECKBOX';

  VERIMAGENES     : string = 'Imágenes >';
  OCULTARIMAGENES : string = '< Ocultar';
  COLORDOCINDEXADO: TColor = $005E92FF;
  MAXIMAGPORMAIL  : Integer = 200;
  MAXCOLS = 0;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('HOJAS');
  SQL_CONTENIDO : string =
    'SELECT 0 ' + SMCampoCheckBox + ', ' +
           'RTD.TD_DESCRIPCION TIPODOCUMENTO, RTD.TD_CODIGO CODIGOTIPODOCUMENTO, ' +
           'RDA.DA_NUMERO NUMEROSECUENCIA, AR_ID, ' +
           'DECODE (DA_OPCIONDESTINO, ' +
                   '''D'', ''Digitalizacion'', ' +
                   '''G'', ''Guarda'', ' +
                   '''A'', ''Archivo ART'', ' +
                   '''S'', ''Sin Papel'', ' +
                   '''U'', ''Digit. por Usuario'' ' +
                   ') OPCION, ' +
           'RDA.DA_HOJAS HOJAS, RDA.DA_CODIGODOCUMENTO CODIGODOCUMENTO, TA_TABLA TABLAARCH, AR_CLAVE CLAVE, ' +
           'RDA.DA_OBSERVACIONES OBSERVACIONES, RDA.DA_LOTE LOTE, RDA.DA_SEQ_LOTE SECUENCIALOTE, ' +
           'RDA.DA_TIPOALTA TIPOALTA, TRUNC(DA_FECHALTA) FALTA, RDA.DA_SECUENCIATRAZABIL SECUENCIATRAZABIL, ' +
           'RDA.DA_USUBAJA USUARIOBAJA, TRUNC(RDA.DA_FECHABAJA) FECHABAJA, RDA.DA_USUALTA USUARIOALTA, TRUNC(RDA.DA_FECHALTA) FECHAALTA, ' +
           'RDA.DA_USUMODIF USUARIOMODIF, RDA.DA_FECHAMODIF FECHAMODIF, RDA.DA_ID IDDETALLEARCHIVO, ' +
           'RE_ID REMITO, TRUNC(RE_FECHAALTA) FALTAREMITO, LO_CAJA CAJA, LO_UBICACION UBICACIONLOTE, ' +
           'DECODE (LO_TIPOUBICACION, ' +
                   '''U'', ''USUARIO'', ' +
                   '''G'', ''ADMINISTRADORA'' ' +
                   ') TIPOUBICACIONLOTE, ' +
           'ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) DESCRIPCIONCLAVE, TRUNC(RE_FECHAALTA) FECHAALTAREMITO, TA_ID IDTIPOARCH, ' +
           'DA_FECHAVISITA FECHAVISITA, TA_DESCRIPCION DESCRTIPOARCH, LO_USUALTA USUALTALOTE, TRUNC(LO_FECHAALTA) FECHAALTALOTE, ' +
           'AR_UBICACION UBICCARPETA, LO_ESTADO ESTADOLOTE, DA_OBSERV_RETIRODOC, DA_USU_RETIRODOC, DA_FECHA_RETIRODOC, ' +
           'ARCHIVO.GET_LISTACODDOCSECTRAZ_ADMIN(RDA.DA_SECUENCIATRAZABIL) CODDOCADMINISTRADORA, AR_TIPO TIPOARCHIVO, ' +
           'DA_CODIGODOCUMENTO NROCARTA, TA_FORMULARIO FORMULARIO ' +
      'FROM RAR_ARCHIVO, RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RLO_LOTE, RRE_REMITO, RDA_DETALLEARCHIVO RDA, RTD_TIPODOCUMENTO RTD ' +
     'WHERE RTD.TD_ID = RDA.DA_IDTIPODOCUMENTO ' +
       'AND DA_LOTE = LO_ID(+) ' +
       'AND LO_FECHABAJA(+) IS NULL ' +
       'AND LO_IDREMITO = RE_ID(+) ' +
       'AND RDA.DA_IDARCHIVO = AR_ID ' +
       'AND AR_TIPO = TA_ID ' +
       'AND TA_FORMULARIO = TC_CLAVE ';

var
  TotalConsulta: Array of Extended;
  FrmDetalleArchivo: TFrmDetalleArchivo;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, StrFuncs, General, DbFuncs,
  unConstantArchivo, unUtilsArchivo, unSesion, unComunesMail, unMoldeEnvioMail,
  AnsiSql, StrUtils, Types, unGrids, FileCtrl, ArchFuncs, VCLExtra, unAfiliaciones,
  unsiniestros, unArchivo, unImageFunctions, unExportPDF, unMensajeAlerta;

{$R *.dfm}

function TFrmDetalleArchivo.GetTituloPantalla(AIdArchivo: Integer): String;
var
  sClave, sInfoExtra, sTitDet, sInfoExtraTitulo, sEstMediacion, sSql: String;
  TipoArchivo: TTableId;
begin
  TipoArchivo := Get_TipoArchivo(AIdArchivo);

  if AreIn(IntToStr(TipoArchivo), [IntToStr(ID_CARPETA_JUICIOPD), IntToStr(ID_CARPETA_JUICIOPA), IntToStr(ID_CARPETA_MEDIACIONES)]) then
    begin
      case TipoArchivo of
        ID_CARPETA_MEDIACIONES:
          sSql := 'SELECT '' -  Expte. '' || TRIM(ME_EXPEDIENTE) || '' - '' || SUBSTR(TRIM(ME_DEMANDANTE), 1, 25) || '' C/ '' || TRIM(ME_DEMANDADO) ' +
                    'FROM LEGALES.LME_MEDIACION ' +
                   'WHERE ME_NUMEROFOLIO = :NroFolio';
      else
        begin
          if TipoArchivo = ID_CARPETA_JUICIOPD then
            sEstMediacion := 'J'
          else
            sEstMediacion := 'A';

          sSql := 'SELECT '' - Expte. '' || TRIM(JT_NROEXPEDIENTE) || ''/'' ||  TRIM(JT_ANIOEXPEDIENTE) || '' - '' || SUBSTR(TRIM(JT_DEMANDANTE), 1, 25) || '' C/ '' || TRIM(JT_DEMANDADO) ' +
                    'FROM LEGALES.LJT_JUICIOENTRAMITE ' +
                   'WHERE JT_ESTADOMEDIACION = ' + SqlValue(sEstMediacion) + ' ' +
                     'AND JT_NUMEROCARPETA = :NroCarpeta';
        end;
      end;

      sClave           := Get_ClaveArchivo(AIdArchivo);
      sInfoExtraTitulo := ValorSqlEx(sSql, [sClave]);

      if Sesion.Sector = 'LEGAL' then
        sTitDet := 'Detalle:'
      else
        sTitDet := 'Detalle de Carpeta:';

      sInfoExtra := Get_DescripcionTipoArchivo(TipoArchivo) + ' - ' + Get_DescripcionClave(TipoArchivo, sClave);
    end
  else
    begin
      sInfoExtraTitulo := '';
      sTitDet          := 'Detalle de Carpeta:';
      sInfoExtra       := fraDetalleArchivoDetalleCarpeta.edTipoArchivo.Text + ' - ' + Trim(fraDetalleArchivoDetalleCarpeta.edtDescripcion.Text);
    end;

  Result := sTitDet + ' ' + sInfoExtra + sInfoExtraTitulo;
end;

class procedure TFrmDetalleArchivo.MostrarDetalleArchivo(AOwner: TComponent; AIdArchivo: Integer; VerImagenes: Boolean = False);
begin
  with TFrmDetalleArchivo.Create(AOwner) do
  try
    DoLimpiarTablaTempImagenes;

    pIdArchivo := AIdArchivo;
    tsDetalleArchivo.TabVisible       := True;
    tsDetalleDeMovimientos.TabVisible := True;
    pcDetalleArchivo.ActivePage       := tsDetalleArchivo;

    psTipoConsulta := 'CARP';

    fraDetalleArchivoDetalleCarpeta.CargarDetalleArchivo(AIdArchivo);

    Caption := GetTituloPantalla(AIdArchivo);

    CargarDetalleMovimientos(AIdArchivo);
    CargarDetalleContenido(AIdArchivo, ART_EMPTY_ID, '', '', '', True);

    pbVerImagenes := VerImagenes;

    ShowModal;
  finally
    free;
  end;
end;

class procedure TFrmDetalleArchivo.MostrarDetalleArchivoLote(AOwner: TComponent; ALote: Integer; VerImagenes: Boolean = False);
var
  sDescrTipoArchivo, sSql: String;
begin
  with TFrmDetalleArchivo.Create(AOwner) do
  try
    DoLimpiarTablaTempImagenes;

    pLote := ALote;

    tsDetalleArchivo.TabVisible       := False;
    tsDetalleDeMovimientos.TabVisible := False;
    pcDetalleArchivo.ActivePage       := tsDetalleContenido;

    psTipoConsulta := 'LOTE';

    sSql := 'SELECT TA_DESCRIPCION ' +
              'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RAR_ARCHIVO, ARCHIVO.RDA_DETALLEARCHIVO ' +
             'WHERE DA_LOTE = :Lote ' +
               'AND DA_IDARCHIVO = AR_ID ' +
               'AND AR_TIPO = TA_ID ' +
               'AND DA_FECHABAJA IS NULL';
    sDescrTipoArchivo := ValorSqlEx(sSql, [ALote]);

    Caption := 'Detalle de Lote: ' + IntToStr(ALote) + ' (' + sDescrTipoArchivo + ')';

    CargarDetalleContenido(ART_EMPTY_ID, ALote, '', '', '', True);

    pbVerImagenes := VerImagenes;

    ShowModal;
  finally
    free;
  end;
end;

class procedure TFrmDetalleArchivo.MostrarDetalleArchivos(AOwner: TComponent; AIdArchivos: String; VerImagenes: Boolean = False; ATitulo: String = ''; MostrarDetalleCarpeta: Boolean = False; AIdArchivoCarpeta: Integer = ART_EMPTY_ID);
var
  bMDI, bRecienCreado: Boolean;
begin
  bMDI := Assigned(Application.MainForm) and (Application.MainForm.FormStyle = fsMDIForm) and
          not (Assigned(Screen.ActiveForm) and (Screen.ActiveForm.FormStyle = fsNormal));

  if bMDI then
    AOwner := Application.MainForm;

  if not IsForm(FrmDetalleArchivo) then
    begin
      bRecienCreado     := True;
      FrmDetalleArchivo := TFrmDetalleArchivo.Create(AOwner);
    end
  else
    bRecienCreado := False;

  with FrmDetalleArchivo do
    try
      DoLimpiarTablaTempImagenes;

      tsDetalleArchivo.TabVisible       := False;
      tsDetalleDeMovimientos.TabVisible := False;
      pcDetalleArchivo.ActivePage       := tsDetalleContenido;

      psTipoConsulta := 'CARPMAS';
      pbVerImagenes  := VerImagenes;

      if IsEmptyString(ATitulo) then
        begin
          if MostrarDetalleCarpeta then
            Caption := GetTituloPantalla(AIdArchivoCarpeta)
          else
            Caption := 'Selección Múltiple de Carpetas';
        end
      else
        Caption := ATitulo;

      if pIdArchivos <> AIdArchivos then
        begin
          pIdArchivos := AIdArchivos;
          CargarDetalleContenido(ART_EMPTY_ID, ART_EMPTY_ID, AIdArchivos, '', '', True);
        end;

      if bMDI and not IsEmptyString(ATitulo) then
        begin
          FormStorage.PreventResize := False;
          BorderStyle := bsSizeable;
          BorderIcons := [biMinimize, biMaximize, biSystemMenu];

          with Constraints do
            begin
              MinHeight := 580;
              MinWidth  := 780;
            end;

          FormStyle := fsMDIChild;
          BringToFront;
        end
      else
        if not Visible then
          ShowModal
        else
          BringToFront;
    finally
      if bRecienCreado and (FormStyle <> fsMDIChild) then
        Free;
    end;
end;

class procedure TFrmDetalleArchivo.MostrarDetalleImagenes(AOwner: TComponent);
begin
  with TFrmDetalleArchivo.Create(AOwner) do
  try
    tsDetalleArchivo.TabVisible       := False;
    tsDetalleDeMovimientos.TabVisible := False;
    pcDetalleArchivo.ActivePage       := tsDetalleContenido;

    psTipoConsulta := 'CARPMAS';

    Caption := 'Visualización de Múltiples Imágenes';

    CargarDetalleContenido(ART_EMPTY_ID, ART_EMPTY_ID, '-1', '', '', True);

    pbVerImagenes     := True;
    pbDetalleImagenes := True;

    ShowModal;
  finally
    free;
  end;
end;

procedure TFrmDetalleArchivo.OcultarColumnasGrillas(TipoConsulta: String);
var
  bMostrarClave: Boolean;
begin
  bMostrarClave := ((TipoConsulta = 'CARPMAS') or (TipoConsulta = 'LOTE'));

  dbgDetalleGD.ColumnByField['DESCRTIPOARCH'].Visible           := True;
  dbgDetalleGD.ColumnByField['DESCRIPCIONCLAVE'].Visible        := bMostrarClave;
  dbgDetalleContenido.ColumnByField['DESCRTIPOARCH'].Visible    := True;
  dbgDetalleContenido.ColumnByField['DESCRIPCIONCLAVE'].Visible := bMostrarClave;
end;

procedure TFrmDetalleArchivo.CargarCombosFiltros(VistaGD: Boolean);
var
  sSqlTiposArchivos, sSqlDoc, sSqlLote: String;
begin
  if VistaGD then
    begin
      sSqlDoc := 'SELECT * ' +
                   'FROM (SELECT DECODE(COD, NULL, ''[Sin Código]'', COD) CODDOC, ' +
                                'DECODE(COD, NULL, ''[Sin Código]'', DECODE(DESCR, NULL, COD, DESCR || '' ('' || COD || '')'')) DESCRDOC ' +
                           'FROM (SELECT DISTINCT TRIM(IA_CODIGODOCUMENTO) COD, ARCHIVO.GET_DESCRIPCIONCODDOCUMENTO(IA_TIPO, TRIM(IA_CODIGODOCUMENTO)) DESCR ' +
                                   'FROM TMP.TIA_IMAGENARCHIVO) ' +
                          'UNION ALL ' +
                         'SELECT ''[Todos]'' CODDOC, ''[ Todos ]'' DESCRDOC ' +
                           'FROM DUAL ' +
                        ') ' +
                  'ORDER BY UPPER(DESCRDOC)';

      sSqlLote := 'SELECT DISTINCT IA_LOTE LOTE,  ' +
                         'TRIM(TO_CHAR(IA_LOTE)) || DECODE(LO_ID, NULL, NULL, '' ('' || LO_USUALTA || '' - '' || TO_CHAR(TRUNC(LO_FECHAALTA), ''DD/MM/YYYY'') || '')'') DESCRLOTE ' +
                    'FROM ARCHIVO.RLO_LOTE, TMP.TIA_IMAGENARCHIVO ' +
                   'WHERE IA_LOTE = LO_ID(+) ' +
                     'AND IA_LOTE IS NOT NULL ' +
                   'UNION ALL ' +
                  'SELECT -9999 LOTE, ''[ Todos ]'' DESCRLOTE ' +
                    'FROM DUAL ' +
                   'ORDER BY LOTE';

      sSqlTiposArchivos := 'SELECT DISTINCT IA_TIPO IDTIPOARCH, TA_DESCRIPCION DESCRTIPOARCH ' +
                             'FROM ARCHIVO.RTA_TIPOARCHIVO, TMP.TIA_IMAGENARCHIVO ' +
                            'WHERE IA_TIPO = TA_ID ' +
                              'AND IA_TIPO IS NOT NULL ' +
                            'UNION ALL ' +
                           'SELECT -9999 IDTIPOARCH, ''[ Todos ]'' DESCRTIPOARCH ' +
                             'FROM DUAL ' +
                            'ORDER BY DESCRTIPOARCH';
    end
  else
    begin
      sSqlDoc := 'SELECT * ' +
                   'FROM (SELECT DISTINCT CODIGOTIPODOCUMENTO CODDOC, ' +
                                'TIPODOCUMENTO || '' ('' || CODIGOTIPODOCUMENTO || '')'' DESCRDOC ' +
                           'FROM (' + sdqContenido.Sql.Text + ')' +
                          'UNION ALL ' +
                         'SELECT ''[Todos]'' CODDOC, ''[ Todos ]'' DESCRDOC ' +
                           'FROM DUAL ' +
                        ') ' +
                  'ORDER BY UPPER(DESCRDOC)';

      sSqlLote := 'SELECT DISTINCT LOTE,  ' +
                         'TRIM(TO_CHAR(LOTE)) || '' ('' || USUALTALOTE || '' - '' || TO_CHAR(FECHAALTALOTE, ''DD/MM/YYYY'') || '')'' DESCRLOTE ' +
                    'FROM (' + sdqContenido.Sql.Text + ')' +
                   'WHERE LOTE IS NOT NULL ' +
                   'UNION ALL ' +
                  'SELECT -9999 LOTE, ''[ Todos ]'' DESCRLOTE ' +
                    'FROM DUAL ' +
                   'ORDER BY LOTE';

      sSqlTiposArchivos := 'SELECT DISTINCT IDTIPOARCH, DESCRTIPOARCH ' +
                             'FROM (' + sdqContenido.Sql.Text + ')' +
                            'UNION ALL ' +
                           'SELECT -9999 IDTIPOARCH, ''[ Todos ]'' DESCRTIPOARCH ' +
                             'FROM DUAL ' +
                            'ORDER BY DESCRTIPOARCH';
    end;

  sdqDocumentos.Sql.Text    := sSqlDoc;
  sdqLotes.Sql.Text         := sSqlLote;
  sdqTiposArchivos.Sql.Text := sSqlTiposArchivos;
end;

procedure TFrmDetalleArchivo.CargarDetalleContenido(AIdArchivo, ALote: Integer; AIdArchivos, AWhereFiltrosAdicionales, AWhereFiltrosAdicionalesExt: String; VerificarPermisoAccesos: Boolean = False);
var
  sWherePermiso, sSql, sWhere: String;
begin
  sdqContenido.Close;
  pIdArchivos := AIdArchivos;

  sWherePermiso := ' AND ARCHIVO.IS_PERMISOVERTIPOARCHIVO(TA_ID, ' + SqlValue(Sesion.UserId) + ') = ''S''';

  if AIdArchivo <> ART_EMPTY_ID then
    sWhere := ' AND RDA2.DA_IDARCHIVO = ' + SqlValue(AIdArchivo)
  else if ALote <> ART_EMPTY_ID then
    sWhere := ' AND RDA.DA_LOTE = ' + SqlValue(ALote)
  else
    sWhere := ' AND RDA2.DA_IDARCHIVO IN (SELECT DISTINCT AR_ID ' +
                                          'FROM ARCHIVO.RAR_ARCHIVO ' +
                                         'WHERE AR_ID IN (' + pIdArchivos + '))';

  if ALote = ART_EMPTY_ID then
    // esto es para que tome el tipo de archivo del padre y todos sus descendientes, definidos en ra_idtipoarchivopadre (misma clave y distintos tipos de archivo)
    sWhere := 'AND (AR_TIPO, AR_CLAVE) IN (SELECT RAR3.AR_TIPO, RAR3.AR_CLAVE ' +
                                            'FROM RDA_DETALLEARCHIVO RDA2, RAR_ARCHIVO RAR2, RAR_ARCHIVO RAR3 ' +
                                           'WHERE RDA2.DA_IDARCHIVO = RAR2.AR_ID ' +
                                             'AND RAR2.AR_CLAVE = RAR3.AR_CLAVE ' +
                                             'AND ARCHIVO.IS_TIPOARCHIVORELACIONADO(RAR2.AR_TIPO, RAR3.AR_TIPO) = ''S'' ' +
                                             sWhere + ') ';

  if VerificarPermisoAccesos and TieneRestriccionesAccesoTipoArchivo(sWhere) then
    Caption := Caption + ' *** Acceso restringido al detalle de contenido de ciertas carpetas ***';

  sSql := 'SELECT B.*, ' +
                 'DECODE(B.CODIGODOCUMENTO, ''LOTE'', NULL, DECODE(B.SECUENCIATRAZABIL, NULL, NULL, DECODE(INSTR('' '' || B.CODDOCADMINISTRADORA || '' ''  , '' '' || B.CODIGOTIPODOCUMENTO || '' ''), 0, 1, NULL))) INCONSISTENCIATRAZ_CODDOC ' +
            'FROM (' + SQL_CONTENIDO + sWherePermiso + sWhere + AWhereFiltrosAdicionales + ' ORDER BY TA_DESCRIPCION, RDA.DA_ID) B ';
            
  sSql := 'SELECT DISTINCT ROWNUM ' + SMCampoFila + ', A.*, INCONSISTENCIATRAZ_CODDOC ' +
            'FROM (' + sSql + ') A ' +
           'WHERE 1 = 1 ' +
           AWhereFiltrosAdicionalesExt + ' ' +
           NVL(SortDialog.OrderBy, ' ORDER BY ' + SMCampoFila);

  sdqContenido.Sql.Text := sSql;
  sdqContenido.Open;

  CalcTotales;
end;

procedure TFrmDetalleArchivo.CargarDetalleMovimientos(AIdArchivo : Integer);
begin
  sdqHistoricoArchivo.Close;
  sdqHistoricoArchivo.ParamByName('IdArchivo').AsInteger := AIdArchivo;
  sdqHistoricoArchivo.Open;
end;

procedure TFrmDetalleArchivo.btnVerImagenesClick(Sender: TObject);
begin
  if pbDetalleImagenes then
    VCLExtra.LockControls([btnVerImagenes, chkVistaGD]);

  if btnVerImagenes.Caption = VERIMAGENES then
    begin
      btnVerImagenes.Caption     := OCULTARIMAGENES;
      pnlVistaPrevia.Visible     := True;
      splitter.Visible           := True;
      chkVerTodas.Visible        := not chkVistaGD.Checked;
      chkVerTodas.Left           := pnlVistas.Width - chkVerTodas.Width - 6;
      chkVistaGD.Visible         := True;
      chkVistaGD.Checked         := True;
      chkVistaGD.Left            := pnlVistas.Width - chkVistaGD.Width - 6;
      splitter.Left              := pnlVistaPrevia.Left - 1;
      chkInconsistencias.Visible := True;
      pnlBajas.Visible           := False;
    end
  else
    begin
      btnVerImagenes.Caption     := VERIMAGENES;
      pnlVistaPrevia.Visible     := False;
      chkVistaGD.Visible         := False;
      chkVistaGD.Checked         := False;
      splitter.Visible           := False;
      MostrarControles;
      chkVerTodas.Visible        := False;
      chkInconsistencias.Visible := False;
      pnlBajas.Visible           := pbMostrarPanelBajas;
    end;
end;

procedure TFrmDetalleArchivo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    Close;
end;

function TFrmDetalleArchivo.DoCargarImagenesArchivo(AIdArchivo, AIdDetalleArchivo, ALote: Integer; VistaMasiva: Boolean): Integer;
var
  OldCursor: TCursor;
begin
  with spCursorImagenes do
    begin
      Close;

      if ALote = ART_EMPTY_ID then
        ParamByName('ILOTE').Value := null
      else
        ParamByName('ILOTE').AsInteger := ALote;

      if AIdArchivo = ART_EMPTY_ID then
        ParamByName('IDARCHIVO').Value := null
      else
        ParamByName('IDARCHIVO').AsInteger := Get_IdArchivoTransformado(AIdArchivo, ART_EMPTY_ID);

      if VistaMasiva then
        begin
          ParamByName('VERTODAS').AsString := 'S';
          ParamByName('IDDETALLE').Value   := null;
        end
      else
        begin
          ParamByName('VERTODAS').AsString := 'N';

          if AIdDetalleArchivo = ART_EMPTY_ID then
            ParamByName('IDDETALLE').Value := null
          else
            ParamByName('IDDETALLE').AsInteger := Get_IdArchivoTransformado(ART_EMPTY_ID, AIdDetalleArchivo);
        end;

      OldCursor     := Screen.Cursor;
      Screen.Cursor := crSQLWait;
      try
        Open;
      finally
        Screen.Cursor := OldCursor;
      end;

    Result := ParamByName('RESULTADO').AsInteger;
  end;
end;

procedure TFrmDetalleArchivo.MostrarImagenesGD;
begin
  FiltrarAdicionales;

  if sdqImagenes.IsEmpty then
    fraVistaTIFF.PageCount := 0
  else
    MostrarImagenGD(sdqImagenes.FieldByName('IMAGEN').AsString, sdqImagenes.FieldByName('IDTIPOARCH').AsInteger);
end;

procedure TFrmDetalleArchivo.CargarImagenes(AIdArchivo, AIdDetalleArchivo, ALote: Integer; AIdArchivos: String);
var
  IdArchivoMasivo, iResultado: Integer;
  bOk, bCargaMasivaCarpetas, bVistaMasiva, bCargar: Boolean;
  sSql: String;
begin
  bVistaMasiva         := chkVerTodas.Checked or chkVistaGD.Checked;
  bCargaMasivaCarpetas := not IsEmptyString(AIdArchivos);

  DoLimpiarTablaTempImagenes;

  with fraVistaTIFF do
    begin
      Clear;
      PageCount  := 0;
      Page       := 1;

      if chkVistaGD.Checked and bCargaMasivaCarpetas then
        begin
          bOk := False;

          sSql := 'SELECT DISTINCT AR_ID ID ' +
                    'FROM ARCHIVO.RAR_ARCHIVO ' +
                   'WHERE AR_ID IN (' + pIdArchivos + ')';

          with GetQuery(sSql) do
            try
              while not Eof do
                begin
                  IdArchivoMasivo := FieldByName('ID').AsInteger;
                  iResultado      := DoCargarImagenesArchivo(IdArchivoMasivo, ART_EMPTY_ID, ART_EMPTY_ID, True);
                  bOk             := bOk or (iResultado = 4);

                  Next;
                end;

                if bOk then
                  iResultado := 4
                else
                  iResultado := 5;
            finally
              Free;
            end;
        end
      else
        begin
          if bCargaMasivaCarpetas and chkVerTodas.Checked then    // en este caso, chkVistaGD.Checked da False (sino hubiera entrado por el if). Hice esto porque sinó AIdArchivo = 0...
            iResultado := DoCargarImagenesArchivo(sdqContenido.FieldByName('AR_ID').AsInteger, AIdDetalleArchivo, ALote, bVistaMasiva)
          else
            iResultado := DoCargarImagenesArchivo(AIdArchivo, AIdDetalleArchivo, ALote, bVistaMasiva);
        end;

      bCargar := False;
      case iResultado of
        -1: InfoHint(nil, 'No se encontró la carpeta.');
        -2: InfoHint(nil, 'El tipo de archivo no tiene una asociación con las tablas de G&&D.');
         5: InfoHint(nil, 'No se encontraron imágenes.');
      else
        if iResultado = 4 then
          begin
            if bVistaMasiva or not pbPreguntarMasImagenes then
              bCargar := True
            else if pbPreguntarMasImagenes then
              bCargar := (MsgBox('Se encontraron imágenes en la carpeta, pero sin ningún filtro adicional. ¿Desea verlas a todas?', MB_ICONQUESTION+MB_YESNO) = ID_YES);
          end
        else
          bCargar := True;
      end;

      if bCargar then
        begin
          if chkVistaGD.Checked then
            MostrarImagenesGD
          else
            begin
              PageCount := spCursorImagenes.RecordCount;
              MostrarImagen(mcFirst);
            end;
        end
      else
        begin
          CerrarTodosQuerys;
          Clear;
        end;
    end;
end;

procedure TFrmDetalleArchivo.MostrarImagen(Mover: tMoverCursor);
begin
  if spCursorImagenes.Active and not spCursorImagenes.IsEmpty then
    with fraVistaTIFF do
      try
        Mensaje := '';

        try
          with spCursorImagenes do
            case Mover of
              mcFirst:
                begin
                  Page := 1;
                  First;
                end;
              mcLast:
                begin
                  Page := PageCount;
                  Last;
                end;
              mcNext:
                begin
                  Page := Page + 1;
                  Next;
                end;
              mcPrior:
                begin
                  Page := Page - 1;
                  Prior;
                end;
            end;

//    Image := strReplace(uppercase(spCursorImagenes.FieldByName('IMAGEN').AsString), '\\NTIMAGES\', '\\NTNAS1\');

            if Is_OcultarImagenRepositorio(spCursorImagenes.FieldByName('IDTIPOARCHIVO').AsInteger) then
              Image := ''
            else
              Image := spCursorImagenes.FieldByName('IMAGEN').AsString;
        except
          InfoHint(imgVista, 'Ocurrió un error al intentar cargar la imagen: ' + spCursorImagenes.FieldByName('IMAGEN').AsString + '.');
        end;

        if not FileExists(Image) then
          begin
            Clear;
            Mensaje := 'Error: La imagen no se encuentra en el servidor.';
          end;
      except
        Mensaje := 'Error al leer la imagen.';
      end;
end;

procedure TFrmDetalleArchivo.MostrarImagenGD(PathImagen: String; TipoArchivo: TTableId);
begin
  with fraVistaTIFF do
    try
      if PathImagen <> Image then
        begin
          Mensaje := '';

          try
            PageCount := 1;
            Page      := 1;

            if Is_OcultarImagenRepositorio(TipoArchivo) then
              Image := ''
            else
              Image := PathImagen;
          except
            InfoHint(imgVista, 'Ocurrió un error al intentar cargar la imagen: ' + PathImagen + '.');
          end;

          if not FileExists(Image) then
            begin
              Clear;
              Mensaje := 'Error: La imagen no se encuentra en el servidor.';
            end;
        end;
    except
      Mensaje := 'Error al leer la imagen.';
    end;
end;

procedure TFrmDetalleArchivo.fraVistaTIFFtbPageFirstClick(Sender: TObject);
begin
  MostrarImagen(mcFirst);
end;

procedure TFrmDetalleArchivo.fraVistaTIFFtbPagePriorClick(Sender: TObject);
begin
  MostrarImagen(mcPrior);
end;

procedure TFrmDetalleArchivo.fraVistaTIFFtbPageNextClick(Sender: TObject);
begin
  MostrarImagen(mcNext);
end;

procedure TFrmDetalleArchivo.fraVistaTIFFtbPageLastClick(Sender: TObject);
begin
  MostrarImagen(mcLast);
end;

procedure TFrmDetalleArchivo.dbgDetalleContenidoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0);
end;

procedure TFrmDetalleArchivo.FormCreate(Sender: TObject);
var
  l, t, w, h: Integer;
begin
  GetDesktopDimentions(l, t, w, h);
  Left   := l;
  Top    := t;
  Height := h;
  Width  := w;

  pIdArchivo             := ART_EMPTY_ID;
  pLote                  := ART_EMPTY_ID;
  pIdArchivos            := '';
  psTipoConsulta         := '';
  pbVerImagenes          := False;
  pbDetalleImagenes      := False;
  pbPreguntarMasImagenes := True;
  pbCargarImagenes       := True;
  pbImprimiendo          := False;
  pbMostrarPanelBajas    := GetPerfilAdministrador();

  SetLength(TotalConsulta, MAXCOLS + 1);

  chkVerTodas.Visible        := False;
  chkVistaGD.Visible         := False;
  chkInconsistencias.Visible := False;
  pnlBajas.Visible           := False;
  dbgDetalleGD.Visible       := False;

  mnuDocOriginalDevolucion.Enabled := GetPerfilAdministrador();

  fraVistaTIFF.PanelAuxVisible := True;

  tslCheckeados := TStringList.Create;
end;

procedure TFrmDetalleArchivo.CalcTotales;
var
  PrevCursor: TCursor;
  bCargarImagenesAnt: Boolean;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if sdqContenido.Active then
        begin
          bCargarImagenesAnt := pbCargarImagenes;
          try
            pbCargarImagenes := False;
            SumFields(sdqContenido, CAMPOS_SUMA, TotalConsulta);
          finally
            pbCargarImagenes := bCargarImagenesAnt;
          end;
        end;
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TFrmDetalleArchivo.chkVerTodasClick(Sender: TObject);
begin
  CargarImagenes(pIdArchivo, sdqContenido.FieldByName('IDDETALLEARCHIVO').AsInteger, pLote, pIdArchivos);
end;

procedure TFrmDetalleArchivo.tbOrdenarClick(Sender: TObject);
begin
  if chkVistaGD.Checked then
    begin
      SetSMColumnaCheckVisible(dbgDetalleGD, SMCampoCheckBox, False);
      unArt.LoadDynamicSortFields(SortDialogGD.SortFields, dbgDetalleGD.Columns);
      SortDialogGD.Execute;
      SetSMColumnaCheckVisible(dbgDetalleGD, SMCampoCheckBox);
    end
  else
    begin
      SetSMColumnaCheckVisible(dbgDetalleContenido, SMCampoCheckBox, False);
      unArt.LoadDynamicSortFields(SortDialog.SortFields, dbgDetalleContenido.Columns);
      SortDialog.Execute;
      SetSMColumnaCheckVisible(dbgDetalleContenido, SMCampoCheckBox);
    end;
end;

procedure TFrmDetalleArchivo.MostrarControles;
var
  bVerDetalleGD: Boolean;
begin
  if not pbImprimiendo then
    begin
      bVerDetalleGD := chkVistaGD.Checked;

      LimpiarFiltros;
      CargarCombosFiltros(bVerDetalleGD);

      dbgDetalleGD.Visible           := bVerDetalleGD;
      tbEnviarMailImagenesGD.Visible := bVerDetalleGD;
      tbImpresionMasivaGD.Visible    := bVerDetalleGD;
      tbGuardarMasivaGD.Visible      := bVerDetalleGD;
      chkInconsistencias.Visible     := bVerDetalleGD;
      dbgDetalleContenido.Visible    := not bVerDetalleGD;
      chkVerTodas.Visible            := not bVerDetalleGD and pnlVistaPrevia.Visible;
      tbEnviarMail.Visible           := not bVerDetalleGD;
      sep2.Visible                   := not bVerDetalleGD;
      tbDocOriginal.Visible          := not bVerDetalleGD;
      pnlBajas.Visible               := not bVerDetalleGD and pbMostrarPanelBajas;
      tbImprimir.Visible             := not bVerDetalleGD; 

      tslCheckeados.Clear;
    end;
end;

procedure TFrmDetalleArchivo.chkVistaGDClick(Sender: TObject);
begin
  if pnlVistaPrevia.Visible then
    begin
      MostrarControles;

      if chkVistaGD.Checked then
        begin
          fraVistaTiff.DataSource := dsImagenes;

          if pbDetalleImagenes then
            MostrarImagenesGD
          else
            CargarImagenes(pIdArchivo, ART_EMPTY_ID, pLote, pIdArchivos);
        end
      else
        fraVistaTiff.DataSource := dsContenido;
    end;
end;

procedure TFrmDetalleArchivo.ResetearTimer(DataSet: TDataSet);
begin
  fraVistaTIFF.DoProcessMessages := False;
  try
    if pbCargarImagenes then
      begin
        tmrImagenes.Enabled := False;
        fraVistaTIFF.Image  := '';
        tmrImagenes.Enabled := True;
      end;

    fraVistaTIFF.MoverEnDataSource(nil);
  finally
    fraVistaTIFF.DoProcessMessages := True;
  end;
end;

procedure TFrmDetalleArchivo.tbEnviarMailImagenesGDClick(Sender: TObject);
var
  iCantAdjuntos: Integer;
  vAdjuntos: TArrayOfAttach;
  sNombreArchivo: String;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleGD, 'No existen registros seleccionados en la grilla.');
  Verificar(tslCheckeados.Count > MAXIMAGPORMAIL, dbgDetalleGD, 'Ha superado el máximo de ' + IntToStr(MAXIMAGPORMAIL) + ' imágenes que puede adjuntar en un solo mail.');

  with sdqImagenes do
    begin
      pbCargarImagenes := False;
      DisableControls;
      APointer := GetBookmark;
      try
        iCantAdjuntos := 0;

        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqImagenes, SMCampoFila) then
              begin
                sNombreArchivo := FieldByName('IMAGEN').AsString;

                Inc(iCantAdjuntos);
                SetLength(vAdjuntos, iCantAdjuntos);
                vAdjuntos[iCantAdjuntos - 1] := GetAttach(sNombreArchivo, 0);
              end;

            Next;
          end;

        if EnviarMailBD('', '[Documentación] Solicitud de Archivos de Imágenes - ' + Sesion.Usuario,
                        [TOpcionEnvioMail(oAlwaysShowDialog), TOpcionEnvioMail(oShowDialogIfEmpty), TOpcionEnvioMail(oDisableAsunto)],
                        'Se adjuntan las imágenes solicitadas.', vAdjuntos, 0) then
          InfoHint(tbEnviarMailImagenesGD, 'El e-mail con las imágenes seleccionadas ha sido enviado con éxito.')
        else
          InvalidMsg(tbEnviarMailImagenesGD, 'Error al enviar e-mail con las imágenes seleccionadas.');
      finally
        pbCargarImagenes := True;
        GotoBookmark(APointer);
        EnableControls;
      end;
    end;
end;

procedure TFrmDetalleArchivo.fpSolicitudImagenesEnter(Sender: TObject);
begin
  rgUrgencia.ItemIndex := -1;
end;

procedure TFrmDetalleArchivo.btnSolicImagenesAceptarClick(Sender: TObject);
begin
  Verificar(rgUrgencia.ItemIndex = -1, rgUrgencia, 'Debe indicar la urgencia.');

  fpSolicitudImagenes.ModalResult := mrOk;
end;

procedure TFrmDetalleArchivo.mnuMarcarTodosClick(Sender: TObject);
begin
  pbCargarImagenes := False;
  try
    if chkVistaGD.Checked then
      DoSMMarcarTodos(tslCheckeados, sdqImagenes, SMCampoFila)
    else
      DoSMMarcarTodos(tslCheckeados, sdqContenido, SMCampoFila);
  finally
    pbCargarImagenes := True;
  end;
end;

procedure TFrmDetalleArchivo.mnuDesmarcarTodosClick(Sender: TObject);
begin
  pbCargarImagenes := False;
  try
    if chkVistaGD.Checked then
      DoSMDesmarcarTodos(tslCheckeados, dbgDetalleGD)
    else
      DoSMDesmarcarTodos(tslCheckeados, dbgDetalleContenido);
  finally
    pbCargarImagenes := True;
  end;
end;

procedure TFrmDetalleArchivo.mnuDocOriginalRetiroClick(Sender: TObject);
var
  sSql: String;
  Observac: TStringList;
  bAceptar: Boolean;
  APrinPointer, APointer: TBookMark;
begin
  APointer := sdqContenido.GetBookmark;
  try
    if DoValidarRetiroDocOriginal(APrinPointer) then
      begin
        Observac := TStringList.Create();
        with Observac do
          try
            if tslCheckeados.Count = 1 then
              begin
                sdqContenido.GotoBookmark(APrinPointer);
                Text := sdqContenido.FieldByName('DA_OBSERV_RETIRODOC').AsString
              end
            else
              Text := '';

            bAceptar := InputMemoBox('Observaciones del Retiro de Documentación Original', Observac, False, 255);

            if bAceptar then
              begin
                Verificar(IsEmptyString(Observac.Text), nil, 'Debe ingresar las observaciones.');

                with sdqContenido do
                  begin
                    pbCargarImagenes := False;
                    DisableControls;
                    try
                      BeginTrans;
                      try
                        sSql := 'UPDATE RDA_DETALLEARCHIVO ' +
                                   'SET DA_OBSERV_RETIRODOC = :Observ, ' +
                                       'DA_USU_RETIRODOC = :User, ' +
                                       'DA_FECHA_RETIRODOC = SYSDATE ' +
                                 'WHERE DA_ID = :Id';

                        First;
                        while not Eof do
                          begin
                            if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
                              EjecutarSqlSTEx(sSql, [Trim(Observac.Text), Sesion.UserId, FieldByName('IDDETALLEARCHIVO').AsInteger]);

                            Next;
                          end;

                        CommitTrans;
                        MsgBox('Retiro de documentación guardada correctamente.', MB_ICONINFORMATION);

                        mnuDesmarcarTodos.Click;
                        sdqContenido.Refresh;
                      except
                        on E:Exception do
                          begin
                            RollBack;
                            Raise Exception.Create(E.Message + CRLF + 'Error al guardar el retiro de la documentación original.' );
                          end;
                      end;
                    finally
                      pbCargarImagenes := True;
                      EnableControls;
                    end;
                  end;
              end;
          finally
            Free;
          end;
      end;
  finally
    sdqContenido.GotoBookmark(APointer);
  end;
end;

procedure TFrmDetalleArchivo.tbImpresionMasivaGDClick(Sender: TObject);
var
  APointer: TBookMark;
  sClave, sEncabezado: String;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleGD, 'No existen registros seleccionados en la grilla.');

  with sdqImagenes do
    begin
      pbCargarImagenes := False;
      DisableControls;
      APointer := GetBookmark;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqImagenes, SMCampoFila) then
              begin
                MostrarImagenGD(FieldByName('IMAGEN').AsString, FieldByName('IDTIPOARCH').AsInteger);

                sClave := FieldByName('DESCRIPCIONCLAVE').AsString;
                sEncabezado := 'Archivo: ' + FieldByName('DESCRTIPOARCH').AsString + Iif(IsEmptyString(sClave), '', ' / Clave: ' + sClave);
                fraVistaTIFF.ImprimirImagen(sEncabezado);
              end;

            Next;
          end;

        MsgBox('Fin de la impresión masiva de imágenes.', MB_ICONINFORMATION);
      finally
        pbCargarImagenes := True;
        GotoBookmark(APointer);
        EnableControls;
      end;
    end;
end;

procedure TFrmDetalleArchivo.MostrarGrillaImagenes;
begin
  pcDetalleArchivo.ActivePage := tsDetalleContenido;

  if btnVerImagenes.Caption = VERIMAGENES then
    btnVerImagenesClick(nil)
  else
    chkVistaGDClick(nil);
end;
                     
procedure TFrmDetalleArchivo.RefrescarGrilla(VistaGD: Boolean);
var
  sWhereExt, sWhere, sSql: String;
begin
  sWhere := '';
  fraVistaTiff.Image := '';

  if VistaGD then
    begin
      sSql := 'SELECT B.*, DECODE(B.CODIGODOCUMENTO, ''LOTE'', NULL, DECODE(INSTR('' '' || B.CODDOCS_CLAVELOTE || '' ''  , '' '' || B.CODIGODOCUMENTO || '' ''), 0, 1, NULL)) INCONSISTENCIA_CODDOC, ' +
                          'DECODE(B.CODIGODOCUMENTO, ''LOTE'', NULL, DECODE(B.SECUENCIATRAZABIL, NULL, NULL, DECODE(INSTR('' '' || B.CODDOCDETALLECONT || '' ''  , '' '' || B.CODIGODOCUMENTO || '' ''), 0, 1, NULL))) INCONSISTENCIATRAZ_CODDOC ' +
                'FROM ' +
                '(SELECT DISTINCT 0 ' + SMCampoCheckBox + ', IA_IMAGEN IMAGEN, TA_DESCRIPCION DESCRTIPOARCH, TA_TABLA TABLAARCH, TRIM(IA_CLAVE) CLAVE, ' +
                        'DECODE(TRIM(IA_CODIGODOCUMENTO), NULL, ''[Sin Código]'', TRIM(IA_CODIGODOCUMENTO)) CODIGODOCUMENTO, ' +
                        'IA_LOTE LOTE, IA_SEQ_LOTE SEQ_LOTE, IA_CD CD, ARCHIVO.GET_DESCRIPCIONCODDOCUMENTO(IA_TIPO, TRIM(IA_CODIGODOCUMENTO)) DESCRDOCUMENTO, ' +
                        'DECODE(TRIM(IA_CLAVE), NULL, NULL, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, TRIM(IA_CLAVE))) DESCRIPCIONCLAVE, ' +
                        'IA_TIPO IDTIPOARCH, IA_OBSERVACIONES OBSERVACIONES, IA_NRODOCUMENTO NRODOCUMENTO, IA_HOJA HOJA, IA_LEGAJO LEGAJO, ' +
                        'IA_NROOPERACION_GT NROOPERACION_GT, ART.VARIOS.PUTLASTBAR(VARIOS.GET_DIR_PATH(IA_IMAGEN)) PATHARCHIVO, ' +
                        'VARIOS.GET_FILENAME(IA_IMAGEN) ARCHIVO, IA_BENEFICIARIO_GT BENEFICIARIO_GT, IA_FECHAOPER_GT FECHAOPER_GT, ' +
                        'IA_NROCHEQUE_GT NROCHEQUE_GT, IA_USUALTA USUALTA, TRUNC(IA_FECHAALTA) FECHAALTA, CA_CONTRATO CD_CONTRATO, ' +
                        'CA_RAZON_SOCIAL CD_RAZON_SOCIAL, CA_CUIT CD_CUIT, CA_CUIL CD_CUIL, CA_NOMBRE_TRABAJADOR CD_TRABAJADOR, ' +
                        'CA_SINIESTRO CD_SINIESTRO, ARCHIVO.GET_LISTACODDOCCLAVELOTE(TRIM(IA_CLAVE), IA_LOTE) CODDOCS_CLAVELOTE, ' +
                        'IA_SECUENCIATRAZABIL SECUENCIATRAZABIL, ART.ARCHIVO.GET_LISTACODDOCSECTRAZ_DETCONT(IA_SECUENCIATRAZABIL) CODDOCDETALLECONT ' +
                   'FROM ARCHIVO.VCA_CARTA_ALL, RTC_TIPOCLAVE, RTA_TIPOARCHIVO, TMP.TIA_IMAGENARCHIVO ' +
                  'WHERE IA_TIPO = TA_ID ' +
                    'AND TA_FORMULARIO = TC_CLAVE ' +
                    'AND ARCHIVO.IS_PERMISOVERTIPOARCHIVO(TA_ID, ' + SqlValue(Sesion.UserId) + ') = ''S'' ' +
                    'AND IA_NRODOCUMENTO = CA_NROCARTADOC(+)) B ' +
               'ORDER BY B.DESCRTIPOARCH, UPPER(B.IMAGEN)';

      sSql := 'SELECT DISTINCT ROWNUM ' + SMCampoFila + ', A.* ' +
                'FROM (' + sSql + ') A ' +
               'WHERE 1 = 1 ';

      if InStr(cmbDocumentos.InSql, '[Todos]') = 0 then
        if cmbDocumentos.Text <> '' then
          sWhere := sWhere + ' AND CODIGODOCUMENTO ' + String(Iif(chkNoMostrarDoc.Checked, 'NOT ', '')) + cmbDocumentos.InSql;

      if InStr(cmbLotes.InSql, '-9999') = 0 then
        if cmbLotes.Text <> '' then
          sWhere := sWhere + ' AND LOTE ' + cmbLotes.InSql;

      if InStr(cmbTiposArchivos.InSql, '-9999') = 0 then
        if cmbTiposArchivos.Text <> '' then
          sWhere := sWhere + ' AND IDTIPOARCH ' + cmbTiposArchivos.InSql;

      if chkInconsistencias.Checked then
        sWhere := sWhere + ' AND INCONSISTENCIA_CODDOC IS NOT NULL';

      if chkSoloInconsistenciasTraz.Checked then
        sWhere := sWhere + ' AND INCONSISTENCIATRAZ_CODDOC IS NOT NULL';

      sdqImagenes.Sql.Text := sSql + sWhere + NVL(SortDialogGD.OrderBy, ' ORDER BY ' + SMCampoFila);
      OpenQuery(sdqImagenes);
    end
  else
    begin
      sWhereExt := '';

      if InStr(cmbDocumentos.InSql, '[Todos]') = 0 then
        if cmbDocumentos.Text <> '' then
          sWhere := sWhere + ' AND RTD.TD_CODIGO ' + String(Iif(chkNoMostrarDoc.Checked, 'NOT ', '')) + cmbDocumentos.InSql;

      if InStr(cmbLotes.InSql, '-9999') = 0 then
        if cmbLotes.Text <> '' then
          sWhere := sWhere + ' AND RDA.DA_LOTE ' + cmbLotes.InSql;

      if InStr(cmbTiposArchivos.InSql, '-9999') = 0 then
        if cmbTiposArchivos.Text <> '' then
          sWhere := sWhere + ' AND TA_ID ' + cmbTiposArchivos.InSql;

      if chkNoMostrarBajas.Checked then
        sWhere := sWhere + ' AND RDA.DA_FECHABAJA IS NULL ';

      if chkSoloInconsistenciasTraz.Checked then
        sWhereExt := sWhereExt + ' AND INCONSISTENCIATRAZ_CODDOC IS NOT NULL';

      CargarDetalleContenido(pIdArchivo, pLote, pIdArchivos, sWhere, sWhereExt);
    end;
end;

procedure TFrmDetalleArchivo.RefrescarFiltros(Sender: TObject);
begin
  pbPreguntarMasImagenes := False;
  RefrescarGrilla(chkVistaGD.Checked);
  pbPreguntarMasImagenes := True;
end;

procedure TFrmDetalleArchivo.FiltrarAdicionales;
begin
  CerrarQuerysFiltros;
  RefrescarGrilla(chkVistaGD.Checked);
end;

procedure TFrmDetalleArchivo.LimpiarFiltros;
begin
  CerrarQuerysFiltros;
  chkSoloInconsistenciasTraz.Checked := False;
  chkNoMostrarDoc.Checked            := False;
  FiltrarAdicionales;
end;

procedure TFrmDetalleArchivo.tbLimpiarClick(Sender: TObject);
begin
  LimpiarFiltros;
end;

procedure TFrmDetalleArchivo.CerrarQuerysFiltros;
begin
  sdqDocumentos.Close;
  sdqLotes.Close;
  sdqTiposArchivos.Close;
end;

procedure TFrmDetalleArchivo.CerrarTodosQuerys;
begin
  spCursorImagenes.Close;
  sdqImagenes.Close;
  fraVistaTIFF.MoverEnDataSource(nil);
end;

procedure TFrmDetalleArchivo.tmrImagenesTimer(Sender: TObject);
begin
  tmrImagenes.Enabled := False;
  if pbCargarImagenes then
    begin
      if chkVistaGD.Checked then
        begin
          if sdqImagenes.Active then
            MostrarImagenGD(sdqImagenes.FieldByName('IMAGEN').AsString, sdqImagenes.FieldByName('IDTIPOARCH').AsInteger);
        end
      else
        begin
          if pnlVistaPrevia.Visible then
            CargarImagenes(pIdArchivo, sdqContenido.FieldByName('IDDETALLEARCHIVO').AsInteger, pLote, pIdArchivos);
        end;
    end;
end;

procedure TFrmDetalleArchivo.fraVistaTIFFtbImprimirClick(Sender: TObject);
begin
  fraVistaTIFF.tbImprimirClick(Sender);
end;

procedure TFrmDetalleArchivo.MoverEnBotonesVerticales(Sender: TObject);
begin
  if pnlVistaPrevia.Visible then
    fraVistaTIFF.MoverEnDataSource(Sender);
end;

procedure TFrmDetalleArchivo.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
  tslCheckeados.Free;
end;

procedure TFrmDetalleArchivo.dbgDetalleContenidoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(dbgDetalleContenido, tslCheckeados, SMCampoFila, Rect);
end;

procedure TFrmDetalleArchivo.dbgDetalleContenidoCellClick(Column: TColumn);
begin
  if sdqContenido.Active and not sdqContenido.IsEmpty and (Column.FieldName = SMCampoCheckBox) then
    DoSMMarcarDesmarcarFila(tslCheckeados, dbgDetalleContenido, SMCampoFila);
end;

procedure TFrmDetalleArchivo.dbgDetalleContenidoGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  DoSMGridGetCellProps(tslCheckeados, sdqContenido, SMCampoFila, Background);

  if not sdqContenido.FieldByName('FECHABAJA').IsNull then
    AFont.Color := clRed
  else if not sdqContenido.FieldByName('DA_FECHA_RETIRODOC').IsNull then
    AFont.Color := clBlue;

  if Field.FieldName = 'CODDOCADMINISTRADORA' then
    AFont.Color := COLORDOCINDEXADO;
end;

procedure TFrmDetalleArchivo.dbgDetalleContenidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  DoSMGridKeyDown(Key, dbgDetalleContenido, SMCampoCheckBox);
end;

procedure TFrmDetalleArchivo.sdqContenidoBeforeOpen(DataSet: TDataSet);
begin
  tslCheckeados.Clear;
end;

procedure TFrmDetalleArchivo.sdqContenidoAfterOpen(DataSet: TDataSet);
begin
  DoSMsdqConsultaAfterOpen(dbgDetalleContenido, SMCampoCheckBox);
end;

procedure TFrmDetalleArchivo.dbgDetalleGDDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(dbgDetalleGD, tslCheckeados, SMCampoFila, Rect);
end;

procedure TFrmDetalleArchivo.dbgDetalleGDGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  DoSMGridGetCellProps(tslCheckeados, sdqImagenes, SMCampoFila, Background);

  if Field.FieldName = 'CODDOCDETALLECONT' then
    AFont.Color := COLORDOCINDEXADO;
end;

procedure TFrmDetalleArchivo.dbgDetalleGDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  DoSMGridKeyDown(Key, dbgDetalleGD, SMCampoCheckBox);
end;

procedure TFrmDetalleArchivo.sdqImagenesBeforeOpen(DataSet: TDataSet);
begin
  tslCheckeados.Clear;
end;

procedure TFrmDetalleArchivo.sdqImagenesAfterOpen(DataSet: TDataSet);
begin
  DoSMsdqConsultaAfterOpen(dbgDetalleGD, SMCampoCheckBox);
  if FFileActual > 0 then
  try
    sdqImagenes.Locate('FILA', FFileActual, []);
  except
  end;
end;

procedure TFrmDetalleArchivo.CargarNombreGuardarImg(EsMasivo: Boolean = False; Indice: Integer = 0; DirDestino: String = ''; NombreArchivo: String = '');
var
  sAdicArchivo, sDirDestino, sNombreArch, sClave, sTabla, sSql: String;
begin
  sDirDestino  := PutLastBar(DirDestino);
  sAdicArchivo := '_' + LPad(Indice, '0', 6);

  if chkVistaGD.Checked then
    begin
      sTabla  := sdqImagenes.FieldByName('TABLAARCH').AsString;
      sClave  := sdqImagenes.FieldByName('CLAVE').AsString;
    end
  else
    begin
      sTabla := sdqContenido.FieldByName('TABLAARCH').AsString;
      sClave := sdqContenido.FieldByName('CLAVE').AsString;
    end;

  if sTabla = 'HCE_CARPETAESTAMP' then
    begin
      sSql := 'SELECT REPLACE(TRIM(TJ_NOMBRE), ''.'') ' +
                'FROM CTJ_TRABAJADOR, HYS.HCE_CARPETAESTAMP ' +
               'WHERE CE_CUIL = TJ_CUIL ' +
                 'AND CE_ID = :Id';
      sNombreArch := ValorSqlEx(sSql, [sClave]);
      ValidFileName(sNombreArch, True);

      fraVistaTIFF.NombreGuardarImg := Iif(EsMasivo, sDirDestino, '') + NVL(sNombreArch, NVL(NombreArchivo, 'IMG')) + Iif(EsMasivo, sAdicArchivo, '');
    end
  else
    begin
      if EsMasivo then
        fraVistaTIFF.NombreGuardarImg := sDirDestino + NVL(NombreArchivo, 'IMG') + sAdicArchivo
      else
        fraVistaTIFF.NombreGuardarImg := ''
    end;
end;

procedure TFrmDetalleArchivo.FormActivate(Sender: TObject);
begin
  OnActivate := nil;   // agrego esta linea y comento la llamada a IsCambiandoFocoAlerta porque en XE2 algunas veces, no todas,
                       // desde Visualizar Imagenes, en lugar de ir a la segunda solapa va a la primera...  

//  if not IsCambiandoFocoAlerta() then
//    begin
      if sdqImagenes.Active then
        FFileActual := sdqImagenes.FieldByName('FILA').AsInteger;

      if pbVerImagenes then
        MostrarGrillaImagenes
      else
        MostrarControles;

      OcultarColumnasGrillas(psTipoConsulta);
//    end;
end;

procedure TFrmDetalleArchivo.fraVistaTIFFmnuGuardarImagenOriginalClick(Sender: TObject);
begin
  CargarNombreGuardarImg;
  fraVistaTIFF.GuardarImagen(Sender);
end;

procedure TFrmDetalleArchivo.tbGuardarMasivaGDClick(Sender: TObject);
begin
  tbGuardarMasivaGD.CheckMenuDropdown;
end;

procedure TFrmDetalleArchivo.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  if chkVistaGD.Checked then
    begin
      dbgDetalleGD.ColumnByField[SMCampoCheckBox].Visible := False;
      try
        FieldHiderDetalleGD.Execute
      finally
        dbgDetalleGD.ColumnByField[SMCampoCheckBox].Visible := True;
      end;
    end  
  else
    begin
      dbgDetalleContenido.ColumnByField[SMCampoCheckBox].Visible := False;
      try
        FieldHiderDetalleContenido.Execute;
      finally
        dbgDetalleContenido.ColumnByField[SMCampoCheckBox].Visible := True;
      end;
    end
end;

function TFrmDetalleArchivo.TieneRestriccionesAccesoTipoArchivo(FiltroAdic: String): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM RAR_ARCHIVO, RDA_DETALLEARCHIVO RDA ' +
           'WHERE RDA.DA_FECHABAJA IS NULL ' +
             'AND RDA.DA_IDARCHIVO = AR_ID ' +
             'AND ARCHIVO.IS_PERMISOVERTIPOARCHIVO(AR_TIPO, :Usuario) = ''N'' ' +
             FiltroAdic;

  Result := ExisteSqlEx(sSql, [Sesion.UserId]);
end;

procedure TFrmDetalleArchivo.tbExportarClick(Sender: TObject);
begin
  tbExportar.Enabled := False;
  try
    if chkVistaGD.Checked then
      begin
        SetSMColumnaCheckVisible(dbgDetalleGD, SMCampoCheckBox, False);
        ExportDialogGD.Fields.Assign(dbgDetalleGD.Columns);
        try
          ExportDialogGD.Execute;
        finally
          ExportDialogGD.Fields.Clear;
        end;
        SetSMColumnaCheckVisible(dbgDetalleGD, SMCampoCheckBox);
      end
    else
      begin
        SetSMColumnaCheckVisible(dbgDetalleContenido, SMCampoCheckBox, False);
        ExportDialog.Fields.Assign(dbgDetalleContenido.Columns);
        try
          ExportDialog.Execute;
        finally
          ExportDialog.Fields.Clear;
        end;
        SetSMColumnaCheckVisible(dbgDetalleContenido, SMCampoCheckBox);
      end;
  finally
    tbExportar.Enabled := True;
  end;
end;

procedure TFrmDetalleArchivo.DoLimpiarTablaTempImagenes;
var
  sSql: String;
begin
  sSql := 'DELETE FROM TIA_IMAGENARCHIVO';

  if dmPrincipal.InTransaction then
    EjecutarSqlST(sSql)
  else
    EjecutarSql(sSql);
end;

procedure TFrmDetalleArchivo.tbEnviarMailClick(Sender: TObject);
begin
  tbEnviarMail.CheckMenuDropdown;
end;

procedure TFrmDetalleArchivo.DoValidarMailSolicitudes;
begin
  with sdqContenido do
    begin
      Verificar(FieldByName('LOTE').IsNull, dbgDetalleContenido, 'Cierta documentación requerida (' + FieldByName('TIPODOCUMENTO').AsString + ') aún no fue entregada al Sector de Digitalización y Guarda por ' +
               'parte del usuario que generó la carga al sistema (Usuario: ' + FieldByName('USUARIOALTA').AsString + ' - Fecha de Carga: ' + FieldByName('FALTA').AsString + '). ' +
               'Por tal motivo no existe el número de lote y de la secuencia.' + CRLF +
               'La documentación podría no estar disponible. Solicitar la misma a dicho usuario.');

      if not FieldByName('LOTE').IsNull and AreIn(FieldByName('ESTADOLOTE').AsString, [ESTADOLOTE_USUARIO, ESTADOLOTE_ENTRANSITO]) then
        if MsgBox('Cierta documentación solicitada (' + FieldByName('TIPODOCUMENTO').AsString + ') puede demorar porque el lote que la incluye está en poder del Usuario o En Tránsito. ¿Desea continuar con la solicitud?', MB_ICONQUESTION + MB_YESNO) = IDNO then
          DoSMMarcarDesmarcarFila(tslCheckeados, dbgDetalleContenido, SMCampoFila);
    end;
end;

function TFrmDetalleArchivo.DoArmarCuerpoMail(DocOriginalComplementaria: Boolean): String;
var
  i: Integer;
  sFechaUbicAdmin, sCodUbicAdmin, sSql, sCuerpo: String;
  bEsSiniestro, bEsCartaDocumento, bEsPrimerRegistro: Boolean;
  SqlResults: TStringList;
begin
  i                 := 1;
  sCuerpo           := '';
  bEsPrimerRegistro := True;

  with sdqContenido do
    begin
      First;
      while not Eof do
        begin
          if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
            begin
              if bEsPrimerRegistro then
                begin
                  if DocOriginalComplementaria then
                    sCuerpo := '- Se solicita el envío de la siguiente documentación original complementaria:' + CRLF +
                               '    Usuario Solicitante: ' + Sesion.UserId + CRLF + CRLF +
                               '- Documentos Solicitados:' + CRLF + CRLF
                  else
                    sCuerpo := '- Se solicita el envío de las siguientes imágenes:' + CRLF +
                               '    Usuario Solicitante: ' + Sesion.UserId + CRLF + CRLF +
                               '- Imágenes Solicitadas:' + CRLF + CRLF;

                  bEsPrimerRegistro := False;
                end;

              bEsCartaDocumento := TipoArchivoCartaDocumento(FieldByName('IDTIPOARCH').AsInteger);
              bEsSiniestro      := (FieldByName('FORMULARIO').AsString = TIPOCLAVE_SIN);

              sSql := 'SELECT UB_CODUBICACION_ADMIN, TRUNC(UB_FECHAALTA) ' +
                        'FROM RUB_ARCHIVOUBICACION ' +
                       'WHERE UB_IDARCHIVO = ' + SqlValue(FieldByName('AR_ID').AsInteger);
              SqlResults := ValoresColSql(sSql);
              try
                sCodUbicAdmin   := SqlResults[0];
                sFechaUbicAdmin := SqlResults[1];
              finally
                SqlResults.Free;
              end;

              sCuerpo :=  sCuerpo + LPad(IntToStr(i), '0', 2) + ') ' + CRLF +
                                    '   Tipo de Archivo: ' + FieldByName('DESCRTIPOARCH').AsString + CRLF +
                                    '   Carpeta: ' + FieldByName('DESCRIPCIONCLAVE').AsString + CRLF +
                                    String(Iif(bEsSiniestro and not bEsCartaDocumento,
                                               '   Trabajador: ' + Get_NombreTrabajador(StrToIntDef(GetSubClave(FieldByName('CLAVE').AsString, 1), 0), StrToIntDef(GetSubClave(FieldByName('CLAVE').AsString, 2), 0), 0) + CRLF,
                                               '')) +
                                    '   Documento: ' + FieldByName('CODIGOTIPODOCUMENTO').AsString + ' - ' + FieldByName('TIPODOCUMENTO').AsString + CRLF +
                                    '   Lote: ' + FieldByName('LOTE').AsString + CRLF +
                                    '   Sec. Lote: ' + FieldByName('SECUENCIALOTE').AsString + CRLF +
                                    '   Nro. Caja: ' + FieldByName('CAJA').AsString + CRLF +
                                    '   Remito: ' + Iif(FieldByName('REMITO').AsInteger > 0,  FieldByName('REMITO').AsString, '') + CRLF +
                                    '   F. Gen. Remito: ' + Iif(FieldByName('REMITO').AsInteger > 0, FieldByName('FECHAALTAREMITO').AsString, '') + CRLF +
                                    '   F. Visita: ' + FieldByName('FECHAVISITA').AsString + CRLF +
                                    String(Iif(bEsCartaDocumento,
                                               '   Nro. Carta: ' + FieldByName('NROCARTA').AsString + CRLF +
                                               '     Al Trabajador: ' + Get_TrabajadorCarta(FieldByName('NROCARTA').AsString) + CRLF +
                                               '     A la Empresa: ' + Get_EmpresaCarta(FieldByName('NROCARTA').AsString) + CRLF,
                                               '')) +
                                    '   Obs.: ' + ReplaceEnter(FieldByName('OBSERVACIONES').AsString) + CRLF +
                                    Iif(not IsEmptyString(sFechaUbicAdmin),
                                        '   Ubicación de la Carpeta al ' + sFechaUbicAdmin + ': ' + sCodUbicAdmin + CRLF + CRLF,
                                        CRLF);
                                    
              Inc(i);
            end;

          Next;
        end;
    end;

  sCuerpo :=  sCuerpo + CRLF + 'Muchas Gracias.' + CRLF;

  Result := sCuerpo;
end;

procedure TFrmDetalleArchivo.pmnuEnviarMailSolicImagenesClick(Sender: TObject);
var
  sUrgencia, sCuerpo: String;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleContenido, 'No existen registros seleccionados en la grilla.');

  with sdqContenido do
    begin
      pbCargarImagenes := False;
      DisableControls;
      APointer := GetBookmark;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
              DoValidarMailSolicitudes;

            Next;
          end;

        if tslCheckeados.Count > 0 then
          begin
            fpSolicitudImagenes.Caption := 'Solicitud de Imágenes';
            if fpSolicitudImagenes.ShowModal = mrOk then
              begin
                sCuerpo := DoArmarCuerpoMail(False);

                VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
                    get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

                sUrgencia := StringReplace(UpperCase(rgUrgencia.Items[rgUrgencia.ItemIndex]), '&', '', []);

                SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                   Sesion.UserId, '[Documentación] Solicitud de Imágenes - Urgencia: ' + sUrgencia, '',
                   sCuerpo, False, False, False, Sesion.UserId, True);

                SendByMailServer(Sesion.UserMail,
                   Sesion.UserId, '[Documentación] Solicitud de Imágenes (requeridas por mi) - Urgencia: ' + sUrgencia, '',
                   sCuerpo, False, False, False, Sesion.UserId, True);

                MsgBox('Solicitud enviada correctamente.', MB_ICONINFORMATION);
              end;
          end;
      finally
        pbCargarImagenes := True;
        GotoBookmark(APointer);
        EnableControls;
      end;
  end;
end;

procedure TFrmDetalleArchivo.pmnuEnviarMailSolicDocComplementariaClick(Sender: TObject);
var
  IdTipoArchivoGuarda, IdArchivo: TTableId;
  sDescripcion, sUrgencia, sCuerpo: String;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleContenido, 'No existen registros seleccionados en la grilla.');

  with sdqContenido do
    begin
      pbCargarImagenes := False;
      DisableControls;
      APointer := GetBookmark;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
              begin
                IdArchivo           := FieldByName('IDTIPOARCH').AsInteger;
                IdTipoArchivoGuarda := Get_IdTipoArchivoGuardaCarpetaFisica(IdArchivo, sDescripcion);
                Verificar(IdArchivo <> IdTipoArchivoGuarda, dbgDetalleContenido, 'Está solicitando un documento de una carpeta que no es la física. Debe solicitarlo de la carpeta: ' + sDescripcion + '.');

                Verificar(FieldByName('UBICCARPETA').AsString <> Sesion.UserID, dbgDetalleContenido, 'Uno de los documentos solicitados no pertenece a una carpeta que se encuentre en su poder.');
                Verificar(not FieldByName('DA_FECHA_RETIRODOC').IsNull, dbgDetalleContenido, 'El original de uno de los documentos solicitados fue retirado por el usuario: ' + FieldByName('DA_USU_RETIRODOC').AsString + ' - Observaciones indicadas: ' + FieldByName('DA_OBSERV_RETIRODOC').AsString);

                DoValidarMailSolicitudes;
              end;

            Next;
          end;

        if tslCheckeados.Count > 0 then
          begin
            fpSolicitudImagenes.Caption := 'Solic. Doc. Complementaria';
            if fpSolicitudImagenes.ShowModal = mrOk then
              begin
                sCuerpo := DoArmarCuerpoMail(True);

                VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
                    get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

                sUrgencia := StringReplace(UpperCase(rgUrgencia.Items[rgUrgencia.ItemIndex]), '&', '', []);

                SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                   Sesion.UserId, '[Documentación] Solicitud de Documentación Original Complementaria - Urgencia: ' + sUrgencia, '',
                   sCuerpo, False, False, False, Sesion.UserId, True);

                SendByMailServer(Sesion.UserMail,
                   Sesion.UserId, '[Documentación] Solicitud de Documentación Original Complementaria (requeridas por mi) - Urgencia: ' + sUrgencia, '',
                   sCuerpo, False, False, False, Sesion.UserId, True);

                MsgBox('Solicitud enviada correctamente.', MB_ICONINFORMATION);
              end;
          end;
      finally
        pbCargarImagenes := True;
        GotoBookmark(APointer);
        EnableControls;
      end;
  end;
end;

procedure TFrmDetalleArchivo.dbgDetalleGDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if sdqImagenes.Active and not sdqImagenes.IsEmpty and ((dbgDetalleGD.Columns[dbgDetalleGD.Col-1].FieldName = SMCampoCheckBox) or ((X = -1) and (Y = -1))) then  // desde DoSMGridKeyDown llamo a OnMouseDown con (-1, -1)
    DoSMMarcarDesmarcarFila(tslCheckeados, dbgDetalleGD, SMCampoFila);
end;

function TFrmDetalleArchivo.DoValidarRetiroDocOriginal(var PrinPointer: TBookMark): Boolean;
var
  bPerfilAdministrador_GyD: Boolean;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleContenido, 'No existen registros seleccionados en la grilla.');

  with sdqContenido do
    begin
      pbCargarImagenes         := False;
      bPerfilAdministrador_GyD := IsPerfilAdministrador_GyD();
      PrinPointer              := nil;
      DisableControls;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
              begin
                Verificar(not bPerfilAdministrador_GyD and (FieldByName('UBICCARPETA').AsString <> Sesion.UserID), dbgDetalleContenido, 'Uno de los documentos no pertenece a una carpeta que se encuentre en su poder.');

                if PrinPointer = nil then
                  PrinPointer := sdqContenido.GetBookmark;
              end;

            Next;
          end;
      finally
        pbCargarImagenes := True;
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TFrmDetalleArchivo.tbDocOriginalClick(Sender: TObject);
begin
  tbDocOriginal.CheckMenuDropdown;
end;

procedure TFrmDetalleArchivo.chkSoloInconsistenciasTrazClick(Sender: TObject);
begin
  pbPreguntarMasImagenes := False;
  RefrescarGrilla(chkVistaGD.Checked);
  pbPreguntarMasImagenes := True;
end;

procedure TFrmDetalleArchivo.mnuInvertirSeleccionClick(Sender: TObject);
begin
  pbCargarImagenes := False;
  try
    if chkVistaGD.Checked then
      DoSMInvertirSeleccion(tslCheckeados, dbgDetalleGD, SMCampoFila)
    else
      DoSMInvertirSeleccion(tslCheckeados, dbgDetalleContenido, SMCampoFila);
  finally
    pbCargarImagenes := True;
  end;
end;

procedure TFrmDetalleArchivo.tbImprimirClick(Sender: TObject);
begin
  pbImprimiendo      := True;      // al imprimir, aparece la pantalla de Imprimiendo, y se termina disparando FormActivate, que llama a MostrarControles, que a su vez limpia tslCheckeados...
  pbCargarImagenes   := False;
  tbImprimir.Enabled := False;
  try
    DoImprimirEtiqueta(sdqContenido, tslCheckeados, SMCampoFila, 'HOJAS', 'TIPOARCHIVO', 'SECUENCIATRAZABIL', 'CODIGOTIPODOCUMENTO', 'CLAVE');
  finally
    pbCargarImagenes   := True;
    tbImprimir.Enabled := True;
    pbImprimiendo      := False;
  end;
end;

procedure TFrmDetalleArchivo.DoGuardarMasivamente(Sender: TObject);
var
  APointer: TBookMark;
  sArchDestCompleto, sUbicImagen, sNombre, sDestino: String;
  sDefaultExt, sFilter: String;
  i: Integer;
  bOk, bGenerarMultiTiff, bGenerarArchIndividuales, bGenerarPdf: Boolean;
  FileNamesTiff: TStringList;
  PrevCursor: TCursor;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleGD, 'No existen registros seleccionados en la grilla.');

  bGenerarArchIndividuales := False;
  bGenerarMultiTiff        := False;
  bGenerarPdf              := False;
  bOk                      := False;
  
  if Sender = pmnuGuardarMasArchivosInd then
    bGenerarArchIndividuales := True
  else if Sender = pmnuGuardarMasArchivoMultitiff then
    bGenerarMultiTiff := True
  else if Sender = pmnuGuardarMasArchivoPdf then
    bGenerarPdf := True;

  Verificar(bGenerarPdf and (tslCheckeados.Count > 10) and not IsConversionLocal(teTif, PDF_EXTENSION), dbgDetalleGD,
            'Ha seleccionado demasiadas imágenes. Solicite por favor mediante un ticket a Sistemas la instalación en forma local del software necesario para la conversión de archivos TIF a PDF.');

  i := 0;
  with sdqImagenes do
    begin
      pbCargarImagenes := False;
      DisableControls;
      APointer := GetBookmark;
      try
        with fdGuardar do
          begin
            if bGenerarPdf then
              begin
                sDefaultExt := '*.pdf';
                sFilter     := 'Archivo Adobe PDF|*.pdf';
              end
            else
              begin
                sDefaultExt := '*.tif';
                sFilter     := 'Archivo de imágenes TIFF|*.tif';
              end;

            Title      := 'Seleccione la carpeta en donde guardar las imágenes';
            DefaultExt := sDefaultExt;
            Filter     := sFilter;
            FileName   := '';

            if Execute then
              begin
                PrevCursor := Screen.Cursor;
                try
                  Screen.Cursor     := crHourGlass;
                  sArchDestCompleto := FileName;
                  sDestino          := ExtractFilePath(sArchDestCompleto);
                  sNombre           := ChangeFileExt(ExtractFileName(sArchDestCompleto), '');

                  FileNamesTiff := TStringList.Create;
                  try
                    First;
                    while not Eof do
                      begin
                        if IsSMFilaSeleccionada(tslCheckeados, sdqImagenes, SMCampoFila) then
                          begin
                            sUbicImagen := FieldByName('IMAGEN').AsString;

                            if bGenerarMultiTiff or bGenerarPdf then
                              FileNamesTiff.Add(sUbicImagen)
                            else if bGenerarArchIndividuales then
                              begin
                                MostrarImagenGD(sUbicImagen, FieldByName('IDTIPOARCH').AsInteger);

                                Inc(i);
                                CargarNombreGuardarImg(True, i, sDestino, sNombre);

                                fraVistaTIFF.DoGuardarImagen(fraVistaTIFF.NombreGuardarImg, True);
                              end;
                          end;

                        Next;
                      end;

                    if bGenerarMultiTiff or bGenerarPdf then
                      begin
                        if bGenerarPdf then
                          sArchDestCompleto := ChangeFileExt(sArchDestCompleto, '.TIF');

                        bOk := DoConvertTiff2MultiTiff(FileNamesTiff, sArchDestCompleto);

                        if bOk and bGenerarPdf then
                          bOk := FileToPDFSvr(sArchDestCompleto, '', '', True, tdPdf);
                      end
                    else if bGenerarArchIndividuales then
                      bOk := True;

                    if bOk then
                      InfoHint(tbGuardarMasivaGD, 'Fin del guardado masivo de imágenes.');  // con MsgBox no lo mostraba al convertir a pdf...
                  finally
                    if bGenerarPdf then
                      DeleteFile(sArchDestCompleto);

                    FileNamesTiff.Free;
                  end;
                finally
                  Screen.Cursor := PrevCursor;
                end;
              end;
          end;
      finally
        pbCargarImagenes := True;
        GotoBookmark(APointer);
        EnableControls;
      end;
    end;
end;

function TFrmDetalleArchivo.DoValidarDevolucionDocOriginal(var PrinPointer: TBookMark): Boolean;
begin
  Verificar(tslCheckeados.Count = 0, dbgDetalleContenido, 'No existen registros seleccionados en la grilla.');

  with sdqContenido do
    begin
      pbCargarImagenes := False;
      PrinPointer      := nil;
      DisableControls;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
              begin
                Verificar(FieldByName('DA_FECHA_RETIRODOC').IsNull, dbgDetalleContenido, 'El original de uno de los documentos solicitados no ha sido retirado.');

                if PrinPointer = nil then
                  PrinPointer := sdqContenido.GetBookmark;
              end;

            Next;
          end;
      finally
        pbCargarImagenes := True;
        EnableControls;
      end;
    end;

  Result := True;
end;


procedure TFrmDetalleArchivo.mnuDocOriginalDevolucionClick(Sender: TObject);
var
  sSql: String;
  APrinPointer, APointer: TBookMark;
begin
  APointer := sdqContenido.GetBookmark;
  try
    if DoValidarDevolucionDocOriginal(APrinPointer) then
      begin
        if MsgBox('¿Confirma el recupero de la documentación original?', MB_ICONQUESTION + MB_YESNO) = IDYES then
          begin
            with sdqContenido do
              begin
                pbCargarImagenes := False;
                DisableControls;
                try
                  BeginTrans;
                  try
                    sSql := 'UPDATE RDA_DETALLEARCHIVO ' +
                               'SET DA_OBSERV_RETIRODOC = NULL, ' +
                                   'DA_USU_RETIRODOC = NULL, ' +
                                   'DA_FECHA_RETIRODOC = NULL ' +
                             'WHERE DA_ID = :Id';

                    First;
                    while not Eof do
                      begin
                        if IsSMFilaSeleccionada(tslCheckeados, sdqContenido, SMCampoFila) then
                          EjecutarSqlSTEx(sSql, [FieldByName('IDDETALLEARCHIVO').AsInteger]);

                        Next;
                      end;

                    CommitTrans;
                    MsgBox('Recupero de documentación registrada correctamente.', MB_ICONINFORMATION);

                    mnuDesmarcarTodos.Click;
                    sdqContenido.Refresh;
                  except
                    on E:Exception do
                      begin
                        RollBack;
                        Raise Exception.Create(E.Message + CRLF + 'Error al guardar el recupero de la documentación original.' );
                      end;
                  end;
                finally
                  pbCargarImagenes := True;
                  EnableControls;
                end;
              end;
          end;
      end;
  finally
    sdqContenido.GotoBookmark(APointer);
  end;
end;

end.

