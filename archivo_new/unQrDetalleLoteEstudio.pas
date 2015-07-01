unit unQrDetalleLoteEstudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx, StdCtrls, Mask, DBCtrls;

type
  TQrDetalleLoteEstudio = class(TForm)
    sdqConsulta: TSDQuery;
    qrpLote: TQuickRep;
    qrbDetailValoresYPeriodos: TQRBand;
    qrbTituloPeriodos: TQRBand;
    qrbHeader: TQRBand;
    qrsSeparadorFecha1: TQRShape;
    qrsSeparadorFecha2: TQRShape;
    qrlDia: TQRLabel;
    qrlMes: TQRLabel;
    qrlAnio: TQRLabel;
    qrsVert1Periodos: TQRShape;
    qrgValores: TQRGroup;
    qcbValoresYPeriodos: TQRChildBand;
    qrlPagina: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    qrlDescripcionValores: TQRLabel;
    qrbGroupFooterPeriodos: TQRBand;
    qrbSummaryBand: TQRBand;
    qrsLineaFirma: TQRShape;
    qrlLoteEnvioDocumentacion: TQRLabel;
    dsConsulta: TDataSource;
    qrlDocumento: TQRLabel;
    qrdbDocumento: TQRDBText;
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
    qrlFirmaEmite: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    qrdbTipo: TQRDBText;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    qrlNumero: TQRLabel;
    qrCodigoBarras: TQRLabel;
    qriLogo: TQRImage;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirRemitoEstudio(AIdLote: TTableID);
  end;


implementation

Uses AnsiSql, unDmPrincipal, unCustomDataModule, CustomDlgs, Cuit, General,
     Numeros, strFuncs, unPrincipal, ArtFuncs, unSesion;
{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TQrDetalleLoteEstudio.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleLoteEstudio.ImprimirRemitoEstudio(AIdLote: TTableID);
var
  dFechaLote: TDateTime;
  sSql: String;
begin
  sSql := 'SELECT TA_DESCRIPCION TIPOCARPETA, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) DESCRIPCIONCLAVE, ' +
                 'BO_NOMBRE ESTUDIOLEG, AR_OBSERVACIONES OBSERVACIONES, ACTUALDATE FECHAALTA, ' +
                 'LPAD(AR_LOTE_ENTREGADOTERCEROS, ''8'', ''0'') NROREMITO ' +
            'FROM LEGALES.LBO_ABOGADO, RTC_TIPOCLAVE, RTA_TIPOARCHIVO, RAR_ARCHIVO ' +
           'WHERE AR_LOTE_ENTREGADOTERCEROS = :IdLote ' +
             'AND AR_TIPO = TA_ID ' +
             'AND TA_FORMULARIO = TC_CLAVE ' +
             'AND AR_IDABOGADO = BO_ID ' +
           'ORDER BY AR_TIPO, AR_CLAVE';
  OpenQueryEx(sdqConsulta, [AIdLote], sSql);

  with sdqConsulta do
    begin
      if IsEmpty then
        begin
          MsgBox('No se han encontrado los datos de las carpetas.', MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end
      else
        begin
          dFechaLote             := FieldByName('FECHAALTA').AsDateTime;
          qrlDia.Caption         := FormatDateTime('dd', dFechaLote);
          qrlMes.Caption         := FormatDateTime('mm', dFechaLote);
          qrlAnio.Caption        := FormatDateTime('yyyy', dFechaLote);
          qrlNumero.Caption      := 'Remito Nº ' + FieldByName('NROREMITO').AsString;
          qrCodigoBarras.Caption :=  '*' + FieldByName('NROREMITO').AsString + '*';

          sSql := 'SELECT SE_NOMBRE ' +
                    'FROM USE_USUARIOS ' +
                   'WHERE SE_USUARIO = :Usuario';
          qrlFirmaEmite.Caption := ValorSqlEx(sSql, [Sesion.UserId]);

          qrpLote.PrinterSettings.Copies := 2;
          qrpLote.Print;
        end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleLoteEstudio.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr(qrpLote.PageNumber);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

