unit unfraCPR_PRESTADOR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ArtComboBox, StdCtrls, Mask, Db, SDEngine, IntEdit, PatternEdit, unArt,
  unArtFrame, unArtDbFrame, RxToolEdit;

type
  TfraCPR_PRESTADOR = class(TArtDbFrame)
    cmbCA_DESCRIPCION: TArtComboBox;
    edCA_CODPOSTAL: TEdit;
    edCA_DOMICILIO: TEdit;
    edCA_IDENTIFICADOR: TIntEdit;
    edCA_LOCALIDAD: TEdit;
    edCA_SECUENCIA: TIntEdit;
    lbCPostal: TLabel;
    lbCUIT: TLabel;
    lbDomicilio: TLabel;
    lbIdentif: TLabel;
    lbLocalidad: TLabel;
    lbRSocial: TLabel;
    lbSec: TLabel;
    mskCA_CLAVE: TMaskEdit;
    procedure cmbCA_DESCRIPCIONCloseUp(Sender: TObject);
    procedure cmbCA_DESCRIPCIONDropDown(Sender: TObject);
    procedure cmbCA_DESCRIPCIONGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edCA_IDENTIFICADORKeyPress(Sender: TObject; var Key: Char);
    procedure edCA_SECUENCIAKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
    procedure mskCA_CLAVEKeyPress(Sender: TObject; var Key: Char);
  private
    FInvisibles: boolean;
    function GetCUIT: string;
    function GetIdentificador: integer;
    function GetRazonSocial: string;
  protected
    function  GetSql: string; override;
    function  GetSqlOrderBy: string; override;
    function  GetSqlWhere: string; override;
    function  GetValue: TTableID; override;
    procedure Internal_SetCuit(ACuit: string; DoChanges : Boolean = False);
    procedure Internal_SetIdentificador(AIdentificador: Integer; DoChanges : Boolean = False); virtual;
    procedure Internal_SetSecuencia(ASecuencia: Integer; DoChanges : Boolean = False);
    function  IsBaja: Boolean; override;
    procedure LoadValues( DoChanges : boolean = False); override;
    procedure SetEditorsValues; virtual;
    procedure SetLocked(const Value: Boolean); override;
    procedure SetValue(const Value: TTableID); override;
    procedure ShowList;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AfterConstruction; override;
    procedure   Clear; override;
  published
    property CUIT: string read GetCUIT;
    property Identificador: integer read GetIdentificador;
    property IdPrestador: integer read GetIdentificador;
    property RazonSocial: string read GetRazonSocial;    
    property ShowInvisibles: boolean read FInvisibles write FInvisibles;
    property Value;
  end;

implementation

uses
  unDmPrincipal, General, AnsiSql, SqlFuncs, CustomDlgs, VCLExtra;

{$R *.DFM}

{--[ Se cargan los valores para todos los Controles ]------------------------------------------------------------------}
procedure TfraCPR_PRESTADOR.cmbCA_DESCRIPCIONCloseUp(Sender: TObject);
begin
  if cmbCA_DESCRIPCION.Text = '' Then
    Clear
  else
    LoadValues( True );
end;

procedure TfraCPR_PRESTADOR.cmbCA_DESCRIPCIONDropDown(Sender: TObject);
var
  sSql: String;
begin
  sSql := GetSql +
//          ' AND CA_DESCRIPCION LIKE ' + SQL_QUOTE + cmbCA_DESCRIPCION.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
          GetSqlWhere + GetSqlOrderBy;

  AddCondition_UNION(sSql, ' CA_DESCRIPCION LIKE ' + SQL_QUOTE + cmbCA_DESCRIPCION.Text + SQL_WILLCARD + SQL_QUOTE);
  OpenQuery(sdqDatos, sSql, True);

  if mskCA_CLAVE.Text <> '' Then
    sdqDatos.Locate('CA_CLAVE', mskCA_CLAVE.Text, [])

  else if edCA_SECUENCIA.Value > 0 Then
    sdqDatos.Locate('CA_SECUENCIA', edCA_SECUENCIA.Value, []);
end;

procedure TfraCPR_PRESTADOR.cmbCA_DESCRIPCIONGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja Then
    AFont.Color := clRed
  else if not(sdqDatos.FieldByName('CA_FECHACONEXIA').IsNull) then
    AFont.Color := clGreen;
end;

procedure TfraCPR_PRESTADOR.edCA_IDENTIFICADORKeyPress(Sender: TObject; var Key: Char);
begin
  if (not edCA_IDENTIFICADOR.ReadOnly) and (Key = #13) then
    Internal_SetIdentificador(edCA_IDENTIFICADOR.Value, True);
end;

procedure TfraCPR_PRESTADOR.edCA_SECUENCIAKeyPress(Sender: TObject;  var Key: Char);
begin
  if (not edCA_SECUENCIA.ReadOnly) and (Key = #13) then
    Internal_SetSecuencia(edCA_SECUENCIA.Value, True);
end;

procedure TfraCPR_PRESTADOR.FrameExit(Sender: TObject);
begin
  if not ReadOnly Then
  begin
    if (edCA_IDENTIFICADOR.Text = '') Then
      Clear

    else if (edCA_IDENTIFICADOR.Text <> '') and ((not sdqDatos.Active) or (edCA_IDENTIFICADOR.Text <> sdqDatos.FieldByName('CA_IDENTIFICADOR').AsString)) Then
      Internal_SetIdentificador( edCA_IDENTIFICADOR.Value, True )

    else
      LoadValues( False );
  end;
end;

procedure TfraCPR_PRESTADOR.mskCA_CLAVEKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    Internal_SetCuit(mskCA_CLAVE.Text, True);
end;

function TfraCPR_PRESTADOR.GetCUIT: string;
begin
  if sdqDatos.Active then
    Result := mskCA_CLAVE.Text
  else
    Result := EmptyStr;
end;

function TfraCPR_PRESTADOR.GetIdentificador: integer;
begin
  if sdqDatos.Active then
    Result := edCA_IDENTIFICADOR.Value
  else
    Result := ART_EMPTY_ID;
end;

function TfraCPR_PRESTADOR.GetRazonSocial: string;
begin
  Result := cmbCA_DESCRIPCION.Text;
end;

function TfraCPR_PRESTADOR.GetSql: String;
begin
  if FSql = '' then
  begin
    Result := 'SELECT CA_CLAVE, CA_SECUENCIA, CA_IDENTIFICADOR, ' +
                     'CA_DESCRIPCION, CA_ASISTENCIAL, CA_DOMICILIO, CA_LOCALIDAD, ' +
                     'CA_CODPOSTAL, PV_DESCRIPCION AS PROVINCIA, ca_codarea || '' '' || ca_telefono ca_telefono, CA_FECHABAJA, ' +
                     'CA_CONCERTADO, CA_IVA, CA_TIPOCOMPROBANTE, CA_FECHACONEXIA ' +
                'FROM CPR_PRESTADOR WHERE 1=1 ';

    { Para compatibilidad con la base del cem, que esta en Access }
    SqlAddJoin( Result, 'CPV_PROVINCIAS', 'CPR_PRESTADOR.CA_PROVINCIA', 'PV_CODIGO', jtOuter );
  end else
    Result := FSql;
end;

function TfraCPR_PRESTADOR.GetSqlOrderBy: string;
begin
  Result := ' ORDER BY CA_DESCRIPCION, CA_CLAVE, CA_SECUENCIA';
end;

function TfraCPR_PRESTADOR.GetSqlWhere: string;
begin
  if ShowBajas then
    Result := ''
  else
    Result := ' AND CA_FECHABAJA IS NULL ';

  if ShowInvisibles then
    Result := Result + ' '
  else
    Result := Result + ' AND CA_VISIBLE = ''S'' ';
end;

function TfraCPR_PRESTADOR.GetValue: TTableID;
begin
  FrameExit( nil ); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName('CA_IDENTIFICADOR').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraCPR_PRESTADOR.Internal_SetCuit(ACuit: string; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere {+ ' AND CA_CLAVE = ' + SqlValue(ACuit)} + GetSqlOrderBy;

  AddCondition_UNION(sSql, ' CA_CLAVE = ' + SqlValue(ACuit));
  if OpenQuery(sdqDatos, sSql, True) Then
    ShowList;
end;

procedure TfraCPR_PRESTADOR.Internal_SetIdentificador(AIdentificador: Integer; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere;
  AddCondition_UNION(sSql, ' CA_IDENTIFICADOR = ' + SqlValue(AIdentificador));

  if OpenQuery(sdqDatos, sSql, True) Then
    LoadValues( DoChanges ); { No hace un ShowList porque se supone que no hay mas de un registro con el mismo Identificador};
end;

procedure TfraCPR_PRESTADOR.Internal_SetSecuencia(ASecuencia: Integer; DoChanges: Boolean);
var
  sSql: string;
begin
  sSql := GetSql + GetSqlWhere {+ ' AND CA_SECUENCIA = ' + SqlValue(ASecuencia)} + GetSqlOrderBy;

  AddCondition_UNION(sSql, ' CA_SECUENCIA = ' + SqlValue(ASecuencia));
  if OpenQuery(sdqDatos, sSql, True) Then
    ShowList;
end;

function TfraCPR_PRESTADOR.IsBaja: Boolean;
begin
  Result := not sdqDatos.FieldByName('CA_FECHABAJA').IsNull;
end;

procedure TfraCPR_PRESTADOR.LoadValues(DoChanges: boolean);
begin
  SetEditorsValues;
  if IsBaja then
  begin
    Font.Color := clRed;
    if not Locked and DoChanges then
      InfoHint(cmbCA_DESCRIPCION, 'Tenga en cuenta que el prestador está dado de baja.', False, 'Información', blnInfo, 1, False);
  end
  else if not(sdqDatos.FieldByName('CA_FECHACONEXIA').IsNull) then
    Font.Color := clGreen
  else
    Font.Color := clWindowText;

  if DoChanges then
  begin
    Change;

    if (mskCA_CLAVE.Text > '') then {Se cargaron los datos}
      DoLostFocus;
  end;
end;

procedure TfraCPR_PRESTADOR.SetEditorsValues;
begin
  mskCA_CLAVE.Text := sdqDatos.FieldByName('CA_CLAVE').AsString ;
  edCA_SECUENCIA.Text := sdqDatos.FieldByName('CA_SECUENCIA').AsString ;
  edCA_IDENTIFICADOR.Text := sdqDatos.FieldByName('CA_IDENTIFICADOR').AsString ;
  cmbCA_DESCRIPCION.Text := sdqDatos.FieldByName('CA_DESCRIPCION').AsString ;
  edCA_DOMICILIO.Text := sdqDatos.FieldByName('CA_DOMICILIO').AsString ;
  edCA_LOCALIDAD.Text := sdqDatos.FieldByName('CA_LOCALIDAD').AsString ;
  edCA_CODPOSTAL.Text := sdqDatos.FieldByName('CA_CODPOSTAL').AsString ;
end;

procedure TfraCPR_PRESTADOR.SetLocked(const Value: Boolean);
begin
  inherited;
  VCLExtra.LockControls([edCA_DOMICILIO, edCA_LOCALIDAD, edCA_CODPOSTAL]);
end;

procedure TfraCPR_PRESTADOR.SetValue(const Value: TTableID);
begin
  Internal_SetIdentificador(Value, False);
end;

procedure TfraCPR_PRESTADOR.ShowList;
begin
  case sdqDatos.RecordCount of
    0: InfoHint(edCA_IDENTIFICADOR, 'No se encontró el prestador.');
    1: LoadValues(True);
  else
    cmbCA_DESCRIPCION.DoDropDown( False );
  end;
end;

constructor TfraCPR_PRESTADOR.Create(AOwner: TComponent);
begin
  inherited;
  FShowBajas := False;
  ShowInvisibles := True;
  VCLExtra.LockControls([edCA_DOMICILIO, edCA_LOCALIDAD, edCA_CODPOSTAL]);
end;

procedure TfraCPR_PRESTADOR.AfterConstruction;
begin
  inherited;
  cmbCA_DESCRIPCION.DataSource := dsDatos;
end;

procedure TfraCPR_PRESTADOR.Clear;
begin
  inherited;

  mskCA_CLAVE.Clear;
  edCA_SECUENCIA.Clear;
  edCA_IDENTIFICADOR.Clear;
  cmbCA_DESCRIPCION.Clear;
  edCA_DOMICILIO.Clear;
  edCA_LOCALIDAD.Clear;
  edCA_CODPOSTAL.Clear;
end;

end.
