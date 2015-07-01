unit UnManSubPrestaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, EditDialog;

type
  TfrmManSubPrestaciones = class(TForm)
    dsDatos: TDataSource;
    sdqDatos: TSDQuery;
    ABMDialog: TABMDialog;
    QueryPrint: TQueryPrint;
    sdqDatosTB_CLAVE: TStringField;
    sdqDatosTB_CODIGO: TStringField;
    sdqDatosTB_DESCRIPCION: TStringField;
    sdqDatosTB_MODULO: TStringField;
    sdqDatosTB_ESPECIAL1: TStringField;
    sdqDatosTB_BAJA: TStringField;
    sdqDatosTB_ESPECIAL2: TStringField;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ABMDialogGetDefaults(DataSet: TDataSet; EditField: TEditField);
  private
  public
    Procedure Execute;
  end;

var
  frmManSubPrestaciones: TfrmManSubPrestaciones;

implementation

uses unPrincipal, unDmPrincipal, CustomDlgs, General, StrFuncs;

{$R *.DFM}

{ TfrmManSubPrestaciones }
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSubPrestaciones.Execute;
begin
     sdqDatos.Open;
     dmPrincipal.sdbPrincipal.StartTransaction;
     try
         ABMDialog.Execute ;
         dmPrincipal.sdbPrincipal.Commit;
     Except
        on E: Exception do begin
          ErrorMsg(E, 'Se han descartado los cambios');
          dmPrincipal.sdbPrincipal.Rollback;
        end;
     end;
     sdqDatos.Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSubPrestaciones.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
   QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
   if PrintDialog.Execute then begin
     QueryPrint.Print;
     Cancel := True;
   end;
end;

{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSubPrestaciones.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
var Sql:String;
begin
    AbmDialog.Fields[2].ReadOnly := (ABMAction = aaModify);

    if (ABMAction = aaModify) and (sdqDatosTB_BAJA.AsString = 'S') Then begin
       Cancel := MsgBox('Se dispone a modificar un registro eliminado, al modificarlo lo reactivará.' + #13 + '¿Esta usted seguro?', MB_ICONQUESTION + MB_YESNO) = IDNO ;
    end else if ABMAction = aaDelete Then begin
       Cancel := True;
       If (sdqDatosTB_BAJA.AsString <> 'S') and ( MsgBox('¿Desea eliminar la Subprestación Nº ' + sdqDatosTB_CODIGO.Text + '?', MB_ICONQUESTION + MB_YESNO) = IDYES ) Then begin
            Sql := ' UPDATE CTB_TABLAS ' +
                      ' SET TB_BAJA = ''S'' ' +
                    ' WHERE TB_CLAVE = ''SUBPR'' ' +
                      ' AND TB_CODIGO = ''' + sdqDatosTB_CODIGO.Text + '''';
            EjecutarSqlST(Sql);
            RefreshAndLocate(sdqDatos,['TB_CODIGO'], [sdqDatosTB_CODIGO.Text]);
       end;
    end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSubPrestaciones.ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if sdqDatosTB_BAJA.AsString = 'S' Then
        AFont.Color := clRed;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManSubPrestaciones.ABMDialogGetDefaults(DataSet: TDataSet;EditField: TEditField);
begin
  if EditField.FieldName = 'TB_CODIGO' Then
    EditField.DefaultValue := ValorSql('SELECT LPAD(MAX(TB_CODIGO) + 1, 3, ''0'') FROM CTB_TABLAS WHERE TB_CLAVE = ''SUBPR''');
end;

end.
