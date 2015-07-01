unit unFraEmpresa;
{
MODIFICADO POR MARTIN LEFEBVRE
PARA PODER PONER EN PRODUCCION COMISIONES.EXE UTILIZANDO LA
TABLA CMP_EMPRESAS EN LUGAR DE AEM_EMPRESA Y ACO_CONTRATO

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtDbFrame, ToolEdit, ArtComboBox, IntEdit, StdCtrls, Mask, Db,
  SDEngine, Cuit, unArt;

type
  TfraEmpresa = class(TArtDbFrame)
    lbRSocial: TLabel;
    lbContrato: TLabel;
    mskCUIT: TMaskEdit;
    edContrato: TIntEdit;
    cmbRSocial: TArtComboBox;
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure edContratoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRSocialCloseUp(Sender: TObject);
    procedure cmbRSocialDropDown(Sender: TObject);
    procedure cmbRSocialGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mskCUITKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
  private
    FTrabajador: TTableID;
    FMinLength: Integer;
    FFieldContrato: String;
    FFieldCUIT: String;
    FFieldNombre: String;
    FFieldBaja: String;
    FFieldId: String;
    procedure SetTrabajador(const Value: TTableID);
    function GetContrato: TTableID;
    procedure SetContrato(const Value: TTableID);
  protected
    function GetValue: TTableID; override;
    procedure SetValue(const Value: TTableID); override;
    function GetSql: String; override;
    function GetSqlOrderBy: String; override;
    function GetSqlWhere  : String; override;
    function IsBaja : Boolean; override;

    procedure SetEditorsValues; virtual;

    function ClearOnExit : boolean; virtual;
    function CancelExitLoad : boolean; virtual; {Se usa antes del exists, para si se hereda este frame y se agregan controles, chequee los datos }

    procedure LoadValues( DoChanges : boolean = False); override;

    procedure Internal_SetCuit(ACuit : TCuit; DoChanges : Boolean = False);
    procedure Internal_SetContrato(AContrato : TTableID; DoChanges : Boolean = False);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
  published
    property Trabajador : TTableID     read FTrabajador   write SetTrabajador  default ART_EMPTY_ID; { Esto nunca se probó }
    property Contrato   : TTableID     read GetContrato   write SetContrato    default ART_EMPTY_ID; { Esto nunca se probó }
    property MinLength  : Integer      read FMinLength    write FMinLength     default 2;
    property Value;

    property FieldId        : String       read FFieldId        write FFieldId;
    property FieldCUIT      : String       read FFieldCUIT      write FFieldCUIT;
    property FieldContrato  : String       read FFieldContrato  write FFieldContrato;
    property FieldNombre    : String       read FFieldNombre    write FFieldNombre;
    property FieldBaja      : String       read FFieldBaja      write FFieldBaja;
  end;

Const
  { Nombres por default de los campos }
  EMP_FIELD_ID        : String = 'MP_CUIT';
  EMP_FIELD_CUIT      : String = 'MP_CUIT';
  EMP_FIELD_CONTRATO  : String = 'MP_CONTRATO';
  EMP_FIELD_NOMBRE    : String = 'MP_NOMBRE';
  EMP_FIELD_BAJA      : String = 'MP_FBAJA';

  { Alias de los campos }
  EMP_ALIAS_ID        : String = 'ID';
  EMP_ALIAS_CUIT      : String = 'CUIT';
  EMP_ALIAS_CONTRATO  : String = 'CONTRATO';
  EMP_ALIAS_NOMBRE    : String = 'NOMBRE';
  EMP_ALIAS_BAJA      : String = 'FECHA_BAJA';

implementation

uses AnsiSQL, unDmPrincipal, General, Numeros;
{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraEmpresa }
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.GetSql: String;
begin
  if FSql <> '' Then
     Result := inherited GetSql
  else begin
     if FTrabajador <> ART_EMPTY_ID Then
        Result := 'SELECT ' + SqlAlias(FieldId,       EMP_ALIAS_ID)       + ', ' +
                              SqlAlias(FieldCuit,     EMP_ALIAS_CUIT)     + ', ' +
                              SqlAlias(FieldNombre,   EMP_ALIAS_NOMBRE)   + ', ' +
                              SqlAlias(FieldContrato, EMP_ALIAS_CONTRATO) + ', ' +
                              SqlAlias(FieldBaja,     EMP_ALIAS_BAJA)     + ' '  +
                    'FROM CMP_EMPRESAS, ART.CRL_RELACIONLABORAL ' +
                     'AND RL_CONTRATO = MP_CONTRATO ' +
                     'AND RL_IDTRABAJADOR = ' + SqlInt( FTrabajador )
     else
        Result := 'SELECT ' + SqlAlias(FieldId,       EMP_ALIAS_ID)       + ', ' +
                              SqlAlias(FieldCuit,     EMP_ALIAS_CUIT)     + ', ' +
                              SqlAlias(FieldNombre,   EMP_ALIAS_NOMBRE)   + ', ' +
                              SqlAlias(FieldContrato, EMP_ALIAS_CONTRATO) + ', ' +
                              SqlAlias(FieldBaja,     EMP_ALIAS_BAJA)     + ' '  +
                    'FROM CMP_EMPRESAS ';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.GetSqlOrderBy: String;
begin
   Result := ' ORDER BY ' + SqlSimpleAlias(EMP_ALIAS_NOMBRE) + ', ' + SqlSimpleAlias(EMP_ALIAS_CONTRATO);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.GetSqlWhere: String;
begin
   if FShowBajas Then
      Result := ''
   else
      Result := ' AND ' + FFieldBaja + ' IS NULL';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.GetValue: TTableID;
begin
   FrameExit( Nil ); // Valida que todo este completo
   if sdqDatos.Active Then
      Result := sdqDatos.FieldByName( EMP_ALIAS_ID ).AsInteger
   else
      Result := ART_EMPTY_ID;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.GetContrato: TTableID;
begin
   FrameExit( Nil ); // Valida que todo este completo
   if sdqDatos.Active Then
      Result := sdqDatos.FieldByName(EMP_FIELD_CONTRATO).AsInteger
   else
      Result := ART_EMPTY_ID;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.SetContrato(const Value: TTableID);
begin
  if (not sdqDatos.Active) or (sdqDatos.FieldByName(EMP_FIELD_CONTRATO).AsInteger <> Value) then
     Internal_SetContrato( Value, False );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.SetValue(const Value: TTableID);
Var sSql : String;
begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FFieldID + ' = ' + SqlInt( Value );

    if OpenQuery(sdqDatos, sSql, True) Then
       LoadValues( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.Internal_SetContrato(AContrato: TTableID; DoChanges : Boolean = False);
Var sSql : String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FFieldContrato + ' = ' + SqlInt( AContrato );

  if OpenQuery(sdqDatos, sSql, True) Then begin
    if sdqDatos.RecordCount > 1 Then
      cmbRSocial.DoDropDown( False )
    else
      LoadValues( DoChanges );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.Internal_SetCuit(ACuit: TCuit; DoChanges : Boolean = False);
Var sSql : String;
begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FFieldCUIT + ' = ' + SqlString( ACuit, True );

    if OpenQuery(sdqDatos, sSql, True) Then
       LoadValues( DoChanges );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.mskCUITKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (not mskCUIT.ReadOnly) then
      Internal_SetCuit( mskCUIT.Text, True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.edContratoKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (not edContrato.ReadOnly) then
      Internal_SetContrato( edContrato.Value, True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.SetEditorsValues;
begin
    mskCuit.Text        := sdqDatos.FieldByName( EMP_ALIAS_CUIT ).AsString ;
    cmbRSocial.Text     := sdqDatos.FieldByName( EMP_ALIAS_NOMBRE ).AsString ;
    edContrato.Text     := sdqDatos.FieldByName( EMP_ALIAS_CONTRATO ).AsString ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.LoadValues(DoChanges: boolean);
begin
    SetEditorsValues;
    if IsBaja Then
       Font.Color := clRed
    else
       Font.Color := clWindowText;

    if DoChanges Then begin
       if Assigned(FOnChange) Then
          FOnChange( Self );

       if (mskCuit.Text <> '') Then {Se se cragaron los datos}
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.cmbRSocialCloseUp(Sender: TObject);
begin
   if cmbRSocial.Text = '' Then
      Clear
   else
      LoadValues( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.cmbRSocialDropDown(Sender: TObject);
Var sSql : String;
begin
    if (Length(Trim( cmbRSocial.Text )) < FMinLength) Then begin
        Clear;
        MsgBox( 'Debe ingresar como mínimo ' + LowerCase(NumLetras( FMinLength )) + ' caracteres.', MB_ICONEXCLAMATION );
        cmbRSocial.SetFocus;
    end else begin
       { if (sdqDatos.Active and (sdqDatos.FieldByName('EM_NOMBRE').AsString = cmbRSocial.Text) or (cmbRSocial.Text = '')) Then
            sSql := GetSql + GetSqlWhere + GetSqlOrderBy
        else }
        sSql := GetSql +
                ' AND ' + FieldNombre + ' LIKE ' + SQL_QUOTE + cmbRSocial.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
                GetSqlWhere + GetSqlOrderBy;

        OpenQuery(sdqDatos, sSql, True);

        if mskCUIT.Text <> '' Then
           sdqDatos.Locate( EMP_ALIAS_CUIT, mskCUIT.Text, [])

        else if edContrato.Value > 0 Then
           sdqDatos.Locate( EMP_ALIAS_CONTRATO, edContrato.Value, []);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.cmbRSocialGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if IsBaja Then
      AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.mskCUITKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_DOWN) and (ssAlt in Shift) then
      cmbRSocial.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.Clear;
begin
   mskCuit.Text    := '';
   cmbRSocial.Text := '';
   edContrato.Text := '';
   inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.IsBaja: Boolean;
begin
   Result := not sdqDatos.FieldByName( EMP_ALIAS_BAJA ).IsNull;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.SetTrabajador(const Value: TTableID);
Var Field : TField;
begin
  if FTrabajador <> Value Then begin
     FTrabajador := Value;
     Field := sdqDatos.FindField( 'RL_IDTRABAJADOR' );
     if not (Assigned(Field) and (Field.AsInteger = FTrabajador)) Then
        Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpresa.FrameExit(Sender: TObject);
Var
  bAutoExit : Boolean;
begin
  bAutoExit := AutoExit;
  AutoExit  := False;
  if not ReadOnly Then
    try
      if (mskCUIT.Text = '') and (edContrato.Text = '') and ClearOnExit Then
        Clear
      else begin
        if (mskCUIT.Text <> '') and ((not sdqDatos.Active) or (mskCUIT.Text <> sdqDatos.FieldByName( EMP_ALIAS_CUIT ).AsString)) Then
            Internal_SetCuit( mskCUIT.Text, True )
        else if (edContrato.Text <> '') and ((not sdqDatos.Active) or (edContrato.Text <> sdqDatos.FieldByName( EMP_ALIAS_CONTRATO ).AsString)) Then
            Internal_SetContrato( edContrato.Value, True )
        else if not CancelExitLoad Then
            LoadValues( True );
      end;
    finally
      AutoExit := bAutoExit;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraEmpresa.Create(AOwner: TComponent);
begin
  inherited;
  FMinLength     := 2;
  FTrabajador    := ART_EMPTY_ID;

  FFieldID        := EMP_FIELD_ID;
  FFieldCUIT      := EMP_FIELD_CUIT;
  FFieldContrato  := EMP_FIELD_CONTRATO;
  FFieldNombre    := EMP_FIELD_NOMBRE;
  FFieldBaja      := EMP_FIELD_BAJA;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.CancelExitLoad: boolean;
begin
  Result := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpresa.ClearOnExit: boolean;
begin
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
