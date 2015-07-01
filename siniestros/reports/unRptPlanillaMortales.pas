unit unRptPlanillaMortales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  Data.DB, SDEngine;

type
  TrptPlanillaMortales = class(TForm)
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
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrmAMedica: TQRMemo;
    qrmLegales: TQRMemo;
    QRLabel10: TQRLabel;
    qrmSugerencia: TQRMemo;
    qrlSiniestro: TQRLabel;
    qrlFAcc: TQRLabel;
    qrlEmpleador: TQRLabel;
    qrlDamnificado: TQRLabel;
    qrlFRecep: TQRLabel;
    qrlFirmaAyG: TQRLabel;
    qrlFechaAyG: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlFirmaAmed: TQRLabel;
    qrlFechaAMed: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrlFirmaLegales: TQRLabel;
    qrlFechaLegales: TQRLabel;
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
    qriLogo: TQRImage;
    QRLabel15: TQRLabel;
    qrlAccionAyG: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    qrlAccionAmed: TQRLabel;
    QRLabel29: TQRLabel;
    qrlAccionLegales: TQRLabel;
    QRLabel31: TQRLabel;
    qrlAccionPyS: TQRLabel;
    procedure Imprimir(idcaso: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptPlanillaMortales: TrptPlanillaMortales;

implementation

{$R *.dfm}

uses uncomunes;

procedure TrptPlanillaMortales.Imprimir(idcaso: integer);
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
  qrlFRecep.Caption := sdqSiniestro.FieldByName('ex_fecharecepcion').AsString;

  for i := 1 to 4 do   //sectores
  begin
    sdqConsulta.Close;
    sdqConsulta.ParamByName('idcaso').AsInteger := idcaso;
    sdqConsulta.ParamByName('idsector').AsInteger := i;
    sdqConsulta.Open;

    case i of
      1: begin
        qrmResena.Lines.Text := sdqConsulta.FieldByName('ha_breveresenia').AsString;
        qrmConclusion.Lines.Text := sdqConsulta.FieldByName('ha_conclusion').AsString;
        qrmSugerencia.Lines.Text := sdqConsulta.FieldByName('ha_sugerencia').AsString;
        qrlFirmaAyG.Caption := sdqConsulta.FieldByName('se_nombre').AsString;
        qrlFechaAyG.Caption := sdqConsulta.FieldByName('ha_fechaalta').AsString;
        qrlAccionAyG.Caption := sdqConsulta.FieldByName('am_descripcion').AsString;
      end;
      3: begin
        qrmAMedica.Lines.Text := sdqConsulta.FieldByName('ha_observaciones').AsString;
        qrlFirmaAmed.Caption := sdqConsulta.FieldByName('se_nombre').AsString;
        qrlFechaAMed.Caption := sdqConsulta.FieldByName('ha_fechaalta').AsString;
        qrlAccionAmed.Caption := sdqConsulta.FieldByName('am_descripcion').AsString;
      end;
      2: begin
        qrmLegales.Lines.Text := sdqConsulta.FieldByName('ha_observaciones').AsString;
        qrlFirmaLegales.Caption := sdqConsulta.FieldByName('se_nombre').AsString;
        qrlFechaLegales.Caption := sdqConsulta.FieldByName('ha_fechaalta').AsString;
        qrlAccionLegales.Caption := sdqConsulta.FieldByName('am_descripcion').AsString;
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
