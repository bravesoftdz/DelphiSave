{ Mantenimiento de la CTT_TEXTOSCARTASDOCTRAB }
unit unManTextosCartasDocTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QueryPrint, ABMDialog, Db, SDEngine, StdCtrls, ExtCtrls, PatternEdit,
  FormPanel, EditDialog, ComCtrls, Mask, ToolEdit, ArtComboBox,
  unfraFormCartasDoc;

type
  TfrmManTextosCartasDocTrab = class(TForm)
    fpEditor: TFormPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edCodigo: TPatternEdit;
    edDescripcion: TEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edTexto: TRichEdit;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    sdqUpdate: TSDQuery;
    Label3: TLabel;
    sdqDatosTT_FORMATO: TStringField;
    sdqDatosTT_DESCRIPCION: TStringField;
    sdqDatosTT_FORMATOEMPRESA: TStringField;
    sdqDatosDT_DESCRIPCION: TStringField;
    sdqDatosTT_TEXTO: TMemoField;
    fraFormCartasDoc: TfraFormCartasDoc;
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
    procedure btnAceptarClick(Sender: TObject);
  private
  public
    procedure Execute;
  end;

var
  frmManTextosCartasDocTrab: TfrmManTextosCartasDocTrab;

implementation

{$R *.DFM}

uses General, CustomDlgs, StrFuncs, AnsiSql, unDmPrincipal;

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmManTextosCartasDocTrab }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTextosCartasDocTrab.Execute;
begin
     sdqDatos.Open;
     ABMDialog.Execute ;
     sdqDatos.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTextosCartasDocTrab.ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions; var Cancel: Boolean);
begin
     Cancel := True;
     if ABMAction = aaAdd Then begin
        edCodigo.Text          := '';
        edDescripcion.Text     := '';
        fraFormCartasDoc.Limpiar ;
        edTexto.Lines.Clear;
     end else begin
        edCodigo.Text          := sdqDatosTT_FORMATO.AsString ;
        edDescripcion.Text     := sdqDatosTT_DESCRIPCION.AsString ;
        fraFormCartasDoc.Cargar(  sdqDatosTT_FORMATOEMPRESA.AsString  );
        edTexto.Lines.Text     := sdqDatosTT_TEXTO.AsString ;
     end;

     fpEditor.Tag := Integer(ABMAction);
     fpEditor.ShowModal ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManTextosCartasDocTrab.btnAceptarClick(Sender: TObject);
Var Sql : String;
begin
     if strLeft(edCodigo.Text, 2) <> 'AB' Then begin
        MsgBox('El código debe comenzar con "AB".', MB_ICONEXCLAMATION);
        edCodigo.SetFocus ;

     end else if (TABMActions(fpEditor.Tag) = aaAdd) and ExisteSql('SELECT 1 FROM CTT_TEXTOSCARTASDOCTRAB WHERE TT_FORMATO = ''' + edCodigo.Text + '''') then begin
        MsgBox('Se encontró una carta con el código ingresado.', MB_ICONEXCLAMATION);
        edCodigo.SetFocus ;

     end else if fraFormCartasDoc.edCodigo.Text = '' then begin
        MsgBox('Debe ingresar el Formato de la Empresa.', MB_ICONEXCLAMATION) ;
        fraFormCartasDoc.edCodigo.SetFocus ;

     end else begin
         if TABMActions(fpEditor.Tag) = aaAdd then
            Sql := 'INSERT INTO CTT_TEXTOSCARTASDOCTRAB ' +
                   '(TT_FORMATO, TT_DESCRIPCION, TT_FORMATOEMPRESA, TT_TEXTO, TT_CODEVENTOTRAM, TT_ADICIONAL) VALUES ' +
                   '(:pCodigo, :pDescripcion, :pFEmpresa, :pTexto, NULL, ''N'')'
         else // aaModify
            Sql := 'UPDATE CTT_TEXTOSCARTASDOCTRAB' +
                     ' SET TT_DESCRIPCION = :pDescripcion, ' +
                         ' TT_FORMATOEMPRESA = :pFEmpresa, ' +
                         ' TT_TEXTO = :pTexto ' +
                   ' WHERE TT_FORMATO = :pCodigo';

         sdqUpdate.SQL.Text := Sql;
         sdqUpdate.ParamByName('pCodigo').AsString      := edCodigo.Text;
         sdqUpdate.ParamByName('pDescripcion').AsString := edDescripcion.Text;
         sdqUpdate.ParamByName('pFEmpresa').AsString    := fraFormCartasDoc.edCodigo.Text ; //cmbFEmpresa.FieldValue;
         sdqUpdate.ParamByName('pTexto').AsString       := edTexto.Text;
         dmPrincipal.sdbPrincipal.StartTransaction;
         try
             sdqUpdate.ExecSQL ;
             dmPrincipal.sdbPrincipal.Commit ;
             RefreshAndLocate(sdqDatos, ['TT_FORMATO'], [edCodigo.Text]);
             fpEditor.ModalResult := mrOk;
         except
             on E: Exception do begin
                ErrorMsg(E);
                dmPrincipal.sdbPrincipal.Rollback ;
             end;
         end;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
