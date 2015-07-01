unit unCargaManualMovimientos;

interface
              
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unFraCodigoDescripcion, unFraUsuario, Mask, ToolEdit,
  DateComboBox, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, CurrEdit,
  PeriodoPicker, unFraStaticCodigoDescripcion, Buttons, Menus, CardinalEdit,
  DBCtrls, unReversionMovimientos, RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmCargaManualMovimientos = class(TfrmCustomGridABM)
    gmEmpresa: TGroupBox;
    Label3: TLabel;
    fraMM_CONTRATO: TfraEmpresa;
    gbMM_USUAPROBADO: TGroupBox;
    rbSinAprobar: TRadioButton;
    rbAprobados: TRadioButton;
    rbAmbos: TRadioButton;
    gbFechaAlta: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    edMM_FECHAALTADesde: TDateComboBox;
    edMM_FECHAALTAHasta: TDateComboBox;
    gbUsuarioAlta: TGroupBox;
    fraMM_USUALTA: TfraUsuarios;
    gbFechaAprobado: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edMM_FECHAAPROBADODesde: TDateComboBox;
    edMM_FECHAAPROBADOHasta: TDateComboBox;
    gbCodigoMovimiento: TGroupBox;
    edMM_IDCODIGOMOVIMIENTO: TDBCheckCombo;
    dsMovimientos: TDataSource;
    sdqMovimientos: TSDQuery;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbAprobar: TToolButton;
    ToolButton2: TToolButton;
    frafpMM_CONTRATO: TfraEmpresa;
    Label4: TLabel;
    edfpMM_IMPORTE: TCurrencyEdit;
    Label10: TLabel;
    lbPeriodo: TLabel;
    ppfpMM_PERIODO: TPeriodoPicker;
    edfpMM_OBSERVACIONES: TMemo;
    Label5: TLabel;
    frafpMM_IDCODIGOMOVIMIENTO: TfraCodigoDescripcion;
    Label7: TLabel;
    btnGuardar: TBitBtn;
    btnSalir: TBitBtn;
    btnLimpiar: TBitBtn;
    pmnuMarcar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    Panel2: TPanel;
    edCantContratos: TCardinalEdit;
    Panel1: TPanel;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    edTotalImpContratos: TCurrencyEdit;
    tbVistaPrevia: TToolButton;
    tbImpoExpo: TToolButton;
    mnuImpoExpo: TPopupMenu;
    mnuAyuda: TMenuItem;
    chkEmpresa: TCheckBox;
    chkPeriodo: TCheckBox;
    chkCodigoMov: TCheckBox;
    Panel3: TPanel;
    edEstado: TDBMemo;
    tbEstado: TToolButton;
    edfmMM_FECHARECA: TDateComboBox;
    tbRevertir: TToolButton;
    lbFechaRecaudacion: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbVistaPreviaClick(Sender: TObject);
    procedure tbImpoExpoClick(Sender: TObject);
    procedure mnuAyudaClick(Sender: TObject);
    procedure tbEstadoClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure frafpMM_CONTRATOExit(Sender: TObject);
    function Do_ProcesarMovConPeriodosConciliados: Boolean;
    procedure tbRevertirClick(Sender: TObject);
    procedure ppfpMM_PERIODOExit(Sender: TObject);
  protected
    procedure EnableButtons(AEnabled : Boolean = True); override;
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  private
    sPantalla: string;
    pbHuboAltasModif : Boolean;
    FComportamiento : TComportamientoForm;
    TotalConsulta : array of extended;
    TotalRegSeleccionados : array of extended;
    procedure CalcTotales;
    procedure CalcularFilasSel;
    procedure InicializarContadores(ActualizarTotales: Boolean);
    function IsDatosValidosBaja: Boolean;
    function IsDatosValidosAprobacion: Boolean;
    procedure Do_Limpiar;
    function Do_CrearTablaTempRegSeleccionados: Boolean;
    function Do_ActualizarAprobacionRegSeleccionados: Boolean;
    function Do_Redevengar(Redevengar: Boolean): Boolean;
    function Do_InsertarMovimientos: Boolean;
    function Get_CantRegistrosAprobar: Integer;
    function ValidarCoberturaPeriodo(Contrato: Integer; Cuit, Periodo: String): Boolean;
    procedure SetComportamiento(const Value: TComportamientoForm);
    procedure ReAjustarEstado;
    function Do_ActualizarEmplYMasa_NoDevengar: Boolean;
    function TieneDDJJaAprobar(aContrato: integer; aPeriodo: String): boolean;
  public
    property Comportamiento: TComportamientoForm read FComportamiento write SetComportamiento;
  end;

var
  frmCargaManualMovimientos: TfrmCargaManualMovimientos;

implementation

uses unPrincipal, AnsiSql, unDmPrincipal, CustomDlgs, SqlFuncs, General, DbFuncs,
     StrFuncs, unArt, unCobranzas, Periodo, unSesion, unMovimientosVistaPrevia,
     unImpoExpoWizard, unAyuda, DateTimeFuncs;

const
  CODIGO_581 = '581';
  CAMPOS_SUMA : array [0..0] of string = ('IMPORTE');
  MAXCOLS = 0;
  ALTURA_RENGLON = 16;
  SQL_ESTADO = 'REPLACE( AFILIACION.MSG_COBERTURA(CO_CONTRATO, SYSDATE), CHR(13), CHR(13) || CHR(10) ) || ' +
               'DECODE(NVL(AFILIACION.GET_CONTRATOVIGENTE(EM_CUIT, TO_CHAR(ADD_MONTHS(CO_VIGENCIADESDE, -2), ''YYYYMM'')), 0), ' +
                      'CO_CONTRATO, '''', ' +
                      '0, '''', ' +
                      'DECODE(AFILIACION.MSG_COBERTURA(CO_CONTRATO, SYSDATE), '''', '''', CHR(13) || CHR(10)) ' +
                             '|| ''Contrato anterior: '' || ' +
                             'AFILIACION.GET_CONTRATOVIGENTE(EM_CUIT, TO_CHAR(ADD_MONTHS(CO_VIGENCIADESDE, -2), ''YYYYMM''))) ESTADO ';


{$R *.DFM}

{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraMM_CONTRATO.Clear;
  fraMM_USUALTA.Clear;
  edMM_FECHAALTADesde.Clear;
  edMM_FECHAALTAHasta.Clear;
  edMM_FECHAAPROBADODesde.Clear;
  edMM_FECHAAPROBADOHasta.Clear;
  edMM_IDCODIGOMOVIMIENTO.Clear;
  rbSinAprobar.Checked := True;

  InicializarContadores( True );
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

  with fraMM_CONTRATO do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  OpenQuery( sdqMovimientos );
  SetLength( TotalConsulta, MAXCOLS+1 );
  SetLength( TotalRegSeleccionados, MAXCOLS+1 );
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := '$ ' + ToStr( TotalConsulta[iPos] );
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if Assigned(sdqConsulta.FindField('ESTADO')) then
    edEstado.DataField := 'ESTADO';

  if sdqConsulta.FieldByName( 'IMPORTE' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqConsulta.FieldByName( 'IMPORTE' ) ).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSql := 'SELECT MM_ID ID, MM_CONTRATOPRINCIPAL CONTRATO, MM_PERIODO PERIODO, MM_IDCODIGOMOVIMIENTO IDCODIGOMOVIMIENTO, ' +
                 'MM_IMPORTE IMPORTE, MM_FECHAAPROBADO FECHAAPROBADO, MM_USUAPROBADO USUAPROBADO, ' +
                 'MM_USUALTA USUALTA, TRUNC(MM_FECHAALTA) FECHAALTA, MM_OBSERVACIONES OBSERVACIONES, ' +
                 'MM_FECHARECA FECHARECA, EM_CUIT CUIT, EM_NOMBRE RAZONSOCIAL, CM_CODIGO CODIGOMOVIM, ' +
                 'CM_DESCRIPCION DESCRMOVIM, MM_CODTIPOREGIMEN CODREG, MM_CONTRATO CONTRATOEXT, ' + SQL_ESTADO +
            'FROM ZCM_CODIGOMOVIMIENTO, AEM_EMPRESA, ACO_CONTRATO_EXT, IMM_MOVIMIENTOMANUAL ' +
           'WHERE MM_CONTRATO = CO_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND MM_IDCODIGOMOVIMIENTO = CM_ID ' +
             'AND CM_PERFIL IN ' + Get_TipoCodigoMovim(FComportamiento);

  sSqlWhere := SqlBetweenDateTime( ' AND MM_FECHAALTA', edMM_FECHAALTADesde.Date, edMM_FECHAALTAHasta.Date ) +
               SqlBetween( ' AND MM_FECHAAPROBADO', edMM_FECHAAPROBADODesde.Date, edMM_FECHAAPROBADOHasta.Date );

  if fraMM_CONTRATO.IsSelected then
    sSqlWhere := sSqlWhere + ' AND MM_CONTRATO = ' + SqlValue( fraMM_CONTRATO.ContratoExt );

  if fraMM_USUALTA.IsSelected then
    sSqlWhere := sSqlWhere + ' AND MM_USUALTA = ' + SqlValue( fraMM_USUALTA.Value );

  if rbSinAprobar.Checked then
    sSqlWhere := sSqlWhere + ' AND MM_FECHAAPROBADO IS NULL'
  else if rbAprobados.Checked then
    sSqlWhere := sSqlWhere + ' AND MM_FECHAAPROBADO IS NOT NULL';

  if edMM_IDCODIGOMOVIMIENTO.Text <> '' then
      sSqlWhere := sSqlWhere + ' AND MM_IDCODIGOMOVIMIENTO ' + edMM_IDCODIGOMOVIMIENTO.InSql;

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;

  inherited;
  InicializarContadores( True );
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbAprobar.Enabled   := AEnabled and Seguridad.Activar( tbAprobar );
  tbSumatoria.Enabled := AEnabled;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.IsDatosValidosBaja: Boolean;
var
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un movimiento.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      Verificar(not sdqConsulta.FieldByName( 'USUAPROBADO' ).IsNull, nil, 'Uno de los movimientos ya ha sido aprobado.');
    end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  i: Integer;
  IdMovimiento: TTableId;
begin
  if IsDatosValidosBaja() then
    if MsgBox( '¿Desea dar de baja los movimientos seleccionados?', MB_ICONQUESTION + MB_YESNO, sPantalla ) = IDYES then
      begin
        BeginTrans;
        try
          for i := 0 to Grid.SelectedRows.Count - 1 do
            begin
              sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

              IdMovimiento := sdqConsulta.FieldByName( 'ID' ).AsInteger;

              sSql := 'DELETE FROM IMM_MOVIMIENTOMANUAL ' +
                            'WHERE MM_ID = ' + SqlValue( IdMovimiento );
              EjecutarSqlST( sSql );
            end;

          CommitTrans;
          MsgBox( 'Los movimientos se eliminaron correctamente.', MB_ICONINFORMATION, sPantalla );

          tbRefrescarClick( nil );
        except
          on E: Exception do
            begin
              RollBack;

              Raise Exception.Create ( E.Message + CRLF + 'Error al eliminar los movimientos.' );
            end;
        end;
      end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.Do_Limpiar;
begin
  if not chkEmpresa.Checked then
  begin
    if frafpMM_CONTRATO.mskCUIT.CanFocus then
      frafpMM_CONTRATO.mskCUIT.SetFocus;
  end
  else if not chkPeriodo.Checked then
  begin
    if ppfpMM_PERIODO.CanFocus then
      ppfpMM_PERIODO.SetFocus;
  end
  else if not chkCodigoMov.Checked then
  begin
    if frafpMM_IDCODIGOMOVIMIENTO.CanFocus then
      frafpMM_IDCODIGOMOVIMIENTO.SetFocus;
  end
  else if edfpMM_IMPORTE.CanFocus then
    edfpMM_IMPORTE.SetFocus;

  if not chkEmpresa.Checked then
    frafpMM_CONTRATO.Clear;

  if not chkPeriodo.Checked then
    ppfpMM_PERIODO.Clear;

  if not chkCodigoMov.Checked then
    frafpMM_IDCODIGOMOVIMIENTO.Clear;

  edfpMM_IMPORTE.Clear;
  edfmMM_FECHARECA.Clear;
  edfpMM_OBSERVACIONES.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.ClearControls;
begin
  Do_Limpiar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.LoadControls;
begin
  if sdqConsulta.FieldByName( 'USUAPROBADO' ).IsNull then
    begin
      frafpMM_CONTRATO.ContratoExt     := sdqConsulta.FieldByName('CONTRATOEXT').AsInteger;
      ppfpMM_PERIODO.Periodo.Valor     := sdqConsulta.FieldByName('PERIODO').AsString;
      frafpMM_IDCODIGOMOVIMIENTO.Value := sdqConsulta.FieldByName('IDCODIGOMOVIMIENTO').AsInteger;
      edfpMM_IMPORTE.Value             := sdqConsulta.FieldByName('IMPORTE').AsFloat;
      edfmMM_FECHARECA.Date            := sdqConsulta.FieldByName('FECHARECA').AsDateTime;
      edfpMM_OBSERVACIONES.Lines.Text  := sdqConsulta.FieldByName('OBSERVACIONES').AsString;
    end
  else
    begin
      MsgBox( 'El movimiento ya ha sido aprobado.', MB_ICONERROR, sPantalla );
      abort;
    end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'IMM_MOVIMIENTOMANUAL';

  try
    Sql.Fields.Add( 'MM_CONTRATO',           frafpMM_CONTRATO.ContratoExt );
    Sql.Fields.Add( 'MM_PERIODO',            ppfpMM_PERIODO.Periodo.Valor );
    Sql.Fields.Add( 'MM_IDCODIGOMOVIMIENTO', frafpMM_IDCODIGOMOVIMIENTO.Value );
    Sql.Fields.Add( 'MM_IMPORTE',            edfpMM_IMPORTE.Value );
    Sql.Fields.Add( 'MM_FECHARECA',          edfmMM_FECHARECA.SqlText, False );
    Sql.Fields.Add( 'MM_OBSERVACIONES',      edfpMM_OBSERVACIONES.Lines.Text );

    if ModoABM = maAlta then
      begin
        Sql.PrimaryKey.Add( 'MM_ID',         'SEQ_IMM_ID.NEXTVAL', False );

        Sql.Fields.Add( 'MM_FECHAALTA',      exDateTime );
        Sql.Fields.Add( 'MM_USUALTA',        Sesion.UserID );

        Sql.SqlType := stInsert;
      end
    else if ModoABM = maModificacion then
      begin
        Sql.PrimaryKey.Add( 'MM_ID',         sdqConsulta.FieldByName( 'ID' ).AsInteger, False );

        Sql.Fields.Add( 'MM_FECHAMODIF',     exDateTime );
        Sql.Fields.Add( 'MM_USUMODIF',       Sesion.UserID );

        Sql.SqlType := stUpdate;
      end;

    Result := inherited DoABM;

    MsgBox( 'El movimiento se ha guardado correctamente.', MB_ICONINFORMATION, sPantalla );
    pbHuboAltasModif := True;
  except
    on E:Exception do
      Raise Exception.Create( E.Message + CRLF + 'Error al grabar el movimiento.' );
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Validar: Boolean;
var
  sDescrPerConciliado: String;
  sTipoValor : String;
begin
  Result := False;

  Verificar( frafpMM_CONTRATO.IsEmpty, frafpMM_CONTRATO.mskCUIT, 'Debe ingresar el contrato.' );
  Verificar( ppfpMM_PERIODO.Periodo.Valor = '', ppfpMM_PERIODO, 'Debe ingresar el periodo.' );
  Verificar( (Comportamiento = cfCobranzas) and (ppfpMM_PERIODO.Periodo.Valor >= AddPeriodo(GetPeriodo(DBDate(), fpAnioMes), 6)), ppfpMM_PERIODO, 'No se pueden hacer imputaciones para este periodo.' );

  {Tener en cuenta que esta misma validacion está en el IMPOEXPO "CMMOV"}

  if not ValidarCoberturaPeriodo(frafpMM_CONTRATO.ContratoExt, frafpMM_CONTRATO.mskCUIT.Text, ppfpMM_PERIODO.Periodo.Valor) then
    exit;

  Verificar( frafpMM_IDCODIGOMOVIMIENTO.IsEmpty, frafpMM_IDCODIGOMOVIMIENTO.edCodigo, 'Debe ingresar el código de movimiento.' );
  Verificar( edfpMM_IMPORTE.Value = 0, edfpMM_IMPORTE, 'El importe debe ser distinto a 0.' );
  Verificar( edfmMM_FECHARECA.Date > DBDate, edfmMM_FECHARECA, 'La fecha de recaudación debe ser menor o igual a hoy.' );

  sTipoValor := ValorSql('SELECT CM_TIPOVALOR '+
                         '  FROM COB.ZCM_CODIGOMOVIMIENTO '+
                         ' WHERE CM_CODIGO = '+SqlValue(frafpMM_IDCODIGOMOVIMIENTO.Codigo));
  if sTipoValor <> '' then
  begin
    if sTipoValor = 'P' then
    begin
      Verificar(edfpMM_IMPORTE.Value < 0,edfpMM_IMPORTE, 'Debe ingresar un valor positivo.');
    end;
    if sTipoValor = 'N' then
    begin
      Verificar(edfpMM_IMPORTE.Value > 0, edfpMM_IMPORTE, 'Debe ingresar un valor negativo.');
    end;
  end;


  if (FComportamiento = cfCobranzas) and Is_PeriodoPrescripto(frafpMM_CONTRATO.ContratoExt, ppfpMM_PERIODO.Periodo.Valor) then
    begin
      if MsgBox( 'El periodo se encuentra prescripto. ¿Desea continuar?', MB_YESNO+MB_ICONINFORMATION, sPantalla ) = ID_NO then
        exit;
    end;

  sDescrPerConciliado := Get_DescrPerConciliado( frafpMM_CONTRATO.ContratoExt, ppfpMM_PERIODO.Periodo.Valor );
  if sDescrPerConciliado <> '' then
    if MsgBox( 'El periodo se encuentra conciliado (' + sDescrPerConciliado + '). ¿Desea desconciliarlo y continuar?', MB_YESNO+MB_ICONINFORMATION, sPantalla ) = ID_YES then
      Do_DesConciliar( frafpMM_CONTRATO.ContratoExt, ppfpMM_PERIODO.Periodo.Valor, True )
    else
      exit;

  Verificar((FComportamiento = cfEmision) and (trim(edfpMM_OBSERVACIONES.Text) = ''), edfpMM_OBSERVACIONES, 'Debe ingresar una Observación');

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.btnLimpiarClick(Sender: TObject);
begin
  Do_Limpiar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.btnGuardarClick(Sender: TObject);
begin
  if Validar and DoABM then
    begin
      if ModoABM = maAlta then
        Do_Limpiar
      else
        btnSalirClick( nil );
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.fpAbmEnter(Sender: TObject);
var
  bEsAlta: Boolean;
begin
  bEsAlta := (ModoABM = maAlta);

  btnLimpiar.Enabled := bEsAlta;

  if bEsAlta and not fraMM_CONTRATO.IsEmpty then
    frafpMM_CONTRATO.ContratoExt := fraMM_CONTRATO.ContratoExt;

  if Comportamiento = cfEmision then
    begin
      lbFechaRecaudacion.Visible := False;
      edfmMM_FECHARECA.Visible   := False;
    end;

  pbHuboAltasModif := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.btnSalirClick(Sender: TObject);
begin
  if pbHuboAltasModif then
    begin
      tbRefrescarClick( nil );
      if sdqConsulta.Active then
        CheckButtons;
    end;

  fpAbm.ModalResult := mrCancel;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.IsDatosValidosAprobacion: Boolean;
var
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un movimiento.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      Verificar(not sdqConsulta.FieldByName( 'USUAPROBADO' ).IsNull, nil, 'Uno de los movimientos ya ha sido aprobado.');

      Verificar((FComportamiento = cfEmision) and
                (TieneDDJJaAprobar(sdqConsulta.FieldByName('CONTRATOEXT').AsInteger, sdqConsulta.FieldByName('PERIODO').AsString )) and
                (sdqConsulta.FieldByName('CODIGOMOVIM').AsString = CODIGO_581),
                nil, 'Existen DDJJ pendientes de aprobación.');

      if not Seguridad.Claves.IsActive('SuperAprobador') then
        Verificar(sdqConsulta.FieldByName( 'USUALTA' ).AsString = Sesion.UserID, nil,
                  'Uno de los movimientos fue generado por el usuario ' + Sesion.Usuario + '.' + #13 +
                  'No tiene permiso para aprobar un movimiento generado por Ud. mismo.');
    end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Do_CrearTablaTempRegSeleccionados: Boolean;
var
  i: Integer;
  sSql: String;
begin
  try
    sSql := 'DELETE FROM TMM_MOVIMMANUALSELECCIONADO ' +
                  'WHERE MM_USUARIO=' + SqlValue( Sesion.UserID );
    EjecutarSql( sSql );

    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        sSql := 'INSERT INTO TMM_MOVIMMANUALSELECCIONADO(MM_USUARIO, MM_IDMOVIMIENTOMANUAL) ' +
                     'VALUES(' + SqlValue( Sesion.UserID ) + ', ' +
                                 SqlValue( sdqConsulta.FieldByName( 'ID' ).AsInteger ) + ')';
        EjecutarSql( sSql );
      end;

    Result := True;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al cargar en tabla temporal los movimientos seleccionados.' );
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Do_ProcesarMovConPeriodosConciliados: Boolean;
var
  sSql, sPeriodo, sDescrPerConciliado, sRazonSocial, sMensaje: String;
  iContrato: Integer;
begin
  try
    sSql := 'SELECT IMM.MM_CONTRATO CONTRATO, IMM.MM_PERIODO PERIODO, ' +
                   'EM_NOMBRE RAZONSOCIAL, MM_CONTRATOPRINCIPAL CONTRATOPRINC ' +
              'FROM AEM_EMPRESA, ACO_CONTRATO_EXT, ZRC_RESUMENCOBRANZA_EXT, ' +
                   'IMM_MOVIMIENTOMANUAL IMM, TMM_MOVIMMANUALSELECCIONADO TMM ' +
             'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
               'AND TMM.MM_IDMOVIMIENTOMANUAL = IMM.MM_ID ' +
               'AND IMM.MM_CONTRATO = RC_CONTRATO(+) ' +
               'AND IMM.MM_PERIODO = RC_PERIODO(+) ' +
               'AND RC_MARCACONCILIADO IS NOT NULL ' +
               'AND IMM.MM_CONTRATO = CO_CONTRATO ' +
               'AND CO_IDEMPRESA = EM_ID ' +
          'GROUP BY IMM.MM_CONTRATO, IMM.MM_PERIODO, EM_NOMBRE';

    with GetQuery( sSql ) do
      begin
        try
          while not EOF do
            begin
              iContrato           := FieldByName( 'CONTRATO' ).AsInteger;
              sPeriodo            := FieldByName( 'PERIODO' ).AsString;
              sRazonSocial        := FieldByName( 'RAZONSOCIAL' ).AsString;
              sDescrPerConciliado := Get_DescrPerConciliado( iContrato, sPeriodo );

              sMensaje := 'Para el contrato ' + FieldByName( 'CONTRATOPRINC' ).AsString + ' (' + sRazonSocial + ')' +
                          ', el periodo ' + FormatPeriodo( sPeriodo ) + ' ya se encuentra conciliado (' + sDescrPerConciliado + ').' + CRLF +
                          '¿Confirma el alta de TODOS los movimientos, para dicho contrato y periodo? ' +
                          '(en caso contrario, ninguno de tales movimientos será procesado)';

              if MsgBox( sMensaje, MB_ICONQUESTION+MB_YESNO, sPantalla ) = ID_NO then
                begin
                  sSql := 'UPDATE TMM_MOVIMMANUALSELECCIONADO TMM ' +
                             'SET MM_CONFIRMADO = ''N'' ' +
                           'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
                             'AND EXISTS (SELECT 1 ' +
                                           'FROM IMM_MOVIMIENTOMANUAL IMM ' +
                                          'WHERE TMM.MM_IDMOVIMIENTOMANUAL = IMM.MM_ID ' +
                                            'AND IMM.MM_CONTRATO = ' + SqlValue( iContrato ) + ' ' +
                                            'AND IMM.MM_PERIODO = ' + SqlValue( sPeriodo ) + ')';
                  EjecutarSql( sSql );
                end;

              Next;
            end;
        finally
          free;
        end;
      end;

    Result := True;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al procesar los movimientos con periodos conciliados.' );
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Do_ActualizarAprobacionRegSeleccionados: Boolean;
var
  sSql: String;
begin
  try
    sSql := 'UPDATE IMM_MOVIMIENTOMANUAL IMM ' +
               'SET IMM.MM_FECHAAPROBADO = ACTUALDATE, ' +
                   'IMM.MM_USUAPROBADO = ' + SqlValue( Sesion.UserID ) + ' ' +
             'WHERE IMM.MM_ID IN (SELECT TMM.MM_IDMOVIMIENTOMANUAL ' +
                                   'FROM TMM_MOVIMMANUALSELECCIONADO TMM ' +
                                  'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
                                    'AND TMM.MM_CONFIRMADO IS NULL)';
    EjecutarSqlST( sSql );

    Result := True;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al marcar la aprobación de los movimientos.' );
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Get_CantRegistrosAprobar: Integer;
var
  sSql: String;
begin
  sSql := 'SELECT COUNT(*) ' +
            'FROM TMM_MOVIMMANUALSELECCIONADO ' +
           'WHERE MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
             'AND MM_CONFIRMADO IS NULL';

  Result := ValorSqlInteger( sSql );
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Do_Redevengar(Redevengar: Boolean): Boolean;
var
  sSql, sPeriodo: String;
  iContrato: Integer;
begin
  try
    sSql := 'SELECT IMM.MM_CONTRATO CONTRATO, IMM.MM_PERIODO PERIODO ' +
               'FROM IMM_MOVIMIENTOMANUAL IMM, TMM_MOVIMMANUALSELECCIONADO TMM ' +
             'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
               'AND TMM.MM_CONFIRMADO IS NULL ' +
               'AND TMM.MM_IDMOVIMIENTOMANUAL = IMM.MM_ID ' +
          'GROUP BY IMM.MM_CONTRATO, IMM.MM_PERIODO';

    with GetQuery( sSql ) do
      begin
        while not EOF do
          begin
            iContrato := FieldByName( 'CONTRATO' ).AsInteger;
            sPeriodo  := FieldByName( 'PERIODO' ).AsString;

            if Redevengar then
              Do_RedevengarConciliar( iContrato, sPeriodo, Sesion.UserID, True, False )
            else
              Do_Amortizar( iContrato, sPeriodo, Sesion.UserID, False );

            Next;
          end;
      end;

    Result := True;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al redevengar/amortizar los períodos involucrados.' );
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Do_InsertarMovimientos: Boolean;
var
  sCodigoMov, sSql: String;
  FechaDistribucion: TDateTime;
begin
  try
    FechaDistribucion := Get_FechaDistribucion;

    sSql := 'INSERT INTO ZMO_MOVIMIENTO(MO_ID, MO_CONTRATO, MO_PERIODO, ' +
                        'MO_IDCODIGOMOVIMIENTO, MO_IMPORTE, MO_FECHARECA, MO_FECHADIST, ' +
                        'MO_CODIGORECEPCION, MO_SITUAC, MO_FECHAALTA, ' +
                        'MO_USUALTA, MO_FECHAAPROBADO, MO_USUAPROBADO) ' +
                 'SELECT SEQ_ZMO_ID.NEXTVAL, IMM.MM_CONTRATO CONTRATO, IMM.MM_PERIODO PERIODO, ' +
                        'IMM.MM_IDCODIGOMOVIMIENTO, IMM.MM_IMPORTE, IMM.MM_FECHARECA, ' +
                         SqlValue( FechaDistribucion ) + ', ' +
                         SqlValue( ZMO_RECEPCION_MANUAL ) + ', ''1'', SYSDATE, ' +
                         'MM_USUALTA, ACTUALDATE, ' +
                         SqlValue( Sesion.UserID ) + ' ' +
                   'FROM ZCM_CODIGOMOVIMIENTO, IMM_MOVIMIENTOMANUAL IMM, TMM_MOVIMMANUALSELECCIONADO TMM ' +
                  'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
                    'AND TMM.MM_CONFIRMADO IS NULL ' +
                    'AND TMM.MM_IDMOVIMIENTOMANUAL = IMM.MM_ID ' +
                    'AND IMM.MM_IDCODIGOMOVIMIENTO = CM_ID ' +
                    'AND CM_CODIGO NOT IN (''111'', ''130'', ''460'', ''461'')';
    EjecutarSqlST( sSql );

    // generación automática de intereses y gastos
    sSql := 'SELECT IMM.MM_CONTRATO CONTRATO, IMM.MM_PERIODO PERIODO, ' +
                   'CM_CODIGO CODIGOMOV, IMM.MM_IMPORTE IMPORTE, ' +
                   'IMM.MM_FECHARECA FECHARECA, MM_USUALTA USUALTA ' +
              'FROM ZCM_CODIGOMOVIMIENTO, IMM_MOVIMIENTOMANUAL IMM, TMM_MOVIMMANUALSELECCIONADO TMM ' +
             'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
               'AND TMM.MM_CONFIRMADO IS NULL ' +
               'AND TMM.MM_IDMOVIMIENTOMANUAL = IMM.MM_ID ' +
               'AND IMM.MM_IDCODIGOMOVIMIENTO = CM_ID ' +
               'AND CM_CODIGO IN (''111'', ''130'', ''460'', ''461'')';
    with GetQuery( sSql ) do
      try
        while not EOF do
          begin
            sCodigoMov := FieldByName('CODIGOMOV').AsString;

            if sCodigoMov = '111' then       // Cobro Cuota Intereses por Mora
              begin
                sSql := 'COBRANZA.DOASIGNARMOVIMINTERESCONTRPER(' +
                                 ':contrato, :periodo, :imptotmovimientos, ' +
                                 ':usuario, :idremesa, :fedis, ' +
                                 ':fereca, :codigomovctb, :codigorecepcion, ' +
                                 ':fecharecepcion, :usuarioaprobacion, :idplanvalor, ' +
                                 ':idvalor, :nroboletadep);';
                EjecutarStoreSTEx(sSql, [FieldByName('CONTRATO').AsInteger, FieldByName('PERIODO').AsString, FieldByName('IMPORTE').AsFloat,
                                         FieldByName('USUALTA').AsString, '', TDateTimeEx.Create(FechaDistribucion),
                                         TDateTimeEx.Create(FieldByName('FECHARECA').AsDateTime), '', ZMO_RECEPCION_AUTOMATICA,
                                         '', Sesion.UserID, '',
                                         '', '']);
              end
            else if sCodigoMov = '130' then  // Cobro Cuota Intereses por Financiación
              begin
                sSql := 'COBRANZA.DOASIGNARMOVIMINTFINANCONTRPER('+
                                 ':contrato, :periodo, :imptotmovimientos, ' +
                                 ':usuario, :idremesa, :fedis, ' +
                                 ':fereca, :codigomovctb, :codigorecepcion, ' +
                                 ':fecharecepcion, :usuarioaprobacion, :idplanvalor, ' +
                                 ':idvalor, :nroboletadep);';
                EjecutarStoreSTEx(sSql, [FieldByName('CONTRATO').AsInteger, FieldByName('PERIODO').AsString, FieldByName('IMPORTE').AsFloat,
                                         FieldByName('USUALTA').AsString, '', TDateTimeEx.Create(FechaDistribucion),
                                         TDateTimeEx.Create(FieldByName('FECHARECA').AsDateTime), '', ZMO_RECEPCION_AUTOMATICA,
                                         '', Sesion.UserID, '',
                                         '', '']);
              end
            else if sCodigoMov = '460' then  // Cobro de Gastos Bancarios
              begin
                sSql := 'COBRANZA.DOASIGNARMOVIMGSBCOCONTRPER(' +
                                 ':contrato, :periodo, :imptotmovimientos, ' +
                                 ':usuario, :idremesa, :fedis, ' +
                                 ':fereca, :codigomovctb, :codigorecepcion, ' +
                                 ':fecharecepcion, :usuarioaprobacion, :idplanvalor, ' +
                                 ':idvalor, :nroboletadep);';
                EjecutarStoreSTEx(sSql, [FieldByName('CONTRATO').AsInteger, FieldByName('PERIODO').AsString, FieldByName('IMPORTE').AsFloat,
                                         FieldByName('USUALTA').AsString, '', TDateTimeEx.Create(FechaDistribucion),
                                         TDateTimeEx.Create(FieldByName('FECHARECA').AsDateTime), '', ZMO_RECEPCION_AUTOMATICA,
                                         '', Sesion.UserID, '',
                                         '', '']);
              end
            else if sCodigoMov = '461' then  // Cobro de Reintegro Gastos Gestión de Cobranza
              begin
                sSql := 'COBRANZA.DOASIGNARMOVIMGSADMCONTRPER(' +
                                 ':contrato, :periodo, :imptotmovimientos, ' +
                                 ':usuario, :idremesa, :fedis, ' +
                                 ':fereca, :codigomovctb, :codigorecepcion, ' +
                                 ':fecharecepcion, :usuarioaprobacion, :idplanvalor, ' +
                                 ':idvalor, :nroboletadep);';
                EjecutarStoreSTEx(sSql, [FieldByName('CONTRATO').AsInteger, FieldByName('PERIODO').AsString, FieldByName('IMPORTE').AsFloat,
                                         FieldByName('USUALTA').AsString, '', TDateTimeEx.Create(FechaDistribucion),
                                         TDateTimeEx.Create(FieldByName('FECHARECA').AsDateTime), '', ZMO_RECEPCION_AUTOMATICA,
                                         '', Sesion.UserID, '',
                                         '', '']);
              end;

            Next;
          end;
      finally
        free;
      end;

    Result := True;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al insertar los registros en la tabla de movimientos.' );
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbAprobarClick(Sender: TObject);
var      
  iCantRegAprobar: Integer;
  bRedevengar: Boolean;
begin
  if IsDatosValidosAprobacion() then     
    if MsgBox( '¿Confirma la aprobación de ' + IntToStr( Grid.SelectedRows.Count ) + ' movimiento/s?', MB_ICONQUESTION + MB_OKCANCEL, sPantalla ) = IDOK then
      begin
        if Do_CrearTablaTempRegSeleccionados (* and Do_ProcesarMovConPeriodosConciliados *) then
          begin
            iCantRegAprobar := Get_CantRegistrosAprobar;

            if iCantRegAprobar = 0 then
              MsgBox( 'De los registros seleccionados, ninguno ha sido confirmado...', MB_ICONINFORMATION, sPantalla )
            else if MsgBox( '¿Confirma la APROBACION de ' + IntToStr( iCantRegAprobar ) + ' registro/s de movimiento/s?', MB_ICONQUESTION+MB_YESNO, sPantalla ) = ID_YES then
              begin
                bRedevengar := True;

                BeginTrans;
                try
                  if Do_InsertarMovimientos and Do_Redevengar(bRedevengar) and Do_ActualizarAprobacionRegSeleccionados and Do_ActualizarEmplYMasa_NoDevengar then
                    begin
                      CommitTrans;
                      MsgBox( 'Los movimientos se aprobaron correctamente.', MB_ICONINFORMATION, sPantalla );

                      tbRefrescarClick( nil );
                    end;
                except
                  on E: Exception do
                    begin
                      RollBack;
                      Raise Exception.Create ( E.Message + CRLF + 'Error al aprobar los movimientos.' );
                    end;
                end;
              end;
          end;
      end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilasSel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  InicializarContadores( False );
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.GridCellClick(Column: TColumn);
begin
  CalcularFilasSel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.CalcularFilasSel;
begin
  SumBookmarkFields( sdqConsulta, Grid.SelectedRows, CAMPOS_SUMA, TotalRegSeleccionados );

  edCantContratos.Value     := Grid.SelectedRows.Count;
  edTotalImpContratos.Value := TotalRegSeleccionados[0];
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.GridKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  CalcularFilasSel;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  CalcularFilasSel;
  CalcTotales;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.InicializarContadores(ActualizarTotales: Boolean);
begin
  edCantContratos.Value     := 0;
  edTotalImpContratos.Value := 0;

  if ActualizarTotales then
    CalcTotales;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.ValidarCoberturaPeriodo(Contrato: Integer; Cuit, Periodo: String): Boolean;
var
  sSql: String;
  iContratoVigente: Integer;
  bValor: boolean;
begin
  sSql := 'SELECT COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(:Contrato, :Periodo)' +
            'FROM DUAL';

  if ValorSqlIntegerEx(sSql, [Contrato, Periodo]) <> 1 then
  begin
    {Tener en cuenta que esta misma validacion está en el IMPOEXPO "CMMOV"}
    if (Comportamiento = cfEmision) then
      begin
        bValor := ValorSQLIntegerEx('SELECT SUM((RC_DEVENGADOCUOTA+RC_DEVENGADOFONDO+RC_DEVENGADOINTERES+RC_DEVENGADOOTROS) ' +
                                              '-(RC_PAGOCUOTA+RC_PAGOFONDO+RC_PAGOINTERES+RC_PAGOOTROS+RC_RECUPEROCUOTA+RC_RECUPEROFONDO+RC_RECUPEROINTERES)) ' +
                                      'FROM ZRC_RESUMENCOBRANZA_EXT ' +
                                     'WHERE RC_CONTRATO = :CONTRATO ' +
                                       'AND RC_PERIODO = :PERIODO',
                                       [Contrato, Periodo]) = 0;

        Verificar(bValor, ppfpMM_PERIODO, 'Para el período indicado, el contrato no se encuentra activo y el saldo del periodo para el régimen es 0.');
      end
    else  // cfCobranzas
      begin
        sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTE(' + SqlValue( Cuit ) + ', ' + SqlValue( Periodo ) + ', AFILIACION.GET_IDREGIMENCONTRATO(' + SqlValue( Contrato ) + ')) ' +
                  'FROM DUAL';

        iContratoVigente := ValorSqlInteger( sSql );

        Verificar(iContratoVigente = 0, ppfpMM_PERIODO, 'El período indicado no corresponde a ningún contrato de la empresa para el régimen seleccionado.' );

        if iContratoVigente = Contrato then
          Verificar(not Seguridad.Claves.IsActive('PermitirAprobarPerSinCoberturaAreaCob'), ppfpMM_PERIODO, 'Para el período indicado, el contrato no se encuentra activo.')
        else
          begin
            sSql := 'SELECT AFILIACION.GET_CONTRATOPRINCIPAL(:Contrato, :Periodo) ' +
                      'FROM DUAL';

            Verificar(True, ppfpMM_PERIODO, 'El período indicado corresponde al contrato ' + ValorSqlEx(sSql, [iContratoVigente, Periodo] ) + '.' );
          end;
      end;
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.SetComportamiento(const Value: TComportamientoForm);
begin
  FComportamiento := Value;

  with frafpMM_CONTRATO do
    begin
      ShowBajas         := True;
      VerTodosRegimenes := True;
    end;

  with frafpMM_IDCODIGOMOVIMIENTO do
    begin
      TableName      := 'ZCM_CODIGOMOVIMIENTO';
      FieldId        := 'CM_ID';
      FieldCodigo    := 'CM_CODIGO';
      FieldDesc      := 'CM_DESCRIPCION';
      ShowBajas      := False;
      ExtraCondition := ' AND CM_PERFIL IN ' + Get_TipoCodigoMovim(FComportamiento) + ' AND CM_MANUAL = ''S''' + Iif(Seguridad.Claves.IsActive('PermitirBonificacion'), '', ' AND CM_CODIGO NOT IN (''505'')');
    end;

  case FComportamiento of
    cfCobranzas:
      begin
        Caption := Caption + ' - [Cobranzas]';
        sPantalla := 'Cobranzas';
      end;
    cfEmision:
      begin
        Caption := Caption + ' - [Emisión]';
        sPantalla := 'Emisión';
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbVistaPreviaClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un movimiento.');

  with TfrmMovimientosVistaPrevia.Create(Self) do
  begin
    Contrato := Self.sdqConsulta.FieldByName('CONTRATOEXT').AsInteger;
    Periodo  := Self.sdqConsulta.FieldByName('PERIODO').AsString;
    ShowModal;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbImpoExpoClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  dFecha := DBDateTime;
  if ImpoExpoWizard('CMMOV') then
  begin
    tbLimpiarClick(nil);
    edMM_FECHAALTADesde.Date := dFecha;
    tbRefrescarClick(nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.mnuAyudaClick(Sender: TObject);
begin
  MostrarAyuda('Ayuda - Importación de Movimientos Manuales', 'Cobranzas - Carga Manual de Movimientos.rtf');
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbEstadoClick(Sender: TObject);
begin
  if not edEstado.Visible then
  begin
    edEstado.Height := 0;
    edEstado.Visible := not edEstado.Visible;
    while edEstado.Height <= ((edEstado.Lines.Count * ALTURA_RENGLON) + StrToInt(iif(edEstado.Lines.Count = 0, 0, 8))) do
      edEstado.Height := edEstado.Height + 1;
  end else
  begin
    while edEstado.Height > 0 do
      edEstado.Height := edEstado.Height - 1;
    edEstado.Visible := not edEstado.Visible;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if Grid.SelectedRows.Count > 1 then
    tbEstado.Enabled := False
  else
    tbEstado.Enabled := True;

  if edEstado.Visible then
    ReAjustarEstado;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.ReAjustarEstado;
begin
  while edEstado.Height <= ((edEstado.Lines.Count * ALTURA_RENGLON) + StrToInt(iif(edEstado.Lines.Count = 0, 0, 8))) do
    edEstado.Height := edEstado.Height + 1;

  while edEstado.Height > ((edEstado.Lines.Count * ALTURA_RENGLON) + StrToInt(iif(edEstado.Lines.Count = 0, 0, 8))) do
    edEstado.Height := edEstado.Height - 1;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.frafpMM_CONTRATOExit(Sender: TObject);
var
  sSQL, sEstado: string;
begin
  inherited;
  frafpMM_CONTRATO.FrameExit(Sender);

  if frafpMM_CONTRATO.IsSelected then
  begin
    sSQL := 'SELECT ' + SQL_ESTADO +
             ' FROM AEM_EMPRESA, ACO_CONTRATO_EXT' +
            ' WHERE CO_IDEMPRESA = EM_ID' +
              ' AND CO_CONTRATO = :CONTRATO';

    sEstado := ValorSQLEx(sSQL, [frafpMM_CONTRATO.ContratoExt]);

    if sEstado > '' then
      InfoHint(frafpMM_CONTRATO, sEstado, False, 'Información', blnInfo, 5, False);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.Do_ActualizarEmplYMasa_NoDevengar: Boolean;
var
  sSql, sPeriodo: String;
  iContrato: Integer;
begin
  try
    if FComportamiento=cfEmision then
      begin
        sSql := 'SELECT IMM.MM_CONTRATO CONTRATO, IMM.MM_PERIODO PERIODO ' +
                  'FROM ZCM_CODIGOMOVIMIENTO, ACO_CONTRATO, ' +
                       'IMM_MOVIMIENTOMANUAL IMM, TMM_MOVIMMANUALSELECCIONADO TMM ' +
                 'WHERE TMM.MM_USUARIO = ' + SqlValue( Sesion.UserID ) + ' ' +
                   'AND TMM.MM_CONFIRMADO IS NULL ' +
                   'AND TMM.MM_IDMOVIMIENTOMANUAL = IMM.MM_ID ' +
                   'AND IMM.MM_CONTRATO = CO_CONTRATO ' +
                   'AND CO_NODEVENGAR = ''S'' ' +
                   'AND MM_IDCODIGOMOVIMIENTO = CM_ID ' +
                   'AND ''''||CM_CODIGO = ''500'' ' +
              'GROUP BY IMM.MM_CONTRATO, IMM.MM_PERIODO';

        with GetQuery( sSql ) do
          begin
            while not EOF do
              begin
                iContrato := FieldByName( 'CONTRATO' ).AsInteger;
                sPeriodo  := FieldByName( 'PERIODO' ).AsString;

                sSql := 'UPDATE ZRC_RESUMENCOBRANZA_EXT ' +
                           'SET RC_EMPLEADOS = DECODE(RC_EMPLEADOS, 0, EMISION.GET_EMPLEADOSNODEVENGAR(RC_CONTRATO, RC_PERIODO), RC_EMPLEADOS), ' +
                               'RC_MASASALARIAL = DECODE(RC_MASASALARIAL, 0, EMISION.GET_MASASALARIALNODEVENGAR(RC_CONTRATO, RC_PERIODO), RC_MASASALARIAL) ' +
                         'WHERE RC_CONTRATO = ' + SqlValue( iContrato ) + ' ' +
                           'AND RC_PERIODO = ' + SqlValue( sPeriodo );
                EjecutarSqlST( sSql );

                Next;
              end;
          end;
      end;

    Result := True;
  except
    on E: Exception do
      Raise Exception.Create ( E.Message + CRLF + 'Error al actualizar la cantidad de empleados y masa salarial.' );
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.tbRevertirClick(Sender: TObject);
begin
  with TfrmReversionMovimientos.Create(Self) do
    begin
      if fraMM_CONTRATO.IsSelected then
        Contrato := fraMM_CONTRATO.ContratoExt;

      Comportamiento := Self.Comportamiento;  
      ShowModal;
    end
end;
{-------------------------------------------------------------------------------}
function TfrmCargaManualMovimientos.TieneDDJJaAprobar(aContrato: integer; aPeriodo: String): boolean;
begin
  Result := ExisteSql(' SELECT 1 FROM EMI.IDJ_DDJJ, EMI.IEV_ESTADOVERIFICADO ' +
                       ' WHERE DJ_ESTADO = EV_ID ' +
                         ' AND EV_ESTADO = ''P''' +
                         ' AND DJ_CONTRATO = ' + SqlValue(aContrato) +
                         ' AND DJ_PERIODO = ' + SqlValue(aPeriodo));

end;
{-------------------------------------------------------------------------------}
procedure TfrmCargaManualMovimientos.ppfpMM_PERIODOExit(Sender: TObject);
begin         
  if not frafpMM_CONTRATO.IsEmpty and (ppfpMM_PERIODO.Periodo.Valor <> '') then
    if IsCorrespondePagoFG(frafpMM_CONTRATO.Contrato, ppfpMM_PERIODO.Periodo.Valor) then
      MsgBox('Corresponde el pago al Fondo de Garantía. Se sugiere revisar si el saldo a favor es real.', MB_ICONINFORMATION);
end;
{-------------------------------------------------------------------------------}
end.


