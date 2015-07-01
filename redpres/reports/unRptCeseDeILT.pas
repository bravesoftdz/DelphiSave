unit unRptCeseDeILT;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TrptCeseDeILT = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel47: TQRLabel;
    QRShape10: TQRShape;
    QRLabel39: TQRLabel;
    qrlFechaCeseILT: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrsShape111: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlNombreTrabajador: TQRLabel;
    QRLabel4: TQRLabel;
    qrlCuil: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFechaNac: TQRLabel;
    QRLabel6: TQRLabel;
    qrlSexo: TQRLabel;
    QRLabel7: TQRLabel;
    qrlNacionalidad: TQRLabel;
    QRLabel8: TQRLabel;
    qrlECivil: TQRLabel;
    QRLabel9: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlTelefono: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlFechaAccidente: TQRLabel;
    qrlFechaInicioILT: TQRLabel;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape8: TQRShape;
    QRLabel25: TQRLabel;
    QRShape9: TQRShape;
    QRLabel26: TQRLabel;
    QRShape11: TQRShape;
    QRLabel27: TQRLabel;
    QRShape12: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel10: TQRLabel;
  private

  public
    procedure Imprimir(IdExpediente: integer; bCompletaFecAccid: boolean = False);
  end;

var
  rptCeseDeILT: TrptCeseDeILT;

implementation

uses unComunes, unVisualizador, unDmPrincipal;

{$R *.DFM}

procedure TrptCeseDeILT.Imprimir(IdExpediente: integer; bCompletaFecAccid: boolean = False);
var sSql: String;
begin
  if Is_SiniestroDeGobernacion(IdExpediente) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro,' +
            'ex_fechaaccidente, ' +
            'tj_nombre, art.utiles.armar_cuit (tj_cuil) tj_cuil, tj_fnacimiento, ' +
            'DECODE (tj_sexo, ''M'', ''Masculino'', ''F'', ''Femenino'') sexotrab, ' +
            'na_descripcion nacionalidad, tb_descripcion estadocivil, ' +
            'art.utiles.armar_domicilio(tj_calle,tj_numero,tj_piso,tj_departamento,tj_localidad) domicilio, ' +
            'art.trabajador.get_telefono(tj_id, 5) Telefono ' +
          'FROM sex_expedientes, ctj_trabajador, cna_nacionalidad, ctb_tablas ' +
          'WHERE ex_idtrabajador = tj_id ' +
          'AND tj_idnacionalidad = na_id(+) ' +
          'AND tb_clave(+) = ''ESTAD'' ' +
          'AND tb_codigo(+) = tj_estadocivil ' +
          'AND ex_id = :idex ';

  with GetQueryEx(sSql, [IdExpediente]) do
  begin
    qrlNombreTrabajador.Caption := FieldByName('TJ_NOMBRE').AsString;
    qrlCuil.Caption             := FieldByName('TJ_CUIL').AsString;
    qrlFechaNac.Caption         := FieldByName('TJ_FNACIMIENTO').AsString;
    qrlSexo.Caption             := FieldByName('SEXOTRAB').AsString;
    qrlNacionalidad.Caption     := FieldByName('NACIONALIDAD').AsString;
    qrlECivil.Caption           := FieldByName('ESTADOCIVIL').AsString;
    qrlDomicilio.Caption        := FieldByName('DOMICILIO').AsString;
    qrlTelefono.Caption         := FieldByName('TELEFONO').AsString;
    qrlSiniestro.Caption        := FieldByName('Siniestro').AsString;
    if bCompletaFecAccid then    // TK 10544
      qrlFechaAccidente.Caption := FieldByName('ex_fechaaccidente').AsString;
  end;

  Print;

end;

end.
