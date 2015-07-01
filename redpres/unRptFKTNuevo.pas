unit unRptFKTNuevo;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, unvisualizador, dialogs, cuit;

type
  TrptFKTNuevo = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrmDireccion: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlPaciente: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlDiagnostico: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRBand2: TQRBand;
    qrlFirmante: TQRLabel;
    qrlCaracter: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    sdqSesion: TSDQuery;
    dsSesion: TDataSource;
    QRShape41: TQRShape;
    QRDBText1: TQRDBText;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel23: TQRLabel;
    QRMemo2: TQRMemo;
    qrlLocalidadCP: TQRLabel;
    QRLabel14: TQRLabel;
    qrlDomicilio: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel13: TQRLabel;
    qrlProvincia: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    qrlTelefono: TQRLabel;
    QRLabel17: TQRLabel;
    qrlNroAutorizacion: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel18: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlDocumento: TQRLabel;
    QRLabel19: TQRLabel;
    qrlDomicilioPaciente: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    QRLabel20: TQRLabel;
    qrlFax: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrlTelPaciente: TQRLabel;
    QRLabel24: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel25: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape5: TQRShape;
    qrlRelaciones: TQRMemo;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    qrmemoTipoPrestacion: TQRMemo;
    qrlAnulado: TQRLabel;
    sdqFKT: TSDQuery;
    QRLabel34: TQRLabel;
    qrlFNac: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure Imprimir(idautorizacion: integer);
  end;

var
  rptFKTNuevo: TrptFKTNuevo;

implementation

uses unPrincipal, undmprincipal, ansisql, general, strfuncs, sinedit, unsesion,
  uncomunes, math, unRptComunes;

{$R *.DFM}

procedure TrptFKTNuevo.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  iCant :Integer;
begin
  //esto no es muy lindo pero para no complicarme poniendo otras bandas....
  if qrlRelaciones.Lines.Count > 3 then
  begin
    iCant := ((qrlRelaciones.Lines.Count - 3) * 17);
    QRBand1.Height  := QRBand1.Height + iCant;
    QRLabel9.Top    := QRLabel9.Top + iCant;
    QRLabel10.Top   := QRLabel10.Top + iCant;
    QRLabel11.Top   := QRLabel11.Top + iCant;
    QRLabel12.Top   := QRLabel12.Top + iCant;
    QRLabel27.Top   := QRLabel27.Top + iCant;
    QRLabel28.Top   := QRLabel28.Top + iCant;
  end;
end;

procedure TrptFKTNuevo.Imprimir(idautorizacion: integer);
var anulada: boolean; cantsesiones: integer;
    siniestro, orden, recaida, idExped: Integer;
    Resultado: TResultados;
    sAsunto: string;
begin

  sdqFKT.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqFKT);

  siniestro := sdqFKT.FieldByName('au_siniestro').AsInteger;
  orden     := sdqFKT.FieldByName('au_orden').AsInteger;
  recaida   := sdqFKT.FieldByName('au_recaida').AsInteger;
  idExped   := Get_IdExpediente(siniestro, orden, recaida);  // por cambio funcion is_siniestrogobernacion

  CantSesiones := GetCantSesiones(idautorizacion);

  if (sdqFKT.FieldByName('AU_ESTADO').AsString = 'U') or (sdqFKT.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqFKT.FieldByName('AU_ESTADO').AsString = 'V') then
  begin
    Anulada := true;
    sAsunto := ' - ANULACIÓN DE AUTORIZACIÓN ';
  end
  else begin
    Anulada := false;
    sAsunto := '';
  end;

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;

  qrlFechaImpresion.Caption := LugarImpresion(idautorizacion) + ', ' + DateFormat(GetFechaAprobacion(idautorizacion), 'd ''de'' MMMM ''de'' yyyy');
  qrmDireccion.Lines.Text   := DomicilioDelegacion(qriLogo.Picture, siniestro, idExped);    // por cambio funcion is_siniestrogobernacion

  qrlPrestador.Caption   := InitCap(sdqFKT.fieldbyname('ca_descripcion').AsString) + '(' + sdqFKT.fieldbyname('ca_identificador').AsString + ')';
  qrlDomicilio.Caption   := InitCap(sdqFKT.fieldbyname('ca_domicilio').AsString);
  qrlLocalidadCP.Caption := InitCap(sdqFKT.fieldbyname('ca_localidad').AsString + ' (' + sdqFKT.fieldbyname('ca_codpostal').AsString + ')' );
  if (sdqFKT.fieldbyname('ca_codpostal').AsString <> '') then
    qrlProvincia.Caption := InitCap(ValorSql('SELECT pv_descripcion' +
                                              ' FROM ccp_codigopostal, cpv_provincias' +
                                             ' WHERE cp_provincia = pv_codigo' +
                                               ' AND cp_codigo = ' + sdqFKT.fieldbyname('ca_codpostal').AsString))
  else
    qrlProvincia.Caption := '';

  qrlPaciente.Caption := InitCap(sdqFKT.fieldbyname('tj_nombre').AsString) + ' (DNI: ' + GetDNI (sdqFKT.fieldbyname('tj_cuil').AsString) + ')';

  qrlDomicilioPaciente.Caption := InitCap(ValorSql('SELECT art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) ||''  ''||' +
                                                         ' art.utiles.armar_localidad(tj_cpostal, tj_cpostala, tj_localidad, tj_provincia)' +
                                                    ' FROM ctj_trabajador' +
                                                   ' WHERE TJ_CUIL = ''' + sdqFKT.fieldbyname('tj_cuil').AsString + ''''));


  qrlTelPaciente.Caption       := sdqFKT.fieldbyname('telefono').AsString;
  qrlFNac.Caption              := sdqFKT.fieldbyname('tj_fnacimiento').AsString;
  qrlEmpresa.Caption           := InitCap(sdqFKT.fieldbyname('em_nombre').AsString);
  qrlDiagnostico.Caption       := sdqFKT.FieldByName('CIE10').AsString;
  qrlSiniestro.Caption         := sdqFKT.fieldbyname('sincompleto').AsString;
  qrlNroAutorizacion.Caption   := sdqFKT.fieldbyname('au_numauto').AsString;
  qrlTelefono.Caption          := sdqFKT.fieldbyname('ca_telefono').AsString;
  qrlFax.Caption               := sdqFKT.fieldbyname('ca_fax').AsString;
  qrlFechaSolicitud.Caption    := sdqFKT.FieldByName('AU_FECHASOLI').AsString;

  // [Aval,Caracter,Nro.Documento,Usuario de aprobación]
  qrlFirmante.Caption  := ValorSqlEx('SELECT INITCAP(fi_firmante) ' +
                                      ' FROM cfi_firma ' +
                                     ' WHERE fi_id = :IdFirma ', [sdqFKT.FieldByName('AU_AVAL').AsInteger]);

  qrlCaracter.Caption  := ValorSqlEx('SELECT INITCAP(fi_caracter) ' +
                                      ' FROM cfi_firma ' +
                                     ' WHERE fi_id = :IdFirma', [sdqFKT.FieldByName('AU_AVAL').AsInteger]);

  if sdqFKT.FieldByName('AU_USUAPRO').AsString = '' then
    qrlUsuario.Caption := Sesion.Usuario
  else
    qrlUsuario.Caption := ValorSqlEX('SELECT se_nombre FROM use_usuarios WHERE se_usuario = :usuario ', [sdqFKT.FieldByName('AU_USUAPRO').AsString]);

  qrlDocumento.Caption := InitCap(ValorSqlEx('SELECT UPPER(fi_documento) ' +
                                              ' FROM cfi_firma ' +
                                             ' WHERE fi_id = :IdFirma', [sdqFKT.FieldByName('AU_AVAL').AsInteger]));

  qrmemoTipoPrestacion.Lines.Text := sdqFKT.FieldByName('cantidad').AsString + ' ' +
                                     sdqFKT.FieldByName('PR_DESCRIPCION').AsString + ' - ' +
                                     sdqFKT.FieldByName('detalle').AsString;
  qrlPrestacion.Caption       := sdqFKT.FieldByName('on_capitulo').AsString + ' ' +
                                 sdqFKT.FieldByName('on_codigo').AsString + ' ' +
                                 sdqFKT.FieldByName('on_descripcion').AsString;
  qrlGTrabajo.Caption         := sdqFKT.FieldByName('gp_nombre').AsString;
  qrlDelegacion.Caption       := sdqFKT.FieldByName('lg_nombre').AsString;
  qrlRelaciones.Lines.Text    := GetRelaciones(idautorizacion);

  // lo hago para insertar dinamicamente las Sesiones. by LU.
  sdqSesion.Close;
  sdqSesion.SQL.Text := 'SELECT ROWNUM' +
                         ' FROM CTB_TABLAS' +
                        ' WHERE ROWNUM < ' + IntToStr(CantSesiones + 1);
  sdqSesion.Open;

  Resultado := Visualizar(self, GetValores(sAsunto + ' - Siniestro: ' + sdqFKT.fieldbyname('sincompleto').AsString + ' - ' + sdqFKT.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqFKT.FieldByName('tj_documento').AsString, sdqFKT.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqFKT.fieldbyname('sincompleto').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqFKT.FieldByName('ca_fax').AsString {Telefono}, sdqFKT.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqFKT.FieldByName('ca_identificador').AsInteger {IdDest}), [oAlwaysShowDialog, oForceDB, oAgruparReportes]);

  //DoActualizarImpresionAutorizacion(sdqFKT.fieldbyname('au_id').AsInteger, Resultado);

end;


{-------------------------------------------------------------------------------}
end.

