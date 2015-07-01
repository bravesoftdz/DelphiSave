unit unManDerivacionVolantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine;

type
  TfrmManDerivacionVolantes = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor;  var AAlignment: TAlignment);
    procedure ABMDialogPropertyClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
  public
    procedure Execute;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, General, unABMUsuDerivacionVolantes;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDerivacionVolantes.Execute;
begin
  BeginTrans;
  try
    sdqDatos.Open;
    ABMDialog.Execute;
    sdqDatos.Close;
    CommitTrans;
  except
    RollBack;
    Raise;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDerivacionVolantes.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqDatos.FieldByName('TB_FECHABAJA').IsNull Then
    AFont.Style := AFont.Style + [fsStrikeOut];
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDerivacionVolantes.ABMDialogPropertyClick(Sender: TObject);
begin
  if sdqDatos.FieldByName('TB_FECHABAJA').IsNull then
    with TfrmABMUsuDerivacionVolantes.Create(self) do
      try
        sdqConsulta.ParamByName('CODDERIVACION').AsString := sdqDatos.FieldByName('TB_CODIGO').AsString;
        tbRefrescarClick(nil);
        ShowModal;
      finally
        Free;
      end
  else
    MsgBox('No pueden agregar usuarios a una derivación dada de baja');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDerivacionVolantes.ABMDialogBeforePrint(Sender: TObject;
  var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;

end.

