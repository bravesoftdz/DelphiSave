unit unManCuentaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryPrint, DB, ABMDialog, SDEngine, unArtFrame, unfraUsuarios,
  EditDialog;

type
  TfrmManCuentaUsuario = class(TForm)
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    fraUsuario: TfraUsuario;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogNeedControl(EditField: TEditField);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManCuentaUsuario: TfrmManCuentaUsuario;

implementation

uses unDmPrincipal, CustomDlgs, unSesion;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmManCuentaUsuario.Execute;
begin
  sdqDatos.Open;
  BeginTrans;
  try
    ABMDialog.Execute;
    CommitTrans;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Se han descartado los cambios');
      Rollback(True);
    end;
   end;
   sdqDatos.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManCuentaUsuario.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManCuentaUsuario.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if EditField.FieldName = 'CU_USUARIO' then
    Value := '''' + fraUsuario.UserID  + '''';
end;
{-------------------------------------------------------------------------------}
procedure TfrmManCuentaUsuario.ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'CU_USUARIO' then
    fraUsuario.Cargar(Value);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManCuentaUsuario.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'CU_USUARIO' then
    fraUsuario.Cargar(Value);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManCuentaUsuario.ABMDialogNeedControl(EditField: TEditField);
begin
  if EditField.FieldName = 'CU_USUARIO' then
    EditField.EditObject := fraUsuario;
end;
{-------------------------------------------------------------------------------}
end.
