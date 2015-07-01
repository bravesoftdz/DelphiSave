unit unManTipoFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryPrint, DB, ABMDialog, SDEngine, EditDialog;

type
  TfrmManTipoFacturas = class(TForm)
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManTipoFacturas: TfrmManTipoFacturas;

implementation

uses unDmPrincipal, CustomDlgs, unSesion;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmManTipoFacturas.Execute;
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
procedure TfrmManTipoFacturas.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManTipoFacturas.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions;
                                                 var Cancel: Boolean);
var
  sSql: String;
begin
  if (ABMAction = aaModify) and not(sdqDatos.FieldByName('tf_fechabaja').IsNull) then
    Cancel := (MsgBox('Se dispone a modificar un registro eliminado, al modificarlo lo reactivará.' + #13 +
                      '¿Esta usted seguro?', MB_ICONQUESTION + MB_YESNO) = IDNO)
  else if (ABMAction = aaDelete) then
  begin
    sSql := 'SELECT 1 ' +
             ' FROM sin.sdf_devolucionfacturas ' +
            ' WHERE df_idtipofac = :idtipo ' +
              ' AND df_fechabaja IS NULL ';
    if ExisteSqlEx(sSql, [sdqDatos.FieldByName('tf_id').AsInteger]) then
    begin
      MsgBox('El tipo no se puede eliminar ya que existen devoluciones activas.', MB_ICONEXCLAMATION);
      Cancel := True;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
end.
