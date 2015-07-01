unit unRptRegRehabNuevo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, uncomunes, strfuncs, DB,
  SDEngine, undmprincipal, unvisualizador, unrptcomunes;

type
  TrptRegRehabNuevo = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRShape11: TQRShape;
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
    QRLabel5: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel6: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel7: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrlTrabajador: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlNroDoc: TQRLabel;
    qrlTelefono: TQRLabel;
    qrlAnulado: TQRLabel;
    sdqRegRehab: TSDQuery;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    qrlFNac: TQRLabel;
    QRLabel15: TQRLabel;
    qrlEmpresa: TQRLabel;
    procedure Imprimir(idautorizacion: integer);
  private


  public

  end;

var
  rptRegRehabNuevo: TrptRegRehabNuevo;

implementation

{$R *.DFM}


procedure TrptRegRehabNuevo.Imprimir(idautorizacion: integer);
var anulada: boolean; Resultado: TResultados;
begin
  sdqRegRehab.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqRegRehab);
  if Is_SiniestroDeGobernacion(sdqRegRehab.FieldByName('ex_id').AsInteger) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  if (sdqRegRehab.FieldByName('AU_ESTADO').AsString = 'U') or (sdqRegRehab.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqRegRehab.FieldByName('AU_ESTADO').AsString = 'V') then
    Anulada := true
  else
    Anulada := false;

  If Anulada then
  begin
      qrlAnulado.Caption     := 'AUTORIZACI�N ANULADA';
      qrlAnulado.Font.Color  := clRed;
      qrlAnulado.enabled := true;
  end;

  qrlTrabajador.Caption := sdqRegRehab.FieldByName('nombre').AsString;
  qrlSiniestro.Caption  := sdqRegRehab.FieldByName('siniestro').AsString;
  qrlDomicilio.Caption  := sdqRegRehab.FieldByName('domicilio').AsString;
  qrlNroDoc.Caption     := sdqRegRehab.FieldByName('tj_documento').AsString;
  qrlTelefono.Caption   := sdqRegRehab.FieldByName('telefono').AsString;
  qrlFNac.Caption       := sdqRegRehab.FieldByName('tj_fnacimiento').AsString;
  qrlEmpresa.Caption    := InitCap(sdqRegRehab.fieldbyname('em_nombre').AsString);

  Resultado := Visualizar(self, GetValores(' - Siniestro: ' + sdqRegRehab.fieldbyname('siniestro').AsString + ' - ' + sdqRegRehab.FieldByName('nombre').AsString + ' - DNI ' + sdqRegRehab.FieldByName('tj_documento').AsString, sdqRegRehab.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqRegRehab.fieldbyname('siniestro').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqRegRehab.FieldByName('ca_fax').AsString {Telefono}, sdqRegRehab.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqRegRehab.FieldByName('ca_identificador').AsInteger {IdDest}), [oForceShowModal, oAlwaysShowDialog, oForceDB, oAgruparReportes]);

  DoActualizarImpresionAutorizacion(sdqRegRehab.fieldbyname('au_id').AsInteger, Resultado);

end;


end.
