unit unRptNotaReqCarDef;          // por tk 62062

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls, unComunes, General, unVisualizador,
  Data.DB, SDEngine, Vcl.StdCtrls, Vcl.Buttons, FormPanel, unDmPrincipal, CustomDlgs, CUIT;

type
  TrptNotaReqCarDef = class(TForm)
    qrNotaReqCarDef: TQuickRep;
    fpNroExpedienteSRT: TFormPanel;
    Bevel8: TBevel;
    btnAceptarExpedSRT: TBitBtn;
    sdqDatos: TSDQuery;
    edNroExpedienteSRT: TEdit;
    PageHeaderBand1: TQRBand;
    qriLogoART: TQRImage;
    qrlFecha: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlExpedienteSRT: TQRLabel;
    qrlCuil: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    procedure fpNroExpedienteSRTBeforeShow(Sender: TObject);
    procedure btnAceptarExpedSRTClick(Sender: TObject);
  private
    { Private declarations }
    procedure Do_GuardarExpedienteSRT(iIdSEVNuevo: integer; sNroExpedienteSRT: string);
  public
    { Public declarations }
    procedure Preparar(iIdExped, iIdSEVNuevo:integer; sCuil, sTrabajador:string);
  end;

var
  rptNotaReqCarDef: TrptNotaReqCarDef;

implementation

{$R *.dfm}

{ TrptNotaReqCarDef }

procedure TrptNotaReqCarDef.Preparar(iIdExped, iIdSEVNuevo: integer; sCuil, sTrabajador:string);
var sNroExpedSRT: string;
begin
  sdqDatos.Close;
  if Is_SiniestroDeGobernacion(iIdExped) then
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  qrlFecha.Caption := LugarImpresion + ', ' + DateFormat(Date, 'd ''de'' MMMM ''de'' yyyy');

  // Aca llamar a formpanel con el nro expediente srt para que lo completen y ponerlo en el reporte, (edit con texto libre)
  //qrlExpedienteSRT.Caption := poner el nro ;
  if (fpNroExpedienteSRT.ShowModal = mrOk) then
  begin
    qrlCuil.Caption          := PonerGuiones(sCuil);
    qrlTrabajador.Caption    := sTrabajador;
    sNroExpedSRT             := edNroExpedienteSRT.Text;
    qrlExpedienteSRT.Caption := sNroExpedSRT;
    Do_GuardarExpedienteSRT(iIdSEVNuevo, sNroExpedSRT);
    sdqDatos.Open;
    Visualizar(qrNotaReqCarDef, GetValores(), [oForceDB, oAlwaysShowDialog, oForceShowModal, oAutoFirma]);         // TK 62686 (agrego para enviar por mail)
  end;
end;


procedure TrptNotaReqCarDef.Do_GuardarExpedienteSRT(iIdSEVNuevo: integer; sNroExpedienteSRT: string);
var sSql: string;
begin
  sSql := 'UPDATE art.sev_eventosdetramite ' +
            ' SET ev_nroexpedientesrt = :nro ' +
          ' WHERE ev_idevento = :id ';
  EjecutarSQLSTEx(sSql, [sNroExpedienteSRT, iIdSEVNuevo]);
end;

procedure TrptNotaReqCarDef.btnAceptarExpedSRTClick(Sender: TObject);
begin
  fpNroExpedienteSRT.ModalResult := mrNone;
  if (edNroExpedienteSRT.Text = '') then
    infohint(edNroExpedienteSRT, 'Debe completar el Nro. de Expediente de SRT.')
  else
    fpNroExpedienteSRT.ModalResult := mrOk;
end;

procedure TrptNotaReqCarDef.fpNroExpedienteSRTBeforeShow(Sender: TObject);
begin
  edNroExpedienteSRT.Clear;
end;

end.
