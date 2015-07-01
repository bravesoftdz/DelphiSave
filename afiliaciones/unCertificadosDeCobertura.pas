unit unCertificadosDeCobertura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDbFrame, unFraEmpresa,
  unFraEmpresaAfi, unFraEmpresaSolicitud, Mask, ToolEdit, DateComboBox, Menus, FormPanel, unArtDBAwareFrame, PatternEdit,
  CardinalEdit, Buttons, unFraCodigoDescripcion, unFraUsuario, FolderDialog, unEnvioMail,
  IntEdit;

type
  TfrmCertificadosDeCobertura = class(TfrmCustomConsulta)
    GBFechaImpresion: TGroupBox;
    Label3: TLabel;
    cmbCC_FECHAIMPRESIONHasta: TDateComboBox;
    cmbCC_FECHAIMPRESIONDesde: TDateComboBox;
    Label6: TLabel;
    GBEmpresa: TGroupBox;
    Label1: TLabel;
    fraFO_ID: TfraEmpresaSolicitud;
    GBDeuda: TGroupBox;
    rbSinDeuda: TRadioButton;
    rbConDeuda: TRadioButton;
    GBCertificado: TGroupBox;
    GBUsuarioImpresion: TGroupBox;
    cmbCC_USUIMPRESION: TComboBox;
    rbNomina: TRadioButton;
    rbClausulaComun: TRadioButton;
    rbClausulaEspecial: TRadioButton;
    rbClausulaParticular: TRadioButton;
    mnuImprimir: TPopupMenu;
    mnuReImprimir: TMenuItem;
    mnuGrilla: TMenuItem;
    mnuMail: TMenuItem;
    tbRecuperar: TToolButton;
    rbTodosDeuda: TRadioButton;
    rbTodosClausula: TRadioButton;
    tbContacto: TToolButton;
    Label2: TLabel;
    edCantCertificados: TCardinalEdit;
    tbSalir1: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    GroupBox1: TGroupBox;
    cbSectorImpresion: TComboBox;
    GBFechaReimpresion: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cmbCC_FECHAREIMPRESIONHasta: TDateComboBox;
    cmbCC_FECHAREIMPRESIONDesde: TDateComboBox;
    rgTipoSalida: TRadioGroup;
    rbCoberturaExterior: TRadioButton;
    GroupBox2: TGroupBox;
    checkSoloPendientesAutorizacion: TCheckBox;
    gbFechaSolicitudAutorizacion: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    cmbAD_FECHASOLICITUDHasta: TDateComboBox;
    cmbAD_FECHASOLICITUDDesde: TDateComboBox;
    gbFechaAutorizacion: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    cmbAD_FECHAAUTORIZACIONHasta: TDateComboBox;
    cmbAD_FECHAAUTORIZACIONDesde: TDateComboBox;
    tbSolicitarAutorizacion: TToolButton;
    fpSolicitarAutorizacion: TFormPanel;
    Label11: TLabel;
    fraGestor: TfraUsuarios;
    Bevel1: TBevel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    gbDDJJAdeudadas: TGroupBox;
    chkCC_DDJJADEUDADAS: TCheckBox;
    mnuImprimirTodosSeleccionados: TMenuItem;
    fpSeleccionarCarpeta: TFormPanel;
    Label18: TLabel;
    Bevel6: TBevel;
    edCarpetaDestino: TEdit;
    btnSeleccionarCarpeta: TButton;
    btnAceptar3: TButton;
    mnuGenerarPDF: TMenuItem;
    folderDialog: TFolderDialog;
    tbVerImpresion: TToolButton;
    gbNumeroCertificado: TGroupBox;
    edNumeroCertificado: TIntEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuReImprimirClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRecuperarClick(Sender: TObject);
    procedure mnuMailClick(Sender: TObject);
    procedure tbContactoClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbOrdenarClick(Sender: TObject);
    procedure cbSectorImpresionChange(Sender: TObject);
    procedure CambiaFrameEmpresaSolicitud(Sender: TObject);
    procedure tbSolicitarAutorizacionClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fpSolicitarAutorizacionBeforeShow(Sender: TObject);
    procedure mnuImprimirTodosSeleccionadosClick(Sender: TObject);
    procedure btnAceptar3Click(Sender: TObject);
    procedure mnuGenerarPDFClick(Sender: TObject);
    procedure btnSeleccionarCarpetaClick(Sender: TObject);
    procedure tbVerImpresionClick(Sender: TObject);
  private
    FRutaArchivos: TArrayOfAttach;
    FSectorSeleccionado: Boolean;

    procedure AceptarImpresion(const aPdfFileName: String = '');
    procedure CalcularFilas;
    procedure CargarComboSectores;
    procedure CargarComboUsuarios(const aSector: String);
    procedure DoImprimir(const aIdCertificado, aNroCertificado, aContrato: Integer; aTipoClausula, aTipoVigencia: String;
                         aDeuda, aIntereses, aFirma, aReimpresion, aNotificar: Boolean; aRuta: String; const aTraspaso,
                         aMostrarValidez: Boolean; const aDDJJAdeudadas: String; const aMuestraNotificacion,
                         aMostrarDDJJFaltantes, aImprimir: Boolean);
    procedure GuardarCCO_Reimpresion(aNroCertificado: Integer; const aGeneraPDF: Boolean);
    procedure ImprimirCertificado(aGeneraPDF: Boolean);
  end;

var
  frmCertificadosDeCobertura: TfrmCertificadosDeCobertura;

implementation

{$R *.DFM}

uses
  UnPrincipal, unDmPrincipal, unFiltros, unEmisionCertificados, unRptCertificados, AnsiSql, sqlFuncs, ArchFuncs,
  unContratoContacto, unAfiliaciones, CustomDlgs, unComunes, unCITRIX, unMoldeEnvioMail, unRptRepNom, unArt,
  unSeleccionDestinatarios, unSesion, CUIT, unExportPDF, QuickRpt, General;

procedure TfrmCertificadosDeCobertura.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  edCantCertificados.Value := 0;
  sWhere := '';

  sWhere := sWhere + DoFiltro(gbFechaSolicitudAutorizacion);
  sWhere := sWhere + DoFiltro(gbFechaAutorizacion);

  if not edNumeroCertificado.IsEmpty then
    sWhere := sWhere + ' AND cc_nrocertificado = ' + SqlValue(edNumeroCertificado.Value);

  if chkCC_DDJJADEUDADAS.Checked then
    sWhere := sWhere + ' AND cc_ddjjadeudadas IS NOT NULL';

  if not checkSoloPendientesAutorizacion.Checked then
  begin
    sWhere := sWhere + DoFiltro(GBFechaImpresion);
    sWhere := sWhere + DoFiltro(GBFechaReimpresion);

    if fraFO_ID.IsSelected then
      sWhere := sWhere + ' AND co_contrato = ' + SqlValue(fraFO_ID.Contrato);
    if (cbSectorImpresion.ItemIndex <> -1) then
      sWhere := sWhere + ' AND se_sector = ''' + (cbSectorImpresion.Items.Objects[cbSectorImpresion.ItemIndex] as TCadena).Cadena + '''';
    if (cmbCC_USUIMPRESION.ItemIndex <> -1) then
      sWhere := sWhere + ' AND cc_usuimpresion = ''' + (cmbCC_USUIMPRESION.Items.Objects[cmbCC_USUIMPRESION.ItemIndex] as TCadena).Cadena + '''';
    if rbClausulaComun.Checked then
      sWhere := sWhere + ' AND cc_tipocertificado = ''C'''
    else if rbClausulaEspecial.Checked then
      sWhere := sWhere + ' AND cc_tipocertificado = ''E'''
    else if rbClausulaParticular.Checked then
      sWhere := sWhere + ' AND cc_tipocertificado = ''P'''
    else if rbNomina.Checked then
      sWhere := sWhere + ' AND cc_tipocertificado = ''N'''
    else if rbCoberturaExterior.Checked then
      sWhere := sWhere + ' AND cc_tipocertificado = ''X''';

    if rbConDeuda.Checked then
      sWhere := sWhere + ' AND cc_deuda <> 0'
    else if rbSinDeuda.Checked then
      sWhere := sWhere + ' AND cc_deuda = 0';

    if rgTipoSalida.ItemIndex = 1 then
      sWhere := sWhere + ' AND cc_enviado <> ''F''';
    if rgTipoSalida.ItemIndex = 2 then
      sWhere := sWhere + ' AND cc_impreso <> ''F''';

    sSql :=
      'SELECT co_contrato, em_id, em_cuit, em_nombre, tb_descripcion, fo_formulario, cc_id, cc_idfirma,' +
            ' cc_criteriovencimiento, cc_intereses, cc_nrocertificado, cc_tipocertificado, cc_tiponomina, cc_deuda,' +
            ' cc_fechaimpresion, cc_usuimpresion,' +
            ' DECODE(cc_tipodeuda, ''M'', ''Mostrar'', ''No Mostrar'') cc_tipodeuda,' +
            ' DECODE(cc_notif, ''M'', ''Mostrar'', ''No Mostrar'') cc_notif,' +
            ' DECODE(cc_establecimiento, ''M'', ''Mostrar'', ''No Mostrar'') cc_establecimiento,' +
            ' afiliacion.is_certificadoconnomina(cc_id) nomina, tj_nombre, cx_destino, cx_fechasalida,' +
            ' cx_fecharegreso, cx_mostrarvalidez, cc_ddjjadeudadas, ad_fechaautorizacion, ad_usuarioautorizo,' +
            ' ad_usuariosolicitud, ad_fechasolicitud, ad_gestor, ad_id, ad_idtransaccionweb, cc_ddjjfaltante,' +
            ' art.afiliacion.armar_datos_no_repeticion(cc_id, ''R'') razonsocialtercero,' +
            ' art.afiliacion.armar_datos_no_repeticion(cc_id, ''D'') domiciliotercero,' +
            ' art.afiliacion.get_paises_certificado(cx_id) paises' +
       ' FROM acc_certificadocobertura, aco_contrato, ctb_tablas, use_usuarios, aem_empresa, afo_formulario,' +
            ' acx_certxtrabenviaje, mtv_trabajadorenviaje, ctj_trabajador, art.aad_autorizacertificadodeuda' +
      ' WHERE cc_contrato = co_contrato' +
        ' AND co_idempresa = em_id' +
        ' AND co_idformulario = fo_id' +
        ' AND cc_tipocertificado = tb_codigo' +
        ' AND tb_clave = ''TCERT''' +
        ' AND cc_id = cx_idcertificado(+)' +
        ' AND cx_id = tv_idcertxtrab(+)' +
        ' AND tv_cuil = tj_cuil(+)' +
        ' AND cc_usuimpresion = se_usuario(+)' +
        ' AND cc_idautorizaciondeuda = ad_id(+)' +
              sWhere;
  end
  else
  begin
    sWhere := sWhere + ' AND ad_autorizado IS NULL';

    sWhere := sWhere + DoFiltro(gbFechaSolicitudAutorizacion);

    if fraFO_ID.IsSelected then
      sWhere := sWhere + ' AND ad_contrato = ' + SqlValue(fraFO_ID.Contrato);
    if rbClausulaComun.Checked then
      sWhere := sWhere + ' AND ad_tipocertificado = ''C'''
    else if rbClausulaEspecial.Checked then
      sWhere := sWhere + ' AND ad_tipocertificado = ''E'''
    else if rbClausulaParticular.Checked then
      sWhere := sWhere + ' AND ad_tipocertificado = ''P'''
    else if rbNomina.Checked then
      sWhere := sWhere + ' AND ad_tipocertificado = ''N'''
    else if rbCoberturaExterior.Checked then
      sWhere := sWhere + ' AND ad_tipocertificado = ''X''';

    sSql :=
      'SELECT co_contrato, em_id, em_cuit, em_nombre, tb_descripcion, fo_formulario, ad_fechaautorizacion,' +
            ' ad_usuarioautorizo, ad_usuariosolicitud, ad_fechasolicitud, ad_gestor, ad_id, ad_idtransaccionweb' +
       ' FROM art.aad_autorizacertificadodeuda, aco_contrato, ctb_tablas, aem_empresa, afo_formulario' +
      ' WHERE ad_contrato = co_contrato' +
        ' AND co_idempresa = em_id' +
        ' AND co_idformulario = fo_id' +
        ' AND ad_tipocertificado = tb_codigo' +
        ' AND tb_clave = ''TCERT''' +
              sWhere;
  end;

  OpenQuery(sdqConsulta, sSql, True);
  CheckButtons;

  tbSolicitarAutorizacion.Enabled := checkSoloPendientesAutorizacion.Checked;
end;

procedure TfrmCertificadosDeCobertura.tbLimpiarClick(Sender: TObject);
begin
  sdqConsulta.Close;
  fraFO_ID.Clear;
  cmbCC_FECHAIMPRESIONDesde.Clear;
  cmbCC_FECHAIMPRESIONHasta.Clear;
  cmbCC_FECHAREIMPRESIONDesde.Clear;
  cmbCC_FECHAREIMPRESIONHasta.Clear;
  cmbAD_FECHASOLICITUDDesde.Clear;
  cmbAD_FECHASOLICITUDHasta.Clear;
  cmbAD_FECHAAUTORIZACIONDesde.Clear;
  cmbAD_FECHAAUTORIZACIONHasta.Clear;
  cbSectorImpresion.Text                  := '';
  cbSectorImpresion.ItemIndex             := -1;
  cmbCC_USUIMPRESION.Text                 := '';
  cmbCC_USUIMPRESION.ItemIndex            := -1;
  rgTipoSalida.ItemIndex                  := 0;
  rbTodosClausula.Checked                 := True;
  rbTodosDeuda.Checked                    := True;
  checkSoloPendientesAutorizacion.Checked := False;
  edNumeroCertificado.Clear;
  chkCC_DDJJADEUDADAS.Checked             := False;
  tbSolicitarAutorizacion.Enabled         := False;
end;

procedure TfrmCertificadosDeCobertura.FormCreate(Sender: TObject);
begin
  inherited;

  FSectorSeleccionado := False;

  fraFO_ID.ShowBajas := True;
  fraFO_ID.ContratoActivo := True;
  fraFO_ID.OnChange := CambiaFrameEmpresaSolicitud;

  with fraGestor do
  begin
    TableName        := 'use_usuarios';
    FieldID          := 'se_id';
    FieldCodigo      := 'codigo';
    FieldDesc        := 'descripcion';
    FieldBaja        := 'baja';
    MostrarGenericos := True;
    Sql         :=
      'SELECT codigo, descripcion, ID, baja, se_id, se_fechabaja' +
       ' FROM (SELECT se_usuario codigo, gc_nombre descripcion, se_id ID, se_fechabaja baja, se_id, se_fechabaja' +
               ' FROM agc_gestorcuenta, use_usuarios' +
              ' WHERE LOWER (gc_direlectronica) = LOWER (se_mail)' +
                ' AND gc_estudio = ''N''' +
                ' AND se_sector = ''COB''' +
                ' AND se_fechabaja IS NULL' +
          ' UNION ALL' +
             ' SELECT se_usuario, UPPER (se_nombre), se_id, se_fechabaja, se_id, se_fechabaja' +
               ' FROM use_usuarios' +
              ' WHERE se_usuario IN (''NBOTTEGAL'', ''GMAMBERTO'')) use_usuarios' +
      ' WHERE 1 = 1 ';
  end;

  mnuImprimirTodosSeleccionados.Visible := (Sesion.Sector = 'COMPUTOS');

  tbVerImpresion.Left          := 36;
  tbSolicitarAutorizacion.Left := 36;
  tbRecuperar.Left             := 36;
  tbContacto.Left              := 36;

  CargarComboSectores;
  CargarComboUsuarios('');

  frmPrincipal.mnuCertificadosdeCobertura.Enabled := False;
  cmbCC_FECHAIMPRESIONDesde.Date := DBDate;
end;

procedure TfrmCertificadosDeCobertura.tbNuevoClick(Sender: TObject);
begin
  Verificar(IsAutoAsegurada(fraFO_ID.CUIT), fraFO_ID.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
  
  frmEmisionCertificados.Free; // supongo que si el Show falla es porque el form fue cerrado
  frmEmisionCertificados := TfrmEmisionCertificados.Create(Self);
  frmEmisionCertificados.Contrato := fraFO_ID.edContrato.Value;
end;

procedure TfrmCertificadosDeCobertura.CargarComboSectores;
var
  aId: TCadena;
  sSql: String;
begin
  cbSectorImpresion.Items.Clear;

  sSql :=
    'SELECT   sc_codigo, sc_descripcion' +
       ' FROM usc_sectores' +
      ' WHERE sc_fechabaja IS NULL' +
   ' ORDER BY sc_descripcion';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('sc_codigo').AsString;
      cbSectorImpresion.Items.AddObject(FieldByName('sc_descripcion').AsString, aId);
      Next;
    end;
    cbSectorImpresion.Text := '';
  finally
    Free;
  end;
end;

procedure TfrmCertificadosDeCobertura.CargarComboUsuarios(const aSector: String);
var
  aId: TCadena;
  sSql: String;
begin
  cmbCC_USUIMPRESION.Items.Clear;

  sSql :=
    'SELECT se_usuario, se_nombre' +
     ' FROM use_usuarios' +
    ' WHERE se_fechabaja IS NULL';
  if Trim(aSector) <> '' then
    sSql := sSql + ' AND se_sector = ' + SqlString(aSector, True);
  sSql := sSql + ' ORDER BY se_nombre';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      aId := TCadena.Create();
      aId.Cadena := FieldByName('se_usuario').AsString;
      cmbCC_USUIMPRESION.Items.AddObject(FieldByName('se_nombre').AsString, aId);
      Next;
    end;
    cmbCC_USUIMPRESION.Text := '';
  finally
    Free;
  end;
end;

procedure TfrmCertificadosDeCobertura.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmCertificadosDeCobertura.GuardarCCO_Reimpresion(aNroCertificado: Integer; const aGeneraPDF: Boolean);
begin
  with TSql.Create('acc_certificadocobertura') do
  try
    SqlType := stUpdate;
    PrimaryKey.Add('cc_nrocertificado', aNroCertificado);
    Fields.Add('cc_fechareimpresion',   SQL_ACTUALDATE, False);
    Fields.Add('cc_usureimpresion',     frmPrincipal.DBLogin.UserID);

    if aGeneraPDF then
      Fields.Add('cc_enviado', 'T')
    else
      Fields.Add('cc_impreso', 'T');

    try
      EjecutarSql(Sql);
    except
      MessageDlg('Se produjo un error al actualizar el registro de impresión.', mtWarning, [mbOK], 0);
    end;
  finally
    Free;
  end;
end;

procedure TfrmCertificadosDeCobertura.mnuReImprimirClick(Sender: TObject);
begin
  ImprimirCertificado(False);
end;

procedure TfrmCertificadosDeCobertura.mnuGrillaClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmCertificadosDeCobertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmCertificadosDeCobertura := nil;
  frmPrincipal.mnuCertificadosdeCobertura.Enabled := True;
end;

procedure TfrmCertificadosDeCobertura.tbRecuperarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), Grid, 'Debe elegir el registro que quiere usar como base.');

  frmEmisionCertificados.Free; // supongo que si el Show falla es porque el form fue cerrado
  frmEmisionCertificados := TfrmEmisionCertificados.Create(Self);
  frmEmisionCertificados.CertificadoAnterior := sdqConsulta.FieldByName('cc_id').AsString;
end;

procedure TfrmCertificadosDeCobertura.mnuMailClick(Sender: TObject);
begin
  inherited;
  ImprimirCertificado(True);
end;

procedure TfrmCertificadosDeCobertura.ImprimirCertificado(aGeneraPDF: Boolean);
var
  aOpciones: TOpcionesEnvioMail;
  bDeuda: Boolean;
  bFirma: Boolean;
  bIntereses: Boolean;
  bMostrarValidez: Boolean;
  bMuestraNotificacion: Boolean;
  iContrato: Integer;
  iIdCertificado: Integer;
  iNroCertificado: Integer;
  sBody: String;
  sDDJJAdeudadas: String;
  sDireccionOrigen: String;
  sNombreArchivo: String;
  sNombreArchivoNomina: String;
  sSql: String;
  sTipoClausula: String;
  sTipoNomina: String;
  sTipoVigencia: String;
begin
  iIdCertificado := -1;

  Verificar(IsAutoAsegurada(fraFO_ID.CUIT), fraFO_ID.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar un registro.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar sólo un registro.');

  iContrato       := sdqConsulta.FieldByName('co_contrato').AsInteger;
  iNroCertificado := sdqConsulta.FieldByName('cc_nrocertificado').AsInteger;
  sTipoClausula   := sdqConsulta.FieldByName('cc_tipocertificado').AsString;

  SetLength(FRutaArchivos, 0);

  // Actualiza la Base de datos
  GuardarCCO_Reimpresion(iNroCertificado, aGeneraPDF);
  if sTipoClausula <> 'N' then
  begin
    bDeuda               := (sdqConsulta.FieldByName('cc_tipodeuda').AsString = 'Mostrar');
    bFirma               := (sdqConsulta.FieldByName('cc_idfirma').AsString <> '0');
    bIntereses           := (sdqConsulta.FieldByName('cc_intereses').AsString = 'M');
    bMostrarValidez      := (sdqConsulta.FieldByName('cx_mostrarvalidez').AsString = 'T');
    bMuestraNotificacion := (sdqConsulta.FieldByName('cc_notif').AsString = 'Mostrar');
    sTipoVigencia        := sdqConsulta.FieldByName('cc_criteriovencimiento').AsString;

    //muestra el report
    if aGeneraPDF then
      sNombreArchivo := TempPath;

    DoImprimir(sdqConsulta.FieldByName('cc_id').AsInteger, iNroCertificado, iContrato, sTipoClausula,
               sTipoVigencia, bDeuda, bIntereses, bFirma, True, bMuestraNotificacion, sNombreArchivo, False,
               bMostrarValidez, frmCertificadosDeCobertura.sdqConsulta.FieldByName('cc_ddjjadeudadas').AsString,
               bMuestraNotificacion, (sdqConsulta.FieldByName('cc_ddjjfaltante').AsString = 'T'), False);
  end;

  if sdqConsulta.FieldByName('nomina').AsString = 'SI' then
  begin
    sTipoNomina := sdqConsulta.FieldByName('cc_tiponomina').AsString;
    iIdCertificado := sdqConsulta.FieldByName('cc_id').AsInteger;
    if aGeneraPDF then
    begin
      sNombreArchivoNomina := TempPath + 'NOM' + sdqConsulta.FieldByName('cc_nrocertificado').AsString + '.PDF';

      SetLength(FRutaArchivos, Length(FRutaArchivos) + 1);
      FRutaArchivos[Length(FRutaArchivos) - 1] := GetAttach(sNombreArchivoNomina, 0);
    end;

    Application.CreateForm(TrptRepNom, rptRepNom);
    with rptRepNom do
    try
      PrepararReporte(iContrato, sTipoNomina, iIdCertificado, sNombreArchivoNomina, sTipoVigencia, sTipoClausula);
    finally
      FreeAndNil(rptRepNom);
    end;
  end;

  if not aGeneraPDF then
    Exit;


  sBody := 'Provincia ART';

  if (sTipoClausula = 'E') or (sTipoClausula = 'P') then
  begin
    sSql :=
      'SELECT cc_ddjjadeudadas' +
       ' FROM acc_certificadocobertura' +
      ' WHERE cc_id = :id';
    sDDJJAdeudadas := ValorSqlEx(sSql, [iIdCertificado]);
    if sDDJJAdeudadas <> '' then
      sBody := 'Hemos detectado en nuestros registros algunas declaraciones juradas faltantes correspondientes a los ' +
               'períodos ' + sDDJJAdeudadas + ' y por ese motivo le solicitamos que se contacte por e-mail a la ' +
               'siguiente dirección: emision@provart.com.ar.' + #13#13#13#10 + sBody;
  end;

  if Sesion.Sector = 'AFI' then
  begin
    aOpciones := [oAlwaysShowDialog, oAutoFirma, oDeleteAttach, oSinNotaAlPie];
    sDireccionOrigen := 'certificados@provart.com.ar';
  end
  else
  begin
    aOpciones := [oAlwaysShowDialog, oAutoFirma, oDeleteAttach];
    sDireccionOrigen := '';
  end;

  unMoldeEnvioMail.EnviarMailBD('', Format('Certificado de Cobertura - Contrato Nº %d', [iContrato]), aOpciones, sBody,
                                FRutaArchivos, iContrato, tcCertificadosART, True, True, 2500, -1,
                                [tdContactoContrato], 'certificados@provart.com.ar', False, sDireccionOrigen);
end;

procedure TfrmCertificadosDeCobertura.tbContactoClick(Sender: TObject);
var
  iContrato: Integer;
  iEmpresa: Integer;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), Grid, 'Debe elegir un registro.');

  iContrato := sdqConsulta.FieldByName('co_contrato').AsInteger;
  iEmpresa  := sdqConsulta.FieldByName('em_id').AsInteger;

  with TfrmContratoContacto.Create(Self) do
  try
    DoCargarDatos(iContrato, iEmpresa);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCertificadosDeCobertura.CalcularFilas;
begin
  edCantCertificados.Value := Grid.SelectedRows.Count;
end;

procedure TfrmCertificadosDeCobertura.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmCertificadosDeCobertura.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmCertificadosDeCobertura.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  edCantCertificados.Value := 0;
end;

procedure TfrmCertificadosDeCobertura.cbSectorImpresionChange(Sender: TObject);
begin
  if (not FSectorSeleccionado) and (cbSectorImpresion.ItemIndex = -1) then    // Para que no haga querys de mas..
    Exit;

  FSectorSeleccionado := (cbSectorImpresion.ItemIndex > -1);
  
  if FSectorSeleccionado then
    CargarComboUsuarios((cbSectorImpresion.Items.Objects[cbSectorImpresion.ItemIndex] as TCadena).Cadena)
  else
    CargarComboUsuarios('');
end;

procedure TfrmCertificadosDeCobertura.CambiaFrameEmpresaSolicitud(Sender: TObject);
begin
  if IsAutoAsegurada(fraFO_ID.CUIT) then
    InfoHint(fraFO_ID.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
end;

procedure TfrmCertificadosDeCobertura.tbSolicitarAutorizacionClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'Debe seleccionar un registro.');
  Verificar((Grid.SelectedRows.Count > 1), Grid, 'Debe seleccionar sólo un registro.');

  if fpSolicitarAutorizacion.ShowModal = mrOk then
  begin
    BeginTrans;
    try
      sSql :=
        'UPDATE aad_autorizacertificadodeuda' +
          ' SET ad_gestor = :gestor' +
        ' WHERE ad_id = :id';
      EjecutarSqlSTEx(sSql, [fraGestor.Codigo, sdqConsulta.FieldByName('ad_id').AsInteger]);

      sSql :=
        'SELECT 1' +
         ' FROM web.wdt_destinotransaccion' +
        ' WHERE dt_idtransaccionweb = :idtransaccionweb' +
          ' AND dt_idusuario = :idusuario';
      if not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('ad_idtransaccionweb').AsInteger, fraGestor.Value]) then
      begin
        sSql :=
          'INSERT INTO web.wdt_destinotransaccion' +
                     ' (dt_idtransaccionweb, dt_idusuario)' +
              ' VALUES (:idtransaccionweb, :idusuario)';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ad_idtransaccionweb').AsInteger, fraGestor.Value]);
      end;

      sSql :=
        'UPDATE web.wtw_transaccionweb' +
          ' SET tw_fechaenviomail = SYSDATE' +
        ' WHERE tw_id = :id';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('ad_idtransaccionweb').AsInteger]);

      CommitTrans;

      MsgBox('El pedido ha sido reenviado correctamente.');
    except
      on E: Exception do
      begin
        Rollback;
        MsgBox('Ha ocurrido el siguiente error: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmCertificadosDeCobertura.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraGestor.IsEmpty, fraGestor.edCodigo, 'El campo Gestor es obligatorio.');
  fpSolicitarAutorizacion.ModalResult := mrOk;
end;

procedure TfrmCertificadosDeCobertura.btnCancelarClick(Sender: TObject);
begin
  fpSolicitarAutorizacion.ModalResult := mrCancel;
end;

procedure TfrmCertificadosDeCobertura.fpSolicitarAutorizacionBeforeShow(Sender: TObject);
begin
  fraGestor.Clear;
end;

procedure TfrmCertificadosDeCobertura.mnuImprimirTodosSeleccionadosClick(Sender: TObject);
var
  bDeuda: Boolean;
  bFirma: Boolean;
  bIntereses: Boolean;
  bMostrarValidez: Boolean;
  bMuestraNotificacion: Boolean;
  iContrato: Integer;
  iIdCertificado: Integer;
  iLoop: Integer;
  iNroCertificado: Integer;
  sNombreArchivo: String;
  sNombreArchivoNomina: String;
  sTipoClausula: String;
  sTipoNomina: String;
  sTipoVigencia: String;
begin
  Verificar(IsAutoAsegurada(fraFO_ID.CUIT), fraFO_ID.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro.');

  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

    iContrato       := sdqConsulta.FieldByName('co_contrato').AsInteger;
    iNroCertificado := sdqConsulta.FieldByName('cc_nrocertificado').AsInteger;
    sTipoClausula   := sdqConsulta.FieldByName('cc_tipocertificado').AsString;

    // Actualiza la Base de datos
    GuardarCCO_Reimpresion(iNroCertificado, False);
    if sTipoClausula <> 'N' then
    begin
      bDeuda               := (sdqConsulta.FieldByName('cc_tipodeuda').AsString = 'Mostrar');
      bFirma               := (sdqConsulta.FieldByName('cc_idfirma').AsString <> '0');
      bIntereses           := (sdqConsulta.FieldByName('cc_intereses').AsString = 'M');
      bMostrarValidez      := (sdqConsulta.FieldByName('cx_mostrarvalidez').AsString = 'T');
      bMuestraNotificacion := (sdqConsulta.FieldByName('cc_notif').AsString = 'Mostrar');
      sTipoVigencia        := sdqConsulta.FieldByName('cc_criteriovencimiento').AsString;

      DoImprimir(sdqConsulta.FieldByName('cc_id').AsInteger, iNroCertificado, iContrato, sTipoClausula, sTipoVigencia,
                 bDeuda, bIntereses, bFirma, True, bMuestraNotificacion, sNombreArchivo, False, bMostrarValidez,
                 frmCertificadosDeCobertura.sdqConsulta.FieldByName('cc_ddjjadeudadas').AsString, bMuestraNotificacion,
                 (sdqConsulta.FieldByName('cc_ddjjfaltante').AsString = 'T'), True);
    end;

    if sdqConsulta.FieldByName('nomina').AsString = 'SI' then
    begin
      iIdCertificado := sdqConsulta.FieldByName('cc_id').AsInteger;
      sTipoNomina    := sdqConsulta.FieldByName('cc_tiponomina').AsString;

      Application.CreateForm(TrptRepNom, rptRepNom);
      with rptRepNom do
      try
        PrepararReporte(iContrato, sTipoNomina, iIdCertificado, sNombreArchivoNomina, sTipoVigencia, sTipoClausula, True);
      finally
        FreeAndNil(rptRepNom);
      end;
    end;
  end;
end;

procedure TfrmCertificadosDeCobertura.btnAceptar3Click(Sender: TObject);
begin
  fpSeleccionarCarpeta.ModalResult := mrOk;
end;

procedure TfrmCertificadosDeCobertura.mnuGenerarPDFClick(Sender: TObject);
begin
  Verificar((Grid.SelectedRows.Count = 0), tbImprimir, 'Debe seleccionar al menos una fila de la grilla.');

  if fpSeleccionarCarpeta.ShowModal = mrOk then
    AceptarImpresion(edCarpetaDestino.Text);
end;

procedure TfrmCertificadosDeCobertura.AceptarImpresion(const aPdfFileName: String = '');
var
  aNombreArchivo: String;
  bDeuda: Boolean;
  bFirma: Boolean;
  bIntereses: Boolean;
  bMostrarValidez: Boolean;
  bMuestraNotificacion: Boolean;
  iContrato: Integer;
  iIdCertificado: Integer;
  iLoop: Integer;
  iNroCertificado: Integer;
  sNombreArchivoNomina: String;
  sTipoClausula: String;
  sTipoNomina: String;
  sTipoVigencia: String;
begin
  Verificar(IsAutoAsegurada(fraFO_ID.CUIT), fraFO_ID.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro.');

  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

    iContrato       := sdqConsulta.FieldByName('co_contrato').AsInteger;
    iNroCertificado := sdqConsulta.FieldByName('cc_nrocertificado').AsInteger;
    sTipoClausula   := sdqConsulta.FieldByName('cc_tipocertificado').AsString;

    // Actualiza la Base de datos
    GuardarCCO_Reimpresion(iNroCertificado, False);
    if sTipoClausula <> 'N' then
    begin
      bDeuda               := (sdqConsulta.FieldByName('cc_tipodeuda').AsString = 'Mostrar');
      bFirma               := (sdqConsulta.FieldByName('cc_idfirma').AsString <> '0');
      bIntereses           := (sdqConsulta.FieldByName('cc_intereses').AsString = 'M');
      bMostrarValidez      := (sdqConsulta.FieldByName('cx_mostrarvalidez').AsString = 'T');
      bMuestraNotificacion := (sdqConsulta.FieldByName('cc_notif').AsString = 'Mostrar');
      sTipoVigencia        := sdqConsulta.FieldByName('cc_criteriovencimiento').AsString;

      if aPdfFileName <> '' then
        aNombreArchivo := aPdfFileName + '\';

      DoImprimir(sdqConsulta.FieldByName('cc_id').AsInteger, iNroCertificado, iContrato, sTipoClausula, sTipoVigencia,
                 bDeuda, bIntereses, bFirma, True, bMuestraNotificacion, aNombreArchivo, False, bMostrarValidez,
                 frmCertificadosDeCobertura.sdqConsulta.FieldByName('cc_ddjjadeudadas').AsString, bMuestraNotificacion,
                 (sdqConsulta.FieldByName('cc_ddjjfaltante').AsString = 'T'), False);
    end;

    if sdqConsulta.FieldByName('nomina').AsString = 'SI' then
    begin
      iIdCertificado := sdqConsulta.FieldByName('cc_id').AsInteger;
      sTipoNomina    := sdqConsulta.FieldByName('cc_tiponomina').AsString;

      Application.CreateForm(TrptRepNom, rptRepNom);
      with rptRepNom do
      try
        with frmCertificadosDeCobertura.sdqConsulta do
          sNombreArchivoNomina := Format('%snomina_%s-%s-%s', [IncludeTrailingBackslash(aPdfFileName),
                                                               FieldByName('cc_nrocertificado').AsString,
                                                               SacarGuiones(FieldByName('em_cuit').AsString),
                                                               FieldByName('co_contrato').AsString]);
        PrepararReporte(iContrato, sTipoNomina, iIdCertificado, sNombreArchivoNomina, sTipoVigencia, sTipoClausula);
      finally
        FreeAndNil(rptRepNom);
      end;
    end;
  end;
end;

procedure TfrmCertificadosDeCobertura.btnSeleccionarCarpetaClick(Sender: TObject);
begin
  if folderDialog.Execute then
    edCarpetaDestino.Text := folderDialog.Directory;
end;

procedure TfrmCertificadosDeCobertura.DoImprimir(const aIdCertificado, aNroCertificado, aContrato: Integer;
                                                 aTipoClausula, aTipoVigencia: String; aDeuda, aIntereses, aFirma,
                                                 aReimpresion, aNotificar: Boolean; aRuta: String; const aTraspaso,
                                                 aMostrarValidez: Boolean; const aDDJJAdeudadas: String;
                                                 const aMuestraNotificacion, aMostrarDDJJFaltantes, aImprimir: Boolean);
var
  iLoop: Integer;
  sNombreArchivo: String;
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM afi.adr_datosnorepeticion' +
    ' WHERE dr_idcertificado = :id' +
      ' AND dr_fechabaja IS NULL';
  with GetQueryEx(sSql, [aIdCertificado]) do
  try
    if not IsEmpty then
    begin
      SetLength(FRutaArchivos, RecordCount);

      iLoop := 1;
      while not Eof do
      begin
        Application.CreateForm(TrptCertificados, rptCertificados);
        with rptCertificados do
        try
          if aRuta <> '' then
            sNombreArchivo := aRuta + 'CERT_' + IntToStr(aNroCertificado) + '_' + IntToStr(iLoop) + '.pdf';

          CalleTercero        := FieldByName('dr_calle').AsString;
          CodigoPostalTercero := FieldByName('dr_codigopostal').AsString;
          DepartamentoTercero := FieldByName('dr_departamento').AsString;
          LocalidadTercero    := FieldByName('dr_localidad').AsString;
          NumeroTercero       := FieldByName('dr_numero').AsString;
          PisoTercero         := FieldByName('dr_piso').AsString;
          ProvinciaTercero    := FieldByName('dr_provincia').AsString;
          RazonTercero        := FieldByName('dr_razonsocial').AsString;

          PrepararReporte(aNroCertificado, aContrato, aTipoClausula, aTipoVigencia, aDeuda, aIntereses, aFirma, True,
                          aMuestraNotificacion, sNombreArchivo, False, aMostrarValidez, aDDJJAdeudadas,
                          aMostrarDDJJFaltantes, aImprimir);
        finally
          Free;
        end;

        FRutaArchivos[iLoop - 1] := GetAttach(sNombreArchivo, 0);

        Inc(iLoop);
        Next;
      end;
    end
    else
    begin
      Application.CreateForm(TrptCertificados, rptCertificados);
      with rptCertificados do
      try
        if aRuta <> '' then
          sNombreArchivo := aRuta + 'CERT_' + IntToStr(aNroCertificado) + '.pdf';

        SetLength(FRutaArchivos, 1);
        FRutaArchivos[Length(FRutaArchivos) - 1] := GetAttach(sNombreArchivo, 0);

        PrepararReporte(aNroCertificado, aContrato, aTipoClausula, aTipoVigencia, aDeuda, aIntereses, aFirma, True,
                        aMuestraNotificacion, sNombreArchivo, False, aMostrarValidez, aDDJJAdeudadas,
                        aMostrarDDJJFaltantes, aImprimir);
      finally
        Free;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmCertificadosDeCobertura.tbVerImpresionClick(Sender: TObject);
var
  bDeuda: Boolean;
  bFirma: Boolean;
  bIntereses: Boolean;
  bMostrarValidez: Boolean;
  bMuestraNotificacion: Boolean;
  iContrato: Integer;
  iIdCertificado: Integer;
  iNroCertificado: Integer;
  sTipoClausula: String;
  sTipoNomina: String;
  sTipoVigencia: String;
begin
  Verificar(IsAutoAsegurada(fraFO_ID.CUIT), fraFO_ID.edContrato, 'No se Emite Certificado.' + CRLF + 'Contrato Autoasegurado.');
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar un registro.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar sólo un registro.');

  iContrato       := sdqConsulta.FieldByName('co_contrato').AsInteger;
  iNroCertificado := sdqConsulta.FieldByName('cc_nrocertificado').AsInteger;
  sTipoClausula   := sdqConsulta.FieldByName('cc_tipocertificado').AsString;

  SetLength(FRutaArchivos, 0);

  if sTipoClausula <> 'N' then
  begin
    bDeuda               := (sdqConsulta.FieldByName('cc_tipodeuda').AsString = 'Mostrar');
    bFirma               := (sdqConsulta.FieldByName('cc_idfirma').AsString <> '0');
    bIntereses           := (sdqConsulta.FieldByName('cc_intereses').AsString = 'M');
    bMostrarValidez      := (sdqConsulta.FieldByName('cx_mostrarvalidez').AsString = 'T');
    bMuestraNotificacion := (sdqConsulta.FieldByName('cc_notif').AsString = 'Mostrar');
    sTipoVigencia        := sdqConsulta.FieldByName('cc_criteriovencimiento').AsString;

    DoImprimir(sdqConsulta.FieldByName('cc_id').AsInteger, iNroCertificado, iContrato, sTipoClausula,
               sTipoVigencia, bDeuda, bIntereses, bFirma, True, bMuestraNotificacion, '', False,
               bMostrarValidez, frmCertificadosDeCobertura.sdqConsulta.FieldByName('cc_ddjjadeudadas').AsString,
               bMuestraNotificacion, (sdqConsulta.FieldByName('cc_ddjjfaltante').AsString = 'T'), False);
  end;

  if sdqConsulta.FieldByName('nomina').AsString = 'SI' then
  begin
    iIdCertificado := sdqConsulta.FieldByName('cc_id').AsInteger;
    sTipoNomina    := sdqConsulta.FieldByName('cc_tiponomina').AsString;

    Application.CreateForm(TrptRepNom, rptRepNom);
    with rptRepNom do
    try
      PrepararReporte(iContrato, sTipoNomina, iIdCertificado, '', sTipoVigencia, sTipoClausula);
    finally
      FreeAndNil(rptRepNom);
    end;
  end;
end;

end.
