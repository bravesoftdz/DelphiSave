unit unQRCartaSolicitud;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   29-09-03
}

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  unQRLabelEx, jpeg, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TQrCartaSolicitud = class(TQuickRep)
    TitleBand1: TQRBand;
    qrImgBanco: TQRImage;
    qrImgProv: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrCosto1: TQRLabel;
    qrCosto2: TQRLabel;
    QRLabel8: TQRLabel;
    qrEmpr1: TQRLabel;
    qrEmpr2: TQRLabel;
    qrLugarFecha: TQRLabel;
    sdqDatos: TSDQuery;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    qrEmpr3: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrEmpr4: TQRLabel;
    qrEmpr5: TQRLabel;
    qrEmpr6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrImporte1: TQRLabel;
    qrImporte2: TQRLabel;
    qrImporte3: TQRLabel;
    sdspGetValorCarta: TSDStoredProc;
    QRLabel18: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape5: TQRShape;
    lbClausulaPenal: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel36: TQRLabel;
    QRShape13: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRImage1: TQRImage;
    QRShape8: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel39: TQRLabel;
    qrAlicuotaVariable: TQRLabel;
    QRLabel41: TQRLabel;
    qrCuotaInicialDe: TQRLabel;
    QRLabel43: TQRLabel;
    qrSumaAsegurada: TQRLabel;
    QRShape9: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape14: TQRShape;
    QRLabel49: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel44: TQRLabel;
    bAnalisisComparativoCostos: TQRBand;
    imgGrafico: TQRImage;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel55: TQRLabel;
    lbArtActual: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    imgTop: TQRImage;
    QRLabel51: TQRLabel;
    QRDBText19: TQRDBText;
    qrImgProv2: TQRImage;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRShape41: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRImage6: TQRImage;
    QRImage7: TQRImage;
    QRImage8: TQRImage;
    QRImage9: TQRImage;
    QRImage10: TQRImage;
    QRShape42: TQRShape;
    qrImgProv3: TQRImage;
    lbLeyendaILT: TQRLabel;
    http1: TIdHTTP;
    procedure AgregarEspacioInicial(Sender: TObject; var Value: String);
    procedure bAnalisisComparativoCostosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    function GetIntVal(const aValor: String): String;
  public
    function Preparar(const aIdSolicitud: Integer; const aNombreArchivo: String): Boolean;
  end;


implementation

{$R *.DFM}

uses
  unDmPrincipal, CustomDlgs, unArt, unExportPDF, StrFuncs, Numeros {$IFNDEF SERVICE},unVisualizador{$ENDIF}, unSesion;

function TQrCartaSolicitud.GetIntVal(const aValor: String): String;
begin
  Result := Trim(StringReplace(StringReplace(aValor, '$', '', [rfReplaceAll]), ',', '', [rfReplaceAll]));
end;


procedure TQrCartaSolicitud.AgregarEspacioInicial(Sender: TObject; var Value: String);
begin
  Value := ' ' + Value;
end;

function TQrCartaSolicitud.Preparar(const aIdSolicitud: Integer; const aNombreArchivo: String): Boolean;
const
  MAX_INTENTOS = 20;
var
  iLoop: Integer;
  sArchivo: String;
  sRuta: String;
  sSql: String;
begin
  Result := True;

  sSql :=
    'SELECT ar_nombre artactual,' +
          ' DECODE(cac_aco.ac_codigo, NULL, cac_asc.ac_codigo || '' - '' || cac_asc.ac_descripcion, cac_aco.ac_codigo || '' - '' || cac_aco.ac_descripcion) actividad,' +
          ' NVL(cac_aco.ac_codigo, cac_asc.ac_codigo) ca_codigo,' +
          ' CASE WHEN NVL(co_orden, -1) = 0 THEN NVL(co_canttrabajador, sc_canttrabajador) ELSE sc_canttrabajador END canttrabajador,' +
          ' NVL(cac_aco.ac_codigo, cac_asc.ac_codigo) ciiu,' +
          ' co_chek_iltempleador,' +
          ' DECODE(cac_aco.ac_codigo, NULL, cac_asc.ac_codigo, cac_aco.ac_codigo) codigo,' +
          ' art.utiles.armar_cuit(sc_cuit) cuit,' +
          ' TO_CHAR((NVL(co_masasalarial, sc_masasalarial) * sc_valor_rc / 100), ''$9,999,999,990'') cuotainicialrc,' +
          ' NVL(cac_aco.ac_descripcion, cac_asc.ac_descripcion) descripcionciiu,' +
          ' TO_CHAR(art.cotizacion.get_prima_anual(sc_id) - art.cotizacion.get_prima_anual_competencia(sc_id), ''$9,999,999,990'') difanualahorro,' +
          ' TO_CHAR(art.cotizacion.get_prima_mensual(sc_id) - art.cotizacion.get_prima_mensual_competencia(sc_id), ''$9,999,999,990'') difmensual,' +
          ' TO_CHAR(DECODE(art.cotizacion.get_prima_anual_competencia(sc_id), 0, 0, (art.cotizacion.get_prima_anual(sc_id) - art.cotizacion.get_prima_anual_competencia(sc_id)) * 100 / art.cotizacion.get_prima_anual_competencia(sc_id)), ''00'') || ''%'' difporcentual,' +
          ' DECODE(art.cotizacion.get_prima_anual_competencia(sc_id), 0, 0, (art.cotizacion.get_prima_anual(sc_id) - art.cotizacion.get_prima_anual_competencia(sc_id)) * 100 / art.cotizacion.get_prima_anual_competencia(sc_id)) difporcentualsinformato,' +
          ' CASE WHEN NVL(co_orden, -1) = 0 THEN TO_CHAR(NVL(co_masasalarial, sc_masasalarial), ''$9,999,999,990.00'') ELSE TO_CHAR(sc_masasalarial, ''$9,999,999,990.00'') END masasalarial,' +
          ' TO_CHAR(art.cotizacion.get_porcentaje_variable_comp(sc_id), ''990.000'') || ''%'' porcvarcomp,' +
          ' TO_CHAR(art.cotizacion.get_porcentaje_variable(sc_id), ''990.000'') || ''%'' porcvariable,' +
          ' TO_CHAR(art.cotizacion.get_prima_anual(sc_id), ''$9,999,999,990'') primaanual,' +
          ' TO_CHAR(art.cotizacion.get_prima_anual_competencia(sc_id), ''$9,999,999,990'') primaanualcomp,' +
          ' TO_CHAR(art.cotizacion.get_prima_mensual(sc_id), ''$9,999,999,990'') primamensual,' +
          ' TO_CHAR(art.cotizacion.get_prima_mensual_competencia(sc_id), ''$9,999,999,990'') primamensualcomp,' +
          ' TO_CHAR(art.cotizacion.get_prima_x_capita(sc_id), ''$9,999,999,990.00'') primaxcapita,' +
          ' TO_CHAR(art.cotizacion.get_prima_x_capita_competencia(sc_id), ''$9,999,999,990.00'') primaxcapitacomp,' +
          ' NVL(sc_razonsocial, co_razonsocial) razonsocial,' +
          ' sc_actividadreal,' +
          ' sc_fechavigencia,' +
          ' sc_nrosolicitud,' +
          ' sc_poliza_rc,' +
          ' sc_sumaasegurada_rc,' +
          ' TO_CHAR(sc_valor_rc, ''990.000'') || ''%'' valor_rc,' +
          ' TO_CHAR(art.cotizacion.get_suma_fija(sc_id), ''$9,999,999,990.00'') sumafija,' +
          ' TO_CHAR(art.cotizacion.get_suma_fija_competencia(sc_id), ''$9,999,999,990.00'') sumafijacomp' +
     ' FROM asc_solicitudcotizacion, aco_cotizacion, cac_actividad cac_asc, cac_actividad cac_aco, aca_canal, aar_art' +
    ' WHERE sc_idcotizacion = co_id(+)' +
      ' AND sc_idactividad = cac_asc.ac_id(+)' +
      ' AND co_idactividad = cac_aco.ac_id(+)' +
      ' AND sc_canal = ca_id(+)' +
      ' AND sc_idartanterior = ar_id(+)' +
      ' AND sc_id = :id';

  OpenQueryEx(sdqDatos, [aIdSolicitud], sSql);
  if sdqDatos.Eof then
    MsgBox('No existen registros para la cotización indicada.', MB_ICONERROR)
  else
  begin
    qrEmpr1.Caption := sdqDatos.FieldByName('razonsocial').AsString;
    qrEmpr2.Caption := sdqDatos.FieldByName('cuit').AsString;
    qrEmpr3.Caption := sdqDatos.FieldByName('codigo').AsString;
    qrEmpr4.Caption := sdqDatos.FieldByName('sc_actividadreal').AsString;
    qrEmpr5.Caption := sdqDatos.FieldByName('canttrabajador').AsString;
    qrEmpr6.Caption := sdqDatos.FieldByName('masasalarial').AsString;

    qrAlicuotaVariable.Caption := sdqDatos.FieldByName('valor_rc').AsString;
    qrCuotaInicialDe.Caption   := sdqDatos.FieldByName('cuotainicialrc').AsString;
    qrSumaAsegurada.Caption    := FormatFloat('$ ##0', sdqDatos.FieldByName('sc_sumaasegurada_rc').AsFloat);

    with sdspGetValorCarta do
    begin
      ParamByName('nnro_solicitud').AsInteger := sdqDatos.FieldByName('sc_nrosolicitud').AsInteger;

      ExecProc;

      qrCosto1.Caption 	 := FormatFloat('$ #,##0.00', ParamByName('nsuma_fija').AsFloat - 0.6);
      qrCosto2.Caption 	 := FormatFloat('% ##0.000', ParamByName('nvariable').AsFloat);
      qrImporte1.Caption := FormatFloat('$ #,##0.00', ParamByName('ncosto_anual').AsFloat);
      qrImporte2.Caption := FormatFloat('$ #,##0.00', ParamByName('ncosto_mensual').AsFloat);
      qrImporte3.Caption := FormatFloat('$ #,##0.00', ParamByName('ncosto_capitas').AsFloat);
    end;

    lbLeyendaILT.Enabled := (sdqDatos.FieldByName('co_chek_iltempleador').AsString = 'S');

    qrLugarFecha.Caption := FormatDateTime('dd/mm/yyyy', sdqDatos.FieldByName('sc_fechavigencia').AsDateTime);

    // Elige el tamaño de las imagenes..
    // Hay que tener en cuenta que para que una imagen se vea bien, es necesario ponerla mas grande y achicarla cambiando el height y el width
    qrImgProv.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    if (sdqDatos.FieldByName('ca_codigo').AsString = '001') then
    begin
      qrImgBanco.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_GBP');
      qrImgBanco.Width := 97;
      qrImgProv.Left   := 459;
    end
    else if (sdqDatos.FieldByName('ca_codigo').AsString = '002') then
    begin
      qrImgBanco.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_BNACION');
      qrImgBanco.Width := 239;
      qrImgProv.Left   := 459;
    end
    else if (sdqDatos.FieldByName('ca_codigo').AsString = '203') then
    begin
      qrImgBanco.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_CIUDAD');
      qrImgBanco.Width  := 140;
      qrImgBanco.Height := 28;
      qrImgBanco.Top    := qrImgBanco.Top + 14;
      qrImgProv.Left    := 459;
    end;

    if (sdqDatos.FieldByName('sc_sumaasegurada_rc').AsFloat = 0) or (sdqDatos.FieldByName('sc_poliza_rc').AsString = 'N') then
    begin
      qrShape14.Pen.Color := clWhite;
      qrShape14.Frame.Color := clWhite;
      qrShape14.Width := 0;
      qrShape14.Height := 0;
      qrShape14.Repaint;

      qrShape15.Pen.Color := clWhite;
      qrShape15.Repaint;
      qrShape16.Pen.Color := clWhite;
      qrShape16.Repaint;
      qrShape17.Pen.Color := clWhite;
      qrShape17.Repaint;
      qrShape9.Pen.Color := clWhite;
      qrShape17.Repaint;

      qrLabel49.Caption := '';
      qrLabel49.Frame.Color := clWhite;
      qrLabel49.Color := clWhite;
      qrLabel49.Repaint;

      qrLabel14.Caption := '';
      qrImage1.Picture := nil;
      qrLabel40.Caption := '';
      qrLabel41.Caption := '';
      qrLabel42.Caption := '';
      qrLabel43.Caption := '';
      qrLabel45.Caption := '';
      qrLabel46.Caption := '';
      qrLabel48.Caption := '';
      qrAlicuotaVariable.Caption := '';
      qrCuotaInicialDe.Caption := '';
      qrSumaAsegurada.Caption := '';
      qrLabel39.Caption := '';
    end;

    if aIdSolicitud = 328723 then   // Según ticket 41756..
      lbClausulaPenal.Caption := 'Cláusula penal por incumplimientos de denuncias del empleador: $2.000.- (pesos dos mil)'
    else
      lbClausulaPenal.Caption := 'Cláusula penal por incumplimientos de denuncias del empleador: $100.000.- (pesos cien mil)';


    // Página 2..
    if sdqDatos.FieldByName('difporcentualsinformato').AsFloat < -5 then
    begin
      qrImgProv2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_COLOR');
      qrImgProv3.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_COLOR');

      lbArtActual.Caption := sdqDatos.FieldByName('artactual').AsString;

      sArchivo := Sesion.UserID + '_' + FormatDateTime('yyyymmddhhnnss', DBDateTime) + '.jpg';

      if Is_ConectadoProduccion then
      begin
        http1.Request.URL := Format('http://intraweb.artprov.com.ar/modules/Suscripciones/CartaSolicitud/ver_grafico.php?id=%s&actual=%s&provart=%s', [sArchivo, GetIntVal(sdqDatos.FieldByName('primaanualcomp').AsString), GetIntVal(sdqDatos.FieldByName('primaanual').AsString)]);
        sRuta := '\\ntintraweb\Storage_Data\Suscripciones\Carta_Solicitud_Cotizacion\Produccion\';
      end
      else
      begin
        http1.Request.URL := Format('http://intraweb-development.artprov.com.ar/modules/Suscripciones/CartaSolicitud/ver_grafico.php?id=%s&actual=%s&provart=%s', [sArchivo, GetIntVal(sdqDatos.FieldByName('primaanualcomp').AsString), GetIntVal(sdqDatos.FieldByName('primaanual').AsString)]);
        sRuta := '\\ntintraweb\Storage_Data\Suscripciones\Carta_Solicitud_Cotizacion\Desarrollo\';
      end;

      http1.Get(http1.Request.URL);

      iLoop := 0;
      while not FileExists(sRuta + sArchivo) do
      begin
        if iLoop > MAX_INTENTOS then
        begin
          MsgBox('No se pudo generar el gráfico del análisis comparativo de costos.', MB_ICONERROR);
          Break;
        end;

        Sleep(500);
        Inc(iLoop);
      end;

      imgGrafico.Enabled := (iLoop <= MAX_INTENTOS);
      imgGrafico.Picture.LoadFromFile(sRuta + sArchivo);
    end;        
 
    //Muestra el report
    if aNombreArchivo > '' then
      Result := FileToPDFSvr(Self, ExtractFilePath(aNombreArchivo), aNombreArchivo, False)
    else
    begin
{$IFNDEF SERVICE}
      Visualizar(Self, GetValores(), [oAlwaysShowDialog, oAutoFirma, oSinNotaAlPie, oForceDB, oForceShowModal,
                                      oExportDOCNotAllowed, oExportXLSNotAllowed], True, '', '', True);
{$ENDIF}
    end;
  end;
end;


procedure TQrCartaSolicitud.bAnalisisComparativoCostosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (sdqDatos.FieldByName('difporcentualsinformato').AsFloat < -5);
end;

end.
