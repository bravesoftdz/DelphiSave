
{********************************************************}
{                                                        }
{    Frame de Búsqueda de Gestores de Cuenta             }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 11/2003                                      }
{    Proyectos: Afiliaciones                             }
{                                                        }
{********************************************************}

unit unfraAGC_GESTORCUENTA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls, Mask,
  unFraCodigoDescripcion, PatternEdit, DB;

type
  TfraAGC_GESTORCUENTA = class(TfraStaticCodigoDescripcion)
    mskCUIT: TMaskEdit;
  private
  protected
    FColCUIT: Integer;
    procedure LoadRow(ADataSet: TDataSet; ARow: Integer); override;
    function GetSql: string; override;
    procedure LoadEditors(ARow: Integer); override;
    procedure ClearEditors; override;
    function ClearOnExit: Boolean; override;
    function CancelExitLoad: Boolean; override;

    procedure SetCUIT(Value: string);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
{ TfraAGC_GESTORCUENTA }
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
function TfraAGC_GESTORCUENTA.CancelExitLoad: boolean;
begin
  if (mskCUIT.Text <> '') and (mskCUIT.Text <> cmbDescripcion.Cells[FColCUIT, cmbDescripcion.Row]) Then
  begin
    SetCuit(mskCUIT.Text);

    Result := True;
  end else
    Result := (mskCUIT.Text = '') and (inherited CancelExitLoad);
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfraAGC_GESTORCUENTA.ClearEditors;
begin
  inherited;
  mskCUIT.Clear;
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
function TfraAGC_GESTORCUENTA.ClearOnExit: boolean;
begin
  Result := (inherited ClearOnExit) and (mskCUIT.Text = '');
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
constructor TfraAGC_GESTORCUENTA.Create(AOwner: TComponent);
begin
  inherited;

  FColCodigo := 0;
  FColCUIT := 1;  { Propio de este Frame }
  FColDescripcion := 2;
  FColId := 3;
  FColBaja := 4;

  cmbDescripcion.ListCol := FColDescripcion;

  TableName   := 'AGC_GESTORCUENTA';
  FieldID     := 'GC_ID';
  FieldCodigo := 'GC_ID';
  FieldDesc   := 'GC_NOMBRE';
  FieldBaja   := 'GC_FECHABAJA';
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
function TfraAGC_GESTORCUENTA.GetSql: string;
begin
  Result := 'SELECT ' + FieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                        FieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                        FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                        FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ', ' +
                        'GC_CUIT ' +  ExtraFields +
              'FROM ' + TableName +
            ' WHERE 1=1 ' + ExtraCondition
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfraAGC_GESTORCUENTA.LoadEditors(ARow: Integer);
begin
  inherited;
  mskCUIT.Text := cmbDescripcion.Cells[FColCUIT, ARow];
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfraAGC_GESTORCUENTA.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;
  cmbDescripcion.Cells[FColCUIT, ARow] := ADataSet.FieldByName('GC_CUIT').AsString;
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure TfraAGC_GESTORCUENTA.SetCUIT(Value: string);
var
 iRow : Integer;
begin
  CheckData;
  iRow := cmbDescripcion.FindRow( FFixedRows, [FColCUIT], [Value] );

  if iRow > -1 Then
  begin
    cmbDescripcion.Row := iRow;
    LoadValues( True );
  end else
  begin
    Clear;
    Change;
  end;
end;
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
end.
