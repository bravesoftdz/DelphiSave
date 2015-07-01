{Recosn}
unit unfraVendedoresCUIT;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraVendedores, Db, SDEngine, PatternEdit, StdCtrls, Mask, 
  ArtComboBox, unART, unfraCodigoDescripcion, Cuit, RxToolEdit;

type
  TfraVendedoresCUIT = class(TfraVendedores)
    lbRSocial: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    mskCuit: TMaskEdit;
    procedure mskCuitKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
    procedure mskCuitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskCuitExit(Sender: TObject);
  private
    FSql             : string;
    FEntidadVendedor : TTableId;
    function  GetCUIT: String;
    {$IFNDEF ART2}
    function  GetValue: TTableId; reintroduce;
    procedure SetValue(const Value: TTableId); reintroduce;
    {$ENDIF}
    function  GetIDVendedor: TTableId;    
  protected
    function  GetSql: String; override;
    procedure LoadValues( DoChanges : boolean = False); override;
    procedure Internal_SetCuit(ACuit: TCuit);
  public
    procedure Clear; override;
  published
    property Sql              : String   read GetSql  write FSql;
    property CUIT             : String   read GetCUIT;
    property EntidadVendedor  : TTableId read FEntidadVendedor;
    {$IFNDEF ART2}
    property Value            : TTableId read GetValue     write SetValue;
    {$ENDIF}
    property IDVendedor       : TTableId read GetIDVendedor;    
  end;

implementation

{$R *.DFM}
uses
  unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs;

const
  CD_ALIAS_CUIT: String = 'CUIT';

{----------------------------------------------------------------------------------------------------------------------}
function TfraVendedoresCUIT.GetCUIT: String;
begin
  FrameExit( Nil ); // Valida que todo este completo
  if sdqDatos.Active Then
    Result := sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraVendedoresCUIT.GetSql: String;
var
  sCadena: string;
  bCambios: Boolean;
begin
  bCambios := False;

  if (mskCUIT.Text > '') and (mskCUIT = Screen.ActiveControl) then
    begin
      sCadena := ' AND VE_CUIT like ''' + mskCuit.Text + '%''';
      ExtraCondition := ExtraCondition + sCadena;
      bCambios := True;
    end;

  Result := inherited GetSql;
  AddField(Result, 'VE_CUIT', CD_ALIAS_CUIT);

  if bCambios then
    ExtraCondition := Copy(ExtraCondition, 1, Length(ExtraCondition) - Length(sCadena));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.LoadValues(DoChanges: boolean);
begin
  mskCuit.Text := sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString ;

  if sdqDatos.Active and (FEntidad <> ART_EMPTY_ID) then
    FEntidadVendedor := sdqDatos.FieldByName('EV_ID').AsInteger
  else
    FEntidadVendedor := ART_EMPTY_ID;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.mskCuitKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Internal_SetCuit(mskCUIT.Text);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.Internal_SetCuit(ACuit: TCuit);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere +
          ' AND VE_CUIT = ' + SqlValue(ACuit);

  if OpenQuery(sdqDatos, sSql, True) Then
     LoadValues( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.FrameExit(Sender: TObject);
begin
  if not ReadOnly Then begin
    if not IsSelected Then
      Clear
    else if (mskCUIT.Text <> '') and ((not sdqDatos.Active) or (mskCUIT.Text <> sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString)) Then
      Internal_SetCuit( mskCUIT.Text )
    else if (not sdqDatos.Active) or (edCodigo.Text <> sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString) Then
      SetCodigo( edCodigo.Text, True )
    else
    begin
      edCodigo.Text       := sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString;
      mskCuit.Text        := sdqDatos.FieldByName(CD_ALIAS_CUIT).AsString;
      cmbDescripcion.Text := sdqDatos.FieldByName(CD_ALIAS_DESC).AsString;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.Clear;
begin
  mskCuit.Clear;
  FEntidadVendedor := ART_EMPTY_ID;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
{$IFNDEF ART2}
function TfraVendedoresCUIT.GetValue: TTableId;
begin
  Result := StrToIntDef(inherited Value, ART_EMPTY_ID);
end;

procedure TfraVendedoresCUIT.SetValue(const Value: TTableId);
begin
  inherited Value := IntToStr(Value);
end;
{$ENDIF}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.mskCuitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DoDropDown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraVendedoresCUIT.mskCuitExit(Sender: TObject);
begin
  inherited;
  
  if Length(mskCUIT.Text) = 11 then
    Verificar(not IsCUIT(mskCUIT.Text), mskCUIT, 'El número de CUIT ingresado no es válido.');
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraVendedoresCUIT.GetIDVendedor: TTableId;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsInteger
  else
    Result := ART_EMPTY_ID;
end;                              
{----------------------------------------------------------------------------------------------------------------------}
end.
