unit unrptliq53b;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, Numeros;

type
  Trpt532 = class(TQuickRep)
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
    QRLabel10: TQRLabel;
    LblReplegal: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
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
    QRDBText15: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRMemo2: TQRMemo;
    LblTotImporte: TQRLabel;
    LblTotPorc: TQRLabel;
    LblImporte: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText10: TQRDBText;
    LblREPLEG: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText11: TQRDBText;
    qriLogo: TQRImage;
    qrlCodBarras: TQRLabel;
    qrlNroExped: TQRLabel;
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq, iGrupoFamiliar: Integer);
  end;

var
  rpt532: Trpt532;

implementation

uses unDmPrincipal, uncomunes, AnsiSql, strfuncs;

var
  TotPorc :double;
  sProvincia :String;

{$R *.DFM}

procedure Trpt532.QRDBText15Print(sender: TObject; var Value: String);
begin
  Totporc := Totporc + sdqdetail.FieldByName('eb_porcentaje').AsFloat;
end;

procedure Trpt532.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  StrTexto: String;
  TotImporte: Double;
begin
  TotImporte            := sdqheader.fieldbyname('le_impiltp').asfloat;
  LblTotImporte.Caption := '$ ' + format('%8.2f', [TotImporte]);
  LblTotPorc.Caption    := FloatToStr(TotPorc * 100) + ' %';
  StrTexto              := 'Recibí de ' + sProvincia + ', en concepto de '+ ' anticipo de RENTA VITALICIA la suma de $ ' + format('%8.2f', [TotImporte]) + ' (' + numletras(TotImporte) + ')';
  Qrmemo2.Lines.Add(StrTexto);
  Qrmemo2.Lines.Add('');
  Qrmemo2.Lines.Add('Buenos Aires,' + valorsql('select actualdate from dual'));
  Qrmemo2.Refresh;
end;

procedure Trpt532.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Totporc    := 0;
end;

procedure Trpt532.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if sdqheader.fieldbyname('le_tipobeneficiario').asstring <> 'R' then
  begin
    lblreplegal.Caption   := '';
    lblrepleg.Caption     := '';
    lblreplegal.visible   := False;
    lblrepleg.visible     := False;
  end
  else begin
    lblreplegal.Caption   := 'Representante Legal';
    lblreplegal.visible   := True;
    lblrepleg.visible     := True;
    lblrepleg.Caption     := ValorSQL('SELECT eb_nombre ' +
                                       ' FROM seb_beneficiarios ' +
                                      ' WHERE eb_siniestro = ' + SqlInt(SDQHeader.FieldByName('le_siniestro').AsInteger) +
                                        ' AND eb_orden = ' + SqlInt(SDQHeader.FieldByName('le_orden').AsInteger) +
                                        ' AND eb_recaida = ' + SqlInt(SDQHeader.FieldByName('le_recaida').AsInteger) +
                                        ' AND eb_replegal= ''S'' ' +
                                        ' AND eb_grupofamiliar =' + SqlInt(SDQDETAIL.fieldbyname('eb_grupofamiliar').AsInteger));
  end;
end;

procedure Trpt532.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (sdqdetail.RecordCount > 0) then
    LblImporte.Caption  := '$ ' + Format('%8.2f', [sdqheader.FieldByName('le_impiltp').AsFloat / sdqdetail.RecordCount])
  else
    LblImporte.Caption  := '';
end;

constructor Trpt532.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TRpt532.DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq, iGrupoFamiliar: Integer);
var
  bEsSinGobernacion :Boolean; sNroExpediente: string;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    sProvincia          := ART_NOMBRE_GOB_L;
    qrlEmpDep.Caption   := 'DEPENDENCIA GPBA';
    qrlCuit.Width       := 0;
    qrdbCuit.Width      := 0;
    qrlContrato.Width   := 0;
    qrdbContrato.Width  := 0;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    sProvincia          := ART_NOMBRE2;
    qrlEmpDep.Caption   := 'EMPRESA';
  end;

  sdqHeader.ParamByName('pSiniestro').Value := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value     := iOrden;
  sdqHeader.ParamByName('pRecaida').Value   := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value      := iNLiq;
  sdqHeader.Open;

  sdqDetail.ParamByName('pSiniestro').Value := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value     := iOrden;
  sdqDetail.ParamByName('pRecaida').Value   := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value      := iNLiq;
  sdqDetail.Open;

  sNroExpediente := lpad(isiniestro, '0', 8) + lpad(iorden, '0', 2) +
                    lpad(irecaida, '0', 2) + lpad(iNLiq, '0', 3);
  qrlNroExped.Caption := sNroExpediente;
  qrlCodBarras.Caption := '*' + sNroExpediente + '*';

  Print;
end;


end.
