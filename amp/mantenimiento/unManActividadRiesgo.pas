unit unManActividadRiesgo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, unfraRiesgo, StdCtrls,
  ExtCtrls, QueryPrint, SortDlg, QueryToFile, ExportDialog,
  ShortCutControl, Db, SDEngine, Placemnt, Mask, ToolEdit,
  CurrEdit, FormPanel, artSeguridad, unfraCIIU, unArtFrame,
  unFraCodigoDescripcion;

type
  TfrmManActividadRiesgo = class(TForm)
    pnlFiltros: TPanel;
    lbRiesgo: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    SEP2: TToolButton;
    tbOrdenar: TToolButton;
    SEP3: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    SEP4: TToolButton;
    tbSalir: TToolButton;
    DBGrid: TRxDBGrid;
    tbAgregar: TToolButton;
    tbEliminar: TToolButton;
    SEP1: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    ShortCutControl: TShortCutControl;
    ExportDialog: TExportDialog;
    SortDialog: TSortDialog;
    QueryPrint: TQueryPrint;
    fraRiesgo: TfraRiesgo;
    lbCIIU: TLabel;
    FormPlacement: TFormPlacement;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    tbFiltrar: TToolButton;
    ToolButton2: TToolButton;
    fraCIIU: TfraCIIU;
    procedure tbAgregarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmManActividadRiesgo: TfrmManActividadRiesgo;

implementation

uses unDmPrincipal, General, CustomDlgs, AnsiSql, unPrincipal;

Const
     CAP_ALTA    = 'Alta de Anormalidades';
     CAP_MODIFIC = 'Modificación de Anormalidades';

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbAgregarClick(Sender: TObject);
var Sql : String;
begin
     if fraRiesgo.edCodigo.Text = '' Then begin
        MsgBox('Debe seleccionar el Riesgo', MB_ICONEXCLAMATION);
        fraRiesgo.edCodigo.SetFocus ;

     end else if fraCIIU.edCodigo.Text = '' Then begin
        MsgBox('Debe seleccionar el CIIU', MB_ICONEXCLAMATION);
        fraCIIU.edCodigo.SetFocus ;

     end else begin
         Sql := 'INSERT INTO ARA_RIESPORACT ' +
                '(RA_RIESGO, RA_CIIU, RA_IDRG) VALUES (' +
                SqlValue (fraRiesgo.edCodigo.Text) + ', ' +
                SqlValue (fraCIIU.edCodigo.Text) + ', ' +
                SqlNumber (fraRiesgo.ID) + ')';
         Try
            EjecutarSql( Sql );
            RefreshAndLocate(sdqConsulta, ['RA_RIESGO', 'RA_CIIU', 'RA_IDRG'], [fraRiesgo.edCodigo.Text, fraCIIU.edCodigo.Text, fraRiesgo.ID]);
          except
             on E: Exception do ErrorMsg(E);
          end;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbEliminarClick(Sender: TObject);
var Sql : String;
begin
     if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        if MsgBox('Se dispone a eliminar la gama seleccionada.' + #13 + '¿Está usted seguro?', MB_ICONQUESTION + MB_YESNO) = IDYES then begin
           Sql := 'DELETE ARA_RIESPORACT ' +
                   'WHERE RA_IDRG = ' + SqlNumber (sdqConsulta.FieldByName('RG_ID').AsInteger) +
                    ' AND RA_CIIU = ''' + sdqConsulta.FieldByName('RA_CIIU').AsString + '''';
            //--------------------------------------------------------------------------------------------------------------
           Try
              EjecutarSql( Sql );
              RefreshAndRelocate(sdqConsulta, ['RA_RIESGO', 'RA_CIIU']);
            except
               on E: Exception do ErrorMsg(E);
            end;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbRefrescarClick(Sender: TObject);
Var Sql : String;
begin

     Sql := 'SELECT RA_CIIU, AV_DESCRIPCION, RA_RIESGO, RG_DESCRIPCION, RG_ID, RG_ESOP, RA_IDRG ' +
              'FROM PRG_RIESGOS, CAV_ACTIVIDAD, ARA_RIESPORACT ' +
            ' WHERE RA_CIIU = AV_CODIGO ' +
               'AND RA_IDRG = RG_ID ';

     if tbFiltrar.Down then begin
         if fraRiesgo.edCodigo.Text <> '' Then
            Sql := Sql + 'AND RA_IDRG = ''' + fraRiesgo.ID + ''' ';

         if fraCIIU.edCodigo.Text <> '' Then
            Sql := Sql + 'AND RA_CIIU = ''' + fraCIIU.edCodigo.Text + ''' ';
     end;

     OpenQuery(sdqConsulta, Sql + SortDialog.Orderby, True);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbLimpiarClick(Sender: TObject);
begin
     fraRiesgo.Clear ;
     fraCIIU.Limpiar;
     fraRiesgo.Sql := '';
     fraCIIU.Sql   := '';
     sdqConsulta.Close ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbOrdenarClick(Sender: TObject);
begin
     SortDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbImprimirClick(Sender: TObject);
begin
     if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        if PrintDialog.Execute then begin
           QueryPrint.Footer.Text := frmPrincipal.dbLogin.Usuario;
           QueryPrint.Print ;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     frmPrincipal.mnuRiesgoporActividad.Enabled := True;
     Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.tbExportarClick(Sender: TObject);
begin
     if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
        ExportDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmManActividadRiesgo.FormCreate(Sender: TObject);
begin
     tbRefrescarClick( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
