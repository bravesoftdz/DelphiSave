unit unRecotizaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu,
  Placemnt, ComCtrls, ToolWin, ShortCutControl, StdCtrls, JvgGroupBox, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Buttons, unFraStaticCodigoDescripcion, unfraStaticActividad, CurrEdit,
  PatternEdit, IntEdit, PeriodoPicker, unFraCodigoDescripcion, unFraEntidades, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, DB, SDEngine, unFraColumnaRecotizacion;

type
  TfrmRecotizaciones = class(TfrmCustomForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbGuardar: TToolButton;
    tbSeparador1: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl: TShortCutControl;
    scroll: TScrollBox;
    gbDatosEmpresa: TJvgGroupBox;
    gbFiltros: TJvgGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    fraEmpresa: TfraEmpresa;
    btnObtenerDatos: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edCuit: TMaskEdit;
    edRazonSocial: TEdit;
    fraCiiu: TfraStaticActividad;
    edTrabajadores: TIntEdit;
    edMasaSalarial: TCurrencyEdit;
    edSalarioPromedio: TCurrencyEdit;
    edVigenciaContrato: TPeriodoPicker;
    Label12: TLabel;
    Label13: TLabel;
    edSumaFija: TCurrencyEdit;
    edVariable: TCurrencyEdit;
    fraEntidad: TfraEntidades;
    edDiasFranquicia: TIntEdit;
    Label14: TLabel;
    edComision: TCurrencyEdit;
    Label15: TLabel;
    edRealizacion: TDateComboBox;
    GroupBox1: TGroupBox;
    edCantidadColumnas: TIntEdit;
    Label16: TLabel;
    gbDatosCuenta: TJvgGroupBox;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    edNumeroRecotizacion: TIntEdit;
    dbgridDatosCuenta: TArtDBGrid;
    sdqDatosCuenta: TSDQuery;
    dsDatosCuenta: TDataSource;
    sdqDatosCuentaENDOSO: TFloatField;
    sdqDatosCuentaVIGENCIA: TDateTimeField;
    sdqDatosCuentaSUMAFIJA: TFloatField;
    sdqDatosCuentaVARIABLE: TFloatField;
    sdqDatosCuentaPRIMAANUALPERSONA: TFloatField;
    sdqDatosCuentaPRIMAANUALTOTAL: TFloatField;
    sdqDatosCuentaAUMENTO: TFloatField;
    sdqDatosCuentaID: TFloatField;
    sdqDatosCuentaTemp: TSDQuery;
    gbInformacionSiniestral: TJvgGroupBox;
    tbRecalcular: TToolButton;
    tbSeparador2: TToolButton;
    gbInformacionEconomica: TJvgGroupBox;
    gbIndicadores: TJvgGroupBox;
    sdspSetRecotizaDatos: TSDStoredProc;
    sdspGetRecotizaPeriodo: TSDStoredProc;
    procedure tbSalirClick(Sender: TObject);
    procedure scrollMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
    													 var Handled: Boolean);
    procedure btnObtenerDatosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqDatosCuentaCalcFields(DataSet: TDataSet);
    procedure sdqDatosCuentaAfterOpen(DataSet: TDataSet);
    procedure dbgridDatosCuentaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      																				State: TGridDrawState);
    procedure tbRecalcularClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CambiaFecha(Sender: TObject);
    procedure gbCollapsed(Sender: TObject);
  private
  	FPuedeModificarFechas: Boolean;

  	function Validar: Boolean;

  	procedure Clear;
    procedure ClearDatosCuenta;
    procedure ClearDatosEmpresa;
    procedure ClearFiltros;
    procedure CrearColumna(const aHideDates, aShowColumnTitle: Boolean; const aLeft, aTop: Integer; const aName: String;
    											 const aParent: TWinControl; const sColumnTitle: String = ''; const aFechaDesde: TDateTime = 0;
                           const aFechaHasta: TDateTime = 0);
    procedure GetDatosColumna(const aBloque: Integer;const aFechaDesde, aFechaHasta: TDate);
    procedure GetDatosCuenta;
  	procedure GetDatosEmpresa;
    procedure GetIndicadores;
    procedure GetInformacionEconomica;
    procedure GetInformacionSiniestral;
    procedure LiberarObjetos(const aParent: TComponent);
    procedure SetRecotizaDatos;
    procedure UpdateScrollSize;
  public
  end;

var
  frmRecotizaciones: TfrmRecotizaciones;

implementation

uses
	CustomDlgs, unDmPrincipal, unEspera, DateTimeFuncs, unPrincipal;

{$R *.dfm}

function TfrmRecotizaciones.Validar: Boolean;
begin
	Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'El campo Empresa es obligatorio.');
	Verificar((edFechaDesde.Date = 0), edFechaDesde, 'El campo Fecha Desde es obligatorio.');
  Verificar((edFechaHasta.Date = 0), edFechaHasta, 'El campo Fecha Hasta es obligatorio.');
  Verificar((edFechaDesde.Date > edFechaHasta.Date), edFechaDesde, 'La Fecha Desde no puede ser mayor a la Fecha Hasta.');
	Verificar((edCantidadColumnas.Value < 1), edCantidadColumnas, 'El campo Cantidad de Columnas es obligatorio.');

  Result := True;
end;


procedure TfrmRecotizaciones.CambiaFecha(Sender: TObject);
	function IsEconomica(Sender: TObject): Boolean;
  begin
  	Result := (Pos('ECONOMICA', UpperCase(TWinControl(Sender).Parent.Name)) > 0);
  end;

	function IsSiniestral(Sender: TObject): Boolean;
  begin
  	Result := (Pos('SINIESTRAL', UpperCase(TWinControl(Sender).Parent.Name)) > 0);
  end;

var
	aObj: TComponent;
  sColName: String;
begin
	if not FPuedeModificarFechas then
  	Exit;

	FPuedeModificarFechas := False;
  try
    if IsEconomica(Sender) then
    begin
      sColName := Copy(TWinControl(Sender).Parent.Name, 1, Pos('Economica', TWinControl(Sender).Parent.Name) - 1);
      aObj := frmRecotizaciones.gbInformacionSiniestral.FindComponent(sColName + 'Siniestral');
      aObj := aObj.FindComponent(TWinControl(Sender).Name);
      TDateComboBox(aObj).Text := TDateComboBox(Sender).Text;
    end;

    if IsSiniestral(Sender) then
    begin
      sColName := Copy(TWinControl(Sender).Parent.Name, 1, Pos('Siniestral', TWinControl(Sender).Parent.Name) - 1);
      aObj := frmRecotizaciones.gbInformacionEconomica.FindComponent(sColName + 'Economica');
      aObj := aObj.FindComponent(TWinControl(Sender).Name);
      TDateComboBox(aObj).Text := TDateComboBox(Sender).Text;
    end;
  finally
  	FPuedeModificarFechas := True;
  end;
end;

procedure TfrmRecotizaciones.Clear;
begin
	ClearFiltros;
  ClearDatosEmpresa;
  ClearDatosCuenta;
end;

procedure TfrmRecotizaciones.ClearDatosCuenta;
begin
	sdqDatosCuenta.Close;
end;

procedure TfrmRecotizaciones.ClearDatosEmpresa;
begin
	edCuit.Clear;
  edRazonSocial.Clear;
  fraCiiu.Clear;
  edTrabajadores.Clear;
  edMasaSalarial.Clear;
  edSalarioPromedio.Clear;
  edVigenciaContrato.Clear;
  edSumaFija.Clear;
  edVariable.Clear;
  fraEntidad.Clear;
  edComision.Clear;
  edDiasFranquicia.Clear;
  edRealizacion.Clear;
end;

procedure TfrmRecotizaciones.ClearFiltros;
begin
	fraEmpresa.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  edCantidadColumnas.Clear;
  edCantidadColumnas.Tag := 0;
  edNumeroRecotizacion.Clear;
end;

procedure TfrmRecotizaciones.CrearColumna(const aHideDates, aShowColumnTitle: Boolean; const aLeft, aTop: Integer;
																					const aName: String; const aParent: TWinControl;
                                          const sColumnTitle: String = ''; const aFechaDesde: TDateTime = 0;
                                          const aFechaHasta: TDateTime = 0);
begin
  with TfraColumnaRecotizacion.Create(aParent) do
  begin
  	Left := aLeft;
    Name := aName;
    Parent := aParent;
    Top := aTop;

    if aHideDates then
    	HideDates;

    if aShowColumnTitle then
    	ShowColumnTitle(sColumnTitle);

    edFechaDesde.Date := aFechaDesde;
    edFechaHasta.Date := aFechaHasta;

    edFechaDesde.OnChange := CambiaFecha;
    edFechaHasta.OnChange := CambiaFecha;
  end;
end;

procedure TfrmRecotizaciones.GetDatosColumna(const aBloque: Integer; const aFechaDesde, aFechaHasta: TDate);
begin
  with sdspGetRecotizaPeriodo do
  begin
    Close;

    ParamByName('o_recordset').Clear;
    ParamByName('fechadesde').AsDateTime := aFechaDesde;
    ParamByName('fechahasta').AsDateTime := aFechaHasta;
    ParamByName('usuario').AsString      := GetComputerAndUserName;
    ParamByName('seccion').AsInteger     := aBloque;

    Open;
  end;

//    'SELECT :p1 seccion, ''$ ,0.00;-$ ,0.00'' formato, ''Siniestros (sin recaidas ni rechazos)'' titulo, COUNT(*) valor' +
//	OpenQueryEx(aQuery, [aBloque, TDateTimeEx.Create(aFechaDesde), TDateTimeEx.Create(aFechaHasta)]);
end;

procedure TfrmRecotizaciones.GetDatosCuenta;
var
	sSql: String;
begin
	sSql :=
    'SELECT ROWNUM ID, en_endoso endoso, TRUNC(en_vigenciaendoso) vigencia, ht_sumafijatarifa sumafija,' +
    			' ht_porcmasatarifa VARIABLE, ht_sumafijatarifa' +
            ' +(ht_porcmasatarifa *(ROUND(CASE' +
                                          ' WHEN rc_empleados > 0 THEN rc_masasalarial / rc_empleados' +
                                          ' ELSE 0' +
                                        ' END, 2) / 100)) primaanualpersona,' +
            ' (ht_sumafijatarifa * 12 * rc_empleados) +((13 * rc_masasalarial) * ht_porcmasatarifa / 100) primaanualtotal' +
       ' FROM (SELECT   en_vigenciaendoso vigenciaendoso, MAX(en_id) ID' +
                 ' FROM aen_endoso' +
                ' WHERE en_contrato = :contrato' +
             ' GROUP BY en_vigenciaendoso), aen_endoso, aht_historicotarifario, zrc_resumencobranza' +
      ' WHERE ID = en_id' +
        ' AND en_idhistoricotarifa = ht_id' +
        ' AND rc_contrato(+) = en_contrato' +
        ' AND rc_periodo(+) = art.cobranza.obtener_ultperiododevengado(en_contrato)' +
   ' ORDER BY en_vigenciaendoso';

  OpenQueryEx(sdqDatosCuentaTemp, [fraEmpresa.Contrato], sSql);
  OpenQueryEx(sdqDatosCuenta, [fraEmpresa.Contrato], sSql);
end;

procedure TfrmRecotizaciones.GetDatosEmpresa;
var
	sSql: String;
begin
	sSql :=
    'SELECT aen.en_id, ahc.hc_contrato, ahm.hm_cuit, ahm.hm_nombre, estado.tb_descripcion AS estado, act.ac_codigo,' +
          ' act.ac_descripcion, CASE act.ac_cotizable' +
            ' WHEN ''S'' THEN ''Cotizable''' +
            ' ELSE ''No Cotizable''' +
          ' END AS cotizable, CASE act.ac_excluido' +
            ' WHEN ''S'' THEN ''''' +
            ' ELSE ''Requiere autorización para cotizar''' +
          ' END AS excluido, rc_empleados, rc_masasalarial,' +
          ' ROUND(CASE' +
                  ' WHEN rc_empleados > 0 THEN rc_masasalarial / rc_empleados' +
                  ' ELSE 0' +
                ' END, 2) AS promedio, ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, atc.ht_alicuotapesos AS sumafija,' +
          ' atc.ht_porcmasa AS porcvariable, xen.en_codbanco AS cod_entidad, xen.en_nombre AS entidad,' +
          ' xve.ve_vendedor AS cod_vendedor, xve.ve_nombre AS vendedor, ca_codigo AS cod_canal,' +
          ' ca_descripcion AS canal, ahc.hc_diasfranquicia AS franquicia, ecuenta.ec_nombre AS ejecutivo_cta,' +
          ' gestor.gc_nombre AS gestor_cta, vc_porccomision comision' +
     ' FROM aen_endoso aen, ahc_historicocontrato ahc, ahm_historicoempresa ahm, aht_historicotarifario atc,' +
     			' art.ctb_tablas estado, afi.aec_ejecutivocuenta ecuenta, afi.agc_gestorcuenta gestor, cac_actividad act,' +
          ' xev_entidadvendedor xev, avc_vendedorcontrato avc, xen_entidad xen, xve_vendedor xve, aca_canal aca,' +
          ' zrc_resumencobranza zrc' +
    ' WHERE aen.en_idhistoricocontrato = ahc.hc_id' +
      ' AND aen.en_idhistoricoempresa = ahm.hm_id' +
      ' AND aen.en_idhistoricotarifa = atc.ht_id' +
      ' AND estado.tb_codigo = ahc.hc_estado' +
      ' AND estado.tb_clave = ''AFEST''' +
      ' AND ecuenta.ec_id(+) = ahc.hc_idejecutivo' +
      ' AND gestor.gc_id(+) = ahc.hc_idgestor' +
      ' AND act.ac_id = ahc.hc_idactividad' +
      ' AND art.comision.get_ultidentidadvendcontrato(aen.en_contrato) = vc_id(+)' +
      ' AND avc.vc_identidadvend = xev.ev_id(+)' +
      ' AND xev.ev_identidad = xen.en_id(+)' +
      ' AND xev.ev_idvendedor = xve.ve_id(+)' +
      ' AND xen.en_idcanal = ca_id(+)' +
      ' AND avc.vc_contrato(+) = aen.en_contrato' +
      ' AND zrc.rc_contrato(+) = aen.en_contrato' +
      ' AND zrc.rc_periodo(+) = art.cobranza.obtener_ultperiododevengado(aen.en_contrato)' +
      ' AND aen.en_contrato = :p1';

  with GetQueryEx(sSql, [fraEmpresa.Contrato]) do
  try
  	edCuit.Text 						:= FieldByName('hm_cuit').AsString;
    edRazonSocial.Text 			:= FieldByName('hm_nombre').AsString;
    fraCiiu.Codigo 					:= FieldByName('ac_codigo').AsString;
    edTrabajadores.Value 		:= FieldByName('rc_empleados').AsInteger;
    edMasaSalarial.Value 		:= FieldByName('rc_masasalarial').AsFloat;
    edSalarioPromedio.Value := FieldByName('promedio').AsFloat;
    edVigenciaContrato.Periodo.SetPeriodoFromDate(FieldByName('hc_vigenciadesde').AsDateTime);
    edSumaFija.Value 				:= FieldByName('sumafija').AsFloat;
    edVariable.Value 				:= FieldByName('porcvariable').AsFloat;
    fraEntidad.Codigo 			:= FieldByName('cod_entidad').AsString;
    edComision.Value 				:= FieldByName('comision').AsFloat;
    edDiasFranquicia.Value 	:= FieldByName('franquicia').AsInteger;
    edRealizacion.Date 			:= DBDate;
  finally
  	Free;
  end;
end;

procedure TfrmRecotizaciones.GetIndicadores;
var
	iFechaDesde: Integer;
  iFechaHasta: Integer;
	iLoop: Integer;
  iRangoDias: Integer;
begin
	LiberarObjetos(gbIndicadores);

  // Creo la columna de los nombres de los campos..
	CrearColumna(True, False, 0, 16, 'fraColumnaTituloIndicadores', gbIndicadores);

  // Creo las columnas de los datos..
  iRangoDias := (Trunc(edFechaHasta.Date - edFechaDesde.Date)) div edCantidadColumnas.Value;
  iFechaDesde := Trunc(edFechaDesde.Date);
	for iLoop := 1 to edCantidadColumnas.Value do
  begin
  	iFechaHasta := iFechaDesde + iRangoDias;
    if iLoop = edCantidadColumnas.Value then
    	iFechaHasta := Trunc(edFechaHasta.Date);

  	CrearColumna(False, False, iLoop * 128, 16, Format('fraColumna%dIndicadores', [iLoop]), gbIndicadores, '',
    						 iFechaDesde, iFechaHasta);
    iFechaDesde := iFechaHasta + 1;
  end;

	// Creo la columna de los totales..
  CrearColumna(False, True, (edCantidadColumnas.Value + 1) * 128, 16, 'fraColumnaTotalesIndicadores', gbIndicadores,
  						'Total');

	// Creo la columna de los promedios ponderados..
  CrearColumna(False, True, (edCantidadColumnas.Value + 2) * 128, 16, 'fraColumnaPromediosIndicadores', gbIndicadores,
  						 'Promedio Ponderado');

  UpdateScrollSize;
end;

procedure TfrmRecotizaciones.GetInformacionEconomica;
var
	iFechaDesde: Integer;
  iFechaHasta: Integer;
	iLoop: Integer;
  iRangoDias: Integer;
begin
	LiberarObjetos(gbInformacionEconomica);

  // Creo la columna de los nombres de los campos..
	CrearColumna(True, False, 0, 16, 'fraColumnaTituloEconomica', gbInformacionEconomica);

  // Creo las columnas de los datos..
  iRangoDias := (Trunc(edFechaHasta.Date - edFechaDesde.Date)) div edCantidadColumnas.Value;
  iFechaDesde := Trunc(edFechaDesde.Date);
	for iLoop := 1 to edCantidadColumnas.Value do
  begin
  	iFechaHasta := iFechaDesde + iRangoDias;
    if iLoop = edCantidadColumnas.Value then
    	iFechaHasta := Trunc(edFechaHasta.Date);

  	CrearColumna(False, False, iLoop * 128, 16, Format('fraColumna%dEconomica', [iLoop]), gbInformacionEconomica, '',
    						 iFechaDesde, iFechaHasta);
    iFechaDesde := iFechaHasta + 1;
  end;

	// Creo la columna de los totales..
  CrearColumna(False, True, (edCantidadColumnas.Value + 1) * 128, 16, 'fraColumnaTotalesEconomica', gbInformacionEconomica, 'Total');

	// Creo la columna de los promedios ponderados..
  CrearColumna(False, True, (edCantidadColumnas.Value + 2) * 128, 16, 'fraColumnaPromediosEconomica', gbInformacionEconomica, 'Promedio Ponderado');

  UpdateScrollSize;
end;

procedure TfrmRecotizaciones.GetInformacionSiniestral;
var
	iFechaDesde: Integer;
  iFechaHasta: Integer;
	iLoop: Integer;
  iRangoDias: Integer;
begin
	LiberarObjetos(gbInformacionSiniestral);

  // Creo la columna de los nombres de los campos..
	CrearColumna(True, False, 0, 16, 'fraColumnaTituloSiniestral', gbInformacionSiniestral);

  // Creo las columnas de los datos..
  iRangoDias := (Trunc(edFechaHasta.Date - edFechaDesde.Date)) div edCantidadColumnas.Value;
  iFechaDesde := Trunc(edFechaDesde.Date);
	for iLoop := 1 to edCantidadColumnas.Value do
  begin
  	iFechaHasta := iFechaDesde + iRangoDias;
    if iLoop = edCantidadColumnas.Value then
    	iFechaHasta := Trunc(edFechaHasta.Date);

  	CrearColumna(False, False, iLoop * 128, 16, Format('fraColumna%dSiniestral', [iLoop]), gbInformacionSiniestral, '',
    						 iFechaDesde, iFechaHasta);
    iFechaDesde := iFechaHasta + 1;
  end;

	// Creo la columna de los totales..
  CrearColumna(False, True, (edCantidadColumnas.Value + 1) * 128, 16, 'fraColumnaTotalesSiniestral', gbInformacionSiniestral, 'Total');

	// Creo la columna de los promedios ponderados..
  CrearColumna(False, True, (edCantidadColumnas.Value + 2) * 128, 16, 'fraColumnaPromediosSiniestral', gbInformacionSiniestral, 'Promedio Ponderado');

  UpdateScrollSize;
end;

procedure TfrmRecotizaciones.LiberarObjetos(const aParent: TComponent);
var
	aObj: TComponent;
	iLoop: Integer;
begin
	iLoop := 0;
  while iLoop <= aParent.ComponentCount - 1 do
  begin
  	aObj := aParent.Components[iLoop];
    if aObj.ClassType = TfraColumnaRecotizacion then
    	aObj.Free
    else
    	Inc(iLoop);
  end;
end;

procedure TfrmRecotizaciones.SetRecotizaDatos;
begin
  with sdspSetRecotizaDatos do
  begin
    ParamByName('cuit').AsString         := fraEmpresa.CUIT;
    ParamByName('fechadesde').AsDateTime := edFechaDesde.Date;
    ParamByName('fechahasta').AsDateTime := edFechaHasta.Date;
    ParamByName('usuario').AsString      := GetComputerAndUserName;
    ExecProc;
  end;
end;

procedure TfrmRecotizaciones.UpdateScrollSize;
	function GetHeight: Integer;
  var
  	iLoop: Integer;
  begin
  	Result := 0;

  	for iLoop := 0 to ComponentCount - 1 do
    	if Components[iLoop].ClassType = TJvgGroupBox then
    		Result := Result + TJvgGroupBox(Components[iLoop]).Height;
  end;

var
	aObj: TfraColumnaRecotizacion;
  aObj2: TfraColumnaRecotizacion;
  aObj3: TfraColumnaRecotizacion;
begin
	aObj := TfraColumnaRecotizacion(gbInformacionSiniestral.FindComponent('fraColumnaPromediosSiniestral'));
  aObj2 := TfraColumnaRecotizacion(gbInformacionEconomica.FindComponent('fraColumnaPromediosEconomica'));
  aObj3 := TfraColumnaRecotizacion(gbIndicadores.FindComponent('fraColumnaPromediosIndicadores'));

  if aObj = nil then
  	scroll.Width := Width - 8
  else
  begin
	  if (aObj.Left + aObj.Width) > Width then
  		scroll.Width := aObj.Left + aObj.Width
    else
  		scroll.Width := Width - 8;

    if aObj2 <> nil then
		  if (aObj2.Left + aObj2.Width) > scroll.Width then
  	  	scroll.Width := aObj2.Left + aObj2.Width;

    if aObj3 <> nil then
		  if (aObj3.Left + aObj3.Width) > scroll.Width then
  	  	scroll.Width := aObj3.Left + aObj3.Width;
  end;

  scroll.Height := GetHeight;

  if scroll.Width < Width then
  	scroll.Width := Width - 8;

  if scroll.Height < Height then
  	scroll.Height := Height - 56;
end;


procedure TfrmRecotizaciones.tbSalirClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRecotizaciones.scrollMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  																						var Handled: Boolean);
var
	code: Cardinal;
  i: Integer;
  msg: Cardinal;
  n: Integer;
begin
  Handled := True;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n := Mouse.WheelScrollLines;
  for i:= 1 to n do
    Perform(msg, code, 0);
  Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmRecotizaciones.btnObtenerDatosClick(Sender: TObject);
begin
	if not Validar then
  	Exit;

  try
	  IniciarEspera('Buscando información. Aguarde por favor...');

    edCantidadColumnas.Tag := edCantidadColumnas.Value;

    SetRecotizaDatos;
	  GetDatosEmpresa;
    GetDatosCuenta;
    GetInformacionSiniestral;
    GetInformacionEconomica;
    GetIndicadores;
  finally
  	DetenerEspera;
  end;
end;

procedure TfrmRecotizaciones.FormCreate(Sender: TObject);
begin
  inherited;

  FPuedeModificarFechas := True;

  fraEmpresa.ShowBajas := True;
  gbFiltros.Collapsed := False;
  scroll.VertScrollBar.Position := 0;

  Clear;
end;

procedure TfrmRecotizaciones.sdqDatosCuentaCalcFields(DataSet: TDataSet);
begin
	with DataSet do
  	if FieldByName('Aumento').IsNull then
    	if sdqDatosCuentaTemp.FieldByName('primaanualtotal').AsFloat > 0 then
		  begin
  	    sdqDatosCuentaTemp.First;
    	  sdqDatosCuentaTemp.MoveBy(FieldByName('ID').AsInteger - 2);
      	FieldByName('Aumento').AsFloat := (FieldByName('primaanualtotal').AsFloat * 100 / sdqDatosCuentaTemp.FieldByName('primaanualtotal').AsFloat) - 100;
	    end;
end;

procedure TfrmRecotizaciones.sdqDatosCuentaAfterOpen(DataSet: TDataSet);
begin
	with DataSet do
  begin
		TFloatField(DataSet.FieldByName('sumafija')).DisplayFormat 					:= '$ ,0.00;-$ ,0.00';
		TFloatField(DataSet.FieldByName('variable')).DisplayFormat 					:= ',0.0000%;-,0.0000%';
    TFloatField(DataSet.FieldByName('primaanualpersona')).DisplayFormat := '$ ,0.00;-$ ,0.00';
    TFloatField(DataSet.FieldByName('primaanualtotal')).DisplayFormat 	:= '$ ,0.00;-$ ,0.00';
	  TFloatField(DataSet.FieldByName('aumento')).DisplayFormat   				:= ',0%;-,0%';
	end;
end;

procedure TfrmRecotizaciones.dbgridDatosCuentaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
																														 Column: TColumn; State: TGridDrawState);
begin
	if LowerCase(Column.FieldName) = 'aumento' then
  	if Column.Field.AsInteger = 0 then
    begin
      dbgridDatosCuenta.Canvas.FillRect(Rect);
			dbgridDatosCuenta.Canvas.TextOut(Rect.Right - 16, Rect.Top + 2, ' - ');
    end;
end;

procedure TfrmRecotizaciones.tbRecalcularClick(Sender: TObject);
	function GetFirstColWidth(aGroupBoxs: Array of TJvgGroupBox; const aNombres: Array of String): Integer;
  var
  	aColumna: TfraColumnaRecotizacion;
  	iLoop: Integer;
  begin
  	Result := 0;

  	for iLoop := Low(aGroupBoxs) to High(aGroupBoxs) do
    begin
    	aColumna := TfraColumnaRecotizacion(aGroupBoxs[iLoop].FindComponent(Format('fraColumnaTitulo%s', [aNombres[iLoop]])));
      if aColumna.Width > Result then
      	Result := aColumna.Width;
    end;
  end;

	function Validar(aGroupBox: TJvgGroupBox; const aNombre: String): Boolean;
  var
  	aColumna: TfraColumnaRecotizacion;
    iLoop: Integer;
  begin
    for iLoop := 1 to edCantidadColumnas.Tag do
    begin
      aColumna := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumna%d%s', [iLoop, aNombre])));
      Verificar((aColumna.edFechaDesde.Date = 0), aColumna.edFechaDesde, 'El campo Fecha Desde es obligatorio.');
      Verificar((aColumna.edFechaHasta.Date = 0), aColumna.edFechaHasta, 'El campo Fecha Hasta es obligatorio.');
      Verificar((aColumna.edFechaDesde.Date > aColumna.edFechaHasta.Date), aColumna.edFechaDesde, 'La Fecha Desde no puede ser mayor a la Fecha Hasta.');
    end;

    Result := True;
	end;


	procedure FillData(aGroupBox: TJvgGroupBox; const aNombre: String; const aBloque, aNumeroColumna: Integer);
  var
  	aColumna: TfraColumnaRecotizacion;
  begin
  	if aNumeroColumna = 1 then
  		TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaTitulo%s', [aNombre]))).FreeObjects;

  	aColumna := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumna%d%s', [aNumeroColumna, aNombre])));
    aColumna.FreeObjects;

		GetDatosColumna(aBloque, aColumna.edFechaDesde.Date, aColumna.edFechaHasta.Date);

    with sdspGetRecotizaPeriodo do
	    while not Eof do
  	  begin
				aColumna.AddField(FieldByName('formato').AsString, FieldByName('valor').AsFloat);

		    if aNumeroColumna = 1 then
  		  	TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaTitulo%s', [aNombre]))).AddTitle(FieldByName('titulo').AsString);

        Next;
      end;
	end;

	procedure FillColumnasEspeciales(aGroupBox: TJvgGroupBox; const aBloque: Integer; const aNombre: String);
  var
  	aColumna: TfraColumnaRecotizacion;
    aColumnaPromedio: TfraColumnaRecotizacion;
  begin
  	aColumna := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaTotales%s', [aNombre])));
    aColumna.FreeObjects;

    aColumnaPromedio := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaPromedios%s', [aNombre])));
    aColumnaPromedio.FreeObjects;

		GetDatosColumna(aBloque, edFechaDesde.Date, edFechaHasta.Date);

    with sdspGetRecotizaPeriodo do
	    while not Eof do
  	  begin
				aColumna.AddField(FieldByName('formato').AsString, FieldByName('valor').AsFloat);
        aColumnaPromedio.AddField(FieldByName('formato').AsString, (FieldByName('valor').AsFloat / edCantidadColumnas.Tag));
        
        Next;
      end;
	end;

  procedure SetColumnsPosition(aGroupBox: TJvgGroupBox; const aNombre: String; const aFirstColWidth: Integer);
  var
  	aColumna: TfraColumnaRecotizacion;
  	iLeft: Integer;
    iLoop: Integer;
  begin
  	aColumna := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaTitulo%s', [aNombre])));
    iLeft := aColumna.Left + aFirstColWidth;
    for iLoop := 1 to edCantidadColumnas.Tag do
    begin
    	aColumna := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumna%d%s', [iLoop, aNombre])));
      aColumna.Left := iLeft;
      iLeft := iLeft + aColumna.Width;
    end;

    aColumna := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaTotales%s', [aNombre])));
    aColumna.Left := iLeft;
    TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaPromedios%s', [aNombre]))).Left := aColumna.Left + aColumna.Width;

    aGroupBox.Collapsed := False;
    aGroupBox.Height := TfraColumnaRecotizacion(aGroupBox.FindComponent(Format('fraColumnaTitulo%s', [aNombre]))).Height + 24;
	end;

var
	iFirstColWidth: Integer;
	iLoop: Integer;
begin
	Verificar((gbInformacionSiniestral.FindComponent('fraColumnaTituloSiniestral') = nil), btnObtenerDatos, 'Antes de recalcular debe obtener los datos.');
	if (not Validar(gbInformacionSiniestral, 'Siniestral')) or (not Validar(gbInformacionEconomica, 'Economica')) then
  	Exit;

  try
    IniciarEspera('Generando columnas. Aguarde por favor...');

    for iLoop := 1 to edCantidadColumnas.Tag do
    begin
    	FillData(gbInformacionSiniestral, 'Siniestral', 4, iLoop);
      FillData(gbInformacionEconomica, 'Economica', 5, iLoop);
//      FillData(gbIndicadores, 'Indicadores', 6, iLoop);
    end;

    FillColumnasEspeciales(gbInformacionSiniestral, 4, 'Siniestral');
    FillColumnasEspeciales(gbInformacionEconomica, 5, 'Economica');
//    FillColumnasEspeciales(gbIndicadores, 6, 'Indicadores');

    iFirstColWidth := GetFirstColWidth([gbInformacionSiniestral, gbInformacionEconomica, gbIndicadores],
    																 	 ['Siniestral', 'Economica', 'Indicadores']);

    SetColumnsPosition(gbInformacionSiniestral, 'Siniestral', iFirstColWidth);
    SetColumnsPosition(gbInformacionEconomica, 'Economica', iFirstColWidth);
    SetColumnsPosition(gbIndicadores, 'Indicadores', iFirstColWidth);
    UpdateScrollSize;
  finally
    DetenerEspera;
  end;
end;

procedure TfrmRecotizaciones.FormResize(Sender: TObject);
begin
  inherited;

  UpdateScrollSize;
end;

procedure TfrmRecotizaciones.gbCollapsed(Sender: TObject);
begin
  inherited;

  UpdateScrollSize;
end;

end.
