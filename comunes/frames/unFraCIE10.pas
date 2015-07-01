unit unFraCIE10;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ArtComboBox, StdCtrls, Db, SDEngine;

type
  TfraCIE10 = class(TFrame)
    sdqCIE10: TSDQuery;
    dsCIE10: TDataSource;
    lbCIE10: TLabel;
    edCodigo: TEdit;
    cmbDescripcion: TArtComboBox;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOnChange: TNotifyEvent;
    procedure DoChanges ;
    procedure DoLostFocus;
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    procedure MostrarDatos;
  public
    procedure Limpiar;
    procedure Cargar(ACodigo: String; ADoEvents : Boolean = False);
    Property Modified : Boolean      read GetModified write SetModified;
    Property OnChange : TNotifyEvent read FOnChange   write FOnChange;
  end;

implementation

uses AnsiSql, General, unDmPrincipal;
{$R *.DFM}

{ TfraCIE10 }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.Cargar(ACodigo: String; ADoEvents : Boolean = False);
Var Sql : String;
begin
     Sql := 'SELECT DG_CODIGO, DG_DESCRIPCION ' +
            'FROM CDG_DIAGNOSTICO ' +
            'WHERE DG_CODIGO = ' + SqlString(edCodigo.Text, True);
     OpenQuery(sdqCIE10, Sql, True);
     if sdqCIE10.IsEmpty Then begin
        if ADoEvents Then
              MsgBox('No se encontro ningun CIE10 con el código ingresado.', MB_ICONEXCLAMATION)
     end else begin
        MostrarDatos;

        if ADoEvents Then
           DoLostFocus;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.DoChanges;
begin
     if Assigned(FOnChange) Then
        OnChange( Self );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.DoLostFocus;
begin
    cmbDescripcion.SetFocus ;
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCIE10.GetModified: Boolean;
begin
    Result := edCodigo.Modified or cmbDescripcion.Modified;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.Limpiar;
begin
    edCodigo.Text        := '';
    cmbDescripcion.FieldValue := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.MostrarDatos;
begin
    cmbDescripcion.FieldValue := sdqCIE10.FieldByName('DG_CODIGO').AsString;
    edCodigo.Text             := cmbDescripcion.FieldValue;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.SetModified(const Value: Boolean);
begin
    edCodigo.Modified  := Value;
    cmbDescripcion.Modified := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.cmbDescripcionDropDown(Sender: TObject);
Var
   Sql : String;
begin
     Sql := 'SELECT DG_CODIGO, DG_DESCRIPCION ' +
            'FROM CDG_DIAGNOSTICO ' ;

     if (Not sdqCIE10.Active) or (sdqCIE10.Active and (cmbDescripcion.Text <> sdqCIE10.FieldByName('DG_DESCRIPCION').AsString)) Then
            Sql := Sql + 'WHERE DG_DESCRIPCION LIKE ''' + SqlString(cmbDescripcion.Text) + '%''';

     OpenQuery(sdqCIE10, Sql, True);

{     if (edCodigo.Text <> '') and sdqCIE10.Active Then
        sdqCIE10.Locate('DG_CODIGO', edCodigo.Text, []);
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.cmbDescripcionCloseUp(Sender: TObject);
begin
     MostrarDatos;
     DoLostFocus;
     DoChanges;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 Then begin
        Cargar( edCodigo.Text, True );
        DoChanges;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.FrameExit(Sender: TObject);
begin
     if (edCodigo.Text <> '') and (edCodigo.Text <> cmbDescripcion.FieldValue) Then begin
         Cargar( edCodigo.Text, False );
         DoChanges;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCIE10.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key = VK_DOWN) and (ssAlt in Shift) then
        cmbDescripcion.DoDropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
