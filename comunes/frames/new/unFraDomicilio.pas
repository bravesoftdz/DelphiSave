unit unFraDomicilio;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntEdit, StdCtrls, Mask, ArtComboBox, Db,
  SDEngine, PatternEdit, unArtFrame, unArt, artSeguridad, RxToolEdit;

const
  CAPFED       = 'CAPITAL FEDERAL';
  MAXCODCAPFED = 1440;

type
  TfraDomicilio = class(TArtFrame)
    lbCalle: TLabel;
    lbCPA: TLabel;
    lbCPostal: TLabel;
    lbDto: TLabel;
    lbLocalidad: TLabel;
    lbNro: TLabel;
    lbPiso: TLabel;
    lbProvincia: TLabel;
    procedure FrameExit(Sender: TObject);
    procedure edCPostalExit(Sender: TObject);
    procedure cmbLocalidadCloseUp(Sender: TObject);
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure edNumeroExit(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure cmbLocalidadChange(Sender: TObject);
    procedure cmbLocalidadExit(Sender: TObject);
    procedure cmbCalleEnter(Sender: TObject);
    procedure cmbCalleCloseUp(Sender: TObject);
    procedure cmbCalleDropDown(Sender: TObject);
    procedure cmbCalleExit(Sender: TObject);
  private
    FCalleAnt: String;
    FPermisoCambiarCalle: Boolean;
    FPermisoCambiarCalleProvincias: Boolean;
    FValorCalleOriginal: String;

    function GetCalle: String;
    function GetCodigoPostal: String;
    function GetComponenteSeguridad: TSeguridad;
    function GetCPA: String;
    function GetDepartamento: String;
    function GetLocalidad: String;
    function GetNumero: String;
    function GetPiso: String;
    function GetProv: Integer;
    function GetProvincia: String;
    function GetUbicacion: TTableID;
    function GetColorCalle: TColor;
    function GetColorNumero: TColor;
    function GetColorPiso: TColor;
    function GetColorDepto: TColor;
    function GetColorCpostal: TColor;
    function GetColorCPA: TColor;
    function GetColorLocalidad: TColor;

    procedure SetCalle(const Value: String);
    procedure SetCodigoPostal(const Value: String);
    procedure SetCPA(const Value: String);
    procedure SetDepartamento(const Value: String);
    procedure SetLocalidad(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetPiso(const Value: String);
    procedure SetProv(const Value: Integer);
    procedure SetProvincia(const Value: String);
    procedure SetUbicacion(const Value: TTableID);
    procedure SetColorCalle(const Value: TColor);
    procedure SetColorNumero(const Value: TColor);
    procedure SetColorPiso(const Value: TColor);
    procedure SetColorDepto(const Value: TColor);
    procedure SetColorCPostal(const Value: TColor);
    procedure SetColorCPA(const Value: TColor);
    procedure SetColorLocalidad(const Value: TColor);

  protected
    btnBuscar: TButton;
    cmbCalle: TArtComboBox;
    cmbLocalidad: TArtComboBox;
    dsLocalidad: TDataSource;
    edCPA: TPatternEdit;
    edCPostal: TIntEdit;
    edDto: TEdit;
    edNumero: TEdit;
    edPiso: TEdit;
    edProvincia: TEdit;
    sdqLocalidad: TSDQuery;

    function GetIsEmpty: Boolean; virtual;
    function GetIsSelected: Boolean; virtual;

    procedure Change; override;
    procedure CheckCalle; virtual;
    procedure LoadValues(const aCargarCalle: Boolean = True; aChange: Boolean = True); virtual;
    procedure SetControlForeColor(AControl: TControl; Value: TColor); override;
    procedure SetControlReadOnly(AControl: TControl; Value: Boolean); override;
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;

    function CalleHasChanged: Boolean;
    function IsValid: Boolean;
    function ValidarCalle(const aMsg: String): Boolean;
    function ValidarCodigoPostal(const aMsg: String): Boolean;
    function ValidarCPA(const aMsg: String): Boolean;
    function ValidarDomicilio(const aMsg: String): Boolean;
    function ValidarLocalidad(const aMsg: String): Boolean;
    function ValidarPermisoCalle: Boolean;

    procedure AfterConstruction; override;
    procedure Cargar(sCalle, sCodPostal, sLocalidad, sNumero, sPiso, sDepto, Int_Str_Prov, aCpa: String; bChange: Boolean = True);
    procedure Clear; override;
    procedure FocusNumero;
    procedure SetPermisos;

    property Calle         : String   read GetCalle          write SetCalle;
    property CodigoPostal  : String   read GetCodigoPostal   write SetCodigoPostal;
    property CPA           : String   read GetCPA            write SetCPA;
    property Departamento  : String   read GetDepartamento   write SetDepartamento;
    property IsEmpty       : Boolean  read GetIsEmpty;
    property IsSelected    : Boolean  read GetIsSelected;
    property Localidad     : String   read GetLocalidad      write SetLocalidad;
    property Numero        : String   read GetNumero         write SetNumero;
    property Piso          : String   read GetPiso           write SetPiso;
    property Prov          : Integer  read GetProv           write SetProv;
    property Provincia     : String   read GetProvincia      write SetProvincia;
    property Ubicacion     : TTableID read GetUbicacion      write SetUbicacion;
    property ColorCalle    : TColor   read GetColorCalle     write SetColorCalle;
    property ColorNumero   : TColor   read GetColorNumero    write SetColorNumero;
    property ColorPiso     : TColor   read GetColorPiso      write SetColorPiso;
    property ColorDepto    : TColor   read GetColorDepto     write SetColorDepto;
    property ColorCPostal  : TColor   read GetColorCpostal   write SetColorCPostal;
    property ColorCPA      : TColor   read GetColorCPA       write SetColorCPA;
    property ColorLocalidad: TColor   read GetColorLocalidad write SetColorLocalidad;
  end;

const
  DOM_SINNUMERO = 'S/N';

implementation

uses
  unDmPrincipal, General, strFuncs, AnsiSQL, CustomDlgs, unBusquedaDomicilio, VclExtra, Numeros;

const
  BASESQL =
    'SELECT ub_id, ub_calle, ub_localidad, ub_cpostal, ub_provincia, co_partido,  pv_descripcion' +
     ' FROM cub_ubicacion, art.cco_partidos_codigospostales, cpv_provincias' +
    ' WHERE pv_codigo = ub_provincia ' +
      ' AND ub_cpostal = co_codigopostal(+) ' +
      ' AND ub_localidad = co_localidad(+) ' +
      ' AND ub_provincia = co_provincia(+) ';
  BASEORDER = ' ORDER BY ub_calle, ub_localidad, pv_descripcion';

  BASESQL2 =
    'SELECT DISTINCT NULL AS ub_calle, ub_localidad, ub_cpostal, ub_provincia, co_partido, pv_descripcion' +
              ' FROM cub_ubicacion, art.cco_partidos_codigospostales, cpv_provincias' +
             ' WHERE pv_codigo = ub_provincia ' +
               ' AND ub_cpostal = co_codigopostal(+) ' +
               ' AND ub_localidad = co_localidad(+) ' +
               ' AND ub_provincia = co_provincia(+) ';
  BASEORDER2 = ' ORDER BY ub_localidad, pv_descripcion';

{$R *.DFM}

constructor TfraDomicilio.Create(AOwner: TComponent);
begin
  inherited;

  FPermisoCambiarCalle := False;
  FPermisoCambiarCalleProvincias := False;

  btnBuscar    := TButton(Self.FindComponent('btnBuscar'));
  cmbCalle     := TArtComboBox(Self.FindComponent('cmbCalle'));
  cmbLocalidad := TArtComboBox(Self.FindComponent('cmbLocalidad'));
  dsLocalidad  := TDataSource(Self.FindComponent('dsLocalidad'));
  edCPA        := TPatternEdit(Self.FindComponent('edCPA'));
  edCPostal    := TIntEdit(Self.FindComponent('edCPostal'));
  edDto        := TEdit(Self.FindComponent('edDto'));
  edNumero     := TEdit(Self.FindComponent('edNumero'));
  edPiso       := TEdit(Self.FindComponent('edPiso'));
  edProvincia  := TEdit(Self.FindComponent('edProvincia'));
  sdqLocalidad := TSDQuery(Self.FindComponent('sdqLocalidad'));

  if not Assigned(cmbCalle.DataSource) then
    cmbCalle.DataSource := dsLocalidad;

  if not Assigned(cmbLocalidad.DataSource) then
    cmbLocalidad.DataSource := dsLocalidad;
end;          

function TfraDomicilio.CalleHasChanged: Boolean;
begin
  Result := (cmbCalle.Text <> FValorCalleOriginal);
end;

function TfraDomicilio.GetCalle: String;
var
  RegistroActual: TBookmark;
begin
  cmbCalleExit(nil);
  FrameExit(nil);

  if StrToIntDef(CodigoPostal, 0) <= MAXCODCAPFED then
  begin
    if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) and
      (cmbCalle.Text <> sdqLocalidad.FieldByName('ub_calle').AsString) then
      with sdqLocalidad do
      try
        RegistroActual := GetBookmark;
        DisableControls;

        if not Locate('ub_calle', cmbCalle.Text, [])then
        begin
          GotoBookmark(RegistroActual);
          cmbCalle.Text := sdqLocalidad.FieldByName('ub_calle').AsString;
        end;
      finally
        EnableControls;
      end
  end;

  Result := cmbCalle.Text;
end;

function TfraDomicilio.GetCodigoPostal: String;
begin
  Result := IIF((edCPostal.Value = 0), '', IntToStr(edCPostal.Value));
end;

function TfraDomicilio.GetComponenteSeguridad: TSeguridad;
var
  iLoop: Integer;
begin
  Result := nil;

  if Application.MainForm = nil then
    Exit;

  for iLoop := 0 to Application.MainForm.ComponentCount - 1 do
    if Application.MainForm.Components[iLoop] is TSeguridad then
    begin
      Result := TSeguridad(Application.MainForm.Components[iLoop]);
      Break;
    end;
end;

function TfraDomicilio.GetCPA: String;
begin
  Result := edCPA.Text;
end;

function TfraDomicilio.GetDepartamento: String;
begin
  Result := edDto.Text;
end;

function TfraDomicilio.GetIsEmpty: Boolean;
begin
  Result := (Trim(cmbCalle.Text) = '')     and
             edCPostal.IsEmpty             and
            (Trim(cmbCalle.Text) = '')     and
            (Trim(cmbLocalidad.Text) = '') and
            ((Trim(edNumero.Text) = '') or (edNumero.Text = DOM_SINNUMERO)) and
            (Trim(edPiso.Text) = '')       and
            (Trim(edDto.Text) = '')        and
            (Trim(edCPostal.Text) = '')    and
            (Trim(edCPA.Text) = '')        and
            (Trim(edProvincia.Text) = '');
end;

function TfraDomicilio.GetIsSelected: boolean;
begin
  Result := not GetIsEmpty;
end;

function TfraDomicilio.GetLocalidad: String;
var
  RegistroActual: TBookmark;
begin
  if StrToIntDef(CodigoPostal, 0) > MAXCODCAPFED then
  begin
    if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) and
      (cmbLocalidad.Text <> sdqLocalidad.FieldByName('ub_localidad').AsString) then
      with sdqLocalidad do
      try
        RegistroActual := GetBookmark;
        DisableControls;

        if not Locate('ub_localidad', cmbLocalidad.Text, []) then
        begin
          GotoBookmark(RegistroActual);
          cmbLocalidad.Text := sdqLocalidad.FieldByName('ub_localidad').AsString;
        end;
      finally
        EnableControls;
      end
  end
  else if StrToIntDef(CodigoPostal, 0) = 0 then
    cmbLocalidad.Text := ''
  else
    cmbLocalidad.Text := CAPFED;

  cmbLocalidadExit(nil);

  Result := cmbLocalidad.Text;
end;

function TfraDomicilio.GetNumero: String;
begin
  Result := edNumero.Text;
end;

function TfraDomicilio.GetPiso: String;
begin
  Result := edPiso.Text;
end;

function TfraDomicilio.GetProv: Integer;
begin
  Result := edProvincia.Tag;
end;

function TfraDomicilio.GetProvincia: String;
begin
  Result := edProvincia.Text;
end;

function TfraDomicilio.GetUbicacion: TTableID;
begin
  FrameExit(nil);
  if (sdqLocalidad.Active) and (not sdqLocalidad.IsEmpty) and (sdqLocalidad.FindField('ub_id') <> nil) then
    Result := sdqLocalidad.FieldByName('ub_id').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfraDomicilio.GetColorCalle: TColor;
begin
  Result := cmbCalle.Color;
end;

function TfraDomicilio.GetColorNumero: TColor;
begin
  Result := edNumero.Color;
end;

function TfraDomicilio.GetColorPiso: TColor;
begin
  Result := edPiso.Color;
end;

function TfraDomicilio.GetColorDepto: TColor;
begin
  Result := edDto.Color;
end;

function TfraDomicilio.GetColorCpostal: TColor;
begin
  Result := edCPostal.Color;
end;

function TfraDomicilio.GetColorCPA: TColor;
begin
  Result := edCPA.Color;
end;

function TfraDomicilio.GetColorLocalidad: TColor;
begin
  Result := cmbLocalidad.Color;
end;

function TfraDomicilio.IsValid: Boolean;
var
  sSql: String;
begin
  edCPostalExit(nil);
  Result := False;

  sSql :=
    'SELECT 1' +
     ' FROM cpa_codigospostales' +
    ' WHERE pa_cpa = :cpa' +
      ' AND pa_codigoppostal = :codigoppostal';

  if Trim(cmbCalle.Text) = '' then
    InvalidMsg(cmbCalle, 'La calle no es válida.')
  else if edCPostal.IsEmpty then
    InvalidMsg(edCPostal, 'Código Postal incompleto o inválido.')
  else if (Length(Trim(edCPA.Text)) <> 0) and
          (edCPA.Text <> StringOfChar('9', edCPA.MaxLength)) and
          (not ExisteSqlEx(sSql, [edCPA.Text, edCPostal.Text])) then
    InvalidMsg(edCPA, 'No se ha encontrado el Código Postal.')
  else
    Result := True;

  if Result then
    Result := ValidarPermisoCalle;
end;

function TfraDomicilio.ValidarCalle(const aMsg: String): Boolean;
begin
  Verificar((Calle = ''), cmbCalle, aMsg);

  Result := True;
end;

function TfraDomicilio.ValidarCodigoPostal(const aMsg: String): Boolean;
begin
  Verificar((StrToIntDef(CodigoPostal, 0) < 1), edCPostal, aMsg);

  Result := True;
end;

function TfraDomicilio.ValidarCPA(const aMsg: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM cpa_codigospostales' +
    ' WHERE pa_cpa = :cpa';
  Verificar((Trim(CPA) <> '') and (not ExisteSqlEx(sSql, [CPA])), edCPA, aMsg);

  Result := True;
end;

function TfraDomicilio.ValidarDomicilio(const aMsg: String): Boolean;
begin
  Verificar(IsEmpty, edCPostal, aMsg);

  Result := True;
end;

function TfraDomicilio.ValidarLocalidad(const aMsg: String): Boolean;
begin
  Verificar((Localidad = ''), cmbLocalidad, aMsg);

  Result := True;
end;

function TfraDomicilio.ValidarPermisoCalle: Boolean;
begin
  Result := True;

  if CalleHasChanged then
  begin
    cmbCalle.Modified := False;
    if (cmbCalle.Text <> '') then
    begin
      cmbCalleDropDown(Self);
      if (UCase(Trim(cmbCalle.Text)) = UCase(Trim(sdqLocalidad.FieldByName('ub_calle').AsString))) or
          sdqLocalidad.Locate('ub_calle', cmbCalle.Text, [loCaseInsensitive]) then
        cmbCalle.Text := sdqLocalidad.FieldByName('ub_calle').AsString
      else
        if not FPermisoCambiarCalle then
          if (edProvincia.Text = 'CAPITAL FEDERAL') then    // Capital Federal..
          begin
            cmbCalle.Text := FCalleAnt;
            InfoHint(cmbCalle, 'Usted no tiene permiso para modificar esa calle.', False, 'Información', blnInfo, 3, False);
            Result := False;
          end
          else if not FPermisoCambiarCalleProvincias then
          begin
            cmbCalle.Text := FCalleAnt;
            InfoHint(cmbCalle, 'Usted no tiene permiso para modificar esa calle.', False, 'Información', blnInfo, 3, False);
            Result := False;
          end;
    end;
  end;
end;


procedure TfraDomicilio.AfterConstruction;
begin
  inherited;
  SetPermisos;
  VclExtra.LockControl(edProvincia, True);
end;

procedure TfraDomicilio.Cargar(sCalle, sCodPostal, sLocalidad, sNumero, sPiso, sDepto, Int_Str_Prov, aCpa: String; bChange: Boolean);
var
  sSql: String;
begin
  Clear;
  edCPostal.Text  := sCodPostal;
  edCPA.Text      := aCpa;
  edNumero.Text   := sNumero;
  edNumeroExit(nil);
  edPiso.Text     := sPiso;
  edDto.Text      := sDepto;
  SetCalle(sCalle);
  SetLocalidad(sLocalidad);
  if IsNumber(Int_Str_Prov) then
  begin
    edProvincia.Tag := StrToInt(Int_Str_Prov);

    sSql :=
      'SELECT pv_descripcion' +
       ' FROM cpv_provincias' +
      ' WHERE pv_codigo = :sProv';
    edProvincia.Text := ValorSqlEx(sSql, [Int_Str_Prov]);
  end
  else
  begin
    edProvincia.Text := Int_Str_Prov;

    sSql :=
      'SELECT pv_codigo' +
       ' FROM cpv_provincias' +
      ' WHERE pv_descripcion = :sProv';
    edProvincia.Tag := ValorSqlIntegerEx(sSql, [Int_Str_Prov]);
  end;

  if bChange then
    Change;
end;

procedure TfraDomicilio.CheckCalle;
var
  bValidarCalle: Boolean;
begin
  LoadValues(True, False);
  OpenQuery(sdqLocalidad, BASESQL +
            ' AND ub_cpostal = ' + SqlString(edCPostal.TextSql, True) +
            IIF(cmbLocalidad.Text = '', '', ' AND ub_localidad = ' + SqlString(cmbLocalidad.Text, True)) + ' ' +
            BASEORDER);

  bValidarCalle := (cmbCalle.Text = '')
                    or
                   ((StrToIntDef(CodigoPostal, 0) <= MAXCODCAPFED) {and not FPermisoCambiarCalle})
                    or
                   ((StrToIntDef(CodigoPostal, 0) > MAXCODCAPFED) and not FPermisoCambiarCalleProvincias);

  if bValidarCalle then
  begin
    if (cmbCalle.Text <> '') and (sdqLocalidad.Locate('ub_calle', cmbCalle.Text, [loCaseInsensitive])) then
    begin
      cmbCalle.Text := sdqLocalidad.FieldByName('ub_calle').AsString;
      DoLostFocus;
      Change;
    end
    else
    begin
      cmbCalleDropDown(nil);    // LLama los eventos a mano para poder pasarle el Nil en el Sender
      cmbCalle.DoDropDown(False);
    end;
  end;
end;

procedure TfraDomicilio.Clear;
{-[  Limpia los objetos ]------------------------------------------------------}
begin
  cmbCalle.Text     := '';
  cmbLocalidad.Text := '';
  edNumero.Text     := DOM_SINNUMERO;
  edPiso.Text       := '';
  edDto.Text        := '';
  edCPostal.Text    := '';
  edCPA.Text        := '';
  edProvincia.Text  := '';
  edProvincia.Tag   := -1;
  sdqLocalidad.Close;
end;

procedure TfraDomicilio.FocusNumero;
begin
  if edNumero.CanFocus then
    edNumero.SetFocus;
end;

procedure TfraDomicilio.LoadValues(const aCargarCalle: Boolean = True; aChange: Boolean = True);
begin
// Modificado por Raúl BEGIN
// Assert levanta exception cuando el primer parámetro es false
//   Assert( sdqLocalidad.IsEmpty, 'El query no esta cargado !!' );
//   Assert( sdqLocalidad.FieldByName('UB_PROVINCIA').IsNull, 'La Provincia es NULL !!' );
//   Assert( not sdqLocalidad.IsEmpty, 'El query no esta cargado !!' );
//   Assert( not sdqLocalidad.FieldByName('UB_PROVINCIA').IsNull, 'La Provincia es NULL !!' );
// Modificado por Raúl END

  with sdqLocalidad do
  begin
    cmbLocalidad.Text := FieldByName('ub_localidad').AsString;
    edProvincia.Tag   := Nvl(FieldByName('ub_provincia').AsInteger, -1);
    edProvincia.Text  := FieldByName('pv_descripcion').AsString;
    edCPostal.Text    := FieldByName('ub_cpostal').AsString;

    if (Assigned(FindField('ub_calle'))) and (not FieldByName('ub_calle').IsNull) and (aCargarCalle) then
      cmbCalle.Text := FieldByName('ub_calle').AsString;
  end;

  FValorCalleOriginal := cmbCalle.Text;
  if aChange then
    Change;
end;

procedure TfraDomicilio.SetCalle(const Value: String);
begin
  cmbCalle.Text       := Value;
  FValorCalleOriginal := Value;
end;

procedure TfraDomicilio.SetCodigoPostal(const Value: String);
begin
  if StrToIntDef(Value, 0) > 0 then
    edCPostal.Value := StrToIntDef(Value, 0)
  else
    edCPostal.Clear;
end;

procedure TfraDomicilio.SetControlForeColor(AControl: TControl; Value: TColor);
begin
  if not AreInObjects(AControl, [{edCPA, }edProvincia]) then
     inherited;
end;

procedure TfraDomicilio.SetControlReadOnly(AControl: TControl; Value: Boolean);
begin
  if not AreInObjects(AControl, [{edCPA, }edProvincia]) then
    inherited;
end;

procedure TfraDomicilio.SetCPA(const Value: String);
begin
  edCPA.Text := Value
end;

procedure TfraDomicilio.SetDepartamento(const Value: String);
begin
  edDto.Text := Value;
end;

procedure TfraDomicilio.SetLocalidad(const Value: String);
begin
  cmbLocalidad.Text := Value;
end;

procedure TfraDomicilio.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([cmbCalle, btnBuscar, edNumero, edPiso, edDto, edCPostal, edCPA, cmbLocalidad], Value);
end;

procedure TfraDomicilio.SetNumero(const Value: String);
begin
  edNumero.Text := Value;
end;

procedure TfraDomicilio.SetPermisos;
var
  aSeguridad: TSeguridad;
begin
  inherited;
  aSeguridad := GetComponenteSeguridad;

  if aSeguridad <> nil then
  begin
    if aSeguridad.Claves.ItemsByName['PermisoParaModificarCalles'] <> nil then
      FPermisoCambiarCalle := aSeguridad.Claves.ItemsByName['PermisoParaModificarCalles'].Value;

    {
    if aSeguridad.Claves.ItemsByName['PermisoParaModificarCallesProvincia'] <> nil then
      FPermisoCambiarCalleProvincias := aSeguridad.Claves.ItemsByName['PermisoParaModificarCallesProvincia'].Value;
    }
    FPermisoCambiarCalleProvincias := True;
  end;
end;

procedure TfraDomicilio.SetPiso(const Value: String);
begin
  edPiso.Text := Value;
end;

procedure TfraDomicilio.SetProv(const Value: Integer);
begin
  edProvincia.Tag := Value;
end;

procedure TfraDomicilio.SetProvincia(const Value: String);
begin
  edProvincia.Text := Value;
end;

procedure TfraDomicilio.SetUbicacion(const Value: TTableID);
var
  sSql: String;
begin
  sSql := BASESQL + ' AND ub_id = ' + SqlValue(Value);

  if OpenQuery(sdqLocalidad, sSql, True) and (not sdqLocalidad.IsEmpty) then
    LoadValues
  else
    Clear;
end;


// Exit del Cod.Postal, se fija si es de Cap Fed o Provincia, de acuerdo a eso abre el combo de Calle o Localidad, en ese orden.
procedure TfraDomicilio.edCPostalExit(Sender: TObject);
  procedure LimpiarCPostal;
  begin
    edCPostal.Clear;
    edProvincia.Tag   := -1;
    edProvincia.Text  := '';
    cmbLocalidad.Text := '';
    sdqLocalidad.Close;
  end;

begin
  if edCPostal.Modified then
  begin
    if(edCPostal.Text = '') then
      LimpiarCPostal
    else
    begin
      OpenQuery(sdqLocalidad, BASESQL2 + ' AND ub_cpostal = ' + SqlString(edCPostal.TextSql, True) + BASEORDER2);
      if sdqLocalidad.IsEmpty then
      begin
        if Assigned(Sender) then
          InvalidMsg(TWinControl(Sender), 'No se encontró el código postal ingresado.');

        LimpiarCPostal;
      end
      else if (sdqLocalidad.RecordCount = 1) then
        CheckCalle
      else
        cmbLocalidad.DoDropDown(False);
    end;
    edCPostal.Modified := False;
  end;
end;

{--[ Luego de seleccionar la localidad, expando los datos ]--------------------}
procedure TfraDomicilio.cmbLocalidadCloseUp(Sender: TObject);
begin
//  if FPermisoCambiarCalle then
//    Exit;

// xxx    18.1.7 by alapaco..
// Lo de arriba se comenta para que cuando se elije una localidad se cambie el valor del campo provincia..
// Está a prueba...si falla algo relacionado con este frame habilitar las lineas de arriba para probar..

  if (cmbLocalidad.Text <> '') then
    if Assigned(sdqLocalidad.FindField('ub_calle')) then
    begin
      LoadValues(not FPermisoCambiarCalle);
      DoLostFocus;
    end
    else
      CheckCalle;
end;

procedure TfraDomicilio.cmbLocalidadDropDown(Sender: TObject);
var
  Sql: String;
begin
  Sql := BASESQL2 +
    ' AND ub_localidad LIKE ''' + Ucase(Trim( cmbLocalidad.Text )) + '%''' +
    ' AND ub_provincia <> ''1'' ' +
    IIF(edCPostal.Text <> '', ' AND ub_cpostal = ' + edCPostal.TextSql, '') +
    ' UNION ' +
    BASESQL2 +
    ' AND co_partido LIKE ''' + Ucase(Trim( cmbLocalidad.Text )) + '%''' +
    ' AND ub_provincia <> ''1'' ' +
    BASEORDER2;
  OpenQuery(sdqLocalidad, Sql, True);
end;

{--[ Al cerrar el combo de Calle, expando los datos ]--------------------------}
procedure TfraDomicilio.cmbCalleCloseUp(Sender: TObject);
begin
  if (cmbCalle.Text <> '') then
  begin
    LoadValues;

    if (cmbCalle.Tag = 0) then
      edNumero.SetFocus
    else
      DoLostFocus
  end;
end;

procedure TfraDomicilio.cmbCalleDropDown(Sender: TObject);
var
  Sql: String;
begin
  Sql := BASESQL;

  Verificar((edCPostal.Text = '') and (cmbLocalidad.Text = '') and (Length(cmbCalle.Text) < 2), cmbCalle, 'Debe ingresar como mínimo dos caracteres para realizar la búsqueda.');

  if (edCPostal.Text <> '' ) then
    Sql := Sql + ' AND ub_cpostal = ''' + edCPostal.Text + ''' ';

  if (Assigned(Sender)) and (TRim(cmbCalle.Text) <> '') then
    Sql := Sql + ' AND ub_calle LIKE ''' + cmbCalle.Text + '%'' ';

  if (cmbLocalidad.Text <> '') then
    Sql := Sql + ' AND ub_localidad = ' + SqlString(cmbLocalidad.Text, True) + ' ';{By Fede 24/07/2002}

  OpenQuery(sdqLocalidad, Sql + BASEORDER, True);

  if not Assigned(Sender) then
  begin
    cmbCalle.Tag := 1;
    sdqLocalidad.Locate('ub_calle', cmbCalle.Text, [loCaseInsensitive, loPartialKey]);
  end
  else
    cmbCalle.Tag := 0;
end;

procedure TfraDomicilio.FrameExit(Sender: TObject);
begin
  edNumeroExit(Sender);
  if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) then
    if ((not IsEmptyString(Trim(cmbCalle.Text))) and (not IsEmptyString(Trim(edCPostal.Text)) or (not IsEmptyString(Trim(cmbLocalidad.Text)))))
    or ((not IsEmptyString(Trim(edCPostal.Text)) and (not IsEmptyString(Trim(cmbLocalidad.Text))))) then
      LoadValues(not ((FPermisoCambiarCalle) or ((edProvincia.Text <> 'CAPITAL FEDERAL') and
                (FPermisoCambiarCalleProvincias))))
    else
      Clear;
end;

procedure TfraDomicilio.cmbCalleExit(Sender: TObject);
begin
  ValidarPermisoCalle;
end;

procedure TfraDomicilio.edNumeroExit(Sender: TObject);
begin
  if (not edNumero.ReadOnly) and (Trim(edNumero.Text) = '') then
    edNumero.Text := DOM_SINNUMERO;
end;

procedure TfraDomicilio.btnBuscarClick(Sender: TObject);
var
  frmBusquedaDomicilio: TfrmBusquedaDomicilio;
begin
  frmBusquedaDomicilio := TfrmBusquedaDomicilio.Create(Self);
  try
    frmBusquedaDomicilio.Frame := Self;
    frmBusquedaDomicilio.ShowModal;
  finally
    frmBusquedaDomicilio.Free;
  end;
end;

procedure TfraDomicilio.cmbLocalidadChange(Sender: TObject);
begin
  inherited;

  if (sdqLocalidad.Active) and (not sdqLocalidad.IsEmpty) then
  begin
    Localidad        := cmbLocalidad.Text;
    edProvincia.Tag  := Nvl(sdqLocalidad.FieldByName('ub_provincia').AsString, -1);
    edProvincia.Text := sdqLocalidad.FieldByName('pv_descripcion').AsString;
  end;
end;

procedure TfraDomicilio.cmbCalleEnter(Sender: TObject);
begin
  inherited;
  FCalleAnt := cmbCalle.Text;
end;

procedure TfraDomicilio.cmbLocalidadExit(Sender: TObject);
{$IFDEF ORACLE}
var
  sSql: String;
{$ENDIF}  
begin
  inherited;
  
  {$IFDEF ORACLE}
  sSql :=
    'SELECT 1' +
     ' FROM cub_ubicacion' +
    ' WHERE ub_localidad = ' + SqlValue(cmbLocalidad.Text);

  if edCPostal.Text <> '' then
    sSql := sSql + ' AND ub_cpostal = ' + SqlValue(edCPostal.Text);

  if not ExisteSql(sSql) then
    cmbLocalidad.Clear;
  {$ENDIF}
end;

procedure TfraDomicilio.Change;
begin
  inherited;
  if Assigned(FOnChange) then
    OnChange(Self);
end;

procedure TfraDomicilio.SetColorCalle(const Value: TColor);
begin
  cmbCalle.Color := Value;
end;

procedure TfraDomicilio.SetColorNumero(const Value: TColor);
begin
  edNumero.Color := Value;
end;

procedure TfraDomicilio.SetColorPiso(const Value: TColor);
begin
  edPiso.Color := Value;
end;

procedure TfraDomicilio.SetColorDepto(const Value: TColor);
begin
  edDto.Color := Value;
end;

procedure TfraDomicilio.SetColorCPostal(const Value: TColor);
begin
  edCPostal.Color := Value;
end;

procedure TfraDomicilio.SetColorCPA(const Value: TColor);
begin
  edCPA.Color := Value;
end;

procedure TfraDomicilio.SetColorLocalidad(const Value: TColor);
begin
  cmbLocalidad.Color := Value;
end;

initialization
  RegisterClasses([TButton, TArtComboBox, TDataSource, TPatternEdit, TIntEdit, TEdit, TSDQuery]);
end.
