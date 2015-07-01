unit unManPracticasModulos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, Db, SDEngine, EditDialog, Placemnt;

type
  TfrmManPracticasModulos = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    FormPlacement1: TFormPlacement;
    sdqDatosPM_ID: TFloatField;
    sdqDatosPM_DESCRIPCION: TStringField;
    sdqDatosPM_USUALTA: TStringField;
    sdqDatosPM_FECHALTA: TDateTimeField;
    sdqDatosPM_USUBAJA: TStringField;
    sdqDatosPM_FECHABAJA: TDateTimeField;
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure ABMDialogGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    procedure Execute;
  end;

var
  frmManPracticasModulos: TfrmManPracticasModulos;

implementation

uses unDmPrincipal, AnsiSql, unPrincipal, General, CustomDlgs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPracticasModulos.Execute;
begin
   dmPrincipal.sdbPrincipal.StartTransaction;
   try
     sdqDatos.Open;
     ABMDialog.Execute;
     sdqDatos.Close;
     dmPrincipal.sdbPrincipal.Commit;
   except
      on E: Exception do begin
        ErrorMsg(E, 'Se han descartado los cambios');
        dmPrincipal.sdbPrincipal.Rollback;
      end;
   end;
   sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManPracticasModulos.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
var
  sSql :String;
begin
  if (ABMAction = aaDelete) then
  begin
    Cancel := True;
    sSql := 'SELECT 1 FROM amed.mim_incluyemodulo ' +
            ' WHERE im_idpracticamodulo = ' + SqlInt(sdqDatos.FieldByName('PM_ID').AsInteger) +
              ' AND im_fechabaja IS NULL';
    if ExisteSql(sSql) then
      MsgBox('Esta práctica se encuentra cargada en un módulo vigente.', MB_ICONEXCLAMATION)
    else begin
      sSql := 'UPDATE amed.mpm_practicamodulo ' +
                ' SET pm_usubaja = ' + SqlValue(frmPrincipal.DBLogin.LoginName) + ',' +
                    ' pm_fechabaja = actualdate ' +
              ' WHERE pm_id = ' + SqlInt(sdqDatos.FieldByName('PM_ID').AsInteger);
      EjecutarSqlST(sSql);
      sdqDatos.Refresh;
    end;
  end;
end;

procedure TfrmManPracticasModulos.ABMDialogGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(sdqDatosPM_FECHABAJA.IsNull) then AFont.Color := clRed;
end;

end.
