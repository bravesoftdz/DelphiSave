unit unQrRemitoAdminEnvioRecepcionDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx, StdCtrls, Mask, DBCtrls;

type
  TqrRemitoAdminEnvioRecepcionDoc = class(TForm)
    sdqConsulta: TSDQuery;
    qrpRemito: TQuickRep;
    qrbDetailValoresYPeriodos: TQRBand;
    qrbTituloPeriodos: TQRBand;
    qrbHeader: TQRBand;
    qrsSeparadorFecha1: TQRShape;
    qrsSeparadorFecha2: TQRShape;
    qrlDia: TQRLabel;
    qrlMes: TQRLabel;
    qrlAnio: TQRLabel;
    qrlNumero: TQRLabel;
    qrsVert1Valores: TQRShape;
    qrgValores: TQRGroup;
    qcbValoresYPeriodos: TQRChildBand;
    qrsVert1HeaderValores: TQRShape;
    qrsVert3HeaderValores: TQRShape;
    qrlPagina: TQRLabel;
    qrsVert2Valores: TQRShape;
    qrbGroupFooterPeriodos: TQRBand;
    qreSumaHojas: TQRExpr;
    qrbSummaryBand: TQRBand;
    qrlLoteEnvioDocumentacion: TQRLabel;
    dsConsulta: TDataSource;
    qrdbTipo: TQRDBText;
    qrlArchivo: TQRLabel;
    qrlDocumento: TQRLabel;
    qrdbDocumento: TQRDBText;
    qrlLabelOpcionDestino: TQRLabel;
    qrdbHojas: TQRDBText;
    qrdbObservaciones: TQRDBText;
    qrsVert2Periodos: TQRShape;
    qrsSepardado10: TQRShape;
    qrlObservaciones: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrsFondoTitulos: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRShape6: TQRShape;
    qriLogo: TQRImage;
    qrlFirmaConforme: TQRLabel;
    qrsLineaFirma: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText3: TQRDBText;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirRemitoAdmin(IdRemito: TTableID);
  end;

implementation

Uses
  AnsiSql, unDmPrincipal, unCustomDataModule, CustomDlgs, General, Numeros,
  strFuncs, unPrincipal, ArtFuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TqrRemitoAdminEnvioRecepcionDoc.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TqrRemitoAdminEnvioRecepcionDoc.ImprimirRemitoAdmin(IdRemito: TTableID);
var
  dFechaRemito: TDateTime;
  sSql: String;
begin
  sSql := 'SELECT LPAD(EC_REMITOADMIN, 8, 0) REMITO, EC_FECHAIMPRESIONADMIN ' +
            'FROM REC_ENVIORECEPCIONDOC ' +
           'WHERE EC_REMITOADMIN = :IdRemito';

  with GetQueryEx(sSql, [IdRemito]) do
    try
      if Eof then
        begin
          MsgBox('No se han encontrado los datos del remito.', MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end
      else
        begin
          dFechaRemito      := FieldByName('EC_FECHAIMPRESIONADMIN').AsDateTime;
          qrlDia.Caption    := FormatDateTime('dd', dFechaRemito);
          qrlMes.Caption    := FormatDateTime('mm', dFechaRemito);
          qrlAnio.Caption   := FormatDateTime('yyyy', dFechaRemito);
          qrlNumero.Caption := 'Remito Nº ' + FieldByName('REMITO').AsString;
        end;
    finally
      Free;
    end;

  sdqConsulta.ParamByName('REMITO').AsInteger := IdRemito;
  sdqConsulta.Open;

  if sdqConsulta.IsEmpty then
    MessageDlg('No se encontró el remito que intenta imprimir.', mtInformation, [mbOK], 0)
  else
    with qrpRemito do
      begin
        PrinterSettings.Copies := 2;
        Print;
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TqrRemitoAdminEnvioRecepcionDoc.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr(qrpRemito.PageNumber);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


