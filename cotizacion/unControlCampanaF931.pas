unit unControlCampanaF931;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, DateComboBox, Mask, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraEntidades, unFraStaticCodigoDescripcion, unfraVendedores, Buttons, unFraCodDesc, PatternEdit, IntEdit, RxToolEdit,
  RxCurrEdit, RxPlacemnt;

type
  TfrmControlCampanaF931 = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSumaFijaAlicuotaF931: TCurrencyEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    edCuitBusqueda: TMaskEdit;
    GroupBox2: TGroupBox;
    edRazonSocialBusqueda: TEdit;
    edVariableAlicuotaF931: TCurrencyEdit;
    edCuit: TMaskEdit;
    edRazonSocial: TEdit;
    GroupBox3: TGroupBox;
    checkCotizadaMenorTarifario: TCheckBox;
    GroupBox4: TGroupBox;
    checkF931NoIngresado: TCheckBox;
    GroupBox5: TGroupBox;
    checkF931NoControlado: TCheckBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    fraEntidad: TfraEntidades;
    fraVendedor: TfraVendedores;
    checkF931Completo: TCheckBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edSumaFijaCompetencia: TCurrencyEdit;
    edVariableCompetencia: TCurrencyEdit;
    edSumaFijaDiferencia: TCurrencyEdit;
    edVariableDiferencia: TCurrencyEdit;
    edSumaFijaF931: TCurrencyEdit;
    edVariableF931: TCurrencyEdit;
    btnCalcular: TBitBtn;
    rgDiferencia: TRadioGroup;
    GroupBox8: TGroupBox;
    fraEjecutivo: TfraCodDesc;
    GroupBox9: TGroupBox;
    checkOk: TCheckBox;
    checkNo: TCheckBox;
    checkSinDif: TCheckBox;
    GroupBox10: TGroupBox;
    checkCotizadaMenorTarifario25: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    edMasaSalarial: TCurrencyEdit;
    edCantidadCapitas: TIntEdit;
    Label11: TLabel;
    edEntidad: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure edCuitExit(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraEntidadExit(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure CambiaEntidad(Sender: TObject);
  private
    function GetCerradoValue: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmControlCampanaF931: TfrmControlCampanaF931;

implementation

uses
  unSesion, SqlFuncs, CustomDlgs, unDmPrincipal, AnsiSql, General, Strfuncs, CUIT;

{$R *.dfm}

function TfrmControlCampanaF931.DoABM: Boolean;
var
  sSql: String;
begin
  Sql.Clear;
  Sql.TableName := 'afi.acc_ctrl_campania931';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('cc_id', sdqConsulta.FieldByName('cc_id').AsInteger, False);
    Sql.Fields.Add('cc_usubaja',   Sesion.UserID);
    Sql.Fields.Add('cc_fechabaja', 'SYSDATE', False);

    ModoABM := maModificacion;
    ModoABMToSqlType;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.Add('cc_id', exNull);
      Sql.Fields.Add('cc_fechaalata',  'SYSDATE', False);
      Sql.Fields.Add('cc_usualta',     Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('cc_id', sdqConsulta.FieldByName('cc_id').AsInteger, False);
      Sql.Fields.Add('cc_fechamodif',  'SYSDATE', False);
      Sql.Fields.Add('cc_usumodif',    Sesion.UserID);
    end;

    Sql.Fields.Add('cc_cantidadcapitas', edCantidadCapitas.Value);
    Sql.Fields.Add('cc_cerrado',         GetCerradoValue);
    Sql.Fields.Add('cc_cuit',            edCuit.Text);
    Sql.Fields.Add('cc_dif_porcmasa',    edVariableDiferencia.Value, -1, True);
    Sql.Fields.Add('cc_dif_sumafija',    edSumaFijaDiferencia.Value, -1, True);
    Sql.Fields.Add('cc_f931completo',    String(IIF(checkF931Completo.Checked, 'S', 'N')));
    Sql.Fields.Add('cc_fechabaja',       exNull);
    Sql.Fields.Add('cc_masasalarial',    edMasaSalarial.Value, -1, True);
    Sql.Fields.Add('cc_porcmasa',        edVariableF931.Value, -1, True);
    Sql.Fields.Add('cc_sumafija',        edSumaFijaF931.Value, -1, True);
    Sql.Fields.Add('cc_usubaja',         exNull);

    sSql :=
      'SELECT sc_idformulario' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_cuit = :cuit';
    Sql.Fields.Add('cc_idformulario', ValorSqlIntegerEx(sSql, [edCuit.Text]));
  end;

  Result := inherited DoABM;

  if Result then
  begin
    if ModoABM <> maBaja then
    begin
      InfoHint(btnAceptar, 'Los datos fueron guardados correctamente.', False, 'Información', blnInfo, 1, False);

      edCuit.Clear;
      edEntidad.Clear;
      edRazonSocial.Clear;
      edSumaFijaF931.Clear;
      edVariableF931.Clear;
      edCantidadCapitas.Clear;
      edMasaSalarial.Clear;
      checkF931Completo.Checked := False;

      edSumaFijaAlicuotaF931.Clear;
      edSumaFijaCompetencia.Clear;
      edSumaFijaDiferencia.Clear;
      edVariableAlicuotaF931.Clear;
      edVariableCompetencia.Clear;
      edVariableDiferencia.Clear;
    end;
    
    RefreshData;
  end;
end;

function TfrmControlCampanaF931.Validar: Boolean;
begin
  Verificar(not IsCuit(edCuit.Text), edCuit, 'Debe ingresar una C.U.I.T. válida.');
  Verificar((edRazonSocial.Text = ''), edRazonSocial, 'Debe ingresar la Razón Social.');

  Result := True;
end;


procedure TfrmControlCampanaF931.ClearControls;
begin
  edCuitBusqueda.Clear;
  edRazonSocialBusqueda.Clear;
  checkCotizadaMenorTarifario.Checked := False;
  checkCotizadaMenorTarifario25.Checked := False;
  checkF931NoIngresado.Checked := False;
  checkF931NoControlado.Checked := False;
  fraEntidad.Clear;
  fraVendedor.Clear;
  fraEjecutivo.Clear;
  checkOk.Checked := False;
  checkNo.Checked := False;
  checkSinDif.Checked := False;
end;

procedure TfrmControlCampanaF931.LoadControls;
begin
  with sdqConsulta do
  begin
    edCuit.Text                 := FieldByName('cc_cuit').AsString;
    edEntidad.Text              := FieldByName('entidad').AsString;
    edRazonSocial.Text          := FieldByName('razonsocial').AsString;
    edSumaFijaF931.Value        := FieldByName('cc_sumafija').AsFloat;
    edVariableF931.Value        := FieldByName('cc_porcmasa').AsFloat;
    edCantidadCapitas.Value     := FieldByName('cc_cantidadcapitas').AsInteger;
    edMasaSalarial.Value        := FieldByName('cc_masasalarial').AsFloat;

    edSumaFijaCompetencia.Value := FieldByName('sumafijacompetencia').AsFloat;
    edVariableCompetencia.Value := FieldByName('porcvariablecompetencia').AsFloat;
    edSumaFijaDiferencia.Value  := edSumaFijaAlicuotaF931.Value - edSumaFijaCompetencia.Value;
    edVariableDiferencia.Value  := edVariableAlicuotaF931.Value - edVariableCompetencia.Value;

    rgDiferencia.Visible := ((edSumaFijaDiferencia.Value <> 0) or (edVariableDiferencia.Value <> 0));
    if not rgDiferencia.Visible then
      rgDiferencia.ItemIndex := -1;

    checkF931Completo.Checked   := (FieldByName('cc_f931completo').AsString = 'S');
  end;
end;

procedure TfrmControlCampanaF931.RefreshData;
var
  sSql1: String;
  sSql2: String;
  sTmp: String;
begin
sSql1 :=
    'SELECT acc.*, cc_cuit, NULL co_contrato, ec_nombre ejecutivo, DECODE(cc_f931completo, ''S'', ''SI'', ''No'') f931completo, fo_formulario,' +
          ' en_codbanco || '' - '' || en_nombre entidad, DECODE(sc_form931, ''A'', sc_porcvariablecompetencia, ''N'', sc_porcvariable, ''S'',' +
          ' sc_porcvariableform931, 0) porcvariablecompetencia, TO_NUMBER(NVL(DECODE(co_fechacerrado, NULL, NULL, tc_porcvariable), sc_finalporcmasa)) porcvariablecotizado,' +
          ' sa_nombre razonsocial, sc_canttrabajador, sc_masasalarial, sc_nrosolicitud, sc_periodo, sc_porcvariabletarifario, sc_sumafijatarifario,' +
          ' cc_sumafija / sc_canttrabajador sumafija, DECODE(sc_form931, ''A'', sc_sumafijacompetencia, ''N'', sc_sumafija, ''S'', sc_sumafijaform931, 0) sumafijacompetencia,' +
          ' TO_NUMBER(NVL(DECODE(co_fechacerrado, NULL, NULL, tc_sumafija), sc_finalsumafija)) sumafijacotizada,' +
          ' DECODE(cc_cerrado, ''OK'', ''c/Dif. aceptado'', ''NO'', ''c/Diferencia'', ''SI'', ''s/Diferencia'') tipocierre,' +
          ' CASE' +
            ' WHEN SUBSTR(sc_periodo, 5, 2) IN(''06'', ''12'') THEN cc_porcmasa / 1.5' +
            ' ELSE cc_porcmasa' +
          ' END / sc_masasalarial * 100 variable' +
     ' FROM afi.acc_ctrl_campania931 acc JOIN afo_formulario ON fo_id = cc_idformulario' +
          ' JOIN asc_solicitudcotizacion ON sc_idformulario = cc_idformulario' +
          ' LEFT JOIN xen_entidad ON en_id = sc_identidad' +
          ' LEFT JOIN aec_ejecutivocuenta ON ec_id = en_idejecutivo' +
          ' LEFT JOIN aco_cotizacion ON co_id = sc_idcotizacion' +
          ' LEFT JOIN atc_tarifacobrar ON tc_id = art.cotizacion.get_idultimatarifa(co_id)' +
          ' JOIN asa_solicitudafiliacion ON sa_idformulario = cc_idformulario AND (sa_fecharecepcionfaxemail IS NOT NULL OR sa_fecharecepcionsectorafi IS NOT NULL)' +
    ' WHERE 1 = 1';

  sSql2 :=
   'SELECT acc.*, cc_cuit, co_contrato, ec_nombre ejecutivo, DECODE(cc_f931completo, ''S'', ''SI'', ''No'') f931completo, fo_formulario,' +
         ' en_codbanco || '' - '' || en_nombre entidad, DECODE(sc_form931, ''A'', sc_porcvariablecompetencia, ''N'', sc_porcvariable, ''S'', sc_porcvariableform931, 0) porcvariablecompetencia,' +
         ' TO_NUMBER(NVL(DECODE(co_fechacerrado, NULL, NULL, tc_porcvariable), sc_finalporcmasa)) porcvariablecotizado,' +
         ' em_nombre razonsocial, sc_canttrabajador, sc_masasalarial, sc_nrosolicitud, sc_periodo,' +
         ' sc_porcvariabletarifario, sc_sumafijatarifario, cc_sumafija / sc_canttrabajador sumafija,' +
         ' DECODE(sc_form931, ''A'', sc_sumafijacompetencia, ''N'', sc_sumafija, ''S'', sc_sumafijaform931, 0) sumafijacompetencia,' +
         ' TO_NUMBER(NVL(DECODE(co_fechacerrado, NULL, NULL, tc_sumafija), sc_finalsumafija)) sumafijacotizada,' +
         ' DECODE(cc_cerrado, ''OK'', ''c/Dif. aceptado'', ''NO'', ''c/Diferencia'', ''SI'', ''s/Diferencia'') tipocierre,' +
         ' CASE' +
           ' WHEN SUBSTR(sc_periodo, 5, 2) IN(''06'', ''12'') THEN cc_porcmasa / 1.5' +
           ' ELSE cc_porcmasa' +
         ' END / sc_masasalarial * 100 variable' +
    ' FROM afi.acc_ctrl_campania931 acc JOIN afo_formulario ON fo_id = cc_idformulario' +
         ' JOIN asc_solicitudcotizacion ON sc_idformulario = cc_idformulario' +
         ' LEFT JOIN xen_entidad ON en_id = sc_identidad' +
         ' LEFT JOIN aec_ejecutivocuenta ON ec_id = en_idejecutivo' +
         ' LEFT JOIN aco_cotizacion ON co_id = sc_idcotizacion' +
         ' LEFT JOIN atc_tarifacobrar ON tc_id = art.cotizacion.get_idultimatarifa(co_id)' +
         ' JOIN aco_contrato ON co_idformulario = cc_idformulario' +
         ' JOIN aem_empresa ON em_id = co_idempresa' +
   ' WHERE 1 = 1';

  if edCuitBusqueda.Text <> '' then
    if IsCuit(edCuitBusqueda.Text) then
    begin
      sSql1 := sSql1 + ' AND sa_cuit = ' + SqlValue(edCuitBusqueda.Text);
      sSql2 := sSql2 + ' AND em_cuit = ' + SqlValue(edCuitBusqueda.Text);
    end
    else
      InfoHint(edCuitBusqueda, 'La C.U.I.T. es inválida.');

  if edRazonSocialBusqueda.Text <> '' then
  begin
    sSql1 := sSql1 + ' AND sa_nombre LIKE ' + SqlValue('%' + edRazonSocialBusqueda.Text + '%');
    sSql2 := sSql2 + ' AND em_nombre LIKE ' + SqlValue('%' + edRazonSocialBusqueda.Text + '%');
  end;

  if checkCotizadaMenorTarifario.Checked then
  begin
    sSql1 := sSql1 + ' AND sc_finalporcmasa < NVL(sc_porcvariabletarifario, 0)';
    sSql2 := sSql2 + ' AND sc_finalporcmasa < NVL(sc_porcvariabletarifario, 0)';
  end;

  if checkCotizadaMenorTarifario25.Checked then
  begin
    sSql1 := sSql1 + ' AND sc_finalporcmasa < (NVL(sc_porcvariabletarifario, 0) * 0.75)';
    sSql2 := sSql2 + ' AND sc_finalporcmasa < (NVL(sc_porcvariabletarifario, 0) * 0.75)';
  end;

  if checkF931NoIngresado.Checked then
  begin
    sSql1 := sSql1 + ' AND NOT EXISTS (SELECT 1' +
                                       ' FROM ado_documentacion' +
                                      ' WHERE do_idformulario = cc_idformulario' +
                                        ' AND do_iddocumentoafi = 41' +   // Formulario 931..
                                        ' AND do_presente = ''S'')';
    sSql2 := sSql2 + ' AND NOT EXISTS (SELECT 1' +
                                       ' FROM ado_documentacion' +
                                      ' WHERE do_idformulario = cc_idformulario' +
                                        ' AND do_iddocumentoafi = 41' +   // Formulario 931..
                                        ' AND do_presente = ''S'')';
  end;

  if checkF931NoControlado.Checked then
  begin
    sSql1 := sSql1 + ' AND EXISTS (SELECT 1' +
                                   ' FROM ado_documentacion' +
                                  ' WHERE do_idformulario = cc_idformulario' +
                                    ' AND do_iddocumentoafi = 41' +   // Formulario 931..
                                    ' AND do_presente = ''S'')';
    sSql2 := sSql2 + ' AND EXISTS (SELECT 1' +
                                   ' FROM ado_documentacion' +
                                  ' WHERE do_idformulario = cc_idformulario' +
                                    ' AND do_iddocumentoafi = 41' +   // Formulario 931..
                                    ' AND do_presente = ''S'')';
    sSql1 := sSql1 + ' AND (cc_sumafija IS NULL OR cc_porcmasa IS NULL)';
    sSql2 := sSql2 + ' AND (cc_sumafija IS NULL OR cc_porcmasa IS NULL)';
  end;

  if not fraEntidad.IsEmpty then
  begin
    sSql1 := sSql1 + ' AND sc_identidad = ' + SqlValue(fraEntidad.Value);
    sSql2 := sSql2 + ' AND sc_identidad = ' + SqlValue(fraEntidad.Value);
  end;

  if not fraVendedor.IsEmpty then
  begin
    sSql1 := sSql1 + ' AND sc_idvendedor = ' + SqlValue(fraVendedor.Value);
    sSql2 := sSql2 + ' AND sc_idvendedor = ' + SqlValue(fraVendedor.Value);
  end;

  if not fraEjecutivo.IsEmpty then
  begin
    sSql1 := sSql1 + ' AND ec_id = ' + SqlValue(fraEjecutivo.Value);
    sSql2 := sSql2 + ' AND ec_id = ' + SqlValue(fraEjecutivo.Value);
  end;

  if checkOk.Checked or checkNo.Checked or checkSinDif.Checked then
  begin
    sTmp := '''XXX''';
    if checkOk.Checked then
      sTmp := sTmp + ', ''OK''';
    if checkNo.Checked then
      sTmp := sTmp + ', ''NO''';
    if checkSinDif.Checked then
      sTmp := sTmp + ', ''SI''';

    sSql1 := sSql1 + ' AND cc_cerrado IN (' + sTmp + ')';
    sSql2 := sSql2 + ' AND cc_cerrado IN (' + sTmp + ')';
  end;

  sdqConsulta.Sql.Text := sSql1 + ' UNION ALL ' + sSql2;
  SortDialog.OrderBy;

  inherited;
end;

procedure TfrmControlCampanaF931.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'cc_fechabaja';
  ShowActived := False;

  fraEntidad.OnChange := CambiaEntidad;

  ClearControls;
end;

procedure TfrmControlCampanaF931.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cc_fechabaja').IsNull, Grid, 'Este registro ya fue dado de baja.');

  inherited;
end;

procedure TfrmControlCampanaF931.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  ClearControls;
end;

procedure TfrmControlCampanaF931.edCuitExit(Sender: TObject);
var
  sSql: String;
begin
  if IsCuit(edCuit.Text) then
  begin
    sSql :=
      'SELECT sc_form931, sc_nrosolicitud' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_cuit = :cuit' +
   ' ORDER BY sc_id DESC';
    with GetQueryEx(sSql, [edCuit.Text]) do
    try
      if not Eof then
        Verificar((FieldByName('sc_form931').AsString <> 'N') and (FieldByName('sc_form931').AsString <> 'S'), nil, Format('Este formulario no hace falta que sea cargado por no haberse usado en la cotización %d.', [FieldByName('sc_nrosolicitud').AsInteger]));
    finally
      Free;
    end;


    sSql :=
      'SELECT sa_nombre' +
       ' FROM asa_solicitudafiliacion' +
      ' WHERE sa_cuit = :cuit' +
   ' ORDER BY sa_id DESC';
    edRazonSocial.Text := ValorSqlEx(sSql, [edCuit.Text]);

    if edRazonSocial.Text = '' then
    begin
      sSql :=
        'SELECT sc_razonsocial' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_cuit = :cuit' +
     ' ORDER BY sc_id DESC';
      edRazonSocial.Text := ValorSqlEx(sSql, [edCuit.Text]);
    end;

    sSql :=
      'SELECT en_codbanco || '' - '' || en_nombre' +
       ' FROM asc_solicitudcotizacion, xen_entidad' +
      ' WHERE sc_identidad = en_id' +
        ' AND sc_cuit = :cuit' +
   ' ORDER BY sc_id DESC';
    edEntidad.Text := ValorSqlEx(sSql, [edCuit.Text]);

    sSql :=
      'SELECT cc_cantidadcapitas, cc_masasalarial, cc_porcmasa, cc_sumafija' +
       ' FROM afi.acc_ctrl_campania931' +
      ' WHERE cc_cuit = :cuit';
    with GetQueryEx(sSql, [edCuit.Text]) do
    try
      if IsEmpty then   // Alta..
      begin
        ModoABM := maAlta;
        ModoABMToSqlType;
        fpABM.Caption := CAPTION_ALTA;
      end
      else    // Modificación..
      begin
        edSumaFijaF931.Value    := FieldByName('cc_sumafija').AsFloat;
        edVariableF931.Value    := FieldByName('cc_porcmasa').AsFloat;
        edCantidadCapitas.Value := FieldByName('cc_cantidadcapitas').AsInteger;
        edMasaSalarial.Value    := FieldByName('cc_masasalarial').AsFloat;

        // Si ya está cargado el registro para esta C.U.I.T., traigo el registro en la grilla..
        ClearControls;
        edCuitBusqueda.Text := edCuit.Text;
        RefreshData;
        sdqConsulta.Locate('cc_cuit', edCuit.Text, [loCaseInsensitive]);
        ModoABM := maModificacion;
        ModoABMToSqlType;
        fpABM.Caption := CAPTION_MODIFIC;
      end;
    finally
      Free;
    end;
  end
  else
    InfoHint(edCuit, 'La C.U.I.T. ingresada es inválida.', False, 'Información', blnInfo, 3, False);
end;

procedure TfrmControlCampanaF931.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('cc_fechabaja').IsNull, Grid, 'Este registro fue dado de baja.');

  inherited;
end;

procedure TfrmControlCampanaF931.fpAbmBeforeShow(Sender: TObject);
begin
  fpAbm.Tag := 0;

  if ModoABM = maAlta then
  begin
    edCuit.Clear;
    edEntidad.Clear;
    edRazonSocial.Clear;
    edSumaFijaF931.Clear;
    edVariableF931.Clear;
    edCantidadCapitas.Clear;
    edMasaSalarial.Clear;
    checkF931Completo.Checked := False;
  end;
end;

procedure TfrmControlCampanaF931.fpAbmClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if fpAbm.Tag = 1 then
  begin
    Action := caNone;
    fpAbmBeforeShow(nil);
    edCuit.SetFocus;
  end;
end;

procedure TfrmControlCampanaF931.btnCancelarClick(Sender: TObject);
begin
  inherited;

  fpAbm.Tag := 0;
end;

procedure TfrmControlCampanaF931.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    TFloatField(FieldByName('cc_dif_porcmasa')).DisplayFormat          := ',0.0000 %;-,0.0000 %';
    TFloatField(FieldByName('porcvariablecotizado')).DisplayFormat     := ',0.0000 %;-,0.0000 %';
    TFloatField(FieldByName('sc_porcvariabletarifario')).DisplayFormat := ',0.0000 %;-,0.0000 %';

    TFloatField(FieldByName('cc_dif_sumafija')).DisplayFormat      := '$ ,0.00;$ -,0.00';
    TFloatField(FieldByName('cc_masasalarial')).DisplayFormat      := '$ ,0.00;$ -,0.00';
    TFloatField(FieldByName('sc_sumafijatarifario')).DisplayFormat := '$ ,0.00;$ -,0.00';
    TFloatField(FieldByName('sumafija')).DisplayFormat             := '$ ,0.00;$ -,0.00';
    TFloatField(FieldByName('sumafijacotizada')).DisplayFormat     := '$ ,0.00;$ -,0.00';
    TFloatField(FieldByName('variable')).DisplayFormat             := '$ ,0.00;$ -,0.00';
  end;
end;

procedure TfrmControlCampanaF931.btnAceptarClick(Sender: TObject);
begin
  inherited;

  fpAbm.Tag := 1;
end;

procedure TfrmControlCampanaF931.fraEntidadExit(Sender: TObject);
begin
  fraEntidad.FrameExit(Sender);
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmControlCampanaF931.btnCalcularClick(Sender: TObject);
  function IsMesConSAC(const aPeriodo: String): Boolean;
  begin
    Result := (Copy(aPeriodo, 5, 2) = '06') or (Copy(aPeriodo, 5, 2) = '12');
  end;

var
  sSql: String;
begin
  Verificar((edCantidadCapitas.Value < 1), edCantidadCapitas, 'Antes de calcular debe ingresar la Cantidad de Cápitas.');
  Verificar((edMasaSalarial.Value = 0), edMasaSalarial, 'Antes de calcular debe ingresar la Masa Salarial.');

  sSql :=
    'SELECT   sc_periodo' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_cuit = :cuit' +
   ' ORDER BY sc_id DESC';
  with GetQueryEx(sSql, [edCuit.Text]) do
  try
    if Eof then
      InfoHint(btnCalcular, 'No hay una solicitud para esa C.U.I.T.')
    else
    begin
      edSumaFijaAlicuotaF931.Value := edSumaFijaF931.Value / edCantidadCapitas.Value;
      edVariableAlicuotaF931.Value := IIF(IsMesConSAC(FieldByName('sc_periodo').AsString), (edVariableF931.Value / 1.5), edVariableF931.Value) / edMasaSalarial.Value * 100;

      edSumaFijaDiferencia.Value   := edSumaFijaAlicuotaF931.Value - edSumaFijaCompetencia.Value;
      edVariableDiferencia.Value   := edVariableAlicuotaF931.Value - edVariableCompetencia.Value;

      rgDiferencia.Visible := ((edSumaFijaDiferencia.Value <> 0) or (edVariableDiferencia.Value <> 0));
      if not rgDiferencia.Visible then
        rgDiferencia.ItemIndex := -1;
    end;
  finally
    Free;
  end;
end;

function TfrmControlCampanaF931.GetCerradoValue: String;
begin
  Result := '';

  if rgDiferencia.ItemIndex = 0 then
    Result := 'OK'
  else if rgDiferencia.ItemIndex = 1 then
    Result := 'NO'
  else if (edSumaFijaDiferencia.Value = 0) and (edVariableDiferencia.Value = 0) then
    Result := 'SI';
end;

procedure TfrmControlCampanaF931.CambiaEntidad(Sender: TObject);
begin
  if fraEntidad.Value > 0 then
    fraEjecutivo.Propiedades.ExtraCondition :=
      ' AND EXISTS(SELECT 1' +
                   ' FROM xen_entidad' +
                  ' WHERE ec_id = ' + SqlValue(fraEntidad.Ejecutivo) + ') '
  else
    fraEjecutivo.Propiedades.ExtraCondition := '';
  fraEjecutivo.Clear;
end;

end.
