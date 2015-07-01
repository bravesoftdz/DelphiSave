unit unFraEmpleador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, ToolEdit, ArtComboBox, StdCtrls, Mask, unSios;

type
  TfraEmpleador = class(TFrame)
    mskCUIT: TMaskEdit;
    cmbNombre: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosID_EMPLEADOR: TStringField;
    sdqDatosCUIT: TStringField;
    sdqDatosRAZON_SOCIAL: TStringField;
    sdqDatosFECHA_BAJA: TDateTimeField;
    procedure mskCUITKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure cmbNombreGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure cmbNombreCloseUp(Sender: TObject);
  private
    FShowBajas: Boolean;
    FSql: String;
    FOnChange: TNotifyEvent;
    FValue: TTableCode;
    function GetModified: Boolean;
    function GetReadOnly: Boolean;
    function GetSql: String;
    procedure SetModified(const Value: Boolean);
    procedure SetReadOnly(const Value: Boolean);
    procedure SetValue(const Value: TTableCode);
  protected
  public
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1);
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : TTableCode ; OnlyValids : Boolean = False );
    function IsSelected : Boolean ;
  published
    property  ShowBajas  : Boolean      read FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    Property  ReadOnly   : Boolean      read GetReadOnly  write SetReadOnly;
    Property  Sql        : String       read GetSql       write FSql;
    property  Value      : TTableCode   read FValue       write SetValue;
  end;

implementation

uses unDmPrincipal, General, SqlServer;

Const
    BaseSql = 'SELECT ID_EMPLEADOR, CUIT, RAZON_SOCIAL, FECHA_BAJA FROM EMPLEADOR WHERE 1 = 1 ';
    OrderBy = ' ORDER BY RAZON_SOCIAL';

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraAfiliado }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.Cargar(ACodigo: TTableCode; OnlyValids: Boolean);
Var sSql : String;
begin
     sSql := GetSql + ' AND ID_EMPLEADOR = ''' + ACodigo + '''' ;

     if OnlyValids Then
        sSql := sSql + IIF(FShowBajas, '', ' AND FECHA_BAJA IS NULL');

     if OpenQuery(sdqDatos, sSql, True) Then
        cmbNombreCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.DoLostFocus;
begin
    if mskCUIT.Focused or cmbNombre.Focused Then begin // Self.Focused
       cmbNombre.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpleador.GetModified: Boolean;
begin
    Result := mskCUIT.Modified or cmbNombre.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpleador.GetReadOnly: Boolean;
begin
   Result := mskCUIT.ReadOnly and cmbNombre.ReadOnly ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpleador.GetSql: String;
begin
   if FSql = '' Then
      Result := BaseSql
   else
      Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraEmpleador.IsSelected: Boolean;
begin
   Result := sdqDatos.Active and
            (Trim(mskCUIT.Text) <> '') and
            (mskCUIT.Text   = sdqDatosCUIT.AsString) and
            (cmbNombre.Text = sdqDatosRAZON_SOCIAL.AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.Limpiar;
begin
    mskCUIT.Text   := '';
    cmbNombre.Text := '';
    FValue         := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.SetColors(AColor, ABackGround: TColor);
begin
    mskCUIT.Font.Color   := AColor;
    cmbNombre.Font.Color := AColor;

    if ABackGround <> -1 then begin
       mskCUIT.Color     := ABackGround;
       cmbNombre.Color   := ABackGround;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.SetModified(const Value: Boolean);
begin
    mskCUIT.Modified   := Value ;
    cmbNombre.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.SetReadOnly(const Value: Boolean);
begin
    mskCUIT.ReadOnly    := Value;
    cmbNombre.ReadOnly  := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.mskCUITKeyPress(Sender: TObject; var Key: Char);
Var sSql : String;
begin
     if (Key = #13) and (Length( mskCUIT.Text ) = 11) Then begin
        sSql := GetSql +
                ' AND CUIT = ''' + mskCUIT.Text + '''' +
                IIF(FShowBajas, '', ' AND FECHA_BAJA IS NULL');

        if OpenQuery(sdqDatos, sSql, True) Then
           cmbNombreCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.cmbNombreDropDown(Sender: TObject);
Var sSql : String;
begin
      if (sdqDatos.Active and (sdqDatosRAZON_SOCIAL.AsString = cmbNombre.Text)) Then
          sSql := GetSql + OrderBy
      else
          sSql := GetSql +
                 ' AND RAZON_SOCIAL LIKE ''' + cmbNombre.Text + SQL_WILLCARD + '''' +
                 IIF(FShowBajas,'', ' AND FECHA_BAJA IS NULL') +
                 OrderBy;

      OpenQuery(sdqDatos, sSql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.cmbNombreGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if not sdqDatosFECHA_BAJA.IsNull Then
      AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.FrameExit(Sender: TObject);
begin
   if (mskCUIT.Text <> '') Then begin
      if (mskCUIT.Text <> sdqDatosCUIT.AsString) Then
          Cargar( mskCUIT.Text, True )
      else
          cmbNombre.Text := sdqDatosRAZON_SOCIAL.AsString ;
   end else
      cmbNombre.Text := '' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.cmbNombreCloseUp(Sender: TObject);
begin
    FValue         := sdqDatosID_EMPLEADOR.AsString; 
    mskCUIT.Text   := sdqDatosCUIT.AsString ;
    cmbNombre.Text := sdqDatosRAZON_SOCIAL.AsString ;
    if sdqDatosFECHA_BAJA.IsNull Then
       SetColors(clWindowText)
    else
       SetColors(clRed);

    if Assigned(Sender) Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (mskCUIT.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraEmpleador.SetValue(const Value: TTableCode);
begin
  Cargar( Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
