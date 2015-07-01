unit unAltaEmbargos;

interface
          
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, StdCtrls,
  PatternEdit, IntEdit, ToolEdit, DateComboBox, Mask, CurrEdit, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, ExtCtrls, unArt;

type
  TfrmAltaEmbargos = class(TForm)
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
    Label1: TLabel;
    edMontoEmbargado: TCurrencyEdit;
    rgTipo: TRadioGroup;
    procedure btnCancelarEmbargoClick(Sender: TObject);
    procedure btnAceptarEmbargoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
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
  public
    property IdExtracto: TTableId        read FIdExtracto          write FIdExtracto;
    property IdBanco: TTableId           read FIdBanco             write SetIdBanco;
    property IdCuentaBancaria: TTableId  read FIdCuentaBancaria    write SetIdCuentaBancaria;
    property Importe: Currency           read FImporte             write SetImporte;
    property Fecha: TDateTime            read FFecha               write SetFecha;
    property EsConcilBancaria: Boolean   read FEsConcilBancaria    write SetEsConcilBancaria;
  end;

var
  frmAltaEmbargos: TfrmAltaEmbargos;

implementation

uses
  unDmPrincipal, AnsiSql, CustomDlgs, unSesion, StrFuncs, VCLExtra, General, SqlFuncs,
  unComunes, DateTimeFuncs;

{$R *.dfm}

procedure TfrmAltaEmbargos.btnCancelarEmbargoClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmAltaEmbargos.btnAceptarEmbargoClick(Sender: TObject);
var
  sTipo: String;
begin
  Verificar(rgTipo.ItemIndex = -1, rgTipo, 'Debe indicar el tipo de embargo.');

  if not EsConcilBancaria then
  begin
    if  rgTipo.ItemIndex = 2 then  // Banco
      begin
        Verificar(fraBancoEmbargo.IsEmpty, fraBancoEmbargo.edCodigo, 'Debe ingresar el banco.');
        Verificar(fraCuentaBancariaEmbargo.IsEmpty, fraCuentaBancariaEmbargo.edCodigo, 'Debe ingresar la cuenta.');
      end;

    Verificar(edImporteEmbargo.Value < 0, edImporteEmbargo, 'El importe retenido debe ser mayor a 0.');
    Verificar(edFechaEmbargo.IsEmpty, edFechaEmbargo, 'Debe ingresar la fecha.');
  end;

  Verificar(edMontoEmbargado.Value < 0, edMontoEmbargado, 'El monto embargado debe ser mayor a 0.');
  Verificar(fraJurisdiccionEmbargo.IsEmpty, fraJurisdiccionEmbargo.edCodigo, 'Debe ingresar la jurisdicción.');
  Verificar(fraFueroEmbargo.IsEmpty, fraFueroEmbargo.edCodigo, 'Debe ingresar el fuero.');
  Verificar(fraJuzgadoEmbargo.IsEmpty, fraJuzgadoEmbargo.edCodigo, 'Debe ingresar el juzgado.');
  Verificar(fraSecretariaEmbargo.IsEmpty, fraSecretariaEmbargo.edCodigo, 'Debe ingresar la secretaría.');
  Verificar(Trim(edCaratulaEmbargo.Text) = '', edCaratulaEmbargo, 'Debe ingresar la carátula.');

	try
  	with TSql.Create('LEM_EMBARGO') do
    try
      PrimaryKey.Add('EM_ID', 					'SEQ_LEM_ID.NEXTVAL', False);
      Fields.Add('EM_IDEXTRACTO',       IdExtracto, True);

      case rgTipo.ItemIndex of
        0:  sTipo := 'I';
        1:  sTipo := 'O';
        2:  sTipo := 'B';
      end;
      Fields.Add('EM_TIPO',             sTipo);

      Fields.Add('EM_IDCUENTABANCARIA', fraCuentaBancariaEmbargo.Value, True);
      Fields.Add('EM_IMPORTE',          edImporteEmbargo.Value);
      Fields.Add('EM_MONTOEMBARGADO',   edMontoEmbargado.Value);
      Fields.Add('EM_FECHA',            edFechaEmbargo.Date);
      Fields.Add('EM_FECHACONTABLE',    edFContableEmbargo.Date);
      Fields.Add('EM_IDJURISDICCION',   fraJurisdiccionEmbargo.Value);
      Fields.Add('EM_IDFUERO',          fraFueroEmbargo.Value);
      Fields.Add('EM_IDJUZGADO',        fraJuzgadoEmbargo.Value);
      Fields.Add('EM_IDSECRETARIA',     fraSecretariaEmbargo.Value);
      Fields.Add('EM_CARATULA',         Trim(edCaratulaEmbargo.Text));
      Fields.Add('EM_OFICIO',           edOficioEmbargo.Value);
      Fields.Add('EM_OBSERVACIONES',    edObservacEmbargo.Lines.Text);
      Fields.Add('EM_IDESTADO',         1);   // Alta sin Asignar
      Fields.Add('EM_USUALTA',          Sesion.UserId);
      Fields.Add('EM_FECHAALTA',        exDateTime);

      SqlType := stInsert;

      BeginTrans;
      EjecutarSqlST(Sql);

      if IdExtracto <> ART_EMPTY_ID then
        EjecutarStoreSTEx('cont.do_conciliasincontrapartida(:id_extracto, 17, :usuario_login, :fecha_contable);', [IdExtracto, Sesion.UserId, TDateTimeEx.Create(edFContableEmbargo.Date)]);
      CommitTrans;

      EnviarMailEmbargoLegales('Alta de Embargos', edCaratulaEmbargo.Text, edObservacEmbargo.Lines.Text, edImporteEmbargo.Value);

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

procedure TfrmAltaEmbargos.FormCreate(Sender: TObject);
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

procedure TfrmAltaEmbargos.ChangeJurisdiccion(Sender: TObject);
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

procedure TfrmAltaEmbargos.ChangeFuero(Sender: TObject);
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

procedure TfrmAltaEmbargos.ChangeJuzgado(Sender: TObject);
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

procedure TfrmAltaEmbargos.SetFecha(const Value: TDateTime);
begin
  FFecha := Value;

  edFechaEmbargo.Date := Value;
end;

procedure TfrmAltaEmbargos.SetIdBanco(const Value: TTableId);
begin
  FIdBanco := Value;

  fraBancoEmbargo.Value := Value;
end;

procedure TfrmAltaEmbargos.SetIdCuentaBancaria(const Value: TTableId);
begin
  FIdCuentaBancaria := Value;

  fraCuentaBancariaEmbargo.Value := Value;
  fraCuentaBancariaEmbargo.FrameExit(nil);
end;

procedure TfrmAltaEmbargos.SetImporte(const Value: Currency);
begin
  FImporte := Value;

  edImporteEmbargo.Value := Value;
end;

procedure TfrmAltaEmbargos.SetEsConcilBancaria(const Value: Boolean);
begin
  FEsConcilBancaria := Value;

  VclExtra.LockControls([rgTipo, fraBancoEmbargo, fraCuentaBancariaEmbargo, edImporteEmbargo, edFechaEmbargo], EsConcilBancaria);
  VclExtra.LockControls([edFContableEmbargo], not EsConcilBancaria);

  if not EsConcilBancaria then
  begin
    fraBancoEmbargo.ExtraCondition          := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO' + Iif(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '') + ')';
    fraCuentaBancariaEmbargo.ExtraCondition := IIF(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '');
  end;

  if EsConcilBancaria then
    begin
      rgTipo.ItemIndex := 2;   // Bancos
      ActiveControl := fraJurisdiccionEmbargo.edCodigo
    end
  else
    begin
      rgTipo.ItemIndex := -1;
      ActiveControl := rgTipo;
    end;
end;

procedure TfrmAltaEmbargos.OnfraBancoChange(Sender: TObject);
begin
  if fraBancoEmbargo.IsSelected then
    fraCuentaBancariaEmbargo.ExtraCondition := Iif(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '') + ' AND CB_IDBANCO = ' + SqlValue(fraBancoEmbargo.Value)
end;

procedure TfrmAltaEmbargos.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBancoEmbargo.IsSelected and fraCuentaBancariaEmbargo.IsSelected then
    fraBancoEmbargo.Value := StrToInt(fraCuentaBancariaEmbargo.cmbDescripcion.Cells[4, fraCuentaBancariaEmbargo.cmbDescripcion.Row]);
end;

procedure TfrmAltaEmbargos.rgTipoClick(Sender: TObject);
var
  bBloquearCuentaBanc: Boolean;
begin
  if rgTipo.Enabled then
    begin
      bBloquearCuentaBanc := (rgTipo.ItemIndex <> 2);  // Banco

      VclExtra.LockControls([fraBancoEmbargo, fraCuentaBancariaEmbargo], bBloquearCuentaBanc);

      if bBloquearCuentaBanc then
        begin
          fraBancoEmbargo.Clear;
          fraCuentaBancariaEmbargo.Clear;
        end;
    end;    
end;

end.
