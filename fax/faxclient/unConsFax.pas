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
  Graphics, unCustomConsulta, AxCtrls, OleCtrls, ImgeditLib_TLB, Forms,
  unArtFrame, unFraStaticCodigoDescripcion, unfraFFO_FAXFORMULARIO,
  ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, DateTimeEditors,
  ExtCtrls, FieldHider, ShortCutControl, Dialogs, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Controls, ComCtrls, ToolWin,
  Classes, Menus, IntEdit, CurrEdit, unCustomGridABM, FormPanel,
  AdminLib_TLB, unArtDBAwareFrame, ImgeditLibCtl_TLB, unEstrategiaTIFF,
  DBOleCtl, JvExExtCtrls, JvNetscapeSplitter;

type

  TfrmConsFax = class(TfrmCustomGridABM)
    Label1: TLabel;
    lbRecibido: TLabel;
    edRecibidoDesde: TDateComboBox;
    edRecibidoHasta: TDateComboBox;
    fraFiltroFormulario: TfraFFO_FAXFORMULARIO;
    Label3: TLabel;
    pmnuImprimir: TPopupMenu;
    mnuImpResultados: TMenuItem;
    mnuImpImagenes: TMenuItem;
    pmnuSeleccion: TPopupMenu;
    mnuSelTodo: TMenuItem;
    mnuSelLimpiar: TMenuItem;
    mnuSelInvertir: TMenuItem;
    pnlVistaPrevia: TPanel;
    imgFax: TImgEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbZoomDec: TToolButton;
    edZoom: TCurrencyEdit;
    tbZoomInc: TToolButton;
    ToolButton10: TToolButton;
    tbPageFirst: TToolButton;
    tbPagePrior: TToolButton;
    edPage: TIntEdit;
    edPageCount: TIntEdit;
    tbPageNext: TToolButton;
    tbPageLast: TToolButton;
    ToolButton1: TToolButton;
    pnlImgStatus: TPanel;
    fraFE_IDFORMULARIO: TfraFFO_FAXFORMULARIO;
    Label5: TLabel;
    fpImpresionAutomatica: TFormPanel;
    Bevel1: TBevel;
    btnImpAutCancel: TButton;
    pbImpAutom: TProgressBar;
    N1: TMenuItem;
    mnuImpresionAutomatica: TMenuItem;
    lbImpAutom: TLabel;
    Label6: TLabel;
    edCodigo: TIntEdit;
    gbEstado: TGroupBox;
    chkActivos: TCheckBox;
    chkNoImpresos: TCheckBox;
    lbNroDeOrden: TLabel;
    edNroOrden: TPatternEdit;
    tbVerificarArchivos: TToolButton;
    Label2: TLabel;
    cmbErrores: TComboBox;
    tbAbrirImagen: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    tbCantidadDeHojas: TToolButton;
    tbGuardarImagen: TToolButton;
    sd: TSaveDialog;
    Splitter: TJvNetscapeSplitter;
    procedure FormCreate(Sender: TObject);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImpImagenesClick(Sender: TObject);
    procedure mnuSelTodoClick(Sender: TObject);
    procedure mnuSelLimpiarClick(Sender: TObject);
    procedure mnuSelInvertirClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure imgFaxLoad(Sender: TObject; Zoom: Double);
    procedure tbZoomDecClick(Sender: TObject);
    procedure tbZoomIncClick(Sender: TObject);
    procedure edZoomKeyPress(Sender: TObject; var Key: Char);
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
    procedure tbAbrirImagenClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbCantidadDeHojasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbGuardarImagenClick(Sender: TObject);
    procedure SetZoom(AValue: Single);
    procedure SetPage(AValue: Integer);
    procedure ImprimirTodo;
    procedure ImprimirRegistro(AHandleErrors: Boolean; AIgnoreErrors: Boolean = False);
    procedure WriteRefFile(AFileName, Texto: String);
    procedure imgFaxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgFaxDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure imgFaxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgFaxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    xAnterior, yAnterior: integer;
    bDetenerMovimiento, bMoviendo: boolean;
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
    QPaginas: TSDQuery;
    // estrategia para la visualizacion del tiff multi paginas o simple.
    eEstrategiaTiff : TEstrategiaTiff;
  end;

implementation

uses
  Windows, SysUtils, Printers, unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs,
  Math, General, CustomDlgs, SpoolFuncs, DateTimeFuncs, DBFuncs, ArchFuncs,
  unEspera, unSesion, Types;

{$R *.DFM}

{ TfrmConsFax }
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.RefreshData();
var
  sSelect, sSubSelect, sSql, sSubSelectGroup, sSelectWhere: string;
begin
  Verificar(not ((edRecibidoDesde.Date > 0) or (edRecibidoHasta.Date > 0)), edRecibidoDesde, 'Debe indicar al menos una fecha de referencia para poder ver los datos.');   

  WriteStatusText('Ejecutando consulta de Selección de Datos...');

  sSelect :=        'SELECT FFE.FE_ID, FFE.FE_IDFORMULARIO, FO_DESCRIPCION, TO_CHAR(FFE.FE_NROORDEN) AS FE_NROORDEN, ' +
                    '       DECODE(FFE2.CANTIDAD, 1, FFE.FE_PAGINAS, FFE2.CANTIDAD) FE_PAGINAS, FFE.FE_ARCHIVOIMAGEN, FE_FECHAINGRESO, FE_FECHAALTA,' +
                    '       FE_USUVISUALIZA, FE_FECHAVISUALIZA, FE_USUIMPRESION, FE_FECHAIMPRESION, FE_FECHABAJA, ' +
                    '       DECODE(FFE2.CANTIDAD, 1, ''S'', ''N'') FE_MULTIPAGINAS' +
                    '  FROM ART.FFE_FAXENTRANTES FFE, ART.FFO_FAXFORMULARIO, ';
  sSubSelect :=     '       (SELECT FE_NROORDEN, MIN (FE_ID) FE_ID, COUNT (*) CANTIDAD' +
                    '          FROM ART.FFE_FAXENTRANTES, ART.FFO_FAXFORMULARIO ';
  sSql:=            '         WHERE FO_ID = FE_IDFORMULARIO' +
                    '           AND EXISTS (SELECT 1 ' +
                                            ' FROM ART.FFU_FORMULARIOUSUARIO ' +
                                           ' WHERE FU_IDFORMULARIO = FE_IDFORMULARIO ' +
                                             ' AND FU_USUARIO = ' + SqlValue(Sesion.UserID) + ') ';
  sSubSelectGroup:= '     GROUP BY FE_NROORDEN) FFE2 ';
  sSelectWhere :=   ' WHERE FO_ID = FE_IDFORMULARIO AND FFE.FE_ID = FFE2.FE_ID ';

  if fraFiltroFormulario.IsSelected Then
    sSql := sSql + 'AND FE_IDFORMULARIO = ' + SqlValue(fraFiltroFormulario.Value) + ' ';

  if not edRecibidoDesde.IsEmpty Then
    sSql := sSql + 'AND FE_FECHAINGRESO >= ' + SqlDate(edRecibidoDesde.Date) + ' ';

  if not edRecibidoHasta.IsEmpty Then
    sSql := sSql + 'AND FE_FECHAINGRESO < ' + SqlDate(edRecibidoHasta.Date) + ' +1 ';

  {if edHoraDesde.Time > 0 Then
    sSql := sSql + 'AND TO_DATE(TO_CHAR(FE_FECHAINGRESO, ''HH24:MI:SS''), ''HH24:MI:SS'') <= ' + SqlTime(edHoraDesde.Time) + ' ';

  if edHoraHasta.Time > 0 Then
    sSql := sSql + 'AND TO_DATE(TO_CHAR(FE_FECHAINGRESO, ''HH24:MI:SS''), ''HH24:MI:SS'') >= ' + SqlTime(edHoraHasta.Time) + ' ';}

  if edCodigo.Value <> 0 Then
    sSql := sSql + 'AND FE_ID = ' + SqlValue(edCodigo.Value) + ' ';

  if edNroOrden.Text <> '' Then
    sSql := sSql + 'AND FE_NROORDEN = ' + SqlValue(edNroOrden.Text) + ' ';

  if chkNoImpresos.Checked Then
    sSql := sSql + 'AND FE_FECHAIMPRESION IS NULL ';

  if chkActivos.Checked Then
    sSql := sSql + 'AND FE_FECHABAJA IS NULL ';

  case cmbErrores.ItemIndex of
    1: sSql := sSql + 'AND FE_ERRORFECHA IS NULL ';
    2: sSql := sSql + 'AND FE_ERRORFECHA IS NOT NULL ';
  end;

  if FImprimeTodo = True then
    sSelectWhere := sSelectWhere + ' AND FE_FECHAALTA <= SYSDATE - .0104';

  sdqConsulta.Sql.Text := sSelect + sSubSelect + sSql + sSubSelectGroup + sSelectWhere + SortDialog.OrderBy;
  inherited;

  WriteStatusText('');
end;

{-------------------------------------------------------------------------------}
procedure TfrmConsFax.FormCreate(Sender: TObject);
begin
  inherited;
  StatusBar := frmPrincipal.sbEstado;
  fraFiltroFormulario.Usuario := Sesion.UserID;
  FieldBaja   := 'FE_FECHABAJA';
  ShowActived := False;
  Sql.TableName := 'FFE_FAXENTRANTES';
  hScale := 0;
  edRecibidoDesde.Date := DBDate - 7;
  cmbErrores.ItemIndex  := 0;
  ARefFile := GetTempFileNameEx;
  QPaginas := TSDQuery.Create(self);
  bMoviendo := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.mnuImpResultadosClick(Sender: TObject);
begin
  PrintResults;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
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
      IniciarEspera;
      Grid.Enabled := False;
      imgFax.Enabled := False;

      for i:=0 to Grid.SelectedRows.Count-1 do
      begin
        WriteStatusText('Buscando Selección...');
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
        IniciarEspera(Format('Imprimiendo %d/%d ', [i + 1, Grid.SelectedRows.Count]));
        try
          ImprimirRegistro(False, True);
        finally
          DetenerEspera;
        end;
      end;
    finally
      DetenerEspera;
      Grid.Enabled := True;
      imgFax.Enabled := True;
    end;
    sdqConsulta.Refresh;
    WriteStatusText('');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.mnuSelTodoClick(Sender: TObject);
begin
  //sdqConsultaAfterScroll
  Grid.SelectAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.mnuSelLimpiarClick(Sender: TObject);
begin
  Grid.UnselectAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.mnuSelInvertirClick(Sender: TObject);
begin
  Grid.InvertSelection;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbPropiedadesClick(Sender: TObject);
begin
  pnlVistaPrevia.Visible := tbPropiedades.Down;
  Splitter.Visible := tbPropiedades.Down;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.imgFaxLoad(Sender: TObject; Zoom: Double);
begin
  eEstrategiaTiff.imgFaxLoad;
  xAnterior := 0;
  yAnterior := 0;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.SetZoom(AValue: Single);
begin
//  edZoom.Value := AValue;
  imgFax.Zoom  := AValue;
  imgFax.Display;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbZoomDecClick(Sender: TObject);
begin
  SetZoom(edZoom.Value - 10);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbZoomIncClick(Sender: TObject);
begin
  SetZoom(edZoom.Value + 10);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.edZoomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    SetZoom(edZoom.Value);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.SetPage(AValue: Integer);
begin
  eEstrategiaTiff.SetPage(AValue);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbPageFirstClick(Sender: TObject);
begin
  eEstrategiaTiff.tbPageFirstClick(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbPagePriorClick(Sender: TObject);
begin
  eEstrategiaTiff.tbPagePriorClick(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbPageNextClick(Sender: TObject);
begin
  eEstrategiaTiff.tbPageNextClick(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbPageLastClick(Sender: TObject);
begin
  eEstrategiaTiff.tbPageLastClick(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.edPageKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    QPaginas.First;
    QPaginas.MoveBy(edPage.Value -1);
    SetPage(edPage.Value);
  end;
end;
{-------------------------------------------------------------------------------}
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

  inherited;
end;
{-------------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbEliminarClick(Sender: TObject);
var
  i: Integer;
begin
  if Grid.SelectedRows.Count = 0 Then
    MsgBox('Debe seleccionar al menos un fax para poder darlo de baja', MB_ICONEXCLAMATION)

  else if MsgAsk('¿Desea dar de baja el/los fax/es Seleccionados?') then
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
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.ClearControls;
begin
  inherited;
  fraFE_IDFORMULARIO.Clear;
end;
{-------------------------------------------------------------------------------}
function TfrmConsFax.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.PrimaryKey.Add('FE_ID', sdqConsulta.FieldByName('FE_ID').AsInteger);
  Sql.Fields.Add('FE_IDFORMULARIO', fraFE_IDFORMULARIO.Value);

  Result := inherited DoABM;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.LoadControls;
begin
  fraFE_IDFORMULARIO.Value := sdqConsulta.FieldByName('FE_IDFORMULARIO').AsInteger;
end;
{-------------------------------------------------------------------------------}
function TfrmConsFax.Validar: Boolean;
begin
  Result := False;
  if fraFE_IDFORMULARIO.IsEmpty Then
    InvalidMsg(fraFE_IDFORMULARIO.edCodigo, 'Debe seleccionar un Formulario')
  else
    Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.dsConsultaDataChange(Sender: TObject; Field: TField);
var
  sSql : String;
begin
  inherited;
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

        QPaginas := GetQuery( 'Select FE_ARCHIVOIMAGEN from ART.FFE_FAXENTRANTES where FE_NROORDEN = '+ sdqConsulta.FieldByName('FE_NROORDEN').AsString +
                              sSql);
                             
        if Assigned(eEstrategiaTiff) then eEstrategiaTiff.Free;
        // Crea una estrategia para una pagina de tiff por registro de nro de orden.
        eEstrategiaTiff:= TEstrategiaTiffSimple.Create(Self);
      except
       on E: Exception do
         ErrorMsgFmt(E, 'Error al buscar la siguiente página.', []);
      end;
    end
    else begin
      if Assigned(eEstrategiaTiff) then eEstrategiaTiff.Free;
      // Crea una estrategia para un tiff multi paginas ( un solo registro para nro de orden).
      eEstrategiaTiff:= TEstrategiaTiffMulti.Create(self);
    end;

    tbAbrirImagen.Enabled := True;
    imgFax.ClearDisplay;
    imgFax.Page  := 1;
    imgFax.Image := sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString;
    pnlImgStatus.Font.Color := clWindowText;
    Try
      imgFax.Display;
      pnlImgStatus.Caption := Format('Archivo:%s Alto:%d Ancho:%d', [ExtractFileName(imgFax.Image), imgFax.ImageHeight, imgFax.ImageWidth]);
    except
      on E: Exception do
      begin
        pnlImgStatus.Font.Color := clRed;
        pnlImgStatus.Caption := 'Error al recuperar la imagen ' + ExtractFileName(imgFax.Image) + ':' + StringReplace(StringReplace(E.Message, #13, ', ', [rfReplaceAll]), #10, #0, [rfReplaceAll]);
      end;
    end;
  end
  else
  begin
    tbAbrirImagen.Enabled := False;
    pnlImgStatus.Font.Color := clRed;
    pnlImgStatus.Caption := 'El archivo no Existe (' + ExtractFileName(imgFax.Image) + ')';
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.mnuImpresionAutomaticaClick(Sender: TObject);
var
  ATickCount: DWORD;
const
  WAIT_TIME = 180000;
begin
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
      imgFax.Enabled := False;
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
      imgFax.Enabled := True;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.btnImpAutCancelClick(Sender: TObject);
begin
  FIACancel := True;
end;
{-------------------------------------------------------------------------------}
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
        ImprimirRegistro(False, False);
        sdqConsulta.Next;
      until sdqConsulta.Eof;
    finally
      fpImpresionAutomatica.ShowOnTop;
    end;
  end;
end;
{----------------------------------------------------------------------------}
procedure TfrmConsFax.ImprimirRegistro(AHandleErrors: Boolean; AIgnoreErrors: Boolean );
begin
  if (pnlImgStatus.Font.Color = clWindowText) Then
  begin
    try
      eEstrategiaTiff.ImprimirRegistro(AHandleErrors,AIgnoreErrors);
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


{-------------------------------------------------------------------------------}
procedure TfrmConsFax.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  tbImprimir.Enabled := True;
  mnuImpResultados.Enabled := AEnabled and bAllowPrint;
end;
{-------------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbAbrirImagenClick(Sender: TObject);
begin
    if sdqConsulta.FieldByName('FE_MULTIPAGINAS').AsString = 'N' then
      WinExec(PChar('sview.exe "' + QPaginas.FieldByName('FE_ARCHIVOIMAGEN').AsString + '"'), SW_SHOW)
    else //multipaginas
      WinExec(PChar('sview.exe "' + sdqConsulta.FieldByName('FE_ARCHIVOIMAGEN').AsString + '"'), SW_SHOW);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbSalirClick(Sender: TObject);
begin
  inherited; { Para el segundo botón Salir }
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbCantidadDeHojasClick(Sender: TObject);
begin
  MsgBoxFmt('Cantidad de Páginas: %6.0f'#13#10'Cantidad de Faxes:    %6d', [SumField(sdqConsulta, 'FE_PAGINAS'), sdqConsulta.RecordCount]);
end;
{-------------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if FileExists(ARefFile) Then
    DeleteFile(ARefFile);

  if Assigned(eEstrategiaTiff) then
    eEstrategiaTiff.Free;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.tbGuardarImagenClick(Sender: TObject);
begin
//  inherited;
  if sd.Execute then
    imgFax.SavePage(sd.FileName, wiFileTypeBMP, imgFax.PageType, EmptyParam, EmptyParam, EmptyParam);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.imgFaxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  SCROLL, i, iScrollX, iScrollY: integer;
  bMoverX, bMoverY: boolean;
begin
  inherited;
  SCROLL := 1;
  bMoverX := False;
  bMoverY := False;
  bDetenerMovimiento := False;

  //se mueve el mouse
  if (ssLeft in Shift) and not bMoviendo then
  begin
    bMoviendo := True;
    if xAnterior <> X then
      iScrollX := SCROLL * Round(Sign(xAnterior - X) * Sqrt(100*Abs(xAnterior - X)))
    else
      iScrollX := 0;

    if yAnterior <> Y then
      iScrollY := SCROLL * Round(Sign(yAnterior - Y) * Sqrt(100*Abs(yAnterior - Y)))
    else
      iScrollY := 0;

    if (imgFax.ScrollPositionX + iScrollX) < 0 then
      imgFax.ScrollPositionX := 0
    else if (imgFax.ScrollPositionX + iScrollX) > imgFax.ImageWidth then
      imgFax.ScrollPositionX := imgFax.ImageWidth
    else
      bMoverX := True;

    if (imgFax.ScrollPositionY + iScrollY) < 0 then
      imgFax.ScrollPositionY := 0
    else if (imgFax.ScrollPositionY + iScrollY) > imgFax.ImageHeight + 1000 then
      imgFax.ScrollPositionY := imgFax.ImageHeight
    else
      bMoverY := True;

    if bMoverX or bMoverY then
    begin
      for i := 1 to Round(Max(Abs(iScrollX), Abs(iScrollY))/4) do
      begin
        if not (ssLeft in Shift) or bDetenerMovimiento then
          Break;
        if Abs(iScrollX) >= i then
          imgFax.ScrollPositionX := imgFax.ScrollPositionX + (4 * Sign(iScrollX));

        if Abs(iScrollY) >= i then
          imgFax.ScrollPositionY := imgFax.ScrollPositionY + (4 * Sign(iScrollY));
//        imgFax.Invalidate;
        Application.ProcessMessages;
      end;
    end;

    xAnterior := X;
    yAnterior := Y;
    bMoviendo := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.imgFaxDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;//(Sender = Source);
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.imgFaxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssLeft in Shift then
  begin
    xAnterior := X;//Mouse.CursorPos.X;
    yAnterior := Y;//Mouse.CursorPos.Y;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmConsFax.imgFaxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  bDetenerMovimiento := True;
end;
{-------------------------------------------------------------------------------}
end.
