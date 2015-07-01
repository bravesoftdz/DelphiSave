unit unRptLiqReciboPagoUnico;  { by NWK, 19/03/03 }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmRptReciboPagoUnico = class(TForm)
    qrReciboPagoUnico: TQuickRep;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSubTitulo: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrmParrafo1: TQRMemo;
    qrmParrafo2: TQRMemo;
    qrlLugarFecha: TQRLabel;
    qrmFirma: TQRMemo;
    qrmDatosRepresentanteLegal: TQRMemo;
    qriLogo: TQRImage;
    qrlCodBarras: TQRLabel;
    qrlNroExped: TQRLabel;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(bRepLegal: Boolean; iSiniestro, iOrden, iRecaida, iNLiq: Integer);
  end;

implementation

uses AnsiSql, unDmPrincipal, SDEngine, unArt, Numeros, uncomunes, strfuncs;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
constructor TfrmRptReciboPagoUnico.Create(AOwner: TComponent);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRptReciboPagoUnico.DoImprimir(bRepLegal: Boolean; iSiniestro, iOrden, iRecaida, iNLiq: Integer);
var
  sP1, sP2, sTEMP, sSql, sFirma, sDatosRepresentanteLegal, sProvincia, sNroExpediente: String;
  sdqReplegal, sdqMuerto, sdqConsulta: TSDQuery;
  rCoefPorc: Double;
  bEsSinGobernacion :Boolean;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then 
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    sProvincia := ART_NOMBRE_GOB;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    sProvincia := ART_NOMBRE;
  end;
  sProvincia := UpperCase(sProvincia);

  rCoefPorc := 0;
  if bRepLegal then
    qrlSubTitulo.Caption := 'REPRESENTANTE LEGAL'
  else
    qrlSubTitulo.Caption := '';

  qrlSiniestro.Caption := 'SINIESTRO N� ' + IntToStr(iSiniestro);

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

  sNroExpediente := lpad(isiniestro, '0', 8) + lpad(iorden, '0', 2) +
                    lpad(irecaida, '0', 2) + lpad(iNLiq, '0', 3);
  qrlNroExped.Caption := sNroExpediente;
  qrlCodBarras.Caption := '*' + sNroExpediente + '*';

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
          sTEMP := sTEMP + sdqConsulta.fieldbyname( 'EB_NOMBRE' ).AsString + ' DNI N� ' + sdqConsulta.fieldbyname( 'EB_DOCUMENTO' ).AsString;
          rCoefPorc := rCoefPorc + sdqConsulta.fieldbyname( 'BL_PORCENTAJE' ).AsFloat;
          sdqConsulta.Next;
          if not sdqConsulta.Eof then
            sTEMP := sTEMP + ' Y '
          else
            sTEMP := sTEMP + ', ';
        end;

        sP1:= 'EN MI CAR�CTER DE REPRESENTANTE LEGAL DE ' + sTEMP + ' C�RACTER ';
      end
      else begin
        sP1 := sdqConsulta.fieldbyname( 'EB_NOMBRE' ).AsString + ', DNI N� ' + sdqConsulta.fieldbyname( 'EB_DOCUMENTO' ).AsString + ', EN MI CAR�CTER DE BENEFICIARIO';
        rCoefPorc := rCoefPorc + sdqConsulta.fieldbyname( 'BL_PORCENTAJE' ).AsFloat;
      end;

      sP1 := sP1 + ' QUE QUED� ACREDITADO CON ';

      if bRepLegal then
        sP1 := sP1 + ' PARTIDA DE NACIMIENTO, '
      else
        sP1 := sP1 + ' LA DOCUMENTACI�N ';

      sP1 := sP1 + 'OPORTUNAMENTE ACOMPA�ADA, RECIB� DE ' + sProvincia + ' LA SUMA DE $ ' + format('%8.2f', [sdqConsulta.fieldbyname( 'LE_IMPORPERI' ).AsCurrency]) + '.- (' + NumLetras(sdqConsulta.fieldbyname( 'LE_IMPORPERI' ).AsFloat) + ') EN CONCEPTO DEL ' +
             floattostr( rCoefPorc * 100 ) + '% (' + Numletras( rCoefPorc * 100 ) + ' POR CIENTO)' +
             ' DE LA PRESTACI�N ADICIONAL DE PAGO �NICO POR FALLECIMIENTO PREVISTA EN EL INC. C, DEL AP. 4 DEL ART. 11 DE LA LEY 24.557, A CONSECUENCIA DEL INFORTUNIO SUFRIDO POR ' ;

      if bRepLegal then
        sP1 := sP1 + 'EL ' + ValorSQL('SELECT upper(tb_especial1) FROM CTB_TABLAS WHERE TB_clave=''PAREN'' AND TB_CODIGO=''' + sdqConsulta.fieldbyname( 'EB_CARACTER' ).AsString  + '''') + ' DE LOS MENORES, '
      else
        sP1 := sP1 + 'MI ' + ValorSQL('SELECT upper(tb_especial1) FROM CTB_TABLAS WHERE TB_clave=''PAREN'' AND TB_CODIGO=''' + sdqConsulta.fieldbyname( 'EB_CARACTER' ).AsString  + '''') ;

      sP1 := sP1 + ' ' + sdqMuerto.fieldbyname( 'TJ_Nombre' ).AsString;
      sP1 := sP1 + ' EL D�A ' + sdqMuerto.fieldbyname( 'ex_fechaaccidente' ).AsString + '.' + CRLF;

      sP1 := sP1 + 'ASIMISMO, CON CAR�CTER DE DECLARACI�N JURADA, EL QUE SUSCRIBE MANIFIESTA ';

      if bRepLegal then
        sP1 := sP1 + 'NO ENCONTRARSE INHABILITADO EN EL EJERCICIO DE SU REPRESENTACI�N Y ';

      sP1 := sP1 + 'CONOCER SUS OBLIGACIONES, DERIVADAS DE LA ';

      if bRepLegal then
        sP1 := sP1 + 'REPRESENTACI�N ALUDIDA PREVISTAS EN EL C�DIGO CIVIL '
      else
        sP1 := sP1 + 'LEGISLACI�N VIGENTE ';

      sP1 := sP1 + 'Y ESPECIALMENTE LAS DERIVADAS DEL ART. 5� DE LA RESOLUCI�N N� 287/01 DE LA SUPERINTENDENCIA DE RIESGOS DEL TRABAJO.';

      qrmParrafo1.Lines.Text := sP1;

      sP2 := 'RESOLUCI�N N� 287/01 DE LA SUPERINTENDENCIA DE RIESGOS DEL TRABAJO:' + CRLF;
      sP2 := sP2 + 'Art. 5� - En caso de que, con posterioridad a que se hubiese efectivizado el pago de la ' +
                   'prestaci�n adicional de pago �nico estipulada en el art�culo 11, apartado 4, inciso c) de ' +
                   'la Ley N� 24.557, se presentaren una o m�s personas aduciendo su derecho a percibir dicha ' +
                   'prestaci�n, el responsable del pago proceder� a verificar la calidad de derechohabientes de ' +
                   'aqu�llas. Comprobada la calidad de derechohabientes, el responsable notificar� a �stos en ' +
                   'forma fehaciente la Administradora de Fondos de Jubilaciones y Pensiones (A.F.J.P.) o la ' +
                   'Compa��a de Seguros de Retiro donde se depositar� el capital a que hace referencia el ' +
                   'apartado 2, del art�culo 15, de la Ley N� 24.557. Asimismo, el responsable deber� comunicar ' +
                   'a los derechohabientes, los datos identificatorios, el domicilio y el parentesco denunciados ' +
                   'por las personas que percibieron oportunamente el pago �nico adicional.';

      qrmParrafo2.Lines.Text := sP2;
      qrlLugarFecha.Caption := 'BUENOS AIRES, ' + DateToStr(DBDateTime);

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
                  ' AND eb_grupofamiliar=' + sdqConsulta.fieldbyname('EB_GRUPOFAMILIAR').AsString;
        sdqRepLegal := GetQuery(SSQL);

        try
          sFirma := '...........................................................' + CRLF +
                    'Firma del Representante Legal' + CRLF + CRLF + CRLF +
                    '...........................................................' + CRLF +
                    'Aclaraci�n';

          sDatosRepresentanteLegal := 'Datos del Representante Legal' + CRLF + CRLF +
                                      'Nombre y Apellido: ' + sdqRepLegal.FieldbyName( 'EB_Nombre' ).AsString + CRLF + CRLF +
                                      'DNI N�: ' + sdqRepLegal.FieldbyName( 'EB_Documento' ).AsString + CRLF + CRLF +
                                      'Domicilio Actualizado: ' + sdqRepLegal.FieldbyName( 'EB_Direccion' ).AsString + ' ' + sdqRepLegal.FieldbyName( 'EB_Localidad' ).AsString;

          qrmDatosRepresentanteLegal.Lines.Text := sDatosRepresentanteLegal;
        finally
          sdqRepLegal.Free;
        end;
      end else
        sFirma := 'Firma del Beneficiario:................................' + CRLF + CRLF +
                  'Aclaraci�n de Firma:...................................' + CRLF + CRLF +
                  'DNI N�:......................................................' + CRLF + CRLF +
                  'Domicilio Actualizado:................................';

      qrmFirma.Lines.Text := sFirma;
    finally
      sdqMuerto.Free;
    end;
  finally
    sdqConsulta.Free;
  end;

  qrReciboPagoUnico.Print;
end;

end.
