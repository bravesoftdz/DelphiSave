unit unFraTipoEstudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unfraCtbTablas, Db, SDEngine, PatternEdit,
  StdCtrls, Mask, ToolEdit, ArtComboBox, unfraOperativo, unFraReconfirmacion, unArt;

type
  TfraTipoEstudio = class(TfraCtbTablas)
  private
    FFrameOperativo: TfraOperativo;
    FFrameReconfirmacion: TfraReconfirmacion;
    FPeriodoOriginal: TPeriod;

    property Clave;
  protected
    procedure Change; override;
    procedure SetValue(const Value: String); //override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FrameOperativo     : TfraOperativo      read FFrameOperativo      write FFrameOperativo;
    property FrameReconfirmacion: TfraReconfirmacion read FFrameReconfirmacion write FFrameReconfirmacion;
    property PeriodoOriginal    : TPeriod            read FPeriodoOriginal     write FPeriodoOriginal;
  end;
{
var
  fraTipoEstudio: TfraTipoEstudio;
}

const
  TE_EXAMEN_EGRESO         = 'EE';
  TE_EXAMEN_PERIODICO      = 'EP';
  TE_EXAMEN_RECONFIRMACION = 'R';

implementation

{$R *.DFM}

{ TfraEstadoAmp }
procedure TfraTipoEstudio.Change;
begin
  if Assigned(FFrameOperativo) then
  begin
    if Value <> TE_EXAMEN_PERIODICO then
    begin
      FFrameOperativo.Clear;
      FFrameOperativo.ForeColor := clBtnFace;
      FFrameOperativo.ReadOnly  := True;
    end
    else
    begin
      FFrameOperativo.Cargar(PeriodoOriginal);
      FFrameOperativo.ForeColor := clWindow;
      FFrameOperativo.ReadOnly  := False;
    end;
  end;

  if Assigned(FFrameReconfirmacion) then
  begin
    if Value <> TE_EXAMEN_RECONFIRMACION then
    begin
      FFrameReconfirmacion.Clear;
      FFrameReconfirmacion.ForeColor := clBtnFace;
      FFrameReconfirmacion.ReadOnly  := True;
    end
    else
    begin
      FFrameReconfirmacion.ForeColor := clWindow;
      FFrameReconfirmacion.ReadOnly  := False;
    end;
  end;
  
  inherited;
end;

constructor TfraTipoEstudio.Create(AOwner: TComponent);
begin
  inherited;
  Clave := 'TAMP'
end;

procedure TfraTipoEstudio.SetValue(const Value: String);
begin
  inherited SetValue(Value);
  Change;
end;

end.
