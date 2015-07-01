unit unFraSLF_LESIONFORMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSLF_LESIONFORMA = class(TfraStaticCodDesc)
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure cmbDescripcionDropDown(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    procedure LoadValues(DoChanges: boolean); override;
    function IsSubTitulo(ARow: Integer = -1): Boolean;
  end;

var
  fraSLF_LESIONFORMA: TfraSLF_LESIONFORMA;

implementation

{$R *.dfm}

{ TfraSLF_LESIONFORMA }

constructor TfraSLF_LESIONFORMA.Create(AOwner: TComponent);
begin
  inherited;
  DynamicCols := True;
  
  TableName   := 'SIN.SLF_LESIONFORMA';
  FieldID     := 'LF_ID';
  FieldCodigo := 'LF_CODIGO';
  FieldDesc   := 'LF_DESCRIPCION';
  FieldBaja   := 'LF_FECHABAJA';
  ExtraFields := ', NVL(LF_SUBTITULO, ''N'') AS SUBTITULO ';  
end;

procedure TfraSLF_LESIONFORMA.cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ARow > 0) and IsSubTitulo(ARow) then
    AFont.Style := [fsItalic, fsBold]
  else
    AFont.Style := [];

  if (ARow > 0) and IsSubTitulo(ARow) then
  begin
    if Highlight then
      AFont.Color := clCream
    else
      AFont.Color := clMaroon;
  end;

  inherited;
end;

function TfraSLF_LESIONFORMA.IsSubTitulo(ARow: Integer): Boolean;
begin
  if ARow = -1 then
    ARow := cmbDescripcion.Row;

  Result := cmbDescripcion.Cells[FColBaja + 1, ARow] = 'S';
end;

procedure TfraSLF_LESIONFORMA.cmbDescripcionDropDown(Sender: TObject);
begin
  VisibleExtraFields[0] := False;
  inherited;
end;

procedure TfraSLF_LESIONFORMA.LoadValues(DoChanges: boolean);
begin
  if IsSubTitulo(cmbDescripcion.Row) then
    Font.Style := [fsItalic]
  else
    Font.Style := [];

  inherited;
end;

end.
