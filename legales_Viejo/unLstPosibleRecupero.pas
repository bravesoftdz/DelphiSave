unit unLstPosibleRecupero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, IntEdit, FieldHider, 
  CheckCombo, PatternEdit, ComboEditor;

type
  TfrmLstPosibleRecupero = class(TfrmCustomConsulta)
    gbFechaAccidente: TGroupBox;
    edFechaAccDesde: TDateComboBox;
    edFechaAccHasta: TDateComboBox;
    lbFechaDesde: TLabel;
    lbFechaHasta: TLabel;
    gbListados: TGroupBox;
    rbGeneral: TRadioButton;
    rbRechazo: TRadioButton;
    rbTrabajador: TRadioButton;
    gbConsolidado: TGroupBox;
    chkConsolidado: TCheckCombo;
    pnlCantRegistros: TPanel;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
    													var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FTotales: Array[0..6] of Extended;
  public
  end;

var
  frmLstPosibleRecupero: TfrmLstPosibleRecupero;

implementation

uses
  AnsiSql, CustomDlgs, unPrincipal, General, Printers, unDmPrincipal, DBFuncs;

{const
  FColTotales: array[0..4] of string = ('ILP', 'ILT', 'MORTALES', 'OTROS', 'PREST_MEDICAS');}

{$R *.DFM}

procedure TfrmLstPosibleRecupero.tbRefrescarClick(Sender: TObject);
var
  bTodoOK: Boolean;
  nCount: Integer;
	sSql: String;
  sWhereConsolidado: String;
begin
	bTodoOK := True;
  if edFechaAccDesde.IsEmpty then
  begin
  	bTodoOK := False;
    InvalidMsg(edFechaAccDesde, 'La fecha de Accidente desde no puede quedar en blanco.');
  end
  else if edFechaAccHasta.IsEmpty then
  begin
  	bTodoOK := False;
    InvalidMsg(edFechaAccHasta, 'La fecha de Accidente hasta no puede quedar en blanco.');
  end;

  sWhereConsolidado := '';
  if chkConsolidado.Text <> '' then
  begin
  	nCount := 0;
    while (nCount <= 1) do
    begin
    	if chkConsolidado.Checked[nCount] then
      	if nCount = 0 then
        begin
        	sWhereConsolidado := sWhereConsolidado + ' AND EX_ALTAMEDICA IS NOT NULL ';
        end
        else if nCount = 1 then
        begin
        	sWhereConsolidado := sWhereConsolidado + ' AND ev_codigo >= ''500'' ';
        end;
      nCount := nCount + 1;
    end;
  end;

  if bTodoOK then
  begin
  	if rbGeneral.Checked then
    	sSql :=
      	'SELECT ex_siniestro Siniestro, ex_orden Orden, ex_fechaaccidente Accidente, ex_cuit Cuit, mp_nombre Empresa,' +
        			' ex_cuil CUIL, tj_nombre TRABAJADOR, ex_tipo TIPO_ACC, ex_accidentetransito ACC_DESTINATARIO,' +
              ' ex_posiblerecupero POSIBLE_RECUPERO, ex_causafin CAUSA_FIN, tb_descripcion EVENTO,' +
              ' ev_porcincapacidad INCAPACIDAD, ev_Fecha FECHA, ev_caracter CARACTER, ev_grado GRADO,' +
              ' art.liq.Get_ImporteLiquidadoILT(ex_siniestro, ex_orden, null) ilt,' +
              ' art.liq.Get_ImporteLiquidadoILP(ex_siniestro, ex_orden, ex_recaida) ilp,' +
              ' art.liq.Get_ImporteLiquidadoMortales(ex_siniestro, ex_orden, ex_recaida) mortales,' +
              ' art.liq.Get_ImporteConceptos(ex_siniestro, ex_orden, null) otros,' +
              ' art.amebpba.Get_ImportePrestMedicas(ex_Siniestro, ex_Orden, null) PREST_MEDICAS,' +
              ' (art.liq.Get_ImporteLiquidadoILT(ex_siniestro, ex_orden, null) +' +
               ' art.liq.Get_ImporteLiquidadoILP(ex_siniestro, ex_orden, ex_recaida) +' +
               ' art.liq.Get_ImporteLiquidadoMortales(ex_siniestro, ex_orden, ex_recaida) +' +
               ' art.liq.Get_ImporteConceptos(ex_siniestro, ex_orden, null) +' +
               ' art.amebpba.Get_ImportePrestMedicas(ex_Siniestro, ex_Orden, null) +' +
               ' AMEBPBA.Get_CostosSin(ex_Siniestro, ex_Orden, ex_Recaida, 12)) TOTAL, ca_descripcion PRESTADOR,' +
              ' '''' TIPO, 0 PORCENTAJE, EX_ALTAMEDICA,' +
              ' AMEBPBA.Get_CostosSin(ex_Siniestro, ex_Orden, ex_Recaida, 12) ILT_ESTIMADA' +
         ' FROM sex_expedientes, cmp_empresas, ctb_tablas, ctj_trabajadores, sev_eventosdetramite, cpr_prestador' +
        ' WHERE nvl (Ex_causafin, ''0'') NOT IN (''99'', ''95'', ''02'')' +
          ' AND (ex_tipo = ''2''or ex_accidentetransito = ''S'' or ex_posiblerecupero = ''S'')' +
          ' AND ex_cuit = mp_cuit' +
          ' AND ex_cuil = tj_cuil' +
          ' AND ex_fechaaccidente between ' + SqlDate(edFechaAccDesde.Date) + ' and ' + SqlDate(edFechaAccHasta.Date) +
          ' AND ex_siniestro = ev_siniestro (+)' +
          ' AND ex_orden = ev_orden (+)' +
          ' AND ex_recaida = ev_REcaida (+)' +
          ' AND tb_codigo(+) = ev_codigo' +
          ' AND tb_clave(+) = ''EVTRA''' +
          ' AND ex_Recaida = 0' +
          ' AND art.sin.Get_MaxEventoIncapac(Ex_siniestro, ex_orden, ex_Recaida) = ev_evento (+)' +
          ' AND ex_prestador = ca_identificador ' + sWhereConsolidado
		else if rbRechazo.Checked then
    	sSql :=
      	'SELECT ex_siniestro SINIESTRO, ex_orden ORDEN, ex_fechaaccidente ACCIDENTE, ex_cuit CUIT, mp_nombre EMPRESA,' +
        			' ex_cuil CUIL, tj_nombre TRABAJADOR, ex_tipo TIPO_ACC, ex_accidentetransito ACC_DESTINATARIO,' +
              ' ex_posiblerecupero POSIBLE_RECUPERO, ex_causafin CAUSA_FIN, tb_descripcion EVENTO, ev_Fecha FECHA,' +
              ' ev_caracter CARACTER, ev_grado GRADO,' +
              ' art.liq.Get_ImporteLiquidadoILT(ex_siniestro, ex_orden, null) ilt,' +
              ' art.liq.Get_ImporteLiquidadoILP(ex_siniestro, ex_orden, ex_recaida) ilp,' +
              ' art.liq.Get_ImporteLiquidadoMortales(ex_siniestro, ex_orden, ex_recaida) mortales,' +
              ' art.liq.Get_ImporteConceptos(ex_siniestro, ex_orden, null) otros,' +
              ' art.AMEBPBA.Get_ImportePrestMedicas(EX_SINIESTRO, EX_ORDEN, null) PREST_MEDICAS,' +
              ' (art.liq.Get_ImporteLiquidadoILT(ex_siniestro, ex_orden, null) +' +
               ' art.liq.Get_ImporteLiquidadoILP(ex_siniestro, ex_orden, ex_recaida) +' +
               ' art.liq.Get_ImporteLiquidadoMortales(ex_siniestro, ex_orden, ex_recaida) +' +
               ' art.liq.Get_ImporteConceptos(ex_siniestro, ex_orden, null) +' +
               ' art.AMEBPBA.Get_ImportePrestMedicas(EX_SINIESTRO, EX_ORDEN, null) +' +
               ' AMEBPBA.Get_CostosSin(ex_Siniestro, ex_Orden, ex_Recaida, 12)) TOTAL, ca_descripcion PRESTADOR,' +
              ' '''' TIPO, ev_porcincapacidad PORCENTAJE, EX_ALTAMEDICA,' +
              ' AMEBPBA.Get_CostosSin(ex_Siniestro, ex_Orden, ex_Recaida, 12) ILT_ESTIMADA' +
         ' FROM sex_expedientes, cmp_empresas, ctb_tablas, ctj_trabajadores, sev_eventosdetramite, cpr_prestador' +
        ' WHERE nvl(Ex_causafin, ''0'') = ''02''' +
          ' AND ex_cuit = mp_cuit' +
          ' AND ex_cuil = tj_cuil' +
          ' AND ex_fechaaccidente between ' + SqlDate(edFechaAccDesde.Date) + ' and ' + SqlDate(edFechaAccHasta.Date) +
          ' AND ex_siniestro = ev_siniestro (+)' +
          ' AND ex_orden = ev_orden (+)' +
          ' AND ex_recaida = ev_REcaida (+)' +
          ' AND tb_codigo(+) = ev_codigo' +
          ' AND tb_clave(+) = ''EVTRA''' +
          ' AND ex_Recaida = 0' +
          ' AND art.sin.Get_MaxEventoIncapac(Ex_siniestro, ex_orden, ex_Recaida) = ev_evento (+)' +
          ' AND ex_prestador = ca_identificador ' + sWhereConsolidado
		else if rbTrabajador.Checked then
			sSql :=
      	'SELECT SINIESTRO, ORDEN, ACCIDENTE, CUIT, EMPRESA, CUIL, TRABAJADOR, TIPOACCID TIPO_ACC,' +
        			' ACCIDENTETRANSITO ACC_DESTINATARIO, POSIBLERECUPERO POSIBLE_RECUPERO, CAUSAFIN CAUSA_FIN, EVENTO,' +
              ' PORCENTAJE, FECHA, CARACTER, GRADO, ILT, ILP, MORTALES, OTROS, PRESTMEDICAS PREST_MEDICAS,' +
              ' NULL EX_ALTAMEDICA, (ILT + ILP + MORTALES + OTROS + PRESTMEDICAS) TOTAL, PRESTADOR, TIPO,' +
              ' 0 ILT_ESTIMADA' +
         ' FROM art.srt_recuperotrabajador' +
        ' WHERE accidente between ' + SqlDate(edFechaAccDesde.Date) + ' and ' + SqlDate(edFechaAccHasta.Date);

		sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

    inherited;

    frmPrincipal.sbEstado.SimpleText := '';
    if sdqConsulta.Eof then
    begin
    	pnlCantRegistros.Caption := '';
      MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Filtros de busqueda');
      Grid.FooterBand := False;
    end
    else
    	frmPrincipal.sbEstado.Font.Style := [fsBold];

    pnlCantRegistros.Caption := ' Total de filas seleccionadas: ' + IntToStr(sdqConsulta.RecordCount);
    SumFields(sdqConsulta, ['ILP', 'ILT', 'MORTALES', 'OTROS', 'PREST_MEDICAS', 'TOTAL', 'ILT_ESTIMADA'], FTotales);
    Grid.FooterBand := True;
  end;
end;

procedure TfrmLstPosibleRecupero.FormCreate(Sender: TObject);
begin
  inherited;
  
  rbGeneral.Checked := True;
  IMG_FILTROS_SHOW := 11;
  IMG_FILTROS_HIDE := 10;
  Grid.Anchors := [akLeft, akTop, akRight, akBottom];
end;

procedure TfrmLstPosibleRecupero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuPosibleRecupero.Enabled := True;
  inherited;
end;

procedure TfrmLstPosibleRecupero.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edFechaAccDesde.Clear;
  edFechaAccHasta.Clear;
  chkConsolidado.Clear;

  pnlCantRegistros.Caption := '';
end;

procedure TfrmLstPosibleRecupero.tbImprimirClick(Sender: TObject);
var
  sTitulo: String;
begin
  if rbGeneral.Checked then
    sTitulo := 'General'
  else if rbRechazo.Checked then
    sTitulo := 'Rechazo'
  else if rbTrabajador.Checked then
    sTitulo := 'Trabajador';

  QueryPrint.Title.Text := 'Listado de Posibles Recuperos - ' + sTitulo;
  
  inherited;
end;

procedure TfrmLstPosibleRecupero.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
																								 FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iCol: Integer;
begin
  iCol := ArrayPos(Column, ['ILP', 'ILT', 'MORTALES', 'OTROS', 'PREST_MEDICAS', 'TOTAL', 'ILT_ESTIMADA' ]);
  if iCol > -1 Then
  	Value := Format('$ %0.2f', [FTotales[iCol]]);
end;

procedure TfrmLstPosibleRecupero.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('ILT_ESTIMADA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ILT_ESTIMADA')).Currency := True;

  if sdqConsulta.FieldByName('ILT') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ILT')).Currency := True;

  if sdqConsulta.FieldByName('ILP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('ILP')).Currency := True;

  if sdqConsulta.FieldByName('MORTALES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MORTALES')).Currency := True;

  if sdqConsulta.FieldByName('OTROS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('OTROS')).Currency := True;

  if sdqConsulta.FieldByName('PREST_MEDICAS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PREST_MEDICAS')).Currency := True;

  if sdqConsulta.FieldByName('TOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTAL')).Currency := True;

  if sdqConsulta.FieldByName('PORCENTAJE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCENTAJE')).DisplayFormat := '0.000 %';  // para formatear el porcentaje
end;

end.
