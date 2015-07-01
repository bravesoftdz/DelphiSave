unit unManSituacionesCheques;

interface            

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, Mask, PatternEdit,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, unArtDBAwareFrame;

type
  TfrmManSituacionesCheques = class(TfrmManCtbTablas)
    fraEspecial: TfraCtbTablas;
    rgSectorAsignado: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    procedure ClearControls; override;
    procedure DoABMAddFields; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
  public
  end;

var
  frmManSituacionesCheques: TfrmManSituacionesCheques;

implementation

{$R *.DFM}

Uses
  General, CustomDlgs;
  
procedure TfrmManSituacionesCheques.ClearControls;
begin
  inherited;

  fraEspecial.Clear;
  rgSectorAsignado.ItemIndex := -1;
end;

procedure TfrmManSituacionesCheques.DoABMAddFields;
var
  sSectorAsignado: String;
begin
  edEspecial.Text  := fraEspecial.Value;

  case rgSectorAsignado.ItemIndex of
    0: sSectorAsignado := 'B';
    1: sSectorAsignado := 'T';
    2: sSectorAsignado := 'D';
  end;
  edEspecial2.Text := sSectorAsignado;

  inherited;
end;

procedure TfrmManSituacionesCheques.LoadControls;
var
  iSector: Integer;
begin
  inherited;

  fraEspecial.Value := sdqConsulta.FieldByName('TB_ESPECIAL1').AsString;

  if sdqConsulta.FieldByName('TB_ESPECIAL2').AsString = 'B' then
    iSector := 0
  else if sdqConsulta.FieldByName('TB_ESPECIAL2').AsString = 'T' then
    iSector := 1
  else 
    iSector := 2;

  rgSectorAsignado.ItemIndex := iSector;
end;

procedure TfrmManSituacionesCheques.FormCreate(Sender: TObject);
begin
  inherited;

  Clave := 'SITCH';
  EspecialVisible  := True;
  Especial2Visible := True;

  tbModificar.Visible := True;

  fraEspecial.Clave := 'TESCH';
  fraEspecial.ShowBajas := False;

  edEspecial.Visible  := False;
  edEspecial2.Visible := False;
  lbEspecial2.Visible := False;
end;

procedure TfrmManSituacionesCheques.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Fields.Clear;
  inherited;
end;

procedure TfrmManSituacionesCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmManSituacionesCheques := nil;
end;

function TfrmManSituacionesCheques.Validar: Boolean;
begin
  Verificar(fraEspecial.IsEmpty, fraEspecial.edCodigo, 'Debe ingresar el valor de Especial');
  Verificar(rgSectorAsignado.ItemIndex = -1, rgSectorAsignado, 'Debe ingresar el valor de Sector Asignado');

  Result := inherited Validar;
end;

end.
