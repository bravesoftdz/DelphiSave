unit unRptCaratulaMortales;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrCaratulaMortales = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRLabel55: TQRLabel;
    qrlAseguradora: TQRLabel;
    QRShape6: TQRShape;
    QRLabel57: TQRLabel;
    QRShape7: TQRShape;
    QRLabel58: TQRLabel;
    QRShape8: TQRShape;
    qriLogo: TQRImage;
    QRLabel8: TQRLabel;
    qrlApellido: TQRLabel;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlSiniestro: TQRLabel;
    QRLabel2: TQRLabel;
    qrlFAccidente: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFNacimiento: TQRLabel;
    qrlFFallecimiento: TQRLabel;
    QRLabel7: TQRLabel;
    qrlObservaciones: TQRLabel;
    qrlEdad: TQRLabel;
    QRLabel10: TQRLabel;
    qrlEstadoCivil: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape5: TQRShape;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    sdqBeneficiarios: TSDQuery;
    QRDBText2: TQRDBText;
    QRShape11: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    qrlTitObservaciones: TQRLabel;
    QRShape30: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape31: TQRShape;
    qrFechaHOY: TQRSysData;
    QRLabel6: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRDBText10: TQRDBText;
  private

  public
    procedure Preparar(iSiniestro, iOrden, iRecaida: Integer);
  end;

var
  qrCaratulaMortales: TqrCaratulaMortales;

implementation

uses unDmPrincipal, unComunes, unVisualizador, General;

{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TqrCaratulaMortales.Preparar(iSiniestro, iOrden, iRecaida: Integer);
var
  sSql: String;
begin
  if Is_SiniestroDeGobernacion(Get_IdExpediente(iSiniestro, iOrden, iRecaida)) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_PART');

  sSql := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' ex_fechaaccidente, tj_nombre, tj_fnacimiento, ex_altamedica, ' +
                ' varios.get_edad(tj_fnacimiento, ex_altamedica) edad, ' +
                ' tb_descripcion estadocivil, ex_observmortales ' +
           ' FROM sex_expedientes, ctj_trabajador, ctb_tablas ' +
          ' WHERE ex_idtrabajador = tj_id ' +
            ' AND tb_clave(+) = ''ESTAD'' ' +
            ' AND tj_estadocivil = tb_codigo(+) ' +
            ' AND ex_siniestro = :Sin ' +
            ' AND ex_orden = :Ord ' +
            ' AND ex_recaida = :Reca';
  with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida]) do
  try
    qrlSiniestro.Caption        := FieldByName('siniestro').AsString;
    qrlFAccidente.Caption       := FieldByName('ex_fechaaccidente').AsString;
    qrlApellido.Caption         := FieldByName('tj_nombre').AsString;
    qrlFNacimiento.Caption      := FieldByName('tj_fnacimiento').AsString;
    qrlFFallecimiento.Caption   := FieldByName('ex_altamedica').AsString;
    qrlEdad.Caption             := FieldByName('edad').AsString;
    qrlEstadoCivil.Caption      := FieldByName('estadocivil').AsString;
    qrlObservaciones.Caption    := FieldByName('ex_observmortales').AsString;
    qrlTitObservaciones.Caption := IIF(FieldByName('ex_observmortales').IsNull, '', 'Observaciones:');
  finally
    Free;
  end;

  with sdqBeneficiarios do
  begin
    Close;
    ParamByName('sin').AsInteger  := iSiniestro;
    ParamByName('ord').AsInteger  := iOrden;
    ParamByName('reca').AsInteger := iRecaida;        
    Open;
    Visualizar(Self, GetValores(' Siniestro '),[oAlwaysShowDialog, oForceDB, oForceShowModal]);
  end;
end;
{-------------------------------------------------------------------------------}
end.
