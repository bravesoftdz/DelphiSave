unit unSubdiarioSiniestro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, DateComboBox,
  PeriodoPicker;

type
  TfrmSubdiarioSiniestro = class(TForm)
    btnAceptar: TButton;
    edPERIODO: TPeriodoPicker;
    edDESC_PERIODO: TEdit;
    lbFechaDesde: TLabel;
    btnCancelar: TButton;
    chkGenerarAsientos: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPERIODOExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
  public
  end;

var
  frmSubdiarioSiniestro: TfrmSubdiarioSiniestro;

implementation

uses
  CustomDlgs, unRptSubDiarioSiniestro, unPrincipal, unConcBanc, Periodo, unDmPrincipal, unSesion, unDmFinancials,
  DateTimeFuncs;

{$R *.DFM}

procedure TfrmSubdiarioSiniestro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  	Close;
end;

procedure TfrmSubdiarioSiniestro.btnAceptarClick(Sender: TObject);
var
  SaldoAnterior: Currency;
  sSql: String;
begin
  Verificar(edPERIODO.Periodo.Valor = '', edPERIODO, 'El período no puede quedar en blanco.');

  if chkGenerarAsientos.Checked then
    with dmFinancials do
    begin
    	Conectar;
      try
      	sSql := 'ART_TESORERIA.DO_INTERFACEASIENTOS(:Tipo, :Fecha, :Usuario);';
        dmFinancials.EjecutarStoreEx(sSql, ['M', TDateTimeEx.Create(LastDayOfPeriodo(edPERIODO.Periodo.Valor)), Sesion.UserId]);
      finally
      	DesConectar;
      end;
    end;

  rptSubDiarioSiniestro := TrptSubDiarioSiniestro.Create(Self);
  with rptSubDiarioSiniestro do
  try
    sNombreQRP := 'SubDiarioSiniestro';
    SetNombrePDF(sNombreQRP, '');
    iIndex := GetPrinterPDF();
    Verificar(iIndex = -1, nil, 'No se encontro la impresora PDF.');
    PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;

    sSql := 'SELECT NVL(SUM(MONTO), 0) ' +
              'FROM ( ' +
                    '/*************************************** ALTAS ****************************************/ ' +
                    'SELECT VO_FECHALTA FECHA, VO_MONTO MONTO ' +
                      'FROM SVO_VOLANTES ' +
                    'UNION ALL ' +
                    '/********************************* CANCELACION **********************************************************/ ' +
                    'SELECT VO_FECHAMODIF FECHA, -VO_MONTO MONTO ' +
                      'FROM SVO_VOLANTES ' +
                     'WHERE VO_ESTADO = ''C'' ' +
                    'UNION ALL ' +
                    '/********************************* APROBACION ***********************************************************/ ' +
                    'SELECT VO_FECHAPRO FECHA, -(ABS(VO_MONTOBONI)+VO_MONTOPERCEPCION+VO_MONTODEBITO) MONTO ' +
                      'FROM SVO_VOLANTES ' +
                    'UNION ALL ' +
                    '/********************************* APROBACION AP *********************************************************/ ' +
                    'SELECT VO_FECHAPROAP FECHA, -VO_MONTO MONTO ' +
                      'FROM SVO_VOLANTES ' +
                   ') ' +
             'WHERE FECHA>=TO_DATE(''01/06/2006'', ''DD/MM/YYYY'') ' +
               'AND FECHA<UTILES.PERIODO_PRIMERDIA(:PERIODO)';

    SaldoAnterior := ValorSqlExtendedEx(sSql, [edPERIODO.Periodo.Valor]);
    qrlSaldoAnterior.Caption := FloatToStr(SaldoAnterior);

    sdqReporte.Close;
    sdqReporte.ParamByName('PERIODO').AsString := edPERIODO.Periodo.Valor;
    sdqReporte.Open;

    FinalizarEspera;

    if sdqReporte.IsEmpty then
      MsgBox('No se encontraron datos para la selección actual')
    else
      Print;
  finally
    FreeAndNil(rptSubDiarioSiniestro);
  end;
end;

procedure TfrmSubdiarioSiniestro.FormCreate(Sender: TObject);
begin
  edPERIODO.Periodo.Valor := GetPeriodo(DBDate, fpAnioMes);
  edDESC_PERIODO.Text     := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmSubdiarioSiniestro.edPERIODOExit(Sender: TObject);
begin
  edDESC_PERIODO.Text := edPERIODO.Periodo.GetPeriodoName;
end;

procedure TfrmSubdiarioSiniestro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
