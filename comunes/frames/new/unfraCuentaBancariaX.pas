unit unfraCuentaBancariaX;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls, Mask,
  PatternEdit, unFraCodigoDescripcion, Db;

type
  TfraCuentaBancariaX = class(TfraStaticCodigoDescripcion)
  private
  protected
    FColSucursal,
    FColBanco: Integer;
    function GetSql: String; override;
    procedure LoadRow(ADataSet: TDataSet; ARow : Integer); override;
    function GetStaticColCount: Integer; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraCuentaBancariaX }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraCuentaBancariaX.Create(AOwner: TComponent);
begin
  inherited;

  TableName   := 'ZCB_CUENTABANCARIA';
  FieldID     := 'CB_ID';
  FieldCodigo := 'CB_ID';
  FieldDesc   := 'CB_NUMERO';
  FieldBaja   := 'CB_FECHABAJA';

  FColSucursal := FColBaja + 1;
  FColBanco    := FColBaja + 2;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancariaX.GetSql: String;
begin
  Result := 'SELECT ' + FieldId +     ' AS ' + CD_ALIAS_ID                                                               + ', ' +
                        FieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' +
                        FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                        FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ', ' +
                        'BA_NOMBRE, CB_SUCURSAL ' + ExtraFields +
              'FROM ZCB_CUENTABANCARIA, ZBA_BANCO ' +
            ' WHERE CB_IDBANCO = BA_ID ' + ExtraCondition
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancariaX.GetStaticColCount: Integer;
begin
  Result := inherited GetStaticColCount + 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancariaX.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;
  cmbDescripcion.Cells[FColSucursal, ARow] := ADataSet.FieldByName('CB_SUCURSAL').AsString;
  cmbDescripcion.Cells[FColBanco, ARow]    := ADataSet.FieldByName('BA_NOMBRE').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
