unit unMensajeAlertaAGA;

interface

uses
  ExtCtrls, Controls, Classes, unMensajeAlerta;

const
  CLASE_CARPETASTRANSITOUSU = 'TMensajeAlertaAGA_CarpetasTransitoUsu';

type
  TMensajeAlertaAGA_CarpetasTransitoUsu = class(TMensajeAlertaSingle)
  private
  public
    procedure Inicializar; override;
  end;

procedure DoIniciarCarpetasEnTransitoUsu;
procedure DoSuspenderCarpetasEnTransitoUsu;

implementation

uses
  AnsiSql, unArt, unConstantArchivo, unSesion, unFrmConsultaCarpetas;

procedure TMensajeAlertaAGA_CarpetasTransitoUsu.Inicializar;
var
  sMensaje, sSql: String;
begin
  inherited;

  sMensaje := 'Existen carpetas en su poder a las que debe dar ingreso con la opción: ''Recepción de Carpetas desde GyD'' ' +
              'y para su retorno debe usar la opción: ''Devolución de Carpetas a GyD''';

  sSql := 'SELECT 1 ' +
            'FROM USE_USUARIOS, RSC_SOLICITUDCARPETA RSC1, RAR_ARCHIVO ' +
           'WHERE AR_ID = RSC1.SC_IDARCHIVO ' +
             'AND RSC1.SC_ID = (SELECT MAX(SC_ID) ' +
                                 'FROM ARCHIVO.RSC_SOLICITUDCARPETA RSC2 ' +
                                'WHERE RSC2.SC_IDARCHIVO = RSC1.SC_IDARCHIVO) ' +
             'AND RSC1.SC_FECHARECEPCION IS NOT NULL ' +
             'AND AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) + ' ' +
             'AND AR_UBICACION = ' + SqlValue(Sesion.UserId) + ' ' +
             'AND AR_ESTADO = ' + SqlValue(ESTADOCARPETA_ENTRANSITO_USU) + ' ' +
             'AND AR_FECHA_ESTADO < SYSDATE - (1 / 24 * DECODE(SE_DELEGACION, ' + SqlValue(ID_DLG_CENTRAL) + ', 24, 48)) ' +
             'AND RSC1.SC_USUARIOSOLICITUD = ' + SqlValue(Sesion.UserId) + ' ' +
             'AND RSC1.SC_USUARIOSOLICITUD = SE_USUARIO';

  MinutosIntervalo    := 1;
  MinutosVerificacion := 30;
  SqlVerificacion     := sSql;
  Mensaje             := sMensaje;
  SegundosMensaje     := 180;

  with BotonesAlarma.Add do
    begin
      Titulo      := 'Buscar Carpetas en Tránsito';
      IndiceIcono := 3;   // Búsqueda
      Evento      := TFrmConsultaCarpetas.DoMostrarCarpetasEnTransitoUsuario;
    end;
end;

procedure DoIniciarCarpetasEnTransitoUsu;
begin
  TMensajeAlertaAGA_CarpetasTransitoUsu.MensajeAlertaSingle(CLASE_CARPETASTRANSITOUSU).Iniciar(True);
end;

procedure DoSuspenderCarpetasEnTransitoUsu;
begin
  TMensajeAlertaAGA_CarpetasTransitoUsu.MensajeAlertaSingle(CLASE_CARPETASTRANSITOUSU).Suspender(True);
end;

initialization
  RegisterClasses([TMensajeAlertaAGA_CarpetasTransitoUsu]);
end.

