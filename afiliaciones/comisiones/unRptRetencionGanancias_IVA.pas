unit unRptRetencionGanancias_IVA;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms,
  QuickRpt, QRCtrls, DB, SDEngine, unArt;

type
  TqrRetencionGanancias_IVA = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    imgLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    sdqDatos: TSDQuery;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlNombreAgente: TQRLabel;
    qrlCUITAgente: TQRLabel;
    qrlDomicilioAgente: TQRMemo;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    DetailBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    sdqFirma: TSDQuery;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure FormatMonto(sender: TObject; var Value: String);
  private
    FIdFirma: String;
    procedure SetIdFirma(const Value: string);
  public
    function Preparar(IdLiquidacion: TTableId): Boolean;
    property IdFirma: String       read FIdFirma      write SetIdFirma;
  end;                                                              

implementation
{$R *.DFM}

uses
  unComunes, Cuit, Strfuncs, unDmPrincipal;

const
  CONSULTA_FIRMA : string = 'SELECT FI_ID, FI_FIRMA, FI_FIRMANTE, FI_CARACTER ' +
                              'FROM CFI_FIRMA ' + 
                             'WHERE FI_FECHABAJA IS NULL ' +
                               'AND FI_ID = :FI_ID';

procedure TqrRetencionGanancias_IVA.SetIdFirma(const Value: string);
begin
  FIdFirma := Value;

  sdqFirma.SQL.Clear;
  sdqFirma.SQL.Add(CONSULTA_FIRMA);
  sdqFirma.ParamByName('FI_ID').AsString := FIdFirma;
  OpenQuery(sdqFirma);
end;

function TqrRetencionGanancias_IVA.Preparar(IdLiquidacion: TTableId): Boolean;
begin
  imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_AFIP_BYN');

  sdqDatos.ParamByName('IdLiqui').AsInteger := IdLiquidacion;
  OpenQuery(sdqDatos);

  ReportTitle := 'Certif. Ret. Gcias. - ' + IntToStr(IdLiquidacion);
  qrlNombreAgente.Caption       := ART_NOMBRE;
  qrlCUITAgente.Caption         := PonerGuiones(ART_CUIT);
  qrlDomicilioAgente.Lines.Text := ART_DOMICILIO + ' (' + ART_CPOSTAL + ') - ' + UpperCase(ART_LOCALIDAD);

  Result := not sdqDatos.Eof;
end;

procedure TqrRetencionGanancias_IVA.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.

