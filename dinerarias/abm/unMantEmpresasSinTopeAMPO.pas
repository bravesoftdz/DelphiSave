unit unMantEmpresasSinTopeAMPO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, QueryPrint, Placemnt, Db, SDEngine, EditDialog, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa;

type
  TfrmMantEmpresasSinTopeAMPO = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    FormPlacement1: TFormPlacement;
    QueryPrint: TQueryPrint;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    sdqDatosAE_CUIT: TStringField;
    sdqDatosMP_NOMBRE: TStringField;
    sdqDatosCUIT: TStringField;
    sdqDatosAE_PERIODODESDE: TStringField;
    sdqDatosAE_PERIODOHASTA: TStringField;
    sdqDatosPERIODODESDE: TStringField;
    sdqDatosPERIODOHASTA: TStringField;
    fraEmpresa: TfraEmpresa;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmMantEmpresasSinTopeAMPO: TfrmMantEmpresasSinTopeAMPO;

implementation

uses unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion;

{$R *.DFM}

{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmMantEmpresasSinTopeAMPO.Execute;
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
{----------------------------------------------------------------------------------------}
procedure TfrmMantEmpresasSinTopeAMPO.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
   QueryPrint.Footer.Text := Sesion.Usuario;
   if PrintDialog.Execute then
   begin
     QueryPrint.Print;
     Cancel := True;
   end;
end;
{----------------------------------------------------------------------------------------}
procedure TfrmMantEmpresasSinTopeAMPO.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
begin
  if (ABMAction = aaAdd) then
    fraEmpresa.Clear;
end;
{----------------------------------------------------------------------------------------}
procedure TfrmMantEmpresasSinTopeAMPO.ABMDialogNeedControl(EditField: TEditField);
begin
   if EditField.FieldName = 'AE_CUIT' then
      EditField.EditObject := fraEmpresa;
end;
{----------------------------------------------------------------------------------------}
procedure TfrmMantEmpresasSinTopeAMPO.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
   if EditField.FieldName = 'AE_CUIT' then
      fraEmpresa.CUIT := Value;
end;
{----------------------------------------------------------------------------------------}
procedure TfrmMantEmpresasSinTopeAMPO.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
   if EditField.FieldName  = 'AE_CUIT' then
      Value := SQLValue(fraEmpresa.CUIT);
end;
{----------------------------------------------------------------------------------------}
end.
