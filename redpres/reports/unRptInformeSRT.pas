unit unRptInformeSRT;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ArtQReports,
     Db, SDEngine, ArtDatabase, AnsiSql, unDmPrincipal, Strfuncs;

type
  TRptInformeSRT = class(TQuickRep)
    sdqDetalleReporte: TSDQuery;
    sdqDetalleReporteTB_DESCRIPCION: TStringField;
    sdqDetalleReporteER_OBSERVACIONES: TStringField;
    sdqDatosReporte: TSDQuery;
    sdqDatosReporteTJ_NOMBRE: TStringField;
    sdqDatosReporteEX_FECHAACCIDENTE: TDateTimeField;
    sdqDatosReporteMP_TELEFONOS: TStringField;
    sdqDatosReporteAV_DESCRIPCION: TStringField;
    sdqDatosReporteT1DESCR: TStringField;
    sdqDatosReporteMP_NOMBRE: TStringField;
    sdqDatosReporteDE_TAREAHABITUAL: TStringField;
    sdqDatosReporteSINIESTRO: TStringField;
    sdqDatosReporteDOMICILIO: TStringField;
    sdqDatosReporteLOCALIDAD: TStringField;
    sdqDatosReporteDOMICILIOTRAB: TStringField;
    sdqDatosReporteLOCALIDADTRAB: TStringField;
    sdqDatosReporteDE_DESCRIPCION: TStringField;
    sdqDatosReporteT3DESCR: TStringField;
    sdqDatosReporteCUIL: TStringField;
    sdqDatosReporteEDAD: TFloatField;
    sdqDatosReporteCUIT: TStringField;
    sdqDatosReporteEX_CUIL: TStringField;
    sdqDatosReporteEX_CUIT: TStringField;
    sdqDatosReporteBREVEDESC: TStringField;
    sdqDatosReporteDIAGNOSTICO: TStringField;
    dsDatosReporte: TDataSource;
    QRBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlProvincia: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrdbNombreApellido: TQRDBText;
    qrdbCuil: TQRDBText;
    qrdbDomTrab: TQRDBText;
    qrdbLocTrab: TQRDBText;
    qrdbTelefono: TQRDBText;
    qrdbEdad: TQRDBText;
    QRLabel12: TQRLabel;
    qrdbFechaAccidente: TQRDBText;
    QRLabel13: TQRLabel;
    qrdbSiniestro: TQRDBText;
    QRShape6: TQRShape;
    qrdbTelEmp: TQRDBText;
    QRLabel15: TQRLabel;
    qrdbLocEmp: TQRDBText;
    qrdbDomEmp: TQRDBText;
    QRLabel16: TQRLabel;
    qrlCuit: TQRLabel;
    qrdbCuit: TQRDBText;
    qrlEmpDep: TQRLabel;
    qrdbEmpleador: TQRDBText;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    qrdbRama: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrdbTipoAcc: TQRDBText;
    QRLabel21: TQRLabel;
    qrlTarea: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbDetalle2: TQRDBText;
    qrdbDetalle1: TQRDBText;
    QRBand2: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    GroupFooterBand1: TQRBand;
    QRShape17: TQRShape;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRLabel26: TQRLabel;
    qrlNombreResp: TQRLabel;
    qrlDirResp: TQRLabel;
    qrlTelResp: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    qrlFechaReubicacion: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    qrlSector: TQRLabel;
    QRBand3: TQRBand;
    qrdbDescripcion: TQRDBText;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    GroupHeaderBand1: TQRBand;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrlEtapas: TQRLabel;
    qrlEtapas2: TQRLabel;
    qrlFechaRecal: TQRLabel;
    QRLabel23: TQRLabel;
    qrdbLateralidad: TQRDBText;
    QRLabel22: TQRLabel;
    qrdbDiagnostico: TQRDBText;
    QRShape18: TQRShape;
    QRShape21: TQRShape;
    sdqDatosReporteTELEFONOTRAB: TStringField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure sdqDatosReporteAfterOpen(DataSet: TDataSet);
  private
    Siniestro, Orden :Integer;  
    function GetFechaInicioRec(iSiniestro, iOrden :Integer) :String;
    function GetFechaReubicacion(iSiniestro, iOrden :Integer) :String;
    procedure GetDatosResponsable(iSiniestro, iOrden :Integer);
    procedure GetDatosSector(iSiniestro, iOrden :Integer);
  public
    function DoGenerarCodEventosRecSRT :String;
  end;

var
  RptInformeSRT: TRptInformeSRT;

implementation

uses uncomunes;

{$R *.DFM}

procedure TRptInformeSRT.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  bEsSinGobernacion :Boolean;
begin
  qrlFechaRecal.Caption := GetFechaInicioRec(Siniestro, Orden);
  qrlFechaReubicacion.Caption := GetFechaReubicacion(Siniestro, Orden);
  GetDatosResponsable(Siniestro, Orden);
  GetDatosSector(Siniestro, Orden);
  bEsSinGobernacion := Is_SiniestroGobernacion(Siniestro);
  if bEsSinGobernacion then
  begin
    qrlProvincia.Caption  := GOB_NOMBRE;
    qrlEmpDep.Caption     := 'Dependencia GPBA';
    qrlCuit.Width         := 0;
    qrdbCuit.Width        := 0;
    qrdbEmpleador.Left    := 139;
  end
  else begin
    qrlProvincia.Caption  := ART_NOMBRE2;
    qrlEmpDep.Caption     := 'Nombre del establecimiento empleador';
    qrdbEmpleador.Left    := 254;
  end;
end;

function TRptInformeSRT.GetFechaInicioRec(iSiniestro, iOrden :Integer) :String;
//devuelve la fecha de inicio del proceso de recalificación
Var
  sSql :String;
begin
  sSql := 'SELECT MIN(er_fecha) ' +
           ' FROM ser_evemedrecalif, sin.sem_eventomedicoreca ' +
          ' WHERE er_siniestro = ' + SqlInt(iSiniestro) +
            ' AND er_orden = ' + SqlInt(iOrden) +
            ' AND er_evento > 0 ' +
            ' AND er_codigo = em_codigo ' +
            ' AND em_amerita = ''S'' ';  //AMERITA RECALIFICACION
  GetFechaInicioRec := ValorSql(sSql);
end;

function TRptInformeSRT.GetFechaReubicacion(iSiniestro, iOrden :Integer) :String;
//devuelve la fecha de reubicacion de tareas transitorias
Var
  sSql :String;
begin
  sSql := 'SELECT MIN(er_fecha) ' +
           ' FROM ser_evemedrecalif, sin.sem_eventomedicoreca ' +
          ' WHERE er_siniestro = ' + SqlInt(iSiniestro) +
            ' AND er_orden = ' + SqlInt(iOrden) +
            ' AND er_evento > 0 ' +
            ' AND er_codigo = em_codigo ' +
            ' AND em_reubicacion = ''S'' '; //REUBICACION Y/O REASIGNACION DE TAREAS TRANSITORIAS
  GetFechaReubicacion := ValorSql(sSql);
end;

procedure TRptInformeSRT.GetDatosResponsable(iSiniestro, iOrden :Integer);
//devuelve los datos del último responsable (máx. código evento)
//informado en el seguimiento de recalificación
var
  sSql :String;
  sdqResponsable :TSDQuery;
begin
  sSql := 'SELECT re_nombre, re_direccion, re_telefono ' +
           ' FROM ser_evemedrecalif, mre_responsable ' +
          ' WHERE er_siniestro= ' + SqlInt(iSiniestro) +
            ' AND er_orden= ' + SqlInt(iOrden) +
            ' AND er_evento > 0 ' +
            ' AND er_responsable IS NOT NULL ' +
            ' AND er_responsable = re_responsable(+) ' +
          ' ORDER BY er_codigo DESC, er_fecha DESC, er_evento DESC';
  sdqResponsable := GetQuery(sSql);
  try
    if not sdqResponsable.Eof then
    begin
      qrlNombreResp.Caption :=  sdqResponsable.FieldByName('re_nombre').AsString;
      qrlDirResp.Caption    :=  sdqResponsable.FieldByName('re_direccion').AsString;
      qrlTelResp.Caption    :=  sdqResponsable.FieldByName('re_telefono').AsString;
    end
    else begin
      qrlNombreResp.Caption :=  '';
      qrlDirResp.Caption    :=  '';
      qrlTelResp.Caption    :=  '';
    end;
  finally
    sdqResponsable.Free;
  end;
end;

procedure TRptInformeSRT.GetDatosSector(iSiniestro, iOrden :Integer);
var
  sSql :String;
  sdqSector :TSDQuery;
begin
  sSql := ' SELECT dl_tarea, t2.tb_descripcion T2Descr ' +
            ' FROM cdl_datoslaborales, ctb_tablas t2 ' +
           ' WHERE dl_cuil= ' +  SqlValue(sdqDatosReporteEX_CUIL.AsString) +
             ' AND dl_cuit= ' + SqlValue(sdqDatosReporteEX_CUIT.AsString) +
             ' AND t2.tb_codigo(+)=dl_CIUO ' +
             ' AND t2.tb_clave(+)=''TAREA'' ';
  sdqSector := GetQuery(sSql);
  try
    qrlSector.Caption := sdqSector.FieldByName('dl_tarea').AsString;
    qrlTarea.Caption  := sdqSector.FieldByName('T2Descr').AsString;
  finally
    sdqSector.Free;
  end;
end;

function TRptInformeSRT.DoGenerarCodEventosRecSRT :String;
var
  sSql, vEspecial :String;
  Consulta :TSDQuery;
begin
  vEspecial := '(' ;
  sSql := ' SELECT em_codigo FROM SIN.sem_eventomedicoreca ' +
           ' WHERE em_fechabaja IS NULL ' +
             ' AND em_eventosrt = ''S'' ';
  Consulta := GetQuery(sSql);
  try
    while not Consulta.Eof do
    begin
      vEspecial := vEspecial + '''' + Consulta.FieldByName('em_codigo').AsString + '''' + ',';
      Consulta.Next;
    end;
    vEspecial := CutRight(vEspecial,1);
    vEspecial := vEspecial + ')';
    Result := vEspecial;
  finally
    Consulta.Free;
  end;
end;

procedure TRptInformeSRT.sdqDatosReporteAfterOpen(DataSet: TDataSet);
begin
  Siniestro := sdqDatosReporte.Params[0].AsInteger;
  Orden     := sdqDatosReporte.Params[1].AsInteger;
end;

end.
