unit unCargaEstablecimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  unFraActividad, Mask, ToolEdit, DateComboBox, HotKeyControl, unFraDomicilio, ShortCutControl, QueryPrint,
  unFraDomicilioTrab, unFraTelefono, artSeguridad, unArtDBAwareFrame, unFraCodDesc,
  RxCurrEdit, RxToolEdit;

type
  TfrmCargaEstablecimiento = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbNomina: TToolButton;
    tlbSolicitud: TToolButton;
    tlbSRT: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    ToolButton1: TToolButton;
    grbDomicilio: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    edSE_CODAREAFAX: TPatternEdit;
    edSE_FAX: TPatternEdit;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    edSE_NOMBRE: TEdit;
    lbNombre: TLabel;
    lbAlta: TLabel;
    edSE_FEINICACTIV: TDateComboBox;
    Label1: TLabel;
    edSE_FECHAINICEST: TDateComboBox;
    lbActividad: TLabel;
    lbCantEmpleados: TLabel;
    edSE_EMPLEADOS: TCurrencyEdit;
    lbMasaSalarial: TLabel;
    edSE_MASA: TCurrencyEdit;
    lbNivel: TLabel;
    edSE_NIVEL: TPatternEdit;
    Label2: TLabel;
    edSE_OBSERVACIONES: TMemo;
    grbSolicitud: TGroupBox;
    edSA_FORMULARIO: TEdit;
    ShortCutControl: TShortCutControl;
    fraSE_ACTIVIDAD: TfraActividad;
    QueryPrint1: TQueryPrint;
    PrintDialog1: TPrintDialog;
    edSE_DOMICILIO: TEdit;
    Label3: TLabel;
    tbReactivar: TToolButton;
    ToolButton3: TToolButton;
    fraTelefono: TfraTelefono;
    fraDomicilio: TfraDomicilio;
    Seguridad: TSeguridad;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edDescripcionActividad: TEdit;
    edSuperficie: TCurrencyEdit;
    Label7: TLabel;
    fraOrigen: TfraCodDesc;
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tlbBajaClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                     Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbNominaClick(Sender: TObject);
    procedure tlbSolicitudClick(Sender: TObject);
    procedure tlbSRTClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure edSE_MASAExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tbReactivarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ArtDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FCancelarNuevo: Boolean;
    FIdSolicitud: Integer;
    FOrigenAnterior: String;

    function GetNombreOriginal(aNombre: String): String;
    function isValidar: Boolean;

    procedure CancelarAlta;
    procedure DoGuardarEstablecimiento;
  public
    procedure DoCargaIDSolicitud(aId: Integer);
  end;

var
  frmCargaEstablecimiento: TfrmCargaEstablecimiento;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, CUIT, General, AnsiSQL, SqlFuncs, unCargaTrabajador, unCargaSRT,
  unCargaSolicitud, unRptEstablecimiento, VCLExtra, Strfuncs, unSesion;

const
  SE_ALTA        : String = 'Carga de Establecimientos [ALTA]';
  SE_MODIFICACION: String = 'Carga de Establecimientos [MODIFICACION]';
  SE_BAJA        : String = 'Carga de Establecimientos [BAJA]';

{$R *.DFM}

function TfrmCargaEstablecimiento.GetNombreOriginal(aNombre: String): String;
var
  iPos: Integer;
begin
  iPos := Pos(' (LEGAL)', aNombre);
  if iPos > 0 then
    Delete(aNombre, iPos, 8);
  Result := aNombre;
end;

function TfrmCargaEstablecimiento.isValidar: Boolean;
var
  sSql: String;
begin
  Verificar(edSE_NOMBRE.Text = '', edSE_NOMBRE, 'El nombre del establecimiento es obligatorio.');
  if edSE_NOMBRE.Tag = 1 then  //sino el limite es 100
    Verificar(Length(edSE_NOMBRE.Text) > 92, edSE_NOMBRE, 'El nombre no puede superar los 92 carácteres.' + 'Actual: ' +  IntToStr(Length(edSE_NOMBRE.Text)));
  Verificar(fraSE_ACTIVIDAD.IsEmpty, fraSE_ACTIVIDAD.edCodigo, 'El código de actividad es obligatorio.');
  Verificar(edSE_EMPLEADOS.Value < 0, edSE_EMPLEADOS, 'El total de empleados debe ser mayor o igual a cero.');
  Verificar(edSE_MASA.Value < 0, edSE_MASA, 'La masa salarial debe ser mayor o igual a cero.');

  if (Sesion.Sector = 'AFI') or (Sesion.Sector = 'AFINOM') or (Sesion.Sector = 'ATCLI') then
    Verificar(fraOrigen.IsEmpty, fraOrigen, 'El origen es obligatorio');

  if FOrigenAnterior <> fraOrigen.Codigo then
    Verificar((Sesion.Sector = 'AFI') and ((fraOrigen.Codigo = '06') or (fraOrigen.Codigo = '07') or (fraOrigen.Codigo = '08')), fraOrigen.edCodigo, 'Usted no tiene permiso para guardar ese Origen.');

  if not fraDomicilio.isValid then
    Abort;

  sSql :=
    'SELECT 1' +
     ' FROM ase_solicitudestablecimiento' +
    ' WHERE se_idsolicitud = :idsolicitud' +
      ' AND UPPER(se_calle) = UPPER(:calle)' +
      ' AND UPPER(se_numero) = UPPER(:numero)' +
      ' AND UPPER(NVL(se_piso, '' '')) = UPPER(:piso)' +
      ' AND UPPER(NVL(se_departamento, '' '')) = UPPER(:departamento)';



  Verificar(fraDomicilio.Provincia = '', fraDomicilio, 'La provincia es obligatoria');

  if Caption = SE_MODIFICACION then
    sSql := sSql + ' AND se_id <> ' + SqlValue(sdqDatos.fieldByName('se_id').AsInteger);

  Verificar(ExisteSqlEx(sSql, [FIdSolicitud, fraDomicilio.Calle, fraDomicilio.Numero,
                               String(IIF((fraDomicilio.Piso <> ''), fraDomicilio.Piso, ' ')),
                               String(IIF((fraDomicilio.Departamento <> ''), fraDomicilio.Departamento, ' '))]),
                               fraDomicilio, 'Ya existe un establecimiento con ese domicilio.');

  if fraDomicilio.Numero = '' then
    fraDomicilio.Numero := 'S/N';

  Result := True;
end;


procedure TfrmCargaEstablecimiento.CancelarAlta;
begin
  tlbNuevo.ImageIndex := 6;
  tlbNuevo.Hint := 'Cancelar alta (Ctrl - N)';

  EnableControls([tlbBaja, tlbNomina, tlbSolicitud, tlbSRT, tlbImprimir], True);

  ArtDBGrid.SetFocus;
end;

procedure TfrmCargaEstablecimiento.DoCargaIDSolicitud(aId: Integer);
begin
  FIdSolicitud := aId;
  sdqDatos.ParamByName('iidparam').AsInteger := FIdSolicitud;
  sdqDatos.Open;
  if sdqDatos.Eof then
    Caption := SE_ALTA
  else
    Caption := SE_MODIFICACION;
end;

procedure TfrmCargaEstablecimiento.DoGuardarEstablecimiento;
var
  iSE_ID: Integer;
  sSql: String;
begin
  iSE_ID := -1;

  with TSql.Create('ase_solicitudestablecimiento') do
  try
    Fields.Add('se_idactividad',          fraSE_ACTIVIDAD.Value);
    Fields.Add('se_codareafax',           edSE_CODAREAFAX.Text);
    Fields.Add('se_empleados',            edSE_EMPLEADOS.Value);
    Fields.Add('se_fax',                  edSE_FAX.Text);
    Fields.Add('se_fechainicest',         edSE_FECHAINICEST.Date);
    Fields.Add('se_feinicactiv',          edSE_FEINICACTIV.Date);
    Fields.Add('se_idsolicitud',          FIdSolicitud);
    Fields.AddExtended('se_masa',         edSE_MASA.Value, ALL_DECIMALS, False);
    Fields.AddExtended('se_superficie',   edSuperficie.Value, 2, True);
    Fields.Add('se_descripcionactividad', edDescripcionActividad.Text);
    Fields.Add('se_origendato',           fraOrigen.Codigo);
    Fields.Add('se_nivel',                edSE_NIVEL.Text);
    Fields.Add('se_nombre',               String(IIF((edSE_NOMBRE.Tag = 1), edSE_NOMBRE.Text + ' (LEGAL)', edSE_NOMBRE.Text)));
    Fields.Add('se_observaciones',        edSE_OBSERVACIONES.Text);
    Fields.Add('se_cpostal',              fraDomicilio.CodigoPostal);
    Fields.Add('se_calle',                fraDomicilio.Calle);
    Fields.Add('se_localidad',            fraDomicilio.Localidad);
    Fields.Add('se_provincia',            ValorSqlIntegerEx('SELECT NVL(pv_codigo, 0)' +
                                                             ' FROM cpv_provincias' +
                                                            ' WHERE pv_descripcion = :descripcion',
                                                                      [fraDomicilio.Provincia], 0), False);
    Fields.Add('se_cpostala',     fraDomicilio.CPA);
    Fields.Add('se_departamento', fraDomicilio.Departamento);
    Fields.Add('se_numero',       fraDomicilio.Numero);
    Fields.Add('se_piso',         fraDomicilio.Piso);

    if Caption = SE_ALTA then
    begin
      SqlType := stInsert;
      iSE_ID := ValorSql('SELECT afi.seq_ase_id.NEXTVAL FROM DUAL');
      PrimaryKey.Add('se_id', iSE_ID, False);

      sSql :=
        'SELECT NVL(MAX(se_nroestableci), 0) + 1' +
         ' FROM ase_solicitudestablecimiento' +
        ' WHERE se_idsolicitud = :idsolicitud';
      Fields.Add('SE_NROESTABLECI', ValorSqlIntegerEx(sSql, [FIdSolicitud]));

      Fields.Add('se_fechaalta', 'SYSDATE', False);
      Fields.Add('se_usualta',   frmPrincipal.DBLogin.UserId);
    end
    else if Caption = SE_MODIFICACION then
    begin
      iSE_ID := sdqDatos.FieldByName('se_id').AsInteger;
      SqlType := stUpdate;
      PrimaryKey.Add('se_id', iSE_ID, False);

      Fields.Add('se_fechamodif', 'SYSDATE', False);
      Fields.Add('se_usumodif',   frmPrincipal.DBLogin.UserId);
    end;

    try
      BeginTrans;
      EjecutarSqlST(Sql);

      // Pasa las modificaciones sobre los teléfonos de la tabla temporal a la original..
      fraTelefono.CopiarTempATelefonos(iSE_ID);
      CommitTrans;

      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      sdqDatos.Close;
      sdqDatos.Open;
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.' + E.Message);
      end;
    end;
  finally
    Free;
  end;
end;


procedure TfrmCargaEstablecimiento.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaEstablecimiento.tlbNuevoClick(Sender: TObject);
begin
  FOrigenAnterior := '';

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
    EnableControls([tlbBaja, tlbNomina, tlbSolicitud, tlbSRT, tlbImprimir], False);
    FCancelarNuevo := True;

    edSE_EMPLEADOS.Clear;
    edSE_MASA.Clear;
    edSuperficie.Clear;
    edDescripcionActividad.Clear;
    fraOrigen.Clear;
    edSE_OBSERVACIONES.Clear;
    fraDomicilio.Clear;
    fraTelefono.Clear(True);
    edSE_CODAREAFAX.Clear;
    edSE_FAX.Clear;
    Caption := SE_ALTA;
    edSE_DOMICILIO.Clear;

    edSE_EMPLEADOS.SetFocus;
  end;
end;

procedure TfrmCargaEstablecimiento.tlbGuardarClick(Sender: TObject);
begin
  Verificar((Caption <> SE_ALTA) and not sdqDatos.Eof and (sdqDatos.FieldByName('se_usubaja').AsString <> ''),
            tlbControl, 'Este registro se encuentra dado de baja.');

  //Esta dando de alta un nuevo registro
  if isValidar then
    DoGuardarEstablecimiento;
end;

procedure TfrmCargaEstablecimiento.tlbBajaClick(Sender: TObject);
begin
  if not sdqDatos.Eof and (sdqDatos.FieldByName('se_usubaja').asString <> '') then
  begin
    MsgBox('Este registro se encuentra dado de baja.');
    Abort;
  end;

  if not sdqDatos.Eof then
    if MsgBox('¿ Realmente desea dar de baja este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      with TSql.Create('ase_solicitudestablecimiento') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('se_id',     sdqDatos.fieldByName('se_id').AsInteger, False);
        Fields.Add('se_fechabaja', 'SYSDATE', False);
        Fields.Add('se_usubaja',    frmPrincipal.DBLogin.UserId);

        EjecutarSql(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        sdqDatos.Open;
      finally
        Free;
      end;
end;

procedure TfrmCargaEstablecimiento.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  with sdqDatos do
  begin
    edSA_FORMULARIO.Text        := FieldByName('fo_formulario').AsString;
    edSE_NOMBRE.Tag             := IIF((FieldByName('se_legal').AsString = 'T'), 1, 0);
    edSE_NOMBRE.Text            := GetNombreOriginal(FieldByName('se_nombre').AsString);
    fraSE_ACTIVIDAD.Value       := FieldByName('se_idactividad').AsInteger;
    edSE_NIVEL.Text             := FieldByName('se_nivel').AsString;
    edSE_FEINICACTIV.Date       := FieldByName('se_feinicactiv').AsDateTime;
    edSE_FECHAINICEST.Date      := FieldByName('se_fechainicest').AsDateTime;
    edSE_EMPLEADOS.Value        := FieldByName('se_empleados').AsInteger;
    edSE_MASA.Value             := FieldByName('se_masa').AsFloat;
    edSuperficie.Value          := FieldByName('se_superficie').AsFloat;
    edDescripcionActividad.Text := FieldByName('se_descripcionactividad').AsString;
    fraOrigen.Codigo            := FieldByName('se_origendato').AsString;
    FOrigenAnterior             := fraOrigen.Codigo;
    edSE_OBSERVACIONES.Text     := FieldByName('se_observaciones').AsString;

    // DIRECCION A LA ANTIGUA...
    fraDomicilio.Clear; //sin esto se quedan pegados los datos de otro registro
    fraDomicilio.CodigoPostal := FieldByName('se_cpostal').AsString;
    fraDomicilio.Calle        := FieldByName('se_calle').AsString;
    fraDomicilio.Localidad    := FieldByName('se_localidad').AsString;
    fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
    fraDomicilio.Numero       := FieldByName('se_numero').AsString;
    fraDomicilio.Departamento := FieldByName('se_departamento').AsString;
    fraDomicilio.CPA          := FieldByName('se_cpostala').AsString;
    fraDomicilio.Piso         := FieldByName('se_piso').AsString;

    fraTelefono.FillCombo(True, FieldByName('se_id').AsInteger);
    edSE_CODAREAFAX.Text := FieldByName('se_codareafax').AsString;
    edSE_FAX.Text        := FieldByName('se_fax').AsString;
    edSE_DOMICILIO.Text  := FieldByName('se_domicilio').AsString;
  end;

  Caption := SE_MODIFICACION;

  if FCancelarNuevo then
  begin
    CancelarAlta;
    FCancelarNuevo := False;
  end;
end;

procedure TfrmCargaEstablecimiento.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                          var Background: TColor; Highlight: Boolean);
begin
  if sdqDatos.FieldByName('se_usubaja').AsString <> '' then
    AFont.Color:= clRed;
end;

procedure TfrmCargaEstablecimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action                  := caFree;
  frmCargaEstablecimiento := nil;

  fraTelefono.QuitarTelefonosTemporales;
end;

procedure TfrmCargaEstablecimiento.tlbNominaClick(Sender: TObject);
begin
  frmCargaTrabajador.Free;
  frmCargaTrabajador := TfrmCargaTrabajador.Create(frmPrincipal);
  frmCargaTrabajador.DoCargaIDSolicitud(FIdSolicitud);
end;

procedure TfrmCargaEstablecimiento.tlbSolicitudClick(Sender: TObject);
begin
  frmCargaSolicitudes.Free;
  frmCargaSolicitudes := TfrmCargaSolicitudes.Create(frmPrincipal);
  frmCargaSolicitudes.Mostrar(False);
  frmCargaSolicitudes.DoCargaDatosSolicitud(FIdSolicitud);
end;

procedure TfrmCargaEstablecimiento.tlbSRTClick(Sender: TObject);
begin
  frmCargaSRT.Free;
  frmCargaSRT := TfrmCargaSRT.Create(frmPrincipal);
  frmCargaSRT.DoCargaIDSolicitud(FIdSolicitud);
end;

procedure TfrmCargaEstablecimiento.tlbImprimirClick(Sender: TObject);
begin
  rptEstablecimiento := TrptEstablecimiento.Create(Self);
  try
    rptEstablecimiento.sdqReporte.ParamByName('isa_id').AsInteger := FIdSolicitud;
    rptEstablecimiento.sdqReporte.Open;
    rptEstablecimiento.Print;
  finally
    rptEstablecimiento.Free;
  end;
end;

procedure TfrmCargaEstablecimiento.edSE_MASAExit(Sender: TObject);
begin
  if edSE_MASA.Value > 9999999999.99 then
    InvalidMsg(edSE_MASA, 'El importe no puede superar los 9999999999.99.');
end;

procedure TfrmCargaEstablecimiento.FormCreate(Sender: TObject);
begin
  inherited;

  FCancelarNuevo := False;

  VCLExtra.LockControls(edSE_DOMICILIO, True);
end;

procedure TfrmCargaEstablecimiento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql :=
    'SELECT sa_totempleados empresa, art.afiliacion.get_empleados_establecimiento(sa_id) establecimiento' +
     ' FROM asa_solicitudafiliacion' +
    ' WHERE sa_id = ' + SqlValue(FIdSolicitud);
  SqlResults := ValoresColSQL(sSql);
  try
    try
      CanClose := (StrToInt(SqlResults[0]) = StrToInt(SqlResults[1])) or
                   MsgAsk('La cantidad de empleados es diferente de lo indicado en la solicitud.' +
                           #13#10 + '¿ Desea continuar ?');
    except
      //
    end;
  finally
    SqlResults.Free;
  end;
end;

procedure TfrmCargaEstablecimiento.tbReactivarClick(Sender: TObject);
begin
  if not sdqDatos.Eof and (sdqDatos.FieldByName('se_usubaja').AsString = '') then
  begin
    MsgBox('Este establecimiento se encuentra activo.');
    Abort;
  end;

  if not sdqDatos.Eof then
    if MsgBox('¿ Realmente desea reactivar este establecimiento ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      with TSql.Create('ase_solicitudestablecimiento') do
      try
        PrimaryKey.Add('se_id',     sdqDatos.FieldByName('se_id').AsInteger);
        Fields.Add('se_fechabaja', 'NULL', False);
        Fields.Add('se_usubaja',   'NULL', False);
        SqlType := stUpdate;

        EjecutarSQL(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        sdqDatos.Open;
      finally
        Free;
      end;
end;

procedure TfrmCargaEstablecimiento.FormShow(Sender: TObject);
begin
  fraTelefono.Initialize('SF_IDESTABLECIMIENTO', 'SF', 'ASF_SOLICITUDTELEFONOESTABLECI');

  edSE_EMPLEADOS.SetFocus;
end;

procedure TfrmCargaEstablecimiento.ArtDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                           Column: TColumn; State: TGridDrawState);
begin
  if LowerCase(Column.FieldName) = 'se_superficie' then
    with ArtDBGrid do
      if not DataSource.DataSet.FieldByName('se_superficie').IsNull then
      begin
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, DataSource.DataSet.FieldByName('se_superficie').AsString + ' mt2');
      end;
end;

end.
