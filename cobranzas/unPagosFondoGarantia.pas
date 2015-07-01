unit unPagosFondoGarantia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit,
  IntEdit, Menus, PeriodoPicker, CurrEdit, FormPanel;

type
  TfrmPagosFondoGarantia = class(TfrmCustomConsulta)
    gbNroPago: TGroupBox;
    edPF_ID: TIntEdit;
    gbFechaAlta: TGroupBox;
    Label4: TLabel;
    edPF_FECHAALTADesde: TDateComboBox;
    edPF_FECHAALTAHasta: TDateComboBox;
    gbFechaEnvio: TGroupBox;
    Label1: TLabel;
    edPF_FECHAENVIODesde: TDateComboBox;
    edPF_FECHAENVIOHasta: TDateComboBox;
    ShortCutControl1: TShortCutControl;
    mnuImprimir: TPopupMenu;
    mnuImprimirDetallePago: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    tbSalir2: TToolButton;
    tbEnvioSRT: TToolButton;
    tbBoletaDeposito: TToolButton;
    ToolButton7: TToolButton;
    fpBoletaDeposito: TFormPanel;
    btnAceptarBoletaDepos: TButton;
    btnCancelarBoletaDepos: TButton;
    BevelAbm: TBevel;
    edFBoletaDepos: TDateComboBox;
    Label2: TLabel;
    edBoletaDeposito: TEdit;
    Label3: TLabel;
    grpNumCheque: TGroupBox;
    edCE_NUMERO: TPatternEdit;
    grpNroOP: TGroupBox;
    edCE_ORDENPAGO: TIntEdit;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    pnlBusqueda: TPanel;
    chkSoloActivos: TCheckBox;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirDetallePagoClick(Sender: TObject);
    procedure tbEnvioSRTClick(Sender: TObject);
    procedure tbBoletaDepositoClick(Sender: TObject);
    procedure fpBoletaDepositoEnter(Sender: TObject);
    procedure btnAceptarBoletaDeposClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;  AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    procedure CalcTotales;
    function IsBaja: Boolean;
  protected
    procedure ClearData; override;
    procedure RefreshData; override;    
  public
  end;

var
  frmPagosFondoGarantia: TfrmPagosFondoGarantia;
  TotalConsulta : array of extended;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: array [0..MAXCOLS] of string = ('IMPORTE');

implementation

uses
  CustomDlgs, General, AnsiSQL, unDmPrincipal, unArt, SqlFuncs, unSesion, DbFuncs,
  unDetallePagosFondoGarantia, unRptDetallePagosFondoGarantia, unImpoExpoWizard,
  Strfuncs;

{$R *.dfm}

procedure TfrmPagosFondoGarantia.ClearData;
begin
  edPF_ID.Clear;
  edPF_FECHAALTADesde.Clear;
  edPF_FECHAALTAHasta.Clear;
  edPF_FECHAENVIODesde.Clear;
  edPF_FECHAENVIOHasta.Clear;
  edCE_NUMERO.Clear;
  edCE_ORDENPAGO.Clear;
  chkSoloActivos.Checked := True;

  inherited;
end;

procedure TfrmPagosFondoGarantia.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT PF_ID NRO_PAGO, PF_IMPORTE IMPORTE, TRUNC(PF_FECHAALTA) FECHA_PAGO, ' +
                 'PF_BOLETADEPOSITO BOLETA_DEPOSITO, PF_FECHADEPOSITO FECHA_DEPOSITO, PF_FECHAENVIO FECHA_ENVIO, ' +
                 'CE_NUMERO CHEQUE, CE_FECHACHEQUE FECHACHEQUE, CE_ORDENPAGO ORDENPAGO, PF_FECHABAJA FECHABAJA ' +
            'FROM RCE_CHEQUEEMITIDO, ZPF_PAGOFONDOGARANTIA ' +
           'WHERE PF_IDCHEQUEEMITIDO = CE_ID(+)';

  sWhere := SqlBetweenDateTime(' AND PF_FECHAALTA', edPF_FECHAALTADesde.Date, edPF_FECHAALTAHasta.Date) +
            SqlBetweenDateTime(' AND PF_FECHAENVIO', edPF_FECHAENVIODesde.Date, edPF_FECHAENVIOHasta.Date);

  if not edPF_ID.IsEmpty then
    sWhere := sWhere + ' AND PF_ID = ' + SqlValue(edPF_ID.Value);

  if not IsEmptyString(edCE_NUMERO.Text) then
    sWhere := sWhere + ' AND CE_NUMERO = ' + SqlValue(edCE_NUMERO.Text);

  if not edCE_ORDENPAGO.IsEmpty then
    sWhere := sWhere + ' AND CE_ORDENPAGO = ' + SqlValue(edCE_ORDENPAGO.Value);

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND PF_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmPagosFondoGarantia.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;
                
procedure TfrmPagosFondoGarantia.GridDblClick(Sender: TObject);
begin
  tbPropiedadesClick(nil);
end;

procedure TfrmPagosFondoGarantia.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');

  Abrir(TfrmDetallePagosFondoGarantia, frmDetallePagosFondoGarantia, tmvNormal, nil);
  frmDetallePagosFondoGarantia.IdDetallePago := sdqConsulta.FieldByName('NRO_PAGO').AsInteger;
  Abrir(TfrmDetallePagosFondoGarantia, frmDetallePagosFondoGarantia, tmvModal, nil);

  if frmDetallePagosFondoGarantia.HuboModificaciones then
    RefreshData;
end;

procedure TfrmPagosFondoGarantia.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmPagosFondoGarantia.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmPagosFondoGarantia.mnuImprimirDetallePagoClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');

  TqrDetallePagosFondoGarantia.Preparar(sdqConsulta.FieldByName('NRO_PAGO').AsInteger);
end;

procedure TfrmPagosFondoGarantia.tbEnvioSRTClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(sdqConsulta.FieldByName('BOLETA_DEPOSITO').IsNull, nil, 'Debe existir boleta de depósito.');
  Verificar(not sdqConsulta.FieldByName('FECHA_ENVIO').IsNull, nil, 'Este pago ya ha sido enviado.');

  sSql := 'UPDATE ZPF_PAGOFONDOGARANTIA ' +
             'SET PF_USUSELECCION = null ' +
           'WHERE PF_USUSELECCION = :User';
  EjecutarSqlEx(sSql, [Sesion.UserId]);

  sSql := 'UPDATE ZPF_PAGOFONDOGARANTIA ' +
             'SET PF_USUSELECCION = :User ' +
           'WHERE PF_ID = :Id';
  EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('NRO_PAGO').AsInteger]);

  if ImpoExpoWizard('CEFG') then
    RefreshData;
end;

procedure TfrmPagosFondoGarantia.tbBoletaDepositoClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro.');
  Verificar(not sdqConsulta.FieldByName('FECHA_ENVIO').IsNull, nil, 'Este pago ya ha sido enviado.');

  if fpBoletaDeposito.ShowModal = mrOk then
  begin
    with TSql.Create('ZPF_PAGOFONDOGARANTIA') do
    try
      SqlType := stUpdate;
      PrimaryKey.Add('PF_ID',           sdqConsulta.FieldByName('NRO_PAGO').AsInteger);

      Fields.Add('PF_BOLETADEPOSITO',   Trim(edBoletaDeposito.Text));
      Fields.Add('PF_FECHADEPOSITO',    edFBoletaDepos.Date);

      EjecutarSql(Sql);
      RefreshData;
    finally
      Free;
    end;
  end;
end;

procedure TfrmPagosFondoGarantia.fpBoletaDepositoEnter(Sender: TObject);
begin
  edBoletaDeposito.Text :=  sdqConsulta.FieldByName('BOLETA_DEPOSITO').AsString;
  edFBoletaDepos.Date   :=  sdqConsulta.FieldByName('FECHA_DEPOSITO').AsDateTime;
end;

procedure TfrmPagosFondoGarantia.btnAceptarBoletaDeposClick(Sender: TObject);
begin
  Verificar(IsEmptyString(edBoletaDeposito.Text), edBoletaDeposito, 'Debe ingresar la boleta de depósito.');
  Verificar(edFBoletaDepos.IsEmpty, edFBoletaDepos, 'Debe ingresar la fecha de la boleta de depósito.');
  Verificar(edFBoletaDepos.Date > DBDate(), edFBoletaDepos, 'La fecha de la boleta de depósito no puede ser posterior a hoy.');

  fpBoletaDeposito.ModalResult := mrOk;
end;

procedure TfrmPagosFondoGarantia.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmPagosFondoGarantia.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor    := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active Then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmPagosFondoGarantia.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmPagosFondoGarantia.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmPagosFondoGarantia.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if IsBaja then
    AFont.Color := clRed;
end;

function TfrmPagosFondoGarantia.IsBaja: Boolean;
begin
  Result := sdqConsulta.Active and (not sdqConsulta.FieldByName('FECHABAJA').IsNull);
end;

end.

