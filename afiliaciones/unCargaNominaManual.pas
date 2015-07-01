unit unCargaNominaManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtDbFrame, unFraEmpresa, ShortCutControl,
  Db, SDEngine, StdCtrls, FormPanel, ComCtrls, PatternEdit, ListSearchEdit, unFraDomicilio, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, Mask, CurrEdit, ToolEdit, DateComboBox, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ToolWin, unFraEstablecimiento, IntEdit, ExtCtrls, QueryToFile, ExportDialog, QueryPrint, unFraDomicilioTrab,
  SortDlg, FieldHider, unArtDBAwareFrame, Placemnt, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, PeriodoPicker,
  Variants, unFraCodDesc, artSeguridad, Internet;

type
  TfrmCargaNominaManual = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tblSeparador1: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbEstablecimiento: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    grbIdentifica: TGroupBox;
    lbEstablecimento: TLabel;
    grbDomicilio: TGroupBox;
    grbEmpresa: TGroupBox;
    StatusBar: TStatusBar;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    ShortCutControl: TShortCutControl;
    fraEmpresa: TfraEmpresa;
    Grid: TArtDBGrid;
    gbDatosTrabajador: TGroupBox;
    lbNombre: TLabel;
    lbAlta: TLabel;
    lbFNacimiento: TLabel;
    lbTarea: TLabel;
    lbSexo: TLabel;
    lbMasaSalarial: TLabel;
    lbCategoria: TLabel;
    lbCUIL: TLabel;
    Label1: TLabel;
    edTJ_NOMBRE: TEdit;
    edRL_FECHAINGRESO: TDateComboBox;
    edTJ_FNACIMIENTO: TDateComboBox;
    edRL_SUELDO: TCurrencyEdit;
    edTJ_CUIL: TMaskEdit;
    cmbTJ_SEXO: TComboBox;
    chRL_PREOCUPACIONAL: TCheckBox;
    chRL_PREEXISTENTE: TCheckBox;
    fpBusqueda: TFormPanel;
    GroupBox1: TGroupBox;
    rbCUIL: TRadioButton;
    rbNombre: TRadioButton;
    edNombre: TEdit;
    edCUIL: TMaskEdit;
    rbDocumento: TRadioButton;
    edDocumento: TMaskEdit;
    btSalir: TButton;
    fraEstablecimiento: TfraEstablecimiento;
    cmbRL_FECHARECEPCION: TDateComboBox;
    Label2: TLabel;
    tbClear: TToolButton;
    ToolButton1: TToolButton;
    btnAgregar: TButton;
    GroupBox3: TGroupBox;
    edSeleccionados: TIntEdit;
    rbVerBaja: TRadioButton;
    Label3: TLabel;
    rbVerActivos: TRadioButton;
    tbReactivar: TToolButton;
    ToolButton3: TToolButton;
    fpFecha: TFormPanel;
    btnFecha: TButton;
    lblFecha: TLabel;
    cmbFechaBaja: TDateComboBox;
    Bevel1: TBevel;
    edRL_TAREA: TEdit;
    btnActualizar: TButton;
    chkCantEmpleados: TCheckBox;
    btnSalir2: TButton;
    tbExportar: TToolButton;
    ToolButton4: TToolButton;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    ExportDialog: TExportDialog;
    fraDomicilio: TfraDomicilioTrab;
    tbOrdenar: TToolButton;
    SortDialog: TSortDialog;
    tbMostrarOcultarColumnas: TToolButton;
    FieldHider: TFieldHider;
    lblRecepcion: TLabel;
    cmbFechaRecepcion: TDateComboBox;
    FormStorage: TFormStorage;
    fraTJ_LATERALIDADDOMINANTE: TfraStaticCTB_TABLAS;
    Label5: TLabel;
    Label24: TLabel;
    fraTJ_ESTADOCIVIL: TfraStaticCTB_TABLAS;
    fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    edTJ_OTRANACIONALIDAD: TEdit;
    Label13: TLabel;
    edRL_SECTOR: TEdit;
    Label25: TLabel;
    fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion;
    edRL_ULTIMANOMINA: TPeriodoPicker;
    Label12: TLabel;
    chkTrabNoDevengable: TCheckBox;
    lbCantEmpleados: TLabel;
    fpCambiarEstablecimiento: TFormPanel;
    Label4: TLabel;
    btnAceptar: TButton;
    lbEstablecimiento: TLabel;
    tbContacto: TToolButton;
    tbVerHistorial: TToolButton;
    sdspSaveTrabajador: TSDStoredProc;
    edRL_CATEGORIA: TEdit;
    Label6: TLabel;
    edSuss: TEdit;
    Label7: TLabel;
    fraOrigenDato: TfraCodDesc;
    Seguridad: TSeguridad;
    edModalidadPresentacion: TEdit;
    fraMotivoBaja: TfraStaticCTB_TABLAS;
    lbMotivoBaja: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    edMiSimplificacion: TEdit;
    chkConfirmado: TCheckBox;
    fraRL_CIUO: TfraStaticCodigoDescripcion;
    edTJ_MAIL: TEdit;
    Label8: TLabel;
    procedure btSalirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tlbNuevoClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbEstablecimientoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edTJ_CUILKeyPress(Sender: TObject; var Key: Char);
    procedure edTJ_CUILExit(Sender: TObject);
    procedure edDocumentoEnter(Sender: TObject);
    procedure edCUILEnter(Sender: TObject);
    procedure edNombreEnter(Sender: TObject);
    procedure edCUILChange(Sender: TObject);
    procedure edDocumentoChange(Sender: TObject);
    procedure edNombreChange(Sender: TObject);
    procedure tbClearClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CambiaEmpresa(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
    procedure tbReactivarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnActualizarClick(Sender: TObject);
    procedure chkCantEmpleadosClick(Sender: TObject);
    procedure btnSalir2Click(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure OnfraTJ_IDNACIONALIDADChange(Sender: TObject);
    procedure fpCambiarEstablecimientoKeyPress(Sender: TObject; var Key: Char);
    procedure fpCambiarEstablecimientoShow(Sender: TObject);
    procedure fpCambiarEstablecimientoClose(Sender: TObject; var Action: TCloseAction);
    procedure fraEstablecimientoedCodigoChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbContactoClick(Sender: TObject);
    procedure tbVerHistorialClick(Sender: TObject);
    procedure fraRL_CIUOExit(Sender: TObject);
  private
    FEsAlta: Boolean; //Cuidado con EsAlta(property)

    procedure SetAlta(const aValue: Boolean);
  private
    function GuardarTrabajador(const aIdTrabajador: Integer): Integer;
    function IsValidar: Boolean;

    procedure ActualizarBotones;
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure BuscarTrabajador(Sender: TObject);
    procedure CalcularFilas;
    procedure CambiarEstablecimiento(Sender: TObject);
    procedure CargaCuil;
    procedure ClearControls;
    procedure DoGuardarTrabajador(Sender: TObject);
    procedure LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
    procedure LoadFechaMiSimplificacion(const aCuit: String);

    property EsAlta: Boolean read FEsAlta write SetAlta;
  public
  end;

var
  frmCargaNominaManual: TfrmCargaNominaManual;

implementation

uses
  unContratoEstablecimiento, CustomDlgs, unDmPrincipal, unPrincipal, CUIT, General, AnsiSQL, SqlFuncs, DateTimeFuncs,
  unArt, VCLExtra, menus, unAfiliaciones, StrFuncs, unContratoContacto, unSesion, unHistoricoCargaNomina;

{$R *.DFM}

const
  TJ_ALTA        : String = 'Carga de Trabajadores [ALTA]';
  TJ_MODIFICACION: String = 'Carga de Trabajadores [MODIFICACION]';
  TJ_BAJA        : String = 'Carga de Trabajadores [BAJA]';

procedure TfrmCargaNominaManual.btSalirClick(Sender: TObject);
begin
  fpBusqueda.ModalResult := mrOk;
end;

procedure TfrmCargaNominaManual.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaNominaManual.tlbBajaClick(Sender: TObject);
var
  iFilas: Integer;
  iLoop: Integer;
  sMensaje: String;
  sSql: String;
begin
  iFilas := Grid.SelectedRows.Count;
  if (sdqDatos.Eof) or (iFilas < 1) or (sdqDatos.FieldByName('esbaja').AsString = 'S') then
    raise Exception.Create('Debe elegir un trabajador activo.');

  if iFilas = 1 then
    sMensaje := '¿ Realmente desea borrar este registro ?'
  else
    sMensaje := '¿ Realmente desea borrar estos registros ?';

  if MsgBox(sMensaje, MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
  begin
    //Pregunta por la fecha a utilizar
    cmbFechaBaja.Date := Date;
    cmbFechaRecepcion.Date := Date;
    fraMotivoBaja.Clear;
    
    lblFecha.Caption := 'Fecha de baja';
    cmbFechaRecepcion.Show;
    lblRecepcion.Show;
    fraMotivoBaja.Show;
    lbMotivoBaja.Show;

    if fpFecha.ShowModal = mrOk then
      if IsValidar then
      begin
        DoGuardarTrabajador(nil);
        try
          BeginTrans;
          for iLoop := 0 to iFilas - 1 do
          begin
            sdqDatos.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
            BorrarTrabajador(sdqDatos.FieldByName('rl_id').AsInteger, cmbFechaBaja.Date, frmPrincipal.DBLogin.UserId,
                             cmbFechaRecepcion.Date, fraMotivoBaja.Value);

            sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:cuil, :user); END;';
            EjecutarSqlSTEx(sSql, [GetIdTrabajadorPorCuil(sdqDatos.FieldByName('tj_cuil').AsString), Sesion.UserID]);
          end;
          CommitTrans;
          sdqDatos.Refresh;//Actualiza la grilla
          Grid.UnSelectAll;

          //Lo informa al usuario
          if iFilas = 1 then
            sMensaje := 'El trabajador ha sido dado de baja.'
          else
            sMensaje := 'Los trabajadores han sido dados de baja.';
          MessageDlg(sMensaje, mtInformation, [mbOK], 0);
        except
          on E:Exception do
          begin
            Rollback;
            MessageDlg('Se ha producido un error al eliminar los trabajadores.' + #13#10 + E.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
  end;
end;

procedure TfrmCargaNominaManual.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas             := True;
  fraEmpresa.OnChange              := CambiaEmpresa;
  fraEstablecimiento.fraEmpresa    := fraEmpresa;
  fraMotivoBaja.Clave              := 'MOTIB';
  fraTJ_ESTADOCIVIL.Clave          := 'ESTAD';
  fraTJ_LATERALIDADDOMINANTE.Clave := 'LATDO';

  with fraRL_IDMODALIDADCONTRATACION do
  begin
    TableName   := 'cmc_modalidadcontratacion';
    FieldID     := 'mc_id';
    FieldCodigo := 'mc_codigo';
    FieldDesc   := 'mc_descripcion';
    FieldBaja   := 'mc_fechabaja';
  end;

  with fraTJ_IDNACIONALIDAD do
  begin
    TableName   := 'cna_nacionalidad';
    FieldID     := 'na_id';
    FieldCodigo := 'na_codigo_srt';
    FieldDesc   := 'na_descripcion';
    FieldBaja   := 'na_fechabaja';
    OnChange    := OnfraTJ_IDNACIONALIDADChange;
  end;

  with fraRL_CIUO do
  begin
    TableName      := 'cci_ciuo';
    FieldID        := 'ci_codigo';
    FieldCodigo    := 'ci_codigo';
    FieldDesc      := 'ci_descripcion';
    ExtraCondition := ' AND LENGTH(ci_codigo) = 4';
  end;

  frmPrincipal.mnuCargaMasivaManual.Enabled := False;

  CambiaEmpresa(nil);

  //*** Pidio GGROSSI y asegura que EVILA dio el Ok
  edModalidadPresentacion.Clear;
  edModalidadPresentacion.Color := clWindow;

  edMiSimplificacion.Clear;
  edMiSimplificacion.Color := clWindow;
  //****

  VCLExtra.LockControls(fraDomicilio, True);
end;

procedure TfrmCargaNominaManual.CambiaEmpresa(Sender: TObject);
var
  sEstado: String;
  sSql: String;
begin
  if fraEmpresa.IsSelected then
  begin
    if fraEmpresa.IsBaja then
    begin
      sSql :=
        'SELECT tb_descripcion' +
         ' FROM aco_contrato, ctb_tablas' +
        ' WHERE co_estado = tb_codigo' +
          ' AND tb_clave = ''AFEST''' +
          ' AND co_contrato = :contrato';
      sEstado := ValorSqlEx(sSql, [fraEmpresa.edContrato.Text]);
      MessageDlg('El estado de la empresa es: ' + sEstado, mtWarning, [mbOK], 0);
    end;
    FEsAlta := False;
    VCLExtra.LockControls(gbDatosTrabajador, rbVerBaja.Checked);
    VCLExtra.LockControls(edRL_ULTIMANOMINA, True);
  end
  else
  begin
    ClearControls;
    VCLExtra.LockControls(gbDatosTrabajador, True);
    StatusBar.SimpleText := 'Cant. Empleados: --';
    lbCantEmpleados.Caption := StatusBar.SimpleText;
    sdqDatos.Close;
  end;

  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas LEFT JOIN aem_empresa ON(tb_codigo = em_suss)' +
    ' WHERE tb_clave = ''SUSS''' +
      ' AND em_cuit = :cuit';
  edSuss.Text := ValorSqlEx(sSql, [fraEmpresa.CUIT]);

  sSql :=
    'SELECT mp_descripcion, mp_id' +
     ' FROM emi.imp_modopresentacion' +
    ' WHERE mp_id = emi.utiles.get_modopresentacion(:idempresa, :periodo)';
  with GetQueryEx(sSql, [fraEmpresa.ID, FormatDateTime('yyyymm', IncMonth(DBDate, -1))]) do
  try
    edModalidadPresentacion.Text := FieldByName('mp_descripcion').AsString;
    if FieldByName('mp_id').AsInteger = 1 then
      edModalidadPresentacion.Color := clRed
    else if FieldByName('mp_id').AsInteger = 2 then
      edModalidadPresentacion.Color := clGreen
    else if FieldByName('mp_id').AsInteger = 3 then
      edModalidadPresentacion.Color := clGreen
    else
      edModalidadPresentacion.Color := clBtnFace;
  finally
    Free;
  end;

  LoadFechaMiSimplificacion(fraEmpresa.CUIT);

  if Is_DDJJEmptyUltPeriodo(fraEmpresa.edContrato.Value) and Is_EmpresaPagoSUSS(fraEmpresa.edContrato.Value) then
    MsgBox('La última DDJJ de este contrato, se encuentra sin empleados.', MB_OK + MB_ICONINFORMATION);


  ActualizarBotones;
end;

procedure TfrmCargaNominaManual.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla: TPopUpMenu;
  Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if (sdqDatos.Active) and (not sdqDatos.Eof) then
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

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Cambiar Establecimiento...';
      Item.OnClick := CambiarEstablecimiento;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '(Consulta sin datos...)';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmCargaNominaManual.tlbNuevoClick(Sender: TObject);
begin
  EsAlta := not FEsAlta;  //Cuidado al cambiar aca. EsAlta es una property que llama al proceso SetAlta
end;

procedure TfrmCargaNominaManual.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  Caption := TJ_MODIFICACION;
  fraOrigenDato.Propiedades.ExtraCondition := '';
  with sdqDatos do
  begin
    fraEstablecimiento.Value            := FieldByName('es_id').AsInteger;
    edTJ_CUIL.Text                      := FieldByName('tj_cuil').AsString;
    edTJ_NOMBRE.Text                    := FieldByName('tj_nombre').AsString;
    fraRL_CIUO.Codigo                   := FieldByName('rl_ciuo').AsString;
    fraRL_IDMODALIDADCONTRATACION.Value := FieldByName('rl_idmodalidadcontratacion').AsInteger;
    fraOrigenDato.Value                 := FieldByName('rl_idorigendato').AsInteger;
    edRL_TAREA.Text                     := FieldByName('rl_tarea').AsString;
    edRL_CATEGORIA.Text                 := FieldByName('rl_categoria').AsString;
    fraTJ_ESTADOCIVIL.Value             := FieldByName('tj_estadocivil').AsString;
    edTJ_MAIL.Text                      := FieldByName('tj_mail').AsString;
    fraTJ_IDNACIONALIDAD.Value          := FieldByName('tj_idnacionalidad').AsInteger;
    OnfraTJ_IDNACIONALIDADChange(nil);
    edTJ_OTRANACIONALIDAD.Text          := FieldByName('tj_otranacionalidad').AsString;
    edRL_SECTOR.Text                    := FieldByName('rl_sector').AsString;
    edRL_ULTIMANOMINA.Periodo.Valor     := FieldByName('rl_ultimanomina').AsString;

    //DIRECCION A LA ANTIGUA
    fraDomicilio.CodigoPostal := FieldByName('es_cpostal').AsString;
    fraDomicilio.Calle        := FieldByName('es_calle').AsString;
    fraDomicilio.Localidad    := FieldByName('es_localidad').AsString;
    fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
    fraDomicilio.Numero       := FieldByName('es_numero').AsString;
    fraDomicilio.Piso         := FieldByName('es_piso').AsString;
    fraDomicilio.Departamento := FieldByName('es_departamento').AsString;
    fraDomicilio.CPA          := FieldByName('es_cpostala').AsString;

    chRL_PREOCUPACIONAL.Checked      := (FieldByName('rl_preocupacional').AsString = 'S');
    chRL_PREEXISTENTE.Checked        := (FieldByName('rl_preexistente').AsString = 'S');
    chkTrabNoDevengable.Checked      := (FieldByName('rl_estado').AsString = 'S');
    edRL_FECHAINGRESO.Date           := FieldByName('rl_fechaingreso').AsDateTime;
    edTJ_FNACIMIENTO.Date            := FieldByName('tj_fnacimiento').AsDateTime;
    cmbRL_FECHARECEPCION.Date        := FieldByName('rl_fecharecepcion').AsDateTime;
    cmbTJ_SEXO.ItemIndex             := Pos(FieldByName('tj_sexo').AsString, 'FM') - 1;
    fraTJ_LATERALIDADDOMINANTE.Value := FieldByName('tj_lateralidaddominante').AsString;
    edRL_SUELDO.Value                := FieldByName('rl_sueldo').AsFloat;
    chkConfirmado.Checked            := FieldByName('rl_confirmapuesto').AsString = 'N';
  end;
  
  VCLExtra.LockControls([fraEstablecimiento], True);
  ActualizarBotones;
end;

procedure TfrmCargaNominaManual.tlbGuardarClick(Sender: TObject);
var
  oldFechaIngreso: TDateTime;
  oldFechaRecepcion: TDateTime;
  oldTarea: String;
begin
  if IsValidar then
  begin
    DoGuardarTrabajador(Sender);
    oldTarea          := edRL_TAREA.Text;
    oldFechaIngreso   := edRL_FECHAINGRESO.Date;
    oldFechaRecepcion := cmbRL_FECHARECEPCION.Date;
    CambiaEmpresa(nil);

    if MsgBox('¿ Desea dar de alta un nuevo trabajador ?', MB_ICONINFORMATION + MB_YESNO) = IDYES then
      tlbNuevoClick(nil);
      
    edRL_TAREA.Text           := oldTarea;
    cmbRL_FECHARECEPCION.Date := oldFechaRecepcion;
    edRL_FECHAINGRESO.Date    := oldFechaIngreso;
    edTJ_CUIL.SetFocus;
  end;
end;

function TfrmCargaNominaManual.IsValidar: Boolean;
var
  IdTrabajador: TTableId;
  iEdad: Integer;
  sCuilValido: String;
  sSql: String;
begin
  Result := True;

  Verificar(fraEstablecimiento.IsEmpty, fraEstablecimiento.edCodigo, 'El establecimiento no puede quedar en blanco.');
  Verificar((edTJ_CUIL.Text = ''), edTJ_CUIL, 'El CUIL es un dato obligatorio.');
  Verificar((not IsCuil(edTJ_CUIL.Text)), edTJ_CUIL, 'El CUIL no es válido.');
  Verificar((Trim(edTJ_NOMBRE.Text) = ''), edTJ_NOMBRE, 'El nombre es obligatorio.');
  Verificar((cmbTJ_SEXO.Text = ''), cmbTJ_SEXO, 'El sexo no puede quedar en blanco.');

  if Is_CUILIndeterminado(edTJ_CUIL.Text) then
  begin
    if Is_GrabarCuilValido(StrMid(edTJ_CUIL.Text, 3, 8), Copy(cmbTJ_SEXO.Text, 1, 1), sCuilValido) then
      edTJ_CUIL.Text := sCuilValido
    else
      Verificar(not IsEmptyString(sCuilValido), edTJ_CUIL, 'Para el DNI y sexo ingresados, ya existe la C.U.I.L. ' + PonerGuiones(sCuilValido) + '.');
  end;
  
    // E-mail
  if edTJ_MAIL.Text <> '' then
    Verificar(not IsEMails(edTJ_MAIL.Text + ';'), edTJ_MAIL, 'El e-Mail no es correcto.');

  // Fecha de ingreso obligatoria tk 31897
  Verificar(edRL_FECHAINGRESO.IsEmpty, edRL_FECHAINGRESO, 'La fecha de ingreso es obligatoria');

  if not edTJ_FNACIMIENTO.IsEmpty then
  begin
    if not edRL_FECHAINGRESO.IsEmpty then
      Verificar((edTJ_FNACIMIENTO.Date > edRL_FECHAINGRESO.Date), edTJ_FNACIMIENTO, 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso del trabajador.');

      iEdad := GetAge(edTJ_FNACIMIENTO.Date, DBDateTime);
      Verificar((iEdad < 16) or (iEdad > 90), edTJ_FNACIMIENTO, 'La edad del trabajador tiene que estar entre los 16 y los 90 años.');
      if (iEdad >= 80) then //tk 54072 siempre que la edad se encuentre entre 80 y 90 años consulte si es correcto
          if MsgBox('La edad del cuil ' + edTJ_CUIL.Text + ' es de ' + IntToStr(iEdad) +'.' + #13#10 +
                    '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
            Exit;

  end;

  Verificar(cmbRL_FECHARECEPCION.IsEmpty, cmbRL_FECHARECEPCION, 'La fecha de recepción es obligatoria.');
  Verificar((cmbRL_FECHARECEPCION.Date > DBDate), cmbRL_FECHARECEPCION, 'La Fecha de Recepción no puede ser posterior al día de hoy.');

  if (not edTJ_FNACIMIENTO.IsEmpty) and (not edRL_FECHAINGRESO.IsEmpty) then
    CheckValidMsg((edTJ_FNACIMIENTO.Date > edRL_FECHAINGRESO.Date), edTJ_FNACIMIENTO, 'La fecha de nacimiento no puede ser mayor a la fecha de ingreso.');

  // Control.. la edad al ingreso de la empresa (tiene que ser mayor a 14 años.)
  if (not edTJ_FNACIMIENTO.IsEmpty)  and (not edRL_FECHAINGRESO.IsEmpty) then
    CheckValidMsg(YearsBetween(edTJ_FNACIMIENTO.Date, edRL_FECHAINGRESO.Date) < 14, edRL_FECHAINGRESO, 'La edad del trabajador no puede ser inferior a 14 años, desde la fecha de ingreso.');

  if not edRL_FECHAINGRESO.IsEmpty then
    CheckValidMsg(YearsBetween(edRL_FECHAINGRESO.Date, DBDate) >= 80, edRL_FECHAINGRESO, 'La fecha de ingreso no puede ser mayor a 80 años desde la fecha de carga del trabajador.');

  if ((Sesion.Sector = 'AFI') or (Sesion.Sector = 'ATCLI') or (Sesion.Sector = 'AFINOM')) and (fraOrigenDato.Codigo <> 'INICIAL') then
  begin
    if not Is_FechaIngresoAltaRelacionLaboralOk(edRL_FECHAINGRESO.Date, edTJ_CUIL.Text, fraEmpresa.Contrato) then
      if MsgBox('La fecha de ingreso difiere en 2 meses o mas, a la fecha del registro actual en el Cuil ' + edTJ_CUIL.Text +'.' + #13#10 +
                '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
      begin
        Result := False;
        Exit;
      end else
      if (not Is_FechaIngresoVigenciaDesdeIngresoTrabajadorOk(edRL_FECHAINGRESO.Date,fraEmpresa.Contrato)) then
        if MsgBox('La fecha de ingreso es menor a la vigencia desde del contrato ' + edTJ_CUIL.Text +'.' + #13#10 +
                  '¿Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) <> ID_YES then
        begin
          Result := False;
          Exit;
        end;
    end;

  IdTrabajador := GetIdTrabajadorPorCuil(edTJ_CUIL.Text);

  if (IdTrabajador < 1) or (GetIdRelacionLaboral(IdTrabajador, fraEmpresa.edContrato.Value) = ART_EMPTY_ID) then  // está dando de alta una nueva relación laboral
  begin
    if IsDocumentoExistenteEnEmpresa(StrMid(edTJ_CUIL.Text, 3, 8)) then
    begin
      InvalidMsg(edTJ_CUIL, 'El documento del trabajador coincide con un CUIT existente.');
      Result := False;
      Exit;
    end;

    Verificar((fraOrigenDato.Value <> 1) and (fraOrigenDato.Value <> 7) and (fraOrigenDato.Value <> 9), fraOrigenDato.edCodigo, 'El origen del dato debe ser "Mi simplificación", "Anexo" o "DDJJ Manual".');

    //--------verificar que no sea un trabajador zombie
    sSql := 'SELECT art.trabajador.estamuerto(:cuil) FROM DUAL';
    Verificar((ValorSqlEx(sSql, [edTJ_CUIL.Text]) = 1), edTJ_CUIL, 'El trabajador esta registrado como fallecido en el sistema.');
  end;
end;

procedure TfrmCargaNominaManual.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmCargaNominaManual.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmCargaNominaManual.BuscarTrabajador(Sender: TObject);
begin
  fpBusqueda.ShowModal;
end;

procedure TfrmCargaNominaManual.CambiarEstablecimiento(Sender: TObject);
var
  aSqlRelEstableci: TSql;
  iIdRelacion: Integer;
  iIdRelEst: Integer;
  iIdTrabajador: Integer;
  iLoop: Integer;
  iNuevoEstablecimientoId: Integer;
  sSql: String;
begin
  if fpCambiarEstablecimiento.ShowModal = mrOk then
  try
    iNuevoEstablecimientoId := fraEstablecimiento.Value;

    aSqlRelEstableci := TSql.Create('cre_relacionestablecimiento');
    try
      BeginTrans;

      for iLoop := 0 to grid.SelectedRows.Count - 1 do
      begin
        sdqDatos.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

        aSqlRelEstableci.Clear;

        iIdTrabajador := GetIdTrabajadorPorCuil(sdqDatos.FieldByName('tj_cuil').AsString);
        iIdRelacion := GetIdRelacionLaboral(iIdTrabajador, fraEmpresa.edContrato.Value);

        sSql :=
          'SELECT re_id' +
           ' FROM cre_relacionestablecimiento' +
          ' WHERE re_idestablecimiento = :idestablecimiento' +
            ' AND re_idrelacionlaboral = :idrelacionlaboral';
        iIdRelEst := ValorSqlEx(sSql, [sdqDatos.FieldByName('es_id').AsInteger, iIdRelacion]);
        if (iIdRelEst < 1) then
        begin
          aSqlRelEstableci.SqlType := stInsert;
          iIdRelEst := ValorSql('SELECT seq_cre_id.NEXTVAL FROM DUAL');
          aSqlRelEstableci.Fields.Add('re_usualta',    frmPrincipal.DBLogin.UserID);
          aSqlRelEstableci.Fields.Add('re_fechaalta', 'ACTUALDATE', False);
        end
        else
        begin
          aSqlRelEstableci.SqlType := stUpdate;
          aSqlRelEstableci.Fields.Add('re_usumodif',   frmPrincipal.DBLogin.UserID);
          aSqlRelEstableci.Fields.Add('re_fechamodif', 'ACTUALDATE', False);
        end;

        aSqlRelEstableci.Fields.Add('re_idestablecimiento',        iNuevoEstablecimientoId);
        aSqlRelEstableci.Fields.AddInteger('re_idrelacionlaboral', iIdRelacion);
        aSqlRelEstableci.PrimaryKey.Add('re_id',                   iIdRelEst, False);

        EjecutarSqlST(aSqlRelEstableci.Sql);
      end;

      CommitTrans;

      if Grid.SelectedRows.Count > 0 then
        btnActualizarClick(nil);

      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    finally
      aSqlRelEstableci.Free;
    end;
  except
    on E:Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end
  else
    fraEstablecimiento.Value := lbEstablecimiento.Tag;
end;

procedure TfrmCargaNominaManual.DoGuardarTrabajador(Sender: TObject);
var
  iIdRelacion: Integer;
  iIdRelEst: Integer;
  iIdTrabajador: Integer;
  aSqlRelEstableci: TSql;
  aSqlRelLaboral: TSql;
  sSql: String;
begin
  aSqlRelLaboral   := TSql.Create('crl_relacionlaboral');
  aSqlRelEstableci := TSql.Create('cre_relacionestablecimiento');
  try
    BeginTrans;
    try
      aSqlRelLaboral.Clear;
      aSqlRelEstableci.Clear;


      //////////////////
      //  TRABAJADOR  //
      //////////////////
      iIdTrabajador := GetIdTrabajadorPorCuil(edTJ_CUIL.Text);
      if iIdTrabajador < 1 then
        iIdTrabajador := GuardarTrabajador(-1)
      else
        GuardarTrabajador(iIdTrabajador);


      ///////////////////////////
      //  CRL_RELACIONLABORAL  //
      ///////////////////////////
      iIdRelacion := GetIdRelacionLaboral(iIdTrabajador, fraEmpresa.edContrato.Value);

      if iIdRelacion < 1 then
      begin
        aSqlRelLaboral.SqlType := stInsert;
        iIdRelacion := ValorSql('SELECT seq_crl_id.NEXTVAL FROM DUAL');
        aSqlRelLaboral.Fields.Add('rl_usualta',      frmPrincipal.DBLogin.UserID);
        aSqlRelLaboral.Fields.Add('rl_fechaalta',    'ACTUALDATE', False);
        aSqlRelLaboral.Fields.Add('rl_idorigendato', 2);
      end
      else
      begin
        aSqlRelLaboral.SqlType := stUpdate;
        //iIdRelacion := sdqDatos.FieldByName('rl_id').AsString;
        aSqlRelLaboral.Fields.Add('rl_usumodif',    frmPrincipal.DBLogin.UserID);
        aSqlRelLaboral.Fields.Add('rl_fechamodif', 'ACTUALDATE', False);
      end;
      aSqlRelLaboral.PrimaryKey.Add('rl_id', iIdRelacion, False);

      //Campos
      aSqlRelLaboral.Fields.Add('rl_contrato',                fraEmpresa.edContrato.Value);
      aSqlRelLaboral.Fields.Add('rl_idtrabajador',            iIdTrabajador, False);
      aSqlRelLaboral.Fields.Add('rl_tarea',                   edRL_TAREA.Text);
      aSqlRelLaboral.Fields.Add('rl_fechaingreso',            edRL_FECHAINGRESO.Date);
      aSqlRelLaboral.Fields.Add('rl_sueldo',                  edRL_SUELDO.Value, dtNumber);
      aSqlRelLaboral.Fields.Add('rl_categoria',               edRL_CATEGORIA.Text);
      aSqlRelLaboral.Fields.Add('rl_fecharecepcion',          cmbRL_FECHARECEPCION.Date);
      aSqlRelLaboral.Fields.Add('rl_sector',                  edRL_SECTOR.Text);
      aSqlRelLaboral.Fields.Add('rl_idmodalidadcontratacion', fraRL_IDMODALIDADCONTRATACION.Value, True);
      aSqlRelLaboral.Fields.Add('rl_idorigendato',            fraOrigenDato.Value, True);
      //no se estaba guardando ciou, necesito que se guarde por tk 48671
      asqlRelLaboral.Fields.Add('rl_ciuo',                    fraRL_CIUO.Codigo, True);
      aSqlRelLaboral.Fields.Add('rl_confirmapuesto',          String(IIF(chkConfirmado.Checked, 'N', 'S')));


      if aSqlRelLaboral.SqlType = stInsert then    // Si es un alta llamó al store procedure correspondiente..
      begin
        sSql := 'art.trabajador.insert_relacionlaboral(:idtrabajador, :fechaingreso, ' +
                                                       SqlNumber(edRL_SUELDO.Value, True) + ', :tarea, NULL, NULL,' +
                                                     ' NULL, :sector, :fecharecepcion, NULL, :contrato, NULL, NULL,' +
                                                       SqlNumber(fraRL_IDMODALIDADCONTRATACION.Value, True) + ', NULL,' +
                                                     ' NULL, :origendato, :usuario, :idrelacion, SYSDATE, :confirma);';
        EjecutarStoreSTEx(sSql, [iIdTrabajador,
                                 TDateTimeEx.Create(edRL_FECHAINGRESO.Date),
                                 edRL_TAREA.Text,
                                 edRL_SECTOR.Text,
                                 TDateTimeEx.Create(cmbRL_FECHARECEPCION.Date),
                                 fraEmpresa.edContrato.Value,
                                 fraOrigenDato.Value,
                                 frmPrincipal.DBLogin.UserID,
                                 iIdRelacion,
                                 IIF(chkConfirmado.Checked, 'N', 'S')
                                 ]);
      end
      else
        EjecutarSqlST(aSqlRelLaboral.Sql);


      ///////////////////////////////////
      //  CRE_RELACIONESTABLECIMIENTO  //
      ///////////////////////////////////
      sSql :=
        'SELECT re_id' +
         ' FROM cre_relacionestablecimiento' +
        ' WHERE re_idestablecimiento = :idestablecimiento' +
          ' AND re_idrelacionlaboral = :idrelacionlaboral';
      iIdRelEst := ValorSqlIntegerEx(sSql, [fraEstablecimiento.Value, iIdRelacion]);
      if (iIdRelEst < 1) then
      begin
        aSqlRelEstableci.SqlType := stInsert;
        iIdRelEst := ValorSql('SELECT seq_cre_id.NEXTVAL FROM DUAL');
        aSqlRelEstableci.Fields.Add('re_usualta',           frmPrincipal.DBLogin.UserID);
        aSqlRelEstableci.Fields.Add('re_fechaalta',        'ACTUALDATE', False);
        aSqlRelEstableci.Fields.Add('re_idestablecimiento', fraEstablecimiento.Value);
        aSqlRelEstableci.Fields.Add('re_idrelacionlaboral', iIdRelacion, False);
      end
      else
      begin
        aSqlRelEstableci.SqlType := stUpdate;
        aSqlRelEstableci.Fields.Add('re_usumodif',    frmPrincipal.DBLogin.UserID);
        aSqlRelEstableci.Fields.Add('re_fechamodif', 'ACTUALDATE', False);
      end;
      aSqlRelEstableci.PrimaryKey.Add('re_id', iIdRelEst, False);

      //Campos
      aSqlRelEstableci.Fields.Add('re_fechaingreso', edRL_FECHAINGRESO.Date);
      EjecutarSqlST(aSqlRelEstableci.Sql);

      // Genero el endoso del trabajador..
      sSql := 'BEGIN art.afiliacion.act_endosotrabajador(:idtrabajador, :user); END;';
      EjecutarSqlSTEx(sSql, [iIdTrabajador, Sesion.UserID]);

      //Termina de grabar a la BD
      CommitTrans;
      if Sender <> nil then
        MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    except
      on E:Exception do
      begin
        RollBack;
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    aSqlRelLaboral.Free;
    aSqlRelEstableci.Free;
  end;
end;

procedure TfrmCargaNominaManual.tlbEstablecimientoClick(Sender: TObject);
begin
  with TfrmContratoEstablecimiento.Create(Self) do
  try
    DoCargarDatos(fraEmpresa.Contrato);
    Visible := False;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCargaNominaManual.ClearControls;
begin
  rbVerActivos.Checked := True;
  edSeleccionados.Clear;
  edTJ_CUIL.Clear;
  edTJ_NOMBRE.Clear;
  fraRL_CIUO.Clear;
  fraRL_IDMODALIDADCONTRATACION.Clear;
  fraOrigenDato.Clear;
  edRL_TAREA.Clear;
  edRL_CATEGORIA.Clear;
  fraTJ_ESTADOCIVIL.Clear;
  edTJ_MAIL.Clear;
  fraTJ_IDNACIONALIDAD.Clear;
  OnfraTJ_IDNACIONALIDADChange(nil);
  edTJ_OTRANACIONALIDAD.Clear;
  edRL_SECTOR.Clear;
  chRL_PREOCUPACIONAL.Checked := False;
  chRL_PREEXISTENTE.Checked := False;
  chkTrabNoDevengable.Checked := False;
  edRL_FECHAINGRESO.Clear;
  cmbRL_FECHARECEPCION.Clear;
  edTJ_FNACIMIENTO.Clear;
  cmbTJ_SEXO.ItemIndex := -1;
  chkConfirmado.Checked := False;
  fraTJ_LATERALIDADDOMINANTE.Clear;
  edRL_SUELDO.Clear;
  chkCantEmpleados.Checked := False;
  edRL_ULTIMANOMINA.Clear;
  edMiSimplificacion.Clear;
  edMiSimplificacion.Color := clWindow;
  edModalidadPresentacion.Clear;
  edModalidadPresentacion.Color := clWindow;
end;

procedure TfrmCargaNominaManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCargaNominaManual := nil;
  frmPrincipal.mnuCargaMasivaManual.Enabled := True;

  inherited;
end;

procedure TfrmCargaNominaManual.edTJ_CUILKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    CargaCuil;
end;

procedure TfrmCargaNominaManual.CargaCuil;
var
  sSql: String;
begin
  if edTJ_CUIL.Text <> '' then
  begin
    // Generacion de Cuil.
    if IsCuil(edTJ_CUIL.Text) then
    begin
      sSql :=
        'SELECT tj_cuil, tj_nombre, tj_fnacimiento, tj_sexo, tj_lateralidaddominante, tj_estadocivil,' +
              ' tj_idnacionalidad, tj_otranacionalidad, tj_mail' +
         ' FROM ctj_trabajador' +
        ' WHERE tj_cuil = :cuilodoc';
    end
    else if IsDNI(Trim(edTJ_CUIL.Text)) then
    begin
      sSql :=
        'SELECT tj_cuil, tj_nombre, tj_fnacimiento, tj_sexo, tj_lateralidaddominante, tj_estadocivil,' +
              ' tj_idnacionalidad, tj_otranacionalidad, tj_mail' +
         ' FROM ctj_trabajador' +
        ' WHERE tj_documento = :cuilodoc';
    end
    else
    begin
      InvalidMsg(edTJ_CUIL, 'El dato ingresado no es una C.U.I.L. ni un documento válido.');
      Exit;
    end;

    with GetQueryEx(sSql, [Trim(edTJ_CUIL.Text)]) do
    try
      if IsEmpty then
        MessageDlg('Este trabajador no existe, será dado de alta.', mtWarning, [mbOK], 0)
      else
      begin
        edTJ_CUIL.Text                   := FieldByName('tj_cuil').AsString;
        edTJ_NOMBRE.Text                 := FieldByName('tj_nombre').AsString;
        edTJ_FNACIMIENTO.Date            := FieldByName('tj_fnacimiento').AsDateTime;
        cmbTJ_SEXO.ItemIndex             := Pos(FieldByName('tj_sexo').AsString, 'FM') - 1;
        fraTJ_LATERALIDADDOMINANTE.Value := FieldByName('tj_lateralidaddominante').AsString;
        fraTJ_ESTADOCIVIL.Value          := FieldByName('tj_estadocivil').AsString;
        edTJ_MAIL.Text                   := FieldByName('tj_mail').AsString;
        fraTJ_IDNACIONALIDAD.Value       := FieldByName('tj_idnacionalidad').AsInteger;
        OnfraTJ_IDNACIONALIDADChange(nil);

        edTJ_OTRANACIONALIDAD.Text       := FieldByName('tj_otranacionalidad').AsString;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmCargaNominaManual.edTJ_CUILExit(Sender: TObject);
begin
  CargaCuil;
end;

procedure TfrmCargaNominaManual.edDocumentoEnter(Sender: TObject);
begin
  edCuil.Text := '';
  ednombre.Text := '';
  rbDocumento.Checked := true;
end;

procedure TfrmCargaNominaManual.edCUILEnter(Sender: TObject);
begin
  edDocumento.Text := '';
  ednombre.Text := '';
  rbCUIL.Checked := true;
end;

procedure TfrmCargaNominaManual.edNombreEnter(Sender: TObject);
begin
  edDocumento.Text := '';
  edCUIL.Text := '';
  rbNombre.Checked := true;
end;

procedure TfrmCargaNominaManual.edCUILChange(Sender: TObject);
begin
  if rbCUIL.Checked then
    sdqDatos.Locate('tj_cuil', edCUIL.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCargaNominaManual.edDocumentoChange(Sender: TObject);
begin
  if rbDocumento.Checked then
    sdqDatos.Locate('tj_documento', edDocumento.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCargaNominaManual.edNombreChange(Sender: TObject);
begin
  if rbNombre.Checked then
    sdqDatos.Locate('tj_nombre', edNombre.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCargaNominaManual.tbClearClick(Sender: TObject);
begin
  ClearControls;
  fraEmpresa.Clear;
  edSuss.Clear;
  fraEstablecimiento.Clear;
  fraDomicilio.Clear;
  ActualizarBotones;
  StatusBar.SimpleText := 'Cant. Empleados: --';
  lbCantEmpleados.Caption := StatusBar.SimpleText;
  sdqDatos.Close;
end;

procedure TfrmCargaNominaManual.btnAgregarClick(Sender: TObject);
begin
  Grid.SelectedRows.CurrentRowSelected := True;
  CalcularFilas;
end;

procedure TfrmCargaNominaManual.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                  Highlight: Boolean);
begin
  if sdqDatos.FieldByName('esbaja').AsString = 'S' then
    AFont.Color := clRed;

  inherited;
end;

procedure TfrmCargaNominaManual.btnFechaClick(Sender: TObject);
var
  dFechaIngreso: TDateTime;
  sSql: String;
begin
  if cmbFechaBaja.IsEmpty then
    InvalidMsg(cmbFechaBaja, 'Falta la fecha de egreso del trabajador.')
  else
  begin
    sSql :=
      'SELECT rl_fechaingreso' +
       ' FROM crl_relacionlaboral' +
      ' WHERE rl_id = :id';
    dFechaIngreso := ValorSqlDateTimeEx(sSql, [GetIdTrabajadorPorCuil(edTJ_CUIL.Text)]);

    if cmbFechaBaja.Date < dFechaIngreso then
      InvalidMsg(cmbFechaBaja, 'La fecha de egreso del trabajador debe ser mayor o igual a la fecha de ingreso (' + DateToStr(dFechaIngreso) + ')')
    else if MsgBox('¿ Confirma la baja del trabajador ?', MB_ICONQUESTION + MB_OKCANCEL) = IDOK then
      fpFecha.ModalResult := mrOk;
  end;
end;

procedure TfrmCargaNominaManual.tbReactivarClick(Sender: TObject);
var
  iFilas: Integer;
  iLoop: Integer;
  sMensaje: String;
begin
  iFilas := Grid.SelectedRows.Count;
  if (sdqDatos.Eof) or (iFilas < 1) or (sdqDatos.FieldByName('esbaja').AsString = 'N') then
    raise Exception.Create('Debe elegir un trabajador dado de baja.');

  if iFilas = 1 then
    sMensaje := '¿ Realmente desea dar de alta este trabajador ?'
  else
    sMensaje := '¿ Realmente desea dar de alta estos trabajadores ?';

  if MsgBox(sMensaje, MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
  begin
    //Pregunta por la fecha a utilizar
    cmbFechaBaja.Date := Date;
    cmbFechaRecepcion.Clear;
    fraMotivoBaja.Clear;

    lblFecha.Caption := 'F. de Ingreso';
    cmbFechaRecepcion.Hide;
    lblRecepcion.Hide;
    fraMotivoBaja.Hide;
    lbMotivoBaja.Hide;

    if fpFecha.ShowModal = mrOk then
      for iLoop := 0 to iFilas - 1 do
      begin
        sdqDatos.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
        edRL_FECHAINGRESO.Date := cmbFechaBaja.Date;
        cmbRL_FECHARECEPCION.Date := Date;
        DoGuardarTrabajador(nil);
      end;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    CambiaEmpresa(nil);
  end;
end;

procedure TfrmCargaNominaManual.CalcularFilas;
begin
  edSeleccionados.Value := Grid.SelectedRows.Count;
end;

procedure TfrmCargaNominaManual.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmCargaNominaManual.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmCargaNominaManual.btnActualizarClick(Sender: TObject);
var
  sSql: String;
begin
  if fraEmpresa.IsSelected then
  begin
    if rbVerActivos.Checked then
    begin
      sSql :=
        'SELECT tj_id, tj_cuil, tj_mail, tj_nombre, rl_id, rl_categoria, rl_tarea, rl_fechaingreso, rl_fecharecepcion,' +
              ' tj_fnacimiento, rl_ciuo, tj_sexo, rl_sueldo, tj_documento, es_id, es_calle, es_localidad, es_cpostal,' +
              ' es_provincia, pv_descripcion, es_numero, es_piso, es_departamento, es_cpostala, rl_preocupacional,' +
              ' rl_preexistente, ''N'' esbaja, TO_DATE(NULL) hl_fechaalta, TO_DATE(NULL) hl_fechaegreso,' +
              ' TO_DATE(NULL) fecharecepcion, tj_lateralidaddominante, tj_estadocivil, tj_idnacionalidad,' +
              ' tj_otranacionalidad, rl_sector, rl_idmodalidadcontratacion, rl_ultimanomina, rl_estado,' +
              ' NULL hl_bajaempresa, NULL hl_motivobaja, NULL motivo_baja, rl_idorigendato,' +
              ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL) || art.utiles.armar_localidad(es_cpostal, NULL, es_localidad, es_provincia) domicilio,' +
              ' es_nroestableci, es_nombre, rl_confirmapuesto' +
         ' FROM ctj_trabajador, crl_relacionlaboral, cre_relacionestablecimiento, aes_establecimiento, cpv_provincias' +
        ' WHERE tj_id = rl_idtrabajador' +
          ' AND rl_id = re_idrelacionlaboral(+)' +
          ' AND re_idestablecimiento = es_id(+)' +
          ' AND es_provincia = pv_codigo(+)' +
          ' AND rl_contrato = :contrato';
      sdqDatos.Sql.Clear;
      OpenQueryEx(sdqDatos, [fraEmpresa.edContrato.Value], sSql, True);
    end
    else
    begin
      sSql :=
        'SELECT tj_id, tj_cuil, tj_mail, tj_nombre, hl_id, hl_categoria rl_categoria, hl_tarea rl_tarea,' +
              ' hl_fechaingreso rl_fechaingreso, hl_fecharecepcion rl_fecharecepcion, tj_fnacimiento, hl_ciuo rl_ciuo,' +
              ' tj_sexo, hl_sueldo rl_sueldo, tj_documento, es_id, es_calle, es_localidad, es_cpostal, es_provincia,' +
              ' pv_descripcion, es_numero, es_piso, es_departamento, es_cpostala, hl_preocupacional rl_preocupacional,' +
              ' hl_preexistente rl_preexistente, ''S'' esbaja, TRUNC(hl_fechaalta) hl_fechaalta,' +
              ' TRUNC(hl_fechaegreso) hl_fechaegreso, TRUNC(hl_fecharecepcion) fecharecepcion,' +
              ' tj_lateralidaddominante, tj_estadocivil, tj_idnacionalidad, tj_otranacionalidad, hl_sector rl_sector,' +
              ' hl_idmodalidadcontratacion rl_idmodalidadcontratacion, hl_ultimanomina rl_ultimanomina,' +
              ' hl_estado rl_estado, hl_bajaempresa, hl_motivobaja, tb_descripcion AS motivo_baja,' +
              ' hl_idorigendato rl_idorigendato,' +
              ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL) || art.utiles.armar_localidad(es_cpostal, NULL, es_localidad, es_provincia) domicilio,' +
              ' es_nroestableci, es_nombre, NULL rl_confirmapuesto' +
         ' FROM ctj_trabajador, chl_historicolaboral, chr_histrelacionestableci, aes_establecimiento, cpv_provincias,' +
              ' ctb_tablas' +
        ' WHERE tj_id = hl_idtrabajador' +
          ' AND es_provincia = pv_codigo(+)' +
          ' AND hr_idhistoricolaboral = hl_id' +
          ' AND hr_idestablecimiento = es_id' +
          ' AND hl_motivobaja = tb_codigo(+)' +
          ' AND tb_clave(+) = ''MOTIB''' +
          ' AND hl_contrato = :contrato';
      sdqDatos.Sql.Clear;
      OpenQueryEx(sdqDatos, [fraEmpresa.edContrato.Value], sSql, True);
    end;
    if chkCantEmpleados.Checked then
      StatusBar.SimpleText := 'Cant. Empleados: ' + FloatToStr(sdqDatos.RecordCount)
    else
      StatusBar.SimpleText := 'Cant. Empleados: --';
    lbCantEmpleados.Caption := StatusBar.SimpleText;
  end;
  ActualizarBotones;
end;

procedure TfrmCargaNominaManual.chkCantEmpleadosClick(Sender: TObject);
begin
  if chkCantEmpleados.Checked then
    if MessageDlg('Esta función puede hacer más lenta la consulta.' + #13#10 + '¿ Está seguro de querer continuar ?',
                  mtWarning, [mbYes, mbNo], 0) = mrNo then
      chkCantEmpleados.Checked := False;
end;

procedure TfrmCargaNominaManual.SetAlta(const aValue: Boolean);
begin
  if FEsAlta <> aValue then
  begin
    FEsAlta := aValue;
    if FEsAlta then
    begin
      tlbNuevo.ImageIndex := 8;
      tlbNuevo.Hint := 'Cancelar Alta (Ctrl - N)';
      ClearControls;
      Caption := TJ_ALTA;
      VCLExtra.LockControls(fraEstablecimiento, False);
      edTJ_CUIL.SetFocus;
      if Is_DDJJEmptyUltPeriodo(fraEmpresa.edContrato.Value) and (Is_EmpresaPagoSUSS(fraEmpresa.edContrato.Value)) then
        fraOrigenDato.Propiedades.ExtraCondition := ' AND od_codigo IN (''MS'') ';
    end
    else
    begin
      tlbNuevo.ImageIndex := 6;
      tlbNuevo.Hint := 'Nuevo (Ctrl - N)';
      Caption := 'Carga Manual de Nómina';
      fraOrigenDato.Propiedades.ExtraCondition :=  '';
      Grid.SetFocus;
    end;
    ActualizarBotones;
  end;

  VCLExtra.LockControls([fraOrigenDato], not FEsAlta);
end;

procedure TfrmCargaNominaManual.ActualizarBotones;
var
  bActivos: Boolean;
begin
  if sdqDatos.Active then
  begin
    if sdqDatos.Eof then
      bActivos := True
    else
      bActivos := (sdqDatos.FieldByName('esbaja').AsString = 'N');
  end
  else
    bActivos := True;//rbVerBaja.Checked

  if fraEmpresa.IsEmpty then
  begin
    FEsAlta := False;
    EnableControls([tlbNuevo, tlbGuardar, tlbEstablecimiento, tbContacto, tlbBaja], False);
    EnableControls([tbReactivar], False);
    EnableControls([tlbImprimir], False);
  end
  else
  begin
    if Caption = TJ_MODIFICACION then //modificacion
    begin
      FEsAlta := False;
      EnableControls([tlbNuevo, tlbEstablecimiento, tbContacto, tlbBaja], bActivos);
      EnableControls([tlbGuardar], (bActivos) and (Seguridad.ControlHabilitado(frmCargaNominaManual, tlbGuardar)));
      EnableControls([tbReactivar], not bActivos);
      EnableControls([tlbImprimir], True);
    end
    else if FEsAlta then
    begin
      FEsAlta := True;
      EnableControls([tlbNuevo], True);
      EnableControls([tlbGuardar], Seguridad.ControlHabilitado(frmCargaNominaManual, tlbGuardar));
      EnableControls([tlbEstablecimiento, tbContacto, tlbBaja, tlbImprimir], False);
      EnableControls([tbReactivar], False);
    end
    else
    begin
      FEsAlta := False;
      EnableControls([tlbNuevo, tlbEstablecimiento, tbContacto], True);
      EnableControls([tlbGuardar, tlbBaja], False);
      EnableControls([tbReactivar], False);
      EnableControls([tlbImprimir], True);
    end;
  end;
end;

procedure TfrmCargaNominaManual.btnSalir2Click(Sender: TObject);
begin
  fpFecha.ModalResult := mrCancel;
end;

procedure TfrmCargaNominaManual.tbExportarClick(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  if (sdDatos.DataSet.Active) and (not sdDatos.DataSet.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      bAutoCols := (ExportDialog.Fields.Count = 0);
      sdqDatos.DisableControls;
      try
        if bAutoCols then
          ExportDialog.Fields.Assign(Grid.Columns);

        ExportDialog.Execute;
      finally
        sdqDatos.EnableControls;
        if bAutoCols then
          ExportDialog.Fields.Clear;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmCargaNominaManual.tlbImprimirClick(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  tlbImprimir.Enabled := False;
  try
    if sdDatos.DataSet.Active and (not sdDatos.DataSet.IsEmpty) and PrintDialog.Execute then
    begin
      bAutoCols := (QueryPrint.Fields.Count = 0);
      sdqDatos.DisableControls;
      try
        if bAutoCols then
          QueryPrint.SetGridColumns(Grid, True, [baDetail, baHeader, baTotal, baSubTotal]);
        QueryPrint.Title.Text := 'Carga de Trabajadores';
        QueryPrint.Print;
      finally
        sdqDatos.EnableControls;
        if bAutoCols then
          QueryPrint.Fields.Clear;
      end;
    end;
  finally
    tlbImprimir.Enabled := True; {Lo pone en true porque si entró acá quiere decir que estaba activado}
  end;
end;

procedure TfrmCargaNominaManual.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  SortDialog.Execute;
end;

procedure TfrmCargaNominaManual.LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
var
  iLoop: Integer;
begin
  if aSortFields.Count = 0 then
    for iLoop := 0 to aColumns.Count - 1 do
      with aSortFields.Add do
      begin
        Title     := aColumns[iLoop].Title.Caption;
        DataField := aColumns[iLoop].FieldName;

        if Assigned(aColumns[iLoop].Field) then
          FieldIndex := aColumns[iLoop].Field.FieldNo;
      end;
end;

procedure TfrmCargaNominaManual.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  FieldHider.Execute;
end;

procedure TfrmCargaNominaManual.OnfraTJ_IDNACIONALIDADChange(Sender: TObject);
var
  bNacionalidadExistente: Boolean;
begin
  bNacionalidadExistente := (fraTJ_IDNACIONALIDAD.Codigo <> '7');
  VCLExtra.LockControl(edTJ_OTRANACIONALIDAD, bNacionalidadExistente);
  if bNacionalidadExistente then
    edTJ_OTRANACIONALIDAD.Clear;
end;

procedure TfrmCargaNominaManual.fpCambiarEstablecimientoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpCambiarEstablecimiento.Close;
end;

procedure TfrmCargaNominaManual.fpCambiarEstablecimientoShow(Sender: TObject);
begin
  with fraEstablecimiento do
  begin
    Parent := fpCambiarEstablecimiento;

    Left := 88;
    Top := 8;
    Width := 424;

    Clear;

    VCLExtra.LockControl(fraEstablecimiento, False);
  end;
end;

procedure TfrmCargaNominaManual.fpCambiarEstablecimientoClose(Sender: TObject; var Action: TCloseAction);
begin
  with fraEstablecimiento do
  begin
    Parent := grbIdentifica;

    Left := 100;
    Top := 14;
    Width := 588;

    VCLExtra.LockControl(fraEstablecimiento, True);
  end;
end;

procedure TfrmCargaNominaManual.fraEstablecimientoedCodigoChange(Sender: TObject);
begin
  if not fpCambiarEstablecimiento.Visible then
  begin
    lbEstablecimiento.Caption := fraEstablecimiento.cmbDescripcion.Text;
    lbEstablecimiento.Tag := fraEstablecimiento.Value;
  end;
end;

procedure TfrmCargaNominaManual.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraEstablecimiento.IsEmpty, fraEstablecimiento.edCodigo, 'Por favor, seleccione el nuevo establecimiento.');

  fpCambiarEstablecimiento.ModalResult := mrOk;
end;

procedure TfrmCargaNominaManual.tbContactoClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT em_id' +
     ' FROM aem_empresa' +
    ' WHERE em_cuit = :cuit';

  with TfrmContratoContacto.Create(Self) do
  try
    DoCargarDatos(fraEmpresa.Contrato, ValorSqlEx(sSql, [fraEmpresa.mskCUIT.Text]));
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCargaNominaManual.tbVerHistorialClick(Sender: TObject);
begin
  Verificar((fraEmpresa.Contrato < 1), fraEmpresa, 'Debe ingresar el contrato.');

  FreeAndNil(frmHistoricoCargaNomina);
  frmHistoricoCargaNomina := TfrmHistoricoCargaNomina.Create(Self);
  frmHistoricoCargaNomina.Contrato := fraEmpresa.Contrato;
end;

function TfrmCargaNominaManual.GuardarTrabajador(const aIdTrabajador: Integer): Integer;
begin
  with sdspSaveTrabajador do
  begin
    ParamByName('id').Value                      := IIF((aIdTrabajador = -1), NULL, aIdTrabajador);
    ParamByName('cuil').AsString                 := edTJ_CUIL.Text;
    ParamByName('estadocivil').AsString          := fraTJ_ESTADOCIVIL.Value;
    ParamByName('fechamovi').AsDateTime          := DBDateTime;
    ParamByName('fnacimiento').Value             := IIF((edTJ_FNACIMIENTO.Date = 0), NULL, edTJ_FNACIMIENTO.Date);
    ParamByName('idnacionalidad').AsInteger      := fraTJ_IDNACIONALIDAD.Value;
    ParamByName('lateralidaddominante').AsString := fraTJ_LATERALIDADDOMINANTE.Value;
    ParamByName('nombre').AsString               := Trim(edTJ_NOMBRE.Text);
    ParamByName('origen').AsString               := 'A';
    ParamByName('otranacionalidad').AsString     := edTJ_OTRANACIONALIDAD.Text;
    ParamByName('usuario').AsString              := frmPrincipal.DBLogin.UserID;
    ParamByName('sexo').AsString                 := Copy(cmbTJ_SEXO.Text, 1, 1);
    ParamByName('email').AsString                := edTJ_MAIL.Text;

    ExecProc;

    if ParamByName('error').AsInteger = 0 then
      Result := ParamByName('id').AsInteger
    else
      raise Exception.Create(Format('%s [%d]', [ParamByName('desc_error').AsString, ParamByName('error').AsInteger]));
  end;
end;

procedure TfrmCargaNominaManual.LoadFechaMiSimplificacion(const aCuit: String);
var
  sSql: String;
begin
  sSql :=
    //'SELECT afiliacion.get_idultimatafechaMS(:cuit) as fecha from DUAL';
    'SELECT MAX(mi_fechamov) fecha' +                                    //Oracle decide no usar los indices
    '  FROM cmi_miregistro' +
    ' WHERE mi_cuit = :cuit';
  with GetQueryEx(sSql, [aCUIT]) do
  try
    if not FieldByName('fecha').IsNull then
    begin
      edMiSimplificacion.Text := FieldByName('fecha').AsString;
      edMiSimplificacion.Color := clBlue;
      edMiSimplificacion.Font.Color := clWhite;
    end
    else
    begin
      edMiSimplificacion.Text := 'NO';
      edMiSimplificacion.Color := clPurple;
      edMiSimplificacion.Font.Color := clWhite;
    end;
  finally
    Free;
  end;
end;

procedure TfrmCargaNominaManual.fraRL_CIUOExit(Sender: TObject);
begin
  fraRL_CIUO.FrameExit(Sender);
  if not fraRL_CIUO.IsEmpty then
  begin
    edRL_TAREA.Text := fraRL_CIUO.Descripcion;
    fraOrigenDato.Codigo := 'MS';
  end;
end;

end.
