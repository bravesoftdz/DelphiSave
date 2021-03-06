unit unSinForm;

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
  FSForm, SDEngine, Db, unArt, artSeguridad, XPMenu, ExtCtrls,
  QuickRpt, unFraEmpresa, ActnList, RxPlacemnt;

const
  Msg_Permiso = 'Usted no tiene permiso para realizar la acci�n seleccionada.';
  Msg_SiniestroCerrado = 'El siniestro seleccionado se encuentra cerrado por error de carga.';
  Msg_ExpedienteSinCargar = 'No se especific� el tipo de siniestro en la solapa (1) del expediente.';
  Msg_01 = 'Debe indicar la gravedad si selecciona un diagn�stico.';
  Msg_02 = 'Debe completar la descripci�n del hecho.';
  Msg_03 = 'La fecha de recepci�n es obligatoria.';
  Msg_04 = 'La fecha de recepci�n no puede ser posterior a la de hoy %s.';
  Msg_05 = 'La fecha de recepci�n no puede ser posterior a la fecha de carga del siniestro, para el primer parte ingresado %s.';
  Msg_06 = 'La fecha de recepci�n no puede ser anterior a la fecha de accidente/reca�da %s.';
  Msg_07 = 'La fecha de recepci�n no puede ser posterior a la de alta %s del parte.';
  Msg_08 = 'La fecha de antig�edad en el puesto no puede ser posterior a la de hoy %s.';
  Msg_09 = 'La fecha de antig�edad en el puesto no puede ser posterior a la del accidente %s.';
  Msg_10 = 'La cantidad de meses en el puesto es incorrecta.';
  Msg_11 = 'La fecha de %s no puede ser posterior a la de hoy %s.';
  Msg_12 = 'La fecha de baja m�dica no puede ser anterior a la fecha de accidente/reca�da %s.';
  Msg_13 = 'La fecha de baja m�dica no puede ser posterior a la de alta del documento %s.';
  Msg_14 = 'La fecha de recepci�n no puede ser anterior a la fecha de %s %s.';
  Msg_15 = 'La fecha de denuncia debe ser anterior a la fecha de recepci�n %s.';
  Msg_16 = 'Debe indicar el prestador.';
  Msg_17 = 'La fecha de baja m�dica no puede ser mayor que la m�nima fecha desde de liquidaci�n de ILT (menos los d�as de franquicia) %s.';
  Msg_18 = 'Recuerde que falta cargar la fecha de alta m�dica de al menos una de las reca�das anteriores.';
  Msg_19 = 'La fecha de baja m�dica es menor que la fecha de alta m�dica de una reca�da anterior %s.';
  Msg_20 = 'La fecha reconsulta no puede ser menor que la fecha de %s %s.';
  Msg_21 = 'La fecha de baja m�dica es obligatoria.';  
  Msg_22 = 'El tipo de alta (egreso) es obligatorio.';
  Msg_23 = 'Debe indicar el tipo de tratamiento.';
  Msg_24 = 'La fecha de recepci�n no puede ser anterior a la fecha de egreso (alta m�dica) %s.';
  Msg_25 = 'La cantidad de d�as de baja m�dica deben ser mayores o iguales que 0.';
  Msg_26 = 'La gravedad no puede ser leve, dados los d�as de baja del siniestro %s';
  Msg_27 = 'Debe indicar si corresponde o no una recalificaci�n.';
  Msg_28 = 'La fecha de egreso (alta m�dica) es obligatoria.';
  Msg_29 = 'La fecha de egreso (alta m�dica) no puede ser posterior a la de hoy %s.';
  Msg_30 = 'La fecha de egreso (alta m�dica) no puede ser anterior a la fecha de baja m�dica %s.';
  Msg_31 = 'La fecha de egreso (alta m�dica) no puede ser menor que la m�xima fecha hasta de liquidaci�n de ILT %s.';
  Msg_32 = 'Debe completar la fecha de reinicio laboral, completando el alta m�dica.';
  Msg_33 = 'La fecha de egreso no puede ser posterior a la fecha de reinicio laboral %s.';
  Msg_34 = 'La fecha de inicio de internaci�n no es correcta.';
  Msg_35 = 'La fecha de fin de internaci�n no es correcta.';
  Msg_36 = 'La fecha de inicio de internaci�n no puede ser anterior a la fecha de baja m�dica.';
  Msg_37 = 'La fecha de inicio de internaci�n no puede ser posterior a la de hoy %s.';
  Msg_38 = 'La fecha de fin de internaci�n no puede ser anterior a la fecha de inicio del mismo %s.';
  Msg_39 = 'La fecha de fin de internaci�n no puede ser posterior a la fecha de egreso %s.';
  Msg_40 = 'Debe indicar si el paciente ha sido derivado a una Obra Social o no.';
  Msg_41 = 'Debe indicar si el paciente firm� conforme o no.';
  Msg_42 = 'La fecha de auditor�a es obligatoria.';
  Msg_43 = 'La fecha de auditor�a no puede ser posterior a la de hoy %s.';
  Msg_44 = 'La fecha de auditor�a no puede ser anterior a la fecha de accidente/reca�da %s.';
  Msg_45 = 'La fecha del pr�ximo control no puede ser posterior a un a�o de la fecha actual %s.';
  Msg_46 = 'La fecha del pr�ximo control no puede ser anterior a la fecha del accidente %s.';
  Msg_47 = 'La fecha del pr�ximo control debe ser posterior a la fecha de auditor�a %s.';
  Msg_48 = 'La fecha probable de alta no puede ser posterior a un a�o de la fecha actual %s.';
  Msg_49 = 'La fecha probable de alta no puede ser anterior a la fecha del accidente %s.';
  Msg_50 = 'La fecha probable de alta debe ser posterior a la fecha de auditor�a %s.';
  Msg_51 = 'Debe indicar el auditor.';
  Msg_52 = 'La fecha de egreso (alta m�dica) no puede ser anterior a la fecha de accidente/reca�da %s.';
  Msg_53 = 'Debe indicar la gravedad.';
  Msg_54 = 'Debe ingresar el n�mero completo de la denuncia SRT.';
  Msg_55 = 'El n�mero de la denuncia SRT debe ser mayor a 0.';
  Msg_56 = 'El a�o de la denuncia SRT debe estar entre 1996 y %d.';
  Msg_57 = 'La fecha de primera atenci�n no puede ser anterior a la fecha de accidente/reca�da %s.';
  Msg_58 = 'La fecha de primera atenci�n no puede ser posterior a un a�o de la fecha actual %s.';
  Msg_59 = 'La fecha de alta m�dica %s no puede ser posterior a la m�nima fecha de reca�da (%s) para reca�das posteriores a la actual.';
  Msg_60 = 'Si el trabajador se encuentra internado debe indicar el prestador.';
  Msg_61 = 'El porcentaje de incapacidad ingresado no es correcto.';
  Msg_62 = 'El tipo de egreso seleccionado ha sido dado de baja, seleccione otro por favor.';
  Msg_63 = 'Si el trabajador se encuentra internado el prestador no puede ser Provincia A.R.T.';
  Msg_64 = 'En la denuncia grave, la gravedad solo puede ser GRAVE o MORTAL.';
  Msg_65 = 'Ya existe otro expediente con el n�mero de denuncia SRT %s.';
  Msg_66 = 'La fecha de baja en el prestador no puede ser anterior a la fecha de baja m�dica %s.';
  Msg_67 = 'Debe indicar al menos un posible esquema terap�utico.';
  Msg_68 = 'Debe indicar al menos un cambio sugerido.'; 
  Msg_69 = 'Debe indicar el subtipo de accidente.';
  Msg_70 = 'Debe indicar el tipo de siniestro.';
  Msg_71 = 'Existe un parte m�dico evolutivo no administrativo con fecha %s, posterior a la fecha de alta m�dica indicada %s.';
  Msg_72 = 'La fecha de baja m�dica no puede ser posterior a la fecha de alta m�dica %s indicada en el parte de egreso para este mismo siniestro.';
  Msg_73 = 'Debe seleccionar %s que no est� dado de baja.';
  Msg_74 = 'Debe seleccionar %s que no sea t�tulo ni subt�tulo.';
  Msg_75 = 'La fecha de inicio de inasistencia laboral %s no puede ser anterior a la fecha de accidente/reca�da %s.';
  Msg_76 = 'No se puede declarar dos veces el mismo diagn�stico %s.';
  Msg_77 = 'La fecha de alta m�dica %s no puede ser posterior a hoy %s.';
  Msg_78 = 'Si selecciona recalificaci�n, no debe ingresar la fecha de cese de ILT.';
  Msg_79 = 'Debe seleccionar un diagn�stico si quiere indicar la zona o naturaleza de la lesi�n.';
  Msg_80 = 'Utilice este campo de diagn�stico antes que el siguiente.';
  Msg_81 = 'Debe indicar qui�n realiz� la denuncia.';
  Msg_82 = 'Diagn�stico CIE10 no permitido, dar intervenci�n al m�dico.';  // TK 16355
  Msg_83 = 'Debe completar la Fecha de Abandono Mixto';                    // TK 20581
  Msg_84 = 'La fecha de Abandono Mixto no puede ser mayor a la actual';    // TK 20581
  Msg_85 = 'La fecha de Denuncia Inicial no puede ser anterior a la Fecha de Accidente %s.';  // TK 26177
  Msg_86 = 'No se puede generar Derivaci�n y/o Alta Sanatorial despu�s del �bito';            // TK 26177
  Msg_87 = 'El siniestro actual registra solicitud de recalificaci�n/incapacidad en el parte N�%s.';
  Msg_88 = 'Debe completar la Ubicaci�n de la Denuncia';
  Msg_89 = 'El CIE-10 (Diagn�stico) es obligatorio';  // TK 34934
  Msg_90 = 'Debe indicar si corresponde o no tener Prestaciones de Mantenimiento';  // TK 63627

type
  ESiniestrosException = Exception;
  
  TSinForm = class(TFSForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sduDatos: TSDUpdateSQL;
    XPMenu: TXPMenu;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    Acciones: TActionList;
    acAgregar: TAction;
    acModificar: TAction;
    acEliminar: TAction;
    acImprimir: TAction;
    procedure dsDatosStateChange(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure CambioTamanio(Sender: TObject);
    procedure Validar(DataSet: TDataSet);
    procedure GetFocus(Sender: TObject);
    procedure acAgregarExecute(Sender: TObject);
    procedure acModificarExecute(Sender: TObject);
    procedure acEliminarExecute(Sender: TObject);
  private
    FSiniestroCerrado, FLocked: Boolean;
    FSiniestro, FOrden, FRecaida, FIdTipoAccidente: integer;
    FMostrarAyudasVisuales: boolean;
    FTipoAccidente, FSiniestroCompleto, FAccidenteDeTransito: string;
    FTieneDatos: boolean;
    FCUIT: String;
    FCUIL: String;
    function GetFechaAccidente: TDateTime;
    function GetFechaAccidenteRecaida: TDateTime;
    function GetFechaAlta: TDateTime;
    function GetEmpresaSeleccionada: TFraEmpresa;
    function GetPermisoEdicion: boolean;
    function GetPermisoAgregar: boolean;
    function GetPermisoEliminar: boolean;
  protected
    FFechaRecepcion, FFechaAltaMedica, FFechaBajaMedica, FFechaAlta,
    FFechaAccidente, FFechaAccidenteRecaida: TDateTime;
    dHoy: TDateTime;
    FIdExpediente: TTableId;
    procedure SetIdExpediente(const Value: TTableId); virtual;
    function GetModified: Boolean; virtual;
    function GetAddButtonVisible: boolean; virtual;
//    procedure SetModified(const Value: Boolean); virtual; abstract;
    procedure SetLocked(const Value: Boolean); virtual;
  public
    function  Inserting: boolean; virtual;
    function  Editing: boolean; virtual;
    function  CanSaveCancel: Boolean; virtual;
    function  Save: boolean; virtual;
    procedure LoadData; virtual; abstract;
    procedure Clear; virtual;
    procedure Insert; virtual;
    procedure Edit; virtual;
    procedure Delete; virtual;
    procedure Cancel(ASinPreguntar: Boolean = False); virtual;
    procedure Print; virtual;
    procedure Refresh; virtual;

    constructor Create(AOwner: TComponent); override;
    procedure   AfterConstruction; override;
  published
    property AccidenteDeTransito: string read FAccidenteDeTransito;
    property AddButtonVisible: boolean read GetAddButtonVisible;

    property CUIL: String read FCUIL;
    property CUIT: String read FCUIT;

    property EmpresaSeleccionada: TFraEmpresa read GetEmpresaSeleccionada;

    property IdExpediente: TTableId read FIdExpediente write SetIdExpediente;
    property IdTipoAccidente: integer read FIdTipoAccidente;

    property Modified: boolean read GetModified {write SetModified};
    property MostrarAyudasVisuales: boolean read FMostrarAyudasVisuales write FMostrarAyudasVisuales;

    property FechaAccidente: TDateTime read GetFechaAccidente;
    property FechaAccidenteRecaida: TDateTime read GetFechaAccidenteRecaida;
    property FechaAlta: TDateTime read GetFechaAlta;
    property FechaAltaMedica: TDateTime read FFechaAltaMedica;
    property FechaBajaMedica: TDateTime read FFechaBajaMedica;
    property FechaRecepcion: TDateTime read FFechaRecepcion;

    property SiniestroCerrado: boolean read FSiniestroCerrado;
    property SiniestroCompleto: string read FSiniestroCompleto;

    property TipoAccidente: string read FTipoAccidente;
    property TieneDatos: boolean read FTieneDatos write FTieneDatos;

    property PermisoEdicion: boolean read GetPermisoEdicion;
    property PermisoAgregar: boolean read GetPermisoAgregar;
    property PermisoEliminar: boolean read GetPermisoEliminar;

    property Siniestro: integer read FSiniestro;
    property Orden: integer read FOrden;
    property Recaida: integer read FRecaida;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, VclExtra, CustomDlgs, unAdmSiniestros,
  unFraTrabajadorSiniestro;

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TSinForm }
{------------------------------------------------------------------------------}
procedure TSinForm.Cancel(ASinPreguntar: Boolean = False);
begin
  if ASinPreguntar or MsgAsk('�Desea cancelar todos los cambios realizados?') then
  begin
    if sdqDatos.Active then
      sdqDatos.CancelUpdates;
    RollBackUpdates;
    Rollback(True);
    EjecutarSQL('ROLLBACK');
  end;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Delete;
begin
  if MsgAsk('�Desea borrar el registro seleccionado?') then
  begin
    sdqDatos.Delete;
    DoAplicarUpdates(sdqDatos);
    dsDatosStateChange(nil);
  end;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Edit;
begin
  sdqDatos.Edit;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Insert;
begin
  sdqDatos.Append;
  Edit;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.SetIdExpediente(const Value: TTableId);
begin
  if Value = 0 then
  begin
    FIdExpediente := Value;
    SetLocked(True);
    Clear;
    FFechaAccidente        := 0;
    FFechaAccidenteRecaida := 0;
    FFechaAlta             := 0;
    FFechaBajaMedica       := 0;
    FFechaAltaMedica       := 0;
    FFechaRecepcion        := 0;
    FSiniestro             := 0;
    FOrden                 := 0;
    FRecaida               := 0;
    FIdTipoAccidente       := 0;
    FTipoAccidente         := '';
    FAccidenteDeTransito   := 'N';
    FSiniestroCompleto     := '';    
  end else
  if FIdExpediente <> Value then
  begin
    FIdExpediente := Value;
    SetLocked(True);
    with GetQueryEx('SELECT ART.UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINIESTRO_COMPLETO, ' +
                           'NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) FECHA_ACC_REC, ' +
                           'EX_FECHAACCIDENTE, EX_TIPO, EX_FECHARECEPCION, EX_FECHAALTA, ' +
                           'EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, TA_ID, EX_BAJAMEDICA, ' +
                           'EX_ACCIDENTETRANSITO, EX_ALTAMEDICA, SE_CERRADO, EX_CUIL, EX_CUIT ' +
                      'FROM SEX_EXPEDIENTES, SIN.STA_TIPOACCIDENTE, SIN.SSE_SINIESTROESTADO ' +
                     'WHERE EX_TIPO = TA_CODIGO (+) ' +
                       'AND EX_ESTADO = SE_CODIGO (+) ' +                     
                       'AND EX_ID = :ID', [Value]) do
    try
      FFechaAccidente        := FieldByName('EX_FECHAACCIDENTE').AsDateTime;
      FFechaAccidenteRecaida := FieldByName('FECHA_ACC_REC').AsDateTime;
      FFechaAlta             := FieldByName('EX_FECHAALTA').AsDateTime;
      FFechaBajaMedica       := FieldByName('EX_BAJAMEDICA').AsDateTime;
      FFechaAltaMedica       := FieldByName('EX_ALTAMEDICA').AsDateTime;
      FFechaRecepcion        := FieldByName('EX_FECHARECEPCION').AsDateTime;
      FSiniestro             := FieldByName('EX_SINIESTRO').AsInteger;
      FSiniestroCerrado      := FieldByName('SE_CERRADO').AsString = 'S';
      FOrden                 := FieldByName('EX_ORDEN').AsInteger;
      FRecaida               := FieldByName('EX_RECAIDA').AsInteger;
      FTipoAccidente         := FieldByName('EX_TIPO').AsString;
      FIdTipoAccidente       := FieldByName('TA_ID').AsInteger;
      FAccidenteDeTransito   := FieldByName('EX_ACCIDENTETRANSITO').AsString;
      FSiniestroCompleto     := FieldByName('SINIESTRO_COMPLETO').AsString;
      FCUIL                  := FieldByName('EX_CUIL').AsString;
      FCUIT                  := FieldByName('EX_CUIT').AsString;
    finally
      Free;
    end;

    LoadData;
    CambioTamanio(nil);
  end;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.SetLocked(const Value: Boolean);
begin
  if FLocked <> Value then
  begin
    FLocked := Value;
    VCLExtra.LockControls(Self, Value);
    if not Value then
      Seguridad.Ejecutar;
  end;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.dsDatosStateChange(Sender: TObject);
var
  CanModify: Boolean;
begin
  if Owner is TfrmAdmSiniestros then
    with Owner as TfrmAdmSiniestros do
    begin
      CanModify := sdqDatos.Active and sdqDatos.CanModify and fraTrabajador.IsSelected;

      tbNuevo.Enabled     := CanModify and (not CanSaveCancel) and acAgregar.Enabled and AddButtonVisible;
      tbModificar.Enabled := CanModify and (not CanSaveCancel) and acModificar.Enabled and (not sdqDatos.IsEmpty);
      tbEliminar.Enabled  := CanModify and (not CanSaveCancel) and acEliminar.Enabled and (not sdqDatos.IsEmpty);
      tbGuardar.Enabled   := CanModify and CanSaveCancel;
      tbCancelar.Enabled  := CanModify and CanSaveCancel;
      tbRefrescar.Enabled := CanModify;
      tbImprimir.Enabled  := CanModify and not CanSaveCancel and acImprimir.Enabled;
      tbNomina.Enabled    := CanModify and not CanSaveCancel;
      tbBuscarSiniestro.Enabled  := not (CanModify and CanSaveCancel);
      tbObtenerImagen.Enabled    := not (CanModify and CanSaveCancel);
      SetLocked(not CanSaveCancel);

      if sdqDatos.IsEmpty then
      begin
        pnlDatos.Caption := 'Sin datos';
        pnlDatos.Color := $00AAC6FF;
        TieneDatos := False;
      end else
      begin
        pnlDatos.Caption := 'Con datos';
        pnlDatos.Color := $00BBC6BB;
        TieneDatos := True;
      end;
    end;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetModified: Boolean;
begin
  Result := sdqDatos.UpdatesPending;
end;
{------------------------------------------------------------------------------}
constructor TSinForm.Create(AOwner: TComponent);
begin
  dHoy := DBDateTime;
  TieneDatos := False;

  inherited;

  SetLocked(True);
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Clear;
begin
  FIdExpediente := ART_EMPTY_ID;
  sdqDatos.Close;
end;
{------------------------------------------------------------------------------}
function TSinForm.CanSaveCancel: Boolean;
begin
  Result := Self.dsDatos.State in dsEditModes;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Refresh;
begin
  if dsDatos.State in dsEditModes then
    sdqDatos.Cancel
end;
{------------------------------------------------------------------------------}
procedure TSinForm.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetFechaAccidente: TDateTime;
begin
  Result := FFechaAccidente;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetFechaAccidenteRecaida: TDateTime;
begin
  Result := FFechaAccidenteRecaida;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetFechaAlta: TDateTime;
begin
  Result := FFechaAlta;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetAddButtonVisible: boolean;
begin
  Result := (not sdqDatos.Active or sdqDatos.IsEmpty or (sdqDatos.RecordCount = 0))
             and (Owner as TfrmAdmSiniestros).fraTrabajador.IsSelected
             and (Owner as TfrmAdmSiniestros).fraTrabajador.TieneSiniestro;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.CambioTamanio(Sender: TObject);
begin
  AutoSize := True;
  AutoSize := False;
end;
{------------------------------------------------------------------------------}
function TSinForm.Save: boolean;
begin
  try
    sdqDatos.ApplyUpdates;
    sdqDatos.CommitUpdates;
    CommitTrans(True);
    EjecutarSQL('COMMIT');
    Result := True;
  except
    on E: Exception do
      raise ESiniestrosException.Create(E.Message);
  end;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Validar(DataSet: TDataSet);
begin
//
end;
{------------------------------------------------------------------------------}
procedure TSinForm.AfterConstruction;
begin
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.GetFocus(Sender: TObject);
begin
  inherited;
{
  if (Sender as TColorControl).Color = clWindow then
    (Sender as TColorControl).Color := clInfoBk;
}    
end;
{------------------------------------------------------------------------------}
procedure TSinForm.Print;
begin
//
end;
{------------------------------------------------------------------------------}
function TSinForm.GetEmpresaSeleccionada: TFraEmpresa;
begin
  Result := (Owner as TfrmAdmSiniestros).fraEmpresa;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.acAgregarExecute(Sender: TObject);
begin
  Insert;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.acModificarExecute(Sender: TObject);
begin
  Edit;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetPermisoEdicion: boolean;
begin
  Result := acModificar.Enabled;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetPermisoAgregar: boolean;
begin
  Result := acAgregar.Enabled;
end;
{------------------------------------------------------------------------------}
function TSinForm.Editing: boolean;
begin
  Result := sdqDatos.State = dsEdit;
end;
{------------------------------------------------------------------------------}
function TSinForm.Inserting: boolean;
begin
  Result := sdqDatos.State = dsInsert;
end;
{------------------------------------------------------------------------------}
procedure TSinForm.acEliminarExecute(Sender: TObject);
begin
  Delete;
end;
{------------------------------------------------------------------------------}
function TSinForm.GetPermisoEliminar: boolean;
begin
  Result := acEliminar.Enabled;
end;
{------------------------------------------------------------------------------}
end.
