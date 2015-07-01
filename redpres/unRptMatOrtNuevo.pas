unit unRptMatOrtNuevo;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt,
  QRCtrls, general, unsesion, unvisualizador, strfuncs, cuit, uncomunes, undmprincipal,
  DB, SDEngine, ansisql;

type
  TrptMatOrtNuevo = class(TQuickRep)
    QRBand5: TQRBand;
    qriLogo: TQRImage;
    qrlTitulo: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlMaterial: TQRLabel;
    QRLabel2: TQRLabel;
    qrlPaciente: TQRLabel;
    QRLabel3: TQRLabel;
    qrlSiniestro: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel4: TQRLabel;
    qrlDomicilio: TQRLabel;
    QRLabel7: TQRLabel;
    qrlFecha: TQRLabel;
    QRLabel5: TQRLabel;
    QRMemo1: TQRMemo;
    qrlTelPaciente: TQRLabel;
    QRLabel8: TQRLabel;
    qrlAnulado: TQRLabel;
    sdqMatOrt: TSDQuery;
    QRLabel6: TQRLabel;
    qrlEmpresa: TQRLabel;
    QRLabel9: TQRLabel;
    qrlFNac: TQRLabel;
    procedure Imprimir(idautorizacion: integer);
    function LugarImpresion(sUsuario: String = ''): String;
    function GetFechaAprobacion: TDateTime;
    procedure DoActualizarImpresionAutorizacion(iSiniestro, iOrden, iRecaida, iNumeroAutorizacion: Integer;
                                                         Accion: TResultados = []);

  private
  public
  end;

var
  rptMatOrtNuevo: TrptMatOrtNuevo;

implementation

{$R *.DFM}



procedure TrptMatOrtNuevo.Imprimir(idautorizacion: integer);
var anulada: boolean; Resultado: TResultados;
begin

  sdqMatOrt.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqMatOrt);

  if (sdqMatOrt.FieldByName('AU_ESTADO').AsString = 'U') or (sdqMatOrt.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqMatOrt.FieldByName('AU_ESTADO').AsString = 'V') then
    Anulada := true
  else
    Anulada := false;

  if Is_SiniestroDeGobernacion(sdqMatOrt.FieldByName('ex_id').AsInteger) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;
  qrlFechaImpresion.Caption := LugarImpresion + ', ' + DateFormat(GetFechaAprobacion, 'd ''de'' MMMM ''de'' yyyy');
  qrlMaterial.Caption       := sdqMatOrt.fieldbyname('detalle').AsString;
  qrlPaciente.Caption       := InitCap(sdqMatOrt.fieldbyname('tj_nombre').AsString) + ' (DNI: ' + GetDNI (sdqMatOrt.fieldbyname('tj_cuil').AsString) + ')';
  qrlTelPaciente.Caption    := sdqMatOrt.fieldbyname('telefono').AsString;
  qrlSiniestro.Caption      := InitCap(sdqMatOrt.fieldbyname('siniestrocomp').AsString);
  qrlDomicilio.Caption      := InitCap(sdqMatOrt.fieldbyname('domicilio').AsString);
  qrlFecha.Caption          := DateToStr(DBDate);
  qrlFNac.Caption           := sdqMatOrt.FieldByName('tj_fnacimiento').AsString;
  qrlEmpresa.Caption        := InitCap(sdqMatOrt.fieldbyname('em_nombre').AsString);

  Resultado := Visualizar(self, GetValores(' - Siniestro: ' + sdqMatOrt.fieldbyname('siniestrocomp').AsString + ' - ' + sdqMatOrt.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqMatOrt.FieldByName('tj_documento').AsString, sdqMatOrt.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqMatOrt.fieldbyname('siniestrocomp').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqMatOrt.FieldByName('ca_fax').AsString {Telefono}, sdqMatOrt.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqMatOrt.FieldByName('ca_identificador').AsInteger {IdDest}), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

  DoActualizarImpresionAutorizacion(sdqMatOrt.fieldbyname('au_siniestro').AsInteger, sdqMatOrt.fieldbyname('au_orden').AsInteger, sdqMatOrt.fieldbyname('au_recaida').AsInteger, sdqMatOrt.fieldbyname('au_numauto').AsInteger, Resultado);
  //Application.ProcessMessages;

end;


function TrptMatOrtNuevo.LugarImpresion(sUsuario: String = ''): String;
begin
  if sUsuario = '' then
    sUsuario := ValorSQLEx('SELECT au_usuapro' +
                            ' FROM sau_autorizaciones' +
                           ' WHERE au_siniestro = :V1' +
                             ' AND au_orden     = :V2' +
                             ' AND au_recaida   = :V3' +
                             ' AND au_numauto   = :V4', [sdqMatOrt.FieldByName('au_siniestro').AsString, sdqMatOrt.FieldByName('au_orden').AsString, sdqMatOrt.FieldByName('au_recaida').AsString, sdqMatOrt.FieldByName('au_numauto').AsString]);

  if (sUsuario > '') then
    Result := ValorSqlEx('SELECT IIF_CHAR(lg_localidad, :V1, INITCAP(:V2), INITCAP(lg_localidad))' +
                          ' FROM dlg_delegaciones, usc_sectores, use_usuarios' +
                         ' WHERE se_sector = sc_codigo' +
                           ' AND lg_codigo = sc_delegacion' +
                           ' AND se_usuario = :Usuario', ['CAPITAL FEDERAL', 'BUENOS AIRES', sUsuario])
  else
    Result := 'Buenos Aires';
end;


function TrptMatOrtNuevo.GetFechaAprobacion: TDateTime;
begin
  Result := ValorSQLDateTimeEx('SELECT au_fechapro' +
                                ' FROM sau_autorizaciones' +
                               ' WHERE au_siniestro = :V1' +
                                 ' AND au_orden     = :V2' +
                                 ' AND au_recaida   = :V3' +
                                 ' AND au_numauto   = :V4', [sdqMatOrt.FieldByName('au_siniestro').AsString, sdqMatOrt.FieldByName('au_orden').AsString, sdqMatOrt.FieldByName('au_recaida').AsString, sdqMatOrt.FieldByName('au_numauto').AsString]);
end;

procedure TrptMatOrtNuevo.DoActualizarImpresionAutorizacion(iSiniestro, iOrden, iRecaida, iNumeroAutorizacion: Integer;
                                                         Accion: TResultados = []);
var
  sSql: String;
  bEsFechaImprNula, bEsFechaMailNula, EsFechaMailAnulNula: boolean;
begin
  sSql := ' SELECT au_fechaimpresion, au_fechamail, AU_FECHAENVIOANUL ' +
            ' FROM art.sau_autorizaciones ' +
           ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
             ' AND au_orden = ' + SqlValue(iOrden) +
             ' AND au_recaida = ' + SqlValue(iRecaida) +
             ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
  with GetQuery(sSql) do
  try
    bEsFechaImprNula := (FieldByName('AU_FECHAIMPRESION').IsNull);
    bEsFechaMailNula := (FieldByName('AU_FECHAMAIL').IsNull);
    EsFechaMailAnulNula := (FieldByName('AU_FECHAENVIOANUL').IsNull);
  finally
    Free;
  end;

  if sdqMatOrt.FieldByName('AU_ESTADO').AsString = 'U' then     //aprobación anulada
  begin                                                        //DGASTAL 21/07/2011
    if (rMail in Accion) and EsFechaMailAnulNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET AU_FECHAENVIOANUL = sysdate, AU_USUENVIOANUL = :usuario ' +
        ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
          ' AND au_orden = ' + SqlValue(iOrden) +
          ' AND au_recaida = ' + SqlValue(iRecaida) +
          ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
      EjecutarSqlEX(sSql, [Sesion.UserID]);
    end;
  end
  else
  begin
    if (rImpresora in Accion) and bEsFechaImprNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_fechaimpresion = trunc(sysdate) ' +
        ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
          ' AND au_orden = ' + SqlValue(iOrden) +
          ' AND au_recaida = ' + SqlValue(iRecaida) +
          ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
      EjecutarSql(sSql);
    end;

    if (rMail in Accion) and bEsFechaMailNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_fechamail = trunc(sysdate) ' +
        ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
          ' AND au_orden = ' + SqlValue(iOrden) +
          ' AND au_recaida = ' + SqlValue(iRecaida) +
          ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
      EjecutarSql(sSql);
    end;
  end;

end;


end.
