unit unRptResolucionSrt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, ArtQReports;

type
  TrptResolucionSRT = class(TForm)
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
    lblcuit: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrRazonSocial: TQRDBText;
    qrTelefono: TQRDBText;
    qrCuit: TQRDBText;
    qrContrato: TQRDBText;
    qrRecepcion: TQRDBText;
    qrCIIU: TQRDBText;
    qrDireccionobrador: TQRDBText;
    qrTelEstablecimiento: TQRDBText;
    qrFechaPS: TQRDBText;
    qrDireccion: TQRDBText;
    sdqEmpresa: TSDQuery;
    sdqVisitas: TSDQuery;
    sdqAvisoObra: TSDQuery;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    PageHeaderBand1: TQRBand;
    logo: TQRImage;
    QRSysData1: TQRSysData;
    lbCantPag: TQRLabel;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
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
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrFechaInicio: TQRDBText;
    qrFechaFinal: TQRDBText;
    qrCantPersonal: TQRDBText;
    qrResponsable: TQRDBText;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel54: TQRLabel;
    lblfirmaprofart: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel38: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    cbFechaAnexo: TQRChildBand;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText3: TQRDBText;
    lbObraDesc: TQRLabel;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText4: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
    FCuit         : String;
    FEstableci    : Integer;
    FTipo         : String;
    FPath         : String;
  public
    { Public declarations }
    procedure Load(Cuit : String; Estableci : Integer; Tipo : String);
    procedure Exportar(Cuit : String; Estableci : Integer; Tipo : String;sPath : String = '');
    procedure Close;
  end;

var
  rptResolucionSRT: TrptResolucionSRT;

implementation

{$R *.dfm}
uses unVisualizador, unDmPrincipal, AnsiSql, unExportPdf;

{ TForm1 }

procedure TrptResolucionSRT.Close;
begin
  sdqEmpresa.Close;
  sdqVisitas.Close;
  sdqAvisoObra.Close;
end;

procedure TrptResolucionSRT.Exportar(Cuit : String; Estableci : Integer; Tipo : String;sPath : String = '');
begin
  FPath := sPath;
  Load(Cuit,Estableci,Tipo);
end;

procedure TrptResolucionSRT.FormCreate(Sender: TObject);
begin
  Logo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqVisitas.ParamByName('cuit').AsString := FCUIT;
  sdqVisitas.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
end;


procedure TrptResolucionSRT.Load(Cuit: String; Estableci: Integer; Tipo: String);
begin
  FCuit       :=Cuit;
  FEstableci  := Estableci;
  FTipo       := Tipo;

  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqVisitas.ParamByName('cuit').AsString := FCUIT;
  sdqVisitas.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
  sdqEmpresa.Open;
  sdqVisitas.Open;
  sdqAvisoObra.Open;

  if ExisteSql(
        ' SELECT 1 '+
        '   FROM art.pao_avisoobra '+
        '  WHERE ao_cuit = '+SqlValue(FCUIT)+
        '    AND ao_estableci = '+ SqlValue(FEstableci)+
        '    AND ao_fecharecepcion is not null '+
        '    AND ao_tipo = '+SqlValue(FTipo)) then
  begin
     lbObraDesc.Caption := ValorSql(
        ' SELECT ao_observaciones '+
        '   FROM art.pao_avisoobra '+
        '  WHERE ao_cuit = '+SqlValue(FCUIT)+
        '    AND ao_estableci = '+ SqlValue(FEstableci)+
        '    AND ao_tipo = '+SqlValue(FTipo));

     qrlNumero.Caption := sdqAvisoObra.FieldByName('codbarrasclave').AsString;
  end
  else
  begin
     lbObraDesc.Caption := ValorSql(
     ' SELECT PS_DESCOBRAS '+
     '   FROM hys.hps_programaseguridad '+
     '  WHERE ps_cuit = '+SqlValue(FCUIT)+
     '    AND ps_establecimiento = '+SqlValue(FEstableci));

     qrlNumero.Caption := '';
  end;

  if sdqAvisoObra.FieldByName('ps_fechaextension').IsNull then
  begin
    ChildBand1.Enabled := False;
  end
  else
  begin
    ChildBand1.Enabled := True;
  end;

  if sdqAvisoObra.FieldByName('PS_REQUIEREFECHAANEXO').Text = 'S' then
  begin
    cbFechaAnexo.Enabled := True;
  end
  else
  begin
    cbFechaAnexo.Enabled := False;
  end;

  qrResolucion.Prepare;
  lbCantPag.Caption := '/ '+ IntToStr(qrResolucion.PageNumber);
  if FPath = '' then
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  else
    ExportarPDF(qrResolucion,FPath);
end;

procedure TrptResolucionSRT.qrlBarrasPrint(sender: TObject; var Value: String);
begin
  Value := '*' + qrlNumero.Caption + '*';
end;

end.
