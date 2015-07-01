unit unListLiqIncapacidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, StdCtrls, ExtCtrls, Mask, ToolEdit, DateComboBox,
  ImgList, XPMenu, Placemnt, QRCtrls, QuickRpt, DB, SDEngine, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, QueryToFile, ExportDialog, RxToolEdit,
  RxPlacemnt;

type
  TfrmListLiqIncapacidades = class(TfrmCustomForm)
    gbFechaAprob: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFAprobDesde: TDateComboBox;
    edFAprobHasta: TDateComboBox;
    gbFechaLiq: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edFLiqDesde: TDateComboBox;
    edFLiqHasta: TDateComboBox;
    Bevel11: TBevel;
    btnImprimir: TButton;
    btnCancelar: TButton;
    GroupBox2: TGroupBox;
    rbLiqTodas: TRadioButton;
    rbLiqSi: TRadioButton;
    rbLiqNo: TRadioButton;
    GroupBox1: TGroupBox;
    rbPagoTodas: TRadioButton;
    rbPagoUnico: TRadioButton;
    rbPagoMensual: TRadioButton;
    ScrollBox1: TScrollBox;
    qrLiqIncapacidades: TQuickRep;
    TitleBand1: TQRBand;
    qrlTituloILTP: TQRLabel;
    qrFechaHOY: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrbDetalle: TQRBand;
    qrdbSiniestro: TQRDBText;
    qrdbTrabajador: TQRDBText;
    qrdbEmpresa: TQRDBText;
    qrdbVencimiento: TQRDBText;
    qrdbDesde: TQRDBText;
    qrdbHasta: TQRDBText;
    qrImporteDetalle: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    qrImpresoPor: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotal: TQRLabel;
    qrCantidad: TQRExpr;
    qreTotal: TQRExpr;
    QRLabel14: TQRLabel;
    qriLogo: TQRImage;
    sdqLiqInca: TSDQuery;
    dsLiqInca: TDataSource;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    gbFDictamen: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edFDictDesde: TDateComboBox;
    edFDictHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    dcConcepto: TDBCheckCombo;
    pnlLiquidadas: TPanel;
    rbPendientes: TRadioButton;
    rbAprobadas: TRadioButton;
    sdqConcepto: TSDQuery;
    dsConcepto: TDataSource;
    rbTodas: TRadioButton;
    gbFechaAprobDic: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edFAprobDicDesde: TDateComboBox;
    edFAprobDicHasta: TDateComboBox;
    ExportDialog: TExportDialog;
    btnExportar: TButton;
    rgDecreto: TRadioGroup;
    QRDBText9: TQRDBText;
    QRLabel18: TQRLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qrImpresoPorPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure DoHabilitarRadios(Sender: TObject);
  private
    procedure DoGenerarReporte(bImprimir: Boolean);
  public
    { Public declarations }
  end;

var
  frmListLiqIncapacidades: TfrmListLiqIncapacidades;

implementation

uses CustomDlgs, AnsiSql, unVisualizador, unSesion, General, unComunes;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.btnImprimirClick(Sender: TObject);
begin
  DoGenerarReporte(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.DoGenerarReporte(bImprimir: Boolean);
var
  sOuter, sSql: String;
begin
  Verificar((edFAprobDicDesde.IsEmpty and not(edFAprobDicHasta.IsEmpty)) or
            (not(edFAprobDicDesde.IsEmpty) and edFAprobDicHasta.IsEmpty) or
            ((not(edFAprobDicDesde.IsEmpty) or not(edFAprobDicHasta.IsEmpty)) and edFDictDesde.IsEmpty),
            gbFechaAprobDic, 'Debe seleccionar el rango completo de aprobación y la fecha del dictamen.');
  Verificar(edFAprobDesde.IsEmpty and edFAprobHasta.IsEmpty and edFLiqDesde.IsEmpty and
            edFLiqHasta.IsEmpty and edFDictDesde.IsEmpty and edFDictHasta.IsEmpty and
            edFAprobDicDesde.IsEmpty and edFAprobDicHasta.IsEmpty,
            gbFechaLiq, 'Debe seleccionar algún rango de fechas.');

  sOuter := IIF(edFDictDesde.IsEmpty and edFDictDesde.IsEmpty, '', '(+)');

  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
			          ' art.utiles.armar_cuit(tj_cuil) cuil, tj_nombre, ex_fechaaccidente, em_nombre, ' +
			          ' ev_porcincapacidad, ev_fecha, le_imporperi, le_fechades, le_fechahas, le_fproceso, ' +
                ' le_faprobado, art.inca.get_fechaautorizado(ev_idevento) fautorizado, ' +
                ' DECODE(ex_gravedad, ''5'', '' '', ev_caracter) ev_caracter, ev_fecharecepcion, ev_integral, ev_porcintegral ' +
           ' FROM art.sex_expedientes, art.sev_eventosdetramite a, SIN.sei_eventoincapacidad b, ' +
			          ' art.sle_liquiempsin, ctj_trabajador, aem_empresa ' +
          ' WHERE ex_id = a.ev_idexpediente ' +
            ' AND a.ev_codigo = b.ei_codigo ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND a.ev_idevento = le_ideventoinca' + sOuter +
            ' AND a.ev_evento > 0 ' +
            ' AND a.ev_porcincapacidad > 0 ' +
            ' AND art.inca.get_eventoautorizable(a.ev_idevento) = ''S'' ' +
            ' AND art.inca.get_autorizado(a.ev_idevento) = ''S'' ';

  if not edFDictDesde.IsEmpty then
    sSql := sSql + ' AND ev_fecha >= ' + SqlDate(edFDictDesde.Date);

  if not edFDictHasta.IsEmpty then
    sSql := sSql + ' AND ev_fecha <= ' + SqlDate(edFDictHasta.Date);

  if not(edFAprobDicDesde.IsEmpty) and not(edFAprobDicHasta.IsEmpty) then
    sSql := sSql + ' AND art.inca.get_fechaautorizado(a.ev_idevento) BETWEEN ' + SqlDate(edFAprobDicDesde.Date) +
                                                                       ' AND ' + SqlDate(edFAprobDicHasta.Date);

  if not edFAprobDesde.IsEmpty then
    sSql := sSql + ' AND le_faprobado >= ' + SqlDate(edFAprobDesde.Date);

  if not edFAprobHasta.IsEmpty then
    sSql := sSql + ' AND le_faprobado <= ' + SqlDate(edFAprobHasta.Date);

  if not edFLiqDesde.IsEmpty then
    sSql := sSql + ' AND le_fproceso >= ' + SqlDate(edFLiqDesde.Date);

  if not edFLiqHasta.IsEmpty then
    sSql := sSql + ' AND le_fproceso >= ' + SqlDate(edFLiqHasta.Date);

  if rbTodas.Checked then
    sSql := sSql + ' AND le_fproceso IS NOT NULL ';

  if rbPendientes.Checked then
    sSql := sSql + ' AND NVL(le_estado, '''') IN (''C'', ''M'', ''V'') ';

  if rbAprobadas.Checked then
    sSql := sSql + ' AND NVL(le_estado, '''') IN (''E'', ''P'') ';

  if rbLiqNo.Checked then
    sSql := sSql + ' AND le_fproceso IS NULL ' +
                   ' AND NOT EXISTS(SELECT 1 ' +
                                    ' FROM art.sev_eventosdetramite c ' +
                                   ' WHERE c.ev_idexpediente = a.ev_idexpediente ' +
                                     ' AND c.ev_idevento_rela = a.ev_idevento ' +
                                     ' AND c.ev_idevento > a.ev_idevento ' +
                                     ' AND NVL(c.ev_codigo, '' '') = ''953'') ';
  if rbPagoUnico.Checked then
    sSql := sSql + ' AND le_fechahas IS NULL ';

  if rbPagoMensual.Checked then
    sSql := sSql + ' AND le_fechahas IS NOT NULL ';

  if (dcConcepto.Text <> '') then
    sSql := sSql + ' AND le_conpago ' + dcConcepto.InSql;

  case rgDecreto.ItemIndex of
    0: sSql := sSql + ' AND ex_fechaaccidente <  ' + sqldate(strtodate(FECHA_DECRETO_1694_09));
    1: sSql := sSql + ' AND ex_fechaaccidente >= ' + sqldate(strtodate(FECHA_DECRETO_1694_09));
  end;

  sSql := sSql + ' ORDER BY ev_fecha ';

  with sdqLiqInca do
  try
    SQL.Text := sSql;
    Open;
    if Eof then
      MsgBox('No se han producido resultados, ingrese otros filtros.', MB_ICONINFORMATION)
    else begin
      if bImprimir then
      begin
        qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
        Visualizar(qrLiqIncapacidades, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
      end
      else
        ExportDialog.Execute;
    end;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.qrImpresoPorPrint(sender: TObject; var Value: String);
begin
  Value := 'Impreso por ' + Sesion.Usuario;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.FormCreate(Sender: TObject);
begin
  inherited;
  sdqConcepto.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.DoHabilitarRadios(Sender: TObject);
begin
  if rbLiqSi.Checked then
  begin
    pnlLiquidadas.Enabled := True;
    rbTodas.Checked       := True;
  end
  else begin
    pnlLiquidadas.Enabled := False;
    rbTodas.Checked       := False;
    rbPendientes.Checked  := False;
    rbAprobadas.Checked   := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListLiqIncapacidades.btnExportarClick(Sender: TObject);
begin
  DoGenerarReporte(False);
end;
{-------------------------------------------------------------------------------}
end.



