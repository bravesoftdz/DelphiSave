
{********************************************************}
{                                                        }
{    Denuncias Graves                                    }
{    Formulario para ser mostrado desde la administracón }
{    de siniestros, del módulo de siniestros.            }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  01/05/2004                                  }
{                                                        }
{********************************************************}

unit unDenunciaGrave;

interface

uses
  {$IFNDEF VER130}Variants,{$ENDIF}
  {$IFDEF VER180}
  rxToolEdit,
  rxPlacemnt,
  {$ELSE}
  ToolEdit,
  Placemnt,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unAdmSiniestros, unArtFrame, unArtDbFrame, unfraCPR_PRESTADOR, StdCtrls,
  ExtCtrls, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unArt, Db,
  SDEngine, Buttons, Mask, PatternEdit, ComboEditor, DBComboGrid,
  DateTimeEditors, DBCtrls, unArtDBAwareFrame, unSinForm,
  unSinFormNavigator, DBPatternEdit, DateComboBox,
  unFraSDA_DETALLEARCHIVO, unFraStaticCodDesc, unFraSTG_TIPOGRAVEDAD,
  artSeguridad, XPMenu, JvgGroupBox, ShortCutControl,
  unFraSMC_MOTIVONOCARGA, unFraSLZ_LESIONZONA, unFraSLN_LESIONNATURALEZA,
  unFraSLA_LESIONAGENTE, unFraSLF_LESIONFORMA, unFraSTC_TIPOGRAVEDAD_CIE10,
  unFraCDG_DIAGNOSTICO, unFraCCI_CIUO, RXDBCtrl, JvExMask, JvToolEdit,
  JvMaskEdit, JvDBControls, unFraPrestadorFueraDeContrato, ActnList,
  unFraSLM_LESIONAGENTEMATERIAL, unFraCodigoDescripcion, unFraCodDesc,
  ComCtrls, ToolWin;

type
  TfrmDenunciaGrave = class(TSinFormNavigator)
    ShortCutControl: TShortCutControl;
    gbPrestador: TJvgGroupBox;
    fraDG_IDPRESTADOR: TfraPrestadorFueraDeContrato;
    sdqDatosDG_ID: TFloatField;
    sdqDatosDG_IDEXPEDIENTE: TFloatField;
    sdqDatosDG_NROPARTE: TFloatField;
    sdqDatosDG_NRODENUNCIASRT: TStringField;
    sdqDatosDG_TAREAHABITUAL: TFloatField;
    sdqDatosDG_TAREAACCIDENTE: TFloatField;
    sdqDatosDG_EMPLEADOSAFECT: TFloatField;
    sdqDatosDG_ANTIGUEDADPUESTO: TDateTimeField;
    sdqDatosDG_ANIOSPUESTO: TFloatField;
    sdqDatosDG_MESESPUESTO: TFloatField;
    sdqDatosDG_IDGRAVEDAD: TFloatField;
    sdqDatosDG_DESCRIPCION: TStringField;
    sdqDatosDG_DIAGNOSTICO: TStringField;
    sdqDatosDG_IDDIAGNOSTICO: TFloatField;
    sdqDatosDG_IDLESIONFORMA: TFloatField;
    sdqDatosDG_IDLESIONAGENTE: TFloatField;
    sdqDatosDG_IDLESIONNATURALEZA: TFloatField;
    sdqDatosDG_IDLESIONZONA: TFloatField;
    sdqDatosDG_HORJORNADA1DESDE: TDateTimeField;
    sdqDatosDG_HORJORNADA1HASTA: TDateTimeField;
    sdqDatosDG_HORJORNADA2DESDE: TDateTimeField;
    sdqDatosDG_HORJORNADA2HASTA: TDateTimeField;
    sdqDatosDG_IDPRESTADOR: TFloatField;
    sdqDatosDG_EPMANIFESTACION: TDateTimeField;
    sdqDatosDG_EPEXPUESTODESDE: TDateTimeField;
    sdqDatosDG_OBSERVACIONES: TStringField;
    sdqDatosDG_FECHAPRIMERAATENCION: TDateTimeField;
    sdqDatosDG_UBICACIONACCIDENTADO: TStringField;
    sdqDatosDG_UCOUTI: TStringField;
    sdqDatosDG_FECHARECEPCION: TDateTimeField;
    sdqDatosDG_FECHAALTA: TDateTimeField;
    sdqDatosUSUARIO: TStringField;
    sdqDatosDG_FECHABAJA: TDateTimeField;
    gbLaboral: TJvgGroupBox;
    gbDiagnostico: TJvgGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    fraDG_IDDIAGNOSTICO: TfraCDG_DIAGNOSTICO;
    fraDG_IDGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;
    edDG_DIAGNOSTICO: TDBMemo;
    gbArchivo: TJvgGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO;
    edDG_FECHARECEPCION: TDBDateEdit;
    edSector: TDBEdit;
    edDG_FECHAALTA: TDBDateEdit;
    Label10: TLabel;
    sdqDatosSE_SECTOR: TStringField;
    edDG_NRODENUNCIASRT: TJvDBMaskEdit;
    Label15: TLabel;
    sdqDatosDG_FECHAMODIF: TDateTimeField;
    sdqDatosDG_PRESTADOR_NOMBRE: TStringField;
    sdqDatosDG_PRESTADOR_TELEFONOS: TStringField;
    sdqDatosDG_PRESTADOR_CALLE: TStringField;
    sdqDatosDG_PRESTADOR_NUMERO: TStringField;
    sdqDatosDG_PRESTADOR_PISO: TStringField;
    sdqDatosDG_PRESTADOR_DEPARTAMENTO: TStringField;
    sdqDatosDG_PRESTADOR_LOCALIDAD: TStringField;
    sdqDatosDG_PRESTADOR_CPOSTAL: TStringField;
    sdqDatosDG_PRESTADOR_CPOSTALA: TStringField;
    sdqDatosDG_PRESTADOR_PROVINCIA: TStringField;
    sdqDatosDG_IDGRAVEDAD_CIE10: TFloatField;
    sdqDatosDG_IDMOTIVONOCARGA: TFloatField;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    sdqDatosDG_IDLESIONAGENTEMATERIAL: TFloatField;
    fraDG_IDGRAVEDAD: TfraSTG_TIPOGRAVEDAD;
    Label33: TLabel;
    Label34: TLabel;
    edDG_OBSERVACIONES: TDBMemo;
    Label7: TLabel;
    edDG_FECHAPRIMERAATENCION: TDBDateEdit;
    gbModificacionesSRT: TJvgGroupBox;
    Label3: TLabel;
    edDG_FECHAMODIFSRT1: TDBDateEdit;
    fraDG_TIPOMODIFSRT1: TfraCodDesc;
    Label4: TLabel;
    edDG_TIPOMODIFSRT_OTROS1: TDBEdit;
    Label5: TLabel;
    sdqDatosDG_FECHAMODIFSRT1: TDateTimeField;
    sdqDatosDG_FECHAMODIFSRT2: TDateTimeField;
    sdqDatosDG_FECHAMODIFSRT3: TDateTimeField;
    sdqDatosDG_FECHAMODIFSRT4: TDateTimeField;
    sdqDatosDG_FECHAMODIFSRT5: TDateTimeField;
    sdqDatosDG_TIPOMODIFSRT1: TFloatField;
    sdqDatosDG_TIPOMODIFSRT2: TFloatField;
    sdqDatosDG_TIPOMODIFSRT3: TFloatField;
    sdqDatosDG_TIPOMODIFSRT4: TFloatField;
    sdqDatosDG_TIPOMODIFSRT5: TFloatField;
    sdqDatosDG_TIPOMODIFSRT_OTROS1: TStringField;
    sdqDatosDG_TIPOMODIFSRT_OTROS2: TStringField;
    sdqDatosDG_TIPOMODIFSRT_OTROS3: TStringField;
    sdqDatosDG_TIPOMODIFSRT_OTROS4: TStringField;
    sdqDatosDG_TIPOMODIFSRT_OTROS5: TStringField;
    fraDG_TIPOMODIFSRT2: TfraCodDesc;
    Label6: TLabel;
    edDG_FECHAMODIFSRT2: TDBDateEdit;
    Label9: TLabel;
    Label11: TLabel;
    edDG_TIPOMODIFSRT_OTROS2: TDBEdit;
    fraDG_TIPOMODIFSRT3: TfraCodDesc;
    Label12: TLabel;
    edDG_FECHAMODIFSRT3: TDBDateEdit;
    Label13: TLabel;
    Label14: TLabel;
    edDG_TIPOMODIFSRT_OTROS3: TDBEdit;
    fraDG_TIPOMODIFSRT4: TfraCodDesc;
    Label16: TLabel;
    edDG_FECHAMODIFSRT4: TDBDateEdit;
    Label17: TLabel;
    Label18: TLabel;
    edDG_TIPOMODIFSRT_OTROS4: TDBEdit;
    Label19: TLabel;
    edDG_FECHAMODIFSRT5: TDBDateEdit;
    Label20: TLabel;
    Label21: TLabel;
    edDG_TIPOMODIFSRT_OTROS5: TDBEdit;
    fraDG_TIPOMODIFSRT5: TfraCodDesc;
    tbNotaExtemp: TToolBar;
    btnNotaExtemporaneos: TToolButton;
    edDG_FECHAMAIL_NOTA: TDBDateEdit;
    edDG_FECHAIMPRESION_NOTA: TDBDateEdit;
    Label22: TLabel;
    sdqDatosDG_FECHAMAIL_NOTA: TDateTimeField;
    sdqDatosDG_FECHAIMPRESION_NOTA: TDateTimeField;
    Label23: TLabel;
    Bevel1: TBevel;
    Label24: TLabel;
    Label25: TLabel;
    sdqDatosDG_IDDIAGNOSTICO2: TFloatField;
    fraDG_IDDIAGNOSTICO2: TfraCDG_DIAGNOSTICO;
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure dsDatosUpdateData(Sender: TObject);
    procedure dsDatosDataChange(Sender: TObject; Field: TField);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure FSFormCreate(Sender: TObject);
    procedure Validar(DataSet: TDataSet);
    procedure edNroOrdenValueChange(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT1cmbDescripcionCloseUp(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT2cmbDescripcionCloseUp(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT3cmbDescripcionCloseUp(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT4cmbDescripcionCloseUp(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT5cmbDescripcionCloseUp(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT1edCodigoExit(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT2edCodigoExit(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT3edCodigoExit(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT4edCodigoExit(Sender: TObject);
    procedure fraDG_TIPOMODIFSRT5edCodigoExit(Sender: TObject);
    procedure edDG_FECHAMODIFSRT1Exit(Sender: TObject);
    procedure edDG_FECHAMODIFSRT2Exit(Sender: TObject);
    procedure edDG_FECHAMODIFSRT3Exit(Sender: TObject);
    procedure edDG_FECHAMODIFSRT4Exit(Sender: TObject);
    procedure btnNotaExtemporaneosClick(Sender: TObject);
  private
    procedure Bajas(AValue: Boolean);
    procedure Do_Habilitacion_ModificSRT; // TK 26177
    function Hay_MasDeUnObito: boolean;   // TK 26177
  protected
    procedure SetLocked(const Value: Boolean); override;
    function  GetAddButtonVisible: boolean; override;
  public
    procedure LoadData; override;
    function  Save: Boolean; override;
    procedure Cancel(ASinPreguntar: Boolean = False); override;
    procedure Edit; override;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, SqlFuncs, AnsiSql, DBSql, DBFuncs, DateUtils,
  VCLExtra, Math, DateTimeFuncs, unSiniestros, CustomDlgs, unSesion,
  General, unRptNotaDenunciaGrave;

const
  cTIPOMODSRT_OTROS  = '6';  // TK 26177
  cTIPOMODSRT_DENINICIAL = '1';
  cTIPOMODSRT_ALTAINTERN = '2';
  cTIPOMODSRT_DERIVACION = '3';
  cTIPOMODSRT_OBITO      = '5';

{$R *.DFM}

procedure TfrmDenunciaGrave.LoadData;
begin
  fraSDA_DETALLEARCHIVO.Clear;
  Bajas(True);
  edNroOrden.Clear;
  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  if not sdqDatos.IsEmpty then
    sdqDatos.Last;

  LockControls(tbNotaExtemp, not (Seguridad.Activar(tbNotaExtemp) and (not sdqDatos.IsEmpty) and sdqDatosDG_FECHABAJA.IsNull));
end;

function TfrmDenunciaGrave.Save: Boolean;
const
  PORC_EST = 10;
var
  NextID: Integer;
begin
  Result := False;
  NextID := ART_EMPTY_ID;

  if sdqDatos.Active then
  begin
    vPK := sdqDatos.FieldByName(sPrefix + '_ID').Value;
    if CanSaveCancel then
    begin
      fraDG_IDPRESTADOR.Change;
      sdqDatos.Post;
    end;

    with TDataCycler.Create(sdqDatos) do
    try
      repeat
        if sdqDatos.FieldByName('DG_ID').AsInteger = ART_EMPTY_ID then
        begin
          sdqDatos.Edit;
          NextID := GetSecNextVal('SIN.SEQ_SDG_ID');
          sdqDatos.FieldByName('DG_ID').AsInteger := NextID;
          sdqDatos.Post;
        end;
      until not Cycle;
    finally
      Free;
    end;

    Result := inherited Save;

    if (Result = true) and ((fraDG_IDGRAVEDAD.Codigo <> '5') and
       (valorsqlex('SELECT nvl(substr(inca.get_incaauto(:sin, :ord, :rec), 11, length(inca.get_incaauto(:sin, :ord, :rec)) - 10), 0) FROM dual',
                   [Siniestro, Orden, Recaida, Siniestro, Orden, Recaida]) = 0)) then
    begin
      EjecutarSqlEx(' begin inca.do_generarestimacionaut (:sin, :ord, :porc, :usu, :cie10, ''G''); end;', [Siniestro, Orden, PORC_EST, Sesion.UserID, fraDG_IDDIAGNOSTICO.Codigo]);
      EjecutarSqlEx(' update SIN.SDG_DENUNCIAGRAVE ' +
                       ' set dg_porcincapacidad = :porc ' +
                     ' where dg_id = :idden ', [PORC_EST, NextID]);
    end;  
  end;
end;

procedure TfrmDenunciaGrave.sdqDatosNewRecord(DataSet: TDataSet);
var
  sSQL: string;
begin
  LockControls(tbNotaExtemp, True);
  with DataSet do
  begin
    Bajas(False);

    VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS1, edDG_TIPOMODIFSRT_OTROS2, edDG_TIPOMODIFSRT_OTROS3,
                           edDG_TIPOMODIFSRT_OTROS4, edDG_TIPOMODIFSRT_OTROS5], true);    // TK 26177
    VCLExtra.LockControls([edDG_FECHAMODIFSRT2, edDG_FECHAMODIFSRT3, edDG_FECHAMODIFSRT4, edDG_FECHAMODIFSRT5], true);
    VCLExtra.LockControls([fraDG_TIPOMODIFSRT2, fraDG_TIPOMODIFSRT3, fraDG_TIPOMODIFSRT4, fraDG_TIPOMODIFSRT5], true);

    FieldByName('DG_ID').AsInteger := ART_EMPTY_ID;
    FieldByName('DG_NROPARTE').AsInteger := iNewParte;
    FieldByName('DG_IDEXPEDIENTE').AsInteger := FIdExpediente;
    FieldByName('USUARIO').AsString := Sesion.UserID;
    FieldByName('DG_FECHAALTA').AsDateTime := dHoy;

    VCLExtra.LockControls(edDG_NRODENUNCIASRT, iNewParte > 1);
    FieldByName('DG_NRODENUNCIASRT').AsString := ValorSQLEx('SELECT DG_NRODENUNCIASRT ' +
                                                              'FROM SIN.SDG_DENUNCIAGRAVE ' +
                                                             'WHERE DG_IDEXPEDIENTE = :ID ' +
                                                               'AND DG_NROPARTE = 1', [FIdExpediente]);

    sSQL := 'SELECT NVL(PI_IDLESIONFORMA, DE_IDLESIONFORMA) FORMA, ' +
                   'NVL(PI_IDLESIONAGENTE, DE_IDLESIONAGENTE) AGENTE, ' +
                   'NVL(PI_IDLESIONNATURALEZA, DE_IDLESIONNATURALEZA) NATURALEZA, ' +
                   'NVL(PI_IDLESIONZONA, DE_IDLESIONZONA) ZONA, ' +
                   'NVL(PI_DIAGNOSTICO, DE_DIAGNOSTICO) DIAGNOSTICO, ' +
                   'NVL(PI_IDDIAGNOSTICO, DE_IDDIAGNOSTICO) IDDIAGNOSTICO, ' +
                   'NVL(PI_IDGRAVEDAD_CIE10, DE_IDGRAVEDAD_CIE10) IDGRAVEDAD_CIE10, ' +
                   'NVL(PI_IDPRESTADOR, DE_IDPRESTADOR) IDPRESTADOR ' +
              'FROM SIN.SPI_PARTEDEINGRESO, SIN.SDE_DENUNCIA, ART.SEX_EXPEDIENTES ' +
             'WHERE PI_IDEXPEDIENTE (+) = EX_ID ' +
               'AND DE_IDEXPEDIENTE (+) = EX_ID ' +
               'AND EX_ID               = :ID';

    with GetQueryEx(sSQL, [FIdExpediente]) do
    try
      if not IsEmpty then
      begin
        sdqDatos.FieldByName('DG_IDLESIONFORMA').Value          := FieldByName('FORMA').Value;
        sdqDatos.FieldByName('DG_IDLESIONAGENTEMATERIAL').Value := FieldByName('AGENTE').Value;
        sdqDatos.FieldByName('DG_IDLESIONNATURALEZA').Value     := FieldByName('NATURALEZA').Value;
        sdqDatos.FieldByName('DG_IDLESIONZONA').Value           := FieldByName('ZONA').Value;
        sdqDatos.FieldByName('DG_DIAGNOSTICO').Value            := FieldByName('DIAGNOSTICO').Value;
        sdqDatos.FieldByName('DG_IDDIAGNOSTICO').Value          := FieldByName('IDDIAGNOSTICO').Value;
        sdqDatos.FieldByName('DG_IDGRAVEDAD_CIE10').Value       := FieldByName('IDGRAVEDAD_CIE10').Value;
        sdqDatos.FieldByName('DG_IDPRESTADOR').Value            := FieldByName('IDPRESTADOR').Value;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmDenunciaGrave.SetLocked(const Value: Boolean);
begin
  inherited;
  LockControl(edDG_FECHAALTA, True);
end;

procedure TfrmDenunciaGrave.dsDatosUpdateData(Sender: TObject);
  procedure SetDateTime(AField: string; ADateTime: TDateTime);
  begin
    if ADateTime = 0 then
      sdqDatos.FieldByName(AField).Value := Null
    else
      sdqDatos.FieldByName(AField).AsDateTime := ADateTime;
  end;
begin
  inherited;

  SetDateTime('DG_FECHAPRIMERAATENCION', edDG_FECHAPRIMERAATENCION.Date);

  with sdqDatos do
  begin
    FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
    FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;
    FieldByName('DG_TIPOMODIFSRT1').AsInteger := fraDG_TIPOMODIFSRT1.Value;
    FieldByName('DG_TIPOMODIFSRT2').AsInteger := fraDG_TIPOMODIFSRT2.Value;
    FieldByName('DG_TIPOMODIFSRT3').AsInteger := fraDG_TIPOMODIFSRT3.Value;
    FieldByName('DG_TIPOMODIFSRT4').AsInteger := fraDG_TIPOMODIFSRT4.Value;
    FieldByName('DG_TIPOMODIFSRT5').AsInteger := fraDG_TIPOMODIFSRT5.Value;
  end;
end;

procedure TfrmDenunciaGrave.dsDatosDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned(Field) then
  begin
    { Estos dos edits se guardan en el mismo campo: }
    if Trunc(sdqDatos.FieldByName('DG_FECHAPRIMERAATENCION').AsDateTime) > 0 then
      edDG_FECHAPRIMERAATENCION.Date := sdqDatos.FieldByName('DG_FECHAPRIMERAATENCION').AsDateTime
    else
      edDG_FECHAPRIMERAATENCION.Clear;
  end;
end;

procedure TfrmDenunciaGrave.sdqDatosAfterOpen(DataSet: TDataSet);
  procedure SetTime(AEditor: TTimeEditor; AField: string);
  begin
    with sdqDatos.FieldByName(AField) do
      if IsNull {or (sdqDatos.State in [dsInsert])} then
        AEditor.Clear
      else
        AEditor.Time := AsDateTime;
  end;
//var  FField: TField;
begin
  inherited;
  sdqDatos.FieldByName('DG_FECHAALTA').Required := False;
end;

procedure TfrmDenunciaGrave.Cancel(ASinPreguntar: Boolean = False);
begin
  inherited;
end;

procedure TfrmDenunciaGrave.Bajas(AValue: Boolean);
begin

end;

procedure TfrmDenunciaGrave.FSFormCreate(Sender: TObject);
begin
  inherited;
  sPrefix := 'DG';
  sTableName := 'SIN.SDG_DENUNCIAGRAVE';

  with fraDG_IDPRESTADOR do
  begin
    AutoSize := False;
    Anchors := Anchors + [akRight];
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'DG_IDPRESTADOR';
    PrefijoTabla := 'DG_';
  end;
  Bajas(True);
end;

procedure TfrmDenunciaGrave.Validar(DataSet: TDataSet);
var
  dFechaTope: TDateTime;
begin
  inherited;
  sdqDatos.FieldByName('USUARIO').AsString := Sesion.UserID;
  dFechaTope := dHoy + DaysInAYear(YearOf(dHoy));

  Verificar((GetAnioFromDenunciaSRT(edDG_NRODENUNCIASRT.EditText) = 0) or (GetNumeroFromDenunciaSRT(edDG_NRODENUNCIASRT.EditText) = 0),
            edDG_NRODENUNCIASRT, Msg_54);
  Verificar(ExisteSQLEx('SELECT 1 FROM SIN.SDG_DENUNCIAGRAVE WHERE DG_FECHABAJA IS NULL AND DG_NRODENUNCIASRT = :NRO AND DG_IDEXPEDIENTE <> :ID',
            [Trim(edDG_NRODENUNCIASRT.EditText), IdExpediente]), edDG_NRODENUNCIASRT, Format(Msg_65, [Trim(edDG_NRODENUNCIASRT.EditText)]));
  Verificar(GetNumeroFromDenunciaSRT(edDG_NRODENUNCIASRT.EditText) = 0, edDG_NRODENUNCIASRT, Msg_55);
  Verificar(GetAnioFromDenunciaSRT(edDG_NRODENUNCIASRT.EditText) <= 0, edDG_NRODENUNCIASRT, Format(Msg_56, [YearOf(DBDate)]));

  Verificar(fraDG_IDDIAGNOSTICO.IsSelected and fraDG_IDDIAGNOSTICO2.IsSelected and (fraDG_IDDIAGNOSTICO.Value = fraDG_IDDIAGNOSTICO2.Value), fraDG_IDDIAGNOSTICO2.edCodigo, 'No se puede declarar dos veces el mismo diagnóstico');
  Verificar((not fraDG_IDDIAGNOSTICO.IsSelected) and fraDG_IDDIAGNOSTICO2.IsSelected, fraDG_IDDIAGNOSTICO.edCodigo, Msg_80);

  Verificar(fraDG_IDGRAVEDAD_CIE10.IsEmpty and fraDG_IDDIAGNOSTICO.IsSelected, fraDG_IDGRAVEDAD_CIE10.edCodigo, Msg_01);
  Verificar(fraDG_IDGRAVEDAD.IsEmpty, fraDG_IDGRAVEDAD.edCodigo, Msg_53);
  Verificar(AreIn(fraDG_IDGRAVEDAD.Codigo, ['1','2','3']), fraDG_IDGRAVEDAD.edCodigo, Msg_64);
  Verificar(fraDG_IDPRESTADOR.IsEmpty, fraDG_IDPRESTADOR.edCA_IDENTIFICADOR, Msg_16);

  Verificar((edDG_FECHAPRIMERAATENCION.Date <> 0) and (edDG_FECHAPRIMERAATENCION.Date < FechaAccidenteRecaida), edDG_FECHAPRIMERAATENCION, Format(Msg_57, [DateToStr(FechaAccidenteRecaida)]));
  Verificar((edDG_FECHAPRIMERAATENCION.Date <> 0) and (edDG_FECHAPRIMERAATENCION.Date > dFechaTope), edDG_FECHAPRIMERAATENCION, Format(Msg_58, [DateToStr(dHoy)]));

  // TK 26177
  Verificar((not fraDG_TIPOMODIFSRT1.IsEmpty) and
            (edDG_FECHAMODIFSRT1.Date = 0) and
            (edDG_FECHAMODIFSRT1.Enabled), edDG_FECHAMODIFSRT1, 'Esta fecha no puede ser nula al tener el campo "Tipo" completo');
  Verificar((not fraDG_TIPOMODIFSRT2.IsEmpty) and
            (edDG_FECHAMODIFSRT2.Date = 0) and
            (edDG_FECHAMODIFSRT2.Enabled), edDG_FECHAMODIFSRT2, 'Esta fecha no puede ser nula al tener el campo "Tipo" completo');
  Verificar((not fraDG_TIPOMODIFSRT3.IsEmpty) and
            (edDG_FECHAMODIFSRT3.Date = 0) and
            (edDG_FECHAMODIFSRT3.Enabled), edDG_FECHAMODIFSRT3, 'Esta fecha no puede ser nula al tener el campo "Tipo" completo');
  Verificar((not fraDG_TIPOMODIFSRT4.IsEmpty) and
            (edDG_FECHAMODIFSRT4.Date = 0) and
            (edDG_FECHAMODIFSRT4.Enabled), edDG_FECHAMODIFSRT4, 'Esta fecha no puede ser nula al tener el campo "Tipo" completo');
  Verificar((not fraDG_TIPOMODIFSRT5.IsEmpty) and
            (edDG_FECHAMODIFSRT5.Date = 0) and
            (edDG_FECHAMODIFSRT5.Enabled), edDG_FECHAMODIFSRT5, 'Esta fecha no puede ser nula al tener el campo "Tipo" completo');

  Verificar((fraDG_TIPOMODIFSRT1.Codigo = cTIPOMODSRT_OTROS) and
            (edDG_TIPOMODIFSRT_OTROS1.Text = '') and
            (edDG_TIPOMODIFSRT_OTROS1.Enabled), edDG_TIPOMODIFSRT_OTROS1, 'Debe completar el campo "Otro"');
  Verificar((fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_OTROS) and
            (edDG_TIPOMODIFSRT_OTROS2.Text = '') and
            (edDG_TIPOMODIFSRT_OTROS2.Enabled), edDG_TIPOMODIFSRT_OTROS2, 'Debe completar el campo "Otro"');
  Verificar((fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_OTROS) and
            (edDG_TIPOMODIFSRT_OTROS3.Text = '') and
            (edDG_TIPOMODIFSRT_OTROS3.Enabled), edDG_TIPOMODIFSRT_OTROS3, 'Debe completar el campo "Otro"');
  Verificar((fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_OTROS) and
            (edDG_TIPOMODIFSRT_OTROS4.Text = '') and
            (edDG_TIPOMODIFSRT_OTROS4.Enabled), edDG_TIPOMODIFSRT_OTROS4, 'Debe completar el campo "Otro"');
  Verificar((fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_OTROS) and
            (edDG_TIPOMODIFSRT_OTROS5.Text = '') and
            (edDG_TIPOMODIFSRT_OTROS5.Enabled), edDG_TIPOMODIFSRT_OTROS5, 'Debe completar el campo "Otro"');

  Verificar((edDG_FECHAMODIFSRT1.Date > 0) and (edDG_FECHAMODIFSRT1.Date < FechaAccidente), edDG_FECHAMODIFSRT1, Format(Msg_85, [DateToStr(FechaAccidente)]));

  Verificar((edDG_FECHAMODIFSRT1.Date > 0) and (edDG_FECHAMODIFSRT1.Date > dHoy), edDG_FECHAMODIFSRT1, Format(Msg_11, ['Denuncia Inicial', DateToStr(dHoy)]));
  Verificar((edDG_FECHAMODIFSRT1.Date > 0) and (edDG_FECHAMODIFSRT2.Date > dHoy), edDG_FECHAMODIFSRT2, Format(Msg_11, ['2° Fecha', DateToStr(dHoy)]));
  Verificar((edDG_FECHAMODIFSRT1.Date > 0) and (edDG_FECHAMODIFSRT3.Date > dHoy), edDG_FECHAMODIFSRT3, Format(Msg_11, ['3° Fecha', DateToStr(dHoy)]));
  Verificar((edDG_FECHAMODIFSRT1.Date > 0) and (edDG_FECHAMODIFSRT4.Date > dHoy), edDG_FECHAMODIFSRT4, Format(Msg_11, ['4° Fecha', DateToStr(dHoy)]));
  Verificar((edDG_FECHAMODIFSRT1.Date > 0) and (edDG_FECHAMODIFSRT5.Date > dHoy), edDG_FECHAMODIFSRT5, Format(Msg_11, ['5° Fecha', DateToStr(dHoy)]));

  Verificar((edDG_FECHAMODIFSRT1.Date = 0)  and (edDG_FECHAMODIFSRT2.Date <> 0), edDG_FECHAMODIFSRT2, 'No se puede completar la 2° Fecha sin tener completo el campo de Denuncia Inicial');
  Verificar((edDG_FECHAMODIFSRT2.Date > 0) and (edDG_FECHAMODIFSRT2.Date < edDG_FECHAMODIFSRT1.Date), edDG_FECHAMODIFSRT2, 'La 2° Fecha debe ser mayor o igual a la Fecha de Denuncia Inicial');

  Verificar((edDG_FECHAMODIFSRT2.Date = 0)  and (edDG_FECHAMODIFSRT3.Date <> 0), edDG_FECHAMODIFSRT3, 'No se puede completar la 3° Fecha sin tener completo el campo de 2° Fecha');
  Verificar((edDG_FECHAMODIFSRT3.Date > 0) and (edDG_FECHAMODIFSRT3.Date < edDG_FECHAMODIFSRT2.Date), edDG_FECHAMODIFSRT3, 'La 3° Fecha debe ser mayor o igual a la 2° Fecha');

  Verificar((edDG_FECHAMODIFSRT3.Date = 0)  and (edDG_FECHAMODIFSRT4.Date <> 0), edDG_FECHAMODIFSRT4, 'No se puede completar la 4° Fecha sin tener completo el campo de 3° Fecha');
  Verificar((edDG_FECHAMODIFSRT4.Date > 0) and (edDG_FECHAMODIFSRT4.Date < edDG_FECHAMODIFSRT3.Date), edDG_FECHAMODIFSRT4, 'La 4° Fecha debe ser mayor o igual a la 3° Fecha');

  Verificar((edDG_FECHAMODIFSRT4.Date = 0)  and (edDG_FECHAMODIFSRT5.Date <> 0), edDG_FECHAMODIFSRT5, 'No se puede completar la 5° Fecha sin tener completo el campo de 4° Fecha');
  Verificar((edDG_FECHAMODIFSRT5.Date > 0) and (edDG_FECHAMODIFSRT5.Date < edDG_FECHAMODIFSRT4.Date), edDG_FECHAMODIFSRT5, 'La 5° Fecha debe ser mayor o igual a la 4° Fecha');

  Verificar((fraDG_TIPOMODIFSRT1.Codigo = cTIPOMODSRT_OBITO) and
                ((fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_DERIVACION)
              or (fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_DERIVACION)
              or (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_DERIVACION)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_DERIVACION)), fraDG_TIPOMODIFSRT1, Msg_86);

  Verificar((fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_OBITO) and
                ((fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_DERIVACION)
              or (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_DERIVACION)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_DERIVACION)), fraDG_TIPOMODIFSRT2, Msg_86);

  Verificar((fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_OBITO) and
                ((fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_DERIVACION)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_DERIVACION)), fraDG_TIPOMODIFSRT3, Msg_86);

  Verificar((fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_OBITO) and
                ((fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_ALTAINTERN)
              or (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_DERIVACION)), fraDG_TIPOMODIFSRT4, Msg_86);

  Verificar(Hay_MasDeUnObito, fraDG_TIPOMODIFSRT1, 'No puede haber mas de un Óbito');

  Verificar(edDG_FECHARECEPCION.Date = 0, edDG_FECHARECEPCION, Msg_03);
  Verificar(edDG_FECHARECEPCION.Date > dHoy, edDG_FECHARECEPCION, Format(Msg_04, [DateToStr(dHoy)]));
  Verificar(edDG_FECHARECEPCION.Date < FechaAccidenteRecaida, edDG_FECHARECEPCION, Format(Msg_06, [DateToStr(FechaAccidenteRecaida)]));
  Verificar((sdqDatos.State = dsEdit) and (edDG_FECHARECEPCION.Date > sdqDatosDG_FECHAALTA.AsDateTime), edDG_FECHARECEPCION, Format(Msg_07, [sdqDatosDG_FECHAALTA.AsString]));
  Verificar((FechaRecepcion = 0) and (edDG_FECHARECEPCION.Date > FechaAlta), edDG_FECHARECEPCION, Format(Msg_05, [DateToStr(FechaAlta)]));

  //GuardaIncapac := ((fraDG_IDGRAVEDAD.Codigo <> '5') and (valorsqlex('SELECT inca.get_incaauto(:sin, :ord, :rec) FROM dual', [Siniestro, Orden, Recaida]) = ''));

  fraSDA_DETALLEARCHIVO.Validate;
end;

function TfrmDenunciaGrave.GetAddButtonVisible: boolean;
begin
  Result := inherited GetAddButtonVisible;
end;

procedure TfrmDenunciaGrave.Edit;
begin
  if not Inserting then
    Bajas(True);
  inherited;
  fraSDA_DETALLEARCHIVO.Clear;

  Do_Habilitacion_ModificSRT;
end;

procedure TfrmDenunciaGrave.edNroOrdenValueChange(Sender: TObject);
begin
  inherited;
  if sdqDatos.Active and not sdqdatos.IsEmpty and not sdqDatosDG_FECHABAJA.IsNull then
  begin
    edNroOrden.Font.Color := clRed;
    InfoHint(edNroOrden, 'Esta denuncia grave ha sido dada de baja.');
  end else
    edNroOrden.Font.Color := clBlack;
  LockControls(tbNotaExtemp, not (Seguridad.Activar(tbNotaExtemp) and (not sdqDatos.IsEmpty) and sdqDatosDG_FECHABAJA.IsNull));
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT1cmbDescripcionCloseUp(Sender: TObject);  // TK 26177
begin
  inherited;
  fraDG_TIPOMODIFSRT1.cmbDescripcionCloseUp(Sender);
  if (fraDG_TIPOMODIFSRT1.Codigo = cTIPOMODSRT_OTROS) then  // Opción Otros
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS1, false)
  else begin
    edDG_TIPOMODIFSRT_OTROS1.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS1, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT2cmbDescripcionCloseUp(Sender: TObject);
begin
  inherited;
  fraDG_TIPOMODIFSRT2.cmbDescripcionCloseUp(Sender);
  if (fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_OTROS) then  // Opción Otros
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS2, false)
  else begin
    edDG_TIPOMODIFSRT_OTROS2.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS2, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT3cmbDescripcionCloseUp(Sender: TObject);
begin
  inherited;
  fraDG_TIPOMODIFSRT3.cmbDescripcionCloseUp(Sender);
  if (fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_OTROS) then  // Opción Otros
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS3, false)
  else begin
    edDG_TIPOMODIFSRT_OTROS3.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS3, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT4cmbDescripcionCloseUp(Sender: TObject);
begin
  inherited;
  fraDG_TIPOMODIFSRT4.cmbDescripcionCloseUp(Sender);
  if (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_OTROS) then  // Opción Otros
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS4, false)
  else begin
    edDG_TIPOMODIFSRT_OTROS4.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS4, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT5cmbDescripcionCloseUp(Sender: TObject);
begin
  inherited;
  fraDG_TIPOMODIFSRT5.cmbDescripcionCloseUp(Sender);
  if (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_OTROS) then  // Opción Otros
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS5, false)
  else begin
    edDG_TIPOMODIFSRT_OTROS5.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS5, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT1edCodigoExit(Sender: TObject);
begin
  inherited;
  if (fraDG_TIPOMODIFSRT1.edCodigo.text = '') and (edDG_TIPOMODIFSRT_OTROS1.Text <> '') then
  begin
    edDG_TIPOMODIFSRT_OTROS1.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS1, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT2edCodigoExit(Sender: TObject);
begin
  inherited;
  if (fraDG_TIPOMODIFSRT2.edCodigo.text = '') and (edDG_TIPOMODIFSRT_OTROS2.Text <> '') then
  begin
    edDG_TIPOMODIFSRT_OTROS2.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS2, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT3edCodigoExit(Sender: TObject);
begin
  inherited;
  if (fraDG_TIPOMODIFSRT3.edCodigo.text = '') and (edDG_TIPOMODIFSRT_OTROS3.Text <> '') then
  begin
    edDG_TIPOMODIFSRT_OTROS3.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS3, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT4edCodigoExit(Sender: TObject);
begin
  inherited;
  if (fraDG_TIPOMODIFSRT4.edCodigo.text = '') and (edDG_TIPOMODIFSRT_OTROS4.Text <> '') then
  begin
    edDG_TIPOMODIFSRT_OTROS4.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS4, true);
  end;
end;

procedure TfrmDenunciaGrave.fraDG_TIPOMODIFSRT5edCodigoExit(Sender: TObject);
begin
  inherited;
  if (fraDG_TIPOMODIFSRT5.edCodigo.text = '') and (edDG_TIPOMODIFSRT_OTROS5.Text <> '') then
  begin
    edDG_TIPOMODIFSRT_OTROS5.Clear;
    VCLExtra.LockControl(edDG_TIPOMODIFSRT_OTROS5, true);
  end;
end;

procedure TfrmDenunciaGrave.Do_Habilitacion_ModificSRT;   // TK 26177
begin
  VCLExtra.LockControls([edDG_FECHAMODIFSRT1, fraDG_TIPOMODIFSRT1], false);

  // Se habilitan las fechas y tipos si y solo si, la anterior fecha esta completa.
  VCLExtra.LockControls([edDG_FECHAMODIFSRT2, fraDG_TIPOMODIFSRT2], not (edDG_FECHAMODIFSRT1.Date > 0));
  VCLExtra.LockControls([edDG_FECHAMODIFSRT3, fraDG_TIPOMODIFSRT3], not (edDG_FECHAMODIFSRT2.Date > 0));
  VCLExtra.LockControls([edDG_FECHAMODIFSRT4, fraDG_TIPOMODIFSRT4], not (edDG_FECHAMODIFSRT3.Date > 0));
  VCLExtra.LockControls([edDG_FECHAMODIFSRT5, fraDG_TIPOMODIFSRT5], not (edDG_FECHAMODIFSRT4.Date > 0));

  // Los edits "Otros" se habilitan solo si el tipo es "otros"
  VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS1], not (fraDG_TIPOMODIFSRT1.Codigo = cTIPOMODSRT_OTROS));
  VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS2], not (fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_OTROS));
  VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS3], not (fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_OTROS));
  VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS4], not (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_OTROS));
  VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS5], not (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_OTROS));
end;

// Habilitaciones sobre ejecución de los componentes de Modificaciones SRT
procedure TfrmDenunciaGrave.edDG_FECHAMODIFSRT1Exit(Sender: TObject);
begin
  VCLExtra.LockControls([edDG_FECHAMODIFSRT2, fraDG_TIPOMODIFSRT2], not (edDG_FECHAMODIFSRT1.Date > 0));
  if (edDG_FECHAMODIFSRT1.Date = 0) then
    VCLExtra.LockControls([edDG_FECHAMODIFSRT3, fraDG_TIPOMODIFSRT3,
                           edDG_FECHAMODIFSRT4, fraDG_TIPOMODIFSRT4,
                           edDG_FECHAMODIFSRT5, fraDG_TIPOMODIFSRT5,
                           edDG_TIPOMODIFSRT_OTROS2, edDG_TIPOMODIFSRT_OTROS3,
                           edDG_TIPOMODIFSRT_OTROS4, edDG_TIPOMODIFSRT_OTROS5], true);
end;

procedure TfrmDenunciaGrave.edDG_FECHAMODIFSRT2Exit(Sender: TObject);
begin
  VCLExtra.LockControls([edDG_FECHAMODIFSRT3, fraDG_TIPOMODIFSRT3], not (edDG_FECHAMODIFSRT2.Date > 0));
  if (edDG_FECHAMODIFSRT2.Date = 0) then
    VCLExtra.LockControls([edDG_FECHAMODIFSRT4, fraDG_TIPOMODIFSRT4,
                           edDG_FECHAMODIFSRT5, fraDG_TIPOMODIFSRT5,
                           edDG_TIPOMODIFSRT_OTROS3, edDG_TIPOMODIFSRT_OTROS4,
                           edDG_TIPOMODIFSRT_OTROS5], true);
end;

procedure TfrmDenunciaGrave.edDG_FECHAMODIFSRT3Exit(Sender: TObject);
begin
  VCLExtra.LockControls([edDG_FECHAMODIFSRT4, fraDG_TIPOMODIFSRT4], not (edDG_FECHAMODIFSRT3.Date > 0));
  if (edDG_FECHAMODIFSRT3.Date = 0) then
    VCLExtra.LockControls([edDG_FECHAMODIFSRT5, fraDG_TIPOMODIFSRT5,
                           edDG_TIPOMODIFSRT_OTROS5, edDG_TIPOMODIFSRT_OTROS4, edDG_FECHAMODIFSRT3], true);
end;

procedure TfrmDenunciaGrave.edDG_FECHAMODIFSRT4Exit(Sender: TObject);
begin
  VCLExtra.LockControls([edDG_FECHAMODIFSRT5, fraDG_TIPOMODIFSRT5], not (edDG_FECHAMODIFSRT4.Date > 0));
  if (edDG_FECHAMODIFSRT4.Date = 0) then
      VCLExtra.LockControls([edDG_TIPOMODIFSRT_OTROS5, edDG_TIPOMODIFSRT_OTROS4], true);
end;

function TfrmDenunciaGrave.Hay_MasDeUnObito: boolean;    // TK 26177
var cant:integer;
begin
  cant := 0;
  if (fraDG_TIPOMODIFSRT1.Codigo = cTIPOMODSRT_OBITO) then
    inc(cant);
  if (fraDG_TIPOMODIFSRT2.Codigo = cTIPOMODSRT_OBITO) then
    inc(cant);
  if (fraDG_TIPOMODIFSRT3.Codigo = cTIPOMODSRT_OBITO) then
    inc(cant);
  if (fraDG_TIPOMODIFSRT4.Codigo = cTIPOMODSRT_OBITO) then
    inc(cant);
  if (fraDG_TIPOMODIFSRT5.Codigo = cTIPOMODSRT_OBITO) then
    inc(cant);

  Result := (cant > 1);
end;

procedure TfrmDenunciaGrave.btnNotaExtemporaneosClick(Sender: TObject);
begin
  with TqrNotaDenunciaGrave.Create(Self) do
  try
    Imprimir(SiniestroCompleto, CUIL, CUIT, IdExpediente, Siniestro, FechaAccidente,
             fraDG_IDPRESTADOR.edCA_IDENTIFICADOR.Value, StrToInt(edNroOrden.Text));
  finally
    Free;
  end;
end;



end.
