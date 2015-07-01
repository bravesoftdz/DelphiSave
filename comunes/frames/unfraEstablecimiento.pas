unit unfraEstablecimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, IntEdit, Db, SDEngine, PatternEdit,
  unArtFrame, unArtDbFrame, unArt, unFraEmpresa, RxToolEdit;

type
  TfraEstablecimiento = class(TArtDbFrame)
    edCodigo: TIntEdit;
    cmbDescripcion: TArtComboBox;
    lbLocalidad: TLabel;
    lbEstableci: TLabel;
    edLocalidad: TEdit;
    lbCPostal: TLabel;
    edCPostal: TEdit;
    lbDomicilio: TLabel;
    edDomicilio: TEdit;
    lbProvincia: TLabel;
    edProvincia: TEdit;
    sdqDatosST_CUIT: TStringField;
    sdqDatosST_CLAVE: TFloatField;
    sdqDatosST_NOMBRE: TStringField;
    sdqDatosDOMICILIO: TStringField;
    sdqDatosST_LOCALIDAD: TStringField;
    sdqDatosPROVINCIA: TStringField;
    sdqDatosST_CPOSTAL: TStringField;
    sdqDatosST_FBAJA: TDateTimeField;
    sdqDatosST_ACTIVIDAD: TStringField;
    sdqDatosST_CPOSTALA: TStringField;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCuit: String;
    FExtraCondition: String;
    //Por compatibilidad con el Nuevo Frame
    FIdEmpresa: integer;
    procedure SetCuit(const Value: String);
    function GetActividad: String;
    function GetCPostalA: String;
    function GetContrato: integer;
    procedure SetContrato(const Value: integer);
    function GetfraEmpresa: TfraEmpresa;
    procedure SetfraEmpresa(const Value: TfraEmpresa);
    function GetNroEstablecimiento: integer;
    function GetDescripcion: string;
    function GetID: integer;
    procedure SetID(const Value: Integer);
    procedure SetIdEmpresa(const Value: integer);
    function GetCodigoEstablecimiento: String;
    procedure SetCodigoEstablecimiento(const Value: String);
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
    procedure LoadValues( DoChanges : boolean = False); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure Limpiar(ClearCUIT : Boolean = True);
    procedure Cargar(ACuit : String; AClave : Integer; OnlyValids: Boolean = True); overload;
    procedure Cargar(ACuit, AClave : String; OnlyValids: Boolean = True); overload;
    procedure Cargar; overload;
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1; ABackStatick : TColor = -1);
  published
    property Actividad          : String      read GetActividad;
    property Contrato           : integer     read GetContrato     write SetContrato;
    property CPostalA           : String      read GetCPostalA;
    Property CUIT               : String      read FCuit           write SetCuit;
    property Descripcion        : String      read GetDescripcion;
    property ExtraCondition     : String      read FExtraCondition write FExtraCondition;
    property fraEmpresa         : TfraEmpresa read GetfraEmpresa   write SetfraEmpresa;
    property ID                 : Integer     read GetId           write SetID;
    property NroEstablecimiento : integer     read GetNroEstablecimiento;
    property Value;
    //Por compatibilidad con el Nuevo Frame
    property Codigo             : String     read GetCodigoEstablecimiento write SetCodigoEstablecimiento;
    property IdEmpresa          : integer     read FIdEmpresa write SetIdEmpresa;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, General, AnsiSql;

Const
    BaseSql = 'SELECT ST_CUIT, ST_CLAVE, ST_NOMBRE, ST_ACTIVIDAD, ' +
                     'UTILES.Armar_Domicilio(ST_CALLE, ST_NUMERO, ST_PISO, ST_DEPARTAMENTO) DOMICILIO, ' +
                     'ST_LOCALIDAD, PV_DESCRIPCION PROVINCIA, ST_CPOSTAL, ST_FBAJA, ST_CPOSTALA, ST_ID ' +
                'FROM CST_ESTABLECI, CPV_PROVINCIAS ' +
               'WHERE PV_CODIGO (+)= ST_PROVINCIA ' ;

    OrderBy = ' ORDER BY ST_CLAVE';

{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.Cargar(ACuit : String; AClave : Integer; OnlyValids: Boolean);
var
  sSql : String;
begin
  if ACuit <> '' then
    Cuit := ACuit;

  if FCuit = '' then
    Clear
  else begin
    sSql := GetSql +
            ' AND ST_CUIT = ''' + FCuit + '''' +
            ' AND ST_CLAVE = ' + SqlInt(AClave);

    if OnlyValids then
      sSql := sSql + IIF(FShowBajas, '', ' AND ST_FBAJA IS NULL');

    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp( Nil );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.Cargar(ACuit, AClave : String; OnlyValids: Boolean = True);
begin
  Cargar(ACuit, StrToInt(AClave), OnlyValids);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  sSql : String;
begin
  if (Key = #13) and (FCuit <> '') then begin
    sSql := GetSql +
           ' AND ST_CUIT = ''' + FCuit + '''' +
           ' AND ST_CLAVE = ''' + edCodigo.Text + '''' +
           IIF(FShowBajas, '', ' AND ST_FBAJA IS NULL');
    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp( Sender );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.Limpiar(ClearCUIT : Boolean = True);
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';
  edLocalidad.Text    := '';
  edCPostal.Text      := '';
  edDomicilio.Text    := '';
  edProvincia.Text    := '';
  //------------------------
  if ClearCuit then
    FCuit := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetColors(AColor, ABackGround: TColor; ABackStatick : TColor);
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
procedure TfraEstablecimiento.SetCuit(const Value: String);
begin
     if FCuit <> Value then begin
        FCuit := Value;
        Limpiar( False );
        //------------------------
        edCodigo.ReadOnly       := (FCuit = '') ;
        cmbDescripcion.ReadOnly := (FCuit = '') ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosST_CLAVE.AsString ;
    cmbDescripcion.Text := sdqDatosST_NOMBRE.AsString ;
    edLocalidad.Text    := sdqDatosST_LOCALIDAD.AsString ;
    edCPostal.Text      := sdqDatosST_CPOSTAL.AsString ;
    edDomicilio.Text    := sdqDatosDOMICILIO.AsString ;
    edProvincia.Text    := sdqDatosPROVINCIA.AsString ;

    if sdqDatosST_FBAJA.IsNull then
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
procedure TfraEstablecimiento.cmbDescripcionDropDown(Sender: TObject);
var
  sSql : String;
begin
  If (FCuit <> '') then
  begin
    if (sdqDatos.Active and (sdqDatosST_NOMBRE.AsString = cmbDescripcion.Text)) then
      sSql := GetSql +
              ' AND ST_CUIT = ''' + FCuit + '''' +
              OrderBy
    else
      sSql := GetSql +
             ' AND ST_CUIT = ''' + FCuit + '''' +
             ' AND UPPER(ST_NOMBRE) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
             IIF(FShowBajas,'', ' AND ST_FBAJA IS NULL') +
             OrderBy;

    OpenQuery(sdqDatos, sSql, True);

    if edCodigo.Text <> '' then
      sdqDatos.Locate('ST_CLAVE', edCodigo.Text, []);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatosST_FBAJA.IsNull then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') then begin
        if (edCodigo.Text <> sdqDatosST_CLAVE.AsString) then
            Cargar( '', edCodigo.Value, True )
        else
            cmbDescripcionCloseUp( Nil );
//            cmbDescripcion.Text := sdqDatosST_NOMBRE.AsString ;
     end else
        Limpiar(False);
//        cmbDescripcion.Text := '' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) then
    cmbDescripcion.DoDropDown( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento.GetSql: String;
begin
  if FSql = '' then
    Result := BaseSql + FExtraCondition
  else
    Result := inherited GetSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento.GetIsEmpty: Boolean;
begin
  Result := edCodigo.Value = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraEstablecimiento.Create(AOwner: TComponent);
begin
  inherited;
  FExtraCondition := '';
  FShowBajas      := False;
  FSql            := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.Clear;
begin
  Limpiar( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetForeColor(const Value: TColor);
begin
  edCodigo.Color := Value;
  cmbDescripcion.Color := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetReadOnly(const Value: Boolean);
begin
  edCodigo.ReadOnly := Value;
  cmbDescripcion.ReadOnly := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetTabStop(const Value: Boolean);
begin
  edCodigo.TabStop := Value;
  cmbDescripcion.TabStop := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento.GetSqlOrderBy: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento.GetSqlWhere: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento.GetValue: TTableID;
begin
  Result := edCodigo.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento.IsBaja: Boolean;
begin
  Result := not sdqDatosST_FBAJA.IsNull;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.SetValue(const Value: TTableID);
begin
  Cargar(FCuit, Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento.Cargar;
var
  sSql : String;
begin
    sSql := GetSql + ' AND ST_CUIT = ''' + FCuit + '''';
    OpenQuery(sdqDatos, sSql, True);
end;

function TfraEstablecimiento.GetActividad: String;
begin
    result := '';
    if sdqDatos.Active and not sdqDatos.FieldByName('ST_ACTIVIDAD').IsNull then
        Result := sdqDatos.FieldByName('ST_ACTIVIDAD').AsString;
end;

function TfraEstablecimiento.GetCPostalA: String;
begin
  result := '';
  if sdqDatos.Active and not sdqDatos.FieldByName('ST_CPOSTALA').IsNull then
      Result := sdqDatos.FieldByName('ST_CPOSTALA').AsString;
end;

function TfraEstablecimiento.GetContrato: integer;
begin
  if IsSelected then
  begin
    Result := ObtenerValorEx('art.afiliacion.get_contratovigente(:cuit)', [CUIT])
  end else
    Result := 0;
end;

procedure TfraEstablecimiento.SetContrato(const Value: integer);
begin
  CUIT := ValorSQLEx('SELECT em_cuit ' +
                       'FROM aem_empresa, aco_contrato ' +
                      'WHERE em_id = co_idempresa ' +
                        'AND co_contrato = :contrato', [Value]);
end;
{$WARNINGS OFF}
function TfraEstablecimiento.GetfraEmpresa: TfraEmpresa;
begin

end;
{$WARNINGS ON}
procedure TfraEstablecimiento.SetfraEmpresa(const Value: TfraEmpresa);
begin

end;

function TfraEstablecimiento.GetNroEstablecimiento: integer;
begin
  Result := StrToIntDef(edCodigo.Text, 0);
end;

function TfraEstablecimiento.GetDescripcion: string;
begin
  Result := cmbDescripcion.Text;
end;

function TfraEstablecimiento.GetID: integer;
begin
  Result := ValorSQLIntegerEx('SELECT es_id ' +
                                'FROM aes_establecimiento ' +
                               'WHERE es_nroestableci = :nro ' +
                                 'AND es_contrato = :contrato', [NroEstablecimiento, Contrato]);
end;

procedure TfraEstablecimiento.SetID(const Value: Integer);
var
  sSql : String;
begin
  if (Value <> ART_EMPTY_ID) then
  begin
    sSql := GetSql + ' AND ST_ID = ' + SqlValue(Value) + IIF(FShowBajas, '', ' AND ST_FBAJA IS NULL ');
    if OpenQuery(sdqDatos, sSql, True) then
      cmbDescripcionCloseUp( nil );
  end;
end;

procedure TfraEstablecimiento.SetIdEmpresa(const Value: integer);
begin
  FIdEmpresa := Value;
  SetCuit(ValorSqlEx('SELECT EM_CUIT AFI.AEM_EMPRESA WHERE EM_ID = :ID', [Value]));
end;

function TfraEstablecimiento.GetCodigoEstablecimiento: String;
begin
  result := IntToStr(NroEstablecimiento);
end;

procedure TfraEstablecimiento.SetCodigoEstablecimiento(
  const Value: String);
begin
  SetID(ValorSqlEx('SELECT ES_ID AFI.AES_ESTABLECIMIENTO WHERE ES_CONTRATO = :CONTRATO AND ES_NROESTABLECI = :NUMERO', [Contrato, Value]));
end;

procedure TfraEstablecimiento.LoadValues(DoChanges: boolean);
begin
  // Agrego esta implementación sin código adrede ya que si no lo implemento Delphi XE2 avisa (correctamente) que una llamada a este método daría error
end;

end.

