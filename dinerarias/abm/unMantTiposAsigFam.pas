unit unMantTiposAsigFam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, QueryPrint, Placemnt, Db, SDEngine, EditDialog;

type
  TfrmMantTiposAsigFam = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    FormPlacement1: TFormPlacement;
    QueryPrint: TQueryPrint;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    sdqDatosTF_TIPO: TStringField;
    sdqDatosTF_DESCRIPCION: TStringField;
    sdqDatosTF_MESESANTIGUEDAD: TFloatField;
    sdqDatosTF_FECHABAJA: TDateTimeField;
    sdqDatosTE_USUBAJA: TStringField;
    sdqDatosTF_FECHAMODIF: TDateTimeField;
    sdqDatosTF_USUMODIF: TStringField;
    sdqDatosTF_FECHAALTA: TDateTimeField;
    sdqDatosTF_USUALTA: TStringField;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmMantTiposAsigFam: TfrmMantTiposAsigFam;

implementation

uses unDmPrincipal, CustomDlgs, unSesion;

{$R *.DFM}

{-----------------------------------------------------------------------------------}
procedure TfrmMantTiposAsigFam.Execute;
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
        Rollback;
      end;
   end;
   sdqDatos.Close;
end;
{-----------------------------------------------------------------------------------}
procedure TfrmMantTiposAsigFam.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
   QueryPrint.Footer.Text := Sesion.Usuario;
   if PrintDialog.Execute then
   begin
     QueryPrint.Print;
     Cancel := True;
   end;
end;
{-----------------------------------------------------------------------------------}
procedure TfrmMantTiposAsigFam.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
begin
  ABMDialog.Fields[0].ReadOnly := not(ABMAction = aaAdd);
end;
{-----------------------------------------------------------------------------------}
end.
