unit unrptliq8b;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, Db, SDEngine, Numeros;

type
  Trpt82 = class(TQuickRep)
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlEmpDep: TQRLabel;
    qrlCuit: TQRLabel;
    qrlContrato: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
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
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRMemo2: TQRMemo;
    QRDBText12: TQRDBText;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRLabel10: TQRLabel;
    QRLAFJP: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    LblImporte: TQRLabel;
    QRDBText15: TQRDBText;
    LblTotImporte: TQRLabel;
    LblTotPorc: TQRLabel;
    QRShape2: TQRShape;
    QRDBText10: TQRDBText;
    qriLogo: TQRImage;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    qrlCodBarras: TQRLabel;
    qrlNroExped: TQRLabel;
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq: Integer);
  end;

var
  rpt82: Trpt82;

implementation

uses
  unDmPrincipal, uncomunes, strfuncs;

var
  sProvincia: String;
  TotPorc: Double;

{$R *.DFM}

procedure Trpt82.QRDBText15Print(sender: TObject; var Value: String);
begin
  Totporc := Totporc + sdqdetail.FieldByName('eb_porcentaje').AsFloat;
end;

procedure Trpt82.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Totporc := 0;
end;

constructor Trpt82.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure Trpt82.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (sdqdetail.RecordCount > 0) then
    LblImporte.Caption  := '$ ' + Format('%8.2f', [sdqheader.FieldByName('le_impiltp').AsFloat / sdqdetail.RecordCount])
  else
    LblImporte.Caption  := '';
end;

procedure TRpt82.DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq: Integer);
var
  bEsSinGobernacion: Boolean; sNroExpediente: string;
  TotImporte: Double;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
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

  sdqHeader.ParamByName('pSiniestro').Value  := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value      := iOrden;
  sdqHeader.ParamByName('pRecaida').Value    := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value       := iNLiq;
  sdqHeader.Open;

  sdqDetail.ParamByName('pSiniestro').Value  := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value      := iOrden;
  sdqDetail.ParamByName('pRecaida').Value    := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value       := iNLiq;
  sdqDetail.Open;

  TotImporte            := sdqheader.FieldByName('le_impiltp').AsFloat;
  LblTotImporte.Caption := '$ ' + Format('%8.2f', [TotImporte]);

  Qrmemo4.Lines.Clear;
  Qrmemo2.Lines.Clear;
  Qrmemo4.Lines.Add('Copia del certificado de Defunción');
  Qrmemo4.Lines.Add('Certificados que acreditan la calidad de derechohabientes');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('            Finalmente se informa que hemos procedido en un todo de acuerdo a la metodología normada en la Res. 24.852 de la S.S.N.');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('            Sin otro particular, saludamos a Uds. muy atentamente.');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('Buenos Aires, ' + ValorSql('select actualdate from dual'));
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add(sProvincia);
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('JORGE AMIEVA');
  Qrmemo2.Lines.Add('PRESTACIONES DINERARIAS');
  Qrmemo2.Refresh;


  QRLAFJP.caption := 'Sres. ' + ValorSqlEx('SELECT ju_nombre ju, os_descripcion os' +
                                            ' FROM art.sju_jubilacion, art.cos_osocial, art.secb_cbaseexpsin' +
                                           ' WHERE cb_siniestro = :Sin ' +
                                             ' AND cb_orden = :Ord ' +
                                             ' AND cb_afjp = ju_codigo(+)' +
                                             ' AND cb_obrasocial = os_codigo(+)',
                                            [iSiniestro, iOrden]);
  qrmemo3.Lines.Clear;
  qrmemo3.Lines.Add('Tenemos el agrado de dirigirnos a Uds. a fin de adjuntarles los datos correspondientes a los' +
                    ' derechohabientes del/la Sr./a. ' + sdqheader.FieldByName('tj_nombre').AsString +
                    ' nº de C.U.I.L.:' + sdqheader.FieldByName('CUIL').AsString);

  sNroExpediente := lpad(isiniestro, '0', 8) + lpad(iorden, '0', 2) +
                    lpad(irecaida, '0', 2) + lpad(iNLiq, '0', 3);
  qrlNroExped.Caption := sNroExpediente;
  qrlCodBarras.Caption := '*' + sNroExpediente + '*';

  Print;
end;

procedure Trpt82.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  LblTotPorc.Caption := FloatToStr(TotPorc * 100) + ' %';
end;

end.
