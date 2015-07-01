unit unMantImportesValoresAmpo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, QueryPrint, Placemnt, Db, SDEngine, EditDialog, artSeguridad, unDmPrincipal, unPrincipal;

type
  TfrmMantImportesValoresAmpo = class(TForm)
    sdqAmpo: TSDQuery;
    dsAmpo: TDataSource;
    FormPlacement1: TFormPlacement;
    QueryPrint: TQueryPrint;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    sdqAmpoPERIODO: TStringField;
    sdqAmpoAM_NUMAMPOS: TFloatField;
    sdqAmpoAM_VALORAMPO: TFloatField;
    sdqAmpoAM_IMPORTOPE: TFloatField;
    sdqAmpoAM_IMPORTOPE_CONTRIBPATR: TFloatField;
    sdqAmpoAM_IMPORTEMINIMO: TFloatField;
    sdqAmpoAM_PERIODO: TStringField;
    sdqAmpoAM_IMPORTEMINIMOPOSTDE: TFloatField;
    Seguridad: TSeguridad;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions;
      var Cancel: Boolean);
  private
    { Private declarations }
  public
    Procedure Execute;
  end;

var
  frmMantImportesValoresAmpo: TfrmMantImportesValoresAmpo;

implementation

uses CustomDlgs, AnsiSql, unSesion;

{$R *.DFM}

procedure TfrmMantImportesValoresAmpo.Execute;
begin
   sdqAmpo.Open;
   BeginTrans;
   Seguridad.Ejecutar;
   try
     ABMDialog.Execute;
     CommitTrans;
   except
      on E: Exception do
      begin
        ErrorMsg(E, 'Se han descartado los cambios');
        Rollback;
      end;
   end;
   sdqAmpo.Close;
end;

procedure TfrmMantImportesValoresAmpo.ABMDialogBeforePrint(Sender: TObject;  var Cancel: Boolean);
begin
   QueryPrint.Footer.Text := Sesion.Usuario;
   if PrintDialog.Execute then
   begin
     QueryPrint.Print;
     Cancel := True;
   end;
end;

procedure TfrmMantImportesValoresAmpo.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
var
  sSql :String;
begin
  ABMDialog.Fields[0].ReadOnly := not(ABMAction = aaAdd);
  if (ABMAction = aaDelete) then
  begin
     Cancel := True;
     if  (MsgBox('¿Desea eliminar el Período ''' + sdqAmpoPERIODO.AsString + ''' ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
     begin
       sSql := 'SELECT 1 FROM sers_recisalasin ' +
               ' WHERE rs_persala = ' + SqlValue(sdqAmpoAM_PERIODO.AsString);
       if ExisteSql(sSql) then
         MessageDlg('El período no se puede dar de baja porque se encuentra en uso.', mtError, [mbOK], 0)
       else begin
         sSql := ' DELETE FROM cam_topeampos ' +
                  ' WHERE am_periodo = ' + SqlValue(sdqAmpoAM_PERIODO.AsString);
         EjecutarSqlST(SSql);
         sdqAmpo.Refresh;
       end;
     end;
  end;
end;

end.
