unit unFraDomicilioEmpresa;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraDomicilio, DB, SDEngine,
  PatternEdit, IntEdit, StdCtrls, Mask, ArtComboBox;

type
  TfraDomicilioEmpresa = class(TfraDomicilio)
    edTelefonos: TEdit;
    lbTelefonos: TLabel;
  private
  	FCuit: String;

    function GetCuit: String;

    procedure SetCuit(const Value: String);
  protected
  	function GetIsEmpty: Boolean; override;
  public
  	procedure Clear; override;

  	property Cuit: String read GetCuit write SetCuit;
  end;

var
  fraDomicilioEmpresa: TfraDomicilioEmpresa;

implementation

uses
	AnsiSql, unDmPrincipal;

{$R *.dfm}

{ TfraDomicilioEmpresa }

function TfraDomicilioEmpresa.GetCuit: String;
begin
  Result := FCuit;
end;

function TfraDomicilioEmpresa.GetIsEmpty: Boolean;
begin
	Result := (inherited GetIsEmpty) and (edTelefonos.Text = '')
end;


procedure TfraDomicilioEmpresa.Clear;
begin
	inherited;

  edTelefonos.Clear;
end;

procedure TfraDomicilioEmpresa.SetCuit(const Value: String);
var
	sSql: String;
begin
	sSql :=
  	'SELECT MP_CALLE CALLE, MP_NUMERO NUMERO, MP_PISO PISO, MP_DEPARTAMENTO DEPARTAMENTO,' +
          ' MP_CPOSTAL CODIGOPOSTAL, MP_CPOSTALA CPA, MP_LOCALIDAD LOCALIDAD, PV_DESCRIPCION PROVINCIA,' +
          ' UTILES.ARMAR_TELEFONO(MP_CODAREATELEFONOS, MP_PREFIJOTELEFONOS, MP_TELEFONOS) TELEFONOS' +
     ' FROM CMP_EMPRESAS, CPV_PROVINCIAS' +
 		' WHERE MP_CUIT = :cuit' +
      ' AND PV_CODIGO = MP_PROVINCIA';

	with GetQueryEx(sSql, [Value]) do
  try
  	Open;
    if not Eof then
    begin
    	FCuit := Value;

      Calle            := FieldByName('CALLE').AsString;
      Numero           := FieldByName('NUMERO').AsString;
      Piso             := FieldByName('PISO').AsString;
      Departamento     := FieldByName('DEPARTAMENTO').AsString;
      CodigoPostal     := FieldByName('CODIGOPOSTAL').AsString;
      CPA              := FieldByName('CPA').AsString;
      Localidad        := FieldByName('LOCALIDAD').AsString;
      Provincia        := FieldByName('PROVINCIA').AsString;
      edTelefonos.Text := FieldByName('TELEFONOS').AsString;
    end
    else
    	Clear;
	finally
  	Free;
  end;
end;

end.
