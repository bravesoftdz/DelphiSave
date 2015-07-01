unit unEnviosSRT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, JvExMask, JvToolEdit, JvMaskEdit,
  SinEdit, ToolEdit, DateComboBox, JvExComCtrls, JvMonthCalendar, CheckLst,
  ARTCheckListBox, unCustomConsulta, FormPanel, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, unArtDbFrame,
  unFraTrabajador, PatternEdit, IntEdit, RxToolEdit, RxPlacemnt;

type
  TfrmEnviosSRT = class(TfrmCustomGridABM)
    Label3: TLabel;
    edEX_ID: TSinEdit;
    Label17: TLabel;
    calDS_FENVIODesde: TJvMonthCalendar;
    Label8: TLabel;
    Label9: TLabel;
    edDS_FENVIODesde: TDateComboBox;
    edDS_FENVIOHasta: TDateComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    cblTB_CODIGO: TARTCheckListBox;
    rgErrores: TRadioGroup;
    pnlBottom: TPanel;
    pnl3: TPanel;
    pnl2: TPanel;
    pnl1: TPanel;
    fraTB_CODIGO: TfraCodDesc;
    Label1: TLabel;
    ShortCutControlHijo: TShortCutControl;
    fraTJ_ID: TfraTrabajador;
    Label2: TLabel;
    pnlInfo: TPanel;
    tbSumatoria: TToolButton;
    edDS_NROSRT: TPatternEdit;
    Label4: TLabel;
    cmbDS_INDEXART: TComboBox;
    tbReproceso: TToolButton;
    tbGenerarEnvio: TToolButton;
    rgReprocesar: TRadioGroup;
    fraDS_CODBAJA: TfraCodDesc;
    Label5: TLabel;
    Label6: TLabel;
    edDS_MOTIVOBAJA: TMemo;
    rgBajas: TRadioGroup;
    fpRenumeracion: TFormPanel;
    Bevel1: TBevel;
    Label10: TLabel;
    btnAceptarRenumeracion: TButton;
    btnCancelarRenumeracion: TButton;
    edNroRecaida: TIntEdit;
    tbRenumeracion: TToolButton;
    tbEnvio: TToolButton;
    fpEnvio: TFormPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    btnAceptarEnvio: TButton;
    btnCancelarEnvio: TButton;
    edSiniestroEnvio: TSinEdit;
    Label11: TLabel;
    edFechaEnvio: TDateComboBox;
    rgSolucion: TRadioGroup;
    rgReproceso: TRadioGroup;
    sdqConsultaTIPO: TStringField;
    sdqConsultaID: TStringField;
    sdqConsultaDS_SINIESTRO: TFloatField;
    sdqConsultaDS_ORDEN: TFloatField;
    sdqConsultaDS_RECAIDA: TFloatField;
    sdqConsultaDS_FENVIO: TDateTimeField;
    sdqConsultaDS_REPROCESAR: TStringField;
    sdqConsultaDS_CODIGOART: TStringField;
    sdqConsultaDS_NROSRT: TStringField;
    sdqConsultaDS_OPERACION: TStringField;
    sdqConsultaDS_CUIT: TStringField;
    sdqConsultaDS_TIPO_REG: TStringField;
    sdqConsultaDS_CUIT_OCURRE: TStringField;
    sdqConsultaDS_SRT_CATREG: TStringField;
    sdqConsultaDS_COD_ESTABLECIMIENTO: TStringField;
    sdqConsultaDS_CIIU_ESTABLECIMIENTO: TStringField;
    sdqConsultaDS_PROVINCIA: TStringField;
    sdqConsultaDS_CPOSTAL: TStringField;
    sdqConsultaDS_DOMICILIO_ESTABLECIMIENTO: TStringField;
    sdqConsultaDS_CUIL: TStringField;
    sdqConsultaDS_TIPO_DOC: TStringField;
    sdqConsultaDS_DOCUMENTO: TStringField;
    sdqConsultaDS_NOMBRE: TStringField;
    sdqConsultaDS_PUESTO_ACC: TStringField;
    sdqConsultaDS_ANTIGUEDAD_PUESTO: TStringField;
    sdqConsultaDS_SEXO: TStringField;
    sdqConsultaDS_FECHA_NACIMIENTO: TStringField;
    sdqConsultaDS_ESTADO_CIVIL: TStringField;
    sdqConsultaDS_NACIONALIDAD: TStringField;
    sdqConsultaDS_TURNO: TStringField;
    sdqConsultaDS_HORA_INICIO_JORNADA: TStringField;
    sdqConsultaDS_HORA_FIN_JORNADA: TStringField;
    sdqConsultaDS_AGENTE_MATERIAL: TStringField;
    sdqConsultaDS_FORMA: TStringField;
    sdqConsultaDS_CIE10_1: TStringField;
    sdqConsultaDS_NATU_1: TStringField;
    sdqConsultaDS_ZONA_1: TStringField;
    sdqConsultaDS_CIE10_2: TStringField;
    sdqConsultaDS_NATU_2: TStringField;
    sdqConsultaDS_ZONA_2: TStringField;
    sdqConsultaDS_CIE10_3: TStringField;
    sdqConsultaDS_NATU_3: TStringField;
    sdqConsultaDS_ZONA_3: TStringField;
    sdqConsultaDS_FECHA_ILT: TStringField;
    sdqConsultaDS_EGRESO_ILT: TStringField;
    sdqConsultaDS_DECLA_IPP: TStringField;
    sdqConsultaDS_GRADO_INCA: TStringField;
    sdqConsultaDS_FIN_IPP: TStringField;
    sdqConsultaDS_PORC_INCAPACIDAD: TStringField;
    sdqConsultaDS_GRAN_INVALIDEZ: TStringField;
    sdqConsultaDS_FECHA_DICTAMEN: TStringField;
    sdqConsultaDS_NRO_EXPEDIENTE: TStringField;
    sdqConsultaDS_PATOLOGIA_TRAZADORA: TStringField;
    sdqConsultaDS_FECHA_ALTA: TStringField;
    sdqConsultaDS_NRO_ROAM: TStringField;
    sdqConsultaDS_ANIO_ROAM: TStringField;
    sdqConsultaDS_COD_OBSERVACION: TStringField;
    sdqConsultaDS_COD_ERROR: TStringField;
    sdqConsultaDS_FECHA_SINIESTRO: TStringField;
    sdqConsultaDS_FECHA_BAJA: TStringField;
    sdqConsultaDS_FEC_DIAGNOSTICO_1: TStringField;
    sdqConsultaDS_FEC_DIAGNOSTICO_2: TStringField;
    sdqConsultaDS_FEC_DIAGNOSTICO_3: TStringField;
    sdqConsultaDS_PUESTO_ANTERIOR: TStringField;
    sdqConsultaDS_ANTIGUEDAD_ANTERIOR: TStringField;
    sdqConsultaDS_AGENTE: TStringField;
    sdqConsultaDS_TIEMPO_EXP: TFloatField;
    sdqConsultaDS_PERIODICO: TStringField;
    sdqConsultaDS_FEC_PER: TStringField;
    sdqConsultaDS_COD_EXA_PER_1: TStringField;
    sdqConsultaDS_COD_EXA_PER_2: TStringField;
    sdqConsultaDS_COD_EXA_PER_3: TStringField;
    sdqConsultaTJ_ID: TFloatField;
    sdqConsultaTB_CODIGO: TStringField;
    sdqConsultaERROR: TStringField;
    sdqConsultaDS_FBAJA: TDateTimeField;
    sdqConsultaDS_CODBAJA: TFloatField;
    sdqConsultaDS_MOTIVOBAJA: TStringField;
    sdqConsultaIS_SOLUCIONADO: TStringField;
    sdqConsultaGP_DESCRIPCION: TStringField;
    sdqConsultaLG_NOMBRE: TStringField;
    sdqConsultaDS_INDEXART: TFloatField;
    sdqConsultaEX_FECHARECEPCION: TDateTimeField;
    sdqConsultaFACCI: TDateTimeField;
    sdqConsultaEX_FECHACARGA: TDateTimeField;
    sdqConsultaDS_REPROCESABLE: TStringField;
    sdqConsultaDS_ENVIAPUBLICA: TStringField;
    sdqConsultaDS_FECHABAJA: TStringField;
    sdqConsultaDS_SECUELASINC: TStringField;
    sdqConsultaDS_FECHARECH: TStringField;
    sdqConsultaDS_MOTIVORECH: TStringField;
    sdqConsultaDS_FECHAESTAM: TStringField;
    sdqConsultaDS_CRONICO: TStringField;
    sdqConsultaDS_RECALIFICACION: TStringField;
    sdqConsultaDS_INTERCURRENCIA: TStringField;
    sdqConsultaDS_NROATINTER: TStringField;
    sdqConsultaDS_INGRESOBASE: TStringField;
    sdqConsultaDS_TRATPEND: TStringField;
    sdqConsultaDS_ESP1: TStringField;
    sdqConsultaDS_ESP2: TStringField;
    sdqConsultaDS_ESP3: TStringField;
    sdqConsultaDS_INICIO_TRANSI: TStringField;
    sdqConsultaDS_FIN_TRANSI: TStringField;
    sdqConsultaDS_MOTIVO_CESE_TRANSI: TStringField;
    sdqConsultaDS_FEC_TOMA_CONO: TStringField;
    sdqConsultaDS_PROV_OCURRE: TStringField;
    sdqConsultaDS_COD_LOC_OCURRE: TStringField;
    sdqConsultaDS_CPA_OCURRE: TStringField;
    sdqConsultaDS_ESTRES: TStringField;
    sdqConsultaDS_EXPEDIENTE_JUD: TStringField;
    sdqConsultaDS_OBSERVACIONES: TStringField;
    sdqConsultaDS_CALLE_OCURRE: TStringField;
    sdqConsultaDS_NUMERO_OCURRE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure tbReprocesoClick(Sender: TObject);
    procedure tbGenerarEnvioClick(Sender: TObject);
    procedure calDS_FENVIODesdeClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRenumeracionClick(Sender: TObject);
    procedure tbEnvioClick(Sender: TObject);
    procedure btnAceptarRenumeracionClick(Sender: TObject);
    procedure btnAceptarEnvioClick(Sender: TObject);
  private
    FSQL: String;
    procedure ContarRegistros;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
  public
    procedure ClearData; override;
    procedure RefreshData; override;
  end;

var
  frmEnviosSRT: TfrmEnviosSRT;

implementation

uses
  unFiltros, CustomDlgs, unDmPrincipal, AnsiSql, SqlFuncs, VCLExtra, Math,
  unGrids, unEspera, unImpoExpoWizard, unSesion, DateTimeFuncs;

{$R *.dfm}

{ TfrmEnviosSRT }

procedure TfrmEnviosSRT.RefreshData;
var
  sSQL: String;
begin
  if (not(edDS_FENVIODesde.IsEmpty and edDS_FENVIOHasta.IsEmpty)) or (not edEX_ID.IsEmpty) then
    calDS_FENVIODesde.Enabled := False;

  if (not edEX_ID.IsEmpty) then
  begin
    calDS_FENVIODesde.Enabled := False;
    edDS_FENVIODesde.Enabled := False;
  end;

  sSQL := FSQL;
  AddCondition(sSQL, ' 1=1 ' + DoFiltro(pnlFiltros));

  case rgErrores.ItemIndex of
    1: AddCondition(sSQL, 'DS_COD_ERROR IS NOT NULL');
    2: AddCondition(sSQL, 'DS_COD_ERROR IS NULL');
  end;

  case rgReprocesar.ItemIndex of
    1: AddCondition(sSQL, 'DS_REPROCESAR = ''S''');
    2: AddCondition(sSQL, 'DS_REPROCESAR = ''N''');
  end;

  case rgBajas.ItemIndex of
    1: AddCondition(sSQL, 'DS_FBAJA IS NOT NULL');
    2: AddCondition(sSQL, 'DS_FBAJA IS NULL');
  end;

  case rgSolucion.ItemIndex of
    1: AddCondition(sSQL, 'IS_SOLUCIONADO = ''Si''');
    2: AddCondition(sSQL, 'IS_SOLUCIONADO <> ''Si''');
  end;

  case rgReproceso.ItemIndex of
    1: AddCondition(sSQL, 'DS_REPROCESABLE = ''S''');
    2: AddCondition(sSQL, 'DS_REPROCESABLE = ''N''');
  end;

  if not edEX_ID.IsEmpty then
  begin
    AddCondition(sSQL, ' DS_SINIESTRO = ' + edEX_ID.SiniestroSql);
    AddCondition(sSQL, ' DS_ORDEN = ' + edEX_ID.OrdenSql);
    AddCondition(sSQL, ' DS_RECAIDA = ' + edEX_ID.RecaidaSql);
  end;

  if edDS_NROSRT.Text > '' then
    AddCondition(sSQL, ' DS_NROSRT = ' + edDS_NROSRT.Text);

  if fraTJ_ID.IsSelected then
    AddCondition(sSQL, ' TJ_ID = ' + SQLValue(fraTJ_ID.Value));

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;

  IniciarEspera('Actualizando...');
  Application.ProcessMessages;
  try
    inherited RefreshData;
  finally
    DetenerEspera;
  end;
  
  calDS_FENVIODesde.Enabled := True;
  edDS_FENVIODesde.Enabled := True;  
end;

procedure TfrmEnviosSRT.FormCreate(Sender: TObject);
begin
  calDS_FENVIODesde.Date := DBDate - 1;
  FieldBaja := 'DS_FBAJA';
  FSQL := sdqConsulta.SQL.Text;
  tbSumatoria.Left := tbMostrarFiltros.Left;
  tbSumatoria.ImageIndex := 26;
  tbGenerarEnvio.Left := tbNuevo.Left + 1;
  tbGenerarEnvio.ImageIndex := 11;
  tbReproceso.Left := tbGenerarEnvio.Left + 1;
  tbReproceso.ImageIndex := 21;
  tbRenumeracion.Left := tbReproceso.Left + 1;
  tbRenumeracion.ImageIndex := 36;
  tbEnvio.Left := tbRenumeracion.Left + 1;
  tbEnvio.ImageIndex := 38;
  inherited;
  ShowActived := False;
end;

procedure TfrmEnviosSRT.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja then
    inherited
  else
  with Field.DataSet do
  begin
    if (not Active) or IsEmpty then
      Exit;

    if FieldByName('DS_COD_ERROR').IsNull then
    begin
      Background := pnl1.Color;
      AFont.Color := clBlack;

      if Highlight then
        AFont.Color := clNavy
    end else
    begin
      if (FieldByName('IS_SOLUCIONADO').AsString = 'Si') then
      begin
        Background := pnl2.Color;
        AFont.Color := clBlack;

        if Highlight then
          AFont.Color := clNavy
      end else
      begin
        Background := pnl3.Color;
        AFont.Color := clBlack;

        if Highlight then
          AFont.Color := clNavy
      end;
    end;
  end;

  if Highlight then
  begin
    AFont.Style := AFont.Style + [fsBold];
    Background := clGray;
  end else
    AFont.Style := AFont.Style - [fsBold];
end;

procedure TfrmEnviosSRT.tbPropiedadesClick(Sender: TObject);
  procedure MarcarReprocesar(ARowID: String);
  var
    sTabla: String;
  begin
    with sdqConsulta do
    begin
      if FieldByName('TIPO').AsString = 'AT' then
        sTabla := 'SIN.SDS_DETALLE_SRT_AT'
      else
        sTabla := 'SIN.SDS_DETALLE_SRT_EP';

      EjecutarSQLEx(Format('UPDATE %s SET DS_REPROCESAR = :V1 WHERE ROWID = :ID', [sTabla]), ['S', ARowID]);
    end;
  end;
var
  sSiniestroCompleto, sRowID: String;
  RegistroAnterior: TBookmark;
  iloop, iInvalidos, nTotalSeleccionados: Integer;
begin
  iInvalidos := 0;
  Verificar(sdqConsulta.IsEmpty, tbPropiedades, 'Debe seleccionar el siniestro a reprocesar.');
  Verificar((not Seguridad.Claves.IsActive('PermisoParaReprocesarInvalidos')) and (sdqConsulta.FieldByName('DS_REPROCESABLE').AsString <> 'S'), tbPropiedades, 'El error del registro seleccionado no es reprocesable.');
  inherited;
  with sdqConsulta do
  begin
    Verificar(FieldByName('DS_REPROCESAR').AsString = 'S', tbPropiedades, 'El registro seleccionado ya había sido marcado para ser reprocesado.');
    Verificar(FieldByName('DS_COD_ERROR').IsNull, tbPropiedades, 'El registro seleccionado no contiene ningún error como para ser reprocesado.');

    if Grid.SelectedRows.Count = 0 then
    begin
      sSiniestroCompleto := Armar_Siniestro(FieldByName('DS_SINIESTRO').AsInteger, FieldByName('DS_ORDEN').AsInteger, FieldByName('DS_RECAIDA').AsInteger);
      
      if MsgAsk(Format('¿Está seguro que desea marcar el siniestro %s para ser reprocesado?', [sSiniestroCompleto])) then
      begin
        sRowID := FieldByName('ID').AsString;
        MarcarReprocesar(sRowID);
        RefreshData;
        Locate('ID', sRowID, []);
        InfoHint(tbPropiedades, Format('El siniestro %s ha sido marcado para ser reprocesado.', [sSiniestroCompleto]));
      end else
        InfoHint(tbPropiedades, 'No se realizó ninguna modificación.');
    end else
    begin
      RegistroAnterior := GetBookmark;
      DisableControls;
      nTotalSeleccionados := Grid.SelectedRows.Count;
      
      try
        // Loopea entre los registros de la grilla seleccionados
        for iloop := 0 to nTotalSeleccionados - 1 do
        begin
          GotoBookmark(Pointer(Grid.SelectedRows.Items[iloop]));
          if Seguridad.Claves.IsActive('PermisoParaReprocesarInvalidos') or (FieldByName('DS_REPROCESABLE').AsString = 'S') then
            MarcarReprocesar(FieldByName('ID').AsString)
          else
            Inc(iInvalidos);
        end;
      finally
        GotoBookmark(RegistroAnterior);
        FreeBookmark(RegistroAnterior);

        EnableControls;
        RefreshData; 

        if iInvalidos > 0 then
          InfoHint(tbPropiedades, Format('Se marcaron para reprocesar %d de los %d registros seleccionados.', [nTotalSeleccionados - iInvalidos, nTotalSeleccionados]));
      end;
    end;
  end;
end;

procedure TfrmEnviosSRT.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
  Grid.ColumnByField['DS_COD_ERROR'].Width    := 44;
  Grid.ColumnByField['DS_CODIGOART'].Width    := 38;
  Grid.ColumnByField['GP_DESCRIPCION'].Width  := 81;
  Grid.ColumnByField['ERROR'].Width           := Min(100, Grid.ColumnByField['ERROR'].Width);
  ContarRegistros;
end;

procedure TfrmEnviosSRT.ContarRegistros;
begin
  if tbSumatoria.Down then
  begin
    IniciarEspera('Contando registros...');
    try
      pnlInfo.Caption := 'Total: ' + IntToStr(sdqConsulta.RecordCount) + ' Errores: ' + IntToStr(GetNotNullCount(Grid, 'DS_COD_ERROR'));
    finally
      DetenerEspera;
    end;
  end else
    pnlInfo.Caption := '';
end;

procedure TfrmEnviosSRT.ClearData;
begin
  pnlInfo.Caption := '';
  cblTB_CODIGO.ClearChecks;
  rgErrores.ItemIndex := 0;
  rgReprocesar.ItemIndex := 0;
  rgBajas.ItemIndex := 2;
  fraTJ_ID.Clear;
  edDS_FENVIODesde.Clear;
  edDS_FENVIOHasta.Clear;
  edDS_NROSRT.Clear;
  edEX_ID.Clear;
  fraTB_CODIGO.Clear;
  cmbDS_INDEXART.ItemIndex := -1;
  calDS_FENVIODesde.Date := DBDate - 1;
end;

procedure TfrmEnviosSRT.tbNuevoClick(Sender: TObject);
begin
  //inherited ... no lo llamo a propósito!
  ImpoExpoWizard('SRT_R');
end;

procedure TfrmEnviosSRT.tbSumatoriaClick(Sender: TObject);
begin
  inherited;
  ContarRegistros;
end;

procedure TfrmEnviosSRT.tbReprocesoClick(Sender: TObject);
begin
  ImpoExpoWizard('SRT_P');
end;

procedure TfrmEnviosSRT.tbGenerarEnvioClick(Sender: TObject);
begin
  ImpoExpoWizard('SRT15');
end;

procedure TfrmEnviosSRT.calDS_FENVIODesdeClick(Sender: TObject);
begin
  edDS_FENVIODesde.Date := calDS_FENVIODesde.Date;
  if (not edDS_FENVIOHasta.IsEmpty) and (edDS_FENVIOHasta.Date < edDS_FENVIODesde.Date) then
    edDS_FENVIOHasta.Date := edDS_FENVIODesde.Date;
end;

function TfrmEnviosSRT.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  with Sql do
  begin
    if sdqConsulta.FieldByName('TIPO').AsString = 'EP' then
      TableName := 'SIN.SDS_DETALLE_SRT_EP'
    else if sdqConsulta.FieldByName('TIPO').AsString = 'AT' then
      TableName := 'SIN.SDS_DETALLE_SRT_AT'
    else
      Abort;

    PrimaryKey.Add('ROWID', sdqConsulta.FieldByName('ID').AsString);
    Fields.Add('DS_FBAJA', exDate);
    Fields.Add('DS_USUBAJA', Sesion.UserID);
    Fields.Add('DS_CODBAJA', fraDS_CODBAJA.Codigo);
    Fields.Add('DS_MOTIVOBAJA', edDS_MOTIVOBAJA.Lines.Text);
    SqlType := stUpdate;
  end;

  Result := inherited DoABM;
end;

procedure TfrmEnviosSRT.tbEliminarClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or sdqConsulta.IsEmpty, tbEliminar, 'Debe seleccionar un registro de la grilla.');
  Verificar(not sdqConsulta.FieldByName('DS_FBAJA').IsNull, tbEliminar, 'El registro seleccionado ya ha sido dado de baja.');
  fraDS_CODBAJA.Codigo := sdqConsulta.FieldByName('DS_CODBAJA').AsString;
  edDS_MOTIVOBAJA.Lines.Text := sdqConsulta.FieldByName('DS_MOTIVOBAJA').AsString;
  ModoABM := maBaja;
  ModoABMToSqlType;
  fpAbm.ShowModal;
  //inherited;
end;

function TfrmEnviosSRT.Validar: Boolean;
begin
  Verificar(fraDS_CODBAJA.IsEmpty, fraDS_CODBAJA.edCodigo, 'Debe seleccionar el motivo de baja.');
  Result := True;
end;

procedure TfrmEnviosSRT.tbRenumeracionClick(Sender: TObject);
begin
  if fpRenumeracion.ShowModal = mrOk then
  with sdqConsulta do
  begin
    EjecutarStoreEx('PAU.DO_RENUMERAREC(:SINIESTRO, :ORDEN, :RECAIDA, :RECAIDA_CERRADA, :USUARIO, :TIPO);',
                    [FieldByName('DS_SINIESTRO').AsInteger,
                     FieldByName('DS_ORDEN').AsInteger,
                     FieldByName('DS_RECAIDA').AsInteger,
                     edNroRecaida.Value,
                     Sesion.UserID,
                     FieldByName('TIPO').AsString]);
  end;
end;

procedure TfrmEnviosSRT.tbEnvioClick(Sender: TObject);
begin
  if fpEnvio.ShowModal = mrOk then
  begin
    EjecutarStoreEx('PAU.DO_INSERTARENVIO(:SINIESTRO, :ORDEN, :RECAIDA, :OTRO, :FECHA);',
                    [edSiniestroEnvio.Siniestro,
                     edSiniestroEnvio.Orden,
                     edSiniestroEnvio.Recaida,
                     'M',
                     TDateTimeEx.Create(edFechaEnvio.Date)]);
  end;
end;

procedure TfrmEnviosSRT.btnAceptarRenumeracionClick(Sender: TObject);
begin
  Verificar(edNroRecaida.IsEmpty, edNroRecaida, 'Debe seleccionar el número de la recaída cerrada.');
  fpRenumeracion.ModalResult := mrOk;
end;

procedure TfrmEnviosSRT.btnAceptarEnvioClick(Sender: TObject);
begin
  Verificar(edSiniestroEnvio.IsEmpty, edSiniestroEnvio, 'Debe seleccionar el siniestro a enviar.');
  Verificar(edFechaEnvio.IsEmpty, edFechaEnvio, 'Debe seleccionar la fecha del envío.');

  fpEnvio.ModalResult := mrOk;
end;

end.
