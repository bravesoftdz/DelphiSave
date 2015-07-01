unit unFraAfiliado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, ToolEdit, ArtComboBox, StdCtrls, Mask, unSios;

type
  TfraAfiliado = class(TFrame)
    mskCUIL: TMaskEdit;
    cmbNombre: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosID_AFILIADO: TStringField;
    sdqDatosCUIL: TStringField;
    sdqDatosAPELLIDO_NOMBRE: TStringField;
    sdqDatosFECHA_BAJA: TDateTimeField;
    procedure mskCUILKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNombreDropDown(Sender: TObject);
    procedure cmbNombreGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure cmbNombreCloseUp(Sender: TObject);
    procedure mskCUILEnter(Sender: TObject);
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
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String ; OnlyValids : Boolean = False );
    procedure SetColors( AColor : TColor; ABackGround : TColor = -1);
    function  IsSelected : Boolean ;
    property  ShowBajas  : Boolean      read FShowBajas;
  published
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    Property  ReadOnly   : Boolean      read GetReadOnly  write SetReadOnly;
    Property  Sql        : String       read GetSql       write FSql;
    property  Value      : TTableCode   read FValue       write SetValue;
  end;

implementation

uses unDmPrincipal, General, SqlServer;

Const
    BaseSql = 'SELECT ID_AFILIADO, CUIL, APELLIDO + '' '' + NOMBRE AS APELLIDO_NOMBRE, FECHA_BAJA FROM AFILIADO WHERE 1 = 1 ';
    OrderBy = ' ORDER BY APELLIDO, NOMBRE';

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraAfiliado }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.Cargar(ACodigo: String; OnlyValids: Boolean);
Var sSql : String;
begin
     FValue := ACodigo;
     sSql := GetSql + ' AND ID_AFILIADO = ''' + ACodigo + '''' ;

     if OnlyValids Then
        sSql := sSql + IIF(FShowBajas, '', ' AND FECHA_BAJA IS NULL');

     if OpenQuery(sdqDatos, sSql, True) Then
        cmbNombreCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.DoLostFocus;
begin
    if mskCUIL.Focused or cmbNombre.Focused Then begin // Self.Focused
       cmbNombre.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraAfiliado.GetModified: Boolean;
begin
    Result := mskCUIL.Modified or cmbNombre.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraAfiliado.GetReadOnly: Boolean;
begin
   Result := mskCUIL.ReadOnly and cmbNombre.ReadOnly ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraAfiliado.GetSql: String;
begin
   if FSql = '' Then
      Result := BaseSql
   else
      Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraAfiliado.IsSelected: Boolean;
begin
     Result := sdqDatos.Active and
              (Trim(mskCUIL.Text) <> '') and
              (mskCUIL.Text   =  sdqDatosCUIL.AsString) and
              (cmbNombre.Text =  sdqDatosAPELLIDO_NOMBRE.AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.Limpiar;
begin
    mskCUIL.Text   := '';
    cmbNombre.Text := '';
    FValue         := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.SetColors(AColor, ABackGround: TColor);
begin
    mskCUIL.Font.Color   := AColor;
    cmbNombre.Font.Color := AColor;

    if ABackGround <> -1 then begin
       mskCUIL.Color     := ABackGround;
       cmbNombre.Color   := ABackGround;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.SetModified(const Value: Boolean);
begin
    mskCUIL.Modified   := Value ;
    cmbNombre.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.SetReadOnly(const Value: Boolean);
begin
    mskCUIL.ReadOnly    := Value;
    cmbNombre.ReadOnly  := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.mskCUILKeyPress(Sender: TObject; var Key: Char);
Var sSql : String;
begin
     if Key = #13 Then begin
        Case Length( Trim(mskCUIL.Text) ) of
             8:  sSql := GetSql + ' AND NUMERO_DOCUMENTO = ''' + mskCUIL.Text + '''';
             11: sSql := GetSql + ' AND CUIL = ''' + mskCUIL.Text + '''';
        else
             mskCUIL.Text := '';
             Exit;
        end;
        sSql := sSql + IIF(FShowBajas, '', ' AND FECHA_BAJA IS NULL');

        if OpenQuery(sdqDatos, sSql, True) Then
           if sdqDatos.RecordCount > 1 Then
              cmbNombre.DoDropDown( False )
           else
              cmbNombreCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.cmbNombreDropDown(Sender: TObject);
Var sSql : String;
begin
      if (sdqDatos.Active and (sdqDatosAPELLIDO_NOMBRE.AsString = cmbNombre.Text)) Then
          sSql := GetSql + OrderBy
      else
          sSql := GetSql +
                 IIF(cmbNombre.Text = '','', ' AND APELLIDO + '' '' + NOMBRE LIKE ''' + cmbNombre.Text + SQL_WILLCARD + '''') +
                 IIF(FShowBajas,'', ' AND FECHA_BAJA IS NULL') +
                 OrderBy;

      OpenQuery(sdqDatos, sSql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.cmbNombreGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatosFECHA_BAJA.IsNull Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.FrameExit(Sender: TObject);
begin
     if (mskCUIL.Text <> '') Then begin
        if (mskCUIL.Text <> sdqDatosCUIL.AsString) Then
            Cargar( mskCUIL.Text, True )
        else
            cmbNombre.Text := sdqDatosAPELLIDO_NOMBRE.AsString ;
     end else
        cmbNombre.Text := '' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.cmbNombreCloseUp(Sender: TObject);
begin
    FValue         := sdqDatosID_AFILIADO.AsString;
    mskCUIL.Text   := sdqDatosCUIL.AsString ;
    cmbNombre.Text := sdqDatosAPELLIDO_NOMBRE.AsString ;
    if sdqDatosFECHA_BAJA.IsNull Then
       SetColors(clWindowText)
    else
       SetColors(clRed);

    if Assigned(Sender) Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (mskCUIL.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.SetValue(const Value: TTableCode);
begin
  Cargar( Value );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAfiliado.mskCUILEnter(Sender: TObject);
begin
  mskCUIL.SelStart  := 3;
  mskCUIL.SelLength := 8;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
