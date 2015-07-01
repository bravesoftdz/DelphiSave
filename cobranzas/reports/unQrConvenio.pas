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
  LocalidadDelegacion := 'Ciudad Aut�noma de Buenos Aires';
  ART_DOMICILIO       := 'Carlos Pellegrini 91 1� Piso';
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
                             FormatDateTime('d" dias del mes de "mmmm', Fecha) + ' del a�o de ' + LowerCase(NumLetras(GetYear(Fecha))) +
                             ', entre el Se�or ' + ArtNombre + ' - ' + ArtDNI +
                             ' en su car�cter de ' + ArtCaracter + ' de "PROVINCIA A.R.T. S.A.",' +
                             ' con domicilio legal constituido en ' + ART_DOMICILIO + ', ' + ART_LOCALIDAD +
                             ', en adelante denominada EL ACREEDOR, y ' + EmprNombre +
                             ', con C.U.I.T. N� ' + Cuit + ', representada' +
                             ' en este acto por el Se�or/a ' + EmpPersona + ' - ' + EmprDNI +
                             ' en su car�cter de ' + EmprCaracter + ', en adelante denominada' +
                             ' EL DEUDOR, convienen en celebrar el presente convenio de pago:';

    qrParrafo1.Caption := '1� EL ACREEDOR es titular de un cr�dito equivalente a ' + strDeuda +
                          ' , seg�n Anexo I que forma parte del presente convenio.';

    qrParrafo2.Caption := '2� El DEUDOR reconoce expresamente adeudar la suma de ' + strDeuda + ', ' +
                          'por el concepto indicado en el punto anterior, convini�ndose ' +
                          'que la misma sea abonada a EL ACREEDOR, seg�n se detalla en Anexo II ' +
                          'que forma parte del presente convenio.';

    qrParrafo3.Caption := '3� La ejecuci�n del presente convenio no exime a la ' +
                          'Empresa afiliada del cumplimiento, en tiempo y forma, ' +
                          'de la totalidad de las obligaciones asumidas con motivo del ' +
                          'contrato de afiliaci�n suscripto oportunamente con EL ACREEDOR';

    qrParrafo4.Caption := '4� Ambas partes convienen en pactar la mora autom�tica ' +
                          'y de pleno derecho, sin interpelaci�n de ninguna naturaleza, ' +
                          'oper�ndose para el caso de configurarse la mora en un vencimiento, ' +
                          'la mera caducidad del plazo otorgado para los vencimientos siguientes.';

    qrParrafo5.Caption := '5� La acreditaci�n de los importes depositados al cobro, ' +
                          'liberar�, en forma total y definitiva, a EL DEUDOR de la deuda reconocida en el punto 2�.';

    qrParrafo6.Caption := '6� En prueba de conformidad se firman dos ejemplares de un mismo tenor y a un �nico efecto,';

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
