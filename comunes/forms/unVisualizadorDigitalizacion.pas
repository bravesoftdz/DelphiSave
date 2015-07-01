unit unVisualizadorDigitalizacion;

interface              
           
uses
  {$IFDEF VER140}Variants, {$ENDIF} {$IFDEF VER150}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unFraVistaTIFF, StdCtrls, JvgGroupBox,
  unFraDigitalizacion, JvExExtCtrls, JvSplitter, ImgList, IntEdit,
  JvNetscapeSplitter, Menus, CheckLst, ARTCheckListBox, Mask, PatternEdit,
  ToolEdit, DateComboBox;

type
  TfrmVisualizadorDigitalizacion = class(TfrmCustomConsulta)
    ShortCutControlChild: TShortCutControl;
    ilByN: TImageList;
    gbFiltros: TJvgGroupBox;
    gbDatosExtra: TJvgGroupBox;
    pnlBottom: TPanel;
    pnlVisualizando: TPanel;
    Panel1: TPanel;
    pnlArea: TPanel;
    sduConsulta: TSDUpdateSQL;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    pmuGrilla: TPopupMenu;
    pmuImpresion: TPopupMenu;
    mnuListado: TMenuItem;
    mnuTodasLasImagenes: TMenuItem;
    mnuSeleccionarTodo: TMenuItem;
    mnuNoSeleccionarNingunaImagen: TMenuItem;
    pnlSeleccionados: TPanel;
    gbTiposDeDocumento: TJvgGroupBox;
    cblDocumento: TARTCheckListBox;
    fraDigitalizacion: TfraDigitalizacion;
    sdqConsultaFILA: TFloatField;
    sdqConsultaCLAVE: TStringField;
    sdqConsultaCHECKBOX: TFloatField;
    sdqConsultaCODIGO_DOCUMENTO: TStringField;
    sdqConsultaDOCUMENTO: TStringField;
    sdqConsultaFECHA: TDateTimeField;
    sdqConsultaTIPO: TStringField;
    sdqConsultaCONTRATO: TFloatField;
    sdqConsultaCUIT: TStringField;
    sdqConsultaCUIL: TStringField;
    sdqConsultaIDEXPEDIENTE: TFloatField;
    sdqConsultaIMAGEN: TStringField;
    sdqConsultaINFO_EXTRA: TStringField;
    sdqConsultaESTABLECIMIENTO: TStringField;
    sdqConsultaCARTA: TFloatField;
    sdqConsultaAREA: TFloatField;
    edFecha: TDateComboBox;
    Panel2: TPanel;
    fraVistaTIFF: TfraVistaTIFF;
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fraDigitalizacionpgArchivosChange(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridCellClick(Column: TColumn);
    procedure mnuSeleccionarTodoClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunaImagenClick(Sender: TObject);
    procedure mnuListadoClick(Sender: TObject);
    procedure mnuTodasLasImagenesClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEnviarMailClick(Sender: TObject);
  private
    SqlBase: string;
    tslContratos, tslCheckeados: TStringList;
    procedure AjusteGrilla;
    procedure OcultarFiltros;
    procedure MostrarFiltros;
    procedure ContarSeleccionadas;
  protected
    procedure RefreshData; override;
  public
    destructor Destroy; override;
    procedure LoadSiniestros(ASiniestro, AOrden, ARecaida: integer; ATabCaption: String = '');
    procedure LoadContrato(AContrato, APageIndex: integer; AutoRefresh: boolean = True);
  end;

var
  frmVisualizadorDigitalizacion: TfrmVisualizadorDigitalizacion;

implementation

uses
  AnsiSql, SQLFuncs, unDmPrincipal, CustomDlgs, unGrids, VCLExtra,
  unSesion, General, unMoldeEnvioMail, unFraCodigoDescripcion, Strfuncs,
  Numeros, unSiniestros, unTercerizadoras;

{$R *.dfm}

procedure TfrmVisualizadorDigitalizacion.LoadSiniestros(ASiniestro, AOrden, ARecaida: integer; ATabCaption: String = '');
var
  i: Integer;
begin
  fraDigitalizacion.edSiniestro.SetValues(ASiniestro, AOrden, ARecaida);
  fraDigitalizacion.edSiniestroINCA.SetValues(ASiniestro, AOrden, ARecaida);  
  OcultarFiltros;

  if ATabCaption = '' then
    fraDigitalizacion.pgArchivos.ActivePage := fraDigitalizacion.tsSiniestros
  else
    for i := fraDigitalizacion.pgArchivos.PageCount - 1 downto 0 do
      if ATabCaption = TTabSheet(fraDigitalizacion.FindComponent(fraDigitalizacion.pgArchivos.Pages[i].Name)).Caption then
        fraDigitalizacion.pgArchivos.ActivePage := TTabSheet(fraDigitalizacion.FindComponent(fraDigitalizacion.pgArchivos.Pages[i].Name));

  fraDigitalizacion.VerificarSiniestro(fraDigitalizacion.edSiniestro, fraDigitalizacion.fraEmpresaSIN, fraDigitalizacion.fraTrabajadorSIN);
  fraDigitalizacion.VerificarSiniestro(fraDigitalizacion.edSiniestroINCA, fraDigitalizacion.fraEmpresaINCA, fraDigitalizacion.fraTrabajadorINCA);

  RefreshData;
  Verificar(not fraDigitalizacion.pgArchivos.ActivePage.TabVisible, Grid, 'Usted no tiene permiso para visualizar los expedientes digitalizados.');
end;

procedure TfrmVisualizadorDigitalizacion.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if DataSet.Active and not DataSet.IsEmpty then
  with fraVistaTIFF do
  try
    Mensaje := '';

    try
      if tslContratos.IndexOf(sdqConsulta.FieldByName('CONTRATO').AsString) > -1 then
      begin
        Mensaje := Format('Su sector, %s, no tiene permiso para consultar los datos referentes a la empresa %s',
                                     [NVL(Sesion.SectorDesc, Sesion.Sector),
                                     ValorSQLEx('SELECT EM_NOMBRE FROM AEM_EMPRESA WHERE EM_CUIT = :CUIT', [sdqConsulta.FieldByName('CUIT').AsString]) ]);
        Clear;
      end else
        Image := DataSet.FieldByName('IMAGEN').AsString;
    except
      InfoHint(imgVista, 'Ocurrió un error al intentar cargar la imagen.');
    end;

    Hint := DataSet.FieldByName('INFO_EXTRA').AsString;

    if not FileExists(DataSet.FieldByName('IMAGEN').AsString) then
      Clear;
  except
    Mensaje := 'Error al leer la imagen.';
  end;
end;

procedure TfrmVisualizadorDigitalizacion.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  AutoColWidths := True;
  pnlBottom.Caption := '';
  MaxRegistros := 1000;
  SqlBase := sdqConsulta.SQL.Text;
  tslCheckeados := TStringList.Create;
  {$IFDEF AFILIACIONES}
  fraVistaTIFF.cmbAjuste.ItemIndex := 0;
  {$ELSE}
  fraVistaTIFF.cmbAjuste.ItemIndex := 2;
  {$ENDIF}

  tslContratos := ValoresSqlEx('SELECT SC_CONTRATO FROM COMUNES.CSC_SECTORCONTRATO WHERE SC_SECTOR = :SECTOR', [Sesion.Sector]);
  fraDigitalizacion.OnChange := tbRefrescarClick;

  fraDigitalizacion.fraTrabajadorSIN.Tercerizadoras := EsUsuarioDeTercerizadora;
  fraDigitalizacion.fraEmpresaSIN.Tercerizadoras    := fraDigitalizacion.fraTrabajadorSIN.Tercerizadoras;

  with GetQueryEx('SELECT DISTINCT UPPER(BA_PERFIL) SOLAPA ' +
                    'FROM BANK.UBA_USUARIOSBANK  ' +
                   'WHERE BA_USUARIO = :USUARIO', [Sesion.UserID]) do
  try
    for i := 0 to fraDigitalizacion.pgArchivos.PageCount - 1 do
      if Locate('SOLAPA', fraDigitalizacion.pgArchivos.Pages[i].Caption, [loCaseInsensitive] ) then
        fraDigitalizacion.pgArchivos.Pages[i].TabVisible := True
      else
        fraDigitalizacion.pgArchivos.Pages[i].TabVisible := False;
  finally
    Free;
  end;

  {$IFDEF AFILIACIONES}
  fraDigitalizacion.pgArchivos.ActivePage := fraDigitalizacion.tsAfiliaciones;
  {$ELSE}
  {$IFDEF COBRANZAS}
  fraDigitalizacion.pgArchivos.ActivePage := fraDigitalizacion.tsCD;
  {$ELSE}
  fraDigitalizacion.pgArchivos.ActivePage := fraDigitalizacion.tsSiniestros;
  {$ENDIF}
  {$ENDIF}

  if not fraDigitalizacion.pgArchivos.ActivePage.TabVisible then
    for i := 0 to fraDigitalizacion.pgArchivos.PageCount - 1 do
      if fraDigitalizacion.pgArchivos.Pages[i].TabVisible then
      begin
        fraDigitalizacion.pgArchivos.ActivePage := fraDigitalizacion.pgArchivos.Pages[i];
        Break;
      end;

  fraDigitalizacionpgArchivosChange(nil);
end;

procedure TfrmVisualizadorDigitalizacion.RefreshData;
var
  sSQL, sFiltros: string;
begin
  pnlVisualizando.Caption := '';
  pnlSeleccionados.Caption := '';
  sSQL := SQLBase;
  tslCheckeados.Clear;

  with fraDigitalizacion do
  begin
    {SINIESTROS}
    if pgArchivos.ActivePage = tsSiniestros then
    begin
      if not edSiniestro.IsEmpty then
        AddCondition(sSQL, 'IDEXPEDIENTE = ' + SQLValue(Get_IdExpediente(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)));

      if not fraRTD_TIPODOCUMENTO_ARCHSIN.IsEmpty then
        AddCondition(sSQL, 'CODIGO_DOCUMENTO = ' + SQLValue(fraRTD_TIPODOCUMENTO_ARCHSIN.Codigo));

      if not fraEmpresaSIN.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaSIN.Contrato));

      if not fraTrabajadorSIN.IsEmpty and (edSiniestro.IsEmpty or fraEmpresaSIN.IsEmpty) then
        AddCondition(sSQL, 'CUIL = ' + SQLValue(fraTrabajadorSIN.CUIL));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);

      if fraTrabajadorSIN.Tercerizadoras then
        AddCondition(sSQL, ' art.siniestro.is_sinitercerizadora(idexpediente, ' + SqlValue(Sesion.UserID) + ') = ''S'' ');

    end;

    {AFILIACIONES}
    if pgArchivos.ActivePage = tsAfiliaciones then
    begin
      if not fraEmpresaAFI.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaAFI.Contrato));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);      
    end;

    {HIGIENE Y SEGURIDAD}    
    if pgArchivos.ActivePage = tsHyS then
    begin
      if not fraEmpresaHYS.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaHYS.Contrato));

      if not fraEstablecimientoHYS.IsEmpty then
        AddCondition(sSQL, 'ESTABLECIMIENTO = ' + SQLValue(fraEstablecimientoHYS.NroEstablecimiento));

      if not fraRTD_TIPODOCUMENTO_HYS.IsEmpty then
        AddCondition(sSQL, 'CODIGO_DOCUMENTO = ' + SQLValue(fraRTD_TIPODOCUMENTO_HYS.Codigo));

      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);
      AddCondition(sSQL, 'CUIL IS ' + SQL_NULL);
      AddCondition(sSQL, 'IDEXPEDIENTE IS ' + SQL_NULL);
    end;

    {MEDICINA LABORAL}
    if pgArchivos.ActivePage = tsMedLab then
    begin
      if not edCarpeta.IsEmpty then
        AddCondition(sSQL, 'CLAVE = ' + SQLString(IntToStr(edCarpeta.Value)));

      if not fraEmpresaLABO.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaLABO.Contrato));

      if not fraTrabajadorLABO.IsEmpty then
        AddCondition(sSQL, 'CUIL = ' + SQLValue(fraTrabajadorLABO.CUIL));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);      
    end;

    {CARTAS DOCUMENTO}
    if pgArchivos.ActivePage = tsCD then
    begin
      if IsNumber(edCarta.Text)  then
        AddCondition(sSQL, 'CARTA = ' + SqlNumber(edCarta.Text));

      if not edSiniestroCARTA.IsEmpty then
        AddCondition(sSQL, 'IDEXPEDIENTE = ' + SQLValue(Get_IdExpediente(edSiniestroCARTA.Siniestro, edSiniestroCARTA.Orden, edSiniestroCARTA.Recaida)));

      if not fraEmpresaCARTA.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaCARTA.Contrato));

      if not fraAreaCARTA.IsEmpty then
        AddCondition(sSQL, 'AREA = ' + SQLInteger(fraAreaCARTA.Codigo));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
    end;

    {CONTRATOS}
    if pgArchivos.ActivePage = tsContratos then
    begin
      if not fraProveedorCONTRATOS.IsEmpty then
        AddCondition(sSQL, 'CLAVE = ' + SQLValue(fraProveedorCONTRATOS.ID));

      if not fraSectorCONTRATOS.IsEmpty then
        AddCondition(sSQL, 'INFO_EXTRA = ' + SQLValue(fraSectorCONTRATOS.Descripcion));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);              
    end;

    {PRESTADORES}    
    if pgArchivos.ActivePage = tsPrestadores then
    begin
      if not fraPrestador.IsEmpty then
        AddCondition(sSQL, 'CLAVE = ' + SQLValue(fraPrestador.IDPrestador));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);
    end;

    {PREVENCION}    
    if pgArchivos.ActivePage = tsPrevencion then
    begin
      if not edSiniestroPREVENCION.IsEmpty then
        AddCondition(sSQL, 'IDEXPEDIENTE = ' + SQLValue(Get_IdExpediente(edSiniestroPREVENCION.Siniestro, edSiniestroPREVENCION.Orden, edSiniestroPREVENCION.Recaida)));

      if not fraRTD_TIPODOCUMENTO_ARCHSIN.IsEmpty then
        AddCondition(sSQL, 'CODIGO_DOCUMENTO = ' + SQLValue(fraRTD_TIPODOCUMENTO_ARCHSIN.Codigo));

      if not fraEmpresaPREVENCION.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaPREVENCION.Contrato));

      if not fraTrabajadorPREVENCION.IsEmpty and (edSiniestroPREVENCION.IsEmpty or fraEmpresaPREVENCION.IsEmpty) then
        AddCondition(sSQL, 'CUIL = ' + SQLValue(fraTrabajadorPREVENCION.CUIL));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);
    end;

    {PRESTACIONES DINERARIAS}    
    if pgArchivos.ActivePage = tsPrestacionesDinerarias then
    begin
      if not edSiniestroPRESDIN.IsEmpty then
        AddCondition(sSQL, 'IDEXPEDIENTE = ' + SQLValue(Get_IdExpediente(edSiniestroPRESDIN.Siniestro, edSiniestroPRESDIN.Orden, edSiniestroPRESDIN.Recaida)));

      if not fraRTD_TIPODOCUMENTO_PRESDIN.IsEmpty then
        AddCondition(sSQL, 'CODIGO_DOCUMENTO = ' + SQLValue(fraRTD_TIPODOCUMENTO_PRESDIN.Codigo));

      if not fraEmpresaPRESDIN.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaPRESDIN.Contrato));

      if not fraTrabajadorPRESDIN.IsEmpty and (edSiniestroPRESDIN.IsEmpty or fraEmpresaPRESDIN.IsEmpty) then
        AddCondition(sSQL, 'CUIL = ' + SQLValue(fraTrabajadorPRESDIN.CUIL));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);        
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);        
    end;

    {INCAPACIDADES}    
    if pgArchivos.ActivePage = tsIncapacidades then
    begin
      if not edSiniestroINCA.IsEmpty then
        AddCondition(sSQL, 'IDEXPEDIENTE = ' + SQLValue(Get_IdExpediente(edSiniestroINCA.Siniestro, edSiniestroINCA.Orden, edSiniestroINCA.Recaida)));

      if not fraRTD_TIPODOCUMENTO_INCA.IsEmpty then
        AddCondition(sSQL, 'CODIGO_DOCUMENTO = ' + SQLValue(fraRTD_TIPODOCUMENTO_INCA.Codigo));

      if not fraEmpresaINCA.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaINCA.Contrato));

      if not fraTrabajadorINCA.IsEmpty and (edSiniestroINCA.IsEmpty or fraEmpresaINCA.IsEmpty) then
        AddCondition(sSQL, 'CUIL = ' + SQLValue(fraTrabajadorINCA.CUIL));

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
      AddCondition(sSQL, 'CARTA IS ' + SQL_NULL);
    end;

    {CARTAS DOCUMENTO de INCAPACIDADES}
    if pgArchivos.ActivePage = tsCDInca then
    begin
      if IsNumber(edCartaINCA.Text)  then
        AddCondition(sSQL, 'CARTA = ' + SqlNumber(edCartaINCA.Text));

      if not edSiniestroCARTAINCA.IsEmpty then
        AddCondition(sSQL, 'IDEXPEDIENTE = ' + SQLValue(Get_IdExpediente(edSiniestroCARTAINCA.Siniestro, edSiniestroCARTAINCA.Orden, edSiniestroCARTAINCA.Recaida)));

      if not fraEmpresaCARTAINCA.IsEmpty then
        AddCondition(sSQL, 'CONTRATO = ' + SQLValue(fraEmpresaCARTAINCA.Contrato));

      if not fraAreaCARTAINCA.IsEmpty then
        AddCondition(sSQL, 'AREA = ' + SQLInteger(fraAreaCARTAINCA.Codigo))
      else
        AddCondition(sSQL, 'AREA = 35 ');

      AddCondition(sSQL, 'ESTABLECIMIENTO IS ' + SQL_NULL);
    end;

    if not edFecha.IsEmpty then
    begin
      AddCondition(sSQL, 'FECHA BETWEEN ' + SqlDate(edFecha.Date - 4) + ' AND ' + SqlDate(edFecha.Date + 4));
      sFiltros := sFiltros + ' Fecha aproximada ' + DateToStr(edFecha.Date);
    end;

    sFiltros := sFiltros + fraDigitalizacion.Clave;
    Verificar(sSQL = SQLBase, pgArchivos, 'Debe seleccionar al menos un filtro.');

    if cblDocumento.CheckCount > 0 then
    begin
      AddCondition(sSQL, ' 1 = 1 ' + cblDocumento.InSQL_StringValues('CODIGO_DOCUMENTO', False));
      sFiltros := sFiltros + ' - Documentos (' + cblDocumento.ItemsChecked.CommaText + ')';
    end;

    pnlVisualizando.Caption := sFiltros;

    if MaxRegistros > 0 then
      AddCondition(sSQL, 'ROWNUM <= ' + IntToStr(MaxRegistros));

    AddCondition(sSQL, 'TIPO = ' + SQLValue(UpperCase(pgArchivos.Pages[pgArchivos.ActivePageIndex].Caption)));
    AddCondition(sSQL, 'BA_USUARIO = ' + SQLValue(Sesion.UserID));
  end;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  if Grid.CanFocus then
    Grid.SetFocus;

  if sdqConsulta.IsEmpty then
    MostrarFiltros;

  fraDigitalizacionpgArchivosChange(nil);    
end;

procedure TfrmVisualizadorDigitalizacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with sdqConsulta do
  begin
    FetchAll;
    Grid.ColumnByField['FILA'].Width := 34;
    Grid.ColumnByField['CHECKBOX'].Width := 24;
    AjusteGrilla;
    pnlBottom.Caption := Format('Se encontraron %d documentos digitalizados', [RecordCount]) + iif(tbMaxRegistros.Down and (RecordCount >= MaxRegistros), ' (Tenga en cuenta que esta búsqueda fue acotada por la cantidad máxima de registros)', '');
  end;
end;

procedure TfrmVisualizadorDigitalizacion.AjusteGrilla;
begin
  Grid.Width := GetColumnWidths(Grid) + 25;
end;

procedure TfrmVisualizadorDigitalizacion.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  fraVistaTIFF.Image := '';
end;

procedure TfrmVisualizadorDigitalizacion.tbLimpiarClick(Sender: TObject);
begin
  edFecha.Clear;
  pnlBottom.Caption := '';
  fraVistaTIFF.Image := '';
  pnlSeleccionados.Caption := '';
  tslCheckeados.Clear;
  VclExtra.LockControl(pnlFiltros, False);
  fraDigitalizacion.Clear;
  cblDocumento.ClearChecks;
  MostrarFiltros;
  inherited;
end;

procedure TfrmVisualizadorDigitalizacion.tbPropiedadesClick(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
begin
  inherited;
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;

  try
    if sdqConsulta.Active and not sdqConsulta.IsEmpty then
      DynColWidthsByData(Grid, 100, True);

    Grid.ColumnByField['FILA'].Width := 34;
    Grid.ColumnByField['CHECKBOX'].Width := 24;
  finally
    sdqConsulta.AfterScroll := AMetodo;
    AjusteGrilla;
  end;
end;

procedure TfrmVisualizadorDigitalizacion.LoadContrato(AContrato, APageIndex: integer; AutoRefresh: boolean = True);
begin
  with fraDigitalizacion do
  begin
    pgArchivos.ActivePageIndex := APageIndex;
    if AContrato > 0 then
    begin
      if pgArchivos.ActivePage = tsSiniestros then
        fraEmpresaSIN.Contrato := AContrato
      else if pgArchivos.ActivePage = tsAfiliaciones then
        fraEmpresaAFI.Contrato := AContrato
      else if pgArchivos.ActivePage = tsHYS then
        fraEmpresaHYS.Contrato := AContrato
      else if pgArchivos.ActivePage = tsMedLab then
        fraEmpresaLABO.Contrato := AContrato
      else if pgArchivos.ActivePage = tsCD then
        fraEmpresaCARTA.Contrato := AContrato
      else if pgArchivos.ActivePage = tsPrestacionesDinerarias then
        fraEmpresaPRESDIN.Contrato := AContrato
      else if pgArchivos.ActivePage = tsIncapacidades then
        fraEmpresaINCA.Contrato := AContrato
      else if pgArchivos.ActivePage = tsCDInca then
        fraEmpresaCARTAINCA.Contrato := AContrato;
    end;

    if AutoRefresh then
    begin
      RefreshData;
      Verificar(not pgArchivos.Pages[APageIndex].TabVisible, Grid, 'Usted no tiene permiso para visualizar esta clase de documentos digitalizados.');
      OcultarFiltros;
    end;
  end;
end;

procedure TfrmVisualizadorDigitalizacion.OcultarFiltros;
begin
  tbMostrarFiltros.Down := True;
  tbMostrarFiltros.Click;
end;

procedure TfrmVisualizadorDigitalizacion.MostrarFiltros;
begin
  tbMostrarFiltros.Down := False;
  tbMostrarFiltros.Click;
end;

procedure TfrmVisualizadorDigitalizacion.fraDigitalizacionpgArchivosChange(Sender: TObject);
const
  SQL_DOCU = 'SELECT TD_DESCRIPCION, TD_CODIGO FROM ARCHIVO.RTD_TIPODOCUMENTO WHERE TD_SECTOR = ''%s'' ORDER BY TD_DESCRIPCION ';
begin
  inherited;
  pnlArea.Caption := fraDigitalizacion.pgArchivos.ActivePage.Caption;
  with fraDigitalizacion do
  begin
    if pgArchivos.ActivePage = tsSiniestros then
      cblDocumento.SQL := Format(SQL_DOCU, ['ARCHSIN'])

    else if pgArchivos.ActivePage = tsAfiliaciones then
      cblDocumento.SQL := Format(SQL_DOCU, ['AFI'])

    else if pgArchivos.ActivePage = tsHYS then
      cblDocumento.SQL := Format(SQL_DOCU, ['HYS'])

    else if pgArchivos.ActivePage = tsMedLab then
      cblDocumento.SQL := Format(SQL_DOCU, ['MEDLAB'])

    else if pgArchivos.ActivePage = tsCD then
      cblDocumento.SQL := Format(SQL_DOCU, ['CD'])

    else if pgArchivos.ActivePage = tsPrestadores then
      cblDocumento.SQL := Format(SQL_DOCU, ['CONTRATA'])

    else if pgArchivos.ActivePage = tsPrevencion then
      cblDocumento.SQL := Format(SQL_DOCU, ['HYS'])

    else if pgArchivos.ActivePage = tsPrestacionesDinerarias then
      cblDocumento.SQL := Format(SQL_DOCU, ['ARCHSIN'])

    else if pgArchivos.ActivePage = tsIncapacidades then
      cblDocumento.SQL := Format(SQL_DOCU, ['ARCHSIN'])

    else if pgArchivos.ActivePage = tsCDInca then
      cblDocumento.SQL := Format(SQL_DOCU, ['CD'])

    else
      cblDocumento.SQL := Format(SQL_DOCU, ['NINGUNO']);

    gbTiposDeDocumento.Visible := cblDocumento.Items.Count > 0;
  end;
end;

procedure TfrmVisualizadorDigitalizacion.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin             
  if Column.FieldName = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if tslCheckeados.IndexOf(sdqConsulta.FieldByName('FILA').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmVisualizadorDigitalizacion.GridCellClick(Column: TColumn);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'CHECKBOX') then
  begin
    if tslCheckeados.IndexOf(sdqConsulta.FieldByName('FILA').AsString) > -1 then
      tslCheckeados.Delete(tslCheckeados.IndexOf(sdqConsulta.FieldByName('FILA').AsString))
    else
      tslCheckeados.Add(sdqConsulta.FieldByName('FILA').AsString);

    ContarSeleccionadas;
  end;
end;

procedure TfrmVisualizadorDigitalizacion.ContarSeleccionadas;
begin
  pnlSeleccionados.Caption := IntToStr(tslCheckeados.Count) + iif(tslCheckeados.Count = 1 , ' imagen seleccionada', ' imágenes seleccionadas');
  Grid.Repaint;
end;

procedure TfrmVisualizadorDigitalizacion.mnuSeleccionarTodoClick(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;
  tslCheckeados.Clear;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      tslCheckeados.Add(sdqConsulta.FieldByName('FILA').AsString);
      Next;
    end;
  finally
    sdqConsulta.AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    ContarSeleccionadas;
  end;
end;

procedure TfrmVisualizadorDigitalizacion.mnuNoSeleccionarNingunaImagenClick(Sender: TObject);
begin
  tslCheckeados.Clear;
  ContarSeleccionadas;
end;

procedure TfrmVisualizadorDigitalizacion.mnuListadoClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmVisualizadorDigitalizacion.mnuTodasLasImagenesClick(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'No seleccionó ninguna imagen para imprimir, utilice la tilde de cada renglón de la grilla.');
  if PrintDialog.Execute then
  begin
    AMetodo := sdqConsulta.AfterScroll;
    sdqConsulta.AfterScroll := nil;
    APointer := sdqConsulta.GetBookmark;

    with sdqConsulta do
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if tslCheckeados.IndexOf(sdqConsulta.FieldByName('FILA').AsString) > -1 then
        begin
          AMetodo(sdqConsulta);
          fraVistaTIFF.ImprimirImagen;
        end;

        Next;
      end;
    finally
      sdqConsulta.AfterScroll := AMetodo;
      GotoBookmark(APointer);
      EnableControls;
    end;
  end;
end;

procedure TfrmVisualizadorDigitalizacion.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['CHECKBOX']);
end;

procedure TfrmVisualizadorDigitalizacion.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if tslCheckeados.IndexOf(sdqConsulta.FieldByName('FILA').AsString) > -1 then
    BackGround := TColor($C0DCC0)//clMoneyGreen
  else
    BackGround := clWhite;
end;

procedure TfrmVisualizadorDigitalizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslCheckeados.Free;
end;

procedure TfrmVisualizadorDigitalizacion.tbEnviarMailClick(Sender: TObject);
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
  vAdjuntos: TArrayOfAttach;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe tildar la imágen o las imágenes que desee enviar por correo.');
  inherited;

  AMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  APointer := sdqConsulta.GetBookmark;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      if tslCheckeados.IndexOf(sdqConsulta.FieldByName('FILA').AsString) > -1 then
      begin
        AMetodo(sdqConsulta);
        SetLength(vAdjuntos, Length(vAdjuntos) + 1);
        vAdjuntos[Length(vAdjuntos) - 1] := GetAttach(sdqConsulta.FieldByName('IMAGEN').AsString, 0);
      end;

      Next;
    end;
  finally
    sdqConsulta.AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
  end;

  EnviarMailBD('', '[Documentación] Envío de imágenes', [oAlwaysShowDialog, oBodyIsRTF, oAutoFirma],
               'Se adjuntan la imágen o las imágenes seleccionadas.', vAdjuntos)
end;

destructor TfrmVisualizadorDigitalizacion.Destroy;
begin
  tslContratos.Free;
  inherited;
end;

initialization
//  RegisterClasses([TfraEstablecimiento]);

end.
