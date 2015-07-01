unit unRptResolucionSRT51;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, SDEngine, ArtQReports;

type
  TrptResolucionSRT51 = class(TForm)
    sdqEmpresa: TSDQuery;
    sdqVisitas: TSDQuery;
    sdqAvisoObra: TSDQuery;
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
    logo: TQRImage;
    QRShape70: TQRShape;
    lblcuit: TQRLabel;
    qrlbResolucion: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape11: TQRShape;
    QRShape71: TQRShape;
    QRDBText1: TQRDBText;
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
    QRShape45: TQRShape;
    QRShape44: TQRShape;
    QRLabel2: TQRLabel;
    QRShape46: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    lblfirmaprofart: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    qrLabelVisita2: TQRLabel;
    qrLabelVisita8: TQRLabel;
    qrLabelVisita14: TQRLabel;
    qrLabelVisita20: TQRLabel;
    QRShape43: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    qrLabelVisita4: TQRLabel;
    QRLabel47: TQRLabel;
    qrLabelVisita10: TQRLabel;
    qrLabelVisita16: TQRLabel;
    qrLabelVisita22: TQRLabel;
    QRShape55: TQRShape;
    QRShape51: TQRShape;
    QRShape57: TQRShape;
    QRShape56: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRLabel49: TQRLabel;
    qrLabelVisita3: TQRLabel;
    qrLabelVisita9: TQRLabel;
    qrLabelVisita15: TQRLabel;
    qrLabelVisita21: TQRLabel;
    QRLabel38: TQRLabel;
    qrLabelVisita1: TQRLabel;
    qrLabelVisita7: TQRLabel;
    qrLabelVisita13: TQRLabel;
    qrLabelVisita19: TQRLabel;
    QRLabel50: TQRLabel;
    qrLabelVisita5: TQRLabel;
    qrLabelVisita11: TQRLabel;
    qrLabelVisita17: TQRLabel;
    qrLabelVisita23: TQRLabel;
    qrLabelVisita6: TQRLabel;
    qrLabelVisita12: TQRLabel;
    qrLabelVisita18: TQRLabel;
    qrLabelVisita24: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    qrLabelVisita26: TQRLabel;
    qrLabelVisita32: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    qrLabelVisita28: TQRLabel;
    qrLabelVisita34: TQRLabel;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    qrLabelVisita27: TQRLabel;
    qrLabelVisita33: TQRLabel;
    qrLabelVisita25: TQRLabel;
    qrLabelVisita31: TQRLabel;
    qrLabelVisita29: TQRLabel;
    qrLabelVisita35: TQRLabel;
    qrLabelVisita30: TQRLabel;
    qrLabelVisita36: TQRLabel;
    QRLabel10: TQRLabel;
    qrlBarras: TArtQRLabel;
    qrlNumero: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText5: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
    FCuit         : String;
    FEstableci    : Integer;
    FTipo         : String;
    FID           : String;
    FPath         : String;
  public
    { Public declarations }
    procedure cambioResolucion(resolucion : String);
    procedure Load(Cuit : String; Estableci : Integer; Tipo : String; PS_ID : String);
    procedure Exportar(Cuit : String; Estableci : Integer; Tipo : String; PS_ID : String; sPath : String = '');
    procedure Close;
  end;

var
  rptResolucionSRT51: TrptResolucionSRT51;

implementation

{$R *.dfm}
uses unVisualizador, unExportPDF;
{ TrptResolucionSRT51 }

procedure TrptResolucionSRT51.cambioResolucion(resolucion: String);
begin
  if resolucion = '2' then
    qrlbResolucion.Caption := 'EN CONSTRUCCIÓN RESOLUCIÓN S.RT. Nº 35/98'
  else
    qrlbResolucion.Caption :=  'EN CONSTRUCCIÓN RESOLUCIÓN S.RT. Nº 51/97';
end;

procedure TrptResolucionSRT51.Close;
begin
  sdqEmpresa.Close;
  sdqVisitas.Close;
  sdqAvisoObra.Close;
end;

procedure TrptResolucionSRT51.FormCreate(Sender: TObject);
begin
  Logo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
//  sdqVisitas.ParamByName('ps_id').AsString := FID;
  sdqVisitas.ParamByName('cuit').AsString := FCUIT;
  sdqVisitas.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
end;

procedure TrptResolucionSRT51.Load(Cuit: String; Estableci: Integer;
  Tipo: String;PS_ID : String);
var
  visitas : Integer;
begin
  FCuit       :=Cuit;
  FEstableci  := Estableci;
  FTipo       := Tipo;
  FID         := PS_ID;

  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
//  sdqVisitas.ParamByName('ps_id').AsString := FID;
  sdqVisitas.ParamByName('cuit').AsString := FCUIT;
  sdqVisitas.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
  sdqEmpresa.Open;
  sdqVisitas.Open;
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
  sdqVisitas.First;
  visitas := 0;
  while not sdqVisitas.Eof and (sdqVisitas.RecNo {$IFNDEF VER150}- 1{$ENDIF} < 36) do
  begin
    TQRLabel(Self.FindComponent('qrLabelVisita'+ IntToStr(sdqVisitas.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=  sdqVisitas.FieldByName('fv_fecha').AsString;
    sdqVisitas.Next;
    visitas := visitas+1;
  end;

  while visitas < 36 do
  begin
    TQRLabel(Self.FindComponent('qrLabelVisita'+ IntToStr(visitas+1))).Caption :=  '';
    visitas := visitas+1;
  end;

  if FPath = '' then
    Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB])
  else
    ExportarPDF(qrResolucion, FPath);
end;

procedure TrptResolucionSRT51.qrlBarrasPrint(sender: TObject; var Value: String);
begin
  Value := '*' + qrlNumero.Caption + '*';
end;

procedure TrptResolucionSRT51.Exportar(Cuit: String; Estableci: Integer;
  Tipo, PS_ID : String; sPath: String = '' );
begin
  FPath := sPath;
  Load(Cuit,estableci,Tipo,PS_ID);
end;


end.
