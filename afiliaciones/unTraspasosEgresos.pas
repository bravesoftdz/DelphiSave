unit unTraspasosEgresos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unFraCodigoDescripcion, ToolEdit,
  DateComboBox, CheckCombo, DBCheckCombo, Mask, unfraVendedores, unfraCtbTablas, unFraEntidades,
  unArtDbFrame, unFraEmpresa, unFraEmpresaAfi, unFraActividad, IntEdit, Menus, ExComboBox, PatternEdit, ComboEditor,
  unFraStaticCodigoDescripcion, unfraStaticActividad, unFraStaticCTB_TABLAS, unArtDBAwareFrame, FormPanel,
  unFraCodDesc, RxToolEdit, RxPlacemnt;

type
   TfrmTraspasosEgresos = class(TfrmCustomConsulta)
    lbEntidad: TLabel;
    fraEntidad: TfraEntidades;
    lbVendedor: TLabel;
    lbARTFutura: TLabel;
    cmbCO_ARTFUTURA: TDBCheckCombo;
    gbEventos: TGroupBox;
    lbFEventoDesde: TLabel;
    lbFEventoHasta: TLabel;
    edTE_FECHAIMPRESITUACION_DESDE: TDateComboBox;
    edTE_FECHAIMPRESITUACION_HASTA: TDateComboBox;
    lbEventos: TLabel;
    sdqART: TSDQuery;
    dsART: TDataSource;
    cbUltimoEvento: TCheckBox;
    fraVendedor: TfraVendedores;
    Label1: TLabel;
    edCantEmpleadosHasta: TIntEdit;
    Label14: TLabel;
    edCantEmpleadosDesde: TIntEdit;
    Label13: TLabel;
    Label2: TLabel;
    fraEmpresaafi: TfraEmpresaAfi;
    cmbPV_CODIGO: TDBCheckCombo;
    Label3: TLabel;
    sdqProvincias: TSDQuery;
    dsProvincias: TDataSource;
    mnuImprimir: TPopupMenu;
    mnuGrilla: TMenuItem;
    mnuCarta: TMenuItem;
    fraAC_ID: TfraStaticActividad;
    fraEventos: TfraStaticCTB_TABLAS;
    tbNuevoTraspaso: TToolButton;
    tbSeparador: TToolButton;
    fpNuevoTraspaso: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Label4: TLabel;
    Label5: TLabel;
    fraArtFutura: TfraStaticCodigoDescripcion;
    fraEmpresaFutura: TfraEmpresa;
    chkEventosActivos: TCheckBox;
    fpOpcionesImpresion: TFormPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    edCantCopias: TIntEdit;
    btnParar: TButton;
    cmbImpresoras: TComboBox;
    BarProgreso: TProgressBar;
    GroupBox1: TGroupBox;
    chkPendientesImpresion: TRadioButton;
    rbVerTodas: TRadioButton;
    rbImpresos: TRadioButton;
    GroupBox2: TGroupBox;
    chkCalcEmpleados: TCheckBox;
    tbCargaMasivaTraspaso: TToolButton;
    tbSeparador2: TToolButton;
    tbCantRegistros: TToolButton;
    Label6: TLabel;
    Label9: TLabel;
    edFechaVigenciaDesde: TDateComboBox;
    edFechaVigenciaHasta: TDateComboBox;
    GroupBox3: TGroupBox;
    chkPresentoRgrl: TCheckBox;
    fraEjecutivoEntidad: TfraStaticCodigoDescripcion;
    Label10: TLabel;
    GroupBox4: TGroupBox;
    chkConsultaSimplificada2: TCheckBox;
    fraOrganizador: TfraCodDesc;
    Label11: TLabel;
    edTE_FECHAALTA_Hasta: TDateComboBox;
    Label12: TLabel;
    edTE_FECHAALTA_Desde: TDateComboBox;
    Label15: TLabel;
    chkContratosActivos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure onEntidadChange( Sender : TObject );
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure mnuCartaClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoTraspasoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure tbCargaMasivaTraspasoClick(Sender: TObject);
    procedure tbCantRegistrosClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    FImprimeAutomatico: Boolean;
    FListaArt: TStringList;
    FPararImpresion: Boolean;
    FReImpresion: Boolean;

    procedure AltaTraspasoEgreso;
    procedure CambiaEmpresa(Sender: TObject);
    procedure CargarImpresoras;
    procedure DoGenerarCarta;
    procedure MostrarOpcionesImpresion;
    function LoadSQLSimplificada : String;
    function LoadSQLNormal: String;
  public
  end;

var
  frmTraspasosEgresos: TfrmTraspasosEgresos;

implementation

uses
  unCustomDataModule, unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, StrFuncs, CustomDlgs, General, unCargaSolicitud,
  unModificaTraspasoIngresos, CUIT, unModificaTraspasoEgresos, unAfiGeneracionCartas, unART, unModificaContrato,
  Printers, unAfiliaciones, unEventosTraspasoEgreso, unAfiCartasDoc;

{$R *.DFM}

procedure TfrmTraspasosEgresos.FormCreate(Sender: TObject);
begin
  inherited;

  fraEntidad.CaseSensitive := False;
  fraEntidad.ExtraCondition := ' AND en_entramite = ''N'' ';
  fraEntidad.OnChange := onEntidadChange;

  fraVendedor.CaseSensitive := False;

  fraEventos.Clave := 'EVTEG';

  fraEmpresaAfi.ShowBajas := True;

  with fraEjecutivoEntidad do
  begin
    TableName   := 'aec_ejecutivocuenta';
    FieldID     := 'ec_id';
    FieldCodigo := 'ec_id';
    FieldDesc   := 'ec_nombre';
    FieldBaja   := 'ec_fechabaja';
    ShowBajas   := False;
  end;

  OpenQuery(sdqART);
  OpenQuery(sdqProvincias);

  //Ordenamiento de botones
  tbSeparador.Left           := 131;
  tbCantRegistros.Left       := 131;
  tbCargaMasivaTraspaso.Left := 131;
  ToolButton4.Left           := 131;
  tbSeparador.Left           := 31;
  tbNuevoTraspaso.Left       := 31;

  FListaArt := TStringList.Create;

  fraArtFutura.TableName   := 'aar_art';
  fraArtFutura.FieldID     := 'ar_id';
  fraArtFutura.FieldCodigo := 'ar_id';
  fraArtFutura.FieldDesc   := 'ar_nombre';
  fraArtFutura.FieldBaja   := 'ar_fechabaja';

  fraEmpresaFutura.OnChange := CambiaEmpresa;
  frmPrincipal.mnuTraspasoEgreso.Enabled := False;
  fraEmpresaFutura.ShowBajas := True;
end;

procedure TfrmTraspasosEgresos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqART.Close;
  sdqProvincias.Close;
  Action := caFree;
  FListaArt.Free;
  frmTraspasosEgresos := nil;
  frmPrincipal.mnuTraspasoEgreso.Enabled := True;

  inherited;
end;

procedure TfrmTraspasosEgresos.onEntidadChange(Sender: TObject);
begin
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmTraspasosEgresos.tbRefrescarClick(Sender: TObject);
var
  sPeriodoActual: String;
  sSql: String;
  sUltPeriodo: String;
begin
  sUltPeriodo    := ValorSql('SELECT cobranza.get_ultperiododevengado(''D'') FROM DUAL');
  sPeriodoActual := FormatDateTime('YYYYMM', DBDate);


  sSql := IIF(chkConsultaSimplificada2.Checked, LoadSQLSimplificada, LoadSQLNormal);

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;

  if sdqConsulta.IsEmpty then
    MsgBox('No existen datos para esta selección.', MB_ICONEXCLAMATION, 'Atención');
end;

procedure TfrmTraspasosEgresos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaAfi.Clear;
  cmbCO_ARTFUTURA.Clear;
  edCantEmpleadosDesde.Clear;
  edCantEmpleadosHasta.Clear;
  fraEntidad.Clear;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraVendedor.Clear;
  fraAC_ID.Clear;
  cmbPV_CODIGO.Clear;
  edFechaVigenciaDesde.Clear;
  edFechaVigenciaHasta.Clear;
  edTE_FECHAIMPRESITUACION_DESDE.Clear;
  edTE_FECHAIMPRESITUACION_HASTA.Clear;
  cbUltimoEvento.Checked := True;
  fraEventos.Clear;
  rbVerTodas.Checked := True;
  chkPresentoRgrl.Checked := False;
  chkCalcEmpleados.Checked := True;
  fraOrganizador.Clear;
  chkContratosActivos.Checked := False;
end;

procedure TfrmTraspasosEgresos.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    frmModificaTraspasoEgresos.Free;
    frmModificaTraspasoEgresos := TfrmModificaTraspasoEgresos.Create(Self);
    frmModificaTraspasoEgresos.DoCargaDatos(sdqConsulta.FieldByName('co_contrato').AsInteger,
                                            sdqConsulta.FieldByName('te_idartfutura').AsInteger);
  end;
end;

procedure TfrmTraspasosEgresos.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmTraspasosEgresos.mnuGrillaClick(Sender: TObject);
begin
  inherited tbImprimirClick (nil);
end;

procedure TfrmTraspasosEgresos.mnuCartaClick(Sender: TObject);
var
  aResults: TStringList;
  iCantRegistros: Integer;
  iLoop: Integer;
  sCodPrevio: String;
  sSql: String;
begin
  iCantRegistros := Grid.SelectedRows.Count;
  if iCantRegistros = 0 then
    raise Exception.Create('Debe elegir al menos un registro.');

  FReImpresion := False;

  //Chequeo si se debe re-imprimir o generar un nuevo registro
  for iLoop := 0 to iCantRegistros - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    if iLoop = 0 then
      FReImpresion := (sdqConsulta.FieldByName('te_idcarta').AsString <> '')
    else
      if FReImpresion <> (sdqConsulta.FieldByName('te_idcarta').AsString <> '') then
        raise Exception.Create('No se pueden elegir registros para reimprimir junto con aquellos que no tienen carta.');
  end;

  if FReImpresion then
  begin
    FPararImpresion := False;
    MostrarOpcionesImpresion;
  end
  else
  begin
    //Chequeo que todas las cartas correspondan al mismo codigo
    sCodPrevio := '';
    for iLoop := 0 to iCantRegistros - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
      if sCodPrevio = '' then
        sCodPrevio := sdqConsulta.FieldByName('tc_id').AsString
      else if sCodPrevio <> sdqConsulta.FieldByName('tc_id').AsString then
        raise Exception.Create('Las cartas que se generan deben poseer el mismo evento.');
    end;

    //Se fija si este evento tiene asociadas cartas documento o no
    sSql :=
      'SELECT tc_id, tc_rpt' +
       ' FROM ctc_textocarta' +
      ' WHERE tc_id = ' + SqlValue(sCodPrevio);
    aResults := ValoresColSql(sSql);
    try
      if (aResults[0] = '') then
      begin
        MessageDlg('Este evento no tiene asociado un texto para la carta.', mtError, [mbOK], 0);
        Abort;
      end;

      //Imprime automatico si tiene TC_RPT <> NULL
      FImprimeAutomatico := not (aResults[1] = '');
    finally
      aResults.Free;
    end;
    
    //Si tiene que imprimir automaticamente genera el vector con las ARTs
    if FImprimeAutomatico then
    begin
      FListaArt.Clear;
      for iLoop := 0 to iCantRegistros - 1 do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
        // Se agrega la info a la matriz con IDs y ARTs
        FListaArt.Add(sdqConsulta.FieldByName('te_idartfutura').AsString + '=' + sdqConsulta.FieldByName('te_id').AsString);
      end;
      FListaArt.Sort;
    end;

    //Muestra el cuadro de opciones de impresion
    MostrarOpcionesImpresion;
  end;
end;

procedure TfrmTraspasosEgresos.tbNuevoClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    frmModificacionContrato.Free;
    frmModificacionContrato := TfrmModificacionContrato.Create(frmPrincipal);
    frmModificacionContrato.DoCargarDatos(ART_EMPTY_ID, sdqConsulta.FieldByName('co_contrato').AsInteger, fsConsultar);
  end;
end;

procedure TfrmTraspasosEgresos.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  if fraEmpresaFutura.IsEmpty then
    raise Exception.Create('Debe elegir la empresa que ha pedido el traspaso.');
  if fraArtFutura.IsEmpty then
    raise Exception.Create('Debe elegir la ART que ha pedido el traspaso.');
    
  sSql :=
    'SELECT 1' +
     ' FROM ate_traspasoegreso' +
    ' WHERE te_contrato = :contrato' +
      ' AND te_fechabaja IS NULL';
  if ExisteSqlEx(sSql, [fraEmpresaFutura.Contrato]) then
    raise Exception.Create('La empresa ya está en proceso de Traspaso Egreso.');

  //Graba los datos
  AltaTraspasoEgreso;
end;

procedure TfrmTraspasosEgresos.tbNuevoTraspasoClick(Sender: TObject);
begin
  fraEmpresaFutura.Clear;
  fraArtFutura.Clear;
  fpNuevoTraspaso.ShowModal;
end;

procedure TfrmTraspasosEgresos.btnCancelarClick(Sender: TObject);
begin
  fpNuevoTraspaso.ModalResult := mrCancel;
end;

procedure TfrmTraspasosEgresos.AltaTraspasoEgreso;
var
  aIdTraspaso: TTableId;
  sSql: String;
begin
  // En el AGREGAR el FID contiene el TE_CONTRATO
  with TSql.Create('ate_traspasoegreso') do
  try
    aIdTraspaso := ValorSqlInteger('SELECT seq_ate_id.NEXTVAL FROM DUAL');

    SqlType := stInsert;
    PrimaryKey.Add('te_id',       aIdTraspaso);
    Fields.Add('te_contrato',     fraEmpresaFutura.Contrato);
    Fields.Add('te_idartfutura',  fraArtFutura.Value);
    Fields.Add('te_codigo',       '001');
    Fields.Add('te_fecha',        'ACTUALDATE', False);
    Fields.Add('te_deuda',        0, dtNumber);
    Fields.Add('te_deudanominal', 0, dtNumber);
    Fields.Add('te_intereses',    0, dtNumber);
    Fields.Add('te_consolidado',  0, dtNumber);
    Fields.Add('te_usualta',      frmPrincipal.DBLogin.UserId);
    Fields.Add('te_fechaalta',    SQL_ACTUALDATE, false);

    try
      BeginTrans;
      EjecutarSQLST(Sql);

      sSql :=
        'BEGIN' +
         ' IF art.cobranza.check_cobertura_periodocobranz(:contrato, emi.utiles.get_maximoperiododev) = 1 THEN' +
           ' emi.emision.do_devengadocontrato(:contrato, emi.utiles.get_maximoperiododev, NULL, TRUE);' +
         ' END IF;' +
       ' END;';
      EjecutarSqlSTEx(sSql, [fraEmpresaFutura.Contrato]);

      CommitTrans;
      if MsgAsk('La operación se realizó con éxito.' + #13#10 + '¿ Desea agregar una nueva empresa ?') then
      begin
        fraEmpresaFutura.Clear;
        fraEmpresaFutura.mskCuit.SetFocus;
      end
      else
        fpNuevoTraspaso.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmTraspasosEgresos.CambiaEmpresa(Sender: TObject);
begin
  fraArtFutura.edCodigo.SetFocus;
end;

procedure TfrmTraspasosEgresos.MostrarOpcionesImpresion;
begin
  CargarImpresoras;
  BarProgreso.Position := 0;
  btnParar.Enabled     := False;
  fpOpcionesImpresion.ShowModal;
end;

procedure TfrmTraspasosEgresos.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign (Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmTraspasosEgresos.DoGenerarCarta;
var
  bCargarValores: Boolean;
  iCantRegistros: Integer;
  iLoop: Integer;
  sARTPrevia: String;
  sCodPrevio: String;
  sInSql: String;

  function GetListaText(aItemIndex: Integer): String;
  var
    iPos: Integer;
  begin
    Result := FListaArt[aItemIndex];
    iPos   := AnsiPos('=', Result);
    if iPos > 0 Then
      Result := Copy(Result, iPos + 1, MaxInt);
  end;
begin
  bCargarValores := True;

  if FImprimeAutomatico then
  begin
    { Se supone que AList.Count nunca va a ser cero }
    sARTPrevia := '';
    sInSql     := GetListaText(0) + ',';
    sCodPrevio := sdqConsulta.FieldByName('tc_id').AsString;
    with TFrmAfiGeneracionCartas.Create(Self) do
    try
      for iLoop := 0 to FListaArt.Count - 1 do
      begin
        if FPararImpresion then
          raise Exception.Create('Ha decidido cancelar la impresión.');

        if (FListaArt.Names[iLoop] <> sARTPrevia) and (iLoop <> 0) then
        begin
          SetLength(sInSql, Length(sInSql) - 1);
          ExecuteEgreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, rbImprimir.Checked, edCantCopias.Value);
          sInSql := '';
        end;

        sARTPrevia := FListaArt.Names[iLoop];
        if iLoop <> 0 then
          sInSql := sInSql + GetListaText(iLoop) + ',';

        BarProgreso.Position := Round((iloop + 1) / FListaArt.Count * 100);
        Application.ProcessMessages;
      end;

      //Toma el que quedó libre
      SetLength(sInSql, Length(sInSql) - 1);
      ExecuteEgreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, rbImprimir.Checked, edCantCopias.Value);

      BarProgreso.Position := 100;
      Application.ProcessMessages;
    finally
      Free;
    end;
  end
  else
  begin
    with TFrmAfiGeneracionCartas.Create(Self) do
    try
      iCantRegistros := Grid.SelectedRows.Count;
      for iLoop := 0 to iCantRegistros - 1 do
      begin
        if FPararImpresion then
          raise Exception.Create('Ha decidido cancelar la impresión.');

        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));

        sInSql     := sdqConsulta.FieldByName('te_id').AsString;
        sCodPrevio := sdqConsulta.FieldByName('tc_id').AsString;

        ExecuteEgreso(sInSql, sCodPrevio, fsAgregar, bCargarValores, rbImprimir.Checked, edCantCopias.Value);

        BarProgreso.Position := Round((iLoop + 1) / iCantRegistros * 100);
        Application.ProcessMessages;
      end;

      BarProgreso.Position := 100;
      Application.ProcessMessages;
    finally
      Free;
    end;
  end;
end;

procedure TfrmTraspasosEgresos.btnPararClick(Sender: TObject);
begin
  FPararImpresion  := True;
  btnParar.Enabled := False;
end;

procedure TfrmTraspasosEgresos.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmTraspasosEgresos.btnAceptarImpresionClick(Sender: TObject);
var
  aIdCarta: TTableId;
  aListaIds: TStringList;
  iCantRegistros: Integer;
  iLoop: Integer;
  iOldImpresora: Integer;
begin
  iOldImpresora := Printer.PrinterIndex;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;
  btnParar.Enabled := True;
  try
    if FReImpresion then
    begin
      aListaIds := TStringList.Create;
      try
        iCantRegistros       := Grid.SelectedRows.Count;
        aListaIds.Duplicates := dupIgnore;
        aListaIds.Sorted     := True;

        for iLoop := 0 to iCantRegistros - 1 do
        begin
          sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          aListaIds.Add(sdqConsulta.FieldByName('te_idcarta').AsString);
        end;

        for iLoop := 0 to aListaIds.Count - 1 do
        begin
          if FPararImpresion then
            raise Exception.Create('Ha decidido cancelar la impresión');

          aIdCarta := StrToInt(aListaIds[iLoop]);
          with TAfiCartasDoc.Create do
          try
            MostrarCartaDocumento(aIdCarta, tmBeginEnd, rbImprimir.Checked, edCantCopias.Value, False, True, False,
                                  False, True, False, False, True);
          finally
            Free;
          end;

          BarProgreso.Position := Round((iLoop + 1) / iCantRegistros * 100);
          Application.ProcessMessages;
        end;
      finally
        aListaIDs.Free;
      end;
    end
    else
      DoGenerarCarta;

    Grid.UnSelectAll;
    sdqConsulta.Refresh;
  finally
    Printer.PrinterIndex := iOldImpresora;
    btnParar.Enabled := False;
  end;
  
  fpOpcionesImpresion.ModalResult := mrOk;
end;

procedure TfrmTraspasosEgresos.tbCargaMasivaTraspasoClick(Sender: TObject);
begin
  with TfrmEventosTraspasoEgreso.Create(Self) do
  try
    DoCargarMasiva;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmTraspasosEgresos.tbCantRegistrosClick(Sender: TObject);
begin
  if sdqConsulta.Active then
    MessageDlg(Format('La consulta devolvió %d registros.', [sdqConsulta.RecordCount]), mtInformation, [mbOK], 0);
end;

function TfrmTraspasosEgresos.LoadSQLSimplificada: String;
var
  sSql : String;
  sFiltro : String;
begin
  //Contrato, CUIT, Nombre, ART Futura, Suma Fija, Porc. Masa, Capitas, Masa Salarial, Cod. Evento, Evento,
  //Deuda Nominal, Intereses, Consolidada, Fecha Evento, Clausula RGRL, Estado
  sSql :=
    'SELECT em_cuit, em_nombre, co_idartfutura, co_contrato, atc.tc_porcmasa, null co_fechaafiliacion, null ciiu,' +
          ' ar_nombre art_futura, null co_nivel, atc.tc_sumafija, te_fecha, null ejecutivoentidad,null totalpedidostraspasoegreso, ' +
          ' te_id, te_idcarta, te_codigo, te_idartfutura, ev.tb_descripcion evento, te_deuda deuda_pedido, null entidadmantenedora, ' +
          ' te_deudanominal deuda_nominal, te_intereses intereses, te_consolidado consolidado, ns_fechaenvio, null codigocanal,' +
          ' ns_fechaimpresion, ns_fecharespuesta, ns_descripcionrespuesta, null canal, null ec_nombre, null gc_nombre, null as_nombre,' +
          {' NVL(cca.ca_usureimpresion, cca.ca_usuimpresion) uimpresion,' + }
          {' NVL(cca.ca_fechareimpresion, cca.ca_fechaimpresion) fimpresion,' +}
          ' null uimpresion,' +
          ' null fimpresion,' +
          ' null pv_descripcion,' +
          ' NVL(ctc.tc_id, 0) tc_id,null dc_calle, null dc_numero, null dc_piso, null dc_localidad, null dc_cpostal,null dc_telefonos,' +
          ' null co_vigenciadesde, null estado,' +
          ' null co_vigenciahasta,null te_rgrl, te_clausulargrl, null rgrlhoy,' +
          //' nomina.get_masasalarial(co_contrato, co_ultimanomina) masatotal, nomina.get_empleados(co_contrato, co_ultimanomina) totempleados, NULL ultnombreentidad, NULL ultnombrevendedor,' +
          ' null masatotal, NULL ultnombreentidad, NULL ultnombrevendedor,';
          if chkCalcEmpleados.Checked then
            sSql := sSql + ' nomina.get_empleados(co_contrato, co_ultimanomina) totempleados, '
          else
            sSql := sSql + ' null totempleados, ';

          sSql := sSql +
          ' NULL ultentidad, NULL ultvendedor, NULL el_nombre, NULL su_descripcion, estco.tb_descripcion estado_co,' +
          ' CASE' +
            ' WHEN EXISTS(SELECT 1' +
                          ' FROM tet_endosotarifa' +
                         ' WHERE et_fechabaja IS NULL' +
                           ' AND et_contrato = co_contrato) THEN ''P''' +
            ' ELSE NULL' +
          ' END tarifapendiente, null organizador' +
        ' FROM ctb_tablas ev, aar_art, atc_tarifariocontrato atc, aem_empresa, cca_carta cca,' +
          ' adc_domiciliocontrato, ctc_textocarta ctc, cpv_provincias, aco_contrato, ate_traspasoegreso ate,' +
          ' ans_notasrt, avc_vendedorcontrato, xev_entidadvendedor, xen_entidad, ctb_tablas estco' +
   ' WHERE te_contrato = co_contrato' +
     ' AND co_idempresa = em_id' +
     ' AND ar_id(+) = te_idartfutura' +
     ' AND ev.tb_clave = ''EVTEG''' +
     ' AND ev.tb_codigo = te_codigo' +
     ' AND ctc.tc_id(+) = ev.tb_especial1' +
     ' AND atc.tc_contrato = co_contrato' +
     ' AND te_idcarta = cca.ca_id(+)' +
     ' AND dc_tipo = ''L''' +
     ' AND dc_provincia = pv_codigo' +
     ' AND dc_contrato = co_contrato' +
     ' AND ev.tb_codigo <> ''0''' +
     ' AND te_idnotasrt = ns_id(+)' +
     ' AND art.comision.get_ultidentidadvendcontrato(co_contrato) = vc_id(+)' +
     ' AND vc_identidadvend = ev_id(+)' +
     ' AND ev_identidad = en_id(+)' +
     ' AND estco.tb_clave = ''AFEST''' +  //ACOES
     ' AND estco.tb_codigo = co_estado' +
     ' AND (   en_entramite = ''N''' +
          ' OR en_entramite IS NULL)';

  // FILTROS
  sFiltro := '';

  //  Contrato:
  if not fraEmpresaAfi.IsEmpty then
    sFiltro := sFiltro + ' AND co_contrato = ' + IntToStr(fraEmpresaAfi.edContrato.Value);

  //  ART Futura:
  if cmbCO_ARTFUTURA.Text <> '' then
    sFiltro := sFiltro + ' AND te_idartfutura ' + cmbCO_ARTFUTURA.InSql;

  if chkPresentoRgrl.Checked then
    sFiltro := sFiltro + ' AND art.hys.get_cumplimientorelev(te_contrato) = ''S''';

  //  Entidad
  if not fraEntidad.IsEmpty then
    sFiltro := sFiltro + ' AND en_id = ' + SqlValue(fraEntidad.Value);

  //  Vendedor
  //  Actividad
  {if not fraAC_ID.IsEmpty then
    sFiltro := sFiltro + ' AND ac_codigo = ' + IntToStr(fraAC_ID.Value);  }

  //  Provincia
  if cmbPV_CODIGO.Text <> '' then
    sFiltro := sFiltro + ' AND pv_codigo ' + cmbPV_CODIGO.InSql;

  sFiltro := sFiltro + IIF(edFechaVigenciaDesde.IsEmpty, '', ' AND co_vigenciadesde >= ' + SqlDate(edFechaVigenciaDesde.Date));
  sFiltro := sFiltro + IIF(edFechaVigenciaHasta.IsEmpty, '', ' AND co_vigenciahasta <= ' + SqlDate(edFechaVigenciaHasta.Date));

  //  Empleados
  if not edCantEmpleadosDesde.IsEmpty then
    sFiltro := sFiltro + ' AND nomina.get_empleados(co_contrato, cobranza.get_ultperiododevengado(''D'')) >= ' + IntToStr(edCantEmpleadosDesde.Value);

  if not edCantEmpleadosHasta.IsEmpty then
    sFiltro := sFiltro + ' AND nomina.get_empleados(co_contrato, cobranza.get_ultperiododevengado(''D'')) <= ' + IntToStr(edCantEmpleadosHasta.Value);

  //  Fecha Desde/Hasta
  if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
    sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);
  if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
    sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);
  // Fecha de Alta Desde/Hasta
  if not edTE_FECHAALTA_DESDE.IsEmpty then
    sFiltro := sFiltro + ' AND te_fechaalta >= ' + SqlDate(edTE_FECHAALTA_DESDE.Date);
  if not edTE_FECHAALTA_HASTA.IsEmpty then
    sFiltro := sFiltro + ' AND te_fechaalta <= ' + SqlDate(edTE_FECHAALTA_HASTA.Date);

  if rbImpresos.Checked then
    sFiltro := sFiltro + ' AND cca.ca_fechaimpresion IS NOT NULL ';
  if chkPendientesImpresion.Checked then
    sFiltro := sFiltro + ' AND cca.ca_fechaimpresion IS NULL ';

  if not fraEjecutivoEntidad.IsEmpty then
    sFiltro := sFiltro + ' AND (SELECT en_idejecutivo' +
                                ' FROM avc_vendedorcontrato, xev_entidadvendedor, xen_entidad ' +
                              ' WHERE vc_identidadvend = ev_id ' +
                               ' AND en_id = ev_identidad ' +
                               ' AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) = ' + IntToStr(fraEjecutivoEntidad.Value);
  //MANEJA LOS EVENTOS
  if chkEventosActivos.Checked then
    sFiltro := sFiltro + ' AND te_fechabaja IS NULL';
  if cbUltimoEvento.Checked then
  begin
    if fraEventos.IsEmpty then
    begin
      sFiltro := sFiltro +
        ' AND te_id IN (SELECT MAX(te_id)' +
                        ' FROM ate_traspasoegreso at' +
                       ' WHERE ate.te_contrato = at.te_contrato';

      if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);

      if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);

      sFiltro := sFiltro + ' GROUP BY te_idartfutura)';
    end
    else
    begin
      sFiltro := sFiltro +
        ' AND te_id IN (SELECT MAX(te_id)' +
                        ' FROM ate_traspasoegreso at' +
                       ' WHERE ate.te_contrato = at.te_contrato' +
                         ' AND te_codigo = ' + SqlValue(fraEventos.Value);

      if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);

      if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);

      sFiltro := sFiltro + ' GROUP BY te_idartfutura)';
    end;
  end
  else
  begin
    if not fraEventos.IsEmpty then
      sFiltro := sFiltro + ' AND te_codigo = ' + SqlValue(fraEventos.Value);

    if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
      sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);

    if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
      sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);
  end;

  if chkContratosActivos.Checked then
    sFiltro := sFiltro + ' AND co_estado = 1 ';

    Result := sSql + sFiltro;
end;

function TfrmTraspasosEgresos.LoadSQLNormal: String;
var
  sSql : String;
  sFiltro : String;
begin

  sdqConsulta.Options := [];
  sSql :=   'SELECT em_cuit, em_nombre, co_fechaafiliacion, co_idartfutura, co_contrato, ' +
            '       atc.tc_porcmasa, ar_nombre art_futura, ' +
            '       ac_codigo || ''-'' || ac_descripcion ciiu, co_nivel, atc.tc_sumafija, ' +
            '       te_fecha, te_id, te_idcarta, te_codigo, te_idartfutura, ' +
            '       ev.tb_descripcion evento, te_deuda deuda_pedido, ' +
            '       te_deudanominal deuda_nominal, te_intereses intereses, ' +
            '       te_consolidado consolidado, ns_fechaenvio, ns_fechaimpresion, ' +
            '       ns_fecharespuesta, ns_descripcionrespuesta, ' +
            '       NVL (cca.ca_usureimpresion, cca.ca_usuimpresion) uimpresion, ' +
            '       NVL (cca.ca_fechareimpresion, cca.ca_fechaimpresion) fimpresion, ' +
            '       pv_descripcion, NVL (ctc.tc_id, 0) tc_id, dc_calle, dc_numero, dc_piso, ' +
            '       dc_localidad, dc_cpostal, dc_telefonos, ' +
            '       (SELECT en_nombre ' +
            '          FROM xen_entidad, ' +
            '               xev_entidadvendedor, ' +
            '               avc_vendedorcontrato ' +
            '         WHERE ev_identidad = en_id ' +
            '           AND vc_identidadvend = ev_id ' +
            '           AND vc_contrato = co_contrato ' +
            '           AND vc_vigenciahasta IS NULL ' +
            '           AND vc_mantenimiento = ''S'' ' +
            '           AND ROWNUM = 1) entidadmantenedora, ' +
            '       aca.ca_codigo codigocanal, aca.ca_descripcion canal, ec_nombre, ' +
            '       gc_nombre, as_nombre, co_vigenciadesde, co_vigenciahasta, te_rgrl, ' +
            '       te_clausulargrl, ' +
            '       art.afiliacion.get_aplicaincumplimiento (te_contrato) rgrlhoy, ' +
            '       CASE ' +
            '          WHEN EXISTS ( ' +
            '                 SELECT 1 ' +
            '                   FROM tet_endosotarifa ' +
            '                  WHERE et_fechabaja IS NULL ' +
            '                    AND et_contrato = co_contrato) ' +
            '             THEN ''P'' ' +
            '          ELSE NULL ' +
            '       END tarifapendiente, ' +
            '       (SELECT ec_nombre ' +
            '          FROM avc_vendedorcontrato, ' +
            '               xev_entidadvendedor, ' +
            '               xen_entidad, ' +
            '               aec_ejecutivocuenta ' +
            '         WHERE vc_identidadvend = ev_id ' +
            '           AND ec_id = en_idejecutivo ' +
            '           AND en_id = ev_identidad ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                             ejecutivoentidad, ' +
            '       estco.tb_descripcion estado_co, ' +
            '       (SELECT COUNT (*) ' +
            '          FROM ate_traspasoegreso, ctb_tablas ' +
            '         WHERE te_codigo = tb_codigo ' +
            '           AND tb_clave = ''EVTEG'' ' +
            '           AND te_contrato = co_contrato ' +
            '           AND te_codigo = ''001'') totalpedidostraspasoegreso, ' +
            '       DECODE (co_motivobaja, ' +
            '               ''08'', ''Rescindido por falta de pago'', ' +
            '               DECODE (deuda.get_deuda (co_contrato), 0, ''Ok'', ''Deuda'') ' +
            '              ) estado, ' +
            '       nomina.get_masasalarial (co_contrato, co_ultimanomina) masatotal, ' +
            '       nomina.get_empleados (co_contrato, co_ultimanomina) totempleados, ' +
            '       (SELECT en_nombre ' +
            '          FROM avc_vendedorcontrato, ' +
            '               xev_entidadvendedor, ' +
            '               xen_entidad ' +
            '         WHERE vc_identidadvend = ev_id ' +
            '           AND en_id = ev_identidad ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                             ultnombreentidad, ' +
            '       (SELECT ve_nombre ' +
            '          FROM avc_vendedorcontrato, ' +
            '               xev_entidadvendedor, ' +
            '               xve_vendedor ' +
            '         WHERE vc_identidadvend = ev_id ' +
            '           AND ev_idvendedor = ve_id ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                            ultnombrevendedor, ' +
            '       (SELECT en_id ' +
            '          FROM avc_vendedorcontrato, ' +
            '               xev_entidadvendedor, ' +
            '               xen_entidad ' +
            '         WHERE vc_identidadvend = ev_id ' +
            '           AND en_id = ev_identidad ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                                   ultentidad, ' +
            '       (SELECT ve_vendedor ' +
            '          FROM avc_vendedorcontrato, ' +
            '               xev_entidadvendedor, ' +
            '               xve_vendedor ' +
            '         WHERE vc_identidadvend = ev_id ' +
            '           AND ev_idvendedor = ve_id ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                                  ultvendedor, ' +
            '       (SELECT el_nombre ' +
            '          FROM avc_vendedorcontrato, ' +
            '               xev_entidadvendedor, ' +
            '               xve_vendedor, ' +
            '               del_delegacion ' +
            '         WHERE vc_identidadvend = ev_id ' +
            '           AND ev_idvendedor = ve_id ' +
            '           AND ve_iddelegacion = el_id(+) ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                                    el_nombre, ' +
            '       (SELECT su_descripcion ' +
            '          FROM avc_vendedorcontrato, asu_sucursal ' +
            '         WHERE vc_idsucursal = su_id ' +
            '           AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) ' +
            '                                                               su_descripcion, ' +
            ' (SELECT     en_nombre' +
            '     FROM xgo_granorganizador, xen_entidad' +
            '    WHERE go_identorganizador = en_id' +
            '      AND go_fechabaja IS NULL' +
            '      AND go_fechaaprobado IS NOT NULL' +
            '      AND LEVEL = 1' +
            '    START WITH go_identidad = ev_identidad' +
            '    CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador' +
            '  FROM ctb_tablas ev, ' +
            '       aar_art, ' +
            '       atc_tarifariocontrato atc, ' +
            '       cac_actividad, ' +
            '       aem_empresa, ' +
            '       cca_carta cca, ' +
            '       adc_domiciliocontrato, ' +
            '       ctc_textocarta ctc, ' +
            '       cpv_provincias, ' +
            '       aco_contrato, ' +
            '       ate_traspasoegreso ate, ' +
            '       ans_notasrt, ' +
            '       avc_vendedorcontrato, ' +
            '       xev_entidadvendedor, ' +
            '       xen_entidad, ' +
            '       aca_canal aca, ' +
            '       aec_ejecutivocuenta, ' +
            '       agc_gestorcuenta, ' +
            '       ias_asesoremision, ' +
            '       ctb_tablas estco ' +
            ' WHERE te_contrato = co_contrato ' +
            '   AND co_idempresa = em_id ' +
            '   AND ar_id(+) = te_idartfutura ' +
            '   AND ev.tb_clave = ''EVTEG'' ' +
            '   AND ev.tb_codigo = te_codigo ' +
            '   AND ctc.tc_id(+) = ev.tb_especial1 ' +
            '   AND atc.tc_contrato = co_contrato ' +
            '   AND te_idcarta = cca.ca_id(+) ' +
            '   AND co_idactividad = ac_id ' +
            '   AND dc_tipo = ''L'' ' +
            '   AND dc_provincia = pv_codigo ' +
            '   AND dc_contrato = co_contrato ' +
            '   AND ev.tb_codigo <> ''0'' ' +
            '   AND te_idnotasrt = ns_id(+) ' +
            '   AND art.comision.get_ultidentidadvendcontrato (co_contrato) = vc_id(+) ' +
            '   AND vc_identidadvend = ev_id(+) ' +
            '   AND ev_identidad = en_id(+) ' +
            '   AND en_idcanal = aca.ca_id(+) ' +
            '   AND co_idejecutivo = ec_id(+) ' +
            '   AND co_idgestor = gc_id(+) ' +
            '   AND estco.tb_clave = ''AFEST'' ' +
            '   AND estco.tb_codigo = co_estado ' +
            '   AND co_idasesoremision = as_id(+) ' +
            '   AND (en_entramite = ''N'' OR en_entramite IS NULL) ';


  // FILTROS
  sFiltro := '';

  //  Contrato:
  if not fraEmpresaAfi.IsEmpty then
    sFiltro := sFiltro + ' AND co_contrato = ' + IntToStr(fraEmpresaAfi.edContrato.Value);

  //  ART Futura:
  if cmbCO_ARTFUTURA.Text <> '' then
    sFiltro := sFiltro + ' AND te_idartfutura ' + cmbCO_ARTFUTURA.InSql;

  if chkPresentoRgrl.Checked then
    sFiltro := sFiltro + ' AND art.hys.get_cumplimientorelev(te_contrato) = ''S''';

  //  Entidad
  if not fraEntidad.IsEmpty then
    sFiltro := sFiltro + ' AND en_id = ' + SqlValue(fraEntidad.Value);

  //  Vendedor
  //  Actividad
  if not fraAC_ID.IsEmpty then
    sFiltro := sFiltro + ' AND ac_codigo = ' + IntToStr(fraAC_ID.Value);

  //  Provincia
  if cmbPV_CODIGO.Text <> '' then
    sFiltro := sFiltro + ' AND pv_codigo ' + cmbPV_CODIGO.InSql;

  sFiltro := sFiltro + IIF(edFechaVigenciaDesde.IsEmpty, '', ' AND co_vigenciadesde >= ' + SqlDate(edFechaVigenciaDesde.Date));
  sFiltro := sFiltro + IIF(edFechaVigenciaHasta.IsEmpty, '', ' AND co_vigenciahasta <= ' + SqlDate(edFechaVigenciaHasta.Date));

  //  Empleados
  if not edCantEmpleadosDesde.IsEmpty then
    sFiltro := sFiltro + ' AND nomina.get_empleados(co_contrato, cobranza.get_ultperiododevengado(''D'')) >= ' + IntToStr(edCantEmpleadosDesde.Value);

  if not edCantEmpleadosHasta.IsEmpty then
    sFiltro := sFiltro + ' AND nomina.get_empleados(co_contrato, cobranza.get_ultperiododevengado(''D'')) <= ' + IntToStr(edCantEmpleadosHasta.Value);

  //  Fecha Desde/Hasta
  if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
    sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);
  if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
    sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);

  if rbImpresos.Checked then
    sFiltro := sFiltro + ' AND cca.ca_fechaimpresion IS NOT NULL ';
  if chkPendientesImpresion.Checked then
    sFiltro := sFiltro + ' AND cca.ca_fechaimpresion IS NULL ';

  if not fraEjecutivoEntidad.IsEmpty then
    sFiltro := sFiltro + ' AND (SELECT en_idejecutivo' +
                                ' FROM avc_vendedorcontrato, xev_entidadvendedor, xen_entidad ' +
                              ' WHERE vc_identidadvend = ev_id ' +
                               ' AND en_id = ev_identidad ' +
                               ' AND vc_id = art.comision.get_ultidentidadvendcontrato (co_contrato)) = ' + IntToStr(fraEjecutivoEntidad.Value);
  //MANEJA LOS EVENTOS
  if chkEventosActivos.Checked then
    sFiltro := sFiltro + ' AND te_fechabaja IS NULL';
  if cbUltimoEvento.Checked then
  begin
    if fraEventos.IsEmpty then
    begin
      sFiltro := sFiltro +
        ' AND te_id IN (SELECT MAX(te_id)' +
                        ' FROM ate_traspasoegreso at' +
                       ' WHERE ate.te_contrato = at.te_contrato';

      if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);

      if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);

      sFiltro := sFiltro + ' GROUP BY te_idartfutura)';
    end
    else
    begin
      sFiltro := sFiltro +
        ' AND te_id IN (SELECT MAX(te_id)' +
                        ' FROM ate_traspasoegreso at' +
                       ' WHERE ate.te_contrato = at.te_contrato' +
                         ' AND te_codigo = ' + SqlValue(fraEventos.Value);

      if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);

      if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
        sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);

      sFiltro := sFiltro + ' GROUP BY te_idartfutura)';
    end;
  end
  else
  begin
    if not fraEventos.IsEmpty then
      sFiltro := sFiltro + ' AND te_codigo = ' + SqlValue(fraEventos.Value);

    if not edTE_FECHAIMPRESITUACION_DESDE.IsEmpty then
      sFiltro := sFiltro + ' AND te_fecha >= ' + SqlDate(edTE_FECHAIMPRESITUACION_DESDE.Date);

    if not edTE_FECHAIMPRESITUACION_HASTA.IsEmpty then
      sFiltro := sFiltro + ' AND te_fecha <= ' + SqlDate(edTE_FECHAIMPRESITUACION_HASTA.Date);
  end;

  if not fraOrganizador.IsEmpty then
  sFiltro := sFiltro + ' AND ev_identidad IN ( SELECT go_identidad' +
                                              ' FROM xgo_granorganizador' +
                                             ' WHERE go_fechabaja IS NULL' +
                                               ' AND LEVEL = 1' +
                                               ' AND go_fechaaprobado IS NOT NULL' +
                                        ' START WITH go_identorganizador = ' + SqlValue(fraOrganizador.Value) +
                                  ' CONNECT BY NOCYCLE PRIOR go_identidad = go_identorganizador)';

  Result := sSql + sFiltro;
end;

procedure TfrmTraspasosEgresos.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if HighLight then
    AFont.Color := clWhite
  else
  begin
    if (sdqConsulta.FieldByName('tarifapendiente').AsString = 'P')  then
      AFont.Color := StringToColor('$0000A600');
  end;
end;

end.

