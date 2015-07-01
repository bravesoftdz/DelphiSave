unit unManCTB_FEEND;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraStaticCodigoDescripcion,
  unArtFrame;

type
  TfrmManCTB_FEEND = class(TfrmManCtbTablas)
    rbEndoso: TRadioButton;
    rbMovimiento: TRadioButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure SetEspecialVisible(const Value: Boolean); override;
  public
  end;

var
  frmManCTB_FEEND: TfrmManCTB_FEEND;

implementation

uses
  CustomDlgs, unPrincipal;

{$R *.DFM}

procedure TfrmManCTB_FEEND.ClearControls;
begin
  inherited;
  
  rbEndoso.Checked := False;
  rbMovimiento.Checked := False;
end;

function TfrmManCTB_FEEND.DoABM: Boolean;
begin
  if rbEndoso.Checked then
    edEspecial.Text := '1'
  else
    edEspecial.Text := '2';

  Result := inherited DoABM;
end;

procedure TfrmManCTB_FEEND.FormCreate(Sender: TObject);
begin
  inherited;
  
  Clave := 'FEEND';
  EspecialVisible := True;
end;

procedure TfrmManCTB_FEEND.LoadControls;
begin
  inherited;
  
  if sdqConsulta.FieldByName('tb_especial1').AsString = '1' then
    rbEndoso.Checked := True
  else
    rbMovimiento.Checked := True;
end;

procedure TfrmManCTB_FEEND.SetEspecialVisible(const Value: Boolean);
begin
  inherited;

  edEspecial.Visible := False;
  lbEspecial.Visible := False;
end;

function TfrmManCTB_FEEND.Validar: Boolean;
begin
  Result := inherited Validar;

  if Result and (not rbEndoso.Checked) and (not rbMovimiento.Checked) then
  begin
    Result := False;
    InvalidMsg(rbEndoso, 'El Tipo de Acción es obligatoria.');
  end;
end;

end.
