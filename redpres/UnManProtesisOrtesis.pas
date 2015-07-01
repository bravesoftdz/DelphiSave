unit UnManProtesisOrtesis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, StdCtrls, Mask, ToolEdit,EditDialog,
  ArtComboBox;

type
  TfrmManProtesisOrtesis = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    cmbOrigen: TArtComboBox;
    sdqOrigen: TSDQuery;
    dsOrigen: TDataSource;
    PrintDialog: TPrintDialog;
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure ABMDialogCustomSetDefault(EditField: TEditField;Value: String);
    procedure ABMDialogCustomSetValue(EditField: TEditField;Value: String);
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogGetDefaults(DataSet: TDataSet;
      EditField: TEditField);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Execute;
  end;

var
  frmManProtesisOrtesis: TfrmManProtesisOrtesis;

implementation

uses unDmPrincipal, unPrincipal, StrFuncs;

{$R *.DFM}

{ TfrmManProtesisOrtesis }
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.Execute;
begin
     dmPrincipal.sdbPrincipal.StartTransaction ;
     Try
         sdqDatos.Open;
         sdqOrigen.Open;
         ABMDialog.Execute;
         sdqDatos.Close;
         sdqOrigen.Open;
         dmPrincipal.sdbPrincipal.Commit ;
     except
         dmPrincipal.sdbPrincipal.Rollback ;
     end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
     if EditField.FieldName = 'IM_ORIGEN' Then
       Value := '''' + cmbOrigen.FieldValue  + '''';
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
begin
     if EditField.FieldName = 'IM_ORIGEN' Then
       cmbOrigen.FieldValue := Value;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
     if EditField.FieldName = 'IM_ORIGEN' Then
       cmbOrigen.FieldValue := Value;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.ABMDialogNeedControl(EditField: TEditField);
begin
     if EditField.FieldName = 'IM_ORIGEN' Then
       EditField.EditObject := cmbOrigen;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.ABMDialogGetDefaults(DataSet: TDataSet;EditField: TEditField);
begin
     if EditField.FieldName = 'IM_CODIGO' Then
       EditField.DefaultValue := ValorSql('SELECT LPAD(MAX(IM_CODIGO) + 1, 3, ''0'') FROM ART.MIM_IMPLANTES');
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManProtesisOrtesis.ABMDialogBeforePrint(Sender: TObject;var Cancel: Boolean);
begin
     QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
     if PrintDialog.Execute then begin
       QueryPrint.Print ;
       Cancel := True;
     end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.
