unit unRptResolucionSRT51SinVisita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, ArtQReports;

type
  TrptResolucionSRT51SinVisita = class(TForm)
    sdqEmpresa: TSDQuery;
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
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
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
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
    qrDireccion: TQRDBText;
    qrTelefono: TQRDBText;
    qrCuit: TQRDBText;
    qrContrato: TQRDBText;
    qrRecepcion: TQRDBText;
    qrCIIU: TQRDBText;
    qrDireccionobrador: TQRDBText;
    qrFechaPS: TQRDBText;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    qrDescripcion: TQRDBText;
    QRShape40: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText3: TQRDBText;
    sdqAvisoObra: TSDQuery;
    logo: TQRImage;
    QRShape70: TQRShape;
    qrlbResolucion: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape71: TQRShape;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    cbFechaAnexo: TQRChildBand;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText4: TQRDBText;
    QRChildBand1: TQRChildBand;
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
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText2: TQRDBText;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
  private
    FCuit         : String;
    FEstableci    : Integer;
    FTipo         : String;
    FPath         : String;
    { Private declarations }
  public
    procedure Load(Cuit: String; Estableci: Integer; Tipo: String);
    procedure Exportar(Cuit: String; Estableci: Integer; Tipo: String; sPath : String = '');
    procedure cambioResolucion(resolucion: String);
    procedure Close;
    { Public declarations }
  end;

var
  rptResolucionSRT51SinVisita: TrptResolucionSRT51SinVisita;

implementation

{$R *.dfm}
uses unVisualizador, unExportPdf;

procedure TrptResolucionSRT51SinVisita.cambioResolucion(resolucion: String);
begin
  if resolucion = '2' then    // el 2 es 35 
    qrlbResolucion.Caption := 'EN CONSTRUCCIÓN RESOLUCIÓN S.RT. Nº 35/98'
  else
    qrlbResolucion.Caption := 'EN CONSTRUCCIÓN RESOLUCIÓN S.RT. Nº 51/97';
end;

procedure TrptResolucionSRT51SinVisita.Close;
begin
  sdqEmpresa.Close;
  sdqAvisoObra.Close;
end;

procedure TrptResolucionSRT51SinVisita.Exportar(Cuit: String; Estableci: Integer; Tipo: String; sPath : String = '');
begin
  FPath := sPath;
  Load(Cuit,Estableci,Tipo);
end;

procedure TrptResolucionSRT51SinVisita.FormCreate(Sender: TObject);
begin
  Logo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
end;

procedure TrptResolucionSRT51SinVisita.Load(Cuit: String; Estableci: Integer;
  Tipo: String);
begin
  FCuit       :=Cuit;
  FEstableci  := Estableci;
  FTipo       := Tipo;

  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
  sdqEmpresa.Open;
  sdqAvisoObra.Open;

  qrlNumero.Caption := sdqAvisoObra.FieldByName('codbarrasclave').AsString;

  if sdqAvisoObra.FieldByName('PS_REQUIEREFECHAANEXO').Text = 'S' then
  begin
    cbFechaAnexo.Enabled := True;
  end
  else
  begin
    cbFechaAnexo.Enabled := False;
  end;

  qrResolucion.Prepare;
  if FPath = '' then
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  else
    ExportarPDF(qrResolucion,FPath);
end;


procedure TrptResolucionSRT51SinVisita.qrlBarrasPrint(sender: TObject; var Value: String);
begin
  Value := '*' + qrlNumero.Caption + '*';
end;

end.
