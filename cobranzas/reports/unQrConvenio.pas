unit unQrConvenio;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   05-11-03
 ULTIMA MODIFICACION: 06-11-03
}
interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrConvenio = class(TQuickRep)
    TitleBand1: TQRBand;
    qrParrafo0: TQRMemo;
    QRLabel1: TQRLabel;
    qrParrafo1: TQRLabel;
    qrParrafo2: TQRLabel;
    qrParrafo3: TQRLabel;
    qrParrafo4: TQRLabel;
    qrParrafo5: TQRLabel;
    qrParrafo6: TQRLabel;
    qriLogo: TQRImage;
  private
    procedure SaveToFile( NombreArchivo: string );
  public
    procedure Preparar ( Plan: string; NombreArchivo: string = '');

  end;

implementation
Uses
  unPrincipal, DateTimeFuncs, Numeros, undmPrincipal,
  sdEngine, unExportPDF, unComunes, StrFuncs;

{$R *.DFM}

{ TqrConvenio }

procedure TqrConvenio.Preparar ( Plan: string; NombreArchivo: string = '');
var
  strDeuda: string;
  LocalidadDelegacion: string;
  ART_DOMICILIO: string;
  ART_LOCALIDAD: string;
  Cuit, EmprNombre: string;
  Fecha: TDateTime;
  Contrato: string;
  Deuda: double;
  Query: TSDQuery;
  sSql: string;
  ArtNombre, ArtDNI, ArtCaracter, EmpPersona, EmprDNI, EmprCaracter: String;
begin
  LocalidadDelegacion := 'Ciudad Autónoma de Buenos Aires';
  ART_DOMICILIO       := 'Carlos Pellegrini 91 1º Piso';
  ART_LOCALIDAD       := 'Capital Federal';

  sSql := 'SELECT * FROM ZPP_PLANPAGO WHERE PP_ID = ' + Plan;
  Query := GetQuery( sSql );

  try
    qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );

    Contrato     := Query.FieldByName('PP_CONTRATO').AsString;
    Fecha        := Query.FieldByName('PP_FECHA').AsDateTime;
    Deuda        := Query.FieldByName('PP_DEUDATOTAL').AsFloat;
    strDeuda     := 'PESOS ' + UpperCase(NumLetras(Deuda, 2)) + '/100 ( $' + ToStr(Deuda) + ' )';

    ArtNombre    := Query.FieldByName('PP_ARTFIRMANTE').AsString;
    ArtDNI       := Query.FieldByName('PP_ARTDOCUMENTO').AsString;
    ArtCaracter  := Query.FieldByName('PP_ARTCARACTER').AsString;
    EmpPersona   := Query.FieldByName('PP_EMPFIRMANTE').AsString;
    EmprDNI      := Query.FieldByName('PP_EMPDOCUMENTO').AsString;
    EmprCaracter := Query.FieldByName('PP_EMPCARACTER').AsString;

    Cuit         := ValorSql( 'SELECT EM_CUIT FROM AEM_EMPRESA, ACO_CONTRATO ' +
                              ' WHERE CO_IDEMPRESA = EM_ID ' +
                              '   AND CO_CONTRATO = ' + Contrato);
    EmprNombre   := ValorSql( 'SELECT EM_NOMBRE FROM AEM_EMPRESA, ACO_CONTRATO ' +
                              ' WHERE CO_IDEMPRESA = EM_ID ' +
                              '   AND CO_CONTRATO = ' + Contrato);

    qrParrafo0.Lines.Text := 'En la Ciudad de ' + LocalidadDelegacion + ', a los ' +
                             FormatDateTime('d" dias del mes de "mmmm', Fecha) + ' del año de ' + LowerCase(NumLetras(GetYear(Fecha))) +
                             ', entre el Señor ' + ArtNombre + ' - ' + ArtDNI +
                             ' en su carácter de ' + ArtCaracter + ' de "PROVINCIA A.R.T. S.A.",' +
                             ' con domicilio legal constituido en ' + ART_DOMICILIO + ', ' + ART_LOCALIDAD +
                             ', en adelante denominada EL ACREEDOR, y ' + EmprNombre +
                             ', con C.U.I.T. Nº ' + Cuit + ', representada' +
                             ' en este acto por el Señor/a ' + EmpPersona + ' - ' + EmprDNI +
                             ' en su carácter de ' + EmprCaracter + ', en adelante denominada' +
                             ' EL DEUDOR, convienen en celebrar el presente convenio de pago:';

    qrParrafo1.Caption := '1º EL ACREEDOR es titular de un crédito equivalente a ' + strDeuda +
                          ' , según Anexo I que forma parte del presente convenio.';

    qrParrafo2.Caption := '2º El DEUDOR reconoce expresamente adeudar la suma de ' + strDeuda + ', ' +
                          'por el concepto indicado en el punto anterior, conviniéndose ' +
                          'que la misma sea abonada a EL ACREEDOR, según se detalla en Anexo II ' +
                          'que forma parte del presente convenio.';

    qrParrafo3.Caption := '3º La ejecución del presente convenio no exime a la ' +
                          'Empresa afiliada del cumplimiento, en tiempo y forma, ' +
                          'de la totalidad de las obligaciones asumidas con motivo del ' +
                          'contrato de afiliación suscripto oportunamente con EL ACREEDOR';

    qrParrafo4.Caption := '4º Ambas partes convienen en pactar la mora automática ' +
                          'y de pleno derecho, sin interpelación de ninguna naturaleza, ' +
                          'operándose para el caso de configurarse la mora en un vencimiento, ' +
                          'la mera caducidad del plazo otorgado para los vencimientos siguientes.';

    qrParrafo5.Caption := '5º La acreditación de los importes depositados al cobro, ' +
                          'liberará, en forma total y definitiva, a EL DEUDOR de la deuda reconocida en el punto 2º.';

    qrParrafo6.Caption := '6º En prueba de conformidad se firman dos ejemplares de un mismo tenor y a un único efecto,';

    if NombreArchivo = '' then
      PreviewModal
    else
      SaveToFile( NombreArchivo );
  finally
    Query.Free;
  end;
end;

procedure TqrConvenio.SaveToFile(NombreArchivo: string);
begin
  ExportarPDF( Self, NombreArchivo);
//  FileToPDFSvr(Self, ExtractFileDir(NombreArchivo), NombreArchivo)
end;

end.
