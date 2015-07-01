{-----------------------------------------------------------------------------
 Unit Name: unQrDetalleLote
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Reporte de lote de documentación.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unQrDetalleLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx, StdCtrls, Mask, DBCtrls;

type
  TQrDetalleLote = class(TForm)
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
    qrlNumero: TQRLabel;
    qrsVert1Periodos: TQRShape;
    qrsVert1Valores: TQRShape;
    qrsVert3Valores: TQRShape;
    qrgValores: TQRGroup;
    qcbValoresYPeriodos: TQRChildBand;
    qrsVert1HeaderValores: TQRShape;
    qrsVert3HeaderValores: TQRShape;
    qrlPagina: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    qrlDescripcionValores: TQRLabel;
    qrbGroupFooterPeriodos: TQRBand;
    qrsRectTotalValores: TQRShape;
    qreSumaHojas: TQRExpr;
    qrbSummaryBand: TQRBand;
    qrsLineaFirma: TQRShape;
    qrCodigoBarras: TQRLabel;
    qrlLoteEnvioDocumentacion: TQRLabel;
    dsConsulta: TDataSource;
    qrNumero: TQRLabel;
    qrNumeroItem: TQRDBText;
    qrlDocumento: TQRLabel;
    qrdbDocumento: TQRDBText;
    qrdbHojas: TQRDBText;
    qrsVert2Periodos: TQRShape;
    qrlCodigo: TQRLabel;
    qrsSepardado10: TQRShape;
    qrdbCodigoDocumento: TQRDBText;
    qrlDescripcionDestinoLote: TQRLabel;
    qreConteoRegistro: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrsFondoTitulos: TQRShape;
    qrlFirmaConforme: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    qrdbTipo: TQRDBText;
    qrFirmaReimpresion: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    qrlLabelOpcionDestino: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    qrlSectorFirmaConforme: TQRLabel;
    qriLogo: TQRImage;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    QRShape5: TQRShape;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirLote(AIdLote : TTableID; Preview, EsReimpresion : boolean; UsuImpresionOrig: String);
  end;


implementation

uses
  AnsiSql, unDmPrincipal, unCustomDataModule, CustomDlgs, Cuit, General,
  Numeros, strFuncs, unPrincipal, ArtFuncs, unSesion, unConstantArchivo;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TQrDetalleLote.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName( HInstance, 'LOGO_2009_BYN_CHICO' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleLote.ImprimirLote(AIdLote : TTableID; Preview, EsReimpresion : boolean; UsuImpresionOrig: String);
var
  dFechaLote: TDateTime;
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT LPAD(LO_ID, ''8'', ''0'') LO_ID, LO_FECHAALTA, LO_USUALTA, ' +
          'DECODE (lo_opciondestino, ' +
                   '''D'', ''Digitalización'', ' +
                   '''G'', ''Guarda'', ' +
                   '''A'', ''Archivo ART'', ' +
                   '''S'', ''Sin Papel'', ' +
                   '''U'', ''Digit. por Usuario'') LO_OPCIONDESTINO ' +
            'FROM RLO_LOTE ' +
           'WHERE LO_ID = ' + SqlValue(AIdLote) + ' ' +
             'AND LO_FECHABAJA IS NULL ' +
             'AND (ARCHIVO.IS_PERMITIR_DETALLEARCH_BAJA(LO_TIPO) = ''S'' ' +
                  'OR EXISTS (SELECT 1 ' +
                               'FROM RDA_DETALLEARCHIVO ' +
                              'WHERE DA_LOTE = LO_ID ' +
                                'AND DA_FECHABAJA IS NULL))';

  with GetQuery(sSql) do
    begin
      try
        if IsEmpty then
          begin
            MsgBox('No se han encontrado los datos del lote.', MB_OK + MB_ICONEXCLAMATION);
            Exit;
          end
        else
          begin
            dFechaLote          := FieldByName('LO_FECHAALTA').AsDateTime;
            qrlDia.Caption      := FormatDateTime('dd', dFechaLote);
            qrlMes.Caption      := FormatDateTime('mm', dFechaLote);
            qrlAnio.Caption     := FormatDateTime('yyyy', dFechaLote);
            qrlNumero.Caption   := 'Lote Nº ' + FieldByName('LO_ID').AsString;
            qrpLote.ReportTitle := qrlNumero.Caption;
            qrlDescripcionDestinoLote.Caption := FieldByName('lo_opciondestino').AsString;
            qrCodigoBarras.Caption            :=  '*' + FieldByName('LO_ID').AsString + '*';

            sSql := 'SELECT SE_NOMBRE, SC_DESCRIPCION ' +
                      'FROM USC_SECTORES, USE_USUARIOS ' +
                     'WHERE SE_USUARIO = ' + SqlValue(UsuImpresionOrig) + ' ' +
                       'AND SE_SECTOR = SC_CODIGO';
            SqlResults := ValoresColSql(sSql);
            try
              qrlFirmaConforme.Caption       := SqlResults[0];
              qrlSectorFirmaConforme.Caption := SqlResults[1];
            finally
              SqlResults.Free;
            end;

            if EsReimpresion then
              qrFirmaReimpresion.Caption := 'Reimpreso por ' + Sesion.Usuario
            else
              qrFirmaReimpresion.Caption := '';
          end;
      finally
        Free;
      end;
    end;

  sdqConsulta.Close;
  sdqConsulta.ParamByName('lo_id').AsInteger := AIdLote;
  sdqConsulta.Open;

  if sdqConsulta.IsEmpty then
    MsgBox('No se encontraron documentos asociados al lote que intenta imprimir.', MB_OK + MB_ICONEXCLAMATION)
  else
    begin
      if Preview then
        qrpLote.Preview
      else
        begin
          qrpLote.PrinterSettings.Copies := 1;
          qrpLote.Print;
        end
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TQrDetalleLote.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Página ' + IntToStr(qrpLote.PageNumber);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

