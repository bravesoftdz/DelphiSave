unit unConsultarRepositorio;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraFiltroArchivo, Menus, CardinalEdit,
  unFraVistaTIFF, unPrincipal, unArt, ComboEditor, CheckCombo, DBCheckCombo,
  JvExExtCtrls, JvNetscapeSplitter, ImgList, CurrEdit, RxCurrEdit, RxToolEdit,
  RxPlacemnt;
type                                    
  TfrmConsultarRepositorio = class(TfrmCustomGridABM)
    gbFechaAltaReposit: TGroupBox;
    Label1: TLabel;
    edFAltaRepositDesde: TDateComboBox;
    edFAltaRepositHasta: TDateComboBox;
    gbLote: TGroupBox;
    edLote: TIntEdit;
    gbCD: TGroupBox;
    edMedioDesde: TIntEdit;
    gbImagen: TGroupBox;
    edImagenDesde: TEdit;
    Label2: TLabel;
    edImagenHasta: TEdit;
    GroupBox2: TGroupBox;
    edPathArchivo: TEdit;
    gbDocumento: TGroupBox;
    fraTipoDocumento: TfraCodigoDescripcion;
    edCodigoDocumento: TEdit;
    gbArchivo: TGroupBox;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    fraFiltroArchivoReposit: TfraFiltroArchivo;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbVerImagen: TToolButton;
    ToolButton7: TToolButton;
    fraTipoDocumentoEdic: TfraCodigoDescripcion;
    Label3: TLabel;
    Label5: TLabel;
    edLoteEdic: TIntEdit;
    edObservacionesEdic: TMemo;
    Label6: TLabel;
    edImagenEdic: TEdit;
    Label7: TLabel;
    tbEdic: TToolBar;
    tbCargarImagen: TToolButton;
    odArchivoEdic: TOpenDialog;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tmrImagenes: TTimer;
    ShortCutControl1: TShortCutControl;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edFModifRepositDesde: TDateComboBox;
    edFModifRepositHasta: TDateComboBox;
    Label8: TLabel;
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirResumen: TMenuItem;
    lblCodigoDocumento: TLabel;
    edDocumentoEdic: TPatternEdit;
    Label9: TLabel;
    edHojaEdic: TIntEdit;
    Label10: TLabel;
    edLegajoEdic: TIntEdit;
    Label11: TLabel;
    edNroOperGT: TPatternEdit;
    chkAgregarObservEdic: TCheckBox;
    chkImagSinCarpeta: TCheckBox;
    gbCartaDoc: TGroupBox;
    edCartaDoc: TPatternEdit;
    GroupBox1: TGroupBox;
    cmbUsuarios: TDBCheckCombo;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    gbCajaAdmin: TGroupBox;
    edCajaAdmin: TIntEdit;
    Label12: TLabel;
    edMedioHasta: TIntEdit;
    tbEnviarMailUsuarios: TToolButton;
    ToolButton9: TToolButton;
    pnlTiff: TPanel;
    fraVistaTIFFImg: TfraVistaTIFF;
    splittertiff: TJvNetscapeSplitter;
    tbRepos: TToolBar;
    tbMaximizarImagen: TToolButton;
    ilColorRepos: TImageList;
    ilByNRepos: TImageList;
    chkInconsistencias: TCheckBox;
    tbEstadisticasImagenes: TToolButton;
    ToolButton10: TToolButton;
    gbSecTrazabilidad: TGroupBox;
    edSecTrazabilidad: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure fraTipoArchivoRepositPropiedadesChange(Sender: TObject);
    procedure fraTipoArchivoEdicPropiedadesChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbVerImagenClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure DoMostrarImagen(DataSet: TDataSet);
    procedure fpImagenShow(Sender: TObject);
    procedure tbCargarImagenClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure ResetearTimer(DataSet: TDataSet);
    procedure tmrImagenesTimer(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirResumenClick(Sender: TObject);
    procedure FSFormActivate(Sender: TObject);
    procedure tbEnviarMailUsuariosClick(Sender: TObject);
    procedure fraVistaTIFFImgtbMaxMinimizarClick(Sender: TObject);
    procedure tbMaximizarImagenClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaINCONSISTENCIA_CODDOCGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tbEstadisticasImagenesClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sdqConsultaBeforeScroll(DataSet: TDataSet);
  private
    tslCheckeados: TStringList;
    pTipoArchivoSeleccionado: TTableId;
    pbIsPrinting, pbCargarImagenes: Boolean;
    fraFiltroArchivoEdic: TFraFiltroArchivo;
    procedure CalcularFilasSel;
    procedure InicializarContadores;
    procedure MostrarImagen(PathImagen: String);
    function DoValidarDatosModificacionSeleccionados(var TipoArchivoSeleccionado: TTableId): Boolean;
    function DoValidarDatosModificacionIngresados: Boolean;
    function DoValidarRegistrosModificacionIngresados: Boolean;
    function DoValidarDatosEliminarSeleccionados: Boolean;
    procedure DoLimpiarDatosEdicion;
    procedure DoEnviarMailReindexacion(TipoArch: TTableId; Clave: String);
    procedure DoGuardarDatosModificacionIngresados;
    procedure DoBorrarArchivo(PathArchivo: String);
    function DoArmarWhere: String;
    function GetListaCarpetasVirtuales: String;
    procedure DoValidarYCargarImagenesSeleccionadas;
    function GetConsulta: String;
  public
    class procedure DoMostrarSegErroresUsuarios(ANroMedio, ALote: TTableId; AClave, ACodDocumento: String);
  protected
    procedure RefreshData; override;
  private
    procedure DoActivarImprimir;
  end;

const
  SMCampoFila            = 'FILA';
  SMCampoCheckBox        = 'CHECKBOX';
  FONTNAMETILDE: String  = 'Wingdings';
  FONTSIZETILDE: Integer = 12;

  FSqlBase = 'FROM RLO_LOTE, RTC_TIPOCLAVE, RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO, RAR_ARCHIVO, RRA_REPOSITORIOARCHIVO ' +
            'WHERE RA_IDARCHIVO = AR_ID ' +
              'AND AR_TIPO = TA_ID ' +
              'AND TA_FORMULARIO = TC_CLAVE ' +
              'AND RA_IDTIPODOCUMENTO = TD_ID(+) ' +
              'AND RA_LOTE = LO_ID(+) ' +
              'AND LO_FECHABAJA(+) IS NULL ' +
              'AND RA_FECHABAJA IS NULL ';

var
  frmConsultarRepositorio: TfrmConsultarRepositorio;

implementation

{$R *.dfm}

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unSesion, unComunes, DbFuncs, General,
  StrFuncs, unUtilsArchivo, unComunesArchivo, unArchivo, unGrids, VCLExtra,
  SqlFuncs, unConstantArchivo, ArchFuncs, unImageFunctions, unRptResumenRepositorio,
  unTesoreria, unMoldeEnvioMail, unComunesMail, unEspera, DataToXLS, Clipbrd,
  unEstadisticasImagenes, unImportarImagRepositorio, StrUtils;

function TfrmConsultarRepositorio.DoArmarWhere: String;
var
  sCodigo, sSqlWhere: String;
  bPorClave: Boolean;
begin
  // *** LOS CAMPOS QUE AGREGO ACA TIENEN QUE ESTAR INCLUIDOS EN EL SELECT DEL RefreshData... ***
  sSqlWhere := SqlBetweenDateTime(' AND RA_FECHAALTA ', edFAltaRepositDesde.Date, edFAltaRepositHasta.Date) +
               SqlBetweenDateTime(' AND RA_FECHAMODIF ', edFModifRepositDesde.Date, edFModifRepositHasta.Date) +
               SqlBetween(' AND ARCHIVO ', edImagenDesde.Text, edImagenHasta.Text) +
               SqlBetween(' AND CD', edMedioDesde.Value, edMedioHasta.Value);

  if not edLote.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND LOTE = ' + SqlValue(edLote.Value);

  if not edCajaAdmin.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CAJAADMIN = ' + SqlValue(edCajaAdmin.Value);

  if not IsEmptyString(edCartaDoc.Text) then
    sSqlWhere := sSqlWhere + ' AND NROCARTADOC = ' + SqlValue(edCartaDoc.Text);

  if not IsEmptyString(edPathArchivo.Text) then
    sSqlWhere := sSqlWhere + ' AND PATHARCHIVO LIKE ' + SqlValue('%' + Trim(edPathArchivo.Text) + '%');

  if fraTipoDocumento.IsSelected then
    sCodigo := fraTipoDocumento.Codigo
  else if not IsEmptyString(edCodigoDocumento.Text) then
    sCodigo := Trim(edCodigoDocumento.Text)
  else
    sCodigo := '';

  if not IsEmptyString(sCodigo) then
    sSqlWhere := sSqlWhere + ' AND ' + SqlValue(Trim(sCodigo)) + ' IN (TD_CODIGO, RA_CODDOCUMENTO)';

  if chkImagSinCarpeta.Checked then
    sSqlWhere := sSqlWhere + ' AND AR_CLAVE IN (' + GetListaCarpetasVirtuales() + ')' +
                             ' AND CODDOCUMENTO <> ' + SqlValue(CODDOC_LOTE);

  if chkInconsistencias.Checked then
    sSqlWhere := sSqlWhere + ' AND INCONSISTENCIA_CODDOC IS NOT NULL';

  if cmbUsuarios.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND USUALTA ' + cmbUsuarios.InSql;

  if edSecTrazabilidad.Value > 0 then
    sSqlWhere := sSqlWhere + ' AND SECUENCIATRAZABIL = ' + SqlValue(edSecTrazabilidad.Value);

  if fraFiltroArchivoReposit.IsSelected then
    begin
      bPorClave := ((fraFiltroArchivoReposit.Clave <> '|') and (fraFiltroArchivoReposit.Clave <> ''));

      if fraFiltroArchivoReposit.Tipo <> 0 then
        sSqlWhere := sSqlWhere + ' AND TIPOARCHIVO = ' + SqlValue(fraFiltroArchivoReposit.Tipo);

      if bPorClave then
        begin
          if fraFiltroArchivoReposit.IsCompleted then
            sSqlWhere := sSqlWhere + ' AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoReposit.Clave)
          else if InStr(fraFiltroArchivoReposit.Clave, '|') > 0 then
            begin
              if StrLeft(fraFiltroArchivoReposit.Clave, 1) = '|' then
                sSqlWhere := sSqlWhere + ' AND AR_CLAVE LIKE ' + SqlValue('%' + fraFiltroArchivoReposit.Clave)
              else
                sSqlWhere := sSqlWhere + ' AND AR_CLAVE LIKE ' + SqlValue(fraFiltroArchivoReposit.Clave + '%') ;
            end;
        end;
    end;

  Result := sSqlWhere;
end;

function TfrmConsultarRepositorio.GetConsulta: String;
var
  sSql: String;
begin
  sSql := 'SELECT B.*, DECODE(B.CODDOCUMENTO, ''LOTE'', NULL, DECODE(INSTR('' '' || B.CODDOCS_CLAVELOTE || '' ''  , '' '' || B.CODDOCUMENTO || '' ''), 0, 1, NULL)) INCONSISTENCIA_CODDOC ' +
            'FROM ( ' +
            'SELECT 0 ' + SMCampoCheckBox + ', RA_LOTE LOTE, RA_SEQ_LOTE SEQ_LOTE, RA_NROMEDIO CD, RA_OBSERVACIONES OBSERVACIONES, ' +
                   'RA_PATHARCHIVO PATHARCHIVO, RA_ARCHIVO ARCHIVO, RA_CAJAADMIN CAJAADMIN, AR_TIPO TIPOARCHIVO, ' +
                   'NVL(TD_CODIGO, RA_CODDOCUMENTO) CODDOCUMENTO, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) DESCRIPCIONCLAVE, ' +
                   'ARCHIVO.GET_DESCRIPCIONCODDOCUMENTO(AR_TIPO, NVL(TD_CODIGO, RA_CODDOCUMENTO)) DESCRDOCUMENTO, ' +
                   'TA_DESCRIPCION DESCRTIPOARCH, LO_USUALTA USUALTALOTE, TRUNC(LO_FECHAALTA) FECHAALTALOTE, ' +
                   'TRUNC(RA_FECHAALTA) FECHAALTAREPOS, RA_ID RAID, ART.VARIOS.PUTLASTBAR(RA_PATHARCHIVO) || RA_ARCHIVO DIRARCHIVOCOMPLETO, ' +
                   'TRUNC(RA_FECHAMODIF) FECHAMODIFREPOS, RA_NRODOCUMENTO NROCARTADOC, RA_HOJA HOJA, RA_LEGAJO LEGAJO, ' +
                   'RA_NROOPERACION_GT NROOPERACION_GT, RA_BENEFICIARIO_GT BENEFICIARIO_GT, RA_FECHAOPER_GT FECHAOPER_GT, ' +
                   'RA_NROCHEQUE_GT NROCHEQUE_GT, RA_USUALTA USUALTA, LO_CAJA CAJALOTE, RA_CLAVENOMIGRADA CLAVENOMIGRADA, ' +
                   'RA_PATHARCHIVO || ''\'' || RA_ARCHIVO IMAGEN, RA_USUMODIF USUMODIFREPOS, ARCHIVO.GET_LISTACODDOCCLAVELOTE(AR_CLAVE, RA_LOTE) CODDOCS_CLAVELOTE, ' +
                   'RA_FECHAALTA, RA_FECHAMODIF, TD_CODIGO, RA_CODDOCUMENTO, AR_CLAVE, RA_SECUENCIATRAZABIL SECUENCIATRAZABIL ' +
                   FSqlBase + ') B';

  sSql := 'SELECT ROWNUM ' + SMCampoFila + ', A.* ' +
            'FROM (' + sSql + ') A WHERE 1 = 1 ' + DoArmarWhere();

  Result := sSql;
end;

procedure TfrmConsultarRepositorio.RefreshData;
begin
  sdqConsulta.Sql.Text := GetConsulta() + SortDialog.OrderBy;
  inherited;
  InicializarContadores;
end;

procedure TfrmConsultarRepositorio.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived      := False;
  pbCargarImagenes := False;
  pbIsPrinting     := False;
  tslCheckeados    := TStringList.Create;

  with fraFiltroArchivoReposit do
    begin
      fraTipoArchivo.Propiedades.ExtraCondition :=
        fraTipoArchivo.Propiedades.ExtraCondition + ' AND TA_TIENEREPOSITORIO = ''S'' ';
      fraTipoArchivo.Propiedades.OnChange := fraTipoArchivoRepositPropiedadesChange;
    end;

  with fraTipoDocumento do
    begin
      TableName   := 'RTD_TIPODOCUMENTO';
      FieldID     := 'TD_ID';
      FieldCodigo := 'TD_CODIGO';
      FieldDesc   := 'TD_DESCRIPCION';
      FieldBaja   := 'TD_FECHABAJA';
      ShowBajas   := True;
    end;

  fraTipoArchivoRepositPropiedadesChange(nil);

  fraFiltroArchivoEdic := TFraFiltroArchivo.Create(Self);
  with fraFiltroArchivoEdic do
    begin
      Parent   := fpAbm;
      Align    := alNone;
      TabOrder := 0;
      Left     := 28;
      Top      := 28;
      Width    := fpAbm.Width - 30;
      Height   := 102;
      Anchors  := [akLeft, akTop, akRight];
      fraTipoArchivo.Propiedades.ExtraCondition :=
        fraTipoArchivo.Propiedades.ExtraCondition + ' AND TA_TIENEREPOSITORIO = ''S'' ';
      fraTipoArchivo.Propiedades.OnChange := fraTipoArchivoEdicPropiedadesChange;
    end;

  with fraTipoDocumentoEdic do
    begin
      TableName   := 'RTD_TIPODOCUMENTO';
      FieldID     := 'TD_ID';
      FieldCodigo := 'TD_CODIGO';
      FieldDesc   := 'TD_DESCRIPCION';
      FieldBaja   := 'TD_FECHABAJA';
      ShowBajas   := False;
    end;

  fraTipoArchivoEdicPropiedadesChange(nil);

  with fraVistaTiffImg do
    begin
      DataSource                := dsConsulta;
      PanelAuxVisible           := True;
      DataSourceUsarRecordCount := False;
    end;

  with odArchivoEdic do
    begin
      Title  := 'Seleccione el archivo a cargar';
      Filter := 'Archivo de imágenes TIFF|*.tif';
    end;

  with fpAbm do
    begin
      FormLeft := 1;
      FormTop  := (Self.Height - fpAbm.Height) div 2;
    end;  

  sdqUsuario.Open;

  VCLExtra.LockControl(edImagenEdic);
  tbVerImagenClick(nil);
end;

procedure TfrmConsultarRepositorio.fraTipoArchivoRepositPropiedadesChange(Sender: TObject);
begin
  with fraTipoDocumento do
    begin
      Clear;

      if fraFiltroArchivoReposit.IsSelected then
        ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                         'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                        'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraFiltroArchivoReposit.Tipo) + ' ' +
                                          'AND AD_FECHABAJA IS NULL ' +
                                          'AND AD_IDTIPODOCUMENTO = TD_ID) '
      else
        ExtraCondition := ' AND 1 = 2';
    end;

  fraFiltroArchivoReposit.OnArchivoChange(Sender);
end;

procedure TfrmConsultarRepositorio.fraTipoArchivoEdicPropiedadesChange(Sender: TObject);
begin
  with fraTipoDocumentoEdic do
    begin
      Clear;

      if fraFiltroArchivoEdic.IsSelected then
        ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                         'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                        'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraFiltroArchivoEdic.Tipo) + ' ' +
                                          'AND AD_FECHABAJA IS NULL ' +
                                          'AND AD_IDTIPODOCUMENTO = TD_ID) '
      else
        ExtraCondition := ' AND 1 = 2';
    end;

  fraFiltroArchivoEdic.OnArchivoChange(Sender);
end;

procedure TfrmConsultarRepositorio.tbLimpiarClick(Sender: TObject);
begin
  fraFiltroArchivoReposit.Clear;
  edFAltaRepositDesde.Clear;
  edFAltaRepositHasta.Clear;
  edFModifRepositDesde.Clear;
  edFModifRepositHasta.Clear;
  edLote.Clear;
  edSecTrazabilidad.Clear;
  edMedioDesde.Clear;
  edMedioHasta.Clear;
  edCajaAdmin.Clear;
  edCartaDoc.Clear;
  fraTipoDocumento.Clear;
  edCodigoDocumento.Clear;
  edPathArchivo.Clear;
  edImagenDesde.Clear;
  edImagenHasta.Clear;
  tslCheckeados.Clear;
  cmbUsuarios.Clear;
  chkImagSinCarpeta.Checked := False;
  chkInconsistencias.Checked := False;

  fraTipoArchivoRepositPropiedadesChange(nil);

  InicializarContadores;

  fraVistaTIFFImg.Image := '';

  inherited;
  InicializarContadores;
  DoActivarImprimir;
end;

procedure TfrmConsultarRepositorio.mnuMarcarTodosClick(Sender: TObject);
begin
  DoSMMarcarTodos(tslCheckeados, sdqConsulta, SMCampoFila);
  CalcularFilasSel;
end;

procedure TfrmConsultarRepositorio.mnuDesmarcarTodosClick(Sender: TObject);
begin
  DoSMDesmarcarTodos(tslCheckeados, Grid);
  InicializarContadores;
end;
            
procedure TfrmConsultarRepositorio.GridCellClick(Column: TColumn);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and
   ((Column.FieldName = SMCampoCheckBox) or IsGrillaEnSeleccionMultipleIndividual(Grid, pGridKey, pGridShift)) then
    begin
      DoSMMarcarDesmarcarFila(tslCheckeados, Grid, SMCampoFila, True);
      CalcularFilasSel;
    end;
end;

procedure TfrmConsultarRepositorio.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(Grid, tslCheckeados, SMCampoFila, Rect);
end;

procedure TfrmConsultarRepositorio.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;

  if Field.FieldName = 'INCONSISTENCIA_CODDOC' then
    begin
      Background  := TColor($B3FFFF);   // gama amarillo
      AFont.Color := clRed;
    end
  else
    begin
      AFont.Color := clWindowText;

      if Field.FieldName = 'CODDOCS_CLAVELOTE' then
        Background := clWindow
      else
        DoSMGridGetCellProps(tslCheckeados, sdqConsulta, SMCampoFila, Background, clSkyBlue);
    end;
end;

procedure TfrmConsultarRepositorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslCheckeados.Free;
end;

procedure TfrmConsultarRepositorio.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tslCheckeados.Clear;
end;

procedure TfrmConsultarRepositorio.CalcularFilasSel;
begin
  edCantSelecc.Value := tslCheckeados.Count;
  Grid.Repaint;
end;

procedure TfrmConsultarRepositorio.InicializarContadores;
begin
  edCantSelecc.Value := 0;
  Grid.Repaint;
end;

procedure TfrmConsultarRepositorio.tbOrdenarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  try
    inherited;
  finally
    SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
  end;

  CalcularFilasSel;
end;

procedure TfrmConsultarRepositorio.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  DoSMGridKeyDown(Key, Grid, SMCampoCheckBox, Shift);
end;

procedure TfrmConsultarRepositorio.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;

  // no estaba copiando una celda de la grilla
  if (ssCtrl in Shift) and ((Key = Ord('C')) or (Key = Ord('c')) or (Key = 45)) then
    Clipboard.AsText := Grid.SelectedField.AsString;

  DoSMGridKeyUp(Key, Shift);
end;

procedure TfrmConsultarRepositorio.tbExportarClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  try
    inherited;
  finally
    SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
  end;
end;

procedure TfrmConsultarRepositorio.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsultarRepositorio.tbEliminarClick(Sender: TObject);
var
  sSql, sPathImagen: String;
  bCargarImagenes: Boolean;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  if DoValidarDatosEliminarSeleccionados then
    begin
      sdqConsulta.DisableControls;
      try
        if MsgBox('¿Confirma la baja de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
          begin
            BeginTrans;
            try
              with sdqConsulta do
                begin
                  bCargarImagenes  := pbCargarImagenes;
                  pbCargarImagenes := False;
                  try
                    First;
                    while not Eof do
                      begin
                        if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                          begin
                            sPathImagen := FieldByName('DIRARCHIVOCOMPLETO').AsString;
                            DoBorrarArchivo(sPathImagen);

                            sSql := 'UPDATE RRA_REPOSITORIOARCHIVO ' +
                                       'SET RA_FECHABAJA = SYSDATE, ' +
                                           'RA_USUBAJA = :User ' +
                                     'WHERE RA_ID = :Id';
                            EjecutarSqlSTEx(sSql, [Sesion.UserId, FieldByName('RAID').AsInteger]);
                          end;

                        Next;
                      end;
                  finally
                    pbCargarImagenes := bCargarImagenes;
                  end;
                end;

               CommitTrans;
               MsgBox('Registros dados de baja correctamente.', MB_ICONINFORMATION);
               Grid.UnselectAll;
               RefreshData;
            except
              on E:Exception do
                begin
                  Rollback;
                  Raise Exception.Create(E.Message + CRLF + 'Error al dar de baja los registros.');
                end;
            end;
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;

procedure TfrmConsultarRepositorio.MostrarImagen(PathImagen: String);
begin
  with fraVistaTIFFImg do
    try
      if PathImagen <> Image then
        begin
          Mensaje := '';

          try
            PageCount := 1;
            Page      := 1;
            Image     := PathImagen;
          except
            InfoHint(imgVista, 'Ocurrió un error al intentar cargar la imagen: ' + PathImagen + '.');
          end;

          if not FileExists(Image) then
            begin
              Clear;
              Mensaje := 'Error: La imagen no se encuentra en el servidor.';
            end;
        end;
    except
      Mensaje := 'Error al leer la imagen.';
    end;
end;

procedure TfrmConsultarRepositorio.tbVerImagenClick(Sender: TObject);
begin
  if tbVerImagen.Down then
    begin
      Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
//      Verificar(tslCheckeados.Count > 0, Grid, 'No debe seleccionar ningún registro de la grilla.');

      pbCargarImagenes := True;
      ResetearTimer(nil);
      pnlTiff.Visible      := True;
      splitterTiff.Visible := True;
    end
  else
    begin
      pbCargarImagenes     := False;
      pnlTiff.Visible      := False;
      splitterTiff.Visible := False;
    end;
end;

procedure TfrmConsultarRepositorio.tbModificarClick(Sender: TObject);
var
  IdRRar: TTableId;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  IdRRar := sdqConsulta.FieldByName('RAID').AsInteger;
  if DoValidarDatosModificacionSeleccionados(pTipoArchivoSeleccionado) then
    begin
      sdqConsulta.DisableControls;
      try
        fpAbm.Caption := CAPTION_MODIFIC;
        if fpAbm.ShowModal = mrOk then
          begin
            Grid.UnselectAll;
            RefreshData;
            try
              sdqConsulta.First;
              if not sdqConsulta.Locate('RAID', IdRRar, []) then
                sdqConsulta.First;
            except
            end;
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;

function TfrmConsultarRepositorio.DoValidarDatosModificacionSeleccionados(var TipoArchivoSeleccionado: TTableId): Boolean;
var
  APointer: TBookMark;
  bValidarAdicional, bCargarImagenes: Boolean;
  iTotales, iCantProcesados: Integer;
  sUsuAltaLote, sClave: String;
begin
  bValidarAdicional := not (GetPerfilAdministrador() or GetPerfilGuardaYDigitalizacion());

  bCargarImagenes  := pbCargarImagenes;
  pbCargarImagenes := False;
  iCantProcesados  := 0;
  iTotales         := tslCheckeados.Count;
  sClave           := '';

  APointer := sdqConsulta.GetBookmark;
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        TipoArchivoSeleccionado := ART_EMPTY_ID;
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                if TipoArchivoSeleccionado = ART_EMPTY_ID then
                  begin
                    TipoArchivoSeleccionado := FieldByName('TIPOARCHIVO').AsInteger;
                    sClave                  := FieldByName('AR_CLAVE').AsString;
                  end  
                else
                  Verificar(TipoArchivoSeleccionado <> FieldByName('TIPOARCHIVO').AsInteger, nil, 'Todos los registros seleccionados deben ser del mismo tipo de archivo.');

                if bValidarAdicional and not Seguridad.Claves.IsActive('PermisoNoValidarCDMenorA10000') then
                  Verificar((FieldByName('CD').IsNull and not IsImagenDigitalizadaPorUsuario(FieldByName('RAID').AsInteger)) or (not FieldByName('CD').IsNull and (FieldByName('CD').AsInteger < MINROMEDIO)), nil, 'Alguno de los registros seleccionados no puede ser modificado porque el nro. de CD no existe o es menor al ' + Trim(IntToStr(MINROMEDIO)) + '.');

                if bValidarAdicional and not FieldByName('LOTE').IsNull then
                  begin
                    sUsuAltaLote := Get_UsuarioAltaLote(FieldByName('LOTE').AsInteger);
                    Verificar(not IsEmptyString(sUsuAltaLote) and not Is_UsuariosMismoSector(Sesion.UserID, sUsuAltaLote), nil, 'Alguno de los registros seleccionados no puede ser modificado por su sector, porque el lote corresponde a otro sector.');
                  end;

                Inc(iCantProcesados);
                if iCantProcesados = iTotales then
                  Break;
              end;

            Next;
          end;

        if iTotales = 1 then
          DoMostrarMensajesAdvertenciaCarpeta(TipoArchivoSeleccionado, sClave);
      end;
  finally
    sdqConsulta.GotoBookmark(APointer);
    sdqConsulta.EnableControls;
    pbCargarImagenes := bCargarImagenes;
  end;

  Result := True;
end;

procedure TfrmConsultarRepositorio.fpImagenShow(Sender: TObject);
begin
  DoMostrarImagen(nil);
end;

procedure TfrmConsultarRepositorio.tbCargarImagenClick(Sender: TObject);
var
  sArchivo: String;
begin
  with odArchivoEdic do
    if Execute then
      begin
        sArchivo := ExtractFileName(FileName);
        Verificar(length(sArchivo) > 20, tbCargarImagen, 'El nombre completo del archivo no puede ser mayor a 20 caracteres.');
        edImagenEdic.Text := ExtractFileName(FileName);
      end;
end;

procedure TfrmConsultarRepositorio.btnAceptarClick(Sender: TObject);
begin
  if DoValidarDatosModificacionIngresados() and DoValidarRegistrosModificacionIngresados() then
    DoGuardarDatosModificacionIngresados;
end;

function TfrmConsultarRepositorio.DoValidarRegistrosModificacionIngresados: Boolean;
var
  APointer: TBookMark;
  bCargarImagenes: Boolean;
  iTotales, iCantProcesados: Integer;
begin
  Result           := False;
  bCargarImagenes  := pbCargarImagenes;
  pbCargarImagenes := False;
  try
    with sdqConsulta do
      begin
        DisableControls;
        APointer := GetBookmark;
        try
          iCantProcesados := 0;
          iTotales        := tslCheckeados.Count;

          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                begin
                  // se cambia el tipo de archivo pero no el nro. de lote, y la imagen ya tenía un nro. de lote asignado
                  Verificar(not FieldByname('LOTE').IsNull and fraFiltroArchivoEdic.IsSelected and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado) and (edLoteEdic.IsEmpty or (edLoteEdic.Value = 0)) and not Is_ExisteLoteEnTipoArchivo(FieldByname('LOTE').AsInteger, fraFiltroArchivoEdic.Tipo), fraFiltroArchivoEdic, 'Para alguno de los registros seleccionados, el tipo de archivo elegido no corresponde al tipo de archivo del lote (' + FieldByname('LOTE').AsString + ').');

                  Inc(iCantProcesados);
                  if iCantProcesados = iTotales then
                    Break;
                end;

              Next;
            end;

          Result := True;
        finally
          if Result then
            GotoBookmark(APointer);

          EnableControls;
        end;
      end;
  finally
    pbCargarImagenes := bCargarImagenes;
  end;
end;

function TfrmConsultarRepositorio.DoValidarDatosModificacionIngresados: Boolean;
var
  bPermitirCDocBajas: Boolean;
begin
  Verificar(fraFiltroArchivoEdic.IsSelected and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado) and not fraFiltroArchivoEdic.IsCompleted, fraFiltroArchivoEdic, 'Debe indicar una clave.');
  Verificar(fraFiltroArchivoEdic.IsSelected and (fraFiltroArchivoEdic.Tipo = pTipoArchivoSeleccionado) and not fraFiltroArchivoEdic.IsCompleted and not fraTipoDocumentoEdic.IsSelected, fraFiltroArchivoEdic, 'Debe indicar una nueva clave o un nuevo código de documento.');
  Verificar(fraFiltroArchivoEdic.IsCompleted and not fraFiltroArchivoEdic.Exists, fraFiltroArchivoEdic, 'La clave indicada no existe.');
  Verificar(fraFiltroArchivoEdic.IsSelected and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado) and not fraTipoDocumentoEdic.IsSelected, fraTipoDocumentoEdic, 'Si modifica el tipo de archivo, entonces debe indicar un nuevo código de documento.');

  // si ponen explícitamente Lote = 0, entonces borro el nro. de lote, y así les permito eliminar nros. de lotes cargados erróneamente.
  Verificar(not edLoteEdic.IsEmpty and (edLoteEdic.Value <> 0) and not Is_ExisteLote(edLoteEdic.Value), edLoteEdic, 'El lote no existe.');
  Verificar(not edLoteEdic.IsEmpty and (edLoteEdic.Value <> 0) and not Is_ExisteLoteEnTipoArchivo(edLoteEdic.Value, Iif(fraFiltroArchivoEdic.IsSelected, fraFiltroArchivoEdic.Tipo, pTipoArchivoSeleccionado)), edLoteEdic, 'El lote seleccionado no corresponde al tipo de archivo.');

  Verificar(not IsEmptyString(edDocumentoEdic.Text) and not fraFiltroArchivoEdic.IsSelected, fraFiltroArchivoEdic, 'Si modifica el nro. de documento, entonces debe indicar el tipo de archivo y la clave.');

  Verificar(not edHojaEdic.IsEmpty and ((fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoExtractosBancarios) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoExtractosBancarios(pTipoArchivoSeleccionado))), edHojaEdic, 'El nro. de hoja es solo para los Extractos Bancarios.');
  Verificar(not edHojaEdic.IsEmpty and (edHojaEdic.Value <= 0), edHojaEdic, 'El nro. de hoja debe ser mayor a 0.');
  Verificar(edHojaEdic.IsEmpty and fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoArchivoExtractosBancarios and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado), edHojaEdic, 'Debe indicar el nro. de hoja.');

  Verificar(not edLegajoEdic.IsEmpty and ((fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCuentasPagarViaticos) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCuentasPagarViaticos(pTipoArchivoSeleccionado))), edLegajoEdic, 'El nro. de legajo es solo para Cuentas a Pagar (Viáticos).');
  Verificar(not edLegajoEdic.IsEmpty and (edLegajoEdic.Value <= 0), edLegajoEdic, 'El nro. de legajo debe ser mayor a 0.');
  Verificar(not edLegajoEdic.IsEmpty and not Is_ExisteLegajo(edLegajoEdic.Value), edLegajoEdic, 'El nro. de legajo no existe.');
  Verificar(edLegajoEdic.IsEmpty and fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoArchivoCuentasPagarViaticos and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado), edLegajoEdic, 'Debe indicar el nro. de legajo.');

  if fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoCartaDocumento() then
    begin
      if (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado) or fraFiltroArchivoEdic.IsCompleted then
        begin
          bPermitirCDocBajas := Is_PermitirCartasDocBajas(fraFiltroArchivoEdic.Tipo);
          fraFiltroArchivoEdic.IsCartaDocumentoValida(edDocumentoEdic.Text, edDocumentoEdic, True, bPermitirCDocBajas);
        end;
    end;

  Verificar(not IsEmptyString(edImagenEdic.Text) and (tslCheckeados.Count > 1), edImagenEdic, 'No puede seleccionar más de un registro en la grilla si va a cambiar la imagen.');
  Verificar(not IsEmptyString(edImagenEdic.Text) and not IsImagenValidaRepositorio(odArchivoEdic.FileName), edImagenEdic, 'La imagen seleccionada es corrupta.');

  Verificar(not IsEmptyString(edNroOperGT.Text) and ((fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCajaGirosTransferencias) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCajaGirosTransferencias(pTipoArchivoSeleccionado))), edNroOperGT, 'El nro. de operación de giro/transferencia es solo para las Cajas de Giros y Transferencias.');
  Verificar(IsEmptyString(edNroOperGT.Text) and fraFiltroArchivoEdic.IsSelected and fraFiltroArchivoEdic.IsTipoArchivoCajaGirosTransferencias and (fraFiltroArchivoEdic.Tipo <> pTipoArchivoSeleccionado), edNroOperGT, 'Debe indicar el nro. de operación de giro/transferencia.');
  Verificar(not IsEmptyString(edNroOperGT.Text) and not Is_ExisteNroOperGT(edNroOperGT.Text), edNroOperGT, 'El nro. de operación de giro/transferencia no existe.');

  Verificar(not fraFiltroArchivoEdic.IsCompleted and not fraTipoDocumentoEdic.IsSelected and
            edLoteEdic.IsEmpty and IsEmptyString(edImagenEdic.Text) and IsEmptyString(edDocumentoEdic.Text) and
            edHojaEdic.IsEmpty and edLegajoEdic.IsEmpty and IsEmptyString(edNroOperGT.Text) and
            IsEmptyString(edObservacionesEdic.Lines.Text), nil, 'Debe indicar al menos un dato a modificar.');

  if fraFiltroArchivoEdic.IsCompleted then
    DoMostrarMensajesAdvertenciaCarpeta(fraFiltroArchivoEdic.Tipo, fraFiltroArchivoEdic.Clave);

  Result := True;
end;

procedure TfrmConsultarRepositorio.DoLimpiarDatosEdicion;
begin
  fraFiltroArchivoEdic.Clear;
  fraTipoDocumentoEdic.Clear;
  edLoteEdic.Clear;
  edHojaEdic.Clear;
  edLegajoEdic.Clear;
  edDocumentoEdic.Clear;
  edNroOperGT.Clear;
  edImagenEdic.Clear;
  edObservacionesEdic.Clear;
  chkAgregarObservEdic.Checked := True;
  fraTipoArchivoEdicPropiedadesChange(nil);
end;

procedure TfrmConsultarRepositorio.fpAbmEnter(Sender: TObject);
begin
  DoLimpiarDatosEdicion;
end;

procedure TfrmConsultarRepositorio.DoEnviarMailReindexacion(TipoArch: TTableId; Clave: String);
var
  iPos: Integer;
  sImagen, sAsunto, sCuerpo: String;
begin
  with sdqConsulta do
    begin
      if (TipoArch <> ART_EMPTY_ID) and ((TipoArch <> FieldByName('TIPOARCHIVO').AsInteger) or (Clave <> FieldByName('AR_CLAVE').AsString)) then
        begin
          sAsunto := '[Imágenes] Ajuste - Archivo: ' + FieldByName('DESCRTIPOARCH').AsString + ' - Clave: ' + FieldByName('AR_CLAVE').AsString;
          VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION := get_ParametrobyId(PARAMETRO_CORREO_GUARDAYDIGITALIZACION);

          sImagen := FieldByName('IMAGEN').AsString;
          if StrLeft(sImagen, 2) = '\\' then
            begin
              iPos := PosEx('\', sImagen, 3);
              if iPos > 0 then
                sImagen := CutLeft(sImagen, iPos+1);
            end;

          sCuerpo := 'Favor de reindexar la siguiente imagen para actualizar el servidor y la guarda documental:' + CRLF +
                     '   Tipo de Archivo Anterior: ' + FieldByName('DESCRTIPOARCH').AsString + CRLF +
                     '   Clave Anterior: ' + FieldByName('AR_CLAVE').AsString + CRLF +
                     '   CD: ' + FieldByName('CD').AsString + CRLF +
                     '   Lote: ' + FieldByName('LOTE').AsString + CRLF +
                     '   Imagen: ' + sImagen + CRLF + CRLF +
                     '   Tipo de Archivo Actual: ' + fraFiltroArchivoEdic.DescripcionTipo + CRLF +
                     '   Clave Actual: ' + Clave;

          EnviarMailBD(VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION, sAsunto, [], sCuerpo, nil, 0, tcDefault, False);
        end;
    end;
end;

procedure TfrmConsultarRepositorio.DoGuardarDatosModificacionIngresados;
var
  sSqlRRA: TSql;
  TipoArchivo, rarId: TTableId;
  sObservacNue, sCarpetaDest, sCarpetaOrig, sPathImagen, sArchivo, sClave: String;
  sObservacAct: String;
  bCargarImagenes, bCopiaOk: Boolean;
  iTotales, iCantProcesados: Integer;
begin
  bCargarImagenes  := pbCargarImagenes;
  pbCargarImagenes := False;
  sdqConsulta.DisableControls;
  try
    if MsgBox('¿Confirma la modificación del repositorio de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
      begin
        sSqlRRA := TSql.Create('RRA_REPOSITORIOARCHIVO');
        try
          BeginTrans;
          try
            with sdqConsulta do
              begin
                iCantProcesados := 0;
                iTotales        := tslCheckeados.Count;

                First;
                while not Eof do
                  begin
                    if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                      begin
                        with sSqlRRA do
                          begin
                            Clear;
                            SqlType := stUpdate;

                            PrimaryKey.Add('RA_ID',              FieldByName('RAID').AsInteger);

                            TipoArchivo := ART_EMPTY_ID;
                            sClave      := '';
                            if fraFiltroArchivoEdic.IsCompleted then
                              begin
                                TipoArchivo := fraFiltroArchivoEdic.Tipo;
                                sClave      := fraFiltroArchivoEdic.Clave;

                                if not VerificarClaveExiste(TipoArchivo, sClave, rarId) then
                                  rarId := DoInsertArchivo(TipoArchivo, TIPOUBICACION_GUARDA, '', 0, '', '', sClave, False);

                                Fields.Add('RA_IDARCHIVO',       rarid);
                              end;

                            if fraTipoDocumentoEdic.IsSelected then
                              begin
                                Fields.Add('RA_IDTIPODOCUMENTO', fraTipoDocumentoEdic.Value);
                                Fields.Add('RA_CODDOCUMENTO',    exNull);
                              end;

                            if not edLoteEdic.IsEmpty then
                              begin
                                if edLoteEdic.Value = 0 then
                                  begin
                                    Fields.Add('RA_LOTE',        exNull);
                                    Fields.Add('RA_SEQ_LOTE',    exNull);
                                  end
                                else
                                  Fields.Add('RA_LOTE',          edLoteEdic.Value);
                              end;

                            if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCartaDocumento()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCartaDocumento(pTipoArchivoSeleccionado)) then
                              Fields.Add('RA_NRODOCUMENTO',      exNull)
                            else if fraFiltroArchivoEdic.IsCompleted and fraFiltroArchivoEdic.IsCartaDocumento() then
                              Fields.Add('RA_NRODOCUMENTO',      sClave)
                            else if fraFiltroArchivoEdic.IsTipoCartaDocumento() and not IsEmptyString(edDocumentoEdic.Text) then
                              Fields.Add('RA_NRODOCUMENTO',      Trim(edDocumentoEdic.Text));

                            if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoExtractosBancarios()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoExtractosBancarios(pTipoArchivoSeleccionado)) then
                              Fields.Add('RA_HOJA',              exNull)
                            else if not edHojaEdic.IsEmpty then
                              Fields.Add('RA_HOJA',              edHojaEdic.Value);

                            if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCuentasPagarViaticos()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCuentasPagarViaticos(pTipoArchivoSeleccionado)) then
                              Fields.Add('RA_LEGAJO',            exNull)
                            else if not edLegajoEdic.IsEmpty then
                              Fields.Add('RA_LEGAJO',            edLegajoEdic.Value);

                            if (fraFiltroArchivoEdic.IsSelected and not fraFiltroArchivoEdic.IsTipoArchivoCajaGirosTransferencias()) or (not fraFiltroArchivoEdic.IsSelected and not TipoArchivoCajaGirosTransferencias(pTipoArchivoSeleccionado)) then
                              Fields.Add('RA_NROOPERACION_GT',   exNull)
                            else if not IsEmptyString(edNroOperGT.Text) then
                              Fields.Add('RA_NROOPERACION_GT',   edNroOperGT.Text);

                            if not IsEmptyString(edImagenEdic.Text) then
                              begin
                                sArchivo := edImagenEdic.Text;
                                Fields.Add('RA_ARCHIVO',         sArchivo);

                                sPathImagen := FieldByName('DIRARCHIVOCOMPLETO').AsString;
                                DoBorrarArchivo(sPathImagen);

                                sCarpetaOrig := IncludeTrailingBackslash(UpperCase(ExtractFilePath(odArchivoEdic.FileName)));
                                sCarpetaDest := IncludeTrailingBackslash(FieldByName('PATHARCHIVO').AsString);
                                bCopiaOk     := CopyFileExt(sCarpetaOrig+sArchivo, sCarpetaDest+sArchivo, False);
                                if not bCopiaOk then
                                  raise Exception.Create('No se pudo copiar el archivo: ' + sArchivo + ' desde la carpeta: ' + sCarpetaOrig + ' a la carpeta ' + sCarpetaDest);
                              end;

                            sObservacNue := Trim(edObservacionesEdic.Lines.Text);
                            if not IsEmptyString(sObservacNue) then
                              begin
                                if chkAgregarObservEdic.Checked and not FieldByName('OBSERVACIONES').IsNull then
                                  begin
                                    sObservacAct := Trim(FieldByName('OBSERVACIONES').AsString);

                                    if StrRight(sObservacAct, 1) <> '.' then
                                      sObservacAct := sObservacAct + '.';

                                    sObservacNue := sObservacAct + ' ' + CRLF + sObservacNue;
                                  end;

                                Fields.Add('RA_OBSERVACIONES',   StrLeft(sObservacNue, edObservacionesEdic.MaxLength));
                              end;

                            Fields.Add('RA_USUMODIF',            Sesion.UserId);
                            Fields.Add('RA_FECHAMODIF',          exDateTime);

                            // if ((TipoArchivo <> ART_EMPTY_ID) and ((TipoArchivo <> FieldByName('TIPOARCHIVO').AsInteger) or (sClave <> FieldByName('AR_CLAVE').AsString))) or (fraTipoDocumentoEdic.IsSelected and (fraTipoDocumentoEdic.Codigo <> FieldByName('TD_CODIGO').AsString)) then
                            //  Fields.Add('RA_SECUENCIATRAZABIL', exNull);  // Según JNitti, no hay que limpiar el nro. de secuencia

                            EjecutarSqlST(Sql);

                            DoEnviarMailReindexacion(TipoArchivo, sClave);
                          end;

                        Inc(iCantProcesados);
                        if iCantProcesados = iTotales then
                          Break;
                      end;

                    Next;
                  end;
              end;

             CommitTrans;
             MsgBox('Registros modificados correctamente.', MB_ICONINFORMATION);
             fpAbm.Close;
             fpAbm.ModalResult := mrOk;
          except
            on E:Exception do
              begin
                Rollback;
                Raise Exception.Create(E.Message + CRLF + 'Error al modificar los datos del repositorio.');
              end;
          end;
        finally
          sSqlRRA.Free;
        end;
     end;
  finally
    sdqConsulta.EnableControls;
    pbCargarImagenes := bCargarImagenes;
  end;
end;

procedure TfrmConsultarRepositorio.ResetearTimer(DataSet: TDataSet);
begin
  if pbCargarImagenes then
    begin
      tmrImagenes.Enabled   := False;
      fraVistaTIFFImg.Image := '';
      tmrImagenes.Enabled   := True;
      fraVistaTIFFImg.MoverEnDataSource(nil);
    end;
end;

procedure TfrmConsultarRepositorio.tmrImagenesTimer(Sender: TObject);
begin
  tmrImagenes.Enabled := False;
  if pbCargarImagenes then
    DoMostrarImagen(nil);
end;

procedure TfrmConsultarRepositorio.DoMostrarImagen(DataSet: TDataSet);
begin
  if pnlTiff.Visible then
    with fraVistaTIFFImg do
      begin
        Image  := '';
        if not Is_OcultarImagenRepositorio(sdqConsulta.FieldByName('TIPOARCHIVO').AsInteger) then
          MostrarImagen(sdqConsulta.FieldByName('DIRARCHIVOCOMPLETO').AsString);
      end;
end;

procedure TfrmConsultarRepositorio.DoBorrarArchivo(PathArchivo: String);
begin
  if FileExists(PathArchivo) and Is_ConectadoProduccion() then
    begin
      if not DeleteReadOnlyFile(PathArchivo) then
        raise Exception.Create('No se pudo borrar el archivo: ' + PathArchivo + '.');
    end;
end;

procedure TfrmConsultarRepositorio.FSFormDestroy(Sender: TObject);
begin
  inherited;
  fraFiltroArchivoEdic.Free;
end;

procedure TfrmConsultarRepositorio.mnuImprimirResultadosClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
      pbIsPrinting := True;
      RefreshData;
      try
        inherited tbImprimirClick(nil);
      finally
        SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
        pbIsPrinting := False;
        RefreshData;
      end;
    end;
end;

procedure TfrmConsultarRepositorio.mnuImprimirResumenClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := GetConsulta();
  DoImprimirResumenRepositorio(sSql);
end;

function TfrmConsultarRepositorio.GetListaCarpetasVirtuales: String;
var
  sCarpetasVirt: String;
  i: Integer;
begin
  sCarpetasVirt := '';

  for i := 1 to 4 do
    sCarpetasVirt := sCarpetasVirt + SqlValue(GetClaveArmada(i, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL, SUBCLAVE_CARPETAVIRTUAL)) + ', ';

  Result := CutRight(sCarpetasVirt, 2);
end;

procedure TfrmConsultarRepositorio.DoActivarImprimir;
begin
  tbImprimir.Enabled := Seguridad.Activar(tbImprimir);
end;

procedure TfrmConsultarRepositorio.FSFormActivate(Sender: TObject);
begin
  inherited;
  DoActivarImprimir;
end;

procedure TfrmConsultarRepositorio.tbEnviarMailUsuariosClick(Sender: TObject);
var
  iCantAdjuntos: Integer;
  vAdjuntos: TArrayOfAttach;
  sTempFile, sSql, sAsunto, sCuerpo, sNombreArchivo: String;
  qryImagenes: TSDQuery;
begin
  Verificar(tslCheckeados.Count = 0, dbGrid, 'No existen registros seleccionados en la grilla');

  if MsgBox('¿Confirma el envío de mails a los usuarios, por la solicitud de indexación de las imágenes seleccionadas?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    begin
      IniciarEspera('Preparando archivos...');
      try
        DoValidarYCargarImagenesSeleccionadas;

        sSql := 'SELECT SE_MAIL MAIL, SE_USUARIO USUARIO, SE_NOMBRE USUNOMBRE ' +
                  'FROM USE_USUARIOS ' +
                 'WHERE SE_USUARIO IN ' +
                        '(SELECT DISTINCT LO_USUALTA  ' +
                           'FROM RLO_LOTE, TIS_IMAGENSELECCIONADA TMPTIS, RRA_REPOSITORIOARCHIVO ' +
                          'WHERE TMPTIS.IS_USUARIO = :Usuario ' +
                            'AND TMPTIS.IS_IDREPOSITORIOARCHIVO = RA_ID ' +
                            'AND RA_LOTE = LO_ID) ' +
                   'AND SE_FECHABAJA IS NULL ' +
                   'AND SE_MAIL IS NOT NULL ' +
              'ORDER BY SE_MAIL';

        with GetQueryEx(sSql, [Sesion.UserId]) do
          try
            VALOR_PARAMETRO_CORREO_DOCUMENTACION := get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

            sAsunto := '[Imágenes] Solicitud de Indexación - ' + Sesion.Usuario;
            sCuerpo := 'Solicitamos nos indiquen las claves de las carpetas de cada una de las imágenes.' + CRLF + 'Se adjuntan las imágenes no indexadas.';

            while not Eof do
              begin
                iCantAdjuntos := 0;

                sSql := 'SELECT TA_DESCRIPCION "Tipo Archivo", NVL(TD_CODIGO, RA_CODDOCUMENTO) "Cód. Doc.", ' +
                               'TD_DESCRIPCION "Documento", LO_ID "Lote", RA_PATHARCHIVO || ''\'' || RA_ARCHIVO "Imagen" ' +
                          'FROM RLO_LOTE, RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO, RAR_ARCHIVO, TIS_IMAGENSELECCIONADA TMPTIS, ' +
                               'RRA_REPOSITORIOARCHIVO ' +
                         'WHERE RA_IDARCHIVO = AR_ID ' +
                           'AND AR_TIPO = TA_ID ' +
                           'AND RA_IDTIPODOCUMENTO = TD_ID(+) ' +
                           'AND RA_LOTE = LO_ID ' +
                           'AND TMPTIS.IS_USUARIO = :Usuario ' +
                           'AND TMPTIS.IS_IDREPOSITORIOARCHIVO = RA_ID ' +
                           'AND LO_USUALTA = :UsuarioImg ' +
                      'ORDER BY 1, 2';

                qryImagenes := GetQueryEx(sSql, [Sesion.UserId, FieldByName('USUARIO').AsString]);
                try
                  if not qryImagenes.Eof then
                    begin
                      sTempFile := GetTempFromFileName('Imagenes.xls');
                      try
                        with TDataToXLS.Create(nil) do
                          try
                            Title.Text := 'Imágenes del usuario: ' + FieldByName('USUNOMBRE').AsString;
                            DataSet := qryImagenes;
                            SaveToFile(sTempFile);

                            Inc(iCantAdjuntos);
                            SetLength(vAdjuntos, iCantAdjuntos);
                            vAdjuntos[iCantAdjuntos - 1] := GetAttach(sTempFile, 0);
                          finally
                            Free;
                          end;

                        while not qryImagenes.Eof do
                          begin
                            sNombreArchivo := qryImagenes.FieldByName('Imagen').AsString;

                            Inc(iCantAdjuntos);
                            SetLength(vAdjuntos, iCantAdjuntos);
                            vAdjuntos[iCantAdjuntos - 1] := GetAttach(sNombreArchivo, 0);

                            qryImagenes.Next;
                          end;

                        EnviarMailBD(FieldByName('MAIL').AsString, sAsunto, [], sCuerpo, vAdjuntos, 0);
                        EnviarMailBD(VALOR_PARAMETRO_CORREO_DOCUMENTACION, sAsunto, [], sCuerpo, vAdjuntos, 0);
                      finally
                        DeleteFile(sTempFile);
                      end;
                    end;
                finally
                  qryImagenes.free;
                end;

                Next;
              end;

            MsgBox('Mails enviados correctamente.', MB_ICONINFORMATION);
          finally
            free;
          end;
      finally
        DetenerEspera;
      end;
    end;
end;

procedure TfrmConsultarRepositorio.DoValidarYCargarImagenesSeleccionadas;
var
  sSql: String;
  APointer: TBookMark;
  bCargarImagenes: Boolean;
  iTotales, iCantProcesados: Integer;
begin
  bCargarImagenes  := pbCargarImagenes;
  pbCargarImagenes := False;
  try
    Do_LimpiarTablaTemporal('TIS_IMAGENSELECCIONADA', 'IS_USUARIO', Sesion.Userid);

    with sdqConsulta do
      begin
        DisableControls;
        APointer := GetBookmark;
        try
          iCantProcesados := 0;
          iTotales        := tslCheckeados.Count;

          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                begin
                  sSql := 'INSERT INTO TIS_IMAGENSELECCIONADA(IS_USUARIO, IS_IDREPOSITORIOARCHIVO) ' +
                               'VALUES(:UserId, :IdRepArchivo)';
                  EjecutarSqlEx(sSql, [Sesion.Userid, sdqConsulta.FieldByName('RAID').AsInteger]);

                  Inc(iCantProcesados);
                  if iCantProcesados = iTotales then
                    Break;
                end;

              Next;
            end;
        finally
          GotoBookmark(APointer);
          EnableControls;
        end;
      end;
  finally
    pbCargarImagenes := bCargarImagenes;
  end;
end;

procedure TfrmConsultarRepositorio.fraVistaTIFFImgtbMaxMinimizarClick(Sender: TObject);
begin
  inherited;
  fraVistaTIFFImg.tbMaxMinimizarClick(Sender);
end;

procedure TfrmConsultarRepositorio.tbMaximizarImagenClick(Sender: TObject);
begin
  if tbVerImagen.Down then
    fraVistaTIFFImgtbMaxMinimizarClick(nil);
end;

procedure TfrmConsultarRepositorio.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
    begin
      if pbIsPrinting then
        begin
          Grid.ColumnByField['INCONSISTENCIA_CODDOC'].Font.Charset := Grid.ColumnByField['LOTE'].Font.Charset;
          Grid.ColumnByField['INCONSISTENCIA_CODDOC'].Font.Name    := Grid.ColumnByField['LOTE'].Font.Name;
          Grid.ColumnByField['INCONSISTENCIA_CODDOC'].Font.Size    := Grid.ColumnByField['LOTE'].Font.Size;
          FieldByName('INCONSISTENCIA_CODDOC').OnGetText := nil;
        end
      else
        begin
          Grid.ColumnByField['INCONSISTENCIA_CODDOC'].Font.Charset := SYMBOL_CHARSET;
          Grid.ColumnByField['INCONSISTENCIA_CODDOC'].Font.Name    := FONTNAMETILDE;
          Grid.ColumnByField['INCONSISTENCIA_CODDOC'].Font.Size    := FONTSIZETILDE;
          FieldByName('INCONSISTENCIA_CODDOC').OnGetText := sdqConsultaINCONSISTENCIA_CODDOCGetText;
        end;
    end;
end;

procedure TfrmConsultarRepositorio.sdqConsultaINCONSISTENCIA_CODDOCGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = '1' then
    Text := vSi
  else
    Text := '';
end;

class procedure TfrmConsultarRepositorio.DoMostrarSegErroresUsuarios(ANroMedio, ALote: TTableId; AClave, ACodDocumento: String);
var
  TipoArchivo: TTableId;
begin
  Abrir(TfrmConsultarRepositorio, frmConsultarRepositorio, tmvMDIChild, nil);

  with frmConsultarRepositorio do
    begin
      if ANroMedio > 0 then
        begin
          edMedioDesde.Value := ANroMedio;
          edMedioHasta.Value := ANroMedio;
        end;

      if ALote > 0 then
        begin
          edLote.Value := ALote;

          TipoArchivo := Get_IdTipoArchivoLote(ALote);
          with fraFiltroArchivoReposit do
            begin
              Visible := False;
              try
                Tipo := TipoArchivo;
              finally
                Visible := True;
              end;

              if not IsEmptyString(AClave) then
                DoCargarClaveArchivo(TipoArchivo, AClave);
            end;

          fraTipoArchivoRepositPropiedadesChange(nil);

          if not IsEmptyString(ACodDocumento) then
            fraTipoDocumento.Codigo := ACodDocumento;
        end
      else
        if not IsEmptyString(ACodDocumento) then
          edCodigoDocumento.Text := ACodDocumento;

      RefreshData;
    end;
end;

procedure TfrmConsultarRepositorio.tbEstadisticasImagenesClick(Sender: TObject);
begin
  if IsPerfilAdministrador_GyD() then
    Abrir(TfrmEstadisticasImagenes, frmEstadisticasImagenes, tmvModal, nil);
end;

procedure TfrmConsultarRepositorio.tbPropiedadesClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(tslCheckeados.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                Verificar(FieldByName('CODDOCS_CLAVELOTE').IsNull, nil, 'Alguno de los registros seleccionados no tiene cód. de documento del sistema.');
                Verificar(InStr(FieldByName('CODDOCS_CLAVELOTE').AsString, '/') > 0, nil, 'Alguno de los registros seleccionados no tiene un único cód. de documento del sistema.');
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  sdqConsulta.DisableControls;
  try
    if MsgBox('¿Confirma el traspaso de los códigos de documento del sistema seleccionados a los códigos de documento de las imágenes del repositorio?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
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
                      sSql := 'UPDATE RRA_REPOSITORIOARCHIVO ' +
                                 'SET RA_IDTIPODOCUMENTO = :IdDocSistema, ' +
                                     'RA_CODDOCUMENTO = NULL ' +
                                    // 'RA_SECUENCIATRAZABIL = NULL ' +   // Según JNitti, no hay que limpiar el nro. de secuencia
                               'WHERE RA_ID = :Id';
                      EjecutarSqlSTEx(sSql, [GetIdDocumentoArchivo(FieldByName('TIPOARCHIVO').AsInteger, FieldByName('CODDOCS_CLAVELOTE').AsString), FieldByName('RAID').AsInteger]);
                    end;

                  Next;
                end;
            end;

          CommitTrans;
          MsgBox('Códigos de documento traspasados correctamente.', MB_ICONINFORMATION);

          mnuDesmarcarTodos.Click;
          Grid.UnselectAll;
          sdqConsulta.Refresh;
        except
          on E:Exception do
            begin
              Rollback;
              Raise Exception.Create(E.Message + CRLF + 'Error al traspasar los códigos de documento.');
            end;
        end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmConsultarRepositorio.sdqConsultaBeforeScroll(DataSet: TDataSet);
begin
  DoSMsdqConsultaBeforeScroll(tslCheckeados, Grid, SMCampoFila);
end;

function TfrmConsultarRepositorio.DoValidarDatosEliminarSeleccionados: Boolean;
var
  APointer: TBookMark;
  bValidarAdicional, bCargarImagenes: Boolean;
  iTotales, iCantProcesados: Integer;
  sUsuAltaLote: String;
begin
  bValidarAdicional := not (GetPerfilAdministrador() or GetPerfilGuardaYDigitalizacion());

  bCargarImagenes  := pbCargarImagenes;
  pbCargarImagenes := False;
  iCantProcesados  := 0;
  iTotales         := tslCheckeados.Count;

  APointer := sdqConsulta.GetBookmark;
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                if bValidarAdicional and not FieldByName('LOTE').IsNull then
                  begin
                    sUsuAltaLote := Get_UsuarioAltaLote(FieldByName('LOTE').AsInteger);
                    Verificar(not IsEmptyString(sUsuAltaLote) and not Is_UsuariosMismoSector(Sesion.UserID, sUsuAltaLote), nil, 'Alguno de los registros seleccionados no puede ser eliminado por su sector, porque el lote corresponde a otro sector.');
                  end;

                Inc(iCantProcesados);
                if iCantProcesados = iTotales then
                  Break;
              end;

            Next;
          end;
      end;
  finally
    sdqConsulta.GotoBookmark(APointer);
    sdqConsulta.EnableControls;
    pbCargarImagenes := bCargarImagenes;
  end;

  Result := True;
end;

end.

