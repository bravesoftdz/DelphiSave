unit unRptNotaDebito;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, General,
  Numeros, StrFuncs;

type
  TTipoNota = (tnNormal, tnGenerica, tnMixta, tnInterna);
  TTipoReporte = (trPreview, trPrint, trNone); //trNone es para tenerlo en memoria
                                               //para exportarlo como PDF y enviar por mail
  TrptNotaDebito = class(TQuickRep)
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
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrbDetail: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    qrtMonto: TQRDBText;
    QRLabel19: TQRLabel;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    qreTotMonto: TQRExpr;
    QRLabel21: TQRLabel;
    QRShape4: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    qrlNumLetras: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    qrlPie: TQRLabel;
    sdqDetalle: TSDQuery;
    QRDBText16: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    qriLogo: TQRImage;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
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
    qrlDireccion: TQRLabel;
    qrlTelefonos: TQRLabel;
    qrlNotaDebito: TQRLabel;
    qrlInterna: TQRLabel;
    procedure qreTotMontoPrint(sender: TObject; var Value: String);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure qrtMontoPrint(sender: TObject; var Value: String);
    procedure qrlPiePrint(sender: TObject; var Value: String);
    procedure qrlDireccionPrint(sender: TObject; var Value: String);
    procedure qrlTelefonosPrint(sender: TObject; var Value: String);
  private
    PrintResult : Boolean;
  public
    function Imprimir(AVolante :Integer; Tipo :TTipoNota;
                      TipoReporte :TTipoReporte = trPreview;
                      DefaultConfig : Boolean = False) : Boolean;
    function ImprimirDevAjuste(AVolante :Integer; Tipo : TTipoNota;
                              TipoReporte :TTipoReporte = trPreview;
                              DefaultConfig :Boolean = False) : Boolean;
  end;

var
  rptNotaDebito: TrptNotaDebito;

implementation

uses unDmPrincipal, unfraVolante, unArt, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.qreTotMontoPrint(sender: TObject; var Value: String);
var
  Centimos :Integer;
begin
  Centimos := Decimales(StrToFloat( Value ));
  qrlNumLetras.Caption := InitCap(NumLetras( Trunc( StrToFloat( Value ) ) )) +
                          IIF(Centimos = 0,'.', ' con ' + IntToStr(Centimos) + ' ctvos.' );
  Value := FormatFloat( '#,##.00', StrToFloat( Value ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if Not DataSet.Eof then
    if DataSet.FieldByName('VO_DESTINATARIO').AsString = 'M' then
    begin
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_MUTUAL');
      qrlDireccion.Caption := 'Av.Belgrano 615-11º(1092)Capital Federal';
      qrlTelefonos.Caption := 'Tel:4342-2666/3020 Fax:4345-4448';
      //----------------------------------------------------------------//
      qrlCUIT.Caption      := '30-54595994-8';
      qrlIngBrutos.Caption := '';
      qrlInAct.Caption     := '';
    end else
      qriLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.qrtMontoPrint(sender: TObject; var Value: String);
begin
  Value := FormatFloat( '#,##.00', StrToFloat( Value ) );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptNotaDebito.Imprimir(AVolante :Integer; Tipo :TTipoNota;
                                 TipoReporte :TTipoReporte = trPreview;
                                 DefaultConfig :Boolean = False) : Boolean;
var
  sSql, sAudit, sSIV, sGEN, sINT :String;
begin
  Result := False;
  if not DefaultConfig then
  try
    sAudit := 'SELECT vo_auditado ' +
               ' FROM svo_volantes ' +
              ' WHERE vo_volante = :Volante ';
    sSql   := 'SELECT liq.is_volanteaprobaraud(:Volante) ' +
               ' FROM dual';
    if (ValorSqlEx(sAudit, [AVolante]) = 'S') or
       (ValorSqlEx(sSql, [AVolante]) = 'S')
    then
      PrinterSettings.Copies := 3
    else begin
      sSql := 'SELECT tb_descripcion ' +
               ' FROM ctb_tablas ' +
              ' WHERE tb_clave = ''REPCO'' ' +
                ' AND tb_codigo = ''NOTADEBITO'' ' +
                ' AND tb_modulo = ''MUTUAL'' ';
      PrinterSettings.Copies := StrToInt(ValorSql(sSql, '2'));
    end;
  except
    PrinterSettings.Copies := 2;
  end;

  {$IFNDEF VER150}
  PrinterSettings.Collate := 1; 
  {$ENDIF}

  //------------------------------------------------------------------------------------------------------------
  sSIV := 'SELECT art.amebpba.armar_referencia(nd_siniestro, nd_cuil, nd_trabajador) referencia, ' +
                ' nd_motivo, abs(nd_monto) monto, nd_prestacion, nd_fechaprestacion fechaprestacion, ' +
                ' nd_trabajador trabajador, nd_codprestacion ' +   // TK 6748 se agrega el  nd_codprestacion
           ' FROM mnd_notadebito ' +
          ' WHERE nd_volante = ' + SqlInt(AVolante);

  sGEN := 'SELECT art.amebpba.armar_referencia_gen(ng_concepto, nd_prestacion, nd_fechaprestaciondesde, nd_fechaprestacionhasta) referencia, ' +
                ' nd_motivo, abs(nd_monto) monto, nd_prestacion, nd_fechaprestaciondesde fechaprestacion, ' +
                ' null trabajador, nd_codprestacion ' +  // TK 6748 se agrega el  nd_codprestacion
           ' FROM mng_notadebitogen ' +
          ' WHERE ng_volante = ' + SqlInt(AVolante);

  sINT := 'SELECT art.amebpba.armar_referencia(nd_siniestro, nd_cuil, nd_trabajador) referencia, ' +
                ' nd_motivo, abs(nd_monto) monto, nd_prestacion, nd_fechaprestacion fechaprestacion, ' +
                ' nd_trabajador trabajador, nd_codprestacion ' +
           ' FROM mni_notadebitointerno ' +
          ' WHERE nd_volante = ' + SqlInt(AVolante);

  if Tipo = tnNormal then
    sSql := sSIV
  else if Tipo = tnGenerica then
    sSql := sGEN
  else if Tipo = tnInterna then
  begin
    sSql              := sINT;
    qrlTitulo.Caption := 'Nota Interna de Ajuste Número';
  end
  else
    sSql := sSIV + ' UNION ALL ' + sGEN;

  qrlPie.Enabled      := not(Tipo = tnInterna);
  qrlInterna.Enabled  := (Tipo = tnInterna);

  sSql := 'SELECT * FROM ( ' + sSql + ' ) ORDER BY trabajador';

  OpenQuery(sdqDetalle, sSql);

  qrlNotaDebito.Caption := ValorSqlEx('SELECT ' + IIF(Tipo = tnInterna, 'vo_notadebitoint', 'vo_notadebito') +
                                       ' FROM svo_volantes ' +
                                      ' WHERE vo_volante = :vol', [AVolante]);

  PrintResult := False; // Se pone en True cuando imprime uno de los últimos componentes
  if not sdqDetalle.Eof then
  begin
    sdqConsulta.ParamByName('pVolante').AsInteger := AVolante;
    sdqConsulta.Open;
    if TipoReporte = trPreview then
      PreviewModal
    else if TipoReporte = trPrint then
      Print;
    Result := PrintResult and (Not Cancelled);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.qrlPiePrint(sender: TObject; var Value: String);
begin
  PrintResult := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptNotaDebito.ImprimirDevAjuste(AVolante: Integer; Tipo: TTipoNota;
                                          TipoReporte: TTipoReporte; DefaultConfig: Boolean): Boolean;
var
  Sql, sSIV, sGEN : String;
begin
  Result := False;
  sSIV := 'SELECT nvl(amebpba.nomenclador(iv_pres_nomenclador,iv_pres_capitulo,iv_pres_codigo),iv_presdet) nd_prestacion, ' +
                ' art.amebpba.armar_referencia(utiles.armar_siniestro(iv_siniestro, iv_orden, iv_recaida ,''-''), ex_cuil, tj_nombre) referencia, ' +
                ' iv_fecpresta fechaprestacion, iv_observaciones nd_motivo, iv_impfacturado monto, iv_pres_codigo nd_codprestacion ' +   // TK 6748 se agrega el  nd_codprestacion
           ' FROM siv_itemvolante, sex_expedientes, ctj_trabajador, svo_volantes ' +
          ' WHERE iv_volante= vo_volante ' +
            ' AND iv_siniestro = ex_siniestro ' +
            ' AND iv_orden = ex_orden ' +
            ' AND iv_recaida = ex_recaida ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND iv_impfacturado = iv_imppagconret ' +
            ' AND iv_estado <> ''X'' ' +
            ' AND vo_volante = ' + SqlInt(AVolante);

  sGEN := 'SELECT nvl(amebpba.nomenclador(vg_pres_nomenclador,vg_pres_capitulo,vg_pres_codigo),vg_presdet) nd_prestacion, ' +
                ' art.amebpba.armar_referencia_gen( cp_denpago, nvl(amebpba.nomenclador(vg_pres_nomenclador,vg_pres_capitulo,vg_pres_codigo),vg_presdet), vg_prestadesde, vg_prestahasta) referencia, ' +
                ' vg_prestadesde fechaprestacion, vg_observaciones nd_motivo, vg_impfacturado monto, vg_pres_codigo nd_codprestacion ' +   // TK 6748 se agrega el  nd_codprestacion
           ' FROM svg_vol_generico, svo_volantes, scp_conpago ' +
          ' WHERE vg_volante = vo_volante ' +
            ' AND vg_impfacturado = vg_imppagconret ' +
            ' AND cp_conpago = vg_conpago ' +
            ' AND vg_estado <> ''X'' ' +
            ' AND vo_volante = ' + SqlInt(AVolante);

  if Tipo = tnNormal then
    Sql := sSIV
  else if Tipo = tnGenerica then
    Sql := sGEN
  else
    Sql := sSIV + ' UNION ALL ' + sGEN;

  //------------------------------------------------------------------------------------------------------------------
  if Sql <> '' then
  begin
     OpenQuery(sdqDetalle, Sql);

     qrlTitulo.Caption     := 'Devolución de Ajuste Nro';
     qrlPie.Caption        := '';
     qrlFacturaNro.Caption := '';

     PrintResult := False; // Se pone en True cuando imprime uno de los últimos componentes

     if not sdqDetalle.Eof then
     begin
       sdqConsulta.ParamByName('pVolante').AsInteger := AVolante;
       sdqConsulta.Open;
       if TipoReporte = trPreview then
         PreviewModal
       else if TipoReporte = trPrint then
         Print;
       Result := PrintResult and (Not Cancelled);
     end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.qrlDireccionPrint(sender: TObject; var Value: String);
begin
  Value := TXT_EMP_DOMICILIO;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptNotaDebito.qrlTelefonosPrint(sender: TObject; var Value: String);
begin
  Value := TXT_EMP_TELEFONO;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
