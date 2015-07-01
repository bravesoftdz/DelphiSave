unit unfraProgramacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, JvExControls, JvComponent, JvgCheckBox,
  PeriodoPicker, StdCtrls, Mask, ToolEdit, DateComboBox, ExtCtrls, DB,
  SDEngine, VclExtra;



type
  TfraOpcionProgramacion = class(TFrame)
    cbOpcion: TJvgCheckBox;
    tbProcesosEmision: TToolBar;
    tbExplorar: TToolButton;
    edtPeriodoComprendido: TPeriodoPicker;
    lblPeriodoComprendido: TLabel;
    Bevel1: TBevel;
    tbReprogramar: TToolButton;
    sdqProgramacion: TSDQuery;
    tbEjecutar: TToolButton;
    lblError: TLabel;
    cbInmediato: TCheckBox;
    pnFechasProgramacion: TPanel;
    lblEjecucion: TLabel;
    lblProximaEjecucion: TLabel;
    edtFechaEjecucion: TDateComboBox;
    edtFechaAnteriorEjecucion: TDateComboBox;
    procedure tbReprogramarClick(Sender: TObject);
    procedure edtFechaEjecucionChange(Sender: TObject);
    procedure edtFechaEjecucionExit(Sender: TObject);
    procedure cbOpcionClick(Sender: TObject);
    procedure cbInmediatoClick(Sender: TObject);
    procedure tbExplorarClick(Sender: TObject);
    procedure tbEjecutarClick(Sender: TObject);
  private
    FID: Integer;
    FJob : Integer;
    FEstado : Integer;
    FFechaEmision : TDateTime;
    FFechaAnterior : TDateTime;
    procedure SetID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property ID : Integer read FID write SetID;
    constructor Create(AOwner : TComponent; AId: Integer); reintroduce; overload; 
  end;

implementation

uses unDmPrincipal, unDmEmision, unJobs, CustomDlgs,
      unConstEmision, SqlFuncs, AnsiSql, DbFuncs,
  unFrmDetalleDevengadoGrupo;


{$R *.dfm}

{ TfraOpcionProgramacion }


procedure TfraOpcionProgramacion.SetID(const Value: Integer);
begin
  FID := Value;
  lblError.visible := False;

  sdqProgramacion.ParamByName('Id').AsInteger := Value;
  sdqProgramacion.Open;

  if sdqProgramacion.RecordCount > 0 then
  begin
    edtPeriodoComprendido.Text := sdqProgramacion.FieldByName('periodo_comprometido').AsString;
    if not sdqProgramacion.FieldByName('job').isnull then
    begin
      edtFechaEjecucion.Date := sdqProgramacion.FieldByName('next_date').AsDateTime;
      edtFechaAnteriorEjecucion.Date := sdqProgramacion.FieldByName('last_date').AsDateTime;

      FJob := sdqProgramacion.FieldByName('job').AsInteger;
    end else
    begin
      lblError.Caption := 'Error..' + 'No se encontró la programación correspondiente a este grupo.';
      lblError.visible := true;
    end;


      FEstado := sdqProgramacion.FieldByName('estado').AsInteger;
//    FFechaEmision := sdqProgramacion.FieldByName('fecha_emision').AsDateTime;
    cbInmediato.Checked := sdqProgramacion.FieldByName('emisioninmediato').AsString = 'S';

    if (FEstado = ESTADO_DEV_DEVENGADO) and (FFechaEmision < edtFechaEjecucion.Date) then
    begin
      lblError.Caption := 'Error..' + 'La emisión se encuentra programada a pesar de que ya se generó para el período.';
      lblError.visible := true;
    end;

    if (FEstado = ESTADO_DEV_EST_NOCORRESPONDE) then
    begin
      lblError.Caption := 'Error..' + 'La emisión estimada mensual no corresponde.';
      lblError.visible := true;
    end;
    if (FEstado = ESTADO_DEV_REAL_NOCORRESPONDE) then
    begin
      lblError.Caption := 'Error..' + 'La emisión real mensual no corresponde.';
      lblError.visible := true;
    end;
    sdqProgramacion.Close;
  end;
end;


procedure TfraOpcionProgramacion.tbReprogramarClick(Sender: TObject);
begin
  if FJob < 1 then exit;
  LockControl(edtFechaEjecucion, false);
//  LockControl(edtFechaAnteriorEjecucion, false);
  tbReprogramar.Enabled := false;
  FFechaAnterior := edtFechaEjecucion.Date;
end;

procedure TfraOpcionProgramacion.edtFechaEjecucionChange(Sender: TObject);
begin
//  if edtFechaEjecucion.IsValid then
//    edtFechaEjecucion.Date := IncMonth(edtFechaEjecucion.Date, 1);
end;

procedure TfraOpcionProgramacion.edtFechaEjecucionExit(Sender: TObject);
begin
  if not edtFechaEjecucion.IsValid and
     not edtFechaEjecucion.IsEmpty then exit;

  if (edtFechaEjecucion.Date <> FFechaAnterior) and
     (MessageDlg('¿Confirma el cambio de fecha de la programación de la emisión?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
  begin
    VerificarMultiple(['Verificando fecha de proceso.',
                        edtFechaEjecucion, edtFechaEjecucion.Date > DBDate, 'La fecha no puede estar en el pasado.']
                       );
    LockControl(edtFechaEjecucion, true);
//    LockControl(edtFechaAnteriorEjecucion, true);
    tbReprogramar.Enabled := True;
    Job_NextDate(FJob, edtFechaEjecucion.Date);
    SetID(FId);
  end;
end;

procedure TfraOpcionProgramacion.cbOpcionClick(Sender: TObject);
begin
  // Para que no pueda ser cambiado su estado sin necesidad de deshabilitarlo.
  cbOpcion.Checked := not cbOpcion.Checked;
end;

procedure TfraOpcionProgramacion.cbInmediatoClick(Sender: TObject);
begin
  EjecutarSql('update emi.ige_grupoemision set GE_EMISIONINMEDIATO = ' +
                SqlBoolean(cbInmediato.Checked) + ' where ge_id = ' + SqlValue(FId));
end;

procedure TfraOpcionProgramacion.tbExplorarClick(Sender: TObject);
begin
 with TfrmDetalleDevengadosGrupo.Create(self) do
 try
   MostrarResumenesDevengadoGrupo(FId);
 finally
   free;
 end;
end;

constructor TfraOpcionProgramacion.Create(AOwner : TComponent; AId: Integer);
begin
  inherited create(AOwner);
  SetID(AId);
  LockControl(edtFechaEjecucion, true);
  LockControl(edtFechaAnteriorEjecucion, true);
end;

procedure TfraOpcionProgramacion.tbEjecutarClick(Sender: TObject);
begin
  Job_Run(FJob);
end;

end.
