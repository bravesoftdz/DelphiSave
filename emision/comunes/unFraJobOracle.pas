unit unFraJobOracle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PatternEdit, DateTimeEditors, StdCtrls, Mask, ToolEdit,
  DateComboBox, UnJobs, ComCtrls, ToolWin, IntEdit;

type
  TFraJobOracle = class(TFrame)
    edInterval: TEdit;
    edWhat: TMemo;
    cmbNextDate: TDateComboBox;
    btnCrear: TButton;
    btnCrearP: TButton;
    btnLeer: TButton;
    btnBorrar: TButton;
    Label1: TLabel;
    btnActualiza: TButton;
    edTiempo: TDateTimePicker;
    edJob: TIntEdit;
    procedure btnCrearClick(Sender: TObject);
    procedure btnCrearPClick(Sender: TObject);
    procedure btnLeerClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnActualizaClick(Sender: TObject);
  private
    FJobOracle: TJob;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure Crear;
    procedure CrearParam;
    procedure Borrar;
    procedure Actualizar;
    procedure Leer;
    { Public declarations }
  published
    property JobOracle: TJob read FJobOracle write FJobOracle;

  end;

implementation

uses
  General, Numeros, CustomDlgs;

{$R *.dfm}

procedure TFraJobOracle.btnCrearClick(Sender: TObject);
begin
  Crear;
end;

constructor TFraJobOracle.Create(AOwner: TComponent);
var
 nI : Integer;
begin
  inherited;
  FJobOracle:= TJob.Create;
  edTiempo.Time := 0;

  if not IsDelphiRunning then
  begin
    with self
    do   for nI := (ComponentCount - 1) downto 0
         do  if   Components[nI].InheritsFrom(TButton)
             and  TButton(Components[nI]).Visible = True
             then TButton(Components[nI]).Visible := False
  end
  else begin
    ShowMessage('Ojo! En tiempo de ejecucion hace visible = false a todos los botones.');
  end;
end;

procedure TFraJobOracle.btnCrearPClick(Sender: TObject);
begin
  CrearParam();
end;

procedure TFraJobOracle.btnLeerClick(Sender: TObject);
begin
  Leer;
end;

procedure TFraJobOracle.btnBorrarClick(Sender: TObject);
begin
  Borrar;
end;

procedure TFraJobOracle.Crear;
begin
  JobOracle.What := edWhat.Text;
  JobOracle.Next_Date:= cmbNextDate.Date + GetDecimales(edTiempo.Time);
  JobOracle.Interval := edInterval.Text;
  JobOracle.Submit;

  edJob.Value := JobOracle.ID;
end;

procedure TFraJobOracle.CrearParam;
begin
  JobOracle := TJob.Create(edWhat.Text,
                           cmbNextDate.Date + GetDecimales(edTiempo.Time));
  edJob.Value := JobOracle.ID;
end;

procedure TFraJobOracle.Borrar;
begin
  JobOracle.Remove
end;


procedure TFraJobOracle.btnActualizaClick(Sender: TObject);
begin
  Actualizar;
end;

procedure TFraJobOracle.Actualizar;
begin
  JobOracle.What := edWhat.Text;
  JobOracle.Next_Date:= cmbNextDate.Date + GetDecimales(edTiempo.Time);
  JobOracle.Interval := edInterval.Text;
  JobOracle.Change;
end;

procedure TFraJobOracle.Leer;
begin
  JobOracle.Create(edJob.Value); //lee el job
  Verificar(not JobOracle.IsSubmited, edJob, 'El job indicado no existe en la base de datos.');

  edWhat.Text         := JobOracle.What ;
  cmbNextDate.Date    := JobOracle.Next_Date;
  edTiempo.Time       := JobOracle.Next_Date;
  edInterval.Text     := JobOracle.Interval ;
end;

end.
