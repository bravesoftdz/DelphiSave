unit unRptAltaJuicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ImagingComponents;

type
  TrptAltaJuicio = class(TForm)
    qrResolucion: TQuickRep;
    qrbTitulo: TQRBand;
    logo: TQRImage;
    QRLabel1: TQRLabel;
    qrlNroJuicio: TQRLabel;
    lblcuit: TQRLabel;
    qrlNroSiniestro: TQRLabel;
    QRLabel3: TQRLabel;
    qrlFechaAlta: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFechaNotificacion: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlOrdenNro: TQRLabel;
    QRLabel10: TQRLabel;
    qrlDemandante: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrlDemandado: TQRLabel;
    QRLabel15: TQRLabel;
    qrlCaratula: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlReclamo: TQRLabel;
    QRLabel20: TQRLabel;
    qrlFechaReclamo: TQRLabel;
    QRLabel22: TQRLabel;
    qrlMontoReclamado: TQRLabel;
    qrlLabelEnf: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    qrlEstudioJuridico: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    qrlFechaNacimiento: TQRLabel;
    QRLabel40: TQRLabel;
    qrlEdad: TQRLabel;
    qrlLabelFalta: TQRLabel;
    QRLabel44: TQRLabel;
    qrlSueldo: TQRLabel;
    QRLabel46: TQRLabel;
    qrlIncapacidadReclamada: TQRLabel;
    QRLabel48: TQRLabel;
    qrlIncapacidadComMedica: TQRLabel;
    QRLabel50: TQRLabel;
    qrlAccidente: TQRLabel;
    qrlEnfermedad: TQRLabel;
    qrLabelAcc: TQRLabel;
    qrlFaltaDemanda: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRLabel14: TQRLabel;
    QRShape6: TQRShape;
    QRLabel26: TQRLabel;
    QRShape13: TQRShape;
    QRLabel16: TQRLabel;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRLabel21: TQRLabel;
    QRShape9: TQRShape;
    QRLabel23: TQRLabel;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRShape11: TQRShape;
    QRLabel25: TQRLabel;
    QRShape12: TQRShape;
    QRLabel27: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel28: TQRLabel;
    QRShape16: TQRShape;
    QRLabel29: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CargarDatos(idjuicio : integer);
    procedure ArmarQrp(idjuicio : Integer; idorigen : Integer);
  end;

var
  rptAltaJuicio: TrptAltaJuicio;

implementation

uses
  unDmPrincipal, AnsiSql, unVisualizador, SDEngine, General;

{$R *.dfm}

procedure TrptAltaJuicio.ArmarQrp(idjuicio, idorigen: Integer);
var
  sWhere : String;
begin
  if idorigen > 0 then
    sWhere := ' AND od_id = '+SqlValue(idorigen)
  else
    sWhere := '';
  with GetQuery(
    ' SELECT jt_numerocarpeta, ex_siniestro, ex_orden, jt_fechaalta, jt_fechanotificacionjuicio, jt_demandante, jt_demandado, '+
    '        jt_caratula, rc_descripcion, ex_fechaaccidente, rt_montodemandado, jt_importereserva, jt_importereservahonorarios, '+
    '        bo_nombre, tj_fnacimiento, TRUNC(MONTHS_BETWEEN(ex_fechaaccidente, tj_fnacimiento) / 12) edad, '+
    '        (SELECT distinct ''S'' '+
    '           FROM legales.let_eventojuicioentramite '+
    '          WHERE et_idjuicioentramite = jt_id '+
    '            AND et_idtipoevento = 604) faltademanda, rl_sueldo, rt_porcentajeincapacidad, '+
    '        (SELECT si_porcdef '+
    '           FROM art.sin_incapacidsin '+
    '          WHERE si_idexpediente = ex_id) incommedica, rt_origen '+
    '   FROM legales.ljt_juicioentramite, legales.lbo_abogado, legales.lrt_reclamojuicioentramite, legales.lrc_reclamo, '+
    '        legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, art.sex_expedientes, comunes.ctj_trabajador, '+
    '        comunes.crl_relacionlaboral '+
    '  WHERE jt_estadomediacion = ''J'' '+
    '    AND jt_id = rt_idjuicioentramite(+) '+
    '    AND jt_id = '+SqlValue(idjuicio)+
    '    AND jt_id = od_idjuicioentramite(+) '+
    '    AND od_id = sj_idorigendemanda(+) '+
    '    AND sj_idsiniestro = ex_id(+) '+
    '    AND rt_idreclamo = rc_id(+) '+
    '    AND jt_idabogado = bo_id(+) '+
    '    AND rt_fechabaja(+) IS NULL '+
    '    AND od_fechabaja(+) IS NULL '+
    '    AND ex_idtrabajador = tj_id(+) '+
    '    AND tj_id = rl_idtrabajador(+) ' +sWhere
  ) do
  try
    qrlNroJuicio.Caption            := FieldByName('jt_numerocarpeta').AsString;
    qrlNroSiniestro.Caption         := FieldByName('ex_siniestro').AsString;
    qrlOrdenNro.Caption             := FieldByName('ex_orden').AsString;
    qrlFechaAlta.Caption            := FieldByName('jt_fechaalta').AsString;
    qrlFechaNotificacion.Caption    := FieldByName('jt_fechanotificacionjuicio').AsString;
    qrlDemandante.Caption           := FieldByName('jt_demandante').AsString;
    qrlDemandado.Caption            := FieldByName('jt_demandado').AsString;
    qrlCaratula.Caption             := FieldByName('jt_caratula').AsString;
    qrlReclamo.Caption              := FieldByName('rc_descripcion').AsString;
    qrlFechaReclamo.Caption         := FieldByName('ex_fechaaccidente').AsString;
    qrlMontoReclamado.Caption       := FieldByName('rt_montodemandado').AsString;
    qrlEstudioJuridico.Caption      := FieldByName('bo_nombre').AsString;
    qrlFechaNacimiento.Caption      := FieldByName('tj_fnacimiento').AsString;
    qrlEdad.Caption                 := FieldByName('edad').AsString;
    if FieldByName('faltademanda').AsString = 'S' then
      qrlFaltaDemanda.Caption       := 'SI'
    else
      qrlFaltaDemanda.Caption       := 'NO';
    qrlSueldo.Caption               := FieldByName('rl_sueldo').AsString;
    qrlIncapacidadReclamada.Caption := FieldByName('rt_porcentajeincapacidad').AsString;
    qrlIncapacidadComMedica.Caption := FieldByName('incommedica').AsString;
    if ((FieldByName('rt_origen').AsString ='E') or (FieldByName('rt_origen').AsString ='T')) then
      qrlEnfermedad.Caption         := 'SI'
    else
      qrlEnfermedad.Caption         := 'NO';
    if ((FieldByName('rt_origen').AsString ='A') or (FieldByName('rt_origen').AsString ='T')) then
      qrlAccidente.Caption          := 'SI'
    else
      qrlAccidente.Caption          := 'NO';
  finally
    Free;
  end;
  Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB]);
  Delay(500);
end;

procedure TrptAltaJuicio.CargarDatos(idjuicio : integer);
begin
  if ExisteSql(' SELECT 1 FROM legales.lod_origendemanda '+
               '  WHERE od_idjuicioentramite = '+SqlValue(idjuicio)+
               '    AND od_fechabaja IS NULL') then
    with
      GetQuery(
        ' SELECT od_id '+
        '   FROM legales.lod_origendemanda '+
        '  WHERE od_idjuicioentramite = '+SqlValue(idjuicio)+
        '   AND od_fechabaja IS NULL ')
    do
    try
      while not Eof do
      begin
        ArmarQrp(idjuicio,FieldByName('od_id').AsInteger);
        Next;
      end;
    finally
      Free;
    end
  else
    ArmarQrp(idjuicio,0);
end;



end.
