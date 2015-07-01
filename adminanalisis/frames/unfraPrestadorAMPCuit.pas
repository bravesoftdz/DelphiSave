unit unfraPrestadorAMPCuit;

interface

uses
  Windows, Messages, SysUtils, Classes, unFraCodigoDescripcion, Mask,
  Controls, StdCtrls, Db, SDEngine, PatternEdit, ToolEdit, ArtComboBox, graphics,
  Forms, Dialogs, RxToolEdit;

type
  TfraPrestadorAMPCuit = class(TfraCodigoDescripcion)
    lbCuit: TLabel;
    mskCUIT: TMaskEdit;
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbDescripcionDropDown(Sender: TObject);
  private
    FNotReload: Boolean;
  protected
    function GetSql: String; override;
    procedure LoadValues( DoChanges : boolean = False); override;
    procedure SetCuit(const Value: String; DoChanges : Boolean = False);
  public
    property NotReload: Boolean read FNotReload write FNotReload;
    procedure Clear; override;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AnsiSql, unDmPrincipal;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraPrestadorAMPCuit }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMPCuit.Clear;
begin
  mskCuit.Clear;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMPCuit.cmbDescripcionDropDown(Sender: TObject);
begin
  if not FNotReload then
    inherited;
end;

constructor TfraPrestadorAMPCuit.Create(AOwner: TComponent);
begin
  inherited;
  FTableName   := 'cpr_prestador';
  FFieldID     := 'ca_identificador';
  FFieldCodigo := 'ca_identificador';
  FFieldDesc   := 'ca_descripcion';
  FFieldBaja   := 'ca_fechabaja';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestadorAMPCuit.GetSql: String;
begin
  if FSql = '' Then
    Result := 'SELECT ca_identificador AS ' + CD_ALIAS_ID + ', ' +
                     'ca_identificador AS ' + CD_ALIAS_CODIGO + ', ' +
                     'ca_descripcion AS ' + CD_ALIAS_DESC + ', ' +
                     'ca_fechabaja AS ' + CD_ALIAS_BAJA + ', ' +
                     'ca_clave AS pr_cuit, ' +
                     'INITCAP(ART.UTILES.ARMAR_DOMICILIO(ca_calle, ca_numero, ca_pisocalle, ca_departamento)) domicilio, ' +
                     'INITCAP(ca_localidad) pr_localidad, ca_codpostal pr_cpostal, INITCAP(PV_DESCRIPCION) provincia ' +
                     ExtraFields + ' ' +
                'FROM art.cpr_prestador, cpv_provincias ' + ExtraTables +
               'WHERE ca_provincia = pv_codigo' +
                ExtraCondition
  else
     Result := inherited GetSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMPCuit.LoadValues(DoChanges: boolean);
begin
  mskCuit.Text  := sdqDatos.FieldByName('pr_cuit').AsString ;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMPCuit.mskCUITKeyPress(Sender: TObject; var Key: Char);
begin
  if (not mskCUIT.ReadOnly) and (Key = #13) then
    SetCuit( mskCUIT.Text, True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMPCuit.SetCuit(const Value: String; DoChanges: Boolean);
Var sSql : String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FTableName + '.ca_clave = ' + SqlValue( Value );

  if OpenQuery(sdqDatos, sSql, True) Then
     LoadValues( DoChanges );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestadorAMPCuit.edCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//
end;

end.
