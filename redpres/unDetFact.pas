unit unDetFact;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Placemnt, Db, SDEngine, Menus, ComCtrls,
  ToolWin, ArtComboBox, ArtDBGrid, ExtCtrls, QuickRpt, Qrctrls, SortDlg,
  HotKeyControl, ShortCutControl, QueryToFile, ExportDialog, StdCtrls,
  DBCtrls, AdvGlowButton, JvExControls, JvComponent, JvAnimatedImage,
  JvGIFCtrl, unArtFrame, unFraNavegadorWEB, ToolPanels,
  unFraDomicilio, unFraDomicilioGIS, unFraGIS_APIv3, RxPlacemnt;

type
  TTipoFactura = (tfAuto, tfNormal, tfGenerica, tfMixta);
  TfrmDetFact = class(TForm)
    FormPlacement: TFormPlacement;
    sdqDatos: TSDQuery;
    dsDetalle: TDataSource;
    pMnuSiniestros: TPopupMenu;
    mnuTodosSini: TMenuItem;
    N1: TMenuItem;
    CoolBar: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    Sep2: TToolButton;
    tbImprimir: TToolButton;
    ToolButton4: TToolButton;
    tbSalir: TToolButton;
    dbgListado: TArtDBGrid;
    tbFiltros: TToolButton;
    ScrollBox1: TScrollBox;
    qrpReporte: TQuickRep;
    QRBand1: TQRBand;
    qrlTitulo: TQRLabel;
    tbPreview: TToolButton;
    QRGroup1: TQRGroup;
    qrdbNroVolante: TQRDBText;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    qrdbMonto: TQRDBText;
    qrdbMontoAPagar: TQRDBText;
    qrbFooter: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    qrbPgFooter: TQRBand;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    tbOrdenar: TToolButton;
    SortDialog: TSortDialog;
    Sep1: TToolButton;
    ShortCutControl: TShortCutControl;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    tbEnviarMail: TToolButton;
    tbExportar: TToolButton;
    ExportDialogDet: TExportDialog;
    pnlBottom2: TPanel;
    edObservaciones: TDBMemo;
    Panel1: TPanel;
    AdvToolPanelTabLateral: TAdvToolPanelTab;
    AdvToolPanelGIS: TAdvToolPanel;
    pnlBottom: TPanel;
    ImagenGIF: TJvGIFAnimator;
    btnCerrar: TAdvGlowButton;
    pnlDirecciones: TPanel;
    fraDireccionDesde: TfraDomicilioGIS;
    fraDireccionHasta: TfraDomicilioGIS;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    pmnuExportar: TPopupMenu;
    mnuExportaDetalle: TMenuItem;
    mnuExportaDetalleAbreviado: TMenuItem;
    ExportDialogDetAbrev: TExportDialog;
    dbgAux: TArtDBGrid;
    pmnuImprimir: TPopupMenu;
    mnuImpDetFact: TMenuItem;
    mnuImpDetAbrev: TMenuItem;
    qrpDetalleAbreviado: TQuickRep;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand9: TQRBand;
    QRLabel43: TQRLabel;
    QRExpr8: TQRExpr;
    ColumnHeaderBand2: TQRBand;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape1: TQRShape;
    QRLabel17: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    sdqDatosDetAbrev: TSDQuery;
    dsDatosDetAbrev: TDataSource;
    procedure tbSalirClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure mnuTodosSiniClick(Sender: TObject);
    procedure mnuAnySiniClick(Sender: TObject);
    procedure dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String;
                                    var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormDestroy(Sender: TObject);
    procedure tbPreviewClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure qrdbMontoPrint(sender: TObject; var Value: String);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure dbgListadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                      var Background: TColor; Highlight: Boolean);
    procedure BuscarDomicilios(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure FormCreate(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure mnuExportaDetalleClick(Sender: TObject);
    procedure mnuExportaDetalleAbreviadoClick(Sender: TObject);
    procedure mnuImpDetFactClick(Sender: TObject);
    procedure mnuImpDetAbrevClick(Sender: TObject);
    procedure sdqDatosAfterOpen(DataSet: TDataSet);
  private
    fraGISMapa: TFraGIS_APIv3;
    Volante    : Integer;
    sSiniestro : String;
    Totales    : TStringList;
    procedure ArmarMenu;
    function CalcTipoFactura(Tipo : TTipoFactura = tfAuto) : TTipoFactura;
    procedure CalcularDistanciaGIS;
    procedure CargarDomicilio(ATipo: String; AIDAutorizacion: Integer; AFrameDomicilio: TfraDomicilioGIS);
    procedure Do_AbrirConsultaDetAbrev;
  public
    TipoFactura : TTipoFactura;
    function Execute (pVolante : Integer; Tipo : TTipoFactura = tfAuto) : Boolean;
    function Imprimir(pVolante : Integer; Tipo : TTipoFactura = tfAuto) : Boolean;
  end;

var
  frmDetFact: TfrmDetFact;

implementation

uses unDmPrincipal, General, StrFuncs, unExportPDF, unMoldeEnvioMail,
     ArchFuncs, unArt, unEnvioMail, AnsiSql, unSesion, VCLExtra;

{$R *.DFM}

procedure TfrmDetFact.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDetFact.tbRefrescarClick(Sender: TObject);
var
  Sql, sSIV, sGEN : String;
begin
  sSIV := 'SELECT utiles.armar_siniestro(iv_siniestro, iv_orden, iv_recaida ,''-'') SINIESTRO , ' +
                ' ex_cuil, '' ''||tj_nombre tj_nombre, cp_denpago, iv_fecpresta FECHA, ' +
                ' TO_NUMBER(IIF_Compara(''<'', iv_impfacturado, 0, 0, iv_impfacturado)) IMPFACT, ' +
                ' TO_NUMBER(IIF_Compara(''<'', iv_impfacturado, 0, iv_impfacturado, iv_imppagconret)) IMPPAFCONRET, ' +
                ' DECODE(dv_observacion, NULL, '''', ''Débito auditoría médica: '' || ' +
                       ' dv_observacion || '' (Auditó Dr./Dra.: '' || se_nombre || '')'' || ' +
                       ' DECODE(iv_observaciones, NULL, '''', '' - '')) || iv_observaciones obs, ' +
                ' iv_pres_codigo PRESTACION, iv_numvolante, ' +
                ' au_id as IDAUTORIZACION, iv_numauto as numauto, cp_traslado, iv_auditado, ' +
                ' dv_original, dv_codigo, dv_secuencia, dv_codoriginal, e.tb_descripcion estado, null contrato ' +
           ' FROM art.sau_autorizaciones, art.sex_expedientes, ctj_trabajador, ' +
                ' art.scp_conpago, art.siv_itemvolante, sin.sdv_debitosvolantes, ' +
                ' art.use_usuarios, art.ctb_tablas e ' +
          ' WHERE iv_siniestro = ex_siniestro ' +
            ' AND iv_orden = ex_orden ' +
            ' AND iv_recaida = ex_recaida ' +
            ' AND iv_volante = dv_volante(+) ' +
            ' AND iv_siniestro = dv_siniestro(+) ' +
            ' AND iv_orden = dv_orden(+) ' +
            ' AND iv_recaida = dv_recaida(+) ' +
            ' AND iv_numvolante = dv_numpago(+) ' +
            ' AND e.tb_clave(+) = ''MUAUT''' +
            ' AND e.tb_codigo(+) = au_estado' +
            ' AND dv_fechabaja(+) IS NULL ' +
            ' AND dv_aplicado(+) = ''S'' ' +
            ' AND dv_observacioninterna(+) = ''N'' ' +             
            ' AND dv_usualta = se_usuario(+) ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND iv_conpago = cp_conpago ' +
            ' AND iv_siniestro = au_siniestro(+) ' +
            ' AND iv_orden = au_orden(+) ' +
            ' AND iv_recaida = au_recaida(+) ' +
            ' AND iv_numauto  = au_numauto(+) ' +
            ' AND iv_estado NOT IN (''X'', ''CM'', ''C6'', ''Z'') ' +
            ' AND iv_volante = ' + SqlInt(Volante) +
            IIF(sSiniestro = '', '', ' AND utiles.armar_siniestro(iv_siniestro, iv_orden, iv_recaida ,''-'') = ''' + sSiniestro + '''');

  sGEN := 'SELECT TO_CHAR(vg_numpago) SINIESTRO, null ex_cuil, null tj_nombre, ' +
                ' cp_denpago, TO_DATE(null) FECHA, ' +
                ' TO_NUMBER(IIF_Compara(''<'', vg_impfacturado, 0, 0, vg_impfacturado)) IMPFACT, ' +
                ' TO_NUMBER(IIF_Compara(''<'', vg_impfacturado, 0, vg_impfacturado, vg_imppagconret)) IMPPAFCONRET, ' +
                ' vg_observaciones OBS, vg_pres_codigo PRESTACION, null iv_numvolante, ' +
                ' TO_NUMBER(NULL) as IDAUTORIZACION, TO_NUMBER(NULL) as numauto, ' +
                ' null as cp_traslado, null as iv_auditado, NULL AS dv_original, NULL AS dv_codigo, ' +
                ' NULL AS dv_secuencia, NULL AS dv_codoriginal, NULL estado, vg_contrato contrato ' +
           ' FROM art.svg_vol_generico, art.scp_conpago ' +
          ' WHERE vg_conpago = cp_conpago ' +
            ' AND vg_volante = ' + SqlInt(Volante) +
            ' AND vg_estado NOT IN (''X'', ''CM'', ''C6'') ' +
              IIF(sSiniestro = '', '', ' AND TO_CHAR(vg_numpago) = ''' + sSiniestro + '''') ;

   if TipoFactura = tfNormal then
     Sql := sSIV
   else if TipoFactura = tfGenerica then
     Sql := sGEN
   else
     Sql := sSIV + ' UNION ALL ' + sGEN;

   CopySqlClp(Sql);
   if Sql <> sdqDatos.Sql.Text then
   begin
     sdqDatos.Close;
     sdqDatos.SQL.Text := Sql + SortDialog.OrderBy;
     sdqDatos.Open;

     if Assigned(Totales) then
     begin
       sSIV := 'SELECT Sum(IIF_Compara(''<'', iv_impfacturado, 0, 0, iv_impfacturado)) TOT1, ' +
                      'Sum(IIF_Compara(''<'', iv_impfacturado, 0, iv_impfacturado, iv_imppagconret)) TOT2 ' +
                ' FROM siv_itemvolante ' +
               ' WHERE iv_volante = ' + SqlInt(Volante) +
                 ' AND iv_estado NOT IN (''X'', ''CM'', ''C6'',''Z'') ' +
                       IIF(sSiniestro = '', '', ' AND utiles.armar_siniestro(iv_siniestro, iv_orden, iv_recaida, ''-'') = ''' + sSiniestro + '''');

       sGEN := 'SELECT SUM(TO_NUMBER(IIF_Compara(''<'', vg_impfacturado, 0, 0, vg_impfacturado))) TOT1, ' +
                     ' SUM(TO_NUMBER(IIF_Compara(''<'', vg_impfacturado, 0, vg_impfacturado, vg_imppagconret))) TOT2 ' +
                ' FROM svg_vol_generico ' +
               ' WHERE vg_volante = ' + SqlInt(Volante) +
                  ' AND vg_estado NOT IN (''X'', ''CM'', ''C6'') ' +
                    IIF(sSiniestro = '', '', ' AND TO_CHAR(vg_numpago) = ''' + sSiniestro + '''');

     // Calcula los subtotales:
       if TipoFactura = tfNormal then
         Sql := sSIV
       else if TipoFactura = tfGenerica then
         Sql := sGEN
       else
         Sql := ' SELECT sum(tot1) tot1, sum(tot2) tot2 FROM (' + sSIV + ' UNION ALL ' + sGEN + ' )';

       Totales.Clear;
       Totales.AddStrings(ValoresColSql(Sql));
     end;
   end;
end;

function TfrmDetFact.CalcTipoFactura(Tipo: TTipoFactura): TTipoFactura;
var Sql : String;
begin
   if Tipo = tfAuto then
   begin
     Sql := 'SELECT 1 FROM svo_volantes ' +
            ' WHERE vo_volante = :Volante ' +
              ' AND vo_mixto = ''S'' ';
     if ExisteSqlEx(Sql, [Volante]) then
       Result := tfMixta
     else begin
       Sql := 'SELECT 1 FROM siv_itemvolante ' +
              ' WHERE iv_volante = :Volante ' +
                ' AND iv_estado NOT IN (''X'', ''CM'', ''C6'') ' ;
       if ExisteSqlEx(Sql, [Volante]) then
         Result := tfNormal
       else
         Result := tfGenerica;
     end;
   end else
       Result := Tipo;
end;

function TfrmDetFact.Execute(pVolante: Integer; Tipo : TTipoFactura): Boolean;
var
  i: Integer;
begin
  Volante      := pVolante;
  TipoFactura  := CalcTipoFactura(Tipo);
  Totales      := TStringList.Create;
  ArmarMenu;
  pnlDirecciones.Visible := (TipoFactura <> tfGenerica);
  if (TipoFactura <> tfGenerica) then
    AdvToolPanelTabLateral.Visible := False;

  tbRefrescarClick(Nil);
  if TipoFactura = tfGenerica then
    for i := 0 to dbgListado.Columns.Count -1 do
      if dbgListado.Columns[i].Field.FieldName = 'SINIESTRO' then
      begin
        dbgListado.Columns[i].Title.Caption := 'Num.Pago';
        Break;
      end;
  Caption := 'Detalles de la Factura ' + IIF (TipoFactura = tfNormal, 'por Siniestro',
                                         IIF(TipoFactura = tfGenerica, 'Generica', 'Mixta')) +
             ' Número ' + IntToStr(pVolante);
  Result := ShowModal = mrOk;
end;

procedure TfrmDetFact.ArmarMenu;
var
  MenuItem :TMenuItem;
  sSIV, sGEN, sSql :String;
begin
  sSIV := ' SELECT utiles.armar_siniestro(iv_siniestro, iv_orden, iv_recaida ,''-'') SINIESTRO, COUNT(*) ' +
            ' FROM siv_itemvolante ' +
           ' WHERE iv_volante = :Vol' +
             ' AND iv_estado NOT IN (''X'', ''CM'', ''C6'') ' +
        ' GROUP BY utiles.armar_siniestro(iv_siniestro, iv_orden, iv_recaida ,''-'') ';

  sGEN := 'SELECT TO_CHAR(vg_numpago) SINIESTRO, COUNT(*) ' +
           ' FROM svg_vol_generico ' +
          ' WHERE vg_volante = :Vol ' +
       ' GROUP BY TO_CHAR(vg_numpago) ';

  if (TipoFactura = tfNormal) then
    sSql := sSIV
  else if (TipoFactura = tfGenerica) then
    sSql := sGEN
  else
    sSql := sSIV + ' UNION ALL ' + sGEN;

  with GetQueryEx(sSql + ' ORDER BY SINIESTRO', [Volante]) do
  try
     while not Eof do
     begin
        MenuItem          := TMenuItem.Create(Self);
        MenuItem.Caption  := Fields[0].AsString + '  (' + Fields[1].AsString + ')';
        MenuItem.OnClick  := mnuAnySiniClick;
        pMnuSiniestros.Items.Add(MenuItem);
        Next;
     end;
  finally
     Free;
  end;
end;

procedure TfrmDetFact.mnuTodosSiniClick(Sender: TObject);
begin
  sSiniestro := '';
  tbRefrescarClick(Nil);
end;

procedure TfrmDetFact.mnuAnySiniClick(Sender: TObject);
begin
  sSiniestro := TMenuItem(Sender).Caption;
  sSiniestro := Trim(Copy(sSiniestro,1, Pos('(', sSiniestro) -1 ));
  tbRefrescarClick(Nil);
end;

procedure TfrmDetFact.dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String;
                                            var CellColor, FontColor: TColor;  var AlignFooter: TAlingFooter);
begin
  AlignFooter := afRight;
  if Column = 'IMPFACT' then
    Value := Totales[0]
  else if Column = 'IMPPAFCONRET' then
    Value := Totales[1];
end;

procedure TfrmDetFact.FormDestroy(Sender: TObject);
begin
  Totales.Free;
end;

procedure TfrmDetFact.tbPreviewClick(Sender: TObject);
begin
  qrlUsuario.Caption := Sesion.Usuario;
  qrlTitulo.Caption  := 'Detalle de la Factura ' + IntToStr(Volante);
  qrpReporte.PreviewModal;
end;

procedure TfrmDetFact.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;  // TK 16828 (Imprimir)
end;

procedure TfrmDetFact.qrdbMontoPrint(sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,#0.00', StrToFloat(Value));
end;

procedure TfrmDetFact.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, dbgListado.Columns);
  SortDialog.Execute;
end;

function TfrmDetFact.Imprimir(pVolante: Integer;  Tipo: TTipoFactura): Boolean;
begin
   try
     Volante     := pVolante;
     TipoFactura := CalcTipoFactura(Tipo);
     sSiniestro  := '';
     tbRefrescarClick(Nil);
     tbImprimirClick(Nil);
     Result := True;
   except
     Result := False;
   end;
end;

procedure TfrmDetFact.tbEnviarMailClick(Sender: TObject);
var
  sSql, vMailPrestador, vNombreArchivo :String;
begin
  qrlUsuario.Caption := Sesion.Usuario;
  qrlTitulo.Caption  := 'Detalle de la Factura ' + IntToStr(Volante);
  vNombreArchivo := IncludeTrailingBackslash(TempPath) + 'DetalleFactura.PDF';
  sSql := 'SELECT ca_direlectronica ' +
           ' FROM cpr_prestador, svo_volantes ' +
          ' WHERE ca_identificador = vo_prestador ' +
            ' AND vo_volante = ' + SqlInt(Volante);
  vMailPrestador := ValorSql(sSql);
  sdqDatos.AfterScroll := nil;
  sdqDatos.DisableControls;
  pnlDirecciones.Visible := False;  
  try
    ExportarPDF(qrpReporte, vNombreArchivo);
    unMoldeEnvioMail.EnviarMailBD(vMailPrestador, 'Detalle de Factura.',
                                  [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                  'Se adjunta Detalle de Factura correspondiente.' + CRLF + CRLF + 'Provincia ART',
                                  GetAttachments(vNombreArchivo, 7));
  finally
    sdqDatos.AfterScroll := sdqDatosAfterScroll;
    sdqDatos.EnableControls;
    sdqDatosAfterScroll(sdqDatos);    
  end;
end;

procedure TfrmDetFact.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;       // por TK 16828
end;

procedure TfrmDetFact.dbgListadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Highlight then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clNavy;
    Background  := clGray;
  end else
  begin
    AFont.Style := AFont.Style - [fsBold];
    AFont.Color := clBlack;
  end;
end;

procedure TfrmDetFact.BuscarDomicilios(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  if fraDireccionDesde.IsSelected then
  begin
    ImagenGIF.Visible := True;
    ImagenGIF.Animate := True;
    btnCerrar.Enabled := False;
    try
      CalcularDistanciaGIS;
    finally
      ImagenGIF.Visible := False;
      btnCerrar.Enabled := True;
    end;
  end;
  pnlBottom.Caption := ' Para cerrar el mapa presione el pinche en la esquina superior izquierda de la pantalla y retire el mouse';
end;

procedure TfrmDetFact.CalcularDistanciaGIS();
begin
  try
    fraGISMapa.TraceRoute(fraDireccionDesde.Address, fraDireccionHasta.Address, nil);
  except
  end;
end;

procedure TfrmDetFact.FormCreate(Sender: TObject);
begin
  fraGISMapa := TFraGIS_APIv3.CreateWithoutNavigation(Self);
  fraGISMapa.Parent := AdvToolPanelGIS;
  fraGISMapa.Align := alClient;
  VCLExtra.LockControls([fraDireccionDesde, fraDireccionHasta, edObservaciones], True);
end;

procedure TfrmDetFact.sdqDatosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgListado, 50);
end;

procedure TfrmDetFact.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  if (not FieldByName('IDAUTORIZACION').IsNull) and (FieldByName('CP_TRASLADO').AsString = 'S') then
  begin
    pnlDirecciones.Visible := True;
    CargarDomicilio('DESDE', FieldByName('IDAUTORIZACION').AsInteger, fraDireccionDesde);
    CargarDomicilio('HASTA', FieldByName('IDAUTORIZACION').AsInteger, fraDireccionHasta);
    AdvToolPanelTabLateral.Visible := True;
  end else
  begin
    pnlDirecciones.Visible := False;
    AdvToolPanelTabLateral.Visible := False;
  end;
end;

procedure TfrmDetFact.CargarDomicilio(ATipo: String; AIDAutorizacion: Integer; AFrameDomicilio: TfraDomicilioGIS);
var
  sSQL: String;
begin
  if ATipo = 'DESDE' then
  begin
    sSQL := 'SELECT au_dcalle as calle, au_dnumero as numero, au_dpiso as piso, au_ddepartamento as departamento, ' +
                  ' au_dcpostal as cod_postal, au_dlocalidad as localidad, au_dprovincia as provincia ' +
             ' FROM art.sau_autorizaciones' +
            ' WHERE au_id = :ID'
  end else {HASTA}
  begin
    sSQL := 'SELECT au_hcalle as calle, au_hnumero as numero, au_hpiso as piso, au_hdepartamento as departamento, ' +
                  ' au_hcpostal as cod_postal, au_hlocalidad as localidad, au_hprovincia as provincia ' +
             ' FROM art.sau_autorizaciones' +
            ' WHERE au_id = :ID';
  end;

  with GetQueryEx(sSQL, [AIDAutorizacion]) do
  try
    with AFrameDomicilio do
      Cargar(FieldByName('CALLE').Text, FieldByName('COD_POSTAL').Text, FieldByName('LOCALIDAD').Text,
             FieldByName('NUMERO').Text, FieldByName('PISO').Text, FieldByName('DEPARTAMENTO').Text,
             FieldByName('PROVINCIA').Text, '');
  finally
    Free;
  end;
end;

procedure TfrmDetFact.mnuExportaDetalleClick(Sender: TObject);
var
  AutoCols : Boolean;
begin
  if sdqDatos.Active and (not sdqDatos.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      AutoCols := ExportDialogDet.Fields.Count = 0;
      try
        sdqDatos.AfterScroll := nil;
        if AutoCols then
          ExportDialogDet.Fields.Assign( dbgListado.Columns );

        ExportDialogDet.Execute;
      finally
        if AutoCols then
          ExportDialogDet.Fields.Clear;

        sdqDatos.AfterScroll := sdqDatosAfterScroll;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmDetFact.mnuExportaDetalleAbreviadoClick(Sender: TObject);  // TK 16828
begin
  Do_AbrirConsultaDetAbrev;  // TK 17312

  if sdqDatosDetAbrev.Active and (not sdqDatosDetAbrev.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      try
        ExportDialogDetAbrev.Fields.Assign(dbgAux.Columns);     // dbgAux (grilla invisible) la puse porque con la otra grilla, la columna monto no me exportaba los decimales, y la misma no tiene opciones sobre los campos.
        ExportDialogDetAbrev.Execute;
      finally
        ExportDialogDetAbrev.Fields.Clear;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmDetFact.mnuImpDetFactClick(Sender: TObject);    // TK 16828 (Imprimir)
begin
  qrlUsuario.Caption := Sesion.Usuario;
  qrlTitulo.Caption  := 'Detalle de la Factura ' + IntToStr(Volante);
  qrpReporte.Print;
end;

procedure TfrmDetFact.mnuImpDetAbrevClick(Sender: TObject);   // TK 16828 (Imprimir)
begin
  Do_AbrirConsultaDetAbrev;  // TK 17312
  qrpDetalleAbreviado.Preview;
end;

procedure TfrmDetFact.Do_AbrirConsultaDetAbrev;
begin
  sdqDatosDetAbrev.Close;
  sdqDatosDetAbrev.sql.text := sdqDatos.SQL.text +
                               ' UNION ALL ' +            // Agrego los debitos varios  TK 17312
                              ' SELECT NULL, NULL, NULL, NULL, NULL, VO_MONTODEBITO, ' +
                                     ' NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' +
                                     ' NULL, NULL, NULL, NULL ' +
                                ' FROM art.svo_volantes ' +
                               ' WHERE vo_montoboni IS NOT NULL ' +
                                 ' AND vo_montodebito > 0 ' +
                                 ' AND vo_volante = ' + SqlInt(Volante);
  sdqDatosDetAbrev.Open;
end;

end.
