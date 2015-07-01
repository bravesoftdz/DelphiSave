unit unFraCCO_PARTIDOS_CODIGOSPOSTALES;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodDesc, unPropiedadesFrame, DB, SDEngine, PatternEdit,
  StdCtrls, Mask, ArtComboBox;

type
  TfraCCO_PARTIDOS_CODIGOSPOSTALES = class(TfraCodDesc)
    procedure cmbDescripcionDropDown(Sender: TObject);
  private
    FCodigoPostal: integer;
  protected
    function GetSql: String; override;
  public
    constructor Create(AOwner: TComponent); override;
    property CodigoPostal: integer read FCodigoPostal write FCodigoPostal;
  end;

var
  fraCCO_PARTIDOS_CODIGOSPOSTALES: TfraCCO_PARTIDOS_CODIGOSPOSTALES;

implementation

uses CustomDlgs, unSesion, AnsiSql, unFraCodigoDescripcion;

{$R *.dfm}

procedure TfraCCO_PARTIDOS_CODIGOSPOSTALES.cmbDescripcionDropDown(Sender: TObject);
begin
  Verificar(CodigoPostal = 0, cmbDescripcion, 'Debe seleccionar un código postal para poder seleccionar un partido.');
  inherited;
end;

constructor TfraCCO_PARTIDOS_CODIGOSPOSTALES.Create(AOwner: TComponent);
begin
  inherited;
  IDType         := unFraCodigoDescripcion.TCodigoType(ctInteger);
  TableName      := 'CCO_PARTIDOS_CODIGOSPOSTALES';
  FieldID        := 'CO_SECUENCIA';
  FieldCodigo    := 'CO_PARTIDO';
  FieldDesc      := 'CO_LOCALIDAD';
  FieldBaja      := 'NULL';
end;

function TfraCCO_PARTIDOS_CODIGOSPOSTALES.GetSql: String;
begin
  if CodigoPostal > 0 then
    Propiedades.ExtraCondition := ' AND CO_CODIGOPOSTAL = ' + SQLValue(CodigoPostal)
  else
    Propiedades.ExtraCondition := '';
  Result := inherited GetSql;
end;

end.
