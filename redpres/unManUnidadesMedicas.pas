unit unManUnidadesMedicas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, Db, SDEngine, StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TfrmManUnidadesMedicas = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
  public
    procedure Execute;
  end;

var
  frmManUnidadesMedicas: TfrmManUnidadesMedicas;

implementation

uses unDmPrincipal, CustomDlgs;

{$R *.DFM}
{-------------------------------------------------------------------------------}
{ TfrmUnidadesMedicas }
{-------------------------------------------------------------------------------}
procedure TfrmManUnidadesMedicas.Execute;
begin
   sdqDatos.Open;
   BeginTrans;
   try
     ABMDialog.Execute;
     CommitTrans;
   except
     on E: Exception do begin
       ErrorMsg(E, 'Se han descartado los cambios');
       if InTransaction then Rollback;
     end;
   end;
   sdqDatos.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManUnidadesMedicas.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;
{-------------------------------------------------------------------------------}
end.
