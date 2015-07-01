unit unStockLotes;

interface

uses                                            
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo, DB, SDEngine, Buttons, DataExport, DataToXLS, Grids,
  DBGrids, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Menus, Provider,
  DBClient, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, CardinalEdit, IntEdit, unfraCtbTablas,
  unFraUsuario, FormPanel, unArt, GroupCheckBox, RxToolEdit, RxPlacemnt;

type
  TfrmStockLotes = class(TfrmCustomConsulta)
    sdqSectores: TSDQuery;
    dsSectores: TDataSource;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    gbSectores: TGroupBox;
    cmbSectores: TDBCheckCombo;
    ShortCutControl1: TShortCutControl;
    gbUsuarios: TGroupBox;
    cmbUsuarios: TDBCheckCombo;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    gbFecha: TGroupBox;
    edFechaLoteDesde: TDateComboBox;
    Label9: TLabel;
    edFechaLoteHasta: TDateComboBox;
    gbArchivo: TGroupBox;
    fraTipoArchivo: TfraCodigoDescripcion;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    gbLote: TGroupBox;
    edLote: TIntEdit;
    gbEstado: TGroupBox;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton7: TToolButton;
    tbModifEstado: TToolButton;
    fpModifEstadoLote: TFormPanel;
    BevelAbm: TBevel;
    Label3: TLabel;
    btnAceptarEstadoLote: TButton;
    btnCancelarEstadoLote: TButton;
    fraModifEstado: TfraCtbTablas;
    tbBuscarCodigoBarras: TToolButton;
    pmnuCodBarras: TPopupMenu;
    pmnuCodBarrasLote: TMenuItem;
    pmnuCodBarrasRemito: TMenuItem;
    gbFechaEstado: TGroupBox;
    Label1: TLabel;
    edFechaEstadoDesde: TDateComboBox;
    edFechaEstadoHasta: TDateComboBox;
    gbRemitoEnvio: TGroupBox;
    edRemitoEnvio: TIntEdit;
    pmnuImpresion: TPopupMenu;
    mnuImprimirRemitoEnvio: TMenuItem;
    mnuImprimirListado: TMenuItem;
    cmbEstados: TDBCheckCombo;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    tbExtraviado: TToolButton;
    pmnuExtraviado: TPopupMenu;
    mnuMarcarExtraviado: TMenuItem;
    mnuDesmarcarExtraviado: TMenuItem;
    gbExtraviados: TGroupBox;
    chkMostrarExtraviados: TCheckBox;
    tbObservacion: TToolButton;
    fpAgregarLotesARemito: TFormPanel;
    Bevel1: TBevel;
    btnAceptarAgregarLoteRemito: TButton;
    btnCancelarAgregarLoteRemito: TButton;
    tbAgregarLotesARemito: TToolButton;
    Label2: TLabel;
    edNumeroCaja: TPatternEdit;
    edNumeroCajaAux: TEdit;
    Label4: TLabel;
    edNroRemito: TIntEdit;
    tbDevolucLoteUsuario: TToolButton;
    rgLoteDigitaliz: TRadioGroup;
    chgDestino: TCheckGroup;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaESTADOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbModifEstadoClick(Sender: TObject);
    procedure btnAceptarEstadoLoteClick(Sender: TObject);
    procedure fpModifEstadoLoteEnter(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbImprimirClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure tbExportarClick(Sender: TObject);
    procedure pmnuCodBarrasLoteClick(Sender: TObject);
    procedure tbBuscarCodigoBarrasClick(Sender: TObject);
    procedure mnuImprimirRemitoEnvioClick(Sender: TObject);
    procedure mnuImprimirListadoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure mnuMarcarExtraviadoClick(Sender: TObject);
    function DoValidarDatosExtraviados(Extraviado: Boolean): Boolean;
    procedure tbExtraviadoClick(Sender: TObject);
    procedure tbObservacionClick(Sender: TObject);
    procedure tbAgregarLotesARemitoClick(Sender: TObject);
    procedure btnAceptarAgregarLoteRemitoClick(Sender: TObject);
    procedure fpAgregarLotesARemitoEnter(Sender: TObject);
    procedure tbDevolucLoteUsuarioClick(Sender: TObject);
  protected
    procedure RefreshData; override;
    procedure DoMarcarFila; override;
  private
    tslCheckeados: TStringList;
    pbIsPrinting: Boolean;
    procedure CalcularFilasSel;
    procedure InicializarContadores;
    procedure DoCargarTitulosEstadosGrilla;
    procedure CalcTotales;
    function DoValidarDatosEstadoLotes(GeneraRemitoEnvio: Boolean): Boolean;
    procedure DoModificarEstadoLotesYEnvio(GeneraRemitoEnvio: Boolean; var IdRemitoEnvio: TTableId);
    procedure DoImprimirRemitoEnvio(IdRemitoEnvio: TTableId);
    function DoValidarDatosEnvioMail: Boolean;
    function IsLoteExtraviado: Boolean;
    function DoValidarDatosAgregarLoteRemito: Boolean;
    function DoValidarDatosDevolucionLoteUsuario: Boolean;
    procedure DoSetearCampo(DataSet: TDataSet; Campo: String);
    procedure DoModificarObservacionesGyD(Observac: String);
  public
  end;

const
  MAXCOLS = 6;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('ESTADO1', 'ESTADO2', 'ESTADO3', 'ESTADO4', 'ESTADO5', 'CANTHOJAS', 'LOTEDIGITALIZADO');
  FONTNAMETILDE: String  = 'Wingdings';
  FONTSIZETILDE: Integer = 12;
  SMCampoFila     = 'FILA';
  SMCampoCheckBox = 'CHECKBOX';

var
  frmStockLotes: TfrmStockLotes;
  TotalConsulta: Array of Extended;

implementation

Uses
  unDmPrincipal, CustomDlgs, unEspera, AnsiSql, ArchFuncs, unComunesMail, unSesion,
  unComunes, unConstantArchivo, Strfuncs, DbFuncs, General, unHistoricoLote,
  unCapturarCodigoBarras, unUtilsArchivo, unRptResumenLotesEnviados, VCLExtra,
  unGrids;

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TfrmStockLotes.FormCreate(Sender: TObject);
begin
  tslCheckeados := TStringList.Create;
  DoCargarTitulosEstadosGrilla;

  inherited;
  OpenQuery(sdqSectores);

  with fraTipoArchivo do
    begin
      TableName   := 'RTA_TIPOARCHIVO';
      FieldID     := 'TA_ID';
      FieldCodigo := 'TA_CODIGO';
      FieldDesc   := 'TA_DESCRIPCION';
      ShowBajas   := True;
    end;

  with fraModifEstado do
    begin
      Clave          := 'ESLOT';
      ShowBajas      := False;
      ExtraCondition := ' AND TB_CODIGO NOT IN (' + SqlValue(ESTADOLOTE_USUARIO) + ', ' + SqlValue(ESTADOLOTE_ADMINISTRADORA) + ')'
    end;

  with Grid.ColumnByField['LOTEDIGITALIZADO'].Font do
    begin
      Charset := SYMBOL_CHARSET;
      Name    := FONTNAMETILDE;
      Size    := FONTSIZETILDE;
    end;  

  SetLength(TotalConsulta, MAXCOLS + 1);
  pbIsPrinting := False;

  tbAgregarLotesARemito.Enabled := (Seguridad.Activar(tbAgregarLotesARemito) and GetPerfilAdministrador());
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.mnuMarcarTodosClick(Sender: TObject);
begin
  DoSMMarcarTodos(tslCheckeados, sdqConsulta, SMCampoFila);
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.mnuDesmarcarTodosClick(Sender: TObject);
begin
  DoSMDesmarcarTodos(tslCheckeados, Grid);
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  cmbSectores.Clear;
  cmbUsuarios.Clear;
  cmbEstados.Clear;
  fraTipoArchivo.Clear;
  edFechaLoteDesde.Clear;
  edFechaLoteHasta.Clear;
  edFechaEstadoDesde.Clear;
  edFechaEstadoHasta.Clear;
  edLote.Clear;
  edRemitoEnvio.Clear;
  chkMostrarExtraviados.Checked := True;
  rgLoteDigitaliz.ItemIndex     := 2;   // Todos
  chgDestino.Clear(False);

  tslCheckeados.Clear;
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.RefreshData;
var
  sDestino, sWhereExt, sWhere, sSql: String;
begin
  sSql := 'SELECT 0 ' + SMCampoCheckBox + ', TA_DESCRIPCION TIPOARCHIVO, LO_USUALTA USUALTA_LOTE, SE_MAIL MAIL_USUALTA_LOTE, ' +
                 'TRUNC(LO_FECHAALTA) FECHAALTA_LOTE, LO_ID LOTE, TRUNC(RE_FECHAALTA) FECHAALTA_REMITO, ' +
                 'RE_ID REMITO, SE_SECTOR SECTORUSU, SE_NOMBRE NOMBRE_USUALTA_LOTE, LO_ESTADO CODESTADO, ' +
                 'TRUNC(LO_FECHA_ESTADO) FECHA_ESTADO, LO_IDREMITOENVIOLOTE REMITOENVIO, ' +
                 'RL_USUALTA USUALTAREMITOENVIO, LO_CAJA CAJA, TRUNC(LO_FECHAALTAEXTRAVIADO) FECHAALTAEXTRAVIADO, ' +
                 'ARCHIVO.GET_CANTHOJASLOTE(LO_ID) CANTHOJAS, LO_OBSERVACIONES OBSERVACIONES, LO_FECHABAJA FECHABAJA, ' +
                 '(CASE WHEN (SELECT 1 ' +
                               'FROM RRA_REPOSITORIOARCHIVO ' +
                              'WHERE RA_LOTE = LO_ID ' +
                                'AND RA_FECHABAJA IS NULL ' +
                                'AND ROWNUM <= 1) = 1 THEN 1 ELSE NULL END) LOTEDIGITALIZADO, ' +
                 'DECODE(LO_ESTADO, ''10'', 1) ' + CAMPOS_SUMA[0] + ', ' +
                 'DECODE(LO_ESTADO, ''20'', 1) ' + CAMPOS_SUMA[1] + ', ' +
                 'DECODE(LO_ESTADO, ''30'', 1) ' + CAMPOS_SUMA[2] + ', ' +
                 'DECODE(LO_ESTADO, ''40'', 1) ' + CAMPOS_SUMA[3] + ', ' +
                 'DECODE(LO_ESTADO, ''50'', 1) ' + CAMPOS_SUMA[4] + ' ' +
            'FROM RRL_REMITOENVIOLOTE, USC_SECTORES, RRE_REMITO, USE_USUARIOS, RTA_TIPOARCHIVO, RLO_LOTE ' +
           'WHERE LO_TIPO = TA_ID ' +
             'AND LO_USUALTA = SE_USUARIO ' +
             'AND SE_SECTOR = SC_CODIGO ' +
             'AND LO_IDREMITO = RE_ID(+) ' +
             'AND LO_FECHABAJA IS NULL ' +
             'AND LO_IDREMITOENVIOLOTE = RL_ID(+) ' +
             'AND RL_FECHABAJA(+) IS NULL';

  sWhereExt := '';
  sWhere    := SqlBetweenDateTime(' AND LO_FECHAALTA ', edFechaLoteDesde.Date, edFechaLoteHasta.Date) +
               SqlBetweenDateTime(' AND LO_FECHA_ESTADO ', edFechaEstadoDesde.Date, edFechaEstadoHasta.Date);

  if not edLote.IsEmpty then
    sWhere := sWhere + ' AND LO_ID = ' + SqlValue(edLote.Value);

  if not edRemitoEnvio.IsEmpty then
    sWhere := sWhere + ' AND LO_IDREMITOENVIOLOTE = ' + SqlValue(edRemitoEnvio.Value);

  if cmbSectores.Text <> '' then
    sWhere := sWhere + ' AND SE_SECTOR ' + cmbSectores.InSql;

  if cmbUsuarios.Text <> '' then
    sWhere := sWhere + ' AND LO_USUALTA ' + cmbUsuarios.InSql;

  if fraTipoArchivo.IsSelected then
    sWhere := sWhere + ' AND TA_ID = ' + SqlValue(fraTipoArchivo.Value);

  if cmbEstados.Text <> '' then
    sWhere := sWhere + ' AND LO_ESTADO ' + cmbEstados.InSql;

  if not chkMostrarExtraviados.Checked then
    sWhere := sWhere + ' AND LO_FECHAALTAEXTRAVIADO IS NULL';

  case rgLoteDigitaliz.ItemIndex of
    0: sWhereExt := sWhereExt + ' AND LOTEDIGITALIZADO = 1';
    1: sWhereExt := sWhereExt + ' AND LOTEDIGITALIZADO IS NULL';
  end;

  sDestino := ' AND LO_OPCIONDESTINO IN ( ';
  if chgDestino.Checked[0] then sDestino:= sDestino + SqlValue(OPCION_DESTINO_DIGITALIZACION) + ',';
  if chgDestino.Checked[1] then sDestino:= sDestino + SqlValue(OPCION_DESTINO_GUARDA) + ',';
  sDestino := CutRight(sDestino, 1) + ')';

  if Pos('()', sDestino) = 0 then
    sWhere := sWhere + sDestino;

  sSql := 'SELECT DISTINCT ROWNUM ' + SMCampoFila + ', A.* ' +
            'FROM (' + sSql + sWhere + ') A ' +
           'WHERE 1 = 1 ' +
           sWhereExt;

  sdqConsulta.Sql.Text := sSql + NVL(SortDialog.OrderBy, ' ORDER BY LOTE');
  inherited;
  InicializarContadores;
  CalcTotales;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.CalcularFilasSel;
begin
  edCantSelecc.Value := tslCheckeados.Count;
  Grid.Repaint;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.InicializarContadores;
begin
  edCantSelecc.Value := 0;
  Grid.Repaint;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbOrdenarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  inherited;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);

  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridCellClick(Column: TColumn);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = SMCampoCheckBox) then
  begin
    DoSMMarcarDesmarcarFila(tslCheckeados, Grid, SMCampoFila);
    CalcularFilasSel;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.DoCargarTitulosEstadosGrilla;
var
  sCampo, sSql: String;
  i: Integer;
begin
  sSql := 'SELECT TB_DESCRIPCION DESCR ' +
            'FROM CTB_TABLAS ' +
           'WHERE TB_CLAVE = ''ESLOT'' ' +
             'AND TB_CODIGO <> ''0'' ' +
             'AND TB_FECHABAJA IS NULL ' +
           'ORDER BY TO_NUMBER(TB_CODIGO)';

  i := 0;
  with GetQuery(sSql) do
     try
       while not Eof do
         begin
           Inc(i);
           sCampo := 'ESTADO' + IntToStr(i);

           Grid.ColumnByField[sCampo].Font.Charset  := SYMBOL_CHARSET;
           Grid.ColumnByField[sCampo].Font.Name     := FONTNAMETILDE;
           Grid.ColumnByField[sCampo].Font.Size     := FONTSIZETILDE;
           Grid.ColumnByField[sCampo].Title.Caption := FieldByName('DESCR').AsString;

           Next;
         end;
     finally
       Free;
     end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
      	ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0)
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.DoSetearCampo(DataSet: TDataSet; Campo: String);
begin
  with DataSet do
    if Assigned(FieldByName(Campo)) then
      if pbIsPrinting then
        begin
          Grid.ColumnByField[Campo].Font.Charset := Grid.ColumnByField['LOTE'].Font.Charset;
          Grid.ColumnByField[Campo].Font.Name    := Grid.ColumnByField['LOTE'].Font.Name;
          Grid.ColumnByField[Campo].Font.Size    := Grid.ColumnByField['LOTE'].Font.Size;
          FieldByName(Campo).OnGetText := nil;
        end
      else
        begin
          Grid.ColumnByField[Campo].Font.Charset := SYMBOL_CHARSET;
          Grid.ColumnByField[Campo].Font.Name    := FONTNAMETILDE;
          Grid.ColumnByField[Campo].Font.Size    := FONTSIZETILDE;
          FieldByName(Campo).OnGetText := sdqConsultaESTADOGetText;
        end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  i: Integer;
  sCampo: String;
begin
  inherited;
  DoSMsdqConsultaAfterOpen(Grid, SMCampoCheckBox);

  if not DataSet.IsEmpty then
    begin
      for i := 1 to 5 do
        begin
          sCampo := 'ESTADO' + IntToStr(i);

          DoSetearCampo(DataSet, sCampo);
        end;

      DoSetearCampo(DataSet, 'LOTEDIGITALIZADO');
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.sdqConsultaESTADOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.AsInteger = 1 then
    Text := vSi
  else
    Text := '';
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbPropiedadesClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(tslCheckeados.Count > 1, Grid, 'Debe seleccionar exactamente una fila de la grilla.');

  with TfrmHistoricoLote.Create(nil) do
    try
      Lote := Self.sdqConsulta.FieldByName('LOTE').AsInteger;
      ShowModal;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridDblClick(Sender: TObject);
begin
  tbPropiedadesClick(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbModifEstadoClick(Sender: TObject);
var
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  sdqConsulta.DisableControls;
  APointer := sdqConsulta.GetBookmark;
  try
    if fpModifEstadoLote.ShowModal = mrOk then
      RefreshData;
  finally
    if sdqConsulta.BookmarkValid(APointer) then
      sdqConsulta.GotoBookmark(APointer);

    sdqConsulta.EnableControls;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.DoModificarEstadoLotesYEnvio(GeneraRemitoEnvio: Boolean; var IdRemitoEnvio: TTableId);
var
  sNuevoEstado: String;
  IdLote: TTableId;
begin
  IdRemitoEnvio := ART_EMPTY_ID;

  BeginTrans;
  try
    sNuevoEstado := fraModifEstado.Value;

    with sdqConsulta do
      begin
        DisableControls;
        try
          if GeneraRemitoEnvio then
            IdRemitoEnvio := DoInsertRemitoEnvioLote(False);

          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                begin
                  IdLote := sdqConsulta.FieldByName('LOTE').AsInteger;

                  DoModificarEstadoLote(IdLote, sNuevoEstado, False);
                  if GeneraRemitoEnvio then
                    DoModificarRemitoEnvio(IdLote, IdRemitoEnvio, False);
                end;

              Next;
            end;
        finally
          EnableControls;
        end;
      end;

    CommitTrans;

    MsgBox('Estado de los lotes modificado correctamente.', MB_ICONINFORMATION);
    fpModifEstadoLote.ModalResult := mrOk;
  except
    on E:Exception do
      begin
        Rollback;
        Raise Exception.Create(E.Message + CRLF + 'Error al modificar el estado de los lotes.');
      end;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmStockLotes.DoValidarDatosEstadoLotes(GeneraRemitoEnvio: Boolean): Boolean;
var
  sSector, sSectorUsu, sLote, sEstadoAct: String;
begin
  Verificar(fraModifEstado.IsEmpty, fraModifEstado, 'Debe indicar el nuevo estado de los lotes.');

  sSectorUsu := Sesion.Sector;
  with sdqConsulta do
    begin
      DisableControls;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                sLote      := Self.sdqConsulta.FieldByName('LOTE').AsString;
                sEstadoAct := NVL(sdqConsulta.FieldByName('CODESTADO').AsString, '0');
                sSector    := Self.sdqConsulta.FieldByName('SECTORUSU').AsString;

                Verificar(StrToInt(fraModifEstado.Value) <= StrToInt(sEstadoAct), nil, 'El nuevo estado del lote ' + sLote + ' debe ser algún estado posterior al actual.');
                Verificar(GeneraRemitoEnvio and (sSectorUsu <> sSector), nil, 'El lote ' + sLote + ' fue dado de alta por otro sector (' + sSector + ') distinto al del usuario actualmente logueado.');
                Verificar(IsLoteExtraviado(), nil, 'El lote ' + sLote + ' se encuentra extraviado.');
              end;

            Next;
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.btnAceptarEstadoLoteClick(Sender: TObject);
var
  bGeneraRemitoEnvio: Boolean;
  IdRemitoEnvio: TTableId;
begin          
  bGeneraRemitoEnvio := (fraModifEstado.Value = ESTADOLOTE_ENTRANSITO);
  if DoValidarDatosEstadoLotes(bGeneraRemitoEnvio) then
    begin
      if not bGeneraRemitoEnvio or (MsgBox('Al modificar el estado de los lotes por este nuevo estado se generará además un remito de envío de los mismos ¿Confirma?', MB_ICONQUESTION+MB_OKCANCEL) = ID_OK) then
        begin
          DoModificarEstadoLotesYEnvio(bGeneraRemitoEnvio, IdRemitoEnvio);
          if bGeneraRemitoEnvio then
            DoImprimirRemitoEnvio(IdRemitoEnvio);
        end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.fpModifEstadoLoteEnter(Sender: TObject);
var
  sEstado, sSectorUsu: String;
begin
  sSectorUsu := Sesion.Sector;

  if sSectorUsu = SECTOR_MESAENTRADA then
    sEstado := ESTADOLOTE_MESAENTRADA
  else if sSectorUsu = SECTOR_DOCUMENTACION then
    sEstado := ESTADOLOTE_DITALIZGUARDA
  else
    sEstado := ESTADOLOTE_ENTRANSITO;

  fraModifEstado.Value := sEstado;
  VCLExtra.LockControls(fraModifEstado);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(Grid, tslCheckeados, SMCampoFila, Rect);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslCheckeados.Free;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  tslCheckeados.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  DoSMGridKeyDown(Key, Grid, SMCampoCheckBox);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
var
  sCampo: String;
begin
  inherited;
  sCampo := Field.FullName;

  if IsLoteExtraviado() then
    AFont.Color := clRed
  else if AreIn(sCampo, CAMPOS_SUMA) and not AreIn(sCampo, ['CANTHOJAS']) then
    begin
      if Field.AsInteger = 1 then
        begin
          if sCampo = CAMPOS_SUMA[0] then
            AFont.Color := clTeal
          else if sCampo = CAMPOS_SUMA[1] then
            AFont.Color := clFuchsia
          else if sCampo = CAMPOS_SUMA[2] then
            AFont.Color := clMaroon
          else if sCampo = CAMPOS_SUMA[3] then
            AFont.Color := clBlue
          else if sCampo = CAMPOS_SUMA[4] then
            AFont.Color := clGray
          else if sCampo = 'LOTEDIGITALIZADO' then
            AFont.Color := TColor($005E92FF);   // tono naranja
        end
      else
        AFont.Color := clMaroon;
    end;

  DoSMGridGetCellProps(tslCheckeados, sdqConsulta, SMCampoFila, Background);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbExportarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  inherited;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.DoMarcarFila;
begin
  if not IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
    begin
      DoSMMarcarFila(tslCheckeados, Grid, SMCampoFila);
      CalcularFilasSel;
    end;
end;             
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.pmnuCodBarrasLoteClick(Sender: TObject);
var
  bBusquedaPorLote: Boolean;
  sCampoBusqueda: String;
begin
  bBusquedaPorLote := (Sender = pmnuCodBarrasLote);
  if bBusquedaPorLote then
    sCampoBusqueda := 'LOTE'
  else
    sCampoBusqueda := 'REMITOENVIO';

  DoBuscarCampoCodigoBarras(sCampoBusqueda);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbBuscarCodigoBarrasClick(Sender: TObject);
begin
  pmnuCodBarrasLoteClick(pmnuCodBarrasLote);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.DoImprimirRemitoEnvio(IdRemitoEnvio: TTableId);
begin
  TqrResumenLotesEnviados.DoImprimirResumenLotesEnviados(IdRemitoEnvio);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.mnuImprimirRemitoEnvioClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(tslCheckeados.Count > 1, Grid, 'Debe seleccionar exactamente una fila de la grilla que posea remito de envío de lotes.');
  Verificar(sdqConsulta.FieldByName('REMITOENVIO').IsNull, Grid, 'El lote seleccionado no posee un remito de envío.');
  Verificar(IsLoteExtraviado(), Grid, 'El lote seleccionado se encuentra extraviado.');

  DoImprimirRemitoEnvio(sdqConsulta.FieldByName('REMITOENVIO').AsInteger);
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.mnuImprimirListadoClick(Sender: TObject);
var
  i: Integer;
begin
  sdqConsulta.DisableControls;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  pbIsPrinting := True;
  RefreshData;

  try
    DBPrint.SetGridColumns(DBGrid, True, [baDetail, baHeader, baTotal, baSubTotal]);

    with QueryPrint do
      for i := 0 to MAXCOLS do
        FieldByName[CAMPOS_SUMA[i]].SubTotalType := ttAutoSum;

    inherited tbImprimirClick(nil);
  finally
    sdqConsulta.EnableControls;
    SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
    pbIsPrinting := False;
    RefreshData;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  IdRemitoEnvio: TTableId;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(tslCheckeados.Count > 1, Grid, 'Debe seleccionar exactamente una fila de la grilla que posea remito de envío de lotes.');
  Verificar(sdqConsulta.FieldByName('REMITOENVIO').IsNull, Grid, 'El lote seleccionado no posee un remito de envío.');
  Verificar(sdqConsulta.FieldByName('USUALTAREMITOENVIO').AsString <> Sesion.UserId, Grid, 'Solo puede anular el remito de envío de lotes el usuario que lo dio de alta: ' + sdqConsulta.FieldByName('USUALTAREMITOENVIO').AsString + '.');
  Verificar(IsLoteExtraviado(), Grid, 'El lote seleccionado se encuentra extraviado.');

  IdRemitoEnvio := sdqConsulta.FieldByName('REMITOENVIO').AsInteger;

  sSql := 'SELECT 1 ' +
            'FROM RLO_LOTE ' +
           'WHERE LO_IDREMITOENVIOLOTE = :IdRemito ' +
             'AND LO_FECHABAJA IS NULL ' +
             'AND LO_ESTADO <> :Estado';
  Verificar(ExisteSqlEx(sSql, [IdRemitoEnvio, ESTADOLOTE_ENTRANSITO]), Grid, 'Solo puede anular el remito de envío si todos sus lotes se encuentrán: En Tránsito.');

  if MsgBox('¿ Desea anular el remito de envío de lotes nro. ' + IntToStr(IdRemitoEnvio) + ' ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BeginTrans;
      try
        sSql := 'UPDATE RLO_LOTE ' +
                   'SET LO_IDREMITOENVIOLOTE = NULL, ' +
                       'LO_ESTADO = :Estado, ' +
                       'LO_USU_ESTADO = :Usuario, ' +
                       'LO_FECHA_ESTADO = SYSDATE ' +
                 'WHERE LO_IDREMITOENVIOLOTE = :IdRemito';
        EjecutarSqlSTEx(sSql, [ESTADOLOTE_USUARIO, Sesion.UserId, IdRemitoEnvio]);

        sSql := 'UPDATE RRL_REMITOENVIOLOTE ' +
                   'SET RL_USUBAJA = :User, ' +
                       'RL_FECHABAJA = SYSDATE ' +
                 'WHERE RL_ID = :IdRemito';
        EjecutarSqlSTEx(sSql, [Sesion.UserId, IdRemitoEnvio]);

        CommitTrans;
        MsgBox('Remito de envío de lotes anulado correctamente.', MB_ICONINFORMATION);
        RefreshData;
      except
        on E:Exception do
          begin
            Rollback;
            Raise Exception.Create(E.Message + CRLF + 'Error al anular el remito de envío de lotes.');
          end;
      end;
    end;
end;
{------------------------------------------------------------------------------}
function TfrmStockLotes.DoValidarDatosEnvioMail: Boolean;
var
  sEstadoAct, sLote: String;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                sLote      := Self.sdqConsulta.FieldByName('LOTE').AsString;
                sEstadoAct := NVL(sdqConsulta.FieldByName('CODESTADO').AsString, '0');

                Verificar(not AreIn(sEstadoAct, [ESTADOLOTE_USUARIO, ESTADOLOTE_ENTRANSITO]), nil, 'El lote ' + sLote + ' no se encuentra en poder del usuario ni en tránsito.');
                Verificar(sdqConsulta.FieldByName('USUALTA_LOTE').AsString = Sesion.UserId, nil, 'El lote ' + sLote + ' se encuentra en su poder.');
                Verificar(IsLoteExtraviado(), nil, 'El lote ' + sLote + ' se encuentra extraviado.');
                Verificar(Is_LoteSinDocumentos(StrToInt(sLote)), nil, 'El lote ' + sLote + ' no contiene ningún documento.');
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbEnviarMailClick(Sender: TObject);
var
  APointer: TBookMark;
  sCuerpo: String;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  APointer := sdqConsulta.GetBookmark;
  if DoValidarDatosEnvioMail() then
    begin
      sdqConsulta.DisableControls;
      try
        if MsgBox('¿Confirma el envío de mails a los usuarios que tienen en su poder los lotes seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
          begin
            with sdqConsulta do
              begin
                First;
                while not Eof do
                  begin
                    if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                      begin
                        sCuerpo := 'Sr/Srta Usuario/a: ' + sdqConsulta.FieldByName('NOMBRE_USUALTA_LOTE').AsString + ':' + CRLF + CRLF +
                                   '   Se solicita entregue a este Sector el Lote Nro. ' + sdqConsulta.FieldByName('LOTE').AsString + ' en poder suyo desde ' +
                                   'el día ' + sdqConsulta.FieldByName('FECHAALTA_LOTE').AsString + '.' + CRLF +
                                   '   Se le recuerda que la norma vigente establece tres días como plazo máximo para la entrega de los lotes ' +
                                   'con la documentación a digitalizar.' + CRLF + CRLF +
                                   'Sector Guarda y Digitalización' + CRLF + CRLF +
                                   'Muchas Gracias.' + CRLF;

                        VALOR_PARAMETRO_CORREO_DOCUMENTACION :=
                            get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

                        SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                           Sesion.UserId, '[Documentación] Solicitud de Lote en Poder del Usuario', '',
                           sCuerpo, False, False, False, Sesion.UserId, True);

                        SendByMailServer(sdqConsulta.FieldByName('MAIL_USUALTA_LOTE').AsString,
                           Sesion.UserId, '[Documentación] Solicitud de Lote en Poder del Usuario', '',
                           sCuerpo, False, False, False, Sesion.UserId, True);
                      end;

                    Next;
                  end;
              end;
            MsgBox('Mails enviados correctamente.', MB_ICONINFORMATION);
          end;
      finally
        sdqConsulta.GotoBookmark(APointer);
        sdqConsulta.EnableControls;
      end;
    end;
end;
{------------------------------------------------------------------------------}
function TfrmStockLotes.IsLoteExtraviado: Boolean;
begin
  Result := not sdqConsulta.FieldByName('FECHAALTAEXTRAVIADO').IsNull;
end;
{------------------------------------------------------------------------------}
function TfrmStockLotes.DoValidarDatosExtraviados(Extraviado: Boolean): Boolean;
var
  sEsta, sLote: String;
  bValidar: Boolean;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                sLote := Self.sdqConsulta.FieldByName('LOTE').AsString;

                if Extraviado then
                  begin
                    bValidar := IsLoteExtraviado();
                    sEsta    := ' no';
                  end
                else
                  begin
                    bValidar := not IsLoteExtraviado();
                    sEsta    := '';
                  end;

                Verificar(not bValidar, nil, 'El lote ' + sLote + sEsta + ' se encuentra extraviado.');
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.mnuMarcarExtraviadoClick(Sender: TObject);
var
  bMarcarExtraviados: Boolean;
  sMarcado, sSql: String;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  bMarcarExtraviados := (Sender = mnuMarcarExtraviado);
  sMarcado           := Iif(bMarcarExtraviados, 'marcado', 'desmarcado');

  if DoValidarDatosExtraviados(not bMarcarExtraviados) then
    begin
      sdqConsulta.DisableControls;
      try
        if MsgBox('¿Confirma el ' + sMarcado + ' de los lotes seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
          begin
            BeginTrans;
            try
              with sdqConsulta do
                begin
                  First;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        begin
                          if bMarcarExtraviados then
                            begin
                              sSql := 'UPDATE RLO_LOTE ' +
                                         'SET LO_USUALTAEXTRAVIADO = :Usuario, ' +
                                             'LO_FECHAALTAEXTRAVIADO = SYSDATE ' +
                                       'WHERE LO_ID = :Id';
                              EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('LOTE').AsInteger]);
                            end
                          else
                            begin
                              sSql := 'UPDATE RLO_LOTE ' +
                                         'SET LO_USUALTAEXTRAVIADO = NULL, ' +
                                             'LO_FECHAALTAEXTRAVIADO = NULL ' +
                                       'WHERE LO_ID = :Id';
                              EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('LOTE').AsInteger]);
                            end;
                        end;

                      Next;
                    end;
                end;

               CommitTrans;
               MsgBox('Registros procesados correctamente.', MB_ICONINFORMATION);
               RefreshData;
            except
              on E:Exception do
                begin
                  Rollback;
                  Raise Exception.Create(E.Message + CRLF + 'Error al procesar el ' + sMarcado + ' los lotes.');
                end;
            end;
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbExtraviadoClick(Sender: TObject);
begin
  tbExtraviado.CheckMenuDropdown;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.DoModificarObservacionesGyD(Observac: String);
var
  sSql: String;
  APointer: TBookMark;
begin
  sSql := 'UPDATE RLO_LOTE ' +
             'SET LO_OBSERVACIONES = :Observ ' +
           'WHERE LO_ID = :Id';

  BeginTrans;
  try
    with sdqConsulta do
      begin
        APointer := GetBookmark;
        DisableControls;
        try
          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                EjecutarSqlSTEx(sSql, [Observac, sdqConsulta.FieldByName('LOTE').AsInteger]);

              Next;
            end;
        finally
          if BookmarkValid(APointer) then
            GotoBookmark(APointer);

          EnableControls;
        end;
      end;

    CommitTrans;

    MsgBox('Observaciones GyD modificadas correctamente.', MB_ICONINFORMATION);
  except
    on E:Exception do
      begin
        Rollback;
        Raise Exception.Create(E.Message + CRLF + 'Error al modificar las observaciones GyD.');
      end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbObservacionClick(Sender: TObject);
var
  Observac: TStringList;
  bAceptar: Boolean;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  Observac := TStringList.Create();
  with Observac do
    try
      if tslCheckeados.Count = 1 then
        Text := sdqConsulta.FieldByName('OBSERVACIONES').AsString
      else
        Text := '';

      bAceptar := InputMemoBox('Observaciones', Observac, False, 250);

      if bAceptar and (MsgBox('¿Confirma la modificación de las observaciones para los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES) then
        begin
          DoModificarObservacionesGyD(Trim(Observac.Text));

          sdqConsulta.Refresh;
          mnuDesmarcarTodos.Click;
        end;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbAgregarLotesARemitoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  if DoValidarDatosAgregarLoteRemito() then
    if fpAgregarLotesARemito.ShowModal = mrOk then
      begin
        sdqConsulta.DisableControls;
        try
          if MsgBox('¿Confirma la asignación de los lotes seleccionados al remito y caja indicados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
            begin
              BeginTrans;
              try
                with sdqConsulta do
                  begin
                    First;
                    while not Eof do
                      begin
                        if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                          begin
                            sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
                                       'SET (LO_ESTADO, LO_USU_ESTADO, LO_FECHA_ESTADO, LO_TIPOUBICACION, LO_UBICACION, ' +
                                            'LO_IDREMITO, LO_CAJA, LO_USUALTA_CAJA, ' +
                                            'LO_FECHAALTA_CAJA, LO_OBSERVAC_REMITO)= ' +
                                           '(SELECT :Estado, A.LO_USU_ESTADO, A.LO_FECHA_ESTADO, :TipoUbic, NULL, ' +
                                                   'A.LO_IDREMITO, :Caja, A.LO_USUALTA_CAJA, ' +
                                                   'A.LO_FECHAALTA_CAJA, :Obs ' +
                                              'FROM ARCHIVO.RLO_LOTE A ' +
                                             'WHERE A.LO_IDREMITO = :Remito ' +
                                               'AND A.LO_SEQ_REMITO = (SELECT MAX(B.LO_SEQ_REMITO) ' +
                                                                        'FROM ARCHIVO.RLO_LOTE B ' +
                                                                       'WHERE B.LO_IDREMITO = A.LO_IDREMITO)) ' +
                                     'WHERE LO_ID = :Lote';
                            EjecutarSqlSTEx(sSql, [ESTADOLOTE_ADMINISTRADORA, TIPOUBICACION_GUARDA,
                                                   Trim(Trim(edNumeroCaja.Text) + ' ' + Trim(edNumeroCajaAux.Text)),
                                                   'Agregado Manual de Lote al Remito y Caja (' + Sesion.UserId + ' - ' + DateToStr(DBDate()) + ').',
                                                   edNroRemito.Value, FieldByName('LOTE').AsInteger]);

                            sSql := 'UPDATE ARCHIVO.RLO_LOTE A ' +
                                       'SET A.LO_SEQ_REMITO = (SELECT MAX(B.LO_SEQ_REMITO)+1 ' +
                                                                'FROM ARCHIVO.RLO_LOTE B ' +
                                                               'WHERE B.LO_IDREMITO = A.LO_IDREMITO) ' +
                                     'WHERE A.LO_ID = :Lote';
                            EjecutarSqlSTEx(sSql, [FieldByName('LOTE').AsInteger]);
                          end;

                        Next;
                      end;
                  end;

                 CommitTrans;
                 MsgBox('Registros procesados correctamente.', MB_ICONINFORMATION);
                 RefreshData;
              except
                on E:Exception do
                  begin
                    Rollback;
                    Raise Exception.Create(E.Message + CRLF + 'Error al asignar los lotes al remito y caja.');
                  end;
              end;
            end;
        finally
          sdqConsulta.EnableControls;
        end;
      end;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.btnAceptarAgregarLoteRemitoClick(Sender: TObject);
begin
  Verificar(IsEmptyString(edNumeroCaja.Text), edNumeroCaja, 'Debe seleccionar un número de caja.');
  Verificar(Length(Trim(Trim(edNumeroCaja.Text) + ' ' + Trim(edNumeroCajaAux.Text))) > 100, edNumeroCaja, 'Puede ingresar como máximo 100 caracteres para el nro. completo de caja.');
  Verificar(edNroRemito.IsEmpty, edNroRemito, 'Debe seleccionar un número de remito.');
  Verificar(not Is_ExisteRemito(edNroRemito.Value), edNroRemito, 'El número de remito no existe o ha sido dado de baja.');

  fpAgregarLotesARemito.ModalResult := mrOk;
end;
{------------------------------------------------------------------------------}
function TfrmStockLotes.DoValidarDatosAgregarLoteRemito: Boolean;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              Verificar(not FieldByName('FECHABAJA').IsNull, nil, 'El lote se encuentra dado de baja.');

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.fpAgregarLotesARemitoEnter(Sender: TObject);
begin
  edNumeroCaja.Clear;
  edNumeroCajaAux.Clear;
  edNroRemito.Clear;
end;
{------------------------------------------------------------------------------}
function TfrmStockLotes.DoValidarDatosDevolucionLoteUsuario: Boolean;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                Verificar(not FieldByName('FECHABAJA').IsNull, nil, 'Uno de los lotes seleccionados se encuentra dado de baja.');
                Verificar(not FieldByName('FECHAALTAEXTRAVIADO').IsNull, nil, 'Uno de los lotes seleccionados se encuentra extraviado.');
                Verificar(FieldByName('CODESTADO').AsString = ESTADOLOTE_USUARIO, nil, 'Uno de los lotes seleccionados ya se encuentra en poder de un usuario.');
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmStockLotes.tbDevolucLoteUsuarioClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  if DoValidarDatosDevolucionLoteUsuario() then
    begin
      sdqConsulta.DisableControls;
      try
        if MsgBox('¿Confirma la devolución de los lotes seleccionados al usuario que los dio de alta?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
          begin
            BeginTrans;
            try
              with sdqConsulta do
                begin
                  First;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        begin
                          sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
                                     'SET LO_TIPOUBICACION = :UbicUsu, ' +
                                         'LO_UBICACION = LO_USUALTA, ' +
                                         'LO_IDREMITO = NULL, ' +
                                         'LO_SEQ_REMITO = NULL, ' +
                                         'LO_CAJA = NULL, ' +
                                         'LO_OBSERVAC_REMITO = NULL, ' +
                                         'LO_USUALTA_CAJA = NULL, ' +
                                         'LO_FECHAALTA_CAJA = NULL, ' +
                                         'LO_TIPOBULTO = ''C'', ' +
                                         'LO_ESTADO = :Estado, ' +
                                         'LO_USU_ESTADO = :UserId, ' +
                                         'LO_FECHA_ESTADO = SYSDATE, ' +
                                         'LO_IDREMITOENVIOLOTE = NULL, ' +
                                         'LO_USUALTAEXTRAVIADO = NULL, ' +
                                         'LO_FECHAALTAEXTRAVIADO = NULL ' +
                                   'WHERE LO_ID = :Lote';
                          EjecutarSqlSTEx(sSql, [TIPOUBICACION_USUARIO, ESTADOLOTE_USUARIO, Sesion.UserID, FieldByName('LOTE').AsInteger]);
                        end;

                      Next;
                    end;
                end;

               CommitTrans;
               MsgBox('Registros procesados correctamente.', MB_ICONINFORMATION);
               RefreshData;
            except
              on E:Exception do
                begin
                  Rollback;
                  Raise Exception.Create(E.Message + CRLF + 'Error al devolver los lotes al usuario que los dio de alta.');
                end;
            end;
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;
{------------------------------------------------------------------------------}
end.

