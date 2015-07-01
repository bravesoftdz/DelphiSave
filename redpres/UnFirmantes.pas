unit UnFirmantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, StdCtrls, PatternEdit, DBIncrementalSearch, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ExtCtrls, unDMPrincipal, Mask, IntEdit,
  unfraFirmantes;

type
  TfrmFirmantes = class(TForm)
    dbgDatos: TArtDBGrid;
    sdqFirmas: TSDQuery;
    dsFirmas: TDataSource;
    sdqFirmasUSUARIO: TStringField;
    sdqFirmasCARACTER: TStringField;
    Label2: TLabel;
    pnlbtnAceptar: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqFirmasCODFIRMA: TFloatField;
    fraFirmante: TfraFirmantes;
    sdqFirmasfi_codusuario: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDatosKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure OnFraFirmanteChange(Sender: TObject);
    procedure fraFirmanteExit(Sender: TObject);
    procedure sdqFirmasAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
  private
    FArea :String;
    procedure SetArea(const Value: String);
  public
    property Area: String     read FArea        write SetArea;
  end;

implementation

uses unComunes;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.dbgDatosKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then btnAceptar.Click;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.SetArea(const Value: String);
begin
  if FArea <> Value then
  begin
    FArea := Value;
    sdqFirmas.Close;
    sdqFirmas.ParamByName('area').AsString := FArea;
    sdqFirmas.Open;
    fraFirmante.Area    := FArea;
    fraFirmante.OrderBy := 'fi_firmante';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.FormCreate(Sender: TObject);
begin
  fraFirmante.OnChange := OnFraFirmanteChange;
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.OnFraFirmanteChange(Sender: TObject);
begin
  if not fraFirmante.IsEmpty then
    sdqFirmas.Locate('codfirma', fraFirmante.Value, []);
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.fraFirmanteExit(Sender: TObject);
begin
  fraFirmante.FrameExit(Sender);
  OnFraFirmanteChange(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.sdqFirmasAfterScroll(DataSet: TDataSet);
begin
  fraFirmante.Cargar(sdqFirmasCODFIRMA.AsInteger);
end;
{-------------------------------------------------------------------------------}
procedure TfrmFirmantes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = 65) {A} and (ssAlt in Shift) then    // TK 31280
   fraFirmanteExit(self);
end;
{-------------------------------------------------------------------------------}
end.
