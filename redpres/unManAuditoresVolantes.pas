unit unManAuditoresVolantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, SDEngine, ABMDialog, QueryPrint, unArtFrame, unfraUsuarios, EditDialog;

type
  TfrmManAuditoresVolantes = class(TForm)
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ABMDialog: TABMDialog;
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    sdqDatosVU_USUAUDITOR: TStringField;
    sdqDatosVU_FECHABAJA: TDateTimeField;
    fraUsuario: TfraUsuario;
    sdqDatosVU_FECHAALTA: TDateTimeField;
    sdqDatosVU_ID: TFloatField;
    sdqDatosSE_NOMBRE: TStringField;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
      var AText: String; var AFont: TFont; var ABackground: TColor;
      var AAlignment: TAlignment);
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField;
      var Value: String);
    procedure ABMDialogCustomSetValue(EditField: TEditField;
      Value: String);
    procedure ABMDialogCustomSetDefault(EditField: TEditField;
      Value: String);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManAuditoresVolantes: TfrmManAuditoresVolantes;

implementation

uses unPrincipal, unDmPrincipal, CustomDlgs, AnsiSql;
{$R *.dfm}

{ TfrmManAuditoresVolantes }

procedure TfrmManAuditoresVolantes.Execute;
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

procedure TfrmManAuditoresVolantes.ABMDialogBeforePrint(Sender: TObject;var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;

procedure TfrmManAuditoresVolantes.QueryPrintGetCellParams(Sender: TObject;
  Field: TPrintField; var AText: String; var AFont: TFont;
  var ABackground: TColor; var AAlignment: TAlignment);
begin
   if not sdqDatosVU_FECHABAJA.IsNull Then
      AFont.Style := AFont.Style + [fsStrikeOut];
end;

procedure TfrmManAuditoresVolantes.ABMDialogNeedControl(EditField: TEditField);
begin
  if EditField.FieldName = 'VU_USUAUDITOR' then
    EditField.EditObject := fraUsuario;
end;

procedure TfrmManAuditoresVolantes.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if EditField.FieldName = 'VU_USUAUDITOR' then
    Value := SqlValue(fraUsuario.edCodigo.Text)
end;

procedure TfrmManAuditoresVolantes.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
  if (EditField.FieldName = 'VU_USUAUDITOR') then
    fraUsuario.Cargar(Value)
end;

procedure TfrmManAuditoresVolantes.ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'VU_USUAUDITOR' then
    fraUsuario.Cargar(Value);
end;

end.
