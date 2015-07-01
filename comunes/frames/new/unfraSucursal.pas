unit unfraSucursal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraStaticCodigoDescripcion, ComboEditor,
  ComboGrid, StdCtrls, Mask, PatternEdit, unArt, unFraCodigoDescripcion, Db, SDEngine, ToolEdit, ArtComboBox;

type
  TfraSucursal = class(TfraStaticCodigoDescripcion)
  private
    fCentroReg: TTableID;
    fEntidad: TTableID;

    function GetCentroReg: TTableId;
    function GetEntidad: TTableId;

    procedure SetCentroReg(const AValue: TTableId);
    procedure SetEntidad(const AValue: TTableId);
  protected
    FColCentroReg: Integer;
    FColEntidad: Integer;

    function GetStaticColCount: Integer; override;
    function IsRowFiltered(ARow: Integer): Boolean; override;
    
    procedure LoadRow(ADataSet: TDataSet; ARow: Integer); override;

    {Oculta las Propiedades}
    property ExtraFields;
    property FieldBaja;    
    property FieldCodigo;
    property FieldDesc;
    property FieldID;
    property TableName;
  public
    constructor Create(AOwner: TComponent); override;

    property CentroReg: TTableId read GetCentroReg write SetCentroReg;
    property Entidad: TTableId   read GetEntidad   write SetEntidad;    
  end;

var
  fraSucursal: TfraSucursal;

implementation

uses
  AnsiSql;

{$R *.DFM}

{ TfraSucursal }

constructor TfraSucursal.Create(AOwner: TComponent);
begin
  inherited;

  TableName     := 'ASU_SUCURSAL';
  FieldID       := 'SU_ID';
  FieldCodigo   := 'SU_CODSUCURSAL';
  FieldDesc     := 'SU_DESCRIPCION';
  FieldBaja     := 'SU_FECHABAJA';
  ExtraFields   := ', SU_IDENTIDAD, SU_IDCENTROREG ';
  FColEntidad   := FColbaja + 1;
  FColCentroReg := FColbaja + 2;
  FCustomFilter := True;
//  cmbDescripcion.ColCount := 4;
end;

function TfraSucursal.GetEntidad: TTableId;
begin
  Result := StrToIntDef(cmbDescripcion.Cells[FColEntidad, cmbDescripcion.Row], ART_EMPTY_ID);
end;

function TfraSucursal.GetCentroReg: TTableId;
begin
  Result := StrToIntDef(cmbDescripcion.Cells[FColCentroReg, cmbDescripcion.Row], ART_EMPTY_ID);
end;

procedure TfraSucursal.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;
  
  cmbDescripcion.Cells[FColEntidad, ARow]   := ADataSet.FieldByName('SU_IDENTIDAD').AsString;
  cmbDescripcion.Cells[FColCentroReg, ARow] := ADataSet.FieldByName('SU_IDCENTROREG').AsString;
end;

procedure TfraSucursal.SetCentroReg(const AValue: TTableId);
begin
  if fCentroReg <> AValue then
  begin
    fCentroReg := AValue;
    if fCentroReg <> ART_EMPTY_ID then
      if IsSelected and (CentroReg <> fCentroReg) then
        Clear;
    DoFilterChange;
  end;
end;

procedure TfraSucursal.SetEntidad(const AValue: TTableId);
begin
  if fEntidad <> AValue then
  begin
    fEntidad := AValue;
    if fEntidad <> ART_EMPTY_ID then
      if IsSelected and (Entidad <> fEntidad) then
        Clear;
    DoFilterChange;
  end;
end;

function TfraSucursal.IsRowFiltered(ARow: Integer): boolean;
var
  Filtrar: Boolean;
begin
  Filtrar := inherited IsRowFiltered(ARow);
  
  if not Filtrar Then
  begin
    if fEntidad <> ART_EMPTY_ID then
      Filtrar := Filtrar or (cmbDescripcion.Cells[FColEntidad, ARow] <> IntToStr(fEntidad));
    if fCentroReg <> ART_EMPTY_ID then
      Filtrar := Filtrar or (cmbDescripcion.Cells[FColCentroReg, ARow] <> IntToStr(fCentroReg));
  end;

  Result := Filtrar;
end;

function TfraSucursal.GetStaticColCount: Integer;
begin
  Result := inherited GetStaticColCount + 2;
end;

end.
