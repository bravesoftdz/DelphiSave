unit unCompReimpresionCartas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, unArtFrame, unArtDbFrame, unFraEmpresa, Mask, PatternEdit,
  IntEdit, Menus, unArtDBAwareFrame, CardinalEdit, RxPlacemnt;

type
  TfrmCompReimpresionCartas = class(TfrmCustomConsulta)
    Label1: TLabel;
    edCC_IDCOMPENSACION: TIntEdit;
    Bevel1: TBevel;
    fraEmpresa: TfraEmpresa;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    edCartaDesde: TMaskEdit;
    edCartaHasta: TMaskEdit;
    Label4: TLabel;
    pmnuImpresion: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpCarta: TMenuItem;
    chImprimirFirma: TCheckBox;
    Bevel3: TBevel;
    mnuVisualizarCarta: TMenuItem;
    pmnuMarcar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tbTotalesRegGrilla: TToolButton;
    ShortCutControl1: TShortCutControl;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    mnuImpF817: TMenuItem;
    mnuImpCompDepositar: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpCartaClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure CalcTotales;
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuImpF817Click(Sender: TObject);
    procedure mnuImpCompDepositarClick(Sender: TObject);
  private
    pbFiltradoIdCompensacion: Boolean;
  public
    procedure RefreshData; override;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, unRptCartaDocCompensacion, CustomDlgs,
  StrFuncs, unRptCartaDocHeader, unCustomDataModule, unComunes, General, Numeros,
  Printers, unSesion, unQRF817, unArt, unRptCompensacionesDepositar;

{$R *.DFM}


procedure TfrmCompReimpresionCartas.RefreshData;
var
  sSql: string;
begin
  sSql := 'SELECT CC_IDCOMPENSACION, CO_CONTRATOPRINCIPAL, EM_CUIT, EM_NOMBRE, CC_IDCARTA, CA_NROCARTADOC, ' +
                 'TRUNC(CA_FECHAIMPRESION) FECHAIMPRESION, TRUNC(CA_FECHAREIMPRESION) FECHAREIMPRESION, ' +
                 'CO_USUPROCESO, TRUNC(CO_FECHAPROCESO) FECHAPROCESO, V_TOTAL, SV_TOTAL, (SV_TOTAL-V_TOTAL) DIFERENCIA, ' +
                 'AFILIACION.IS_EMPRESAVIP(CO_CONTRATO) ESVIP ' +
            'FROM V_CED_ESTADODEUDA, V_SLE_LIQPENDIENTESDEUDA, CCA_CARTA, ZCO_COMPENSACION, ' +
                 'ZCC_COMPENSACIONCONTRATO, ACO_CONTRATO_EXT, AEM_EMPRESA ' +
           'WHERE CC_CONTRATO = CO_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND CC_IDCARTA = CA_ID ' +
             'AND V_CONTRATO = CO_CONTRATO ' +
             'AND SV_CUIT = EM_CUIT ' +
             'AND CC_IDCOMPENSACION = SV_ID ' +
             'AND CC_IDCOMPENSACION = V_ID ' +
             'AND CC_IDCOMPENSACION = CO_ID ';

  pbFiltradoIdCompensacion := (edCC_IDCOMPENSACION.Value > 0);

  if pbFiltradoIdCompensacion Then
    begin
      sSql := sSql + 'AND CC_IDCOMPENSACION = ' + SqlValue(edCC_IDCOMPENSACION.Value) + ' ' +
                     'AND SV_ID = ' + SqlValue(edCC_IDCOMPENSACION.Value) + ' ' +  // estas últimas 2 condiciones las tuve que poner
                     'AND V_ID = ' + SqlValue(edCC_IDCOMPENSACION.Value) + ' ';    // para que no hiciera un full scan al usar las vistas
    end;

  if fraEmpresa.IsSelected Then
    sSql := sSql + 'AND EM_ID = ' + SqlValue(fraEmpresa.Value) + ' ';

  sSql := sSql + SqlBetween('AND CA_NROCARTADOC', edCartaDesde.Text, edCartaHasta.Text) + ' ';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;
  inherited;

  CalcTotales;
end;

procedure TfrmCompReimpresionCartas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmCompReimpresionCartas.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmCompReimpresionCartas.mnuImpCartaClick(Sender: TObject);
var
  iCantCopias, i: Integer;
  bPrinterSetup, bImprimir: Boolean;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos un registro en la grilla.');
  Verificar((Sesion.Sector <> 'COB') and sdqConsulta.FieldByName('FECHAIMPRESION').IsNull, Grid, 'La carta aun no ha sido impresa.');

  iCantCopias   := 1;
  bImprimir     := (Sender = mnuImpCarta);
  bPrinterSetup := bImprimir;

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));

      Do_ImprimirCartaCompensacion(iCantCopias, sdqConsulta.FieldByName('CC_IDCARTA').AsInteger, iif(bImprimir, srPrint, srPreview), tmBeginEnd, False, chImprimirFirma.Checked, bPrinterSetup);
      bPrinterSetup := False;
    end;
end;

procedure TfrmCompReimpresionCartas.mnuImpF817Click(Sender: TObject);
begin
  Verificar(not pbFiltradoIdCompensacion, nil, 'Debe filtrar por número de proceso.');
  Verificar(sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(Grid.SelectedRows.Count > 0, Grid, 'No debe seleccionar registros de la grilla ya que se utiliza el número de proceso ingresado como filtro.');

  if not Do_ImprimirF817(ART_EMPTY_ID, 0, srPreview, 1, '', 0, edCC_IDCOMPENSACION.Value) then
    InfoHint(nil, 'No se han encontrado periodos con deuda.');
end;

procedure TfrmCompReimpresionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edCC_IDCOMPENSACION.Clear;
  edCartaDesde.Clear;
  edCartaHasta.Clear;
  fraEmpresa.Clear;
  edTotalRegistros.Clear;

  edCC_IDCOMPENSACION.SetFocus;
  pbFiltradoIdCompensacion := False;
end;

procedure TfrmCompReimpresionCartas.FormCreate(Sender: TObject);
begin
  inherited;

  pbFiltradoIdCompensacion := False;

  with QueryPrint do
  begin
    SetGridColumns( Grid, True, [baDetail, baHeader, baTotal, baSubTotal] );

    with FieldByName['V_TOTAL'] do
    begin
      TotalType := ttAutoSum;
      Alignment := taRightJustify;
      Width     := 700;
    end;

    with FieldByName['SV_TOTAL'] do
    begin
      TotalType := ttAutoSum;
      Alignment := taRightJustify;
      Width     := 700;
    end;

    with FieldByName['DIFERENCIA'] do
    begin
      TotalType := ttAutoSum;
      Alignment := taRightJustify;
      Width     := 700;
    end;

    Totals.Font.Style :=[fsBold];
  end;

  fraEmpresa.ShowBajas := True;
  tbTotalesRegGrilla.Left := tbNuevo.Left;
end;

procedure TfrmCompReimpresionCartas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName( 'V_TOTAL' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqConsulta.FieldByName( 'V_TOTAL' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'SV_TOTAL' ) is TFloatField Then
    TFloatField( sdqConsulta.FieldByName( 'SV_TOTAL' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'DIFERENCIA' ) is TFloatField Then
    TFloatField( sdqConsulta.FieldByName( 'DIFERENCIA' ) ).Currency := True;
end;

procedure TfrmCompReimpresionCartas.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  Value := ToStr(ToFloat(Value), 2, False, False, '$')
end;

procedure TfrmCompReimpresionCartas.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmCompReimpresionCartas.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmCompReimpresionCartas.CalcTotales;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Value := sdqConsulta.RecordCount
  else
    edTotalRegistros.Clear;
end;

procedure TfrmCompReimpresionCartas.tbTotalesRegGrillaClick(Sender: TObject);
begin
  CalcTotales;
  pnlTotalRegistros.Visible := tbTotalesRegGrilla.Down;
end;

procedure TfrmCompReimpresionCartas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('ESVIP').AsString = 'S' then
    AFont.Color := clPurple;

  if Highlight then
    Background := clTeal
  else
    Background := clInfoBk;
end;

procedure TfrmCompReimpresionCartas.mnuImpCompDepositarClick(Sender: TObject);
begin
  Verificar(not pbFiltradoIdCompensacion, nil, 'Debe filtrar por número de proceso.');
  Verificar(sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(Grid.SelectedRows.Count > 0, Grid, 'No debe seleccionar registros de la grilla ya que se utiliza el número de proceso ingresado como filtro.');

  if not TRptCompensacionesDepositar.Preparar(edCC_IDCOMPENSACION.Value) then
    InfoHint(nil, 'No se han encontrado registros.');
end;

end.

