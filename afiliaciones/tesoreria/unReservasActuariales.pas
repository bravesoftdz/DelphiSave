unit unReservasActuariales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, PeriodoPicker, StdCtrls, Menus, RxPlacemnt;

type
  TTiposReservas = (trNone, trIncapacidad, trMortales, trJuicios, trILT, trPrestEspecie, trPEMasaSal, trExtILT, trGInvalidez, trResumen);
  
  TfrmReservasActuariales = class(TfrmCustomConsulta)
    gbPeriodo: TGroupBox;
    edPeriodo: TPeriodoPicker;
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    pgGrillas: TPageControl;
    tsIncapacidad: TTabSheet;
    tsMortales: TTabSheet;
    GridMortales: TArtDBGrid;
    tsJuicios: TTabSheet;
    tsILT: TTabSheet;
    tsPrestEspecie: TTabSheet;
    sdqMortales: TSDQuery;
    dsMortales: TDataSource;
    sdqJuicios: TSDQuery;
    dsJuicios: TDataSource;
    sdqILT: TSDQuery;
    dsILT: TDataSource;
    sdqPrestEspecie: TSDQuery;
    dsPrestEspecie: TDataSource;
    GridJuicios: TArtDBGrid;
    GridILT: TArtDBGrid;
    GridPrestEspecie: TArtDBGrid;
    SortDialogMortales: TSortDialog;
    SortDialogJuicios: TSortDialog;
    SortDialogILT: TSortDialog;
    SortDialogPrestEspecie: TSortDialog;
    sdqResumen: TSDQuery;
    dsResumen: TDataSource;
    SortDialogResumen: TSortDialog;
    tsResumen: TTabSheet;
    GridResumen: TArtDBGrid;
    tsPEMasaSal: TTabSheet;
    tsExtILT: TTabSheet;
    GridPEMasaSal: TArtDBGrid;
    GridExtILT: TArtDBGrid;
    sdqPEMasaSal: TSDQuery;
    dsPEMasaSal: TDataSource;
    SortDialogPEMasaSal: TSortDialog;
    sdqExtILT: TSDQuery;
    dsExtILT: TDataSource;
    SortDialogExtILT: TSortDialog;
    tsGInvalidez: TTabSheet;
    GridGInvalidez: TArtDBGrid;
    sdqGInvalidez: TSDQuery;
    dsGInvalidez: TDataSource;
    SortDialogGInvalidez: TSortDialog;
    procedure tbSumatoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqMortalesAfterOpen(DataSet: TDataSet);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridMortalesPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridJuiciosPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridILTPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridPrestEspeciePaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure pgGrillasChange(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure sdqJuiciosAfterOpen(DataSet: TDataSet);
    procedure sdqILTAfterOpen(DataSet: TDataSet);
    procedure sdqPrestEspecieAfterOpen(DataSet: TDataSet);
    procedure GridResumenPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqResumenAfterOpen(DataSet: TDataSet);
    procedure GridPEMasaSalPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure GridExtILTPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqPEMasaSalAfterOpen(DataSet: TDataSet);
    procedure sdqExtILTAfterOpen(DataSet: TDataSet);
    procedure sdqGInvalidezAfterOpen(DataSet: TDataSet);
    procedure GridGInvalidezPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor;  var AlignFooter: TAlingFooter);
  private
    procedure CalcTotales(Grilla: TArtDBGrid; CAMPOS_SUMA: Array of String; Indice: Integer);
    procedure GrillaPaintFooter(MAXCOLS: Integer; CAMPOS_SUMA: Array of String; Indice: Integer; Column: String; var Value: String; var AlignFooter: TAlingFooter);
    function GetTipoReserva: TTiposReservas;
    function GetObjSortDialog: TSortDialog;
  public
  protected
    procedure RefreshData; override;
  end;

const
  MAXCOLS0 = 8;
  CAMPOS_SUMA0: Array [0..MAXCOLS0] of String = ('IBD', 'IBD_POSDECRETO', 'ANTICIPOS', 'RESERVA_TOTAL', 'RESERVA_ART', 'RESERVA_FFEP', 'RESERVA_GBPA', 'ASIGNACION_FAMILIAR', 'TOTAL');

  MAXCOLS1 = 7;
  CAMPOS_SUMA1: Array [0..MAXCOLS1] of String = ('IBD', 'RESERVA_CAPITAL', 'RESERVA_ADICIONAL', 'RESERVA', 'RESERVA_ART', 'RESERVA_FFEP', 'RESERVA_GBPA', 'TOTAL');

  MAXCOLS2 = 4;
  CAMPOS_SUMA2: Array [0..MAXCOLS2] of String = ('CAPITAL', 'HONORARIOS', 'RESERVA_TOTAL', 'RESERVA_ART', 'RESERVA_GBPA');

  MAXCOLS3 = 6;
  CAMPOS_SUMA3: Array [0..MAXCOLS3] of String = ('IBD', 'IBD_PROMEDIO', 'RESERVA_ILT', 'RESERVA_ILT_ART', 'RESERVA_ILT_FFEP', 'RESERVA_ILT_GBPA', 'RESERVA_CONTRIBUCIONES');

  MAXCOLS4 = 5;
  CAMPOS_SUMA4: Array [0..MAXCOLS4] of String = ('PRESTACION_TOTAL', 'COSTO_MINIMO', 'RESERVA', 'RESERVA_ART', 'RESERVA_FFEP', 'RESERVA_GBPA');

  MAXCOLS5 = 0;
  CAMPOS_SUMA5: Array [0..MAXCOLS5] of String = ('TOTAL');

  MAXCOLS6 = 1;
  CAMPOS_SUMA6: Array [0..MAXCOLS6] of String = ('MASASALARIAL', 'RESPEMASA');

  MAXCOLS7 = 6;
  CAMPOS_SUMA7: Array [0..MAXCOLS7] of String = ('IBD', 'IBD_VIEJO', 'IBDPROMEDIO', 'RES_EXTILT', 'RES_EXTILT_ART', 'RES_EXTILT_FFEP', 'RES_EXTILT_GBPA');

  MAXCOLS8 = 2;
  CAMPOS_SUMA8: Array [0..MAXCOLS8] of String = ('SPL', 'RESERVABALANCE', 'DIFERENCIA');

var
  frmReservasActuariales: TfrmReservasActuariales;
  TotalConsulta: Array[0..8] of Array of Extended;

implementation

uses
  CustomDlgs, StrFuncs, AnsiSql, DbFuncs, General, unArt;

{$R *.dfm}

procedure TfrmReservasActuariales.FormCreate(Sender: TObject);
begin
  unArt.LoadDynamicSortFields(SortDialogMortales.SortFields, GridMortales.Columns);
  unArt.LoadDynamicSortFields(SortDialogJuicios.SortFields, GridJuicios.Columns);
  unArt.LoadDynamicSortFields(SortDialogILT.SortFields, GridILT.Columns);
  unArt.LoadDynamicSortFields(SortDialogPrestEspecie.SortFields, GridPrestEspecie.Columns);
  unArt.LoadDynamicSortFields(SortDialogPEMasaSal.SortFields, GridPEMasaSal.Columns);
  unArt.LoadDynamicSortFields(SortDialogExtILT.SortFields, GridExtILT.Columns);
  unArt.LoadDynamicSortFields(SortDialogGInvalidez.SortFields, GridGInvalidez.Columns);
  unArt.LoadDynamicSortFields(SortDialogResumen.SortFields, GridResumen.Columns);

  inherited;

  Grid.Parent          := tsIncapacidad;
  pgGrillas.ActivePage := tsIncapacidad;

  SetLength(TotalConsulta[0], MAXCOLS0 + 1);
  SetLength(TotalConsulta[1], MAXCOLS1 + 1);
  SetLength(TotalConsulta[2], MAXCOLS2 + 1);
  SetLength(TotalConsulta[3], MAXCOLS3 + 1);
  SetLength(TotalConsulta[4], MAXCOLS4 + 1);
  SetLength(TotalConsulta[5], MAXCOLS5 + 1);
  SetLength(TotalConsulta[6], MAXCOLS6 + 1);
  SetLength(TotalConsulta[7], MAXCOLS7 + 1);
  SetLength(TotalConsulta[8], MAXCOLS8 + 1);
end;

procedure TfrmReservasActuariales.CalcTotales(Grilla: TArtDBGrid; CAMPOS_SUMA: Array of String; Indice: Integer);
var
	PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grilla.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and Grilla.DataSource.Dataset.Active then
        SumFields(Grilla.DataSource.Dataset, CAMPOS_SUMA, TotalConsulta[Indice]);
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmReservasActuariales.RefreshData;
var
  sWhere, sSql: String;
  TipoRes: TTiposReservas;
begin
  Verificar(IsEmptyString(edPeriodo.Periodo.Valor), edPeriodo, 'Debe indicar el periodo.');

  TipoRes := GetTipoReserva();
  case TipoRes of
    trIncapacidad:
      begin
        DBGrid     := Grid;
        DataSource := dsConsulta;

        sSql := 'SELECT RP_SINIESTRO SINIESTRO, RP_ORDEN ORDEN, RP_FACCIDENTE FECHA_ACCIDENTE, ' +
                       'RP_SEXO SEXO, RP_IBD IBD, RP_IBD_POSDECRETO IBD_POSDECRETO, RP_EDAD EDAD, ' +
                       'RP_ACTIVIDAD ACTIVIDAD, RP_SECTOR SECTOR, RP_PORCENTAJE PORCENTAJE, ' +
                       'RP_ANTICIPOS ANTICIPOS, RP_RES_TOTAL RESERVA_TOTAL, RP_RES_ART RESERVA_ART, ' +
                       'RP_RES_FFEP RESERVA_FFEP, RP_RES_GBPA RESERVA_GBPA, RP_RESERVA RESERVA, ' +
                       'RP_CLASIFICACION CLASIFICACION, RP_FNACIMIENTO FECHA_NACIMIENTO, ' +
                       'RP_FFIN_ILT FECHA_FIN_ILT, RP_FFIN_ILP FECHA_FIN_ILP, RP_CIE10 CIE10, ' +
                       'RP_SITUACIONACTUAL SITUACION_ACTUAL, RP_FDICTAMEN FECHA_DICTAMEN, ' +
                       'RP_FALTAMEDICA FECHA_ALTA_MEDICA, RP_ASIGFAMILIAR ASIGNACION_FAMILIAR, RP_TOTAL TOTAL, ' +
                       'RP_JUICIO1 JUICIO1, RP_JUICIO2 JUICIO2, RP_JUICIO3 JUICIO3, RP_JUICIO4 JUICIO4, ' +
                       'EX_CUIT CUIT, EX_CONTRATO CONTRATO ' +
                  'FROM SEX_EXPEDIENTES, ACTUARIAL.URP_RESERVAINCAPACIDAD ' +
                 'WHERE RP_SINIESTRO = EX_SINIESTRO(+) ' +
                   'AND RP_ORDEN = EX_ORDEN(+) ' +
                   'AND EX_RECAIDA(+) = 0 ';

        sWhere := ' AND RP_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trMortales:
      begin
        DBGrid     := GridMortales;
        DataSource := dsMortales;

        sSql := 'SELECT RM_SINIESTRO SINIESTRO, RM_ORDEN ORDEN, RM_NOMBRE NOMBRE, RM_FACCIDENTE FECHA_ACCIDENTE, ' +
                       'RM_SEXO SEXO, RM_IBD IBD, RM_EDAD EDAD, RM_ACTIVIDAD ACTIVIDAD, RM_SECTOR SECTOR, ' +
                       'RM_RES_CAPITAL RESERVA_CAPITAL, RM_RES_ADICIONAL RESERVA_ADICIONAL, RM_RESERVA RESERVA, ' +
                       'RM_RES_ART RESERVA_ART, RM_RES_FFEP RESERVA_FFEP, RM_RES_GBPA RESERVA_GBPA, ' +
                       'RM_FNACIMIENTO FECHA_NACIMIENTO, RM_TOTAL TOTAL, RM_JUICIO1 JUICIO1, RM_JUICIO2 JUICIO2, ' +
                       'RM_JUICIO3 JUICIO3, RM_JUICIO4 JUICIO4, EX_CUIT CUIT, EX_CONTRATO CONTRATO ' +
                  'FROM SEX_EXPEDIENTES, ACTUARIAL.URM_RESERVAMORTAL ' +
                 'WHERE RM_SINIESTRO = EX_SINIESTRO(+) ' +
                   'AND RM_ORDEN = EX_ORDEN(+) ' +
                   'AND EX_RECAIDA(+) = 0 ';

        sWhere := ' AND RM_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trJuicios:
      begin
        DBGrid     := GridJuicios;
        DataSource := dsJuicios;

        sSql := 'SELECT RJ_JUICIO JUICIO, RJ_SINIESTRO SINIESTRO, RJ_ORDEN ORDEN, RJ_CARATULA CARATULA, ' +
                       'RJ_CAPITAL CAPITAL, RJ_HONORARIOS HONORARIOS, RJ_RES_TOTAL RESERVA_TOTAL, ' +
                       'RJ_RES_ART RESERVA_ART, RJ_RES_GBPA RESERVA_GBPA, RJ_FECHAINICIO FECHA_INICIO, ' +
                       'RJ_FACCIDENTE FECHA_ACCIDENTE, RJ_FECHA FECHA, RJ_ESTADO ESTADO, RJ_SECTOR SECTOR, ' +
                       'RJ_GPBA GPBA, RJ_DESCRIPCION DESCRIPCION, EX_CUIT CUIT, EX_CONTRATO CONTRATO ' +
                  'FROM SEX_EXPEDIENTES, ACTUARIAL.URJ_RESERVAJUICIO ' +
                 'WHERE RJ_SINIESTRO = EX_SINIESTRO(+) ' +
                   'AND RJ_ORDEN = EX_ORDEN(+) ' +
                   'AND EX_RECAIDA(+) = 0 ';

        sWhere := ' AND RJ_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trILT:
      begin
        DBGrid     := GridILT;
        DataSource := dsILT;

        sSql := 'SELECT RI_SINIESTRO SINIESTRO, RI_ORDEN ORDEN, RI_NOMBRE NOMBRE, RI_FACCIDENTE FACCIDENTE, ' +
                       'RI_IBD IBD, RI_SECTOR SECTOR, RI_IBDPROMEDIO IBD_PROMEDIO, RI_DIASILT DIAS_ILT, ' +
                       'RI_DIASLIQUIDADOS DIAS_LIQUIDADOS, RI_FRANQUICIA FRANQUICIA, RI_DIASILT_ART DIAS_ILT_ART, ' +
                       'RI_DIASPEND_ILT DIAS_PENDIENTES_ILT, RI_RES_ILT RESERVA_ILT, RI_RES_ILT_ART RESERVA_ILT_ART, ' +
                       'RI_RES_ILT_FFEP RESERVA_ILT_FFEP, RI_RES_ILT_GBPA RESERVA_ILT_GBPA, RI_CLASIFICACION CLASIFICACION, ' +
                       'RI_RES_CONTRI RESERVA_CONTRIBUCIONES, EX_CUIT CUIT, EX_CONTRATO CONTRATO ' +
                  'FROM SEX_EXPEDIENTES, ACTUARIAL.URI_RESERVAILT ' +
                 'WHERE RI_SINIESTRO = EX_SINIESTRO(+) ' +
                   'AND RI_ORDEN = EX_ORDEN(+) ' +
                   'AND EX_RECAIDA(+) = 0 ';

        sWhere := ' AND RI_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trPrestEspecie:
      begin
        DBGrid     := GridPrestEspecie;
        DataSource := dsPrestEspecie;

        sSql := 'SELECT RE_SINIESTRO SINIESTRO, RE_ORDEN ORDEN, RE_NOMBRE NOMBRE, RE_FACCIDENTE FECHA_ACCIDENTE, ' +
                       'RE_SECTOR SECTOR, RE_PETOTAL PRESTACION_TOTAL, PE_COSTOMINIMOACT COSTO_MINIMO, ' +
                       'RE_RESERVA RESERVA, RE_RES_ART RESERVA_ART, RE_RES_FFEP RESERVA_FFEP, RE_RES_GBPA RESERVA_GBPA, ' +
                       'RE_CLASIFICACION CLASIFICACION, EX_CUIT CUIT, EX_CONTRATO CONTRATO ' +
                  'FROM SEX_EXPEDIENTES, ACTUARIAL.URE_RESERVAPRESESPE ' +
                 'WHERE RE_SINIESTRO = EX_SINIESTRO(+) ' +
                   'AND RE_ORDEN = EX_ORDEN(+) ' +
                   'AND EX_RECAIDA(+) = 0 ';

        sWhere := ' AND RE_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trPEMasaSal:
      begin
        DBGrid     := GridPEMasaSal;
        DataSource := dsPEMasaSal;

        sSql := 'SELECT RM_CONTRATO CONTRATO, RM_MASASALARIAL MASASALARIAL, RM_RESPEMASA RESPEMASA, ' +
                       'EM_CUIT CUIT ' +
                  'FROM AEM_EMPRESA, ACO_CONTRATO, ACTUARIAL.URM_RESERVAESPEMASA ' +
                 'WHERE CO_IDEMPRESA = EM_ID(+) ' +
                   'AND RM_CONTRATO = CO_CONTRATO(+) ';

        sWhere := ' AND RM_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trExtILT:
      begin
        DBGrid     := GridExtILT;
        DataSource := dsExtILT;

        sSql := 'SELECT RE_IDRESERVA IDRESERVA, RE_IDRESERVA_ART IDRESERVA_ART, RE_IDRESERVA_FFEP IDRESERVA_FFEP, ' +
                       'RE_IDRESERVA_GPBA IDRESERVA_GPBA, RE_SINIESTRO SINIESTRO, RE_ORDEN ORDEN, RE_NOMBRE NOMBRE, ' +
                       'RE_FACCIDENTE FACCIDENTE, RE_FECHAILT2 FECHAILT2, RE_IBD IBD, RE_IBD_VIEJO IBD_VIEJO, RE_SECTOR SECTOR, ' +
                       'RE_IBDPROMEDIO IBDPROMEDIO, RE_DIASEXTILT DIASEXTILT, RE_DIASEXTLIQUIDADOS DIASEXTLIQUIDADOS, ' +
                       'RE_DIASPEND_EXTILT DIASPEND_EXTILT, RE_RES_EXTILT RES_EXTILT, RE_RES_EXTILT_ART RES_EXTILT_ART, ' +
                       'RE_RES_EXTILT_FFEP RES_EXTILT_FFEP, RE_RES_EXTILT_GBPA RES_EXTILT_GBPA, RE_CLASIFICACION CLASIFICACION, ' +
                       'RE_CIIU CIIU, RE_CONTRATO CONTRATO, RE_TRIMESTRE TRIMESTRE, EM_CUIT CUIT ' +
                  'FROM AEM_EMPRESA, ACO_CONTRATO, ACTUARIAL.URE_RESERVAEXTILT ' +
                 'WHERE CO_IDEMPRESA = EM_ID(+) ' +
                   'AND RE_CONTRATO = CO_CONTRATO(+) ';

        sWhere := ' AND RE_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trGInvalidez:
      begin
        DBGrid     := GridGInvalidez;
        DataSource := dsGInvalidez;

        sSql := 'SELECT RG_SINIESTRO SINIESTRO, RG_ORDEN ORDEN, RG_SPL SPL, RG_RESERVABALANCE RESERVABALANCE, RG_DIFERENCIA DIFERENCIA, ' +
                       'EX_CUIT CUIT, EX_CONTRATO CONTRATO ' +
                  'FROM SEX_EXPEDIENTES, ACTUARIAL.URG_RESERVAGI ' +
                 'WHERE RG_SINIESTRO = EX_SINIESTRO(+) ' +
                   'AND RG_ORDEN = EX_ORDEN(+) ' +
                   'AND EX_RECAIDA(+) = 0 ';

        sWhere := ' AND RG_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
    trResumen:
      begin
        DBGrid     := GridResumen;
        DataSource := dsResumen;

        sSql := 'SELECT TIPO, TOTAL ' +
                  'FROM (SELECT ''Incapacidad'' TIPO, RP_PERIODO PERIODO, SUM(RP_RES_ART) TOTAL ' +
                          'FROM ACTUARIAL.URP_RESERVAINCAPACIDAD ' +
                         'GROUP BY RP_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''Mortales'' TIPO, RM_PERIODO PERIODO, SUM(RM_RES_ART) TOTAL ' +
                          'FROM ACTUARIAL.URM_RESERVAMORTAL ' +
                         'GROUP BY RM_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''Juicios'' TIPO, RJ_PERIODO PERIODO, SUM(RJ_RES_TOTAL) TOTAL ' +
                          'FROM ACTUARIAL.URJ_RESERVAJUICIO ' +
                         'GROUP BY RJ_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''ILT'' TIPO, RI_PERIODO PERIODO, SUM(RI_RES_CONTRI) TOTAL ' +
                          'FROM ACTUARIAL.URI_RESERVAILT ' +
                         'GROUP BY RI_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''Prestaciones en Especie'' TIPO, RE_PERIODO PERIODO, SUM(RE_RES_ART) TOTAL ' +
                          'FROM ACTUARIAL.URE_RESERVAPRESESPE ' +
                         'GROUP BY RE_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''PE por Masa Salarial'' TIPO, RM_PERIODO PERIODO, SUM(RM_RESPEMASA) TOTAL ' +
                          'FROM ACTUARIAL.URM_RESERVAESPEMASA ' +
                         'GROUP BY RM_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''Extensión de ILT'' TIPO, RE_PERIODO PERIODO, SUM(RE_RES_EXTILT_ART) TOTAL ' +
                          'FROM ACTUARIAL.URE_RESERVAEXTILT ' +
                         'GROUP BY RE_PERIODO ' +
                         'UNION ALL ' +
                        'SELECT ''Gran Invalidez'' TIPO, RG_PERIODO PERIODO, SUM(RG_RESERVABALANCE) TOTAL ' +
                          'FROM ACTUARIAL.URG_RESERVAGI ' +
                         'GROUP BY RG_PERIODO) ' +
                 'WHERE 1 = 1';

        sWhere := ' AND PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
      end;
  end;

  TSDQuery(DataSource.DataSet).Sql.Text := sSql + sWhere + GetObjSortDialog.OrderBy;
  inherited;
end;

procedure TfrmReservasActuariales.tbSumatoriaClick(Sender: TObject);
var
  TipoRes: TTiposReservas;
begin
  TipoRes := GetTipoReserva();
  case TipoRes of
    trIncapacidad:
      CalcTotales(Grid, CAMPOS_SUMA0, 0);
    trMortales:
      CalcTotales(GridMortales, CAMPOS_SUMA1, 1);
    trJuicios:
      CalcTotales(GridJuicios, CAMPOS_SUMA2, 2);
    trILT:
      CalcTotales(GridILT, CAMPOS_SUMA3, 3);
    trPrestEspecie:
      CalcTotales(GridPrestEspecie, CAMPOS_SUMA4, 4);
    trPEMasaSal:
      CalcTotales(GridPEMasaSal, CAMPOS_SUMA6, 6);
    trExtILT:
      CalcTotales(GridExtILT, CAMPOS_SUMA7, 7);
    trGInvalidez:
      CalcTotales(GridGInvalidez, CAMPOS_SUMA8, 8);
    trResumen:
      CalcTotales(GridResumen, CAMPOS_SUMA5, 5);
  end;
end;

procedure TfrmReservasActuariales.GrillaPaintFooter(MAXCOLS: Integer; CAMPOS_SUMA: Array of String; Indice: Integer; Column: String; var Value: String; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[Indice][iPos]), '$');
end;

procedure TfrmReservasActuariales.tbLimpiarClick(Sender: TObject);
begin
  pgGrillas.ActivePage := tsIncapacidad;
  edPeriodo.Clear;
  edPeriodo.SetFocus;

  inherited;
end;

function TfrmReservasActuariales.GetTipoReserva: TTiposReservas;
var
  TipoRes: TTiposReservas;
begin
  if pgGrillas.ActivePage = tsIncapacidad then
    TipoRes := trIncapacidad
  else if pgGrillas.ActivePage = tsMortales then
    TipoRes := trMortales
  else if pgGrillas.ActivePage = tsJuicios then
    TipoRes := trJuicios
  else if pgGrillas.ActivePage = tsILT then
    TipoRes := trILT
  else if pgGrillas.ActivePage = tsPrestEspecie then
    TipoRes := trPrestEspecie
  else if pgGrillas.ActivePage = tsPEMasaSal then
    TipoRes := trPEMasaSal
  else if pgGrillas.ActivePage = tsExtILT then
    TipoRes := trExtILT
  else if pgGrillas.ActivePage = tsGInvalidez then
    TipoRes := trGInvalidez
  else if pgGrillas.ActivePage = tsResumen then
    TipoRes := trResumen
  else
    TipoRes := trNone;

  Result := TipoRes;
end;

procedure TfrmReservasActuariales.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS0, CAMPOS_SUMA0, 0, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridMortalesPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS1, CAMPOS_SUMA1, 1, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridJuiciosPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS2, CAMPOS_SUMA2, 2, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridILTPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS3, CAMPOS_SUMA3, 3, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridPrestEspeciePaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS4, CAMPOS_SUMA4, 4, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridResumenPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS5, CAMPOS_SUMA5, 5, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridPEMasaSalPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS6, CAMPOS_SUMA6, 6, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridExtILTPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS7, CAMPOS_SUMA7, 7, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.GridGInvalidezPaintFooter(Sender: TObject; Column: string; var Value: string; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  GrillaPaintFooter(MAXCOLS8, CAMPOS_SUMA8, 8, Column, Value, AlignFooter);
end;

procedure TfrmReservasActuariales.pgGrillasChange(Sender: TObject);
begin
  TSDQuery(DataSource.DataSet).Close;
  RefreshData;
  tbSumatoriaClick(nil);
end;

procedure TfrmReservasActuariales.tbImprimirClick(Sender: TObject);
begin
  QueryPrint.Title.Text := Caption + ' - ' + pgGrillas.ActivePage.Caption;
  inherited;
end;

function TfrmReservasActuariales.GetObjSortDialog: TSortDialog;
var
  TipoRes: TTiposReservas;
begin
  TipoRes := GetTipoReserva();
  case TipoRes of
    trIncapacidad:
      Result := SortDialog;
    trMortales:
      Result := SortDialogMortales;
    trJuicios:
      Result := SortDialogJuicios;
    trILT:
      Result := SortDialogILT;
    trPrestEspecie:
      Result := SortDialogPrestEspecie;
    trPEMasaSal:
      Result := SortDialogPEMasaSal;
    trExtILT:
      Result := SortDialogExtILT;
    trGInvalidez:
      Result := SortDialogGInvalidez;
    trResumen:
      Result := SortDialogResumen;
  else
    Result := nil;
  end;
end;

procedure TfrmReservasActuariales.tbOrdenarClick(Sender: TObject);
var
  SD: TSortDialog;
begin
  SD := GetObjSortDialog;
  unArt.LoadDynamicSortFields(SD.SortFields, DBGrid.Columns);
  SD.Execute;
end;

procedure TfrmReservasActuariales.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('PORCENTAJE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCENTAJE')).DisplayFormat := '% 0.000;-% 0.000';

  if sdqConsulta.FieldByName('IBD') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IBD')).Currency := True;

  if sdqConsulta.FieldByName('IBD_POSDECRETO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('IBD_POSDECRETO')).Currency := True;

  if sdqConsulta.FieldByName('ANTICIPOS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ANTICIPOS')).Currency := True;

  if sdqConsulta.FieldByName('RESERVA_TOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RESERVA_TOTAL')).Currency := True;

  if sdqConsulta.FieldByName('RESERVA_ART') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RESERVA_ART')).Currency := True;

  if sdqConsulta.FieldByName('RESERVA_FFEP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RESERVA_FFEP')).Currency := True;

  if sdqConsulta.FieldByName('RESERVA_GBPA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('RESERVA_GBPA')).Currency := True;

  if sdqConsulta.FieldByName('ASIGNACION_FAMILIAR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ASIGNACION_FAMILIAR')).Currency := True;

  if sdqConsulta.FieldByName('TOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTAL')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqMortalesAfterOpen(DataSet: TDataSet);
begin
  if sdqMortales.FieldByName('IBD') is TFloatField then
    TFloatField(sdqMortales.FieldByName('IBD')).Currency := True;

  if sdqMortales.FieldByName('RESERVA_CAPITAL') is TFloatField then
    TFloatField(sdqMortales.FieldByName('RESERVA_CAPITAL')).Currency := True;

  if sdqMortales.FieldByName('RESERVA_ADICIONAL') is TFloatField then
    TFloatField(sdqMortales.FieldByName('RESERVA_ADICIONAL')).Currency := True;

  if sdqMortales.FieldByName('RESERVA') is TFloatField then
    TFloatField(sdqMortales.FieldByName('RESERVA')).Currency := True;

  if sdqMortales.FieldByName('RESERVA_ART') is TFloatField then
    TFloatField(sdqMortales.FieldByName('RESERVA_ART')).Currency := True;

  if sdqMortales.FieldByName('RESERVA_FFEP') is TFloatField then
    TFloatField(sdqMortales.FieldByName('RESERVA_FFEP')).Currency := True;

  if sdqMortales.FieldByName('RESERVA_GBPA') is TFloatField then
    TFloatField(sdqMortales.FieldByName('RESERVA_GBPA')).Currency := True;

  if sdqMortales.FieldByName('TOTAL') is TFloatField then
    TFloatField(sdqMortales.FieldByName('TOTAL')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqJuiciosAfterOpen(DataSet: TDataSet);
begin
  if sdqJuicios.FieldByName('CAPITAL') is TFloatField then
    TFloatField(sdqJuicios.FieldByName('CAPITAL')).Currency := True;

  if sdqJuicios.FieldByName('HONORARIOS') is TFloatField then
    TFloatField(sdqJuicios.FieldByName('HONORARIOS')).Currency := True;

  if sdqJuicios.FieldByName('RESERVA_TOTAL') is TFloatField then
    TFloatField(sdqJuicios.FieldByName('RESERVA_TOTAL')).Currency := True;

  if sdqJuicios.FieldByName('RESERVA_ART') is TFloatField then
    TFloatField(sdqJuicios.FieldByName('RESERVA_ART')).Currency := True;

  if sdqJuicios.FieldByName('RESERVA_GBPA') is TFloatField then
    TFloatField(sdqJuicios.FieldByName('RESERVA_GBPA')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqILTAfterOpen(DataSet: TDataSet);
begin
  if sdqILT.FieldByName('IBD') is TFloatField then
    TFloatField(sdqILT.FieldByName('IBD')).Currency := True;

  if sdqILT.FieldByName('IBD_PROMEDIO') is TFloatField then
    TFloatField(sdqILT.FieldByName('IBD_PROMEDIO')).Currency := True;

  if sdqILT.FieldByName('RESERVA_ILT') is TFloatField then
    TFloatField(sdqILT.FieldByName('RESERVA_ILT')).Currency := True;

  if sdqILT.FieldByName('RESERVA_ILT_ART') is TFloatField then
    TFloatField(sdqILT.FieldByName('RESERVA_ILT_ART')).Currency := True;

  if sdqILT.FieldByName('RESERVA_ILT_FFEP') is TFloatField then
    TFloatField(sdqILT.FieldByName('RESERVA_ILT_FFEP')).Currency := True;

  if sdqILT.FieldByName('RESERVA_ILT_GBPA') is TFloatField then
    TFloatField(sdqILT.FieldByName('RESERVA_ILT_GBPA')).Currency := True;

  if sdqILT.FieldByName('RESERVA_CONTRIBUCIONES') is TFloatField then
    TFloatField(sdqILT.FieldByName('RESERVA_CONTRIBUCIONES')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqPrestEspecieAfterOpen(DataSet: TDataSet);
begin
  if sdqPrestEspecie.FieldByName('PRESTACION_TOTAL') is TFloatField then
    TFloatField(sdqPrestEspecie.FieldByName('PRESTACION_TOTAL')).Currency := True;

  if sdqPrestEspecie.FieldByName('COSTO_MINIMO') is TFloatField then
    TFloatField(sdqPrestEspecie.FieldByName('COSTO_MINIMO')).Currency := True;

  if sdqPrestEspecie.FieldByName('RESERVA') is TFloatField then
    TFloatField(sdqPrestEspecie.FieldByName('RESERVA')).Currency := True;

  if sdqPrestEspecie.FieldByName('RESERVA_ART') is TFloatField then
    TFloatField(sdqPrestEspecie.FieldByName('RESERVA_ART')).Currency := True;

  if sdqPrestEspecie.FieldByName('RESERVA_FFEP') is TFloatField then
    TFloatField(sdqPrestEspecie.FieldByName('RESERVA_FFEP')).Currency := True;

  if sdqPrestEspecie.FieldByName('RESERVA_GBPA') is TFloatField then
    TFloatField(sdqPrestEspecie.FieldByName('RESERVA_GBPA')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqPEMasaSalAfterOpen(DataSet: TDataSet);
begin
  if sdqPEMasaSal.FieldByName('MASASALARIAL') is TFloatField then
    TFloatField(sdqPEMasaSal.FieldByName('MASASALARIAL')).Currency := True;

  if sdqPEMasaSal.FieldByName('RESPEMASA') is TFloatField then
    TFloatField(sdqPEMasaSal.FieldByName('RESPEMASA')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqExtILTAfterOpen(DataSet: TDataSet);
begin
  if sdqExtILT.FieldByName('IBD') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('IBD')).Currency := True;

  if sdqExtILT.FieldByName('IBD_VIEJO') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('IBD_VIEJO')).Currency := True;

  if sdqExtILT.FieldByName('IBDPROMEDIO') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('IBDPROMEDIO')).Currency := True;

  if sdqExtILT.FieldByName('RES_EXTILT') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('RES_EXTILT')).Currency := True;

  if sdqExtILT.FieldByName('RES_EXTILT_ART') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('RES_EXTILT_ART')).Currency := True;

  if sdqExtILT.FieldByName('RES_EXTILT_FFEP') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('RES_EXTILT_FFEP')).Currency := True;

  if sdqExtILT.FieldByName('RES_EXTILT_GBPA') is TFloatField then
    TFloatField(sdqExtILT.FieldByName('RES_EXTILT_GBPA')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqGInvalidezAfterOpen(DataSet: TDataSet);
begin
  if sdqGInvalidez.FieldByName('SPL') is TFloatField then
    TFloatField(sdqGInvalidez.FieldByName('SPL')).Currency := True;

  if sdqGInvalidez.FieldByName('RESERVABALANCE') is TFloatField then
    TFloatField(sdqGInvalidez.FieldByName('RESERVABALANCE')).Currency := True;

  if sdqGInvalidez.FieldByName('DIFERENCIA') is TFloatField then
    TFloatField(sdqGInvalidez.FieldByName('DIFERENCIA')).Currency := True;
end;

procedure TfrmReservasActuariales.sdqResumenAfterOpen(DataSet: TDataSet);
begin
  if sdqResumen.FieldByName('TOTAL') is TFloatField then
    TFloatField(sdqResumen.FieldByName('TOTAL')).Currency := True;
end;

end.


