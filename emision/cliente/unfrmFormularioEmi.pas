unit unfrmFormularioEmi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unFraNominas, Periodos, VCLExtra;

type
  TfrmFormularioEmi = class(TForm)
    btnAceptar: TButton;
    btnCancel: TButton;
    fraNominas: TfraNominas;
    gbConservar: TGroupBox;
    chkConservarTipoForm: TCheckBox;
    chkConservarFechaPres: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraNominastbAddObservacionClick(Sender: TObject);
  private
    FIdNota: integer;
    FIdNotaPeriodo: integer;
    FContrato: integer;
    FPeriodo: string;
    procedure ActivarControles(aActive: boolean);
    procedure SetContrato(const Value: integer);
    procedure SetPeriodo(const Value: string);
  public
    property IdNota: integer read FIdNota write FIdNota;
    property IdNotaPeriodo: integer read FIdNotaPeriodo;
    property Contrato: integer read FContrato write SetContrato;
    property Periodo: string read FPeriodo write SetPeriodo;
    procedure CargarFormulario(aIdFormulario, aIdNotaPeriodo: integer;
      aPeriodo: string; aModoVer: boolean; aEstado: integer; aIlegible: boolean);
  end;

var
  frmFormularioEmi: TfrmFormularioEmi;

implementation

{$R *.dfm}

procedure TfrmFormularioEmi.FormCreate(Sender: TObject);
begin
  FIdNota:= -1;
  FIdNotaPeriodo:= -1;
  fraNominas.ParentForm := Self;
  fraNominas.Init;
end;

procedure TfrmFormularioEmi.btnAceptarClick(Sender: TObject);
begin
  if fraNominas.ValidarFormulario then
  begin
    fraNominas.GuardarFormularioBorrador(FIdNota, FIdNotaPeriodo);
    if not chkConservarTipoForm.Checked and not chkConservarFechaPres.Checked then
      ModalResult := mrOk
    else begin
      btnCancel.ModalResult := mrOk;
      btnCancel.Caption := '&Cerrar';
      fraNominas.ConservarFechaPres := chkConservarFechaPres.Checked;
//      if not chkConservarTipoForm.Checked then fraNominas.IdFormulario := -1;
      fraNominas.OnChangeTipoFormulario(Sender);
      fraNominas.Periodo := '';
      if fraNominas.ppPeriodoDesde.Enabled then
        PostMessage(fraNominas.ppPeriodoDesde.Handle, WM_SETFOCUS, 0, 0);
    end;
  end;
end;


procedure TfrmFormularioEmi.CargarFormulario(aIdFormulario,
  aIdNotaPeriodo: integer; aPeriodo: string; aModoVer: boolean; aEstado: integer; aIlegible: boolean);
begin
  FIdNotaPeriodo := aIdNotaPeriodo;
  fraNominas.CargarFormulario(aIdFormulario, aIdNotaPeriodo, aPeriodo, aModoVer, aIlegible);
  fraNominas.Estado := aEstado;
  ActivarControles(not aModoVer);
  LockControls(gbConservar, True);
end;

procedure TfrmFormularioEmi.fraNominastbAddObservacionClick(
  Sender: TObject);
begin
  fraNominas.CargarVerificaciones(FIdNotaPeriodo);
end;

procedure TfrmFormularioEmi.ActivarControles(aActive: boolean);
begin
  btnAceptar.Enabled := aActive;
  if not aActive then
    btnCancel.Caption := '&Cerrar';
end;

procedure TfrmFormularioEmi.SetContrato(const Value: integer);
begin
  FContrato := Value;
  fraNominas.Contrato := FContrato;
end;

procedure TfrmFormularioEmi.SetPeriodo(const Value: string);
begin
  FPeriodo := Value;
  if (FPeriodo <> '') then
    fraNominas.Periodo := FPeriodo;
end;

end.
