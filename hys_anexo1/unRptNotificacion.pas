unit unRptNotificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ArtQReports;

type
  TrptNotificacion = class(TForm)
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
    lbEmpresa: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    lbInicioFormulario: TQRLabel;
    lbFormualario: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lbEstablecimiento: TQRExprMemo;
    QRMemo1: TQRMemo;
    ChildBand1: TQRChildBand;
    qriFirma: TQRImage;
    ChildBand2: TQRChildBand;
    qrlFirmante: TArtQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lbCuit: TQRLabel;
    lbContrato: TQRLabel;
    lbTelefono: TQRLabel;
    logo: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load (Empresa,cuit,contrato,telefono, Establecimiento, Domicilio : string; Aviso : Integer);
  end;

var
  rptNotificacion: TrptNotificacion;

implementation

{$R *.dfm}
 uses unDmPrincipal;

{ TrptNotificacion }

procedure TrptNotificacion.Load(Empresa,cuit,contrato,telefono, Establecimiento, Domicilio : string; Aviso: Integer);
begin
  lbEmpresa.Caption := Empresa;
  lbEstablecimiento.Lines.Text := Establecimiento;
  lbEstablecimiento.Lines.Text := lbEstablecimiento.Lines.Text + Domicilio;
  lbCuit.Caption := cuit;
  lbContrato.Caption := contrato;
  lbTelefono.Caption := telefono;
  //lbLocalidad.Caption := Localidad;
  //lbProvincia.Caption := Provincia;
  with GetQuery(
    ' SELECT fi_firma, fi_firmante, fi_margeninferior '+
    '   FROM art.ctb_tablas, comunes.cfi_firma '+
    '  WHERE tb_clave = ''FIRMA'' AND tb_especial1 = fi_id AND tb_codigo = ''02'' ')do
  begin
    qrlFirmante.Caption := '';
    if not FieldByName('FI_FIRMA').IsNull then
      qriFirma.Picture.Assign(FieldByName('FI_FIRMA'));
    qrlFirmante.Left := qriFirma.Left + (qriFirma.Width div 2);
    qrlFirmante.Caption := FieldByName('FI_FIRMANTE').AsString;
    ChildBand2.Height := qriFirma.Height;
  end;


  if Aviso = 1 then
    lbFormualario.Caption := 'AVISO DE OBRA firmado para la locación de referencia; recordamos que dicha documentación debe ser'
  else if Aviso = 0 then
    lbFormualario.Caption := 'PROGRAMA de SEGURIDAD de la  Obra  de  referencia; recordamos  que  dicha  documentación  debe  ser'
  else if Aviso = 2  then
  begin
    lbFormualario.Caption := 'PROGRAMA de SEGURIDAD de la  Obra  de  referencia; recordamos  que  dicha  documentación  debe  ser';
    lbInicioFormulario.Caption := 'El motivo de la presente es notificarle que al día de la fecha Provincia ART ha recibido tardíamente el';
  end;


end;

end.
