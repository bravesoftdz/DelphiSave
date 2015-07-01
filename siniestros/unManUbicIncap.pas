unit unManUbicIncap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, artSeguridad, ABMDialog, DB, SDEngine, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraDelegacion, EditDialog;

type
  TfrmManUbicIncap = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    fraDelegacion: TfraCodigoDescripcion;
    fraProvincia: TfraCodigoDescripcion;
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManUbicIncap: TfrmManUbicIncap;

implementation

uses unDmPrincipal, AnsiSql;

{$R *.dfm}

{-------------------------------------------------------------------------------}
{ TfrmManUbicIncap }
{-------------------------------------------------------------------------------}
procedure TfrmManUbicIncap.Execute;
begin
  BeginTrans;
  try
    sdqDatos.Open;
    ABMDialog.Execute;
    sdqDatos.Close;
    CommitTrans;
  except
    Rollback;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManUbicIncap.ABMDialogNeedControl(EditField: TEditField);
begin
  if (EditField.FieldName = 'UI_DELEGACION_ASOC') then
     EditField.EditObject := fraDelegacion;
  if (EditField.FieldName = 'UI_PROVINCIA') then
     EditField.EditObject := fraProvincia;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManUbicIncap.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
  if (EditField.FieldName = 'UI_DELEGACION_ASOC') then
     fraDelegacion.Codigo := Value;
  if (EditField.FieldName = 'UI_PROVINCIA') then
     fraProvincia.Codigo := Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManUbicIncap.ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
begin
  if (EditField.FieldName = 'UI_DELEGACION_ASOC') then
     fraDelegacion.Clear;
  if (EditField.FieldName = 'UI_PROVINCIA') then
     fraProvincia.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManUbicIncap.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if (EditField.FieldName = 'UI_DELEGACION_ASOC') then
     Value := SqlString(fraDelegacion.edCodigo.Text, True);
  if (EditField.FieldName = 'UI_PROVINCIA') then
     Value := SqlString(fraProvincia.edCodigo.Text, True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManUbicIncap.FormCreate(Sender: TObject);
begin
  with fraDelegacion do
  begin
    TableName   := 'DLG_DELEGACIONES';
    FieldID     := 'LG_CODIGO';
    FieldCodigo := 'LG_CODIGO';
    FieldDesc   := 'LG_NOMBRE';
    FieldBaja   := 'LG_FECHABAJA';
    ShowBajas   := True;
  end;
  with fraProvincia do
  begin
    TableName   := 'CPV_PROVINCIAS';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
  end;
end;
{-------------------------------------------------------------------------------}
end.
