unit unDenuncia;

interface

uses
  {$IFDEF VER180}
  rxPlacemnt,
  rxToolEdit,
  {$ELSE}
  Placemnt,
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unSinForm, SDEngine, DB,
  artSeguridad, unFraCodigoDescripcion, unfraCtbTablas, unFraCIE10, StdCtrls, Mask, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unfraCPR_PRESTADOR, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, DBCtrls,
  ExtCtrls, DateTimeEditors, PatternEdit, DBPatternEdit, unFraSDA_DETALLEARCHIVO, unFraSMC_MOTIVONOCARGA,
  unFraStaticCodDesc, unFraSTG_TIPOGRAVEDAD, unFraSLA_LESIONAGENTE, unFraSLF_LESIONFORMA, RXDBCtrl, IntEdit,
  unFraCDG_DIAGNOSTICO, unFraSTC_TIPOGRAVEDAD_CIE10, unFraTipoSiniestro, unFraSLN_LESIONNATURALEZA, unFraSLZ_LESIONZONA,
  unFraCodDesc, unFraCPA_PAISES, unFraCCI_CIUO, JvExControls, JvComponent, unFraDomicilio, unFraPrestadorFueraDeContrato,
  JvExMask, JvToolEdit, JvMaskEdit, JvDBControls, JvgGroupBox, XPMenu, ActnList, unFraCCO_PARTIDOS_CODIGOSPOSTALES;

type
  TfrmDenuncia = class(TSinForm)
    sdqDatosDE_ID: TFloatField;
    sdqDatosDE_IDEXPEDIENTE: TFloatField;
    sdqDatosDE_TAREAHABITUAL: TFloatField;
    sdqDatosDE_TAREAACCIDENTE: TFloatField;
    sdqDatosDE_ANTIGUEDADPUESTO: TDateTimeField;
    sdqDatosDE_ANIOSPUESTO: TFloatField;
    sdqDatosDE_MESESPUESTO: TFloatField;
    sdqDatosDE_IDGRAVEDAD: TFloatField;
    sdqDatosDE_DESCRIPCION: TStringField;
    sdqDatosDE_DIAGNOSTICO: TStringField;
    sdqDatosDE_IDDIAGNOSTICO: TFloatField;
    sdqDatosDE_IDLESIONFORMA: TFloatField;
    sdqDatosDE_IDLESIONAGENTE: TFloatField;
    sdqDatosDE_IDLESIONNATURALEZA: TFloatField;
    sdqDatosDE_IDLESIONZONA: TFloatField;
    sdqDatosDE_HORJORNADA1DESDE: TStringField;
    sdqDatosDE_HORJORNADA1HASTA: TStringField;
    sdqDatosDE_HORJORNADA2DESDE: TStringField;
    sdqDatosDE_HORJORNADA2HASTA: TStringField;
    sdqDatosDE_IDPRESTADOR: TFloatField;
    sdqDatosDE_EPMANIFESTACION: TDateTimeField;
    sdqDatosDE_EPEXPUESTODESDE: TDateTimeField;
    sdqDatosDE_OBSERVACIONES: TStringField;
    sdqDatosDE_FECHARECEPCION: TDateTimeField;
    sdqDatosUSUARIO: TStringField;
    sdqDatosDE_FECHAALTA: TDateTimeField;
    sdqDatosDE_USUMODIF: TStringField;
    sdqDatosDE_FECHAMODIF: TDateTimeField;
    sdqDatosDE_IDMOTIVONOCARGA: TFloatField;
    sdqDatosDE_IDGRAVEDAD_CIE10: TFloatField;
    sdqDatosSE_SECTOR: TStringField;
    sdqDatosEX_FECHAALTA: TDateTimeField;
    sdqDatosEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosFACCREC: TDateTimeField;
    sdqDatosEX_TIPO: TStringField;
    sdqDatosEX_FECHARECEPCION: TDateTimeField;
    sdqDatosDE_TIPO: TStringField;
    sdqDatosUBICACION_DENUNCIA: TStringField;
    sdqDatosDE_UBICACION_ESTABLECIMIENTO: TFloatField;
    sdqDatosDE_UBICACION_NOMBRE: TStringField;
    sdqDatosDE_UBICACION_CALLE: TStringField;
    sdqDatosDE_UBICACION_NUMERO: TStringField;
    sdqDatosDE_UBICACION_PISO: TStringField;
    sdqDatosDE_UBICACION_DEPARTAMENTO: TStringField;
    sdqDatosDE_UBICACION_LOCALIDAD: TStringField;
    sdqDatosDE_UBICACION_CPOSTAL: TStringField;
    sdqDatosDE_UBICACION_CPOSTALA: TStringField;
    sdqDatosDE_UBICACION_PROVINCIA: TStringField;
    sdqDatosDE_UBICACION_TELEFONOS: TStringField;
    sdqDatosDE_UBICACION_PAIS: TStringField;
    sdqDatosDE_UBICACION_CODAREATELEFONOS: TStringField;
    sdqDatosDE_UBICACION_CUITOCURRE: TStringField;
    sdqDatosDE_ITINERE_DENUNCIAPOLICIAL: TStringField;
    sdqDatosDE_ITINERE_COMISARIA: TStringField;
    sdqDatosDE_ITINERE_COM_CALLE: TStringField;
    sdqDatosDE_ITINERE_COM_NUMERO: TStringField;
    sdqDatosDE_ITINERE_COM_PISO: TStringField;
    sdqDatosDE_ITINERE_COM_DEPARTAMENTO: TStringField;
    sdqDatosDE_ITINERE_COM_CPOSTAL: TStringField;
    sdqDatosDE_ITINERE_COM_CPOSTALA: TStringField;
    sdqDatosDE_ITINERE_COM_LOCALIDAD: TStringField;
    sdqDatosDE_ITINERE_COM_PROVINCIA: TStringField;
    sdqDatosDE_ITINERE_NRODENUNCIA: TStringField;
    sdqDatosDE_ITINERE_PRIMEROS_AUXILIOS: TStringField;
    sdqDatosDE_ITINERE_COM_TELEFONOS: TStringField;
    sdqDatosPROV_1: TStringField;
    sdqDatosPROV_2: TStringField;
    sdqDatosDE_ITINERE_TESTIGO1_NOMBRE: TStringField;
    sdqDatosDE_ITINERE_TESTIGO1_DOMICILIO: TStringField;
    sdqDatosDE_ITINERE_TESTIGO1_TELEFONOS: TStringField;
    sdqDatosDE_ITINERE_TESTIGO2_NOMBRE: TStringField;
    sdqDatosDE_ITINERE_TESTIGO2_DOMICILIO: TStringField;
    sdqDatosDE_ITINERE_TESTIGO2_TELEFONOS: TStringField;
    sdqDatosDE_ITINERE_TERCERO_RESP_NOMBRE: TStringField;
    sdqDatosDE_ITINERE_TERCERO_RESP_DOM: TStringField;
    sdqDatosDE_ITINERE_TERCERO_RESP_TEL: TStringField;
    gbUbicacion: TJvgGroupBox;
    lbValidacionCUIT: TLabel;
    rgEstablecimiento: TDBRadioGroup;
    pnlEstablecimientoExtra: TPanel;
    Label18: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    edDE_UBICACION_TELEFONOS: TDBEdit;
    edDE_UBICACION_CODAREATELEFONOS: TDBEdit;
    fraDE_UBICACION_PAIS: TfraCPA_PAISES;
    edDE_UBICACION_NOMBRE: TDBEdit;
    fraDomicilioEstablecimiento: TfraDomicilio;
    gbDatos1: TJvgGroupBox;
    Label23: TLabel;
    fraTipoSiniestro: TfraTipoSiniestro;
    gbLaboral: TJvgGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    edDE_ANIOSPUESTO: TDBPatternEdit;
    edDE_MESESPUESTO: TDBPatternEdit;
    edDE_ANTIGUEDADPUESTO: TDBDateEdit;
    fraDE_TAREAHABITUAL: TfraCCI_CIUO;
    fraDE_TAREAACCIDENTE: TfraCCI_CIUO;
    gbLesion: TJvgGroupBox;
    lbForma: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fraDE_IDLESIONFORMA: TfraSLF_LESIONFORMA;
    fraDE_IDLESIONAGENTE: TfraSLA_LESIONAGENTE;
    fraDE_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;
    fraDE_IDLESIONZONA: TfraSLZ_LESIONZONA;
    Label10: TLabel;
    fraDE_IDMOTIVONOCARGA: TfraSMC_MOTIVONOCARGA;
    gbPrestador: TJvgGroupBox;
    fraDE_IDPRESTADOR: TfraPrestadorFueraDeContrato;
    gbArchivo: TJvgGroupBox;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    gbDiagnostico: TJvgGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    fraDE_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraDE_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    gbDenunciaPolicial: TJvgGroupBox;
    rgDenunciaPolicial: TDBRadioGroup;
    pnl: TPanel;
    Label30: TLabel;
    Label32: TLabel;
    edDE_ITINERE_COM_TELEFONOS: TDBEdit;
    edDE_ITINERE_COMISARIA: TDBEdit;
    fraDomicilioDenuncia: TfraDomicilio;
    pnlTestigo1: TPanel;
    edDE_ITINERE_TESTIGO1_TELEFONOS: TDBEdit;
    edDE_ITINERE_TESTIGO1_DOMICILIO: TDBEdit;
    edDE_ITINERE_TESTIGO1_NOMBRE: TDBEdit;
    Label27: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    pnlTestigo2: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    edDE_ITINERE_TESTIGO2_TELEFONOS: TDBEdit;
    edDE_ITINERE_TESTIGO2_DOMICILIO: TDBEdit;
    edDE_ITINERE_TESTIGO2_NOMBRE: TDBEdit;
    pnlTerceros: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edDE_ITINERE_TERCERO_RESP_TEL: TDBEdit;
    edDE_ITINERE_TERCERO_RESP_DOM: TDBEdit;
    edDE_ITINERE_TERCERO_RESP_NOMBRE: TDBEdit;
    Label19: TLabel;
    Label8: TLabel;
    edDE_FECHARECEPCION: TDBDateEdit;
    edSector: TDBEdit;
    edDE_FECHAALTA: TDBDateEdit;
    Label4: TLabel;
    fraDE_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD;
    Label7: TLabel;
    Label21: TLabel;
    edDE_OBSERVACIONES: TDBMemo;
    sdqDatosDE_ACCIDENTETRANSITO: TStringField;
    rgDE_ACCIDENTETRANSITO: TDBRadioGroup;
    sdqDatosDE_INTERNACION: TStringField;
    edDE_DIAGNOSTICO: TDBMemo;
    chkInternado: TDBCheckBox;
    Label41: TLabel;
    edDE_ITINERE_NRODENUNCIA: TDBEdit;
    sdqDatosDE_PRESTADOR_NOMBRE: TStringField;
    sdqDatosDE_PRESTADOR_TELEFONOS: TStringField;
    sdqDatosDE_PRESTADOR_CALLE: TStringField;
    sdqDatosDE_PRESTADOR_NUMERO: TStringField;
    sdqDatosDE_PRESTADOR_PISO: TStringField;
    sdqDatosDE_PRESTADOR_DEPARTAMENTO: TStringField;
    sdqDatosDE_PRESTADOR_LOCALIDAD: TStringField;
    sdqDatosDE_PRESTADOR_CPOSTAL: TStringField;
    sdqDatosDE_PRESTADOR_CPOSTALA: TStringField;
    sdqDatosDE_PRESTADOR_PROVINCIA: TStringField;
    edDE_DESCRIPCION: TDBMemo;
    Label20: TLabel;
    Label15: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edDE_HORJORNADA1DESDE: TTimeEditor;
    edDE_HORJORNADA1HASTA: TTimeEditor;
    edDE_HORJORNADA2DESDE: TTimeEditor;
    edDE_HORJORNADA2HASTA: TTimeEditor;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    Label29: TLabel;
    Label40: TLabel;
    edDE_UBICACION_CUITOCURRE: TJvDBMaskEdit;
    fraUD_SECUENCIA_PARTIDOLOCALIDAD: TfraCCO_PARTIDOS_CODIGOSPOSTALES;
    sdqDatosUD_SECUENCIA_PARTIDOLOCALIDAD: TFloatField;
    Label43: TLabel;
    procedure FSFormCreate(Sender: TObject);
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure Validar(DataSet: TDataSet); //Este método es el sdqDatosBeforePost
    procedure dsDatosUpdateData(Sender: TObject);
    procedure edDE_HORJORNADA1DESDEExit(Sender: TObject);
    procedure edDE_HORJORNADA1HASTAExit(Sender: TObject);
    procedure edDE_HORJORNADA2DESDEExit(Sender: TObject);
    procedure edDE_HORJORNADA2HASTAExit(Sender: TObject);
    procedure rgEstablecimientoChange(Sender: TObject);
    procedure edDE_UBICACION_CUITOCURREChange(Sender: TObject);
    procedure rgDenunciaPolicialChange(Sender: TObject);
    procedure fraDomicilioEstablecimientoedCPostalChange(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    function GetOrden: Integer;
    function GetRecaida: Integer;
    function GetSiniestro: Integer;
  protected
    procedure SetLocked(const Value: Boolean); override;
  public
    function Save: boolean; override;

    procedure Cancel(ASinPreguntar: Boolean = False); override;
    procedure Clear; override;
    procedure Edit; override;    
    procedure LoadData; override;

    property Siniestro: Integer read GetSiniestro;
    property Orden    : Integer read GetOrden;
    property Recaida  : Integer read GetRecaida;
  end;

var
  frmDenuncia: TfrmDenuncia;

implementation

uses
  unDmPrincipal, unArt, AnsiSql, DbFuncs, unSesion, CustomDlgs, Math, unEspera, unSiniestros, DateTimeFuncs,
  unDlgBusEstablecimiento, VCLExtra, General, CUIT;

{$R *.dfm}

procedure TfrmDenuncia.Cancel(ASinPreguntar: Boolean = False);
var
  bInsertando: Boolean;
begin
  bInsertando := (sdqDatos.State = dsInsert);
  inherited;
  if bInsertando then
  begin
    fraDomicilioDenuncia.Clear;
    fraDomicilioEstablecimiento.Clear;
  end;
end;

procedure TfrmDenuncia.Edit;
begin
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;
  VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);

  VCLExtra.LockControls([edDE_UBICACION_NOMBRE,
                         edDE_UBICACION_CODAREATELEFONOS,
                         edDE_UBICACION_TELEFONOS,
                         fraDE_UBICACION_PAIS,
                         fraDomicilioEstablecimiento], rgEstablecimiento.ItemIndex <> 1);
  VCLExtra.LockControls([edDE_ITINERE_TESTIGO1_NOMBRE,
                         edDE_ITINERE_TESTIGO1_DOMICILIO,
                         edDE_ITINERE_TESTIGO1_TELEFONOS,
                         edDE_ITINERE_TESTIGO2_NOMBRE,
                         edDE_ITINERE_TESTIGO2_DOMICILIO,
                         edDE_ITINERE_TESTIGO2_TELEFONOS,
                         edDE_ITINERE_TERCERO_RESP_NOMBRE,
                         edDE_ITINERE_TERCERO_RESP_DOM,
                         edDE_ITINERE_TERCERO_RESP_TEL,
                         edDE_ITINERE_COMISARIA,
                         edDE_ITINERE_NRODENUNCIA,
                         edDE_ITINERE_COM_TELEFONOS,
                         fraDomicilioDenuncia], rgDenunciaPolicial.ItemIndex <> 0);
end;

function TfrmDenuncia.GetOrden: Integer;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := sdqDatos.FieldByName('DE_ORDEN').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfrmDenuncia.GetRecaida: Integer;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := sdqDatos.FieldByName('DE_RECAIDA').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfrmDenuncia.GetSiniestro: Integer;
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
    Result := sdqDatos.FieldByName('DE_SINIESTRO').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfrmDenuncia.LoadData;
begin
  fraSDA_DETALLEARCHIVO.Clear;
  fraDE_IDLESIONNATURALEZA.ClearGrid;

  if TipoAccidente = TA_ENFERMEDAD then
    fraDE_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' AND LN_CODIGO IN (''17'', ''18'', ''21'', ''99'') '
  else
    fraDE_IDLESIONNATURALEZA.Propiedades.ExtraCondition := ' ';

  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  if not sdqDatos.IsEmpty then
    sdqDatos.Last;

  if sdqDatos.RecordCount > 1 then
    InfoHint(edDE_DIAGNOSTICO, 'La consulta devolvió mas de una denuncia. Si este dato no es correcto consulte a sistemas.');
end;

function TfrmDenuncia.Save: Boolean;
begin
  Result := False;

  if sdqDatos.Active then
  begin
    if sdqDatos.State in [dsInsert, dsEdit] then
    begin
      if sdqDatos.FieldByName('DE_ID').AsInteger = ART_EMPTY_ID Then
      begin
        sdqDatos.Edit;
        sdqDatos.FieldByName('DE_ID').AsInteger := GetSecNextVal('SIN.SEQ_SDE_ID');
      end;

      fraDE_IDPRESTADOR.Change;
      sdqDatos.Post;
    end;

    Result := inherited Save;
  end;
end;

procedure TfrmDenuncia.FSFormCreate(Sender: TObject);
begin
  inherited;
  acEliminar.Enabled := False;

  fraDomicilioEstablecimiento.AutoSize := False;
  fraDomicilioDenuncia.AutoSize := False;
  lbValidacionCUIT.Caption := '';

  with fraDE_IDPRESTADOR do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'DE_IDPRESTADOR';
    PrefijoTabla := 'DE_';
  end;

  TTimeEditorMsk(edDE_HORJORNADA1DESDE).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edDE_HORJORNADA1HASTA).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edDE_HORJORNADA2DESDE).EditMask := FormatToMask('HH:mm');
  TTimeEditorMsk(edDE_HORJORNADA2HASTA).EditMask := FormatToMask('HH:mm');
end;

procedure TfrmDenuncia.sdqDatosNewRecord(DataSet: TDataSet);
var
  sSQL: String;
begin
  with DataSet do
  begin
    FieldByName('DE_ID').AsInteger := ART_EMPTY_ID;
    FieldByName('DE_IDEXPEDIENTE').AsInteger := FIdExpediente;
    FieldByName('DE_FECHAALTA').AsDateTime := dHoy;

    edDE_HORJORNADA1DESDE.Clear;
    edDE_HORJORNADA1HASTA.Clear;
    edDE_HORJORNADA2DESDE.Clear;
    edDE_HORJORNADA2HASTA.Clear;

    FieldByName('DE_ACCIDENTETRANSITO').AsString := AccidenteDeTransito;
    FieldByName('DE_INTERNACION').AsString := 'N';
    FieldByName('DE_TIPO').AsString := TipoAccidente;
    FieldByName('UBICACION_DENUNCIA').AsString   := 'S';

    VCLExtra.LockControls(fraTipoSiniestro, not fraTipoSiniestro.IsEmpty);

    sSQL := 'SELECT PI_DIAGNOSTICO, PI_IDDIAGNOSTICO, PI_IDGRAVEDAD_CIE10, ' +
//                   'ART.SINIESTRO.GET_CIE10EGRESO(PI_IDEXPEDIENTE) as CIE10, ' +
//                   'ART.SINIESTRO.GET_GRAVEDADCIE10_EGRESO(PI_IDEXPEDIENTE) as GRAVEDAD_CIE10, ' +
//                   'PI_IDPRESTADOR ' +
                   'DECODE(UD_ESTABLECIMIENTO || UD_CPOSTAL || UD_CALLE, ' +
                   'NULL, ''S'', ' +
                   'DECODE(UD_ESTABLECIMIENTO, NULL, ''O'', ''P'')) as UBICACION_DENUNCIA, ' +
                   'UD_CALLE, UD_NUMERO, UD_PISO, UD_DEPARTAMENTO, UD_CPOSTAL, UD_CPOSTALA, ' +
                   'UD_LOCALIDAD, UD_PROVINCIA, PV_DESCRIPCION PROVINCIA, UD_ESTABLECIMIENTO, UD_NOMBRE ' +
              'FROM SEX_EXPEDIENTES ' +
         'LEFT JOIN SIN.SUD_UBICACIONDENUNCIA ON UD_IDEXPEDIENTE = EX_ID ' +
         'LEFT JOIN SIN.SPI_PARTEDEINGRESO ON PI_IDEXPEDIENTE = EX_ID ' +
         'LEFT JOIN ART.CPV_PROVINCIAS ON PV_CODIGO = UD_PROVINCIA ' +
             'WHERE EX_ID = :ID';

    with GetQueryEx(sSQL, [FIdExpediente]) do
    try
      if not IsEmpty then
      begin
        sdqDatos.FieldByName('DE_DIAGNOSTICO').AsString := FieldByName('PI_DIAGNOSTICO').AsString;
        sdqDatos.FieldByName('DE_IDGRAVEDAD_CIE10').Value := FieldByName('PI_IDGRAVEDAD_CIE10').Value;
        sdqDatos.FieldByName('DE_IDDIAGNOSTICO').Value := FieldByName('PI_IDDIAGNOSTICO').Value;

        sdqDatos.FieldByName('DE_UBICACION_NOMBRE').Value := FieldByName('UD_NOMBRE').Value;
        sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').Value := FieldByName('UD_ESTABLECIMIENTO').Value;

        rgEstablecimiento.OnChange := nil;
        sdqDatos.FieldByName('UBICACION_DENUNCIA').Value := FieldByName('UBICACION_DENUNCIA').Value;
        rgEstablecimiento.OnChange := rgEstablecimientoChange;

        with fraDomicilioEstablecimiento do
        begin
          Calle        := FieldByName('UD_CALLE').AsString;
          Numero       := IIF(FieldByName('UD_NUMERO').IsNull, 'S/N', FieldByName('UD_NUMERO').AsString);
          Piso         := FieldByName('UD_PISO').AsString;
          Departamento := FieldByName('UD_DEPARTAMENTO').AsString;
          CodigoPostal := FieldByName('UD_CPOSTAL').AsString;
          CPA          := FieldByName('UD_CPOSTALA').AsString;
          Localidad    := FieldByName('UD_LOCALIDAD').AsString;
          Prov         := StrToIntDef(FieldByName('UD_PROVINCIA').AsString, -1);
          Provincia    := FieldByName('PROVINCIA').AsString;
        end;
{
        sdqDatos.FieldByName('DE_IDGRAVEDAD_CIE10').Value := FieldByName('GRAVEDAD_CIE10').Value;
        sdqDatos.FieldByName('DE_IDDIAGNOSTICO').Value := FieldByName('CIE10').Value;
        sdqDatos.FieldByName('DE_IDPRESTADOR').Value := FieldByName('PI_IDPRESTADOR').Value;
}        
      end;
    finally
      Free;
    end;
  end;
end;
{-------------------Este método es el sdqDatosBeforePost-----------------------}
procedure TfrmDenuncia.Validar(DataSet: TDataSet);
{
const
  Msg_01 = 'Debe indicar la gravedad si selecciona un diagnóstico.';
  Msg_02 = 'Debe completar la descripción del hecho.';
  Msg_03 = 'La fecha de recepción es obligatoria.';
  Msg_04 = 'La fecha de recepción no puede ser posterior a la de hoy %s.';
  Msg_05 = 'La fecha de recepción no puede ser posterior a la fecha de carga del siniestro, para el primer parte ingresado %s.';
  Msg_06 = 'La fecha de recepción no puede ser anterior a la fecha del accidente/recaída %s.';
  Msg_07 = 'La fecha de recepción no puede ser posterior a la de alta %s del parte.';
  Msg_08 = 'La fecha de antigüedad en el puesto no puede ser posterior a la de hoy %s.';
  Msg_09 = 'La fecha de antigüedad en el puesto no puede ser posterior a la del accidente %s.';
  Msg_10 = 'La cantidad de meses en el puesto es incorrecta.';
NOMsg_11 = 'La fecha de baja médica no puede ser posterior a la de hoy %s.';
NOMsg_12 = 'La fecha de baja médica no puede ser anterior a la fecha del accidente/recaída %s.';
NOMsg_13 = 'La fecha de baja médica no puede ser posterior a la de alta %s.';
NOMsg_14 = 'La fecha de recepción no puede ser anterior a la fecha de baja médica %s.';
  Msg_15 = 'La fecha de denuncia debe ser anterior a la fecha de recepción %s.';
}
begin
//  IniciarEspera('Validando...');
  try
    inherited;
    Verificar(fraDE_IDGRAVEDAD_CIE10.IsEmpty and fraDE_IDDIAGNOSTICO.IsSelected, fraDE_IDGRAVEDAD_CIE10.edCodigo, Msg_01);
    Verificar(Trim(edDE_DESCRIPCION.Text) = '', edDE_DESCRIPCION, Msg_02);
    Verificar(edDE_FECHARECEPCION.Date = 0, edDE_FECHARECEPCION, Msg_03);
    Verificar(edDE_FECHARECEPCION.Date > dHoy, edDE_FECHARECEPCION, Format(Msg_04, [DateToStr(dHoy)]));
    Verificar(edDE_FECHARECEPCION.Date < FechaAccidenteRecaida, edDE_FECHARECEPCION, Format(Msg_06, [DateToStr(FechaAccidenteRecaida)]));
    Verificar((sdqDatos.State = dsEdit) and (edDE_FECHARECEPCION.Date > sdqDatosDE_FECHAALTA.AsDateTime), edDE_FECHARECEPCION, Format(Msg_07, [sdqDatosDE_FECHAALTA.AsString]));
    Verificar((FechaRecepcion = 0) and (edDE_FECHARECEPCION.Date > FechaAlta), edDE_FECHARECEPCION, Format(Msg_05, [DateToStr(FechaAlta)]));
    Verificar(edDE_ANTIGUEDADPUESTO.Date > dHoy, edDE_ANTIGUEDADPUESTO, Format(Msg_08, [DateToStr(dHoy)]));
    Verificar(edDE_ANTIGUEDADPUESTO.Date > FechaAccidente, edDE_ANTIGUEDADPUESTO, Format(Msg_09, [DateToStr(FechaAccidente)]));
    Verificar(not VarIsNull(edDE_MESESPUESTO.Field.Value) and (edDE_MESESPUESTO.Field.Value > 11), edDE_MESESPUESTO, Msg_10);
//    Verificar((edDE_FECHADENUNCIA.Date <> 0) and (edDE_FECHADENUNCIA.Date > edDE_FECHARECEPCION.Date), edDE_FECHADENUNCIA, Format(Msg_15, [DateToStr(edDE_FECHARECEPCION.Date)]));
    Verificar(chkInternado.Checked and fraDE_IDPRESTADOR.IsEmpty, fraDE_IDPRESTADOR.cmbCA_DESCRIPCION, Msg_60);
    Verificar((not fraDE_IDPRESTADOR.IsEmpty) and chkInternado.Checked and (fraDE_IDPRESTADOR.CUIT = cNroCuitART), fraDE_IDPRESTADOR.cmbCA_DESCRIPCION, Msg_63);
    fraSDA_DETALLEARCHIVO.Validate;
  finally
//    DetenerEspera;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDenuncia.dsDatosUpdateData(Sender: TObject);
begin
  inherited;
  with sdqDatos do
  begin
    FieldByName('USUARIO').AsString := Sesion.UserID;
    FieldByName('DE_HORJORNADA1DESDE').AsString := edDE_HORJORNADA1DESDE.EditText;
    FieldByName('DE_HORJORNADA1HASTA').AsString := edDE_HORJORNADA1HASTA.EditText;
    FieldByName('DE_HORJORNADA2DESDE').AsString := edDE_HORJORNADA2DESDE.EditText;
    FieldByName('DE_HORJORNADA2HASTA').AsString := edDE_HORJORNADA2HASTA.EditText;

    with fraDomicilioEstablecimiento do
    begin
      FieldByName('DE_UBICACION_CALLE').AsString        := Calle;
      FieldByName('DE_UBICACION_NUMERO').AsString       := IIF(Numero = 'S/N', '', Numero);
      FieldByName('DE_UBICACION_PISO').AsString         := Piso;
      FieldByName('DE_UBICACION_DEPARTAMENTO').AsString := Departamento;
      FieldByName('DE_UBICACION_CPOSTAL').AsString      := CodigoPostal;
      FieldByName('DE_UBICACION_CPOSTALA').AsString     := CPA;
//      FieldByName('DE_UBICACION_LOCALIDAD').AsString    := IIF(edCPostal.Text = '', '', Localidad);
      FieldByName('DE_UBICACION_PROVINCIA').AsString    := IIF(Prov = -1, '', IntToStr(Prov));

      if rgEstablecimiento.ItemIndex > 0 then
        FieldByName('DE_UBICACION_LOCALIDAD').AsString  := IIF(CodigoPostal = '', '', Localidad)
      else
        FieldByName('DE_UBICACION_LOCALIDAD').AsString  := Localidad;
    end;

    with fraDomicilioDenuncia do
    begin
      FieldByName('DE_ITINERE_COM_CALLE').AsString        := Calle;
      FieldByName('DE_ITINERE_COM_NUMERO').AsString       := IIF(Numero = 'S/N', '', Numero);
      FieldByName('DE_ITINERE_COM_PISO').AsString         := Piso;
      FieldByName('DE_ITINERE_COM_DEPARTAMENTO').AsString := Departamento;
      FieldByName('DE_ITINERE_COM_CPOSTAL').AsString      := CodigoPostal;
      FieldByName('DE_ITINERE_COM_CPOSTALA').AsString     := CPA;
      FieldByName('DE_ITINERE_COM_LOCALIDAD').AsString    := IIF(CodigoPostal = '', '', Localidad);
      FieldByName('DE_ITINERE_COM_PROVINCIA').AsString    := IIF(Prov = -1, '', IntToStr(Prov));
    end;

    FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').Value := fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value;
    FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
    FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;
  end;
end;

procedure TfrmDenuncia.edDE_HORJORNADA1DESDEExit(Sender: TObject);
begin
  edDE_HORJORNADA1HASTA.MinTime := edDE_HORJORNADA1DESDE.Time;
end;

procedure TfrmDenuncia.edDE_HORJORNADA1HASTAExit(Sender: TObject);
begin
  edDE_HORJORNADA1DESDE.MaxTime := edDE_HORJORNADA1HASTA.Time;
end;

procedure TfrmDenuncia.edDE_HORJORNADA2DESDEExit(Sender: TObject);
begin
  edDE_HORJORNADA2HASTA.MinTime := edDE_HORJORNADA2DESDE.Time;
end;

procedure TfrmDenuncia.edDE_HORJORNADA2HASTAExit(Sender: TObject);
begin
  edDE_HORJORNADA2DESDE.MaxTime := edDE_HORJORNADA2HASTA.Time;
end;

procedure TfrmDenuncia.rgEstablecimientoChange(Sender: TObject);
  procedure LimpiarInterno;
  begin
    with sdqDatos do
    begin
      FieldByName('DE_UBICACION_ESTABLECIMIENTO').Clear;
      FieldByName('DE_UBICACION_NOMBRE').Clear;
      FieldByName('DE_UBICACION_CODAREATELEFONOS').Clear;
      FieldByName('DE_UBICACION_TELEFONOS').Clear;
      FieldByName('DE_UBICACION_PAIS').Clear;
    end;
{
    fraDomicilioEstablecimiento.Clear;
    edDE_UBICACION_NOMBRE.Clear;
    edDE_UBICACION_CODAREATELEFONOS.Clear;
    edDE_UBICACION_TELEFONOS.Clear;
    fraDE_UBICACION_PAIS.Clear;
}    
  end;
var
  sSQL: string;
  iEstablecimiento: TTableID;
begin
  if sdqDatos.State in [dsInsert, dsEdit] then
    VCLExtra.LockControls([edDE_UBICACION_NOMBRE,
                           edDE_UBICACION_CODAREATELEFONOS,
                           edDE_UBICACION_TELEFONOS,
                           fraDE_UBICACION_PAIS,
                           fraDomicilioEstablecimiento], rgEstablecimiento.ItemIndex <> 1);

  case rgEstablecimiento.ItemIndex of
    0: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           iEstablecimiento := GetIdEstablecimiento(ValorSqlIntegerEx('SELECT ART.AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE) FROM SEX_EXPEDIENTES WHERE EX_ID = :ID', [IDExpediente]));
           sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').AsInteger := iEstablecimiento;
         end else
           iEstablecimiento := sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').AsInteger;

         sSQL := 'SELECT A.*, PV_DESCRIPCION FROM AES_ESTABLECIMIENTO A, CPV_PROVINCIAS WHERE PV_CODIGO = ES_PROVINCIA AND ES_ID = :ID_ESTABLECIMIENTO';

         //DIRECCION A LA ANTIGUA...
         with GetQueryEx(sSQL, [iEstablecimiento]), fraDomicilioEstablecimiento do
         begin
           edDE_UBICACION_NOMBRE.Text           := FieldByName('ES_NOMBRE').AsString;
           edDE_UBICACION_CODAREATELEFONOS.Text := FieldByName('ES_CODAREATELEFONOS').AsString;
           edDE_UBICACION_TELEFONOS.Text        := FieldByName('ES_TELEFONOS').AsString;
           fraDE_UBICACION_PAIS.Codigo          := '054';

           Calle        := FieldByName('ES_CALLE').AsString;
           Localidad    := FieldByName('ES_LOCALIDAD').AsString;
           Prov         := StrToIntDef(FieldByName('ES_PROVINCIA').AsString, -1);
           Provincia    := FieldByName('PV_DESCRIPCION').AsString;
           Numero       := IIF(FieldByName('ES_NUMERO').IsNull, 'S/N', FieldByName('ES_NUMERO').AsString);
           Piso         := FieldByName('ES_PISO').AsString;
           Departamento := FieldByName('ES_DEPARTAMENTO').AsString;
           CodigoPostal := FieldByName('ES_CPOSTAL').AsString;
           CPA          := FieldByName('ES_CPOSTALA').AsString;
         end;
       end;
    1: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           LimpiarInterno;
           if edDE_UBICACION_NOMBRE.CanFocus then
             edDE_UBICACION_NOMBRE.SetFocus;
         end;
       end;
    2: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
           LimpiarInterno;
       end;
  end;
end;

procedure TfrmDenuncia.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([edDE_UBICACION_NOMBRE,
                         edDE_UBICACION_CODAREATELEFONOS,
                         edDE_UBICACION_TELEFONOS,
                         fraDE_UBICACION_PAIS,
                         edDE_ITINERE_TESTIGO1_NOMBRE,
                         edDE_ITINERE_TESTIGO1_DOMICILIO,
                         edDE_ITINERE_TESTIGO1_TELEFONOS,
                         edDE_ITINERE_TESTIGO2_NOMBRE,
                         edDE_ITINERE_TESTIGO2_DOMICILIO,
                         edDE_ITINERE_TESTIGO2_TELEFONOS,
                         edDE_ITINERE_TERCERO_RESP_NOMBRE,
                         edDE_ITINERE_TERCERO_RESP_DOM,
                         edDE_ITINERE_TERCERO_RESP_TEL,
                         edDE_ITINERE_COMISARIA,
                         edDE_ITINERE_NRODENUNCIA,
                         edDE_ITINERE_COM_TELEFONOS,
                         fraDomicilioDenuncia], Value);
end;

procedure TfrmDenuncia.edDE_UBICACION_CUITOCURREChange(Sender: TObject);
begin
  lbValidacionCUIT.Caption := '';
  if (Length(Trim(edDE_UBICACION_CUITOCURRE.Text)) = 11) and IsCuit(edDE_UBICACION_CUITOCURRE.Text) then
  begin
    lbValidacionCUIT.Caption := 'El número de CUIT ingresado es correcto.';
    lbValidacionCUIT.Font.Color := clTeal;
  end else
  if (Length(Trim(edDE_UBICACION_CUITOCURRE.Text)) > 0) then
  begin
    lbValidacionCUIT.Caption := 'El número de CUIT ingresado es incorrecto.';
    lbValidacionCUIT.Font.Color := clMaroon;
  end;
end;

procedure TfrmDenuncia.rgDenunciaPolicialChange(Sender: TObject);
  procedure LimpiarInterno;
  begin
  {
    fraDomicilioDenuncia.Clear;
    edDE_ITINERE_COMISARIA.Clear;
    edDE_ITINERE_NRODENUNCIA.Clear;
    edDE_ITINERE_COM_TELEFONOS.Clear;
    edDE_ITINERE_TESTIGO1_NOMBRE.Clear;
    edDE_ITINERE_TESTIGO1_DOMICILIO.Clear;
    edDE_ITINERE_TESTIGO1_TELEFONOS.Clear;
    edDE_ITINERE_TESTIGO2_NOMBRE.Clear;
    edDE_ITINERE_TESTIGO2_DOMICILIO.Clear;
    edDE_ITINERE_TESTIGO2_TELEFONOS.Clear;
    edDE_ITINERE_TERCERO_RESP_NOMBRE.Clear;
    edDE_ITINERE_TERCERO_RESP_DOM.Clear;
    edDE_ITINERE_TERCERO_RESP_TEL.Clear;
   }
    with sdqDatos do
    begin
      FieldByName('DE_ITINERE_COMISARIA').Clear;
      FieldByName('DE_ITINERE_NRODENUNCIA').Clear;
      FieldByName('DE_ITINERE_COM_TELEFONOS').Clear;
      FieldByName('DE_ITINERE_TESTIGO1_NOMBRE').Clear;
      FieldByName('DE_ITINERE_TESTIGO1_DOMICILIO').Clear;
      FieldByName('DE_ITINERE_TESTIGO1_TELEFONOS').Clear;
      FieldByName('DE_ITINERE_TESTIGO2_NOMBRE').Clear;
      FieldByName('DE_ITINERE_TESTIGO2_DOMICILIO').Clear;
      FieldByName('DE_ITINERE_TESTIGO2_TELEFONOS').Clear;
      FieldByName('DE_ITINERE_TERCERO_RESP_NOMBRE').Clear;
      FieldByName('DE_ITINERE_TERCERO_RESP_DOM').Clear;
      FieldByName('DE_ITINERE_TERCERO_RESP_TEL').Clear;
    end;
  end;
begin
  if sdqDatos.State in [dsInsert, dsEdit] then
    VCLExtra.LockControls([edDE_ITINERE_TESTIGO1_NOMBRE,
                           edDE_ITINERE_TESTIGO1_DOMICILIO,
                           edDE_ITINERE_TESTIGO1_TELEFONOS,
                           edDE_ITINERE_TESTIGO2_NOMBRE,
                           edDE_ITINERE_TESTIGO2_DOMICILIO,
                           edDE_ITINERE_TESTIGO2_TELEFONOS,
                           edDE_ITINERE_TERCERO_RESP_NOMBRE,
                           edDE_ITINERE_TERCERO_RESP_DOM,
                           edDE_ITINERE_TERCERO_RESP_TEL,
                           edDE_ITINERE_COMISARIA,
                           edDE_ITINERE_NRODENUNCIA,
                           edDE_ITINERE_COM_TELEFONOS,
                           fraDomicilioDenuncia], rgDenunciaPolicial.ItemIndex <> 0);

  case rgDenunciaPolicial.ItemIndex of
    0: begin
         if (sdqDatos.State in [dsInsert, dsEdit]) and edDE_ITINERE_NRODENUNCIA.CanFocus then
           edDE_ITINERE_NRODENUNCIA.SetFocus;
       end;
    1: begin
         if sdqDatos.State in [dsInsert, dsEdit] then
         begin
           LimpiarInterno;
           sdqDatos.FieldByName('DE_UBICACION_ESTABLECIMIENTO').Value := null;
         end;
       end;
  end;
end;

procedure TfrmDenuncia.fraDomicilioEstablecimientoedCPostalChange(Sender: TObject);
begin
  inherited;
  fraUD_SECUENCIA_PARTIDOLOCALIDAD.CodigoPostal := TIntEdit(Sender).Value;
end;

procedure TfrmDenuncia.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with sdqDatos do
  begin
    edDE_HORJORNADA1DESDE.EditText         := FieldByName('DE_HORJORNADA1DESDE').AsString;
    edDE_HORJORNADA1HASTA.EditText         := FieldByName('DE_HORJORNADA1HASTA').AsString;
    edDE_HORJORNADA2DESDE.EditText         := FieldByName('DE_HORJORNADA2DESDE').AsString;
    edDE_HORJORNADA2HASTA.EditText         := FieldByName('DE_HORJORNADA2HASTA').AsString;
    fraUD_SECUENCIA_PARTIDOLOCALIDAD.Value := FieldByName('UD_SECUENCIA_PARTIDOLOCALIDAD').AsInteger;
  end;

  with sdqDatos, fraDomicilioEstablecimiento do
  begin
    Calle        := FieldByName('DE_UBICACION_CALLE').AsString;
    Numero       := IIF(FieldByName('DE_UBICACION_NUMERO').IsNull, 'S/N', FieldByName('DE_UBICACION_NUMERO').AsString);
    Piso         := FieldByName('DE_UBICACION_PISO').AsString;
    Departamento := FieldByName('DE_UBICACION_DEPARTAMENTO').AsString;
    CodigoPostal := FieldByName('DE_UBICACION_CPOSTAL').AsString;
    CPA          := FieldByName('DE_UBICACION_CPOSTALA').AsString;
    Localidad    := FieldByName('DE_UBICACION_LOCALIDAD').AsString;
    Prov         := StrToIntDef(FieldByName('DE_UBICACION_PROVINCIA').AsString, -1);
    Provincia    := FieldByName('PROV_1').AsString;
  end;

  with sdqDatos, fraDomicilioDenuncia do
  begin
    Calle        := FieldByName('DE_ITINERE_COM_CALLE').AsString;
    Numero       := IIF(FieldByName('DE_ITINERE_COM_NUMERO').IsNull, 'S/N', FieldByName('DE_ITINERE_COM_NUMERO').AsString);
    Piso         := FieldByName('DE_ITINERE_COM_PISO').AsString;
    Departamento := FieldByName('DE_ITINERE_COM_DEPARTAMENTO').AsString;
    CodigoPostal := FieldByName('DE_ITINERE_COM_CPOSTAL').AsString;
    CPA          := FieldByName('DE_ITINERE_COM_CPOSTALA').AsString;
    Localidad    := FieldByName('DE_ITINERE_COM_LOCALIDAD').AsString;
    Prov         := StrToIntDef(FieldByName('DE_ITINERE_COM_PROVINCIA').AsString, -1);
    Provincia    := FieldByName('PROV_2').AsString;
  end;
end;

procedure TfrmDenuncia.Clear;
begin
  inherited;
  fraDomicilioDenuncia.Clear;
  fraDomicilioEstablecimiento.Clear;
end;

end.
