unit unGestorAumento;

interface

uses
  Forms, ShortCutControl, unFraCodigoDescripcion, unArtFrame, unFraDomicilio, StdCtrls, PatternEdit, Controls, ComCtrls,
  Classes, ToolWin, Mask, unFraDomicilioTrab, artSeguridad, unART, unArtDBAwareFrame;

type
  TfrmGestorAumento = class(TForm)
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
    fraGA_IDGESTOR: TfraCodigoDescripcion;
    edGA_CODARETELEFONOS: TPatternEdit;
    edGA_TELEFONOS: TPatternEdit;
    edGA_CODAREAFAX: TPatternEdit;
    edGA_FAX: TPatternEdit;
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
  CaptionBase: String = 'Gestor de Aumento';

procedure TfrmGestorAumento.FormCreate(Sender: TObject);
begin
  inherited;
  fraGA_IDGESTOR.TableName   := 'aga_gestoraumento';
  fraGA_IDGESTOR.FieldID     := 'ga_id';
  fraGA_IDGESTOR.FieldCodigo := 'ga_id';
  fraGA_IDGESTOR.FieldDesc   := 'ga_nombre';
  fraGA_IDGESTOR.FieldBaja   := 'ga_fechabaja';
  fraGA_IDGESTOR.ExtraFields := ', ga_calle, ga_localidad, ga_cpostal, ga_provincia, ga_numero, ga_piso, ga_departamento, ga_cpostala, ga_codareatelefonos, ga_telefonos, ga_codareafax, ga_fax ';
  fraGA_IDGESTOR.OnChange    := OnGestorChange;

  VCLExtra.EnableControls([tlbBaja, tlbGuardar, tlbLimpiar], Seguridad.Claves.IsActive('PermisoEscritura'));
end;

procedure TfrmGestorAumento.OnGestorChange(Sender: TObject);
begin
  DoCargarDomicilio;
end;

procedure TfrmGestorAumento.DoCargarDatos(aContrato: Integer; fsFuncion: TFuncionShowForm; EsEstudio: Boolean = False);
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

procedure TfrmGestorAumento.DoCargarDatos(aContrato: Integer; EsEstudio: Boolean = False);
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
        'SELECT NVL(co_idgestoraumento, 0)' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato';
    end;
    fraGA_IDGESTOR.Value := ValorSqlEx(sSql, [aContrato]);
    DoCargarDomicilio;
  end;
end;

procedure TfrmGestorAumento.DoCargarDomicilio;
begin
  with fraGA_IDGESTOR do
  begin
    if not sdqDatos.Active then
      Exit;

    fraDomicilio.CodigoPostal := sdqDatos.FieldByName('ga_cpostal').AsString;
    fraDomicilio.Calle        := sdqDatos.FieldByName('ga_calle').AsString;
    fraDomicilio.Localidad    := sdqDatos.FieldByName('ga_localidad').AsString;
    if sdqDatos.FieldByName('ga_provincia').AsString <> '' then
      fraDomicilio.Provincia  := ValorSql('SELECT pv_descripcion' +
                                           ' FROM cpv_provincias' +
                                          ' WHERE pv_codigo = ' + sdqDatos.FieldByName('ga_provincia').AsString);
    fraDomicilio.Numero       := sdqDatos.FieldByName('ga_numero').AsString;
    fraDomicilio.Piso         := sdqDatos.FieldByName('ga_piso').AsString;
    fraDomicilio.Departamento := sdqDatos.FieldByName('ga_departamento').AsString;
    fraDomicilio.CPA          := sdqDatos.FieldByName('ga_cpostala').AsString;
    edGA_CODARETELEFONOS.Text := sdqDatos.FieldByName('ga_codareatelefonos').AsString;
    edGA_TELEFONOS.Text       := sdqDatos.FieldByName('ga_telefonos').AsString;
    edGA_CODAREAFAX.Text      := sdqDatos.FieldByName('ga_codareafax').AsString;
    edGA_FAX.Text             := sdqDatos.FieldByName('ga_fax').AsString;
  end;
end;

procedure TfrmGestorAumento.tlbLimpiarClick(Sender: TObject);
begin
  fraGA_IDGESTOR.Value := 0;
  DoCargarDomicilio;
end;

procedure TfrmGestorAumento.tlbGuardarClick(Sender: TObject);
begin
  with TSql.Create('aco_contrato') do
  try
    SqlType := stUpdate;
    PrimaryKey.Add('co_contrato', FContrato, false);
    Fields.Add('co_idgestoraumento', fraGA_IDGESTOR.Value, True);

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

procedure TfrmGestorAumento.tlbBajaClick(Sender: TObject);
begin
  tlbLimpiarClick(Sender);
  tlbGuardarClick(Sender);
end;

procedure TfrmGestorAumento.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
