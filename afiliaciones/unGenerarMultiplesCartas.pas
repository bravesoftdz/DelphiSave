unit unGenerarMultiplesCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, ToolEdit, PatternEdit, IntEdit, FileReader, unArt, AnsiSql,
  Excel2000, OleServer, StrUtils, unfraCodigoDescripcionExt, FormPanel, unFraCodigoDescripcion, FolderDialog,
  BaseGrid, AdvGrid, ArchFuncs;

type
  TfrmGenerarMultiplesCartas = class(TfrmCustomConsulta)
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    edContratos: TFilenameEdit;
    fraCorreo: TfraStaticCTB_TABLAS;
    fraTexto: TfraStaticCodigoDescripcion;
    fraFormato: TfraStaticCTB_TABLAS;
    fraFirmante: TfraStaticCodigoDescripcion;
    fraModulo: TfraStaticCodigoDescripcion;
    btnCargar: TButton;
    BarProgreso: TProgressBar;
    ToolBar1: TToolBar;
    tbFormatoContrato: TToolButton;
    Label2: TLabel;
    edArchivo: TFilenameEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edTotal: TIntEdit;
    edError: TIntEdit;
    edCorrectos: TIntEdit;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    ExcelApp: TExcelApplication;
    t1: TTimer;
    ToolBar2: TToolBar;
    tbQuitarArchivo: TToolButton;
    folderDialog: TFolderDialog;
    fpResultadosSRT: TFormPanel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    lbEnvios: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    btnAcetarSRT: TButton;
    GridEnvios: TAdvStringGrid;
    edEnviosTotales: TEdit;
    edEnviosOk: TEdit;
    edEnviosFallados: TEdit;
    GridNoEnviados: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbFormatoContratoClick(Sender: TObject);
    procedure fraCodigoModuloOnChange(Sender: TObject);
    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure edArchivoAfterDialog(Sender: TObject; var Name: String; var Action: Boolean);
    procedure tbQuitarArchivoClick(Sender: TObject);
    procedure btnAcetarSRTClick(Sender: TObject);
  private
    FTotalErrores: Integer;
    FTotalLineas: Integer;

    function GetCountLineasExcel: Integer;
    function GuardarAdjunto: Integer;
    function GuardarCarta(const aSdqArchivo: TSDQuery; const aIdAdjunto: Integer): Integer;
    function GuardarRegistros: String;
    function IsEmptyLine(const aValor1: String): Boolean;
    function Validar: Boolean;

    procedure CargarQuery;
    procedure GenerarCartas;
    procedure MarcarCartasComoImpresas(const aIds: String);
    procedure EnviarSRTMulti(const aIds: String);
    procedure EnviarSRTSingle(const aId, sCarpetaDestino, sComunicacion: String; aTipoComunicacion: Integer; aEnviarSrt: Boolean);
    procedure GuardarArchivoEnDisco(var aFileName: String; const aIdAdjunto: Integer);
    procedure AgregarEnvio(const aCuit, aEnvioResultado: String; var aGrid: TAdvStringGrid);
    procedure RemoverCuitGrillaSRT(aCuit: String; var aGrilla: TAdvStringGrid);
  protected
    procedure ClearControls;
  public
  end;

var
  frmGenerarMultiplesCartas: TfrmGenerarMultiplesCartas;

implementation

uses
  unSesion, unDmPrincipal, unAfiliaciones, CustomDlgs, VCLExtra, SqlFuncs, Strfuncs, DateTimeFuncs,
  unComunes, Menus, General, unAfiAdministracionCartas, unAfiGeneracionCartas, unAfiCartasDoc, unCustomDataModule,
  unImportCryptoSrt, unSeleccionarCarpetaSRT;

{$R *.dfm}

function TfrmGenerarMultiplesCartas.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColA: String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
      sColA := Range['A' + IntToStr(iLineNumber), 'A' + IntToStr(iLineNumber)].Value2;

    if IsEmptyLine(sColA) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmGenerarMultiplesCartas.GuardarAdjunto: Integer;
var
  aFile: TFileStream;
  sSql: String;
begin
  Result := 0;

  if edArchivo.FileName = '' then
    Exit;

  sSql :=
    'INSERT INTO comunes.cad_cartaadjuntos' +
               ' (ad_id, ad_extension, ad_fechaalta, ad_usualta)' +
        ' VALUES (-1, :extension, SYSDATE, :usualta)';
  EjecutarSqlSTEx(sSql, [ExtractFileExt(edArchivo.FileName), Sesion.UserID]);

  Result := ValorSqlInteger('SELECT MAX(ad_id) FROM comunes.cad_cartaadjuntos');

  aFile := TFileStream.Create(edArchivo.FileName, fmOpenRead);
  try
    SaveBlob('UPDATE comunes.cad_cartaadjuntos' +
               ' SET ad_adjunto = :ad_adjunto' +
             ' WHERE ad_id = ' + SqlInt(Result), aFile);
  finally
    aFile.Free;
  end;
end;

function TfrmGenerarMultiplesCartas.GuardarCarta(const aSdqArchivo: TSDQuery; const aIdAdjunto: Integer): Integer;
var
  sSql: String;
begin
  with TSql.Create('cca_carta') do
  try
    SqlType := stInsert;
    Result := GetSecNextVal('SEQ_CCA_ID');

    sSql :=
      'SELECT MAX(en_id)' +
       ' FROM aen_endoso' +
      ' WHERE en_contrato = :contrato';

    PrimaryKey.Add('ca_id', Result);
    Fields.Add('ca_correo',       fraCorreo.Value);
    Fields.Add('ca_fechaalta',    DBDateTime, dmDateTime);
    Fields.Add('ca_idadjunto',    aIdAdjunto, True);
    Fields.Add('ca_idareatexto',  fraModulo.Value);
    Fields.Add('ca_iddelegacion', Sesion.Delegacion);
    Fields.Add('ca_idendoso',     ValorSqlIntegerEx(sSql, [aSdqArchivo.FieldByName('gc_contrato').AsInteger]));
    Fields.Add('ca_idfirma',      fraFirmante.Value);
    Fields.Add('ca_idtextocarta', fraTexto.Value);
    Fields.Add('ca_manual',       'N');
    Fields.Add('ca_textofinal',   SQL_NULL, False);
    Fields.Add('ca_tiposalida',   fraFormato.Value);
    Fields.Add('ca_usualta',      Sesion.UserID);

    EjecutarSqlST(Sql);
  finally
    Free;
  end;
end;

function TfrmGenerarMultiplesCartas.GuardarRegistros: String;
var
  iContador: Integer;
  iIdAdjunto: Integer;
  iTotalAGrabar: Integer;
  iTotalConError: Integer;
  sAdic: String;
  sdqArchivo: TSDQuery;
  sSql: String;

  function GetAdicionales: String;
  var
    iLoop: Integer;
    sIds: String;
  begin
    with sdqConsulta do
    begin
      DisableControls;
      try
        if (Grid.SelectedRows.Count <> 0) and
           (MsgAsk('Ha seleccionado registros de la lista. ' + #13#10 + '¿ Desea incluirlos para que sean procesados ?')) then
        begin
          for iLoop := 0 to Grid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
            if iLoop <> 0 then
              sIds := sIds + ',';
            sIds := sIds + FieldByName('gc_contrato').AsString;
          end;
        end;
        iTotalConError := Grid.SelectedRows.Count;
        Result := sIds;
      finally
        EnableControls;
        Grid.UnSelectAll;
      end;
    end;
  end;
begin
  Result := '';
  
  sAdic := GetAdicionales;

  sSql :=
    'SELECT *' +
     ' FROM tmp.tgc_generacioncartas' +
    ' WHERE gc_usuario = :usuario';

  if sAdic <> '' then
  begin
    sSql := sSql + ' AND ((gc_valido = ''T'') OR (gc_contrato IN ( ' + sAdic + ')))';
    iTotalAGrabar := edCorrectos.Value + iTotalConError;
  end
  else
  begin
    sSql := sSql + ' AND gc_valido = ''T'' ';
    iTotalAGrabar := edCorrectos.Value;
    edEnviosTotales.Text := IntToStr(iTotalAGrabar);
  end;

  if iTotalAGrabar > 0 then
  begin
    sdqArchivo := GetQueryEx(sSql, [Sesion.UserID]);
    iContador := 0;
    try
      BeginTrans;
      try
        iIdAdjunto := GuardarAdjunto;
        while not sdqArchivo.Eof do
        begin
          Inc(iContador);
          BarProgreso.Position := Round(iContador / iTotalAGrabar * 100);

          Result := Result + IntToStr(GuardarCarta(sdqArchivo, iIdAdjunto)) + ',';

          sdqArchivo.Next;
        end;
        CommitTrans;
        MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
        VCLExtra.EnableControls([tbNuevo], False)
      except
        on E:Exception do
        begin
          RollBack;
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;
    finally
      sdqArchivo.Free;
    end;
  end
  else
    MessageDlg('No hay registros para guardar.', mtWarning, [mbOK], 0);

  Delete(Result, Length(Result), 1);
end;

function TfrmGenerarMultiplesCartas.IsEmptyLine(const aValor1: String): Boolean;
begin
  Result := (aValor1 = '');
end;

function TfrmGenerarMultiplesCartas.Validar: Boolean;
begin
  Verificar(fraModulo.IsEmpty, fraModulo, 'El módulo es obligatorio.');
  Verificar(fraTexto.IsEmpty, fraTexto, 'El texto es obligatorio.');
  Verificar((fraTexto.Codigo = 'EXT') and (edArchivo.Text = ''), edArchivo, 'Si elige el texto "Archivo Externo", debe elegir un archivo.');
  Verificar(fraCorreo.IsEmpty, fraCorreo, 'El correo es obligatorio.');
  Verificar(fraFirmante.IsEmpty, fraFirmante, 'El firmante es obligatorio.');
  Verificar(fraFormato.IsEmpty, fraFormato, 'El formato es obligatorio.');

  Result := True;
end;


procedure TfrmGenerarMultiplesCartas.CargarQuery;
var
  sSql: String;
begin
  sSql :=
    'SELECT   *' +
       ' FROM tmp.tgc_generacioncartas' +
      ' WHERE gc_usuario = :usuario' +
        ' AND gc_valido = ''F''' +
   ' ORDER BY gc_nrolinea';
  OpenQueryEx(sdqConsulta, [Sesion.UserId], sSql, True);
end;

procedure TfrmGenerarMultiplesCartas.ClearControls;
begin
  VCLExtra.LockControls([edTotal, edError, edCorrectos], True);
  VCLExtra.EnableControls([tbNuevo, tbImprimir, tbExportar, tbOrdenar], False);
  edContratos.Clear;
  BarProgreso.Position := 0;
  edTotal.Clear;
  edError.Clear;
  edCorrectos.Clear;
  sdqConsulta.Close;
end;

procedure TfrmGenerarMultiplesCartas.GenerarCartas;
  procedure InsertRecord(var aError: Boolean; const aNroLinea: Integer; const aContrato, aMsgError: String);
  var
    sSql: String;
  begin
    sSql :=
      'INSERT INTO tmp.tgc_generacioncartas' +
          ' (gc_usuario, gc_error, gc_valido, gc_nrolinea, gc_contrato) ' +
          ' VALUES (:username, :error, :valido, :nrolinea, :contrato)';
    EjecutarSqlEx(sSql, [Sesion.UserID, aMsgError, IIF((aMsgError = ''), 'T', 'F'), aNroLinea, StrToIntDef(aContrato, 0)]);
    aError := True;
  end;

var
  aQuery: TSDQuery;
  bError: Boolean;
  iLCid: Integer;
  iRow: Integer;
  sColA: String;
  sSql: String;
begin
  // Reinicio la tabla..
  EjecutarSqlEx('DELETE FROM tmp.tgc_generacioncartas WHERE gc_usuario = :usuario', [Sesion.UserId]);

  FTotalLineas  := 0;
  FTotalErrores := 0;

  //Toma el nombre del archivo
  edContratos.Text := Trim(StrReplace(edContratos.Text, '"', ''));

  iLCid := GetUserDefaultLCID;
  try
    try
      ExcelApp.Workbooks.Open(edContratos.Text, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
      ExcelApp.Visible[0] := False;
      ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
      ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
      ExcelWS.Activate;

      with ExcelWS do
      begin
        iRow := 1;
        sColA := Range['A1', 'A1'].Value2;
        FTotalLineas := GetCountLineasExcel;
        BarProgreso.Max := FTotalLineas;

        while not IsEmptyLine(sColA) do
        begin
          bError := False;

          // ***  VERIFICO QUE LA PRIMER COLUMNA TENGA ALGÚN DATO  ***
          if sColA = '' then
            InsertRecord(bError, iRow, sColA, 'Columna A vacía.');

          // ***  VERIFICO QUE EL CONTRATO SEA VÁLIDO  ***
          if not bError then
          try
            StrToInt(sColA);
          except
            InsertRecord(bError, iRow, sColA, 'Contrato inválido.');
          end;

          // ***  VERIFICO QUE EXISTA EL CONTRATO  ***
          if not bError then
          begin
            sSql :=
              'SELECT 1' +
               ' FROM aco_contrato' +
              ' WHERE co_contrato = :contrato';
            if ValorSqlIntegerEx(sSql, [StrToInt(sColA)], -1) = -1 then
              InsertRecord(bError, iRow, sColA, 'Contrato inexistente.');
          end;

          // ***  VERIFICO EL ESTADO DEL CONTRATO  ***
          if not bError then
          begin
            sSql := 'SELECT afiliacion.check_cobertura(:contrato) FROM DUAL';
            if ValorSqlIntegerEx(sSql, [StrToInt(sColA)]) <> 1 then
            begin
              sSql :=
                'SELECT co_estado, tb_descripcion' +
                 ' FROM aco_contrato, ctb_tablas' +
                ' WHERE tb_clave = ''AFEST''' +
                  ' AND co_estado = tb_codigo' +
                  ' AND co_contrato = :contrato';
              aQuery := GetQueryEx(sSql, [StrToInt(sColA)]);
              try
                if aQuery.FieldByName('co_estado').AsString = '9' then    // Si es baja por rescisión..
                  InsertRecord(bError, iRow, sColA, 'El contrato tiene estado Baja Pendiente por Rescisión.')
                else
                  InsertRecord(bError, iRow, sColA, 'El Contrato no está activo. (' + aQuery.FieldByName('tb_descripcion').AsString + ')');
              finally
                aQuery.Free;
              end;
            end;
          end;

          if bError then
            Inc(FTotalErrores)
          else
            InsertRecord(bError, iRow, sColA, '');

          Inc(iRow);
          BarProgreso.StepIt;
          if (iRow mod 20) = 0 then
            Forms.Application.ProcessMessages;

          sColA := Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2;
        end;
      end;
    except
      on E: Exception do
        MsgBox('Ocurrió un error: ' + E.Message);
    end;
  finally
    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Visible[0] := True;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
  end;

  //Termino el proceso, muestro los resultados
  edTotal.Value := FTotalLineas;
  edError.Value := FTotalErrores;
  edCorrectos.Value := FTotalLineas - FTotalErrores;
  CargarQuery;

  VCLExtra.EnableControls([tbNuevo, tbImprimir, tbExportar, tbOrdenar], True);
  MessageDlg('El proceso ha terminado.', mtInformation, [mbOK], 0);
end;

procedure TfrmGenerarMultiplesCartas.MarcarCartasComoImpresas(const aIds: String);
var
  aLista: TStringList;
  iLoop: Integer;
  iTotal: Integer;
  sSql: String;
  sIdsTmp: String;
begin
  sSql :=
    'UPDATE cca_carta' +
      ' SET ca_usuimpresion = :usuimpresion,' +
          ' ca_fechaimpresion = SYSDATE' +
    ' WHERE ca_id IN(%s)';

  aLista := TStringList.Create;
  try
    aLista.CommaText := aIds;

    iTotal := 0;
    sIdsTmp := '-1';
    for iLoop := 0 to aLista.Count - 1 do
    begin
      Inc(iTotal);
      sIdsTmp := sIdsTmp + ',' + aLista[iLoop];

      if iTotal = 990 then
      begin
        EjecutarSqlEx(Format(sSql, [sIdsTmp]), [Sesion.UserID]);
        iTotal := 0;
        sIdsTmp := '-1';
      end;
    end;

    // Actualizo las últimas cartas..
    EjecutarSqlEx(Format(sSql, [sIdsTmp]), [Sesion.UserID]);

    MsgBox('Proceso exitoso.');
  finally
    aLista.Free;
  end;
end;

procedure TfrmGenerarMultiplesCartas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  BarProgreso.Position := 0;

  with fraCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := False;

    sSql :=
      'SELECT tb_codigo' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''CORRE''' +
        ' AND tb_especial1 = ''D''';
    Value := ValorSql(sSql);
  end;

  with fraFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;
  end;

  with fraFormato do
  begin
    Clave     := 'TSCDO';
    ShowBajas := False;
  end;
  
  with fraModulo do
  begin
    TableName   := 'cat_areatexto';
    FieldID     := 'at_id';
    FieldCodigo := 'at_modulo';
    FieldDesc   := 'at_descripcion';
    FieldBaja   := 'at_fechabaja';
    ShowBajas   := False;
    Sql         := 'SELECT DISTINCT at_id ' + CD_ALIAS_ID + ',' +
                         ' at_modulo ' + CD_ALIAS_CODIGO + ',' +
                         ' at_descripcion ' + CD_ALIAS_DESC + ',' +
                         ' at_fechabaja ' + CD_ALIAS_BAJA +
                    ' FROM cat_areatexto, cau_areausuario' +
                   ' WHERE at_id = au_idareatexto' +
                     ' AND au_usuario = ' + SqlValue(Sesion.UserId) +
                     ' AND au_fechabaja IS NULL' +
                     ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    OnChange    := fraCodigoModuloOnChange;
  end;

  with fraTexto do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := False;
  end;
end;

procedure TfrmGenerarMultiplesCartas.btnCargarClick(Sender: TObject);
begin
  //Reinicia la tabla que muestra los errores
  Verificar(edContratos.Text = '', edContratos, 'Debe elegir un archivo para procesar.');

  t1.Enabled := True;
end;

procedure TfrmGenerarMultiplesCartas.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
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

procedure TfrmGenerarMultiplesCartas.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmGenerarMultiplesCartas.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmGenerarMultiplesCartas.fraCodigoModuloOnChange(Sender: TObject);
begin
  if FileExists(edArchivo.FileName) then
  begin
    fraTexto.Sql :=
      'SELECT DISTINCT tc_id ' + CD_ALIAS_ID + ',' +
            ' tc_codigo ' + CD_ALIAS_CODIGO + ',' +
            ' tc_nombre ' + CD_ALIAS_DESC + ',' +
            ' tc_fechabaja ' + CD_ALIAS_BAJA +
       ' FROM ctc_textocarta, cta_textoarea' +
      ' WHERE tc_id = ta_idtextocarta' +
        ' AND tc_codigo = ''EXT''' +
        ' AND ta_fechabaja IS NULL';
    fraTexto.Codigo := 'EXT';
  end
  else
    fraTexto.Sql :=
      'SELECT DISTINCT tc_id ' + CD_ALIAS_ID + ',' +
            ' tc_codigo ' + CD_ALIAS_CODIGO + ',' +
            ' tc_nombre ' + CD_ALIAS_DESC + ',' +
            ' tc_fechabaja ' + CD_ALIAS_BAJA +
       ' FROM ctc_textocarta, cta_textoarea' +
      ' WHERE tc_id = ta_idtextocarta' +
        ' AND ta_fechabaja IS NULL' +
        ' AND ta_idareatexto = ' + SqlValue(fraModulo.Value);

  fraFirmante.Sql :=
    'SELECT fi_id ' + CD_ALIAS_ID + ',' +
          ' fi_id ' + CD_ALIAS_CODIGO + ',' +
          ' fi_firmante ' + CD_ALIAS_DESC + ',' +
          ' fi_fechabaja ' + CD_ALIAS_BAJA +
     ' FROM cfi_firma, cfa_firmantearea' +
    ' WHERE fa_idfirmante = fi_id' +
      ' AND fa_fechabaja IS NULL' +
      ' AND fa_idareatexto = ' + SqlValue(fraModulo.Value);

  if fraTexto.Codigo = 'EXT' then
  begin
    fraFirmante.Codigo := '430';
    fraFormato.Codigo := 'VE';
  end;

//  LockControls([fraTexto, fraFirmante, fraFormato], (fraTexto.Codigo = 'EXT'));
end;

procedure TfrmGenerarMultiplesCartas.tbNuevoClick(Sender: TObject);
var
  bImprimirCartas: Boolean;
  sIds: String;
begin
  if Validar and (MsgBox('Esta acción generará las cartas.' + #13#10 + '¿ Desea continuar ?', MB_ICONEXCLAMATION + MB_YESNO) = ID_YES) then
  begin
    sIds := GuardarRegistros;
    bImprimirCartas := False;

    if Assigned(frmAfiAdministracionCartas) then
      bImprimirCartas := MsgAsk('¿ Desea imprimir las cartas generadas ?');

    if bImprimirCartas then
      if fraFormato.Value <> 'VE' then
        frmAfiAdministracionCartas.ImprimirRecienGeneradas(sIds)
      else
        EnviarSRTMulti(sIds)

    else if MsgAsk('¿ Desea marcar como impresas las cartas generadas ?') then
      MarcarCartasComoImpresas(sIds);
  end;
end;

procedure TfrmGenerarMultiplesCartas.tbFormatoContratoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + #13#10 +
             '* Extensión: .XLS' + #13#10 +
             '* Encabezado: No debe ingresarse encabezado' + #13#10 +
             '* Cuerpo: ' + #13#10 +
             '   - Campos: 1) Contrato ', mtInformation, [mbOK], 0);
end;

procedure TfrmGenerarMultiplesCartas.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;
  GenerarCartas;
end;

procedure TfrmGenerarMultiplesCartas.edArchivoAfterDialog(Sender: TObject; var Name: String; var Action: Boolean);
begin
  if FileExists(Name) then
    fraCodigoModuloOnChange(nil);
end;

procedure TfrmGenerarMultiplesCartas.tbQuitarArchivoClick(Sender: TObject);
begin
  edArchivo.Clear;
  fraCodigoModuloOnChange(nil);
end;

procedure TfrmGenerarMultiplesCartas.EnviarSRTMulti(const aIds: String);
var
 IdCartaAux : String;
 IdEnviar : String;
 sCarpetaDestino : String;
 sSql : String;
 frmSeleccionarCarpetaSrt : TfrmSeleccionarCarpetaSrt;
begin
  sSql :=  'SELECT hc_contrato contrato' +
            '  FROM cca_carta  ' +
            '       JOIN aen_endoso ON ca_idendoso = en_id ' +
            '       JOIN Ahc_Historicocontrato on hc_id = en_idhistoricoempresa ' +
            '       JOIN Ahm_Historicoempresa on hm_id = en_idhistoricoempresa ' +
            ' WHERE ca_id = :idcarta ';


  frmSeleccionarCarpetaSrt := TfrmSeleccionarCarpetaSrt.Create(Self);
  try
    if frmSeleccionarCarpetaSrt.ShowModal = mrOk then
      sCarpetaDestino := frmSeleccionarCarpetaSrt.CarpetaDestino
    else
      Exit;

    IdCartaAux := aIds;
    while (IdCartaAux <> '') do
    begin
      if Pos(',', IdCartaAux) > 0 then
        IdEnviar := Copy(IdCartaAux, 0, Pos(',', IdCartaAux))
      else
        IdEnviar := IdCartaAux;

      if idEnviar <> '' then
        IdCartaAux := AnsiReplaceStr(IdCartaAux, IdEnviar , '')
      else
        idCartaAux := '';

      if idEnviar <> '' then
      begin
        IdEnviar := AnsiReplaceStr(IdEnviar, ',', '');
        AgregarEnvio(ValorSqlEx(sSql, [idEnviar],''), 'NO ENVIADO', GridNoEnviados);
      end;
    end;

    edEnviosOk.Text := '0';
    edEnviosFallados.Text := '0';


    IdCartaAux := aIds;
    while (IdCartaAux <> '') do
    begin
      if Pos(',', IdCartaAux) > 0 then
        IdEnviar := Copy(IdCartaAux, 0, Pos(',', IdCartaAux))
      else
        IdEnviar := IdCartaAux;
      if idEnviar <> '' then
        IdCartaAux := AnsiReplaceStr(IdCartaAux, IdEnviar , '')
      else
        idCartaAux := '';
      if idEnviar <> '' then
        EnviarSRTSingle(IdEnviar, sCarpetaDestino, frmSeleccionarCarpetaSrt.Comunicacion, frmSeleccionarCarpetaSrt.TipoComunicacion, frmSeleccionarCarpetaSrt.EnviarSRT);
    //ShowMessage(idEnviar);
    end;
    if frmSeleccionarCarpetaSrt.EnviarSRT then
    begin
      GridEnvios.SaveToXLS(IncludeTrailingBackslash(sCarpetaDestino)+ 'Resultado.xlsx', False);
      fpResultadosSRT.ShowModal;
    end;
  finally
    frmSeleccionarCarpetaSrt.Free;
  end;
end;

procedure TfrmGenerarMultiplesCartas.EnviarSRTSingle(const aId, sCarpetaDestino, sComunicacion: String; aTipoComunicacion: Integer; aEnviarSrt: Boolean);
var
  Id : String;
  aFileName, aFileNameQrp : String;
  sdqDatos: TSDQuery;
  sSql : String;
  iIdConsulta : Integer;
begin
  Id := AnsiReplaceStr(aId, ',', '');
  iIdConsulta := -1;

  if sCarpetaDestino <> '' then
    aFileName := '';
  sdqDatos := TSDQuery.Create(nil);
  try
    sdqDatos.DataBaseName := 'dbPrincipal';
    try
      sSql :=
            'SELECT hc_contrato contrato, hm_cuit cuit, ca_idadjunto  ' +
            '  FROM cca_carta  ' +
            '       JOIN aen_endoso ON ca_idendoso = en_id ' +
            '       JOIN Ahc_Historicocontrato on hc_id = en_idhistoricoempresa ' +
            '       JOIN Ahm_Historicoempresa on hm_id = en_idhistoricoempresa ' +
            ' WHERE ca_id = :idcarta ' +
            ' UNION ' +
            'SELECT null contrato , sa_cuit cuit, ca_idadjunto ' +
            '  FROM cca_carta ' +
            '       JOIN asa_solicitudafiliacion ON ca_idformulario = sa_idformulario ' +
            '  WHERE ca_id = :idcarta' ;

      OpenQueryEx(sdqDatos, [Id], sSql, True);

      if not sdqDatos.Eof then
      begin

        aFileName := Format('%s%s-%s.pdf', [IncludeTrailingBackslash(sCarpetaDestino),
                                        sdqDatos.FieldByName('cuit').AsString,
                                        sdqDatos.FieldByName('contrato').AsString]);
        aFileNameQrp := Format('%s%s-%s.qrp', [IncludeTrailingBackslash(sCarpetaDestino),
                                                sdqDatos.FieldByName('cuit').AsString,
                                                sdqDatos.FieldByName('contrato').AsString]);
        if aEnviarSrt then
        begin
          iIdConsulta := GetSecNextVal('SRT.SEQ_SCRCONSULTASSRT_ID');
          LogAuditEnvio(sdqDatos.FieldByName('cuit').AsString, 'Preparar para enviar', iIdConsulta, StrToInt(Id))
        end;

        if StrToInt(ID) <> 0 then
        begin
          with TAfiCartasDoc.Create do
          try
          if not sdqDatos.FieldByName('ca_idadjunto').IsNull then    // Si es un archivo externo..
            GuardarArchivoEnDisco(aFileName, sdqDatos.FieldByName('ca_idadjunto').AsInteger)
            else  //controlar casos especiales.
            begin
              MostrarCartaDocumento(StrToInt(Id), tmBeginEnd, False, 1, False, True, False, False, True,
                                True, True, False, '', False, sCarpetaDestino + '\' +
                                sdqDatos.FieldByName('cuit').AsString + '-' + sdqDatos.FieldByName('contrato').AsString + '.pdf');
              DeleteFile(aFileNameQrp);
            end;
            if aEnviarSrt then
            begin
              if EnviarSRTResult(aFileName, sComunicacion, sdqDatos.FieldByName('cuit').AsString, aTipoComunicacion,
                               iIdConsulta, StrToInt(ID)) then
              begin
                edEnviosOk.Text := IntToStr(StrToInt(edEnviosOk.Text)+1);
                RemoverCuitGrillaSRT(ID, GridNoEnviados);
                AgregarEnvio(sdqDatos.FieldByName('contrato').AsString, 'OK', GridEnvios);
                if (FileExists(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx')) then
                  DeleteReadOnlyFile(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx');
                GridNoEnviados.SaveToXLS(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx', True);
              end
              else
              begin
                edEnviosFallados.Text := IntToStr(StrToInt(edEnviosFallados.Text)+1);
                AgregarEnvio(sdqDatos.FieldByName('contrato').AsString, 'NO ENVIADO', GridEnvios);
              end;
            end;
            Application.ProcessMessages;
          finally
            Free;
          end;
        end;
      end;
    except
       ShowMessage('Error');
    end;
  finally
    sdqDatos.Free;
  end;
end;

procedure TfrmGenerarMultiplesCartas.GuardarArchivoEnDisco(
  var aFileName: String; const aIdAdjunto: Integer);
var
  aTextoFinal: TFileStream;
  sSql: String;
begin
  sSql :=
    'SELECT ad_extension' +
     ' FROM comunes.cad_cartaadjuntos' +
    ' WHERE ad_id = :id';
  aFileName := ChangeFileExt(aFileName, ValorSqlEx(sSql, [aIdAdjunto]));

  aTextoFinal := TFileStream.Create(aFileName, fmCreate);
  try
    BlobSql('SELECT ad_adjunto' +
             ' FROM comunes.cad_cartaadjuntos' +
            ' WHERE ad_id = ' + SqlInt(aIdAdjunto), aTextoFinal);
  finally
    aTextoFinal.Free;
  end;
end;

procedure TfrmGenerarMultiplesCartas.btnAcetarSRTClick(Sender: TObject);
begin
  fpResultadosSRT.ModalResult := MrOk
end;

procedure TfrmGenerarMultiplesCartas.AgregarEnvio(const aCuit,
  aEnvioResultado: String; var aGrid: TAdvStringGrid);
begin
  if (aGrid.RowCount = 2) and (aGrid.Cells[0, 1] = '') and (aGrid.Cells[1, 1] = '') then
  begin
    aGrid.RemoveRows(1, 1);
    aGrid.Clear;
  end;
  aGrid.AddRow;

  aGrid.Cells[0, aGrid.RowCount - 1] := aCuit;
  aGrid.Cells[1, aGrid.RowCount - 1] := aEnvioResultado;
  aGrid.Cells[0, 0] := 'Contrato';
  aGrid.Cells[1, 0] := 'Resultado';
  if aGrid.RowCount > 1 then
    aGrid.FixedRows := 1;
end;

procedure TfrmGenerarMultiplesCartas.RemoverCuitGrillaSRT(aCuit: String;
  var aGrilla: TAdvStringGrid);
var
  aLoc: TPoint;
  aFp: TFindParams;
begin
  aLoc := Classes.Point(-1, -1);
  aFp := [fnMatchRegular];

  repeat
    aLoc := aGrilla.Find(aLoc, aCuit, aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X <> 0){columna que espero}) then
      aGrilla.RemoveNormalRow(aLoc.Y);
  until (aLoc.X = -1) or (aLoc.Y = -1);
end;

end.
