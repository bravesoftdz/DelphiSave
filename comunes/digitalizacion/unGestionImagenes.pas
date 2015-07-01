unit unGestionImagenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unFraVistaTIFF, StdCtrls,
  unFraRTD_TIPODOCUMENTO, unFraCodigoDescripcion, unFraCodDesc, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unfraFFO_FAXFORMULARIO, CheckLst, ARTCheckListBox, JvgGroupBox, JvExControls, JvComponent, JvXPCore, JvXPCheckCtrls,
  JvExExtCtrls, JvNetscapeSplitter, RxGIF, FormPanel, JvExComCtrls, JvComCtrls, JvDBTreeView, ImgList, unCustomConsulta,
  Menus, AdvMenus, DBCtrls, Mask, ToolEdit, unfraUsuarios;

type
  TfrmGestionImagenes = class(TfrmCustomGridABM)
    fraVistaTIFF: TfraVistaTIFF;
    gbFiltrosMultiples: TJvgGroupBox;
    gbFiltros: TJvgGroupBox;
    fraGI_IDFORMULARIO: TfraFFO_FAXFORMULARIO;
    fraGI_IDBANDEJA: TfraCodDesc;
    fraGI_IDDOCUMENTO: TfraRTD_TIPODOCUMENTO;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    chkNoImpresos: TJvXPCheckbox;
    chkActivos: TJvXPCheckbox;
    chkSinDocumento: TJvXPCheckbox;
    chkSinBandeja: TJvXPCheckbox;
    ShortCutControlHijo: TShortCutControl;
    Splitter: TJvNetscapeSplitter;
    SplitterMultiple: TJvNetscapeSplitter;
    TimerImagenes: TTimer;
    pnlLeft: TPanel;
    pnlBottom: TPanel;
    btnAsignar: TButton;
    btnCambiarCodigo: TButton;
    btnImprimir: TButton;
    sdqSBD_BANDEJADOCUMENTACION: TSDQuery;
    dsSBD_BANDEJADOCUMENTACION: TDataSource;
    ImageListBandejas: TImageList;
    sdqSBD_BANDEJADOCUMENTACIONBD_ID: TFloatField;
    sdqSBD_BANDEJADOCUMENTACIONBD_DESCRIPCION: TStringField;
    sdqSBD_BANDEJADOCUMENTACIONBD_ORDEN: TFloatField;
    sdqSBD_BANDEJADOCUMENTACIONBD_IDBANDEJAPADRE: TFloatField;
    sdqSBD_BANDEJADOCUMENTACIONBD_PRIORIDAD: TFloatField;
    sdqSBD_BANDEJADOCUMENTACIONPrioridad: TIntegerField;
    sdqSBD_BANDEJADOCUMENTACIONId: TIntegerField;
    sdqSBD_BANDEJADOCUMENTACIONIdPadre: TIntegerField;
    Label5: TLabel;
    fraFE_IDFORMULARIO: TfraFFO_FAXFORMULARIO;
    sdqConsultaFE_ID: TFloatField;
    sdqConsultaFE_IDFORMULARIO: TFloatField;
    sdqConsultaFE_NROORDEN: TStringField;
    sdqConsultaFE_PAGINAS: TFloatField;
    sdqConsultaFE_ARCHIVOIMAGEN: TStringField;
    sdqConsultaFE_FECHAINGRESO: TDateTimeField;
    sdqConsultaFE_FECHAALTA: TDateTimeField;
    sdqConsultaFE_USUVISUALIZA: TStringField;
    sdqConsultaFE_FECHAVISUALIZA: TDateTimeField;
    sdqConsultaFE_USUIMPRESION: TStringField;
    sdqConsultaFE_FECHAIMPRESION: TDateTimeField;
    sdqConsultaFE_FECHABAJA: TDateTimeField;
    sdqConsultaFE_IDLINEA: TFloatField;
    sdqConsultaFE_ERRORFECHA: TDateTimeField;
    sdqConsultaFE_ERRORDESCRIPCION: TStringField;
    sdqConsultaFE_NROPAGINA: TFloatField;
    sdqConsultaFU_IDFORMULARIO: TFloatField;
    sdqConsultaFU_USUARIO: TStringField;
    sdqConsultaFU_FECHAALTA: TDateTimeField;
    sdqConsultaFU_USUALTA: TStringField;
    sdqConsultaFU_FECHABAJA: TDateTimeField;
    sdqConsultaFU_USUBAJA: TStringField;
    sdqConsultaFU_SOLOLECTURA: TStringField;
    sdqConsultaFO_ID: TFloatField;
    sdqConsultaFO_DESCRIPCION: TStringField;
    sdqConsultaFO_FECHAALTA: TDateTimeField;
    sdqConsultaFO_USUALTA: TStringField;
    sdqConsultaFO_FECHAMODIF: TDateTimeField;
    sdqConsultaFO_USUMODIF: TStringField;
    sdqConsultaFO_FECHABAJA: TDateTimeField;
    sdqConsultaFO_USUBAJA: TStringField;
    sdqConsultaGI_ID: TFloatField;
    sdqConsultaGI_IDFAXENTRANTE: TFloatField;
    sdqConsultaGI_IDEXPEDIENTE: TFloatField;
    sdqConsultaGI_IDFORMULARIO: TFloatField;
    sdqConsultaGI_IDDOCUMENTO: TFloatField;
    sdqConsultaGI_IDBANDEJA: TFloatField;
    sdqConsultaGI_FECHAALTA: TDateTimeField;
    sdqConsultaGI_USUCARGA: TStringField;
    sdqConsultaGI_FECHACARGA: TDateTimeField;
    sdqConsultaGI_USUPROCESADO: TStringField;
    sdqConsultaGI_FECHAPROCESADO: TDateTimeField;
    sdqConsultaGI_DESCARTADO: TStringField;
    sdqConsultaGI_NUEVOIDFORMULARIO: TFloatField;
    sdqConsultaBD_ID: TFloatField;
    sdqConsultaBD_DESCRIPCION: TStringField;
    sdqConsultaBD_PRIORIDAD: TFloatField;
    sdqConsultaBD_ORDEN: TFloatField;
    sdqConsultaBD_USUALTA: TStringField;
    sdqConsultaBD_FECHAALTA: TDateTimeField;
    sdqConsultaBD_USUMODIF: TStringField;
    sdqConsultaBD_FECHAMODIF: TDateTimeField;
    sdqConsultaBD_USUBAJA: TStringField;
    sdqConsultaBD_FECHABAJA: TDateTimeField;
    sdqConsultaBD_IDBANDEJAPADRE: TFloatField;
    sdqConsultaBD_ACTIVA: TStringField;
    sdqConsultaTD_ID: TFloatField;
    sdqConsultaTD_CODIGO: TStringField;
    sdqConsultaTD_DESCRIPCION: TStringField;
    sdqConsultaTD_SECTOR: TStringField;
    sdqConsultaTD_USUALTA: TStringField;
    sdqConsultaTD_FECHAALTA: TDateTimeField;
    sdqConsultaTD_USUMODIF: TStringField;
    sdqConsultaTD_FECHAMODIF: TDateTimeField;
    sdqConsultaTD_USUBAJA: TStringField;
    sdqConsultaTD_FECHABAJA: TDateTimeField;
    sdqConsultaTD_IDTIPOARCHIVO: TFloatField;
    sdqConsultaTD_AUTOMATICO: TStringField;
    sdqConsultaTD_TIENEFECHAS: TStringField;
    fpBandejaUsuarios: TFormPanel;
    tvBandejaUsuarios: TJvDBTreeView;
    btnCerrar: TButton;
    dsBandejaUsuarios: TDataSource;
    sdqBandejaUsuarios: TSDQuery;
    sdqBandejaUsuariosBD_IDBANDEJAPADRE: TFloatField;
    sdqBandejaUsuariosBD_PRIORIDAD: TFloatField;
    sdqBandejaUsuariosBD_ORDEN: TFloatField;
    sdqBandejaUsuariosICONO: TFloatField;
    sdqBandejaUsuariosIcon: TIntegerField;
    PopupMenuUsuarios: TAdvPopupMenu;
    mnuAgregar: TMenuItem;
    mnuRemover: TMenuItem;
    AdvMenuStyler: TAdvMenuStyler;
    btnDescartar: TButton;
    chkNoDescartados: TJvXPCheckbox;
    pnlExtraData: TPanel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label7: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    sdqConsultaGI_FECHABLOQUEO: TDateTimeField;
    sdqConsultaGI_USUBLOQUEO: TStringField;
    sdqConsultaGI_USUDESCARTADO: TStringField;
    sdqConsultaGI_FECHADESCARTADO: TDateTimeField;
    pnlMultipleFax: TPanel;
    clbFE_IDFORMULARIO: TARTCheckListBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    clbGI_IDDOCUMENTO: TARTCheckListBox;
    Panel5: TPanel;
    Panel6: TPanel;
    edFE_FECHAINGRESODesde: TDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    edFE_FECHAINGRESOHasta: TDateEdit;
    Label10: TLabel;
    DBText7: TDBText;
    Label11: TLabel;
    DBText8: TDBText;
    DBText9: TDBText;
    fraGI_USUBLOQUEO: TfraUsuario;
    Label12: TLabel;
    chkNoBloqueadas: TJvXPCheckbox;
    fraGI_USUPROCESADO: TfraUsuario;
    Label13: TLabel;
    chkVerAcuse: TJvXPCheckbox;
    fpUsuario: TFormPanel;
    fraUsuario: TfraUsuario;
    lbUsuario: TLabel;
    btnAceptarUsuario: TButton;
    btnCancelarUsuario: TButton;
    Bevel1: TBevel;
    sdqBandejaUsuariosDESCRIPCION: TStringField;
    sdqBandejaUsuariosBANDEJA: TStringField;
    sdqBandejaUsuariosSE_ID: TFloatField;
    sdqBandejaUsuariosORDEN: TFloatField;
    sdqBandejaUsuariosID: TFloatField;
    sdqBandejaUsuariosSE_USUARIO: TStringField;
    sdqConsultaEXTRA: TStringField;
    fpBandejas: TFormPanel;
    tvBandejas: TJvDBTreeView;
    btnAceptarBandeja: TButton;
    btnCancelarBandeja: TButton;
    chkContarDocumentos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure TimerImagenesTimer(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnAsignarClick(Sender: TObject);
    procedure btnCambiarCodigoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure sdqSBD_BANDEJADOCUMENTACIONCalcFields(DataSet: TDataSet);
    procedure btnAceptarBandejaClick(Sender: TObject);
    procedure fpBandejasShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbBandejaUsuarioClick(Sender: TObject);
    procedure chkSinBandejaClick(Sender: TObject);
    procedure chkSinDocumentoClick(Sender: TObject);
    procedure fraGI_IDBANDEJAPropiedadesChange(Sender: TObject);
    procedure fraGI_IDDOCUMENTOPropiedadesChange(Sender: TObject);
    procedure fpBandejaUsuariosShow(Sender: TObject);
    procedure sdqBandejaUsuariosCalcFields(DataSet: TDataSet);
    procedure PopupMenuUsuariosPopup(Sender: TObject);
    procedure mnuAgregarClick(Sender: TObject);
    procedure mnuRemoverClick(Sender: TObject);
    procedure tvBandejaUsuariosChange(Sender: TObject; Node: TTreeNode);
    procedure tvBandejaUsuariosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnDescartarClick(Sender: TObject);
    procedure chkNoBloqueadasClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure btnAceptarUsuarioClick(Sender: TObject);
    procedure fpUsuarioShow(Sender: TObject);
    procedure ContarDocumentos(Sender: TObject);
  private
    FSQL, FUltimaOrden: String;
    iBandeja: Integer;
    FCambioColor: Boolean;
    procedure fraGI_USUBLOQUEOChange(Sender: TObject);
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    procedure RefreshData; override;

    function DoABM: Boolean; override;
    function Validar : Boolean; override;
  end;

var
  frmGestionImagenes: TfrmGestionImagenes;

implementation

uses
  unFiltros, unSesion, unGrids, VCLExtra, Math, unDmPrincipal, CustomDlgs, SQLFuncs,
  unArt, AnsiSql;

{$R *.dfm}

{ TfrmGestionImagenes }

procedure TfrmGestionImagenes.RefreshData;
var
  sSql: String;
begin
  sSql := FSQL + ' AND fu_usuario = ' + SQLValue(Sesion.UserID) + ' ';
  
  if chkNoBloqueadas.Checked then
    sSql := sSql + ' AND GI_FECHABLOQUEO IS NULL ';

  if chkNoImpresos.Checked then
    sSql := sSql + ' AND FE_IMPRESO = ''N'' ';

  if chkActivos.Checked then
    sSql := sSql + ' AND FE_FECHABAJA IS NULL ';

  if chkSinBandeja.Checked then
    sSql := sSql + ' AND GI_IDBANDEJA IS NULL ';

  if chkSinDocumento.Checked then
    sSql := sSql + ' AND GI_IDDOCUMENTO IS NULL ';

  if chkNoDescartados.Checked then
    sSql := sSql + ' AND GI_DESCARTADO = ''N'' ';

  Grid.ColumnByField['BD_DESCRIPCION'].Visible := not chkSinBandeja.Checked;
  Grid.ColumnByField['TD_DESCRIPCION'].Visible := not chkSinDocumento.Checked;
  Grid.ColumnByField['FE_FECHAIMPRESION'].Visible := not chkNoImpresos.Checked;

  sdqConsulta.Sql.Text := sSql + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmGestionImagenes.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.Sql.Text;
  fraGI_IDFORMULARIO.Usuario := Sesion.UserID;
  Grid.Parent := pnlLeft;
  Grid.Align := alClient;
  fraFE_IDFORMULARIO.ShowBajas := False;
  edFE_FECHAINGRESODesde.Date := DBDate - 7;

  fraGI_USUBLOQUEO.Sectores := ' (''CARGAAM'', ''FAXAMED'') ';
  fraGI_USUBLOQUEO.UsuariosGenericos := False;
  fraGI_USUBLOQUEO.OnChange := fraGI_USUBLOQUEOChange;

  fraGI_USUPROCESADO.Sectores := ' (''CARGAAM'', ''FAXAMED'') ';
  fraGI_USUPROCESADO.UsuariosGenericos := False;

  fraUsuario.Sectores := ' (''CARGAAM'', ''FAXAMED'') ';
  fraUsuario.UsuariosGenericos := False;

  fraVistaTIFF.PanelAuxVisible := True;
  fraVistaTIFF.DataSource := dsConsulta;

  SortDialog.SortBy(SortDialog.SortFields.ItemsByField['FE_NROORDEN'], otAscending);
end;

procedure TfrmGestionImagenes.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  FUltimaOrden := sdqConsulta.FieldByName('FE_NROORDEN').AsString;
  FCambioColor := False;

  TimerImagenes.Enabled := False;
  fraVistaTIFF.Clear;
  TimerImagenes.Enabled := True;
  fraVistaTIFF.MoverEnDataSource(nil);
end;

procedure TfrmGestionImagenes.TimerImagenesTimer(Sender: TObject);
begin
  TimerImagenes.Enabled := False;
  with fraVistaTIFF, sdqConsulta do
  begin
    try
      Image := FieldByName('FE_ARCHIVOIMAGEN').AsString;
    except
      InfoHint(imgVista, 'Ocurrió un error al intentar cargar la imagen.');
    end;

    PageCount     := FieldByName('FE_PAGINAS').AsInteger;
    MultiPage     := False;
    ID            := FieldByName('FE_ID').AsInteger;
    IDFormulario  := FieldByName('FE_IDFORMULARIO').AsInteger;
    NroOrden      := FieldByName('FE_NROORDEN').AsString;
    imgVista.Hint := FieldByName('EXTRA').AsString;
  end;
end;

procedure TfrmGestionImagenes.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    DynColWidthsByData(Grid, 5);
    Grid.ColumnByField['FE_NROORDEN'].Visible := chkVerAcuse.Checked;
    pnlLeft.Width := Min(GetColumnWidths(Grid, True), Screen.Width);
    sdqConsulta.First;
  end;
  if Grid.CanFocus then
    Grid.SetFocus;
end;
 
procedure TfrmGestionImagenes.btnAsignarClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, btnAsignar, 'Debe seleccionar una imagen.');
  if fpBandejas.ShowModal = mrOK then
  begin
    Sql.TableName := 'SIN.SGI_GESTIONIMAGENES';
    Sql.SqlType := stUpdate;

    Sql.Clear;
    Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsInteger);
    Sql.Fields.Add('GI_IDBANDEJA', iBandeja);

    inherited DoABM;

    i := sdqConsulta.RecNo;
    RefreshData;
    if sdqConsulta.RecordCount > i {$IFNDEF VER150} - 1{$ENDIF} then
      sdqConsulta.MoveBy(Min(i, sdqConsulta.RecordCount) {$IFNDEF VER150} - 1{$ENDIF});
  end;
end;

procedure TfrmGestionImagenes.btnCambiarCodigoClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, btnCambiarCodigo, 'Debe seleccionar una imagen.');
  tbModificar.Click;
end;

procedure TfrmGestionImagenes.btnImprimirClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, btnImprimir, 'Debe seleccionar una imagen.');
  if PrintDialog.Execute then
  begin
    fraVistaTIFF.ImprimirImagen;

    i := sdqConsulta.RecNo;
    RefreshData;
    if sdqConsulta.RecordCount > i {$IFNDEF VER150} - 1{$ENDIF} then
      sdqConsulta.MoveBy(Min(i, sdqConsulta.RecordCount) {$IFNDEF VER150} - 1{$ENDIF});
  end;
end;

procedure TfrmGestionImagenes.sdqSBD_BANDEJADOCUMENTACIONCalcFields(DataSet: TDataSet);
begin
  inherited;
  sdqSBD_BANDEJADOCUMENTACIONPrioridad.AsInteger := sdqSBD_BANDEJADOCUMENTACIONBD_PRIORIDAD.AsInteger;
  sdqSBD_BANDEJADOCUMENTACIONId.AsInteger := sdqSBD_BANDEJADOCUMENTACIONBD_ID.AsInteger;
  sdqSBD_BANDEJADOCUMENTACIONIdPadre.AsInteger := sdqSBD_BANDEJADOCUMENTACIONBD_IDBANDEJAPADRE.AsInteger;
end;

procedure TfrmGestionImagenes.btnAceptarBandejaClick(Sender: TObject);
begin
  Verificar(tvBandejas.SelectedIndex = -1, btnAceptarBandeja, 'Debe seleccionar una bandeja.');
  Verificar(tvBandejas.Selected.HasChildren, btnAceptarBandeja, 'Debe seleccionar una bandeja que no sea contenedora de otras bandejas.');
  iBandeja := sdqSBD_BANDEJADOCUMENTACIONBD_ID.AsInteger;
  fpBandejas.ModalResult := mrOk;
end;

procedure TfrmGestionImagenes.ClearControls;
begin
  inherited;
  fraFE_IDFORMULARIO.Clear;
end;

procedure TfrmGestionImagenes.ClearData;
begin
  fraGI_IDFORMULARIO.Clear;
  fraGI_IDBANDEJA.Clear;
  fraGI_IDDOCUMENTO.Clear;
  chkNoImpresos.Checked := True;
  chkActivos.Checked := True;
  chkSinBandeja.Checked := True;
  chkSinDocumento.Checked := True;
  chkNoDescartados.Checked := True;
  chkNoBloqueadas.Checked := True;
  clbGI_IDDOCUMENTO.ClearChecks;
  clbFE_IDFORMULARIO.ClearChecks;
  edFE_FECHAINGRESODesde.Date := DBDate - 7;
  edFE_FECHAINGRESOHasta.Clear;
  fraGI_USUPROCESADO.Limpiar;
  fraGI_USUBLOQUEO.Limpiar;
  fraVistaTIFF.Clear;
  inherited;
end;

function TfrmGestionImagenes.DoABM: Boolean;
var
  i: integer;
begin
  Result := False;
  Sql.TableName := 'SIN.SGI_GESTIONIMAGENES';
  Sql.SqlType := stUpdate;

  if Grid.SelectedRows.Count > 0 then
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
      Sql.Clear;
      Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsInteger);
      Sql.Fields.Add('GI_NUEVOIDFORMULARIO', fraFE_IDFORMULARIO.Value);

      Result := inherited DoABM;
    end
  else begin
    Sql.Clear;
    Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsInteger);
    Sql.Fields.Add('GI_NUEVOIDFORMULARIO', fraFE_IDFORMULARIO.Value);

    Result := inherited DoABM;
  end;
end;

procedure TfrmGestionImagenes.LoadControls;
begin
  fraFE_IDFORMULARIO.Value := sdqConsulta.FieldByName('FE_IDFORMULARIO').Value;
end;

function TfrmGestionImagenes.Validar: Boolean;
begin
  Verificar(fraFE_IDFORMULARIO.IsEmpty, fraFE_IDFORMULARIO.edCodigo, 'Debe seleccionar un formulario.');
  Result := True;
end;

procedure TfrmGestionImagenes.fpBandejasShow(Sender: TObject);
begin
  sdqSBD_BANDEJADOCUMENTACION.Close;
  OpenQueryEx(sdqSBD_BANDEJADOCUMENTACION, [SqlBoolean(chkContarDocumentos.Checked, False)]);
  tvBandejas.FullExpand;
  if not sdqConsulta.FieldByName('GI_IDBANDEJA').IsNull then
    sdqSBD_BANDEJADOCUMENTACION.Locate('BD_ID', sdqConsulta.FieldByName('GI_IDBANDEJA').AsInteger, []);
end;

procedure TfrmGestionImagenes.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (sdqConsulta.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF}) then
  begin
    FUltimaOrden := sdqConsulta.FieldByName('FE_NROORDEN').AsString;
    FCambioColor := False;
  end;
    
  inherited;
  if sdqConsulta.FieldByName('FE_NROORDEN').AsString <> FUltimaOrden then
  begin
    FCambioColor := not FCambioColor;
    FUltimaOrden := sdqConsulta.FieldByName('FE_NROORDEN').AsString;
  end;

  if FCambioColor then
    Background := clSkyBlue
  else
    Background := clMoneyGreen;

  if sdqConsulta.FieldByName('GI_DESCARTADO').AsString = 'S' then
    AFont.Style := AFont.Style + [fsStrikeOut]
  else
    AFont.Style := AFont.Style - [fsStrikeOut];  
end;

procedure TfrmGestionImagenes.tbBandejaUsuarioClick(Sender: TObject);
begin
  fpBandejaUsuarios.ShowModal;
end;

procedure TfrmGestionImagenes.chkSinBandejaClick(Sender: TObject);
begin
  if chkSinBandeja.Checked then
    fraGI_IDBANDEJA.Clear;
end;

procedure TfrmGestionImagenes.chkSinDocumentoClick(Sender: TObject);
begin
  if chkSinDocumento.Checked then
    fraGI_IDDOCUMENTO.Clear;
end;

procedure TfrmGestionImagenes.fraGI_IDBANDEJAPropiedadesChange(Sender: TObject);
begin
  chkSinBandeja.Checked := fraGI_IDBANDEJA.IsEmpty;
end;

procedure TfrmGestionImagenes.fraGI_IDDOCUMENTOPropiedadesChange(Sender: TObject);
begin
  chkSinDocumento.Checked := fraGI_IDDOCUMENTO.IsEmpty;
end;

procedure TfrmGestionImagenes.fpBandejaUsuariosShow(Sender: TObject);
begin
  sdqBandejaUsuarios.Close;
  OpenQuery(sdqBandejaUsuarios);
  tvBandejaUsuarios.FullExpand;
  if not sdqConsulta.FieldByName('GI_IDBANDEJA').IsNull then
    sdqBandejaUsuarios.Locate('ID', sdqConsulta.FieldByName('GI_IDBANDEJA').AsInteger, []);
end;

procedure TfrmGestionImagenes.sdqBandejaUsuariosCalcFields(DataSet: TDataSet);
begin
  sdqBandejaUsuariosIcon.AsInteger := sdqBandejaUsuariosICONO.AsInteger;
end;

procedure TfrmGestionImagenes.PopupMenuUsuariosPopup(Sender: TObject);
begin
  tvBandejaUsuariosChange(Sender, tvBandejaUsuarios.Selected);
  mnuAgregar.Visible := (sdqBandejaUsuariosBD_IDBANDEJAPADRE.AsInteger <> -1) and (sdqBandejaUsuariosICONO.AsInteger <> 3);
  mnuRemover.Visible := (sdqBandejaUsuariosICONO.AsInteger = 3);
end;

procedure TfrmGestionImagenes.mnuAgregarClick(Sender: TObject);
begin
  if fpUsuario.ShowModal = mrOk then
  begin
    Sql.TableName := 'SIN.SBU_BANDEJAUSUARIO';
    Sql.SqlType := stInsert;

    Sql.Clear;
    Sql.PrimaryKey.Add('BU_ID', ValorSQLInteger('SELECT MAX(BU_ID) FROM SIN.SBU_BANDEJAUSUARIO') + 1);
    Sql.PrimaryKey.Add('BU_IDBANDEJA', sdqBandejaUsuarios.FieldByName('ID').AsInteger + 1000);
    Sql.PrimaryKey.Add('BU_IDUSUARIO', fraUsuario.ID);
    Sql.Fields.Add('BU_USUALTA', Sesion.UserID);
    Sql.Fields.Add('BU_FECHAALTA', exDateTime);

    inherited DoABM;
    fpBandejaUsuariosShow(nil);
  end;
end;

procedure TfrmGestionImagenes.mnuRemoverClick(Sender: TObject);
begin
{
  if tvBandejaUsuarios.Selected.Text <> sdqBandejaUsuarios.FieldByName('DESCRIPCION').AsString then
    InfoHint(tvBandejaUsuarios, 'Debe seleccionar el dato antes de ver sus propiedades.', True);
}
  if MsgAsk(Format('¿Está seguro que desea remover al usuario %s de la bandeja %s?',
            [sdqBandejaUsuarios.FieldByName('DESCRIPCION').AsString, sdqBandejaUsuarios.FieldByName('BANDEJA').AsString])) then
  begin
    Sql.TableName := 'SIN.SBU_BANDEJAUSUARIO';
    Sql.SqlType := stUpdate;

    Sql.Clear;
    Sql.PrimaryKey.Add('BU_ID', sdqBandejaUsuarios.FieldByName('ID').AsInteger);
    Sql.Fields.Add('BU_USUBAJA', Sesion.UserID);
    Sql.Fields.Add('BU_FECHABAJA', exDateTime);

    inherited DoABM;
    EjecutarSQLEx('UPDATE SIN.SGI_GESTIONIMAGENES ' +
                     'SET GI_FECHABLOQUEO = NULL, ' +
                         'GI_USUBLOQUEO = NULL ' +
                   'WHERE GI_USUBLOQUEO = :USUARIO ' +
                     'AND GI_IDBANDEJA = :BANDEJA ' +
                     'AND GI_IDEXPEDIENTE IS NULL ' +
                     'AND GI_IDDOCUMENTO IS NULL', [sdqBandejaUsuarios.FieldByName('SE_USUARIO').AsString, sdqBandejaUsuarios.FieldByName('ORDEN').AsInteger]);
    fpBandejaUsuariosShow(nil);
  end;
end;

procedure TfrmGestionImagenes.tvBandejaUsuariosChange(Sender: TObject; Node: TTreeNode);
begin
//
end;

procedure TfrmGestionImagenes.tvBandejaUsuariosMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if Button = mbRight then
//    tvBandejaUsuarios.OnClick(nil);
end;

procedure TfrmGestionImagenes.btnDescartarClick(Sender: TObject);
var
  i: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, btnDescartar, 'Debe seleccionar una imagen.');
  if MsgAsk('¿Está seguro que desea descartar esta imagen?' + CRLF + 'No quedará registro alguno de esta hoja de fax en la documentación digitalizada.') then
  begin
    Sql.TableName := 'SIN.SGI_GESTIONIMAGENES';
    Sql.SqlType := stUpdate;

    Sql.Clear;
    Sql.PrimaryKey.Add('GI_ID', sdqConsulta.FieldByName('GI_ID').AsInteger);
    Sql.Fields.Add('GI_DESCARTADO', 'S');
    Sql.Fields.Add('GI_USUDESCARTADO', Sesion.UserID);
    Sql.Fields.Add('GI_FECHADESCARTADO', exDateTime);

    inherited DoABM;

    i := sdqConsulta.RecNo;
    RefreshData;
    if sdqConsulta.RecordCount > i {$IFNDEF VER150} - 1{$ENDIF} then
      sdqConsulta.MoveBy(Min(i, sdqConsulta.RecordCount) {$IFNDEF VER150} - 1{$ENDIF});
  end;
end;

procedure TfrmGestionImagenes.chkNoBloqueadasClick(Sender: TObject);
begin
  if chkNoBloqueadas.Checked then
    fraGI_USUBLOQUEO.Limpiar;
end;

procedure TfrmGestionImagenes.fraGI_USUBLOQUEOChange(Sender: TObject);
begin
  chkNoBloqueadas.Checked := fraGI_USUBLOQUEO.IsEmpty;
end;

procedure TfrmGestionImagenes.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  inherited;
  DynColWidthsByData(Grid);
  pnlLeft.Width := Min(GetColumnWidths(Grid, True), Screen.Width);
end;

procedure TfrmGestionImagenes.btnAceptarUsuarioClick(Sender: TObject);
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Debe seleccionar un usuario.');
  fpUsuario.ModalResult := mrOk;
end;

procedure TfrmGestionImagenes.fpUsuarioShow(Sender: TObject);
begin
  fraUsuario.Limpiar;
  lbUsuario.Caption := 'Agregar al siguiente usuario ' + sdqBandejaUsuarios.FieldByName('BANDEJA').AsString;
end;

procedure TfrmGestionImagenes.ContarDocumentos(Sender: TObject);
begin
  inherited;
  fpBandejasShow(nil);
end;

end.
