{-----------------------------------------------------------------------------
 Unit Name: unManPreventores
 Author:
 Date:
 Purpose:   Mantenimiento de Preventores
 History:
    Author:      racastro
    Date:        Mar-2007
    Description: Manejo de perfiles
-----------------------------------------------------------------------------}

unit unManPreventores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, PatternEdit, ExComboBox, unDmPrincipal, unSesion,
  SqlFuncs, CustomDlgs, Strfuncs, AnsiSql, unArtFrame, General,
  unFraCodigoDescripcion, RXCtrls, JvgGroupBox, IntEdit, unArtDBAwareFrame,
  unfraPerfilPreventor, VclExtra, Internet, unFraDomicilio,
  unFraDomicilioGIS, unfraUsuarios, md5, RxPlacemnt;

type
  TfrmAbmPreventores = class(TfrmCustomGridABM)
    fpWebPreventor: TFormPanel;
    Bevel1: TBevel;
    Label13: TLabel;
    btnAceptarWeb: TButton;
    btnCancelarWeb: TButton;
    btnWEB: TButton;
    chkNoMostrarBajas: TCheckBox;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label5: TLabel;
    edClave: TEdit;
    Label6: TLabel;
    fpCP: TFormPanel;
    btnAsignarCP: TButton;
    btnTerminarCP: TButton;
    chlCP: TRxCheckListBox;
    sdqCPAsignados: TSDQuery;
    fraPreventorCP: TfraCodigoDescripcion;
    Label9: TLabel;
    Label10: TLabel;
    ckbTercerizado: TCheckBox;
    btnCP: TButton;
    ckbCCmail: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lblNombre: TLabel;
    lblCodigo: TLabel;
    edCodigoPreventor: TPatternEdit;
    edNombre: TEdit;
    cbTipoMatricula: TExComboBox;
    edNroMatricula: TPatternEdit;
    edTitulo: TEdit;
    edInstOtorgante: TEdit;
    fraRoles: TfraCodigoDescripcion;
    fraSupervisores: TfraCodigoDescripcion;
    fraPerfil: TfraCodigoDescripcion;
    lblPerfil: TLabel;
    ToolBar2: TToolBar;
    tbVerPerfil: TToolButton;
    fpPerfilesPreventor: TFormPanel;
    Bevel2: TBevel;
    Label11: TLabel;
    btnAceptarPerfil: TButton;
    Button3: TButton;
    edNombrePerfil: TEdit;
    gbCondiciones: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tbNuevaCond: TToolButton;
    tbModificarCond: TToolButton;
    tbEliminarCond: TToolButton;
    pcCondiciones: TPageControl;
    fpCondicion: TFormPanel;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    tbGuardar: TToolButton;
    tbLimpiarCondicion: TToolButton;
    tbSeleccionarTodo: TToolButton;
    tbSalirPerfil: TToolButton;
    fraPerfilPreventorABM: TfraPerfilPreventor;
    fraPerfilFiltro: TfraCodigoDescripcion;
    Label12: TLabel;
    edEmail: TEdit;
    Label15: TLabel;
    tbAplicarPerfiles: TToolButton;
    fraDomicilioGISPreventor: TfraDomicilioGIS;
    lbNro: TLabel;
    edCargaMax: TEdit;
    Label16: TLabel;
    fraAuditor: TfraCodigoDescripcion;
    fraUsuarioWeb: TfraUsuario;
    chkForzarClave: TCheckBox;
    edUsuarioWeb: TEdit;
    chkUsuExterno: TCheckBox;
    tbCantidadVisitas: TToolButton;
    tbPreventoresConsultoras: TToolButton;
    fraUsuBackOffice: TfraCodigoDescripcion;
    Label14: TLabel;
    procedure btnWebClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarWebClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraPreventorFiltrocmbDescripcionDropDown(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraRolescmbDescripcionChange(Sender: TObject);
    procedure btnCPClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnAsignarCPClick(Sender: TObject);
    procedure LeerCPAsignados;
    procedure chlCPDblClick(Sender: TObject);
    procedure fraPreventorCPcmbDescripcionDropDown(Sender: TObject);
    procedure fraSupervisorescmbDescripcionDropDown(Sender: TObject);
    procedure tbVerPerfilClick(Sender: TObject);
    procedure fpPerfilesPreventorShow(Sender: TObject);
    procedure btnAceptarPerfilClick(Sender: TObject);
    procedure tbNuevaCondClick(Sender: TObject);
    procedure tbModificarCondClick(Sender: TObject);
    procedure tbEliminarCondClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbLimpiarCondicionClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure tbSalirPerfilClick(Sender: TObject);
    procedure tbAplicarPerfilesClick(Sender: TObject);
    procedure edEmailKeyPress(Sender: TObject; var Key: Char);
    procedure fpWebPreventorShow(Sender: TObject);
    procedure btnCancelarWebClick(Sender: TObject);
    procedure chkUsuExternoClick(Sender: TObject);
    procedure tbCantidadVisitasClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbPreventoresConsultorasClick(Sender: TObject);
  private
    FClave: string;
    FUsuarioWeb: string;
    FUsuExterno: boolean;
    FForzarClave: boolean;
    FPerfilAnterior: integer;
    FIdPreventor: integer;
    procedure fraPerfilChange(Sender: TObject);
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function ValidarWeb: Boolean;
    procedure GuardarCondicionesPerfil(aIdPreventor: integer; aIdPerfilNuevo: integer; aIdPerfilAnterior: integer);
    procedure EliminarCondicionesPerfil(aIdPreventor: integer);
    procedure CargarCondicionesPreventor(aIdPerfil, aIdPreventor: integer);
  end;

var
  frmAbmPreventores: TfrmAbmPreventores;

implementation

{$R *.DFM}

{ TfrmAbmPreventores }
uses unManCantidadVisitasPreventor, unManPreventorConsultora;

procedure TfrmAbmPreventores.ClearControls;
begin
  edCodigoPreventor.Text := '';
  edNombre.Text := '';
  cbTipoMatricula.ItemIndex := -1;
  edNroMatricula.Text := '';
  edTitulo.Text := '';
  edInstOtorgante.Text := '';
  fraUsuarioWeb.Clear;
  edClave.Text := '';
  edUsuarioWeb.Text := '';
  chkForzarClave.Checked := false;
  chkUsuExterno.Checked := false;
  ckbCCmail.Checked := false;
  ckbTercerizado.Checked := false;
  fraSupervisores.Enabled := false;
  fraSupervisores.Clear;
  fraRoles.Clear;
  fraAuditor.Clear;
  fraPerfil.Clear;
  fraDomicilioGISPreventor.Clear;
  fraUsuBackOffice.Clear;
  FPerfilAnterior := 0;
  edCargaMax.Text := '';
end;

function TfrmAbmPreventores.DoABM: Boolean;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('IT_ID', sdqConsulta.FieldByName('IT_ID').AsInteger );
      Sql.Fields.Add('IT_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('IT_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;

      EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                  ' set ep_fechabaja = sysdate, ' +
                  ' ep_idestado = ' + SqlValue(4) + //Motivo preventor dado de baja
                  ' where ep_idfirmante = ' + SqlValue(sdqConsulta.FieldByName('IT_ID').AsInteger));

(*      if MsgBox('¿Desea reasignar las empresas al Preventor anterior?',
                MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
        EjecutarSqlST('UPDATE hys.hep_estabporpreventor hep ' +
                      '   SET hep.ep_itcodigo = (SELECT hhe.he_itcodigo ' +
                      '                            FROM hys.hhe_histestabporpreventor hhe ' +
                      '                           WHERE hhe.he_id = (SELECT MAX(h.he_id) ' +
                      '                                                FROM hys.hhe_histestabporpreventor h, art.pit_firmantes p ' +
                      '                                               WHERE h.he_cuit = ep_cuit ' +
                      '                                                 AND h.he_estableci = ep_estableci ' +
                      '                                                 AND h.he_itcodigo <> hep.ep_itcodigo ' +
                      '                                                 AND p.it_codigo = h.he_itcodigo ' +
                      '                                                 AND p.it_fechabaja IS NULL ' +
                      '                                                 AND p.it_tercerizado <> 1)) ' +
                      ' WHERE hep.ep_itcodigo = ' + SqlValue (sdqConsulta.FieldByName('it_codigo').AsString) +
                      '   AND hep.ep_fechabaja IS NULL ')
*)
    end else begin
      Sql.Fields.Add('IT_NOMBRE', edNombre.Text);
      Sql.Fields.Add('IT_TIPO_MATRICULA', cbTipoMatricula.Value );
      Sql.Fields.Add('IT_MATRICULA', edNroMatricula.Text);
      Sql.Fields.Add('IT_TITULO', edTitulo.Text);
      Sql.Fields.Add('IT_INSTITUCION_OTORGANTE', edInstOtorgante.Text);

      if chkUsuExterno.Checked then
        Sql.Fields.Add('IT_USUARIO', edUsuarioWeb.Text)
      else
        Sql.Fields.Add('IT_USUARIO', fraUsuarioWeb.UserID);
//      Sql.Fields.Add('IT_CLAVE', MD5Print(MD5String(edClave.Text)));
      Sql.Fields.Add('IT_CLAVE', edClave.Text);
      Sql.Fields.Add('IT_FORZARCLAVE', chkForzarClave.Checked);
      Sql.Fields.Add('IT_USUARIOEXTERNO', chkUsuExterno.Checked);


      Sql.Fields.Add('it_idsupervisor', fraSupervisores.Codigo);
      Sql.Fields.Add('it_idrolpreventor', fraRoles.Codigo);
      Sql.Fields.Add('IT_IDAUDITOR', fraAuditor.Codigo);
      Sql.Fields.Add('IT_USUBACKOFFICE', fraUsuBackOffice.Codigo);
      Sql.Fields.Add('it_ccmailpqdatos', String(iif(ckbCCmail.Checked, 'S', 'N')));
      Sql.Fields.Add('it_tercerizado', Ord(ckbTercerizado.Checked));
      Sql.Fields.Add('it_idperfil', fraPerfil.Codigo);
      Sql.Fields.Add('IT_EMAIL', edEmail.Text);

      Sql.Fields.Add('it_calle', fraDomicilioGISPreventor.Calle);
      Sql.Fields.Add('it_numero', fraDomicilioGISPreventor.Numero);
      Sql.Fields.Add('it_piso', fraDomicilioGISPreventor.Piso);
      Sql.Fields.Add('it_departamento', fraDomicilioGISPreventor.Departamento);
      Sql.Fields.Add('it_cpostal', fraDomicilioGISPreventor.CodigoPostal);
      Sql.Fields.Add('it_cpostala', fraDomicilioGISPreventor.CPA);
      Sql.Fields.Add('it_localidad', fraDomicilioGISPreventor.Localidad);
      Sql.Fields.Add('it_provincia', fraDomicilioGISPreventor.Prov);
      Sql.Fields.Add('it_cargamax', edCargaMax.Text);

      if ModoABM = maAlta Then
      begin
        if (FIdPreventor = -1) then
          FIdPreventor := GetSecNextVal('HYS.SEQ_PIT_ID')
        else
          Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('IT_ID', FIdPreventor);
        edCodigoPreventor.Text := IntToStr(FIdPreventor);
        Sql.Fields.Add('IT_CODIGO', 'RG' + String(SQL.PrimaryKey.Items[0].Value));
        Sql.Fields.Add('IT_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('IT_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('IT_ID', sdqConsulta.FieldByName('IT_ID').AsInteger);
        Sql.Fields.Add('IT_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('IT_FECHAMODIF', exDateTime );
        Sql.Fields.Add('IT_USUBAJA', exNull );
        Sql.Fields.Add('IT_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );

    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el preventor.');
    end;
  end;
end;

procedure TfrmAbmPreventores.LoadControls;
begin
  edCodigoPreventor.Text := sdqConsulta.fieldbyname('IT_ID').AsString;
  edNombre.Text := sdqConsulta.fieldbyname('IT_NOMBRE').AsString;
  cbTipoMatricula.Value := sdqConsulta.fieldbyname('IT_TIPO_MATRICULA').AsString;
  edNroMatricula.Text := sdqConsulta.fieldbyname('IT_MATRICULA').AsString;
  edTitulo.Text := sdqConsulta.fieldbyname('IT_TITULO').AsString;
  edInstOtorgante.Text := sdqConsulta.fieldbyname('IT_INSTITUCION_OTORGANTE').AsString;

  edUsuarioWeb.Text := '';
  fraUsuarioWeb.Clear;

  if (sdqConsulta.fieldbyname('IT_USUARIOEXTERNO').AsString = 'S') then
    edUsuarioWeb.Text := sdqConsulta.fieldbyname('IT_USUARIO').AsString
  else
    fraUsuarioWeb.Cargar(sdqConsulta.fieldbyname('IT_USUARIO').AsString);

  chkUsuExterno.Checked := sdqConsulta.fieldbyname('IT_USUARIOEXTERNO').AsString = 'S';
  chkUsuExternoClick(self);
  FUsuExterno := chkUsuExterno.Checked;
  FUsuarioWeb := fraUsuarioWeb.UserID;
  edClave.Text := sdqConsulta.fieldbyname('IT_CLAVE').AsString;
  FClave := edClave.Text;
  chkForzarClave.Checked := (sdqConsulta.fieldbyname('IT_FORZARCLAVE').AsString = 'S');
  FForzarClave := chkForzarClave.Checked;


  edEmail.Text := sdqConsulta.fieldbyname('IT_EMAIL').AsString;
  ckbCCmail.Checked := sdqConsulta.fieldbyname('it_ccmailpqdatos').AsString = 'S';
  ckbTercerizado.Checked := sdqConsulta.fieldbyname('it_tercerizado').AsInteger = 1;
  fraRoles.Codigo := sdqConsulta.fieldbyname('it_idrolpreventor').AsString;
  fraAuditor.Codigo := sdqConsulta.fieldbyname('IT_IDAUDITOR').AsString;
  fraUsuBackOffice.Codigo := sdqConsulta.fieldbyname('IT_USUBACKOFFICE').AsString;
  fraRolescmbDescripcionChange(nil);
  fraSupervisores.Codigo := sdqConsulta.fieldbyname('it_idsupervisor').AsString;
  FPerfilAnterior := sdqConsulta.fieldbyname('it_idperfil').AsInteger;
  fraPerfil.Codigo := sdqConsulta.fieldbyname('it_idperfil').AsString;
  edCargaMax.Text := sdqConsulta.fieldbyname('it_cargamax').AsString;

  fraDomicilioGISPreventor.Cargar(sdqConsulta.fieldbyname('it_calle').AsString,
                                  sdqConsulta.fieldbyname('it_cpostal').AsString,
                                  sdqConsulta.fieldbyname('it_localidad').AsString,
                                  sdqConsulta.fieldbyname('it_numero').AsString,
                                  sdqConsulta.fieldbyname('it_piso').AsString,
                                  sdqConsulta.fieldbyname('it_departamento').AsString,
                                  sdqConsulta.fieldbyname('it_provincia').AsString,
                                  sdqConsulta.fieldbyname('it_cpostala').AsString);

end;

procedure TfrmAbmPreventores.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName('it_tercerizado').AsInteger = 1 then
    tbPreventoresConsultoras.Enabled := True
  else
    tbPreventoresConsultoras.Enabled := False;
end;

function TfrmAbmPreventores.Validar: Boolean;
begin
  Result := VerificarMultiple(['ABM de Preventores',
              fraRoles,
              fraRoles.IsSelected,
              'Debe indicarse el rol del preventor',
              edNombre,
              not IsEmptyString(edNombre.text),
              'Debe especificar el nombre del preventor.'
//              edEmail,
//              not IsEmptyString(edEmail.text),
//              'Debe especificar la dirección de Email.'
            ]);
  Verificar(not IsEmptyString(edEmail.text) and not IsEMails(edEmail.text), edEmail, 'Mail inválido');
end;

procedure TfrmAbmPreventores.btnWebClick(Sender: TObject);
begin
  fpWebPreventor.ShowModal;
end;

procedure TfrmAbmPreventores.FormCreate(Sender: TObject);
begin
  inherited;

  Sql.TableName := 'ART.PIT_FIRMANTES';
  FieldBaja := 'it_fechabaja';
  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraAuditor do
  begin
    TableName := 'ART.MAU_AUDITORES';
    FieldDesc := 'AU_NOMBRE';
    FieldID := 'AU_AUDITOR';
    FieldCodigo := 'AU_AUDITOR';
    FieldBaja := 'AU_FBAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraUsuBackOffice do
  begin
    TableName := 'USE_USUARIOS';
    FieldDesc := 'SE_NOMBRE';
    FieldID := 'SE_ID';
    FieldCodigo := 'SE_USUARIO';
    FieldBaja := 'SE_FECHABAJA';
    CaseSensitive := false;
    ExtraCondition := ' AND SE_SECTOR in( ''HYS'',''MEDLAB'') AND SE_USUARIOGENERICO = ''N'' ';
    ShowBajas := FALSE;
  end;


  with fraRoles do
  begin
    TableName := 'hys.hrp_rolpreventor';
    FieldDesc := 'rp_descripcion';
    FieldID := 'rp_id';
    FieldCodigo := 'rp_id';
    FieldBaja := 'rp_fechabaja';
    CaseSensitive := false;
    ShowBajas := false;
    ExtraCondition := ' AND (rp_fechabaja IS NULL)';
    OnChange := fraRolescmbDescripcionChange;
  end;

  with fraPerfilFiltro do
  begin
    TableName := 'hys.hpf_perfil';
    FieldDesc := 'pf_descripcion';
    FieldID := 'pf_id';
    FieldCodigo := 'pf_id';
    FieldBaja := 'pf_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraPerfil do
  begin
    TableName := 'hys.hpf_perfil';
    FieldDesc := 'pf_descripcion';
    FieldID := 'pf_id';
    FieldCodigo := 'pf_id';
    FieldBaja := 'pf_fechabaja';
    CaseSensitive := false;
    ShowBajas := false;
    OnChange := fraPerfilChange;
  end;

  tbSalir.Left := tbPreventoresConsultoras.Left + 1;
  chkNoMostrarBajas.Checked := true;
  tbRefrescarClick(Sender);

  fraUsuarioWeb.UsuariosGenericos := false;
end;

function TfrmAbmPreventores.ValidarWeb: Boolean;
begin
  Verificar((not fraUsuarioWeb.IsSelected) and (edUsuarioWeb.Text = '') , fraUsuarioWeb, 'Debe seleccionar un usuario.');
  Verificar(trim(edClave.Text) = '', edClave, 'Debe ingresar una clave.');
  Result := true;
end;

procedure TfrmAbmPreventores.btnAceptarWebClick(Sender: TObject);
begin
  if ValidarWeb then
    fpWebPreventor.ModalResult := mrOk;
end;

procedure TfrmAbmPreventores.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add('SELECT p.it_id, p.it_nombre, p.it_codigo, ' +
                      '       DECODE (p.it_tipo_matricula, ' +
                      '               1, ''RUGU'', ' +
                      '               2, ''RUTH'', ' +
                      '               3, ''Matrícula Profesional'', ' +
                      '               NULL ' +
                      '              ) tipo, ' +
                      '       p.it_matricula, p.it_institucion_otorgante, p.it_titulo, ' +
                      '       p.it_tipo_matricula, p.it_usuario, p.it_nivel, p.it_fechabaja, ' +
                      '       p.it_email, s.it_nombre supervisor , r.rp_descripcion rol, ' +
                      '       p.it_idsupervisor, p.it_idrolpreventor, p.it_ccmailpqdatos, ' +
                      '       p.it_tercerizado, p.it_idperfil, pf_descripcion perfil, ' +
                      '       p.it_calle, p.it_numero, p.it_piso, '+
                      '       p.it_departamento, p.it_cpostal, p.it_cpostala, p.it_localidad, '+
                      '       p.it_provincia, '+
                      '       p.it_cargamax, p.it_idauditor, p.it_clave, p.it_forzarclave, '+
                      '       p.it_usuarioexterno, p.it_usubackoffice ' +
                      '  FROM art.pit_firmantes p, hys.hrp_rolpreventor r, art.pit_firmantes s, hys.hpf_perfil ' +
                      ' WHERE r.rp_id(+) = p.it_idrolpreventor ' +
                      '   AND pf_id(+) = p.it_idperfil ' +
                      '   AND s.it_id(+) = p.it_idsupervisor '
                     );

  if chkNoMostrarBajas.Checked then sdqConsulta.SQL.Add(' AND p.it_fechabaja IS NULL ');

  if fraPreventorFiltro.IsSelected then sdqConsulta.SQL.Add(' AND p.it_codigo = ' + SqlValue(fraPreventorFiltro.Codigo));

  if fraPerfilFiltro.IsSelected then sdqConsulta.SQL.Add(' AND p.it_idperfil = ' + SqlValue(fraPerfilFiltro.Codigo));


  inherited;
end;

procedure TfrmAbmPreventores.fraPreventorFiltrocmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorFiltro.cmbDescripcion.Text := '%' + fraPreventorFiltro.cmbDescripcion.Text;
  fraPreventorFiltro.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] = '%') then
      fraPreventorFiltro.cmbDescripcion.Text := copy(fraPreventorFiltro.cmbDescripcion.Text, 2, length(fraPreventorFiltro.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmAbmPreventores.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraPreventorFiltro.Clear;
  chkNoMostrarBajas.Checked := false;
  fraSupervisores.Clear;
  fraRoles.Clear;
  fraPerfilFiltro.Clear;
end;

procedure TfrmAbmPreventores.fraRolescmbDescripcionChange(Sender: TObject);
begin
  inherited;

  with fraSupervisores do
  begin
      TableName := 'art.pit_firmantes';
      FieldDesc := 'it_nombre';
      FieldID := 'it_id';
      FieldCodigo := 'it_id';
      FieldBaja := 'it_fechabaja';
      CaseSensitive := false;
      ShowBajas := false;
      ExtraCondition := ' AND (it_fechabaja IS NULL)' +
                        ' AND it_id <> ' + SqlValue (StrToInt('0'+Trim(edCodigoPreventor.Text))) +
                        ' AND it_idrolpreventor > ' + SqlValue (fraRoles.sdqDatos.FieldByName('id').AsString);
  end;

  if fraSupervisores.sdqDatos.Active then
    fraSupervisores.sdqDatos.Refresh;

  fraSupervisores.Clear;
  fraSupervisores.Enabled := fraRoles.Descripcion <> ''
end;

procedure TfrmAbmPreventores.LeerCPAsignados;
begin
  with fraPreventorCP do
  begin
    TableName := 'art.pit_firmantes';
    FieldDesc := 'it_nombre';
    FieldID := 'it_id';
    FieldCodigo := 'it_id';
    FieldBaja := 'it_fechabaja';
    CaseSensitive := false;
    ShowBajas := false;
    ExtraFields := ' , it_codigo ';
    ExtraCondition := ' AND it_fechabaja IS NULL' +
                      ' AND it_id <> ' + SqlValue (sdqConsulta.FieldByName('IT_ID').AsInteger);
    Clear
  end;

  chlCP.Items.Clear;

  with sdqCPAsignados do
  begin
    Close;
    sdqCPAsignados.ParamByName('ppreventor').Value := StrToIntDef(edCodigoPreventor.Text, 0);
    Open;

    while not EoF do
    begin
      chlCP.Items.AddObject (FieldByName ('pc_codigo').AsString,
                             TObject(FieldByName('cp_provincia').AsInteger));
      Next
    end;

    Close;
  end;
end;

procedure TfrmAbmPreventores.btnCPClick(Sender: TObject);
begin
  LeerCPAsignados;

  fpCP.ShowModal
end;

procedure TfrmAbmPreventores.fpAbmShow(Sender: TObject);
begin
  btnCP.Enabled := ModoABM <> maAlta;
  FIdPreventor := -1;
  inherited;
end;

procedure TfrmAbmPreventores.btnAsignarCPClick(Sender: TObject);
var
  i: integer;
begin
  VerificarMultiple(['Reasignación de Preventor',
                     fraPreventorCP,
                     fraPreventorCP.IsSelected,
                     'Debe indicarse el preventor.'
                    ]);

  for i:= 0 to chlCP.Items.Count-1 do
    if chlCP.Checked[i] then
    begin
      // Doy la baja a Preventor-CP-Provincia actual
      EjecutarSqlSt('UPDATE hys.hpc_preventorcpostal ' +
                    '   SET pc_fechabaja = SYSDATE, ' +
                    '       pc_usubaja = ' + SqlValue (Sesion.LoginName) +
                    ' WHERE pc_idpreventor = ' + SqlValue (StrToIntDef(edCodigoPreventor.Text, 0)) +
                    '   AND pc_provincia = ' + SqlValue (Integer(chlCP.Items.Objects[i])) +
                    '   AND pc_codigo = ' + SqlValue (Copy(chlCP.Items[i], 1, 4)));

      // Inserto Preventor-CP-Provincia nuevo
      EjecutarSqlSt('INSERT INTO hys.hpc_preventorcpostal ' +
                    '     VALUES (' + SqlValue (fraPreventorCP.Codigo) + ', ' +
                                    SqlValue (Copy(chlCP.Items[i], 1, 4)) + ', ' +
                                    SqlValue (Integer(chlCP.Items.Objects[i])) + ', ' +
                                    SqlValue (Sesion.LoginName) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                    '               hys.seq_hpc_id.NEXTVAL)');
    end;

  LeerCPAsignados
end;

procedure TfrmAbmPreventores.chlCPDblClick(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to chlCP.Items.Count-1 do
    chlCP.Checked[i] := not chlCP.Checked[i]
end;

procedure TfrmAbmPreventores.fraPreventorCPcmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorCP.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorCP.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorCP.cmbDescripcion.Text := '%' + fraPreventorCP.cmbDescripcion.Text;
  fraPreventorCP.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorCP.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorCP.cmbDescripcion.Text)[1] = '%') then
      fraPreventorCP.cmbDescripcion.Text := copy(fraPreventorCP.cmbDescripcion.Text, 2, length(fraPreventorCP.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmAbmPreventores.fraSupervisorescmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraSupervisores.cmbDescripcion.Text) <> '') and
     (trim(fraSupervisores.cmbDescripcion.Text)[1] <> '%') then
      fraSupervisores.cmbDescripcion.Text := '%' + fraSupervisores.cmbDescripcion.Text;
  fraSupervisores.cmbDescripcionDropDown(Sender);
  if (trim(fraSupervisores.cmbDescripcion.Text) <> '') and
     (trim(fraSupervisores.cmbDescripcion.Text)[1] = '%') then
      fraSupervisores.cmbDescripcion.Text := copy(fraSupervisores.cmbDescripcion.Text, 2, length(fraSupervisores.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmAbmPreventores.tbVerPerfilClick(Sender: TObject);
begin
  if fraPerfil.IsSelected then
    fpPerfilesPreventor.ShowModal;
end;

procedure TfrmAbmPreventores.fraPerfilChange(Sender: TObject);
var
  idPerfil: integer;
begin
  if (FPerfilAnterior <> fraPerfil.Value) and
     (MsgBox('¿Desea cambiar la asigación del perfil?',  MB_ICONQUESTION + MB_YESNO, 'Eliminar Condición') = IDYES) then
  begin
    if (edCodigoPreventor.Text = '') then
    begin
      if (MsgBox('Para poder asignar el perfil es necesario guardar los datos actuales. ¿Desea guardarlos?',  MB_ICONQUESTION + MB_YESNO, 'Eliminar Condición') <> IDYES) then
      begin
        fraPerfil.Clear;
        Abort;
      end
      else begin
        idPerfil := fraPerfil.Value;
        fraPerfil.Clear;
        Validar;
        fraPerfil.Value := idPerfil;
        DoABM;
      end;
    end;

    if fraPerfil.IsSelected then
    begin
      GuardarCondicionesPerfil(StrToIntDef(edCodigoPreventor.Text, 0), fraPerfil.Value, FPerfilAnterior);
      FPerfilAnterior := fraPerfil.Value;
    end
    else begin
      EliminarCondicionesPerfil(StrToIntDef(edCodigoPreventor.Text, 0));
      FPerfilAnterior := 0;
    end;
  end
  else fraPerfil.Value := FPerfilAnterior;
end;

procedure TfrmAbmPreventores.GuardarCondicionesPerfil(aIdPreventor,
  aIdPerfilNuevo: integer; aIdPerfilAnterior: integer);
var
  idperfilcondicionprev: integer;
begin
  BeginTrans(true);
  try

(*    EjecutarSqlST(' delete from hys.hpc_perfilcondicionprev ' +
                  ' where pc_idpreventor = ' + SqlValue(aIdPreventor) +
                  ' and pc_idperfil in ( SELECT pc_idperfil ' +
                  '                         FROM hys.hpc_perfilcondicion, hys.hcc_condicion ' +
                  '                         WHERE cc_idperfilcondicion = pc_id ' +
                  '                          AND pc_idperfil = ' +  SqlValue(aIdPerfilAnterior) + ')');
*)

    EjecutarSqlST(' delete from hys.hcp_condicionpreventor ' +
                  ' where cp_idperfilcondicionprev in (select pc_id ' +
                  '                                    from hys.hpc_perfilcondicionprev ' +
                  '                                    where pc_idpreventor = ' + SqlValue(aIdPreventor) +
                  '                                    and pc_idperfil = ' + SqlValue(aIdPerfilAnterior) + ')');


    EjecutarSqlST(' delete from hys.hpc_perfilcondicionprev ' +
                  ' where pc_idpreventor = ' + SqlValue(aIdPreventor) +
                  ' and pc_idperfil = ' + SqlValue(aIdPerfilAnterior));



(*    EjecutarSqlST(' update hys.hpp_perfilespreventor ' +
                  ' set (pp_idcondicion, pp_idperfilcondicionprev) = (select cc_id, pc_id ' +
                  '                                                from hys.hpc_perfilcondicion, hys.hcc_condicion ' +
                  '                                                where cc_idperfilcondicion = pc_id ' +
                  '                                                and pc_idperfil = ' + SqlValue(aIdPerfilNuevo)  +
                  '                                                and pp_parametro = cc_parametro ' +
                  '                                                and pp_valor = cc_valor ' + ')');
*)

    with GetQuery(' select * from hys.hpc_perfilcondicion where pc_idperfil = ' +  SqlValue(aIdPerfilNuevo)) do
    try
      while not Eof do
      begin
        idperfilcondicionprev := GetSecNextVal('hys.seq_hpv_id');
        EjecutarSqlST(' insert into hys.hpc_perfilcondicionprev(pc_id, pc_idperfil, pc_usualta, pc_fechaalta, pc_idpreventor) ' +
                      ' values (' + SqlValue(idperfilcondicionprev) + ', ' + SqlValue(aIdPerfilNuevo) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate, ' + SqlValue(aidpreventor) + ')' );



        EjecutarSqlST(' insert into hys.hcp_condicionpreventor(cp_id,  cp_parametro, cp_valor, cp_idcondicion, cp_idperfilcondicionprev) ' +
                      ' select hys.seq_hcr_id.nextval, cc_parametro, cc_valor, cc_id, ' + SqlValue(idperfilcondicionprev) +
                      ' from hys.hpc_perfilcondicion, hys.hcc_condicion ' +
                      ' where cc_idperfilcondicion = pc_id ' +
                      ' and pc_id = ' + SqlValue(fieldbyname('pc_id').AsInteger) +
                      ' and pc_idperfil = ' +  SqlValue(aIdPerfilNuevo));
//                      ' and not exists (select 1 from hys.hcp_condicionpreventor where cp_idcondicion = cc_id) ');
        Next;
      end;
    finally
      free;
    end;
    CommitTrans(true);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al cambiar de perfil.');
    end;
  end;

end;

procedure TfrmAbmPreventores.EliminarCondicionesPerfil(
  aIdPreventor: integer);
begin
  BeginTrans(true);
  try
    EjecutarSqlST(' delete from hys.hcp_condicionpreventor ' +
                  ' where cp_idperfilcondicionprev in (select pc_id ' +
                  '                                    from hys.hpc_perfilcondicionprev ' +
                  '                                    where pc_idpreventor = ' + SqlValue(aIdPreventor) + ')');


    EjecutarSqlST(' delete from hys.hpc_perfilcondicionprev ' +
                  ' where pc_idpreventor = ' + SqlValue(aIdPreventor));
                  
    CommitTrans(true);                  
  except
    on E: Exception do begin
       Rollback(true);
       ErrorMsg(E, 'Error al eliminar el perfil del preventor.');
    end;
  end;

end;

procedure TfrmAbmPreventores.fpPerfilesPreventorShow(Sender: TObject);
begin
  edNombrePerfil.Text := fraPerfil.Descripcion;
  CargarCondicionesPreventor(fraPerfil.Value, StrToIntDef(edCodigoPreventor.Text, 0));
end;

procedure TfrmAbmPreventores.CargarCondicionesPreventor(aIdPerfil, aIdPreventor: integer);
var
  i: integer;
  ts: TTabSheet;
begin

  while pcCondiciones.ControlCount > 0 do
    pcCondiciones.Controls[0].Free;

  with GetQuery(' select * ' +
                ' from hys.hpc_perfilcondicionprev ' +
                ' where pc_idperfil = ' + SqlValue(aIdPerfil) +
                ' and pc_idpreventor = ' + SqlValue(aIdPreventor) + 
                ' order by pc_id ') do
  try
    i:=0;
    while not Eof do
    begin
      inc(i);
      ts := TTabSheet.Create(pcCondiciones);
      ts.PageControl := pcCondiciones;
      ts.Caption := 'Condición ' + IntToStr(i);
      with TfraPerfilPreventor.Create(ts) do
      begin
        Name := 'fraPerfilPreventor_' + fieldbyname('pc_id').AsString;
        Align := alTop;
        Parent := ts;
        Init;
        CargarPreventor(fieldbyname('pc_id').AsInteger, aIdPreventor);
        VclExtra.LockControls(gbData, true);
      end;
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmAbmPreventores.btnAceptarPerfilClick(Sender: TObject);
begin
  fpPerfilesPreventor.ModalResult := mrOk;
end;

procedure TfrmAbmPreventores.tbNuevaCondClick(Sender: TObject);
begin
  fraPerfilPreventorABM.cmbTipoEmpresa.Enabled := true;
  fraPerfilPreventorABM.Init;
  fraPerfilPreventorABM.Limpiar;
  fpCondicion.ShowModal;
  CargarCondicionesPreventor(fraPerfil.Value, StrToIntDef(edCodigoPreventor.Text, 0));
end;

procedure TfrmAbmPreventores.tbPreventoresConsultorasClick(Sender: TObject);
begin
  with TfrmManPreventorConsultoras.Create(Self) do
  try
    Visible := false;
    Load(self.sdqConsulta.FieldByName('IT_ID').AsInteger);
    tbRefrescarClick(nil);
    ShowModal;
  finally
    Free;
  end;

end;

procedure TfrmAbmPreventores.tbModificarCondClick(Sender: TObject);
var
  activepageindex: integer;
begin
  if pcCondiciones.PageCount > 0 then
  begin
    activepageindex := pcCondiciones.ActivePageIndex;
    fraPerfilPreventorABM.Init;
    fraPerfilPreventorABM.Limpiar;
    fraPerfilPreventorABM.CargarPreventor(TfraPerfilPreventor(pcCondiciones.ActivePage.Controls[0]).IdPerfilCondicion, StrToIntDef(edCodigoPreventor.Text, 0));
    fpCondicion.ShowModal;
    CargarCondicionesPreventor(fraPerfil.Value, StrToIntDef(edCodigoPreventor.Text, 0));
    pcCondiciones.ActivePageIndex := activepageindex;
  end;
end;

procedure TfrmAbmPreventores.tbEliminarCondClick(Sender: TObject);
begin
  if pcCondiciones.PageCount > 0 then
  begin
    if MsgBox('¿Desea eliminar la condición seleccionada?',  MB_ICONQUESTION + MB_YESNO, 'Eliminar Condición') = IDYES then
    begin
      with TfraPerfilPreventor(pcCondiciones.ActivePage.Controls[0]) do
        EliminarPreventor(IdPerfilCondicion);
      pcCondiciones.ActivePage.free;
    end;
  end;
end;

procedure TfrmAbmPreventores.tbGuardarClick(Sender: TObject);
begin
  if fraPerfilPreventorABM.Validar then
  begin
    fraPerfilPreventorABM.GuardarPreventor(fraPerfil.Value, StrToIntDef(edCodigoPreventor.Text, 0));
    fpCondicion.ModalResult := mrOk;
  end;
end;

procedure TfrmAbmPreventores.tbLimpiarCondicionClick(Sender: TObject);
begin
  fraPerfilPreventorABM.Limpiar;
end;

procedure TfrmAbmPreventores.tbSeleccionarTodoClick(Sender: TObject);
begin
  fraPerfilPreventorABM.SeleccionarTodo;
end;

procedure TfrmAbmPreventores.tbSalirPerfilClick(Sender: TObject);
begin
  fpCondicion.ModalResult := mrOk;
end;

procedure TfrmAbmPreventores.tbAplicarPerfilesClick(Sender: TObject);
var
  i: integer;
begin
  Verificar(not fraPerfilFiltro.IsSelected, fraPerfilFiltro.cmbDescripcion, 'Debe seleccionar un perfil a aplicar.');
  sdqConsulta.DisableControls;
  try
    i:= 0;
    while i<= Grid.SelectedRows.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
      GuardarCondicionesPerfil(sdqConsulta.fieldbyname('it_id').AsInteger,  fraPerfilFiltro.Value, sdqConsulta.fieldbyname('it_idperfil').AsInteger);
      if (fraPerfilFiltro.Value <> sdqConsulta.fieldbyname('it_idperfil').AsInteger) then
        EjecutarSql('update art.pit_firmantes set it_idperfil = ' + SqlValue(fraPerfilFiltro.Value) + ' where it_id = ' + SqlValue(sdqConsulta.fieldbyname('it_id').AsInteger));
      inc(i);
    end;
  finally
    sdqConsulta.EnableControls;
  end;
  sdqConsulta.Refresh;
end;

procedure TfrmAbmPreventores.tbCantidadVisitasClick(Sender: TObject);
begin
  with TfrmManCantidadVisitasPreventor.Create(Self) do
  try
    fraPreventorFiltro.value := Self.sdqConsulta.FieldByName('it_id').AsInteger;
    Visible := false;
    tbRefrescarClick(nil);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmAbmPreventores.edEmailKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = ' ' then
    Key := #0;
end;

procedure TfrmAbmPreventores.fpWebPreventorShow(Sender: TObject);
begin
  inherited;
  if chkUsuExterno.Checked then
    FUsuarioWeb :=  edUsuarioWeb.Text
  else
    FUsuarioWeb := fraUsuarioWeb.UserID;
  FClave := edClave.Text;
  FForzarClave := chkForzarClave.Checked;
  FUsuExterno := chkUsuExterno.Checked;
end;

procedure TfrmAbmPreventores.btnCancelarWebClick(Sender: TObject);
begin
  inherited;
  if chkUsuExterno.Checked then
    edUsuarioWeb.Text := FUsuarioWeb
  else
    fraUsuarioWeb.Cargar(FUsuarioWeb);
  edClave.Text := FClave ;
  chkForzarClave.Checked := FForzarClave;
  chkUsuExterno.Checked := FUsuExterno;
  fpWebPreventor.ModalResult := mrCancel;
end;

procedure TfrmAbmPreventores.chkUsuExternoClick(Sender: TObject);
begin
  VclExtra.LockControl(edUsuarioWeb, not chkUsuExterno.Checked);
  if chkUsuExterno.Checked then
  begin
    fraUsuarioWeb.Clear;
    fraUsuarioWeb.Locked := true;
  end
  else
    fraUsuarioWeb.Locked := false;
end;

end.








