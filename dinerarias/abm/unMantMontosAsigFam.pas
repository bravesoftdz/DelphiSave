unit unMantMontosAsigFam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, QueryPrint, Placemnt, Db, SDEngine, unArtFrame, EditDialog,
  unFraCodigoDescripcion, StdCtrls, Mask, ToolEdit, ArtComboBox, Grids,
  DBGrids, RXDBCtrl, ArtDBGrid, Buttons, FormPanel, ExtCtrls,
  unArtDBAwareFrame;

type
  TfrmMantMontosAsigFam = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    FormPlacement1: TFormPlacement;
    QueryPrint: TQueryPrint;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    sdqDatosPV_DESCRIPCION: TStringField;
    sdqDatosMF_PROVINCIA: TStringField;
    sdqDatosMF_PARTIDO: TStringField;
    sdqDatosMF_TOPE: TFloatField;
    sdqDatosMF_HIJO: TFloatField;
    sdqDatosMF_HIJODISCAPACITADO: TFloatField;
    sdqDatosMF_AYUDAESCOLAR: TFloatField;
    sdqDatosMF_FECHABAJA: TDateTimeField;
    sdqDatosMF_USUBAJA: TStringField;
    sdqDatosMF_FECHAMODIF: TDateTimeField;
    sdqDatosMF_USUMODIF: TStringField;
    sdqDatosMF_FECHAALTA: TDateTimeField;
    sdqDatosMF_USUALTA: TStringField;
    sdqDatosMF_CODMONTO: TFloatField;
    sdqPartidos: TSDQuery;
    dsPartidos: TDataSource;
    fraProvincias: TfraCodigoDescripcion;
    cmbPartidos: TArtComboBox;
    dsLocalidades: TDataSource;
    sdqLocalidades: TSDQuery;
    fpExcepciones: TFormPanel;
    Bevel3: TBevel;
    dgExcepciones: TArtDBGrid;
    cmbLocalidades: TArtComboBox;
    Label1: TLabel;
    btnQuitarLicencia: TBitBtn;
    btnAgregarLicencia: TBitBtn;
    btnCerrarLicencia: TBitBtn;
    Bevel1: TBevel;
    lblDatos: TLabel;
    dsExcepciones: TDataSource;
    sdqExcepciones: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure ABMDialogPropertyClick(Sender: TObject);
    procedure btnAgregarLicenciaClick(Sender: TObject);
    procedure btnQuitarLicenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmMantMontosAsigFam: TfrmMantMontosAsigFam;

implementation

uses unDmPrincipal, CustomDlgs, AnsiSql, unSesion;

{$R *.DFM}

{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.Execute;
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
        Rollback;
      end;
   end;
   sdqDatos.Close;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.FormCreate(Sender: TObject);
begin
  with fraProvincias do
  begin
    TableName   := 'CPV_PROVINCIAS';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
    ShowBajas   := True;
  end;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.ABMDialogNeedControl(EditField: TEditField);
begin
   if EditField.FieldName = 'MF_PROVINCIA' then
      EditField.EditObject := fraProvincias;

   if EditField.FieldName = 'MF_PARTIDO' then
      EditField.EditObject := cmbPartidos;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
   if EditField.FieldName = 'MF_PROVINCIA' then
      fraProvincias.Codigo := Value;

   if EditField.FieldName = 'MF_PARTIDO' then
   begin
     sdqPartidos.Close;
     sdqPartidos.ParamByName('pProvincia').AsString := fraProvincias.Codigo;
     sdqPartidos.Open;
     cmbPartidos.FieldValue := Value;
     cmbPartidos.Text := Value;
   end;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
   QueryPrint.Footer.Text := Sesion.Usuario;
   if PrintDialog.Execute then
   begin
     QueryPrint.Print;
     Cancel := True;
   end;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
   if EditField.FieldName = 'MF_PROVINCIA' then
      Value := '''' + fraProvincias.Codigo + '''';

   if EditField.FieldName = 'MF_PARTIDO' then
      Value := '''' + cmbPartidos.Text + '''';
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
begin
  if (ABMAction = aaAdd) then
  begin
    fraProvincias.Clear;
    cmbPartidos.Clear;
  end;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.ABMDialogPropertyClick(Sender: TObject);
begin
  cmbLocalidades.Clear;
  sdqLocalidades.Close;
  sdqLocalidades.ParamByName('pProvincia').AsString := sdqDatosMF_PROVINCIA.AsString;
  sdqLocalidades.ParamByName('pPartido').AsString   := sdqDatosMF_PARTIDO.AsString;
  sdqLocalidades.Open;
  lblDatos.Caption := 'Provincia: ' + sdqDatosPV_DESCRIPCION.AsString + ' -  Partido: ' + sdqDatosMF_PARTIDO.AsString;
  sdqExcepciones.Close;
  sdqExcepciones.ParamByName('pCodMonto').AsInteger := sdqDatosMF_CODMONTO.AsInteger;
  sdqExcepciones.Open;
  fpExcepciones.ShowModal;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.btnAgregarLicenciaClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'SELECT 1 FROM sea_excepcionesmontosasig ' +
          ' WHERE ea_codmonto = ' + SqlInt(sdqDatosMF_CODMONTO.AsInteger) +
            ' AND ea_localidadexceptuada = ' + SqlValue(sdqLocalidades.FieldByName('localidad').AsString);
  if ExisteSql(sSql) then
    MessageDlg('Localidad ya cargada!', mtError, [mbOK], 0)
  else begin
    sSql := 'INSERT INTO sea_excepcionesmontosasig ' +
            '(ea_codmonto, ea_localidadexceptuada) VALUES ( ' +
            SqlInt(sdqDatosMF_CODMONTO.AsInteger) + ',' +
            SqlValue(sdqLocalidades.FieldByName('localidad').AsString) + ')';
    EjecutarSqlST(sSql);
    sdqExcepciones.Refresh;
  end;
end;
{---------------------------------------------------------------------------------------------------}
procedure TfrmMantMontosAsigFam.btnQuitarLicenciaClick(Sender: TObject);
var
  sSql :String;
begin
  sSql := 'DELETE FROM sea_excepcionesmontosasig ' +
          ' WHERE ea_codmonto = ' + SqlInt(sdqExcepciones.FieldByName('ea_codmonto').AsInteger) +
            ' AND ea_localidadexceptuada = ' + SqlValue(sdqExcepciones.FieldByName('ea_localidadexceptuada').AsString);
  EjecutarSqlST(sSql);
  sdqExcepciones.Refresh;
end;
{---------------------------------------------------------------------------------------------------}
end.
