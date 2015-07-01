unit unFraEmpresa;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtDbFrame, ArtComboBox, IntEdit, StdCtrls,
  Mask, Db, SDEngine, Cuit, unArt, PatternEdit, ExtCtrls, JvComponent, JvAppHotKey,
  RxToolEdit;

{$IFNDEF ART2}
//  ESTE FRAME NO ES COMPATIBLE CON LAS APLICACIONES VIEJAS
{$ENDIF}

type
  TfraEmpresa = class(TArtDbFrame)//, IEmpresa)
    lbRSocial: TLabel;
    lbContrato: TLabel;
    mskCUIT: TMaskEdit;
    edContrato: TIntEdit;
    cmbRSocial: TArtComboBox;
    TimerConfidencial: TTimer;
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure edContratoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRSocialCloseUp(Sender: TObject);
    procedure cmbRSocialDropDown(Sender: TObject);
    procedure cmbRSocialGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mskCUITKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
    procedure TimerConfidencialTimer(Sender: TObject);
    procedure mskCUITChange(Sender: TObject);
    procedure HotKeyMethod(Sender: TObject);
  private
    FConfidencialidad: Boolean;
    FContratoActivo: Boolean;
    FFieldBaja: String;
    FFieldContrato: String;
    FFieldCUIT: String;
    FFieldId: String;
    FFieldNombre: String;
    FFieldCodReg: String;
    FFieldContratoExt: String;
    FFieldIdRegimenOrig: String;
    FMinLength: Integer;
    FOnInvalidCuit: TNotifyEvent;
    FShowBajas: Boolean;
    FTercerizadoras: Boolean;
    FTrabajador: TTableID;
    FUltContrato: Boolean;
    tslContratos: TStringList;
    FVerTodosRegimenes: Boolean;
    psTablaContrato: String;
    piTopOriginal: Integer;

    function GetContrato: TTableID;
    function GetCorreoElectronico: String;
    function GetID: Integer;
    function GetNombreEmpresa: String;
    function GetCodRegimen: String;
    function GetIdRegimen: Integer;

    procedure SetContratoGuarda;
    procedure SetID(const Value: Integer);
    procedure SetTrabajador(const Value: TTableID);
    procedure SetVerTodosRegimenes(const Value: Boolean);
    function IsContratosConsecIguales: Boolean;
    function GetContratoExt: TTableID;
    procedure SetearPosicionLabelContrato(VerInfoAdicional: Boolean = False);
    procedure SetContratoExt(const Value: TTableID);
  protected
    iExitCounter: Byte; //Contador para que no se vuelva recursiva la llamada al FrameExit

    function GetCuit: TCuit;
    function GetRazonSocial: String;
    function GetSql: String; override;
    function GetSqlOrderBy: String; override;
    function GetSqlWhere: String; override;
    function GetValue: TTableID; override;

    procedure Change; override;
    procedure SetContrato(const Value: TTableID); virtual;
    procedure SetCuit(const Value: TCuit);
    procedure SetEditorsValues; virtual;
    procedure SetValue(const Value: TTableID); override;

    function CancelExitLoad: Boolean; virtual; {Se usa antes del exists, para si se hereda este frame y se agregan controles, chequee los datos }
    function ClearOnExit: Boolean; virtual;

    procedure LoadValues(DoChanges: Boolean = False); override;

    procedure Internal_SetContrato(AContrato: TTableID; DoChanges: Boolean = False); virtual;
    procedure Internal_SetCuit(ACuit: TCuit; DoChanges: Boolean = False);
    procedure Internal_SetContratoExt(AContratoExt: TTableID; DoChanges: Boolean = False); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function IsBaja: Boolean; override;
    function IsVIP: Boolean;

    procedure Clear; override;
  published
    property Contrato   : TTableID read GetContrato     write SetContrato   default ART_EMPTY_ID; { Esto nunca se probó }
    property CUIT       : TCuit    read GetCuit         write SetCuit;
    property ID         : Integer  read GetID           write SetID;
    property MinLength  : Integer  read FMinLength      write FMinLength    default 2;
    property RazonSocial: String   read GetRazonSocial;
    property Trabajador : TTableID read FTrabajador     write SetTrabajador default ART_EMPTY_ID; { Esto nunca se probó }
    property Value;

    property FieldBaja          : String       read FFieldBaja            write FFieldBaja;
    property FieldContrato      : String       read FFieldContrato        write FFieldContrato;
    property FieldCUIT          : String       read FFieldCUIT            write FFieldCUIT;
    property FieldId            : String       read FFieldId              write FFieldId;
    property FieldNombre        : String       read FFieldNombre          write FFieldNombre;
    property FieldCodReg        : String       read FFieldCodReg          write FFieldCodReg;
    property FieldContratoExt   : String       read FFieldContratoExt     write FFieldContratoExt;
    property FieldIdRegimenOrig : String       read FFieldIdRegimenOrig   write FFieldIdRegimenOrig;

    property OnInvalidCuit    : TNotifyEvent   read FOnInvalidCuit        write FOnInvalidCuit;  { Si se usa este evento, no se limpian los datos erroneos }
    property ShowBajas        : Boolean        read FShowBajas            write FShowBajas;

    property Confidencialidad : Boolean        read FConfidencialidad     write FConfidencialidad;
    property ContratoActivo   : Boolean        read FContratoActivo       write FContratoActivo;
    property CorreoElectronico: String         read GetCorreoElectronico;
    property NombreEmpresa    : String         read GetNombreEmpresa;
    property Tercerizadoras   : Boolean        read FTercerizadoras       write FTercerizadoras;
    property UltContrato      : Boolean        read FUltContrato          write FUltContrato;

    property CodRegimen       : String         read GetCodRegimen;
    property IdRegimen        : Integer        read GetIdRegimen;
    property VerTodosRegimenes: Boolean        read FVerTodosRegimenes    write SetVerTodosRegimenes    default False;
    property ContratoExt      : TTableID       read GetContratoExt        write SetContratoExt;
  end;

var
  EMP_FIELD_CONTRATO           : String = 'CO_CONTRATO';

const
  { Nombres por default de los campos }
  EMP_FIELD_BAJA               : String = 'CO_FECHABAJA';
  EMP_FIELD_CUIT               : String = 'EM_CUIT';
  EMP_FIELD_ID                 : String = 'EM_ID';
  EMP_FIELD_NOMBRE             : String = 'EM_NOMBRE';
  EMP_FIELD_CODREG             : String = 'TR_CODIGO';
  EMP_FIELD_CONTRATOEXT        : String = 'CO_CONTRATO';
  EMP_FIELD_IDTIPOREGIMEN_ORIG : String = 'CO_IDTIPOREGIMEN_ORIG';

  { Alias de los campos }
  EMP_ALIAS_BAJA               : String = 'FECHA_BAJA';
  EMP_ALIAS_CONTRATO           : String = 'CONTRATO';
  EMP_ALIAS_COBERTURA          : String = 'CHECKCOBERTURA';
  EMP_ALIAS_CUIT               : String = 'CUIT';
  EMP_ALIAS_ID                 : String = 'ID';
  EMP_ALIAS_NOMBRE             : String = 'NOMBRE';
  EMP_ALIAS_ORDEN              : String = 'ORDENESTADO';
  EMP_ALIAS_VIP                : String = 'VIP';
  EMP_ALIAS_CODREG             : String = 'CODREG';
  EMP_ALIAS_CONTRATOEXT        : String = 'CONTRATOEXT';
  EMP_ALIAS_IDTIPOREGIMEN_ORIG : String = 'IDTIPOREGIMEN_ORIG';

  COLOR_GUARDA = $00ffff80;

  LBCONTRATOCAPT: String = 'Contrato';

implementation

uses
  AnsiSQL, unDmPrincipal, CustomDlgs, Numeros, General, unConfidencial,
  {$IFDEF ORACLE}unUtilsArchivo,{$ENDIF}
  unSesion, unRtti, Strfuncs, VCLExtra, unArtFrame, unTercerizadoras;

var
  HKContrato: Integer;
  FJvApplicationHotKeyContrato: TJvApplicationHotKey;

{$R *.DFM}

procedure SetFontColor(AControl: TWinControl; AColor: TColor);
var
  i: Byte;
begin
  for i := 0 to AControl.ControlCount - 1 do
    if AControl.Controls[i].InheritsFrom(TWinControl) and ExistsProperty(AControl.Controls[i], 'Font') then
      TFontControl(AControl.Controls[i]).Font.Color := AColor;
end;

function TfraEmpresa.GetSql: String;
begin
  if FSql <> '' then
    Result := inherited GetSql
  else begin
    {$IFDEF MSACCESS}
    Result := 'SELECT ' + SqlAlias(FieldId,             EMP_ALIAS_ID)           + ', ' +
                          SqlAlias(FieldCuit,           EMP_ALIAS_CUIT)         + ', ' +
                          SqlAlias(FieldNombre,         EMP_ALIAS_NOMBRE)       + ', ' +
                          SqlAlias(FieldContrato,       EMP_ALIAS_CONTRATO)     + ', ' +
                          SqlAlias('''N''',             EMP_ALIAS_VIP)          + ', ' +
                          SqlAlias('MP_COBERTURA',      EMP_ALIAS_COBERTURA)    + ', ' +
                          SqlAlias('0',                 EMP_ALIAS_ORDEN)        + ', ' +
                          SqlAlias(FieldBaja,           EMP_ALIAS_BAJA)         + ' '  +
                          FExtraFields + ' '  +
                'FROM CMP_EMPRESAS ' +
               'WHERE 1 = 1 ';
    {$ELSE}
    if FTrabajador <> ART_EMPTY_ID then
      Result := 'SELECT ' + SqlAlias(FieldId,            EMP_ALIAS_ID)          + ', ' +
                            SqlAlias(FieldCuit,          EMP_ALIAS_CUIT)        + ', ' +
                            SqlAlias(FieldNombre,        EMP_ALIAS_NOMBRE)      + ', ' +
                            SqlAlias(FieldContrato,      EMP_ALIAS_CONTRATO)    + ', ' +
                            SqlAlias(FieldCodReg,        EMP_ALIAS_CODREG)      + ', ' +
                            SqlAlias(FieldContratoExt,   EMP_ALIAS_CONTRATOEXT) + ', ' +
                            SqlAlias(FieldIdRegimenOrig, EMP_ALIAS_IDTIPOREGIMEN_ORIG) + ', ' +
                            SqlAlias('ART.AFILIACION.IS_EMPRESAVIP(CO_CONTRATO)',                    EMP_ALIAS_VIP)       + ', ' +
                            SqlAlias('ART.AFILIACION.CHECK_COBERTURA(CO_CONTRATO)',                  EMP_ALIAS_COBERTURA) + ', ' +
                            SqlAlias('DECODE(ART.AFILIACION.CHECK_COBERTURA(CO_CONTRATO), 1, 1, 2)', EMP_ALIAS_ORDEN)     + ', ' +
                            SqlAlias(FieldBaja,          EMP_ALIAS_BAJA)     + ' '  +
                            FExtraFields + ' '  +
                  'FROM AFI.ATR_TIPOREGIMEN' + GetDBLink() + ', AEM_EMPRESA' + GetDBLink() + ', ' + psTablaContrato + GetDBLink() + ', COMUNES.CRL_RELACIONLABORAL' + GetDBLink() + ' ' +
                 'WHERE EM_ID = CO_IDEMPRESA ' +
                   'AND RL_CONTRATO = CO_CONTRATO ' +
                   'AND CO_IDTIPOREGIMEN_ORIG = TR_ID ' +
                   'AND RL_IDTRABAJADOR = ' + SqlInt( FTrabajador )
    else
      Result := 'SELECT ' + SqlAlias(FieldId,             EMP_ALIAS_ID)          + ', ' +
                            SqlAlias(FieldCuit,           EMP_ALIAS_CUIT)        + ', ' +
                            SqlAlias(FieldNombre,         EMP_ALIAS_NOMBRE)      + ', ' +
                            SqlAlias(FieldContrato,       EMP_ALIAS_CONTRATO)    + ', ' +
                            SqlAlias(FieldCodReg,         EMP_ALIAS_CODREG)      + ', ' +
                            SqlAlias(FieldContratoExt,    EMP_ALIAS_CONTRATOEXT) + ', ' +
                            SqlAlias(FieldIdRegimenOrig,  EMP_ALIAS_IDTIPOREGIMEN_ORIG) + ', ' +
                            SqlAlias('ART.AFILIACION.IS_EMPRESAVIP(CO_CONTRATO)',                    EMP_ALIAS_VIP)       + ', ' +
                            SqlAlias('ART.AFILIACION.CHECK_COBERTURA(CO_CONTRATO)',                  EMP_ALIAS_COBERTURA) + ', ' +
                            SqlAlias('DECODE(ART.AFILIACION.CHECK_COBERTURA(CO_CONTRATO), 1, 1, 2)', EMP_ALIAS_ORDEN)     + ', ' +
                            SqlAlias(FieldBaja,           EMP_ALIAS_BAJA)     + ' '  +
                            FExtraFields + ' '  +
                  'FROM AFI.ATR_TIPOREGIMEN' + GetDBLink() + ', AEM_EMPRESA' + GetDBLink() + ', ' + psTablaContrato + GetDBLink() + ' ' +
                 'WHERE EM_ID = CO_IDEMPRESA ' +
                   'AND CO_IDTIPOREGIMEN_ORIG = TR_ID ';
    {$ENDIF}
  end;
end;

function TfraEmpresa.GetSqlOrderBy: String;
begin
  {$IFDEF MSACCESS}
//    Result := ' ORDER BY ' + EMP_ALIAS_NOMBRE;
  {$ELSE}
  if UltContrato then
    Result := ' ORDER BY ' + IIF(ContratoActivo, SqlSimpleAlias('ORDENESTADO') + ', ', '') + SqlSimpleAlias(EMP_ALIAS_CONTRATO) + ' DESC, ' + SqlSimpleAlias(EMP_ALIAS_IDTIPOREGIMEN_ORIG) + ', ' +SqlSimpleAlias(EMP_ALIAS_NOMBRE)
  else
    Result := ' ORDER BY ' + SqlSimpleAlias(EMP_ALIAS_NOMBRE) + ', ' + iif(ContratoActivo, SqlSimpleAlias('ORDENESTADO') + ', ', '') + SqlSimpleAlias(EMP_ALIAS_CONTRATO) + ', ' + SqlSimpleAlias(EMP_ALIAS_IDTIPOREGIMEN_ORIG);
  {$ENDIF}
end;

function TfraEmpresa.GetSqlWhere: String;
begin
  if FShowBajas then
    Result := ''
  else
    {$IFDEF ORACLE}
    if InStr(UpperCase(GetSql), 'ACO_CONTRATO') > 0 then
      Result := ' AND ART.AFILIACION.CHECK_COBERTURA(CO_CONTRATO) = 1'
    else
      Result := ' AND ' + FFieldBaja + ' IS NULL';
    {$ELSE}
    Result := ' AND ' + FFieldBaja + ' IS NULL';
    {$ENDIF}

  {$IFNDEF MSACCESS}
  if EsUsuarioDeTercerizadora then
    Result := Result + ' AND art.siniestro.is_usuariotercerizadora(EM_ID, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';   // por plan IOMA
  {$ENDIF}

  Result := Result + FExtraCondition;
end;

function TfraEmpresa.GetValue: TTableID;
begin
  if iExitCounter = 0 then
    FrameExit(nil); // Valida que todo este completo

  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(EMP_ALIAS_ID).AsInteger
  else
    Result := ART_EMPTY_ID;
end;

function TfraEmpresa.GetContrato: TTableID;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(EMP_ALIAS_CONTRATO).AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraEmpresa.SetContrato(const Value: TTableID);
begin
  if (not sdqDatos.Active) or (sdqDatos.FieldByName(EMP_ALIAS_CONTRATO).AsInteger <> Value) then
     Internal_SetContrato(Value, False);
end;

procedure TfraEmpresa.SetContratoExt(const Value: TTableID);
begin
  if (not sdqDatos.Active) or (sdqDatos.FieldByName(EMP_ALIAS_CONTRATO).AsInteger <> Value) and FVerTodosRegimenes then
     Internal_SetContratoExt(Value, False);
end;

procedure TfraEmpresa.SetValue(const Value: TTableID);
var
  sSql: String;
begin
  if Value <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FFieldID + ' = ' + SqlInt(Value) + GetSqlOrderBy;

    if OpenQuery(sdqDatos, sSql, True) then
      LoadValues(False);
  end else
    Clear;
end;

procedure TfraEmpresa.Internal_SetContrato(AContrato: TTableID; DoChanges: Boolean = False);
var
  sSql: String;
begin
  if AContrato <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FFieldContrato + ' = ' + SqlInt(AContrato) + GetSqlOrderBy;

    if OpenQuery(sdqDatos, sSql, True) then
    begin
      if sdqDatos.RecordCount > 1 then
        cmbRSocial.DoDropDown(False)
      else
        LoadValues(DoChanges);
    end;
  end else
    Clear;
end;

procedure TfraEmpresa.Internal_SetContratoExt(AContratoExt: TTableID;
  DoChanges: Boolean);
var
  sSql: String;
begin
  if AContratoExt <> ART_EMPTY_ID then
  begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FFieldContratoExt + ' = ' + SqlInt(AContratoExt) + GetSqlOrderBy;

    if OpenQuery(sdqDatos, sSql, True) then
    begin
      if sdqDatos.RecordCount > 1 then
        cmbRSocial.DoDropDown(False)
      else
        LoadValues(DoChanges);
    end;
  end else
    Clear;
end;

function TfraEmpresa.IsContratosConsecIguales: Boolean;
var
  iContrato: Integer;
begin
  with sdqDatos do
    begin
      iContrato := FieldByName(EMP_ALIAS_CONTRATO).AsInteger;
      Next;
      try
        Result := (iContrato = FieldByName(EMP_ALIAS_CONTRATO).AsInteger);
      finally
        Prior;
      end;
    end;
end;

procedure TfraEmpresa.Internal_SetCuit(ACuit: TCuit; DoChanges: Boolean = False);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FFieldCUIT + ' = ' + SqlString(ACuit, True) + GetSqlOrderBy;

  if OpenQuery(sdqDatos, sSql, True) then
  begin
    if sdqDatos.IsEmpty and Assigned(FOnInvalidCuit) then
      FOnInvalidCuit(Self)
    else
      if (sdqDatos.RecordCount > 1) then
        begin
          if not UltContrato or (VerTodosRegimenes and IsContratosConsecIguales()) then
            cmbRSocial.DoDropDown(False)
          else
            LoadValues(DoChanges);
        end
      else
        LoadValues(DoChanges);
  end;
end;

procedure TfraEmpresa.mskCUITKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not mskCUIT.ReadOnly) then
   Internal_SetCuit(mskCUIT.Text, True);
end;

procedure TfraEmpresa.edContratoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edContrato.ReadOnly) then
    Internal_SetContrato(edContrato.Value, True);
end;

procedure TfraEmpresa.SetEditorsValues;
var
  sCodReg: String;
  bHayDatos: Boolean;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and Assigned(tslContratos) and (tslContratos.IndexOf(sdqDatos.FieldByName(EMP_ALIAS_CONTRATO).AsString) > -1) then
  begin
    InfoHint(cmbRSocial, Format('Su sector, %s, no tiene permiso para consultar los datos referentes a la empresa %s',
             [NVL(Sesion.SectorDesc, Sesion.Sector), sdqDatos.FieldByName(EMP_ALIAS_NOMBRE).AsString]), False,
             'Validación de permisos');
    Clear;
    Abort;
  end
  else
  begin
    mskCuit.Text    := sdqDatos.FieldByName(EMP_ALIAS_CUIT).AsString;
    cmbRSocial.Text := sdqDatos.FieldByName(EMP_ALIAS_NOMBRE).AsString;
    edContrato.Text := sdqDatos.FieldByName(EMP_ALIAS_CONTRATO).AsString;

    sCodReg   := sdqDatos.FieldByName(EMP_ALIAS_CODREG).AsString;
    bHayDatos := not IsEmptyString(sCodReg);

    SetearPosicionLabelContrato(bHayDatos and VerTodosRegimenes);

    if bHayDatos and VerTodosRegimenes then
      lbContrato.Caption := LBCONTRATOCAPT + ' ' + sCodReg;
  end;
end;

procedure TfraEmpresa.LoadValues(DoChanges: boolean);
begin
  SetEditorsValues;

  if IsBaja then
    SetFontColor(Self, clRed)
  else if IsVIP then
    SetFontColor(Self, clPurple)
  else
    SetFontColor(Self, clWindowText);

  HKContrato := edContrato.Value;
  if DoChanges then
  begin
    Change;

    if Assigned(FOnChange) then
      FOnChange(Self);

    if (mskCuit.Text <> '') then {Si se cargaron los datos}
      DoLostFocus;
  end;
end;

procedure TfraEmpresa.cmbRSocialCloseUp(Sender: TObject);
begin
  if cmbRSocial.Text = '' then
  begin
    Clear;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end
  else
    LoadValues(True);
end;

procedure TfraEmpresa.cmbRSocialDropDown(Sender: TObject);
var
  sSql: String;
begin
  cmbRSocial.DataSource := dsDatos;
  if (Length(Trim(cmbRSocial.Text)) < FMinLength) {$IFDEF CEM}and (ExtraCondition = ''){$ENDIF} then
  begin
    Clear;
    InvalidHint(cmbRSocial, Format(SMinLength, [LowerCase(NumLetras( FMinLength ))]), 'Advertencia', blnWarning);
    //MsgBoxFmt( SMinLength, [LowerCase(NumLetras( FMinLength ))], MB_ICONEXCLAMATION );
    //cmbRSocial.SetFocus;
  end
  else
  begin
    { if (sdqDatos.Active and (sdqDatos.FieldByName('EM_NOMBRE').AsString = cmbRSocial.Text) or (cmbRSocial.Text = '')) then
         sSql := GetSql + GetSqlWhere + GetSqlOrderBy
      else }
    if sdqDatos.Active and (cmbRSocial.Text = sdqDatos.FieldByName(EMP_ALIAS_NOMBRE).AsString) then
      sSql := GetSql +
              ' AND ' + FFieldCUIT + ' = ' + SqlString(sdqDatos.FieldByName(EMP_ALIAS_CUIT).AsString, True) +
              GetSqlWhere + GetSqlOrderBy
    else
      sSql := GetSql +
              ' AND ' + FieldNombre + ' LIKE ' + SQL_QUOTE + cmbRSocial.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
              GetSqlWhere + GetSqlOrderBy;

    OpenQuery(sdqDatos, sSql, True);

    if mskCUIT.Text <> '' then
      sdqDatos.Locate(EMP_ALIAS_CUIT, mskCUIT.Text, [])

    else if edContrato.Value > 0 then
      sdqDatos.Locate(EMP_ALIAS_CONTRATO, edContrato.Value, []);
  end;
end;

procedure TfraEmpresa.cmbRSocialGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsVIP then
    AFont.Color := clPurple;

  if IsBaja then
    AFont.Color := clRed;
end;

procedure TfraEmpresa.mskCUITKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbRSocial.DoDropDown ;
end;

procedure TfraEmpresa.Clear;
begin
  SetFontColor(Self, clWindowText);
  cmbRSocial.Clear;
  edContrato.Clear;
  mskCuit.Clear;
  SetearPosicionLabelContrato(False);
  inherited;
end;

function TfraEmpresa.IsBaja: Boolean;
begin
  Result := sdqDatos.Active and (not sdqDatos.IsEmpty) and (sdqDatos.FieldByName(EMP_ALIAS_COBERTURA).AsString <> '1');
end;

function TfraEmpresa.IsVIP: Boolean;
begin
  Result := sdqDatos.Active and (not sdqDatos.IsEmpty) and (sdqDatos.FieldByName(EMP_ALIAS_VIP).AsString = 'S');
end;

procedure TfraEmpresa.SetTrabajador(const Value: TTableID);
var
  Field: TField;
begin
  if FTrabajador <> Value then
  begin
    FTrabajador := Value;
    Field := sdqDatos.FindField('RL_IDTRABAJADOR');
    if not (Assigned(Field) and (Field.AsInteger = FTrabajador)) then
      Clear;
  end;
end;

procedure TfraEmpresa.FrameExit(Sender: TObject);
Var
  bQueryActive,
  bAutoExit: Boolean;
begin
  Inc(iExitCounter);
  bAutoExit := AutoExit;
  AutoExit  := False;
  try
    if not ReadOnly then
    begin
      if (mskCUIT.Text = '') and (edContrato.Text = '') and ClearOnExit then
      begin
        bQueryActive := sdqDatos.Active;
        Clear;
        if bQueryActive and Assigned(FOnChange) then
          FOnChange(Self);
      end
      else
      begin
        if (mskCUIT.Text <> '') and ((not sdqDatos.Active) or (mskCUIT.Text <> sdqDatos.FieldByName( EMP_ALIAS_CUIT ).AsString)) then
          Internal_SetCuit(mskCUIT.Text, True)
        else if (edContrato.Text <> '') and ((not sdqDatos.Active) or (edContrato.Text <> sdqDatos.FieldByName(EMP_ALIAS_CONTRATO).AsString)) then
          Internal_SetContrato(edContrato.Value, True)
        else if not CancelExitLoad then
          LoadValues(False);
      end;
    end;
  finally
    AutoExit := bAutoExit;
    Dec(iExitCounter);
  end;
end;

constructor TfraEmpresa.Create(AOwner: TComponent);
begin
  inherited;
  {$IFNDEF ART2}
  FShowBajas := True;
  {$ENDIF}
  FMinLength         := 2;
  FTrabajador        := ART_EMPTY_ID;
  FTercerizadoras    := False;
  psTablaContrato    := 'ACO_CONTRATO';
  piTopOriginal      := lbContrato.Top;

  if not Assigned(FJvApplicationHotKeyContrato) then //Creo el objeto una sola vez en toda la app...
    FJvApplicationHotKeyContrato := TJvApplicationHotKey.Create(Application.MainForm);

  Hint := 'Presione Ctrl + Shift + F2 para ver la documentación digitalizada';
  ShowHint := True;

  with FJvApplicationHotKeyContrato do
  begin
    HotKey := 24689; {Ctrl + Shift + F2}
    Active := True;
    OnHotKey := HotKeyMethod;
  end;

  FContratoActivo   := True;
  FConfidencialidad := False;
  {$IFNDEF MSACCESS}
  FFieldID            := EMP_FIELD_ID;
  FFieldCUIT          := EMP_FIELD_CUIT;
  FFieldContrato      := EMP_FIELD_CONTRATO;
  FFieldNombre        := EMP_FIELD_NOMBRE;
  FFieldCodReg        := EMP_FIELD_CODREG;
  FFieldBaja          := EMP_FIELD_BAJA;
  FFieldContratoExt   := EMP_FIELD_CONTRATOEXT;
  FFieldIdRegimenOrig := EMP_FIELD_IDTIPOREGIMEN_ORIG;

  {$ELSE}
  FFieldID          := 'MP_ID';
  FFieldCUIT        := 'MP_CUIT';
  FFieldContrato    := 'MP_CONTRATO';
  FFieldNombre      := 'MP_NOMBRE';
  FFieldBaja        := 'MP_FBAJA';
  {$ENDIF}
  cmbRSocial.DataSource := dsDatos;

  {$IFNDEF MSACCESS}
  tslContratos := ValoresSqlEx('SELECT SC_CONTRATO ' +
                                 'FROM COMUNES.CSC_SECTORCONTRATO' + GetDBLink() + ' ' +
                                'WHERE SC_SECTOR = :SECTOR', [Sesion.Sector]);
  {$ENDIF}
  VerTodosRegimenes := False;
end;

function TfraEmpresa.CancelExitLoad: boolean;
begin
  Result := False;
end;

function TfraEmpresa.ClearOnExit: boolean;
begin
  Result := True;
end;

function TfraEmpresa.GetCuit: TCuit;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(EMP_ALIAS_CUIT).AsString
  else
    Result := '';
end;

procedure TfraEmpresa.SetCuit(const Value: TCuit);
begin
  Internal_SetCuit(Value, True);
end;

function TfraEmpresa.GetNombreEmpresa: String;
begin
  Result := cmbRSocial.Text;
end;

function TfraEmpresa.GetCodRegimen: String;
begin
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(EMP_ALIAS_CODREG).AsString
  else
    Result := '';
end;

procedure TfraEmpresa.TimerConfidencialTimer(Sender: TObject);
begin
  inherited;

  if FConfidencialidad then
    FormPadre.Caption := GetTituloPantallaConfidencial(FormPadre.Caption, False);
end;

procedure TfraEmpresa.mskCUITChange(Sender: TObject);
begin
  inherited;

  if FConfidencialidad then
    HabilitarTituloConfidencial(FormPadre, TimerConfidencial, mskCUIT.Text);
end;

procedure TfraEmpresa.HotKeyMethod(Sender: TObject);
begin
{$IFDEF ORACLE}
  if HKContrato > 0 then
    DoCargarImagenesDigitalizadasAfi(Self, HKContrato);
{$ENDIF}
end;

function TfraEmpresa.GetCorreoElectronico: String;
begin
{$IFDEF ORACLE}
  if IsSelected then
    Result := ValorSQLEx('SELECT CO_DIRELECTRONICA FROM ' + psTablaContrato + GetDBLink() + ' WHERE CO_CONTRATO = :CONTRATO', [Contrato])
  else
    Result := '';
{$ELSE}
  Result := '';
{$ENDIF}
end;

function TfraEmpresa.GetRazonSocial: String;
begin
  Result := cmbRSocial.Text;
end;

destructor TfraEmpresa.Destroy;
begin
  {$IFNDEF MSACCESS}
  tslContratos.Free;
  {$ENDIF}
  inherited;
end;

function TfraEmpresa.GetID: Integer;
begin
  {$IFDEF ART2}
  Result := GetValue;
  {$ELSE}
  Result := StrToIntDef(String(GetValue), 0);
  {$ENDIF}
end;

function TfraEmpresa.GetIdRegimen: Integer;
begin
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(EMP_ALIAS_IDTIPOREGIMEN_ORIG).AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraEmpresa.SetID(const Value: Integer);
begin
  SetValue(Value);
end;

procedure TfraEmpresa.SetContratoGuarda;
{$IFNDEF MSACCESS}
var
  sSql: String;
begin
  if not IsEmptyString(edContrato.Text) and Is_ConectadoProduccion then
  begin
    // Si el contrato está en guarda por Afiliaciones, se pinta el texto del contrato...
    sSql := 'SELECT art.afiliacion.is_guardaafiliacion(:contrato, :usuario) FROM DUAL';
    if ValorSqlEx(sSql, [edContrato.Text, Sesion.UserID]) = 'S' then
      edContrato.Color := COLOR_GUARDA
    else
      if Locked then
        edContrato.Color := VCLExtra.LOCK_COLOR
      else
        edContrato.Color := clWindow;
  end;
{$ELSE}
begin
{$ENDIF}
end;

procedure TfraEmpresa.Change;
begin
  SetContratoGuarda;
end;

procedure TfraEmpresa.SetVerTodosRegimenes(const Value: Boolean);
begin
  FVerTodosRegimenes := Value;

  with lbContrato do
    begin
      if FVerTodosRegimenes then
        begin
          psTablaContrato    := 'ACO_CONTRATO_EXT';
          EMP_FIELD_CONTRATO := 'CO_CONTRATOPRINCIPAL';
        end
      else
        begin
          psTablaContrato    := 'ACO_CONTRATO';
          EMP_FIELD_CONTRATO := 'CO_CONTRATO';
        end;

      SetearPosicionLabelContrato(False);
    end;

  FFieldContrato := EMP_FIELD_CONTRATO;
end;

function TfraEmpresa.GetContratoExt: TTableID;
begin
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(EMP_ALIAS_CONTRATOEXT).AsInteger
  else
    Result := ART_EMPTY_ID;
end;

procedure TfraEmpresa.SetearPosicionLabelContrato(VerInfoAdicional: Boolean = False);
begin
  with lbContrato do
    begin
      Caption := LBCONTRATOCAPT;

      if VerInfoAdicional then
        begin
          Top       := piTopOriginal-7;
          Height    := 22;
          Width     := 43;
          WordWrap  := True;
          Alignment := taCenter;
        end
      else
        begin
          Top       := piTopOriginal;
          Height    := 13;
          Width     := 43;
          WordWrap  := False;
          Alignment := taLeftJustify;
        end;
    end;
end;

end.

