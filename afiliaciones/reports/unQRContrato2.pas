unit unQRContrato2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Qrctrls, QuickRpt, ExtCtrls;

type
  TQRContrato2 = class(TQuickRep)
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel31: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    ChildBand16: TQRChildBand;
    ChildBand11: TQRChildBand;
    QRChildBand8: TQRChildBand;
    QRLabel20: TQRLabel;
    QRShape33: TQRShape;
    ChildBand18: TQRChildBand;
    ChildBand19: TQRChildBand;
    QRLabel32: TQRLabel;
    ChildBand20: TQRChildBand;
    QRLeyenda: TQRLabel;
    QRChildBand9: TQRChildBand;
    QRLabel21: TQRLabel;
    QRShape36: TQRShape;
    QRLabel22: TQRLabel;
    qrTipoImpresion: TQRLabel;
    QRChildBand2: TQRChildBand;
    QRLabel5: TQRLabel;
    QRVigenciaDesde: TQRLabel;
    QRVigenciaHasta: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRMemo2: TQRMemo;
    QRSumaFija: TQRLabel;
    QRPorcMasa: TQRLabel;
    QRDBText2: TQRLabel;
    QRChildBand3: TQRChildBand;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRShape12: TQRShape;
    QRDBText27: TQRDBText;
    QRLabel3: TQRLabel;
    QREncabezado: TQRLabel;
    qriLogoNom: TQRImage;
    qrlCodigoART: TQRLabel;
    sdqQuery: TSDQuery;
    procedure ImprimeMonto(Sender: TObject; var Value: String);
    procedure AjustaDecimales(Sender: TObject; var Value: String);
    procedure CargarControles(aLeyenda: String);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FAporteSRT: Extended;
    FEndoso: String;
    FHipoAcusia: Extended;
    FImprimeMembrete: Boolean;
  public
    procedure Preparar(aLeyenda: String; aCantCopias: Integer; aImprimir: Boolean = False; const aNombreArchivo: String = '');

    property AporteSRT: Extended      read FAporteSRT       write FAporteSRT;
    property Endoso: String           read FEndoso          write FEndoso;
    property HipoAcusia: Extended     read FHipoAcusia      write FHipoAcusia;
    property ImprimeMembrete: Boolean read FImprimeMembrete write FImprimeMembrete;
  end;

var
  QRContrato2: TQRContrato2;

implementation

{$R *.DFM}

uses
  unDmPrincipal, AnsiSql, Printers, CustomDlgs, unArt, unExportPDF;

const
  SQL_IMPCONTRATO =
    'SELECT hc_contrato contrato, hc_vigenciadesde vig_desde, hc_vigenciahasta vig_hasta, ac_codigo cod_actividad,' +
          ' ac.ac_descripcion actividad, fo_formulario nro_formulario, hc_nivel nivel, hm_nombre nombre, hm_cuit cuit,' +
          ' hc_id, hc_fechaimpresion, utiles.armar_domicilio(hd_calle, hd_numero, hd_piso, hd_departamento) domicilio_l,' +
          ' art.utiles.armar_localidad(hd_cpostal, hd_cpostala, hd_localidad, '''') localidad_l,' +
          ' pv_descripcion provincia_l, tar.tb_descripcion tipo_tarifa, ht_porcmasa, ht_porcdescvolumen,' +
          ' ht_porcdescnivel, ht_cargoadmin, ht_alicuotapesos' +
     ' FROM aen_endoso, ahc_historicocontrato, ctb_tablas mot, cac_actividad ac, afo_formulario, ahm_historicoempresa,' +
          ' aht_historicotarifario, ctb_tablas tar, ahd_historicodomicilio, cpv_provincias' +
    ' WHERE en_idhistoricocontrato = hc_id' +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND en_idhistoricotarifa = ht_id' +
      ' AND en_motivo = mot.tb_codigo' +
      ' AND mot.tb_clave = ''MOTEN''' +
      ' AND hc_idactividad = ac.ac_id' +
      ' AND hc_idformulario = fo_id' +
      ' AND ht_tipodetarifa = tar.tb_codigo(+)' +
      ' AND tar.tb_clave(+) = ''TARIF''' +
      ' AND hd_id = en_idhistoricodomicilio' +
      ' AND pv_codigo(+) = hd_provincia';

procedure TQRContrato2.CargarControles(aLeyenda: String);
var
  sEncabezado: String;
  sSql: String;
  wDay: Word;
  wMonth: Word;
  wYear: Word;
begin
  with sdqQuery do
  begin
    DecodeDate(FieldByName('vig_desde').AsDateTime, wYear, wMonth, wDay);

    //Genera el encabezado
    sEncabezado := Format('En la ciudad de Buenos Aires a los %d días ', [wDay]);
    sEncabezado := sEncabezado + Format('del mes de %s de ', [FormatDateTime('mmmm', FieldByName('vig_desde').AsDateTime)]);
    sEncabezado := sEncabezado + Format('%d, PROVINCIA A.R.T. S.A., con domicilio ', [wYear]);
    sEncabezado := sEncabezado + 'en San Martín 108 Piso 17 de la Capital Federal, código ';
    sEncabezado := sEncabezado + 'de A.R.T. Nº 0005-1, C.U.I.T. Nº 30-68825409-0, en ';
    sEncabezado := sEncabezado + 'adelante la Aseguradora y ' + FieldByName('nombre').AsString;
    sEncabezado := sEncabezado + ' con domicilio en ' + FieldByName('domicilio_l').AsString;
    sEncabezado := sEncabezado + ' localidad de ' + FieldByName('localidad_l').AsString;
    sEncabezado := sEncabezado + ' provincia de ' + FieldByName('provincia_l').AsString;
    sEncabezado := sEncabezado + ' C.U.I.T. Nº ' + FieldByName('cuit').AsString;
    sEncabezado := sEncabezado + ' C.I.I.U Nº ' + FieldByName('cod_actividad').AsString;
    sEncabezado := sEncabezado + ' en adelante el Empleador, han convenido en un todo de ' ;
    sEncabezado := sEncabezado + 'acuerdo con la/s respectiva/s solicitud/es de afiliación ';
    sEncabezado := sEncabezado + 'Nro/s. ' + FieldByName('nro_formulario').AsString + ' que forman parte ';
    sEncabezado := sEncabezado + 'del presente y que se archiva con sus antecedentes, el siguiente ';
    sEncabezado := sEncabezado + 'CONTRATO DE AFILIACION en los términos de la Ley 24.557 siendo ';
    sEncabezado := sEncabezado + 'sus condiciones generales y particulares las que se transcriben ';
    sEncabezado := sEncabezado + 'en el siguiente documento.';
    QREncabezado.Caption := sEncabezado;

    //actualiza los controles del report
    QRSumaFija.Caption := FieldByName('ht_alicuotapesos').AsString;
    QRPorcMasa.Caption := FieldByName('ht_porcmasa').AsString;

    sSql :=
      'SELECT afiliacion.get_impresion(:contrato)' +
       ' FROM DUAL';
    qrTipoImpresion.Caption := ValorSqlEx(sSql, [FieldByName('contrato').AsInteger]);

    QRVigenciaDesde.Caption := FieldByName('vig_desde').AsString;
    QRVigenciaHasta.Caption := FieldByName('vig_hasta').AsString;
    QRLeyenda.Caption := aLeyenda;
  end;
end;

procedure TQRContrato2.Preparar(aLeyenda: String; aCantCopias: Integer; aImprimir: Boolean = False;
                                const aNombreArchivo: String = '');
var
  sSql: String;
begin
  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''PARAM''' +
      ' AND tb_codigo = ''HIPOACUSIA''';
  FHipoAcusia := ValorSqlExtended(sSql, 0);

  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''PARAM''' +
      ' AND tb_codigo = ''APORTESRT''';
  FAporteSRT := ValorSqlExtended(sSql, 0);

  sSql := SQL_IMPCONTRATO + ' AND en_id = :id';
  OpenQueryEx(sdqQuery, [FEndoso], sSql, True);
  CargarControles(aLeyenda);

  PrinterSettings.Copies := aCantCopias;
  PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

  {FIXME: Sacar esto porque se agrego solo por un problema de falta de formularios con logo.
          Sacar del formulario de reporte qriLogoNom y qrlCodigoART
  }
  qriLogoNom.Picture.Bitmap.LoadFromResourceName(hInstance, RES_EMP_LOGO_BN);

  if aNombreArchivo <> '' then
    FileToPDFSvr(QRContrato2, ExtractFileDir(aNombreArchivo), aNombreArchivo, True)
  else if aImprimir then
    Print
  else
    Preview;
end;

procedure TQRContrato2.ImprimeMonto(Sender: TObject; var Value: String);
begin
  if (Value = '0') or (Value = '') then
    Value := ' '
  else
    Value := '% ' + CurrToStrF(StrToCurr(Value), ffNumber, 2);
end;

procedure TQRContrato2.AjustaDecimales(sender: TObject; var Value: String);
begin
  if (Value = '0') or (Value = '') then
    Value := ' '
  else
    Value := CurrToStrF(StrToCurr(Value), ffcurrency, 2);
end;

procedure TQRContrato2.TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  qriLogoNom.Enabled   := ImprimeMembrete;
  qrlCodigoART.Enabled := ImprimeMembrete;
end;

end.
