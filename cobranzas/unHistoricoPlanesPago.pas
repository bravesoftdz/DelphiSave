unit unHistoricoPlanesPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, PatternEdit, IntEdit, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ToolEdit, DateComboBox;

type
  TfrmHistoricoPlanesPago = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    gbSectorOrigen: TGroupBox;
    rbSectorLeg: TRadioButton;
    rbSectorTodos: TRadioButton;
    rbSectorCob: TRadioButton;
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    fraContrato: TfraEmpresa;
    gbFechaAlta: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edFAltaDesde: TDateComboBox;
    edFAltaHasta: TDateComboBox;
    gbNroPlan: TGroupBox;
    Label2: TLabel;
    edNroPlan: TIntEdit;
    rgTipoPlan: TRadioGroup;
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoPlanClick(Sender: TObject);
  private
  public
  end;

var
  frmHistoricoPlanesPago: TfrmHistoricoPlanesPago;

implementation

{$R *.dfm}

uses
  AnsiSql;

procedure TfrmHistoricoPlanesPago.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT EM_NOMBRE NOMBRE, EM_CUIT CUIT, PP_ID PLAN, ESPLA.TB_DESCRIPCION ESTADO, ' +
                 'PP_CONTRATO CONTRATO, HP_FECHAALTA FECHAESTADO, AGCGESTOR.GC_ID GCIDGESTOR, ' +
                 'AGCGESTOR.GC_NOMBRE GCNOMBREGESTOR, AGCESTUDIO.GC_ID GCIDESTUDIO, ' +
                 'AGCESTUDIO.GC_NOMBRE GCNOMBREESTUDIO, DEUDA.GET_VALORESPLAN(PP_ID) VALORES, ' +
                 'DEUDA.GET_VALORESRECHAZADOSPLAN(PP_ID) VALORESRECH, ' +
                 'DEUDA.GET_VALORESSALDOIMPUTARPLAN(PP_ID) SALDO, ' +
                 'PP_BIBLIORATO BIBLIORATO, PP_SECTOR, PP_TIPOBIBLIORATO TIPOBIBLIORATO ' +
            'FROM ACO_CONTRATO, AEM_EMPRESA, ZPP_PLANPAGO, CTB_TABLAS ESPLA, ' +
                 'AGC_GESTORCUENTA AGCESTUDIO, AGC_GESTORCUENTA AGCGESTOR, ZHP_HISTORICOPLAN ' +
           'WHERE PP_ID = HP_IDPLAN ' +
             'AND ESPLA.TB_CLAVE = ''ESPLA'' ' +
             'AND ESPLA.TB_CODIGO = HP_ESTADO ' +
             'AND PP_CONTRATO = CO_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND PP_IDGESTOR = AGCGESTOR.GC_ID(+) ' +
             'AND PP_IDESTUDIO = AGCESTUDIO.GC_ID(+) ' +
             'AND PP_FECHABAJA IS NULL ' +
             'AND ESPLA.TB_ESPECIAL1 = ''N'' ';

  sWhere := SqlBetween(' AND HP_FECHAALTA', edFAltaDesde.Date, edFAltaHasta.Date);

  case rgTipoPlan.ItemIndex of
    0: sWhere := sWhere + ' AND ESPLA.TB_DESCRIPCION LIKE ''%Saldado''';       // Saldados
    1: sWhere := sWhere + ' AND ESPLA.TB_DESCRIPCION LIKE ''%No Cumplido''';   // No Cumplidos
  end;

  if fraContrato.IsSelected then
    sWhere := sWhere + ' AND PP_CONTRATO = ' + SqlValue(fraContrato.Contrato);

  if edNroPlan.Value <> 0 then
    sWhere := sWhere + ' AND PP_ID = ' + SqlValue(edNroPlan.Value);

  if rbSectorLeg.Checked then
    sWhere := sWhere + ' AND PP_IDGESTOR IS NULL'         // legales
  else if rbSectorCob.Checked then
    sWhere := sWhere + ' AND PP_IDGESTOR IS NOT NULL';    // cobranzas

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmHistoricoPlanesPago.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VALORES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VALORES')).Currency := True;

  if sdqConsulta.FieldByName('VALORESRECH') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VALORESRECH')).Currency := True;

  if sdqConsulta.FieldByName('SALDO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDO')).Currency := True;
end;

procedure TfrmHistoricoPlanesPago.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraContrato.Clear;
  edNroPlan.Clear;
  edFAltaDesde.Clear;
  edFAltaHasta.Clear;
  rbSectorTodos.Checked := True;    // todos
  rgTipoPlan.ItemIndex  := 0        // Saldados
end;

procedure TfrmHistoricoPlanesPago.FormCreate(Sender: TObject);
begin
  inherited;

  fraContrato.ShowBajas := True;
end;

procedure TfrmHistoricoPlanesPago.rgTipoPlanClick(Sender: TObject);
begin
  tbRefrescarClick(nil);
end;

end.
