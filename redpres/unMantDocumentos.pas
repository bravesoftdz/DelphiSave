unit unMantDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Placemnt, Db, SDEngine, ComCtrls, ToolWin,
  ImgList, Qrctrls, QuickRpt, ExtCtrls, QueryPrint, ABMDialog, EditDialog;

type
  TfrmManDocumentos = class(TForm)
    sdqDocumentos: TSDQuery;
    dsDocumentos: TDataSource;
    FormPlacement1: TFormPlacement;
    QueryPrint: TQueryPrint;
    ABMDialog: TABMDialog;
    sdqDocumentosTB_CODIGO: TStringField;
    sdqDocumentosTB_DESCRIPCION: TStringField;
    sdqDocumentosTB_CLAVE: TStringField;
    sdqDocumentosTB_BAJA: TStringField;
    sdqDocumentosTB_MODULO: TStringField;
    sdqDocumentosTB_ESPECIAL1: TStringField;
    PrintDialog: TPrintDialog;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions;
      var Cancel: Boolean);
    procedure ABMDialogGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
  public
    Procedure Execute;
  end;

var
  frmManDocumentos: TfrmManDocumentos;

implementation

uses unPrincipal, unABMDocumentos, unDmPrincipal,CustomDlgs,StrFuncs,General;

{$R *.DFM}

{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDocumentos.Execute;
begin
     sdqDocumentos.Open;
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
     sdqDocumentos.Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDocumentos.ABMDialogBeforePrint(Sender: TObject;var Cancel: Boolean);
begin
   QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
   QueryPrint.Title.Text  := Caption;
   if PrintDialog.Execute then begin
     QueryPrint.Print;
     Cancel := True;
   end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDocumentos.ABMDialogBeforeABM(Sender: TObject;ABMAction: TABMActions; var Cancel: Boolean);
var Sql:String;
begin
    AbmDialog.Fields[2].ReadOnly := False;

    if (ABMAction = aaModify) and ( sdqDocumentosTB_BAJA.Text <> 'S' ) Then begin
//       Cancel := MsgBox('Se dispone a modificar un registro eliminado, al modificarlo lo reactivará.' + #13 + '¿Esta usted seguro?', MB_ICONQUESTION + MB_YESNO) = IDNO ;
//       AbmDialog.Fields[2].ReadOnly := True;
    end else if ABMAction = aaDelete Then begin

       if (sdqDocumentosTB_CODIGO.Text = '001') or (sdqDocumentosTB_CODIGO.Text = '004') or
          (sdqDocumentosTB_CODIGO.Text = '010') or (sdqDocumentosTB_CODIGO.Text = '019') Then begin
          MsgBox('No se puede eliminar los documentos: ' + #13 + 'Denuncia de Accidente (Empresa) ' + #13 +
                                                                 'Parte Médico de Ingreso' + #13 +
                                                                 'Denuncia S.R.T. por Siniestro Grave' + #13 +
                                                                 'Parte Médico de Egreso - Alta Médica' , MB_ICONEXCLAMATION);
          Cancel := True;
       end else begin
           Cancel := True;
           If ( sdqDocumentosTB_BAJA.AsString <> 'S' )
              and ( MsgBox('¿Desea eliminar el Documento ''' + sdqDocumentosTB_CODIGO.Text + ''' ?', MB_ICONQUESTION + MB_YESNO) = IDYES ) Then begin
                Sql := ' UPDATE CTB_TABLAS ' +
                          ' SET TB_BAJA = ''S'' ' +
                        ' WHERE TB_CLAVE = ''TDOCU'' ' +
                          ' AND TB_CODIGO = ''' + sdqDocumentosTB_CODIGO.Text + '''' +
                          ' And tb_codigo <> ''0'' ' +
                          ' And tb_modulo = ''MUTUAL'' ';

                EjecutarSqlST(Sql);
                RefreshAndLocate(sdqDocumentos,['TB_CODIGO'], [sdqDocumentosTB_CODIGO.Text]);
           end;
       end; { del else del validar }
    end;

end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmManDocumentos.ABMDialogGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if ( sdqDocumentosTB_BAJA.Text = 'S' ) Then
      AFont.Color := clRed;
end;

end.
