unit unLiqListApro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, DateComboBox, ComCtrls, ToolWin, ExtCtrls,
  Grids, DBGrids, RXDBCtrl, artSeguridad, Placemnt, Db, SDEngine,
  QueryToFile, QueryPrint, ArtComboBox, ArtDBGrid, SortDlg, Qrctrls,
  QuickRpt, ShortCutControl, ExportDialog;

type
  TfrmLiqListApro = class(TForm)
    sdqDatos: TSDQuery;
    dsConsulta: TDataSource;
    FormPlacement: TFormPlacement;
    Seguridad: TSeguridad;
    Panel1: TPanel;
    tbHerramientas: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    Label1: TLabel;
    edFecha: TDateComboBox;
    tbImprimir: TToolButton;
    tbGuardar: TToolButton;
    ToolButton5: TToolButton;
    Bevel1: TBevel;
    Label2: TLabel;
    cmbDestino: TComboBox;
    dbgListado: TArtDBGrid;
    QueryPrint: TQueryPrint;
    ToolButton2: TToolButton;
    tbOrden: TToolButton;
    SortDialog: TSortDialog;
    ScrollBox: TScrollBox;
    qrpReporte: TQuickRep;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    qrlTitulo: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    qrbFooter: TQRBand;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrbPgFooter: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    tbVistaPrevia: TToolButton;
    ToolButton6: TToolButton;
    ShortCutControl: TShortCutControl;
    ExportDialog: TExportDialog;
    Bevel2: TBevel;
    Label3: TLabel;
    cmbDelegPago: TArtComboBox;
    sdqDelegPago: TSDQuery;
    dsDelegPago: TDataSource;
    PrintDialog: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure tbOrdenClick(Sender: TObject);
    procedure OnNumPrint(sender: TObject; var Value: String);
    procedure tbVistaPreviaClick(Sender: TObject);
  private
    sTotal : String;
  public
  end;

var
  frmLiqListApro: TfrmLiqListApro;

implementation

uses unPrincipal, unDmPrincipal, General, Registros, StrFuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     frmPrincipal.mnuLiquiListApro.Enabled := True;

     SetRegFromValue( Self, 'Fecha de Pago', edFecha.Text );
     SetRegFromValue( Self, 'Destino', IntToStr(cmbDestino.ItemIndex) );
     SetRegFromValue( Self, 'Orden', IntToStr(dbgListado.Tag) );
     sdqDelegPago.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.tbRefrescarClick(Sender: TObject);
Var Sql,
    SqlWhere : String;
begin
     if (edFecha.Date = 0) Then begin
        MsgBox('Debe seleccionar una fecha para poder mostrar el listado', MB_ICONEXCLAMATION);
        edFecha.SetFocus ;

     end else if (cmbDestino.Text = '') Then begin
        MsgBox('Debe seleccionar un destino para poder mostrar el listado', MB_ICONEXCLAMATION);
        cmbDestino.SetFocus ;

     end else begin
        sdqDatos.Close ;
        if cmbDestino.ItemIndex <= 1 Then
            SqlWhere := ' FROM MLA_LIQUIAPRO ' +
                       ' WHERE LA_FECHAPAGO = ' + edFecha.SqlText +
                         ' AND LA_DESTINATARIO = ''' + cmbDestino.Text[1] + ''' '
        else
            SqlWhere := ' FROM MLA_LIQUIAPRO, USE_USUARIOS ' +
                       ' WHERE LA_FECHAPAGO = ' + edFecha.SqlText +
                         ' AND LA_DESTINATARIO = ''P'' ' +
                         ' AND LA_USUAPRO = SE_USUARIO ' +
                         ' AND SE_SECTOR = ''' + frmPrincipal.DBLogin.Sector + ''' ' ;

        if (cmbDelegPago.Text <> '') Then SqlWhere := SqlWhere + ' AND LA_CODIGODELEGACION = ''' + cmbDelegPago.FieldValue + '''';

        Sql := ' SELECT LA_DELEGACION, LA_VOLANTE, LA_PRESTADOR, LA_DESTINO, LA_FACTURA, LA_FECHAFACTURA, ' +
                      ' LA_MONTO MONTO, LA_FECHAPAGO, LA_USUAPRO, LA_TIPO, LA_NOTADEBITO' +
                      SqlWhere;
{
        if dbgListado.Tag <> -1 Then
           Sql := Sql + ' ORDER BY ' + dbgListado.Columns[dbgListado.Tag].FieldName ;
}
//        Sql := Sql + ' ORDER BY LA_PRESTADOR, LA_VOLANTE, LA_TIPO, LA_MONTO DESC ';
        Sql := Sql + SortDialog.OrderBy ;
        CopySqlClp( Sql );
        sdqDatos.SQL.Text := Sql;
        sdqDatos.Open ;

        sTotal := ValorSql('SELECT SUM(LA_MONTO) ' + SqlWhere);
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.tbSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.FormCreate(Sender: TObject);
begin
     edFecha.Date := StrToDate( GetRegFromValue( Self, 'Fecha de Pago', DateToStr(Date) ) );
     cmbDestino.ItemIndex := StrToInt(GetRegFromValue( Self, 'Destino', '0') ) ;
     dbgListado.Tag       := StrToInt(GetRegFromValue( Self, 'Orden', '-1') );
     sdqDelegPago.Open;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
     if Column = 'MONTO' Then begin
        AlignFooter := afRight;
        Value       := sTotal;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.tbImprimirClick(Sender: TObject);
begin
     if MsgBox('¿Desea imprimir un listado con los resultados de la consulta?', MB_ICONQUESTION + MB_YESNO) = IDYES Then begin
        qrlUsuario.Caption := frmPrincipal.DBLogin.Usuario ;
        qrlTitulo.Caption  := 'Liquidaciones Aprobadas el ' + edFecha.Text + ' con destino ' + cmbDestino.Text ;
        if PrintDialog.Execute then qrpReporte.Print;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.tbGuardarClick(Sender: TObject);
begin
     ExportDialog.Execute ; 
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.QueryPrintGetTotals(Sender: TObject; Field: TPrintField;  var Value: String);
begin
     if Field.DataField = 'LA_FECHAFACTURA' Then
        Value := 'Total';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.tbOrdenClick(Sender: TObject);
begin
     SortDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.OnNumPrint(sender: TObject; var Value: String);
begin
     Value := FormatFloat( '#,#0.00', StrToFloat( Value ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqListApro.tbVistaPreviaClick(Sender: TObject);
begin
    qrlUsuario.Caption := frmPrincipal.DBLogin.Usuario ;
    qrlTitulo.Caption  := 'Liquidaciones Aprobadas el ' + edFecha.Text + ' con destino ' + cmbDestino.Text ;
    qrpReporte.PreviewModal ;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
