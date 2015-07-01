unit unFraSLM_LESIONAGENTEMATERIAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSLM_LESIONAGENTEMATERIAL = class(TfraStaticCodDesc)
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure cmbDescripcionDropDown(Sender: TObject);
  protected
    procedure LoadValues(DoChanges : boolean = False); override;
    function GetSqlOrderBy: string; override;
  public
    constructor Create(AOwner: TComponent); override;

    function IsSubTitulo(ARow: Integer = -1): Boolean;
    function IsTitulo(ARow: Integer = -1): Boolean;
  end;

var
  fraSLM_LESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL;

implementation

{$R *.dfm}

{ TfraSLM_LESIONAGENTEMATERIAL }

constructor TfraSLM_LESIONAGENTEMATERIAL.Create(AOwner: TComponent);
begin
  inherited;
  DynamicCols := True;

  TableName   := 'SIN.SLM_LESIONAGENTEMATERIAL';
  FieldID     := 'LM_ID';
  FieldCodigo := 'LM_CODIGO';
  FieldDesc   := 'LM_DESCRIPCION';
  FieldBaja   := 'LM_FECHABAJA';
  OrderBy     := 'LM_ID';
  ExtraFields := ', NVL(LM_SUBTITULO, ''N'') AS SUBTITULO, DECODE(LENGTH(LM_CODIGO), 1, ''S'', 2, ''S'', ''N'') AS TITULO ';
end;

procedure TfraSLM_LESIONAGENTEMATERIAL.cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ARow > 0) and IsTitulo(ARow) then
    AFont.Style := [fsBold]
  else if (ARow > 0) and IsSubTitulo(ARow) then
    AFont.Style := [fsItalic, fsBold]
  else
    AFont.Style := [];

  if (ARow > 0) and (IsTitulo(ARow) or IsSubTitulo(ARow)) then
  begin
    if IsTitulo(ARow) then
      AFont.Size := 9;
      
    if Highlight then
      AFont.Color := clCream
    else
      AFont.Color := clMaroon;
  end;

  inherited;
end;

function TfraSLM_LESIONAGENTEMATERIAL.IsTitulo(ARow: Integer): Boolean;
begin
  if ARow = -1 then
    ARow := cmbDescripcion.Row;

  Result := cmbDescripcion.Cells[FColBaja + 2, ARow] = 'S';
end;

function TfraSLM_LESIONAGENTEMATERIAL.IsSubTitulo(ARow: Integer): Boolean;
begin
  if ARow = -1 then
    ARow := cmbDescripcion.Row;
    
  Result := cmbDescripcion.Cells[FColBaja + 1, ARow] = 'S';
end;

procedure TfraSLM_LESIONAGENTEMATERIAL.cmbDescripcionDropDown(Sender: TObject);
begin
  VisibleExtraFields[0] := False;
  VisibleExtraFields[1] := False;
  inherited;
end;

procedure TfraSLM_LESIONAGENTEMATERIAL.LoadValues(DoChanges: boolean);
begin
  if IsTitulo(cmbDescripcion.Row) then
    Font.Style := [fsBold]
  else if IsSubTitulo(cmbDescripcion.Row) then
    Font.Style := [fsItalic]
  else
    Font.Style := [];

  inherited;
end;

function TfraSLM_LESIONAGENTEMATERIAL.GetSqlOrderBy: string;
begin
  Result := inherited GetSqlOrderBy;
  Result := ' ORDER BY LM_ID, LM_FECHABAJA DESC'; 
end;

end.
