unit unUsuariosWeb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraVendedores,
  unFraCodigoDescripcion, unFraEntidades, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraCanal, IntEdit, Mask, PatternEdit, unfraSucursal,
  ComboEditor, CheckCombo, DBCheckCombo, unFraCentroRegional, RxPlacemnt;

type
  TfrmUsuariosWeb = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    fraCanalFiltro: TfraCanal;
    GroupBox2: TGroupBox;
    fraEntidadFiltro: TfraEntidades;
    GroupBox3: TGroupBox;
    fraVendedorFiltro: TfraVendedores;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    edUsuarioFiltro: TEdit;
    edEmailFiltro: TEdit;
    edUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edClave: TEdit;
    fraCanal: TfraCanal;
    fraEntidad: TfraEntidades;
    fraVendedor: TfraVendedores;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    checkForzarClave: TCheckBox;
    edEmail: TPatternEdit;
    Label6: TLabel;
    Label8: TLabel;
    edConfirmacion: TEdit;
    fraSucursal: TfraSucursal;
    Label9: TLabel;
    GroupBox6: TGroupBox;
    fraSucursalFiltro: TfraSucursal;
    Label10: TLabel;
    checkAutocotizacion: TCheckBox;
    edUsuariosAviso: TPatternEdit;
    checkEstadoCuenta: TCheckBox;
    checkListadoSiniestros: TCheckBox;
    Label11: TLabel;
    edCuit: TMaskEdit;
    checkBloqueado: TCheckBox;
    checkControlBcra: TCheckBox;
    GroupBox7: TGroupBox;
    fraCentroRegional: TfraCentroRegional;
    edTelefono: TEdit;
    Label7: TLabel;
    checkVerLiquidacion: TCheckBox;
    checkCotizacion: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FiltrarTeclas(Sender: TObject; var Key: Char);
    procedure fraEntidadFiltrocmbDescripcionDropDown(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure edCuitExit(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
  protected
    function Validar: Boolean; override;

    procedure CambiaCanal(Sender: TObject);
    procedure CambiaCanalFiltro(Sender: TObject);
    procedure CambiaEntidad(Sender: TObject);
    procedure CambiaEntidadFiltro(Sender: TObject);
    procedure ClearControls; override;
    procedure LoadControls; override;
  public
  end;

var
  frmUsuariosWeb: TfrmUsuariosWeb;

implementation

uses
  unPrincipal, CustomDlgs, Internet, unDmPrincipal, General, unSesion, AnsiSql, CUIT, md5;

{$R *.DFM}

function TfrmUsuariosWeb.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraCanal.IsEmpty, fraCanal, 'El campo Canal es obligatorio.');
  Verificar(fraEntidad.IsEmpty, fraEntidad, 'El campo Entidad es obligatorio.');
  Verificar((fraSucursal.IsEmpty) and (fraEntidad.sdqDatos.FieldByName('en_requieresucursal').AsString = 'S'), fraSucursal.edCodigo, 'La sucursal es obligatoria.');
  Verificar((edCuit.Text = ''), edCuit, 'El campo C.U.I.T. es obligatorio.');
  Verificar(not IsCuit(edCuit.Text), edCuit, 'La C.U.I.T. no es correcta.');
  Verificar((edUsuario.Text = ''), edUsuario, 'El campo Usuario es obligatorio.');
  Verificar((Length(edUsuario.Text) < 4), edUsuario, 'El campo Usuario debe tener al menos 4 caracteres.');
  if ModoABM = maAlta then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM auw_usuarioweb' +
      ' WHERE uw_usuario = :usuario';
    Verificar((ValorSqlIntegerEx(sSql, [edUsuario.Text], 0) > 0), edUsuario, 'Ese Usuario ya se encuentra registrado.');
    Verificar((edClave.Text = ''), edClave, 'El campo Clave es obligatorio.');
    Verificar((Length(edClave.Text) < 4), edClave, 'El campo Clave debe tener al menos 4 caracteres.');
    Verificar((edClave.Text <> edConfirmacion.Text), edConfirmacion, 'El campo Confirmación debe ser igual al campo Clave.');
  end
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM auw_usuarioweb' +
      ' WHERE uw_usuario = :usuario' +
        ' AND uw_id <> :id';
    Verificar((ValorSqlIntegerEx(sSql, [edUsuario.Text, sdqConsulta.FieldByName('uw_id').AsInteger], 0) > 0), edUsuario, 'Ese Usuario ya se encuentra registrado.');

    if (Length(edClave.Text) > 0) or (Length(edConfirmacion.Text) > 0) then
    begin
      Verificar((Length(edClave.Text) < 4), edClave, 'El campo Clave debe tener al menos 4 caracteres.');
      Verificar((edClave.Text <> edConfirmacion.Text), edConfirmacion, 'El campo Confirmación debe ser igual al campo Clave.');
    end;
  end;
  Verificar((edEmail.Text = ''), edEmail, 'Debe escribir al menos una dirección de e-mail.'); //tk 56602 Si IsEmails se llama con '' da un AccessViolation.
  Verificar(not IsEMails(edEmail.Text), edEmail, 'El campo E-mails es inválido.' + #13#10 + 'Recuerde separar los e-mails con punto y coma (;).');
  Verificar((edUsuariosAviso.Text = ''), edUsuariosAviso, 'Debe escribir al menos una dirección de e-mail.');
  Verificar(not IsEMails(edUsuariosAviso.Text), edUsuariosAviso, 'El campo E-mails Aviso es inválido.' + #13#10 + 'Recuerde separar los e-mails con punto y coma (;).');

  Result := True;
end;

procedure TfrmUsuariosWeb.CambiaCanal(Sender: TObject);
begin
  if fraCanal.IsSelected then
  begin
    fraEntidad.Canal := fraCanal.Value;
    fraEntidad.cmbDescripcionDropDown(Sender);
  end;
end;

procedure TfrmUsuariosWeb.CambiaCanalFiltro(Sender: TObject);
begin
  if fraCanalFiltro.IsSelected then
    fraEntidadFiltro.Canal := fraCanalFiltro.Value;
end;

procedure TfrmUsuariosWeb.CambiaEntidad(Sender: TObject);
begin
  edCuit.Text         := fraEntidad.Cuit;
  fraSucursal.Entidad := fraEntidad.Value;
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmUsuariosWeb.CambiaEntidadFiltro(Sender: TObject);
begin
  fraSucursalFiltro.Entidad := fraEntidadFiltro.Value;
  fraVendedorFiltro.Entidad := fraEntidadFiltro.Value;
end;

procedure TfrmUsuariosWeb.ClearControls;
begin
  fraCanal.Clear;
  fraEntidad.Clear;
  fraSucursal.Clear;
  fraVendedor.Clear;
  fraCentroRegional.Clear;
  edCuit.Clear;
  edUsuario.Clear;
  edClave.Clear;
  edConfirmacion.Clear;
  edEmail.Clear;
  checkForzarClave.Checked := False;
  edUsuariosAviso.Clear;
  checkAutocotizacion.Checked := True;
  checkEstadoCuenta.Checked := False;
  checkListadoSiniestros.Checked := False;
  checkBloqueado.Checked := False;
  checkControlBcra.Checked := False;
  edTelefono.Clear;
  checkVerLiquidacion.Checked := False;
  checkCotizacion.Checked := True;
end;

procedure TfrmUsuariosWeb.LoadControls;
begin
  with sdqConsulta do
  begin
    fraCanal.Value 								 := FieldByName('uw_idcanal').AsInteger;
    CambiaCanal(nil);

    fraEntidad.Value 							 := FieldByName('uw_identidad').AsInteger;
    CambiaEntidad(nil);

    fraSucursal.Value 						 := FieldByName('uw_idsucursal').AsInteger;
    fraVendedor.Value 						 := FieldByName('uw_idvendedor').AsInteger;
    edCuit.Text 								   := FieldByName('uw_cuitsuscripcion').AsString;
    edUsuario.Text 								 := FieldByName('uw_usuario').AsString;
    edEmail.Text 									 := FieldByName('uw_mail').AsString;
    edTelefono.Text                := FieldByName('uw_telefono').AsString;
    checkForzarClave.Checked 			 := (FieldByName('uw_forzarclave').AsInteger = 1);
    edUsuariosAviso.Text 					 := FieldByName('uw_mailavisoart').AsString;
    checkAutocotizacion.Checked 	 := (FieldByName('uw_autocotizacion').AsInteger = 1);
    checkEstadoCuenta.Checked 		 := (FieldByName('uw_estadocuenta').AsInteger = 1);
    checkListadoSiniestros.Checked := (FieldByName('uw_estadosiniestro').AsInteger = 1);
    checkBloqueado.Checked         := (FieldByName('uw_bloqueado').AsInteger = 1);
    checkControlBcra.Checked       := (FieldByName('uw_ctrbcra').AsInteger = 1);
    checkVerLiquidacion.Checked    := (FieldByName('uw_liquidacion').AsInteger = 1);
    checkCotizacion.Checked 	     := (FieldByName('uw_cotizacion').AsInteger = 1);
  end;
end;


procedure TfrmUsuariosWeb.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'uw_fechabaja';
  ShowActived := False;

  fraCanal.OnChange         := CambiaCanal;
  fraCanalFiltro.OnChange   := CambiaCanalFiltro;
  fraEntidad.OnChange       := CambiaEntidad;
  fraEntidadFiltro.OnChange := CambiaEntidadFiltro;

  tbLimpiarClick(nil);

  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
end;

procedure TfrmUsuariosWeb.btnAceptarClick(Sender: TObject);
var
  iId: Integer;
  sSql: String;
begin
  if not Validar then
    Exit;

  Sql.Clear;
  Sql.TableName := 'auw_usuarioweb';
  if ModoABM = maAlta then
    iId := ValorSqlInteger('SELECT afi.seq_auw_id.NEXTVAL FROM DUAL', 0)
  else
    iId := sdqConsulta.FieldByName('uw_id').AsInteger;

  Sql.PrimaryKey.Add('uw_id',          iId, False);
  Sql.Fields.Add('uw_idcanal',         fraCanal.Value, True);
  Sql.Fields.Add('uw_identidad',       fraEntidad.Value, True);
  Sql.Fields.Add('uw_idsucursal',      fraSucursal.Value, True);
  Sql.Fields.Add('uw_idvendedor',      fraVendedor.Value, True);
  Sql.Fields.Add('uw_cuitsuscripcion', edCuit.Text);
  Sql.Fields.Add('uw_usuario',         edUsuario.Text);

  if edClave.Text <> '' then
  begin
    sSql := 'SELECT art.utiles.md5(:cadena) FROM DUAL';
    Sql.Fields.Add('uw_password', String(ValorSqlEx(sSql, [edClave.Text])));
  end;

  Sql.Fields.Add('uw_mail',            edEmail.Text);
  Sql.Fields.Add('uw_telefono',        edTelefono.Text);
  Sql.Fields.Add('uw_forzarclave',     Integer(IIF(checkForzarClave.Checked, 1, 0)));
  Sql.Fields.Add('uw_mailavisoart',    edUsuariosAviso.Text);
  Sql.Fields.Add('uw_autocotizacion',  Integer(IIF(checkAutocotizacion.Checked, 1, 0)));
  Sql.Fields.Add('uw_estadocuenta', 	 Integer(IIF(checkEstadoCuenta.Checked, 1, 0)));
  Sql.Fields.Add('uw_estadosiniestro', Integer(IIF(checkListadoSiniestros.Checked, 1, 0)));
  Sql.Fields.Add('uw_bloqueado',       Integer(IIF(checkBloqueado.Checked, 1, 0)));
  Sql.Fields.Add('uw_ctrbcra',         Integer(IIF(checkControlBcra.Checked, 1, 0)));
  Sql.Fields.Add('uw_cotizacion',      Integer(IIF(checkCotizacion.Checked, 1, 0)));
  Sql.Fields.Add('uw_liquidacion',     Integer(IIF(checkVerLiquidacion.Checked,1 ,0)));


  if ModoABM = maAlta then
  begin
    Sql.Fields.Add('uw_usualta',   Sesion.UserID);
    Sql.Fields.Add('uw_fechaalta', SQL_DATETIME, False);
    Sql.Fields.Add('uw_nivel',     1);
  end
  else
  begin
    Sql.Fields.Add('uw_usumodif',   Sesion.UserID);
    Sql.Fields.Add('uw_fechamodif', SQL_DATETIME, False);
  end;

  EjecutarSql(Sql.Sql);

  fpAbm.Close;
  tbRefrescarClick(nil);
end;

procedure TfrmUsuariosWeb.FiltrarTeclas(Sender: TObject; var Key: Char);
begin
  if not (Key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
  begin
    InvalidMsg(TWinControl(Sender), 'Solo puede ingresar texto alfanumérico. (A-Z, 0-9)');
    Key := #0;
  end;
end;

procedure TfrmUsuariosWeb.fpAbmShow(Sender: TObject);
begin
  edUsuario.Enabled := (ModoABM = maAlta);
end;

procedure TfrmUsuariosWeb.fraEntidadFiltrocmbDescripcionDropDown(Sender: TObject);
begin
  CambiaCanalFiltro(nil);

  inherited;

  fraEntidadFiltro.cmbDescripcionDropDown(Sender);
end;

procedure TfrmUsuariosWeb.tbRefrescarClick(Sender: TObject);
var
  sWhere: String;
begin
  sdqConsulta.SQL.Text :=
    'SELECT uw.*, DECODE(uw_bloqueado, 1, ''Sí'', ''No'') bloqueado, ca_descripcion canal, DECODE(uw_ctrbcra, 1, ''Sí'', ''No'') controlbcra, ve_nombre vendedor,' +
          ' en_nombre entidad, su_descripcion sucursal, cr_id, cr_descripcion, DECODE (uw_liquidacion, 1, ''Sí'', ''No'') verliq' +
     ' FROM auw_usuarioweb uw, aca_canal, xve_vendedor, xen_entidad, asu_sucursal, acr_centroregional' +
    ' WHERE uw_idcanal = ca_id(+)' +
      ' AND uw_idvendedor = ve_id(+)' +
      ' AND uw_identidad = en_id(+)' +
      ' AND uw_idsucursal = su_id(+)' +
      ' AND su_idcentroreg = cr_id(+)' ;

  sWhere := '';

  if not fraCanalFiltro.IsEmpty then
    sWhere := ' AND uw_idcanal = ' + SqlValue(fraCanalFiltro.Value);

  if not fraEntidadFiltro.IsEmpty then
    sWhere := ' AND uw_identidad = ' + SqlValue(fraEntidadFiltro.Value);

  if not fraSucursalFiltro.IsEmpty then
    sWhere := ' AND uw_idsucursal = ' + SqlValue(fraSucursalFiltro.Value);

  if not fraVendedorFiltro.IsEmpty then
    sWhere := ' AND uw_idvendedor = ' + SqlValue(fraVendedorFiltro.Value);

  if edUsuarioFiltro.Text <> '' then
    sWhere := ' AND uw_usuario = ' + SqlValue(edUsuarioFiltro.Text);

  if edEmailFiltro.Text <> '' then
    sWhere := ' AND uw_mail = ' + SqlValue(edEmailFiltro.Text);

  if not fraCentroRegional.IsEmpty then
    sWhere := sWhere + ' AND su_idcentroreg = ' + SqlValue(fraCentroRegional.Value);

  sdqConsulta.SQL.Text := sdqConsulta.SQL.Text  + sWhere;
  inherited;
end;

procedure TfrmUsuariosWeb.tbModificarClick(Sender: TObject);
begin
  ClearControls;

  inherited;
end;

procedure TfrmUsuariosWeb.tbEliminarClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and (not IsBaja) and (MsgBox(MSG_BAJA, MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    Sql.Clear;
    Sql.TableName := 'auw_usuarioweb';

    Sql.PrimaryKey.Add('uw_id',    sdqConsulta.FieldByName('uw_id').AsInteger, False);
    Sql.Fields.Add('uw_usubaja',   Sesion.UserID);
    Sql.Fields.Add('uw_fechabaja', SQL_DATETIME, False);

    EjecutarSql(Sql.Sql);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmUsuariosWeb.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  tbModificar.Enabled := not IsBaja;
  tbEliminar.Enabled := not IsBaja;
end;

procedure TfrmUsuariosWeb.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraCanalFiltro.Clear;
  fraEntidadFiltro.Clear;
  fraSucursalFiltro.Clear;
  fraVendedorFiltro.Clear;
  edUsuarioFiltro.Clear;
  edEmailFiltro.Clear;
  fraCentroRegional.Clear;
end;

procedure TfrmUsuariosWeb.edCuitExit(Sender: TObject);
begin
  if not IsCuit(edCuit.Text) then
    InfoHint(edCuit, 'La C.U.I.T. no es correcta.', False, 'Información', blnInfo, 3, False);
end;

end.
