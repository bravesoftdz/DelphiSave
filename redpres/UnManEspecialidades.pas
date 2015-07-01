unit UnManEspecialidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, EditDialog;

type
  TfrmManEspecialidades = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
  private
  public
    procedure Execute;
  end;

var
  frmManEspecialidades: TfrmManEspecialidades;

implementation

uses unDmPrincipal, unPrincipal, StrFuncs;

{$R *.DFM}

{ TfrmManEspecialidades }
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEspecialidades.Execute;
begin
    sdqDatos.Open;
    ABMDialog.Execute ;
    sdqDatos.Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEspecialidades.ABMDialogBeforePrint(Sender: TObject;var Cancel: Boolean);
begin
    QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
    if PrintDialog.Execute then begin
      QueryPrint.Print;
      Cancel := True;
    end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManEspecialidades.ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
begin
  if EditField.FieldName = 'ES_CODIGO' then
    EditField.DefaultValue := ValorSql('SELECT LPAD(MAX(ES_CODIGO) + 1, 3, ''0'') FROM ART.MES_ESPECIALIDADES');
end;


end.
