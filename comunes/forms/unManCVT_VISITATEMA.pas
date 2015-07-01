unit unManCVT_VISITATEMA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider, ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls, FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, AdvGroupBox, AdvOfficeButtons, AdvMemo, AdvmSQLS;

type
  TfrmManCVT_VISITATEMA = class(TfrmCustomGridABM)
    fraVisita: TfraCodDesc;
    Label1: TLabel;
    fraCategoria: TfraCodDesc;
    Label2: TLabel;
    edDescripcion: TEdit;
    lblDescripcion: TLabel;
    fraTipoRespuesta: TfraCodDesc;
    Label3: TLabel;
    fraDespuesDe: TfraCodDesc;
    Label4: TLabel;
    sdqCategoria: TSDQuery;
    rgGuardaAdjunto: TAdvOfficeRadioGroup;
    rgGuardaObservaciones: TAdvOfficeRadioGroup;
    sdqTipo: TSDQuery;
    pgRespuestas: TPageControl;
    tsListaDeRespuestas: TTabSheet;
    tlbBarra: TToolBar;
    btnRefresh: TToolButton;
    ToolButton2: TToolButton;
    btnAgregar: TToolButton;
    btnModificar: TToolButton;
    btnEliminar: TToolButton;
    ToolButton12: TToolButton;
    GridRespuestas: TArtDBGrid;
    tsConsultaDinamica: TTabSheet;
    edTD_SQL: TAdvMemo;
    btnValidarConsultaRespuestas: TButton;
    sdqDespuesDe: TSDQuery;
    sdqRespuestas: TSDQuery;
    sdqConsultaVT_ORDEN: TFloatField;
    sdqConsultaVT_ID: TFloatField;
    sdqConsultaVT_IDVISITA: TFloatField;
    sdqConsultaVT_IDCATEGORIA: TFloatField;
    sdqConsultaVT_DESCRIPCION: TStringField;
    sdqConsultaVT_TIPO: TStringField;
    sdqConsultaVT_RESPUESTASQL: TStringField;
    sdqConsultaVT_USUALTA: TStringField;
    sdqConsultaVT_FECHAALTA: TDateTimeField;
    sdqConsultaVT_USUMODIF: TStringField;
    sdqConsultaVT_FECHAMODIF: TDateTimeField;
    sdqConsultaVT_USUBAJA: TStringField;
    sdqConsultaVT_FECHABAJA: TDateTimeField;
    sdqConsultaVT_AYUDA: TStringField;
    sdqConsultaVT_ADJUNTO: TStringField;
    sdqConsultaVT_OBSERVACIONES: TStringField;
    sdqConsultaVT_SCRIPT: TStringField;
    sdqConsultaVT_IDTIPOEVENTO: TFloatField;
    sdqConsultaVT_IDMOTIVOINGRESO: TFloatField;
    sdqConsultaVS_DESCRIPCION: TStringField;
    sdqConsultaVC_DESCRIPCION: TStringField;
    sdqConsultaCATEGORIA: TStringField;
    sdqConsultaIDCATEGORIA: TFloatField;
    sdqConsultaTIPO: TStringField;
    sdqConsultaDESPUES_DE: TStringField;
    sdqConsultaIDDESPUESDE: TFloatField;
    sdqEjemplo: TSDQuery;
    AdvSQLMemoStyler: TAdvSQLMemoStyler;
    sdqConsultaSQL: TSDQuery;
    fpRespuesta: TFormPanel;
    Bevel2: TBevel;
    Label34: TLabel;
    btnAceptarRespuesta: TButton;
    btnCancelarRespuesta: TButton;
    edDescripcionRespuesta: TEdit;
    dsRespuestas: TDataSource;
    fraVT_IDVISITA: TfraCodDesc;
    lbEncuestaFiltro: TLabel;
    edVT_DESCRIPCION_FULL_LIKE: TEdit;
    lblDescripcionFiltro: TLabel;
    rgAccion: TAdvOfficeRadioGroup;
    lblTarea: TLabel;
    fraNuevaTarea: TfraCodDesc;
    lblMotivoIngreso: TLabel;
    fraTC_IDMOTIVOINGRESO: TfraCodDesc;
    sdqMotivosDeIngreso: TSDQuery;
    mAyuda: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    pnlConsultaDinamica: TPanel;
    sdqConsultaBREADCRUMB: TStringField;
    sdqConsultaGUARDAROBSERVACIONES: TStringField;
    sdqConsultaGUARDARADJUNTO: TStringField;
    sdqConsultaGENERATAREASIC: TStringField;
    Panel1: TPanel;
    pnlScriptTema: TPanel;
    amScriptTema: TAdvMemo;
    btnValidarConsultaScript: TButton;
    ShortCutControlHijo: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure fraVisitaPropiedadesChange(Sender: TObject);
    procedure fraTipoRespuestaPropiedadesChange(Sender: TObject);
    procedure fraDespuesDecmbDescripcionDropDown(Sender: TObject);
    procedure btnValidarConsultaRespuestasClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure fpRespuestaShow(Sender: TObject);
    procedure btnAceptarRespuestaClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure GridRespuestasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure GridRespuestasDblClick(Sender: TObject);
    procedure sdqRespuestasAfterOpen(DataSet: TDataSet);
    procedure btnEliminarClick(Sender: TObject);
    procedure rgAccionClick(Sender: TObject);
    procedure fraNuevaTareaPropiedadesChange(Sender: TObject);
    procedure btnValidarConsultaScriptClick(Sender: TObject);
    procedure pgRespuestasChange(Sender: TObject);

  private
    FSQL: String;
    FSQLCategoria: String;
    FSQLDespuesDe: String;
    FOrden: integer;
    FIdTema: Integer;
    FAltaRespuesta: Boolean;
    procedure FiltrarFraCategoriaPadre;
    procedure FiltrarFraDespuesDe;
    procedure HabilitarPCRespuestas;
    procedure AgregarRespuesta(AIdTema: Integer);
    procedure ModificarRespuesta(AIdRespuesta: Integer);
    procedure DarDeBajaRespuesta(AIdTema: Integer);
    function DebeHaberConsultaSQL: Boolean;
    procedure ReacomodarTemas(AIdVisita, ADesde, AHasta, AExcepto: Integer);
  public
    { Public declarations }
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCVT_VISITATEMA: TfrmManCVT_VISITATEMA;

implementation
uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal, unArt, Math, unGrids;

const
  EXIGE : Array[0..2] of String = ('S', 'N', 'O');

{$R *.dfm}

{ TfrmManCVT_VISITATEMA }

procedure TfrmManCVT_VISITATEMA.DarDeBajaRespuesta(AIdTema: Integer);
begin
  EjecutarSqlSTEx('UPDATE comercial.cvr_visitarespuesta ' +
                     'SET VR_USUBAJA = :idusuario, ' +
                         'VR_FECHABAJA = SYSDATE ' +
                   'WHERE VR_ID = :idrespuesta '
                   , [Sesion.UserID, sdqRespuestas.FieldByName('VR_ID').AsInteger]);
  OpenQueryEx(sdqRespuestas, [AIdTema]);
end;

function TfrmManCVT_VISITATEMA.DebeHaberConsultaSQL: Boolean;
begin
  //verifico que haya consulta, y que devuelva resultados
  OpenqueryEx(sdqConsultaSQL, [], edTD_SQL.Lines.Text);
  Result := (fraTipoRespuesta.Codigo = 'Q') and (sdqConsultaSQL.RecordCount = 0);
end;

function TfrmManCVT_VISITATEMA.DoABM: Boolean;
var
  iDesde, iHasta, iExcepto: Integer;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('VT_ID', sdqConsulta.FieldByName('VT_ID').AsInteger);
     Sql.Fields.Add('VT_FECHABAJA', exDate);
     Sql.Fields.Add('VT_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('VT_ID', ValorSQLInteger('SELECT NVL(MAX(VT_ID), 0) FROM COMERCIAL.CVT_VISITATEMA') + 1);
       Sql.Fields.Add('VT_FECHAALTA', exDate);
       Sql.Fields.Add('VT_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('VT_ID', sdqConsulta.FieldByName('VT_ID').AsInteger);
       Sql.Fields.Add('VT_FECHAMODIF', exDate);
       Sql.Fields.Add('VT_USUMODIF', Sesion.UserID);
       Sql.Fields.Add('VT_FECHABAJA', exNull);
       Sql.Fields.Add('VT_USUBAJA', exNull);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('VT_IDVISITA', fraVisita.Value);
     Sql.Fields.Add('VT_IDCATEGORIA', fraCategoria.Value, True);
     Sql.Fields.Add('VT_DESCRIPCION', edDescripcion.Text);
     Sql.Fields.Add('VT_TIPO', fraTipoRespuesta.Codigo);
     Sql.Fields.Add('VT_ORDEN', fraDespuesDe.sdqDatos.FieldByName('ORDEN').AsInteger + 1);
     Sql.Fields.Add('VT_RESPUESTASQL', edTD_SQL.Lines.Text);
     Sql.Fields.Add('VT_SCRIPT', amScriptTema.Lines.Text);
     Sql.Fields.Add('VT_ADJUNTO', EXIGE[rgGuardaAdjunto.ItemIndex]);
     Sql.Fields.Add('VT_OBSERVACIONES', EXIGE[rgGuardaObservaciones.ItemIndex]);
     Sql.Fields.Add('VT_IDTIPOEVENTO', fraNuevaTarea.Value, True);
     Sql.Fields.Add('VT_IDMOTIVOINGRESO', fraTC_IDMOTIVOINGRESO.Value, True);
     Sql.Fields.Add('VT_AYUDA', mAyuda.Text);

  end;

  BeginTrans(True);
  try
    Result := inherited DoABM;
    if modoAbm <> maBaja then
    begin
      iDesde := fraDespuesDe.sdqDatos.FieldByName('ORDEN').AsInteger;
      iHasta := FOrden;
      iExcepto := FIdTema;
      ReacomodarTemas(fraVisita.Value, iDesde, iHasta, iExcepto);
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

procedure TfrmManCVT_VISITATEMA.ReacomodarTemas(AIdVisita, ADesde, AHasta, AExcepto: Integer);
var
  sSQL: String;
  iId: Integer;
begin
  if ModoABM = maAlta then
  begin
    iId := ValorSqlInteger('SELECT NVL(MAX(VT_ID), 0) FROM COMERCIAL.CVT_VISITATEMA');
    sSQL := 'UPDATE COMERCIAL.CVT_VISITATEMA SET VT_ORDEN = VT_ORDEN + 1 WHERE VT_ORDEN > :DESDE AND VT_IDVISITA = :IDVISITA AND VT_ID <> :id';
    EjecutarSqlSTEx(sSQL, [ADesde, AIdVisita, iId]);
  end
  else
  if ModoABM = maModificacion then
    if ADesde < AHasta then
    begin
      sSQL := 'UPDATE COMERCIAL.CVT_VISITATEMA SET VT_ORDEN = VT_ORDEN + :VALOR WHERE VT_ID <> :id AND VT_IDVISITA = :IDVISITA AND ';
      sSQL := sSQL + ' VT_ORDEN > :DESDE AND VT_ORDEN < :HASTA';
      EjecutarSqlSTEx(sSQL, [Integer(iif(ADesde > AHasta, -1, 1)), AExcepto, AIdVisita, Integer(Min(ADesde, AHasta)), Integer(Max(ADesde, AHasta))]);
    end
    else
    begin
      sSQL := 'UPDATE COMERCIAL.CVT_VISITATEMA SET VT_ORDEN = VT_ORDEN + :VALOR WHERE 1 = 1 AND VT_IDVISITA = :IDVISITA AND ';
      sSQL := sSQL + ' VT_ORDEN > :DESDE AND VT_ORDEN <= :HASTA';
      EjecutarSqlSTEx(sSQL, [Integer(iif(ADesde > AHasta, -1, 1)), AIdVisita, Integer(Min(ADesde, AHasta)), Integer(Max(ADesde, AHasta))]);
      EjecutarSqlSTEx('UPDATE COMERCIAL.CVT_VISITATEMA SET VT_ORDEN = VT_ORDEN - 1 WHERE VT_ID = :id ', [AExcepto]);
    end;
end;

procedure TfrmManCVT_VISITATEMA.FiltrarFraCategoriaPadre;
begin
  if fraVisita.IsSelected then
    fraCategoria.Propiedades.Sql := FSQLCategoria + ' AND (IDVISITA = ' + SqlValue(fraVisita.Value) + ' OR IDVISITA = -1)'
  else
    fraCategoria.Propiedades.Sql := FSQLCategoria + ' AND 1 = 2 ';
end;

procedure TfrmManCVT_VISITATEMA.FiltrarFraDespuesDe;
begin
  if fraVisita.IsSelected then
  begin
    fraDespuesDe.Propiedades.Sql := FSQLDespuesDe + ' AND (IDVISITA = ' + SqlValue(fraVisita.Value) + ' OR IDVISITA = -1)';
    if modoABM = maModificacion then
      fraDespuesDe.Propiedades.Sql := fraDespuesDe.Propiedades.Sql + ' AND ID <> ' + SqlValue(sdqConsulta.FieldByName('VT_ID').AsInteger);
  end
  else
    fraDespuesDe.Propiedades.Sql := FSQLDespuesDe + ' AND 1 = 2 ';
end;

procedure TfrmManCVT_VISITATEMA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMERCIAL.CVT_VISITATEMA';
  FieldBaja := 'VT_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  FSQLCategoria := sdqCategoria.SQL.Text;
  fraTipoRespuesta.Propiedades.Sql := sdqTipo.SQL.Text;
  FSQLDespuesDe := sdqDespuesDe.SQL.Text;
  AutoColWidths := True;
end;

procedure TfrmManCVT_VISITATEMA.fpRespuestaShow(Sender: TObject);
begin
  edDescripcionRespuesta.SetFocus;
end;

procedure TfrmManCVT_VISITATEMA.fraDespuesDecmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  FiltrarFraDespuesDe;
  fraDespuesDe.cmbDescripcionDropDown(Sender);
end;

procedure TfrmManCVT_VISITATEMA.fraNuevaTareaPropiedadesChange(Sender: TObject);
begin
  fraTC_IDMOTIVOINGRESO.Propiedades.Sql := sdqMotivosDeIngreso.SQL.Text + ' AND idtipoevento = ' + SqlInteger(fraNuevaTarea.Id, True);
end;

procedure TfrmManCVT_VISITATEMA.fraTipoRespuestaPropiedadesChange(Sender: TObject);
begin
  if fraTipoRespuesta.IsSelected then
  begin
    if fraTipoRespuesta.Codigo = 'R' then
      pgRespuestas.ActivePage := tsListaDeRespuestas
    else
    if fraTipoRespuesta.Codigo = 'Q' then
      pgRespuestas.ActivePage := tsConsultaDinamica
  end;
  VCLExtra.LockControls([btnValidarConsultaRespuestas], not (fraTipoRespuesta.Codigo = 'Q'));
end;

procedure TfrmManCVT_VISITATEMA.fraVisitaPropiedadesChange(Sender: TObject);
begin
  FiltrarFraCategoriaPadre;
end;

procedure TfrmManCVT_VISITATEMA.GridRespuestasDblClick(Sender: TObject);
begin
  btnModificar.Click;
end;

procedure TfrmManCVT_VISITATEMA.GridRespuestasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqRespuestas.FieldByName('VR_FECHABAJA').IsNull then
  begin
    AFont.Color := clRed;
  end;
end;

procedure TfrmManCVT_VISITATEMA.HabilitarPCRespuestas;
var
  i: Integer;
begin
  for i:= 0 to pgRespuestas.PageCount - 1 do
    pgRespuestas.Pages[i].TabVisible := False;
  if fraTipoRespuesta.Codigo = 'Q' then
    pgRespuestas.Pages[1].TabVisible := True
  else
  if fraTipoRespuesta.Codigo = 'R' then
    pgRespuestas.Pages[0].TabVisible := True;
end;

procedure TfrmManCVT_VISITATEMA.AgregarRespuesta(AIdTema: Integer);
var
  sSql: String;
begin
  sSql := 'INSERT INTO comercial.cvr_visitarespuesta ' +
          '(VR_ID, VR_IDVISITA, VR_IDTEMA, VR_DESCRIPCION, VR_USUALTA, VR_FECHAALTA) ' +
          'VALUES ((SELECT NVL(MAX(VR_ID), 0) + 1 FROM COMERCIAL.CVR_VISITARESPUESTA) ,:idvisita, :idpregunta, :descripcion, :usuario, SYSDATE)';

  EjecutarSqlSTEx(sSql, [fraVisita.Value, AIdTema, edDescripcionRespuesta.Text, Sesion.UserID]);
  OpenQueryEx(sdqRespuestas, [AIdTema]);
end;

procedure TfrmManCVT_VISITATEMA.btnAceptarRespuestaClick(Sender: TObject);
begin
  Verificar(Trim(edDescripcionRespuesta.Text) = '', edDescripcionRespuesta, 'Debe completar la descripción.');
  fpRespuesta.ModalResult := mrOk;
end;

procedure TfrmManCVT_VISITATEMA.btnAgregarClick(Sender: TObject);
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
      FIdTema := Sql.PrimaryKey.FieldByName['VT_ID'].Value;
      FOrden := Sql.Fields.FieldByName['VT_ORDEN'].Value;
      RefreshData;
      VCLExtra.LockControls([fraVisita, fraTipoRespuesta], True);
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
    AgregarRespuesta(FIdTema);
end;

procedure TfrmManCVT_VISITATEMA.btnEliminarClick(Sender: TObject);
begin
  if MsgAsk('¿Desea dar de baja la respuesta seleccionada?') then
  begin
    BeginTrans(True);
    DarDeBajaRespuesta(sdqConsulta.FieldByName('VT_ID').AsInteger);
  end;
end;

procedure TfrmManCVT_VISITATEMA.btnModificarClick(Sender: TObject);
begin
  fpRespuesta.Caption := 'Modificar respuesta';
  edDescripcionRespuesta.Text := sdqRespuestas.FieldByName('VR_DESCRIPCION').AsString;
  BeginTrans(True);
  if fpRespuesta.ShowModal = mrOk then
    ModificarRespuesta(sdqRespuestas.FieldByName('VR_ID').AsInteger);
end;

procedure TfrmManCVT_VISITATEMA.btnValidarConsultaRespuestasClick(Sender: TObject);
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
    InfoHint(btnValidarConsultaRespuestas, 'La consulta es válida');

end;

procedure TfrmManCVT_VISITATEMA.btnValidarConsultaScriptClick(Sender: TObject);
var
  bAbortar: Boolean;
begin
  bAbortar := False;

    if (Trim(amScriptTema.Lines.Text) > '') then
      try
        CheckAndOpenQuery(sdqConsultaSQL, amScriptTema.Lines.Text);
      except
        InvalidMsg(amScriptTema, 'La consulta SQL no es válida.');
        bAbortar := True;
      end;

  if bAbortar then
    Abort
  else
    InfoHint(btnValidarConsultaScript, 'La consulta es válida');
end;

procedure TfrmManCVT_VISITATEMA.ClearControls;
var
  i: Integer;
begin
  ClearComponentData(fpAbm);
  FiltrarFraCategoriaPadre;
  VCLExtra.LockControls([fraVisita], False);
  pgRespuestas.ActivePage := tsListaDeRespuestas;
  edTD_SQL.Lines.Text := sdqEjemplo.SQL.Text;
  OpenQueryEx(sdqRespuestas, [-1]);
  VCLExtra.LockControls([fraTipoRespuesta], False);
  for i := 0 to 1 do
    pgRespuestas.Pages[i].TabVisible := True;
  rgGuardaAdjunto.ItemIndex := -1;
  rgGuardaObservaciones.ItemIndex := -1;
  rgAccion.ItemIndex := -1;
  VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
  amScriptTema.Clear;
end;

procedure TfrmManCVT_VISITATEMA.ClearData;
begin
  inherited;
  ClearComponentData(pnlFiltros);
end;

procedure TfrmManCVT_VISITATEMA.LoadControls;
begin
  fraVisita.Value := sdqConsulta.FieldByName('VT_IDVISITA').AsInteger;
  edDescripcion.Text := sdqConsulta.FieldByName('VT_DESCRIPCION').AsString;
  fraCategoria.Propiedades.ExtraCondition := ' AND (IDVISITA = ' + SqlValue(fraVisita.Value) + ' OR IDVISITA = -1)';
  FiltrarFraCategoriaPadre;
  fraCategoria.Codigo := sdqConsulta.FieldByName('IDCATEGORIA').AsString;
  fraTipoRespuesta.Codigo := sdqConsulta.FieldByName('VT_TIPO').AsString;
  FiltrarFraDespuesDe;
  fraDespuesDe.Codigo := sdqConsulta.FieldByName('IDDESPUESDE').AsString;
  fraTipoRespuestaPropiedadesChange(nil);
  edTD_SQL.Lines.Text := sdqConsulta.FieldByName('VT_RESPUESTASQL').AsString;
  amScriptTema.Lines.Text := sdqConsulta.FieldByName('VT_SCRIPT').AsString;
  OpenQueryEx(sdqRespuestas, [sdqConsulta.FieldByName('VT_ID').AsInteger]);
  VCLExtra.LockControls([fraVisita], True);
  VCLExtra.LockControls([fraTipoRespuesta], not sdqConsulta.FieldByName('VT_TIPO').IsNull);
  HabilitarPCRespuestas;
  FIdTema := sdqConsulta.FieldByName('VT_ID').AsInteger;
  FOrden := sdqConsulta.FieldByName('VT_ORDEN').AsInteger;
  rgGuardaAdjunto.ItemIndex := IIF(sdqConsulta.FieldByName('VT_ADJUNTO').AsString = EXIGE[0], 0, IIF(sdqConsulta.FieldByName('VT_ADJUNTO').AsString = EXIGE[1], 1, 2));
  rgGuardaObservaciones.ItemIndex := IIF(sdqConsulta.FieldByName('VT_OBSERVACIONES').AsString = EXIGE[0], 0, IIF(sdqConsulta.FieldByName('VT_OBSERVACIONES').AsString = EXIGE[1], 1, 2));
  fraNuevaTarea.Value := sdqConsulta.FieldByName('VT_IDTIPOEVENTO').AsInteger;
  fraNuevaTareaPropiedadesChange(nil);
  fraTC_IDMOTIVOINGRESO.Value := sdqConsulta.FieldByName('VT_IDMOTIVOINGRESO').AsInteger;
  mAyuda.Lines.Text := sdqConsulta.FieldByName('VT_AYUDA').AsString;
  rgAccion.ItemIndex := IIF(fraNuevaTarea.IsEmpty, 1, 0);
  VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], fraNuevaTarea.IsEmpty);
  VCLExtra.LockControls([btnValidarConsultaRespuestas], (sdqConsulta.FieldByName('VT_TIPO').AsString = 'R') and not sdqConsulta.FieldByName('VT_TIPO').IsNull);
end;

procedure TfrmManCVT_VISITATEMA.ModificarRespuesta(AIdRespuesta: Integer);
begin
  EjecutarSqlSTEx('UPDATE comercial.cvr_visitarespuesta ' +
                     'SET VR_DESCRIPCION = :descripcion, ' +
                         'VR_USUMODIF = :idusuario, ' +
                         'VR_FECHAMODIF = SYSDATE ' +
                   'WHERE VR_ID = :idrespuesta '
                   , [edDescripcionRespuesta.Text, Sesion.UserID, AIdRespuesta]);
  OpenQueryEx(sdqRespuestas, [FIdTema]);
end;

procedure TfrmManCVT_VISITATEMA.pgRespuestasChange(Sender: TObject);
begin
  case pgrespuestas.TabIndex of
    0: fraTipoRespuesta.Codigo := 'R';
    1: fraTipoRespuesta.Codigo := 'Q';
  end;
end;

procedure TfrmManCVT_VISITATEMA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManCVT_VISITATEMA.rgAccionClick(Sender: TObject);
begin
  if rgAccion.ItemIndex = 0 then
  begin
    VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], False);
  end
  else
  begin
    VCLExtra.LockControls([fraNuevaTarea, fraTC_IDMOTIVOINGRESO], True);
    fraNuevaTarea.Clear;
    fraTC_IDMOTIVOINGRESO.Clear;
  end;
end;

procedure TfrmManCVT_VISITATEMA.sdqRespuestasAfterOpen(DataSet: TDataSet);
var
  bEnabled: Boolean;
begin
  bEnabled := sdqRespuestas.Active and (sdqRespuestas.RecordCount > 0);
  btnModificar.Enabled := bEnabled;
  btnEliminar.Enabled := bEnabled;
end;

function TfrmManCVT_VISITATEMA.Validar: Boolean;
begin
  Verificar(fraVisita.IsEmpty, fraVisita, 'Debe seleccionar la visita.');
  Verificar(fraCategoria.IsEmpty, fraCategoria, 'Debe seleccionar la categoría.');
  Verificar(edDescripcion.Text = '', edDescripcion, 'Debe completar la descripción del tema.');
  Verificar(fraDespuesDe.IsEmpty, fraDespuesDe, 'Debe seleccionar un tema.');
  Verificar(rgGuardaAdjunto.ItemIndex < 0, rgGuardaAdjunto, 'Debe seleccionar una opción');
  Verificar(rgGuardaObservaciones.ItemIndex < 0, rgGuardaObservaciones, 'Debe seleccionar una opción');
  Verificar(rgAccion.ItemIndex = -1, rgAccion, 'Debe seleccionar una opción.');
  Verificar((rgAccion.ItemIndex = 0) and (fraNuevaTarea.IsEmpty), fraNuevaTarea, 'Debe seleccionar una tarea.');
  Verificar((rgAccion.ItemIndex = 0) and (fraTC_IDMOTIVOINGRESO.IsEmpty), fraTC_IDMOTIVOINGRESO, 'Debe seleccionar un motivo de ingreso.');
  //Verificar((fraTipoRespuesta.Codigo = 'R') and (GetNullCount(GridRespuestas, 'VR_FECHABAJA') = 0), GridRespuestas, 'Debe cargar al menos una respuesta');
  Verificar((pgRespuestas.ActivePage = tsConsultaDinamica) and (Trim(edTD_SQL.Lines.Text) = ''), edTD_SQL, 'Debe haber una consulta sql.');
  Verificar((pgRespuestas.ActivePage = tsConsultaDinamica) and DebeHaberConsultaSQL, edTD_SQL, 'La consulta SQL debe retornar resultados.');
  Result := True;
end;

end.
