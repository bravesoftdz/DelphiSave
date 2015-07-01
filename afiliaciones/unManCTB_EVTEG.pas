unit unManCTB_EVTEG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unManCtbTablas, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, PatternEdit, ExtCtrls,
  FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraStaticCodigoDescripcion, Mask, unFraStaticCTB_TABLAS, unArtDBAwareFrame;

type
  TfrmManCTB_EVTEG = class(TfrmManCtbTablas)
    fraTB_ESPECIAL1: TfraStaticCodigoDescripcion;
    Label1: TLabel;
    fraTB_ESPECIAL2: TfraStaticCTB_TABLAS;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure DoABMAddFields; override;
    procedure LoadControls; override;
    procedure SetEspecialVisible(const Value: Boolean); override;
  public
  end;

var
  frmManCTB_EVTEG: TfrmManCTB_EVTEG;

implementation

uses
  unPrincipal, CustomDlgs;

{$R *.DFM}

procedure TfrmManCTB_EVTEG.DoABMAddFields;
begin
  inherited;

  Sql.Fields.Add('tb_especial2', fraTB_ESPECIAL2.Value);
end;

procedure TfrmManCTB_EVTEG.ClearControls;
begin
  inherited;

  fraTB_ESPECIAL1.Clear;
  fraTB_ESPECIAL2.Clear;
end;

function TfrmManCTB_EVTEG.DoABM: Boolean;
begin
  edEspecial.Text := IntToStr(fraTB_ESPECIAL1.Value);

  Result := inherited DoABM;
end;

procedure TfrmManCTB_EVTEG.LoadControls;
begin
  inherited;

  if sdqConsulta.FieldByName('tb_especial1').AsString <> '' then
    fraTB_ESPECIAL1.Value := sdqConsulta.FieldByName('tb_especial1').AsInteger;

  fraTB_ESPECIAL2.Value := sdqConsulta.FieldByName('tb_especial2').AsString;
end;

procedure TfrmManCTB_EVTEG.SetEspecialVisible(const Value: Boolean);
begin
  inherited;

  edEspecial.Visible := False;
end;

function TfrmManCTB_EVTEG.Validar: Boolean;
begin
  Result := inherited Validar;

  if Result and fraTB_ESPECIAL2.IsEmpty then
  begin
    Result := False;
    InvalidMsg(fraTB_ESPECIAL2.edCodigo, 'El Tipo de Evento es obligatorio.');
  end;
end;

procedure TfrmManCTB_EVTEG.FormCreate(Sender: TObject);
begin
  inherited;

  Clave           := 'EVTEG';
  EspecialVisible := True;

  with fraTB_ESPECIAL1 do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := False;
  end;

  with fraTB_ESPECIAL2 do
  begin
    Clave     := 'TEVTE';
    ShowBajas := False;
  end;
end;

end.
