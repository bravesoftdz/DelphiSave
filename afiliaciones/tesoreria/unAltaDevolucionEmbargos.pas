unit unAltaDevolucionEmbargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, StdCtrls,
  PatternEdit, IntEdit, ToolEdit, DateComboBox, Mask, CurrEdit, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, ExtCtrls, unArt, artSeguridad, Login,
  artDbLogin;

type
  TfrmAltaDevolucionEmbargos = class(TForm)
    Bevel3: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbJurisdiccion: TLabel;
    btnAceptarEmbargo: TButton;
    btnCancelarEmbargo: TButton;
    fraCuentaBancariaEmbargo: TfraStaticCodigoDescripcion;
    fraBancoEmbargo: TfraStaticCodigoDescripcion;
    edImporteEmbargo: TCurrencyEdit;
    edFechaEmbargo: TDateComboBox;
    edFContableEmbargo: TDateComboBox;
    edOficioEmbargo: TIntEdit;
    edObservacEmbargo: TMemo;
    edCaratulaEmbargo: TEdit;
    fraJuzgadoEmbargo: TfraCodigoDescripcion;
    fraFueroEmbargo: TfraCodigoDescripcion;
    fraSecretariaEmbargo: TfraCodigoDescripcion;
    fraJurisdiccionEmbargo: TfraCodigoDescripcion;
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    procedure btnCancelarEmbargoClick(Sender: TObject);
    procedure btnAceptarEmbargoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FImporte: Currency;
    FFecha: TDateTime;
    FIdCuentaBancaria: TTableId;
    FIdExtracto: TTableId;
    FIdBanco: TTableId;
    FEsConcilBancaria: Boolean;
    procedure OnfraBancoChange(Sender: TObject);
    procedure OnfraCuentaBancariaChange(Sender: TObject);
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
    procedure SetFecha(const Value: TDateTime);
    procedure SetIdBanco(const Value: TTableId);
    procedure SetIdCuentaBancaria(const Value: TTableId);
    procedure SetImporte(const Value: Currency);
    procedure SetEsConcilBancaria(const Value: Boolean);
    function IsPermisoVerCuentas: Boolean;
  public
    property IdExtracto: TTableId        read FIdExtracto          write FIdExtracto;
    property IdBanco: TTableId           read FIdBanco             write SetIdBanco;
    property IdCuentaBancaria: TTableId  read FIdCuentaBancaria    write SetIdCuentaBancaria;
    property Importe: Currency           read FImporte             write SetImporte;
    property Fecha: TDateTime            read FFecha               write SetFecha;
    property EsConcilBancaria: Boolean   read FEsConcilBancaria    write SetEsConcilBancaria;
  end;

var
  frmAltaDevolucionEmbargos: TfrmAltaDevolucionEmbargos;

implementation

uses
  unDmPrincipal, AnsiSql, CustomDlgs, unSesion, StrFuncs, VCLExtra, General, SqlFuncs,
  unComunes, DateTimeFuncs;

{$R *.dfm}

procedure TfrmAltaDevolucionEmbargos.btnCancelarEmbargoClick(Sender: TObject);
begin
  ModalResult := mrCancel;         
  Close;
end;

procedure TfrmAltaDevolucionEmbargos.btnAceptarEmbargoClick(Sender: TObject);
begin
  if not EsConcilBancaria then
  begin
    Verificar(fraBancoEmbargo.IsEmpty, fraBancoEmbargo.edCodigo, 'Debe ingresar el banco.');
    Verificar(fraCuentaBancariaEmbargo.IsEmpty, fraCuentaBancariaEmbargo.edCodigo, 'Debe ingresar la cuenta.');
    Verificar(edImporteEmbargo.Value = 0, edImporteEmbargo, 'Debe ingresar el monto.');
    Verificar(edImporteEmbargo.Value < 0, edImporteEmbargo, 'El monto debe ser mayor a 0.');
    Verificar(edFechaEmbargo.IsEmpty, edFechaEmbargo, 'Debe ingresar la fecha.');
  end;

  Verificar(fraJurisdiccionEmbargo.IsEmpty, fraJurisdiccionEmbargo.edCodigo, 'Debe ingresar la jurisdicción.');
  Verificar(fraFueroEmbargo.IsEmpty, fraFueroEmbargo.edCodigo, 'Debe ingresar el fuero.');
  Verificar(fraJuzgadoEmbargo.IsEmpty, fraJuzgadoEmbargo.edCodigo, 'Debe ingresar el juzgado.');
  Verificar(fraSecretariaEmbargo.IsEmpty, fraSecretariaEmbargo.edCodigo, 'Debe ingresar la secretaría.');
  Verificar(Trim(edCaratulaEmbargo.Text) = '', edCaratulaEmbargo, 'Debe ingresar la carátula.');

	try
  	with TSql.Create('LVE_DEVOLUCIONEMBARGO') do
    try
      PrimaryKey.Add('VE_ID', 					'SEQ_LVE_ID.NEXTVAL', False);
      Fields.Add('VE_IDEXTRACTO',       IdExtracto, True);
      Fields.Add('VE_IDCUENTABANCARIA', fraCuentaBancariaEmbargo.Value);
      Fields.Add('VE_IMPORTE',          edImporteEmbargo.Value);
      Fields.Add('VE_FECHA',            edFechaEmbargo.Date);
      Fields.Add('VE_FECHACONTABLE',    edFContableEmbargo.Date);
      Fields.Add('VE_IDJURISDICCION',   fraJurisdiccionEmbargo.Value);
      Fields.Add('VE_IDFUERO',          fraFueroEmbargo.Value);
      Fields.Add('VE_IDJUZGADO',        fraJuzgadoEmbargo.Value);
      Fields.Add('VE_IDSECRETARIA',     fraSecretariaEmbargo.Value);
      Fields.Add('VE_CARATULA',         Trim(edCaratulaEmbargo.Text));
      Fields.Add('VE_OFICIO',           edOficioEmbargo.Value);
      Fields.Add('VE_OBSERVACIONES',    edObservacEmbargo.Lines.Text);
      Fields.Add('VE_USUALTA',          Sesion.UserId);
      Fields.Add('VE_FECHAALTA',        exDateTime);

      SqlType := stInsert;

      BeginTrans;
      EjecutarSqlST(Sql);

      if IdExtracto <> ART_EMPTY_ID then
        EjecutarStoreSTEx('cont.do_conciliasincontrapartida(:id_extracto, 17, :usuario_login, :fecha_contable);', [IdExtracto, Sesion.UserId, TDateTimeEx.Create(edFContableEmbargo.Date)]);
      CommitTrans;

      EnviarMailEmbargoLegales('Alta de Devolución de Embargos', edCaratulaEmbargo.Text, edObservacEmbargo.Lines.Text, edImporteEmbargo.Value);

      MsgBox('Datos del embargo grabados correctamente.', MB_ICONINFORMATION);

      ModalResult := mrOk;
    finally
      Free;
    end;
  except
  	on E: Exception do
    	ErrorMsg(E, 'Error al grabar los datos del embargo.');
  end;
end;

procedure TfrmAltaDevolucionEmbargos.FormCreate(Sender: TObject);
begin
  with fraBancoEmbargo do
  begin
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    OnChange    := OnfraBancoChange;
  end;

  with fraCuentaBancariaEmbargo do
  begin
    TableName   := 'ZCB_CUENTABANCARIA';
    FieldID     := 'CB_ID';
    FieldCodigo := 'CB_ID';
    FieldDesc   := 'CB_NUMERO';
    FieldBaja   := 'CB_FECHABAJA';
    DynamicCols := True;
    ExtraFields := ', CB_IDBANCO "ID Banco"';
    VisibleExtraFields[0] := False;
    OnChange    := OnfraCuentaBancariaChange;
  end;

  with fraFueroEmbargo do
  begin
    TableName   := 'LEGALES.LFU_FUERO';
    FieldID     := 'FU_ID';
    FieldCodigo := 'FU_ID';
    FieldDesc   := 'FU_DESCRIPCION';
    FieldBaja   := 'FU_FECHABAJA';

    ExtraCondition := 'AND 1=2';
    OnChange := ChangeFuero;
  end;

  with fraJurisdiccionEmbargo do
  begin
    TableName   := 'LEGALES.LJU_JURISDICCION';
    FieldID     := 'JU_ID';
    FieldCodigo := 'JU_ID';
    FieldDesc   := 'JU_DESCRIPCION';
    FieldBaja   := 'JU_FECHABAJA';

    OnChange := ChangeJurisdiccion;
  end;

  with fraJuzgadoEmbargo do
  begin
    TableName   := 'LEGALES.LJZ_JUZGADO';
    FieldID     := 'JZ_ID';
    FieldCodigo := 'JZ_ID';
    FieldDesc   := 'JZ_DESCRIPCION';
    ExtraCondition := 'AND 1=2';
    FieldBaja   := 'JZ_FECHABAJA';

    OnChange := ChangeJuzgado;
  end;

  with fraSecretariaEmbargo do
  begin
    TableName   := 'LEGALES.LSC_SECRETARIA';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_ID';
    FieldDesc   := 'SC_DESCRIPCION';
    ExtraCondition := 'AND 1=2';
    FieldBaja   := 'SC_FECHABAJA';
  end;

  IdExtracto := ART_EMPTY_ID;

  edFContableEmbargo.Date := DBDate;
end;

procedure TfrmAltaDevolucionEmbargos.ChangeJurisdiccion(Sender: TObject);
begin
  if fraJurisdiccionEmbargo.IsSelected then
    with fraFueroEmbargo do
    begin
      fraFueroEmbargo.Codigo := '';
      TableName   	 := 'LEGALES.LFU_FUERO';
      FieldID     	 := 'FU_ID';
      FieldCodigo 	 := 'FU_ID';
      FieldDesc   	 := 'FU_DESCRIPCION';
      ExtraCondition := ' AND FU_ID IN (SELECT JZ_IDFUERO FROM LEGALES.LJZ_JUZGADO WHERE JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccionEmbargo.Codigo))+ ')';
      OnChange 			 := ChangeFuero;
    end;

  if fraJurisdiccionEmbargo.IsSelected and fraFueroEmbargo.IsSelected then
    with fraJuzgadoEmbargo do
    begin
      fraJuzgadoEmbargo.Codigo := '';
      TableName   	 := 'LEGALES.LJZ_JUZGADO';
      FieldID     	 := 'JZ_ID';
      FieldCodigo 	 := 'JZ_ID';
      FieldDesc   	 := 'JZ_DESCRIPCION';
      ExtraCondition := 'AND JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccionEmbargo.Codigo)) + ' AND JZ_IDFUERO = ' +  SqlValue(strtoint(fraFueroEmbargo.Codigo));
    end;
end;

procedure TfrmAltaDevolucionEmbargos.ChangeFuero(Sender: TObject);
begin
  if fraJurisdiccionEmbargo.IsSelected and fraFueroEmbargo.IsSelected then
  	with fraJuzgadoEmbargo do
    begin
      TableName   	 := 'LEGALES.LJZ_JUZGADO';
      FieldID     	 := 'JZ_ID';
      FieldCodigo 	 := 'JZ_ID';
      FieldDesc   	 := 'JZ_DESCRIPCION';
      ExtraCondition := 'AND JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccionEmbargo.Codigo)) + ' AND JZ_IDFUERO = ' +  SqlValue(strtoint(fraFueroEmbargo.Codigo));
    end;
end;

procedure TfrmAltaDevolucionEmbargos.ChangeJuzgado(Sender: TObject);
begin
  if fraJuzgadoEmbargo.IsSelected then
    with fraSecretariaEmbargo do
    begin
      TableName   	 := 'LEGALES.LSC_SECRETARIA';
      FieldID     	 := 'SC_ID';
      FieldCodigo 	 := 'SC_ID';
      FieldDesc   	 := 'SC_DESCRIPCION';
      ExtraCondition := 'AND SC_IDJUZGADO = ' + SqlValue(strtoint(fraJuzgadoEmbargo.Codigo));
    end;
end;

procedure TfrmAltaDevolucionEmbargos.SetFecha(const Value: TDateTime);
begin
  FFecha := Value;

  edFechaEmbargo.Date := Value;
end;

procedure TfrmAltaDevolucionEmbargos.SetIdBanco(const Value: TTableId);
begin
  FIdBanco := Value;

  fraBancoEmbargo.Value := Value;
end;

procedure TfrmAltaDevolucionEmbargos.SetIdCuentaBancaria(const Value: TTableId);
begin
  FIdCuentaBancaria := Value;

  fraCuentaBancariaEmbargo.Value := Value;
  fraCuentaBancariaEmbargo.FrameExit(nil);
end;

procedure TfrmAltaDevolucionEmbargos.SetImporte(const Value: Currency);
begin
  FImporte := Value;

  edImporteEmbargo.Value := Value;
end;

procedure TfrmAltaDevolucionEmbargos.SetEsConcilBancaria(const Value: Boolean);
begin
  FEsConcilBancaria := Value;

  VclExtra.LockControls([fraBancoEmbargo, fraCuentaBancariaEmbargo, edImporteEmbargo, edFechaEmbargo], EsConcilBancaria);
  VclExtra.LockControls([edFContableEmbargo], not EsConcilBancaria);

  if not EsConcilBancaria and not IsPermisoVerCuentas() then
  begin
    fraBancoEmbargo.ExtraCondition          := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO' + Iif(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '') + ')';
    fraCuentaBancariaEmbargo.ExtraCondition := IIF(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '');
  end;

  if EsConcilBancaria then
    ActiveControl := fraJurisdiccionEmbargo.edCodigo
  else
    ActiveControl := fraBancoEmbargo.edCodigo;
end;

procedure TfrmAltaDevolucionEmbargos.OnfraBancoChange(Sender: TObject);
begin
  if fraBancoEmbargo.IsSelected then
    fraCuentaBancariaEmbargo.ExtraCondition := Iif(not EsConcilBancaria and not IsPermisoVerCuentas(), ' AND CB_CONCILIACION = ''N''', '') + ' AND CB_IDBANCO = ' + SqlValue(fraBancoEmbargo.Value)
end;

procedure TfrmAltaDevolucionEmbargos.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBancoEmbargo.IsSelected and fraCuentaBancariaEmbargo.IsSelected then
    fraBancoEmbargo.Value := StrToInt(fraCuentaBancariaEmbargo.cmbDescripcion.Cells[4, fraCuentaBancariaEmbargo.cmbDescripcion.Row]);
end;

function TfrmAltaDevolucionEmbargos.IsPermisoVerCuentas: Boolean;
begin
  Result := Seguridad.Claves.IsActive('PermisoVerTodasCuentas');
end;

end.

