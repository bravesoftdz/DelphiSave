unit unAprobacionSolicitud;

interface

uses                          
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Mask, ComboEditor, CheckCombo, ToolEdit, DateComboBox,
  StdCtrls, DBCheckCombo, PatternEdit, DBClient, FormPanel, IntEdit, unArt, CardinalEdit, Menus, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, unFraEmpresaSolicitud, unFraCodigoDescripcion,
  unFraUsuario, RxToolEdit, RxPlacemnt;

type
  TfrmAprobacionSolicitud = class(TfrmCustomConsulta)
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    cmbSA_ESTADO: TDBCheckCombo;
    cdDuplicados: TClientDataSet;
    cdDuplicadosCUIT: TStringField;
    tbSalir2: TToolButton;
    tbDatosLegajos: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    tbCalcularTotal: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    edSeleccion: TCardinalEdit;
    Panel2: TPanel;
    Label2: TLabel;
    edTotal: TCardinalEdit;
    GroupBox2: TGroupBox;
    edSA_NROINTERNO: TCardinalEdit;
    GroupBox3: TGroupBox;
    fraEmpresa: TfraEmpresaSolicitud;
    lbCUIT: TLabel;
    GroupBox4: TGroupBox;
    sdqFaltante: TSDQuery;
    dsFaltante: TDataSource;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    edSA_FECHAREVISION_DESDE: TDateComboBox;
    edSA_FECHAREVISION_HASTA: TDateComboBox;
    GroupBox6: TGroupBox;
    cboxRevision: TComboBox;
    GroupBox7: TGroupBox;
    fraUsuarioRevision: TfraUsuarios;
    pnlRef: TPanel;
    pnlRojo: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Shape2: TShape;
    Panel4: TPanel;
    Shape3: TShape;
    Panel5: TPanel;
    Shape4: TShape;
    Panel6: TPanel;
    Shape5: TShape;
    tbReferencias: TToolButton;
    ToolButton10: TToolButton;
    edDocFaltante: TCheckCombo;
    RadioGroup1: TRadioGroup;
    rbSorteoSi: TRadioButton;
    rbSorteoNo: TRadioButton;
    edSA_FECHAAFILIACION: TDateComboBox;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbDatosLegajosClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure tbReferenciasClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    function GetCantidadEmpleadosNomina(const aIdSolicitud: Integer): Integer;
    function IsPonerRojo(aCantEmpresa, aCantEstablecimiento, aCantNomina: Integer): Boolean;

    procedure btnDesmarcarTodos(Sender: TObject);
    procedure btnMarcarTodos(Sender: TObject);
    procedure CalcularFilas;
  public
  end;

var
  frmAprobacionSolicitud: TfrmAprobacionSolicitud;

implementation

uses
  unPrincipal, General, AnsiSQL, SqlFuncs, unCuadroTarifario, unCambioEstado, unCargaSolicitud, unCargaEstablecimiento,
  ArchFuncs, unDmPrincipal, Numeros, CustomDlgs, StrFuncs, unRptAprobacionSolicitud, unUtilsArchivo,
  unDatosLegajosDigitalizacion, ValFuncs;

{$R *.DFM}

procedure TfrmAprobacionSolicitud.FormCreate(Sender: TObject);
begin
  inherited;

  CoolBar.Height := 30;
  pnlRef.Visible := False;

  OpenQuery(sdqEstado);
  frmPrincipal.mnuAprobaciondeSolicitudes.Enabled := False;
  fraEmpresa.IncluirContratos := False;
  rbSorteoSi.Checked := True;
  //fraEmpresa.ShowBajas := True;
end;

function TfrmAprobacionSolicitud.IsPonerRojo(aCantEmpresa, aCantEstablecimiento, aCantNomina: Integer): Boolean;
begin
  Result := (not sdqConsulta.FieldByName('falta').IsNull);
end;

procedure TfrmAprobacionSolicitud.tbRefrescarClick(Sender: TObject);
var
  iLoop: Integer;
  sDocFaltante: String;
  sSql: String;
  sStrAux: String;
  sWhere: String;
begin

// Armo el string para filtrar por documentacion faltante
  for iLoop := 0 to edDocFaltante.Items.Count -1 do
  begin
   if edDocFaltante.Checked[iLoop] then
     sDocFaltante := sDocFaltante +'%'+ edDocFaltante.Items.Strings[iLoop]
  end;
  if sDocFaltante <> '' then
    sDocFaltante := sDocFaltante + '%';

  sStrAux := cmbSA_ESTADO.InSql;
  sSql :=
    'SELECT ca_descripcion, sa_totempleados cant_empresa, sa_motivoalta,' +
          ' art.afiliacion.get_empleados_establecimiento(sa_id) cant_establemiento,' +
          ' art.afiliacion.get_empleados_nomina(sa_cuit) cant_nomina,' +
          ' TO_NUMBER(DECODE(sa_fechavigenciadesde, NULL, NULL, TRUNC(SYSDATE - sa_fechavigenciadesde))) diasdemora,' +
          ' sa_estado || ''-'' || tb_descripcion estado, art.afiliacion.get_camposfaltantes(sa_id) falta,' +
          ' fo_formulario, fo_id, sa_hojaslegajos hojaslegajos, sa_observacioneslegajos observacioneslegajos, sa_cuit,' +
          ' sa_fechaafiliacion, sa_fecharecepcion, sa_id, sa_idformulario, sa_nombre, sa_nrointerno, sa_origen,' +
          ' afiliacion.falta_doc_solicitud(sa_id) faltarenglon, sa_usurevision, sa_fecharevision, ' +
          ' ar_nombre, sa_hojaslegajos, sa_solicitud_pcp ' +
     ' FROM asa_solicitudafiliacion, ctb_tablas, afo_formulario, xev_entidadvendedor, xen_entidad, aca_canal, aar_art' +
    ' WHERE sa_estado = tb_codigo' +
      ' AND tb_clave = ''ESSOL''' +
      ' AND sa_idformulario = fo_id' +
      ' AND sa_identidadvendedor = ev_id(+)' +
      ' AND ev_identidad = en_id(+)' +
      ' AND en_idcanal = ca_id(+)' +
      ' AND sa_idartanterior = ar_id(+)' +
      ' AND fo_id NOT IN(SELECT aco.co_idformulario' +
                         ' FROM aco_contrato aco' +
                        ' WHERE aco.co_idformulario = fo_id)' +
      ' AND (   SUBSTR(tb_especial1, 10, 1) = ''S''' +
           ' OR (    1 = (SELECT COUNT(*)' +
                          ' FROM cca_carta' +
                         ' WHERE ca_recepcionok = ''S''' +
                           ' AND actualdate - ca_fecharecepcion > 2' +
                           ' AND ca_idformulario = sa_idformulario)' +
               ' AND sa_estado = ''5.1''))';

  sWhere := '';

  if (sStrAux <> '') then
    sWhere := sWhere + ' AND sa_estado ' + sStrAux;

  if edSA_NROINTERNO.Value <> 0 then
    sWhere := sWhere + ' AND sa_nrointerno = ' + SqlValue(IntToStr(edSA_NROINTERNO.Value));

  if fraEmpresa.IsSelected then
    sWhere := sWhere + ' AND fo_id = ' + SqlValue(fraEmpresa.Value);

  if sDocFaltante <> '' then
    sWhere := sWhere + ' AND art.afiliacion.falta_doc_solicitud(sa_id) LIKE ''' + sDocFaltante + '''';

  if not(edSA_FECHAREVISION_DESDE.IsEmpty) then
  begin
    if not edSA_FECHAREVISION_HASTA.IsEmpty then
    begin
      sWhere := sWhere + ' AND sa_fecharevision >= ' + SqlDate(edSA_FECHAREVISION_DESDE.Date);
      sWhere := sWhere + ' AND sa_fecharevision <= ' + SqlDate(edSA_FECHAREVISION_HASTA.Date);
    end
    else
      sWhere := sWhere + ' AND sa_fecharevision >= ' + SqlDate(edSA_FECHAREVISION_DESDE.Date);
  end
  else
    if not edSA_FECHAREVISION_HASTA.IsEmpty then
      sWhere := sWhere + ' AND sa_fecharevision <= ' + SqlDate(edSA_FECHAREVISION_HASTA.Date);

  if (cboxRevision.ItemIndex <> -1) and (cboxRevision.ItemIndex <> 2) then
    if cboxRevision.ItemIndex = 0 then //Si
      sWhere := sWhere + ' AND sa_usurevision IS NOT NULL'
    else                               //NO
      sWhere := sWhere + ' AND sa_usurevision IS NULL';

  if Not(fraUsuarioRevision.IsEmpty) then
    sWhere := sWhere + ' AND sa_usurevision =' + SqlValue(fraUsuarioRevision.Codigo);

  if rbSorteoSi.Checked then
    sWhere := sWhere + ' AND SA_MOTIVOALTA != ''06'' AND SA_ORIGEN != ''6'' ';

  if rbSorteoNo.Checked then
    sWhere := sWhere + ' AND SA_MOTIVOALTA = ''06'' AND SA_ORIGEN = ''6'' ';

  if not edSA_FECHAAFILIACION.IsEmpty then
    sWhere := sWhere + ' AND SA_FECHAAFILIACION >= ' + SqlDate(edSA_FECHAAFILIACION.Date);



  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  CalcularFilas;

  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
    tbNuevo.Enabled := False;
    tbImprimir.Enabled := False;
    tbExportar.Enabled := False;
  end
  else
  begin
    tbNuevo.Enabled := True;
    tbImprimir.Enabled := True;
    tbExportar.Enabled := True;
  end;
end;

procedure TfrmAprobacionSolicitud.tbNuevoClick(Sender: TObject);
var
  bCargarSolicitud: Boolean;
  bPreguntaOrigenYaEfectuada: Boolean;
  iContrato: Integer;
  iHojasLegajos: Integer;
  iIdFormulario: Integer;
  iLoop: Integer;
  sMsg: String;
  sObservacionesLeg: String;
  sSql: String;
  sStrIn: String;
begin
  sStrIn := '';

  if Grid.SelectedRows.Count > 0 then
  begin
    bPreguntaOrigenYaEfectuada := False;

    cdDuplicados.Close;
    cdDuplicados.FileName := IncludeTrailingBackslash(TempPath) + 'Client.cds';
    cdDuplicados.CreateDataSet;

    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

      if (not bPreguntaOrigenYaEfectuada) and (sdqConsulta.FieldByName('sa_origen').AsString = '2') then
      begin
        bPreguntaOrigenYaEfectuada := True;
        if not MsgAsk('El Origen de la Solicitud no es WEB. ¿ Desea continuar de todas formas ?') then
          Exit;
      end;

      with cdDuplicados do
      begin
        Insert;
        FieldByName('cuit').AsString := sdqConsulta.FieldByName('sa_cuit').AsString;
        Post;
      end;
    end;

    try
      cdDuplicados.AddIndex('ndx_cuit', 'cuit', [ixUnique]);
    except
      raise Exception.Create('Ha seleccionado más de una solicitud para una determinada empresa.' + #10#13 +
                             'Verifique que seleccione sólo una solicitud para covertirla en contrato.');
    end;
    cdDuplicados.Close;

    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));

      Verificar(not IsNumber(sdqConsulta.FieldByName('fo_formulario').AsString), Grid ,'El número de formulario es inválido');

      bCargarSolicitud  := True;  //Si no tiene empleados se pone en false para no aprobar esa solicitud
      {** Avisar si no hay empleados cargados en la solicitud}
      if sdqConsulta.FieldByName('sa_solicitud_pcp').AsString <> 'S' then
        if GetCantidadEmpleadosNomina(sdqConsulta.FieldByName('sa_id').AsInteger) = 0 then
          if not MsgAsk('La empresa ' + sdqConsulta.FieldByName('sa_nombre').AsString + ' no tiene empleados cargados. ¿ Desea continuar ?') then
            bCargarSolicitud := False;
      {** Tk 36901}

      {** No permitir Aprobar solicitudes }
       if (sdqConsulta.FieldByName('sa_motivoalta').AsString = '02') and (sdqConsulta.FieldByName('sa_fecharevision').IsNull) then
       begin
         MsgBox(Format('La solicitud de la empresa %s requiere fecha revisión para ser aprobada.', [sdqConsulta.FieldByName('sa_nombre').AsString]));
         bCargarSolicitud := False;
       end;
       {** No permitir Aprobar solicitudes Tk 39119}

      if bCargarSolicitud then
      begin
        if not IsPonerRojo(sdqConsulta.FieldByName('cant_empresa').AsInteger,
                           sdqConsulta.FieldByName('cant_establemiento').AsInteger,
                           sdqConsulta.FieldByName('cant_nomina').AsInteger) then
        begin
          sStrIn := IIF(sStrIn = '', sdqConsulta.FieldByName('fo_id').AsString,
                        sStrIn + ', ' + sdqConsulta.FieldByName('fo_id').AsString);


          try
            iHojasLegajos     := sdqConsulta.FieldByName('hojaslegajos').AsInteger;
            sObservacionesLeg := Trim(sdqConsulta.FieldByName('observacioneslegajos').AsString);
            iIdFormulario     := sdqConsulta.FieldByName('sa_idformulario').AsInteger;

            if IsEmptyString(sObservacionesLeg) then
            begin
              sObservacionesLeg := GetObservacionesLegajos(iIdFormulario);
              DoActualizarLegajosDigitalizacion(iHojasLegajos, sObservacionesLeg, sdqConsulta.FieldByName('sa_id').AsInteger);
            end;

            sSql := 'BEGIN art.afiliacion.do_pasaje_contrato(:id, :usuario); END;';
            EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sa_id').AsString, frmPrincipal.DBLogin.UserId]);

            sSql :=
              'SELECT co_contrato' +
               ' FROM aco_contrato' +
              ' WHERE co_idformulario = :idformulario';
            iContrato := ValorSqlIntegerEx(sSql, [iIdFormulario]);
            DoInsertDetalleArchivoLegajoContrato(iContrato, iHojasLegajos, sObservacionesLeg);

            sSql :=
              'SELECT art.afiliacion.is_lavadocontrato(:idformulario)' +
               ' FROM DUAL';
            if ValorSqlEx(sSql, [iIdFormulario]) = 'S' then
            begin
              sMsg := Format(
                'El contrato Nº %d, de %s supera' + #13 + #10 +
                'los parámetros definidos ($50.000 mensuales). Por lo tanto, esta operación debe' + #13 + #10 +
                'evaluarse en los términos de la Ley 25.246 y CCS (Prevención de Lavado de Dinero).',
                [iContrato, sdqConsulta.FieldByName('sa_nombre').AsString]);
                MsgBox(sMsg);
            end;
          except
            on E: exception do
              ErrorMsg(E, Format('Se produjo un error en el pasaje a contrato de la fila %d.', [iLoop]));
          end;
        end;
      end;
    end;
    Grid.UnSelectAll;

    if sStrIn <> '' then
      with TrptAprobacionSolicitud.Create(Self) do
      try
        if PrepararReporte(sStrIn) then
          PreviewModal
        else
          MessageDlg('No se han obtenido datos para generar el reporte.', mtWarning, [mbOK], 0);
      finally
        Free;
      end;

    sdqConsulta.Close;
    OpenQuery(sdqConsulta);
  end;
end;

procedure TfrmAprobacionSolicitud.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.IsEmpty then
  begin
    MsgBox('No existen datos seleccionados.', MB_ICONEXCLAMATION, 'Atención');
    Abort;
  end;

  frmCargaSolicitudes := TfrmCargaSolicitudes.Create(frmPrincipal);
  frmCargaSolicitudes.Mostrar(False);
  frmCargaSolicitudes.DoCargaDatosSolicitud(sdqConsulta.FieldByName('sa_id').asInteger);
end;

procedure TfrmAprobacionSolicitud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAprobacionSolicitud := nil;
  frmPrincipal.mnuAprobaciondeSolicitudes.Enabled := True;

  inherited;
end;

procedure TfrmAprobacionSolicitud.tbDatosLegajosClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar una fila de la grilla.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe seleccionar exactamente una fila de la grilla.');

  if DoCargarLegajosDigitalizacion(sdqConsulta.FieldByName('sa_id').AsInteger) then
    sdqConsulta.Refresh;
end;

procedure TfrmAprobacionSolicitud.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

procedure TfrmAprobacionSolicitud.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmAprobacionSolicitud.GridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  aItem: TMenuItem;
  aMenuGrilla: TPopUpMenu;
begin
  // Muestra las opciones 'Marcar Todos' y 'Desmarcar Todos'..

  aMenuGrilla := TPopUpMenu.Create(Self);
  aItem := TMenuItem.Create(Self);
  try
    if (sdqConsulta.Active) and (not sdqConsulta.Eof) then
    begin
      aItem.Caption := 'Marcar Todos';
      aItem.OnClick := btnMarcarTodos;
      aMenuGrilla.Items.Add(aItem);

      aItem := TMenuItem.Create(Self);
      aItem.Caption := 'Desmarcar Todos';
      aItem.OnClick := btnDesMarcarTodos;
      aMenuGrilla.Items.Add(aItem);
    end
    else
    begin
      aItem.Caption := '( Consulta sin datos... )';
      aItem.Enabled := False;
      aMenuGrilla.Items.Add(aItem);
    end;
    aMenuGrilla.PopUp(Grid.ClientToScreen(MousePos).X , Grid.ClientToScreen(MousePos).Y);
  except
    aMenuGrilla.Free;
    aItem.Free;
  end;
end;

procedure TfrmAprobacionSolicitud.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
end;

procedure TfrmAprobacionSolicitud.CalcularFilas;
begin
  edSeleccion.Value := Grid.SelectedRows.Count;
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotal.Value := sdqConsulta.RecordCount
  else
    edTotal.Value := 0;
end;

procedure TfrmAprobacionSolicitud.btnDesmarcarTodos(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcularFilas;
end;

procedure TfrmAprobacionSolicitud.btnMarcarTodos(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilas;
end;

procedure TfrmAprobacionSolicitud.tbLimpiarClick(Sender: TObject);
begin
  cmbSA_ESTADO.Clear;
  edSA_NROINTERNO.Clear;
  fraEmpresa.Clear;
  inherited;
end;

function TfrmAprobacionSolicitud.GetCantidadEmpleadosNomina(const aIdSolicitud: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM ast_solicitudtrabajador' +
    ' WHERE st_idsolicitud = :idsolicitud';
  Result := ValorSqlIntegerEx(sSql, [aIdSolicitud]);
end;

procedure TfrmAprobacionSolicitud.FSFormShow(Sender: TObject);
begin
  inherited;
  Grid.ColumnByField['sa_fechaafiliacion'].Width := 95;
end;

procedure TfrmAprobacionSolicitud.tbReferenciasClick(Sender: TObject);
begin
  if pnlRef.Visible then
  begin
    CoolBar.Height := 30;
    pnlRef.Visible := False;
  end
  else
  begin
    CoolBar.Height := 56;
    pnlRef.Visible := True;
  end;
end;

procedure TfrmAprobacionSolicitud.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                                     Column: TColumn; State: TGridDrawState);
begin
  //Faltante de carga ROJO
  if (sdqConsulta.FieldByName('faltarenglon').AsString <> '') and (sdqConsulta.FieldByName('sa_usurevision').IsNull) then
    Grid.Canvas.Font.Color := clRed
  else if sdqConsulta.FieldByName('faltarenglon').AsString <> '' then    //Solicitud con documentacion faltante VIOLETA
    Grid.Canvas.Font.Color := clPurple
  else if (sdqConsulta.FieldByName('sa_motivoalta').AsString = '02') and (sdqConsulta.FieldByName('sa_usurevision').IsNull) then   //Solicitud sin Revision NARANJA
    Grid.Canvas.Font.Color := $00719FFF
  else if sdqConsulta.FieldByName('sa_hojaslegajos').AsInteger = 0 then   //Sin Cantidad de Hojas AZUL
    Grid.Canvas.Font.Color := clBlue;

  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);


  {if Trim(sdqConsulta.FieldByName('falta').AsString) = '- Sin Cant. Hojas Legajos' then
    AFont.Color := IIF(Highlight, clBtnFace, clBlue)
  else if IsPonerRojo(sdqConsulta.FieldByName('cant_empresa').AsInteger,
                      sdqConsulta.FieldByName('cant_establemiento').AsInteger,
                      sdqConsulta.FieldByName('cant_nomina').AsInteger) then
    AFont.Color := IIF(Highlight, clBtnFace, clRed)
  else
    if not Grid.SelectedRows.CurrentRowSelected and Highlight then
    begin
      AFont.Color := clWindowText;
      Background  := clWindow;
    end;}
end;

end.
