unit unRptSolicitudIntervencion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, StdCtrls, unComunes, unDmPrincipal;

type
  TfrmRptSolInt = class(TForm)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    qrInfSolInt1: TQuickRep;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape2: TQRShape;
    QRLabel29: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel30: TQRLabel;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel32: TQRLabel;
    QRShape9: TQRShape;
    qrlNroSiniestro: TQRLabel;
    QRShape10: TQRShape;
    QRLabel2: TQRLabel;
    qrlMotivo0: TQRLabel;
    qrlMotivo1: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel3: TQRLabel;
    qrlMotivo2: TQRLabel;
    qrlMotivo3: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape11: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlNombreTrab: TQRLabel;
    QRLabel11: TQRLabel;
    qrlCuilTrab: TQRLabel;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    qrlDomTrab: TQRLabel;
    QRShape14: TQRShape;
    qrlLocTrab: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape15: TQRShape;
    qrlProvTrab: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape16: TQRShape;
    QRLabel13: TQRLabel;
    qrlCPTrab: TQRLabel;
    qrlTelTrab: TQRLabel;
    QRLabel17: TQRLabel;
    qrlSexoTrab: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRLabel20: TQRLabel;
    qrlNroDocTrab: TQRLabel;
    qrlFechaNacTrab: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape18: TQRShape;
    qrlTipoDocTrab: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape19: TQRShape;
    QRLabel22: TQRLabel;
    QRShape20: TQRShape;
    QRLabel21: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel24: TQRLabel;
    QRShape23: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    qrlFechaIngTrab: TQRLabel;
    qrlTareaHabitualTrab: TQRLabel;
    qrlFechaIngTrab2: TQRLabel;
    QRLabel42: TQRLabel;
    qrlTareaHabitualTrab2: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape24: TQRShape;
    QRLabel45: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel46: TQRLabel;
    qrlDatosEmpDep: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel48: TQRLabel;
    qrlNombreEmp: TQRLabel;
    QRLabel50: TQRLabel;
    qrlCuitEmp: TQRLabel;
    QRLabel49: TQRLabel;
    qrlDomEmp: TQRLabel;
    QRShape29: TQRShape;
    QRLabel51: TQRLabel;
    qrlLocEmp: TQRLabel;
    QRShape30: TQRShape;
    QRLabel53: TQRLabel;
    qrlProvEmp: TQRLabel;
    QRShape31: TQRShape;
    QRLabel52: TQRLabel;
    qrlActivEmp: TQRLabel;
    QRLabel55: TQRLabel;
    qrlCodEmp: TQRLabel;
    QRLabel54: TQRLabel;
    qrlCPEmp: TQRLabel;
    QRLabel57: TQRLabel;
    qrlTelEmp: TQRLabel;
    ScrollBox2: TScrollBox;
    Label2: TLabel;
    qrInfSolInt2: TQuickRep;
    QRBand1: TQRBand;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape42: TQRShape;
    QRLabel63: TQRLabel;
    qrlFechaSin: TQRLabel;
    QRShape52: TQRShape;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    qrlDomEmp2: TQRLabel;
    qrlProvEmp2: TQRLabel;
    QRLabel132: TQRLabel;
    qrlCPEmp2: TQRLabel;
    QRLabel134: TQRLabel;
    qrlTelEmp2: TQRLabel;
    QRLabel41: TQRLabel;
    qrlNombreTrab2: TQRLabel;
    QRLabel137: TQRLabel;
    qrlCuilTrab2: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel34: TQRLabel;
    qrlEnfProf: TQRLabel;
    qrlItinere: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel60: TQRLabel;
    qrlAccidTrabajo: TQRLabel;
    qrlInicioJornada: TQRLabel;
    qrlHoraAccid: TQRLabel;
    QRLabel141: TQRLabel;
    qrlLugarAccidente: TQRLabel;
    QRLabel96: TQRLabel;
    qrlNombreEmp2: TQRLabel;
    QRLabel142: TQRLabel;
    qrlCuitEmp2: TQRLabel;
    QRShape38: TQRShape;
    QRLabel140: TQRLabel;
    QRShape40: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape33: TQRShape;
    qrlLocEmp2: TQRLabel;
    QRShape34: TQRShape;
    QRLabel64: TQRLabel;
    qrlBreveDesc: TQRLabel;
    QRShape32: TQRShape;
    QRLabel67: TQRLabel;
    QRShape39: TQRShape;
    QRLabel68: TQRLabel;
    QRShape41: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrlNroDenuncia: TQRLabel;
    QRLabel72: TQRLabel;
    qrlComisariaDen: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    qrlDomPres: TQRLabel;
    QRLabel76: TQRLabel;
    qrlLocPres: TQRLabel;
    QRLabel78: TQRLabel;
    qrlCPPres: TQRLabel;
    QRLabel80: TQRLabel;
    qrlTelPres: TQRLabel;
    QRLabel82: TQRLabel;
    qrlNombrePres: TQRLabel;
    qrlProvPres: TQRLabel;
    QRShape45: TQRShape;
    QRLabel75: TQRLabel;
    qrlDenPolSi: TQRLabel;
    qrlDenPolNo: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape46: TQRShape;
    QRLabel84: TQRLabel;
    QRShape47: TQRShape;
    v: TQRShape;
    QRLabel85: TQRLabel;
    qrlDiagnostico: TQRLabel;
    qrlMotivoLeyenda: TQRLabel;
    ScrollBox3: TScrollBox;
    Label3: TLabel;
    qrDeclaJurada: TQuickRep;
    QRBand2: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRShape66: TQRShape;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRMemo1: TQRMemo;
    qrlDJSiniestro: TQRLabel;
    QRLabel124: TQRLabel;
    qrlDJNombre: TQRLabel;
    QRLabel125: TQRLabel;
    qrlMotivo4: TQRLabel;
    QRLabel126: TQRLabel;
    qrlFechaImpresion: TQRLabel;
    qriLogoART: TQRImage;
    qriLogoARTDDJJ: TQRImage;
    qriLogoART2: TQRImage;
  private
    { Private declarations }
  public
    procedure ImprimirHojas;
    procedure ImprimirDeclaracionJurada(sSiniestro, sNombre: string; iNumSiniestro, iNumOrden, iNumRecaida: integer);
    procedure AsignaDatos_DeclaJurada(sSiniestro, sNombre: string; iNumSiniestro, iNumOrden, iNumRecaida: integer);
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmRptSolInt: TfrmRptSolInt;

implementation

{$R *.DFM}

procedure TfrmRptSolInt.AsignaDatos_DeclaJurada(sSiniestro, sNombre: string; iNumSiniestro, iNumOrden, iNumRecaida: integer);
var iIdExped: Integer;
begin
  qrlDJSiniestro.Caption    := sSiniestro;
  qrlDJNombre.Caption       := sNombre;
  qrlFechaImpresion.Caption := DateToStr(DBDate);         // Lu TK 2314

  iIdExped := Get_IdExpediente(iNumSiniestro, iNumOrden, iNumRecaida);
  if Is_SiniestroDeGobernacion(iIdExped) then          // Lu TK 2314
    qriLogoARTDDJJ.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogoARTDDJJ.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
end;

constructor TfrmRptSolInt.Create(AOwner: TComponent);
begin
 inherited;
end;

procedure TfrmRptSolInt.ImprimirDeclaracionJurada(sSiniestro, sNombre: string; iNumSiniestro, iNumOrden, iNumRecaida: integer);     // Lu WF 7755
begin
  AsignaDatos_DeclaJurada(sSiniestro, sNombre, iNumSiniestro, iNumOrden, iNumRecaida);
  qrDeclaJurada.Print;
end;

procedure TfrmRptSolInt.ImprimirHojas;
begin
  qrInfSolInt1.Print;
  qrInfSolInt2.Print;
end;

end.
