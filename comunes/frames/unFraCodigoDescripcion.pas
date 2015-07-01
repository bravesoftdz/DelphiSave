
{********************************************************}
{                                                        }
{    Frame "Código/Descripción"                          }
{    Frame utilizado tanto directamente como por         }
{    herencia visual, para la búsqueda de registros.     }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 01/2002                                      }
{                                                        }
{********************************************************}

unit unFraCodigoDescripcion;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  {$IFDEF VER150} Placemnt, ToolEdit, {$ELSE} rxPlacemnt, rxToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, PatternEdit, StdCtrls, Mask, ArtComboBox, Db,
  unArtDBAwareFrame, SDEngine{$IFDEF ART2}, unArt{$ENDIF};

type
  {$IFDEF ART2}
  TValueType = TTableId;
  {$ELSE}
  TValueType = String;
  {$ENDIF}

  TRecordPosition = (rpFirst, rpNext, rpPrior, rpLast);
  TConnectTo = (ctPART, ctFinancials); // by PTavasci
  TCodigoType = (ctString, ctInteger); //.. es para seguir definiendo tipos . O se podría utilizar SqlFuncs.TDataType
  TfraCodigoDescripcion = class(TArtDBAwareFrame)
    cmbDescripcion: TArtComboBox;
    dsDatos: TDataSource;
    edCodigo: TPatternEdit;
    sdqDatos: TSDQuery;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
  private
    FConnectTo: TConnectTo;
    FFindAllOnSameText: Boolean;
    FMinSearchLength: Integer;
    procedure CMChanged(var Message: TMessage); message CM_CHANGED;
    function GetCode: String;
    function GetDescipcion: String;
    function GetID: String;
    function GetVariant: Variant;
    procedure SetCode(const Value: String);
    procedure SetCodigoType(const Value: TCodigoType);
    procedure SetConnectTo(const Value: TConnectTo);
    procedure SetSql(const Value: String);
  protected
    FCaseSensitive: Boolean;
    FClearOnChange :Boolean;
    FCodigoType: TCodigoType;
    FExtraCondition: String;
    FExtraFields: String;
    FExtraTables: String;
    FFieldBaja: String;
    FFieldCodigo: String;
    FFieldDesc: String;
    FFieldID: String;
    FFullLikeComparison: Boolean;
    FGroupBy: String;
    FIdType: TCodigoType;
    FOrderBy: String;
    FShowBajas: Boolean;
    FSql: String;
    FTableName: String;
    FColorBaja: TColor;
    procedure Change; override;
    function GetAsString: String;
    function GetCaseSensitive: Boolean; virtual;
    function GetCodigoType: TCodigoType; virtual;
    function GetExtraCondition: String; virtual;
    function GetExtraFields: String; virtual;
    function GetExtraTables: String; virtual;
    function GetFieldBaja: String; virtual;
    function GetFieldCodigo: String; virtual;
    function GetFieldDesc: String; virtual;
    function GetFieldID: String; virtual;
    function GetGroupBy: String; virtual;
    function GetIsEmpty: boolean; virtual;
    function GetIsSelected: Boolean; virtual;
    function GetKeyValue: Variant; override; { Para que sea DBAware }
    function GetOrderBy: String; virtual;
    function GetShowBajas: Boolean; virtual;
    function GetSql: String; virtual;
    function GetSqlByType(FType : TCodigoType; const Value: String) : String;
    function GetSqlGroupBy: String; virtual;
    function GetSqlOrderBy: String; virtual;
    function GetSqlWhere: String; virtual;
    function GetTableName: String; virtual;
    function GetValue: TValueType; virtual;
    procedure LoadValues(DoChanges: Boolean = False); virtual;
    procedure SelectRecord(RecordPosition: TRecordPosition ); virtual;
    procedure SetCodigo(const Value: String; DoChanges: Boolean = False);
    procedure SetKeyValue(Value: Variant); override; { Para que sea DBAware }
    procedure SetValue(const Value: TValueType); virtual;
    procedure SetShowBajas(const Value: Boolean); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AfterConstruction; override;
    procedure Clear; override;
    function IsBaja : Boolean; virtual;
    function TieneDatosSeleccionables: Boolean; virtual;    
    procedure Reload; virtual;
    procedure SelectFirst; virtual;
    procedure SelectLast;  virtual;
    procedure SelectNext;  virtual;
    procedure SelectPrior; virtual;
    property AsString     : String     read GetAsString; { Queda para compatibilidad con los aplicativos ART1 }
    property Code         : String     read GetCode        write SetCode;
    property Codigo       : String     read GetCode        write SetCode;
    property Descripcion  : String     read GetDescipcion;
    property ID           : String     read GetID;
    property IsEmpty      : Boolean    read GetIsEmpty;
    property IsSelected   : Boolean    read GetIsSelected;
    property Value        : TValueType read GetValue       write SetValue;
    property VariantValue : Variant    read GetVariant;
    property ColorBaja: TColor         read FColorBaja     write FColorBaja;
  published
    property CaseSensitive      : Boolean      read GetCaseSensitive    write FCaseSensitive     default True;
    property ClearOnChange      : Boolean      read FClearOnChange      write FClearOnChange     default True;
    property CodigoType         : TCodigoType  read GetCodigoType       write SetCodigoType      default ctString;
    property ConnectTo          : TConnectTo   read FConnectTo          write SetConnectTo;
    property ExtraCondition     : String       read GetExtraCondition   write FExtraCondition;
    property ExtraFields        : String       read GetExtraFields      write FExtraFields;
    property ExtraTables        : String       read GetExtraTables      write FExtraTables;
    property FieldBaja          : String       read GetFieldBaja        write FFieldBaja;
    property FieldCodigo        : String       read GetFieldCodigo      write FFieldCodigo;
    property FieldDesc          : String       read GetFieldDesc        write FFieldDesc;
    property FieldID            : String       read GetFieldID          write FFieldID;
    property FindAllOnSameText  : Boolean      read FFindAllOnSameText  write FFindAllOnSameText default True;
    property FullLikeComparison : Boolean      read FFullLikeComparison write FFullLikeComparison;
    property GroupBy            : String       read GetGroupBy          write FGroupBy;
    property IdType             : TCodigoType  read FIdType             write FIdType            default ctString;
    property MinSearchLength    : Integer      read FMinSearchLength    write FMinSearchLength   default 0;
    property OrderBy            : String       read GetOrderBy          write FOrderBy;
    property ShowBajas          : Boolean      read GetShowBajas        write SetShowBajas       default False;
    property Sql                : String       read GetSql              write SetSql;
    property TableName          : String       read GetTableName        write FTableName;
  end;

const
  CD_ALIAS_ID     : String = 'ID';
  CD_ALIAS_CODIGO : String = 'CODIGO';
  CD_ALIAS_DESC   : String = 'DESCRIPCION';
  CD_ALIAS_BAJA   : String = 'BAJA';

implementation

uses
{$IFDEF FINANCIALS}
  unDmFinancials,
{$ENDIF}
  unDmPrincipal, General, AnsiSql, Numeros, unCustomDataModule, CustomDlgs, 
  Strfuncs;

var
  dmDataModule: TdmCustomDataModule;

{$R *.DFM}
       
procedure TfraCodigoDescripcion.cmbDescripcionCloseUp(Sender: TObject);
begin
  if cmbDescripcion.Text = '' then
    Clear
  else
    LoadValues(True);
end;

procedure TfraCodigoDescripcion.cmbDescripcionDropDown(Sender: TObject);
var
  sSql: String;
begin
  cmbDescripcion.DataSource := dsDatos;
  if (FMinSearchLength <> 0) and (Length(cmbDescripcion.Text) < FMinSearchLength) then
    MsgBox('Debe ingresar como mínimo ' + LowerCase( NumLetras(FMinSearchLength) ) + ' caracteres para realizar la búsqueda', MB_ICONEXCLAMATION)
  else begin
    if (sdqDatos.Active and ((sdqDatos.FieldByName(CD_ALIAS_DESC).AsString = cmbDescripcion.Text) and FFindAllOnSameText) or ((cmbDescripcion.Text = '') and (edCodigo.Text = ''))) then
      sSql := GetSql + GetSqlWhere + GetSqlGroupBy + GetSqlOrderBy
    else begin
      if (Trim(cmbDescripcion.Text) > '') or (Trim(edCodigo.Text) = '') then
        sSql := GetSql + ' AND ' +
                IIF( FCaseSensitive, FieldDesc + ' LIKE ' +  SQL_QUOTE + iif(FullLikeComparison, SQL_WILLCARD, '') + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE,
                                     SqlUpper(FieldDesc) + ' LIKE ' +  SqlUpper(iif(FullLikeComparison, SQL_WILLCARD, '') + cmbDescripcion.Text + SQL_WILLCARD, True)
                    ) + ' ' + GetSqlWhere + GetSqlGroupBy + GetSqlOrderBy
      else
        sSql := GetSql + ' AND ' +
                IIF( FCaseSensitive, FieldCodigo + ' LIKE ' +  SQL_QUOTE + edCodigo.Text + SQL_WILLCARD + SQL_QUOTE,
                                     SqlUpper(FieldCodigo) + ' LIKE ' +  SqlUpper(edCodigo.Text + SQL_WILLCARD, True)
                    ) + ' ' + GetSqlWhere + GetSqlGroupBy + GetSqlOrderBy;
    end;

    dmDataModule.OpenQuery(sdqDatos, sSql, True);

    if edCodigo.Text <> '' then
      sdqDatos.Locate( CD_ALIAS_CODIGO, edCodigo.Text, []);
  end;
end;

procedure TfraCodigoDescripcion.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                            var Background: TColor; Highlight: Boolean);
begin
  if IsBaja then
    AFont.Color := FColorBaja;
end;

procedure TfraCodigoDescripcion.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not edCodigo.ReadOnly) and (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DoDropDown ;
end;

procedure TfraCodigoDescripcion.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if (not edCodigo.ReadOnly) and (Key = #13) then
    SetCodigo(edCodigo.Text, True);
end;

procedure TfraCodigoDescripcion.FrameExit(Sender: TObject);
begin
  if Assigned(Self) and not ExitInProgress then
  begin
    ExitInProgress := True;

    try
      if not ReadOnly then
      begin
        if (edCodigo.Text = '') then
        begin
          cmbDescripcion.Text := '';
          if sdqDatos.Active then
          begin
            sdqDatos.Close;
            Change;
            UpdateData(nil);
          end;
        end else
        begin
          if (not sdqDatos.Active) or (edCodigo.Text <> sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString) then
            SetCodigo(edCodigo.Text, True)
          else
            cmbDescripcion.Text := sdqDatos.FieldByName(CD_ALIAS_DESC).AsString;
        end;
      end;
    finally
      ExitInProgress := False;
    end;
  end;
end;

procedure TfraCodigoDescripcion.CMChanged(var Message: TMessage);
begin
//  FrameExit( nil );
end;

function TfraCodigoDescripcion.GetCode: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString
  else
    Result := '';
end;

function TfraCodigoDescripcion.GetDescipcion: String;
begin
  Result := cmbDescripcion.Text;
end;

function TfraCodigoDescripcion.GetID: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if Assigned(Self) and sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
  else
    Result := '';
end;

function TfraCodigoDescripcion.GetIsSelected: Boolean;
begin
  Result := not GetIsEmpty;
end;

function TfraCodigoDescripcion.GetVariant: Variant;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active Then
    {$IFDEF ART2}
    if IsNumber(sdqDatos.FieldByName(CD_ALIAS_ID).AsString) then
      Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsInteger
    else
      Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
    {$ELSE}
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
    {$ENDIF}
  else
    {$IFDEF ART2}
    Result := ART_EMPTY_ID;
    {$ELSE}
    Result := '';
    {$ENDIF}
end;

procedure TfraCodigoDescripcion.SetCode(const Value: String);
begin
  SetCodigo(Value);
end;

procedure TfraCodigoDescripcion.SetCodigoType(const Value: TCodigoType);
const
  INT_PATTERN = '0123456789';
begin
  if FCodigoType <> Value then
  begin
    FCodigoType := Value;
    case FCodigoType of
      ctString:
        if (edCodigo.Pattern = INT_PATTERN) then
          edCodigo.Pattern := '';
      ctInteger:
        if (edCodigo.Pattern = '') then
          edCodigo.Pattern := INT_PATTERN;
    end;
  end;
end;

procedure TfraCodigoDescripcion.SetConnectTo(const Value: TConnectTo);
begin
  FConnectTo := Value;

  if ConnectTo = ctPART then
  begin
    sdqDatos.DatabaseName := dmPrincipal.sdbPrincipal.DatabaseName;
    dmDataModule := dmPrincipal;
  end
{$IFDEF FINANCIALS}
  else if ConnectTo = ctFinancials then
  begin
    sdqDatos.DataBaseName := dmFinancials.sdbPrincipal.DatabaseName;
    dmDataModule := dmFinancials;
  end
{$ENDIF};
end;

procedure TfraCodigoDescripcion.SetSql(const Value: String);
begin
  if FSql <> Value then
  begin
    FSql := Value;
    if ClearOnChange then Clear;
  end;
end;

procedure TfraCodigoDescripcion.Change;
begin
  if Assigned(FOnChange) then
    OnChange(Self);
end;

function TfraCodigoDescripcion.GetAsString: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
  else
    Result := '';
end;

function TfraCodigoDescripcion.GetCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TfraCodigoDescripcion.GetCodigoType: TCodigoType;
begin
  Result := FCodigoType;
end;

function TfraCodigoDescripcion.GetExtraCondition: String;
begin
  Result := FExtraCondition;
end;

function TfraCodigoDescripcion.GetExtraFields: String;
begin
  Result := FExtraFields;
end;

function TfraCodigoDescripcion.GetExtraTables: String;
begin
  Result := FExtraTables;
end;

function TfraCodigoDescripcion.GetFieldBaja: String;
begin
  Result := FFieldBaja;
end;

function TfraCodigoDescripcion.GetFieldCodigo: String;
begin
  Result := FFieldCodigo;
end;

function TfraCodigoDescripcion.GetFieldDesc: String;
begin
  Result := FFieldDesc;
end;

function TfraCodigoDescripcion.GetFieldID: String;
begin
  Result := FFieldID;
end;

function TfraCodigoDescripcion.GetGroupBy: String;
begin
  Result := FGroupBy;
end;

function TfraCodigoDescripcion.GetIsEmpty: Boolean;
begin
  if IdType = ctString then
    Result := GetAsString = ''
  else
    {$IFDEF ART2}
    Result := GetValue = 0
    {$ELSE}
    Result := GetValue = '';
    {$ENDIF}
end;

function TfraCodigoDescripcion.GetKeyValue: Variant;
begin
  if IsEmpty then
    Result := Null
  else
    Result := GetVariant;
end;

function TfraCodigoDescripcion.GetOrderBy: String;
begin
  Result := FOrderBy;
end;

function TfraCodigoDescripcion.GetShowBajas: Boolean;
begin
  Result := FShowBajas;
end;

function TfraCodigoDescripcion.GetSql: String;
begin
  if FSql = '' then
    Result := 'SELECT ' + FieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                          FieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                          FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                          FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ' ' +
                          ExtraFields +
                'FROM ' + TableName + ExtraTables + 
              ' WHERE 1=1 ' + ExtraCondition
  else
     Result := FSql;
end;

function TfraCodigoDescripcion.GetSqlByType(FType : TCodigoType; const Value: String): String;
begin
  case FCodigoType of
    ctString:   Result := SqlString(Value, True);
    ctInteger:  Result := SqlInt(Value);
  end;
end;

function TfraCodigoDescripcion.GetSqlGroupBy: String;
begin
  if FGroupBy <> '' then
    Result := ' GROUP BY ' + FGroupBy
  else
    Result := '';
end;

function TfraCodigoDescripcion.GetSqlOrderBy: String;
begin
  Result := ' ORDER BY ';
  if FOrderBy <> '' then
    Result := Result + FOrderBy
  else
    Result := Result + {$IFDEF MSACCESS}'3'{$ELSE}iif(edCodigo.Focused, CD_ALIAS_CODIGO, CD_ALIAS_DESC){$ENDIF} +
              iif(((Trim(FieldBaja) > '') and
                   (UpperCase( Trim(FieldBaja) ) <> 'NULL') ),
                  ', ' + FieldBaja + ' DESC ',
                  '');
end;

function TfraCodigoDescripcion.GetSqlWhere: String;
begin
  if ShowBajas then
    Result := ''
  else
    Result := ' AND ' + FieldBaja + ' IS NULL';
end;

function TfraCodigoDescripcion.GetTableName: String;
begin
  Result := FTableName;
end;

function TfraCodigoDescripcion.GetValue: TValueType;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    {$IFDEF ART2}
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsInteger
    {$ELSE}
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
    {$ENDIF}
  else
    {$IFDEF ART2}
    Result := ART_EMPTY_ID;
    {$ELSE}
    Result := '';
    {$ENDIF}
end;

procedure TfraCodigoDescripcion.LoadValues(DoChanges: Boolean);
begin
  if sdqDatos.Active and not sdqDatos.IsEmpty then
  begin
    edCodigo.Text       := sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString;
    cmbDescripcion.Text := sdqDatos.FieldByName(CD_ALIAS_DESC).AsString;
  end else
    Clear;
  
  if IsBaja then
    Font.Color := FColorBaja
  else
    Font.Color := clWindowText;

  if DoChanges then
  begin
    Change;

    if (edCodigo.Text <> '') then
      DoLostFocus;
  end;
end;

procedure TfraCodigoDescripcion.SelectRecord( RecordPosition: TRecordPosition);
var
  sSql: String;
begin
  if not sdqDatos.Active then
  begin
    sSql := GetSql + GetSqlWhere + GetSqlGroupBy + GetSqlOrderBy;
    dmDataModule.OpenQuery(sdqDatos, sSql, True);
  end;

  case RecordPosition of
    rpFirst: sdqDatos.First;
    rpNext:  sdqDatos.Next;
    rpPrior: sdqDatos.Prior;
    rpLast:  sdqDatos.Last;
  end;

  LoadValues(False); {Lo pasa como falso y hace el Change para que no pase el foco}
  Change;
end;

procedure TfraCodigoDescripcion.SetCodigo(const Value: String; DoChanges: Boolean = False);
var
  sSql: String;
begin
  if not IsEmptyString(Value) then
  begin
    sSql := GetSql + GetSqlWhere + ' AND ' + GetTablaSinBDLink(TableName) + '.' + FieldCodigo + ' = ' + GetSqlByType(CodigoType, Value) + GetSqlGroupBy;

    try
      if dmDataModule.OpenQuery(sdqDatos, sSql, True) then
        LoadValues(DoChanges)
    except
      on E: EDatabaseError do
      begin
        InfoHint(edCodigo, 'Ocurrió un error al ejecutar la consulta, verifique la información ingresada.', False,
                 'Validación', blnWarning);
      end;
    end;
  end else
    Clear;
end;

procedure TfraCodigoDescripcion.SetKeyValue(Value: Variant);
begin
  if VarIsNull(Value) then
    Clear
  else
    SetValue(Value);
end;

procedure TfraCodigoDescripcion.SetValue(const Value: TValueType);
var
  sSql: String;
begin
  {$IFDEF ART2}
  if Value <> ART_EMPTY_ID then
  {$ELSE}
  if not IsEmptyString(Value) then
  {$ENDIF}
  begin
    sSql := GetSql + GetSqlWhere +
            ' AND ' + GetTablaSinBDLink(TableName) + '.' + FieldID + ' = ' + {$IFDEF ART2}SqlValue( Value )
                                                                             {$ELSE}GetSqlByType( FIdType, Value )
                                                                             {$ENDIF} + GetSqlGroupBy;

    if dmDataModule.OpenQuery(sdqDatos, sSql, True) then
      LoadValues;
  end else
    Clear;
end;

constructor TfraCodigoDescripcion.Create(AOwner: TComponent);
begin
  inherited;
  FColorBaja     := clRed;
  FTableName     := '';
  FExtraTables   := '';
  FFieldID       := SQL_NULL;
  FFieldCodigo   := SQL_NULL;
  FFieldDesc     := SQL_NULL;
  FFieldBaja     := SQL_NULL;
  ConnectTo      := ctPART;

  FCaseSensitive := True;
  FClearOnChange := True;
  FCodigoType    := ctString;
 {$IFDEF ART2}
  FIdType        := ctInteger;
 {$ELSE}
  FIdType        := ctString;
 {$ENDIF}
  FMinSearchLength   := 0;
  FFindAllOnSameText := True;
  FFullLikeComparison := False;
  cmbDescripcion.Text := '';
  cmbDescripcion.DataSource := dsDatos;
end;

procedure TfraCodigoDescripcion.AfterConstruction;
begin
  inherited;
  cmbDescripcion.DataSource := dsDatos;
end;

{ TfraCodigoDescripcion }

procedure TfraCodigoDescripcion.Clear;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';

  sdqDatos.Close;
end;

function TfraCodigoDescripcion.IsBaja: Boolean;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and Assigned(sdqDatos.FindField(CD_ALIAS_BAJA)) then
    Result := not sdqDatos.FieldByName(CD_ALIAS_BAJA).IsNull
  else
    Result := False;
end;

procedure TfraCodigoDescripcion.Reload;
begin
  if sdqDatos.Active then
  begin
    sdqDatos.Refresh;
    LoadValues(False);
  end;
end;

procedure TfraCodigoDescripcion.SelectFirst;
begin
  SelectRecord(rpFirst);
end;

procedure TfraCodigoDescripcion.SelectLast;
begin
  SelectRecord(rpLast);
end;

procedure TfraCodigoDescripcion.SelectNext;
begin
  SelectRecord(rpNext);
end;

procedure TfraCodigoDescripcion.SelectPrior;
begin
  SelectRecord(rpPrior);
end;

procedure TfraCodigoDescripcion.SetShowBajas(const Value: Boolean);
begin
  FShowBajas := Value;
end;

function TfraCodigoDescripcion.TieneDatosSeleccionables: Boolean;
begin
  Result := ExisteSQL(GetSql + GetSqlWhere + GetSqlGroupBy);
end;

end.
