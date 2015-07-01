unit unManCVS_VENTANILLA_SUBTEMAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, CheckLst, ARTCheckListBox, Mask,
  PatternEdit, IntEdit, RxPlacemnt;

type
  TfrmManCVS_VENTANILLA_SUBTEMAS = class(TfrmCustomGridABM)
    fraVT_ID: TfraCodDesc;
    Label1: TLabel;
    fraVentanilla: TfraCodDesc;
    Label2: TLabel;
    edVS_DESCRIPCION: TEdit;
    Label3: TLabel;
    sdqConsultaVT_ID: TFloatField;
    sdqConsultaVT_DESCRIPCION: TStringField;
    sdqConsultaVS_ID: TFloatField;
    sdqConsultaVS_DESCRIPCION: TStringField;
    sdqConsultaVS_IDTEMA: TFloatField;
    sdqConsultaVT_USUALTA: TStringField;
    sdqConsultaVT_FECHAALTA: TDateTimeField;
    sdqConsultaVT_USUMODIF: TStringField;
    sdqConsultaVT_FECHAMODIF: TDateTimeField;
    sdqConsultaVT_USUBAJA: TStringField;
    sdqConsultaVT_FECHABAJA: TDateTimeField;
    sdqConsultaVS_USUALTA: TStringField;
    sdqConsultaVS_FECHAALTA: TDateTimeField;
    sdqConsultaVS_USUMODIF: TStringField;
    sdqConsultaVS_FECHAMODIF: TDateTimeField;
    sdqConsultaVS_USUBAJA: TStringField;
    sdqConsultaVS_FECHABAJA: TDateTimeField;
    ShortCutControlHijo: TShortCutControl;
    clbTipoComunicacion: TARTCheckListBox;
    clbMotivosResolucion: TARTCheckListBox;
    Label4: TLabel;
    Label5: TLabel;
    pnlRight: TPanel;
    SplitterLateral: TSplitter;
    pnlTipoComunicacion: TPanel;
    pnlMotivoResolucion: TPanel;
    Label6: TLabel;
    clbTipoCom: TARTCheckListBox;
    Label7: TLabel;
    clbMotRes: TARTCheckListBox;
    TimerScroll: TTimer;
    rgVencimiento: TRadioGroup;
    rgFiltroVencimiento: TRadioGroup;
    Label8: TLabel;
    clbFiltroTipoComunicacion_NO_FILTRAR: TARTCheckListBox;
    Label9: TLabel;
    edDESCRIPCION_FULL_LIKE: TEdit;
    Label10: TLabel;
    edPlazo: TIntEdit;
    sdqConsultaDESCRIPCION: TStringField;
    sdqConsultaVS_PLAZOPREDETERMINADO: TFloatField;
    sdqConsultaVS_TIENEVENCIMIENTO: TStringField;
    rgContrato: TRadioGroup;
    rgSiniestro: TRadioGroup;
    sdqConsultaVS_CONTRATO: TStringField;
    sdqConsultaVS_SINIESTRO: TStringField;
    sdqConsultaTIPO_COMUNICACION: TStringField;
    sdqConsultaMOTIVO_RESOLUCION: TStringField;
    rgEstablecimiento: TRadioGroup;
    sdqConsultaVS_ESTABLECIMIENTO: TStringField;
    fpConfigurarRespuestasReporte: TFormPanel;
    Bevel1: TBevel;
    btnAceptarConfigurarRespuestasReporte: TButton;
    btnCancelarConfigurarRespuestasReporte: TButton;
    Panel1: TPanel;
    GridMotivos: TArtDBGrid;
    dsMotivosResolucion: TDataSource;
    sdqMotivosResolucion: TSDQuery;
    sdqMotivosResolucionVA_DESCRIPCION: TStringField;
    sdqMotivosResolucionVA_ID: TFloatField;
    tlbBarra: TToolBar;
    btnRefresh: TToolButton;
    ToolButton2: TToolButton;
    btnAgregar: TToolButton;
    btnModificar: TToolButton;
    btnEliminar: TToolButton;
    ToolButton12: TToolButton;
    fpOpciones: TFormPanel;
    Bevel2: TBevel;
    btnOpcionesAceptar: TButton;
    btnOpcionesCancelar: TButton;
    Panel2: TPanel;
    clbOpciones: TARTCheckListBox;
    sdqOpciones: TSDQuery;
    sdqBorrarOpciones: TSDQuery;
    sdqInsertarOpcion: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure TimerScrollTimer(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridMotivosDblClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnOpcionesAceptarClick(Sender: TObject);
  private
    FSQL, FSQLTipoComunicacion, FSQLMotivoResolucion: String;
    procedure ArmarContenidoCheckListbox(ACheckListBox: TARTCheckListBox; ASQL, APrefijo: String);
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManCVS_VENTANILLA_SUBTEMAS: TfrmManCVS_VENTANILLA_SUBTEMAS;

implementation

uses
  unSesion, AnsiSql, SqlFuncs, VCLExtra, General, unFiltros, CustomDlgs,
  unDmPrincipal;

{$R *.dfm}

{ TfrmManCVS_VENTANILLA_SUBTEMAS }

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.btnModificarClick(Sender: TObject);
begin
  clbOpciones.ClearChecks;
  OpenQueryEx(sdqOpciones, [sdqMotivosResolucion.FieldByName('VA_ID').AsInteger]);
  while not sdqOpciones.Eof do
  begin
    clbOpciones.Check(sdqOpciones.FieldByName('VL_IDOPCION').AsString);
    sdqOpciones.Next;
  end;
  fpOpciones.ShowModal;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.btnOpcionesAceptarClick(Sender: TObject);
var
  i: Integer;
begin
//  BeginTrans(True);
//  try
//    //borrar las opc. anterirores para ese articulo
//    EjecutarSqlSTEx(sdqBorrarOpciones.SQL.Text, [sdqMotivosResolucion.FieldByName('VA_ID').AsInteger]);
//    //guardar las opc. nuevas para ese articulo
//    for i := 0 to clbOpciones.Items.Count - 1 do
//      if clbOpciones.Checked[i] then
//        EjecutarSqlSTEx(sdqInsertarOpcion.SQL.Text, [sdqMotivosResolucion.FieldByName('VA_ID').AsInteger, i + 1]);
//    CommitTrans(True);
//  except
//    RollBack;
//  end;

  BeginTrans(True);
  try
    //borrar las opc. anterirores para ese articulo
    EjecutarSqlSTEx(sdqBorrarOpciones.SQL.Text, [sdqMotivosResolucion.FieldByName('VA_ID').AsInteger]);
    //guardar las opc. nuevas para ese articulo
    for i := 0 to clbOpciones.ValuesChecked.Count - 1 do
      EjecutarSqlSTEx(sdqInsertarOpcion.SQL.Text, [sdqMotivosResolucion.FieldByName('VA_ID').AsInteger, clbOpciones.ValuesChecked[i]]);

    CommitTrans(True);
  except
    RollBack;
  end;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.ClearControls;
begin
  inherited;
  ClearComponentData(fpAbm);
  clbMotRes.ClearChecks;
  clbTipoCom.ClearChecks;
  rgVencimiento.ItemIndex := -1;
  rgContrato.ItemIndex := -1;
  rgSiniestro.ItemIndex := -1;
  rgEstablecimiento.ItemIndex := -1;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.ClearData;
begin
  ClearComponentData(pnlFiltros);
  inherited;  
end;

function TfrmManCVS_VENTANILLA_SUBTEMAS.DoABM: Boolean;
var
  sSQL: String;
  IdTabla, i: Integer;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('VS_ID', sdqConsulta.FieldByName('VS_ID').AsInteger);
     Sql.Fields.Add('VS_FECHABAJA', exDate);
     Sql.Fields.Add('VS_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddInteger('VS_ID', ValorSQLInteger('SELECT NVL(MAX(VS_ID), 0) FROM COMUNES.CVS_VENTANILLA_SUBTEMAS') + 1);
       Sql.Fields.Add('VS_FECHAALTA', exDate);
       Sql.Fields.Add('VS_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('VS_ID', sdqConsulta.FieldByName('VS_ID').AsInteger);
       Sql.Fields.Add('VS_FECHAMODIF', exDate);
       Sql.Fields.Add('VS_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('VS_IDTEMA', fraVentanilla.ID);
     Sql.Fields.Add('VS_DESCRIPCION', edVS_DESCRIPCION.Text);
     Sql.Fields.Add('VS_CONTRATO', String(IIF(rgContrato.ItemIndex = 0, 'S', IIF(rgContrato.ItemIndex = 1, 'N', 'X'))));
     Sql.Fields.Add('VS_SINIESTRO', String(IIF(rgSiniestro.ItemIndex = 0, 'S', IIF(rgSiniestro.ItemIndex = 1, 'N', 'X'))));
     Sql.Fields.Add('VS_ESTABLECIMIENTO', String(IIF(rgEstablecimiento.ItemIndex = 0, 'S', IIF(rgEstablecimiento.ItemIndex = 1, 'N', 'X'))));
     Sql.Fields.Add('VS_TIENEVENCIMIENTO', String(IIF(rgVencimiento.ItemIndex = 0, 'S', 'N')));
     Sql.Fields.Add('VS_PLAZOPREDETERMINADO', edPlazo.Value);
  end;

  Result := inherited DoABM;

  IdTabla := Sql.PrimaryKey.FieldByName['VS_ID'].Value;

  {********* TIPO DE COMUNICACIÓN *********}
    
  sSQL := FSQLTipoComunicacion;
  AddCondition(sSQL, ' VU_IDSUBTEMA = :ID ');
  AddCondition(sSQL, ' VU_FECHABAJA IS NULL ');

  with GetQueryEx(sSQL, [IdTabla]) do
  try
    while not Eof do
    begin
      if clbTipoComunicacion.ItemsChecked.IndexOf(Fields[0].AsString) = -1 then
        EjecutarSQLSTEx('UPDATE comunes.cvu_ventanilla_subtema_tipo ' +
                           'SET vu_usubaja = :usuario, ' +
                               'vu_fechabaja = SYSDATE ' +
                         'WHERE vu_idsubtema = :id ' +
                           'AND vu_idtipo = :idtipo ' +
                           'AND vu_fechabaja IS NULL', [Sesion.UserID, IdTabla, Fields[1].AsInteger]);
      Next;
    end;

    for i := 0 to clbTipoComunicacion.ValuesChecked.Count - 1 do
      if not Locate('VP_ID', clbTipoComunicacion.ValuesChecked[i], []) then
        EjecutarSQLSTEx('INSERT INTO comunes.cvu_ventanilla_subtema_tipo ' +
                        ' (vu_id, vu_idsubtema, vu_idtipo, vu_usualta, vu_fechaalta) ' +
                        ' VALUES ' +
                        ' ((SELECT NVL (MAX (vu_id), 0) + 1 FROM comunes.cvu_ventanilla_subtema_tipo), :id, :idtipo, :usuario, SYSDATE) ',
                        [IdTabla, clbTipoComunicacion.ValuesChecked[i], Sesion.UserID]);
  finally
    Free;
  end;

  {********* MOTIVO DE RESOLUCIÓN *********}

  sSQL := FSQLMotivoResolucion;
  AddCondition(sSQL, ' VI_IDSUBTEMA = :ID ');
  AddCondition(sSQL, ' VI_FECHABAJA IS NULL ');

  with GetQueryEx(sSQL, [IdTabla]) do
  try
    while not Eof do
    begin
      if clbMotivosResolucion.ItemsChecked.IndexOf(Fields[0].AsString) = -1 then
        EjecutarSQLSTEx('UPDATE comunes.cvi_ventanilla_subtema_arti ' +
                           'SET vi_usubaja = :usuario, ' +
                               'vi_fechabaja = SYSDATE ' +
                         'WHERE vi_idsubtema = :id ' +
                           'AND vi_idarticulo = :idarticulo ' +
                           'AND vi_fechabaja IS NULL', [Sesion.UserID, IdTabla, Fields[1].AsInteger]);
      Next;
    end;

    for i := 0 to clbMotivosResolucion.ValuesChecked.Count - 1 do
      if not Locate('VA_ID', clbMotivosResolucion.ValuesChecked[i], []) then
        EjecutarSQLSTEx('INSERT INTO comunes.cvi_ventanilla_subtema_arti ' +
                        ' (vi_id, vi_idsubtema, vi_idarticulo, vi_usualta, vi_fechaalta) ' +
                        ' VALUES ' +
                        ' ((SELECT NVL (MAX (vi_id), 0) + 1 FROM comunes.cvi_ventanilla_subtema_arti), :id, :idarticulo, :usuario, SYSDATE) ',
                        [IdTabla, clbMotivosResolucion.ValuesChecked[i], Sesion.UserID]);
  finally
    Free;
  end;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.LoadControls;
var
  sSQL: String;
begin
  fraVentanilla.Codigo := sdqConsulta.FieldByName('VS_IDTEMA').AsString;
  edVS_DESCRIPCION.Text := sdqConsulta.FieldByName('VS_DESCRIPCION').AsString;
  edPlazo.Text := sdqConsulta.FieldByName('VS_PLAZOPREDETERMINADO').AsString;
  rgVencimiento.ItemIndex := IIF(sdqConsulta.FieldByName('VS_TIENEVENCIMIENTO').AsString = 'S', 0, 1);
  rgContrato.ItemIndex := IIF(sdqConsulta.FieldByName('VS_CONTRATO').AsString = 'S', 0, IIF(sdqConsulta.FieldByName('VS_CONTRATO').AsString = 'N', 1, 2));
  rgSiniestro.ItemIndex := IIF(sdqConsulta.FieldByName('VS_SINIESTRO').AsString = 'S', 0, IIF(sdqConsulta.FieldByName('VS_SINIESTRO').AsString = 'N', 1, 2));
  rgEstablecimiento.ItemIndex := IIF(sdqConsulta.FieldByName('VS_ESTABLECIMIENTO').AsString = 'S', 0, IIF(sdqConsulta.FieldByName('VS_ESTABLECIMIENTO').AsString = 'N', 1, 2));
  {********* TIPO DE COMUNICACIÓN *********}

  clbTipoComunicacion.ClearChecks;
  clbTipoComunicacion.SQL := FSQLTipoComunicacion;

  sSQL := FSQLTipoComunicacion;
  AddCondition(sSQL, ' VU_FECHABAJA IS NULL ');
  AddCondition(sSQL, ' VU_IDSUBTEMA = :ID ');

  with GetQueryEx(sSQL, [sdqConsulta.FieldByName('VS_ID').AsInteger]) do
  try
    while not Eof do
    begin
      clbTipoComunicacion.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;

  {********* MOTIVO DE RESOLUCIÓN *********}

  clbMotivosResolucion.ClearChecks;
  clbMotivosResolucion.SQL := FSQLMotivoResolucion;

  sSQL := FSQLMotivoResolucion;
  AddCondition(sSQL, ' VI_FECHABAJA IS NULL ');
  AddCondition(sSQL, ' VI_IDSUBTEMA = :ID ');

  with GetQueryEx(sSQL, [sdqConsulta.FieldByName('VS_ID').AsInteger]) do
  try
    while not Eof do
    begin
      clbMotivosResolucion.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.RefreshData;
var
  sWhere: String;
begin
  sWhere := ' AND EXISTS(SELECT 1 FROM comunes.cvu_ventanilla_subtema_tipo WHERE vu_idsubtema = vs_id  ' + clbFiltroTipoComunicacion_NO_FILTRAR.InSQL_IntegerValues('vu_idtipo', clbFiltroTipoComunicacion_NO_FILTRAR.CheckCount = 0) + ')';

  case rgFiltroVencimiento.ItemIndex of
    1: sWhere := sWhere + ' AND VS_TIENEVENCIMIENTO = ''S'' ';
    2: sWhere := sWhere + ' AND VS_TIENEVENCIMIENTO = ''N'' ';
  end;

  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + sWhere + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManCVS_VENTANILLA_SUBTEMAS.Validar: Boolean;
begin
  Verificar(fraVentanilla.IsEmpty, fraVentanilla.edCodigo, 'Debe seleccionar la ventanilla.');
  Verificar(Trim(edVS_DESCRIPCION.Text) = '', edVS_DESCRIPCION, 'Debe completar la descripción.');
  Verificar(clbTipoComunicacion.CheckCount = 0, clbTipoComunicacion, 'Es conveniente que el motivo tenga algún tipo de comunicación seleccionado.');

  Verificar((rgContrato.ItemIndex = -1), rgContrato, 'Debe indicar si exige o no contrato, o es no visible.');
  Verificar((rgSiniestro.ItemIndex = -1), rgSiniestro, 'Debe indicar si exige o no siniestro, o es no visible.');
  Verificar((rgEstablecimiento.ItemIndex = -1), rgEstablecimiento, 'Debe indicar si exige o no establecimiento, o es no visible.');

  Verificar((rgContrato.ItemIndex = 1) and (rgSiniestro.ItemIndex = 0), rgContrato, 'Si exige siniestro debe también exigir contrato.');
  Verificar((rgContrato.ItemIndex = 1) and (rgEstablecimiento.ItemIndex = 0), rgContrato, 'Si exige establecimiento debe también exigir contrato.');

  Verificar((rgContrato.ItemIndex = 2) and (rgSiniestro.ItemIndex <> 2), rgContrato, 'Si puede haber siniestro el contrato debe al menos mostrarse.');
  Verificar((rgContrato.ItemIndex = 2) and (rgEstablecimiento.ItemIndex <> 2), rgContrato, 'Si puede haber establecimiento el contrato debe al menos mostrarse.');

  Verificar((rgVencimiento.ItemIndex = -1), rgVencimiento, 'Debe indicar si tiene o no vencimiento.');
  Verificar((rgVencimiento.ItemIndex = 0) and (edPlazo.Value = 0), edPlazo, 'Si tiene vencimiento debería indicar el plazo predeterminado del mismo.');
  Verificar((rgVencimiento.ItemIndex = 1) and (edPlazo.Value > 0), edPlazo, 'Si no tiene vencimiento tampoco debería tener plazo.');
  Result := True;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'COMUNES.CVS_VENTANILLA_SUBTEMAS';
  FieldBaja := 'VS_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;

  FSQLTipoComunicacion := 'SELECT DISTINCT VP_DESCRIPCION, VP_ID ' +
                            'FROM COMUNES.CVP_VENTANILLA_TIPO, COMUNES.CVU_VENTANILLA_SUBTEMA_TIPO ' +
                           'WHERE VP_ID = VU_IDTIPO(+) ' +
                             'AND VU_FECHABAJA IS NULL ' +
                        'ORDER BY VP_DESCRIPCION';
  FSQLMotivoResolucion := 'SELECT DISTINCT VA_DESCRIPCION, VA_ID ' +
                            'FROM COMUNES.CVA_VENTANILLA_ARTICULOS, COMUNES.CVI_VENTANILLA_SUBTEMA_ARTI ' +
                           'WHERE VA_ID = VI_IDARTICULO(+) ' +
                             'AND VI_FECHABAJA IS NULL ' +
                        'ORDER BY VA_DESCRIPCION';

  VCLExtra.LockControls([clbMotRes, clbTipoCom], True);
  clbMotRes.DisableItems;
  clbTipoCom.DisableItems;

  sdqMotivosResolucion.Open;
  tbPropiedades.Visible := AreIn(Sesion.Sector, ['COMPUTOS']);
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.GridMotivosDblClick(Sender: TObject);
begin
  btnModificar.Click;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.SeguridadAfterExecute(Sender: TObject);
begin
  inherited;
  tbNuevo.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbNuevo);
  tbModificar.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbModificar);
  tbEliminar.Enabled := (Sesion.Sector = 'COMPUTOS') or Seguridad.Activar(tbEliminar);
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.tbPropiedadesClick(Sender: TObject);
begin
  clbOpciones.SQL := 'SELECT VO_DESCRIPCION, VO_ID FROM COMUNES.cvo_ventanilla_opciones_lst ORDER BY VO_ID';
  fpConfigurarRespuestasReporte.ShowModal;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid, 50);
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  clbTipoCom.ClearChecks;
  clbMotRes.ClearChecks;
  TimerScroll.Enabled := False;
  TimerScroll.Enabled := True;  
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.ArmarContenidoCheckListbox(ACheckListBox: TARTCheckListBox; ASQL, APrefijo: String);
var
  sSQL: String;
begin
  ACheckListBox.ClearChecks;
  ACheckListBox.SQL := ASQL;

  sSQL := ASQL;
  AddCondition(sSQL, APrefijo + 'FECHABAJA IS NULL ');
  AddCondition(sSQL, APrefijo + 'IDSUBTEMA = :ID ');

  with QuickGetQueryEx(sSQL, [sdqConsulta.FieldByName('VS_ID').AsInteger]) do
  try
    while not Eof do
    begin
      ACheckListBox.Check(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManCVS_VENTANILLA_SUBTEMAS.TimerScrollTimer(Sender: TObject);
begin
  TimerScroll.Enabled := False;
  ArmarContenidoCheckListbox(clbTipoCom, FSQLTipoComunicacion, 'VU_');
  ArmarContenidoCheckListbox(clbMotRes, FSQLMotivoResolucion, 'VI_');
end;

end.
