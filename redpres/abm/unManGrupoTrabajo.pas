unit unManGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, EditDialog, StdCtrls;

type
  TfrmManGrupoTrabajo = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    sdqDatosGP_CODIGO: TStringField;
    sdqDatosGP_NOMBRE: TStringField;
    sdqDatosGP_DESCRIPCION: TStringField;
    sdqDatosGP_FBAJA: TDateTimeField;
    sdqDatosGP_SINIESTROS: TStringField;
    sdqDatosGP_DIASMAX: TFloatField;
    PrintDialog: TPrintDialog;
    sdqDatosGP_FAX: TStringField;
    sdqDatosGP_EMAIL: TStringField;
    sdqDatosGP_CRONICO: TStringField;
    sdqDatosGP_USUBAJA: TStringField;
    sdqDatosgp_usumodif: TStringField;
    sdqDatosGP_FECHAMODIF: TDateTimeField;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
                                      var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure ABMDialogPropertyClick(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManGrupoTrabajo: TfrmManGrupoTrabajo;

implementation

uses unDmPrincipal, General, unABMUsugrp, unSesion, unTercerizadoras, AnsiSql;

{----------------------------------------------------------------------------------------------------------------------}
{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManGrupoTrabajo.Execute;
var
  sSql: String;
  iIdTerce: Integer;
begin
  BeginTrans;
  try
    sSql := 'SELECT gp_codigo, gp_nombre, gp_descripcion, gp_fbaja, ' +
                  ' gp_siniestros, gp_diasmax,  gp_fax, gp_email, gp_cronico, ' +
                  ' gp_usubaja, gp_fechamodif, gp_usumodif ' +
             ' FROM mgp_gtrabajo ' +
            ' WHERE 1 = 1 ';
    iIdTerce := GetIdTercerizadora;
    if (iIdTerce > 0) then
      sSql := sSql + ' AND gp_idtercerizadora = ' + SqlInt(iIdTerce);

    sdqDatos.SQL.Text := sSql;
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
procedure TfrmManGrupoTrabajo.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  QueryPrint.Footer.Text := Sesion.Usuario;
  if PrintDialog.Execute then
  begin
    QueryPrint.Print;
    Cancel := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManGrupoTrabajo.ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
begin
   if EditField.FieldName = 'GP_CODIGO' then
      EditField.DefaultValue := IntToStr(IncSql('SELECT max(to_number(gp_codigo)) FROM mgp_gtrabajo'));
   if (EditField.FieldName = 'GP_SINIESTROS') then
      EditField.DefaultValue := 'S';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManGrupoTrabajo.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
                                                      var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
   if not sdqDatosGP_FBAJA.IsNull Then
      AFont.Style := AFont.Style + [fsStrikeOut];
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManGrupoTrabajo.ABMDialogPropertyClick(Sender: TObject);
var
  frm:TfrmUsugrp;
begin
  if sdqdatos.fieldbyname('gp_fbaja').IsNull then
  begin
    frm := TfrmUsugrp.Create(nil);
    try
       frm.sdqConsulta.ParamByName('pgtrabajo').Value := sdqdatos.fieldbyname('gp_codigo').AsInteger;
       frm.tbRefrescarClick(nil);
       frm.Showmodal;
    finally
       frm.free;
    end;
  end else
    MsgBox('No puede agregar usuarios a un grupo dado de baja');
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
