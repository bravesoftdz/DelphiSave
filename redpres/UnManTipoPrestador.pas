unit UnManTipoPrestador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, EditDialog, Db, SDEngine, QueryPrint;

type
  TfrmManTipoPrestador = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions;
      var Cancel: Boolean);
  private
  public
    procedure Execute;
  end;

var
  frmManTipoPrestador: TfrmManTipoPrestador;

implementation

uses unDmPrincipal, unPrincipal, CustomDlgs;

{$R *.DFM}

{ TfrmManTipoPrestador }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoPrestador.Execute;
begin

     sdqDatos.Open;
     dmPrincipal.sdbPrincipal.StartTransaction;
     try
         ABMDialog.Execute ;
         dmPrincipal.sdbPrincipal.Commit;
     Except
        on E: Exception do begin
          ErrorMsg(E, 'Se han descartado los cambios');
          dmPrincipal.sdbPrincipal.Rollback;
        end;
     end;
     sdqDatos.Close;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoPrestador.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
     QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
     if PrintDialog.Execute then begin
       QueryPrint.Print;
       Cancel := True;
     end;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTipoPrestador.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
var ssql: string;
begin
  if ABMAction = aaDelete Then
  begin
    ssql := ' select 1 from art.cpr_prestador ' +
             ' where ca_especialidad = :tipo ' +
               ' and ca_fechabaja is null ';
    if ExisteSqlEx(ssql, [sdqDatos.FieldByName('tp_codigo').AsString]) then
    begin
      Cancel := true;
      msgbox('No es posible eliminar el tipo seleccionado porque registra prestadores relacionados');
    end
    else
      cancel := false;
  end;

end;

end.
