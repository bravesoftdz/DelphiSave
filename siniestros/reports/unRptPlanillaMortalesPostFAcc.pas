unit unRptPlanillaMortalesPostFAcc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  Data.DB, SDEngine;

type
  TrptPlanillaMortalesPostFAcc = class(TForm)
    rptPlanilla: TQuickRep;
    sdqConsulta: TSDQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    qrmResena: TQRMemo;
    QRLabel9: TQRLabel;
    qrmConclusion: TQRMemo;
    qrlSiniestro: TQRLabel;
    qrlFAcc: TQRLabel;
    qrlEmpleador: TQRLabel;
    qrlDamnificado: TQRLabel;
    qrlFFallecim: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlFirmaAmed: TQRLabel;
    qrlFechaAMed: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape4: TQRShape;
    qrmPyS: TQRMemo;
    QRLabel23: TQRLabel;
    qrlFirmaPys: TQRLabel;
    QRLabel27: TQRLabel;
    qrlFechaPyS: TQRLabel;
    sdqSiniestro: TSDQuery;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlFechaAcept: TQRLabel;
    qrlSolInforme: TQRLabel;
    qrlInvestigador: TQRLabel;
    QRLabel16: TQRLabel;
    qrmEvaluacion: TQRMemo;
    qriLogo: TQRImage;
    QRLabel11: TQRLabel;
    qrlAccionAMed: TQRLabel;
    QRLabel13: TQRLabel;
    qrlAccionPyS: TQRLabel;
    QRLabel12: TQRLabel;
    procedure Imprimir(idcaso: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptPlanillaMortalesPostFAcc: TrptPlanillaMortalesPostFAcc;

implementation

{$R *.dfm}

uses uncomunes;

procedure TrptPlanillaMortalesPostFAcc.Imprimir(idcaso: integer);
var i: integer;
begin
  sdqSiniestro.ParamByName('idcaso').AsInteger := idcaso;
  sdqSiniestro.Open;

  if Is_SiniestroDeGobernacion(sdqSiniestro.FieldByName('ex_id').AsInteger) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');

  qrlSiniestro.Caption := sdqSiniestro.FieldByName('siniestro').AsString;
  qrlFAcc.Caption := sdqSiniestro.FieldByName('ex_fechaaccidente').AsString;
  qrlEmpleador.Caption := sdqSiniestro.FieldByName('em_nombre').AsString;
  qrlDamnificado.Caption := sdqSiniestro.FieldByName('tj_nombre').AsString;
  qrlFFallecim.Caption := sdqSiniestro.FieldByName('ex_altamedica').AsString;
  qrlInvestigador.Caption := sdqSiniestro.FieldByName('investigador').AsString;
  qrlSolInforme.Caption := sdqSiniestro.FieldByName('finforme').AsString;
  qrlFechaAcept.Caption := sdqSiniestro.FieldByName('fechaacept').AsString;

  for i := 3 to 4 do   //sectores
  begin
    sdqConsulta.Close;
    sdqConsulta.ParamByName('idcaso').AsInteger := idcaso;
    sdqConsulta.ParamByName('idsector').AsInteger := i;
    sdqConsulta.Open;

    case i of
      3: begin
        qrmResena.Lines.Text := sdqConsulta.FieldByName('ha_breveresenia').AsString;
        qrmConclusion.Lines.Text := sdqConsulta.FieldByName('ha_conclusion').AsString;
        qrmEvaluacion.Lines.Text := sdqConsulta.FieldByName('ha_observaciones').AsString;
        qrlFirmaAmed.Caption := sdqConsulta.FieldByName('se_nombre').AsString;
        qrlFechaAMed.Caption := sdqConsulta.FieldByName('ha_fechaalta').AsString;
        qrlAccionAmed.Caption := sdqConsulta.FieldByName('am_descripcion').AsString;
      end;
      4: begin
        qrmPyS.Lines.Text := sdqConsulta.FieldByName('ha_observaciones').AsString;
        qrlFirmaPys.Caption := sdqConsulta.FieldByName('se_nombre').AsString;
        qrlFechaPyS.Caption := sdqConsulta.FieldByName('ha_fechaalta').AsString;
        qrlAccionPyS.Caption := sdqConsulta.FieldByName('am_descripcion').AsString;
      end;
    end;
  end;

  rptPlanilla.Preview;
end;

end.
