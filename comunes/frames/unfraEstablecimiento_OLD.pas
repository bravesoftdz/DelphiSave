unit unfraEstablecimiento_OLD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, IntEdit, Db, SDEngine, PatternEdit,
  unArtFrame, unArtDbFrame, unArt, unFraEmpresa;

type
  TfraEstablecimiento_OLD = class(TArtDbFrame)
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
    sdqDatosST_ID: TFloatField;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCuit: String;
    FExtraCondition: String;
    procedure SetCuit(const Value: String);
    function GetActividad: String;
    function GetCPostalA: String;
    function GetContrato: integer;
    procedure SetContrato(const Value: integer);
    function GetfraEmpresa: TfraEmpresa;
    function GetIdEstablecimiento: integer;
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
    procedure Limpiar(ClearCUIT : Boolean = True);
    procedure Cargar(ACuit : String; AClave : Integer; OnlyValids: Boolean = True); overload;
    procedure Cargar(ACuit, AClave : String; OnlyValids: Boolean = True); overload;
    procedure Cargar; overload;
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1; ABackStatick : TColor = -1);
  published
    Property CUIT           : String      read FCuit           write SetCuit;
    property ExtraCondition : String      read FExtraCondition write FExtraCondition;
    property Actividad      : String      read GetActividad;
    property CPostalA       : String      read GetCPostalA;
    property Contrato       : integer     read GetContrato     write SetContrato;
    property IdEstablecimiento    : integer     read GetIdEstablecimiento;
    property fraEmpresa     : TfraEmpresa read GetfraEmpresa;
    property Value;
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
procedure TfraEstablecimiento_OLD.Cargar(ACuit : String; AClave : Integer; OnlyValids: Boolean);
var
  sSql : String;
begin
  if ACuit <> '' Then
    FCuit := ACuit;

  if FCuit = '' Then
    Clear
  else begin
    sSql := GetSql +
            ' AND ST_CUIT = ''' + FCuit + '''' +
            ' AND ST_CLAVE = ' + SqlInt(AClave);

    if OnlyValids Then
      sSql := sSql + IIF(FShowBajas, '', ' AND ST_FBAJA IS NULL');

    if OpenQuery(sdqDatos, sSql, True) Then
      cmbDescripcionCloseUp( Nil );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.Cargar(ACuit, AClave : String; OnlyValids: Boolean = True);
begin
  Cargar(ACuit, StrToInt(AClave), OnlyValids);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  sSql : String;
begin
  if (Key = #13) and (FCuit <> '') Then begin
    sSql := GetSql +
           ' AND ST_CUIT = ''' + FCuit + '''' +
           ' AND ST_CLAVE = ''' + edCodigo.Text + '''' +
           IIF(FShowBajas, '', ' AND ST_FBAJA IS NULL');
    if OpenQuery(sdqDatos, sSql, True) Then
      cmbDescripcionCloseUp( Sender );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.Limpiar(ClearCUIT : Boolean = True);
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
procedure TfraEstablecimiento_OLD.SetColors(AColor, ABackGround: TColor; ABackStatick : TColor);
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
procedure TfraEstablecimiento_OLD.SetCuit(const Value: String);
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
procedure TfraEstablecimiento_OLD.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosST_CLAVE.AsString ;
    cmbDescripcion.Text := sdqDatosST_NOMBRE.AsString ;
    edLocalidad.Text    := sdqDatosST_LOCALIDAD.AsString ;
    edCPostal.Text      := sdqDatosST_CPOSTAL.AsString ;
    edDomicilio.Text    := sdqDatosDOMICILIO.AsString ;
    edProvincia.Text    := sdqDatosPROVINCIA.AsString ;

    if sdqDatosST_FBAJA.IsNull Then
       SetColors(clWindowText)
    else
       SetColors(clRed);

    if Assigned(Sender) Then begin
       Change;

       if (edCodigo.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.cmbDescripcionDropDown(Sender: TObject);
var
  sSql: String;
begin
  cmbDescripcion.DataSource := dsDatos;
  if (FCuit <> '') then
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
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatosST_FBAJA.IsNull Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') Then begin
        if (edCodigo.Text <> sdqDatosST_CLAVE.AsString) Then
            Cargar( '', edCodigo.Value, True )
        else
            cmbDescripcionCloseUp( Nil );
//            cmbDescripcion.Text := sdqDatosST_NOMBRE.AsString ;
     end else
        Limpiar(False);
//        cmbDescripcion.Text := '' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) Then
    cmbDescripcion.DoDropDown( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento_OLD.GetSql: String;
begin
  if FSql = '' Then
    Result := BaseSql + FExtraCondition
  else
    Result := inherited GetSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento_OLD.GetIsEmpty: Boolean;
begin
  Result := edCodigo.Value = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraEstablecimiento_OLD.Create(AOwner: TComponent);
begin
  inherited;
  FExtraCondition := '';
  FShowBajas      := False;
  FSql            := '';
  cmbDescripcion.DataSource := dsDatos;  
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.Clear;
begin
  Limpiar( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.SetForeColor(const Value: TColor);
begin
  edCodigo.Color := Value;
  cmbDescripcion.Color := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.SetReadOnly(const Value: Boolean);
begin
  edCodigo.ReadOnly := Value;
  cmbDescripcion.ReadOnly := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.SetTabStop(const Value: Boolean);
begin
  edCodigo.TabStop := Value;
  cmbDescripcion.TabStop := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento_OLD.GetSqlOrderBy: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento_OLD.GetSqlWhere: string;
begin
  Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento_OLD.GetValue: TTableID;
begin
  Result := edCodigo.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEstablecimiento_OLD.IsBaja: Boolean;
begin
  Result := not sdqDatosST_FBAJA.IsNull;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.SetValue(const Value: TTableID);
begin
  Cargar(FCuit, Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEstablecimiento_OLD.Cargar;
var
  sSql : String;
begin
    sSql := GetSql + ' AND ST_CUIT = ''' + FCuit + '''';
    OpenQuery(sdqDatos, sSql, True);
end;

function TfraEstablecimiento_OLD.GetActividad: String;
begin
    result := '';
    if sdqDatos.Active and not sdqDatos.FieldByName('ST_ACTIVIDAD').IsNull then
        Result := sdqDatos.FieldByName('ST_ACTIVIDAD').AsString;
end;

function TfraEstablecimiento_OLD.GetCPostalA: String;
begin
  result := '';
  if sdqDatos.Active and not sdqDatos.FieldByName('ST_CPOSTALA').IsNull then
      Result := sdqDatos.FieldByName('ST_CPOSTALA').AsString;
end;

function TfraEstablecimiento_OLD.GetContrato: integer;
begin
  if IsSelected then
  begin
    Result := ObtenerValorEx('art.afiliacion.get_contratovigente(:cuit)', [CUIT])
  end else
    Result := 0;
end;

procedure TfraEstablecimiento_OLD.SetContrato(const Value: integer);
begin
  CUIT := ValorSQLEx('SELECT em_cuit ' +
                       'FROM aem_empresa, aco_contrato ' +
                      'WHERE em_id = co_idempresa ' +
                        'AND co_contrato = :contrato', [Value]);
end;

function TfraEstablecimiento_OLD.GetfraEmpresa: TfraEmpresa;
begin
  Result := nil;
end;

function TfraEstablecimiento_OLD.GetIdEstablecimiento: integer;
begin
  result := 0;
  if sdqDatos.Active and not sdqDatos.FieldByName('ST_ID').IsNull then
    Result := sdqDatos.FieldByName('ST_ID').AsInteger;
end;

end.

