unit unQREventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UnRptMoldeCarta, Db, SDEngine, QRCtrls,
  QuickRpt, ExtCtrls;

type
  TqrEventos = class(TqrMoldeCarta)
    qrbDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    ColumnHeaderBand: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel11: TQRLabel;
    procedure FormatoCUIT(Sender: TObject; var Value: String);
  public
    constructor Create(AOwner: TComponent); override;

    procedure Preparar(const aTipo: String; const aId: Integer);
  end;

var
  qrEventos: TqrEventos;

implementation

uses
  CUIT, unVisualizador, unDmPrincipal;

{$R *.DFM}

constructor TqrEventos.Create(AOwner: TComponent);
begin
  inherited;

  ShowReferencia := False;
  
  qriLogoART.Center := False;
  qriLogoART.Left := 578;

  qriLogoGBP.Enabled := False;
end;

procedure TqrEventos.FormatoCUIT(Sender: TObject; var Value: String);
begin
  inherited;

  Value := PonerGuiones(Value);
end;

procedure TqrEventos.Preparar(const aTipo: String; const aId: Integer);
begin
  if aTipo = 'C' then
    sdqDatos.SQL.Text :=
      'SELECT ce_id, ce_idsolicitudcotizacion, ce_fecha, ce_descripcion descripcionevento, ce_fechaalta,' +
            ' ce_fechamodif, ce_fechabaja, ce_usualta, ce_usumodif, ce_usubaja,' +
            ' NVL(ce_usumodif, ce_usualta) usuario,' +
            ' DECODE(sc_fechavigencia,' +
                   ' NULL, NULL,' +
                   ' DECODE(sc_costofinal, 0, NULL, utiles.iif_compara(''<'', sc_finalsumafija, sc_costofinal, ''OK'', ''OUT''))) resultado,' +
            ' NVL(ce_fechamodif, ce_fechaalta) fecha, ca_descripcion canal, en_nombre entidad,' +
            ' su_descripcion sucursal, sc_cuit cuit, sc_nrosolicitud nrosolicitud, sc_fechasolicitud fechasolicitud,' +
            ' sc_razonsocial razonsocial, sc_canttrabajador canttrabajador,' +
            ' sc_finalportrabajador finalportrabajador, sc_costofinal costofinal' +
       ' FROM ace_cotizacionevento, asc_solicitudcotizacion, asu_sucursal, xen_entidad, aca_canal' +
      ' WHERE ce_idsolicitudcotizacion = sc_id' +
        ' AND sc_canal = ca_id' +
        ' AND sc_identidad = en_id' +
        ' AND sc_idsucursal = su_id(+)' +
        ' AND ce_fechabaja IS NULL' +
        ' AND sc_id = :id';

  if aTipo = 'R' then
    sdqDatos.SQL.Text :=
      'SELECT er_id, er_idrevisionprecio, er_fecha, er_descripcion descripcionevento, er_fechaalta, er_fechamodif, er_fechabaja,' +
            ' er_usualta, er_usumodif, er_usubaja, NVL(er_usumodif, er_usualta) usuario,' +
            ' DECODE(sr_costofinalcompetencia,' +
                   ' 0, NULL,' +
                   ' utiles.iif_compara(''<'', sr_costofijocotizado, sr_costofinalcompetencia, ''OK'', ''OUT'')) resultado,' +
            ' NVL(er_fechamodif, er_fechaalta) fecha, ca_descripcion canal, en_nombre entidad, su_descripcion sucursal, sr_cuit cuit,' +
            ' sr_nrosolicitud nrosolicitud, sr_fechaalta fechasolicitud, em_nombre razonsocial,' +
            ' DECODE(NVL(sr_canttrabajadores, 0), 0, hc_totempleadosmayorcero, sr_canttrabajadores) canttrabajador,' +
            ' sr_costofinalcotizado finalportrabajador, sr_costofinalcompetencia costofinal' +
       ' FROM asr_solicitudreafiliacion, afi.aer_eventosrevicionprecio, ahc_historicocontrato, aem_empresa, asu_sucursal, xen_entidad,' +
            ' aca_canal' +
      ' WHERE sr_id = er_idrevisionprecio' +
        ' AND sr_idhistoricocontrato = hc_contrato(+)' +
        ' AND hc_idempresa = em_id(+)' +
        ' AND sr_idcanal = ca_id' +
        ' AND sr_identidad = en_id' +
        ' AND sr_idsucursal = su_id(+)' +
        ' AND er_fechabaja IS NULL' +
        ' AND sr_id = :id';

  sdqDatos.ParamByName('id').AsInteger := aId;

  OpenQuery(sdqDatos);
  Visualizar(qrEventos, GetValores(sdqDatos.FieldByName('nrosolicitud').AsString),
             [TOpcionVisualizador(oShowDialogIfEmpty), TOpcionVisualizador(oForceDB)]);
end;

end.
