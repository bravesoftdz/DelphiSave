unit unFraDetalleArchivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox;

type
  TfraDetalleArchivo = class(TFrame)
    gbDetalleArchivo: TGroupBox;
    lblTipoArchivo: TLabel;
    lblUbicacion: TLabel;
    lblCaja: TLabel;
    lblEmisor: TLabel;
    lblReceptor: TLabel;
    lblDescriptor: TLabel;
    lblFechaMovimiento: TLabel;
    lblFechaVencimiento: TLabel;
    edTipoArchivo: TEdit;
    edTipoUbicacion: TEdit;
    edUbicacion: TEdit;
    edCaja: TEdit;
    edEmisor: TEdit;
    edtRecepctor: TEdit;
    edtDescripcion: TEdit;
    edFechaMovimiento: TDateComboBox;
    edFechaVencimiento: TDateComboBox;
    gbDetalleSolicitudActiva: TGroupBox;
    lblUsuarioSolicitud: TLabel;
    lblFechaSolicitud: TLabel;
    lblTipoSolicitud: TLabel;
    lblMotivoSolicitud: TLabel;
    edFechaSolicitud: TDateComboBox;
    edUsuarioSolicitud: TEdit;
    edTipoSolicitud: TEdit;
    mMotivoSolicitud: TMemo;
    tbDetalleDescripcion: TToolBar;
    tbMostrarImagenBank: TToolButton;
    Label1: TLabel;
    edObservaciones: TMemo;
  private
    FIdSolicitud: integer;
    FIdArchivo: integer;
  public
    procedure CargarDetalleArchivo(AIdArchivo: Integer);
    property IdSolicitud : integer read FIdSolicitud;
    property IdArchivo : integer read FIdArchivo;
  end;

implementation

uses unDmPrincipal, unPrincipal, DB, SDEngine, unConstantArchivo;

{$R *.dfm}

procedure TfraDetalleArchivo.CargarDetalleArchivo(AIdArchivo : Integer);
var
 Q : TSdQuery;
 sSql : string;
begin
  sSql       := 'SELECT AR_ID, TA_DESCRIPCION, ' +
                '      DECODE(AR_TIPOUBICACION, ''D'', ''Delegación'', ' +
                '                               ''L'', ''Lugar'', ' +
                '      ''S'', ''Sector'', ''U'', ''Usuario'' , ''G'', ''Administradora'') TIPOUBICACION, ' +
                '      ART.ARCHIVO.GETUBICACIONNOMBRE(AR_TIPOUBICACION, AR_UBICACION) UBICACION, ' +
                '      AR_FECHAMOVIMIENTO FECHAMOVIMIENTO, AR_CAJA CAJA, AR_RECEPTOR RECEPTOR, AR_EMISOR EMISOR, ' +
                '      ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) DESCRIPCIONCLAVE, ' +
                '      SC_FECHASOLICITUD FECHASOLICITUD, SC_USUARIOSOLICITUD USUARIOSOLICITUD, ' +
                '      DECODE (SC_TIPOSOLICITUD, ''1'', ''2 HORAS'', ''2'', ''4 HORAS'', ''3'', ''24 HORAS'') TIPOSOLICITUD, ' +
                '      SC_OBSERVACIONES OBSERVACIONES, SC_FECHAPREVISTADEVOLUCION, SC_ID, ' +
                '      AR_OBSERVACIONES OBSERVACIONESARCHIVO ' + 
                ' FROM RAR_ARCHIVO R, RTA_TIPOARCHIVO T, RTC_TIPOCLAVE C, RSC_SOLICITUDCARPETA S ' +
                'WHERE AR_TIPO = TA_ID ' +
                '  AND TA_FORMULARIO = TC_CLAVE ' +
                '  AND AR_ID = SC_IDARCHIVO(+) ' +
                '  AND SC_ID(+) = ART.ARCHIVO.GET_PRIMSOLICITUDPENDIENTE(AR_ID) ' +
                '  AND AR_ID = :id';

  Q := GetQueryEx(sSql, [AIdArchivo]);
  try
    if Q.RecordCount > 0 then
    begin
      edTipoArchivo.Text      := Q.FieldByName('TA_DESCRIPCION').AsString;
      edTipoUbicacion.Text    := Q.FieldByName('TIPOUBICACION').AsString;
      edUbicacion.Text        := Q.FieldByName('UBICACION').Asstring;
      edCaja.Text             := Q.FieldByName('CAJA').Asstring;
      edEmisor.Text           := Q.FieldByName('EMISOR').Asstring;
      edtRecepctor.Text       := Q.FieldByName('RECEPTOR').Asstring;
      edtDescripcion.Text     := Q.FieldByName('DESCRIPCIONCLAVE').Asstring;
      edFechaMovimiento.Date  := Q.FieldByName('FECHAMOVIMIENTO').AsDateTime;
      edFechaVencimiento.Date := Q.FieldByName('SC_FECHAPREVISTADEVOLUCION').AsDateTime;
      edObservaciones.Text    := Q.FieldByName('OBSERVACIONESARCHIVO').Asstring;

      edTipoSolicitud.Text    := Q.FieldByName('TIPOSOLICITUD').Asstring;
      edUsuarioSolicitud.Text := Q.FieldByName('USUARIOSOLICITUD').Asstring;

      edFechaSolicitud.Date   := Q.FieldByName('FECHASOLICITUD').AsDateTime;
      mMotivoSolicitud.Text   := Q.FieldByName('OBSERVACIONES').Asstring;

      FIdArchivo    := Q.FieldByName('AR_ID').AsInteger;
      FIdSolicitud  := Q.FieldByName('SC_ID').AsInteger;
    end;
  finally
    Q.Free;
  end;
end;

end.

