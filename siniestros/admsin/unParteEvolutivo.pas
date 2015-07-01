unit unParteEvolutivo;

interface
                      
uses
  {$IFDEF VER180}
  rxToolEdit,
  rxPlacemnt,
  {$ELSE}
  ToolEdit,
  Placemnt,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unAdmSiniestros, StdCtrls, unSinForm, SDEngine, Db, unSinFormNavigator,
  Mask, PatternEdit, ComboEditor, DBComboGrid, Buttons, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unfraCPR_PRESTADOR, ExtCtrls, DBCtrls,
  unFraStaticCodigoDescripcion, unArt, unFraStaticCTB_TABLAS,
  DateComboBox, ExComboBox, DateTimeEditors, unFraSAU_AUTORIZACIONES,
  Grids, DBGrids, unFraSDA_DETALLEARCHIVO{$IFNDEF VER130}, Variants {$ENDIF},
  artSeguridad, XPMenu, JvgGroupBox, ShortCutControl, QuickRpt,
  JvExControls, JvComponent, JvXPCore, JvXPButtons, ActnList;

type
  TfrmParteEvolutivo = class(TSinFormNavigator)
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edPV_FECHACONTROL: TDateComboBox;
    edPV_PROXIMOCONTROL: TDateComboBox;
    cmbPV_TIPOPARTE: TExComboBox;
    ShortCutControl: TShortCutControl;
    sdqDatosEX_ID: TFloatField;
    sdqDatosPV_NROPARTE: TFloatField;
    sdqDatosPV_DIAGNOSTICO: TStringField;
    sdqDatosPV_OBSERVACIONES: TStringField;
    sdqDatosPV_TIPOTRATAMIENTO: TStringField;
    sdqDatosPV_PLANREHABILITACION: TStringField;
    sdqDatosPV_DESDE: TDateTimeField;
    sdqDatosPV_HASTA: TDateTimeField;
    sdqDatosPV_FECHACONTROL: TDateTimeField;
    sdqDatosPV_PROXIMOCONTROL: TDateTimeField;
    sdqDatosPV_PROBABLEALTA: TDateTimeField;
    sdqDatosPV_MEDICO: TStringField;
    sdqDatosPV_FECHARECEPCION: TDateTimeField;
    sdqDatosPV_AUDITOR: TFloatField;
    sdqDatosPV_PRESUPINCAPACIDAD: TStringField;
    sdqDatosPV_IDENTIFPRESTADOR: TFloatField;
    sdqDatosPV_DIAGNOSTICOOMS: TStringField;
    sdqDatosPV_INTERNADODESDE: TDateTimeField;
    sdqDatosPV_INTERNADOHASTA: TDateTimeField;
    sdqDatosPV_SITIOINTERNACION: TStringField;
    sdqDatosPV_TIPOPARTE: TStringField;
    sdqDatosPV_AUTORIZACION: TFloatField;
    sdqDatosPV_NRODENUNCIASRT: TStringField;
    sdqDatosPV_OPERPROG: TStringField;
    sdqDatosPV_TURNO: TDateTimeField;
    sdqDatosPV_TURNOHORA: TStringField;
    sdqDatosPV_EVIP: TStringField;
    sdqDatosPV_IDDIAGNOSTICO: TFloatField;
    sdqDatosUSUARIO: TStringField;
    sdqDatosDA_OPCION: TStringField;
    sdqDatosDA_HOJAS: TFloatField;
    gbPrestador: TJvgGroupBox;
    fraPV_IDENTIFPRESTADOR: TfraCPR_Prestador;
    gbDatosMedicos: TJvgGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnBusqueda: TSpeedButton;
    Label13: TLabel;
    Label19: TLabel;
    fraPV_IDDIAGNOSTICO: TfraStaticCodigoDescripcion;
    edDG_DIAGNOSTICO: TDBEdit;
    fraPV_TIPOTRATAMIENTO: TfraStaticCTB_TABLAS;
    fraPV_AUDITOR: TfraStaticCodigoDescripcion;
    chkPV_OPERPROG: TDBCheckBox;
    edPV_TURNO: TDateComboBox;
    edPV_TURNOHORA: TTimeEditor;
    edPV_NRODENUNCIASRT: TDBEdit;
    edPV_FECHARECEPCION: TDateComboBox;
    edPV_MEDICO: TDBEdit;
    gbOtros: TJvgGroupBox;
    Label14: TLabel;
    edPV_OBSERVACIONES: TDBMemo;
    btnInfoAdicional: TJvXPButton;
    Label22: TLabel;
    Label23: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel5: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edPV_INTERNADODESDE: TDateComboBox;
    edPV_INTERNADOHASTA: TDateComboBox;
    edPV_SITIOINTERNACION: TDBEdit;
    edPV_DESDE: TDateComboBox;
    edPV_HASTA: TDateComboBox;
    sdqDatosPV_FECHABAJA: TDateTimeField;
    sdqDatosAU_NUMAUTO: TFloatField;
    cmbAU_NUMAUTO: TDBEdit;
    procedure FSFormCreate(Sender: TObject);
    procedure dsDatosDataChange(Sender: TObject; Field: TField);
    procedure dsDatosUpdateData(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure sdqDatosBeforePost(DataSet: TDataSet);
    procedure sdqDatosNewRecord(DataSet: TDataSet);
    procedure btnInfoAdicionalClick(Sender: TObject);
    procedure CheckNavigatorEvent(DataSet: TDataSet);
  protected
    function GetAddButtonVisible: boolean; override;
    procedure SetLocked(const Value: Boolean); override;
  public
    procedure LoadData; override;
    function  Save: boolean; override;
    procedure Cancel(ASinPreguntar: Boolean = False); override;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, DBFuncs, CustomDlgs, AnsiSql, unSesion,
  VCLExtra;

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmParteEvolutivo }
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.LoadData;
begin
  edNroOrden.Clear;
{
  sdqSAU_AUTORIZACIONES.Params[0].AsInteger := FIdExpediente;
  OpenQueryEx(sdqSAU_AUTORIZACIONES, [FIdExpediente]);
}
  sdqDatos.Params[0].AsInteger := FIdExpediente;
  OpenQuery(sdqDatos);

  if not sdqDatos.IsEmpty Then
    sdqDatos.Last;
end;
{------------------------------------------------------------------------------}
function TfrmParteEvolutivo.Save: boolean;
begin
  try
    if sdqDatos.Active Then
    begin
      if sdqDatos.State in [dsInsert, dsEdit] then
      begin
        sdqDatos.Post;
      end;

      sdqDatos.ApplyUpdates;
      sdqDatos.CommitUpdates;
    end;
    Result := True;
  except
    Result := False;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.FSFormCreate(Sender: TObject);
begin
  inherited;
  acAgregar.Enabled := False;
  acModificar.Enabled := False;
  acEliminar.Enabled := False;

  sPrefix := 'PV';
  sTableName := 'SPV_PARTEEVOLUTIVO';

  LoadStringsValues('SELECT TB_CODIGO, TB_DESCRIPCION ' +
                      'FROM CTB_TABLAS ' +
                     'WHERE TB_CLAVE = ''TIPEV'' ' +
                       'AND TB_CODIGO <> ''0''', cmbPV_TIPOPARTE.Items);

  with fraPV_IDENTIFPRESTADOR do
  begin
    DataSource := Self.dsDatos; { No quitar el Self }
    DataField := 'PV_IDENTIFPRESTADOR';
  end;

  with fraPV_IDDIAGNOSTICO do
  begin
    TableName := 'CDG_DIAGNOSTICO';
    FieldID := 'DG_ID';
    FieldCodigo := 'DG_CODIGO';
    FieldDesc := 'DG_DESCRIPCION';
    FieldBaja := 'DG_FECHABAJA';
    ShowBajas := True;
    DataSource := dsDatos;
    DataField := 'PV_IDDIAGNOSTICO';
  end;

  with fraPV_TIPOTRATAMIENTO do
  begin
    fraPV_TIPOTRATAMIENTO.Clave := 'TRATA';
    DataSource := dsDatos;
    DataField := 'PV_TIPOTRATAMIENTO';
  end;

  with fraPV_AUDITOR do
  begin
    TableName := 'MAU_AUDITORES';
    FieldID := 'AU_AUDITOR';
    FieldCodigo := 'AU_AUDITOR';
    FieldDesc := 'AU_NOMBRE';
    FieldBaja := 'AU_FBAJA';
    ShowBajas := True;
    DataSource := dsDatos;
    DataField := 'PV_AUDITOR';
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.dsDatosDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  try
    if not Assigned(Field) Then
    begin
      //  fraPV_DIAGNOSTICOOMS.Codigo := sdqDatos.FieldByName('PV_DIAGNOSTICOOMS').AsString;
      cmbPV_TIPOPARTE.Value       := sdqDatos.FieldByName('PV_TIPOPARTE').AsString;
      edPV_FECHACONTROL.Date      := sdqDatos.FieldByName('PV_FECHACONTROL').AsDateTime;
      edPV_PROXIMOCONTROL.Date    := sdqDatos.FieldByName('PV_PROXIMOCONTROL').AsDateTime;
      edPV_FECHARECEPCION.Date    := sdqDatos.FieldByName('PV_FECHARECEPCION').AsDateTime;
      edPV_DESDE.Date             := sdqDatos.FieldByName('PV_DESDE').AsDateTime;
      edPV_HASTA.Date             := sdqDatos.FieldByName('PV_HASTA').AsDateTime;
      edPV_INTERNADOHASTA.Date    := sdqDatos.FieldByName('PV_INTERNADOHASTA').AsDateTime;
      edPV_INTERNADODESDE.Date    := sdqDatos.FieldByName('PV_INTERNADODESDE').AsDateTime;

      if sdqDatos.FieldByName('PV_TURNOHORA').IsNull Then
        edPV_TURNOHORA.Clear
      else
        edPV_TURNOHORA.Time := StrToTime(sdqDatos.FieldByName('PV_TURNOHORA').AsString);

      edPV_TURNO.Date := sdqDatos.FieldByName('PV_TURNO').AsDateTime;
  {
      fraSDA_DETALLEARCHIVO.Locked := (sdqDatos.State <> dsInsert);
      fraSDA_DETALLEARCHIVO.Opcion := sdqDatos.FieldByName('DA_OPCION').AsString;
      fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value := sdqDatos.FieldByName('DA_HOJAS').AsInteger;
  }
    end;
  except
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.dsDatosUpdateData(Sender: TObject);
  procedure SetDateTime(AField: string; ADateTime: TDateTime);
  begin
    if ADateTime = 0 Then
      sdqDatos.FieldByName(AField).Value := Null
    else
      sdqDatos.FieldByName(AField).AsDateTime := ADateTime;
  end;
begin
  try
    inherited;
  //  sdqDatos.FieldByName('PV_DIAGNOSTICOOMS').AsString := fraPV_DIAGNOSTICOOMS.Codigo;
    sdqDatos.FieldByName('PV_TIPOPARTE').AsString := cmbPV_TIPOPARTE.Value;
    SetDateTime('PV_FECHACONTROL', edPV_FECHACONTROL.Date);
    SetDateTime('PV_PROXIMOCONTROL', edPV_PROXIMOCONTROL.Date);
    SetDateTime('PV_FECHARECEPCION', edPV_FECHARECEPCION.Date);
    SetDateTime('PV_DESDE', edPV_DESDE.Date);
    SetDateTime('PV_HASTA', edPV_HASTA.Date);
    SetDateTime('PV_INTERNADOHASTA', edPV_INTERNADOHASTA.Date);
    SetDateTime('PV_INTERNADODESDE', edPV_INTERNADODESDE.Date);

    if edPV_TURNOHORA.Time = 0 Then
      sdqDatos.FieldByName('PV_TURNOHORA').Value := Null
    else
      sdqDatos.FieldByName('PV_TURNOHORA').AsString := edPV_TURNOHORA.Text;

    SetDateTime('PV_TURNO', edPV_TURNO.Date);
  {
    if sdqDatos.State = dsInsert Then
    begin
      sdqDatos.FieldByName('DA_OPCION').AsString := fraSDA_DETALLEARCHIVO.Opcion;
      sdqDatos.FieldByName('DA_HOJAS').AsInteger := fraSDA_DETALLEARCHIVO.edDA_HOJAS.Value;
    end;
  }
  except
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PV_NRODENUNCIASRT').EditMask := '99999999-99999';
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.sdqDatosBeforePost(DataSet: TDataSet);
begin
  inherited;
{
  if  sdqSAU_AUTORIZACIONES.FieldByName('PV_AUTORIZACION').Value <> sdqSAU_AUTORIZACIONES.FieldByName('PV_AUTORIZACION').Value Then
  begin
    if (sdqSAU_AUTORIZACIONES.FieldByName('PV_AUTORIZACION').AsInteger = 0) Then
    begin
      sdqSAU_AUTORIZACIONES.Edit;
      sdqSAU_AUTORIZACIONES.FieldByName('PV_AUTORIZACION').AsInteger := sdqDatos.FieldByName('PV_NROPARTE').AsInteger;
      sdqSAU_AUTORIZACIONES.Post;
    end
    else //if sdqSAU_AUTORIZACIONES.FieldByName('PV_AUTORIZACION').AsInteger <> sdqDatos.FieldByName('PV_NROPARTE').AsInteger Then
    begin
      if cmbAU_NUMAUTO.Text = '' Then
      begin
        sdqSAU_AUTORIZACIONES.Edit;
        sdqSAU_AUTORIZACIONES.FieldByName('PV_AUTORIZACION').Clear;
        sdqSAU_AUTORIZACIONES.Post;
      end else
        InvalidExcept(cmbAU_NUMAUTO, 'La autorización seleccionada ya ha sido utilizada en otro parte');
    end;
  end;
}  
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.sdqDatosNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('EX_ID').AsInteger := IdExpediente;
    FieldByName('PV_NROPARTE').AsInteger := iNewParte;
    FieldByName('USUARIO').AsString := Sesion.UserID;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.Cancel(ASinPreguntar: Boolean = False);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.btnInfoAdicionalClick(Sender: TObject);
var
  sObs: string;
begin
  inherited;
  sObs := ValorSQLEx('SELECT PA_OBSERVACIONESMEDICOAUDITOR ' +
                       'FROM SIN.SPA_PARTEDEAUDITORIA ' +
                      'WHERE PA_IDEXPEDIENTE = :ID ' +
                        'AND PA_NROPARTEEVOL = :NRO', [IdExpediente, sdqDatosPV_NROPARTE.AsInteger]);
  ShowMessage(sObs);
end;
{------------------------------------------------------------------------------}
function TfrmParteEvolutivo.GetAddButtonVisible: boolean;
begin
  Result := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControl(btnInfoAdicional, not Value);
end;
{------------------------------------------------------------------------------}
procedure TfrmParteEvolutivo.CheckNavigatorEvent(DataSet: TDataSet);
begin
  inherited;
  btnInfoAdicional.Visible := cmbPV_TIPOPARTE.Value = 'U';
  if sdqDatosPV_FECHABAJA.IsNull then
  begin
    edNroOrden.Font.Style := [];
    edNroOrden.Font.Color := clBlack;
    edPV_OBSERVACIONES.Font.Color := clBlack;
  end else
  begin
    edNroOrden.Font.Style := [fsStrikeOut];
    edNroOrden.Font.Color := clRed;
    edPV_OBSERVACIONES.Font.Color := clRed;
  end;
end;
{------------------------------------------------------------------------------}
end.
