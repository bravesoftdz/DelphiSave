unit unAfiAdministracionCartas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, Mask, StdCtrls,
  IntEdit, ComboEditor, CheckCombo, DBCheckCombo, ToolEdit, DateComboBox,
  unFraUsuario, unArtDbFrame, unFraEmpresa, unFraEmpresaSolicitud, Menus,
  FormPanel, unFraDomicilio, unArt, unFraEmpresaAfi,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, PatternEdit,
  CardinalEdit, CustomCombo, unFraDomicilioTrab, unArtDBAwareFrame;

type
  TfrmBaseAdministracionCartas = class(TfrmCustomConsulta)
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirCartasDocumento: TMenuItem;
    tbRecepcion: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
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
    fraEmpresaDatosCartaDoc: TfraEmpresaSolicitud;
    gbDatosActuales: TGroupBox;
    fraEmpresaDatosActuales: TfraEmpresaSolicitud;
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
    fraUsuarioImpresion: TfraUsuarios;
    tsFiltros1: TTabSheet;
    rgRecepcionOK: TRadioGroup;
    gbFormulario: TGroupBox;
    fraEmpresaAfiliaciones: TfraEmpresaSolicitud;
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
    fraUsuarioAlta: TfraUsuarios;
    fraCorreo: TfraStaticCTB_TABLAS;
    fraModulo: TfraStaticCodigoDescripcion;
    fraCodFirmante: TfraStaticCodigoDescripcion;
    fraCodTexto: TfraStaticCodigoDescripcion;
    fraDelegacion: TfraStaticCodigoDescripcion;
    fraCodRecepcion: TfraStaticCTB_TABLAS;
    Label6: TLabel;
    ToolButton1: TToolButton;
    ToolButton9: TToolButton;
    edCantCartas: TCardinalEdit;
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
    edTotalCartas: TCardinalEdit;
    Label9: TLabel;
    tbCalcularTotal: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure fpRecepcionCartaDocEnter(Sender: TObject);
    procedure rgRecepOkClick(Sender: TObject);
    procedure tbReemplazoClick(Sender: TObject);
    procedure btnDatosNuevosClick(Sender: TObject);
    procedure DoCargarDatosCartaDoc(IdCartaDoc, IdUltimoEndoso: TTableId; var fraEmpresaDatos: TfraEmpresaSolicitud; var fraDomicilioDatos: TfraDomicilioTrab);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbRecepcionMasivaClick(Sender: TObject);
    procedure OpcionesImpresion(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesMarcarTodosClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
  private
    ModoForm : string;
    PararImpresion: boolean; 
    procedure fraCorreoOnChange(Sender: TObject);
    procedure DoHabilitarCodigoNoRecepcion;
    function IsRegistrosBajaCartaDocValidos(var sListaIdCartasDocSeleccionadas: String): Boolean;
    procedure DoEliminarCartasDoc(sListaIdCartasDocSeleccionadas: String);
    function IsRegistroRecepcionCartaDocValido: Boolean;
    function IsDatosValidosRecepcion: Boolean;
    procedure DoHabilitarIngresoCodigoRecepcion(rgRecepcOk: TRadioGroup);
    function GetRecepcionOk(rg_RecepcOk: TRadioGroup): String;
    function IsRegistroReemplazoValido(IdCarta: TTableId): Boolean;
    function IsRegistroModificacionValido: Boolean;
    function IsRegistrosImpresionCartaDocValidos: Boolean;
    procedure DoInicializarfpReemplazar;
    procedure fraModuloOnChange(Sender: TObject);
    function GetRecepcionOk_Busqueda(rg_RecepcionOk: TRadioGroup): String;
    procedure RecepcionCarta;
    procedure LoadDatosFormPanel;
    procedure ClearDatosFormPanel;
    procedure CalcularFilas;
    procedure CargarImpresoras;
  public
  end;

var
  frmBaseAdministracionCartas: TfrmBaseAdministracionCartas;

implementation

uses unPrincipal, AnsiSql, VCLExtra, unDmPrincipal, unAfiliaciones, CustomDlgs,
     SqlFuncs, General, DBFuncs, unAfiGeneracionCartas, unCustomDataModule,
     unrptCartaDocumento, unComunes, unImpoExpoWizard, Printers;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
  frmAfiAdministracionCartas := nil;
  frmPrincipal.mnuAfiAdministracionCartas.Enabled := True;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;

  IMG_FILTROS_SHOW := 10;
  IMG_FILTROS_HIDE := 11;

  frmPrincipal.mnuAfiAdministracionCartas.Enabled := False;

  with fraCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := True;
    OnChange  := fraCorreoOnChange;
  end;
  DoHabilitarCodigoNoRecepcion;

  with fraModulo do
  begin
    TableName      := 'CAT_AREATEXTO';
    FieldID        := 'AT_ID';
    FieldCodigo    := 'AT_ID';
    FieldDesc      := 'AT_DESCRIPCION';
    FieldBaja      := 'AT_FECHABAJA';
    ExtraCondition := 'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    ShowBajas      := True;
    OnChange       := fraModuloOnChange;
  end;

  with fraCodTexto do
  begin
    TableName   := 'CTC_TEXTOCARTA';
    FieldID     := 'TC_ID';
    FieldCodigo := 'TC_ID';
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


  fraModuloOnChange( nil );

  fraUsuarioImpresion.ShowBajas := True;

  fraUsuarioAlta.ShowBajas      := True;


  with fraDelegacion do
  begin
    TableName   := 'DEL_DELEGACION';
    FieldID     := 'EL_ID';
    FieldCodigo := 'EL_ID';
    FieldDesc   := 'EL_NOMBRE';
    FieldBaja   := 'EL_FECHABAJA';
    ShowBajas   := True;
  end;

  fraEmpresaDatosCartaDoc.Locked   := True;
  fraDomicilioDatosCartaDoc.Locked := True;
  fraEmpresaDatosActuales.Locked   := True;
  fraDomicilioDatosActuales.Locked := True;

  pcFiltros.ActivePageIndex := 0;
  fraEmpresaAfiliaciones.ShowBajas := True;
  BarProgreso.Position := 0;
  tbCalcularTotal.ImageIndex := 39;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.tbRefrescarClick(Sender: TObject);
var
   sSql, sSqlWhere, sRecepcionOK, sNroCartaDocDesde, sNroCartaDocHasta: String;
   iloop: integer;
begin
  sSql := '';

  sNroCartaDocDesde := AgregarPrefijoNroCartaDocumento( edNroCartaDocDesde.Text );
  sNroCartaDocHasta := AgregarPrefijoNroCartaDocumento( edNroCartaDocHasta.Text );

  sSqlWhere := SqlBetween( ' AND CA_NROCARTADOC', sNroCartaDocDesde, sNroCartaDocHasta ) +
               SqlBetweenDateTime( ' AND CA_FECHAIMPRESION', edFechaImpresionDesde.Date, edFechaImpresionHasta.Date ) +
               SqlBetweenDateTime( ' AND CA_FECHAREIMPRESION', edFechaReImpresionDesde.Date, edFechaReImpresionHasta.Date ) +
               SqlBetween( ' AND CA_FECHARECEPCION', edFechaRecepcionDesde.Date, edFechaRecepcionHasta.Date ) +
               SqlBetweenDateTime( ' AND CA_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date );

  if not edNroCarta.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_ID=' + SqlValue( edNroCarta.Value );

  if not fraCorreo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(CA_CORREOREIMPRESION, CA_CORREO)=' + SqlValue( fraCorreo.edCodigo.Text );

  sRecepcionOK := GetRecepcionOk_Busqueda( rgRecepcionOk );
  if sRecepcionOK<>'' then
    sSqlWhere := sSqlWhere + ' AND CA_RECEPCIONOK=' + SqlValue( sRecepcionOK );
     
  if cmbCodigosNoRecepcion.Text <> '' Then
  begin
    sSqlWhere := sSqlWhere + ' AND CA_CODRECEPCION IN (';
    for iloop := 0 to cmbCodigosNoRecepcion.Items.Count -1 do
      if cmbCodigosNoRecepcion.Checked[iloop] then
        sSqlWhere := sSqlWhere + '''' + (cmbCodigosNoRecepcion.Items.Objects[iloop] as TCadena).Cadena + ''',';
    sSqlWhere := Copy(sSqlWhere, 1, Length(sSqlWhere)-1) + ')';
  end;
  if not fraModulo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_IDAREATEXTO=' + SqlValue( fraModulo.Value );

  if not fraCodTexto.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_IDTEXTOCARTA=' + SqlValue( fraCodTexto.Value );

  if not fraCodFirmante.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=' + SqlValue( fraCodFirmante.Value );

  if not fraUsuarioImpresion.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(CA_USUREIMPRESION, CA_USUIMPRESION)=' + SqlValue( fraUsuarioImpresion.Value );

  if not fraUsuarioAlta.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_USUALTA=' + SqlValue( fraUsuarioAlta.Value );

  if chkPendienteImpresion.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_FECHAIMPRESION IS NULL' +
                             ' AND CA_FECHABAJA IS NULL';

  if chkPendienteRecepcion.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_FECHARECEPCION IS NULL' +
                             ' AND CA_FECHAIMPRESION IS NOT NULL';

  if chkPendienteReemplazo.Checked then
    sSqlWhere := sSqlWhere + ' AND CA_FECHABAJA IS NULL' +
                             ' AND CA_IDCARTAAREEMPLAZAR IS NULL' +
                             ' AND CA_RECEPCIONOK =''N''' +
                             ' AND CA_FECHARECEPCION IS NOT NULL' +
                             ' AND CA_MANUAL=''N''';

  if not fraDelegacion.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CA_IDDELEGACION=' + SqlValue( fraDelegacion.Value );


  sSql := 'SELECT UTILES.ARMAR_NROCARTADOCUMENTO(CA_NROCARTADOC) NROCARTADOC, UTILES.ARMAR_CUIT(HM_CUIT) CUIT, HM_NOMBRE EMPRESA, TO_CHAR(HC_CONTRATO) CONTRATO, FO_FORMULARIO FORMULARIO, TC_NOMBRE TIPOCARTA, ' +
                 'CORREO.TB_DESCRIPCION ULTCORREO, CA_USUIMPRESION, TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, DECODE(CA_RECEPCIONOK, ''S'', ''Si'', ''No'') RECEPCIONOK, CA_FECHARECEPCION, CODRE.TB_DESCRIPCION DESC_RECEPCION, ' +
                 'TO_CHAR(FI_ID) CODIGOFIRMA, FI_FIRMANTE, TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, CA_OBSERVACIONES, CA_USUREIMPRESION, CA_ID, CA_MANUAL, CA_FECHABAJA, NVL(CA_CORREOREIMPRESION, CA_CORREO) CORREO, ' +
                 'CA_IDCARTAAREEMPLAZAR, CA_RECEPCIONOK, CA_CODRECEPCION, CA_IDFORMULARIO, CA_IDENDOSO, CA_USUALTA, ' +
                 'TRUNC(CA_FECHAALTA) FECHAALTA, EL_NOMBRE, AFILIACION.GET_PORCVARIABLECARTA(CA_ID) PORCVARIABLE, AFILIACION.GET_SUMAFIJACARTA(CA_ID) SUMAFIJA ' +
            'FROM AEN_ENDOSO, AHC_HISTORICOCONTRATO, AHM_HISTORICOEMPRESA,  AFO_FORMULARIO, CTC_TEXTOCARTA, CFI_FIRMA, CTB_TABLAS SALIDA, ' +
                 'CTB_TABLAS CORREO, CTB_TABLAS CODRE, CAT_AREATEXTO, CTA_TEXTOAREA, DEL_DELEGACION, CCA_CARTA ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDAREATEXTO=AT_ID ' +
             'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ') ' +
             'AND CORREO.TB_CODIGO=NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND CORREO.TB_CLAVE=''CORRE'' ' +
             'AND CODRE.TB_CODIGO(+)=CA_CODRECEPCION ' +
             'AND CODRE.TB_CLAVE(+)=''CODRE'' ' +
             //'AND CODRE.TB_ESPECIAL1(+)=NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND SALIDA.TB_CLAVE=''TSCDO'' ' +
             'AND SALIDA.TB_CODIGO=CA_TIPOSALIDA ' +
             'AND HC_IDFORMULARIO=FO_ID ' +
             'AND EN_IDHISTORICOCONTRATO=HC_ID ' +
             'AND EN_IDHISTORICOEMPRESA=HM_ID ' +
             'AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=FI_ID ' +
             'AND CA_IDENDOSO=EN_ID ' +
             'AND CA_IDDELEGACION=EL_ID ' +
             'AND CA_IDENDOSO IS NOT NULL ' +
            sSqlWhere + ' ';
  if not fraEmpresaAfiliaciones.IsEmpty then
    sSql := sSql + ' AND EN_CONTRATO=' + SqlValue( fraEmpresaAfiliaciones.Contrato );

  sSql := sSql + ' UNION ' +
          'SELECT UTILES.ARMAR_NROCARTADOCUMENTO(CA_NROCARTADOC) NROCARTADOC, UTILES.ARMAR_CUIT(SA_CUIT) CUIT, SA_NOMBRE EMPRESA, NULL CONTRATO, FO_FORMULARIO FORMULARIO, TC_NOMBRE TIPOCARTA, ' +
                 'CORREO.TB_DESCRIPCION ULTCORREO, CA_USUIMPRESION, TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, DECODE(CA_RECEPCIONOK, ''S'', ''Si'', ''No'') RECEPCIONOK, CA_FECHARECEPCION, CODRE.TB_DESCRIPCION DESC_RECEPCION, ' +
                 'TO_CHAR(FI_ID) CODIGOFIRMA, FI_FIRMANTE, TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, CA_OBSERVACIONES, CA_USUREIMPRESION, CA_ID, CA_MANUAL, CA_FECHABAJA, NVL(CA_CORREOREIMPRESION, CA_CORREO) CORREO, ' +
                 'CA_IDCARTAAREEMPLAZAR, CA_RECEPCIONOK, CA_CODRECEPCION, CA_IDFORMULARIO, CA_IDENDOSO, CA_USUALTA, TRUNC(CA_FECHAALTA) FECHAALTA, EL_NOMBRE, AFILIACION.GET_PORCVARIABLECARTA(CA_ID) PORCVARIABLE, AFILIACION.GET_SUMAFIJACARTA(CA_ID) SUMAFIJA ' +
            'FROM ASA_SOLICITUDAFILIACION, AFO_FORMULARIO, CTC_TEXTOCARTA, CFI_FIRMA, CTB_TABLAS SALIDA, ' +
                 'CTB_TABLAS CORREO, CTB_TABLAS CODRE, CAT_AREATEXTO, CTA_TEXTOAREA, DEL_DELEGACION, CCA_CARTA ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDAREATEXTO=AT_ID ' +
             'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ') ' +
             'AND CORREO.TB_CODIGO= NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND CORREO.TB_CLAVE=''CORRE'' ' +
             'AND CODRE.TB_CODIGO(+)=CA_CODRECEPCION ' +
             'AND CODRE.TB_CLAVE(+)=''CODRE'' ' +
             //'AND CODRE.TB_ESPECIAL1(+)=NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND SALIDA.TB_CLAVE=''TSCDO'' ' +
             'AND SALIDA.TB_CODIGO=CA_TIPOSALIDA ' +
             'AND CA_IDFORMULARIO=SA_IDFORMULARIO ' +
             'AND SA_IDFORMULARIO=FO_ID ' +
             'AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=FI_ID ' +
             'AND CA_IDDELEGACION=EL_ID ' +
             'AND CA_IDENDOSO IS NULL ' +
             sSqlWhere + ' ';
  if not fraEmpresaAfiliaciones.IsEmpty then
    sSql := sSql + ' AND CA_IDFORMULARIO=' + SqlValue( fraEmpresaAfiliaciones.Value );

  sSql := sSql + ' UNION ' +
          'SELECT UTILES.ARMAR_NROCARTADOCUMENTO(CA_NROCARTADOC) NROCARTADOC, UTILES.ARMAR_CUIT(SA_CUIT) CUIT, SA_NOMBRE EMPRESA, NULL CONTRATO, FO_FORMULARIO FORMULARIO, TC_NOMBRE TIPOCARTA, ' +
                 'CORREO.TB_DESCRIPCION ULTCORREO, CA_USUIMPRESION, TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, DECODE(CA_RECEPCIONOK, ''S'', ''Si'', ''No'') RECEPCIONOK, CA_FECHARECEPCION, CODRE.TB_DESCRIPCION DESC_RECEPCION, ' +
                 'TO_CHAR(FI_ID) CODIGOFIRMA, FI_FIRMANTE, TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, CA_OBSERVACIONES, CA_USUREIMPRESION, CA_ID, CA_MANUAL, CA_FECHABAJA, NVL(CA_CORREOREIMPRESION, CA_CORREO) CORREO, ' +
                 'CA_IDCARTAAREEMPLAZAR, CA_RECEPCIONOK, CA_CODRECEPCION, CA_IDFORMULARIO, CA_IDENDOSO, CA_USUALTA, TRUNC(CA_FECHAALTA) FECHAALTA, EL_NOMBRE, ' +
                 'AFILIACION.GET_PORCVARIABLECARTA(CA_ID) PORCVARIABLE, AFILIACION.GET_SUMAFIJACARTA(CA_ID) SUMAFIJA ' +
            'FROM ASA_SOLICITUDAFILIACION, AFO_FORMULARIO, CTC_TEXTOCARTA, CFI_FIRMA, CTB_TABLAS SALIDA, ' +
                 'CTB_TABLAS CORREO, CTB_TABLAS CODRE, CAT_AREATEXTO, CTA_TEXTOAREA, DEL_DELEGACION, CCA_CARTA, ATI_TRASPASOINGRESO ' +
           'WHERE CA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDTEXTOCARTA=TC_ID ' +
             'AND TA_IDAREATEXTO=AT_ID ' +
             'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ') ' +
             'AND CORREO.TB_CODIGO= NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND CORREO.TB_CLAVE=''CORRE'' ' +
             'AND CODRE.TB_CODIGO(+)=CA_CODRECEPCION ' +
             'AND CODRE.TB_CLAVE(+)=''CODRE'' ' +
             //'AND CODRE.TB_ESPECIAL1(+)=NVL(CA_CORREOREIMPRESION, CA_CORREO) ' +
             'AND SALIDA.TB_CLAVE=''TSCDO'' ' +
             'AND SALIDA.TB_CODIGO=CA_TIPOSALIDA ' +
             'AND SA_IDFORMULARIO=FO_ID ' +
             'AND NVL(CA_IDFIRMAREIMPRESION, CA_IDFIRMA)=FI_ID ' +
             'AND CA_IDDELEGACION=EL_ID ' +
             'AND CA_IDFORMULARIO IS NULL ' +
             'AND TI_IDCARTA =CA_ID ' +
             'AND SA_IDFORMULARIO=TI_IDFORMULARIO ' +
             //'AND CA_IDFORMULARIO=SA_IDFORMULARIO ' +
             sSqlWhere;
  if not fraEmpresaAfiliaciones.IsEmpty then
    sSql := sSql + ' AND SA_IDFORMULARIO=' + SqlValue( fraEmpresaAfiliaciones.Value );


  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy ;

  inherited;
  CalcularFilas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edNroCarta.Clear;
  edNroCartaDocDesde.Clear;
  edNroCartaDocHasta.Clear;
  fraCorreo.Clear;
  cmbCodigosNoRecepcion.Clear;
  fraModulo.Clear;
  rgRecepcionOK.ItemIndex := 2;  // Todos
  fraCodTexto.Clear;
  fraCodFirmante.Clear;
  fraUsuarioImpresion.Clear;
  edFechaImpresionDesde.Clear;
  edFechaImpresionHasta.Clear;
  chkPendienteImpresion.Checked := False;
  chkPendienteRecepcion.Checked := False;
  chkPendienteReemplazo.Checked := False;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;
  edFechaReImpresionDesde.Clear;
  edFechaReImpresionHasta.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  fraDelegacion.Clear;
  fraEmpresaAfiliaciones.Clear;
  fraUsuarioAlta.Clear;
  
  DoHabilitarCodigoNoRecepcion;

  fraModuloOnChange( nil );

  pcFiltros.ActivePageIndex := 0;
  edNroCarta.SetFocus;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.fraCorreoOnChange(Sender: TObject);
var
  Query : TSDQuery;
  sSql : string;
  ID: TCadena;
begin
  Query := TSDQuery.Create ( Self );
  Query.DatabaseName := 'dbPrincipal';
  try 
    cmbCodigosNoRecepcion.Items.Clear;
    sSql := 'SELECT CODRE.TB_CODIGO CODIGO, CODRE.TB_DESCRIPCION DESCRIPCION ' +
            '  FROM CTB_TABLAS CODRE, CTB_TABLAS CORRE ' +
            ' WHERE CODRE.TB_CLAVE=''CODRE''  ' +
            '   AND CODRE.TB_CODIGO<>''0''  ' +
            '   AND CODRE.TB_ESPECIAL1=CORRE.TB_ESPECIAL2 ' +
            '   AND CORRE.TB_CLAVE=''CORRE''  ' +
            '   AND CORRE.TB_CODIGO=' + SqlValue( fraCorreo.edCodigo.Text ) + ' ' +
            ' ORDER BY CODRE.TB_DESCRIPCION ';

    OpenQuery( Query, sSql, True );
    while not query.eof do
    begin
      ID := TCadena.Create;
      ID.Cadena := Query.FieldByName ('CODIGO').AsString;
      cmbCodigosNoRecepcion.Items.AddObject (ID.Cadena + ' - ' + Query.FieldByName ('DESCRIPCION').AsString, ID);
      Query.Next;
    end;
    DoHabilitarCodigoNoRecepcion;
    Query.Close;
  finally
    Query.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Habilita o deshabilita el ingreso de los códigos de recepción }
procedure TfrmBaseAdministracionCartas.DoHabilitarCodigoNoRecepcion;
var
  bDesHabilitar: Boolean;
begin
  bDesHabilitar := not fraCorreo.IsSelected;
  LockControl( cmbCodigosNoRecepcion, bDesHabilitar );

  if bDesHabilitar then
    cmbCodigosNoRecepcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.tbImprimirClick(Sender: TObject);
begin
 tbImprimir.CheckMenuDropdown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Impresión de las cartas documento seleccionadas }
procedure TfrmBaseAdministracionCartas.mnuImprimirCartasDocumentoClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 Then
    InvalidMsg ( Grid, 'Debe seleccionar al menos una fila de la grilla' )
  else
    if IsRegistrosImpresionCartaDocValidos() then
    begin
      btnParar.Enabled := False;
      CargarImpresoras;
      fpOpcionesImpresion.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Determina si las cartas documento seleccionadas en la grilla a imprimir son o no válidas }
function TfrmBaseAdministracionCartas.IsRegistrosImpresionCartaDocValidos: Boolean;
var
  i: Integer;
  bSalir: Boolean;
  sMensaje: String;
begin
  bSalir := False;

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      // no debe estar dada de baja
      if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
        begin
          sMensaje := 'Alguna de las cartas documento ya se encuentra dada de baja';
          bSalir := True;
        end;

      if bSalir then
        begin
          InvalidMsg ( Grid, sMensaje );

          Result := False;
          Exit;
        end;
    end;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Baja de las cartas documento seleccionadas }
procedure TfrmBaseAdministracionCartas.tbEliminarClick(Sender: TObject);
var
  sListaIdCartasDocSeleccionadas: String;
begin
  if Grid.SelectedRows.Count = 0 Then
    InvalidMsg ( Grid, 'Debe seleccionar al menos una fila de la grilla' )
  else
    begin
      if Grid.SelectedRows.Count = 1 Then
        sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[0]) );

      if IsRegistrosBajaCartaDocValidos( sListaIdCartasDocSeleccionadas ) then
        if MsgBox( '¿Usted está seguro que quiere dar de baja las cartas documento seleccionadas?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
          DoEliminarCartasDoc( sListaIdCartasDocSeleccionadas );
        end;
    end;
{----------------------------------------------------------------------------------------------------------------------}
{ Determina si las cartas documento seleccionadas en la grilla a dar de baja son o no válidas }
function TfrmBaseAdministracionCartas.IsRegistrosBajaCartaDocValidos(var sListaIdCartasDocSeleccionadas: String): Boolean;
var
  i: Integer;
  bSalir: Boolean;
  sMensaje: String;
begin
  bSalir                         := False;
  sListaIdCartasDocSeleccionadas := '(';

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      // no debe estar dada de baja
      if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
        begin
          sMensaje := 'Alguna de las cartas documento ya se encuentra dada de baja';
          bSalir := True;
        end

      // la carta no debe estar impresa
//      else if not sdqConsulta.FieldByName( 'FECHAIMPRESION' ).IsNull then
//        begin
//          sMensaje := 'La carta documento ya ha sido impresa';
//          bSalir := True;
//        end

      // no debe tener fecha de recepción
      else if not sdqConsulta.FieldByName( 'CA_FECHARECEPCION' ).IsNull then
        begin
          sMensaje := 'Alguna de las cartas documento ya se encuentra recepcionada';
          bSalir := True;
        end;

//      // debe ser una carta manual
//      else if sdqConsulta.FieldByName( 'CA_MANUAL' ).AsString <> 'S' then
//        begin
//          sMensaje := 'Alguna de las cartas documento no se generó en forma manual';
//          bSalir := True;
//        end;

      if bSalir then
        begin
          InvalidMsg ( Grid, sMensaje );

          Result := False;
          Exit;
        end;

      sListaIdCartasDocSeleccionadas := sListaIdCartasDocSeleccionadas +  sdqConsulta.FieldByName( 'CA_ID' ).AsString + ', ';
    end;

  sListaIdCartasDocSeleccionadas := copy( sListaIdCartasDocSeleccionadas, 1, length( sListaIdCartasDocSeleccionadas ) - 2 ) + ')';

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
// Da de baja las cartas documento seleccionadas de la tabla de cartas documento
procedure TfrmBaseAdministracionCartas.DoEliminarCartasDoc(sListaIdCartasDocSeleccionadas: String);
var
  sSql: String;
begin
  try
    sSql := 'UPDATE CCA_CARTA ' +
               'SET CA_USUBAJA='+ SqlValue( frmPrincipal.DBLogin.UserId ) + ', ' +
                   'CA_FECHABAJA='+ SqlValue( DBDateTime ) + ' ' +
             'WHERE CA_ID IN ' + sListaIdCartasDocSeleccionadas;

    EjecutarSql( sSql );

    MsgBox( 'Las cartas documento se dieron de baja correctamente', MB_OK + MB_ICONINFORMATION );

    sdqConsulta.Refresh;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al dar de baja las cartas documento' );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Recepción de la carta documento seleccionada }
procedure TfrmBaseAdministracionCartas.tbRecepcionClick(Sender: TObject);
begin
  RecepcionCarta;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Determina si la carta doc. seleccionada en la grilla para ser recepcionada es o no válida }
function TfrmBaseAdministracionCartas.IsRegistroRecepcionCartaDocValido: Boolean;
begin
  Result := False;

  // la carta no debe estar dada de baja
  if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
    InvalidMsg ( Grid, 'La carta documento se encuentra dada de baja' )

  // la carta debe estar impresa
  else if sdqConsulta.FieldByName( 'FECHAIMPRESION' ).IsNull then
    InvalidMsg ( Grid, 'La carta documento aún no ha sido impresa' )

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.btnRecepcionAceptarClick(Sender: TObject);
var
  sRecepOk: String;
begin
  if IsDatosValidosRecepcion() Then
    try
      // actualizo los datos de la recepción en la tabla de cartas doc.
      with TSql.Create( 'CCA_CARTA' ) do
        try
          sRecepOk := GetRecepcionOk( rgRecepOk );

          PrimaryKey.Add( 'CA_ID',             sdqConsulta.FieldByName( 'CA_ID' ).AsInteger );
          Fields.Add( 'CA_RECEPCIONOK',        sRecepOk);
          Fields.Add( 'CA_CODRECEPCION',       fraCodRecepcion.edCodigo.Text );
          Fields.Add( 'CA_FECHARECEPCION',     edFechaRecepcion.Date );
          Fields.Add( 'CA_USURECEPCION',       frmPrincipal.DBLogin.UserId );

          SqlType := stUpdate;

          EjecutarSql( Sql );
        finally
          Free;
        end;

      if sRecepOk = 'S' then
        begin
          MsgBox( 'La carta documento se recepcionó correctamente.' , MB_OK + MB_ICONINFORMATION );
          fpRecepcionCartaDoc.ModalResult := mrOk;
        end
      else if sRecepOk = 'N' then
        begin
          if MsgBox( 'La carta documento no se recepcionó correctamente.' + CRLF + '¿Desea, además, reemplazar la carta documento?', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
            begin
              if IsRegistroReemplazoValido( sdqConsulta.FieldByName( 'CA_ID' ).AsInteger ) then
                begin
                  DoInicializarfpReemplazar;
                  fpReemplazar.ShowModal;
                end;

              // si cambio la operatoria de esta pantalla, tener en cuenta que si quedo en esta pantalla y salgo con Cancelar no se va a actualizar la grilla
              fpRecepcionCartaDoc.ModalResult := mrOk;
            end
          else
            fpRecepcionCartaDoc.ModalResult := mrOk;
        end;
    except
      On E: Exception do
        Raise Exception.Create ( E.Message + CRLF + 'Error al recepcionar la carta documento' );
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Determina si los datos ingresados de la recepción de la carta doc. son o no válidos }
function TfrmBaseAdministracionCartas.IsDatosValidosRecepcion: Boolean;
begin
  Result := False;

  // debe seleccionar si recepción OK
  if rgRecepOk.ItemIndex = -1 then
    InvalidMsg ( rgRecepOk, 'El campo recepción OK es obligatorio' )

  // debe ingresar la fecha de recepción
  else if edFechaRecepcion.IsEmpty then
    InvalidMsg ( edFechaRecepcion, 'La fecha de recepción es obligatoria' )

  // la fecha de recepción debe ser mayor o igual a la de impresión
  else if edFechaRecepcion.Date < sdqConsulta.FieldByName( 'FECHAIMPRESION' ).AsDateTime then
    InvalidMsg ( edFechaRecepcion, 'La fecha de recepción no puede ser menor a la fecha de impresión: ' + sdqConsulta.FieldByName( 'FECHAIMPRESION' ).AsString)

  // si la recepción no fue OK, debe ingresar el código de recepción
  else if ( rgRecepOk.ItemIndex = 1 ) and not fraCodRecepcion.IsSelected then  // no
    InvalidMsg ( rgRecepOk, 'El código de recepción es obligatorio, si Recepción OK = No' )

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.GridGetCellParams(Sender: TObject;  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  // así lo muestra con letras en rojo
  if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
    AFont.Color :=  clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.fpRecepcionCartaDocEnter(Sender: TObject);
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.rgRecepOkClick(Sender: TObject);
begin
  inherited;

  DoHabilitarIngresoCodigoRecepcion( rgRecepOk );
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Habilita o deshabilita el ingreso del código de recepción }
procedure TfrmBaseAdministracionCartas.DoHabilitarIngresoCodigoRecepcion(rgRecepcOk: TRadioGroup);
var
  bHabilitar: Boolean;
begin
  bHabilitar := ( GetRecepcionOk( rgRecepOk ) = 'N' );

  fraCodRecepcion.Locked := not bHabilitar;

  if not bHabilitar then
    fraCodRecepcion.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
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
{----------------------------------------------------------------------------------------------------------------------}
{ Reemplazo de la carta documento seleccionada }
procedure TfrmBaseAdministracionCartas.tbReemplazoClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 Then
    InvalidMsg ( Grid, 'Debe seleccionar una fila de la grilla' )
  else if Grid.SelectedRows.Count > 1 Then
    InvalidMsg( Grid, 'Solo debe seleccionar una fila de la grilla' )
  else
    begin
      sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[0]) );

      if IsRegistroReemplazoValido( sdqConsulta.FieldByName( 'CA_ID' ).AsInteger ) then
      begin
        DoInicializarfpReemplazar;

        if fpReemplazar.ShowModal = mrOk Then
          sdqConsulta.Refresh;
      end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Inicializa el form panel de reemplazo de cartas documento }
procedure TfrmBaseAdministracionCartas.DoInicializarfpReemplazar;
var
  sSql: String;
  IdUltimoEndoso, IdCartaDoc: TTableId;
begin
  btnDatosNuevos.Enabled := not sdqConsulta.FieldByName( 'CA_IDENDOSO' ).IsNull;


  sSql := SqlSimpleQuery( 'NVL(ART.AFILIACION.GET_ULTENDOSO(' + SqlValue( sdqConsulta.FieldByName( 'CA_IDFORMULARIO' ).AsInteger )  + '), ' + IntToStr( ART_EMPTY_ID ) + ')' );

  IdUltimoEndoso := ValorSqlInteger( sSql );
  IdCartaDoc     := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;

  DoCargarDatosCartaDoc( IdCartaDoc, sdqConsulta.FieldByName( 'CA_IDENDOSO' ).AsInteger, fraEmpresaDatosCartaDoc, fraDomicilioDatosCartaDoc );  // datos de la carta doc.
  DoCargarDatosCartaDoc( IdCartaDoc, IdUltimoEndoso, fraEmpresaDatosActuales, fraDomicilioDatosActuales );                                      // datos actuales
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Determina si la carta doc. seleccionada en la grilla para ser reemplazada es o no válida }
function TfrmBaseAdministracionCartas.IsRegistroReemplazoValido(IdCarta: TTableId): Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql := 'SELECT CA_FECHABAJA, CA_IDCARTAAREEMPLAZAR, CA_FECHARECEPCION, CA_RECEPCIONOK, CA_MANUAL ' +
            'FROM CCA_CARTA ' +
           'WHERE CA_ID=' + SqlValue( IdCarta );

  with GetQuery( sSql ) do
    try
      if not IsEmpty then
        begin
          // la carta doc. no debe estar dada de baja
          if not FieldByName( 'CA_FECHABAJA' ).IsNull then
            InvalidMsg ( Grid, 'La carta documento seleccionada se encuentra dada de baja' )

          // la carta doc. no debe haber sido reemplazada
          else if not FieldByName( 'CA_IDCARTAAREEMPLAZAR' ).IsNull then
            InvalidMsg ( Grid, 'La carta documento seleccionada ya ha sido reemplazada' )

          // la carta doc. no debe haber sido recepcionada
          else if FieldByName( 'CA_FECHARECEPCION' ).IsNull then
            InvalidMsg ( Grid, 'La carta documento seleccionada todavía no ha sido recepcionada' )

          // la carta doc. no debe hacer sido recepcionada bien
          else if FieldByName( 'CA_RECEPCIONOK' ).AsString = 'S' then
            InvalidMsg ( Grid, 'La carta documento seleccionada ha sido recepcionada correctamente' )

          // la carta doc. no debe hacer sido generado manualmente
          else if FieldByName( 'CA_MANUAL' ).AsString = 'S' then
            InvalidMsg ( Grid, 'La carta documento seleccionada se generó en forma manual' )

          else
            Result := True;
        end;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Carga los datos de la empresa y del domicilio de la carta doc. para su reemplazo }
procedure TfrmBaseAdministracionCartas.DoCargarDatosCartaDoc(IdCartaDoc, IdUltimoEndoso: TTableId; var fraEmpresaDatos: TfraEmpresaSolicitud; var fraDomicilioDatos: TfraDomicilioTrab);
 var
  sSql: String;
  iContrato: Integer;
begin
  // datos de la empresa
  sSql := 'SELECT SA_NOMBRE RSOCIAL, SA_CUIT CUIT, FO_FORMULARIO FORMULARIO, 0 CONTRATO ' +
            'FROM ASA_SOLICITUDAFILIACION, CCA_CARTA, AFO_FORMULARIO ' +
           'WHERE CA_IDFORMULARIO=SA_IDFORMULARIO ' +
             'AND CA_IDFORMULARIO=FO_ID ' +
             'AND CA_IDENDOSO IS NULL ' +
             'AND CA_ID=' + SqlValue( IdCartaDoc ) + ' ' +
           'UNION ' +
          'SELECT HM_NOMBRE RSOCIAL, HM_CUIT CUIT, FO_FORMULARIO FORMULARIO, HC_CONTRATO CONTRATO ' +
            'FROM AHM_HISTORICOEMPRESA, AHC_HISTORICOCONTRATO, AEN_ENDOSO, AFO_FORMULARIO ' +
           'WHERE EN_ID=' + SqlValue( IdUltimoEndoso ) + ' ' +
             'AND EN_IDHISTORICOEMPRESA=HM_ID ' +
             'AND EN_IDHISTORICOCONTRATO=HC_ID ' +
             'AND HC_IDFORMULARIO=FO_ID';

  with GetQuery( sSql ) do
    try
      if not IsEmpty then
        with fraEmpresaDatos do
          begin
            iContrato := FieldByName( 'CONTRATO' ).AsInteger;

            mskCUIT.Text      := FieldByName( 'CUIT' ).AsString;
            cmbRSocial.Text   := FieldByName( 'RSOCIAL' ).AsString;
            if iContrato <> 0 then
              edContrato.Value  := iContrato;
            edFormulario.Text := FieldByName( 'FORMULARIO' ).AsString;
          end;
    finally
      Free;
    end;


  // datos del domicilio
  sSql := 'SELECT SA_CALLE CALLE, SA_LOCALIDAD LOCALIDAD, SA_CPOSTAL CPOSTAL, SA_PROVINCIA PROVINCIA, ' +
                ' SA_NUMERO NUMERO, SA_PISO PISO, SA_DEPARTAMENTO DEPARTAMENTO, ' +
                ' SA_CPOSTALA CPOSTALA ' +
            'FROM ASA_SOLICITUDAFILIACION, CCA_CARTA ' +
           'WHERE CA_IDFORMULARIO=SA_IDFORMULARIO ' +
             'AND CA_IDENDOSO IS NULL ' +
             'AND CA_ID=' + SqlValue( IdCartaDoc ) + ' ' +
           'UNION ' +
          'SELECT HD_CALLE CALLE, HD_LOCALIDAD LOCALIDAD, HD_CPOSTAL CPOSTAL, HD_PROVINCIA PROVINCIA, ' +
          '       HD_NUMERO NUMERO, HD_PISO PISO, HD_DEPARTAMENTO DEPARTAMENTO, ' +
                ' HD_CPOSTALA CPOSTALA ' +
            'FROM AHD_HISTORICODOMICILIO, AEN_ENDOSO ' +
           'WHERE EN_ID=' + SqlValue( IdUltimoEndoso ) + ' ' +
             'AND EN_IDHISTORICODOMICILIO=HD_ID';

  with GetQuery( sSql ) do
    try
      if not IsEmpty then
        with fraDomicilioDatos do
          begin
            cmbCalle.Text      := FieldByName('CALLE').AsString;
            cmbLocalidad.Text  := FieldByName('LOCALIDAD').AsString;
            edCPostal.Text     := FieldByName('CPOSTAL').AsString;
            edProvincia.Text   := ValorSql('SELECT PV_DESCRIPCION ' +
                                           '  FROM CPV_PROVINCIAS ' +
                                           ' WHERE PV_CODIGO = ' + FieldByName('PROVINCIA').AsString);
            edNumero.Text := FieldByName( 'NUMERO' ).AsString;
            edPiso.Text   := FieldByName( 'PISO' ).AsString;
            edDto.Text    := FieldByName( 'DEPARTAMENTO' ).AsString;
            edCPA.Text    := FieldByName( 'CPOSTALA' ).AsString;
          end;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.btnDatosNuevosClick(Sender: TObject);
var
  IdEndoso: Variant;
  TextoCarta: TStringList;
begin
  try
    BeginTrans;

    sdqCCA_CARTA.Close;
    sdqCCA_CARTA.ParamByName( 'pCA_ID' ).AsInteger := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;
    sdqCCA_CARTA.Open;

    TextoCarta := TStringList.Create;
    try
      if sdqCCA_CARTA.IsEmpty then
        Raise Exception.Create( 'No se encontraron datos de la carta documento' );

      if Sender = btnDatosNuevos then  // con datos nuevos
        begin
          IdEndoso := ValorSql( SqlSimpleQuery( 'ART.AFILIACION.GET_ULTENDOSO(' + SqlValue( sdqConsulta.FieldByName( 'CA_IDFORMULARIO' ).AsInteger ) + ')' ) );
          if IdEndoso = '' then
            IdEndoso := Null;
        end
      else                             // con los mismos datos
        IdEndoso := sdqCCA_CARTA.FieldByName( 'CA_IDENDOSO' ).Value;

      FieldToTString( sdqCCA_CARTA.FieldByName( 'CA_TEXTOFINAL' ), TextoCarta );

      sdqCCA_CARTA.Insert; { ------------------------------- ------------------------------- }

      sdqCCA_CARTA.FieldByName( 'CA_IDENDOSO' ).Value   := IdEndoso;
      sdqCCA_CARTA.FieldByName( 'CA_ID' ).AsInteger     := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;
      sdqCCA_CARTA.FieldByName( 'CA_USUALTA' ).AsString := frmPrincipal.DBLogin.UserId;
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
{----------------------------------------------------------------------------------------------------------------------}
{ Alta de las cartas documento }
procedure TfrmBaseAdministracionCartas.tbNuevoClick(Sender: TObject);
begin
  with TfrmAfiGeneracionCartas.Create( Self ) do
    try
      if Sender = tbNuevo Then
        IdCarta := ART_EMPTY_ID
      else
        IdCarta := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;

      if Execute( IdCarta ) and sdqConsulta.Active then
        sdqConsulta.Refresh;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Modificación de las cartas documento }
procedure TfrmBaseAdministracionCartas.tbModificarClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 Then
    InvalidMsg ( Grid, 'Debe seleccionar una fila de la grilla' )
  else if Grid.SelectedRows.Count > 1 Then
    InvalidMsg( Grid, 'Solo debe seleccionar una fila de la grilla' )
  else
    begin
      sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[0]) );

      if IsRegistroModificacionValido() then
        tbNuevoClick( Sender );
    end;    
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Determina si la carta doc. seleccionada en la grilla para ser modificada es o no válida }
function TfrmBaseAdministracionCartas.IsRegistroModificacionValido: Boolean;
begin
  Result := False;

  // la carta no debe estar dada de baja
  if not sdqConsulta.FieldByName( 'CA_FECHABAJA' ).IsNull then
    InvalidMsg ( Grid, 'La carta documento se encuentra dada de baja' )

  // la carta no debe estar recepcionada
  else if not sdqConsulta.FieldByName( 'CA_FECHARECEPCION' ).IsNull then
    InvalidMsg ( Grid, 'La carta documento ya ha sido recepcionada' )

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.fraModuloOnChange(Sender: TObject);
begin
  if fraModulo.IsSelected then
    begin
      fraCodTexto.Sql    := 'SELECT TC_ID AS ' + CD_ALIAS_ID + ', ' +
                                         'TC_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                         'TC_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                                         'TC_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                                    'FROM CTC_TEXTOCARTA, CTA_TEXTOAREA ' +
                                   'WHERE TC_ID=TA_IDTEXTOCARTA ' +
                                     'AND TA_IDAREATEXTO=' + SqlValue( fraModulo.Value );

      fraCodFirmante.Sql := 'SELECT FI_ID AS ' + CD_ALIAS_ID + ', ' +
                                         'FI_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                         'FI_FIRMANTE AS ' + CD_ALIAS_DESC + ', ' +
                                         'FI_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                                    'FROM CFI_FIRMA, CFA_FIRMANTEAREA ' +
                                   'WHERE FI_ID=FA_IDFIRMANTE ' +
                                     'AND FA_IDAREATEXTO=' + SqlValue( fraModulo.Value );
    end
  else
    begin
      fraCodTexto.Sql    := 'SELECT DISTINCT TC_ID AS ' + CD_ALIAS_ID + ', ' +
                                         'TC_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                         'TC_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                                         'TC_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                                    'FROM CTC_TEXTOCARTA, CAT_AREATEXTO, CTA_TEXTOAREA ' +
                                   'WHERE TC_ID=TA_IDTEXTOCARTA ' +
                                     'AND AT_ID=TA_IDAREATEXTO ' +
                                     'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';

      fraCodFirmante.Sql := 'SELECT DISTINCT FI_ID AS ' + CD_ALIAS_ID + ', ' +
                                         'FI_ID AS ' + CD_ALIAS_CODIGO + ', ' +
                                         'FI_FIRMANTE AS ' + CD_ALIAS_DESC + ', ' +
                                         'FI_FECHABAJA AS ' + CD_ALIAS_BAJA + ' ' +
                                    'FROM CFI_FIRMA, CFA_FIRMANTEAREA, CAT_AREATEXTO ' +
                                   'WHERE FI_ID=FA_IDFIRMANTE ' +
                                     'AND AT_ID=FA_IDAREATEXTO ' +
                                     'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ Devuelve S/N según lo seleccionado en el radio group del código de recepción }
function TfrmBaseAdministracionCartas.GetRecepcionOk_Busqueda(rg_RecepcionOk: TRadioGroup): String;
var
  sRecepOk: String;
begin
  case rg_RecepcionOk.ItemIndex of
    0:  sRecepOk := 'S';   // si
    1:  sRecepOk := 'N';   // no
  else
    sRecepOk := '';
  end;

  Result := sRecepOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.RecepcionCarta;
begin
  if Grid.SelectedRows.Count = 0 Then
    InvalidMsg ( Grid, 'Debe seleccionar una fila de la grilla' )
  else if Grid.SelectedRows.Count > 1 Then
    InvalidMsg( Grid, 'Solo debe seleccionar una fila de la grilla' )
  else
  begin
    sdqConsulta.GotoBookmark( pointer(Grid.SelectedRows.Items[0]) );
    if IsRegistroRecepcionCartaDocValido() then
    begin
      edFechaRecepcion.MaxDate := DBDateTime;

      with fraCodRecepcion do
      begin
        Clave       := 'CODRE';
        Especial1   := ValorSql('SELECT TB_ESPECIAL2 ' +
                                '  FROM CTB_TABLAS ' +
                                ' WHERE TB_CLAVE = ''CORRE'' ' +
                                '   AND TB_CODIGO = ' + SqlValue(sdqConsulta.FieldbyName( 'CORREO' ).AsString));
        ShowBajas   := False;
      end;
      DoHabilitarIngresoCodigoRecepcion( rgRecepOk );
    
      if not sdqConsulta.FieldByName( 'CA_FECHARECEPCION' ).IsNull then
      begin
        if MsgBox ( 'La carta documento ya ha sido recepcionada.' + #13#10 + 'Desea usted modificarla?', MB_YESNO + MB_ICONINFORMATION ) = IDYES then
        begin
          ModoForm := 'modif';
          LoadDatosFormPanel;              
          if fpRecepcionCartaDoc.ShowModal = mrOk Then
            sdqConsulta.Refresh;
        end;
      end
      else
      begin
        ModoForm := 'alta';
        ClearDatosFormPanel;
        if fpRecepcionCartaDoc.ShowModal = mrOk Then
          sdqConsulta.Refresh;
      end;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.LoadDatosFormPanel;
begin
  if sdqConsulta.FieldByName( 'CA_RECEPCIONOK' ).AsString = 'S' then
    rgRecepOk.ItemIndex := 0 
  else
    rgRecepOk.ItemIndex := 1;

  fraCodRecepcion.Value := sdqConsulta.FieldByName( 'CA_CODRECEPCION').AsString;
  edFechaRecepcion.Date := sdqConsulta.FieldByName( 'CA_FECHARECEPCION' ).AsDateTime;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.ClearDatosFormPanel;
begin
  rgRecepOk.ItemIndex := -1;
  fraCodRecepcion.Clear;
  edFechaRecepcion.Clear;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.CalcularFilas;
begin
  edCantCartas.Value := grid.SelectedRows.Count;
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotalCartas.Value := sdqConsulta.RecordCount
  else
    edTotalCartas.Value := 0; 
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.GridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.tbRecepcionMasivaClick(
  Sender: TObject);
begin
  ImpoExpoWizard('RECCA');

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.OpcionesImpresion(Sender: TObject);
begin
  VCLExtra.LockControls( [edCantCopias, cmbImpresoras], rbPreview.Checked );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.btnAceptarImpresionClick(
  Sender: TObject);
var
  i: Integer;
  IdCarta: integer;
  OldImpresora: integer;
begin
  OldImpresora := Printer.PrinterIndex;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  try
    PararImpresion := False;
    btnParar.Enabled := True;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      if PararImpresion then
        Raise Exception.Create('Ha decidido cancelar la impresión');

      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
      IdCarta := sdqConsulta.FieldByName( 'CA_ID' ).AsInteger;
      MostrarCartaDocumento(IdCarta, tmBeginEnd, rbImprimir.Checked, edCantCopias.Value);
      BarProgreso.Position := Round((i+1)/Grid.SelectedRows.Count*100);
      Application.ProcessMessages;
    end;
    fpOpcionesImpresion.ModalResult := mrOk;
    Grid.UnSelectAll;
    sdqConsulta.Refresh;
  finally
    Printer.PrinterIndex := OldImpresora;
    btnParar.Enabled := False;
  end;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.btnPararClick(Sender: TObject);
begin
  PararImpresion   := True;
  btnParar.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign (Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.mnuDesMarcarTodosClick(
  Sender: TObject);
begin
  Grid.UnselectAll;
  CalcularFilas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmBaseAdministracionCartas.tbCalcularTotalClick(
  Sender: TObject);
begin
  CalcularFilas;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

