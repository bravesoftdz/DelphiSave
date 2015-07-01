unit unRptNDAMP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, General,
  Numeros, StrFuncs, CustomDlgs;

type
  TTipoReporteAMP = (trAMPPreview, trAMPPrint, trAMPNone); //trNone es para tenerlo en memoria
                                                          //para exportarlo como PDF y enviar por mail
  TrptNDAMP = class(TQuickRep)
    QRBand1: TQRBand;
    sdqConsulta: TSDQuery;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    qrlFacturaNro: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    qrbDetail: TQRBand;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    qreTotMonto: TQRExpr;
    QRLabel21: TQRLabel;
    QRDBText12: TQRDBText;
    qriLogo: TQRImage;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    qrlTitulo: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape3: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlIngBrutos: TQRLabel;
    qrlInAct: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qrlDireccion: TQRLabel;
    qrlTelefonos: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    qrlNumLetras: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    qrlPie: TQRLabel;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel16: TQRLabel;
    sdqSubConsulta: TSDQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText16: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    qrtMonto: TQRDBText;
    dsConsulta: TDataSource;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape4: TQRShape;
    procedure qreTotMontoPrint(sender: TObject; var Value: String);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure qrtMontoPrint(sender: TObject; var Value: String);
    procedure qrlPiePrint(sender: TObject; var Value: String);
    procedure qrlDireccionPrint(sender: TObject; var Value: String);
    procedure qrlTelefonosPrint(sender: TObject; var Value: String);
    procedure qrbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    PrintResult : Boolean;
  public
    function ImprimirNDAMP(AVolante : Integer;
                           TipoReporte :TTipoReporteAMP = trAMPPreview;
                           DefaultConfig : Boolean = False) : Boolean;
  end;

var
  rptNDAMP: TrptNDAMP;

implementation

uses unDmPrincipal, unfraVolante, unArt, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.qreTotMontoPrint(sender: TObject; var Value: String);
var
  Centimos :Integer;
begin
  Centimos := Decimales(StrToFloat( Value ));
  qrlNumLetras.Caption := InitCap(NumLetras( Trunc( StrToFloat( Value ) ) )) +
                          IIF(Centimos = 0,'.', ' con ' + IntToStr(Centimos) + ' ctvos.' );

  Value := FormatFloat( '#,##.00', StrToFloat( Value ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if Not DataSet.Eof then
    if DataSet.FieldByName('VO_DESTINATARIO').AsString = 'M' then
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_MUTUAL');
      qrlDireccion.Caption := 'Av.Belgrano 615-11º(1092)Capital Federal';
      qrlTelefonos.Caption := 'Tel:4342-2666/3020 Fax:4345-4448';
      //----------------------------------------------------------------//
      qrlCUIT.Caption      := '30-54595994-8';
      qrlIngBrutos.Caption := '';
      qrlInAct.Caption     := '';
    end
    else
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.qrtMontoPrint(sender: TObject; var Value: String);
begin
  Value := FormatFloat( '#,##.00', StrToFloat( Value ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptNDAMP.ImprimirNDAMP(AVolante : Integer;
                                 TipoReporte :TTipoReporteAMP = trAMPPreview;
                                 DefaultConfig : Boolean = False) : Boolean;
var
  sSql, sAudit : String;
begin
  Result := False;
  if not DefaultConfig then
    try
      sAudit := 'SELECT vo_auditado ' +
                '  FROM svo_volantes ' +
                ' WHERE vo_volante = :Volante ';
      sSql   := 'SELECT liq.is_volanteaprobaraud(:Volante) ' +
                '  FROM dual';
      if (ValorSqlEx(sAudit, [AVolante]) = 'S') or
         (ValorSqlEx(sSql, [AVolante]) = 'S') then
        PrinterSettings.Copies := 3
      else begin
        sSql := 'SELECT TB_DESCRIPCION ' +
                '  FROM CTB_TABLAS ' +
                ' WHERE TB_CLAVE = ''REPCO'' ' +
                '   AND TB_CODIGO = ''NOTADEBITO'' ' +
                '   AND TB_MODULO = ''MUTUAL'' ';
        PrinterSettings.Copies := StrToInt(ValorSql(sSql, '2'));
      end;
    except
      PrinterSettings.Copies := 2;
    end;

  sSql := '';
  if CheckView('MND_NOTADEBITOAMP') then
    sSql := 'SELECT vo_facturatipo || '' - '' || vo_facturaestable || '' - '' ' +
            '       || vo_facturanro factura, nd_refitem, nd_concepto, ' +
            '       vo_volante, vo_prestador, vo_fechafactura, vo_monto, vo_observaciones, ' +
            '       ca_clave, INITCAP(ca_descripcion) prestador, ' +
            '       INITCAP(ca_domicilio) prestdomicilio, ' +
            '       INITCAP(art.utiles.armar_localidad(ca_codpostal, NULL, ' +
            '                                          ca_localidad, ' +
            '                                          ca_provincia)) prestlocalidad, ' +
            '       ''Lote '' || nd_idlote || '' - Empresa: '' || em_nombre ' +
            '       || '' - Estab. '' || es_nroestableci referencia, ' +
            '       nd_motivo, nd_cantidad, ABS(nd_monto) monto, vo_notadebito, vo_destinatario, ' +
            '       actualdate, nd_prestacion, nd_fecha fechaprestacion, nd_observaciones ' +
            '  FROM svo_volantes, cpr_prestador, mnd_notadebitoamp, aem_empresa, ' +
            '       aes_establecimiento ' +
            ' WHERE ca_identificador(+) = vo_prestador ' +
            '   AND em_id(+) = nd_idempresa ' +
            '   AND es_id(+) = nd_idestableci ' +
            '   AND vo_volante = nd_idvolante ' +
            '   AND nd_idvolante = ' + IntToStr( AVolante ) + ' ' +
            'ORDER BY nd_refitem ';

  if sSql <> '' then
  begin
    OpenQuery( sdqConsulta, sSql);
    PrintResult := False; // Se pone en True cuando imprime uno de los últimos componentes
    if not sdqConsulta.Eof then
    begin
      sdqSubConsulta.Open;

      if TipoReporte = trAMPPrint then
        Print
      else if TipoReporte = trAMPPreview then
        PreviewModal;

      Result := PrintResult and (Not Cancelled);
    end;
  end
  else
    MsgBox('No se podrá imprimir la nota de débito porque la vista ART.MND_NOTADEBITOAMP se encuentra inválida.', MB_ICONERROR);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.qrlPiePrint(sender: TObject; var Value: String);
begin
  PrintResult := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.qrlDireccionPrint(sender: TObject; var Value: String);
begin
  Value := TXT_EMP_DOMICILIO;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.qrlTelefonosPrint(sender: TObject; var Value: String);
begin
  Value := TXT_EMP_TELEFONO;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNDAMP.qrbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 { if sdqSubConsulta.IsEmpty then
    qrbDetail.Height := 32
  else
    qrbDetail.Height := 60     }
end;

end.
