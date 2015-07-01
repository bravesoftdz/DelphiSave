unit unFraDomicilioTrabajador;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraDomicilio, DB, SDEngine,
  PatternEdit, IntEdit, StdCtrls, Mask, ArtComboBox, RxToolEdit;

type
  TfraDomicilioTrabajador = class(TfraDomicilio)
    lbTelefonos: TLabel;
    edTelefonos: TEdit;
  private
  	FCuil: String;

    function GetCuil: String;

    procedure SetCuil(const Value: String);
  protected
  	function GetIsEmpty: Boolean; override;
    procedure SetLocked(const Value: Boolean); override;
  public
  	procedure Clear; override;

  	property Cuil: String read GetCuil write SetCuil;
  end;

var
  fraDomicilioTrabajador: TfraDomicilioTrabajador;

implementation

uses
	unDmPrincipal, AnsiSql, VclExtra;

{$R *.dfm}

function TfraDomicilioTrabajador.GetCuil: String;
begin
	Result := FCuil;
end;

function TfraDomicilioTrabajador.GetIsEmpty: Boolean;
begin
	Result := (inherited GetIsEmpty) and (edTelefonos.Text = '')
end;

procedure TfraDomicilioTrabajador.Clear;
begin
	inherited;

  edTelefonos.Clear;
end;

procedure TfraDomicilioTrabajador.SetCuil(const Value: String);
var
	sSql: String;
begin
	sSql :=
		'SELECT TJ_CALLE CALLE, TJ_NUMERO NUMERO, TJ_PISO PISO, TJ_DEPARTAMENTO DEPARTAMENTO, TJ_CPOSTAL CODIGOPOSTAL,' +
          ' TJ_CPOSTALA CPA, TJ_LOCALIDAD LOCALIDAD, PV_DESCRIPCION PROVINCIA, NVL(PV_CODIGO, 0) CODIGOPROV, ' +
          ' art.trabajador.get_telefono(tj_id, 4) TELEFONOS' +
     ' FROM CTJ_TRABAJADOR, CPV_PROVINCIAS' +
    ' WHERE TJ_CUIL = :cuil' +
      ' AND PV_CODIGO(+) = TJ_PROVINCIA';

	with GetQueryEx(sSql, [Value]) do
  try
  	Open;
    if not Eof then
    begin
    	FCuil := Value;

      Calle            := FieldByName('CALLE').AsString;
      Numero           := FieldByName('NUMERO').AsString;
      Piso             := FieldByName('PISO').AsString;
      Departamento     := FieldByName('DEPARTAMENTO').AsString;
      CodigoPostal     := FieldByName('CODIGOPOSTAL').AsString;
      CPA              := FieldByName('CPA').AsString;
      Localidad        := FieldByName('LOCALIDAD').AsString;
      Provincia        := FieldByName('PROVINCIA').AsString;
      Prov             := FieldByName('CODIGOPROV').AsInteger;
      edTelefonos.Text := FieldByName('TELEFONOS').AsString;
    end
    else
    	Clear;
	finally
  	Free;
  end;
end;

procedure TfraDomicilioTrabajador.SetLocked(const Value: Boolean);
begin
  inherited;
  Lockcontrol(edTelefonos, True);
end;

end.
