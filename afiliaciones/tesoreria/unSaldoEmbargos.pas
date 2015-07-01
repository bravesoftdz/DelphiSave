unit unSaldoEmbargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  Mask, ToolEdit, DateComboBox;

type
  TfrmSaldoEmbargos = class(TfrmCustomConsulta)
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    chkSoloConSaldo: TCheckBox;
    ToolButton2: TToolButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edSaldoHasta: TDateComboBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
  private
    procedure CalcTotales;
  public
  end;

const
  MAXCOLS = 3;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('APLICADO', 'IMPORTE', 'SALDO', 'MONTOEMBARGADO');

var
  frmSaldoEmbargos: TfrmSaldoEmbargos;
  TotalConsulta: Array of Extended;

implementation

uses
  DbFuncs, CustomDlgs, General, Strfuncs, AnsiSql;
  
{$R *.dfm}

procedure TfrmSaldoEmbargos.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmSaldoEmbargos.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql: String;
begin
  sWhere := '';

  sSql := 'SELECT TIPO, CARPETA, DEMANDANTE, DEMANDADO, CARATULA, JURISDICCION, FUERO, JUZGADO, INSTANCIA, ' +
                  'SECRETARIA, REPETIDO, BANCO, CUENTA, IMPORTE, MONTOEMBARGADO, APLICADO, SALDO, FECHA, OFICIO, ESTADO, OBSERVACIONES, ' +
                  'HOLDING, TIPOJUICIO, GPBA, MALA_PRAXIS ' +
            'FROM ( SELECT ''EMBARGO'' TIPO, ' +
                           'JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DEMANDADO DEMANDADO, NVL(JT_CARATULA, EM_CARATULA) CARATULA, ' +
                           'JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DESCRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA, ' +
                           'SC_DESCRIPCION SECRETARIA, BA_NOMBRE BANCO, CB_NUMERO CUENTA, EM_IMPORTE IMPORTE, EM_MONTOEMBARGADO MONTOEMBARGADO, ' +
                           'ART.LEGALES.GET_MONTOAPLICADOEMBARGO(EM_ID, ' + SqlValue(edSaldoHasta.Date) + ') APLICADO, EM_IMPORTE - ART.LEGALES.GET_MONTOAPLICADOEMBARGO(EM_ID, ' + SqlValue(edSaldoHasta.Date) + ') + LEGALES.GET_INTERESESEMBARGO(EM_ID, ' + SqlValue(edSaldoHasta.Date) + ') SALDO, ' +
                           'EM_FECHA FECHA, EM_OFICIO OFICIO, EE_DESCRIPCION ESTADO, EM_REPETIDO REPETIDO, EM_OBSERVACIONES OBSERVACIONES, ' +
                           '(SELECT MAX(GE_DESCRIPCION) ' +
                              'FROM AGE_GRUPOECONOMICO, AEM_EMPRESA, ACO_CONTRATO, LEGALES.LOD_ORIGENDEMANDA ' +
                             'WHERE OD_IDJUICIOENTRAMITE = JT_ID ' +
                               'AND CO_CONTRATO = OD_CONTRATO ' +
                               'AND EM_ID = CO_IDEMPRESA ' +
                               'AND GE_ID = EM_IDGRUPOECONOMICO) HOLDING, ' +
                           'DECODE(JT_ESTADOMEDIACION, ''A'', ''P. Actora'', ''J'', ''P. Demandada'', '''') TIPOJUICIO, ' +
                           'DECODE(JT_GPBA, ''1'', ''SI'', ''NO'') GPBA, DECODE(JT_GPBAMALAPRAXIS, ''S'', ''SI'', ''NO'') MALA_PRAXIS ' +
                     'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICIOENTRAMITE, LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO, ' +
                          'LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LSC_SECRETARIA, LRE_REGULARIZACIONEMBARGO, LEE_ESTADOEMBARGO, ' +
                          'LEM_EMBARGO ' +
                    'WHERE EE_ID = EM_IDESTADO ' +
                      'AND CB_ID(+) = EM_IDCUENTABANCARIA ' +
                      'AND BA_ID(+) = CB_IDBANCO ' +
                      'AND RE_ID(+) = EM_IDREGULARIZADO ' +
                      'AND JT_ID(+) = EM_IDJUICIO ' +
                      'AND IN_ID = JZ_IDINSTANCIA ' +
                      'AND JU_ID = NVL(JT_IDJURISDICCION, EM_IDJURISDICCION) ' +
                      'AND FU_ID = NVL(JT_IDFUERO, EM_IDFUERO) ' +
                      'AND JZ_ID = NVL(JT_IDJUZGADO, EM_IDJUZGADO) ' +
                      'AND SC_ID = NVL(JT_IDSECRETARIA, EM_IDSECRETARIA) ' +
                      'AND EM_FECHABAJA IS NULL ' +
                      Iif(edSaldoHasta.IsEmpty, '', 'AND TRUNC(EM_FECHAALTA) <= ' + SqlValue(edSaldoHasta.Date) + ' ') +
                    'UNION ALL ' +
                   'SELECT ''DEVOLUCION'' TIPO, ' +
                           'NULL CARPETA, NULL DEMANDANTE, NULL DEMANDADO, ' +
                           'VE_CARATULA CARATULA, JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DESCRIPCION JUZGADO, ' +
                           'IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETARIA, BA_NOMBRE BANCO, CB_NUMERO CUENTA, -VE_IMPORTE IMPORTE, 0 MONTOEMBARGADO, ' +
                           '-ART.LEGALES.GET_MONTOAPLICADOEMBARGO(VE_ID, NULL, ''D'') APLICADO, ' +
                           '-( VE_IMPORTE- ART.LEGALES.GET_MONTOAPLICADOEMBARGO(VE_ID, NULL, ''D'')) SALDO, ' +
                           'VE_FECHA FECHA, VE_OFICIO OFICIO, ''Sin Asignar'' ESTADO, null REPETIDO, VE_OBSERVACIONES OBSERVACIONES, ' +
                           'NULL HOLDING, NULL TIPOJUICIO, NULL GPBA, NULL MALA_PRAXIS ' +
                     'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO, LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, ' +
                          'LEGALES.LSC_SECRETARIA, LVE_DEVOLUCIONEMBARGO ' +
                    'WHERE CB_ID = VE_IDCUENTABANCARIA ' +
                      'AND BA_ID = CB_IDBANCO ' +
                      'AND IN_ID = JZ_IDINSTANCIA ' +
                      'AND JU_ID = VE_IDJURISDICCION ' +
                      'AND FU_ID = VE_IDFUERO ' +
                      'AND JZ_ID = VE_IDJUZGADO ' +
                      'AND SC_ID = VE_IDSECRETARIA ' +
                      'AND VE_ASIGNADO = ''N'' ' +
                      Iif(edSaldoHasta.IsEmpty, '', 'AND TRUNC(VE_FECHAALTA) <= ' + SqlValue(edSaldoHasta.Date) + ' ') +
                      'AND VE_FECHABAJA IS NULL ) ' +
           'WHERE 1 = 1 ';

  if chkSoloConSaldo.Checked then
    sWhere := 'AND SALDO <> 0 ';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmSaldoEmbargos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmSaldoEmbargos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmSaldoEmbargos.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength( TotalConsulta,  MAXCOLS  + 1);
  tbRefrescarClick(nil);
end;

procedure TfrmSaldoEmbargos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
	TFloatField(sdqConsulta.FieldByName('APLICADO')).Currency := True;
	TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency 	:= True;
  TFloatField(sdqConsulta.FieldByName('SALDO')).Currency 		:= True;
	TFloatField(sdqConsulta.FieldByName('MONTOEMBARGADO')).Currency 	:= True;
end;

procedure TfrmSaldoEmbargos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  chkSoloConSaldo.Checked := True;
  edSaldoHasta.Clear;
end;

end.
