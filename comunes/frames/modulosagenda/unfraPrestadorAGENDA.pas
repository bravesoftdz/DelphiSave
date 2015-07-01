unit unfraPrestadorAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraCPR_PRESTADOR, DB, SDEngine, PatternEdit, IntEdit,
  StdCtrls, ToolEdit, ArtComboBox, Mask, unAgenda, unART;

type
  TfraPrestadorAGENDA = class(TfraCPR_PRESTADOR, IModuloAgenda)
    lbPrestador: TLabel;
  private
    FIsRequired: Boolean;
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure SetIsRequired(const Value: Boolean);
  protected
    procedure SetValue(const Value: TTableID); override;
  public
    constructor Create(AOwner: TComponent); override;
    function Validate: Boolean;
    property ParamName: String read GetParamName;
  end;

var
  fraPrestadorAGENDA: TfraPrestadorAGENDA;

implementation

uses CustomDlgs, AnsiSql, SqlFuncs, unDmPrincipal, General;

{$R *.dfm}

constructor TfraPrestadorAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  FSQL := 'SELECT ca_clave, ca_secuencia, ca_identificador, ' +
                 'ca_descripcion, ca_asistencial, ca_domicilio, ca_localidad, ' +
                 'ca_codpostal, pv_descripcion as provincia, ca_telefono, ca_fechabaja, ' +
                 'ca_concertado, ca_iva, ca_tipocomprobante, ca_fechaconexia ' +
            'FROM (SELECT ca_clave, ca_secuencia, ca_identificador, ' +
                         'ca_descripcion, ca_asistencial, ca_domicilio, ca_localidad, ' +
                         'ca_codpostal, ca_provincia, ca_telefono, ca_fechabaja, ' +
                         'ca_concertado, ca_iva, ca_tipocomprobante, ca_fechaconexia ' +
                    'FROM art.cpr_prestador ' +
               'UNION ALL ' +
                  'SELECT ca_clave, ca_secuencia, ca_identificador, ca_descripcion, ' +
                         'asistencial AS ca_asistencial, domicilio AS ca_domicilio, localidad AS ca_localidad, ' +
                         'codpostal AS ca_codpostal, provincia AS ca_provincia, telefono AS ca_telefono, fechabaja AS ca_fechabaja, ' +
                         'concertado AS ca_concertado, iva AS ca_iva, tipocomprobante AS ca_tipocomprobante, ' +
                         'fechaconexia AS ca_fechaconexia ' +
                    'FROM (SELECT pp_cuit AS ca_clave, TO_NUMBER(NULL) AS ca_secuencia, pp_idusado + 5000000 AS ca_identificador, ' +
                                 'pp_descripcion AS ca_descripcion, TO_NUMBER(NULL) AS asistencial, TO_CHAR(NULL) AS domicilio, ' +
                                 'TO_CHAR(NULL) AS localidad, TO_CHAR(NULL) AS codpostal, TO_CHAR(NULL) AS provincia, ' +
                                 'TO_CHAR(NULL) AS telefono, pp_fechabaja AS fechabaja, TO_CHAR(NULL) AS concertado, ' +
                                 'TO_CHAR(NULL) AS iva, TO_CHAR(NULL) AS tipocomprobante, TO_DATE(NULL) AS fechaconexia ' +
                            'FROM app_prestadorproveedor ' +
                           'WHERE pp_tipo = 1 ' +
                             'AND NOT EXISTS(SELECT 1 ' +
                                              'FROM art.cpr_prestador ' +
                                             'WHERE pp_cuit = ca_clave)) ' +
                   'WHERE 1 = 1 ) ' +
           'WHERE 1=1 ';

  { Para compatibilidad con la base del cem, que esta en Access }
  SqlAddJoin(FSQL, 'CPV_PROVINCIAS', 'CA_PROVINCIA', 'PV_CODIGO', jtOuter);
end;

function TfraPrestadorAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraPrestadorAGENDA.GetParamName: String;
begin
  Result := 'IDPRESTADOR';
end;

function TfraPrestadorAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraPrestadorAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbPrestador.Caption := 'Prestador o proveedor (*)'
  else
    lbPrestador.Caption := 'Prestador o proveedor';
end;

procedure TfraPrestadorAGENDA.SetValue(const Value: TTableID);
var
  sSql: string;
begin
  if Value <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere;
    AddCondition(sSql, ' CA_IDENTIFICADOR = ' + SqlValue(Value));

    if OpenQuery(sdqDatos, sSql, True) Then
      LoadValues( False ); { No hace un ShowList porque se supone que no hay mas de un registro con el mismo Identificador};
  end else
    Clear;
end;

function TfraPrestadorAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, cmbCA_DESCRIPCION, 'Debe seleccionar un prestador o proveedor.');
  Result := True;
end;

end.
