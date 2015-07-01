unit unfraMotivoEndoso;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   18-12-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraStaticCodigoDescripcion, ComboEditor,
  ComboGrid, StdCtrls, Mask, PatternEdit,unFraCodigoDescripcion, Db;

type
  TCtbCodigo = string;
  TfraMotivoEndoso = class(TfraStaticCodigoDescripcion)
  private
  protected
    FColTipoMovimiento: integer;
    {$IFDEF ART2}
    function GetValue: TCtbCodigo;
    procedure SetValue(const Value: TCtbCodigo); reintroduce;
    {$ENDIF}

    function GetIsEmpty: Boolean; override;
    function GetSql: String; override;
    function GetStaticColCount: Integer; override;

    procedure LoadRow(ADataSet: TDataSet; ARow: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    {$IFDEF ART2}
    property Value: TCtbCodigo read GetValue write SetValue;
    {$ENDIF}
  end;

var
  fraMotivoEndoso: TfraMotivoEndoso;

implementation      

{$R *.DFM}

constructor TfraMotivoEndoso.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'ctb_tablas t1';
  FieldID     := 't1.tb_codigo';
  FieldCodigo := 't1.tb_codigo';
  FieldDesc   := 't1.tb_descripcion';
  FieldBaja   := 't1.tb_fechabaja';

  FColTipoMovimiento := FColBaja + 1;
end;

function TfraMotivoEndoso.GetSql: String;
begin
  Result :=
    'SELECT t1.tb_codigo ' + CD_ALIAS_ID + ',' +
          ' t1.tb_codigo ' + CD_ALIAS_CODIGO + ',' +
          ' t1.tb_descripcion ' + CD_ALIAS_DESC + ',' +
          ' t1.tb_fechabaja ' + CD_ALIAS_BAJA + ',' +
          ' t2.tb_descripcion tipomovim ' + ExtraFields +
     ' FROM ctb_tablas t1, ctb_tablas t2' +
    ' WHERE t1.tb_clave = ''MOTEN''' +
      ' AND t2.tb_clave = ''FEEND''' +
      ' AND t1.tb_especial1 = t2.tb_codigo' +
      ' AND t1.tb_especial1 <> ''1'' AND t1.tb_codigo <> ''0'' ';
            ExtraCondition;
end;

function TfraMotivoEndoso.GetStaticColCount: Integer;
begin
  Result := inherited GetStaticColCount + 1;
end;

procedure TfraMotivoEndoso.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;
  cmbDescripcion.Cells[FColTipoMovimiento, ARow] := ADataSet.FieldByName('tipomovim').AsString;
end;

{$IFDEF ART2}
function TfraMotivoEndoso.GetValue: TCtbCodigo;
begin
  FrameExit(nil);
  if cmbDescripcion.Row > FFixedRows - 1 then
    Result := cmbDescripcion.Cells[FColId, cmbDescripcion.Row]
  else
    Result := '';
end;

procedure TfraMotivoEndoso.SetValue(const Value: TCtbCodigo);
var
  iRow: Integer;
begin
  if Value = '' then
    Clear
  else
  begin
    CheckData;
    iRow := cmbDescripcion.FindRow(FFixedRows, [FColId], [Value]);

    if iRow > FFixedRows - 1 then
    begin
      cmbDescripcion.Row := iRow;
      LoadValues(False);
    end
    else
      Clear;
  end;
end;
{$ENDIF}

function TfraMotivoEndoso.GetIsEmpty: Boolean;
begin
  if cmbDescripcion.RowCount = 1 then
    Result := True
  else
    Result := Value = '';
end;

end.
