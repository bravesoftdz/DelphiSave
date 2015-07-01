unit unParteAuditoria;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, JvExtComponent, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSinForm, SDEngine, DB, ExtCtrls, artSeguridad,
  XPMenu, unSinFormNavigator, StdCtrls, Mask, PatternEdit, ComboEditor,
  DBComboGrid, Buttons, JvgGroupBox, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unfraCPR_PRESTADOR, DateComboBox, RXDBCtrl,
  unFraStaticCodigoDescripcion, unFraStaticCodDesc, unFraMAU_AUDITORES,
  unFraSTG_TIPOGRAVEDAD, unFraTipoSiniestro, unFraSMC_MOTIVONOCARGA,
  JvExExtCtrls, JvComponent, JvDBRadioPanel, DBPatternEdit, DBCtrls,
  unFraSTC_TIPOGRAVEDAD_CIE10, unFraCDG_DIAGNOSTICO, unFraTipoEgreso,
  unFraTipoAtencion, unFraSDA_DETALLEARCHIVO, unFraMIM_IMPLANTES, JvPanel,
  ShortCutControl, QuickRpt, unFraPrestadorFueraDeContrato, ActnList;

type
  TfrmParteAuditoria = class(TSinFormNavigator)
    gbPrestador: TJvgGroupBox;
    Label3: TLabel;
    edPA_FECHAAUDITORIA: TDBDateEdit;
    sdqDatosPA_ID: TFloatField;
    sdqDatosPA_IDEXPEDIENTE: TFloatField;
    sdqDatosPA_NROPARTE: TFloatField;
    sdqDatosPA_IDPRESTADOR: TFloatField;
    sdqDatosPA_DIAGNOSTICO: TStringField;
    sdqDatosPA_OBSERVACIONES: TStringField;
    sdqDatosPA_FECHAAUDITORIA: TDateTimeField;
    sdqDatosPA_PROXIMOCONTROL: TDateTimeField;
    sdqDatosPA_PROBABLEALTA: TDateTimeField;
    sdqDatosPA_MEDICO: TStringField;
    sdqDatosPA_AUDITOR: TFloatField;
    sdqDatosPA_IDGRAVEDAD: TFloatField;
    sdqDatosPA_IDTIPODEATENCION: TFloatField;
    sdqDatosPA_IDDIAGNOSTICO: TFloatField;
    sdqDatosPA_CALIDADPREST: TStringField;
    sdqDatosPA_ACEPTASIN: TStringField;
    sdqDatosPA_IDTIPODEEGRESO: TFloatField;
    sdqDatosPA_IMPLANTE: TStringField;
    sdqDatosPA_TIPOIMPLANTE1: TStringField;
    sdqDatosPA_TIPOIMPLANTE2: TStringField;
    sdqDatosPA_RELDIASBAJA: TStringField;
    sdqDatosPA_CAUSAACEPTA: TStringField;
    sdqDatosPA_MODELO: TStringField;
    sdqDatosPA_ESPECIFICACIONES: TStringField;
    sdqDatosPA_PROVISTA: TStringField;
    sdqDatosPA_MODELO2: TStringField;
    sdqDatosPA_ESPECIFICACIONES2: TStringField;
    sdqDatosPA_PROVISTA2: TStringField;
    sdqDatosPA_BAJAMEDICA: TDateTimeField;
    sdqDatosPA_NROPARTEEVOL: TFloatField;
    sdqDatosPA_FECHACARGA: TDateTimeField;
    sdqDatosPA_FECHARECEPCION: TDateTimeField;
    sdqDatosPA_USUALTA: TStringField;
    sdqDatosPA_FECHAALTA: TDateTimeField;
    sdqDatosPA_USUMODIF: TStringField;
    sdqDatosPA_FECHAMODIF: TDateTimeField;
    sdqDatosPA_FECHAALTASANATORIAL: TDateTimeField;
    sdqDatosFACCREC: TDateTimeField;
    sdqDatosSE_SECTOR: TStringField;
    sdqDatosEX_FECHAALTA: TDateTimeField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosEX_TIPO: TStringField;
    sdqDatosEX_FECHARECEPCION: TDateTimeField;
    fraPA_AUDITOR: TfraMAU_AUDITORES;
    Label1: TLabel;
    fraPA_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD;
    Label2: TLabel;
    sdqDatosPA_FECHAPRIMERAATENCION: TDateTimeField;
    sdqDatosPA_IDTIPOSINIESTRO: TFloatField;
    Label5: TLabel;
    gbDatos1: TJvgGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label36: TLabel;
    fraPE_IDTIPODEEGRESO: TfraTipoEgreso;
    fraPA_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraPA_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    edPA_DIAGNOSTICO: TDBMemo;
    edPA_FECHAALTASANATORIAL: TDBDateEdit;
    edPA_FECHAALTAMEDICA: TDBDateEdit;
    edPA_OBSERVACIONES: TDBMemo;
    chkPA_ACEPTASIN: TDBCheckBox;
    edPA_CAUSAACEPTA: TDBEdit;
    chkPA_ALTAMEDICA: TDBCheckBox;
    sdqDatosPA_ALTASANATORIAL: TStringField;
    sdqDatosPA_FECHAALTAMEDICA: TDateTimeField;
    sdqDatosPA_ALTAMEDICA: TStringField;
    chkPA_ALTASANATORIAL: TDBCheckBox;
    fraPA_IDTIPODEATENCION: TfraTipoAtencion;
    Label9: TLabel;
    sdqDatosPA_PRESTACIONESBRINDADAS: TStringField;
    sdqDatosPA_OBSERVACIONESMEDICOAUDITOR: TStringField;
    sdqDatosPA_IDGRAVEDAD_CIE10: TFloatField;
    gbAdicional: TJvgGroupBox;
    Label11: TLabel;
    edPA_PRESTACIONESBRINDADAS: TDBMemo;
    Label16: TLabel;
    rpPA_CHECKPREGUNTA1: TJvDBRadioPanel;
    edPA_PREGUNTA1: TDBEdit;
    Label12: TLabel;
    rpPA_CHECKPREGUNTA2: TJvDBRadioPanel;
    edPA_PREGUNTA2: TDBEdit;
    Label13: TLabel;
    edPA_OBSERVACIONESMEDICOAUDITOR: TDBMemo;
    sdqDatosPA_PREGUNTA1: TStringField;
    sdqDatosPA_PREGUNTA2: TStringField;
    sdqDatosPA_CHECKPREGUNTA1: TStringField;
    sdqDatosPA_CHECKPREGUNTA2: TStringField;
    gbArchivo: TJvgGroupBox;
    Label19: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    edPA_FECHARECEPCION: TDBDateEdit;
    edSector: TDBEdit;
    edPA_FECHAALTA: TDBDateEdit;
    gbCasosGraves: TJvgGroupBox;
    fraPA_TIPOIMPLANTE1: TfraMIM_IMPLANTES;
    fraPA_TIPOIMPLANTE2: TfraMIM_IMPLANTES;
    Label17: TLabel;
    Label18: TLabel;
    edPA_MODELO: TDBEdit;
    Label20: TLabel;
    edPA_ESPECIFICACIONES: TDBEdit;
    Label21: TLabel;
    edPA_PROVISTA: TDBEdit;
    Label22: TLabel;
    edPA_MODELO2: TDBEdit;
    Label24: TLabel;
    edPA_ESPECIFICACIONES2: TDBEdit;
    Label25: TLabel;
    edPA_PROVISTA2: TDBEdit;
    Label26: TLabel;
    pnlTrans: TJvPanel;
    chkPA_IMPLANTE: TDBCheckBox;
    Label27: TLabel;
    gbAtencion: TJvgGroupBox;
    edPA_MEDICO: TDBEdit;
    Label28: TLabel;
    rpPA_RELDIASBAJA: TJvDBRadioPanel;
    Label29: TLabel;
    rpPA_CALIDADPREST: TJvDBRadioPanel;
    Label30: TLabel;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    edPA_PROXIMOCONTROL: TDBDateEdit;
    Label31: TLabel;
    Label32: TLabel;
    edPA_PROBABLEALTA: TDBDateEdit;
    Label33: TLabel;
    edPA_BAJAMEDICA: TDBDateEdit;
    ShortCutControl: TShortCutControl;
    fraPA_IDPRESTADOR: TfraPrestadorFueraDeContrato;
    sdqDatosPA_PRESTADOR_NOMBRE: TStringField;
    sdqDatosPA_PRESTADOR_TELEFONOS: TStringField;
    sdqDatosPA_PRESTADOR_CALLE: TStringField;
    sdqDatosPA_PRESTADOR_NUMERO: TStringField;
    sdqDatosPA_PRESTADOR_PISO: TStringField;
    sdqDatosPA_PRESTADOR_DEPARTAMENTO: TStringField;
    sdqDatosPA_PRESTADOR_LOCALIDAD: TStringField;
    sdqDatosPA_PRESTADOR_CPOSTAL: TStringField;
    sdqDatosPA_PRESTADOR_CPOSTALA: TStringField;
    sdqDatosPA_PRESTADOR_PROVINCIA: TStringField;
    Label4: TLabel;
    Label23: TLabel;
    edPA_FECHAPRIMERAATENCION: TDBDateEdit;
    fraPA_IDTIPOSINIESTRO: TfraTipoSiniestro;
    procedure FSFormCreate(Sender: TObject);
    procedure Validar(DataSet: TDataSet);
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure chkPA_ACEPTASINClick(Sender: TObject);
    procedure chkPA_ALTAMEDICAClick(Sender: TObject);
    procedure chkPA_ALTASANATORIALClick(Sender: TObject);
    procedure CambioTamanio(Sender: TObject);
    procedure chkPA_IMPLANTEClick(Sender: TObject);
    procedure rpPA_CHECKPREGUNTA1Change(Sender: TObject);
    procedure rpPA_CHECKPREGUNTA2Change(Sender: TObject);
    procedure dsDatosUpdateData(Sender: TObject);
  protected
    procedure SetLocked(const Value: Boolean); override;
    function  GetAddButtonVisible: boolean; override;
  public
    procedure LoadData; override;
    function  Save: boolean; override;
    procedure Cancel(ASinPreguntar: Boolean = False); override;
    procedure Edit; override;
    procedure Print; override;
  end;

var
  frmParteAuditoria: TfrmParteAuditoria;

implementation

uses
  unArt, unDmPrincipal, CustomDlgs, DbFuncs, unSesion, unSiniestros,
  VCLExtra, AnsiSql, DateUtils, unRptParteAuditoriaGrave,
  unRptParteAuditoriaLeve, General;

{$R *.dfm}

{ TfrmParteAuditoria }
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.Cancel(ASinPreguntar: Boolean = False);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.Edit;
begin
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;
  SetLocked(False);
  VCLExtra.LockControls(fraPA_IDTIPOSINIESTRO, not fraPA_IDTIPOSINIESTRO.IsEmpty);
  VCLExtra.LockControls(edPA_CAUSAACEPTA, chkPA_ACEPTASIN.Checked);
  VCLExtra.LockControls(edPA_FECHAALTAMEDICA, not chkPA_ALTAMEDICA.Checked);
  VCLExtra.LockControls(edPA_FECHAALTASANATORIAL, not chkPA_ALTASANATORIAL.Checked);
  VCLExtra.LockControls(edPA_PREGUNTA1, rpPA_CHECKPREGUNTA1.ItemIndex = 1);
  VCLExtra.LockControls(edPA_PREGUNTA2, rpPA_CHECKPREGUNTA2.ItemIndex = 0);
  VCLExtra.LockControls(gbCasosGraves, not chkPA_IMPLANTE.Checked);
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.LoadData;
begin
  fraSDA_DETALLEARCHIVO.Clear;
  edNroOrden.Clear;
  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  if not sdqDatos.IsEmpty then
    sdqDatos.Last;

  inherited;
end;
{------------------------------------------------------------------------------}
function TfrmParteAuditoria.Save: boolean;
begin
  Result := False;

  if sdqDatos.Active then
  begin
    vPK := sdqDatos.FieldByName(sPrefix + '_ID').Value;
    if CanSaveCancel then
    begin
      fraPA_IDPRESTADOR.Change;
      sdqDatos.Post;
    end;

    with TDataCycler.Create(sdqDatos) do
    try
      repeat
        if sdqDatos.FieldByName('PA_ID').AsInteger = ART_EMPTY_ID then
        begin
          sdqDatos.Edit;
          sdqDatos.FieldByName('PA_ID').AsInteger := GetSecNextVal('SIN.SEQ_SPA_ID');
          sdqDatos.Post;
        end;
      until not Cycle;
    finally
      Free;
    end;

    Result := inherited Save;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.FSFormCreate(Sender: TObject);
begin
  inherited;
  acEliminar.Enabled := False;
  
  sPrefix := 'PA';
  sTableName := 'SIN.SPA_PARTEDEAUDITORIA';
  pnlTrans.Transparent := True;

  with fraPA_IDPRESTADOR do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'PA_IDPRESTADOR';
    PrefijoTabla := 'PA_';
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.Validar(DataSet: TDataSet);
var
  dFecha, dFechaTope: TDateTime;
  sSQL: string;
begin
  inherited;
  sdqDatos.FieldByName('PA_USUMODIF').AsString := Sesion.UserID;
  dFechaTope := dHoy + DaysInAYear(YearOf(dHoy));
  
  Verificar(edPA_FECHAAUDITORIA.Date = 0, edPA_FECHAAUDITORIA, Msg_42);
  Verificar(edPA_FECHAAUDITORIA.Date > dHoy, edPA_FECHAAUDITORIA, Format(Msg_43, [DateToStr(dHoy)]));
  Verificar(edPA_FECHAAUDITORIA.Date < FechaAccidenteRecaida, edPA_FECHAAUDITORIA, Format(Msg_44, [DateToStr(FechaAccidenteRecaida)]));
  Verificar(fraPA_AUDITOR.IsEmpty, fraPA_AUDITOR.edCodigo, Msg_51);

  Verificar(fraPA_IDPRESTADOR.IsEmpty, fraPA_IDPRESTADOR.edCA_IDENTIFICADOR, Msg_16);

  Verificar(fraPA_IDGRAVEDAD_CIE10.IsEmpty and fraPA_IDDIAGNOSTICO.IsSelected, fraPA_IDGRAVEDAD_CIE10.edCodigo, Msg_01);
  Verificar(fraPA_IDTIPODEATENCION.IsEmpty, fraPA_IDTIPODEATENCION.edCodigo, Msg_23);

  Verificar((edPA_BAJAMEDICA.Date > 0) and (edPA_BAJAMEDICA.Date > dHoy), edPA_BAJAMEDICA, Format(Msg_11, ['baja médica', DateToStr(dHoy)]));
  Verificar((edPA_BAJAMEDICA.Date > 0) and (edPA_BAJAMEDICA.Date < FechaAccidenteRecaida), edPA_BAJAMEDICA, Format(Msg_12, [DateToStr(FechaAccidenteRecaida)]));
//  Verificar((edPA_BAJAMEDICA.Date > 0) and (edPA_BAJAMEDICA.Date > FechaAltaDocumento), edPA_BAJAMEDICA, Format(Msg_13, [DateToStr(FechaAltaDocumento)]));
  Verificar((edPA_BAJAMEDICA.Date > 0) and (edPA_FECHARECEPCION.Date < edPA_BAJAMEDICA.Date), edPA_FECHARECEPCION, Format(Msg_14, ['baja médica', DateToStr(edPA_BAJAMEDICA.Date)]));

  dFecha := Obtener_MinFechaLiquidacionILT(IdExpediente);
  Verificar((dFecha > 0) and (edPA_BAJAMEDICA.Date > dFecha), edPA_BAJAMEDICA, Format(Msg_17, [DateToStr(dFecha)]));

  if Recaida > 0 then
  begin
    sSQL := 'SELECT 1 ' +
              'FROM SEX_EXPEDIENTES ' +
             'WHERE EX_SINIESTRO = :SIN ' +
               'AND EX_ORDEN = :ORD ' +
               'AND EX_RECAIDA < :REC ' +
               'AND EX_ALTAMEDICA IS NULL';
    if ExisteSQLEx(sSQL, [Siniestro, Orden, Recaida]) then
      MsgBox(Msg_18, MB_ICONEXCLAMATION + MB_OK, 'Información');

    sSQL := 'SELECT MAX(EX_ALTAMEDICA) ' +
              'FROM SEX_EXPEDIENTES ' +
             'WHERE EX_SINIESTRO = :SIN ' +
               'AND EX_ORDEN = :ORD ' +
               'AND EX_RECAIDA < :REC ' +
               'AND EX_INTERCURRENCIA <> ''S'' ';
    dFecha := ValorSQLDateTimeEx(sSQL, [Siniestro, Orden, Recaida]);
    Verificar((dFecha > 0) and (edPA_BAJAMEDICA.Date <> 0) and (edPA_BAJAMEDICA.Date < dFecha), edPA_BAJAMEDICA, Format(Msg_19, [DateToStr(dFecha)]));
  end;

  Verificar((edPA_FECHAALTAMEDICA.Date > 0) and (edPA_FECHAALTAMEDICA.Date > dHoy), edPA_FECHAALTAMEDICA, Format(Msg_29, [DateToStr(dHoy)]));
  Verificar((edPA_FECHAALTAMEDICA.Date > 0) and (edPA_FECHAALTAMEDICA.Date < FechaBajaMedica), edPA_FECHAALTAMEDICA, Format(Msg_30, [DateToStr(FechaBajaMedica)]));
  Verificar((edPA_FECHAALTAMEDICA.Date > 0) and (edPA_FECHAALTAMEDICA.Date < FechaAccidenteRecaida), edPA_FECHAALTAMEDICA, Format(Msg_30, [DateToStr(FechaAccidenteRecaida)]));

  dFecha := Obtener_MaxFechaLiquidacionILT(Siniestro, Orden, Recaida);
  Verificar((dFecha > 0) and (edPA_FECHAALTAMEDICA.Date <> 0) and (edPA_FECHAALTAMEDICA.Date < dFecha),
             edPA_FECHAALTAMEDICA, Format(Msg_31, [DateToStr(dFecha)]));

  Verificar((edPA_PROBABLEALTA.Date <> 0) and (edPA_PROBABLEALTA.Date > dFechaTope), edPA_PROBABLEALTA, Format(Msg_48, [DateToStr(dHoy)]));
  Verificar((edPA_PROBABLEALTA.Date <> 0) and (edPA_PROBABLEALTA.Date < FechaAccidenteRecaida), edPA_PROBABLEALTA, Format(Msg_49, [DateToStr(FechaAccidenteRecaida)]));
  Verificar((edPA_PROBABLEALTA.Date <> 0) and (edPA_PROBABLEALTA.Date <= edPA_FECHAAUDITORIA.Date), edPA_PROBABLEALTA, Format(Msg_50, [DateToStr(edPA_FECHAAUDITORIA.Date)]));

  Verificar((edPA_PROXIMOCONTROL.Date <> 0) and (edPA_PROXIMOCONTROL.Date > dFechaTope), edPA_PROXIMOCONTROL, Format(Msg_45, [DateToStr(dHoy)]));
  Verificar((edPA_PROXIMOCONTROL.Date <> 0) and (edPA_PROXIMOCONTROL.Date < FechaAccidenteRecaida), edPA_PROXIMOCONTROL, Format(Msg_46, [DateToStr(FechaAccidenteRecaida)]));
  Verificar((edPA_PROXIMOCONTROL.Date <> 0) and (edPA_PROXIMOCONTROL.Date <= edPA_FECHAAUDITORIA.Date), edPA_PROXIMOCONTROL, Format(Msg_47, [DateToStr(edPA_FECHAAUDITORIA.Date)]));

  Verificar((rpPA_CHECKPREGUNTA1.ItemIndex = 0) and (Trim(edPA_PREGUNTA1.Text) = ''), edPA_PREGUNTA1, Msg_67);
  Verificar((rpPA_CHECKPREGUNTA2.ItemIndex = 1) and (Trim(edPA_PREGUNTA2.Text) = ''), edPA_PREGUNTA2, Msg_68);  

  Verificar(edPA_FECHARECEPCION.Date = 0, edPA_FECHARECEPCION, Msg_03);
  Verificar(edPA_FECHARECEPCION.Date > dHoy, edPA_FECHARECEPCION, Format(Msg_04, [DateToStr(dHoy)]));
  Verificar(edPA_FECHARECEPCION.Date < edPA_FECHAALTAMEDICA.Date, edPA_FECHARECEPCION, Format(Msg_24, [DateToStr(edPA_FECHAALTAMEDICA.Date)]));
  Verificar((FechaRecepcion = 0) and (edPA_FECHARECEPCION.Date > FechaAlta), edPA_FECHARECEPCION, Format(Msg_05, [DateToStr(FechaAlta)]));
  Verificar(edPA_FECHARECEPCION.Date < FechaAccidenteRecaida, edPA_FECHARECEPCION, Format(Msg_06, [DateToStr(FechaAccidenteRecaida)]));
  Verificar((sdqDatos.State = dsEdit) and (edPA_FECHARECEPCION.Date > sdqDatosPA_FECHAALTA.AsDateTime), edPA_FECHARECEPCION, Format(Msg_07, [sdqDatosPA_FECHAALTA.AsString]));
  fraSDA_DETALLEARCHIVO.Validate;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.sdqDatosNewRecord(DataSet: TDataSet);
{
var
  sSQL: string;
}
begin
  with DataSet do
  begin
    FieldByName('PA_ID').AsInteger := ART_EMPTY_ID;
    FieldByName('PA_IDEXPEDIENTE').AsInteger := FIdExpediente;
    FieldByName('PA_NROPARTE').AsInteger := iNewParte;
    FieldByName('PA_USUALTA').AsString := Sesion.UserID;
    FieldByName('PA_FECHAALTA').AsDateTime := dHoy;

    FieldByName('PA_ALTAMEDICA').AsString := 'N';
    FieldByName('PA_ALTASANATORIAL').AsString := 'N';
    FieldByName('PA_ACEPTASIN').AsString := 'S';
    FieldByName('PA_IMPLANTE').AsString := 'N';
    FieldByName('PA_CHECKPREGUNTA1').AsString := 'N';
    FieldByName('PA_CHECKPREGUNTA2').AsString := 'S';
    FieldByName('PA_RELDIASBAJA').AsString := '?';
    FieldByName('PA_CALIDADPREST').AsString := '?';
    FieldByName('PA_IDTIPOSINIESTRO').AsInteger := IdTipoAccidente;
    VCLExtra.LockControls(fraPA_IDTIPOSINIESTRO, not fraPA_IDTIPOSINIESTRO.IsEmpty);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.chkPA_ACEPTASINClick(Sender: TObject);
begin
  if CanSaveCancel then
  begin
    VCLExtra.LockControls(edPA_CAUSAACEPTA, chkPA_ACEPTASIN.Checked);
    if edPA_CAUSAACEPTA.CanFocus then
      edPA_CAUSAACEPTA.SetFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.chkPA_ALTAMEDICAClick(Sender: TObject);
begin
  if CanSaveCancel then
  begin
    VCLExtra.LockControls(edPA_FECHAALTAMEDICA, not chkPA_ALTAMEDICA.Checked);
    if edPA_FECHAALTAMEDICA.CanFocus then
      edPA_FECHAALTAMEDICA.SetFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.chkPA_ALTASANATORIALClick(Sender: TObject);
begin
  if CanSaveCancel then
  begin
    VCLExtra.LockControls(edPA_FECHAALTASANATORIAL, not chkPA_ALTASANATORIAL.Checked);
    if edPA_FECHAALTASANATORIAL.CanFocus then
      edPA_FECHAALTASANATORIAL.SetFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.CambioTamanio(Sender: TObject);
begin
  pnlTrans.Visible := False;
  inherited;
  pnlTrans.Visible := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.SetLocked(const Value: Boolean);
begin
  inherited SetLocked(Value);
  pnlTrans.Enabled := not Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.chkPA_IMPLANTEClick(Sender: TObject);
begin
  if CanSaveCancel then
  begin
    VCLExtra.LockControls(gbCasosGraves, not chkPA_IMPLANTE.Checked);
    if fraPA_TIPOIMPLANTE1.edCodigo.CanFocus then
      fraPA_TIPOIMPLANTE1.edCodigo.SetFocus;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.rpPA_CHECKPREGUNTA1Change(Sender: TObject);
begin
  if CanSaveCancel then
  begin
    VCLExtra.LockControls(edPA_PREGUNTA1, rpPA_CHECKPREGUNTA1.ItemIndex = 1);
    if edPA_PREGUNTA1.CanFocus then edPA_PREGUNTA1.SetFocus;
    if rpPA_CHECKPREGUNTA1.ItemIndex = 1 then edPA_PREGUNTA1.Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.rpPA_CHECKPREGUNTA2Change(Sender: TObject);
begin
  if CanSaveCancel then
  begin
    VCLExtra.LockControls(edPA_PREGUNTA2, rpPA_CHECKPREGUNTA2.ItemIndex = 0);
    if edPA_PREGUNTA2.CanFocus then edPA_PREGUNTA2.SetFocus;
    if rpPA_CHECKPREGUNTA2.ItemIndex = 0 then edPA_PREGUNTA2.Clear;    
  end;
end;
{------------------------------------------------------------------------------}
function TfrmParteAuditoria.GetAddButtonVisible: boolean;
begin
  Result := inherited GetAddButtonVisible;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.dsDatosUpdateData(Sender: TObject);
begin
  inherited;
  with sdqDatos do
  begin
    FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
    FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteAuditoria.Print;
begin
  if AreIn(sdqDatosPA_IDGRAVEDAD.AsString, ['4', '5']) then
    with TrptParteAuditoriaGrave.Create(Self) do
    try
       ImprimirGrave(Self.sdqDatosPA_ID.AsInteger, Siniestro, Orden, Recaida);
    finally
      Free;
    end
  else
    with TrptParteAuditoriaLeve.Create(Self) do
    try
       ImprimirLeve(Self.sdqDatosPA_ID.AsInteger, Siniestro, Orden, Recaida);
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
end.
