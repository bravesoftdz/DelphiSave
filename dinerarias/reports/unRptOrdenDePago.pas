unit unRptOrdenDePago;

interface
          
uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, QuickRpt, QRCtrls, unComunes, unClassLiquidacion;

type
  TqrOrdenDePago = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    qrlNumLiqui: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFEmision: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    qrlCuit: TQRLabel;
    qrlNombre: TQRLabel;
    QRLabel2: TQRLabel;
    qrlCheque: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape9: TQRShape;
    qrlFondo1: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    qrlExpediente: TQRLabel;
    qrlLeyendaTipo: TQRLabel;
    qrlImporperi: TQRLabel;
    QRLabel12: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRLabel13: TQRLabel;
    qrlFechaDesde: TQRLabel;
    QRLabel14: TQRLabel;
    qrlFechaHasta: TQRLabel;
    QRLabel15: TQRLabel;
    qrlImporperi2: TQRLabel;
    qrlObs: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    qrlFondo2: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel32: TQRLabel;
    qrlImporperi4: TQRLabel;
    qrlImporperi3: TQRLabel;
    QRLabel20: TQRLabel;
    qrlLeyenda: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRLabel23: TQRLabel;
    qrlFechaPago: TQRLabel;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape25: TQRShape;
    qriLogo: TQRImage;
    procedure qrlFondo1Print(sender: TObject; var Value: String);
    procedure qrlFondo2Print(sender: TObject; var Value: String);
  private

  public
    procedure Preparar(Liquidacion: TLiquidacion; CantCopias: Integer; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unSesion, unArt, Printers, DateTimeFuncs, Cuit, Numeros;

{$R *.DFM}

procedure TqrOrdenDePago.Preparar(Liquidacion: TLiquidacion; CantCopias: Integer; TipoSalida: TSalidaReport);
var
  sLeyenda, sLeyendaTipo: String;
begin
  with Liquidacion do
  begin
    PrinterSettings.Copies       := CantCopias;
    PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

    if Expediente.IsSiniestroGobernacion then
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
    else
      qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');

    qrlNumLiqui.Caption   := IntToStr(NroLiquidacion);
    qrlFEmision.Caption   := DateToStr(FechaEmision);
    qrlFechaPago.Caption  := DateToStr(FechaEmision);
    qrlCuit.Caption       := PonerGuiones(Expediente.Empresa.CUIT);
    qrlNombre.Caption     := Expediente.Empresa.RazonSocial;
    qrlExpediente.Caption := Expediente.SiniestroCompleto;
    qrlTrabajador.Caption := Expediente.Trabajador.Nombre;
    qrlFechaDesde.Caption := DateToStr(Desde);
    qrlFechaHasta.Caption := DateToStr(Hasta);
    qrlImporperi.Caption  := Get_AjusteDecimales(FloatToStr(TotalAPagar), '$');
    qrlImporperi2.Caption := qrlImporperi.Caption;
    qrlImporperi3.Caption := qrlImporperi.Caption;
    qrlImporperi4.Caption := qrlImporperi.Caption;
    qrlCheque.Caption     := ChequeANombreDe;
    qrlObs.Caption        := Iif(Observaciones = '', '', 'Observaciones: ' + Observaciones);

    if Tipo = 'J' then
      sLeyenda := '----- AJUSTE -----'
    else if Tipo = 'R' then
      sLeyenda := '----- RECALCULO -----'
    else
      sLeyenda := '';
    qrlLeyenda.Caption := sLeyenda;

    if Liquidacion is TILP then
    begin
      case GetTipoLiqui() of
        tlReintegroEmpleador:
          sLeyendaTipo := 'Reintegro de Indemnizaciones por Incapacidad Temporaria';
        tlPagoDirecto:
          begin
            if Tipo = 'D' then
              sLeyendaTipo := 'Pago Directo de Indemnizaciones por Incapacidad Temporaria'
            else if Tipo = 'I' then
              sLeyendaTipo := 'Pago Directo de Indemnizaciones por Incapacidad Permanente'
            else
              sLeyendaTipo := '';
          end
      end;
    end
    else
      sLeyendaTipo := '';
    qrlLeyendaTipo.Caption := sLeyendaTipo;

    try
      case TipoSalida of
        srPreview: Visualizar(Self, GetValores('', ''), [oForceShowModal, oMailNotAllowed]);
        srPrint:   Print;
      end;
    except
      Free;
    end
  end;
end;

procedure TqrOrdenDePago.qrlFondo1Print(sender: TObject; var Value: String);
begin
  Value := '';
end;

procedure TqrOrdenDePago.qrlFondo2Print(sender: TObject; var Value: String);
begin
  Value := '';
end;

end.

