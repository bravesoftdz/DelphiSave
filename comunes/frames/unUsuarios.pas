unit unUsuarios;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, ArtComboBox, StdCtrls, PatternEdit, Db, SDEngine;

type
  TfraUsuario = class(TFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TArtComboBox;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    sdqDatosIT_CODIGO: TStringField;
    sdqDatosIT_NOMBRE: TStringField;
    sdqDatosIT_PRESTADORA: TStringField;
    sdqDatosIT_FECHABAJA: TDateTimeField;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FrameExit(Sender: TObject);
  private
    FOnChange: TNotifyEvent;
    FShowBajas: Boolean;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String );
    procedure SetColors( AColor : TColor);
  published
    property  ShowBajas  : Boolean      read FShowBajas;
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
  end;

implementation
{$R *.DFM}

uses unDmPrincipal, General;

Const
    BaseSql = 'SELECT IT_CODIGO, IT_NOMBRE, IT_PRESTADORA, IT_FECHABAJA FROM PIT_FIRMANTES ';
    OrderBy = ' ORDER BY IT_NOMBRE';
{----------------------------------------------------------------------------------------------------------------------}
{ TfraPreventor }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.Cargar(ACodigo: String);
Var Sql : String;
begin
     Sql := BaseSql + ' WHERE IT_CODIGO = ''' + ACodigo + ''''; // Permite Cargar dados de Baja
     if OpenQuery(sdqDatos, Sql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.DoLostFocus;
begin
    if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
       cmbDescripcion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraUsuario.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatosIT_CODIGO.AsString ;
    cmbDescripcion.Text := sdqDatosIT_NOMBRE.AsString ;
    if sdqDatosIT_FECHABAJA.IsNull Then
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
procedure TfraUsuario.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := BaseSql +
               ' WHERE IT_CODIGO = ''' + edCodigo.Text + '''' +
               IIF(FShowBajas,'', ' AND IT_FECHABAJA IS NULL');
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatosIT_NOMBRE.AsString = cmbDescripcion.Text)) Then
          Sql := BaseSql + OrderBy
      else
          Sql := BaseSql +
                 ' WHERE UPPER(IT_NOMBRE) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
                 IIF(FShowBajas,'', ' AND IT_FECHABAJA IS NULL') +
                 OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.cmbDescripcionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if not sdqDatosIT_FECHABAJA.IsNull Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraUsuario.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') and (edCodigo.Text <> sdqDatosIT_CODIGO.AsString) Then begin
         Cargar( edCodigo.Text );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
