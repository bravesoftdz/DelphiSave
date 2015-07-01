unit unQrResumenErroresUsuario;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type                 
  TqrResumenErroresUsuario = class(TQuickRep)
    qrbHeader: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlPagina: TQRLabel;
    sdqDatos: TSDQuery;
    qrgGerencia: TQRGroup;
    QRDBText1: TQRDBText;
    qrbDetalle: TQRBand;
    qrdbCantHoj: TQRDBText;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    qrbFooterLote: TQRBand;
    QRShape5: TQRShape;
    sbTotales: TQRBand;
    QRShape10: TQRShape;
    QRLabel5: TQRLabel;
    QRShape8: TQRShape;
    QRShape12: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrsVert2HeaderValores: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    qrdbCantErr: TQRDBText;
    qrgHeaderUsuario: TQRGroup;
    qrdbUsuario: TQRDBText;
    qreCantErrSubTotalLote: TQRExpr;
    qreCantErrTotal: TQRExpr;
    QRShape1: TQRShape;
    QRShape17: TQRShape;
    qrlPorc: TQRLabel;
    qrlPorcSubTotalLote: TQRLabel;
    qrlPorcTotal: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape19: TQRShape;
    qrgHeaderLote: TQRGroup;
    qrdbLote: TQRDBText;
    QRDBText3: TQRDBText;
    qrbFooterUsuario: TQRBand;
    QRShape14: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel11: TQRLabel;
    qreCantErrSubTotalUsuario: TQRExpr;
    qrlPorcSubTotalUsuario: TQRLabel;
    QRDBText4: TQRDBText;
    qrlCantHojasSubTotalUsuario: TQRLabel;
    qrlCantHojasTotal: TQRLabel;
    QRShape9: TQRShape;
    qrbFooterGerencia: TQRBand;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRLabel2: TQRLabel;
    qreCantErrTotalGcia: TQRExpr;
    qrlPorcTotalGcia: TQRLabel;
    qrlCantHojasTotalGcia: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape24: TQRShape;
    qrlFiltros: TQRLabel;
    qrbGerencia: TQRBand;
    QRDBText2: TQRDBText;
    procedure qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlPorcPrint(sender: TObject; var Value: String);
    procedure PonerGuiones(sender: TObject; var Value: String);
    procedure qrlPorcSubTotalLotePrint(sender: TObject; var Value: String);
    procedure qrlPorcTotalPrint(sender: TObject; var Value: String);
    procedure qrlPorcSubTotalUsuarioPrint(sender: TObject; var Value: String);
    procedure qrdbLotePrint(sender: TObject; var Value: String);
    procedure qrbFooterUsuarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sbTotalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbFooterGerenciaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlPorcTotalGciaPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    piCantDocs, piCantDocsGcia, piCantDocsLotesUsuario: Integer;
  public
  end;

  procedure DoImprimirResumenErroresUsuario(SqlFromWhere, DescrFiltros: String);

implementation

uses
  unDmPrincipal, unVisualizador, CustomDlgs, StrFuncs;

{$R *.DFM}

procedure TqrResumenErroresUsuario.qrbHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlPagina.Caption := 'Pág. ' + IntToStr(Self.PageNumber);
end;

procedure DoImprimirResumenErroresUsuario(SqlFromWhere, DescrFiltros: String);
var
  rpt: TqrResumenErroresUsuario;
  sSql: String;
begin
  rpt := TqrResumenErroresUsuario.Create(nil);

  with rpt do
    try
      piCantDocs             := 0;
      piCantDocsGcia         := 0;
      piCantDocsLotesUsuario := 0;

      qrlFiltros.Caption := DescrFiltros;

      sSql := 'SELECT SECT.SE_DESCRIPCION GERENCIA, USU.SE_NOMBRE USUARIO, NVL(EU_LOTE, 0) LOTE, TB_DESCRIPCION DESCRERROR, ' +
                     'ART.ARCHIVO.GET_CANTDOCUMENTOSLOTE(EU_LOTE) CANTDOCSLOTE, SUM(EU_CANTERRORES) CANTERRORLOTE ' +
                SqlFromWhere + ' ' +
               'GROUP BY SECT.SE_DESCRIPCION, USU.SE_NOMBRE, EU_LOTE, TB_DESCRIPCION ' +
               'ORDER BY 1, 2, 3';
      OpenQuery(sdqDatos, sSql);

      if sdqDatos.IsEmpty then
        MsgBox('No se han encontrados datos.', MB_ICONINFORMATION)
      else
        Visualizar(rpt, GetValores(), [oAlwaysShowDialog, oForceDB, oForceShowModal]);
    finally
      Free;
    end;
end;

procedure TqrResumenErroresUsuario.qrlPorcPrint(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('CANTDOCSLOTE').AsInteger = 0 then
    Value := ''
  else
    Value := Get_AjusteDecimales(ToStr(sdqDatos.FieldByName('CANTERRORLOTE').AsInteger/sdqDatos.FieldByName('CANTDOCSLOTE').AsInteger*100, 3), '', 3);

  PonerGuiones(Sender, Value);
end;

procedure TqrResumenErroresUsuario.PonerGuiones(Sender: TObject; var Value: String);
begin
  if (Value = '0') or (Trim(Value) = '') then
    Value := '---';
end;

procedure TqrResumenErroresUsuario.qrlPorcSubTotalLotePrint(sender: TObject; var Value: String);
begin
  if sdqDatos.FieldByName('CANTDOCSLOTE').AsInteger = 0 then
    Value := ''
  else
    Value := Get_AjusteDecimales(ToStr(qreCantErrSubTotalLote.Value.dblResult/sdqDatos.FieldByName('CANTDOCSLOTE').AsInteger*100, 3), '', 3);

  PonerGuiones(Sender, Value);

  qreCantErrSubtotalLote.Reset;
end;

procedure TqrResumenErroresUsuario.qrlPorcSubTotalUsuarioPrint(sender: TObject; var Value: String);
begin
  if piCantDocsLotesUsuario = 0 then
    Value := ''
  else
    Value := Get_AjusteDecimales(ToStr(qreCantErrSubTotalUsuario.Value.dblResult/piCantDocsLotesUsuario*100, 3), '', 3);

  PonerGuiones(Sender, Value);

  piCantDocsLotesUsuario := 0;
  qreCantErrSubtotalUsuario.Reset;
end;

procedure TqrResumenErroresUsuario.qrlPorcTotalPrint(sender: TObject; var Value: String);
begin
  if piCantDocs = 0 then
    Value := ''
  else
    Value := Get_AjusteDecimales(ToStr(qreCantErrTotal.Value.dblResult/piCantDocs*100, 3), '', 3);

  PonerGuiones(Sender, Value);

  piCantDocs := 0;
  qreCantErrTotal.Reset;
end;

procedure TqrResumenErroresUsuario.qrdbLotePrint(sender: TObject; var Value: String);
begin
  PonerGuiones(Sender, Value);

  piCantDocsGcia         := piCantDocsGcia + sdqDatos.FieldByName('CANTDOCSLOTE').AsInteger;
  piCantDocsLotesUsuario := piCantDocsLotesUsuario + sdqDatos.FieldByName('CANTDOCSLOTE').AsInteger;
end;

procedure TqrResumenErroresUsuario.qrbFooterUsuarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlCantHojasSubTotalUsuario.Caption := IntToStr(piCantDocsLotesUsuario);
end;

procedure TqrResumenErroresUsuario.sbTotalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrbGerencia.Enabled := False;
  qrlCantHojasTotal.Caption := IntToStr(piCantDocs);
end;

procedure TqrResumenErroresUsuario.qrbFooterGerenciaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  piCantDocs := piCantDocs + piCantDocsGcia;
  
  qrlCantHojasTotalGcia.Caption := IntToStr(piCantDocsGcia);
end;

procedure TqrResumenErroresUsuario.qrlPorcTotalGciaPrint(sender: TObject; var Value: String);
begin
  if piCantDocsGcia = 0 then
    Value := ''
  else
    Value := Get_AjusteDecimales(ToStr(qreCantErrTotalGcia.Value.dblResult/piCantDocsGcia*100, 3), '', 3);

  PonerGuiones(Sender, Value);

  piCantDocsGcia := 0;
  qreCantErrTotalGcia.Reset;
end;

procedure TqrResumenErroresUsuario.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qrbGerencia.Enabled := True;
end;

end.

