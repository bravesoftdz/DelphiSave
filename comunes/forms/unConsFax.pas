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
  {$IFNDEF VER130}Types, Variants, {$ENDIF}
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
  JvComponent, JvXPCore, JvXPCheckCtrls, JvNetscapeSplitter, ImgList,
  AdvGroupBox, AdvOfficeButtons;

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
    edNroOrden: TPatternEdit;
    cmbErrores: TComboBox;
    ListaFormularios: TARTCheckListBox;
    imgHidden: TImage;
    Splitter: TJvNetscapeSplitter;
    ilByN: TImageList;
    ilColor: TImageList;
    pnlStatus: TPanel;
    rgImpresion: TAdvOfficeRadioGroup;
    rgActivos: TAdvOfficeRadioGroup;
    rgDescartadas: TAdvOfficeRadioGroup;
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
    procedure pmnuImprimirPopup(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure fraVistaTIFFtbImprimirClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
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
  unEspera, unSesion, unImageFunctions, unMoldeEnvioMail, VCLExtra;

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
                    '       DECODE(FFE2.CANTIDAD, 1, ''S'', ''N'') FE_MULTIPAGINAS, FU_SOLOLECTURA SOLO_LECTURA, ' +
                    '       FE_USUMODIF, TO_CHAR(FE_FECHAMODIF, ''DD/MM/YYYY'') as FE_FECHAMODIF, ' +
                    '       TO_CHAR(FE_FECHAMODIF, ''HH24:MI'') as FE_HORAMODIF ' +
                    '  FROM ART.FFE_FAXENTRANTES FFE, ART.FFU_FORMULARIOUSUARIO, ART.FFO_FAXFORMULARIO, ';
  sSubSelect :=     '       (SELECT FE_NROORDEN, MIN (FE_ID) FE_ID, COUNT (*) CANTIDAD' +
                    '          FROM ART.FFE_FAXENTRANTES FFE1, ART.FFO_FAXFORMULARIO ';
  sSql:=            '         WHERE FO_ID = FE_IDFORMULARIO ';
{
                    '           AND EXISTS (SELECT 1 ' +
                                            ' FROM ART.FFU_FORMULARIOUSUARIO ' +
                                           ' WHERE FU_IDFORMULARIO = FE_IDFORMULARIO ' +
                                             ' AND FU_FECHABAJA IS NULL ' +
                                             ' AND FU_USUARIO = ' + SqlValue(Sesion.UserID) + ') ';
}                                             
  sSubSelectGroup:= '     GROUP BY FE_NROORDEN) FFE2 ';
  sSelectWhere :=   ' WHERE FO_ID = FE_IDFORMULARIO ' +
                    '   AND FU_IDFORMULARIO = FFE.FE_IDFORMULARIO ' +
                    '   AND FU_FECHABAJA IS NULL ' +
                    '   AND FU_USUARIO = ' + SqlValue(Sesion.UserID) +
                    '   AND FFE.FE_ID = FFE2.FE_ID ';

  if fraFiltroFormulario.IsSelected then
    sSql := sSql + 'AND FE_IDFORMULARIO = ' + SqlValue(fraFiltroFormulario.Value) + ' ';

  if not edRecibidoDesde.IsEmpty then
    sSql := sSql + 'AND FE_FECHAINGRESO >= ' + SqlDate(edRecibidoDesde.Date) + ' ';

  if not edRecibidoHasta.IsEmpty then
    sSql := sSql + 'AND FE_FECHAINGRESO < ' + SqlDate(edRecibidoHasta.Date) + ' +1 ';

  if ListaFormularios.CheckCount > 0 then
    AddCondition(sSQL, ' 1 = 1 ' + ListaFormularios.InSQL_StringValues('FE_IDFORMULARIO', False));

  {if edHoraDesde.Time > 0 then
    sSql := sSql + 'AND TO_DATE(TO_CHAR(FE_FECHAINGRESO, ''HH24:MI:SS''), ''HH24:MI:SS'') <= ' + SqlTime(edHoraDesde.Time) + ' ';

  if edHoraHasta.Time > 0 then
    sSql := sSql + 'AND TO_DATE(TO_CHAR(FE_FECHAINGRESO, ''HH24:MI:SS''), ''HH24:MI:SS'') >= ' + SqlTime(edHoraHasta.Time) + ' ';}

  if edCodigo.Value <> 0 then
    sSql := sSql + 'AND FE_ID = ' + SqlValue(edCodigo.Value) + ' ';

  if edNroOrden.Text <> '' then
    sSql := sSql + 'AND FE_NROORDEN = ' + SqlValue(edNroOrden.Text) + ' ';

  case rgImpresion.ItemIndex of
    1: sSelectWhere := sSelectWhere + ' AND FE_FECHAIMPRESION IS NOT NULL ';
    2:
      begin
        sSql := sSql + 'AND NOT EXISTS (SELECT 1' +
                                        ' FROM ART.FFE_FAXENTRANTES FFE2' +
                                       ' WHERE FFE2.FE_NROORDEN = FFE1.FE_NROORDEN' +
                                         ' AND FFE2.FE_ID <> FFE1.FE_ID' +
                                         ' AND (FFE2.FE_FECHAIMPRESION IS NOT NULL OR NVL(FFE2.FE_FECHAMODIF, FFE2.FE_FECHAIMPRESION) > FFE2.FE_FECHAIMPRESION)) ';

        sSelectWhere := sSelectWhere + ' AND (FE_FECHAIMPRESION IS NULL OR NVL(FE_FECHAMODIF, FE_FECHAIMPRESION) > FE_FECHAIMPRESION) ';
      end;
  end;

  case rgDescartadas.ItemIndex of
    1: sSql := sSql + 'AND EXISTS(SELECT 1 ' +
                                   'FROM SIN.SGI_GESTIONIMAGENES ' +
                                  'WHERE GI_IDFAXENTRANTE = FE_ID ' +
                                    'AND GI_FECHADESCARTADO IS NOT NULL) ';
    2: sSql := sSql + 'AND NOT EXISTS(SELECT 1 ' +
                                       'FROM SIN.SGI_GESTIONIMAGENES ' +
                                      'WHERE GI_IDFAXENTRANTE = FE_ID ' +
                                        'AND GI_FECHADESCARTADO IS NOT NULL) ';
  end;
  
  case rgActivos.ItemIndex of
    1: sSql := sSql + 'AND FE_FECHABAJA IS NULL ';
    2: sSql := sSql + 'AND FE_FECHABAJA IS NOT NULL ';
  end;

  case cmbErrores.ItemIndex of
    1: sSql := sSql + 'AND FE_ERRORFECHA IS NULL ';
    2: sSql := sSql + 'AND FE_ERRORFECHA IS NOT NULL ';
  end;

  if FImprimeTodo = True then
    sSelectWhere := sSelectWhere + ' AND FE_FECHAALTA >= ART.ACTUALDATE - 3';

  sdqConsulta.Sql.Text := sSelect + sSubSelect + sSql + sSubSelectGroup + sSelectWhere + SortDialog.OrderBy;
  inherited;

  WriteStatusText('Total de registros: ' + IntToStr(sdqConsulta.RecordCount));
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

  ToolBar.Images    := ilByN;
  ToolBar.HotImages := ilColor;
  
  tbRefrescar.ImageIndex              := 0;
  tbNuevo.ImageIndex                  := 6;
  tbModificar.ImageIndex              := 7;
  tbEliminar.ImageIndex               := 8;
  tbPropiedades.ImageIndex            := 14;
  tbLimpiar.ImageIndex                := 1;
  tbOrdenar.ImageIndex                := 2;
  tbMostrarOcultarColumnas.ImageIndex := 9;
  tbImprimir.ImageIndex               := 4;
  tbExportar.ImageIndex               := 3;
  tbEnviarMail.ImageIndex             := 31;
  tbMostrarFiltros.ImageIndex         := 11;
  tbMaxRegistros.ImageIndex           := 12;
  tbSalir.ImageIndex                  := 5;
  
  fraFiltroFormulario.Usuario := Sesion.UserID;
  FieldBaja   := 'FE_FECHABAJA';
  ShowActived := False;
  Sql.TableName := 'FFE_FAXENTRANTES';
  hScale := 0;
  edRecibidoDesde.Date := DBDate - 7;
  cmbErrores.ItemIndex  := 0;
  ARefFile := GetTempFileNameEx;
  fraVistaTIFF.PanelAuxVisible := True;
  fraVistaTIFF.DataSource := dsConsulta;
  VCLExtra.LockControls([rgDescartadas], not AreIn(Sesion.Sector, ['COMPUTOS', 'CARGAAM']));
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
  if Grid.SelectedRows.Count = 0 then
    InfoHint(nil, 'Debe seleccionar al menos un fax para poder imprimir la imagen.')
  else
  begin
    PrintDialog.Copies := 1;
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
  rgImpresion.ItemIndex := 2;
  rgActivos.ItemIndex := 1;
  rgDescartadas.ItemIndex := 0;
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
  with sdqConsulta do
  try
    EjecutarSqlSTEx('UPDATE FFE_FAXENTRANTES ' +
                       'SET FE_IDFORMULARIO = :IdFormulario, ' +
                          ' FE_USUMODIF = :Usuario, ' +
                          ' FE_FECHAMODIF = SYSDATE ' +
                     'WHERE FE_NROORDEN = :Orden', [FieldByName('FE_IDFORMULARIO').AsInteger,
                                                    Sesion.UserID,
                                                    FieldByName('FE_NROORDEN').AsString]);
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
  if Grid.SelectedRows.Count = 0 then
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
  if fraFE_IDFORMULARIO.IsEmpty then
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
    if FileExists(sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString) then
    begin
      if sdqConsulta.FieldByName('FE_MULTIPAGINAS').AsString = 'N' then
      begin
        try
          if rgImpresion.ItemIndex = 2 then
            sSql := sSql + 'AND FE_FECHAIMPRESION IS NULL ';

          if rgActivos.ItemIndex = 1 then
            sSql := sSql + 'AND FE_FECHABAJA IS NULL ';

          case cmbErrores.ItemIndex of
            1: sSql := sSql + 'AND FE_ERRORFECHA IS NULL ';
            2: sSql := sSql + 'AND FE_ERRORFECHA IS NOT NULL ';
          end;

          OpenQuery(fraVistaTIFF.sdqPaginas, 'SELECT FE_ARCHIVOIMAGEN from ART.FFE_FAXENTRANTES where FE_NROORDEN = ' + sdqConsulta.FieldByName('FE_NROORDEN').AsString + sSql);

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

      try
        Image   := sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString;
        Mensaje := Format('Archivo: %s Alto: %d Ancho: %d', [ExtractFileName(Image), ImageHeight, ImageWidth]);
      except
        on E: Exception do
        begin
          Image   := '';
          Mensaje := 'Error al recuperar la imagen ' + ExtractFileName(Image) + ': ' + StringReplace(StringReplace(E.Message, #13, ', ', [rfReplaceAll]), #10, #0, [rfReplaceAll]);
        end;
      end;
    end
    else
    begin
      Image := '';
      fraVistaTIFF.tbAbrirImagen.Enabled := False;
      Mensaje := 'Error: El archivo no existe (' + ExtractFileName(Image) + ')';
    end;

  fraVistaTIFF.MoverEnDataSource(nil);
end;

procedure TfrmConsFax.mnuImpresionAutomaticaClick(Sender: TObject);
var
  ATickCount: DWORD;
const
  WAIT_TIME = 180000;
begin
  try
    if PrintDialog.Execute then
    begin
      rgActivos.ItemIndex := 1;
      rgImpresion.ItemIndex := 2;
      cmbErrores.ItemIndex  := 1;
      FImprimeTodo := True;
      RefreshData;
      fpImpresionAutomatica.ShowOnTop;
      try
        FIACancel := False;
        pbImpAutom.Max := WAIT_TIME;
        Grid.Enabled := False;
        fraVistaTIFF.imgVista.Enabled := False;
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
        fraVistaTIFF.imgVista.Enabled := True;
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
  if not sdqConsulta.IsEmpty then
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
  if not fraVistaTiff.ImagenConError then
  begin
    try
      eEstrategiaTiff.PrintRecord(AHandleErrors,AIgnoreErrors);
    except
      on E: Exception do
      begin
        if AHandleErrors then
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
  if not sdqConsulta.IsEmpty then
  begin
    BeginTrans;
    try
      with TDataCycler.Create(sdqConsulta) do
        try
          repeat
            if not FileExists(sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString) then
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
                                 'SET FE_ERRORFECHA = SYSDATE ' +
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
  if FileExists(ARefFile) then
    DeleteFile(ARefFile);

  if Assigned(eEstrategiaTiff) then
    eEstrategiaTiff.Free;
end;

procedure TfrmConsFax.pmnuImprimirPopup(Sender: TObject);
begin
  inherited;
  mnuImpImagenes.Enabled := sdqConsulta.FieldByName('SOLO_LECTURA').AsString = 'N';
  fraVistaTIFF.tbImprimir.Enabled := mnuImpImagenes.Enabled;
  tbModificar.Enabled := mnuImpImagenes.Enabled;
  mnuImpresionAutomatica.Enabled := mnuImpImagenes.Enabled;
end;

procedure TfrmConsFax.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with sdqConsulta do
  if Active and (not IsEmpty) and (not FieldByName('FE_USUMODIF').IsNull) then
  begin
    pnlStatus.Caption := 'Última modificación realizada por ' + FieldByName('FE_USUMODIF').AsString + ' el día ' + FieldByName('FE_FECHAMODIF').AsString + ' a las ' + FieldByName('FE_HORAMODIF').AsString;
    pnlStatus.Visible := True;
  end else
  begin
    pnlStatus.Caption := '';
    pnlStatus.Visible := False;
  end;
  pmnuImprimirPopup(nil);
end;

procedure TfrmConsFax.fraVistaTIFFtbImprimirClick(Sender: TObject);
begin
  inherited;
  fraVistaTIFF.tbImprimirClick(Sender);
end;

procedure TfrmConsFax.tbEnviarMailClick(Sender: TObject);
var
  i: Integer;
  arrAdjuntos: TArrayOfAttach;
begin
  inherited;
  if Grid.SelectedRows.Count = 0 then
    InfoHint(nil, 'Debe seleccionar al menos un fax para poder enviar por correo.')
  else
  begin
    try
      if IsWinXP then
       IniciarEspera;
      Grid.Enabled := False;
      fraVistaTIFF.Enabled := False;
      SetLength(arrAdjuntos, Grid.SelectedRows.Count);

      for i:=0 to Grid.SelectedRows.Count-1 do
      begin
        WriteStatusText('Buscando Selección...');
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
        if IsWinXP then
          IniciarEspera(Format('Adjuntando %d/%d ', [i + 1, Grid.SelectedRows.Count]));
        try
          arrAdjuntos[i] := GetAttach(fraVistaTIFF.Image, 0);
        finally
          if IsWinXP then
            DetenerEspera;
        end;
      end;

      if EnviarMailBD('', 'Enviando imagen del Servidor de Fax', [oAlwaysShowDialog, oShowDialogIfEmpty, oAutoFirma, oDeleteAttach], 'Se adjunta la imagen recibida por fax.', arrAdjuntos) then
        if MsgAsk('¿Desea marcar las imágenes enviadas como impresas?') then
          for i:=0 to Grid.SelectedRows.Count-1 do
          begin
            WriteStatusText('Buscando Selección...');
            sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
            if IsWinXP then
              IniciarEspera(Format('Marcando impresión %d/%d ', [i + 1, Grid.SelectedRows.Count]));
            try
              fraVistaTIFF.MarcarImpresion;
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

procedure TfrmConsFax.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (Field.FieldName = 'FE_FECHAIMPRESION') and (not VarIsNull(Field.Value)) then
    BackGround := $00E1E1E1;
end;

end.
