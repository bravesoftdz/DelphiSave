unit unQRAnexoA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Qrctrls, QuickRpt, ExtCtrls, Db, SDEngine,
  QRPrntr;
type
  TQRAnexoA = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    qrLogoImage: TQRImage;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    ColumnHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    qrCUIT: TQRLabel;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    qrInfoAdicional: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    sdqQuery: TSDQuery;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LeftTrimOnPrint(Sender: TObject; var Value: String);
  private
    FContrato: Integer;
  public
    procedure Preparar(aCantCopias: Integer; aImprimir: Boolean = False; const aNombreArchivo: String = '');

    property Contrato: Integer read FContrato write FContrato;
  end;

var
  QRAnexoA: TQRAnexoA;

implementation

uses
  unDmPrincipal, unPrincipal, General, unArt, unExportPDF, AnsiSql;

const
  SQLANEXOA: String =
    'SELECT es_nombre AS nombre, es_contrato AS contrato, ac_codigo AS cod_actividad,' +
          ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL)' +
          ' || art.utiles.armar_localidad(es_cpostal, es_cpostala, es_localidad, es_provincia) es_domicilio' +
     ' FROM aes_establecimiento, cac_actividad' +
    ' WHERE ac_id = es_idactividad' +
      ' AND es_fechabaja IS NULL';

{$R *.DFM}

procedure TQRAnexoA.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  try
    qrLogoImage.Picture.Bitmap.LoadFromResourceName(HInstance, RES_EMP_LOGO_BN);
  except
    //
  end;
end;

procedure TQRAnexoA.LeftTrimOnPrint(Sender: TObject; var Value: String);
begin
  inherited;

  Value := Trim(Value);
end;

procedure TQRAnexoA.Preparar(aCantCopias: Integer; aImprimir: Boolean = False; const aNombreArchivo: String = '');
var
  sCuit: String;
  sSql: String;
begin
  sSql :=
    'SELECT em_cuit' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_contrato = :contrato';
  sCuit := ValorSqlEx(sSql, [FContrato], '0');
  qrCuit.Caption := Copy(sCuit, 1, 2) + '-' + Copy(sCuit, 3, 8) + '-' + Copy(sCuit, 11, 1);
  qrInfoAdicional.Caption := frmPrincipal.DBLogin.Usuario + ' - ' + DateToStr(Date);

  OpenQuery(sdqQuery, SQLANEXOA + ' AND es_contrato = ' + SqlValue(FContrato), True);
  PrinterSettings.Copies := aCantCopias;

  // Agregado para que salga bien la carga de impresión masiva de contratos en la impresora LaserJet 4050 de Afiliaciones..
  if (IsWinXP) or (IsWindows7) then
  begin
    PrinterSettings.UseCustomBinCode := False;
    PrinterSettings.OutputBin := LexmarkAfiliacionesBin1;
    PrinterSettings.PaperSize := Letter;
  end;

  if aNombreArchivo <> '' then
    FileToPDFSvr(QRAnexoA, ExtractFileDir(aNombreArchivo), aNombreArchivo, True)
  else if aImprimir then
    Print
  else
    Preview;
end;

end.
