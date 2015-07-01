unit unManRangos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, ABMDialog, Mask, ToolEdit, ArtComboBox, StdCtrls, ExtCtrls,
  EditDialog, General, StrFuncs, DBCtrls, RxLookup;

type
  TfrmManRangos = class(TForm)
    ambRangos: TABMDialog;
    sdqRangos: TSDQuery;
    dsRangos: TDataSource;
    pnlTrabajador: TPanel;
    edUsuario: TEdit;
    Label1: TLabel;
    cmbUsuario: TArtComboBox;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    sdqUsuarioSE_USUARIO: TStringField;
    sdqUsuarioSE_NOMBRE: TStringField;
    sdqAccion: TSDQuery;
    dsAccion: TDataSource;
    cmbAccion: TRxDBLookupCombo;
    PrintDialog: TPrintDialog;
    procedure pnlTrabajadorExit(Sender: TObject);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure ambRangosNeedControl(EditField: TEditField);
    procedure ambRangosCustomSetDefault(EditField: TEditField;
      Value: String);
    procedure ambRangosCustomGetSQLValue(EditField: TEditField;
      var Value: String);
    procedure ambRangosCustomSetValue(EditField: TEditField;
      Value: String);
    procedure ambRangosBeforeSave(Sender: TObject; var Cancel: Boolean);
    procedure cmbUsuarioDropDown(Sender: TObject);
    procedure cmbUsuarioCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ambRangosBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
    procedure LoadUser(AUserName : String);
    procedure ShowData;
    procedure DoLostFocus;
  public
    procedure Execute;
  end;

var
  frmManRangos: TfrmManRangos;

implementation

uses unDmPrincipal, unPrincipal;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.Execute;
begin
     dmPrincipal.sdbPrincipal.StartTransaction ;
     Try
         sdqRangos.Open ;
         ambRangos.Execute ;
         sdqRangos.Close ;
         dmPrincipal.sdbPrincipal.Commit ;
     except
         dmPrincipal.sdbPrincipal.Rollback ;
     end;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.pnlTrabajadorExit(Sender: TObject);
begin
     if (not sdqUsuario.Active) or (sdqUsuarioSE_USUARIO.AsString <> edUsuario.Text) Then begin
        LoadUser( edUsuario.Text );
     end else
        ShowData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.ShowData;
begin
     edUsuario.Text  := sdqUsuarioSE_USUARIO.AsString;
     cmbUsuario.Text := sdqUsuarioSE_NOMBRE.AsString ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.edUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 Then begin
        LoadUser( edUsuario.Text );
        DoLostFocus;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.ambRangosNeedControl(EditField: TEditField);
begin
     if EditField.FieldName = 'RA_USUARIO' Then
        EditField.EditObject := pnlTrabajador
     else if EditField.FieldName = 'RA_ACCION' Then
        EditField.EditObject := cmbAccion;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.ambRangosCustomSetDefault(EditField: TEditField; Value: String);
begin
     if EditField.FieldName = 'RA_USUARIO' Then begin
        sdqUsuario.Close;
        ShowData;
     end else if EditField.FieldName = 'RA_ACCION' Then
        cmbAccion.Value := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.ambRangosCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
     if EditField.FieldName = 'RA_USUARIO' Then begin
        ShowData;
        Value := '''' + edUsuario.Text + '''';
     end else if EditField.FieldName = 'RA_ACCION' Then
        Value := '''' + cmbAccion.Value + '''';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.ambRangosCustomSetValue(EditField: TEditField; Value: String);
begin
     if EditField.FieldName = 'RA_USUARIO' Then
        LoadUser(Value)
     else if EditField.FieldName = 'RA_ACCION' Then
        cmbAccion.Value :=  Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.LoadUser(AUserName: String);
begin
    sdqUsuario.Close;
    sdqUsuario.Sql.Text := 'SELECT SE_USUARIO, SE_NOMBRE ' +
                            'FROM USE_USUARIOS ' +
                            'WHERE SE_USUARIO = ''' + Trim(AUserName) + '''';
    sdqUsuario.Open;
    ShowData;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.ambRangosBeforeSave(Sender: TObject; var Cancel: Boolean);
Var iMin,
    iMax : Integer;
    sMsg : String;
begin
     sMsg := '';
     iMin := StrToInt(ambRangos.Fields.ItemsByField['RA_MINIMO'].DefaultValue);
     iMax := StrToInt(ambRangos.Fields.ItemsByField['RA_MAXIMO'].DefaultValue);
     if (iMax > 0) and (iMin > iMax) Then
        sMsg := 'El rango Máximo no puede ser menor al Mínimo'
     else if ambRangos.Fields.ItemsByField['RA_ACCION'].DefaultValue = '' Then
        sMsg := 'Debe seleccionar una Acción';

     if sMsg <> '' Then begin
        MsgBox('Error de Validación:' + #13 + #9 + sMsg, MB_ICONEXCLAMATION );
        Cancel := True;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.cmbUsuarioDropDown(Sender: TObject);
begin
    sdqUsuario.Close;
    sdqUsuario.Sql.Text := 'SELECT SE_USUARIO, SE_NOMBRE ' +
                            'FROM USE_USUARIOS ' +
                            'WHERE UPPER(SE_NOMBRE) LIKE ''' + UCase(Trim( cmbUsuario.Text )) + '%''';
    sdqUsuario.Open;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.cmbUsuarioCloseUp(Sender: TObject);
begin
    ShowData;
    DoLostFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.DoLostFocus;
begin
     if cmbUsuario.CanFocus Then begin
        cmbUsuario.SetFocus ;
        SendMessage(GetParentForm(cmbUsuario).Handle, WM_NEXTDLGCTL, 0, 0);
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManRangos.FormCreate(Sender: TObject);
begin
     OpenQuery(sdqAccion);
end;

procedure TfrmManRangos.ambRangosBeforePrint(Sender: TObject;
  var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;

end.
