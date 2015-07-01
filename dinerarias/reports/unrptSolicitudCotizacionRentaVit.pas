unit unrptSolicitudCotizacionRentaVit;  { by NWK, 18/03/03 }

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  Numeros;

type
  TrptSolicitudCotizacionRentaVit = class(TQuickRep)
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    SDQDetail: TSDQuery;
    DSDetail: TDataSource;
    DSHeader: TDataSource;
    SDQHeader: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrdbCuit: TQRDBText;
    qrdbContrato: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRMemo2: TQRMemo;
    QRShape2: TQRShape;
    QRMemo3: TQRMemo;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    qrdbtImporteDeterminado: TQRDBText;
    qrdbtImporteAnticipos: TQRDBText;
    QRShape3: TQRShape;
    QRMemo4: TQRMemo;
    qrgGrupoBeneficiarios: TQRGroup;
    qrbDetalleBeneficiarios: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    qrlContrato: TQRLabel;
    qrlCuit: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel11: TQRLabel;
    qriLogo: TQRImage;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText12Print(Sender: TObject; var Value: String);
    procedure QRDBText15Print(Sender: TObject; var Value: String);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    sProvincia: String;
    TotalPorc: Double;

    function IsRepresentanteLegal: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  rptSolicitudCotizacionRentaVit: TrptSolicitudCotizacionRentaVit;

implementation

uses
  unDmPrincipal, AnsiSql, unComunes;

{$R *.DFM}

procedure TrptSolicitudCotizacionRentaVit.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  cPorcDiv: Currency;
  sSql: String;
begin
  sSql :=
    'SELECT NVL(SUM(eb_porcentaje), 0) * 100' +
     ' FROM seb_beneficiarios' +
    ' WHERE eb_siniestro = ' + SqlValue(sdqDetail.ParamByName('pSiniestro').AsInteger) +
      ' AND eb_orden = ' + SqlValue(sdqDetail.ParamByName('pOrden').AsInteger) +
      ' AND eb_recaida = ' + SqlValue(sdqDetail.ParamByName('pRecaida').AsInteger) +
      ' AND eb_fechabaja IS NULL' +
      ' AND NVL(eb_controversia, ''N'') <> ''N''';
  cPorcDiv := ValorSqlExtended(sSql);

  Qrmemo4.Lines.Clear;
  if cPorcDiv > 0 then
  begin
    Qrmemo4.Lines.Add('ASIMISMO COMUNICAMOS QUE ATENTO QUE EXISTE UNA CONTROVERSIA/RESERVA QUEDARA PENDIENTE DE COTIZAR Y DEPOSITAR EL: ' + Format('%6.3f', [cPorcDiv]) + ' %.' );
    Qrmemo4.Lines.Add('CAPITAL DETERMINADO DE LOS MENORES: $ ' + Trim(Format('%12.2f', [SDQHeader.FieldByName('IMPDETERMINADO').AsCurrency * TotalPorc])) + '.');
  end;
  Qrmemo4.Refresh;
  Qrmemo3.Lines.Clear;
  Qrmemo3.Lines.Add('Se informa a los derechohabientes que el monto a percibir en concepto de Renta Vitalicia una vez realizada la selección puede llegar a ser menor al que figura en la cotización realizada ' +
                    'por la Compañía de Seguros de Retiro debido a que sobre el monto del capital cotizado se descontarán los anticipos devengados hasta la fecha del traspaso del capital.' );
  Qrmemo3.Lines.Add('La presentación de este formulario por parte del solicitante en cualquier Cía. de Seguros de Retiro no le genera obligación alguna.');
  Qrmemo3.Refresh;
  Qrmemo2.Lines.Clear;
  Qrmemo2.Lines.Add('Sin otro particular, saludamos a Uds. muy atentamente.');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('Buenos Aires, ' + valorsql('SELECT actualdate FROM dual'));
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add(sProvincia);
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('JORGE AMIEVA');
  Qrmemo2.Lines.Add('PRESTACIONES DINERARIAS');
  Qrmemo2.Refresh;
end;

constructor TrptSolicitudCotizacionRentaVit.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TrptSolicitudCotizacionRentaVit.QRDBText12Print(Sender: TObject; var Value: String);
begin
  if IsRepresentanteLegal() then
    Value := '';
end;

function TrptSolicitudCotizacionRentaVit.IsRepresentanteLegal: Boolean;
begin
  Result := (Trim(UpperCase(sdqDetail.FieldByName('CARACTER').AsString)) = 'REP. LEGAL');
end;

procedure TrptSolicitudCotizacionRentaVit.QRDBText15Print(Sender: TObject; var Value: String);
begin
  if IsRepresentanteLegal() then
    Value := ''
  else
    TotalPorc := TotalPorc + sdqDetail.FieldByName('EB_PORCENTAJE').AsFloat;
end;

procedure TrptSolicitudCotizacionRentaVit.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  TotalPorc := 0;
end;

procedure TrptSolicitudCotizacionRentaVit.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  bEsSinGobernacion: Boolean;
  iIdExped: integer;
begin
  iIdExped          := Get_IdExpediente(sdqDetail.ParamByName('pSiniestro').AsInteger, sdqDetail.ParamByName('pOrden').AsInteger, sdqDetail.ParamByName('pRecaida').AsInteger);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    sProvincia         := ART_NOMBRE_GOB_L;
    qrlEmpDep.Caption  := 'DEPENDENCIA GPBA';
    qrlCuit.Width      := 0;
    qrdbCuit.Width     := 0;
    qrlContrato.Width  := 0;
    qrdbContrato.Width := 0;
  end
  else
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    sProvincia        := ART_NOMBRE2;
    qrlEmpDep.Caption := 'EMPRESA';
  end;
end;

end.
