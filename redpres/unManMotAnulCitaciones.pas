unit unManMotAnulCitaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ABMDialog, QueryPrint, DB,
  SDEngine;

type
  TfrmManMotAnulCitaciones = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    ABMDialog: TABMDialog;
    sdqDatosMC_ID: TFloatField;
    sdqDatosMC_CODIGO: TStringField;
    sdqDatosMC_DESCRIPCION: TStringField;
    sdqDatosMC_USUALTA: TStringField;
    sdqDatosMC_FECHAALTA: TDateTimeField;
    sdqDatosMC_USUMODIF: TStringField;
    sdqDatosMC_FECHAMODIF: TDateTimeField;
    sdqDatosMC_USUBAJA: TStringField;
    sdqDatosMC_FECHABAJA: TDateTimeField;
  private
  public
    procedure Execute;
  end;

var
  frmManMotAnulCitaciones: TfrmManMotAnulCitaciones;

implementation

uses
  unDmPrincipal, CustomDlgs;

{$R *.dfm}

procedure TfrmManMotAnulCitaciones.Execute;
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

end.
