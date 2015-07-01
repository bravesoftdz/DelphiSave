unit unRptResumenILT;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrResumenILT = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbTitle: TQRBand;
    qrbPageFooter: TQRBand;
    qrlTitulo: TQRLabel;
    QRShape30: TQRShape;
    QRShape28: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    qrbChildOBSERVACIONES: TQRChildBand;
    qrbRemuneracionesHeader: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    qrbRemuneracionesDetail: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    qrbRemuneracionesFooter: TQRBand;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    sdqConsulta1: TSDQuery;
    QRShape6: TQRShape;
    TotDias: TQRExpr;
    sdqDatos: TSDQuery;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel47: TQRLabel;
    qrbChildCOMPANIAS: TQRChildBand;
    QRDBText4: TQRDBText;
    qrbContribucionesHeader: TQRBand;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape8: TQRShape;
    qrbContribucionesDetail: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    qrbContribucionesFooter: TQRBand;
    QRShape11: TQRShape;
    QRLabel21: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel22: TQRExpr;
    TotDGI: TQRExpr;
    sdqConsulta2: TSDQuery;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    qrbChildRETENCIONES: TQRChildBand;
    Label140: TQRLabel;
    QRDBText15: TQRDBText;
    qrbChildINDEMNIZACION: TQRChildBand;
    lbIndemnizacion: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    qrbChildFECHAPAGO: TQRChildBand;
    qrlabel123: TQRLabel;
    QRDBText32: TQRDBText;
    qrbChildCONTRIBUCIONES: TQRChildBand;
    QRLabel33: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText24: TQRDBText;
    qrlV: TQRLabel;
    QRDBText29: TQRDBText;
    qrbChildTOPE: TQRChildBand;
    QRLabel35: TQRLabel;
    QRDBText34: TQRDBText;
    qrbChildCALCULO: TQRChildBand;
    QRLabel36: TQRLabel;
    QRDBText35: TQRDBText;
    qrbChildBASEIMPONIBLE: TQRChildBand;
    lbBaseImponible: TQRLabel;
    QRDBText36: TQRDBText;
    qrbChildDELEGACION: TQRChildBand;
    QRLabel38: TQRLabel;
    QRDBText37: TQRDBText;
    qrbChildRECIBOS: TQRChildBand;
    QRLabel39: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel46: TQRLabel;
    qrbChildSeparadora: TQRChildBand;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    procedure VerificarContribucionesYAportes(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarBaseImponible(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarRETENCIONES(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sdqConsulta1AfterOpen(DataSet: TDataSet);
    procedure sdqConsulta2AfterOpen(DataSet: TDataSet);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
    procedure VerificarCALCULO(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarTOPE(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarCONTRIBUCIONES(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarFECHAPAGO(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarDELEGACION(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure VerificarRECIBOS(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText39Print(sender: TObject; var Value: String);
    procedure VerificarCOMPANIAS(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    ContribucionesYAportes: boolean;
    Concepto: byte;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Preparar(Siniestro, Orden, Recaida, Liquidacion: integer);
  end;

var
  qrResumenILT: TqrResumenILT;

implementation

uses
  unPrincipal, unVisualizador, SQLFuncs, unDmPrincipal, uncomunes;

{$R *.DFM}

constructor TqrResumenILT.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TqrResumenILT.Preparar(Siniestro, Orden, Recaida, Liquidacion: integer);
var
  sSubtitulo: string;
  bEsSinGobernacion :Boolean;
begin
  qrlTitulo.Caption := CAPTION_SUBTITULO_BASE + sSubtitulo;

  with sdqDatos do
  begin
    ParamByName ('Siniestro').Value := Siniestro;
    ParamByName ('Orden').Value     := Orden;
    ParamByName ('Recaida').Value   := Recaida;
    ParamByName ('NLiq').Value      := Liquidacion;
    Open;
  end;

  with sdqConsulta1 do
  begin
    ParamByName ('Siniestro').Value := Siniestro;
    ParamByName ('Orden').Value     := Orden;
    Open;
  end;

  with sdqConsulta2 do
  begin
    ParamByName ('Siniestro').Value := Siniestro;
    ParamByName ('Orden').Value     := Orden;
    ParamByName ('Recaida').Value   := Recaida;
    ParamByName ('NLiq').Value      := Liquidacion;
    Open;
  end;

  bEsSinGobernacion := Is_SiniestroGobernacion(Siniestro);
  if bEsSinGobernacion then
    qrlEmpDep.Caption := 'DEPENDENCIA GPBA';
  else
    qrlEmpDep.Caption := 'EMPRESA';

  if not sdqDatos.IsEmpty then
    try
      Visualizar(Self, GetValores('', ''), [oMailNotAllowed]);
    except
      Free;
    end
  else
    Free;
end;

procedure TqrResumenILT.VerificarContribucionesYAportes(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := ContribucionesYAportes;
end;

procedure TqrResumenILT.VerificarBaseImponible(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [62, 10, 98, 96, 97]; {2, 3, 6, 7, 5}
end;

procedure TqrResumenILT.VerificarRETENCIONES(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [62, 10, 98, 96]; {2, 3, 6, 7}
end;

procedure TqrResumenILT.sdqConsulta1AfterOpen(DataSet: TDataSet);
begin
  with DataSet do
    TFloatField(FieldByName('RS_IMPOAMPO')).Currency := True;
end;

procedure TqrResumenILT.sdqConsulta2AfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    TFloatField(FieldByName('Contribuciones')).DisplayFormat := '#0.00 %';
    TFloatField(FieldByName('Retenciones')).DisplayFormat    := '#0.00 %';
  end;
end;

procedure TqrResumenILT.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    TFloatField(FieldByName('I')).Currency := True;
    TFloatField(FieldByName('J')).Currency := True;
    TFloatField(FieldByName('R')).Currency := True;
    TFloatField(FieldByName('Y')).Currency := True;
    TFloatField(FieldByName('AD')).Currency := True;
    TFloatField(FieldByName('AE')).Currency := True;
    TFloatField(FieldByName('AF')).Currency := True;
    TFloatField(FieldByName('AI')).Currency := True;

    TFloatField(FieldByName('M')).DisplayFormat := '#0.00 %';
  end;
end;

procedure TqrResumenILT.VerificarCALCULO(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [62, 10, 98, 96, 95]; {2, 3, 6, 7, 4}
end;

procedure TqrResumenILT.VerificarTOPE(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [95]; {4}
end;

procedure TqrResumenILT.VerificarCONTRIBUCIONES(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [62, 10, 98, 96]; {2, 3, 6, 7}
end;

procedure TqrResumenILT.VerificarFECHAPAGO(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [77]; {1}
end;

procedure TqrResumenILT.VerificarDELEGACION(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [62, 10, 98, 96, 77]; {2, 3, 6, 7, 1}
end;

procedure TqrResumenILT.VerificarRECIBOS(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [62, 10, 98, 96]; {2, 3, 6, 7}
end;

procedure TqrResumenILT.QRDBText39Print(sender: TObject; var Value: String);
begin
  if not(Concepto in [62, 10, 98, 96, 97]) then {2, 3, 6, 7, 5}
    Value := '';
end;

procedure TqrResumenILT.VerificarCOMPANIAS(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Concepto in [95, 97]; {4, 5}
end;

end.
