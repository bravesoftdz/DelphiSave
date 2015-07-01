unit unRptHistoriaEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, qrpBaseCtrls, QRCtrls, Data.DB, SDEngine, Vcl.Imaging.jpeg;

type
  TfrmRptHistoriaEmpresa = class(TForm)
    Hoja1: TQRPQuickrep;
    sdqDatos: TSDQuery;
    QRBand1: TQRBand;
    CompositeReport: TQRCompositeReport;
    qriLogoART: TQRImage;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRLabel7: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel8: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape49: TQRShape;
    QRShape133: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel22: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel32: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel33: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel24: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    Hoja2: TQRPQuickrep;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRLabel36: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape78: TQRShape;
    QRLabel42: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape89: TQRShape;
    QRLabel43: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel67: TQRLabel;
    PageFooterBand1: TQRBand;
    PageFooterBand2: TQRBand;
    qrlFecha: TQRLabel;
    qrlContrato: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlHolding: TQRLabel;
    qrlVigenciaDesde: TQRLabel;
    qrlVigenciaHasta: TQRLabel;
    qrlActividad: TQRLabel;
    QRImage1: TQRImage;
    qrlCategoria: TQRLabel;
    qrlCalle: TQRLabel;
    qrlEmailCorporativo: TQRLabel;
    qrlNumero: TQRLabel;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRLabel39: TQRLabel;
    qrlPiso: TQRLabel;
    QRLabel40: TQRLabel;
    qrlDepto: TQRLabel;
    QRShape77: TQRShape;
    QRLabel41: TQRLabel;
    qrlCodigoPostal: TQRLabel;
    qrlLocalidad: TQRLabel;
    qrlProvincia: TQRLabel;
    qrlTelefonos: TQRLabel;
    qrlMasaSalarial: TQRLabel;
    qrlTrabajadores: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrlVigenciaTarifa: TQRLabel;
    qrlSumaFija: TQRLabel;
    qrlPorcVariable: TQRLabel;
    qrlDeudaTotal: TQRLabel;
    qrlDevengados: TQRLabel;
    qrlEjecutivoComercial: TQRLabel;
    qrlAsesorEmision: TQRLabel;
    qrlGestor: TQRLabel;
    qrlPreventor: TQRLabel;
    qrlFechaUltimaVisita: TQRLabel;
    procedure CompositeReportAddReports(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    procedure ImprimirReporte(AContrato: Integer);
  end;

var
  frmRptHistoriaEmpresa: TfrmRptHistoriaEmpresa;

implementation

{$R *.dfm}

{ TfrmRptHistoriaEmpresa }

procedure TfrmRptHistoriaEmpresa.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add( Hoja1 );
  CompositeReport.Reports.Add( Hoja2 );
end;

procedure TfrmRptHistoriaEmpresa.ImprimirReporte(AContrato: Integer);
begin
  sdqDatos.ParamByName('CONTRATO').AsInteger := AContrato;
  sdqDatos.Open;
  CompositeReport.Preview;
end;

procedure TfrmRptHistoriaEmpresa.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlFecha.Caption              := sdqDatos.FieldByName('FECHA').AsString;
  qrlContrato.Caption           := sdqDatos.FieldByName('CONTRATO').AsString;
  qrlEmpresa.Caption            := sdqDatos.FieldByName('EMPRESA').AsString;
  qrlHolding.Caption            := sdqDatos.FieldByName('HOLDING').AsString;
  qrlVigenciaDesde.Caption      := sdqDatos.FieldByName('VIGENCIADESDE').AsString;
  qrlVigenciaHasta.Caption      := sdqDatos.FieldByName('VIGENCIAHASTA').AsString;
  qrlActividad.Caption          := sdqDatos.FieldByName('ACTIVIDAD').AsString;
  qrlCategoria.Caption          := sdqDatos.FieldByName('CATEGORIA').AsString;
  qrlCalle.Caption              := sdqDatos.FieldByName('CALLE').AsString;
  qrlNumero.Caption             := sdqDatos.FieldByName('NUMERO').AsString;
  qrlPiso.Caption               := sdqDatos.FieldByName('PISO').AsString;
  qrlDepto.Caption              := sdqDatos.FieldByName('DEPTO').AsString;
  qrlCodigoPostal.Caption       := sdqDatos.FieldByName('CODIGOPOSTAL').AsString;
  qrlLocalidad.Caption          := sdqDatos.FieldByName('LOCALIDAD').AsString;
  qrlProvincia.Caption          := sdqDatos.FieldByName('PROVINCIA').AsString;
  qrlTelefonos.Caption          := sdqDatos.FieldByName('TELEFONOS').AsString;
  qrlEmailCorporativo.Caption   := sdqDatos.FieldByName('EMAILCORPORATIVO').AsString;
  qrlPeriodo.Caption            := sdqDatos.FieldByName('PERIODO').AsString;
  qrlTrabajadores.Caption       := sdqDatos.FieldByName('TRABAJADORES').AsString;
  qrlMasaSalarial.Caption       := sdqDatos.FieldByName('MASASALARIAL').AsString;
  qrlVigenciaTarifa.Caption     := sdqDatos.FieldByName('VIGENCIATARIFA').AsString;
  qrlSumaFija.Caption           := sdqDatos.FieldByName('SUMAFIJA').AsString;
  qrlPorcVariable.Caption       := sdqDatos.FieldByName('PORCVARIABLE').AsString;
  qrlDevengados.Caption         := sdqDatos.FieldByName('DEVENGADOS').AsString;
  qrlDeudaTotal.Caption         := sdqDatos.FieldByName('DEUDATOTAL').AsString;
  qrlEjecutivoComercial.Caption := sdqDatos.FieldByName('EJECUTIVOCOMERCIAL').AsString;
  qrlAsesorEmision.Caption      := sdqDatos.FieldByName('ASESOREMISION').AsString;
  qrlGestor.Caption             := sdqDatos.FieldByName('GESTOR').AsString;
  qrlPreventor.Caption          := sdqDatos.FieldByName('PREVENTOR').AsString;
  qrlFechaUltimaVisita.Caption  := sdqDatos.FieldByName('FECHAULTIMAVISITA').AsString;
end;

end.
