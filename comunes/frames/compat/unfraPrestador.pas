unit unfraPrestador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, ArtComboBox, StdCtrls, Mask, Db, SDEngine, IntEdit, PatternEdit,
  unArtFrame, unArtDbFrame;

type
  TPrestador = Integer;
  TfraPrestador = class(TFrame)
    sdqPrestador: TSDQuery;
    dsPrestador: TDataSource;
    lbCUIT: TLabel;
    mskPrestCUIT: TMaskEdit;
    lbSec: TLabel;
    lbIdentif: TLabel;
    lbRSocial: TLabel;
    cmbPrestador: TArtComboBox;
    lbDomicilio: TLabel;
    edPresDomicilio: TEdit;
    lbLocalidad: TLabel;
    edPresLocalidad: TEdit;
    lbCPostal: TLabel;
    edPresCPostal: TEdit;
    edPrestIdentif: TIntEdit;
    edPrestSecuencia: TIntEdit;
    sdqPrestadorCA_CLAVE: TStringField;
    sdqPrestadorCA_SECUENCIA: TFloatField;
    sdqPrestadorCA_IDENTIFICADOR: TFloatField;
    sdqPrestadorCA_DESCRIPCION: TStringField;
    sdqPrestadorCA_DOMICILIO: TStringField;
    sdqPrestadorCA_LOCALIDAD: TStringField;
    sdqPrestadorCA_CODPOSTAL: TStringField;
    sdqPrestadorPROVINCIA: TStringField;
    sdqPrestadorCA_TELEFONO: TStringField;
    sdqPrestadorCA_FECHABAJA: TDateTimeField;
    sdqPrestadorCA_ASISTENCIAL: TFloatField;
    sdqPrestadorCA_CONCERTADO: TStringField;
    sdqPrestadorCA_IVA: TStringField;
    sdqPrestadorCA_TIPOCOMPROBANTE: TStringField;
    sdqPrestadorCA_DIRELECTRONICA: TStringField;
    edPresTelefono: TEdit;
    lbTelefono: TLabel;
    procedure mskPrestCUITKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPrestadorDropDown(Sender: TObject);
    procedure edPrestSecuenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edPrestIdentifKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPrestadorCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure cmbPrestadorGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FOnChange: TNotifyEvent;
    FSql: String;
    FExtraCondition: string;
    FLocked: Boolean;
    FInvisibles: boolean;
    procedure ShowList;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function BajaSql : String;
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    procedure Validate;
    function GetValue: TPrestador;
    procedure SetValue(const Value: TPrestador);
    function GetSql: String;
    function GetIsEmpty: boolean;
    function GetIsSelected: boolean;
    procedure SetLocked(const Value: Boolean);
    procedure SetCuit(const Value: string);
    function GetCuit: string;
    function GetIDPrestador: integer;
    function InvisiblesSql: String;
    function GetCorreoElectronico: string;
    function GetRazonSocial: string;
    function GetDomicilio: string;
    function GetCodigoPostal: string;
    function GetLocalidad: string;
    function GetProvincia: string;
    function GetTelefono: string;
  public
    ShowBajas : Boolean;
    procedure LoadValues;
    procedure Limpiar;
    procedure Clear; { Para compatibilidad con versiones nueva }
    Function Cargar(Identificador : Integer; NoBajas : Boolean = False) : Boolean;
    Procedure SetColors( AColor : TColor);
    Procedure SetBackColors(AColor : TColor; ADisableColor : TColor = clSilver);
    constructor Create(AOwner: TComponent); override;

    property IsSelected    : boolean      read GetIsSelected;
    property IsEmpty       : boolean      read GetIsEmpty;
  published
    property Modified      : boolean      read GetModified     write SetModified;
    property ReadOnly      : boolean      read GetReadOnly     write SetReadOnly;
    property OnChange      : TNotifyEvent read FOnChange       write FOnChange;
    property Value         : TPrestador   read GetValue        write SetValue;
    property Sql           : string       read GetSql          write FSql;
    property ExtraCondition: string       read FExtraCondition write FExtraCondition;
    property Locked        : Boolean      read FLocked         write SetLocked;
    property Cuit          : string       read GetCuit         write SetCuit;
    property IDPrestador   : integer      read GetIDPrestador;
    property RazonSocial   : string       read GetRazonSocial;
    property Domicilio     : string       read GetDomicilio;
    property CodigoPostal  : string       read GetCodigoPostal;
    property Localidad     : string       read GetLocalidad;
    property Provincia     : string       read GetProvincia;
    property Telefono      : string       read GetTelefono;
    property ShowInvisibles: boolean read FInvisibles write FInvisibles;
    property CorreoElectronico: string read GetCorreoElectronico;    
  end;

implementation

uses
  unDmPrincipal, General, AnsiSql, SqlFuncs, VclExtra, CustomDlgs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.mskPrestCUITKeyPress(Sender: TObject;  var Key: Char);
Var sSql : String;
begin
    if key = #13 Then begin
        sSql := GetSql + BajaSql + InvisiblesSql + ' AND CA_CLAVE = ''' + mskPrestCUIT.Text + '''';

       if Not (sdqPrestador.Sql.Text = sSql) Then begin
            sdqPrestador.Close ;
            sdqPrestador.Sql.Text := sSql;
            OpenQuery(sdqPrestador);
       end;
       ShowList;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.cmbPrestadorDropDown(Sender: TObject);
var
  sSql : String;
begin
  sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_DESCRIPCION LIKE ''' + cmbPrestador.Text + SQL_WILLCARD + '''';
  OpenQuery(sdqPrestador, sSql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.edPrestSecuenciaKeyPress(Sender: TObject;  var Key: Char);
var sSql : String;
begin
  if Key = #13 Then
  begin
    sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_SECUENCIA =  ''' + edPrestSecuencia.Text + '''';
    OpenQuery(sdqPrestador, sSql, True);
    ShowList;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.edPrestIdentifKeyPress(Sender: TObject;  var Key: Char);
var
  sSql : String;
begin
  if Key = #13 Then
  begin
    sSql := GetSql + BajaSql + InvisiblesSql + 'AND CA_IDENTIFICADOR =  ' + SqlValue(edPrestIdentif.Value) ;
    OpenQuery(sdqPrestador, sSql, True);
    ShowList;
  end;
end;
{--[ Se cargan los valores para todos los Controles ]------------------------------------------------------------------}
procedure TfraPrestador.cmbPrestadorCloseUp(Sender: TObject);
begin
   LoadValues;
// Cambia el Color cuando está dado de baja
   if sdqPrestadorCA_FECHABAJA.IsNull Then
      SetColors(clWindowText)
   else
      SetColors(clRed);

   Validate;

   if Assigned(Sender) Then
   begin
      cmbPrestador.SetFocus ;
      SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);

      if Assigned(FOnChange) Then
         OnChange( Self );
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.Limpiar;
begin
  mskPrestCUIT.Text     := '';
  edPrestSecuencia.Text := '';
  edPrestIdentif.Text   := '';
  cmbPrestador.Text     := '';
  edPresDomicilio.Text  := '';
  edPresLocalidad.Text  := '';
  edPresCPostal.Text    := '';
  edPresTelefono.Text   := '';
  sdqPrestador.Close ;
  SetColors( clWindowText );
  SetModified( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.Cargar(Identificador: Integer; NoBajas : Boolean = False): Boolean;
begin
    sdqPrestador.Close ;
    sdqPrestador.Sql.Text := GetSql + IIF(NoBajas, BajaSql, '') + InvisiblesSql + 'AND CA_IDENTIFICADOR = ' + SqlInt(Identificador);
    OpenQuery(sdqPrestador);
    if sdqPrestador.Eof Then begin
       Limpiar;
       Result := False;
    end else begin
       cmbPrestadorCloseUp(Nil);
       Result := True;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.ShowList;
begin
     case sdqPrestador.RecordCount of
       0: InfoHint(edPrestIdentif, 'No se encontró el prestador.');
       1: begin
          cmbPrestadorCloseUp( Self );
          //DoLostFocus;
       end;
     else
        cmbPrestador.DoDropDown( False );
     end;

//     Validate;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetModified: Boolean;
begin
  Result := mskPrestCUIT.Modified     or
            edPrestSecuencia.Modified or
            edPrestIdentif.Modified   or
            cmbPrestador.Modified ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.SetModified(const Value: Boolean);
begin
  mskPrestCUIT.Modified     := Value;
  edPrestSecuencia.Modified := Value;
  edPrestIdentif.Modified   := Value;
  cmbPrestador.Modified     := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.FrameExit(Sender: TObject);
begin
  if (mskPrestCUIT.Text = '') and (edPrestSecuencia.Text = '') and (edPrestIdentif.Text = '') Then
    cmbPrestador.Text := ''
  else begin
    if (edPrestIdentif.Text <> '') and (edPrestIdentif.Value <> sdqPrestadorCA_IDENTIFICADOR.AsInteger) Then
       Cargar(edPrestIdentif.Value, not ShowBajas)
    else begin
      LoadValues
    end;
  end;
{ if (edPrestIdentif.Text <> '') and (edPrestIdentif.Text <> sdqPrestadorCA_IDENTIFICADOR.AsString) Then begin
    Cargar( StrToInt(edPrestIdentif.Text), Not ShowBajas);
            //sdqPrestador.Close;
  end;}
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.BajaSql: String;
begin
  if ShowBajas Then
    Result := ''
  else
    Result := ' AND CA_FECHABAJA IS NULL ';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.InvisiblesSql: String;
begin
  if ShowInvisibles Then
    Result := ''
  else
    Result := ' AND CA_VISIBLE = ''S'' ';
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraPrestador.Create(AOwner: TComponent);
begin
  inherited;
  ShowBajas := False;
  ShowInvisibles := True;  
end;
{----------------------------------------------------------------------------------------------------------------------}
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
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.cmbPrestadorGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Not sdqPrestadorCA_FECHABAJA.IsNull) Then //and (Not Highlight)
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.SetBackColors(AColor: TColor; ADisableColor : TColor = clSilver);
begin
   mskPrestCUIT.Color     := AColor;
   edPrestSecuencia.Color := AColor;
   edPrestIdentif.Color   := AColor;
   cmbPrestador.Color     := AColor;

   edPresDomicilio.Color  := ADisableColor;
   edPresLocalidad.Color  := ADisableColor;
   edPresCPostal.Color    := ADisableColor;
   edPresTelefono.Color   := ADisableColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetReadOnly: Boolean;
begin
  Result := mskPrestCUIT.ReadOnly     and
            edPrestSecuencia.ReadOnly and
            edPrestIdentif.ReadOnly   and
            cmbPrestador.ReadOnly ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.SetReadOnly(const Value: Boolean);
begin
  mskPrestCUIT.ReadOnly     := Value;
  edPrestSecuencia.ReadOnly := Value;
  edPrestIdentif.ReadOnly   := Value;
  cmbPrestador.ReadOnly     := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.Validate;
begin
  if not sdqPrestadorCA_FECHABAJA.IsNull then begin
    MessageDlg('El prestador ha sido dado de baja el ' + DateToStr(sdqPrestadorCA_FECHABAJA.AsDateTime) , mtError, [mbOK], 0);
    if not ShowBajas then begin
      SetColors(clWindowText);
      Limpiar;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetValue: TPrestador;
begin
   FrameExit( Nil ); // Valida que todo este completo
   if sdqPrestador.Active Then
      Result := sdqPrestadorCA_IDENTIFICADOR.AsInteger
   else
      Result := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.SetValue(const Value: TPrestador);
begin
   Cargar( Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetSql: String;
begin
     if FSql = '' Then begin
{        Result := 'SELECT CA_CLAVE, CA_SECUENCIA, CA_IDENTIFICADOR, ' +
                         'CA_DESCRIPCION, CA_ASISTENCIAL, CA_DOMICILIO, CA_LOCALIDAD, ' +
                         'CA_CODPOSTAL, PV_DESCRIPCION PROVINCIA, CA_TELEFONO, CA_FECHABAJA, ' +
                         'CA_CONCERTADO, CA_IVA, CA_TIPOCOMPROBANTE ' +
                    'FROM CPR_PRESTADOR, CPV_PROVINCIAS ' +
                   'WHERE CA_PROVINCIA = PV_CODIGO (+) '}
        Result := 'SELECT CA_CLAVE, CA_SECUENCIA, CA_IDENTIFICADOR, ' +
                         'CA_DESCRIPCION, CA_ASISTENCIAL, CA_DOMICILIO, CA_LOCALIDAD, ' +
                         'CA_CODPOSTAL, PV_DESCRIPCION AS PROVINCIA, CA_TELEFONO, CA_FECHABAJA, ' +
                         'CA_CONCERTADO, CA_IVA, CA_TIPOCOMPROBANTE, CA_DIRELECTRONICA ' +
                    'FROM CPR_PRESTADOR WHERE 1=1 ' +
                    FExtraCondition;
        { Para compatibilidad con la base del cem, que esta en Access }
        SqlAddJoin( Result, 'CPV_PROVINCIAS', 'CPR_PRESTADOR.CA_PROVINCIA', 'CPV_PROVINCIAS.PV_CODIGO', jtOuter );
     end else
        Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.Clear;
begin
  Limpiar;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetIsEmpty: boolean;
begin
  Result := GetValue = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetIsSelected: boolean;
begin
  Result := not IsEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.LoadValues;
begin
  mskPrestCUIT.Text     := sdqPrestadorCA_CLAVE.AsString ;
  edPrestSecuencia.Text := sdqPrestadorCA_SECUENCIA.AsString ;
  edPrestIdentif.Text   := sdqPrestadorCA_IDENTIFICADOR.AsString ;
  cmbPrestador.Text     := sdqPrestadorCA_DESCRIPCION.AsString ;
  edPresDomicilio.Text  := sdqPrestadorCA_DOMICILIO.AsString ;
  edPresLocalidad.Text  := sdqPrestadorCA_LOCALIDAD.AsString ;
  edPresCPostal.Text    := sdqPrestadorCA_CODPOSTAL.AsString ;
  edPresTelefono.Text   := sdqPrestadorCA_TELEFONO.AsString ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.SetLocked(const Value: Boolean);
begin
  if (FLocked <> Value) Then
  begin
    FLocked := Value;
    LockControls([mskPrestCUIT, edPrestSecuencia, edPrestIdentif, cmbPrestador], FLocked);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraPrestador.SetCuit(const Value: string);
var
  Key: Char;
begin
  Key := #13;
  mskPrestCUIT.Text := Value;
  mskPrestCUITKeyPress( nil, Key );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetCuit: string;
begin
  Result := mskPrestCUIT.Text;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetIDPrestador: integer;
begin
  if IsSelected then
    Result := edPrestIdentif.Value
  else
    Result := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetCorreoElectronico: string;
begin
  if IsSelected then
    Result := sdqPrestadorCA_DIRELECTRONICA.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetRazonSocial: string;
begin
  if IsSelected then
    Result := sdqPrestadorCA_DESCRIPCION.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetDomicilio: string;
begin
  if IsSelected then
    Result := sdqPrestadorCA_DOMICILIO.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetCodigoPostal: string;
begin
  if IsSelected then
    Result := sdqPrestadorCA_CODPOSTAL.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetLocalidad: string;
begin
  if IsSelected then
    Result := sdqPrestadorCA_LOCALIDAD.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetProvincia: string;
begin
  if IsSelected then
    Result := sdqPrestadorPROVINCIA.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraPrestador.GetTelefono: string;
begin
  if IsSelected then
    Result := sdqPrestadorCA_TELEFONO.AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
