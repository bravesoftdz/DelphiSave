unit unQrDetalleRemito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx, StdCtrls, Mask, DBCtrls;

type
  TQrDetalleRemito = class(TForm)
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
    qrsVert1Valores: TQRShape;
    qrbGroupHeader: TQRGroup;
    qcbValoresYPeriodos: TQRChildBand;
    qrsVert1HeaderValores: TQRShape;
    qrsVert3HeaderValores: TQRShape;
    qrlPagina: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    qrsVert4HeaderValores: TQRShape;
    qrsVert2Valores: TQRShape;
    qrbGroupFooter: TQRBand;
    qrsRectTotalValores: TQRShape;
    qreSumaHojas: TQRExpr;
    qrbSummaryBand: TQRBand;
    qrsLineaFirma: TQRShape;
    qrCodigoBarras: TQRLabel;
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
    qrlCodigo: TQRLabel;
    qrsSepardado10: TQRShape;
    qrlObservaciones: TQRLabel;
    qrdbCodigoDocumento: TQRDBText;
    qreConteoRegistro: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrsFondoTitulos: TQRShape;
    qrlFirmaConforme: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qriLogo: TQRImage;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRShape9: TQRShape;
    QRExpr2: TQRExpr;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qrlSubtotal: TQRLabel;
    qrlTotal: TQRLabel;
    QRShape12: TQRShape;
    qrlCantCajas: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRShape13: TQRShape;
    qrlCantSobres: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape14: TQRShape;
    qrlCantBultos: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrCodigoBarrasPrint(sender: TObject; var Value: String);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirRemito(AIdRemito : TTableID; Preview : boolean; eMail: string = '');
  end;

implementation

Uses
  AnsiSql, unDmPrincipal, unCustomDataModule, CustomDlgs, Cuit, General,
  Numeros, strFuncs, unPrincipal, ArtFuncs, unVisualizador, unExportPdf;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TQrDetalleRemito.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleRemito.ImprimirRemito(AIdRemito: TTableID; Preview: boolean; eMail: string = '');
var
  Q: TSDQuery;
  dFechaRemito: TDateTime;
  sSql: String;
  OpcVisualizador: TOpcionesVisualizador;
begin
  sSql := 'SELECT CAST(LPAD(RE_ID, ''8'', ''0'') AS VARCHAR2(8)) RE_ID, RE_FECHAALTA ' +
            'FROM RRE_REMITO ' +
           'WHERE RE_ID = ' + SqlValue(AIdRemito);

  Q := GetQuery( sSql );
  try
    if Q.RecordCount < 1 then
    begin
      MsgBox( 'No se han encontrado los datos del remito.', MB_OK + MB_ICONEXCLAMATION );
      Exit;
    end
    else
    begin
      dFechaRemito           := Q.FieldByName('RE_FECHAALTA').AsDateTime;
      qrlDia.Caption         := FormatDateTime('dd', dFechaRemito);
      qrlMes.Caption         := FormatDateTime('mm', dFechaRemito);
      qrlAnio.Caption        := FormatDateTime('yyyy', dFechaRemito);
      qrlNumero.Caption      := 'Remito Nº ' + Q.FieldByName('RE_ID').AsString;
      qrCodigoBarras.Caption :=  '*' + Q.FieldByName('RE_ID').AsString + '*';
    end;
  finally
    Q.close;
    Q.Free;
  end;

  sdqConsulta.ParamByName('RE_ID').AsInteger := AIdRemito;
  sdqConsulta.Open;

  if sdqConsulta.RecordCount > 0 then
  begin
    sSql := 'SELECT LO_TIPOBULTO TIPOBULTO, COUNT(DISTINCT LO_CAJA) CANT ' +
              'FROM RLO_LOTE, RRE_REMITO ' +
             'WHERE LO_IDREMITO = RE_ID ' +
               'AND LO_FECHABAJA IS NULL ' +
               'AND RE_ID = :IdRemito ' +
             'GROUP BY LO_TIPOBULTO';
    with GetQueryEx(sSql, [AIdRemito]) do
      try
        while not Eof do
          begin
            if FieldByName('TIPOBULTO').AsString = 'C' then
              qrlCantCajas.Caption := FieldByName('CANT').AsString
            else if FieldByName('TIPOBULTO').AsString = 'S' then
              qrlCantSobres.Caption := FieldByName('CANT').AsString;

            Next;
          end;
      finally
        Free;
      end;

    qrlCantBultos.Caption := Trim(IntToStr(StrToInt(qrlCantCajas.Caption) + StrToInt(qrlCantSobres.Caption)));

    if Preview then
    begin
      OpcVisualizador := [oForceDB, oForceShowModal, oShowDialogIfEmpty];
      if eMail = '' then
        OpcVisualizador := OpcVisualizador + [oMailNotAllowed];

      Visualizar(qrpRemito, GetValores('Remitos de Envío de Lotes - Nro. ' + IntToStr(AIdRemito), eMail), OpcVisualizador)
    end
    else
      qrpRemito.Print;
  end
  else
    MessageDlg('No se encontraron lotes asociados al Remito que intenta imprimir.', mtInformation, [mbOK], 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleRemito.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr( qrpRemito.PageNumber );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleRemito.qrCodigoBarrasPrint(sender: TObject; var Value: String);
begin
  qrCodigoBarras.Enabled := not IsExportingPDF();
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

