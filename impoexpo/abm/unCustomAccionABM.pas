unit unCustomAccionABM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomPanelABM, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl,
  StdCtrls, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unFraCodigoDescripcion,
  unArt;

type
  TfrmCustomAccionABM = class(TfrmCustomPanelABM)
    fraPrimaryKey: TfraCodigoDescripcion;
    lbPrimaryKey: TLabel;
    procedure FSFormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    procedure OnfraPrimaryKeyChange(Sender: TObject);
  protected
    procedure HideNoModalControls;
  public
    function Edit(AIdAction: TTableId): boolean;
    function Insert: TTableId;
  end;

  TfrmCustomAccionABMClass = class of TfrmCustomAccionABM;

implementation

uses unPrincipal;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmCustomAccionABM }
{----------------------------------------------------------------------------------------------------------------------}
function TfrmCustomAccionABM.Edit(AIdAction: TTableId): boolean;
begin
  HideNoModalControls;

  fraPrimaryKey.Value := AIdAction;
  PKChange(fraPrimaryKey.IsSelected);
  fraPrimaryKey.Locked := True;

  tbModificarClick(tbModificar);

  Result := ShowModal = mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomAccionABM.HideNoModalControls;
begin
  tbNuevo.Visible := False;
  tbModificar.Visible := False;
  tbEliminar.Visible := False;
  ToolButton4.Visible := False;
  btnAplicar.Visible := False;
  ToolButton11.Visible := False;
  tbSalir.Visible := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmCustomAccionABM.Insert: TTableId;
begin
  fraPrimaryKey.Locked := True;
  
  HideNoModalControls;

  tbNuevoClick(tbNuevo);

  if ShowModal = mrOk Then
    Result := fraPrimaryKey.Value
  else
    Result := ART_EMPTY_ID;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomAccionABM.OnfraPrimaryKeyChange(Sender: TObject);
begin
  PKChange(fraPrimaryKey.IsSelected);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomAccionABM.FSFormCreate(Sender: TObject);
begin
  inherited;

  with fraPrimaryKey do
  begin
    OnChange := OnfraPrimaryKeyChange;
    ShowBajas := True;
    CaseSensitive := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomAccionABM.btnAceptarClick(Sender: TObject);
begin
  inherited;

  if (fsModal in FormState) and (ModoABM = maNone) Then
    ModalResult := mrOk;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
