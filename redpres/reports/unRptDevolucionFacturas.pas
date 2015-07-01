unit unRptDevolucionFacturas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unVisualizador;

type
  TqrDevolucionFacturas = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlFechaImpresion: TQRLabel;
    QRLabel1: TQRLabel;
    qrlRazonSocial: TQRLabel;
    QRLabel2: TQRLabel;
    qrlReferencia: TQRLabel;
    QRLabel3: TQRLabel;
    qrlFechaEmision: TQRLabel;
    qrlFin: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlErrorCAI: TQRLabel;
    qrlConIVA: TQRLabel;
    qrlFechaEnmen: TQRLabel;
    qrlCAIVencido: TQRLabel;
    qrlTipoB: TQRLabel;
    qriLogo: TQRImage;
    qrlImpEnmendado: TQRLabel;
  private

  public
    function Preparar(iIdDevo: Integer): TResultados;
  end;

var
  qrDevolucionFacturas: TqrDevolucionFacturas;

implementation

uses unComunes, General, unDmPrincipal;

{$R *.DFM}

{-------------------------------------------------------------------------------}
function TqrDevolucionFacturas.Preparar(iIdDevo: Integer): TResultados;
var
  sSql, sMail: String;
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  qrlFechaImpresion.Caption := LugarImpresion + ', ' + DateFormat(DBDate, 'd ''de'' MMMM ''de'' yyyy');
  sSql := 'SELECT df_codtipo, df_idproveedor, df_idprestador, df_fechafac, df_idmotivodevol,  ' +
                ' df_nombre, df_tipofac || ''-'' ||df_numerofac factura ' +
           ' FROM art.v_sdf_devolucionfacturas ' +
          ' WHERE df_id = :iddev ';
  with GetQueryEx(sSql, [iIdDevo]) do
  try
    qrlRazonSocial.Caption  := FieldByName('df_nombre').AsString;
    qrlReferencia.Caption   := 'Ref.: Devolución de factura: ' + FieldByName('factura').AsString;
    case FieldByName('df_idmotivodevol').AsInteger of
      1: qrlErrorCAI.Enabled    := True;
      2: qrlConIVA.Enabled      := True;
      3: qrlFechaEnmen.Enabled  := True;
      4: qrlCAIVencido.Enabled  := True;
      5: qrlTipoB.Enabled       := True;
      7: qrlImpEnmendado.Enabled:= True;
      6: begin
          qrlFechaEmision.Caption := Format(qrlFechaEmision.Caption, [FieldByName('df_fechafac').AsString]);
          qrlFechaEmision.Enabled := True;
         end;
    end;

    if (FieldByName('df_codtipo').AsString = 'P') then
      sMail := ValorSqlEx('SELECT ca_direlectronica ' +
                           ' FROM cpr_prestador ' +
                          ' WHERE ca_identificador = :id', [FieldByName('df_idprestador').AsInteger])
    else if (FieldByName('df_codtipo').AsString = 'V') then
      sMail := ValorSqlEx('SELECT MAX(email_address) ' + //por si tiene mas de uno agarro uno solo...
                           ' FROM po_vendor_sites_all@REALFCL ' +
                          ' WHERE vendor_id = :id ' +
                            ' AND inactive_date IS NULL', [FieldByName('df_idproveedor').AsInteger]);;
 

    Result := Visualizar(Self, GetValores(' ' + FieldByName('factura').AsString, sMail, 0, 0,
                         'Se adjunta archivo pdf con detalle de devolución.' + #13 + #13 +
                         'Provincia ART'), [oForceShowModal, oForceDB, oShowDialogIfEmpty,
                                            oExportDOCNotAllowed, oExportXLSNotAllowed,
                                            oFaxNotAllowed, oSinTransaccion]);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
end.
