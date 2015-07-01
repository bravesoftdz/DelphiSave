unit UnRptPedidoEntregaNuevo;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, unvisualizador,
  uncomunes, unrptcomunes;

type
  TTiponNota = (tnNotaCompra, tnNotaInscripcion, tnPedidoEntrega);    // Plan
  TrptPedidoEntregaNuevo = class(TQuickRep)
    sdqPedidoEntrega: TSDQuery;
    sdqImplante: TSDQuery;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrlTitulo: TQRLabel;
    QRLabel2: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlPrestDireccion: TQRLabel;
    qrlPrestCPLocalidad: TQRLabel;
    qrlPrestProvincia: TQRLabel;
    qrlPrestTelefono: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    qrmDescripciones: TQRMemo;
    qrlPaciente: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlabMarca: TQRLabel;
    qrlabOrigen: TQRLabel;
    qrlFecCirEnt: TQRLabel;
    qrlMarca: TQRLabel;
    qrlOrigen: TQRLabel;
    qrlTurno: TQRLabel;
    QRLabel19: TQRLabel;
    qrlImpoApro: TQRLabel;
    qrlEntregarEn: TQRLabel;
    qrlentregar: TQRLabel;
    qrlMaterialDe: TQRLabel;
    QRLabel4: TQRLabel;
    qrlImpoAproLetras: TQRLabel;
    qrlCaracter: TQRLabel;
    qrlabHora: TQRLabel;
    qrlHora: TQRLabel;
    qrlDescPrestacion: TQRLabel;
    QRLabel5: TQRLabel;
    qrlNumAuto: TQRLabel;
    QRLabel6: TQRLabel;
    qrlNroPedido: TQRLabel;
    QRLabel7: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlUsuarioApro: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    qrmPrestSolicitante: TQRMemo;
    qrlPrestFax: TQRLabel;
    qrlPrestAudPosterior: TQRLabel;
    qrlMatPrestacion: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel14: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    qrlabGTrabajo: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    qrlabDelegacion: TQRLabel;
    qrsShape: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlLocalidad: TQRLabel;
    qrlTelefono: TQRLabel;
    qrmDireccion: TQRMemo;
    qrlRelaciones: TQRMemo;
    qrlPrestaciones: TQRLabel;
    qrlAnulado: TQRLabel;
    qrlPrestMail: TQRLabel;
    qrlDirEntrega: TQRLabel;
    qrlTelAut: TQRLabel;
    qrlRecibe: TQRLabel;
    qrlFirmaUsuario: TQRLabel;
    qrmRequisitos: TQRMemo;
    qrmObservImpresion: TQRMemo;
    qrlMontoBruto: TQRLabel;
    qrlIVA: TQRLabel;
    qrlmbruto: TQRLabel;
    qrlmiva: TQRLabel;
    QRLabel1: TQRLabel;
    qrlFNac: TQRLabel;
    QRLabel11: TQRLabel;
    qrlEmpresa: TQRLabel;
    QRMemo1: TQRMemo;
    procedure Imprimir(idautorizacion: integer);
    procedure Get_CamposNotaCompra(var vDirEntrega, vTelefono, vRecibe: string; iNroAutorizacion: integer);
  end;

var
  rptPedidoEntregaNuevo: TrptPedidoEntregaNuevo;

implementation

uses
  unPrincipal, dialogs, cuit, undmprincipal, ansisql, general, strfuncs, sinedit, unsesion, numeros;

{$R *.DFM}


procedure TrptPedidoEntregaNuevo.Imprimir(idautorizacion: integer);
var   iCentavos :Integer; marca, origen: String; Resultado: TResultados;
      Anulada: boolean; NroPedido: integer;
      nTipoNota: TTiponNota;
      sqlNotas, vDirEntrega, vTelefono, vRecibe, ssql :String;
begin

  sdqPedidoEntrega.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqPedidoEntrega);

  sdqImplante.ParamByName('codimplante').AsString := sdqPedidoEntrega.FieldByName('au_implante').asstring;
  openquery(sdqImplante);

  marca  := '';
  origen := '';

  // Plan
  sqlNotas := 'SELECT pr_herramientas, pr_curso ' +
               ' FROM art.mpr_prestaciones ' +
              ' WHERE pr_codigo = :codpres ';

  // Plan: veo que tipo de Nota va a salir, segun los campos.
  with GetQueryEx(sqlNotas, [sdqPedidoEntrega.FieldByName('AU_PRESAPRO').AsString]) do
  try
    if (FieldByName('PR_HERRAMIENTAS').AsString = 'S') then
      nTipoNota := tnNotaCompra
    else if (FieldByName('PR_CURSO').AsString = 'S') then
      nTipoNota := tnNotaInscripcion
    else
      nTipoNota := tnPedidoEntrega;
  finally
    Free;
  end;

  if (sdqPedidoEntrega.FieldByName('AU_ESTADO').AsString = 'U') or (sdqPedidoEntrega.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqPedidoEntrega.FieldByName('AU_ESTADO').AsString = 'V') then
    Anulada := true
  else
    Anulada := false;

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled     := true;
  end;

  if sdqPedidoEntrega.FieldByName('AU_IMPLANTE').AsString <> '' then
  begin
    marca  := ValorSqlEx('Select im_marca from mim_implantes where im_codigo = :codigo', [sdqPedidoEntrega.FieldByName('AU_IMPLANTE').Text]);
    origen := ValorSqlEx('Select pa_descripcion from mim_implantes,cpa_paises Where im_origen = pa_codigo and im_codigo = :codigo', [sdqPedidoEntrega.FieldByName('AU_IMPLANTE').Text]);
  end;

  // Inicializacion por Plan
  qrlPrestacion.Caption        := '';       // Plan
  qrlRelaciones.Caption        := '';
  qrlDescPrestacion.Caption    := '';
  qrlMaterialDe.Caption        := '';
  qrlMatPrestacion.Caption     := '';
  qrlPrestaciones.Caption      := '';
  qrlabMarca.Caption           := '';
  qrlabOrigen.Caption          := '';
  qrlFecCirEnt.Caption         := '';
  qrlabHora.Caption            := '';
  qrlEntregarEn.Caption        := '';
  qrlCaracter.Caption          := '';
  qrlDocumento.Caption         := '';
  qrlPrestAudPosterior.Caption := '';
  qrsShape.Pen.Style           := psClear;
  qrlabGTrabajo.Caption        := '';
  qrlGTrabajo.Caption          := '';
  qrlabDelegacion.Caption      := '';
  qrlDelegacion.Caption        := '';
  qrlEntregar.Caption          := '';
  qrlDirEntrega.Caption        := '';
  qrlTelAut.Caption            := '';
  qrlRecibe.Caption            := '';
  qrlmbruto.Caption            := '';
  qrlmiva.Caption              := '';

  ssql := ' SELECT pa_montobruto, pa_iva ' +
            ' FROM amed.msp_siniestropresup, amed.mpa_presupuestoautorizacion ' +
           ' WHERE sp_siniestro = :sin ' +
             ' AND sp_orden = :ord ' +
             ' AND sp_recaida = :rec ' +
             ' AND sp_presupuesto = pa_id ' +
             ' AND (sp_autooriginal = :nauto OR sp_autoapro = :nauto) ';

  if (nTipoNota = tnNotaCompra) or (nTipoNota = tnNotaInscripcion) then
  begin
    with GetQueryEx(ssql, [sdqPedidoEntrega.FieldByName('au_siniestro').AsString, sdqPedidoEntrega.FieldByName('au_orden').AsString,
                           sdqPedidoEntrega.FieldByName('au_recaida').AsString, sdqPedidoEntrega.FieldByName('au_numauto').AsString]) do
    begin
      qrlmbruto.Caption := fieldbyname('pa_montobruto').AsString;
      qrlmiva.Caption := fieldbyname('pa_iva').AsString;
    end;
  end;

   case nTipoNota of
    tnNotaCompra:      begin
                         qrlTitulo.Caption         := 'Nota de Compra';
                         Get_CamposNotaCompra(vDirEntrega, vTelefono, vRecibe, sdqPedidoEntrega.fieldbyname('au_numauto').AsInteger);
                         qrlDirEntrega.Caption     := vDirEntrega;
                         qrlTelAut.Caption         := vTelefono;
                         qrlRecibe.Caption         := vRecibe;
                         qrmObservImpresion.Lines.Text := 'Observaciones: ' + sdqPedidoEntrega.FieldByName('AU_OBSERVACIONESIMPRESION').AsString;
                       end;
    tnNotaInscripcion: begin
                         qrlTitulo.Caption         := 'Nota de Confirmación de Inscripción';
                         qrlPrestMail.Caption      := 'Mail: ' + sdqPedidoEntrega.fieldbyname('ca_direlectronica').AsString;
                         qrmObservImpresion.Lines.Text := 'Observaciones: ' + sdqPedidoEntrega.FieldByName('AU_OBSERVACIONESIMPRESION').AsString;
                       end;
    tnPedidoEntrega:   begin
                         qrlTitulo.Caption         := 'Pedido de Entrega';
                         qrlMontoBruto.Caption     := '';
                         qrlIVA.Caption            := '';
                         if sdqImplante.FieldByName('IM_FBAJA').IsNull then
                         begin
                           qrlMarca.Caption        := NVL(sdqPedidoEntrega.fieldbyname('au_implante').asstring, Marca);
                           qrlOrigen.Caption       := NVL(sdqImplante.FieldByName('PA_DESCRIPCION').AsString, Origen);
                         end else begin
                           qrlabMarca.Caption      := ' ';
                           qrlabOrigen.Caption     := ' ';
                         end;
                         qrlPrestacion.Caption := sdqPedidoEntrega.FieldByName('on_capitulo').AsString + ' ' +
                                                  sdqPedidoEntrega.FieldByName('on_codigo').AsString + ' ' +
                                                  sdqPedidoEntrega.FieldByName('on_descripcion').AsString;
                         qrlRelaciones.Lines.Text := GetRelaciones(idautorizacion);
                         qrlDescPrestacion.Caption := sdqPedidoEntrega.FieldByName('pr_descripcion').AsString;
                         qrlTurno.Caption          := sdqPedidoEntrega.FieldByName('AU_TURNO').AsString;
                         qrlHora.Caption           := sdqPedidoEntrega.FieldByName('AU_TURNOHORA').asstring;
                         qrlEntregar.Caption       := IIF(not sdqPedidoEntrega.FieldByName('AU_OBSERVACIONESIMPRESION').isnull, 'Entregar en: ' + sdqPedidoEntrega.FieldByName('AU_OBSERVACIONESIMPRESION').AsString, '');
                         qrlDocumento.Caption      := InitCap(ValorSqlEx('SELECT UPPER(fi_documento) ' +
                                                                          ' FROM cfi_firma ' +
                                                                         ' WHERE fi_id = :IdFirma', [sdqPedidoEntrega.FieldByName('AU_AVAL').AsInteger]));
                         qrlGTrabajo.Caption       := sdqPedidoEntrega.FieldByName('gp_nombre').AsString;
                         qrlDelegacion.Caption     := sdqPedidoEntrega.FieldByName('lg_nombre').AsString;
                         qrsShape.Pen.Style        := psSolid;
                       end;
  end;

  qrlFechaImpresion.Caption   := LugarImpresion(idautorizacion) + ', ' + DateFormat(GetFechaAprobacion(idautorizacion), 'd ''de'' MMMM ''de'' yyyy');
  qrmDireccion.Lines.Text     := DomicilioDelegacion(qriLogo.Picture, sdqPedidoEntrega.fieldbyname('au_siniestro').AsInteger, sdqPedidoEntrega.fieldbyname('ex_id').AsInteger);
  qrlPrestador.Caption        := InitCap(sdqPedidoEntrega.fieldbyname('ca_descripcion').AsString) + '(' + sdqPedidoEntrega.fieldbyname('ca_identificador').AsString + ')';
  qrlPrestDireccion.Caption   := InitCap(sdqPedidoEntrega.fieldbyname('ca_domicilio').AsString);
  qrlPrestCPLocalidad.Caption := InitCap(sdqPedidoEntrega.fieldbyname('ca_localidad').AsString + ' (' + sdqPedidoEntrega.fieldbyname('ca_codpostal').AsString + ')' );
  if (sdqPedidoEntrega.fieldbyname('ca_codpostal').AsString <> '') then
    qrlPrestProvincia.Caption := InitCap(ValorSql('SELECT pv_descripcion' +
                                              ' FROM ccp_codigopostal, cpv_provincias' +
                                             ' WHERE cp_provincia = pv_codigo' +
                                               ' AND cp_codigo = ' + sdqPedidoEntrega.fieldbyname('ca_codpostal').AsString))
  else
    qrlPrestProvincia.Caption := '';

  qrlPrestTelefono.Caption    := 'Tel: ' + sdqPedidoEntrega.fieldbyname('ca_telefono').asstring;
  qrlPrestFax.Caption         := 'Fax: ' + sdqPedidoEntrega.fieldbyname('ca_fax').asstring;

  qrlPaciente.Caption         := InitCap(sdqPedidoEntrega.fieldbyname('tj_nombre').AsString) + ' (DNI: ' + GetDNI (sdqPedidoEntrega.fieldbyname('tj_cuil').AsString) + ')';
  qrlSiniestro.Caption        := sdqPedidoEntrega.fieldbyname('siniestrocomp').asstring;
  qrlFechaSolicitud.Caption   := sdqPedidoEntrega.FieldByName('au_fechasoli').AsString;
  qrlFNac.Caption             := sdqPedidoEntrega.FieldByName('tj_fnacimiento').AsString;
  qrlEmpresa.Caption          := InitCap(sdqPedidoEntrega.fieldbyname('em_nombre').AsString);

  qrmDescripciones.Lines.Text := sdqPedidoEntrega.fieldbyname('cantidad').asstring + ' ' +
                                 sdqPedidoEntrega.fieldbyname('detalle').asstring;

  {qrmDescripciones.Lines.Text := qrmDescripciones.Lines.Text + #13 +
                                 'Remitir a la casilla controldeinsumos@provart.com.ar, en 48/72hs., ' +
                                 'conformidad de aceptación del médico, y posterior fecha de entrega de los materiales.';}

  if length(qrmDescripciones.Lines.Text) > 950 then
    qrmDescripciones.Font.Size := 6
  else
    if length(qrmDescripciones.Lines.Text) > 700 then
      qrmDescripciones.Font.Size := 7;

  {if sdqDatos.FieldByName('AU_PRESSOL').Value <> sdqDatos.FieldByName('AU_PRESAPRO').Value then
    qrmDescripciones.Lines.Text := qrmDescripciones.Lines.Text + sAgregado;}

  qrlNumAuto.Caption          := sdqPedidoEntrega.FieldByName('au_numauto').AsString;
  qrlImpoApro.Caption         := sdqPedidoEntrega.FieldByName('importe').AsString;

  iCentavos := Decimales(ToFloat(qrlImpoApro.Caption));
  qrlImpoAproLetras.Caption := '(' + InitCap(NumLetras(Trunc(ToFloat(qrlImpoApro.Caption)))) +
                               IIF(iCentavos = 0,'.',' con ' + IntToStr(iCentavos) + ' ctvos.') + ')';

  if sdqPedidoEntrega.FieldByName('PR_REQUISITOSPEDENT').AsString = 'N' then
    qrmRequisitos.Lines.Text := '';

  //-------------------------------------------------------------------------------------------------------------
  // [Aval,Caracter,Nro.Documento,Usuario de aprobación]
  qrlFirmaUsuario.Caption := ValorSqlEx('SELECT INITCAP(fi_firmante) ' +
                                         ' FROM cfi_firma ' +
                                        ' WHERE fi_id = :IdFirma ', [sdqPedidoEntrega.FieldByName('AU_AVAL').AsInteger]);
  qrlCaracter.Caption     := ValorSqlEx('SELECT INITCAP(fi_caracter) ' +
                                         ' FROM cfi_firma ' +
                                        ' WHERE fi_id = :IdFirma', [sdqPedidoEntrega.FieldByName('AU_AVAL').AsInteger]);

  if sdqPedidoEntrega.FieldByName('AU_USUAPRO').AsString = '' then
    qrlUsuarioApro.Caption := Sesion.Usuario
  else
    qrlUsuarioApro.Caption := ValorSqlEX('SELECT se_nombre FROM use_usuarios WHERE se_usuario = :usuario ', [sdqPedidoEntrega.FieldByName('AU_USUAPRO').AsString]);

  //-------------------------------------------------------------------------------------------------------------
  // [Prestador Solicitante]
  if sdqPedidoEntrega.FieldByName('au_identifprestador').AsString <> sdqPedidoEntrega.FieldByName('au_identifapro').AsString then
     qrmPrestSolicitante.Lines.Text := 'Prestador Solicitante:' + #13 + sdqPedidoEntrega.FieldByName('pressol').AsString + #13 + sdqPedidoEntrega.FieldByName('domsol').AsString +
                                       #13 + '(' + sdqPedidoEntrega.FieldByName('cpsol').AsString + ')-' + sdqPedidoEntrega.FieldByName('locsol').AsString + #13 +
                                       sdqPedidoEntrega.FieldByName('provsol').AsString +
                                       #13 + 'Tel: ' + sdqPedidoEntrega.FieldByName('telsol').AsString;


  if sdqPedidoEntrega.FieldByName('au_nropedido').AsString <> '' then
    qrlNroPedido.Caption := sdqPedidoEntrega.FieldByName('au_nropedido').AsString
  else
  begin
    NroPedido := ValorSql('Select art.Sau_NroPedido.NEXTVAL from Dual');
    qrlNroPedido.Caption := inttostr(NroPedido);
    EjecutarSqlEx('UPDATE art.sau_autorizaciones ' +
                    ' SET au_nropedido = :pedido ' +
                  ' WHERE au_id = :idauto ', [NroPedido, idautorizacion]);
  end;
  //---------------------------------------------------------------------------------------------------

  qrlDomicilio.Caption  := initcap(sdqPedidoEntrega.FieldByName('domiciliopaciente').AsString);
  qrlLocalidad.Caption  := initcap(sdqPedidoEntrega.FieldByName('localidadpaciente').AsString);
  qrlTelefono.Caption   := sdqPedidoEntrega.FieldByName('TELEFONO').AsString;

  Resultado := Visualizar(self, GetValores(' - Siniestro: ' + sdqPedidoEntrega.fieldbyname('siniestrocomp').AsString + ' - ' + sdqPedidoEntrega.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqPedidoEntrega.FieldByName('tj_documento').AsString, sdqPedidoEntrega.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqPedidoEntrega.fieldbyname('siniestrocomp').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqPedidoEntrega.FieldByName('ca_fax').AsString {Telefono}, sdqPedidoEntrega.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqPedidoEntrega.FieldByName('ca_identificador').AsInteger {IdDest}), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

  DoActualizarImpresionAutorizacion(sdqPedidoEntrega.fieldbyname('au_id').AsInteger, Resultado);
  //Application.ProcessMessages;
end;


procedure TrptPedidoEntregaNuevo.Get_CamposNotaCompra(var vDirEntrega, vTelefono, vRecibe: string; iNroAutorizacion: integer);
var sqlNotaCompra, sSql: string;
    iSiniestro, iOrden: integer;
begin
  iSiniestro := sdqPedidoEntrega.fieldbyname('au_siniestro').AsInteger;
  iOrden     := sdqPedidoEntrega.fieldbyname('au_orden').AsInteger;

  sqlNotaCompra := 'SELECT er_direntrega, er_personarecibe, er_telefonocontacto ' +
                    ' FROM art.ser_evemedrecalif ' +
                   ' WHERE er_siniestro = :sini ' +
                     ' AND er_orden = :orden ' +
                     ' AND er_autorizacion = :autoriz ';

  with GetQueryEx(sqlNotaCompra, [iSiniestro, iOrden, iNroAutorizacion]) do
  try
    // ER_DIRENTREGA (P: paciente - A: ART - O: otra direccion)
    if (FieldByName('ER_DIRENTREGA').AsString = 'P') then       // P: Paciente
    begin
      sSql := 'SELECT art.utiles.armar_domicilio(tj_calle,tj_numero,tj_piso,tj_departamento,tj_localidad) ||'' - ''|| pv_descripcion DOMIC ' +
               ' FROM ctj_trabajador, art.cpv_provincias ' +
              ' WHERE tj_provincia = pv_codigo(+) ' +
                ' AND tj_id = (SELECT max(ex_idtrabajador) ' +
                               ' FROM art.sex_expedientes ' +
                              ' WHERE ex_siniestro = :sini ' +
                                ' AND ex_orden = :orden) ';
      vDirEntrega := 'Dirección de Entrega: ' + ValorSqlEx(sSql, [iSiniestro, iOrden]);
    end
    else if (FieldByName('ER_DIRENTREGA').AsString = 'A') then   // A: A.R.T.
    begin
      vDirEntrega := ART_DOMICILIO3 + ' - ' + ART_LOCALIDAD2;  
    end
    else if (FieldByName('ER_DIRENTREGA').AsString = 'O') then   // O: Otra direccion
    begin
      sSql := ' SELECT art.utiles.armar_domicilio(er_calleentrega, er_numeroentrega, er_pisoentrega, er_deptoentrega, er_localidadentrega) ||'' - ''|| pv_descripcion DOMIC ' +
                ' FROM art.ser_evemedrecalif, art.cpv_provincias ' +
               ' WHERE er_provinciaentrega = pv_codigo(+) ' +
                 ' AND er_siniestro = :sini ' +
                 ' AND er_orden = :orden ' +
                 ' AND er_autorizacion = :NroAutoriz ';
      vDirEntrega := 'Dirección de Entrega: ' + ValorSqlEx(sSql, [iSiniestro, iOrden, iNroAutorizacion]);
    end
    else
      vDirEntrega := '';

    // ER_PERSONARECIBE ((P: paciente - O: Otro)
    if (FieldByName('ER_PERSONARECIBE').AsString = 'P') then        // P: Paciente
    begin
      sSql := ' SELECT tj_nombre ||'' - DNI: ''|| tj_documento Recibe ' +
                ' FROM ctj_trabajador ' +
               ' WHERE tj_id = (SELECT max(ex_idtrabajador) ' +
                                ' FROM art.sex_expedientes ' +
                               ' WHERE ex_siniestro = :sini ' +
                                 ' AND ex_orden = :orden) ';
      vRecibe := 'Recibe: ' + ValorSqlEx(sSql, [iSiniestro, iOrden]);
    end
    else if (FieldByName('ER_PERSONARECIBE').AsString = 'O') then   // O: Otro
    begin
      sSql := 'SELECT er_nombrerecibe ||'' - DNI: ''|| er_dnirecibe Recibe ' +
               ' FROM art.ser_evemedrecalif ' +
              ' WHERE er_siniestro = :sini ' +
               ' AND er_orden = :orden ' +
               ' AND er_autorizacion = :NroAutoriz ';
      vRecibe := 'Recibe: ' + ValorSqlEx(sSql, [iSiniestro, iOrden, iNroAutorizacion]);
    end
    else
      vRecibe := '';

    vTelefono := 'Teléfono: ' + FieldByName('ER_TELEFONOCONTACTO').AsString;
  finally
    Free;
  end;
end;


{--------------------------------------------------------------------------------------------------------------}
end.
