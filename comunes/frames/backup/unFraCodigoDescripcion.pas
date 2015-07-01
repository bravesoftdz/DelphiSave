unit unFraCodigoDescripcion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, PatternEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, Db,
  SDEngine;

type
  TfraCodigoDescripcion = class(TArtFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FShowBajas: Boolean;
    FSql: String;
    function GetValue: String;
    procedure SetValue(const Value: String);
    function GetIsEmpty: boolean;
    function GetIsSelected: boolean;
  protected
    FFieldCodigo: String;
    FFieldID: String;
    FFieldBaja: String;
    FTableName: String;
    FFieldDesc: String;
    function GetSql: String; virtual;
    function GetSqlOrderBy: String; virtual;
    function GetSqlWhere  : String; virtual;
    procedure SetCodigo(const Value: String; DoChanges : Boolean = False);
    procedure LoadValues( DoChanges : boolean = False); virtual;
  public
    procedure AutoArmar(ATableName : String; HasBaja : Boolean = False); virtual;
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure Reload;
    property  IsSelected     : boolean      read GetIsSelected;
    property  IsEmpty        : boolean      read GetIsEmpty;
  published
    property  ShowBajas      : Boolean      read FShowBajas      write FShowBajas;
    property  Sql            : String       read GetSql          write FSql;
    property  Value          : String       read GetValue        write SetValue;
    property  TableName      : String       read FTableName      write FTableName;
    property  FieldID        : String       read FFieldID        write FFieldID;
    property  FieldCodigo    : String       read FFieldCodigo    write FFieldCodigo;
    property  FieldDesc      : String       read FFieldDesc      write FFieldDesc;
    property  FieldBaja      : String       read FFieldBaja      write FFieldBaja;
  end;

Const
  CD_ALIAS_ID     : String = 'ID';
  CD_ALIAS_CODIGO : String = 'CODIGO';
  CD_ALIAS_DESC   : String = 'DESCRIPCION';
  CD_ALIAS_BAJA   : String = 'BAJA';

implementation

uses unDmPrincipal, General, SqlOracle;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraCodigoDescripcion }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.Clear;
begin
  edCodigo.Text       := '';
  cmbDescripcion.Text := '';

  sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcion.GetSql: String;
begin
  if FSql = '' Then
    Result := 'SELECT ' + FFieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                          FFieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' +
                          FFieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                          FFieldBaja +   ' AS ' + CD_ALIAS_BAJA + ' ' +
                'FROM ' + FTableName +
              ' WHERE 1=1 '
  else
     Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcion.GetValue: String;
begin
   FrameExit( Nil ); // Valida que todo este completo
   if sdqDatos.Active Then
      Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
   else
      Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.SetValue(const Value: String);
Var sSql : String;
begin
   sSql := GetSql + GetSqlWhere + ' AND ' + FFieldID + ' = ' + SqlString( Value, True );

   if OpenQuery(sdqDatos, sSql, True) Then
      LoadValues;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SetCodigo( edCodigo.Text, True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.cmbDescripcionDropDown(Sender: TObject);
Var sSql : String;
begin
      if (sdqDatos.Active and (sdqDatos.FieldByName(CD_ALIAS_DESC).AsString = cmbDescripcion.Text) or (cmbDescripcion.Text = '')) Then
          sSql := GetSql + GetSqlWhere + GetSqlOrderBy
      else
          sSql := GetSql +
                  ' AND ' + SQL_UPPER + '(' + CD_ALIAS_DESC + ') LIKE ' + SQL_UPPER + '(' + SQL_QUOTE + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ') ' +
                  GetSqlWhere + GetSqlOrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcion.GetSqlOrderBy: String;
begin
   Result := ' ORDER BY ' + CD_ALIAS_DESC;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcion.GetSqlWhere: String;
begin
   if FShowBajas Then
      Result := ' AND ' + FFieldBaja + ' IS NOT NULL '
   else
      Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.cmbDescripcionGetCellParams( Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if not sdqDatos.FieldByName(CD_ALIAS_BAJA).IsNull Then
      AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.cmbDescripcionCloseUp(Sender: TObject);
begin
   if cmbDescripcion.Text = '' Then
      Clear
   else
      LoadValues( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraCodigoDescripcion.Create(AOwner: TComponent);
begin
  inherited;
  FTableName     := '';
  FFieldID       := SQL_NULL;
  FFieldCodigo   := SQL_NULL;
  FFieldDesc     := SQL_NULL;
  FFieldBaja     := SQL_NULL;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text = '') Then
        cmbDescripcion.Text := ''
     else begin
        if (edCodigo.Text <> sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString) Then
            SetCodigo( edCodigo.Text )
        else
            cmbDescripcion.Text := sdqDatos.FieldByName(CD_ALIAS_DESC).AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.SetCodigo(const Value: String; DoChanges : Boolean = False);
Var sSql : String;
begin
    sSql := GetSql + GetSqlWhere + ' AND ' + FFieldCodigo + ' = ' + SqlString( Value, True );

    if OpenQuery(sdqDatos, sSql, True) Then
       LoadValues( DoChanges );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_DOWN) and (ssAlt in Shift) then
       cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcion.GetIsEmpty: boolean;
begin
     Result := GetValue = '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcion.GetIsSelected: boolean;
begin
     Result := not GetIsEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.LoadValues(DoChanges: boolean);
begin
    edCodigo.Text       := sdqDatos.FieldByName(CD_ALIAS_CODIGO).AsString ;
    cmbDescripcion.Text := sdqDatos.FieldByName(CD_ALIAS_DESC).AsString ;
    if sdqDatos.FieldByName(CD_ALIAS_BAJA).IsNull Then
       Font.Color := clWindowText
    else
       Font.Color := clRed;

    if DoChanges Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (edCodigo.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.AutoArmar(ATableName: String; HasBaja: Boolean);
begin
    FTableName   := ATableName;
    FFieldID     := 'ID_'  + ATableName;
    FFieldCodigo := 'COD_' + ATableName;
    FFieldDesc   := 'DESC_' + ATableName;

    if HasBaja Then
      FFieldBaja   := 'FECHA_BAJA'
    else
      FFieldBaja   := SQL_NULL;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcion.Reload;
begin
    if sdqDatos.Active Then begin
       sdqDatos.Refresh;
       LoadValues( False );
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
