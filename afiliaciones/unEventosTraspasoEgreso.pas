unit unEventosTraspasoEgreso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ShortCutControl, PeriodoPicker, unArtFrame,
  ComCtrls, ToolWin, StdCtrls, CurrEdit, Mask, ToolEdit, DateComboBox, unART, SDEngine,unFraStaticCTB_TABLAS,
  unFraStaticCodigoDescripcion, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ExtCtrls;

type
  TfrmEventosTraspasoEgreso = class(TForm)
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    cmbFecha: TDateComboBox;
    edDeuda: TCurrencyEdit;
    edObservaciones: TMemo;
    ToolBar1: TToolBar;
    tbGrabar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl1: TShortCutControl;
    cmbFechaGeneracion: TDateComboBox;
    fraEventos: TfraStaticCTB_TABLAS;
    Label4: TLabel;
    edDeudaNominal: TCurrencyEdit;
    edIntereses: TCurrencyEdit;
    Label5: TLabel;
    edConsolidado: TCurrencyEdit;
    Label6: TLabel;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label7: TLabel;
    Label9: TLabel;
    rgDioCumplimiento: TRadioGroup;
    Label11: TLabel;
    rgClausulaRgrl: TRadioGroup;
    ToolBar2: TToolBar;
    tbGuardarArt: TToolButton;
    tbModificarArt: TToolButton;
    fraArtFutura: TfraStaticCodigoDescripcion;
    Label8: TLabel;
    procedure tbGrabarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edInteresesChange(Sender: TObject);
    procedure edDeudaNominalChange(Sender: TObject);
    procedure CambiaEvento(Sender: TObject);
    procedure tbModificarArtClick(Sender: TObject);
    procedure tbGuardarArtClick(Sender: TObject);
  private
    FEsCargaMasiva: Boolean;
    FFuncion: TFuncionShowForm;
    FId: TTableID;
    FIdArtFutura: TTableID;

    function ExistsRegistro: Boolean;
    function IsValidar: Boolean;

    procedure ActualizarConsolidado;
    procedure CambiaEmpresa(Sender: TObject);
    procedure CargarCumplimiento(const aContrato: Integer);
    procedure ClearControls;
    procedure DoAgregarDatos;
    procedure DoModificarDatos;
    procedure SetFuncion(const Value: TFuncionShowForm);
  public
    function DoCargarDatos(iID, iIDArtFutura: TTableID; aFuncion: TFuncionShowForm): Boolean;

    procedure DoCargarMasiva;

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  end;

var
  frmEventosTraspasoEgreso: TfrmEventosTraspasoEgreso;

implementation

{$R *.DFM}

uses
  CustomDlgs, unPrincipal, AnsiSQL, General, unDmPrincipal, SqlFuncs, VclExtra, unAfiliaciones, DateTimeFuncs;

function TfrmEventosTraspasoEgreso.DoCargarDatos(iID, iIDArtFutura: TTableID; aFuncion: TFuncionShowForm): Boolean;
var
  sSql: String;
begin
  Result := True;

  // En el caso de AGREGAR en iID viene TE_CONTRATO
  // En el caso de MODIFICAR en iID viene TE_ID
  FId := iID;
  FIdArtFutura := iIDArtFutura;
  Funcion := aFuncion;
  FEsCargaMasiva := False;

  VCLExtra.LockControls(gbEmpresa, True);

  VCLExtra.LockControls(ToolBar2, False);
  tbGuardarArt.Enabled := False;

  fraArtFutura.Value := FIdArtFutura;
  try
    if FFuncion = fsAgregar then
      fraEmpresa.Contrato := FId
    else //fsModificar o fsConsulta
    begin
      sSql :=
        'SELECT te_clausulargrl, te_codigo, te_consolidado, te_contrato, te_deuda, te_deudanominal, te_fecha,' +
              ' te_fechageneracion, te_intereses, te_observaciones' +
         ' FROM ate_traspasoegreso' +
        ' WHERE te_id = :id';
      with GetQueryEx(sSql, [FId]) do
      try
        fraEventos.Value         := FieldByName('te_codigo').AsString;
        rgClausulaRgrl.ItemIndex := IIF((FieldByName('te_clausulargrl').AsString = 'S'), 0, IIF((FieldByName('te_clausulargrl').AsString = 'N'), 1, -1));
        cmbFecha.Date            := FieldByName('te_fecha').AsDateTime;
        cmbFechaGeneracion.Date  := FieldByName('te_fechageneracion').AsDateTime;
        edDeuda.Value            := FieldByName('te_deuda').AsFloat;
        edDeudaNominal.Value     := FieldByName('te_deudanominal').AsFloat;
        edIntereses.Value        := FieldByName('te_intereses').AsFloat;
        edConsolidado.Value      := FieldByName('te_consolidado').AsFloat;
        edObservaciones.Text     := FieldByName('te_observaciones').AsString;

        //Si entro aca el ID es el de TE_ID, cargo entonces el contrato
        fraEmpresa.Contrato     := FieldByName('te_contrato').AsInteger;
      finally
        Free;
      end;
    end;
    CargarCumplimiento(fraEmpresa.Contrato);
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Ha ocurrido un error en la recuperación de datos.');
      Result := false;
    end;
  end;
end;

function TfrmEventosTraspasoEgreso.ExistsRegistro: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM ate_traspasoegreso' +
    ' WHERE te_contrato = :contrato' +
      ' AND te_idartfutura = :idartfutura' +
      ' AND te_codigo = :codigo' +
      ' AND te_fecha = :fecha';

  if FId > 0 then
    sSql := sSql + ' AND te_id <> ' + SqlValue(FId);

  Result := (ValorSqlIntegerEx(sSql, [fraEmpresa.Contrato, fraArtFutura.Value, fraEventos.edCodigo.Text,
                                      TDateTimeEx.Create(cmbFecha.Date)], 0) > 0);
end;

function TfrmEventosTraspasoEgreso.IsValidar: Boolean;
  procedure Verificar(Condicion: Boolean; AControl: TWinControl; AText: String);
  begin
    if Condicion then
    begin
      InvalidMsg(AControl, AText);
      Abort;
    end;
  end;

var
  sSql: String;
begin
  Result := False;
  
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'La empresa es obligatoria.');
  Verificar(fraArtFutura.IsEmpty, fraArtFutura, 'La Art futura es obligatoria.');

  //  TE_CODIGO no puede ser null
  Verificar(fraEventos.IsEmpty, fraEventos.edCodigo, 'El evento no puede quedar en blanco.');

  //  TE_FECHA no puede ser null
  Verificar(cmbFecha.IsEmpty, cmbFecha, 'La fecha ingresada no es correcta.');

  if fraEventos.Codigo = '020' then   // Si es traspaso egreso sin deuda..
  begin
    sSql :=
      'SELECT co_estado' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = :contrato';
    if ValorSqlIntegerEx(sSql, [fraEmpresa.Contrato]) = 9 then    // Si tiene baja pendiente por rescisión..
      if not MsgAsk('La empresa se encuentra en estado "Baja pendiente por rescisión".' + #13#10 +
                    '¿ Desea continuar con la carga del evento ?') then
        Exit;
  end;

  Verificar((fraEventos.Codigo = '020') and (edConsolidado.Value > 0), fraEventos.edCodigo, 'Evento incorrecto ya que esta empresa tiene deuda consolidada.');

  Result := True;
end;

procedure TfrmEventosTraspasoEgreso.DoAgregarDatos;
var
  aSqlATE: TSql;    // para insert into ATE_TRASPASOEGRESO
  iIdNota: String;
  iIdTraspaso: String;
  sEspecial2: String;
  sSql: String;
begin
  // En el AGREGAR el FId contiene el TE_CONTRATO
  aSqlATE := TSql.Create('ate_traspasoegreso');
  try
    iIdTraspaso := ValorSql('SELECT seq_ate_id.NEXTVAL FROM DUAL');

    aSqlATE.SqlType := stInsert;
    aSqlATE.PrimaryKey.Add('te_id',        iIdTraspaso);
    aSqlATE.Fields.Add('te_contrato',      fraEmpresa.Contrato);
    aSqlATE.Fields.Add('te_idartfutura',   fraArtFutura.Value);
    aSqlATE.Fields.Add('te_rgrl',          String(IIF((rgDioCumplimiento.ItemIndex = 0), 'S', IIF((rgDioCumplimiento.ItemIndex = 1), 'N', ''))));
    aSqlATE.Fields.Add('te_codigo',        fraEventos.edCodigo.Text);
    aSqlATE.Fields.Add('te_clausulargrl',  String(IIF((rgClausulaRgrl.ItemIndex = 0), 'S', IIF((rgClausulaRgrl.ItemIndex = 1), 'N', ''))));
    aSqlATE.Fields.Add('te_fecha',         cmbFecha.Date);
    aSqlATE.Fields.Add('te_observaciones', edObservaciones.Text);
    aSqlATE.Fields.Add('te_deuda',         edDeuda.Value, dtNumber);
    aSqlATE.Fields.Add('te_deudanominal',  edDeudaNominal.Value, dtNumber);
    aSqlATE.Fields.Add('te_intereses',     edIntereses.Value, dtNumber);
    aSqlATE.Fields.Add('te_consolidado',   edConsolidado.Value, dtNumber);
    aSqlATE.Fields.Add('te_usualta',       frmPrincipal.DBLogin.UserId);
    aSqlATE.Fields.Add('te_fechaalta',     SQL_ACTUALDATE, false);

    try
      BeginTrans;
      sEspecial2 := fraEventos.cmbDescripcion.Cells[fraEventos.ColEspecial2, fraEventos.cmbDescripcion.Row];

      if sEspecial2 = 'SRT' then
      begin
        iIdNota := ValorSql('SELECT seq_ans_id.NEXTVAL FROM DUAL');

        with TSql.Create('ans_notasrt') do
        try
          SqlType := stInsert;

          PrimaryKey.Add('ns_id',    iIdNota);
          Fields.Add('ns_tiponota',  '2');
          Fields.Add('ns_contrato',  fraEmpresa.Contrato);
          Fields.Add('ns_nota',      edObservaciones.Text);
          Fields.Add('ns_usualta',   frmPrincipal.DBLogin.UserId);
          Fields.Add('ns_fechaalta', SQL_ACTUALDATE, false);

          EjecutarSQLST(Sql);
        finally
          Free;
        end;

        sSql :=
          'UPDATE ate_traspasoegreso' +
            ' SET te_idnotasrt = :idnotasrt' +
          ' WHERE te_id = :id';
        EjecutarSqlSTEx(sSql, [iIdNota, iIdTraspaso]);
      end;

      EjecutarSqlST(aSqlATE.Sql);

      if fraEventos.edCodigo.Text = '001' then
      begin
        sSql :=
          'BEGIN' +
           ' IF art.cobranza.check_cobertura_periodocobranz(:contrato, emi.utiles.get_maximoperiododev) = 1 THEN' +
             ' emi.emision.do_devengadocontrato(:contrato, emi.utiles.get_maximoperiododev, NULL, TRUE);' +
           ' END IF;' +
         ' END;';
        EjecutarSqlSTEx(sSql, [fraEmpresa.Contrato]);
      end;

      CommitTrans;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

      //DECIDE QUE HACE DEPENDIENDO DE DONDE VINO
      if FEsCargaMasiva then
        ClearControls
      else
        Close;
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    aSqlATE.Free;
  end;
end;

procedure TfrmEventosTraspasoEgreso.DoModificarDatos;
var
  sSql: String;
begin
  // En el MODIFICAR el FId contiene el TE_ID
  try
    sSql :=
      'UPDATE ate_traspasoegreso' +
        ' SET te_observaciones = :observaciones,' +
            ' te_usumodif = :usumodif,' +
            ' te_fechamodif = actualdate' +
      ' WHERE te_id = :id';
    EjecutarSqlEx(sSql, [edObservaciones.Text, frmPrincipal.DBLogin.UserId, FId]);

    MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    Close;
  except
    on E: Exception do
      ErrorMsg(E, 'Se produjo un error en la actualización.');
  end;
end;

procedure TfrmEventosTraspasoEgreso.tbGrabarClick(Sender: TObject);
begin
  if (ExistsRegistro) and (not MsgAsk('Ya existe un registro con esos datos.' + #10 + #13 +
      '¿ Desea guardarlo de todos modos ?', 'Advertencia')) then
    Exit;

  case FFuncion of
    fsAgregar:
      if isValidar then
        DoAgregarDatos;
    fsModificar:
      DoModificarDatos;
  end;
end;

procedure TfrmEventosTraspasoEgreso.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEventosTraspasoEgreso.FormCreate(Sender: TObject);
begin
  inherited;

  FId := 0;

  fraEventos.Clave := 'EVTEG';
  fraEventos.OnChange := CambiaEvento;
  LockControls([cmbFechaGeneracion], True);

  fraArtFutura.TableName   := 'aar_art';
  fraArtFutura.FieldID     := 'ar_id';
  fraArtFutura.FieldCodigo := 'ar_id';
  fraArtFutura.FieldDesc   := 'ar_nombre';
  fraArtFutura.FieldBaja   := 'ar_fechabaja';

  fraEmpresa.OnChange      := CambiaEmpresa;
  fraEmpresa.ShowBajas     := True;
  fraEmpresa.UltContrato   := True;
end;

procedure TfrmEventosTraspasoEgreso.ActualizarConsolidado;
begin
  edConsolidado.Value := edDeudaNominal.Value + edIntereses.Value;
end;

procedure TfrmEventosTraspasoEgreso.edInteresesChange(Sender: TObject);
begin
  ActualizarConsolidado;
end;

procedure TfrmEventosTraspasoEgreso.edDeudaNominalChange(Sender: TObject);
begin
  ActualizarConsolidado;
end;

procedure TfrmEventosTraspasoEgreso.CambiaEmpresa(Sender: TObject);
var
  iIdArt: Integer;
  sSql: String;
begin
  if fraEmpresa.IsSelected then
  begin
    sSql :=
      'SELECT   te_idartfutura' +
         ' FROM ate_traspasoegreso' +
        ' WHERE te_contrato = :contrato' +
          ' AND te_fechabaja IS NULL' +
     ' ORDER BY te_fechaalta DESC';
    iIdArt := ValorSqlIntegerEx(sSql, [fraEmpresa.edContrato.Text]);

    if iIdArt > 0 then
    begin
      fraArtFutura.Value := iIdArt;
      fraEventos.edCodigo.SetFocus;
    end
    else
      fraArtFutura.edCodigo.SetFocus;

    CargarCumplimiento(fraEmpresa.Contrato);
  end;
end;

procedure TfrmEventosTraspasoEgreso.DoCargarMasiva;
begin
  FFuncion := fsAgregar;
  VCLExtra.LockControls(gbEmpresa, False);
  FEsCargaMasiva := True;
end;

procedure TfrmEventosTraspasoEgreso.SetFuncion(const Value: TFuncionShowForm);
begin
  fFuncion := Value;
  if FFuncion = fsAgregar then
  begin
    Caption := 'Administración de Evento de Traspaso Egreso (Agregar)';
    LockControls([fraEventos, rgClausulaRgrl, cmbFecha, edDeuda, edDeudaNominal, edIntereses, edConsolidado], False);
  end
  else
  begin
    Caption := 'Administración de Evento de Traspaso Egreso (Modificar)';
    LockControls([fraEventos, rgClausulaRgrl, cmbFecha, edDeuda, edDeudaNominal, edIntereses, edConsolidado], True);
  end;
end;

procedure TfrmEventosTraspasoEgreso.CargarCumplimiento(const aContrato: Integer);
var
  sCumplio: String;
  sSql: String;
begin
  sSql := 'SELECT art.afiliacion.get_aplicaincumplimiento(:contrato) FROM DUAL';
  sCumplio := ValorSqlEx(sSql, [aContrato]);
  rgDioCumplimiento.ItemIndex := IIF((sCumplio = 'S'), 0, IIF((sCumplio = 'N'), 1, -1));
end;

procedure TfrmEventosTraspasoEgreso.ClearControls;
begin
  fraEmpresa.Clear;
  fraEventos.Clear;
  rgClausulaRgrl.ItemIndex := -1;
  edDeuda.Clear;
  edDeudaNominal.Clear;
  edIntereses.Clear;
  edConsolidado.Clear;
  edObservaciones.Clear;
  cmbFechaGeneracion.Clear;
  fraEmpresa.mskCUIT.SetFocus;
  fraArtFutura.Clear;
  rgDioCumplimiento.ItemIndex := -1;
end;

procedure TfrmEventosTraspasoEgreso.CambiaEvento(Sender: TObject);
var
  sClausulaRgrl: String;
  sSql: String;
begin
  if fraEventos.Value = '001' then
    rgClausulaRgrl.ItemIndex := -1
  else
  begin
    sSql :=
      'SELECT   te_clausulargrl' +
         ' FROM ate_traspasoegreso' +
        ' WHERE te_contrato = :contrato' +
     ' ORDER BY te_id DESC';
    sClausulaRgrl := ValorSqlEx(sSql, [fraEmpresa.Contrato]);
    rgClausulaRgrl.ItemIndex := IIF((sClausulaRgrl = 'S'), 0, IIF((sClausulaRgrl = 'N'), 1, -1));
  end;
end;

procedure TfrmEventosTraspasoEgreso.tbModificarArtClick(Sender: TObject);
begin
  VCLExtra.LockControl(fraArtFutura, False);
  tbGuardarArt.Enabled := True;
  tbModificarArt.Enabled := False;
end;

procedure TfrmEventosTraspasoEgreso.tbGuardarArtClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraArtFutura.IsEmpty, fraArtFutura, 'La ART futura no puede quedar vacía');
  try
    sSql :=
      'UPDATE ate_traspasoegreso' +
        ' SET te_idartfutura = :artfutura,' +
            ' te_usumodif = :usumodif,' +
            ' te_fechamodif = actualdate' +
      ' WHERE te_id = :id';
    EjecutarSqlEx(sSql, [fraArtFutura.Value, frmPrincipal.DBLogin.UserId, FId]);

    MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
  except
    on E: Exception do
      ErrorMsg(E, 'Se produjo un error en la actualización.');
  end;

  tbGuardarART.Enabled := False;
  tbModificarART.Enabled := True;
  VCLExtra.LockControl(fraArtFutura, True);
end;

end.
