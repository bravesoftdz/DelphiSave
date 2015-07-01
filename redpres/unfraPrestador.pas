{-----------------------------MENSAJE---------------------------}
Este frame ya no se debe usar mas, cambiar por el que está en
c:\delphi\desarrollo\comunes\frames
{---------------------------------------------------------------}

unit unfraPrestador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ToolEdit, ArtComboBox, StdCtrls, Mask, Db,
  SDEngine, IntEdit, PatternEdit, unArtFrame, unArtDbFrame, unART;

type
  TPrestador = Integer;

  TfraPrestador = class(TArtDbFrame)
    lbCUIT: TLabel;
    lbSec: TLabel;
    lbIdentif: TLabel;
    lbRSocial: TLabel;
    lbDomicilio: TLabel;
    lbLocalidad: TLabel;
    lbCPostal: TLabel;
    lbTelefono: TLabel;
    sdqPrestadorCA_FECHACONEXIA: TDateTimeField;
    sdqPrestadorCA_HABILITACIONES: TStringField;
    procedure mskPrestCUITKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPrestadorDropDown(Sender: TObject);
    procedure edPrestSecuenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edPrestIdentifKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPrestadorCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure cmbPrestadorGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                        Highlight: Boolean);
    procedure cmbPrestFantasiaCloseUp(Sender: TObject);
    procedure cmbPrestFantasiaDropDown(Sender: TObject);
    procedure cmbPrestFantasiaGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                            Highlight: Boolean);
  private
    FExtraCondition: String;
    FInvisibles: Boolean;
    FLocked: Boolean;
    FOnChange: TNotifyEvent;
    FShowNombreFanta: Boolean;
    FSql: String;

    function BajaSql: String;
    function GetBaja: Boolean; reintroduce;
    function GetCodigoPostal: String;
    function GetConcertado: String;
    function GetCorreoElectronico: String;
    function GetCuit: String;
    function GetDomicilio: String;
    function GetFax: String;
    function GetFechaBaja: TDateTime;
    function GetIDPrestador: Integer;
    function GetIsEmpty: Boolean; reintroduce;
    function GetIsSelected: Boolean; reintroduce;
    function GetIva: String;
    function GetLocalidad: String;
    function GetModified: Boolean; reintroduce;
    function GetNombreFantasia: String;
    function GetProvincia: String;
    function GetRazonSocial: String;
    function GetReadOnly: Boolean;
    function GetSecuencia: Integer;
    function GetSql: String; reintroduce;
    function GetTelefono: String;
    function GetTipoComprobante: String;
    function GetValue2: TPrestador; reintroduce;
    function InvisiblesSql: String;

    procedure SetCodigoPostal(const Value: String);
    procedure SetCuit(const Value: String);
    procedure SetDomicilio(const Value: String);
    procedure SetIDPrestador(const Value: Integer);
    procedure SetLocalidad(const Value: String);
    procedure SetLocked(const Value: Boolean); reintroduce;
    procedure SetModified(const Value: Boolean); reintroduce;
    procedure SetNombreFanta(const Value: Boolean);
    procedure SetRazonSocial(const Value: String);
    procedure SetReadOnly(const Value: Boolean); reintroduce;
    procedure SetSecuencia(const Value: Integer);
    procedure SetValue(const Value: TPrestador); reintroduce;
    procedure ShowList;
    procedure Validate;
    function GetInfoUtil: String;
  protected
    cmbPrestador: TArtComboBox;
    cmbPrestFantasia: TArtComboBox;
    dsPrestador: TDataSource;
    edPresCPostal: TEdit;
    edPresDomicilio: TEdit;
    edPresLocalidad: TEdit;
    edPresTelefono: TEdit;
    edPrestIdentif: TIntEdit;
    edPrestSecuencia: TIntEdit;
    mskPrestCUIT: TMaskEdit;
    sdqPrestador: TSDQuery;

    function GetValue: TTableID; override;
  public
    ShowBajas: Boolean;

    constructor Create(AOwner: TComponent); override;

    function Cargar(Identificador: Integer; NoBajas: Boolean = False): Boolean;

    procedure CambiarColor(const aColor: TColor);
    procedure Clear; { Para compatibilidad con versiones nueva } reintroduce;
    procedure CuitFocus;
    procedure IDPrestadorFocus;
    procedure Limpiar;
    procedure LoadValues; reintroduce;
    procedure SetBackColors(AColor: TColor; ADisableColor: TColor = clSilver);
    procedure SetColors(AColor: TColor);

    property IsEmpty   : Boolean read GetIsEmpty;
    property IsSelected: Boolean read GetIsSelected;
    procedure AfterConstruction; override;
  published
    property Baja             : Boolean      read GetBaja;
    property CodigoPostal     : String       read GetCodigoPostal   write SetCodigoPostal;
    property Concertado       : String       read GetConcertado;
    property CorreoElectronico: String       read GetCorreoElectronico;
    property Cuit             : String       read GetCuit           write SetCuit;
    property Domicilio        : String       read GetDomicilio      write SetDomicilio;
    property ExtraCondition   : String       read FExtraCondition   write FExtraCondition;
    property FechaBaja        : TDateTime    read GetFechaBaja;
    property Fax              : String       read GetFax;
    property IDPrestador      : Integer      read GetIDPrestador    write SetIDPrestador;
    property InfoUtil         : String       read GetInfoUtil; 
    property Iva              : String       read GetIva;
    property Localidad        : String       read GetLocalidad      write SetLocalidad;
    property Locked           : Boolean      read FLocked           write SetLocked;
    property Modified         : Boolean      read GetModified       write SetModified;
    property NombreFantasia   : String       read GetNombreFantasia;
    property OnChange         : TNotifyEvent read FOnChange         write FOnChange;
    property Provincia        : String       read GetProvincia;
    property RazonSocial      : String       read GetRazonSocial    write SetRazonSocial;
    property ReadOnly         : Boolean      read GetReadOnly       write SetReadOnly;
    property Secuencia        : Integer      read GetSecuencia      write SetSecuencia;
    property ShowInvisibles   : Boolean      read FInvisibles       write FInvisibles;
    property ShowNombreFanta  : Boolean      read FShowNombreFanta  write SetNombreFanta default False;
    property Sql              : String       read GetSql            write FSql;
    property Telefono         : String       read GetTelefono;
    property TipoComprobante  : String       read GetTipoComprobante;
    property Value            : TPrestador   read GetValue2         write SetValue;
  end;

implementation

uses
  unDmPrincipal, General, AnsiSql, SqlFuncs, VclExtra, CustomDlgs;

{$R *.DFM}

function TfraPrestador.Cargar(Identificador: Integer; NoBajas: Boolean = False): Boolean;
begin
  sdqPrestador.Close;
  sdqPrestador.Sql.Text := GetSql + IIF(NoBajas, BajaSql, '') + InvisiblesSql + 'AND CA_IDENTIFICADOR = ' + SqlInt(Identificador);
  OpenQuery(sdqPrestador);
  if sdqPrestador.Eof then
  begin
    Limpiar;
    Result := False;
  end
  else
  begin
    cmbPrestadorCloseUp(nil);
    Result := True;
  end;
end;

function TfraPrestador.GetBaja: Boolean;
begin
  Result := not sdqPrestador.FieldByName('CA_FECHABAJA').IsNull;
end;

function TfraPrestador.GetCodigoPostal: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('CA_CODPOSTAL').AsString
  else
    Result := '';
end;

function TfraPrestador.GetConcertado: String;
begin
  Result := sdqPrestador.FieldByName('CA_CONCERTADO').AsString;
end;

function TfraPrestador.GetCorreoElectronico: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('CA_DIRELECTRONICA').AsString
  else
    Result := '';
end;

function TfraPrestador.GetCuit: String;
begin
  Result := mskPrestCUIT.Text;
end;

function TfraPrestador.GetDomicilio: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('CA_DOMICILIO').AsString
  else
    Result := '';
end;

function TfraPrestador.GetFax: String;
var
  sSql: String;
begin
  if IsSelected then
  begin
    sSql :=
      'SELECT ART.VARIOS.GET_FAXPARAENVIO(CA_FAX)' +
       ' FROM CPR_PRESTADOR' +
      ' WHERE CA_IDENTIFICADOR = :ID';
    Result := ValorSQLEx(sSql, [sdqPrestador.FieldByName('CA_IDENTIFICADOR').AsInteger]);
  end
  else
    Result := '';
end;

function TfraPrestador.GetFechaBaja: TDateTime;
begin
  Result := sdqPrestador.FieldByName('CA_FECHABAJA').AsDateTime;
end;

function TfraPrestador.GetIDPrestador: Integer;
begin
  if IsSelected then
    Result := edPrestIdentif.Value
  else
    Result := 0;
end;

function TfraPrestador.GetIsEmpty: Boolean;
begin
  Result := (GetValue = 0);
end;

function TfraPrestador.GetIsSelected: Boolean;
begin
  Result := not IsEmpty;
end;

function TfraPrestador.GetIva: String;
begin
  Result := sdqPrestador.FieldByName('CA_IVA').AsString;
end;

function TfraPrestador.GetLocalidad: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('CA_LOCALIDAD').AsString
  else
    Result := '';
end;

function TfraPrestador.GetNombreFantasia: String;
begin
  Result := sdqPrestador.FieldByName('CA_NOMBREFANTA').AsString;
end;

function TfraPrestador.GetProvincia: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('PROVINCIA').AsString
  else
    Result := '';
end;

function TfraPrestador.GetRazonSocial: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('CA_DESCRIPCION').AsString
  else
    Result := '';
end;

function TfraPrestador.GetSecuencia: Integer;
begin
  Result := edPrestSecuencia.Value;
end;

function TfraPrestador.GetSql: String;
begin
  if FSql = '' then
  begin
    Result := {Si se modifica este query, revisar otras pantallas como unConsTlgCartas}
      'SELECT ca_clave, ca_secuencia, ca_identificador, ca_descripcion, ca_asistencial, ca_domicilio, ca_localidad, ' +
            ' ca_codpostal, pv_descripcion as provincia, ca_telefono, ca_fechabaja, ca_concertado, ca_iva, ' +
            ' ca_tipocomprobante, ca_direlectronica, ca_nombrefanta, ca_fechaconexia, ca_habilitaciones ' +
       ' FROM cpr_prestador ' +
      ' WHERE 1 = 1 ' +
              FExtraCondition;
      { Para compatibilidad con la base del cem, que esta en Access }
    SqlAddJoin(Result, 'CPV_PROVINCIAS', 'CPR_PRESTADOR.CA_PROVINCIA', 'CPV_PROVINCIAS.PV_CODIGO', jtOuter);
  end
  else
    Result := FSql;
end;

function TfraPrestador.GetTelefono: String;
begin
  if IsSelected then
    Result := sdqPrestador.FieldByName('CA_TELEFONO').AsString
  else
    Result := '';
end;

function TfraPrestador.GetTipoComprobante: String;
begin
  Result := sdqPrestador.FieldByName('CA_TIPOCOMPROBANTE').AsString;
end;

function TfraPrestador.GetValue: TTableID;
begin
  Result := GetValue2;
end;

function TfraPrestador.GetValue2: TPrestador;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqPrestador.Active then
    Result := sdqPrestador.FieldByName('CA_IDENTIFICADOR').AsInteger
  else
    Result := 0;
end;


procedure TfraPrestador.CambiarColor(const aColor: TColor);
begin
  mskPrestCUIT.Color     := aColor;
  edPrestSecuencia.Color := aColor;
  edPrestIdentif.Color   := aColor;
  cmbPrestador.Color     := aColor;
end;

procedure TfraPrestador.Clear;
begin
  Limpiar;
end;

procedure TfraPrestador.CuitFocus;
begin
  if mskPrestCUIT.CanFocus then
    mskPrestCUIT.SetFocus;
end;

procedure TfraPrestador.IDPrestadorFocus;
begin
  if edPrestIdentif.CanFocus then
    edPrestIdentif.SetFocus;
end;

procedure TfraPrestador.Limpiar;
begin
  mskPrestCUIT.Clear;
  edPrestSecuencia.Clear;
  edPrestIdentif.Clear;
  cmbPrestador.Clear;
  edPresDomicilio.Clear;
  edPresLocalidad.Clear;
  edPresCPostal.Clear;
  edPresTelefono.Clear;
  cmbPrestFantasia.Clear;
  sdqPrestador.Close;
  SetColors(clWindowText);
  SetModified(False);
end;

procedure TfraPrestador.LoadValues;
begin
  with sdqPrestador do
  begin
    mskPrestCUIT.Text     := FieldByName('CA_CLAVE').AsString;
    edPrestSecuencia.Text := FieldByName('CA_SECUENCIA').AsString;
    edPrestIdentif.Text   := FieldByName('CA_IDENTIFICADOR').AsString;
    cmbPrestador.Text     := FieldByName('CA_DESCRIPCION').AsString;
    edPresDomicilio.Text  := FieldByName('CA_DOMICILIO').AsString;
    edPresLocalidad.Text  := FieldByName('CA_LOCALIDAD').AsString;
    edPresCPostal.Text    := FieldByName('CA_CODPOSTAL').AsString;
    edPresTelefono.Text   := FieldByName('CA_TELEFONO').AsString;
    cmbPrestFantasia.Text := FieldByName('CA_NOMBREFANTA').AsString;
  end;
end;

procedure TfraPrestador.SetCodigoPostal(const Value: String);
begin
  edPresCPostal.Text := Value;
end;

procedure TfraPrestador.SetCuit(const Value: String);
var
  Key: Char;
begin
  Key := #13;
  mskPrestCUIT.Text := Value;
  mskPrestCUITKeyPress(nil, Key);
end;

procedure TfraPrestador.SetDomicilio(const Value: String);
begin
  edPresDomicilio.Text := Value;
end;

procedure TfraPrestador.SetIDPrestador(const Value: Integer);
begin
  edPrestIdentif.Value := Value;
end;

procedure TfraPrestador.SetLocalidad(const Value: String);
begin
  edPresLocalidad.Text := Value;
end;

procedure TfraPrestador.SetLocked(const Value: Boolean);
begin
  if (FLocked <> Value) then
  begin
    FLocked := Value;
    VCLExtra.LockControls([mskPrestCUIT, edPrestSecuencia, edPrestIdentif, cmbPrestador, cmbPrestFantasia], FLocked);
  end;
end;

procedure TfraPrestador.SetNombreFanta(const Value: Boolean);
begin
  if (FShowNombreFanta <> Value) then
  begin
    FShowNombreFanta := Value;
    cmbPrestFantasia.Visible := Value;
    edPresDomicilio.Visible  := not Value;
    if Value then
    begin
      lbDomicilio.Caption     := 'N.Fantasía';
      lbLocalidad.Anchors     := [akTop, akRight];
      edPresLocalidad.Anchors := [akTop, akRight];
      cmbPrestFantasia.Width  := lbLocalidad.Left - cmbPrestFantasia.Left - 4; 
      cmbPrestFantasia.BringToFront;
    end
    else
    begin
      lbDomicilio.Caption     := 'Domicilio';
      lbLocalidad.Anchors     := [akTop, akLeft];
      edPresLocalidad.Anchors := [akTop, akRight, akLeft];
      cmbPrestFantasia.SendToBack;      
    end;
  end;
end;

procedure TfraPrestador.SetRazonSocial(const Value: String);
begin
  cmbPrestador.Text := Value;
end;

procedure TfraPrestador.SetSecuencia(const Value: Integer);
begin
  edPrestSecuencia.Value := Value;
end;

procedure TfraPrestador.SetValue(const Value: TPrestador);
begin
  Cargar(Value);
end;

procedure TfraPrestador.Validate;
begin
  if not sdqPrestador.FieldByName('CA_FECHABAJA').IsNull then
  begin
    MessageDlg('El prestador ha sido dado de baja el ' + DateToStr(sdqPrestador.FieldByName('CA_FECHABAJA').AsDateTime),
                mtError, [mbOK], 0);
    if not ShowBajas then
    begin
      SetColors(clWindowText);
      Limpiar;
    end;
  end;
end;


procedure TfraPrestador.mskPrestCUITKeyPress(Sender: TObject; var Key: Char);
var
  sSql: String;
begin
  if Key = #13 then
  begin
    sSql := GetSql + BajaSql + InvisiblesSql + ' AND CA_CLAVE = ''' + mskPrestCUIT.Text + '''';
    if not (sdqPrestador.Sql.Text = sSql) then
    begin
      sdqPrestador.Close;
      sdqPrestador.Sql.Text := sSql;
      OpenQuery(sdqPrestador);
    end;
    ShowList;
  end;
end;

procedure TfraPrestador.cmbPrestadorDropDown(Sender: TObject);
var
  sSql: String;
begin
  sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_DESCRIPCION LIKE ''' + cmbPrestador.Text + SQL_WILLCARD + '''';
  OpenQuery(sdqPrestador, sSql, True);
end;

procedure TfraPrestador.edPrestSecuenciaKeyPress(Sender: TObject; var Key: Char);
var
  sSql: String;
begin
  if Key = #13 then
  begin
    sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_SECUENCIA =  ''' + edPrestSecuencia.Text + '''';
    OpenQuery(sdqPrestador, sSql, True);
    ShowList;
  end;
end;

procedure TfraPrestador.edPrestIdentifKeyPress(Sender: TObject; var Key: Char);
var
  sSql: String;
begin
  if Key = #13 then
  begin
    sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_IDENTIFICADOR =  ' + SqlValue(edPrestIdentif.Value);
    OpenQuery(sdqPrestador, sSql, True);
    ShowList;
  end;
end;

{--[ Se cargan los valores para todos los Controles ]------------------------------------------------------------------}
procedure TfraPrestador.cmbPrestadorCloseUp(Sender: TObject);
begin
  LoadValues;
// Cambia el Color cuando está dado de baja
  if not(sdqPrestador.FieldByName('CA_FECHABAJA').IsNull) then
    SetColors(clRed)
  else if not(sdqPrestador.FieldByName('CA_FECHACONEXIA').IsNull) then //si es de conexia se muestra en verde
    SetColors(clGreen)
  else
    SetColors(clWindowText);

  Validate;
  if Assigned(Sender) then
  begin
    cmbPrestador.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;

  if Assigned(FOnChange) then
    OnChange(Self);
end;

procedure TfraPrestador.ShowList;
begin
  case sdqPrestador.RecordCount of
    0:  InfoHint(edPrestIdentif, 'No se encontró el prestador.');
    1:  cmbPrestadorCloseUp(Self);
  else
    cmbPrestador.DoDropDown(False);
  end;
end;

function TfraPrestador.GetModified: Boolean;
begin
  Result := mskPrestCUIT.Modified or
            edPrestSecuencia.Modified or
            edPrestIdentif.Modified or
            cmbPrestador.Modified or
            cmbPrestFantasia.Modified;
end;

procedure TfraPrestador.SetModified(const Value: Boolean);
begin
  mskPrestCUIT.Modified     := Value;
  edPrestSecuencia.Modified := Value;
  edPrestIdentif.Modified   := Value;
  cmbPrestador.Modified     := Value;
  cmbPrestFantasia.Modified := Value;
end;

procedure TfraPrestador.FrameExit(Sender: TObject);
begin
  if (mskPrestCUIT.Text = '') and (edPrestSecuencia.Text = '') and (edPrestIdentif.Text = '') then
  begin
    cmbPrestador.Text     := '';
    cmbPrestFantasia.Text := '';
  end
  else
    if (edPrestIdentif.Text <> '') and (edPrestIdentif.Value <> sdqPrestador.FieldByName('CA_IDENTIFICADOR').AsInteger) then
      Cargar(edPrestIdentif.Value, not ShowBajas)
    else
      LoadValues
end;

function TfraPrestador.BajaSql: String;
begin
  if ShowBajas then
    Result := ''
  else
    Result := ' AND CA_FECHABAJA IS NULL ';
end;

function TfraPrestador.InvisiblesSql: String;
begin
  if ShowInvisibles then
    Result := ''
  else
    Result := ' AND CA_VISIBLE = ''S'' ';
end;

constructor TfraPrestador.Create(AOwner: TComponent);
begin
  inherited;

  ShowBajas       := False;
  ShowInvisibles  := True;
  ShowNombreFanta := False;

  cmbPrestador     := TArtComboBox(Self.FindComponent('cmbPrestador'));
  cmbPrestFantasia := TArtComboBox(Self.FindComponent('cmbPrestFantasia'));
  dsPrestador      := TDataSource(Self.FindComponent('dsPrestador'));
  edPresCPostal    := TEdit(Self.FindComponent('edPresCPostal'));
  edPresDomicilio  := TEdit(Self.FindComponent('edPresDomicilio'));
  edPresLocalidad  := TEdit(Self.FindComponent('edPresLocalidad'));
  edPresTelefono   := TEdit(Self.FindComponent('edPresTelefono'));
  edPrestIdentif   := TIntEdit(Self.FindComponent('edPrestIdentif'));
  edPrestSecuencia := TIntEdit(Self.FindComponent('edPrestSecuencia'));
  mskPrestCUIT     := TMaskEdit(Self.FindComponent('mskPrestCUIT'));
  sdqPrestador     := TSDQuery(Self.FindComponent('sdqPrestador'));
end;

procedure TfraPrestador.SetColors(AColor: TColor);
begin
  mskPrestCUIT.Font.Color     := AColor;
  edPrestSecuencia.Font.Color := AColor;
  edPrestIdentif.Font.Color   := AColor;
  cmbPrestador.Font.Color     := AColor;
  edPresDomicilio.Font.Color  := AColor;
  edPresLocalidad.Font.Color  := AColor;
  edPresCPostal.Font.Color    := AColor;
  edPresTelefono.Font.Color   := AColor;
  cmbPrestFantasia.Font.Color := AColor;
end;

procedure TfraPrestador.cmbPrestadorGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                  Highlight: Boolean);
begin
  if (not sdqPrestador.FieldByName('CA_FECHABAJA').IsNull) then
    AFont.Color := clRed
  else if (not sdqPrestador.FieldByName('CA_FECHACONEXIA').IsNull) then
    AFont.Color := clGreen;
end;

procedure TfraPrestador.SetBackColors(AColor: TColor; ADisableColor: TColor = clSilver);
begin
  mskPrestCUIT.Color     := AColor;
  edPrestSecuencia.Color := AColor;
  edPrestIdentif.Color   := AColor;
  cmbPrestador.Color     := AColor;
  cmbPrestFantasia.Color := AColor;

  edPresDomicilio.Color  := ADisableColor;
  edPresLocalidad.Color  := ADisableColor;
  edPresCPostal.Color    := ADisableColor;
  edPresTelefono.Color   := ADisableColor;
end;

function TfraPrestador.GetReadOnly: Boolean;
begin
  Result := mskPrestCUIT.ReadOnly and
            edPrestSecuencia.ReadOnly and
            edPrestIdentif.ReadOnly and
            cmbPrestador.ReadOnly and
            cmbPrestFantasia.ReadOnly;
end;

procedure TfraPrestador.SetReadOnly(const Value: Boolean);
begin
  mskPrestCUIT.ReadOnly     := Value;
  edPrestSecuencia.ReadOnly := Value;
  edPrestIdentif.ReadOnly   := Value;
  cmbPrestador.ReadOnly     := Value;
  cmbPrestFantasia.ReadOnly := Value;
end;

procedure TfraPrestador.cmbPrestFantasiaCloseUp(Sender: TObject);
begin
  LoadValues;
// Cambia el Color cuando está dado de baja
  if not(sdqPrestador.FieldByName('CA_FECHABAJA').IsNull) then
    SetColors(clRed)
  else if not(sdqPrestador.FieldByName('CA_FECHACONEXIA').IsNull) then //si es de conexia se muestra en verde
    SetColors(clGreen)
  else
    SetColors(clWindowText);

  Validate;

  if Assigned(Sender) then
  begin
    cmbPrestFantasia.SetFocus;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;

  if Assigned(FOnChange) then
    OnChange(Self);
end;

procedure TfraPrestador.cmbPrestFantasiaDropDown(Sender: TObject);
var
  sSql: String;
begin
  sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_NOMBREFANTA LIKE ''' + cmbPrestFantasia.Text + SQL_WILLCARD + '''';
  OpenQuery(sdqPrestador, sSql, True);
end;

procedure TfraPrestador.cmbPrestFantasiaGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                      var Background: TColor; Highlight: Boolean);
begin
  if (not sdqPrestador.FieldByName('CA_FECHABAJA').IsNull) then
    AFont.Color := clRed
  else if (not sdqPrestador.FieldByName('CA_FECHACONEXIA').IsNull) then
    AFont.Color := clGreen;
end;

procedure TfraPrestador.AfterConstruction;
begin
  inherited;
  cmbPrestador.DataSource     := dsPrestador;
  cmbPrestFantasia.DataSource := dsPrestador;
end;

function TfraPrestador.GetInfoUtil: String;
begin
  if IsSelected and Assigned(sdqPrestador.FindField('CA_HABILITACIONES')) then
    Result := sdqPrestador.FieldByName('CA_HABILITACIONES').AsString
  else
    Result := '';
end;

initialization
  RegisterClasses([TArtComboBox, TDataSource, TDateTimeField, TEdit, TFloatField, TIntEdit, TMaskEdit, TSDQuery,
                   TStringField]);

end.
