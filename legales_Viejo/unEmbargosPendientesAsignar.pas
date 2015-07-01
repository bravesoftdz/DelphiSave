unit unEmbargosPendientesAsignar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo, ToolEdit, DateComboBox, Menus, IntEdit, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, FormPanel, dbsql;

type
  TfrmEmbargosPendientesAsignar = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    GroupBox1: TGroupBox;
    checkSoloActivos: TCheckBox;
    GroupBox2: TGroupBox;
    dcbEstado: TDBCheckCombo;
    GroupBox3: TGroupBox;
    dcbMotivoRegularizado: TDBCheckCombo;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    sdqMotivosRegularizado: TSDQuery;
    dsMotivosRegularizado: TDataSource;
    tbEmbargoSinJuicio: TToolButton;
    GroupBox4: TGroupBox;
    checkNoDadosBaja: TCheckBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    edFAltaDesde: TDateComboBox;
    edFAltaHasta: TDateComboBox;
    pmuTipoJuicio: TPopupMenu;
    pmuParteActora: TMenuItem;
    pmnParteDemandada: TMenuItem;
    GroupBox6: TGroupBox;
    edNroCarpeta: TIntEdit;
    lbNroJuicio: TLabel;
    tbModificar2: TToolButton;
    fpModificar: TFormPanel;
    Bevel1: TBevel;
    lblRepetido: TLabel;
    lblObservaciones: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    mObservaciones: TMemo;
    chkRepetido: TCheckBox;
    tbSumatoria: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbEmbargoSinJuicioClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure pmnParteDemandadaClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbModificar2Click(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
  private
    procedure CalcTotales;
  protected
  	procedure EnableButtons(AEnabled: Boolean = True); override;
  	procedure RefreshData; override;
  public
  end;                 

const
  MAXCOLS = 2;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('IMPORTE', 'APLICADO', 'SALDO');

var
  frmEmbargosPendientesAsignar: TfrmEmbargosPendientesAsignar;
  TotalConsulta: array of extended;

implementation

uses
  unConsultaJuiciosEnTramite, unConsultaJuicioParteActora, unConsultaJuicioParteDemandada,
  CustomDlgs, AnsiSql, unSesion, SqlFuncs, unDmPrincipal, unUtilsArchivo, unComunesArchivo,
  unConstantArchivo, unArt, unPrincipal, DbFuncs, General, StrFuncs;

{$R *.dfm}

procedure TfrmEmbargosPendientesAsignar.EnableButtons(AEnabled: Boolean = True);
begin
	inherited;
end;

procedure TfrmEmbargosPendientesAsignar.RefreshData;
var
  sSql: String;
  sWhere: String;
begin                
  sSql :=
    'SELECT jt_numerocarpeta carpeta, jt_demandante demandante, jt_demandado demandado,' +
    			' NVL(jt_caratula, em_caratula) caratula, ju_descripcion jurisdiccion, fu_descripcion fuero,' +
          ' jz_descripcion juzgado, in_descripcion instancia, sc_descripcion secretaria, ba_nombre banco,' +
          ' cb_numero cuenta, em_importe importe, legales.get_montoaplicadoembargo(em_id) aplicado,' +
          ' em_importe - legales.get_montoaplicadoembargo(em_id) saldo, em_fecha fecha, em_oficio oficio,' +
          ' ee_descripcion estado, em_repetido repetido, em_fecharegularizado fecha_regularizado,' +
          ' re_descripcion motivo_regularizado, em_observaciones observaciones, em_id, TRUNC(em_fechabaja) fechabaja,' +
					' em_idjuicio, em_idestado, TRUNC(em_fechaalta) fechaalta, decode(jt_estadomediacion, ''A'', ''Actora'', ''J'', ''Demandada'') tipo_juicio,' +
          ' em_tipo tipo, jt_gpba gpba' +
     ' FROM zba_banco, zcb_cuentabancaria, legales.ljt_juicioentramite, legales.lju_jurisdiccion, legales.lfu_fuero,' +
     			' legales.ljz_juzgado, legales.lin_instancia, legales.lsc_secretaria, lre_regularizacionembargo,' +
          ' lee_estadoembargo, lem_embargo' +
    ' WHERE ee_id = em_idestado' +
      ' AND cb_id(+) = em_idcuentabancaria' +
      ' AND ba_id(+) = cb_idbanco' +
      ' AND re_id(+) = em_idregularizado' +
      ' AND jt_id(+) = em_idjuicio' +
      ' AND in_id = jz_idinstancia' +
      ' AND ju_id = NVL(jt_idjurisdiccion, em_idjurisdiccion)' +
      ' AND fu_id = NVL(jt_idfuero, em_idfuero)' +
      ' AND jz_id = NVL(jt_idjuzgado, em_idjuzgado)' +
      ' AND sc_id = NVL(jt_idsecretaria, em_idsecretaria)';

  sWhere := SqlBetweenDateTime(' AND EM_FECHAALTA', edFAltaDesde.Date, edFAltaHasta.Date);

	if checkSoloActivos.Checked then
		sWhere := sWhere + ' AND EM_IDJUICIO IS NULL';

  if edNroCarpeta.Text <> '' then
    sWhere := sWhere + ' AND jt_numerocarpeta = '+SqlValue(edNroCarpeta.Text);

	if checkNoDadosBaja.Checked then
		sWhere := sWhere + ' AND EM_FECHABAJA IS NULL';

  if dcbEstado.Text <> '' then
    sWhere := sWhere + ' AND EM_IDESTADO ' + dcbEstado.InSql;

  if dcbMotivoRegularizado.Text <> '' then
    sWhere := sWhere + ' AND EM_IDREGULARIZADO ' + dcbMotivoRegularizado.InSql;

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;


procedure TfrmEmbargosPendientesAsignar.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField( sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmEmbargosPendientesAsignar.tbLimpiarClick(Sender: TObject);
begin
	checkSoloActivos.Checked := True;
	checkNoDadosBaja.Checked := True;
  dcbEstado.Clear;
  dcbMotivoRegularizado.Clear;
  edNroCarpeta.Clear;
  edFAltaDesde.Clear;
  edFAltaHasta.Clear;
  inherited;
end;

procedure TfrmEmbargosPendientesAsignar.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS+1);

  tbEmbargoSinJuicio.Left := 114;
  tbModificar2.Left       := 70;

  sdqEstados.Open;
  sdqMotivosRegularizado.Open;
end;

procedure TfrmEmbargosPendientesAsignar.tbEmbargoSinJuicioClick(Sender: TObject);
var
	sSql: String;
begin
	sSql :=
    'UPDATE LEM_EMBARGO' +
      ' SET EM_IDESTADO = 2' +
         ', EM_USUMODIF = ' + SqlValue(Sesion.UserID) +
         ', EM_FECHAMODIF = SYSDATE' +
    ' WHERE EM_ID = ' + SqlValue(sdqConsulta.FieldByName('em_id').AsInteger);
  EjecutarSqlST(sSql);
  RefreshData;
  InfoHint(Grid, 'La acción se llevó a cabo con éxito.');
end;

procedure TfrmEmbargosPendientesAsignar.tbRefrescarClick(Sender: TObject);
begin
	RefreshData;
end;

procedure TfrmEmbargosPendientesAsignar.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;

	tbEmbargoSinJuicio.Enabled := (sdqConsulta.FieldByName('EM_IDJUICIO').IsNull) and
  															(sdqConsulta.FieldByName('EM_IDESTADO').AsInteger = 1);
	tbModificar.Enabled := (sdqConsulta.FieldByName('EM_IDESTADO').AsInteger in [1, 2]);
  if grid.Row > 0 then
    tbModificar2.Enabled:=true
  else
    tbModificar2.Enabled:=false
end;

procedure TfrmEmbargosPendientesAsignar.pmnParteDemandadaClick(Sender: TObject);
var
  reservagestion: Double;
  ConsultaJuiciosEnTramite: TfrmConsultaJuiciosEnTramite;
  bParteDemandada: Boolean;
  rarId: TTableId;
  sSql, sCarpeta: String;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un registro de la grilla');

  bParteDemandada := (Sender = pmnParteDemandada);

  if bParteDemandada then
    ConsultaJuiciosEnTramite := TfrmConsultaJuicioParteDemandada.Create(Self)
  else
    ConsultaJuiciosEnTramite := TfrmConsultaJuicioParteActora.Create(Self);

  with ConsultaJuiciosEnTramite do
    begin
      VerSeleccionar := True;

      if bParteDemandada then
        with TfrmConsultaJuicioParteDemandada(ConsultaJuiciosEnTramite) do
          begin
            VerEnvioWebEstudios := False;
            tbCierredeReserva.Visible := False;
          end;
      ConsultaJuiciosEnTramite.showmodal;
      if ConsultaJuiciosEnTramite.modalresult = mrCancel then
        abort;
      if (ConsultaJuiciosEnTramite.modalresult = mrOk) and (MsgBox('¿ Confirma la asignación del nro. de juicio al embargo ?', MB_ICONINFORMATION + MB_YESNO, 'Atención') = ID_YES) then
        begin
          BeginTrans;
          try
            with TSql.Create('LEM_EMBARGO') do
              try
                SqlType := stUpdate;

                PrimaryKey.Add( 'EM_ID',    Self.sdqConsulta.FieldByName('EM_ID').AsInteger);
                Fields.Add('EM_IDJUICIO',   IdJuicio);
                Fields.Add('EM_USUMODIF',   Sesion.UserId);
                Fields.Add('EM_FECHAMODIF', exDateTime);
                EjecutarSQLST(Sql);

                reservagestion := ValorSqlExtended(
                  ' SELECT art.legales.get_reservagestion ('+SqlValue(IdJuicio)+') '+
                  '    FROM dual ');

                EjecutarSqlST(
                  ' UPDATE legales.ljt_juicioentramite '+
                  '    SET JT_RESERVAGESTION = '+ SqlNumber(reservagestion)+ ', '+
                  '        jt_fechamodif = SYSDATE, '+
                  '        jt_usumodif = '+ SqlValue(Sesion.UserId)+
                  '  WHERE jt_id = '+SqlValue(IdJuicio));

                sSql := 'SELECT JT_NUMEROCARPETA ' +
                          'FROM LEGALES.LJT_JUICIOENTRAMITE ' +
                         'WHERE JT_ID = :Juicio';
                sCarpeta := Trim(ValorSqlEx(sSql, [IdJuicio]));

                if sCarpeta <> '' then
                  begin
                    if not VerificarClaveExiste(ID_CARPETA_EMBARGO, sCarpeta, rarId) then
                      DoInsertArchivo(ID_CARPETA_EMBARGO, TIPOUBICACION_GUARDA, '', 0, '', '', sCarpeta, False);
                  end;

                CommitTrans;
                MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');

                RefreshData;
              finally
                Free;
              end;
            except
              on E: Exception do
                begin
                  ErrorMsg( E, 'Error al grabar la asignación' );
                  RollBack;
                end;
            end;
        end;
    end;
end;

procedure TfrmEmbargosPendientesAsignar.tbModificarClick(Sender: TObject);
begin
	tbModificar.CheckMenuDropdown;
end;

procedure TfrmEmbargosPendientesAsignar.tbModificar2Click(Sender: TObject);
begin
  inherited;
  if sdqConsulta.FieldByName('repetido').AsString = 'N' then
    chkRepetido.checked := false
  else
    chkRepetido.checked := true;
  mObservaciones.Lines.Text := sdqConsulta.FieldByName('observaciones').AsString;
  fpModificar.ShowModal;
end;

procedure TfrmEmbargosPendientesAsignar.btnAceptarClick(Sender: TObject);
var sql: TcustomSQL; fila: integer;

begin
  inherited;
   fila:=grid.Row;
   Sql := TDBSql.Create;
   sql.TableName := 'legales.lem_embargo';
   Sql.PrimaryKey.Add('EM_ID', sdqConsulta.FieldByName('EM_ID').AsString);
   Sql.Fields.Add('EM_OBSERVACIONES', mObservaciones.Lines.Text);
   if chkRepetido.Checked = false then
      Sql.Fields.Add('EM_REPETIDO', 'N')
   else
      Sql.Fields.Add('EM_REPETIDO', 'S');
   Sql.Fields.Add('EM_USUMODIF', frmPrincipal.DBLogin.UserID);
   Sql.Fields.Add('EM_FECHAMODIF', exDateTime);
   Sql.SqlType := stUpdate;
   tdbsql(sql).Execute;
   sdqConsulta.Refresh;
   grid.row:=fila;
end;

procedure TfrmEmbargosPendientesAsignar.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmEmbargosPendientesAsignar.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active Then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmEmbargosPendientesAsignar.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

end.


