Usar el que essta aca '..\comunes\forms\unConsFax.pas'

{********************************************************}
{                                                        }
{    Consulta e Impresión de Faxes                       }
{    En esta pantalla, el usuario puede buscar e         }
{    imprimir faxes, según los filtros mostrados.        }
{    Como detalle, solo puede listar los faxes           }
{    que tenga asociado en la tabla                      }
{    FFU_FORMULARIOUSUARIO                               }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

unit unConsFax;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxCurrEdit, rxToolEdit, {$ELSE} Placemnt, CurrEdit, ToolEdit, {$ENDIF}
  Graphics, unCustomConsulta, AxCtrls, OleCtrls, Forms,
  unArtFrame, unFraStaticCodigoDescripcion, unfraFFO_FAXFORMULARIO,
  DateComboBox, StdCtrls, Mask, PatternEdit, DateTimeEditors,
  ExtCtrls, FieldHider, ShortCutControl, Dialogs, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Controls, ComCtrls, ToolWin,
  Classes, Menus, IntEdit, unCustomGridABM, FormPanel, unArtDBAwareFrame, unEstrategiaTIFF,
  DBOleCtl, JvExExtCtrls, JvExForms, JvScrollBox, ExtDlgs, unFraVistaTIFF,
  JvSplitter, CheckLst, ARTCheckListBox, JvgGroupBox, JvExControls,
  JvComponent, JvXPCore, JvXPCheckCtrls, JvNetscapeSplitter;

type

  TfrmConsFax = class(TfrmCustomGridABM)
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpImagenes: TMenuItem;
    pmnuSeleccion: TPopupMenu;
    mnuSelTodo: TMenuItem;
    mnuSelLimpiar: TMenuItem;
    mnuSelInvertir: TMenuItem;
    pnlVistaPrevia: TPanel;
    fraFE_IDFORMULARIO: TfraFFO_FAXFORMULARIO;
    Label5: TLabel;
    fpImpresionAutomatica: TFormPanel;
    Bevel1: TBevel;
    btnImpAutCancel: TButton;
    pbImpAutom: TProgressBar;
    N1: TMenuItem;
    mnuImpresionAutomatica: TMenuItem;
    lbImpAutom: TLabel;
    tbVerificarArchivos: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    tbCantidadDeHojas: TToolButton;
    fraVistaTIFF: TfraVistaTIFF;
    ShortCutControlDuplicated: TShortCutControl;
    gbFiltrosEmpresa: TJvgGroupBox;
    gbTradicional: TJvgGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    fraFiltroFormulario: TfraFFO_FAXFORMULARIO;
    edRecibidoDesde: TDateComboBox;
    edRecibidoHasta: TDateComboBox;
    edCodigo: TIntEdit;
    GroupBox1: TGroupBox;
    edNroOrden: TPatternEdit;
    cmbErrores: TComboBox;
    ListaFormularios: TARTCheckListBox;
    chkActivos: TJvXPCheckbox;
    chkNoImpresos: TJvXPCheckbox;
    imgHidden: TImage;
    Splitter: TJvNetscapeSplitter;
    procedure FormCreate(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpImagenesClick(Sender: TObject);
    procedure mnuSelTodoClick(Sender: TObject);
    procedure mnuSelLimpiarClick(Sender: TObject);
    procedure mnuSelInvertirClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbPageFirstClick(Sender: TObject);
    procedure tbPagePriorClick(Sender: TObject);
    procedure tbPageNextClick(Sender: TObject);
    procedure tbPageLastClick(Sender: TObject);
    procedure edPageKeyPress(Sender: TObject; var Key: Char);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure mnuImpresionAutomaticaClick(Sender: TObject);
    procedure btnImpAutCancelClick(Sender: TObject);
    procedure tbVerificarArchivosClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbCantidadDeHojasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetPage(AValue: Integer);
    procedure ImprimirTodo;
    procedure PrintRecord(AHandleErrors: Boolean; AIgnoreErrors: Boolean = False);
    procedure WriteRefFile(AFileName, Texto: String);
  public
    FIACancel: Boolean; { De la Impresión Automática }
    hScale: Extended;
    ARefFile: string;
    FImprimeTodo: Boolean;
  protected
    procedure RefreshData; override;
    procedure ClearData; override;
    procedure EnableButtons(AEnabled: Boolean = True); override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    {function CheckImagen: Boolean;}
  public
    // estrategia para la visualizacion del tiff multi paginas o simple.
    eEstrategiaTiff : TEstrategiaTiff;
  end;

var
  frmConsFax: TfrmConsFax;

implementation

uses
  {$IFDEF CUSTOM_PRINCIPAL}
  unCustomPrincipal,
  {$ENDIF}
  Windows, SysUtils, Printers, unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs,
  Math, General, CustomDlgs, SpoolFuncs, DateTimeFuncs, DBFuncs, ArchFuncs,
  unEspera, unSesion, Types, LibGfl, unImageFunctions;

{$R *.DFM}

{ TfrmConsFax }

procedure TfrmConsFax.RefreshData();
var
  sSelect, sSubSelect, sSql, sSubSelectGroup, sSelectWhere: string;
begin
  Verificar((not ( (edRecibidoDesde.Date > 0) or (edRecibidoHasta.Date > 0) )) and (edNroOrden.Text = ''), edRecibidoDesde, 'Debe indicar al menos una fecha de referencia para poder ver los datos.');

  WriteStatusText('Ejecutando consulta de Selección de Datos...');

  sSelect :=        'SELECT FFE.FE_ID, FFE.FE_IDFORMULARIO, FO_DESCRIPCION, TO_CHAR(FFE.FE_NROORDEN) AS FE_NROORDEN, ' +
                    '       DECODE(FFE2.CANTIDAD, 1, FFE.FE_PAGINAS, FFE2.CANTIDAD) FE_PAGINAS, FFE.FE_ARCHIVOIMAGEN, FE_FECHAINGRESO, FE_FECHAALTA,' +
                    '       FE_USUVISUALIZA, FE_FECHAVISUALIZA, FE_USUIMPRESION, FE_FECHAIMPRESION, FE_FECHABAJA, ' +
                    '       DECODE(FFE2.CANTIDAD, 1, ''S'', ''N'') FE_MULTIPAGINAS' +
                    '  FROM ART.FFE_FAXENTRANTES FFE, ART.FFO_FAXFORMULARIO, ';
  sSubSelect :=     '       (SELECT FE_NROORDEN, MIN (FE_ID) FE_ID, COUNT (*) CANTIDAD' +
                    '          FROM ART.FFE_FAXENTRANTES FFE1, ART.FFO_FAXFORMULARIO ';
  sSql:=            '         WHERE FO_ID = FE_IDFORMULARIO' +
                    '           AND EXISTS (SELECT 1 ' +
                                            ' FROM ART.FFU_FORMULARIOUSUARIO ' +
                                           ' WHERE FU_IDFORMULARIO = FE_IDFORMULARIO ' +
                                             ' AND FU_FECHABAJA IS NULL ' +
                                             ' AND FU_USUARIO = ' + SqlValue(Sesion.UserID) + ') ';
  sSubSelectGroup:= '     GROUP BY FE_NROORDEN) FFE2 ';
  sSelectWhere :=   ' WHERE FO_ID = FE_IDFORMULARIO AND FFE.FE_ID = FFE2.FE_ID ';

  if fraFiltroFormulario.IsSelected Then
    sSql := sSql + 'AND FE_IDFORMULARIO = ' + SqlValue(fraFiltroFormulario.Value) + ' ';

  if not edRecibidoDesde.IsEmpty Then
    sSql := sSql + 'AND FE_FECHAINGRESO >= ' + SqlDate(edRecibidoDesde.Date) + ' ';

  if not edRecibidoHasta.IsEmpty Then
    sSql := sSql + 'AND FE_FECHAINGRESO < ' + SqlDate(edRecibidoHasta.Date) + ' +1 ';

  if ListaFormularios.CheckCount > 0 then
    AddCondition(sSQL, ' 1 = 1 ' + ListaFormularios.InSQL_StringValues('FE_IDFORMULARIO', False));

  {if edHoraDesde.Time > 0 Then
    sSql := sSql + 'AND TO_DATE(TO_CHAR(FE_FECHAINGRESO, ''HH24:MI:SS''), ''HH24:MI:SS'') <= ' + SqlTime(edHoraDesde.Time) + ' ';

  if edHoraHasta.Time > 0 Then
    sSql := sSql + 'AND TO_DATE(TO_CHAR(FE_FECHAINGRESO, ''HH24:MI:SS''), ''HH24:MI:SS'') >= ' + SqlTime(edHoraHasta.Time) + ' ';}

  if edCodigo.Value <> 0 then
    sSql := sSql + 'AND FE_ID = ' + SqlValue(edCodigo.Value) + ' ';

  if edNroOrden.Text <> '' then
    sSql := sSql + 'AND FE_NROORDEN = ' + SqlValue(edNroOrden.Text) + ' ';

  if chkNoImpresos.Checked then
  begin
    sSql := sSql + 'AND NOT EXISTS (SELECT 1' +
                                    ' FROM ART.FFE_FAXENTRANTES FFE2' +
                                   ' WHERE FFE2.FE_NROORDEN = FFE1.FE_NROORDEN' +
                                     ' AND FFE2.FE_ID <> FFE1.FE_ID' +
                                     ' AND FFE2.FE_FECHAIMPRESION IS NOT NULL) ';

    sSelectWhere := sSelectWhere + ' AND FE_FECHAIMPRESION IS NULL ';
  end;

  if chkActivos.Checked then
    sSql := sSql + 'AND FE_FECHABAJA IS NULL ';

  case cmbErrores.ItemIndex of
    1: sSql := sSql + 'AND FE_ERRORFECHA IS NULL ';
    2: sSql := sSql + 'AND FE_ERRORFECHA IS NOT NULL ';
  end;

  if FImprimeTodo = True then
    sSelectWhere := sSelectWhere + ' AND FE_FECHAALTA >= ART.ACTUALDATE - 3';

  sdqConsulta.Sql.Text := sSelect + sSubSelect + sSql + sSubSelectGroup + sSelectWhere + SortDialog.OrderBy;
  inherited;

  WriteStatusText('');
end;


procedure TfrmConsFax.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF CUSTOM_PRINCIPAL}
  StatusBar := frmPrincipal.sbEstado;
  {$ELSE}
    {$IFDEF RED_PRES}
    StatusBar := frmPrincipal.Sb_BarraDeEstado;
    {$ELSE}
    StatusBar := frmPrincipal.sbEstado;
    {$ENDIF}
  {$ENDIF}
  fraFiltroFormulario.Usuario := Sesion.UserID;
  FieldBaja   := 'FE_FECHABAJA';
  ShowActived := False;
  Sql.TableName := 'FFE_FAXENTRANTES';
  hScale := 0;
  edRecibidoDesde.Date := DBDate - 7;
  cmbErrores.ItemIndex  := 0;
  ARefFile := GetTempFileNameEx;
end;

procedure TfrmConsFax.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmConsFax.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsFax.mnuImpImagenesClick(Sender: TObject);
var
  i: Integer;
begin
  if Grid.SelectedRows.Count = 0 Then
    InfoHint(nil, 'Debe seleccionar al menos un fax para poder imprimir la imagen.')
  else
  begin
    if PrintDialog.Execute then
    try
      if IsWinXP then
       IniciarEspera;
      Grid.Enabled := False;
      fraVistaTIFF.Enabled := False;

      for i:=0 to Grid.SelectedRows.Count-1 do
      begin
        WriteStatusText('Buscando Selección...');
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
        if IsWinXP then
          IniciarEspera(Format('Imprimiendo %d/%d ', [i + 1, Grid.SelectedRows.Count]));
        try
          PrintRecord(False, True);
        finally
          if IsWinXP then
            DetenerEspera;
        end;
      end;
    finally
      if IsWinXP then
        DetenerEspera;
      Grid.Enabled := True;
      fraVistaTIFF.Enabled := True;
    end;
    sdqConsulta.Refresh;
    WriteStatusText('');
  end;
end;

procedure TfrmConsFax.mnuSelTodoClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmConsFax.mnuSelLimpiarClick(Sender: TObject);
begin
  Grid.UnselectAll;
end;

procedure TfrmConsFax.mnuSelInvertirClick(Sender: TObject);
begin
  Grid.InvertSelection;
end;

procedure TfrmConsFax.tbPropiedadesClick(Sender: TObject);
begin
  pnlVistaPrevia.Visible := tbPropiedades.Down;
  Splitter.Visible := tbPropiedades.Down;
  dsConsultaDataChange(nil, nil);
end;

procedure TfrmConsFax.SetPage(AValue: Integer);
begin
  eEstrategiaTiff.SetPage(AValue);
end;

procedure TfrmConsFax.tbPageFirstClick(Sender: TObject);
begin
  eEstrategiaTiff.FirstImage(Sender);
end;

procedure TfrmConsFax.tbPagePriorClick(Sender: TObject);
begin
  eEstrategiaTiff.PriorImage(Sender);
end;

procedure TfrmConsFax.tbPageNextClick(Sender: TObject);
begin
  eEstrategiaTiff.NextImage(Sender);
end;

procedure TfrmConsFax.tbPageLastClick(Sender: TObject);
begin
  eEstrategiaTiff.LastImage(Sender);
end;

procedure TfrmConsFax.edPageKeyPress(Sender: TObject; var Key: Char);
begin
  with fraVistaTIFF do
  if Key = #13 then
  begin
    sdqPaginas.First;
    sdqPaginas.MoveBy(edPage.Value -1);
    SetPage(edPage.Value);
  end;
end;

procedure TfrmConsFax.ClearData;
begin
  fraFiltroFormulario.Clear;
  edRecibidoDesde.Date := DBDate - 7;
  edRecibidoHasta.Clear;
  {edHoraDesde.Clear;
  edHoraHasta.Clear;}
  chkNoImpresos.Checked := True;
  chkActivos.Checked    := True;
  cmbErrores.ItemIndex  := 0;
  edCodigo.Clear;
  edNroOrden.Clear;
  ListaFormularios.ClearChecks;

  inherited;
end;

procedure TfrmConsFax.tbModificarClick(Sender: TObject);
begin
  inherited;
  BeginTrans;
  try
    EjecutarSqlST('UPDATE FFE_FAXENTRANTES ' +
                         'SET FE_IDFORMULARIO =  ' + SqlValue(sdqConsulta.FieldByName('FE_IDFORMULARIO').AsString) +
                   'WHERE FE_NROORDEN = ' + SqlValue(sdqConsulta.FieldByName('FE_NROORDEN').AsString));
    CommitTrans;
  except
    RollBack;
    raise;
  end;
  sdqConsulta.Refresh;
end;

procedure TfrmConsFax.tbEliminarClick(Sender: TObject);
var
  i: Integer;
begin
  if Grid.SelectedRows.Count = 0 Then
    MsgBox('Debe seleccionar al menos un fax para poder darlo de baja', MB_ICONEXCLAMATION)

  else if MsgAsk('¿Desea dar de baja el/los fax/es seleccionados?') then
  begin
    BeginTrans;
    try
      for i:=0 to Grid.SelectedRows.Count-1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        EjecutarSqlST('UPDATE FFE_FAXENTRANTES ' +
                         'SET FE_FECHABAJA = SYSDATE ' +
                       'WHERE FE_NROORDEN = ' + SqlValue(sdqConsulta.FieldByName('FE_NROORDEN').AsString));
      end;
      CommitTrans;
    except
      RollBack;
      raise;
    end;
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmConsFax.ClearControls;
begin
  inherited;
  fraFE_IDFORMULARIO.Clear;
end;

function TfrmConsFax.DoABM: Boolean;
var
  i: integer;
begin
  Result := False;

  if Grid.SelectedRows.Count > 0 then
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
      Sql.Clear;
      Sql.PrimaryKey.Add('FE_NROORDEN', sdqConsulta.FieldByName('FE_NROORDEN').AsString);
      Sql.Fields.Add('FE_IDFORMULARIO', fraFE_IDFORMULARIO.Value);

      Result := inherited DoABM;
    end
  else begin
    Sql.Clear;
    Sql.PrimaryKey.Add('FE_NROORDEN', sdqConsulta.FieldByName('FE_NROORDEN').AsString);
    Sql.Fields.Add('FE_IDFORMULARIO', fraFE_IDFORMULARIO.Value);

    Result := inherited DoABM;
  end;
end;

procedure TfrmConsFax.LoadControls;
begin
  fraFE_IDFORMULARIO.Value := sdqConsulta.FieldByName('FE_IDFORMULARIO').Value;
end;

function TfrmConsFax.Validar: Boolean;
begin
  Result := False;
  if fraFE_IDFORMULARIO.IsEmpty Then
    InvalidMsg(fraFE_IDFORMULARIO.edCodigo, 'Debe seleccionar un Formulario')
  else
    Result := True;
end;

procedure TfrmConsFax.dsConsultaDataChange(Sender: TObject; Field: TField);
var
  sSql : String;
begin
  inherited;

  if pnlVistaPrevia.Visible then
    with fraVistaTIFF do
    if FileExists(sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString) Then
    begin
      if sdqConsulta.FieldByName('FE_MULTIPAGINAS').AsString = 'N' then
      begin
        try
          if chkNoImpresos.Checked Then
            sSql := sSql + 'AND FE_FECHAIMPRESION IS NULL ';

          if chkActivos.Checked Then
            sSql := sSql + 'AND FE_FECHABAJA IS NULL ';

          case cmbErrores.ItemIndex of
            1: sSql := sSql + 'AND FE_ERRORFECHA IS NULL ';
            2: sSql := sSql + 'AND FE_ERRORFECHA IS NOT NULL ';
          end;

          OpenQuery(fraVistaTIFF.sdqPaginas, 'SELECT FE_ARCHIVOIMAGEN from ART.FFE_FAXENTRANTES where FE_NROORDEN = '+ sdqConsulta.FieldByName('FE_NROORDEN').AsString + sSql);

          if Assigned(eEstrategiaTiff) then eEstrategiaTiff.Free;
          // Crea una estrategia para una pagina de tiff por registro de nro de orden.
          eEstrategiaTiff := TEstrategiaTiffSimple.Create(Self);
        except
         on E: Exception do
           ErrorMsgFmt(E, 'Error al buscar la siguiente página.', []);
        end;
      end
      else begin
        if Assigned(eEstrategiaTiff) then eEstrategiaTiff.Free;
        // Crea una estrategia para un tiff multi paginas ( un solo registro para nro de orden).
        eEstrategiaTiff := TEstrategiaTiffMulti.Create(self);
      end;

      eEstrategiaTiff.Vista := fraVistaTIFF;
    
      PageCount    := sdqConsulta.FieldByName('FE_PAGINAS').AsInteger;
      MultiPage    := sdqConsulta.FieldByName('FE_MULTIPAGINAS').AsString <> 'N';
      ID           := sdqConsulta.FieldByName('FE_ID').AsInteger;
      IDFormulario := sdqConsulta.FieldByName('FE_IDFORMULARIO').AsInteger;
      NroOrden     := sdqConsulta.FieldByName('FE_NROORDEN').AsString;
      tbAbrirImagen.Enabled := True;

      pnlImgStatus.Font.Color := clWindowText;
      try
        Image := sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString;
        pnlImgStatus.Caption := Format('Archivo:%s Alto:%d Ancho:%d', [ExtractFileName(Image), ImageHeight, ImageWidth]);
      except
        on E: Exception do
        begin
          Image := '';
          pnlImgStatus.Font.Color := clRed;
          pnlImgStatus.Caption := 'Error al recuperar la imagen ' + ExtractFileName(Image) + ':' + StringReplace(StringReplace(E.Message, #13, ', ', [rfReplaceAll]), #10, #0, [rfReplaceAll]);
        end;
      end;
    end
    else
    begin
      Image := '';
      fraVistaTIFF.tbAbrirImagen.Enabled := False;
      pnlImgStatus.Font.Color := clRed;
      pnlImgStatus.Caption := 'El archivo no existe (' + ExtractFileName(Image) + ')';
    end;
end;

procedure TfrmConsFax.mnuImpresionAutomaticaClick(Sender: TObject);
var
  ATickCount: DWORD;
const
  WAIT_TIME = 180000;
begin
  try
    if PrintDialog.Execute Then
    begin
      chkActivos.Checked    := True;
      chkNoImpresos.Checked := True;
      cmbErrores.ItemIndex  := 1;
      FImprimeTodo := True;
      RefreshData;
      fpImpresionAutomatica.ShowOnTop;
      try
        FIACancel := False;
        pbImpAutom.Max := WAIT_TIME;
        Grid.Enabled := False;
        fraVistaTIFF.imgFax.Enabled := False;
        repeat
          ImprimirTodo;

          WriteStatusText('Esperando...');
          pbImpAutom.Position := 0;
          ATickCount := GetTickCount + WAIT_TIME;
          while (ATickCount > GetTickCount) and (not FIACancel) do
          begin
            try
              lbImpAutom.Caption  := 'Esperando ' + TimeToStr((ATickCount - GetTickCount) * MILLISECOND) + '...';
              pbImpAutom.Position := WAIT_TIME - (ATickCount - GetTickCount);
              //pbImpAutom.Position := Abs(WAIT_TIME - (ATickCount - GetTickCount)) mod WAIT_TIME; {El mod es por si se traba, para que no de un error}
            except
            end;

            Delay(500); {El delay es para que no flashee constantemente }
            Application.ProcessMessages;
          end;
        until FIACancel;
      finally
        fpImpresionAutomatica.Close;
        FImprimeTodo := False;
        Grid.Enabled := True;
        fraVistaTIFF.imgFax.Enabled := True;
      end;
    end;
  except
  end;
end;

procedure TfrmConsFax.btnImpAutCancelClick(Sender: TObject);
begin
  FIACancel := True;
end;

procedure TfrmConsFax.ImprimirTodo;
begin
  WriteStatusText('Buscando Novedades...');
  sdqConsulta.Refresh;
  sdqConsulta.First;
  if not sdqConsulta.IsEmpty Then
  begin
    fpImpresionAutomatica.Close;
    try
      repeat
        Caption := sdqConsulta.FieldByName('FE_ID').AsString;
        try
          PrintRecord(False, False);
        except
        end;
        sdqConsulta.Next;
      until sdqConsulta.Eof;
    finally
      fpImpresionAutomatica.ShowOnTop;
    end;
  end;
end;

procedure TfrmConsFax.PrintRecord(AHandleErrors: Boolean; AIgnoreErrors: Boolean );
begin
  if (fraVistaTIFF.pnlImgStatus.Font.Color = clWindowText) Then
  begin
    try
      eEstrategiaTiff.PrintRecord(AHandleErrors,AIgnoreErrors);
    except
      on E: Exception do
      begin
        if AHandleErrors Then
        begin
          WriteStatusText('Marcando Imagen como Errónea...');
          EjecutarSql('UPDATE FFE_FAXENTRANTES ' +
                         'SET FE_ERRORDESCRIPCION = SUBSTR(' + SqlValue(E.Message + #13#10 + StatusBar.SimpleText) + ', 1, 255), ' +
                             'FE_ERRORFECHA = SYSDATE ' +
                       'WHERE FE_ID = ' + SqlValue(sdqConsulta.FieldByName('FE_NROORDEN').AsString));
        end
        else
          raise;
      end;
    end;
  end;
end;

procedure TfrmConsFax.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  tbImprimir.Enabled := True;
  mnuImpResultados.Enabled := AEnabled and bAllowPrint;
end;

{function TfrmConsFax.CheckImagen: Boolean;
var
  iPage: Integer;
begin
  try
    for iPage := 1 to imgFax.PageCount do
    begin
      imgFax.Page := iPage;
      imgFax.Display;
    end;

    Result := True;
  except
    Result := False;
  end;
end;}

procedure TfrmConsFax.tbVerificarArchivosClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty Then
  begin
    BeginTrans;
    try
      with TDataCycler.Create(sdqConsulta) do
        try
          repeat
            if not FileExists(sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString) Then
            begin
              EjecutarSqlST('UPDATE FFE_FAXENTRANTES ' +
                               'SET FE_FECHABAJA = SYSDATE ' +
                             'WHERE FE_ID = ' + SqlValue(sdqConsulta.FieldByName('FE_ID').AsInteger));
            end else
            begin
              try
                LoadTiffIntoImageControl(sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString, imgHidden);
              except
                EjecutarSqlST('UPDATE FFE_FAXENTRANTES ' +
                                 'SET FE_FECHABAJA = SYSDATE ' +
                               'WHERE FE_ID = ' + SqlValue(sdqConsulta.FieldByName('FE_ID').AsInteger));
              end;
            end;
          until not Cycle;
        finally
          Free;
        end;

      CommitTrans;
    except
      RollBack;
      raise;
    end;
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmConsFax.tbSalirClick(Sender: TObject);
begin
  inherited; { Para el segundo botón Salir }
end;

procedure TfrmConsFax.tbCantidadDeHojasClick(Sender: TObject);
begin
  MsgBoxFmt('Cantidad de Páginas: %6.0f'#13#10'Cantidad de Faxes:    %6d', [SumField(sdqConsulta, 'FE_PAGINAS'), sdqConsulta.RecordCount]);
end;

procedure TfrmConsFax.WriteRefFile(AFileName, Texto: String);
var
  FS: TFileStream;
  iLen: Integer;
  sRef: string;
begin
  FS := TFileStream.Create(AFileName, fmCreate);
  try
    sRef := Texto;
    iLen := Length(sRef);
    FS.WriteBuffer(sRef[1], iLen);
  finally
    FS.Free;
  end;
end;

procedure TfrmConsFax.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if FileExists(ARefFile) Then
    DeleteFile(ARefFile);

  if Assigned(eEstrategiaTiff) then
    eEstrategiaTiff.Free;
end;

end.
