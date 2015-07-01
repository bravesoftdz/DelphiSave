unit unrptliq8repb;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, Numeros;

type
  Trpt8rep2 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    SDQDetail: TSDQuery;
    DSDetail: TDataSource;
    DSHeader: TDataSource;
    SDQHeader: TSDQuery;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    LblImporte: TQRLabel;
    QRDBText15: TQRDBText;
    LblTotImporte: TQRLabel;
    LblTotPorc: TQRLabel;
    qriLogo: TQRImage;
    qrlCodBarras: TQRLabel;
    qrlNroExped: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape3: TQRShape;
    qrlTitulo: TQRLabel;
    qrlLugarFecha: TQRLabel;
    QRLabel2: TQRLabel;
    qrlExpediente: TQRLabel;
    QRLabel4: TQRLabel;
    qrlNumLiqui: TQRLabel;
    QRLabel3: TQRLabel;
    qrlEmpresa: TQRLabel;
    QRLabel6: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFAccidente: TQRLabel;
    QRLabel1: TQRLabel;
    qrlCUIT: TQRLabel;
    QRLabel7: TQRLabel;
    qrlCUIL: TQRLabel;
    qrmParrafo1: TQRMemo;
    QRLabel8: TQRLabel;
    qrlProvincia: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    qrmTexto: TQRMemo;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lblIndem: TQRLabel;
    lblPA: TQRLabel;
    lblCDanos: TQRLabel;
    lRepLegal: TQRLabel;
    lNombreRepLegal: TQRLabel;
    qrmFirma: TQRMemo;
    lDNIRepLegal: TQRLabel;
    lDomicilioRepLegal: TQRLabel;
    QRRichText1: TQRRichText;
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ArmarParrafo1(iSiniestro, iOrden, iRecaida, iNLiq: Integer; bRepLegal: boolean);
  private

  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq: Integer; bRepLegal: boolean);
  end;

var
  rpt8rep2: Trpt8rep2; rCoefPorc: Double;

implementation

uses unDmPrincipal, unPrincipal, AnsiSql, uncomunes, Strfuncs, DateTimeFuncs, unArt;

var
  TotPorc :double;
  sProvincia :String;
{$R *.DFM}

procedure Trpt8rep2.QRDBText15Print(sender: TObject; var Value: String);
begin
  Totporc := Totporc + sdqdetail.FieldByName('eb_porcentaje').AsFloat;
end;

constructor Trpt8rep2.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure Trpt8rep2.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var porcSobreTotal: double;
begin

  if (sdqdetail.RecordCount > 0) then
  begin
    if (sdqdetail.RecordCount = 1) then
      porcSobreTotal := 1
    else
      porcSobreTotal := SDQDetail.FieldByName('eb_porcentaje').AsFloat / rCoefPorc;

    LblImporte.Caption  := '$' + Format('%8.2f', [sdqheader.FieldByName('le_imporperi').AsFloat * porcSobreTotal]);
    lblIndem.Caption := '$' + Format('%8.2f', [sdqheader.FieldByName('le_impiltp').AsFloat * porcSobreTotal]);
    lblPA.Caption := '$' + Format('%8.2f', [sdqheader.FieldByName('le_montopagoadic').AsFloat * porcSobreTotal]);
    lblCDanos.Caption := '$' + Format('%8.2f', [sdqheader.FieldByName('le_montocompdanios').AsFloat * porcSobreTotal]);
  end
  else
  begin
    LblImporte.Caption  := '';
  end;

  {if (sdqdetail.RecordCount > 0) then
    LblImporte.Caption  := '$ ' + Format('%8.2f', [sdqheader.FieldByName('le_impiltp').AsFloat / sdqdetail.RecordCount])
  else
    LblImporte.Caption  := '';}
end;

procedure Trpt8rep2.DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq: Integer; bRepLegal: boolean);
var
  sSql, sNroExpediente, sFirma: String;
  bEsSinGobernacion :Boolean;
  iIdExped: integer; sdqRepLegal: TSDQuery;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    sProvincia          := ART_NOMBRE_GOB_L;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    sProvincia          := ART_NOMBRE2;
  end;

  sdqHeader.ParamByName('pSiniestro').Value  := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value      := iOrden;
  sdqHeader.ParamByName('pRecaida').Value    := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value       := iNLiq;
  sdqHeader.Open;

  qrlLugarFecha.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo(sdqHeader.FieldByName('le_femision').AsDateTime);
  qrlExpediente.Caption := sdqHeader.FieldByName('siniestro').AsString;
  qrlNumLiqui.Caption := sdqHeader.FieldByName('le_numliqui').AsString;
  qrlEmpresa.Caption := sdqHeader.FieldByName('em_nombre').AsString;
  qrlTrabajador.Caption := sdqHeader.FieldByName('tj_nombre').AsString;
  qrlFAccidente.Caption := sdqHeader.FieldByName('fhacc').AsString;
  qrlCUIT.Caption := sdqHeader.FieldByName('CUIT').AsString;
  qrlCUIL.Caption := sdqHeader.FieldByName('CUIL').AsString;

  sdqDetail.ParamByName('pSiniestro').Value  := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value      := iOrden;
  sdqDetail.ParamByName('pRecaida').Value    := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value       := iNLiq;
  sdqDetail.Open;

  rCoefPorc := 0;
  while not sdqDetail.Eof do
  begin
    rCoefPorc := rCoefPorc + sdqDetail.fieldbyname( 'EB_PORCENTAJE' ).AsFloat;
    sdqDetail.Next;
  end;

  ArmarParrafo1(iSiniestro, iOrden, iRecaida, iNLiq, bRepLegal);

  LblTotImporte.Caption := '$ ' + format('%8.2f', [sdqheader.FieldByName('le_imporperi').AsFloat]);

  if bRepLegal then
  begin
    sSql := 'SELECT eb_nombre, eb_documento, eb_direccion, eb_localidad ' +
             ' FROM sle_liquiempsin,seb_beneficiarios ' +
             'WHERE le_siniestro=' + SqlValue(iSiniestro) +
              ' AND le_orden=' + SqlValue(iOrden) +
              ' AND le_recaida=' + SqlValue(iRecaida) +
              ' AND le_numliqui=' + SqlValue(iNLiq) +
              ' AND le_siniestro=eb_siniestro' +
              ' AND le_orden=eb_orden' +
              ' AND le_recaida=eb_recaida' +
              ' AND eb_replegal=''S''' +
              ' AND eb_grupofamiliar=' + sdqDetail.fieldbyname('EB_GRUPOFAMILIAR').AsString;
    sdqRepLegal := GetQuery(SSQL);

    try
      sFirma := '...........................................................' + CRLF +
                'Firma del Representante Legal' + CRLF + CRLF +
                '...........................................................' + CRLF +
                'Aclaración';

      lRepLegal.Enabled := True;
      lNombreRepLegal.Enabled := True;
      lDNIRepLegal.Enabled := True;
      lDomicilioRepLegal.Enabled := True;
      lNombreRepLegal.Caption := 'Nombre y Apellido: ' + sdqRepLegal.FieldByName('eb_nombre').AsString;
      lDNIRepLegal.Caption := 'DNI N°: ' + sdqRepLegal.FieldbyName( 'eb_documento' ).AsString;
      lDomicilioRepLegal.Caption := 'Domicilio Actualizado: ' + sdqRepLegal.FieldbyName( 'EB_Direccion' ).AsString + ' ' +
                                     sdqRepLegal.FieldbyName( 'EB_Localidad' ).AsString;

    finally
      sdqRepLegal.Free;
    end;
  end
  else
    sFirma := 'Firma del Beneficiario:................................' + CRLF + CRLF +
              'Aclaración de Firma:...................................' + CRLF + CRLF +
              'DNI Nº:.....................................................' + CRLF + CRLF +
              'Domicilio Actualizado:.................................';

  qrmFirma.Lines.Text := sFirma;

  qrlProvincia.Caption := sProvincia;

  sNroExpediente := lpad(isiniestro, '0', 8) + lpad(iorden, '0', 2) +
                    lpad(irecaida, '0', 2) + lpad(iNLiq, '0', 3);
  qrlNroExped.Caption := sNroExpediente;
  qrlCodBarras.Caption := '*' + sNroExpediente + '*';

  Print;
end;

procedure Trpt8rep2.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  Totporc := 0;
end;

procedure Trpt8rep2.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  LblTotPorc.Caption := FloatToStr(TotPorc * 100) + '%';
end;

procedure Trpt8rep2.ArmarParrafo1(iSiniestro, iOrden, iRecaida, iNLiq: Integer; bRepLegal: boolean);
var sSql, sTEMP, sP1: String; sdqConsulta, sdqMuerto: TSDQuery;
begin
  sSql := 'SELECT eb_nombre, eb_documento, le_imporperi, bl_porcentaje, eb_caracter, eb_grupofamiliar ' +
           ' FROM sle_liquiempsin, sbl_beneficiarioliquidacion, seb_beneficiarios ' +
          ' WHERE le_siniestro=' + SqlValue(iSiniestro) +
            ' AND le_orden=' + SqlValue(iOrden) +
            ' AND le_recaida=' + SqlValue(iRecaida) +
            ' AND le_numliqui=' + SqlValue(iNLiq) +
            ' AND le_siniestro=bl_siniestro' +
            ' AND le_orden=bl_orden' +
            ' AND le_recaida=bl_recaida' +
            ' AND le_numliqui=bl_numliq' +
            ' AND eb_siniestro=bl_siniestro' +
            ' AND eb_orden=bl_orden' +
            ' AND eb_recaida=bl_recaida' +
            ' AND eb_codigo=bl_beneficiario';
  sdqConsulta := GetQuery(sSql);

  try
    sSql := 'SELECT tj_nombre, ex_fechaaccidente ' +
             ' FROM sex_expedientes, ctj_trabajador ' +
             ' WHERE ex_siniestro=' + SqlValue(iSiniestro) +
               ' AND ex_orden=' + SqlValue(iOrden) +
               ' AND ex_recaida=' + SqlValue(iRecaida) +
               ' AND ex_cuil=tj_cuil';
    sdqMuerto := GetQuery(sSql);

    try
      if bRepLegal then
      begin
        //Si es representante legal armo el string con todos los representados
        sTEMP := '';
        sdqConsulta.First;

        while not sdqConsulta.Eof do
        begin
          sTEMP := sTEMP + sdqConsulta.fieldbyname( 'EB_NOMBRE' ).AsString + ' DNI Nº ' + sdqConsulta.fieldbyname( 'EB_DOCUMENTO' ).AsString;
          sdqConsulta.Next;
          if not sdqConsulta.Eof then
            sTEMP := sTEMP + ' Y '
          else
            sTEMP := sTEMP + ', ';
        end;

        sP1:= 'EN MI CARÁCTER DE REPRESENTANTE LEGAL DE ' + sTEMP + ' CÁRACTER ';
      end
      else
        sP1 := sdqConsulta.fieldbyname( 'EB_NOMBRE' ).AsString + ', DNI Nº ' + sdqConsulta.fieldbyname( 'EB_DOCUMENTO' ).AsString + ', EN MI CARÁCTER DE BENEFICIARIO';

      sP1 := sP1 + ' QUE QUEDÓ ACREDITADO CON ';

      if bRepLegal then
        sP1 := sP1 + ' PARTIDA DE NACIMIENTO, '
      else
        sP1 := sP1 + ' LA DOCUMENTACIÓN ';

      sP1 := sP1 + 'OPORTUNAMENTE ACOMPAÑADA, RECIBÍ DE ' + UCase(sProvincia) + ' LA SUMA DE $ ' + format('%8.2f', [sdqConsulta.fieldbyname( 'LE_IMPORPERI' ).AsCurrency]) + '.- (' + NumLetras(sdqConsulta.fieldbyname( 'LE_IMPORPERI' ).AsFloat) + ') EN CONCEPTO DEL ' +
             floattostr( rCoefPorc * 100 ) + '% (' + Numletras( rCoefPorc * 100 ) + ' POR CIENTO)' +
             ' DE LA PRESTACIÓN DINERARIA POR FALLECIMIENTO, A CONSECUENCIA DEL INFORTUNIO SUFRIDO POR ' ;

      if bRepLegal then
        sP1 := sP1 + 'EL ' + ValorSQL('SELECT upper(tb_especial1) FROM CTB_TABLAS WHERE TB_clave=''PAREN'' AND TB_CODIGO=''' + sdqConsulta.fieldbyname( 'EB_CARACTER' ).AsString  + '''') + ' DE LOS MENORES, '
      else
        sP1 := sP1 + 'MI ' + ValorSQL('SELECT upper(tb_especial1) FROM CTB_TABLAS WHERE TB_clave=''PAREN'' AND TB_CODIGO=''' + sdqConsulta.fieldbyname( 'EB_CARACTER' ).AsString  + '''') ;

      sP1 := sP1 + ' ' + sdqMuerto.fieldbyname( 'TJ_Nombre' ).AsString;
      sP1 := sP1 + ' EL DÍA ' + sdqMuerto.fieldbyname( 'ex_fechaaccidente' ).AsString + '.' + CRLF;

      sP1 := sP1 + 'ASIMISMO, CON CARÁCTER DE DECLARACIÓN JURADA, EL QUE SUSCRIBE MANIFIESTA ';

      if bRepLegal then
        sP1 := sP1 + 'NO ENCONTRARSE INHABILITADO EN EL EJERCICIO DE SU REPRESENTACIÓN Y ';

      sP1 := sP1 + 'CONOCER SUS OBLIGACIONES, DERIVADAS DE LA ';

      if bRepLegal then
        sP1 := sP1 + 'REPRESENTACIÓN ALUDIDA PREVISTAS EN EL CÓDIGO CIVIL '
      else
        sP1 := sP1 + 'LEGISLACIÓN VIGENTE ';

      sP1 := sP1 + 'Y ESPECIALMENTE LAS DERIVADAS DEL ART. 5º DE LA RESOLUCIÓN Nº 287/01 DE LA SUPERINTENDENCIA DE RIESGOS DEL TRABAJO.';

      qrmParrafo1.Lines.Text := sP1;

    finally
      sdqMuerto.Free;
    end;

  finally
    sdqConsulta.Free;
  end;

end;

end.
