unit unManUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  Placemnt, artSeguridad, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unfraUsuarios, FormPanel, ShortCutControl, SortDlg,
  PatternEdit, RxLookup, Mask, ToolEdit, ArtComboBox, Menus, Buttons, ImageListBox, ImgList, ARTCheckListBox,
  unfraSectores, unfraPerfiles, unfraUsuDatos, QueryToFile, ExportDialog, QueryPrint, unArtFrame, unCustomForm, XPMenu,
  CheckLst, ARTDBGrid, DateComboBox, AdvGlowButton, RxToolEdit, RxPlacemnt;

type
  TfrmManUsuarios = class(TfrmCustomForm)
    DBGrid: TArtDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton5: TToolButton;
    tbSalir: TToolButton;
    tbModificar: TToolButton;
    ToolButton3: TToolButton;
    tbNuevo: TToolButton;
    ToolButton6: TToolButton;
    tbEliminar: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbBuscar: TToolButton;
    ToolButton11: TToolButton;
    fpBusqueda: TFormPanel;
    fraUsuario: TfraUsuario;
    Label1: TLabel;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    fpUsuario: TFormPanel;
    Label2: TLabel;
    edUsuario: TPatternEdit;
    Label3: TLabel;
    edNombre: TEdit;
    Label4: TLabel;
    edClave: TPatternEdit;
    Label5: TLabel;
    edVerificacion: TPatternEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    pmnuNuevos: TPopupMenu;
    mnuNuevoUsuario: TMenuItem;
    mnuCrearCopia: TMenuItem;
    tbFiltros: TToolButton;
    fpFiltros: TFormPanel;
    Bevel1: TBevel;
    ilbFiltros: TImageListBox;
    ImageList: TImageList;
    Bevel2: TBevel;
    fraUsuDatosABM: TfraUsuDatos;
    fraUsuFiltros: TfraUsuDatos;
    ExportDialog: TExportDialog;
    QueryPrint: TQueryPrint;
    chkDemorada: TCheckBox;
    chkVencida: TCheckBox;
    lbTextCopia: TLabel;
    lbUsuCopia: TLabel;
    sdqDatosSE_USUARIO: TStringField;
    sdqDatosSE_NOMBRE: TStringField;
    sdqDatosSE_PERFIL: TStringField;
    sdqDatosPF_DESCRIPCION: TStringField;
    sdqDatosPF_FECHABAJA: TDateTimeField;
    sdqDatosSE_FECHAMOD: TDateTimeField;
    sdqDatosSE_TIEMPOESPERA: TFloatField;
    sdqDatosSE_SECTOR: TStringField;
    sdqDatosSC_DESCRIPCION: TStringField;
    sdqDatosSE_DELEGACION: TStringField;
    sdqDatosSC_FECHABAJA: TDateTimeField;
    sdqDatosEL_NOMBRE: TStringField;
    sdqDatosSE_CARGO: TStringField;
    sdqDatosTB_DESCRIPCION: TStringField;
    sdqDatosSE_FECHABAJA: TDateTimeField;
    sdqDatosSE_ACCESOSEGURIDAD: TStringField;
    sdqDatosSE_USUARIOGENERICO: TStringField;
    edSE_INTERNO: TEdit;
    Label6: TLabel;
    sdqDatosSE_INTERNO: TStringField;
    sdqDatosSE_MAIL: TStringField;
    fpDigitalizacion: TFormPanel;
    Bevel6: TBevel;
    clbDigitalizacion: TARTCheckListBox;
    Label7: TLabel;
    sdqDatosPERFILES: TFloatField;
    tbFax: TToolButton;
    sdqDatosSE_IDSECTOR: TFloatField;
    sdqDatosSECTOR_INTRANET: TStringField;
    sdqDatosSE_PC: TFloatField;
    sdqDatosSE_RESPONDEA: TStringField;
    sdqDatosEQ_DESCRIPCION: TStringField;
    sdqDatosSE_CONTRATO: TFloatField;
    sdqDatosRU_DETALLE: TStringField;
    gbFechaAlta: TGroupBox;
    edSE_FECHAALTADesde: TDateComboBox;
    Label8: TLabel;
    edSE_FECHAALTAHasta: TDateComboBox;
    gbFechaBaja: TGroupBox;
    Label9: TLabel;
    edSE_FECHABAJADesde: TDateComboBox;
    edSE_FECHABAJAHasta: TDateComboBox;
    sdqDatosSE_FECHAALTA: TDateTimeField;
    btnPermisos: TAdvGlowButton;
    btnDigitalizacion: TAdvGlowButton;
    btnFax: TAdvGlowButton;
    btnABMAceptar: TAdvGlowButton;
    btnABMCancelar: TAdvGlowButton;
    btnFiltrosAceptar: TAdvGlowButton;
    btnFiltrosCancelar: TAdvGlowButton;
    btnFiltrosLimpiar: TAdvGlowButton;
    btnImpoExpo: TAdvGlowButton;
    btnAceptarDigitalizacion: TAdvGlowButton;
    btnCancelarDigitalizacion: TAdvGlowButton;
    btnBuscCancelar: TAdvGlowButton;
    btnBuscBuscar: TAdvGlowButton;
    fpImpoExpo: TFormPanel;
    Bevel7: TBevel;
    Label10: TLabel;
    clbImpoExpo: TARTCheckListBox;
    btnAceptarImpoExpo: TAdvGlowButton;
    btnCancelarImpoExpo: TAdvGlowButton;
    sdqDatosIMPOEXPO: TFloatField;
    sdqDatosSE_IDNIVELAUTORIZA: TFloatField;
    sdqDatosNA_DESCRIPCION: TStringField;
    pmuImpoExpo: TPopupMenu;
    mnuSeleccionarTodos: TMenuItem;
    mnuNoSeleccionarNinguno: TMenuItem;
    sdqDatosSE_ID: TFloatField;
    sdqDatosBAJA_SECTOR_INTRANET: TDateTimeField;
    sdqDatosJEFE: TStringField;
    Label11: TLabel;
    edNotas: TMemo;
    ImgColor2: TImageList;
    imgBN2: TImageList;
    sdqDatosSE_NOTAS: TStringField;
    pnlTotales: TPanel;
    Panel2: TPanel;
    pnlCantidadTickets: TPanel;
    lbTotal: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label12: TLabel;
    pnlViendo: TPanel;
    lbTickets1: TLabel;
    Panel1: TPanel;
    Panel5: TPanel;
    procedure DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnABMAceptarClick(Sender: TObject);
    procedure edClaveChange(Sender: TObject);
    procedure edClaveExit(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure tbFiltrosClick(Sender: TObject);
    procedure ilbFiltrosImageClick(Sender: TObject; Index: Integer);
    procedure btnFiltrosLimpiarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnPermisosClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                      var ABackground: TColor; var AAlignment: TAlignment);
    procedure btnDigitalizacionClick(Sender: TObject);
    procedure btnAceptarDigitalizacionClick(Sender: TObject);
    procedure tbFaxClick(Sender: TObject);
    procedure btnFaxClick(Sender: TObject);
    procedure btnImpoExpoClick(Sender: TObject);
    procedure btnAceptarImpoExpoClick(Sender: TObject);
    procedure fpUsuarioShow(Sender: TObject);
    procedure fraNivelCobranzasPropiedadesChange(Sender: TObject);
    procedure mnuNoSeleccionarNingunoClick(Sender: TObject);
    procedure mnuSeleccionarTodosClick(Sender: TObject);
    procedure sdqDatosAfterClose(DataSet: TDataSet);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    FFechaVenc: TDateTime;

    procedure CargarDatos;
  public
  end;

var
  frmManUsuarios: TfrmManUsuarios;

implementation

uses
  unDmPrincipal, unPrincipal, CustomDlgs, General, SqlOracle, unPermisosUsuario, unManFFU_FORMULARIOUSUARIO, unSesion,
  unFiltros, VCLExtra, unGrids, unArt;

{$R *.DFM}

procedure TfrmManUsuarios.DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  bBaja: Boolean;
begin
  inherited;

  if AreIn(Field.FieldName, ['SE_USUARIO', 'SE_NOMBRE']) and (not sdqDatosSE_FECHABAJA.IsNull) then
    bBaja := True
  else if (Field.FieldName = 'PF_DESCRIPCION') and (not sdqDatosPF_FECHABAJA.IsNull) then
    bBaja := True
  else if (Field.FieldName = 'SC_DESCRIPCION') and (not sdqDatosSC_FECHABAJA.IsNull) then
    bBaja := True
  else if (Field.FieldName = 'SECTOR_INTRANET') and (not sdqDatosBAJA_SECTOR_INTRANET.IsNull) then
    bBaja := True
  else
    bBaja := False;

  if bBaja then
    if Highlight then
      AFont.Color := clSilver
    else
      AFont.Color := clRed;
end;

procedure TfrmManUsuarios.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmManUsuarios.tbRefrescarClick(Sender: TObject);
var
  sUsuario, Sql: String;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    sUsuario := sdqDatosSE_USUARIO.AsString
  else
    sUsuario := '';

  Sql :=
    'SELECT SE_ID, SE_USUARIO, SE_NOMBRE, SE_PERFIL, PF_DESCRIPCION, PF_FECHABAJA, SE_FECHAMOD, SE_TIEMPOESPERA, SE_SECTOR,' +
          ' SC_DESCRIPCION, SC_FECHABAJA, SE_DELEGACION, EL_NOMBRE, SE_CARGO, TB_DESCRIPCION, SE_FECHAALTA, SE_FECHABAJA,' +
          ' SE_ACCESOSEGURIDAD, SE_USUARIOGENERICO, SE_INTERNO, SE_MAIL, (SELECT COUNT(*) ' +
                                                                           'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                                                          'WHERE AU_FECHABAJA IS NULL ' +
                                                                            'AND AU_IDTIPOARCHIVO = TA_ID ' +
                                                                            'AND TA_FECHABAJA IS NULL ' +
                                                                            'AND AU_USUARIO = SE_USUARIO) PERFILES, ' +
          ' EQ_DESCRIPCION, SE_PC, SE_RESPONDEA, SE_CONTRATO, RU_DETALLE, ' +
          ' (SELECT JEFE.SE_NOMBRE FROM ART.USE_USUARIOS JEFE WHERE JEFE.SE_USUARIO = USUARIO.SE_RESPONDEA) as JEFE, ' +
          ' SE_IDSECTOR, (SELECT SECTOR.SE_DESCRIPCION ' +
                          ' FROM COMPUTOS.CSE_SECTOR SECTOR ' +
                         ' WHERE SECTOR.SE_ID = SE_IDSECTOR) as SECTOR_INTRANET, ' +
                        '(SELECT SECTOR.SE_FECHABAJA ' +
                          ' FROM COMPUTOS.CSE_SECTOR SECTOR ' +
                         ' WHERE SECTOR.SE_ID = SE_IDSECTOR) as BAJA_SECTOR_INTRANET, ' +
          ' (SELECT COUNT(PU_IDPROCESO) ' +
          '    FROM IMPOEXPO.IPU_PROCESOUSUARIO ' +
          '   WHERE PU_USUARIO = SE_USUARIO) IMPOEXPO, SE_IDNIVELAUTORIZA, NA_DESCRIPCION, SE_NOTAS ' +
     ' FROM COMPUTOS.CEQ_EQUIPO, ART.CTB_TABLAS, ART.USC_SECTORES, ART.UPF_PERFILES, ART.DEL_DELEGACION, ' +
          ' ZNA_NIVELAUTORIZACION, COMUNES.CRU_RELACIONLABORALUSUARIO, ART.USE_USUARIOS USUARIO ' +
    ' WHERE SC_CODIGO = SE_SECTOR' +
      ' AND PF_PERFIL (+) = SE_PERFIL' +
      ' AND EL_ID (+) = SE_DELEGACION' +
      ' AND TB_CLAVE (+) = ''USCAR''' +
      ' AND SE_PC = EQ_ID (+) ' +
      ' AND SE_CONTRATO = RU_ID (+) ' +
      ' AND TB_CODIGO (+) = SE_CARGO ' +
      ' AND SE_IDNIVELAUTORIZA = NA_ID (+)';

  case ilbFiltros.ItemImage[0] of  // Usuarios dados de Baja
    0:  Sql := Sql + ' AND SE_FECHABAJA IS NOT NULL';
    1:  Sql := Sql + ' AND SE_FECHABAJA IS NULL';
  end;

  case ilbFiltros.ItemImage[1] of // Contraseña vencida (Cambiar el 30 por UsuParams)
    0:  Sql := Sql + ' AND ((SE_FECHAMOD < ' + SqlDate(FFechaVenc) + ') OR (SE_FECHAMOD IS NULL))';
    1:  Sql := Sql + ' AND (SE_FECHAMOD >= ' + SqlDate(FFechaVenc) + ')';
  end;

  case ilbFiltros.ItemImage[2] of // Usuarios Demorados
    0:  Sql := Sql + ' AND SE_TIEMPOESPERA > 0';
    1:  Sql := Sql + ' AND ((SE_TIEMPOESPERA = 0) OR (SE_TIEMPOESPERA IS NULL))';
  end;

  case ilbFiltros.ItemImage[3] of // Sin Sector
    0:  Sql := Sql + ' AND ((SE_SECTOR IS NULL) OR (SC_FECHABAJA IS NOT NULL))';
    1:  Sql := Sql + ' AND SE_SECTOR IS NOT NULL AND SC_FECHABAJA IS NULL';
  end;

  case ilbFiltros.ItemImage[4] of // Sin Perfil
    0:  Sql := Sql + ' AND ((SE_PERFIL IS NULL) OR (PF_FECHABAJA IS NOT NULL))';
    1:  Sql := Sql + ' AND SE_PERFIL IS NOT NULL AND PF_FECHABAJA IS NULL';
  end;

  case ilbFiltros.ItemImage[5] of // Sin sector de la Intranet
    0:  Sql := Sql + ' AND SE_IDSECTOR IS NULL ';
    1:  Sql := Sql + ' AND SE_IDSECTOR IS NOT NULL ';
  end;

  case ilbFiltros.ItemImage[6] of // Usuarios genéricos
    0:  Sql := Sql + ' AND SE_USUARIOGENERICO = ''S'' ';
    1:  Sql := Sql + ' AND SE_USUARIOGENERICO = ''N'' ';
  end;

  with fraUsuFiltros do
  begin
    if fraDelegacion.IsSelected then
      Sql := Sql + ' AND SC_DELEGACION = ''' + fraDelegacion.Codigo + '''';

    if fraSectores.edCodigo.Text <> '' then
      Sql := Sql + ' AND SE_SECTOR = ' + SqlValue(fraSectores.edCodigo.Text);

    if fraRelacionLaboral.IsSelected then
      Sql := Sql + ' AND SE_CONTRATO = ' + SqlValue(fraRelacionLaboral.Id);

    if fraSector.IsSelected then
      Sql := Sql + ' AND SE_IDSECTOR = ' + SqlValue(fraSector.Id);

    if fraEquipo.IsSelected then
      Sql := Sql + ' AND SE_PC = ' + SqlValue(fraEquipo.Id);

    if fraUsuarioJefe.IsSelected then
      Sql := Sql + ' AND SE_RESPONDEA = ' + SqlValue(fraUsuarioJefe.Codigo);

    if fraNivelCobranzas.IsSelected then
      Sql := Sql + ' AND SE_IDNIVELAUTORIZA = ' + SqlValue(fraNivelCobranzas.Codigo);
      
    if fraPerfiles.edCodigo.Text <> '' then
      Sql := Sql + ' AND SE_PERFIL = ' + SqlValue(fraPerfiles.edCodigo.Text);

    if cmbCargos.Value <> cmbCargos.EmptyValue then
      Sql := Sql + ' AND SE_CARGO = ''' + cmbCargos.Value + '''';

    if chkAccesoSeguridad.Checked then
      Sql := Sql + ' AND SE_ACCESOSEGURIDAD = ''S''';

    if chkUsuarioGenerico.Checked then
      Sql := Sql + ' AND SE_USUARIOGENERICO = ''S''';

    if edSE_MAIL.Text > '' then
      Sql := Sql + ' AND LOWER(SE_MAIL) = ' + SqlValue(edSE_MAIL.Text);
  end;
  Sql := Sql + DoFiltro(gbFechaAlta) + DoFiltro(gbFechaBaja) + SortDialog.OrderBy;

  OpenQuery(sdqDatos, Sql, True);
  try
    sdqDatos.Locate('SE_USUARIO', sUsuario, []);
  except
  end;
end;

procedure TfrmManUsuarios.tbBuscarClick(Sender: TObject);
begin
  if fpBusqueda.ShowModal = mrOk then
    sdqDatos.Locate('SE_USUARIO', fraUsuario.edCodigo.Text, []);
end;

procedure TfrmManUsuarios.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, DBGrid.Columns);
  SortDialog.Execute;
end;

procedure TfrmManUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  FFechaVenc := StrToDateTime(ValorSql('SELECT TO_CHAR((SYSDATE - SS_DIASEXP), ''DD/MM/YYYY HH24:MI:SS'') FROM USS_PARAMETROS'));

  with fraUsuFiltros do
  begin
    fraSectores.ShowBajas        := True;
    fraRelacionLaboral.ShowBajas := True;
    fraSector.ShowBajas          := True;
    fraPerfiles.ShowBajas        := True;
    fraDelegacion.ShowBajas      := True;
  end;
  fraUsuDatosABM.fraDelegacion.ShowBajas := True;  
end;

procedure TfrmManUsuarios.tbNuevoClick(Sender: TObject);
begin
  edUsuario.Text      := '';
  edNombre.Text       := '';
  edSE_INTERNO.Text   := '';
  edClave.Text        := '********';
  edVerificacion.Text := '********';
  chkDemorada.Checked := False;
  chkVencida.Checked  := True;
  btnDigitalizacion.Caption := '&Digitalización';
  btnImpoExpo.Caption := '&ImpoExpo';

  if Sender = mnuCrearCopia then
  begin
    with fraUsuDatosABM do
    begin
      Limpiar;
      fraDelegacion.Codigo := sdqDatosSE_DELEGACION.AsString;
      fraSectores.Cargar(sdqDatosSE_SECTOR.AsString);
      fraPerfiles.Cargar(sdqDatosSE_PERFIL.AsString);
      cmbCargos.Value := sdqDatosSE_CARGO.AsString;
      chkAccesoSeguridad.Checked := IIF(sdqDatosSE_ACCESOSEGURIDAD.AsString = 'S', True, False);
      chkUsuarioGenerico.Checked := IIF(sdqDatosSE_USUARIOGENERICO.AsString = 'S', True, False);
      fraSector.Codigo := sdqDatosSE_IDSECTOR.AsString;
      //fraRelacionLaboral.Codigo := sdqDatosSE_CONTRATO.AsString; /*Ya no se copia la relación laboral*/
      //fraEquipo.Codigo := sdqDatosSE_PC.AsString;
      fraUsuarioJefe.Codigo := sdqDatosSE_RESPONDEA.AsString;
      edSE_MAIL.Clear;
      fraNivelCobranzas.Codigo := sdqDatosSE_IDNIVELAUTORIZA.AsString;
      edNotas.Clear;
    end;
    lbTextCopia.Visible := True;
    lbUsuCopia.Visible  := True;
    lbUsuCopia.Caption  := sdqDatosSE_USUARIO.AsString;
  end
  else
  begin
    fraUsuDatosABM.Limpiar;
    lbTextCopia.Visible := False;
    lbUsuCopia.Visible  := False;
  end;

  with fpUsuario do
  begin
    Caption := 'Nuevo Usuario';
    Tag     := 1;
    ShowModal;
  end;
end;

procedure TfrmManUsuarios.tbModificarClick(Sender: TObject);
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
  begin
    if sdqDatosSE_FECHABAJA.IsNull then
    begin
      lbTextCopia.Visible := False;
      lbUsuCopia.Visible  := False;
      edUsuario.Text      := sdqDatosSE_USUARIO.AsString;
      edNombre.Text       := sdqDatosSE_NOMBRE.AsString;
      edSE_INTERNO.Text   := sdqDatosSE_INTERNO.AsString;
      with fraUsuDatosABM do
      begin
        fraDelegacion.Codigo := sdqDatosSE_DELEGACION.AsString;
        fraSectores.Cargar(sdqDatosSE_SECTOR.AsString);
        fraPerfiles.Cargar(sdqDatosSE_PERFIL.AsString);
        cmbCargos.Value := sdqDatosSE_CARGO.AsString;
        chkDemorada.Checked := (sdqDatosSE_TIEMPOESPERA.AsInteger > 0);
        chkVencida.Checked := sdqDatosSE_FECHAMOD.IsNull or (sdqDatosSE_FECHAMOD.AsDateTime < FFechaVenc);
        chkAccesoSeguridad.Checked := IIF(sdqDatosSE_ACCESOSEGURIDAD.AsString = 'S', True, False);
        chkUsuarioGenerico.Checked := IIF(sdqDatosSE_USUARIOGENERICO.AsString = 'S', True, False);
        edSE_MAIL.Text := sdqDatosSE_MAIL.AsString;
        fraSector.Codigo := sdqDatosSE_IDSECTOR.AsString;
        fraRelacionLaboral.Codigo := sdqDatosSE_CONTRATO.AsString;
        fraEquipo.Codigo := sdqDatosSE_PC.AsString;
        fraUsuarioJefe.Codigo := sdqDatosSE_RESPONDEA.AsString;
        fraNivelCobranzas.Codigo := sdqDatosSE_IDNIVELAUTORIZA.AsString;
        edNotas.Lines.Text := sdqDatosSE_NOTAS.AsString;
        AnalizoCambioSectorUsuGenerico(nil);
      end;
      edClave.Text        := '********';
      edVerificacion.Text := '********';

      CargarDatos;
      with fpUsuario do
      begin
        Caption := 'Modificar Usuario';
        Tag     := 2;
        ShowModal;
      end;
    end
    else
      if MsgAsk('El usuario ' + sdqDatosSE_NOMBRE.AsString +
                ' ha sido dado de baja el día ' + FormatDateTime('dd/mm/yyyy', sdqDatosSE_FECHABAJA.AsDateTime) + CRLF +
                '¿Desea reactivarlo ahora?') then
      begin
        EjecutarSQLEx('INSERT INTO art.use_usuarios ' +
                            ' ( ' +
                            ' se_usuario, se_clave, se_nombre, se_perfil, se_histo1, se_histo2, se_histo3, ' +
                            ' se_fechamod, se_tiempoespera, se_sector, se_cargo, se_fechabaja, se_interno, ' +
                            ' se_cuit, se_holding, se_delegacion, se_mail, se_idsector, se_accesoseguridad, ' +
                            ' se_respondea, se_ubica, se_pc, se_autoriza, se_dominio, se_puesto, se_legajo, se_foto, ' +
                            ' se_fechacumple, se_contrato, se_nivel, se_horarioatencion, se_fechaalta, se_usualta, ' +
                            ' se_fechamodif, se_usumodif, se_usubaja, se_usuariogenerico, se_piso, se_ejex, se_ejey, ' +
                            ' se_dentrofueraedificio, se_buscanombre, se_idnivelautoriza ' +
                            ' ) ' +
                      'SELECT REPLACE(SUBSTR(RPAD(se_usuario, 20, '' ''), 1, 12) || TO_CHAR(SYSDATE, ''yyyymmdd''), '' '', ''_''), ' +
                            ' se_clave, se_nombre, se_perfil, se_histo1, se_histo2, se_histo3, ' +
                            ' se_fechamod, se_tiempoespera, se_sector, se_cargo, se_fechabaja, se_interno, ' +
                            ' se_cuit, se_holding, se_delegacion, se_mail, se_idsector, se_accesoseguridad, ' +
                            ' se_respondea, se_ubica, se_pc, se_autoriza, se_dominio, se_puesto, se_legajo, se_foto, ' +
                            ' se_fechacumple, se_contrato, se_nivel, se_horarioatencion, se_fechaalta, se_usualta, ' +
                            ' se_fechamodif, se_usumodif, se_usubaja, ''S'', se_piso, se_ejex, se_ejey, ' +
                            ' se_dentrofueraedificio, se_buscanombre, se_idnivelautoriza ' +
                      '  FROM art.use_usuarios ' +
                      ' WHERE se_id = :id', [sdqDatosSE_ID.AsInteger]);

        EjecutarSQLEx('UPDATE art.use_usuarios ' +
                         'SET se_fechabaja = NULL, ' +
                             'se_usubaja = NULL, ' +
                             'se_fechaalta = SYSDATE, ' +
                             'se_usualta = :usuario ' +
                      ' WHERE se_id = :id', [Sesion.UserID, sdqDatosSE_ID.AsInteger]);
        tbRefrescar.Click;
      end;
  end;
end;

procedure TfrmManUsuarios.CargarDatos;
begin
  btnDigitalizacion.Caption := '&Digitalización (' + ValorSQLEx('SELECT COUNT(*) ' +
                                                                  'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                                                 'WHERE AU_FECHABAJA IS NULL ' +
                                                                   'AND AU_IDTIPOARCHIVO = TA_ID ' +
                                                                   'AND TA_FECHABAJA IS NULL ' +
                                                                   'AND AU_USUARIO = :usuario', [edUsuario.Text]) + ')';

  btnImpoExpo.Caption := '&ImpoExpo (' + ValorSQLEx('SELECT COUNT(pu_idproceso)' +
                                                     ' FROM ipu_procesousuario' +
                                                    ' WHERE pu_usuario = :usuario', [edUsuario.Text]) + ')';
end;

procedure TfrmManUsuarios.tbEliminarClick(Sender: TObject);
var
  Sql: String;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and sdqDatosSE_FECHABAJA.IsNull and
    (MsgBox('Se dispone a dar de baja al usuario ' + sdqDatosSE_USUARIO.AsString + ' (' + sdqDatosSE_NOMBRE.AsString + ').' + #13 +
            '¿ Está usted seguro ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    Sql :=
      'UPDATE USE_USUARIOS' +
        ' SET SE_FECHABAJA = ACTUALDATE,' +
            ' SE_CLAVE = ''BAJA''' +
      ' WHERE SE_USUARIO = :p1';
    try
      EjecutarSqlEx(Sql, [sdqDatosSE_USUARIO.AsString]);
      RefreshAndRelocate(sdqDatos, ['SE_USUARIO']);
    except
      on E: Exception do
        ErrorMsg(E);
    end;
  end;
end;

procedure TfrmManUsuarios.btnABMAceptarClick(Sender: TObject);
var
  sSQL: String;
begin
  with fraUsuDatosABM do
  begin
    Verificar((fpUsuario.Tag = 1) and ExisteSqlEx('SELECT 1' +
                                                   ' FROM USE_USUARIOS' +
                                                  ' WHERE SE_USUARIO = :p1', [edUsuario.Text]),
              edUsuario, 'Se encontró un usuario con el código ingresado.');

    Verificar(fraSectores.edCodigo.Text = '', fraSectores.edCodigo, 'Debe cargar el sector de trabajo.');
    Verificar(fraPerfiles.edCodigo.Text = '', fraPerfiles.edCodigo, 'Debe cargar el perfil del usuario.');
    Verificar(fraDelegacion.IsBaja, fraDelegacion.edCodigo, 'La delegación seleccionada ha sido dada de baja, por favor seleccione otra.');    
    Verificar(edClave.Text <> edVerificacion.Text, edClave, 'La contraseña y su verificación no coinciden.');
    Verificar(Pos(' ', edSE_MAIL.Text) > 0, edSE_MAIL, 'La dirección de correo no puede contener espacios. Utilice el símbolo % para poner por ejemplo "Arturo%Gonzalez" en vez de "agonzalez" en caso de que existiese el usuario "Adrián Gonzalez". ¿ Se entiende ?.');
    Verificar(not fraSector.Locked and fraSector.IsEmpty, fraSector.edCodigo, 'Debe cargar el sector de trabajo para la Intranet.');
    Verificar(not fraSector.Locked and fraSector.IsBaja, fraSector.edCodigo, 'Este sector de trabajo para la Intranet está dado de baja.');
//    Verificar(fraRelacionLaboral.IsEmpty, fraRelacionLaboral.edCodigo, 'Debe indicar el tipo de relación laboral.'); Ya no se obligatorio, lo completa RRHH ahora desde la Intranet 

    try
      if (fpUsuario.Tag = 1) then
        sSQL :=
          'INSERT INTO USE_USUARIOS(SE_USUARIO, SE_CLAVE, SE_NOMBRE, SE_PERFIL, SE_SECTOR, SE_DELEGACION, SE_CARGO,' +
                                  ' SE_FECHAMOD, SE_TIEMPOESPERA, SE_ACCESOSEGURIDAD, SE_USUARIOGENERICO, SE_INTERNO,' +
                                  ' SE_MAIL, SE_IDSECTOR, SE_PC, SE_RESPONDEA, SE_FECHAALTA, SE_USUALTA, SE_CONTRATO, SE_IDNIVELAUTORIZA, SE_NOTAS) ' +
                          ' VALUES (' + SqlValue(edUsuario.Text) + ', ' + IIF(edClave.Text = '********', 'NULL', 'ENCRIPTAR(''' + edClave.Text + ''')' ) + ', ' +
                                        SqlString(edNombre.Text, True) + ', ' + SqlValue(fraPerfiles.edCodigo.Text) + ', ' +
                                        SqlValue(fraSectores.edCodigo.Text) + ', ' + SqlValue(fraDelegacion.Codigo) + ', ' +
                                        GetCargoSql + ', ' + IIF(chkVencida.Checked, 'NULL', 'ACTUALDATE') + ', ' +
                                        IIF(chkDemorada.Checked, SqlInt(TimeToSeconds(DBDateTime) + 600), '0') +  ', ' +
                                        SqlString(IIF(chkAccesoSeguridad.Checked, 'S', 'N'), True) + ', ' +
                                        SqlString(IIF(chkUsuarioGenerico.Checked, 'S', 'N'), True) + ', ' +
                                        SqlValue(edSE_INTERNO.Text) + ', ' + SqlValue(edSE_MAIL.Text) + ', ' + SQLValue(fraSector.Id) + ', ' +
                                        SqlValue(fraEquipo.Id) + ', ' + SqlValue(fraUsuarioJefe.Codigo) + ', SYSDATE, ' +
                                        SqlValue(Sesion.UserId) + ', ' + SqlInt(fraRelacionLaboral.Id) + ', ' + SqlInt(fraNivelCobranzas.Id) + ', ' +
                                        SqlValue(edNotas.Lines.Text) + ')'
      else
      begin
        sSQL :=
          'UPDATE USE_USUARIOS' +
            ' SET SE_NOMBRE = ' + SqlString(edNombre.Text, True) + ',' +
                ' SE_INTERNO = ' + SqlString(edSE_INTERNO.Text, True) + ',' +
                  IIF(edClave.Text = '********', '', 'SE_CLAVE = ENCRIPTAR(''' + edClave.Text + '''),');

        if (chkDemorada.Checked <> (sdqDatosSE_TIEMPOESPERA.AsInteger > 0)) then
        begin
          if chkDemorada.Checked then
            sSQL := sSQL + ' SE_TIEMPOESPERA = ' + SqlInt(TimeToSeconds(DBDateTime) + 600) + ','
          else
            sSQL := sSQL + ' SE_TIEMPOESPERA = 0,';
        end;

        if (chkVencida.Checked  <> (sdqDatosSE_FECHAMOD.IsNull or (sdqDatosSE_FECHAMOD.AsDateTime < FFechaVenc))) then
        begin
          if chkVencida.Checked then
            sSQL := sSQL + ' SE_FECHAMOD = NULL,' //(SELECT ACTUALDATE - SS_DIASEXP FROM USS_PARAMETROS),'
          else
            sSQL := sSQL + ' SE_FECHAMOD = ACTUALDATE,';
        end;

        sSQL := sSQL + ' SE_PERFIL = ' + SqlValue(fraPerfiles.edCodigo.Text) + ',' +
                       ' SE_SECTOR = ' + SqlValue(fraSectores.Codigo) + ',' +
                       ' SE_DELEGACION = ' + SqlValue(fraDelegacion.Codigo) + ',' +
                       ' SE_CARGO = ' + GetCargoSql + ',' +
                       ' SE_MAIL = ' + SqlValue(edSE_MAIL.Text) + ',' +
                       ' SE_ACCESOSEGURIDAD = ' + SqlValue(String(IIF(chkAccesoSeguridad.Checked, 'S', 'N'))) + ', ' +
                       ' SE_USUARIOGENERICO = ' + SqlValue(String(IIF(chkUsuarioGenerico.Checked, 'S', 'N'))) + ', ' +
                       ' SE_IDSECTOR = ' + SQLValue(fraSector.Id) + ', ' +
                       ' SE_CONTRATO = ' + SqlInt(fraRelacionLaboral.Id) + ', ' +
                       ' SE_PC = ' + SQLValue(fraEquipo.Id) + ', ' +
                       ' SE_RESPONDEA = ' + SQLValue(fraUsuarioJefe.Codigo) + ', ' +
                       ' SE_USUMODIF = ' + SQLValue(Sesion.UserID) + ', ' +
                       ' SE_FECHAMODIF = SYSDATE, ' +
                       ' SE_NOTAS = ' + SqlValue(edNotas.Lines.Text) + ',' +
                       ' SE_IDNIVELAUTORIZA = ' + SqlValue(fraNivelCobranzas.Codigo) +
                 ' WHERE SE_USUARIO = ' + SqlValue(edUsuario.Text);
      end;

      EjecutarSql(sSQL);
      if (fpUsuario.Tag = 1) and (lbUsuCopia.Visible) then
      begin // Cuando es un Usuario Copiado

        {*** Copio los PERMISOS ***}
        sSQL := 'DELETE ' +
                  'FROM USG_SEGURIDAD S1' +
                ' WHERE SG_USUARIO = :Usuario ' +
                  ' AND NOT EXISTS (SELECT 1' +
                                    ' FROM USG_SEGURIDAD S2' +
                                   ' WHERE S1.SG_APLICACION = S2.SG_APLICACION' +
                                     ' AND S1.SG_FORMULARIO = S2.SG_FORMULARIO' +
                                     ' AND S1.SG_CONTROL = S2.SG_CONTROL' +
                                     ' AND S2.SG_USUARIO = :UsuarioCopia)';
        EjecutarSqlEx(sSQL, [edUsuario.Text, lbUsuCopia.Caption]);

        {*** Copio los perfiles del AGA ***}
        sSQL := 'INSERT INTO ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                      '(AU_ID, AU_IDTIPOARCHIVO, AU_USUARIO, AU_USUALTA, AU_FECHAALTA) ' +
                'SELECT ARCHIVO.SEQ_RAU_ID.NEXTVAL, A.AU_IDTIPOARCHIVO, :Usuario, :UsuarioAlta, SYSDATE ' +
                  'FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO A ' +
                 'WHERE A.AU_USUARIO = :UsuarioCopia ' +
                   'AND A.AU_FECHABAJA IS NULL ' +
                   'AND NOT EXISTS(SELECT 1 ' +
                                    'FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO B ' +
                                   'WHERE B.AU_IDTIPOARCHIVO = A.AU_IDTIPOARCHIVO ' +
                                     'AND B.AU_USUARIO = :Usuario ' +
                                     'AND B.AU_FECHABAJA IS NULL)';
        EjecutarSqlEx(sSQL, [edUsuario.Text, Sesion.UserID, lbUsuCopia.Caption, edUsuario.Text]);

        {*** Copio los formularios del FAX ***}
        sSQL := 'INSERT INTO art.ffu_formulariousuario ' +
                      '(fu_idformulario, fu_usuario, fu_fechaalta, fu_usualta, fu_sololectura) ' +
                'SELECT fu_idformulario, :Usuario, SYSDATE, :UsuarioAlta, fu_sololectura ' +
                  'FROM art.ffu_formulariousuario a ' +
                 'WHERE a.fu_usuario = :usuariocopia ' +
                   'AND NOT EXISTS(SELECT 1 ' +
                                    'FROM art.ffu_formulariousuario b ' +
                                   'WHERE b.fu_idformulario = a.fu_idformulario ' +
                                     'AND b.fu_usuario = :usuario ' +
                                     'AND b.fu_fechabaja is null)';
        EjecutarSqlEx(sSQL, [edUsuario.Text, Sesion.UserID, lbUsuCopia.Caption, edUsuario.Text]);

        {*** Copio los perfiles para el ImpoExpo ***}
        sSQL := 'INSERT INTO impoexpo.ipu_procesousuario ' +
                      '(pu_idproceso, pu_usuario) ' +
                'SELECT pu_idproceso, :Usuario ' +
                  'FROM impoexpo.ipu_procesousuario a ' +
                 'WHERE a.pu_usuario = :UsuarioCopia ' +
                   'AND NOT EXISTS(SELECT 1 ' +
                                    'FROM impoexpo.ipu_procesousuario b ' +
                                   'WHERE b.pu_idproceso = a.pu_idproceso ' +
                                     'AND b.pu_usuario = :Usuario)';
        EjecutarSqlEx(sSQL, [edUsuario.Text, lbUsuCopia.Caption, edUsuario.Text]);
      end;

      RefreshAndLocate(sdqDatos, ['SE_USUARIO'], [edUsuario.Text]);

      fpUsuario.ModalResult := mrOk;
    except
      on E: Exception do
        ErrorMsg(E);
    end;
  end;
end;

procedure TfrmManUsuarios.edClaveChange(Sender: TObject);
begin
  if (edClave.Text <> edVerificacion.Text) then
  begin
    edClave.Font.Color        := clRed;
    edVerificacion.Font.Color := clRed;
  end
  else
  begin
    edClave.Font.Color        := clWindowText;
    edVerificacion.Font.Color := clWindowText;
  end;
end;

procedure TfrmManUsuarios.edClaveExit(Sender: TObject);
begin
  if edClave.Text = '' then
    edVerificacion.Text := '';
end;

procedure TfrmManUsuarios.SeguridadAfterExecute(Sender: TObject);
begin
  btnFiltrosLimpiarClick(nil);
  tbRefrescarClick(nil);
end;

procedure TfrmManUsuarios.DBGridDblClick(Sender: TObject);
begin
  if tbModificar.Enabled then
    tbModificarClick(nil);
end;

procedure TfrmManUsuarios.tbFiltrosClick(Sender: TObject);
begin
  if fpFiltros.ShowModal = mrOk then
    tbRefrescarClick(nil);
end;

procedure TfrmManUsuarios.ilbFiltrosImageClick(Sender: TObject; Index: Integer);
var
  iItemImage: Integer;
begin
  iItemImage := ilbFiltros.ItemImage[Index];
  Inc(iItemImage);
  if iItemImage > 1 then
    iItemImage := -1;

  ilbFiltros.ItemImage[Index] := iItemImage;
{
     if iItemImage = 2 Then
        for i := 0 to ilbFiltros.Items.Count -1 do
            if (i <> Index) and (ilbFiltros.ItemImage[i] = 2) Then
               ilbFiltros.ItemImage[i] := 0;
}
end;

procedure TfrmManUsuarios.btnFiltrosLimpiarClick(Sender: TObject);
var
  i: Integer;
begin
  ilbFiltros.ItemImage[0] := 1;
  ilbFiltros.ItemImage[ilbFiltros.Items.Count - 1] := 1;

  for i := 1 to ilbFiltros.Items.Count - 2 do
    ilbFiltros.ItemImage[i] := -1;

  fraUsuFiltros.Limpiar('');
  edSE_FECHAALTADesde.Clear;
  edSE_FECHAALTAHasta.Clear;
  edSE_FECHAALTADesde.Clear;
  edSE_FECHABAJAHasta.Clear;
end;

procedure TfrmManUsuarios.tbExportarClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;

procedure TfrmManUsuarios.tbImprimirClick(Sender: TObject);
begin
  if MsgBox('¿Desea imprimir un listado con los datos seleccionados?', MB_ICONQUESTION + MB_YESNO, 'Confirmar la Operación') = IDYES then
  begin
    QueryPrint.SetGridColumns(DBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);
    QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
    QueryPrint.Print;
  end;
end;

procedure TfrmManUsuarios.btnPermisosClick(Sender: TObject);
begin
  with TfrmPermisosUsuario.Create(Self) do
  begin
    fraUsuarioMuestra.SetColors(clWindowText, clBtnFace);
    fraUsuarioMuestra.Enabled := False;
    fraUsuarioMuestra.Cargar(edUsuario.Text);
    fraUsuarioCopia.Sql := fraUsuarioCopia.Sql + ' AND SE_USUARIO <> ' + SQLString(edUsuario.Text, True) + ' ';
    ShowModal;
    Free;
  end;
end;

procedure TfrmManUsuarios.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
var
  bBaja: Boolean;
begin
  if AreIn(Field.DataField, ['SE_USUARIO', 'SE_NOMBRE']) and (not sdqDatosSE_FECHABAJA.IsNull) then
    bBaja := True
  else if (Field.DataField = 'PF_DESCRIPCION') and (not sdqDatosPF_FECHABAJA.IsNull) then
    bBaja := True
  else if (Field.DataField = 'SC_DESCRIPCION') and (not sdqDatosSC_FECHABAJA.IsNull) then
    bBaja := True
  else
    bBaja := False;

  if bBaja Then
    AFont.Style := [fsStrikeOut];
end;

procedure TfrmManUsuarios.sdqDatosAfterClose(DataSet: TDataSet);
begin
  inherited;
  lbTotal.Caption := '';
end;

procedure TfrmManUsuarios.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  try
    DynColWidthsByData(DBGrid, 10);
  except
  end;
  lbTotal.Caption := IntToStr(sdqDatos.RecordCount);
end;

procedure TfrmManUsuarios.btnDigitalizacionClick(Sender: TObject);
begin
  with GetQueryEx('SELECT AU_IDTIPOARCHIVO FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO WHERE AU_FECHABAJA IS NULL AND AU_USUARIO = :USUARIO', [edUsuario.Text]) do
  try
    clbDigitalizacion.ClearChecks;
    while not Eof do
    begin
      clbDigitalizacion.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;

  if fpDigitalizacion.ShowModal = mrOk then
    CargarDatos;
end;

procedure TfrmManUsuarios.btnAceptarDigitalizacionClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  if MsgBox('¿Confirma la modificación de todos los Perfiles?', MB_ICONQUESTION + MB_YESNO, 'Confirmar la Operación') = IDYES then
    begin
      BeginTrans(True);
      try
        for i := 0 to clbDigitalizacion.Count - 1 do
          begin
            if clbDigitalizacion.Checked[i] then
              EjecutarSQLSTEx('INSERT INTO ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                              '(AU_ID, AU_IDTIPOARCHIVO, AU_USUARIO, AU_USUALTA, AU_FECHAALTA) ' +
                              'SELECT ARCHIVO.SEQ_RAU_ID.NEXTVAL, :IDTIPOARCHIVO, :USUARIO, :USUALTA, SYSDATE ' +
                                'FROM DUAL ' +
                               'WHERE NOT EXISTS(SELECT 1 ' +
                                                  'FROM ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                                 'WHERE AU_IDTIPOARCHIVO = :IDTIPOARCHIVO ' +
                                                   'AND AU_USUARIO = :USUARIO ' +
                                                   'AND AU_FECHABAJA IS NULL)',
                               [clbDigitalizacion.Values[i], edUsuario.Text, Sesion.UserId])

            else
              EjecutarSqlSTEx('UPDATE ARCHIVO.RAU_TIPOARCHIVOUSUARIO ' +
                                 'SET AU_USUBAJA = :USUARIO, AU_FECHABAJA = SYSDATE ' +
                               'WHERE AU_USUARIO = :USUARIO AND AU_FECHABAJA IS NULL AND AU_IDTIPOARCHIVO = :IDTIPOARCHIVO', [Sesion.UserId, edUsuario.Text, clbDigitalizacion.Values[i]]);
          end;

        CommitTrans(True);
        fpDigitalizacion.ModalResult := mrOk;
      except
        RollBack;
        fpDigitalizacion.ModalResult := mrCancel;
      end;
    end;  
end;

procedure TfrmManUsuarios.tbFaxClick(Sender: TObject);
begin
  Abrir(TfrmManFFU_FORMULARIOUSUARIO, frmManFFU_FORMULARIOUSUARIO, tmvMDIChild, nil);
  frmManFFU_FORMULARIOUSUARIO.fraFU_USUARIO.Codigo := sdqDatosSE_USUARIO.AsString;
  frmManFFU_FORMULARIOUSUARIO.RefreshData;
  Abrir(TfrmManFFU_FORMULARIOUSUARIO, frmManFFU_FORMULARIOUSUARIO, tmvModal, nil);
end;

procedure TfrmManUsuarios.btnFaxClick(Sender: TObject);
begin
  Abrir(TfrmManFFU_FORMULARIOUSUARIO, frmManFFU_FORMULARIOUSUARIO, tmvMDIChild, nil);
  frmManFFU_FORMULARIOUSUARIO.fraFU_USUARIO.Codigo := edUsuario.Text;
  frmManFFU_FORMULARIOUSUARIO.RefreshData;
  Abrir(TfrmManFFU_FORMULARIOUSUARIO, frmManFFU_FORMULARIOUSUARIO, tmvModal, nil);
end;

procedure TfrmManUsuarios.btnImpoExpoClick(Sender: TObject);
begin
  with GetQueryEx('SELECT pu_idproceso FROM IMPOEXPO.IPU_PROCESOUSUARIO WHERE PU_USUARIO = :USUARIO', [edUsuario.Text]) do
  try
    clbImpoExpo.ClearChecks;
    while not Eof do
    begin
      clbImpoExpo.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;

  if fpImpoExpo.ShowModal = mrOk then
    CargarDatos;
end;

procedure TfrmManUsuarios.btnAceptarImpoExpoClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  BeginTrans(True);
  try
    EjecutarSqlSTEx('DELETE FROM IMPOEXPO.IPU_PROCESOUSUARIO WHERE PU_USUARIO = :USUARIO', [edUsuario.Text]);
    for i := 0 to clbImpoExpo.CheckCount - 1 do
      EjecutarSQLSTEx('INSERT INTO IMPOEXPO.IPU_PROCESOUSUARIO (PU_USUARIO, PU_IDPROCESO) ' +
                      'VALUES (:USUARIO, :PROCESO)', [edUsuario.Text, clbImpoExpo.ValuesChecked[i]]);

    CommitTrans(True);
    fpImpoExpo.ModalResult := mrOk;
  except
    RollBack;
    fpImpoExpo.ModalResult := mrCancel;
  end;
end;

procedure TfrmManUsuarios.fpUsuarioShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([btnPermisos, btnDigitalizacion, btnFax, btnImpoExpo], fpUsuario.Tag = 1);
end;

procedure TfrmManUsuarios.fraNivelCobranzasPropiedadesChange(Sender: TObject);
begin
  inherited;
  InfoHint(fraUsuDatosABM.fraNivelCobranzas.edCodigo, 'Cuidado!' + CRLF + 'Este dato se utiliza en la autorización de los planes de pago.');
end;

procedure TfrmManUsuarios.mnuNoSeleccionarNingunoClick(Sender: TObject);
begin
  clbImpoExpo.UncheckAll;
end;

procedure TfrmManUsuarios.mnuSeleccionarTodosClick(Sender: TObject);
begin
  clbImpoExpo.CheckAll;
end;

end.
