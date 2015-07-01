unit unFrmConsultaNotasGestion;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtDbFrame, unFraEmpresa, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unfraCodigoDescripcionExt,
  StdCtrls, Mask, ToolEdit, DateComboBox, JvgGroupBox,
  unFraStaticCodigoDescripcion, PeriodoPicker, PatternEdit, IntEdit,
  unSesion, unfrmABMNotas, AnsiSql, unConstEmision, unDmPrincipal,
  general, unfraUsuarios, JvExMask, JvToolEdit, JvCombobox, ComboEditor,
  CustomDlgs, unFuncionesEmision, unfraCtbTablas, CheckCombo;

type
  TfrmConsultaNotasGestion = class(TfrmCustomConsulta)
    gbGeneral: TJvgGroupBox;
    gbEmpresa: TGroupBox;
    fraEmpresaNota: TfraEmpresa;
    lblCuit: TLabel;
    gbFormulario: TGroupBox;
    gbBibliorato: TGroupBox;
    edBibliorato: TIntEdit;
    gbPeriodo: TGroupBox;
    edPeriodo: TPeriodoPicker;
    gbSecuencia: TGroupBox;
    edSecuencia: TIntEdit;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    gbUsuarioAlta: TGroupBox;
    ShortCutControlSinHerenciaDelOrto: TShortCutControl;
    gbFechaAlta: TGroupBox;
    Label4: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    cmbUsuarioAlta: TCheckCombo;
    fraTipoFormulario: TfraCodigoDescripcionExt;
    rgpGestiona: TRadioGroup;
    gbGestionar: TGroupBox;
    cbNotas: TCheckBox;
    cbDDJJ: TCheckBox;
    Panel2: TPanel;
    edObservacion: TMemo;
    gbGestionados: TGroupBox;
    chkGestionados: TCheckBox;
    chkNoGestionados: TCheckBox;
    fraSUSS: TfraCtbTablas;
    lblSUSS: TLabel;
    chkBaja: TCheckBox;
    tbSelectAll: TToolButton;
    ToolButton2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure ExportDialogBeforeExport(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaSELECTEDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FSFormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSelectAllClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    SelectedList: TStringList;
    procedure ArmarConsulta(aExportando: boolean = false);
  public
    FFechaHoraInicio: TDateTime;
  end;

Const
  TIPO_NOTA = 'N';
  TIPO_DDJJ = 'D';

var
  frmConsultaNotasGestion: TfrmConsultaNotasGestion;

implementation

{$R *.dfm}

{ TfrmConsultaNotas }

procedure TfrmConsultaNotasGestion.ArmarConsulta(aExportando: boolean);
var
  sWhereNota, sWhereDDJJ, sFromNota, sFromDDJJ, sInUsuario, sSelectNota, sSelectDDJJ: string;
  i: integer;
begin
  sdqConsulta.SQL.Clear;
  sWhereNota  := '';
  sWhereDDJJ  := '';
  sFromNota   := '';
  sFromDDJJ   := '';
  sInUsuario := '';
  sSelectNota := '';

  if fraEmpresaNota.IsSelected then
  begin
    sWhereNota := sWhereNota + ' AND ino.no_contrato = ' + SqlValue(fraEmpresaNota.Contrato);
    sWhereDDJJ := sWhereDDJJ + ' AND dj_contrato = ' + SqlValue(fraEmpresaNota.Contrato);
  end;

  if not edBibliorato.IsEmpty then
    sWhereNota := sWhereNota + ' AND ino.no_bibliorato = ' + SqlValue(edBibliorato.Value);

  if fraSUSS.IsSelected then
  begin
    sWhereNota := sWhereNota + ' AND em_suss = ' + SqlValue(fraSUSS.Value);
    sWhereDDJJ := sWhereDDJJ + ' AND em_suss = ' + SqlValue(fraSUSS.Value);
  end;

  if chkBaja.Checked then
  begin
    sWhereNota := sWhereNota + ' AND ng_fechabaja is not null ';
    sWhereDDJJ := sWhereDDJJ + ' AND dg_fechabaja is not null ';
  end
  else begin
    sWhereNota := sWhereNota + ' AND ng_fechabaja is null ';
    sWhereDDJJ := sWhereDDJJ + ' AND dg_fechabaja is null ';
  end;

  if (cmbUsuarioAlta.CheckedCount > 0) then
  begin
    for i:=0 to cmbUsuarioAlta.Items.Count-1 do
    begin
        if cmbUsuarioAlta.Checked[i] then
        begin
          if (sInUsuario <> '') then
            sInUsuario := sInUsuario + ', ';
          sInUsuario := sInUsuario +  SqlValue(cmbUsuarioAlta.Items[i]);
        end;
    end;
    if (sInUsuario <> '') then
    begin
      sWhereNota := sWhereNota + ' AND NO_USUALTA IN (' + sInUsuario + ') ';
      sWhereDDJJ := sWhereDDJJ + ' AND PR_USUALTA IN (' + sInUsuario + ') ';
    end;
  end;

  if not edFechaAltaDesde.IsEmpty then
  begin
    sWhereNota := sWhereNota + ' AND trunc(ino.no_fechaalta) >= ' + SqlValue(edFechaAltaDesde.Date);
    sWhereDDJJ := sWhereDDJJ + ' AND trunc(do_fechaobservacion) >= ' + SqlValue(edFechaAltaDesde.Date);
  end;

  if not edFechaAltaHasta.IsEmpty then
  begin
    sWhereNota := sWhereNota + ' AND trunc(ino.no_fechaalta) <= ' + SqlValue(edFechaAltaHasta.Date);
    sWhereDDJJ := sWhereDDJJ + ' AND trunc(do_fechaobservacion) <= ' + SqlValue(edFechaAltaHasta.Date);
  end;

  if not edSecuencia.IsEmpty then
    sWhereNota := sWhereNota + ' AND ino.no_secuencia = ' + SqlValue(edSecuencia.Value);

  if not edPeriodo.Periodo.IsNull then
  begin
    sWhereNota := sWhereNota + ' AND NP_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
    sWhereDDJJ := sWhereDDJJ + ' AND DJ_PERIODO = ' + SqlValue(edPeriodo.Periodo.Valor);
  end;

  if fraTipoFormulario.IsSelected then
    sWhereNota := sWhereNota + ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(fraTipoFormulario.Value);

  if chkGestionados.Checked and not chkNoGestionados.Checked then
  begin
    sWhereNota := sWhereNota + ' AND ng_idnotaagestion IS NOT NULL ';
    sWhereDDJJ := sWhereDDJJ + ' AND dg_idnotaagestion IS NOT NULL ';
  end;

  if not chkGestionados.Checked and chkNoGestionados.Checked then
  begin
    if aExportando then
    begin
      sWhereNota := sWhereNota + ' AND ng_idnotaagestion in ( SELECT no_id ' +
                                                            ' FROM emi.ino_nota ino2, emi.inp_notacontratoperiodo inp2' +
                                                            ' WHERE ino2.no_id = inp2.np_idnota ' +
                                                            ' AND ino.no_contrato = ino2.no_contrato ' +
                                                            ' AND inp.np_periodo = inp2.np_periodo ' +
                                                            ' AND inp2.np_idtipoformulario = 36 ' +
                                                            ' AND ino2.no_usualta = ' + SqlValue(Sesion.LoginName) +
                                                            ' AND ino2.no_fechaalta >= ' + SqlDateTime(FFechaHoraInicio) +
                                                            ')';
      sWhereDDJJ := sWhereDDJJ + ' AND dg_idnotaagestion in ( SELECT no_id ' +
                                                            ' FROM emi.ino_nota ino2, emi.inp_notacontratoperiodo inp2' +
                                                            ' WHERE ino2.no_id = inp2.np_idnota ' +
                                                            ' AND dj_contrato = ino2.no_contrato ' +
                                                            ' AND dj_periodo = inp2.np_periodo ' +
                                                            ' AND inp2.np_idtipoformulario = 36 ' +
                                                            ' AND ino2.no_usualta = ' + SqlValue(Sesion.LoginName) +
                                                            ' AND ino2.no_fechaalta >= ' + SqlDateTime(FFechaHoraInicio) +
                                                            ')';
    end
    else begin
      sWhereNota := sWhereNota + ' AND ng_idnotaagestion IS NULL ';
      sWhereDDJJ := sWhereDDJJ + ' AND dg_idnotaagestion IS NULL ';
    end;
  end;

  case rgpGestiona.ItemIndex of
    //Emision
    0: begin
          sSelectNota := ', NULL EJECUTIVO, NULL ESTUDIO ';
          sFromNota := ', EMI.IOB_OBSERVACION ';
          sWhereNota := sWhereNota + ' AND NOT EXISTS (SELECT 1 FROM AFI.AEC_EJECUTIVOCUENTA WHERE CO_IDEJECUTIVO  = EC_ID AND EC_ID <> 1) ' +
                             ' AND NOT EXISTS (SELECT 1 FROM AFI.AGC_GESTORCUENTA WHERE CO_IDESTUDIO = GC_ID AND GC_ID <> 1 AND GC_ESTUDIO = ''S'') ' +
                             ' AND OB_ID = PO_IDOBSERVACION AND OB_RECHAZO IN (''S'', ''G'') AND CO_ESTADO = 1';

          sSelectDDJJ:= ', NULL EJECUTIVO, NULL ESTUDIO ';
          sWhereDDJJ := sWhereDDJJ + ' AND NOT EXISTS (SELECT 1 FROM AFI.AEC_EJECUTIVOCUENTA WHERE CO_IDEJECUTIVO  = EC_ID AND EC_ID <> 1) ' +
                                     ' AND OB_RECHAZO IN (''S'', ''G'') AND CO_ESTADO = 1';

       end;
    1: begin
          sSelectNota := ', EC_NOMBRE EJECUTIVO, NULL ESTUDIO ';
          sFromNota := sFromNota + ', AFI.AEC_EJECUTIVOCUENTA, EMI.IOB_OBSERVACION ';
          sWhereNota := sWhereNota + ' AND CO_IDEJECUTIVO  = EC_ID ' +
                             ' AND CO_IDEJECUTIVO <> 1 ' +
                             ' AND NOT EXISTS (SELECT 1 FROM AFI.AGC_GESTORCUENTA WHERE CO_IDESTUDIO = GC_ID AND GC_ID <> 1 AND GC_ESTUDIO = ''S'') ' +
                             ' AND OB_ID = PO_IDOBSERVACION AND OB_RECHAZO IN (''S'', ''G'') AND CO_ESTADO = 1';

          sSelectDDJJ := ', EC_NOMBRE EJECUTIVO, NULL ESTUDIO ';
          sFromDDJJ := sFromDDJJ + ' AFI.AEC_EJECUTIVOCUENTA, ';
          sWhereDDJJ := sWhereDDJJ + ' AND CO_IDEJECUTIVO  = EC_ID ' +
                                     ' AND CO_IDEJECUTIVO <> 1 ' +
                                     ' AND OB_RECHAZO IN (''S'', ''G'') AND CO_ESTADO = 1';


       end;
    2: begin
          sSelectNota := ', NULL EJECUTIVO, GC_NOMBRE ESTUDIO ';
          sFromNota := sFromNota + ', AFI.AGC_GESTORCUENTA ';
          sWhereNota := sWhereNota + ' AND CO_IDESTUDIO = GC_ID AND GC_ID <> 1 AND GC_ESTUDIO = ''S'' ';

          sSelectDDJJ := ', NULL EJECUTIVO, NULL ESTUDIO ';
          sWhereDDJJ := sWhereDDJJ + ' AND 1=2 ';
       end;

  end;

  if cbNotas.Checked then
    sdqConsulta.SQL.Add(    ' SELECT '''' selected, ino.no_id, ng_fechabaja fechabaja, ng_usubaja usubaja, ' +
                            '       ino.no_contrato contrato, ng_idnotaagestion idnotagestion, ino.no_bibliorato bibliorato, np_periodo periodo, ' +
                            '       ino.no_secuencia secuencia, ino.no_usualta usualta, trunc(ino.no_fechaalta) fechaalta,  ' +
                            '       em_nombre empresa, ' +
                            '       em_cuit cuit, ' +
                            '       tf_descripcion, ' +
                            '       ng_textoobservacion textobs, ' +
                            '       NG_ID idaGestionNota, NG_ID ID, ' +
                            '       NULL idaGestionDDJJ, as_nombre asesoremision, ' +
                            '       emi.notas.get_secbiblnotagestion(NG_ID) secbibligestion, ' +
                            '       DOMPOSTAL.DC_CALLE, DOMPOSTAL.DC_NUMERO, DOMPOSTAL.DC_PISO, DOMPOSTAL.DC_DEPARTAMENTO, ' +
                            '       DOMPOSTAL.DC_CPOSTAL, DOMPOSTAL.DC_LOCALIDAD, PROVPOSTAL.PV_DESCRIPCION ' + sSelectNota +
                            ' FROM CPV_PROVINCIAS PROVPOSTAL, ' +
                            '      AFI.ADC_DOMICILIOCONTRATO DOMPOSTAL, ' +
                            '      EMI.INO_NOTA INO, ' +
                            '      EMI.INP_NOTACONTRATOPERIODO INP, ' +
                            '      EMI.IPO_NOTAPERIODOOBSERVACION IPO, ' +
                            '      EMI.ING_NOTAGESTION ING, ' +
                            '      AFI.AEM_EMPRESA, ' +
                            '      AFI.ACO_CONTRATO, ' +
                            '      EMI.ITF_TIPOFORMULARIO, ' +
                            '      EMI.IAS_ASESOREMISION ' + sFromNota +
                            ' WHERE  INP.NP_IDNOTA = INO.NO_ID ' +
                            '        AND INP.NP_FECHABAJA IS NULL ' +
                            '        AND CO_CONTRATO = NO_CONTRATO ' +
                            '        AND CO_IDEMPRESA = EM_ID ' +
                            '        AND CO_IDASESOREMISION = AS_ID(+)' +
                            '        AND TF_ID = NP_IDTIPOFORMULARIO ' +
                            '        AND INO.NO_IDESTADONOTA + 0 = ' + SqlValue(ESTADO_NOTA_APLICADA) +
                            '        AND NP_FECHAALTA >= TO_DATE(''21/08/2007'', ''DD/MM/YYYY'')' +
                            '        AND INP.NP_ID = IPO.PO_IDNOTACONTRATOPERIODO ' +
                            '        AND ING.NG_IDNOTAPERIODOOBS = IPO.PO_ID ' +
                            '        AND DOMPOSTAL.DC_CONTRATO = CO_CONTRATO ' +
                            '        AND DOMPOSTAL.DC_TIPO = ''P'' ' +
                            '        AND DOMPOSTAL.DC_PROVINCIA = PROVPOSTAL.PV_CODIGO ' + sWhereNota);

  if cbNotas.Checked and cbDDJJ.Checked then
    sdqConsulta.SQL.Add(' UNION ALL ');

  if cbDDJJ.Checked then
    sdqConsulta.SQL.Add(    ' SELECT '''' selected, dj_id, dg_fechabaja fechabaja, dg_usubaja usubaja, ' +
                            ' dj_contrato contrato, dg_idnotaagestion idnotagestion, NULL bibliorato, dj_periodo periodo, NULL secuencia, pr_usualta usualta, TRUNC(pr_fechaalta) fechaalta, ' +
                            '        em_nombre empresa, ' +
                            '        em_cuit cuit, tf_descripcion, dg_textoobservacion textobs, ' +
                            '        NULL idaGestionNota, dg_id ID, ' +
                            '        dg_id idaGestionDDJJ, as_nombre asesoremision, ' +
                            '        emi.notas.get_secbiblddjjgestion(DG_ID) secbibligestion, ' +
                            '        dompostal.dc_calle, ' +
                            '        dompostal.dc_numero, dompostal.dc_piso, dompostal.dc_departamento, dompostal.dc_cpostal, dompostal.dc_localidad, ' +
                            '        provpostal.pv_descripcion ' + sSelectDDJJ +
                            ' FROM ' + sFromDDJJ + ' emi.ias_asesoremision, cpv_provincias provpostal, afi.aem_empresa, afi.adc_domiciliocontrato dompostal, afi.aco_contrato, emi.ipr_procesos, ' +
                            '      emi.tci_ddjjcabeceraimportacion, emi.itf_tipoformulario, emi.idj_ddjj, emi.ido_ddjjobservacion, emi.idg_ddjjgestion, emi.iob_observacion ' +
                            ' WHERE do_idddjj = dj_id ' +
                            '       AND do_idobservacion = ob_id ' +
                            '       AND do_idobservacion <> 1065 ' + //Hasta que se arregle lo del filtro del usuario
                            '       AND dj_idddjjcabeceraimportacion = ci_id ' +
                            '       AND co_idempresa = em_id ' +
                            '       AND tf_id = dj_idformulario ' +
                            '       AND ci_idproceso = pr_id ' +
                            '       AND ci_terminado = ''S''' +
                            '       AND co_idasesoremision = as_id(+)' +
                            '       AND dg_idddjjobservacion = do_id ' +
                            '       AND dompostal.dc_contrato = co_contrato ' +
                            '       AND dompostal.dc_tipo = ''P''' +
                            '       AND dompostal.dc_provincia = provpostal.pv_codigo ' +
                            '       AND dj_contrato = co_contrato ' + sWhereDDJJ);

  if trim (SortDialog.OrderBy) <> '' then
    sdqConsulta.SQL.Add(SortDialog.OrderBy)
  else
    sdqConsulta.SQL.Add(' order by 2, 4 ');
//    sdqConsulta.SQL.Add(' order by no_contrato, no_secuencia, no_bibliorato ');

end;

procedure TfrmConsultaNotasGestion.FormCreate(Sender: TObject);
begin
  inherited;
  SelectedList := TStringList.Create;
  fraEmpresaNota.ShowBajas := true;

  cmbUsuarioAlta.Clear;
  with GetQuery('SELECT SE_USUARIO, SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABAJA, SE_MAIL ' +
                ' FROM ART.USE_USUARIOS WHERE SE_SECTOR = ' + SqlValue('EMI')) do
  try
   while not Eof do
   begin
    cmbUsuarioAlta.Items.Add(FieldbyName('SE_USUARIO').AsString);
    Next;
   end;
  finally
    Free;
  end;

  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraSUSS do
  begin
    Clave := 'SUSS';
    ShowBajas   := True;
  end;
end;

procedure TfrmConsultaNotasGestion.tbRefrescarClick(Sender: TObject);
begin
  Verificar(not cbNotas.Checked and not cbDDJJ.Checked, gbGestionar, 'Debe selecionar algo para gestionar.');
  edObservacion.Clear;
  SelectedList.Clear;
  ArmarConsulta;
  inherited;
end;

procedure TfrmConsultaNotasGestion.tbModificarClick(Sender: TObject);
begin
  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('idaGestionNota').IsNull) then
    TfrmABMNotas.VerNota(sdqConsulta.FieldByName('NO_ID').AsInteger);
  inherited;
end;

procedure TfrmConsultaNotasGestion.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaNota.Clear;
  edSecuencia.Clear;
  edBibliorato.Clear;
  edPeriodo.Clear;
  fraTipoFormulario.Clear;
  cmbUsuarioAlta.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  fraSUSS.Clear;
end;

procedure TfrmConsultaNotasGestion.sdqConsultaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  edObservacion.Lines.Text := sdqConsulta.fieldbyname('textobs').AsString;
end;

procedure TfrmConsultaNotasGestion.ExportDialogBeforeExport(
  Sender: TObject);
var
  i: integer;
begin
  Verificar(not (SelectedList.Count > 0), Grid, 'Debe seleccionar algún registro.');
  sdqConsulta.DisableControls;
  FFechaHoraInicio := DBDateTime;
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(TBookmark(SelectedList.Objects[i]));
      if Grid.DataSource.DataSet.FieldByName('fechabaja').IsNull then
      begin
        if Grid.DataSource.DataSet.FieldByName('idnotagestion').IsNull then
        begin
          if not sdqConsulta.FieldByName('idaGestionNota').IsNull then //Es una nota
              do_generarnotagestion(Grid.DataSource.DataSet.FieldByName('contrato').AsInteger,
                                    Grid.DataSource.DataSet.FieldByName('periodo').AsString,
                                    Grid.DataSource.DataSet.FieldByName('idaGestionNota').AsInteger, TIPO_NOTA)
          else //Es una DDJJ
            do_generarnotagestion(Grid.DataSource.DataSet.FieldByName('contrato').AsInteger,
                                  Grid.DataSource.DataSet.FieldByName('periodo').AsString,
                                  Grid.DataSource.DataSet.FieldByName('idaGestionDDJJ').AsInteger, TIPO_DDJJ);
        end;
      end;
    end;
  finally
    sdqConsulta.Close;
    SelectedList.Clear;
    ArmarConsulta(true);
    sdqConsulta.Open;
    sdqConsulta.EnableControls;
  end;

  inherited;
end;

procedure TfrmConsultaNotasGestion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Selected').OnGetText := sdqConsultaSELECTEDGetText;
end;

procedure TfrmConsultaNotasGestion.sdqConsultaSELECTEDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if (SelectedList.IndexOf(sdqConsulta.fieldbyname('ID').AsString) <> -1) then
    Text := 'S'
  else
    Text := '';
end;

procedure TfrmConsultaNotasGestion.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  inherited;
end;

procedure TfrmConsultaNotasGestion.GridCellClick(Column: TColumn);
var
  i: integer;
begin
  inherited;
  if (Column.Field.FieldName = 'SELECTED') then
  begin
    i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ID').AsString);
    if (i = -1) then
      SelectedList.AddObject(sdqConsulta.fieldbyname('ID').AsString, TObject(sdqConsulta.GetBookmark))
    else begin
      sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
      SelectedList.Delete(i);
    end;
    Column.Grid.Refresh;
  end;
end;

procedure TfrmConsultaNotasGestion.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmConsultaNotasGestion.tbEliminarClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  Verificar(not (SelectedList.Count > 0), Grid, 'Debe seleccionar algún registro.');

  sdqConsulta.DisableControls;
  BeginTrans;
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(TBookmark(SelectedList.Objects[i]));
      if Grid.DataSource.DataSet.FieldByName('idnotagestion').IsNull and
         Grid.DataSource.DataSet.FieldByName('fechabaja').IsNull then
      begin
         if (not Grid.DataSource.DataSet.FieldByName('idaGestionNota').IsNull) then
           EjecutarSqlST(' update emi.ing_notagestion ' +
                         ' set ng_fechabaja = sysdate, ' +
                         ' ng_usubaja = ' + SqlValue(Sesion.LoginName) +
                         ' where ng_id = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('id').AsInteger)
                        )
         else
           EjecutarSqlST(' update emi.idg_ddjjgestion ' +
                         ' set dg_fechabaja = sysdate, ' +
                         ' dg_usubaja = ' + SqlValue(Sesion.LoginName) +
                         ' where dg_id = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('id').AsInteger)
                        );
      end;
    end;
    CommitTrans;
    SelectedList.Clear;
    sdqConsulta.Refresh;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al eliminar gestión.');
    end;
  end;
  sdqConsulta.EnableControls;
end;

procedure TfrmConsultaNotasGestion.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not (sdqConsulta.FieldByName('fechabaja').IsNull) then
    AFont.Color := clRed
  else
    AFont.Color := clWindowText;
end;

procedure TfrmConsultaNotasGestion.tbSelectAllClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  sdqConsulta.DisableControls;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('ID').AsString, TObject(sdqConsulta.GetBookmark));
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;

procedure TfrmConsultaNotasGestion.ToolButton2Click(Sender: TObject);
var
 nota: integer;
begin
  nota := 0;
  sdqConsulta.First;
  BeginTrans;
  while not sdqConsulta.Eof do
  begin
    if (nota <> sdqConsulta.FieldByName('no_id').AsInteger) and (sdqConsulta.FieldByName('CONTRATO').AsInteger <> 3371) then
      do_procesarlotenota(sdqConsulta.FieldByName('no_id').AsInteger);
    nota := sdqConsulta.FieldByName('no_id').AsInteger;
    sdqConsulta.Next;
  end;
  CommitTrans;
end;

end.
