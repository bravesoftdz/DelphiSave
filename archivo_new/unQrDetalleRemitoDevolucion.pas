unit unQrDetalleRemitoDevolucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx, StdCtrls, Mask, DBCtrls;

type
  TQrDetalleRemitoDevolucion = class(TForm)
    sdqConsulta: TSDQuery;
    qrpRemito: TQuickRep;
    qrbDetalle: TQRBand;
    qrbTituloPeriodos: TQRBand;
    qrbHeader: TQRBand;
    qrsSeparadorFecha1: TQRShape;
    qrsSeparadorFecha2: TQRShape;
    qrlDia: TQRLabel;
    qrlMes: TQRLabel;
    qrlAnio: TQRLabel;
    qrlNumero: TQRLabel;
    qrsVert1Periodos: TQRShape;
    qrgGrupo: TQRGroup;
    qcbTitCol: TQRChildBand;
    qrlPagina: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    qrsVert4HeaderValores: TQRShape;
    qrsVert2Valores: TQRShape;
    qrbGroupFooter: TQRBand;
    qrsRectTotalValores: TQRShape;
    qrbSummaryBand: TQRBand;
    qrsLineaFirma: TQRShape;
    qrCodigoBarras: TQRLabel;
    qrlLoteEnvioDocumentacion: TQRLabel;
    dsConsulta: TDataSource;
    qrdbTipo: TQRDBText;
    qrlArchivo: TQRLabel;
    qrlCodigo: TQRLabel;
    qrdbCodigoDocumento: TQRDBText;
    QRShape2: TQRShape;
    qrsFondoTitulos: TQRShape;
    qrlFirmaConforme: TQRLabel;
    QRShape3: TQRShape;
    QRExpr2: TQRExpr;
    QRShape8: TQRShape;
    qrCantCajas: TQRLabel;
    qriLogo: TQRImage;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qrNumeroItem: TQRDBText;
    qrbGFooter: TQRBand;
    QRShape5: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrCodigoBarrasPrint(sender: TObject; var Value: String);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirRemito(AIdRemito : TTableID; Preview : boolean; eMail: string = '');
  end;

implementation

Uses
  AnsiSql, unDmPrincipal, unCustomDataModule, CustomDlgs, General,
  strFuncs, unPrincipal, ArtFuncs, unVisualizador, unExportPdf;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TQrDetalleRemitoDevolucion.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleRemitoDevolucion.ImprimirRemito(AIdRemito: TTableID; Preview: boolean; eMail: string = '');
var
  Q: TSDQuery;
  dFechaRemito: TDateTime;
  sSql: String;
  OpcVisualizador: TOpcionesVisualizador;
begin
  sSql := 'SELECT CAST(LPAD(RD_ID, ''8'', ''0'') AS VARCHAR2(8)) RD_ID, RD_FECHAALTA ' +
            'FROM RRD_REMITODEVOLUCION ' +
           'WHERE RD_ID = ' + SqlValue(AIdRemito);

  Q := GetQuery(sSql);
  try
    if Q.Eof then
      begin
        MsgBox( 'No se han encontrado los datos del remito de devolución de carpetas.', MB_OK + MB_ICONEXCLAMATION );
        Exit;
      end
    else
      begin
        dFechaRemito           := Q.FieldByName('RD_FECHAALTA').AsDateTime;
        qrlDia.Caption         := FormatDateTime('dd', dFechaRemito);
        qrlMes.Caption         := FormatDateTime('mm', dFechaRemito);
        qrlAnio.Caption        := FormatDateTime('yyyy', dFechaRemito);
        qrlNumero.Caption      := 'Remito Nº ' + Q.FieldByName('RD_ID').AsString;
        qrCodigoBarras.Caption :=  '*' + Q.FieldByName('RD_ID').AsString + '*';
      end;
  finally
    Q.Free;
  end;

  sdqConsulta.ParamByName('RE_ID').AsInteger := AIdRemito;
  sdqConsulta.Open;

  if sdqConsulta.RecordCount > 0 then
    begin
      sSql := 'SELECT COUNT(DISTINCT AR_CAJA) ' +
                'FROM RAR_ARCHIVO, RRD_REMITODEVOLUCION ' +
               'WHERE AR_IDREMITODEVOL = RD_ID ' +
                 'AND RD_ID = ' + SqlValue(AIdRemito);
      qrCantCajas.Caption := ValorSql(sSql);

      if Preview then
        begin
          OpcVisualizador := [oForceDB, oForceShowModal, oShowDialogIfEmpty];
          if eMail = '' then
            OpcVisualizador := OpcVisualizador + [oMailNotAllowed];

          Visualizar(qrpRemito, GetValores('Remitos de Devolución de Carpetas - Nro. ' + IntToStr(AIdRemito), eMail), OpcVisualizador)
        end
      else
        qrpRemito.Print;
    end
  else
    MessageDlg('No se encontraron carpetas asociadas al Remito que intenta imprimir.', mtInformation, [mbOK], 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleRemitoDevolucion.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr( qrpRemito.PageNumber );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleRemitoDevolucion.qrCodigoBarrasPrint(sender: TObject; var Value: String);
begin
  qrCodigoBarras.Enabled := not IsExportingPDF();
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

