unit unRptResolucion463;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, QRPrntr;

type
  TrptResolucion463 = class(TForm)
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
    QRDBArticulos: TQRDBText;
    QRBand2: TQRBand;
    lbAnexo: TQRLabel;
    qrlCUITCUIP: TQRLabel;
    qrlNroEstablecimiento: TQRLabel;
    logo: TQRImage;
    QRLabel30: TQRLabel;
    qrTituloForm: TQRLabel;
    QRLabel32: TQRLabel;
    qrFechaFormulario: TQRLabel;
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
    qrmEncabezado: TQRMemo;
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
    qrObservacion: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText14: TQRDBText;
    QRDBDescObs: TQRDBText;
    QRShape63: TQRShape;
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
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel96: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel92: TQRLabel;
    qrLabelNormativaVig: TQRLabel;
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
    QRBand3: TQRBand;
    qrLogoObservacion: TQRImage;
    QRLabel31: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    qrTituloObservacion1: TQRLabel;
    qrTituloObservacion: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel70: TQRLabel;
    edCuitObservacion: TQRLabel;
    edNroEstableciObservacion: TQRLabel;
    ChildBand5: TQRChildBand;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape2: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape28: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel40: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRShape6: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel44: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel45: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    s: TQRShape;
    QRLabel50: TQRLabel;
    QRShape59: TQRShape;
    QRLabel51: TQRLabel;
    edLegajoGremio1: TQRLabel;
    edNombreGremio1: TQRLabel;
    edCuitContratista1: TQRLabel;
    edLegajoGremio2: TQRLabel;
    edNombreGremio2: TQRLabel;
    edCuitContratista2: TQRLabel;
    edLegajoGremio3: TQRLabel;
    edNombreGremio3: TQRLabel;
    edCuitContratista3: TQRLabel;
    edCuitResponsable2: TQRLabel;
    edCuitResponsable3: TQRLabel;
    edNombreyApellidoResp3: TQRLabel;
    edNombreyApellidoResp2: TQRLabel;
    edNombreyApellidoResp1: TQRLabel;
    edCargoResp2: TQRLabel;
    edCargoResp1: TQRLabel;
    edCargoResp3: TQRLabel;
    edRepresentacionResp2: TQRLabel;
    edRepresentacionResp1: TQRLabel;
    edRepresentacionResp3: TQRLabel;
    edPropioContratadoResp3: TQRLabel;
    edPropioContratadoResp2: TQRLabel;
    edPropioContratadoResp1: TQRLabel;
    edTituloHabitanteResp1: TQRLabel;
    edTituloHabitanteResp2: TQRLabel;
    edTituloHabitanteResp3: TQRLabel;
    edNroMatriculaResp1: TQRLabel;
    edNroMatriculaResp2: TQRLabel;
    edNroMatriculaResp3: TQRLabel;
    edEntidadOtorgaResp3: TQRLabel;
    edEntidadOtorgaResp2: TQRLabel;
    edEntidadOtorgaResp1: TQRLabel;
    QRShape62: TQRShape;
    QRLabel39: TQRLabel;
    QRImage1: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    edCuitResponsable1: TQRLabel;
    ChildBand4: TQRChildBand;
    QRSysData5: TQRSysData;
    QRLabel54: TQRLabel;
    QRShape22: TQRShape;
    QRLabel56: TQRLabel;
    ChildBand6: TQRChildBand;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabelNormativa: TQRLabel;
    qrResponsable: TQRLabel;
    qrResponsableHyS: TQRLabel;
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
    FTitulos    : array[1..6] of String;
    FCuit       : String;
    procedure CambioDistanciaFormC;
    procedure CargaGremio;
    procedure CargaResponsable;
    procedure CargaContratista;
  public
    procedure Load(Contrato, Establecimiento :Integer; Vigencia :  String);
    property Path : String read FPath write FPath;
  end;

const
  LOCK_ITEM_COLOR = $00CACACA;
  LOCK_VERTICAL_LINE_COLOR = $00BFBFBF;  

var
  rptResolucion463: TrptResolucion463;

implementation

uses
  unDmPrincipal, AnsiSql, Types, unRtti, Math, ArchFuncs;
{$R *.dfm}

procedure TrptResolucion463.Load(Contrato, Establecimiento :Integer; Vigencia :  String);
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

  FContrato := Contrato;
  FEstableci := Establecimiento;
  FVigencia := Vigencia;

  CambioDistanciaFormC;
  CargaGremio;
  CargaContratista;
  CargaResponsable;

  ArrayColSql(  ' SELECT DISTINCT UPPER (ra_titulo), UPPER (ra_descripcion), ra_nroformulario, UPPER(ra_header), rl_cargainvalido, rl_cantempleados ' +
                '            FROM hys.hil_itemsriesgolaboral, '+
                '                 hys.hia_itemanexo, '+
                '                 hys.hta_titulosanexo, '+
                '                 hys.hra_resolucionanexo, '+
                '                 hys.hrl_relevriesgolaboral '+
                '           WHERE ta_id(+) = ia_idtituloanexo '+
                '             AND il_iditemanexo = ia_id(+) '+
                '             AND ta_idresolucionanexo = ra_id(+) '+
                '             AND il_idrelevriesgolaboral(+) = rl_id '+
                '             AND rl_contrato = '+SqlValue(FContrato)+
                '             AND rl_estableci = '+SqlValue(FEstableci)+
                '             AND rl_vigencia = '+SqlValue(FVigencia)+
                '             AND rl_fechabaja IS NULL '+
                '             AND il_fechabaja(+) IS NULL '+
                '             AND ia_fechabaja(+) IS NULL '+
                '             AND ta_fechabaja(+) IS NULL '+
                '             AND ra_fechabaja(+) IS NULL ', FTitulos);

  with GetQuery(
    ' SELECT SUBSTR (art.hys.get_codactividadrevdos(ciiu.ac_id, ciiu.ac_revision), 1, 6) ciuu, em_cuit, em_nombre, '+
    '         es_superficie, SUBSTR (art.hys.get_codactividadrevdos(actafip.ac_id, actafip.ac_revision), 1, 6) actafip, '+
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
  //Carga fecha de formulario
  qrFechaformulario.Caption := ValorSql('SELECT rl_fechaformulario '+
                                        '  FROM hys.hrl_relevriesgolaboral '+
                                        ' WHERE rl_contrato = '+SqlValue(FContrato)+
                                        '   AND rl_estableci = '+SqlValue(FEstableci)+
                                        '   AND rl_vigencia = '+SqlValue(FVigencia)+
                                        '   AND rl_fechabaja IS NULL '+
                                        '   AND rl_procedencia = ''E'' ');
  //Carga Firma responsable

  qrResponsable.Caption := ValorSql(
    ' SELECT rr_cuitcuil || NVL2(rr_nombre,'' - ''||rr_nombre,'''') ||NVL2(rs_descripcion,'' - ''|| rs_descripcion,'''') responsable '+
    '   FROM hys.hrr_responsablerelev, hys.hrs_relevrepresentacion '+
    '  WHERE rr_idrelevriesgolaboral = ( SELECT rl_id '+
    '                                      FROM hys.hrl_relevriesgolaboral '+
    '                                     WHERE rl_contrato = '+SqlValue(FContrato)+
    '                                       AND rl_estableci = '+SqlValue(FEstableci)+
    '                                       AND rl_vigencia = '+SqlValue(FVigencia)+
    '                                       AND rl_fechabaja IS NULL '+
    '                                       AND rl_procedencia = ''E'' )'+
    '    AND rr_responsableform = ''S'' '+
    '    AND rr_idrepresentacion = rs_id(+) '+
    '    AND rs_id(+) <> 7 ');

  qrResponsableHyS.Caption := ValorSql(
     ' SELECT rr_cuitcuil || NVL2(rr_nombre,'' - ''||rr_nombre,'''') ||NVL2(rs_descripcion,'' - ''|| rs_descripcion,'''') responsable '+
    '   FROM hys.hrr_responsablerelev, hys.hrs_relevrepresentacion '+
    '  WHERE rr_idrelevriesgolaboral = ( SELECT rl_id '+
    '                                      FROM hys.hrl_relevriesgolaboral '+
    '                                     WHERE rl_contrato = '+SqlValue(FContrato)+
    '                                       AND rl_estableci = '+SqlValue(FEstableci)+
    '                                       AND rl_vigencia = '+SqlValue(FVigencia)+
    '                                       AND rl_fechabaja IS NULL '+
    '                                       AND rl_procedencia = ''E'' )'+
    '    AND rr_cargo = ''H'' '+
    '    AND rr_idrepresentacion = rs_id(+) '+
    '    AND rs_id(+) <> 7 '+
    '    AND rr_fechabaja IS NULL '+
    '    AND ROWNUM = 1 ');



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

  Path := TempPath+IntToStr(FContrato)+'_'+idEstableci+'_'+FVigencia+'.qrp';
  CompositeReport.QRPrinter.Save(Path);

  CompositeReport.QRPrinter.Free;

  sdqEmpresa.Close;
  sdqSustAgentesCan.Close;
  sdqDifenilos.Close;
  sdqSustQuimicas.Close;
  sdqObservaciones.Close;
end;

procedure TrptResolucion463.CompositeReportAddReports(Sender: TObject);
begin
  //Es porque no se cargo como invalido (carga suprimida)
  if FTitulos[5]= 'N' then
  begin
    CompositeReport.Reports.Add(qrResolucion);
    CompositeReport.Reports.Add(qrPlanillaA);
    CompositeReport.Reports.Add(qrPlanillaB);
    CompositeReport.Reports.Add(qrPlanillaC);
    CompositeReport.Reports.Add(qrPieReporte);
  end;
//  CompositeReport.Reports.Add(qrBlanco);
  CompositeReport.Reports.Add(qrObservacion);
end;

procedure TrptResolucion463.AntesDeImprimir(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FAltura := Sender.Page.Length - Sender.AbsoluteY;
  FRegistroActual := 0;
end;

procedure TrptResolucion463.CambioDistanciaFormC;
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

procedure TrptResolucion463.CargaGremio;
var
  visitas : Integer;
begin
  sdqGremio.ParamByName('contrato').AsInteger := FContrato;
  sdqGremio.ParamByName('estableci').AsInteger := FEstableci;
  sdqGremio.ParamByName('vigencia').AsString := FVigencia;
  sdqGremio.Open;
  sdqGremio.First;
  visitas := 0;
  while not sdqGremio.Eof and (sdqGremio.RecNo {$IFNDEF VER150}- 1{$ENDIF} < 3) do
  begin
    TQRLabel(Self.FindComponent('edLegajoGremio'+
             IntToStr(sdqGremio.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqGremio.FieldByName('rg_nrolegajo').AsString;
    TQRLabel(Self.FindComponent('edNombreGremio'+
             IntToStr(sdqGremio.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqGremio.FieldByName('rg_nombregremio').AsString;
    sdqGremio.Next;
    visitas := visitas+1;
  end;
  while visitas < 3 do
  begin
    TQRLabel(Self.FindComponent('edLegajoGremio'+
             IntToStr(visitas+1))).Caption := '';
    TQRLabel(Self.FindComponent('edNombreGremio'+
             IntToStr(visitas+1))).Caption := '';
    visitas := visitas+1;
  end;
  sdqGremio.Close;
end;

procedure TrptResolucion463.CargaResponsable;
var
  visitas : Integer;
begin
  sdqResponsable.ParamByName('contrato').AsInteger := FContrato;
  sdqResponsable.ParamByName('estableci').AsInteger := FEstableci;
  sdqResponsable.ParamByName('vigencia').AsString := FVigencia;
  sdqResponsable.Open;
  sdqResponsable.First;
  visitas := 0;
  while not sdqResponsable.Eof and (sdqResponsable.RecNo {$IFNDEF VER150}- 1{$ENDIF} < 3) do
  begin
    TQRLabel(Self.FindComponent('edCuitResponsable'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_cuitcuil').AsString;
    TQRLabel(Self.FindComponent('edNombreyApellidoResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_nombre').AsString;
    TQRLabel(Self.FindComponent('edCargoResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_cargo').AsString;
    TQRLabel(Self.FindComponent('edRepresentacionResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rs_descripcion').AsString;
    TQRLabel(Self.FindComponent('edPropioContratadoResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_relacion').AsString;
    TQRLabel(Self.FindComponent('edTituloHabitanteResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_titulo').AsString;
    TQRLabel(Self.FindComponent('edNroMatriculaResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_matricula').AsString;
    TQRLabel(Self.FindComponent('edEntidadOtorgaResp'+
             IntToStr(sdqResponsable.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqResponsable.FieldByName('rr_entidad').AsString;
    sdqResponsable.Next;
    visitas := visitas+1;
  end;
  while visitas < 3 do
  begin
    TQRLabel(Self.FindComponent('edCuitResponsable'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edNombreyApellidoResp'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edCargoResp'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edRepresentacionResp'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edPropioContratadoResp'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edTituloHabitanteResp'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edNroMatriculaResp'+
             IntToStr(visitas+1))).Caption :=  '';
    TQRLabel(Self.FindComponent('edEntidadOtorgaResp'+
             IntToStr(visitas+1))).Caption :=  '';
    visitas := visitas+1;
  end;
  sdqResponsable.Close;
end;

procedure TrptResolucion463.CargaContratista;
var
  visitas : Integer;
begin
  sdqContratista.ParamByName('contrato').AsInteger := FContrato;
  sdqContratista.ParamByName('estableci').AsInteger := FEstableci;
  sdqContratista.ParamByName('vigencia').AsString := FVigencia;
  sdqContratista.Open;
  sdqContratista.First;
  visitas := 0;
  while not sdqContratista.Eof and (sdqContratista.RecNo {$IFNDEF VER150}- 1{$ENDIF} < 3) do
  begin
    TQRLabel(Self.FindComponent('edCuitContratista'+
             IntToStr(sdqContratista.RecNo{$IFDEF VER150}+ 1{$ENDIF}))).Caption :=
             sdqContratista.FieldByName('RC_CUIT').AsString;
    sdqContratista.Next;
    visitas := visitas+1;
  end;
  while visitas < 3 do
  begin
    TQRLabel(Self.FindComponent('edCuitContratista'+
             IntToStr(visitas+1))).Caption :=  '';
    visitas := visitas+1;
  end;
  sdqContratista.Close;
end;

procedure TrptResolucion463.qrbDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
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
    Sender.Color := LOCK_ITEM_COLOR;
    Sender.Height := nAltura;
  end;
end;

function pixel_to_millimeter(pix:integer):extended;
begin
  Result := pix * 2.9; //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
end;

procedure TrptResolucion463.AntesDelDetalle(Sender: TQRCustomBand; var PrintBand: Boolean);
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

procedure TrptResolucion463.AntesDelTitulo(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FAltura := Sender.ParentReport.Page.Length - Sender.ParentReport.AbsoluteY;

  if (FAltura / Sender.ParentReport.Page.Length) <= 0.15 then
    Sender.ParentReport.NewPage;

  FRegistroActual := 0;

  if TQuickRep(Sender.ParentReport).TitleBandPrintedOnActualPage then
    PrintBand := false;
end;

procedure TrptResolucion463.DespuesDelTitulo(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  FAltura := Sender.ParentReport.Page.Length - Sender.ParentReport.AbsoluteY;
  if Sender.ParentReport.TitleBandPrintedOnActualPage then
    FAltura := FAltura - Sender.ParentReport.Bands.TitleBand.Height;
end;

procedure TrptResolucion463.CambioDeHoja(Sender: TCustomQuickRep);
begin
  FRegistroActual := 0;
end;

procedure TrptResolucion463.AntesDelColumnHeader(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FAltura := Sender.ParentReport.Page.Length - Sender.ParentReport.AbsoluteY;
end;

procedure TrptResolucion463.lbCantPagPrint(sender: TObject; var Value: String);
begin
  if FTitulos[3] = '2' then
    Value := '/ '+IntToStr(5)
  else
    Value := '/ '+IntToStr(4);
end;

procedure TrptResolucion463.AgrandoLetra(sender: TObject; var Value: String);
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

procedure TrptResolucion463.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlCUITCUIP.Enabled := true;
  edCuitTitulo.Enabled := true;
  qrlNroEstablecimiento.Enabled := true;
  edNroEstableciTitulo.Enabled := true;
end;

procedure TrptResolucion463.AjustarLineasVerticales(
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

procedure TrptResolucion463.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Sender.ParentReport.NewPage;
end;

procedure TrptResolucion463.CompletoCuit(sender: TObject;
  var Value: String);
begin
  Value := FCuit;
end;

procedure TrptResolucion463.CompletoEstab(sender: TObject;
  var Value: String);
begin
  Value := IntToStr(FEstableci);
end;

procedure TrptResolucion463.CompletoFormulario(sender: TObject;
  var Value: String);
begin
  Value := FTitulos[1];
end;

procedure TrptResolucion463.PrintCheck(sender: TObject; var Value: String);
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

procedure TrptResolucion463.DeshabilitarItem(QRCustomBand: TQRCustomBand);
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
    QRCustomBand.Color := LOCK_ITEM_COLOR;
    QRCustomBand.Height := nAltura;
  end
  else
    QRCustomBand.Color := clWhite;
end;

procedure TrptResolucion463.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  nAltura: Integer;
  i: integer;
begin
  if Canvas.TextWidth((Sender.Parent as TQuickRep).DataSet.FieldByName('ob_descripcion').AsString) > QRDBDescObs.Width * 1.2 then
    nAltura := Round(Sender.Height * 1.7) //Ojo, esta constante está basada en el núcleo de plutonio de los melmaquianos... NO TOCAR!
  else
    nAltura := Sender.Height;

  for i:=0 to Sender.ControlCount-1 do
    if (Sender.Controls[i] is TQRShape) and ((Sender.Controls[i] as TQRShape).Shape = qrsVertLine) then
    begin
      (Sender.Controls[i] as TQRShape).Height := nAltura;
      (Sender.Controls[i] as TQRShape).Pen.Color := LOCK_VERTICAL_LINE_COLOR;
    end;
end;

procedure TrptResolucion463.QRLabelNormativaPrint(sender: TObject;
  var Value: String);
begin
  Value := ' ('  + FTitulos[2] + ')';
end;

procedure TrptResolucion463.PrintTipoForm(sender: TObject;
  var Value: String);
begin
  Value := 'PV-01-F00' + FTitulos[3];
end;

procedure TrptResolucion463.PrintHeader(sender: TObject;
  var Value: String);
begin
  Value := FTitulos[4] + ': CONDICIONES A CUMPLIR';
end;

procedure TrptResolucion463.PrintSIyNO(sender: TObject;
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

procedure TrptResolucion463.edCantidadTrabajadoresPrint(sender: TObject;
  var Value: String);
begin
  Value := FTitulos[6];
end;

end.
