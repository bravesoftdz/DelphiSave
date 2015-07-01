unit unClasificacionActivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, Mask, ToolEdit, unSeleccionMultiple,
  JvExExtCtrls, JvNavigationPane, CheckLst, ARTCheckListBox, RxToolEdit,
  RxPlacemnt;

type
  TfrmClasificacionActivos = class(TfrmCustomGridABM)
    chkBajas: TCheckBox;
    cmbCRITICIDAD_NRO: TComboBox;
    cmbConfidencialidad: TComboBox;
    cmbCriticidad: TComboBox;
    cmbDisponibilidad: TComboBox;
    cmbIntegridad: TComboBox;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    edCA_COMENTARIOS: TMemo;
    edCA_CONDICIONESPRESERVACION: TEdit;
    edCA_DESCRIPCION: TEdit;
    edCA_FORMADESTRUCCION: TEdit;
    edCA_SUBDIVISION: TEdit;
    edVigenciaDesde: TDateEdit;
    edVigenciaHasta: TDateEdit;
    FloatField1: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    fpSeleccionUsuarios: TFormPanel;
    fraCA_IDPLAZOGUARDA: TfraCodDesc;
    fraCA_IDSOPORTE: TfraCodDesc;
    fraCA_IDTIPOACTIVO: TfraCodDesc;
    fraGerenciaAsociada: TfraCodDesc;
    fraIDGERENCIA: TfraCodDesc;
    fraIDSECTOR: TfraCodDesc;
    fraPlazoGuarda: TfraCodDesc;
    fraPlazoGuardaRecomendado: TfraCodDesc;
    fraPropietario: TfraCodDesc;
    fraSectorAsociado: TfraCodDesc;
    fraSeleccionUsuarios: TfrmSeleccionUsuarios;
    fraSoporte: TfraCodDesc;
    fraTipoActivos: TfraCodDesc;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAccesoUsuarios: TLabel;
    lbUsuariosRelacionados: TListBox;
    pnlStyle0: TPanel;
    pnlStyle1: TPanel;
    pnlStyle2: TPanel;
    sdqAsociarUsuario: TSDQuery;
    sdqConsultaCA_COMENTARIOS: TStringField;
    sdqConsultaCA_CONDICIONESPRESERVACION: TStringField;
    sdqConsultaCA_CONFIDENCIALIDAD: TFloatField;
    sdqConsultaCA_CRITICIDAD: TStringField;
    sdqConsultaCA_DESCRIPCION: TStringField;
    sdqConsultaCA_DISPONIBILIDAD: TFloatField;
    sdqConsultaCA_FECHAALTA: TDateTimeField;
    sdqConsultaCA_FECHABAJA: TDateTimeField;
    sdqConsultaCA_FORMADESTRUCCION: TStringField;
    sdqConsultaCA_ID: TFloatField;
    sdqConsultaCA_IDPLAZOGUARDA: TFloatField;
    sdqConsultaCA_IDPLAZOGUARDARECOMENDADO: TFloatField;
    sdqConsultaCA_IDPROPIETARIOACTUAL: TFloatField;
    sdqConsultaCA_IDSOPORTE: TFloatField;
    sdqConsultaCA_IDTIPOACTIVO: TFloatField;
    sdqConsultaCA_INTEGRIDAD: TFloatField;
    sdqConsultaCA_SUBDIVISION: TStringField;
    sdqConsultaCA_USUALTA: TStringField;
    sdqConsultaCA_USUBAJA: TStringField;
    sdqConsultaCA_VIGENCIADESDE: TDateTimeField;
    sdqConsultaCA_VIGENCIAHASTA: TDateTimeField;
    sdqConsultaGERENCIA: TStringField;
    sdqConsultaIDGERENCIA: TFloatField;
    sdqConsultaIDSECTOR: TFloatField;
    sdqConsultaPG_DESCRIPCION: TStringField;
    sdqConsultaPG_FECHABAJA: TDateTimeField;
    sdqConsultaSA_DESCRIPCION: TStringField;
    sdqConsultaSA_FECHABAJA: TDateTimeField;
    sdqConsultaSECTOR: TStringField;
    sdqConsultaSE_NOMBRE: TStringField;
    sdqConsultaSE_USUARIO: TStringField;
    sdqConsultaTA_DESCRIPCION: TStringField;
    sdqConsultaTA_FECHABAJA: TDateTimeField;
    sdqConsultaVIGENTE: TStringField;
    ShortCutControlHijo: TShortCutControl;
    StringField1: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    JvOutlookSplitter1: TJvOutlookSplitter;
    clbDetalleUsuarios: TARTCheckListBox;
    sdqConsultaCRITICIDAD_NRO: TFloatField;
    sdqConsultaCA_IDSECTOR: TFloatField;
    sdqConsultaSE_FECHABAJA: TDateTimeField;
    procedure btnCancelarClick(Sender: TObject);
    procedure CalculoCriticidad(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure fraIDGERENCIAPropiedadesChange(Sender: TObject);
    procedure fraPropietarioChange(Sender: TObject);
    procedure fraSectorAsociadoPropiedadesChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure lbAccesoUsuariosClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure VerificoGerencia(Sender: TObject);
  private
    FSQL, FExtraConditionPropietario, FExtraConditionPropietarioEmpleados: String;
    FIdActivo: Integer;
    procedure AsociarUsuarioActivo(AIdUsuario, AIdActivo: Integer);
    procedure CopiarUsuarios(AIdNuevo, AIdViejo: Integer);
    procedure DesAsociarUsuarioActivo(AIdUsuario, AIdActivo: Integer);
    function DifiereAlgunCampo: Boolean;
    procedure LoadUsuarioAsociados;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
    function Validar: Boolean; override;
  end;

var
  frmClasificacionActivos: TfrmClasificacionActivos;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, Math, unArt;

{$R *.dfm}

procedure TfrmClasificacionActivos.AsociarUsuarioActivo(AIdUsuario, AIdActivo: Integer);
begin
  with sdqAsociarUsuario do
  begin
    ParamByName('idactivo').AsInteger := AIdActivo;
    ParamByName('idusuario').AsInteger := AIdUsuario;
    ExecSQL;
  end;
end;

procedure TfrmClasificacionActivos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  RollBack(True);
  fpAbm.ModalResult := mrCancel;
end;

procedure TfrmClasificacionActivos.CalculoCriticidad(Sender: TObject);
begin
  inherited;
  if (cmbConfidencialidad.ItemHeight > -1) and (cmbIntegridad.ItemHeight > -1) and (cmbDisponibilidad.ItemHeight > -1) then
    cmbCriticidad.ItemIndex := Max(0, Max(cmbConfidencialidad.ItemIndex, Max(cmbIntegridad.ItemIndex, cmbDisponibilidad.ItemIndex)) - 1);
end;

procedure TfrmClasificacionActivos.ClearControls;
begin
  inherited;
  fraPropietario.Propiedades.ExtraCondition := FExtraConditionPropietario + FExtraConditionPropietarioEmpleados;
  edCA_DESCRIPCION.Clear;
  fraTipoActivos.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  fraPropietario.Clear;
  fraSectorAsociado.Clear;
  fraGerenciaAsociada.Clear;
  fraPlazoGuarda.Clear;
  fraPlazoGuardaRecomendado.Clear;
  fraSoporte.Clear;
  cmbConfidencialidad.ItemIndex := -1;
  cmbIntegridad.ItemIndex := -1;
  cmbDisponibilidad.ItemIndex := -1;
  edCA_COMENTARIOS.Lines.Clear;
  edCA_SUBDIVISION.Clear;
  edCA_CONDICIONESPRESERVACION.Clear;
  edCA_FORMADESTRUCCION.Clear;
  lbUsuariosRelacionados.Items.Clear;
  fraSeleccionUsuarios.Clear;
  fraSeleccionUsuarios.Load;
  lbUsuariosRelacionados.Tag := 0;   
end;

procedure TfrmClasificacionActivos.ClearData;
begin
  inherited;
  fraIDSECTOR.Codigo := IntToStr(Sesion.IdSectorIntranet);
  fraIDGERENCIA.Codigo := fraIDSECTOR.sdqDatos.FieldByName('IDGERENCIA').AsString;
  fraCA_IDSOPORTE.Clear;
  fraCA_IDTIPOACTIVO.Clear;
  cmbCRITICIDAD_NRO.ItemIndex := -1;
  chkBajas.Checked := True;
  clbDetalleUsuarios.Clear;
  sdqConsultaAfterScroll(nil);

  if not Arein(Sesion.Sector, ['COMPUTOS', 'SEGINFO']) then
  begin
    VCLExtra.LockControls([fraIDGERENCIA], (not Sesion.EsGerente) or (not Seguridad.Activar(fraIDGERENCIA)));
    VCLExtra.LockControls([fraIDSECTOR], (not Sesion.EsJefe) or (not Seguridad.Activar(fraIDSECTOR)));
  end;
end;

procedure TfrmClasificacionActivos.CopiarUsuarios(AIdNuevo, AIdViejo: Integer);
begin
  lbUsuariosRelacionados.Tag := -1;
  BeginTrans(True);
  EjecutarSQLSTEx('INSERT INTO comunes.cau_activosusuarios ' +
                  '(au_idactivo, au_idusuario, au_usualta, au_fechaalta) ' +
                  ' SELECT :idactivonuevo, au_idusuario, :usuario, ART.ACTUALDATE ' +
                  '   FROM comunes.cau_activosusuarios ' +
                  '  WHERE au_idactivo = :idactivoviejo ' +
                  '    AND au_fechabaja IS NULL', [AIdNuevo, Sesion.UserID, AIdViejo]);
end;

procedure TfrmClasificacionActivos.DesAsociarUsuarioActivo(AIdUsuario, AIdActivo: Integer);
begin
  lbUsuariosRelacionados.Tag := -1;
  BeginTrans(True);  
  EjecutarSQLSTEx('UPDATE comunes.cau_activosusuarios ' +
                     'SET au_usubaja = :usuario, ' +
                         'au_fechabaja = ART.ACTUALDATE ' +
                   'WHERE au_idactivo = :idactivo ' +
                     'AND au_idusuario = :idusuario', [Sesion.UserID, AIdActivo, AIdUsuario]);
end;

function TfrmClasificacionActivos.DifiereAlgunCampo: Boolean;
begin
  with sdqConsulta do
    Result := not((edCA_DESCRIPCION.Text = FieldByName('CA_DESCRIPCION').AsString) and
                  (fraTipoActivos.Codigo = FieldByName('CA_IDTIPOACTIVO').AsString) and
                  (edVigenciaDesde.Date = FieldByName('CA_VIGENCIADESDE').AsDateTime) and
                  (edVigenciaHasta.Date = FieldByName('CA_VIGENCIAHASTA').AsDateTime) and
                  (fraPropietario.Codigo = FieldByName('SE_USUARIO').AsString) and
                  (fraPlazoGuarda.Codigo = FieldByName('CA_IDPLAZOGUARDA').AsString) and
                  (fraPlazoGuardaRecomendado.Codigo = FieldByName('CA_IDPLAZOGUARDARECOMENDADO').AsString) and
                  (fraSoporte.Codigo = FieldByName('CA_IDSOPORTE').AsString) and
                  (cmbConfidencialidad.ItemIndex = FieldByName('CA_CONFIDENCIALIDAD').AsInteger) and
                  (cmbIntegridad.ItemIndex = FieldByName('CA_INTEGRIDAD').AsInteger) and
                  (cmbDisponibilidad.ItemIndex = FieldByName('CA_DISPONIBILIDAD').AsInteger) and
                  (edCA_SUBDIVISION.Text = FieldByName('CA_SUBDIVISION').AsString) and
                  (edCA_FORMADESTRUCCION.Text = FieldByName('CA_FORMADESTRUCCION').AsString) and
                  (edCA_CONDICIONESPRESERVACION.Text = FieldByName('CA_CONDICIONESPRESERVACION').AsString) and
                  (edCA_COMENTARIOS.Lines.Text = FieldByName('CA_COMENTARIOS').AsString));
end;

function TfrmClasificacionActivos.DoABM: Boolean;
  procedure AgregoCampos;
  begin
    with Sql.Fields do
    begin
      Add('CA_DESCRIPCION', edCA_DESCRIPCION.Text);
      Add('CA_IDTIPOACTIVO', fraTipoActivos.Codigo);

      if edVigenciaDesde.Date > 0 then
        Add('CA_VIGENCIADESDE', edVigenciaDesde.Date, dmDate);

      if edVigenciaHasta.Date > 0 then
        Add('CA_VIGENCIAHASTA', edVigenciaHasta.Date, dmDate);

      Add('CA_IDPROPIETARIOACTUAL', fraPropietario.Id);
      Add('CA_IDPLAZOGUARDA', fraPlazoGuarda.Codigo);
      Add('CA_IDPLAZOGUARDARECOMENDADO', fraPlazoGuardaRecomendado.Codigo);
      Add('CA_IDSOPORTE', fraSoporte.Codigo);
      Add('CA_CONFIDENCIALIDAD', cmbConfidencialidad.ItemIndex);
      Add('CA_INTEGRIDAD', cmbIntegridad.ItemIndex);
      Add('CA_DISPONIBILIDAD', cmbDisponibilidad.ItemIndex);
      Add('CA_COMENTARIOS', edCA_COMENTARIOS.Lines.Text);
      Add('CA_SUBDIVISION', edCA_SUBDIVISION.Text);
      Add('CA_CONDICIONESPRESERVACION', edCA_CONDICIONESPRESERVACION.Text);
      Add('CA_FORMADESTRUCCION', edCA_FORMADESTRUCCION.Text);
    end;
  end;
begin
  try
    if DifiereAlgunCampo then
    begin
      Sql.Clear;
      if ModoABM = maBaja then
      begin
        Sql.PrimaryKey.Add('CA_ID', sdqConsulta.FieldByName('CA_ID').AsInteger);
        Sql.Fields.Add('CA_FECHABAJA', exDate);
        Sql.Fields.Add('CA_USUBAJA', Sesion.UserID);
        Sql.SqlType := stUpdate;
      end else
      begin
        if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.AddInteger('CA_ID', ValorSQLInteger('SELECT NVL(MAX(CA_ID), 0) FROM COMUNES.CCA_CLASIFICACIONACTIVOS') + 1);
          Sql.Fields.Add('CA_FECHAALTA', exDate);
          Sql.Fields.Add('CA_USUALTA', Sesion.UserID);
          Sql.SqlType := stInsert;
          AgregoCampos;                                                       
        end else
        if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.AddInteger('CA_ID', iif(FIdActivo = 0, sdqConsulta.FieldByName('CA_ID').AsInteger, FIdActivo));
          Sql.Fields.Add('CA_FECHABAJA', exDate);
          Sql.Fields.Add('CA_USUBAJA', Sesion.UserID);
          Sql.SqlType := stUpdate;
        end;
      end;

      FIdActivo := 0;
      Result := inherited DoABM;

      if ModoABM = maModificacion then
      begin
        Sql.Clear;
        Sql.PrimaryKey.Add('CA_ID', ValorSQLInteger('SELECT NVL(MAX(CA_ID), 0) FROM COMUNES.CCA_CLASIFICACIONACTIVOS') + 1);
        Sql.Fields.Add('CA_FECHAALTA', exDate);
        Sql.Fields.Add('CA_USUALTA', Sesion.UserID);
        Sql.SqlType := stInsert;
        AgregoCampos;
        Result := inherited DoABM;
        CopiarUsuarios(Sql.PrimaryKey.FieldByName['CA_ID'].Value, sdqConsulta.FieldByName('CA_ID').AsInteger);
      end;

      if lbUsuariosRelacionados.Items.Count = 0 then
        AsociarUsuarioActivo(Sesion.ID, Sql.PrimaryKey.FieldByName['CA_ID'].Value);
    end else
    begin
      Result := False;
      FIdActivo := 0;      
      fpAbm.ModalResult := mrCancel;
    end;
  finally
    CommitTrans(True);
  end;
  RefreshData;
end;

procedure TfrmClasificacionActivos.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CCA_CLASIFICACIONACTIVOS';
  FieldBaja := 'CA_FECHABAJA';
  fraSeleccionUsuarios.MostrarTodos := True;
  FSQL := sdqConsulta.SQL.Text;
  FExtraConditionPropietario := fraPropietario.Propiedades.ExtraCondition;
  FExtraConditionPropietarioEmpleados := ' AND (EXISTS(SELECT 1 ' +
                                                        'FROM art.use_usuarios empleados ' +
                                                       'WHERE empleados.se_respondea = ' + SQLValue(Sesion.UserID) + ' ' +
                                                         'AND empleados.se_usuario = use_usuarios.se_usuario) ' +
                                           'OR (use_usuarios.se_usuario = ' + SQLValue(Sesion.UserID) + ')' +
                                           'OR (use_usuarios.se_usuario = ' + SQLValue(Sesion.RespondeA) + '))';

  fraPropietario.Propiedades.ExtraCondition := FExtraConditionPropietario + FExtraConditionPropietarioEmpleados;
  VCLExtra.LockControls([fraSectorAsociado, fraGerenciaAsociada, cmbCriticidad], True);
  lbUsuariosRelacionados.Color := LOCK_COLOR;
//  clbDetalleUsuarios.ItemsDisabled := True;
  ClearData;
end;

procedure TfrmClasificacionActivos.fpAbmShow(Sender: TObject);
begin
  inherited;
  BeginTrans(True);
  FIdActivo := 0;
end;

procedure TfrmClasificacionActivos.fraIDGERENCIAPropiedadesChange(Sender: TObject);
begin
  VerificoGerencia(nil);
end;

procedure TfrmClasificacionActivos.fraPropietarioChange(Sender: TObject);
begin
  if fraPropietario.IsSelected then
    fraSectorAsociado.Codigo := fraPropietario.sdqDatos.FieldByName('SE_IDSECTOR').AsString;

  if fraSectorAsociado.IsSelected then
    fraGerenciaAsociada.Codigo := fraSectorAsociado.sdqDatos.FieldByName('IDGERENCIA').AsString;
end;

procedure TfrmClasificacionActivos.fraSectorAsociadoPropiedadesChange(Sender: TObject);
begin
  fraGerenciaAsociada.Codigo := fraSectorAsociado.sdqDatos.FieldByName('IDGERENCIA').AsString;
end;

procedure TfrmClasificacionActivos.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Highlight then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clNavy;
    Background := clGray;
  end else
  begin
    AFont.Style := AFont.Style - [fsBold];
    AFont.Color := clBlack;
  end;

  if AreIn(Field.FullName, ['TA_DESCRIPCION']) then
  begin
    if not sdqConsulta.FieldByName('TA_FECHABAJA').IsNull then
      AFont.Color := clRed;
  end;
  if AreIn(Field.FullName, ['SE_NOMBRE']) then
  begin
    if not sdqConsulta.FieldByName('SE_FECHABAJA').IsNull then
      AFont.Color := clRed;
  end;
  if AreIn(Field.FullName, ['PG_DESCRIPCION']) then
  begin
    if not sdqConsulta.FieldByName('PG_FECHABAJA').IsNull then
      AFont.Color := clRed;
  end;
  if AreIn(Field.FullName, ['SA_DESCRIPCION']) then
  begin
    if not sdqConsulta.FieldByName('SA_FECHABAJA').IsNull then
      AFont.Color := clRed;
  end;
  if AreIn(Field.FullName, ['VIGENTE']) then
  begin
    if Field.AsString = vSI then
      AFont.Color := clMoneyGreen
    else                     
      AFont.Color := clMaroon;
  end;

  if AreIn(Field.FullName, ['CA_CRITICIDAD']) and sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    Background := TPanel(FindComponent('pnlStyle' + sdqConsulta.FieldByName('CRITICIDAD_NRO').AsString)).Color;
  end;

  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfrmClasificacionActivos.lbAccesoUsuariosClick(Sender: TObject);
  procedure BorrarUsuarios(AIdActivo: Integer);
  var
    i: Integer;
  begin
    with fraSeleccionUsuarios do
    for i := lbUsuariosRelacionados.Items.Count - 1 downto 0 do
      if UsuariosAsignados.IndexOf(lbUsuariosRelacionados.Items.Strings[i]) = -1 then
      begin
        DesAsociarUsuarioActivo(Integer(lbUsuariosRelacionados.Items.Objects[i]), AIdActivo);
        lbUsuariosRelacionados.Selected[i] := True;
        lbUsuariosRelacionados.DeleteSelected;
      end;
  end;
var
  i: Integer;
  bSeguir: Boolean;
begin
  FIdActivo := 0;
  if ModoABM = maAlta then
  begin
    if  MsgAsk('Para continuar debe guardar los datos ingresados hasta el momento.' + CRLF + '¿Desea guardar la clasificación del activo ahora?')
    and Validar and DoABM then
    begin
      bSeguir := True;
      FIdActivo := Sql.PrimaryKey.FieldByName['CA_ID'].Value;
      RefreshData;
      ModoABM := maModificacion;
    end else
      bSeguir := False
  end else
  begin
    bSeguir := True;
    FIdActivo := sdqConsultaCA_ID.AsInteger;
  end;

  if bSeguir and (fpSeleccionUsuarios.ShowModal = mrOk) then
  with fraSeleccionUsuarios do
  begin
    if UsuariosAsignados.Count = 0 then
    begin
      BorrarUsuarios(FIdActivo);
      lbUsuariosRelacionados.AddItem(Sesion.Usuario, TObject(Sesion.ID));
      AsociarUsuarioActivo(Sesion.ID, FIdActivo);
    end else
    begin
      for i := 0 to UsuariosAsignados.Count - 1 do
        if lbUsuariosRelacionados.Items.IndexOf(UsuariosAsignados.Strings[i]) = -1 then
        begin
          lbUsuariosRelacionados.AddItem(UsuariosAsignados[i], UsuariosAsignados.Objects[i]);
          AsociarUsuarioActivo(TUserData(UsuariosAsignados.Objects[i]).Id, FIdActivo)
        end;
      BorrarUsuarios(FIdActivo);
    end;
  end;
end;

procedure TfrmClasificacionActivos.LoadControls;
begin
  fraPropietario.Propiedades.ExtraCondition := FExtraConditionPropietario;
  with sdqConsulta do
  begin
    edCA_DESCRIPCION.Text := FieldByName('CA_DESCRIPCION').AsString;
    fraTipoActivos.Codigo := FieldByName('CA_IDTIPOACTIVO').AsString;
    edVigenciaDesde.Date := FieldByName('CA_VIGENCIADESDE').AsDateTime;
    edVigenciaHasta.Date := FieldByName('CA_VIGENCIAHASTA').AsDateTime;
    fraPropietario.Codigo := FieldByName('SE_USUARIO').AsString;
    fraPlazoGuarda.Codigo := FieldByName('CA_IDPLAZOGUARDA').AsString;
    fraPlazoGuardaRecomendado.Codigo := FieldByName('CA_IDPLAZOGUARDARECOMENDADO').AsString;
    fraSoporte.Codigo := FieldByName('CA_IDSOPORTE').AsString;
    cmbConfidencialidad.ItemIndex := FieldByName('CA_CONFIDENCIALIDAD').AsInteger;
    cmbIntegridad.ItemIndex := FieldByName('CA_INTEGRIDAD').AsInteger;
    cmbDisponibilidad.ItemIndex := FieldByName('CA_DISPONIBILIDAD').AsInteger;
    edCA_COMENTARIOS.Lines.Text := FieldByName('CA_COMENTARIOS').AsString;
    edCA_SUBDIVISION.Text := FieldByName('CA_SUBDIVISION').AsString;
    edCA_CONDICIONESPRESERVACION.Text := FieldByName('CA_CONDICIONESPRESERVACION').AsString;
    edCA_FORMADESTRUCCION.Text := FieldByName('CA_FORMADESTRUCCION').AsString;
    CalculoCriticidad(nil);
    fraPropietarioChange(nil);
    LoadUsuarioAsociados;
  end;
end;

procedure TfrmClasificacionActivos.LoadUsuarioAsociados;
var
  sSQL: String;
begin
  fraSeleccionUsuarios.Clear;
  fraSeleccionUsuarios.Load;
  sSQL := 'SELECT cau.*, se_nombre ' +
            'FROM comunes.cau_activosusuarios cau, art.use_usuarios ' +
           'WHERE au_idactivo = :idactivo ' +
             'AND au_fechabaja is null ' +
             'AND au_idusuario = se_id';

  lbUsuariosRelacionados.Items.Clear;
  with sdqConsulta, GetQueryEx(sSQL, [FieldByName('CA_ID').AsInteger]) do
  try
    while not Eof do
    begin
      lbUsuariosRelacionados.AddItem(FieldByName('SE_NOMBRE').AsString, TObject(FieldByName('AU_IDUSUARIO').AsInteger));
      fraSeleccionUsuarios.AsociarUsuario(FieldByName('AU_IDUSUARIO').AsInteger, FieldByName('SE_NOMBRE').AsString);
      Next;
    end;
    lbUsuariosRelacionados.Tag := RecordCount; 
  finally
    Free;
  end;
end;

procedure TfrmClasificacionActivos.RefreshData;
begin
  if FIdActivo = 0 then
    sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + iif(chkBajas.Checked, ' AND CA_FECHABAJA IS NULL ', '') + SortDialog.OrderBy
  else
    sdqConsulta.SQL.Text := FSQL + ' AND CA_ID = ' + SQLValue(FIdActivo) + ' ' + SortDialog.OrderBy;

  inherited RefreshData;
end;

procedure TfrmClasificacionActivos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid);
end;

procedure TfrmClasificacionActivos.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    with clbDetalleUsuarios do
    begin
      SQL := 'SELECT se_nombre, se_id ' +
               'FROM art.use_usuarios, comunes.cau_activosusuarios ' +
              'WHERE au_idusuario = se_id ' +
                'AND au_fechabaja IS NULL ' +
                'AND se_fechabaja IS NULL ' +
                'AND au_idactivo = ' + SQLValue(sdqConsulta.FieldByName('CA_ID').AsInteger);

      DisableItems;
      CheckAll;
      Invalidate;
    end
  else
    clbDetalleUsuarios.Clear;
end;

procedure TfrmClasificacionActivos.tbEliminarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), tbEliminar, 'Debe seleccionar un registro.');
  Verificar(not (Sesion.EsJefeDe(sdqConsultaSE_USUARIO.AsString) or (sdqConsultaIDSECTOR.AsInteger = Sesion.IdSectorIntranet)), tbEliminar, 'Ud. no tiene permiso para eliminar la clasificación de este activo.');
  inherited;
end;

procedure TfrmClasificacionActivos.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), tbModificar, 'Debe seleccionar un registro.');
  Verificar(not (Sesion.EsJefeDe(sdqConsultaSE_USUARIO.AsString) or (sdqConsultaIDSECTOR.AsInteger = Sesion.IdSectorIntranet)), tbModificar, 'Ud. no tiene permiso para modificar la clasificación de este activo.');
  inherited;
end;

function TfrmClasificacionActivos.Validar: Boolean;
begin
  Verificar((ModoABM = maModificacion) and (not sdqConsulta.FieldByName('CA_FECHABAJA').IsNull), btnAceptar, 'El activo seleccionado ha sido dado de baja, no puede modificarse.');
  Verificar(Trim(edCA_DESCRIPCION.Text) = '', edCA_DESCRIPCION, 'Debe completar la descripción.');
  Verificar(fraPropietario.IsEmpty, fraPropietario.edCodigo, 'Debe seleccionar el propietario del activo en cuestión.');
  Verificar(fraPropietario.IsBaja, fraPropietario.edCodigo, 'El propietario seleccionado para el activo en cuestión ya no trabaja en la empresa, debe designar un nuevo dueño del activo.');
  Verificar(fraTipoActivos.IsEmpty, fraTipoActivos.edCodigo, 'Debe seleccionar el tipo de activo.');
  Verificar(fraSoporte.IsEmpty, fraSoporte.edCodigo, 'Debe seleccionar el soporte del activo.');
  Verificar(fraPlazoGuarda.IsEmpty, fraPlazoGuarda.edCodigo, 'Debe seleccionar el plazo de guarda del activo.');
  Verificar(cmbConfidencialidad.ItemIndex = -1, cmbConfidencialidad, 'Debe seleccionar la confidencialidad del activo.');
  Verificar(cmbIntegridad.ItemIndex = -1, cmbIntegridad, 'Debe seleccionar la integridad del activo.');
  Verificar(cmbDisponibilidad.ItemIndex = -1, cmbDisponibilidad, 'Debe seleccionar la disponibilidad del activo.');
  Verificar(edVigenciaDesde.Date = 0, edVigenciaDesde, 'Debe seleccionar al menos el inicio de la vigencia.');
  Verificar((not DifiereAlgunCampo) and (lbUsuariosRelacionados.Tag = lbUsuariosRelacionados.Items.Count),
            btnAceptar, 'No se modificó ningún dato como para guardar cambios.');

  if not (Sesion.EsJefeDe(fraPropietario.Codigo) and (sdqConsultaIDSECTOR.AsInteger <> Sesion.IdSectorIntranet))  then
    if not MsgAsk('Tenga en cuenta que el propietario que seleccionó para el activo que se está clasificando no es su colaborador directo ni está en su mismo sector.' + CRLF + CRLF + '¿Desea continuar?') then
      Abort;

  Result := True;
end;

procedure TfrmClasificacionActivos.VerificoGerencia(Sender: TObject);
begin
  if fraIDGERENCIA.IsSelected then
  begin
    fraIDSECTOR.Propiedades.ExtraCondition := ' AND EXISTS(SELECT 1 ' +
                                                            'FROM computos.cse_sector jef ' +
                                                           'WHERE jef.se_id = computos.cse_sector.se_idsectorpadre ' +
                                                             'AND jef.se_idsectorpadre = ' + SQLValue(fraIDGERENCIA.Value)+ ') ';
    if fraIDSECTOR.IsSelected and (fraIDSECTOR.sdqDatos.FieldByName('IDGERENCIA').AsString <> fraIDGERENCIA.Codigo) then
      fraIDSECTOR.Clear;
  end else
    fraIDSECTOR.Propiedades.ExtraCondition := '';

  if Assigned(Sender) then
    fraIDSECTOR.cmbDescripcionDropDown(Sender);
end;

end.
