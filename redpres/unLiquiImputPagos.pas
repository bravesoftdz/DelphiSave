unit unLiquiImputPagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PeriodoPicker, StdCtrls, Mask, ToolEdit, ArtComboBox, ExtCtrls,
  unfraConPago, ComCtrls, ToolWin, Placemnt, artSeguridad, Db, SDEngine,
  QueryToFile, SortDlg, QueryPrint, ABMDialog, ExportDialog, unArtFrame,
  unFraCodigoDescripcion, unArtDBAwareFrame;

type
  TfrmLiquiImputPagos = class(TForm)
    Seguridad: TSeguridad;
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    tbVistaPrevia: TToolButton;
    tbImprimir: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    tbExportar: TToolButton;
    ToolButton7: TToolButton;
    tbSalir: TToolButton;
    tbLimpiar: TToolButton;
    fraConPago: TfraConPago;
    lbDestinatario: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    PeriodoPicker: TPeriodoPicker;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    cmbEstados: TArtComboBox;
    sdqDatos: TSDQuery;
    SortDialog: TSortDialog;
    cmbDestinatario: TComboBox;
    Bevel2: TBevel;
    Label3: TLabel;
    Bevel1: TBevel;
    chkSutTotDestinatario: TCheckBox;
    chkSutTotPrestador: TCheckBox;
    chkSutTotEstado: TCheckBox;
    chkSutTotMesFact: TCheckBox;
    edMes: TEdit;
    FormStorage: TFormStorage;
    QueryPrint: TQueryPrint;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    ExportDialog: TExportDialog;
    lbConPago: TLabel;
    PrintDialog: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbVistaPreviaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure PeriodoPickerChange(Sender: TObject);
    procedure cmbEstadosCloseUp(Sender: TObject);
    procedure cmbDestinatarioChange(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure QueryPrintGetSubTotals(Sender: TObject; Field: TPrintField;
      var Value: String);
    procedure ExportDialogBeforeExport(Sender: TObject);
  private
    function GenerarConsulta : Boolean;
    procedure RepararOrden ;
    procedure AgruparQueryPrint;
  public
  end;

var
  frmLiquiImputPagos: TfrmLiquiImputPagos;

implementation

uses unDmPrincipal, unPrincipal, General, CustomDlgs, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuLiquiImputPagos.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.tbSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.FormCreate(Sender: TObject);
begin
     PeriodoPicker.Periodo.MaxPeriodo := ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL');
     sdqEstado.Open ;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiImputPagos.GenerarConsulta : Boolean;
Var Sql : String;
begin
   Result := False;
   if fraConPago.IsEmpty Then
      MsgBox('Debe seleccionar un Concepto de Pago', MB_ICONEXCLAMATION)
   else begin
      RepararOrden;

      Sql := 'SELECT cp_denpago, AMEBPBA.GET_DESTINATARIO(vo_destinatario) DESTINATARIO, ca_descripcion, tb_descripcion, ' +
                   ' to_char(vo_fechafactura, ''mm/yyyy'') MESFACTURA, sum(iv_impfacturado) IMPFACTURADO ' +
              ' FROM cpr_prestador, ctb_tablas, svo_volantes, siv_itemvolante, scp_conpago ' +
             ' WHERE iv_volante = vo_volante ' +
               ' AND vo_prestador = ca_identificador ' +
               ' AND cp_conpago = iv_conpago ' +
               ' AND tb_clave = ''MUVOL'' ' +
               ' AND tb_codigo = vo_estado ' +
               ' AND iv_estado <> ''X'' ' ;
      //----------------------------------------------------------------------------------------------------------------
      if fraConPago.IsSelected Then
          Sql := Sql + ' AND CP_CONPAGO = ' + SqlInt(fraConPago.Value) ;

      if cmbDestinatario.ItemIndex > -1 Then
          Sql := Sql + ' AND VO_DESTINATARIO = ''' + cmbDestinatario.Text[1] + ''' ';

      if cmbEstados.FieldValue <> '' Then
          Sql := Sql + ' AND VO_ESTADO = ''' + cmbEstados.FieldValue + '''' ;

      if not PeriodoPicker.Periodo.IsNull  Then
          Sql := Sql + ' AND to_char(vo_fechafactura, ''mm/yyyy'') = ''' + PeriodoPicker.Periodo.Valor + '''' ;

      //----------------------------------------------------------------------------------------------------------------
      Sql := Sql + ' GROUP BY cp_denpago, vo_destinatario, ca_descripcion, tb_descripcion, to_char(vo_fechafactura, ''mm/yyyy'') ' +
             SortDialog.OrderBy  ;

      CopySqlClp( Sql );
      Try
         sdqDatos.Close;
         sdqDatos.Sql.Text := Sql;
         sdqDatos.Open;
         if sdqDatos.IsEmpty Then begin
             Result := False;
             MsgBox('No se encontraron datos para la selección realizada', MB_ICONEXCLAMATION );
         end else
             Result := True;
      except
        on E: Exception do begin
          ErrorMsg( E, 'Error inesperado al Generar la Consulta' );
          Result := False;
        end;
      end;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.tbLimpiarClick(Sender: TObject);
begin
     fraConPago.Clear;
     cmbDestinatario.ItemIndex   := -1;
     cmbEstados.FieldValue       := '';
     PeriodoPicker.Periodo.Valor := '';
     //--------------------------------------
     chkSutTotDestinatario.Checked := False ;
     chkSutTotPrestador.Checked    := False ;
     chkSutTotEstado.Checked       := False ;
     chkSutTotMesFact.Checked      := False ;
     //--------------------------------------
     chkSutTotDestinatario.Enabled := True ;
     chkSutTotPrestador.Enabled    := True ;
     chkSutTotEstado.Enabled       := True ;
     chkSutTotMesFact.Enabled      := True ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.tbVistaPreviaClick(Sender: TObject);
begin
     if GenerarConsulta Then
        ABMDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.tbImprimirClick(Sender: TObject);
begin
     if GenerarConsulta Then
        with QueryPrint do begin
             AgruparQueryPrint;
             Footer.Text := frmPrincipal.DBLogin.Usuario ;
             if PrintDialog.Execute then Print ;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.tbExportarClick(Sender: TObject);
begin
     ExportDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.tbOrdenarClick(Sender: TObject);
begin
     RepararOrden;
     SortDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.PeriodoPickerChange(Sender: TObject);
begin
     chkSutTotMesFact.Enabled := PeriodoPicker.Periodo.IsNull ;
     edMes.Text               := PeriodoPicker.Periodo.GetPeriodoName ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.cmbEstadosCloseUp(Sender: TObject);
begin
     chkSutTotEstado.Enabled := cmbEstados.FieldValue = '';
end;
{--------------------------------<--------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.cmbDestinatarioChange(Sender: TObject);
begin
     chkSutTotDestinatario.Enabled := (cmbDestinatario.ItemIndex = -1);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.RepararOrden;
   procedure Fijar(AFieldName : String);
   begin
        SortDialog.FixedRows := SortDialog.FixedRows + 1;
        SortDialog.SortFields.ItemsByField[AFieldName].Index := 0;
        SortDialog.SortFields.ItemsByField[AFieldName].Order := otAscending; 
   end;
begin
     SortDialog.FixedRows := 0;
     //---------------------------------------------------------
     if chkSutTotMesFact.Checked and chkSutTotMesFact.Enabled then
        Fijar('MESFACTURA');

     if chkSutTotEstado.Checked and chkSutTotEstado.Enabled then
        Fijar('TB_DESCRIPCION');

     if chkSutTotPrestador.Checked and chkSutTotPrestador.Enabled then
        Fijar('CA_DESCRIPCION');

     if chkSutTotDestinatario.Checked and chkSutTotDestinatario.Enabled Then
        Fijar('DESTINATARIO');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
     if Field.DataField = 'MESFACTURA' Then
        Value := 'Total' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.AgruparQueryPrint;
begin
     QueryPrint.FieldByName['MESFACTURA'].SubTotalGroup     := (chkSutTotMesFact.Checked and chkSutTotMesFact.Enabled);
     QueryPrint.FieldByName['TB_DESCRIPCION'].SubTotalGroup := (chkSutTotEstado.Checked and chkSutTotEstado.Enabled);
     QueryPrint.FieldByName['CA_DESCRIPCION'].SubTotalGroup := (chkSutTotPrestador.Checked and chkSutTotPrestador.Enabled);
     QueryPrint.FieldByName['DESTINATARIO'].SubTotalGroup   := (chkSutTotDestinatario.Checked and chkSutTotDestinatario.Enabled);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.QueryPrintGetSubTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
     if Field.DataField = 'MESFACTURA' Then
        Value := 'SubTotal (' + FloatToStr( Field.SubTotalValue ) + ')' ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiImputPagos.ExportDialogBeforeExport(Sender: TObject);
begin
     GenerarConsulta;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
