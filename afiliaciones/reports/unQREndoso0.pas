unit unQREndoso0;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, unQRLabelEx,
  Db, SDEngine, unQrEndosoBase, unArt, unDmPrincipal;

type
  TqrEndoso0 = class(TqrEndosoBase)
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrlLugarFecha: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRNombreFirmante: TQRDBText;
    QRCaracterFirmante: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrNroEndoso: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    qrCUIT: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabelEx2: TQRLabelEx;
    QRLabelEx3: TQRLabelEx;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabelEx4: TQRLabelEx;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrLeyenda: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape11: TQRShape;
    qrVigenciaEndoso: TQRLabelEx;
    QRShape14: TQRShape;
    qriLogoNom: TQRImage;
    qrMotivo: TQRLabel;
    lbActividad2: TQRLabel;
    dbtActividad2: TQRDBText;
    lbActividad3: TQRLabel;
    dbtActividad3: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText24: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape19: TQRShape;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    procedure qrlLugarFechaPrint(Sender: TObject; var Value: String);
    procedure qrCUITPrint(Sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrMotivoPrint(Sender: TObject; var Value: String);
  private
    procedure DoImpresionCarta(const aIdCarta: TTableId; const aTransactionMode: TTransactionMode);
    procedure SetMostrarOtrosCIIU(const aValue: Boolean);
    procedure SetMotivoEndoso(const aValue: String);
  protected
    FMostrarOtrosCIIU: Boolean;
    FMotivoEndoso: String;

    function GetSql: String; override;

    procedure CargarControles; override;
  public
    procedure PrepararImpresion(const aCartaId: Integer; const aTransactionMode: TTransactionMode;
                                const aImprimir: Boolean = False; const aCantCopias: Integer = 1;
                                const aPdfFileName: String = ''; const aMostrarEspera: boolean = True);

    property ImprimeMembrete;
    property MostrarOtrosCIIU: Boolean read FMostrarOtrosCIIU write SetMostrarOtrosCIIU;
    property MotivoEndoso: String read FMotivoEndoso write SetMotivoEndoso;
  end;

var
  qrEndoso0: TqrEndoso0;

implementation

{$R *.DFM}

uses
  General, AnsiSql, unPrincipal, SqlFuncs;

const
  SQLENDOSO: String =
    'SELECT en_id, en_fechaalta, en_vigenciaendoso vig_endoso, en_endoso nro_endoso, en_movimiento,' +
          ' hc_contrato contrato, hc_vigenciadesde vig_desde, hc_vigenciahasta vig_hasta, ac.ac_codigo cod_actividad,' +
          ' ac.ac_descripcion actividad, hc_nivel nivel, hm_nombre nombre, hm_cuit cuit, domp.hd_calle hd_calle_p,' +
          ' domp.hd_numero hd_numero_p, domp.hd_piso hd_piso_p, domp.hd_departamento hd_departamento_p,' +
          ' domp.hd_cpostal hd_cpostal_p, domp.hd_cpostala hd_cpostala_p, domp.hd_localidad hd_localidad_p,' +
          ' cpvp.pv_descripcion provincia_p, doml.hd_calle hd_calle, doml.hd_numero hd_numero, doml.hd_piso hd_piso,' +
          ' doml.hd_departamento hd_departamento, doml.hd_cpostal hd_cpostal, doml.hd_cpostala hd_cpostala,' +
          ' doml.hd_localidad hd_localidad, cpvl.pv_descripcion provincia_l, fi_firmante nombre_firmante,' +
          ' fi_caracter caracter_firmante, fi_firma firma, fjuri.tb_descripcion formajuridica,' +
          ' ''Motivo: '' || moten.tb_descripcion motivo_endoso,' +
          ' ac2.ac_codigo || '' - '' || +ac2.ac_descripcion actividad2,' +
          ' ac3.ac_codigo || '' - '' || +ac3.ac_descripcion actividad3' +
     ' FROM aen_endoso, ahc_historicocontrato, cac_actividad ac, cac_actividad ac2, cac_actividad ac3,' +
          ' ahm_historicoempresa, cfi_firma, ctb_tablas fir, ctb_tablas fjuri, ahd_historicodomicilio domp,' +
          ' ahd_historicodomicilio doml, cpv_provincias cpvl, cpv_provincias cpvp, ctb_tablas moten' +
    ' WHERE en_idhistoricocontrato = hc_id' +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND domp.hd_id = en_idhistoricodomiciliopostal' +
      ' AND cpvp.pv_codigo(+) = domp.hd_provincia' +
      ' AND doml.hd_id = en_idhistoricodomicilio' +
      ' AND cpvl.pv_codigo(+) = doml.hd_provincia' +
      ' AND hc_idactividad = ac.ac_id' +
      ' AND hc_idactividad2 = ac2.ac_id(+)' +
      ' AND hc_idactividad3 = ac3.ac_id(+)' +
      ' AND fjuri.tb_clave(+) = ''FJURI''' +
      ' AND fjuri.tb_codigo(+) = hm_formaj' +
      ' AND moten.tb_clave(+) = ''MOTEN''' +
      ' AND moten.tb_codigo(+) = en_motivo' +
      ' AND fir.tb_clave = ''FI_RE''' +
      ' AND fir.tb_codigo = ''2''' +
      ' AND fi_id = fir.tb_especial1';

procedure TqrEndoso0.qrlLugarFechaPrint(Sender: TObject; var Value: String);
begin
  Value := FormatDateTime('"Buenos Aires, "d "de" mmmm "de" yyyy', sdqQuery.FieldByName('en_fechaalta').AsDateTime);
end;

procedure TqrEndoso0.qrCUITPrint(Sender: TObject; var Value: String);
begin
  Value := Copy(Value, 1, 2) + '-' + Copy(Value, 3, 8) + '-' + Copy(Value, 11, 1);
end;

function TqrEndoso0.GetSql: String;
begin
  Result := SQLENDOSO;
end;

procedure TqrEndoso0.CargarControles;
begin
  inherited;
  
  qrVigenciaEndoso.Caption := FormatDateTime('" Fecha de inicio de vigencia del endoso: "d "de" mmmm "de" yyyy    ',
                              sdqQuery.FieldByName('vig_endoso').AsDateTime);
  if Formato = 0 then
    qrLeyenda.Caption := ''; //Esto equivale a ocultarlo...

  lbActividad2.Enabled := (Trim(sdqQuery.FieldByName('actividad2').AsString) <> '-') and (FMostrarOtrosCIIU);
  dbtActividad2.Enabled := lbActividad2.Enabled;

  lbActividad3.Enabled := (Trim(sdqQuery.FieldByName('actividad3').AsString) <> '-') and (FMostrarOtrosCIIU);
  dbtActividad3.Enabled := lbActividad3.Enabled;
end;

procedure TqrEndoso0.PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  qriLogoNom.Enabled := ImprimeMembrete;
end;

procedure TqrEndoso0.qrMotivoPrint(Sender: TObject; var Value: String);
var
  sSql: String;
begin
  if FMotivoEndoso <> '' then
  begin
    Value := FMotivoEndoso;
    Exit;
  end;

  sSql :=
    'SELECT 1' +
     ' FROM aen_endoso, ctb_tablas' +
    ' WHERE en_contrato = :contrato' +
      ' AND en_motivo = tb_codigo' +
      ' AND tb_clave = ''MOTEN''' +
      ' AND tb_especial1 = ''1''' +
      ' AND en_endoso = :endoso';

  if ExisteSqlEx(sSql, [sdqQuery.FieldByName('contrato').AsInteger, sdqQuery.FieldByName('nro_endoso').AsInteger]) then
    Value := 'Motivo: Cambio de Tarifa'
  else
    Value := sdqQuery.FieldByName('motivo_endoso').AsString;
end;

procedure TqrEndoso0.SetMotivoEndoso(const aValue: String);
begin
  FMotivoEndoso := aValue;
end;

procedure TqrEndoso0.SetMostrarOtrosCIIU(const aValue: Boolean);
begin
  FMostrarOtrosCIIU := aValue;
end;

procedure TqrEndoso0.PrepararImpresion(const aCartaId: Integer; const aTransactionMode: TTransactionMode;
                                       const aImprimir: Boolean = False; const aCantCopias: Integer = 1;
                                       const aPdfFileName: String = ''; const aMostrarEspera: boolean = True);
begin
  FMostrarOtrosCIIU := True;
  FMotivoEndoso := '';

  try
    qriLogoNom.Picture.Bitmap.LoadFromResourceName(hInstance, RES_EMP_LOGO_BN);
  except
    // Si da error no lo imprimo, en algún momento hay que revisar porque da el error, ahora no tengo tiempo..
  end;

  Preparar(aCantCopias, aImprimir, aPdfFileName, aMostrarEspera);
  DoImpresionCarta(aCartaid, aTransactionMode);
end;

procedure TqrEndoso0.DoImpresionCarta(const aIdCarta: TTableId; const aTransactionMode: TTransactionMode);
begin
  if aIdCarta < 1 then
    Exit;

  with TSql.Create('cca_carta') do
  try
    PrimaryKey.Add('ca_id',                     aIdCarta);
    Fields.AddExpression('ca_usuimpresion',     'NVL(ca_usuimpresion, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ')');
    Fields.AddExpression('ca_fechaimpresion',   'NVL(ca_fechaimpresion, SYSDATE)');
    Fields.AddExpression('ca_usureimpresion',   'DECODE(ca_usuimpresion, NULL, NULL, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ')');
    Fields.AddExpression('ca_fechareimpresion', 'DECODE(ca_usuimpresion, NULL, NULL, SYSDATE)');
    SqlType := stUpdate;

    EjecutarSqlST(Sql, aTransactionMode);
  finally
    Free;
  end;
end;


end.
