unit unAltaRecursosExtraordinarios;

interface
             
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, StdCtrls,
  PatternEdit, IntEdit, ToolEdit, DateComboBox, Mask, CurrEdit, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, ExtCtrls, unArt;

type
  TfrmAltaRecursosExtraordinarios = class(TForm)
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
    btnAceptarRecExtr: TButton;
    btnCancelarRecExtr: TButton;
    fraCuentaBancariaRecExtr: TfraStaticCodigoDescripcion;
    fraBancoRecExtr: TfraStaticCodigoDescripcion;
    edImporteRecExtr: TCurrencyEdit;
    edFechaRecExtr: TDateComboBox;
    edFContableRecExtr: TDateComboBox;
    edOficioRecExtr: TIntEdit;
    edObservacRecExtr: TMemo;
    edCaratulaRecExtr: TEdit;
    fraJuzgadoRecExtr: TfraCodigoDescripcion;
    fraFueroRecExtr: TfraCodigoDescripcion;
    fraSecretariaRecExtr: TfraCodigoDescripcion;
    fraJurisdiccionRecExtr: TfraCodigoDescripcion;
    lblCarpeta: TLabel;
    edNroCarpeta: TIntEdit;
    procedure btnCancelarRecExtrClick(Sender: TObject);
    procedure btnAceptarRecExtrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edNroCarpetaExit(Sender: TObject);
  private
    FImporte: Currency;
    FFecha: TDateTime;
    FIdCuentaBancaria: TTableId;
    FIdExtracto: TTableId;
    FIdBanco: TTableId;
    FEsConcilBancaria: Boolean;
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
    procedure SetFecha(const Value: TDateTime);
    procedure SetIdBanco(const Value: TTableId);
    procedure SetIdCuentaBancaria(const Value: TTableId);
    procedure SetImporte(const Value: Currency);
    procedure SetEsConcilBancaria(const Value: Boolean);
    procedure OnfraBancoChange(Sender: TObject);
    procedure OnfraCuentaBancariaChange(Sender: TObject);
  public
    property IdExtracto: TTableId        read FIdExtracto          write FIdExtracto;
    property IdBanco: TTableId           read FIdBanco             write SetIdBanco;
    property IdCuentaBancaria: TTableId  read FIdCuentaBancaria    write SetIdCuentaBancaria;
    property Importe: Currency           read FImporte             write SetImporte;
    property Fecha: TDateTime            read FFecha               write SetFecha;
    property EsConcilBancaria: Boolean   read FEsConcilBancaria    write SetEsConcilBancaria;
  end;

implementation

uses
  unDmPrincipal, AnsiSql, CustomDlgs, unSesion, StrFuncs, VCLExtra, General, SqlFuncs;

{$R *.dfm}

procedure TfrmAltaRecursosExtraordinarios.btnCancelarRecExtrClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmAltaRecursosExtraordinarios.btnAceptarRecExtrClick(Sender: TObject);
var
  sSql: String;
begin
  if not EsConcilBancaria then
  begin
    Verificar(fraBancoRecExtr.IsEmpty, fraBancoRecExtr.edCodigo, 'Debe ingresar el banco.');
    Verificar(fraCuentaBancariaRecExtr.IsEmpty, fraCuentaBancariaRecExtr.edCodigo, 'Debe ingresar la cuenta.');
    Verificar(edImporteRecExtr.Value < 0, edImporteRecExtr, 'El monto debe ser mayor a 0.');
    Verificar(edFechaRecExtr.IsEmpty, edFechaRecExtr, 'Debe ingresar la fecha.');
  end;
                    
  Verificar(fraJurisdiccionRecExtr.IsEmpty, fraJurisdiccionRecExtr.edCodigo, 'Debe ingresar la jurisdicción.');
  Verificar(fraFueroRecExtr.IsEmpty, fraFueroRecExtr.edCodigo, 'Debe ingresar el fuero.');
  Verificar(fraJuzgadoRecExtr.IsEmpty, fraJuzgadoRecExtr.edCodigo, 'Debe ingresar el juzgado.');
  Verificar(fraSecretariaRecExtr.IsEmpty, fraSecretariaRecExtr.edCodigo, 'Debe ingresar la secretaría.');
  Verificar(Trim(edCaratulaRecExtr.Text) = '', edCaratulaRecExtr, 'Debe ingresar la carátula.');
               
	try
  	with TSql.Create('LDR_DEVOLUCIONRECURSOEXT') do
    try
      PrimaryKey.Add('DR_ID', 					'SEQ_LDR_ID.NEXTVAL', False);
      Fields.Add('DR_IDEXTRACTO',       IdExtracto, True);
      Fields.Add('DR_IDCUENTABANCARIA', fraCuentaBancariaRecExtr.Value);
      Fields.Add('DR_IMPORTE',          edImporteRecExtr.Value);
      Fields.Add('DR_FECHA',            edFechaRecExtr.Date);
      Fields.Add('DR_FECHACONTABLE',    edFContableRecExtr.Date);
      Fields.Add('DR_IDJURISDICCION',   fraJurisdiccionRecExtr.Value);
      Fields.Add('DR_IDFUERO',          fraFueroRecExtr.Value);
      Fields.Add('DR_IDJUZGADO',        fraJuzgadoRecExtr.Value);
      Fields.Add('DR_IDSECRETARIA',     fraSecretariaRecExtr.Value);
      Fields.Add('DR_CARATULA',         Trim(edCaratulaRecExtr.Text));
      Fields.Add('DR_OFICIO',           edOficioRecExtr.Value);
      Fields.Add('DR_OBSERVACIONES',    edObservacRecExtr.Lines.Text);
      Fields.Add('DR_USUALTA',          Sesion.UserId);
      Fields.Add('DR_FECHAALTA',        exDateTime);

      if not edNroCarpeta.IsEmpty and fraJurisdiccionRecExtr.Locked then
        begin
           sSql := 'SELECT JT_ID ' +
                     'FROM LEGALES.LJT_JUICIOENTRAMITE ' +
                    'WHERE JT_ESTADOMEDIACION = ''J'' ' +
                      'AND JT_NUMEROCARPETA = :Carpeta';

           Fields.Add('DR_IDJUICIO',           ValorSqlIntegerEx(sSql, [edNroCarpeta.Value]));
        end;

      SqlType := stInsert;

      BeginTrans;
      EjecutarSqlST(Sql);

      if IdExtracto <> ART_EMPTY_ID then
        EjecutarStoreSTEx('cont.do_conciliasincontrapartida(:id_extracto, 18, :usuario_login);', [IdExtracto, Sesion.UserId]);
      CommitTrans;

      MsgBox('Datos del Recurso Extraordinado grabados correctamente.', MB_ICONINFORMATION);

      ModalResult := mrOk;
    finally
      Free;
    end;
  except
  	on E: Exception do
    	ErrorMsg(E, 'Error al grabar los datos del RecExtr.');
  end;
end;

procedure TfrmAltaRecursosExtraordinarios.FormCreate(Sender: TObject);
begin
  with fraBancoRecExtr do
  begin
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';
    OnChange    := OnfraBancoChange;
  end;

  with fraCuentaBancariaRecExtr do
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

  with fraFueroRecExtr do
  begin
    TableName   := 'LEGALES.LFU_FUERO';
    FieldID     := 'FU_ID';
    FieldCodigo := 'FU_ID';
    FieldDesc   := 'FU_DESCRIPCION';
    FieldBaja   := 'FU_FECHABAJA';

    ExtraCondition := 'AND 1=2';
    OnChange := ChangeFuero;
  end;

  with fraJurisdiccionRecExtr do
  begin
    TableName   := 'LEGALES.LJU_JURISDICCION';
    FieldID     := 'JU_ID';
    FieldCodigo := 'JU_ID';
    FieldDesc   := 'JU_DESCRIPCION';
    FieldBaja   := 'JU_FECHABAJA';

    OnChange := ChangeJurisdiccion;
  end;

  with fraJuzgadoRecExtr do
  begin
    TableName   := 'LEGALES.LJZ_JUZGADO';
    FieldID     := 'JZ_ID';
    FieldCodigo := 'JZ_ID';
    FieldDesc   := 'JZ_DESCRIPCION';
    ExtraCondition := 'AND 1=2';
    FieldBaja   := 'JZ_FECHABAJA';

    OnChange := ChangeJuzgado;
  end;

  with fraSecretariaRecExtr do
  begin
    TableName   := 'LEGALES.LSC_SECRETARIA';
    FieldID     := 'SC_ID';
    FieldCodigo := 'SC_ID';
    FieldDesc   := 'SC_DESCRIPCION';
    ExtraCondition := 'AND 1=2';
    FieldBaja   := 'SC_FECHABAJA';
  end;

  IdExtracto := ART_EMPTY_ID;

  edFContableRecExtr.Date := DBDate;
end;

procedure TfrmAltaRecursosExtraordinarios.ChangeJurisdiccion(Sender: TObject);
begin
  if fraJurisdiccionRecExtr.IsSelected then
    with fraFueroRecExtr do
    begin
      fraFueroRecExtr.Codigo := '';
      TableName   	 := 'LEGALES.LFU_FUERO';
      FieldID     	 := 'FU_ID';
      FieldCodigo 	 := 'FU_ID';
      FieldDesc   	 := 'FU_DESCRIPCION';
      ExtraCondition := ' AND FU_ID IN (SELECT JZ_IDFUERO FROM LEGALES.LJZ_JUZGADO WHERE JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccionRecExtr.Codigo))+ ')';
      OnChange 			 := ChangeFuero;
    end;

  if fraJurisdiccionRecExtr.IsSelected and fraFueroRecExtr.IsSelected then
    with fraJuzgadoRecExtr do
    begin
      fraJuzgadoRecExtr.Codigo := '';
      TableName   	 := 'LEGALES.LJZ_JUZGADO';
      FieldID     	 := 'JZ_ID';
      FieldCodigo 	 := 'JZ_ID';
      FieldDesc   	 := 'JZ_DESCRIPCION';
      ExtraCondition := 'AND JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccionRecExtr.Codigo)) + ' AND JZ_IDFUERO = ' +  SqlValue(strtoint(fraFueroRecExtr.Codigo));
    end;
end;

procedure TfrmAltaRecursosExtraordinarios.ChangeFuero(Sender: TObject);
begin
  if fraJurisdiccionRecExtr.IsSelected and fraFueroRecExtr.IsSelected then
  	with fraJuzgadoRecExtr do
    begin
      TableName   	 := 'LEGALES.LJZ_JUZGADO';
      FieldID     	 := 'JZ_ID';
      FieldCodigo 	 := 'JZ_ID';
      FieldDesc   	 := 'JZ_DESCRIPCION';
      ExtraCondition := 'AND JZ_IDJURISDICCION = ' + SqlValue(strtoint(fraJurisdiccionRecExtr.Codigo)) + ' AND JZ_IDFUERO = ' +  SqlValue(strtoint(fraFueroRecExtr.Codigo));
    end;
end;

procedure TfrmAltaRecursosExtraordinarios.ChangeJuzgado(Sender: TObject);
begin
  if fraJuzgadoRecExtr.IsSelected then
    with fraSecretariaRecExtr do
    begin
      TableName   	 := 'LEGALES.LSC_SECRETARIA';
      FieldID     	 := 'SC_ID';
      FieldCodigo 	 := 'SC_ID';
      FieldDesc   	 := 'SC_DESCRIPCION';
      ExtraCondition := 'AND SC_IDJUZGADO = ' + SqlValue(strtoint(fraJuzgadoRecExtr.Codigo));
    end;
end;

procedure TfrmAltaRecursosExtraordinarios.SetFecha(const Value: TDateTime);
begin
  FFecha := Value;

  edFechaRecExtr.Date := Value;
end;

procedure TfrmAltaRecursosExtraordinarios.SetIdBanco(const Value: TTableId);
begin
  FIdBanco := Value;

  fraBancoRecExtr.Value := Value;
end;

procedure TfrmAltaRecursosExtraordinarios.SetIdCuentaBancaria(const Value: TTableId);
begin
  FIdCuentaBancaria := Value;

  fraCuentaBancariaRecExtr.Value := Value;
  fraCuentaBancariaRecExtr.FrameExit(nil);
end;

procedure TfrmAltaRecursosExtraordinarios.SetImporte(const Value: Currency);
begin
  FImporte := Value;

  edImporteRecExtr.Value := Value;
end;

procedure TfrmAltaRecursosExtraordinarios.edNroCarpetaExit(Sender: TObject);
var
  sSql: String;
  bBloquear: Boolean;
begin
  if edNroCarpeta.IsEmpty then
    bBloquear := False
  else
    begin
      sSql := 'SELECT JT_CARATULA, JT_IDFUERO, JT_IDJUZGADO, JT_IDSECRETARIA, JT_IDJURISDICCION ' +
                'FROM LEGALES.LJT_JUICIOENTRAMITE ' +
               'WHERE JT_ESTADOMEDIACION = ''J'' ' +
                 'AND JT_NUMEROCARPETA = :Carpeta';

      with GetQueryEx(sSql, [edNroCarpeta.Value]) do
        try
          if IsEmpty then
            begin
              bBloquear := False;

              fraJurisdiccionRecExtr.Clear;
              fraFueroRecExtr.Clear;
              fraJuzgadoRecExtr.Clear;
              fraSecretariaRecExtr.Clear;
              edCaratulaRecExtr.Clear;
            end
          else
            begin
              bBloquear := True;

              fraJurisdiccionRecExtr.Value := FieldByName('JT_IDJURISDICCION').AsInteger;
              ChangeJurisdiccion(nil);

              fraFueroRecExtr.Value        := FieldByName('JT_IDFUERO').AsInteger;
              ChangeFuero(nil);

              fraJuzgadoRecExtr.Value      := FieldByName('JT_IDJUZGADO').AsInteger;
              ChangeJuzgado(nil);

              fraSecretariaRecExtr.Value   := FieldByName('JT_IDSECRETARIA').AsInteger;

              edCaratulaRecExtr.Text       := FieldByName('JT_CARATULA').AsString;
            end;
        finally
          Free;
        end;
    end;

  VCLExtra.LockControls([fraJurisdiccionRecExtr, fraFueroRecExtr, fraJuzgadoRecExtr, fraSecretariaRecExtr, edCaratulaRecExtr], bBloquear);

  if bBloquear then
    edOficioRecExtr.SetFocus
  else
    fraJurisdiccionRecExtr.edCodigo.SetFocus;
end;

procedure TfrmAltaRecursosExtraordinarios.SetEsConcilBancaria(const Value: Boolean);
begin
  FEsConcilBancaria := Value;

  VclExtra.LockControls([fraBancoRecExtr, fraCuentaBancariaRecExtr, edImporteRecExtr, edFechaRecExtr], EsConcilBancaria);
  VclExtra.LockControls([edFContableRecExtr]);

  if not EsConcilBancaria then
  begin
    fraBancoRecExtr.ExtraCondition          := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO' + Iif(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '') + ')';
    // fraCuentaBancariaRecExtr.ExtraCondition := IIF(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '');
  end;

  if EsConcilBancaria then
    ActiveControl := fraJurisdiccionRecExtr.edCodigo
  else
    ActiveControl := fraBancoRecExtr.edCodigo;
end;

procedure TfrmAltaRecursosExtraordinarios.OnfraBancoChange(Sender: TObject);
begin
  if fraBancoRecExtr.IsSelected then
    // fraCuentaBancariaRecExtr.ExtraCondition := Iif(not EsConcilBancaria, ' AND CB_CONCILIACION = ''N''', '') + ' AND CB_IDBANCO = ' + SqlValue(fraBancoRecExtr.Value);
    fraCuentaBancariaRecExtr.ExtraCondition := ' AND CB_IDBANCO = ' + SqlValue(fraBancoRecExtr.Value);
end;

procedure TfrmAltaRecursosExtraordinarios.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBancoRecExtr.IsSelected and fraCuentaBancariaRecExtr.IsSelected then
    fraBancoRecExtr.Value := StrToInt(fraCuentaBancariaRecExtr.cmbDescripcion.Cells[4, fraCuentaBancariaRecExtr.cmbDescripcion.Row]);
end;

end.

