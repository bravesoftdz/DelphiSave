unit UnManCompaniasAseguradoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, EditDialog;

type
  TfrmManCompaniasAseguradoras = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
  public
    procedure Execute;
  end;

var
  frmManCompaniasAseguradoras: TfrmManCompaniasAseguradoras;

implementation

uses 
  unDmPrincipal, unPrincipal, StrFuncs;

{$R *.DFM}

{ TfrmManCompaniasAseguradoras }
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCompaniasAseguradoras.Execute;
begin
  sdqDatos.Open;
  ABMDialog.Execute ;
  sdqDatos.Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCompaniasAseguradoras.ABMDialogBeforePrint(Sender: TObject;var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
  if PrintDialog.Execute then begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManCompaniasAseguradoras.ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
begin
  if EditField.FieldName = 'CS_ID' Then
    EditField.DefaultValue := ValorSql('SELECT NVL(MAX(CS_ID), 0) + 1 FROM MCS_COMPANIASEGURO');
end;


end.
