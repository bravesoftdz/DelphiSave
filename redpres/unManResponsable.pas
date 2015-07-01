unit unManResponsable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryPrint, ABMDialog, DB, SDEngine, EditDialog;

type
  TfrmManResponsable = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    sdqDatosRE_NOMBRE: TStringField;
    sdqDatosRE_DIRECCION: TStringField;
    sdqDatosRE_TELEFONO: TStringField;
    sdqDatosRE_FECBAJA: TDateTimeField;
    sdqDatosRE_RESPONSABLE: TFloatField;
    sdqDatosRE_GENERAAUTORIZACION: TStringField;
    sdqDatosRE_GENERAAUT_UNICA: TStringField;
    procedure ABMDialogGetDefaults(DataSet: TDataSet;EditField: TEditField);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
      var AText: String; var AFont: TFont; var ABackground: TColor;
      var AAlignment: TAlignment);
  private
    { Private declarations }
  public
     procedure Execute;
  end;

var
  frmManResponsable: TfrmManResponsable;

implementation

uses unPrincipal, unDmPrincipal, CustomDlgs;

{$R *.dfm}

procedure TfrmManResponsable.ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
begin
  if EditField.FieldName = 'RE_RESPONSABLE' then
     EditField.DefaultValue := IntToStr(IncSql('SELECT max(to_number(RE_RESPONSABLE)) FROM MRE_RESPONSABLE'));
end;

procedure TfrmManResponsable.ABMDialogBeforePrint(Sender: TObject;
  var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;

procedure TfrmManResponsable.QueryPrintGetCellParams(Sender: TObject;
  Field: TPrintField; var AText: String; var AFont: TFont;
  var ABackground: TColor; var AAlignment: TAlignment);
begin
   if not sdqDatosRE_FECBAJA.IsNull Then
      AFont.Style := AFont.Style + [fsStrikeOut];
end;

procedure TfrmManResponsable.Execute;
begin
  BeginTrans;
  Try
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
