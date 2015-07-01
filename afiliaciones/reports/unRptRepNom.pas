unit unRptRepNom;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  unART;

const
  IDReport: TTableID = 2;

type
  TrptRepNom = class(TQuickRep)
    sdqConsulta: TSDQuery;
    sdqCertificados: TSDQuery;
    qrbTitulo: TQRBand;
    QRShape6: TQRShape;
    QRShape18: TQRShape;
    qrlTitulo: TQRLabel;
    qrlNroCertificado: TQRLabel;
    qrlNroCert: TQRLabel;
    qrlEstado: TQRLabel;
    qriLogo: TQRImage;
    qrlBuenosAiresHeader: TQRLabel;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    qrdbFAfiliacion: TQRDBText;
    qrdbHasta: TQRDBText;
    qrdbDesde: TQRDBText;
    qrdbContrato: TQRDBText;
    qrdbCuit: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbRazon: TQRDBText;
    qrdbCodigo: TQRDBText;
    qrdbDescripcion: TQRDBText;
    QRLabel21: TQRLabel;
    qrdNIVEL: TQRDBText;
    qrsCuit: TQRShape;
    QRLabel2: TQRLabel;
    qrdbCalle: TQRDBText;
    qrdbTelefono: TQRDBText;
    qrdbFax: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    dbtCodigo2: TQRDBText;
    dbtDetalle2: TQRDBText;
    dbtCodigo3: TQRDBText;
    dbtDetalle3: TQRDBText;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    bVencimiento: TQRChildBand;
    qrmClausula: TQRMemo;
    qrbGrupoEstablecimiento: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    qrbTitulosColumnas: TQRChildBand;
    qrlCuil: TQRLabel;
    qrlNombre: TQRLabel;
    qrlCat: TQRLabel;
    qrlTarea: TQRLabel;
    qrlFechaMvto: TQRLabel;
    qrlFNacim: TQRLabel;
    qrlSexo: TQRLabel;
    qrlRemun: TQRLabel;
    qrbDetalle: TQRBand;
    qrdbRemun: TQRDBText;
    qrdbSexo: TQRDBText;
    qrdbFNacim: TQRDBText;
    qrdbFMvto: TQRDBText;
    qrdbTarea: TQRDBText;
    qrdbNombre: TQRDBText;
    qrdbCuil: TQRDBText;
    qrdbCat: TQRDBText;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    qrbPiePagina: TQRBand;
    QRMemo1: TQRMemo;
    QRExpr1: TQRExpr;
    QRIFirma: TQRDBImage;
    QrmFirma: TQRDBText;
    QrmCargo: TQRDBText;
    qrUsuario: TQRLabel;
    QRShape8: TQRShape;
    procedure AgregaEspacio(Sender: TObject; var Value: String);
    procedure AjustaDecimales(Sender: TObject; var Value: String);
    procedure qrbGrupoEstablecimientoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FEstablecimiento: Boolean;
    FTipoNomina: String;

    procedure MostrarColumnas(const aTipoClausula: String);
  public
    procedure PrepararReporte(aContrato: Integer; aTipoNomina: String; aIdCertificado: Integer; aNombreArchivo,
                              aTipoVigencia, aTipoClausula: String; const aImprimir: Boolean = False);

    property Establecimiento: Boolean read FEstablecimiento write FEstablecimiento;
  end;

var
  rptRepNom: TrptRepNom;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, unExportPDF, StrFuncs, General, unVisualizador, unSesion, DateTimeFuncs;

{$R *.DFM}

procedure TrptRepNom.MostrarColumnas(const aTipoClausula: String);
var
  bHabilitar: Boolean;
begin
  bHabilitar := True;

  if FTipoNomina = 'S' then
  begin
    bHabilitar := False;
    qrlTarea.Left      := 280;
    qrlTarea.Width     := 452;
    qrdbTarea.Left     := 280;
    qrdbTarea.Width    := 452;
  end;

  qrlCuil.Enabled      := True;
  qrdbCuil.Enabled     := True;
  qrlNombre.Enabled    := True;
  qrdbNombre.Enabled   := True;
  qrlCat.Enabled       := bHabilitar;
  qrdbCat.Enabled      := bHabilitar;
  qrlFechaMvto.Enabled := bHabilitar;
  qrdbFMvto.Enabled    := bHabilitar;
  qrlFNacim.Enabled    := bHabilitar;
  qrdbFNacim.Enabled   := bHabilitar;
  qrlSexo.Enabled      := bHabilitar;
  qrdbSexo.Enabled     := bHabilitar;
  qrlRemun.Enabled     := (FTipoNomina = 'M');
  qrdbRemun.Enabled    := (FTipoNomina = 'M');

  if aTipoClausula = 'X' then
  begin
    qrlCuil.Caption := 'DNI';
    qrdbCuil.DataField := 'tj_documento';
  end;
end;

procedure TrptRepNom.PrepararReporte(aContrato: Integer; aTipoNomina: String; aIdCertificado: Integer; aNombreArchivo,
                                     aTipoVigencia, aTipoClausula: String; const aImprimir: Boolean = False);
var
  iIdFirma: Integer;
  sSql: String;
begin
  IdReport := IdReport;

  FTipoNomina := aTipoNomina;
  MostrarColumnas(aTipoClausula);

  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''FI_RE''' +
      ' AND tb_codigo = ''1''';
  iIdFirma := ValorSqlInteger(sSql);

  sSql :=
    'SELECT art.varios.get_faxparaenvio(dc_fax) fax, co_direlectronica correo, em_nombre,' +
          ' cuit_ponerguiones(em_cuit) em_cuit, co_contrato, dc_fax, dc_telefonos,' +
          ' art.utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento, NULL)' +
          ' || art.utiles.armar_localidad(dc_cpostal, dc_cpostala, dc_localidad, dc_provincia) domicilio_completo,' +
          ' TO_CHAR(co_fechaafiliacion, ''dd/mm/yyyy'') fafilia, TO_CHAR(co_vigenciadesde, ''dd/mm/yyyy'') vigendesde,' +
          ' TO_CHAR(co_vigenciahasta, ''dd/mm/yyyy'') vigenhasta, ca1.ac_codigo codactividad,' +
          ' ca1.ac_descripcion descactividad, ca2.ac_codigo codactividad2, ca2.ac_descripcion descactividad2,' +
          ' ca3.ac_codigo codactividad3, ca3.ac_descripcion descactividad3, co_nivel, fi_caracter caracter,' +
          ' fi_firmante firmante, fi_firma firma' +
     ' FROM adc_domiciliocontrato, aem_empresa, cac_actividad ca1, cac_actividad ca2, cac_actividad ca3, aco_contrato,' +
          ' cfi_firma fi' +
    ' WHERE dc_tipo = :letra' +
      ' AND co_contrato = dc_contrato' +
      ' AND ca1.ac_id = co_idactividad' +
      ' AND ca2.ac_id(+) = co_idactividad2' +
      ' AND ca3.ac_id(+) = co_idactividad3' +
      ' AND fi_id(+) = :id' +
      ' AND co_idempresa = em_id' +
      ' AND co_contrato = :contrato';
  OpenQueryEx(sdqCertificados, ['L', iIdFirma, aContrato], sSql, True);

  sSql :=
    'SELECT cc_establecimiento' +
     ' FROM acc_certificadocobertura' +
    ' WHERE cc_id = :id';
  Establecimiento := IIF(ValorSqlEx(sSql, [aIdCertificado]) = 'M', True, False);

  // Ahora se llena el reporte
  if Establecimiento then
    sSql :=
      'SELECT   ni_cuil, ni_nombre, ni_categoria, ni_tarea, es_nroestableci, ni_fmovimiento, ni_sexo, ni_remuneracion,' +
              ' ni_fnacimiento, ''NRO.'' || es_nroestableci || ''- '' || es_nombre establecimiento,' +
              ' art.utiles.armar_domicilio(es_calle, es_numero, es_piso, es_departamento, NULL)' +
              ' || art.utiles.armar_localidad(es_cpostal, es_cpostala, es_localidad, es_provincia) domicilio_completo,' +
              ' tj_documento' +
         ' FROM aes_establecimiento, ctj_trabajador, ani_nominaimpresa' +
        ' WHERE ni_idcertificado = :idcertificado' +
          ' AND ni_cuil = tj_cuil' +
          ' AND ni_idestablecimiento = es_id' +
     ' ORDER BY es_nroestableci, tj_nombre'
  else
    sSql :=
      'SELECT   ni_cuil, ni_nombre, ni_categoria, ni_tarea, NULL es_nroestableci, ni_fmovimiento, ni_sexo,' +
              ' ni_remuneracion, ni_fnacimiento, NULL establecimiento, NULL domicilio_completo, tj_documento' +
         ' FROM ctj_trabajador, ani_nominaimpresa' +
        ' WHERE ni_idcertificado = :idcertificado' +
          ' AND ni_cuil = tj_cuil' +
     ' ORDER BY tj_nombre';
  OpenQueryEx(sdqConsulta, [aIdCertificado], sSql, True);

  sSql :=
    'SELECT cc_fechaimpresion' +
     ' FROM acc_certificadocobertura' +
    ' WHERE cc_id = :id';
  qrlBuenosAiresHeader.Caption := 'Buenos Aires, ' + FormatDateTime('dd/mm/yyyy', ValorSqlDateTimeEx(sSql, [aIdCertificado]));

  sSql :=
    'SELECT cc_nrocertificado' +
     ' FROM acc_certificadocobertura' +
    ' WHERE cc_id = :id';
  qrlNroCert.Caption := ValorSqlEx(sSql, [aIdCertificado]);

  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  if aTipoVigencia = '30' then    // A los 30 días
    qrmClausula.Lines.Text :=
      'El presente certificado tiene una validez de 30 días corridos a partir de la fecha de emisión. En ningún caso ' +
      'Provincia ART S.A. será responsable de las consecuencias del uso del certificado una vez vencido el plazo de ' +
      'validez.'
  else if aTipoVigencia = 'FM' then   // A fin de mes
    qrmClausula.Lines.Text :=
      'El presente certificado tiene validez hasta el ' + DateTimeToStr(GetLastDayOfMonth(DBDateTime())) + '. En ' +
      'ningún caso Provincia ART S.A. será responsable de las consecuencias del uso del certificado una vez vencido ' +
      'el plazo de validez.';

{$IFDEF SERVICE}
  qrUsuario.Caption := ' ';
{$ELSE}
  qrUsuario.Caption := frmPrincipal.DBLogin.Usuario;
{$ENDIF}

  bVencimiento.Enabled := (aTipoClausula = 'N');

  if not sdqConsulta.IsEmpty then
    if aImprimir then
      Print
    else if aNombreArchivo <> '' then
    try
      FileToPDFSvr(Self, ExtractFileDir(aNombreArchivo), aNombreArchivo, {$IFDEF SERVICE}False{$ELSE}True{$ENDIF});
    except
{$IFDEF SERVICE}
      raise Exception.Create('Ocurrió un error durante la generación del achivo PDF.');
{$ELSE}
      MsgBox('Ocurrió un error durante la generación del achivo PDF.');
{$ENDIF}
    end
    else
      Visualizar(rptRepNom, GetValores(' - Contrato ' + IntToStr(aContrato), sdqCertificados.FieldByName('correo').AsString,
                 aContrato), GetValoresFax('AFI', IntToStr(aContrato), ''{TipoDoc}, 'E'{TipoDest},
                 sdqCertificados.FieldByName('fax').AsString{Telefono},
                 sdqCertificados.FieldByName('em_nombre').AsString{Nombre}, aContrato{IdDest}),
                 [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal, oExportDOCNotAllowed, oExportXLSNotAllowed]);
end;

procedure TrptRepNom.AgregaEspacio(Sender: TObject; var Value: String);
begin
  Value := ' ' + Value;
end;

procedure TrptRepNom.AjustaDecimales(Sender: TObject; var Value: String);
begin
  if (Value = '0') or (Value = '') then
    Value := '$ 0,00'
  else
    Value := Get_AjusteDecimales(Value, '$');

  Value := Value + ' ';
end;

procedure TrptRepNom.qrbGrupoEstablecimientoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := Establecimiento;
end;

end.
