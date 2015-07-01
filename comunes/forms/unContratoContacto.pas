unit unContratoContacto;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF} Windows, Messages,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, unArtFrame, Mask, DateComboBox, HotKeyControl, IntEdit,
  ShortCutControl, unfraContacto, unART, QueryPrint, artSeguridad {$IFDEF CAS}, unMenu{$ENDIF}, unCustomForm, ImgList,
  XPMenu, unArtDBAwareFrame, unArtDbFrame, ExtCtrls, unFraCodigoDescripcion, unfraCtbTablas,
  RxPlacemnt;

type
  TfrmContratoContacto = class(TfrmCustomForm)
    ArtDBGrid: TArtDBGrid;
    btnAceptar: TButton;
    btnCancelar: TButton;
    chkBaja: TCheckBox;
    fraContacto: TfraContacto;
    gbDatosContrato: TGroupBox;
    grbContacto: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlBottom: TPanel;
    pnlSeleccion: TPanel;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    sdDatos: TDataSource;
    sdqDatos: TSDQuery;
    Seguridad: TSeguridad;
    ShortCutControl: TShortCutControl;
    stEmail: TStaticText;
    stNumeroContrato: TStaticText;
    stRazonSocial: TStaticText;
    stTelefonos: TStaticText;
    tbAjustarColumnas: TToolButton;
    tbCancelar: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    tbModificar: TToolButton;
    tbSeparador20: TToolButton;
    tlbBaja: TToolButton;
    tlbControl: TToolBar;
    tlbGuardar: TToolButton;
    tlbImprimir: TToolButton;
    tlbNuevo: TToolButton;
    tlbSalir: TToolButton;
    Label5: TLabel;
    fraTipoDocumento: TfraCtbTablas;
    Label6: TLabel;
    edNumeroDocumento: TEdit;
    cmbCT_SEXO: TComboBox;
    Label7: TLabel;
    procedure ArtDBGridDblClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure chkBajaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fraTelefonosbtnABMTelefonosClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tbAjustarColumnasClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
 private
    {$IFDEF CAS}frmPrincipal: TfrmMenu;{$ENDIF}
    FAllowBaja: Boolean;
    FAutoCommit: Boolean;
    FContacto: String;
    FContrato: Integer;
    FCorreoElectronico: String;
    FFuncion: TFuncionShowForm;
    FIdEmpresa: Integer;
    FSql: String;
    FTelefono: String;

    function GetIdContacto: Integer;
    function IsValidar: Boolean;
    function GetCantidadFirmatesContrato(const aContrato: TTableId): Integer;

    procedure LimpiarControles;
    procedure SetFuncion(F: TFuncionShowForm);
    procedure SetSelectCargoContacto(const Value: String);

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
 protected
    procedure DoGuardarSRT; virtual;
    procedure SeleccionSRT; virtual;
    procedure ModoABM(AValue: Boolean); virtual;
 public
    procedure AgregarShortCuts;
    procedure Clear;
    procedure DoCargar(aContrato: Integer; aContacto: String = ''; aTelefono: String = ''; aCorreoElectronico: String = ''); overload;
    procedure DoCargar(aCuit: String; aContrato: Integer); overload;
    procedure DoCargarDatos(const aContrato, aIdEmpresa: Integer);
    procedure QuitarShortCuts;
    procedure VerSeleccion;

    property AutoCommit: Boolean read FAutoCommit write FAutoCommit;
    property IdContacto: Integer read GetIdContacto;
    property SelectCargoContacto: String write SetSelectCargoContacto;
  end;

implementation

uses
  {$IFNDEF CAS}unPrincipal,{$ENDIF} unDmPrincipal, AnsiSQL, SqlFuncs, CustomDlgs, General, unSesion, VCLExtra;

{$R *.DFM}

const
  CaptionBase: string = 'Contrato Contactos';

procedure TfrmContratoContacto.ArtDBGridDblClick(Sender: TObject);
begin
  if pnlSeleccion.Visible then
    btnAceptarClick(nil)
  else
    tbModificarClick(nil);
end;

procedure TfrmContratoContacto.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('ct_fechabaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmContratoContacto.btnAceptarClick(Sender: TObject);
begin
  Verificar(sdqDatos.IsEmpty, btnAceptar, 'Debe seleccionar un contacto.');
  ModalResult := mrOK;
end;

procedure TfrmContratoContacto.chkBajaClick(Sender: TObject);
begin
  DoCargarDatos(FContrato, FIdEmpresa);
end;

procedure TfrmContratoContacto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fraContacto.fraTelefonos.QuitarTelefonosTemporales;
end;

procedure TfrmContratoContacto.FormCreate(Sender: TObject);
begin
  FSql := sdqDatos.SQL.Text;
  {$IFDEF CAS}
  frmPrincipal     := frmMenu;
  tlbSalir.Visible := False;

  tlbNuevo.Enabled   := frmPrincipal.Seguridad.Claves.IsActive('Afi_Contactos_Alta');
  tlbGuardar.Enabled := frmPrincipal.Seguridad.Claves.IsActive('Afi_Contactos_Modificar');
  FAllowBaja         := frmPrincipal.Seguridad.Claves.IsActive('Afi_Contactos_Eliminar');
  {$ELSE}
  FAllowBaja := True; { Mantengo la variable, porque habría que ponerle algún control al de afi }
  {$ENDIF}

  fraTipoDocumento.Clave := 'TDOC';

  Seguridad.DBLogin := frmPrincipal.DBLogin;
  Seguridad.Ejecutar;
  ModoABM(True);
end;

procedure TfrmContratoContacto.FormDestroy(Sender: TObject);
begin
  sdqDatos.Close;

  {$IFDEF CAS}
  QuitarShortCuts
  {$ENDIF}
end;

procedure TfrmContratoContacto.fraTelefonosbtnABMTelefonosClick(Sender: TObject);
begin
  fraContacto.fraTelefonosbtnABMTelefonosClick(Sender);
end;

procedure TfrmContratoContacto.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  SeleccionSRT;
end;

procedure TfrmContratoContacto.tbAjustarColumnasClick(Sender: TObject);
begin
  DynColWidthsByData(ArtDBGrid);
end;

procedure TfrmContratoContacto.tbCancelarClick(Sender: TObject);
begin
  Verificar(not (sdqDatos.Active and not sdqDatos.IsEmpty), nil, 'Debe seleccionar una empresa.');
  inherited;
  SeleccionSRT;
end;

procedure TfrmContratoContacto.tbModificarClick(Sender: TObject);
begin
  Verificar(not (sdqDatos.Active and not sdqDatos.IsEmpty), nil, 'Debe seleccionar una empresa.');
  Funcion := fsModificar;
  ModoABM(False);
end;

procedure TfrmContratoContacto.tlbBajaClick(Sender: TObject);
begin
  Verificar(not (sdqDatos.Active and not sdqDatos.IsEmpty), nil, 'Debe seleccionar una empresa.');

{
  if Funcion = fsModificar then // este es el único caso en el que hay
                                 // contacto seleccionado
}
  Verificar((not sdqDatos.IsEmpty and not sdqDatos.FieldByName('ct_fechabaja').IsNull), nil, 'Este registro se encuentra dado de baja.');
  Verificar((sdqDatos.FieldByName('ct_firmante').AsString = 'S') and (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'GERTEAC'), nil, 'Usted no tiene permiso para dar de baja un contacto que es firmante.');

  if ((sdqDatos.FieldByName('ct_firmante').AsString = 'S') or Not(sdqDatos.FieldByName('ct_tipofirma').IsNull)) then
  begin
    Verificar(GetCantidadFirmatesContrato(FContrato) < 2, tlbBaja, 'Antes de eliminar el único firmante del contrato, debe seleccionar o crear otro')
  end;

  if not sdqDatos.IsEmpty then
  begin
    if MsgAsk('¿ Realmente desea dar de baja este registro ?') then
    begin
      with TSql.Create('act_contacto') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('ct_id',    sdqDatos.FieldByName('ct_id').AsInteger, False);
        Fields.Add('ct_fechabaja', SQL_ACTUALDATE, false);
        Fields.Add('ct_usubaja',   Sesion.UserId);
        try
          if Self.AutoCommit then
            EjecutarSql(Sql)
          else
            EjecutarSqlST(Sql);

          MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
          sdqDatos.Close;
          OpenQuery(sdqDatos);
        except
          on E: Exception do
            ErrorMsg(E, 'Error al guardar los datos.');
        end;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmContratoContacto.tlbGuardarClick(Sender: TObject);
begin
//  Verificar(not (sdqDatos.Active and not sdqDatos.IsEmpty), nil, 'Debe seleccionar una empresa.');
  Verificar((Funcion = fsModificar) and (not sdqDatos.IsEmpty and not sdqDatos.FieldByName('ct_fechabaja').IsNull), nil, 'Este registro se encuentra dado de baja.');
  Verificar((Funcion = fsModificar) and (sdqDatos.FieldByName('ct_firmante').AsString = 'S') and (Sesion.Sector <> 'AFI') and (Sesion.Sector <> 'GERTEAC'), nil, 'Usted no tiene permiso para modificar un contacto que es firmante.');

  if IsValidar then
    DoGuardarSRT;
end;

procedure TfrmContratoContacto.tlbImprimirClick(Sender: TObject);
begin
  try
    if (sdqDatos.Active) and (not sdqDatos.IsEmpty) and (PrintDialog.Execute) then
    begin
      QueryPrint.SubTitle.Lines.Add('Contrato: ' + IntToStr(FContrato));
      QueryPrint.SubTitle.Lines.Add('Razón Social: ' + IntToStr(FIdEmpresa));
      QueryPrint.SetGridColumns(ArtDBGrid, true, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := CaptionBase;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;

procedure TfrmContratoContacto.tlbNuevoClick(Sender: TObject);
begin
//  Verificar(not (sdqDatos.Active and not sdqDatos.IsEmpty), nil, 'Debe seleccionar una empresa.');
  Funcion := fsAgregar;
  LimpiarControles;
  ModoABM(False);
end;

procedure TfrmContratoContacto.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratoContacto.DoGuardarSRT;
var
  iContactoId: Integer;
  sSql: String;
begin
  iContactoId := 0;

  with TSql.Create('act_contacto') do
  try
    case Funcion of
      fsAgregar:
      begin
        iContactoId := GetSecNextVal('SEQ_ACT_ID');

        SqlType := stInsert;
        //PrimaryKey.Add('ct_id', 'SEQ_ACT_ID.NEXTVAL', false);
        Fields.Add('ct_fechaalta', SQL_ACTUALDATE, false);
        Fields.Add('ct_usualta',   Sesion.UserId);
        Fields.Add('ct_areacarga', Sesion.Sector);
      end;
      fsModificar:
      begin
        iContactoId := sdqDatos.FieldByName('ct_id').AsInteger;

        SqlType := stUpdate;
        Fields.Add('ct_fechamodif', SQL_ACTUALDATE, false);
        Fields.Add('ct_usumodif',   Sesion.UserId);
      end;
    end;

    PrimaryKey.Add('ct_id',          iContactoId, False);
    Fields.Add('ct_area',            fraContacto.Area);
    Fields.Add('ct_cargo',           fraContacto.Cargo);
    Fields.Add('ct_codareafax',      fraContacto.AreaFax);
    Fields.Add('ct_contacto',        fraContacto.Contacto);
    Fields.Add('ct_direlectronica',  fraContacto.Email);
    Fields.Add('ct_fax',             fraContacto.Fax);
    Fields.Add('ct_idempresa',       FIdEmpresa, False);
    Fields.Add('ct_numerodocumento', edNumeroDocumento.Text);
    Fields.Add('ct_remitentecarta',  String(IIF(fraContacto.RemitenteCarta, 'S', 'N')));
    Fields.Add('ct_tipodocumento',   fraTipoDocumento.Value);
    Fields.Add('ct_sexo',            IIF(cmbCT_SEXO.ItemIndex = 0, 'F', 'M'),dtString);

    try
      if Self.AutoCommit then
        BeginTrans;

      if fraContacto.RemitenteCarta then
      begin
        sSql :=
          'UPDATE act_contacto' +
            ' SET ct_remitentecarta = ''N''' +
          ' WHERE ct_idempresa = :p1';
        EjecutarSqlSTEx(sSql, [FIdEmpresa]);
      end;

      EjecutarSqlST(Sql);

      if not fraContacto.fraTelefonos.AutoCommit then
        fraContacto.fraTelefonos.CopiarTempATelefonos(iContactoId);

      if Self.AutoCommit then
        CommitTrans;

      if (fraContacto.fraTelefonos.AutoCommit) and (Funcion = fsAgregar) then
        fraContacto.fraTelefonos.CopiarTempATelefonos(iContactoId);

      with sdqDatos do
      try
        DisableControls;
        Close;
        OpenQuery(sdqDatos);
        Locate('ct_id', iContactoId, []);
      finally
        EnableControls;
      end;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

function TfrmContratoContacto.GetIdContacto: Integer;
begin
  Result := sdqDatos.FieldByName('ct_id').AsInteger;
end;

function TfrmContratoContacto.IsValidar: boolean;
var
  bPreguntar: Boolean;
  sAreaCarga: String;
begin
  if Funcion = fsModificar then
  begin
    bPreguntar := False;
    sAreaCarga := sdqDatos.FieldByName('ct_areacarga').AsString;
    
    if not Assigned(Parent) and not Seguridad.Claves.IsActive(0) then
      bPreguntar := True;
    if Assigned(Parent) and Assigned(FormPadre.FindComponent('Seguridad')) and not TSeguridad(FormPadre.FindComponent('Seguridad')).Claves.IsActive(0) then
      bPreguntar := True;

    Verificar(bPreguntar and (Sesion.Sector <> sAreaCarga), nil, 'El área del contacto (' + sAreaCarga + ') ' + 'debe ser igual al area del usuario logueado.');
  end;

  Result := fraContacto.isValid;
end;

procedure TfrmContratoContacto.LimpiarControles;
begin
  with fraContacto do
  begin
    Clear;
    Contacto := FContacto;
    Email := FCorreoElectronico;    
  end;

  edNumeroDocumento.Clear;
  fraTipoDocumento.Clear;
  cmbCT_SEXO.ItemIndex := -1;
end;

procedure TfrmContratoContacto.ModoABM(AValue: Boolean);
begin
  inherited;

  if AValue then
  begin
    VCLExtra.LockControls([fraContacto, fraTipoDocumento, edNumeroDocumento, cmbCT_SEXO], True);
    tbModificar.Enabled := Seguridad.Activar(tbModificar);
    tlbNuevo.Enabled := Seguridad.Activar(tlbNuevo);
    tlbBaja.Enabled := Seguridad.Activar(tlbBaja);
    tlbImprimir.Enabled := True;
    tlbGuardar.Enabled := False;
    tbCancelar.Enabled := False;
    btnAceptar.Enabled := True;
    btnCancelar.Enabled := True;
  end
  else
  begin
    VCLExtra.LockControls([fraContacto, fraTipoDocumento, edNumeroDocumento, cmbCT_SEXO], False);
    tbModificar.Enabled := False;
    tlbNuevo.Enabled := False;
    tlbBaja.Enabled := False;
    tlbImprimir.Enabled := False;
    tlbGuardar.Enabled := Seguridad.Activar(tlbGuardar);
    tbCancelar.Enabled := Seguridad.Activar(tbCancelar);
    btnAceptar.Enabled := False;
    btnCancelar.Enabled := False;
  end;
end;

procedure TfrmContratoContacto.SeleccionSRT;
begin
  ModoABM(True);

  with sdqDatos, fraContacto do
  begin
    Contacto       := FieldByName('ct_contacto').AsString;
    Cargo          := FieldByName('ct_cargo').AsString;
    Area           := FieldByName('ct_area').AsString;
    AreaFax        := FieldByName('ct_codareafax').AsString;
    Fax            := FieldByName('ct_fax').AsString;
    Email          := FieldByName('ct_direlectronica').AsString;
    RemitenteCarta := (FieldByName('ct_remitentecarta').AsString = 'S');
    fraTelefonos.FillCombo(True, FieldByName('ct_id').AsInteger);

    edNumeroDocumento.Text := FieldByName('ct_numerodocumento').AsString;
    fraTipoDocumento.Value := FieldByName('ct_tipodocumento').AsString;

    if not FieldByName('ct_sexo').IsNull then
      if FieldByName('ct_sexo').AsString = 'F' then
         cmbCT_SEXO.ItemIndex := 0
      else
         cmbCT_SEXO.ItemIndex := 1
    else
      cmbCT_SEXO.ItemIndex := -1;
  end;
end;

procedure TfrmContratoContacto.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption := CaptionBase;
      tlbBaja.Enabled := false;
      tlbImprimir.Enabled := false;
    end;
    fsAgregar:
    begin
      Caption := CaptionBase + ' [ALTA]';
      tlbBaja.Enabled := false;
      tlbImprimir.Enabled := false;
    end;
    fsModificar:
    begin
      Caption := CaptionBase + ' [MODIFICACION]';
      tlbBaja.Enabled := FAllowBaja;
      tlbImprimir.Enabled := true;
    end;
  end;
end;

procedure TfrmContratoContacto.AgregarShortCuts;
  procedure AddKey(AKey: TShortcut; ALinkControl: TControl);
  begin
    if Assigned(FormPadre.FindComponent('ShortCutControl')) then
    begin
      TShortCutControl(FormPadre.FindComponent('ShortCutControl')).ShortCuts.Add;
      with TShortCutControl(FormPadre.FindComponent('ShortCutControl')).ShortCuts.Items[TShortCutControl(FormPadre.FindComponent('ShortCutControl')).ShortCuts.Count-1] do
      begin
        Key := AKey;
        LinkControl := ALinkControl;
      end;
    end;
  end;
  
begin
  AddKey(16462, tlbNuevo);
  AddKey(16455, tlbGuardar);
  AddKey(16450, tlbBaja);
  AddKey(16457, tlbImprimir);
end;

procedure TfrmContratoContacto.Clear;
begin
  LimpiarControles;
  sdqDatos.Close;
end;

procedure TfrmContratoContacto.DoCargar(aContrato: Integer; aContacto: String = ''; aTelefono: String = ''; aCorreoElectronico: String = '');
var
  sSql: String;
begin
  FContacto := aContacto;
  FTelefono := aTelefono;
  FCorreoElectronico := aCorreoElectronico;

  sSql :=
    'SELECT co_idempresa' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  DoCargarDatos(aContrato, ValorSqlEx(sSql, [AContrato]));
end;

procedure TfrmContratoContacto.DoCargar(aCuit: String; aContrato: Integer);
begin
  DoCargarDatos(AContrato, ValorSqlEx('SELECT em_id FROM aem_empresa WHERE em_cuit = :cuit', [ACuit]));
end;

procedure TfrmContratoContacto.DoCargarDatos(const aContrato, aIdEmpresa: Integer);
var
  sSql: String;
  sTelefonos: String;
begin
  FContrato := aContrato;
  FFuncion := fsAgregar;
  FIdEmpresa := aIdEmpresa;

  fraContacto.fraTelefonos.Initialize(not dmPrincipal.InTransaction, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');

  sSql := FSql;
  if not chkBaja.Checked then
    sSql := sSql + ' AND ct_fechabaja IS NULL ';

  sdqDatos.SQL.Text := sSql;
  sdqDatos.ParamByName('co_contrato').AsInteger := FContrato;
  OpenQuery(sdqDatos);

  // Cargo los datos básicos de un contrato..
  sSql :=
    'SELECT co_contrato, co_direlectronica, dc_codareatelefonos,                                                    /*AFI.Get_Telefonos(''ATO_TELEFONOCONTRATO'',' +
                                                               ' CO_CONTRATO) TEL,*/ dc_telefonos, em_nombre' +
     ' FROM adc_domiciliocontrato, aco_contrato, aem_empresa' +
    ' WHERE dc_contrato = co_contrato' +
      ' AND co_idempresa = em_id' +
      ' AND dc_tipo = ''P''' +
      ' AND dc_contrato = :contrato';
  with GetQueryEx(sSql, [FContrato]) do
  try
    sTelefonos := FieldByName('dc_telefonos').AsString;
    if FieldByName('dc_codareatelefonos').AsString <> '' then
      sTelefonos := Format('(%s) %s', [FieldByName('dc_codareatelefonos').AsString, sTelefonos]);

    stNumeroContrato.Caption := FieldByName('co_contrato').AsString;
    stRazonSocial.Caption    := FieldByName('em_nombre').AsString;
    stTelefonos.Caption      := sTelefonos;
    stEmail.Caption          := FieldByName('co_direlectronica').AsString;
  finally
    Free;
  end;
end;

procedure TfrmContratoContacto.QuitarShortCuts;
  procedure DelKey(AKey: TShortcut);
  var
    AShortCut: TShortCutItem;
  begin
    if Assigned(FormPadre.FindComponent('ShortCutControl')) then
    begin
      AShortCut := TShortCutControl(FormPadre.FindComponent('ShortCutControl')).ShortCuts.ItemsByShortCut[AKey];
      if Assigned(AShortCut) Then
        TShortCutControl(FormPadre.FindComponent('ShortCutControl')).ShortCuts.Delete(AShortCut.Index);
    end;
  end;
begin
  DelKey(16462);
  DelKey(16455);
  DelKey(16450);
  DelKey(16457);
end;

procedure TfrmContratoContacto.VerSeleccion;
begin
  pnlSeleccion.Visible := True;
  pnlSeleccion.Top := Height;
  Constraints.MinHeight := 500;
  tlbSalir.Visible := False;
  tbSeparador20.Visible := False;
end;

procedure TfrmContratoContacto.SetSelectCargoContacto(const Value: String);
begin
  if sdqDatos.Active then
    sdqDatos.Locate('ct_cargo', Value, []);
end;

function TfrmContratoContacto.GetCantidadFirmatesContrato(
  const aContrato: TTableId): Integer;
var
  sSQL : String;
begin
  sSQL := 'SELECT COUNT (ct_id) cantidad ' +
            'FROM aco_contrato aco LEFT JOIN aem_empresa aem ON aco.co_idempresa = aem.em_id ' +
               'LEFT JOIN act_contacto act ON aem.em_id = act.ct_idempresa ' +
            'WHERE (ct_firmante = ''S'' OR ct_tipofirma IS NOT NULL) ' +
             'AND act.ct_fechabaja IS NULL ' +
             'AND aco.co_contrato = :contrato';
  Result := ValorSqlIntegerEx(sSql, [aContrato]);
end;

end.
