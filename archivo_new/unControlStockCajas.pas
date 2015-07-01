unit unControlStockCajas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls, Mask, ToolEdit, DateComboBox, PatternEdit, CardinalEdit,
  unFraStaticCodigoDescripcion, Menus, RxToolEdit, RxPlacemnt;

type
  TfrmControlStockCajas = class(TfrmCustomConsulta)
    gbArchivo: TGroupBox;
    ShortCutControl1: TShortCutControl;
    rgEstadoCaja: TRadioGroup;
    gbFechaEstado: TGroupBox;
    Label1: TLabel;
    edFechaEnvioDesde: TDateComboBox;
    edFechaEnvioHasta: TDateComboBox;
    pnlColores: TPanel;
    Label2: TLabel;
    shpEnTermino: TShape;
    shpFueraTermino: TShape;
    label11: TLabel;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    pnlSeleccionados: TPanel;
    Label3: TLabel;
    edCantCajas: TCardinalEdit;
    edCantEnTermino: TCardinalEdit;
    Label4: TLabel;
    edCantFueraTermino: TCardinalEdit;
    fraTipoArchivo: TfraStaticCodigoDescripcion;
    pmnuImpresion: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirResumen: TMenuItem;
    rgSituacionCaja: TRadioGroup;
    gbEstadoAl: TGroupBox;
    edFechaEstadoAl: TDateComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure mnuImprimirResumenClick(Sender: TObject);
  private
    procedure CalcTotales;
    procedure DoLimpiarTotales;
    function GetSqlConsulta: String;
  public
  protected
    procedure RefreshData; override;
  end;

const
  CANTDIAS_FUERATERMINO = 10;     // si cambio esta constante, lo tengo que cambiar también en el tablero de control: art.archivo.do_generar_tablerocontrol_per, col. RCO_TABLEROCONTROL.CO_CANTCAJASENTERMINO y RCO_TABLEROCONTROL.CO_CANTCAJASFUERATERMINO
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('CANTDIAS');

var
  frmControlStockCajas: TfrmControlStockCajas;
  TotalConsulta: Array of Extended;
  
implementation

uses
  unConstantArchivo, unDmPrincipal, AnsiSql, CustomDlgs, DbFuncs, General,
  Strfuncs, DateTimeFuncs, unQrResumenControlStockCajas;

{$R *.dfm}

procedure TfrmControlStockCajas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  sSql := 'SELECT TA_ID ' + CD_ALIAS_ID + ', TA_CODIGO ' + CD_ALIAS_CODIGO + ', ' +
                 'TA_DESCRIPCION ' + CD_ALIAS_DESC + ', TA_FECHABAJA ' + CD_ALIAS_BAJA + ' ' +
            'FROM RTA_TIPOARCHIVO ' +
           'UNION ALL ' +
          'SELECT -1, ''LIQUI'', ''Liquidaciones'', NULL ' +
            'FROM DUAL';

  with fraTipoArchivo do
    begin
      Sql       := sSql;
      ShowBajas := True;
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);

  tbLimpiar.Click;
end;

procedure TfrmControlStockCajas.RefreshData;
begin
  sdqConsulta.Sql.Text := GetSqlConsulta() + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmControlStockCajas.tbLimpiarClick(Sender: TObject);
begin
  fraTipoArchivo.Clear;
  edFechaEnvioDesde.Date    := FirstLastDayOfMonth(AddMonths(DBDate(), -2));
  edFechaEnvioHasta.Date    := DBDate() - 1;
  edFechaEstadoAl.Date      := edFechaEnvioHasta.Date;
  rgEstadoCaja.ItemIndex    := 0;   // Pendientes
  rgSituacionCaja.ItemIndex := 2;   // Todas

  DoLimpiarTotales;

  inherited;
end;

procedure TfrmControlStockCajas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Highlight then
    AFont.Color := clWhite
  else if sdqConsulta.FieldByName('FUERATERMINO').AsString = 'S' then
    AFont.Color := shpFueraTermino.Brush.Color
  else
    AFont.Color := shpEnTermino.Brush.Color;
end;

procedure TfrmControlStockCajas.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;

      if tbSumatoria.Down and sdqConsulta.Active and not sdqConsulta.IsEmpty then
        begin
          edCantCajas.Value        := sdqConsulta.RecordCount;
          edCantFueraTermino.Value := CountRecords(sdqConsulta, ['FUERATERMINO'], ['S']);
          edCantEnTermino.Value    := edCantCajas.Value - edCantFueraTermino.Value;

          SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
        end
      else
        DoLimpiarTotales;
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmControlStockCajas.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmControlStockCajas.DoLimpiarTotales;
begin
  edCantCajas.Clear;
  edCantEnTermino.Clear;
  edCantFueraTermino.Clear;
end;

procedure TfrmControlStockCajas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmControlStockCajas.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmControlStockCajas.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
end;

function TfrmControlStockCajas.GetSqlConsulta: String;
var
  sFechaEstadoAl, sWhereInterno, sWhere, sSql: String;
begin
  Verificar(edFechaEnvioDesde.IsEmpty, edFechaEnvioDesde, 'Debe indicar la fecha de envío desde.');
  Verificar(edFechaEnvioHasta.IsEmpty, edFechaEnvioHasta, 'Debe indicar la fecha de envío hasta.');
  Verificar(edFechaEstadoAl.IsEmpty, edFechaEstadoAl, 'Debe indicar a qué fecha quiere saber el estado de las cajas.');
  Verificar(edFechaEnvioHasta.Date > edFechaEstadoAl.Date, edFechaEnvioHasta, 'La fecha de envío hasta no puede ser mayor que la fecha de estado.');

  sWhere         := '';
  sWhereInterno  := SqlBetweenDateTime(' AND RE_FECHAALTA ', edFechaEnvioDesde.Date, edFechaEnvioHasta.Date);
  sFechaEstadoAl := SqlValue(edFechaEstadoAl.Date);

  case rgEstadoCaja.ItemIndex of
    0, 1: sWhereInterno := sWhereInterno + ' AND LO_OPCIONDESTINO = ' + SqlValue(OPCION_DESTINO_DIGITALIZACION);
  end;

  sSql := 'SELECT * ' +
            'FROM (SELECT IDTIPOARCHIVO, TIPOARCHIVO, CAJA, FECHAENVIO, NROREMITO, FECHARECEPCION, NROMEDIO, NVL(FECHARECEPCION, ' + sFechaEstadoAl + ')-FECHAENVIO CANTDIAS, ' +
                         '(CASE WHEN NVL(FECHARECEPCION, ' + sFechaEstadoAl + ')-FECHAENVIO > ' + SqlValue(CANTDIAS_FUERATERMINO) + ' THEN ''S'' ELSE ''N'' END) FUERATERMINO ' +
                   'FROM (SELECT IDTIPOARCHIVO, TIPOARCHIVO, CAJA, FECHAENVIO, NROREMITO, NROMEDIO, (CASE WHEN FECHARECEPCION >= ' + sFechaEstadoAl + '+1 THEN NULL ELSE FECHARECEPCION END) FECHARECEPCION ' +  // recalculo FECHARECEPCION PARA QUE SEA REATROACTIVA A LA F. ESTADO AL, ES DECIR, SI CORRIERA ESTA CONSULTA A LA F. DE ESTADO AL, NO PUEDE HABER RECEPCIONES POSTERIORES, POR ESO EN ESTE CASO LE PONGO NULL...
                           'FROM (SELECT IDTIPOARCHIVO, TIPOARCHIVO, CAJA, FECHAENVIO, NROREMITO, ' +
                                        'TO_DATE(SUBSTR(FECHARECEPCION_NROMEDIO, 1, INSTR(FECHARECEPCION_NROMEDIO, ''-'')-1), ''YYYYMMDD'') FECHARECEPCION, ' +
                                        'TO_NUMBER(SUBSTR(FECHARECEPCION_NROMEDIO, INSTR(FECHARECEPCION_NROMEDIO, ''-'')+1)) NROMEDIO ' +
                                   'FROM (SELECT A.IDTIPOARCHIVO, A.TIPOARCHIVO, A.CAJA, A.FECHAENVIO, A.NROREMITO, ' +
                                                'MIN((SELECT TO_CHAR(TRUNC(RA_FECHAALTA), ''YYYYMMDD'') || ''-'' || TO_CHAR(RA_NROMEDIO) ' +   // Agrupo por A.IDTIPOARCHIVO, A.TIPOARCHIVO, A.CAJA, A.FECHAENVIO, A.NROREMITO y tomo, de todos los lotes que conforman la caja, el mínimo.
                                                       'FROM ARCHIVO.RRA_REPOSITORIOARCHIVO ' +                                                // Si todos los registros del SELECT sobre el que aplico el MIN son nulos, es que no se ha recibido aun ningún remito digitalizado.
                                                      'WHERE RA_FECHABAJA IS NULL ' +                                                          // Si al menos uno de estos registros no es nulo, entonces el MIN va a devolver ese valor no nulo. Lo que se asume es que si una caja contenía
                                                        'AND RA_NROMEDIO >= ' + SqlValue(MINROMEDIO) + ' ' +                                   // n lotes, si se recibe digitalizado al menos un lote de dicha caja, entonces se da por recibida toda la caja. Esto es porque la administradora
                                                        'AND RA_LOTE = A.LOTE ' +                                                              // en la caja-expo no informa las cajas de la ART, sino lotes. Y a través del nro. de lote entonces es como relaciono lo digitalizado (RA_LOTE)
                                                        'AND ROWNUM <= 1)) FECHARECEPCION_NROMEDIO ' +                                         // contra las cajas cargadas en el super-remito (a través del A.LOTE=LO_ID). Esta asunción fue consensuada con JNitti.
                                     'FROM (SELECT DISTINCT LO_ID LOTE, TO_NUMBER(SUBSTR(LO_CAJA, 1, INSTR(LO_CAJA, '' '')-1)) CAJA, ' +
                                                  'TRUNC(RE_FECHAALTA) FECHAENVIO, RE_ID NROREMITO, ' +
                                                  '(CASE WHEN LO_CAJA LIKE ' + SqlValue('%' + CAJALIQUIDACIONES + '%') + ' THEN -1 ELSE TA_ID END) IDTIPOARCHIVO, ' +
                                                  '(CASE WHEN LO_CAJA LIKE ' + SqlValue('%' + CAJALIQUIDACIONES + '%') + ' THEN ''Liquidaciones'' ELSE TA_DESCRIPCION END) TIPOARCHIVO ' +
                                             'FROM ARCHIVO.RTA_TIPOARCHIVO, ARCHIVO.RRE_REMITO, ARCHIVO.RLO_LOTE ' +
                                            'WHERE LO_IDREMITO > 0 ' +
                                              'AND LO_FECHABAJA IS NULL ' +
                                              'AND LO_IDREMITO = RE_ID ' +
                                              'AND RE_FECHABAJA IS NULL ' +
                                              'AND LO_TIPO = TA_ID ' +
                                              'AND LO_FECHAALTA_CAJA >= SYSDATE - 365 ' +     // para optimizar, tomo solo a partir de un año atrás
                                              sWhereInterno +
                                          ') A ' +
                                       'GROUP BY A.IDTIPOARCHIVO, A.TIPOARCHIVO, A.CAJA, A.FECHAENVIO, A.NROREMITO ' +
                                         ') ' +
                                ') ' +
                        ') ' +
                 ') ' +
           'WHERE 1 = 1';

  if fraTipoArchivo.IsSelected then
    sWhere := sWhere + ' AND IDTIPOARCHIVO = ' + SqlValue(fraTipoArchivo.Value);

  case rgEstadoCaja.ItemIndex of
    0: sWhere := sWhere + ' AND FECHARECEPCION IS NULL';
    1: sWhere := sWhere + ' AND FECHARECEPCION IS NOT NULL';
  end;

  case rgSituacionCaja.ItemIndex of
    0: sWhere := sWhere + ' AND FUERATERMINO = ''N''';
    1: sWhere := sWhere + ' AND FUERATERMINO = ''S''';
  end;

  Result := sSql + sWhere;
end;

procedure TfrmControlStockCajas.mnuImprimirResumenClick(Sender: TObject);
begin
  ImprimirResumen(GetSqlConsulta());
end;

end.

