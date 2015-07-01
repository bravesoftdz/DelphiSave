unit unGestorCuenta;

interface

uses
  Forms, ShortCutControl, unFraCodigoDescripcion, unArtFrame, unFraDomicilio, StdCtrls, PatternEdit, Controls, ComCtrls,
  Classes, ToolWin, Mask, unFraDomicilioTrab, artSeguridad, unART, unArtDBAwareFrame;

type
  TfrmGestorCuenta = class(TForm)
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
    fraGC_IDGESTOR: TfraCodigoDescripcion;
    edGC_CODARETELEFONOS: TPatternEdit;
    edGC_TELEFONOS: TPatternEdit;
    edGC_CODAREAFAX: TPatternEdit;
    edGC_FAX: TPatternEdit;
    Label1: TLabel;
    lbCA: TLabel;
    lbTel: TLabel;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
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
  CaptionBase: String = 'Gestor de Cuenta';

procedure TfrmGestorCuenta.FormCreate(Sender: TObject);
begin
  inherited;
  
  fraGC_IDGESTOR.TableName   := 'agc_gestorcuenta';
  fraGC_IDGESTOR.FieldID     := 'gc_id';
  fraGC_IDGESTOR.FieldCodigo := 'gc_id';
  fraGC_IDGESTOR.FieldDesc   := 'gc_nombre';
  fraGC_IDGESTOR.FieldBaja   := 'gc_fechabaja';
  fraGC_IDGESTOR.ExtraFields := ', gc_calle, gc_localidad, gc_cpostal, gc_provincia, gc_numero, gc_piso, gc_departamento, gc_cpostala, gc_codareatelefonos, gc_telefonos, gc_codareafax, gc_fax ';
  fraGC_IDGESTOR.OnChange := OnGestorChange;

  VCLExtra.EnableControls([tlbBaja, tlbGuardar, tlbLimpiar], Seguridad.Claves.IsActive('PermisoEscritura'));
end;

procedure TfrmGestorCuenta.OnGestorChange(Sender: TObject);
begin
  DoCargarDomicilio;
end;

procedure TfrmGestorCuenta.DoCargarDatos(aContrato: Integer; fsFuncion: TFuncionShowForm; EsEstudio: Boolean = False);
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

procedure TfrmGestorCuenta.DoCargarDatos(aContrato: Integer; EsEstudio: Boolean = False);
var
  sSql: String;
begin
  FContrato := aContrato;
  FEsEstudio      := EsEstudio;
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
        'SELECT NVL(co_idgestor, 0)' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato';
    end;
    fraGC_IDGESTOR.Value := ValorSqlEx(sSql, [aContrato]);
    DoCargarDomicilio;
  end;
end;

procedure TfrmGestorCuenta.DoCargarDomicilio;
begin
  with fraGC_IDGESTOR do
  begin
    if not sdqDatos.Active then
      Exit;

    fraDomicilio.CodigoPostal := sdqDatos.FieldByName('gc_cpostal').AsString;
    fraDomicilio.Calle        := sdqDatos.FieldByName('gc_calle').AsString;
    fraDomicilio.Localidad    := sdqDatos.FieldByName('gc_localidad').AsString;
    if sdqDatos.FieldByName('gc_provincia').AsString <> '' then
      fraDomicilio.Provincia  := ValorSql('SELECT pv_descripcion' +
                                           ' FROM cpv_provincias' +
                                          ' WHERE pv_codigo = ' + sdqDatos.FieldByName('gc_provincia').AsString);
    fraDomicilio.Numero       := sdqDatos.FieldByName('gc_numero').AsString;
    fraDomicilio.Piso         := sdqDatos.FieldByName('gc_piso').AsString;
    fraDomicilio.Departamento := sdqDatos.FieldByName('gc_departamento').AsString;
    fraDomicilio.CPA          := sdqDatos.FieldByName('gc_cpostala').AsString;
    edGC_CODARETELEFONOS.Text := sdqDatos.FieldByName('gc_codareatelefonos').AsString;
    edGC_TELEFONOS.Text       := sdqDatos.FieldByName('gc_telefonos').AsString;
    edGC_CODAREAFAX.Text      := sdqDatos.FieldByName('gc_codareafax').AsString;
    edGC_FAX.Text             := sdqDatos.FieldByName('gc_fax').AsString;
  end;
end;

procedure TfrmGestorCuenta.tlbLimpiarClick(Sender: TObject);
begin
  fraGC_IDGESTOR.Clear;
  DoCargarDomicilio;
end;

procedure TfrmGestorCuenta.tlbGuardarClick(Sender: TObject);
begin
  with TSql.Create('aco_contrato') do
  try
    SqlType := stUpdate;
    PrimaryKey.Add('co_contrato', FContrato);
    Fields.Add('co_idgestor', Integer(IIF(fraGC_IDGESTOR.IsEmpty, '1', fraGC_IDGESTOR.ID)), True);

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

procedure TfrmGestorCuenta.tlbBajaClick(Sender: TObject);
begin
  tlbLimpiarClick(Sender);
  tlbGuardarClick(Sender);
end;

procedure TfrmGestorCuenta.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
