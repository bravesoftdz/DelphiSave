unit unRemitoSolicitudesCargadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, Menus;

type
  TfrmRemitoSolicitudesCargadas = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edFechaEmisionDesde: TDateComboBox;
    Label1: TLabel;
    edFechaEmisionHasta: TDateComboBox;
    popupGrilla: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    GroupBox2: TGroupBox;
    checkSolNoImpresa: TCheckBox;
    GroupBox3: TGroupBox;
    checkCotizacionRevision: TCheckBox;
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    FFiltrarSeleccionados: Boolean;
    FIdRemito: Integer;
    FRegistrosSeleccionados: TStringList;

    function ExisteSolicitudConRemito: Boolean;

    procedure GuardarRemito;
    procedure MostrarCamposImpresion(const aMostrar: Boolean);
  protected
    procedure ClearData; override;
    procedure RefreshData; override;
  public
  end;

var
  frmRemitoSolicitudesCargadas: TfrmRemitoSolicitudesCargadas;

implementation

uses
  unFiltros, unDmPrincipal, unSesion, General, AnsiSql, CustomDlgs;

{$R *.dfm}

function TfrmRemitoSolicitudesCargadas.ExisteSolicitudConRemito: Boolean;
var
  iLoop: Integer;
begin
  Result := False;

  sdqConsulta.DisableControls;
  try
    for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
    begin
      sdqConsulta.First;
      if not sdqConsulta.Locate('id', FRegistrosSeleccionados[iLoop], []) then
        MsgBox(Format('Posible error en registro nº %s.', [FRegistrosSeleccionados[iLoop]]));

      if not sdqConsulta.FieldByName('fecharemito').IsNull then
      begin
        Result := True;
        Exit;
      end;
    end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmRemitoSolicitudesCargadas.ClearData;
begin
  edFechaEmisionDesde.Clear;
  edFechaEmisionHasta.Clear;
  checkSolNoImpresa.Checked := True;
  checkCotizacionRevision.Checked := True;

  mnuDesmarcarTodosClick(nil);
end;

procedure TfrmRemitoSolicitudesCargadas.GuardarRemito;
var
  iLoop: Integer;
  sSql: String;
begin
  sdqConsulta.DisableControls;
  try
    BeginTrans;
    try
      // Guardo la impresión del remito..
      sSql :=
        'INSERT INTO afi.aro_remitossolicitudescargadas' +
                   ' (ro_usuemision, ro_fechaemision)' +
            ' VALUES (:usuario, SYSDATE)';
      EjecutarSqlSTEx(sSql, [Sesion.UserID]);

      sSql :=
        'SELECT MAX(ro_id)' +
         ' FROM afi.aro_remitossolicitudescargadas' +
        ' WHERE ro_usuemision = :usuario';
      FIdRemito := ValorSqlEx(sSql, [Sesion.UserID]);

      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      begin
        sdqConsulta.First;
        if not sdqConsulta.Locate('id', FRegistrosSeleccionados[iLoop], []) then
          MsgBox(Format('Posible error en registro nº %s.', [FRegistrosSeleccionados[iLoop]]));

        if Copy(FRegistrosSeleccionados[iLoop], 1, 1) = '6' then    // Si es una cotización..
        begin
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_idremito = :idremito' +
            ' WHERE sc_nrosolicitud = :nrosolicitud';
          EjecutarSqlSTEx(sSql, [FIdRemito, sdqConsulta.FieldByName('numerosolicitud').AsInteger]);
        end;

        if Copy(FRegistrosSeleccionados[iLoop], 1, 1) = '7' then    // Si es una revisión de precio..
        begin
          sSql :=
            'UPDATE asr_solicitudreafiliacion' +
              ' SET sr_idremito = :idremito' +
            ' WHERE sr_nrosolicitud = :nrosolicitud';
          EjecutarSqlSTEx(sSql, [FIdRemito, sdqConsulta.FieldByName('numeroreafiliacion').AsInteger]);
        end;

        if Copy(FRegistrosSeleccionados[iLoop], 1, 1) = '6' then    // Si es una cotización..
        begin
          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('id').AsInteger]);
        end;
      end;
      CommitTrans;
    except
      on E:Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmRemitoSolicitudesCargadas.MostrarCamposImpresion(const aMostrar: Boolean);
begin
  with Grid do
  begin
    ColumnByField['checkbox'].Visible        := not aMostrar;
    ColumnByField['fechaaprobacion'].Visible := not aMostrar;
    ColumnByField['fecharemito'].Visible     := not aMostrar;
    ColumnByField['usuarioremito'].Visible   := not aMostrar;

    ColumnByField['cod_actividad'].Visible      := True;
    ColumnByField['contrato'].Visible           := True;
    ColumnByField['cuit'].Visible               := True;
    ColumnByField['desc_actividad'].Visible     := True;
    ColumnByField['estadocontrato'].Visible     := True;
    ColumnByField['estadosolicitudafi'].Visible := True;
    ColumnByField['fechaimpresion'].Visible     := True;
    ColumnByField['masatotal'].Visible          := True;
    ColumnByField['numerocotizacion'].Visible   := True;
    ColumnByField['numeroreafiliacion'].Visible := True;
    ColumnByField['numerosolicitud'].Visible    := True;
    ColumnByField['razonsocial'].Visible        := True;
    ColumnByField['sa_nrointerno'].Visible      := True;
    ColumnByField['totempleados'].Visible       := True;
  end;
end;

procedure TfrmRemitoSolicitudesCargadas.RefreshData;
var
  sSql: String;
  sWhere1: String;
  sWhere2: String;
begin
  sWhere1 := '';
  sWhere2 := '';

  sSql :=
    'SELECT cod_actividad, desc_actividad, NULL checkbox, contrato, art.utiles.armar_cuit(cuit) cuit, estadocontrato,' +
          ' estadosolicitudafi, fechaaprobacion, fechaimpresion, fecharecepcionafi, fecharemito, ID, numerosolicitud,' +
          ' numerocotizacion, numeroreafiliacion, razonsocial, masatotal, totempleados, sa_nrointerno, usuarioremito' +
     ' FROM (SELECT NVL(ac_s.ac_codigo, ac_c.ac_codigo) AS cod_actividad,' +
                  ' NVL(ac_s.ac_descripcion, ac_c.ac_descripcion) AS desc_actividad, co_contrato AS contrato,' +
                  ' NVL(co_cuit, sc_cuit) cuit, est_c.tb_descripcion estadocontrato,' +
                  ' est_s.tb_descripcion estadosolicitudafi, fo_fechaalta fechaaprobacion,' +
                  ' art.actualdate fechaimpresion, sa_fecharecepcionsectorafi fecharecepcionafi,' +
                  ' ro_fechaemision fecharemito, art.utiles.pad(sc_nrosolicitud, 7, ''6000000'', ''L'') id,' +
                  ' sc_nrosolicitud numerosolicitud, co_nrocotizacion || ''/'' || co_orden numerocotizacion,' +
                  ' NULL numeroreafiliacion, NVL(co_razonsocial, sc_razonsocial) razonsocial,' +
                  ' NVL(sa_masatotal, co_masatotal) masatotal, NVL(sa_totempleados, co_totempleados) totempleados,' +
                  ' sa_nrointerno, ro_usuemision usuarioremito,' +
                  ' CASE' +
                    ' WHEN co_contrato IS NULL THEN CASE' +
                                                   ' WHEN sa_fecharecepcionsectorafi IS NOT NULL THEN ''S''' +
                                                   ' ELSE ''N''' +
                                                 ' END' +
                    ' ELSE ''S''' +
                  ' END AS mostrar' +
             ' FROM asc_solicitudcotizacion JOIN afo_formulario ON fo_id = sc_idformulario' +
                  ' LEFT JOIN aco_cotizacion a ON co_id = sc_idcotizacion' +
                  ' LEFT JOIN afi.aro_remitossolicitudescargadas ON ro_id = sc_idremito' +
                  ' LEFT JOIN asa_solicitudafiliacion ON sa_idformulario = sc_idformulario' +
                                                  ' AND sa_fecharecepcionsectorafi IS NOT NULL' +
                  ' LEFT JOIN aco_contrato b ON co_idformulario = sc_idformulario' +
                  ' LEFT JOIN art.ctb_tablas est_c ON est_c.tb_clave = ''AFEST''' +
                                               ' AND est_c.tb_codigo = b.co_estado' +
                  ' LEFT JOIN cac_actividad ac_c ON ac_c.ac_id = b.co_idactividad' +
                  ' LEFT JOIN cac_actividad ac_s ON ac_s.ac_id = sa_idactividad' +
                  ' LEFT JOIN art.ctb_tablas est_s ON est_s.tb_clave = ''ESSOL''' +
                                               ' AND est_s.tb_codigo = sa_estado' +
            ' WHERE 1 = 1 %s' +
           ' UNION ALL' +
           ' SELECT ac_codigo, ac_descripcion, co_contrato, sr_cuit cuit, est_c.tb_descripcion estadocontrato,' +
                  ' est_s.tb_descripcion estadosolicitudafi, fo_fechaalta fechaaprobacion,' +
                  ' art.actualdate fechaimpresion, sa_fecharecepcionsectorafi fecharecepcionafi,' +
                  ' ro_fechaemision fecharemito, art.utiles.pad(sr_nrosolicitud, 7, ''7000000'', ''L'') id,' +
                  ' NULL numerosolicitud, NULL numerocotizacion, sr_nrosolicitud numeroreafiliacion,' +
                  ' em_nombre razonsocial, NVL(sa_masatotal, co_masatotal), NVL(sa_totempleados, co_totempleados),' +
                  ' sa_nrointerno, ro_usuemision usuarioremito,' +
                  ' CASE' +
                    ' WHEN co_contrato IS NULL THEN CASE' +
                                                   ' WHEN sa_fecharecepcionsectorafi IS NOT NULL THEN ''S''' +
                                                   ' ELSE ''N''' +
                                                 ' END' +
                    ' ELSE ''S''' +
                  ' END AS mostrar' +
             ' FROM art.asr_solicitudreafiliacion LEFT JOIN afo_formulario ON fo_id = sr_idformulario' +
                  ' LEFT JOIN afi.aro_remitossolicitudescargadas ON ro_id = sr_idremito' +
                  ' LEFT JOIN asa_solicitudafiliacion ON sa_idformulario = sr_idformulario' +
                                                  ' AND sa_fecharecepcionsectorafi IS NOT NULL' +
                  ' LEFT JOIN aco_contrato ON co_idformulario = sr_idformulario' +
                  ' LEFT JOIN aem_empresa ON em_id = co_idempresa' +
                  ' LEFT JOIN art.ctb_tablas est_c ON est_c.tb_clave = ''AFEST''' +
                                               ' AND est_c.tb_codigo = co_estado' +
                  ' LEFT JOIN cac_actividad ON ac_id = sr_idactividad1' +
                  ' LEFT JOIN art.ctb_tablas est_s ON est_s.tb_clave = ''ESSOL''' +
                                               ' AND est_s.tb_codigo = sa_estado' +
            ' WHERE 1 = 1 %s)' +
    ' WHERE mostrar = ''S''';

  if FFiltrarSeleccionados then
    sSql := sSql + ' AND id IN (' + FRegistrosSeleccionados.CommaText + ')'
  else
  begin
    if edFechaEmisionDesde.Date > 0 then
    begin
      sWhere1 := sWhere1 + DoFiltroComponente(edFechaEmisionDesde, 'fo_fechaalta', '>=');
      sWhere2 := sWhere2 + DoFiltroComponente(edFechaEmisionDesde, 'fo_fechaalta', '>=');
    end;

    if edFechaEmisionHasta.Date > 0 then
    begin
      sWhere1 := sWhere1 + DoFiltroComponente(edFechaEmisionHasta, 'fo_fechaalta', '<=');
      sWhere2 := sWhere2 + DoFiltroComponente(edFechaEmisionHasta, 'fo_fechaalta', '<=');
    end;

    if checkSolNoImpresa.Checked then
    begin
      sWhere1 := sWhere1 + ' AND ro_fechaemision IS NULL';
      sWhere2 := sWhere2 + ' AND ro_fechaemision IS NULL';
    end;

    if checkCotizacionRevision.Checked then
    begin
      sWhere1 := sWhere1 + ' AND co_nrocotizacion IS NOT NULL';
      sWhere2 := sWhere2 + ' AND sr_nrosolicitud IS NOT NULL';
    end;
  end;

  sSql := Format(sSql, [sWhere1, sWhere2]);

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CheckButtons;
end;


procedure TfrmRemitoSolicitudesCargadas.GridCellClick(Column: TColumn);
begin
  with sdqConsulta do
    if (Active) and (not IsEmpty) and (UpperCase(Column.FieldName) = 'CHECKBOX') then
    begin
      if FRegistrosSeleccionados.IndexOf(FieldByName('id').AsString) > -1 then
        FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(FieldByName('id').AsString))
      else
        FRegistrosSeleccionados.Add(FieldByName('id').AsString);
      Grid.Repaint;
    end;
end;

procedure TfrmRemitoSolicitudesCargadas.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                           Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('id').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmRemitoSolicitudesCargadas.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['checkbox']);
end;

procedure TfrmRemitoSolicitudesCargadas.FormCreate(Sender: TObject);
begin
  inherited;

  FIdRemito := -1;
  FRegistrosSeleccionados := TStringList.Create;

  MostrarCamposImpresion(False);
end;

procedure TfrmRemitoSolicitudesCargadas.tbRefrescarClick(Sender: TObject);
begin
  FFiltrarSeleccionados := False;
  FRegistrosSeleccionados.Clear;

  inherited;  
end;

procedure TfrmRemitoSolicitudesCargadas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados.Clear;
end;

procedure TfrmRemitoSolicitudesCargadas.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;

  if FRegistrosSeleccionados.IndexOf(sdqConsulta.FieldByName('id').AsString) > -1 then
    BackGround := TColor($C0DCC0)//clMoneyGreen
  else
    BackGround := clWhite;
end;

procedure TfrmRemitoSolicitudesCargadas.mnuMarcarTodosClick(Sender: TObject);
var
  aMetodo: TDataSetNotifyEvent;
  aPointer: TBookMark;
begin
  aMetodo := sdqConsulta.AfterScroll;
  sdqConsulta.AfterScroll := nil;
  aPointer := sdqConsulta.GetBookmark;

  FRegistrosSeleccionados.Clear;

  with sdqConsulta do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(sdqConsulta.FieldByName('id').AsString);
      Next;
    end;
  finally
    sdqConsulta.AfterScroll := aMetodo;
    GotoBookmark(aPointer);
    EnableControls;
  end;
end;

procedure TfrmRemitoSolicitudesCargadas.mnuDesmarcarTodosClick(Sender: TObject);
begin
  FRegistrosSeleccionados.Clear;
  Grid.Repaint;
end;

procedure TfrmRemitoSolicitudesCargadas.FSFormDestroy(Sender: TObject);
begin
  inherited;

  FRegistrosSeleccionados.Free;
end;

procedure TfrmRemitoSolicitudesCargadas.tbImprimirClick(Sender: TObject);
begin
  Verificar((FRegistrosSeleccionados.Count = 0), nil, 'Debe seleccionar algún registro para imprimir.');
  Verificar(ExisteSolicitudConRemito, nil, 'No puede imprimir solicitudes que ya tengan un remito asociado.');

  // Primero guardo el remito y despues imprimo los registros..
  GuardarRemito;

  FFiltrarSeleccionados := True;
  try
    QueryPrint.SubTitle.Text := Format('Remito Nº %d', [FIdRemito]);
    MostrarCamposImpresion(True);
    RefreshData;
    inherited;
  finally
    FFiltrarSeleccionados := False;
    FRegistrosSeleccionados.Clear;
    MostrarCamposImpresion(False);
    RefreshData;
  end;
end;

procedure TfrmRemitoSolicitudesCargadas.tbPropiedadesClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  sdqConsulta.DisableControls;
  try
    BeginTrans;
    try
      for iLoop := 0 to FRegistrosSeleccionados.Count - 1 do
      begin
        sdqConsulta.First;
        if not sdqConsulta.Locate('id', FRegistrosSeleccionados[iLoop], []) then
          MsgBox(Format('Posible error en registro nº %s.', [FRegistrosSeleccionados[iLoop]]));

        if Copy(FRegistrosSeleccionados[iLoop], 1, 1) = '6' then    // Si es una cotización..
        begin
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_idremito = NULL' +
            ' WHERE sc_nrosolicitud = :nrosolicitud';
          EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('numerosolicitud').AsInteger]);
        end;

        if Copy(FRegistrosSeleccionados[iLoop], 1, 1) = '7' then    // Si es una revisión de precio..
        begin
          sSql :=
            'UPDATE asr_solicitudreafiliacion' +
              ' SET sr_idremito = NULL' +
            ' WHERE sr_nrosolicitud = :nrosolicitud';
          EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('numeroreafiliacion').AsInteger]);
        end;

        if Copy(FRegistrosSeleccionados[iLoop], 1, 1) = '6' then    // Si es una cotización..
        begin
          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('id').AsInteger]);
        end;
      end;
      CommitTrans;
      RefreshData;
      InfoHint(Grid, 'Operación exitosa.');
    except
      on E:Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

end.
