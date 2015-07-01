unit unRptLegajoSiniestro;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrLegajoSiniestro = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlFechaListado: TQRLabel;
    QRLabel4: TQRLabel;
    qrlHistClinica: TQRLabel;
    QRShape1: TQRShape;
    QRLabel55: TQRLabel;
    qrlAseguradora: TQRLabel;
    QRShape6: TQRShape;
    QRLabel57: TQRLabel;
    QRShape7: TQRShape;
    QRLabel58: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    qrlCad2: TQRLabel;
    qriLogo: TQRImage;
    sdqConsulta: TSDQuery;
    qrlSiniestro: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    qrlCUIL: TQRLabel;
    qrlTrabajador: TQRLabel;
    qrlLocalidad: TQRLabel;
    QRShape27: TQRShape;
    QRLabel1: TQRLabel;
    qrlPMI: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    qrlDenuncia: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    qrlAcuseRecibo: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    qrlFotocopiaDNI: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    qrlAltaMedica: TQRLabel;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    qrlAcuerdo: TQRLabel;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    qrlTrataMedico: TQRLabel;
    QRShape12: TQRShape;
    QRLabel10: TQRLabel;
    qrlRehabilitacion: TQRLabel;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    qrlTrataPsico: TQRLabel;
    QRShape14: TQRShape;
    QRLabel13: TQRLabel;
    qrlTrataQuiru: TQRLabel;
    QRShape15: TQRShape;
    QRLabel16: TQRLabel;
    qrlOtrosTrata: TQRLabel;
    QRShape17: TQRShape;
    qrlOtrosTrata2: TQRLabel;
    QRLabel17: TQRLabel;
    qrlProtoQuir: TQRLabel;
    QRShape18: TQRShape;
    QRLabel18: TQRLabel;
    qrlInterconsulta: TQRLabel;
    QRShape19: TQRShape;
    QRLabel20: TQRLabel;
    qrlPsicoDiagnostico: TQRLabel;
    QRShape20: TQRShape;
    QRLabel22: TQRLabel;
    qrlRadiografias: TQRLabel;
    QRShape21: TQRShape;
    QRLabel24: TQRLabel;
    qrlEcografias: TQRLabel;
    QRShape22: TQRShape;
    QRLabel26: TQRLabel;
    qrlTAC: TQRLabel;
    QRShape23: TQRShape;
    QRLabel28: TQRLabel;
    qrlRMN: TQRLabel;
    QRShape24: TQRShape;
    QRLabel30: TQRLabel;
    qrlEMG: TQRLabel;
    QRShape25: TQRShape;
    QRLabel32: TQRLabel;
    qrlEstAudio: TQRLabel;
    QRShape26: TQRShape;
    QRLabel34: TQRLabel;
    qrlEstOfta: TQRLabel;
    QRShape28: TQRShape;
    QRLabel36: TQRLabel;
    qrlEstNeumo: TQRLabel;
    QRShape29: TQRShape;
    QRLabel38: TQRLabel;
    qrlReca: TQRLabel;
    QRShape30: TQRShape;
    QRLabel40: TQRLabel;
    qrlLaboratorio: TQRLabel;
    QRShape31: TQRShape;
    QRLabel42: TQRLabel;
    qrlEstComplem: TQRLabel;
    QRShape32: TQRShape;
    QRLabel45: TQRLabel;
    qrlOtrosEstudios: TQRLabel;
    QRShape33: TQRShape;
    qrlOtrosEstudios2: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    qrlUsuImpresion: TQRLabel;
    sdqDigitalizacion: TSDQuery;
  private
    procedure DoLimpiarChecks;
    procedure DoImprimirDigitalizacion(idExpediente, iSiniestro: Integer; sCuil, sNombre:string);
    procedure DoImprimirLegajo(iIdExped: integer);
  public
    procedure Preparar(iIdExpediente, iSiniestro: Integer; bEsNuevo: boolean; sCuil, sNombre: string);
  end;

var
  qrLegajoSiniestro: TqrLegajoSiniestro;

implementation

uses unComunes, unDmPrincipal, unVisualizador, General, unSesion, CUIT;

{$R *.DFM}

{-------------------------------------------------------------------------------}  // TK 16032
procedure TqrLegajoSiniestro.DoImprimirDigitalizacion(idExpediente, iSiniestro: Integer; sCuil, sNombre: string);
begin
  DoLimpiarChecks;
  with sdqDigitalizacion do
  begin
    ParamByName('usu').AsString    := Sesion.UserId;
    ParamByName('idexp').AsInteger := idExpediente;

    Open;
    qrlSiniestro.Caption  := ValorSQLEx('SELECT ART.SINIESTRO.get_siniestrocompleto(:IdExp) FROM DUAL', [idExpediente]);
    qrlCUIL.Caption       := PonerGuiones(sCuil);
    qrlTrabajador.Caption := sNombre;
    qrlLocalidad.Caption  := ValorSqlEx('Select tj_localidad From Ctj_trabajador ' +
                                        ' Where tj_cuil = :cuil', [sCuil]);

    while not eof do
    begin
      qrlHistClinica.Caption      := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'VAR'), 'X', qrlHistClinica.Caption);
      qrlPMI.Caption              := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'PMI'), 'X', qrlPMI.Caption);
      qrlDenuncia.Caption         := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'DEN'), 'X', qrlDenuncia.Caption);
      qrlAcuseRecibo.Caption      := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'P49'), 'X', qrlAcuseRecibo.Caption);
      qrlFotocopiaDNI.Caption     := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'P31'), 'X', qrlFotocopiaDNI.Caption);
      qrlAltaMedica.Caption       := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'PME'), 'X', qrlAltaMedica.Caption);
      qrlAcuerdo.Caption          := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'ACU'), 'X', qrlAcuerdo.Caption);
      qrlTrataMedico.Caption      := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'PEV'), 'X', qrlTrataMedico.Caption);
      qrlRehabilitacion.Caption   := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'RDR'), 'X', qrlRehabilitacion.Caption);
      qrlTrataPsico.Caption       := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'INF'), 'X', qrlTrataPsico.Caption);
      qrlTrataQuiru.Caption       := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'PRQ'), 'X', qrlTrataQuiru.Caption);
      qrlReca.Caption             := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'CAR') or (FieldByName('CODIGO_DOCUMENTO').AsString = 'RINF'), 'X', qrlReca.Caption);
      qrlProtoQuir.Caption        := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'PRQ'), 'X', qrlProtoQuir.Caption);
      qrlInterconsulta.Caption    := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'INF'), 'X', qrlInterconsulta.Caption);
      qrlPsicoDiagnostico.Caption := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'INF'), 'X', qrlPsicoDiagnostico.Caption);
      qrlRadiografias.Caption     := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'PLA'), 'X', qrlRadiografias.Caption);
      qrlEcografias.Caption       := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'ECO'), 'X', qrlEcografias.Caption);
      qrlTAC.Caption              := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'TAC'), 'X', qrlTAC.Caption);
      qrlRMN.Caption              := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'RMN'), 'X', qrlRMN.Caption);
      qrlEMG.Caption              := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'EMG'), 'X', qrlEMG.Caption);
      qrlEstAudio.Caption         := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'AUDIO'), 'X', qrlEstAudio.Caption);
      qrlEstOfta.Caption          := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'INF'), 'X', qrlEstOfta.Caption);
      qrlEstNeumo.Caption         := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'ESPIRO'), 'X', qrlEstNeumo.Caption);
      qrlLaboratorio.Caption      := IIF((FieldByName('CODIGO_DOCUMENTO').AsString = 'LAB'), 'X', qrlLaboratorio.Caption);
     // qrlEstComplem.Caption       := IIF(FieldByName('CODIGO_DOCUMENTO').AsString = ''), 'X', qrlEstComplem.Caption);   no hay codigo de esto.. por ahora lo dejo en blanco...
      next;
    end;
  end;
  Visualizar(Self, GetValores(IntToStr(iSiniestro), ''),
            [oAlwaysShowDialog, oForceDB, oForceShowModal], True, 'AfterSendEmail', 'BeforeSendEmail');

end;
{-------------------------------------------------------------------------------}
procedure TqrLegajoSiniestro.DoImprimirLegajo(iIdExped: integer);      // se imprime datos del legajo.
begin
  with sdqConsulta do
  begin
    ParamByName('idexpediente').AsInteger := iIdExped;
    Open;

    qrlSiniestro.Caption        := FieldByName('siniestro').AsString;
    qrlCUIL.Caption             := FieldByName('cuil').AsString;
    qrlTrabajador.Caption       := FieldByName('tj_nombre').AsString;
    qrlLocalidad.Caption        := FieldByName('tj_localidad').AsString;

    qrlHistClinica.Caption      := IIF(FieldByName('le_historiaclinica').AsString = 'S', 'X', '');
    qrlPMI.Caption              := IIF(FieldByName('le_pmi').AsString = 'S', 'X', '');
    qrlDenuncia.Caption         := IIF(FieldByName('le_denuncia').AsString = 'S', 'X', '');
    qrlAcuseRecibo.Caption      := IIF(FieldByName('le_acuserecibo').AsString = 'S', 'X', '');
    qrlFotocopiaDNI.Caption     := IIF(FieldByName('le_fotocopiadni').AsString = 'S', 'X', '');
    qrlAltaMedica.Caption       := IIF(FieldByName('le_pme').AsString = 'S', 'X', '');
    qrlAcuerdo.Caption          := IIF(FieldByName('le_acuerdo').AsString = 'S', 'X', '');
    qrlTrataMedico.Caption      := IIF(FieldByName('le_tratamedico').AsString = 'S', 'X', '');
    qrlRehabilitacion.Caption   := IIF(FieldByName('le_rehabilitacion').AsString = 'S', 'X', '');
    qrlTrataPsico.Caption       := IIF(FieldByName('le_tratapsicologico').AsString = 'S', 'X', '');
    qrlTrataQuiru.Caption       := IIF(FieldByName('le_trataquirurgico').AsString = 'S', 'X', '');
   // qrlRecaLaboral.Caption      := IIF(FieldByName('le_recalaboral').AsString = 'S', 'X', '');
    qrlOtrosTrata.Caption       := IIF(FieldByName('le_otrostratamientos').IsNull, '', 'X');
    qrlOtrosTrata2.Caption      := FieldByName('le_otrostratamientos').AsString;
    qrlProtoQuir.Caption        := IIF(FieldByName('le_protoquirurgico').AsString = 'S', 'X', '');

    qrlInterconsulta.Caption    := IIF(FieldByName('le_interconsulta').AsString = 'S', 'X', '');
    qrlPsicoDiagnostico.Caption := IIF(FieldByName('le_psicodiagnostico').AsString = 'S', 'X', '');
    qrlRadiografias.Caption     := IIF(FieldByName('le_radiografias').AsString = 'S', 'X', '');
    qrlEcografias.Caption       := IIF(FieldByName('le_ecografias').AsString = 'S', 'X', '');
    qrlTAC.Caption              := IIF(FieldByName('le_tac').AsString = 'S', 'X', '');
    qrlRMN.Caption              := IIF(FieldByName('le_rmn').AsString = 'S', 'X', '');
    qrlEMG.Caption              := IIF(FieldByName('le_emg').AsString = 'S', 'X', '');
    qrlEstAudio.Caption         := IIF(FieldByName('le_estaudiologicos').AsString = 'S', 'X', '');
    qrlEstOfta.Caption          := IIF(FieldByName('le_estoftalmologicos').AsString = 'S', 'X', '');
    qrlEstNeumo.Caption         := IIF(FieldByName('le_estneumonologicos').AsString = 'S', 'X', '');
    qrlReca.Caption             := IIF(FieldByName('le_recalificacion').AsString = 'S', 'X', '');
    qrlLaboratorio.Caption      := IIF(FieldByName('le_laboratorio').AsString = 'S', 'X', '');
    qrlEstComplem.Caption       := IIF(FieldByName('le_estcomplementarios').AsString = 'S', 'X', '');
    qrlOtrosEstudios.Caption    := IIF(FieldByName('le_otrosestudios').IsNull, '', 'X');
    qrlOtrosEstudios2.Caption   := FieldByName('le_otrosestudios').AsString;
  end;
  Visualizar(Self, GetValores(sdqConsulta.FieldByName('SINIESTRO').AsString, '', iIdExped),
            [oAlwaysShowDialog, oForceDB, oForceShowModal], True, 'AfterSendEmail', 'BeforeSendEmail');
end;

procedure TqrLegajoSiniestro.DoLimpiarChecks;
begin
  qrlHistClinica.Caption      := '';
  qrlOtrosTrata.Caption       := '';
  qrlOtrosTrata2.Caption      := '';
  qrlPMI.Caption              := '';
  qrlDenuncia.Caption         := '';
  qrlAcuseRecibo.Caption      := '';
  qrlFotocopiaDNI.Caption     := '';
  qrlAltaMedica.Caption       := '';
  qrlAcuerdo.Caption          := '';
  qrlTrataMedico.Caption      := '';
  qrlRehabilitacion.Caption   := '';
  qrlTrataPsico.Caption       := '';
  qrlTrataQuiru.Caption       := '';
  qrlProtoQuir.Caption        := '';
  qrlInterconsulta.Caption    := '';
  qrlPsicoDiagnostico.Caption := '';
  qrlRadiografias.Caption     := '';
  qrlEcografias.Caption       := '';
  qrlTAC.Caption              := '';
  qrlRMN.Caption              := '';
  qrlEMG.Caption              := '';
  qrlEstAudio.Caption         := '';
  qrlEstOfta.Caption          := '';
  qrlEstNeumo.Caption         := '';
  qrlReca.Caption             := '';
  qrlLaboratorio.Caption      := '';
  qrlEstComplem.Caption       := '';
  qrlOtrosEstudios.Caption    := '';
  qrlOtrosEstudios2.Caption   := '';
end;

procedure TqrLegajoSiniestro.Preparar(iIdExpediente, iSiniestro: Integer; bEsNuevo: boolean; sCuil, sNombre: string);
begin
  if Is_SiniestroDeGobernacion(iIdExpediente) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_PART');

  qrlFechaListado.Caption := 'Fecha: ' + DateToStr(DBDate);
  qrlUsuImpresion.Caption := 'Usuario de impresión: ' + Sesion.Usuario;

  if not bEsNuevo then // hay registro en la sle_: se imprime datos del legajo (de la sle_)
    DoImprimirLegajo(iIdExpediente)

  else // no hay registro en la sle_: se imprime datos de lo que esta digitalizado
    DoImprimirDigitalizacion(iIdExpediente, iSiniestro, sCuil, sNombre);
end;
{-------------------------------------------------------------------------------}

end.
