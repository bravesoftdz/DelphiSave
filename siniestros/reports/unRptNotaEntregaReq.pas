unit unRptNotaEntregaReq;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrNotaEntregaReq = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogoART: TQRImage;
    QRMemo1: TQRMemo;
    qrlFecha: TQRLabel;
    QRLabel3: TQRLabel;
    qrlTitulo: TQRLabel;
    qrlTitComMed: TQRLabel;
    qrlComisionMedica: TQRLabel;
    qrlFirmante: TQRLabel;
    QRLabel1: TQRLabel;
    qrlDaminificado: TQRLabel;
    QRLabel6: TQRLabel;
    qrlExpediente: TQRLabel;
    QRLabel7: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    qrl_ComMed_OfHomol: TQRLabel;
    qrlComMed_Homol: TQRLabel;
    qrmPedido: TQRMemo;
  private

  public
    procedure ImprimirNotaEntregaReq(sCodEvento:string);
  end;

const
  EV_OFHOMOL    = '361';
  EV_COMMED     = '360';
  EV_COMMEDCENT = '700';
var
  qrNotaEntregaReq: TqrNotaEntregaReq;

implementation

{$R *.DFM}

{ TqrNotaEntregaReq }

procedure TqrNotaEntregaReq.ImprimirNotaEntregaReq(sCodEvento: string);
begin
  if (sCodEvento = EV_COMMED) then
  begin
   // qrlTitulo.Caption          := 'Superintendencia de Administradoras de Fondos de Jubilaciones y Pensiones';
    qrlTitulo.Caption          := 'Superintendencia de Riesgos de Trabajo';  // TK 3965
    qrl_ComMed_OfHomol.Caption := 'Comisión Médica.';

    qrlComMed_Homol.Transparent := True;
    qrlComMed_Homol.Caption     := '';
  end
  else if (sCodEvento = EV_OFHOMOL) then
  begin
    qrlTitulo.Caption          := 'Señores Oficina de Homologación y Visado:';
    qrl_ComMed_OfHomol.Caption := 'Oficina de Homologación.';

    qrlComMed_Homol.Transparent := False;
    qrlComMed_Homol.Caption     := qrlComisionMedica.Caption;

    qrlTitComMed.caption       := '';
    qrlComisionMedica.caption  := '';
  end
  else if (sCodEvento = EV_COMMEDCENT) then     // Lu arreglo de WF 6988
  begin
    qrlTitulo.Caption           := 'Señores Comisión Médica Central';
    qrlComisionMedica.caption   := 'CENTRAL';
    qrl_ComMed_OfHomol.Caption  := '';
    qrlComMed_Homol.Transparent := True;
    qrl_ComMed_OfHomol.caption  := 'Comisión Médica Central';
  end;
  print;
end;

end.
