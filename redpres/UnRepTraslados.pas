unit UnRepTraslados;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, unVisualizador, SinEdit,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, unFraPrestador, uncomunes,
  unrptcomunes;

type
  TrptTraslados = class(TQuickRep)
    QRBand1: TQRBand;
    qrmDireccion: TQRMemo;
    qrlTipoTraslado: TQRLabel;
    qrl14: TQRLabel;
    qrlDesde: TQRLabel;
    qrl15: TQRLabel;
    qrldir: TQRLabel;
    qrlDireccionD: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    qrlSolic: TQRLabel;
    qrlSolicitante: TQRLabel;
    qrlcp: TQRLabel;
    qrlCodPostalD: TQRLabel;
    qrlloc: TQRLabel;
    qrlLocalidadD: TQRLabel;
    qrlprov: TQRLabel;
    qrlProvinciaD: TQRLabel;
    qrl6: TQRLabel;
    qrlHasta: TQRLabel;
    qrldireccion: TQRLabel;
    qrlDireccionH: TQRLabel;
    qrl10: TQRLabel;
    qrlCodPostalH: TQRLabel;
    qrlloc2: TQRLabel;
    qrlLocalidadH: TQRLabel;
    qrlprov2: TQRLabel;
    qrlProvinciaH: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    qrlc: TQRLabel;
    qrlCuil: TQRLabel;
    qrlNombre: TQRLabel;
    qrl1: TQRLabel;
    qrlSinOrdRec: TQRLabel;
    qrl19: TQRLabel;
    qrl16: TQRLabel;
    qrlNroAut: TQRLabel;
    qrldatostraslado: TQRLabel;
    QRBand2: TQRBand;
    qrlfec: TQRLabel;
    qrlhora: TQRLabel;
    QRBand3: TQRBand;
    qrdbFecha: TQRDBText;
    qrdbHora: TQRDBText;
    sdqTurnos: TSDQuery;
    dsTurnos: TDataSource;
    QRBand4: TQRBand;
    qrlgest: TQRLabel;
    qrlav: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlAval: TQRLabel;
    QRShape2: TQRShape;
    QRShape10: TQRShape;
    qrlley: TQRLabel;
    qrlley2: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    sdqTraslados: TSDQuery;
    dsTraslados: TDataSource;
    QRShape13: TQRShape;
    qrldatopres: TQRLabel;
    qrln: TQRLabel;
    qrl31: TQRLabel;
    qrl32: TQRLabel;
    qrlProvincia: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlPrestador: TQRLabel;
    qrlTelefono: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    qrltel: TQRLabel;
    qrl34: TQRLabel;
    qrlTipoPrestacion: TQRLabel;
    qrldatostra: TQRLabel;
    qrlNomPrestEmpDesde: TQRLabel;
    qrlNomPrestEmpHasta: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    qrl23: TQRLabel;
    qrlFax: TQRLabel;
    qrl36: TQRLabel;
    qrlTelTrabajador: TQRLabel;
    qrlTelPrestEmpDesde: TQRLabel;
    qrlTelPrestEmpHasta: TQRLabel;
    qrlDocumento: TQRLabel;
    QRBand5: TQRBand;
    qriLogo: TQRImage;
    qrlTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    qrlDiagnostico: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlFechaSolicitud: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape17: TQRShape;
    qrlMotivo: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlRelaciones: TQRMemo;
    qrlPrestacion: TQRLabel;
    qrlAnulado: TQRLabel;
    QRLabel6: TQRLabel;
    qrlDomicilioTrab: TQRLabel;
    QRLabel7: TQRLabel;
    qrlFNac: TQRLabel;
    QRLabel9: TQRLabel;
    qrlEmpresa: TQRLabel;
    ChildBand1: TQRChildBand;
    qrlElementosContencion: TQRLabel;
    qrlElContencion1: TQRLabel;
    qrlElContencion2: TQRLabel;
    qrlElContencion3: TQRLabel;
    qrlAcompaniante: TQRLabel;
    qrlEspera: TQRLabel;
    qrlLeyendaEspera: TQRLabel;
    qrlRetorno: TQRLabel;
    qrlobs: TQRLabel;
    qrmObservaciones: TQRMemo;
    qrltur: TQRLabel;
    qrlInfoAdic: TQRLabel;
    qrlVueloIda: TQRLabel;
    qrdbVueloIda: TQRLabel;
    qrdbVueloVuelta: TQRLabel;
    qrlVueloVuelta: TQRLabel;
    qrdbTarifa: TQRLabel;
    qrlTarifa: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel8: TQRLabel;
    qrlKm: TQRLabel;
  private
    FDni: string;
  public
    fraPrestadorAprob: TfraPrestador;
    function Imprimir(idautorizacion: integer): TResultados;

    property Dni      : String  read FDni      write FDni;
  end;

var
  rptTraslados: TrptTraslados;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, General, Internet, unSesion,
  unSeleccionTurnosTraslados, strfuncs;

{$R *.DFM}

{ TrptTraslados }

{--------------------------------------------------------------------------------------------------------------------------------}
function TrptTraslados.Imprimir(idautorizacion: integer): TResultados;
var
  FechaImpresion, ssql1, ssql2, solicitante, TipoTraslado, Desde, Hasta, EContencion1,
  EContencion2, EContencion3, Aval, Documento, ProvinciaPrest,
  codprestacion, Diagnostico, siniestro, orden, recaida, numauto: string; Anulada: boolean;
begin
  //
  solicitante  := '';
  TipoTraslado := '';
  Desde        := '';
  Hasta        := '';
  EContencion1 := '';
  EContencion2 := '';
  EContencion3 := '';
  Aval         := '';
  Documento    := '';
  ssql1        := '';
  ssql2        := '';
  ProvinciaPrest := '';
  Diagnostico  := '';
  anulada := false;

  sdqTraslados.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqTraslados);

  siniestro := sdqTraslados.FieldByName('au_siniestro').AsString;
  orden := sdqTraslados.FieldByName('au_orden').AsString;
  recaida := sdqTraslados.FieldByName('au_recaida').AsString;
  numauto := sdqTraslados.FieldByName('au_numauto').AsString;
  CodPrestacion := sdqTraslados.FieldByName('pr_codigo').AsString;

  with TfrmSeleccionTurnosTraslados.Create(Application.MainForm) do
  try
    SetDatos(StrToInt(Siniestro), StrToInt(Orden), StrToInt(Recaida), StrToInt(NumAuto), Anulada);
    if not(ShowModal = mrOk) then Exit;
    SSQL2 := ' SELECT tr_fecha, tr_hora, mt_descripcion ' +
               ' FROM str_traslados, smt_motanultraslados ' +
              ' WHERE tr_siniestro = ' + Siniestro +
                ' AND tr_orden = ' + Orden +
                ' AND tr_recaida = ' + Recaida +
                ' AND tr_numauto = ' + NumAuto +
                ' AND tr_codanulacion = mt_id(+) ' +
                ' ' + ARTCheckListBox.InSQL_IntegerValues(' TR_NUMTRASLADO ', False) +
                ' AND tr_fechabaja IS NULL ';
    OpenQuery(sdqTurnos, ssql2);

    ssql2 := ' select 1 from str_traslados ' +
             '  where tr_siniestro = :sin ' +
                ' and tr_orden = :ord ' +
                ' and tr_recaida = :rec ' +
                ' and tr_numauto = :auto ' +
                ' ' + ARTCheckListBox.InSQL_IntegerValues(' TR_NUMTRASLADO ', False) +
                ' and tr_fechaanulacion is not null ';

    if ((sdqTraslados.FieldByName('AU_ESTADO').AsString = 'U') or (sdqTraslados.FieldByName('AU_ESTADO').AsString = 'N') or
        (sdqTraslados.FieldByName('AU_ESTADO').AsString = 'V')) or (ExisteSqlEx(ssql2, [siniestro, orden, recaida, numauto])) then
      Anulada := true
    else
      Anulada := false;

  finally
    Free;
  end;
  application.MainForm.SetFocus;  //sino se queda sin activeform y genera una excepción en unVisualizador

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end
  else
    qrlMotivo.Width := 0;

  if not sdqTraslados.FieldByName('AU_PRESTDESDE').IsNull then
  begin
    qrlNomPrestEmpDesde.Caption := initcap(ValorSql('Select ca_descripcion from cpr_prestador where ca_identificador = ' + sdqTraslados.FieldByName('AU_PRESTDESDE').Text));
    qrlTelPrestEmpDesde.Caption := 'Tel: ' + ValorSql('Select ca_codarea || '' '' || ca_telefono from cpr_prestador where ca_identificador = ' + sdqTraslados.FieldByName('AU_PRESTDESDE').Text);
  end else if sdqTraslados.FieldByName('AU_TDESDE').Text = 'E' then
  begin
    qrlNomPrestEmpDesde.Caption := initcap(sdqTraslados.FieldByName('em_nombre').AsString);
    qrlTelPrestEmpDesde.Caption := 'Tel: ' + sdqTraslados.FieldByName('em_telefonos').AsString;
  end;

  if not sdqTraslados.FieldByName('AU_PRESTHASTA').IsNull then
  begin
    qrlNomPrestEmpHasta.Caption := initcap(ValorSql('Select ca_descripcion from cpr_prestador where ca_identificador = ' + sdqTraslados.FieldByName('AU_PRESTHASTA').Text));
    qrlTelPrestEmpHasta.Caption := 'Tel: ' + ValorSql('Select ca_codarea || '' '' || ca_telefono from cpr_prestador where ca_identificador = ' + sdqTraslados.FieldByName('AU_PRESTHASTA').Text);
  end else if sdqTraslados.FieldByName('AU_THASTA').Text = 'E' then
  begin
    qrlNomPrestEmpHasta.Caption := initcap(sdqTraslados.FieldByName('em_nombre').AsString);
    qrlTelPrestEmpHasta.Caption := 'Tel: ' +  sdqTraslados.FieldByName('em_telefonos').AsString;
  end;

  TipoTraslado   := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''TRAST'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_ELTRASLADO').Text,True) );
  Solicitante    := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''TRASS'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_SOLICITANTE').Text,True) );
  Desde          := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''TRASD'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_TDESDE').Text,True) );
  Hasta          := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''TRASD'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_THASTA').Text,True) );
  EContencion1   := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''SUBPR'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_ELCONTENCION').Text,True) );
  EContencion2   := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''SUBPR'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_ELCONTENCION2').Text,True) );
  EContencion3   := ValorSql('Select tb_descripcion From ctb_tablas Where tb_clave = ''SUBPR'' ' +
                             ' and tb_codigo = ' + SqlString(sdqTraslados.FieldByName('AU_ELCONTENCION3').Text,True) );
  Aval           := ValorSql('Select fi_firmante From cfi_firma ' +
                             ' where fi_id = ' + SqlInt(sdqTraslados.FieldByName('AU_AVAL').AsInteger));
  Documento      := ValorSql('Select fi_documento from cfi_firma ' +
                             ' where fi_id = ' + SqlInt(sdqTraslados.FieldByName('AU_AVAL').AsInteger));

  ProvinciaPrest := ValorSql('Select pv_descripcion from cpv_provincias where pv_codigo = ''' + sdqTraslados.FieldByName('CA_PROVINCIA').Text + '''' );

  FechaImpresion := ValorSql('SELECT trunc(au_fechapro) ' +
                              ' FROM sau_autorizaciones ' +
                             ' WHERE au_siniestro = ' + Siniestro +
                               ' AND au_orden = ' + Orden +
                               ' AND au_recaida = ' + Recaida +
                               ' AND au_numauto = ' + NumAuto);

  if (CodPrestacion = '449200') or (CodPrestacion = '449300') or (CodPrestacion = '449400') then    // Si es Ambulancia, imprime el diagnostico.
     Diagnostico := 'Diagnóstico: ' + ValorSql('SELECT dg_descripcion FROM sex_expedientes, cdg_diagnostico ' +
                                                'WHERE ex_diagnosticooms = dg_codigo ' +
                                                 ' AND ex_siniestro = ' + Siniestro +
                                                 ' AND ex_orden = ' + Orden +
                                                 ' AND ex_recaida = ' + Recaida);

  if (CodPrestacion = '449600') or (CodPrestacion = '449700') then
  //camarillo - 14/02/07 - si es un traslado en avion, muestro los datos correspondientes
  begin
    qrdbVueloIda.Caption      := sdqTraslados.FieldByName('AU_NROVUELOIDA').AsString;
    qrdbVueloVuelta.Caption   := sdqTraslados.FieldByName('AU_NROVUELOVUELTA').AsString;
    qrdbTarifa.Caption        := FormatFloat('$ #,##0.00', sdqTraslados.FieldByName('AU_IMPOAPRO').AsCurrency);
  end
  else begin
    qrlInfoAdic.Caption     := '';
    qrlVueloIda.Caption     := '';
    qrlVueloVuelta.Caption  := '';
    qrdbVueloIda.Caption    := '';
    qrdbVueloVuelta.Caption := '';
    qrlTarifa.Caption       := '';
    qrdbTarifa.Caption      := '';
  end;

  if (FechaImpresion <> '') then
   qrlFechaImpresion.Caption := 'Buenos Aires, ' + DateFormat(StrToDate(FechaImpresion), 'd ''de'' MMMM ''de'' yyyy');

  qrlPrestador.Caption    := initcap(sdqTraslados.FieldByName('CA_DESCRIPCION').Text) + '(' +
                             sdqTraslados.FieldByName('CA_IDENTIFICADOR').asstring + ')';
  qrlDomicilio.Caption    := initcap(sdqTraslados.FieldByName('CA_DOMICILIO').Text + ' (' +
                             sdqTraslados.FieldByName('CA_CODPOSTAL').Text + ') ' +
                             sdqTraslados.FieldByName('CA_LOCALIDAD').Text);
  qrlProvincia.Caption    := initcap(ProvinciaPrest);
  qrlTelefono.Caption     := sdqTraslados.FieldByName('CA_TELEFONO').Text;
  qrlFax.Caption          := sdqTraslados.FieldByName('CA_FAX').Text;
  qrlFechaSolicitud.Caption := sdqTraslados.FieldByName('au_fechasoli').AsString;
  qrlCuil.Caption         := sdqTraslados.FieldByName('tj_cuil').AsString;
  qrlNombre.Caption       := initcap(sdqTraslados.FieldByName('tj_nombre').AsString);
  qrlTelTrabajador.Caption:= sdqTraslados.FieldByName('telefono').AsString;
  qrlFNac.Caption         := sdqTraslados.FieldByName('tj_fnacimiento').AsString;
  qrlEmpresa.Caption      := InitCap(sdqTraslados.fieldbyname('em_nombre').AsString);
  qrlDomicilioTrab.Caption := sdqTraslados.FieldByName('domicilio').AsString;

  qrlSinOrdRec.Caption    := Siniestro + ' - ' + Orden + ' - ' + Recaida;
  qrlNroAut.Caption       := NumAuto;
  qrlTipoTraslado.Caption := TipoTraslado;
  qrlSolicitante.Caption  := Solicitante;
  qrlDiagnostico.Caption  := Diagnostico;

  qrlDesde.Caption         := IIF(Desde = 'OTRO', ' ', 'Domicilio del/a ' + Desde);
  qrlDireccionD.Caption    := sdqTraslados.FieldByName('AU_DCALLE').Text + ' Nro. ' +
                              sdqTraslados.FieldByName('AU_DNUMERO').Text + ' ' +
                              sdqTraslados.FieldByName('AU_DPISO').Text + ' ' +
                              sdqTraslados.FieldByName('AU_DDEPARTAMENTO').Text;
  qrlCodPostalD.Caption    := sdqTraslados.FieldByName('AU_DCPOSTAL').Text;
  qrlLocalidadD.Caption    := sdqTraslados.FieldByName('AU_DLOCALIDAD').Text;
  qrlProvinciaD.Caption    := sdqTraslados.FieldByName('DPROVINCIA').Text;

  qrlHasta.Caption         := IIF(Hasta = 'OTRO', ' ', 'Domicilio del/a ' + Hasta);
  qrlDireccionH.Caption    := sdqTraslados.FieldByName('AU_HCALLE').Text + ' Nro. ' +
                              sdqTraslados.FieldByName('AU_HNUMERO').Text + ' ' +
                              sdqTraslados.FieldByName('AU_HPISO').Text + ' ' +
                              sdqTraslados.FieldByName('AU_HDEPARTAMENTO').Text;
  qrlCodPostalH.Caption    := sdqTraslados.FieldByName('AU_HCPOSTAL').Text;
  qrlLocalidadH.Caption    := sdqTraslados.FieldByName('AU_HLOCALIDAD').Text;
  qrlProvinciaH.Caption    := sdqTraslados.FieldByName('HPROVINCIA').Text;

  qrlKm.Caption            := sdqTraslados.FieldByName('KMTOTAL').Text;

  qrlElContencion1.Caption := EContencion1;
  qrlElContencion2.Caption := EContencion2;
  qrlElContencion3.Caption := EContencion3;

  qrlAcompaniante.Caption  := IIF(sdqTraslados.FieldByName('AU_ACOMPANANTE').Text ='S','Con Acompañante','Sin Acompañante');
  qrlRetorno.Caption       := IIF(sdqTraslados.FieldByName('AU_RETORNO').Text ='S','Con Retorno','Sin Retorno');

  qrlEspera.Caption        := IIF(sdqTraslados.FieldByName('AU_ESPERA').Text ='S','Con Espera','Sin Espera');
  if qrlEspera.Caption = 'Con Espera' then
    qrlLeyendaEspera.Caption := 'Pasando la/s ....... hs. de espera, pedir autorización al 4338-4700';

  if sdqTraslados.FieldByName('AU_USUAPRO').AsString = '' then
    qrlUsuario.Caption := Sesion.Usuario
  else
    qrlUsuario.Caption := ValorSqlEX('SELECT se_nombre FROM use_usuarios WHERE se_usuario = :usuario ', [sdqTraslados.FieldByName('AU_USUAPRO').AsString]);


  qrlAval.Caption              := initcap(Aval);
  qrlDocumento.Caption         := Documento;
  qrlTipoPrestacion.Caption    := sdqTraslados.FieldByName('pr_descripcion').Asstring;
  qrlPrestacion.Caption        := sdqTraslados.FieldByName('on_capitulo').AsString + ' ' + sdqTraslados.FieldByName('on_codigo').AsString + ' ' + sdqTraslados.FieldByName('on_descripcion').AsString;
  qrlRelaciones.Lines.Text     := GetRelaciones(sdqTraslados.FieldByName('au_id').AsInteger);
  qrmObservaciones.Lines.Text  := sdqTraslados.FieldByName('AU_OBSERVACIONESIMPRESION').AsString;

  qrlGTrabajo.Caption     := sdqTraslados.FieldByName('gp_nombre').AsString;
  qrlDelegacion.Caption   := sdqTraslados.FieldByName('lg_nombre').AsString;
  qrmDireccion.Lines.Text := DomicilioDelegacion(qriLogo.Picture, sdqTraslados.FieldByName('au_siniestro').AsInteger, sdqTraslados.FieldByName('ex_id').AsInteger);

  Result := Visualizar(Self, GetValores(' - Siniestro: ' + sdqTraslados.FieldByName('siniestrocomp').AsString + ' - ' + sdqTraslados.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqTraslados.FieldByName('tj_documento').AsString, sdqTraslados.FieldByName('CA_DIRELECTRONICA').AsString),
                       GetValoresFax('AMED', sdqTraslados.FieldByName('siniestrocomp').AsString, 'T' {TipoDoc}, 'P' {TipoDest},
                       sdqTraslados.FieldByName('CA_FAX').AsString {Telefono}, sdqTraslados.FieldByName('ca_descripcion').AsString {Nombre},
                       sdqTraslados.FieldByName('ca_identificador').AsInteger {IdDest}), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

  DoActualizarImpresionAutorizacion(sdqTraslados.fieldbyname('au_id').AsInteger, Result);
  //Application.ProcessMessages;

end;

{--------------------------------------------------------------------------------------------------------------------------------}
end.
