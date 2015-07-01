{ CTB_TABLAS }
unit unFraCtbTablas;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine;

type
  TfraCtbTablas = class(TFrame)
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosTB_CODIGO: TStringField;
    sdqDatosTB_DESCRIPCION: TStringField;
    sdqDatosTB_ESPECIAL1: TStringField;
    sdqDatosTB_BAJA: TStringField;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOnChange  : TNotifyEvent;
    FShowBajas : Boolean;
    FSql       : String;
    FClave     : String;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetSql: String;
    function GetValue: String;
    procedure SetValue(const Value: String);
  protected
    function  SqlWhere : String;
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String; OnlyValids : Boolean = False );
    procedure SetColors( AColor : TColor);
  published
    property  ShowBajas  : Boolean      read FShowBajas   write FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    Property  Sql        : String       read GetSql       write FSql;
    Property  Clave      : String       read FClave       write FClave;
    property  Value      : String       read GetValue     write SetValue;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General;

Const
    OrderBy = ' ORDER BY TB_DESCRIPCION';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraSubPrestacion }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.Cargar(ACodigo: String; OnlyValids : Boolean = False );
Var sSql : String;
begin
     sSql := GetSql + SqlWhere + ' AND TB_CODIGO = ''' + ACodigo + '''' ;

     if OpenQuery(sdqDatos, sSql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.DoLostFocus;
begin
    Try
      if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
         cmbDescripcion.SetFocus ;
         SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    Except
    End;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCtbTablas.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCtbTablas.SqlWhere: String;
begin
     Result := IIF(FShowBajas   , '', ' AND TB_BAJA <> ''S'' ');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatosTB_DESCRIPCION.AsString = cmbDescripcion.Text) or (cmbDescripcion.Text = '')) Then
          Sql := GetSql + SqlWhere + OrderBy
      else
          Sql := GetSql +
                 ' AND UPPER(TB_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'') ' +
                 SqlWhere + OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.cmbDescripcionCloseUp(Sender: TObject);
begin
    if (cmbDescripcion.Text = '') and (Sender = cmbDescripcion) Then
        Limpiar
    else begin
        edCodigo.Text       := sdqDatosTB_CODIGO.AsString ;
        cmbDescripcion.Text := sdqDatosTB_DESCRIPCION.AsString ;
        if sdqDatosTB_BAJA.AsString <> 'S' Then
           SetColors(clWindowText)
        else
           SetColors(clRed);

        if Assigned(Sender) Then begin
           if Assigned(FOnChange) Then
              OnChange( Self );

           if (edCodigo.Text <> '') Then
              DoLostFocus;
        end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := GetSql +
               ' AND TB_CODIGO = ''' + edCodigo.Text + '''' +
               SqlWhere;
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not (sdqDatosTB_BAJA.AsString <> 'S') Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text = '') Then
        cmbDescripcion.Text := ''
     else begin
        if (edCodigo.Text <> sdqDatosTB_CODIGO.AsString) Then
            Cargar( edCodigo.Text, True )
        else
            cmbDescripcion.Text := sdqDatosTB_DESCRIPCION.AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCtbTablas.GetSql: String;
begin
  if FSql = '' Then
    Result := 'SELECT TB_CODIGO, TB_DESCRIPCION, TB_BAJA, TB_ESPECIAL1 ' +
                'FROM CTB_TABLAS ' +
               'WHERE TB_CLAVE = ''' + FClave + ''' ' +
                 'AND TB_CODIGO <> ''0'' '
  else
     Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCtbTablas.GetValue: String;
begin
     FrameExit( Nil );
     Result := edCodigo.Text ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetValue(const Value: String);
begin
     Cargar( Value, False );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
