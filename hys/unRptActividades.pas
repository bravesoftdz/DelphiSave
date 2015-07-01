unit unRptActividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine;

type
  TrptActividades = class(TForm)
    qrResolucion: TQuickRep;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRDBText4: TQRDBText;
    QRShape12: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape13: TQRShape;
    QRDBText1: TQRDBText;
    QRShape14: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRDBText3: TQRDBText;
    QRShape21: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRDBText7: TQRDBText;
    QRShape28: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRDBText9: TQRDBText;
    QRShape35: TQRShape;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRDBText11: TQRDBText;
    QRShape42: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape48: TQRShape;
    QRDBText13: TQRDBText;
    QRShape49: TQRShape;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape55: TQRShape;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    sdqEmpresa: TSDQuery;
    lbDenunciaSRT: TQRLabel;
    lblcuit: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape19: TQRShape;
    QRShape26: TQRShape;
    QRShape33: TQRShape;
    QRShape40: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape47: TQRShape;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrRazonSocial: TQRDBText;
    qrDireccion: TQRDBText;
    qrTelefono: TQRDBText;
    qrCuit: TQRDBText;
    qrContrato: TQRDBText;
    qrCIIU: TQRDBText;
    qrDireccionobrador: TQRDBText;
    qrTelEstablecimiento: TQRDBText;
    QRShape59: TQRShape;
    QRLabel30: TQRLabel;
    lbObraDesc: TQRLabel;
    sdqActividades: TSDQuery;
    QRLabel31: TQRLabel;
    lblfirmaprofart: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel34: TQRLabel;
    sdqAvisoObra: TSDQuery;
    QRDBText18: TQRDBText;
    logo: TQRImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCUIT : String;
    FEstableci : Integer;
    FTipo : String;
    FOperativo : String;
    procedure CerrarSdq;
    procedure Carga(Cuit: String; Establecimiento: Integer; Tipo,
      Operativo: String);

  public
    { Public declarations }
    function GuardarenPDF(Cuit: String; Establecimiento: Integer; Tipo,
      Operativo: String): String;
    procedure Load(Cuit : String; Establecimiento :Integer; Tipo, Operativo :  String);
  end;

var
  rptActividades: TrptActividades;

implementation

{$R *.dfm}
uses unVisualizador, unDmPrincipal, AnsiSql, ArchFuncs, unExportPDF;

procedure TrptActividades.FormCreate(Sender: TObject);
begin
  sdqActividades.ParamByName('cuit').AsString := FCUIT;
  sdqActividades.ParamByName('estableci').AsInteger := FEstableci;
  sdqActividades.ParamByName('tipo').AsString := FTipo;
  sdqActividades.ParamByName('operativo').AsString := FOperativo;
end;


procedure TrptActividades.Load(Cuit : String; Establecimiento :Integer; Tipo, Operativo :  String);
begin
  Carga(Cuit,Establecimiento,Tipo,Operativo);
  Visualizar(qrResolucion, GetValores('', '', 0), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB]);
  //  qrResolucion.Prepare;
  //  qrResolucion.Print;
  CerrarSdq;
end;

procedure TrptActividades.CerrarSdq;
begin
  sdqEmpresa.Close;
  sdqAvisoObra.Close;
  sdqActividades.Close;
end;

procedure TrptActividades.Carga(Cuit : String; Establecimiento :Integer; Tipo, Operativo :  String);
begin
  FCUIT := Cuit;
  FEstableci := Establecimiento;
  FTipo := Tipo;
  FOperativo := Operativo;
  sdqEmpresa.ParamByName('cuit').AsString := FCUIT;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('cuit').AsString := FCUIT;
  sdqAvisoObra.ParamByName('estableci').AsInteger := FEstableci;
  sdqAvisoObra.ParamByName('tipo').AsString := FTipo;
  sdqActividades.ParamByName('cuit').AsString := FCUIT;
  sdqActividades.ParamByName('estableci').AsInteger := FEstableci;
  sdqActividades.ParamByName('tipo').AsString := FTipo;
  sdqActividades.ParamByName('operativo').AsString := FOperativo;
  lbDenunciaSRT.Enabled := ExisteSql(
        ' SELECT 1 '+
        '   FROM art.pao_avisoobra '+
        '  WHERE ao_cuit = '+SqlValue(FCUIT)+
        '    AND ao_estableci = '+ SqlValue(FEstableci)+
        '    AND ao_tipo = '+SqlValue(FTipo)+
        //'    AND ao_operativo = '+SqlValue(FOperativo)+
        '    AND ao_informarsrt = ''S'' ');
  if ExisteSql(
        ' SELECT 1 '+
        '   FROM art.pao_avisoobra '+
        '  WHERE ao_cuit = '+SqlValue(FCUIT)+
        '    AND ao_estableci = '+ SqlValue(FEstableci)+
        '    AND ao_tipo = '+SqlValue(FTipo)+
        '    AND ao_fecharecepcion is not null '
        //'    AND ao_operativo = '+SqlValue(FOperativo)
        ) then
     lbObraDesc.Caption := ValorSql(
        ' SELECT ao_observaciones '+
        '   FROM art.pao_avisoobra '+
        '  WHERE ao_cuit = '+SqlValue(FCUIT)+
        '    AND ao_estableci = '+ SqlValue(FEstableci)+
        '    AND ao_tipo = '+SqlValue(FTipo))
        //'    AND ao_operativo = '+SqlValue(FOperativo))
  else
        lbObraDesc.Caption := ValorSql(
        ' SELECT PS_DESCOBRAS '+
        '   FROM hys.hps_programaseguridad '+
        '  WHERE ps_cuit = '+SqlValue(FCUIT)+
        '    AND ps_establecimiento IS NULL');
  sdqActividades.Open;
  sdqAvisoObra.Open;
  sdqEmpresa.Open;
end;

function TrptActividades.GuardarenPDF(Cuit : String; Establecimiento :Integer; Tipo, Operativo :  String): String;
var
  PathPdf : String;
begin
  Carga(Cuit,Establecimiento,Tipo,Operativo);
  PathPdf := TempPath +'Actividades.pdf';
  if FileExists(PathPdf) then
  begin
    DeleteFile(PathPdf);
  end;
  ExportarPDF(qrResolucion, PathPdf);
  Result :=  PathPdf;
  CerrarSdq;
end;

end.
