unit unConsultaAutorizaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmConsultaAutorizaciones = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    rgResultado: TRadioGroup;
    rgAprobado: TRadioGroup;
    GroupBox1: TGroupBox;
    chkDeudaNominal: TCheckBox;
    chkCuotasAdeudadas: TCheckBox;
    chkCuotasFinanciacion: TCheckBox;
    chkQuitaIntFinanc: TCheckBox;
    chkQuitaIntMoraCont: TCheckBox;
    chkQuitaIntMoraFinanc: TCheckBox;
    chkAnticipo: TCheckBox;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
    procedure RefreshData; override;
    procedure ClearData; override;
  end;

var
  frmConsultaAutorizaciones: TfrmConsultaAutorizaciones;

implementation

uses
  AnsiSql;
  
{$R *.dfm}

procedure TfrmConsultaAutorizaciones.ClearData;
begin
  inherited;

  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  rgResultado.ItemIndex := 0;
  rgAprobado.ItemIndex  := 0;
  chkDeudaNominal.Checked       := False;
  chkCuotasAdeudadas.Checked    := False;
  chkCuotasFinanciacion.Checked := False;
  chkQuitaIntMoraFinanc.Checked := False;
  chkQuitaIntMoraCont.Checked   := False;
  chkQuitaIntFinanc.Checked     := False;
  chkAnticipo.Checked           := False;
end;

procedure TfrmConsultaAutorizaciones.RefreshData;
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT PP_ID PLAN, PP_CONTRATO CONTRATO, EM_NOMBRE NOMBRE, AP_MONTODEUDA DEUDA_NOMINAL_FINANCIADA, ' +
                 'AP_CUOTADEUDA CUOTAS_ADEUDADAS, AP_CUOTAFINANC CUOTAS_FINANCIACION, AP_ANTICIPO ANTICIPO, ' +
                 'ART.DEUDA.GET_INTERESFINANCIACIONPLAN(AP_IDPLAN) INTERES_FINANCIACION, AP_QUITAINTFINANC QUITA_INTERES_FINANCIACION, ' +
                 'AP_QUITAINTMORAFINANC QUITA_INTERES_MORA_FINANCIADO, AP_QUITAINTMORACONT QUITA_INTERES_MORA_CONTADO, ' +
                 '(SELECT SUM(PD_INTERESMORA) FROM ZPD_PLANDEUDA WHERE PD_IDPLANPAGO = PP_ID) *(1 - PP_PORCDESCINTERES / 100) - PP_MONTODESCINTERES INTERES_MORA, ' +
                 'PP_FECHAALTA, PP_USUALTA, PP_FECHAAPROBADO, PP_USUAPROBADO, PP_USUBAJA, PP_FECHABAJA ' +
            'FROM ZCC_CONTROLCOBRANZA, ART.USE_USUARIOS, AEM_EMPRESA, ACO_CONTRATO, ZAP_AUTORIZACIONPLAN, ZPP_PLANPAGO ' +
           'WHERE PP_CONTRATO = CO_CONTRATO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND PP_ID = AP_IDPLAN ' +
             'AND SE_USUARIO = PP_USUALTA ' +
             'AND SE_IDNIVELAUTORIZA = CC_IDNIVELAUTORIZA ' +
             'AND CC_FECHABAJA IS NULL ';

  sWhere := SqlBetweenDateTime(' AND PP_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date);

  case rgResultado.ItemIndex of
    1:  sWhere := sWhere + ' AND PP_FECHAAPROBADO IS NOT NULL';  // Aprobados
    2:  sWhere := sWhere + ' AND PP_FECHABAJA IS NOT NULL';      // Rechazados
  end;

  case rgAprobado.ItemIndex of
    1: sWhere := sWhere + ' AND PP_USUALTA = PP_USUAPROBADO';    // Gestor
    2: sWhere := sWhere + ' AND PP_USUALTA <> PP_USUAPROBADO';   // Aprobador
  end;

  if chkDeudaNominal.Checked then
    sWhere := sWhere + ' AND AP_MONTODEUDA > CC_MONTODEUDA';

  if chkCuotasAdeudadas.Checked then
    sWhere := sWhere + ' AND AP_CUOTADEUDA > CC_CUOTADEUDA';

  if chkCuotasFinanciacion.Checked then
    sWhere := sWhere + ' AND AP_CUOTAFINANC > CC_CUOTAFINANC';

  if chkQuitaIntMoraFinanc.Checked then
    sWhere := sWhere + ' AND AP_QUITAINTMORAFINANC > CC_QUITAINTMORAFINANC';

  if chkQuitaIntMoraCont.Checked then
    sWhere := sWhere + ' AND AP_QUITAINTMORACONT > CC_QUITAINTMORACONT';

  if chkQuitaIntFinanc.Checked then
    sWhere := sWhere + ' AND AP_QUITAINTFINANC > CC_QUITAINTFINANC';

  if chkAnticipo.Checked then
    sWhere := sWhere + ' AND AP_ANTICIPO < CC_ANTICIPO';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmConsultaAutorizaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('DEUDA_NOMINAL_FINANCIADA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('DEUDA_NOMINAL_FINANCIADA')).Currency := True;

  if sdqConsulta.FieldByName('INTERES_FINANCIACION') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('INTERES_FINANCIACION' )).Currency := True;

  if sdqConsulta.FieldByName('INTERES_MORA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('INTERES_MORA')).Currency := True;

  if sdqConsulta.FieldByName('QUITA_INTERES_FINANCIACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('QUITA_INTERES_FINANCIACION')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('QUITA_INTERES_MORA_FINANCIADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('QUITA_INTERES_MORA_FINANCIADO')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('QUITA_INTERES_MORA_CONTADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('QUITA_INTERES_MORA_CONTADO')).DisplayFormat := '% 0.00;-% 0.00';

  if sdqConsulta.FieldByName('ANTICIPO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName('ANTICIPO')).DisplayFormat := '% 0.00;-% 0.00';
end;

procedure TfrmConsultaAutorizaciones.FormCreate(Sender: TObject);
begin
  inherited;
  
  ClearData;
end;

end.
