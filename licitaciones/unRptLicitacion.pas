unit unRptLicitacion;

interface

uses
	Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptLicitacion = class(TQuickRep)
    bDetalle: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lbNumeroLicitacion: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    dbtNumeroLicitacion: TQRDBText;
    sdqDatos: TSDQuery;
    lbCuit: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    bPrincipalNOPresentacion: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    lbPrincipalNOPresentacionCostoPliego: TQRLabel;
    bPrincipalPresentacion: TQRChildBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    lbComisionTitulo: TQRLabel;
    lbBrokerTitulo: TQRLabel;
    lbPrincipalCanal: TQRLabel;
    dbtComision: TQRDBText;
    dbtBroker: TQRDBText;
    QRLabel25: TQRLabel;
    lbPrincipalPresentacionCostoPliego: TQRLabel;
    bSeguimiento: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRShape4: TQRShape;
    bSeguimientoFooter: TQRBand;
    bSeguimientoHeader: TQRBand;
    QRShape3: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape5: TQRShape;
    bFinal: TQRSubDetail;
    bFinalFooter: TQRBand;
    bFinalHeader: TQRBand;
    QRShape6: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape7: TQRShape;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape8: TQRShape;
    QRChildBand1: TQRChildBand;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    bContratacion: TQRSubDetail;
    bContratacionHeader: TQRBand;
    bContratacionFooter: TQRBand;
    QRLabel49: TQRLabel;
    QRShape10: TQRShape;
    QRLabel50: TQRLabel;
    dbtPeriodoDesde: TQRDBText;
    dbtPeriodoHasta: TQRDBText;
    lbPeriodoFlecha: TQRLabel;
    QRLabel52: TQRLabel;
    lbOpcionAProrroga: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape11: TQRShape;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRShape12: TQRShape;
    bFooter: TQRBand;
    QRSysData1: TQRSysData;
    QRShape13: TQRShape;
    QRSysData2: TQRSysData;
    sdqSeguimientoDatos: TSDQuery;
    sdqFinalDatos: TSDQuery;
    sdqContratacionDatos: TSDQuery;
    sBordeNumeroLicitacion: TQRShape;
    procedure bDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bPrincipalPresentacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bPrincipalNOPresentacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure dbtComisionPrint(sender: TObject; var Value: String);
    procedure bContratacionHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
		procedure SetCostoPliego(aLabel: TQRLabel);
  public
		procedure Mostrar(const aLicitacionId: Integer);
  end;

var
  rptLicitacion: TrptLicitacion;

implementation

uses
	Cuit, Strfuncs, unDmPrincipal;

{$R *.DFM}

procedure TrptLicitacion.Mostrar(const aLicitacionId: Integer);
begin
	sdqDatos.Close;
	sdqDatos.SQL.Text :=
    'SELECT LI.*, ARTADJU.AR_NOMBRE ART_ADJU, ARTANT.AR_NOMBRE ART_ANTERIOR, EL_NOMBRE DELEGACION,' +
    '       ESTADO.TB_DESCRIPCION ESTADO, MADJU.TB_DESCRIPCION MOTIVO_ADJUDICACION, NOPRESENTACION.TB_DESCRIPCION' +
    '       NO_PRESENTACION, SECTOR.TB_DESCRIPCION SECTOR, CA_DESCRIPCION, CA_CODIGO' +
    '  FROM ALI_LICITACION LI, DEL_DELEGACION, AAR_ART ARTANT, CTB_TABLAS SECTOR, CTB_TABLAS ESTADO, CTB_TABLAS' +
    '       NOPRESENTACION, ACA_CANAL, CTB_TABLAS MADJU, AAR_ART ARTADJU' +
    ' WHERE LI_IDDELEGACION = EL_ID(+)' +
    '   AND LI_IDART = ARTANT.AR_ID(+)' +
    '   AND LI_SECTOR = SECTOR.TB_CODIGO(+)' +
    '   AND SECTOR.TB_CLAVE(+) = ''LISEC''' +
    '   AND TO_CHAR (LI_ESTADO) = ESTADO.TB_CODIGO(+)' +
    '   AND ESTADO.TB_CLAVE(+) = ''ESTLI''' +
    '   AND LI_IDMOTIVONOPRESENTACION = NOPRESENTACION.TB_CODIGO(+)' +
    '   AND NOPRESENTACION.TB_CLAVE(+) = ''NOPRE''' +
    '   AND LI_IDCANAL = CA_ID(+)' +
    '   AND LI_MOTIVOADJUDICACION = MADJU.TB_CODIGO(+)' +
    '   AND MADJU.TB_CLAVE(+) = ''MADJU''' +
    '   AND LI_IDARTADJUDICACION = ARTADJU.AR_ID(+)' +
    '   AND LI_ID = ' + IntToStr(aLicitacionId);
	sdqDatos.Open;


  OpenQueryEx(sdqContratacionDatos, [aLicitacionId]);
  OpenQueryEx(sdqFinalDatos, [aLicitacionId]);
  OpenQueryEx(sdqSeguimientoDatos, [aLicitacionId]);

	Print;
end;

procedure TrptLicitacion.SetCostoPliego(aLabel: TQRLabel);
begin
  if sdqDatos.FieldByName('LI_SINCOSTO').AsString = 'T' then
    aLabel.Caption := 'SIN COSTO'
  else
    aLabel.Caption := FormatFloat('$ #,##0.00', sdqDatos.FieldByName('LI_COSTOPLIEGO').AsFloat);
end;

procedure TrptLicitacion.bDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	if not sdqDatos.FieldByName('LI_CUIT').IsNull then
		lbCuit.Caption := PonerGuiones(sdqDatos.FieldByName('LI_CUIT').AsString);
end;

procedure TrptLicitacion.bPrincipalPresentacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	with sdqDatos do
  begin
		PrintBand := (FieldByName('LI_PRESENTACION').AsString = 'S');

    if PrintBand then
    begin
      if FieldByName('LI_DIRECTOINDIRECTO').AsString = 'D' then
        lbPrincipalCanal.Caption := 'DIRECTO - '
      else
        lbPrincipalCanal.Caption := 'INDIRECTO - ';
      lbPrincipalCanal.Caption := lbPrincipalCanal.Caption + FieldByName('CA_DESCRIPCION').AsString;
      lbComisionTitulo.Enabled := (FieldByName('LI_DIRECTOINDIRECTO').AsString = 'I');
      dbtComision.Enabled := lbComisionTitulo.Enabled;
      lbBrokerTitulo.Enabled := lbComisionTitulo.Enabled;
      dbtBroker.Enabled := lbComisionTitulo.Enabled;
      if lbBrokerTitulo.Enabled then
      begin
      	lbBrokerTitulo.Enabled := (FieldByName('CA_CODIGO').AsString = '006');
        dbtBroker.Enabled := lbBrokerTitulo.Enabled;
      end;
      SetCostoPliego(lbPrincipalPresentacionCostoPliego);
    end;
	end;
end;

procedure TrptLicitacion.bPrincipalNOPresentacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	PrintBand := (sdqDatos.FieldByName('LI_PRESENTACION').AsString <> 'S');

  if PrintBand then
  	SetCostoPliego(lbPrincipalNOPresentacionCostoPliego);
end;

procedure TrptLicitacion.QRDBText10Print(Sender: TObject; var Value: String);
begin
	Value := Get_AjusteDecimales(Value, '', 4);
end;

procedure TrptLicitacion.QRDBText12Print(Sender: TObject; var Value: String);
begin
	Value := Get_AjusteDecimales(Value, '', 2);
end;

procedure TrptLicitacion.QRDBText13Print(Sender: TObject; var Value: String);
begin
	Value := Get_AjusteDecimales(Value, '', 2);
end;

procedure TrptLicitacion.dbtComisionPrint(sender: TObject; var Value: String);
begin
	Value := Get_AjusteDecimales(Value, '', 2) + '%';
end;

procedure TrptLicitacion.bContratacionHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	if sdqDatos.FieldByName('LI_PRORROGA').AsString = 'S' then
		lbOpcionAProrroga.Caption := 'SI'
  else
  	lbOpcionAProrroga.Caption := 'NO';
end;

end.
