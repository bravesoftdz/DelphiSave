unit unRptPedidoDocum;            // TK 60625

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls, DateTimeFuncs, unDmPrincipal,
  unImportCryptoSrt, unComunes, unExportPDF, CustomDlgs, unCustomDataModule;

type
  TfrmPedidoDocum = class(TForm)
    qrPedidoDocum: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qriLogo: TQRImage;
    qrlLugarFecha: TQRLabel;
    QRLabel1: TQRLabel;
    qrlEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRLabel4: TQRLabel;
    qrlFechaAccidente: TQRLabel;
    QRLabel5: TQRLabel;
    qrlCuil: TQRLabel;
    QRLabel6: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    qrlPeriodo: TQRLabel;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
    function Get_PeriodoFechaAcc(dFechaAcc:TDateTime): string;
  public
    { Public declarations }
    Procedure PrepararReporte(sCuit, sNombreEmpresa, sNombreTrabajador, sCuil :string; dFechaAcc: TDateTime; Siniestro, Orden, Recaida: integer);
  end;

var
  frmPedidoDocum: TfrmPedidoDocum;

implementation

{$R *.dfm}

{ TfrmPedidoDocum }

procedure TfrmPedidoDocum.PrepararReporte(sCuit, sNombreEmpresa, sNombreTrabajador, sCuil :string; dFechaAcc: TDateTime; Siniestro, Orden, Recaida: integer);
var sFileName: string;
begin
  qrlLugarFecha.Caption     := 'Buenos Aires, ' + Get_FechaFormatoLargo(DBDateTime);
  qrlEmpresa.Caption        := sNombreEmpresa;
  qrlTrabajador.Caption     := sNombreTrabajador;
  qrlFechaAccidente.Caption := DateToStr(dFechaAcc);
  qrlCuil.Caption           := sCuil;
  qrlPeriodo.Caption        := Get_PeriodoFechaAcc(dFechaAcc);
  // qrPedidoDocum.Print;

  sFileName := Get_NombreArchivoPDF('PedidoDocumentacion', Siniestro, Orden, Recaida, sCuil);
  ExportarPDF(qrPedidoDocum, sFileName);

  // Servicio del Pájaro:
 // GetSecNextVal('SRT.SEQ_SCRCONSULTASSRT_ID');   no se usa aca, sino dentro del EnviarSRTResult.
  if EnviarSRTResult(sFileName, 'Pedido de Documentación a la Empresa', sCuit, 9, -1, 1, tmNone, False) then
    msgbox('Se ha enviado correctamente la carta con el Pedido de Documentación a la Empresa, via Ventanilla Electrónica.', MB_ICONINFORMATION)
   else
    MsgBox('No se ha enviado la carta con el Pedido de Documentación. Consulte con Sistemas.', MB_ICONERROR);

end;

function TfrmPedidoDocum.Get_PeriodoFechaAcc(dFechaAcc:TDateTime): string;
var dDesde, dHasta: TDateTime;
begin
  if (dFechaAcc > 0) then
  begin
    dDesde := FirstLastDayOfMonth(AddMonths(dFechaAcc, -12));
    dHasta := FirstLastDayOfMonth(dFechaAcc);
    Result := 'Desde ' + DateToStr(dDesde) + ' - Hasta ' + DateToStr(dHasta);
  end
  else
    Result := '';
end;

end.
