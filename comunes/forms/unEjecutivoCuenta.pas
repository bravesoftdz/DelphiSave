unit unEjecutivoCuenta;

interface

uses
  Forms, ShortCutControl, unFraCodigoDescripcion, unArtFrame, unFraDomicilio, StdCtrls, PatternEdit, Controls, ComCtrls,
  Classes, ToolWin, Mask, unFraDomicilioTrab, artSeguridad, unART, unArtDBAwareFrame,
  Data.DB, SDEngine;

type
  TfrmEjecutivoCuenta = class(TForm)
    tlbControl: TToolBar;
    tlbLimpiar: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ToolButton2: TToolButton;
    ShortCutControl: TShortCutControl;
    StatusBar: TStatusBar;
    grbContacto: TGroupBox;
    grbDomicilioLegal: TGroupBox;
    lbCA: TLabel;
    lbTel: TLabel;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
    edEC_TELEFONOS: TPatternEdit;
    edEC_FAX: TPatternEdit;
    edEC_CODAREATELEFONOS: TPatternEdit;
    edEC_CODAREAFAX: TPatternEdit;
    Label1: TLabel;
    fraEC_ID: TfraCodigoDescripcion;
    fraDomicilio: TfraDomicilioTrab;
    Seguridad: TSeguridad;
    tbHistorico: TToolButton;
    ToolButton1: TToolButton;
    sdqHistorico: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure OnEjecutivoChange(Sender: TObject);
    procedure tlbLimpiarClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
  private
    FContrato: Integer;

    procedure DoCargarDomicilio;
  public
    procedure DoCargarDatos(const aContrato: Integer; fsFuncion: TFuncionShowForm); overload;
    procedure DoCargarDatos(const aContrato: Integer); overload;
  end;

implementation

uses
  Windows, SysUtils, unDmPrincipal, VCLExtra, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, General, unComunes ,
  unConsultasAdicionales, strfuncs, unSesion;

{$R *.DFM}

procedure TfrmEjecutivoCuenta.FormCreate(Sender: TObject);
begin
  inherited;
  
  fraEC_ID.TableName   := 'aec_ejecutivocuenta';
  fraEC_ID.FieldID     := 'ec_id';
  fraEC_ID.FieldCodigo := 'ec_id';
  fraEC_ID.FieldDesc   := 'ec_nombre';
  fraEC_ID.FieldBaja   := 'ec_fechabaja';
  fraEC_ID.ExtraFields := ', ec_calle, ec_localidad, ec_cpostal, ec_provincia, ec_numero, ec_piso, ec_departamento, ec_cpostala, ec_codareatelefonos, ec_telefonos, ec_codareafax, ec_fax ';
  fraEC_ID.OnChange    := OnEjecutivoChange;

  VCLExtra.EnableControls([tlbBaja, tlbGuardar, tlbLimpiar], Seguridad.Claves.IsActive('PermisoEscritura'));
end;

procedure TfrmEjecutivoCuenta.OnEjecutivoChange(Sender: TObject);
begin
  DoCargarDomicilio;
  tlbGuardar.Enabled := Seguridad.Claves.IsActive('PermisoEscritura');
end;

procedure TfrmEjecutivoCuenta.DoCargarDatos(const aContrato: Integer; fsFuncion: TFuncionShowForm);
begin
  case fsFuncion of
    fsConsultar:
    begin
      tlbLimpiar.Enabled := Seguridad.Claves.IsActive('PermisoEscritura');
      tlbGuardar.Enabled := Seguridad.Claves.IsActive('PermisoEscritura');
      tlbBaja.Enabled    := Seguridad.Claves.IsActive('PermisoEscritura');
      LockControls([grbContacto], not Seguridad.Claves.IsActive('PermisoEscritura'));
    end;
  end;
  DoCargarDatos(aContrato);
end;

procedure TfrmEjecutivoCuenta.DoCargarDatos(const aContrato: Integer);
var
  sSql: String;
begin
  FContrato := aContrato;
  if FContrato > 0 then
  begin
    LockControls([fraDomicilio, edEC_CODAREATELEFONOS, edEC_TELEFONOS, edEC_CODAREAFAX, edEC_FAX], True);

    sSql :=
      'SELECT NVL(co_idejecutivo, 0)' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = :contrato';

    fraEC_ID.Value := ValorSqlEx(sSql, [aContrato]);
    DoCargarDomicilio;
  end;
end;

procedure TfrmEjecutivoCuenta.DoCargarDomicilio;
begin
  if fraEC_ID.IsEmpty or (not fraEC_ID.sdqDatos.Active) then
  begin
    fraDomicilio.Clear;
    edEC_CODAREATELEFONOS.Text := '';
    edEC_TELEFONOS.Text        := '';
    edEC_CODAREAFAX.Text       := '';
    edEC_FAX.Text              := '';
  end else
    with fraEC_ID do
    begin
      fraDomicilio.CodigoPostal  := sdqDatos.FieldByName('ec_cpostal').AsString;
      fraDomicilio.Calle         := sdqDatos.FieldByName('ec_calle').AsString;
      fraDomicilio.Localidad     := sdqDatos.FieldByName('ec_localidad').AsString;
      if sdqDatos.FieldByName('ec_provincia').AsString <> '' then
        fraDomicilio.Provincia   := ValorSql('SELECT pv_descripcion' +
                                              ' FROM cpv_provincias' +
                                             ' WHERE pv_codigo = ' + sdqDatos.FieldByName('ec_provincia').AsString);
      fraDomicilio.Numero        := sdqDatos.FieldByName('ec_numero').AsString;
      fraDomicilio.Piso          := sdqDatos.FieldByName('ec_piso').AsString;
      fraDomicilio.Departamento  := sdqDatos.FieldByName('ec_departamento').AsString;
      fraDomicilio.CPA           := sdqDatos.FieldByName('ec_cpostala').AsString;
      edEC_CODAREATELEFONOS.Text := sdqDatos.FieldByName('ec_codareatelefonos').AsString;
      edEC_TELEFONOS.Text        := sdqDatos.FieldByName('ec_telefonos').AsString;
      edEC_CODAREAFAX.Text       := sdqDatos.FieldByName('ec_codareafax').AsString;
      edEC_FAX.Text              := sdqDatos.FieldByName('ec_fax').AsString;
    end;
end;

procedure TfrmEjecutivoCuenta.tlbLimpiarClick(Sender: TObject);
begin
  fraEC_ID.Clear;
  DoCargarDomicilio;
end;

procedure TfrmEjecutivoCuenta.tlbGuardarClick(Sender: TObject);
var
  tslMotivo: TStrings;
begin
  tslMotivo := TStringList.Create;
  try
    InputMemoBox('Ingrese el motivo del cambio (obligatorio)', tslMotivo, False, 1000);
    Verificar(IsEmptyString(Trim(tslMotivo.Text)), tlbGuardar, 'Debe indicar el motivo del cambio para que se haga efectivo el mismo.');

    with TSql.Create('afi.ahe_historicoejecutivo') do
    try
      SqlType := stInsert;
      Fields.Add('he_contrato', FContrato);
      Fields.Add('he_idejecutivo', Integer(IIF(fraEC_ID.IsEmpty, '1', fraEC_ID.ID)), True);
      Fields.Add('he_usualta', Sesion.UserID);
      Fields.Add('he_fechaalta', exDateTime);
      Fields.Add('he_motivo', tslMotivo.Text);

      BeginTrans;
      try
        EjecutarSqlST(Sql);
        Clear;

        TableName := 'aco_contrato';
        SqlType := stUpdate;
        PrimaryKey.Add('co_contrato', FContrato);
        Fields.Add('co_idejecutivo', Integer(IIF(fraEC_ID.IsEmpty, '1', fraEC_ID.ID)), True);

        EjecutarSqlST(Sql);
        Do_ActualizarHistoricoContrato(FContrato, False);

        CommitTrans;
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      except
        on E: Exception do
        begin
          RollBack;
          ErrorMsg(E, 'Error al guardar los datos.');
        end;
      end;
    finally
      Free;
    end;
  finally
    tslMotivo.Free;
  end;
end;

procedure TfrmEjecutivoCuenta.tbHistoricoClick(Sender: TObject);
begin
  with TfrmConsultasAdicionales.Create(Self) do
  try
    Caption := 'Historial de Ejecutivos de Cuenta';
    SetLength(NombreCampos, 5);
    NombreCampos[0] := 'Contrato';
    NombreCampos[1] := 'Ejecutivo';
    NombreCampos[2] := 'Usuario';
    NombreCampos[3] := 'Fecha';
    NombreCampos[4] := 'Motivo';

    Sql := sdqHistorico.SQL.Text;
    MostrarConsulta([FContrato]);
  finally
    Free;
  end;
end;

procedure TfrmEjecutivoCuenta.tlbBajaClick(Sender: TObject);
begin
  tlbLimpiarClick(Sender);
  tlbGuardarClick(Sender);
end;

procedure TfrmEjecutivoCuenta.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
