unit unFraDomicilioTrab;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntEdit, StdCtrls, Mask, ArtComboBox, Db,
  SDEngine, PatternEdit, unArtFrame, unArt, RxToolEdit;

type
  TfraDomicilioTrab = class(TArtFrame)
    lbCalle: TLabel;
    lbNro: TLabel;
    lbPiso: TLabel;
    lbDto: TLabel;
    lbCPostal: TLabel;
    lbCPA: TLabel;
    lbLocalidad: TLabel;
    lbProvincia: TLabel;
    procedure edCPostalExit(Sender: TObject);
    procedure cmbLocalidadCloseUp(Sender: TObject);
    procedure cmbLocalidadDropDown(Sender: TObject);
    procedure cmbCalleCloseUp(Sender: TObject);
    procedure cmbCalleDropDown(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure cmbCalleExit(Sender: TObject);
    procedure edNumeroExit(Sender: TObject);
  private
    function GetCalle: String;
    function GetCodigoPostal: String;
    function GetCPA: String;
    function GetDepartamento: String;
    function GetIsEmpty: Boolean;
    function GetIsSelected: Boolean;
    function GetLocalidad: String;
    function GetNumero: String;
    function GetPiso: String;
    function GetProv: Integer;
    function GetProvincia: String;

    procedure SetCalle(const Value: String);
    procedure SetCodigoPostal(const Value: String);
    procedure SetCPA(const Value: String);
    procedure SetDepartamento(const Value: String);
    procedure SetLocalidad(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetPiso(const Value: String);
    procedure SetProv(const Value: Integer);
    procedure SetProvincia(const Value: String);
  protected
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

    procedure LoadValues; virtual;
    procedure SetControlForeColor(AControl: TControl; Value: TColor); override;
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;

    function IsValid: Boolean;

    procedure Clear; override;
    procedure LockCPA(const aLock: Boolean);
    procedure LockProvincia(const aLock: Boolean);

    property IsEmpty   : Boolean read GetIsEmpty;
    property IsSelected: Boolean read GetIsSelected;
  published
    property Calle       : String  read GetCalle        write SetCalle;
    property CodigoPostal: String  read GetCodigoPostal write SetCodigoPostal;
    property CPA         : String  read GetCPA          write SetCPA;
    property Departamento: String  read GetDepartamento write SetDepartamento;
    property Localidad   : String  read GetLocalidad    write SetLocalidad;
    property Numero      : String  read GetNumero       write SetNumero;
    property Piso        : String  read GetPiso         write SetPiso;
    property Prov        : Integer read GetProv         write SetProv;
    property Provincia   : String  read GetProvincia    write SetProvincia;
  end;

implementation

uses
  unDmPrincipal, General, strFuncs, SqlOracle, Customdlgs, VCLExtra;

{$R *.DFM}

const
  CAPFED = 'CAPITAL FEDERAL';
  DOM_SINNUMERO = 'S/N';
  MAXCODCAPFED = 1440;
  BaseSql = 'SELECT CP_CODIGO, CP_LOCALIDAD, CP_PROVINCIA, PV_CODIGO, PV_DESCRIPCION' +
             ' FROM CCP_CODIGOPOSTAL, CPV_PROVINCIAS' +
            ' WHERE PV_CODIGO = CP_PROVINCIA ';
  BaseOrder = ' ORDER BY CP_LOCALIDAD, PV_DESCRIPCION ';

{ TfraDireccion }

constructor TfraDomicilioTrab.Create(AOwner: TComponent);
begin
  inherited;

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
end;


function TfraDomicilioTrab.GetCalle: String;
var
  RegistroActual: TBookmark;
begin
  if StrToIntDef(CodigoPostal, 0) <= MAXCODCAPFED then
    if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) and (cmbCalle.Text <> sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString) then
      with sdqLocalidad do
      try
        RegistroActual := GetBookmark;
        DisableControls;

        if not Locate('CP_LOCALIDAD', cmbCalle.Text, []) then
        begin
          GotoBookmark(RegistroActual);
          cmbCalle.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString;
        end;
      finally
        EnableControls;
      end;

  Result := cmbCalle.Text;
end;

function TfraDomicilioTrab.GetCodigoPostal: String;
begin
  Result := IIF((edCPostal.Value = 0), '', IntToStr(edCPostal.Value));
end;

function TfraDomicilioTrab.GetCPA: String;
begin
  Result := edCPA.Text;
end;

function TfraDomicilioTrab.GetDepartamento: String;
begin
  Result := edDto.Text;
end;

function TfraDomicilioTrab.GetIsEmpty: boolean;
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

function TfraDomicilioTrab.GetIsSelected: Boolean;
begin
  Result := not GetIsEmpty;
end;

function TfraDomicilioTrab.GetLocalidad: String;
var
  RegistroActual: TBookmark;
begin
  if StrToIntDef(CodigoPostal, 0) > MAXCODCAPFED then
  begin
    if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) and (cmbLocalidad.Text <> sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString) then
      with sdqLocalidad do
      try
        RegistroActual := GetBookmark;
        DisableControls;

        if not Locate('CP_LOCALIDAD', cmbLocalidad.Text, []) then
        begin
          GotoBookmark(RegistroActual);
          cmbLocalidad.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString;
        end;
      finally
        EnableControls;
      end
  end
  else if StrToIntDef(CodigoPostal, 0) = 0 then
    cmbLocalidad.Text := CAPFED;

  Result := cmbLocalidad.Text;
end;

function TfraDomicilioTrab.GetNumero: String;
begin
  Result := edNumero.Text;
end;

function TfraDomicilioTrab.GetPiso: String;
begin
  Result := edPiso.Text;
end;

function TfraDomicilioTrab.GetProv: Integer;
begin
  Result := edProvincia.Tag;
end;

function TfraDomicilioTrab.GetProvincia: String;
begin
  Result := edProvincia.Text;
end;

function TfraDomicilioTrab.IsValid: Boolean;
begin
  edCPostalExit(nil);
  Verificar(Trim(cmbCalle.Text) = '', cmbCalle, 'Debe ingresar la calle.');
  Verificar(edCPostal.IsEmpty, edCPostal, 'Debe ingresar el código postal.');
  Result := True;
end;


{-[  Limpia los objetos ]----------------------------------------------------------------------------------------------}
procedure TfraDomicilioTrab.Clear;
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

procedure TfraDomicilioTrab.LoadValues;
begin
  with sdqLocalidad do
  begin
    cmbLocalidad.Text := FieldByName('CP_LOCALIDAD').AsString;
    edProvincia.Tag   := FieldByName('CP_PROVINCIA').AsInteger;
    edProvincia.Text  := FieldByName('PV_DESCRIPCION').AsString;
    edCPostal.Text    := FieldByName('CP_CODIGO').AsString;
  end;
end;

procedure TfraDomicilioTrab.LockCPA(const aLock: Boolean);
begin
  VCLExtra.LockControl(edCPA, aLock);
end;

procedure TfraDomicilioTrab.LockProvincia(const aLock: Boolean);
begin
  VCLExtra.LockControl(edProvincia, aLock);
end;

procedure TfraDomicilioTrab.SetCalle(const Value: String);
begin
  cmbCalle.Text := Value;
end;

procedure TfraDomicilioTrab.SetCodigoPostal(const Value: String);
begin
  edCPostal.Value := StrToIntDef(Value, 0);
end;

procedure TfraDomicilioTrab.SetControlForeColor(AControl: TControl; Value: TColor);
begin
  if not AreInObjects(AControl, [edCPA, edProvincia]) then
    inherited;
end;

procedure TfraDomicilioTrab.SetCPA(const Value: String);
begin
  edCPA.Text := Value
end;

procedure TfraDomicilioTrab.SetDepartamento(const Value: String);
begin
  edDto.Text := Value;
end;

procedure TfraDomicilioTrab.SetLocalidad(const Value: String);
begin
  cmbLocalidad.Text := Value;
end;

procedure TfraDomicilioTrab.SetLocked(const Value: Boolean);
begin
  inherited;

  VCLExtra.LockControls([cmbCalle, edNumero, edPiso, edDto, edCPostal, edCPA, cmbLocalidad], Value);
  VCLExtra.LockControls([edProvincia], True);   // Esto debería estar siempre lockeado..
end;

procedure TfraDomicilioTrab.SetNumero(const Value: String);
begin
  edNumero.Text := Value;
end;

procedure TfraDomicilioTrab.SetPiso(const Value: String);
begin
  edPiso.Text := Value;
end;

procedure TfraDomicilioTrab.SetProv(const Value: Integer);
begin
  edProvincia.Tag := Value;
end;

procedure TfraDomicilioTrab.SetProvincia(const Value: String);
begin
  edProvincia.Text := Value;
end;


// Exit del Cod.Postal, se fija si es de Cap Fed o Provincia, de acuerdo a eso abre el combo de Calle o Localidad, en ese orden.
procedure TfraDomicilioTrab.edCPostalExit(Sender: TObject);
begin
  if edCPostal.Modified then
  begin
    if(edCPostal.Text = '') then
    begin
      edProvincia.Tag   := -1;
      edProvincia.Text  := '';
      cmbLocalidad.Text := '';
      sdqLocalidad.Close;
    end
    else
    begin
      OpenQuery(sdqLocalidad, BaseSql + 'AND CP_CODIGO = ' + SqlString(edCPostal.TextSql,True) + BaseOrder);
      if sdqLocalidad.IsEmpty then
      begin
        InvalidMsg(edCPostal, 'No se encontró el código postal ingresado.');
        edCPostal.SelectAll;
        edCPostal.SetFocus;
      end
      else if (sdqLocalidad.RecordCount = 1) or (sdqLocalidad.FieldByName('PV_DESCRIPCION').AsString = CAPFED) then
      begin
        edProvincia.Tag  := sdqLocalidad.FieldByName('CP_PROVINCIA').AsInteger;
        edProvincia.Text := sdqLocalidad.FieldByName('PV_DESCRIPCION').AsString;

        if sdqLocalidad.FieldByName('PV_DESCRIPCION').AsString = CAPFED then
        begin
          cmbLocalidad.Text := CAPFED;

          if (cmbCalle.Text <> '') and sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive]) then
          begin
            cmbCalle.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString;
            DoLostFocus;
          end
          else
          begin
            cmbCalleDropDown(nil);// LLama los eventos a mano para poder pasarle el Nil en el Sender
            cmbCalle.DoDropDown(False);
          end;
        end
        else
        begin
          cmbLocalidad.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString;
          DoLostFocus;
        end;
      end
      else
        cmbLocalidad.DoDropDown(False);
    end;
    edCPostal.Modified := False;
  end;
end;

{--[ Luego de seleccionar la localidad, expando los datos ]------------------------------------------------------------}
procedure TfraDomicilioTrab.cmbLocalidadCloseUp(Sender: TObject);
begin
  if (cmbLocalidad.Text <> '') then
  begin
    LoadValues;
    DoLostFocus;
  end;
end;

procedure TfraDomicilioTrab.cmbLocalidadDropDown(Sender: TObject);
var
  Sql: String;
begin
  Sql := BaseSql +
         ' AND CP_LOCALIDAD LIKE ''' + Ucase(Trim(cmbLocalidad.Text)) + '%''' +
         ' AND CP_PROVINCIA <> ''1'' ' +
         IIF(edCPostal.Text <> '', ' AND CP_CODIGO = ' + edCPostal.TextSql, '') +
         BaseOrder;
  OpenQuery(sdqLocalidad, Sql, True);
end;

{--[ Al cerrar el combo de Calle, expando los datos ]------------------------------------------------------------------}
procedure TfraDomicilioTrab.cmbCalleCloseUp(Sender: TObject);
begin
  if cmbCalle.Text <> '' then
  begin
    edCPostal.Text    := sdqLocalidad.FieldByName('CP_CODIGO').AsString;
    cmbLocalidad.Text := CAPFED;
    edProvincia.Tag   := 1;
    edProvincia.Text  := CAPFED;

    if (cmbCalle.Tag = 0) then
      edNumero.SetFocus
    else
      DoLostFocus
  end;
end;

procedure TfraDomicilioTrab.cmbCalleDropDown(Sender: TObject);
var
  Sql: String;
begin
  if (cmbLocalidad.Text = CAPFED) or (cmbLocalidad.Text = '') then
  begin
    Sql := BaseSql + 'AND CP_PROVINCIA = ''1'' ';

    if (edCPostal.Text <> '') then
      Sql := Sql + 'AND CP_CODIGO = ''' + edCPostal.Text + ''' ';

    if Assigned(Sender) and (Trim(cmbCalle.Text) <> '') then
      Sql := Sql + 'AND CP_LOCALIDAD LIKE ''' + cmbCalle.Text + '%'' ';

    OpenQuery(sdqLocalidad, Sql + BaseOrder, True);

    if not Assigned(Sender) then
    begin
      cmbCalle.Tag := 1;
      sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive, loPartialKey]);
    end
    else
      cmbCalle.Tag := 0;

    cmbCalle.AllowDropDown := True;
  end
  else
    cmbCalle.AllowDropDown := False;
end;

procedure TfraDomicilioTrab.FrameExit(Sender: TObject);
begin
  if sdqLocalidad.Active and (not sdqLocalidad.IsEmpty) then
  begin
    LoadValues;
    if (sdqLocalidad.FieldByName('CP_PROVINCIA').AsInteger = 1) then
    begin
      cmbLocalidad.Text := CAPFED;
      if (sdqLocalidad.RecordCount = 1) or (sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive])) then
        cmbCalle.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString
      else
        cmbCalle.Text := '';
    end
    else
      cmbLocalidad.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString;
  end;
  if edNumero.Text = '' then
    edNumero.Text := DOM_SINNUMERO;
end;

procedure TfraDomicilioTrab.cmbCalleExit(Sender: TObject);
begin
  if cmbCalle.Modified then
  begin
    cmbCalle.Modified := False;
    if (cmbCalle.Text <> '') and (cmbLocalidad.Text = CAPFED) then
    begin
      cmbCalleDropDown(Self);

      if (sdqLocalidad.RecordCount = 1) or
         (UCase(Trim(cmbCalle.Text)) = UCase(Trim(sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString))) or
          sdqLocalidad.Locate('CP_LOCALIDAD', cmbCalle.Text, [loCaseInsensitive]) then
        cmbCalle.Text := sdqLocalidad.FieldByName('CP_LOCALIDAD').AsString
      else
        cmbCalle.Text := '';
    end;
  end;
end;

procedure TfraDomicilioTrab.edNumeroExit(Sender: TObject);
begin
  if edNumero.Text = '' then
    edNumero.Text := DOM_SINNUMERO;
end;


initialization
  RegisterClasses([TArtComboBox, TDataSource, TPatternEdit, TIntEdit, TEdit, TSDQuery]);

end.
