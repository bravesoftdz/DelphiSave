unit unRptFormularioValidacionYRectificacionDatosEstablecimientos;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, ArtQReports, DB, SDEngine;

type
  TProcedureParameter = procedure of object;

  TqrFormularioValidacionYRectificacionDatosEstablecimientos = class(TQuickRep)
    bHeader: TQRBand;
    bSummary: TQRBand;
    bSubDetail: TQRSubDetail;
    bTitle: TQRBand;
    qrlBarras: TArtQRLabel;
    lbNumeroFormulario: TQRLabel;
    qrLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    sdqContrato: TSDQuery;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel49: TQRLabel;
    QRShape19: TQRShape;
    QRLabel50: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel52: TQRLabel;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    sdqEstablecimientos: TSDQuery;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    shLineaDetalle: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel29: TQRLabel;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel38: TQRLabel;
    QRShape1: TQRShape;
    QRLabel40: TQRLabel;
    QRShape40: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape47: TQRShape;
    QRShape49: TQRShape;
    QRLabel76: TQRLabel;
    sdNumeroPagina: TQRSysData;
    sBordesTitulos: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    lbTituloTipoMov2: TQRLabel;
    lbTituloCantidadPersonal2: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel89: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel91: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape32: TQRShape;
    QRShape56: TQRShape;
    lbTituloNumeroEstablecimiento2: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape4: TQRShape;
    QRLabel21: TQRLabel;
    qrBarrasContrato: TArtQRLabel;
    procedure QRDBText2Print(Sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure bSubDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bSubDetailAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure AfterSendEmail(Sender: TObject);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private
    FCantidadPasadas: Integer;
    FContrato: Integer;
    FExportarAPdf: Boolean;
    FFileName: String;
    FImprimirDirectamente: Boolean;
    FNumeroFormulario: Integer;
    FPageNumber: Integer;
    FParcialLineas: Integer;
    FParcialLineasBlanco: Integer;
    FTotalLineasBlanco: Integer;

    procedure SetHeader(const aIsFirstPage: Boolean);
    procedure UpdateHistoricoImpresion(const aDireccionesEmail: String = '');
  public
    procedure ExportPdf(aContrato: Integer; pPath: String);
    procedure Preparar(const aContrato: Integer; const aImprimirDirectamente: Boolean = False; const aExportarAPdf: Boolean = False);

    property FileName: String          read FFileName write FFileName;
    property NumeroFormulario: Integer read FNumeroFormulario;
  end;


const
  ARCHIVO_FRGRL_DESARROLLO = '\\ntwebart3\www$\Apps\modules\General\FormularioRelevamientoGeneralRiesgoLaboral\frgrl.html';
  ARCHIVO_FRGRL_PRODUCCION = '\\ntwebart1\www$\Apps\modules\General\FormularioRelevamientoGeneralRiesgoLaboral\frgrl.html';
  MAX_ESTABLECIMIENTOS_HOJA_1 = 26;
  MAX_ESTABLECIMIENTOS_HOJA_RESTANTES = 40;

var
  qrFormularioValidacionYRectificacionDatosEstablecimientos: TqrFormularioValidacionYRectificacionDatosEstablecimientos;

implementation

uses
  {$IFNDEF SERVICE}unVisualizador, unMoldeEnvioMail, {$ENDIF}unSesion, CUIT, unDmPrincipal, AnsiSql, unExportPDF, General;

{$R *.DFM}

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.Preparar(const aContrato: Integer; const aImprimirDirectamente: Boolean = False; const aExportarAPdf: Boolean = False);
var
  {$IFNDEF SERVICE}
  aBody: TStringList;
  {$ENDIF}
  iTotalEstablecimientos: Integer;
  sSql: String;
begin
  FCantidadPasadas      := 0;
  FContrato             := aContrato;
  FExportarAPdf         := aExportarAPdf;
  FImprimirDirectamente := aImprimirDirectamente;
  FNumeroFormulario     := 0;

  try
    qrLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  except
    // Si no existe no muestro nada..
  end;

  with sdqContrato do
  begin
    ParamByName('contrato').AsInteger := aContrato;
    Open;
  end;

  sSql :=
    'SELECT COUNT(*)' +
     ' FROM aes_establecimiento' +
    ' WHERE es_contrato = :contrato' +
      ' AND es_fechabaja IS NULL';
  iTotalEstablecimientos := ValorSqlIntegerEx(sSql, [aContrato]);
  if iTotalEstablecimientos > 8 then
    FTotalLineasBlanco := 2
  else
    FTotalLineasBlanco := 10 - iTotalEstablecimientos;

  with sdqEstablecimientos do
  begin
    ParamByName('contrato').AsInteger := aContrato;
    ParamByName('filas').AsInteger := FTotalLineasBlanco;
    Open;
  end;

  if FExportarAPdf then
  begin
    FileToPDFSvr(Self, ExtractFileDir(FFileName), FFileName, {$IFDEF SERVICE}False{$ELSE}True{$ENDIF});
  end
  {$IFNDEF SERVICE}
  else
  if aImprimirDirectamente then
    Print
  else
  begin
    aBody := TStringList.Create;
    with aBody do
    try
      if Is_ConectadoProduccion then
        LoadFromFile(ARCHIVO_FRGRL_PRODUCCION)
      else
        LoadFromFile(ARCHIVO_FRGRL_DESARROLLO);
      Text := StringReplace(Text, '{#RAZON_SOCIAL#}', sdqContrato.FieldByName('em_nombre').AsString, []);

      Visualizar(Self, GetValores('Contrato ' + IntToStr(aContrato), Sesion.UserMail, 0, 0, Text),
                 [TOpcionVisualizador(oAlwaysShowDialog), oEmailFijo, oEmailHTML, oForceDB, oForceShowModal], True, 'AfterSendEmail');
    finally
      aBody.Free;
    end;
  end;
  {$ENDIF}
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.SetHeader(const aIsFirstPage: Boolean);
begin
  lbNumeroFormulario.Enabled             := aIsFirstPage;
  lbTituloCantidadPersonal2.Enabled      := not aIsFirstPage;
  lbTituloNumeroEstablecimiento2.Enabled := not aIsFirstPage;
  lbTituloTipoMov2.Enabled               := not aIsFirstPage;
  qrlBarras.Enabled                      := aIsFirstPage;
  sBordesTitulos.Enabled                 := not aIsFirstPage;

  if aIsFirstPage then
    bHeader.Height := 104
  else
    bHeader.Height := 130;
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.UpdateHistoricoImpresion(const aDireccionesEmail: String = '');
var
  sSql: String;
begin
  sSql :=
    'INSERT INTO afi.afe_formulariosestablecimiento' +
               ' (fe_id, fe_contrato, fe_idendoso, fe_fechaimpresion, fe_usuimpresion, fe_email, fe_estado)' +
        ' VALUES (:ID, :contrato, (SELECT MAX(en_id)' +
                                   ' FROM aen_endoso' +
                                  ' WHERE en_contrato = :contrato), SYSDATE, :usuario, :email, ''P'')';
  EjecutarSqlEx(sSql, [FNumeroFormulario, FContrato, FContrato, Sesion.UserID, aDireccionesEmail]);
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.QRDBText2Print(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FPageNumber := 0;
  FParcialLineas := 0;
  FParcialLineasBlanco := 0;

  shLineaDetalle.Left := 12;
  shLineaDetalle.Width := 998;

  qrBarrasContrato.Caption := Format('*%d*', [FContrato]);

  if (((FImprimirDirectamente) or (FCantidadPasadas > 0)) and (not Exporting)) or (FExportarAPdf) then
  begin
    if FNumeroFormulario = 0 then
      FNumeroFormulario := GetSecNextVal('AFI.SEQ_AFE_ID');
    qrlBarras.Caption := Format('*%d*', [FNumeroFormulario]);
    lbNumeroFormulario.Caption := Format('Nº %d', [FNumeroFormulario]);
  end;
  Inc(FCantidadPasadas);
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.bSubDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if sdqEstablecimientos.FieldByName('ES_NOMBRE').IsNull then
    Inc(FParcialLineasBlanco);

  if FParcialLineasBlanco = FTotalLineasBlanco then
  begin
    shLineaDetalle.Left := shLineaDetalle.Left - 4;
    shLineaDetalle.Width := shLineaDetalle.Width + 8;
  end;

  Inc(FParcialLineas);

  if QRPrinter.PageNumber = 1 then
  begin
    if FParcialLineas = MAX_ESTABLECIMIENTOS_HOJA_1 then
      bSubDetail.Frame.DrawBottom := True;
  end
  else
    if ((FParcialLineas - MAX_ESTABLECIMIENTOS_HOJA_1) mod MAX_ESTABLECIMIENTOS_HOJA_RESTANTES) = 0 then
      bSubDetail.Frame.DrawBottom := True;
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.bHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
// Tengo que usar una variable (FPageNumber) porque al enviar por mail el QR no indica bien el número de página real..
//  SetHeader(QRPrinter.PageNumber = 1);
  SetHeader(FPageNumber = 1);
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.bSubDetailAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  bSubDetail.Frame.DrawBottom := False;
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.QuickRepAfterPrint(Sender: TObject);
begin
  UpdateHistoricoImpresion;
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.AfterSendEmail(Sender: TObject);
begin
  UpdateHistoricoImpresion(ValoresART.DireccionesEmailEnviado);
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  FPageNumber := FPageNumber + 1;
end;

procedure TqrFormularioValidacionYRectificacionDatosEstablecimientos.ExportPdf(aContrato: Integer; pPath: String);
begin
  FileName := pPath;
  Preparar(aContrato, False, True);
end;

end.
