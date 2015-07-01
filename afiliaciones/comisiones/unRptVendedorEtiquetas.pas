unit unRptVendedorEtiquetas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, unManVendedor, ArtQReports,
  Db, SDEngine;

type
  TrptVendedorEtiquetas = class(TQuickRep)
    QRBand1: TQRBand;
    lblVE_VENDEDOR: TQRLabel;
    sdqConsulta: TSDQuery;
    qrlNombre: TArtQRDBText;
    qrlDomicilio: TArtQRDBText;
    qrlLocalidad: TArtQRDBText;
    qrlProvincia: TArtQRDBText;
    qrlCodigo: TArtQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure SetVendedores_Seleccionados( Value : string );
  private
    FVendedores_Seleccionados : string; //VE_ID separados por comas...formato SQL
  public
    property Vendedores_Seleccionados : string read FVendedores_Seleccionados write SetVendedores_Seleccionados;
  end;


implementation

Uses unDmPrincipal;
{$R *.DFM}

procedure TrptVendedorEtiquetas.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if Vendedores_Seleccionados = '' Then
    Raise Exception.Create( 'No se han asignado registros' );
end;

procedure TrptVendedorEtiquetas.SetVendedores_Seleccionados( Value : string );
var
  sSql : string;
begin
  if FVendedores_Seleccionados <> Value then
  begin
    FVendedores_Seleccionados := Value;
    sSql := (
      'SELECT VE_VENDEDOR, VE_NOMBRE, ' +
        'ART.UTILES.ARMAR_DOMICILIO(VE_CALLE,VE_NUMERO,VE_PISO,VE_DEPARTAMENTO,NULL) DOMICILIO,' +
        'ART.UTILES.ARMAR_LOCALIDAD (VE_CPOSTAL, NULL,VE_LOCALIDAD, VE_PROVINCIA) LOCALIDAD,' +
        'PV_DESCRIPCION PROVINCIA' +
        ' FROM XVE_VENDEDOR, CPV_PROVINCIAS' +
            ' WHERE VE_FECHABAJA IS NULL' +
                  ' AND VE_DOMICILIO_VENDEDOR = ''S''' +
                  ' AND VE_PROVINCIA = PV_CODIGO (+) ' +
                  ' AND VE_ID IN (' + Vendedores_Seleccionados + ') ' +
      'UNION ALL ' +

      'SELECT VE_VENDEDOR, VE_NOMBRE, ' +
        'ART.UTILES.ARMAR_DOMICILIO(EN_CALLE,EN_NUMERO,EN_PISO,EN_DEPARTAMENTO,NULL) DOMICILIO,' +
        'ART.UTILES.ARMAR_LOCALIDAD (EN_CPOSTAL, NULL,EN_LOCALIDAD, EN_PROVINCIA) LOCALIDAD,' +
        'PV_DESCRIPCION PROVINCIA' +
        ' FROM XEN_ENTIDAD, XVE_VENDEDOR, CPV_PROVINCIAS' +
             ' WHERE VE_FECHABAJA IS NULL' +
                   ' AND VE_DOMICILIO_VENDEDOR = ''N''' +
                   ' AND EN_PROVINCIA = PV_CODIGO (+) ' +
                   ' AND EN_ID = VE_IDENTIDAD_CORREO' +
                   ' AND VE_ID IN (' + Vendedores_Seleccionados + ') ');
    sdqConsulta.SQL.Clear;
    sdqConsulta.SQL.Add( sSql );
    OpenQuery ( sdqConsulta );
  end;
end;
end.
