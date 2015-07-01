unit unParteIngreso;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unSinForm, SDEngine, DB,
  unFraSDA_DETALLEARCHIVO, DateTimeEditors, PatternEdit, DBPatternEdit, DBCtrls, unFraStaticCTB_TABLAS,
  unFraStaticCodigoDescripcion, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unfraCPR_PRESTADOR, StdCtrls, Mask,
  DateComboBox, ExtCtrls, RXDBCtrl, unFraSLZ_LESIONZONA, unFraSLN_LESIONNATURALEZA, unFraSLA_LESIONAGENTE,
  unFraSLF_LESIONFORMA, unFraSTG_TIPOGRAVEDAD, unFraSTC_TIPOGRAVEDAD_CIE10, unFraStaticCodDesc, unFraCDG_DIAGNOSTICO,
  unFraSMC_MOTIVONOCARGA, JvExExtCtrls, JvComponent, JvDBRadioPanel, artSeguridad, XPMenu, JvgGroupBox,
  unFraTipoSiniestro, IntEdit, QuickRpt, unFraPrestadorFueraDeContrato, JvExMask, JvToolEdit, JvMaskEdit, JvDBControls,
  EditNew, ActnList, unFraSLM_LESIONAGENTEMATERIAL, RxToolEdit, JvExtComponent,
  RxPlacemnt;

type                                               
  TfrmParteIngreso = class(TSinForm)
    sdqDatosPI_DIAGNOSTICO: TStringField;
    sdqDatosPI_IDDIAGNOSTICO: TFloatField;
    sdqDatosPI_IDLESIONFORMA: TFloatField;
    sdqDatosPI_IDLESIONAGENTE: TFloatField;
    sdqDatosPI_PRESUPINCAPACIDAD: TStringField;
    sdqDatosPI_TRATAMINSTITUCION: TStringField;
    sdqDatosPI_TRATAMUBICACION: TStringField;
    sdqDatosPI_INTERNINSTITUCION: TStringField;
    sdqDatosPI_INTERNUBICACION: TStringField;
    sdqDatosPI_FECHABAJAMEDICA: TDateTimeField;
    sdqDatosPI_DIASBAJAPREVISTOS: TFloatField;
    sdqDatosPI_FECHARECONSULTA: TDateTimeField;
    sdqDatosPI_HISTORIACLINICA: TStringField;
    sdqDatosPI_MEDICO: TStringField;
    sdqDatosPI_FECHARECEPCION: TDateTimeField;
    sdqDatosPI_USUALTA: TStringField;
    sdqDatosPI_FECHAALTA: TDateTimeField;
    sdqDatosPI_USUMODIF: TStringField;
    sdqDatosPI_FECHAMODIF: TDateTimeField;
    sdqDatosPI_PROTESIS: TStringField;
    sdqDatosPI_IDLESIONZONA: TFloatField;
    sdqDatosPI_ID: TFloatField;
    sdqDatosPI_IDEXPEDIENTE: TFloatField;
    sdqDatosPI_IDPRESTADOR: TFloatField;
    sdqDatosPI_EPMANIFESTACION: TDateTimeField;
    sdqDatosPI_EPEXPUESTODESDE: TDateTimeField;
    sdqDatosPI_IDLESIONNATURALEZA: TFloatField;
    sdqDatosPI_OBSERVACIONES: TStringField;
    sdqDatosEX_FECHAALTA: TDateTimeField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosEX_TIPO: TStringField;
    sdqDatosEX_FECHARECEPCION: TDateTimeField;
    sdqDatosFACCREC: TDateTimeField;
    gbPrestador: TJvgGroupBox;
    fraPI_IDPRESTADOR: TfraPrestadorFueraDeContrato;
    gbDatos1: TJvgGroupBox;
    Label18: TLabel;
    fraTipoSiniestro: TfraTipoSiniestro;
    sdqDatosPI_TIPO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fraPI_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraPI_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    edPI_DIAGNOSTICO: TDBMemo;
    Label17: TLabel;
    edPI_EPMANIFESTACION: TDBDateEdit;
    Label16: TLabel;
    rpPI_PRESUPINCAPACIDAD: TJvDBRadioPanel;
    Label26: TLabel;
    rpPI_RECALIFICACION: TJvDBRadioPanel;
    Label28: TLabel;
    Label29: TLabel;
    rpPI_COINCIDE_MECANISMO_ACC: TJvDBRadioPanel;
    gbLesion: TJvgGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    fraPI_IDLESIONFORMA: TfraSLF_LESIONFORMA;
    fraPI_IDLESIONAGENTE: TfraSLA_LESIONAGENTE;
    fraPI_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;
    fraPI_IDLESIONZONA: TfraSLZ_LESIONZONA;
    fraPI_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA;
    fraPI_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD;
    sdqDatosPI_PORCENTAJEINCAPACIDAD: TFloatField;
    sdqDatosPI_COINCIDE_MECANISMO_ACC: TStringField;
    sdqDatosPI_RECALIFICACION: TStringField;
    gbArchivo: TJvgGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    edPI_FECHARECEPCION: TDBDateEdit;
    edSector: TDBEdit;
    edPI_FECHAALTA: TDBDateEdit;
    gbTratamiento: TJvgGroupBox;
    lbTratamiento: TLabel;
    edPI_TRATAMINSTITUCION: TDBEdit;
    edPI_TRATAMUBICACION: TDBEdit;
    Label22: TLabel;
    lbInternado: TLabel;
    edPI_INTERNINSTITUCION: TDBEdit;
    edPI_INTERNUBICACION: TDBEdit;
    Label24: TLabel;
    Label13: TLabel;
    Label25: TLabel;
    Label12: TLabel;
    edPI_DIASBAJAPREVISTOS: TDBPatternEdit;
    edPI_FECHABAJAMEDICA: TDBDateEdit;
    edPI_FECHARECONSULTA: TDBDateEdit;
    Label20: TLabel;
    Label10: TLabel;
    edPI_HISTORIACLINICA: TDBEdit;
    edPI_MEDICO: TDBEdit;
    Label36: TLabel;
    edPI_OBSERVACIONES: TDBMemo;
    chkPI_PROTESIS: TDBCheckBox;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    sdqDatosPI_PRESTADOR_NOMBRE: TStringField;
    sdqDatosPI_PRESTADOR_TELEFONOS: TStringField;
    sdqDatosPI_PRESTADOR_CALLE: TStringField;
    sdqDatosPI_PRESTADOR_NUMERO: TStringField;
    sdqDatosPI_PRESTADOR_PISO: TStringField;
    sdqDatosPI_PRESTADOR_DEPARTAMENTO: TStringField;
    sdqDatosPI_PRESTADOR_LOCALIDAD: TStringField;
    sdqDatosPI_PRESTADOR_CPOSTAL: TStringField;
    sdqDatosPI_PRESTADOR_CPOSTALA: TStringField;
    sdqDatosPI_PRESTADOR_PROVINCIA: TStringField;
    edPI_PORCENTAJEINCAPACIDAD: TDBPatternEdit;
    sdqDatosPI_FECHABAJAPRESTADOR: TDateTimeField;
    Label4: TLabel;
    edPI_FECHABAJAPRESTADOR: TDBDateEdit;
    chkGENERAR_EVOLUTIVO: TDBCheckBox;
    sdqDatosGENERAR_EVOLUTIVO: TStringField;
    fraPI_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL;
    Label7: TLabel;
    sdqDatosPI_IDLESIONAGENTEMATERIAL: TFloatField;
    sdqDatosEX_ALTAMEDICA: TDateTimeField;
    procedure FSFormCreate(Sender: TObject);
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure Validar(DataSet: TDataSet); //Este método es el sdqDatosBeforePost
    procedure edPI_TRATAMINSTITUCIONChange(Sender: TObject);
    procedure edPI_INTERNINSTITUCIONChange(Sender: TObject);
    procedure dsDatosUpdateData(Sender: TObject);
    procedure dsDatosStateChange(Sender: TObject);
    procedure edPI_FECHABAJAPRESTADORChange(Sender: TObject);
  private
    procedure Bajas(AValue: Boolean);
  public
    function  Save: boolean; override;

    procedure Cancel(ASinPreguntar: Boolean = False); override;
    procedure Edit; override;
    procedure LoadData; override;
    procedure Print; override;
  end;

var
  frmParteIngreso: TfrmParteIngreso;

implementation

uses
  unArt, unDmPrincipal, CustomDlgs, DbFuncs, unSesion, unSiniestros, VCLExtra, AnsiSql, unComunes, unMoldeEnvioMail,
  unRptParteIngreso;

{$R *.dfm}

{ TfrmParteIngreso }

procedure TfrmParteIngreso.Cancel(ASinPreguntar: Boolean = False);
begin
  inherited;
end;

procedure TfrmParteIngreso.Edit;
begin
  if not Inserting then
    Bajas(True);
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;
  VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);
end;

function TfrmParteIngreso.Save: boolean;
var IdExpRelacionado, SiniPluriemp:string;
begin
  IdExpRelacionado := '';
  SiniPluriemp     := '';
  if sdqDatos.FieldByName('GENERAR_EVOLUTIVO').AsString = 'S' then
    if not MsgAsk('Esta a punto de generar un parte evolutivo con la información de este parte de ingreso.' + CRLF + '¿Desea continuar?') then
      Abort;

  Result := False;
  if sdqDatos.Active then
  begin
    if sdqDatos.State in [dsInsert, dsEdit] then
    begin
      fraPI_IDPRESTADOR.Change;
      sdqDatos.Post;
    end;

    with TDataCycler.Create(sdqDatos) do
      try
        repeat
          if sdqDatos.FieldByName('PI_ID').AsInteger = ART_EMPTY_ID Then
          begin
            sdqDatos.Edit;
            sdqDatos.FieldByName('PI_ID').AsInteger := GetSecNextVal('SIN.SEQ_SPI_ID');
            sdqDatos.Post;
          end;
        until not Cycle;
      finally
        Free;
      end;

    Result := inherited Save;

    IdExpRelacionado := Get_ExpedPluriempleo(sdqDatosPI_IDEXPEDIENTE.AsString);
    if IdExpRelacionado <> '' then  // Lu WF 8139
    begin
      SiniPluriemp := ValorSQLEx('SELECT ART.SINIESTRO.get_siniestrocompleto(:IdExp) FROM DUAL', [IdExpRelacionado]);
      MsgBox('El Siniestro posee Pluriempleo. Se enviara un mail al Sector responsable.', MB_ICONINFORMATION + MB_OK);
      DoGenerarAvisoPluriempleo(IntToStr(Siniestro), IntToStr(Orden), IntToStr(Recaida), PL_PINGRESO, SiniPluriemp);  // TK 9505 se agrego Orden y Recaida
    end;

    // TK 43664
    Do_CopiarFechaBajaMedica(sdqDatos.FieldByName('PI_ID').AsInteger, idExpediente, sdqDatos.FieldByName('PI_FECHABAJAMEDICA').AsDateTime,
                             sdqDatos.FieldByName('PI_FECHARECEPCION').AsDateTime, sdqDatos.FieldByName('EX_ALTAMEDICA').AsDateTime);

    LoadData;
  end;
end;

procedure TfrmParteIngreso.FSFormCreate(Sender: TObject);
begin
  inherited;
  
  with fraPI_IDPRESTADOR do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'PI_IDPRESTADOR';
    PrefijoTabla := 'PI_';
  end;

  Bajas(True);  
end;

procedure TfrmParteIngreso.LoadData;
begin
  fraSDA_DETALLEARCHIVO.Clear;
  fraPI_IDLESIONNATURALEZA.ClearGrid;

  if TipoAccidente = TA_ENFERMEDAD then
    fraPI_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' AND LN_CODIGO IN (''17'', ''18'', ''21'', ''99'') '
  else
    fraPI_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' ';

  Bajas(True);
  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  if not sdqDatos.IsEmpty then
    sdqDatos.Last;

  if sdqDatos.RecordCount > 1 then
    InfoHint(edPI_DIAGNOSTICO, 'La consulta devolvió mas de un parte de ingreso. Si este dato no es correcto consulte a sistemas.');
end;

procedure TfrmParteIngreso.Bajas(AValue: Boolean);
begin
  fraPI_IDLESIONFORMA.ShowBajas      := AValue;
  fraPI_IDLESIONAGENTE.ShowBajas     := AValue;
  fraPI_IDLESIONNATURALEZA.ShowBajas := AValue;
  fraPI_IDLESIONZONA.ShowBajas       := AValue;
end;

procedure TfrmParteIngreso.sdqDatosNewRecord(DataSet: TDataSet);
var
  sSQL: string;
begin
  with DataSet do
  begin
    Bajas(False);

    FieldByName('PI_ID').AsInteger := ART_EMPTY_ID;
    FieldByName('PI_IDEXPEDIENTE').AsInteger := FIdExpediente;
    FieldByName('PI_USUALTA').AsString := Sesion.UserID;
    FieldByName('PI_FECHAALTA').AsDateTime := dHoy;

    FieldByName('PI_TIPO').AsString := TipoAccidente;
    FieldByName('PI_PROTESIS').AsString := 'N';
    FieldByName('PI_PRESUPINCAPACIDAD').AsString := '?';
    FieldByName('PI_RECALIFICACION').AsString := '?';
    FieldByName('PI_COINCIDE_MECANISMO_ACC').AsString := '?';

    VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);

    sSQL := 'SELECT PE_DIAGNOSTICO, PE_IDDIAGNOSTICO, PE_FECHABAJAMEDICA, PE_IDGRAVEDAD_CIE10 ' +
              'FROM SIN.SPE_PARTEDEEGRESO ' +
             'WHERE PE_IDEXPEDIENTE = :ID';

    with GetQueryEx(sSQL, [FIdExpediente]) do
    try
      if not IsEmpty then
      begin
        sdqDatos.FieldByName('PI_DIAGNOSTICO').AsString := FieldByName('PE_DIAGNOSTICO').AsString;
        sdqDatos.FieldByName('PI_IDDIAGNOSTICO').Value := FieldByName('PE_IDDIAGNOSTICO').Value;
     //   sdqDatos.FieldByName('PI_FECHABAJAMEDICA').AsDateTime := FieldByName('PE_FECHABAJAMEDICA').AsDateTime;      // por TK 43664 porque ahora si la fecha de baja medica es nula, se le pone la de recepción si o si.
        sdqDatos.FieldByName('PI_IDGRAVEDAD_CIE10').Value := FieldByName('PE_IDGRAVEDAD_CIE10').Value;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmParteIngreso.Validar(DataSet: TDataSet);
{
const
  Msg_01 = 'Debe indicar la gravedad si selecciona un diagnóstico.';
NOMsg_02 = 'Debe completar la descripción del hecho.';
  Msg_03 = 'La fecha de recepción es obligatoria.';
  Msg_04 = 'La fecha de recepción no puede ser posterior a la de hoy %s.';
  Msg_05 = 'La fecha de recepción no puede ser posterior a la fecha de carga del siniestro, para el primer parte ingresado %s.';
  Msg_06 = 'La fecha de recepción no puede ser anterior a la fecha del accidente/recaída %s.';
  Msg_07 = 'La fecha de recepción no puede ser posterior a la de alta %s del parte.';
NOMsg_08 = 'La fecha de antigüedad en el puesto no puede ser posterior a la de hoy %s.';
NOMsg_09 = 'La fecha de antigüedad en el puesto no puede ser posterior a la del accidente %s.';
NOMsg_10 = 'La cantidad de meses en el puesto es incorrecta.';
  Msg_11 = 'La fecha de baja médica no puede ser posterior a la de hoy %s.';
  Msg_12 = 'La fecha de baja médica no puede ser anterior a la fecha del accidente/recaída %s.';
  Msg_13 = 'La fecha de baja médica no puede ser posterior a la de alta del documento %s.';
  Msg_14 = 'La fecha de recepción no puede ser anterior a la fecha de baja médica %s.';
  Msg_16 = 'Debe indicar el prestador.';
  Msg_17 = 'La fecha de baja médica no puede ser mayor que la mínima fecha desde de liquidación de ILT (menos los días de franquicia) %s.';
  Msg_18 = 'Recuerde que falta cargar la fecha de alta médica de al menos una de las recaídas anteriores.';
  Msg_19 = 'La fecha de baja médica es menor que la fecha de alta médica de una recaída anterior %s.';
  Msg_20 = 'La fecha reconsulta no puede ser menor que la fecha de baja médica %s.';
  Msg_21 = 'La fecha de baja médica es obligatoria.';  
}
var
  dFecha: TDateTime;
  sSQL: string;
begin
//  IniciarEspera('Validando...');
  try
    sdqDatos.FieldByName('PI_USUMODIF').AsString := Sesion.UserID;

    inherited;
    Verificar(fraPI_IDPRESTADOR.IsEmpty, fraPI_IDPRESTADOR.edCA_IDENTIFICADOR, Msg_16);
    Verificar(fraPI_IDGRAVEDAD_CIE10.IsEmpty and fraPI_IDDIAGNOSTICO.IsSelected, fraPI_IDGRAVEDAD_CIE10.edCodigo, Msg_01);
    Verificar(edPI_FECHARECEPCION.Date = 0, edPI_FECHARECEPCION, Msg_03);
    Verificar(edPI_FECHARECEPCION.Date > dHoy, edPI_FECHARECEPCION, Format(Msg_04, [DateToStr(dHoy)]));
    Verificar(edPI_FECHARECEPCION.Date < FechaAccidenteRecaida, edPI_FECHARECEPCION, Format(Msg_06, [DateToStr(FechaAccidenteRecaida)]));
    Verificar((sdqDatos.State = dsEdit) and (edPI_FECHARECEPCION.Date > sdqDatosPI_FECHAALTA.AsDateTime), edPI_FECHARECEPCION, Format(Msg_07, [sdqDatosPI_FECHAALTA.AsString]));
    Verificar((FechaRecepcion = 0) and (edPI_FECHARECEPCION.Date > FechaAlta), edPI_FECHARECEPCION, Format(Msg_05, [DateToStr(FechaAlta)]));
    Verificar(edPI_PORCENTAJEINCAPACIDAD.Field.AsInteger > 100, edPI_PORCENTAJEINCAPACIDAD, Msg_61); 
  //  Verificar((edPI_FECHABAJAMEDICA.Date = 0), edPI_FECHABAJAMEDICA, Msg_21);   // Por Ticket 43664 - no valida ya que si la fecha de baja medica queda en blanco se le pone la Fecha de Recepcion
    Verificar((edPI_FECHABAJAMEDICA.Date <> 0) and (edPI_FECHABAJAMEDICA.Date > dHoy), edPI_FECHABAJAMEDICA, Format(Msg_11, ['baja médica', DateToStr(dHoy)]));
    Verificar((edPI_FECHABAJAPRESTADOR.Date <> 0) and (edPI_FECHABAJAPRESTADOR.Date > dHoy), edPI_FECHABAJAPRESTADOR, Format(Msg_11, ['baja en el prestador', DateToStr(dHoy)]));
    Verificar((edPI_FECHABAJAMEDICA.Date <> 0) and (edPI_FECHABAJAMEDICA.Date < FechaAccidenteRecaida), edPI_FECHABAJAMEDICA, Format(Msg_12, [DateToStr(FechaAccidenteRecaida)]));
//    Verificar((edPI_FECHABAJAMEDICA.Date <> 0) and (edPI_FECHABAJAMEDICA.Date > FechaAltaDocumento), edPI_FECHABAJAMEDICA, Format(Msg_13, [DateToStr(FechaAltaDocumento)]));
    Verificar((edPI_FECHABAJAMEDICA.Date <> 0) and (edPI_FECHARECEPCION.Date < edPI_FECHABAJAMEDICA.Date), edPI_FECHARECEPCION, Format(Msg_14, ['baja médica', DateToStr(edPI_FECHABAJAMEDICA.Date)]));
    Verificar((edPI_FECHABAJAPRESTADOR.Date <> 0) and (edPI_FECHARECEPCION.Date < edPI_FECHABAJAPRESTADOR.Date), edPI_FECHARECEPCION, Format(Msg_14, ['baja en el prestador', DateToStr(edPI_FECHABAJAPRESTADOR.Date)]));

    dFecha := Obtener_MinFechaLiquidacionILT(IdExpediente);
    Verificar((dFecha > 0) and (edPI_FECHABAJAMEDICA.Date > dFecha), edPI_FECHABAJAMEDICA, Format(Msg_17, [DateToStr(dFecha)]));

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
      dFecha := ValorSQLDateTimeEx(sSQL, [Siniestro, Orden, Recaida]);                                ;
      Verificar((dFecha > 0) and (edPI_FECHABAJAMEDICA.Date < dFecha), edPI_FECHABAJAMEDICA, Format(Msg_19, [DateToStr(dFecha)]));
    end;

    sSQL := 'SELECT PE_FECHAALTAMEDICA ' +
              'FROM SIN.SPE_PARTEDEEGRESO ' +
             'WHERE PE_IDEXPEDIENTE = :ID ' +
               'AND PE_AUTOMATICO <> ''S'' ';               
    dFecha := ValorSQLDateTimeEx(sSQL, [IDExpediente]);                                ;
    Verificar((dFecha > 0) and (edPI_FECHABAJAMEDICA.Date > dFecha), edPI_FECHABAJAMEDICA, Format(Msg_72, [DateToStr(dFecha)]));

    Verificar(fraPI_IDLESIONAGENTE.IsSelected and fraPI_IDLESIONAGENTE.IsBaja, fraPI_IDLESIONAGENTE.edCodigo, Format(Msg_73, ['un agente']));
    Verificar(fraPI_IDLESIONFORMA.IsSelected and fraPI_IDLESIONFORMA.IsBaja, fraPI_IDLESIONFORMA.edCodigo, Format(Msg_73, ['una forma']));
    Verificar(fraPI_IDLESIONNATURALEZA.IsSelected and fraPI_IDLESIONNATURALEZA.IsBaja, fraPI_IDLESIONNATURALEZA.edCodigo, Format(Msg_73, ['una naturaleza']));
    Verificar(fraPI_IDLESIONZONA.IsSelected and fraPI_IDLESIONZONA.IsBaja, fraPI_IDLESIONZONA.edCodigo, Format(Msg_73, ['una zona']));
    Verificar(fraPI_IDLESIONAGENTEMATERIAL.IsSelected and (fraPI_IDLESIONAGENTEMATERIAL.IsSubTitulo or fraPI_IDLESIONAGENTEMATERIAL.IsTitulo), fraPI_IDLESIONAGENTEMATERIAL.edCodigo, Format(Msg_74, ['un agente']));
    Verificar(fraPI_IDLESIONFORMA.IsSelected and fraPI_IDLESIONFORMA.IsSubTitulo, fraPI_IDLESIONFORMA.edCodigo, Format(Msg_74, ['una forma']));

    Verificar((edPI_FECHARECONSULTA.Date <> 0) and (edPI_FECHARECONSULTA.Date < edPI_FECHABAJAMEDICA.Date), edPI_FECHARECONSULTA, Format(Msg_20, ['baja médica', DateToStr(edPI_FECHABAJAMEDICA.Date)]));
    Verificar((edPI_FECHARECONSULTA.Date <> 0) and (edPI_FECHABAJAPRESTADOR.Date <> 0) and (edPI_FECHARECONSULTA.Date < edPI_FECHABAJAPRESTADOR.Date), edPI_FECHARECONSULTA, Format(Msg_20, ['baja en el prestador', DateToStr(edPI_FECHABAJAPRESTADOR.Date)]));
    Verificar((edPI_FECHABAJAPRESTADOR.Date <> 0) and (edPI_FECHABAJAPRESTADOR.Date < edPI_FECHABAJAMEDICA.Date), edPI_FECHABAJAPRESTADOR, Format(Msg_66, [DateToStr(edPI_FECHABAJAMEDICA.Date)]));
    fraSDA_DETALLEARCHIVO.Validate;
  finally
//    DetenerEspera;
  end;
end;

procedure TfrmParteIngreso.edPI_TRATAMINSTITUCIONChange(Sender: TObject);
begin
  AdjustControlFontColor(Trim(edPI_TRATAMINSTITUCION.Text) = '', lbTratamiento, clBlack, clNavy);
end;

procedure TfrmParteIngreso.edPI_INTERNINSTITUCIONChange(Sender: TObject);
var
  bGenerarEvolutivo: Boolean;
begin
  bGenerarEvolutivo := Trim(edPI_INTERNINSTITUCION.Text) > '';
  AdjustControlFontColor(not bGenerarEvolutivo, lbInternado, clBlack, clNavy);
  AdjustControlFontColor(not bGenerarEvolutivo, chkGENERAR_EVOLUTIVO, clBlack, clNavy);
  chkGENERAR_EVOLUTIVO.Enabled := CanSaveCancel and not bGenerarEvolutivo;

  if bGenerarEvolutivo then
    chkGENERAR_EVOLUTIVO.Checked := True;
end;

procedure TfrmParteIngreso.dsDatosUpdateData(Sender: TObject);
begin
  inherited;
  with sdqDatos do
  begin
    FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
    FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;
  end;
end;

procedure TfrmParteIngreso.dsDatosStateChange(Sender: TObject);
begin
  inherited;
  rpPI_PRESUPINCAPACIDAD.TabStop := False;
  edPI_PORCENTAJEINCAPACIDAD.TabStop := False;
  rpPI_RECALIFICACION.TabStop := False;
  rpPI_COINCIDE_MECANISMO_ACC.TabStop := False;
end;

procedure TfrmParteIngreso.edPI_FECHABAJAPRESTADORChange(Sender: TObject);
begin
  inherited;
  if (sdqDatos.State = dsInsert) then
    edPI_FECHABAJAMEDICA.Date := edPI_FECHABAJAPRESTADOR.Date;
end;


procedure TfrmParteIngreso.Print;   // TK 16664
begin
  inherited;
  with TqrParteIngreso.Create(Self) do
  try
    Imprimir(FIdExpediente);
  finally
    Free;
  end;
end;

end.
