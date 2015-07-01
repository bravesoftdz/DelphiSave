unit unEstablecimientosTrabajador;

{
    AUTOR : NELSON billy KUSTER
    FECHA DE CREACION : 09-09-2003
}

interface

uses
  {$IFDEF VER180}rxCurrEdit, rxToolEdit, rxPlacemnt, {$ELSE}CurrEdit, ToolEdit, Placemnt, {$ENDIF} Windows, SysUtils, Graphics, Forms, QueryPrint, Dialogs,
  ShortCutControl, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, PeriodoPicker, Mask, unArtFrame, Controls, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  Classes, ToolWin, unArt, DateComboBox, unFraEstablecimiento, unFraCodigoDescripcion, unArtDbFrame, unFraDomicilioTrab, unArtDBAwareFrame, artSeguridad;

type
  TfrmEstablecimientosTrabajador = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    ShortCutControl: TShortCutControl;
    Panel1: TPanel;
    lbFIngreso: TLabel;
    cmbRE_FECHAINGRESO: TDateComboBox;
    lbEstablec: TLabel;
    fraES_NROESTABLECIMIENTO: TfraEstablecimiento;
    GroupBox1: TGroupBox;
    lbCPostal: TLabel;
    edDomicilio: TEdit;
    fpBajaTrabajadorEstablecimiento: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarBajaTrabEst: TButton;
    btnCancelarBajaTrabEst: TButton;
    lbFEgreso: TLabel;
    cmbHR_FECHAEGRESO: TDateComboBox;
    fraDomicilioEstablecimiento: TfraDomicilioTrab;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    procedure FormDestroy(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraES_NROESTABLECIMIENTOOnChange(Sender: TObject);
    procedure btnAceptarBajaTrabEstClick(Sender: TObject);
    procedure fpBajaTrabajadorEstablecimientoEnter(Sender: TObject);
    procedure ArtDBGridCellClick(Column: TColumn);
  private
    FFechaIngreso: TDateTime;
    FFuncion: TFuncionShowForm;
    FIdRelacionLaboral: TTableId;
    FRelacionLaboralEliminada: Boolean;

    function DoGuardar: Boolean;
    function EliminarTrabajadorEstablecimiento(aIdRelacionLaboral, aIdRelacionEstablecimiento: TTableId; aFechaEgreso: TDateTime; aUltimoEstablecimiento: Boolean): Boolean;
    function Validar(Funcion: TFuncionShowForm): Boolean;
    function ValidarBajaTrabajadorEstablecimiento: Boolean;

    procedure BloquearControles(Bloquear: Boolean);
    procedure DomicilioEstablecimiento(var fraDomicilio: TfraDomicilioTrab; aIdEstablecimiento: TTableId);
    procedure Seleccion;
    procedure SetFuncion(F: TFuncionShowForm);

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  public
    procedure DoCargarDatos(const aIdRelacionLaboral: TTableId; const aFechaIngreso: TDateTime);

    property RelacionLaboralEliminada: Boolean read FRelacionLaboralEliminada write FRelacionLaboralEliminada;
  end;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSQL, SqlFuncs, CustomDlgs, General, VCLExtra, unSesion, DateTimeFuncs;

{$R *.DFM}

const
  CaptionBase: String = 'Establecimientos del Trabajador';

  CONSULTA_GRILLA: String =
    'SELECT   es_id, es_nroestableci, es_nombre, re_id, re_fechaingreso,' +
            ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL) || art.utiles.armar_localidad(es_cpostal, NULL, es_localidad, es_provincia) domicilio' +
       ' FROM cre_relacionestablecimiento, aes_establecimiento' +
      ' WHERE re_idestablecimiento = es_id' +
        ' AND re_idrelacionlaboral = :idrelacionlaboral' +
   ' ORDER BY es_nroestableci';

procedure TfrmEstablecimientosTrabajador.DoCargarDatos(const aIdRelacionLaboral: TTableId; const aFechaIngreso: TDateTime);
var
  sSql: String;
begin
  FFuncion := fsAgregar;

  FIdRelacionLaboral := aIdRelacionLaboral;
  FFechaIngreso      := aFechaIngreso;

  sSql :=
    'SELECT rl_contrato' +
     ' FROM crl_relacionlaboral' +
    ' WHERE rl_id = :id';
  fraES_NROESTABLECIMIENTO.Contrato := ValorSqlIntegerEx(sSql, [FIdRelacionLaboral]);

  sdqConsulta.SQL.Text := CONSULTA_GRILLA;
  sdqConsulta.ParamByName('idrelacionlaboral').AsInteger := aIdRelacionLaboral;
  OpenQuery(sdqConsulta);
end;

procedure TfrmEstablecimientosTrabajador.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;

  case F of
    fsNone:
    begin
      Caption            := CaptionBase;
      tlbBaja.Enabled    := False;
      tlbGuardar.Enabled := False;
    end;
    fsAgregar:
    begin
      Caption            := CaptionBase + ' [ALTA]';
      tlbBaja.Enabled    := False;
      tlbGuardar.Enabled := True;
    end;
    fsModificar:
    begin
      Caption            := CaptionBase;
      tlbBaja.Enabled    := True;
      tlbGuardar.Enabled := True;
    end;
  end;
end;

procedure TfrmEstablecimientosTrabajador.FormDestroy(Sender: TObject);
begin
  sdqConsulta.Close;
end;

procedure TfrmEstablecimientosTrabajador.Seleccion;
begin
  Funcion := fsModificar;
  BloquearControles(True);

  if fraES_NROESTABLECIMIENTO.Value <> sdqConsulta.FieldByName('es_id').AsInteger then
  begin
    fraES_NROESTABLECIMIENTO.Value := sdqConsulta.FieldByName('es_id').AsInteger;
    fraES_NROESTABLECIMIENTOOnChange(nil);

    cmbRE_FECHAINGRESO.Date := sdqConsulta.FieldByName('re_fechaingreso').AsDateTime;
  end;
end;

procedure TfrmEstablecimientosTrabajador.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  Seleccion;
end;

procedure TfrmEstablecimientosTrabajador.ArtDBGridCellClick(Column: TColumn);
begin
  Seleccion;
end;

function TfrmEstablecimientosTrabajador.Validar(Funcion: TFuncionShowForm): Boolean;
var
  sSql: String;
begin
  Result := False;

  if Funcion = fsAgregar then
    sSql :=
      'SELECT 1' +
       ' FROM cre_relacionestablecimiento' +
      ' WHERE re_idestablecimiento = :idestablecimiento' +
        ' AND re_idrelacionlaboral = :idrelacionlaboral';

  if fraES_NROESTABLECIMIENTO.IsEmpty then
     InvalidMsg(fraES_NROESTABLECIMIENTO.edCodigo, 'El establecimiento es obligatorio.')

  else if (Funcion = fsAgregar) and ExisteSqlEx(sSql, [fraES_NROESTABLECIMIENTO.Value, FIdRelacionLaboral]) then
    InvalidMsg(fraES_NROESTABLECIMIENTO.edCodigo, 'El trabajador ya existe en dicho establecimiento.')

  else if (not cmbRE_FECHAINGRESO.IsEmpty) and (FFechaIngreso <> 0) and (cmbRE_FECHAINGRESO.Date < FFechaIngreso) then
    InvalidMsg(cmbRE_FECHAINGRESO, 'La fecha de ingreso del trabajador del establecimiento no puede ser menor que su fecha de ingreso a la empresa que es ' + DateToStr(FFechaIngreso) + '.')

  else if (not cmbRE_FECHAINGRESO.IsEmpty) and (cmbRE_FECHAINGRESO.Date > DBDate) then
    InvalidMsg(cmbRE_FECHAINGRESO, 'La fecha de ingreso del trabajador al establecimiento no puede ser mayor que la fecha actual.' )

  else
    Result := True;
end;

function TfrmEstablecimientosTrabajador.DoGuardar: Boolean;
begin
  Result := False;

  with TSql.Create('cre_relacionestablecimiento') do
  try
    case Funcion of
      fsAgregar:
      begin
        SqlType := stInsert;

        PrimaryKey.Add('re_id',           'SEQ_CRE_ID.NEXTVAL', False);
        Fields.Add('re_idrelacionlaboral', FIdRelacionLaboral);
        Fields.Add('re_idestablecimiento', fraES_NROESTABLECIMIENTO.Value);
        Fields.Add('re_fechaingreso',      cmbRE_FECHAINGRESO.Date);
        Fields.Add('re_usualta',           Sesion.UserId);
        Fields.Add('re_fechaalta',         exDateTime);
      end;

      fsModificar:
      begin
        SqlType := stUpdate;

        PrimaryKey.Add('re_id',       sdqConsulta.FieldByName('re_id').AsInteger);
        Fields.Add('re_fechaingreso', cmbRE_FECHAINGRESO.Date);
        Fields.Add('re_usumodif',     Sesion.UserId);
        Fields.Add('re_fechamodif',   exDateTime);
      end;
    end;

    try
      EjecutarSql(Sql);

      MsgBox('Los datos se grabaron correctamente.', MB_ICONINFORMATION, CaptionBase);

      Result := True;
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

procedure TfrmEstablecimientosTrabajador.tlbGuardarClick(Sender: TObject);
begin
  if Validar(FFuncion) then
    if DoGuardar then
    begin
      sdqConsulta.Refresh;
      Seleccion;

      if Funcion = fsAgregar then
        tlbNuevoClick(nil);
    end;
end;

procedure TfrmEstablecimientosTrabajador.tlbNuevoClick(Sender: TObject);
begin
  Funcion := fsAgregar;

  BloquearControles(False);

  fraES_NROESTABLECIMIENTO.Clear;
  fraES_NROESTABLECIMIENTOOnChange(nil);

  cmbRE_FECHAINGRESO.Date := FFechaIngreso;

  fraES_NROESTABLECIMIENTO.edCodigo.SetFocus;
end;

procedure TfrmEstablecimientosTrabajador.tlbBajaClick(Sender: TObject);
begin
  if Funcion = fsModificar then
  begin
    if sdqConsulta.IsEmpty then
      MsgBox('No existen establecimientos en la grilla.', MB_ICONEXCLAMATION, 'Atención')
    else
      if fpBajaTrabajadorEstablecimiento.ShowModal = mrOk then
      begin
        if FRelacionLaboralEliminada then
          tlbSalirClick(nil)
        else
        begin
          sdqConsulta.Refresh;
          Seleccion;
        end;
      end;
  end;
end;

procedure TfrmEstablecimientosTrabajador.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEstablecimientosTrabajador.FormCreate(Sender: TObject);
begin
  inherited;

  BloquearControles(True);

  fraES_NROESTABLECIMIENTO.OnChange := fraES_NROESTABLECIMIENTOOnChange;

  FRelacionLaboralEliminada := False;
end;

procedure TfrmEstablecimientosTrabajador.DomicilioEstablecimiento(var fraDomicilio: TfraDomicilioTrab; aIdEstablecimiento: TTableId);
var
  sSql: String;
begin
  sSql :=
    'SELECT es_calle, es_localidad, es_cpostal, es_provincia, pv_descripcion, es_numero, es_piso, es_departamento, es_cpostala, es_domicilio' +
     ' FROM aes_establecimiento, cpv_provincias' +
    ' WHERE es_provincia = pv_codigo(+)' +
      ' AND es_id = :id';
  with GetQueryEx(sSql, [aIdEstablecimiento]) do
  try
    if IsEmpty then
    begin
      fraDomicilio.Clear;
      edDomicilio.Clear;
    end
    else
    begin
      fraDomicilio.CodigoPostal := FieldByName('es_cpostal').AsString;
      fraDomicilio.Calle        := FieldByName('es_calle').AsString;
      fraDomicilio.Localidad    := FieldByName('es_localidad').AsString;
      fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
      fraDomicilio.Numero       := IIF(FieldByName('es_numero').AsString <> '', FieldByName('es_numero').AsString, 'S/N');
      fraDomicilio.Piso         := FieldByName('es_piso').AsString;
      fraDomicilio.Departamento := FieldByName('es_departamento').AsString;
      fraDomicilio.CPA          := FieldByName('es_cpostala').AsString;
      edDomicilio.Text          := FieldByName('es_domicilio').AsString;
    end;
  finally
    Free;
  end;
end;

procedure TfrmEstablecimientosTrabajador.fraES_NROESTABLECIMIENTOOnChange(Sender: TObject);
begin
  DomicilioEstablecimiento(fraDomicilioEstablecimiento, fraES_NROESTABLECIMIENTO.Value);
end;

function TfrmEstablecimientosTrabajador.EliminarTrabajadorEstablecimiento(aIdRelacionLaboral, aIdRelacionEstablecimiento: TTableId; aFechaEgreso: TDateTime; aUltimoEstablecimiento: Boolean): Boolean;
var
  sSql: String;
begin
  Result := False;

  try
    BeginTrans;

    if aUltimoEstablecimiento then
    begin
      sSql := 'nomina.borrar_trabajadorcontrato(:relacionlaboral, :fechaegreso, :usuario);';
      EjecutarStoreSTEx(sSql, [aIdRelacionLaboral, TDateTimeEx.Create(aFechaEgreso), Sesion.UserId]);
      FRelacionLaboralEliminada := True;
    end
    else
    begin
      sSql := 'nomina.borrar_trabajadorestableci(:relacionestablecimiento, :fechaegreso, :usuario);';
      EjecutarStoreSTEx(sSql, [aIdRelacionEstablecimiento, TDateTimeEx.Create(aFechaEgreso), Sesion.UserId]);
    end;

    CommitTrans;

    Result := True;
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Error al realizar la baja del trabajador del establecimiento.');
    end;
  end;
end;

function TfrmEstablecimientosTrabajador.ValidarBajaTrabajadorEstablecimiento: Boolean;
begin
  Result := False;

  if cmbHR_FECHAEGRESO.IsEmpty then
    InvalidMsg(cmbHR_FECHAEGRESO, 'Debe ingresar la fecha de egreso del trabajador del establecimiento.')

  else if (FFechaIngreso <> 0) and (cmbHR_FECHAEGRESO.Date < FFechaIngreso) then
    InvalidMsg(cmbHR_FECHAEGRESO, 'La fecha de egreso del trabajador del establecimiento no puede ser menor que su fecha de ingreso a la empresa: ' + DateToStr(FFechaIngreso))

  else if (not sdqConsulta.FieldByName('re_fechaingreso').IsNull) and (cmbHR_FECHAEGRESO.Date < sdqConsulta.FieldByName('re_fechaingreso').AsDateTime) then
    InvalidMsg(cmbHR_FECHAEGRESO, 'La fecha de egreso del trabajador del establecimiento no puede ser menor que su fecha de ingreso al mismo: ' + sdqConsulta.FieldByName('re_fechaingreso').AsString)

  else if cmbHR_FECHAEGRESO.Date > DBDate then
    InvalidMsg(cmbHR_FECHAEGRESO, 'La fecha de egreso del trabajador del establecimiento no puede ser mayor que la fecha actual.')

  else
    Result := True;
end;

procedure TfrmEstablecimientosTrabajador.btnAceptarBajaTrabEstClick(Sender: TObject);
var
  bUltimoEstablecimiento: Boolean;
  sSql: String;
begin
  if ValidarBajaTrabajadorEstablecimiento then
  begin
    sSql :=
      'SELECT COUNT(*)' +
       ' FROM cre_relacionestablecimiento' +
      ' WHERE re_idrelacionlaboral = :idrelacionlaboral';

    bUltimoEstablecimiento := (ValorSqlEx(sSql, [FIdRelacionLaboral]) = 1);

    if MsgBox('¿ Realmente desea dar de baja este registro ?' + IIF(bUltimoEstablecimiento, #13 + 'Se va a dar de baja también la relación laboral con la empresa.', ''), MB_ICONQUESTION + MB_OKCANCEL) = IDOK then
      if EliminarTrabajadorEstablecimiento(FIdRelacionLaboral, sdqConsulta.FieldByName('re_id').AsInteger, cmbHR_FECHAEGRESO.Date, bUltimoEstablecimiento) then
        fpBajaTrabajadorEstablecimiento.ModalResult := mrOk;
  end;
end;

procedure TfrmEstablecimientosTrabajador.BloquearControles(Bloquear: Boolean);
begin
  LockControls(fraES_NROESTABLECIMIENTO, Bloquear);
end;

procedure TfrmEstablecimientosTrabajador.fpBajaTrabajadorEstablecimientoEnter(Sender: TObject);
begin
  cmbHR_FECHAEGRESO.Clear;
end;

end.
