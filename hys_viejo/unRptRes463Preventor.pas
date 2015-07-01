unit unRptRes463Preventor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, QRPrntr;

type
  TrptRes463Preventor = class(TForm)
    sdqEmpresa: TSDQuery;
    qrResolucion: TQuickRep;
    qrbTitle: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    qrbDetail1: TQRBand;
    qrdbtDescripcion: TQRDBText;
    QRDBText3: TQRDBText;
    lbSi: TQRDBText;
    lbNo: TQRDBText;
    lbNoAplica: TQRDBText;
    QRBand2: TQRBand;
    lbAnexo: TQRLabel;
    qrlCUITCUIP: TQRLabel;
    qrlNroEstablecimiento: TQRLabel;
    logo: TQRImage;
    QRLabel30: TQRLabel;
    qrTituloForm: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel35: TQRLabel;
    CompositeReport: TQRCompositeReport;
    qrPlanillaA: TQuickRep;
    qrbPlanillaA: TQRBand;
    qrbColumnHeader: TQRBand;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBDescPlanillaA: TQRDBText;
    sdqSustAgentesCan: TSDQuery;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    sdqDifenilos: TSDQuery;
    sdqSustQuimicas: TSDQuery;
    qrPlanillaC: TQuickRep;
    qrbPlanillaC: TQRBand;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRDBDescPlanillaC: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    qrPlanillaB: TQuickRep;
    qrbPlanillaB: TQRBand;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRBand11: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBDescPlanillaB: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrPieReporte: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel4: TQRLabel;
    qrsLineaV1: TQRShape;
    qrsLineaV2: TQRShape;
    qrsLineaV3: TQRShape;
    qrsLineaV4: TQRShape;
    qrsLineaV5: TQRShape;
    qrsLineaV6: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape29: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    edNombreEmpresa: TQRLabel;
    edNroEstablecimiento: TQRLabel;
    edCUITCUIP: TQRLabel;
    edSupEstab: TQRLabel;
    edCantidadTrabajadores: TQRLabel;
    edDescActividad: TQRLabel;
    edDomicilio: TQRLabel;
    edProvincia: TQRLabel;
    edCodigoPostal: TQRLabel;
    edCIIU: TQRLabel;
    edResAFIP: TQRLabel;
    edLocalidad: TQRLabel;
    edTelefono: TQRLabel;
    edCuitTitulo: TQRLabel;
    edNroEstableciTitulo: TQRLabel;
    sdqGremio: TSDQuery;
    sdqResponsable: TSDQuery;
    QRMemo4: TQRMemo;
    sdqContratista: TSDQuery;
    sdqObservaciones: TSDQuery;
    TitleBand2: TQRBand;
    qrlTituloA: TQRLabel;
    TitleBand3: TQRBand;
    qrlTituloC: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    PageHeaderBand2: TQRBand;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    PageHeaderBand3: TQRBand;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    edCuitTituloA: TQRLabel;
    edNroEstableciTituloA: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    edCuitTituloC: TQRLabel;
    edNroEstableciTituloC: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    edCuitTituloB: TQRLabel;
    edNroEstableciTituloB: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    PageFooterBand2: TQRBand;
    qrData: TQRSysData;
    lbCantPag: TQRLabel;
    QRShape5: TQRShape;
    QRLabel89: TQRLabel;
    PageFooterBand1: TQRBand;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel97: TQRLabel;
    QRShape3: TQRShape;
    QRLabel99: TQRLabel;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel100: TQRLabel;
    QRShape11: TQRShape;
    QRLabel101: TQRLabel;
    QRBand5: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel102: TQRLabel;
    QRShape17: TQRShape;
    QRLabel103: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel92: TQRLabel;
    qrLabelPRS: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    ChildBand1: TQRChildBand;
    qrlTituloB: TQRLabel;
    TitleBand4: TQRBand;
    QRLabel77: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel78: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel104: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape20: TQRShape;
    ChildBand5: TQRChildBand;
    QRImage1: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    ChildBand4: TQRChildBand;
    QRSysData5: TQRSysData;
    QRLabel54: TQRLabel;
    QRShape22: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel114: TQRLabel;
    QRShape27: TQRShape;
    QRShape60: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape2: TQRShape;
    lblaclaracionempresa: TQRLabel;
    lblaclaracionprofart: TQRLabel;
    lblconformeempresa: TQRLabel;
    lblfechavisita: TQRLabel;
    lblfirmaprofart: TQRLabel;
    lblhoravisita: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel57: TQRLabel;
    qrlbContratoEstableci4: TQRLabel;
    qrlbContratoEstableci3: TQRLabel;
    qrlbContratoEstableci2: TQRLabel;
    qrlbContratoEstableci: TQRLabel;
    procedure CompositeReportAddReports(Sender: TObject);
    procedure AntesDeImprimir(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrbDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure AntesDelDetalle(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure AntesDelTitulo(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DespuesDelTitulo(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure CambioDeHoja(Sender: TCustomQuickRep);
    procedure AntesDelColumnHeader(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure lbCantPagPrint(sender: TObject; var Value: String);
    procedure AgrandoLetra(sender: TObject; var Value: String);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure AjustarLineasVerticales(QRCustomBand: TQRCustomBand);
    procedure DeshabilitarItem(QRCustomBand: TQRCustomBand);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CompletoCuit(sender: TObject; var Value: String);
    procedure CompletoEstab(sender: TObject; var Value: String);
    procedure CompletoFormulario(sender: TObject; var Value: String);
    procedure PrintCheck(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabelNormativaPrint(sender: TObject; var Value: String);
    procedure PrintTipoForm(sender: TObject; var Value: String);
    procedure PrintHeader(sender: TObject; var Value: String);
    procedure PrintSIyNO(sender: TObject; var Value: String);
    procedure edCantidadTrabajadoresPrint(sender: TObject;
      var Value: String);
  private
    FAltura: Extended;
    FRegistroActual           : Integer;
    FCantRegistrosQueEntraban : Integer;
    FContrato                 : Integer;
    FEstableci                : Integer;
    FVigencia   : String;
    FPath       : String;
    FTitulos    : array[1..5] of String;
    FCuit       : String;
    procedure CambioDistanciaFormC;
  public
    procedure Load(Contrato, Establecimiento :Integer; Vigencia :  String; pPath : String = '');
    property Path : String read FPath write FPath;
  end;

const
  LOCK_ITEM_COLOR = $00CACACA;
  LOCK_VERTICAL_LINE_COLOR = $00BFBFBF;

var
  rptRes463Preventor: TrptRes463Preventor;

implementation

uses unVisualizador, unDmPrincipal, AnsiSql, Types, unRtti, Math, ArchFuncs;
{$R *.dfm}

procedure TrptRes463Preventor.Load(Contrato, Establecimiento :Integer; Vigencia :  String; pPath : String = '');
var
  i, j, k: integer;
  idEstableci : String;
begin
  for k:=0 to self.ControlCount-1 do
    if (self.Controls[k] is TQuickRep) then
      for j:=0 to (self.Controls[k] as TQuickRep).ControlCount-1 do
        if  ((self.Controls[k] as TQuickRep).Controls[j] is TQRBand) 
        and (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).BandType = rbPageHeader) then
          for i:=0 to ((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).ControlCount-1 do
            if ((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] is TQRImage then
            begin
              (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] as TQRImage).Width := 167;
              (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] as TQRImage).Height := 67;
              (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] as TQRImage).Left := 610;
              (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] as TQRImage).AutoSize := true;
              (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] as TQRImage).Stretch := false;
              (((self.Controls[k] as TQuickRep).Controls[j] as TQRBand).Controls[i] as TQRImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_RES');
            end;

  for i := 0 to ControlCount - 1 do
    if Controls[i].InheritsFrom(TQRLabel) then
      TQRLabel(Controls[i]).Transparent := True;

  qrlbContratoEstableci.Caption := IntToStr(Contrato)+' / '+ IntToStr(Establecimiento)+' RL';
  qrlbContratoEstableci2.Caption := qrlbContratoEstableci.Caption;
  qrlbContratoEstableci3.Caption := qrlbContratoEstableci.Caption;
  qrlbContratoEstableci4.Caption := qrlbContratoEstableci.Caption;
  FContrato := Contrato;
  FEstableci := Establecimiento;
  FVigencia := Vigencia;
  CambioDistanciaFormC;
  ArrayColSql(  ' SELECT DISTINCT UPPER (ra_titulo), UPPER (ra_descripcion), ra_nroformulario, UPPER(ra_header), rl_cantempleados ' +
                '            FROM hys.hil_itemsriesgolaboral, '+
                '                 hys.hia_itemanexo, '+
                '                 hys.hta_titulosanexo, '+
                '                 hys.hra_resolucionanexo, '+
                '                 hys.hrl_relevriesgolaboral '+
                '           WHERE ta_id = ia_idtituloanexo '+
                '             AND il_iditemanexo = ia_id '+
                '             AND ta_idresolucionanexo = ra_id '+
                '             AND il_idrelevriesgolaboral = rl_id '+
                '             AND rl_contrato = '+SqlValue(FContrato)+
                '             AND rl_estableci = '+SqlValue(FEstableci)+
                '             AND rl_vigencia = '+SqlValue(FVigencia)+
                '             AND rl_fechabaja IS NULL '+
                '             AND il_fechabaja IS NULL '+
                '             AND ia_fechabaja IS NULL '+
                '             AND ta_fechabaja IS NULL '+
                '             AND ra_fechabaja IS NULL ', FTitulos);

  with GetQuery(
    ' SELECT SUBSTR (ciiu.ac_relacion, 1, 6) ciuu, em_cuit, em_nombre, '+
    '         es_superficie, SUBSTR (actafip.ac_relacion, 1, 6) actafip, '+
    '         es_empleados, ciiu.ac_descripcion actividad, '+
    '            es_calle '+
    '         || '' '' '+
    '         || es_numero '+
    '         || NVL2 (es_piso, '' Piso '' || es_piso, '''') '+
    '         || NVL2 (es_departamento, '' Dpto. '' || es_departamento, '''') '+
    '         || NVL2 (es_cpostal, '' ('' || es_cpostal || '')'', '''') AS domicilio, '+
    '         DECODE (es_cpostala, ''99999999'', '''', es_cpostala) AS es_cpostala, '+
    '         es_telefonos, es_localidad, pv_descripcion '+
    '    FROM afi.aes_establecimiento, '+
    '         comunes.cac_actividad ciiu, '+
    '         comunes.cac_actividad actafip, '+
    '         afi.aem_empresa, '+
    '         art.cpv_provincias, aco_contrato '+
    '   WHERE ciiu.ac_id = es_idactividad '+
    '     AND es_contrato = '+SqlValue(FContrato)+
    '     AND es_nroestableci = '+SqlValue(FEstableci)+
    '     AND em_id = co_idempresa '+
    '     AND co_contrato = es_contrato '+
    '     AND co_idactividad = actafip.ac_id '+
    '     AND es_provincia = pv_codigo') do
  try
    edNombreEmpresa.Caption := FieldByName('em_nombre').AsString;

    FCuit := FieldByName('em_cuit').AsString;

    edCIIU.Caption := FieldByName('ciuu').AsString;
    edSupEstab.Caption := FieldByName('es_superficie').AsString;
    edResAFIP.Caption := FieldByName('actafip').AsString;
//    edCantidadTrabajadores.Caption := FieldByName('es_empleados').AsString;
    edDescActividad.Caption := FieldByName('actividad').AsString;
    edDomicilio.Caption := FieldByName('domicilio').AsString;
    edProvincia.Caption := FieldByName('pv_descripcion').AsString;
    edCodigoPostal.Caption := FieldByName('es_cpostala').AsString;
    edLocalidad.Caption := FieldByName('es_localidad').AsString;
    edTelefono.Caption := FieldByName('es_telefonos').AsString;
  finally
    Free;
  end;

  sdqEmpresa.ParamByName('contrato').AsInteger := FContrato;
  sdqEmpresa.ParamByName('estableci').AsInteger := FEstableci;
  sdqEmpresa.ParamByName('vigencia').AsString := FVigencia;
  sdqEmpresa.Open;
  sdqSustAgentesCan.ParamByName('contrato').AsInteger := FContrato;
  sdqSustAgentesCan.ParamByName('estableci').AsInteger := FEstableci;
  sdqSustAgentesCan.ParamByName('vigencia').AsString := FVigencia;
  sdqSustAgentesCan.Open;
  sdqDifenilos.ParamByName('contrato').AsInteger := FContrato;
  sdqDifenilos.ParamByName('estableci').AsInteger := FEstableci;
  sdqDifenilos.ParamByName('vigencia').AsString := FVigencia;
  sdqDifenilos.Open;
  sdqSustQuimicas.ParamByName('contrato').AsInteger := FContrato;
  sdqSustQuimicas.ParamByName('estableci').AsInteger := FEstableci;
  sdqSustQuimicas.ParamByName('vigencia').AsString := FVigencia;
  sdqSustQuimicas.Open;
  sdqObservaciones.ParamByName('contrato').AsInteger := FContrato;
  sdqObservaciones.ParamByName('estableci').AsInteger := FEstableci;
  sdqObservaciones.ParamByName('vigencia').AsString := FVigencia;
  sdqObservaciones.Open;
//  CompositeReport.Print;
  idEstableci := ValorSql(
    ' SELECT es_id '+
    '   FROM afi.aes_establecimiento '+
    '  WHERE es_contrato = '+ SqlValue(FContrato)+
    '    AND es_nroestableci = '+ SqlValue(FEstableci));
  CompositeReport.Prepare;

  if pPath = '' then
  begin
    Path := TempPath+IntToStr(FContrato)+'_'+idEstableci+'_'+FVigencia+'.qrp';
    CompositeReport.QRPrinter.Save(Path);
    CompositeReport.QRPrinter.Free;
  end
  else
  begin
    CompositeReport.QRPrinter.Title := pPath;
    CompositeReport.QRPrinter.Print;
    CompositeReport.QRPrinter.Free;
    CompositeReport.QRPrinter.Cleanup;
  end;




//  CompositeReport.QRPrinter.Save(Path);
//  Path := TempPath+IntToStr(FContrato)+'_'+idEstableci+'_'+FVigencia+'.qrp';
//  Visualizar(Path, GetValores('', ''), [oForceShowModal, oAlwaysShowdialog, oAutoFirma, oForceDB]);
//  CompositeReport.QRPrinter.Free;

  sdqEmpresa.Close;
  sdqSustAgentesCan.Close;
  sdqDifenilos.Close;
  sdqSustQuimicas.Close;
  sdqObservaciones.Close;
end;

procedure TrptRes463Preventor.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add(qrResolucion);
  CompositeReport.Reports.Add(qrPlanillaA);
  CompositeReport.Reports.Add(qrPlanillaB);
  CompositeReport.Reports.Add(qrPlanillaC);
  CompositeReport.Reports.Add(qrPieReporte);
//  CompositeReport.Reports.Add(qrBlanco);
//  CompositeReport.Reports.Add(qrObservacion);
end;

procedure TrptRes463Preventor.AntesDeImprimir(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FAltura := Sender.Page.Length - Sender.AbsoluteY;
  FRegistroActual := 0;
end;

procedure TrptRes463Preventor.CambioDistanciaFormC;
begin
(*
  qrFechaTituloC.Left         := -363;
  qrFechaTituloC2.Left        := -326;
  qrTituloNroEstableciC.Left  := -184;
  qrTituloNroEstableciC2.Left := -85;
  qrTituloCuitC.Left          := -355;
  qrTituloCUITC2.Left         := -286;
  qrTituloC.Left              := -203;
  qrTituloFormC.Left          := -107;
  qrTituloLogoC.Left          := 138;
  qrDataC.Left                := 318;
  qrDataA.Left                := 318;
  edCuitTituloC.Left          := -278;
  edNroEstableciTituloC.Left  := -77;
  edCuitTituloA.Left          := -278;
  edNroEstableciTituloA.Left  := -77;
*)
end;

procedure TrptRes463Preventor.qrbDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i, nAltura: integer;
begin
  Sender.Height := 13;
  if Canvas.TextWidth((Sender.Parent as TQuickRep).DataSet.FieldByName('ia_descripcion').AsString) > qrdbtDescripcion.Width * 1.35 then
    nAltura := Round(Sender.Height * 1.7) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
  else
    nAltura := Sender.Height;

  for i:=0 to Sender.ControlCount-1 do
    if (Sender.Controls[i] is TQRShape) and ((Sender.Controls[i] as TQRShape).Shape = qrsVertLine) then
    begin
      (Sender.Controls[i] as TQRShape).Height := nAltura;
      (Sender.Controls[i] as TQRShape).Pen.Color := LOCK_VERTICAL_LINE_COLOR;
    end;

  if ((Sender.Parent as TQuickRep).DataSet.FieldByName('editable').AsString = 'S') then
    Sender.Color := clWhite
  else
  begin
    //Sender.Color := LOCK_ITEM_COLOR;
    Sender.Height := nAltura;
  end;
end;

function pixel_to_millimeter(pix:integer):extended;
begin
  Result := pix * 2.9; //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
end;

procedure TrptRes463Preventor.AntesDelDetalle(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  nCantColumnas, nCantRegistros, nCantRegistrosQueEntran, nAlturaDetalle, nNroColumna: Integer;
begin
  nAlturaDetalle := Sender.ParentReport.Bands.DetailBand.Height;

  Inc(FRegistroActual);
  nCantColumnas := TQuickRep(Sender.ParentReport).Page.Columns;
  nCantRegistros := TQuickRep(Sender.ParentReport).DataSet.RecordCount;
  nNroColumna := TQuickRep(Sender.ParentReport).CurrentColumn;

  if TQuickRep(Sender.ParentReport).TitleBandPrintedOnActualPage then
  begin
    nCantRegistrosQueEntran := Floor((FAltura -
                                      TQuickRep(Sender.ParentReport).Page.BottomMargin - 150 -
                                      TQuickRep(Sender.ParentReport).Bands.ColumnHeaderBand.Height)
                                      /
                                      pixel_to_millimeter(nAlturaDetalle));
    FCantRegistrosQueEntraban := nCantRegistrosQueEntran;
  end else
    nCantRegistrosQueEntran := MAXINT;

  if  ((nCantRegistros < (nCantRegistrosQueEntran * nCantColumnas)) // Entra pero con multicolumnas... sino no!
    and(nCantRegistros > nCantRegistrosQueEntran)
    and(Ceil(nCantRegistros / nCantColumnas) * nNroColumna = FRegistroActual - 1)

  or  ((nCantRegistros > (nCantRegistrosQueEntran * nCantColumnas)) // No entra completo en esta página...
    and TQuickRep(Sender.ParentReport).TitleBandPrintedOnActualPage
    and (nCantRegistrosQueEntran = ((FRegistroActual - 1) div nNroColumna)))

  or  ((nCantRegistros > (FCantRegistrosQueEntraban * nCantColumnas)) // No entra completo en esta página... (hoja 2)
    and (not TQuickRep(Sender.ParentReport).TitleBandPrintedOnActualPage)
    and (Ceil(((nCantRegistros - TQuickRep(Sender.ParentReport).DataSet.RecNo {$IFNDEF VER150}- 1{$ENDIF} + FRegistroActual) / nCantColumnas)) * nNroColumna = FRegistroActual))

  or  ((nCantRegistros <= nCantRegistrosQueEntran) // Entra fácil, pero decido usar multicolumnas...
    and(Ceil(nCantRegistros / nCantColumnas) * nNroColumna = FRegistroActual - 1))) then
  begin
    Sender.ParentReport.NewColumn;
  end;

  AjustarLineasVerticales(Sender);
  DeshabilitarItem(Sender);
end;

procedure TrptRes463Preventor.AntesDelTitulo(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FAltura := Sender.ParentReport.Page.Length - Sender.ParentReport.AbsoluteY;

  if (FAltura / Sender.ParentReport.Page.Length) <= 0.15 then
    Sender.ParentReport.NewPage;

  FRegistroActual := 0;

  if TQuickRep(Sender.ParentReport).TitleBandPrintedOnActualPage then
    PrintBand := false;
end;

procedure TrptRes463Preventor.DespuesDelTitulo(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  FAltura := Sender.ParentReport.Page.Length - Sender.ParentReport.AbsoluteY;
  if Sender.ParentReport.TitleBandPrintedOnActualPage then
    FAltura := FAltura - Sender.ParentReport.Bands.TitleBand.Height;
end;

procedure TrptRes463Preventor.CambioDeHoja(Sender: TCustomQuickRep);
begin
  FRegistroActual := 0;
end;

procedure TrptRes463Preventor.AntesDelColumnHeader(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FAltura := Sender.ParentReport.Page.Length - Sender.ParentReport.AbsoluteY;
end;

procedure TrptRes463Preventor.lbCantPagPrint(sender: TObject; var Value: String);
begin
  if FTitulos[3] = '2' then
    Value := '/ '+IntToStr(5)
  else
    Value := '/ '+IntToStr(4);
end;

procedure TrptRes463Preventor.AgrandoLetra(sender: TObject; var Value: String);
begin
  if Length(Value) < 30 then
  begin
    (sender as TQRDBText).Font.Size := 5;
    (sender as TQRDBText).Top := Round(((sender as TQRDBText).Parent as TQRBand).Height / 2) - Round((sender as TQRDBText).Height / 2);
  end else
  begin
    (sender as TQRDBText).Font.Size := 4;
    (sender as TQRDBText).Top := 0;
  end;
end;

procedure TrptRes463Preventor.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlCUITCUIP.Enabled := true;
  edCuitTitulo.Enabled := true;
  qrlNroEstablecimiento.Enabled := true;
  edNroEstableciTitulo.Enabled := true;
end;

procedure TrptRes463Preventor.AjustarLineasVerticales(
  QRCustomBand: TQRCustomBand);
var
  nAltura: Integer;
  qrDBDesc: TQRDBText;
  i: integer;
begin
  if QRCustomBand.Name = 'qrbPlanillaA' then
    qrDBDesc := QRDBDescPlanillaA
  else if QRCustomBand.Name = 'qrbPlanillaB' then
    qrDBDesc := QRDBDescPlanillaB
  else
    qrDBDesc := QRDBDescPlanillaC;

  if Canvas.TextWidth((QRCustomBand.Parent as TQuickRep).DataSet.FieldByName('it_descripcion').AsString) > qrDBDesc.Width * 1.2 then
    nAltura := Round(QRCustomBand.Height * 3.65) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
  else
    nAltura := QRCustomBand.Height;

  for i:=0 to QRCustomBand.ControlCount-1 do
    if (QRCustomBand.Controls[i] is TQRShape) and ((QRCustomBand.Controls[i] as TQRShape).Shape = qrsVertLine) then
    begin
      (QRCustomBand.Controls[i] as TQRShape).Height := nAltura;
      (QRCustomBand.Controls[i] as TQRShape).Pen.Color := LOCK_VERTICAL_LINE_COLOR;
    end;
end;

procedure TrptRes463Preventor.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Sender.ParentReport.NewPage;
end;

procedure TrptRes463Preventor.CompletoCuit(sender: TObject;
  var Value: String);
begin
  Value := FCuit;
end;

procedure TrptRes463Preventor.CompletoEstab(sender: TObject;
  var Value: String);
begin
  Value := IntToStr(FEstableci);
end;

procedure TrptRes463Preventor.CompletoFormulario(sender: TObject;
  var Value: String);
begin
  Value := FTitulos[1];
end;

procedure TrptRes463Preventor.PrintCheck(sender: TObject; var Value: String);
var
  nAltura: Integer;
begin
  if qrResolucion.DataSet.FieldByName('editable').AsString = 'S' then
    Value := '';

  if Canvas.TextWidth((TQRBand(TQRDBText(Sender).Parent).Parent as TQuickRep).DataSet.FieldByName('ia_descripcion').AsString) > qrdbtDescripcion.Width * 1.33 then
    nAltura := Round(TQRBand(TQRDBText(Sender).Parent).Height * 1.20 / 2) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
  else
    nAltura := TQRBand(TQRDBText(Sender).Parent).Height;

  if qrResolucion.DataSet.FieldByName('editable').AsString <> 'S' then
    TQRBand(TQRDBText(Sender)).Parent.Height := nAltura;
end;

procedure TrptRes463Preventor.DeshabilitarItem(QRCustomBand: TQRCustomBand);
var
  qrDBDesc: TQRDBText;
  nAltura: Integer;
begin
  QRCustomBand.Height := 14;

  if QRCustomBand.Name = 'qrbPlanillaA' then
    qrDBDesc := QRDBDescPlanillaA
  else if QRCustomBand.Name = 'qrbPlanillaB' then
    qrDBDesc := QRDBDescPlanillaB
  else
    qrDBDesc := QRDBDescPlanillaC;

  if Canvas.TextWidth((QRCustomBand.Parent as TQuickRep).DataSet.FieldByName('it_descripcion').AsString) > qrDBDesc.Width * 1.2 then
    nAltura := Round(QRCustomBand.Height * 3.65) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
  else
    nAltura := QRCustomBand.Height;

  if (not TQuickRep(QRCustomBand.ParentReport).DataSet.FieldByName('cump_si').IsNull) or
     (not TQuickRep(QRCustomBand.ParentReport).DataSet.FieldByName('cump_no').IsNull) then
  begin
    //QRCustomBand.Color := LOCK_ITEM_COLOR;
    QRCustomBand.Height := nAltura;
  end
  else
    QRCustomBand.Color := clWhite;
end;

procedure TrptRes463Preventor.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  nAltura: Integer;
  i: integer;
begin
//  if Canvas.TextWidth((Sender.Parent as TQuickRep).DataSet.FieldByName('ob_descripcion').AsString) > QRDBDescObs.Width * 1.2 then
//    nAltura := Round(Sender.Height * 1.7) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
//  else
    nAltura := Sender.Height;

  for i:=0 to Sender.ControlCount-1 do
    if (Sender.Controls[i] is TQRShape) and ((Sender.Controls[i] as TQRShape).Shape = qrsVertLine) then
    begin
      (Sender.Controls[i] as TQRShape).Height := nAltura;
      (Sender.Controls[i] as TQRShape).Pen.Color := LOCK_VERTICAL_LINE_COLOR;
    end;
end;

procedure TrptRes463Preventor.QRLabelNormativaPrint(sender: TObject;
  var Value: String);
begin
  Value := ' ('  + FTitulos[2] + ')';
end;

procedure TrptRes463Preventor.PrintTipoForm(sender: TObject;
  var Value: String);
begin
  Value := 'PV-01-F00' + FTitulos[3];
end;

procedure TrptRes463Preventor.PrintHeader(sender: TObject;
  var Value: String);
begin
  Value := FTitulos[4] + ': CONDICIONES A CUMPLIR';
end;

procedure TrptRes463Preventor.PrintSIyNO(sender: TObject;
  var Value: String);
var
  nAltura: Integer;
  qrDBDesc: TQRDBText;
begin
  if TQRBand(TQRDBText(Sender).Parent).Name = 'qrbPlanillaA' then
    qrDBDesc := QRDBDescPlanillaA
  else if TQRBand(TQRDBText(Sender).Parent).Name = 'qrbPlanillaB' then
    qrDBDesc := QRDBDescPlanillaB
  else
    qrDBDesc := QRDBDescPlanillaC;

  if Canvas.TextWidth((TQRBand(TQRDBText(Sender).Parent).Parent as TQuickRep).DataSet.FieldByName('it_descripcion').AsString) > qrDBDesc.Width * 1.2 then
    nAltura := Round(TQRBand(TQRDBText(Sender).Parent).Height * 0.2) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
  else
    nAltura := TQRBand(TQRDBText(Sender).Parent).Height;

  if (not TQuickRep(TQRBand(TQRDBText(Sender).Parent).ParentReport).DataSet.FieldByName('cump_si').IsNull) or
     (not TQuickRep(TQRBand(TQRDBText(Sender).Parent).ParentReport).DataSet.FieldByName('cump_no').IsNull) then
    TQRBand(TQRDBText(Sender)).Parent.Height := nAltura;
end;

procedure TrptRes463Preventor.edCantidadTrabajadoresPrint(sender: TObject;
  var Value: String);
begin
  Value := FTitulos[5];
end;

end.
