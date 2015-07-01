unit unfraFormCartasDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PatternEdit, StdCtrls, Mask, ToolEdit, ArtComboBox, Db, SDEngine;

type
  TfraFormCartasDoc = class(TFrame)
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
    property OnChange   : TNotifyEvent read FOnChange    write FOnChange;
    property Modified   : Boolean      read GetModified  write SetModified;
  end;

implementation

{$R *.DFM}

uses unDmPrincipal, General;

Const
    BaseSql = 'SELECT DT_FORMATO, DT_DESCRIPCION FROM CDT_TEXTOSCARTASDOC WHERE DT_FORMATO LIKE ''AB%'' ' ;
    OrderBy = ' ORDER BY DT_DESCRIPCION';

{----------------------------------------------------------------------------------------------------------------------}
{ TfraFormCartasDoc }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.Cargar(ACodigo: String);
Var Sql : String;
begin
     Sql := BaseSql + ' AND DT_FORMATO = ''' + ACodigo + '''' ;

     if OpenQuery(sdqDatos, Sql, True) Then
        cmbDescripcionCloseUp( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.DoLostFocus;
begin
    if edCodigo.Focused or cmbDescripcion.Focused Then begin // Self.Focused
       cmbDescripcion.SetFocus ;
       SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraFormCartasDoc.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.Limpiar;
begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.SetColors(AColor: TColor);
begin
    edCodigo.Font.Color       := AColor;
    cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.SetModified(const Value: Boolean);
begin
    edCodigo.Modified       := Value ;
    cmbDescripcion.Modified := Value ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.cmbDescripcionCloseUp(Sender: TObject);
begin
    edCodigo.Text       := sdqDatos.FieldByName('DT_FORMATO').AsString ;
    cmbDescripcion.Text := sdqDatos.FieldByName('DT_DESCRIPCION').AsString ;

    if Assigned(Sender) Then begin
       if Assigned(FOnChange) Then
          OnChange( Self );

       if (edCodigo.Text <> '') Then
          DoLostFocus;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') Then begin
        if (edCodigo.Text <> sdqDatos.FieldByName('DT_FORMATO').AsString) Then
            Cargar( edCodigo.Text )
        else
            cmbDescripcion.Text := sdqDatos.FieldByName('DT_DESCRIPCION').AsString ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.edCodigoKeyPress(Sender: TObject; var Key: Char);
Var Sql : String;
begin
     if Key = #13 Then begin
        Sql := BaseSql + ' AND DT_FORMATO = ''' + edCodigo.Text + '''';
        if OpenQuery(sdqDatos, Sql, True) Then
           cmbDescripcionCloseUp( Sender );
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.cmbDescripcionDropDown(Sender: TObject);
Var Sql : String;
begin
      if (sdqDatos.Active and (sdqDatos.FieldByName('DT_DESCRIPCION').AsString = cmbDescripcion.Text)) Then
          Sql := BaseSql + OrderBy
      else
          Sql := BaseSql +
                 ' AND UPPER(DT_DESCRIPCION) LIKE UPPER(''' + cmbDescripcion.Text + '%'')' +
                 OrderBy;

      OpenQuery(sdqDatos, Sql, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraFormCartasDoc.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}

end.
