unit unManMotAnulTraslados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, artSeguridad, ABMDialog, DB, SDEngine;

type
  TfrmManMotAnulTraslados = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManMotAnulTraslados: TfrmManMotAnulTraslados;

implementation

uses unDmPrincipal, CustomDlgs;

{$R *.dfm}
{-------------------------------------------------------------------------------}
procedure TfrmManMotAnulTraslados.Execute;
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
procedure TfrmManMotAnulTraslados.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;
{-------------------------------------------------------------------------------}
end.
