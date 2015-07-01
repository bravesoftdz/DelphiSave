unit unListCostoPorCIE10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, SDEngine, SortDlg, artSeguridad, Placemnt, ShortCutControl,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  ExtCtrls, Mask, ToolEdit, DateComboBox, QueryPrint, QueryToFile,
  ExportDialog, unFraCIE10, CheckLst;

type
  TfrmListCostoPorCIE10 = class(TForm)
    pnlFiltros: TPanel;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton5: TToolButton;
    tbExportar: TToolButton;
    ToolButton1: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton3: TToolButton;
    tbSalir: TToolButton;
    DBGrid: TArtDBGrid;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    SortDialog: TSortDialog;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    tbImprimir: TToolButton;
    ExportDialog: TExportDialog;
    QueryPrint: TQueryPrint;
    FormStorage: TFormStorage;
    fraCIE10: TfraCIE10;
    lstFechas: TCheckListBox;
    PrintDialog: TPrintDialog;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBGridPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
  private
  public
  end;

var
  frmListCostoPorCIE10: TfrmListCostoPorCIE10;

implementation

uses unDmPrincipal, unPrincipal, Numeros, General;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.tbRefrescarClick(Sender: TObject);
Var Sql : String;
    i   : Integer;
    bOR, FechasChequeadas : Boolean;
begin
     FechasChequeadas := False;
     Sql := 'SELECT DG_CODIGO, DG_DESCRIPCION, CC_FECHA, ' +
                  ' DG_DIASLEVE, DG_DIASMODERADO, DG_DIASGRAVE, ' +
                  ' ROUND((DG_DIASLEVE + DG_DIASMODERADO + DG_DIASGRAVE) / 3, 2) DIASPROMEDIO, ' +
                  ' ROUND(CC_DIASCAIDOS / CC_CASOSALTA, 2)  DIASPROMEDIO_REAL, ' +
                  ' CC_CASOSALTA, ' +
                  ' DG_COSTOLEVE, DG_COSTOMODERADO, DG_COSTOGRAVE, ' +
                  ' ROUND((DG_COSTOLEVE + DG_COSTOMODERADO + DG_COSTOGRAVE) / 3, 2) COSTOPROMEDIO, ' +
                  ' ROUND(CC_IMPORTE / CC_CASOSPAGOS, 2)  COSTOPROMEDIO_REAL, ' +
                  ' CC_CASOSPAGOS ' +
             ' FROM CDG_DIAGNOSTICO, CCC_COSTOPORCIE10 ' +
            ' WHERE DG_CODIGO = CC_CIE10 ' ;

     bOR := False;
     for i := 0 to lstFechas.Items.Count - 1 do
        if lstFechas.Checked[i] then begin
           Sql := Sql + IIF(bOR, ' OR', ' AND (') + ' CC_FECHA = TO_DATE(''' + lstFechas.Items[i] + ''' ,''DD/MM/YYYY'')' ;
           bOr := True;
           FechasChequeadas := True;
        end;
     if FechasChequeadas then Sql := Sql + ' ) ';
     if fraCIE10.edCodigo.Text <> '' Then
        Sql := Sql + ' AND CC_CIE10 = ''' + fraCIE10.edCodigo.Text + '''' ;

     OpenQuery(sdqDatos, Sql + SortDialog.OrderBy);

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     frmPrincipal.mnuCostosporCIE10.Enabled := True;
     Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.tbOrdenarClick(Sender: TObject);
begin
     SortDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.tbExportarClick(Sender: TObject);
begin
     ExportDialog.Execute ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.tbLimpiarClick(Sender: TObject);
Var i : Integer;
begin
     if lstFechas.Items.Count > 0 Then begin
        for i := 0 to lstFechas.Items.Count - 1 do
            lstFechas.Checked[i] := False;
       // lstFechas.Checked[0] := True;
     end;
     //-------------------------------------------
     fraCIE10.Limpiar ;
     sdqDatos.Close ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.tbImprimirClick(Sender: TObject);
begin
     With QueryPrint do begin
          Title.Logo.Picture.Assign( frmPrincipal.imgLogo.Picture );
          Title.Logo.Height := 200;
          Title.Logo.Width  := 1600;
          // para agregar el subtitulo (los filtros).By LU.
          Subtitle.Lines.Clear;
          if fraCIE10.edCodigo.Text <> '' Then
            Subtitle.Lines.Add('  CIE10: ' + fraCIE10.cmbDescripcion.Text);
          Footer.Text := frmPrincipal.DBLogin.Usuario ;
          if PrintDialog.Execute then Print ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.tbSalirClick(Sender: TObject);
begin
     Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.DBGridTitleClick(Column: TColumn);
begin
    if sdqDatos.Active Then begin
       SortDialog.SortBy( SortDialog.SortFields.ItemsByField[Column.Field.FieldName], otNone);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.DBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if (Field.FieldName = 'CA_DESCRIPCION') and (Not sdqDatos.FieldByName('CA_FECHABAJA').IsNull ) Then
        AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.FormCreate(Sender: TObject);
begin
     lstFechas.Items.Assign( ValoresSql('SELECT DISTINCT CC_FECHA FROM CCC_COSTOPORCIE10 ORDER BY CC_FECHA DESC'));
     tbLimpiarClick( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListCostoPorCIE10.DBGridPaintFooter(Sender: TObject;Column: String; var Value: String; var CellColor, FontColor: TColor;var AlignFooter: TAlingFooter);
begin
     if Column = 'DG_CODIGO' Then
       Value := IntToStr(sdqDatos.RecordCount);
end;

end.
