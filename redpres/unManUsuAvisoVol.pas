unit unManUsuAvisoVol;      // TK 24248

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryPrint, ABMDialog, DB, SDEngine;

type
  TfrmManUsuAvisoVol = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;var AText: String; var AFont: TFont; var ABackground: TColor;var AAlignment: TAlignment);
    procedure ABMDialogPropertyClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManUsuAvisoVol: TfrmManUsuAvisoVol;

implementation

uses
  unPrincipal, unDmPrincipal, unABMUsuAvisoVol, CustomDlgs, General;

{$R *.dfm}

procedure TfrmManUsuAvisoVol.QueryPrintGetCellParams(Sender: TObject;Field: TPrintField; var AText: String; var AFont: TFont;var ABackground: TColor; var AAlignment: TAlignment);
begin
  if not sdqDatos.FieldByName('TB_FECHABAJA').IsNull Then
    AFont.Style := AFont.Style + [fsStrikeOut];
end;

procedure TfrmManUsuAvisoVol.ABMDialogPropertyClick(Sender: TObject);
begin

  if sdqDatos.FieldByName('TB_FECHABAJA').IsNull then
    with TfrmABMUsuAvisoVol.Create(Self) do
    begin
      FormStyle := fsNormal;
      sdqConsulta.ParamByName('CODAVISO').AsString := sdqDatos.FieldByName('TB_CODIGO').AsString;
      tbRefrescarClick(nil);
    end
  else
    MsgBox('No pueden agregar usuarios a un aviso dado de baja');
end;

procedure TfrmManUsuAvisoVol.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;

procedure TfrmManUsuAvisoVol.Execute;
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

end.
