unit unTarifasMasivas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QueryPrint, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, PatternEdit, IntEdit, ComCtrls, StdCtrls, unArtFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Mask, ToolEdit, ExtCtrls, AnsiSql, unArt, unFraCodigoDescripcion, unFraUsuario, ToolWin,
  QueryToFile, ExportDialog, SortDlg, unArtDBAwareFrame, unFraCodDesc, Excel2000, OleServer, Variants,
  RxToolEdit;

type
  TfrmTarifasMasivas = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edFilename: TFilenameEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edTotal: TIntEdit;
    edError: TIntEdit;
    edCorrectos: TIntEdit;
    Grid: TArtDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    fraCtbTablasCorreo: TfraStaticCTB_TABLAS;
    fraCodigoCodTexto: TfraStaticCodigoDescripcion;
    fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS;
    fraCodigoCodFirmante: TfraStaticCodigoDescripcion;
    Label2: TLabel;
    fraEN_MOTIVO: TfraStaticCTB_TABLAS;
    Label10: TLabel;
    fraCodigoModulo: TfraStaticCodigoDescripcion;
    Label12: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    ToolButton4: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton6: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    btnCargar: TButton;
    BarProgreso: TProgressBar;
    tbGuardar: TToolButton;
    SortDialog: TSortDialog;
    ExportDialog: TExportDialog;
    ToolBar1: TToolBar;
    tbFormatoContrato: TToolButton;
    fraUsuarioAutoriza: TfraCodDesc;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    ExcelApp: TExcelApplication;
    procedure btnCargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbFormatoContratoClick(Sender: TObject);
  private
    FContrato: TTableID;
    FContratoInexistente: Boolean;
    FFecha: String;
    FMensajeError: String;
    FPorcVariable: Currency;
    FSql: TSql;
    FSumaFija: Currency;
    FTotalErrores: Integer;
    FTotalLineas: Integer;

    function GetActividadId(const aCiiu: String; const aActividadId: Integer): Integer;
    function GetCountLineasExcel: Integer;
    function IsEmptyLine(const aValor1: String): Boolean;
    function SuperiorSSN: Boolean;
    function Validar: Boolean;

    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure CargarQuery;
    procedure ClearControls;
    procedure FinalizarLinea(const aFila: Integer);
    procedure fraCodigoModuloOnChange(Sender: TObject);
    procedure GrabaEndosoTemporal(sdqArchivo: TSDQuery);
    procedure GuardarRegistros;
    procedure InicializarComponentes;
    procedure LeerCampo(const aValor: String; const aPosicion: Integer);
    procedure LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
    procedure ProcesarExcel;
  public
  end;

var
  frmTarifasMasivas: TfrmTarifasMasivas;

implementation

uses
  unDmPrincipal, VCLExtra, StrFuncs, unPrincipal, SqlFuncs, unAfiliaciones, CustomDlgs, unComunes, Menus, DateTimeFuncs,
  General;

{$R *.DFM}

procedure Verificar(aCondicion: Boolean; aControl: TWinControl; aText: String);
begin
  if aCondicion then
  begin
    InvalidMsg(aControl, aText);
    Abort;
  end;
end;

procedure TfrmTarifasMasivas.btnCargarClick(Sender: TObject);
var
  sSql: String;
begin
  //Reinicia la tabla que muestra los errores
  Verificar(edFilename.Text = '', edFilename, 'Debe elegir un archivo para procesar.');

  sSql :=
    'DELETE FROM tmp_tarifamasiva' +
         ' WHERE mp_usuario = :usuario';
  EjecutarSqlEx(sSql, [frmPrincipal.DBLogin.UserId]);

  FTotalLineas  := 0;
  FTotalErrores := 0;

  //Toma el nombre del archivo
  edFilename.Text := Trim(StrReplace(edFilename.Text, '"', ''));
  ProcesarExcel;

  //Termino el proceso, muestro los resultados
  edTotal.Value := FTotalLineas;
  edError.Value := FTotalErrores;
  edCorrectos.Value := FTotalLineas - FTotalErrores;
  CargarQuery;

  VCLExtra.EnableControls([tbGuardar, tbImprimir, tbExportar, tbOrdenar], True);
  MessageDlg('El proceso ha terminado.', mtInformation, [mbOK], 0);
end;

procedure TfrmTarifasMasivas.ClearControls;
var
  sSql: String;
begin
  VCLExtra.LockControls([edTotal, edError, edCorrectos], True);
  VCLExtra.EnableControls([tbGuardar, tbImprimir, tbExportar, tbOrdenar], False);
  edFilename.Clear;
  BarProgreso.Position := 0;
  edTotal.Clear;
  edError.Clear;
  edCorrectos.Clear;
  sdqConsulta.Close;
  FSql.Clear;
  FSql.SqlType := stInsert;

  sSql :=
    'SELECT tb_codigo' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''CORRE''' +
      ' AND tb_especial1 = ''D''';
  fraCtbTablasCorreo.Value := ValorSql(sSql);
end;

procedure TfrmTarifasMasivas.FormCreate(Sender: TObject);
begin
  inherited;

  FSql := TSql.Create('tmp_tarifamasiva');
  InicializarComponentes;
  ClearControls;
  frmPrincipal.mnuGenTarifasMasivas.Enabled := False;
end;


procedure TfrmTarifasMasivas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSql.Free;
  Action := caFree;
  frmPrincipal.mnuGenTarifasMasivas.Enabled := True;
  frmTarifasMasivas := nil;

  inherited;
end;

procedure TfrmTarifasMasivas.CargarQuery;
var
  sSql: String;
begin
  sSql :=
    'SELECT   tmp_tarifamasiva.*, em_nombre, em_cuit' +
       ' FROM tmp_tarifamasiva, aco_contrato, aem_empresa' +
      ' WHERE mp_usuario = :usuario' +
        ' AND mp_valido = ''N''' +
        ' AND co_idempresa = em_id(+)' +
        ' AND mp_contrato = co_contrato(+)' +
   ' ORDER BY mp_nrolinea';
  OpenQueryEx(sdqConsulta, [frmPrincipal.DBLogin.UserId], sSql, True);
end;

function TfrmTarifasMasivas.GetActividadId(const aCiiu: String; const aActividadId: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id' +
     ' FROM cac_actividad' +
    ' WHERE TO_NUMBER(ac_codigo) = TO_NUMBER(:codigo)';
  Result := ValorSqlIntegerEx(sSql, [aCiiu], aActividadId);
end;

function TfrmTarifasMasivas.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
      if IsEmptyLine(Range['A' + IntToStr(iLineNumber), 'A' + IntToStr(iLineNumber)].Value2) then
        iRangoHasta := iLineNumber
      else
        iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmTarifasMasivas.IsEmptyLine(const aValor1: String): Boolean;
begin
  Result := (aValor1 = '');
end;

function TfrmTarifasMasivas.SuperiorSSN: Boolean;
var
  aSqlResults: TStringList;
  cAlicuotaPesos: Currency;
  cPorcSSN: Currency;
  cTarSSN: Currency;
  sSql: String;
begin
  Result := False;

  if FContrato <> ART_EMPTY_ID then
  begin
    sSql :=
      'SELECT co_nivel, co_idactividad' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = ' + SqlValue(FContrato);
    aSqlResults := ValoresColSQL(sSql);
    try
      TarifaSSN(aSqlResults[0], StrToIntDef(aSqlResults[1], 0), FFecha, cTarSSN, cPorcSSN);
    finally
      aSqlResults.Free;
    end;

    //pedido por Callo y Magallanes
    //24/10/2012
    //cTarSSN        := cTarSSN * 1.15 + 0.60;
    cTarSSN        := (cTarSSN - Get_Trf_Hipoacusia(StrToDate(FFecha))) * 1.15 + Get_Trf_Hipoacusia(StrToDate(FFecha));

    cAlicuotaPesos := FSumaFija + Get_Trf_Hipoacusia(StrToDate(FFecha));

    if cAlicuotaPesos > cTarSSN then
      Result := True;
  end;
end;

procedure TfrmTarifasMasivas.GrabaEndosoTemporal(sdqArchivo: TSDQuery);
var
  IDEndoso    : TTableId; //Corresponde al ultimo endoso NO TEMPORAL
  IdEndosoTemp: TTableId;
  IdCarta     : TTableId;
  sSqlTrans1  : TSQL;
  Tarifa      : RecTarifa;

  function Elegir(aValor1, aValor2: Extended): Extended;
  begin
    if Abs(aValor1) > 0 then
      Result := aValor1
    else if Abs(aValor2) > 0 then
      Result := -aValor2
    else
      Result := 0;
  end;

  function GetTipoLote(const aContrato: Integer; const aSumaFija, aPorcMasa, aSumaFijaIncumplimiento,
                       aPorcMasaIncumplimiento: Currency): String;
  var
    sSql: String;
  begin
    sSql :=
      'SELECT   tc_sumafijatarifa, tc_porcmasatarifa, tc_incumplido_sumafija, tc_incumplido_porcmasa' +
         ' FROM atc_tarifariocontrato' +
        ' WHERE tc_contrato = :contrato' +
     ' ORDER BY tc_vigenciatarifa DESC';
    with GetQueryEx(sSql, [aContrato]) do
    try
      if IsEmpty then
        Result := 'A'
      else
      begin
        if ((FieldByName('tc_sumafijatarifa').AsCurrency <> aSumaFija) or (FieldByName('tc_porcmasatarifa').AsCurrency <> aPorcMasa)) and
           ((FieldByName('tc_incumplido_sumafija').AsCurrency <> aSumaFijaIncumplimiento) or (FieldByName('tc_incumplido_porcmasa').AsCurrency <> aPorcMasaIncumplimiento)) then
          Result := 'A'
        else if (FieldByName('tc_incumplido_sumafija').AsCurrency <> aSumaFijaIncumplimiento) or (FieldByName('tc_incumplido_porcmasa').AsCurrency <> aPorcMasaIncumplimiento) then
          Result := 'B'
        else
          Result := 'X';
      end;
    finally
      Free;
    end;
  end;

begin
  sSqlTrans1 := TSQL.Create('tmp.tet_endosotarifa');
  try
    sSqlTrans1.SqlType := stInsert;
    IdEndosoTemp := ValorSqlInteger('SELECT seq_tet_id.NEXTVAL FROM DUAL');

    with sdqArchivo do
    begin
      // Obtiene el ID del Ultimo endoso
      IDEndoso := FieldByName('ult_endoso').AsInteger;

      ///////////////////////
      //  ENDOSO TEMPORAL  //
      ///////////////////////
      sSqlTrans1.PrimaryKey.Add('et_id',   IdEndosoTemp, False);
      sSqlTrans1.Fields.Add('et_contrato', FieldByName('mp_contrato').AsInteger, False);

      // Datos de la tarifa
      // Obtengo los datos de la ultima tarifa para generar la nueva
      GetTarifaFromEndoso(IdEndoso, Tarifa, False);

      ///////////////////////////
      //  Ingreso los cambios  //
      ///////////////////////////
      //A pesar de que se llama SumaFija, en realidad corresponde a ALICUOTAPESOS
      Tarifa.SubTotal3Pesos := FieldByName('mp_sumafija').AsCurrency;
      Tarifa.SubTotal3Porc  := FieldByName('mp_porcmasa').AsCurrency;

      Tarifa.FinalPesos := Tarifa.SubTotal3Pesos + FieldByName('mp_incumplido_sumafija').AsCurrency + 0.60;
      Tarifa.FinalPorc  := FieldByName('mp_porcmasa').AsCurrency;

      //Recalculo todo
      SetTarifaInv(Tarifa, 0{Tarifa.AporteFondo}, Tarifa.AporteSRT);

      //Lo grabo
      sSqlTrans1.Fields.AddExtended('et_porcmasatarifa',       Tarifa.PorcMasaTarifa, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_sumafija',             FieldByName('mp_sumafija').AsCurrency, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_sumafijatarifa',       Tarifa.SumaFijaTarifa, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_porcmasa',             Tarifa.FinalPorc, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_alicuotapesos',        Tarifa.FinalPesos, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_porcdescvolumen',      Tarifa.RebajaVolumenVal, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_porcdescnivel',        Tarifa.RebajaHSVal, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_recargosin',           Elegir(Tarifa.RecargoSinVarVal, Tarifa.RebajaSinVarVal), ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_recargosin_sobrefijo', Elegir(Tarifa.RecargoSinSFijoVal, Tarifa.RebajaSinSFijoVal), ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_recargosin_montofijo', Elegir(Tarifa.RCSMF, Tarifa.RBSMF), ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_recargoesp',           Elegir(Tarifa.RecargoEspVal, Tarifa.RebajaEspVal), ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_recargoesp_sobrefijo', Elegir(Tarifa.RecargoEspSFijoVal, Tarifa.RebajaEspSFijoVal), ALL_DECIMALS, False);
      sSqlTrans1.Fields.Add('et_idactividad',                  GetActividadId(FieldByName('mp_ciiu').AsString, FieldByName('co_idactividad').AsInteger));
      sSqlTrans1.Fields.AddDate('et_incumplido_desde',         ValorSqlDateTimeEx('SELECT LAST_DAY(ADD_MONTHS(:vigenciahasta, 6)) + 1 FROM DUAL', [TDateTimeEx.Create(FieldByName('co_vigenciahasta').AsDateTime)]), True);
      sSqlTrans1.Fields.AddExtended('et_incumplido_sumafija',  FieldByName('mp_incumplido_sumafija').AsCurrency, ALL_DECIMALS, False);
      sSqlTrans1.Fields.AddExtended('et_incumplido_porcmasa',  FieldByName('mp_incumplido_porcmasa').AsCurrency, ALL_DECIMALS, False);
      sSqlTrans1.Fields.Add('et_tipolote',                     GetTipoLote(FieldByName('mp_contrato').AsInteger,
                                                                           Tarifa.FinalPesos, Tarifa.FinalPorc,
                                                                           FieldByName('mp_incumplido_sumafija').AsCurrency,
                                                                           FieldByName('mp_incumplido_porcmasa').AsCurrency));
      sSqlTrans1.Fields.Add('et_cantestablecimientosact',      FieldByName('mp_cantestablecimientosact').AsInteger);

      //resto de los datos del endoso
      sSqlTrans1.Fields.Add('et_enviosrt',        'S', dtChar);
      sSqlTrans1.Fields.Add('et_motivo',          fraEN_MOTIVO.Value);
      sSqlTrans1.Fields.Add('et_idactividad2',    FieldByName('co_idactividad2').AsInteger);
      sSqlTrans1.Fields.Add('et_idactividad3',    FieldByName('co_idactividad3').AsInteger);
      sSqlTrans1.Fields.Add('et_nivel',           FieldByName('co_nivel').AsString);
      sSqlTrans1.Fields.Add('et_vigenciaendoso',  FieldByName('mp_vigenciaendoso').AsDateTime);
      sSqlTrans1.Fields.Add('et_vigenciatarifa',  FieldByName('mp_vigenciaendoso').AsDateTime);
      sSqlTrans1.Fields.Add('et_fechaautoriza',   FieldByName('mp_vigenciaendoso').AsDateTime);
      sSqlTrans1.Fields.Add('et_usuarioautoriza', fraUsuarioAutoriza.Codigo);

      sSqlTrans1.Fields.Add('et_usualta', frmPrincipal.DBLogin.UserId);
      sSqlTrans1.Fields.Add('et_fechaalta', SQL_ACTUALDATE, false);
      EjecutarSQLST(sSqlTrans1.Sql);

      ///////////////////////
      //  CARTA DOCUMENTO  //
      ///////////////////////
      sSqlTrans1.Clear;
      sSqlTrans1.TableName := 'cca_carta';

      //ID de la carta
      IdCarta := GetSecNextVal('SEQ_CCA_ID');
      sSqlTrans1.PrimaryKey.Add('ca_id', IdCarta);

      //Resto de los campos
      sSqlTrans1.Fields.Add('ca_idformulario', FieldByName('co_idformulario').AsInteger);
      sSqlTrans1.Fields.Add('ca_idendoso',     IDEndoso);
      sSqlTrans1.Fields.Add('ca_idendosotemp', IDEndosoTemp);
      sSqlTrans1.Fields.Add('ca_manual',       'N');
      sSqlTrans1.Fields.Add('ca_idareatexto',  fraCodigoModulo.Value);
      sSqlTrans1.Fields.Add('ca_idtextocarta', fraCodigoCodTexto.Value);
      sSqlTrans1.Fields.Add('ca_correo',       fraCtbTablasCorreo.Value);
      sSqlTrans1.Fields.Add('ca_idfirma',      fraCodigoCodFirmante.Value);
      sSqlTrans1.Fields.Add('ca_tiposalida',   fraCtbTablasTipoSalida.Value);
      sSqlTrans1.Fields.Add('ca_textofinal',   SQL_NULL, False);
      sSqlTrans1.Fields.Add('ca_iddelegacion', frmPrincipal.DBLogin.Delegacion);
      sSqlTrans1.Fields.Add('ca_usualta',      frmPrincipal.DBLogin.UserID);
      sSqlTrans1.Fields.Add('ca_fechaalta',    DBDateTime);
      EjecutarSQLST(sSqlTrans1.Sql);
    end; 
  finally
    sSqlTrans1.Free;
  end;
end;

procedure TfrmTarifasMasivas.InicializarComponentes;
begin
  with fraCodigoModulo do
  begin
    TableName   := 'cat_areatexto';
    FieldID     := 'at_id';
    FieldCodigo := 'at_id';
    FieldDesc   := 'at_descripcion';
    FieldBaja   := 'at_fechabaja';
    ShowBajas   := False;
    Sql         := 'SELECT DISTINCT at_id ' + CD_ALIAS_ID + ',' +
                         ' at_id ' + CD_ALIAS_CODIGO + ',' +
                         ' at_descripcion ' + CD_ALIAS_DESC + ',' +
                         ' at_fechabaja ' + CD_ALIAS_BAJA +
                    ' FROM cat_areatexto, cau_areausuario' +
                   ' WHERE at_id = au_idareatexto' +
                     ' AND au_usuario = ' + SqlValue(frmPrincipal.DBLogin.UserId) +
                     ' AND au_fechabaja IS NULL' +
                     ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    OnChange    := fraCodigoModuloOnChange;
  end;

  with fraCodigoCodTexto do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_id';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := False;
  end;

  with fraCtbTablasCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;
  end;

  with fraUsuarioAutoriza do
  begin
    Propiedades.Sql :=
      'SELECT *' +
       ' FROM (' +
            'SELECT se_usuario id, se_usuario codigo, se_nombre descripcion, se_fechabaja baja' +
             ' FROM use_usuarios' +
            ' WHERE se_usuario IN (''CFLORIO'', ''FMFIRENZE'', ''MFERNANDEZ'', ''MIPARRAGUIRRE'', ''MMAGALLANES'')' +
        ' UNION ALL' +
           ' SELECT ''COMITE'' id, ''COMITE'' codigo, ''Comité de Negocios'' descripcion, NULL baja' +
             ' FROM dual) usuarios' +
      ' WHERE 1 = 1 ';
  end;

  with fraCodigoCodFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;
  end;

  with fraCtbTablasTipoSalida do
  begin
    Clave       := 'TSCDO';
    ShowBajas   := False;
  end;

  fraEN_MOTIVO.Clave     := 'MOTEN';
  fraEN_MOTIVO.Especial1 := '1'; //Muestra solo los relacionados con tarifas
end;

function TfrmTarifasMasivas.Validar: Boolean;
begin
  Verificar(fraCodigoModulo.IsEmpty, fraCodigoModulo, 'El módulo es obligatorio.');
  Verificar(fraCodigoCodTexto.IsEmpty, fraCodigoCodTexto, 'El texto es obligatorio.');
  Verificar(fraCodigoCodFirmante.IsEmpty, fraCodigoCodFirmante, 'El firmante es obligatorio.');
  Verificar(fraCtbTablasTipoSalida.IsEmpty, fraCtbTablasTipoSalida, 'El formato es obligatorio.');
  Verificar(fraCtbTablasCorreo.IsEmpty, fraCtbTablasCorreo, 'El correo es obligatorio.');
  Verificar(fraUsuarioAutoriza.IsEmpty, fraUsuarioAutoriza, 'El Usuario que autoriza es obligatorio.');
  Verificar(fraUsuarioAutoriza.isBaja, fraUsuarioAutoriza, 'El Usuario que autoriza debe estar activo.');
  Verificar(fraEN_MOTIVO.IsEmpty, fraEN_MOTIVO, 'El motivo es obligatorio.');

  Result := True;
end;

procedure TfrmTarifasMasivas.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  MenuGrilla: TPopUpMenu;
  Item: TMenuItem;
begin
  //Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'
  MenuGrilla := TPopUpMenu.Create(Self);
  Item := TMenuItem.Create(Self);
  try
    if sdqConsulta.Active and (not sdqConsulta.Eof) then
    begin
      Item.Caption := 'Marcar Todos';
      Item.OnClick := btnMarcarTodos;
      MenuGrilla.Items.Add(Item);

      Item := TMenuItem.Create(Self);
      Item.Caption := 'Desmarcar Todos';
      Item.OnClick := btnDesMarcarTodos;
      MenuGrilla.Items.Add(Item);
    end
    else
    begin
      Item.Caption := '( Consulta sin datos... )';
      Item.Enabled := False;
      MenuGrilla.Items.Add(Item);
    end;
    MenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    MenuGrilla.Free;
    Item.Free;
  end;
end;

procedure TfrmTarifasMasivas.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmTarifasMasivas.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmTarifasMasivas.FinalizarLinea(const aFila: Integer);
var
  sSql: String;
begin
  if SuperiorSSN then
    FMensajeError := FMensajeError + 'La tarifa se encuentra por encima del valor dado por la SSN.';

  if FMensajeError = '' then
    FSql.Fields.Add('mp_valido', 'S')
  else //Muestra el error
  begin
    Inc(FTotalErrores);
    FMensajeError := Copy(FMensajeError, 1, 190); // Limita la cantidad de caracteres
    FSql.Fields.Add('mp_error',  FMensajeError);
    FSql.Fields.Add('mp_valido', 'N');
  end;
  FSql.Fields.Add('mp_usuario',  frmPrincipal.DBLogin.UserID);
  FSql.Fields.Add('mp_nrolinea', aFila);

  Inc(FTotalLineas);
  try
    EjecutarSql(FSql.Sql);
  except
    //Indica que se produjo un error inesperado al grabar los datos
    //y permite continuar con el proceso
    on E:Exception do
    begin
      sSql :=
        'INSERT INTO tmp_tarifamasiva' +
                   ' (mp_usuario, mp_nrolinea, mp_error, mp_valido)' +
            ' VALUES (:usuario, :nrolinea, :error, ''N'')';
      EjecutarSqlEx(sSql, [frmPrincipal.DBLogin.UserId, aFila, Copy(E.Message, 1, 200)]);
    end;
  end;
end;

procedure TfrmTarifasMasivas.fraCodigoModuloOnChange(Sender: TObject);
begin
  fraCodigoCodTexto.Sql :=
    'SELECT DISTINCT tc_id ' + CD_ALIAS_ID + ',' +
          ' tc_id ' + CD_ALIAS_CODIGO + ',' +
          ' tc_nombre ' + CD_ALIAS_DESC + ',' +
          ' tc_fechabaja ' + CD_ALIAS_BAJA +
     ' FROM ctc_textocarta, cta_textoarea' +
    ' WHERE tc_id = ta_idtextocarta' +
      ' AND ta_fechabaja IS NULL' +
      ' AND ta_idareatexto = ' + SqlValue(fraCodigoModulo.Value);

  fraCodigoCodFirmante.Sql :=
    'SELECT fi_id ' + CD_ALIAS_ID + ',' +
          ' fi_id ' + CD_ALIAS_CODIGO + ',' +
          ' fi_firmante ' + CD_ALIAS_DESC + ',' +
          ' fi_fechabaja ' + CD_ALIAS_BAJA +
     ' FROM cfi_firma, cfa_firmantearea' +
    ' WHERE fa_idfirmante = fi_id' +
      ' AND fa_fechabaja IS NULL' +
      ' AND fa_idareatexto = ' + SqlValue(fraCodigoModulo.Value);
end;

procedure TfrmTarifasMasivas.tbImprimirClick(Sender: TObject);
begin
  try
    if not sdqConsulta.IsEmpty and PrintDialog.Execute then
    begin
      QueryPrint.DataSource := dsConsulta;
      QueryPrint.SubTitle.Lines.Text := 'Errores en la generación masiva de tarifas' + #13#10;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
  end;
end;

procedure TfrmTarifasMasivas.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTarifasMasivas.GuardarRegistros;
var
  aSdqArchivo: TSDQuery;
  iContador: Integer;
  iTotalAGrabar: Integer;
  iTotalConError: Integer;
  sAdic: String;
  sSql: String;

  function GetAdicionales: String;
  var
    iLoop: Integer;
    sIds: String;
  begin
    sdqConsulta.DisableControls;
    try
      if (grid.SelectedRows.Count <> 0) and
         (MsgAsk('Ha seleccionado registros de la lista. ' + #13#10 + '¿ Desea incluirlos para que sean procesados ?')) then
      begin
        for iLoop := 0 to grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          if iLoop <> 0 then
            sIds := sIds + ',';
          sIds := sIds + sdqConsulta.FieldByName('mp_contrato').AsString;
        end;
      end;
      iTotalConError := Grid.SelectedRows.Count;
      Result := sIds;
    finally
      sdqConsulta.EnableControls;
      Grid.UnSelectAll;
    end;
  end;
begin
  sAdic := GetAdicionales;

  sSql :=
    'SELECT tmp_tarifamasiva.*, co_idactividad, co_idactividad2, co_idactividad3, co_idformulario, co_nivel,' +
          ' co_vigenciahasta, afiliacion.get_ultendoso(co_idformulario) ult_endoso' +
     ' FROM tmp_tarifamasiva, aco_contrato' +
    ' WHERE mp_contrato = co_contrato' +
      ' AND mp_usuario = :usuario';

  if sAdic <> '' then
  begin
    sSql := sSql + ' AND ((mp_valido = ''S'') OR (mp_contrato IN ( ' + sAdic + ')))';
    iTotalAGrabar := edCorrectos.Value + iTotalConError;
  end
  else
  begin
    sSql := sSql + ' AND mp_valido = ''S'' ';
    iTotalAGrabar := edCorrectos.Value;
  end;

  if iTotalAGrabar > 0 then
  begin
    aSdqArchivo := GetQueryEx(sSql, [frmPrincipal.DBLogin.UserID]);
    iContador := 0;
    try
      BeginTrans;
      try
        while not aSdqArchivo.Eof do
        begin
          Inc(iContador);
          BarProgreso.Position := Round(iContador / iTotalAGrabar * 100);

          GrabaEndosoTemporal(aSdqArchivo);

          aSdqArchivo.Next;
        end;
        CommitTrans;
        MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        //btnGrabar.Enabled := False;
        VCLExtra.EnableControls([tbGuardar], False)
      except
        on E:Exception do
        begin
          RollBack;
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;
    finally
      aSdqArchivo.Free;
    end;
  end
  else
    MessageDlg('No hay registros para guardar.', mtWarning, [mbOK], 0);
end;

procedure TfrmTarifasMasivas.tbGuardarClick(Sender: TObject);
begin
  if Validar and (MsgBox('Esta acción guardará los registros en la base de datos.' + #13#10 + '¿ Está seguro de querer continuar ?', MB_ICONEXCLAMATION + MB_YESNO) = ID_YES) then
    GuardarRegistros;
end;

procedure TfrmTarifasMasivas.tbLimpiarClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmTarifasMasivas.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  SortDialog.Execute;
end;

procedure TfrmTarifasMasivas.tbExportarClick(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
    tbExportar.Enabled := False;
    try
      bAutoCols := ExportDialog.Fields.Count = 0;
      try
        if bAutoCols then
          ExportDialog.Fields.Assign(Grid.Columns);

        ExportDialog.Execute;
      finally
        if bAutoCols then
          ExportDialog.Fields.Clear;
      end;
    finally
      tbExportar.Enabled := True;
    end;
  end;
end;

procedure TfrmTarifasMasivas.LeerCampo(const aValor: String; const aPosicion: Integer);
var
  cNumero: Currency;
  cPorcVariableSSN: Currency;
  cPorcVariableIncumplimiento: Currency;
  cSumaFijaIncumplimiento: Currency;
  cSumaFijaSSN: Currency;
  dFecha: TDateTime;
  dVigenciaTarifaMinima: TDateTime;
  iCiiu: Integer;
  sNivel: String;
  sSql: String;
begin
  case aPosicion of
    0: //Nro de Contrato
    begin
      FContratoInexistente := False;

      if (aValor = '') or (aValor = '0') then
      begin
        FContrato := ART_EMPTY_ID;
        FContratoInexistente := True;
        FMensajeError := FMensajeError + 'El Contrato es un campo obligatorio.';
      end
      else
      begin
        FContrato := StrToInt(aValor);
        sSql :=
          'SELECT afiliacion.check_cobertura(:contrato)' +
           ' FROM DUAL';
        if ValorSqlIntegerEx(sSql, [FContrato]) <> 1 then
        begin
          FContratoInexistente := True;

          sSql :=
            'SELECT co_estado' +
             ' FROM aco_contrato' +
            ' WHERE co_contrato = :contrato';
          if ValorSqlEx(sSql, [FContrato]) = '9' then    // Si es baja por rescisión..
            FMensajeError := FMensajeError + 'El contrato tiene estado Baja Pendiente por Rescisión.'
          else
            FMensajeError := FMensajeError + 'El Contrato no existe o no está activo.';
        end;
        FSql.Fields.Add('mp_contrato', FContrato, False);
      end;
    end;
    1: //Suma Fija x Trabajador
    begin
      try
        FSumaFija := StrToFloat(aValor);
      except
        FSumaFija := StrToFloat(StrReplace(aValor, '.', ','));
      end;

      if (aValor = '') then
        FMensajeError := FMensajeError + 'La suma fija es un campo obligatorio.'
      else
      begin
        cNumero := FSumaFija;

// Antes del 1.8.9 en el archivo la suma fija incluia los $0,60
//        if Numero < 0.6 then
//          FMensajeError := FMensajeError + 'La suma fija no puede ser menor a $0,60 (Incl. Fondo SRT/SSN).';
        FSql.Fields.Add('mp_sumafija', cNumero, dtNumber);
      end;
    end;
    2: //Porcentaje variable x Trabajador
    begin
      FPorcVariable := StrToFloat(StrReplace(aValor, '.', ','));
      if (aValor = '') then
        FMensajeError := FMensajeError + 'El porcentaje variable es un campo obligatorio.'
      else
      begin
        cNumero := StrToFloat(StrReplace(aValor, '.', ','));
        if cNumero < 0 then
          FMensajeError := FMensajeError + 'El porcentaje variable no puede ser menor a % 0.';
        FSql.Fields.Add('mp_porcmasa', cNumero, dtNumber);
      end;
    end;
    3: //Vigencia del Endoso
    begin
      FFecha := aValor;
      if (aValor = '') then
        FMensajeError := FMensajeError + 'La fecha de vigencia del endoso es un campo obligatorio.'
      else
      begin
        dFecha := StrToDate(aValor);
        dVigenciaTarifaMinima := Get_VigenciaTarifaMinima(FContrato);

        if dFecha < dVigenciaTarifaMinima then
          FMensajeError := FMensajeError + 'La vigencia de la tarifa ingresada es menor al inicio del contrato o ya fue modificada la tarifa antes del año.';

        sSql :=
          'SELECT COUNT(*)' +
           ' FROM tet_endosotarifa' +
          ' WHERE et_contrato = :contrato' +
            ' AND et_vigenciatarifa >= :vigenciatarifa' +
            ' AND et_fechabaja IS NULL';
        if ValorSqlIntegerEx(sSql, [FContrato, TDateTimeEx.Create(IncMonth(dFecha, -12))]) > 0 then
          FMensajeError := FMensajeError + 'El contrato tiene un cambio de tarifa PENDIENTE durante el año anterior a la fecha de vigencia notificada.';
        FSql.Fields.Add('mp_vigenciaendoso', dFecha);
      end;
    end;
    4: //Ciiu..
    begin
      iCiiu := StrToIntDef(aValor, 0);
      FSql.Fields.Add('mp_ciiu', aValor);

      if not FContratoInexistente then
      begin
        sSql :=
          'SELECT co_nivel' +
           ' FROM aco_contrato' +
          ' WHERE co_contrato = :contrato';
        sNivel := ValorSqlEx(sSql, [FContrato]);

        if (fraEN_MOTIVO.Value = '03.01') or (fraEN_MOTIVO.Value = '03.02') then
        begin
          // Calculo la suma fija por incumplimiento..
          sSql :=
            'SELECT   ' + SqlString('ts_tarifa' + sNivel) +
               ' FROM ats_tarifassn, cac_actividad' +
              ' WHERE ts_idactividad = ac_id' +
                ' AND ac_codigo = :codigo' +
                ' AND ACTUALDATE BETWEEN ts_fechadesde AND nvl(ts_fechahasta, to_date(''01/01/2099'', ''dd/mm/yyyy''))' +
                ' AND ts_fechabaja IS NULL' +
           ' ORDER BY ts_fechadesde';
          cSumaFijaSSN := ValorSqlExtendedEx(sSql, [iCiiu], -1);

          if cSumaFijaSSN = -1 then
            FMensajeError := FMensajeError + 'No hay una tarifa vigente de la SSN para ese CIIU.';

          // Calculo la suma fija del incumplimiento..
          if (FSumaFija * 1.5) > (cSumaFijaSSN * 1.15) then
          begin
            if FSql.Fields.FieldByName['mp_sumafija'] <> nil then
              FSql.Fields.FieldByName['mp_sumafija'].Value := FSumaFija;
            cSumaFijaIncumplimiento := (cSumaFijaSSN * 1.15) - FSumaFija;
          end
          else
          begin
            if FSql.Fields.FieldByName['mp_sumafija'] <> nil then
              FSql.Fields.FieldByName['mp_sumafija'].Value := FSumaFija;
            cSumaFijaIncumplimiento := FSumaFija * 0.5;
          end;
          if (cSumaFijaIncumplimiento < 0) then
            cSumaFijaIncumplimiento := 0;
          FSql.Fields.Add('mp_incumplido_sumafija', cSumaFijaIncumplimiento, dtNumber);


          // Calculo el porcentaje variable por incumplimiento..
          sSql :=
            'SELECT   ' + SqlString('ts_porce' + sNivel) +
               ' FROM ats_tarifassn, cac_actividad' +
              ' WHERE ts_idactividad = ac_id' +
                ' AND ac_codigo = :codigo' +
                ' AND ACTUALDATE BETWEEN ts_fechadesde AND nvl(ts_fechahasta, to_date(''01/01/2099'', ''dd/mm/yyyy''))' +
                ' AND ts_fechabaja IS NULL' +
           ' ORDER BY ts_fechadesde';
          cPorcVariableSSN := ValorSqlExtendedEx(sSql, [iCiiu], -1);

          if cPorcVariableSSN = -1 then
            FMensajeError := FMensajeError + 'No hay un porcentaje variable vigente de la SSN para ese CIIU.';

          // Calculo el porcentaje variable del incumplimiento..
          if (FPorcVariable * 1.5) > (cPorcVariableSSN * 1.15) then
          begin
            if FSql.Fields.FieldByName['mp_porcmasa'] <> nil then
              FSql.Fields.FieldByName['mp_porcmasa'].Value := FPorcVariable;
            cPorcVariableIncumplimiento := (cPorcVariableSSN * 1.15) - FPorcVariable;
          end
          else
          begin
            if FSql.Fields.FieldByName['mp_porcmasa'] <> nil then
              FSql.Fields.FieldByName['mp_porcmasa'].Value := FPorcVariable;
            cPorcVariableIncumplimiento := FPorcVariable * 0.5;
          end;
          if cPorcVariableIncumplimiento < 0 then
            cPorcVariableIncumplimiento := 0;
          FSql.Fields.Add('mp_incumplido_porcmasa', cPorcVariableIncumplimiento, dtNumber);
        end
        else
        begin
          FSql.Fields.Add('mp_incumplido_sumafija', 0, dtNumber);
          FSql.Fields.Add('mp_incumplido_porcmasa', 0, dtNumber);
        end;


        // Guardo la cantidad de establecimientos activos..
        sSql :=
          'SELECT COUNT(*)' +
           ' FROM aes_establecimiento' +
          ' WHERE es_contrato = :contrato' +
            ' AND es_fechabaja IS NULL';
        FSql.Fields.Add('mp_cantestablecimientosact', ValorSqlIntegerEx(sSql, [FContrato]), dtNumber);
      end;
    end;
  end;
end;

procedure TfrmTarifasMasivas.LoadDynamicSortFields(aSortFields: TSortFields; aColumns: TDBGridColumns);
var
  iLoop: Integer;
begin
  if aSortFields.Count = 0 then
    for iLoop := 0 to aColumns.Count - 1 do
      with aSortFields.Add do
      begin
        Title     := aColumns[iLoop].Title.Caption;
        DataField := aColumns[iLoop].FieldName;

        if Assigned(aColumns[iLoop].Field) then
          FieldIndex := aColumns[iLoop].Field.FieldNo;
      end;
end;

procedure TfrmTarifasMasivas.ProcesarExcel;
var
  iCantLineas: Integer;
  iLCid: Integer;
  iRow: Integer;
begin
  iLCid := GetUserDefaultLCID;
  try
    try
      ExcelApp.Workbooks.Open(edFilename.Text, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
      ExcelApp.Visible[0] := False;
      ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
      ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
      ExcelWS.Activate;

      with ExcelWS do
      begin
        iCantLineas := GetCountLineasExcel;
        iRow := 2;

        BarProgreso.Position := 0;

        while not IsEmptyLine(Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2) do
        begin
          FMensajeError := '';
          FSql.Clear;

          LeerCampo(Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2, 0);
          LeerCampo(Range['B' + IntToStr(iRow), 'B' + IntToStr(iRow)].Value2, 1);
          LeerCampo(Range['C' + IntToStr(iRow), 'C' + IntToStr(iRow)].Value2, 2);
          LeerCampo(FormatDateTime('dd/mm/yyyy', StrToIntDef(Range['D' + IntToStr(iRow), 'D' + IntToStr(iRow)].Value2, 0)), 3);
          LeerCampo(Range['E' + IntToStr(iRow), 'E' + IntToStr(iRow)].Value2, 4);

          FinalizarLinea(iRow);

          Inc(iRow);
          BarProgreso.Position := Round(iRow / iCantLineas * 100);
          if (iRow mod 20) = 0 then
            Forms.Application.ProcessMessages;
        end;
      end;
    except
      on E: Exception do
        MsgBox(E.Message);
    end;
  finally
    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Visible[0] := True;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
  end;
end;

procedure TfrmTarifasMasivas.tbFormatoContratoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + #13#10 +
             '* Extensión: .XLS' + #13#10 +
             '* Encabezado: La primer fila siempre va a ser tomada como encabezado' + #13#10 +
             '* Cuerpo: ' + #13#10 +
             '   - Campos: 1) Contrato. ' + #13#10 +
             '             2) Suma Fija. ' + #13#10 +
             '             3) Porc. Masa. ' + #13#10 +
             '             4) Vigencia. ' + #13#10 +
             '             5) CIIU Código. ' + #13#10 +
             '   - Obs: El formato de la Vigencia es DD/MM/YYYY.' + #13#10 +
             '          El separador de los decimales es la coma.' + #13#10 +
             '          No se debe ingresar separador de miles.'
             , mtInformation, [mbOK], 0);
end;

end.
