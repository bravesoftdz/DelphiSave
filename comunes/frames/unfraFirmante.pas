{ Selección del Firmante de la tabla CDF_FIRMASCARTASDOC }
unit unfraFirmante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit;

type
  TfraFirmante = class(TFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosDF_CODFIRMA: TStringField;
    sdqDatosDF_USUARIO: TStringField;
    sdqDatosDF_CARACTER: TStringField;
    sdqDatosDF_TIPONRODOC: TStringField;
    sdqDatosDF_FBAJA: TDateTimeField;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FShowBajas: Boolean;
    FEspecial : Integer;
    FOnChange : TNotifyEvent;
    function  SqlWhere : String;
    function  GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    procedure SetEspecial(const Value: Integer);
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String; OnlyValids : Boolean = False );
    procedure SetColors( AColor : TColor);
  published
    property  ShowBajas  : Boolean      read FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
    property  Especial   : Integer      read FEspecial    write SetEspecial;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General;

Const
    BaseSql = 'SELECT DF_CODFIRMA, DF_USUARIO, DF_CARACTER, DF_TIPONRODOC, DF_FBAJA FROM CDF_FIRMASCARTASDOC '  ;
    OrderBy = ' ORDER BY DF_USUARIO';
{----------------------------------------------------------------------------------------------------------------------}
{ TfraFirmante }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.Cargar(ACodigo: String; OnlyValids: Boolean);
Var Sql : String;
begin
     Sql := BaseSql + ' WHERE DF_CODFIRMA = ''' + ACodigo + '''' +
                      IIF(OnlyValids, SqlWhere, '');

     if OpenQuery(sdqDatos, Sql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.DoLostFocus;
begin
    if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
       cmbDescripcion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFirmante.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFirmante.SqlWhere: String;
begin
// By Fede 29/05/2001     Result := IIF(FEspecial > 0, '', ' AND SUBSTR(DF_ESPECIAL, ' + IntToStr(FEspecial) + ', 1) = ''S''' ) +
     Result := IIF(FEspecial = 0, '', ' AND SUBSTR(DF_ESPECIAL, ' + IntToStr(FEspecial) + ', 1) = ''S''' ) +
               IIF(FShowBajas   , '', ' AND DF_FBAJA IS NULL');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatosDF_USUARIO.AsString = cmbDescripcion.Text)) Then
          Sql := BaseSql + ' WHERE 1=1 ' + SqlWhere + OrderBy
      else
          Sql := BaseSql +
                 ' WHERE UPPER(DF_USUARIO) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
                 SqlWhere + OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosDF_CODFIRMA.AsString ;
    cmbDescripcion.Text := sdqDatosDF_USUARIO.AsString ;
    if sdqDatosDF_FBAJA.IsNull Then
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
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := BaseSql +
               ' WHERE DF_CODFIRMA = ''' + edCodigo.Text + '''' +
               SqlWhere;
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatosDF_FBAJA.IsNull Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') Then begin
        if (edCodigo.Text <> sdqDatosDF_CODFIRMA.AsString) Then
            Cargar( edCodigo.Text, True )
        else
            cmbDescripcion.Text := sdqDatosDF_USUARIO.AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.SetEspecial(const Value: Integer);
begin
   if FEspecial <> Value then begin
      FEspecial := Value;
      if sdqDatos.Active then
         Limpiar;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFirmante.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
