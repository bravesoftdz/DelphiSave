unit qEstadoCta;

interface

uses
	{$IFDEF VER140}RTLConsts, {$ENDIF} {$IFDEF VER150}RTLConsts, {$ENDIF}
  SysUtils, Classes, Controls, Forms, Qrctrls, QuickRpt, ExtCtrls, Db, SDEngine, Graphics, unArt, Cuit;

type
  TTipoEmision = (teDetalleSaldoComp, teDetalleSaldo, teSaldo);
  TTipoResumen = (trTotalPeriodos, trPeriodosNoSaldados);

  TqrEstadoCuenta = class(TForm)
    QuickRep1: TQuickRep;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    cDebe: TQRDBText;
    cHaber: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    qPeriodo: TQRDBText;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lFija: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrdMP_CONTRATO: TQRDBText;
    qrdbCUIT: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    qrdbMP_VIGENCIADESDE: TQRDBText;
    qrdbMP_VIGENCIAHASTA: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrdbMP_FECHACONCURSO: TQRDBText;
    qrdbPER_CON: TQRDBText;
    qrdbMP_FECHAQUIEBRA: TQRDBText;
    qrdbPER_QUI: TQRDBText;
    qAux: TSDQuery;
    dsAux: TDataSource;
    qriLogo: TQRImage;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    qrlEntidades: TQRLabel;
    qrlVendedores: TQRLabel;
    QRDBText18: TQRDBText;
    qrlClasDevengado: TQRLabel;
    QRShape12: TQRShape;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRLabel19: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape14: TQRShape;
    QRExpr3: TQRExpr;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    qrdbMP_SUMAFIJA: TQRDBText;
    qrdbMP_PORCMASA: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRExpr4: TQRExpr;
    qrlPeriodo: TQRLabel;
    lEmpleados: TQRLabel;
    lMasa: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape18: TQRShape;
    qrdbMP_FBAJA: TQRDBText;
    qrlMotivoBaja: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel29: TQRLabel;
    QRShape20: TQRShape;
    qrlEstado: TQRLabel;
    QRShape15: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRBand5: TQRBand;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    qrlDeudaConsolidada: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    qrlRenglon1: TQRLabel;
    qrlRenglon2: TQRLabel;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    qrlPeriodoEnRefinanciacion: TQRLabel;
    qrlReafiliacion: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel15: TQRLabel;
    qrlGestorNombre: TQRLabel;
    procedure FijaPrint(Sender: TObject; var Value: String);
    procedure VariablePrint(Sender: TObject; var Value: String);
    procedure cDebePrint(Sender: TObject; var Value: String);
    procedure qrlEntidadesPrint(Sender: TObject; var Value: String);
    procedure qrlVendedoresPrint(Sender: TObject; var Value: String);
    procedure qrlClasDevengadoPrint(Sender: TObject; var Value: String);
    procedure QRLabel19Print(Sender: TObject; var Value: String);
    procedure qrdbCUITPrint(Sender: TObject; var Value: String);
    procedure cHaberPrint(Sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText18Print(Sender: TObject; var Value: String);
    procedure QRExpr4Print(Sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(Sender: TObject; var Value: String);
    procedure lEmpleadosPrint(Sender: TObject; var Value: String);
    procedure lMasaPrint(Sender: TObject; var Value: String);
    procedure qrlMotivoBajaPrint(Sender: TObject; var Value: String);
    procedure qrlEstadoPrint(Sender: TObject; var Value: String);
    procedure QRLabel32Print(Sender: TObject; var Value: String);
    procedure QRExpr3Print(Sender: TObject; var Value: String);
    procedure QRLabel33Print(Sender: TObject; var Value: String);
    procedure QRLabel34Print(Sender: TObject; var Value: String);
    procedure QRLabel35Print(Sender: TObject; var Value: String);
    procedure QRLabel36Print(Sender: TObject; var Value: String);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRLabel27Print(Sender: TObject; var Value: String);
    procedure qrdMP_CONTRATOPrint(Sender: TObject; var Value: String);
    procedure QRLabel38Print(Sender: TObject; var Value: String);
    procedure qrlDeudaConsolidadaPrint(Sender: TObject; var Value: String);
    procedure QRLabel30Print(Sender: TObject; var Value: String);
    procedure qrlPeriodoEnRefinanciacionPrint(Sender: TObject; var Value: String);
    procedure qrlReafiliacionPrint(Sender: TObject; var Value: String);
    procedure qrlGestorNombrePrint(Sender: TObject; var Value: String);
  private
    FContrato: Integer;
    FDeudaExtraJudicial: Boolean;    
    FPeriodoDesde: String;
    FPeriodoHasta: String;
    FTipoEmision: TTipoEmision;
    FTipoResumen: TTipoResumen;
    FVencimiento: TDateTime;
  public
    DeudaNominal: Double;
    lClasific: Boolean;
    lSaldo: Boolean;
    Mora: Double;
    sContCuit: Boolean;
    sCuit: String;
    sInterDate: TDateTime;
    sIntereses: Boolean;
    sInterno: Boolean;
    TotMora: Double;
    TotNominal: Double;

    constructor Create(AOwner: TComponent); override;

    function Execute: Boolean;
    function Preview: Boolean;
    function Print: Boolean;
    function PrinterSetup: Boolean;
  published
    property ClasficaDevengado : Boolean      read lClasific           write lClasific           default True;
    property Contrato          : Integer      read FContrato           write FContrato;
    property Cuit              : TCuit        read sCuit               write sCuit;
    property DeudaExtraJudicial: Boolean      read FDeudaExtraJudicial write FDeudaExtraJudicial default False;
    property PeriodoDesde      : String       read FPeriodoDesde       write FPeriodoDesde;
    property PeriodoHasta      : String       read FPeriodoHasta       write FPeriodoHasta;
    property TipoEmision       : TTipoEmision read FTipoEmision        write FTipoEmision        default teDetalleSaldo;
    property TipoResumen       : TTipoResumen read FTipoResumen        write FTipoResumen        default trTotalPeriodos;
    property Vencimiento       : TDateTime    read FVencimiento        write FVencimiento;
  end;

var
  qrEstadoCuenta: TqrEstadoCuenta;

implementation

{$R *.DFM}

uses
	unDmPrincipal, {$IFDEF CAS}unMenu, UnDMBusqueda{$ELSE}unPrincipal{$ENDIF}, strFuncs, Numeros, AnsiSql, Consts;

procedure TqrEstadoCuenta.FijaPrint(Sender: TObject; var Value: String);
var
  cTexto: String;
  rc: Integer;
begin
  rc := Pos('+', qAux.FieldByName('TARIFA').AsString);
  cTexto := Trim(Copy(qAux.FieldByName('TARIFA').AsString, 1, rc - 1));
  rc := Pos('*', cTexto);
  Value := Trim(Copy(cTexto, rc + 2, 255));
end;

procedure TqrEstadoCuenta.VariablePrint(Sender: TObject; var Value: String);
var
	cTexto: String;
  rc: Integer;
begin
	rc := Pos('+', qAux.FieldByName('TARIFA').AsString);
  cTexto := Trim(Copy(qAux.FieldByName('TARIFA').AsString, rc + 1, 255));
  rc := Pos('*', cTexto);
  Value := Trim(Copy(cTexto, rc + 2, 255));
end;

procedure TqrEstadoCuenta.lEmpleadosPrint(Sender: TObject; var Value: String);
var
	cTexto: String;
  rc: Integer;
begin
  rc := Pos('+', qAux.FieldByName('TARIFA').AsString);
  cTexto := Trim(Copy(qAux.FieldByName('TARIFA').AsString, 1, rc - 1));
  rc := Pos('*', cTexto);
  Value := Trim(Copy(cTexto, 1, rc - 1));
end;

procedure TqrEstadoCuenta.lMasaPrint(Sender: TObject; var Value: String);
var
	cTexto: String;
  rc: Integer;
begin
  rc := Pos('+', qAux.FieldByName('TARIFA').AsString);
  cTexto := Trim(Copy(qAux.FieldByName('TARIFA').AsString, rc + 2, 255));
  rc := Pos('*', cTexto);
  Value := Trim(Copy(cTexto, 1, rc - 1));
end;

procedure TqrEstadoCuenta.cDebePrint(Sender: TObject; var Value: String);
begin
	if (Value <> '0') or lSaldo then
  	Value := FormatFloat('#,##0.00', qAux.FieldByName('DEBE').AsFloat)
  else
  	Value := '';
end;

procedure TqrEstadoCuenta.cHaberPrint(Sender: TObject; var Value: String);
begin
	if (Value <> '0') or lSaldo then
  	Value := FormatFloat('#,##0.00', qAux.FieldByName('HABER').AsFloat)
  else
  	Value := '';
end;

procedure TqrEstadoCuenta.qrlEntidadesPrint(Sender: TObject; var Value: String);
begin
  Value := ValorSQL('SELECT obtener_entidades(''' + sCuit + ''') FROM dual');
end;

procedure TqrEstadoCuenta.qrlVendedoresPrint(Sender: TObject; var Value: String);
begin
  Value := ValorSQL('select obtener_vendedores(''' + sCuit + ''') from dual');
end;

procedure TqrEstadoCuenta.qrlClasDevengadoPrint(Sender: TObject; var Value: String);
begin
	if lClasific then
  	Value := ValorSQL('SELECT tb_descripcion' +
    									 ' FROM ctb_tablas, zct_cotizaciones' +
                      ' WHERE tb_clave = ''CODEV''' +
                      	' AND ct_clase = tb_codigo' +
                        ' AND ct_cuit = ''' + sCuit +
                        ' AND ct_period = ''' + qAux.FieldByName('PERIODO').AsString + '''')
	else
  	Value := '';
end;

procedure TqrEstadoCuenta.QRLabel19Print(Sender: TObject; var Value: String);
begin
  Value := {$IFDEF CAS}frmMenu{$ELSE}frmPrincipal{$ENDIF}.DBLogin.Usuario;
end;

procedure TqrEstadoCuenta.qrdbCUITPrint(Sender: TObject; var Value: String);
begin
  Value := Copy(Value, 1, 2) + '-' + Copy(Value, 3, 8) + '-' + Copy(Value, 11, 1);
end;

procedure TqrEstadoCuenta.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not lSaldo;
end;

procedure TqrEstadoCuenta.QRDBText18Print(Sender: TObject; var Value: String);
begin
	if lSaldo then
  	Value := '';
end;

procedure TqrEstadoCuenta.QRExpr4Print(Sender: TObject; var Value: String);
begin
	if not lSaldo then
  	Value := ''
  else
  begin
  	DeudaNominal := StrToFloatEX(Value);
    TotNominal := TotNominal + DeudaNominal;
  end;
end;

procedure TqrEstadoCuenta.QRLabel38Print(Sender: TObject; var Value: String);
begin
	if not lSaldo then
  	Value := ''
  else
  	QRLabel32Print(Sender, Value);  // Cálculo de intereses
end;

procedure TqrEstadoCuenta.qrlPeriodoPrint(Sender: TObject; var Value: String);
begin
	if sInterno then
  	Value := 'Vto: ' + qAux.FieldByName('FechaVenc').AsString                                             // by NWK, 07/02/03
  else
  	Value := '';
end;

procedure TqrEstadoCuenta.qrlMotivoBajaPrint(Sender: TObject; var Value: String);
begin
	Value := ValorSQL('SELECT tb_descripcion' +
  									 ' FROM ctb_tablas, ACO_CONTRATO' +
                    ' WHERE tb_clave = ''MOTIB''' +
                    	' AND tb_codigo = CO_MOTIVOBAJA' +
                      ' AND CO_CONTRATO = ''' + qAux.FieldByName('MP_CONTRATO').AsString + '''');
end;

procedure TqrEstadoCuenta.qrlEstadoPrint(Sender: TObject; var Value: String);
begin
	{ if sContCuit then }
	Value := ValorSQL('SELECT tb_descripcion' +
  									 ' FROM ctb_tablas, ACO_CONTRATO' +
                    ' WHERE tb_clave = ''AFEST''' +
                    	' AND tb_codigo = CO_ESTADO' +
                      ' AND CO_CONTRATO = ''' + qAux.FieldByName('MP_CONTRATO').AsString + '''');
end;

procedure TqrEstadoCuenta.QRLabel32Print(Sender: TObject; var Value: String);
begin
  if not sIntereses then
    Value := ''
  else if (DeudaNominal <= 0) then
  	Value := '0.00'
  else
  begin
  	Mora := ValorSqlExtended('SELECT art.deudas.Get_TasaAcumulada(fecha + 1, ' + SqlDate(sInterDate)  + ' )  *  ' + SqlNumber(DeudaNominal)  + ' / 100' +
    													' FROM ew_intereses' +
                             ' WHERE PERIODO = ''' + qAux.FieldByName('PERIODO').AsString + '''');
    TotMora := TotMora + Mora;
    Value   := FloatToStrf(Mora, ffNumber, 11, 2);
  end;
end;

procedure TqrEstadoCuenta.QRExpr3Print(Sender: TObject; var Value: String);
begin
  DeudaNominal := StrToFloatEx(Value);
  TotNominal := TotNominal + DeudaNominal;
end;

procedure TqrEstadoCuenta.QRLabel33Print(Sender: TObject; var Value: String);
begin
  Value := FloatToStrf(DeudaNominal + Mora, ffNumber, 11, 2);
  DeudaNominal := 0;
  Mora := 0;
end;

procedure TqrEstadoCuenta.QRLabel34Print(Sender: TObject; var Value: String);
begin
	Value := FloatToStrf(TotNominal, ffNumber, 11, 2);
end;

procedure TqrEstadoCuenta.QRLabel35Print(Sender: TObject; var Value: String);
begin
	if sIntereses then
  	Value := FloatToStrf(TotMora, ffNumber, 11, 2)
  else
  	Value := '';
end;

procedure TqrEstadoCuenta.QRLabel36Print(Sender: TObject; var Value: String);
begin
  Value := FloatToStrf(TotNominal + TotMora, ffNumber, 11, 2);
end;

procedure TqrEstadoCuenta.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotNominal  := 0;
  TotMora     := 0;
  PrintReport := True;
end;

procedure TqrEstadoCuenta.QRLabel27Print(Sender: TObject; var Value: String);
begin
  if not sContCuit then
    Value := '';
end;

procedure TqrEstadoCuenta.qrdMP_CONTRATOPrint(Sender: TObject; var Value: String);
begin
	if not sContCuit then
  	Value := qAux.FieldByName('PER_CONTRATO').AsString;
end;

procedure TqrEstadoCuenta.qrlDeudaConsolidadaPrint(Sender: TObject; var Value: String);
begin
  if not lSaldo then
  	Value := ''
  else
  begin
  	Value := FloatToStrf(DeudaNominal + Mora, ffNumber, 11, 2);
    DeudaNominal := 0;
    Mora := 0;
  end;
end;

procedure TqrEstadoCuenta.QRLabel30Print(Sender: TObject; var Value: String);
begin
  if not sIntereses then
    Value := '';
end;

procedure TqrEstadoCuenta.qrlPeriodoEnRefinanciacionPrint(Sender: TObject; var Value: String);
begin
	Value := ValorSQL('SELECT Utiles.IIF_Char(Deudas.PeriodoEnRefinanciacion(''' + sCuit + ''', ' +
                        ' ''' +  qAux.FieldByName('PERIODO').AsString + '''), ''S'', ''(** R **)'', '''')' +
  									 ' FROM DUAL');
end;

constructor TqrEstadoCuenta.Create(AOwner: TComponent);
begin
  inherited;
  
  FTipoEmision        := teDetalleSaldo;
  FContrato           := 0;
  FTipoResumen        := trTotalPeriodos;
  FVencimiento        := 0;
  lClasific           := True;
  FDeudaExtraJudicial := False;
end;

function TqrEstadoCuenta.Execute: Boolean; { Tomado de EmisionCta }
var
   sSql: String;
begin
  lSaldo := False;

  sSql := '';

  if FContrato <> 0 then
    sSql := sSql + ' AND CT_CONTRATO = ' + SqlInt(FContrato)
  else
    sContCuit := True;

  if FPeriodoDesde <> '' then
    sSql := sSql + ' AND '''' || CT_PERIOD >= ' + SqlValue(FPeriodoDesde);  // by NWK, 07/02/03, para que use el índice por cuit

  if FPeriodoHasta <> '' then
    sSql := sSql + ' AND '''' || CT_PERIOD <= ' + SqlValue(FPeriodoHasta);  // by NWK, 07/02/03, para que use el índice por cuit

  if FTipoResumen = trPeriodosNoSaldados then
    if FDeudaExtraJudicial then                    // by NWK, 06/02/03
      sSql := sSql + ' AND (COB.Get_SaldoPeriodo(CT_CUIT, CT_PERIOD, ''N'') > 0)'
    else
      sSql := sSql + ' AND (COB.Get_SaldoPeriodo(CT_CUIT, CT_PERIOD) > 0)';

  if FDeudaExtraJudicial then
    sSql := sSql + ' AND MV_NOTOMAR  = ''N''';

  if FVencimiento > 0 then
  begin
    sIntereses := True;
    sInterDate := FVencimiento;
  end;

  case FTipoEmision of
    teDetalleSaldoComp:
    begin
     sSql :=
     	'SELECT MO_CUIT CUIT, MO_PERIOD PERIODO, MO_CODIGO CODIGO, MV_detalle,' +
      			' To_Number( Iif_Compara( ''>='',MO_CODIGO,''500'',MO_IMPORTE,0)) DEBE,' +
            ' To_Number( Iif_Compara( ''>='',MO_CODIGO,''500'',0,MO_IMPORTE)) HABER,' +
            ' Substr(MO_PERIOD,5,2)||''/''||Substr(MO_PERIOD,1,4) PER_FOR, CT_EMPLEADOS EMPLEADOS,' +
            ' CT_MASASALARIAL MASA,' +
            ' afiliacion.Get_TarifaVigenteTextoCompleto(afiliacion.Get_ContratoVigente(MO_CUIT, MO_PERIOD), MO_PERIOD) TARIFA,' +
            ' mp_nombre, mp_contrato, mp_vigenciadesde, mp_vigenciahasta, mp_sumafija, mp_porcmasa, mp_fbaja,' +
            ' mp_actividad ||'' - ''||av_descripcion ACTIVIDAD,' +
            ' ART.Armar_Domicilio(mp_calle, mp_numero, mp_piso, mp_departamento) DOMICILIO,' +
            ' ART.Armar_Localidad(mp_cpostal, mp_localidad, mp_provincia) LOCALIDAD, mp_fechaconcurso,' +
            ' mp_ultimomesconcurso, mp_fechaquiebra, mp_ultimomesquiebra,' +
            ' TO_DATE(ART.UTILES.IIF_COMPARA(''>='', mo_Codigo, ''500'', TO_CHAR(EW.Fecha, ''DD/MM/YYYY''), NVL(TO_CHAR(mo_Fereca, ''DD/MM/YYYY''), TO_CHAR(mo_FeAlta, ''DD/MM/YYYY''))), ''DD/MM/YYYY'') fechamov,' +
            ' ART.UTILES.Periodo_PonerBarra(mp_ultimomesconcurso) PER_CON,' +
            ' ART.UTILES.Periodo_PonerBarra(mp_ultimomesquiebra) PER_QUI, mp_estado, ct_contrato per_contrato,' +
            ' EW.Fecha FechaVenc' +
       ' FROM ZMO_MOVIM, ZMV_MVTOS, ZCT_COTIZACIONES, CMP_EMPRESAS, CAV_ACTIVIDAD, EW_INTERESES EW' +
      ' WHERE MO_CODIGO = MV_CODIGO' +
      	' AND MO_CUIT = MP_CUIT' +
        ' AND MP_ACTIVIDAD = AV_CODIGO' +
        ' AND CT_CUIT = MO_CUIT' +
        ' AND CT_PERIOD = MO_PERIOD' +
        ' AND MO_CUIT = ''' + sCuit + '''' +
        ' AND MO_PERIOD = EW.PERIODO ' +
              sSql +
   ' ORDER BY cuit, periodo, iif_Compara(''>='',mo_codigo,500,0,1 ), mo_fedis';
     sInterno := True;
    end;

    teDetalleSaldo:
    begin
     ssql :=
     	'SELECT AA.CUIT, AA.PERIODO, AA.CODIGO, MV_detalle,' +
      			' To_Number(Iif_Compara( ''>='',AA.CODIGO,''500'',IMPORTE,0)) DEBE,' +
            ' To_Number(Iif_Compara( ''>='',AA.CODIGO,''500'',0,IMPORTE)) HABER,' +
            ' Substr(AA.PERIODO,5,2)||''/''||Substr(AA.PERIODO,1,4) PER_FOR, CT_EMPLEADOS EMPLEADOS,' +
            ' CT_MASASALARIAL MASA,' +
            ' afiliacion.Get_TarifaVigenteTextoCompleto(afiliacion.Get_ContratoVigente(AA.CUIT, AA.PERIODO), AA.PERIODO) TARIFA,' +
            ' mp_nombre, mp_contrato, mp_vigenciadesde, mp_vigenciahasta, mp_sumafija, mp_porcmasa, mp_fbaja,' +
            ' mp_actividad ||'' - ''||av_descripcion ACTIVIDAD,' +
            ' ART.Armar_Domicilio(mp_calle, mp_numero, mp_piso, mp_departamento) DOMICILIO,' +
            ' ART.Armar_Localidad(mp_cpostal, mp_localidad, mp_provincia) LOCALIDAD, mp_fechaconcurso,' +
            ' mp_ultimomesconcurso, mp_fechaquiebra, mp_ultimomesquiebra,' +
            ' get_fechamovim(ct_cuit, ct_period, codigo) fechamov,' +
            ' ART.UTILES.Periodo_PonerBarra(mp_ultimomesconcurso) PER_CON,' +
            ' ART.UTILES.Periodo_PonerBarra(mp_ultimomesquiebra) PER_QUI, mp_estado, ct_contrato per_contrato,' +
            ' EW.Fecha FechaVenc' +
       ' FROM EW_MOVIMSORT AA, ZMV_MVTOS, ZCT_COTIZACIONES, CMP_EMPRESAS, CAV_ACTIVIDAD, EW_INTERESES EW' +
      ' WHERE AA.CODIGO = MV_CODIGO' +
      	' AND AA.CUIT = MP_CUIT' +
        ' AND MP_ACTIVIDAD = AV_CODIGO' +
        ' AND CT_CUIT = AA.CUIT' +
        ' AND CT_PERIOD = AA.PERIODO' +
        ' AND AA.CUIT = ''' + sCuit + '''' +
        ' AND AA.PERIODO = EW.PERIODO ' +
        			sSql +
   ' ORDER BY ORDEN ';
    end;

    teSaldo:
    begin
    	sSql :=
      	'SELECT MO_CUIT CUIT, MO_PERIOD PERIODO, ''   '' CODIGO, '' '' MV_DETALLE, ACTUALDATE FECHAMOV,' +
        			' Sum(To_Number(Iif_Compara(''>='', MO_CODIGO, ''500'', MO_IMPORTE, 0))) DEBE,' +
              ' Sum(To_Number(Iif_Compara(''>='', MO_CODIGO, ''500'', 0, MO_IMPORTE))) HABER,' +
              ' Sum(To_Number(Iif_Compara(''>='', MO_CODIGO, ''500'', MO_IMPORTE, -MO_IMPORTE))) SALDO,' +
              ' Substr(MO_PERIOD, 5, 2)||''/''||Substr(MO_PERIOD, 1, 4) PER_FOR, CT_EMPLEADOS EMPLEADOS,' +
              ' CT_MASASALARIAL MASA,' +
              ' afiliacion.Get_TarifaVigenteTextoCompleto(afiliacion.Get_ContratoVigente(MO_CUIT, MO_PERIOD), MO_PERIOD) TARIFA,' +
              ' mp_nombre, mp_contrato, mp_vigenciadesde, mp_vigenciahasta, mp_sumafija, mp_porcmasa, mp_fbaja,' +
              ' mp_actividad ||'' - ''||av_descripcion ACTIVIDAD,' +
              ' ART.Armar_Domicilio(mp_calle, mp_numero, mp_piso, mp_departamento) DOMICILIO,' +
              ' ART.Armar_Localidad(mp_cpostal, mp_localidad, mp_provincia) LOCALIDAD, mp_fechaconcurso,' +
              ' mp_ultimomesconcurso, mp_fechaquiebra, mp_ultimomesquiebra,' +
              ' ART.UTILES.Periodo_PonerBarra(mp_ultimomesconcurso) PER_CON,' +
              ' ART.UTILES.Periodo_PonerBarra(mp_ultimomesquiebra) PER_QUI, mp_estado, ct_contrato per_contrato,' +
              ' EW.Fecha FechaVenc' +
         ' FROM ZMO_MOVIM, ZMV_MVTOS, ZCT_COTIZACIONES, CMP_EMPRESAS, CAV_ACTIVIDAD, EW_INTERESES EW' +
        ' WHERE MO_CUIT = MP_CUIT' +
        	' AND MP_ACTIVIDAD = AV_CODIGO' +
          ' AND MO_CODIGO = MV_CODIGO' +
          ' AND CT_CUIT = MO_CUIT' +
          ' AND CT_PERIOD = MO_PERIOD' +
          ' AND MO_CUIT = ''' + sCuit + '''' +
          ' AND MO_PERIOD = EW.PERIODO ' +
                sSql +
     ' GROUP BY MO_CUIT, MO_PERIOD, CT_EMPLEADOS, CT_MASASALARIAL, mp_nombre, mp_contrato, mp_vigenciadesde,' +
     					' mp_vigenciahasta, mp_sumafija, mp_porcmasa, mp_fbaja, mp_actividad ||'' - ''||av_descripcion,' +
              ' mp_calle,mp_numero,mp_piso,mp_departamento, mp_cpostal, mp_localidad, mp_provincia, mp_fechaconcurso,' +
              ' mp_ultimomesconcurso, mp_fechaquiebra, mp_ultimomesquiebra, mp_estado, ct_contrato, EW.Fecha' +
     ' ORDER BY MO_PERIOD';

       lSaldo := True;
  end
  else
    raise Exception.Create(SInvalidPropertyValue);
  end;

  OpenQuery(qAux, sSql);

  if not qAux.IsEmpty then
  begin
    with GetQuery('SELECT Varios.Get_MsgCartaDocumento('''+ sCuit + ''' , ''04'', ''01''), ' +
                         'Varios.Get_MsgCartaDocumento('''+ sCuit + ''' , ''04'', ''02'') FROM DUAL') do
    try
    	qrlRenglon1.Caption := Fields[0].AsString;
      qrlRenglon2.Caption := Fields[1].AsString;
    finally
    	Free;
    end;
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_ART');
    Result := True;
  end
  else
    Result := False;
end;

function TqrEstadoCuenta.Preview: Boolean;
begin
  QuickRep1.Preview;
  Result := not QuickRep1.Cancelled;
end;

function TqrEstadoCuenta.Print: Boolean;
begin
  QuickRep1.Print;
  Result := not QuickRep1.Cancelled;
end;

function TqrEstadoCuenta.PrinterSetup: Boolean;
begin
  QuickRep1.Tag := 0;
  QuickRep1.PrinterSetup;
  Result := QuickRep1.Tag = 0;
end;

procedure TqrEstadoCuenta.qrlReafiliacionPrint(Sender: TObject; var Value: String);
begin
  Value := ValorSQL('SELECT ART.UTILES.IIF_CHAR(ART.AFILIACION.Is_EmpresaReafiliada(' + SqlValue(sCuit) + '), ''S'', ''REAFILIACION'', Null) ' +
                      'FROM DUAL');
end;

procedure TqrEstadoCuenta.qrlGestorNombrePrint(Sender: TObject; var Value: String);
var
  sSql: String;
begin
  sSql := 'SELECT AFILIACION.Get_NombreGestorCuenta(AFILIACION.Get_UltContrato(' + SqlValue(sCuit) + '))' +
           ' FROM DUAL';

  Value := ValorSql(sSql);
end;

end.
