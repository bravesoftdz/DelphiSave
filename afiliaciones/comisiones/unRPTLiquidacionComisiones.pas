unit unRPTLiquidacionComisiones;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   28-01-2003
 ULTIMA MODIFICACION: 27-03-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Qrctrls, QuickRpt, ExtCtrls,
  unPrincipal, undmPrincipal, QRExport;

type
  TOrdenReport = (toCodigo2, toDescripcion2);

  TfrmRPTLiquidacionComision = class(TForm)
    rptLiquidacionComisionGeneral: TQuickRep;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    sdqConsulta: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    qrlblUsuario2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    rptLiquidacionComisionParticularVendedor: TQuickRep;
    QRBand6: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText16: TQRDBText;
    qrsCuadroGrande2: TQRShape;
    QRLabel15: TQRLabel;
    qrlblUsuario1: TQRLabel;
    qrlblFecha1: TQRLabel;
    qrlCodigoBarras2: TQRLabel;
    QRDBText17: TQRDBText;
    rptLiquidacionComisionParticularEntidad: TQuickRep;
    QRBand1: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    qrlblUsuario3: TQRLabel;
    qrlblFecha3: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel37: TQRLabel;
    qrsCuadroGrande1: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText26: TQRDBText;
    qrlCodigoBarras1: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel34: TQRLabel;
    qrsCuadroChico1: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText38: TQRDBText;
    qrsCuadroChico2: TQRShape;
    QRDBText39: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel43: TQRLabel;
    qrExpFacturar: TQRExpr;
    QRLabel44: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel45: TQRLabel;
    QRDBText41: TQRDBText;
    procedure FormatCurrency (sender: TObject;  var Value: String);
    procedure qrlCodigoBarras2Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    FMaxLiq : string;
    FIdLiq  : string;
    FOrdenReport: TOrdenReport;
    FMasivo: boolean;
  public
    function Prepare(NombreReporte: String): Boolean;
    property MaxLiq      : String       read FMaxLiq      write FMaxLiq;
    property IdLiq       : String       read FIdLiq       write FIdLiq;
    property OrdenReport : TOrdenReport read FOrdenReport write FOrdenReport;
    property Masivo      : Boolean      read FMasivo      write FMasivo;
  end;

implementation

uses
  StrFuncs, unSesion, General;
  
{$R *.DFM}

procedure TfrmRPTLiquidacionComision.FormatCurrency (sender: TObject;  var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffCurrency, 2);
end;

function TfrmRPTLiquidacionComision.Prepare(NombreReporte: String): Boolean;
var
  sCondicion, sSql : String;
begin
  //Al hacer esto puedo utilizar este report para imprimir las liquidaciones
  //recien generadas o reimprimirlas mas tarde desde unComisionesConsulta
  if MaxLiq <> '' then
    sCondicion := ' > ' + MaxLiq
  else
    sCondicion := ' = ' + IdLiq;

  if NombreReporte = 'ComisionGeneral' then
  begin
    sSql := 'SELECT pc_idliqcomision "Liquidación", en_id "Código Entidad", en_nombre "Nombre Entidad", nvl(en_codbanco,''-'') ' +
                   '"Cod. Sucursal", ve_vendedor "Código Vendedor", ve_nombre "Nombre Vendedor", sum(pc_cobrado) ' +
                   '"Total Cobrado", sum(pc_comision) "Comisión", NULL as LC_RETIVA  ' +
             ' FROM Xve_Vendedor, Xen_Entidad, Xev_EntidadVendedor, avc_vendedorcontrato, XPc_PagoComision  ' +
           '  WHERE ev_identidad = en_id  ' +
             '  AND ev_idvendedor = ve_id  ' +
             '  AND pc_idvendcontrato = vc_id  ' +
             '  AND vc_identidadvend = ev_id  ' +
              ' AND PC_IDLIQCOMISION ' + sCondicion +
           '  GROUP BY pc_idliqcomision, en_id, en_nombre, en_codbanco, ve_vendedor, ve_nombre';

    qrlblUsuario2.Caption := Sesion.UserID;

    rptLiquidacionComisionGeneral.ReportTitle := 'Comisión Gral. - ' + sCondicion;
  end
  else if NombreReporte = 'ComisionParticularVendedor' then
  begin
     sSql := 'Select LC_ID, VE_VENDEDOR "Código Vendedor", VE_NOMBRE "Nombre Vendedor", ' +
                    'en_id "Código Entidad", en_nombre "Nombre Entidad", nvl(en_codbanco,''-'') "Cod. Sucursal", ' +
                    'COMISION.Get_MontoTotalCobrado(LC_ID) "Total Cobrado", LC_COMISION "Comisión", ' +
                    'COMISION.Get_MontoTotalCobradoNeto(LC_ID) "Cobrado Neto de Impuestos", LC_BENEFICIARIO "Beneficiario", ' +
                    'LC_IVA, LC_OBRASOCIAL, LC_INGBRUTOS, LC_COMISIONNETA, LC_GANANCIAS, LC_FECHALIQ, LC_RETIVA ' +
              ' FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
             ' WHERE LC_IDENTIDADVENDEDOR = EV_ID ' +
               ' AND EV_IDENTIDAD = EN_ID ' +
               ' AND EV_IDVENDEDOR = VE_ID ' +
               ' AND LC_COMISION <> 0 ' +
              string(iif(not Masivo,
               ' AND LC_ID ' + sCondicion,
               ' AND (EV_IDENTIDAD, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                         ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                        ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                          ' AND EV_IDVENDEDOR = VE_ID' +
                                                          ' AND EV_IDENTIDAD = EN_ID' +
                                                          ' AND LC_ESTADO <> ''C'' ' +
                                                          ' AND LC_ID ' + sCondicion + ')')) +
          ' ORDER BY ';
    case OrdenReport of
      toCodigo2:
        sSql := sSql + '2';
      toDescripcion2:
        sSql := sSql + '3';
    end;

    qrlblUsuario1.Caption := '  Usuario de Impresión: ' + Sesion.UserID;
    qrlblFecha1.Caption   := '  Fecha de Impresión: ' + DateToStr( Date );

    rptLiquidacionComisionParticularVendedor.ReportTitle := 'Comisión Part. Vend. - ' + sCondicion;
  end
  else if NombreReporte = 'ComisionParticularEntidad' then
  begin
     sSql := 'Select LC_ID, EN_ID "Código Entidad", EN_NOMBRE "Nombre Entidad", ' +
                    'NVL(EN_CODBANCO,''-'') "Cod. Sucursal",' +
                    'COMISION.Get_MontoTotalCobrado(LC_ID) "Total Cobrado", LC_COMISION "Comisión", ' +
                    'COMISION.Get_MontoTotalCobradoNeto(LC_ID) "Cobrado Neto de Impuestos", LC_BENEFICIARIO "Beneficiario", ' +
                    'LC_IVA, LC_OBRASOCIAL, LC_INGBRUTOS, LC_COMISIONNETA, LC_GANANCIAS, LC_FECHALIQ, LC_RETIVA ' +
              ' FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
             ' WHERE LC_IDENTIDAD = EN_ID ' +
               ' AND LC_COMISION <> 0 ' +
              string(iif(not Masivo,
               ' AND LC_ID ' + sCondicion,
               ' AND (EN_ID, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                  ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                 ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                   ' AND EV_IDVENDEDOR = VE_ID' +
                                                   ' AND EV_IDENTIDAD = EN_ID' +
                                                   ' AND LC_ESTADO <> ''C'' ' +
                                                   ' AND LC_ID ' + sCondicion + ')')) +
          ' ORDER BY ';
    case OrdenReport of
      toCodigo2:
        sSql := sSql + '2';
      toDescripcion2:
        sSql := sSql + '3';
    end;

    qrlblUsuario3.Caption := '  Usuario de Impresión: ' + Sesion.UserID;
    qrlblFecha3.Caption   := '  Fecha de Impresión: ' + DateToStr( Date );

    rptLiquidacionComisionParticularEntidad.ReportTitle := 'Comisión Part. Ent. - ' + sCondicion;
  end;

  sdqConsulta.Sql.Clear;
  sdqConsulta.Sql.Add ( sSql );
  OpenQuery( sdqConsulta );
  result := not sdqConsulta.Eof;
end;

procedure TfrmRPTLiquidacionComision.qrlCodigoBarras2Print(sender: TObject; var Value: String);
begin
  if sdqConsulta.FieldByName('LC_ID').AsString <> '' then
    Value  := ' *' + NumberLength( StrToInt(sdqConsulta.FieldByName('LC_ID').AsString), 8) + '* ';
end;

procedure TfrmRPTLiquidacionComision.QRDBText12Print(sender: TObject; var Value: String);
begin
  if sdqConsulta.FieldByName('LC_ID').AsString <> '' then
    Value  := NumberLength( StrToInt(sdqConsulta.FieldByName('LC_ID').AsString), 8);
end;

procedure TfrmRPTLiquidacionComision.FormCreate(Sender: TObject);
begin
  OrdenReport := toCodigo2;
  Masivo      := False;
end;

end.
