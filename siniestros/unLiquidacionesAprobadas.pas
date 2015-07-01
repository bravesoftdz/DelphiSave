unit unLiquidacionesAprobadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Buttons,
  unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Mask, ToolEdit, DateComboBox, QRCtrls, QuickRpt,
  ExtCtrls, DB, SDEngine, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo, QueryToFile, ExportDialog, SinEdit, unArtDbFrame,
  unFraTrabajador, unFraCodigoDescripcion, unfraDelegacion, unFraEmpresa,
  RxToolEdit, RxPlacemnt;

type
  TfrmLiquidacionesAprobadas = class(TfrmCustomForm)
    gbSector: TGroupBox;
    gbFechaAprobado: TGroupBox;
    edFechaAprobadoDesde: TDateComboBox;
    edFechaAprobadoHasta: TDateComboBox;
    gbAdicionales: TGroupBox;
    chkReintegro: TCheckBox;
    chkSector: TCheckBox;
    sdqILTP: TSDQuery;
    qrLiquidacionesAprobadasIncapacidades: TQuickRep;
    TitleBand1: TQRBand;
    qrlTituloILTP: TQRLabel;
    qrFechaHOY: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrbDetalle: TQRBand;
    qrdbSiniestro: TQRDBText;
    qrdbOrden: TQRDBText;
    qrdbTrabajador: TQRDBText;
    qrdbEmpresa: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    SummaryBand1: TQRBand;
    qrlTotal: TQRLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    qrdbVencimiento: TQRDBText;
    qrdbSolicitud: TQRDBText;
    qrdbDesde: TQRDBText;
    qrdbHasta: TQRDBText;
    qrImporteDetalle: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrCantidad: TQRExpr;
    qreTotal: TQRExpr;
    QRLabel13: TQRLabel;
    qrdbRecaida: TQRDBText;
    QRDBText11: TQRDBText;
    qrbPieGrupoTipo: TQRBand;
    qrbPieGrupoBeneficiario: TQRBand;
    QRLabel14: TQRLabel;
    qreSubTotalTipo: TQRExpr;
    qreSubTotalBeneficiario: TQRExpr;
    QRLabel15: TQRLabel;
    qrdbNumLiqui: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrAsterisco: TQRLabel;
    qrbGrupoBeneficiario: TQRGroup;
    qrbGrupoTipo: TQRGroup;
    QRShape1: TQRShape;
    qrImpresoPor: TQRLabel;
    QRShape2: TQRShape;
    qrLiquidacionesAprobadasOtros: TQuickRep;
    QRBand1: TQRBand;
    qrlTituloOtros: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel32: TQRLabel;
    QRBand4: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand5: TQRBand;
    QRLabel35: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel36: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText15: TQRDBText;
    QRBand7: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel38: TQRLabel;
    sdqOtros: TSDQuery;
    sdqSector: TSDQuery;
    dsSector: TDataSource;
    cmbSector: TDBCheckCombo;
    GroupBox1: TGroupBox;
    cmbFPago: TDBCheckCombo;
    sdqFPago: TSDQuery;
    dsFPago: TDataSource;
    GroupBox2: TGroupBox;
    Bevel11: TBevel;
    qriLogo1: TQRImage;
    qriLogo2: TQRImage;
    edILTP: TExportDialog;
    btnExportar: TButton;
    edOtros: TExportDialog;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    sdqConcepto: TSDQuery;
    dsConcepto: TDataSource;
    GroupBox4: TGroupBox;
    dcConcepto: TDBCheckCombo;
    gbEmpresaTrabajador: TGroupBox;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    fraDelegacion: TfraDelegacion;
    Label4: TLabel;
    fraEmpresa: TfraEmpresa;
    GroupBox5: TGroupBox;
    dcTipoCon: TDBCheckCombo;
    sdqTipoCon: TSDQuery;
    dsTipoCon: TDataSource;
    fraBanco: TfraCodigoDescripcion;
    QRLabel18: TQRLabel;
    QRDBText6: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure edFechaAprobadoDesdeExit(Sender: TObject);
    procedure AjusteDecimales(sender: TObject; var Value: String);
    procedure qrAsteriscoPrint(sender: TObject; var Value: String);
    procedure qrImpresoPorPrint(sender: TObject; var Value: String);
    procedure dcTipoConChange(Sender: TObject);
    procedure edSiniestroSelect(Sender: TObject);
  private
    bResultados :Boolean;
    procedure Informe_Liquid_Aprobadas_ILTP(FechaAprobadoDesde, FechaAprobadoHasta: TDateTime;
                                            Reintegro, Exportar: Boolean);
    procedure Informe_Liquid_Aprobadas_Otros(FechaAprobadoDesde, FechaAprobadoHasta: TDateTime;
                                             Reintegro, Exportar, SoloSectorLogueado: Boolean);
  end;

var
  frmLiquidacionesAprobadas: TfrmLiquidacionesAprobadas;

implementation

uses
  unDmPrincipal, CustomDlgs, General, AnsiSql, unVisualizador, Strfuncs,
  Numeros, unSesion, unSiniestros, unTercerizadoras;

{$R *.dfm}

procedure TfrmLiquidacionesAprobadas.FormCreate(Sender: TObject);
begin
  inherited;
  edFechaAprobadoDesde.Date := DBDate;
  edFechaAprobadoHasta.Date := edFechaAprobadoDesde.Date;
  sdqSector.Open;

  with fraBanco do
  begin
    TableName      := 'ZBA_BANCO';
    FieldID        := 'BA_ID';
    FieldDesc      := 'BA_NOMBRECORTO';
    FieldCodigo    := 'BA_CODIGO';
    FieldBaja      := 'BA_FECHABAJA';
    ExtraCondition := 'AND ((ba_giro = ''S'') OR (ba_transferencia = ''S'') ' +
                       ' OR (ba_depositocuenta = ''S'') OR (ba_cheque = ''S'')) ';
  end;  
end;

procedure TfrmLiquidacionesAprobadas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLiquidacionesAprobadas.btnAceptarClick(Sender: TObject);
begin
  Verificar(edFechaAprobadoDesde.Date = 0, edFechaAprobadoDesde,
            'Debe indicar la fecha de aprobación desde');
  Verificar(edFechaAprobadoHasta.Date = 0, edFechaAprobadoHasta,
            'Debe indicar la fecha de aprobación hasta');
  Verificar(edFechaAprobadoHasta.Date > DBDate, edFechaAprobadoHasta,
            'La fecha de aprobación hasta no puede ser mayor que la fecha del sistema');
 // Lu TK 5825
  bResultados := False;
  Informe_Liquid_Aprobadas_ILTP(edFechaAprobadoDesde.Date, edFechaAprobadoHasta.Date,
                                chkReintegro.Checked, (Sender = btnExportar));
  Informe_Liquid_Aprobadas_Otros(edFechaAprobadoDesde.Date, edFechaAprobadoHasta.Date,
                                 chkReintegro.Checked, (Sender = btnExportar), chkSector.Checked);
  if not bResultados then
    MsgBox('No se han producido resultados, ingrese otros filtros.', MB_ICONINFORMATION);
end;

procedure TfrmLiquidacionesAprobadas.Informe_Liquid_Aprobadas_ILTP(FechaAprobadoDesde, FechaAprobadoHasta: TDateTime;
                                                                   Reintegro, Exportar: Boolean);
var
  sSql, sWhere, sTitulo: String;
begin
  qriLogo1.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
  sTitulo := 'ILT/ILP - LIQUIDACIONES APROBADAS - ' + DateToStr(FechaAprobadoDesde) + ' al ' + DateToStr(FechaAprobadoHasta);
  qrlTituloILTP.Caption := sTitulo;

  sSql := 'SELECT le_siniestro, le_orden, le_recaida, le_numliqui, cp_titpago, ' +
                ' le_fsolicita, le_fechades, le_fechahas, le_imporperi, le_fvencimi, le_tipoliqui, ' +
                ' NVL(le_chequenombre, art.utiles.iif_compara(''IN'', le_tipoliqui, ''DIW'', tj_nombre, em_nombre)) beneficiario, ' +
                ' em_nombre, tj_nombre, art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio ' +
           ' FROM ctj_trabajador, aem_empresa, art.scp_conpago, ' +
                ' art.sle_liquiempsin, art.sex_expedientes ' +
          ' WHERE NVL(le_estado, '''') <> ''P'' ' +
            ' AND le_siniestro = ex_siniestro ' +
            ' AND le_orden = ex_orden ' +
            ' AND le_recaida = ex_recaida ' +
            ' AND le_conpago = cp_conpago ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND ex_cuil = tj_cuil';

  sWhere := SqlBetween(' AND le_faprobado', FechaAprobadoDesde, FechaAprobadoHasta) +
            iif(Reintegro, ' AND art.discoverer.get_sectorotrosconc(cp_conpago) = ''MEDICAS'' ', '');

  if (cmbSector.InSql <> '') then
    sWhere := sWhere + ' AND NVL(em_sector, '''') ' +  cmbSector.InSql;

  if (cmbFPago.InSql <> '') then
    sWhere := sWhere + ' AND le_metodopago ' + cmbFPago.InSql;

  if fraBanco.IsSelected then
    sWhere := sWhere + ' AND le_idbanco = ' + SqlInt(fraBanco.Value);

  if not edSiniestro.IsEmpty then
    sWhere := sWhere + ' AND le_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                       ' AND le_orden = ' + SqlInt(edSiniestro.Orden) +
                       ' AND le_recaida = ' + SqlInt(edSiniestro.Recaida);

  if not fraDelegacion.IsEmpty then
    sWhere := sWhere + ' AND le_delegacion = ' + SqlValue(fraDelegacion.Codigo);

  if (dcConcepto.InSql <> '') then
    sWhere := sWhere + ' AND le_conpago ' + dcConcepto.InSql
  else if (dcTipoCon.InSql <> '') then
    sWhere := sWhere + ' AND cp_tipo ' + dcTipoCon.InSql;

  if not fraEmpresa.IsEmpty then
    sWhere := sWhere + ' AND em_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
    sWhere := sWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

  OpenQuery(sdqILTP, sSql + sWhere + ' ORDER BY cp_titpago, 12, le_siniestro, le_orden, le_recaida, le_numliqui');
  if not sdqILTP.IsEmpty then
  begin
    bResultados := True;
    if Exportar then
    begin
      edILTP.Title := sTitulo;
      edILTP.Execute;
    end
    else begin
      qrLiquidacionesAprobadasIncapacidades.PrinterSettings.Collate := 1;
      Visualizar(qrLiquidacionesAprobadasIncapacidades, GetValores(),
                [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    end;
  end;
end;

procedure TfrmLiquidacionesAprobadas.Informe_Liquid_Aprobadas_Otros(FechaAprobadoDesde, FechaAprobadoHasta: TDateTime;
                                                                    Reintegro, Exportar, SoloSectorLogueado: Boolean);
var
  sSql, sWhere, sTitulo: String;
begin
  qriLogo2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
  sTitulo := 'OTROS CONCEPTOS - LIQUIDACIONES APROBADAS - ' + DateToStr(FechaAprobadoDesde) + ' al ' +
                                                              DateToStr(FechaAprobadoHasta);
  qrlTituloOtros.Caption := sTitulo;

  sSql := 'SELECT pr_siniestro, pr_orden, pr_recaida, pr_numpago, pr_femision, ' +
                ' pr_letrafac, pr_situfac, pr_numfac, pr_imporpago, pr_chequenombre, ' +
                ' tipo, cp_denpago, em_nombre, lg_nombre, acreedor, factura, ' +
                ' NVL(pr_chequenombre, acreedor) as beneficiario, ex_id ' +
           ' FROM (SELECT pr_siniestro, pr_orden, pr_recaida, pr_numpago, pr_femision, ' +
                        ' pr_letrafac, pr_situfac, pr_numfac, pr_imporpago, pr_chequenombre,' +
                        ' cp_titpago as tipo, cp_denpago, em_nombre, lg_nombre, ' +
                        ' art.liq.get_acreedor(pr_acreedor, pr_cuitcuil, pr_prestadorsecuencia, pr_prestadormutual) as acreedor, ' +
                        ' pr_letrafac || '' '' || pr_situfac || ''-'' || pr_numfac as factura, ex_id ' +
                   ' FROM art.use_usuarios, art.spr_pagoexpesin, art.sex_expedientes, ' +
                        ' aem_empresa, art.scp_conpago, art.dlg_delegaciones ' +
                  ' WHERE pr_siniestro = ex_siniestro ' +
                    ' AND pr_orden = ex_orden ' +
                    ' AND pr_recaida = ex_recaida ' +
                    ' AND pr_conpago = cp_conpago ' +
                    ' AND ex_cuit = em_cuit ' +
                    ' AND pr_aprobado = se_usuario ' +
                    ' AND pr_delegacion = lg_codigo(+)';

  sWhere := SqlBetween(' AND pr_faprobado', FechaAprobadoDesde, FechaAprobadoHasta) +
            iif(Reintegro, ' AND art.discoverer.get_sectorotrosconc(cp_conpago)= ''MEDICAS'' ', '') +
            iif(SoloSectorLogueado, ' AND se_sector = ' + SQLValue(Sesion.Sector), '');

  if (cmbSector.InSql <> '') then
    sWhere := sWhere + ' AND NVL(em_sector, '''') ' + cmbSector.InSql;

  if (cmbFPago.InSql <> '') then
    sWhere := sWhere + ' AND pr_metodopago ' + cmbFPago.InSql;

  if fraBanco.IsSelected then
    sWhere := sWhere + ' AND pr_idbanco = ' + SqlInt(fraBanco.Value);

  if not edSiniestro.IsEmpty then
    sWhere := sWhere + ' AND pr_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                       ' AND pr_orden = ' + SqlInt(edSiniestro.Orden) +
                       ' AND pr_recaida = ' + SqlInt(edSiniestro.Recaida);

  if not fraDelegacion.IsEmpty then
    sWhere := sWhere + ' AND pr_delegacion = ' + SqlValue(fraDelegacion.Codigo);

  if (dcConcepto.InSql <> '') then
    sWhere := sWhere + ' AND pr_conpago ' + dcConcepto.InSql
  else if (dcTipoCon.InSql <> '') then
    sWhere := sWhere + ' AND cp_tipo ' + dcTipoCon.InSql;

  if not fraEmpresa.IsEmpty then
    sWhere := sWhere + ' AND em_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
    sWhere := sWhere + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

  OpenQuery(sdqOtros, sSql + sWhere + ') ORDER BY NVL(pr_chequenombre, acreedor), pr_siniestro, ' +
                                                    ' pr_orden, pr_recaida, pr_numpago');

  Application.ProcessMessages;

  if not sdqOtros.IsEmpty then
  begin
    bResultados := True;
    if Exportar then
    begin
      edOtros.Title := sTitulo;
      edOtros.Execute;
    end
    else begin
      qrLiquidacionesAprobadasOtros.PrinterSettings.Collate := 1;
      Visualizar(qrLiquidacionesAprobadasOtros, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    end;
  end;
end;

procedure TfrmLiquidacionesAprobadas.edFechaAprobadoDesdeExit(Sender: TObject);
begin
  if edFechaAprobadoHasta.IsEmpty then
    edFechaAprobadoHasta.Date := edFechaAprobadoDesde.Date;
end;

procedure TfrmLiquidacionesAprobadas.AjusteDecimales(Sender: TObject; var Value: String);
begin
  inherited;
  Value := Get_AjusteDecimales(Value, iif(Sender = qrImporteDetalle, '', '$'));
end;

procedure TfrmLiquidacionesAprobadas.qrAsteriscoPrint(sender: TObject; var Value: String);
begin
  if not sdqILTP.FieldByName('BENEFICIARIO').IsNull or
    (Pos(sdqILTP.FieldByName('LE_TIPOLIQUI').AsString, 'DI') > 0) then
    Value := '*'
  else
    Value := '';
end;

procedure TfrmLiquidacionesAprobadas.qrImpresoPorPrint(sender: TObject; var Value: String);
begin
  inherited;
  Value := 'Impreso por ' + Sesion.Usuario;
end;

procedure TfrmLiquidacionesAprobadas.dcTipoConChange(Sender: TObject);
var
  sWhere: String;
begin
  sWhere := IIF(dcTipoCon.InSql <> '', ' WHERE cp_tipo ' + dcTipoCon.InSql, '');
  with sdqConcepto do
  begin
    Close;
    SQL.Text := ' SELECT cp_conpago, cp_denpago ' +
                  ' FROM art.scp_conpago ' + sWhere +
              ' ORDER BY cp_denpago ';
    Open;
 end;
 inherited;
end;

procedure TfrmLiquidacionesAprobadas.edSiniestroSelect(Sender: TObject);
begin
  if not ExisteSql('SELECT 1 FROM sex_expedientes ' +
                   ' WHERE ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                     ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                     ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida))
     or (not ValidarSiniestroUsuarioTerce(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)) then
  begin
     MsgBox('No existe el siniestro seleccionado o bien Ud. no posee permisos para visualizarlo.', MB_ICONEXCLAMATION);
     edSiniestro.Clear;
  end
end;

end.
