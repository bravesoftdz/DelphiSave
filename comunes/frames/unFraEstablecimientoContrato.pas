unit unFraEstablecimientoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, IntEdit, Db, SDEngine, PatternEdit,
  unArtFrame, unArtDbFrame, unArt, unFraEmpresa;

type
  TfraEstablecimientoContrato = class(TArtDbFrame)
    lbLocalidad: TLabel;
    lbEstableci: TLabel;
    lbCPostal: TLabel;
    lbDomicilio: TLabel;
    lbProvincia: TLabel;
    edCodigo: TIntEdit;
    cmbDescripcion: TArtComboBox;
    edLocalidad: TEdit;
    edCPostal: TEdit;
    edDomicilio: TEdit;
    edProvincia: TEdit;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FContrato : Integer;
    FExtraCondition: String;
    procedure SetCuit(const Value: String);
    function GetActividad: String;
    function GetCPostalA: String;
    function GetCuit: String;
    procedure SetContrato(const Value: integer);
    function GetNroEstablecimiento: integer;
    function GetDescripcion: string;
    function GetID: integer;
    procedure SetID(const Value: Integer);
  protected
    function GetIsEmpty: boolean; override;
    procedure SetForeColor(const Value: TColor); override;
    procedure SetReadOnly(const Value: Boolean); override;
    procedure SetTabStop(const Value: Boolean); override;
    function GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    function GetSql: string; override;
    function GetSqlOrderBy: string; override;
    function GetSqlWhere  : string; override;
    function IsBaja : Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure Limpiar(ClearContrato : Boolean = True);
    procedure Cargar(AContrato : Integer; AClave : Integer; OnlyValids: Boolean = True); overload;
    procedure Cargar(AContrato : Integer; AClave : String; OnlyValids: Boolean = True); overload;
    procedure Cargar; overload;
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1; ABackStatick : TColor = -1);
  published
    property Actividad          : String      read GetActividad;
    property Contrato           : integer     read FContrato     write SetContrato;
    property CPostalA           : String      read GetCPostalA;
    Property CUIT               : String      read GetCuit         write SetCuit;
    property Descripcion        : String      read GetDescripcion;
    property ExtraCondition     : String      read FExtraCondition write FExtraCondition;
    property ID                 : Integer     read GetId           write SetID;
    property NroEstablecimiento : integer     read GetNroEstablecimiento;
    property Value;
  end;

var
  fraEstablecimientoContrato: TfraEstablecimientoContrato;

implementation

{$R *.dfm}
uses
  unDmPrincipal, General, AnsiSql;
Const
    BaseSql =
      ' SELECT em_cuit, es_nroestableci, es_nombre, ac_codigo, '+
      '        art.utiles.armar_domicilio (es_calle, '+
      '                                    es_numero, '+
      '                                    es_piso, '+
      '                                    es_departamento '+
      '                                   ) domicilio, '+
      '        es_localidad, pv_descripcion provincia, es_cpostal, es_fechabaja, '+
      '        es_cpostala, es_id '+
      '   FROM afi.aes_establecimiento, '+
      '        afi.aco_contrato, '+
      '        afi.aem_empresa, '+
      '        cac_actividad, '+
      '        cpv_provincias '+
      '  WHERE pv_codigo(+) = es_provincia '+
      '    AND es_contrato = co_contrato '+
      '    AND co_idempresa = em_id '+
      '    AND es_idactividad = ac_id ';

    OrderBy = ' ORDER BY es_nroestableci';

{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.Cargar(AContrato : Integer; AClave : Integer; OnlyValids: Boolean);
var
  sSql : String;
begin
  if AContrato <> 0 then
    FContrato := AContrato;

  if FContrato = 0 then
    Clear
  else begin
    sSql := GetSql +
            ' AND co_contrato = ' + SqlInt(FContrato) +
            ' AND es_nroestableci = ' + SqlInt(AClave);

    if OnlyValids then
      sSql := sSql + IIF(FShowBajas, '', ' AND es_fechabaja IS NULL');

    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp( Nil );
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.Cargar(AContrato : Integer; AClave : String; OnlyValids: Boolean = True);
begin
  Cargar(AContrato, StrToInt(AClave), OnlyValids);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  sSql : String;
begin
  if (Key = #13) and (FContrato <> 0) then begin
    sSql := GetSql +
           ' AND co_contrato = '+ SqlInt(FContrato) +
           ' AND es_nroestableci = ''' + edCodigo.Text + '''' +
           IIF(FShowBajas, '', ' AND es_fechabaja IS NULL');
    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp( Sender );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.Limpiar(ClearContrato : Boolean = True);
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
  edLocalidad.Text    := '';
  edCPostal.Text      := '';
  edDomicilio.Text    := '';
  edProvincia.Text    := '';
  //------------------------
  if ClearContrato then
    FContrato := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.SetColors(AColor, ABackGround: TColor; ABackStatick : TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
    edLocalidad.Font.Color    := AColor;
    edCPostal.Font.Color      := AColor;
    edDomicilio.Font.Color    := AColor;
    edProvincia.Font.Color    := AColor;

    if ABackGround <> -1 then begin
       edCodigo.Color       := ABackGround;
       cmbDescripcion.Color := ABackGround;
    end;

    if ABackStatick <> -1 then begin
       edLocalidad.Color    := ABackStatick;
       edCPostal.Color      := ABackStatick;
       edDomicilio.Color    := ABackStatick;
       edProvincia.Color    := ABackStatick;
    end;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.SetCuit(const Value: String);
begin
  Contrato := ValorSQLEx(
    ' SELECT co_contrato '+
    '   FROM afi.aem_empresa, afi.aco_contrato '+
    '  WHERE em_id = co_idempresa AND co_contrato = art.get_vultcontrato (:cuit)'
    , [Value]);
 {
     if FCuit <> Value then begin
        FCuit := Value;
        Limpiar( False );
        //------------------------
        edCodigo.ReadOnly       := (FCuit = '') ;
        cmbDescripcion.ReadOnly := (FCuit = '') ;
     end;
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatos.FieldByName('es_nroestableci').AsString ;
    cmbDescripcion.Text := sdqDatos.FieldByName('es_nombre').AsString ;
    edLocalidad.Text    := sdqDatos.FieldByName('es_localidad').AsString ;
    edCPostal.Text      := sdqDatos.FieldByName('es_cpostal').AsString ;
    edDomicilio.Text    := sdqDatos.FieldByName('domicilio').AsString ;
    edProvincia.Text    := sdqDatos.FieldByName('provincia').AsString ;

    if sdqDatos.FieldByName('es_fechabaja').IsNull then
       SetColors(clWindowText)
    else
       SetColors(clRed);

    if Assigned(Sender) then begin
       Change;

       if (edCodigo.Text <> '') then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.cmbDescripcionDropDown(Sender: TObject);
var
  sSql : String;
begin
  If (FContrato <> 0) then
  begin
    if (sdqDatos.Active and (sdqDatos.FieldByName('es_nombre').AsString = cmbDescripcion.Text)) then
      sSql := GetSql +
              ' AND co_contrato = '+ SqlInt(FContrato) +
              OrderBy
    else
      sSql := GetSql +
             ' AND co_contrato = '+ SqlInt(FContrato) +
             ' AND UPPER(es_nombre) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
             IIF(FShowBajas,'', ' AND es_fechabaja IS NULL') +
             OrderBy;

    OpenQuery(sdqDatos, sSql, True);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatos.FieldByName('es_fechabaja').IsNull then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') then begin
        if (edCodigo.Text <> sdqDatos.FieldByName('es_nroestableci').AsString) then
            Cargar( 0, edCodigo.Value, True )
        else
            cmbDescripcionCloseUp( Nil );
     end else
        Limpiar(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) then
    cmbDescripcion.DoDropDown( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimientoContrato.GetSql: String;
begin
  if FSql = '' then
    Result := BaseSql + FExtraCondition
  else
    Result := inherited GetSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimientoContrato.GetIsEmpty: Boolean;
begin
  Result := edCodigo.Value = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraEstablecimientoContrato.Create(AOwner: TComponent);
begin
  inherited;
  FExtraCondition := '';
  FShowBajas      := False;
  FSql            := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.Clear;
begin
  Limpiar( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.SetForeColor(const Value: TColor);
begin
  edCodigo.Color := Value;
  cmbDescripcion.Color := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.SetReadOnly(const Value: Boolean);
begin
  edCodigo.ReadOnly := Value;
  cmbDescripcion.ReadOnly := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.SetTabStop(const Value: Boolean);
begin
  edCodigo.TabStop := Value;
  cmbDescripcion.TabStop := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimientoContrato.GetSqlOrderBy: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimientoContrato.GetSqlWhere: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimientoContrato.GetValue: TTableID;
begin
  Result := edCodigo.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimientoContrato.IsBaja: Boolean;
begin
  Result := not sdqDatos.FieldByName('es_fechabaja').IsNull;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.SetValue(const Value: TTableID);
begin
  Cargar(FContrato, Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimientoContrato.Cargar;
var
  sSql : String;
begin
    sSql := GetSql + ' AND co_contrato = '+ SqlInt(FContrato);
    OpenQuery(sdqDatos, sSql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}

function TfraEstablecimientoContrato.GetActividad: String;
begin
    result := '';
    if sdqDatos.Active and not sdqDatos.FieldByName('ac_codigo').IsNull then
        Result := sdqDatos.FieldByName('ac_codigo').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}

function TfraEstablecimientoContrato.GetCPostalA: String;
begin
  result := '';
  if sdqDatos.Active and not sdqDatos.FieldByName('es_cpostala').IsNull then
      Result := sdqDatos.FieldByName('es_cpostala').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}

function TfraEstablecimientoContrato.GetCuit: String;
begin
  if IsSelected then
  begin
    Result := ObtenerValorEx(
      ' SELECT em_cuit '+
      '   FROM afi.aem_empresa, afi.aco_contrato '+
      '  WHERE em_id = co_idempresa AND co_contrato = :contrato', [Contrato])
  end else
    Result := '';
end;

{----------------------------------------------------------------------------------------------------------------------}

procedure TfraEstablecimientoContrato.SetContrato(const Value: integer);
begin
{  CUIT := ValorSQLEx('SELECT em_cuit ' +
                       'FROM aem_empresa, aco_contrato ' +
                      'WHERE em_id = co_idempresa ' +
                        'AND co_contrato = :contrato', [Value]);
}
  if FContrato <> Value then
  begin
    FContrato := Value;
    Limpiar( False );
    //------------------------
    edCodigo.ReadOnly       := (FContrato = 0) ;
    cmbDescripcion.ReadOnly := (FContrato = 0) ;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}

function TfraEstablecimientoContrato.GetNroEstablecimiento: integer;
begin
  Result := StrToIntDef(edCodigo.Text, 0);
end;

{----------------------------------------------------------------------------------------------------------------------}

function TfraEstablecimientoContrato.GetDescripcion: string;
begin
  Result := cmbDescripcion.Text;
end;

{----------------------------------------------------------------------------------------------------------------------}

function TfraEstablecimientoContrato.GetID: integer;
begin
  Result := ValorSQLIntegerEx('SELECT es_id ' +
                                'FROM aes_establecimiento ' +
                               'WHERE es_nroestableci = :nro ' +
                                 'AND es_contrato = :contrato', [NroEstablecimiento, Contrato]);
end;

{----------------------------------------------------------------------------------------------------------------------}

procedure TfraEstablecimientoContrato.SetID(const Value: Integer);
var
  sSql : String;
begin
  if (Value <> ART_EMPTY_ID) then
  begin
    sSql := GetSql + ' AND es_id = ' + SqlValue(Value) + IIF(FShowBajas, '', ' AND es_fechabaja IS NULL ');
    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp( nil );
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}

end.
