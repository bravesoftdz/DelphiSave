unit unManCEP_ENCUESTAPREGUNTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, RxPlacemnt, AdvMemo, AdvmSQLS;

type
  TfrmManCEP_ENCUESTAPREGUNTA = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    edDescripcion: TEdit;
    ShortCutControlHijo: TShortCutControl;
    edEP_DESCRIPCION_FULL_LIKE: TEdit;
    lblDescripcionFiltro: TLabel;
    lbEncuestaFiltro: TLabel;
    Label1: TLabel;
    fraEncuesta: TfraCodDesc;
    fraEP_IDENCUESTA: TfraCodDesc;
    fraCategoria: TfraCodDesc;
    Label2: TLabel;
    sdqConsultaEP_ID: TFloatField;
    sdqConsultaEP_IDENCUESTA: TFloatField;
    sdqConsultaEP_IDCATEGORIA: TFloatField;
    sdqConsultaEP_DESCRIPCION: TStringField;
    sdqConsultaEP_TIPO: TStringField;
    sdqConsultaEP_RESPUESTASQL: TStringField;
    sdqConsultaEP_USUALTA: TStringField;
    sdqConsultaEP_FECHAALTA: TDateTimeField;
    sdqConsultaEP_USUMODIF: TStringField;
    sdqConsultaEP_FECHAMODIF: TDateTimeField;
    sdqConsultaEP_USUBAJA: TStringField;
    sdqConsultaEP_FECHABAJA: TDateTimeField;
    sdqConsultaEP_ORDEN: TFloatField;
    fraTipoRespuesta: TfraCodDesc;
    Label3: TLabel;
    Label4: TLabel;
    fraDespuesDe: TfraCodDesc;
    sdqCategoria: TSDQuery;
    sdqTipo: TSDQuery;
    sdqDespuesDe: TSDQuery;
    sdqConsultaEN_DESCRIPCION: TStringField;
    sdqConsultaEC_DESCRIPCION: TStringField;
    sdqConsultaTIPO: TStringField;
    sdqConsultaDESPUES_DE: TStringField;
    sdqConsultaIDCATEGORIA: TFloatField;
    sdqConsultaIDDESPUESDE: TFloatField;
    sdqConsultaCATEGORIA: TStringField;
    pgRespuestas: TPageControl;
    tsListaDeRespuestas: TTabSheet;
    tsConsultaDinamica: TTabSheet;
    Label5: TLabel;
    tsTextoLibre: TTabSheet;
    btnValidarConsulta: TButton;
    AdvSQLMemoStyler: TAdvSQLMemoStyler;
    sdqConsultaSQL: TSDQuery;
    edTD_SQL: TAdvMemo;
    tlbBarra: TToolBar;
    btnRefresh: TToolButton;
    ToolButton2: TToolButton;
    btnAgregar: TToolButton;
    btnModificar: TToolButton;
    btnEliminar: TToolButton;
    ToolButton12: TToolButton;
    GridRespuestas: TArtDBGrid;
    sdqRespuestas: TSDQuery;
    dsRespuestas: TDataSource;
    fpRespuesta: TFormPanel;
    Bevel2: TBevel;
    Label34: TLabel;
    btnAceptarRespuesta: TButton;
    btnCancelarRespuesta: TButton;
    edDescripcionRespuesta: TEdit;
    Label6: TLabel;
    chkMultipleRespuesta: TCheckBox;
    sdqConsultaEP_MULTIPLERESPUESTA: TStringField;
    sdqConsultaEP_OBLIGATORIO: TStringField;
    chkObligatorio: TCheckBox;
    sdqEjemplo: TSDQuery;
    sdqConsultaOBLIGATORIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraEncuestaPropiedadesChange(Sender: TObject);
    procedure fraCategoriacmbDescripcionDropDown(Sender: TObject);
    procedure fraDespuesDecmbDescripcionDropDown(Sender: TObject);
    procedure btnValidarConsultaClick(Sender: TObject);
    procedure fraTipoRespuestaPropiedadesChange(Sender: TObject);
    procedure pgRespuestasChange(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnAceptarRespuestaClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure GridRespuestasDblClick(Sender: TObject);
    procedure sdqRespuestasAfterOpen(DataSet: TDataSet);
    procedure btnEliminarClick(Sender: TObject);
    procedure GridRespuestasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fpRespuestaClose(Sender: TObject; var Action: TCloseAction);
    procedure fpRespuestaShow(Sender: TObject);
  private
    FSQL: String;
    FSQLCategoria: String;
    FSQLDespuesDe: String;
    FIdPregunta: Integer;
    FOrden: integer;
    FAltaRespuesta: Boolean;

    function DebeHaberRespuestasCargadas: Boolean;
    function DebeHaberConsultaSQL: Boolean;

    procedure FiltrarFraCategoriaPadre;
    procedure FiltrarFraDespuesDe;
    procedure ReacomodarPreguntas(AIdEncuesta, ADesde, AHasta, AExcepto: Integer);
    procedure AgregarRespuesta(AIdPregunta: Integer);
    procedure ModificarRespuesta(AIdRespuesta: Integer);
    procedure DarDeBajaRespuesta(AIdPregunta: Integer);
    procedure HabilitarPCRespuestas;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCEP_ENCUESTAPREGUNTA: TfrmManCEP_ENCUESTAPREGUNTA;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt, Math;

{$R *.dfm}

procedure TfrmManCEP_ENCUESTAPREGUNTA.AgregarRespuesta(AIdPregunta: Integer);
var
  sSql: String;
begin
  sSql := 'INSERT INTO comercial.cer_encuestarespuesta ' +
          '(ER_ID, ER_IDENCUESTA, ER_IDPREGUNTA, ER_DESCRIPCION, ER_USUALTA, ER_FECHAALTA) ' +
          'VALUES ((SELECT NVL(MAX(ER_ID), 0) + 1 FROM COMERCIAL.CER_ENCUESTARESPUESTA) ,:idencuesta, :idpregunta, :descripcion, :usuario, SYSDATE)';

  EjecutarSqlSTEx(sSql, [fraEncuesta.Value, AIdPregunta, edDescripcionRespuesta.Text, Sesion.UserID]);
  OpenQueryEx(sdqRespuestas, [AIdPregunta]);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.btnAceptarRespuestaClick(Sender: TObject);
begin
  Verificar(Trim(edDescripcionRespuesta.Text) = '', edDescripcionRespuesta, 'Debe completar la descripción.');
  fpRespuesta.ModalResult := mrOk;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.btnAgregarClick(Sender: TObject);
var
  bSeguir: Boolean;
begin
  fpRespuesta.Caption := 'Agregar respuesta';
  FAltaRespuesta := True;
  edDescripcionRespuesta.Clear;
  if ModoABM = maAlta then
  begin
    if MsgAsk('Para continuar debe guardar los datos ingresados hasta el momento.' + CRLF + '¿Desea guardar la pregunta ahora?')
    and Validar and DoABM then
    begin
      bSeguir := True;
      FIdPregunta := Sql.PrimaryKey.FieldByName['EP_ID'].Value;
      FOrden := Sql.Fields.FieldByName['EP_ORDEN'].Value;
      RefreshData;
      VCLExtra.LockControls([fraEncuesta, fraTipoRespuesta], True);
      HabilitarPCRespuestas;
      ModoABM := maModificacion;
      BeginTrans(True);
    end else
      bSeguir := False
  end else //ModoABM <> maAlta
  begin
    bSeguir := True;
    BeginTrans(True);
  end;

  if bSeguir and (fpRespuesta.ShowModal = mrOk) then
    AgregarRespuesta(FIdPregunta);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.btnEliminarClick(Sender: TObject);
begin
  if MsgAsk('¿Desea dar de baja la respuesta seleccionada?') then
  begin
    BeginTrans(True);
    DarDeBajaRespuesta(sdqConsulta.FieldByName('EP_ID').AsInteger);
  end;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.DarDeBajaRespuesta(AIdPregunta: Integer);
begin
  EjecutarSqlSTEx('UPDATE comercial.cer_encuestarespuesta ' +
                     'SET ER_USUBAJA = :idusuario, ' +
                         'ER_FECHABAJA = SYSDATE ' +
                   'WHERE ER_ID = :idrespuesta '
                   , [Sesion.UserID, sdqRespuestas.FieldByName('ER_ID').AsInteger]);

  OpenQueryEx(sdqRespuestas, [AIdPregunta]);
end;

function TfrmManCEP_ENCUESTAPREGUNTA.DebeHaberConsultaSQL: Boolean;
begin
  //verifico que haya consulta, y que devuelva resultados
  OpenqueryEx(sdqConsultaSQL, [], edTD_SQL.Lines.Text);
  Result := chkObligatorio.Checked and (fraTipoRespuesta.Codigo = 'Q') and (sdqConsultaSQL.RecordCount = 0);
end;

function TfrmManCEP_ENCUESTAPREGUNTA.DebeHaberRespuestasCargadas: Boolean;
begin
  Result:= chkObligatorio.Checked and (sdqRespuestas.RecordCount = 0) and (fraTipoRespuesta.Codigo = 'R');
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.btnModificarClick(Sender: TObject);
begin
  fpRespuesta.Caption := 'Modificar respuesta';
  edDescripcionRespuesta.Text := sdqRespuestas.FieldByName('ER_DESCRIPCION').AsString;
  BeginTrans(True);
  if fpRespuesta.ShowModal = mrOk then
    ModificarRespuesta(sdqRespuestas.FieldByName('ER_ID').AsInteger);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.ModificarRespuesta(AIdRespuesta: Integer);
begin
  EjecutarSqlSTEx('UPDATE comercial.cer_encuestarespuesta ' +
                     'SET ER_DESCRIPCION = :descripcion, ' +
                         'ER_USUMODIF = :idusuario, ' +
                         'ER_FECHAMODIF = SYSDATE ' +
                   'WHERE ER_ID = :idrespuesta '
                   , [edDescripcionRespuesta.Text, Sesion.UserID, AIdRespuesta]);
  OpenQueryEx(sdqRespuestas, [FIdPregunta]);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.btnValidarConsultaClick(Sender: TObject);
var
  bAbortar: Boolean;
begin
  bAbortar := False;
  if (Trim(edTD_SQL.Lines.Text) > '') then
    try
      CheckAndOpenQuery(sdqConsultaSQL, edTD_SQL.Lines.Text);
      if not Assigned(sdqConsultaSQL.FindField('CODIGO')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Código" para ser mostrado.');
        bAbortar := True;
      end;
      if not Assigned(sdqConsultaSQL.FindField('ID')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Id" para ser mostrado.');
        bAbortar := True;
      end;
      if not Assigned(sdqConsultaSQL.FindField('DESCRIPCION')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Descripción" para ser mostrado.');
        bAbortar := True;
      end;
      if not Assigned(sdqConsultaSQL.FindField('ORDEN')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Orden" para ser mostrado.');
        bAbortar := True;
      end;
      if not Assigned(sdqConsultaSQL.FindField('BAJA')) then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero no hay un campo que se llame "Baja" para ser mostrado.');
        bAbortar := True;
      end;
      if sdqConsultaSQL.Fields.Count <> 5 then
      begin
        InvalidMsg(edTD_SQL, 'La consulta SQL es válida pero debe haber exactamente 5 campos (Se deben llamar "Id", "Código", "Descripción", "Orden" y "Baja.');
        bAbortar := True;
      end;
    except
      InvalidMsg(edTD_SQL, 'La consulta SQL no es válida.');
      bAbortar := True;
    end;

  if bAbortar then
    Abort
  else
    InfoHint(btnValidarConsulta, 'La consulta es válida');
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.ClearControls;
var
  i: Integer;
begin
  ClearComponentData(fpAbm);
  FiltrarFraCategoriaPadre;
  VCLExtra.LockControls([fraEncuesta], False);
  pgRespuestas.ActivePage := tsListaDeRespuestas;
  edTD_SQL.Lines.Text := sdqEjemplo.SQL.Text;
  OpenQueryEx(sdqRespuestas, [-1]);
  VCLExtra.LockControls([fraTipoRespuesta], False);
  for i := 0 to 2 do
    pgRespuestas.Pages[i].TabVisible := True;
  chkMultipleRespuesta.Checked := False;
  chkObligatorio.Checked := True;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

function TfrmManCEP_ENCUESTAPREGUNTA.DoABM: Boolean;
var
  iDesde, iHasta, iExcepto: Integer;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('EP_ID', sdqConsulta.FieldByName('EP_ID').AsInteger);
     Sql.Fields.Add('EP_FECHABAJA', exDate);
     Sql.Fields.Add('EP_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('EP_ID', ValorSQLInteger('SELECT NVL(MAX(EP_ID), 0) FROM COMERCIAL.CEP_ENCUESTAPREGUNTA') + 1);
       Sql.Fields.Add('EP_FECHAALTA', exDate);
       Sql.Fields.Add('EP_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('EP_ID', FIdPregunta);
       Sql.Fields.Add('EP_FECHAMODIF', exDate);
       Sql.Fields.Add('EP_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('EP_FECHABAJA', exNull);
       Sql.Fields.Add('EP_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('EP_IDENCUESTA', fraEncuesta.Value);
     Sql.Fields.Add('EP_IDCATEGORIA', fraCategoria.Value, True);
     Sql.Fields.Add('EP_DESCRIPCION', edDescripcion.Text);
     Sql.Fields.Add('EP_TIPO', fraTipoRespuesta.Codigo);
     Sql.Fields.Add('EP_ORDEN', fraDespuesDe.sdqDatos.FieldByName('ORDEN').AsInteger + 1);
     Sql.Fields.Add('EP_RESPUESTASQL', edTD_SQL.Lines.Text);
     Sql.Fields.Add('EP_MULTIPLERESPUESTA', SQLBoolean(chkMultipleRespuesta.Checked, False, 'S', 'N'));
     Sql.Fields.Add('EP_OBLIGATORIO', SQLBoolean(chkObligatorio.Checked, False, 'S', 'N'));
  end;

  BeginTrans(True);
  try
    Result := inherited DoABM;
    if modoAbm <> maBaja then
    begin
      iDesde := fraDespuesDe.sdqDatos.FieldByName('ORDEN').AsInteger;
      iHasta := FOrden;
      iExcepto := FIdPregunta;
      ReacomodarPreguntas(fraEncuesta.Value, iDesde, iHasta, iExcepto);
    end;
    CommitTrans(True);
  except
    on E: Exception do
    begin
      Result := False;
      RollBack(True);
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.ReacomodarPreguntas(AIdEncuesta, ADesde, AHasta, AExcepto: Integer);
var
  sSQL: String;
  iId: Integer;
begin
  if ModoABM = maAlta then
  begin
    iId := ValorSqlInteger('SELECT NVL(MAX(EP_ID), 0) FROM COMERCIAL.CEP_ENCUESTAPREGUNTA');
    sSQL := 'UPDATE COMERCIAL.CEP_ENCUESTAPREGUNTA SET EP_ORDEN = EP_ORDEN + 1 WHERE EP_ORDEN > :DESDE AND EP_IDENCUESTA = :IDENCUESTA AND EP_ID <> :id';
    EjecutarSqlSTEx(sSQL, [ADesde, AIdEncuesta, iId]);
  end
  else
  if ModoABM = maModificacion then
    if ADesde < AHasta then
    begin
      sSQL := 'UPDATE COMERCIAL.CEP_ENCUESTAPREGUNTA SET EP_ORDEN = EP_ORDEN + :VALOR WHERE EP_ID <> :id AND EP_IDENCUESTA = :IDENCUESTA AND ';
      sSQL := sSQL + ' EP_ORDEN > :DESDE AND EP_ORDEN < :HASTA';
      EjecutarSqlSTEx(sSQL, [Integer(iif(ADesde > AHasta, -1, 1)), AExcepto, AIdEncuesta, Integer(Min(ADesde, AHasta)), Integer(Max(ADesde, AHasta))]);
    end
    else
    begin
      sSQL := 'UPDATE COMERCIAL.CEP_ENCUESTAPREGUNTA SET EP_ORDEN = EP_ORDEN + :VALOR WHERE 1 = 1 AND EP_IDENCUESTA = :IDENCUESTA AND ';
      sSQL := sSQL + ' EP_ORDEN > :DESDE AND EP_ORDEN <= :HASTA';
      EjecutarSqlSTEx(sSQL, [Integer(iif(ADesde > AHasta, -1, 1)), AIdEncuesta, Integer(Min(ADesde, AHasta)), Integer(Max(ADesde, AHasta))]);
      EjecutarSqlSTEx('UPDATE COMERCIAL.CEP_ENCUESTAPREGUNTA SET EP_ORDEN = EP_ORDEN - 1 WHERE EP_ID = :id ', [AExcepto]);
    end;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.FiltrarFraCategoriaPadre;
begin
  if fraEncuesta.IsSelected then
    fraCategoria.Propiedades.Sql := FSQLCategoria + ' AND (IDENCUESTA = ' + SqlValue(fraEncuesta.Value) + ' OR IDENCUESTA = -1)'
  else
    fraCategoria.Propiedades.Sql := FSQLCategoria + ' AND 1 = 2 ';
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.FiltrarFraDespuesDe;
begin
  if fraEncuesta.IsSelected then
  begin
    fraDespuesDe.Propiedades.Sql := FSQLDespuesDe + ' AND (IDENCUESTA = ' + SqlValue(fraEncuesta.Value) + ' OR IDENCUESTA = -1)';
    if modoABM = maModificacion then
      fraDespuesDe.Propiedades.Sql := fraDespuesDe.Propiedades.Sql + ' AND ID <> ' + SqlValue(sdqConsulta.FieldByName('EP_ID').AsInteger);
  end
  else
    fraDespuesDe.Propiedades.Sql := FSQLDespuesDe + ' AND 1 = 2 ';
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMERCIAL.CEP_ENCUESTAPREGUNTA';
  FieldBaja := 'EP_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  FSQLCategoria := sdqCategoria.SQL.Text;
  fraTipoRespuesta.Propiedades.Sql := sdqTipo.SQL.Text;
  FSQLDespuesDe := sdqDespuesDe.SQL.Text;
  AutoColWidths := True;
  VCLExtra.LockControls([btnValidarConsulta], True);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fpAbmClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not OkABM then
    RollBack(True);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fpRespuestaClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FAltaRespuesta := False;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fpRespuestaShow(Sender: TObject);
begin
  edDescripcionRespuesta.SetFocus;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fraCategoriacmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  FiltrarFraCategoriaPadre;
  fraCategoria.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fraDespuesDecmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  FiltrarFraDespuesDe;
  fraDespuesDe.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fraEncuestaPropiedadesChange(Sender: TObject);
begin
  FiltrarFraCategoriaPadre;
  FiltrarfraDespuesDe;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.fraTipoRespuestaPropiedadesChange(Sender: TObject);
begin
  if fraTipoRespuesta.IsSelected then
  begin
    if fraTipoRespuesta.Codigo = 'R' then
      pgRespuestas.ActivePage := tsListaDeRespuestas
    else
    if fraTipoRespuesta.Codigo = 'Q' then
      pgRespuestas.ActivePage := tsConsultaDinamica
    else
    if fraTipoRespuesta.Codigo = 'L' then
      pgRespuestas.ActivePage := tsTextoLibre
  end;
  VCLExtra.LockControls([btnValidarConsulta], fraTipoRespuesta.Codigo <> 'Q');
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.GridRespuestasDblClick(Sender: TObject);
begin
  btnModificar.Click;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.GridRespuestasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqRespuestas.FieldByName('ER_FECHABAJA').IsNull then
  begin
    AFont.Color := clRed;
  end;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.LoadControls;
begin
  fraEncuesta.Value := sdqConsulta.FieldByName('EP_IDENCUESTA').AsInteger;
  edDescripcion.Text := sdqConsulta.FieldByName('EP_DESCRIPCION').AsString;
  fraCategoria.Propiedades.ExtraCondition := ' AND (IDENCUESTA = ' + SqlValue(fraEncuesta.Value) + ' OR IDENCUESTA = -1)';
  FiltrarFraCategoriaPadre;
  fraCategoria.Codigo := sdqConsulta.FieldByName('IDCATEGORIA').AsString;
  fraTipoRespuesta.Codigo := sdqConsulta.FieldByName('EP_TIPO').AsString;
  FiltrarFraDespuesDe;
  fraDespuesDe.Codigo := sdqConsulta.FieldByName('IDDESPUESDE').AsString;
  fraTipoRespuestaPropiedadesChange(nil);
  edTD_SQL.Lines.Text := sdqConsulta.FieldByName('EP_RESPUESTASQL').AsString;
  OpenQueryEx(sdqRespuestas, [sdqConsulta.FieldByName('EP_ID').AsInteger]);
  VCLExtra.LockControls([fraEncuesta, fraTipoRespuesta], True);
  HabilitarPCRespuestas;
  FIdPregunta := sdqConsulta.FieldByName('EP_ID').AsInteger;
  FOrden := sdqConsulta.FieldByName('EP_ORDEN').AsInteger;
  chkMultipleRespuesta.Checked := sdqConsulta.FieldByName('EP_MULTIPLERESPUESTA').AsString = 'S';
  chkObligatorio.Checked := sdqConsulta.FieldByName('EP_OBLIGATORIO').AsString = 'S';
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.HabilitarPCRespuestas;
var
  i: Integer;
begin
  for i:= 0 to 2 do
    pgRespuestas.Pages[i].TabVisible := False;
  if fraTipoRespuesta.Codigo = 'Q' then
    pgRespuestas.Pages[1].TabVisible := True
  else
  if fraTipoRespuesta.Codigo = 'R' then
    pgRespuestas.Pages[0].TabVisible := True
  else
  if fraTipoRespuesta.Codigo = 'L' then
    pgRespuestas.Pages[2].TabVisible := True;
end;


procedure TfrmManCEP_ENCUESTAPREGUNTA.pgRespuestasChange(Sender: TObject);
begin
  if pgRespuestas.ActivePage = tsListaDeRespuestas then
    fraTipoRespuesta.Codigo := 'R'
  else
  if pgRespuestas.ActivePage = tsConsultaDinamica then
    fraTipoRespuesta.Codigo := 'Q'
  else
  if pgRespuestas.ActivePage = tsTextoLibre then
    fraTipoRespuesta.Codigo := 'L';
  VCLExtra.LockControls([btnValidarConsulta], fraTipoRespuesta.Codigo <> 'Q');
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + Nvl(SortDialog.OrderBy, 'ORDER BY ep_idencuesta, ep_orden');
  inherited RefreshData;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.sdqRespuestasAfterOpen(DataSet: TDataSet);
var
  bEnabled: Boolean;
begin
  bEnabled := sdqRespuestas.Active and (sdqRespuestas.RecordCount > 0);
  btnModificar.Enabled := bEnabled;
  btnEliminar.Enabled := bEnabled;
end;

function TfrmManCEP_ENCUESTAPREGUNTA.Validar: Boolean;
begin
  Verificar(fraEncuesta.IsEmpty, fraEncuesta, 'Debe seleccionar la encuesta.');
  Verificar(fraCategoria.IsEmpty, fraCategoria, 'Debe seleccionar la categoría.');
  Verificar(edDescripcion.Text = '', edDescripcion, 'Debe completar la pregunta.');
  Verificar(fraTipoRespuesta.IsEmpty, fraTipoRespuesta, 'Debe seleccionar el tipo de respuesta.');
  Verificar(fraDespuesDe.IsEmpty, fraDespuesDe, 'Debe seleccionar una pregunta.');
  if not FAltaRespuesta then
    Verificar(DebeHaberRespuestasCargadas, GridRespuestas, 'Debe haber respuestas cargadas.');
  if pgRespuestas.ActivePage = tsConsultaDinamica then
  begin
    Verificar(Trim(edTD_SQL.Lines.Text) = '', edTD_SQL, 'Debe haber una consulta sql.');
    Verificar(DebeHaberConsultaSQL, edTD_SQL, 'La consulta SQL debe retornar resultados.');
  end;
  Result := True;
end;

procedure TfrmManCEP_ENCUESTAPREGUNTA.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbRefrescar, 'Debe seleccionar un registro.');
  if not sdqConsulta.FieldByName(FieldBaja).IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿Desea reactivarlo?') then
      Abort;
  inherited;
end;

end.
