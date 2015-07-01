unit unRptLiqOtrosConceptos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, Quickrpt, QRCtrls, Db, SDEngine, unComunes, unClassLiquidacion;

type
  TqrLiqOtrosConceptos = class(TQuickRep)
    qrbTitle: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel7: TQRLabel;
    qrlContratoNro: TQRLabel;
    QRLabel1: TQRLabel;
    qrlContrato: TQRLabel;
    qrlExpediente: TQRLabel;
    qrlLiquid: TQRLabel;
    qrlDeleg: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlCUIT: TQRLabel;
    qrlAccidentado: TQRLabel;
    qrlCUIL: TQRLabel;
    qrlFAccidente: TQRLabel;
    qrlFEmision: TQRLabel;
    QRLabel2: TQRLabel;
    qrlTipoAcreed: TQRLabel;
    qrlReimpresion: TQRLabel;
    sdqConsulta: TSDQuery;
    qrlHAccidente: TQRLabel;
    qrlTitulo: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    qrlFactura: TQRLabel;
    qrlSRetencion: TQRLabel;
    qrlCRetencion: TQRLabel;
    QRShape18: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlTotal: TQRLabel;
    qrlConcepto: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    qrlObserv: TQRLabel;
    qrlCheque: TQRLabel;
    qrlUsuLiquid: TQRLabel;
    qrlNroExped: TQRLabel;
    QRLabel5: TQRLabel;
    qrlPaguese: TQRLabel;
    qrlCodBarras: TQRLabel;
    QRLabel6: TQRLabel;
    qrlFormaPago: TQRLabel;
    qrlFondos: TQRLabel;
    qrlCuenta: TQRLabel;
    qrlTitEnvioFondos: TQRLabel;
    sdqDetalle: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    qrshDetalle: TQRShape;
    QRLabel11: TQRLabel;
    qrshDetalle2: TQRShape;
    qrshDetalle3: TQRShape;
    qrshDetalle4: TQRShape;
    QRShape5: TQRShape;
    qrlTitDesde: TQRLabel;
    qrlTitHasta: TQRLabel;
    qrlDesde: TQRLabel;
    qrlHasta: TQRLabel;
    qrshPer2: TQRShape;
    qrshPer1: TQRShape;
    qrlPeriodo: TQRLabel;
    qrshCoef2: TQRShape;
    qrlCoeficiente: TQRLabel;
    qrshCoef1: TQRShape;
    qrlTasaOrig: TQRLabel;
    qrlTasaFinal: TQRLabel;
    qrshTasa: TQRShape;
    qrlTasa1: TQRLabel;
    qrlTasa2: TQRLabel;
    QRLabel12: TQRLabel;
    qrlTipoAccidente: TQRLabel;
    procedure FormatoMonto(sender: TObject; var Value: String);
  private
    function Get_AjusteDecimales2(Value: String): String;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Preparar(Siniestro, Orden, Recaida, Liquidacion, CantCopias: Integer;
                       ChequeA: String; TipoSalida: TSalidaReport = srPreview);
  end;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, General, StrFuncs, Printers,
  AnsiSql, unSesion, VCLExtra, unTesoreria;

{$R *.DFM}

{-------------------------------------------------------------------------------}
constructor TqrLiqOtrosConceptos.Create(AOwner: TComponent);
begin
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TqrLiqOtrosConceptos.Preparar(Siniestro, Orden, Recaida, Liquidacion, CantCopias: Integer;
                                        ChequeA: String; TipoSalida: TSalidaReport = srPreview);
var
  bEsSinGobernacion: Boolean;
  sNroExpediente: String;
  iIdExped: integer;
begin
  Self.PrinterSettings.Copies       := CantCopias;
  Self.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

  with sdqDetalle do
  begin
    ParamByName('sin').AsInteger    := Siniestro;
    ParamByName('ord').AsInteger    := Orden;
    ParamByName('reca').AsInteger   := Recaida;
    ParamByName('nroliq').AsInteger := Liquidacion;
    Open;
    qrshDetalle.Enabled  := not IsEmpty;
    qrshDetalle2.Enabled := not IsEmpty;
    qrshDetalle3.Enabled := not IsEmpty;
    qrshDetalle4.Enabled := not IsEmpty;
  end;

  with sdqConsulta do
  begin
    ParamByName('sin').AsInteger    := Siniestro;
    ParamByName('ord').AsInteger    := Orden;
    ParamByName('reca').AsInteger   := Recaida;
    ParamByName('npago').AsInteger  := Liquidacion;
    Open;

    iIdExped := Get_idexpediente(Siniestro, Orden, Recaida);
    bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
    if bEsSinGobernacion then
    begin
      qrlEmpDep.Caption      := 'DEPENDENCIA GPBA';
      qrlContratoNro.Caption := '';
      qrlContrato.Caption    := '';
    end
    else begin
      qrlEmpDep.Caption      := 'EMPRESA';
      qrlContratoNro.Caption := 'CONTRATO NRO.';
      qrlContrato.Caption    := FieldByName('ex_contrato').AsString;
    end;

    qrlExpediente.Caption  := FieldByName('siniestro').AsString;
    qrlLiquid.Caption      := LPad(IntToStr(Liquidacion), '0', 3);
    qrlDeleg.Caption       := FieldByName('lg_nombre').AsString;
    qrlEmpresa.Caption     := FieldByName('empresa').AsString;
    qrlCUIT.Caption        := FieldByName('cuit').AsString;
    qrlAccidentado.Caption := FieldByName('tj_nombre').AsString;
    qrlHAccidente.Caption  := FieldByName('ex_horaaccidente').AsString;
    qrlCUIL.Caption        := FieldByName('cuil').AsString;
    qrlFAccidente.Caption  := FieldByName('ex_fechaaccidente').AsString;
    qrlFEmision.Caption    := DateToStr(NvlDT(FieldByName('pr_femision').AsDateTime, DBDate));
    qrlTipoAcreed.Caption  := FieldByName('tipoacre').AsString;
    qrlReimpresion.Caption := Iif((FieldByName('pr_femision').AsDateTime = 0) or
                                  (FieldByName('pr_femision').AsDateTime = DBDate), '', '***REIMPRESION***');
    qrlFactura.Caption     := FieldByName('factura').AsString;
    qrlConcepto.Caption    := FieldByName('conpago').AsString;
    qrlCRetencion.Caption  := FieldByName('pr_importeconretencion').AsString;
    qrlSRetencion.Caption  := FieldByName('pr_importesinretencion').AsString;
    qrlTotal.Caption       := FieldByName('pr_imporpago').AsString;
    qrlObserv.Caption      := FieldByName('pr_comentario').AsString;
    qrlPaguese.Caption     := FieldByName('paguese').AsString;
    qrlTipoAccidente.Caption := FieldByName('tipoaccidente').AsString;

    
    qrlCheque.Caption := IIF(ChequeA <> '', ChequeA, FieldByName('pr_chequenombre').AsString);

    qrlUsuLiquid.Caption   := IIF(FieldByName('pr_usualta').AsString = 'AUTOMATICO',
                                  FieldByName('pr_usualta').AsString,
                                  ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                             ' WHERE se_usuario = :Usu', [FieldByName('pr_usualta').AsString]));
    sNroExpediente         := lpad(Siniestro, '0', 8) + lpad(Orden, '0', 2) +
                              lpad(Recaida, '0', 2) + lpad(Liquidacion, '0', 3);
    qrlFormaPago.Caption   := FieldByName('metodo').AsString;
    if FieldByName('pr_enviofondos').IsNull then
    begin
      qrlFondos.Caption         := '';
      qrlTitEnvioFondos.Caption := '';
    end
    else
      qrlFondos.Caption         := FieldByName('pr_enviofondos').AsString;

    qrlCuenta.Caption      := GetCuenta(FieldByName('pr_acreedor').AsString, FieldByName('tj_id').AsInteger,
                                        FieldByName('em_id').AsInteger, FieldByName('pr_cuitcuil').AsString,
                                        FieldByName('cp_conpago').AsInteger);
    qrlNroExped.Caption    := sNroExpediente;
    qrlCodBarras.Caption   := '*' + sNroExpediente + '*';

    LockControls([qrshTasa, qrlTasa1, qrlTasa2, qrshPer1, qrshPer2, qrlPeriodo,
                  qrlTitDesde, qrlTitHasta, qrlDesde, qrlHasta], FieldByName('pr_tipotasa').IsNull);
    LockControls([qrlCoeficiente, qrlTasaOrig, qrlTasaFinal, qrshCoef2, qrshCoef1], FieldByName('pr_tasaoriginal').IsNull);

    qrlTasa1.Caption       := IIF(FieldByName('pr_tipotasa').AsString = 'R', 'RECAPITALIZACION',
                                  IIF(FieldByName('pr_tipotasa').AsString = 'A', 'TASA ACTIVA', 'TASA PASIVA'));
    qrlTasa2.Caption       := IIF(FieldByName('pr_tipotasa').AsString = 'R', 'DEL CAPITAL',
                                  IIF(FieldByName('pr_tipotasa').AsString = 'A', 'BANCO DE LA NACION ARGENTINA', 'B.C.R.A.'));
    qrlDesde.Caption       := FieldByName('pr_fechadesde').AsString;
    qrlHasta.Caption       := FieldByName('pr_fechahasta').AsString;
    qrlTasaOrig.Caption    := FieldByName('pr_tasaoriginal').AsString;
    qrlTasaFinal.Caption   := FieldByName('pr_tasafinal').AsString;

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
    sdqDetalle.Close;
  end;
end;
{-------------------------------------------------------------------------------}
function TqrLiqOtrosConceptos.Get_AjusteDecimales2(Value: String): String;
begin
  if Value = '0' then
    Result := ''
  else
    Result := Get_AjusteDecimales(Value);
end;
{-------------------------------------------------------------------------------}
procedure TqrLiqOtrosConceptos.FormatoMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales2(Value);
end;


end.

