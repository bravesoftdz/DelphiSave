unit unFraDomicilioExtendido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unFraDomicilio, DB, SDEngine,
  StdCtrls, PatternEdit, IntEdit, Mask, ToolEdit, ArtComboBox, RxToolEdit;

type
  TDomicilio = (tdPostal, tdLegal);

  TfraDomicilioExtendido = class(TfraDomicilio)
    procedure CambioDatos(Sender: TObject);
    procedure cmbLocalidadChange(Sender: TObject);
  private
   	FCuil, FCuit: String;
    FPregunta: Boolean;
    FTipo: TDomicilio;

    function GetCuil: String;
    function GetCuit: String;
    function GetTipo: TDomicilio;

    procedure SetCuil(const Value: String);
    procedure SetCuit(const Value: String);
    procedure SetTipo(const Value: TDomicilio);
  public
    constructor Create(AOwner: TComponent); override;

    procedure PreguntarDomicilio(ACUIT: String);

   	property CUIL: String read GetCuil write SetCuil;
    property CUIT: String read GetCuit write SetCuit;
    property Tipo: TDomicilio read GetTipo write SetTipo;
  end;

var
  fraDomicilioExtendido: TfraDomicilioExtendido;

implementation

uses
  AnsiSql, unDmPrincipal, CustomDlgs, unART;

{$R *.dfm}

{ TfraDomicilioExtendido }

constructor TfraDomicilioExtendido.Create(AOwner: TComponent);
begin
  FTipo := tdPostal;
  inherited;
end;

function TfraDomicilioExtendido.GetCuil: String;
begin
 	Result := FCuil;
end;

function TfraDomicilioExtendido.GetCuit: String;
begin
 	Result := FCuit;
end;

procedure TfraDomicilioExtendido.SetCuil(const Value: String);
var
 	sSql: String;
begin
	 sSql :=
    'SELECT TJ_CALLE CALLE, TJ_NUMERO NUMERO, TJ_PISO PISO, TJ_DEPARTAMENTO DEPARTAMENTO, TJ_CPOSTAL CODIGOPOSTAL,' +
          ' TJ_CPOSTALA CPA, TJ_LOCALIDAD LOCALIDAD, PV_DESCRIPCION PROVINCIA,' +
          ' UTILES.ARMAR_TELEFONO (TJ_CODAREATELEFONO, TJ_PREFIJOTELEFONO, TJ_TELEFONO) TELEFONOS' +
     ' FROM CTJ_TRABAJADORES, CPV_PROVINCIAS' +
    ' WHERE TJ_CUIL = :cuil' +
      ' AND PV_CODIGO(+) = TJ_PROVINCIA';

 	with GetQueryEx(sSql, [Value]) do
  try
   	Open;
    if not IsEmpty then
    begin
     	FCuil := Value;

      Calle        := FieldByName('CALLE').AsString;
      Numero       := FieldByName('NUMERO').AsString;
      Piso         := FieldByName('PISO').AsString;
      Departamento := FieldByName('DEPARTAMENTO').AsString;
      CodigoPostal := FieldByName('CODIGOPOSTAL').AsString;
      CPA          := FieldByName('CPA').AsString;
      Localidad    := FieldByName('LOCALIDAD').AsString;
      Provincia    := FieldByName('PROVINCIA').AsString;
      Hint         := 'Teléfonos: ' + FieldByName('TELEFONOS').AsString;
      ShowHint := True;
      //edTelefonos.Text := FieldByName('TELEFONOS').AsString;
    end
    else
    	 Clear;
	 finally
   	Free;
  end;
end;

procedure TfraDomicilioExtendido.SetCuit(const Value: String);
var
 	sSql: String;
begin
  if Tipo = tdPostal then
   	sSql := 'SELECT MP_NOMBRE as NOMBRE, MP_CALLE_POST as CALLE, MP_NUMERO_POST as NUMERO, MP_PISO_POST as PISO, ' +
                   'MP_DEPARTAMENTO_POST as DEPARTAMENTO, MP_CPOSTAL_POST as CODIGOPOSTAL, MP_CPOSTALA_POST as CPA, ' +
                   'MP_LOCALIDAD_POST as LOCALIDAD, PV_DESCRIPCION as PROVINCIA, ' +
                   {$IFDEF ORACLE}
                   'ART.UTILES.ARMAR_TELEFONO (MP_CODAREATELEFONOS, MP_PREFIJOTELEFONOS, MP_TELEFONOS) as TELEFONOS, ' +
                   'ART.UTILES.ARMAR_DOMICILIO(MP_CALLE_POST, MP_NUMERO_POST, MP_PISO_POST, MP_DEPARTAMENTO_POST, MP_LOCALIDAD_POST) as DOMICILIO ' +
                   {$ELSE}
                   'MP_TELEFONOS_POST as TELEFONOS, ' +
                   'NULL as DOMICILIO ' +
                   {$ENDIF}
             'FROM CMP_EMPRESAS, CPV_PROVINCIAS ' +
            'WHERE MP_CUIT = ' + SqlValue(Value) +
             ' AND PV_CODIGO = MP_PROVINCIA_POST'
  else // Tipo = tdLegal
   	sSql := 'SELECT MP_NOMBRE as NOMBRE, MP_CALLE as CALLE, MP_NUMERO as NUMERO, MP_PISO as PISO, ' +
                   'MP_DEPARTAMENTO as DEPARTAMENTO, MP_CPOSTAL as CODIGOPOSTAL, MP_CPOSTALA as CPA, ' +
                   'MP_LOCALIDAD as LOCALIDAD, PV_DESCRIPCION as PROVINCIA, ' +
                   {$IFDEF ORACLE}
                   'ART.UTILES.ARMAR_TELEFONO (MP_CODAREATELEFONOS, MP_PREFIJOTELEFONOS, MP_TELEFONOS) as TELEFONOS, ' +
                   'ART.UTILES.ARMAR_DOMICILIO(MP_CALLE, MP_NUMERO, MP_PISO, MP_DEPARTAMENTO, MP_LOCALIDAD) as DOMICILIO ' +
                   {$ELSE}
                   'MP_TELEFONOS as TELEFONOS, ' +
                   'NULL as DOMICILIO ' +
                   {$ENDIF}
              'FROM CMP_EMPRESAS, CPV_PROVINCIAS ' +
             'WHERE MP_CUIT = ' + SqlValue(Value) +
              ' AND PV_CODIGO = MP_PROVINCIA';

 	with GetQuery(sSql) do
  try
  	 Open;
    if not IsEmpty then
    begin
     	FCuit := Value;

      if not FPregunta or MsgAsk('¿Desea completar el domicilio de la empresa ' + FieldByName('NOMBRE').AsString + CRLF + ' con la dirección ' + FieldByName('DOMICILIO').AsString + '?') then
      begin
        Calle        := FieldByName('CALLE').AsString;
        Numero       := FieldByName('NUMERO').AsString;
        Piso         := FieldByName('PISO').AsString;
        Departamento := FieldByName('DEPARTAMENTO').AsString;
        CodigoPostal := FieldByName('CODIGOPOSTAL').AsString;
        CPA          := FieldByName('CPA').AsString;
        Localidad    := FieldByName('LOCALIDAD').AsString;
        Provincia    := FieldByName('PROVINCIA').AsString;
        Hint         := 'Teléfonos: ' + FieldByName('TELEFONOS').AsString;
        ShowHint     := True;
        //edTelefonos.Text := FieldByName('TELEFONOS').AsString;
      end
      else
        ;//Clear;
    end
    else
     	Clear;
 	finally
   	Free;
  end;
end;

procedure TfraDomicilioExtendido.CambioDatos(Sender: TObject);
begin
  inherited;
  Hint := '';
  ShowHint := False;
end;

procedure TfraDomicilioExtendido.cmbLocalidadChange(Sender: TObject);
begin
  inherited;
  CambioDatos(Sender);
end;

procedure TfraDomicilioExtendido.PreguntarDomicilio(ACUIT: String);
begin
  FPregunta := True;
  try
    CUIT := ACUIT;
  finally
    FPregunta := False;
  end;
end;

function TfraDomicilioExtendido.GetTipo: TDomicilio;
begin
  Result := FTipo;
end;

procedure TfraDomicilioExtendido.SetTipo(const Value: TDomicilio);
begin
  FTipo := Value;
end;

end.
