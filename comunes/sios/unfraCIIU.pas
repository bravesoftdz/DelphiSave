unit unfraCIIU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, Db, SDEngine, PatternEdit,
  unSios;

type
  TfraCIIU = class(TFrame)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    sdqDatosID_ACTIVIDAD: TStringField;
    sdqDatosCIIU: TStringField;
    sdqDatosDESC_ACTIVIDAD: TStringField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    FSql: String;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetSql: String;
    procedure SetSql(const Value: String);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    function GetValue: TTableCode;
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : TTableCode );
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1);
    function IsSelected : Boolean ;
  published
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    Property  Sql        : String       read GetSql       write SetSql;
    Property  ReadOnly   : Boolean      read GetReadOnly  write SetReadOnly;
    property  Value      : TTableCode   read GetValue     write Cargar;
  end;

implementation
{$R *.DFM}

uses unDmPrincipal, General, SqlServer;

Const
    OrderBy = ' ORDER BY DESC_ACTIVIDAD';
{----------------------------------------------------------------------------------------------------------------------}
{ TfraRiesgo }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.Cargar(ACodigo: TTableCode);
Var sSql : String;
begin
     sSql := GetSql + ' AND ID_ACTIVIDAD = ''' + ACodigo + '''';
     if OpenQuery(sdqDatos, sSql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.DoLostFocus;
begin
    if edCodigo.Focused or cmbDescripcion.Focused Then begin
       cmbDescripcion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCIIU.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.SetColors(AColor: TColor; ABackGround : TColor = -1);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
    if ABackGround <> -1 then begin
       edCodigo.Color       := ABackGround;
       cmbDescripcion.Color := ABackGround;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosCIIU.AsString ;
    cmbDescripcion.Text := sdqDatosDESC_ACTIVIDAD.AsString ;

    if Assigned(Sender) Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (edCodigo.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var sSql : String;
begin
     if Key = #13 Then begin
        sSql := GetSql +
                ' AND CIIU = ''' + edCodigo.Text + '''';
        if OpenQuery(sdqDatos, sSql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.cmbDescripcionDropDown(Sender: TObject);
Var sSql : String;
begin
      if (not (sdqDatos.Active and (sdqDatosDESC_ACTIVIDAD.AsString = cmbDescripcion.Text))) or (cmbDescripcion.Text = '') Then begin
         if (cmbDescripcion.Text = '') then
             sSql := GetSql + OrderBy
         else
             sSql := GetSql +
                     ' AND UPPER(DESC_ACTIVIDAD) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
                     OrderBy;

         OpenQuery(sdqDatos, sSql, True);
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text = '') then begin
         Limpiar;

         if Assigned(FOnChange) Then
            OnChange( Self );
     end else if (edCodigo.Text <> sdqDatosCIIU.AsString) Then
         Cargar( edCodigo.Text );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCIIU.GetSql: String;
begin
     if FSql = '' Then
        Result := 'SELECT ID_ACTIVIDAD, CIIU, DESC_ACTIVIDAD ' +
                    'FROM ACTIVIDAD ' +
                   'WHERE ' + SQL_LENGTH + '(CIIU) = 6 '
     else
        Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.SetSql(const Value: String);
begin
     if FSql <> Value then begin
        FSql := Value;
        sdqDatos.Close ;
        //Limpiar ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCIIU.GetReadOnly: Boolean;
begin
    Result := edCodigo.ReadOnly and cmbDescripcion.ReadOnly;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIIU.SetReadOnly(const Value: Boolean);
begin
    edCodigo.ReadOnly       := Value;
    cmbDescripcion.ReadOnly := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCIIU.IsSelected: Boolean;
begin
   Result := sdqDatos.Active and
            (Trim(edCodigo.Text) <> '') and
            (edCodigo.Text       = sdqDatosCIIU.AsString) and
            (cmbDescripcion.Text = sdqDatosDESC_ACTIVIDAD.AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCIIU.GetValue: TTableCode;
begin
   if sdqDatos.Active Then
      Result := sdqDatosID_ACTIVIDAD.AsString
   else
      Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
