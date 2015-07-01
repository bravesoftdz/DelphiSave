unit unManAuditores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, ABMDialog, EditDialog,
  unArtFrame, unFraCodigoDescripcion, Mask, ToolEdit, ArtComboBox,
  StdCtrls, ExtCtrls, unfraNomenclador, unfraUsuarios, unArtDBAwareFrame,
  unfraPrestaciones;

type
  TfrmManAuditores = class(TForm)
    abmAuditores: TABMDialog;
    sdqAuditores: TSDQuery;
    dsAuditores: TDataSource;
    PrintDialog: TPrintDialog;                       
    fraNomenclador_aut: TfraNomenclador;
    fraPrestador: TfraCodigoDescripcion;
    fraUsuario: TfraUsuario;
    fraEspecialidad: TfraCodigoDescripcion;
    fraNomenclador_sol: TfraNomenclador;
    fraPrestacion: TfraPrestacion;
    procedure abmAuditoresGetDefaults(DataSet: TDataSet; EditField: TEditField);
    procedure abmAuditoresBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure abmAuditoresNeedControl(EditField: TEditField);
    procedure abmAuditoresCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure abmAuditoresCustomSetValue(EditField: TEditField; Value: String);
    procedure FormCreate(Sender: TObject);
    procedure fraPrestadorcmbDescripcionDropDown(Sender: TObject);
    procedure abmAuditoresBeforeSave(Sender: TObject; var Cancel: Boolean;
      ABMAction: TABMActions);
  private
  public
    procedure Execute;
  end;

var
  frmManAuditores: TfrmManAuditores;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, Strfuncs, CustomDlgs;

{$R *.DFM}

{-------------------------------------------------------------------------------}
{ TfrmManAuditores }
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.Execute;
begin
   sdqAuditores.Open;
   BeginTrans;
   try
     abmAuditores.Execute;
     CommitTrans;
   except
     on E: Exception do begin
       ErrorMsg(E, 'Se han descartado los cambios');
       if InTransaction then Rollback;
     end;
   end;
   sdqAuditores.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.abmAuditoresGetDefaults(DataSet: TDataSet; EditField: TEditField);
begin
  if (EditField.FieldName = 'AU_AUDITOR') then
    EditField.DefaultValue := ValorSql('SELECT MAX(AU_AUDITOR) + 1 FROM MAU_AUDITORES');
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.abmAuditoresBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.abmAuditoresNeedControl(EditField: TEditField);
begin
  if EditField.FieldName = 'AU_PRESTADOR' then
    EditField.EditObject := fraPrestador
  else if EditField.FieldName = 'AU_IDNOMENCLADOR' then
    EditField.EditObject := fraNomenclador_aut
  else if EditField.FieldName = 'AU_IDNOMENCLADOR_SOL' then  // Lu 24/04
    EditField.EditObject := fraNomenclador_sol
  else if EditField.FieldName = 'AU_USUARIO' then
    EditField.EditObject := fraUsuario
  else if EditField.FieldName = 'AU_ESPECIALIDAD' then
    EditField.EditObject := fraEspecialidad
  else if EditField.FieldName = 'AU_PRESTACION' then      // TK 18914
    EditField.EditObject := fraPrestacion;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.abmAuditoresCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if EditField.FieldName = 'AU_PRESTADOR' then
    Value := SqlValue(fraPrestador.Codigo)
  else if EditField.FieldName = 'AU_IDNOMENCLADOR' then
  begin
    if (fraNomenclador_aut.Nomenclador = '') and (fraNomenclador_aut.Capitulo = '') and (fraNomenclador_aut.Codigo = '') then
      Value := 'null'
    else
      Value := SqlValue(fraNomenclador_aut.IdNomenclador);
  end
  else if EditField.FieldName = 'AU_IDNOMENCLADOR_SOL' then  // Lu 24/04
  begin
    if (fraNomenclador_sol.Nomenclador = '') and (fraNomenclador_sol.Capitulo = '') and (fraNomenclador_sol.Codigo = '') then
      Value := 'null'
    else
      Value := SqlValue(fraNomenclador_sol.IdNomenclador);
  end
  else if EditField.FieldName = 'AU_USUARIO' then
    Value := SqlValue(fraUsuario.edCodigo.Text)
  else if EditField.FieldName = 'AU_ESPECIALIDAD' then
    Value := SqlValue(fraEspecialidad.Codigo)
  else if EditField.FieldName = 'AU_PRESTACION' then      // TK 18914
    Value := SqlValue(fraPrestacion.edCodigo.Text);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.abmAuditoresCustomSetValue(EditField: TEditField; Value: String);
begin
  if (EditField.FieldName = 'AU_PRESTADOR') then
    fraPrestador.Value := Value
  else if (EditField.FieldName = 'AU_USUARIO') then
    fraUsuario.Cargar(Value)
  else if (EditField.FieldName = 'AU_ESPECIALIDAD') then
    fraEspecialidad.Value := Value
  else if (EditField.FieldName = 'AU_PRESTACION') then
    fraPrestacion.Cargar(Value)

  else if (EditField.FieldName = 'AU_IDNOMENCLADOR') then
  begin
    if (Value <> '') then
      fraNomenclador_aut.Cargar(StrToInt(Value))
    else
      fraNomenclador_aut.Limpiar;
  end

  else if (EditField.FieldName = 'AU_IDNOMENCLADOR_SOL') then   // Lu 24/04
  begin
    if (Value <> '') then
      fraNomenclador_sol.Cargar(StrToInt(Value))
    else
      fraNomenclador_sol.Limpiar;
  end;  

end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.FormCreate(Sender: TObject);
begin
  with fraPrestador do
  begin
    TableName     := 'CPR_PRESTADOR';
    FieldID       := 'CA_IDENTIFICADOR';
    FieldCodigo   := 'CA_IDENTIFICADOR';
    FieldDesc     := 'CA_DESCRIPCION';
    FieldBaja     := 'CA_FECHABAJA';
    caseSensitive := False;
    ShowBajas     := False;
  end;
  with fraEspecialidad do
  begin
    TableName     := 'MES_ESPECIALIDADES';
    FieldID       := 'ES_CODIGO';
    FieldCodigo   := 'ES_CODIGO';
    FieldDesc     := 'ES_DESCRIPCION';
    FieldBaja     := 'ES_FECHABAJA';
    caseSensitive := False;
    ShowBajas     := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.fraPrestadorcmbDescripcionDropDown(Sender: TObject);
begin
  fraPrestador.cmbDescripcionDropDown(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAuditores.abmAuditoresBeforeSave(Sender: TObject; var Cancel: Boolean; ABMAction: TABMActions);
begin
  Verificar( not((fraNomenclador_aut.Nomenclador = '') and
                 (fraNomenclador_aut.Capitulo = '') and
                 (fraNomenclador_aut.Codigo = '')) and fraPrestador.IsEmpty, fraPrestador, 'Debe completar el Prestador');

end;

end.
