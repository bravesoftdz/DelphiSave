unit unConsultasAdicionales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Db,
  SDEngine, SortDlg, QueryPrint, QueryToFile, ExportDialog, artSeguridad,
  StdCtrls, ExtCtrls;

type
  TfrmConsultasAdicionales = class(TForm)
    CoolBar1: TCoolBar;
    dsAdicionales: TDataSource;
    ExportDialog: TExportDialog;
    GridAdicionales: TArtDBGrid;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    sdqAdicionales: TSDQuery;
    SortDialog: TSortDialog;
    tbExportar: TToolButton;
    tbImprimirAdic: TToolButton;
    tbImprimirCarta: TToolButton;
    tbOrdenar: TToolButton;
    tbSalir: TToolButton;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    tbVendedorPrincipal: TToolButton;
    tbVendedorVisible: TToolButton;
    tbSeparadorVendedor: TToolButton;
    ToolButton4: TToolButton;
    Seguridad: TSeguridad;
    pnlVendedores: TPanel;
    chkMostrarVendActivos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure GridAdicionalesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridAdicionalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirAdicClick(Sender: TObject);
    procedure tbImprimirCartaClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbVendedorPrincipalClick(Sender: TObject);
    function EsVendedor: Boolean;
    procedure tbVendedorVisibleClick(Sender: TObject);
    procedure chkMostrarVendActivosClick(Sender: TObject);
    procedure GridAdicionalesPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqAdicionalesAfterOpen(DataSet: TDataSet);
 private
    fCampoBaja: string;
    fColorBaja: TColor;
    fSql: string;
    fTipo: Integer;
    fContrato: Integer;
    procedure ImprimeConsulta( Grilla: TArtDBGrid );
    procedure LoadDynamicSortFields(ASortFields: TSortFields; AColumns: TDBGridColumns);
    procedure MostrarConsultaInterno;
    procedure SetTipo(const Value: Integer);
 public
    NombreCampos: array of string;
    CamposSuma: array of string;
    Maxcols: Integer;
    TotalConsulta: Array of Extended;
    procedure MostrarConsulta; overload;
    procedure MostrarConsulta(vArguments: array of TVarRec); overload;
    procedure MostrarConsulta(vArguments: array of TVarRec; vSum: array of String); overload;

    property CampoBaja: string              read fCampoBaja    write fCampoBaja;
    property ColorBaja: TColor              read fColorBaja    write fColorBaja;
    property Sql: string                    read fSql          write fSql;
    property Tipo: Integer                  read fTipo         write SetTipo;
    property Contrato: Integer              read fContrato     write fContrato;
  end;

implementation

uses
  unDmPrincipal, unOpcionesDeImpresion, General, VCLExtra, Math, unGrids, Clipbrd,
  CustomDlgs, unSesion, unPrincipal, SqlFuncs, unComunes, DbFuncs;

{$R *.DFM}

procedure TfrmConsultasAdicionales.FormCreate(Sender: TObject);
begin
  Tipo := -1;
  SetLength(NombreCampos, 0);
  ColorBaja := clRed;
end;

procedure TfrmConsultasAdicionales.GridAdicionalesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (CampoBaja <> '') and (sdqAdicionales.FieldByName(CampoBaja).AsString <> '') then
    AFont.Color := IIF(Highlight, clBtnFace, ColorBaja);
end;

procedure TfrmConsultasAdicionales.GridAdicionalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Uppercase(Chr(Key)) = 'C') and (ssCtrl in Shift) and (not (dgRowSelect in GridAdicionales.Options)) then
    Clipboard.AsText := GridAdicionales.SelectedField.Value;
end;

procedure TfrmConsultasAdicionales.GridAdicionalesPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(UpperCase(Column), CamposSuma);
  if (iPos > -1) and (iPos < Maxcols) then
    Value := FormatFloat('$ #,##0.00', TotalConsulta[iPos])
end;

procedure TfrmConsultasAdicionales.tbExportarClick(Sender: TObject);
begin
  if sdqAdicionales.Active and (not sdqAdicionales.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      try
        ExportDialog.Fields.Assign(GridAdicionales.Columns);
        ExportDialog.Execute;
      finally
        ExportDialog.Fields.Clear;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmConsultasAdicionales.tbImprimirAdicClick(Sender: TObject);
begin
  tbImprimirAdic.Enabled := False;
  Try
    ImprimeConsulta(GridAdicionales);
  finally
     tbImprimirAdic.Enabled := True;
  end;
end;

procedure TfrmConsultasAdicionales.tbImprimirCartaClick(Sender: TObject);
begin
  with TfrmOpcionesDeImpresion.Create(Self) do
  try
    tslListaCartas.Add(sdqAdicionales.FieldByName('CA_ID').AsString);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmConsultasAdicionales.tbOrdenarClick(Sender: TObject);
var
  iloop: Integer;
begin
  SortDialog.Execute;
  for iloop := 0 to High( NombreCampos ) do
    GridAdicionales.Columns.Items[iloop].Title.Caption := NombreCampos[iloop];
end;

procedure TfrmConsultasAdicionales.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultasAdicionales.ImprimeConsulta(Grilla: TArtDBGrid);
var
  AutoCols : Boolean;
begin
  if Grilla.DataSource.DataSet.Active and (not Grilla.DataSource.DataSet.IsEmpty) and PrintDialog.Execute then
  begin
    AutoCols := QueryPrint.Fields.Count = 0;
    try
      if AutoCols then
        QueryPrint.SetGridColumns( Grilla, True, [baDetail, baHeader, baTotal, baSubTotal] );

      if QueryPrint.Title.Text = '' then
        QueryPrint.Title.Text := Caption;

      QueryPrint.Print ;
    finally
      if AutoCols then
        QueryPrint.Fields.Clear ;
    end;
  end;
end;

procedure TfrmConsultasAdicionales.LoadDynamicSortFields(ASortFields: TSortFields; AColumns: TDBGridColumns);
var
  i : Integer;
begin
  if ASortFields.Count = 0 then
    for i := 0 to AColumns.Count -1 do
      with ASortFields.Add do begin
        Title      := AColumns[i].Title.Caption ;
        DataField  := AColumns[i].FieldName ;

        if Assigned(AColumns[i].Field) then
          FieldIndex := AColumns[i].Field.FieldNo;
      end;
end;

procedure TfrmConsultasAdicionales.MostrarConsultaInterno;
var
  iloop: integer;
begin
  for iloop := 0 to High( NombreCampos ) do
    GridAdicionales.Columns.Items[iloop].Title.Caption := NombreCampos[iloop];

  SortDialog.SortFields.Clear;
  LoadDynamicSortFields( SortDialog.SortFields, GridAdicionales.Columns );
  DynColWidthsByData(GridAdicionales);

  if EsVendedor() then
    begin
      GridAdicionales.ColumnByField['VC_ID'].Visible        := False;
      GridAdicionales.ColumnByField['VC_FECHABAJA'].Visible := False;
      GridAdicionales.ColumnByField['VC_VISIBLE'].Visible := Seguridad.Claves.IsActive('VerInvisibles');
    end;

  Width := Min(Screen.Width, GetColumnWidths(GridAdicionales, True));

  if not Visible then
    ShowModal;
end;

procedure TfrmConsultasAdicionales.sdqAdicionalesAfterOpen(DataSet: TDataSet);
var
  AField: TField;
begin
  AField := DataSet.FindField('Importe demandado');
  if Assigned(AField) and (AField is TFloatField)Then
    TFloatField(AField).Currency := True;
end;

procedure TfrmConsultasAdicionales.MostrarConsulta;
var
  sSql, sFiltros: String;
begin
  sSql := Sql;

  if EsVendedor() then
    begin
      if chkMostrarVendActivos.Checked then
        begin
          sFiltros := sFiltros + '(VC_FECHABAJA IS NULL ' +
                                  'AND ADD_MONTHS(SYSDATE, -1) <= TO_DATE(NVL(VC_VIGENCIAHASTA, ''299912''), ''YYYYMM'')) ';
          AddCondition(sSql, sFiltros);
        end;
    end;

  OpenQuery(sdqAdicionales, sSql);
  MostrarConsultaInterno;
end;

procedure TfrmConsultasAdicionales.MostrarConsulta(vArguments: array of TVarRec);
begin
  OpenQueryEx(sdqAdicionales, vArguments, Sql);
  MostrarConsultaInterno;
end;

procedure TfrmConsultasAdicionales.MostrarConsulta(vArguments: array of TVarRec; vSum: array of String);
var
  PrevCursor: TCursor;
begin
  OpenQueryEx(sdqAdicionales, vArguments, Sql);

  if length(vSum) > 0 then
  begin

    PrevCursor := Screen.Cursor;
    try
      Screen.Cursor := crHourGlass;
      try
        GridAdicionales.FooterBand := True;
        if sdqAdicionales.Active then
          SumFields(sdqAdicionales, vSum, TotalConsulta);
      except
        on E: Exception do
          ErrorMsg(E, 'Error al Calcular los Subtotales');
      end;
    finally
      Screen.Cursor := PrevCursor;
    end;
  end;

  MostrarConsultaInterno;
end;

procedure TfrmConsultasAdicionales.SetTipo(const Value: Integer);
var
  bEsVendedor: Boolean;
begin
  if fTipo <> Value then
  begin
    fTipo       := Value;
    bEsVendedor := EsVendedor();

    tbVendedorPrincipal.Enabled := bEsVendedor and Seguridad.Activar(tbVendedorPrincipal);
    tbVendedorVisible.Enabled   := bEsVendedor and Seguridad.Activar(tbVendedorVisible) and Seguridad.Claves.IsActive('VerInvisibles');

    if bEsVendedor and not Seguridad.Claves.IsActive('VerInvisibles') then
      AddCondition(fSql, 'VC_VISIBLE = ''S''');

    pnlVendedores.Visible       := bEsVendedor;
    tbVendedorPrincipal.Visible := bEsVendedor;
    tbVendedorVisible.Visible   := bEsVendedor;
    tbSeparadorVendedor.Visible := bEsVendedor;
  end;
end;

function TfrmConsultasAdicionales.EsVendedor: Boolean;
begin
  Result := (Tipo = 0);      // 0: Vendedores
end;

procedure TfrmConsultasAdicionales.tbVendedorPrincipalClick(Sender: TObject);
begin
  DoCargarVendedorPrincipal(GridAdicionales, Contrato);
end;

procedure TfrmConsultasAdicionales.tbVendedorVisibleClick(Sender: TObject);
begin
  DoCargarVendedorVisible(GridAdicionales);
end;

procedure TfrmConsultasAdicionales.chkMostrarVendActivosClick(Sender: TObject);
begin
  MostrarConsulta;
end;

end.


