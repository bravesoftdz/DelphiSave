unit unfraStaticActividad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraStaticCodigoDescripcion, ComboEditor,
  ComboGrid, StdCtrls, PatternEdit, Mask, DB;

type
  TfraStaticActividad = class(TfraStaticCodigoDescripcion)
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment;
                                          var Background: TColor; Highlight: Boolean);
  private
    function GetCantidadTrabajadoresAutocotizable: Integer;
    function GetCIIUViejo: Integer;
  protected
    function GetDataValue(Index: Integer): String; override;

    procedure LoadRow(ADataSet: TDataSet; ARow: Integer); override;
    procedure LoadValues(DoChanges: Boolean); override;

    {Oculta las Propiedades}
    property TableName;
    property FieldID;
    property FieldCodigo;
    property FieldDesc;
//    property FieldBaja;
    property ExtraFields;
  public
    constructor Create(AOwner: TComponent); override;

    function IsExcluido(ARow: Integer = -1): Boolean;
    function IsNoAutoCotizable(ARow: Integer = -1): Boolean;

    property CantidadTrabajadoresAutocotizable: Integer read GetCantidadTrabajadoresAutocotizable;
    property CIIUViejo: Integer                         read GetCIIUViejo;
  end;

implementation

uses
  AnsiSql;

{$R *.DFM}

constructor TfraStaticActividad.Create(AOwner: TComponent);
begin
  inherited;

  TableName       := 'cac_actividad';
  FieldID         := 'ac_id';
  FieldCodigo     := 'ac_codigo';
  FieldDesc       := 'UPPER(ac_descripcion)';
  ExtraCondition	:= ' AND LENGTH(ac_codigo) = 6';
  FieldBaja       := SQL_NULL;
end;

function TfraStaticActividad.GetCantidadTrabajadoresAutocotizable: Integer;
begin
  try
    Result := StrToIntDef(cmbDescripcion.Cells[cmbDescripcion.ColCount + 3, cmbDescripcion.Row], -1);
  except
    Result := 25;
  end;
end;

function TfraStaticActividad.GetCIIUViejo: Integer;
begin
  try
    Result := StrToIntDef(cmbDescripcion.Cells[cmbDescripcion.ColCount + 2, cmbDescripcion.Row], -1);
  except
    Result := -1;
  end;
end;

function TfraStaticActividad.GetDataValue(Index: Integer): String;
begin
  if Index = 0 then
    Result := GetSql
  else if Index = 7 then    // AC_COTIZABLE, AC_EXCLUIDO, AC_RELACION y AC_AUTOCOTIZA como ExtraFields fijo...
    Result := FDataValue[Index] + ' , ac_cotizable, ac_excluido, ac_relacion, ac_autocotiza '
  else
    Result := FDataValue[Index];
end;

function TfraStaticActividad.IsExcluido(ARow: Integer = -1): Boolean;
begin
  if ARow = -1 then
    ARow := cmbDescripcion.Row;

  Result := cmbDescripcion.Cells[cmbDescripcion.ColCount + 1, ARow] = 'S';
end;

function TfraStaticActividad.IsNoAutoCotizable(ARow: Integer = -1): Boolean;
begin
  if ARow = -1 then
    ARow := cmbDescripcion.Row;

  Result := cmbDescripcion.Cells[cmbDescripcion.ColCount, ARow] = 'N';
end;


procedure TfraStaticActividad.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;

  cmbDescripcion.Cells[FColBaja + 1, ARow] := ADataSet.FieldByName('ac_cotizable').AsString;
  cmbDescripcion.Cells[FColBaja + 2, ARow] := ADataSet.FieldByName('ac_excluido').AsString;
  cmbDescripcion.Cells[FColBaja + 3, ARow] := ADataSet.FieldByName('ac_relacion').AsString;
  cmbDescripcion.Cells[FColBaja + 4, ARow] := ADataSet.FieldByName('ac_autocotiza').AsString;
end;

procedure TfraStaticActividad.LoadValues(DoChanges: boolean);
begin
  if IsNoAutoCotizable(cmbDescripcion.Row) then
    Font.Color := clPurple;

  if IsExcluido(cmbDescripcion.Row) then
    Font.Color := StringToColor('$000100FF');

  inherited;
end;


procedure TfraStaticActividad.cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont;
                                                          var AAlignment: TAlignment; var Background: TColor;
                                                          Highlight: Boolean);
begin
  if (ARow > 0) then
  begin
    if IsNoAutoCotizable(ARow) then
      AFont.Color := clPurple;

    if IsExcluido(ARow) then
      AFont.Color := StringToColor('$000100FF');
  end;

  inherited;
end;

end.
