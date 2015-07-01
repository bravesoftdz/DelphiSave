unit unConsultoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unArt,
  unImpoExpoWizard, unGrids, RxToolEdit, RxPlacemnt;

type
  TfrmConsultoria = class(TfrmCustomGridABM)
    tbProcesarRegistros: TToolButton;
    Label1: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    Label3: TLabel;
    edFechaAltaDesde: TDateComboBox;
    Label4: TLabel;
    edFechaAltaHasta: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    edFechaRealizacionDesde: TDateComboBox;
    Label7: TLabel;
    edFechaRealizacionHasta: TDateComboBox;
    cbPendiente: TCheckBox;
    cbTerminado: TCheckBox;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodo: TToolButton;
    ShortCutControl1: TShortCutControl;
    tbImportar: TToolButton;
    cbExcluirBajas: TCheckBox;
    procedure tbProcesarRegistrosClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbSeleccionarTodoClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImportarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    SelectedList: TBookMarkLst;
    procedure GenerarInforme(aIdEmpresaConsultoria, aContrato: integer; aPathDestino: String);
  public
    function DoABM: Boolean; override;
    { Public declarations }
  end;

const
  PLANTILLA_RTF_DEFAULT = 1;

var
  frmConsultoria: TfrmConsultoria;

implementation

{$R *.dfm}
uses
  unRptConsultoria, unRptConsultoriaEstablecimientos, unRptConsultoriaPiePagina, unInformesSiniestralidad, general,
  ArchFuncs, AnsiSql, unDmPrincipal, unSesion, unRptFormularioValidacionYRectificacionDatosEstablecimientos,
  unInformeRTF, unCustomConsulta, SqlFuncs;

function TfrmConsultoria.DoABM: Boolean;
var
  iIdCodigo : Integer;
begin
  BeginTrans(True);
  try
    iIdCodigo := 0;
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      iIdCodigo:=sdqConsulta.FieldByName('EC_ID').AsInteger;
      Sql.Fields.Add('EC_USUBAJA', Sesion.UserID );
      Sql.Fields.Add('EC_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end;

    Sql.PrimaryKey.Add('EC_ID', iIdCodigo);

    EjecutarSQLST(Sql.Sql);
    CommitTrans(True);
    Result := True;
  except
    Rollback(True);
    Result := False;
  end;
end;

procedure TfrmConsultoria.tbProcesarRegistrosClick(Sender: TObject);
var
  i: Integer;
  sPath, sPathWEB,sPathWebExt, sPeriodo: String;
begin
  inherited;
  if SelectedList.Count = 0 then exit;

  sPath := IncludeTrailingBackslash(ValorSql('SELECT pa_valor FROM hys.hpa_parametro WHERE pa_clave = ''CARPETAINFORMES'''));
  sPathWEB := IncludeTrailingBackslash( ValorSql('SELECT art.hys.get_parametrobyclave(''CARPETAINFORMESWEB'') from dual'));
  sPeriodo := ValorSql('SELECT TO_CHAR(art.actualdate, ''YYYYMM'') FROM DUAL');

  for i:=0 to SelectedList.Count-1 do
  begin
    Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
    if sdqConsulta.FieldByName('ec_estado').AsString = 'P' then
    begin
      GenerarInforme(sdqConsulta.FieldByName('ec_id').AsInteger, sdqConsulta.FieldByName('ec_contrato').AsInteger, sPath + sdqConsulta.FieldByName('ec_contrato').AsString +'\Informe.doc');
      sPathWebExt := sPathWeb+ sdqConsulta.FieldByName('ec_contrato').AsString + '\'+sPeriodo;
      ForceDirectories(sPathWebext);

      if CopyFile(PChar(sPath+ sdqConsulta.FieldByName('ec_contrato').AsString + '\Informe.doc'), PChar(sPathWebExt + '\Informe.doc'),false) then
        EjecutarSql(' INSERT INTO web.wii_informesiys (ii_id, ii_contrato, ii_periodo, ii_archivo, ii_usualta, ii_fechaalta, ii_tipoarchivo) '+
                    ' VALUES (web.seq_wii_id.NEXTVAL, '+SqlValue(sdqConsulta.FieldByName('ec_contrato').AsString )+', TO_CHAR(art.actualdate, ''YYYYMM''),'+
                    '         ''Informe.doc'', '+SqlValue(Sesion.LoginName)+', SYSDATE, ''I'')');

      Abrir(TfrmInformesSiniestralidad, frmInformesSiniestralidad, tmvNormal, nil);
      with frmInformesSiniestralidad do
      try
        try
          Visible := False;
          VerValidaciones := false;
          rbtInfGralSiniestos.Checked := True;
          PathDestino := sPath + sdqConsulta.FieldByName('ec_contrato').AsString + '\';
          dtDesde.Periodo.Valor := ValorSql('SELECT TO_CHAR(ADD_MONTHS(art.actualdate, -12), ''YYYY'')||''01'' FROM DUAL ');
          dtHasta.Periodo.Valor := ValorSql('SELECT TO_CHAR(ADD_MONTHS(art.actualdate, -1), ''YYYYMM'') FROM DUAL');
          fraempresa.Contrato := sdqConsulta.FieldByName('ec_contrato').AsInteger;
          mnuImprimirExcelClick(nil);

          if CopyFile(PChar(PathDestino + 'Anexo1_InformeSiniestralidad.xls'),
                         PChar(sPathWebExt + '\Anexo1_InformeSiniestralidad.xls'),false) then
            EjecutarSql(' INSERT INTO web.wii_informesiys (ii_id, ii_contrato, ii_periodo, ii_archivo, ii_usualta, ii_fechaalta, ii_tipoarchivo) '+
                    ' VALUES (web.seq_wii_id.NEXTVAL, '+SqlValue(sdqConsulta.FieldByName('ec_contrato').AsString )+', TO_CHAR(art.actualdate, ''YYYYMM''),'+
                    '         ''Anexo1_InformeSiniestralidad.xls'', '+SqlValue(Sesion.LoginName)+', SYSDATE, ''1'')');

          DeleteFile(PathDestino + 'Anexo1_InformeSiniestralidad.xls');
          RenameFile(PathDestino + 'INF_SIN2.XLS', PathDestino + 'Anexo1_InformeSiniestralidad.xls');
        except
          on EAbort do;
          on E: Exception do
            raise Exception.Create(E.Message + CRLF + 'Error al generar el informe siniestralidad');
        end;
        try
          rbtEvolMensual.Checked := true;
          mnuImprimirExcelClick(nil);

          if CopyFile(PChar(PathDestino + 'Anexo2_DetalleSiniestralidad.xls'), PChar(sPathWebExt + '\Anexo2_DetalleSiniestralidad.xls'),false) then
            EjecutarSql(' INSERT INTO web.wii_informesiys (ii_id, ii_contrato, ii_periodo, ii_archivo, ii_usualta, ii_fechaalta, ii_tipoarchivo) '+
                    ' VALUES (web.seq_wii_id.NEXTVAL, '+SqlValue(sdqConsulta.FieldByName('ec_contrato').AsString )+', TO_CHAR(art.actualdate, ''YYYYMM''),'+
                    '         ''Anexo2_DetalleSiniestralidad.xls'', '+SqlValue(Sesion.LoginName)+', SYSDATE, ''2'')');

          DeleteFile(PathDestino + 'Anexo2_DetalleSiniestralidad.xls');
          RenameFile(PathDestino + 'INF_TRAB.XLS', PathDestino + 'Anexo2_DetalleSiniestralidad.xls');
        except
          on EAbort do;
          on E: Exception do
            raise Exception.Create(E.Message + CRLF + 'Error al generar el informe siniestralidad');
        end;
      finally
        free;
      end;

      with TQrFormularioValidacionYRectificacionDatosEstablecimientos.Create(Owner) do
      try
        ExportPDF(sdqConsulta.FieldByName('ec_contrato').AsInteger,
                  sPath + sdqConsulta.FieldByName('ec_contrato').AsString + '\' + sdqConsulta.FieldByName('ec_contrato').AsString + '_FormValidacionyRectifiacionEstab');
      finally
        Free;
      end;
      if CopyFile(PChar(sPath + sdqConsulta.FieldByName('ec_contrato').AsString + '\' + sdqConsulta.FieldByName('ec_contrato').AsString + '_FormValidacionyRectifiacionEstab.pdf'),
                     PChar(sPathWebExt +'\' + sdqConsulta.FieldByName('ec_contrato').AsString + '_FormValidacionyRectifiacionEstab.pdf'),
                     false) then
            EjecutarSql(' INSERT INTO web.wii_informesiys (ii_id, ii_contrato, ii_periodo, ii_archivo, ii_usualta, ii_fechaalta, ii_tipoarchivo) '+
                    ' VALUES (web.seq_wii_id.NEXTVAL, '+SqlValue(sdqConsulta.FieldByName('ec_contrato').AsString )+', TO_CHAR(art.actualdate, ''YYYYMM''),'+
                           sqlvalue(sdqConsulta.FieldByName('ec_contrato').AsString + '_FormValidacionyRectifiacionEstab.pdf')+ ', '+SqlValue(Sesion.LoginName)+', SYSDATE, ''X'')');
      DeleteFile(sPath + sdqConsulta.FieldByName('ec_contrato').AsString + '\' + sdqConsulta.FieldByName('ec_contrato').AsString + '_FormValidacionyRectifiacionEstab'+'.qrp');

      EjecutarSqlEx(' UPDATE hys.hec_empresasconsultoria ' +
                    '  SET ec_estado = :estado, ' +
                    '      ec_fecharealizacion = sysdate ' +
                    ' WHERE ec_id = :id ', ['T', sdqConsulta.FieldByName('ec_id').AsInteger]);
    end;
  end;

  tbDesSeleccionarTodoClick(nil);
  tbRefrescarClick(nil);
end;

procedure TfrmConsultoria.tbRefrescarClick(Sender: TObject);
var
  sSql : String;
begin
  sSql := ' SELECT NULL SELECTED, hec.*, cpi.*, decode(ec_estado, ''P'', ''Pendiente'', ''T'', ''Terminado'') estado, ' +
          '   co_estado cobertura, em_nombre, em_cuit ' +
          '   FROM afi.aem_empresa, afi.aco_contrato, hys.hec_empresasconsultoria hec, comunes.cpi_pedidoinforme cpi ' +
          ' WHERE ec_idpedidoinforme = pi_id(+) ' +
          '   AND em_id = co_idempresa ' +
          '   AND ec_contrato = co_contrato ';

  if fraEmpresaFiltro.IsSelected then
  begin
    sSql := sSql + ' AND ec_contrato = '+SqlValue(fraEmpresaFiltro.Contrato);
  end;

  if edFechaAltaDesde.Date > 0 then
  begin
    sSql := sSql + ' AND trunc(ec_fechaalta) >= '+SqlValue(edFechaAltaDesde.Date);
  end;

  if edFechaAltaHasta.Date > 0 then
  begin
    sSql := sSql + ' AND trunc(ec_fechaalta) <= '+SqlValue(edFechaAltaHasta.Date);
  end;

  if edFechaRealizacionDesde.Date > 0 then
  begin
    sSql := sSql + ' AND trunc(ec_fecharealizacion) >= '+SqlValue(edFechaRealizacionDesde.Date);
  end;

  if edFechaRealizacionHasta.Date > 0 then
  begin
    sSql := sSql + ' AND trunc(ec_fecharealizacion) <= '+SqlValue(edFechaRealizacionHasta.Date+1);
  end;

  if cbPendiente.Checked then
    sSql := sSql + ' AND ec_estado = ''P'' ';

   if cbExcluirBajas.Checked then
    sSql := sSql + ' AND ec_fechabaja is null ';

  if cbTerminado.Checked then
    sSql := sSql + ' AND ec_estado = ''T'' ';

  sdqConsulta.Sql.Text := sSql;
  inherited;
end;

procedure TfrmConsultoria.GenerarInforme(aIdEmpresaConsultoria, aContrato: integer; aPathDestino: String);
var
  Id: integer;
begin
  BeginTrans;
  try
    Id := GetSecNextVal('comunes.seq_cpi_pedidoinforme');
    EjecutarSqlSTEx(' INSERT INTO comunes.cpi_pedidoinforme(pi_id, pi_idplanilla, pi_archivodestino, pi_estado, ' +
                    '                                       pi_fecharealizacion, pi_usualta, pi_fechaalta) ' +
                    ' VALUES (:id, :idplanilla, :destino, :estado, ' +
                    '         null, :usuario, sysdate) ', [Id, PLANTILLA_RTF_DEFAULT, aPathDestino, 'P', Sesion.LoginName]);

    EjecutarSqlSTEx(' INSERT INTO comunes.cpp_pedidoinfparametro(pp_idpedidoinforme, pp_parametro, pp_valor, pp_tipo) ' +
                    ' VALUES (:id, :parametro, :valor, :tipo) ', [Id, 'CONTRATOFILTRO', aContrato, 'I']);

    EjecutarSqlSTEx(' UPDATE hys.hec_empresasconsultoria ' +
                    ' SET ec_idpedidoinforme = :idpedido ' +
                    ' WHERE ec_id = :idEmpresaCons ', [Id, aIdEmpresaConsultoria]);
    do_generarinforme(Id, PLANTILLA_RTF_DEFAULT, aPathDestino);
    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al generar el informe RTF');
    end;
  end;
end;

procedure TfrmConsultoria.FormCreate(Sender: TObject);
begin
  tbImportar.Left := ToolButton5.Left + 4;
  tbSeleccionarTodo.Left := ToolButton5.Left + 3;
  tbDesSeleccionarTodo.Left := ToolButton5.Left + 2;
  tbProcesarRegistros.Left := ToolButton5.Left + 1;
//  tbSalir.Left := tbSeleccionarTodo.Left + 1;
  SelectedList := TBookMarkLst.Create;
  inherited;
  FieldBaja := 'ec_FECHABAJA';
  Sql.TableName := 'hys.hec_empresasconsultoria';
end;

procedure TfrmConsultoria.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = 'SELECTED') then
  begin
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ec_id').AsString) = -1 then
      SelectedList.AddObject(sdqConsulta.FieldByName('ec_id').AsString, sdqConsulta.GetBookmark)
    else begin
      {$IFDEF VER150}
      sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[SelectedList.IndexOf(sdqConsulta.fieldbyname('ec_id').AsString)]));
      {$ENDIF}
      SelectedList.Delete(SelectedList.IndexOf(sdqConsulta.fieldbyname('ec_id').AsString));
    end;
    Column.Grid.Refresh;
  end;
end;

procedure TfrmConsultoria.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmConsultoria.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    Check := 0;
    if SelectedList.IndexOf(sdqConsulta.FieldByName('ec_id').AsString) > -1 then
      Check := DFCS_CHECKED;
    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(DBGrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;


procedure TfrmConsultoria.tbDesSeleccionarTodoClick(Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  DBGrid.Refresh;
end;

procedure TfrmConsultoria.tbSeleccionarTodoClick(Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
        i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ec_id').AsString);
        if (i = -1) then
          SelectedList.AddObject(sdqConsulta.fieldbyname('ec_id').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    DBGrid.Refresh;
  end;
end;

procedure TfrmConsultoria.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmConsultoria.GridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
  begin
    if sdqConsulta.FieldByName('cobertura').AsInteger <> 1 then
      AFont.Color := clRed;
  end;
end;

procedure TfrmConsultoria.tbImportarClick(Sender: TObject);
begin
  inherited;
  ImpoExpoWizard('HYSCE'); 
end;

procedure TfrmConsultoria.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  cbPendiente.Checked    := False;
  cbTerminado.Checked    := False;
  cbExcluirBajas.Checked := True;
end;

end.



