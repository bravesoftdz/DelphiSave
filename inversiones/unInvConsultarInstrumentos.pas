unit unInvConsultarInstrumentos;

interface

uses
  {$IFDEF VER150} Placemnt, ToolEdit, CurrEdit, {$ELSE} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, Mask, DateComboBox, unCustomGridABM,
  FormPanel, unArt, unfraCtbTablas, PatternEdit, CardinalEdit, Menus, IntEdit;

type
  TfrmInvConsultarInstrumentos = class(TfrmCustomGridABM)
    gbTipoInstrumento: TGroupBox;
    fraTipoInstrumento: TfraCodigoDescripcion;
    gbVencimiento: TGroupBox;
    Label1: TLabel;
    edFechaVencimDesde: TDateComboBox;
    edFechaVencimHasta: TDateComboBox;
    gbInstit: TGroupBox;
    fraInstitucion: TfraCodigoDescripcion;
    pnlBajas: TPanel;
    chkNoMostrarBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    fraTipoInstrumentoAltaModif: TfraCodigoDescripcion;
    Label2: TLabel;
    edVencimientoAltaModif: TDateComboBox;
    Label3: TLabel;
    fraInstitucionAltaModif: TfraCodigoDescripcion;
    Label6: TLabel;
    edTasaAltaModif: TCurrencyEdit;
    Label7: TLabel;
    edPlazoAltaModif: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    edCodCajaValAltaModif: TEdit;
    Label10: TLabel;
    edDescripcionAltaModif: TEdit;
    tbSalir2: TToolButton;
    ToolButton2: TToolButton;
    tbConsCupones: TToolButton;
    tbConsOperaciones: TToolButton;
    Label11: TLabel;
    fraTasaRefAltaModif: TfraCodigoDescripcion;
    Label12: TLabel;
    edConstitucionAltaModif: TDateComboBox;
    fraMonedaAltaModif: TfraCodigoDescripcion;
    Label13: TLabel;
    tbConsLicitaciones: TToolButton;
    chkGrupoEconAltaModif: TCheckBox;
    Label14: TLabel;
    edCalificacionAltaModif: TEdit;
    rgGrupoEcon: TRadioGroup;
    gbConstitucion: TGroupBox;
    edFechaDesdeConst: TDateComboBox;
    Label15: TLabel;
    edCodigoSSNAltaModif: TEdit;
    Label4: TLabel;
    edFechaHastaConst: TDateComboBox;
    gbCodCajaValores: TGroupBox;
    edCodCajaVal: TEdit;
    chkPrecancelableAltaModif: TCheckBox;
    edMontoAltaModif: TCurrencyEdit;
    lblMontoAltaModif: TLabel;
    Label5: TLabel;
    fraGarantiaAltaModif: TfraCtbTablas;
    Label16: TLabel;
    fraPlazoLiqAltaModif: TfraCodigoDescripcion;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    pnlCantReg: TPanel;
    edCantRegGrilla: TCardinalEdit;
    gbCartera: TGroupBox;
    edFechaEnCartera: TDateComboBox;
    lblCuentaAltaModif: TLabel;
    fraCuentaAltaModif: TfraCodigoDescripcion;
    lblEmisorAltaModif: TLabel;
    fraEmisorAltaModif: TfraCodigoDescripcion;
    lblFiduciarioAltaModif: TLabel;
    fraFiduciarioAltaModif: TfraCodigoDescripcion;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpCondicEmision: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    fraTipo: TfraCtbTablas;
    fraGrupo: TfraCtbTablas;
    fraTipoAltaModif: TfraCtbTablas;
    lblTipoAltaModif: TLabel;
    fraGrupoAltaModif: TfraCtbTablas;
    lblGrupoAltaModif: TLabel;
    tbVisualizarAdjunto: TToolButton;
    ToolButton9: TToolButton;
    rgMercadoAltaModif: TRadioGroup;
    Label17: TLabel;
    edVersionAltaModif: TIntEdit;
    tbPrevision: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbConsCuponesClick(Sender: TObject);
    procedure tbConsOperacionesClick(Sender: TObject);
    procedure DoCalcularAdic(Sender: TObject);
    procedure tbConsLicitacionesClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpCondicEmisionClick(Sender: TObject);
    procedure tbVisualizarAdjuntoClick(Sender: TObject);
    procedure tbPrevisionClick(Sender: TObject);
  private
    FIdPlazoFijoOriginal, FIdInstrumento: TTableID;
    FLimpiarControles: Boolean;
    procedure CalcTotales;
    function Is_ExisteArchivoInstrAnalisisFilaActual(var NombreArchivo: String): Boolean;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    procedure DoCargarControles;
  public
    class function DoAltaPlazoFijo(Denominacion: String; IdPlazoFijoOriginal: TTableId; Monto: Double): Boolean;
  end;

  procedure DoInsertarOperacionInstrumento(ConTrans: Boolean; IdInstrumento: TTableID; Monto, Residual: Double; Constitucion: TDateTime; EsCancelacion: Boolean; IdCuentaBancaria: TTableId);

var
  frmInvConsultarInstrumentos: TfrmInvConsultarInstrumentos;
  TotalConsulta: Array of Extended;

const
  MAXCOLS = 4;
  CAMPOS_SUMA: Array[0..MAXCOLS] of String = ('NOMINAL', 'RESIDUAL', 'MONTO', 'VALUACION', 'INTERES_DEVENGADO');

implementation

{$R *.dfm}

uses
  unDmPrincipal, AnsiSql, unSesion, DbFuncs, General, CustomDlgs, SqlFuncs, StrFuncs,
  unInvConsultarCupones, unInvConsultarOperaciones, VCLExtra, DateTimeFuncs,
  unInvLicitaciones, unInversiones, unqrInvInstrumentoAnalisis, unInvPrevision;

procedure TfrmInvConsultarInstrumentos.tbRefrescarClick(Sender: TObject);
var
  sParamFecha, sWhere, sSql: String;
begin
  sParamFecha := 'NVL(' + SqlValue(edFechaEnCartera.Date) + ', TRUNC(SYSDATE))';

  sSql := 'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION DENOMINACION, IN_CONSTITUCION CONSTITUCION, ' +
                 'IN_VENCIMIENTO VENCIMIENTO, ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID, ' + sParamFecha + ') NOMINAL, ' +
                 'ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, ' + sParamFecha + ') RESIDUAL, ' +
                 'NS_NOMBRE INSTITUCION, IN_TASA TASA, IN_PLAZO DIAS_PLAZO, IN_FECHABAJA FECHA_BAJA, ' +
                 'IN_CODCAJAVALORES CODCAJAVALORES, NS_ID IDINSTITUCION, IN_ID ID, TI_CUPON REQUIERECUPON, ' +
                 'TR_NOMBRE TASA_REFERENCIA, MO_NOMBRE MONEDA, IN_IDTIPOINSTRUMENTO IDTIPOINSTRUMENTO, ' +
                 'IN_IDTASAREFERENCIA IDTASAREFERENCIA, IN_IDMONEDA IDMONEDA, TI_LICITACION REQUIERELICITACION, ' +
                 'IN_CALIFICACION CALIFICACION, IN_GRUPOECONOMICO GRUPOECON, IN_CODIGOSSN CODIGO_SSN, ' +
                 'IN_PRECANCELABLE PRECANCELABLE, GTIA.TB_CODIGO CODGARANTIA, GTIA.TB_DESCRIPCION GARANTIA, ' +
                 'CB_ID IDPLAZOLIQ, CB_DESCRIPCION PLAZO_LIQUIDACION, ART.INVERSION.GET_MONTOINSTRUMENTO(IN_ID, ' + sParamFecha + ') MONTO, ' +
                 'ART.INVERSION.GET_VALUACIONINSTRUMENTO(IN_ID, ' + sParamFecha + ') VALUACION, ART.INVERSION.GET_INTERESDEVENGADO(IN_ID, ' + sParamFecha + ') INTERES_DEVENGADO, ' +
                 'EM_ID IDEMISOR, EM_NOMBRE EMISOR, FI_ID IDDIFUCIARIO, FI_NOMBRE FIDUCIARIO, ' +
                 'IN_IDINSTRUMENTOENANALISIS IDINSTRUMENTOENANALISIS, TIPO.TB_DESCRIPCION TIPO, GRUPO.TB_DESCRIPCION GRUPO, ' +
                 'IN_TIPO CODTIPO, IN_GRUPO CODGRUPO, IA_ID IDNIA, DECODE(IA_NOMBREARCHIVO, NULL, ''N'', ''S'') EXISTENOMBREARCHIVO, ' +
                 'IN_MERCADO CODMERCADO, DECODE(IN_MERCADO, ''P'', ''Primario'', ''S'', ''Secundario'') MERCADO, ' +
                 'IN_VERSION VERSION ' +
            'FROM RCB_CLEARINGBANCARIO, CTB_TABLAS GRUPO, CTB_TABLAS TIPO, CTB_TABLAS GTIA, NMO_MONEDA, ' +
                 'NNS_INSTITUCION, NTR_TASAREFERENCIA, NTI_TIPOINSTRUMENTO, ' +
                 'NIA_INSTRUMENTOENANALISIS, NFI_FIDUCIARIO, NEM_EMISOR, NIN_INSTRUMENTO ' +
           'WHERE TI_ID = IN_IDTIPOINSTRUMENTO ' +
             'AND IN_IDINSTITUCION = NS_ID(+) ' +
             'AND IN_IDTASAREFERENCIA = TR_ID(+) ' +
             'AND IN_IDMONEDA = MO_ID ' +
             'AND GTIA.TB_CLAVE(+) = ''IGTIA'' ' +
             'AND GTIA.TB_CODIGO(+) = IN_GARANTIA ' +
             'AND TIPO.TB_CLAVE(+) = ''ITIPO'' ' +
             'AND TIPO.TB_CODIGO(+) = IN_TIPO ' +
             'AND GRUPO.TB_CLAVE(+) = ''IGRUP'' ' +
             'AND GRUPO.TB_CODIGO(+) = IN_GRUPO ' +
             'AND IN_PLAZOLIQUIDACION = CB_ID(+) ' +
             'AND IN_IDEMISOR = EM_ID(+) ' +
             'AND IN_IDFIDUCIARIO = FI_ID(+) ' +
             'AND IN_IDINSTRUMENTOENANALISIS = IA_ID(+)';

  sWhere := SqlBetweenDateTime(' AND IN_VENCIMIENTO ', edFechaVencimDesde.Date, edFechaVencimHasta.Date) +
            SqlBetweenDateTime(' AND IN_CONSTITUCION ', edFechaDesdeConst.Date, edFechaHastaConst.Date);

  if fraTipoInstrumento.IsSelected then
    sWhere := sWhere + ' AND TI_ID = ' + SqlValue(fraTipoInstrumento.Value);

  if fraInstitucion.IsSelected then
    sWhere := sWhere + ' AND NS_ID = ' + SqlValue(fraInstitucion.Value);

  if not IsEmptyString(edCodCajaVal.Text) then
    sWhere := sWhere + ' AND IN_CODCAJAVALORES = ' + SqlValue(Trim(edCodCajaVal.Text));

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND IN_FECHABAJA IS NULL';

  case rgGrupoEcon.ItemIndex of
    0: sWhere := sWhere + ' AND IN_GRUPOECONOMICO = ''S''';
    1: sWhere := sWhere + ' AND IN_GRUPOECONOMICO = ''N''';
  end;

  if edFechaEnCartera.Date <> 0 then
    sWhere := sWhere + ' AND ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, ' + SqlValue(edFechaEnCartera.Date) + ') > 0';

  if FIdPlazoFijoOriginal <> ART_EMPTY_ID then
    sWhere := sWhere + ' AND IN_ID = ' + SqlValue(FIdPlazoFijoOriginal);

  if fraTipo.IsSelected then
    sWhere := sWhere + ' AND IN_TIPO = ' + SqlValue(fraTipo.Value);

  if fraGrupo.IsSelected then
    sWhere := sWhere + ' AND IN_GRUPO = ' + SqlValue(fraGrupo.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmInvConsultarInstrumentos.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoInstrumento do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraInstitucion do
    begin
      TableName   := 'NNS_INSTITUCION ';
      FieldID     := 'NS_ID';
      FieldCodigo := 'NS_ID';
      FieldDesc   := 'NS_NOMBRE';
      FieldBaja   := 'NS_FECHABAJA';
      ShowBajas   := True;
    end;

  with fraTipo do
    begin
      Clave     := 'ITIPO';
      ShowBajas := True;
    end;

  with fraGrupo do
    begin
      Clave     := 'IGRUP';
      ShowBajas := True;
    end;

  with fraTipoInstrumentoAltaModif do
    begin
      TableName   := 'NTI_TIPOINSTRUMENTO';
      FieldID     := 'TI_ID';
      FieldCodigo := 'TI_ID';
      FieldDesc   := 'TI_DESCRIPCION';
      FieldBaja   := 'TI_FECHABAJA';
      ExtraFields := ', TI_VENCIMIENTO REQUIEREVENCIM, TI_BANCO REQUIEREBANCO, TI_TASA REQUIERETASA, TI_TASAREFERENCIA REQUIERETASAREFERENCIA ';
      ShowBajas   := False;
    end;

  with fraInstitucionAltaModif do
    begin
      TableName   := 'NNS_INSTITUCION ';
      FieldID     := 'NS_ID';
      FieldCodigo := 'NS_ID';
      FieldDesc   := 'NS_NOMBRE';
      FieldBaja   := 'NS_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraTasaRefAltaModif do
    begin
      TableName   := 'NTR_TASAREFERENCIA';
      FieldID     := 'TR_ID';
      FieldCodigo := 'TR_ID';
      FieldDesc   := 'TR_NOMBRE';
      FieldBaja   := 'TR_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraMonedaAltaModif do
    begin
      TableName   := 'NMO_MONEDA';
      FieldID     := 'MO_ID';
      FieldCodigo := 'MO_ID';
      FieldDesc   := 'MO_NOMBRE';
      FieldBaja   := 'MO_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraPlazoLiqAltaModif do
    begin
      TableName   := 'RCB_CLEARINGBANCARIO';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_DESCRIPCION';
      FieldBaja   := 'CB_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraGarantiaAltaModif do
    begin
      Clave     := 'IGTIA';
      ShowBajas := False;
    end;

  with fraCuentaAltaModif do
    begin
      TableName      := 'ZCB_CUENTABANCARIA';
      FieldID        := 'CB_ID';
      FieldCodigo    := 'CB_ID';
      FieldDesc      := 'CB_NUMERO || '' - '' || BA_NOMBRE';
      FieldBaja      := 'CB_FECHABAJA';
      ExtraTables    := ', ZBA_BANCO';
      ExtraCondition := 'AND BA_ID = CB_IDBANCO AND CB_INVERSIONES <> ''N'' AND BA_FECHABAJA IS NULL';
      ShowBajas      := False;
    end;

  with fraEmisorAltaModif do
    begin
      TableName   := 'NEM_EMISOR';
      FieldID     := 'EM_ID';
      FieldCodigo := 'EM_ID';
      FieldDesc   := 'EM_NOMBRE';
      FieldBaja   := 'EM_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraFiduciarioAltaModif do
    begin
      TableName   := 'NFI_FIDUCIARIO';
      FieldID     := 'FI_ID';
      FieldCodigo := 'FI_ID';
      FieldDesc   := 'FI_NOMBRE';
      FieldBaja   := 'FI_FECHABAJA';
      ShowBajas   := False;
    end;

  with fraTipoAltaModif do
    begin
      Clave     := 'ITIPO';
      ShowBajas := False;
    end;

  with fraGrupoAltaModif do
    begin
      Clave     := 'IGRUP';
      ShowBajas := False;
    end;

  lblMontoAltaModif.Visible      := False;
  edMontoAltaModif.Visible       := False;
  lblCuentaAltaModif.Visible     := False;
  fraCuentaAltaModif.Visible     := False;
  lblEmisorAltaModif.Visible     := True;
  fraEmisorAltaModif.Visible     := True;
  fraFiduciarioAltaModif.Visible := True;
  lblFiduciarioAltaModif.Visible := True;
  lblTipoAltaModif.Visible       := True;
  fraTipoAltaModif.Visible       := True;
  lblGrupoAltaModif.Visible      := True;
  fraGrupoAltaModif.Visible      := True;

  SetLength(TotalConsulta, MAXCOLS + 1);
  
  FieldBaja     := 'FECHA_BAJA';
  Sql.TableName := 'NIN_INSTRUMENTO';

  FIdPlazoFijoOriginal := ART_EMPTY_ID;
  FLimpiarControles    := True;
end;

procedure TfrmInvConsultarInstrumentos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraTipoInstrumento.Clear;
  fraInstitucion.Clear;
  fraTipo.Clear;
  fraGrupo.Clear;
  edFechaVencimDesde.Clear;
  edFechaVencimHasta.Clear;
  edFechaDesdeConst.Clear;
  edFechaHastaConst.Clear;
  edFechaEnCartera.Clear;
  edCodCajaVal.Clear;
  chkNoMostrarBajas.Checked := True;
  rgGrupoEcon.ItemIndex := 2;  // Todos
  edCantRegGrilla.Value := 0;
end;

procedure TfrmInvConsultarInstrumentos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('NOMINAL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('NOMINAL')).DisplayFormat := ' #,##0.00;- #,##0.00';

  if sdqConsulta.FieldByName('TASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TASA')).DisplayFormat := '% #,##0.000;-% #,##0.000';

  if sdqConsulta.FieldByName('MONTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTO')).Currency := True;

  if sdqConsulta.FieldByName('VALUACION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('VALUACION')).Currency := True;

  if sdqConsulta.FieldByName('INTERES_DEVENGADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('INTERES_DEVENGADO')).Currency := True;
end;

procedure TfrmInvConsultarInstrumentos.ClearControls;
begin
  if FLimpiarControles then
    begin
      fraTipoInstrumentoAltaModif.Clear;
      edDescripcionAltaModif.Clear;
      edConstitucionAltaModif.Clear;
      edVencimientoAltaModif.Clear;
      fraInstitucionAltaModif.Clear;
      edTasaAltaModif.Clear;
      fraTasaRefAltaModif.Clear;
      fraMonedaAltaModif.Clear;
      edPlazoAltaModif.Clear;
      edCodCajaValAltaModif.Clear;
      edCalificacionAltaModif.Clear;
      edCodigoSSNAltaModif.Clear;
      fraGarantiaAltaModif.Clear;
      fraPlazoLiqAltaModif.Clear;
      fraEmisorAltaModif.Clear;
      fraFiduciarioAltaModif.Clear;
      fraTipoAltaModif.Clear;
      fraGrupoAltaModif.Clear;
      chkGrupoEconAltaModif.Checked     := False;
      chkPrecancelableAltaModif.Checked := False;
      rgMercadoAltaModif.ItemIndex      := -1;
      fraCuentaAltaModif.Value          := Get_IdDefaultCuentaBancaria();
      edVersionAltaModif.Value          := 1;
    end;

  VCLExtra.LockControls([fraTipoInstrumentoAltaModif], False);
end;

procedure TfrmInvConsultarInstrumentos.DoCargarControles;
begin
  with sdqConsulta do
    begin
      fraTipoInstrumentoAltaModif.Value := FieldByName('IDTIPOINSTRUMENTO').AsInteger;
      edDescripcionAltaModif.Text       := FieldByName('DENOMINACION').AsString;
      edConstitucionAltaModif.Date      := FieldByName('CONSTITUCION').AsDateTime;
      edVencimientoAltaModif.Date       := FieldByName('VENCIMIENTO').AsDateTime;
      fraInstitucionAltaModif.Value     := FieldByName('IDINSTITUCION').AsInteger;
      edTasaAltaModif.Value             := FieldByName('TASA').AsFloat;
      fraTasaRefAltaModif.Value         := FieldByName('IDTASAREFERENCIA').AsInteger;
      fraMonedaAltaModif.Value          := FieldByName('IDMONEDA').AsInteger;
      edPlazoAltaModif.Value            := FieldByName('DIAS_PLAZO').AsInteger;
      edCodCajaValAltaModif.Text        := FieldByName('CODCAJAVALORES').AsString;
      edCalificacionAltaModif.Text      := FieldByName('CALIFICACION').AsString;
      chkGrupoEconAltaModif.Checked     := (FieldByName('GRUPOECON').AsString = 'S');
      edCodigoSSNAltaModif.Text         := FieldByName('CODIGO_SSN').AsString;
      chkPrecancelableAltaModif.Checked := (FieldByName('PRECANCELABLE').AsString = 'S');
      fraGarantiaAltaModif.Value        := FieldByName('CODGARANTIA').AsString;
      fraPlazoLiqAltaModif.Value        := FieldByName('IDPLAZOLIQ').AsInteger;
      fraEmisorAltaModif.Value          := FieldByName('IDEMISOR').AsInteger;
      fraFiduciarioAltaModif.Value      := FieldByName('IDDIFUCIARIO').AsInteger;
      fraTipoAltaModif.Value            := FieldByName('CODTIPO').AsString;
      fraGrupoAltaModif.Value           := FieldByName('CODGRUPO').AsString;
      rgMercadoAltaModif.ItemIndex      := Iif(FieldByName('CODMERCADO').AsString = 'P', 0, (Iif(FieldByName('CODMERCADO').AsString = 'S', 1, -1)));
      edVersionAltaModif.Value          := FieldByName('VERSION').AsInteger;
    end;
end;

procedure TfrmInvConsultarInstrumentos.LoadControls;
begin
  DoCargarControles;

  VCLExtra.LockControls([fraTipoInstrumentoAltaModif]);
end;

function TfrmInvConsultarInstrumentos.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
        begin
          if (ModoABM = maAlta) then
            begin
              FIdInstrumento := GetSecNextVal('INV.SEQ_NIN_ID');

              PrimaryKey.Add('IN_ID',        FIdInstrumento);
              Fields.Add('IN_FECHAALTA',     exDateTime);
              Fields.Add('IN_USUALTA',       Sesion.UserID);

              SqlType := stInsert;
            end
          else
            begin
              PrimaryKey.Add('IN_ID',        sdqConsulta.FieldByName('ID').AsInteger);
              Fields.Add('IN_FECHAMODIF',    exDateTime);
              Fields.Add('IN_USUMODIF',      Sesion.UserID);

              SqlType := stUpdate;
            end;

          Fields.Add('IN_IDTIPOINSTRUMENTO', fraTipoInstrumentoAltaModif.Value);
          Fields.Add('IN_DESCRIPCION',       Trim(edDescripcionAltaModif.Text));

          if edConstitucionAltaModif.IsEmpty then
            Fields.Add('IN_CONSTITUCION',    exNull)
          else
            Fields.Add('IN_CONSTITUCION',    edConstitucionAltaModif.Date);

          if edVencimientoAltaModif.IsEmpty then
            Fields.Add('IN_VENCIMIENTO',     exNull)
          else
            Fields.Add('IN_VENCIMIENTO',     edVencimientoAltaModif.Date);

          Fields.Add('IN_IDINSTITUCION',     fraInstitucionAltaModif.Value, True);
          Fields.Add('IN_TASA',              edTasaAltaModif.Value);
          Fields.Add('IN_IDTASAREFERENCIA',  fraTasaRefAltaModif.Value, True);
          Fields.Add('IN_IDMONEDA',          fraMonedaAltaModif.Value);
          Fields.Add('IN_PLAZO',             edPlazoAltaModif.Value, 0, True);
          Fields.Add('IN_CODCAJAVALORES',    Trim(edCodCajaValAltaModif.Text));
          Fields.Add('IN_CALIFICACION',      Trim(edCalificacionAltaModif.Text));
          Fields.Add('IN_GRUPOECONOMICO',    String(Iif(chkGrupoEconAltaModif.Checked, 'S', 'N')));
          Fields.Add('IN_CODIGOSSN',         Trim(edCodigoSSNAltaModif.Text));
          Fields.Add('IN_PRECANCELABLE',     String(Iif(chkPrecancelableAltaModif.Checked, 'S', 'N')));
          Fields.Add('IN_GARANTIA',          fraGarantiaAltaModif.Value);
          Fields.Add('IN_PLAZOLIQUIDACION',  fraPlazoLiqAltaModif.Value, 0, True);
          Fields.Add('IN_IDPFORIGINAL',      FIdPlazoFijoOriginal, True);
          Fields.Add('IN_IDEMISOR',          fraEmisorAltaModif.Value, True);
          Fields.Add('IN_IDFIDUCIARIO',      fraFiduciarioAltaModif.Value, True);
          Fields.Add('IN_TIPO',              fraTipoAltaModif.Value);
          Fields.Add('IN_GRUPO',             fraGrupoAltaModif.Value);
          Fields.Add('IN_MERCADO',           String(Iif(rgMercadoAltaModif.ItemIndex = 0, 'P', (Iif(rgMercadoAltaModif.ItemIndex = 1, 'S', '')))));
          Fields.Add('IN_VERSION',           edVersionAltaModif.Value, 0, True);
        end
      else if ModoABM = maBaja then
        begin
          PrimaryKey.Add('IN_ID',            sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('IN_FECHABAJA',         exDateTime);
          Fields.Add('IN_USUBAJA',           Sesion.UserID);

          SqlType := stUpdate;
        end
    end;

  Result := inherited DoABM;
end;

function TfrmInvConsultarInstrumentos.Validar: Boolean;
var
  sSql: String;
  FVencim: TDateTime;
  bEsPlazoFijo: Boolean;
  Id: TTableId;
begin
  bEsPlazoFijo := edMontoAltaModif.Visible;

  Verificar(fraTipoInstrumentoAltaModif.IsEmpty, fraTipoInstrumentoAltaModif, 'El tipo de instrumento es obligatorio.');
  Verificar(IsEmptyString(edDescripcionAltaModif.Text), edDescripcionAltaModif, 'La denominación es obligatoria.');
  Verificar(bEsPlazoFijo and edConstitucionAltaModif.IsEmpty, edConstitucionAltaModif, 'La fecha de constitución es obligatoria.');
  Verificar(bEsPlazoFijo and (edPlazoAltaModif.Value <= 0), edPlazoAltaModif, 'El plazo es obligatorio.');
  Verificar((fraTipoInstrumentoAltaModif.sdqDatos.FieldByName('REQUIEREVENCIM').AsString = 'S') and edVencimientoAltaModif.IsEmpty, edVencimientoAltaModif, 'El vencimiento es obligatorio.');
//*** REACTIVAR ***     Verificar(not edVencimientoAltaModif.IsEmpty and (edVencimientoAltaModif.Date < DBDate()), edVencimientoAltaModif, 'El vencimiento no puede ser menor a la fecha actual.');
  Verificar((fraTipoInstrumentoAltaModif.sdqDatos.FieldByName('REQUIEREBANCO').AsString = 'S') and fraInstitucionAltaModif.IsEmpty, fraInstitucionAltaModif, 'La institución es obligatoria.');
  Verificar((fraTipoInstrumentoAltaModif.sdqDatos.FieldByName('REQUIERETASA').AsString = 'S') and (edTasaAltaModif.Value <= 0), edTasaAltaModif, 'La tasa debe ser mayor a 0.');
  Verificar((fraTipoInstrumentoAltaModif.sdqDatos.FieldByName('REQUIERETASAREFERENCIA').AsString = 'S') and fraTasaRefAltaModif.IsEmpty, fraTasaRefAltaModif, 'La tasa de referencia es obligatoria.');
  Verificar(fraMonedaAltaModif.IsEmpty, fraMonedaAltaModif, 'La moneda es obligatoria.');

  if ModoABM = maModificacion then
    Id := sdqConsulta.FieldByName('ID').AsInteger
  else
    Id := 0;

  Verificar(edVersionAltaModif.Value <= 0, edVersionAltaModif, 'La versión es obligatoria.');
  Verificar(not IsEmptyString(edCodCajaValAltaModif.Text) and Is_ExisteCodCajaValores(Id, Trim(edCodCajaValAltaModif.Text), edVersionAltaModif.Value), edCodCajaValAltaModif, 'El código de caja de valores/certificado y versión ya existen.');

  if ModoABM = maModificacion then
    begin
      if not edConstitucionAltaModif.IsEmpty then
        begin
          sSql := 'SELECT NVL(MIN(CU_VENCIMIENTO), :Default)' +
                    'FROM NCU_CUPON ' +
                   'WHERE CU_FECHABAJA IS NULL ' +
                     'AND CU_IDINSTRUMENTO = :IdInstrumento';
          FVencim := ValorSqlDateTimeEx(sSql, [TDateTimeEx.Create(edConstitucionAltaModif.Date), sdqConsulta.FieldByName('ID').AsInteger]);

          Verificar(edConstitucionAltaModif.Date > FVencim, edConstitucionAltaModif, 'No puede existir un cupón con fecha anterior a la fecha de constitución del instrumento.');
        end;

      if not edVencimientoAltaModif.IsEmpty then
        begin
          sSql := 'SELECT NVL(MAX(CU_VENCIMIENTO), :Default) ' +
                    'FROM NCU_CUPON ' +
                   'WHERE CU_FECHABAJA IS NULL ' +
                     'AND CU_IDINSTRUMENTO = :IdInstrumento';
          FVencim := ValorSqlDateTimeEx(sSql, [TDateTimeEx.Create(edVencimientoAltaModif.Date), sdqConsulta.FieldByName('ID').AsInteger]);

          Verificar(edVencimientoAltaModif.Date < FVencim, edVencimientoAltaModif, 'No puede existir un cupón con fecha posterior a la fecha de vencimiento del instrumento.');
        end;
    end;

  Verificar(bEsPlazoFijo and (edMontoAltaModif.Value <= 0), edMontoAltaModif, 'El monto es obligatorio.');
  Verificar(bEsPlazoFijo and fraCuentaAltaModif.Visible and fraCuentaAltaModif.IsEmpty, fraCuentaAltaModif, 'La cuenta es obligatoria.');

  Result := True;
end;

procedure TfrmInvConsultarInstrumentos.tbConsCuponesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(not sdqConsulta.FieldByName(FieldBaja).IsNull, nil, 'El instrumento se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('REQUIERECUPON').AsString <> 'S', nil, 'Debe seleccionar un instrumento que requiera un cupón.');

  with TfrmInvConsultarCupones.Create(nil) do
    try
      IdInstrumento := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmInvConsultarInstrumentos.tbConsOperacionesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(not sdqConsulta.FieldByName(FieldBaja).IsNull, nil, 'El instrumento se encuentra dado de baja.');

  with TfrmInvConsultarOperaciones.Create(nil) do
    try
      IdInstrumento := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;                 
end;

procedure TfrmInvConsultarInstrumentos.DoCalcularAdic(Sender: TObject);
begin
  if not edConstitucionAltaModif.IsEmpty and (edPlazoAltaModif.Value > 0) and ((ModoABM = maAlta) or ((ModoABM = maModificacion) and ((edConstitucionAltaModif.Date <> sdqConsulta.FieldByName('CONSTITUCION').AsDateTime) or (edPlazoAltaModif.Value <> sdqConsulta.FieldByName('DIAS_PLAZO').AsInteger)))) then
    edVencimientoAltaModif.Date :=  edConstitucionAltaModif.Date + edPlazoAltaModif.Value
  else if not edConstitucionAltaModif.IsEmpty and not edVencimientoAltaModif.IsEmpty and (edVencimientoAltaModif.Date > edConstitucionAltaModif.Date) and ((ModoABM = maAlta) or ((ModoABM = maModificacion) and ((edConstitucionAltaModif.Date <> sdqConsulta.FieldByName('CONSTITUCION').AsDateTime) or (edVencimientoAltaModif.Date <> sdqConsulta.FieldByName('VENCIMIENTO').AsDateTime)))) then
    edPlazoAltaModif.Value := edVencimientoAltaModif.Date - edConstitucionAltaModif.Date;
end;

procedure TfrmInvConsultarInstrumentos.tbConsLicitacionesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(not sdqConsulta.FieldByName(FieldBaja).IsNull, nil, 'El instrumento se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('REQUIERELICITACION').AsString <> 'S', nil, 'Debe seleccionar un instrumento que requiera una licitación.');

  with TfrmInvLicitaciones.Create(nil) do
    try
      IdInstrumento := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

class function TfrmInvConsultarInstrumentos.DoAltaPlazoFijo(Denominacion: String; IdPlazoFijoOriginal: TTableId; Monto: Double): Boolean;
var
  bEsRenovacion: Boolean;
begin
  with TfrmInvConsultarInstrumentos.Create(nil) do
    begin
      bEsRenovacion := (IdPlazoFijoOriginal <> ART_EMPTY_ID);

      lblMontoAltaModif.Visible      := True;
      edMontoAltaModif.Visible       := True;
      lblCuentaAltaModif.Visible     := True;
      fraCuentaAltaModif.Visible     := True;
      lblEmisorAltaModif.Visible     := False;
      fraEmisorAltaModif.Visible     := False;
      fraFiduciarioAltaModif.Visible := False;
      lblFiduciarioAltaModif.Visible := False;
      lblTipoAltaModif.Visible       := False;
      fraTipoAltaModif.Visible       := False;
      lblGrupoAltaModif.Visible      := False;
      fraGrupoAltaModif.Visible      := False;

      fraTipoInstrumentoAltaModif.ExtraCondition := 'AND TI_PLAZOFIJO = ''S''';
      FIdPlazoFijoOriginal                       := IdPlazoFijoOriginal;

      if bEsRenovacion then
        begin
          tbRefrescar.Click;
          DoCargarControles;
        end;

      edDescripcionAltaModif.Text := Denominacion;
      edMontoAltaModif.Value      := Monto;
      
      FLimpiarControles := not bEsRenovacion;
      try
        tbNuevo.Click;
      finally
        FLimpiarControles := True;
      end;

      if OkABM then
        DoInsertarOperacionInstrumento(True, FIdInstrumento, edMontoAltaModif.Value, edMontoAltaModif.Value, edConstitucionAltaModif.Date, False, fraCuentaAltaModif.Value);

      Result := OkABM;
      tbSalir.Click;
    end;
end;

procedure DoInsertarOperacionInstrumento(ConTrans: Boolean; IdInstrumento: TTableID; Monto, Residual: Double; Constitucion: TDateTime; EsCancelacion: Boolean; IdCuentaBancaria: TTableId);
var
  sSql: String;
begin
  sSql := 'INSERT INTO NOI_OPERACIONINSTRUMENTO(OI_ID, OI_IDTIPOOPERACION, OI_IDINSTRUMENTO, OI_MONTO, OI_FECHA, ' +
                                               'OI_FECHAALTA, OI_USUALTA, OI_IMPORTENOMINAL, OI_IMPORTERESIDUAL, ' +
                                               'OI_IDCUENTABANCARIA, OI_CONTABILIZADO) ' +
               'SELECT INV.SEQ_NOI_ID.NEXTVAL, TO_ID, :IdInstrumento, :Monto, :Constitucion, SYSDATE, :Usuario, :Nominal, :Residual, ' +
                      'DECODE(:CuentaBancaria, 0, NULL, :CuentaBancaria), NULL ' +
                 'FROM NTO_TIPOOPERACION ' +
                'WHERE TO_FECHABAJA IS NULL ' +
                  'AND TO_SIGNO = :Signo ' +
                  'AND TO_PLAZOFIJO = ''S''';

  if ConTrans then
    EjecutarSqlSTEx(sSql, [IdInstrumento, Monto, TDateTimeEx.Create(Constitucion), Sesion.UserID, Iif(EsCancelacion, 0, Residual), Residual, IdCuentaBancaria, IdCuentaBancaria, Integer(Iif(EsCancelacion, -1, 1))])
  else
    EjecutarSqlEx(sSql,   [IdInstrumento, Monto, TDateTimeEx.Create(Constitucion), Sesion.UserID, Iif(EsCancelacion, 0, Residual), Residual, IdCuentaBancaria, IdCuentaBancaria, Integer(Iif(EsCancelacion, -1, 1))])
end;

procedure TfrmInvConsultarInstrumentos.tbNuevoClick(Sender: TObject);
var
  sDescripcion: String;
begin
  if edMontoAltaModif.Visible then     // es un plazo fijo
    begin
      ModoABM := maAlta;
      ModoABMToSqlType;
      sDescripcion := edDescripcionAltaModif.Text;
      ClearControls;
      edDescripcionAltaModif.Text := sDescripcion;
      if AutoLock then
        LockControls(False);
      fpABM.Caption := CAPTION_ALTA;
      OkABM := (fpABM.ShowModal = mrOk);
    end
  else
    inherited;
end;

procedure TfrmInvConsultarInstrumentos.tbPrevisionClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(not sdqConsulta.FieldByName('FECHA_BAJA').IsNull, nil, 'El instrumento se encuentra dado de baja.');

  with TfrmInvPrevision.Create(nil) do
    try
      IdInstrumento := Self.sdqConsulta.FieldByName('ID').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmInvConsultarInstrumentos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos, iCantDec: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    begin
      if CAMPOS_SUMA[iPos] = 'RESIDUAL' then
        iCantDec := 0
      else
        iCantDec := 2;

      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$', iCantDec);
    end;
end;

procedure TfrmInvConsultarInstrumentos.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        begin
          SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
          edCantRegGrilla.Value := sdqConsulta.RecordCount;
        end
      else
        edCantRegGrilla.Value := 0;
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmInvConsultarInstrumentos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmInvConsultarInstrumentos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmInvConsultarInstrumentos.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmInvConsultarInstrumentos.mnuImpCondicEmisionClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'La grilla está vacía.');
  Verificar(not sdqConsulta.FieldByName(FieldBaja).IsNull, nil, 'El instrumento se encuentra dado de baja.');
  Verificar(sdqConsulta.FieldByName('IDINSTRUMENTOENANALISIS').IsNull, nil, 'El instrumento no tiene condiciones de emisión.');

  DoImprimirInstrumentoAnalisis(sdqConsulta.FieldByName('IDINSTRUMENTOENANALISIS').AsInteger);
end;

function TfrmInvConsultarInstrumentos.Is_ExisteArchivoInstrAnalisisFilaActual(var NombreArchivo: String): Boolean;
var
  Id: TTableId;
  bExiste: Boolean;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      Id := sdqConsulta.FieldByName('IDNIA').AsInteger;

      bExiste := Is_ExisteArchivoInstrumentoAnalisis(Id, NombreArchivo);
    end
  else
    bExiste := False;

  Result := bExiste;
end;

procedure TfrmInvConsultarInstrumentos.tbVisualizarAdjuntoClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, nil, 'No hay registros en la grilla.');
  Verificar(not Is_ExisteArchivoInstrAnalisisFilaActual(sNombreArchivo), nil, 'El instrumento en análisis no tiene un archivo adjunto.');

  Do_ImprimirArchivoInstrumentoAnalisis(sNombreArchivo);
end;

end.

