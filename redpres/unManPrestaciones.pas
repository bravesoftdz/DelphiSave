{
     Mantenimiento de Prestaciones - MPR_PRESTACIONES
}
unit unManPrestaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, StdCtrls, Mask, ToolEdit, ArtComboBox, Db, SDEngine,
  EditDialog, QueryPrint, unArtFrame, unFraCodigoDescripcion, unFraCodDesc,
  unArtDBAwareFrame;

type
  TfrmManPrestaciones = class(TForm)
    sdqFormulario: TSDQuery;
    dsFormulario: TDataSource;
    cmbFormulario: TArtComboBox;
    sdqPrestacion: TSDQuery;
    dsPrestacion: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    chkReqAud: TCheckBox;
    chkExigeMod: TCheckBox;
    fraGTrabajo: TfraCodDesc;
    chkMultPrestaciones: TCheckBox;
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure chkReqAudClick(Sender: TObject);
    procedure chkExigeModClick(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManPrestaciones: TfrmManPrestaciones;

implementation

uses unSesion, unDmPrincipal, CustomDlgs, General;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManPrestaciones }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.Execute;
begin
  sdqFormulario.Open;
  sdqPrestacion.Open;
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
  sdqPrestacion.Close;
  sdqFormulario.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.ABMDialogNeedControl(EditField: TEditField);
begin
  if EditField.FieldName = 'PR_FORMULARIO' then EditField.EditObject            := cmbFormulario;
  if EditField.FieldName = 'PR_REQUIEREAUDITORIA' then EditField.EditObject     := chkReqAud;
  if EditField.FieldName = 'PR_EXIGEMODULADOR' then EditField.EditObject        := chkExigeMod;
  if EditField.FieldName = 'PR_MULTIPLESPRESTACIONES' then EditField.EditObject := chkMultPrestaciones;
  if EditField.FieldName = 'PR_GTRABAJO' then EditField.EditObject              := fraGTrabajo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if EditField.FieldName = 'PR_FORMULARIO' then Value             := '''' + cmbFormulario.FieldValue  + '''';
  if EditField.FieldName = 'PR_REQUIEREAUDITORIA' then Value      := IIF(chkReqAud.Checked, '''S''', '''N''');
  if EditField.FieldName = 'PR_EXIGEMODULADOR' then Value         := IIF(chkExigeMod.Checked, '''S''', '''N''');
  if EditField.FieldName = 'PR_MULTIPLESPRESTACIONES' then Value  := IIF(chkMultPrestaciones.Checked, '''S''', '''N''');
  if EditField.FieldName = 'PR_GTRABAJO' then Value               := '''' + fraGTrabajo.Codigo + '''';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'PR_FORMULARIO' then cmbFormulario.FieldValue                := Value;
  if EditField.FieldName = 'PR_EXIGEMODULADOR' then chkExigeMod.Checked                 := IIF(Value = 'S', True, False);
  if EditField.FieldName = 'PR_REQUIEREAUDITORIA' then chkReqAud.Checked                := IIF(Value = 'S', True, False);
  if EditField.FieldName = 'PR_MULTIPLESPRESTACIONES' then chkMultPrestaciones.Checked  := IIF(Value = 'S', True, False);
  if EditField.FieldName = 'PR_GTRABAJO' then fraGTrabajo.Codigo                        := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'PR_FORMULARIO' then cmbFormulario.FieldValue                := Value;
  if EditField.FieldName = 'PR_EXIGEMODULADOR' then chkExigeMod.Checked                 := IIF(Value = 'S', True, False);
  if EditField.FieldName = 'PR_REQUIEREAUDITORIA' then chkReqAud.Checked                := IIF(Value = 'S', True, False);
  if EditField.FieldName = 'PR_MULTIPLESPRESTACIONES' then chkMultPrestaciones.Checked  := IIF(Value = 'S', True, False);
  if EditField.FieldName = 'PR_GTRABAJO' then fraGTrabajo.Codigo                        := Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.chkReqAudClick(Sender: TObject);
begin
  if not(chkReqAud.Checked) then chkExigeMod.Checked := False;
  chkExigeMod.Enabled := chkReqAud.Checked;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPrestaciones.chkExigeModClick(Sender: TObject);
begin
  if chkExigeMod.Checked then chkReqAud.Checked := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
