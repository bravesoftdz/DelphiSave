unit unCustomConsulta;

{********************************************************}
{                                                        }
{    Clase Abstracta para Consultas                      }
{    Esta clase se utiliza para crear consultas y/o      }
{    mantenimiento de tablas con herencia visual.        }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 05/2002                                      }
{                                                        }
{********************************************************}

interface

uses
  {$IFNDEF VER150} rxToolEdit, rxPlacemnt, JvComponentBase, {$ELSE} ToolEdit, Placemnt, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, ExtCtrls, ShortCutControl, ARTSeguridad, QueryPrint, Variants,
  QueryToFile, ExportDialog, SortDlg, FSForm, ArtComboBox, ArtDBGrid, FieldHider, ImgList, Menus;

type
  TfrmCustomConsulta = class(TFSForm)
    CoolBar: TCoolBar;
    dsConsulta: TDataSource;
    ExportDialog: TExportDialog;
    FieldHider: TFieldHider;
    FormStorage: TFormStorage;
    Grid: TArtDBGrid;
    pnlFiltros: TPanel;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    sdqConsulta: TSDQuery;
    Seguridad: TSeguridad;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    tbEliminar: TToolButton;
    tbEnviarMail: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    tbLimpiar: TToolButton;
    tbMaxRegistros: TToolButton;
    tbModificar: TToolButton;
    tbMostrarFiltros: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    tbNuevo: TToolButton;
    tbOrdenar: TToolButton;
    tbPropiedades: TToolButton;
    tbRefrescar: TToolButton;
    tbSalir: TToolButton;
    ToolBar: TToolBar;
    ToolButton11: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbMaxRegistrosClick(Sender: TObject);
    procedure tbMostrarFiltrosClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
  private
    FAutoColWidths, FRefreshing: Boolean;
    FDataSource: TDataSource;
    FDBGrid: TDBGrid;
    FDBPrint: TQueryPrint;
    FMenuItem: TMenuItem;
    FExtraOrder: string;

    procedure SetDataSorce(const Value: TDataSource);
    procedure SetDBGrid(const Value: TDBGrid);
    procedure SetDBPrint(const Value: TQueryPrint);
    procedure SetExtraOrder(const Value: string);
  protected
    bAllowPrint,
    bAllowExport,
    bAllowSendMail,
    bAllowDelete,
    bAllowModify  : Boolean;
    procedure CheckButtons; virtual;
    procedure ClearData; virtual;
    procedure EnableButtons(AEnabled : Boolean = True); virtual;
    //function GetSql: string; virtual;
    function  FiltersChanged: Boolean; virtual;
    function  GetRefreshing: Boolean; virtual;
    procedure HideTitlebar;
    procedure LoadDynamicSortFields(ASortFields : TSortFields; AColumns : TDBGridColumns);
    procedure PrintResults; virtual;
    procedure RefreshData; virtual;
    procedure DoMarcarFila; virtual;
  public
    MaxRegistros : Integer;
    {$IFNDEF PAQUETE}
    {$IFNDEF SERVICE}
    procedure DoBuscarCampoCodigoBarras(const aCampoBusqueda: String; aValorBuscado: String = ''; aValorAlfanumerico: Boolean = False; aClaveUnica: Boolean = False);
    {$ENDIF}
    {$ENDIF}
    property MenuItem: TMenuItem read FMenuItem write FMenuItem;
    procedure DoImprimirConsulta(Query: TSDQuery; Grilla: TArtDBGrid; Titulo: String = '');    // para el caso de más de una grilla
    procedure DoExportarConsulta(Query: TSDQuery; Grilla: TArtDBGrid);                         // para el caso de más de una grilla
  published
    property AutoColWidths: boolean read FAutoColWidths write FAutoColWidths;
    property DataSource: TDataSource read FDataSource write SetDataSorce;
    property DBGrid: TDBGrid read FDBGrid write SetDBGrid;
    property DBPrint: TQueryPrint read FDBPrint write SetDBPrint;
    property ExtraOrder: string read FExtraOrder write SetExtraOrder;
    property Refreshing: Boolean read GetRefreshing;
  end;

  procedure PrintResultsNew(PrintDialog: TPrintDialog; DBGrid: TDBGrid; DataSource: TDataSource; DBPrint: TQueryPrint; tbImprimir: TToolButton; Titulo, SubTitulo: String);

Var
  {$IFDEF ICONOS_SIST_NUEVO}
    IMG_FILTROS_SHOW : Integer = 10;
    IMG_FILTROS_HIDE : Integer = 11;
  {$ELSE}
    IMG_FILTROS_SHOW : Integer = 18;
    IMG_FILTROS_HIDE : Integer = 19;
  {$ENDIF}

implementation

uses
  {$IFDEF CUSTOM_PRINCIPAL}unCustomPrincipal,{$ENDIF} {$IFDEF CAS}unMenu, {$ENDIF}
  unART, unDmPrincipal, CustomDlgs, Clipbrd, VclExtra, unPrincipal, General, unGrids,
  ArchFuncs, {$IFNDEF PAQUETE}{$IFNDEF SERVICE}unCapturarCodigoBarras, {$ENDIF}{$ENDIF}StrFuncs;

{$R *.DFM}

procedure TfrmCustomConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(MenuItem) then
    MenuItem.Enabled := True;
end;

procedure TfrmCustomConsulta.FormCreate(Sender: TObject);
begin
  {$IFNDEF VER150}
  Toolbar.BorderWidth := 0;
  Toolbar.AutoSize := True;
  Coolbar.AutoSize := True;
  {$ENDIF}
{
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    tbEnviarMail.Visible := False;
}
  if Owner is TMenuItem Then
    TMenuItem(Owner).Enabled := False;

  FDBGrid        := Grid;
  FDataSource    := dsConsulta;
  FDBPrint       := QueryPrint;
  FAutoColWidths := False;
  FRefreshing    := False;

  {$IFDEF CAS}
  Seguridad.DBLogin := frmMenu.DBLogin;
  {$ELSE}{$IFDEF SQLSERVER}
  Seguridad.DBLogin := dmPrincipal.DBLogin;
  {$ELSE}
  Seguridad.DBLogin := frmPrincipal.DBLogin;
  {$ENDIF}{$ENDIF}

  if Toolbar.Images <> dmPrincipal.ilByN then
  begin
    {$IFDEF RED_PRES}
    ToolBar.Images    := frmPrincipal.imgGenBW;
    ToolBar.HotImages := frmPrincipal.imgGenColor;

    tbRefrescar.ImageIndex              := 4;
    tbNuevo.ImageIndex                  := 23;
    tbModificar.ImageIndex              := 24;
    tbEliminar.ImageIndex               := 25;
    tbPropiedades.ImageIndex            := 15;
    tbLimpiar.ImageIndex                := 3;
    tbOrdenar.ImageIndex                := 5;
    tbMostrarOcultarColumnas.ImageIndex := 14;
    tbImprimir.ImageIndex               := 7;
    tbExportar.ImageIndex               := 1;
    tbEnviarMail.ImageIndex             := 39;
    tbMostrarFiltros.ImageIndex         := 17;
    tbMaxRegistros.ImageIndex           := 19;
    tbSalir.ImageIndex                  := 8;
    {$ENDIF}

    {$IFDEF ADMIN_ANALISIS}
    ToolBar.Images    := frmPrincipal.imgGenBW;
    ToolBar.HotImages := frmPrincipal.imgGenColor;

    tbRefrescar.ImageIndex := 6;
    tbNuevo.ImageIndex := 0;
    tbModificar.ImageIndex := 1;
    tbEliminar.ImageIndex := 2;
    tbPropiedades.ImageIndex := 16;
    tbLimpiar.ImageIndex := 5;
    tbOrdenar.ImageIndex := 7;
    tbMostrarOcultarColumnas.ImageIndex := 27;
    tbImprimir.ImageIndex := 9;
    tbEnviarMail.ImageIndex := 36;
    tbMostrarFiltros.ImageIndex := 18;
    tbMaxRegistros.ImageIndex := 20;
    tbSalir.ImageIndex := 10;
    {$ENDIF}
  end;
  
  bAllowPrint    := True;
  bAllowExport   := True;
  bAllowSendMail := True;
  bAllowModify   := True;
  bAllowDelete   := True;
  MaxRegistros   := 0;
  LoadDynamicSortFields( SortDialog.SortFields, FDBGrid.Columns );
  Seguridad.Ejecutar;
end;

procedure TfrmCustomConsulta.FSFormDestroy(Sender: TObject);
begin
  if Owner is TMenuItem Then
    TMenuItem(Owner).Enabled := True;
end;

function TfrmCustomConsulta.GetRefreshing: Boolean;
begin
  Result := FRefreshing;
end;

procedure TfrmCustomConsulta.GridDblClick(Sender: TObject);
begin
   if tbModificar.Visible and tbModificar.Enabled Then
      tbModificar.Click;
end;

procedure TfrmCustomConsulta.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin //by PTD
  if (Uppercase(Chr(Key)) = 'C') and (ssCtrl in Shift) and (not (dgRowSelect in Grid.Options)) then
    if not VarIsNull(Grid.SelectedField.Value) then
      Clipboard.AsText := Grid.SelectedField.Value;
end;

procedure TfrmCustomConsulta.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  AMetodo: TDataSetNotifyEvent;
begin
  if Assigned(FDBGrid) and ((FDBGrid.Columns.State = csDefault) or AutoColWidths) then
  begin
    AMetodo := DataSet.AfterScroll;
    DataSet.AfterScroll := nil;
    try
      DynColWidthsByData(FDBGrid);
    finally
      DataSet.AfterScroll := AMetodo;
    end;
  end;
end;

procedure TfrmCustomConsulta.SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
begin
  if Component = tbImprimir Then
    bAllowPrint  := False;

  if Component = tbExportar Then
    bAllowExport := False;

  if Component = tbEnviarMail Then
    bAllowSendMail := False;

  if Component = tbModificar Then
     bAllowModify := False;

  if Component = tbEliminar Then
     bAllowDelete := False;
end;

procedure TfrmCustomConsulta.tbEnviarMailClick(Sender: TObject);
begin
  if not MsgAsk('¿Desea enviar un correo electrónico con la información seleccionada?') then
    Abort;
end;

procedure TfrmCustomConsulta.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
begin
  if FDataSource.DataSet.Active and (not FDataSource.DataSet.IsEmpty) then begin
     tbExportar.Enabled := False;
     Try
       AutoCols := ExportDialog.Fields.Count = 0;
       try
         if AutoCols Then
           ExportDialog.Fields.Assign( FDBGrid.Columns );

         ExportDialog.Execute;
       finally
         if AutoCols Then
            ExportDialog.Fields.Clear;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
end;

procedure TfrmCustomConsulta.tbImprimirClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmCustomConsulta.tbLimpiarClick(Sender: TObject);
begin
  ClearData;
end;

procedure TfrmCustomConsulta.tbMaxRegistrosClick(Sender: TObject);
begin
  if tbMaxRegistros.Down then
  begin
    MaxRegistros        := InputBoxInteger('Limitar el máximo de registros por consulta', 'Ingrese la cantidad máxima de registros', IIF(MaxRegistros > 0, MaxRegistros, 50));
    tbMaxRegistros.Down := MaxRegistros > 0;
  end else
    MaxRegistros        := 0;
end;

procedure TfrmCustomConsulta.tbMostrarFiltrosClick(Sender: TObject);
begin
  if tbMostrarFiltros.Down Then begin
     pnlFiltros.Visible    := False;
     tbMostrarFiltros.Hint := 'Mostrar Filtros';
     tbMostrarFiltros.ImageIndex := IMG_FILTROS_SHOW;
     if Visible and FDBGrid.CanFocus Then
        FDBGrid.SetFocus;
  end else begin
     pnlFiltros.Visible    := True;
     tbMostrarFiltros.Hint := 'Ocultar Filtros';
     tbMostrarFiltros.ImageIndex := IMG_FILTROS_HIDE;
     if Visible Then
        SelectNext(pnlFiltros, True, True);
  end;
end;

procedure TfrmCustomConsulta.tbMostrarOcultarColumnasClick( Sender: TObject);
begin
   FieldHider.Execute;
end;

procedure TfrmCustomConsulta.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields( SortDialog.SortFields, FDBGrid.Columns );
  SortDialog.Execute;
end;

procedure TfrmCustomConsulta.tbRefrescarClick(Sender: TObject);
begin
   RefreshData;
end;

procedure TfrmCustomConsulta.tbSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCustomConsulta.SetDataSorce(const Value: TDataSource);
begin
  if (FDataSource <> Value) Then
  begin
    FDataSource := Value;
    
    if FDataSource.DataSet = sdqConsulta then
      FDataSource.DataSet.AfterOpen := sdqConsultaAfterOpen;

    FDBPrint.DataSource           := FDataSource;
    ExportDialog.DataSet          := FDataSource.DataSet;
    SortDialog.DataSet            := FDataSource.DataSet;

    if Assigned(FDBGrid) Then
      FDBGrid.DataSource          := FDataSource;

    CheckButtons;
  end;
end;

procedure TfrmCustomConsulta.SetDBGrid(const Value: TDBGrid);
begin
  if (FDBGrid <> Value) Then
  begin
    FDBGrid := Value;
    FDBGrid.OnDblClick := GridDblClick;
    FieldHider.DBGrid  := FDBGrid;
  end;
end;

procedure TfrmCustomConsulta.SetDBPrint(const Value: TQueryPrint);
begin
  if (FDBPrint <> Value) Then
  begin
    FDBPrint := Value;
    FieldHider.QueryPrint := FDBPrint;
  end;
end;

procedure TfrmCustomConsulta.CheckButtons;
begin
   EnableButtons( FDataSource.DataSet.Active and (not FDataSource.DataSet.IsEmpty) );
end;

procedure TfrmCustomConsulta.ClearData;
begin
  EnableButtons( False );
  FDataSource.DataSet.Close;
end;

procedure TfrmCustomConsulta.EnableButtons(AEnabled: Boolean);
begin
  tbImprimir.Enabled   := AEnabled and bAllowPrint;
  tbExportar.Enabled   := AEnabled and bAllowExport;
  tbEnviarMail.Enabled := AEnabled and bAllowSendMail;
  tbModificar.Enabled  := AEnabled and bAllowModify;
  tbEliminar.Enabled   := AEnabled and bAllowDelete;
end;

function TfrmCustomConsulta.FiltersChanged: Boolean;
begin
  Result := True;
end;

procedure TfrmCustomConsulta.LoadDynamicSortFields(ASortFields : TSortFields; AColumns : TDBGridColumns);
begin
  if SortDialog.SortFields.Count <> GetVisibleColumnCount(FDBGrid) then
  begin
    AsortFields.Clear;
    unArt.LoadDynamicSortFields(ASortFields, AColumns);
  end;
end;

procedure TfrmCustomConsulta.PrintResults;
begin
  PrintResultsNew(PrintDialog, FDBGrid, FDataSource, FDBPrint, tbImprimir, Caption, '');
end;

procedure TfrmCustomConsulta.RefreshData;
var
 PrevCursor: TCursor;
begin
  if Refreshing then
    Exit;

  FRefreshing := True;
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    try
      if FiltersChanged or (not FDataSource.DataSet.Active) then
        if FDataSource.DataSet is TSDQuery then
          OpenQuery(FDataSource.DataSet as TSDQuery)
        else
          FDataSource.DataSet.Open
      else
        FDataSource.DataSet.Refresh;

      CheckButtons;
    except
      on E: Exception do
       ErrorMsg(E, 'Error al ejecutar la consulta de selección.');
    end;
  finally
    FRefreshing := False;
    Screen.Cursor := PrevCursor;
  end;
end;

procedure PrintResultsNew(PrintDialog: TPrintDialog; DBGrid: TDBGrid; DataSource: TDataSource; DBPrint: TQueryPrint; tbImprimir: TToolButton; Titulo, SubTitulo: String);
var
  AutoCols : Boolean;
begin
  if not Assigned(DBPrint.DataSource) then
    DBPrint.DataSource := DataSource;

  tbImprimir.Enabled := False;
  Try
     if Assigned(DBPrint) and DataSource.DataSet.Active and (not DataSource.DataSet.IsEmpty) and PrintDialog.Execute Then begin
        AutoCols := DBPrint.Fields.Count = 0;
        try
          if AutoCols then
            DBPrint.SetGridColumns( DBGrid, True, [baDetail, baHeader, baTotal, baSubTotal] );

          if DBPrint.Title.Text = '' then
            DBPrint.Title.Text := Titulo;

          if SubTitulo <> '' then
            begin
              DBPrint.SubTitle.Lines.Text := SubTitulo;

              with DBPrint.SubTitle do
                begin
                  Alignment  := taCenter;
                  Font.Style := [fsBold];
                  Font.Size  := 10;
                end;
            end;

          DBPrint.Print;
        finally
          if AutoCols Then
            DBPrint.Fields.Clear;
        end;
     end;
  finally
     tbImprimir.Enabled := True;
  end;
end;

procedure TfrmCustomConsulta.HideTitlebar;
var
  Style: Longint;
begin
  if BorderStyle = TFormBorderStyle(bsNone) then Exit;
  Style := GetWindowLong(Handle, GWL_STYLE);
  if (Style and WS_CAPTION) = WS_CAPTION then
  begin
    case BorderStyle of
      TFormBorderStyle(bsSingle),
      bsSizeable: SetWindowLong(Handle, GWL_STYLE, Style and
          (not (WS_CAPTION)) or WS_BORDER);
      bsDialog: SetWindowLong(Handle, GWL_STYLE, Style and
          (not (WS_CAPTION)) or DS_MODALFRAME or WS_DLGFRAME);
    end;
    Height := Height - GetSystemMetrics(SM_CYCAPTION);
    Refresh;
  end;
end;
{$IFNDEF PAQUETE}
{$IFNDEF SERVICE}
procedure TfrmCustomConsulta.DoBuscarCampoCodigoBarras(const aCampoBusqueda: String; aValorBuscado: String = ''; aValorAlfanumerico: Boolean = False; aClaveUnica: Boolean = False);
var
  sClave, sCodBarras: String;
  bEncontrado: Boolean;
  APointer: TBookmark;

  procedure DoMoverProxRegistro;
  begin
    with FDataSource.DataSet do
      begin
        if not Eof then
          Next;
      end;
  end;

  procedure DoAnalizarProxRegistro;
  begin
    with FDataSource.DataSet do
      begin
        if FieldByName(aCampoBusqueda).AsString = sClave then
          begin
            FreeBookmark(APointer);
            APointer    := GetBookmark;
            bEncontrado := True;

            DoMarcarFila;
          end;
      end;
  end;
begin
  with FDataSource.DataSet do
    begin
      Verificar(not Active or IsEmpty, Self, 'La grilla está vacía.');

      sCodBarras := aValorBuscado;

      while True do
        begin
          if IsEmptyString(sCodBarras) then
            sCodBarras := Trim(Get_CodigoBarras());

          if IsEmptyString(sCodBarras) then
            Break;

          if aValorAlfanumerico then
            sClave := sCodBarras
          else
            try
              sClave := IntToStr(StrToInt(sCodBarras));
            except
              on E: Exception do
                ErrorMsg(E, 'Error al intentar leer el código de barras - Posiblemente el formato no sea el que corresponda.');
            end;

          APointer := GetBookmark;
          try
            bEncontrado := False;
            First;
            DisableControls;
            try
              while not Eof do
                begin
                  DoAnalizarProxRegistro;

                  if aClaveUnica and bEncontrado then
                    Break;

                  DoMoverProxRegistro;
                end;
            finally
              EnableControls;
            end;

            GotoBookmark(APointer);

            if not bEncontrado then
              MsgBox('Registro no encontrado', MB_ICONERROR);

            if not IsEmptyString(aValorBuscado) then
              Break;  
          finally
            sCodBarras := '';
            FreeBookmark(APointer);
          end;
        end;
    end;
end;
{$ENDIF}
{$ENDIF}
procedure TfrmCustomConsulta.DoMarcarFila;
begin
  if not Grid.SelectedRows.CurrentRowSelected then
    Grid.SelectedRows.CurrentRowSelected := True;

  Grid.Invalidate;
end;

procedure TfrmCustomConsulta.DoImprimirConsulta(Query: TSDQuery; Grilla: TArtDBGrid; Titulo: String = '');
var
  AutoCols: Boolean;
begin
  tbImprimir.Enabled := False;
  try
    if Query.Active and not Query.IsEmpty and PrintDialog.Execute then
      begin
        QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario;
        AutoCols := (QueryPrint.Fields.Count = 0);
        try
          QueryPrint.DataSource := Grilla.DataSource;
          if AutoCols Then
            QueryPrint.SetGridColumns(Grilla, True, [baDetail, baHeader, baTotal, baSubTotal]);

          if IsEmptyString(Titulo) Then
            QueryPrint.Title.Text := Caption
          else
            QueryPrint.Title.Text := Titulo;

          QueryPrint.Print;
        finally
          if AutoCols Then
            QueryPrint.Fields.Clear;
        end;
      end;
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmCustomConsulta.DoExportarConsulta(Query: TSDQuery; Grilla: TArtDBGrid);
var
  AutoCols: Boolean;
begin
  tbExportar.Enabled := False;
  try
    if Query.Active and not Query.IsEmpty then
      begin
        AutoCols := (ExportDialog.Fields.Count = 0);
        try
          ExportDialog.DataSet := Grilla.DataSource.DataSet;
          if AutoCols then
            ExportDialog.Fields.Assign(Grilla.Columns);

          ExportDialog.Execute;
        finally
          if AutoCols then
            ExportDialog.Fields.Clear;
        end;
      end;
  finally
    tbExportar.Enabled := True;
  end;
end;

procedure TfrmCustomConsulta.SetExtraOrder(const Value: string);
begin
  if FExtraOrder <> Value then
    begin
      FExtraOrder           := Value;
      SortDialog.ExtraOrder := Value;
    end;
end;

end.

