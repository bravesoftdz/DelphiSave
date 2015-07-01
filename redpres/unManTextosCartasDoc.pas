{ Mantenimiento de la CDT_TEXTOSCARTASDOC }
unit unManTextosCartasDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, StdCtrls, ExtCtrls, PatternEdit,
  FormPanel, EditDialog, ComCtrls, Mask, Placemnt;

type
  TfrmManTextosCartasDoc = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    fpEditor: TFormPanel;
    Label1: TLabel;
    edCodigo: TPatternEdit;
    Label2: TLabel;
    edDescripcion: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    sdqDatosDT_FORMATO: TStringField;
    sdqDatosDT_DESCRIPCION: TStringField;
    sdqDatosDT_TEXTO: TMemoField;
    edTexto: TRichEdit;
    sdqUpdate: TSDQuery;
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManTextosCartasDoc: TfrmManTextosCartasDoc;

implementation

{$R *.DFM}

uses General, CustomDlgs, StrFuncs, AnsiSql, unDmPrincipal;

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManTextosCartasDoc }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTextosCartasDoc.Execute;
begin
   sdqDatos.Open;
   ABMDialog.Execute;
   sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTextosCartasDoc.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
begin
   Cancel := True;
   if ABMAction = aaAdd then
   begin
      edCodigo.Text      := '';
      edDescripcion.Text := '';
      edTexto.Lines.Clear;
   end
   else begin
      edCodigo.Text      := sdqDatosDT_FORMATO.Text;
      edDescripcion.Text := sdqDatosDT_DESCRIPCION.Text;
      edTexto.Lines.Text := sdqDatosDT_TEXTO.AsString;
   end;
   fpEditor.Tag := Integer(ABMAction);
   fpEditor.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTextosCartasDoc.btnAceptarClick(Sender: TObject);
var
  Sql : String;
begin
   if strLeft(edCodigo.Text, 2) <> 'AB' then
      MsgBox('El código debe comenzar con "AB".', MB_ICONEXCLAMATION)

   else if (TABMActions(fpEditor.Tag) = aaAdd) and ExisteSql('SELECT 1 FROM CDT_TEXTOSCARTASDOC WHERE DT_FORMATO = ''' + edCodigo.Text + '''') then
      MsgBox('Se encontró una carta con el código ingresado.', MB_ICONEXCLAMATION)

   else begin
     if TABMActions(fpEditor.Tag) = aaAdd then
        Sql := 'INSERT INTO CDT_TEXTOSCARTASDOC ' +
               '(DT_FORMATO, DT_DESCRIPCION, DT_TEXTO, DT_SOLOEMPRESA, DT_ADICIONAL) VALUES ' +
               '(:pCodigo, :pDescripcion, :pTexto, ''N'', ''N'')'
     else // aaModify
        Sql := 'UPDATE CDT_TEXTOSCARTASDOC' +
                 ' SET DT_DESCRIPCION = :pDescripcion, ' +
                     ' DT_TEXTO = :pTexto ' +
               ' WHERE DT_FORMATO = :pCodigo';

     sdqUpdate.SQL.Text := Sql;
     sdqUpdate.ParamByName('pCodigo').AsString      := edCodigo.Text;
     sdqUpdate.ParamByName('pDescripcion').AsString := edDescripcion.Text;
     sdqUpdate.ParamByName('pTexto').AsString       := edTexto.Text;
     dmPrincipal.sdbPrincipal.StartTransaction;
     try
       sdqUpdate.ExecSQL;
       dmPrincipal.sdbPrincipal.Commit;
       RefreshAndLocate(sdqDatos, ['DT_FORMATO'], [edCodigo.Text]);
       fpEditor.ModalResult := mrOk;
     except
       on E: Exception do begin
          ErrorMsg(E);
          dmPrincipal.sdbPrincipal.Rollback;
       end;
     end;

 {
     if TABMActions(fpEditor.Tag) = aaAdd then
        Sql := 'INSERT INTO CDT_TEXTOSCARTASDOC ' +
               '(DT_FORMATO, DT_DESCRIPCION, DT_TEXTO, DT_SOLOEMPRESA, DT_ADICIONAL) VALUES ' +
               '(''' + edCodigo.Text + ''', ''' + SqlString(edDescripcion.Text) + ''', ' +
               SqlString(StrReplace(edTexto.Text, #13, ''), True) + ', ''N'', ''N'')'
     else // aaModify
        Sql := 'UPDATE CDT_TEXTOSCARTASDOC' +
                 ' SET DT_DESCRIPCION = ' + SqlString( edDescripcion.Text, True ) + ',' +
                     ' DT_TEXTO = ' + SqlString(StrReplace(edTexto.Text, #13, ''), True) +
               ' WHERE DT_FORMATO = ''' + edCodigo.Text + '''';
     //--------------------------------------------------------
     Try
         MsgBox(IntToStr(Length( StrReplace(edTexto.Text, #13, '') )));
         EjecutarSql( Sql );
         RefreshAndLocate(sdqDatos, ['DT_FORMATO'], [edCodigo.Text]);
         fpEditor.ModalResult := mrOk;
     except
         on E: Exception do ErrorMsg(E);
     end;
}
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
