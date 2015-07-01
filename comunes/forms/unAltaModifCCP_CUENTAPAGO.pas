unit unAltaModifCCP_CUENTAPAGO;

interface                                   

{$IFDEF ART2}
  {$DEFINE ART1_TO_2}
{$ENDIF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PatternEdit, unArtFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, StdCtrls, ExtCtrls, FormPanel, Mask, unArt, General,
  unfraCPR_PRESTADOR, unFraCodigoDescripcion, unfraVendedores, unfraVendedoresCUIT, IntEdit, unArtDBAwareFrame,
  unArtDbFrame, artSeguridad;

type
  TFuncionShowForm = (fsAgregarControlCarga, fsAgregarCargaNormal, fsModificarControlCarga, fsModificar);

  TfrmAltaModifCCP_CUENTAPAGO = class(TForm)
    lblBanco: TLabel;
    fraBancos: TfraCodigoDescripcion;
    lblTipoCuenta: TLabel;
    fraStaticCTB_TiposCuentas: TfraStaticCTB_TABLAS;
    lblNroCuenta: TLabel;
    lblCBU: TLabel;
    edCBU1: TPatternEdit;
    lblSeparador: TLabel;
    edCBU2: TPatternEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    BevelAbm: TBevel;
    lblTipoAcreedor: TLabel;
    fraStaticCTB_TiposAcreedores: TfraStaticCTB_TABLAS;
    edCuitCuil: TMaskEdit;
    lblCuitCuil: TLabel;
    fraVendedoresCUITAcre: TfraVendedoresCUIT;
    fraPrestadorAcre: TfraCPR_PRESTADOR;
    lblSucursal: TLabel;
    fraSucursales: TfraCodigoDescripcion;
    edNroCuenta: TEdit;
    Seguridad: TSeguridad;
    Label1: TLabel;
    fraStaticCTB_PropiedadCta: TfraStaticCTB_TABLAS;
    rgTipoDatoBanco: TRadioGroup;
    procedure edCBU1Change(Sender: TObject);
    procedure fraBancosOnChange(Sender: TObject);
    procedure fraStaticCTB_TiposAcreedoresOnChange(Sender: TObject);
    procedure fraVendedoresCUITAcreOnChange(Sender: TObject);
    procedure fraPrestadorAcreOnChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure edCuitCuilChange(Sender: TObject);
    procedure rgTipoDatoBancoClick(Sender: TObject);
  private
    FCuitCuil: String;
    FId: TTableId;
    FIdAcreedor: TTableId;
    FIdAcreedor_CA_PR: TTableId;
    FManTrab: Boolean;
    FModo: TFuncionShowForm;
    FTipoAcreedor: String;

    function DoABM(Modo: TFuncionShowForm): Boolean;
    function Validar(Modo: TFuncionShowForm; Id: TTableId): Boolean;
    function ValidarDatosCargadosSimilares(Id: TTableId): Boolean;

    procedure ClearControls(Modo: TFuncionShowForm);
    procedure DoCargar_TipoAcreedor_CuitCuil(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String);
    procedure DoCargarSucursales;
    procedure EnableControls(Modo: TFuncionShowForm);
    procedure EnableControlsCuitCuil(sTipoAcreedor: String);
    procedure LoadControls(Id: TTableId; bEsControlCarga: Boolean);
    procedure LoadControls_CargaNormal(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String);
  public
    function Execute(Id: TTableId; sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String;
                     sManTrab: Boolean = False; bEsModif: Boolean = False; bSoloOtrosBancos: Boolean = False): Boolean;
  end;

  function EsAcreedorPorId(sTipoAcreedor: String): Boolean;
  function ExisteCuentaBancariaControlCarga(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String; var Id: TTableId): Boolean;
  function ExisteCuitCuilSistemaAnt(sTipoAcreedor, sCuitCuil: String): Boolean;
  function GetFiltroAcreedor(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String; var bTipoAcreedorOk: Boolean): String;
  function GetIdAcreedor(sTipoAcreedor, sCuitCuil: String; IdAcreedor_CA_PR: TTableId): TTableId;
  function IsCuitCuilAcreedorValido(sTipoAcreedor, sCuitCuil: String; IdAcreedor_CA_PR: TTableId): Boolean;
  function PermitirAltaCuentaBancaria(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String;
                                      ValidarFechaAlta: Boolean; IdAcreedor_CA_PR: TTableId): Boolean;

implementation


uses
  unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, SDEngine, VCLExtra, Cuit, unSesion, DB, unConstantArchivo,
  unUtilsArchivo, unComunesArchivo, StrFuncs;

const
  IdOtrosBancos = 5;

{$R *.DFM}

procedure TfrmAltaModifCCP_CUENTAPAGO.edCBU1Change(Sender: TObject);
begin
  inherited;

  if Length(edCBU1.Text) = 8 then
    if Visible then
      edCBU2.SetFocus;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.FormCreate(Sender: TObject);
begin
  inherited;

  FManTrab := False;
  FIdAcreedor_CA_PR := ART_EMPTY_ID;

  with fraStaticCTB_TiposAcreedores do
  begin
    Clave          := 'TACRE';
    ExtraCondition := ' AND tb_codigo <> ''DI'' ';    // Delegaciones
    OnChange       := fraStaticCTB_TiposAcreedoresOnChange;

    OnChange(nil);
  end;

  with fraBancos do
  begin
    TableName      := 'zba_banco';
    FieldID        := 'ba_id';
    FieldCodigo    := 'ba_codigo';
    FieldBaja      := 'ba_fechabaja';
    ExtraFields    := ', ba_tienesucursales ';
    if not(Seguridad.Claves.IsActive('VerTodosBancos')) then
      ExtraCondition := 'AND ba_datanet IN (''S'', ''s'')';
    OnChange       := fraBancosOnChange;
  end;

  fraStaticCTB_TiposCuentas.Clave := 'BCOCT';
  fraStaticCTB_PropiedadCta.Clave := 'PROCT';

  with fraPrestadorAcre do
  begin
    ExtraCondition := ' AND ca_concertado = ''S'' ';
    OnChange       := fraPrestadorAcreOnChange;
  end;

  with fraVendedoresCUITAcre do
  begin
    ExtraCondition := ' AND (ve_cuit IS NOT NULL AND utiles.is_cuitvalido(ve_cuit) = ''S'') ';
    OnChange       := fraVendedoresCUITAcreOnChange;
  end;

  with fraSucursales do
  begin
    TableName      := 'zsb_sucursalbanco';
    FieldID        := 'sb_id';
    FieldCodigo    := 'sb_codigo';
    FieldDesc      := 'sb_nombre';
    FieldBaja      := 'sb_fechabaja';
    ExtraCondition := ' AND 1 = 2 ';
  end;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.ClearControls(Modo: TFuncionShowForm);
begin
  Caption := 'Agregar Cuenta Bancaria';

  if Modo = fsAgregarControlCarga then
  begin
    fraStaticCTB_TiposAcreedores.Clear;
    edCuitCuil.Clear;
  end;

  fraBancos.Clear;
  fraSucursales.Clear;
  fraStaticCTB_TiposCuentas.Clear;
  fraStaticCTB_PropiedadCta.Clear;
  edNroCuenta.Clear;
  edCBU1.Clear;
  edCBU2.Clear;
end;

function TfrmAltaModifCCP_CUENTAPAGO.DoABM(Modo: TFuncionShowForm): Boolean;
var
  bAprobacion: Boolean;
  bExisteCuentaBancariaControlCarga: Boolean;
  Id: TTableId;
  Id_CP: TTableId;
  rarId: TTableId;
  sSql: String;
  sCarpeta: String;
begin
  BeginTrans;
	try
    bAprobacion := False;

  	with TSql.Create('ccp_cuentapago') do
    try
      if Modo = fsAgregarCargaNormal then
        bExisteCuentaBancariaControlCarga := ExisteCuentaBancariaControlCarga(FTipoAcreedor, FIdAcreedor, FCuitCuil, Id_CP)
      else
        bExisteCuentaBancariaControlCarga := False;

      if (Modo = fsAgregarControlCarga) or ((Modo = fsAgregarCargaNormal) and (not bExisteCuentaBancariaControlCarga)) then
      begin
        SqlType := stInsert;

        Id := GetSecNextVal('SEQ_CCP_ID');

        if Modo = fsAgregarControlCarga then
        begin
          Fields.Add('cp_fechaaltamcarga', exDateTime);
          Fields.Add('cp_usualtamcarga',   Sesion.UserID);

          bAprobacion := True;
        end
        else   // es fsAgregarCargaNormal
        begin
          Fields.Add('cp_fechaalta', exDateTime);
          Fields.Add('cp_usualta',   Sesion.UserID);
        end;
      end
      else   // es fsModificarControlCarga o bExisteCuentaBancariaControlCarga  o fsModificar
      begin
        SqlType := stUpdate;

        if Modo = fsModificarControlCarga then
        begin
          Id := FId;
          Fields.Add('cp_fechaaltamcarga', exDateTime);
          Fields.Add('cp_usualtamcarga',   Sesion.UserID);
        end
        else if Modo = fsModificar then
        begin
          Id := FId;
          Fields.Add('cp_fechamodif', exDateTime);
          Fields.Add('cp_usumodif',   Sesion.UserID);
        end
        else
        begin   // es fsAgregarCargaNormal y bExisteCuentaBancariaControlCarga
          Id := Id_CP;
          Fields.Add('cp_fechaalta', exDateTime);
          Fields.Add('cp_usualta',   Sesion.UserID);
        end;
      end;

      PrimaryKey.Add('cp_id', Id);

      if (Modo = fsAgregarControlCarga) or (Modo = fsModificar) or
         ((Modo = fsAgregarCargaNormal) and (not bExisteCuentaBancariaControlCarga)) then
      begin
        Fields.Add('cp_tipoacreedor', FTipoAcreedor);

        if Modo = fsAgregarControlCarga then
          if EsAcreedorPorId(FTipoAcreedor) then
          begin
            FIdAcreedor := GetIdAcreedor(FTipoAcreedor, FCuitCuil, FIdAcreedor_CA_PR);
            FCuitCuil  := '';
          end;

        if FIdAcreedor <> ART_EMPTY_ID then
          Fields.Add('cp_idacreedor', FIdAcreedor);

        if Trim(FCuitCuil) <> '' then
          Fields.Add('cp_cuitcuil', FCuitCuil);

        if ((fraStaticCTB_TiposAcreedores.Codigo = 'TA') or (fraStaticCTB_TiposAcreedores.Codigo = 'EM')) and   // 'TA': Trabajador Afiliado
           (rgTipoDatoBanco.ItemIndex = 1) then       // CBU
          Fields.Add('cp_idbanco', IdOtrosBancos)     // para que lo tome luego como OTROS BANCOS
        else
          Fields.Add('cp_idbanco', fraBancos.Value);

        if not fraSucursales.ReadOnly or (Modo = fsModificar) then
          Fields.Add('cp_idsucursal', fraSucursales.Value, True);

        Fields.Add('cp_tipocuenta', fraStaticCTB_TiposCuentas.Value);

        if not edNroCuenta.ReadOnly or (Modo = fsModificar) then
          Fields.Add('cp_nrocuenta', edNroCuenta.Text);

        if not edCBU1.ReadOnly or (Modo = fsModificar) then
        begin
          Fields.Add('cp_cbu1',      edCBU1.Text);
          Fields.Add('cp_cbu2',      edCBU2.Text);
          Fields.Add('cp_propiedad', fraStaticCTB_PropiedadCta.Value);
        end;
      end;

      if (Trim(edNroCuenta.Text) = '') and (Trim(edCBU1.Text) = '') then
        Fields.Add('cp_tipopago', 'T')
      else
        Fields.Add('cp_tipopago', 'E');

      EjecutarSqlST(Sql);

      if bAprobacion and (edCBU1.Text <> '') then
      begin
        sCarpeta := Trim(FCuitCuil);

        if sCarpeta = '' then
        begin
          sSql :=
            'SELECT cp_cuitcuil' +
             ' FROM art.v_ccp_cuentapago' +
            ' WHERE cp_id = :id';
          sCarpeta := Trim(ValorSqlEx(sSql, [Id]));
        end;

        if sCarpeta <> '' then
          if not VerificarClaveExiste(ID_CARPETA_CBU, sCarpeta, rarId) then
            DoInsertArchivo(ID_CARPETA_CBU, TIPOUBICACION_GUARDA, '', 0, '', '', sCarpeta, False);
      end;

      CommitTrans;

      Result      := True;
      ModalResult := mrOk;
    finally
      Free;
    end;
  except
    on E: Exception do
    begin
      RollBack;
      Result := False;
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.DoCargar_TipoAcreedor_CuitCuil(sTipoAcreedor: String; IdAcreedor: TTableId;
                                                                     sCuitCuil: String);
var
  sSqlCuitCuit: String;
begin
  fraStaticCTB_TiposAcreedores.Value := sTipoAcreedor;
  fraStaticCTB_TiposAcreedoresOnChange(nil);

  if sCuitCuil <> '' then
    edCuitCuil.Text := sCuitCuil
  else
  begin
    if sTipoAcreedor = 'CA' then                                   // Centro Asistencial
      sSqlCuitCuit :=
        'SELECT ca_clave' +
         ' FROM cpr_prestador' +
        ' WHERE ca_identificador = :identificador'
    else if sTipoAcreedor = 'EM' then                              // Empresa Afiliada
    	sSqlCuitCuit :=
        'SELECT em_cuit' +
         ' FROM aem_empresa' +
        ' WHERE em_id = :id'
    else if sTipoAcreedor = 'PR' then                              // Productores
      sSqlCuitCuit :=
        'SELECT ve_cuit' +
         ' FROM xve_vendedor' +
        ' WHERE ve_id = :id'
    else if sTipoAcreedor = 'TA' then                              // Trabajador Afiliado
      sSqlCuitCuit :=
        'SELECT tj_cuil' +
         ' FROM ctj_trabajador' +
        ' WHERE tj_id = :id'
    else if sTipoAcreedor = 'PV' then                              // Proveedores
      sSqlCuitCuit :=
        'SELECT pv_cuit' +
         ' FROM v_opv_proveedor' +
        ' WHERE pv_id = :id'
    else if sTipoAcreedor = 'EJ' then                              // Estudio Jurídico
    	sSqlCuitCuit :=
        'SELECT gc_cuit' +
         ' FROM agc_gestorcuenta' +
        ' WHERE gc_id = :id'
    else if sTipoAcreedor = 'IM' then                              // Impuestos
    	sSqlCuitCuit :=
        'SELECT ie_cuit' +
         ' FROM cont.oie_impentidad' +
        ' WHERE ie_id = :id';

    edCuitCuil.Text := ValorSqlEx(sSqlCuitCuit, [IdAcreedor]);
  end;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.LoadControls(Id: TTableId; bEsControlCarga: Boolean);
var
  IdAcreedor: TTableId;
  sCuitCuil: String;
  sSql: String;
  sTipoAcreedor: String;
begin
  Caption := 'Modificar Cuenta Bancaria';

  sSql :=
    'SELECT cp_tipoacreedor, cp_idacreedor, cp_cuitcuil, cp_idbanco, cp_idsucursal, cp_tipocuenta, cp_nrocuenta,' +
          ' cp_cbu1, cp_cbu2, cp_propiedad ' +
     ' FROM ccp_cuentapago ' +
    ' WHERE cp_id = :id';

  with GetQueryEx(sSql, [Id]) do
  try
    sTipoAcreedor := FieldByName('cp_tipoacreedor').AsString;
    IdAcreedor    := FieldByName('cp_idacreedor').AsInteger;
    sCuitCuil     := FieldByName('cp_cuitcuil').AsString;

    DoCargar_TipoAcreedor_CuitCuil(sTipoAcreedor, IdAcreedor, sCuitCuil);

    if not bEsControlCarga then
    begin
      fraBancos.Value := FieldByName('cp_idbanco').{$IFDEF ART2}AsInteger{$ELSE}AsString{$ENDIF};
      fraBancosOnChange(nil);
      
      if fraBancos.IsSelected and
        (fraBancos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'S') then
      begin
        DoCargarSucursales;
        fraSucursales.Value             := FieldByName('cp_idsucursal').{$IFDEF ART2}AsInteger{$ELSE}AsString{$ENDIF};
      end;
      fraStaticCTB_TiposCuentas.Codigo  := FieldByName('cp_tipocuenta').AsString;
      fraStaticCTB_PropiedadCta.Codigo  := FieldByName('cp_propiedad').AsString;
      edNroCuenta.Text                  := FieldByName('cp_nrocuenta').AsString;
      edCBU1.Text                       := FieldByName('cp_cbu1').AsString;
      edCBU2.Text                       := FieldByName('cp_cbu2').AsString;

      if (sTipoAcreedor = 'TA') or (sTipoAcreedor = 'EM') then
      begin
        if IsEmptyString(edCBU1.Text) then
          rgTipoDatoBanco.ItemIndex := 0  // Cuenta
        else
          rgTipoDatoBanco.ItemIndex := 1  // CBU
      end
      else
        rgTipoDatoBanco.ItemIndex := -1;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.LoadControls_CargaNormal(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String);
begin
  DoCargar_TipoAcreedor_CuitCuil(sTipoAcreedor, IdAcreedor, sCuitCuil);
end;

function TfrmAltaModifCCP_CUENTAPAGO.Validar(Modo: TFuncionShowForm; Id: TTableId): Boolean;
var
  Id_CP: TTableId;
  sSql: String;
begin
  Result := False;

  Verificar((not fraStaticCTB_TiposAcreedores.Locked and fraStaticCTB_TiposAcreedores.IsEmpty), fraStaticCTB_TiposAcreedores.edCodigo, 'El tipo de acreedor es obligatorio.');

  if not edCuitCuil.ReadOnly and edCuitCuil.Visible then   // 'EM': Empresa Afiliada / 'TA': Trabajador Afiliado / 'OA', 'PA': Otros Acreedores, Persona Autorizada / 'PV': Proveedores
  begin
  	Verificar((edCuitCuil.Text = ''), edCuitCuil, 'El CUIT/CUIL es obligatorio.');
		Verificar((not IsCuil(edCuitCuil.Text)), edCuitCuil, 'El CUIT/CUIL es inválido.');
		Verificar((not IsCuitCuilAcreedorValido(fraStaticCTB_TiposAcreedores.Value, edCuitCuil.Text, ART_EMPTY_ID)), edCuitCuil, 'El CUIT/CUIL no existe para el acreedor seleccionado o el mismo se encuentra dado de baja.');
  end
  else if fraPrestadorAcre.Visible then        // 'CA': Centro Asistencial
  	Verificar(fraPrestadorAcre.IsEmpty, fraPrestadorAcre.mskCA_CLAVE, 'El CUIT es obligatorio.')
  else if fraVendedoresCUITAcre.Visible then   // 'PR': Productores
  	Verificar(fraVendedoresCUITAcre.IsEmpty, fraVendedoresCUITAcre.mskCuit, 'El CUIT es obligatorio.');

  Verificar(not fraBancos.ReadOnly and fraBancos.IsEmpty, fraBancos.edCodigo, 'El banco es obligatorio.');
	Verificar(not fraSucursales.ReadOnly and fraSucursales.IsEmpty, fraSucursales.edCodigo, 'La sucursal es obligatoria.');

  Verificar((not FManTrab and not edNroCuenta.ReadOnly and (edNroCuenta.Text = '')), edNroCuenta, 'El número de cuenta es obligatorio.');

  if edNroCuenta.Text <> '' then
  	Verificar(fraStaticCTB_TiposCuentas.IsEmpty, fraStaticCTB_TiposCuentas.edCodigo, 'El tipo de cuenta es obligatorio.');

  if fraStaticCTB_TiposCuentas.IsSelected then
  	Verificar(edNroCuenta.Text = '', edNroCuenta, 'El número de cuenta es obligatorio.');

	Verificar((not edCBU1.ReadOnly and (edCBU1.Text = '')), edCBU1, 'El primer bloque del CBU es obligatorio.');
	Verificar((not edCBU2.ReadOnly and (edCBU2.Text = '')), edCBU2, 'El segundo bloque del CBU es obligatorio.');

  if not edCBU1.ReadOnly then
  begin
  	Verificar(fraStaticCTB_PropiedadCta.IsEmpty, fraStaticCTB_PropiedadCta.edCodigo, 'El propietario de la cuenta es obligatorio.');

    sSql := 'SELECT utiles.iscbuvalido(:p1, :p2) FROM DUAL';
    Verificar((ValorSqlEx(sSql, [edCBU1.Text, edCBU2.Text]) <> 'S'), edCBU1, 'La C.B.U. es inválida.');
  end;

  if ((Modo = fsAgregarControlCarga) or (Modo = fsAgregarCargaNormal)) and
      (not PermitirAltaCuentaBancaria(FTipoAcreedor, FIdAcreedor, FCuitCuil, (Modo = fsAgregarCargaNormal),
      																FIdAcreedor_CA_PR)) then
  	Exit;

  Verificar((Modo = fsModificarControlCarga) and (not ValidarDatosCargadosSimilares(Id)), fraBancos.edCodigo,
            'Los datos ingresados no se corresponden con los cargados anteriormente.');

  if (Modo = fsAgregarCargaNormal) and  ExisteCuentaBancariaControlCarga(FTipoAcreedor, FIdAcreedor, FCuitCuil, Id_CP) then
  	Verificar((not ValidarDatosCargadosSimilares(Id_CP)), fraBancos.edCodigo,
              'Los datos ingresados no se corresponden con los cargados anteriormente.');

  Result := True;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.fraBancosOnChange(Sender: TObject);
var
  bHabilitarCBU: Boolean;
  bHabilitarCuenta: Boolean;
begin
  if (fraStaticCTB_TiposAcreedores.Codigo = 'TA') or
      (fraStaticCTB_TiposAcreedores.Codigo = 'EM') then   // 'TA': Trabajador Afiliado
  begin
    bHabilitarCuenta := (rgTipoDatoBanco.ItemIndex = 0);   // Cuenta
    bHabilitarCBU    := not bHabilitarCuenta;

    if bHabilitarCBU then
    begin
      LockControls(fraBancos, True);
      fraBancos.Clear;
    end
    else
      LockControls(fraBancos, False);
  end
  else
  begin
    bHabilitarCBU    := (fraBancos.Codigo = '999');
    bHabilitarCuenta := not bHabilitarCBU;

    LockControls(fraBancos, False);
  end;

  LockControls([fraStaticCTB_TiposCuentas, edNroCuenta], not bHabilitarCuenta);
  LockControls([edCBU1, edCBU2, fraStaticCTB_PropiedadCta], not bHabilitarCBU);
  LockControls([fraSucursales], not bHabilitarCuenta or fraBancos.IsEmpty or
                               (fraBancos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'N') or
                               (fraBancos.Codigo = '999'));

  if bHabilitarCuenta then
  begin
    edCBU1.Clear;
    edCBU2.Clear;
    fraStaticCTB_PropiedadCta.Clear;
  end
  else
  begin
    fraSucursales.Clear;
    fraStaticCTB_TiposCuentas.Clear;
    edNroCuenta.Clear;
  end;

  if fraSucursales.ReadOnly then
    fraSucursales.Clear;

  if fraBancos.IsSelected and not fraSucursales.ReadOnly and
    (fraBancos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'S') then
    DoCargarSucursales;
end;

function TfrmAltaModifCCP_CUENTAPAGO.Execute(Id: TTableId; sTipoAcreedor: String; IdAcreedor: TTableId;
                                             sCuitCuil: String; sManTrab: Boolean = False; bEsModif: Boolean = False;
                                             bSoloOtrosBancos: Boolean = False): Boolean;
begin
  FManTrab := (sTipoAcreedor = 'TA');  // Trabajador Afiliado

  with fraBancos do
  begin
    if FManTrab then
    begin
      FieldDesc := 'BA_NOMBRE';
      ShowBajas := False;
      ColorBaja := clRed;
    end
    else
    begin
      FieldDesc       := 'DECODE(BA_CODIGO, ''999'', ''OTROS BANCOS'', BA_NOMBRE)';
      ExtraCondition  := ' AND ba_codigo IN (' + Iif(bSoloOtrosBancos, '''999''', '''011'', ''014'' , ''999''') + ') ';
      ShowBajas       := True;
      ColorBaja       := clWindowText;
    end;
  end;

  if bEsModif and (Id <> ART_EMPTY_ID) then
  begin
    FModo := fsModificar;
    FId   := Id;
    LoadControls(Id, False);
  end
  else if Id = ART_EMPTY_ID Then   // Es un alta
  begin
    if Trim(sTipoAcreedor) = '' then
      FModo := fsAgregarControlCarga     // Desde unControlCarga_CuentasBancarias no se tiene el tipo de acreedor, ya que se ingresa desde acá
    else
      FModo := fsAgregarCargaNormal;     // Desde unManCCP_CUENTAPAGO siempre se tiene el tipo de acreedor

    ClearControls(FModo);

    if FModo = fsAgregarCargaNormal then
      LoadControls_CargaNormal(sTipoAcreedor, IdAcreedor, sCuitCuil);
  end
  else
  begin // Es un control de la carga
    FModo := fsModificarControlCarga;
    FId   := Id;
    LoadControls(Id, True);
  end;

  //fraBancosOnChange(nil);
  EnableControls(FModo);

  FTipoAcreedor := sTipoAcreedor;
  FIdAcreedor   := IdAcreedor;
  FCuitCuil     := sCuitCuil;

  Result := (ShowModal = mrOk);
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.btnAceptarClick(Sender: TObject);
begin
  if Validar(FModo, FId) then
    DoABM(FModo);
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.EnableControls(Modo: TFuncionShowForm);
var
  bDesHabilitar: Boolean;
begin
  bDesHabilitar := (Modo = fsModificarControlCarga) or (Modo = fsAgregarCargaNormal) or
                   (Modo = fsModificar);

  VCLExtra.LockControls([fraStaticCTB_TiposAcreedores, edCuitCuil], bDesHabilitar);

  fraVendedoresCUITAcre.Visible := False;
  fraPrestadorAcre.Visible      := False;

  if bDesHabilitar then
    ActiveControl := fraBancos.edCodigo
  else
    ActiveControl := fraStaticCTB_TiposAcreedores.edCodigo;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.edCuitCuilChange(Sender: TObject);
begin
  FCuitCuil         := edCuitCuil.Text;
  FIdAcreedor_CA_PR := ART_EMPTY_ID;
  FIdAcreedor       := FIdAcreedor_CA_PR;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.fraPrestadorAcreOnChange(Sender: TObject);
begin
  FCuitCuil         := '';
  FIdAcreedor_CA_PR := fraPrestadorAcre.Value;
  FIdAcreedor       := FIdAcreedor_CA_PR;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.fraVendedoresCUITAcreOnChange(Sender: TObject);
begin
  FCuitCuil         := '';
  FIdAcreedor_CA_PR := fraVendedoresCUITAcre.Value;
  FIdAcreedor       := FIdAcreedor_CA_PR;
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.fraStaticCTB_TiposAcreedoresOnChange(Sender: TObject);
var
  bHabilitarTipoDatoBanco: Boolean;
begin
  FTipoAcreedor := fraStaticCTB_TiposAcreedores.Value;

  if not fraStaticCTB_TiposAcreedores.Locked then
    EnableControlsCuitCuil(FTipoAcreedor);

  bHabilitarTipoDatoBanco := (fraStaticCTB_TiposAcreedores.Codigo = 'TA') or
                              (fraStaticCTB_TiposAcreedores.Codigo = 'EM');
  VCLExtra.LockControl(rgTipoDatoBanco, not bHabilitarTipoDatoBanco);

  if bHabilitarTipoDatoBanco then
    rgTipoDatoBanco.ItemIndex := 0
  else
    rgTipoDatoBanco.ItemIndex := -1;

  fraBancos.ShowBajas := True;
  fraBancosOnChange(nil);
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.EnableControlsCuitCuil(sTipoAcreedor: String);
var
  bVisiblePrestador, bVisibleVendedor, bVisibleCuitCuil: Boolean;
begin
  if sTipoAcreedor = 'CA' then        // Centro Asistencial
  begin
    bVisiblePrestador := True;
    bVisibleVendedor  := False;
    fraPrestadorAcre.Clear;
  end
  else if sTipoAcreedor = 'PR' then   // Productores
  begin
    bVisiblePrestador := False;
    bVisibleVendedor  := True;
    fraVendedoresCUITAcre.Clear
  end
  else
  begin
    bVisiblePrestador := False;
    bVisibleVendedor  := False;
    edCuitCuil.Clear;
  end;

  bVisibleCuitCuil := (not bVisiblePrestador and not bVisibleVendedor);

  lblCuitCuil.Visible           := bVisibleCuitCuil;
  edCuitCuil.Visible            := bVisibleCuitCuil;
  fraPrestadorAcre.Visible      := bVisiblePrestador;
  fraVendedoresCUITAcre.Visible := bVisibleVendedor;
end;

function TfrmAltaModifCCP_CUENTAPAGO.ValidarDatosCargadosSimilares(Id: TTableId): Boolean;
var
  sIdBanco: String;
  sSql: String;
begin
  sSql :=
    'SELECT cp_idbanco, cp_tipocuenta, cp_nrocuenta, cp_cbu1, cp_cbu2, cp_idsucursal, cp_propiedad' +
     ' FROM ccp_cuentapago' +
    ' WHERE cp_id = :id';

  if fraBancos.IsEmpty then
    sIdBanco := IntToStr(IdOtrosBancos)
  else
    sIdBanco := fraBancos.Id;

  with GetQueryEx(sSql, [Id]) do
  try
    Result := not Eof and
             (sIdBanco = FieldByName('cp_idbanco').AsString) and
             (fraSucursales.Value = FieldByName('cp_idsucursal').{$IFDEF ART2}AsInteger{$ELSE}AsString{$ENDIF}) and
             (fraStaticCTB_TiposCuentas.Value = FieldByName('cp_tipocuenta').AsString) and
             (edNroCuenta.Text = FieldByName('cp_nrocuenta').AsString) and
             (edCBU1.Text = FieldByName('cp_cbu1').AsString) and
             (edCBU2.Text = FieldByName('cp_cbu2').AsString) and
             (fraStaticCTB_PropiedadCta.Value = FieldByName('cp_propiedad').AsString);
  finally
    Free;
  end;
end;

function EsAcreedorPorId(sTipoAcreedor: String): Boolean;
var
  bBuscarIdAcreedor: Boolean;
begin
  {$IFDEF ART1_TO_2}
  if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then  // Otros Acreedores, Persona Autorizada
    bBuscarIdAcreedor := False
  else
    bBuscarIdAcreedor := True;
  {$ELSE}
  if (sTipoAcreedor = 'CA') or (sTipoAcreedor = 'PV') then     // Centro Asistencial, Proveedores
    bBuscarIdAcreedor := True
  else
    bBuscarIdAcreedor := False;
  {$ENDIF}

  Result := bBuscarIdAcreedor;
end;

function GetFiltroAcreedor(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String; var bTipoAcreedorOk: Boolean): String;
var
  sSql: String;
begin
  sSql := ' AND cp_tipoacreedor = ' + SqlValue(sTipoAcreedor);

  if IdAcreedor <> ART_EMPTY_ID then
    sSql := sSql + ' AND cp_idacreedor = ' + SqlValue(IdAcreedor)
  else if trim(sCuitCuil) <> '' then
    sSql := sSql + 'AND cp_cuitcuil = ' + SqlValue(sCuitCuil)
  else
  begin
    MsgBox('El Acreedor es inexistente.', MB_ICONERROR, 'Acreedor erróneo.');
    bTipoAcreedorOk := False;
    Exit;
  end;

  bTipoAcreedorOk := True;

  Result := sSql;
end;

function PermitirAltaCuentaBancaria(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String;
                                    ValidarFechaAlta: Boolean; IdAcreedor_CA_PR: TTableId): Boolean;
var
  bTipoAcreedorOk: Boolean;
  IdAcreedorCuit: TTableId;
  sFiltroAcreedor: String;
  sSql: String;
begin
  if sTipoAcreedor = 'TA' then   // Trabajador Afiliado
    Result := True
  else
  begin
    if Trim(sCuitCuil) <> '' then
    begin
      IdAcreedorCuit := GetIdAcreedor(sTipoAcreedor, sCuitCuil, IdAcreedor_CA_PR);

      if IdAcreedorCuit <> ART_EMPTY_ID then
        IdAcreedor := IdAcreedorCuit;
    end;

    sFiltroAcreedor := GetFiltroAcreedor(sTipoAcreedor, IdAcreedor, sCuitCuil, bTipoAcreedorOk);

    sSql :=
      'SELECT 1' +
       ' FROM ccp_cuentapago' +
      ' WHERE cp_fechabaja IS NULL ' + sFiltroAcreedor;

    if ValidarFechaAlta then   // entra por esta condición solo cuando Modo = fsAgregarCargaNormal
      sSql := sSql + ' AND cp_fechaalta IS NOT NULL';

    if ExisteSql(sSql) then
    begin
      MsgBox('Ya existe un número de cuenta activo. No es posible dar de alta un nuevo registro.', MB_ICONERROR, 'Error');
      Result := False;
    end
    else
      Result := True;
  end;
end;

function GetIdAcreedor(sTipoAcreedor, sCuitCuil: String; IdAcreedor_CA_PR: TTableId): TTableId;
var
  Id_Acreedor: TTableId;
  sSqlIdAcreedor: String;
begin
  if EsAcreedorPorId(sTipoAcreedor) then
  begin
    sSqlIdAcreedor := '';
    Id_Acreedor    := ART_EMPTY_ID;

    if sTipoAcreedor = 'CA' then                                   // Centro Asistencial
    begin
      if IdAcreedor_CA_PR = ART_EMPTY_ID then
        sSqlIdAcreedor :=
          'SELECT ca_identificador' +
           ' FROM cpr_prestador' +
          ' WHERE ca_clave = :clave' +
            ' AND ca_concertado = ''S''' +
            ' AND ca_fechabaja IS NULL'
      else
        Id_Acreedor := IdAcreedor_CA_PR
    end
    else if sTipoAcreedor = 'EM' then                              // Empresa Afiliada
      sSqlIdAcreedor :=
        'SELECT em_id' +
         ' FROM aem_empresa, aco_contrato' +
        ' WHERE em_cuit = :cuit' +
          ' AND em_id = co_idempresa' +
          ' AND afiliacion.check_cobertura(co_contrato) = 1'
    else if sTipoAcreedor = 'PR' then                              // Productores
    begin
      if IdAcreedor_CA_PR = ART_EMPTY_ID then
        sSqlIdAcreedor :=
          'SELECT ve_id' +
           ' FROM xve_vendedor' +
          ' WHERE ve_cuit = :cuit' +
            ' AND ve_fechabaja IS NULL' +
            ' AND utiles.is_cuitvalido(ve_cuit) = ''S'''
      else
        Id_Acreedor := IdAcreedor_CA_PR;
    end
    else if sTipoAcreedor = 'TA' then                              // Trabajador Afiliado
      sSqlIdAcreedor :=
        'SELECT tj_id' +
         ' FROM ctj_trabajador' +
        ' WHERE tj_cuil = :cuil'
    else if sTipoAcreedor = 'PV' then                              // Proveedores
      sSqlIdAcreedor :=
        'SELECT pv_id' +
         ' FROM v_opv_proveedor' +
        ' WHERE pv_cuit = :cuit';

    if Id_Acreedor = ART_EMPTY_ID then
      if sSqlIdAcreedor <> '' then
        Id_Acreedor := ValorSqlIntegerEx(sSqlIdAcreedor, [sCuitCuil]);
  end
  else
    Id_Acreedor := ART_EMPTY_ID;

  Result := Id_Acreedor;
end;

function ExisteCuentaBancariaControlCarga(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String; var Id: TTableId): Boolean;
var
	bTipoAcreedorOk: Boolean;
  sFiltroAcreedor: String;
  sSql: String;
begin
  sFiltroAcreedor := GetFiltroAcreedor(sTipoAcreedor, IdAcreedor, sCuitCuil, bTipoAcreedorOk);

  sSql :=
    'SELECT cp_id' +
     ' FROM ccp_cuentapago' +
    ' WHERE cp_fechaaltamcarga IS NOT NULL' +
      ' AND cp_fechaalta IS NULL' +
      ' AND cp_fechabaja IS NULL ' + sFiltroAcreedor;
  Id      := ValorSqlInteger(sSql, ART_EMPTY_ID);
  Result  := (Id <> ART_EMPTY_ID);
end;

function IsCuitCuilAcreedorValido(sTipoAcreedor, sCuitCuil: String; IdAcreedor_CA_PR: TTableId): Boolean;
var
  bCuitCuilAcreedorValido: Boolean;
begin
  if EsAcreedorPorId(sTipoAcreedor) then
    bCuitCuilAcreedorValido := (GetIdAcreedor(sTipoAcreedor, sCuitCuil, IdAcreedor_CA_PR) <> ART_EMPTY_ID)
  else
    bCuitCuilAcreedorValido := ExisteCuitCuilSistemaAnt(sTipoAcreedor, sCuitCuil);

  Result := bCuitCuilAcreedorValido;
end;

function ExisteCuitCuilSistemaAnt(sTipoAcreedor, sCuitCuil: String): Boolean;
var
  sSql: String;
begin
  if sTipoAcreedor = 'EM' then                                   // Empresa Afiliada
    sSql :=
      'SELECT mp_cuit' +
       ' FROM cmp_empresas' +
      ' WHERE mp_cuit = :cuit' +
        ' AND mp_fbaja IS NULL'
  else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then  // Otros Acreedores, Persona Autorizada
    sSql :=
      'SELECT pa_cuitcuil' +
       ' FROM spa_pagoacre' +
      ' WHERE pa_cuitcuil = :cuitcuil' +
        ' AND pa_fechabaja IS NULL'
  else if sTipoAcreedor = 'PR' then                              // Productores
    sSql :=
      'SELECT vd_cuit' +
       ' FROM cvd_vendedores' +
      ' WHERE vd_cuit = :cuit' +
        ' AND vd_fbaja IS NULL' +
        ' AND utiles.is_cuitvalido(vd_cuit) = ''S'''
  else if sTipoAcreedor = 'TA' then                              // Trabajador Afiliado
    sSql :=
      'SELECT tj_cuil' +
       ' FROM ctj_trabajador' +
      ' WHERE tj_cuil = :cuil';

  Result := (ValorSqlEx(sSql, [sCuitCuil]) <> '');
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.DoCargarSucursales;
begin
  fraSucursales.Clear;
  LockControl(fraSucursales, fraBancos.IsEmpty or
                            (fraBancos.sdqDatos.FieldByName('ba_tienesucursales').AsString = 'N'));
  if fraBancos.IsSelected then
    fraSucursales.ExtraCondition := ' AND sb_idbanco = ' + SqlInt(fraBancos.Value)
  else
    fraSucursales.ExtraCondition := ' AND 1 = 2 ';
end;

procedure TfrmAltaModifCCP_CUENTAPAGO.rgTipoDatoBancoClick(Sender: TObject);
begin
  fraBancosOnChange(nil);
end;

end.
