unit UnRptFonoaudNuevo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, unvisualizador, general, strfuncs, undmprincipal, unsesion, cuit,
  ansisql, uncomunes, math, unrptcomunes;

type
  TrptFonoaudNuevo = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrmDireccion: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    qrlProvincia: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlLocalidadCP: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlDiagnostico: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlPaciente: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    qrlFirmante: TQRLabel;
    qrlCaracter: TQRLabel;
    QRMemo1: TQRMemo;
    sdqSesion: TSDQuery;
    dsSesion: TDataSource;
    QRBand3: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    qrlTelefono: TQRLabel;
    QRLabel18: TQRLabel;
    qrlNroAutorizacion: TQRLabel;
    QRLabel19: TQRLabel;
    qrlUsuario: TQRLabel;
    QRLabel20: TQRLabel;
    qrlDocumento: TQRLabel;
    QRLabel16: TQRLabel;
    qrlDomicilioPaciente: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    qrlFax: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    qrlTelPaciente: TQRLabel;
    QRLabel24: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel25: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    QRLabel26: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape7: TQRShape;
    qrlGTrabajo: TQRLabel;
    QRLabel30: TQRLabel;
    qrlRelaciones: TQRMemo;
    QRLabel33: TQRLabel;
    QRLabel31: TQRLabel;
    qrmemoTipoPrestacion: TQRMemo;
    qrlAnulado: TQRLabel;
    sdqFonoaud: TSDQuery;
    QRLabel27: TQRLabel;
    qrlFNac: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure Imprimir(idautorizacion: integer);

  end;

var
  rptFonoaudNuevo: TrptFonoaudNuevo;

implementation

uses unPrincipal;

{$R *.DFM}

procedure TrptFonoaudNuevo.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  iCant :Integer;
begin
  //esto no es muy lindo pero para no complicarme poniendo otras bandas....total casi nunca va a pasar...
  if qrlRelaciones.Lines.Count > 3 then
  begin
    iCant := ((qrlRelaciones.Lines.Count - 3) * 17);
    QRBand1.Height  := QRBand1.Height + iCant;
    QRLabel9.Top    := QRLabel9.Top + iCant;
    QRLabel10.Top   := QRLabel10.Top + iCant;
    QRLabel11.Top   := QRLabel11.Top + iCant;
    QRLabel12.Top   := QRLabel12.Top + iCant;
  end;
end;

procedure TrptFonoaudNuevo.Imprimir(idautorizacion: integer);
var anulada: boolean; cantsesiones: integer; Resultado: TResultados;
begin

  sdqFonoaud.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqFonoaud);
  cantsesiones := GetCantSesiones(idautorizacion);
  if (sdqFonoaud.FieldByName('AU_ESTADO').AsString = 'U') or (sdqFonoaud.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqFonoaud.FieldByName('AU_ESTADO').AsString = 'V') then
    Anulada := true
  else
    Anulada := false;

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;
  qrmDireccion.Lines.Text   := DomicilioDelegacion(qriLogo.Picture, sdqFonoaud.fieldbyname('au_siniestro').AsInteger, sdqFonoaud.fieldbyname('ex_id').AsInteger);   // por cambio nueva funcion de is_siniestrode
  qrlFechaImpresion.Caption := LugarImpresion(idautorizacion) + ', ' + DateFormat(GetFechaAprobacion(idautorizacion), 'd ''de'' MMMM ''de'' yyyy');
  qrlPrestador.Caption      := InitCap(sdqFonoaud.fieldbyname('ca_descripcion').AsString) + ' (' + sdqFonoaud.fieldbyname('ca_identificador').AsString + ')';
  qrlDomicilio.Caption      := InitCap(sdqFonoaud.fieldbyname('ca_domicilio').AsString);
  qrlLocalidadCP.Caption    := InitCap(sdqFonoaud.fieldbyname('ca_localidad').AsString + ' (' + sdqFonoaud.fieldbyname('ca_codpostal').AsString + ')' );
  qrlProvincia.Caption      := InitCap(sdqFonoaud.fieldbyname('pv_descripcion').AsString);
  qrlPaciente.Caption    := InitCap(sdqFonoaud.fieldbyname('tj_nombre').AsString) + ' (DNI: ' + GetDNI (sdqFonoaud.fieldbyname('tj_cuil').AsString) + ')';
  qrlDomicilioPaciente.Caption := InitCap(sdqFonoaud.fieldbyname('domicilio').AsString);
  qrlTelPaciente.Caption := sdqFonoaud.FieldByName('TELEFONO').Text;
  qrlEmpresa.Caption     := InitCap(sdqFonoaud.FieldByName('EM_NOMBRE').AsString);
  qrlDiagnostico.Caption := InitCap(sdqFonoaud.FieldByName('ex_diagnostico').AsString);
  qrlSiniestro.Caption   := InitCap(sdqFonoaud.FieldByName('siniestrocomp').AsString);
  qrlTelefono.Caption    := sdqFonoaud.FieldByName('ca_telefono').AsString;
  qrlFax.Caption         := sdqFonoaud.FieldByName('ca_fax').AsString;
  qrlFechaSolicitud.Caption  := sdqFonoaud.FieldByName('au_fechasoli').AsString;
  qrlNroAutorizacion.Caption := sdqFonoaud.FieldByName('au_numauto').AsString;
  qrlFNac.Caption        := sdqFonoaud.FieldByName('tj_fnacimiento').AsString;


  // [Aval,Caracter,Nro.Documento,Usuario de aprobación]
  qrlFirmante.Caption  := ValorSqlEx('SELECT INITCAP(fi_firmante) ' +
                                        ' FROM cfi_firma ' +
                                       ' WHERE fi_id = :IdFirma ', [sdqFonoaud.FieldByName('AU_AVAL').AsInteger]);
  qrlCaracter.Caption  := ValorSqlEx('SELECT INITCAP(fi_caracter) ' +
                                        ' FROM cfi_firma ' +
                                       ' WHERE fi_id = :IdFirma ', [sdqFonoaud.FieldByName('AU_AVAL').AsInteger]);

  if sdqFonoaud.FieldByName('AU_USUAPRO').AsString = '' then
    qrlUsuario.Caption := Sesion.Usuario
  else
    qrlUsuario.Caption := ValorSqlEX('SELECT initcap(se_nombre) FROM use_usuarios WHERE se_usuario = :usuario ', [sdqFonoaud.FieldByName('AU_USUAPRO').AsString]);

  qrlDocumento.Caption := InitCap(ValorSqlEx('SELECT UPPER(fi_documento) ' +
                                                ' FROM cfi_firma ' +
                                               ' WHERE fi_id = :IdFirma', [sdqFonoaud.FieldByName('AU_AVAL').AsInteger]));

  qrlGTrabajo.Caption := sdqFonoaud.FieldByName('gp_nombre').AsString;
  qrlDelegacion.Caption := sdqFonoaud.FieldByName('lg_nombre').AsString;
  qrmemoTipoPrestacion.Lines.Text := sdqFonoaud.FieldByName('cantidad').AsString + ' ' +
                                     sdqFonoaud.FieldByName('PR_DESCRIPCION').AsString + ' - ' +
                                     sdqFonoaud.FieldByName('detalle').AsString;
  qrlPrestacion.Caption := sdqFonoaud.FieldByName('on_capitulo').AsString + ' ' +
                           sdqFonoaud.FieldByName('on_codigo').AsString + ' ' +
                           sdqFonoaud.FieldByName('on_descripcion').AsString;
  qrlRelaciones.Lines.Text := GetRelaciones(idautorizacion);

  sdqSesion.Close;
  sdqSesion.SQL.Text := 'SELECT ROWNUM' +
                         ' FROM CTB_TABLAS' +
                        ' WHERE ROWNUM < ' + IntToStr(cantsesiones + 1);
  sdqSesion.Open;

  Resultado := Visualizar(self, GetValores(' - Siniestro: ' + sdqFonoaud.fieldbyname('siniestrocomp').AsString + ' - ' + sdqFonoaud.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqFonoaud.FieldByName('tj_documento').AsString, sdqFonoaud.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqFonoaud.fieldbyname('siniestrocomp').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqFonoaud.FieldByName('ca_fax').AsString {Telefono}, sdqFonoaud.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqFonoaud.FieldByName('ca_identificador').AsInteger {IdDest}), [oForceShowModal, oAlwaysShowDialog, oForceDB]);

  DoActualizarImpresionAutorizacion(sdqFonoaud.fieldbyname('au_id').AsInteger, Resultado);
  //Application.ProcessMessages;

end;

{-------------------------------------------------------------------------------}
end.
