unit unEstudioContable;

interface

uses
  Forms, ShortCutControl, unFraCodigoDescripcion, unArtFrame, unFraDomicilio, StdCtrls, PatternEdit, Controls, ComCtrls,
  Classes, ToolWin, Mask, unFraDomicilioTrab, artSeguridad, unART, unArtDBAwareFrame;

type
  TfrmEstudioContable = class(TForm)
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
    Label1: TLabel;
    lbCA: TLabel;
    lbTel: TLabel;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
    fraEC_IDESTUDIOCONTABLE: TfraCodigoDescripcion;
    edEC_CODARETELEFONOS: TPatternEdit;
    edEC_TELEFONOS: TPatternEdit;
    edEC_CODAREAFAX: TPatternEdit;
    edEC_FAX: TPatternEdit;
    fraDomicilio: TfraDomicilioTrab;
    Seguridad: TSeguridad;
    procedure FormCreate(Sender: TObject);
    procedure OnGestorChange(Sender : TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbLimpiarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
  private
    FContrato: Integer;
    FEsEstudio: Boolean;

    procedure DoCargarDomicilio;
  public
    procedure DoCargarDatos(aContrato: Integer; fsFuncion: TFuncionShowForm; EsEstudio: Boolean = False); overload;
    procedure DoCargarDatos(aContrato: Integer; EsEstudio: Boolean = False); overload;
  end;


implementation

uses
  Windows, SysUtils, unDmPrincipal, VCLExtra, unPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unComunes, General;

{$R *.DFM}

const
  CaptionBase: String = 'Estudio Contable';

procedure TfrmEstudioContable.FormCreate(Sender: TObject);
begin
  inherited;
  fraEC_IDESTUDIOCONTABLE.TableName   := 'aec_estudiocontable';
  fraEC_IDESTUDIOCONTABLE.FieldID     := 'ec_id';
  fraEC_IDESTUDIOCONTABLE.FieldCodigo := 'ec_id';
  fraEC_IDESTUDIOCONTABLE.FieldDesc   := 'ec_nombre';
  fraEC_IDESTUDIOCONTABLE.FieldBaja   := 'ec_fechabaja';
  fraEC_IDESTUDIOCONTABLE.ExtraFields := ', ec_calle, ec_localidad, ec_cpostal, ec_provincia, ec_numero, ec_piso, ec_departamento, ec_cpostala, ec_codareatelefonos, ec_telefonos, ec_codareafax, ec_fax ';
  fraEC_IDESTUDIOCONTABLE.OnChange    := OnGestorChange;

  VCLExtra.EnableControls([tlbBaja, tlbGuardar, tlbLimpiar], Seguridad.Claves.IsActive('PermisoEscritura'));
end;

procedure TfrmEstudioContable.OnGestorChange(Sender: TObject);
begin
  DoCargarDomicilio;
end;

procedure TfrmEstudioContable.DoCargarDatos(aContrato: Integer; fsFuncion: TFuncionShowForm; EsEstudio: Boolean = False);
begin
  case fsFuncion of
    fsConsultar:
    begin
      tlbLimpiar.Enabled := False;
      tlbGuardar.Enabled := False;
      tlbBaja.Enabled    := False;
      LockControls([grbContacto], True);
    end;
  end;
  DoCargarDatos(aContrato, EsEstudio);
end;

procedure TfrmEstudioContable.DoCargarDatos(aContrato: Integer; EsEstudio: Boolean = False);
var
  sSql: String;
begin
  FContrato  := aContrato;
  FEsEstudio := EsEstudio;
  
  if FContrato > 0 then
  begin
    LockControls([grbDomicilioLegal, fraDomicilio], true);
    if FEsEstudio then
    begin
      sSql :=
        'SELECT NVL(co_idestudio, 0)' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato';
      VCLExtra.EnableControls([tlbBaja, tlbGuardar, tlbLimpiar], False);
      Caption := 'Estudio';
    end
    else
    begin
      sSql :=
        'SELECT NVL(co_idestudiocontable, 0)' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato';
    end;
    fraEC_IDESTUDIOCONTABLE.Value := ValorSqlEx(sSql, [aContrato]);
    DoCargarDomicilio;
  end;
end;

procedure TfrmEstudioContable.DoCargarDomicilio;
begin
  with fraEC_IDESTUDIOCONTABLE do
  begin
    if not sdqDatos.Active then
      Exit;

    fraDomicilio.CodigoPostal := sdqDatos.FieldByName('ec_cpostal').AsString;
    fraDomicilio.Calle        := sdqDatos.FieldByName('ec_calle').AsString;
    fraDomicilio.Localidad    := sdqDatos.FieldByName('ec_localidad').AsString;
    if sdqDatos.FieldByName('ec_provincia').AsString <> '' then
      fraDomicilio.Provincia  := ValorSql('SELECT pv_descripcion' +
                                           ' FROM cpv_provincias' +
                                          ' WHERE pv_codigo = ' + sdqDatos.FieldByName('ec_provincia').AsString);
    fraDomicilio.Numero       := sdqDatos.FieldByName('ec_numero').AsString;
    fraDomicilio.Piso         := sdqDatos.FieldByName('ec_piso').AsString;
    fraDomicilio.Departamento := sdqDatos.FieldByName('ec_departamento').AsString;
    fraDomicilio.CPA          := sdqDatos.FieldByName('ec_cpostala').AsString;
    edEC_CODARETELEFONOS.Text := sdqDatos.FieldByName('ec_codareatelefonos').AsString;
    edEC_TELEFONOS.Text       := sdqDatos.FieldByName('ec_telefonos').AsString;
    edEC_CODAREAFAX.Text      := sdqDatos.FieldByName('ec_codareafax').AsString;
    edEC_FAX.Text             := sdqDatos.FieldByName('ec_fax').AsString;
  end;
end;

procedure TfrmEstudioContable.tlbLimpiarClick(Sender: TObject);
begin
  fraEC_IDESTUDIOCONTABLE.Value := 0;
  DoCargarDomicilio;
end;

procedure TfrmEstudioContable.tlbGuardarClick(Sender: TObject);
begin
  with TSql.Create('aco_contrato') do
  try
    SqlType := stUpdate;
    PrimaryKey.Add('co_contrato', FContrato, false);
    Fields.Add('co_idestudiocontable', fraEC_IDESTUDIOCONTABLE.Value, True);

    BeginTrans;
    try
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
end;

procedure TfrmEstudioContable.tlbBajaClick(Sender: TObject);
begin
  tlbLimpiarClick(Sender);
  tlbGuardarClick(Sender);
end;

procedure TfrmEstudioContable.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
