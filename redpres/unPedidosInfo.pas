unit unPedidosInfo;

interface                                                         

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
  RXDBCtrl, StdCtrls, ExtCtrls, Mask, ToolEdit, DateComboBox, unfraPrestador, Registros, Db, SDEngine, General, Buttons,
  artSeguridad, Placemnt, CUIT, Menus, IntEdit, SortDlg, CheckPanel, ArtComboBox, unFraEmpresa, unAutAprob, unArtFrame,
  unArtDbFrame, PatternEdit, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraGrupoTrabajo, QueryToFile, ExportDialog, ShortCutControl,
  unFraUsuario, ComboEditor, CheckCombo, DBCheckCombo, unfraSectores;

type
  TfrmPedidosInfo = class(TForm)
    dbgListado: TRxDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    pnlFiltros: TPanel;
    pnlSiniestro: TPanel;
    chkSiniestro: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    Sep1: TToolButton;
    tbRecepcion: TToolButton;
    tbImprimir: TToolButton;
    Sep3: TToolButton;
    tbSalir: TToolButton;
    Sep2: TToolButton;
    tbOcultarMostrar: TToolButton;
    pnlFecha: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    chkFecha: TCheckBox;
    deFechaDesde: TDateComboBox;
    deFechaHasta: TDateComboBox;
    chkPrestador: TCheckBox;
    fraPrestador: TfraPrestador;
    pnlPrestador: TPanel;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    tbFiltros: TToolButton;
    pmnuFiltros: TPopupMenu;
    mnuFiltroPenRec: TMenuItem;
    mnuFiltroPenImpre: TMenuItem;
    mnuFiltroTodos: TMenuItem;
    edSiniDesde: TIntEdit;
    edSiniHasta: TIntEdit;
    tbOrden: TToolButton;
    ToolButton2: TToolButton;
    SortDialog: TSortDialog;
    pmnuImprimir: TPopupMenu;
    mnuImpPendientes: TMenuItem;
    mnuImpTodos: TMenuItem;
    pnlTipoDocumento: TCheckPanel;
    cmbTipoDocumento: TArtComboBox;
    sdqTipoDocumento: TSDQuery;
    dsTipoDocumento: TDataSource;
    pnlGTrabajo: TCheckPanel;
    pnlDelegacion: TCheckPanel;
    cmbDelegacion: TArtComboBox;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    pnlEmpresa: TPanel;
    chkEmpresa: TCheckBox;
    fraEmpresa: TfraEmpresa;
    ToolButton1: TToolButton;
    lblCantidad: TLabel;
    sdqDatosPI_DESTINATARIO: TStringField;
    sdqDatosPI_TIPO: TStringField;
    sdqDatosPI_SINIESTRO: TFloatField;
    sdqDatosPI_ORDEN: TFloatField;
    sdqDatosPI_RECAIDA: TFloatField;
    sdqDatosPI_NUMERO: TFloatField;
    sdqDatosPI_MODULO: TStringField;
    sdqDatosPI_FECHAALTA: TDateTimeField;
    sdqDatosPI_FECHAIMPRESION: TDateTimeField;
    sdqDatosPI_FECHARECEPCION: TDateTimeField;
    sdqDatosPI_CODDOCUMENTO: TStringField;
    sdqDatosPI_DOCUMENTO: TStringField;
    sdqDatosPI_OBSERVACIONES: TStringField;
    sdqDatosCA_IDENTIFICADOR: TFloatField;
    sdqDatosCA_DESCRIPCION: TStringField;
    sdqDatosCA_CODPOSTAL: TStringField;
    sdqDatosCA_LOCALIDAD: TStringField;
    sdqDatosCA_DOMICILIO: TStringField;
    sdqDatosEX_CUIL: TStringField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosTJ_NOMBRE: TStringField;
    sdqDatosSINIESTRO: TStringField;
    sdqDatosCA_TELEFONO: TStringField;
    sdqDatosCA_FAX: TStringField;
    sdqDatosMP_NOMBRE: TStringField;
    sdqDatosPROVPREST: TStringField;
    sdqDatosPROVEMP: TStringField;
    sdqDatosFECHAS: TDateTimeField;
    sdqDatosGP_NOMBRE: TStringField;
    sdqDatosLG_NOMBRE: TStringField;
    edDelegacion: TEdit;
    edTipoDocumento: TEdit;
    sdqDatosMP_CONTRATO: TFloatField;
    sdqDatosPI_USUALTA: TStringField;
    sdqDatosSE_NOMBRE: TStringField;
    sdqDatosPI_PRESTID: TFloatField;
    sdqDatosPI_FECHADESDE: TStringField;
    sdqDatosPI_FECHAHASTA: TStringField;
    sdqDatosMP_CALLE_POST: TStringField;
    sdqDatosMP_NUMERO_POST: TStringField;
    sdqDatosMP_PISO_POST: TStringField;
    sdqDatosMP_DEPARTAMENTO_POST: TStringField;
    sdqDatosMP_LOCALIDAD_POST: TStringField;
    sdqDatosMP_CPOSTAL_POST: TStringField;
    sdqDatosMP_TELEFONOS_POST: TStringField;
    sdqDatosMP_FAX_POST: TStringField;
    sdqDatosUSUGESTOR: TStringField;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    ExportDialog: TExportDialog;
    tbExportar: TToolButton;
    ShortCutControl1: TShortCutControl;
    pnlUsuarios: TCheckPanel;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    cmbUsuarios: TDBCheckCombo;
    pnlSector: TCheckPanel;
    fraSectores: TfraSectores;
    sdqDatosSC_DESCRIPCION: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnChange(Sender: TObject);
    procedure chkPrestadorClick(Sender: TObject);
    procedure chkSiniestroClick(Sender: TObject);
    procedure chkFechaClick(Sender: TObject);
    procedure tbOcultarMostrarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbRecepcionClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure mnuFiltrosClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure mnuImpPendientesClick(Sender: TObject);
    procedure mnuImpTodosClick(Sender: TObject);
    procedure chkEmpresaClick(Sender: TObject);
    procedure pnlTipoDocumentoChange(Sender: TObject);
    procedure pnlDelegacionChange(Sender: TObject);
    procedure pnlGTrabajoChange(Sender: TObject);
    procedure edDelegacionKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDelegacionCloseUp(Sender: TObject);
    procedure cmbDelegacionChange(Sender: TObject);
    procedure edTipoDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoDocumentoCloseUp(Sender: TObject);
    procedure cmbTipoDocumentoChange(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure pnlUsuariosChange(Sender: TObject);
    procedure pnlSectorChange(Sender: TObject);
    procedure fraSectoresExit(Sender: TObject);
  private
    procedure Imprimir(Tipo: String);
    Procedure SetEstado(sEstado: Char);
    procedure VerificarEstado;
    procedure CambioSector(Sender: TObject);
  public
  end;

var
  frmPedidosInfo: TfrmPedidosInfo;
  SqlRefresh: String;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, StrFuncs, rxRichEd, unRptPedInfo, UnFirmantes, unSesion, AnsiSql,
  unComunes;

{$R *.DFM}

procedure TfrmPedidosInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuPedInfo.Enabled := True;
  Action := caFree;
end;

procedure TfrmPedidosInfo.FormCreate(Sender: TObject);
begin
  if not CheckView('MPI_PEDIDOINFO') then
  begin
    MsgBox('ERROR - La vista MPI_PEDIDOINFO se encuentra deshabilitada.', MB_ICONERROR);
    Close;
  end;

  fraPrestador.OnChange := OnChange;
  deFechaDesde.MaxDate  := StrToDate(ValorSql('SELECT ACTUALDATE FROM DUAL'));

  if tbRecepcion.Enabled then
    tbRecepcion.Tag := 1;

  sdqTipoDocumento.Open;
  sdqDelegacion.Open;
  sdqUsuarios.Open;
  fraSectores.OnChange := CambioSector;
end;

procedure TfrmPedidosInfo.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key = 116) and (tbRefrescar.Enabled) then
    tbRefrescarClick(nil);

  if (ssCtrl in Shift) then
    case key of
      83: if tbSalir.Enabled then
            tbSalirClick(nil);
      76: if tbLimpiar.Enabled then
            tbLimpiarClick(nil);
      73: if tbImprimir.Enabled then
            tbImprimirClick(nil);
      82: if tbRecepcion.Enabled then
            tbRecepcionClick(nil);
      70: if tbFiltros.Enabled then
            tbFiltros.DropdownMenu.Popup(Mouse.CursorPos.x, Mouse.CursorPos.Y)
    end;
end;

procedure TfrmPedidosInfo.OnChange(Sender: TObject);
begin
  chkPrestador.Checked := True;
end;

procedure TfrmPedidosInfo.chkSiniestroClick(Sender: TObject);
begin
  if chkSiniestro.Checked then
  begin
    pnlSiniestro.Enabled := True;
    edSiniDesde.SetFocus;
  end
  else
  begin
    pnlSiniestro.Enabled := False;
    edSiniDesde.Text := '';
    edSiniHasta.Text := '';
  end;
end;

procedure TfrmPedidosInfo.chkFechaClick(Sender: TObject);
begin
  if chkFecha.Checked then
  begin
    pnlFecha.Enabled := True;
    deFechaDesde.SetFocus;
  end
  else
  begin
    pnlFecha.Enabled := False;
    deFechaDesde.Date := 0;
    deFechaHasta.Date := 0;
  end;
end;

procedure TfrmPedidosInfo.chkPrestadorClick(Sender: TObject);
begin
  if chkPrestador.Checked and chkEmpresa.Checked then
  begin
    MsgBox('No se puede seleccionar Prestador y Empresa a la vez', MB_ICONEXCLAMATION);
    chkPrestador.Checked := False;
    pnlPrestador.Enabled := False;
    fraPrestador.Limpiar;
  end
  else
  begin
    if chkPrestador.Checked then
    begin
      pnlPrestador.Enabled := True;
      fraPrestador.IDPrestadorFocus;
    end
    else
    begin
      pnlPrestador.Enabled := False;
      fraPrestador.Limpiar;
    end;
  end;
end;

procedure TfrmPedidosInfo.chkEmpresaClick(Sender: TObject);
begin
  if chkEmpresa.Checked and chkPrestador.Checked then
  begin
    MsgBox('No se puede seleccionar Empresa y Prestador a la vez',MB_ICONEXCLAMATION);
    chkEmpresa.Checked := False;
    pnlEmpresa.Enabled := False;
    fraEmpresa.Clear;
  end
  else
  begin
    if chkEmpresa.Checked then
    begin
      pnlEmpresa.Enabled := True;
      fraEmpresa.edContrato.SetFocus;
    end
    else
    begin
      pnlEmpresa.Enabled := False;
      fraEmpresa.Clear;
    end;
  end;
end;

procedure TfrmPedidosInfo.tbOcultarMostrarClick(Sender: TObject);
begin
  if tbOcultarMostrar.Down then
  begin
    pnlFiltros.Visible    := False;
    tbOcultarMostrar.Hint := 'Mostrar Filtros';
    tbOcultarMostrar.ImageIndex := 18;
  end
  else
  begin
    pnlFiltros.Visible    := True;
    tbOcultarMostrar.Hint := 'Ocultar Filtros';
    tbOcultarMostrar.ImageIndex := 17;
  end;
end;

procedure TfrmPedidosInfo.tbRefrescarClick(Sender: TObject);
begin
  Cursor := crSQLWait;
  SqlRefresh :=
    'SELECT to_char(pi_fechadesde, ''mm/yyyy'') pi_fechadesde, to_char(pi_fechahasta,''mm/yyyy'') pi_fechahasta,' +
          ' pi_destinatario, pi_tipo, pi_siniestro, pi_orden, pi_recaida, pi_numero, pi_modulo, pi_prestid,' +
          ' pi_fechaalta, pi_fechaimpresion, pi_fecharecepcion, pi_coddocumento, pi_documento, pi_observaciones,' +
          ' ca_identificador, ca_descripcion, ca_codpostal, ca_localidad, ca_domicilio, ex_cuil, ex_fechaaccidente,' +
          ' ex_siniestro || ''-'' || ex_orden || ''-'' || ex_recaida siniestro, ca_codarea || ca_telefono ca_telefono, ca_fax,' +
          ' ca_fax, prest.pv_descripcion provprest, getdescripcionprovincia(mp_provincia_post) provemp, pi_usualta, se_nombre, sc_descripcion,' +
          ' mp_nombre, mp_contrato, mp_calle_post, mp_numero_post, mp_piso_post, mp_departamento_post,' +
          ' mp_localidad_post, mp_cpostal_post, mp_telefonos_post, mp_fax_post,' +
          ' nvl(ex_fechaaccidente, ex_fecharecaida) fechas, gp_nombre, lg_nombre, tj_nombre, ' +
          ' iif_char(pi_modulo, ''E'', ''Evolutivo'', iif_char(pi_modulo, ''L'', ''Liquidaciones'',' +
          ' iif_char(pi_modulo, ''A'', ''Autorizaciones'', ''Siniestros''))) Modulo, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
     ' FROM mpi_pedidoinfo, cpr_prestador, sex_expedientes, ctj_trabajadores, cpv_provincias prest, cmp_empresas,' +
          ' mgp_gtrabajo, dlg_delegaciones, use_usuarios, usc_sectores' +
    ' WHERE pi_prestid = ca_identificador(+)' +
      ' AND pi_siniestro = ex_siniestro' +
      ' AND pi_orden = ex_orden' +
      ' AND pi_recaida = ex_recaida' +
      ' AND ex_cuil = tj_cuil' +
      ' AND ca_provincia = prest.pv_codigo(+)' +
      ' AND gp_codigo = ex_gtrabajo' +
      ' AND ex_delegacion = lg_codigo' +
      ' AND ex_cuit = mp_cuit' +
      ' AND se_usuario(+) = pi_usualta' +
      ' AND se_sector = sc_codigo ' + // Lu wf 7559
      ' AND pi_coddocumento <> ''0''';

  if chkSiniestro.Checked then
    if (edSiniDesde.Text <> '') and (edSiniHasta.Text <> '') then
      SqlRefresh := SqlRefresh + ' AND PI_SINIESTRO BETWEEN ' + edSiniDesde.Text + ' AND ' + edSiniHasta.Text
    else if (edSiniDesde.Text <> '') then
      SqlRefresh := SqlRefresh + ' AND PI_SINIESTRO > ' + edSiniDesde.Text
    else if (edSiniHasta.Text <> '') then
      SqlRefresh := SqlRefresh + ' AND PI_SINIESTRO < ' + edSiniHasta.Text;

  //---------------------------------------------------------------------------------------------------------------//
  if chkFecha.Checked then
    if (deFechaDesde.Date <> 0) and (deFechaHasta.Date <> 0) then
      SqlRefresh := SqlRefresh + ' AND PI_FECHAALTA BETWEEN ' + deFechaDesde.SqlText + ' AND ' + deFechaHasta.SqlText
    else if (deFechaDesde.Date <> 0) then
      SqlRefresh := SqlRefresh + ' AND PI_FECHAALTA > ' + deFechaDesde.SqlText
    else if (deFechaHasta.Date <> 0) then
      SqlRefresh := SqlRefresh + ' AND PI_FECHAALTA < ' + deFechaHasta.SqlText;

  //---------------------------------------------------------------------------------------------------------------//
  if (fraPrestador.IDPrestador <> 0) then
    SqlRefresh := SqlRefresh + ' AND PI_PRESTID = ' + IntToStr(fraPrestador.IDPrestador) +
                               ' AND PI_DESTINATARIO = ''Prestador''';

  //---------------------------------------------------------------------------------------------------------------//
  if (fraEmpresa.IsSelected) then
    SqlRefresh := SqlRefresh + ' AND EX_CUIT = ' + SQLValue(fraEmpresa.CUIT) + ' AND PI_DESTINATARIO = ''Empresa''';

  //---------------------------------------------------------------------------------------------------------------//
  if (pnlTipoDocumento.Checked) then
    SqlRefresh := SqlRefresh + ' AND PI_CODDOCUMENTO = ''' + edTipoDocumento.Text + '''';

  //---------------------------------------------------------------------------------------------------------------//
  if (pnlGTrabajo.Checked) then begin
    if (fraGrupoTrabajo.ID <> '') then
        SqlRefresh := SqlRefresh + ' AND ex_gtrabajo = ' + fraGrupoTrabajo.ID;
    if (fraGrupoTrabajo.cmbGestor.Text <> '') then
        SqlRefresh := SqlRefresh + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);
  end;

  //---------------------------------------------------------------------------------------------------------------//
  if (pnlDelegacion.Checked) then
    SqlRefresh := SqlRefresh + ' AND EX_DELEGACION = ' + edDelegacion.Text;

  //--------------------------------------------------------------------------------------------------------------//
  if (pnlSector.Checked) then
    SqlRefresh := SqlRefresh + ' AND SE_SECTOR = ' + SqlValue(fraSectores.Codigo);

  //--------------------------------------------------------------------------------------------------------------//
  if (pnlUsuarios.Checked) then
    SqlRefresh := SqlRefresh + ' AND PI_USUALTA ' + cmbUsuarios.InSql;


  case tbFiltros.Tag of
    0:  SqlRefresh := SqlRefresh + ' AND PI_FECHARECEPCION IS NULL';
    1:  SqlRefresh := SqlRefresh + ' AND PI_FECHAIMPRESION IS NULL';
  end;

  OpenQuery(sdqDatos, sqlRefresh + ' ' + SortDialog.OrderBy, True);
  Cursor := crDefault;
  lblCantidad.Caption := '  Cantidad de Registros: ' + IntToStr(sdqDatos.RecordCount);
end;

procedure TfrmPedidosInfo.tbRecepcionClick(Sender: TObject);
var
  SelDate: TDateTime;
  ssql   : String;
begin
  if sdqDatos.Eof then
    Exit;

  if not sdqDatosPI_FECHARECEPCION.IsNull then
    MsgBox('El Documento ya tiene fecha de recepción', MB_ICONEXCLAMATION)
  else if AreIn(sdqDatosPI_CODDOCUMENTO.AsString, ['001', '004', '010', '019', 'DEN', 'DEG', 'PME', 'PMI']) then
    MsgBox('No se puede recepcionar documentos de:' + #13 + #13 +
           'Denuncia de Accidente (Empresa),' + #13 +
           'Parte Médico de Ingreso,' + #13 +
           'Denuncia S.R.T. por Siniestro Grave y' + #13 +
           'Parte Médico de Egreso - Alta Médica', MB_ICONEXCLAMATION)
  else if sdqDatosPI_FECHAIMPRESION.IsNull then
    MsgBox('No se puede recepcionar un documento no impreso',MB_ICONEXCLAMATION)
  else
  begin
    SelDate := InputBoxDate('Recepción Documentos', 'Fecha Recepción:', Date,
                            sdqDatosPI_FECHAIMPRESION.AsDateTime,                // Fecha Mínima
                            Date);

    if (SelDate = 0) or (SelDate < sdqDatosPI_FECHAALTA.AsDateTime) then
      Exit;

    ssql :=
      'UPDATE sdo_documutual' +
        ' SET do_fecharecepcion = TO_DATE(''' + DateToStr(SelDate) + ''', ''dd/mm/yyyy'')' +
      ' WHERE do_siniestro = ''' + sdqDatosPI_SINIESTRO.AsString + '''' +
        ' AND do_orden = '''   +   sdqDatosPI_ORDEN.AsString     + '''' +
        ' AND do_recaida = ''' +   sdqDatosPI_RECAIDA.AsString   + '''' +
        ' AND do_numero = '''  +   sdqDatosPI_NUMERO.AsString    + '''' +
        ' AND do_modulo = '''  +   sdqDatosPI_MODULO.AsString    + '''' +
        ' AND DO_DOCUMENTO = ''' + sdqDatosPI_CODDOCUMENTO.AsString + '''';

    EjecutarSQL(ssql);
    if (sdqDatosPI_MODULO.AsString = 'A') then
      VerificarEstado;
    tbRefrescarClick(nil);
  end; // del else
end;

procedure TfrmPedidosInfo.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmPedidosInfo.Imprimir(Tipo: String);
var
  frmFirmantes: TfrmFirmantes;
  rptPedInfo: TrptPedInfo;
  Sql: String;
  SqlDatos: String;
begin
  rptPedInfo   := TrptPedInfo.Create(Self);
  frmFirmantes := TfrmFirmantes.Create(Self);
  SqlDatos     := SqlRefresh; // el query de este formulario, se lo asigno al del reporte para que imprima lo que esta en la grilla, obviamente segun lo que se filtro en la impresion. by LU.
  
  with rptPedInfo do
  begin
    sdqDatos.Close;
    if Tipo = 'PENDIENTES' then
      SqlDatos := SqlDatos + ' AND PI_FECHAIMPRESION IS NULL ';
    if sdqDatosPI_DESTINATARIO.Text = 'Prestador' then
    begin
      SqlDatos := SqlDatos + ' AND PI_DESTINATARIO = ''Prestador''  ' +
                             ' AND PI_PRESTID = ' + sdqDatosCA_IDENTIFICADOR.AsString;
      qrlNombre.Caption      := InitCap(sdqDatosCA_DESCRIPCION.AsString) + '  (' + sdqDatosCA_IDENTIFICADOR.AsString + ')';
      qrlDomicilio.Caption := InitCap(sdqDatosCA_DOMICILIO.AsString);
      qrlCodPostal.Caption := '(' + sdqDatosCA_CODPOSTAL.AsString + ')';
      qrlLocalidad.Caption := InitCap(sdqDatosCA_LOCALIDAD.AsString);
      if (sdqDatosCA_LOCALIDAD.AsString <> 'CAPITAL FEDERAL') then
        qrlProvincia.Caption := InitCap(sdqDatosPROVPREST.AsString);
      qrlTelefono.Caption  := sdqDatosCA_TELEFONO.AsString;
      qrlFax.Caption       := sdqDatosCA_FAX.AsString;
    end
    else
    begin
      SqlDatos := SqlDatos + ' AND PI_DESTINATARIO = ''Empresa'' ' +
                             ' AND MP_CONTRATO = ' + sdqDatosMP_CONTRATO.AsString;
      qrlNombre.Caption      := InitCap(sdqDatosMP_NOMBRE.AsString) + ' (Contrato Nº ' + sdqDatosMP_CONTRATO.AsString + ')';
      qrlDomicilio.Caption := InitCap(sdqDatosMP_CALLE_POST.AsString) + ' Nº ' + sdqDatosMP_NUMERO_POST.AsString + ' ' +
                              sdqDatosMP_PISO_POST.AsString + ' ' + sdqDatosMP_DEPARTAMENTO_POST.AsString;
      qrlCodPostal.Caption := '(' + sdqDatosMP_CPOSTAL_POST.AsString + ')';
      qrlLocalidad.Caption := InitCap(sdqDatosMP_LOCALIDAD_POST.AsString);
      if (sdqDatosMP_LOCALIDAD_POST.AsString <> 'CAPITAL FEDERAL') then
        qrlProvincia.Caption := InitCap(sdqDatosPROVEMP.AsString);
      qrlTelefono.Caption  := sdqDatosMP_TELEFONOS_POST.AsString;
      qrlFax.Caption       := sdqDatosMP_FAX_POST.AsString;
    end;

    OpenQuery(sdqDatos, SqlDatos);

    if sdqDatos.Eof then
      MsgBox('No hay documentos sin imprimir.', MB_ICONEXCLAMATION)
    else
    begin
      frmFirmantes.Area := AREA_APAU;
      if frmFirmantes.ShowModal = mrOk then
      begin
        qrlFecha.Caption    := '                                                         Buenos Aires, ' + DateFormat(StrToDate(ValorSql('SELECT TO_CHAR(SYSDATE, ''DD/MM/YYYY'') FROM DUAL')), 'd ''de'' MMMM ''de'' yyyy');
        qrlFirmante.Caption := frmFirmantes.sdqFirmasUSUARIO.AsString;
        qrlCargo.Caption    := frmFirmantes.sdqFirmasCARACTER.AsString;
        qrlUsuario.Caption  := Sesion.Usuario;
        qrmDireccion.Lines.Text := DomicilioDelegacion(qriLogo.Picture);

        if (sdqDatosPI_DESTINATARIO.AsString  ='Empresa') and (Sesion.Sector = 'PRESDIN') then
        begin
          qrlabel3.Caption  := 'Ref.: Documentación a remitir necesaria para liquidar la Incapacidad Laboral Temporaria';
          qrmemo2.Lines[0]  := 'De Nuestra mayor consideración: ';
          qrmemo2.Lines[1]  := '                            Nos dirigimos a Uds. con el fin de informarles que con referencia a la documentación presentada para liquidar la Prestación Dineraria, solicitamos nos remitan la siguiente documentación complementaria.:';
          qrlabel12.Caption :='';
        end
        else

          qrlabel16.Caption :='';

        //------------------------------------------------------------------------------------------------
        PreviewModal;
        //------------------------------------------------------------------------------------------------

        try
          Sql :=
            'UPDATE sdo_documutual' +
              ' SET do_fechaimpresion = ActualDate' +
            ' WHERE EXISTS (SELECT 1' +
                            ' FROM mpi_pedidoinfo' +
                           ' WHERE do_siniestro = pi_siniestro' +
                             ' AND do_orden = pi_orden' +
                             ' AND do_recaida = pi_recaida' +
                             ' AND do_numero = pi_numero' +
                             ' AND pi_fechaimpresion IS NULL' +
                             ' AND do_destinatario = ''' + IIF(sdqDatosPI_DESTINATARIO.Text = 'Prestador', 'P', 'E') + '''' +
            IIF(sdqDatosPI_DESTINATARIO.Text = 'Prestador', ' AND do_prestador = ' + sdqDatosCA_IDENTIFICADOR.Text, ' AND do_contrato = ' + sdqDatosMP_CONTRATO.Text) + ')';

          EjecutarSql(Sql);
        except
          on E: Exception do
            ErrorMsg(E, 'Error al Guardar los Cambios');
        end;
      end;
    end;
    sdqDatos.Close;
    tbRefrescarClick(nil);
  end;
  rptPedInfo.Free;
  frmFirmantes.Free;
end;

procedure TfrmPedidosInfo.mnuImpPendientesClick(Sender: TObject);
begin
  Imprimir('PENDIENTES');
end;

procedure TfrmPedidosInfo.mnuImpTodosClick(Sender: TObject);
begin
  Imprimir('TODOS');
end;

procedure TfrmPedidosInfo.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidosInfo.tbLimpiarClick(Sender: TObject);
begin
  chkFecha.Checked := False;
  chkFechaClick(nil);

  chkPrestador.Checked := False;
  chkPrestadorClick(nil);

  chkEmpresa.Checked := False;
  chkEmpresaClick(nil);

  chkSiniestro.Checked := False;
  chkSiniestroClick(nil);

  pnlTipoDocumento.Checked    := False;
  cmbTipoDocumento.FieldValue := '';
  cmbTipoDocumento.Text       := '';

  pnlGTrabajo.Checked      := False;
  fraGrupoTrabajo.clear;

  pnlDelegacion.Checked    := False;
  cmbDelegacion.FieldValue := '';
  cmbDelegacion.Text       := '';

  pnlUsuarios.Checked      := False;
  cmbUsuarios.Clear;

  pnlSector.Checked        := False;
  fraSectores.Clear;

  lblCantidad.Caption := ' ';
  sdqDatos.Close;
end;

procedure TfrmPedidosInfo.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  tbRecepcion.Enabled := (not sdqDatosPI_FECHAIMPRESION.IsNull) and (tbRecepcion.Tag = 1);
end;

procedure TfrmPedidosInfo.mnuFiltrosClick(Sender: TObject);
begin
  mnuFiltroPenRec.Checked   := False;
  mnuFiltroPenImpre.Checked := False;
  mnuFiltroTodos.Checked    := False;
  if (tbFiltros.Tag <> TMenuItem(Sender).Tag) then
  begin
   tbFiltros.Tag := TMenuItem(Sender).Tag;
   TMenuItem(Sender).Checked := True;
   tbRefrescarClick(nil)
  end;
end;

procedure TfrmPedidosInfo.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
  tbRefrescarClick(nil);
end;

procedure TfrmPedidosInfo.pnlTipoDocumentoChange(Sender: TObject);
begin
  if not pnlTipoDocumento.Checked then
  begin
    cmbTipoDocumento.FieldValue := '';
    cmbTipoDocumento.Text       := '';
    edTipoDocumento.Text        := '';
  end
  else
    cmbTipoDocumento.DoDropDown;
end;

procedure TfrmPedidosInfo.pnlDelegacionChange(Sender: TObject);
begin
  if not pnlDelegacion.Checked then
  begin
    cmbDelegacion.FieldValue := '';
    cmbDelegacion.Text       := '';
    edDelegacion.Text        := '';
  end
  else
    cmbDelegacion.DoDropDown;
end;

procedure TfrmPedidosInfo.pnlGTrabajoChange(Sender: TObject);
begin
  if not pnlGTrabajo.Checked then
      fraGrupoTrabajo.Clear;
end;

procedure TFrmPedidosInfo.SetEstado(sEstado: Char);
begin
  EjecutarSql('UPDATE sau_autorizaciones' +
                ' SET au_estado = ''' + sEstado + '''' +
              ' WHERE au_siniestro = ' + sdqDatosPI_SINIESTRO.Text +
                ' AND au_orden = ' + sdqDatosPI_ORDEN.Text +
                ' AND au_recaida = ' + sdqDatosPI_RECAIDA.Text +
                ' AND au_numauto = ' + sdqDatosPI_NUMERO.Text);
end;

procedure TfrmPedidosInfo.VerificarEstado;
var
  Sql: String;
  vEstado: String;
begin
  vEstado := ValorSql('SELECT au_estado FROM sau_autorizaciones' +
                      ' WHERE au_siniestro = ' + sdqDatosPI_SINIESTRO.Text +
                        ' AND au_orden = ' + sdqDatosPI_ORDEN.Text +
                        ' AND au_recaida = ' + sdqDatosPI_RECAIDA.Text +
                        ' AND au_numauto = ' + sdqDatosPI_NUMERO.Text);
                        
  if (vEstado = 'P') or (vEstado = 'T')  then
  begin
    Sql :=
      'SELECT 1' +
       ' FROM sdo_documutual' +
      ' WHERE do_siniestro = ' + sdqDatosPI_SINIESTRO.Text +
        ' AND do_orden =  ' + sdqDatosPI_ORDEN.Text +
        ' AND do_recaida = ' + sdqDatosPI_RECAIDA.Text +
        ' AND do_numero = ' + sdqDatosPI_NUMERO.Text +
        ' AND do_fecharecepcion IS NULL';
        
    if not ExisteSql(Sql) then
      SetEstado('P')
    else
      SetEstado('T')
  end;
end;

{------[Delegacion]--------------------------------------------------------------------------------------------------------------}
procedure TfrmPedidosInfo.edDelegacionKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    cmbDelegacion.FieldValue := edDelegacion.Text;
end;

procedure TfrmPedidosInfo.cmbDelegacionCloseUp(Sender: TObject);
begin
  if (Trim(cmbDelegacion.Text) <> '') then
    edDelegacion.Text := cmbDelegacion.FieldValue;
end;

procedure TfrmPedidosInfo.cmbDelegacionChange(Sender: TObject);
begin
  if Trim(cmbDelegacion.Text) = '' then
    edDelegacion.Text := '';
end;

{------[Tipo Documento]----------------------------------------------------------------------------------------------------------}
procedure TfrmPedidosInfo.edTipoDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    cmbTipoDocumento.FieldValue := edTipoDocumento.Text;
end;

procedure TfrmPedidosInfo.cmbTipoDocumentoCloseUp(Sender: TObject);
begin
  if (Trim(cmbTipoDocumento.Text) <> '') then
    edTipoDocumento.Text := cmbTipoDocumento.FieldValue;
end;

procedure TfrmPedidosInfo.cmbTipoDocumentoChange(Sender: TObject);
begin
  if Trim(cmbTipoDocumento.Text) = '' then
    edTipoDocumento.Text := '';
end;

procedure TfrmPedidosInfo.tbExportarClick(Sender: TObject);
begin
  if not sdqDatos.IsEmpty then
    ExportDialog.Execute;
end;

procedure TfrmPedidosInfo.pnlUsuariosChange(Sender: TObject);
begin
  if not pnlUsuarios.Checked then
    cmbUsuarios.Clear;
end;

procedure TfrmPedidosInfo.pnlSectorChange(Sender: TObject);
begin
  if not pnlSector.Checked then
    fraSectores.Clear;
end;

procedure TfrmPedidosInfo.CambioSector(Sender: TObject);
var
  sSql:string;
begin
  sdqUsuarios.Close;                               
  sSql := 'SELECT se_usuario, se_nombre ' +
           ' FROM art.use_usuarios ' +
          ' WHERE se_fechabaja IS NULL ' +
            ' AND se_usuariogenerico = ''N'' ';
  if (fraSectores.Codigo <> '') then
    sSql := sSql + ' AND se_sector = ' + SqlValue(fraSectores.Codigo);

  sSql := sSql + ' ORDER BY se_nombre ';
  OpenQuery(sdqUsuarios, sSql);
end;

procedure TfrmPedidosInfo.fraSectoresExit(Sender: TObject);
begin
  fraSectores.FrameExit(Sender);
  CambioSector(Sender);
end;

end.
