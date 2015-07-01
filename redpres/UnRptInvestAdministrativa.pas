unit UnRptInvestAdministrativa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SinEdit,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls, RxRichEd, Buttons, unVisualizador, unfraPrestador;

type
  TrptInvestAdministrativas = class(TForm)
    QuickRep: TQuickRep;
    QRBand1: TQRBand;
    Memo: TQRMemo;
    edInfoBasica: TRxRichEdit;
    btnVisualizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    QRBand2: TQRBand;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    qrmDireccion: TQRMemo;
    qrlFechaImpresion: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlNomPrestador: TQRLabel;
    qrlDomPrestador: TQRLabel;
    qrlProvPrestador: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlTelPrestador: TQRLabel;
    qrlFaxPrestador: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    qrlProvEmpresa: TQRLabel;
    qrlDomEmpresa: TQRLabel;
    qrlNomEmpresa: TQRLabel;
    QRLabel15: TQRLabel;
    qrlTelEmpresa: TQRLabel;
    QRLabel17: TQRLabel;
    qrlFaxEmpresa: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlNomTrabajador: TQRLabel;
    qrlDomTrabajador: TQRLabel;
    QRLabel19: TQRLabel;
    qrlProvTrabajador: TQRLabel;
    QRLabel21: TQRLabel;
    qrlTelTrabajador: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlLesion: TQRLabel;
    qrlAccidente: TQRLabel;
    QRLabel23: TQRLabel;
    qrlAutorizacion: TQRLabel;
    QRLabel26: TQRLabel;
    qrlFechaSini: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel24: TQRLabel;
    qrlObservaciones: TQRLabel;
    QRLabel25: TQRLabel;
    qrlAval: TQRLabel;
    QRLabel28: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlDocumento: TQRLabel;
    qrlCaracter: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel29: TQRLabel;
    qrlPrestacion: TQRLabel;
    QRLabel30: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape21: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    qrlRelaciones: TQRMemo;
    qrlAnulado: TQRLabel;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    Resultado: TResultados;
    FEMail: string;
    FNombre: string;    // Lu TK 5303
    FDni: string;
    FClaveFAX: String;
  public
    fraPrestadorAprob: TfraPrestador;
    function ShowModal: TResultados; reintroduce;

    property EMail    : String  read FEMail    write FEMail;
    property Nombre   : String  read FNombre   write FNombre;
    property Dni      : String  read FDni      write FDni;
    property ClaveFAX : String  read FClaveFAX write FClaveFAX;
  end;

var
  rptInvestAdministrativas: TrptInvestAdministrativas;

implementation

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TrptInvestAdministrativas.btnVisualizarClick(Sender: TObject);
begin
  Memo.Lines.Text := edInfoBasica.Lines.Text;
  Resultado := Visualizar(QuickRep, GetValores(' - Siniestro ' + qrlSiniestro.Caption + ' - ' + Nombre + ' - DNI ' + Dni, EMail),  // Lu TK 5303
                          GetValoresFax('AMED', ClaveFAX, 'I' {TipoDoc}, 'P' {TipoDest},
                          fraPrestadorAprob.Fax {Telefono}, fraPrestadorAprob.RazonSocial {Nombre},
                          fraPrestadorAprob.IDPrestador {IdDest}), [oAlwaysShowDialog, oForceDB]);
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TrptInvestAdministrativas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TrptInvestAdministrativas.ShowModal: TResultados;
begin
  inherited ShowModal;
  Result := Resultado;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
end.
