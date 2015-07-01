unit unCargaTrabajador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  unFraActividad, Mask, ToolEdit, DateComboBox, HotKeyControl, IntEdit, unFraEmpresa, unfraCtbTablas, unArtDbFrame,
  ShortCutControl, unFraDomicilio, ListSearchEdit, FormPanel, unFraDomicilioTrab, artSeguridad, SortDlg,
  unArtDBAwareFrame, unFraCodDesc;

type
  TfrmCargaTrabajador = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbEstablecimiento: TToolButton;
    tlbSolicitud: TToolButton;
    tlbSRT: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    ToolButton1: TToolButton;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    edST_NOMBRE: TEdit;
    lbNombre: TLabel;
    lbAlta: TLabel;
    edST_FECHAINGRESO: TDateComboBox;
    lbFNacimiento: TLabel;
    edST_FNACIMIENTO: TDateComboBox;
    lbTarea: TLabel;
    lbSexo: TLabel;
    lbMasaSalarial: TLabel;
    edST_SUELDO: TCurrencyEdit;
    lbCategoria: TLabel;
    edST_CATEGORIA: TPatternEdit;
    grbEmpresa: TGroupBox;
    lbCUIL: TLabel;
    edST_CUIL: TMaskEdit;
    cmbST_SEXO: TComboBox;
    chST_PREOCUPACIONAL: TCheckBox;
    chST_PREEXISTENTE: TCheckBox;
    fraST_CUIO: TfraCtbTablas;
    lbCUIT: TLabel;
    edCUIT: TMaskEdit;
    lbRazonSocial: TLabel;
    edRazonSocial: TEdit;
    sdqCUIT: TSDQuery;
    fraEstablecimiento: TfraCodigoDescripcion;
    lbEstablecimento: TLabel;
    ToolButton2: TToolButton;
    grbSolicitud: TGroupBox;
    edSA_FORMULARIO: TEdit;
    ShortCutControl: TShortCutControl;
    grbDomicilio: TGroupBox;
    StatusBar: TStatusBar;
    Label1: TLabel;
    edST_TAREA: TListSearchEdit;
    fpBusqueda: TFormPanel;
    GroupBox1: TGroupBox;
    rbCUIL: TRadioButton;
    rbNombre: TRadioButton;
    edNombre: TEdit;
    edCUIL: TMaskEdit;
    rbDocumento: TRadioButton;
    edDocumento: TMaskEdit;
    btSalir: TButton;
    tlbReactivar: TToolButton;
    ToolButton3: TToolButton;
    Seguridad: TSeguridad;
    fraDomicilio: TfraDomicilio;
    SortDialog: TSortDialog;
    tbOrdenar: TToolButton;
    fraOrigenDato: TfraCodDesc;
    Label2: TLabel;
    chST_CONFIRMAPUESTO: TCheckBox;
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tlbBajaClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                     Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edST_CUILExit(Sender: TObject);
    procedure edST_FECHAINGRESOExit(Sender: TObject);
    procedure edST_FNACIMIENTOExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbSolicitudClick(Sender: TObject);
    procedure tlbSRTClick(Sender: TObject);
    procedure tlbEstablecimientoClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure fraEstablecimientoExit(Sender: TObject);
    procedure edST_SUELDOExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ArtDBGridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btSalirClick(Sender: TObject);
    procedure edCUILChange(Sender: TObject);
    procedure edDocumentoChange(Sender: TObject);
    procedure edNombreChange(Sender: TObject);
    procedure edCUILEnter(Sender: TObject);
    procedure edDocumentoEnter(Sender: TObject);
    procedure edNombreEnter(Sender: TObject);
    procedure tlbReactivarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    FCancelarNuevo: Boolean;
    FDBGrid: TDBGrid;
    FIdSolicitud: Integer;

    function isValidar: Boolean;

    procedure ActualizarTareas;
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure BuscarTrabajador(Sender: TObject);
    procedure CancelarAlta;
    procedure DoGuardarTrabajador;
    procedure LoadDynamicSortFields(ASortFields: TSortFields; AColumns: TDBGridColumns);
  public
    procedure DoCargaIDSolicitud(aId: Integer);
  end;

var
  frmCargaTrabajador: TfrmCargaTrabajador;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, CUIT, General, AnsiSQL, SqlFuncs, DateTimeFuncs, unCargaSolicitud, unCargaSRT,
  unCargaEstablecimiento, unRptNomina, unArt, VCLExtra, menus, Strfuncs;

const
  ST_ALTA        : String = 'Carga de Trabajadores [ALTA]';
  ST_MODIFICACION: String = 'Carga de Trabajadores [MODIFICACION]';
  ST_BAJA        : String = 'Carga de Trabajadores [BAJA]';

{$R *.DFM}

procedure TfrmCargaTrabajador.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaTrabajador.CancelarAlta;
begin
  tlbNuevo.ImageIndex := 6;
  tlbNuevo.Hint := 'Cancelar alta (Ctrl - N)';
  EnableControls([tlbBaja, tlbReactivar, tlbEstablecimiento, tlbSolicitud, tlbSRT, tlbImprimir], True);
  ArtDBGrid.SetFocus;
end;

procedure TfrmCargaTrabajador.tlbNuevoClick(Sender: TObject);
begin
  if FCancelarNuevo then
  begin
    CancelarAlta;
    sdqDatosAfterScroll(nil);
    FCancelarNuevo := False;
  end
  else
  begin
    tlbNuevo.ImageIndex := 8;
    tlbNuevo.Hint := 'Nuevo (Ctrl - N)';
    EnableControls([tlbBaja, tlbReactivar, tlbEstablecimiento, tlbSolicitud, tlbSRT, tlbImprimir], False);
    FCancelarNuevo := True;

    edST_CUIL.Clear;
    edST_NOMBRE.Clear;
    fraST_CUIO.Clear;
    edST_TAREA.Clear;
    edST_CATEGORIA.Clear;
    chST_PREOCUPACIONAL.Checked := False;
    chST_PREEXISTENTE.Checked := False;
    edST_FECHAINGRESO.Clear;
    edST_FNACIMIENTO.Clear;
    cmbST_SEXO.ItemIndex := -1;
    edST_SUELDO.Clear;
    fraOrigenDato.Clear;
    Caption := ST_ALTA;
    edST_CUIL.SetFocus;
    chST_CONFIRMAPUESTO.Checked := False;
  end;
end;

procedure TfrmCargaTrabajador.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  with sdqDatos do
  begin
    fraEstablecimiento.Value := FieldByName('st_idsolicitudest').AsInteger;
    edST_CUIL.Text           := FieldByName('st_cuil').AsString;
    edST_NOMBRE.Text         := FieldByName('st_nombre').AsString;
    fraST_CUIO.Value         := FieldByName('st_cuio').AsString;
    edST_TAREA.Text          := FieldByName('st_tarea').AsString;
    edST_CATEGORIA.Text      := FieldByName('st_categoria').AsString;

    fraDomicilio.CodigoPostal := FieldByName('se_cpostal').AsString;
    fraDomicilio.Calle        := FieldByName('se_calle').AsString;
    fraDomicilio.Localidad    := FieldByName('se_localidad').AsString;
    fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
    fraDomicilio.Numero       := FieldByName('se_numero').AsString;
    fraDomicilio.Piso         := FieldByName('se_piso').AsString;
    fraDomicilio.Departamento := FieldByName('se_departamento').AsString;
    fraDomicilio.CPA          := FieldByName('se_cpostala').AsString;
    StatusBar.SimpleText      := 'Cant. Empleados: ' + FloatToStr(RecordCount);

    if FieldByName('st_preocupacional').AsString = 'S' then
      chST_PREOCUPACIONAL.Checked := True
    else
      chST_PREOCUPACIONAL.Checked := False;

    if FieldByName('st_preexistente').AsString = 'S' then
      chST_PREEXISTENTE.Checked := True
    else
      chST_PREEXISTENTE.Checked := False;

    edST_FECHAINGRESO.Date := FieldByName('st_fechaingreso').AsDateTime;
    edST_FNACIMIENTO.Date  := FieldByName('st_fnacimiento').AsDateTime;
    cmbST_SEXO.ItemIndex   := Pos(FieldByName('st_sexo').AsString, 'FM') - 1;
    edST_SUELDO.Value      := FieldByName('st_sueldo').AsFloat;
    fraOrigenDato.Value    := FieldByName('st_idorigendato').AsInteger;

    chST_CONFIRMAPUESTO.Checked := FieldByName('st_confirmapuesto').AsString = 'N';
  end;

  Caption := ST_MODIFICACION;

  if FCancelarNuevo then
  begin
    CancelarAlta;
    FCancelarNuevo := false;
  end;
end;

procedure TfrmCargaTrabajador.tlbGuardarClick(Sender: TObject);
var
  oldTarea: String;
  oldFechaIngreso: String;
  oldEstablecimiento: TTableId;
begin
  // Control..
  if Caption = ST_MODIFICACION then
    if (not sdqDatos.Eof) and (sdqDatos.FieldByName('st_usubaja').AsString <> '') then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;

  if isValidar then
  begin
    oldTarea           := edST_TAREA.Text;
    oldFechaIngreso    := edST_FECHAINGRESO.Text;
    oldEstablecimiento := fraEstablecimiento.Value;
    DoGuardarTrabajador;
    ActualizarTareas;

    if MsgBox('¿ Desea dar de alta un nuevo trabajador ?', MB_ICONINFORMATION + MB_YESNO) = IDYES then
      tlbNuevoClick(nil);

    edST_TAREA.Text          := oldTarea;
    edST_FECHAINGRESO.Text   := oldFechaIngreso;
    fraEstablecimiento.Value := oldEstablecimiento;
    edST_CUIL.SetFocus;
  end;
end;

function TfrmCargaTrabajador.isValidar: Boolean;
var
  iEdad: Integer;
  sSql: String;
begin
  Result := True;

  // Control.
  if fraEstablecimiento.IsEmpty then
  begin
    InvalidMsg(fraEstablecimiento.edCodigo, 'El establecimiento no puede quedar en blanco.');
    Result := False;
    Exit;
  end;

  if edST_CUIL.Text = '' then
  begin
    InvalidMsg(edST_CUIL, 'El CUIL es un dato obligatorio.');
    Result := False;
    Exit;
  end;

  // para esta validacion se precisa que edST_CUIL.Text <> ''
  sSql :=
    'SELECT 1' +
     ' FROM ast_solicitudtrabajador' +
    ' WHERE st_documento = :documento' +
      ' AND st_idsolicitud = :idsolicitud';
  if (Caption = ST_ALTA) and (ExisteSqlEx(sSql, [Copy(edST_CUIL.Text, 3, 8), FIdSolicitud])) then
  begin
    MsgBox('Ya existe un trabajador con esta C.U.I.L. para esta solicitud.');
    edST_CUIL.SetFocus;
    Result := False;
    Exit;
  end;

  if edST_NOMBRE.Text = '' then
  begin
    InvalidMsg(edST_NOMBRE, 'El nombre es obligatorio.');
    Result := False;
    Exit;
  end;

  if not edST_FNACIMIENTO.IsEmpty then
  begin
//        if caption = ST_ALTA then begin
    if not edST_FECHAINGRESO.IsEmpty then
    begin
      if edST_FNACIMIENTO.Date > edST_FECHAINGRESO.Date then
      begin
        InvalidMsg(edST_FNACIMIENTO, 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso del trabajador.');
        Result := False;
        Exit;
      end;
    end;

    iEdad := GetAge(edST_FNACIMIENTO.Date, DBDateTime);
    if (iEdad < 16) or (iEdad > 90) then
    begin
      InvalidMsg(edST_FNACIMIENTO, 'La edad del trabajador tiene que estar entre los 16 y los 90 años.');
      Result := False;
      Exit;
    end;
//        end;
  end;

  if cmbST_SEXO.Text = '' then
  begin
    InvalidMsg(cmbST_SEXO, 'El sexo no puede quedar en blanco.');
    Result := False;
    Exit;
  end;

  if isDNI(Trim(edST_CUIL.Text)) then
    if not IsCuil(edST_CUIL.Text) then
    begin
      if cmbST_SEXO.Text = 'Femenino' then
        edST_CUIL.Text := GenerarCuit(edST_CUIL.Text, tcFemenino)
      else if cmbST_SEXO.Text = 'Masculino' then
        edST_CUIL.Text := GenerarCuit(edST_CUIL.Text, tcMasculino);
    end;

  Verificar((Caption = ST_ALTA) and (fraOrigenDato.IsEmpty), fraOrigenDato.edCodigo, 'Debe ingresar el origen del dato.');
end;

procedure TfrmCargaTrabajador.DoGuardarTrabajador;
var
  iST_ID            : Integer;
  sST_PREOCUPACIONAL: String;
  sST_PREEXISTENTE  : String;
begin
  with TSql.Create('ast_solicitudtrabajador') do
  try
    Fields.Add('st_tarea',     edST_TAREA.Text);
    Fields.Add('st_cuio',      fraST_CUIO.Value);
    Fields.Add('st_cuil',      edST_CUIL.Text);
    Fields.Add('st_documento', Copy(edST_CUIL.Text, 3, 8));
    Fields.Add('st_nombre',    edST_NOMBRE.Text);
    Fields.Add('st_categoria', edST_CATEGORIA.Text);

    if chST_PREOCUPACIONAL.Checked then
      sST_PREOCUPACIONAL := 'S'
    else
      sST_PREOCUPACIONAL := 'N';
    Fields.Add('st_preocupacional', sST_PREOCUPACIONAL);

    if chST_PREEXISTENTE.Checked then
      sST_PREEXISTENTE := 'S'
    else
      sST_PREEXISTENTE := 'N';
    Fields.Add('st_preexistente', sST_PREEXISTENTE);

    Fields.Add('st_fechaingreso',   edST_FECHAINGRESO.Date);
    Fields.Add('st_fnacimiento',    edST_FNACIMIENTO.Date);
    Fields.Add('st_sexo',           Copy(cmbST_SEXO.Text, 1, 1));
    Fields.AddExtended('st_sueldo', edST_SUELDO.Value, ALL_DECIMALS, False);
    Fields.Add('st_idorigendato',   fraOrigenDato.Value);
    Fields.Add('st_idsolicitud',    FIdSolicitud);
    Fields.Add('st_idsolicitudest', fraEstablecimiento.Value);
    Fields.Add('st_confirmapuesto', String(IIF(chST_CONFIRMAPUESTO.Checked, 'N', 'S')));

    if Caption = ST_ALTA then
    begin
      SqlType := stInsert;

      iST_ID := ValorSql('SELECT afi.seq_ast_id.NEXTVAL FROM DUAL');
      PrimaryKey.Add('st_id',     iST_ID, False);
      Fields.Add('st_fechaalta', 'Actualdate', False);
      Fields.Add('st_usualta',    frmPrincipal.DBLogin.UserId);
    end
    else if Caption = ST_MODIFICACION then
    begin
      SqlType := stUpdate;
      PrimaryKey.Add('st_id',     sdqDatos.fieldByName('st_id').AsInteger, False);
      Fields.Add('st_fechamodif', 'Actualdate', False);
      Fields.Add('st_usumodif',   frmPrincipal.DBLogin.UserId);
    end;

    EjecutarSQL(Sql);
    MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    sdqDatos.Close;
    OpenQuery(sdqDatos);
  finally
    Free;
  end;

  ArtDBGrid.SetFocus;
end;

procedure TfrmCargaTrabajador.tlbBajaClick(Sender: TObject);
begin
  if (not sdqDatos.Eof) and (sdqDatos.FieldByName('st_usubaja').AsString <> '') then
  begin
    MsgBox('Este registro se encuentra dado de baja.');
    Abort;
  end;

  if not sdqDatos.Eof then
  begin
    if MsgBox('¿ Realmente desea borrar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
    begin
      with TSql.Create('AST_SOLICITUDTRABAJADOR') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('st_id',     sdqDatos.fieldByName('st_id').AsInteger, False);
        Fields.Add('st_fechabaja', 'Actualdate', False);
        Fields.Add('st_usubaja',    frmPrincipal.DBLogin.UserId);

        EjecutarSQL(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        OpenQuery(sdqDatos);
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmCargaTrabajador.DoCargaIDSolicitud(aId: Integer);
var
  IdEstablecimiento: TTableId;
  sSql: String;
begin
  FIdSolicitud := aId;

  sdqCUIT.ParamByName('iidparam').AsInteger := FIdSolicitud;
  OpenQuery(sdqCUIT);

  edCUIT.Text          := sdqCUIT.FieldByName('sa_cuit').AsString;
  edRazonSocial.Text   := sdqCUIT.FieldByName('sa_nombre').AsString;
  edSA_FORMULARIO.Text := sdqCUIT.FieldByName('fo_formulario').AsString;
  sdqCUIT.Close;

  fraEstablecimiento.TableName      := 'ase_solicitudestablecimiento';
  fraEstablecimiento.FieldCodigo    := 'se_nroestableci';
  fraEstablecimiento.FieldDesc      := 'se_nombre';
  fraEstablecimiento.ExtraFields    := ', art.utiles.armar_domicilio(se_calle, se_numero, se_piso, se_departamento, NULL) ' +
                                      ' || art.utiles.armar_localidad(se_cpostal, NULL, se_localidad, se_provincia) domicilio ';
  fraEstablecimiento.FieldID        := 'se_id';
  fraEstablecimiento.ExtraCondition := ' AND se_fechabaja IS NULL AND se_idsolicitud = ' + SqlValue(FIdSolicitud);
  fraEstablecimiento.ShowBajas      := False;

  sdqDatos.ParamByName('iidparam').AsInteger := FIdSolicitud;
  OpenQuery(sdqDatos);

  if sdqDatos.Eof then
  begin
    Caption := ST_ALTA;

    // Si es un alta y solo hay un Establecimiento lo carga automaticamente.
    sSql :=
      'SELECT se_id' +
       ' FROM ase_solicitudestablecimiento' +
      ' WHERE se_idsolicitud = :idsolicitud';
    IdEstablecimiento := ValorSQLIntegerEx(sSql, [FIdSolicitud]);
    if IdEstablecimiento <> ART_EMPTY_ID then
    begin
      fraEstablecimiento.Value := IdEstablecimiento;
      fraEstablecimientoExit(nil);
    end;
  end
  else
    Caption := ST_MODIFICACION;
end;

procedure TfrmCargaTrabajador.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                     var Background: TColor; Highlight: Boolean);
begin
  if sdqDatos.FieldByName('st_usubaja').AsString <> '' then
    AFont.Color := clRed;
end;

procedure TfrmCargaTrabajador.FormCreate(Sender: TObject);
begin
  inherited;

  FDBGrid := ArtDBGrid;
  FDBGrid.DataSource := sdDatos;

  FCancelarNuevo := False;
  fraST_CUIO.Clave := 'TAREA';
  fraST_CUIO.CaseSensitive := False;
  fraST_CUIO.ExtraCondition := 'AND LENGTH(tb_codigo) = 4 ';

  ActualizarTareas;

  LoadDynamicSortFields(SortDialog.SortFields, FDBGrid.Columns);
  Seguridad.Ejecutar;
end;

procedure TfrmCargaTrabajador.edST_CUILExit(Sender: TObject);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  if edST_CUIL.Text <> '' then
  begin
    Verificar(((not isDNI(Trim(edST_CUIL.Text))) and (not IsCuil(edST_CUIL.Text))), edST_CUIL, 'El dato ingresado no es un D.N.I. ni una C.U.I.L.');

    sSql :=
      'SELECT   st_cuil, st_nombre, st_cuio, st_tarea, st_fnacimiento, st_sexo' +
         ' FROM ast_solicitudtrabajador' +
        ' WHERE st_documento = :documento' +
          ' AND st_idsolicitud <> :idsolicitud' +
     ' GROUP BY st_cuil, st_nombre, st_cuio, st_tarea, st_fnacimiento, st_sexo';
    aQuery := GetQueryEx(sSql, [Copy(edST_CUIL.Text, 3, 8), FIdSolicitud]);
    with aQuery do                        
    try
      if not IsEmpty then
      begin
        edST_CUIL.Text        := FieldByName('st_cuil').AsString;
        edST_NOMBRE.Text      := FieldByName('st_nombre').AsString;
        fraST_CUIO.Value      := FieldByName('st_cuio').AsString;
        edST_TAREA.Text       := FieldByName('st_tarea').AsString;
        edST_FNACIMIENTO.Date := FieldByName('st_fnacimiento').AsDateTime;
        cmbST_SEXO.ItemIndex  := Pos(FieldByName('st_sexo').AsString, 'FM') - 1;
      end
      else
      begin
        Close;
        Sql.Text :=
          'SELECT tj_cuil, tj_nombre, tj_fnacimiento, tj_sexo' +
           ' FROM ctj_trabajador' +
          ' WHERE tj_documento = :documento';
        OpenQueryEx(aQuery, [Copy(edST_CUIL.Text, 3, 8)]);

        if not IsEmpty then
        begin
          edST_CUIL.Text        := FieldByName('tj_cuil').AsString;
          edST_NOMBRE.Text      := FieldByName('tj_nombre').AsString;
          edST_FNACIMIENTO.Date := FieldByName('tj_fnacimiento').AsDateTime;
          cmbST_SEXO.ItemIndex  := Pos(FieldByName('tj_sexo').AsString, 'FM') - 1;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmCargaTrabajador.edST_FECHAINGRESOExit(Sender: TObject);
begin
  if not edST_FECHAINGRESO.IsEmpty then
    if Caption = ST_ALTA then
      Verificar((Trunc((DBDateTime - edST_FECHAINGRESO.Date) / 365.25) >= 80), edST_FECHAINGRESO, 'La fecha de ingreso no puede ser mayor a 80 años desde la fecha de carga del trabajador.');
end;

procedure TfrmCargaTrabajador.edST_FNACIMIENTOExit(Sender: TObject);
var
  iEdad: Integer;
begin
  if (not edST_FNACIMIENTO.IsEmpty) and (Caption = ST_ALTA) then
  begin
    Verificar((not edST_FECHAINGRESO.IsEmpty) and (edST_FNACIMIENTO.Date > edST_FECHAINGRESO.Date), edST_FNACIMIENTO, 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso del trabajador.');

    iEdad := GetAge(edST_FNACIMIENTO.Date, DBDateTime);
    Verificar((iEdad < 16) or (iEdad > 90), edST_FNACIMIENTO, 'La edad del trabajador tiene que estar entre los 16 y los 90 años.');
  end;
end;

procedure TfrmCargaTrabajador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action             := caFree;
  frmCargaTrabajador := nil;
  
  inherited;
end;

procedure TfrmCargaTrabajador.tlbSolicitudClick(Sender: TObject);
begin
  frmCargaSolicitudes.Free;
  frmCargaSolicitudes := TfrmCargaSolicitudes.Create(frmPrincipal);
  frmCargaSolicitudes.Mostrar(False);
  frmCargaSolicitudes.DoCargaDatosSolicitud(FIdSolicitud);
end;

procedure TfrmCargaTrabajador.tlbSRTClick(Sender: TObject);
begin
  frmCargaSRT.Free;
  frmCargaSRT := TfrmCargaSRT.Create(frmPrincipal);
  frmCargaSRT.DoCargaIDSolicitud(FIdSolicitud);
end;

procedure TfrmCargaTrabajador.tlbEstablecimientoClick(Sender: TObject);
begin
  frmCargaEstablecimiento.Free;
  frmCargaEstablecimiento := TfrmCargaEstablecimiento.Create(frmPrincipal);
  frmCargaEstablecimiento.DoCargaIDSolicitud(FIdSolicitud);
end;

procedure TfrmCargaTrabajador.tlbImprimirClick(Sender: TObject);
begin
  rptNomina := TrptNomina.create(Self);
  try
    rptNomina.sdqReporte.ParamByName('isa_id').AsInteger := FIdSolicitud;
    OpenQuery(rptNomina.sdqReporte);
    rptNomina.Print;
  finally
    rptNomina.Free;
  end;
end;

procedure TfrmCargaTrabajador.fraEstablecimientoExit(Sender: TObject);
var
  sSql: String;
begin
  fraEstablecimiento.FrameExit(Sender);

  if not fraEstablecimiento.IsEmpty then
  begin
    sSql :=
      'SELECT se_calle, se_cpostal, se_localidad, pv_descripcion, se_numero, se_piso, se_departamento, se_cpostala' +
       ' FROM ase_solicitudestablecimiento, cpv_provincias' +
      ' WHERE se_provincia = pv_codigo(+)' +
        ' AND se_id = :id';
    with GetQueryEx(sSql, [fraEstablecimiento.Value]) do
    try
      fraDomicilio.Calle        := FieldByName('se_calle').AsString;
      fraDomicilio.CodigoPostal := FieldByName('se_cpostal').AsString;
      fraDomicilio.Localidad    := FieldByName('se_localidad').AsString;
      fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
      fraDomicilio.Numero       := FieldByName('se_numero').AsString;
      fraDomicilio.Piso         := FieldByName('se_piso').AsString;
      fraDomicilio.Departamento := FieldByName('se_departamento').AsString;
      fraDomicilio.CPA          := FieldByName('se_cpostala').AsString;
    finally
      Free;
    end;
  end
  else
    fraDomicilio.Clear;
end;

procedure TfrmCargaTrabajador.edST_SUELDOExit(Sender: TObject);
begin
  if edST_SUELDO.Value > 9999999999.99 then
    InvalidMsg(edST_SUELDO, 'El importe no puede superar los 9999999999.99.');
end;

procedure TfrmCargaTrabajador.FormActivate(Sender: TObject);
begin
  edST_CUIL.SetFocus;
end;

procedure TfrmCargaTrabajador.ActualizarTareas;
var
  sSql: String;
begin
  edST_TAREA.Items.Clear;

  sSql :=
    'SELECT DISTINCT st_tarea' +
              ' FROM ast_solicitudtrabajador' +
          ' ORDER BY st_tarea';
  LoadStrings(sSql, edST_TAREA.Items);
end;

procedure TfrmCargaTrabajador.ArtDBGridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla: TPopUpMenu;
  Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqDatos.Active and (not sdqDatos.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);
      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
      Item := TMenuItem.Create(Self);
      Item.Caption := 'Buscar...';
      Item.OnClick := BuscarTrabajador;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;

    MenuGrilla.PopUp(ArtDBGrid.ClientToScreen(MousePos).X , ArtDBGrid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmCargaTrabajador.btnDesmarcarTodos(Sender: TObject);
begin
  ArtDBGrid.UnselectAll;
end;

procedure TfrmCargaTrabajador.btnMarcarTodos(Sender: TObject);
begin
  ArtDBGrid.SelectAll;
end;

procedure TfrmCargaTrabajador.BuscarTrabajador(Sender: TObject);
begin
  fpBusqueda.ShowModal;
end;

procedure TfrmCargaTrabajador.btSalirClick(Sender: TObject);
begin
  fpBusqueda.ModalResult := mrOk;
end;

procedure TfrmCargaTrabajador.edCUILChange(Sender: TObject);
begin
  if rbCUIL.Checked then
    sdqDatos.Locate('st_cuil', edCUIL.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCargaTrabajador.edDocumentoChange(Sender: TObject);
begin
  if rbDocumento.Checked then
    sdqDatos.Locate('st_documento', edDocumento.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCargaTrabajador.edNombreChange(Sender: TObject);
begin
  if rbNombre.Checked then
    sdqDatos.Locate('st_nombre', edNombre.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCargaTrabajador.edCUILEnter(Sender: TObject);
begin
  edDocumento.Text := '';
  ednombre.Text := '';
  rbCUIL.Checked := True;
end;

procedure TfrmCargaTrabajador.edDocumentoEnter(Sender: TObject);
begin
  edCuil.Text := '';
  ednombre.Text := '';
  rbDocumento.Checked := True;
end;

procedure TfrmCargaTrabajador.edNombreEnter(Sender: TObject);
begin
  edDocumento.Text := '';
  edCUIL.Text := '';
  rbNombre.Checked := True;
end;

procedure TfrmCargaTrabajador.tlbReactivarClick(Sender: TObject);
begin
  if not sdqDatos.Eof and (sdqDatos.FieldByName('st_usubaja').AsString = '') then
  begin
    MsgBox('Este registro no se encuentra dado de baja.');
    Abort;
  end;

  if not sdqDatos.Eof then
  begin
    if MsgBox('¿ Realmente desea reactivar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
    begin
      with TSql.Create('ast_solicitudtrabajador') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('st_id',    sdqDatos.fieldByName('st_id').AsInteger, False);
        Fields.Add('st_fechabaja', exNull);
        Fields.Add('st_usubaja',   exNull);

        EjecutarSQL(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        OpenQuery(sdqDatos);
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmCargaTrabajador.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, FDBGrid.Columns);
  SortDialog.Execute;
end;

procedure TfrmCargaTrabajador.LoadDynamicSortFields(ASortFields: TSortFields; AColumns: TDBGridColumns);
begin
  if SortDialog.SortFields.Count <> FDBGrid.Columns.Count then
  begin
    AsortFields.Clear;
    unArt.LoadDynamicSortFields(ASortFields, AColumns);
  end;
end;

procedure TfrmCargaTrabajador.sdqDatosAfterOpen(DataSet: TDataSet);
var
  AMetodo: TDataSetNotifyEvent;
begin
  if Assigned(FDBGrid) and (FDBGrid.Columns.State = csDefault) then
  begin
    AMetodo := sdqDatos.AfterScroll;
    sdqDatos.AfterScroll := nil;
    try
      DynColWidthsByData(FDBGrid);
    finally
      sdqDatos.AfterScroll := AMetodo;
    end;
  end;
end;

end.
