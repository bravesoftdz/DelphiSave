unit unRptReciboOtrosConceptos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, unComunes, unClassLiquidacion,
  DB, SDEngine;

type
  TqrReciboOtrosConceptos = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qriLogo: TQRImage;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrlExpediente: TQRLabel;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    qrlLugarFecha: TQRLabel;
    QRLabel1: TQRLabel;
    qrlCantidad: TQRLabel;
    qrlCantLetras: TQRLabel;
    qrlFactura1: TQRLabel;
    qrlFactura: TQRLabel;
    qrlConcepto1: TQRLabel;
    qrlConcepto: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    qrlContrato: TQRLabel;
    qrlTipoAcreed: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel5: TQRLabel;
    qrlDamnificado: TQRLabel;
    QRLabel14: TQRLabel;
    qrlAsegurado: TQRLabel;
    QRLabel16: TQRLabel;
    sdqConsulta: TSDQuery;
    qrlRECPD: TQRLabel;
    qrshRECPD: TQRShape;
    qrlCodigoBarras: TQRLabel;
    qrlNroExpediente: TQRLabel;
  private

  public
    constructor Create(AOwner: TComponent); override;  
    procedure Preparar(Siniestro, Orden, Recaida, Liquidacion, CantCopias: Integer;
                       TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs,
  unSesion, unArt, Printers, DateTimeFuncs, Numeros;

{$R *.DFM}

{-------------------------------------------------------------------------------}
constructor TqrReciboOtrosConceptos.Create(AOwner: TComponent);
begin
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TqrReciboOtrosConceptos.Preparar(Siniestro, Orden, Recaida, Liquidacion, CantCopias: Integer;
                                           TipoSalida: TSalidaReport = srPreview);
var
  bVerFac: Boolean;
  sSql, sNroExpediente: String;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(Siniestro, Orden, Recaida);
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, IIF(Is_SiniestroDeGobernacion(iIdExped), 'LOGO_PART_GOB', 'LOGO_PART'));

  Self.PrinterSettings.Copies       := CantCopias;
  Self.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  with sdqConsulta do
  begin
    ParamByName('sin').AsInteger    := Siniestro;
    ParamByName('ord').AsInteger    := Orden;
    ParamByName('reca').AsInteger   := Recaida;
    ParamByName('npago').AsInteger  := Liquidacion;
    Open;
    qrlExpediente.Caption  := FieldByName('siniestro').AsString;
    qrlDelegacion.Caption  := FieldByName('lg_nombre').AsString;
    qrlAsegurado.Caption   := FieldByName('empresa').AsString;
    qrlContrato.Caption    := FieldByName('ex_contrato').AsString;
    qrlDamnificado.Caption := FieldByName('tj_nombre').AsString;
    qrlTipoAcreed.Caption  := FieldByName('tipoacre').AsString;

    bVerFac := (FieldByName('factura').AsString <> 'A 0001-00000001');
    qrlFactura.Enabled    := bVerFac;
    qrlFactura1.Enabled   := bVerFac;

    sSql := 'SELECT 1 ' +
             ' FROM art.use_usuarios ' +
            ' WHERE se_usuario = :usu ' +
              ' AND se_sector = ''PRESDIN'' ';
    if ExisteSqlEx(sSql, [FieldByName('pr_usualta').AsString]) then
    begin
      qrlRECPD.Enabled  := True;
      qrshRECPD.Enabled := True;
    end
    else begin
      qrlRECPD.Enabled  := False;
      qrshRECPD.Enabled := False;
    end;
    
    if not bVerFac then
    begin
      qrlConcepto.Top   := 404;
      qrlConcepto1.Top  := 404;
    end;

    qrlFactura.Caption     := FieldByName('factura').AsString;
    qrlConcepto.Caption    := FieldByName('cp_denpago').AsString;
    qrlCantidad.Caption    := FieldByName('pr_imporpago').AsString;
    qrlCantLetras.Caption  := '(Pesos ' + NumLetras(FieldByName('pr_imporpago').AsFloat, 2, True) + ')';
    qrlLugarFecha.Caption  := 'Buenos Aires, ' + Get_FechaFormatoLargo(FieldByName('pr_femision').AsDateTime);

    sNroExpediente := lpad(Siniestro, '0', 8) + lpad(Orden, '0', 2) +
                      lpad(Recaida, '0', 2) + lpad(Liquidacion, '0', 3);
    qrlNroExpediente.Caption := sNroExpediente;
    qrlCodigoBarras.Caption := '*' + sNroExpediente + '*';


    try
      case TipoSalida of
        srPreview: Visualizar(Self, GetValores('', ''), [oForceShowModal, oMailNotAllowed, oExportPDFNotAllowed,
                                                         oExportDOCNotAllowed, oExportXLSNotAllowed, oFaxNotAllowed]);
        srPrint:   Print;
      end;
    except
      Self.Free;
    end;
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
end.

