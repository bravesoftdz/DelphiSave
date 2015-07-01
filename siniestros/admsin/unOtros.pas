unit unOtros;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSinForm, SDEngine, DB, ExtCtrls, artSeguridad,
  XPMenu, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unfraCPR_PRESTADOR,
  StdCtrls, JvgGroupBox, unFraSTG_TIPOGRAVEDAD, unFraSMC_MOTIVONOCARGA,
  unFraSLZ_LESIONZONA, unFraSLN_LESIONNATURALEZA, unFraSLA_LESIONAGENTE,
  unFraSLF_LESIONFORMA, unFraStaticCodigoDescripcion, unFraStaticCodDesc,
  unFraTipoSiniestro, Mask, PatternEdit, DateTimeEditors, DBCtrls,
  unFraCCI_CIUO, RXDBCtrl, DBPatternEdit,
  unFraSTC_TIPOGRAVEDAD_CIE10, unFraCDG_DIAGNOSTICO,
  unFraSDA_DETALLEARCHIVO, ComboEditor, DBComboGrid,
  Buttons, unSinFormNavigator, unFraPrestadorFueraDeContrato, ActnList,
  unFraSLM_LESIONAGENTEMATERIAL, JvExExtCtrls, JvComponent, JvDBRadioPanel,
  JvExtComponent, RxToolEdit, RxPlacemnt, AnsiSql;

type
  TfrmOtros = class(TSinForm)
    gbPrestador: TJvgGroupBox;
    fraSA_IDPRESTADOR: TfraPrestadorFueraDeContrato;
    sdqDatosSA_ID: TFloatField;
    sdqDatosSA_IDEXPEDIENTE: TFloatField;
    sdqDatosSA_DESCRIPCION: TStringField;
    sdqDatosSA_DIAGNOSTICO: TStringField;
    sdqDatosSA_IDDIAGNOSTICO: TFloatField;
    sdqDatosSA_IDGRAVEDADCIE10: TFloatField;
    sdqDatosSA_IDGRAVEDAD: TFloatField;
    sdqDatosSA_OBSERVACIONES: TStringField;
    sdqDatosSA_IDLESIONFORMA: TFloatField;
    sdqDatosSA_IDLESIONAGENTE: TFloatField;
    sdqDatosSA_IDLESIONNATURALEZA: TFloatField;
    sdqDatosSA_IDLESIONZONA: TFloatField;
    sdqDatosSA_HORJORNADA1DESDE: TDateTimeField;
    sdqDatosSA_HORJORNADA1HASTA: TDateTimeField;
    sdqDatosSA_HORJORNADA2DESDE: TDateTimeField;
    sdqDatosSA_HORJORNADA2HASTA: TDateTimeField;
    sdqDatosSA_IDPRESTADOR: TFloatField;
    sdqDatosSA_IDTAREAHABITUAL: TFloatField;
    sdqDatosSA_IDTAREAACCIDENTE: TFloatField;
    sdqDatosSA_ANTIGUEDADPUESTO: TDateTimeField;
    sdqDatosSA_ANIOSPUESTO: TFloatField;
    sdqDatosSA_MESESPUESTO: TFloatField;
    sdqDatosSA_FECHARECEPCION: TDateTimeField;
    sdqDatosSA_USUALTA: TStringField;
    sdqDatosSA_FECHAALTA: TDateTimeField;
    sdqDatosSA_USUMODIF: TStringField;
    sdqDatosSA_FECHAMODIF: TDateTimeField;
    sdqDatosSA_IDMOTIVONOCARGA: TFloatField;
    sdqDatosSA_FECHACARGA: TDateTimeField;
    sdqDatosSA_CIE10REVISADO: TStringField;
    sdqDatosSA_USUARIOREVISION: TStringField;
    sdqDatosSA_FECHAREVISION: TDateTimeField;
    sdqDatosSA_CPAPEL: TFloatField;
    gbDatos1: TJvgGroupBox;
    Shape1: TShape;
    Label15: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edSA_HORJORNADA1DESDE: TTimeEditor;
    edSA_HORJORNADA1HASTA: TTimeEditor;
    edSA_HORJORNADA2DESDE: TTimeEditor;
    edSA_HORJORNADA2HASTA: TTimeEditor;
    fraTipoSiniestro: TfraTipoSiniestro;
    gbLesion: TJvgGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    fraSA_IDLESIONFORMA: TfraSLF_LESIONFORMA;
    fraSA_IDLESIONAGENTE: TfraSLA_LESIONAGENTE;
    fraSA_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;
    fraSA_IDLESIONZONA: TfraSLZ_LESIONZONA;
    fraSA_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA;
    fraSA_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD;
    gbLaboral: TJvgGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    edSA_ANIOSPUESTO: TDBPatternEdit;
    edSA_MESESPUESTO: TDBPatternEdit;
    edSA_ANTIGUEDADPUESTO: TDBDateEdit;
    fraSA_TAREAHABITUAL: TfraCCI_CIUO;
    fraSA_TAREAACCIDENTE: TfraCCI_CIUO;
    edSA_DESCRIPCION: TDBMemo;
    edSA_OBSERVACIONES: TDBMemo;
    Label1: TLabel;
    gbDiagnostico: TJvgGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    fraSA_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraSA_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    edSA_DIAGNOSTICO: TDBMemo;
    gbArchivo: TJvgGroupBox;
    Label19: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    edSA_FECHARECEPCION: TDBDateEdit;
    edSector: TDBEdit;
    edSA_FECHAALTA: TDBDateEdit;
    sdqDatosSE_SECTOR: TStringField;
    sdqDatosEX_FECHAALTA: TDateTimeField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosEX_TIPO: TStringField;
    sdqDatosEX_FECHARECEPCION: TDateTimeField;
    sdqDatosFACCREC: TDateTimeField;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    sdqDatosSA_TIPO: TStringField;
    sdqDatosSA_PRESTADOR_NOMBRE: TStringField;
    sdqDatosSA_PRESTADOR_TELEFONOS: TStringField;
    sdqDatosSA_PRESTADOR_CALLE: TStringField;
    sdqDatosSA_PRESTADOR_NUMERO: TStringField;
    sdqDatosSA_PRESTADOR_PISO: TStringField;
    sdqDatosSA_PRESTADOR_DEPARTAMENTO: TStringField;
    sdqDatosSA_PRESTADOR_LOCALIDAD: TStringField;
    sdqDatosSA_PRESTADOR_CPOSTAL: TStringField;
    sdqDatosSA_PRESTADOR_CPOSTALA: TStringField;
    sdqDatosSA_PRESTADOR_PROVINCIA: TStringField;
    chkSA_INTERNADO: TDBCheckBox;
    sdqDatosSA_INTERNADO: TStringField;
    fraSA_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL;
    Label7: TLabel;
    sdqDatosSA_IDLESIONAGENTEMATERIAL: TFloatField;
    sdqDatosSA_ALTAPORAMP: TStringField;
    chkSA_ALTAPORAMP: TDBCheckBox;
    Label5: TLabel;
    edSA_FECHABAJAMEDICA: TDBDateEdit;
    sdqDatosSA_FECHABAJAMEDICA: TDateTimeField;
    Label6: TLabel;
    sdqDatosSA_NROSINISUIZA: TStringField;
    edSA_NROSINISUIZA: TDBEdit;
    rpSA_QUIENDENUNCIA: TJvDBRadioPanel;
    lbTextoDenuncia: TLabel;
    sdqDatosSA_QUIENDENUNCIA: TStringField;
    sdqDatosSA_NRO_CECAP: TFloatField;
    sdqDatosEX_ALTAMEDICA: TDateTimeField;
    sdqDatosEX_BAJAMEDICA: TDateTimeField;
    procedure FSFormCreate(Sender: TObject);
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure Validar(DataSet: TDataSet);
    procedure dsDatosUpdateData(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure rpSA_QUIENDENUNCIAChange(Sender: TObject);
    procedure Delete; override;
  private
    procedure Bajas(AValue: Boolean);
    procedure Do_CargarFechaBajaSEX(dFechaBaja:TDateTime; iIdExped:integer);
  public
    procedure Cancel(ASinPreguntar: Boolean = False); override;
    procedure Clear; override;
    procedure Edit; override;
    procedure LoadData; override;
    function  Save: boolean; override;
  end;

var
  frmOtros: TfrmOtros;

implementation

uses
  unDmPrincipal, CustomDlgs, unSiniestros, unArt, unSesion, VCLExtra,
  DateTimeFuncs;

{$R *.dfm}

{ TfrmOtros }

procedure TfrmOtros.Cancel(ASinPreguntar: Boolean = False);
begin
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;
end;

procedure TfrmOtros.Edit;
begin
  if not Inserting then
    Bajas(True);
  inherited;

  if not (Inserting and not sdqDatos.FieldByName('DA_OPCION').IsNull) then
    fraSDA_DETALLEARCHIVO.Clear;
    
  VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);
  if rpSA_QUIENDENUNCIA.ItemIndex = -1 then
    rpSA_QUIENDENUNCIA.ItemIndex := 0;
end;

procedure TfrmOtros.LoadData;
begin
  fraSDA_DETALLEARCHIVO.Clear;
  fraSA_IDLESIONNATURALEZA.ClearGrid;

  if TipoAccidente = TA_ENFERMEDAD then
    fraSA_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' AND LN_CODIGO IN (''17'', ''18'', ''21'', ''99'') '
  else
    fraSA_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' ';

  Bajas(True);
  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  if not sdqDatos.IsEmpty then
    sdqDatos.Last;

  if rpSA_QUIENDENUNCIA.ItemIndex = -1 then
    rpSA_QUIENDENUNCIA.ItemIndex := 0;

  if sdqDatos.RecordCount > 1 then
    InfoHint(fraTipoSiniestro.edCodigo, 'La consulta devolvió mas de un registro. Si este dato no es correcto consulte a sistemas.');

end;

function TfrmOtros.Save: boolean;
begin
  Result := False;

  if sdqDatos.Active then
  begin
    if sdqDatos.State in [dsInsert, dsEdit] then
    begin
      if sdqDatos.FieldByName('SA_ID').AsInteger = ART_EMPTY_ID Then
      begin
        sdqDatos.Edit;
        sdqDatos.FieldByName('SA_ID').AsInteger := GetSecNextVal('SIN.SEQ_SSA_ID');
      end;

      fraSA_IDPRESTADOR.Change;
      sdqDatos.Post;
    end;

    Result := inherited Save;

    // TK 43664
    Do_CopiarFechaBajaMedica(sdqDatos.FieldByName('SA_ID').AsInteger, idExpediente, sdqDatos.FieldByName('SA_FECHABAJAMEDICA').AsDateTime,
                             sdqDatos.FieldByName('SA_FECHARECEPCION').AsDateTime, sdqDatos.FieldByName('EX_ALTAMEDICA').AsDateTime);

    if sdqDatos.FieldByName('EX_BAJAMEDICA').isNull and (not sdqDatos.FieldByName('SA_FECHABAJAMEDICA').IsNull) then    // probando para ticket 60848
      Do_CargarFechaBajaSEX(sdqDatos.FieldByName('SA_FECHABAJAMEDICA').AsDateTime, sdqDatos.FieldByName('SA_IDEXPEDIENTE').AsInteger);

    LoadData;
  end;
end;

procedure TfrmOtros.FSFormCreate(Sender: TObject);
begin
  inherited;
  Bajas(True);
  acEliminar.Enabled := seguridad.activar(acEliminar);
  with fraSA_IDPRESTADOR do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'SA_IDPRESTADOR';
    PrefijoTabla := 'SA_';
  end;

  TTimeEditorMsk(edSA_HORJORNADA1DESDE).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edSA_HORJORNADA1HASTA).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edSA_HORJORNADA2DESDE).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edSA_HORJORNADA2HASTA).EditMask := FormatToMask('HH:mm');

end;

procedure TfrmOtros.Bajas(AValue: Boolean);
begin
  fraSA_IDPRESTADOR.ShowBajas        := AValue;
  fraSA_IDLESIONFORMA.ShowBajas      := AValue;
  fraSA_IDLESIONAGENTE.ShowBajas     := AValue;
  fraSA_IDLESIONNATURALEZA.ShowBajas := AValue;
  fraSA_IDLESIONZONA.ShowBajas       := AValue;
end;

procedure TfrmOtros.sdqDatosNewRecord(DataSet: TDataSet);
var
  sSQL: string;
begin
  with DataSet do
  begin
    Bajas(False);

    FieldByName('SA_ID').AsInteger            := ART_EMPTY_ID;
    FieldByName('SA_IDEXPEDIENTE').AsInteger  := FIdExpediente;
    FieldByName('SA_FECHAALTA').AsDateTime    := dhoy;
    FieldByName('SA_TIPO').AsString           := TipoAccidente;
    FieldByName('SA_INTERNADO').AsString      := 'N';
    FieldByName('SA_ALTAPORAMP').AsString     := 'N';

    VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);

    sSQL := 'SELECT PI_DIAGNOSTICO, PI_IDDIAGNOSTICO, PI_IDGRAVEDAD_CIE10 ' +
              'FROM SIN.SPI_PARTEDEINGRESO ' +
             'WHERE PI_IDEXPEDIENTE = :ID';

    with GetQueryEx(sSQL, [FIdExpediente]) do
    try
      if not IsEmpty then
      begin
        sdqDatos.FieldByName('SA_DIAGNOSTICO').AsString  := FieldByName('PI_DIAGNOSTICO').AsString;
        sdqDatos.FieldByName('SA_IDGRAVEDADCIE10').Value := FieldByName('PI_IDGRAVEDAD_CIE10').Value;
        sdqDatos.FieldByName('SA_IDDIAGNOSTICO').Value   := FieldByName('PI_IDDIAGNOSTICO').Value;
      end;
    finally
      Free;
    end;

    edSA_HORJORNADA1DESDE.Clear;
    edSA_HORJORNADA1HASTA.Clear;
    edSA_HORJORNADA2DESDE.Clear;
    edSA_HORJORNADA2HASTA.Clear;
  end;

  try
    if (Sesion.Sector = 'CEM') then
    begin
      sSQL := 'SELECT *' +
              '  FROM (SELECT MO_ID_TRABAJADOR, MO_TRABAJADOR_EXTERNO, MO_MECANISMOACCIDENTOLOGICO, MO_IDDIAGNOSTICO, ' +
              '               MO_IDGRAVEDAD_CIE10, TRUNC(MO_FECHAALTA) FECHA, ' +
              '               DECODE(MO_TIPO_ACCIDENTE, 0, 1, 2, 2, NULL) AS TIPO, MO_ID, ' +
              '               NVL((SELECT TJ_CUIL' +
              '                      FROM CTJ_TRABAJADOR' +
              '                     WHERE TJ_ID = MO_ID_TRABAJADOR' +
              '                       AND TJ_CUIL = :CUIL' +
              '                       AND MO_TRABAJADOR_EXTERNO = ''N''), (SELECT TJ_CUIL' +
              '                                                            FROM CTJ_TRABAJADOR_EXT' +
              '                                                           WHERE TJ_ID = MO_ID_TRABAJADOR' +
              '                                                             AND TJ_CUIL = :CUIL' +
              '                                                             AND MO_TRABAJADOR_EXTERNO = ''S'')) AS CUIL, ' +
              '               NVL((SELECT TJ_NOMBRE' +
              '                      FROM CTJ_TRABAJADOR' +
              '                     WHERE TJ_ID = MO_ID_TRABAJADOR' +
              '                       AND TJ_CUIL = :CUIL' +
              '                       AND MO_TRABAJADOR_EXTERNO = ''N''), (SELECT TJ_NOMBRE' +
              '                                                            FROM CTJ_TRABAJADOR_EXT' +
              '                                                           WHERE TJ_ID = MO_ID_TRABAJADOR' +
              '                                                             AND TJ_CUIL = :CUIL' +
              '                                                             AND MO_TRABAJADOR_EXTERNO = ''S'')) AS TRABAJADOR, ' +
              '               NVL(MO_IDPRESTADOR_REFERENCIA, ' +
              '                   NVL(NVL((SELECT CA_IDENTIFICADOR ' +
              '                              FROM CPR_PRESTADOR ' +
              '                             WHERE CA_IDENTIFICADOR = MO_DF_PRESTADOR ' +
              '                               AND MO_DF_PRESTADOR_EXTERNO = ''N''), ' +
              '                           (SELECT CA_IDENTIFICADOR ' +
              '                              FROM CPR_PRESTADOR_EXT ' +
              '                             WHERE CA_IDENTIFICADOR = MO_DF_PRESTADOR ' +
              '                               AND MO_DF_PRESTADOR_EXTERNO = ''S'')), 0)) AS PRESTADOR, ' +
              '               EM_CUIT AS CUIT, EM_NOMBRE AS EMPRESA, MO_FECHA_ACCIDENTE' +
              '          FROM CEM.CMO_MOVIMIENTOS, AEM_EMPRESA' +
              '         WHERE EM_CUIT(+) = :CUIT' +
              '           AND TRUNC(MO_FECHA_ACCIDENTE) = :FECHA' +
              '           AND MO_ID_EMPRESA = EM_ID(+))' +
              ' WHERE CUIL IS NOT NULL';

      with GetQueryEx(sSQL, [CUIL, CUIL, CUIL, CUIL, CUIT, TDateTimeEx.Create(FechaAccidenteRecaida)]) do
      try
        if not IsEmpty then
        begin
          MostrarAlarma('CEM', Format('Se encontró registro de un movimiento para %s de %s accidentado/a el %s.',
                                     [FieldByName('TRABAJADOR').AsString,
                                      FieldByName('EMPRESA').AsString,
                                      FormatDateTime('dd/mm/yyyy' , FieldByName('MO_FECHA_ACCIDENTE').AsDateTime)]));
          fraSA_IDPRESTADOR.Value := FieldByName('PRESTADOR').AsInteger;
          sdqDatos.FieldByName('SA_IDPRESTADOR').AsInteger := FieldByName('PRESTADOR').AsInteger;
          sdqDatos.FieldByName('SA_DESCRIPCION').AsString := FieldByName('MO_MECANISMOACCIDENTOLOGICO').AsString;
          sdqDatos.FieldByName('SA_OBSERVACIONES').AsString := 'CECAP N°' + FieldByName('MO_ID').AsString;
          sdqDatos.FieldByName('SA_NRO_CECAP').AsInteger := FieldByName('MO_ID').AsInteger;
          sdqDatos.FieldByName('SA_FECHARECEPCION').AsDateTime := FieldByName('FECHA').AsDateTime;
          fraSDA_DETALLEARCHIVO.Opcion := 'S';
          sdqDatos.FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
          sdqDatos.FieldByName('SA_IDDIAGNOSTICO').AsString := FieldByName('MO_IDDIAGNOSTICO').AsString;
          sdqDatos.FieldByName('SA_IDGRAVEDADCIE10').AsString := FieldByName('MO_IDGRAVEDAD_CIE10').AsString;
        end
      finally
        Free;
      end;
    end;
  except
    on E: Exception do
      InfoHint(fraSA_IDPRESTADOR.cmbCA_DESCRIPCION, 'Ocurrió un error al recuperar ciertos datos del CEM, por favor avise a Sistemas.' + CRLF + E.Message);
  end;
end;
{-------------------Este método es el sdqDatosBeforePost-----------------------}
procedure TfrmOtros.Validar(DataSet: TDataSet);
var dFecha, dFecAltaMed:TDateTime;
    sSql, sInterc, sSQLAltaMed: string;
begin
//  IniciarEspera('Validando...');
  try
    inherited;
//    Verificar(fraSA_IDPRESTADOR.IsEmpty, fraSA_IDPRESTADOR.edCA_IDENTIFICADOR, Msg_16);
    Verificar(edSA_ANTIGUEDADPUESTO.Date > dHoy, edSA_ANTIGUEDADPUESTO, Format(Msg_08, [DateToStr(dHoy)]));
    Verificar(edSA_ANTIGUEDADPUESTO.Date > FechaAccidente, edSA_ANTIGUEDADPUESTO, Format(Msg_09, [DateToStr(FechaAccidente)]));
    Verificar(not VarIsNull(edSA_MESESPUESTO.Field.Value) and (edSA_MESESPUESTO.Field.Value > 11), edSA_MESESPUESTO, Msg_10);
    Verificar(fraSA_IDGRAVEDAD_CIE10.IsEmpty and fraSA_IDDIAGNOSTICO.IsSelected, fraSA_IDGRAVEDAD_CIE10.edCodigo, Msg_01);

    Verificar(fraSA_IDLESIONAGENTE.IsSelected and fraSA_IDLESIONAGENTE.IsBaja, fraSA_IDLESIONAGENTE.edCodigo, Format(Msg_73, ['un agente']));
    Verificar(fraSA_IDLESIONFORMA.IsSelected and fraSA_IDLESIONFORMA.IsBaja, fraSA_IDLESIONFORMA.edCodigo, Format(Msg_73, ['una forma']));
    Verificar(fraSA_IDLESIONNATURALEZA.IsSelected and fraSA_IDLESIONNATURALEZA.IsBaja, fraSA_IDLESIONNATURALEZA.edCodigo, Format(Msg_73, ['una naturaleza']));
    Verificar(fraSA_IDLESIONZONA.IsSelected and fraSA_IDLESIONZONA.IsBaja, fraSA_IDLESIONZONA.edCodigo, Format(Msg_73, ['una zona']));
    Verificar(fraSA_IDLESIONAGENTEMATERIAL.IsSelected and (fraSA_IDLESIONAGENTEMATERIAL.IsSubTitulo or fraSA_IDLESIONAGENTEMATERIAL.IsTitulo), fraSA_IDLESIONAGENTEMATERIAL.edCodigo, Format(Msg_74, ['un agente']));
    Verificar(fraSA_IDLESIONFORMA.IsSelected and fraSA_IDLESIONFORMA.IsSubTitulo, fraSA_IDLESIONFORMA.edCodigo, Format(Msg_74, ['una forma']));    

    Verificar(edSA_FECHARECEPCION.Date = 0, edSA_FECHARECEPCION, Msg_03);
    Verificar(edSA_FECHARECEPCION.Date > dHoy, edSA_FECHARECEPCION, Format(Msg_04, [DateToStr(dHoy)]));
    Verificar(edSA_FECHARECEPCION.Date < FechaAccidenteRecaida, edSA_FECHARECEPCION, Format(Msg_06, [DateToStr(FechaAccidenteRecaida)]));
    Verificar((sdqDatos.State = dsEdit) and (edSA_FECHARECEPCION.Date > sdqDatosSA_FECHAALTA.AsDateTime), edSA_FECHARECEPCION, Format(Msg_07, [sdqDatosSA_FECHAALTA.AsString]));
    Verificar((FechaRecepcion = 0) and (edSA_FECHARECEPCION.Date > FechaAlta), edSA_FECHARECEPCION, Format(Msg_05, [DateToStr(FechaAlta)]));

    // TK 27016 -----------------------------
    Verificar((edSA_FECHABAJAMEDICA.Date <> 0) and (edSA_FECHABAJAMEDICA.Date > dHoy), edSA_FECHABAJAMEDICA, Format(Msg_11, ['baja médica', DateToStr(dHoy)]));
    Verificar((edSA_FECHABAJAMEDICA.Date <> 0) and (edSA_FECHABAJAMEDICA.Date < FechaAccidenteRecaida), edSA_FECHABAJAMEDICA, Format(Msg_12, [DateToStr(FechaAccidenteRecaida)]));
    dFecha := Obtener_MinFechaLiquidacionILT(IdExpediente);
    Verificar((dFecha > 0) and (edSA_FECHABAJAMEDICA.Date > dFecha), edSA_FECHABAJAMEDICA, Format(Msg_17, [DateToStr(dFecha)]));

    // TK 28569 (esta es la fecha de alta medica)
    sSQLAltaMed := 'SELECT MAX(EX_ALTAMEDICA) ' +
                     'FROM SEX_EXPEDIENTES ' +       
                    'WHERE EX_SINIESTRO = :SIN ' +
                      'AND EX_ORDEN = :ORD ' +
                      'AND EX_RECAIDA < :REC ' +
                      'AND EX_INTERCURRENCIA <> ''S'' ';
    dFecAltaMed := ValorSQLDateTimeEx(sSQLAltaMed, [Siniestro, Orden, Recaida]);
    sSQL := 'SELECT NVL(EX_INTERCURRENCIA, ''N'') ' +
              'FROM SEX_EXPEDIENTES ' +
             'WHERE EX_SINIESTRO = :SIN ' +
               'AND EX_ORDEN = :ORD ' +
               'AND EX_RECAIDA = :REC ';
    sInterc := ValorSqlEx(sSQL, [Siniestro, Orden, Recaida]);
    Verificar((sInterc <> 'S') and (dFecAltaMed > 0) and (edSA_FECHABAJAMEDICA.Date > 0) and
              (edSA_FECHABAJAMEDICA.Date < dFecAltaMed), edSA_FECHABAJAMEDICA, Format(Msg_19, [DateToStr(dFecAltaMed)]));
    // ---------------------------------------

    fraSDA_DETALLEARCHIVO.Validate;
  finally
//    DetenerEspera;
  end;
end;

procedure TfrmOtros.dsDatosUpdateData(Sender: TObject);
  procedure SetDateTime(AField: string; AHoraText: string; ADateTime:TDateTime);
  begin
    if (AHoraText = '  :  ') then
      sdqDatos.FieldByName(AField).Value := Null
    else if (AHoraText = '00:00') then         // TK 29077
      sdqDatos.FieldByName(AField).Value := strtodatetime('30/12/1899 00:00:00')
    else
      sdqDatos.FieldByName(AField).AsDateTime := ADateTime;
  end;
begin
  inherited;
  with sdqDatos do
  begin
    if State = dsEdit then
      FieldByName('SA_USUMODIF').AsString := Sesion.UserID
    else if State = dsInsert then
      FieldByName('SA_USUALTA').AsString := Sesion.UserID;

    FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
    FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;

    SetDateTime('SA_HORJORNADA1DESDE', edSA_HORJORNADA1DESDE.Text, edSA_HORJORNADA1DESDE.Time);
    SetDateTime('SA_HORJORNADA1HASTA', edSA_HORJORNADA1HASTA.Text, edSA_HORJORNADA1HASTA.Time);
    SetDateTime('SA_HORJORNADA2DESDE', edSA_HORJORNADA2DESDE.Text, edSA_HORJORNADA2DESDE.Time);
    SetDateTime('SA_HORJORNADA2HASTA', edSA_HORJORNADA2HASTA.Text, edSA_HORJORNADA2HASTA.Time);
  end;
end;

procedure TfrmOtros.sdqDatosAfterOpen(DataSet: TDataSet);
  procedure SetTime(AEditor: TTimeEditor; AField: string);
  begin
    if sdqDatos.FieldByName(AField).IsNull {or (sdqDatos.State in [dsInsert])} then
      AEditor.Clear
    else if (sdqDatos.FieldByName(AField).AsDateTime = 0) then   // TK 29077
      AEditor.Time := MinDateTime
    else
      AEditor.Time := sdqDatos.FieldByName(AField).AsDateTime;
  end;
begin
  inherited;

  SetTime(edSA_HORJORNADA1DESDE, 'SA_HORJORNADA1DESDE');
  SetTime(edSA_HORJORNADA1HASTA, 'SA_HORJORNADA1HASTA');
  SetTime(edSA_HORJORNADA2DESDE, 'SA_HORJORNADA2DESDE');
  SetTime(edSA_HORJORNADA2HASTA, 'SA_HORJORNADA2HASTA');
end;

procedure TfrmOtros.Clear;
begin
  inherited;
  edSA_HORJORNADA1DESDE.Clear;
  edSA_HORJORNADA1HASTA.Clear;
  edSA_HORJORNADA2DESDE.Clear;
  edSA_HORJORNADA2HASTA.Clear;

end;

procedure TfrmOtros.rpSA_QUIENDENUNCIAChange(Sender: TObject);
begin
  inherited;
  case rpSA_QUIENDENUNCIA.ItemIndex of
    0: lbTextoDenuncia.Caption := 'Sin datos sobre la denuncia';
    1: lbTextoDenuncia.Caption := 'Denunciado por el trabajador';
    2: lbTextoDenuncia.Caption := 'Denunciado por otra persona';
  end;
end;


procedure TfrmOtros.Delete;
begin
  if MsgAsk('¿Está seguro que desea eliminar?' + CRLF + CRLF +
            'Tenga en cuenta que se generará un parte evolutivo con la información del mismo.') then
  begin
    sdqDatos.Delete;
    DoAplicarUpdates(sdqDatos);
    dsDatosStateChange(nil);
  end;
end;


procedure TfrmOtros.Do_CargarFechaBajaSEX(dFechaBaja: TDateTime; iIdExped:integer);  // para probar ticket 60848
var sSql: string;
begin
  sSQL := ' UPDATE ART.SEX_EXPEDIENTES ' +
             ' SET EX_BAJAMEDICA = ' + SqlDate(dFechaBaja) +
           ' WHERE ex_id = :id ';

  EjecutarSQLEx(sSQL, [iIdExped]);
end;

end.
