unit unQREntregaMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, SDEngine, unArt, ArtQReports,
  unQRLabelEx, StdCtrls, Mask, DBCtrls, SqlFuncs, unExportPDF, unDmPrincipal;

type
  TQREntregaMaterial = class(TForm)
    sdqConsulta: TSDQuery;
    qrpMaterial: TQuickRep;
    qrbDetailValoresYPeriodos: TQRBand;
    qrbHeader: TQRBand;
    qrgValores: TQRGroup;
    qcbValoresYPeriodos: TQRChildBand;
    qrbGroupFooterPeriodos: TQRBand;
    qrbSummaryBand: TQRBand;
    dsConsulta: TDataSource;
    qrdbDocumento: TQRDBText;
    qriLogo: TQRImage;
    TitleBand1: TQRBand;
    lbRazonSocial: TQRLabel;
    lbCUIT: TQRLabel;
    lbContrato: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRfecha: TQRLabel;
    qrsFondoTitulos: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrLeyenda: TQRLabel;
    QRShape4: TQRShape;
    QRRecordatorio: TQRLabel;
    QRDisposicion: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRNombreFirmante: TQRDBText;
    QRCaracterFirmante: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    lbNroContrato: TQRLabel;
  private
    FIdCarta : Integer;
    FExportToPDF : boolean;
    FNombreArchivo : String;
    FImprimeMembrete : boolean;
    FImprimeFirma : boolean;
  public
    procedure PrepararImpresion(const aCartaId: TTableId; const aTransactionMode: TTransactionMode;
                                const aImprimir: Boolean; const aCantidadCopias: Integer = -1;
                                const aPdfFileName: String = '');
    procedure DoImpresionCarta(const aIdCarta: TTableId; const TransactionMode: TTransactionMode);
    procedure Preparar(const aCantCopias: Integer; const aImprimir: Boolean = False; const aPdfFileName: String = '');

    property IdCarta: Integer write FIdCarta;
    property ImprimeMembrete: Boolean read FImprimeMembrete write FImprimeMembrete;
    property ImprimirFirma : boolean read FImprimeFirma write FImprimeFirma;
  end;

var
  qrEntregaMaterial: TqrEntregaMaterial;
implementation

Uses AnsiSql, unCustomDataModule, CustomDlgs, Cuit, General,
     Numeros, strFuncs, unPrincipal, ArtFuncs, unSesion;
{$R *.DFM}

procedure TQREntregaMaterial.DoImpresionCarta(const aIdCarta: TTableId;
  const TransactionMode: TTransactionMode);
begin
  if aIdCarta < 1 then
    Exit;

  with TSql.Create('cca_carta') do
  try
    PrimaryKey.Add('ca_id',                     aIdCarta);
    Fields.AddExpression('ca_usuimpresion',     'NVL(ca_usuimpresion, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ')');
    Fields.AddExpression('ca_fechaimpresion',   'NVL(ca_fechaimpresion, SYSDATE)');
    Fields.AddExpression('ca_usureimpresion',   'DECODE(ca_usuimpresion, NULL, NULL, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ')');
    Fields.AddExpression('ca_fechareimpresion', 'DECODE(ca_usuimpresion, NULL, NULL, SYSDATE)');
    SqlType := stUpdate;
    EjecutarSqlST(Sql, TransactionMode);
  finally
    Free;
  end;
end;

procedure TQREntregaMaterial.Preparar(const aCantCopias: Integer;
  const aImprimir: Boolean; const aPdfFileName: String);
begin
  FExportToPDF   := False;
  FNombreArchivo := '';
  //FOrderBy       := '';

  {sSql := GetSql + ' AND en_id = ' + IntToStr(FIdEndoso);
  if FOrderBy <> '' then
    sSql := sSql + 'ORDER BY ' + FOrderBy; }

  //OpenQuery(sdqQuery, sSql, True);
  QrpMaterial.PrinterSettings.Copies := aCantCopias;

  // Carga los controles..
  //CargarControles;

  // Muestra el report..
  if FExportToPDF then
    ExportarPDF(QrpMaterial, FNombreArchivo)
  else
    if aPdfFileName <> '' then
      FileToPDFSvr(QrpMaterial, ExtractFileDir(aPdfFileName), aPdfFileName, True)
    else if aImprimir then
      QrpMaterial.Print
    else
      QrpMaterial.PreviewModal;
end;

procedure TQREntregaMaterial.PrepararImpresion(const aCartaId: TTableId;
  const aTransactionMode: TTransactionMode; const aImprimir: Boolean;
  const aCantidadCopias: Integer; const aPdfFileName: String);
var
  sSql : String;
begin
  FIdCarta := aCartaId;
  //FMotivoEndoso := '';
  try
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, RES_EMP_LOGO_BN);
  except
   //
  end;

  sSql :=
      'SELECT ms_idmaterial, ABS(ms_cantidad) cantidad, fi_firmante, fi_caracter, ms_fechaalta, co_contrato,' +
             ' COALESCE(em_nombre, sa_nombre) empresa, COALESCE(em_cuit, sa_cuit)cuit, fo_formulario, ' +
             ' fi_firma, ma_descripcion' +
         ' FROM afi.ams_movimientostock' +
          ' LEFT JOIN cca_carta on ca_id = ms_idcarta' +
          ' LEFT JOIN cfi_firma on ca_idfirma = fi_id' +
          ' LEFT JOIN aco_contrato ON ms_idformulario = co_idformulario' +
          ' LEFT JOIN aem_empresa ON co_idempresa = em_id' +
          ' LEFT JOIN afi.ama_material on ms_idmaterial = ma_id' +
          ' LEFT JOIN asa_solicitudafiliacion on ms_idformulario = sa_idformulario' +
          ' JOIN afo_formulario ON ms_idformulario = fo_id' +
        ' WHERE ms_idcarta = :idcarta';
  OpenQueryEx(sdqConsulta, [aCartaId], sSql, True);

  with sdqConsulta do
  begin
    if FieldByName('co_contrato').IsNull then
    begin
      lbContrato.Caption := 'FORMULARIO';
      lbNroContrato.Caption := FieldByName('fo_formulario').AsString;
    end
    else
    begin
      lbContrato.Caption := 'CONTRATO';
      lbNroContrato.Caption := FieldByName('co_contrato').AsString + ' - 103';
    end;
  end;

  //qrlLugarFecha.Caption := FormatDateTime('"Buenos Aires, "d "de" mmmm "de" yyyy', sdqConsulta.FieldByName('ms_fechaalta').AsDateTime);
  qrFecha.Caption := FormatDateTime('"Buenos Aires, "d "de" mmmm "de" yyyy', sdqConsulta.FieldByName('ms_fechaalta').AsDateTime);

  QrRecordatorio.Caption := 'Recuerde entregar las Credenciales a su personal y los Boletines Informativos que ' +
                            'le recuerdan a sus trabajadores la importancia del uso de las mismas (Res. SRT 310/02 y 502/02) .';

  QrDisposicion.Caption :=  'Por disposición de la Resolución SRT 70/97, es obligatoria la exhibición en espacios visibles de sus' +
                            ' oficinas del afiche entregado por Provincia ART conteniendo las obligaciones de la ART, el empleador' +
                            ' y el trabajador; las direcciones de las Comisiones Médicas y qué hacer en caso de accidente. Para' +
                            ' solucionar sus dudas sobre estos temas, puede escribirnos a prevencion@provart.com.ar';
   DoImpresionCarta(aCartaId, aTransactionMode);

  if aCantidadCopias <> - 1 then
    Preparar(aCantidadCopias, aImprimir, aPdfFileName)
  else
    Preparar(1, aImprimir, aPdfFileName)
end;

end.

