unit unfraFormCartasDocTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PatternEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, Db, SDEngine;

type
  TfraFormCartasDocTrab = class(TFrame)
    sdqDatos: TSDQuery;
    dsFEmpresa: TDataSource;
    cmbDescripcion: TArtComboBox;
    edCodigo: TPatternEdit;
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOnChange: TNotifyEvent;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
  public
    procedure Limpiar;
    procedure DoLostFocus;
    procedure Cargar( ACodigo : String );
    procedure SetColors( AColor : TColor);
  published
    Property  OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    Property  Modified   : Boolean      read GetModified  write SetModified;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General;

Const
    BaseSql = 'SELECT TT_FORMATO, TT_DESCRIPCION, TT_FORMATOEMPRESA, DT_DESCRIPCION ' +
                'FROM CTT_TEXTOSCARTASDOCTRAB, CDT_TEXTOSCARTASDOC ' +
               'WHERE TT_FORMATOEMPRESA = DT_FORMATO ' +
                 'AND DT_FORMATO LIKE ''AB%'' ' ;
    OrderBy = ' ORDER BY TT_DESCRIPCION';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraFormCartasDoc }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.Cargar(ACodigo: String);
Var Sql : String;
begin
     Sql := BaseSql + ' AND TT_FORMATO = ''' + ACodigo + '''' ;

     if OpenQuery(sdqDatos, Sql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.DoLostFocus;
begin
    if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
       cmbDescripcion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFormCartasDocTrab.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatos.FieldByName('TT_FORMATO').AsString ;
    cmbDescripcion.Text := sdqDatos.FieldByName('TT_DESCRIPCION').AsString ;

    if Assigned(Sender) Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (edCodigo.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') Then begin
        if (edCodigo.Text <> sdqDatos.FieldByName('TT_FORMATO').AsString) Then
            Cargar( edCodigo.Text )
        else
            cmbDescripcion.Text := sdqDatos.FieldByName('TT_DESCRIPCION').AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := BaseSql + ' AND TT_FORMATO = ''' + edCodigo.Text + '''';
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatos.FieldByName('TT_DESCRIPCION').AsString = cmbDescripcion.Text)) Then
          Sql := BaseSql + OrderBy
      else
          Sql := BaseSql +
                 ' AND UPPER(TT_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
                 OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDocTrab.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
